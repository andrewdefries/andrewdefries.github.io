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
-3.225773, 1.179872, -2.929328, 1, 0, 0, 1,
-3.136217, -0.8059371, -1.254254, 1, 0.007843138, 0, 1,
-2.855739, 0.231784, -2.12635, 1, 0.01176471, 0, 1,
-2.619188, -0.4474187, -0.3303134, 1, 0.01960784, 0, 1,
-2.538275, -0.838317, -1.147218, 1, 0.02352941, 0, 1,
-2.48202, 0.7350238, -0.101647, 1, 0.03137255, 0, 1,
-2.418872, 0.5536435, -1.853313, 1, 0.03529412, 0, 1,
-2.400949, -1.401653, -3.460055, 1, 0.04313726, 0, 1,
-2.368408, 2.204472, 0.1631207, 1, 0.04705882, 0, 1,
-2.315217, 0.2371964, -1.216114, 1, 0.05490196, 0, 1,
-2.248802, -0.7280279, -2.266856, 1, 0.05882353, 0, 1,
-2.244042, 1.316816, -1.278051, 1, 0.06666667, 0, 1,
-2.235205, 1.140374, -0.2378103, 1, 0.07058824, 0, 1,
-2.227173, 0.5297495, -1.786348, 1, 0.07843138, 0, 1,
-2.174726, -1.260121, -0.7417006, 1, 0.08235294, 0, 1,
-2.162865, -0.9991434, -0.6462726, 1, 0.09019608, 0, 1,
-2.131549, 0.174184, -0.9466358, 1, 0.09411765, 0, 1,
-2.130152, 0.2076666, -3.112876, 1, 0.1019608, 0, 1,
-2.097415, -2.259232, -2.302406, 1, 0.1098039, 0, 1,
-2.075446, -0.9918175, -0.8958903, 1, 0.1137255, 0, 1,
-2.041596, -0.8044662, -1.760644, 1, 0.1215686, 0, 1,
-2.039577, 0.7004328, -1.236862, 1, 0.1254902, 0, 1,
-2.033484, 0.3301382, -2.439353, 1, 0.1333333, 0, 1,
-2.007357, 0.5888395, 0.04643499, 1, 0.1372549, 0, 1,
-1.993061, 1.094335, -0.09229236, 1, 0.145098, 0, 1,
-1.948072, -0.058851, -1.585851, 1, 0.1490196, 0, 1,
-1.947382, 0.2753368, -0.5106704, 1, 0.1568628, 0, 1,
-1.90566, 1.789008, -0.2451295, 1, 0.1607843, 0, 1,
-1.896729, -1.189562, -0.487695, 1, 0.1686275, 0, 1,
-1.886582, 0.3150895, 0.09913118, 1, 0.172549, 0, 1,
-1.875978, -1.645997, -2.045469, 1, 0.1803922, 0, 1,
-1.868297, -0.3901257, -0.3400281, 1, 0.1843137, 0, 1,
-1.861489, -0.352456, -1.474816, 1, 0.1921569, 0, 1,
-1.836378, -1.35712, -1.748014, 1, 0.1960784, 0, 1,
-1.829686, -0.08055314, -2.016588, 1, 0.2039216, 0, 1,
-1.812222, -0.480978, -2.095977, 1, 0.2117647, 0, 1,
-1.811155, 0.7147915, -2.188918, 1, 0.2156863, 0, 1,
-1.778027, 0.5641233, -1.574973, 1, 0.2235294, 0, 1,
-1.77548, 0.6445513, -0.6197103, 1, 0.227451, 0, 1,
-1.751164, 2.842604, -0.6343476, 1, 0.2352941, 0, 1,
-1.730925, 2.229684, -1.494148, 1, 0.2392157, 0, 1,
-1.72532, 1.203975, -0.5732226, 1, 0.2470588, 0, 1,
-1.718592, -0.3754994, -1.388246, 1, 0.2509804, 0, 1,
-1.696762, -2.289665, -1.138649, 1, 0.2588235, 0, 1,
-1.659676, 1.622343, -1.485491, 1, 0.2627451, 0, 1,
-1.64365, 0.8273491, 0.8165768, 1, 0.2705882, 0, 1,
-1.639982, 0.542813, -2.505495, 1, 0.2745098, 0, 1,
-1.637501, -0.3787703, -1.142472, 1, 0.282353, 0, 1,
-1.621353, -1.040446, -3.039364, 1, 0.2862745, 0, 1,
-1.615283, 0.2495298, 0.06355679, 1, 0.2941177, 0, 1,
-1.61194, -0.8189006, -3.173469, 1, 0.3019608, 0, 1,
-1.610728, 0.8892545, -0.06814898, 1, 0.3058824, 0, 1,
-1.599652, -0.9386411, -2.825975, 1, 0.3137255, 0, 1,
-1.589512, 0.5344146, -1.763417, 1, 0.3176471, 0, 1,
-1.551393, -0.06216354, -1.864825, 1, 0.3254902, 0, 1,
-1.550295, 0.06999398, -2.003304, 1, 0.3294118, 0, 1,
-1.532799, -0.2031151, -0.1528996, 1, 0.3372549, 0, 1,
-1.523621, -0.3366859, -1.051372, 1, 0.3411765, 0, 1,
-1.507453, -0.3980201, -0.2821515, 1, 0.3490196, 0, 1,
-1.504345, -0.9563933, -2.075751, 1, 0.3529412, 0, 1,
-1.50325, -0.3654894, -2.602507, 1, 0.3607843, 0, 1,
-1.472351, 1.944031, -0.89218, 1, 0.3647059, 0, 1,
-1.448336, -0.9611905, -0.8172281, 1, 0.372549, 0, 1,
-1.442617, 0.003540961, -1.841644, 1, 0.3764706, 0, 1,
-1.429982, 0.6864792, -1.810155, 1, 0.3843137, 0, 1,
-1.422379, -1.002294, -2.917186, 1, 0.3882353, 0, 1,
-1.421678, 0.8067591, -1.120737, 1, 0.3960784, 0, 1,
-1.421455, -1.4182, -2.555332, 1, 0.4039216, 0, 1,
-1.417085, 0.5394932, -0.3213795, 1, 0.4078431, 0, 1,
-1.414239, 0.9962677, 1.243311, 1, 0.4156863, 0, 1,
-1.413494, 0.1238132, 0.4790832, 1, 0.4196078, 0, 1,
-1.396291, -1.380076, -4.446785, 1, 0.427451, 0, 1,
-1.395151, -0.5589585, -1.466974, 1, 0.4313726, 0, 1,
-1.390172, 0.4798449, -0.1897662, 1, 0.4392157, 0, 1,
-1.380984, -0.05440051, -1.329424, 1, 0.4431373, 0, 1,
-1.375011, -1.494854, -2.34571, 1, 0.4509804, 0, 1,
-1.368903, -0.3119183, -2.33387, 1, 0.454902, 0, 1,
-1.366837, -0.5588025, -1.252644, 1, 0.4627451, 0, 1,
-1.350567, 0.4160617, -0.4674814, 1, 0.4666667, 0, 1,
-1.349825, -0.2290315, -1.139063, 1, 0.4745098, 0, 1,
-1.346897, 0.2047209, -1.684879, 1, 0.4784314, 0, 1,
-1.346888, 0.6056652, -1.317915, 1, 0.4862745, 0, 1,
-1.345436, 1.02958, -0.1439724, 1, 0.4901961, 0, 1,
-1.337632, -0.5708779, -2.785336, 1, 0.4980392, 0, 1,
-1.333507, -0.1179519, -2.593009, 1, 0.5058824, 0, 1,
-1.332193, 1.380939, -0.6097438, 1, 0.509804, 0, 1,
-1.331522, 0.9830016, -1.572397, 1, 0.5176471, 0, 1,
-1.328031, 0.3668064, -2.481925, 1, 0.5215687, 0, 1,
-1.314067, -0.4645268, -1.577104, 1, 0.5294118, 0, 1,
-1.311131, -0.2011825, -2.321375, 1, 0.5333334, 0, 1,
-1.310945, 0.9623267, -0.7391765, 1, 0.5411765, 0, 1,
-1.310367, -1.750779, -4.212101, 1, 0.5450981, 0, 1,
-1.310102, 2.792575, 0.8660641, 1, 0.5529412, 0, 1,
-1.307575, -0.7325693, -1.244451, 1, 0.5568628, 0, 1,
-1.307128, 0.2565368, -1.560884, 1, 0.5647059, 0, 1,
-1.301294, 0.4438493, -1.607185, 1, 0.5686275, 0, 1,
-1.294572, 0.4254245, -1.953695, 1, 0.5764706, 0, 1,
-1.289331, 0.8543935, -1.574654, 1, 0.5803922, 0, 1,
-1.284575, 2.137757, -0.8356488, 1, 0.5882353, 0, 1,
-1.261231, -0.6344979, -2.492241, 1, 0.5921569, 0, 1,
-1.257233, 2.0782, -1.365285, 1, 0.6, 0, 1,
-1.255404, -0.1150173, -2.164135, 1, 0.6078432, 0, 1,
-1.249743, 0.8798198, -1.395028, 1, 0.6117647, 0, 1,
-1.247854, -0.5035365, -1.318781, 1, 0.6196079, 0, 1,
-1.245765, 0.09991494, -2.833509, 1, 0.6235294, 0, 1,
-1.24087, 0.3078653, -1.378635, 1, 0.6313726, 0, 1,
-1.215583, -0.1457633, -2.820302, 1, 0.6352941, 0, 1,
-1.206482, 0.8595625, 1.603373, 1, 0.6431373, 0, 1,
-1.202323, -0.4500355, -0.8717873, 1, 0.6470588, 0, 1,
-1.198967, -1.577718, -1.11621, 1, 0.654902, 0, 1,
-1.198377, -1.421582, -1.361922, 1, 0.6588235, 0, 1,
-1.196842, -2.091943, -2.460896, 1, 0.6666667, 0, 1,
-1.188084, 0.5392374, -1.340183, 1, 0.6705883, 0, 1,
-1.184161, 0.8912371, 1.090571, 1, 0.6784314, 0, 1,
-1.178039, -1.612586, -3.094134, 1, 0.682353, 0, 1,
-1.173357, -0.6423151, -1.621321, 1, 0.6901961, 0, 1,
-1.164043, -0.3151209, -1.918109, 1, 0.6941177, 0, 1,
-1.163997, 0.133487, -3.734072, 1, 0.7019608, 0, 1,
-1.163744, 1.836061, -0.4933955, 1, 0.7098039, 0, 1,
-1.150174, -0.3659001, -2.386198, 1, 0.7137255, 0, 1,
-1.147424, -0.9247129, -2.331566, 1, 0.7215686, 0, 1,
-1.146415, 0.3631436, -2.769281, 1, 0.7254902, 0, 1,
-1.142654, -0.7768168, -3.225471, 1, 0.7333333, 0, 1,
-1.139071, -1.857966, -1.782922, 1, 0.7372549, 0, 1,
-1.138518, 0.06688477, -0.5999532, 1, 0.7450981, 0, 1,
-1.135987, -0.4839616, -2.126704, 1, 0.7490196, 0, 1,
-1.131635, -0.07800603, -1.733186, 1, 0.7568628, 0, 1,
-1.12463, -0.7432415, -2.149287, 1, 0.7607843, 0, 1,
-1.120917, -0.08685207, -3.00819, 1, 0.7686275, 0, 1,
-1.105252, -0.4627531, -2.184745, 1, 0.772549, 0, 1,
-1.099619, 0.4555265, -0.5358109, 1, 0.7803922, 0, 1,
-1.088845, -0.212896, -1.609067, 1, 0.7843137, 0, 1,
-1.087809, -1.350368, -1.962627, 1, 0.7921569, 0, 1,
-1.081392, 0.1243602, -1.661014, 1, 0.7960784, 0, 1,
-1.078469, -1.911774, -2.397243, 1, 0.8039216, 0, 1,
-1.076031, -0.1717747, -1.264109, 1, 0.8117647, 0, 1,
-1.075229, 1.394573, 2.573724, 1, 0.8156863, 0, 1,
-1.073737, 0.9511618, 0.2298505, 1, 0.8235294, 0, 1,
-1.071698, 0.2284516, -2.78724, 1, 0.827451, 0, 1,
-1.040704, 0.4093735, 0.5717157, 1, 0.8352941, 0, 1,
-1.038625, 0.5495271, -0.4114619, 1, 0.8392157, 0, 1,
-1.026634, 0.9695296, 0.05961815, 1, 0.8470588, 0, 1,
-1.024607, 0.6168215, -1.3041, 1, 0.8509804, 0, 1,
-1.019831, -0.4070512, -2.227988, 1, 0.8588235, 0, 1,
-1.014132, 2.099253, -1.022445, 1, 0.8627451, 0, 1,
-1.005452, -1.24444, -0.3467798, 1, 0.8705882, 0, 1,
-1.00473, 0.1127008, -0.178925, 1, 0.8745098, 0, 1,
-1.004269, 0.7542318, -1.325803, 1, 0.8823529, 0, 1,
-1.000583, -0.3864289, -0.6335111, 1, 0.8862745, 0, 1,
-0.9966854, -0.03502874, -0.2342667, 1, 0.8941177, 0, 1,
-0.9867852, 0.1229774, -0.708405, 1, 0.8980392, 0, 1,
-0.9825484, 1.471179, -1.836531, 1, 0.9058824, 0, 1,
-0.9772362, -0.5000499, -1.454943, 1, 0.9137255, 0, 1,
-0.9763062, 0.09858268, -2.104366, 1, 0.9176471, 0, 1,
-0.9722909, -0.6073675, -1.66627, 1, 0.9254902, 0, 1,
-0.9718005, -0.08431309, -0.700443, 1, 0.9294118, 0, 1,
-0.9686278, -1.679779, -1.456219, 1, 0.9372549, 0, 1,
-0.9682677, 1.727157, 0.1664408, 1, 0.9411765, 0, 1,
-0.9597003, 1.936508, 0.1800054, 1, 0.9490196, 0, 1,
-0.9572313, 0.6116979, -2.014864, 1, 0.9529412, 0, 1,
-0.9441792, -1.914089, -3.315253, 1, 0.9607843, 0, 1,
-0.9437643, 2.210037, 1.637077, 1, 0.9647059, 0, 1,
-0.9363649, -1.144162, -1.56478, 1, 0.972549, 0, 1,
-0.9353068, 0.2453516, -1.283237, 1, 0.9764706, 0, 1,
-0.9351403, 0.8965594, -1.499842, 1, 0.9843137, 0, 1,
-0.9339281, -0.4765629, -2.430315, 1, 0.9882353, 0, 1,
-0.9328932, 0.0398051, -1.785467, 1, 0.9960784, 0, 1,
-0.9270689, 0.0998657, -0.7091964, 0.9960784, 1, 0, 1,
-0.9259191, -0.7915896, -1.027541, 0.9921569, 1, 0, 1,
-0.9196016, -0.708285, -3.78988, 0.9843137, 1, 0, 1,
-0.9162299, 1.451741, -0.79702, 0.9803922, 1, 0, 1,
-0.91311, 0.002844325, 1.939593, 0.972549, 1, 0, 1,
-0.9069469, 0.6559377, -0.9820343, 0.9686275, 1, 0, 1,
-0.9054333, 2.023168, -0.6496425, 0.9607843, 1, 0, 1,
-0.9052979, 0.385008, -0.9256794, 0.9568627, 1, 0, 1,
-0.905207, 1.640091, -0.231891, 0.9490196, 1, 0, 1,
-0.9041321, 1.017737, -0.2748615, 0.945098, 1, 0, 1,
-0.9036193, 0.05087748, -2.149153, 0.9372549, 1, 0, 1,
-0.8989515, -0.0753744, -3.55562, 0.9333333, 1, 0, 1,
-0.8975539, -1.840154, -2.550107, 0.9254902, 1, 0, 1,
-0.8942142, -0.7688829, -0.8437841, 0.9215686, 1, 0, 1,
-0.8901298, 1.927154, 0.7557948, 0.9137255, 1, 0, 1,
-0.8862297, 1.374962, -0.967608, 0.9098039, 1, 0, 1,
-0.8815731, -1.382719, -0.6395136, 0.9019608, 1, 0, 1,
-0.8811489, -0.6760852, -4.194356, 0.8941177, 1, 0, 1,
-0.87946, -0.07019111, -2.138191, 0.8901961, 1, 0, 1,
-0.8752911, -1.848417, -0.5545806, 0.8823529, 1, 0, 1,
-0.8733013, 0.3562529, -0.5054309, 0.8784314, 1, 0, 1,
-0.8707936, 0.9168015, 0.6448626, 0.8705882, 1, 0, 1,
-0.8683065, -0.2589631, 1.003673, 0.8666667, 1, 0, 1,
-0.8654765, 1.999774, 0.1206033, 0.8588235, 1, 0, 1,
-0.8641707, 0.8123953, -0.5747984, 0.854902, 1, 0, 1,
-0.8545543, 0.6121349, 0.04025353, 0.8470588, 1, 0, 1,
-0.8544765, -1.056681, -3.290858, 0.8431373, 1, 0, 1,
-0.8490233, 0.727986, -2.21162, 0.8352941, 1, 0, 1,
-0.8483136, -1.138618, -4.015727, 0.8313726, 1, 0, 1,
-0.8467873, 0.8777706, -1.635573, 0.8235294, 1, 0, 1,
-0.8410048, 0.506095, 0.1887358, 0.8196079, 1, 0, 1,
-0.8389144, -1.23484, -2.08109, 0.8117647, 1, 0, 1,
-0.8324954, -0.7332124, -0.8739817, 0.8078431, 1, 0, 1,
-0.8228002, 1.193884, -0.4614819, 0.8, 1, 0, 1,
-0.822593, 0.03087434, -0.4632108, 0.7921569, 1, 0, 1,
-0.8195772, -1.090083, -2.116274, 0.7882353, 1, 0, 1,
-0.8193998, 0.5105131, -0.2835466, 0.7803922, 1, 0, 1,
-0.8120009, 0.1423896, -0.7001624, 0.7764706, 1, 0, 1,
-0.8066471, 1.700951, -0.235643, 0.7686275, 1, 0, 1,
-0.8050425, -1.593792, -1.774678, 0.7647059, 1, 0, 1,
-0.7992756, 1.00647, -0.8426121, 0.7568628, 1, 0, 1,
-0.7988046, 0.4663856, 0.8102686, 0.7529412, 1, 0, 1,
-0.7922547, -0.3544377, -2.014414, 0.7450981, 1, 0, 1,
-0.789289, -0.09270344, -2.818407, 0.7411765, 1, 0, 1,
-0.7866181, 0.1878157, -2.311369, 0.7333333, 1, 0, 1,
-0.7859975, -2.108045, -2.233239, 0.7294118, 1, 0, 1,
-0.7848355, -0.5265113, -2.215957, 0.7215686, 1, 0, 1,
-0.7807601, 1.435928, -0.9409757, 0.7176471, 1, 0, 1,
-0.7804889, -0.1517241, -1.945328, 0.7098039, 1, 0, 1,
-0.7803996, 0.6237085, -1.168311, 0.7058824, 1, 0, 1,
-0.7729745, 0.6942626, 0.379397, 0.6980392, 1, 0, 1,
-0.7716235, 0.2526737, -2.31312, 0.6901961, 1, 0, 1,
-0.7642304, 0.5936108, -1.984182, 0.6862745, 1, 0, 1,
-0.7594931, -0.2466655, -2.693065, 0.6784314, 1, 0, 1,
-0.7576574, 1.151092, -2.236759, 0.6745098, 1, 0, 1,
-0.756677, 0.4997943, -0.6854452, 0.6666667, 1, 0, 1,
-0.754899, -2.274525, -2.504092, 0.6627451, 1, 0, 1,
-0.7542635, 1.042088, -1.352247, 0.654902, 1, 0, 1,
-0.7483736, 0.9980751, -1.531088, 0.6509804, 1, 0, 1,
-0.7411613, 1.000346, -0.4958755, 0.6431373, 1, 0, 1,
-0.7375118, -0.9153363, -2.278858, 0.6392157, 1, 0, 1,
-0.7344201, -0.6008297, -1.330046, 0.6313726, 1, 0, 1,
-0.7322065, -1.359315, -2.988042, 0.627451, 1, 0, 1,
-0.7321203, -0.9309601, -2.613516, 0.6196079, 1, 0, 1,
-0.7288523, 0.3817283, -1.940455, 0.6156863, 1, 0, 1,
-0.7238567, 0.5921485, 1.444555, 0.6078432, 1, 0, 1,
-0.7140573, 2.589158, -0.1842649, 0.6039216, 1, 0, 1,
-0.7130271, 1.492593, 0.01528503, 0.5960785, 1, 0, 1,
-0.7090936, 1.73371, -0.1714201, 0.5882353, 1, 0, 1,
-0.7047736, -0.82635, -0.872011, 0.5843138, 1, 0, 1,
-0.7044939, -1.692538, -1.410803, 0.5764706, 1, 0, 1,
-0.6959386, -0.266986, -3.716287, 0.572549, 1, 0, 1,
-0.6917202, 0.8542571, -0.2193328, 0.5647059, 1, 0, 1,
-0.6904726, -0.1287548, -1.322429, 0.5607843, 1, 0, 1,
-0.689303, 0.7451528, -0.722458, 0.5529412, 1, 0, 1,
-0.6880292, -0.1669027, -0.8925036, 0.5490196, 1, 0, 1,
-0.6873689, -1.646357, -2.706663, 0.5411765, 1, 0, 1,
-0.6824551, -0.6257433, -2.642066, 0.5372549, 1, 0, 1,
-0.6817216, 1.166532, -1.468611, 0.5294118, 1, 0, 1,
-0.6794296, 0.8674316, -0.433013, 0.5254902, 1, 0, 1,
-0.6740416, -0.4048002, -1.681566, 0.5176471, 1, 0, 1,
-0.6735545, -0.9781355, -3.061913, 0.5137255, 1, 0, 1,
-0.6728483, 0.5410405, -0.3172111, 0.5058824, 1, 0, 1,
-0.6645619, -0.3691685, -3.343278, 0.5019608, 1, 0, 1,
-0.6498988, -0.4561249, -1.842407, 0.4941176, 1, 0, 1,
-0.6457893, 0.7139298, 0.3227369, 0.4862745, 1, 0, 1,
-0.6401334, 0.9894617, 1.333322, 0.4823529, 1, 0, 1,
-0.6388456, -0.3732996, -1.083435, 0.4745098, 1, 0, 1,
-0.637033, -1.170654, -1.354809, 0.4705882, 1, 0, 1,
-0.635146, -1.371403, -2.71339, 0.4627451, 1, 0, 1,
-0.6345907, 0.2555147, -1.302125, 0.4588235, 1, 0, 1,
-0.6342111, 1.937237, 2.105404, 0.4509804, 1, 0, 1,
-0.6336502, 0.3986506, -1.242203, 0.4470588, 1, 0, 1,
-0.6305856, 0.5482874, -0.7134532, 0.4392157, 1, 0, 1,
-0.6299047, 1.128916, -1.467423, 0.4352941, 1, 0, 1,
-0.6254634, -0.4569346, -2.542276, 0.427451, 1, 0, 1,
-0.6194057, -1.997238, -4.142221, 0.4235294, 1, 0, 1,
-0.6169723, -0.9139269, -2.914286, 0.4156863, 1, 0, 1,
-0.6109434, 0.2434139, -0.2362818, 0.4117647, 1, 0, 1,
-0.6071381, -0.4021951, -1.278791, 0.4039216, 1, 0, 1,
-0.6025309, -0.6999643, -3.388767, 0.3960784, 1, 0, 1,
-0.6011431, -0.2005712, -3.900876, 0.3921569, 1, 0, 1,
-0.5966108, -0.7675815, -2.419247, 0.3843137, 1, 0, 1,
-0.5953698, -0.2954408, -3.148852, 0.3803922, 1, 0, 1,
-0.5951438, -0.3724454, -2.05004, 0.372549, 1, 0, 1,
-0.5938236, 0.2777255, -0.5340031, 0.3686275, 1, 0, 1,
-0.5930926, 1.534313, -0.8587225, 0.3607843, 1, 0, 1,
-0.5873313, 0.5509729, 0.2617766, 0.3568628, 1, 0, 1,
-0.5807926, -2.491568, -3.443333, 0.3490196, 1, 0, 1,
-0.5807065, 0.8308172, -0.09287242, 0.345098, 1, 0, 1,
-0.5763562, 0.5341759, -0.3154098, 0.3372549, 1, 0, 1,
-0.5740519, -0.4960183, -2.838393, 0.3333333, 1, 0, 1,
-0.5669696, -0.9575461, -4.580536, 0.3254902, 1, 0, 1,
-0.5599611, 0.6310224, -0.8469012, 0.3215686, 1, 0, 1,
-0.5573799, 0.8167033, 1.416902, 0.3137255, 1, 0, 1,
-0.554314, 1.662497, -0.6789473, 0.3098039, 1, 0, 1,
-0.5529279, -1.138167, -2.815195, 0.3019608, 1, 0, 1,
-0.5525525, -1.412231, -3.638722, 0.2941177, 1, 0, 1,
-0.5503989, 0.313866, -1.740288, 0.2901961, 1, 0, 1,
-0.5498409, -0.7133732, -2.197288, 0.282353, 1, 0, 1,
-0.5421852, -0.4237068, -2.909752, 0.2784314, 1, 0, 1,
-0.5406309, 0.4403853, -2.011768, 0.2705882, 1, 0, 1,
-0.538103, 1.33887, 1.608151, 0.2666667, 1, 0, 1,
-0.5350525, 0.6491324, -0.5154626, 0.2588235, 1, 0, 1,
-0.5348846, 1.285172, 1.261295, 0.254902, 1, 0, 1,
-0.534884, 0.04962224, -1.185542, 0.2470588, 1, 0, 1,
-0.5347506, 0.05473079, -1.91042, 0.2431373, 1, 0, 1,
-0.5302172, 2.239338, -0.7449488, 0.2352941, 1, 0, 1,
-0.5295463, -0.5567017, -3.666632, 0.2313726, 1, 0, 1,
-0.5286375, -0.7377178, -3.472132, 0.2235294, 1, 0, 1,
-0.5249019, 0.6503925, -1.67942, 0.2196078, 1, 0, 1,
-0.5153596, -1.467048, -2.284212, 0.2117647, 1, 0, 1,
-0.5115018, -1.310074, -2.631959, 0.2078431, 1, 0, 1,
-0.5055358, 1.283916, -2.647669, 0.2, 1, 0, 1,
-0.5042501, -1.651164, -3.48827, 0.1921569, 1, 0, 1,
-0.5020094, 0.02991249, -0.8683067, 0.1882353, 1, 0, 1,
-0.4904983, 1.859663, -0.2541655, 0.1803922, 1, 0, 1,
-0.4892249, 0.4373554, 0.3656568, 0.1764706, 1, 0, 1,
-0.488356, -0.03620293, -1.121648, 0.1686275, 1, 0, 1,
-0.4872309, -1.285484, -2.160243, 0.1647059, 1, 0, 1,
-0.4856182, -0.953304, -2.954099, 0.1568628, 1, 0, 1,
-0.4848854, -0.3274618, -2.317619, 0.1529412, 1, 0, 1,
-0.4838219, 1.185863, -0.3081444, 0.145098, 1, 0, 1,
-0.4804384, 0.1419318, -0.6500911, 0.1411765, 1, 0, 1,
-0.4773082, -0.07514824, -1.327698, 0.1333333, 1, 0, 1,
-0.4722086, -1.208545, -3.020295, 0.1294118, 1, 0, 1,
-0.4721006, 0.9763337, 0.5243514, 0.1215686, 1, 0, 1,
-0.4719572, -1.144064, -4.527876, 0.1176471, 1, 0, 1,
-0.4654969, 1.609087, -0.1524063, 0.1098039, 1, 0, 1,
-0.4654167, -0.4784001, -2.597341, 0.1058824, 1, 0, 1,
-0.4620206, 0.7616709, -0.1742511, 0.09803922, 1, 0, 1,
-0.4618149, -0.3029411, -2.240133, 0.09019608, 1, 0, 1,
-0.4539474, -0.5890602, -2.170977, 0.08627451, 1, 0, 1,
-0.4510179, 1.676903, -0.2144174, 0.07843138, 1, 0, 1,
-0.4478181, -0.5054578, -1.966508, 0.07450981, 1, 0, 1,
-0.442573, -0.7211282, -2.127589, 0.06666667, 1, 0, 1,
-0.4358731, 1.537704, -0.3736464, 0.0627451, 1, 0, 1,
-0.431481, -0.01330576, -2.254465, 0.05490196, 1, 0, 1,
-0.4301665, 0.8844578, 0.2408723, 0.05098039, 1, 0, 1,
-0.4284263, 1.286616, -2.526406, 0.04313726, 1, 0, 1,
-0.4278003, 1.368085, -1.114031, 0.03921569, 1, 0, 1,
-0.4259224, -0.1335735, -1.588061, 0.03137255, 1, 0, 1,
-0.4170239, -0.3093924, -1.429358, 0.02745098, 1, 0, 1,
-0.4150408, -1.164217, -3.07213, 0.01960784, 1, 0, 1,
-0.4125084, 0.09930544, -1.372479, 0.01568628, 1, 0, 1,
-0.4112056, -1.319385, -3.602413, 0.007843138, 1, 0, 1,
-0.4086898, 1.825837, -0.8478504, 0.003921569, 1, 0, 1,
-0.4084451, -0.7946011, -3.955263, 0, 1, 0.003921569, 1,
-0.4068921, -0.1623046, -1.556772, 0, 1, 0.01176471, 1,
-0.3951956, 0.9426419, 0.5383528, 0, 1, 0.01568628, 1,
-0.3946646, -0.118263, -0.6982521, 0, 1, 0.02352941, 1,
-0.3934838, 1.003083, -1.625775, 0, 1, 0.02745098, 1,
-0.3906617, 0.2641877, -1.136119, 0, 1, 0.03529412, 1,
-0.3873949, -2.6127, -3.027733, 0, 1, 0.03921569, 1,
-0.3842813, 0.06577432, -0.1956586, 0, 1, 0.04705882, 1,
-0.3824109, -0.1294822, -1.193826, 0, 1, 0.05098039, 1,
-0.3819264, -0.3914741, -1.801135, 0, 1, 0.05882353, 1,
-0.3781579, -0.2931114, -2.343937, 0, 1, 0.0627451, 1,
-0.3774892, 0.8753704, 0.8967134, 0, 1, 0.07058824, 1,
-0.3761958, -0.7838535, -0.8351815, 0, 1, 0.07450981, 1,
-0.37556, -1.595324, -1.584486, 0, 1, 0.08235294, 1,
-0.3697349, -0.3037831, -0.3785261, 0, 1, 0.08627451, 1,
-0.3688626, 1.625793, 0.01005965, 0, 1, 0.09411765, 1,
-0.3662094, -0.8481374, -1.667345, 0, 1, 0.1019608, 1,
-0.3631954, 0.6500813, -1.336643, 0, 1, 0.1058824, 1,
-0.3608222, 0.2879616, -0.794449, 0, 1, 0.1137255, 1,
-0.3606894, 0.4052445, -1.042523, 0, 1, 0.1176471, 1,
-0.3590366, -1.537956, -3.231758, 0, 1, 0.1254902, 1,
-0.3569125, -2.578908, -2.926074, 0, 1, 0.1294118, 1,
-0.3559943, -0.5018966, -2.460488, 0, 1, 0.1372549, 1,
-0.3551828, 0.140586, -1.568017, 0, 1, 0.1411765, 1,
-0.3509405, -0.5325096, -3.228217, 0, 1, 0.1490196, 1,
-0.3493421, 1.089805, -0.6080564, 0, 1, 0.1529412, 1,
-0.3478992, -1.056884, -2.415279, 0, 1, 0.1607843, 1,
-0.346804, -1.215699, -2.847265, 0, 1, 0.1647059, 1,
-0.3448824, -1.005722, -1.131563, 0, 1, 0.172549, 1,
-0.3394532, -0.6031759, -2.263937, 0, 1, 0.1764706, 1,
-0.3370463, 0.9915612, 0.6949429, 0, 1, 0.1843137, 1,
-0.3354624, 1.64457, 0.4342273, 0, 1, 0.1882353, 1,
-0.3340094, -0.8444103, -1.883973, 0, 1, 0.1960784, 1,
-0.3310486, -1.568628, -2.698202, 0, 1, 0.2039216, 1,
-0.3274292, 0.651317, -0.5470384, 0, 1, 0.2078431, 1,
-0.3257729, 1.927428, 0.3926796, 0, 1, 0.2156863, 1,
-0.3244584, 0.3868659, 0.5278857, 0, 1, 0.2196078, 1,
-0.3239062, -0.1698769, -1.866225, 0, 1, 0.227451, 1,
-0.323581, 0.4546343, -0.9938274, 0, 1, 0.2313726, 1,
-0.319768, 1.844495, 0.7397529, 0, 1, 0.2392157, 1,
-0.3134398, 0.8103673, 0.1121071, 0, 1, 0.2431373, 1,
-0.3130866, -0.09146626, -1.184374, 0, 1, 0.2509804, 1,
-0.3127652, -0.6119707, -2.669198, 0, 1, 0.254902, 1,
-0.312611, 3.009906, 2.039203, 0, 1, 0.2627451, 1,
-0.312317, -1.091519, -1.461636, 0, 1, 0.2666667, 1,
-0.3119111, 0.3089847, -2.527551, 0, 1, 0.2745098, 1,
-0.3116522, -0.8564028, -2.600699, 0, 1, 0.2784314, 1,
-0.3109636, 1.585909, 0.6628956, 0, 1, 0.2862745, 1,
-0.307224, 0.996944, 1.667952, 0, 1, 0.2901961, 1,
-0.3033248, 1.773343, -0.07715818, 0, 1, 0.2980392, 1,
-0.3027391, 1.197745, 0.9595258, 0, 1, 0.3058824, 1,
-0.3013364, -0.3970162, -3.590663, 0, 1, 0.3098039, 1,
-0.3009238, 0.6265097, 0.6740486, 0, 1, 0.3176471, 1,
-0.2992602, 0.434108, -0.7937565, 0, 1, 0.3215686, 1,
-0.2932371, -2.535905, -2.432268, 0, 1, 0.3294118, 1,
-0.291792, -0.4613802, -2.447359, 0, 1, 0.3333333, 1,
-0.2914344, -1.133587, -3.057367, 0, 1, 0.3411765, 1,
-0.2878097, 0.7743739, -0.7896128, 0, 1, 0.345098, 1,
-0.2864566, -0.1843935, -3.123235, 0, 1, 0.3529412, 1,
-0.2857057, 0.7552242, 1.430354, 0, 1, 0.3568628, 1,
-0.2854539, -0.1794485, -1.699414, 0, 1, 0.3647059, 1,
-0.2827599, 0.8781157, -0.9583174, 0, 1, 0.3686275, 1,
-0.2751558, 0.6004388, -0.7234371, 0, 1, 0.3764706, 1,
-0.2732829, 1.40334, 0.08657397, 0, 1, 0.3803922, 1,
-0.2671375, 1.129667, -0.7224686, 0, 1, 0.3882353, 1,
-0.2669172, 0.2244435, -1.346849, 0, 1, 0.3921569, 1,
-0.2610051, 0.5244416, 0.007902523, 0, 1, 0.4, 1,
-0.2608456, 0.1669766, -1.809021, 0, 1, 0.4078431, 1,
-0.2575429, 0.5427272, 0.2659635, 0, 1, 0.4117647, 1,
-0.2555473, 0.8806192, -0.5563985, 0, 1, 0.4196078, 1,
-0.2529917, -0.1432418, -2.429562, 0, 1, 0.4235294, 1,
-0.2512568, 0.5890879, -0.5414233, 0, 1, 0.4313726, 1,
-0.2424575, 0.1586548, -4.122869, 0, 1, 0.4352941, 1,
-0.2372596, 0.5432181, -0.7096653, 0, 1, 0.4431373, 1,
-0.2365768, 0.9909354, -1.534849, 0, 1, 0.4470588, 1,
-0.2333924, -0.6142821, -3.532601, 0, 1, 0.454902, 1,
-0.2328464, 0.3989238, -1.987252, 0, 1, 0.4588235, 1,
-0.2296521, -2.110604, -0.1500817, 0, 1, 0.4666667, 1,
-0.2253108, 0.6511953, 0.3839989, 0, 1, 0.4705882, 1,
-0.2251922, 1.340819, -0.4618182, 0, 1, 0.4784314, 1,
-0.2199101, 1.445669, -0.7332343, 0, 1, 0.4823529, 1,
-0.2178504, -1.111767, -2.492446, 0, 1, 0.4901961, 1,
-0.2032328, -1.975301, -2.344548, 0, 1, 0.4941176, 1,
-0.1980982, 0.4596959, -1.898767, 0, 1, 0.5019608, 1,
-0.1966228, 1.554638, 0.3986627, 0, 1, 0.509804, 1,
-0.1947846, 0.7801757, 0.9155447, 0, 1, 0.5137255, 1,
-0.1946196, 0.6172233, 0.9228613, 0, 1, 0.5215687, 1,
-0.1932107, 1.576936, -2.720012, 0, 1, 0.5254902, 1,
-0.1895584, 0.5130883, -0.85443, 0, 1, 0.5333334, 1,
-0.1887746, 0.5083604, -0.2204722, 0, 1, 0.5372549, 1,
-0.1860864, 0.4488905, -0.520437, 0, 1, 0.5450981, 1,
-0.1858278, 0.5030553, -0.005137088, 0, 1, 0.5490196, 1,
-0.1785226, -1.197287, -2.473205, 0, 1, 0.5568628, 1,
-0.1773235, -1.459448, -4.802265, 0, 1, 0.5607843, 1,
-0.17674, 1.284729, -3.030534, 0, 1, 0.5686275, 1,
-0.1716894, -1.648953, -4.783607, 0, 1, 0.572549, 1,
-0.1716508, -0.6908185, -1.911652, 0, 1, 0.5803922, 1,
-0.1697323, -1.522117, -4.441384, 0, 1, 0.5843138, 1,
-0.1624995, -0.1004725, -2.441871, 0, 1, 0.5921569, 1,
-0.1591816, 0.120915, -1.912313, 0, 1, 0.5960785, 1,
-0.1587882, 0.7886208, -0.7951509, 0, 1, 0.6039216, 1,
-0.1567879, -0.2195588, -1.642381, 0, 1, 0.6117647, 1,
-0.1554789, -0.662054, -2.814204, 0, 1, 0.6156863, 1,
-0.1527184, -1.062687, -3.852222, 0, 1, 0.6235294, 1,
-0.1520407, -0.7206866, -3.811935, 0, 1, 0.627451, 1,
-0.1482658, -0.7141718, -4.784706, 0, 1, 0.6352941, 1,
-0.1475834, 0.407193, -0.4572397, 0, 1, 0.6392157, 1,
-0.145879, 0.2132421, -1.376845, 0, 1, 0.6470588, 1,
-0.14402, -1.632749, -3.592755, 0, 1, 0.6509804, 1,
-0.1439452, 1.72735, 0.7421529, 0, 1, 0.6588235, 1,
-0.1370988, -0.6482571, -4.143811, 0, 1, 0.6627451, 1,
-0.1351757, -0.5714802, -2.212371, 0, 1, 0.6705883, 1,
-0.1325567, 1.737281, -0.781261, 0, 1, 0.6745098, 1,
-0.1324205, -0.8322514, -2.720379, 0, 1, 0.682353, 1,
-0.1302381, -0.4348578, -2.23876, 0, 1, 0.6862745, 1,
-0.1276515, -1.068804, -2.586322, 0, 1, 0.6941177, 1,
-0.1273982, -0.4606622, -2.572337, 0, 1, 0.7019608, 1,
-0.1217191, 0.1220304, -0.2215103, 0, 1, 0.7058824, 1,
-0.1212405, -0.950817, -4.076192, 0, 1, 0.7137255, 1,
-0.1193017, 0.8096393, -0.04520263, 0, 1, 0.7176471, 1,
-0.1182656, 0.7475432, -0.7097501, 0, 1, 0.7254902, 1,
-0.1180421, 1.935514, -0.575129, 0, 1, 0.7294118, 1,
-0.1167297, -0.3610855, -1.97008, 0, 1, 0.7372549, 1,
-0.1151916, 0.3030559, -1.297481, 0, 1, 0.7411765, 1,
-0.1141599, -0.4178229, -3.132248, 0, 1, 0.7490196, 1,
-0.1139408, -0.5165929, -4.337199, 0, 1, 0.7529412, 1,
-0.1112352, 1.439416, -0.6421165, 0, 1, 0.7607843, 1,
-0.1066455, 1.036976, 1.073431, 0, 1, 0.7647059, 1,
-0.105064, -1.268464, -1.992723, 0, 1, 0.772549, 1,
-0.1045877, -0.9103944, -3.922572, 0, 1, 0.7764706, 1,
-0.1034861, 0.780852, 1.114029, 0, 1, 0.7843137, 1,
-0.1028736, -1.667535, -3.558706, 0, 1, 0.7882353, 1,
-0.09600829, -1.94676, -1.861079, 0, 1, 0.7960784, 1,
-0.09580754, -0.8448116, -2.908983, 0, 1, 0.8039216, 1,
-0.09378453, 0.1389375, -1.34614, 0, 1, 0.8078431, 1,
-0.09317297, 0.6557488, 0.948732, 0, 1, 0.8156863, 1,
-0.09192978, -0.6417782, -2.790411, 0, 1, 0.8196079, 1,
-0.09166103, -1.849023, -2.888456, 0, 1, 0.827451, 1,
-0.09130783, -0.2622223, -4.061378, 0, 1, 0.8313726, 1,
-0.09129278, 0.5545511, 0.2613456, 0, 1, 0.8392157, 1,
-0.08681405, -0.7581741, -2.922718, 0, 1, 0.8431373, 1,
-0.08251327, 0.1895304, 1.199004, 0, 1, 0.8509804, 1,
-0.08096913, 1.009314, 0.6377248, 0, 1, 0.854902, 1,
-0.08025301, -0.3939399, -1.230703, 0, 1, 0.8627451, 1,
-0.07624907, 1.03237, -1.961386, 0, 1, 0.8666667, 1,
-0.07559025, -1.221947, -1.099607, 0, 1, 0.8745098, 1,
-0.07177901, 0.2962355, 1.380259, 0, 1, 0.8784314, 1,
-0.05699103, -0.3916678, -2.655706, 0, 1, 0.8862745, 1,
-0.05578427, 0.4194118, 1.455758, 0, 1, 0.8901961, 1,
-0.05332699, -0.9074792, -3.477843, 0, 1, 0.8980392, 1,
-0.05328374, -0.11745, -4.06573, 0, 1, 0.9058824, 1,
-0.05161576, -1.175055, -2.527892, 0, 1, 0.9098039, 1,
-0.048312, 0.3928869, -0.8406391, 0, 1, 0.9176471, 1,
-0.04685946, 0.4695132, -0.4638996, 0, 1, 0.9215686, 1,
-0.04151838, -0.483027, -2.001527, 0, 1, 0.9294118, 1,
-0.04142142, 0.5069268, -1.714567, 0, 1, 0.9333333, 1,
-0.03970811, -0.9016132, -3.818768, 0, 1, 0.9411765, 1,
-0.03400861, 0.9178877, -0.3206287, 0, 1, 0.945098, 1,
-0.0310043, 0.2691089, -0.4350911, 0, 1, 0.9529412, 1,
-0.02907315, 0.165945, -1.273371, 0, 1, 0.9568627, 1,
-0.02892151, -0.3553217, -1.186391, 0, 1, 0.9647059, 1,
-0.02708321, -0.8988814, -3.038826, 0, 1, 0.9686275, 1,
-0.02292129, -0.5988753, -3.890877, 0, 1, 0.9764706, 1,
-0.01863018, -0.3720367, -2.834758, 0, 1, 0.9803922, 1,
-0.01822715, -0.1992638, -3.407658, 0, 1, 0.9882353, 1,
-0.01360356, -0.7878742, -2.573431, 0, 1, 0.9921569, 1,
-0.01294169, 0.5219382, -0.2117452, 0, 1, 1, 1,
-0.004330637, -0.7010427, -1.888545, 0, 0.9921569, 1, 1,
0.0009689383, -0.6841478, 2.678008, 0, 0.9882353, 1, 1,
0.001814961, -0.5542959, 1.824743, 0, 0.9803922, 1, 1,
0.002489408, 1.280096, 0.4626927, 0, 0.9764706, 1, 1,
0.002988039, -0.5639228, 2.161125, 0, 0.9686275, 1, 1,
0.003116623, -0.8724555, 2.191305, 0, 0.9647059, 1, 1,
0.004738336, -0.595819, 3.432709, 0, 0.9568627, 1, 1,
0.007790574, 0.9992866, -1.155912, 0, 0.9529412, 1, 1,
0.01195518, 0.4347455, 0.706618, 0, 0.945098, 1, 1,
0.01503092, 0.08056056, 0.5887223, 0, 0.9411765, 1, 1,
0.01659315, 0.5772133, 0.4335285, 0, 0.9333333, 1, 1,
0.0171538, 0.04434823, 0.06953648, 0, 0.9294118, 1, 1,
0.01950317, 0.937686, 2.349728, 0, 0.9215686, 1, 1,
0.02090712, 0.9816627, 0.4844703, 0, 0.9176471, 1, 1,
0.02138856, -0.6589999, 1.974376, 0, 0.9098039, 1, 1,
0.02255457, 0.1298036, 0.4356876, 0, 0.9058824, 1, 1,
0.0226994, -0.07277519, 3.610546, 0, 0.8980392, 1, 1,
0.02560307, -1.119823, 2.120686, 0, 0.8901961, 1, 1,
0.02614078, -0.8832918, 3.129348, 0, 0.8862745, 1, 1,
0.03040802, -0.6641843, 2.471504, 0, 0.8784314, 1, 1,
0.0332028, -2.636101, 2.791175, 0, 0.8745098, 1, 1,
0.03335125, 0.3851443, -0.3283744, 0, 0.8666667, 1, 1,
0.03448721, -1.411275, 2.189263, 0, 0.8627451, 1, 1,
0.03654564, -0.8976268, 1.954128, 0, 0.854902, 1, 1,
0.04161094, 0.7708318, 0.2097207, 0, 0.8509804, 1, 1,
0.04165475, 1.188022, -0.8992319, 0, 0.8431373, 1, 1,
0.04687718, -0.1060538, 4.049689, 0, 0.8392157, 1, 1,
0.04901646, 1.337599, -0.9849219, 0, 0.8313726, 1, 1,
0.04975315, 1.315055, 1.808015, 0, 0.827451, 1, 1,
0.05071514, -0.1953792, 3.78832, 0, 0.8196079, 1, 1,
0.05361826, 1.164275, -0.04512554, 0, 0.8156863, 1, 1,
0.05584835, 0.3504629, -1.191411, 0, 0.8078431, 1, 1,
0.05767585, 0.04224126, 0.01413631, 0, 0.8039216, 1, 1,
0.06286216, -0.9583732, 3.783216, 0, 0.7960784, 1, 1,
0.06329596, -0.6978158, 2.858724, 0, 0.7882353, 1, 1,
0.06846314, 0.2203129, 0.4958333, 0, 0.7843137, 1, 1,
0.06868989, -1.111845, 3.103304, 0, 0.7764706, 1, 1,
0.07021896, 0.9172847, 0.1770011, 0, 0.772549, 1, 1,
0.0757452, 1.373774, -0.06988032, 0, 0.7647059, 1, 1,
0.07831915, -0.5269889, 3.604179, 0, 0.7607843, 1, 1,
0.07998251, -0.5103362, 1.716141, 0, 0.7529412, 1, 1,
0.08693788, 1.024674, 2.514646, 0, 0.7490196, 1, 1,
0.08914963, 0.3450952, -0.6866146, 0, 0.7411765, 1, 1,
0.09938071, 0.8956671, -0.338423, 0, 0.7372549, 1, 1,
0.1013105, 1.022173, -0.3436301, 0, 0.7294118, 1, 1,
0.1032806, -0.981546, 3.918188, 0, 0.7254902, 1, 1,
0.1085478, 0.01276619, 1.138906, 0, 0.7176471, 1, 1,
0.1111283, 0.5238352, -1.218181, 0, 0.7137255, 1, 1,
0.1252044, 0.1881066, 0.2211097, 0, 0.7058824, 1, 1,
0.1255422, 1.519716, 0.8585269, 0, 0.6980392, 1, 1,
0.1256509, 0.143249, -0.101291, 0, 0.6941177, 1, 1,
0.1262123, -0.2039141, 2.897655, 0, 0.6862745, 1, 1,
0.1264932, 0.3754882, 0.3271144, 0, 0.682353, 1, 1,
0.1279295, -0.504988, 2.533042, 0, 0.6745098, 1, 1,
0.1382743, -1.052045, 2.129796, 0, 0.6705883, 1, 1,
0.1459629, -0.8557832, 1.766827, 0, 0.6627451, 1, 1,
0.1464212, 1.136814, -0.8851982, 0, 0.6588235, 1, 1,
0.1499328, -2.144324, 2.586135, 0, 0.6509804, 1, 1,
0.1512201, -0.9402748, 2.941163, 0, 0.6470588, 1, 1,
0.1550517, -0.3310477, 3.531455, 0, 0.6392157, 1, 1,
0.1560937, -1.662767, 1.412975, 0, 0.6352941, 1, 1,
0.160337, -1.118011, 3.062939, 0, 0.627451, 1, 1,
0.1610753, 1.49563, 0.6477389, 0, 0.6235294, 1, 1,
0.1644434, 0.6744261, -2.067977, 0, 0.6156863, 1, 1,
0.1692877, 0.6327155, 0.09298257, 0, 0.6117647, 1, 1,
0.1716827, -0.531334, 3.566272, 0, 0.6039216, 1, 1,
0.1775715, -1.595768, 2.931463, 0, 0.5960785, 1, 1,
0.1778294, -0.1659934, 2.702852, 0, 0.5921569, 1, 1,
0.1812418, -0.2416774, 2.842281, 0, 0.5843138, 1, 1,
0.1820516, -1.726353, 3.18172, 0, 0.5803922, 1, 1,
0.1824725, 0.4369062, -0.8607135, 0, 0.572549, 1, 1,
0.1859555, 1.041581, -0.9809685, 0, 0.5686275, 1, 1,
0.1860419, -0.4247791, 2.906528, 0, 0.5607843, 1, 1,
0.1900223, 0.4503672, 0.8076147, 0, 0.5568628, 1, 1,
0.193508, -0.6493229, 3.384979, 0, 0.5490196, 1, 1,
0.1946298, -0.3026473, 3.257951, 0, 0.5450981, 1, 1,
0.2034634, -0.2948669, 3.754838, 0, 0.5372549, 1, 1,
0.2042775, -1.196996, 3.584309, 0, 0.5333334, 1, 1,
0.2056006, 0.2085868, 1.907324, 0, 0.5254902, 1, 1,
0.2109896, -2.459882, 2.317272, 0, 0.5215687, 1, 1,
0.2200727, 1.529381, -0.08439682, 0, 0.5137255, 1, 1,
0.2205572, -1.213612, 2.394535, 0, 0.509804, 1, 1,
0.2322995, -1.630878, 3.037222, 0, 0.5019608, 1, 1,
0.2331332, -0.4707528, 3.561236, 0, 0.4941176, 1, 1,
0.2376315, -1.042115, 0.07037404, 0, 0.4901961, 1, 1,
0.239645, 0.4280895, 0.4768192, 0, 0.4823529, 1, 1,
0.246696, 1.132167, 0.3987301, 0, 0.4784314, 1, 1,
0.2517936, -2.40705, 4.839384, 0, 0.4705882, 1, 1,
0.2532277, -0.5782611, 1.898629, 0, 0.4666667, 1, 1,
0.2547972, -0.3676148, 1.795168, 0, 0.4588235, 1, 1,
0.2578051, -2.06337, 4.136952, 0, 0.454902, 1, 1,
0.261905, 1.489491, -1.609663, 0, 0.4470588, 1, 1,
0.2653979, -0.0553469, 2.889981, 0, 0.4431373, 1, 1,
0.2673355, 0.6360375, 1.766514, 0, 0.4352941, 1, 1,
0.2685894, -1.029565, 4.151667, 0, 0.4313726, 1, 1,
0.2699524, -0.8353857, 2.603285, 0, 0.4235294, 1, 1,
0.2718346, -1.747516, 2.434839, 0, 0.4196078, 1, 1,
0.2731489, -0.3164639, 4.988975, 0, 0.4117647, 1, 1,
0.2851968, -1.564284, 2.51179, 0, 0.4078431, 1, 1,
0.285305, -1.767298, 4.174395, 0, 0.4, 1, 1,
0.2902341, 1.480036, 2.004232, 0, 0.3921569, 1, 1,
0.2917823, -1.915333, 2.504026, 0, 0.3882353, 1, 1,
0.2924067, -1.405324, 2.280479, 0, 0.3803922, 1, 1,
0.2933505, 1.824546, 2.004195, 0, 0.3764706, 1, 1,
0.2960157, -0.4222316, -0.09877848, 0, 0.3686275, 1, 1,
0.3013037, 0.4249346, 2.727811, 0, 0.3647059, 1, 1,
0.3025324, -0.3761301, 1.365995, 0, 0.3568628, 1, 1,
0.3055254, 1.372328, 0.2807755, 0, 0.3529412, 1, 1,
0.3061021, -0.1731102, 2.559878, 0, 0.345098, 1, 1,
0.3075553, 0.2064755, 0.5672153, 0, 0.3411765, 1, 1,
0.3109208, 1.705177, -0.1525135, 0, 0.3333333, 1, 1,
0.3162978, -0.9619193, 1.601215, 0, 0.3294118, 1, 1,
0.3169641, -0.08459674, 1.745398, 0, 0.3215686, 1, 1,
0.3184223, 1.841036, -0.02930758, 0, 0.3176471, 1, 1,
0.3224328, 2.435855, 0.3749854, 0, 0.3098039, 1, 1,
0.3248886, -1.175762, 2.544592, 0, 0.3058824, 1, 1,
0.3261143, 1.090006, 1.465546, 0, 0.2980392, 1, 1,
0.3293122, 0.9386531, -0.4195823, 0, 0.2901961, 1, 1,
0.3302487, 0.7310831, 0.467567, 0, 0.2862745, 1, 1,
0.3338922, -0.3148092, 1.319745, 0, 0.2784314, 1, 1,
0.3421539, 1.022178, -1.173519, 0, 0.2745098, 1, 1,
0.3463039, 1.742938, 0.3522867, 0, 0.2666667, 1, 1,
0.3507176, -0.06209778, 1.205459, 0, 0.2627451, 1, 1,
0.3513798, 1.659054, -0.3557593, 0, 0.254902, 1, 1,
0.3522446, 0.7613569, 2.418264, 0, 0.2509804, 1, 1,
0.3523142, 0.4467942, -0.1989672, 0, 0.2431373, 1, 1,
0.3555657, -2.228842, 3.660859, 0, 0.2392157, 1, 1,
0.3662032, -0.1955711, 2.872009, 0, 0.2313726, 1, 1,
0.3670646, -1.114457, 1.646243, 0, 0.227451, 1, 1,
0.3705957, 1.146616, -1.513909, 0, 0.2196078, 1, 1,
0.3791558, -0.5600525, 0.7404711, 0, 0.2156863, 1, 1,
0.3796854, -0.3143972, 1.832772, 0, 0.2078431, 1, 1,
0.3806638, 0.1118174, -0.9423623, 0, 0.2039216, 1, 1,
0.381965, 1.758012, 0.4442889, 0, 0.1960784, 1, 1,
0.3826388, -0.1091958, 0.3883942, 0, 0.1882353, 1, 1,
0.3852539, 0.1649238, 1.508401, 0, 0.1843137, 1, 1,
0.3920542, 0.1397127, -0.2605932, 0, 0.1764706, 1, 1,
0.3939382, -1.114965, 2.499688, 0, 0.172549, 1, 1,
0.3953762, 0.6405814, 0.5276546, 0, 0.1647059, 1, 1,
0.3973052, 0.2147122, 1.540746, 0, 0.1607843, 1, 1,
0.4019987, 0.9010923, -0.9204327, 0, 0.1529412, 1, 1,
0.4068088, -0.1973169, -0.2105772, 0, 0.1490196, 1, 1,
0.4091863, -1.582345, 0.8973697, 0, 0.1411765, 1, 1,
0.4104121, -0.4893894, 2.671514, 0, 0.1372549, 1, 1,
0.412524, 1.773039, -1.474134, 0, 0.1294118, 1, 1,
0.4162958, -0.8112804, 1.644332, 0, 0.1254902, 1, 1,
0.4171773, 1.148469, 1.007339, 0, 0.1176471, 1, 1,
0.4185092, 0.3220307, 0.07536547, 0, 0.1137255, 1, 1,
0.4243567, -0.4642261, 1.54579, 0, 0.1058824, 1, 1,
0.4273175, 2.501722, -0.6059589, 0, 0.09803922, 1, 1,
0.4285932, 0.9129196, -1.174899, 0, 0.09411765, 1, 1,
0.4297912, -0.986607, 3.904605, 0, 0.08627451, 1, 1,
0.4323646, 0.3761924, 1.433395, 0, 0.08235294, 1, 1,
0.4385355, -1.185711, 3.208419, 0, 0.07450981, 1, 1,
0.4394275, -0.593017, 4.24664, 0, 0.07058824, 1, 1,
0.440936, 1.200287, 1.642936, 0, 0.0627451, 1, 1,
0.4437872, 0.8333583, -0.9542558, 0, 0.05882353, 1, 1,
0.4476945, -1.236119, 4.331051, 0, 0.05098039, 1, 1,
0.4506018, 0.6127242, 1.167096, 0, 0.04705882, 1, 1,
0.4573254, -0.06856788, 1.456437, 0, 0.03921569, 1, 1,
0.458926, -0.6842731, 2.895979, 0, 0.03529412, 1, 1,
0.4597, -0.3029147, 1.754368, 0, 0.02745098, 1, 1,
0.4630407, -0.6546755, 3.662766, 0, 0.02352941, 1, 1,
0.4670875, -0.47723, 1.978587, 0, 0.01568628, 1, 1,
0.4684599, 0.6718734, 1.174007, 0, 0.01176471, 1, 1,
0.4698251, -1.177301, 5.012011, 0, 0.003921569, 1, 1,
0.4711654, 1.141249, 0.06988391, 0.003921569, 0, 1, 1,
0.4724026, -0.7663922, 0.005949489, 0.007843138, 0, 1, 1,
0.4728638, -2.025418, 1.239476, 0.01568628, 0, 1, 1,
0.4745947, 0.7967182, 0.7808466, 0.01960784, 0, 1, 1,
0.4772848, 1.340043, -0.8028209, 0.02745098, 0, 1, 1,
0.4780752, -1.507622, 3.936056, 0.03137255, 0, 1, 1,
0.47868, -0.773128, 2.17732, 0.03921569, 0, 1, 1,
0.486558, 0.3809472, 0.1463826, 0.04313726, 0, 1, 1,
0.4914989, 0.4647923, 0.8998025, 0.05098039, 0, 1, 1,
0.4916809, -0.2969734, 2.694721, 0.05490196, 0, 1, 1,
0.4981492, -0.8455047, 3.015119, 0.0627451, 0, 1, 1,
0.5003694, -0.4839433, -0.5063257, 0.06666667, 0, 1, 1,
0.5017881, 1.071656, -2.332672, 0.07450981, 0, 1, 1,
0.5039324, 0.4786765, 0.7250288, 0.07843138, 0, 1, 1,
0.504349, 0.1523237, 0.4144369, 0.08627451, 0, 1, 1,
0.5046564, 0.4375064, 0.1030395, 0.09019608, 0, 1, 1,
0.5050237, 0.9501581, -0.5137268, 0.09803922, 0, 1, 1,
0.5072834, -0.5669959, 2.979058, 0.1058824, 0, 1, 1,
0.5087142, -0.6731983, 2.616498, 0.1098039, 0, 1, 1,
0.5109956, 0.7806979, 0.27949, 0.1176471, 0, 1, 1,
0.5120581, -0.4701975, 0.8569704, 0.1215686, 0, 1, 1,
0.5178628, -0.1150603, 1.613351, 0.1294118, 0, 1, 1,
0.520866, 1.246299, 0.2265343, 0.1333333, 0, 1, 1,
0.5276728, -2.172451, 3.597067, 0.1411765, 0, 1, 1,
0.5277364, -2.34407, 2.559408, 0.145098, 0, 1, 1,
0.5314534, 0.1262242, 0.4437454, 0.1529412, 0, 1, 1,
0.5325559, 0.4604785, -0.1763805, 0.1568628, 0, 1, 1,
0.5337024, -0.5328875, 1.879031, 0.1647059, 0, 1, 1,
0.5353531, -1.102544, 4.171555, 0.1686275, 0, 1, 1,
0.5353938, 0.5192803, 1.230381, 0.1764706, 0, 1, 1,
0.5369615, -1.495374, 4.042786, 0.1803922, 0, 1, 1,
0.5432935, 1.113737, 1.064944, 0.1882353, 0, 1, 1,
0.5447478, 2.25411, 0.7795535, 0.1921569, 0, 1, 1,
0.5506617, 0.7566387, 2.310382, 0.2, 0, 1, 1,
0.553866, 0.7139145, 1.589873, 0.2078431, 0, 1, 1,
0.5541836, -0.09554341, 2.230076, 0.2117647, 0, 1, 1,
0.5585258, 0.3047744, -0.5498716, 0.2196078, 0, 1, 1,
0.5602556, 0.9942622, -1.250156, 0.2235294, 0, 1, 1,
0.5671375, -0.5410937, 1.462264, 0.2313726, 0, 1, 1,
0.568359, 0.7987452, 0.4821826, 0.2352941, 0, 1, 1,
0.5709415, -0.5257691, 0.6120967, 0.2431373, 0, 1, 1,
0.5712862, 0.679057, -0.5701833, 0.2470588, 0, 1, 1,
0.573247, -1.409671, 1.990258, 0.254902, 0, 1, 1,
0.57356, 0.06567849, 2.524953, 0.2588235, 0, 1, 1,
0.5750684, -0.6650988, 2.314359, 0.2666667, 0, 1, 1,
0.5795487, 0.751219, 0.5624273, 0.2705882, 0, 1, 1,
0.5810689, 0.5627635, -1.289145, 0.2784314, 0, 1, 1,
0.5823601, 0.4776058, 0.8296249, 0.282353, 0, 1, 1,
0.5895596, -1.560467, 2.333934, 0.2901961, 0, 1, 1,
0.589887, -0.2970583, 2.852208, 0.2941177, 0, 1, 1,
0.5909907, -0.8885226, 3.075657, 0.3019608, 0, 1, 1,
0.5968776, -1.094979, 3.19924, 0.3098039, 0, 1, 1,
0.5972022, 2.059937, 2.184023, 0.3137255, 0, 1, 1,
0.5988075, 2.133295, 1.002413, 0.3215686, 0, 1, 1,
0.6020675, 0.725493, 0.9557583, 0.3254902, 0, 1, 1,
0.602595, -1.747032, 1.257982, 0.3333333, 0, 1, 1,
0.6050766, 0.2399509, 1.863274, 0.3372549, 0, 1, 1,
0.6069699, -0.8715614, 3.258514, 0.345098, 0, 1, 1,
0.6071917, -1.082121, 0.1856949, 0.3490196, 0, 1, 1,
0.6193184, -0.8600996, 1.994019, 0.3568628, 0, 1, 1,
0.6246622, -1.474905, 4.574758, 0.3607843, 0, 1, 1,
0.6276245, -1.270874, 2.384389, 0.3686275, 0, 1, 1,
0.6276705, -1.7823, 2.390841, 0.372549, 0, 1, 1,
0.6294112, 0.8501791, -0.10968, 0.3803922, 0, 1, 1,
0.6378076, -0.689644, 4.834875, 0.3843137, 0, 1, 1,
0.6400701, 1.038613, -0.9569581, 0.3921569, 0, 1, 1,
0.6443288, -1.155367, 3.816642, 0.3960784, 0, 1, 1,
0.6445686, 1.272347, 0.3923618, 0.4039216, 0, 1, 1,
0.6447513, -1.220714, 1.827666, 0.4117647, 0, 1, 1,
0.6477756, 0.3206754, 1.561653, 0.4156863, 0, 1, 1,
0.6516214, 0.3092397, 1.166954, 0.4235294, 0, 1, 1,
0.6518107, -0.09079383, 1.899608, 0.427451, 0, 1, 1,
0.6519377, -0.8484547, 2.562514, 0.4352941, 0, 1, 1,
0.6599107, -0.86869, 3.622757, 0.4392157, 0, 1, 1,
0.6701928, -2.002185, 2.748846, 0.4470588, 0, 1, 1,
0.6734678, 0.3514756, 2.018732, 0.4509804, 0, 1, 1,
0.6748736, -0.43057, 1.242872, 0.4588235, 0, 1, 1,
0.6771055, 1.982618, -0.9858142, 0.4627451, 0, 1, 1,
0.6776314, 0.1696852, 1.635344, 0.4705882, 0, 1, 1,
0.6778923, 1.101833, 2.296184, 0.4745098, 0, 1, 1,
0.6799922, 0.3178501, 1.050346, 0.4823529, 0, 1, 1,
0.6825632, 1.037168, 1.646376, 0.4862745, 0, 1, 1,
0.6848508, -0.8086447, 2.946331, 0.4941176, 0, 1, 1,
0.6869925, -0.173749, 2.498242, 0.5019608, 0, 1, 1,
0.6957371, 0.03591646, 2.021266, 0.5058824, 0, 1, 1,
0.6958728, -0.07338986, 2.216136, 0.5137255, 0, 1, 1,
0.7132363, 0.281123, 0.3346907, 0.5176471, 0, 1, 1,
0.7232961, -1.643634, 2.519271, 0.5254902, 0, 1, 1,
0.7237504, -1.491561, 1.325289, 0.5294118, 0, 1, 1,
0.7247752, -0.02278997, 2.400439, 0.5372549, 0, 1, 1,
0.7281547, 0.9951957, 0.8315645, 0.5411765, 0, 1, 1,
0.729592, -0.9322059, 1.966552, 0.5490196, 0, 1, 1,
0.7320174, -1.875333, 2.937687, 0.5529412, 0, 1, 1,
0.733399, 0.3272794, -0.4645401, 0.5607843, 0, 1, 1,
0.7361412, -0.142104, -0.1572585, 0.5647059, 0, 1, 1,
0.7397824, -0.463024, 2.722382, 0.572549, 0, 1, 1,
0.7411832, 0.5424548, 1.224999, 0.5764706, 0, 1, 1,
0.7490242, -1.488768, 3.171448, 0.5843138, 0, 1, 1,
0.7497284, -0.7134125, 3.445842, 0.5882353, 0, 1, 1,
0.7504554, 0.5987334, 1.070563, 0.5960785, 0, 1, 1,
0.7571144, -0.5864486, -0.8714532, 0.6039216, 0, 1, 1,
0.7574686, -0.6733977, -0.4618411, 0.6078432, 0, 1, 1,
0.7581627, 0.3404508, 2.274015, 0.6156863, 0, 1, 1,
0.7589596, -0.606469, 0.7159232, 0.6196079, 0, 1, 1,
0.7609729, 0.4411519, 1.363245, 0.627451, 0, 1, 1,
0.7658184, -0.2931115, 1.984393, 0.6313726, 0, 1, 1,
0.7700363, 0.7563999, 0.8129141, 0.6392157, 0, 1, 1,
0.7705086, -0.4147526, 3.618538, 0.6431373, 0, 1, 1,
0.7724233, 0.01278924, 1.649893, 0.6509804, 0, 1, 1,
0.7732971, 0.2043262, 0.7946823, 0.654902, 0, 1, 1,
0.7733509, -0.7371156, 2.998924, 0.6627451, 0, 1, 1,
0.7761378, -1.224044, 1.152797, 0.6666667, 0, 1, 1,
0.7793766, -1.259076, 2.211715, 0.6745098, 0, 1, 1,
0.7795126, 1.437822, -1.002847, 0.6784314, 0, 1, 1,
0.7892985, 0.900766, -0.6660802, 0.6862745, 0, 1, 1,
0.7939364, 1.287727, -0.5609314, 0.6901961, 0, 1, 1,
0.7945901, 0.2356818, -0.7656232, 0.6980392, 0, 1, 1,
0.7981624, -0.6636416, 1.89022, 0.7058824, 0, 1, 1,
0.7984186, -0.6214654, 2.527683, 0.7098039, 0, 1, 1,
0.8009503, -0.141638, 2.120571, 0.7176471, 0, 1, 1,
0.8053823, -1.252807, 3.22134, 0.7215686, 0, 1, 1,
0.8072699, 0.7537102, -0.5437867, 0.7294118, 0, 1, 1,
0.8176685, -0.04473774, 1.473774, 0.7333333, 0, 1, 1,
0.8239554, 1.645964, 0.3718136, 0.7411765, 0, 1, 1,
0.8262669, -0.08465375, 1.094835, 0.7450981, 0, 1, 1,
0.8287187, -2.755469, 3.575509, 0.7529412, 0, 1, 1,
0.8350883, 0.3645172, 1.588894, 0.7568628, 0, 1, 1,
0.8358052, 0.08024471, 1.567675, 0.7647059, 0, 1, 1,
0.8403176, 0.8412252, -0.3186648, 0.7686275, 0, 1, 1,
0.8434346, -0.03033506, 2.638752, 0.7764706, 0, 1, 1,
0.8490542, 0.5719702, 2.709584, 0.7803922, 0, 1, 1,
0.8586174, -0.1903786, 0.4063764, 0.7882353, 0, 1, 1,
0.8592504, -0.104637, 2.033689, 0.7921569, 0, 1, 1,
0.8596578, 0.7535412, 0.4698682, 0.8, 0, 1, 1,
0.8613415, -0.5837854, 4.463978, 0.8078431, 0, 1, 1,
0.8645128, 0.1179211, 1.731071, 0.8117647, 0, 1, 1,
0.8737633, -0.4498, 0.9543322, 0.8196079, 0, 1, 1,
0.8742172, -0.617013, 2.884008, 0.8235294, 0, 1, 1,
0.87487, 1.459547, -0.3087495, 0.8313726, 0, 1, 1,
0.8791305, 0.6063721, -0.3134113, 0.8352941, 0, 1, 1,
0.8803558, 0.03761338, 2.464986, 0.8431373, 0, 1, 1,
0.8806454, 0.3456568, 2.047601, 0.8470588, 0, 1, 1,
0.8906008, 0.003210917, 2.109682, 0.854902, 0, 1, 1,
0.8909287, -0.3917282, 3.454639, 0.8588235, 0, 1, 1,
0.8931831, 0.802808, 0.2730942, 0.8666667, 0, 1, 1,
0.895817, 1.277527, 0.1571242, 0.8705882, 0, 1, 1,
0.8962337, -1.149375, 3.762281, 0.8784314, 0, 1, 1,
0.9036844, -0.7712195, 0.8022789, 0.8823529, 0, 1, 1,
0.9090003, 1.005397, -1.409137, 0.8901961, 0, 1, 1,
0.9192513, -0.4507165, 1.829733, 0.8941177, 0, 1, 1,
0.922101, 1.820292, 0.7920541, 0.9019608, 0, 1, 1,
0.9245523, -0.3968667, 1.094965, 0.9098039, 0, 1, 1,
0.9246244, 0.9857447, -0.3961037, 0.9137255, 0, 1, 1,
0.9311416, -0.1045506, 0.8697462, 0.9215686, 0, 1, 1,
0.9440898, 0.8162404, 1.200841, 0.9254902, 0, 1, 1,
0.9461552, -1.685506, 1.456737, 0.9333333, 0, 1, 1,
0.9470014, -0.5276173, 3.302697, 0.9372549, 0, 1, 1,
0.9570519, 0.1242726, 0.6680903, 0.945098, 0, 1, 1,
0.9612707, -1.589596, 3.240046, 0.9490196, 0, 1, 1,
0.9633682, 0.04274468, 3.026972, 0.9568627, 0, 1, 1,
0.9676005, 1.731522, 0.6258396, 0.9607843, 0, 1, 1,
0.9696164, 0.2514358, 1.556585, 0.9686275, 0, 1, 1,
0.9720345, 0.8324109, 2.769886, 0.972549, 0, 1, 1,
0.976343, 0.1596899, 1.227851, 0.9803922, 0, 1, 1,
0.9778243, 0.2266269, -0.3070714, 0.9843137, 0, 1, 1,
0.9804898, 1.019472, 1.759873, 0.9921569, 0, 1, 1,
0.9813935, -1.381387, 2.781018, 0.9960784, 0, 1, 1,
0.9851568, 1.023767, 0.007679529, 1, 0, 0.9960784, 1,
0.9900815, -0.9372485, 4.859509, 1, 0, 0.9882353, 1,
0.9909047, -0.7478796, 1.415493, 1, 0, 0.9843137, 1,
0.9951172, -0.3018227, 2.238606, 1, 0, 0.9764706, 1,
0.9992987, 0.3485087, 1.100032, 1, 0, 0.972549, 1,
1.0057, 1.181894, 0.9727107, 1, 0, 0.9647059, 1,
1.005842, 0.3425936, 1.234901, 1, 0, 0.9607843, 1,
1.013971, 2.380081, 1.376937, 1, 0, 0.9529412, 1,
1.014257, -0.8823978, 2.324586, 1, 0, 0.9490196, 1,
1.017941, -0.7262413, 1.361832, 1, 0, 0.9411765, 1,
1.01957, 1.044032, 0.7683242, 1, 0, 0.9372549, 1,
1.0344, 0.4217278, 2.456386, 1, 0, 0.9294118, 1,
1.041359, -1.030339, 1.019533, 1, 0, 0.9254902, 1,
1.04214, 0.9424324, -0.005315608, 1, 0, 0.9176471, 1,
1.045214, -1.603058, 2.301673, 1, 0, 0.9137255, 1,
1.054446, -1.179173, 1.637309, 1, 0, 0.9058824, 1,
1.056559, 0.3130985, -0.2568636, 1, 0, 0.9019608, 1,
1.069916, -2.044932, 4.255423, 1, 0, 0.8941177, 1,
1.072352, 0.2567369, 0.6535339, 1, 0, 0.8862745, 1,
1.0739, -0.2696488, 1.12242, 1, 0, 0.8823529, 1,
1.07443, -0.9232042, 1.871013, 1, 0, 0.8745098, 1,
1.085494, 1.542385, -0.359212, 1, 0, 0.8705882, 1,
1.086831, 0.2167407, 1.255288, 1, 0, 0.8627451, 1,
1.086846, 0.1455653, 2.165947, 1, 0, 0.8588235, 1,
1.0908, -0.6283498, 2.078332, 1, 0, 0.8509804, 1,
1.091551, -0.1232022, 2.248669, 1, 0, 0.8470588, 1,
1.095104, 1.553207, 1.73334, 1, 0, 0.8392157, 1,
1.107873, -0.8294333, 2.426629, 1, 0, 0.8352941, 1,
1.117984, 0.8663812, 1.020607, 1, 0, 0.827451, 1,
1.125825, -0.257898, 0.9872904, 1, 0, 0.8235294, 1,
1.127628, -0.1199102, 1.711858, 1, 0, 0.8156863, 1,
1.137879, -0.7462751, 2.558131, 1, 0, 0.8117647, 1,
1.140307, 0.3855297, 2.206844, 1, 0, 0.8039216, 1,
1.142507, -0.1461671, 3.095833, 1, 0, 0.7960784, 1,
1.144805, 0.6630929, 0.9705598, 1, 0, 0.7921569, 1,
1.148118, -0.618121, 2.976266, 1, 0, 0.7843137, 1,
1.150206, 0.1994472, 1.869885, 1, 0, 0.7803922, 1,
1.154302, 0.5332848, 0.6288278, 1, 0, 0.772549, 1,
1.162606, -0.8216952, 3.102372, 1, 0, 0.7686275, 1,
1.165152, -0.3738531, 3.326696, 1, 0, 0.7607843, 1,
1.171518, 0.05480174, 1.050238, 1, 0, 0.7568628, 1,
1.172485, -0.3302385, 3.390807, 1, 0, 0.7490196, 1,
1.178603, -1.375606, 3.278723, 1, 0, 0.7450981, 1,
1.189138, -1.754856, 1.469278, 1, 0, 0.7372549, 1,
1.191412, 0.1800455, 3.171544, 1, 0, 0.7333333, 1,
1.196287, 0.8078393, 0.5536547, 1, 0, 0.7254902, 1,
1.196329, 0.1909401, 1.652197, 1, 0, 0.7215686, 1,
1.20088, -0.7994071, 2.675135, 1, 0, 0.7137255, 1,
1.206576, 1.310769, 2.656188, 1, 0, 0.7098039, 1,
1.219075, -0.5953966, 3.164036, 1, 0, 0.7019608, 1,
1.22128, -1.249566, 1.186086, 1, 0, 0.6941177, 1,
1.225339, -0.5336858, 3.278469, 1, 0, 0.6901961, 1,
1.225582, 0.4595733, 2.256122, 1, 0, 0.682353, 1,
1.227633, -1.372264, 3.334398, 1, 0, 0.6784314, 1,
1.228666, -1.723427, 3.2477, 1, 0, 0.6705883, 1,
1.234751, 0.03602027, 2.281725, 1, 0, 0.6666667, 1,
1.240884, 0.8108692, 0.3438059, 1, 0, 0.6588235, 1,
1.245834, -1.348775, 2.913811, 1, 0, 0.654902, 1,
1.253803, -0.01630638, -0.3128462, 1, 0, 0.6470588, 1,
1.255002, 2.847291, 1.993016, 1, 0, 0.6431373, 1,
1.255423, 0.3705861, 0.8101759, 1, 0, 0.6352941, 1,
1.261637, -0.7349316, 3.557466, 1, 0, 0.6313726, 1,
1.265025, 0.2151624, 2.233779, 1, 0, 0.6235294, 1,
1.295725, -0.1555375, 2.482177, 1, 0, 0.6196079, 1,
1.298174, -0.6753911, 3.382369, 1, 0, 0.6117647, 1,
1.303072, 1.037224, 1.270226, 1, 0, 0.6078432, 1,
1.312369, -0.1816753, 1.956969, 1, 0, 0.6, 1,
1.321536, 0.5684399, 1.185424, 1, 0, 0.5921569, 1,
1.323061, -0.3482912, 2.467682, 1, 0, 0.5882353, 1,
1.32431, 0.02088285, 1.756728, 1, 0, 0.5803922, 1,
1.325639, -1.935993, 1.957062, 1, 0, 0.5764706, 1,
1.333834, 1.275788, -0.8880593, 1, 0, 0.5686275, 1,
1.339194, 0.5637208, 2.634441, 1, 0, 0.5647059, 1,
1.343355, 0.9690215, 3.526827, 1, 0, 0.5568628, 1,
1.349053, 0.5451493, 1.273875, 1, 0, 0.5529412, 1,
1.35181, 1.730557, 0.1761827, 1, 0, 0.5450981, 1,
1.35824, 0.3717089, 1.339846, 1, 0, 0.5411765, 1,
1.360688, 0.1543869, 4.004229, 1, 0, 0.5333334, 1,
1.36348, -0.113896, 2.458612, 1, 0, 0.5294118, 1,
1.365142, 1.616964, -0.4203995, 1, 0, 0.5215687, 1,
1.371693, 0.1951377, 1.141885, 1, 0, 0.5176471, 1,
1.37225, 0.1284767, 2.044143, 1, 0, 0.509804, 1,
1.376772, 0.5988374, 0.9397836, 1, 0, 0.5058824, 1,
1.384568, 1.42018, 1.693353, 1, 0, 0.4980392, 1,
1.385107, 2.985341, 1.986436, 1, 0, 0.4901961, 1,
1.392983, 0.6461806, 1.663224, 1, 0, 0.4862745, 1,
1.395572, 0.2352251, 1.969507, 1, 0, 0.4784314, 1,
1.4071, 0.1146739, -0.1759704, 1, 0, 0.4745098, 1,
1.416441, 0.03892479, 1.730068, 1, 0, 0.4666667, 1,
1.417234, 0.658878, 2.54612, 1, 0, 0.4627451, 1,
1.434961, -0.156044, 2.964189, 1, 0, 0.454902, 1,
1.436485, 0.9618739, 1.770542, 1, 0, 0.4509804, 1,
1.453187, 0.5420058, 2.601198, 1, 0, 0.4431373, 1,
1.45608, -0.589178, 2.266361, 1, 0, 0.4392157, 1,
1.457566, 0.798663, 2.475299, 1, 0, 0.4313726, 1,
1.458923, 1.002026, 0.5599037, 1, 0, 0.427451, 1,
1.466916, 0.6466099, -0.06865367, 1, 0, 0.4196078, 1,
1.490243, -1.410811, 2.74591, 1, 0, 0.4156863, 1,
1.500687, 0.4199025, 2.683024, 1, 0, 0.4078431, 1,
1.509228, -0.6219789, 2.198503, 1, 0, 0.4039216, 1,
1.512189, -0.08529586, 1.363397, 1, 0, 0.3960784, 1,
1.519506, 0.3465275, -0.5286419, 1, 0, 0.3882353, 1,
1.545613, -0.2559901, 0.4663866, 1, 0, 0.3843137, 1,
1.550366, 1.140598, 1.043837, 1, 0, 0.3764706, 1,
1.55823, 0.8538501, 1.941105, 1, 0, 0.372549, 1,
1.560593, 0.1979897, 2.438955, 1, 0, 0.3647059, 1,
1.561257, 0.3112003, 1.232699, 1, 0, 0.3607843, 1,
1.571804, 0.004708514, 1.480744, 1, 0, 0.3529412, 1,
1.574274, -0.2577713, 3.062835, 1, 0, 0.3490196, 1,
1.591777, -0.8581909, 3.713121, 1, 0, 0.3411765, 1,
1.598798, 1.401671, 1.983607, 1, 0, 0.3372549, 1,
1.618604, -0.4228485, 2.452725, 1, 0, 0.3294118, 1,
1.620541, 0.8537049, 1.471503, 1, 0, 0.3254902, 1,
1.62393, -1.927611, 3.333853, 1, 0, 0.3176471, 1,
1.627772, -1.045535, 2.768315, 1, 0, 0.3137255, 1,
1.628051, 0.8957571, -0.755095, 1, 0, 0.3058824, 1,
1.667337, 0.1210007, 2.692535, 1, 0, 0.2980392, 1,
1.68296, -2.293584, 3.479091, 1, 0, 0.2941177, 1,
1.690355, -0.3295897, 2.496922, 1, 0, 0.2862745, 1,
1.691128, -1.202709, 0.9938109, 1, 0, 0.282353, 1,
1.693925, -0.3136701, 1.933951, 1, 0, 0.2745098, 1,
1.69444, 0.8422022, 2.471465, 1, 0, 0.2705882, 1,
1.697381, -0.5406902, 2.922847, 1, 0, 0.2627451, 1,
1.697445, -0.6439661, 2.480455, 1, 0, 0.2588235, 1,
1.69856, 1.691108, 1.439384, 1, 0, 0.2509804, 1,
1.728865, 0.8563972, 0.2216015, 1, 0, 0.2470588, 1,
1.729673, -0.4846651, 1.564152, 1, 0, 0.2392157, 1,
1.742897, 0.3614026, 2.16198, 1, 0, 0.2352941, 1,
1.780994, -0.1835681, 1.29946, 1, 0, 0.227451, 1,
1.784219, -0.4077962, 1.178479, 1, 0, 0.2235294, 1,
1.793009, 1.77984, 0.90209, 1, 0, 0.2156863, 1,
1.82151, -0.1736207, 1.630647, 1, 0, 0.2117647, 1,
1.83874, 0.5332232, 2.710608, 1, 0, 0.2039216, 1,
1.876541, 0.9011745, 2.714653, 1, 0, 0.1960784, 1,
1.88199, 1.588973, 4.67134, 1, 0, 0.1921569, 1,
1.906705, 0.6816822, -0.08510652, 1, 0, 0.1843137, 1,
1.940978, 0.4252056, 1.340256, 1, 0, 0.1803922, 1,
1.984604, 0.515317, 2.851436, 1, 0, 0.172549, 1,
2.00754, -1.149174, 2.291212, 1, 0, 0.1686275, 1,
2.013576, 0.1956586, 1.295004, 1, 0, 0.1607843, 1,
2.027918, 0.1987188, 1.309967, 1, 0, 0.1568628, 1,
2.067636, 1.218515, 0.9990554, 1, 0, 0.1490196, 1,
2.144376, 0.213355, 1.015375, 1, 0, 0.145098, 1,
2.148726, -0.4035354, 1.031375, 1, 0, 0.1372549, 1,
2.161671, 0.361874, 2.629383, 1, 0, 0.1333333, 1,
2.183584, 1.250588, 1.733939, 1, 0, 0.1254902, 1,
2.23295, -0.5055116, 1.837439, 1, 0, 0.1215686, 1,
2.243131, 0.6468782, 1.260841, 1, 0, 0.1137255, 1,
2.312439, -1.910471, 2.268718, 1, 0, 0.1098039, 1,
2.324345, -1.502018, 2.691366, 1, 0, 0.1019608, 1,
2.336934, 0.720629, -0.8913051, 1, 0, 0.09411765, 1,
2.384988, 0.823924, 0.6867191, 1, 0, 0.09019608, 1,
2.428865, -0.6257828, 2.133375, 1, 0, 0.08235294, 1,
2.456868, 2.361979, 0.7948331, 1, 0, 0.07843138, 1,
2.485404, -1.999153, 2.04141, 1, 0, 0.07058824, 1,
2.509715, -0.1238611, 0.4218982, 1, 0, 0.06666667, 1,
2.516597, -0.8985655, 0.7011935, 1, 0, 0.05882353, 1,
2.635558, -0.3004093, 1.578466, 1, 0, 0.05490196, 1,
2.651342, -0.2670425, -0.5849645, 1, 0, 0.04705882, 1,
2.661161, -1.257525, 1.709651, 1, 0, 0.04313726, 1,
2.661509, 0.8356153, 1.571461, 1, 0, 0.03529412, 1,
2.780696, -0.3725195, 0.7617594, 1, 0, 0.03137255, 1,
2.846586, -0.3433966, 2.530342, 1, 0, 0.02352941, 1,
2.864487, 1.249608, 1.426039, 1, 0, 0.01960784, 1,
3.058024, -0.2022074, 0.798367, 1, 0, 0.01176471, 1,
3.297478, -0.7831697, 3.545943, 1, 0, 0.007843138, 1
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
0.03585291, -3.7327, -6.465785, 0, -0.5, 0.5, 0.5,
0.03585291, -3.7327, -6.465785, 1, -0.5, 0.5, 0.5,
0.03585291, -3.7327, -6.465785, 1, 1.5, 0.5, 0.5,
0.03585291, -3.7327, -6.465785, 0, 1.5, 0.5, 0.5
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
-4.331464, 0.1272185, -6.465785, 0, -0.5, 0.5, 0.5,
-4.331464, 0.1272185, -6.465785, 1, -0.5, 0.5, 0.5,
-4.331464, 0.1272185, -6.465785, 1, 1.5, 0.5, 0.5,
-4.331464, 0.1272185, -6.465785, 0, 1.5, 0.5, 0.5
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
-4.331464, -3.7327, 0.1048732, 0, -0.5, 0.5, 0.5,
-4.331464, -3.7327, 0.1048732, 1, -0.5, 0.5, 0.5,
-4.331464, -3.7327, 0.1048732, 1, 1.5, 0.5, 0.5,
-4.331464, -3.7327, 0.1048732, 0, 1.5, 0.5, 0.5
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
-3, -2.841949, -4.949479,
3, -2.841949, -4.949479,
-3, -2.841949, -4.949479,
-3, -2.990408, -5.202197,
-2, -2.841949, -4.949479,
-2, -2.990408, -5.202197,
-1, -2.841949, -4.949479,
-1, -2.990408, -5.202197,
0, -2.841949, -4.949479,
0, -2.990408, -5.202197,
1, -2.841949, -4.949479,
1, -2.990408, -5.202197,
2, -2.841949, -4.949479,
2, -2.990408, -5.202197,
3, -2.841949, -4.949479,
3, -2.990408, -5.202197
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
-3, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
-3, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
-3, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
-2, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
-2, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
-2, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
-2, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
-1, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
-1, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
-1, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
-1, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
0, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
0, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
0, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
0, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
1, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
1, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
1, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
1, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
2, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
2, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
2, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
2, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5,
3, -3.287324, -5.707632, 0, -0.5, 0.5, 0.5,
3, -3.287324, -5.707632, 1, -0.5, 0.5, 0.5,
3, -3.287324, -5.707632, 1, 1.5, 0.5, 0.5,
3, -3.287324, -5.707632, 0, 1.5, 0.5, 0.5
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
-3.323621, -2, -4.949479,
-3.323621, 3, -4.949479,
-3.323621, -2, -4.949479,
-3.491595, -2, -5.202197,
-3.323621, -1, -4.949479,
-3.491595, -1, -5.202197,
-3.323621, 0, -4.949479,
-3.491595, 0, -5.202197,
-3.323621, 1, -4.949479,
-3.491595, 1, -5.202197,
-3.323621, 2, -4.949479,
-3.491595, 2, -5.202197,
-3.323621, 3, -4.949479,
-3.491595, 3, -5.202197
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
-3.827543, -2, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, -2, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, -2, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, -2, -5.707632, 0, 1.5, 0.5, 0.5,
-3.827543, -1, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, -1, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, -1, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, -1, -5.707632, 0, 1.5, 0.5, 0.5,
-3.827543, 0, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, 0, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, 0, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, 0, -5.707632, 0, 1.5, 0.5, 0.5,
-3.827543, 1, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, 1, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, 1, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, 1, -5.707632, 0, 1.5, 0.5, 0.5,
-3.827543, 2, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, 2, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, 2, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, 2, -5.707632, 0, 1.5, 0.5, 0.5,
-3.827543, 3, -5.707632, 0, -0.5, 0.5, 0.5,
-3.827543, 3, -5.707632, 1, -0.5, 0.5, 0.5,
-3.827543, 3, -5.707632, 1, 1.5, 0.5, 0.5,
-3.827543, 3, -5.707632, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.323621, -2.841949, -4,
-3.323621, -2.841949, 4,
-3.323621, -2.841949, -4,
-3.491595, -2.990408, -4,
-3.323621, -2.841949, -2,
-3.491595, -2.990408, -2,
-3.323621, -2.841949, 0,
-3.491595, -2.990408, 0,
-3.323621, -2.841949, 2,
-3.491595, -2.990408, 2,
-3.323621, -2.841949, 4,
-3.491595, -2.990408, 4
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
-3.827543, -3.287324, -4, 0, -0.5, 0.5, 0.5,
-3.827543, -3.287324, -4, 1, -0.5, 0.5, 0.5,
-3.827543, -3.287324, -4, 1, 1.5, 0.5, 0.5,
-3.827543, -3.287324, -4, 0, 1.5, 0.5, 0.5,
-3.827543, -3.287324, -2, 0, -0.5, 0.5, 0.5,
-3.827543, -3.287324, -2, 1, -0.5, 0.5, 0.5,
-3.827543, -3.287324, -2, 1, 1.5, 0.5, 0.5,
-3.827543, -3.287324, -2, 0, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 0, 0, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 0, 1, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 0, 1, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 0, 0, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 2, 0, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 2, 1, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 2, 1, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 2, 0, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 4, 0, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 4, 1, -0.5, 0.5, 0.5,
-3.827543, -3.287324, 4, 1, 1.5, 0.5, 0.5,
-3.827543, -3.287324, 4, 0, 1.5, 0.5, 0.5
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
-3.323621, -2.841949, -4.949479,
-3.323621, 3.096386, -4.949479,
-3.323621, -2.841949, 5.159225,
-3.323621, 3.096386, 5.159225,
-3.323621, -2.841949, -4.949479,
-3.323621, -2.841949, 5.159225,
-3.323621, 3.096386, -4.949479,
-3.323621, 3.096386, 5.159225,
-3.323621, -2.841949, -4.949479,
3.395327, -2.841949, -4.949479,
-3.323621, -2.841949, 5.159225,
3.395327, -2.841949, 5.159225,
-3.323621, 3.096386, -4.949479,
3.395327, 3.096386, -4.949479,
-3.323621, 3.096386, 5.159225,
3.395327, 3.096386, 5.159225,
3.395327, -2.841949, -4.949479,
3.395327, 3.096386, -4.949479,
3.395327, -2.841949, 5.159225,
3.395327, 3.096386, 5.159225,
3.395327, -2.841949, -4.949479,
3.395327, -2.841949, 5.159225,
3.395327, 3.096386, -4.949479,
3.395327, 3.096386, 5.159225
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
var radius = 7.215538;
var distance = 32.10275;
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
mvMatrix.translate( -0.03585291, -0.1272185, -0.1048732 );
mvMatrix.scale( 1.161131, 1.313766, 0.7717686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.10275);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
N-furfuryladenine<-read.table("N-furfuryladenine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-furfuryladenine$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-furfuryladenine$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-furfuryladenine$V4
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
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
-3.225773, 1.179872, -2.929328, 0, 0, 1, 1, 1,
-3.136217, -0.8059371, -1.254254, 1, 0, 0, 1, 1,
-2.855739, 0.231784, -2.12635, 1, 0, 0, 1, 1,
-2.619188, -0.4474187, -0.3303134, 1, 0, 0, 1, 1,
-2.538275, -0.838317, -1.147218, 1, 0, 0, 1, 1,
-2.48202, 0.7350238, -0.101647, 1, 0, 0, 1, 1,
-2.418872, 0.5536435, -1.853313, 0, 0, 0, 1, 1,
-2.400949, -1.401653, -3.460055, 0, 0, 0, 1, 1,
-2.368408, 2.204472, 0.1631207, 0, 0, 0, 1, 1,
-2.315217, 0.2371964, -1.216114, 0, 0, 0, 1, 1,
-2.248802, -0.7280279, -2.266856, 0, 0, 0, 1, 1,
-2.244042, 1.316816, -1.278051, 0, 0, 0, 1, 1,
-2.235205, 1.140374, -0.2378103, 0, 0, 0, 1, 1,
-2.227173, 0.5297495, -1.786348, 1, 1, 1, 1, 1,
-2.174726, -1.260121, -0.7417006, 1, 1, 1, 1, 1,
-2.162865, -0.9991434, -0.6462726, 1, 1, 1, 1, 1,
-2.131549, 0.174184, -0.9466358, 1, 1, 1, 1, 1,
-2.130152, 0.2076666, -3.112876, 1, 1, 1, 1, 1,
-2.097415, -2.259232, -2.302406, 1, 1, 1, 1, 1,
-2.075446, -0.9918175, -0.8958903, 1, 1, 1, 1, 1,
-2.041596, -0.8044662, -1.760644, 1, 1, 1, 1, 1,
-2.039577, 0.7004328, -1.236862, 1, 1, 1, 1, 1,
-2.033484, 0.3301382, -2.439353, 1, 1, 1, 1, 1,
-2.007357, 0.5888395, 0.04643499, 1, 1, 1, 1, 1,
-1.993061, 1.094335, -0.09229236, 1, 1, 1, 1, 1,
-1.948072, -0.058851, -1.585851, 1, 1, 1, 1, 1,
-1.947382, 0.2753368, -0.5106704, 1, 1, 1, 1, 1,
-1.90566, 1.789008, -0.2451295, 1, 1, 1, 1, 1,
-1.896729, -1.189562, -0.487695, 0, 0, 1, 1, 1,
-1.886582, 0.3150895, 0.09913118, 1, 0, 0, 1, 1,
-1.875978, -1.645997, -2.045469, 1, 0, 0, 1, 1,
-1.868297, -0.3901257, -0.3400281, 1, 0, 0, 1, 1,
-1.861489, -0.352456, -1.474816, 1, 0, 0, 1, 1,
-1.836378, -1.35712, -1.748014, 1, 0, 0, 1, 1,
-1.829686, -0.08055314, -2.016588, 0, 0, 0, 1, 1,
-1.812222, -0.480978, -2.095977, 0, 0, 0, 1, 1,
-1.811155, 0.7147915, -2.188918, 0, 0, 0, 1, 1,
-1.778027, 0.5641233, -1.574973, 0, 0, 0, 1, 1,
-1.77548, 0.6445513, -0.6197103, 0, 0, 0, 1, 1,
-1.751164, 2.842604, -0.6343476, 0, 0, 0, 1, 1,
-1.730925, 2.229684, -1.494148, 0, 0, 0, 1, 1,
-1.72532, 1.203975, -0.5732226, 1, 1, 1, 1, 1,
-1.718592, -0.3754994, -1.388246, 1, 1, 1, 1, 1,
-1.696762, -2.289665, -1.138649, 1, 1, 1, 1, 1,
-1.659676, 1.622343, -1.485491, 1, 1, 1, 1, 1,
-1.64365, 0.8273491, 0.8165768, 1, 1, 1, 1, 1,
-1.639982, 0.542813, -2.505495, 1, 1, 1, 1, 1,
-1.637501, -0.3787703, -1.142472, 1, 1, 1, 1, 1,
-1.621353, -1.040446, -3.039364, 1, 1, 1, 1, 1,
-1.615283, 0.2495298, 0.06355679, 1, 1, 1, 1, 1,
-1.61194, -0.8189006, -3.173469, 1, 1, 1, 1, 1,
-1.610728, 0.8892545, -0.06814898, 1, 1, 1, 1, 1,
-1.599652, -0.9386411, -2.825975, 1, 1, 1, 1, 1,
-1.589512, 0.5344146, -1.763417, 1, 1, 1, 1, 1,
-1.551393, -0.06216354, -1.864825, 1, 1, 1, 1, 1,
-1.550295, 0.06999398, -2.003304, 1, 1, 1, 1, 1,
-1.532799, -0.2031151, -0.1528996, 0, 0, 1, 1, 1,
-1.523621, -0.3366859, -1.051372, 1, 0, 0, 1, 1,
-1.507453, -0.3980201, -0.2821515, 1, 0, 0, 1, 1,
-1.504345, -0.9563933, -2.075751, 1, 0, 0, 1, 1,
-1.50325, -0.3654894, -2.602507, 1, 0, 0, 1, 1,
-1.472351, 1.944031, -0.89218, 1, 0, 0, 1, 1,
-1.448336, -0.9611905, -0.8172281, 0, 0, 0, 1, 1,
-1.442617, 0.003540961, -1.841644, 0, 0, 0, 1, 1,
-1.429982, 0.6864792, -1.810155, 0, 0, 0, 1, 1,
-1.422379, -1.002294, -2.917186, 0, 0, 0, 1, 1,
-1.421678, 0.8067591, -1.120737, 0, 0, 0, 1, 1,
-1.421455, -1.4182, -2.555332, 0, 0, 0, 1, 1,
-1.417085, 0.5394932, -0.3213795, 0, 0, 0, 1, 1,
-1.414239, 0.9962677, 1.243311, 1, 1, 1, 1, 1,
-1.413494, 0.1238132, 0.4790832, 1, 1, 1, 1, 1,
-1.396291, -1.380076, -4.446785, 1, 1, 1, 1, 1,
-1.395151, -0.5589585, -1.466974, 1, 1, 1, 1, 1,
-1.390172, 0.4798449, -0.1897662, 1, 1, 1, 1, 1,
-1.380984, -0.05440051, -1.329424, 1, 1, 1, 1, 1,
-1.375011, -1.494854, -2.34571, 1, 1, 1, 1, 1,
-1.368903, -0.3119183, -2.33387, 1, 1, 1, 1, 1,
-1.366837, -0.5588025, -1.252644, 1, 1, 1, 1, 1,
-1.350567, 0.4160617, -0.4674814, 1, 1, 1, 1, 1,
-1.349825, -0.2290315, -1.139063, 1, 1, 1, 1, 1,
-1.346897, 0.2047209, -1.684879, 1, 1, 1, 1, 1,
-1.346888, 0.6056652, -1.317915, 1, 1, 1, 1, 1,
-1.345436, 1.02958, -0.1439724, 1, 1, 1, 1, 1,
-1.337632, -0.5708779, -2.785336, 1, 1, 1, 1, 1,
-1.333507, -0.1179519, -2.593009, 0, 0, 1, 1, 1,
-1.332193, 1.380939, -0.6097438, 1, 0, 0, 1, 1,
-1.331522, 0.9830016, -1.572397, 1, 0, 0, 1, 1,
-1.328031, 0.3668064, -2.481925, 1, 0, 0, 1, 1,
-1.314067, -0.4645268, -1.577104, 1, 0, 0, 1, 1,
-1.311131, -0.2011825, -2.321375, 1, 0, 0, 1, 1,
-1.310945, 0.9623267, -0.7391765, 0, 0, 0, 1, 1,
-1.310367, -1.750779, -4.212101, 0, 0, 0, 1, 1,
-1.310102, 2.792575, 0.8660641, 0, 0, 0, 1, 1,
-1.307575, -0.7325693, -1.244451, 0, 0, 0, 1, 1,
-1.307128, 0.2565368, -1.560884, 0, 0, 0, 1, 1,
-1.301294, 0.4438493, -1.607185, 0, 0, 0, 1, 1,
-1.294572, 0.4254245, -1.953695, 0, 0, 0, 1, 1,
-1.289331, 0.8543935, -1.574654, 1, 1, 1, 1, 1,
-1.284575, 2.137757, -0.8356488, 1, 1, 1, 1, 1,
-1.261231, -0.6344979, -2.492241, 1, 1, 1, 1, 1,
-1.257233, 2.0782, -1.365285, 1, 1, 1, 1, 1,
-1.255404, -0.1150173, -2.164135, 1, 1, 1, 1, 1,
-1.249743, 0.8798198, -1.395028, 1, 1, 1, 1, 1,
-1.247854, -0.5035365, -1.318781, 1, 1, 1, 1, 1,
-1.245765, 0.09991494, -2.833509, 1, 1, 1, 1, 1,
-1.24087, 0.3078653, -1.378635, 1, 1, 1, 1, 1,
-1.215583, -0.1457633, -2.820302, 1, 1, 1, 1, 1,
-1.206482, 0.8595625, 1.603373, 1, 1, 1, 1, 1,
-1.202323, -0.4500355, -0.8717873, 1, 1, 1, 1, 1,
-1.198967, -1.577718, -1.11621, 1, 1, 1, 1, 1,
-1.198377, -1.421582, -1.361922, 1, 1, 1, 1, 1,
-1.196842, -2.091943, -2.460896, 1, 1, 1, 1, 1,
-1.188084, 0.5392374, -1.340183, 0, 0, 1, 1, 1,
-1.184161, 0.8912371, 1.090571, 1, 0, 0, 1, 1,
-1.178039, -1.612586, -3.094134, 1, 0, 0, 1, 1,
-1.173357, -0.6423151, -1.621321, 1, 0, 0, 1, 1,
-1.164043, -0.3151209, -1.918109, 1, 0, 0, 1, 1,
-1.163997, 0.133487, -3.734072, 1, 0, 0, 1, 1,
-1.163744, 1.836061, -0.4933955, 0, 0, 0, 1, 1,
-1.150174, -0.3659001, -2.386198, 0, 0, 0, 1, 1,
-1.147424, -0.9247129, -2.331566, 0, 0, 0, 1, 1,
-1.146415, 0.3631436, -2.769281, 0, 0, 0, 1, 1,
-1.142654, -0.7768168, -3.225471, 0, 0, 0, 1, 1,
-1.139071, -1.857966, -1.782922, 0, 0, 0, 1, 1,
-1.138518, 0.06688477, -0.5999532, 0, 0, 0, 1, 1,
-1.135987, -0.4839616, -2.126704, 1, 1, 1, 1, 1,
-1.131635, -0.07800603, -1.733186, 1, 1, 1, 1, 1,
-1.12463, -0.7432415, -2.149287, 1, 1, 1, 1, 1,
-1.120917, -0.08685207, -3.00819, 1, 1, 1, 1, 1,
-1.105252, -0.4627531, -2.184745, 1, 1, 1, 1, 1,
-1.099619, 0.4555265, -0.5358109, 1, 1, 1, 1, 1,
-1.088845, -0.212896, -1.609067, 1, 1, 1, 1, 1,
-1.087809, -1.350368, -1.962627, 1, 1, 1, 1, 1,
-1.081392, 0.1243602, -1.661014, 1, 1, 1, 1, 1,
-1.078469, -1.911774, -2.397243, 1, 1, 1, 1, 1,
-1.076031, -0.1717747, -1.264109, 1, 1, 1, 1, 1,
-1.075229, 1.394573, 2.573724, 1, 1, 1, 1, 1,
-1.073737, 0.9511618, 0.2298505, 1, 1, 1, 1, 1,
-1.071698, 0.2284516, -2.78724, 1, 1, 1, 1, 1,
-1.040704, 0.4093735, 0.5717157, 1, 1, 1, 1, 1,
-1.038625, 0.5495271, -0.4114619, 0, 0, 1, 1, 1,
-1.026634, 0.9695296, 0.05961815, 1, 0, 0, 1, 1,
-1.024607, 0.6168215, -1.3041, 1, 0, 0, 1, 1,
-1.019831, -0.4070512, -2.227988, 1, 0, 0, 1, 1,
-1.014132, 2.099253, -1.022445, 1, 0, 0, 1, 1,
-1.005452, -1.24444, -0.3467798, 1, 0, 0, 1, 1,
-1.00473, 0.1127008, -0.178925, 0, 0, 0, 1, 1,
-1.004269, 0.7542318, -1.325803, 0, 0, 0, 1, 1,
-1.000583, -0.3864289, -0.6335111, 0, 0, 0, 1, 1,
-0.9966854, -0.03502874, -0.2342667, 0, 0, 0, 1, 1,
-0.9867852, 0.1229774, -0.708405, 0, 0, 0, 1, 1,
-0.9825484, 1.471179, -1.836531, 0, 0, 0, 1, 1,
-0.9772362, -0.5000499, -1.454943, 0, 0, 0, 1, 1,
-0.9763062, 0.09858268, -2.104366, 1, 1, 1, 1, 1,
-0.9722909, -0.6073675, -1.66627, 1, 1, 1, 1, 1,
-0.9718005, -0.08431309, -0.700443, 1, 1, 1, 1, 1,
-0.9686278, -1.679779, -1.456219, 1, 1, 1, 1, 1,
-0.9682677, 1.727157, 0.1664408, 1, 1, 1, 1, 1,
-0.9597003, 1.936508, 0.1800054, 1, 1, 1, 1, 1,
-0.9572313, 0.6116979, -2.014864, 1, 1, 1, 1, 1,
-0.9441792, -1.914089, -3.315253, 1, 1, 1, 1, 1,
-0.9437643, 2.210037, 1.637077, 1, 1, 1, 1, 1,
-0.9363649, -1.144162, -1.56478, 1, 1, 1, 1, 1,
-0.9353068, 0.2453516, -1.283237, 1, 1, 1, 1, 1,
-0.9351403, 0.8965594, -1.499842, 1, 1, 1, 1, 1,
-0.9339281, -0.4765629, -2.430315, 1, 1, 1, 1, 1,
-0.9328932, 0.0398051, -1.785467, 1, 1, 1, 1, 1,
-0.9270689, 0.0998657, -0.7091964, 1, 1, 1, 1, 1,
-0.9259191, -0.7915896, -1.027541, 0, 0, 1, 1, 1,
-0.9196016, -0.708285, -3.78988, 1, 0, 0, 1, 1,
-0.9162299, 1.451741, -0.79702, 1, 0, 0, 1, 1,
-0.91311, 0.002844325, 1.939593, 1, 0, 0, 1, 1,
-0.9069469, 0.6559377, -0.9820343, 1, 0, 0, 1, 1,
-0.9054333, 2.023168, -0.6496425, 1, 0, 0, 1, 1,
-0.9052979, 0.385008, -0.9256794, 0, 0, 0, 1, 1,
-0.905207, 1.640091, -0.231891, 0, 0, 0, 1, 1,
-0.9041321, 1.017737, -0.2748615, 0, 0, 0, 1, 1,
-0.9036193, 0.05087748, -2.149153, 0, 0, 0, 1, 1,
-0.8989515, -0.0753744, -3.55562, 0, 0, 0, 1, 1,
-0.8975539, -1.840154, -2.550107, 0, 0, 0, 1, 1,
-0.8942142, -0.7688829, -0.8437841, 0, 0, 0, 1, 1,
-0.8901298, 1.927154, 0.7557948, 1, 1, 1, 1, 1,
-0.8862297, 1.374962, -0.967608, 1, 1, 1, 1, 1,
-0.8815731, -1.382719, -0.6395136, 1, 1, 1, 1, 1,
-0.8811489, -0.6760852, -4.194356, 1, 1, 1, 1, 1,
-0.87946, -0.07019111, -2.138191, 1, 1, 1, 1, 1,
-0.8752911, -1.848417, -0.5545806, 1, 1, 1, 1, 1,
-0.8733013, 0.3562529, -0.5054309, 1, 1, 1, 1, 1,
-0.8707936, 0.9168015, 0.6448626, 1, 1, 1, 1, 1,
-0.8683065, -0.2589631, 1.003673, 1, 1, 1, 1, 1,
-0.8654765, 1.999774, 0.1206033, 1, 1, 1, 1, 1,
-0.8641707, 0.8123953, -0.5747984, 1, 1, 1, 1, 1,
-0.8545543, 0.6121349, 0.04025353, 1, 1, 1, 1, 1,
-0.8544765, -1.056681, -3.290858, 1, 1, 1, 1, 1,
-0.8490233, 0.727986, -2.21162, 1, 1, 1, 1, 1,
-0.8483136, -1.138618, -4.015727, 1, 1, 1, 1, 1,
-0.8467873, 0.8777706, -1.635573, 0, 0, 1, 1, 1,
-0.8410048, 0.506095, 0.1887358, 1, 0, 0, 1, 1,
-0.8389144, -1.23484, -2.08109, 1, 0, 0, 1, 1,
-0.8324954, -0.7332124, -0.8739817, 1, 0, 0, 1, 1,
-0.8228002, 1.193884, -0.4614819, 1, 0, 0, 1, 1,
-0.822593, 0.03087434, -0.4632108, 1, 0, 0, 1, 1,
-0.8195772, -1.090083, -2.116274, 0, 0, 0, 1, 1,
-0.8193998, 0.5105131, -0.2835466, 0, 0, 0, 1, 1,
-0.8120009, 0.1423896, -0.7001624, 0, 0, 0, 1, 1,
-0.8066471, 1.700951, -0.235643, 0, 0, 0, 1, 1,
-0.8050425, -1.593792, -1.774678, 0, 0, 0, 1, 1,
-0.7992756, 1.00647, -0.8426121, 0, 0, 0, 1, 1,
-0.7988046, 0.4663856, 0.8102686, 0, 0, 0, 1, 1,
-0.7922547, -0.3544377, -2.014414, 1, 1, 1, 1, 1,
-0.789289, -0.09270344, -2.818407, 1, 1, 1, 1, 1,
-0.7866181, 0.1878157, -2.311369, 1, 1, 1, 1, 1,
-0.7859975, -2.108045, -2.233239, 1, 1, 1, 1, 1,
-0.7848355, -0.5265113, -2.215957, 1, 1, 1, 1, 1,
-0.7807601, 1.435928, -0.9409757, 1, 1, 1, 1, 1,
-0.7804889, -0.1517241, -1.945328, 1, 1, 1, 1, 1,
-0.7803996, 0.6237085, -1.168311, 1, 1, 1, 1, 1,
-0.7729745, 0.6942626, 0.379397, 1, 1, 1, 1, 1,
-0.7716235, 0.2526737, -2.31312, 1, 1, 1, 1, 1,
-0.7642304, 0.5936108, -1.984182, 1, 1, 1, 1, 1,
-0.7594931, -0.2466655, -2.693065, 1, 1, 1, 1, 1,
-0.7576574, 1.151092, -2.236759, 1, 1, 1, 1, 1,
-0.756677, 0.4997943, -0.6854452, 1, 1, 1, 1, 1,
-0.754899, -2.274525, -2.504092, 1, 1, 1, 1, 1,
-0.7542635, 1.042088, -1.352247, 0, 0, 1, 1, 1,
-0.7483736, 0.9980751, -1.531088, 1, 0, 0, 1, 1,
-0.7411613, 1.000346, -0.4958755, 1, 0, 0, 1, 1,
-0.7375118, -0.9153363, -2.278858, 1, 0, 0, 1, 1,
-0.7344201, -0.6008297, -1.330046, 1, 0, 0, 1, 1,
-0.7322065, -1.359315, -2.988042, 1, 0, 0, 1, 1,
-0.7321203, -0.9309601, -2.613516, 0, 0, 0, 1, 1,
-0.7288523, 0.3817283, -1.940455, 0, 0, 0, 1, 1,
-0.7238567, 0.5921485, 1.444555, 0, 0, 0, 1, 1,
-0.7140573, 2.589158, -0.1842649, 0, 0, 0, 1, 1,
-0.7130271, 1.492593, 0.01528503, 0, 0, 0, 1, 1,
-0.7090936, 1.73371, -0.1714201, 0, 0, 0, 1, 1,
-0.7047736, -0.82635, -0.872011, 0, 0, 0, 1, 1,
-0.7044939, -1.692538, -1.410803, 1, 1, 1, 1, 1,
-0.6959386, -0.266986, -3.716287, 1, 1, 1, 1, 1,
-0.6917202, 0.8542571, -0.2193328, 1, 1, 1, 1, 1,
-0.6904726, -0.1287548, -1.322429, 1, 1, 1, 1, 1,
-0.689303, 0.7451528, -0.722458, 1, 1, 1, 1, 1,
-0.6880292, -0.1669027, -0.8925036, 1, 1, 1, 1, 1,
-0.6873689, -1.646357, -2.706663, 1, 1, 1, 1, 1,
-0.6824551, -0.6257433, -2.642066, 1, 1, 1, 1, 1,
-0.6817216, 1.166532, -1.468611, 1, 1, 1, 1, 1,
-0.6794296, 0.8674316, -0.433013, 1, 1, 1, 1, 1,
-0.6740416, -0.4048002, -1.681566, 1, 1, 1, 1, 1,
-0.6735545, -0.9781355, -3.061913, 1, 1, 1, 1, 1,
-0.6728483, 0.5410405, -0.3172111, 1, 1, 1, 1, 1,
-0.6645619, -0.3691685, -3.343278, 1, 1, 1, 1, 1,
-0.6498988, -0.4561249, -1.842407, 1, 1, 1, 1, 1,
-0.6457893, 0.7139298, 0.3227369, 0, 0, 1, 1, 1,
-0.6401334, 0.9894617, 1.333322, 1, 0, 0, 1, 1,
-0.6388456, -0.3732996, -1.083435, 1, 0, 0, 1, 1,
-0.637033, -1.170654, -1.354809, 1, 0, 0, 1, 1,
-0.635146, -1.371403, -2.71339, 1, 0, 0, 1, 1,
-0.6345907, 0.2555147, -1.302125, 1, 0, 0, 1, 1,
-0.6342111, 1.937237, 2.105404, 0, 0, 0, 1, 1,
-0.6336502, 0.3986506, -1.242203, 0, 0, 0, 1, 1,
-0.6305856, 0.5482874, -0.7134532, 0, 0, 0, 1, 1,
-0.6299047, 1.128916, -1.467423, 0, 0, 0, 1, 1,
-0.6254634, -0.4569346, -2.542276, 0, 0, 0, 1, 1,
-0.6194057, -1.997238, -4.142221, 0, 0, 0, 1, 1,
-0.6169723, -0.9139269, -2.914286, 0, 0, 0, 1, 1,
-0.6109434, 0.2434139, -0.2362818, 1, 1, 1, 1, 1,
-0.6071381, -0.4021951, -1.278791, 1, 1, 1, 1, 1,
-0.6025309, -0.6999643, -3.388767, 1, 1, 1, 1, 1,
-0.6011431, -0.2005712, -3.900876, 1, 1, 1, 1, 1,
-0.5966108, -0.7675815, -2.419247, 1, 1, 1, 1, 1,
-0.5953698, -0.2954408, -3.148852, 1, 1, 1, 1, 1,
-0.5951438, -0.3724454, -2.05004, 1, 1, 1, 1, 1,
-0.5938236, 0.2777255, -0.5340031, 1, 1, 1, 1, 1,
-0.5930926, 1.534313, -0.8587225, 1, 1, 1, 1, 1,
-0.5873313, 0.5509729, 0.2617766, 1, 1, 1, 1, 1,
-0.5807926, -2.491568, -3.443333, 1, 1, 1, 1, 1,
-0.5807065, 0.8308172, -0.09287242, 1, 1, 1, 1, 1,
-0.5763562, 0.5341759, -0.3154098, 1, 1, 1, 1, 1,
-0.5740519, -0.4960183, -2.838393, 1, 1, 1, 1, 1,
-0.5669696, -0.9575461, -4.580536, 1, 1, 1, 1, 1,
-0.5599611, 0.6310224, -0.8469012, 0, 0, 1, 1, 1,
-0.5573799, 0.8167033, 1.416902, 1, 0, 0, 1, 1,
-0.554314, 1.662497, -0.6789473, 1, 0, 0, 1, 1,
-0.5529279, -1.138167, -2.815195, 1, 0, 0, 1, 1,
-0.5525525, -1.412231, -3.638722, 1, 0, 0, 1, 1,
-0.5503989, 0.313866, -1.740288, 1, 0, 0, 1, 1,
-0.5498409, -0.7133732, -2.197288, 0, 0, 0, 1, 1,
-0.5421852, -0.4237068, -2.909752, 0, 0, 0, 1, 1,
-0.5406309, 0.4403853, -2.011768, 0, 0, 0, 1, 1,
-0.538103, 1.33887, 1.608151, 0, 0, 0, 1, 1,
-0.5350525, 0.6491324, -0.5154626, 0, 0, 0, 1, 1,
-0.5348846, 1.285172, 1.261295, 0, 0, 0, 1, 1,
-0.534884, 0.04962224, -1.185542, 0, 0, 0, 1, 1,
-0.5347506, 0.05473079, -1.91042, 1, 1, 1, 1, 1,
-0.5302172, 2.239338, -0.7449488, 1, 1, 1, 1, 1,
-0.5295463, -0.5567017, -3.666632, 1, 1, 1, 1, 1,
-0.5286375, -0.7377178, -3.472132, 1, 1, 1, 1, 1,
-0.5249019, 0.6503925, -1.67942, 1, 1, 1, 1, 1,
-0.5153596, -1.467048, -2.284212, 1, 1, 1, 1, 1,
-0.5115018, -1.310074, -2.631959, 1, 1, 1, 1, 1,
-0.5055358, 1.283916, -2.647669, 1, 1, 1, 1, 1,
-0.5042501, -1.651164, -3.48827, 1, 1, 1, 1, 1,
-0.5020094, 0.02991249, -0.8683067, 1, 1, 1, 1, 1,
-0.4904983, 1.859663, -0.2541655, 1, 1, 1, 1, 1,
-0.4892249, 0.4373554, 0.3656568, 1, 1, 1, 1, 1,
-0.488356, -0.03620293, -1.121648, 1, 1, 1, 1, 1,
-0.4872309, -1.285484, -2.160243, 1, 1, 1, 1, 1,
-0.4856182, -0.953304, -2.954099, 1, 1, 1, 1, 1,
-0.4848854, -0.3274618, -2.317619, 0, 0, 1, 1, 1,
-0.4838219, 1.185863, -0.3081444, 1, 0, 0, 1, 1,
-0.4804384, 0.1419318, -0.6500911, 1, 0, 0, 1, 1,
-0.4773082, -0.07514824, -1.327698, 1, 0, 0, 1, 1,
-0.4722086, -1.208545, -3.020295, 1, 0, 0, 1, 1,
-0.4721006, 0.9763337, 0.5243514, 1, 0, 0, 1, 1,
-0.4719572, -1.144064, -4.527876, 0, 0, 0, 1, 1,
-0.4654969, 1.609087, -0.1524063, 0, 0, 0, 1, 1,
-0.4654167, -0.4784001, -2.597341, 0, 0, 0, 1, 1,
-0.4620206, 0.7616709, -0.1742511, 0, 0, 0, 1, 1,
-0.4618149, -0.3029411, -2.240133, 0, 0, 0, 1, 1,
-0.4539474, -0.5890602, -2.170977, 0, 0, 0, 1, 1,
-0.4510179, 1.676903, -0.2144174, 0, 0, 0, 1, 1,
-0.4478181, -0.5054578, -1.966508, 1, 1, 1, 1, 1,
-0.442573, -0.7211282, -2.127589, 1, 1, 1, 1, 1,
-0.4358731, 1.537704, -0.3736464, 1, 1, 1, 1, 1,
-0.431481, -0.01330576, -2.254465, 1, 1, 1, 1, 1,
-0.4301665, 0.8844578, 0.2408723, 1, 1, 1, 1, 1,
-0.4284263, 1.286616, -2.526406, 1, 1, 1, 1, 1,
-0.4278003, 1.368085, -1.114031, 1, 1, 1, 1, 1,
-0.4259224, -0.1335735, -1.588061, 1, 1, 1, 1, 1,
-0.4170239, -0.3093924, -1.429358, 1, 1, 1, 1, 1,
-0.4150408, -1.164217, -3.07213, 1, 1, 1, 1, 1,
-0.4125084, 0.09930544, -1.372479, 1, 1, 1, 1, 1,
-0.4112056, -1.319385, -3.602413, 1, 1, 1, 1, 1,
-0.4086898, 1.825837, -0.8478504, 1, 1, 1, 1, 1,
-0.4084451, -0.7946011, -3.955263, 1, 1, 1, 1, 1,
-0.4068921, -0.1623046, -1.556772, 1, 1, 1, 1, 1,
-0.3951956, 0.9426419, 0.5383528, 0, 0, 1, 1, 1,
-0.3946646, -0.118263, -0.6982521, 1, 0, 0, 1, 1,
-0.3934838, 1.003083, -1.625775, 1, 0, 0, 1, 1,
-0.3906617, 0.2641877, -1.136119, 1, 0, 0, 1, 1,
-0.3873949, -2.6127, -3.027733, 1, 0, 0, 1, 1,
-0.3842813, 0.06577432, -0.1956586, 1, 0, 0, 1, 1,
-0.3824109, -0.1294822, -1.193826, 0, 0, 0, 1, 1,
-0.3819264, -0.3914741, -1.801135, 0, 0, 0, 1, 1,
-0.3781579, -0.2931114, -2.343937, 0, 0, 0, 1, 1,
-0.3774892, 0.8753704, 0.8967134, 0, 0, 0, 1, 1,
-0.3761958, -0.7838535, -0.8351815, 0, 0, 0, 1, 1,
-0.37556, -1.595324, -1.584486, 0, 0, 0, 1, 1,
-0.3697349, -0.3037831, -0.3785261, 0, 0, 0, 1, 1,
-0.3688626, 1.625793, 0.01005965, 1, 1, 1, 1, 1,
-0.3662094, -0.8481374, -1.667345, 1, 1, 1, 1, 1,
-0.3631954, 0.6500813, -1.336643, 1, 1, 1, 1, 1,
-0.3608222, 0.2879616, -0.794449, 1, 1, 1, 1, 1,
-0.3606894, 0.4052445, -1.042523, 1, 1, 1, 1, 1,
-0.3590366, -1.537956, -3.231758, 1, 1, 1, 1, 1,
-0.3569125, -2.578908, -2.926074, 1, 1, 1, 1, 1,
-0.3559943, -0.5018966, -2.460488, 1, 1, 1, 1, 1,
-0.3551828, 0.140586, -1.568017, 1, 1, 1, 1, 1,
-0.3509405, -0.5325096, -3.228217, 1, 1, 1, 1, 1,
-0.3493421, 1.089805, -0.6080564, 1, 1, 1, 1, 1,
-0.3478992, -1.056884, -2.415279, 1, 1, 1, 1, 1,
-0.346804, -1.215699, -2.847265, 1, 1, 1, 1, 1,
-0.3448824, -1.005722, -1.131563, 1, 1, 1, 1, 1,
-0.3394532, -0.6031759, -2.263937, 1, 1, 1, 1, 1,
-0.3370463, 0.9915612, 0.6949429, 0, 0, 1, 1, 1,
-0.3354624, 1.64457, 0.4342273, 1, 0, 0, 1, 1,
-0.3340094, -0.8444103, -1.883973, 1, 0, 0, 1, 1,
-0.3310486, -1.568628, -2.698202, 1, 0, 0, 1, 1,
-0.3274292, 0.651317, -0.5470384, 1, 0, 0, 1, 1,
-0.3257729, 1.927428, 0.3926796, 1, 0, 0, 1, 1,
-0.3244584, 0.3868659, 0.5278857, 0, 0, 0, 1, 1,
-0.3239062, -0.1698769, -1.866225, 0, 0, 0, 1, 1,
-0.323581, 0.4546343, -0.9938274, 0, 0, 0, 1, 1,
-0.319768, 1.844495, 0.7397529, 0, 0, 0, 1, 1,
-0.3134398, 0.8103673, 0.1121071, 0, 0, 0, 1, 1,
-0.3130866, -0.09146626, -1.184374, 0, 0, 0, 1, 1,
-0.3127652, -0.6119707, -2.669198, 0, 0, 0, 1, 1,
-0.312611, 3.009906, 2.039203, 1, 1, 1, 1, 1,
-0.312317, -1.091519, -1.461636, 1, 1, 1, 1, 1,
-0.3119111, 0.3089847, -2.527551, 1, 1, 1, 1, 1,
-0.3116522, -0.8564028, -2.600699, 1, 1, 1, 1, 1,
-0.3109636, 1.585909, 0.6628956, 1, 1, 1, 1, 1,
-0.307224, 0.996944, 1.667952, 1, 1, 1, 1, 1,
-0.3033248, 1.773343, -0.07715818, 1, 1, 1, 1, 1,
-0.3027391, 1.197745, 0.9595258, 1, 1, 1, 1, 1,
-0.3013364, -0.3970162, -3.590663, 1, 1, 1, 1, 1,
-0.3009238, 0.6265097, 0.6740486, 1, 1, 1, 1, 1,
-0.2992602, 0.434108, -0.7937565, 1, 1, 1, 1, 1,
-0.2932371, -2.535905, -2.432268, 1, 1, 1, 1, 1,
-0.291792, -0.4613802, -2.447359, 1, 1, 1, 1, 1,
-0.2914344, -1.133587, -3.057367, 1, 1, 1, 1, 1,
-0.2878097, 0.7743739, -0.7896128, 1, 1, 1, 1, 1,
-0.2864566, -0.1843935, -3.123235, 0, 0, 1, 1, 1,
-0.2857057, 0.7552242, 1.430354, 1, 0, 0, 1, 1,
-0.2854539, -0.1794485, -1.699414, 1, 0, 0, 1, 1,
-0.2827599, 0.8781157, -0.9583174, 1, 0, 0, 1, 1,
-0.2751558, 0.6004388, -0.7234371, 1, 0, 0, 1, 1,
-0.2732829, 1.40334, 0.08657397, 1, 0, 0, 1, 1,
-0.2671375, 1.129667, -0.7224686, 0, 0, 0, 1, 1,
-0.2669172, 0.2244435, -1.346849, 0, 0, 0, 1, 1,
-0.2610051, 0.5244416, 0.007902523, 0, 0, 0, 1, 1,
-0.2608456, 0.1669766, -1.809021, 0, 0, 0, 1, 1,
-0.2575429, 0.5427272, 0.2659635, 0, 0, 0, 1, 1,
-0.2555473, 0.8806192, -0.5563985, 0, 0, 0, 1, 1,
-0.2529917, -0.1432418, -2.429562, 0, 0, 0, 1, 1,
-0.2512568, 0.5890879, -0.5414233, 1, 1, 1, 1, 1,
-0.2424575, 0.1586548, -4.122869, 1, 1, 1, 1, 1,
-0.2372596, 0.5432181, -0.7096653, 1, 1, 1, 1, 1,
-0.2365768, 0.9909354, -1.534849, 1, 1, 1, 1, 1,
-0.2333924, -0.6142821, -3.532601, 1, 1, 1, 1, 1,
-0.2328464, 0.3989238, -1.987252, 1, 1, 1, 1, 1,
-0.2296521, -2.110604, -0.1500817, 1, 1, 1, 1, 1,
-0.2253108, 0.6511953, 0.3839989, 1, 1, 1, 1, 1,
-0.2251922, 1.340819, -0.4618182, 1, 1, 1, 1, 1,
-0.2199101, 1.445669, -0.7332343, 1, 1, 1, 1, 1,
-0.2178504, -1.111767, -2.492446, 1, 1, 1, 1, 1,
-0.2032328, -1.975301, -2.344548, 1, 1, 1, 1, 1,
-0.1980982, 0.4596959, -1.898767, 1, 1, 1, 1, 1,
-0.1966228, 1.554638, 0.3986627, 1, 1, 1, 1, 1,
-0.1947846, 0.7801757, 0.9155447, 1, 1, 1, 1, 1,
-0.1946196, 0.6172233, 0.9228613, 0, 0, 1, 1, 1,
-0.1932107, 1.576936, -2.720012, 1, 0, 0, 1, 1,
-0.1895584, 0.5130883, -0.85443, 1, 0, 0, 1, 1,
-0.1887746, 0.5083604, -0.2204722, 1, 0, 0, 1, 1,
-0.1860864, 0.4488905, -0.520437, 1, 0, 0, 1, 1,
-0.1858278, 0.5030553, -0.005137088, 1, 0, 0, 1, 1,
-0.1785226, -1.197287, -2.473205, 0, 0, 0, 1, 1,
-0.1773235, -1.459448, -4.802265, 0, 0, 0, 1, 1,
-0.17674, 1.284729, -3.030534, 0, 0, 0, 1, 1,
-0.1716894, -1.648953, -4.783607, 0, 0, 0, 1, 1,
-0.1716508, -0.6908185, -1.911652, 0, 0, 0, 1, 1,
-0.1697323, -1.522117, -4.441384, 0, 0, 0, 1, 1,
-0.1624995, -0.1004725, -2.441871, 0, 0, 0, 1, 1,
-0.1591816, 0.120915, -1.912313, 1, 1, 1, 1, 1,
-0.1587882, 0.7886208, -0.7951509, 1, 1, 1, 1, 1,
-0.1567879, -0.2195588, -1.642381, 1, 1, 1, 1, 1,
-0.1554789, -0.662054, -2.814204, 1, 1, 1, 1, 1,
-0.1527184, -1.062687, -3.852222, 1, 1, 1, 1, 1,
-0.1520407, -0.7206866, -3.811935, 1, 1, 1, 1, 1,
-0.1482658, -0.7141718, -4.784706, 1, 1, 1, 1, 1,
-0.1475834, 0.407193, -0.4572397, 1, 1, 1, 1, 1,
-0.145879, 0.2132421, -1.376845, 1, 1, 1, 1, 1,
-0.14402, -1.632749, -3.592755, 1, 1, 1, 1, 1,
-0.1439452, 1.72735, 0.7421529, 1, 1, 1, 1, 1,
-0.1370988, -0.6482571, -4.143811, 1, 1, 1, 1, 1,
-0.1351757, -0.5714802, -2.212371, 1, 1, 1, 1, 1,
-0.1325567, 1.737281, -0.781261, 1, 1, 1, 1, 1,
-0.1324205, -0.8322514, -2.720379, 1, 1, 1, 1, 1,
-0.1302381, -0.4348578, -2.23876, 0, 0, 1, 1, 1,
-0.1276515, -1.068804, -2.586322, 1, 0, 0, 1, 1,
-0.1273982, -0.4606622, -2.572337, 1, 0, 0, 1, 1,
-0.1217191, 0.1220304, -0.2215103, 1, 0, 0, 1, 1,
-0.1212405, -0.950817, -4.076192, 1, 0, 0, 1, 1,
-0.1193017, 0.8096393, -0.04520263, 1, 0, 0, 1, 1,
-0.1182656, 0.7475432, -0.7097501, 0, 0, 0, 1, 1,
-0.1180421, 1.935514, -0.575129, 0, 0, 0, 1, 1,
-0.1167297, -0.3610855, -1.97008, 0, 0, 0, 1, 1,
-0.1151916, 0.3030559, -1.297481, 0, 0, 0, 1, 1,
-0.1141599, -0.4178229, -3.132248, 0, 0, 0, 1, 1,
-0.1139408, -0.5165929, -4.337199, 0, 0, 0, 1, 1,
-0.1112352, 1.439416, -0.6421165, 0, 0, 0, 1, 1,
-0.1066455, 1.036976, 1.073431, 1, 1, 1, 1, 1,
-0.105064, -1.268464, -1.992723, 1, 1, 1, 1, 1,
-0.1045877, -0.9103944, -3.922572, 1, 1, 1, 1, 1,
-0.1034861, 0.780852, 1.114029, 1, 1, 1, 1, 1,
-0.1028736, -1.667535, -3.558706, 1, 1, 1, 1, 1,
-0.09600829, -1.94676, -1.861079, 1, 1, 1, 1, 1,
-0.09580754, -0.8448116, -2.908983, 1, 1, 1, 1, 1,
-0.09378453, 0.1389375, -1.34614, 1, 1, 1, 1, 1,
-0.09317297, 0.6557488, 0.948732, 1, 1, 1, 1, 1,
-0.09192978, -0.6417782, -2.790411, 1, 1, 1, 1, 1,
-0.09166103, -1.849023, -2.888456, 1, 1, 1, 1, 1,
-0.09130783, -0.2622223, -4.061378, 1, 1, 1, 1, 1,
-0.09129278, 0.5545511, 0.2613456, 1, 1, 1, 1, 1,
-0.08681405, -0.7581741, -2.922718, 1, 1, 1, 1, 1,
-0.08251327, 0.1895304, 1.199004, 1, 1, 1, 1, 1,
-0.08096913, 1.009314, 0.6377248, 0, 0, 1, 1, 1,
-0.08025301, -0.3939399, -1.230703, 1, 0, 0, 1, 1,
-0.07624907, 1.03237, -1.961386, 1, 0, 0, 1, 1,
-0.07559025, -1.221947, -1.099607, 1, 0, 0, 1, 1,
-0.07177901, 0.2962355, 1.380259, 1, 0, 0, 1, 1,
-0.05699103, -0.3916678, -2.655706, 1, 0, 0, 1, 1,
-0.05578427, 0.4194118, 1.455758, 0, 0, 0, 1, 1,
-0.05332699, -0.9074792, -3.477843, 0, 0, 0, 1, 1,
-0.05328374, -0.11745, -4.06573, 0, 0, 0, 1, 1,
-0.05161576, -1.175055, -2.527892, 0, 0, 0, 1, 1,
-0.048312, 0.3928869, -0.8406391, 0, 0, 0, 1, 1,
-0.04685946, 0.4695132, -0.4638996, 0, 0, 0, 1, 1,
-0.04151838, -0.483027, -2.001527, 0, 0, 0, 1, 1,
-0.04142142, 0.5069268, -1.714567, 1, 1, 1, 1, 1,
-0.03970811, -0.9016132, -3.818768, 1, 1, 1, 1, 1,
-0.03400861, 0.9178877, -0.3206287, 1, 1, 1, 1, 1,
-0.0310043, 0.2691089, -0.4350911, 1, 1, 1, 1, 1,
-0.02907315, 0.165945, -1.273371, 1, 1, 1, 1, 1,
-0.02892151, -0.3553217, -1.186391, 1, 1, 1, 1, 1,
-0.02708321, -0.8988814, -3.038826, 1, 1, 1, 1, 1,
-0.02292129, -0.5988753, -3.890877, 1, 1, 1, 1, 1,
-0.01863018, -0.3720367, -2.834758, 1, 1, 1, 1, 1,
-0.01822715, -0.1992638, -3.407658, 1, 1, 1, 1, 1,
-0.01360356, -0.7878742, -2.573431, 1, 1, 1, 1, 1,
-0.01294169, 0.5219382, -0.2117452, 1, 1, 1, 1, 1,
-0.004330637, -0.7010427, -1.888545, 1, 1, 1, 1, 1,
0.0009689383, -0.6841478, 2.678008, 1, 1, 1, 1, 1,
0.001814961, -0.5542959, 1.824743, 1, 1, 1, 1, 1,
0.002489408, 1.280096, 0.4626927, 0, 0, 1, 1, 1,
0.002988039, -0.5639228, 2.161125, 1, 0, 0, 1, 1,
0.003116623, -0.8724555, 2.191305, 1, 0, 0, 1, 1,
0.004738336, -0.595819, 3.432709, 1, 0, 0, 1, 1,
0.007790574, 0.9992866, -1.155912, 1, 0, 0, 1, 1,
0.01195518, 0.4347455, 0.706618, 1, 0, 0, 1, 1,
0.01503092, 0.08056056, 0.5887223, 0, 0, 0, 1, 1,
0.01659315, 0.5772133, 0.4335285, 0, 0, 0, 1, 1,
0.0171538, 0.04434823, 0.06953648, 0, 0, 0, 1, 1,
0.01950317, 0.937686, 2.349728, 0, 0, 0, 1, 1,
0.02090712, 0.9816627, 0.4844703, 0, 0, 0, 1, 1,
0.02138856, -0.6589999, 1.974376, 0, 0, 0, 1, 1,
0.02255457, 0.1298036, 0.4356876, 0, 0, 0, 1, 1,
0.0226994, -0.07277519, 3.610546, 1, 1, 1, 1, 1,
0.02560307, -1.119823, 2.120686, 1, 1, 1, 1, 1,
0.02614078, -0.8832918, 3.129348, 1, 1, 1, 1, 1,
0.03040802, -0.6641843, 2.471504, 1, 1, 1, 1, 1,
0.0332028, -2.636101, 2.791175, 1, 1, 1, 1, 1,
0.03335125, 0.3851443, -0.3283744, 1, 1, 1, 1, 1,
0.03448721, -1.411275, 2.189263, 1, 1, 1, 1, 1,
0.03654564, -0.8976268, 1.954128, 1, 1, 1, 1, 1,
0.04161094, 0.7708318, 0.2097207, 1, 1, 1, 1, 1,
0.04165475, 1.188022, -0.8992319, 1, 1, 1, 1, 1,
0.04687718, -0.1060538, 4.049689, 1, 1, 1, 1, 1,
0.04901646, 1.337599, -0.9849219, 1, 1, 1, 1, 1,
0.04975315, 1.315055, 1.808015, 1, 1, 1, 1, 1,
0.05071514, -0.1953792, 3.78832, 1, 1, 1, 1, 1,
0.05361826, 1.164275, -0.04512554, 1, 1, 1, 1, 1,
0.05584835, 0.3504629, -1.191411, 0, 0, 1, 1, 1,
0.05767585, 0.04224126, 0.01413631, 1, 0, 0, 1, 1,
0.06286216, -0.9583732, 3.783216, 1, 0, 0, 1, 1,
0.06329596, -0.6978158, 2.858724, 1, 0, 0, 1, 1,
0.06846314, 0.2203129, 0.4958333, 1, 0, 0, 1, 1,
0.06868989, -1.111845, 3.103304, 1, 0, 0, 1, 1,
0.07021896, 0.9172847, 0.1770011, 0, 0, 0, 1, 1,
0.0757452, 1.373774, -0.06988032, 0, 0, 0, 1, 1,
0.07831915, -0.5269889, 3.604179, 0, 0, 0, 1, 1,
0.07998251, -0.5103362, 1.716141, 0, 0, 0, 1, 1,
0.08693788, 1.024674, 2.514646, 0, 0, 0, 1, 1,
0.08914963, 0.3450952, -0.6866146, 0, 0, 0, 1, 1,
0.09938071, 0.8956671, -0.338423, 0, 0, 0, 1, 1,
0.1013105, 1.022173, -0.3436301, 1, 1, 1, 1, 1,
0.1032806, -0.981546, 3.918188, 1, 1, 1, 1, 1,
0.1085478, 0.01276619, 1.138906, 1, 1, 1, 1, 1,
0.1111283, 0.5238352, -1.218181, 1, 1, 1, 1, 1,
0.1252044, 0.1881066, 0.2211097, 1, 1, 1, 1, 1,
0.1255422, 1.519716, 0.8585269, 1, 1, 1, 1, 1,
0.1256509, 0.143249, -0.101291, 1, 1, 1, 1, 1,
0.1262123, -0.2039141, 2.897655, 1, 1, 1, 1, 1,
0.1264932, 0.3754882, 0.3271144, 1, 1, 1, 1, 1,
0.1279295, -0.504988, 2.533042, 1, 1, 1, 1, 1,
0.1382743, -1.052045, 2.129796, 1, 1, 1, 1, 1,
0.1459629, -0.8557832, 1.766827, 1, 1, 1, 1, 1,
0.1464212, 1.136814, -0.8851982, 1, 1, 1, 1, 1,
0.1499328, -2.144324, 2.586135, 1, 1, 1, 1, 1,
0.1512201, -0.9402748, 2.941163, 1, 1, 1, 1, 1,
0.1550517, -0.3310477, 3.531455, 0, 0, 1, 1, 1,
0.1560937, -1.662767, 1.412975, 1, 0, 0, 1, 1,
0.160337, -1.118011, 3.062939, 1, 0, 0, 1, 1,
0.1610753, 1.49563, 0.6477389, 1, 0, 0, 1, 1,
0.1644434, 0.6744261, -2.067977, 1, 0, 0, 1, 1,
0.1692877, 0.6327155, 0.09298257, 1, 0, 0, 1, 1,
0.1716827, -0.531334, 3.566272, 0, 0, 0, 1, 1,
0.1775715, -1.595768, 2.931463, 0, 0, 0, 1, 1,
0.1778294, -0.1659934, 2.702852, 0, 0, 0, 1, 1,
0.1812418, -0.2416774, 2.842281, 0, 0, 0, 1, 1,
0.1820516, -1.726353, 3.18172, 0, 0, 0, 1, 1,
0.1824725, 0.4369062, -0.8607135, 0, 0, 0, 1, 1,
0.1859555, 1.041581, -0.9809685, 0, 0, 0, 1, 1,
0.1860419, -0.4247791, 2.906528, 1, 1, 1, 1, 1,
0.1900223, 0.4503672, 0.8076147, 1, 1, 1, 1, 1,
0.193508, -0.6493229, 3.384979, 1, 1, 1, 1, 1,
0.1946298, -0.3026473, 3.257951, 1, 1, 1, 1, 1,
0.2034634, -0.2948669, 3.754838, 1, 1, 1, 1, 1,
0.2042775, -1.196996, 3.584309, 1, 1, 1, 1, 1,
0.2056006, 0.2085868, 1.907324, 1, 1, 1, 1, 1,
0.2109896, -2.459882, 2.317272, 1, 1, 1, 1, 1,
0.2200727, 1.529381, -0.08439682, 1, 1, 1, 1, 1,
0.2205572, -1.213612, 2.394535, 1, 1, 1, 1, 1,
0.2322995, -1.630878, 3.037222, 1, 1, 1, 1, 1,
0.2331332, -0.4707528, 3.561236, 1, 1, 1, 1, 1,
0.2376315, -1.042115, 0.07037404, 1, 1, 1, 1, 1,
0.239645, 0.4280895, 0.4768192, 1, 1, 1, 1, 1,
0.246696, 1.132167, 0.3987301, 1, 1, 1, 1, 1,
0.2517936, -2.40705, 4.839384, 0, 0, 1, 1, 1,
0.2532277, -0.5782611, 1.898629, 1, 0, 0, 1, 1,
0.2547972, -0.3676148, 1.795168, 1, 0, 0, 1, 1,
0.2578051, -2.06337, 4.136952, 1, 0, 0, 1, 1,
0.261905, 1.489491, -1.609663, 1, 0, 0, 1, 1,
0.2653979, -0.0553469, 2.889981, 1, 0, 0, 1, 1,
0.2673355, 0.6360375, 1.766514, 0, 0, 0, 1, 1,
0.2685894, -1.029565, 4.151667, 0, 0, 0, 1, 1,
0.2699524, -0.8353857, 2.603285, 0, 0, 0, 1, 1,
0.2718346, -1.747516, 2.434839, 0, 0, 0, 1, 1,
0.2731489, -0.3164639, 4.988975, 0, 0, 0, 1, 1,
0.2851968, -1.564284, 2.51179, 0, 0, 0, 1, 1,
0.285305, -1.767298, 4.174395, 0, 0, 0, 1, 1,
0.2902341, 1.480036, 2.004232, 1, 1, 1, 1, 1,
0.2917823, -1.915333, 2.504026, 1, 1, 1, 1, 1,
0.2924067, -1.405324, 2.280479, 1, 1, 1, 1, 1,
0.2933505, 1.824546, 2.004195, 1, 1, 1, 1, 1,
0.2960157, -0.4222316, -0.09877848, 1, 1, 1, 1, 1,
0.3013037, 0.4249346, 2.727811, 1, 1, 1, 1, 1,
0.3025324, -0.3761301, 1.365995, 1, 1, 1, 1, 1,
0.3055254, 1.372328, 0.2807755, 1, 1, 1, 1, 1,
0.3061021, -0.1731102, 2.559878, 1, 1, 1, 1, 1,
0.3075553, 0.2064755, 0.5672153, 1, 1, 1, 1, 1,
0.3109208, 1.705177, -0.1525135, 1, 1, 1, 1, 1,
0.3162978, -0.9619193, 1.601215, 1, 1, 1, 1, 1,
0.3169641, -0.08459674, 1.745398, 1, 1, 1, 1, 1,
0.3184223, 1.841036, -0.02930758, 1, 1, 1, 1, 1,
0.3224328, 2.435855, 0.3749854, 1, 1, 1, 1, 1,
0.3248886, -1.175762, 2.544592, 0, 0, 1, 1, 1,
0.3261143, 1.090006, 1.465546, 1, 0, 0, 1, 1,
0.3293122, 0.9386531, -0.4195823, 1, 0, 0, 1, 1,
0.3302487, 0.7310831, 0.467567, 1, 0, 0, 1, 1,
0.3338922, -0.3148092, 1.319745, 1, 0, 0, 1, 1,
0.3421539, 1.022178, -1.173519, 1, 0, 0, 1, 1,
0.3463039, 1.742938, 0.3522867, 0, 0, 0, 1, 1,
0.3507176, -0.06209778, 1.205459, 0, 0, 0, 1, 1,
0.3513798, 1.659054, -0.3557593, 0, 0, 0, 1, 1,
0.3522446, 0.7613569, 2.418264, 0, 0, 0, 1, 1,
0.3523142, 0.4467942, -0.1989672, 0, 0, 0, 1, 1,
0.3555657, -2.228842, 3.660859, 0, 0, 0, 1, 1,
0.3662032, -0.1955711, 2.872009, 0, 0, 0, 1, 1,
0.3670646, -1.114457, 1.646243, 1, 1, 1, 1, 1,
0.3705957, 1.146616, -1.513909, 1, 1, 1, 1, 1,
0.3791558, -0.5600525, 0.7404711, 1, 1, 1, 1, 1,
0.3796854, -0.3143972, 1.832772, 1, 1, 1, 1, 1,
0.3806638, 0.1118174, -0.9423623, 1, 1, 1, 1, 1,
0.381965, 1.758012, 0.4442889, 1, 1, 1, 1, 1,
0.3826388, -0.1091958, 0.3883942, 1, 1, 1, 1, 1,
0.3852539, 0.1649238, 1.508401, 1, 1, 1, 1, 1,
0.3920542, 0.1397127, -0.2605932, 1, 1, 1, 1, 1,
0.3939382, -1.114965, 2.499688, 1, 1, 1, 1, 1,
0.3953762, 0.6405814, 0.5276546, 1, 1, 1, 1, 1,
0.3973052, 0.2147122, 1.540746, 1, 1, 1, 1, 1,
0.4019987, 0.9010923, -0.9204327, 1, 1, 1, 1, 1,
0.4068088, -0.1973169, -0.2105772, 1, 1, 1, 1, 1,
0.4091863, -1.582345, 0.8973697, 1, 1, 1, 1, 1,
0.4104121, -0.4893894, 2.671514, 0, 0, 1, 1, 1,
0.412524, 1.773039, -1.474134, 1, 0, 0, 1, 1,
0.4162958, -0.8112804, 1.644332, 1, 0, 0, 1, 1,
0.4171773, 1.148469, 1.007339, 1, 0, 0, 1, 1,
0.4185092, 0.3220307, 0.07536547, 1, 0, 0, 1, 1,
0.4243567, -0.4642261, 1.54579, 1, 0, 0, 1, 1,
0.4273175, 2.501722, -0.6059589, 0, 0, 0, 1, 1,
0.4285932, 0.9129196, -1.174899, 0, 0, 0, 1, 1,
0.4297912, -0.986607, 3.904605, 0, 0, 0, 1, 1,
0.4323646, 0.3761924, 1.433395, 0, 0, 0, 1, 1,
0.4385355, -1.185711, 3.208419, 0, 0, 0, 1, 1,
0.4394275, -0.593017, 4.24664, 0, 0, 0, 1, 1,
0.440936, 1.200287, 1.642936, 0, 0, 0, 1, 1,
0.4437872, 0.8333583, -0.9542558, 1, 1, 1, 1, 1,
0.4476945, -1.236119, 4.331051, 1, 1, 1, 1, 1,
0.4506018, 0.6127242, 1.167096, 1, 1, 1, 1, 1,
0.4573254, -0.06856788, 1.456437, 1, 1, 1, 1, 1,
0.458926, -0.6842731, 2.895979, 1, 1, 1, 1, 1,
0.4597, -0.3029147, 1.754368, 1, 1, 1, 1, 1,
0.4630407, -0.6546755, 3.662766, 1, 1, 1, 1, 1,
0.4670875, -0.47723, 1.978587, 1, 1, 1, 1, 1,
0.4684599, 0.6718734, 1.174007, 1, 1, 1, 1, 1,
0.4698251, -1.177301, 5.012011, 1, 1, 1, 1, 1,
0.4711654, 1.141249, 0.06988391, 1, 1, 1, 1, 1,
0.4724026, -0.7663922, 0.005949489, 1, 1, 1, 1, 1,
0.4728638, -2.025418, 1.239476, 1, 1, 1, 1, 1,
0.4745947, 0.7967182, 0.7808466, 1, 1, 1, 1, 1,
0.4772848, 1.340043, -0.8028209, 1, 1, 1, 1, 1,
0.4780752, -1.507622, 3.936056, 0, 0, 1, 1, 1,
0.47868, -0.773128, 2.17732, 1, 0, 0, 1, 1,
0.486558, 0.3809472, 0.1463826, 1, 0, 0, 1, 1,
0.4914989, 0.4647923, 0.8998025, 1, 0, 0, 1, 1,
0.4916809, -0.2969734, 2.694721, 1, 0, 0, 1, 1,
0.4981492, -0.8455047, 3.015119, 1, 0, 0, 1, 1,
0.5003694, -0.4839433, -0.5063257, 0, 0, 0, 1, 1,
0.5017881, 1.071656, -2.332672, 0, 0, 0, 1, 1,
0.5039324, 0.4786765, 0.7250288, 0, 0, 0, 1, 1,
0.504349, 0.1523237, 0.4144369, 0, 0, 0, 1, 1,
0.5046564, 0.4375064, 0.1030395, 0, 0, 0, 1, 1,
0.5050237, 0.9501581, -0.5137268, 0, 0, 0, 1, 1,
0.5072834, -0.5669959, 2.979058, 0, 0, 0, 1, 1,
0.5087142, -0.6731983, 2.616498, 1, 1, 1, 1, 1,
0.5109956, 0.7806979, 0.27949, 1, 1, 1, 1, 1,
0.5120581, -0.4701975, 0.8569704, 1, 1, 1, 1, 1,
0.5178628, -0.1150603, 1.613351, 1, 1, 1, 1, 1,
0.520866, 1.246299, 0.2265343, 1, 1, 1, 1, 1,
0.5276728, -2.172451, 3.597067, 1, 1, 1, 1, 1,
0.5277364, -2.34407, 2.559408, 1, 1, 1, 1, 1,
0.5314534, 0.1262242, 0.4437454, 1, 1, 1, 1, 1,
0.5325559, 0.4604785, -0.1763805, 1, 1, 1, 1, 1,
0.5337024, -0.5328875, 1.879031, 1, 1, 1, 1, 1,
0.5353531, -1.102544, 4.171555, 1, 1, 1, 1, 1,
0.5353938, 0.5192803, 1.230381, 1, 1, 1, 1, 1,
0.5369615, -1.495374, 4.042786, 1, 1, 1, 1, 1,
0.5432935, 1.113737, 1.064944, 1, 1, 1, 1, 1,
0.5447478, 2.25411, 0.7795535, 1, 1, 1, 1, 1,
0.5506617, 0.7566387, 2.310382, 0, 0, 1, 1, 1,
0.553866, 0.7139145, 1.589873, 1, 0, 0, 1, 1,
0.5541836, -0.09554341, 2.230076, 1, 0, 0, 1, 1,
0.5585258, 0.3047744, -0.5498716, 1, 0, 0, 1, 1,
0.5602556, 0.9942622, -1.250156, 1, 0, 0, 1, 1,
0.5671375, -0.5410937, 1.462264, 1, 0, 0, 1, 1,
0.568359, 0.7987452, 0.4821826, 0, 0, 0, 1, 1,
0.5709415, -0.5257691, 0.6120967, 0, 0, 0, 1, 1,
0.5712862, 0.679057, -0.5701833, 0, 0, 0, 1, 1,
0.573247, -1.409671, 1.990258, 0, 0, 0, 1, 1,
0.57356, 0.06567849, 2.524953, 0, 0, 0, 1, 1,
0.5750684, -0.6650988, 2.314359, 0, 0, 0, 1, 1,
0.5795487, 0.751219, 0.5624273, 0, 0, 0, 1, 1,
0.5810689, 0.5627635, -1.289145, 1, 1, 1, 1, 1,
0.5823601, 0.4776058, 0.8296249, 1, 1, 1, 1, 1,
0.5895596, -1.560467, 2.333934, 1, 1, 1, 1, 1,
0.589887, -0.2970583, 2.852208, 1, 1, 1, 1, 1,
0.5909907, -0.8885226, 3.075657, 1, 1, 1, 1, 1,
0.5968776, -1.094979, 3.19924, 1, 1, 1, 1, 1,
0.5972022, 2.059937, 2.184023, 1, 1, 1, 1, 1,
0.5988075, 2.133295, 1.002413, 1, 1, 1, 1, 1,
0.6020675, 0.725493, 0.9557583, 1, 1, 1, 1, 1,
0.602595, -1.747032, 1.257982, 1, 1, 1, 1, 1,
0.6050766, 0.2399509, 1.863274, 1, 1, 1, 1, 1,
0.6069699, -0.8715614, 3.258514, 1, 1, 1, 1, 1,
0.6071917, -1.082121, 0.1856949, 1, 1, 1, 1, 1,
0.6193184, -0.8600996, 1.994019, 1, 1, 1, 1, 1,
0.6246622, -1.474905, 4.574758, 1, 1, 1, 1, 1,
0.6276245, -1.270874, 2.384389, 0, 0, 1, 1, 1,
0.6276705, -1.7823, 2.390841, 1, 0, 0, 1, 1,
0.6294112, 0.8501791, -0.10968, 1, 0, 0, 1, 1,
0.6378076, -0.689644, 4.834875, 1, 0, 0, 1, 1,
0.6400701, 1.038613, -0.9569581, 1, 0, 0, 1, 1,
0.6443288, -1.155367, 3.816642, 1, 0, 0, 1, 1,
0.6445686, 1.272347, 0.3923618, 0, 0, 0, 1, 1,
0.6447513, -1.220714, 1.827666, 0, 0, 0, 1, 1,
0.6477756, 0.3206754, 1.561653, 0, 0, 0, 1, 1,
0.6516214, 0.3092397, 1.166954, 0, 0, 0, 1, 1,
0.6518107, -0.09079383, 1.899608, 0, 0, 0, 1, 1,
0.6519377, -0.8484547, 2.562514, 0, 0, 0, 1, 1,
0.6599107, -0.86869, 3.622757, 0, 0, 0, 1, 1,
0.6701928, -2.002185, 2.748846, 1, 1, 1, 1, 1,
0.6734678, 0.3514756, 2.018732, 1, 1, 1, 1, 1,
0.6748736, -0.43057, 1.242872, 1, 1, 1, 1, 1,
0.6771055, 1.982618, -0.9858142, 1, 1, 1, 1, 1,
0.6776314, 0.1696852, 1.635344, 1, 1, 1, 1, 1,
0.6778923, 1.101833, 2.296184, 1, 1, 1, 1, 1,
0.6799922, 0.3178501, 1.050346, 1, 1, 1, 1, 1,
0.6825632, 1.037168, 1.646376, 1, 1, 1, 1, 1,
0.6848508, -0.8086447, 2.946331, 1, 1, 1, 1, 1,
0.6869925, -0.173749, 2.498242, 1, 1, 1, 1, 1,
0.6957371, 0.03591646, 2.021266, 1, 1, 1, 1, 1,
0.6958728, -0.07338986, 2.216136, 1, 1, 1, 1, 1,
0.7132363, 0.281123, 0.3346907, 1, 1, 1, 1, 1,
0.7232961, -1.643634, 2.519271, 1, 1, 1, 1, 1,
0.7237504, -1.491561, 1.325289, 1, 1, 1, 1, 1,
0.7247752, -0.02278997, 2.400439, 0, 0, 1, 1, 1,
0.7281547, 0.9951957, 0.8315645, 1, 0, 0, 1, 1,
0.729592, -0.9322059, 1.966552, 1, 0, 0, 1, 1,
0.7320174, -1.875333, 2.937687, 1, 0, 0, 1, 1,
0.733399, 0.3272794, -0.4645401, 1, 0, 0, 1, 1,
0.7361412, -0.142104, -0.1572585, 1, 0, 0, 1, 1,
0.7397824, -0.463024, 2.722382, 0, 0, 0, 1, 1,
0.7411832, 0.5424548, 1.224999, 0, 0, 0, 1, 1,
0.7490242, -1.488768, 3.171448, 0, 0, 0, 1, 1,
0.7497284, -0.7134125, 3.445842, 0, 0, 0, 1, 1,
0.7504554, 0.5987334, 1.070563, 0, 0, 0, 1, 1,
0.7571144, -0.5864486, -0.8714532, 0, 0, 0, 1, 1,
0.7574686, -0.6733977, -0.4618411, 0, 0, 0, 1, 1,
0.7581627, 0.3404508, 2.274015, 1, 1, 1, 1, 1,
0.7589596, -0.606469, 0.7159232, 1, 1, 1, 1, 1,
0.7609729, 0.4411519, 1.363245, 1, 1, 1, 1, 1,
0.7658184, -0.2931115, 1.984393, 1, 1, 1, 1, 1,
0.7700363, 0.7563999, 0.8129141, 1, 1, 1, 1, 1,
0.7705086, -0.4147526, 3.618538, 1, 1, 1, 1, 1,
0.7724233, 0.01278924, 1.649893, 1, 1, 1, 1, 1,
0.7732971, 0.2043262, 0.7946823, 1, 1, 1, 1, 1,
0.7733509, -0.7371156, 2.998924, 1, 1, 1, 1, 1,
0.7761378, -1.224044, 1.152797, 1, 1, 1, 1, 1,
0.7793766, -1.259076, 2.211715, 1, 1, 1, 1, 1,
0.7795126, 1.437822, -1.002847, 1, 1, 1, 1, 1,
0.7892985, 0.900766, -0.6660802, 1, 1, 1, 1, 1,
0.7939364, 1.287727, -0.5609314, 1, 1, 1, 1, 1,
0.7945901, 0.2356818, -0.7656232, 1, 1, 1, 1, 1,
0.7981624, -0.6636416, 1.89022, 0, 0, 1, 1, 1,
0.7984186, -0.6214654, 2.527683, 1, 0, 0, 1, 1,
0.8009503, -0.141638, 2.120571, 1, 0, 0, 1, 1,
0.8053823, -1.252807, 3.22134, 1, 0, 0, 1, 1,
0.8072699, 0.7537102, -0.5437867, 1, 0, 0, 1, 1,
0.8176685, -0.04473774, 1.473774, 1, 0, 0, 1, 1,
0.8239554, 1.645964, 0.3718136, 0, 0, 0, 1, 1,
0.8262669, -0.08465375, 1.094835, 0, 0, 0, 1, 1,
0.8287187, -2.755469, 3.575509, 0, 0, 0, 1, 1,
0.8350883, 0.3645172, 1.588894, 0, 0, 0, 1, 1,
0.8358052, 0.08024471, 1.567675, 0, 0, 0, 1, 1,
0.8403176, 0.8412252, -0.3186648, 0, 0, 0, 1, 1,
0.8434346, -0.03033506, 2.638752, 0, 0, 0, 1, 1,
0.8490542, 0.5719702, 2.709584, 1, 1, 1, 1, 1,
0.8586174, -0.1903786, 0.4063764, 1, 1, 1, 1, 1,
0.8592504, -0.104637, 2.033689, 1, 1, 1, 1, 1,
0.8596578, 0.7535412, 0.4698682, 1, 1, 1, 1, 1,
0.8613415, -0.5837854, 4.463978, 1, 1, 1, 1, 1,
0.8645128, 0.1179211, 1.731071, 1, 1, 1, 1, 1,
0.8737633, -0.4498, 0.9543322, 1, 1, 1, 1, 1,
0.8742172, -0.617013, 2.884008, 1, 1, 1, 1, 1,
0.87487, 1.459547, -0.3087495, 1, 1, 1, 1, 1,
0.8791305, 0.6063721, -0.3134113, 1, 1, 1, 1, 1,
0.8803558, 0.03761338, 2.464986, 1, 1, 1, 1, 1,
0.8806454, 0.3456568, 2.047601, 1, 1, 1, 1, 1,
0.8906008, 0.003210917, 2.109682, 1, 1, 1, 1, 1,
0.8909287, -0.3917282, 3.454639, 1, 1, 1, 1, 1,
0.8931831, 0.802808, 0.2730942, 1, 1, 1, 1, 1,
0.895817, 1.277527, 0.1571242, 0, 0, 1, 1, 1,
0.8962337, -1.149375, 3.762281, 1, 0, 0, 1, 1,
0.9036844, -0.7712195, 0.8022789, 1, 0, 0, 1, 1,
0.9090003, 1.005397, -1.409137, 1, 0, 0, 1, 1,
0.9192513, -0.4507165, 1.829733, 1, 0, 0, 1, 1,
0.922101, 1.820292, 0.7920541, 1, 0, 0, 1, 1,
0.9245523, -0.3968667, 1.094965, 0, 0, 0, 1, 1,
0.9246244, 0.9857447, -0.3961037, 0, 0, 0, 1, 1,
0.9311416, -0.1045506, 0.8697462, 0, 0, 0, 1, 1,
0.9440898, 0.8162404, 1.200841, 0, 0, 0, 1, 1,
0.9461552, -1.685506, 1.456737, 0, 0, 0, 1, 1,
0.9470014, -0.5276173, 3.302697, 0, 0, 0, 1, 1,
0.9570519, 0.1242726, 0.6680903, 0, 0, 0, 1, 1,
0.9612707, -1.589596, 3.240046, 1, 1, 1, 1, 1,
0.9633682, 0.04274468, 3.026972, 1, 1, 1, 1, 1,
0.9676005, 1.731522, 0.6258396, 1, 1, 1, 1, 1,
0.9696164, 0.2514358, 1.556585, 1, 1, 1, 1, 1,
0.9720345, 0.8324109, 2.769886, 1, 1, 1, 1, 1,
0.976343, 0.1596899, 1.227851, 1, 1, 1, 1, 1,
0.9778243, 0.2266269, -0.3070714, 1, 1, 1, 1, 1,
0.9804898, 1.019472, 1.759873, 1, 1, 1, 1, 1,
0.9813935, -1.381387, 2.781018, 1, 1, 1, 1, 1,
0.9851568, 1.023767, 0.007679529, 1, 1, 1, 1, 1,
0.9900815, -0.9372485, 4.859509, 1, 1, 1, 1, 1,
0.9909047, -0.7478796, 1.415493, 1, 1, 1, 1, 1,
0.9951172, -0.3018227, 2.238606, 1, 1, 1, 1, 1,
0.9992987, 0.3485087, 1.100032, 1, 1, 1, 1, 1,
1.0057, 1.181894, 0.9727107, 1, 1, 1, 1, 1,
1.005842, 0.3425936, 1.234901, 0, 0, 1, 1, 1,
1.013971, 2.380081, 1.376937, 1, 0, 0, 1, 1,
1.014257, -0.8823978, 2.324586, 1, 0, 0, 1, 1,
1.017941, -0.7262413, 1.361832, 1, 0, 0, 1, 1,
1.01957, 1.044032, 0.7683242, 1, 0, 0, 1, 1,
1.0344, 0.4217278, 2.456386, 1, 0, 0, 1, 1,
1.041359, -1.030339, 1.019533, 0, 0, 0, 1, 1,
1.04214, 0.9424324, -0.005315608, 0, 0, 0, 1, 1,
1.045214, -1.603058, 2.301673, 0, 0, 0, 1, 1,
1.054446, -1.179173, 1.637309, 0, 0, 0, 1, 1,
1.056559, 0.3130985, -0.2568636, 0, 0, 0, 1, 1,
1.069916, -2.044932, 4.255423, 0, 0, 0, 1, 1,
1.072352, 0.2567369, 0.6535339, 0, 0, 0, 1, 1,
1.0739, -0.2696488, 1.12242, 1, 1, 1, 1, 1,
1.07443, -0.9232042, 1.871013, 1, 1, 1, 1, 1,
1.085494, 1.542385, -0.359212, 1, 1, 1, 1, 1,
1.086831, 0.2167407, 1.255288, 1, 1, 1, 1, 1,
1.086846, 0.1455653, 2.165947, 1, 1, 1, 1, 1,
1.0908, -0.6283498, 2.078332, 1, 1, 1, 1, 1,
1.091551, -0.1232022, 2.248669, 1, 1, 1, 1, 1,
1.095104, 1.553207, 1.73334, 1, 1, 1, 1, 1,
1.107873, -0.8294333, 2.426629, 1, 1, 1, 1, 1,
1.117984, 0.8663812, 1.020607, 1, 1, 1, 1, 1,
1.125825, -0.257898, 0.9872904, 1, 1, 1, 1, 1,
1.127628, -0.1199102, 1.711858, 1, 1, 1, 1, 1,
1.137879, -0.7462751, 2.558131, 1, 1, 1, 1, 1,
1.140307, 0.3855297, 2.206844, 1, 1, 1, 1, 1,
1.142507, -0.1461671, 3.095833, 1, 1, 1, 1, 1,
1.144805, 0.6630929, 0.9705598, 0, 0, 1, 1, 1,
1.148118, -0.618121, 2.976266, 1, 0, 0, 1, 1,
1.150206, 0.1994472, 1.869885, 1, 0, 0, 1, 1,
1.154302, 0.5332848, 0.6288278, 1, 0, 0, 1, 1,
1.162606, -0.8216952, 3.102372, 1, 0, 0, 1, 1,
1.165152, -0.3738531, 3.326696, 1, 0, 0, 1, 1,
1.171518, 0.05480174, 1.050238, 0, 0, 0, 1, 1,
1.172485, -0.3302385, 3.390807, 0, 0, 0, 1, 1,
1.178603, -1.375606, 3.278723, 0, 0, 0, 1, 1,
1.189138, -1.754856, 1.469278, 0, 0, 0, 1, 1,
1.191412, 0.1800455, 3.171544, 0, 0, 0, 1, 1,
1.196287, 0.8078393, 0.5536547, 0, 0, 0, 1, 1,
1.196329, 0.1909401, 1.652197, 0, 0, 0, 1, 1,
1.20088, -0.7994071, 2.675135, 1, 1, 1, 1, 1,
1.206576, 1.310769, 2.656188, 1, 1, 1, 1, 1,
1.219075, -0.5953966, 3.164036, 1, 1, 1, 1, 1,
1.22128, -1.249566, 1.186086, 1, 1, 1, 1, 1,
1.225339, -0.5336858, 3.278469, 1, 1, 1, 1, 1,
1.225582, 0.4595733, 2.256122, 1, 1, 1, 1, 1,
1.227633, -1.372264, 3.334398, 1, 1, 1, 1, 1,
1.228666, -1.723427, 3.2477, 1, 1, 1, 1, 1,
1.234751, 0.03602027, 2.281725, 1, 1, 1, 1, 1,
1.240884, 0.8108692, 0.3438059, 1, 1, 1, 1, 1,
1.245834, -1.348775, 2.913811, 1, 1, 1, 1, 1,
1.253803, -0.01630638, -0.3128462, 1, 1, 1, 1, 1,
1.255002, 2.847291, 1.993016, 1, 1, 1, 1, 1,
1.255423, 0.3705861, 0.8101759, 1, 1, 1, 1, 1,
1.261637, -0.7349316, 3.557466, 1, 1, 1, 1, 1,
1.265025, 0.2151624, 2.233779, 0, 0, 1, 1, 1,
1.295725, -0.1555375, 2.482177, 1, 0, 0, 1, 1,
1.298174, -0.6753911, 3.382369, 1, 0, 0, 1, 1,
1.303072, 1.037224, 1.270226, 1, 0, 0, 1, 1,
1.312369, -0.1816753, 1.956969, 1, 0, 0, 1, 1,
1.321536, 0.5684399, 1.185424, 1, 0, 0, 1, 1,
1.323061, -0.3482912, 2.467682, 0, 0, 0, 1, 1,
1.32431, 0.02088285, 1.756728, 0, 0, 0, 1, 1,
1.325639, -1.935993, 1.957062, 0, 0, 0, 1, 1,
1.333834, 1.275788, -0.8880593, 0, 0, 0, 1, 1,
1.339194, 0.5637208, 2.634441, 0, 0, 0, 1, 1,
1.343355, 0.9690215, 3.526827, 0, 0, 0, 1, 1,
1.349053, 0.5451493, 1.273875, 0, 0, 0, 1, 1,
1.35181, 1.730557, 0.1761827, 1, 1, 1, 1, 1,
1.35824, 0.3717089, 1.339846, 1, 1, 1, 1, 1,
1.360688, 0.1543869, 4.004229, 1, 1, 1, 1, 1,
1.36348, -0.113896, 2.458612, 1, 1, 1, 1, 1,
1.365142, 1.616964, -0.4203995, 1, 1, 1, 1, 1,
1.371693, 0.1951377, 1.141885, 1, 1, 1, 1, 1,
1.37225, 0.1284767, 2.044143, 1, 1, 1, 1, 1,
1.376772, 0.5988374, 0.9397836, 1, 1, 1, 1, 1,
1.384568, 1.42018, 1.693353, 1, 1, 1, 1, 1,
1.385107, 2.985341, 1.986436, 1, 1, 1, 1, 1,
1.392983, 0.6461806, 1.663224, 1, 1, 1, 1, 1,
1.395572, 0.2352251, 1.969507, 1, 1, 1, 1, 1,
1.4071, 0.1146739, -0.1759704, 1, 1, 1, 1, 1,
1.416441, 0.03892479, 1.730068, 1, 1, 1, 1, 1,
1.417234, 0.658878, 2.54612, 1, 1, 1, 1, 1,
1.434961, -0.156044, 2.964189, 0, 0, 1, 1, 1,
1.436485, 0.9618739, 1.770542, 1, 0, 0, 1, 1,
1.453187, 0.5420058, 2.601198, 1, 0, 0, 1, 1,
1.45608, -0.589178, 2.266361, 1, 0, 0, 1, 1,
1.457566, 0.798663, 2.475299, 1, 0, 0, 1, 1,
1.458923, 1.002026, 0.5599037, 1, 0, 0, 1, 1,
1.466916, 0.6466099, -0.06865367, 0, 0, 0, 1, 1,
1.490243, -1.410811, 2.74591, 0, 0, 0, 1, 1,
1.500687, 0.4199025, 2.683024, 0, 0, 0, 1, 1,
1.509228, -0.6219789, 2.198503, 0, 0, 0, 1, 1,
1.512189, -0.08529586, 1.363397, 0, 0, 0, 1, 1,
1.519506, 0.3465275, -0.5286419, 0, 0, 0, 1, 1,
1.545613, -0.2559901, 0.4663866, 0, 0, 0, 1, 1,
1.550366, 1.140598, 1.043837, 1, 1, 1, 1, 1,
1.55823, 0.8538501, 1.941105, 1, 1, 1, 1, 1,
1.560593, 0.1979897, 2.438955, 1, 1, 1, 1, 1,
1.561257, 0.3112003, 1.232699, 1, 1, 1, 1, 1,
1.571804, 0.004708514, 1.480744, 1, 1, 1, 1, 1,
1.574274, -0.2577713, 3.062835, 1, 1, 1, 1, 1,
1.591777, -0.8581909, 3.713121, 1, 1, 1, 1, 1,
1.598798, 1.401671, 1.983607, 1, 1, 1, 1, 1,
1.618604, -0.4228485, 2.452725, 1, 1, 1, 1, 1,
1.620541, 0.8537049, 1.471503, 1, 1, 1, 1, 1,
1.62393, -1.927611, 3.333853, 1, 1, 1, 1, 1,
1.627772, -1.045535, 2.768315, 1, 1, 1, 1, 1,
1.628051, 0.8957571, -0.755095, 1, 1, 1, 1, 1,
1.667337, 0.1210007, 2.692535, 1, 1, 1, 1, 1,
1.68296, -2.293584, 3.479091, 1, 1, 1, 1, 1,
1.690355, -0.3295897, 2.496922, 0, 0, 1, 1, 1,
1.691128, -1.202709, 0.9938109, 1, 0, 0, 1, 1,
1.693925, -0.3136701, 1.933951, 1, 0, 0, 1, 1,
1.69444, 0.8422022, 2.471465, 1, 0, 0, 1, 1,
1.697381, -0.5406902, 2.922847, 1, 0, 0, 1, 1,
1.697445, -0.6439661, 2.480455, 1, 0, 0, 1, 1,
1.69856, 1.691108, 1.439384, 0, 0, 0, 1, 1,
1.728865, 0.8563972, 0.2216015, 0, 0, 0, 1, 1,
1.729673, -0.4846651, 1.564152, 0, 0, 0, 1, 1,
1.742897, 0.3614026, 2.16198, 0, 0, 0, 1, 1,
1.780994, -0.1835681, 1.29946, 0, 0, 0, 1, 1,
1.784219, -0.4077962, 1.178479, 0, 0, 0, 1, 1,
1.793009, 1.77984, 0.90209, 0, 0, 0, 1, 1,
1.82151, -0.1736207, 1.630647, 1, 1, 1, 1, 1,
1.83874, 0.5332232, 2.710608, 1, 1, 1, 1, 1,
1.876541, 0.9011745, 2.714653, 1, 1, 1, 1, 1,
1.88199, 1.588973, 4.67134, 1, 1, 1, 1, 1,
1.906705, 0.6816822, -0.08510652, 1, 1, 1, 1, 1,
1.940978, 0.4252056, 1.340256, 1, 1, 1, 1, 1,
1.984604, 0.515317, 2.851436, 1, 1, 1, 1, 1,
2.00754, -1.149174, 2.291212, 1, 1, 1, 1, 1,
2.013576, 0.1956586, 1.295004, 1, 1, 1, 1, 1,
2.027918, 0.1987188, 1.309967, 1, 1, 1, 1, 1,
2.067636, 1.218515, 0.9990554, 1, 1, 1, 1, 1,
2.144376, 0.213355, 1.015375, 1, 1, 1, 1, 1,
2.148726, -0.4035354, 1.031375, 1, 1, 1, 1, 1,
2.161671, 0.361874, 2.629383, 1, 1, 1, 1, 1,
2.183584, 1.250588, 1.733939, 1, 1, 1, 1, 1,
2.23295, -0.5055116, 1.837439, 0, 0, 1, 1, 1,
2.243131, 0.6468782, 1.260841, 1, 0, 0, 1, 1,
2.312439, -1.910471, 2.268718, 1, 0, 0, 1, 1,
2.324345, -1.502018, 2.691366, 1, 0, 0, 1, 1,
2.336934, 0.720629, -0.8913051, 1, 0, 0, 1, 1,
2.384988, 0.823924, 0.6867191, 1, 0, 0, 1, 1,
2.428865, -0.6257828, 2.133375, 0, 0, 0, 1, 1,
2.456868, 2.361979, 0.7948331, 0, 0, 0, 1, 1,
2.485404, -1.999153, 2.04141, 0, 0, 0, 1, 1,
2.509715, -0.1238611, 0.4218982, 0, 0, 0, 1, 1,
2.516597, -0.8985655, 0.7011935, 0, 0, 0, 1, 1,
2.635558, -0.3004093, 1.578466, 0, 0, 0, 1, 1,
2.651342, -0.2670425, -0.5849645, 0, 0, 0, 1, 1,
2.661161, -1.257525, 1.709651, 1, 1, 1, 1, 1,
2.661509, 0.8356153, 1.571461, 1, 1, 1, 1, 1,
2.780696, -0.3725195, 0.7617594, 1, 1, 1, 1, 1,
2.846586, -0.3433966, 2.530342, 1, 1, 1, 1, 1,
2.864487, 1.249608, 1.426039, 1, 1, 1, 1, 1,
3.058024, -0.2022074, 0.798367, 1, 1, 1, 1, 1,
3.297478, -0.7831697, 3.545943, 1, 1, 1, 1, 1
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
var radius = 9.079565;
var distance = 31.89159;
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
mvMatrix.translate( -0.03585291, -0.1272186, -0.1048732 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.89159);
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
