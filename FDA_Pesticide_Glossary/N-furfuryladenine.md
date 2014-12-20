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
-3.174189, -0.2790243, -2.07082, 1, 0, 0, 1,
-3.157542, 3.491208, -0.7126936, 1, 0.007843138, 0, 1,
-2.889763, 0.359819, -3.626087, 1, 0.01176471, 0, 1,
-2.849758, -0.086543, -2.091963, 1, 0.01960784, 0, 1,
-2.563501, 1.017649, -2.252127, 1, 0.02352941, 0, 1,
-2.462221, -0.8412251, -3.239888, 1, 0.03137255, 0, 1,
-2.4508, 0.6092053, -2.0799, 1, 0.03529412, 0, 1,
-2.448102, 0.2210831, 0.1409613, 1, 0.04313726, 0, 1,
-2.42968, 0.07497033, -0.5831572, 1, 0.04705882, 0, 1,
-2.428749, 0.3304309, -1.827601, 1, 0.05490196, 0, 1,
-2.326143, -1.198983, -1.922601, 1, 0.05882353, 0, 1,
-2.321934, 0.3630034, -1.680104, 1, 0.06666667, 0, 1,
-2.291318, -0.6301039, -3.251681, 1, 0.07058824, 0, 1,
-2.275962, 0.01010641, 0.02552532, 1, 0.07843138, 0, 1,
-2.238415, -0.297759, -1.889388, 1, 0.08235294, 0, 1,
-2.226482, -0.8757322, -2.390912, 1, 0.09019608, 0, 1,
-2.207554, 0.5693503, -1.569823, 1, 0.09411765, 0, 1,
-2.1688, -0.8928949, -1.920571, 1, 0.1019608, 0, 1,
-2.168671, -1.781859, -1.972729, 1, 0.1098039, 0, 1,
-2.16414, 0.08811273, -2.225095, 1, 0.1137255, 0, 1,
-2.156824, -0.5184002, -0.2463694, 1, 0.1215686, 0, 1,
-2.144981, -0.2248263, -1.589732, 1, 0.1254902, 0, 1,
-2.137642, -1.264667, -3.073593, 1, 0.1333333, 0, 1,
-2.067768, 0.3313493, -0.3251995, 1, 0.1372549, 0, 1,
-2.062186, -1.233994, -3.058638, 1, 0.145098, 0, 1,
-2.06125, 1.891372, 0.3658333, 1, 0.1490196, 0, 1,
-2.059426, -1.056357, -1.81627, 1, 0.1568628, 0, 1,
-2.053956, 0.2409928, -1.304518, 1, 0.1607843, 0, 1,
-1.957783, 1.213314, -1.244188, 1, 0.1686275, 0, 1,
-1.942106, -0.2827911, -1.764593, 1, 0.172549, 0, 1,
-1.940098, -0.1666572, -2.796097, 1, 0.1803922, 0, 1,
-1.916242, 0.1739201, -1.906515, 1, 0.1843137, 0, 1,
-1.909035, 0.2002626, 0.3164544, 1, 0.1921569, 0, 1,
-1.902583, -0.7015151, -2.54406, 1, 0.1960784, 0, 1,
-1.881731, 1.527385, -0.5272802, 1, 0.2039216, 0, 1,
-1.867063, 1.486014, -0.07864505, 1, 0.2117647, 0, 1,
-1.827287, 1.161012, 0.001909936, 1, 0.2156863, 0, 1,
-1.825086, 1.979419, -1.363967, 1, 0.2235294, 0, 1,
-1.817771, 0.1508685, -1.584937, 1, 0.227451, 0, 1,
-1.793768, 1.185194, 0.254389, 1, 0.2352941, 0, 1,
-1.787599, 0.362509, -2.720735, 1, 0.2392157, 0, 1,
-1.778868, 0.740024, -1.790406, 1, 0.2470588, 0, 1,
-1.772128, 1.260189, -0.4432252, 1, 0.2509804, 0, 1,
-1.760604, 0.5221596, -2.165343, 1, 0.2588235, 0, 1,
-1.743711, 0.6630796, -1.149029, 1, 0.2627451, 0, 1,
-1.734999, -1.633558, -2.88668, 1, 0.2705882, 0, 1,
-1.727605, -0.3295523, -0.9773646, 1, 0.2745098, 0, 1,
-1.712815, 1.473223, -0.6532173, 1, 0.282353, 0, 1,
-1.708336, -0.7899494, -3.540456, 1, 0.2862745, 0, 1,
-1.701997, 0.9448841, -0.19703, 1, 0.2941177, 0, 1,
-1.673477, 0.1893155, -1.914499, 1, 0.3019608, 0, 1,
-1.659179, -1.572328, -3.341865, 1, 0.3058824, 0, 1,
-1.647061, 0.5551894, -0.3752722, 1, 0.3137255, 0, 1,
-1.633129, 0.7591846, -1.809587, 1, 0.3176471, 0, 1,
-1.625324, 1.067914, -2.496503, 1, 0.3254902, 0, 1,
-1.600602, -1.709887, -1.538188, 1, 0.3294118, 0, 1,
-1.598382, -0.0491579, -2.4214, 1, 0.3372549, 0, 1,
-1.596512, 0.8462458, -2.230465, 1, 0.3411765, 0, 1,
-1.595824, 0.8401598, -1.629644, 1, 0.3490196, 0, 1,
-1.594858, -0.2188291, -2.493763, 1, 0.3529412, 0, 1,
-1.588179, -0.5752685, -3.112592, 1, 0.3607843, 0, 1,
-1.575649, 0.2901438, -1.40763, 1, 0.3647059, 0, 1,
-1.569843, 0.2215271, -0.8923542, 1, 0.372549, 0, 1,
-1.560883, -0.6462357, -1.410451, 1, 0.3764706, 0, 1,
-1.528736, 0.4006528, -2.980643, 1, 0.3843137, 0, 1,
-1.527931, 0.9595292, -2.249858, 1, 0.3882353, 0, 1,
-1.524015, -1.734748, -1.888053, 1, 0.3960784, 0, 1,
-1.520719, -0.01288804, -2.020174, 1, 0.4039216, 0, 1,
-1.506674, -0.7533796, -4.92319, 1, 0.4078431, 0, 1,
-1.49326, -0.3575355, -2.834938, 1, 0.4156863, 0, 1,
-1.481595, 0.004569734, -0.624904, 1, 0.4196078, 0, 1,
-1.47808, -0.5017259, -0.9892702, 1, 0.427451, 0, 1,
-1.455482, -0.2547181, -0.4134787, 1, 0.4313726, 0, 1,
-1.453831, -0.3038995, -0.9444398, 1, 0.4392157, 0, 1,
-1.449787, 0.7455516, -1.230266, 1, 0.4431373, 0, 1,
-1.423581, 1.265726, -1.331492, 1, 0.4509804, 0, 1,
-1.418935, 0.4304981, -1.280867, 1, 0.454902, 0, 1,
-1.416783, -0.9331375, -0.4359844, 1, 0.4627451, 0, 1,
-1.408894, -0.7799493, -1.635918, 1, 0.4666667, 0, 1,
-1.407509, -0.2388301, -2.879164, 1, 0.4745098, 0, 1,
-1.40552, -1.251816, -2.751082, 1, 0.4784314, 0, 1,
-1.403642, -0.2478179, -2.54895, 1, 0.4862745, 0, 1,
-1.402492, 0.008961909, -1.720258, 1, 0.4901961, 0, 1,
-1.391672, 0.3824807, -0.7329217, 1, 0.4980392, 0, 1,
-1.390278, -2.357369, -2.452486, 1, 0.5058824, 0, 1,
-1.385031, -0.8427026, -2.86551, 1, 0.509804, 0, 1,
-1.378581, 0.8031844, -2.403894, 1, 0.5176471, 0, 1,
-1.375815, 0.0337071, 0.2126593, 1, 0.5215687, 0, 1,
-1.368406, -1.184108, -3.350393, 1, 0.5294118, 0, 1,
-1.359588, -0.8128555, -3.191025, 1, 0.5333334, 0, 1,
-1.354929, -0.9551735, -1.211754, 1, 0.5411765, 0, 1,
-1.353046, 2.376836, 0.3693864, 1, 0.5450981, 0, 1,
-1.350603, 1.683248, 1.648638, 1, 0.5529412, 0, 1,
-1.347153, 0.901647, -2.483874, 1, 0.5568628, 0, 1,
-1.346262, -2.007704, -1.564359, 1, 0.5647059, 0, 1,
-1.336515, 1.37984, -1.594145, 1, 0.5686275, 0, 1,
-1.32879, 0.2799001, 0.187398, 1, 0.5764706, 0, 1,
-1.316363, 0.1881473, -4.109662, 1, 0.5803922, 0, 1,
-1.31373, 0.6128052, -0.1579365, 1, 0.5882353, 0, 1,
-1.311057, -0.5639662, -2.748789, 1, 0.5921569, 0, 1,
-1.3043, 1.288053, -0.6407983, 1, 0.6, 0, 1,
-1.304238, 0.2326287, -1.062081, 1, 0.6078432, 0, 1,
-1.303886, 1.317666, -2.108032, 1, 0.6117647, 0, 1,
-1.30239, 2.179388, 0.4838202, 1, 0.6196079, 0, 1,
-1.301037, 0.1095569, -2.070287, 1, 0.6235294, 0, 1,
-1.300356, -0.1231268, -1.37553, 1, 0.6313726, 0, 1,
-1.293988, 1.797811, -1.084241, 1, 0.6352941, 0, 1,
-1.274666, -1.699862, -2.534291, 1, 0.6431373, 0, 1,
-1.27195, -1.187482, -1.657848, 1, 0.6470588, 0, 1,
-1.268305, -1.637697, -2.495823, 1, 0.654902, 0, 1,
-1.26086, 0.4399474, -0.6071442, 1, 0.6588235, 0, 1,
-1.256197, 0.03630229, -0.9322076, 1, 0.6666667, 0, 1,
-1.254583, 0.7734825, -0.8929171, 1, 0.6705883, 0, 1,
-1.238829, 0.5031939, -0.9757463, 1, 0.6784314, 0, 1,
-1.234878, 1.673567, -0.33927, 1, 0.682353, 0, 1,
-1.230598, 0.9662979, 0.3221964, 1, 0.6901961, 0, 1,
-1.222261, -0.8967499, -2.017393, 1, 0.6941177, 0, 1,
-1.215822, 0.8159346, -1.212868, 1, 0.7019608, 0, 1,
-1.208607, 0.304266, -0.1818046, 1, 0.7098039, 0, 1,
-1.20826, 0.9533703, -2.442534, 1, 0.7137255, 0, 1,
-1.19486, -1.041171, -0.5848721, 1, 0.7215686, 0, 1,
-1.194818, -1.761864, -2.652586, 1, 0.7254902, 0, 1,
-1.182653, 1.537364, -1.887963, 1, 0.7333333, 0, 1,
-1.176489, 0.6268494, -0.2262699, 1, 0.7372549, 0, 1,
-1.173842, 0.5239868, -1.049691, 1, 0.7450981, 0, 1,
-1.169024, -1.159243, -1.283772, 1, 0.7490196, 0, 1,
-1.165756, 2.623361, -0.4463341, 1, 0.7568628, 0, 1,
-1.158081, 0.6197039, -2.414713, 1, 0.7607843, 0, 1,
-1.145178, -0.07717597, -1.793769, 1, 0.7686275, 0, 1,
-1.139074, -0.3275319, -1.278139, 1, 0.772549, 0, 1,
-1.134127, -1.396139, -1.900498, 1, 0.7803922, 0, 1,
-1.126592, -0.3632946, -3.277272, 1, 0.7843137, 0, 1,
-1.126338, -0.6757352, -3.209765, 1, 0.7921569, 0, 1,
-1.120514, 2.241657, -0.7711989, 1, 0.7960784, 0, 1,
-1.117553, -1.553714, -2.86532, 1, 0.8039216, 0, 1,
-1.109904, -0.4361171, -0.7377779, 1, 0.8117647, 0, 1,
-1.097613, -0.8018309, -2.354178, 1, 0.8156863, 0, 1,
-1.090947, -0.9502464, -2.06333, 1, 0.8235294, 0, 1,
-1.090402, 0.006079636, -3.333886, 1, 0.827451, 0, 1,
-1.088565, 0.7443742, -0.8039451, 1, 0.8352941, 0, 1,
-1.077777, 1.010416, -0.7600344, 1, 0.8392157, 0, 1,
-1.068703, -0.4739102, -3.511394, 1, 0.8470588, 0, 1,
-1.068542, 1.338091, -0.7204976, 1, 0.8509804, 0, 1,
-1.066794, -0.5285105, -0.4431441, 1, 0.8588235, 0, 1,
-1.063661, 0.9483101, -1.031018, 1, 0.8627451, 0, 1,
-1.063115, -0.09478163, -2.685262, 1, 0.8705882, 0, 1,
-1.062313, 0.3801015, -0.6767107, 1, 0.8745098, 0, 1,
-1.05483, 0.967214, 0.5625237, 1, 0.8823529, 0, 1,
-1.052293, 0.7753105, 0.740661, 1, 0.8862745, 0, 1,
-1.046705, -0.9092524, -4.826839, 1, 0.8941177, 0, 1,
-1.046641, 1.966356, -2.353366, 1, 0.8980392, 0, 1,
-1.046012, -0.5093239, -2.201951, 1, 0.9058824, 0, 1,
-1.044944, 1.256978, -0.8641611, 1, 0.9137255, 0, 1,
-1.043734, 0.05341034, -1.186591, 1, 0.9176471, 0, 1,
-1.04011, -0.1442639, -1.6399, 1, 0.9254902, 0, 1,
-1.034412, -0.1714152, -2.32751, 1, 0.9294118, 0, 1,
-1.022581, -2.394398, -3.726298, 1, 0.9372549, 0, 1,
-1.019272, 1.126189, -1.377236, 1, 0.9411765, 0, 1,
-1.019178, -0.4764362, -1.892621, 1, 0.9490196, 0, 1,
-1.015946, -0.8227498, -4.325847, 1, 0.9529412, 0, 1,
-1.01281, 0.8070658, -2.808444, 1, 0.9607843, 0, 1,
-1.009977, -2.995097, -2.226902, 1, 0.9647059, 0, 1,
-1.009229, 0.1160049, -0.08763625, 1, 0.972549, 0, 1,
-1.006409, -0.0236867, -1.134189, 1, 0.9764706, 0, 1,
-0.9942627, -2.333452, -3.40427, 1, 0.9843137, 0, 1,
-0.990719, -0.2134181, -3.20515, 1, 0.9882353, 0, 1,
-0.9874597, 0.4443047, -1.2613, 1, 0.9960784, 0, 1,
-0.9826356, -1.895782, -2.165056, 0.9960784, 1, 0, 1,
-0.9800132, -1.38797, -2.841034, 0.9921569, 1, 0, 1,
-0.9674863, 1.116123, -0.8038464, 0.9843137, 1, 0, 1,
-0.9657975, 1.643546, -0.7966327, 0.9803922, 1, 0, 1,
-0.965039, 0.664166, -1.254678, 0.972549, 1, 0, 1,
-0.9647427, -1.538237, -2.169211, 0.9686275, 1, 0, 1,
-0.959398, 0.2783553, -1.376387, 0.9607843, 1, 0, 1,
-0.9589742, 1.833156, -0.3784028, 0.9568627, 1, 0, 1,
-0.9573923, 0.05927698, -1.584672, 0.9490196, 1, 0, 1,
-0.9479783, -0.01978534, -0.6291782, 0.945098, 1, 0, 1,
-0.9472247, 0.3154149, -1.132303, 0.9372549, 1, 0, 1,
-0.9454949, 0.8202614, -1.933403, 0.9333333, 1, 0, 1,
-0.9390921, 0.4510056, 0.9002803, 0.9254902, 1, 0, 1,
-0.9371986, -0.6643626, -3.182267, 0.9215686, 1, 0, 1,
-0.9310717, -0.6267875, -1.04454, 0.9137255, 1, 0, 1,
-0.9294706, 0.93591, -1.047504, 0.9098039, 1, 0, 1,
-0.9214361, 1.048795, -1.655052, 0.9019608, 1, 0, 1,
-0.9169229, -0.4875316, -1.875305, 0.8941177, 1, 0, 1,
-0.9137288, -0.312194, -1.552001, 0.8901961, 1, 0, 1,
-0.9048626, -1.948069, -3.231344, 0.8823529, 1, 0, 1,
-0.9038233, 0.181943, -1.39181, 0.8784314, 1, 0, 1,
-0.901413, 1.040206, -0.3364413, 0.8705882, 1, 0, 1,
-0.8977844, -1.474828, -3.204083, 0.8666667, 1, 0, 1,
-0.8977731, -1.561757, 0.4010938, 0.8588235, 1, 0, 1,
-0.8966112, 0.674862, 0.2039165, 0.854902, 1, 0, 1,
-0.8824852, 1.887797, -2.017971, 0.8470588, 1, 0, 1,
-0.8812097, -0.3627689, -2.600488, 0.8431373, 1, 0, 1,
-0.8683099, 0.1460983, -0.7010725, 0.8352941, 1, 0, 1,
-0.8606473, -0.2921791, -1.468778, 0.8313726, 1, 0, 1,
-0.8583277, -0.3463713, -3.126373, 0.8235294, 1, 0, 1,
-0.8532415, -2.591254, -3.378377, 0.8196079, 1, 0, 1,
-0.8443062, 0.1800182, -0.1189343, 0.8117647, 1, 0, 1,
-0.8383734, 0.01474196, -1.731203, 0.8078431, 1, 0, 1,
-0.8338165, 0.1590007, -2.619214, 0.8, 1, 0, 1,
-0.822253, 0.1139019, -1.387638, 0.7921569, 1, 0, 1,
-0.8178123, -1.375383, -2.332977, 0.7882353, 1, 0, 1,
-0.8176275, -0.1834596, -1.961349, 0.7803922, 1, 0, 1,
-0.8000151, 1.280825, -0.9338002, 0.7764706, 1, 0, 1,
-0.7958007, -1.822597, -3.150328, 0.7686275, 1, 0, 1,
-0.7957408, -1.121958, -3.570528, 0.7647059, 1, 0, 1,
-0.7952265, -0.7059219, -2.419672, 0.7568628, 1, 0, 1,
-0.7918677, -0.04864065, -3.236527, 0.7529412, 1, 0, 1,
-0.7856498, -0.07740394, -1.798803, 0.7450981, 1, 0, 1,
-0.7845262, 1.571191, -0.6418878, 0.7411765, 1, 0, 1,
-0.7839048, -0.968026, -3.689748, 0.7333333, 1, 0, 1,
-0.7806779, 0.1724009, -0.1688678, 0.7294118, 1, 0, 1,
-0.7805618, -0.6382017, -0.485226, 0.7215686, 1, 0, 1,
-0.7750571, -0.06795127, -2.348585, 0.7176471, 1, 0, 1,
-0.769557, 1.097803, -1.675381, 0.7098039, 1, 0, 1,
-0.7678157, -0.221591, -1.263821, 0.7058824, 1, 0, 1,
-0.7582141, 0.2990985, 0.3607061, 0.6980392, 1, 0, 1,
-0.757193, -0.8333205, -2.181525, 0.6901961, 1, 0, 1,
-0.7536645, 1.169389, -0.4960473, 0.6862745, 1, 0, 1,
-0.7513103, 0.6622607, -1.3659, 0.6784314, 1, 0, 1,
-0.7510372, -1.322368, -2.238456, 0.6745098, 1, 0, 1,
-0.7502463, 0.07226272, -1.354282, 0.6666667, 1, 0, 1,
-0.7483396, -0.5955021, -2.133482, 0.6627451, 1, 0, 1,
-0.7423567, -1.565984, -3.416282, 0.654902, 1, 0, 1,
-0.7401464, -0.4819461, -1.648666, 0.6509804, 1, 0, 1,
-0.7399617, -0.07411304, -0.4588925, 0.6431373, 1, 0, 1,
-0.7365273, 1.267994, -1.970254, 0.6392157, 1, 0, 1,
-0.7351978, 0.9209072, -1.378488, 0.6313726, 1, 0, 1,
-0.7327551, 1.472663, 0.9109356, 0.627451, 1, 0, 1,
-0.7251664, -0.02812574, -2.189499, 0.6196079, 1, 0, 1,
-0.7230521, -1.186793, -1.868105, 0.6156863, 1, 0, 1,
-0.7169235, -0.4122175, -2.105312, 0.6078432, 1, 0, 1,
-0.7130615, -1.594524, -2.232808, 0.6039216, 1, 0, 1,
-0.7103322, -0.4721893, -3.975238, 0.5960785, 1, 0, 1,
-0.7035041, -0.9031209, -4.813848, 0.5882353, 1, 0, 1,
-0.7020703, -0.8330368, -0.3687215, 0.5843138, 1, 0, 1,
-0.6954952, -1.076824, -2.491867, 0.5764706, 1, 0, 1,
-0.6917862, 0.2486159, -1.490146, 0.572549, 1, 0, 1,
-0.6825671, -0.9184272, -2.070061, 0.5647059, 1, 0, 1,
-0.678528, -0.02330542, -3.179545, 0.5607843, 1, 0, 1,
-0.6781215, -0.8991331, -3.365342, 0.5529412, 1, 0, 1,
-0.6761845, -1.281549, -0.63436, 0.5490196, 1, 0, 1,
-0.6755162, -0.003882709, 0.03924399, 0.5411765, 1, 0, 1,
-0.6725318, -1.583733, -3.004567, 0.5372549, 1, 0, 1,
-0.6720776, 0.3442368, -2.390168, 0.5294118, 1, 0, 1,
-0.6696066, 0.07247137, -2.082145, 0.5254902, 1, 0, 1,
-0.6600069, -0.94778, -4.508235, 0.5176471, 1, 0, 1,
-0.6594734, -0.3569583, -2.468823, 0.5137255, 1, 0, 1,
-0.652389, -0.7537796, -4.43561, 0.5058824, 1, 0, 1,
-0.6496742, -0.9765036, -2.022906, 0.5019608, 1, 0, 1,
-0.6408659, 1.948488, -0.1302651, 0.4941176, 1, 0, 1,
-0.635596, -2.452849, -3.47027, 0.4862745, 1, 0, 1,
-0.6350887, -0.7689857, -3.005028, 0.4823529, 1, 0, 1,
-0.6309496, 0.3841884, 0.3008244, 0.4745098, 1, 0, 1,
-0.6261097, -0.4443865, -0.5014358, 0.4705882, 1, 0, 1,
-0.6160309, -1.117489, -1.778614, 0.4627451, 1, 0, 1,
-0.6074986, 1.418426, -0.5753689, 0.4588235, 1, 0, 1,
-0.6070737, 0.9994431, -1.615565, 0.4509804, 1, 0, 1,
-0.6062019, -1.865645, -1.481754, 0.4470588, 1, 0, 1,
-0.6054265, 0.4619799, 0.1871952, 0.4392157, 1, 0, 1,
-0.6005707, -0.2536387, -1.873727, 0.4352941, 1, 0, 1,
-0.5978038, -0.1913372, -3.609634, 0.427451, 1, 0, 1,
-0.5966389, 0.1230639, -0.9685349, 0.4235294, 1, 0, 1,
-0.5948996, 1.241771, 0.3094298, 0.4156863, 1, 0, 1,
-0.591324, 1.131871, -2.414719, 0.4117647, 1, 0, 1,
-0.5815348, -0.12445, 0.1195153, 0.4039216, 1, 0, 1,
-0.579057, -0.7180765, -1.057209, 0.3960784, 1, 0, 1,
-0.5779264, 0.9769972, -0.6525148, 0.3921569, 1, 0, 1,
-0.5770982, -0.8628008, -3.100011, 0.3843137, 1, 0, 1,
-0.5765392, -0.3645881, -2.285727, 0.3803922, 1, 0, 1,
-0.5755185, 0.3507324, 0.4270521, 0.372549, 1, 0, 1,
-0.5709259, 0.4100994, -2.053061, 0.3686275, 1, 0, 1,
-0.5705997, -1.295678, -2.110801, 0.3607843, 1, 0, 1,
-0.5673199, -0.3926999, -0.4182945, 0.3568628, 1, 0, 1,
-0.5642252, 0.4201303, -1.876034, 0.3490196, 1, 0, 1,
-0.5612994, 0.5133667, -0.9403125, 0.345098, 1, 0, 1,
-0.5607845, 0.836305, -0.6389908, 0.3372549, 1, 0, 1,
-0.5600099, -2.238525, -1.893654, 0.3333333, 1, 0, 1,
-0.5594399, -0.9680706, -3.110348, 0.3254902, 1, 0, 1,
-0.5565965, 0.106519, -1.805337, 0.3215686, 1, 0, 1,
-0.5554945, 3.066072, 0.1730594, 0.3137255, 1, 0, 1,
-0.5506155, -0.4113432, -3.016052, 0.3098039, 1, 0, 1,
-0.5479466, -0.7657052, -3.020349, 0.3019608, 1, 0, 1,
-0.5468458, 0.3172808, -3.439607, 0.2941177, 1, 0, 1,
-0.5439715, -0.5065403, -2.839804, 0.2901961, 1, 0, 1,
-0.5413659, -0.232842, -1.927193, 0.282353, 1, 0, 1,
-0.5409365, 0.3677424, 0.3751704, 0.2784314, 1, 0, 1,
-0.5397692, -1.164312, -2.417358, 0.2705882, 1, 0, 1,
-0.5387278, 0.551953, -1.213611, 0.2666667, 1, 0, 1,
-0.5330066, 0.6161243, -0.8418585, 0.2588235, 1, 0, 1,
-0.5320818, -0.4283777, -2.352935, 0.254902, 1, 0, 1,
-0.5320771, 0.1170443, -1.457936, 0.2470588, 1, 0, 1,
-0.5315547, 0.1288812, -1.520966, 0.2431373, 1, 0, 1,
-0.5282453, 1.335258, 0.562063, 0.2352941, 1, 0, 1,
-0.5187874, 1.312011, 0.1324421, 0.2313726, 1, 0, 1,
-0.5187824, 0.6490574, -0.7171403, 0.2235294, 1, 0, 1,
-0.509328, -1.131322, -2.740989, 0.2196078, 1, 0, 1,
-0.5067241, -0.905912, -3.195797, 0.2117647, 1, 0, 1,
-0.5053003, 2.245784, -1.377912, 0.2078431, 1, 0, 1,
-0.5041789, 1.146431, 0.05019411, 0.2, 1, 0, 1,
-0.4967606, 1.142447, -0.6731793, 0.1921569, 1, 0, 1,
-0.4896734, 0.7308229, -1.344774, 0.1882353, 1, 0, 1,
-0.4875326, -0.05185467, -1.367262, 0.1803922, 1, 0, 1,
-0.4792662, 0.5925675, -1.069935, 0.1764706, 1, 0, 1,
-0.474968, 2.866185, -1.272424, 0.1686275, 1, 0, 1,
-0.4653371, 1.324389, -0.5399083, 0.1647059, 1, 0, 1,
-0.4626019, 0.5144817, -0.2624009, 0.1568628, 1, 0, 1,
-0.4579012, 0.0117873, -1.708552, 0.1529412, 1, 0, 1,
-0.4572791, -1.32221, -5.351441, 0.145098, 1, 0, 1,
-0.4547547, -0.6622649, -2.250835, 0.1411765, 1, 0, 1,
-0.4547494, 1.285007, -0.9177458, 0.1333333, 1, 0, 1,
-0.4517085, -0.3330932, -1.985713, 0.1294118, 1, 0, 1,
-0.4487807, 0.4695129, -3.379397, 0.1215686, 1, 0, 1,
-0.4438537, 1.130845, -2.206346, 0.1176471, 1, 0, 1,
-0.4351825, 0.2882011, -1.623444, 0.1098039, 1, 0, 1,
-0.4341962, -0.3384472, -1.854606, 0.1058824, 1, 0, 1,
-0.4321161, -0.4829235, -1.004836, 0.09803922, 1, 0, 1,
-0.4299812, -0.6021429, -2.995525, 0.09019608, 1, 0, 1,
-0.4294829, -1.14763, -3.404653, 0.08627451, 1, 0, 1,
-0.4230031, 0.2292171, 0.5415356, 0.07843138, 1, 0, 1,
-0.421796, 1.322972, 1.802047, 0.07450981, 1, 0, 1,
-0.4211614, -0.6604504, -2.244861, 0.06666667, 1, 0, 1,
-0.4136353, 0.5523716, 0.4592712, 0.0627451, 1, 0, 1,
-0.4126399, -0.876665, -3.010792, 0.05490196, 1, 0, 1,
-0.412612, 0.6439409, -2.353573, 0.05098039, 1, 0, 1,
-0.4122903, 0.84004, 0.5571364, 0.04313726, 1, 0, 1,
-0.4067554, 2.084326, -0.8443675, 0.03921569, 1, 0, 1,
-0.4062841, -0.8843912, -1.460609, 0.03137255, 1, 0, 1,
-0.4045312, -0.1553915, -1.549421, 0.02745098, 1, 0, 1,
-0.3989958, -1.117081, -3.691847, 0.01960784, 1, 0, 1,
-0.3984297, -0.1213095, -1.702304, 0.01568628, 1, 0, 1,
-0.3936824, 0.9400927, -1.64995, 0.007843138, 1, 0, 1,
-0.3918516, -0.2750843, -3.981271, 0.003921569, 1, 0, 1,
-0.3901039, 0.2487177, -0.9603469, 0, 1, 0.003921569, 1,
-0.3871778, -0.02618186, -0.0358828, 0, 1, 0.01176471, 1,
-0.3809115, -0.6870756, -2.072828, 0, 1, 0.01568628, 1,
-0.3734107, 0.1249035, -1.355815, 0, 1, 0.02352941, 1,
-0.369975, 1.705639, 0.0724696, 0, 1, 0.02745098, 1,
-0.3622319, -1.822041, -3.271745, 0, 1, 0.03529412, 1,
-0.3593947, 0.2118461, -1.872357, 0, 1, 0.03921569, 1,
-0.3587669, -0.6667057, -3.572219, 0, 1, 0.04705882, 1,
-0.3544591, -0.3887099, -2.543833, 0, 1, 0.05098039, 1,
-0.3514785, 0.7962744, -0.5446648, 0, 1, 0.05882353, 1,
-0.3508143, 0.7837261, 0.08517583, 0, 1, 0.0627451, 1,
-0.3448674, -0.2870171, -1.395831, 0, 1, 0.07058824, 1,
-0.3392136, -1.259773, -2.016179, 0, 1, 0.07450981, 1,
-0.3369633, 0.3678018, -2.193947, 0, 1, 0.08235294, 1,
-0.336312, -0.4591181, -3.428927, 0, 1, 0.08627451, 1,
-0.3258197, 0.07257396, -1.152945, 0, 1, 0.09411765, 1,
-0.3241547, 0.5902041, 0.6816623, 0, 1, 0.1019608, 1,
-0.3230944, -1.350756, -2.508708, 0, 1, 0.1058824, 1,
-0.3212533, 0.1885442, -1.323972, 0, 1, 0.1137255, 1,
-0.3203243, 0.3376943, 0.8844128, 0, 1, 0.1176471, 1,
-0.3194153, -0.264542, -0.9427986, 0, 1, 0.1254902, 1,
-0.317992, 1.132194, -2.434732, 0, 1, 0.1294118, 1,
-0.3179865, 0.6113714, -0.8657688, 0, 1, 0.1372549, 1,
-0.3179689, -0.7179794, -1.409815, 0, 1, 0.1411765, 1,
-0.3166643, -0.2083969, -2.77558, 0, 1, 0.1490196, 1,
-0.3165183, -0.2268949, -0.3936401, 0, 1, 0.1529412, 1,
-0.314086, 1.365204, -0.6739548, 0, 1, 0.1607843, 1,
-0.3109942, 0.4163494, -0.395889, 0, 1, 0.1647059, 1,
-0.3101203, 0.2737288, -1.174939, 0, 1, 0.172549, 1,
-0.3054568, -0.5870857, -1.021482, 0, 1, 0.1764706, 1,
-0.3047386, 0.2439055, 0.5039088, 0, 1, 0.1843137, 1,
-0.3037839, 2.739515, 0.05489677, 0, 1, 0.1882353, 1,
-0.3033485, -1.092675, -4.63696, 0, 1, 0.1960784, 1,
-0.2992697, -1.234522, -4.433, 0, 1, 0.2039216, 1,
-0.2988176, 0.610755, -0.1731528, 0, 1, 0.2078431, 1,
-0.2981947, -1.418204, -1.971392, 0, 1, 0.2156863, 1,
-0.2981912, -0.3027208, -1.746302, 0, 1, 0.2196078, 1,
-0.2972887, 0.8416973, -1.728445, 0, 1, 0.227451, 1,
-0.2969405, 0.3635678, -0.7876112, 0, 1, 0.2313726, 1,
-0.2966281, -0.8064887, -3.299962, 0, 1, 0.2392157, 1,
-0.2950472, -0.2519995, -2.265039, 0, 1, 0.2431373, 1,
-0.2916148, -0.3465079, -1.093385, 0, 1, 0.2509804, 1,
-0.290513, -2.214867, -2.966653, 0, 1, 0.254902, 1,
-0.2883586, -1.33832, -3.425264, 0, 1, 0.2627451, 1,
-0.2874045, -1.329012, -1.528682, 0, 1, 0.2666667, 1,
-0.2869817, -0.3251277, -4.4656, 0, 1, 0.2745098, 1,
-0.2864887, -0.9754477, -2.751569, 0, 1, 0.2784314, 1,
-0.2852859, -0.360195, -2.439083, 0, 1, 0.2862745, 1,
-0.2838948, -0.5015149, -2.489106, 0, 1, 0.2901961, 1,
-0.2825414, -0.5800844, -1.582635, 0, 1, 0.2980392, 1,
-0.2771063, 0.774165, 0.1504393, 0, 1, 0.3058824, 1,
-0.2768627, 1.613369, -0.3571018, 0, 1, 0.3098039, 1,
-0.276279, 0.4213914, -0.935295, 0, 1, 0.3176471, 1,
-0.2756914, 2.707626, 0.2294697, 0, 1, 0.3215686, 1,
-0.2736136, 1.063347, 0.08783395, 0, 1, 0.3294118, 1,
-0.2729177, 0.9538373, 0.2947648, 0, 1, 0.3333333, 1,
-0.2727306, 0.9716522, 0.7937005, 0, 1, 0.3411765, 1,
-0.2717624, -0.03332107, -2.468788, 0, 1, 0.345098, 1,
-0.2708693, -0.4341708, -2.361295, 0, 1, 0.3529412, 1,
-0.2670658, 0.28591, -0.8392056, 0, 1, 0.3568628, 1,
-0.2667323, 0.9288539, 0.02823986, 0, 1, 0.3647059, 1,
-0.2616453, -0.2732528, -3.169013, 0, 1, 0.3686275, 1,
-0.2575777, -1.153524, -2.503803, 0, 1, 0.3764706, 1,
-0.2569956, 0.7834029, -0.1159726, 0, 1, 0.3803922, 1,
-0.2530231, -0.4855326, -0.9107162, 0, 1, 0.3882353, 1,
-0.2506341, 1.948025, 0.3295849, 0, 1, 0.3921569, 1,
-0.2429141, -0.984956, -2.115402, 0, 1, 0.4, 1,
-0.2374669, 0.5208695, -1.494375, 0, 1, 0.4078431, 1,
-0.234683, -1.480677, -3.933218, 0, 1, 0.4117647, 1,
-0.2325798, -0.4261824, -3.268708, 0, 1, 0.4196078, 1,
-0.2302228, 0.8146647, -0.1195249, 0, 1, 0.4235294, 1,
-0.2292902, 0.06597302, -1.010664, 0, 1, 0.4313726, 1,
-0.2288847, 0.4057934, -1.634111, 0, 1, 0.4352941, 1,
-0.2249897, -0.9387227, -2.015753, 0, 1, 0.4431373, 1,
-0.2243044, -0.3789439, -1.55904, 0, 1, 0.4470588, 1,
-0.2198016, 0.1243934, -2.417919, 0, 1, 0.454902, 1,
-0.2181067, 0.160326, -1.216509, 0, 1, 0.4588235, 1,
-0.2149827, -0.7561076, -1.224236, 0, 1, 0.4666667, 1,
-0.2089943, 1.776497, -1.060012, 0, 1, 0.4705882, 1,
-0.2089298, 0.02756969, -0.8420517, 0, 1, 0.4784314, 1,
-0.2080139, 0.3181502, -0.5384642, 0, 1, 0.4823529, 1,
-0.2023257, -0.4775799, -3.428273, 0, 1, 0.4901961, 1,
-0.2017589, -1.028438, -1.849189, 0, 1, 0.4941176, 1,
-0.2014923, -0.2690133, -2.241414, 0, 1, 0.5019608, 1,
-0.1987101, 0.9356933, 0.4418045, 0, 1, 0.509804, 1,
-0.1940532, 0.9318427, 1.604049, 0, 1, 0.5137255, 1,
-0.1919783, -0.342889, -3.103809, 0, 1, 0.5215687, 1,
-0.1904092, 1.585942, -1.441627, 0, 1, 0.5254902, 1,
-0.1848196, 0.4916721, 1.243566, 0, 1, 0.5333334, 1,
-0.1834345, 0.8422624, 0.3503261, 0, 1, 0.5372549, 1,
-0.1820893, -0.2192302, -3.181749, 0, 1, 0.5450981, 1,
-0.1805544, -1.317061, -3.723376, 0, 1, 0.5490196, 1,
-0.1792627, -2.132881, -0.4528649, 0, 1, 0.5568628, 1,
-0.1769959, -0.2084087, -1.050224, 0, 1, 0.5607843, 1,
-0.1730869, -1.131685, -0.7747979, 0, 1, 0.5686275, 1,
-0.1709485, -0.4850775, -3.592571, 0, 1, 0.572549, 1,
-0.1682591, 0.3247449, -2.031673, 0, 1, 0.5803922, 1,
-0.160748, -1.312017, -3.421828, 0, 1, 0.5843138, 1,
-0.1590154, 0.08622959, -1.903136, 0, 1, 0.5921569, 1,
-0.1555574, -0.2781014, -2.244316, 0, 1, 0.5960785, 1,
-0.1507469, -0.2313158, -2.136433, 0, 1, 0.6039216, 1,
-0.1488875, -0.3295125, 0.2834489, 0, 1, 0.6117647, 1,
-0.1400465, 2.325673, -1.592582, 0, 1, 0.6156863, 1,
-0.1358757, -1.334391, -2.878475, 0, 1, 0.6235294, 1,
-0.1354557, -1.439446, -3.600543, 0, 1, 0.627451, 1,
-0.1329944, 1.150922, 1.905025, 0, 1, 0.6352941, 1,
-0.1324622, 0.223619, -1.05501, 0, 1, 0.6392157, 1,
-0.1272822, 1.592473, 0.1996194, 0, 1, 0.6470588, 1,
-0.1268966, -0.5536393, -4.254705, 0, 1, 0.6509804, 1,
-0.126707, -0.4490192, -4.171038, 0, 1, 0.6588235, 1,
-0.1259601, -0.1391568, -1.049494, 0, 1, 0.6627451, 1,
-0.1207858, -1.407894, -2.448881, 0, 1, 0.6705883, 1,
-0.1186825, -0.889826, -3.501765, 0, 1, 0.6745098, 1,
-0.1150996, -0.5379958, -3.34493, 0, 1, 0.682353, 1,
-0.1087394, -0.3328215, -1.276957, 0, 1, 0.6862745, 1,
-0.1082788, 0.7054254, -0.02172748, 0, 1, 0.6941177, 1,
-0.1052096, -0.03959209, -2.720134, 0, 1, 0.7019608, 1,
-0.1031186, 0.9519989, -1.188959, 0, 1, 0.7058824, 1,
-0.1015454, 0.1765155, 0.0001699266, 0, 1, 0.7137255, 1,
-0.09699965, -1.785498, -2.920289, 0, 1, 0.7176471, 1,
-0.09620266, 0.2751463, -0.1560405, 0, 1, 0.7254902, 1,
-0.09491565, 0.6836715, -1.30582, 0, 1, 0.7294118, 1,
-0.09404571, 1.056081, 0.5005317, 0, 1, 0.7372549, 1,
-0.08871448, 1.88104, -2.060809, 0, 1, 0.7411765, 1,
-0.08757763, -1.412372, -2.11449, 0, 1, 0.7490196, 1,
-0.08683185, -0.9151681, -3.08011, 0, 1, 0.7529412, 1,
-0.08412082, -0.1006471, -3.606827, 0, 1, 0.7607843, 1,
-0.0803972, 0.353074, -1.3508, 0, 1, 0.7647059, 1,
-0.07639869, 0.1881393, -0.3897886, 0, 1, 0.772549, 1,
-0.07620569, 0.8732005, 0.8646317, 0, 1, 0.7764706, 1,
-0.07556309, 0.2126178, -2.252183, 0, 1, 0.7843137, 1,
-0.07019179, -0.3274568, -3.10419, 0, 1, 0.7882353, 1,
-0.06888268, 1.891614, 1.137259, 0, 1, 0.7960784, 1,
-0.06695679, -0.01367076, -2.23899, 0, 1, 0.8039216, 1,
-0.0663112, 0.2121653, -0.4545562, 0, 1, 0.8078431, 1,
-0.06627063, 0.4690028, 0.2609215, 0, 1, 0.8156863, 1,
-0.06037598, -0.2429013, -4.159462, 0, 1, 0.8196079, 1,
-0.05875209, -0.475062, -4.496935, 0, 1, 0.827451, 1,
-0.05776215, 1.184293, -1.502686, 0, 1, 0.8313726, 1,
-0.04759465, 0.2031028, 0.636227, 0, 1, 0.8392157, 1,
-0.03747031, -1.664636, -1.580725, 0, 1, 0.8431373, 1,
-0.03718676, -0.3887343, -3.460222, 0, 1, 0.8509804, 1,
-0.03338938, 0.5431646, -0.8519925, 0, 1, 0.854902, 1,
-0.02713574, 0.9076419, -0.6063002, 0, 1, 0.8627451, 1,
-0.02611746, 0.5667874, -0.4565834, 0, 1, 0.8666667, 1,
-0.02106913, 0.4525423, 0.04139768, 0, 1, 0.8745098, 1,
-0.01905383, -0.208303, -3.701794, 0, 1, 0.8784314, 1,
-0.01876596, -0.4184343, -3.19087, 0, 1, 0.8862745, 1,
-0.01678666, 0.4517375, -0.4309831, 0, 1, 0.8901961, 1,
-0.01433442, 0.8617033, 0.4533983, 0, 1, 0.8980392, 1,
-0.01298327, -0.09821565, -1.673907, 0, 1, 0.9058824, 1,
-0.009731093, 0.5333326, -0.8671791, 0, 1, 0.9098039, 1,
-0.007454799, -1.217891, -1.382796, 0, 1, 0.9176471, 1,
-0.002032821, 0.9908566, -0.2761354, 0, 1, 0.9215686, 1,
0.004315986, -0.04231573, 3.16465, 0, 1, 0.9294118, 1,
0.007015941, 0.04451407, -1.072128, 0, 1, 0.9333333, 1,
0.008870799, 1.310845, -0.4457079, 0, 1, 0.9411765, 1,
0.01242804, -0.70297, 4.08128, 0, 1, 0.945098, 1,
0.01635602, -1.7695, 3.750263, 0, 1, 0.9529412, 1,
0.0239404, 1.050765, 1.438249, 0, 1, 0.9568627, 1,
0.02818082, -0.5265812, 3.774384, 0, 1, 0.9647059, 1,
0.03126897, 0.2741488, -0.5390651, 0, 1, 0.9686275, 1,
0.03479071, 1.628061, 0.7746642, 0, 1, 0.9764706, 1,
0.03568494, 0.4733474, -1.238456, 0, 1, 0.9803922, 1,
0.03667299, -0.004323376, 1.775497, 0, 1, 0.9882353, 1,
0.03683557, 0.8043963, 1.006802, 0, 1, 0.9921569, 1,
0.03887095, -0.8236502, 3.618372, 0, 1, 1, 1,
0.03997929, -0.08725677, 2.828412, 0, 0.9921569, 1, 1,
0.04199797, -0.02183161, 2.062673, 0, 0.9882353, 1, 1,
0.04341964, 0.2785411, -0.1297144, 0, 0.9803922, 1, 1,
0.04372589, -1.437663, 2.603351, 0, 0.9764706, 1, 1,
0.04659382, 0.06340556, -0.6813823, 0, 0.9686275, 1, 1,
0.04726845, 0.1349232, -1.164493, 0, 0.9647059, 1, 1,
0.04898725, -0.398238, 3.218248, 0, 0.9568627, 1, 1,
0.04940819, -0.222132, 4.247973, 0, 0.9529412, 1, 1,
0.05026276, -0.01552826, 1.228031, 0, 0.945098, 1, 1,
0.05060776, -0.8150223, 3.216339, 0, 0.9411765, 1, 1,
0.05499699, -2.101277, 5.088034, 0, 0.9333333, 1, 1,
0.05593254, 0.7009737, -1.181405, 0, 0.9294118, 1, 1,
0.05601803, 0.1824525, -0.01463217, 0, 0.9215686, 1, 1,
0.05791112, 2.267933, 0.350828, 0, 0.9176471, 1, 1,
0.05936254, 0.9724629, -0.5521804, 0, 0.9098039, 1, 1,
0.06072619, 1.707583, -1.02023, 0, 0.9058824, 1, 1,
0.06228535, 1.840462, 0.7436996, 0, 0.8980392, 1, 1,
0.06269313, -0.1292309, 2.601581, 0, 0.8901961, 1, 1,
0.062883, -1.062887, 2.231043, 0, 0.8862745, 1, 1,
0.06649824, -1.489649, 3.12363, 0, 0.8784314, 1, 1,
0.06988297, 0.08416927, -0.4862496, 0, 0.8745098, 1, 1,
0.07317434, -0.4092986, 1.862516, 0, 0.8666667, 1, 1,
0.07896771, -2.051603, 2.217532, 0, 0.8627451, 1, 1,
0.07937543, -1.829207, 2.927043, 0, 0.854902, 1, 1,
0.08012854, 1.508358, 0.9253581, 0, 0.8509804, 1, 1,
0.08306263, -0.5240786, 2.621759, 0, 0.8431373, 1, 1,
0.08481328, -0.3674538, 3.305005, 0, 0.8392157, 1, 1,
0.08761647, -1.008651, 4.343499, 0, 0.8313726, 1, 1,
0.08843409, -0.04724067, 1.942843, 0, 0.827451, 1, 1,
0.09146351, -0.5934243, 3.771429, 0, 0.8196079, 1, 1,
0.09159018, 1.379775, 1.134221, 0, 0.8156863, 1, 1,
0.09384251, 0.001124892, 0.5521092, 0, 0.8078431, 1, 1,
0.09566911, 0.3537334, 2.448936, 0, 0.8039216, 1, 1,
0.09764217, -0.2333586, 2.353451, 0, 0.7960784, 1, 1,
0.09903595, 0.03414803, 0.04944272, 0, 0.7882353, 1, 1,
0.1025704, 0.5860429, -0.1497565, 0, 0.7843137, 1, 1,
0.1026702, 0.496374, 0.6915034, 0, 0.7764706, 1, 1,
0.1033496, -0.7758551, 1.852296, 0, 0.772549, 1, 1,
0.1038939, 0.7860836, 0.8713825, 0, 0.7647059, 1, 1,
0.1119186, -1.36094, 2.323769, 0, 0.7607843, 1, 1,
0.1167159, -0.05142257, 0.2315425, 0, 0.7529412, 1, 1,
0.1167535, 0.9284322, -0.02454087, 0, 0.7490196, 1, 1,
0.1231207, 1.450554, 1.206285, 0, 0.7411765, 1, 1,
0.1264037, 0.7170435, -1.542462, 0, 0.7372549, 1, 1,
0.1306461, 0.2311626, -0.2930815, 0, 0.7294118, 1, 1,
0.1316609, 0.2032173, -0.4804295, 0, 0.7254902, 1, 1,
0.1324031, 0.6284692, 0.7506292, 0, 0.7176471, 1, 1,
0.134765, 0.6297967, 1.018506, 0, 0.7137255, 1, 1,
0.1368797, 0.7770432, 0.9608334, 0, 0.7058824, 1, 1,
0.137411, -0.1475503, 1.438343, 0, 0.6980392, 1, 1,
0.1375983, -0.4553511, 2.892175, 0, 0.6941177, 1, 1,
0.1378006, 1.333327, 0.163029, 0, 0.6862745, 1, 1,
0.1390972, -0.1583378, 2.73121, 0, 0.682353, 1, 1,
0.1405073, -0.1219141, 1.38258, 0, 0.6745098, 1, 1,
0.1407423, 0.414071, 0.3362344, 0, 0.6705883, 1, 1,
0.1421798, 0.3683437, -0.9117016, 0, 0.6627451, 1, 1,
0.1447581, -0.4102123, 3.567801, 0, 0.6588235, 1, 1,
0.147189, 1.345261, 0.8046044, 0, 0.6509804, 1, 1,
0.1490351, 0.6333625, -0.07367861, 0, 0.6470588, 1, 1,
0.1538025, 1.44857, 2.079539, 0, 0.6392157, 1, 1,
0.1561662, 0.3710407, 0.1624223, 0, 0.6352941, 1, 1,
0.1575122, 0.03690299, 3.063138, 0, 0.627451, 1, 1,
0.1630267, 1.151277, -0.9509814, 0, 0.6235294, 1, 1,
0.1632983, 0.6452457, -0.3526733, 0, 0.6156863, 1, 1,
0.1734833, 1.053011, -1.766421, 0, 0.6117647, 1, 1,
0.174199, 0.2703201, 0.4544121, 0, 0.6039216, 1, 1,
0.1770546, -0.197935, 1.629541, 0, 0.5960785, 1, 1,
0.1789516, -1.582911, 3.571903, 0, 0.5921569, 1, 1,
0.1810426, 0.93239, 1.455794, 0, 0.5843138, 1, 1,
0.1812931, 0.6398234, 1.060869, 0, 0.5803922, 1, 1,
0.1827093, -0.591825, 2.940008, 0, 0.572549, 1, 1,
0.1841797, 0.3542642, 0.8463281, 0, 0.5686275, 1, 1,
0.1863975, 0.9986848, 0.3150952, 0, 0.5607843, 1, 1,
0.1864613, 0.9949136, -0.9459519, 0, 0.5568628, 1, 1,
0.1867617, 0.07636916, 4.404132, 0, 0.5490196, 1, 1,
0.1889944, 2.354207, -0.6224579, 0, 0.5450981, 1, 1,
0.1919451, 0.7313581, 0.4486271, 0, 0.5372549, 1, 1,
0.1952473, 0.7303672, -0.08917469, 0, 0.5333334, 1, 1,
0.1958075, 0.03081514, 0.9348999, 0, 0.5254902, 1, 1,
0.2017437, 0.6719315, 0.02204343, 0, 0.5215687, 1, 1,
0.207592, -1.124101, 2.547113, 0, 0.5137255, 1, 1,
0.2086887, 0.481358, -1.50976, 0, 0.509804, 1, 1,
0.2107153, -0.7937176, 3.88333, 0, 0.5019608, 1, 1,
0.214595, -0.6368809, 2.194618, 0, 0.4941176, 1, 1,
0.2184776, 1.582266, -0.3675759, 0, 0.4901961, 1, 1,
0.2188047, 0.1992541, 0.7528303, 0, 0.4823529, 1, 1,
0.2234011, -1.112685, 2.124748, 0, 0.4784314, 1, 1,
0.224805, 0.09037021, 2.048897, 0, 0.4705882, 1, 1,
0.2316717, -0.9884967, 2.6151, 0, 0.4666667, 1, 1,
0.2370871, 1.159893, -1.764395, 0, 0.4588235, 1, 1,
0.2371745, -0.7300803, 1.799694, 0, 0.454902, 1, 1,
0.2390603, 0.02179837, 1.877295, 0, 0.4470588, 1, 1,
0.2396607, -0.1252434, 2.558281, 0, 0.4431373, 1, 1,
0.2405008, -0.5841241, 4.28825, 0, 0.4352941, 1, 1,
0.2461154, -0.1847492, 1.381292, 0, 0.4313726, 1, 1,
0.2468291, -0.4135863, 1.904333, 0, 0.4235294, 1, 1,
0.2545635, 0.8756253, 1.298094, 0, 0.4196078, 1, 1,
0.2561071, 2.29555, -0.8383641, 0, 0.4117647, 1, 1,
0.2571801, -1.409771, 1.602278, 0, 0.4078431, 1, 1,
0.2597038, 1.384237, -0.438854, 0, 0.4, 1, 1,
0.2620236, -0.1115123, 0.8768687, 0, 0.3921569, 1, 1,
0.2625822, 1.657821, 1.519115, 0, 0.3882353, 1, 1,
0.2681544, -1.346278, 3.956556, 0, 0.3803922, 1, 1,
0.2710133, -2.400302, 2.705592, 0, 0.3764706, 1, 1,
0.2774447, -1.261539, 2.77554, 0, 0.3686275, 1, 1,
0.2774662, -1.086975, 2.62806, 0, 0.3647059, 1, 1,
0.2795035, 0.1654994, -0.8162282, 0, 0.3568628, 1, 1,
0.2845662, 0.6804602, -1.571486, 0, 0.3529412, 1, 1,
0.290525, 0.3431957, 0.0609841, 0, 0.345098, 1, 1,
0.2923337, -1.115007, 3.152863, 0, 0.3411765, 1, 1,
0.2950659, -1.061082, 3.282448, 0, 0.3333333, 1, 1,
0.2951636, -1.475927, 1.743323, 0, 0.3294118, 1, 1,
0.3083754, 0.2452427, 1.738447, 0, 0.3215686, 1, 1,
0.3105332, -1.042521, 2.502931, 0, 0.3176471, 1, 1,
0.3125067, -0.8414778, 2.624299, 0, 0.3098039, 1, 1,
0.3126637, -0.132438, 1.002112, 0, 0.3058824, 1, 1,
0.3130735, 0.0694834, 0.3499356, 0, 0.2980392, 1, 1,
0.319282, 0.5922642, 0.4932835, 0, 0.2901961, 1, 1,
0.3203849, -0.7171645, 3.077706, 0, 0.2862745, 1, 1,
0.3266792, -0.1772399, 1.925862, 0, 0.2784314, 1, 1,
0.3269178, 0.2756815, 1.258432, 0, 0.2745098, 1, 1,
0.3271776, -0.2149, 0.3013721, 0, 0.2666667, 1, 1,
0.3298042, -0.00973087, -0.07179187, 0, 0.2627451, 1, 1,
0.3334796, 0.8963228, 0.2944848, 0, 0.254902, 1, 1,
0.3382275, 1.621232, -0.03782623, 0, 0.2509804, 1, 1,
0.3392687, 2.127977, -1.040151, 0, 0.2431373, 1, 1,
0.3408282, -0.4981367, 3.304246, 0, 0.2392157, 1, 1,
0.3413639, 0.434416, 0.2685344, 0, 0.2313726, 1, 1,
0.3460644, -0.844722, 4.525495, 0, 0.227451, 1, 1,
0.3465379, -0.5842677, 3.174332, 0, 0.2196078, 1, 1,
0.3476896, -0.9413055, 2.558042, 0, 0.2156863, 1, 1,
0.3493279, 2.104382, 0.1504832, 0, 0.2078431, 1, 1,
0.3515689, 0.642056, -0.01540362, 0, 0.2039216, 1, 1,
0.3535009, 0.04200636, 0.1419462, 0, 0.1960784, 1, 1,
0.3542486, 2.234448, 1.162447, 0, 0.1882353, 1, 1,
0.3619582, -1.424873, 2.774745, 0, 0.1843137, 1, 1,
0.3675718, 0.7549612, -0.7881057, 0, 0.1764706, 1, 1,
0.3677734, 0.2403607, -0.1199963, 0, 0.172549, 1, 1,
0.3740509, 0.7553194, -0.0502667, 0, 0.1647059, 1, 1,
0.3764091, -0.42296, 1.815109, 0, 0.1607843, 1, 1,
0.3850853, 1.107598, -1.068648, 0, 0.1529412, 1, 1,
0.38784, -0.1408701, 4.222661, 0, 0.1490196, 1, 1,
0.3921967, -0.8116259, 3.816876, 0, 0.1411765, 1, 1,
0.402517, -0.8443439, 2.830345, 0, 0.1372549, 1, 1,
0.4100585, 0.3255274, 0.5660473, 0, 0.1294118, 1, 1,
0.4158134, -0.870986, 1.395504, 0, 0.1254902, 1, 1,
0.4158401, -1.726391, 3.494434, 0, 0.1176471, 1, 1,
0.4171584, -0.1714104, 2.863096, 0, 0.1137255, 1, 1,
0.4172965, -0.677344, 1.038738, 0, 0.1058824, 1, 1,
0.4184228, -1.525347, 1.656102, 0, 0.09803922, 1, 1,
0.418801, -1.184628, 2.142367, 0, 0.09411765, 1, 1,
0.4195264, -1.04924, 3.49583, 0, 0.08627451, 1, 1,
0.4270964, -0.4789828, 1.720879, 0, 0.08235294, 1, 1,
0.4393528, 0.5351282, 1.252379, 0, 0.07450981, 1, 1,
0.4394904, 0.6622688, 1.075734, 0, 0.07058824, 1, 1,
0.4426936, 0.621129, -0.02707518, 0, 0.0627451, 1, 1,
0.4441375, -1.051453, 3.730549, 0, 0.05882353, 1, 1,
0.4455191, 1.145383, 0.6313904, 0, 0.05098039, 1, 1,
0.4459377, 1.483661, -0.09418172, 0, 0.04705882, 1, 1,
0.4459469, 0.8284045, 1.726027, 0, 0.03921569, 1, 1,
0.4477595, 0.2771092, 2.419354, 0, 0.03529412, 1, 1,
0.4489894, -0.2830328, 2.62925, 0, 0.02745098, 1, 1,
0.4500473, 0.787935, 0.2361733, 0, 0.02352941, 1, 1,
0.4509677, -0.2814865, 0.6522948, 0, 0.01568628, 1, 1,
0.4523588, -1.958573, 3.63306, 0, 0.01176471, 1, 1,
0.4525369, -0.2040324, 2.296935, 0, 0.003921569, 1, 1,
0.4567915, 1.531446, 1.021815, 0.003921569, 0, 1, 1,
0.4577482, 1.212535, 1.243096, 0.007843138, 0, 1, 1,
0.4577815, 1.597961, 0.925824, 0.01568628, 0, 1, 1,
0.4618409, 0.2295626, 0.6940764, 0.01960784, 0, 1, 1,
0.4628633, 0.5172049, 1.308182, 0.02745098, 0, 1, 1,
0.4633618, 0.05584448, 1.292835, 0.03137255, 0, 1, 1,
0.467639, 0.09750086, 0.3048425, 0.03921569, 0, 1, 1,
0.4683118, 1.74488, 1.694236, 0.04313726, 0, 1, 1,
0.4700395, -2.105467, 1.862955, 0.05098039, 0, 1, 1,
0.4704439, 0.963725, 1.385667, 0.05490196, 0, 1, 1,
0.470942, -0.5708511, 3.067238, 0.0627451, 0, 1, 1,
0.472133, -1.049834, 3.63023, 0.06666667, 0, 1, 1,
0.4739384, 1.114206, -1.112541, 0.07450981, 0, 1, 1,
0.4783159, 1.818126, -0.2243624, 0.07843138, 0, 1, 1,
0.4792002, -0.6822346, 2.402768, 0.08627451, 0, 1, 1,
0.4838403, -0.3876989, 2.294014, 0.09019608, 0, 1, 1,
0.4845711, 0.5371367, 0.8148978, 0.09803922, 0, 1, 1,
0.4879187, 1.423936, 0.1046339, 0.1058824, 0, 1, 1,
0.490092, -0.4242397, 2.973394, 0.1098039, 0, 1, 1,
0.4924268, 0.9571775, 1.09553, 0.1176471, 0, 1, 1,
0.4951688, 0.08796532, -0.1365531, 0.1215686, 0, 1, 1,
0.4979167, -1.48928, 2.887812, 0.1294118, 0, 1, 1,
0.5013781, -1.813828, 3.689398, 0.1333333, 0, 1, 1,
0.5029405, 1.410508, 0.07485031, 0.1411765, 0, 1, 1,
0.5084934, -1.020665, 2.352562, 0.145098, 0, 1, 1,
0.5147573, 0.9351797, 0.2799928, 0.1529412, 0, 1, 1,
0.5152455, -0.1030376, 1.084456, 0.1568628, 0, 1, 1,
0.5157509, 1.377903, -0.2338043, 0.1647059, 0, 1, 1,
0.5251071, 0.3913072, 0.01187846, 0.1686275, 0, 1, 1,
0.5265919, -0.7160758, 3.920568, 0.1764706, 0, 1, 1,
0.5292876, 0.02218468, 1.062434, 0.1803922, 0, 1, 1,
0.5309322, -0.2309954, 2.645622, 0.1882353, 0, 1, 1,
0.5315365, 0.9236426, -0.1893327, 0.1921569, 0, 1, 1,
0.5337096, -0.7636672, 2.51025, 0.2, 0, 1, 1,
0.5338381, -1.103757, 3.268182, 0.2078431, 0, 1, 1,
0.5339212, -0.9054387, 3.002703, 0.2117647, 0, 1, 1,
0.5347272, 0.859032, -0.6161127, 0.2196078, 0, 1, 1,
0.541232, 1.382025, 0.0635292, 0.2235294, 0, 1, 1,
0.5452271, 0.2457818, 0.5144474, 0.2313726, 0, 1, 1,
0.546773, 1.173344, 2.64422, 0.2352941, 0, 1, 1,
0.5481579, 1.50779, -0.3603483, 0.2431373, 0, 1, 1,
0.5490021, 0.6021279, 0.03421876, 0.2470588, 0, 1, 1,
0.5564027, -1.400482, 3.860909, 0.254902, 0, 1, 1,
0.5569762, -0.8970197, 2.122272, 0.2588235, 0, 1, 1,
0.5576434, -0.5373021, 2.810837, 0.2666667, 0, 1, 1,
0.5590328, 0.5623904, -0.4488384, 0.2705882, 0, 1, 1,
0.5628827, 1.501107, 0.2864102, 0.2784314, 0, 1, 1,
0.5666842, 2.137283, 0.4325659, 0.282353, 0, 1, 1,
0.5696239, -0.5505076, 2.193654, 0.2901961, 0, 1, 1,
0.5708686, -0.7601066, 3.351861, 0.2941177, 0, 1, 1,
0.5818735, -0.3373972, 1.319475, 0.3019608, 0, 1, 1,
0.5824605, 0.8853935, 1.520423, 0.3098039, 0, 1, 1,
0.5837603, 0.4920965, 0.4338263, 0.3137255, 0, 1, 1,
0.5871392, 1.512842, 0.4805892, 0.3215686, 0, 1, 1,
0.5881222, -0.8498803, 2.949272, 0.3254902, 0, 1, 1,
0.5900109, -0.3638831, 1.791982, 0.3333333, 0, 1, 1,
0.5915728, -0.7176771, 1.43324, 0.3372549, 0, 1, 1,
0.5926094, -0.6905083, 3.167118, 0.345098, 0, 1, 1,
0.6058627, -1.176922, 3.625663, 0.3490196, 0, 1, 1,
0.6084431, -0.9797884, 1.175803, 0.3568628, 0, 1, 1,
0.6122394, 0.6833379, 1.006559, 0.3607843, 0, 1, 1,
0.6147029, -0.8981453, 3.188051, 0.3686275, 0, 1, 1,
0.6175368, -0.583472, 3.796721, 0.372549, 0, 1, 1,
0.6183851, -1.350534, 3.295431, 0.3803922, 0, 1, 1,
0.6202082, -0.5537071, 2.413505, 0.3843137, 0, 1, 1,
0.6247242, 0.9423853, 0.2335802, 0.3921569, 0, 1, 1,
0.6272596, 0.2489233, -0.4571088, 0.3960784, 0, 1, 1,
0.6281297, 0.6940334, 0.7567445, 0.4039216, 0, 1, 1,
0.6309516, 1.057946, -1.486432, 0.4117647, 0, 1, 1,
0.6339328, 0.1676557, 1.668711, 0.4156863, 0, 1, 1,
0.6355292, -0.6472223, 2.736907, 0.4235294, 0, 1, 1,
0.6369122, 0.9743287, 0.909753, 0.427451, 0, 1, 1,
0.6475842, 1.448954, -0.02412074, 0.4352941, 0, 1, 1,
0.6490646, 0.7632991, 1.781912, 0.4392157, 0, 1, 1,
0.6512721, -0.1107205, 3.322895, 0.4470588, 0, 1, 1,
0.653603, -1.309378, 3.735102, 0.4509804, 0, 1, 1,
0.6537835, -1.173488, 1.676976, 0.4588235, 0, 1, 1,
0.6672736, 0.8468215, 1.485488, 0.4627451, 0, 1, 1,
0.6686108, -0.6023156, 1.077882, 0.4705882, 0, 1, 1,
0.672076, 0.1873801, 0.4747539, 0.4745098, 0, 1, 1,
0.6728384, 0.7232982, 0.8489117, 0.4823529, 0, 1, 1,
0.673476, -0.6661906, 1.296348, 0.4862745, 0, 1, 1,
0.6841354, -0.502814, 1.698745, 0.4941176, 0, 1, 1,
0.6859717, 1.884405, -1.992088, 0.5019608, 0, 1, 1,
0.6908321, -2.037064, 2.709839, 0.5058824, 0, 1, 1,
0.6998683, -0.2932465, 1.392058, 0.5137255, 0, 1, 1,
0.7010186, 0.1812622, -0.7416806, 0.5176471, 0, 1, 1,
0.7096413, 0.3940102, -0.003334851, 0.5254902, 0, 1, 1,
0.7111328, 1.917481, -1.757881, 0.5294118, 0, 1, 1,
0.7156489, -1.918072, 3.823807, 0.5372549, 0, 1, 1,
0.716709, -0.955076, 0.3357536, 0.5411765, 0, 1, 1,
0.7167921, -0.03881349, 1.657526, 0.5490196, 0, 1, 1,
0.7308366, -0.9586831, 2.107935, 0.5529412, 0, 1, 1,
0.7322702, 1.007575, -0.1260322, 0.5607843, 0, 1, 1,
0.7368947, -1.853165, 1.469795, 0.5647059, 0, 1, 1,
0.7408685, 1.285497, -1.829612, 0.572549, 0, 1, 1,
0.746282, 1.293149, 0.4654985, 0.5764706, 0, 1, 1,
0.7505909, -0.2860762, 1.782281, 0.5843138, 0, 1, 1,
0.7552775, -0.06277798, -0.5111703, 0.5882353, 0, 1, 1,
0.7574956, -0.3449766, 2.502189, 0.5960785, 0, 1, 1,
0.7586349, 0.8861987, 2.585315, 0.6039216, 0, 1, 1,
0.7603459, -1.301636, 3.017669, 0.6078432, 0, 1, 1,
0.780414, 1.263815, -1.754006, 0.6156863, 0, 1, 1,
0.7808954, 1.287502, 0.2859498, 0.6196079, 0, 1, 1,
0.7820831, 0.6405823, 0.9118873, 0.627451, 0, 1, 1,
0.7828131, -0.3250304, 1.198902, 0.6313726, 0, 1, 1,
0.7865091, 0.532362, 0.1879013, 0.6392157, 0, 1, 1,
0.794761, 0.4946146, -1.07022, 0.6431373, 0, 1, 1,
0.797422, -0.0601794, 1.31384, 0.6509804, 0, 1, 1,
0.8010167, -1.669723, 2.294513, 0.654902, 0, 1, 1,
0.8013934, -1.278394, 2.440763, 0.6627451, 0, 1, 1,
0.801604, 0.3916278, 2.22325, 0.6666667, 0, 1, 1,
0.8055921, -0.7726779, 3.737898, 0.6745098, 0, 1, 1,
0.8064952, -0.3161453, 2.362012, 0.6784314, 0, 1, 1,
0.806933, 1.670752, 1.111057, 0.6862745, 0, 1, 1,
0.8218859, -1.213689, 3.401206, 0.6901961, 0, 1, 1,
0.8281833, 2.262316, -1.758513, 0.6980392, 0, 1, 1,
0.8292114, -0.0125665, 1.174161, 0.7058824, 0, 1, 1,
0.8489917, 0.7816988, -0.1264589, 0.7098039, 0, 1, 1,
0.8511508, -0.1402403, 3.376606, 0.7176471, 0, 1, 1,
0.8513871, -0.7966205, 2.740175, 0.7215686, 0, 1, 1,
0.861331, 0.02513232, 1.800028, 0.7294118, 0, 1, 1,
0.8637956, 0.8377994, 0.9525629, 0.7333333, 0, 1, 1,
0.8657349, -0.2099467, 2.061014, 0.7411765, 0, 1, 1,
0.8725541, -0.553624, 1.27358, 0.7450981, 0, 1, 1,
0.8773953, -2.040805, 2.9427, 0.7529412, 0, 1, 1,
0.8792239, 0.2380542, 1.275534, 0.7568628, 0, 1, 1,
0.8884937, -0.8213381, 2.177863, 0.7647059, 0, 1, 1,
0.8898554, 0.5413751, -0.04014398, 0.7686275, 0, 1, 1,
0.8900951, 0.3406546, 2.166054, 0.7764706, 0, 1, 1,
0.8905665, 1.412863, -1.074131, 0.7803922, 0, 1, 1,
0.8978248, -1.042137, 1.472903, 0.7882353, 0, 1, 1,
0.9047449, -0.9603981, 4.331063, 0.7921569, 0, 1, 1,
0.9056669, 0.1836533, 0.1390396, 0.8, 0, 1, 1,
0.9076931, -0.6593836, 2.472138, 0.8078431, 0, 1, 1,
0.9080574, 0.8070481, -1.245356, 0.8117647, 0, 1, 1,
0.9091337, 2.101442, -0.7465946, 0.8196079, 0, 1, 1,
0.9105045, -1.0861, 0.6299546, 0.8235294, 0, 1, 1,
0.9139228, -2.044816, 2.73875, 0.8313726, 0, 1, 1,
0.9232144, 0.5281083, 2.888418, 0.8352941, 0, 1, 1,
0.9232304, 0.653243, 0.4369008, 0.8431373, 0, 1, 1,
0.9267858, 0.7970552, 0.1828056, 0.8470588, 0, 1, 1,
0.9361367, -0.8831457, 3.626227, 0.854902, 0, 1, 1,
0.9364098, 0.186891, 3.36095, 0.8588235, 0, 1, 1,
0.936547, -0.2203959, 1.085267, 0.8666667, 0, 1, 1,
0.9380174, -1.279835, 1.832296, 0.8705882, 0, 1, 1,
0.9401829, 0.05480979, 0.6393022, 0.8784314, 0, 1, 1,
0.9439878, 0.1761279, 0.6168563, 0.8823529, 0, 1, 1,
0.9456106, 0.7917472, 2.123822, 0.8901961, 0, 1, 1,
0.9460577, 1.110493, 2.367484, 0.8941177, 0, 1, 1,
0.950231, -0.4885395, 2.37354, 0.9019608, 0, 1, 1,
0.9517971, -0.7366623, 2.898314, 0.9098039, 0, 1, 1,
0.9529243, 0.2882719, 1.110524, 0.9137255, 0, 1, 1,
0.9569029, -0.9913409, 1.993854, 0.9215686, 0, 1, 1,
0.9904903, -0.468805, 1.961171, 0.9254902, 0, 1, 1,
0.9916362, -0.06656824, 1.189548, 0.9333333, 0, 1, 1,
0.9922372, -0.8847428, 2.153959, 0.9372549, 0, 1, 1,
0.9963049, -0.768554, 4.390606, 0.945098, 0, 1, 1,
0.9982035, 1.514341, 1.08409, 0.9490196, 0, 1, 1,
1.007245, -0.4792841, 1.790385, 0.9568627, 0, 1, 1,
1.009904, -0.1170639, 1.847554, 0.9607843, 0, 1, 1,
1.012052, 0.762292, -1.110265, 0.9686275, 0, 1, 1,
1.01355, 0.610191, 1.861849, 0.972549, 0, 1, 1,
1.020101, -0.3365116, 1.095641, 0.9803922, 0, 1, 1,
1.024293, -0.05929488, 0.1393362, 0.9843137, 0, 1, 1,
1.024688, 0.7974865, 1.492016, 0.9921569, 0, 1, 1,
1.031347, 0.2608715, 2.322169, 0.9960784, 0, 1, 1,
1.032758, -2.293476, 1.632667, 1, 0, 0.9960784, 1,
1.033446, 0.3350318, 0.8685752, 1, 0, 0.9882353, 1,
1.034077, 0.8083314, 0.5557054, 1, 0, 0.9843137, 1,
1.039749, 0.5631532, 1.710634, 1, 0, 0.9764706, 1,
1.042567, -0.6592761, 3.057712, 1, 0, 0.972549, 1,
1.045804, 0.300766, 3.193279, 1, 0, 0.9647059, 1,
1.046629, -0.9593421, 3.136105, 1, 0, 0.9607843, 1,
1.053916, -1.277942, 2.08437, 1, 0, 0.9529412, 1,
1.054592, 0.4477583, 1.699759, 1, 0, 0.9490196, 1,
1.057822, 2.21174, 2.003079, 1, 0, 0.9411765, 1,
1.066586, -0.9308661, 1.941649, 1, 0, 0.9372549, 1,
1.067342, 0.02759306, 1.563094, 1, 0, 0.9294118, 1,
1.06989, -1.197145, 4.464168, 1, 0, 0.9254902, 1,
1.073754, -0.6906887, 1.688812, 1, 0, 0.9176471, 1,
1.076016, -0.1306744, 3.355318, 1, 0, 0.9137255, 1,
1.080934, 0.8312523, -0.3436155, 1, 0, 0.9058824, 1,
1.084247, 0.0006102318, 1.785169, 1, 0, 0.9019608, 1,
1.08429, -0.3295151, 2.253381, 1, 0, 0.8941177, 1,
1.08646, -0.03694958, 2.748063, 1, 0, 0.8862745, 1,
1.086733, 0.4909528, 2.357647, 1, 0, 0.8823529, 1,
1.095767, 1.626515, 3.299846, 1, 0, 0.8745098, 1,
1.100376, 1.380168, 0.6962995, 1, 0, 0.8705882, 1,
1.101836, -0.7818497, 2.668024, 1, 0, 0.8627451, 1,
1.10304, -2.104193, 2.645942, 1, 0, 0.8588235, 1,
1.105402, 0.6690266, 1.398735, 1, 0, 0.8509804, 1,
1.112889, -0.2567046, 1.611653, 1, 0, 0.8470588, 1,
1.113778, 0.7113831, 0.9017482, 1, 0, 0.8392157, 1,
1.122112, 0.7719578, 0.96491, 1, 0, 0.8352941, 1,
1.12247, 0.4954729, 0.4456825, 1, 0, 0.827451, 1,
1.126122, 1.31236, 1.192933, 1, 0, 0.8235294, 1,
1.132743, 1.926039, 0.3375832, 1, 0, 0.8156863, 1,
1.133897, -0.4460551, 1.426196, 1, 0, 0.8117647, 1,
1.145148, -0.3624106, 4.9981, 1, 0, 0.8039216, 1,
1.148247, 1.167457, 1.43391, 1, 0, 0.7960784, 1,
1.152292, -0.7290243, 3.152169, 1, 0, 0.7921569, 1,
1.164661, 1.45796, 0.3946241, 1, 0, 0.7843137, 1,
1.168833, 0.2332715, 1.545735, 1, 0, 0.7803922, 1,
1.173868, -1.32867, 2.691797, 1, 0, 0.772549, 1,
1.178126, -0.2795428, 2.242152, 1, 0, 0.7686275, 1,
1.182857, -1.137518, 1.471555, 1, 0, 0.7607843, 1,
1.183298, 0.3719444, 1.542522, 1, 0, 0.7568628, 1,
1.184042, 1.615893, 0.3412589, 1, 0, 0.7490196, 1,
1.190066, 1.479286, 1.842602, 1, 0, 0.7450981, 1,
1.192186, 0.3272397, 1.382974, 1, 0, 0.7372549, 1,
1.194313, 0.7310766, 0.7028074, 1, 0, 0.7333333, 1,
1.195867, -0.5133894, 2.655786, 1, 0, 0.7254902, 1,
1.196561, -0.827463, 0.2389335, 1, 0, 0.7215686, 1,
1.198042, -0.9262396, 2.361617, 1, 0, 0.7137255, 1,
1.198164, -0.4782362, 3.802323, 1, 0, 0.7098039, 1,
1.201253, -0.6892716, 2.784031, 1, 0, 0.7019608, 1,
1.20655, -2.208225, 2.122885, 1, 0, 0.6941177, 1,
1.209594, 1.143991, -0.167958, 1, 0, 0.6901961, 1,
1.219892, -1.096298, 0.3818383, 1, 0, 0.682353, 1,
1.220975, 0.497044, 1.351188, 1, 0, 0.6784314, 1,
1.224392, -1.030176, 2.266739, 1, 0, 0.6705883, 1,
1.229086, -1.518, 2.14482, 1, 0, 0.6666667, 1,
1.2382, 0.09592021, 3.112223, 1, 0, 0.6588235, 1,
1.240341, 1.583948, -0.6209847, 1, 0, 0.654902, 1,
1.249657, 2.087523, -0.2144413, 1, 0, 0.6470588, 1,
1.254544, -0.7354761, 0.9927108, 1, 0, 0.6431373, 1,
1.267635, -0.7030828, 1.508111, 1, 0, 0.6352941, 1,
1.267762, 0.0449183, 2.520096, 1, 0, 0.6313726, 1,
1.275743, 1.199614, 1.325399, 1, 0, 0.6235294, 1,
1.297919, -0.345579, 2.075865, 1, 0, 0.6196079, 1,
1.298776, -1.573481, 2.254745, 1, 0, 0.6117647, 1,
1.298948, 1.109862, 1.483421, 1, 0, 0.6078432, 1,
1.308592, 0.8214408, 0.6130126, 1, 0, 0.6, 1,
1.311293, -0.4204966, 1.847334, 1, 0, 0.5921569, 1,
1.311881, 1.173942, 1.222901, 1, 0, 0.5882353, 1,
1.31496, 0.7577379, 1.25234, 1, 0, 0.5803922, 1,
1.319638, 0.1170883, 0.5777619, 1, 0, 0.5764706, 1,
1.322916, 0.7160227, 2.07155, 1, 0, 0.5686275, 1,
1.333815, -0.864998, 3.277923, 1, 0, 0.5647059, 1,
1.341264, 0.06255893, 2.421249, 1, 0, 0.5568628, 1,
1.347369, 1.179599, 1.523659, 1, 0, 0.5529412, 1,
1.351169, -1.309186, 3.280706, 1, 0, 0.5450981, 1,
1.366571, 0.0408304, 1.259801, 1, 0, 0.5411765, 1,
1.368533, -0.1212435, 0.1671309, 1, 0, 0.5333334, 1,
1.379736, -0.0483009, 0.2121274, 1, 0, 0.5294118, 1,
1.380049, -2.625411, 2.777385, 1, 0, 0.5215687, 1,
1.392357, 1.179674, 1.811676, 1, 0, 0.5176471, 1,
1.397578, 0.8016699, 2.238927, 1, 0, 0.509804, 1,
1.397834, 0.2947344, 0.7825804, 1, 0, 0.5058824, 1,
1.398928, -1.283662, 3.098771, 1, 0, 0.4980392, 1,
1.401718, 0.3935478, 2.433904, 1, 0, 0.4901961, 1,
1.403987, -1.323161, 2.121969, 1, 0, 0.4862745, 1,
1.407766, -0.7486227, 2.05668, 1, 0, 0.4784314, 1,
1.412098, 1.621848, -0.2161036, 1, 0, 0.4745098, 1,
1.422048, 1.390787, -0.3831546, 1, 0, 0.4666667, 1,
1.424033, -0.5697649, 3.065289, 1, 0, 0.4627451, 1,
1.425397, -0.2432086, 1.05768, 1, 0, 0.454902, 1,
1.428702, -0.1847465, 2.308605, 1, 0, 0.4509804, 1,
1.443493, -0.1458865, 1.685799, 1, 0, 0.4431373, 1,
1.451693, -1.127882, 3.518693, 1, 0, 0.4392157, 1,
1.452977, 1.481262, -0.07002828, 1, 0, 0.4313726, 1,
1.457258, -0.9500881, 2.369952, 1, 0, 0.427451, 1,
1.467331, -0.5138481, 1.474058, 1, 0, 0.4196078, 1,
1.467603, 1.003809, 1.384727, 1, 0, 0.4156863, 1,
1.481097, 1.686598, 1.6618, 1, 0, 0.4078431, 1,
1.484012, 1.524045, 1.57929, 1, 0, 0.4039216, 1,
1.489115, -1.509487, 2.462938, 1, 0, 0.3960784, 1,
1.492982, 1.857786, 1.037912, 1, 0, 0.3882353, 1,
1.494293, 0.1169087, 1.859123, 1, 0, 0.3843137, 1,
1.501023, -0.6984334, 2.778008, 1, 0, 0.3764706, 1,
1.51137, -0.4928387, 2.029475, 1, 0, 0.372549, 1,
1.517116, 0.5284013, 1.536296, 1, 0, 0.3647059, 1,
1.546256, -0.1580324, 1.306174, 1, 0, 0.3607843, 1,
1.549665, 0.08172945, 1.026678, 1, 0, 0.3529412, 1,
1.553963, -0.0722697, 1.529027, 1, 0, 0.3490196, 1,
1.566421, -0.3028765, 0.7391324, 1, 0, 0.3411765, 1,
1.568763, -0.07526661, 0.4588195, 1, 0, 0.3372549, 1,
1.599091, 0.6486121, 1.280501, 1, 0, 0.3294118, 1,
1.606341, 0.7039559, -0.1712256, 1, 0, 0.3254902, 1,
1.629805, 0.02792785, 2.496644, 1, 0, 0.3176471, 1,
1.634698, -0.3200414, 2.517069, 1, 0, 0.3137255, 1,
1.642911, 0.1400727, 1.066143, 1, 0, 0.3058824, 1,
1.653381, 0.8526068, -0.0393981, 1, 0, 0.2980392, 1,
1.653983, 0.5036571, 1.108416, 1, 0, 0.2941177, 1,
1.657625, 1.363413, 1.502605, 1, 0, 0.2862745, 1,
1.663264, -1.352915, 3.173805, 1, 0, 0.282353, 1,
1.691692, -1.717333, 2.586032, 1, 0, 0.2745098, 1,
1.707585, 0.008812414, 0.4488626, 1, 0, 0.2705882, 1,
1.722, 0.3403841, 1.300484, 1, 0, 0.2627451, 1,
1.7367, 0.3181227, 3.37691, 1, 0, 0.2588235, 1,
1.74714, -0.1552949, 0.2674443, 1, 0, 0.2509804, 1,
1.766466, -1.486667, 2.841329, 1, 0, 0.2470588, 1,
1.766628, 0.2386136, 1.251776, 1, 0, 0.2392157, 1,
1.7684, 0.1473928, 0.1228879, 1, 0, 0.2352941, 1,
1.791861, -0.1461588, 2.222419, 1, 0, 0.227451, 1,
1.806698, -1.352581, 2.746299, 1, 0, 0.2235294, 1,
1.809527, 0.6821744, 1.105378, 1, 0, 0.2156863, 1,
1.812732, -0.1446906, 0.5207782, 1, 0, 0.2117647, 1,
1.830255, 1.376031, 1.183221, 1, 0, 0.2039216, 1,
1.853718, -0.9944752, 4.249148, 1, 0, 0.1960784, 1,
1.854223, -2.482589, 2.376757, 1, 0, 0.1921569, 1,
1.857838, -1.290654, 2.480275, 1, 0, 0.1843137, 1,
1.861165, -1.128512, 2.230381, 1, 0, 0.1803922, 1,
1.878882, 1.164681, 0.4799067, 1, 0, 0.172549, 1,
1.901287, 0.6110093, 3.048677, 1, 0, 0.1686275, 1,
1.910043, -0.2857883, 0.8341874, 1, 0, 0.1607843, 1,
1.910697, -1.079257, 2.020968, 1, 0, 0.1568628, 1,
1.91725, -0.9437551, 1.399393, 1, 0, 0.1490196, 1,
1.921458, 0.307653, 2.387904, 1, 0, 0.145098, 1,
1.923563, -0.7588941, 0.9781431, 1, 0, 0.1372549, 1,
1.925887, -0.6974304, 2.05018, 1, 0, 0.1333333, 1,
1.95037, -0.08779535, 1.858574, 1, 0, 0.1254902, 1,
1.950752, -1.324599, 3.615916, 1, 0, 0.1215686, 1,
1.953822, 1.337479, 1.238513, 1, 0, 0.1137255, 1,
1.975125, -1.480318, 3.441159, 1, 0, 0.1098039, 1,
1.986729, -0.8978761, 2.684622, 1, 0, 0.1019608, 1,
2.019064, 0.4051184, 0.4914509, 1, 0, 0.09411765, 1,
2.027125, -0.8307322, 2.709785, 1, 0, 0.09019608, 1,
2.032472, -0.2112172, 1.428502, 1, 0, 0.08235294, 1,
2.049302, -0.9310928, 2.209598, 1, 0, 0.07843138, 1,
2.052112, -1.150787, 2.89657, 1, 0, 0.07058824, 1,
2.104791, 1.301768, 0.183481, 1, 0, 0.06666667, 1,
2.142071, 1.508856, 1.416626, 1, 0, 0.05882353, 1,
2.142302, 0.7165689, 0.7724855, 1, 0, 0.05490196, 1,
2.152917, -0.307877, 1.398542, 1, 0, 0.04705882, 1,
2.223267, -0.003216393, 2.279197, 1, 0, 0.04313726, 1,
2.236091, -0.8068226, 4.051004, 1, 0, 0.03529412, 1,
2.250358, -1.54094, 0.6968549, 1, 0, 0.03137255, 1,
2.270763, -1.567348, 2.322732, 1, 0, 0.02352941, 1,
2.272835, 0.1582943, -0.4720834, 1, 0, 0.01960784, 1,
2.47443, -1.525123, 0.522792, 1, 0, 0.01176471, 1,
2.958289, -2.142778, 3.330992, 1, 0, 0.007843138, 1
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
-0.10795, -4.094526, -7.120933, 0, -0.5, 0.5, 0.5,
-0.10795, -4.094526, -7.120933, 1, -0.5, 0.5, 0.5,
-0.10795, -4.094526, -7.120933, 1, 1.5, 0.5, 0.5,
-0.10795, -4.094526, -7.120933, 0, 1.5, 0.5, 0.5
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
-4.213644, 0.2480555, -7.120933, 0, -0.5, 0.5, 0.5,
-4.213644, 0.2480555, -7.120933, 1, -0.5, 0.5, 0.5,
-4.213644, 0.2480555, -7.120933, 1, 1.5, 0.5, 0.5,
-4.213644, 0.2480555, -7.120933, 0, 1.5, 0.5, 0.5
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
-4.213644, -4.094526, -0.1317039, 0, -0.5, 0.5, 0.5,
-4.213644, -4.094526, -0.1317039, 1, -0.5, 0.5, 0.5,
-4.213644, -4.094526, -0.1317039, 1, 1.5, 0.5, 0.5,
-4.213644, -4.094526, -0.1317039, 0, 1.5, 0.5, 0.5
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
-3, -3.092392, -5.508033,
2, -3.092392, -5.508033,
-3, -3.092392, -5.508033,
-3, -3.259414, -5.77685,
-2, -3.092392, -5.508033,
-2, -3.259414, -5.77685,
-1, -3.092392, -5.508033,
-1, -3.259414, -5.77685,
0, -3.092392, -5.508033,
0, -3.259414, -5.77685,
1, -3.092392, -5.508033,
1, -3.259414, -5.77685,
2, -3.092392, -5.508033,
2, -3.259414, -5.77685
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
"2"
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
-3, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
-3, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
-3, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
-3, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5,
-2, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
-2, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
-2, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
-2, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5,
-1, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
-1, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
-1, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
-1, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5,
0, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
0, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
0, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
0, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5,
1, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
1, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
1, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
1, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5,
2, -3.593459, -6.314483, 0, -0.5, 0.5, 0.5,
2, -3.593459, -6.314483, 1, -0.5, 0.5, 0.5,
2, -3.593459, -6.314483, 1, 1.5, 0.5, 0.5,
2, -3.593459, -6.314483, 0, 1.5, 0.5, 0.5
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
-3.266176, -2, -5.508033,
-3.266176, 3, -5.508033,
-3.266176, -2, -5.508033,
-3.424087, -2, -5.77685,
-3.266176, -1, -5.508033,
-3.424087, -1, -5.77685,
-3.266176, 0, -5.508033,
-3.424087, 0, -5.77685,
-3.266176, 1, -5.508033,
-3.424087, 1, -5.77685,
-3.266176, 2, -5.508033,
-3.424087, 2, -5.77685,
-3.266176, 3, -5.508033,
-3.424087, 3, -5.77685
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
-3.73991, -2, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, -2, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, -2, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, -2, -6.314483, 0, 1.5, 0.5, 0.5,
-3.73991, -1, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, -1, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, -1, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, -1, -6.314483, 0, 1.5, 0.5, 0.5,
-3.73991, 0, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, 0, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, 0, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, 0, -6.314483, 0, 1.5, 0.5, 0.5,
-3.73991, 1, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, 1, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, 1, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, 1, -6.314483, 0, 1.5, 0.5, 0.5,
-3.73991, 2, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, 2, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, 2, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, 2, -6.314483, 0, 1.5, 0.5, 0.5,
-3.73991, 3, -6.314483, 0, -0.5, 0.5, 0.5,
-3.73991, 3, -6.314483, 1, -0.5, 0.5, 0.5,
-3.73991, 3, -6.314483, 1, 1.5, 0.5, 0.5,
-3.73991, 3, -6.314483, 0, 1.5, 0.5, 0.5
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
-3.266176, -3.092392, -4,
-3.266176, -3.092392, 4,
-3.266176, -3.092392, -4,
-3.424087, -3.259414, -4,
-3.266176, -3.092392, -2,
-3.424087, -3.259414, -2,
-3.266176, -3.092392, 0,
-3.424087, -3.259414, 0,
-3.266176, -3.092392, 2,
-3.424087, -3.259414, 2,
-3.266176, -3.092392, 4,
-3.424087, -3.259414, 4
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
-3.73991, -3.593459, -4, 0, -0.5, 0.5, 0.5,
-3.73991, -3.593459, -4, 1, -0.5, 0.5, 0.5,
-3.73991, -3.593459, -4, 1, 1.5, 0.5, 0.5,
-3.73991, -3.593459, -4, 0, 1.5, 0.5, 0.5,
-3.73991, -3.593459, -2, 0, -0.5, 0.5, 0.5,
-3.73991, -3.593459, -2, 1, -0.5, 0.5, 0.5,
-3.73991, -3.593459, -2, 1, 1.5, 0.5, 0.5,
-3.73991, -3.593459, -2, 0, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 0, 0, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 0, 1, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 0, 1, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 0, 0, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 2, 0, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 2, 1, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 2, 1, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 2, 0, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 4, 0, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 4, 1, -0.5, 0.5, 0.5,
-3.73991, -3.593459, 4, 1, 1.5, 0.5, 0.5,
-3.73991, -3.593459, 4, 0, 1.5, 0.5, 0.5
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
-3.266176, -3.092392, -5.508033,
-3.266176, 3.588503, -5.508033,
-3.266176, -3.092392, 5.244626,
-3.266176, 3.588503, 5.244626,
-3.266176, -3.092392, -5.508033,
-3.266176, -3.092392, 5.244626,
-3.266176, 3.588503, -5.508033,
-3.266176, 3.588503, 5.244626,
-3.266176, -3.092392, -5.508033,
3.050276, -3.092392, -5.508033,
-3.266176, -3.092392, 5.244626,
3.050276, -3.092392, 5.244626,
-3.266176, 3.588503, -5.508033,
3.050276, 3.588503, -5.508033,
-3.266176, 3.588503, 5.244626,
3.050276, 3.588503, 5.244626,
3.050276, -3.092392, -5.508033,
3.050276, 3.588503, -5.508033,
3.050276, -3.092392, 5.244626,
3.050276, 3.588503, 5.244626,
3.050276, -3.092392, -5.508033,
3.050276, -3.092392, 5.244626,
3.050276, 3.588503, -5.508033,
3.050276, 3.588503, 5.244626
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
var radius = 7.554487;
var distance = 33.61077;
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
mvMatrix.translate( 0.10795, -0.2480555, 0.1317039 );
mvMatrix.scale( 1.293141, 1.2226, 0.7596316 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.61077);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
## Error in read.table("N-furfuryladenine.xyz"): no lines available in input
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
-3.174189, -0.2790243, -2.07082, 0, 0, 1, 1, 1,
-3.157542, 3.491208, -0.7126936, 1, 0, 0, 1, 1,
-2.889763, 0.359819, -3.626087, 1, 0, 0, 1, 1,
-2.849758, -0.086543, -2.091963, 1, 0, 0, 1, 1,
-2.563501, 1.017649, -2.252127, 1, 0, 0, 1, 1,
-2.462221, -0.8412251, -3.239888, 1, 0, 0, 1, 1,
-2.4508, 0.6092053, -2.0799, 0, 0, 0, 1, 1,
-2.448102, 0.2210831, 0.1409613, 0, 0, 0, 1, 1,
-2.42968, 0.07497033, -0.5831572, 0, 0, 0, 1, 1,
-2.428749, 0.3304309, -1.827601, 0, 0, 0, 1, 1,
-2.326143, -1.198983, -1.922601, 0, 0, 0, 1, 1,
-2.321934, 0.3630034, -1.680104, 0, 0, 0, 1, 1,
-2.291318, -0.6301039, -3.251681, 0, 0, 0, 1, 1,
-2.275962, 0.01010641, 0.02552532, 1, 1, 1, 1, 1,
-2.238415, -0.297759, -1.889388, 1, 1, 1, 1, 1,
-2.226482, -0.8757322, -2.390912, 1, 1, 1, 1, 1,
-2.207554, 0.5693503, -1.569823, 1, 1, 1, 1, 1,
-2.1688, -0.8928949, -1.920571, 1, 1, 1, 1, 1,
-2.168671, -1.781859, -1.972729, 1, 1, 1, 1, 1,
-2.16414, 0.08811273, -2.225095, 1, 1, 1, 1, 1,
-2.156824, -0.5184002, -0.2463694, 1, 1, 1, 1, 1,
-2.144981, -0.2248263, -1.589732, 1, 1, 1, 1, 1,
-2.137642, -1.264667, -3.073593, 1, 1, 1, 1, 1,
-2.067768, 0.3313493, -0.3251995, 1, 1, 1, 1, 1,
-2.062186, -1.233994, -3.058638, 1, 1, 1, 1, 1,
-2.06125, 1.891372, 0.3658333, 1, 1, 1, 1, 1,
-2.059426, -1.056357, -1.81627, 1, 1, 1, 1, 1,
-2.053956, 0.2409928, -1.304518, 1, 1, 1, 1, 1,
-1.957783, 1.213314, -1.244188, 0, 0, 1, 1, 1,
-1.942106, -0.2827911, -1.764593, 1, 0, 0, 1, 1,
-1.940098, -0.1666572, -2.796097, 1, 0, 0, 1, 1,
-1.916242, 0.1739201, -1.906515, 1, 0, 0, 1, 1,
-1.909035, 0.2002626, 0.3164544, 1, 0, 0, 1, 1,
-1.902583, -0.7015151, -2.54406, 1, 0, 0, 1, 1,
-1.881731, 1.527385, -0.5272802, 0, 0, 0, 1, 1,
-1.867063, 1.486014, -0.07864505, 0, 0, 0, 1, 1,
-1.827287, 1.161012, 0.001909936, 0, 0, 0, 1, 1,
-1.825086, 1.979419, -1.363967, 0, 0, 0, 1, 1,
-1.817771, 0.1508685, -1.584937, 0, 0, 0, 1, 1,
-1.793768, 1.185194, 0.254389, 0, 0, 0, 1, 1,
-1.787599, 0.362509, -2.720735, 0, 0, 0, 1, 1,
-1.778868, 0.740024, -1.790406, 1, 1, 1, 1, 1,
-1.772128, 1.260189, -0.4432252, 1, 1, 1, 1, 1,
-1.760604, 0.5221596, -2.165343, 1, 1, 1, 1, 1,
-1.743711, 0.6630796, -1.149029, 1, 1, 1, 1, 1,
-1.734999, -1.633558, -2.88668, 1, 1, 1, 1, 1,
-1.727605, -0.3295523, -0.9773646, 1, 1, 1, 1, 1,
-1.712815, 1.473223, -0.6532173, 1, 1, 1, 1, 1,
-1.708336, -0.7899494, -3.540456, 1, 1, 1, 1, 1,
-1.701997, 0.9448841, -0.19703, 1, 1, 1, 1, 1,
-1.673477, 0.1893155, -1.914499, 1, 1, 1, 1, 1,
-1.659179, -1.572328, -3.341865, 1, 1, 1, 1, 1,
-1.647061, 0.5551894, -0.3752722, 1, 1, 1, 1, 1,
-1.633129, 0.7591846, -1.809587, 1, 1, 1, 1, 1,
-1.625324, 1.067914, -2.496503, 1, 1, 1, 1, 1,
-1.600602, -1.709887, -1.538188, 1, 1, 1, 1, 1,
-1.598382, -0.0491579, -2.4214, 0, 0, 1, 1, 1,
-1.596512, 0.8462458, -2.230465, 1, 0, 0, 1, 1,
-1.595824, 0.8401598, -1.629644, 1, 0, 0, 1, 1,
-1.594858, -0.2188291, -2.493763, 1, 0, 0, 1, 1,
-1.588179, -0.5752685, -3.112592, 1, 0, 0, 1, 1,
-1.575649, 0.2901438, -1.40763, 1, 0, 0, 1, 1,
-1.569843, 0.2215271, -0.8923542, 0, 0, 0, 1, 1,
-1.560883, -0.6462357, -1.410451, 0, 0, 0, 1, 1,
-1.528736, 0.4006528, -2.980643, 0, 0, 0, 1, 1,
-1.527931, 0.9595292, -2.249858, 0, 0, 0, 1, 1,
-1.524015, -1.734748, -1.888053, 0, 0, 0, 1, 1,
-1.520719, -0.01288804, -2.020174, 0, 0, 0, 1, 1,
-1.506674, -0.7533796, -4.92319, 0, 0, 0, 1, 1,
-1.49326, -0.3575355, -2.834938, 1, 1, 1, 1, 1,
-1.481595, 0.004569734, -0.624904, 1, 1, 1, 1, 1,
-1.47808, -0.5017259, -0.9892702, 1, 1, 1, 1, 1,
-1.455482, -0.2547181, -0.4134787, 1, 1, 1, 1, 1,
-1.453831, -0.3038995, -0.9444398, 1, 1, 1, 1, 1,
-1.449787, 0.7455516, -1.230266, 1, 1, 1, 1, 1,
-1.423581, 1.265726, -1.331492, 1, 1, 1, 1, 1,
-1.418935, 0.4304981, -1.280867, 1, 1, 1, 1, 1,
-1.416783, -0.9331375, -0.4359844, 1, 1, 1, 1, 1,
-1.408894, -0.7799493, -1.635918, 1, 1, 1, 1, 1,
-1.407509, -0.2388301, -2.879164, 1, 1, 1, 1, 1,
-1.40552, -1.251816, -2.751082, 1, 1, 1, 1, 1,
-1.403642, -0.2478179, -2.54895, 1, 1, 1, 1, 1,
-1.402492, 0.008961909, -1.720258, 1, 1, 1, 1, 1,
-1.391672, 0.3824807, -0.7329217, 1, 1, 1, 1, 1,
-1.390278, -2.357369, -2.452486, 0, 0, 1, 1, 1,
-1.385031, -0.8427026, -2.86551, 1, 0, 0, 1, 1,
-1.378581, 0.8031844, -2.403894, 1, 0, 0, 1, 1,
-1.375815, 0.0337071, 0.2126593, 1, 0, 0, 1, 1,
-1.368406, -1.184108, -3.350393, 1, 0, 0, 1, 1,
-1.359588, -0.8128555, -3.191025, 1, 0, 0, 1, 1,
-1.354929, -0.9551735, -1.211754, 0, 0, 0, 1, 1,
-1.353046, 2.376836, 0.3693864, 0, 0, 0, 1, 1,
-1.350603, 1.683248, 1.648638, 0, 0, 0, 1, 1,
-1.347153, 0.901647, -2.483874, 0, 0, 0, 1, 1,
-1.346262, -2.007704, -1.564359, 0, 0, 0, 1, 1,
-1.336515, 1.37984, -1.594145, 0, 0, 0, 1, 1,
-1.32879, 0.2799001, 0.187398, 0, 0, 0, 1, 1,
-1.316363, 0.1881473, -4.109662, 1, 1, 1, 1, 1,
-1.31373, 0.6128052, -0.1579365, 1, 1, 1, 1, 1,
-1.311057, -0.5639662, -2.748789, 1, 1, 1, 1, 1,
-1.3043, 1.288053, -0.6407983, 1, 1, 1, 1, 1,
-1.304238, 0.2326287, -1.062081, 1, 1, 1, 1, 1,
-1.303886, 1.317666, -2.108032, 1, 1, 1, 1, 1,
-1.30239, 2.179388, 0.4838202, 1, 1, 1, 1, 1,
-1.301037, 0.1095569, -2.070287, 1, 1, 1, 1, 1,
-1.300356, -0.1231268, -1.37553, 1, 1, 1, 1, 1,
-1.293988, 1.797811, -1.084241, 1, 1, 1, 1, 1,
-1.274666, -1.699862, -2.534291, 1, 1, 1, 1, 1,
-1.27195, -1.187482, -1.657848, 1, 1, 1, 1, 1,
-1.268305, -1.637697, -2.495823, 1, 1, 1, 1, 1,
-1.26086, 0.4399474, -0.6071442, 1, 1, 1, 1, 1,
-1.256197, 0.03630229, -0.9322076, 1, 1, 1, 1, 1,
-1.254583, 0.7734825, -0.8929171, 0, 0, 1, 1, 1,
-1.238829, 0.5031939, -0.9757463, 1, 0, 0, 1, 1,
-1.234878, 1.673567, -0.33927, 1, 0, 0, 1, 1,
-1.230598, 0.9662979, 0.3221964, 1, 0, 0, 1, 1,
-1.222261, -0.8967499, -2.017393, 1, 0, 0, 1, 1,
-1.215822, 0.8159346, -1.212868, 1, 0, 0, 1, 1,
-1.208607, 0.304266, -0.1818046, 0, 0, 0, 1, 1,
-1.20826, 0.9533703, -2.442534, 0, 0, 0, 1, 1,
-1.19486, -1.041171, -0.5848721, 0, 0, 0, 1, 1,
-1.194818, -1.761864, -2.652586, 0, 0, 0, 1, 1,
-1.182653, 1.537364, -1.887963, 0, 0, 0, 1, 1,
-1.176489, 0.6268494, -0.2262699, 0, 0, 0, 1, 1,
-1.173842, 0.5239868, -1.049691, 0, 0, 0, 1, 1,
-1.169024, -1.159243, -1.283772, 1, 1, 1, 1, 1,
-1.165756, 2.623361, -0.4463341, 1, 1, 1, 1, 1,
-1.158081, 0.6197039, -2.414713, 1, 1, 1, 1, 1,
-1.145178, -0.07717597, -1.793769, 1, 1, 1, 1, 1,
-1.139074, -0.3275319, -1.278139, 1, 1, 1, 1, 1,
-1.134127, -1.396139, -1.900498, 1, 1, 1, 1, 1,
-1.126592, -0.3632946, -3.277272, 1, 1, 1, 1, 1,
-1.126338, -0.6757352, -3.209765, 1, 1, 1, 1, 1,
-1.120514, 2.241657, -0.7711989, 1, 1, 1, 1, 1,
-1.117553, -1.553714, -2.86532, 1, 1, 1, 1, 1,
-1.109904, -0.4361171, -0.7377779, 1, 1, 1, 1, 1,
-1.097613, -0.8018309, -2.354178, 1, 1, 1, 1, 1,
-1.090947, -0.9502464, -2.06333, 1, 1, 1, 1, 1,
-1.090402, 0.006079636, -3.333886, 1, 1, 1, 1, 1,
-1.088565, 0.7443742, -0.8039451, 1, 1, 1, 1, 1,
-1.077777, 1.010416, -0.7600344, 0, 0, 1, 1, 1,
-1.068703, -0.4739102, -3.511394, 1, 0, 0, 1, 1,
-1.068542, 1.338091, -0.7204976, 1, 0, 0, 1, 1,
-1.066794, -0.5285105, -0.4431441, 1, 0, 0, 1, 1,
-1.063661, 0.9483101, -1.031018, 1, 0, 0, 1, 1,
-1.063115, -0.09478163, -2.685262, 1, 0, 0, 1, 1,
-1.062313, 0.3801015, -0.6767107, 0, 0, 0, 1, 1,
-1.05483, 0.967214, 0.5625237, 0, 0, 0, 1, 1,
-1.052293, 0.7753105, 0.740661, 0, 0, 0, 1, 1,
-1.046705, -0.9092524, -4.826839, 0, 0, 0, 1, 1,
-1.046641, 1.966356, -2.353366, 0, 0, 0, 1, 1,
-1.046012, -0.5093239, -2.201951, 0, 0, 0, 1, 1,
-1.044944, 1.256978, -0.8641611, 0, 0, 0, 1, 1,
-1.043734, 0.05341034, -1.186591, 1, 1, 1, 1, 1,
-1.04011, -0.1442639, -1.6399, 1, 1, 1, 1, 1,
-1.034412, -0.1714152, -2.32751, 1, 1, 1, 1, 1,
-1.022581, -2.394398, -3.726298, 1, 1, 1, 1, 1,
-1.019272, 1.126189, -1.377236, 1, 1, 1, 1, 1,
-1.019178, -0.4764362, -1.892621, 1, 1, 1, 1, 1,
-1.015946, -0.8227498, -4.325847, 1, 1, 1, 1, 1,
-1.01281, 0.8070658, -2.808444, 1, 1, 1, 1, 1,
-1.009977, -2.995097, -2.226902, 1, 1, 1, 1, 1,
-1.009229, 0.1160049, -0.08763625, 1, 1, 1, 1, 1,
-1.006409, -0.0236867, -1.134189, 1, 1, 1, 1, 1,
-0.9942627, -2.333452, -3.40427, 1, 1, 1, 1, 1,
-0.990719, -0.2134181, -3.20515, 1, 1, 1, 1, 1,
-0.9874597, 0.4443047, -1.2613, 1, 1, 1, 1, 1,
-0.9826356, -1.895782, -2.165056, 1, 1, 1, 1, 1,
-0.9800132, -1.38797, -2.841034, 0, 0, 1, 1, 1,
-0.9674863, 1.116123, -0.8038464, 1, 0, 0, 1, 1,
-0.9657975, 1.643546, -0.7966327, 1, 0, 0, 1, 1,
-0.965039, 0.664166, -1.254678, 1, 0, 0, 1, 1,
-0.9647427, -1.538237, -2.169211, 1, 0, 0, 1, 1,
-0.959398, 0.2783553, -1.376387, 1, 0, 0, 1, 1,
-0.9589742, 1.833156, -0.3784028, 0, 0, 0, 1, 1,
-0.9573923, 0.05927698, -1.584672, 0, 0, 0, 1, 1,
-0.9479783, -0.01978534, -0.6291782, 0, 0, 0, 1, 1,
-0.9472247, 0.3154149, -1.132303, 0, 0, 0, 1, 1,
-0.9454949, 0.8202614, -1.933403, 0, 0, 0, 1, 1,
-0.9390921, 0.4510056, 0.9002803, 0, 0, 0, 1, 1,
-0.9371986, -0.6643626, -3.182267, 0, 0, 0, 1, 1,
-0.9310717, -0.6267875, -1.04454, 1, 1, 1, 1, 1,
-0.9294706, 0.93591, -1.047504, 1, 1, 1, 1, 1,
-0.9214361, 1.048795, -1.655052, 1, 1, 1, 1, 1,
-0.9169229, -0.4875316, -1.875305, 1, 1, 1, 1, 1,
-0.9137288, -0.312194, -1.552001, 1, 1, 1, 1, 1,
-0.9048626, -1.948069, -3.231344, 1, 1, 1, 1, 1,
-0.9038233, 0.181943, -1.39181, 1, 1, 1, 1, 1,
-0.901413, 1.040206, -0.3364413, 1, 1, 1, 1, 1,
-0.8977844, -1.474828, -3.204083, 1, 1, 1, 1, 1,
-0.8977731, -1.561757, 0.4010938, 1, 1, 1, 1, 1,
-0.8966112, 0.674862, 0.2039165, 1, 1, 1, 1, 1,
-0.8824852, 1.887797, -2.017971, 1, 1, 1, 1, 1,
-0.8812097, -0.3627689, -2.600488, 1, 1, 1, 1, 1,
-0.8683099, 0.1460983, -0.7010725, 1, 1, 1, 1, 1,
-0.8606473, -0.2921791, -1.468778, 1, 1, 1, 1, 1,
-0.8583277, -0.3463713, -3.126373, 0, 0, 1, 1, 1,
-0.8532415, -2.591254, -3.378377, 1, 0, 0, 1, 1,
-0.8443062, 0.1800182, -0.1189343, 1, 0, 0, 1, 1,
-0.8383734, 0.01474196, -1.731203, 1, 0, 0, 1, 1,
-0.8338165, 0.1590007, -2.619214, 1, 0, 0, 1, 1,
-0.822253, 0.1139019, -1.387638, 1, 0, 0, 1, 1,
-0.8178123, -1.375383, -2.332977, 0, 0, 0, 1, 1,
-0.8176275, -0.1834596, -1.961349, 0, 0, 0, 1, 1,
-0.8000151, 1.280825, -0.9338002, 0, 0, 0, 1, 1,
-0.7958007, -1.822597, -3.150328, 0, 0, 0, 1, 1,
-0.7957408, -1.121958, -3.570528, 0, 0, 0, 1, 1,
-0.7952265, -0.7059219, -2.419672, 0, 0, 0, 1, 1,
-0.7918677, -0.04864065, -3.236527, 0, 0, 0, 1, 1,
-0.7856498, -0.07740394, -1.798803, 1, 1, 1, 1, 1,
-0.7845262, 1.571191, -0.6418878, 1, 1, 1, 1, 1,
-0.7839048, -0.968026, -3.689748, 1, 1, 1, 1, 1,
-0.7806779, 0.1724009, -0.1688678, 1, 1, 1, 1, 1,
-0.7805618, -0.6382017, -0.485226, 1, 1, 1, 1, 1,
-0.7750571, -0.06795127, -2.348585, 1, 1, 1, 1, 1,
-0.769557, 1.097803, -1.675381, 1, 1, 1, 1, 1,
-0.7678157, -0.221591, -1.263821, 1, 1, 1, 1, 1,
-0.7582141, 0.2990985, 0.3607061, 1, 1, 1, 1, 1,
-0.757193, -0.8333205, -2.181525, 1, 1, 1, 1, 1,
-0.7536645, 1.169389, -0.4960473, 1, 1, 1, 1, 1,
-0.7513103, 0.6622607, -1.3659, 1, 1, 1, 1, 1,
-0.7510372, -1.322368, -2.238456, 1, 1, 1, 1, 1,
-0.7502463, 0.07226272, -1.354282, 1, 1, 1, 1, 1,
-0.7483396, -0.5955021, -2.133482, 1, 1, 1, 1, 1,
-0.7423567, -1.565984, -3.416282, 0, 0, 1, 1, 1,
-0.7401464, -0.4819461, -1.648666, 1, 0, 0, 1, 1,
-0.7399617, -0.07411304, -0.4588925, 1, 0, 0, 1, 1,
-0.7365273, 1.267994, -1.970254, 1, 0, 0, 1, 1,
-0.7351978, 0.9209072, -1.378488, 1, 0, 0, 1, 1,
-0.7327551, 1.472663, 0.9109356, 1, 0, 0, 1, 1,
-0.7251664, -0.02812574, -2.189499, 0, 0, 0, 1, 1,
-0.7230521, -1.186793, -1.868105, 0, 0, 0, 1, 1,
-0.7169235, -0.4122175, -2.105312, 0, 0, 0, 1, 1,
-0.7130615, -1.594524, -2.232808, 0, 0, 0, 1, 1,
-0.7103322, -0.4721893, -3.975238, 0, 0, 0, 1, 1,
-0.7035041, -0.9031209, -4.813848, 0, 0, 0, 1, 1,
-0.7020703, -0.8330368, -0.3687215, 0, 0, 0, 1, 1,
-0.6954952, -1.076824, -2.491867, 1, 1, 1, 1, 1,
-0.6917862, 0.2486159, -1.490146, 1, 1, 1, 1, 1,
-0.6825671, -0.9184272, -2.070061, 1, 1, 1, 1, 1,
-0.678528, -0.02330542, -3.179545, 1, 1, 1, 1, 1,
-0.6781215, -0.8991331, -3.365342, 1, 1, 1, 1, 1,
-0.6761845, -1.281549, -0.63436, 1, 1, 1, 1, 1,
-0.6755162, -0.003882709, 0.03924399, 1, 1, 1, 1, 1,
-0.6725318, -1.583733, -3.004567, 1, 1, 1, 1, 1,
-0.6720776, 0.3442368, -2.390168, 1, 1, 1, 1, 1,
-0.6696066, 0.07247137, -2.082145, 1, 1, 1, 1, 1,
-0.6600069, -0.94778, -4.508235, 1, 1, 1, 1, 1,
-0.6594734, -0.3569583, -2.468823, 1, 1, 1, 1, 1,
-0.652389, -0.7537796, -4.43561, 1, 1, 1, 1, 1,
-0.6496742, -0.9765036, -2.022906, 1, 1, 1, 1, 1,
-0.6408659, 1.948488, -0.1302651, 1, 1, 1, 1, 1,
-0.635596, -2.452849, -3.47027, 0, 0, 1, 1, 1,
-0.6350887, -0.7689857, -3.005028, 1, 0, 0, 1, 1,
-0.6309496, 0.3841884, 0.3008244, 1, 0, 0, 1, 1,
-0.6261097, -0.4443865, -0.5014358, 1, 0, 0, 1, 1,
-0.6160309, -1.117489, -1.778614, 1, 0, 0, 1, 1,
-0.6074986, 1.418426, -0.5753689, 1, 0, 0, 1, 1,
-0.6070737, 0.9994431, -1.615565, 0, 0, 0, 1, 1,
-0.6062019, -1.865645, -1.481754, 0, 0, 0, 1, 1,
-0.6054265, 0.4619799, 0.1871952, 0, 0, 0, 1, 1,
-0.6005707, -0.2536387, -1.873727, 0, 0, 0, 1, 1,
-0.5978038, -0.1913372, -3.609634, 0, 0, 0, 1, 1,
-0.5966389, 0.1230639, -0.9685349, 0, 0, 0, 1, 1,
-0.5948996, 1.241771, 0.3094298, 0, 0, 0, 1, 1,
-0.591324, 1.131871, -2.414719, 1, 1, 1, 1, 1,
-0.5815348, -0.12445, 0.1195153, 1, 1, 1, 1, 1,
-0.579057, -0.7180765, -1.057209, 1, 1, 1, 1, 1,
-0.5779264, 0.9769972, -0.6525148, 1, 1, 1, 1, 1,
-0.5770982, -0.8628008, -3.100011, 1, 1, 1, 1, 1,
-0.5765392, -0.3645881, -2.285727, 1, 1, 1, 1, 1,
-0.5755185, 0.3507324, 0.4270521, 1, 1, 1, 1, 1,
-0.5709259, 0.4100994, -2.053061, 1, 1, 1, 1, 1,
-0.5705997, -1.295678, -2.110801, 1, 1, 1, 1, 1,
-0.5673199, -0.3926999, -0.4182945, 1, 1, 1, 1, 1,
-0.5642252, 0.4201303, -1.876034, 1, 1, 1, 1, 1,
-0.5612994, 0.5133667, -0.9403125, 1, 1, 1, 1, 1,
-0.5607845, 0.836305, -0.6389908, 1, 1, 1, 1, 1,
-0.5600099, -2.238525, -1.893654, 1, 1, 1, 1, 1,
-0.5594399, -0.9680706, -3.110348, 1, 1, 1, 1, 1,
-0.5565965, 0.106519, -1.805337, 0, 0, 1, 1, 1,
-0.5554945, 3.066072, 0.1730594, 1, 0, 0, 1, 1,
-0.5506155, -0.4113432, -3.016052, 1, 0, 0, 1, 1,
-0.5479466, -0.7657052, -3.020349, 1, 0, 0, 1, 1,
-0.5468458, 0.3172808, -3.439607, 1, 0, 0, 1, 1,
-0.5439715, -0.5065403, -2.839804, 1, 0, 0, 1, 1,
-0.5413659, -0.232842, -1.927193, 0, 0, 0, 1, 1,
-0.5409365, 0.3677424, 0.3751704, 0, 0, 0, 1, 1,
-0.5397692, -1.164312, -2.417358, 0, 0, 0, 1, 1,
-0.5387278, 0.551953, -1.213611, 0, 0, 0, 1, 1,
-0.5330066, 0.6161243, -0.8418585, 0, 0, 0, 1, 1,
-0.5320818, -0.4283777, -2.352935, 0, 0, 0, 1, 1,
-0.5320771, 0.1170443, -1.457936, 0, 0, 0, 1, 1,
-0.5315547, 0.1288812, -1.520966, 1, 1, 1, 1, 1,
-0.5282453, 1.335258, 0.562063, 1, 1, 1, 1, 1,
-0.5187874, 1.312011, 0.1324421, 1, 1, 1, 1, 1,
-0.5187824, 0.6490574, -0.7171403, 1, 1, 1, 1, 1,
-0.509328, -1.131322, -2.740989, 1, 1, 1, 1, 1,
-0.5067241, -0.905912, -3.195797, 1, 1, 1, 1, 1,
-0.5053003, 2.245784, -1.377912, 1, 1, 1, 1, 1,
-0.5041789, 1.146431, 0.05019411, 1, 1, 1, 1, 1,
-0.4967606, 1.142447, -0.6731793, 1, 1, 1, 1, 1,
-0.4896734, 0.7308229, -1.344774, 1, 1, 1, 1, 1,
-0.4875326, -0.05185467, -1.367262, 1, 1, 1, 1, 1,
-0.4792662, 0.5925675, -1.069935, 1, 1, 1, 1, 1,
-0.474968, 2.866185, -1.272424, 1, 1, 1, 1, 1,
-0.4653371, 1.324389, -0.5399083, 1, 1, 1, 1, 1,
-0.4626019, 0.5144817, -0.2624009, 1, 1, 1, 1, 1,
-0.4579012, 0.0117873, -1.708552, 0, 0, 1, 1, 1,
-0.4572791, -1.32221, -5.351441, 1, 0, 0, 1, 1,
-0.4547547, -0.6622649, -2.250835, 1, 0, 0, 1, 1,
-0.4547494, 1.285007, -0.9177458, 1, 0, 0, 1, 1,
-0.4517085, -0.3330932, -1.985713, 1, 0, 0, 1, 1,
-0.4487807, 0.4695129, -3.379397, 1, 0, 0, 1, 1,
-0.4438537, 1.130845, -2.206346, 0, 0, 0, 1, 1,
-0.4351825, 0.2882011, -1.623444, 0, 0, 0, 1, 1,
-0.4341962, -0.3384472, -1.854606, 0, 0, 0, 1, 1,
-0.4321161, -0.4829235, -1.004836, 0, 0, 0, 1, 1,
-0.4299812, -0.6021429, -2.995525, 0, 0, 0, 1, 1,
-0.4294829, -1.14763, -3.404653, 0, 0, 0, 1, 1,
-0.4230031, 0.2292171, 0.5415356, 0, 0, 0, 1, 1,
-0.421796, 1.322972, 1.802047, 1, 1, 1, 1, 1,
-0.4211614, -0.6604504, -2.244861, 1, 1, 1, 1, 1,
-0.4136353, 0.5523716, 0.4592712, 1, 1, 1, 1, 1,
-0.4126399, -0.876665, -3.010792, 1, 1, 1, 1, 1,
-0.412612, 0.6439409, -2.353573, 1, 1, 1, 1, 1,
-0.4122903, 0.84004, 0.5571364, 1, 1, 1, 1, 1,
-0.4067554, 2.084326, -0.8443675, 1, 1, 1, 1, 1,
-0.4062841, -0.8843912, -1.460609, 1, 1, 1, 1, 1,
-0.4045312, -0.1553915, -1.549421, 1, 1, 1, 1, 1,
-0.3989958, -1.117081, -3.691847, 1, 1, 1, 1, 1,
-0.3984297, -0.1213095, -1.702304, 1, 1, 1, 1, 1,
-0.3936824, 0.9400927, -1.64995, 1, 1, 1, 1, 1,
-0.3918516, -0.2750843, -3.981271, 1, 1, 1, 1, 1,
-0.3901039, 0.2487177, -0.9603469, 1, 1, 1, 1, 1,
-0.3871778, -0.02618186, -0.0358828, 1, 1, 1, 1, 1,
-0.3809115, -0.6870756, -2.072828, 0, 0, 1, 1, 1,
-0.3734107, 0.1249035, -1.355815, 1, 0, 0, 1, 1,
-0.369975, 1.705639, 0.0724696, 1, 0, 0, 1, 1,
-0.3622319, -1.822041, -3.271745, 1, 0, 0, 1, 1,
-0.3593947, 0.2118461, -1.872357, 1, 0, 0, 1, 1,
-0.3587669, -0.6667057, -3.572219, 1, 0, 0, 1, 1,
-0.3544591, -0.3887099, -2.543833, 0, 0, 0, 1, 1,
-0.3514785, 0.7962744, -0.5446648, 0, 0, 0, 1, 1,
-0.3508143, 0.7837261, 0.08517583, 0, 0, 0, 1, 1,
-0.3448674, -0.2870171, -1.395831, 0, 0, 0, 1, 1,
-0.3392136, -1.259773, -2.016179, 0, 0, 0, 1, 1,
-0.3369633, 0.3678018, -2.193947, 0, 0, 0, 1, 1,
-0.336312, -0.4591181, -3.428927, 0, 0, 0, 1, 1,
-0.3258197, 0.07257396, -1.152945, 1, 1, 1, 1, 1,
-0.3241547, 0.5902041, 0.6816623, 1, 1, 1, 1, 1,
-0.3230944, -1.350756, -2.508708, 1, 1, 1, 1, 1,
-0.3212533, 0.1885442, -1.323972, 1, 1, 1, 1, 1,
-0.3203243, 0.3376943, 0.8844128, 1, 1, 1, 1, 1,
-0.3194153, -0.264542, -0.9427986, 1, 1, 1, 1, 1,
-0.317992, 1.132194, -2.434732, 1, 1, 1, 1, 1,
-0.3179865, 0.6113714, -0.8657688, 1, 1, 1, 1, 1,
-0.3179689, -0.7179794, -1.409815, 1, 1, 1, 1, 1,
-0.3166643, -0.2083969, -2.77558, 1, 1, 1, 1, 1,
-0.3165183, -0.2268949, -0.3936401, 1, 1, 1, 1, 1,
-0.314086, 1.365204, -0.6739548, 1, 1, 1, 1, 1,
-0.3109942, 0.4163494, -0.395889, 1, 1, 1, 1, 1,
-0.3101203, 0.2737288, -1.174939, 1, 1, 1, 1, 1,
-0.3054568, -0.5870857, -1.021482, 1, 1, 1, 1, 1,
-0.3047386, 0.2439055, 0.5039088, 0, 0, 1, 1, 1,
-0.3037839, 2.739515, 0.05489677, 1, 0, 0, 1, 1,
-0.3033485, -1.092675, -4.63696, 1, 0, 0, 1, 1,
-0.2992697, -1.234522, -4.433, 1, 0, 0, 1, 1,
-0.2988176, 0.610755, -0.1731528, 1, 0, 0, 1, 1,
-0.2981947, -1.418204, -1.971392, 1, 0, 0, 1, 1,
-0.2981912, -0.3027208, -1.746302, 0, 0, 0, 1, 1,
-0.2972887, 0.8416973, -1.728445, 0, 0, 0, 1, 1,
-0.2969405, 0.3635678, -0.7876112, 0, 0, 0, 1, 1,
-0.2966281, -0.8064887, -3.299962, 0, 0, 0, 1, 1,
-0.2950472, -0.2519995, -2.265039, 0, 0, 0, 1, 1,
-0.2916148, -0.3465079, -1.093385, 0, 0, 0, 1, 1,
-0.290513, -2.214867, -2.966653, 0, 0, 0, 1, 1,
-0.2883586, -1.33832, -3.425264, 1, 1, 1, 1, 1,
-0.2874045, -1.329012, -1.528682, 1, 1, 1, 1, 1,
-0.2869817, -0.3251277, -4.4656, 1, 1, 1, 1, 1,
-0.2864887, -0.9754477, -2.751569, 1, 1, 1, 1, 1,
-0.2852859, -0.360195, -2.439083, 1, 1, 1, 1, 1,
-0.2838948, -0.5015149, -2.489106, 1, 1, 1, 1, 1,
-0.2825414, -0.5800844, -1.582635, 1, 1, 1, 1, 1,
-0.2771063, 0.774165, 0.1504393, 1, 1, 1, 1, 1,
-0.2768627, 1.613369, -0.3571018, 1, 1, 1, 1, 1,
-0.276279, 0.4213914, -0.935295, 1, 1, 1, 1, 1,
-0.2756914, 2.707626, 0.2294697, 1, 1, 1, 1, 1,
-0.2736136, 1.063347, 0.08783395, 1, 1, 1, 1, 1,
-0.2729177, 0.9538373, 0.2947648, 1, 1, 1, 1, 1,
-0.2727306, 0.9716522, 0.7937005, 1, 1, 1, 1, 1,
-0.2717624, -0.03332107, -2.468788, 1, 1, 1, 1, 1,
-0.2708693, -0.4341708, -2.361295, 0, 0, 1, 1, 1,
-0.2670658, 0.28591, -0.8392056, 1, 0, 0, 1, 1,
-0.2667323, 0.9288539, 0.02823986, 1, 0, 0, 1, 1,
-0.2616453, -0.2732528, -3.169013, 1, 0, 0, 1, 1,
-0.2575777, -1.153524, -2.503803, 1, 0, 0, 1, 1,
-0.2569956, 0.7834029, -0.1159726, 1, 0, 0, 1, 1,
-0.2530231, -0.4855326, -0.9107162, 0, 0, 0, 1, 1,
-0.2506341, 1.948025, 0.3295849, 0, 0, 0, 1, 1,
-0.2429141, -0.984956, -2.115402, 0, 0, 0, 1, 1,
-0.2374669, 0.5208695, -1.494375, 0, 0, 0, 1, 1,
-0.234683, -1.480677, -3.933218, 0, 0, 0, 1, 1,
-0.2325798, -0.4261824, -3.268708, 0, 0, 0, 1, 1,
-0.2302228, 0.8146647, -0.1195249, 0, 0, 0, 1, 1,
-0.2292902, 0.06597302, -1.010664, 1, 1, 1, 1, 1,
-0.2288847, 0.4057934, -1.634111, 1, 1, 1, 1, 1,
-0.2249897, -0.9387227, -2.015753, 1, 1, 1, 1, 1,
-0.2243044, -0.3789439, -1.55904, 1, 1, 1, 1, 1,
-0.2198016, 0.1243934, -2.417919, 1, 1, 1, 1, 1,
-0.2181067, 0.160326, -1.216509, 1, 1, 1, 1, 1,
-0.2149827, -0.7561076, -1.224236, 1, 1, 1, 1, 1,
-0.2089943, 1.776497, -1.060012, 1, 1, 1, 1, 1,
-0.2089298, 0.02756969, -0.8420517, 1, 1, 1, 1, 1,
-0.2080139, 0.3181502, -0.5384642, 1, 1, 1, 1, 1,
-0.2023257, -0.4775799, -3.428273, 1, 1, 1, 1, 1,
-0.2017589, -1.028438, -1.849189, 1, 1, 1, 1, 1,
-0.2014923, -0.2690133, -2.241414, 1, 1, 1, 1, 1,
-0.1987101, 0.9356933, 0.4418045, 1, 1, 1, 1, 1,
-0.1940532, 0.9318427, 1.604049, 1, 1, 1, 1, 1,
-0.1919783, -0.342889, -3.103809, 0, 0, 1, 1, 1,
-0.1904092, 1.585942, -1.441627, 1, 0, 0, 1, 1,
-0.1848196, 0.4916721, 1.243566, 1, 0, 0, 1, 1,
-0.1834345, 0.8422624, 0.3503261, 1, 0, 0, 1, 1,
-0.1820893, -0.2192302, -3.181749, 1, 0, 0, 1, 1,
-0.1805544, -1.317061, -3.723376, 1, 0, 0, 1, 1,
-0.1792627, -2.132881, -0.4528649, 0, 0, 0, 1, 1,
-0.1769959, -0.2084087, -1.050224, 0, 0, 0, 1, 1,
-0.1730869, -1.131685, -0.7747979, 0, 0, 0, 1, 1,
-0.1709485, -0.4850775, -3.592571, 0, 0, 0, 1, 1,
-0.1682591, 0.3247449, -2.031673, 0, 0, 0, 1, 1,
-0.160748, -1.312017, -3.421828, 0, 0, 0, 1, 1,
-0.1590154, 0.08622959, -1.903136, 0, 0, 0, 1, 1,
-0.1555574, -0.2781014, -2.244316, 1, 1, 1, 1, 1,
-0.1507469, -0.2313158, -2.136433, 1, 1, 1, 1, 1,
-0.1488875, -0.3295125, 0.2834489, 1, 1, 1, 1, 1,
-0.1400465, 2.325673, -1.592582, 1, 1, 1, 1, 1,
-0.1358757, -1.334391, -2.878475, 1, 1, 1, 1, 1,
-0.1354557, -1.439446, -3.600543, 1, 1, 1, 1, 1,
-0.1329944, 1.150922, 1.905025, 1, 1, 1, 1, 1,
-0.1324622, 0.223619, -1.05501, 1, 1, 1, 1, 1,
-0.1272822, 1.592473, 0.1996194, 1, 1, 1, 1, 1,
-0.1268966, -0.5536393, -4.254705, 1, 1, 1, 1, 1,
-0.126707, -0.4490192, -4.171038, 1, 1, 1, 1, 1,
-0.1259601, -0.1391568, -1.049494, 1, 1, 1, 1, 1,
-0.1207858, -1.407894, -2.448881, 1, 1, 1, 1, 1,
-0.1186825, -0.889826, -3.501765, 1, 1, 1, 1, 1,
-0.1150996, -0.5379958, -3.34493, 1, 1, 1, 1, 1,
-0.1087394, -0.3328215, -1.276957, 0, 0, 1, 1, 1,
-0.1082788, 0.7054254, -0.02172748, 1, 0, 0, 1, 1,
-0.1052096, -0.03959209, -2.720134, 1, 0, 0, 1, 1,
-0.1031186, 0.9519989, -1.188959, 1, 0, 0, 1, 1,
-0.1015454, 0.1765155, 0.0001699266, 1, 0, 0, 1, 1,
-0.09699965, -1.785498, -2.920289, 1, 0, 0, 1, 1,
-0.09620266, 0.2751463, -0.1560405, 0, 0, 0, 1, 1,
-0.09491565, 0.6836715, -1.30582, 0, 0, 0, 1, 1,
-0.09404571, 1.056081, 0.5005317, 0, 0, 0, 1, 1,
-0.08871448, 1.88104, -2.060809, 0, 0, 0, 1, 1,
-0.08757763, -1.412372, -2.11449, 0, 0, 0, 1, 1,
-0.08683185, -0.9151681, -3.08011, 0, 0, 0, 1, 1,
-0.08412082, -0.1006471, -3.606827, 0, 0, 0, 1, 1,
-0.0803972, 0.353074, -1.3508, 1, 1, 1, 1, 1,
-0.07639869, 0.1881393, -0.3897886, 1, 1, 1, 1, 1,
-0.07620569, 0.8732005, 0.8646317, 1, 1, 1, 1, 1,
-0.07556309, 0.2126178, -2.252183, 1, 1, 1, 1, 1,
-0.07019179, -0.3274568, -3.10419, 1, 1, 1, 1, 1,
-0.06888268, 1.891614, 1.137259, 1, 1, 1, 1, 1,
-0.06695679, -0.01367076, -2.23899, 1, 1, 1, 1, 1,
-0.0663112, 0.2121653, -0.4545562, 1, 1, 1, 1, 1,
-0.06627063, 0.4690028, 0.2609215, 1, 1, 1, 1, 1,
-0.06037598, -0.2429013, -4.159462, 1, 1, 1, 1, 1,
-0.05875209, -0.475062, -4.496935, 1, 1, 1, 1, 1,
-0.05776215, 1.184293, -1.502686, 1, 1, 1, 1, 1,
-0.04759465, 0.2031028, 0.636227, 1, 1, 1, 1, 1,
-0.03747031, -1.664636, -1.580725, 1, 1, 1, 1, 1,
-0.03718676, -0.3887343, -3.460222, 1, 1, 1, 1, 1,
-0.03338938, 0.5431646, -0.8519925, 0, 0, 1, 1, 1,
-0.02713574, 0.9076419, -0.6063002, 1, 0, 0, 1, 1,
-0.02611746, 0.5667874, -0.4565834, 1, 0, 0, 1, 1,
-0.02106913, 0.4525423, 0.04139768, 1, 0, 0, 1, 1,
-0.01905383, -0.208303, -3.701794, 1, 0, 0, 1, 1,
-0.01876596, -0.4184343, -3.19087, 1, 0, 0, 1, 1,
-0.01678666, 0.4517375, -0.4309831, 0, 0, 0, 1, 1,
-0.01433442, 0.8617033, 0.4533983, 0, 0, 0, 1, 1,
-0.01298327, -0.09821565, -1.673907, 0, 0, 0, 1, 1,
-0.009731093, 0.5333326, -0.8671791, 0, 0, 0, 1, 1,
-0.007454799, -1.217891, -1.382796, 0, 0, 0, 1, 1,
-0.002032821, 0.9908566, -0.2761354, 0, 0, 0, 1, 1,
0.004315986, -0.04231573, 3.16465, 0, 0, 0, 1, 1,
0.007015941, 0.04451407, -1.072128, 1, 1, 1, 1, 1,
0.008870799, 1.310845, -0.4457079, 1, 1, 1, 1, 1,
0.01242804, -0.70297, 4.08128, 1, 1, 1, 1, 1,
0.01635602, -1.7695, 3.750263, 1, 1, 1, 1, 1,
0.0239404, 1.050765, 1.438249, 1, 1, 1, 1, 1,
0.02818082, -0.5265812, 3.774384, 1, 1, 1, 1, 1,
0.03126897, 0.2741488, -0.5390651, 1, 1, 1, 1, 1,
0.03479071, 1.628061, 0.7746642, 1, 1, 1, 1, 1,
0.03568494, 0.4733474, -1.238456, 1, 1, 1, 1, 1,
0.03667299, -0.004323376, 1.775497, 1, 1, 1, 1, 1,
0.03683557, 0.8043963, 1.006802, 1, 1, 1, 1, 1,
0.03887095, -0.8236502, 3.618372, 1, 1, 1, 1, 1,
0.03997929, -0.08725677, 2.828412, 1, 1, 1, 1, 1,
0.04199797, -0.02183161, 2.062673, 1, 1, 1, 1, 1,
0.04341964, 0.2785411, -0.1297144, 1, 1, 1, 1, 1,
0.04372589, -1.437663, 2.603351, 0, 0, 1, 1, 1,
0.04659382, 0.06340556, -0.6813823, 1, 0, 0, 1, 1,
0.04726845, 0.1349232, -1.164493, 1, 0, 0, 1, 1,
0.04898725, -0.398238, 3.218248, 1, 0, 0, 1, 1,
0.04940819, -0.222132, 4.247973, 1, 0, 0, 1, 1,
0.05026276, -0.01552826, 1.228031, 1, 0, 0, 1, 1,
0.05060776, -0.8150223, 3.216339, 0, 0, 0, 1, 1,
0.05499699, -2.101277, 5.088034, 0, 0, 0, 1, 1,
0.05593254, 0.7009737, -1.181405, 0, 0, 0, 1, 1,
0.05601803, 0.1824525, -0.01463217, 0, 0, 0, 1, 1,
0.05791112, 2.267933, 0.350828, 0, 0, 0, 1, 1,
0.05936254, 0.9724629, -0.5521804, 0, 0, 0, 1, 1,
0.06072619, 1.707583, -1.02023, 0, 0, 0, 1, 1,
0.06228535, 1.840462, 0.7436996, 1, 1, 1, 1, 1,
0.06269313, -0.1292309, 2.601581, 1, 1, 1, 1, 1,
0.062883, -1.062887, 2.231043, 1, 1, 1, 1, 1,
0.06649824, -1.489649, 3.12363, 1, 1, 1, 1, 1,
0.06988297, 0.08416927, -0.4862496, 1, 1, 1, 1, 1,
0.07317434, -0.4092986, 1.862516, 1, 1, 1, 1, 1,
0.07896771, -2.051603, 2.217532, 1, 1, 1, 1, 1,
0.07937543, -1.829207, 2.927043, 1, 1, 1, 1, 1,
0.08012854, 1.508358, 0.9253581, 1, 1, 1, 1, 1,
0.08306263, -0.5240786, 2.621759, 1, 1, 1, 1, 1,
0.08481328, -0.3674538, 3.305005, 1, 1, 1, 1, 1,
0.08761647, -1.008651, 4.343499, 1, 1, 1, 1, 1,
0.08843409, -0.04724067, 1.942843, 1, 1, 1, 1, 1,
0.09146351, -0.5934243, 3.771429, 1, 1, 1, 1, 1,
0.09159018, 1.379775, 1.134221, 1, 1, 1, 1, 1,
0.09384251, 0.001124892, 0.5521092, 0, 0, 1, 1, 1,
0.09566911, 0.3537334, 2.448936, 1, 0, 0, 1, 1,
0.09764217, -0.2333586, 2.353451, 1, 0, 0, 1, 1,
0.09903595, 0.03414803, 0.04944272, 1, 0, 0, 1, 1,
0.1025704, 0.5860429, -0.1497565, 1, 0, 0, 1, 1,
0.1026702, 0.496374, 0.6915034, 1, 0, 0, 1, 1,
0.1033496, -0.7758551, 1.852296, 0, 0, 0, 1, 1,
0.1038939, 0.7860836, 0.8713825, 0, 0, 0, 1, 1,
0.1119186, -1.36094, 2.323769, 0, 0, 0, 1, 1,
0.1167159, -0.05142257, 0.2315425, 0, 0, 0, 1, 1,
0.1167535, 0.9284322, -0.02454087, 0, 0, 0, 1, 1,
0.1231207, 1.450554, 1.206285, 0, 0, 0, 1, 1,
0.1264037, 0.7170435, -1.542462, 0, 0, 0, 1, 1,
0.1306461, 0.2311626, -0.2930815, 1, 1, 1, 1, 1,
0.1316609, 0.2032173, -0.4804295, 1, 1, 1, 1, 1,
0.1324031, 0.6284692, 0.7506292, 1, 1, 1, 1, 1,
0.134765, 0.6297967, 1.018506, 1, 1, 1, 1, 1,
0.1368797, 0.7770432, 0.9608334, 1, 1, 1, 1, 1,
0.137411, -0.1475503, 1.438343, 1, 1, 1, 1, 1,
0.1375983, -0.4553511, 2.892175, 1, 1, 1, 1, 1,
0.1378006, 1.333327, 0.163029, 1, 1, 1, 1, 1,
0.1390972, -0.1583378, 2.73121, 1, 1, 1, 1, 1,
0.1405073, -0.1219141, 1.38258, 1, 1, 1, 1, 1,
0.1407423, 0.414071, 0.3362344, 1, 1, 1, 1, 1,
0.1421798, 0.3683437, -0.9117016, 1, 1, 1, 1, 1,
0.1447581, -0.4102123, 3.567801, 1, 1, 1, 1, 1,
0.147189, 1.345261, 0.8046044, 1, 1, 1, 1, 1,
0.1490351, 0.6333625, -0.07367861, 1, 1, 1, 1, 1,
0.1538025, 1.44857, 2.079539, 0, 0, 1, 1, 1,
0.1561662, 0.3710407, 0.1624223, 1, 0, 0, 1, 1,
0.1575122, 0.03690299, 3.063138, 1, 0, 0, 1, 1,
0.1630267, 1.151277, -0.9509814, 1, 0, 0, 1, 1,
0.1632983, 0.6452457, -0.3526733, 1, 0, 0, 1, 1,
0.1734833, 1.053011, -1.766421, 1, 0, 0, 1, 1,
0.174199, 0.2703201, 0.4544121, 0, 0, 0, 1, 1,
0.1770546, -0.197935, 1.629541, 0, 0, 0, 1, 1,
0.1789516, -1.582911, 3.571903, 0, 0, 0, 1, 1,
0.1810426, 0.93239, 1.455794, 0, 0, 0, 1, 1,
0.1812931, 0.6398234, 1.060869, 0, 0, 0, 1, 1,
0.1827093, -0.591825, 2.940008, 0, 0, 0, 1, 1,
0.1841797, 0.3542642, 0.8463281, 0, 0, 0, 1, 1,
0.1863975, 0.9986848, 0.3150952, 1, 1, 1, 1, 1,
0.1864613, 0.9949136, -0.9459519, 1, 1, 1, 1, 1,
0.1867617, 0.07636916, 4.404132, 1, 1, 1, 1, 1,
0.1889944, 2.354207, -0.6224579, 1, 1, 1, 1, 1,
0.1919451, 0.7313581, 0.4486271, 1, 1, 1, 1, 1,
0.1952473, 0.7303672, -0.08917469, 1, 1, 1, 1, 1,
0.1958075, 0.03081514, 0.9348999, 1, 1, 1, 1, 1,
0.2017437, 0.6719315, 0.02204343, 1, 1, 1, 1, 1,
0.207592, -1.124101, 2.547113, 1, 1, 1, 1, 1,
0.2086887, 0.481358, -1.50976, 1, 1, 1, 1, 1,
0.2107153, -0.7937176, 3.88333, 1, 1, 1, 1, 1,
0.214595, -0.6368809, 2.194618, 1, 1, 1, 1, 1,
0.2184776, 1.582266, -0.3675759, 1, 1, 1, 1, 1,
0.2188047, 0.1992541, 0.7528303, 1, 1, 1, 1, 1,
0.2234011, -1.112685, 2.124748, 1, 1, 1, 1, 1,
0.224805, 0.09037021, 2.048897, 0, 0, 1, 1, 1,
0.2316717, -0.9884967, 2.6151, 1, 0, 0, 1, 1,
0.2370871, 1.159893, -1.764395, 1, 0, 0, 1, 1,
0.2371745, -0.7300803, 1.799694, 1, 0, 0, 1, 1,
0.2390603, 0.02179837, 1.877295, 1, 0, 0, 1, 1,
0.2396607, -0.1252434, 2.558281, 1, 0, 0, 1, 1,
0.2405008, -0.5841241, 4.28825, 0, 0, 0, 1, 1,
0.2461154, -0.1847492, 1.381292, 0, 0, 0, 1, 1,
0.2468291, -0.4135863, 1.904333, 0, 0, 0, 1, 1,
0.2545635, 0.8756253, 1.298094, 0, 0, 0, 1, 1,
0.2561071, 2.29555, -0.8383641, 0, 0, 0, 1, 1,
0.2571801, -1.409771, 1.602278, 0, 0, 0, 1, 1,
0.2597038, 1.384237, -0.438854, 0, 0, 0, 1, 1,
0.2620236, -0.1115123, 0.8768687, 1, 1, 1, 1, 1,
0.2625822, 1.657821, 1.519115, 1, 1, 1, 1, 1,
0.2681544, -1.346278, 3.956556, 1, 1, 1, 1, 1,
0.2710133, -2.400302, 2.705592, 1, 1, 1, 1, 1,
0.2774447, -1.261539, 2.77554, 1, 1, 1, 1, 1,
0.2774662, -1.086975, 2.62806, 1, 1, 1, 1, 1,
0.2795035, 0.1654994, -0.8162282, 1, 1, 1, 1, 1,
0.2845662, 0.6804602, -1.571486, 1, 1, 1, 1, 1,
0.290525, 0.3431957, 0.0609841, 1, 1, 1, 1, 1,
0.2923337, -1.115007, 3.152863, 1, 1, 1, 1, 1,
0.2950659, -1.061082, 3.282448, 1, 1, 1, 1, 1,
0.2951636, -1.475927, 1.743323, 1, 1, 1, 1, 1,
0.3083754, 0.2452427, 1.738447, 1, 1, 1, 1, 1,
0.3105332, -1.042521, 2.502931, 1, 1, 1, 1, 1,
0.3125067, -0.8414778, 2.624299, 1, 1, 1, 1, 1,
0.3126637, -0.132438, 1.002112, 0, 0, 1, 1, 1,
0.3130735, 0.0694834, 0.3499356, 1, 0, 0, 1, 1,
0.319282, 0.5922642, 0.4932835, 1, 0, 0, 1, 1,
0.3203849, -0.7171645, 3.077706, 1, 0, 0, 1, 1,
0.3266792, -0.1772399, 1.925862, 1, 0, 0, 1, 1,
0.3269178, 0.2756815, 1.258432, 1, 0, 0, 1, 1,
0.3271776, -0.2149, 0.3013721, 0, 0, 0, 1, 1,
0.3298042, -0.00973087, -0.07179187, 0, 0, 0, 1, 1,
0.3334796, 0.8963228, 0.2944848, 0, 0, 0, 1, 1,
0.3382275, 1.621232, -0.03782623, 0, 0, 0, 1, 1,
0.3392687, 2.127977, -1.040151, 0, 0, 0, 1, 1,
0.3408282, -0.4981367, 3.304246, 0, 0, 0, 1, 1,
0.3413639, 0.434416, 0.2685344, 0, 0, 0, 1, 1,
0.3460644, -0.844722, 4.525495, 1, 1, 1, 1, 1,
0.3465379, -0.5842677, 3.174332, 1, 1, 1, 1, 1,
0.3476896, -0.9413055, 2.558042, 1, 1, 1, 1, 1,
0.3493279, 2.104382, 0.1504832, 1, 1, 1, 1, 1,
0.3515689, 0.642056, -0.01540362, 1, 1, 1, 1, 1,
0.3535009, 0.04200636, 0.1419462, 1, 1, 1, 1, 1,
0.3542486, 2.234448, 1.162447, 1, 1, 1, 1, 1,
0.3619582, -1.424873, 2.774745, 1, 1, 1, 1, 1,
0.3675718, 0.7549612, -0.7881057, 1, 1, 1, 1, 1,
0.3677734, 0.2403607, -0.1199963, 1, 1, 1, 1, 1,
0.3740509, 0.7553194, -0.0502667, 1, 1, 1, 1, 1,
0.3764091, -0.42296, 1.815109, 1, 1, 1, 1, 1,
0.3850853, 1.107598, -1.068648, 1, 1, 1, 1, 1,
0.38784, -0.1408701, 4.222661, 1, 1, 1, 1, 1,
0.3921967, -0.8116259, 3.816876, 1, 1, 1, 1, 1,
0.402517, -0.8443439, 2.830345, 0, 0, 1, 1, 1,
0.4100585, 0.3255274, 0.5660473, 1, 0, 0, 1, 1,
0.4158134, -0.870986, 1.395504, 1, 0, 0, 1, 1,
0.4158401, -1.726391, 3.494434, 1, 0, 0, 1, 1,
0.4171584, -0.1714104, 2.863096, 1, 0, 0, 1, 1,
0.4172965, -0.677344, 1.038738, 1, 0, 0, 1, 1,
0.4184228, -1.525347, 1.656102, 0, 0, 0, 1, 1,
0.418801, -1.184628, 2.142367, 0, 0, 0, 1, 1,
0.4195264, -1.04924, 3.49583, 0, 0, 0, 1, 1,
0.4270964, -0.4789828, 1.720879, 0, 0, 0, 1, 1,
0.4393528, 0.5351282, 1.252379, 0, 0, 0, 1, 1,
0.4394904, 0.6622688, 1.075734, 0, 0, 0, 1, 1,
0.4426936, 0.621129, -0.02707518, 0, 0, 0, 1, 1,
0.4441375, -1.051453, 3.730549, 1, 1, 1, 1, 1,
0.4455191, 1.145383, 0.6313904, 1, 1, 1, 1, 1,
0.4459377, 1.483661, -0.09418172, 1, 1, 1, 1, 1,
0.4459469, 0.8284045, 1.726027, 1, 1, 1, 1, 1,
0.4477595, 0.2771092, 2.419354, 1, 1, 1, 1, 1,
0.4489894, -0.2830328, 2.62925, 1, 1, 1, 1, 1,
0.4500473, 0.787935, 0.2361733, 1, 1, 1, 1, 1,
0.4509677, -0.2814865, 0.6522948, 1, 1, 1, 1, 1,
0.4523588, -1.958573, 3.63306, 1, 1, 1, 1, 1,
0.4525369, -0.2040324, 2.296935, 1, 1, 1, 1, 1,
0.4567915, 1.531446, 1.021815, 1, 1, 1, 1, 1,
0.4577482, 1.212535, 1.243096, 1, 1, 1, 1, 1,
0.4577815, 1.597961, 0.925824, 1, 1, 1, 1, 1,
0.4618409, 0.2295626, 0.6940764, 1, 1, 1, 1, 1,
0.4628633, 0.5172049, 1.308182, 1, 1, 1, 1, 1,
0.4633618, 0.05584448, 1.292835, 0, 0, 1, 1, 1,
0.467639, 0.09750086, 0.3048425, 1, 0, 0, 1, 1,
0.4683118, 1.74488, 1.694236, 1, 0, 0, 1, 1,
0.4700395, -2.105467, 1.862955, 1, 0, 0, 1, 1,
0.4704439, 0.963725, 1.385667, 1, 0, 0, 1, 1,
0.470942, -0.5708511, 3.067238, 1, 0, 0, 1, 1,
0.472133, -1.049834, 3.63023, 0, 0, 0, 1, 1,
0.4739384, 1.114206, -1.112541, 0, 0, 0, 1, 1,
0.4783159, 1.818126, -0.2243624, 0, 0, 0, 1, 1,
0.4792002, -0.6822346, 2.402768, 0, 0, 0, 1, 1,
0.4838403, -0.3876989, 2.294014, 0, 0, 0, 1, 1,
0.4845711, 0.5371367, 0.8148978, 0, 0, 0, 1, 1,
0.4879187, 1.423936, 0.1046339, 0, 0, 0, 1, 1,
0.490092, -0.4242397, 2.973394, 1, 1, 1, 1, 1,
0.4924268, 0.9571775, 1.09553, 1, 1, 1, 1, 1,
0.4951688, 0.08796532, -0.1365531, 1, 1, 1, 1, 1,
0.4979167, -1.48928, 2.887812, 1, 1, 1, 1, 1,
0.5013781, -1.813828, 3.689398, 1, 1, 1, 1, 1,
0.5029405, 1.410508, 0.07485031, 1, 1, 1, 1, 1,
0.5084934, -1.020665, 2.352562, 1, 1, 1, 1, 1,
0.5147573, 0.9351797, 0.2799928, 1, 1, 1, 1, 1,
0.5152455, -0.1030376, 1.084456, 1, 1, 1, 1, 1,
0.5157509, 1.377903, -0.2338043, 1, 1, 1, 1, 1,
0.5251071, 0.3913072, 0.01187846, 1, 1, 1, 1, 1,
0.5265919, -0.7160758, 3.920568, 1, 1, 1, 1, 1,
0.5292876, 0.02218468, 1.062434, 1, 1, 1, 1, 1,
0.5309322, -0.2309954, 2.645622, 1, 1, 1, 1, 1,
0.5315365, 0.9236426, -0.1893327, 1, 1, 1, 1, 1,
0.5337096, -0.7636672, 2.51025, 0, 0, 1, 1, 1,
0.5338381, -1.103757, 3.268182, 1, 0, 0, 1, 1,
0.5339212, -0.9054387, 3.002703, 1, 0, 0, 1, 1,
0.5347272, 0.859032, -0.6161127, 1, 0, 0, 1, 1,
0.541232, 1.382025, 0.0635292, 1, 0, 0, 1, 1,
0.5452271, 0.2457818, 0.5144474, 1, 0, 0, 1, 1,
0.546773, 1.173344, 2.64422, 0, 0, 0, 1, 1,
0.5481579, 1.50779, -0.3603483, 0, 0, 0, 1, 1,
0.5490021, 0.6021279, 0.03421876, 0, 0, 0, 1, 1,
0.5564027, -1.400482, 3.860909, 0, 0, 0, 1, 1,
0.5569762, -0.8970197, 2.122272, 0, 0, 0, 1, 1,
0.5576434, -0.5373021, 2.810837, 0, 0, 0, 1, 1,
0.5590328, 0.5623904, -0.4488384, 0, 0, 0, 1, 1,
0.5628827, 1.501107, 0.2864102, 1, 1, 1, 1, 1,
0.5666842, 2.137283, 0.4325659, 1, 1, 1, 1, 1,
0.5696239, -0.5505076, 2.193654, 1, 1, 1, 1, 1,
0.5708686, -0.7601066, 3.351861, 1, 1, 1, 1, 1,
0.5818735, -0.3373972, 1.319475, 1, 1, 1, 1, 1,
0.5824605, 0.8853935, 1.520423, 1, 1, 1, 1, 1,
0.5837603, 0.4920965, 0.4338263, 1, 1, 1, 1, 1,
0.5871392, 1.512842, 0.4805892, 1, 1, 1, 1, 1,
0.5881222, -0.8498803, 2.949272, 1, 1, 1, 1, 1,
0.5900109, -0.3638831, 1.791982, 1, 1, 1, 1, 1,
0.5915728, -0.7176771, 1.43324, 1, 1, 1, 1, 1,
0.5926094, -0.6905083, 3.167118, 1, 1, 1, 1, 1,
0.6058627, -1.176922, 3.625663, 1, 1, 1, 1, 1,
0.6084431, -0.9797884, 1.175803, 1, 1, 1, 1, 1,
0.6122394, 0.6833379, 1.006559, 1, 1, 1, 1, 1,
0.6147029, -0.8981453, 3.188051, 0, 0, 1, 1, 1,
0.6175368, -0.583472, 3.796721, 1, 0, 0, 1, 1,
0.6183851, -1.350534, 3.295431, 1, 0, 0, 1, 1,
0.6202082, -0.5537071, 2.413505, 1, 0, 0, 1, 1,
0.6247242, 0.9423853, 0.2335802, 1, 0, 0, 1, 1,
0.6272596, 0.2489233, -0.4571088, 1, 0, 0, 1, 1,
0.6281297, 0.6940334, 0.7567445, 0, 0, 0, 1, 1,
0.6309516, 1.057946, -1.486432, 0, 0, 0, 1, 1,
0.6339328, 0.1676557, 1.668711, 0, 0, 0, 1, 1,
0.6355292, -0.6472223, 2.736907, 0, 0, 0, 1, 1,
0.6369122, 0.9743287, 0.909753, 0, 0, 0, 1, 1,
0.6475842, 1.448954, -0.02412074, 0, 0, 0, 1, 1,
0.6490646, 0.7632991, 1.781912, 0, 0, 0, 1, 1,
0.6512721, -0.1107205, 3.322895, 1, 1, 1, 1, 1,
0.653603, -1.309378, 3.735102, 1, 1, 1, 1, 1,
0.6537835, -1.173488, 1.676976, 1, 1, 1, 1, 1,
0.6672736, 0.8468215, 1.485488, 1, 1, 1, 1, 1,
0.6686108, -0.6023156, 1.077882, 1, 1, 1, 1, 1,
0.672076, 0.1873801, 0.4747539, 1, 1, 1, 1, 1,
0.6728384, 0.7232982, 0.8489117, 1, 1, 1, 1, 1,
0.673476, -0.6661906, 1.296348, 1, 1, 1, 1, 1,
0.6841354, -0.502814, 1.698745, 1, 1, 1, 1, 1,
0.6859717, 1.884405, -1.992088, 1, 1, 1, 1, 1,
0.6908321, -2.037064, 2.709839, 1, 1, 1, 1, 1,
0.6998683, -0.2932465, 1.392058, 1, 1, 1, 1, 1,
0.7010186, 0.1812622, -0.7416806, 1, 1, 1, 1, 1,
0.7096413, 0.3940102, -0.003334851, 1, 1, 1, 1, 1,
0.7111328, 1.917481, -1.757881, 1, 1, 1, 1, 1,
0.7156489, -1.918072, 3.823807, 0, 0, 1, 1, 1,
0.716709, -0.955076, 0.3357536, 1, 0, 0, 1, 1,
0.7167921, -0.03881349, 1.657526, 1, 0, 0, 1, 1,
0.7308366, -0.9586831, 2.107935, 1, 0, 0, 1, 1,
0.7322702, 1.007575, -0.1260322, 1, 0, 0, 1, 1,
0.7368947, -1.853165, 1.469795, 1, 0, 0, 1, 1,
0.7408685, 1.285497, -1.829612, 0, 0, 0, 1, 1,
0.746282, 1.293149, 0.4654985, 0, 0, 0, 1, 1,
0.7505909, -0.2860762, 1.782281, 0, 0, 0, 1, 1,
0.7552775, -0.06277798, -0.5111703, 0, 0, 0, 1, 1,
0.7574956, -0.3449766, 2.502189, 0, 0, 0, 1, 1,
0.7586349, 0.8861987, 2.585315, 0, 0, 0, 1, 1,
0.7603459, -1.301636, 3.017669, 0, 0, 0, 1, 1,
0.780414, 1.263815, -1.754006, 1, 1, 1, 1, 1,
0.7808954, 1.287502, 0.2859498, 1, 1, 1, 1, 1,
0.7820831, 0.6405823, 0.9118873, 1, 1, 1, 1, 1,
0.7828131, -0.3250304, 1.198902, 1, 1, 1, 1, 1,
0.7865091, 0.532362, 0.1879013, 1, 1, 1, 1, 1,
0.794761, 0.4946146, -1.07022, 1, 1, 1, 1, 1,
0.797422, -0.0601794, 1.31384, 1, 1, 1, 1, 1,
0.8010167, -1.669723, 2.294513, 1, 1, 1, 1, 1,
0.8013934, -1.278394, 2.440763, 1, 1, 1, 1, 1,
0.801604, 0.3916278, 2.22325, 1, 1, 1, 1, 1,
0.8055921, -0.7726779, 3.737898, 1, 1, 1, 1, 1,
0.8064952, -0.3161453, 2.362012, 1, 1, 1, 1, 1,
0.806933, 1.670752, 1.111057, 1, 1, 1, 1, 1,
0.8218859, -1.213689, 3.401206, 1, 1, 1, 1, 1,
0.8281833, 2.262316, -1.758513, 1, 1, 1, 1, 1,
0.8292114, -0.0125665, 1.174161, 0, 0, 1, 1, 1,
0.8489917, 0.7816988, -0.1264589, 1, 0, 0, 1, 1,
0.8511508, -0.1402403, 3.376606, 1, 0, 0, 1, 1,
0.8513871, -0.7966205, 2.740175, 1, 0, 0, 1, 1,
0.861331, 0.02513232, 1.800028, 1, 0, 0, 1, 1,
0.8637956, 0.8377994, 0.9525629, 1, 0, 0, 1, 1,
0.8657349, -0.2099467, 2.061014, 0, 0, 0, 1, 1,
0.8725541, -0.553624, 1.27358, 0, 0, 0, 1, 1,
0.8773953, -2.040805, 2.9427, 0, 0, 0, 1, 1,
0.8792239, 0.2380542, 1.275534, 0, 0, 0, 1, 1,
0.8884937, -0.8213381, 2.177863, 0, 0, 0, 1, 1,
0.8898554, 0.5413751, -0.04014398, 0, 0, 0, 1, 1,
0.8900951, 0.3406546, 2.166054, 0, 0, 0, 1, 1,
0.8905665, 1.412863, -1.074131, 1, 1, 1, 1, 1,
0.8978248, -1.042137, 1.472903, 1, 1, 1, 1, 1,
0.9047449, -0.9603981, 4.331063, 1, 1, 1, 1, 1,
0.9056669, 0.1836533, 0.1390396, 1, 1, 1, 1, 1,
0.9076931, -0.6593836, 2.472138, 1, 1, 1, 1, 1,
0.9080574, 0.8070481, -1.245356, 1, 1, 1, 1, 1,
0.9091337, 2.101442, -0.7465946, 1, 1, 1, 1, 1,
0.9105045, -1.0861, 0.6299546, 1, 1, 1, 1, 1,
0.9139228, -2.044816, 2.73875, 1, 1, 1, 1, 1,
0.9232144, 0.5281083, 2.888418, 1, 1, 1, 1, 1,
0.9232304, 0.653243, 0.4369008, 1, 1, 1, 1, 1,
0.9267858, 0.7970552, 0.1828056, 1, 1, 1, 1, 1,
0.9361367, -0.8831457, 3.626227, 1, 1, 1, 1, 1,
0.9364098, 0.186891, 3.36095, 1, 1, 1, 1, 1,
0.936547, -0.2203959, 1.085267, 1, 1, 1, 1, 1,
0.9380174, -1.279835, 1.832296, 0, 0, 1, 1, 1,
0.9401829, 0.05480979, 0.6393022, 1, 0, 0, 1, 1,
0.9439878, 0.1761279, 0.6168563, 1, 0, 0, 1, 1,
0.9456106, 0.7917472, 2.123822, 1, 0, 0, 1, 1,
0.9460577, 1.110493, 2.367484, 1, 0, 0, 1, 1,
0.950231, -0.4885395, 2.37354, 1, 0, 0, 1, 1,
0.9517971, -0.7366623, 2.898314, 0, 0, 0, 1, 1,
0.9529243, 0.2882719, 1.110524, 0, 0, 0, 1, 1,
0.9569029, -0.9913409, 1.993854, 0, 0, 0, 1, 1,
0.9904903, -0.468805, 1.961171, 0, 0, 0, 1, 1,
0.9916362, -0.06656824, 1.189548, 0, 0, 0, 1, 1,
0.9922372, -0.8847428, 2.153959, 0, 0, 0, 1, 1,
0.9963049, -0.768554, 4.390606, 0, 0, 0, 1, 1,
0.9982035, 1.514341, 1.08409, 1, 1, 1, 1, 1,
1.007245, -0.4792841, 1.790385, 1, 1, 1, 1, 1,
1.009904, -0.1170639, 1.847554, 1, 1, 1, 1, 1,
1.012052, 0.762292, -1.110265, 1, 1, 1, 1, 1,
1.01355, 0.610191, 1.861849, 1, 1, 1, 1, 1,
1.020101, -0.3365116, 1.095641, 1, 1, 1, 1, 1,
1.024293, -0.05929488, 0.1393362, 1, 1, 1, 1, 1,
1.024688, 0.7974865, 1.492016, 1, 1, 1, 1, 1,
1.031347, 0.2608715, 2.322169, 1, 1, 1, 1, 1,
1.032758, -2.293476, 1.632667, 1, 1, 1, 1, 1,
1.033446, 0.3350318, 0.8685752, 1, 1, 1, 1, 1,
1.034077, 0.8083314, 0.5557054, 1, 1, 1, 1, 1,
1.039749, 0.5631532, 1.710634, 1, 1, 1, 1, 1,
1.042567, -0.6592761, 3.057712, 1, 1, 1, 1, 1,
1.045804, 0.300766, 3.193279, 1, 1, 1, 1, 1,
1.046629, -0.9593421, 3.136105, 0, 0, 1, 1, 1,
1.053916, -1.277942, 2.08437, 1, 0, 0, 1, 1,
1.054592, 0.4477583, 1.699759, 1, 0, 0, 1, 1,
1.057822, 2.21174, 2.003079, 1, 0, 0, 1, 1,
1.066586, -0.9308661, 1.941649, 1, 0, 0, 1, 1,
1.067342, 0.02759306, 1.563094, 1, 0, 0, 1, 1,
1.06989, -1.197145, 4.464168, 0, 0, 0, 1, 1,
1.073754, -0.6906887, 1.688812, 0, 0, 0, 1, 1,
1.076016, -0.1306744, 3.355318, 0, 0, 0, 1, 1,
1.080934, 0.8312523, -0.3436155, 0, 0, 0, 1, 1,
1.084247, 0.0006102318, 1.785169, 0, 0, 0, 1, 1,
1.08429, -0.3295151, 2.253381, 0, 0, 0, 1, 1,
1.08646, -0.03694958, 2.748063, 0, 0, 0, 1, 1,
1.086733, 0.4909528, 2.357647, 1, 1, 1, 1, 1,
1.095767, 1.626515, 3.299846, 1, 1, 1, 1, 1,
1.100376, 1.380168, 0.6962995, 1, 1, 1, 1, 1,
1.101836, -0.7818497, 2.668024, 1, 1, 1, 1, 1,
1.10304, -2.104193, 2.645942, 1, 1, 1, 1, 1,
1.105402, 0.6690266, 1.398735, 1, 1, 1, 1, 1,
1.112889, -0.2567046, 1.611653, 1, 1, 1, 1, 1,
1.113778, 0.7113831, 0.9017482, 1, 1, 1, 1, 1,
1.122112, 0.7719578, 0.96491, 1, 1, 1, 1, 1,
1.12247, 0.4954729, 0.4456825, 1, 1, 1, 1, 1,
1.126122, 1.31236, 1.192933, 1, 1, 1, 1, 1,
1.132743, 1.926039, 0.3375832, 1, 1, 1, 1, 1,
1.133897, -0.4460551, 1.426196, 1, 1, 1, 1, 1,
1.145148, -0.3624106, 4.9981, 1, 1, 1, 1, 1,
1.148247, 1.167457, 1.43391, 1, 1, 1, 1, 1,
1.152292, -0.7290243, 3.152169, 0, 0, 1, 1, 1,
1.164661, 1.45796, 0.3946241, 1, 0, 0, 1, 1,
1.168833, 0.2332715, 1.545735, 1, 0, 0, 1, 1,
1.173868, -1.32867, 2.691797, 1, 0, 0, 1, 1,
1.178126, -0.2795428, 2.242152, 1, 0, 0, 1, 1,
1.182857, -1.137518, 1.471555, 1, 0, 0, 1, 1,
1.183298, 0.3719444, 1.542522, 0, 0, 0, 1, 1,
1.184042, 1.615893, 0.3412589, 0, 0, 0, 1, 1,
1.190066, 1.479286, 1.842602, 0, 0, 0, 1, 1,
1.192186, 0.3272397, 1.382974, 0, 0, 0, 1, 1,
1.194313, 0.7310766, 0.7028074, 0, 0, 0, 1, 1,
1.195867, -0.5133894, 2.655786, 0, 0, 0, 1, 1,
1.196561, -0.827463, 0.2389335, 0, 0, 0, 1, 1,
1.198042, -0.9262396, 2.361617, 1, 1, 1, 1, 1,
1.198164, -0.4782362, 3.802323, 1, 1, 1, 1, 1,
1.201253, -0.6892716, 2.784031, 1, 1, 1, 1, 1,
1.20655, -2.208225, 2.122885, 1, 1, 1, 1, 1,
1.209594, 1.143991, -0.167958, 1, 1, 1, 1, 1,
1.219892, -1.096298, 0.3818383, 1, 1, 1, 1, 1,
1.220975, 0.497044, 1.351188, 1, 1, 1, 1, 1,
1.224392, -1.030176, 2.266739, 1, 1, 1, 1, 1,
1.229086, -1.518, 2.14482, 1, 1, 1, 1, 1,
1.2382, 0.09592021, 3.112223, 1, 1, 1, 1, 1,
1.240341, 1.583948, -0.6209847, 1, 1, 1, 1, 1,
1.249657, 2.087523, -0.2144413, 1, 1, 1, 1, 1,
1.254544, -0.7354761, 0.9927108, 1, 1, 1, 1, 1,
1.267635, -0.7030828, 1.508111, 1, 1, 1, 1, 1,
1.267762, 0.0449183, 2.520096, 1, 1, 1, 1, 1,
1.275743, 1.199614, 1.325399, 0, 0, 1, 1, 1,
1.297919, -0.345579, 2.075865, 1, 0, 0, 1, 1,
1.298776, -1.573481, 2.254745, 1, 0, 0, 1, 1,
1.298948, 1.109862, 1.483421, 1, 0, 0, 1, 1,
1.308592, 0.8214408, 0.6130126, 1, 0, 0, 1, 1,
1.311293, -0.4204966, 1.847334, 1, 0, 0, 1, 1,
1.311881, 1.173942, 1.222901, 0, 0, 0, 1, 1,
1.31496, 0.7577379, 1.25234, 0, 0, 0, 1, 1,
1.319638, 0.1170883, 0.5777619, 0, 0, 0, 1, 1,
1.322916, 0.7160227, 2.07155, 0, 0, 0, 1, 1,
1.333815, -0.864998, 3.277923, 0, 0, 0, 1, 1,
1.341264, 0.06255893, 2.421249, 0, 0, 0, 1, 1,
1.347369, 1.179599, 1.523659, 0, 0, 0, 1, 1,
1.351169, -1.309186, 3.280706, 1, 1, 1, 1, 1,
1.366571, 0.0408304, 1.259801, 1, 1, 1, 1, 1,
1.368533, -0.1212435, 0.1671309, 1, 1, 1, 1, 1,
1.379736, -0.0483009, 0.2121274, 1, 1, 1, 1, 1,
1.380049, -2.625411, 2.777385, 1, 1, 1, 1, 1,
1.392357, 1.179674, 1.811676, 1, 1, 1, 1, 1,
1.397578, 0.8016699, 2.238927, 1, 1, 1, 1, 1,
1.397834, 0.2947344, 0.7825804, 1, 1, 1, 1, 1,
1.398928, -1.283662, 3.098771, 1, 1, 1, 1, 1,
1.401718, 0.3935478, 2.433904, 1, 1, 1, 1, 1,
1.403987, -1.323161, 2.121969, 1, 1, 1, 1, 1,
1.407766, -0.7486227, 2.05668, 1, 1, 1, 1, 1,
1.412098, 1.621848, -0.2161036, 1, 1, 1, 1, 1,
1.422048, 1.390787, -0.3831546, 1, 1, 1, 1, 1,
1.424033, -0.5697649, 3.065289, 1, 1, 1, 1, 1,
1.425397, -0.2432086, 1.05768, 0, 0, 1, 1, 1,
1.428702, -0.1847465, 2.308605, 1, 0, 0, 1, 1,
1.443493, -0.1458865, 1.685799, 1, 0, 0, 1, 1,
1.451693, -1.127882, 3.518693, 1, 0, 0, 1, 1,
1.452977, 1.481262, -0.07002828, 1, 0, 0, 1, 1,
1.457258, -0.9500881, 2.369952, 1, 0, 0, 1, 1,
1.467331, -0.5138481, 1.474058, 0, 0, 0, 1, 1,
1.467603, 1.003809, 1.384727, 0, 0, 0, 1, 1,
1.481097, 1.686598, 1.6618, 0, 0, 0, 1, 1,
1.484012, 1.524045, 1.57929, 0, 0, 0, 1, 1,
1.489115, -1.509487, 2.462938, 0, 0, 0, 1, 1,
1.492982, 1.857786, 1.037912, 0, 0, 0, 1, 1,
1.494293, 0.1169087, 1.859123, 0, 0, 0, 1, 1,
1.501023, -0.6984334, 2.778008, 1, 1, 1, 1, 1,
1.51137, -0.4928387, 2.029475, 1, 1, 1, 1, 1,
1.517116, 0.5284013, 1.536296, 1, 1, 1, 1, 1,
1.546256, -0.1580324, 1.306174, 1, 1, 1, 1, 1,
1.549665, 0.08172945, 1.026678, 1, 1, 1, 1, 1,
1.553963, -0.0722697, 1.529027, 1, 1, 1, 1, 1,
1.566421, -0.3028765, 0.7391324, 1, 1, 1, 1, 1,
1.568763, -0.07526661, 0.4588195, 1, 1, 1, 1, 1,
1.599091, 0.6486121, 1.280501, 1, 1, 1, 1, 1,
1.606341, 0.7039559, -0.1712256, 1, 1, 1, 1, 1,
1.629805, 0.02792785, 2.496644, 1, 1, 1, 1, 1,
1.634698, -0.3200414, 2.517069, 1, 1, 1, 1, 1,
1.642911, 0.1400727, 1.066143, 1, 1, 1, 1, 1,
1.653381, 0.8526068, -0.0393981, 1, 1, 1, 1, 1,
1.653983, 0.5036571, 1.108416, 1, 1, 1, 1, 1,
1.657625, 1.363413, 1.502605, 0, 0, 1, 1, 1,
1.663264, -1.352915, 3.173805, 1, 0, 0, 1, 1,
1.691692, -1.717333, 2.586032, 1, 0, 0, 1, 1,
1.707585, 0.008812414, 0.4488626, 1, 0, 0, 1, 1,
1.722, 0.3403841, 1.300484, 1, 0, 0, 1, 1,
1.7367, 0.3181227, 3.37691, 1, 0, 0, 1, 1,
1.74714, -0.1552949, 0.2674443, 0, 0, 0, 1, 1,
1.766466, -1.486667, 2.841329, 0, 0, 0, 1, 1,
1.766628, 0.2386136, 1.251776, 0, 0, 0, 1, 1,
1.7684, 0.1473928, 0.1228879, 0, 0, 0, 1, 1,
1.791861, -0.1461588, 2.222419, 0, 0, 0, 1, 1,
1.806698, -1.352581, 2.746299, 0, 0, 0, 1, 1,
1.809527, 0.6821744, 1.105378, 0, 0, 0, 1, 1,
1.812732, -0.1446906, 0.5207782, 1, 1, 1, 1, 1,
1.830255, 1.376031, 1.183221, 1, 1, 1, 1, 1,
1.853718, -0.9944752, 4.249148, 1, 1, 1, 1, 1,
1.854223, -2.482589, 2.376757, 1, 1, 1, 1, 1,
1.857838, -1.290654, 2.480275, 1, 1, 1, 1, 1,
1.861165, -1.128512, 2.230381, 1, 1, 1, 1, 1,
1.878882, 1.164681, 0.4799067, 1, 1, 1, 1, 1,
1.901287, 0.6110093, 3.048677, 1, 1, 1, 1, 1,
1.910043, -0.2857883, 0.8341874, 1, 1, 1, 1, 1,
1.910697, -1.079257, 2.020968, 1, 1, 1, 1, 1,
1.91725, -0.9437551, 1.399393, 1, 1, 1, 1, 1,
1.921458, 0.307653, 2.387904, 1, 1, 1, 1, 1,
1.923563, -0.7588941, 0.9781431, 1, 1, 1, 1, 1,
1.925887, -0.6974304, 2.05018, 1, 1, 1, 1, 1,
1.95037, -0.08779535, 1.858574, 1, 1, 1, 1, 1,
1.950752, -1.324599, 3.615916, 0, 0, 1, 1, 1,
1.953822, 1.337479, 1.238513, 1, 0, 0, 1, 1,
1.975125, -1.480318, 3.441159, 1, 0, 0, 1, 1,
1.986729, -0.8978761, 2.684622, 1, 0, 0, 1, 1,
2.019064, 0.4051184, 0.4914509, 1, 0, 0, 1, 1,
2.027125, -0.8307322, 2.709785, 1, 0, 0, 1, 1,
2.032472, -0.2112172, 1.428502, 0, 0, 0, 1, 1,
2.049302, -0.9310928, 2.209598, 0, 0, 0, 1, 1,
2.052112, -1.150787, 2.89657, 0, 0, 0, 1, 1,
2.104791, 1.301768, 0.183481, 0, 0, 0, 1, 1,
2.142071, 1.508856, 1.416626, 0, 0, 0, 1, 1,
2.142302, 0.7165689, 0.7724855, 0, 0, 0, 1, 1,
2.152917, -0.307877, 1.398542, 0, 0, 0, 1, 1,
2.223267, -0.003216393, 2.279197, 1, 1, 1, 1, 1,
2.236091, -0.8068226, 4.051004, 1, 1, 1, 1, 1,
2.250358, -1.54094, 0.6968549, 1, 1, 1, 1, 1,
2.270763, -1.567348, 2.322732, 1, 1, 1, 1, 1,
2.272835, 0.1582943, -0.4720834, 1, 1, 1, 1, 1,
2.47443, -1.525123, 0.522792, 1, 1, 1, 1, 1,
2.958289, -2.142778, 3.330992, 1, 1, 1, 1, 1
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
var radius = 9.412798;
var distance = 33.06205;
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
mvMatrix.translate( 0.10795, -0.2480555, 0.1317039 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.06205);
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
