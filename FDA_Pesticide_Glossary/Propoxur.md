---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.928027, 0.2888754, -0.5216777, 1, 0, 0, 1,
-3.235659, 1.333592, 0.1828202, 1, 0.007843138, 0, 1,
-3.150114, 0.5852123, -2.604511, 1, 0.01176471, 0, 1,
-2.950166, 0.5252133, -1.312217, 1, 0.01960784, 0, 1,
-2.938245, -0.2701938, -2.770961, 1, 0.02352941, 0, 1,
-2.704261, 0.04147771, -1.624003, 1, 0.03137255, 0, 1,
-2.611202, 1.368934, -1.261997, 1, 0.03529412, 0, 1,
-2.59941, -1.120529, -2.417179, 1, 0.04313726, 0, 1,
-2.559676, 0.7153946, -1.597329, 1, 0.04705882, 0, 1,
-2.558767, -0.8421732, -0.6590431, 1, 0.05490196, 0, 1,
-2.501909, 0.5478047, -0.233551, 1, 0.05882353, 0, 1,
-2.420917, -0.1596048, -0.520409, 1, 0.06666667, 0, 1,
-2.396245, 0.02530982, -1.252294, 1, 0.07058824, 0, 1,
-2.381662, -1.039052, 0.02866844, 1, 0.07843138, 0, 1,
-2.366268, -0.09633355, -1.104611, 1, 0.08235294, 0, 1,
-2.222259, 0.2451417, -1.765866, 1, 0.09019608, 0, 1,
-2.197178, -0.5685489, -1.268601, 1, 0.09411765, 0, 1,
-2.107892, 0.7100326, -1.153227, 1, 0.1019608, 0, 1,
-2.082791, -0.3882123, -1.611383, 1, 0.1098039, 0, 1,
-2.052097, -0.9654183, -3.564353, 1, 0.1137255, 0, 1,
-2.039075, 1.063958, -0.2662593, 1, 0.1215686, 0, 1,
-2.034062, 0.6702201, -1.645084, 1, 0.1254902, 0, 1,
-2.028563, -0.9519074, -2.910362, 1, 0.1333333, 0, 1,
-1.994796, 0.2516385, -2.349495, 1, 0.1372549, 0, 1,
-1.974468, -0.2004219, -2.558405, 1, 0.145098, 0, 1,
-1.969232, -1.287765, -1.991621, 1, 0.1490196, 0, 1,
-1.968165, 1.781692, -1.516786, 1, 0.1568628, 0, 1,
-1.943796, -0.6471092, -0.6122706, 1, 0.1607843, 0, 1,
-1.933734, -0.3246122, -1.068521, 1, 0.1686275, 0, 1,
-1.927153, -1.778979, -2.870117, 1, 0.172549, 0, 1,
-1.926235, 0.7916052, -1.795642, 1, 0.1803922, 0, 1,
-1.923077, -0.8492282, -3.125834, 1, 0.1843137, 0, 1,
-1.91892, -0.782244, -2.289491, 1, 0.1921569, 0, 1,
-1.914975, -0.6894028, -3.79466, 1, 0.1960784, 0, 1,
-1.901468, -0.1380712, -1.206309, 1, 0.2039216, 0, 1,
-1.892687, 2.025927, -0.5468609, 1, 0.2117647, 0, 1,
-1.892387, 0.3015599, 0.2244041, 1, 0.2156863, 0, 1,
-1.867256, 0.653912, 0.5556511, 1, 0.2235294, 0, 1,
-1.865909, 1.471094, 1.076539, 1, 0.227451, 0, 1,
-1.855603, 0.6431073, -3.001211, 1, 0.2352941, 0, 1,
-1.833017, -0.6172054, -0.7448307, 1, 0.2392157, 0, 1,
-1.779621, 0.5245594, -1.134762, 1, 0.2470588, 0, 1,
-1.758364, -0.8672928, -2.143206, 1, 0.2509804, 0, 1,
-1.754176, 0.6313782, 1.065909, 1, 0.2588235, 0, 1,
-1.728686, 0.5229121, -0.638481, 1, 0.2627451, 0, 1,
-1.722331, -1.247835, -1.788823, 1, 0.2705882, 0, 1,
-1.710976, -1.530623, -1.980488, 1, 0.2745098, 0, 1,
-1.707114, -0.1691208, -1.615736, 1, 0.282353, 0, 1,
-1.699775, 0.4085131, -0.2924744, 1, 0.2862745, 0, 1,
-1.698092, 0.0460542, -1.910172, 1, 0.2941177, 0, 1,
-1.697387, 0.304083, -2.344267, 1, 0.3019608, 0, 1,
-1.671214, 0.2239629, -1.4566, 1, 0.3058824, 0, 1,
-1.668277, 0.655004, -2.237978, 1, 0.3137255, 0, 1,
-1.668203, -0.6479489, -0.9591786, 1, 0.3176471, 0, 1,
-1.665594, -1.33698, -2.467613, 1, 0.3254902, 0, 1,
-1.653436, -1.038537, -2.049693, 1, 0.3294118, 0, 1,
-1.640154, 0.8647351, -1.392087, 1, 0.3372549, 0, 1,
-1.633615, -1.103213, -0.973415, 1, 0.3411765, 0, 1,
-1.630914, 1.936052, -1.06734, 1, 0.3490196, 0, 1,
-1.62514, 1.997762, 0.6660325, 1, 0.3529412, 0, 1,
-1.618713, 0.600238, -2.523891, 1, 0.3607843, 0, 1,
-1.607412, -1.03224, -1.376211, 1, 0.3647059, 0, 1,
-1.599741, 0.2492667, -3.539168, 1, 0.372549, 0, 1,
-1.58506, 0.7339501, -1.572127, 1, 0.3764706, 0, 1,
-1.582195, -0.8971538, -2.460289, 1, 0.3843137, 0, 1,
-1.577639, -0.6439857, -0.7293234, 1, 0.3882353, 0, 1,
-1.544459, -0.2349387, 0.7115675, 1, 0.3960784, 0, 1,
-1.530062, -1.338149, -3.201782, 1, 0.4039216, 0, 1,
-1.518089, 0.8722721, 0.5287279, 1, 0.4078431, 0, 1,
-1.493604, 1.549305, -0.4344612, 1, 0.4156863, 0, 1,
-1.493356, 1.343806, -1.677948, 1, 0.4196078, 0, 1,
-1.486258, -0.2730747, -1.803805, 1, 0.427451, 0, 1,
-1.474534, 0.8336192, -1.647255, 1, 0.4313726, 0, 1,
-1.473633, 0.1445797, -1.133372, 1, 0.4392157, 0, 1,
-1.451293, -0.4758163, -1.85993, 1, 0.4431373, 0, 1,
-1.450833, -0.05410999, -1.639621, 1, 0.4509804, 0, 1,
-1.440118, 0.6070441, -0.9411011, 1, 0.454902, 0, 1,
-1.437139, -0.197052, -0.8539672, 1, 0.4627451, 0, 1,
-1.430575, 0.1978189, -2.189873, 1, 0.4666667, 0, 1,
-1.419299, 0.7903798, -1.238351, 1, 0.4745098, 0, 1,
-1.410446, -0.1465077, -3.238209, 1, 0.4784314, 0, 1,
-1.400577, 0.938552, -0.191348, 1, 0.4862745, 0, 1,
-1.390543, -0.3468565, -1.333965, 1, 0.4901961, 0, 1,
-1.385859, 1.327078, 0.1709999, 1, 0.4980392, 0, 1,
-1.375635, 0.2217863, -0.949903, 1, 0.5058824, 0, 1,
-1.375244, -0.4425076, -1.021411, 1, 0.509804, 0, 1,
-1.375141, -1.42019, -2.466593, 1, 0.5176471, 0, 1,
-1.373786, 1.573849, -2.295908, 1, 0.5215687, 0, 1,
-1.365131, -1.128165, -2.615098, 1, 0.5294118, 0, 1,
-1.358346, -0.5720543, 0.1684255, 1, 0.5333334, 0, 1,
-1.352508, -0.0778871, -1.462269, 1, 0.5411765, 0, 1,
-1.33703, 0.2413737, -2.801105, 1, 0.5450981, 0, 1,
-1.334984, 0.6752741, 0.1172396, 1, 0.5529412, 0, 1,
-1.332178, -0.3460397, -1.888514, 1, 0.5568628, 0, 1,
-1.330189, 0.5113189, -0.1270715, 1, 0.5647059, 0, 1,
-1.327773, 0.7693269, -2.074767, 1, 0.5686275, 0, 1,
-1.327382, 0.5155735, -0.3788956, 1, 0.5764706, 0, 1,
-1.326377, 1.004402, 0.1066385, 1, 0.5803922, 0, 1,
-1.324256, -0.3428674, -2.975503, 1, 0.5882353, 0, 1,
-1.323889, -1.348521, -0.4454284, 1, 0.5921569, 0, 1,
-1.321029, 0.2501709, -1.395276, 1, 0.6, 0, 1,
-1.276936, -0.6849469, -1.196328, 1, 0.6078432, 0, 1,
-1.270507, 0.3824636, -0.7301059, 1, 0.6117647, 0, 1,
-1.267784, 1.24903, -1.230046, 1, 0.6196079, 0, 1,
-1.265713, -2.197053, -3.803187, 1, 0.6235294, 0, 1,
-1.255465, 0.1009435, -2.190723, 1, 0.6313726, 0, 1,
-1.247698, -0.8370466, -1.260993, 1, 0.6352941, 0, 1,
-1.246051, -0.1026829, -1.84588, 1, 0.6431373, 0, 1,
-1.239395, 0.566762, -0.560051, 1, 0.6470588, 0, 1,
-1.23692, 0.6892096, -0.3213482, 1, 0.654902, 0, 1,
-1.233839, -0.03781416, -0.4232, 1, 0.6588235, 0, 1,
-1.221585, -1.49264, -3.759601, 1, 0.6666667, 0, 1,
-1.211871, -1.073739, -1.822924, 1, 0.6705883, 0, 1,
-1.210024, -0.7353961, -1.434979, 1, 0.6784314, 0, 1,
-1.20917, -0.3644044, -2.024653, 1, 0.682353, 0, 1,
-1.206951, 1.321371, 0.5716611, 1, 0.6901961, 0, 1,
-1.203554, 1.123737, 0.252701, 1, 0.6941177, 0, 1,
-1.202591, -0.0763972, -2.391989, 1, 0.7019608, 0, 1,
-1.202163, 1.807684, -1.031774, 1, 0.7098039, 0, 1,
-1.200058, -0.3271017, -1.858272, 1, 0.7137255, 0, 1,
-1.192768, 0.06014536, -0.9299359, 1, 0.7215686, 0, 1,
-1.192574, -0.3281082, -0.4937528, 1, 0.7254902, 0, 1,
-1.181009, -1.122924, -1.669209, 1, 0.7333333, 0, 1,
-1.174682, 1.464126, 0.5252259, 1, 0.7372549, 0, 1,
-1.173278, 0.2824112, -0.933718, 1, 0.7450981, 0, 1,
-1.172772, -0.03849203, -1.026159, 1, 0.7490196, 0, 1,
-1.163564, -0.4814807, -0.3234082, 1, 0.7568628, 0, 1,
-1.163542, -0.7393595, -1.320158, 1, 0.7607843, 0, 1,
-1.148572, -1.398962, -2.499136, 1, 0.7686275, 0, 1,
-1.142115, -0.3466112, -2.508872, 1, 0.772549, 0, 1,
-1.140237, 1.39553, -0.730349, 1, 0.7803922, 0, 1,
-1.133233, 0.9558619, -0.8514627, 1, 0.7843137, 0, 1,
-1.132744, -0.9112224, -2.652797, 1, 0.7921569, 0, 1,
-1.124611, 0.4198686, -1.23968, 1, 0.7960784, 0, 1,
-1.122713, 1.219269, 0.2484023, 1, 0.8039216, 0, 1,
-1.104815, -1.103444, -3.502448, 1, 0.8117647, 0, 1,
-1.098543, 0.4193684, -1.692148, 1, 0.8156863, 0, 1,
-1.08496, 0.829059, -1.655744, 1, 0.8235294, 0, 1,
-1.079694, -1.308283, -2.434232, 1, 0.827451, 0, 1,
-1.07072, 1.519355, -2.636206, 1, 0.8352941, 0, 1,
-1.063252, -1.133727, -2.707875, 1, 0.8392157, 0, 1,
-1.059482, -1.382941, -2.848897, 1, 0.8470588, 0, 1,
-1.058333, -0.2767018, -0.5519291, 1, 0.8509804, 0, 1,
-1.055675, -0.2175324, -0.1814261, 1, 0.8588235, 0, 1,
-1.051203, -0.09881189, -1.777034, 1, 0.8627451, 0, 1,
-1.049434, 1.523149, -1.376114, 1, 0.8705882, 0, 1,
-1.044456, 0.3526689, -3.44883, 1, 0.8745098, 0, 1,
-1.037573, 0.01504067, -1.951339, 1, 0.8823529, 0, 1,
-1.035567, 0.2988642, -1.059264, 1, 0.8862745, 0, 1,
-1.034195, -0.04621679, -1.636882, 1, 0.8941177, 0, 1,
-1.031061, -0.02396019, -1.69367, 1, 0.8980392, 0, 1,
-1.030861, -0.5888717, -2.394868, 1, 0.9058824, 0, 1,
-1.029966, -1.192084, -2.413563, 1, 0.9137255, 0, 1,
-1.028294, 2.354997, -0.6646165, 1, 0.9176471, 0, 1,
-1.02647, -0.733844, -1.809879, 1, 0.9254902, 0, 1,
-1.025926, -1.138265, -0.6057293, 1, 0.9294118, 0, 1,
-1.020097, -0.3115431, -2.231047, 1, 0.9372549, 0, 1,
-1.01535, 0.3194941, -1.830135, 1, 0.9411765, 0, 1,
-1.012628, 0.900658, -1.448231, 1, 0.9490196, 0, 1,
-1.00201, 1.234043, -0.3755779, 1, 0.9529412, 0, 1,
-0.9995608, 1.237334, -0.4973251, 1, 0.9607843, 0, 1,
-0.9976367, 0.9228762, -0.952427, 1, 0.9647059, 0, 1,
-0.9928989, -0.2228675, -1.72245, 1, 0.972549, 0, 1,
-0.9885208, -1.347412, -1.959677, 1, 0.9764706, 0, 1,
-0.9856403, 0.4843916, 0.3715456, 1, 0.9843137, 0, 1,
-0.983438, -0.1154042, -1.937487, 1, 0.9882353, 0, 1,
-0.9803881, 1.588939, -0.3492948, 1, 0.9960784, 0, 1,
-0.9790912, -1.250405, -2.699536, 0.9960784, 1, 0, 1,
-0.9762945, 1.276657, 0.5410975, 0.9921569, 1, 0, 1,
-0.9760552, 2.083834, 0.3748845, 0.9843137, 1, 0, 1,
-0.9729303, 0.9280751, -1.006846, 0.9803922, 1, 0, 1,
-0.9687871, 1.59083, -0.4022582, 0.972549, 1, 0, 1,
-0.9683653, -0.9566185, -4.607085, 0.9686275, 1, 0, 1,
-0.9681556, 1.918197, -0.7005057, 0.9607843, 1, 0, 1,
-0.9430061, -0.937622, -2.500428, 0.9568627, 1, 0, 1,
-0.9426318, -1.3129, -0.0008186223, 0.9490196, 1, 0, 1,
-0.9409473, -1.590132, -2.426439, 0.945098, 1, 0, 1,
-0.9407949, 0.9394033, -0.3247923, 0.9372549, 1, 0, 1,
-0.9377553, -0.3312229, -1.419269, 0.9333333, 1, 0, 1,
-0.9348057, 1.347434, -1.69226, 0.9254902, 1, 0, 1,
-0.9326421, 0.6044534, -1.922806, 0.9215686, 1, 0, 1,
-0.9317805, 1.617208, -1.617622, 0.9137255, 1, 0, 1,
-0.931291, -1.266687, -1.51387, 0.9098039, 1, 0, 1,
-0.9079503, 0.9853562, 0.7721259, 0.9019608, 1, 0, 1,
-0.9039344, -0.8412275, -1.002221, 0.8941177, 1, 0, 1,
-0.90042, 1.151551, -0.5209231, 0.8901961, 1, 0, 1,
-0.8965284, -1.614418, -2.765047, 0.8823529, 1, 0, 1,
-0.8956625, -0.3156791, -2.547157, 0.8784314, 1, 0, 1,
-0.8866863, 1.012661, 0.4729837, 0.8705882, 1, 0, 1,
-0.8859107, -1.441258, -2.944364, 0.8666667, 1, 0, 1,
-0.8844305, 0.7770295, -0.7838379, 0.8588235, 1, 0, 1,
-0.8805169, -1.808532, -2.590623, 0.854902, 1, 0, 1,
-0.8627109, -1.315943, -4.001397, 0.8470588, 1, 0, 1,
-0.8557188, -0.1063047, -1.099096, 0.8431373, 1, 0, 1,
-0.8527421, 0.2956762, -0.7912375, 0.8352941, 1, 0, 1,
-0.8481237, 0.2505947, -1.517512, 0.8313726, 1, 0, 1,
-0.8470166, -0.1385867, -0.7954024, 0.8235294, 1, 0, 1,
-0.8444426, 0.0378634, -1.533754, 0.8196079, 1, 0, 1,
-0.8393716, 0.524038, -1.819774, 0.8117647, 1, 0, 1,
-0.833186, -1.450054, -1.86321, 0.8078431, 1, 0, 1,
-0.8307468, 1.292057, 0.08839317, 0.8, 1, 0, 1,
-0.8284954, -0.01154924, -1.423613, 0.7921569, 1, 0, 1,
-0.8257849, -0.2200818, -2.173956, 0.7882353, 1, 0, 1,
-0.8222836, -1.381842, -2.03336, 0.7803922, 1, 0, 1,
-0.822273, -2.290712, -4.087974, 0.7764706, 1, 0, 1,
-0.8163435, -0.5722474, -0.008188382, 0.7686275, 1, 0, 1,
-0.8158195, 0.0772358, -1.267765, 0.7647059, 1, 0, 1,
-0.8121554, 0.4576063, -0.6836747, 0.7568628, 1, 0, 1,
-0.8055491, 0.8916641, 0.3627906, 0.7529412, 1, 0, 1,
-0.8034979, -0.08803659, -2.27322, 0.7450981, 1, 0, 1,
-0.8016042, 0.5668592, -0.7324356, 0.7411765, 1, 0, 1,
-0.7990256, -0.3447316, -1.455025, 0.7333333, 1, 0, 1,
-0.7971083, 0.3330417, -2.11575, 0.7294118, 1, 0, 1,
-0.7918197, 1.588996, -0.9578614, 0.7215686, 1, 0, 1,
-0.7888266, 0.1627037, -0.7157452, 0.7176471, 1, 0, 1,
-0.7883589, 0.9482629, 0.281058, 0.7098039, 1, 0, 1,
-0.7818012, 0.7737271, -0.1420465, 0.7058824, 1, 0, 1,
-0.7727622, 0.4007143, -2.203143, 0.6980392, 1, 0, 1,
-0.7499918, -1.868216, -0.9058925, 0.6901961, 1, 0, 1,
-0.7479563, 0.4071033, -0.8196064, 0.6862745, 1, 0, 1,
-0.746626, 0.6501888, -0.9057175, 0.6784314, 1, 0, 1,
-0.7421821, 0.2342259, -0.6467178, 0.6745098, 1, 0, 1,
-0.7421375, -0.4734327, -3.14392, 0.6666667, 1, 0, 1,
-0.7382487, -0.9862187, -2.694798, 0.6627451, 1, 0, 1,
-0.7381926, -0.4804014, -2.023486, 0.654902, 1, 0, 1,
-0.7345108, -1.48512, -3.048482, 0.6509804, 1, 0, 1,
-0.7311608, -0.7216575, -2.727427, 0.6431373, 1, 0, 1,
-0.7310472, 1.866115, -0.3735984, 0.6392157, 1, 0, 1,
-0.7189929, -0.5053251, -2.338265, 0.6313726, 1, 0, 1,
-0.7171642, -0.2632941, -2.846766, 0.627451, 1, 0, 1,
-0.7150074, -0.6085865, -0.704116, 0.6196079, 1, 0, 1,
-0.7106455, -1.229575, -1.051892, 0.6156863, 1, 0, 1,
-0.7058957, -0.1592462, -1.43942, 0.6078432, 1, 0, 1,
-0.7047449, 0.631762, -0.218931, 0.6039216, 1, 0, 1,
-0.7025028, -0.1013255, -2.345634, 0.5960785, 1, 0, 1,
-0.6975149, -1.702842, -2.124873, 0.5882353, 1, 0, 1,
-0.6959976, 1.421835, -1.087235, 0.5843138, 1, 0, 1,
-0.6952974, 0.9419349, 0.2937632, 0.5764706, 1, 0, 1,
-0.6903066, 0.8670366, -0.976668, 0.572549, 1, 0, 1,
-0.6897141, 0.3031715, -0.07224238, 0.5647059, 1, 0, 1,
-0.6884173, -0.4003027, -1.914577, 0.5607843, 1, 0, 1,
-0.6842078, 0.4577862, -2.001544, 0.5529412, 1, 0, 1,
-0.6806025, 1.849133, -1.963825, 0.5490196, 1, 0, 1,
-0.6802117, -0.8781306, -2.962748, 0.5411765, 1, 0, 1,
-0.6799847, -0.5355068, -3.53388, 0.5372549, 1, 0, 1,
-0.6772095, 0.6157243, 0.1103133, 0.5294118, 1, 0, 1,
-0.6771337, -1.455522, -2.567533, 0.5254902, 1, 0, 1,
-0.6652189, 0.03284445, -2.509428, 0.5176471, 1, 0, 1,
-0.6627482, 0.1791586, -1.293658, 0.5137255, 1, 0, 1,
-0.6551639, 0.5598709, 0.0188024, 0.5058824, 1, 0, 1,
-0.6528062, -0.1818162, -2.698341, 0.5019608, 1, 0, 1,
-0.6489707, -0.2785985, -2.639997, 0.4941176, 1, 0, 1,
-0.6485031, -0.01030397, -3.108479, 0.4862745, 1, 0, 1,
-0.6450964, -0.263166, -2.284832, 0.4823529, 1, 0, 1,
-0.6436993, 0.2418639, -0.9657987, 0.4745098, 1, 0, 1,
-0.6415157, -1.543395, -3.719608, 0.4705882, 1, 0, 1,
-0.6409644, 1.01636, -1.268969, 0.4627451, 1, 0, 1,
-0.6335921, 1.212947, 0.7008888, 0.4588235, 1, 0, 1,
-0.6297944, -1.002486, -3.301281, 0.4509804, 1, 0, 1,
-0.6278763, 0.8603646, -0.804833, 0.4470588, 1, 0, 1,
-0.6263053, 2.010864, 0.3338774, 0.4392157, 1, 0, 1,
-0.6248801, -0.1698514, -1.71217, 0.4352941, 1, 0, 1,
-0.6225172, 0.6339599, 1.196519, 0.427451, 1, 0, 1,
-0.6206087, 0.3963808, -1.455638, 0.4235294, 1, 0, 1,
-0.61702, 0.7207263, -1.899133, 0.4156863, 1, 0, 1,
-0.6153142, -0.1998911, -1.932931, 0.4117647, 1, 0, 1,
-0.6145292, -1.328839, -1.885396, 0.4039216, 1, 0, 1,
-0.6131508, -0.8311405, -1.837963, 0.3960784, 1, 0, 1,
-0.6096796, 0.9468313, -2.147311, 0.3921569, 1, 0, 1,
-0.599426, 1.623818, -0.2060317, 0.3843137, 1, 0, 1,
-0.5967256, 1.24826, 0.8005349, 0.3803922, 1, 0, 1,
-0.5934312, -0.2065287, -2.894181, 0.372549, 1, 0, 1,
-0.5920499, -1.264273, -3.68453, 0.3686275, 1, 0, 1,
-0.5888745, -0.220308, -0.6268334, 0.3607843, 1, 0, 1,
-0.5880657, 0.6748528, 0.4292406, 0.3568628, 1, 0, 1,
-0.5846967, 1.318878, -0.5012613, 0.3490196, 1, 0, 1,
-0.5782949, 1.390451, -0.4010452, 0.345098, 1, 0, 1,
-0.5749277, -0.03775714, -1.635601, 0.3372549, 1, 0, 1,
-0.5747226, 0.5245264, 0.9452481, 0.3333333, 1, 0, 1,
-0.5731297, 0.3351589, 0.1907398, 0.3254902, 1, 0, 1,
-0.5697811, -0.1899064, -1.924746, 0.3215686, 1, 0, 1,
-0.5666703, 1.534624, 0.2402177, 0.3137255, 1, 0, 1,
-0.5612454, -1.013736, 0.08263362, 0.3098039, 1, 0, 1,
-0.5552258, -0.4927072, -3.864858, 0.3019608, 1, 0, 1,
-0.5536377, -0.5765461, -1.230157, 0.2941177, 1, 0, 1,
-0.5505373, -0.3187899, -2.215809, 0.2901961, 1, 0, 1,
-0.5501741, 1.381392, -2.197611, 0.282353, 1, 0, 1,
-0.5482533, 1.03789, 0.9638014, 0.2784314, 1, 0, 1,
-0.545864, 0.8551425, -3.024112, 0.2705882, 1, 0, 1,
-0.5457377, -0.3043915, -1.409096, 0.2666667, 1, 0, 1,
-0.5400928, 0.04580073, -1.486302, 0.2588235, 1, 0, 1,
-0.5371042, 0.7920216, -1.012246, 0.254902, 1, 0, 1,
-0.5353115, -2.135861, -3.307375, 0.2470588, 1, 0, 1,
-0.5327157, 0.09105782, -3.54889, 0.2431373, 1, 0, 1,
-0.5230708, 1.533283, 0.1932064, 0.2352941, 1, 0, 1,
-0.5213383, -0.9044956, -3.671363, 0.2313726, 1, 0, 1,
-0.5172672, 0.06388114, -0.8581986, 0.2235294, 1, 0, 1,
-0.514412, -0.8932883, -3.946211, 0.2196078, 1, 0, 1,
-0.5047822, 0.6043834, -1.093578, 0.2117647, 1, 0, 1,
-0.4995986, 2.1608, 0.7192627, 0.2078431, 1, 0, 1,
-0.4987856, 0.1365709, -1.097233, 0.2, 1, 0, 1,
-0.494909, -0.260567, -2.507782, 0.1921569, 1, 0, 1,
-0.4948115, -0.2380704, 0.2431587, 0.1882353, 1, 0, 1,
-0.4934842, -1.287762, -2.502647, 0.1803922, 1, 0, 1,
-0.4897006, -1.09831, -3.18792, 0.1764706, 1, 0, 1,
-0.483287, 0.985561, -1.751258, 0.1686275, 1, 0, 1,
-0.482343, 0.08147181, -0.2960312, 0.1647059, 1, 0, 1,
-0.4818227, 0.3159459, -1.398617, 0.1568628, 1, 0, 1,
-0.4800407, -1.359566, -2.758778, 0.1529412, 1, 0, 1,
-0.4768049, 0.5014408, -0.2974974, 0.145098, 1, 0, 1,
-0.4717697, 1.352051, -1.811531, 0.1411765, 1, 0, 1,
-0.4708184, 0.4386498, -0.7681993, 0.1333333, 1, 0, 1,
-0.469063, -0.293703, -1.260618, 0.1294118, 1, 0, 1,
-0.4682481, 0.4005966, -2.4655, 0.1215686, 1, 0, 1,
-0.4682225, -0.5560635, -2.105699, 0.1176471, 1, 0, 1,
-0.4671942, -1.114835, -2.202442, 0.1098039, 1, 0, 1,
-0.4640584, 0.721257, 0.05943779, 0.1058824, 1, 0, 1,
-0.4637122, -0.6005509, -2.999948, 0.09803922, 1, 0, 1,
-0.458254, 0.822484, -1.9111, 0.09019608, 1, 0, 1,
-0.4558092, -0.9276263, -1.446837, 0.08627451, 1, 0, 1,
-0.4536447, -1.067975, -2.233538, 0.07843138, 1, 0, 1,
-0.4513686, -0.1251787, -1.424126, 0.07450981, 1, 0, 1,
-0.4509242, -0.3026372, -1.525096, 0.06666667, 1, 0, 1,
-0.4476076, 0.8910674, -0.2607397, 0.0627451, 1, 0, 1,
-0.4472993, 0.1495295, -1.428431, 0.05490196, 1, 0, 1,
-0.4443626, -1.701032, -3.322226, 0.05098039, 1, 0, 1,
-0.4422354, -0.1034569, -2.082845, 0.04313726, 1, 0, 1,
-0.4388868, 1.224414, -0.2579174, 0.03921569, 1, 0, 1,
-0.4345701, 0.4049969, -1.157816, 0.03137255, 1, 0, 1,
-0.4341062, -1.384086, -2.78306, 0.02745098, 1, 0, 1,
-0.4329239, 0.7583954, 0.3586951, 0.01960784, 1, 0, 1,
-0.4328769, -1.02668, -3.220754, 0.01568628, 1, 0, 1,
-0.4325137, 0.7414619, -0.7990838, 0.007843138, 1, 0, 1,
-0.4317042, -1.708997, -2.822231, 0.003921569, 1, 0, 1,
-0.4275485, 0.8364984, -0.1580294, 0, 1, 0.003921569, 1,
-0.4233525, -0.002517654, -1.881588, 0, 1, 0.01176471, 1,
-0.4128039, -0.1276157, -0.9091082, 0, 1, 0.01568628, 1,
-0.4123103, 0.1655798, -1.529753, 0, 1, 0.02352941, 1,
-0.4119064, -0.6710858, -2.823027, 0, 1, 0.02745098, 1,
-0.4098518, 0.7694579, -0.1594649, 0, 1, 0.03529412, 1,
-0.4086401, -0.1470014, -0.9406695, 0, 1, 0.03921569, 1,
-0.4068817, 0.1406474, 0.8292125, 0, 1, 0.04705882, 1,
-0.4021948, -0.1633731, -2.868658, 0, 1, 0.05098039, 1,
-0.4000778, 1.132513, -0.04241925, 0, 1, 0.05882353, 1,
-0.3994306, -1.864275, -0.8096372, 0, 1, 0.0627451, 1,
-0.397631, -0.6334912, -3.880581, 0, 1, 0.07058824, 1,
-0.3922116, -1.138568, -2.0711, 0, 1, 0.07450981, 1,
-0.390424, -0.05139916, -1.889177, 0, 1, 0.08235294, 1,
-0.3870949, -1.438428, -1.715525, 0, 1, 0.08627451, 1,
-0.3839166, 0.297578, -0.712957, 0, 1, 0.09411765, 1,
-0.3834028, -0.2806241, -2.125516, 0, 1, 0.1019608, 1,
-0.3776623, 0.9439411, -0.2287494, 0, 1, 0.1058824, 1,
-0.370606, 0.07722716, -2.318068, 0, 1, 0.1137255, 1,
-0.3692125, 1.362809, 1.417967, 0, 1, 0.1176471, 1,
-0.3683199, -0.435634, -0.7698924, 0, 1, 0.1254902, 1,
-0.3630449, -1.082803, -3.536654, 0, 1, 0.1294118, 1,
-0.3614819, -1.150562, -1.901057, 0, 1, 0.1372549, 1,
-0.3586435, -0.4379886, -1.90276, 0, 1, 0.1411765, 1,
-0.3562539, 1.16692, 0.05373701, 0, 1, 0.1490196, 1,
-0.3547449, -0.08492491, -0.1550831, 0, 1, 0.1529412, 1,
-0.3513534, -0.4890992, -1.768399, 0, 1, 0.1607843, 1,
-0.3489386, 0.4282376, -0.3906274, 0, 1, 0.1647059, 1,
-0.3473417, 1.040872, -0.9123147, 0, 1, 0.172549, 1,
-0.3471966, -0.4946087, -2.745693, 0, 1, 0.1764706, 1,
-0.346688, 0.8783332, -0.4314274, 0, 1, 0.1843137, 1,
-0.3453912, -0.6980302, -3.410237, 0, 1, 0.1882353, 1,
-0.3388405, 1.138538, -1.686902, 0, 1, 0.1960784, 1,
-0.337309, 0.2959199, -1.132775, 0, 1, 0.2039216, 1,
-0.3360527, -0.4489195, -1.31046, 0, 1, 0.2078431, 1,
-0.3346472, 0.5076283, 0.9342122, 0, 1, 0.2156863, 1,
-0.3225472, -0.4794193, -2.123158, 0, 1, 0.2196078, 1,
-0.3212172, -0.9669801, -2.117261, 0, 1, 0.227451, 1,
-0.3200044, 0.5042328, -1.318375, 0, 1, 0.2313726, 1,
-0.3194359, -0.7704626, -2.034067, 0, 1, 0.2392157, 1,
-0.314046, -0.6896978, -3.40501, 0, 1, 0.2431373, 1,
-0.3081239, 0.3325704, -0.1722339, 0, 1, 0.2509804, 1,
-0.3039935, -0.6856109, -4.598345, 0, 1, 0.254902, 1,
-0.3010992, -0.9735391, -2.960087, 0, 1, 0.2627451, 1,
-0.2822439, -1.92961, -2.00337, 0, 1, 0.2666667, 1,
-0.2744849, -1.794508, -2.337068, 0, 1, 0.2745098, 1,
-0.2740104, 0.4672361, -1.347708, 0, 1, 0.2784314, 1,
-0.2713159, -0.3380647, -2.518576, 0, 1, 0.2862745, 1,
-0.2680139, 1.306863, 0.2643147, 0, 1, 0.2901961, 1,
-0.2676828, -1.005165, -2.032693, 0, 1, 0.2980392, 1,
-0.267377, 0.2803323, -0.0252682, 0, 1, 0.3058824, 1,
-0.2662998, -1.072652, -4.154101, 0, 1, 0.3098039, 1,
-0.2640161, 0.5784445, -1.241713, 0, 1, 0.3176471, 1,
-0.2607858, 0.1211372, -2.095631, 0, 1, 0.3215686, 1,
-0.2533161, -0.08860104, -1.652849, 0, 1, 0.3294118, 1,
-0.2469658, -0.4927937, -2.331406, 0, 1, 0.3333333, 1,
-0.2466528, 0.6935243, -2.251802, 0, 1, 0.3411765, 1,
-0.2460586, -0.4675042, -2.154529, 0, 1, 0.345098, 1,
-0.2445016, 0.4747631, -1.811671, 0, 1, 0.3529412, 1,
-0.2405593, 0.09486791, -1.227769, 0, 1, 0.3568628, 1,
-0.2383066, 0.3641532, -0.546618, 0, 1, 0.3647059, 1,
-0.2345461, -1.426716, -2.889849, 0, 1, 0.3686275, 1,
-0.2308525, -0.5197662, -4.444841, 0, 1, 0.3764706, 1,
-0.2303831, -0.05694864, 1.448626, 0, 1, 0.3803922, 1,
-0.2274967, -1.252585, -2.454608, 0, 1, 0.3882353, 1,
-0.2249302, -0.5984898, -1.853067, 0, 1, 0.3921569, 1,
-0.223063, 0.5215216, 0.7413921, 0, 1, 0.4, 1,
-0.2215274, 1.098141, -1.156664, 0, 1, 0.4078431, 1,
-0.2187031, 0.5856845, -0.6736951, 0, 1, 0.4117647, 1,
-0.2160987, -0.2161298, -2.7369, 0, 1, 0.4196078, 1,
-0.2119129, 0.1905034, -1.263348, 0, 1, 0.4235294, 1,
-0.2106505, 2.171478, -0.1512627, 0, 1, 0.4313726, 1,
-0.2094809, -0.2605999, -0.8335199, 0, 1, 0.4352941, 1,
-0.2082224, 0.6194779, -0.4838645, 0, 1, 0.4431373, 1,
-0.2080725, -0.2068192, -1.799328, 0, 1, 0.4470588, 1,
-0.2009192, -2.23544, -2.399454, 0, 1, 0.454902, 1,
-0.1966686, -0.9241131, -3.811815, 0, 1, 0.4588235, 1,
-0.1945902, -0.890487, -3.008288, 0, 1, 0.4666667, 1,
-0.1908458, 0.9291522, -0.5826867, 0, 1, 0.4705882, 1,
-0.1872779, 0.7298611, 0.1379499, 0, 1, 0.4784314, 1,
-0.1746916, 0.3691043, 0.3215413, 0, 1, 0.4823529, 1,
-0.1737662, 3.395607, 0.6511068, 0, 1, 0.4901961, 1,
-0.1681979, -0.2532431, -2.659503, 0, 1, 0.4941176, 1,
-0.1662294, 0.7656947, -0.8080869, 0, 1, 0.5019608, 1,
-0.1606475, 0.4548762, 0.05814007, 0, 1, 0.509804, 1,
-0.1605651, -2.052073, -3.533416, 0, 1, 0.5137255, 1,
-0.1587851, -0.01083973, -3.160345, 0, 1, 0.5215687, 1,
-0.1557375, -1.065358, -3.676985, 0, 1, 0.5254902, 1,
-0.1542471, -2.043769, -2.986756, 0, 1, 0.5333334, 1,
-0.1529181, -1.450495, -2.352137, 0, 1, 0.5372549, 1,
-0.1430034, -0.0554299, -3.54625, 0, 1, 0.5450981, 1,
-0.1394354, -1.143784, -5.953269, 0, 1, 0.5490196, 1,
-0.1388097, -0.9749038, -3.494294, 0, 1, 0.5568628, 1,
-0.1371154, -1.127591, -2.985385, 0, 1, 0.5607843, 1,
-0.1370897, 0.9317151, 0.7957208, 0, 1, 0.5686275, 1,
-0.1322001, -0.7758086, -3.614991, 0, 1, 0.572549, 1,
-0.1277518, 0.2896645, -1.161291, 0, 1, 0.5803922, 1,
-0.1256689, -1.458174, -2.969839, 0, 1, 0.5843138, 1,
-0.1254805, 0.6449494, -0.5483305, 0, 1, 0.5921569, 1,
-0.1236772, 0.6296053, -1.803369, 0, 1, 0.5960785, 1,
-0.1172975, -0.7760909, -1.860539, 0, 1, 0.6039216, 1,
-0.1089275, 0.6605093, 0.2560836, 0, 1, 0.6117647, 1,
-0.1046598, -1.115656, -3.274579, 0, 1, 0.6156863, 1,
-0.1045251, -0.1848057, -2.837643, 0, 1, 0.6235294, 1,
-0.1037668, -0.1203595, -3.424072, 0, 1, 0.627451, 1,
-0.1036441, 1.767056, 0.5324751, 0, 1, 0.6352941, 1,
-0.1035214, 0.6833758, 0.4380696, 0, 1, 0.6392157, 1,
-0.1023693, 0.5052997, 0.1562783, 0, 1, 0.6470588, 1,
-0.0997339, -0.8960452, -0.8629227, 0, 1, 0.6509804, 1,
-0.09869042, 0.2006085, -0.4160612, 0, 1, 0.6588235, 1,
-0.09756655, 0.4437356, -0.8478241, 0, 1, 0.6627451, 1,
-0.09519865, 0.7104967, 0.4859563, 0, 1, 0.6705883, 1,
-0.09437128, 0.6236576, 0.7208146, 0, 1, 0.6745098, 1,
-0.09247538, 0.33935, 1.103695, 0, 1, 0.682353, 1,
-0.0891739, 0.5001578, 2.019635, 0, 1, 0.6862745, 1,
-0.08858956, 0.5220086, 0.2524998, 0, 1, 0.6941177, 1,
-0.08670361, 0.2225162, -0.214042, 0, 1, 0.7019608, 1,
-0.08467499, 0.7834407, 2.335144, 0, 1, 0.7058824, 1,
-0.08390707, 1.163667, -1.631763, 0, 1, 0.7137255, 1,
-0.08183839, 0.1438317, 0.02503566, 0, 1, 0.7176471, 1,
-0.08143216, 0.5915207, -1.345613, 0, 1, 0.7254902, 1,
-0.07973245, 0.5989712, -0.9474102, 0, 1, 0.7294118, 1,
-0.07528476, -0.4082729, -1.577944, 0, 1, 0.7372549, 1,
-0.07339176, -0.5965858, -2.831176, 0, 1, 0.7411765, 1,
-0.07315688, 1.144166, -0.8549715, 0, 1, 0.7490196, 1,
-0.07160245, 0.8352463, -0.5723618, 0, 1, 0.7529412, 1,
-0.06913762, -1.16336, -1.809403, 0, 1, 0.7607843, 1,
-0.06852949, -0.4696316, -3.233066, 0, 1, 0.7647059, 1,
-0.06791051, -0.6361046, -4.018136, 0, 1, 0.772549, 1,
-0.06469874, -0.2369759, -2.349093, 0, 1, 0.7764706, 1,
-0.06462201, -0.3716361, -2.824009, 0, 1, 0.7843137, 1,
-0.0632391, 2.504525, 0.2172731, 0, 1, 0.7882353, 1,
-0.05572585, -0.7829335, -3.414545, 0, 1, 0.7960784, 1,
-0.05450864, 0.1585726, -0.5212654, 0, 1, 0.8039216, 1,
-0.05436992, 0.3522816, 0.8444613, 0, 1, 0.8078431, 1,
-0.05217298, 0.04982333, 1.289812, 0, 1, 0.8156863, 1,
-0.05079662, -1.013197, -4.10172, 0, 1, 0.8196079, 1,
-0.05062552, 0.08860666, -0.8788477, 0, 1, 0.827451, 1,
-0.04918043, -0.2791533, -1.649898, 0, 1, 0.8313726, 1,
-0.04661077, -1.209547, -3.440737, 0, 1, 0.8392157, 1,
-0.04643979, -0.05935599, 0.3946444, 0, 1, 0.8431373, 1,
-0.04303458, -0.06654382, -1.170578, 0, 1, 0.8509804, 1,
-0.04133266, -0.1684283, -2.569828, 0, 1, 0.854902, 1,
-0.04089198, 0.2423469, -0.7801883, 0, 1, 0.8627451, 1,
-0.04060553, 0.4766345, -1.290551, 0, 1, 0.8666667, 1,
-0.0402996, 1.963765, 0.4176394, 0, 1, 0.8745098, 1,
-0.03830967, 0.03973121, -1.273885, 0, 1, 0.8784314, 1,
-0.03577294, -1.268886, -2.493193, 0, 1, 0.8862745, 1,
-0.03381556, 0.5520408, 0.1189749, 0, 1, 0.8901961, 1,
-0.03228625, -0.9754063, -4.626657, 0, 1, 0.8980392, 1,
-0.03061148, 0.6900836, 0.8797544, 0, 1, 0.9058824, 1,
-0.03057912, 1.584705, -0.1422404, 0, 1, 0.9098039, 1,
-0.02582037, 1.339707, 0.789709, 0, 1, 0.9176471, 1,
-0.02513076, -0.4062113, -2.734644, 0, 1, 0.9215686, 1,
-0.02426464, 0.4837746, -1.040987, 0, 1, 0.9294118, 1,
-0.02232889, 1.894156, -0.05813047, 0, 1, 0.9333333, 1,
-0.02163219, -1.223723, -4.011816, 0, 1, 0.9411765, 1,
-0.01966177, 1.008317, 0.1986754, 0, 1, 0.945098, 1,
-0.0196042, 0.2066868, 0.05293259, 0, 1, 0.9529412, 1,
-0.01805289, -0.6987965, -3.199486, 0, 1, 0.9568627, 1,
-0.01664711, -0.06487829, -2.536297, 0, 1, 0.9647059, 1,
-0.01607632, -0.2640299, -4.004815, 0, 1, 0.9686275, 1,
-0.01442205, 2.907754, -0.9182932, 0, 1, 0.9764706, 1,
-0.009405089, 0.5818855, 0.8431296, 0, 1, 0.9803922, 1,
-0.009196015, -1.399484, -3.943293, 0, 1, 0.9882353, 1,
-0.008851076, 0.4506319, -2.231996, 0, 1, 0.9921569, 1,
-0.008044258, -0.1025992, -3.722527, 0, 1, 1, 1,
-0.006464503, 0.5716743, -0.7903956, 0, 0.9921569, 1, 1,
-0.005201276, -1.098342, -2.016152, 0, 0.9882353, 1, 1,
-0.002420503, -1.331629, -4.327022, 0, 0.9803922, 1, 1,
-0.001475555, -1.17057, -2.349785, 0, 0.9764706, 1, 1,
-0.001090728, 0.03708383, -0.8522086, 0, 0.9686275, 1, 1,
0.00358135, 0.9748871, 0.06310168, 0, 0.9647059, 1, 1,
0.01280888, -0.2199883, 1.908335, 0, 0.9568627, 1, 1,
0.01430916, 2.922255, -0.3688922, 0, 0.9529412, 1, 1,
0.01439803, 1.288689, 1.314444, 0, 0.945098, 1, 1,
0.01565474, 0.3226724, 0.3773929, 0, 0.9411765, 1, 1,
0.02128915, -1.628411, 1.56509, 0, 0.9333333, 1, 1,
0.02236487, 1.408475, -0.546024, 0, 0.9294118, 1, 1,
0.0231178, -1.016995, 1.870681, 0, 0.9215686, 1, 1,
0.02659281, 2.743911, -0.2139082, 0, 0.9176471, 1, 1,
0.0282969, -0.7540191, 4.828843, 0, 0.9098039, 1, 1,
0.03322701, -2.52236, 1.474262, 0, 0.9058824, 1, 1,
0.0338361, -0.09793138, 4.809891, 0, 0.8980392, 1, 1,
0.0344857, -1.678299, 3.475979, 0, 0.8901961, 1, 1,
0.03487246, -0.5048842, 2.301497, 0, 0.8862745, 1, 1,
0.03507015, -0.8170124, 2.973276, 0, 0.8784314, 1, 1,
0.03827991, -1.196311, 3.294237, 0, 0.8745098, 1, 1,
0.03999262, 2.349668, -0.4120383, 0, 0.8666667, 1, 1,
0.04427637, -1.300162, 1.553809, 0, 0.8627451, 1, 1,
0.04598477, 1.765196, -0.02718427, 0, 0.854902, 1, 1,
0.04942238, -0.2502632, 3.216964, 0, 0.8509804, 1, 1,
0.05143815, 0.4367856, 0.6522908, 0, 0.8431373, 1, 1,
0.0546791, -1.839801, 3.729637, 0, 0.8392157, 1, 1,
0.06031933, -0.3917846, 2.052356, 0, 0.8313726, 1, 1,
0.06117243, -1.298772, 1.818719, 0, 0.827451, 1, 1,
0.06122736, -0.2067507, 2.679027, 0, 0.8196079, 1, 1,
0.06256201, 0.9857401, -0.07739626, 0, 0.8156863, 1, 1,
0.06950507, 1.280477, 0.767401, 0, 0.8078431, 1, 1,
0.07088077, 0.5802573, 0.07980197, 0, 0.8039216, 1, 1,
0.07308667, 1.597998, 0.03379369, 0, 0.7960784, 1, 1,
0.07602538, 0.09815346, 1.23765, 0, 0.7882353, 1, 1,
0.07825243, -0.06679185, 3.085788, 0, 0.7843137, 1, 1,
0.08015793, 1.332925, -0.1523592, 0, 0.7764706, 1, 1,
0.08104019, 0.1766264, 0.02145208, 0, 0.772549, 1, 1,
0.09016161, 0.03709985, 2.378032, 0, 0.7647059, 1, 1,
0.09197465, -0.583629, 1.989372, 0, 0.7607843, 1, 1,
0.1027032, -0.7776133, 2.601082, 0, 0.7529412, 1, 1,
0.1048869, -0.7067156, 2.036619, 0, 0.7490196, 1, 1,
0.1058048, -1.591372, 3.133939, 0, 0.7411765, 1, 1,
0.1115371, -1.411698, 2.54923, 0, 0.7372549, 1, 1,
0.1123675, 0.4150361, -0.9958228, 0, 0.7294118, 1, 1,
0.1125582, 0.9673806, 0.834339, 0, 0.7254902, 1, 1,
0.112686, 1.811395, -0.6301495, 0, 0.7176471, 1, 1,
0.1130356, -0.2064496, 2.749326, 0, 0.7137255, 1, 1,
0.115483, -0.3283403, 1.108129, 0, 0.7058824, 1, 1,
0.1170591, -0.8624792, 3.105708, 0, 0.6980392, 1, 1,
0.1210944, 0.5659231, 1.6722, 0, 0.6941177, 1, 1,
0.1232676, -1.093983, 4.182066, 0, 0.6862745, 1, 1,
0.1243818, 1.214088, 0.6935318, 0, 0.682353, 1, 1,
0.1244402, 0.2667544, -0.7184547, 0, 0.6745098, 1, 1,
0.1272413, -0.03626504, 2.829129, 0, 0.6705883, 1, 1,
0.1274931, -0.4783958, 1.973432, 0, 0.6627451, 1, 1,
0.130984, 1.254793, -0.5119523, 0, 0.6588235, 1, 1,
0.1323299, -0.2945628, 3.317815, 0, 0.6509804, 1, 1,
0.1326678, -2.611096, 3.122894, 0, 0.6470588, 1, 1,
0.1353546, -1.84056, 2.97457, 0, 0.6392157, 1, 1,
0.1359861, -0.4535232, 3.229143, 0, 0.6352941, 1, 1,
0.1425561, -0.9573885, 2.403539, 0, 0.627451, 1, 1,
0.1496668, 1.08947, 0.2740643, 0, 0.6235294, 1, 1,
0.1514784, 0.5658309, -1.367998, 0, 0.6156863, 1, 1,
0.1561371, -2.003098, 1.886317, 0, 0.6117647, 1, 1,
0.1570543, 0.738832, -0.07682377, 0, 0.6039216, 1, 1,
0.158502, 1.109964, 3.124285, 0, 0.5960785, 1, 1,
0.1607701, 0.06836209, 2.327671, 0, 0.5921569, 1, 1,
0.163867, -1.610304, 2.588792, 0, 0.5843138, 1, 1,
0.1669163, -2.707811, 3.895196, 0, 0.5803922, 1, 1,
0.1676013, -0.6637514, 2.298535, 0, 0.572549, 1, 1,
0.1718883, -0.974436, 3.348806, 0, 0.5686275, 1, 1,
0.1765765, -0.03652399, 1.773322, 0, 0.5607843, 1, 1,
0.1853434, -1.484058, 1.725852, 0, 0.5568628, 1, 1,
0.1894235, 0.4114098, 0.9182304, 0, 0.5490196, 1, 1,
0.1937332, 2.287639, 0.5316913, 0, 0.5450981, 1, 1,
0.1944163, -1.528118, 2.941712, 0, 0.5372549, 1, 1,
0.197105, -0.1299735, 0.889327, 0, 0.5333334, 1, 1,
0.197467, 3.032034, 0.8719563, 0, 0.5254902, 1, 1,
0.2022435, -1.651856, 4.704365, 0, 0.5215687, 1, 1,
0.2042789, -0.9006594, 2.827398, 0, 0.5137255, 1, 1,
0.2059541, 0.8428768, 0.2439981, 0, 0.509804, 1, 1,
0.2096851, 1.585896, 0.2669506, 0, 0.5019608, 1, 1,
0.2127379, 1.032347, -0.7212911, 0, 0.4941176, 1, 1,
0.2172271, -0.776023, 2.880613, 0, 0.4901961, 1, 1,
0.2181251, 1.08566, 1.095783, 0, 0.4823529, 1, 1,
0.2192659, -1.738904, 4.319059, 0, 0.4784314, 1, 1,
0.2210448, 0.9977475, 0.4921295, 0, 0.4705882, 1, 1,
0.2235422, 0.4949476, 1.36097, 0, 0.4666667, 1, 1,
0.2250993, -0.9514997, 1.802629, 0, 0.4588235, 1, 1,
0.2265925, 0.476529, 0.07715471, 0, 0.454902, 1, 1,
0.2286408, -0.09127817, 1.485145, 0, 0.4470588, 1, 1,
0.2306761, -0.3720431, 2.666407, 0, 0.4431373, 1, 1,
0.2313808, 0.7283198, 1.571907, 0, 0.4352941, 1, 1,
0.2348945, 0.951344, -0.9811511, 0, 0.4313726, 1, 1,
0.2383985, -2.739675, 2.887667, 0, 0.4235294, 1, 1,
0.2390765, -0.4072599, 1.919551, 0, 0.4196078, 1, 1,
0.2403087, -0.1633588, 2.813972, 0, 0.4117647, 1, 1,
0.24222, -0.2607826, 0.6811279, 0, 0.4078431, 1, 1,
0.2425463, 0.7005271, -1.145557, 0, 0.4, 1, 1,
0.2477925, 0.6341506, 1.234822, 0, 0.3921569, 1, 1,
0.2489971, -0.285633, 2.087952, 0, 0.3882353, 1, 1,
0.2526237, 1.00376, 0.9602821, 0, 0.3803922, 1, 1,
0.2528621, 1.55225, 0.2686515, 0, 0.3764706, 1, 1,
0.2551812, -0.8468196, 3.786437, 0, 0.3686275, 1, 1,
0.2568657, -1.28588, 2.564475, 0, 0.3647059, 1, 1,
0.2611756, 0.3297074, -0.3107594, 0, 0.3568628, 1, 1,
0.26361, -0.07674127, 3.186358, 0, 0.3529412, 1, 1,
0.2677419, -1.209481, 2.951525, 0, 0.345098, 1, 1,
0.2702296, 0.3483422, 0.068537, 0, 0.3411765, 1, 1,
0.2750949, 1.008359, 0.6362345, 0, 0.3333333, 1, 1,
0.2754289, -0.7503172, 3.282194, 0, 0.3294118, 1, 1,
0.2797216, -0.7938194, 1.772974, 0, 0.3215686, 1, 1,
0.2816201, -0.2257887, 2.328279, 0, 0.3176471, 1, 1,
0.2823865, 1.690903, 1.020854, 0, 0.3098039, 1, 1,
0.2851896, -0.7222899, 2.277428, 0, 0.3058824, 1, 1,
0.2867341, -1.149248, 4.543007, 0, 0.2980392, 1, 1,
0.2879344, -0.2122519, 1.033135, 0, 0.2901961, 1, 1,
0.2897622, 0.5813016, 0.8702012, 0, 0.2862745, 1, 1,
0.2919568, -0.3701967, 1.619432, 0, 0.2784314, 1, 1,
0.2942995, 0.1972204, -0.4294983, 0, 0.2745098, 1, 1,
0.2997153, 0.7221169, 1.998933, 0, 0.2666667, 1, 1,
0.3012236, -0.870536, 4.667749, 0, 0.2627451, 1, 1,
0.3024103, 0.2954192, 1.358907, 0, 0.254902, 1, 1,
0.3058072, 0.2926929, 0.9996737, 0, 0.2509804, 1, 1,
0.30678, 1.535571, -0.4067771, 0, 0.2431373, 1, 1,
0.3104447, 1.03845, 1.831447, 0, 0.2392157, 1, 1,
0.3124489, 0.297151, 1.516665, 0, 0.2313726, 1, 1,
0.3140603, 2.299538, -0.7679623, 0, 0.227451, 1, 1,
0.3176352, 0.6580432, 0.4960396, 0, 0.2196078, 1, 1,
0.3206546, 1.595895, 0.6448413, 0, 0.2156863, 1, 1,
0.3241073, -0.4074386, 2.632445, 0, 0.2078431, 1, 1,
0.3241137, -0.348263, 2.666398, 0, 0.2039216, 1, 1,
0.3246569, -0.9515871, 5.345327, 0, 0.1960784, 1, 1,
0.3270078, 0.3086539, 0.8743697, 0, 0.1882353, 1, 1,
0.3315733, 0.5964198, -1.075445, 0, 0.1843137, 1, 1,
0.3318816, -0.810657, 1.026278, 0, 0.1764706, 1, 1,
0.3387884, -0.1554188, 1.992364, 0, 0.172549, 1, 1,
0.3431308, 0.8174139, 0.9402418, 0, 0.1647059, 1, 1,
0.3433352, -1.487525, 2.068882, 0, 0.1607843, 1, 1,
0.3459802, 0.9257414, 1.351647, 0, 0.1529412, 1, 1,
0.3469294, -0.8743019, 3.094974, 0, 0.1490196, 1, 1,
0.3474796, 0.9508142, 0.4405989, 0, 0.1411765, 1, 1,
0.3530854, 0.9367729, -0.7378182, 0, 0.1372549, 1, 1,
0.3559986, 0.7010045, 2.574203, 0, 0.1294118, 1, 1,
0.3572174, -1.482816, 2.726556, 0, 0.1254902, 1, 1,
0.3600938, 1.03378, -0.6660402, 0, 0.1176471, 1, 1,
0.3616363, -0.870959, 1.815157, 0, 0.1137255, 1, 1,
0.3696867, -1.552136, 1.829568, 0, 0.1058824, 1, 1,
0.3722681, 0.07751963, -0.1228929, 0, 0.09803922, 1, 1,
0.3733984, -0.5225392, 1.658486, 0, 0.09411765, 1, 1,
0.3755063, 1.116252, -0.1013563, 0, 0.08627451, 1, 1,
0.3760121, -0.3201529, 3.814098, 0, 0.08235294, 1, 1,
0.379862, -0.8385643, 0.6572079, 0, 0.07450981, 1, 1,
0.3906528, 1.631322, 0.2029928, 0, 0.07058824, 1, 1,
0.3913129, 0.7503477, -0.03212721, 0, 0.0627451, 1, 1,
0.3981982, 1.008946, 0.4000095, 0, 0.05882353, 1, 1,
0.3994378, -0.5499264, 1.88954, 0, 0.05098039, 1, 1,
0.4007981, 1.448219, 0.1961852, 0, 0.04705882, 1, 1,
0.400803, 1.008947, 0.0765501, 0, 0.03921569, 1, 1,
0.4058805, 0.05149802, 2.793502, 0, 0.03529412, 1, 1,
0.4066192, -1.264368, 3.112867, 0, 0.02745098, 1, 1,
0.4081818, 1.347848, 0.06804936, 0, 0.02352941, 1, 1,
0.4083533, 0.04134019, 2.818024, 0, 0.01568628, 1, 1,
0.4111736, 0.6930901, 0.02643323, 0, 0.01176471, 1, 1,
0.4114446, 0.9799129, -0.1178875, 0, 0.003921569, 1, 1,
0.4115703, 0.4203502, 0.8739397, 0.003921569, 0, 1, 1,
0.4179251, 0.1487075, 1.361405, 0.007843138, 0, 1, 1,
0.4226144, 2.242798, 1.019863, 0.01568628, 0, 1, 1,
0.4231427, -1.128426, 1.410033, 0.01960784, 0, 1, 1,
0.4240119, 0.07818089, 2.100776, 0.02745098, 0, 1, 1,
0.4258781, 0.9567275, 1.237327, 0.03137255, 0, 1, 1,
0.4389875, 0.7334018, -0.0002900658, 0.03921569, 0, 1, 1,
0.445585, 0.2407748, -0.09274181, 0.04313726, 0, 1, 1,
0.4486949, -0.3674239, 0.7805287, 0.05098039, 0, 1, 1,
0.4596721, 0.8088811, -1.112032, 0.05490196, 0, 1, 1,
0.4601017, 0.1079056, 2.941434, 0.0627451, 0, 1, 1,
0.4608712, 0.01234979, 2.307085, 0.06666667, 0, 1, 1,
0.4676566, 1.663715, -0.2646071, 0.07450981, 0, 1, 1,
0.4741057, -0.3317892, 1.271013, 0.07843138, 0, 1, 1,
0.474859, -1.067575, 1.590894, 0.08627451, 0, 1, 1,
0.4761965, 0.6414845, -0.4323153, 0.09019608, 0, 1, 1,
0.4768942, -0.5007603, 4.306537, 0.09803922, 0, 1, 1,
0.4801434, -0.8836527, 2.247113, 0.1058824, 0, 1, 1,
0.482888, 0.7160876, 1.379057, 0.1098039, 0, 1, 1,
0.4836729, 0.8164761, 0.6277532, 0.1176471, 0, 1, 1,
0.4872146, -0.4810281, 1.868048, 0.1215686, 0, 1, 1,
0.4882035, 1.640099, 0.381646, 0.1294118, 0, 1, 1,
0.4900846, -0.6101814, 2.251146, 0.1333333, 0, 1, 1,
0.4911959, 1.093836, 0.5652002, 0.1411765, 0, 1, 1,
0.4930117, 0.3794703, 0.2639056, 0.145098, 0, 1, 1,
0.4943214, -1.172827, 2.675123, 0.1529412, 0, 1, 1,
0.4989457, -0.1180282, 1.060632, 0.1568628, 0, 1, 1,
0.4990787, -0.7258488, 2.074716, 0.1647059, 0, 1, 1,
0.5077507, 0.1313472, 0.6264949, 0.1686275, 0, 1, 1,
0.5085634, 0.3085907, 1.682731, 0.1764706, 0, 1, 1,
0.5086079, -1.506123, 3.498052, 0.1803922, 0, 1, 1,
0.5091524, -0.8580282, 2.366629, 0.1882353, 0, 1, 1,
0.5164101, 0.1587247, 1.11329, 0.1921569, 0, 1, 1,
0.5186919, -0.5870894, 3.145461, 0.2, 0, 1, 1,
0.5224055, 0.376222, 1.133437, 0.2078431, 0, 1, 1,
0.526671, -1.057228, 2.891404, 0.2117647, 0, 1, 1,
0.5268427, -0.4110271, 2.065042, 0.2196078, 0, 1, 1,
0.5276186, 0.7369145, 0.7467318, 0.2235294, 0, 1, 1,
0.5316478, -1.570608, 3.367278, 0.2313726, 0, 1, 1,
0.5324938, 0.0567311, 0.7522609, 0.2352941, 0, 1, 1,
0.5359004, -0.1902242, 1.619364, 0.2431373, 0, 1, 1,
0.5361623, -0.09965177, 3.291321, 0.2470588, 0, 1, 1,
0.5396834, -0.8420078, 2.060817, 0.254902, 0, 1, 1,
0.543627, -1.143114, 2.701672, 0.2588235, 0, 1, 1,
0.5443936, 0.6053927, 2.483859, 0.2666667, 0, 1, 1,
0.5447797, -0.8165868, 1.368327, 0.2705882, 0, 1, 1,
0.5460439, -1.006456, 3.803961, 0.2784314, 0, 1, 1,
0.5524312, -1.105925, 2.069343, 0.282353, 0, 1, 1,
0.5567172, -0.175367, 2.350864, 0.2901961, 0, 1, 1,
0.5618699, 0.9164851, 1.87913, 0.2941177, 0, 1, 1,
0.5639181, -0.3281192, 2.627561, 0.3019608, 0, 1, 1,
0.570622, 0.4421924, 1.351928, 0.3098039, 0, 1, 1,
0.5758919, 0.8146539, 0.1440922, 0.3137255, 0, 1, 1,
0.5785753, 1.2886, 0.7637619, 0.3215686, 0, 1, 1,
0.5871282, 0.2574577, -0.4142506, 0.3254902, 0, 1, 1,
0.5880665, 0.4654897, 2.237767, 0.3333333, 0, 1, 1,
0.5888192, 0.4187441, 1.515798, 0.3372549, 0, 1, 1,
0.5934379, 0.02405615, 2.278563, 0.345098, 0, 1, 1,
0.5982917, 0.5491834, 0.6981321, 0.3490196, 0, 1, 1,
0.6044695, 1.042704, 0.2573484, 0.3568628, 0, 1, 1,
0.6109998, -1.273239, 3.117309, 0.3607843, 0, 1, 1,
0.6154823, -0.1429368, 1.050832, 0.3686275, 0, 1, 1,
0.6166309, -0.1088046, 1.729593, 0.372549, 0, 1, 1,
0.6211612, -0.2552719, 1.894614, 0.3803922, 0, 1, 1,
0.6237243, 0.3741876, 2.295057, 0.3843137, 0, 1, 1,
0.6273021, 0.4432016, 1.671292, 0.3921569, 0, 1, 1,
0.6283577, 0.2918648, 0.249181, 0.3960784, 0, 1, 1,
0.6300343, 0.1446052, 1.695203, 0.4039216, 0, 1, 1,
0.6314549, 1.090125, 0.5129517, 0.4117647, 0, 1, 1,
0.6323335, -0.2572687, 3.55817, 0.4156863, 0, 1, 1,
0.6327133, 0.2022184, 1.474052, 0.4235294, 0, 1, 1,
0.6365397, 1.435038, -0.04562851, 0.427451, 0, 1, 1,
0.6372584, -1.203001, 0.5813037, 0.4352941, 0, 1, 1,
0.638691, 0.5707378, -0.9441727, 0.4392157, 0, 1, 1,
0.6415736, 1.079858, 0.5387412, 0.4470588, 0, 1, 1,
0.6436995, 0.208775, 0.8347037, 0.4509804, 0, 1, 1,
0.6444962, -0.3783494, 2.105713, 0.4588235, 0, 1, 1,
0.6452021, 0.7441272, 1.849198, 0.4627451, 0, 1, 1,
0.6459424, 0.04845859, 4.343546, 0.4705882, 0, 1, 1,
0.6462636, -0.2966263, -0.4052435, 0.4745098, 0, 1, 1,
0.6515269, 0.04134568, 1.989196, 0.4823529, 0, 1, 1,
0.653046, -0.8263074, 3.851283, 0.4862745, 0, 1, 1,
0.656594, 0.8718418, 0.1342836, 0.4941176, 0, 1, 1,
0.6566873, -0.7476798, 2.825061, 0.5019608, 0, 1, 1,
0.6635752, 0.5654395, 1.393629, 0.5058824, 0, 1, 1,
0.6674277, 0.6356505, 0.7062806, 0.5137255, 0, 1, 1,
0.6682715, -0.219005, 4.291992, 0.5176471, 0, 1, 1,
0.6714802, 0.4770467, 0.3577873, 0.5254902, 0, 1, 1,
0.674202, 0.07815212, 0.9306045, 0.5294118, 0, 1, 1,
0.6760135, -0.7577051, 1.793957, 0.5372549, 0, 1, 1,
0.6760542, -1.572039, 1.964732, 0.5411765, 0, 1, 1,
0.6804317, 0.6618556, 1.679879, 0.5490196, 0, 1, 1,
0.6808099, -0.1885194, 3.789294, 0.5529412, 0, 1, 1,
0.6816848, 0.9227209, -0.1437755, 0.5607843, 0, 1, 1,
0.6830395, -0.2903443, -0.08307466, 0.5647059, 0, 1, 1,
0.6842966, 0.77766, 1.522086, 0.572549, 0, 1, 1,
0.7058687, -0.3539724, 1.345964, 0.5764706, 0, 1, 1,
0.7094195, -1.086514, 1.814278, 0.5843138, 0, 1, 1,
0.7116681, 2.809088, 1.075988, 0.5882353, 0, 1, 1,
0.712118, 1.569602, 0.6152051, 0.5960785, 0, 1, 1,
0.7131042, 0.4366294, 1.158122, 0.6039216, 0, 1, 1,
0.7156533, -0.3778782, 2.123173, 0.6078432, 0, 1, 1,
0.7203616, 0.1531565, 2.247276, 0.6156863, 0, 1, 1,
0.7224696, 0.5939128, 2.295202, 0.6196079, 0, 1, 1,
0.7253692, 2.038223, 1.504087, 0.627451, 0, 1, 1,
0.731474, -2.065951, 0.5595064, 0.6313726, 0, 1, 1,
0.7320529, -1.057558, 3.005946, 0.6392157, 0, 1, 1,
0.7329151, -0.137317, 1.215399, 0.6431373, 0, 1, 1,
0.7337281, -0.3487484, 0.003757848, 0.6509804, 0, 1, 1,
0.7348639, -0.5495272, 2.137943, 0.654902, 0, 1, 1,
0.7372233, -0.1185947, 0.4614382, 0.6627451, 0, 1, 1,
0.7420926, 0.3934873, 0.8877957, 0.6666667, 0, 1, 1,
0.7468282, 2.752033, -0.5573393, 0.6745098, 0, 1, 1,
0.7485755, 0.6952123, 1.743636, 0.6784314, 0, 1, 1,
0.7495095, -2.107615, 1.111163, 0.6862745, 0, 1, 1,
0.7505057, 1.008176, 0.6017417, 0.6901961, 0, 1, 1,
0.7522153, -1.059411, 3.434049, 0.6980392, 0, 1, 1,
0.7601773, 0.1951247, 1.782214, 0.7058824, 0, 1, 1,
0.7601896, -1.394747, 0.9719311, 0.7098039, 0, 1, 1,
0.7626016, -0.8127078, 2.784416, 0.7176471, 0, 1, 1,
0.7660162, 0.8331776, -0.8241673, 0.7215686, 0, 1, 1,
0.7724317, 0.4381701, 0.9673604, 0.7294118, 0, 1, 1,
0.7732016, -0.2903896, 2.128721, 0.7333333, 0, 1, 1,
0.7763628, 1.206213, 0.08106596, 0.7411765, 0, 1, 1,
0.7771076, -1.344491, 3.65026, 0.7450981, 0, 1, 1,
0.7787983, -0.163038, 4.231049, 0.7529412, 0, 1, 1,
0.7796745, -1.164514, 2.101083, 0.7568628, 0, 1, 1,
0.7805935, 0.02639819, 1.480018, 0.7647059, 0, 1, 1,
0.7818099, -0.6765556, 1.678667, 0.7686275, 0, 1, 1,
0.7854778, 0.469771, 1.159457, 0.7764706, 0, 1, 1,
0.7871889, 0.3631386, 0.655848, 0.7803922, 0, 1, 1,
0.7886409, -0.1113821, 2.915743, 0.7882353, 0, 1, 1,
0.7898919, -1.666616, 3.205283, 0.7921569, 0, 1, 1,
0.7957837, -0.4470375, 0.7191458, 0.8, 0, 1, 1,
0.8116218, 0.1740213, -0.1827158, 0.8078431, 0, 1, 1,
0.8160746, -0.9892059, 2.904145, 0.8117647, 0, 1, 1,
0.8180479, 0.5196691, 1.791419, 0.8196079, 0, 1, 1,
0.8186431, -0.6180668, 1.884053, 0.8235294, 0, 1, 1,
0.8188452, -1.897499, 3.799368, 0.8313726, 0, 1, 1,
0.8256759, 0.4566332, 2.969162, 0.8352941, 0, 1, 1,
0.8263314, 0.6476545, 1.39202, 0.8431373, 0, 1, 1,
0.8335799, 0.279058, 0.8708798, 0.8470588, 0, 1, 1,
0.8342841, 1.305262, -0.1577447, 0.854902, 0, 1, 1,
0.8382467, 1.238461, 1.063464, 0.8588235, 0, 1, 1,
0.8395328, 1.692963, -0.8584573, 0.8666667, 0, 1, 1,
0.8396972, -0.9237269, 1.38318, 0.8705882, 0, 1, 1,
0.8411342, -1.128632, 3.534507, 0.8784314, 0, 1, 1,
0.851548, 0.1403478, 2.030715, 0.8823529, 0, 1, 1,
0.8535852, -1.091579, 1.138224, 0.8901961, 0, 1, 1,
0.8637651, -1.508573, 4.787259, 0.8941177, 0, 1, 1,
0.8745155, -0.5665188, 2.550213, 0.9019608, 0, 1, 1,
0.8763904, 1.075623, 0.6970974, 0.9098039, 0, 1, 1,
0.8778929, 0.4232584, 2.180078, 0.9137255, 0, 1, 1,
0.880018, 0.5391911, 0.869056, 0.9215686, 0, 1, 1,
0.8838747, 0.8122659, 0.9104731, 0.9254902, 0, 1, 1,
0.892692, -1.396724, 2.928073, 0.9333333, 0, 1, 1,
0.8945699, 0.7196237, 2.761306, 0.9372549, 0, 1, 1,
0.8964754, -1.256121, 2.502303, 0.945098, 0, 1, 1,
0.8982442, -0.2039626, 1.210131, 0.9490196, 0, 1, 1,
0.8985015, 1.248597, 2.197961, 0.9568627, 0, 1, 1,
0.9036644, -0.9692626, 2.57453, 0.9607843, 0, 1, 1,
0.9051642, -0.4914158, 3.290293, 0.9686275, 0, 1, 1,
0.9137235, -0.8663802, 1.659528, 0.972549, 0, 1, 1,
0.917963, 0.3095866, 3.201099, 0.9803922, 0, 1, 1,
0.9200765, 1.442893, -0.8349755, 0.9843137, 0, 1, 1,
0.9323722, 0.7264919, 0.4894231, 0.9921569, 0, 1, 1,
0.9368336, -0.337265, 2.216866, 0.9960784, 0, 1, 1,
0.9386353, -0.8358707, 2.463791, 1, 0, 0.9960784, 1,
0.950284, -0.2494914, 2.373316, 1, 0, 0.9882353, 1,
0.9517865, -0.2080166, 1.744434, 1, 0, 0.9843137, 1,
0.9555848, 0.07348336, 2.405195, 1, 0, 0.9764706, 1,
0.9565304, -0.3654887, 2.358914, 1, 0, 0.972549, 1,
0.9567827, -0.6047438, 3.528001, 1, 0, 0.9647059, 1,
0.9663908, -1.053313, 2.801741, 1, 0, 0.9607843, 1,
0.9699733, -0.4631527, 1.44327, 1, 0, 0.9529412, 1,
0.9732979, -0.2543499, 1.493845, 1, 0, 0.9490196, 1,
0.982914, 0.8706155, 1.038932, 1, 0, 0.9411765, 1,
0.9880049, -0.7251227, 0.9781727, 1, 0, 0.9372549, 1,
0.9971052, 0.9075927, 1.153352, 1, 0, 0.9294118, 1,
0.9972819, 0.3842867, 1.159695, 1, 0, 0.9254902, 1,
0.999655, -0.9798121, 2.922985, 1, 0, 0.9176471, 1,
1.008295, -0.1860337, 2.479493, 1, 0, 0.9137255, 1,
1.015714, 0.381888, 2.2263, 1, 0, 0.9058824, 1,
1.016437, 0.3312471, 1.647592, 1, 0, 0.9019608, 1,
1.020677, 0.1385802, 2.833073, 1, 0, 0.8941177, 1,
1.022008, 1.236934, 0.771655, 1, 0, 0.8862745, 1,
1.025059, -1.196988, 2.328365, 1, 0, 0.8823529, 1,
1.028543, 0.3866732, 1.713012, 1, 0, 0.8745098, 1,
1.035268, 1.529418, 0.9315746, 1, 0, 0.8705882, 1,
1.035729, -1.708534, 1.771081, 1, 0, 0.8627451, 1,
1.041631, -0.964554, 2.316967, 1, 0, 0.8588235, 1,
1.041754, 0.660911, 2.05452, 1, 0, 0.8509804, 1,
1.042621, -0.2805572, 0.7936129, 1, 0, 0.8470588, 1,
1.045598, -2.724079, 1.212749, 1, 0, 0.8392157, 1,
1.049698, -0.4603677, 1.597698, 1, 0, 0.8352941, 1,
1.054116, 0.201863, 0.9153308, 1, 0, 0.827451, 1,
1.055861, -2.233402, 3.403652, 1, 0, 0.8235294, 1,
1.055952, -0.965017, 1.840843, 1, 0, 0.8156863, 1,
1.056319, -0.3996237, 2.261368, 1, 0, 0.8117647, 1,
1.07512, 1.128977, 0.3251762, 1, 0, 0.8039216, 1,
1.075987, 0.5059934, 1.531252, 1, 0, 0.7960784, 1,
1.076544, -2.386421, 2.945193, 1, 0, 0.7921569, 1,
1.089272, 0.3354691, -0.03371549, 1, 0, 0.7843137, 1,
1.099905, 0.5752131, 1.569947, 1, 0, 0.7803922, 1,
1.103151, 0.08759544, 2.988143, 1, 0, 0.772549, 1,
1.108258, -0.5231334, 0.809082, 1, 0, 0.7686275, 1,
1.115082, -0.1753533, 3.271056, 1, 0, 0.7607843, 1,
1.117447, -0.06108228, 2.759575, 1, 0, 0.7568628, 1,
1.118993, 1.347267, 2.552672, 1, 0, 0.7490196, 1,
1.119002, 0.2553765, 1.246732, 1, 0, 0.7450981, 1,
1.124501, 0.2656627, 0.5619289, 1, 0, 0.7372549, 1,
1.129487, 1.417006, 0.1698974, 1, 0, 0.7333333, 1,
1.132805, -1.088673, 2.994151, 1, 0, 0.7254902, 1,
1.157327, -0.1499288, 0.9083929, 1, 0, 0.7215686, 1,
1.157961, 0.1865952, 3.398549, 1, 0, 0.7137255, 1,
1.161967, 0.9877459, -0.004839091, 1, 0, 0.7098039, 1,
1.171688, -2.832865, 2.885038, 1, 0, 0.7019608, 1,
1.173506, 1.064518, 2.52804, 1, 0, 0.6941177, 1,
1.181571, 1.902387, 0.4822727, 1, 0, 0.6901961, 1,
1.188134, 0.1315388, 2.955513, 1, 0, 0.682353, 1,
1.199162, 0.5421675, -1.40106, 1, 0, 0.6784314, 1,
1.210576, 0.4914008, 1.013755, 1, 0, 0.6705883, 1,
1.212804, -0.3503752, 0.7479385, 1, 0, 0.6666667, 1,
1.21489, -0.9170325, 1.876794, 1, 0, 0.6588235, 1,
1.215087, 0.4049215, 2.015544, 1, 0, 0.654902, 1,
1.216439, -0.4496858, -0.6344926, 1, 0, 0.6470588, 1,
1.216672, 0.1231889, -0.133515, 1, 0, 0.6431373, 1,
1.218617, 0.9813177, -0.5084692, 1, 0, 0.6352941, 1,
1.225806, 0.07203606, 1.461191, 1, 0, 0.6313726, 1,
1.230648, 0.6425546, 1.193842, 1, 0, 0.6235294, 1,
1.230681, 0.8183334, -0.2960477, 1, 0, 0.6196079, 1,
1.234163, 0.9739922, 1.044475, 1, 0, 0.6117647, 1,
1.244765, -0.5039775, 1.631628, 1, 0, 0.6078432, 1,
1.249711, -0.4892713, 3.541342, 1, 0, 0.6, 1,
1.251737, 1.398527, -0.0005915856, 1, 0, 0.5921569, 1,
1.254265, -0.378922, 2.517605, 1, 0, 0.5882353, 1,
1.25821, -0.1127703, 0.5373576, 1, 0, 0.5803922, 1,
1.259725, -1.023119, 0.9147545, 1, 0, 0.5764706, 1,
1.26551, -0.353216, 2.4719, 1, 0, 0.5686275, 1,
1.267287, 0.9910837, 0.813687, 1, 0, 0.5647059, 1,
1.271552, 0.3145292, 2.003864, 1, 0, 0.5568628, 1,
1.272647, -0.03158967, 0.3328891, 1, 0, 0.5529412, 1,
1.278665, -0.9359681, 2.387687, 1, 0, 0.5450981, 1,
1.27881, -0.1716467, 1.644383, 1, 0, 0.5411765, 1,
1.279237, -0.4823261, 0.2096156, 1, 0, 0.5333334, 1,
1.284127, 1.150567, 2.593654, 1, 0, 0.5294118, 1,
1.284236, -0.9374281, 2.056317, 1, 0, 0.5215687, 1,
1.28903, -0.4674653, 1.220919, 1, 0, 0.5176471, 1,
1.292789, 0.6536711, 2.013462, 1, 0, 0.509804, 1,
1.29377, -0.1817164, 1.941511, 1, 0, 0.5058824, 1,
1.294504, 0.1588985, 1.058382, 1, 0, 0.4980392, 1,
1.30343, 1.462094, 1.939217, 1, 0, 0.4901961, 1,
1.303533, 1.153806, 0.8223782, 1, 0, 0.4862745, 1,
1.308095, 0.2199503, 0.5132877, 1, 0, 0.4784314, 1,
1.312089, 0.2697603, 2.909744, 1, 0, 0.4745098, 1,
1.315877, 0.6186025, 1.611046, 1, 0, 0.4666667, 1,
1.316797, -1.771193, 4.046129, 1, 0, 0.4627451, 1,
1.330067, -3.116428, 2.670025, 1, 0, 0.454902, 1,
1.339424, -1.146693, 2.612803, 1, 0, 0.4509804, 1,
1.342247, -1.883583, 1.631978, 1, 0, 0.4431373, 1,
1.34707, -1.406884, 4.507944, 1, 0, 0.4392157, 1,
1.356649, -1.260126, 1.455491, 1, 0, 0.4313726, 1,
1.357988, 0.7686278, -0.981647, 1, 0, 0.427451, 1,
1.361126, -0.9643543, 1.963916, 1, 0, 0.4196078, 1,
1.361394, -1.429228, 3.411279, 1, 0, 0.4156863, 1,
1.37554, 0.1360874, 4.038622, 1, 0, 0.4078431, 1,
1.376468, -0.04645524, 2.321156, 1, 0, 0.4039216, 1,
1.381087, 1.220926, 1.55116, 1, 0, 0.3960784, 1,
1.397244, 0.6932539, 1.02183, 1, 0, 0.3882353, 1,
1.41496, -2.634817, 2.117348, 1, 0, 0.3843137, 1,
1.417087, -0.6138114, 1.226581, 1, 0, 0.3764706, 1,
1.421452, -0.4204189, 2.495564, 1, 0, 0.372549, 1,
1.453231, -0.08782427, 1.368506, 1, 0, 0.3647059, 1,
1.475755, -0.4553671, 1.905146, 1, 0, 0.3607843, 1,
1.48158, -1.495333, 3.537127, 1, 0, 0.3529412, 1,
1.482781, -0.1933814, 2.349283, 1, 0, 0.3490196, 1,
1.50979, 0.3189627, -0.02284853, 1, 0, 0.3411765, 1,
1.510914, 0.1718441, 1.719072, 1, 0, 0.3372549, 1,
1.543218, -1.2375, 2.204396, 1, 0, 0.3294118, 1,
1.559154, 0.3698054, -0.4509851, 1, 0, 0.3254902, 1,
1.564702, -1.945691, 3.345438, 1, 0, 0.3176471, 1,
1.578371, 0.1917726, 0.168007, 1, 0, 0.3137255, 1,
1.584589, 0.2471599, 1.455393, 1, 0, 0.3058824, 1,
1.602059, 1.858635, 2.935575, 1, 0, 0.2980392, 1,
1.616559, -0.1823937, -0.2246806, 1, 0, 0.2941177, 1,
1.640814, 0.1575898, 3.147043, 1, 0, 0.2862745, 1,
1.641627, -0.5101805, 2.150306, 1, 0, 0.282353, 1,
1.64233, -1.283198, 3.160732, 1, 0, 0.2745098, 1,
1.645702, -0.08457464, 0.5924775, 1, 0, 0.2705882, 1,
1.6495, -0.1901383, 1.255278, 1, 0, 0.2627451, 1,
1.650949, 1.591807, 0.3994889, 1, 0, 0.2588235, 1,
1.660479, -2.43613, 3.589596, 1, 0, 0.2509804, 1,
1.661206, -0.3074415, 2.512479, 1, 0, 0.2470588, 1,
1.683125, 1.342708, 1.681507, 1, 0, 0.2392157, 1,
1.68483, 1.680969, 0.5873664, 1, 0, 0.2352941, 1,
1.688533, -0.8531222, 3.419942, 1, 0, 0.227451, 1,
1.749196, 0.776786, 0.5188956, 1, 0, 0.2235294, 1,
1.765289, -0.2246681, 2.245939, 1, 0, 0.2156863, 1,
1.7777, 0.8655726, 1.300353, 1, 0, 0.2117647, 1,
1.787612, 1.175853, 0.891108, 1, 0, 0.2039216, 1,
1.796988, -0.09257122, 2.64059, 1, 0, 0.1960784, 1,
1.808, 1.010348, 0.1306113, 1, 0, 0.1921569, 1,
1.815031, 1.570653, 0.1463554, 1, 0, 0.1843137, 1,
1.823808, -0.2393015, 0.6978611, 1, 0, 0.1803922, 1,
1.845554, -1.284443, 2.347547, 1, 0, 0.172549, 1,
1.855331, -1.018484, 0.9435737, 1, 0, 0.1686275, 1,
1.880568, 1.439637, 1.843369, 1, 0, 0.1607843, 1,
1.883178, 1.30542, 0.8311315, 1, 0, 0.1568628, 1,
1.888617, -0.3828143, 2.728205, 1, 0, 0.1490196, 1,
1.926456, 0.3582121, 2.990593, 1, 0, 0.145098, 1,
1.940158, 0.8177834, 1.389058, 1, 0, 0.1372549, 1,
1.970051, -0.04656998, 1.261267, 1, 0, 0.1333333, 1,
2.020056, 1.369824, 0.8372868, 1, 0, 0.1254902, 1,
2.032737, 0.7066063, 1.166099, 1, 0, 0.1215686, 1,
2.050765, 1.575768, 1.377918, 1, 0, 0.1137255, 1,
2.058454, -0.09774377, 2.974702, 1, 0, 0.1098039, 1,
2.079915, 0.9138905, 1.533952, 1, 0, 0.1019608, 1,
2.168511, -0.8674639, 4.147266, 1, 0, 0.09411765, 1,
2.186656, -0.9887084, 1.569166, 1, 0, 0.09019608, 1,
2.328302, 2.190676, -0.1121746, 1, 0, 0.08235294, 1,
2.349954, -0.384373, 2.00506, 1, 0, 0.07843138, 1,
2.358157, 0.1634122, 0.5769547, 1, 0, 0.07058824, 1,
2.366281, -1.712239, 2.943407, 1, 0, 0.06666667, 1,
2.388088, -0.05556259, 0.7087617, 1, 0, 0.05882353, 1,
2.39015, 1.690406, 0.4595742, 1, 0, 0.05490196, 1,
2.407114, -0.09082012, 1.064604, 1, 0, 0.04705882, 1,
2.463951, -0.01326196, 0.8177881, 1, 0, 0.04313726, 1,
2.491278, 2.598066, 1.174828, 1, 0, 0.03529412, 1,
2.510363, 2.094471, 0.5484012, 1, 0, 0.03137255, 1,
2.557528, -0.4120156, 2.840286, 1, 0, 0.02352941, 1,
2.627866, -0.9882193, 3.675384, 1, 0, 0.01960784, 1,
2.776052, 0.6621489, 0.4657779, 1, 0, 0.01176471, 1,
4.655884, -0.6763057, 1.856507, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.3639286, -4.220218, -7.868382, 0, -0.5, 0.5, 0.5,
0.3639286, -4.220218, -7.868382, 1, -0.5, 0.5, 0.5,
0.3639286, -4.220218, -7.868382, 1, 1.5, 0.5, 0.5,
0.3639286, -4.220218, -7.868382, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.383, 0.1395897, -7.868382, 0, -0.5, 0.5, 0.5,
-5.383, 0.1395897, -7.868382, 1, -0.5, 0.5, 0.5,
-5.383, 0.1395897, -7.868382, 1, 1.5, 0.5, 0.5,
-5.383, 0.1395897, -7.868382, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.383, -4.220218, -0.3039711, 0, -0.5, 0.5, 0.5,
-5.383, -4.220218, -0.3039711, 1, -0.5, 0.5, 0.5,
-5.383, -4.220218, -0.3039711, 1, 1.5, 0.5, 0.5,
-5.383, -4.220218, -0.3039711, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.214108, -6.122748,
4, -3.214108, -6.122748,
-2, -3.214108, -6.122748,
-2, -3.381793, -6.413687,
0, -3.214108, -6.122748,
0, -3.381793, -6.413687,
2, -3.214108, -6.122748,
2, -3.381793, -6.413687,
4, -3.214108, -6.122748,
4, -3.381793, -6.413687
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.717163, -6.995565, 0, -0.5, 0.5, 0.5,
-2, -3.717163, -6.995565, 1, -0.5, 0.5, 0.5,
-2, -3.717163, -6.995565, 1, 1.5, 0.5, 0.5,
-2, -3.717163, -6.995565, 0, 1.5, 0.5, 0.5,
0, -3.717163, -6.995565, 0, -0.5, 0.5, 0.5,
0, -3.717163, -6.995565, 1, -0.5, 0.5, 0.5,
0, -3.717163, -6.995565, 1, 1.5, 0.5, 0.5,
0, -3.717163, -6.995565, 0, 1.5, 0.5, 0.5,
2, -3.717163, -6.995565, 0, -0.5, 0.5, 0.5,
2, -3.717163, -6.995565, 1, -0.5, 0.5, 0.5,
2, -3.717163, -6.995565, 1, 1.5, 0.5, 0.5,
2, -3.717163, -6.995565, 0, 1.5, 0.5, 0.5,
4, -3.717163, -6.995565, 0, -0.5, 0.5, 0.5,
4, -3.717163, -6.995565, 1, -0.5, 0.5, 0.5,
4, -3.717163, -6.995565, 1, 1.5, 0.5, 0.5,
4, -3.717163, -6.995565, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-4.056786, -3, -6.122748,
-4.056786, 3, -6.122748,
-4.056786, -3, -6.122748,
-4.277822, -3, -6.413687,
-4.056786, -2, -6.122748,
-4.277822, -2, -6.413687,
-4.056786, -1, -6.122748,
-4.277822, -1, -6.413687,
-4.056786, 0, -6.122748,
-4.277822, 0, -6.413687,
-4.056786, 1, -6.122748,
-4.277822, 1, -6.413687,
-4.056786, 2, -6.122748,
-4.277822, 2, -6.413687,
-4.056786, 3, -6.122748,
-4.277822, 3, -6.413687
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.719893, -3, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, -3, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, -3, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, -3, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, -2, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, -2, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, -2, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, -2, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, -1, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, -1, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, -1, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, -1, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, 0, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, 0, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, 0, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, 0, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, 1, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, 1, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, 1, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, 1, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, 2, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, 2, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, 2, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, 2, -6.995565, 0, 1.5, 0.5, 0.5,
-4.719893, 3, -6.995565, 0, -0.5, 0.5, 0.5,
-4.719893, 3, -6.995565, 1, -0.5, 0.5, 0.5,
-4.719893, 3, -6.995565, 1, 1.5, 0.5, 0.5,
-4.719893, 3, -6.995565, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-4.056786, -3.214108, -4,
-4.056786, -3.214108, 4,
-4.056786, -3.214108, -4,
-4.277822, -3.381793, -4,
-4.056786, -3.214108, -2,
-4.277822, -3.381793, -2,
-4.056786, -3.214108, 0,
-4.277822, -3.381793, 0,
-4.056786, -3.214108, 2,
-4.277822, -3.381793, 2,
-4.056786, -3.214108, 4,
-4.277822, -3.381793, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.719893, -3.717163, -4, 0, -0.5, 0.5, 0.5,
-4.719893, -3.717163, -4, 1, -0.5, 0.5, 0.5,
-4.719893, -3.717163, -4, 1, 1.5, 0.5, 0.5,
-4.719893, -3.717163, -4, 0, 1.5, 0.5, 0.5,
-4.719893, -3.717163, -2, 0, -0.5, 0.5, 0.5,
-4.719893, -3.717163, -2, 1, -0.5, 0.5, 0.5,
-4.719893, -3.717163, -2, 1, 1.5, 0.5, 0.5,
-4.719893, -3.717163, -2, 0, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 0, 0, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 0, 1, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 0, 1, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 0, 0, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 2, 0, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 2, 1, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 2, 1, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 2, 0, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 4, 0, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 4, 1, -0.5, 0.5, 0.5,
-4.719893, -3.717163, 4, 1, 1.5, 0.5, 0.5,
-4.719893, -3.717163, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-4.056786, -3.214108, -6.122748,
-4.056786, 3.493288, -6.122748,
-4.056786, -3.214108, 5.514806,
-4.056786, 3.493288, 5.514806,
-4.056786, -3.214108, -6.122748,
-4.056786, -3.214108, 5.514806,
-4.056786, 3.493288, -6.122748,
-4.056786, 3.493288, 5.514806,
-4.056786, -3.214108, -6.122748,
4.784643, -3.214108, -6.122748,
-4.056786, -3.214108, 5.514806,
4.784643, -3.214108, 5.514806,
-4.056786, 3.493288, -6.122748,
4.784643, 3.493288, -6.122748,
-4.056786, 3.493288, 5.514806,
4.784643, 3.493288, 5.514806,
4.784643, -3.214108, -6.122748,
4.784643, 3.493288, -6.122748,
4.784643, -3.214108, 5.514806,
4.784643, 3.493288, 5.514806,
4.784643, -3.214108, -6.122748,
4.784643, -3.214108, 5.514806,
4.784643, 3.493288, -6.122748,
4.784643, 3.493288, 5.514806
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.586845;
var distance = 38.20384;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3639286, -0.1395897, 0.3039711 );
mvMatrix.scale( 1.050086, 1.384183, 0.7977848 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.20384);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Propoxur<-read.table("Propoxur.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propoxur$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
```

```r
y<-Propoxur$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
```

```r
z<-Propoxur$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.928027, 0.2888754, -0.5216777, 0, 0, 1, 1, 1,
-3.235659, 1.333592, 0.1828202, 1, 0, 0, 1, 1,
-3.150114, 0.5852123, -2.604511, 1, 0, 0, 1, 1,
-2.950166, 0.5252133, -1.312217, 1, 0, 0, 1, 1,
-2.938245, -0.2701938, -2.770961, 1, 0, 0, 1, 1,
-2.704261, 0.04147771, -1.624003, 1, 0, 0, 1, 1,
-2.611202, 1.368934, -1.261997, 0, 0, 0, 1, 1,
-2.59941, -1.120529, -2.417179, 0, 0, 0, 1, 1,
-2.559676, 0.7153946, -1.597329, 0, 0, 0, 1, 1,
-2.558767, -0.8421732, -0.6590431, 0, 0, 0, 1, 1,
-2.501909, 0.5478047, -0.233551, 0, 0, 0, 1, 1,
-2.420917, -0.1596048, -0.520409, 0, 0, 0, 1, 1,
-2.396245, 0.02530982, -1.252294, 0, 0, 0, 1, 1,
-2.381662, -1.039052, 0.02866844, 1, 1, 1, 1, 1,
-2.366268, -0.09633355, -1.104611, 1, 1, 1, 1, 1,
-2.222259, 0.2451417, -1.765866, 1, 1, 1, 1, 1,
-2.197178, -0.5685489, -1.268601, 1, 1, 1, 1, 1,
-2.107892, 0.7100326, -1.153227, 1, 1, 1, 1, 1,
-2.082791, -0.3882123, -1.611383, 1, 1, 1, 1, 1,
-2.052097, -0.9654183, -3.564353, 1, 1, 1, 1, 1,
-2.039075, 1.063958, -0.2662593, 1, 1, 1, 1, 1,
-2.034062, 0.6702201, -1.645084, 1, 1, 1, 1, 1,
-2.028563, -0.9519074, -2.910362, 1, 1, 1, 1, 1,
-1.994796, 0.2516385, -2.349495, 1, 1, 1, 1, 1,
-1.974468, -0.2004219, -2.558405, 1, 1, 1, 1, 1,
-1.969232, -1.287765, -1.991621, 1, 1, 1, 1, 1,
-1.968165, 1.781692, -1.516786, 1, 1, 1, 1, 1,
-1.943796, -0.6471092, -0.6122706, 1, 1, 1, 1, 1,
-1.933734, -0.3246122, -1.068521, 0, 0, 1, 1, 1,
-1.927153, -1.778979, -2.870117, 1, 0, 0, 1, 1,
-1.926235, 0.7916052, -1.795642, 1, 0, 0, 1, 1,
-1.923077, -0.8492282, -3.125834, 1, 0, 0, 1, 1,
-1.91892, -0.782244, -2.289491, 1, 0, 0, 1, 1,
-1.914975, -0.6894028, -3.79466, 1, 0, 0, 1, 1,
-1.901468, -0.1380712, -1.206309, 0, 0, 0, 1, 1,
-1.892687, 2.025927, -0.5468609, 0, 0, 0, 1, 1,
-1.892387, 0.3015599, 0.2244041, 0, 0, 0, 1, 1,
-1.867256, 0.653912, 0.5556511, 0, 0, 0, 1, 1,
-1.865909, 1.471094, 1.076539, 0, 0, 0, 1, 1,
-1.855603, 0.6431073, -3.001211, 0, 0, 0, 1, 1,
-1.833017, -0.6172054, -0.7448307, 0, 0, 0, 1, 1,
-1.779621, 0.5245594, -1.134762, 1, 1, 1, 1, 1,
-1.758364, -0.8672928, -2.143206, 1, 1, 1, 1, 1,
-1.754176, 0.6313782, 1.065909, 1, 1, 1, 1, 1,
-1.728686, 0.5229121, -0.638481, 1, 1, 1, 1, 1,
-1.722331, -1.247835, -1.788823, 1, 1, 1, 1, 1,
-1.710976, -1.530623, -1.980488, 1, 1, 1, 1, 1,
-1.707114, -0.1691208, -1.615736, 1, 1, 1, 1, 1,
-1.699775, 0.4085131, -0.2924744, 1, 1, 1, 1, 1,
-1.698092, 0.0460542, -1.910172, 1, 1, 1, 1, 1,
-1.697387, 0.304083, -2.344267, 1, 1, 1, 1, 1,
-1.671214, 0.2239629, -1.4566, 1, 1, 1, 1, 1,
-1.668277, 0.655004, -2.237978, 1, 1, 1, 1, 1,
-1.668203, -0.6479489, -0.9591786, 1, 1, 1, 1, 1,
-1.665594, -1.33698, -2.467613, 1, 1, 1, 1, 1,
-1.653436, -1.038537, -2.049693, 1, 1, 1, 1, 1,
-1.640154, 0.8647351, -1.392087, 0, 0, 1, 1, 1,
-1.633615, -1.103213, -0.973415, 1, 0, 0, 1, 1,
-1.630914, 1.936052, -1.06734, 1, 0, 0, 1, 1,
-1.62514, 1.997762, 0.6660325, 1, 0, 0, 1, 1,
-1.618713, 0.600238, -2.523891, 1, 0, 0, 1, 1,
-1.607412, -1.03224, -1.376211, 1, 0, 0, 1, 1,
-1.599741, 0.2492667, -3.539168, 0, 0, 0, 1, 1,
-1.58506, 0.7339501, -1.572127, 0, 0, 0, 1, 1,
-1.582195, -0.8971538, -2.460289, 0, 0, 0, 1, 1,
-1.577639, -0.6439857, -0.7293234, 0, 0, 0, 1, 1,
-1.544459, -0.2349387, 0.7115675, 0, 0, 0, 1, 1,
-1.530062, -1.338149, -3.201782, 0, 0, 0, 1, 1,
-1.518089, 0.8722721, 0.5287279, 0, 0, 0, 1, 1,
-1.493604, 1.549305, -0.4344612, 1, 1, 1, 1, 1,
-1.493356, 1.343806, -1.677948, 1, 1, 1, 1, 1,
-1.486258, -0.2730747, -1.803805, 1, 1, 1, 1, 1,
-1.474534, 0.8336192, -1.647255, 1, 1, 1, 1, 1,
-1.473633, 0.1445797, -1.133372, 1, 1, 1, 1, 1,
-1.451293, -0.4758163, -1.85993, 1, 1, 1, 1, 1,
-1.450833, -0.05410999, -1.639621, 1, 1, 1, 1, 1,
-1.440118, 0.6070441, -0.9411011, 1, 1, 1, 1, 1,
-1.437139, -0.197052, -0.8539672, 1, 1, 1, 1, 1,
-1.430575, 0.1978189, -2.189873, 1, 1, 1, 1, 1,
-1.419299, 0.7903798, -1.238351, 1, 1, 1, 1, 1,
-1.410446, -0.1465077, -3.238209, 1, 1, 1, 1, 1,
-1.400577, 0.938552, -0.191348, 1, 1, 1, 1, 1,
-1.390543, -0.3468565, -1.333965, 1, 1, 1, 1, 1,
-1.385859, 1.327078, 0.1709999, 1, 1, 1, 1, 1,
-1.375635, 0.2217863, -0.949903, 0, 0, 1, 1, 1,
-1.375244, -0.4425076, -1.021411, 1, 0, 0, 1, 1,
-1.375141, -1.42019, -2.466593, 1, 0, 0, 1, 1,
-1.373786, 1.573849, -2.295908, 1, 0, 0, 1, 1,
-1.365131, -1.128165, -2.615098, 1, 0, 0, 1, 1,
-1.358346, -0.5720543, 0.1684255, 1, 0, 0, 1, 1,
-1.352508, -0.0778871, -1.462269, 0, 0, 0, 1, 1,
-1.33703, 0.2413737, -2.801105, 0, 0, 0, 1, 1,
-1.334984, 0.6752741, 0.1172396, 0, 0, 0, 1, 1,
-1.332178, -0.3460397, -1.888514, 0, 0, 0, 1, 1,
-1.330189, 0.5113189, -0.1270715, 0, 0, 0, 1, 1,
-1.327773, 0.7693269, -2.074767, 0, 0, 0, 1, 1,
-1.327382, 0.5155735, -0.3788956, 0, 0, 0, 1, 1,
-1.326377, 1.004402, 0.1066385, 1, 1, 1, 1, 1,
-1.324256, -0.3428674, -2.975503, 1, 1, 1, 1, 1,
-1.323889, -1.348521, -0.4454284, 1, 1, 1, 1, 1,
-1.321029, 0.2501709, -1.395276, 1, 1, 1, 1, 1,
-1.276936, -0.6849469, -1.196328, 1, 1, 1, 1, 1,
-1.270507, 0.3824636, -0.7301059, 1, 1, 1, 1, 1,
-1.267784, 1.24903, -1.230046, 1, 1, 1, 1, 1,
-1.265713, -2.197053, -3.803187, 1, 1, 1, 1, 1,
-1.255465, 0.1009435, -2.190723, 1, 1, 1, 1, 1,
-1.247698, -0.8370466, -1.260993, 1, 1, 1, 1, 1,
-1.246051, -0.1026829, -1.84588, 1, 1, 1, 1, 1,
-1.239395, 0.566762, -0.560051, 1, 1, 1, 1, 1,
-1.23692, 0.6892096, -0.3213482, 1, 1, 1, 1, 1,
-1.233839, -0.03781416, -0.4232, 1, 1, 1, 1, 1,
-1.221585, -1.49264, -3.759601, 1, 1, 1, 1, 1,
-1.211871, -1.073739, -1.822924, 0, 0, 1, 1, 1,
-1.210024, -0.7353961, -1.434979, 1, 0, 0, 1, 1,
-1.20917, -0.3644044, -2.024653, 1, 0, 0, 1, 1,
-1.206951, 1.321371, 0.5716611, 1, 0, 0, 1, 1,
-1.203554, 1.123737, 0.252701, 1, 0, 0, 1, 1,
-1.202591, -0.0763972, -2.391989, 1, 0, 0, 1, 1,
-1.202163, 1.807684, -1.031774, 0, 0, 0, 1, 1,
-1.200058, -0.3271017, -1.858272, 0, 0, 0, 1, 1,
-1.192768, 0.06014536, -0.9299359, 0, 0, 0, 1, 1,
-1.192574, -0.3281082, -0.4937528, 0, 0, 0, 1, 1,
-1.181009, -1.122924, -1.669209, 0, 0, 0, 1, 1,
-1.174682, 1.464126, 0.5252259, 0, 0, 0, 1, 1,
-1.173278, 0.2824112, -0.933718, 0, 0, 0, 1, 1,
-1.172772, -0.03849203, -1.026159, 1, 1, 1, 1, 1,
-1.163564, -0.4814807, -0.3234082, 1, 1, 1, 1, 1,
-1.163542, -0.7393595, -1.320158, 1, 1, 1, 1, 1,
-1.148572, -1.398962, -2.499136, 1, 1, 1, 1, 1,
-1.142115, -0.3466112, -2.508872, 1, 1, 1, 1, 1,
-1.140237, 1.39553, -0.730349, 1, 1, 1, 1, 1,
-1.133233, 0.9558619, -0.8514627, 1, 1, 1, 1, 1,
-1.132744, -0.9112224, -2.652797, 1, 1, 1, 1, 1,
-1.124611, 0.4198686, -1.23968, 1, 1, 1, 1, 1,
-1.122713, 1.219269, 0.2484023, 1, 1, 1, 1, 1,
-1.104815, -1.103444, -3.502448, 1, 1, 1, 1, 1,
-1.098543, 0.4193684, -1.692148, 1, 1, 1, 1, 1,
-1.08496, 0.829059, -1.655744, 1, 1, 1, 1, 1,
-1.079694, -1.308283, -2.434232, 1, 1, 1, 1, 1,
-1.07072, 1.519355, -2.636206, 1, 1, 1, 1, 1,
-1.063252, -1.133727, -2.707875, 0, 0, 1, 1, 1,
-1.059482, -1.382941, -2.848897, 1, 0, 0, 1, 1,
-1.058333, -0.2767018, -0.5519291, 1, 0, 0, 1, 1,
-1.055675, -0.2175324, -0.1814261, 1, 0, 0, 1, 1,
-1.051203, -0.09881189, -1.777034, 1, 0, 0, 1, 1,
-1.049434, 1.523149, -1.376114, 1, 0, 0, 1, 1,
-1.044456, 0.3526689, -3.44883, 0, 0, 0, 1, 1,
-1.037573, 0.01504067, -1.951339, 0, 0, 0, 1, 1,
-1.035567, 0.2988642, -1.059264, 0, 0, 0, 1, 1,
-1.034195, -0.04621679, -1.636882, 0, 0, 0, 1, 1,
-1.031061, -0.02396019, -1.69367, 0, 0, 0, 1, 1,
-1.030861, -0.5888717, -2.394868, 0, 0, 0, 1, 1,
-1.029966, -1.192084, -2.413563, 0, 0, 0, 1, 1,
-1.028294, 2.354997, -0.6646165, 1, 1, 1, 1, 1,
-1.02647, -0.733844, -1.809879, 1, 1, 1, 1, 1,
-1.025926, -1.138265, -0.6057293, 1, 1, 1, 1, 1,
-1.020097, -0.3115431, -2.231047, 1, 1, 1, 1, 1,
-1.01535, 0.3194941, -1.830135, 1, 1, 1, 1, 1,
-1.012628, 0.900658, -1.448231, 1, 1, 1, 1, 1,
-1.00201, 1.234043, -0.3755779, 1, 1, 1, 1, 1,
-0.9995608, 1.237334, -0.4973251, 1, 1, 1, 1, 1,
-0.9976367, 0.9228762, -0.952427, 1, 1, 1, 1, 1,
-0.9928989, -0.2228675, -1.72245, 1, 1, 1, 1, 1,
-0.9885208, -1.347412, -1.959677, 1, 1, 1, 1, 1,
-0.9856403, 0.4843916, 0.3715456, 1, 1, 1, 1, 1,
-0.983438, -0.1154042, -1.937487, 1, 1, 1, 1, 1,
-0.9803881, 1.588939, -0.3492948, 1, 1, 1, 1, 1,
-0.9790912, -1.250405, -2.699536, 1, 1, 1, 1, 1,
-0.9762945, 1.276657, 0.5410975, 0, 0, 1, 1, 1,
-0.9760552, 2.083834, 0.3748845, 1, 0, 0, 1, 1,
-0.9729303, 0.9280751, -1.006846, 1, 0, 0, 1, 1,
-0.9687871, 1.59083, -0.4022582, 1, 0, 0, 1, 1,
-0.9683653, -0.9566185, -4.607085, 1, 0, 0, 1, 1,
-0.9681556, 1.918197, -0.7005057, 1, 0, 0, 1, 1,
-0.9430061, -0.937622, -2.500428, 0, 0, 0, 1, 1,
-0.9426318, -1.3129, -0.0008186223, 0, 0, 0, 1, 1,
-0.9409473, -1.590132, -2.426439, 0, 0, 0, 1, 1,
-0.9407949, 0.9394033, -0.3247923, 0, 0, 0, 1, 1,
-0.9377553, -0.3312229, -1.419269, 0, 0, 0, 1, 1,
-0.9348057, 1.347434, -1.69226, 0, 0, 0, 1, 1,
-0.9326421, 0.6044534, -1.922806, 0, 0, 0, 1, 1,
-0.9317805, 1.617208, -1.617622, 1, 1, 1, 1, 1,
-0.931291, -1.266687, -1.51387, 1, 1, 1, 1, 1,
-0.9079503, 0.9853562, 0.7721259, 1, 1, 1, 1, 1,
-0.9039344, -0.8412275, -1.002221, 1, 1, 1, 1, 1,
-0.90042, 1.151551, -0.5209231, 1, 1, 1, 1, 1,
-0.8965284, -1.614418, -2.765047, 1, 1, 1, 1, 1,
-0.8956625, -0.3156791, -2.547157, 1, 1, 1, 1, 1,
-0.8866863, 1.012661, 0.4729837, 1, 1, 1, 1, 1,
-0.8859107, -1.441258, -2.944364, 1, 1, 1, 1, 1,
-0.8844305, 0.7770295, -0.7838379, 1, 1, 1, 1, 1,
-0.8805169, -1.808532, -2.590623, 1, 1, 1, 1, 1,
-0.8627109, -1.315943, -4.001397, 1, 1, 1, 1, 1,
-0.8557188, -0.1063047, -1.099096, 1, 1, 1, 1, 1,
-0.8527421, 0.2956762, -0.7912375, 1, 1, 1, 1, 1,
-0.8481237, 0.2505947, -1.517512, 1, 1, 1, 1, 1,
-0.8470166, -0.1385867, -0.7954024, 0, 0, 1, 1, 1,
-0.8444426, 0.0378634, -1.533754, 1, 0, 0, 1, 1,
-0.8393716, 0.524038, -1.819774, 1, 0, 0, 1, 1,
-0.833186, -1.450054, -1.86321, 1, 0, 0, 1, 1,
-0.8307468, 1.292057, 0.08839317, 1, 0, 0, 1, 1,
-0.8284954, -0.01154924, -1.423613, 1, 0, 0, 1, 1,
-0.8257849, -0.2200818, -2.173956, 0, 0, 0, 1, 1,
-0.8222836, -1.381842, -2.03336, 0, 0, 0, 1, 1,
-0.822273, -2.290712, -4.087974, 0, 0, 0, 1, 1,
-0.8163435, -0.5722474, -0.008188382, 0, 0, 0, 1, 1,
-0.8158195, 0.0772358, -1.267765, 0, 0, 0, 1, 1,
-0.8121554, 0.4576063, -0.6836747, 0, 0, 0, 1, 1,
-0.8055491, 0.8916641, 0.3627906, 0, 0, 0, 1, 1,
-0.8034979, -0.08803659, -2.27322, 1, 1, 1, 1, 1,
-0.8016042, 0.5668592, -0.7324356, 1, 1, 1, 1, 1,
-0.7990256, -0.3447316, -1.455025, 1, 1, 1, 1, 1,
-0.7971083, 0.3330417, -2.11575, 1, 1, 1, 1, 1,
-0.7918197, 1.588996, -0.9578614, 1, 1, 1, 1, 1,
-0.7888266, 0.1627037, -0.7157452, 1, 1, 1, 1, 1,
-0.7883589, 0.9482629, 0.281058, 1, 1, 1, 1, 1,
-0.7818012, 0.7737271, -0.1420465, 1, 1, 1, 1, 1,
-0.7727622, 0.4007143, -2.203143, 1, 1, 1, 1, 1,
-0.7499918, -1.868216, -0.9058925, 1, 1, 1, 1, 1,
-0.7479563, 0.4071033, -0.8196064, 1, 1, 1, 1, 1,
-0.746626, 0.6501888, -0.9057175, 1, 1, 1, 1, 1,
-0.7421821, 0.2342259, -0.6467178, 1, 1, 1, 1, 1,
-0.7421375, -0.4734327, -3.14392, 1, 1, 1, 1, 1,
-0.7382487, -0.9862187, -2.694798, 1, 1, 1, 1, 1,
-0.7381926, -0.4804014, -2.023486, 0, 0, 1, 1, 1,
-0.7345108, -1.48512, -3.048482, 1, 0, 0, 1, 1,
-0.7311608, -0.7216575, -2.727427, 1, 0, 0, 1, 1,
-0.7310472, 1.866115, -0.3735984, 1, 0, 0, 1, 1,
-0.7189929, -0.5053251, -2.338265, 1, 0, 0, 1, 1,
-0.7171642, -0.2632941, -2.846766, 1, 0, 0, 1, 1,
-0.7150074, -0.6085865, -0.704116, 0, 0, 0, 1, 1,
-0.7106455, -1.229575, -1.051892, 0, 0, 0, 1, 1,
-0.7058957, -0.1592462, -1.43942, 0, 0, 0, 1, 1,
-0.7047449, 0.631762, -0.218931, 0, 0, 0, 1, 1,
-0.7025028, -0.1013255, -2.345634, 0, 0, 0, 1, 1,
-0.6975149, -1.702842, -2.124873, 0, 0, 0, 1, 1,
-0.6959976, 1.421835, -1.087235, 0, 0, 0, 1, 1,
-0.6952974, 0.9419349, 0.2937632, 1, 1, 1, 1, 1,
-0.6903066, 0.8670366, -0.976668, 1, 1, 1, 1, 1,
-0.6897141, 0.3031715, -0.07224238, 1, 1, 1, 1, 1,
-0.6884173, -0.4003027, -1.914577, 1, 1, 1, 1, 1,
-0.6842078, 0.4577862, -2.001544, 1, 1, 1, 1, 1,
-0.6806025, 1.849133, -1.963825, 1, 1, 1, 1, 1,
-0.6802117, -0.8781306, -2.962748, 1, 1, 1, 1, 1,
-0.6799847, -0.5355068, -3.53388, 1, 1, 1, 1, 1,
-0.6772095, 0.6157243, 0.1103133, 1, 1, 1, 1, 1,
-0.6771337, -1.455522, -2.567533, 1, 1, 1, 1, 1,
-0.6652189, 0.03284445, -2.509428, 1, 1, 1, 1, 1,
-0.6627482, 0.1791586, -1.293658, 1, 1, 1, 1, 1,
-0.6551639, 0.5598709, 0.0188024, 1, 1, 1, 1, 1,
-0.6528062, -0.1818162, -2.698341, 1, 1, 1, 1, 1,
-0.6489707, -0.2785985, -2.639997, 1, 1, 1, 1, 1,
-0.6485031, -0.01030397, -3.108479, 0, 0, 1, 1, 1,
-0.6450964, -0.263166, -2.284832, 1, 0, 0, 1, 1,
-0.6436993, 0.2418639, -0.9657987, 1, 0, 0, 1, 1,
-0.6415157, -1.543395, -3.719608, 1, 0, 0, 1, 1,
-0.6409644, 1.01636, -1.268969, 1, 0, 0, 1, 1,
-0.6335921, 1.212947, 0.7008888, 1, 0, 0, 1, 1,
-0.6297944, -1.002486, -3.301281, 0, 0, 0, 1, 1,
-0.6278763, 0.8603646, -0.804833, 0, 0, 0, 1, 1,
-0.6263053, 2.010864, 0.3338774, 0, 0, 0, 1, 1,
-0.6248801, -0.1698514, -1.71217, 0, 0, 0, 1, 1,
-0.6225172, 0.6339599, 1.196519, 0, 0, 0, 1, 1,
-0.6206087, 0.3963808, -1.455638, 0, 0, 0, 1, 1,
-0.61702, 0.7207263, -1.899133, 0, 0, 0, 1, 1,
-0.6153142, -0.1998911, -1.932931, 1, 1, 1, 1, 1,
-0.6145292, -1.328839, -1.885396, 1, 1, 1, 1, 1,
-0.6131508, -0.8311405, -1.837963, 1, 1, 1, 1, 1,
-0.6096796, 0.9468313, -2.147311, 1, 1, 1, 1, 1,
-0.599426, 1.623818, -0.2060317, 1, 1, 1, 1, 1,
-0.5967256, 1.24826, 0.8005349, 1, 1, 1, 1, 1,
-0.5934312, -0.2065287, -2.894181, 1, 1, 1, 1, 1,
-0.5920499, -1.264273, -3.68453, 1, 1, 1, 1, 1,
-0.5888745, -0.220308, -0.6268334, 1, 1, 1, 1, 1,
-0.5880657, 0.6748528, 0.4292406, 1, 1, 1, 1, 1,
-0.5846967, 1.318878, -0.5012613, 1, 1, 1, 1, 1,
-0.5782949, 1.390451, -0.4010452, 1, 1, 1, 1, 1,
-0.5749277, -0.03775714, -1.635601, 1, 1, 1, 1, 1,
-0.5747226, 0.5245264, 0.9452481, 1, 1, 1, 1, 1,
-0.5731297, 0.3351589, 0.1907398, 1, 1, 1, 1, 1,
-0.5697811, -0.1899064, -1.924746, 0, 0, 1, 1, 1,
-0.5666703, 1.534624, 0.2402177, 1, 0, 0, 1, 1,
-0.5612454, -1.013736, 0.08263362, 1, 0, 0, 1, 1,
-0.5552258, -0.4927072, -3.864858, 1, 0, 0, 1, 1,
-0.5536377, -0.5765461, -1.230157, 1, 0, 0, 1, 1,
-0.5505373, -0.3187899, -2.215809, 1, 0, 0, 1, 1,
-0.5501741, 1.381392, -2.197611, 0, 0, 0, 1, 1,
-0.5482533, 1.03789, 0.9638014, 0, 0, 0, 1, 1,
-0.545864, 0.8551425, -3.024112, 0, 0, 0, 1, 1,
-0.5457377, -0.3043915, -1.409096, 0, 0, 0, 1, 1,
-0.5400928, 0.04580073, -1.486302, 0, 0, 0, 1, 1,
-0.5371042, 0.7920216, -1.012246, 0, 0, 0, 1, 1,
-0.5353115, -2.135861, -3.307375, 0, 0, 0, 1, 1,
-0.5327157, 0.09105782, -3.54889, 1, 1, 1, 1, 1,
-0.5230708, 1.533283, 0.1932064, 1, 1, 1, 1, 1,
-0.5213383, -0.9044956, -3.671363, 1, 1, 1, 1, 1,
-0.5172672, 0.06388114, -0.8581986, 1, 1, 1, 1, 1,
-0.514412, -0.8932883, -3.946211, 1, 1, 1, 1, 1,
-0.5047822, 0.6043834, -1.093578, 1, 1, 1, 1, 1,
-0.4995986, 2.1608, 0.7192627, 1, 1, 1, 1, 1,
-0.4987856, 0.1365709, -1.097233, 1, 1, 1, 1, 1,
-0.494909, -0.260567, -2.507782, 1, 1, 1, 1, 1,
-0.4948115, -0.2380704, 0.2431587, 1, 1, 1, 1, 1,
-0.4934842, -1.287762, -2.502647, 1, 1, 1, 1, 1,
-0.4897006, -1.09831, -3.18792, 1, 1, 1, 1, 1,
-0.483287, 0.985561, -1.751258, 1, 1, 1, 1, 1,
-0.482343, 0.08147181, -0.2960312, 1, 1, 1, 1, 1,
-0.4818227, 0.3159459, -1.398617, 1, 1, 1, 1, 1,
-0.4800407, -1.359566, -2.758778, 0, 0, 1, 1, 1,
-0.4768049, 0.5014408, -0.2974974, 1, 0, 0, 1, 1,
-0.4717697, 1.352051, -1.811531, 1, 0, 0, 1, 1,
-0.4708184, 0.4386498, -0.7681993, 1, 0, 0, 1, 1,
-0.469063, -0.293703, -1.260618, 1, 0, 0, 1, 1,
-0.4682481, 0.4005966, -2.4655, 1, 0, 0, 1, 1,
-0.4682225, -0.5560635, -2.105699, 0, 0, 0, 1, 1,
-0.4671942, -1.114835, -2.202442, 0, 0, 0, 1, 1,
-0.4640584, 0.721257, 0.05943779, 0, 0, 0, 1, 1,
-0.4637122, -0.6005509, -2.999948, 0, 0, 0, 1, 1,
-0.458254, 0.822484, -1.9111, 0, 0, 0, 1, 1,
-0.4558092, -0.9276263, -1.446837, 0, 0, 0, 1, 1,
-0.4536447, -1.067975, -2.233538, 0, 0, 0, 1, 1,
-0.4513686, -0.1251787, -1.424126, 1, 1, 1, 1, 1,
-0.4509242, -0.3026372, -1.525096, 1, 1, 1, 1, 1,
-0.4476076, 0.8910674, -0.2607397, 1, 1, 1, 1, 1,
-0.4472993, 0.1495295, -1.428431, 1, 1, 1, 1, 1,
-0.4443626, -1.701032, -3.322226, 1, 1, 1, 1, 1,
-0.4422354, -0.1034569, -2.082845, 1, 1, 1, 1, 1,
-0.4388868, 1.224414, -0.2579174, 1, 1, 1, 1, 1,
-0.4345701, 0.4049969, -1.157816, 1, 1, 1, 1, 1,
-0.4341062, -1.384086, -2.78306, 1, 1, 1, 1, 1,
-0.4329239, 0.7583954, 0.3586951, 1, 1, 1, 1, 1,
-0.4328769, -1.02668, -3.220754, 1, 1, 1, 1, 1,
-0.4325137, 0.7414619, -0.7990838, 1, 1, 1, 1, 1,
-0.4317042, -1.708997, -2.822231, 1, 1, 1, 1, 1,
-0.4275485, 0.8364984, -0.1580294, 1, 1, 1, 1, 1,
-0.4233525, -0.002517654, -1.881588, 1, 1, 1, 1, 1,
-0.4128039, -0.1276157, -0.9091082, 0, 0, 1, 1, 1,
-0.4123103, 0.1655798, -1.529753, 1, 0, 0, 1, 1,
-0.4119064, -0.6710858, -2.823027, 1, 0, 0, 1, 1,
-0.4098518, 0.7694579, -0.1594649, 1, 0, 0, 1, 1,
-0.4086401, -0.1470014, -0.9406695, 1, 0, 0, 1, 1,
-0.4068817, 0.1406474, 0.8292125, 1, 0, 0, 1, 1,
-0.4021948, -0.1633731, -2.868658, 0, 0, 0, 1, 1,
-0.4000778, 1.132513, -0.04241925, 0, 0, 0, 1, 1,
-0.3994306, -1.864275, -0.8096372, 0, 0, 0, 1, 1,
-0.397631, -0.6334912, -3.880581, 0, 0, 0, 1, 1,
-0.3922116, -1.138568, -2.0711, 0, 0, 0, 1, 1,
-0.390424, -0.05139916, -1.889177, 0, 0, 0, 1, 1,
-0.3870949, -1.438428, -1.715525, 0, 0, 0, 1, 1,
-0.3839166, 0.297578, -0.712957, 1, 1, 1, 1, 1,
-0.3834028, -0.2806241, -2.125516, 1, 1, 1, 1, 1,
-0.3776623, 0.9439411, -0.2287494, 1, 1, 1, 1, 1,
-0.370606, 0.07722716, -2.318068, 1, 1, 1, 1, 1,
-0.3692125, 1.362809, 1.417967, 1, 1, 1, 1, 1,
-0.3683199, -0.435634, -0.7698924, 1, 1, 1, 1, 1,
-0.3630449, -1.082803, -3.536654, 1, 1, 1, 1, 1,
-0.3614819, -1.150562, -1.901057, 1, 1, 1, 1, 1,
-0.3586435, -0.4379886, -1.90276, 1, 1, 1, 1, 1,
-0.3562539, 1.16692, 0.05373701, 1, 1, 1, 1, 1,
-0.3547449, -0.08492491, -0.1550831, 1, 1, 1, 1, 1,
-0.3513534, -0.4890992, -1.768399, 1, 1, 1, 1, 1,
-0.3489386, 0.4282376, -0.3906274, 1, 1, 1, 1, 1,
-0.3473417, 1.040872, -0.9123147, 1, 1, 1, 1, 1,
-0.3471966, -0.4946087, -2.745693, 1, 1, 1, 1, 1,
-0.346688, 0.8783332, -0.4314274, 0, 0, 1, 1, 1,
-0.3453912, -0.6980302, -3.410237, 1, 0, 0, 1, 1,
-0.3388405, 1.138538, -1.686902, 1, 0, 0, 1, 1,
-0.337309, 0.2959199, -1.132775, 1, 0, 0, 1, 1,
-0.3360527, -0.4489195, -1.31046, 1, 0, 0, 1, 1,
-0.3346472, 0.5076283, 0.9342122, 1, 0, 0, 1, 1,
-0.3225472, -0.4794193, -2.123158, 0, 0, 0, 1, 1,
-0.3212172, -0.9669801, -2.117261, 0, 0, 0, 1, 1,
-0.3200044, 0.5042328, -1.318375, 0, 0, 0, 1, 1,
-0.3194359, -0.7704626, -2.034067, 0, 0, 0, 1, 1,
-0.314046, -0.6896978, -3.40501, 0, 0, 0, 1, 1,
-0.3081239, 0.3325704, -0.1722339, 0, 0, 0, 1, 1,
-0.3039935, -0.6856109, -4.598345, 0, 0, 0, 1, 1,
-0.3010992, -0.9735391, -2.960087, 1, 1, 1, 1, 1,
-0.2822439, -1.92961, -2.00337, 1, 1, 1, 1, 1,
-0.2744849, -1.794508, -2.337068, 1, 1, 1, 1, 1,
-0.2740104, 0.4672361, -1.347708, 1, 1, 1, 1, 1,
-0.2713159, -0.3380647, -2.518576, 1, 1, 1, 1, 1,
-0.2680139, 1.306863, 0.2643147, 1, 1, 1, 1, 1,
-0.2676828, -1.005165, -2.032693, 1, 1, 1, 1, 1,
-0.267377, 0.2803323, -0.0252682, 1, 1, 1, 1, 1,
-0.2662998, -1.072652, -4.154101, 1, 1, 1, 1, 1,
-0.2640161, 0.5784445, -1.241713, 1, 1, 1, 1, 1,
-0.2607858, 0.1211372, -2.095631, 1, 1, 1, 1, 1,
-0.2533161, -0.08860104, -1.652849, 1, 1, 1, 1, 1,
-0.2469658, -0.4927937, -2.331406, 1, 1, 1, 1, 1,
-0.2466528, 0.6935243, -2.251802, 1, 1, 1, 1, 1,
-0.2460586, -0.4675042, -2.154529, 1, 1, 1, 1, 1,
-0.2445016, 0.4747631, -1.811671, 0, 0, 1, 1, 1,
-0.2405593, 0.09486791, -1.227769, 1, 0, 0, 1, 1,
-0.2383066, 0.3641532, -0.546618, 1, 0, 0, 1, 1,
-0.2345461, -1.426716, -2.889849, 1, 0, 0, 1, 1,
-0.2308525, -0.5197662, -4.444841, 1, 0, 0, 1, 1,
-0.2303831, -0.05694864, 1.448626, 1, 0, 0, 1, 1,
-0.2274967, -1.252585, -2.454608, 0, 0, 0, 1, 1,
-0.2249302, -0.5984898, -1.853067, 0, 0, 0, 1, 1,
-0.223063, 0.5215216, 0.7413921, 0, 0, 0, 1, 1,
-0.2215274, 1.098141, -1.156664, 0, 0, 0, 1, 1,
-0.2187031, 0.5856845, -0.6736951, 0, 0, 0, 1, 1,
-0.2160987, -0.2161298, -2.7369, 0, 0, 0, 1, 1,
-0.2119129, 0.1905034, -1.263348, 0, 0, 0, 1, 1,
-0.2106505, 2.171478, -0.1512627, 1, 1, 1, 1, 1,
-0.2094809, -0.2605999, -0.8335199, 1, 1, 1, 1, 1,
-0.2082224, 0.6194779, -0.4838645, 1, 1, 1, 1, 1,
-0.2080725, -0.2068192, -1.799328, 1, 1, 1, 1, 1,
-0.2009192, -2.23544, -2.399454, 1, 1, 1, 1, 1,
-0.1966686, -0.9241131, -3.811815, 1, 1, 1, 1, 1,
-0.1945902, -0.890487, -3.008288, 1, 1, 1, 1, 1,
-0.1908458, 0.9291522, -0.5826867, 1, 1, 1, 1, 1,
-0.1872779, 0.7298611, 0.1379499, 1, 1, 1, 1, 1,
-0.1746916, 0.3691043, 0.3215413, 1, 1, 1, 1, 1,
-0.1737662, 3.395607, 0.6511068, 1, 1, 1, 1, 1,
-0.1681979, -0.2532431, -2.659503, 1, 1, 1, 1, 1,
-0.1662294, 0.7656947, -0.8080869, 1, 1, 1, 1, 1,
-0.1606475, 0.4548762, 0.05814007, 1, 1, 1, 1, 1,
-0.1605651, -2.052073, -3.533416, 1, 1, 1, 1, 1,
-0.1587851, -0.01083973, -3.160345, 0, 0, 1, 1, 1,
-0.1557375, -1.065358, -3.676985, 1, 0, 0, 1, 1,
-0.1542471, -2.043769, -2.986756, 1, 0, 0, 1, 1,
-0.1529181, -1.450495, -2.352137, 1, 0, 0, 1, 1,
-0.1430034, -0.0554299, -3.54625, 1, 0, 0, 1, 1,
-0.1394354, -1.143784, -5.953269, 1, 0, 0, 1, 1,
-0.1388097, -0.9749038, -3.494294, 0, 0, 0, 1, 1,
-0.1371154, -1.127591, -2.985385, 0, 0, 0, 1, 1,
-0.1370897, 0.9317151, 0.7957208, 0, 0, 0, 1, 1,
-0.1322001, -0.7758086, -3.614991, 0, 0, 0, 1, 1,
-0.1277518, 0.2896645, -1.161291, 0, 0, 0, 1, 1,
-0.1256689, -1.458174, -2.969839, 0, 0, 0, 1, 1,
-0.1254805, 0.6449494, -0.5483305, 0, 0, 0, 1, 1,
-0.1236772, 0.6296053, -1.803369, 1, 1, 1, 1, 1,
-0.1172975, -0.7760909, -1.860539, 1, 1, 1, 1, 1,
-0.1089275, 0.6605093, 0.2560836, 1, 1, 1, 1, 1,
-0.1046598, -1.115656, -3.274579, 1, 1, 1, 1, 1,
-0.1045251, -0.1848057, -2.837643, 1, 1, 1, 1, 1,
-0.1037668, -0.1203595, -3.424072, 1, 1, 1, 1, 1,
-0.1036441, 1.767056, 0.5324751, 1, 1, 1, 1, 1,
-0.1035214, 0.6833758, 0.4380696, 1, 1, 1, 1, 1,
-0.1023693, 0.5052997, 0.1562783, 1, 1, 1, 1, 1,
-0.0997339, -0.8960452, -0.8629227, 1, 1, 1, 1, 1,
-0.09869042, 0.2006085, -0.4160612, 1, 1, 1, 1, 1,
-0.09756655, 0.4437356, -0.8478241, 1, 1, 1, 1, 1,
-0.09519865, 0.7104967, 0.4859563, 1, 1, 1, 1, 1,
-0.09437128, 0.6236576, 0.7208146, 1, 1, 1, 1, 1,
-0.09247538, 0.33935, 1.103695, 1, 1, 1, 1, 1,
-0.0891739, 0.5001578, 2.019635, 0, 0, 1, 1, 1,
-0.08858956, 0.5220086, 0.2524998, 1, 0, 0, 1, 1,
-0.08670361, 0.2225162, -0.214042, 1, 0, 0, 1, 1,
-0.08467499, 0.7834407, 2.335144, 1, 0, 0, 1, 1,
-0.08390707, 1.163667, -1.631763, 1, 0, 0, 1, 1,
-0.08183839, 0.1438317, 0.02503566, 1, 0, 0, 1, 1,
-0.08143216, 0.5915207, -1.345613, 0, 0, 0, 1, 1,
-0.07973245, 0.5989712, -0.9474102, 0, 0, 0, 1, 1,
-0.07528476, -0.4082729, -1.577944, 0, 0, 0, 1, 1,
-0.07339176, -0.5965858, -2.831176, 0, 0, 0, 1, 1,
-0.07315688, 1.144166, -0.8549715, 0, 0, 0, 1, 1,
-0.07160245, 0.8352463, -0.5723618, 0, 0, 0, 1, 1,
-0.06913762, -1.16336, -1.809403, 0, 0, 0, 1, 1,
-0.06852949, -0.4696316, -3.233066, 1, 1, 1, 1, 1,
-0.06791051, -0.6361046, -4.018136, 1, 1, 1, 1, 1,
-0.06469874, -0.2369759, -2.349093, 1, 1, 1, 1, 1,
-0.06462201, -0.3716361, -2.824009, 1, 1, 1, 1, 1,
-0.0632391, 2.504525, 0.2172731, 1, 1, 1, 1, 1,
-0.05572585, -0.7829335, -3.414545, 1, 1, 1, 1, 1,
-0.05450864, 0.1585726, -0.5212654, 1, 1, 1, 1, 1,
-0.05436992, 0.3522816, 0.8444613, 1, 1, 1, 1, 1,
-0.05217298, 0.04982333, 1.289812, 1, 1, 1, 1, 1,
-0.05079662, -1.013197, -4.10172, 1, 1, 1, 1, 1,
-0.05062552, 0.08860666, -0.8788477, 1, 1, 1, 1, 1,
-0.04918043, -0.2791533, -1.649898, 1, 1, 1, 1, 1,
-0.04661077, -1.209547, -3.440737, 1, 1, 1, 1, 1,
-0.04643979, -0.05935599, 0.3946444, 1, 1, 1, 1, 1,
-0.04303458, -0.06654382, -1.170578, 1, 1, 1, 1, 1,
-0.04133266, -0.1684283, -2.569828, 0, 0, 1, 1, 1,
-0.04089198, 0.2423469, -0.7801883, 1, 0, 0, 1, 1,
-0.04060553, 0.4766345, -1.290551, 1, 0, 0, 1, 1,
-0.0402996, 1.963765, 0.4176394, 1, 0, 0, 1, 1,
-0.03830967, 0.03973121, -1.273885, 1, 0, 0, 1, 1,
-0.03577294, -1.268886, -2.493193, 1, 0, 0, 1, 1,
-0.03381556, 0.5520408, 0.1189749, 0, 0, 0, 1, 1,
-0.03228625, -0.9754063, -4.626657, 0, 0, 0, 1, 1,
-0.03061148, 0.6900836, 0.8797544, 0, 0, 0, 1, 1,
-0.03057912, 1.584705, -0.1422404, 0, 0, 0, 1, 1,
-0.02582037, 1.339707, 0.789709, 0, 0, 0, 1, 1,
-0.02513076, -0.4062113, -2.734644, 0, 0, 0, 1, 1,
-0.02426464, 0.4837746, -1.040987, 0, 0, 0, 1, 1,
-0.02232889, 1.894156, -0.05813047, 1, 1, 1, 1, 1,
-0.02163219, -1.223723, -4.011816, 1, 1, 1, 1, 1,
-0.01966177, 1.008317, 0.1986754, 1, 1, 1, 1, 1,
-0.0196042, 0.2066868, 0.05293259, 1, 1, 1, 1, 1,
-0.01805289, -0.6987965, -3.199486, 1, 1, 1, 1, 1,
-0.01664711, -0.06487829, -2.536297, 1, 1, 1, 1, 1,
-0.01607632, -0.2640299, -4.004815, 1, 1, 1, 1, 1,
-0.01442205, 2.907754, -0.9182932, 1, 1, 1, 1, 1,
-0.009405089, 0.5818855, 0.8431296, 1, 1, 1, 1, 1,
-0.009196015, -1.399484, -3.943293, 1, 1, 1, 1, 1,
-0.008851076, 0.4506319, -2.231996, 1, 1, 1, 1, 1,
-0.008044258, -0.1025992, -3.722527, 1, 1, 1, 1, 1,
-0.006464503, 0.5716743, -0.7903956, 1, 1, 1, 1, 1,
-0.005201276, -1.098342, -2.016152, 1, 1, 1, 1, 1,
-0.002420503, -1.331629, -4.327022, 1, 1, 1, 1, 1,
-0.001475555, -1.17057, -2.349785, 0, 0, 1, 1, 1,
-0.001090728, 0.03708383, -0.8522086, 1, 0, 0, 1, 1,
0.00358135, 0.9748871, 0.06310168, 1, 0, 0, 1, 1,
0.01280888, -0.2199883, 1.908335, 1, 0, 0, 1, 1,
0.01430916, 2.922255, -0.3688922, 1, 0, 0, 1, 1,
0.01439803, 1.288689, 1.314444, 1, 0, 0, 1, 1,
0.01565474, 0.3226724, 0.3773929, 0, 0, 0, 1, 1,
0.02128915, -1.628411, 1.56509, 0, 0, 0, 1, 1,
0.02236487, 1.408475, -0.546024, 0, 0, 0, 1, 1,
0.0231178, -1.016995, 1.870681, 0, 0, 0, 1, 1,
0.02659281, 2.743911, -0.2139082, 0, 0, 0, 1, 1,
0.0282969, -0.7540191, 4.828843, 0, 0, 0, 1, 1,
0.03322701, -2.52236, 1.474262, 0, 0, 0, 1, 1,
0.0338361, -0.09793138, 4.809891, 1, 1, 1, 1, 1,
0.0344857, -1.678299, 3.475979, 1, 1, 1, 1, 1,
0.03487246, -0.5048842, 2.301497, 1, 1, 1, 1, 1,
0.03507015, -0.8170124, 2.973276, 1, 1, 1, 1, 1,
0.03827991, -1.196311, 3.294237, 1, 1, 1, 1, 1,
0.03999262, 2.349668, -0.4120383, 1, 1, 1, 1, 1,
0.04427637, -1.300162, 1.553809, 1, 1, 1, 1, 1,
0.04598477, 1.765196, -0.02718427, 1, 1, 1, 1, 1,
0.04942238, -0.2502632, 3.216964, 1, 1, 1, 1, 1,
0.05143815, 0.4367856, 0.6522908, 1, 1, 1, 1, 1,
0.0546791, -1.839801, 3.729637, 1, 1, 1, 1, 1,
0.06031933, -0.3917846, 2.052356, 1, 1, 1, 1, 1,
0.06117243, -1.298772, 1.818719, 1, 1, 1, 1, 1,
0.06122736, -0.2067507, 2.679027, 1, 1, 1, 1, 1,
0.06256201, 0.9857401, -0.07739626, 1, 1, 1, 1, 1,
0.06950507, 1.280477, 0.767401, 0, 0, 1, 1, 1,
0.07088077, 0.5802573, 0.07980197, 1, 0, 0, 1, 1,
0.07308667, 1.597998, 0.03379369, 1, 0, 0, 1, 1,
0.07602538, 0.09815346, 1.23765, 1, 0, 0, 1, 1,
0.07825243, -0.06679185, 3.085788, 1, 0, 0, 1, 1,
0.08015793, 1.332925, -0.1523592, 1, 0, 0, 1, 1,
0.08104019, 0.1766264, 0.02145208, 0, 0, 0, 1, 1,
0.09016161, 0.03709985, 2.378032, 0, 0, 0, 1, 1,
0.09197465, -0.583629, 1.989372, 0, 0, 0, 1, 1,
0.1027032, -0.7776133, 2.601082, 0, 0, 0, 1, 1,
0.1048869, -0.7067156, 2.036619, 0, 0, 0, 1, 1,
0.1058048, -1.591372, 3.133939, 0, 0, 0, 1, 1,
0.1115371, -1.411698, 2.54923, 0, 0, 0, 1, 1,
0.1123675, 0.4150361, -0.9958228, 1, 1, 1, 1, 1,
0.1125582, 0.9673806, 0.834339, 1, 1, 1, 1, 1,
0.112686, 1.811395, -0.6301495, 1, 1, 1, 1, 1,
0.1130356, -0.2064496, 2.749326, 1, 1, 1, 1, 1,
0.115483, -0.3283403, 1.108129, 1, 1, 1, 1, 1,
0.1170591, -0.8624792, 3.105708, 1, 1, 1, 1, 1,
0.1210944, 0.5659231, 1.6722, 1, 1, 1, 1, 1,
0.1232676, -1.093983, 4.182066, 1, 1, 1, 1, 1,
0.1243818, 1.214088, 0.6935318, 1, 1, 1, 1, 1,
0.1244402, 0.2667544, -0.7184547, 1, 1, 1, 1, 1,
0.1272413, -0.03626504, 2.829129, 1, 1, 1, 1, 1,
0.1274931, -0.4783958, 1.973432, 1, 1, 1, 1, 1,
0.130984, 1.254793, -0.5119523, 1, 1, 1, 1, 1,
0.1323299, -0.2945628, 3.317815, 1, 1, 1, 1, 1,
0.1326678, -2.611096, 3.122894, 1, 1, 1, 1, 1,
0.1353546, -1.84056, 2.97457, 0, 0, 1, 1, 1,
0.1359861, -0.4535232, 3.229143, 1, 0, 0, 1, 1,
0.1425561, -0.9573885, 2.403539, 1, 0, 0, 1, 1,
0.1496668, 1.08947, 0.2740643, 1, 0, 0, 1, 1,
0.1514784, 0.5658309, -1.367998, 1, 0, 0, 1, 1,
0.1561371, -2.003098, 1.886317, 1, 0, 0, 1, 1,
0.1570543, 0.738832, -0.07682377, 0, 0, 0, 1, 1,
0.158502, 1.109964, 3.124285, 0, 0, 0, 1, 1,
0.1607701, 0.06836209, 2.327671, 0, 0, 0, 1, 1,
0.163867, -1.610304, 2.588792, 0, 0, 0, 1, 1,
0.1669163, -2.707811, 3.895196, 0, 0, 0, 1, 1,
0.1676013, -0.6637514, 2.298535, 0, 0, 0, 1, 1,
0.1718883, -0.974436, 3.348806, 0, 0, 0, 1, 1,
0.1765765, -0.03652399, 1.773322, 1, 1, 1, 1, 1,
0.1853434, -1.484058, 1.725852, 1, 1, 1, 1, 1,
0.1894235, 0.4114098, 0.9182304, 1, 1, 1, 1, 1,
0.1937332, 2.287639, 0.5316913, 1, 1, 1, 1, 1,
0.1944163, -1.528118, 2.941712, 1, 1, 1, 1, 1,
0.197105, -0.1299735, 0.889327, 1, 1, 1, 1, 1,
0.197467, 3.032034, 0.8719563, 1, 1, 1, 1, 1,
0.2022435, -1.651856, 4.704365, 1, 1, 1, 1, 1,
0.2042789, -0.9006594, 2.827398, 1, 1, 1, 1, 1,
0.2059541, 0.8428768, 0.2439981, 1, 1, 1, 1, 1,
0.2096851, 1.585896, 0.2669506, 1, 1, 1, 1, 1,
0.2127379, 1.032347, -0.7212911, 1, 1, 1, 1, 1,
0.2172271, -0.776023, 2.880613, 1, 1, 1, 1, 1,
0.2181251, 1.08566, 1.095783, 1, 1, 1, 1, 1,
0.2192659, -1.738904, 4.319059, 1, 1, 1, 1, 1,
0.2210448, 0.9977475, 0.4921295, 0, 0, 1, 1, 1,
0.2235422, 0.4949476, 1.36097, 1, 0, 0, 1, 1,
0.2250993, -0.9514997, 1.802629, 1, 0, 0, 1, 1,
0.2265925, 0.476529, 0.07715471, 1, 0, 0, 1, 1,
0.2286408, -0.09127817, 1.485145, 1, 0, 0, 1, 1,
0.2306761, -0.3720431, 2.666407, 1, 0, 0, 1, 1,
0.2313808, 0.7283198, 1.571907, 0, 0, 0, 1, 1,
0.2348945, 0.951344, -0.9811511, 0, 0, 0, 1, 1,
0.2383985, -2.739675, 2.887667, 0, 0, 0, 1, 1,
0.2390765, -0.4072599, 1.919551, 0, 0, 0, 1, 1,
0.2403087, -0.1633588, 2.813972, 0, 0, 0, 1, 1,
0.24222, -0.2607826, 0.6811279, 0, 0, 0, 1, 1,
0.2425463, 0.7005271, -1.145557, 0, 0, 0, 1, 1,
0.2477925, 0.6341506, 1.234822, 1, 1, 1, 1, 1,
0.2489971, -0.285633, 2.087952, 1, 1, 1, 1, 1,
0.2526237, 1.00376, 0.9602821, 1, 1, 1, 1, 1,
0.2528621, 1.55225, 0.2686515, 1, 1, 1, 1, 1,
0.2551812, -0.8468196, 3.786437, 1, 1, 1, 1, 1,
0.2568657, -1.28588, 2.564475, 1, 1, 1, 1, 1,
0.2611756, 0.3297074, -0.3107594, 1, 1, 1, 1, 1,
0.26361, -0.07674127, 3.186358, 1, 1, 1, 1, 1,
0.2677419, -1.209481, 2.951525, 1, 1, 1, 1, 1,
0.2702296, 0.3483422, 0.068537, 1, 1, 1, 1, 1,
0.2750949, 1.008359, 0.6362345, 1, 1, 1, 1, 1,
0.2754289, -0.7503172, 3.282194, 1, 1, 1, 1, 1,
0.2797216, -0.7938194, 1.772974, 1, 1, 1, 1, 1,
0.2816201, -0.2257887, 2.328279, 1, 1, 1, 1, 1,
0.2823865, 1.690903, 1.020854, 1, 1, 1, 1, 1,
0.2851896, -0.7222899, 2.277428, 0, 0, 1, 1, 1,
0.2867341, -1.149248, 4.543007, 1, 0, 0, 1, 1,
0.2879344, -0.2122519, 1.033135, 1, 0, 0, 1, 1,
0.2897622, 0.5813016, 0.8702012, 1, 0, 0, 1, 1,
0.2919568, -0.3701967, 1.619432, 1, 0, 0, 1, 1,
0.2942995, 0.1972204, -0.4294983, 1, 0, 0, 1, 1,
0.2997153, 0.7221169, 1.998933, 0, 0, 0, 1, 1,
0.3012236, -0.870536, 4.667749, 0, 0, 0, 1, 1,
0.3024103, 0.2954192, 1.358907, 0, 0, 0, 1, 1,
0.3058072, 0.2926929, 0.9996737, 0, 0, 0, 1, 1,
0.30678, 1.535571, -0.4067771, 0, 0, 0, 1, 1,
0.3104447, 1.03845, 1.831447, 0, 0, 0, 1, 1,
0.3124489, 0.297151, 1.516665, 0, 0, 0, 1, 1,
0.3140603, 2.299538, -0.7679623, 1, 1, 1, 1, 1,
0.3176352, 0.6580432, 0.4960396, 1, 1, 1, 1, 1,
0.3206546, 1.595895, 0.6448413, 1, 1, 1, 1, 1,
0.3241073, -0.4074386, 2.632445, 1, 1, 1, 1, 1,
0.3241137, -0.348263, 2.666398, 1, 1, 1, 1, 1,
0.3246569, -0.9515871, 5.345327, 1, 1, 1, 1, 1,
0.3270078, 0.3086539, 0.8743697, 1, 1, 1, 1, 1,
0.3315733, 0.5964198, -1.075445, 1, 1, 1, 1, 1,
0.3318816, -0.810657, 1.026278, 1, 1, 1, 1, 1,
0.3387884, -0.1554188, 1.992364, 1, 1, 1, 1, 1,
0.3431308, 0.8174139, 0.9402418, 1, 1, 1, 1, 1,
0.3433352, -1.487525, 2.068882, 1, 1, 1, 1, 1,
0.3459802, 0.9257414, 1.351647, 1, 1, 1, 1, 1,
0.3469294, -0.8743019, 3.094974, 1, 1, 1, 1, 1,
0.3474796, 0.9508142, 0.4405989, 1, 1, 1, 1, 1,
0.3530854, 0.9367729, -0.7378182, 0, 0, 1, 1, 1,
0.3559986, 0.7010045, 2.574203, 1, 0, 0, 1, 1,
0.3572174, -1.482816, 2.726556, 1, 0, 0, 1, 1,
0.3600938, 1.03378, -0.6660402, 1, 0, 0, 1, 1,
0.3616363, -0.870959, 1.815157, 1, 0, 0, 1, 1,
0.3696867, -1.552136, 1.829568, 1, 0, 0, 1, 1,
0.3722681, 0.07751963, -0.1228929, 0, 0, 0, 1, 1,
0.3733984, -0.5225392, 1.658486, 0, 0, 0, 1, 1,
0.3755063, 1.116252, -0.1013563, 0, 0, 0, 1, 1,
0.3760121, -0.3201529, 3.814098, 0, 0, 0, 1, 1,
0.379862, -0.8385643, 0.6572079, 0, 0, 0, 1, 1,
0.3906528, 1.631322, 0.2029928, 0, 0, 0, 1, 1,
0.3913129, 0.7503477, -0.03212721, 0, 0, 0, 1, 1,
0.3981982, 1.008946, 0.4000095, 1, 1, 1, 1, 1,
0.3994378, -0.5499264, 1.88954, 1, 1, 1, 1, 1,
0.4007981, 1.448219, 0.1961852, 1, 1, 1, 1, 1,
0.400803, 1.008947, 0.0765501, 1, 1, 1, 1, 1,
0.4058805, 0.05149802, 2.793502, 1, 1, 1, 1, 1,
0.4066192, -1.264368, 3.112867, 1, 1, 1, 1, 1,
0.4081818, 1.347848, 0.06804936, 1, 1, 1, 1, 1,
0.4083533, 0.04134019, 2.818024, 1, 1, 1, 1, 1,
0.4111736, 0.6930901, 0.02643323, 1, 1, 1, 1, 1,
0.4114446, 0.9799129, -0.1178875, 1, 1, 1, 1, 1,
0.4115703, 0.4203502, 0.8739397, 1, 1, 1, 1, 1,
0.4179251, 0.1487075, 1.361405, 1, 1, 1, 1, 1,
0.4226144, 2.242798, 1.019863, 1, 1, 1, 1, 1,
0.4231427, -1.128426, 1.410033, 1, 1, 1, 1, 1,
0.4240119, 0.07818089, 2.100776, 1, 1, 1, 1, 1,
0.4258781, 0.9567275, 1.237327, 0, 0, 1, 1, 1,
0.4389875, 0.7334018, -0.0002900658, 1, 0, 0, 1, 1,
0.445585, 0.2407748, -0.09274181, 1, 0, 0, 1, 1,
0.4486949, -0.3674239, 0.7805287, 1, 0, 0, 1, 1,
0.4596721, 0.8088811, -1.112032, 1, 0, 0, 1, 1,
0.4601017, 0.1079056, 2.941434, 1, 0, 0, 1, 1,
0.4608712, 0.01234979, 2.307085, 0, 0, 0, 1, 1,
0.4676566, 1.663715, -0.2646071, 0, 0, 0, 1, 1,
0.4741057, -0.3317892, 1.271013, 0, 0, 0, 1, 1,
0.474859, -1.067575, 1.590894, 0, 0, 0, 1, 1,
0.4761965, 0.6414845, -0.4323153, 0, 0, 0, 1, 1,
0.4768942, -0.5007603, 4.306537, 0, 0, 0, 1, 1,
0.4801434, -0.8836527, 2.247113, 0, 0, 0, 1, 1,
0.482888, 0.7160876, 1.379057, 1, 1, 1, 1, 1,
0.4836729, 0.8164761, 0.6277532, 1, 1, 1, 1, 1,
0.4872146, -0.4810281, 1.868048, 1, 1, 1, 1, 1,
0.4882035, 1.640099, 0.381646, 1, 1, 1, 1, 1,
0.4900846, -0.6101814, 2.251146, 1, 1, 1, 1, 1,
0.4911959, 1.093836, 0.5652002, 1, 1, 1, 1, 1,
0.4930117, 0.3794703, 0.2639056, 1, 1, 1, 1, 1,
0.4943214, -1.172827, 2.675123, 1, 1, 1, 1, 1,
0.4989457, -0.1180282, 1.060632, 1, 1, 1, 1, 1,
0.4990787, -0.7258488, 2.074716, 1, 1, 1, 1, 1,
0.5077507, 0.1313472, 0.6264949, 1, 1, 1, 1, 1,
0.5085634, 0.3085907, 1.682731, 1, 1, 1, 1, 1,
0.5086079, -1.506123, 3.498052, 1, 1, 1, 1, 1,
0.5091524, -0.8580282, 2.366629, 1, 1, 1, 1, 1,
0.5164101, 0.1587247, 1.11329, 1, 1, 1, 1, 1,
0.5186919, -0.5870894, 3.145461, 0, 0, 1, 1, 1,
0.5224055, 0.376222, 1.133437, 1, 0, 0, 1, 1,
0.526671, -1.057228, 2.891404, 1, 0, 0, 1, 1,
0.5268427, -0.4110271, 2.065042, 1, 0, 0, 1, 1,
0.5276186, 0.7369145, 0.7467318, 1, 0, 0, 1, 1,
0.5316478, -1.570608, 3.367278, 1, 0, 0, 1, 1,
0.5324938, 0.0567311, 0.7522609, 0, 0, 0, 1, 1,
0.5359004, -0.1902242, 1.619364, 0, 0, 0, 1, 1,
0.5361623, -0.09965177, 3.291321, 0, 0, 0, 1, 1,
0.5396834, -0.8420078, 2.060817, 0, 0, 0, 1, 1,
0.543627, -1.143114, 2.701672, 0, 0, 0, 1, 1,
0.5443936, 0.6053927, 2.483859, 0, 0, 0, 1, 1,
0.5447797, -0.8165868, 1.368327, 0, 0, 0, 1, 1,
0.5460439, -1.006456, 3.803961, 1, 1, 1, 1, 1,
0.5524312, -1.105925, 2.069343, 1, 1, 1, 1, 1,
0.5567172, -0.175367, 2.350864, 1, 1, 1, 1, 1,
0.5618699, 0.9164851, 1.87913, 1, 1, 1, 1, 1,
0.5639181, -0.3281192, 2.627561, 1, 1, 1, 1, 1,
0.570622, 0.4421924, 1.351928, 1, 1, 1, 1, 1,
0.5758919, 0.8146539, 0.1440922, 1, 1, 1, 1, 1,
0.5785753, 1.2886, 0.7637619, 1, 1, 1, 1, 1,
0.5871282, 0.2574577, -0.4142506, 1, 1, 1, 1, 1,
0.5880665, 0.4654897, 2.237767, 1, 1, 1, 1, 1,
0.5888192, 0.4187441, 1.515798, 1, 1, 1, 1, 1,
0.5934379, 0.02405615, 2.278563, 1, 1, 1, 1, 1,
0.5982917, 0.5491834, 0.6981321, 1, 1, 1, 1, 1,
0.6044695, 1.042704, 0.2573484, 1, 1, 1, 1, 1,
0.6109998, -1.273239, 3.117309, 1, 1, 1, 1, 1,
0.6154823, -0.1429368, 1.050832, 0, 0, 1, 1, 1,
0.6166309, -0.1088046, 1.729593, 1, 0, 0, 1, 1,
0.6211612, -0.2552719, 1.894614, 1, 0, 0, 1, 1,
0.6237243, 0.3741876, 2.295057, 1, 0, 0, 1, 1,
0.6273021, 0.4432016, 1.671292, 1, 0, 0, 1, 1,
0.6283577, 0.2918648, 0.249181, 1, 0, 0, 1, 1,
0.6300343, 0.1446052, 1.695203, 0, 0, 0, 1, 1,
0.6314549, 1.090125, 0.5129517, 0, 0, 0, 1, 1,
0.6323335, -0.2572687, 3.55817, 0, 0, 0, 1, 1,
0.6327133, 0.2022184, 1.474052, 0, 0, 0, 1, 1,
0.6365397, 1.435038, -0.04562851, 0, 0, 0, 1, 1,
0.6372584, -1.203001, 0.5813037, 0, 0, 0, 1, 1,
0.638691, 0.5707378, -0.9441727, 0, 0, 0, 1, 1,
0.6415736, 1.079858, 0.5387412, 1, 1, 1, 1, 1,
0.6436995, 0.208775, 0.8347037, 1, 1, 1, 1, 1,
0.6444962, -0.3783494, 2.105713, 1, 1, 1, 1, 1,
0.6452021, 0.7441272, 1.849198, 1, 1, 1, 1, 1,
0.6459424, 0.04845859, 4.343546, 1, 1, 1, 1, 1,
0.6462636, -0.2966263, -0.4052435, 1, 1, 1, 1, 1,
0.6515269, 0.04134568, 1.989196, 1, 1, 1, 1, 1,
0.653046, -0.8263074, 3.851283, 1, 1, 1, 1, 1,
0.656594, 0.8718418, 0.1342836, 1, 1, 1, 1, 1,
0.6566873, -0.7476798, 2.825061, 1, 1, 1, 1, 1,
0.6635752, 0.5654395, 1.393629, 1, 1, 1, 1, 1,
0.6674277, 0.6356505, 0.7062806, 1, 1, 1, 1, 1,
0.6682715, -0.219005, 4.291992, 1, 1, 1, 1, 1,
0.6714802, 0.4770467, 0.3577873, 1, 1, 1, 1, 1,
0.674202, 0.07815212, 0.9306045, 1, 1, 1, 1, 1,
0.6760135, -0.7577051, 1.793957, 0, 0, 1, 1, 1,
0.6760542, -1.572039, 1.964732, 1, 0, 0, 1, 1,
0.6804317, 0.6618556, 1.679879, 1, 0, 0, 1, 1,
0.6808099, -0.1885194, 3.789294, 1, 0, 0, 1, 1,
0.6816848, 0.9227209, -0.1437755, 1, 0, 0, 1, 1,
0.6830395, -0.2903443, -0.08307466, 1, 0, 0, 1, 1,
0.6842966, 0.77766, 1.522086, 0, 0, 0, 1, 1,
0.7058687, -0.3539724, 1.345964, 0, 0, 0, 1, 1,
0.7094195, -1.086514, 1.814278, 0, 0, 0, 1, 1,
0.7116681, 2.809088, 1.075988, 0, 0, 0, 1, 1,
0.712118, 1.569602, 0.6152051, 0, 0, 0, 1, 1,
0.7131042, 0.4366294, 1.158122, 0, 0, 0, 1, 1,
0.7156533, -0.3778782, 2.123173, 0, 0, 0, 1, 1,
0.7203616, 0.1531565, 2.247276, 1, 1, 1, 1, 1,
0.7224696, 0.5939128, 2.295202, 1, 1, 1, 1, 1,
0.7253692, 2.038223, 1.504087, 1, 1, 1, 1, 1,
0.731474, -2.065951, 0.5595064, 1, 1, 1, 1, 1,
0.7320529, -1.057558, 3.005946, 1, 1, 1, 1, 1,
0.7329151, -0.137317, 1.215399, 1, 1, 1, 1, 1,
0.7337281, -0.3487484, 0.003757848, 1, 1, 1, 1, 1,
0.7348639, -0.5495272, 2.137943, 1, 1, 1, 1, 1,
0.7372233, -0.1185947, 0.4614382, 1, 1, 1, 1, 1,
0.7420926, 0.3934873, 0.8877957, 1, 1, 1, 1, 1,
0.7468282, 2.752033, -0.5573393, 1, 1, 1, 1, 1,
0.7485755, 0.6952123, 1.743636, 1, 1, 1, 1, 1,
0.7495095, -2.107615, 1.111163, 1, 1, 1, 1, 1,
0.7505057, 1.008176, 0.6017417, 1, 1, 1, 1, 1,
0.7522153, -1.059411, 3.434049, 1, 1, 1, 1, 1,
0.7601773, 0.1951247, 1.782214, 0, 0, 1, 1, 1,
0.7601896, -1.394747, 0.9719311, 1, 0, 0, 1, 1,
0.7626016, -0.8127078, 2.784416, 1, 0, 0, 1, 1,
0.7660162, 0.8331776, -0.8241673, 1, 0, 0, 1, 1,
0.7724317, 0.4381701, 0.9673604, 1, 0, 0, 1, 1,
0.7732016, -0.2903896, 2.128721, 1, 0, 0, 1, 1,
0.7763628, 1.206213, 0.08106596, 0, 0, 0, 1, 1,
0.7771076, -1.344491, 3.65026, 0, 0, 0, 1, 1,
0.7787983, -0.163038, 4.231049, 0, 0, 0, 1, 1,
0.7796745, -1.164514, 2.101083, 0, 0, 0, 1, 1,
0.7805935, 0.02639819, 1.480018, 0, 0, 0, 1, 1,
0.7818099, -0.6765556, 1.678667, 0, 0, 0, 1, 1,
0.7854778, 0.469771, 1.159457, 0, 0, 0, 1, 1,
0.7871889, 0.3631386, 0.655848, 1, 1, 1, 1, 1,
0.7886409, -0.1113821, 2.915743, 1, 1, 1, 1, 1,
0.7898919, -1.666616, 3.205283, 1, 1, 1, 1, 1,
0.7957837, -0.4470375, 0.7191458, 1, 1, 1, 1, 1,
0.8116218, 0.1740213, -0.1827158, 1, 1, 1, 1, 1,
0.8160746, -0.9892059, 2.904145, 1, 1, 1, 1, 1,
0.8180479, 0.5196691, 1.791419, 1, 1, 1, 1, 1,
0.8186431, -0.6180668, 1.884053, 1, 1, 1, 1, 1,
0.8188452, -1.897499, 3.799368, 1, 1, 1, 1, 1,
0.8256759, 0.4566332, 2.969162, 1, 1, 1, 1, 1,
0.8263314, 0.6476545, 1.39202, 1, 1, 1, 1, 1,
0.8335799, 0.279058, 0.8708798, 1, 1, 1, 1, 1,
0.8342841, 1.305262, -0.1577447, 1, 1, 1, 1, 1,
0.8382467, 1.238461, 1.063464, 1, 1, 1, 1, 1,
0.8395328, 1.692963, -0.8584573, 1, 1, 1, 1, 1,
0.8396972, -0.9237269, 1.38318, 0, 0, 1, 1, 1,
0.8411342, -1.128632, 3.534507, 1, 0, 0, 1, 1,
0.851548, 0.1403478, 2.030715, 1, 0, 0, 1, 1,
0.8535852, -1.091579, 1.138224, 1, 0, 0, 1, 1,
0.8637651, -1.508573, 4.787259, 1, 0, 0, 1, 1,
0.8745155, -0.5665188, 2.550213, 1, 0, 0, 1, 1,
0.8763904, 1.075623, 0.6970974, 0, 0, 0, 1, 1,
0.8778929, 0.4232584, 2.180078, 0, 0, 0, 1, 1,
0.880018, 0.5391911, 0.869056, 0, 0, 0, 1, 1,
0.8838747, 0.8122659, 0.9104731, 0, 0, 0, 1, 1,
0.892692, -1.396724, 2.928073, 0, 0, 0, 1, 1,
0.8945699, 0.7196237, 2.761306, 0, 0, 0, 1, 1,
0.8964754, -1.256121, 2.502303, 0, 0, 0, 1, 1,
0.8982442, -0.2039626, 1.210131, 1, 1, 1, 1, 1,
0.8985015, 1.248597, 2.197961, 1, 1, 1, 1, 1,
0.9036644, -0.9692626, 2.57453, 1, 1, 1, 1, 1,
0.9051642, -0.4914158, 3.290293, 1, 1, 1, 1, 1,
0.9137235, -0.8663802, 1.659528, 1, 1, 1, 1, 1,
0.917963, 0.3095866, 3.201099, 1, 1, 1, 1, 1,
0.9200765, 1.442893, -0.8349755, 1, 1, 1, 1, 1,
0.9323722, 0.7264919, 0.4894231, 1, 1, 1, 1, 1,
0.9368336, -0.337265, 2.216866, 1, 1, 1, 1, 1,
0.9386353, -0.8358707, 2.463791, 1, 1, 1, 1, 1,
0.950284, -0.2494914, 2.373316, 1, 1, 1, 1, 1,
0.9517865, -0.2080166, 1.744434, 1, 1, 1, 1, 1,
0.9555848, 0.07348336, 2.405195, 1, 1, 1, 1, 1,
0.9565304, -0.3654887, 2.358914, 1, 1, 1, 1, 1,
0.9567827, -0.6047438, 3.528001, 1, 1, 1, 1, 1,
0.9663908, -1.053313, 2.801741, 0, 0, 1, 1, 1,
0.9699733, -0.4631527, 1.44327, 1, 0, 0, 1, 1,
0.9732979, -0.2543499, 1.493845, 1, 0, 0, 1, 1,
0.982914, 0.8706155, 1.038932, 1, 0, 0, 1, 1,
0.9880049, -0.7251227, 0.9781727, 1, 0, 0, 1, 1,
0.9971052, 0.9075927, 1.153352, 1, 0, 0, 1, 1,
0.9972819, 0.3842867, 1.159695, 0, 0, 0, 1, 1,
0.999655, -0.9798121, 2.922985, 0, 0, 0, 1, 1,
1.008295, -0.1860337, 2.479493, 0, 0, 0, 1, 1,
1.015714, 0.381888, 2.2263, 0, 0, 0, 1, 1,
1.016437, 0.3312471, 1.647592, 0, 0, 0, 1, 1,
1.020677, 0.1385802, 2.833073, 0, 0, 0, 1, 1,
1.022008, 1.236934, 0.771655, 0, 0, 0, 1, 1,
1.025059, -1.196988, 2.328365, 1, 1, 1, 1, 1,
1.028543, 0.3866732, 1.713012, 1, 1, 1, 1, 1,
1.035268, 1.529418, 0.9315746, 1, 1, 1, 1, 1,
1.035729, -1.708534, 1.771081, 1, 1, 1, 1, 1,
1.041631, -0.964554, 2.316967, 1, 1, 1, 1, 1,
1.041754, 0.660911, 2.05452, 1, 1, 1, 1, 1,
1.042621, -0.2805572, 0.7936129, 1, 1, 1, 1, 1,
1.045598, -2.724079, 1.212749, 1, 1, 1, 1, 1,
1.049698, -0.4603677, 1.597698, 1, 1, 1, 1, 1,
1.054116, 0.201863, 0.9153308, 1, 1, 1, 1, 1,
1.055861, -2.233402, 3.403652, 1, 1, 1, 1, 1,
1.055952, -0.965017, 1.840843, 1, 1, 1, 1, 1,
1.056319, -0.3996237, 2.261368, 1, 1, 1, 1, 1,
1.07512, 1.128977, 0.3251762, 1, 1, 1, 1, 1,
1.075987, 0.5059934, 1.531252, 1, 1, 1, 1, 1,
1.076544, -2.386421, 2.945193, 0, 0, 1, 1, 1,
1.089272, 0.3354691, -0.03371549, 1, 0, 0, 1, 1,
1.099905, 0.5752131, 1.569947, 1, 0, 0, 1, 1,
1.103151, 0.08759544, 2.988143, 1, 0, 0, 1, 1,
1.108258, -0.5231334, 0.809082, 1, 0, 0, 1, 1,
1.115082, -0.1753533, 3.271056, 1, 0, 0, 1, 1,
1.117447, -0.06108228, 2.759575, 0, 0, 0, 1, 1,
1.118993, 1.347267, 2.552672, 0, 0, 0, 1, 1,
1.119002, 0.2553765, 1.246732, 0, 0, 0, 1, 1,
1.124501, 0.2656627, 0.5619289, 0, 0, 0, 1, 1,
1.129487, 1.417006, 0.1698974, 0, 0, 0, 1, 1,
1.132805, -1.088673, 2.994151, 0, 0, 0, 1, 1,
1.157327, -0.1499288, 0.9083929, 0, 0, 0, 1, 1,
1.157961, 0.1865952, 3.398549, 1, 1, 1, 1, 1,
1.161967, 0.9877459, -0.004839091, 1, 1, 1, 1, 1,
1.171688, -2.832865, 2.885038, 1, 1, 1, 1, 1,
1.173506, 1.064518, 2.52804, 1, 1, 1, 1, 1,
1.181571, 1.902387, 0.4822727, 1, 1, 1, 1, 1,
1.188134, 0.1315388, 2.955513, 1, 1, 1, 1, 1,
1.199162, 0.5421675, -1.40106, 1, 1, 1, 1, 1,
1.210576, 0.4914008, 1.013755, 1, 1, 1, 1, 1,
1.212804, -0.3503752, 0.7479385, 1, 1, 1, 1, 1,
1.21489, -0.9170325, 1.876794, 1, 1, 1, 1, 1,
1.215087, 0.4049215, 2.015544, 1, 1, 1, 1, 1,
1.216439, -0.4496858, -0.6344926, 1, 1, 1, 1, 1,
1.216672, 0.1231889, -0.133515, 1, 1, 1, 1, 1,
1.218617, 0.9813177, -0.5084692, 1, 1, 1, 1, 1,
1.225806, 0.07203606, 1.461191, 1, 1, 1, 1, 1,
1.230648, 0.6425546, 1.193842, 0, 0, 1, 1, 1,
1.230681, 0.8183334, -0.2960477, 1, 0, 0, 1, 1,
1.234163, 0.9739922, 1.044475, 1, 0, 0, 1, 1,
1.244765, -0.5039775, 1.631628, 1, 0, 0, 1, 1,
1.249711, -0.4892713, 3.541342, 1, 0, 0, 1, 1,
1.251737, 1.398527, -0.0005915856, 1, 0, 0, 1, 1,
1.254265, -0.378922, 2.517605, 0, 0, 0, 1, 1,
1.25821, -0.1127703, 0.5373576, 0, 0, 0, 1, 1,
1.259725, -1.023119, 0.9147545, 0, 0, 0, 1, 1,
1.26551, -0.353216, 2.4719, 0, 0, 0, 1, 1,
1.267287, 0.9910837, 0.813687, 0, 0, 0, 1, 1,
1.271552, 0.3145292, 2.003864, 0, 0, 0, 1, 1,
1.272647, -0.03158967, 0.3328891, 0, 0, 0, 1, 1,
1.278665, -0.9359681, 2.387687, 1, 1, 1, 1, 1,
1.27881, -0.1716467, 1.644383, 1, 1, 1, 1, 1,
1.279237, -0.4823261, 0.2096156, 1, 1, 1, 1, 1,
1.284127, 1.150567, 2.593654, 1, 1, 1, 1, 1,
1.284236, -0.9374281, 2.056317, 1, 1, 1, 1, 1,
1.28903, -0.4674653, 1.220919, 1, 1, 1, 1, 1,
1.292789, 0.6536711, 2.013462, 1, 1, 1, 1, 1,
1.29377, -0.1817164, 1.941511, 1, 1, 1, 1, 1,
1.294504, 0.1588985, 1.058382, 1, 1, 1, 1, 1,
1.30343, 1.462094, 1.939217, 1, 1, 1, 1, 1,
1.303533, 1.153806, 0.8223782, 1, 1, 1, 1, 1,
1.308095, 0.2199503, 0.5132877, 1, 1, 1, 1, 1,
1.312089, 0.2697603, 2.909744, 1, 1, 1, 1, 1,
1.315877, 0.6186025, 1.611046, 1, 1, 1, 1, 1,
1.316797, -1.771193, 4.046129, 1, 1, 1, 1, 1,
1.330067, -3.116428, 2.670025, 0, 0, 1, 1, 1,
1.339424, -1.146693, 2.612803, 1, 0, 0, 1, 1,
1.342247, -1.883583, 1.631978, 1, 0, 0, 1, 1,
1.34707, -1.406884, 4.507944, 1, 0, 0, 1, 1,
1.356649, -1.260126, 1.455491, 1, 0, 0, 1, 1,
1.357988, 0.7686278, -0.981647, 1, 0, 0, 1, 1,
1.361126, -0.9643543, 1.963916, 0, 0, 0, 1, 1,
1.361394, -1.429228, 3.411279, 0, 0, 0, 1, 1,
1.37554, 0.1360874, 4.038622, 0, 0, 0, 1, 1,
1.376468, -0.04645524, 2.321156, 0, 0, 0, 1, 1,
1.381087, 1.220926, 1.55116, 0, 0, 0, 1, 1,
1.397244, 0.6932539, 1.02183, 0, 0, 0, 1, 1,
1.41496, -2.634817, 2.117348, 0, 0, 0, 1, 1,
1.417087, -0.6138114, 1.226581, 1, 1, 1, 1, 1,
1.421452, -0.4204189, 2.495564, 1, 1, 1, 1, 1,
1.453231, -0.08782427, 1.368506, 1, 1, 1, 1, 1,
1.475755, -0.4553671, 1.905146, 1, 1, 1, 1, 1,
1.48158, -1.495333, 3.537127, 1, 1, 1, 1, 1,
1.482781, -0.1933814, 2.349283, 1, 1, 1, 1, 1,
1.50979, 0.3189627, -0.02284853, 1, 1, 1, 1, 1,
1.510914, 0.1718441, 1.719072, 1, 1, 1, 1, 1,
1.543218, -1.2375, 2.204396, 1, 1, 1, 1, 1,
1.559154, 0.3698054, -0.4509851, 1, 1, 1, 1, 1,
1.564702, -1.945691, 3.345438, 1, 1, 1, 1, 1,
1.578371, 0.1917726, 0.168007, 1, 1, 1, 1, 1,
1.584589, 0.2471599, 1.455393, 1, 1, 1, 1, 1,
1.602059, 1.858635, 2.935575, 1, 1, 1, 1, 1,
1.616559, -0.1823937, -0.2246806, 1, 1, 1, 1, 1,
1.640814, 0.1575898, 3.147043, 0, 0, 1, 1, 1,
1.641627, -0.5101805, 2.150306, 1, 0, 0, 1, 1,
1.64233, -1.283198, 3.160732, 1, 0, 0, 1, 1,
1.645702, -0.08457464, 0.5924775, 1, 0, 0, 1, 1,
1.6495, -0.1901383, 1.255278, 1, 0, 0, 1, 1,
1.650949, 1.591807, 0.3994889, 1, 0, 0, 1, 1,
1.660479, -2.43613, 3.589596, 0, 0, 0, 1, 1,
1.661206, -0.3074415, 2.512479, 0, 0, 0, 1, 1,
1.683125, 1.342708, 1.681507, 0, 0, 0, 1, 1,
1.68483, 1.680969, 0.5873664, 0, 0, 0, 1, 1,
1.688533, -0.8531222, 3.419942, 0, 0, 0, 1, 1,
1.749196, 0.776786, 0.5188956, 0, 0, 0, 1, 1,
1.765289, -0.2246681, 2.245939, 0, 0, 0, 1, 1,
1.7777, 0.8655726, 1.300353, 1, 1, 1, 1, 1,
1.787612, 1.175853, 0.891108, 1, 1, 1, 1, 1,
1.796988, -0.09257122, 2.64059, 1, 1, 1, 1, 1,
1.808, 1.010348, 0.1306113, 1, 1, 1, 1, 1,
1.815031, 1.570653, 0.1463554, 1, 1, 1, 1, 1,
1.823808, -0.2393015, 0.6978611, 1, 1, 1, 1, 1,
1.845554, -1.284443, 2.347547, 1, 1, 1, 1, 1,
1.855331, -1.018484, 0.9435737, 1, 1, 1, 1, 1,
1.880568, 1.439637, 1.843369, 1, 1, 1, 1, 1,
1.883178, 1.30542, 0.8311315, 1, 1, 1, 1, 1,
1.888617, -0.3828143, 2.728205, 1, 1, 1, 1, 1,
1.926456, 0.3582121, 2.990593, 1, 1, 1, 1, 1,
1.940158, 0.8177834, 1.389058, 1, 1, 1, 1, 1,
1.970051, -0.04656998, 1.261267, 1, 1, 1, 1, 1,
2.020056, 1.369824, 0.8372868, 1, 1, 1, 1, 1,
2.032737, 0.7066063, 1.166099, 0, 0, 1, 1, 1,
2.050765, 1.575768, 1.377918, 1, 0, 0, 1, 1,
2.058454, -0.09774377, 2.974702, 1, 0, 0, 1, 1,
2.079915, 0.9138905, 1.533952, 1, 0, 0, 1, 1,
2.168511, -0.8674639, 4.147266, 1, 0, 0, 1, 1,
2.186656, -0.9887084, 1.569166, 1, 0, 0, 1, 1,
2.328302, 2.190676, -0.1121746, 0, 0, 0, 1, 1,
2.349954, -0.384373, 2.00506, 0, 0, 0, 1, 1,
2.358157, 0.1634122, 0.5769547, 0, 0, 0, 1, 1,
2.366281, -1.712239, 2.943407, 0, 0, 0, 1, 1,
2.388088, -0.05556259, 0.7087617, 0, 0, 0, 1, 1,
2.39015, 1.690406, 0.4595742, 0, 0, 0, 1, 1,
2.407114, -0.09082012, 1.064604, 0, 0, 0, 1, 1,
2.463951, -0.01326196, 0.8177881, 1, 1, 1, 1, 1,
2.491278, 2.598066, 1.174828, 1, 1, 1, 1, 1,
2.510363, 2.094471, 0.5484012, 1, 1, 1, 1, 1,
2.557528, -0.4120156, 2.840286, 1, 1, 1, 1, 1,
2.627866, -0.9882193, 3.675384, 1, 1, 1, 1, 1,
2.776052, 0.6621489, 0.4657779, 1, 1, 1, 1, 1,
4.655884, -0.6763057, 1.856507, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 10.45473;
var distance = 36.72179;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3639286, -0.1395895, 0.3039711 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.72179);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>