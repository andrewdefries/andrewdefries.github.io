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
-2.913151, 0.9798338, -1.344933, 1, 0, 0, 1,
-2.804011, -0.3147677, -2.051483, 1, 0.007843138, 0, 1,
-2.769931, 1.39127, -2.337964, 1, 0.01176471, 0, 1,
-2.711626, 0.5946146, -2.190803, 1, 0.01960784, 0, 1,
-2.682775, 0.3766977, -1.794724, 1, 0.02352941, 0, 1,
-2.653923, -1.626988, -3.049693, 1, 0.03137255, 0, 1,
-2.63194, 1.511198, -0.6180979, 1, 0.03529412, 0, 1,
-2.611199, 2.51652, 0.3693706, 1, 0.04313726, 0, 1,
-2.518089, -1.364829, -2.402348, 1, 0.04705882, 0, 1,
-2.380592, 1.538622, -1.773588, 1, 0.05490196, 0, 1,
-2.375967, -1.526973, -3.04392, 1, 0.05882353, 0, 1,
-2.34659, -1.252995, -2.38587, 1, 0.06666667, 0, 1,
-2.323228, 1.171813, -2.37798, 1, 0.07058824, 0, 1,
-2.315932, 0.7882435, 0.6495733, 1, 0.07843138, 0, 1,
-2.302028, 0.1665205, -2.589197, 1, 0.08235294, 0, 1,
-2.294555, -0.6854608, -0.2929925, 1, 0.09019608, 0, 1,
-2.221478, -0.4268601, -1.626531, 1, 0.09411765, 0, 1,
-2.212234, -0.6648955, -1.068568, 1, 0.1019608, 0, 1,
-2.204326, -2.30103, -2.988003, 1, 0.1098039, 0, 1,
-2.195292, 0.6633922, -0.9184653, 1, 0.1137255, 0, 1,
-2.159125, 0.6595672, -0.4912408, 1, 0.1215686, 0, 1,
-2.107087, -1.653903, -2.168288, 1, 0.1254902, 0, 1,
-2.05492, -2.634395, -4.702272, 1, 0.1333333, 0, 1,
-2.041646, -0.317888, -0.6762113, 1, 0.1372549, 0, 1,
-2.041238, -1.736238, -2.098233, 1, 0.145098, 0, 1,
-2.040195, -0.1296581, -3.776323, 1, 0.1490196, 0, 1,
-1.993621, 1.466099, -0.8371639, 1, 0.1568628, 0, 1,
-1.990361, -0.8223205, -0.6762806, 1, 0.1607843, 0, 1,
-1.965605, 1.469554, -0.1701035, 1, 0.1686275, 0, 1,
-1.955739, 0.4160728, -0.2162375, 1, 0.172549, 0, 1,
-1.948314, -1.689043, -2.010078, 1, 0.1803922, 0, 1,
-1.918865, 1.336751, -0.5127703, 1, 0.1843137, 0, 1,
-1.916203, -0.3980759, -1.543489, 1, 0.1921569, 0, 1,
-1.916191, -0.4902726, -1.542058, 1, 0.1960784, 0, 1,
-1.898283, 0.5355191, -1.094691, 1, 0.2039216, 0, 1,
-1.88318, 0.4380026, -0.2717067, 1, 0.2117647, 0, 1,
-1.875564, 0.08805171, -1.35806, 1, 0.2156863, 0, 1,
-1.869074, 1.080635, 1.058944, 1, 0.2235294, 0, 1,
-1.820528, -1.840862, -1.779357, 1, 0.227451, 0, 1,
-1.800901, -0.822215, -0.8835761, 1, 0.2352941, 0, 1,
-1.786289, 2.383801, 1.329279, 1, 0.2392157, 0, 1,
-1.762908, 0.2396779, -1.898003, 1, 0.2470588, 0, 1,
-1.755762, -0.01070219, -1.217504, 1, 0.2509804, 0, 1,
-1.748505, -0.4637815, -0.6490027, 1, 0.2588235, 0, 1,
-1.746447, -0.6567876, -2.865411, 1, 0.2627451, 0, 1,
-1.722221, 0.003442784, -2.690966, 1, 0.2705882, 0, 1,
-1.702246, 0.7931026, -0.0338596, 1, 0.2745098, 0, 1,
-1.694297, -1.384751, -0.6530209, 1, 0.282353, 0, 1,
-1.685061, -1.453969, -1.899346, 1, 0.2862745, 0, 1,
-1.682827, 0.5027238, -2.333567, 1, 0.2941177, 0, 1,
-1.674257, -0.9035771, -2.348511, 1, 0.3019608, 0, 1,
-1.672379, -0.8183334, -1.155706, 1, 0.3058824, 0, 1,
-1.664517, -1.805437, -1.300244, 1, 0.3137255, 0, 1,
-1.658413, -0.94966, -2.767688, 1, 0.3176471, 0, 1,
-1.643379, -0.9002549, -1.211928, 1, 0.3254902, 0, 1,
-1.632892, 0.5388545, -1.525648, 1, 0.3294118, 0, 1,
-1.630965, 1.33856, 0.3929918, 1, 0.3372549, 0, 1,
-1.627745, 0.3631921, -0.6325551, 1, 0.3411765, 0, 1,
-1.607437, -0.380315, -2.019475, 1, 0.3490196, 0, 1,
-1.601896, -0.3679335, -1.945248, 1, 0.3529412, 0, 1,
-1.59898, -1.200771, -0.7780936, 1, 0.3607843, 0, 1,
-1.578066, 0.2641555, 1.219695, 1, 0.3647059, 0, 1,
-1.575643, 0.1942758, -1.207938, 1, 0.372549, 0, 1,
-1.530094, -1.52027, -2.263849, 1, 0.3764706, 0, 1,
-1.518659, 1.29891, -1.15604, 1, 0.3843137, 0, 1,
-1.518448, -0.3348843, -1.00082, 1, 0.3882353, 0, 1,
-1.509722, -0.4817773, -1.52011, 1, 0.3960784, 0, 1,
-1.496008, 0.3436155, -2.352819, 1, 0.4039216, 0, 1,
-1.471581, -0.2717539, -3.417436, 1, 0.4078431, 0, 1,
-1.466115, -0.1837273, -1.944203, 1, 0.4156863, 0, 1,
-1.456038, -1.744624, -3.867509, 1, 0.4196078, 0, 1,
-1.448692, 0.6013464, -2.148757, 1, 0.427451, 0, 1,
-1.444661, 0.5679376, -0.2161198, 1, 0.4313726, 0, 1,
-1.436578, -1.015399, -0.7620253, 1, 0.4392157, 0, 1,
-1.432418, -0.9472287, -2.182703, 1, 0.4431373, 0, 1,
-1.430571, 0.0114547, -1.149906, 1, 0.4509804, 0, 1,
-1.420169, 0.8661367, -1.813051, 1, 0.454902, 0, 1,
-1.407978, -1.08562, -2.137713, 1, 0.4627451, 0, 1,
-1.401858, 0.4442399, -4.076365, 1, 0.4666667, 0, 1,
-1.387127, 0.3096727, -1.46314, 1, 0.4745098, 0, 1,
-1.378422, 0.04137383, -1.173859, 1, 0.4784314, 0, 1,
-1.371112, 0.3118375, -0.7106277, 1, 0.4862745, 0, 1,
-1.363269, -0.8050604, -1.37933, 1, 0.4901961, 0, 1,
-1.360315, -0.1925147, -0.9746536, 1, 0.4980392, 0, 1,
-1.352765, -0.07104432, -2.771955, 1, 0.5058824, 0, 1,
-1.341912, -0.5130851, -3.419752, 1, 0.509804, 0, 1,
-1.337781, -0.790749, -2.622517, 1, 0.5176471, 0, 1,
-1.334495, -0.4665372, -3.10043, 1, 0.5215687, 0, 1,
-1.330087, 0.1715679, -1.936337, 1, 0.5294118, 0, 1,
-1.326077, 0.1892256, -0.2011503, 1, 0.5333334, 0, 1,
-1.32171, 0.541053, -0.5662636, 1, 0.5411765, 0, 1,
-1.308704, -1.248913, -1.260628, 1, 0.5450981, 0, 1,
-1.308396, 0.6639497, -1.631266, 1, 0.5529412, 0, 1,
-1.306685, -0.02126803, -2.397909, 1, 0.5568628, 0, 1,
-1.303247, 1.522296, 1.569032, 1, 0.5647059, 0, 1,
-1.294448, 2.49988, 1.258882, 1, 0.5686275, 0, 1,
-1.286262, -1.446918, -1.409964, 1, 0.5764706, 0, 1,
-1.282081, 0.6007527, -2.718134, 1, 0.5803922, 0, 1,
-1.280547, -1.960287, -2.102331, 1, 0.5882353, 0, 1,
-1.279492, 1.900927, -1.06783, 1, 0.5921569, 0, 1,
-1.2668, -0.3750651, -3.92876, 1, 0.6, 0, 1,
-1.259004, 0.6033704, -0.268952, 1, 0.6078432, 0, 1,
-1.252344, 0.4752281, -0.2743794, 1, 0.6117647, 0, 1,
-1.245391, 0.4965918, -2.646496, 1, 0.6196079, 0, 1,
-1.242239, 1.081453, -4.651748, 1, 0.6235294, 0, 1,
-1.23808, 1.206085, -1.217196, 1, 0.6313726, 0, 1,
-1.236176, 0.1966457, -0.5583372, 1, 0.6352941, 0, 1,
-1.229534, -0.2888578, -1.610557, 1, 0.6431373, 0, 1,
-1.221993, -0.8043742, -3.023322, 1, 0.6470588, 0, 1,
-1.2213, 1.486653, 0.09055055, 1, 0.654902, 0, 1,
-1.219792, 0.5309148, -0.8639059, 1, 0.6588235, 0, 1,
-1.205289, 0.005136034, -1.492678, 1, 0.6666667, 0, 1,
-1.20112, -0.2365724, -1.637656, 1, 0.6705883, 0, 1,
-1.198929, -0.2530581, -1.75693, 1, 0.6784314, 0, 1,
-1.19752, -1.490143, -3.127197, 1, 0.682353, 0, 1,
-1.1931, 0.5618052, -2.774736, 1, 0.6901961, 0, 1,
-1.190716, 1.044765, -2.007116, 1, 0.6941177, 0, 1,
-1.188721, 0.4856716, -1.446892, 1, 0.7019608, 0, 1,
-1.177876, 0.6947039, -0.5086188, 1, 0.7098039, 0, 1,
-1.173834, -0.8816552, -2.746113, 1, 0.7137255, 0, 1,
-1.169466, -0.8682172, -0.9514364, 1, 0.7215686, 0, 1,
-1.16172, -0.05286783, -0.4879407, 1, 0.7254902, 0, 1,
-1.157731, 0.1742961, -2.217406, 1, 0.7333333, 0, 1,
-1.15229, 0.1564851, -2.416386, 1, 0.7372549, 0, 1,
-1.151935, -1.172941, -3.325734, 1, 0.7450981, 0, 1,
-1.143793, 0.2472933, -2.748504, 1, 0.7490196, 0, 1,
-1.143697, -0.5957997, -0.4810291, 1, 0.7568628, 0, 1,
-1.139377, 2.248571, -0.6201178, 1, 0.7607843, 0, 1,
-1.138761, 0.4421393, -1.743318, 1, 0.7686275, 0, 1,
-1.118397, 1.552578, -1.056865, 1, 0.772549, 0, 1,
-1.110316, 1.387072, -2.083387, 1, 0.7803922, 0, 1,
-1.108974, -0.6370338, -1.21146, 1, 0.7843137, 0, 1,
-1.108647, -0.3981468, -1.422179, 1, 0.7921569, 0, 1,
-1.104103, -1.805282, -4.618478, 1, 0.7960784, 0, 1,
-1.091125, 1.579409, 0.6115694, 1, 0.8039216, 0, 1,
-1.088967, -0.9934543, -2.397444, 1, 0.8117647, 0, 1,
-1.074582, -0.1857129, -2.369631, 1, 0.8156863, 0, 1,
-1.071581, -0.4424236, -2.273134, 1, 0.8235294, 0, 1,
-1.061564, -0.148672, -2.22877, 1, 0.827451, 0, 1,
-1.061002, -0.8512894, -1.605301, 1, 0.8352941, 0, 1,
-1.059076, 0.2225964, -0.809779, 1, 0.8392157, 0, 1,
-1.054325, -0.8880816, -3.864132, 1, 0.8470588, 0, 1,
-1.052102, 1.195609, 0.05757878, 1, 0.8509804, 0, 1,
-1.049867, -1.581081, -1.128854, 1, 0.8588235, 0, 1,
-1.046342, -1.585576, -2.893277, 1, 0.8627451, 0, 1,
-1.044994, 1.672383, 0.1963056, 1, 0.8705882, 0, 1,
-1.041412, -0.2574403, -2.722982, 1, 0.8745098, 0, 1,
-1.039038, -0.3250149, -2.36007, 1, 0.8823529, 0, 1,
-1.034619, -0.7497986, -1.936293, 1, 0.8862745, 0, 1,
-1.030318, 0.4641293, -1.041771, 1, 0.8941177, 0, 1,
-1.026228, -0.7117705, -2.227086, 1, 0.8980392, 0, 1,
-1.012234, -0.9373811, -1.766156, 1, 0.9058824, 0, 1,
-1.008613, 1.384973, -0.2824153, 1, 0.9137255, 0, 1,
-1.00552, 0.1332074, -1.034509, 1, 0.9176471, 0, 1,
-1.003941, 0.5592046, -0.06241521, 1, 0.9254902, 0, 1,
-0.9942706, -0.7926648, -3.365652, 1, 0.9294118, 0, 1,
-0.9906996, 1.009417, -1.039548, 1, 0.9372549, 0, 1,
-0.9835664, 1.655878, 0.2290668, 1, 0.9411765, 0, 1,
-0.9778786, -0.1574465, -0.1677428, 1, 0.9490196, 0, 1,
-0.9775372, -0.4959584, -2.29041, 1, 0.9529412, 0, 1,
-0.9743534, 0.6250497, 0.06311941, 1, 0.9607843, 0, 1,
-0.9626882, 0.6282865, -0.8383794, 1, 0.9647059, 0, 1,
-0.960341, 0.8408587, -1.361678, 1, 0.972549, 0, 1,
-0.9494609, -1.222049, -1.006248, 1, 0.9764706, 0, 1,
-0.9433252, 0.3611154, -1.420674, 1, 0.9843137, 0, 1,
-0.9278313, -0.5784618, -3.867686, 1, 0.9882353, 0, 1,
-0.9235804, 0.02684612, -0.4236534, 1, 0.9960784, 0, 1,
-0.9235183, 1.097646, -0.8103334, 0.9960784, 1, 0, 1,
-0.9154412, -1.762941, -3.849756, 0.9921569, 1, 0, 1,
-0.9101419, 1.574105, 0.494075, 0.9843137, 1, 0, 1,
-0.9091888, 0.6396222, 1.008542, 0.9803922, 1, 0, 1,
-0.9054503, 0.01988457, -0.8931141, 0.972549, 1, 0, 1,
-0.904227, -0.3246734, -3.76331, 0.9686275, 1, 0, 1,
-0.8942857, 2.647406, 0.5056508, 0.9607843, 1, 0, 1,
-0.8926395, -0.1786874, -2.840448, 0.9568627, 1, 0, 1,
-0.888933, 2.098243, -1.81399, 0.9490196, 1, 0, 1,
-0.8856322, -0.8246139, -0.3694223, 0.945098, 1, 0, 1,
-0.8810095, -1.392133, -1.266466, 0.9372549, 1, 0, 1,
-0.8791812, 0.6136669, -0.6803346, 0.9333333, 1, 0, 1,
-0.8787568, -1.790458, -1.787278, 0.9254902, 1, 0, 1,
-0.8757293, -0.8197145, -1.448865, 0.9215686, 1, 0, 1,
-0.8732896, -0.8442176, -2.027987, 0.9137255, 1, 0, 1,
-0.8715112, -1.120456, -1.846538, 0.9098039, 1, 0, 1,
-0.8623723, 1.267135, -0.3743138, 0.9019608, 1, 0, 1,
-0.8619797, 0.5127025, -0.919132, 0.8941177, 1, 0, 1,
-0.8614371, 0.1927866, -1.485455, 0.8901961, 1, 0, 1,
-0.8553218, 0.5898643, -0.4083629, 0.8823529, 1, 0, 1,
-0.8526555, 1.418661, 0.1211874, 0.8784314, 1, 0, 1,
-0.8448949, 0.6819835, -0.6908824, 0.8705882, 1, 0, 1,
-0.8431162, -0.574435, -2.74573, 0.8666667, 1, 0, 1,
-0.8424446, 0.9839035, -1.325815, 0.8588235, 1, 0, 1,
-0.8417304, -1.920637, -4.113462, 0.854902, 1, 0, 1,
-0.8371814, -1.53887, -1.597368, 0.8470588, 1, 0, 1,
-0.8365883, 0.4644584, -0.9267876, 0.8431373, 1, 0, 1,
-0.8320076, -0.3186991, -4.328399, 0.8352941, 1, 0, 1,
-0.8319443, -0.9547324, -1.266066, 0.8313726, 1, 0, 1,
-0.8292974, -0.5285404, -2.333002, 0.8235294, 1, 0, 1,
-0.8288804, -0.01713724, -2.219254, 0.8196079, 1, 0, 1,
-0.8240858, 0.3857675, -1.311798, 0.8117647, 1, 0, 1,
-0.8239183, -0.1246423, -0.321083, 0.8078431, 1, 0, 1,
-0.8220195, -1.128066, -2.468753, 0.8, 1, 0, 1,
-0.8189964, 0.6142285, -0.8536175, 0.7921569, 1, 0, 1,
-0.8187312, -0.8460156, -1.371664, 0.7882353, 1, 0, 1,
-0.8110005, -0.8461819, -1.483474, 0.7803922, 1, 0, 1,
-0.8070903, 0.3516485, 0.1286432, 0.7764706, 1, 0, 1,
-0.7961673, 0.1006828, -0.0603646, 0.7686275, 1, 0, 1,
-0.7930003, -1.025702, -1.155303, 0.7647059, 1, 0, 1,
-0.784549, -1.181046, -2.996327, 0.7568628, 1, 0, 1,
-0.7843885, -1.238758, -1.356898, 0.7529412, 1, 0, 1,
-0.7838685, -0.7952963, -1.31381, 0.7450981, 1, 0, 1,
-0.7821, 1.094115, -1.993382, 0.7411765, 1, 0, 1,
-0.780418, -1.224446, -1.174861, 0.7333333, 1, 0, 1,
-0.7792038, -0.007834095, -0.6170974, 0.7294118, 1, 0, 1,
-0.7751026, -0.5730789, -2.167179, 0.7215686, 1, 0, 1,
-0.7713872, -0.8455943, -2.037834, 0.7176471, 1, 0, 1,
-0.7695931, -1.083272, -3.381597, 0.7098039, 1, 0, 1,
-0.7674661, 2.259843, -0.5843673, 0.7058824, 1, 0, 1,
-0.7658125, 0.4433537, 0.5096424, 0.6980392, 1, 0, 1,
-0.7582743, -0.5831735, -2.094647, 0.6901961, 1, 0, 1,
-0.757583, -0.4439344, -3.222546, 0.6862745, 1, 0, 1,
-0.7561188, -0.2100173, -2.01193, 0.6784314, 1, 0, 1,
-0.7546856, 1.211558, -0.4899555, 0.6745098, 1, 0, 1,
-0.7524863, -0.2103899, -4.14265, 0.6666667, 1, 0, 1,
-0.7481386, 0.7677251, -2.21543, 0.6627451, 1, 0, 1,
-0.7478544, 1.823553, -0.3106913, 0.654902, 1, 0, 1,
-0.7442895, 0.1338044, -1.304367, 0.6509804, 1, 0, 1,
-0.7413484, -0.4166693, -1.176201, 0.6431373, 1, 0, 1,
-0.7314475, -0.7567361, -2.091749, 0.6392157, 1, 0, 1,
-0.7311487, 0.6907451, -0.2724045, 0.6313726, 1, 0, 1,
-0.7301921, 0.2367783, -1.583579, 0.627451, 1, 0, 1,
-0.7290263, -1.040784, -2.617594, 0.6196079, 1, 0, 1,
-0.7219059, -0.09412746, -2.04917, 0.6156863, 1, 0, 1,
-0.7129455, 1.031126, -1.241217, 0.6078432, 1, 0, 1,
-0.7112519, 0.8625485, 0.1253423, 0.6039216, 1, 0, 1,
-0.709204, 0.02309819, -0.4554588, 0.5960785, 1, 0, 1,
-0.7080964, -0.09823697, -0.8098575, 0.5882353, 1, 0, 1,
-0.7080815, -1.530531, -2.651872, 0.5843138, 1, 0, 1,
-0.7065607, -1.186677, -3.114948, 0.5764706, 1, 0, 1,
-0.7029454, -0.3059023, -1.179953, 0.572549, 1, 0, 1,
-0.7009236, 0.4550698, 0.104644, 0.5647059, 1, 0, 1,
-0.6986578, 1.475393, -1.00918, 0.5607843, 1, 0, 1,
-0.6946285, -1.72148, -1.762712, 0.5529412, 1, 0, 1,
-0.6926691, 0.4465999, -0.6379708, 0.5490196, 1, 0, 1,
-0.6858988, 0.04070104, -2.080047, 0.5411765, 1, 0, 1,
-0.6805305, 0.9586429, -1.415664, 0.5372549, 1, 0, 1,
-0.6796094, -2.087274, -2.51053, 0.5294118, 1, 0, 1,
-0.6793609, -0.636906, -2.010918, 0.5254902, 1, 0, 1,
-0.6767761, 0.2086041, -2.07044, 0.5176471, 1, 0, 1,
-0.6754809, 0.1880616, -1.846982, 0.5137255, 1, 0, 1,
-0.6702023, 1.271939, 1.553468, 0.5058824, 1, 0, 1,
-0.6657201, -0.7173204, -3.404446, 0.5019608, 1, 0, 1,
-0.6644172, -0.5095081, -1.453799, 0.4941176, 1, 0, 1,
-0.6601254, 1.685026, -2.270925, 0.4862745, 1, 0, 1,
-0.6595883, 1.479768, -0.992588, 0.4823529, 1, 0, 1,
-0.6568902, 0.1571615, -1.74157, 0.4745098, 1, 0, 1,
-0.655944, -0.561927, -2.256418, 0.4705882, 1, 0, 1,
-0.6529267, -1.637346, -2.194694, 0.4627451, 1, 0, 1,
-0.6481064, -1.188117, -1.797191, 0.4588235, 1, 0, 1,
-0.6458688, -0.4804949, -2.979218, 0.4509804, 1, 0, 1,
-0.6433635, -1.446985, -2.536766, 0.4470588, 1, 0, 1,
-0.6432833, 0.6945454, -0.9343617, 0.4392157, 1, 0, 1,
-0.6364829, 0.4769026, -2.611489, 0.4352941, 1, 0, 1,
-0.6363971, 0.03221431, -2.168139, 0.427451, 1, 0, 1,
-0.6360431, -0.288876, -2.908852, 0.4235294, 1, 0, 1,
-0.6338198, 1.24614, -0.9848577, 0.4156863, 1, 0, 1,
-0.6322417, -1.587928, -3.491238, 0.4117647, 1, 0, 1,
-0.6312975, 0.4931609, -0.2524289, 0.4039216, 1, 0, 1,
-0.6310273, 1.643941, 1.069823, 0.3960784, 1, 0, 1,
-0.629199, -2.028466, -4.544874, 0.3921569, 1, 0, 1,
-0.6266049, -1.457479, -2.407722, 0.3843137, 1, 0, 1,
-0.6252164, 0.6328506, -1.603817, 0.3803922, 1, 0, 1,
-0.624139, 1.729451, -0.6133262, 0.372549, 1, 0, 1,
-0.6221474, 0.3455606, -0.3264452, 0.3686275, 1, 0, 1,
-0.6220149, 0.2115681, -1.127868, 0.3607843, 1, 0, 1,
-0.6176273, -0.3888918, -2.557861, 0.3568628, 1, 0, 1,
-0.6049922, -0.5270053, -2.734015, 0.3490196, 1, 0, 1,
-0.6049816, -0.3587319, -1.968357, 0.345098, 1, 0, 1,
-0.6046881, -1.421433, -0.7609857, 0.3372549, 1, 0, 1,
-0.6046868, -1.292409, -0.808849, 0.3333333, 1, 0, 1,
-0.5901803, 2.446323, -1.500093, 0.3254902, 1, 0, 1,
-0.5835052, -1.024449, -1.274032, 0.3215686, 1, 0, 1,
-0.5821368, -0.3245227, -1.821304, 0.3137255, 1, 0, 1,
-0.5806995, -0.531486, -3.250036, 0.3098039, 1, 0, 1,
-0.5770506, 0.8295992, -0.0595912, 0.3019608, 1, 0, 1,
-0.5689562, -0.906086, -2.292876, 0.2941177, 1, 0, 1,
-0.5676714, -0.4439494, -2.210701, 0.2901961, 1, 0, 1,
-0.5627905, 1.415325, -0.1146601, 0.282353, 1, 0, 1,
-0.5625878, 0.4328921, -0.9376789, 0.2784314, 1, 0, 1,
-0.5625352, -0.5203384, -2.055915, 0.2705882, 1, 0, 1,
-0.5616778, -0.6005661, -1.475275, 0.2666667, 1, 0, 1,
-0.5581746, 0.7842627, -0.349894, 0.2588235, 1, 0, 1,
-0.5571392, 0.8007913, 1.422836, 0.254902, 1, 0, 1,
-0.5549198, 2.89735, 0.7593009, 0.2470588, 1, 0, 1,
-0.5476374, -1.196359, -3.014367, 0.2431373, 1, 0, 1,
-0.5445845, 0.1500735, -0.3700559, 0.2352941, 1, 0, 1,
-0.5424064, -0.7895399, -3.518064, 0.2313726, 1, 0, 1,
-0.5417609, -0.2095554, -0.5776257, 0.2235294, 1, 0, 1,
-0.5412602, -0.3692054, -0.8673075, 0.2196078, 1, 0, 1,
-0.5385361, 0.91684, 0.514834, 0.2117647, 1, 0, 1,
-0.5381604, -1.593201, -2.119031, 0.2078431, 1, 0, 1,
-0.5381598, 1.134542, 0.1425936, 0.2, 1, 0, 1,
-0.5337048, -1.454043, -3.34292, 0.1921569, 1, 0, 1,
-0.5316285, 0.8569557, -2.759382, 0.1882353, 1, 0, 1,
-0.5316115, 0.02429033, -1.569927, 0.1803922, 1, 0, 1,
-0.5255405, -1.863571, -2.144614, 0.1764706, 1, 0, 1,
-0.5223935, 0.02253859, -0.8639398, 0.1686275, 1, 0, 1,
-0.5210086, 1.117796, 0.4791304, 0.1647059, 1, 0, 1,
-0.5196645, -0.3314773, -1.424552, 0.1568628, 1, 0, 1,
-0.5182111, -0.7886966, -2.248956, 0.1529412, 1, 0, 1,
-0.517574, -1.991115, -1.657043, 0.145098, 1, 0, 1,
-0.5153741, -0.7980457, -1.229007, 0.1411765, 1, 0, 1,
-0.5129725, 0.1079464, -0.7971528, 0.1333333, 1, 0, 1,
-0.5089043, 1.088616, -0.1822473, 0.1294118, 1, 0, 1,
-0.5079148, -1.523528, -4.362563, 0.1215686, 1, 0, 1,
-0.5067915, 1.487786, -0.5281312, 0.1176471, 1, 0, 1,
-0.5049292, 0.03474117, -1.605737, 0.1098039, 1, 0, 1,
-0.5022039, 0.3381923, -1.423839, 0.1058824, 1, 0, 1,
-0.5002371, -1.512254, -1.989482, 0.09803922, 1, 0, 1,
-0.4988948, 0.5871652, -0.4343358, 0.09019608, 1, 0, 1,
-0.4959104, 1.31685, 0.9177254, 0.08627451, 1, 0, 1,
-0.4958481, 0.3022017, 0.2919647, 0.07843138, 1, 0, 1,
-0.4945668, -0.3576048, -1.280492, 0.07450981, 1, 0, 1,
-0.4922265, -0.221356, -2.515417, 0.06666667, 1, 0, 1,
-0.4902738, 1.570304, -0.2131288, 0.0627451, 1, 0, 1,
-0.49011, -0.09855875, -1.416059, 0.05490196, 1, 0, 1,
-0.4847315, 0.3063464, -0.9859865, 0.05098039, 1, 0, 1,
-0.4834949, -0.671794, -2.796004, 0.04313726, 1, 0, 1,
-0.4822587, -0.9212013, -1.330025, 0.03921569, 1, 0, 1,
-0.481418, -0.2577668, -1.279986, 0.03137255, 1, 0, 1,
-0.4759087, 0.5821026, -1.940033, 0.02745098, 1, 0, 1,
-0.4720536, 1.004848, 0.2166515, 0.01960784, 1, 0, 1,
-0.4713472, -0.9359007, -3.028463, 0.01568628, 1, 0, 1,
-0.4696803, 0.5427375, -0.1740471, 0.007843138, 1, 0, 1,
-0.4690609, 0.6615406, -2.263586, 0.003921569, 1, 0, 1,
-0.4663756, -1.349271, -3.831829, 0, 1, 0.003921569, 1,
-0.4649881, -1.483234, -3.782015, 0, 1, 0.01176471, 1,
-0.4633601, -0.564009, -2.192508, 0, 1, 0.01568628, 1,
-0.4629948, -0.008873255, -0.03889279, 0, 1, 0.02352941, 1,
-0.461686, 0.460697, -2.132913, 0, 1, 0.02745098, 1,
-0.4607498, 0.5189951, -1.528931, 0, 1, 0.03529412, 1,
-0.4599137, -0.1961486, -0.6083491, 0, 1, 0.03921569, 1,
-0.4564687, -0.2517466, -1.922562, 0, 1, 0.04705882, 1,
-0.4544945, 0.4434907, -0.1153324, 0, 1, 0.05098039, 1,
-0.4431386, -1.460795, -3.661057, 0, 1, 0.05882353, 1,
-0.4410798, 1.809532, -0.1627843, 0, 1, 0.0627451, 1,
-0.439453, -0.666065, -2.888207, 0, 1, 0.07058824, 1,
-0.4356838, 0.3682112, -1.027034, 0, 1, 0.07450981, 1,
-0.4322998, -1.056597, -3.806355, 0, 1, 0.08235294, 1,
-0.4322302, -0.3327517, -2.439171, 0, 1, 0.08627451, 1,
-0.4306891, 2.560231, -1.477991, 0, 1, 0.09411765, 1,
-0.4294679, 0.2995451, -2.281037, 0, 1, 0.1019608, 1,
-0.4282719, -1.111184, -3.362705, 0, 1, 0.1058824, 1,
-0.4249328, 1.153458, 0.9369201, 0, 1, 0.1137255, 1,
-0.4215943, -0.3441314, -1.860033, 0, 1, 0.1176471, 1,
-0.4210688, -1.158809, -2.565943, 0, 1, 0.1254902, 1,
-0.4205776, 0.8100083, -0.9782838, 0, 1, 0.1294118, 1,
-0.4201664, -0.1107815, -3.172856, 0, 1, 0.1372549, 1,
-0.417192, -0.07990087, -0.03497798, 0, 1, 0.1411765, 1,
-0.4157981, -0.6469826, -1.812341, 0, 1, 0.1490196, 1,
-0.4072383, -1.137907, -2.018316, 0, 1, 0.1529412, 1,
-0.4063437, -0.2532686, -2.722387, 0, 1, 0.1607843, 1,
-0.4009184, -0.4942602, -2.210599, 0, 1, 0.1647059, 1,
-0.3959399, 1.251473, 0.6913677, 0, 1, 0.172549, 1,
-0.3942149, 0.05443805, -0.2209618, 0, 1, 0.1764706, 1,
-0.3923657, -1.365265, -4.010257, 0, 1, 0.1843137, 1,
-0.3923298, 1.145891, -0.3163942, 0, 1, 0.1882353, 1,
-0.3910438, 0.6014361, -0.3970407, 0, 1, 0.1960784, 1,
-0.3904316, 0.3616266, -0.3773461, 0, 1, 0.2039216, 1,
-0.387282, -1.41149, -2.389069, 0, 1, 0.2078431, 1,
-0.3833392, 1.11518, 1.205365, 0, 1, 0.2156863, 1,
-0.3797819, -0.5191062, -1.513795, 0, 1, 0.2196078, 1,
-0.3718712, -0.7826898, -2.689139, 0, 1, 0.227451, 1,
-0.3623571, -0.021464, -1.503275, 0, 1, 0.2313726, 1,
-0.3617881, 0.2907302, -1.765804, 0, 1, 0.2392157, 1,
-0.3611253, 0.751343, 1.643041, 0, 1, 0.2431373, 1,
-0.3602178, -1.058166, -2.206225, 0, 1, 0.2509804, 1,
-0.3587752, 1.914208, -1.543176, 0, 1, 0.254902, 1,
-0.3561924, 2.423075, -1.548576, 0, 1, 0.2627451, 1,
-0.3487216, -0.9057916, -2.584651, 0, 1, 0.2666667, 1,
-0.3444947, -0.8097034, -3.833575, 0, 1, 0.2745098, 1,
-0.3414429, -0.1986858, -1.35185, 0, 1, 0.2784314, 1,
-0.3384998, -0.3101178, -2.480806, 0, 1, 0.2862745, 1,
-0.3374245, 1.505545, -0.03566489, 0, 1, 0.2901961, 1,
-0.3344206, -0.4377871, -3.171983, 0, 1, 0.2980392, 1,
-0.3338318, -0.7472872, -2.336515, 0, 1, 0.3058824, 1,
-0.3334209, 1.117978, -1.230708, 0, 1, 0.3098039, 1,
-0.324377, 0.3299267, -0.8421018, 0, 1, 0.3176471, 1,
-0.3218912, 1.345593, 0.4687703, 0, 1, 0.3215686, 1,
-0.3218394, 0.5619264, -0.3464864, 0, 1, 0.3294118, 1,
-0.3191668, 0.3349844, -0.7472941, 0, 1, 0.3333333, 1,
-0.3116638, -1.135039, -2.288765, 0, 1, 0.3411765, 1,
-0.3106524, -0.4290903, -1.623726, 0, 1, 0.345098, 1,
-0.304515, 0.5185985, 0.6486151, 0, 1, 0.3529412, 1,
-0.3024302, 0.7689447, -1.072904, 0, 1, 0.3568628, 1,
-0.3020583, 0.1297634, -0.3240723, 0, 1, 0.3647059, 1,
-0.2991858, -1.184381, -1.656076, 0, 1, 0.3686275, 1,
-0.2861686, -0.4255878, -1.598684, 0, 1, 0.3764706, 1,
-0.2855865, 1.216341, -0.5986128, 0, 1, 0.3803922, 1,
-0.2832852, -0.05742579, -0.6586258, 0, 1, 0.3882353, 1,
-0.2771115, 1.494892, -0.5649008, 0, 1, 0.3921569, 1,
-0.2764854, -1.438461, -2.287135, 0, 1, 0.4, 1,
-0.2749003, 0.176364, -1.413248, 0, 1, 0.4078431, 1,
-0.2745988, 0.9246252, -0.3081154, 0, 1, 0.4117647, 1,
-0.2720805, -0.07848522, -1.972519, 0, 1, 0.4196078, 1,
-0.2671326, -0.4209139, -5.702852, 0, 1, 0.4235294, 1,
-0.2593133, 0.02549405, -2.573554, 0, 1, 0.4313726, 1,
-0.2552513, 0.8975539, -0.4047098, 0, 1, 0.4352941, 1,
-0.2447939, -2.176514, -3.493798, 0, 1, 0.4431373, 1,
-0.241326, 1.173804, -0.1509359, 0, 1, 0.4470588, 1,
-0.2410667, -0.2288557, -1.377905, 0, 1, 0.454902, 1,
-0.2388417, 0.7959483, -0.3366794, 0, 1, 0.4588235, 1,
-0.2372389, -0.2392277, -3.699955, 0, 1, 0.4666667, 1,
-0.2361182, 0.4004403, 0.01630091, 0, 1, 0.4705882, 1,
-0.2333435, 1.895623, 0.9634455, 0, 1, 0.4784314, 1,
-0.2320926, -2.03846, -1.655052, 0, 1, 0.4823529, 1,
-0.231468, 1.999145, -0.6574602, 0, 1, 0.4901961, 1,
-0.2269488, -1.632218, -3.412408, 0, 1, 0.4941176, 1,
-0.2260029, 0.186711, 0.8229018, 0, 1, 0.5019608, 1,
-0.224304, -0.3289606, -2.854201, 0, 1, 0.509804, 1,
-0.216362, -1.02555, -2.26022, 0, 1, 0.5137255, 1,
-0.2100955, -0.647278, -0.7601065, 0, 1, 0.5215687, 1,
-0.2090489, 1.337545, -0.9640412, 0, 1, 0.5254902, 1,
-0.2078677, -0.5417214, -1.048156, 0, 1, 0.5333334, 1,
-0.2056682, 0.7441154, -0.5500214, 0, 1, 0.5372549, 1,
-0.2032295, 2.581402, 0.3414162, 0, 1, 0.5450981, 1,
-0.2028814, 0.4473929, 0.3739513, 0, 1, 0.5490196, 1,
-0.2019, -0.3896536, -2.915419, 0, 1, 0.5568628, 1,
-0.1949859, 0.8034936, 1.363241, 0, 1, 0.5607843, 1,
-0.1859485, -0.8094103, -3.000842, 0, 1, 0.5686275, 1,
-0.181097, -0.3877395, -3.784019, 0, 1, 0.572549, 1,
-0.1767859, 0.1626978, -2.536334, 0, 1, 0.5803922, 1,
-0.1673097, 0.4977525, -2.487092, 0, 1, 0.5843138, 1,
-0.1672468, 0.3069276, -0.5551978, 0, 1, 0.5921569, 1,
-0.1665854, 1.568324, -0.329404, 0, 1, 0.5960785, 1,
-0.1654666, 0.8952417, -0.0647549, 0, 1, 0.6039216, 1,
-0.1652911, 0.0794198, -0.01880638, 0, 1, 0.6117647, 1,
-0.1643538, -0.300052, -3.742836, 0, 1, 0.6156863, 1,
-0.1633585, 0.2575411, -0.03910043, 0, 1, 0.6235294, 1,
-0.1615165, -2.104955, -3.632641, 0, 1, 0.627451, 1,
-0.1606432, 0.7930065, 0.8980262, 0, 1, 0.6352941, 1,
-0.1605134, 0.2952572, -1.491438, 0, 1, 0.6392157, 1,
-0.1596052, -1.815115, -3.341175, 0, 1, 0.6470588, 1,
-0.1551909, -1.277979, -1.892601, 0, 1, 0.6509804, 1,
-0.146473, 0.327686, 0.9326732, 0, 1, 0.6588235, 1,
-0.1458387, 2.288442, 0.5150769, 0, 1, 0.6627451, 1,
-0.1438815, -0.374826, -2.271992, 0, 1, 0.6705883, 1,
-0.1339541, 0.5608648, -1.304728, 0, 1, 0.6745098, 1,
-0.133744, -0.8953454, -1.859467, 0, 1, 0.682353, 1,
-0.1285711, -1.102645, -2.080786, 0, 1, 0.6862745, 1,
-0.1085587, 0.2056913, -0.731528, 0, 1, 0.6941177, 1,
-0.1058026, 0.3935063, -0.9677391, 0, 1, 0.7019608, 1,
-0.1027661, -0.7153189, -3.154807, 0, 1, 0.7058824, 1,
-0.1014507, 0.01431413, -0.4522015, 0, 1, 0.7137255, 1,
-0.09994306, -1.273893, -3.315033, 0, 1, 0.7176471, 1,
-0.09942673, -0.4198143, -0.9868781, 0, 1, 0.7254902, 1,
-0.09869144, 0.2806683, 0.1040029, 0, 1, 0.7294118, 1,
-0.09630196, -0.7556844, -2.71261, 0, 1, 0.7372549, 1,
-0.09212244, 0.2316018, -1.986376, 0, 1, 0.7411765, 1,
-0.09192967, 0.384629, -0.03052696, 0, 1, 0.7490196, 1,
-0.08924274, 0.9082408, 0.4201455, 0, 1, 0.7529412, 1,
-0.08864062, -0.4014725, -4.473058, 0, 1, 0.7607843, 1,
-0.08619183, 2.081826, -1.300889, 0, 1, 0.7647059, 1,
-0.08081023, -1.503782, -2.996062, 0, 1, 0.772549, 1,
-0.07787362, -0.006973621, -2.773797, 0, 1, 0.7764706, 1,
-0.07421084, -0.3753127, -3.435799, 0, 1, 0.7843137, 1,
-0.07173943, 0.1014046, 0.8106987, 0, 1, 0.7882353, 1,
-0.06263199, -0.7812491, -3.239711, 0, 1, 0.7960784, 1,
-0.06240584, -2.594543, -3.688883, 0, 1, 0.8039216, 1,
-0.06226002, -1.224367, -4.061309, 0, 1, 0.8078431, 1,
-0.05823564, -0.01816599, -1.318624, 0, 1, 0.8156863, 1,
-0.04604232, 0.4253246, -0.256648, 0, 1, 0.8196079, 1,
-0.04382822, -0.3775487, -3.174943, 0, 1, 0.827451, 1,
-0.0431926, 0.84678, 1.254776, 0, 1, 0.8313726, 1,
-0.0358679, 1.595047, 1.096964, 0, 1, 0.8392157, 1,
-0.03503443, -0.3462229, -4.035984, 0, 1, 0.8431373, 1,
-0.03246292, 0.7271612, -0.8495179, 0, 1, 0.8509804, 1,
-0.03103272, 0.7749467, -1.391587, 0, 1, 0.854902, 1,
-0.03077698, -1.945906, -4.458361, 0, 1, 0.8627451, 1,
-0.027034, 0.5558085, -0.6081468, 0, 1, 0.8666667, 1,
-0.02522235, -0.3215927, -3.075945, 0, 1, 0.8745098, 1,
-0.02394287, -0.7469263, -3.218898, 0, 1, 0.8784314, 1,
-0.0219433, -0.7932414, -2.973397, 0, 1, 0.8862745, 1,
-0.02107044, 1.062424, 1.170642, 0, 1, 0.8901961, 1,
-0.01659187, 2.27667, 0.9777476, 0, 1, 0.8980392, 1,
-0.0148145, -1.367639, -1.877203, 0, 1, 0.9058824, 1,
-0.01409236, -1.270697, -3.213617, 0, 1, 0.9098039, 1,
-0.01098892, -0.02287176, -4.815311, 0, 1, 0.9176471, 1,
-0.007742449, -0.3908223, -1.185463, 0, 1, 0.9215686, 1,
-0.007518723, 0.7900206, -0.02488216, 0, 1, 0.9294118, 1,
-0.005533822, 0.5240673, -0.7619706, 0, 1, 0.9333333, 1,
0.0003866131, 0.03196177, -0.2971934, 0, 1, 0.9411765, 1,
0.0008701, -2.687893, 1.186952, 0, 1, 0.945098, 1,
0.00518467, 0.2263255, -0.3847306, 0, 1, 0.9529412, 1,
0.007493118, 2.175848, 0.698688, 0, 1, 0.9568627, 1,
0.007571761, 0.5232955, 1.330377, 0, 1, 0.9647059, 1,
0.008663001, -0.2411997, 3.347003, 0, 1, 0.9686275, 1,
0.008919357, 0.3609539, 0.2455309, 0, 1, 0.9764706, 1,
0.009623406, 0.00286489, 1.665581, 0, 1, 0.9803922, 1,
0.01213923, -1.030253, 1.571334, 0, 1, 0.9882353, 1,
0.01251548, 0.02702225, 0.894457, 0, 1, 0.9921569, 1,
0.01304864, 1.335711, 0.9846176, 0, 1, 1, 1,
0.01362503, -1.348116, 2.35625, 0, 0.9921569, 1, 1,
0.01446664, 1.382769, -1.108586, 0, 0.9882353, 1, 1,
0.01473579, 1.012586, -0.7066889, 0, 0.9803922, 1, 1,
0.01511636, 0.4492746, -1.658923, 0, 0.9764706, 1, 1,
0.01556975, 1.164235, -0.2822357, 0, 0.9686275, 1, 1,
0.01905619, 0.1567785, 0.003253399, 0, 0.9647059, 1, 1,
0.02166378, 1.05841, 0.4606322, 0, 0.9568627, 1, 1,
0.02213855, 1.043811, -0.6640384, 0, 0.9529412, 1, 1,
0.02433085, -0.9748982, 2.076947, 0, 0.945098, 1, 1,
0.0251882, 1.253005, 0.4819531, 0, 0.9411765, 1, 1,
0.0260768, -0.9885199, 3.100268, 0, 0.9333333, 1, 1,
0.02938916, 1.076734, 0.6857091, 0, 0.9294118, 1, 1,
0.02943367, -0.001783569, 0.8598216, 0, 0.9215686, 1, 1,
0.03511866, 0.5151088, 0.3563909, 0, 0.9176471, 1, 1,
0.03699486, -1.253868, 3.728877, 0, 0.9098039, 1, 1,
0.03777746, 0.9620546, -1.639454, 0, 0.9058824, 1, 1,
0.03995002, 0.4005359, 0.1482931, 0, 0.8980392, 1, 1,
0.04075651, 2.535951, 1.013027, 0, 0.8901961, 1, 1,
0.04585078, -1.117715, 4.684391, 0, 0.8862745, 1, 1,
0.04636401, 1.797665, 1.234516, 0, 0.8784314, 1, 1,
0.04708286, 0.6078021, 0.221676, 0, 0.8745098, 1, 1,
0.04839906, 0.2094599, 0.6113744, 0, 0.8666667, 1, 1,
0.04896808, -1.485525, 1.314975, 0, 0.8627451, 1, 1,
0.05167563, -1.099984, 4.485513, 0, 0.854902, 1, 1,
0.05272084, -0.7419261, 3.049264, 0, 0.8509804, 1, 1,
0.05454094, 1.428171, 1.834146, 0, 0.8431373, 1, 1,
0.05808549, -0.8564034, 2.435026, 0, 0.8392157, 1, 1,
0.05879762, 1.227141, -0.3421912, 0, 0.8313726, 1, 1,
0.05894352, -0.0303819, 3.375945, 0, 0.827451, 1, 1,
0.0589631, 2.384176, -0.8607627, 0, 0.8196079, 1, 1,
0.06073236, 0.7216185, 1.183275, 0, 0.8156863, 1, 1,
0.0670021, -1.010487, 3.072482, 0, 0.8078431, 1, 1,
0.06862187, -0.8458012, 3.637695, 0, 0.8039216, 1, 1,
0.07762159, -1.610956, 3.434882, 0, 0.7960784, 1, 1,
0.07866447, -0.4727026, 0.6651258, 0, 0.7882353, 1, 1,
0.08026034, -0.7956863, 2.643901, 0, 0.7843137, 1, 1,
0.08052861, 0.3140313, -1.023684, 0, 0.7764706, 1, 1,
0.08361579, -0.2892178, 2.508979, 0, 0.772549, 1, 1,
0.08558173, 0.5261365, -0.5369791, 0, 0.7647059, 1, 1,
0.08697494, 2.040629, 1.077297, 0, 0.7607843, 1, 1,
0.09031818, -0.490724, 3.057566, 0, 0.7529412, 1, 1,
0.09259515, -1.028215, 2.996883, 0, 0.7490196, 1, 1,
0.0954155, 0.8888192, -0.2656467, 0, 0.7411765, 1, 1,
0.09560601, -1.019475, 1.765856, 0, 0.7372549, 1, 1,
0.101238, -0.7657552, 3.161754, 0, 0.7294118, 1, 1,
0.1019488, -1.26335, 3.036101, 0, 0.7254902, 1, 1,
0.1046266, 1.422816, 1.357558, 0, 0.7176471, 1, 1,
0.1056762, 0.5750019, 0.8444086, 0, 0.7137255, 1, 1,
0.1191822, -0.7200027, 4.000137, 0, 0.7058824, 1, 1,
0.1204552, -0.9344673, 2.12192, 0, 0.6980392, 1, 1,
0.1236685, 0.000780075, 1.972059, 0, 0.6941177, 1, 1,
0.124078, -0.28473, 2.016888, 0, 0.6862745, 1, 1,
0.1248075, 0.192095, 0.1253437, 0, 0.682353, 1, 1,
0.1269163, 1.985555, 0.05320823, 0, 0.6745098, 1, 1,
0.129012, -0.470386, 3.422023, 0, 0.6705883, 1, 1,
0.1308863, -0.2519019, 3.863498, 0, 0.6627451, 1, 1,
0.1350321, -0.2536133, 3.142896, 0, 0.6588235, 1, 1,
0.1354993, -1.210086, 3.980255, 0, 0.6509804, 1, 1,
0.1385972, 1.0022, 0.01959561, 0, 0.6470588, 1, 1,
0.141842, 1.366493, 0.8453185, 0, 0.6392157, 1, 1,
0.1448457, -0.5302425, 2.218201, 0, 0.6352941, 1, 1,
0.1448785, 0.8977767, 1.225989, 0, 0.627451, 1, 1,
0.1456519, -0.7975271, 4.275886, 0, 0.6235294, 1, 1,
0.1459138, 0.4237364, -0.5083616, 0, 0.6156863, 1, 1,
0.1468215, 0.4672114, -0.6881596, 0, 0.6117647, 1, 1,
0.1488537, -0.1153648, 2.501525, 0, 0.6039216, 1, 1,
0.153874, 2.309859, -0.9048243, 0, 0.5960785, 1, 1,
0.1550421, -1.512814, 3.590635, 0, 0.5921569, 1, 1,
0.1650331, -0.059706, 1.895716, 0, 0.5843138, 1, 1,
0.1653307, 0.2283481, 0.2928853, 0, 0.5803922, 1, 1,
0.1654819, 0.149656, 0.6430426, 0, 0.572549, 1, 1,
0.1659629, -1.807992, 2.664018, 0, 0.5686275, 1, 1,
0.1689649, 1.12028, 1.699893, 0, 0.5607843, 1, 1,
0.1716154, 0.8519367, 1.298284, 0, 0.5568628, 1, 1,
0.1768737, -0.3932506, 3.634745, 0, 0.5490196, 1, 1,
0.17948, -0.7382012, 3.252638, 0, 0.5450981, 1, 1,
0.1795898, -0.5249057, 2.579968, 0, 0.5372549, 1, 1,
0.1811683, 1.231347, -1.817799, 0, 0.5333334, 1, 1,
0.1894924, 0.2611568, -1.685459, 0, 0.5254902, 1, 1,
0.1899358, -0.6165298, 1.288757, 0, 0.5215687, 1, 1,
0.1926716, 0.3861469, 1.361736, 0, 0.5137255, 1, 1,
0.1954433, -0.328818, 3.243113, 0, 0.509804, 1, 1,
0.1979939, -0.6503208, 3.932626, 0, 0.5019608, 1, 1,
0.1989942, 0.7671668, 0.1232529, 0, 0.4941176, 1, 1,
0.2052761, -1.695527, 3.139537, 0, 0.4901961, 1, 1,
0.2097702, 1.198744, -0.3651187, 0, 0.4823529, 1, 1,
0.2137336, -0.07391915, 1.869713, 0, 0.4784314, 1, 1,
0.2154711, 1.545263, 0.6390698, 0, 0.4705882, 1, 1,
0.2204588, -0.2285165, 3.124109, 0, 0.4666667, 1, 1,
0.2288872, 0.5396088, -0.9488636, 0, 0.4588235, 1, 1,
0.229073, 0.04745344, 0.1080852, 0, 0.454902, 1, 1,
0.230636, 1.331308, 0.9105099, 0, 0.4470588, 1, 1,
0.2325861, -0.0003855197, 0.2796684, 0, 0.4431373, 1, 1,
0.2331722, -1.014177, 2.942462, 0, 0.4352941, 1, 1,
0.234428, -0.1827909, 2.267768, 0, 0.4313726, 1, 1,
0.2357549, 0.1848309, 0.859252, 0, 0.4235294, 1, 1,
0.2364738, -0.7639011, 0.08297986, 0, 0.4196078, 1, 1,
0.2407508, -0.5730913, 2.469468, 0, 0.4117647, 1, 1,
0.2415338, -0.5306017, 2.063292, 0, 0.4078431, 1, 1,
0.2416529, 0.2363288, 1.626671, 0, 0.4, 1, 1,
0.2448806, -0.3813516, 1.753791, 0, 0.3921569, 1, 1,
0.2500218, 0.5435236, -0.6647187, 0, 0.3882353, 1, 1,
0.2542934, -3.093051, 4.452436, 0, 0.3803922, 1, 1,
0.2543836, -0.2313285, 4.16037, 0, 0.3764706, 1, 1,
0.2636486, 0.3126568, -1.347133, 0, 0.3686275, 1, 1,
0.2652978, 0.5110869, 1.060046, 0, 0.3647059, 1, 1,
0.2676685, -1.50691, 3.276158, 0, 0.3568628, 1, 1,
0.2695661, 0.5506996, 1.605852, 0, 0.3529412, 1, 1,
0.2712196, 1.249293, -0.955474, 0, 0.345098, 1, 1,
0.2752403, -0.5812728, 1.402862, 0, 0.3411765, 1, 1,
0.2785814, 1.038211, -0.6003954, 0, 0.3333333, 1, 1,
0.2807672, -0.1629051, 3.184376, 0, 0.3294118, 1, 1,
0.281109, 0.574489, -0.3935295, 0, 0.3215686, 1, 1,
0.2814038, 1.684928, 2.650567, 0, 0.3176471, 1, 1,
0.2834455, 1.740691, -0.02149392, 0, 0.3098039, 1, 1,
0.2864374, -0.9852934, 2.287086, 0, 0.3058824, 1, 1,
0.2921616, -1.285438, 2.659874, 0, 0.2980392, 1, 1,
0.2971677, 1.908878, -2.562228, 0, 0.2901961, 1, 1,
0.2974434, -1.503349, 1.654241, 0, 0.2862745, 1, 1,
0.2994963, 1.133924, -0.1405195, 0, 0.2784314, 1, 1,
0.3015689, 0.3434036, 1.554296, 0, 0.2745098, 1, 1,
0.3023862, 0.7479699, 0.412944, 0, 0.2666667, 1, 1,
0.3024952, 0.9410526, 0.6259562, 0, 0.2627451, 1, 1,
0.3065563, 0.2008998, 2.45613, 0, 0.254902, 1, 1,
0.3082964, -0.9979165, 3.336714, 0, 0.2509804, 1, 1,
0.3104195, -0.3981597, 2.215149, 0, 0.2431373, 1, 1,
0.3117265, 1.572542, -0.2368457, 0, 0.2392157, 1, 1,
0.3153254, -0.1122395, 0.09152855, 0, 0.2313726, 1, 1,
0.3165852, -0.9521062, 3.680525, 0, 0.227451, 1, 1,
0.319286, -1.663038, 4.440049, 0, 0.2196078, 1, 1,
0.3256349, 2.220773, 0.9437858, 0, 0.2156863, 1, 1,
0.3266574, -0.2047865, 0.6583709, 0, 0.2078431, 1, 1,
0.327665, -0.6929535, 1.047913, 0, 0.2039216, 1, 1,
0.3285096, 0.4665804, 0.7279568, 0, 0.1960784, 1, 1,
0.331683, 1.352861, -1.340038, 0, 0.1882353, 1, 1,
0.3317746, 3.93703, -1.747422, 0, 0.1843137, 1, 1,
0.3322054, 0.3488266, 1.104407, 0, 0.1764706, 1, 1,
0.3382552, 1.510864, 0.1321014, 0, 0.172549, 1, 1,
0.3415717, -0.6448193, 2.475602, 0, 0.1647059, 1, 1,
0.3416499, 0.565144, 0.1986177, 0, 0.1607843, 1, 1,
0.3420037, 0.9179874, -0.5056686, 0, 0.1529412, 1, 1,
0.3471559, 0.12249, 2.009731, 0, 0.1490196, 1, 1,
0.3489946, -0.5845484, 3.767302, 0, 0.1411765, 1, 1,
0.3515113, 0.1166629, 3.485251, 0, 0.1372549, 1, 1,
0.3541799, 1.638074, 0.06020519, 0, 0.1294118, 1, 1,
0.356848, -1.163809, 2.792702, 0, 0.1254902, 1, 1,
0.3604338, -0.8922738, 3.756592, 0, 0.1176471, 1, 1,
0.3620445, -0.8310373, 1.807425, 0, 0.1137255, 1, 1,
0.3668876, 1.032522, 0.6293714, 0, 0.1058824, 1, 1,
0.3668946, 0.6861685, 1.149988, 0, 0.09803922, 1, 1,
0.3675171, -0.09614437, 3.691586, 0, 0.09411765, 1, 1,
0.368652, 0.9160773, 0.7326944, 0, 0.08627451, 1, 1,
0.3689129, -0.2558323, 1.79572, 0, 0.08235294, 1, 1,
0.3727972, 0.3549843, -0.22578, 0, 0.07450981, 1, 1,
0.3766996, 0.2725248, 1.572397, 0, 0.07058824, 1, 1,
0.3784774, -0.3130647, 4.523427, 0, 0.0627451, 1, 1,
0.3820249, 1.820165, 2.830665, 0, 0.05882353, 1, 1,
0.3850277, 1.026672, 0.02449353, 0, 0.05098039, 1, 1,
0.3855363, -3.693345, 3.130012, 0, 0.04705882, 1, 1,
0.3897547, 0.309635, 1.017842, 0, 0.03921569, 1, 1,
0.3975083, 0.6155461, -0.4887714, 0, 0.03529412, 1, 1,
0.3993056, 0.8991747, 0.5938846, 0, 0.02745098, 1, 1,
0.4001652, 1.020721, 0.01836258, 0, 0.02352941, 1, 1,
0.4058564, 1.531682, -0.1892025, 0, 0.01568628, 1, 1,
0.4070016, -0.3194428, 2.021876, 0, 0.01176471, 1, 1,
0.4092173, 0.7911879, 1.914483, 0, 0.003921569, 1, 1,
0.4134369, 0.1685094, 0.1427979, 0.003921569, 0, 1, 1,
0.4145326, -1.570666, 2.786113, 0.007843138, 0, 1, 1,
0.41519, -0.6538319, 1.597853, 0.01568628, 0, 1, 1,
0.4164886, 0.03583018, 1.176036, 0.01960784, 0, 1, 1,
0.4174549, -0.08717397, 1.750642, 0.02745098, 0, 1, 1,
0.422897, -0.1317906, 0.1675149, 0.03137255, 0, 1, 1,
0.4258939, -0.9334426, 3.019799, 0.03921569, 0, 1, 1,
0.426038, -0.2275734, 2.978838, 0.04313726, 0, 1, 1,
0.4331651, 0.1134411, 0.9927393, 0.05098039, 0, 1, 1,
0.4348322, 0.1359713, 1.638237, 0.05490196, 0, 1, 1,
0.4362933, -0.2653112, 2.414176, 0.0627451, 0, 1, 1,
0.4382131, 0.8038575, 0.5837424, 0.06666667, 0, 1, 1,
0.4418653, -0.3972335, 3.080017, 0.07450981, 0, 1, 1,
0.4476891, 1.082801, 1.347086, 0.07843138, 0, 1, 1,
0.4483249, 1.213352, -0.1303377, 0.08627451, 0, 1, 1,
0.4486833, 0.17953, 0.05355907, 0.09019608, 0, 1, 1,
0.4502369, 0.6408347, 1.946972, 0.09803922, 0, 1, 1,
0.4570942, 0.2944816, 0.4151926, 0.1058824, 0, 1, 1,
0.4599499, 1.201052, 0.7663314, 0.1098039, 0, 1, 1,
0.4632566, -0.3703496, 2.815688, 0.1176471, 0, 1, 1,
0.4648028, 0.3084599, 2.023572, 0.1215686, 0, 1, 1,
0.4651507, 0.3801611, -0.6585097, 0.1294118, 0, 1, 1,
0.46752, -0.3127019, 1.743282, 0.1333333, 0, 1, 1,
0.4720775, 0.6274871, 1.22282, 0.1411765, 0, 1, 1,
0.4766982, -0.04060655, 2.486065, 0.145098, 0, 1, 1,
0.4834397, -0.2463153, 1.76795, 0.1529412, 0, 1, 1,
0.4845893, -1.017937, 3.132257, 0.1568628, 0, 1, 1,
0.4895071, -2.250112, 2.719005, 0.1647059, 0, 1, 1,
0.4901919, -1.199456, 3.953741, 0.1686275, 0, 1, 1,
0.4973432, -1.762242, 3.831068, 0.1764706, 0, 1, 1,
0.5018197, -1.767658, 3.014808, 0.1803922, 0, 1, 1,
0.5018914, 0.6647212, 1.044061, 0.1882353, 0, 1, 1,
0.501919, 0.7097521, -0.264001, 0.1921569, 0, 1, 1,
0.5037119, 1.034313, 0.5135121, 0.2, 0, 1, 1,
0.5055839, -0.1244185, 2.254949, 0.2078431, 0, 1, 1,
0.5061762, 0.3378748, 1.318004, 0.2117647, 0, 1, 1,
0.5085379, -1.353475, 2.513707, 0.2196078, 0, 1, 1,
0.5114916, 1.005504, -1.199801, 0.2235294, 0, 1, 1,
0.5202173, 0.02018617, 1.892731, 0.2313726, 0, 1, 1,
0.5239988, -1.282791, 2.455888, 0.2352941, 0, 1, 1,
0.5268393, -1.212791, 1.559059, 0.2431373, 0, 1, 1,
0.5269763, 1.664474, 1.011426, 0.2470588, 0, 1, 1,
0.5285928, -0.1471823, 1.747568, 0.254902, 0, 1, 1,
0.5287151, 0.8722512, -0.7671907, 0.2588235, 0, 1, 1,
0.5293589, 0.4020473, 0.6252639, 0.2666667, 0, 1, 1,
0.5303289, -0.02207467, 2.131552, 0.2705882, 0, 1, 1,
0.5318475, 0.9189228, 0.5813704, 0.2784314, 0, 1, 1,
0.5340618, -1.799847, 1.527614, 0.282353, 0, 1, 1,
0.5386975, 0.1245707, -0.3731006, 0.2901961, 0, 1, 1,
0.546795, 0.2981487, 1.442439, 0.2941177, 0, 1, 1,
0.5500751, 1.496446, 0.1431588, 0.3019608, 0, 1, 1,
0.5520328, -0.07456148, 1.878767, 0.3098039, 0, 1, 1,
0.555122, -1.265592, 1.837994, 0.3137255, 0, 1, 1,
0.556451, -0.5161625, 2.294827, 0.3215686, 0, 1, 1,
0.5571645, -0.1265119, 0.1977454, 0.3254902, 0, 1, 1,
0.5591748, 1.197137, 0.3126816, 0.3333333, 0, 1, 1,
0.5600787, -1.625943, 2.87448, 0.3372549, 0, 1, 1,
0.5695863, 0.5358428, 1.477846, 0.345098, 0, 1, 1,
0.5732831, 0.1091903, 2.545648, 0.3490196, 0, 1, 1,
0.5768321, 1.17807, 0.8392825, 0.3568628, 0, 1, 1,
0.5782437, -0.8776147, 1.737529, 0.3607843, 0, 1, 1,
0.5820074, -1.628584, 4.01387, 0.3686275, 0, 1, 1,
0.5828819, 1.141021, 1.30556, 0.372549, 0, 1, 1,
0.5833876, -0.4048747, 4.848278, 0.3803922, 0, 1, 1,
0.5862762, 1.49115, -0.2954235, 0.3843137, 0, 1, 1,
0.5893984, -1.427434, 2.458081, 0.3921569, 0, 1, 1,
0.5896727, -1.393027, 2.431561, 0.3960784, 0, 1, 1,
0.5936228, -0.9578, 1.876988, 0.4039216, 0, 1, 1,
0.593958, -0.389414, 0.2851268, 0.4117647, 0, 1, 1,
0.5994918, -0.548695, 2.751693, 0.4156863, 0, 1, 1,
0.6003993, 0.126833, 2.252531, 0.4235294, 0, 1, 1,
0.6026372, -0.853205, 3.393425, 0.427451, 0, 1, 1,
0.6063617, -1.397584, 2.318812, 0.4352941, 0, 1, 1,
0.6099665, 2.355491, -0.4451598, 0.4392157, 0, 1, 1,
0.6102947, 0.595434, -1.137249, 0.4470588, 0, 1, 1,
0.6147308, -0.06953412, 0.668282, 0.4509804, 0, 1, 1,
0.6148959, -0.5340737, 1.572035, 0.4588235, 0, 1, 1,
0.6156354, 0.1090762, 1.099468, 0.4627451, 0, 1, 1,
0.6195324, -0.1307222, 2.131367, 0.4705882, 0, 1, 1,
0.6214835, -0.8950297, 3.861671, 0.4745098, 0, 1, 1,
0.6240348, -0.6032932, 2.947387, 0.4823529, 0, 1, 1,
0.6240912, -0.2863613, 1.802494, 0.4862745, 0, 1, 1,
0.6242302, 0.003626327, 0.59979, 0.4941176, 0, 1, 1,
0.6298442, -1.23336, 2.951412, 0.5019608, 0, 1, 1,
0.631654, 0.3371644, 0.8554353, 0.5058824, 0, 1, 1,
0.6371046, -1.451825, 3.956374, 0.5137255, 0, 1, 1,
0.6447644, 0.1090297, 1.856879, 0.5176471, 0, 1, 1,
0.6462381, -0.5596548, 1.912325, 0.5254902, 0, 1, 1,
0.6477584, 1.148596, 1.285046, 0.5294118, 0, 1, 1,
0.6495938, -0.1668678, 0.3427912, 0.5372549, 0, 1, 1,
0.650708, -1.192541, 1.392659, 0.5411765, 0, 1, 1,
0.6513634, -0.9815139, 2.285431, 0.5490196, 0, 1, 1,
0.6515355, 0.2133993, 1.207342, 0.5529412, 0, 1, 1,
0.6540072, -1.189184, 4.544443, 0.5607843, 0, 1, 1,
0.6552443, -0.7404245, 1.528906, 0.5647059, 0, 1, 1,
0.655845, 0.6696221, -1.080825, 0.572549, 0, 1, 1,
0.6581029, -0.05314475, 0.6483112, 0.5764706, 0, 1, 1,
0.6584053, -0.107849, 2.19197, 0.5843138, 0, 1, 1,
0.6593735, 0.3380321, 2.174477, 0.5882353, 0, 1, 1,
0.6594101, 1.104199, -1.007101, 0.5960785, 0, 1, 1,
0.6639541, -0.7300831, 1.313834, 0.6039216, 0, 1, 1,
0.6649328, 0.3571828, 0.007024369, 0.6078432, 0, 1, 1,
0.6681661, -1.360858, 3.715582, 0.6156863, 0, 1, 1,
0.6693975, 0.5443234, 1.055286, 0.6196079, 0, 1, 1,
0.6729495, -2.182039, 2.401636, 0.627451, 0, 1, 1,
0.6751397, 1.063502, 1.797538, 0.6313726, 0, 1, 1,
0.6765024, 0.4193567, 0.8192992, 0.6392157, 0, 1, 1,
0.6848598, 0.7057652, 0.7006261, 0.6431373, 0, 1, 1,
0.6895884, 0.159411, 2.10044, 0.6509804, 0, 1, 1,
0.6909549, 0.3436342, 1.051703, 0.654902, 0, 1, 1,
0.6939953, 1.072388, 0.1826306, 0.6627451, 0, 1, 1,
0.6996685, 0.2175672, 3.081608, 0.6666667, 0, 1, 1,
0.7048153, 0.515739, 1.02365, 0.6745098, 0, 1, 1,
0.7110684, -0.5506894, 1.655062, 0.6784314, 0, 1, 1,
0.7113094, 0.7580275, -0.1685759, 0.6862745, 0, 1, 1,
0.7134324, -0.1098898, 4.200172, 0.6901961, 0, 1, 1,
0.7195168, 0.8604523, 1.074742, 0.6980392, 0, 1, 1,
0.7315143, -0.7486697, 1.396982, 0.7058824, 0, 1, 1,
0.7400988, 1.256415, -0.02377352, 0.7098039, 0, 1, 1,
0.7476182, 0.2771414, 0.6648135, 0.7176471, 0, 1, 1,
0.7478495, -0.662066, 2.826459, 0.7215686, 0, 1, 1,
0.7487104, -0.7237884, 0.2296134, 0.7294118, 0, 1, 1,
0.7545696, -1.528174, 3.178752, 0.7333333, 0, 1, 1,
0.7567397, 1.805972, -0.6334119, 0.7411765, 0, 1, 1,
0.760807, -1.180705, 3.218388, 0.7450981, 0, 1, 1,
0.7668843, -0.7974539, 0.7917575, 0.7529412, 0, 1, 1,
0.7735538, -0.09142599, 1.57106, 0.7568628, 0, 1, 1,
0.7774706, 1.57542, 1.332395, 0.7647059, 0, 1, 1,
0.779647, -0.113908, 1.84732, 0.7686275, 0, 1, 1,
0.7827198, 0.6745433, 0.9397602, 0.7764706, 0, 1, 1,
0.7838235, 0.4464302, -0.06192757, 0.7803922, 0, 1, 1,
0.7871, 0.3729696, 0.6483809, 0.7882353, 0, 1, 1,
0.7897973, 0.1574206, -0.004411868, 0.7921569, 0, 1, 1,
0.7945009, 1.600873, 1.706483, 0.8, 0, 1, 1,
0.7994702, -0.4985984, 2.092435, 0.8078431, 0, 1, 1,
0.7994739, -1.490313, 3.642975, 0.8117647, 0, 1, 1,
0.8018366, 1.034693, -0.3925975, 0.8196079, 0, 1, 1,
0.8045824, 0.9322484, 0.9837324, 0.8235294, 0, 1, 1,
0.8201114, -0.06380839, 0.6579269, 0.8313726, 0, 1, 1,
0.8207701, -0.1400121, 0.5301364, 0.8352941, 0, 1, 1,
0.8335723, -2.057564, 4.181551, 0.8431373, 0, 1, 1,
0.8349054, 0.492269, 2.33176, 0.8470588, 0, 1, 1,
0.8352548, 1.187066, 0.5777496, 0.854902, 0, 1, 1,
0.8414529, 0.4580296, -0.2478311, 0.8588235, 0, 1, 1,
0.8444995, -1.232918, 2.991901, 0.8666667, 0, 1, 1,
0.8488134, -1.504914, 3.608586, 0.8705882, 0, 1, 1,
0.8492696, 0.09498185, 4.287847, 0.8784314, 0, 1, 1,
0.8523642, 0.3133402, 0.2931072, 0.8823529, 0, 1, 1,
0.8527497, -0.08343775, 1.06158, 0.8901961, 0, 1, 1,
0.8531497, 0.7006636, 0.8531507, 0.8941177, 0, 1, 1,
0.8595227, 0.7974159, 1.370488, 0.9019608, 0, 1, 1,
0.8607579, -1.43991, 2.623787, 0.9098039, 0, 1, 1,
0.8625865, 0.9611277, 0.7482173, 0.9137255, 0, 1, 1,
0.8721415, 0.0861733, 3.51464, 0.9215686, 0, 1, 1,
0.8867859, 0.3450953, 1.493791, 0.9254902, 0, 1, 1,
0.8900917, 0.5172373, 0.1470656, 0.9333333, 0, 1, 1,
0.891629, -2.208218, 2.603238, 0.9372549, 0, 1, 1,
0.8952382, 0.03657716, 0.2029807, 0.945098, 0, 1, 1,
0.8954539, 0.1616123, 0.7895697, 0.9490196, 0, 1, 1,
0.8999503, -1.716293, 0.8015945, 0.9568627, 0, 1, 1,
0.9096527, 0.9574601, -2.383653, 0.9607843, 0, 1, 1,
0.9269481, 1.157628, 0.3093594, 0.9686275, 0, 1, 1,
0.9274171, -0.7883688, 0.3330422, 0.972549, 0, 1, 1,
0.9288986, 1.210057, 0.8275605, 0.9803922, 0, 1, 1,
0.9351584, 1.648474, -0.006051215, 0.9843137, 0, 1, 1,
0.9355954, 0.5463197, 0.2635665, 0.9921569, 0, 1, 1,
0.9358344, -0.4904579, -0.1034791, 0.9960784, 0, 1, 1,
0.9377866, -0.5788216, 2.792211, 1, 0, 0.9960784, 1,
0.9382346, -0.9994769, 0.8961024, 1, 0, 0.9882353, 1,
0.93847, 0.2849712, 1.346737, 1, 0, 0.9843137, 1,
0.9393879, -0.08421065, 1.508034, 1, 0, 0.9764706, 1,
0.9410231, -0.1806565, -0.3636011, 1, 0, 0.972549, 1,
0.941769, -1.701432, 3.54506, 1, 0, 0.9647059, 1,
0.9580777, 1.740122, 0.2734849, 1, 0, 0.9607843, 1,
0.962148, 0.5160128, 0.7639055, 1, 0, 0.9529412, 1,
0.962551, 0.1115386, 2.001864, 1, 0, 0.9490196, 1,
0.9735645, -0.8476523, 2.63578, 1, 0, 0.9411765, 1,
0.9817473, 0.2657259, -0.4552994, 1, 0, 0.9372549, 1,
0.9863656, 2.393469, 1.368024, 1, 0, 0.9294118, 1,
0.9893996, -0.8429955, 1.676277, 1, 0, 0.9254902, 1,
0.9923374, 1.008345, -0.3785221, 1, 0, 0.9176471, 1,
0.9944274, -0.514132, 0.4924142, 1, 0, 0.9137255, 1,
0.9980436, -1.392796, 0.9172124, 1, 0, 0.9058824, 1,
1.003204, -1.987837, 1.930643, 1, 0, 0.9019608, 1,
1.010597, 0.2284801, 1.350291, 1, 0, 0.8941177, 1,
1.018666, 0.5225186, 2.483638, 1, 0, 0.8862745, 1,
1.022524, 0.7639496, 2.931838, 1, 0, 0.8823529, 1,
1.023129, 0.3769905, 2.953509, 1, 0, 0.8745098, 1,
1.024179, 0.3601515, 1.737399, 1, 0, 0.8705882, 1,
1.029037, 0.2305678, 1.004296, 1, 0, 0.8627451, 1,
1.034201, 0.2951002, 1.022305, 1, 0, 0.8588235, 1,
1.03554, -0.6839906, 2.01274, 1, 0, 0.8509804, 1,
1.042876, 0.0001622706, 3.285194, 1, 0, 0.8470588, 1,
1.047805, -0.5317798, 1.756919, 1, 0, 0.8392157, 1,
1.049894, -0.3977693, 3.134287, 1, 0, 0.8352941, 1,
1.05857, 0.3163744, 1.589472, 1, 0, 0.827451, 1,
1.066564, 0.6338491, 2.640555, 1, 0, 0.8235294, 1,
1.070238, 0.3030474, 1.024131, 1, 0, 0.8156863, 1,
1.072515, 1.1269, -0.1813855, 1, 0, 0.8117647, 1,
1.074136, 0.47964, -0.2702549, 1, 0, 0.8039216, 1,
1.07736, -1.362832, 1.967886, 1, 0, 0.7960784, 1,
1.084017, -1.136338, 4.034607, 1, 0, 0.7921569, 1,
1.08768, -0.4666615, 1.496607, 1, 0, 0.7843137, 1,
1.087736, 1.307565, 0.9380983, 1, 0, 0.7803922, 1,
1.091167, 0.3650626, 2.401083, 1, 0, 0.772549, 1,
1.109519, -2.465855, 1.883711, 1, 0, 0.7686275, 1,
1.111839, 0.588859, 1.233595, 1, 0, 0.7607843, 1,
1.113274, -0.639987, 2.630916, 1, 0, 0.7568628, 1,
1.118771, 0.7314852, 0.4711394, 1, 0, 0.7490196, 1,
1.121722, 0.7051764, 0.7404787, 1, 0, 0.7450981, 1,
1.122172, -1.15685, 3.580877, 1, 0, 0.7372549, 1,
1.123326, 0.445323, 1.747457, 1, 0, 0.7333333, 1,
1.126626, -0.1715936, 1.973506, 1, 0, 0.7254902, 1,
1.142833, 0.7684572, 2.310655, 1, 0, 0.7215686, 1,
1.162085, -0.5016908, 2.573321, 1, 0, 0.7137255, 1,
1.175503, -0.2491954, 2.506793, 1, 0, 0.7098039, 1,
1.184602, 0.458172, 2.623557, 1, 0, 0.7019608, 1,
1.195061, 1.40409, 1.372406, 1, 0, 0.6941177, 1,
1.201525, 1.181633, 0.3228566, 1, 0, 0.6901961, 1,
1.203929, -0.1182191, 1.940873, 1, 0, 0.682353, 1,
1.208764, 0.424062, 3.206624, 1, 0, 0.6784314, 1,
1.212308, -0.7458802, 1.423539, 1, 0, 0.6705883, 1,
1.219431, -1.101888, 3.359901, 1, 0, 0.6666667, 1,
1.223775, -1.070441, 4.517243, 1, 0, 0.6588235, 1,
1.228961, 0.2918135, 0.4837682, 1, 0, 0.654902, 1,
1.233863, 0.5248578, 0.5721329, 1, 0, 0.6470588, 1,
1.237121, 0.7854913, 1.045019, 1, 0, 0.6431373, 1,
1.237933, -0.7848713, 1.800845, 1, 0, 0.6352941, 1,
1.245602, 2.609799, -0.298097, 1, 0, 0.6313726, 1,
1.257709, 1.575012, -0.137047, 1, 0, 0.6235294, 1,
1.276409, -0.4009608, 1.393227, 1, 0, 0.6196079, 1,
1.278628, -0.4823577, 2.093056, 1, 0, 0.6117647, 1,
1.280464, 0.1353876, 1.097536, 1, 0, 0.6078432, 1,
1.293685, 0.1403262, 1.769342, 1, 0, 0.6, 1,
1.301484, 0.2362686, 0.8690997, 1, 0, 0.5921569, 1,
1.309131, -0.8490001, 3.763891, 1, 0, 0.5882353, 1,
1.313739, 1.81349, 0.4969263, 1, 0, 0.5803922, 1,
1.32281, 1.43849, 2.499135, 1, 0, 0.5764706, 1,
1.326807, 0.7048912, 0.4952989, 1, 0, 0.5686275, 1,
1.33319, -0.321805, 1.562984, 1, 0, 0.5647059, 1,
1.341874, -1.728305, 0.6645645, 1, 0, 0.5568628, 1,
1.343563, -0.4344105, 1.113383, 1, 0, 0.5529412, 1,
1.345571, 1.057132, 0.09126639, 1, 0, 0.5450981, 1,
1.351659, -0.3178633, 0.739274, 1, 0, 0.5411765, 1,
1.358004, -0.07718324, 2.845247, 1, 0, 0.5333334, 1,
1.365281, -0.3123877, 2.691476, 1, 0, 0.5294118, 1,
1.374004, 0.1391153, 0.9711812, 1, 0, 0.5215687, 1,
1.380918, -0.4966451, 2.366794, 1, 0, 0.5176471, 1,
1.387781, 0.9872686, 2.524675, 1, 0, 0.509804, 1,
1.390924, -0.1192423, 1.617951, 1, 0, 0.5058824, 1,
1.399478, 1.137663, 1.055869, 1, 0, 0.4980392, 1,
1.401232, 0.0009627839, 1.808699, 1, 0, 0.4901961, 1,
1.402421, -0.7503946, 3.227238, 1, 0, 0.4862745, 1,
1.408183, 1.002247, 0.9237761, 1, 0, 0.4784314, 1,
1.427172, -0.3092165, 1.509096, 1, 0, 0.4745098, 1,
1.448641, -0.03727654, 0.9868978, 1, 0, 0.4666667, 1,
1.461188, 1.197061, 1.917324, 1, 0, 0.4627451, 1,
1.466824, -0.3254071, 1.843426, 1, 0, 0.454902, 1,
1.472338, -1.616488, 2.907025, 1, 0, 0.4509804, 1,
1.480925, 0.9181616, 0.1201686, 1, 0, 0.4431373, 1,
1.500962, 0.3998871, 3.084022, 1, 0, 0.4392157, 1,
1.501462, -0.5936847, 1.718328, 1, 0, 0.4313726, 1,
1.517157, 1.007186, 0.4886923, 1, 0, 0.427451, 1,
1.525261, -1.454159, 1.042377, 1, 0, 0.4196078, 1,
1.532592, -1.040826, 2.897676, 1, 0, 0.4156863, 1,
1.53688, 0.9282062, 1.371899, 1, 0, 0.4078431, 1,
1.552004, -0.2966729, 0.4487467, 1, 0, 0.4039216, 1,
1.560338, 0.2695385, 1.563238, 1, 0, 0.3960784, 1,
1.566432, -0.3275745, 0.4647848, 1, 0, 0.3882353, 1,
1.582417, -0.05525772, 1.637187, 1, 0, 0.3843137, 1,
1.584349, 0.4590022, 0.17156, 1, 0, 0.3764706, 1,
1.587868, -0.5304933, 3.655028, 1, 0, 0.372549, 1,
1.593893, 1.389831, 0.03454081, 1, 0, 0.3647059, 1,
1.628481, -0.6545187, 1.037817, 1, 0, 0.3607843, 1,
1.635758, 0.3612697, 2.048706, 1, 0, 0.3529412, 1,
1.64633, 0.7756238, 0.9642806, 1, 0, 0.3490196, 1,
1.661534, -1.138841, 2.752374, 1, 0, 0.3411765, 1,
1.669416, 1.428065, -0.1788014, 1, 0, 0.3372549, 1,
1.671986, -0.7438445, 2.631941, 1, 0, 0.3294118, 1,
1.672378, -0.5702571, 1.107391, 1, 0, 0.3254902, 1,
1.701346, -0.4529273, 0.8708702, 1, 0, 0.3176471, 1,
1.705256, -1.345962, 1.618411, 1, 0, 0.3137255, 1,
1.725366, 0.303998, 2.522289, 1, 0, 0.3058824, 1,
1.746876, -1.044472, 1.842369, 1, 0, 0.2980392, 1,
1.752094, 0.7457143, 0.156713, 1, 0, 0.2941177, 1,
1.770277, -0.217696, 1.250019, 1, 0, 0.2862745, 1,
1.775514, -2.047646, 3.223764, 1, 0, 0.282353, 1,
1.78882, -0.3245605, 2.834179, 1, 0, 0.2745098, 1,
1.793901, -0.9239929, 1.199789, 1, 0, 0.2705882, 1,
1.79556, -2.050569, 2.728835, 1, 0, 0.2627451, 1,
1.8042, 1.013056, 0.5993708, 1, 0, 0.2588235, 1,
1.810056, 0.6570443, 1.494932, 1, 0, 0.2509804, 1,
1.862571, -0.2482807, 2.119133, 1, 0, 0.2470588, 1,
1.863959, -0.06891121, 0.3243506, 1, 0, 0.2392157, 1,
1.89001, 1.200059, -0.6447256, 1, 0, 0.2352941, 1,
1.893206, 1.380059, 2.085914, 1, 0, 0.227451, 1,
1.900502, 0.3616496, -0.513979, 1, 0, 0.2235294, 1,
1.907113, -0.5129106, 3.605909, 1, 0, 0.2156863, 1,
1.917211, -2.113817, 1.075615, 1, 0, 0.2117647, 1,
1.936477, 0.1627053, 1.134428, 1, 0, 0.2039216, 1,
1.960126, -1.184929, 1.745883, 1, 0, 0.1960784, 1,
1.966975, -0.6336955, 1.484035, 1, 0, 0.1921569, 1,
1.967955, 0.01116859, 1.447044, 1, 0, 0.1843137, 1,
1.971198, -0.9388587, 1.814818, 1, 0, 0.1803922, 1,
2.000866, -0.9573681, 2.906208, 1, 0, 0.172549, 1,
2.013041, -0.08595429, 0.02934059, 1, 0, 0.1686275, 1,
2.014, -0.03333107, 0.9201121, 1, 0, 0.1607843, 1,
2.049966, 0.6189455, 0.1647042, 1, 0, 0.1568628, 1,
2.074959, -1.100276, 2.659744, 1, 0, 0.1490196, 1,
2.076542, 0.440194, -0.07886475, 1, 0, 0.145098, 1,
2.07878, -0.5252228, 2.708858, 1, 0, 0.1372549, 1,
2.100194, 1.740226, 0.1917942, 1, 0, 0.1333333, 1,
2.119819, -2.07647, 2.895088, 1, 0, 0.1254902, 1,
2.132911, -0.5851879, 0.5481808, 1, 0, 0.1215686, 1,
2.156586, -0.03963371, 2.058236, 1, 0, 0.1137255, 1,
2.191309, -1.419524, 2.982728, 1, 0, 0.1098039, 1,
2.218788, 1.806071, 1.057877, 1, 0, 0.1019608, 1,
2.227104, -1.162877, -0.2806346, 1, 0, 0.09411765, 1,
2.268799, 3.041045, 1.773249, 1, 0, 0.09019608, 1,
2.28547, 2.313153, -0.6670998, 1, 0, 0.08235294, 1,
2.29658, 1.254382, 1.604155, 1, 0, 0.07843138, 1,
2.309286, 0.1430137, 2.869781, 1, 0, 0.07058824, 1,
2.379227, 1.354605, 2.149352, 1, 0, 0.06666667, 1,
2.401887, 1.852628, 1.402002, 1, 0, 0.05882353, 1,
2.437116, -0.7991599, 3.49418, 1, 0, 0.05490196, 1,
2.476688, 0.5280073, 2.052115, 1, 0, 0.04705882, 1,
2.504418, 1.37959, -0.1241921, 1, 0, 0.04313726, 1,
2.577523, -0.3725858, 1.558832, 1, 0, 0.03529412, 1,
2.607295, 1.581442, -1.617199, 1, 0, 0.03137255, 1,
2.664588, -0.174385, 0.3174829, 1, 0, 0.02352941, 1,
2.684891, 0.292204, 2.503111, 1, 0, 0.01960784, 1,
2.865196, 0.651612, -0.1940813, 1, 0, 0.01176471, 1,
2.890118, -1.166071, 0.3443992, 1, 0, 0.007843138, 1
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
-0.01151633, -4.986693, -7.491268, 0, -0.5, 0.5, 0.5,
-0.01151633, -4.986693, -7.491268, 1, -0.5, 0.5, 0.5,
-0.01151633, -4.986693, -7.491268, 1, 1.5, 0.5, 0.5,
-0.01151633, -4.986693, -7.491268, 0, 1.5, 0.5, 0.5
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
-3.896805, 0.1218424, -7.491268, 0, -0.5, 0.5, 0.5,
-3.896805, 0.1218424, -7.491268, 1, -0.5, 0.5, 0.5,
-3.896805, 0.1218424, -7.491268, 1, 1.5, 0.5, 0.5,
-3.896805, 0.1218424, -7.491268, 0, 1.5, 0.5, 0.5
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
-3.896805, -4.986693, -0.4272871, 0, -0.5, 0.5, 0.5,
-3.896805, -4.986693, -0.4272871, 1, -0.5, 0.5, 0.5,
-3.896805, -4.986693, -0.4272871, 1, 1.5, 0.5, 0.5,
-3.896805, -4.986693, -0.4272871, 0, 1.5, 0.5, 0.5
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
-2, -3.807801, -5.861119,
2, -3.807801, -5.861119,
-2, -3.807801, -5.861119,
-2, -4.004282, -6.13281,
-1, -3.807801, -5.861119,
-1, -4.004282, -6.13281,
0, -3.807801, -5.861119,
0, -4.004282, -6.13281,
1, -3.807801, -5.861119,
1, -4.004282, -6.13281,
2, -3.807801, -5.861119,
2, -4.004282, -6.13281
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
-2, -4.397247, -6.676193, 0, -0.5, 0.5, 0.5,
-2, -4.397247, -6.676193, 1, -0.5, 0.5, 0.5,
-2, -4.397247, -6.676193, 1, 1.5, 0.5, 0.5,
-2, -4.397247, -6.676193, 0, 1.5, 0.5, 0.5,
-1, -4.397247, -6.676193, 0, -0.5, 0.5, 0.5,
-1, -4.397247, -6.676193, 1, -0.5, 0.5, 0.5,
-1, -4.397247, -6.676193, 1, 1.5, 0.5, 0.5,
-1, -4.397247, -6.676193, 0, 1.5, 0.5, 0.5,
0, -4.397247, -6.676193, 0, -0.5, 0.5, 0.5,
0, -4.397247, -6.676193, 1, -0.5, 0.5, 0.5,
0, -4.397247, -6.676193, 1, 1.5, 0.5, 0.5,
0, -4.397247, -6.676193, 0, 1.5, 0.5, 0.5,
1, -4.397247, -6.676193, 0, -0.5, 0.5, 0.5,
1, -4.397247, -6.676193, 1, -0.5, 0.5, 0.5,
1, -4.397247, -6.676193, 1, 1.5, 0.5, 0.5,
1, -4.397247, -6.676193, 0, 1.5, 0.5, 0.5,
2, -4.397247, -6.676193, 0, -0.5, 0.5, 0.5,
2, -4.397247, -6.676193, 1, -0.5, 0.5, 0.5,
2, -4.397247, -6.676193, 1, 1.5, 0.5, 0.5,
2, -4.397247, -6.676193, 0, 1.5, 0.5, 0.5
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
-3.0002, -2, -5.861119,
-3.0002, 2, -5.861119,
-3.0002, -2, -5.861119,
-3.149634, -2, -6.13281,
-3.0002, 0, -5.861119,
-3.149634, 0, -6.13281,
-3.0002, 2, -5.861119,
-3.149634, 2, -6.13281
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
"0",
"2"
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
-3.448502, -2, -6.676193, 0, -0.5, 0.5, 0.5,
-3.448502, -2, -6.676193, 1, -0.5, 0.5, 0.5,
-3.448502, -2, -6.676193, 1, 1.5, 0.5, 0.5,
-3.448502, -2, -6.676193, 0, 1.5, 0.5, 0.5,
-3.448502, 0, -6.676193, 0, -0.5, 0.5, 0.5,
-3.448502, 0, -6.676193, 1, -0.5, 0.5, 0.5,
-3.448502, 0, -6.676193, 1, 1.5, 0.5, 0.5,
-3.448502, 0, -6.676193, 0, 1.5, 0.5, 0.5,
-3.448502, 2, -6.676193, 0, -0.5, 0.5, 0.5,
-3.448502, 2, -6.676193, 1, -0.5, 0.5, 0.5,
-3.448502, 2, -6.676193, 1, 1.5, 0.5, 0.5,
-3.448502, 2, -6.676193, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.0002, -3.807801, -4,
-3.0002, -3.807801, 4,
-3.0002, -3.807801, -4,
-3.149634, -4.004282, -4,
-3.0002, -3.807801, -2,
-3.149634, -4.004282, -2,
-3.0002, -3.807801, 0,
-3.149634, -4.004282, 0,
-3.0002, -3.807801, 2,
-3.149634, -4.004282, 2,
-3.0002, -3.807801, 4,
-3.149634, -4.004282, 4
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
-3.448502, -4.397247, -4, 0, -0.5, 0.5, 0.5,
-3.448502, -4.397247, -4, 1, -0.5, 0.5, 0.5,
-3.448502, -4.397247, -4, 1, 1.5, 0.5, 0.5,
-3.448502, -4.397247, -4, 0, 1.5, 0.5, 0.5,
-3.448502, -4.397247, -2, 0, -0.5, 0.5, 0.5,
-3.448502, -4.397247, -2, 1, -0.5, 0.5, 0.5,
-3.448502, -4.397247, -2, 1, 1.5, 0.5, 0.5,
-3.448502, -4.397247, -2, 0, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 0, 0, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 0, 1, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 0, 1, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 0, 0, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 2, 0, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 2, 1, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 2, 1, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 2, 0, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 4, 0, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 4, 1, -0.5, 0.5, 0.5,
-3.448502, -4.397247, 4, 1, 1.5, 0.5, 0.5,
-3.448502, -4.397247, 4, 0, 1.5, 0.5, 0.5
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
-3.0002, -3.807801, -5.861119,
-3.0002, 4.051485, -5.861119,
-3.0002, -3.807801, 5.006545,
-3.0002, 4.051485, 5.006545,
-3.0002, -3.807801, -5.861119,
-3.0002, -3.807801, 5.006545,
-3.0002, 4.051485, -5.861119,
-3.0002, 4.051485, 5.006545,
-3.0002, -3.807801, -5.861119,
2.977167, -3.807801, -5.861119,
-3.0002, -3.807801, 5.006545,
2.977167, -3.807801, 5.006545,
-3.0002, 4.051485, -5.861119,
2.977167, 4.051485, -5.861119,
-3.0002, 4.051485, 5.006545,
2.977167, 4.051485, 5.006545,
2.977167, -3.807801, -5.861119,
2.977167, 4.051485, -5.861119,
2.977167, -3.807801, 5.006545,
2.977167, 4.051485, 5.006545,
2.977167, -3.807801, -5.861119,
2.977167, -3.807801, 5.006545,
2.977167, 4.051485, -5.861119,
2.977167, 4.051485, 5.006545
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
var radius = 7.840671;
var distance = 34.88403;
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
mvMatrix.translate( 0.01151633, -0.1218424, 0.4272871 );
mvMatrix.scale( 1.418265, 1.078659, 0.7800654 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88403);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Oryzalin<-read.table("Oryzalin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Oryzalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
y<-Oryzalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
z<-Oryzalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
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
-2.913151, 0.9798338, -1.344933, 0, 0, 1, 1, 1,
-2.804011, -0.3147677, -2.051483, 1, 0, 0, 1, 1,
-2.769931, 1.39127, -2.337964, 1, 0, 0, 1, 1,
-2.711626, 0.5946146, -2.190803, 1, 0, 0, 1, 1,
-2.682775, 0.3766977, -1.794724, 1, 0, 0, 1, 1,
-2.653923, -1.626988, -3.049693, 1, 0, 0, 1, 1,
-2.63194, 1.511198, -0.6180979, 0, 0, 0, 1, 1,
-2.611199, 2.51652, 0.3693706, 0, 0, 0, 1, 1,
-2.518089, -1.364829, -2.402348, 0, 0, 0, 1, 1,
-2.380592, 1.538622, -1.773588, 0, 0, 0, 1, 1,
-2.375967, -1.526973, -3.04392, 0, 0, 0, 1, 1,
-2.34659, -1.252995, -2.38587, 0, 0, 0, 1, 1,
-2.323228, 1.171813, -2.37798, 0, 0, 0, 1, 1,
-2.315932, 0.7882435, 0.6495733, 1, 1, 1, 1, 1,
-2.302028, 0.1665205, -2.589197, 1, 1, 1, 1, 1,
-2.294555, -0.6854608, -0.2929925, 1, 1, 1, 1, 1,
-2.221478, -0.4268601, -1.626531, 1, 1, 1, 1, 1,
-2.212234, -0.6648955, -1.068568, 1, 1, 1, 1, 1,
-2.204326, -2.30103, -2.988003, 1, 1, 1, 1, 1,
-2.195292, 0.6633922, -0.9184653, 1, 1, 1, 1, 1,
-2.159125, 0.6595672, -0.4912408, 1, 1, 1, 1, 1,
-2.107087, -1.653903, -2.168288, 1, 1, 1, 1, 1,
-2.05492, -2.634395, -4.702272, 1, 1, 1, 1, 1,
-2.041646, -0.317888, -0.6762113, 1, 1, 1, 1, 1,
-2.041238, -1.736238, -2.098233, 1, 1, 1, 1, 1,
-2.040195, -0.1296581, -3.776323, 1, 1, 1, 1, 1,
-1.993621, 1.466099, -0.8371639, 1, 1, 1, 1, 1,
-1.990361, -0.8223205, -0.6762806, 1, 1, 1, 1, 1,
-1.965605, 1.469554, -0.1701035, 0, 0, 1, 1, 1,
-1.955739, 0.4160728, -0.2162375, 1, 0, 0, 1, 1,
-1.948314, -1.689043, -2.010078, 1, 0, 0, 1, 1,
-1.918865, 1.336751, -0.5127703, 1, 0, 0, 1, 1,
-1.916203, -0.3980759, -1.543489, 1, 0, 0, 1, 1,
-1.916191, -0.4902726, -1.542058, 1, 0, 0, 1, 1,
-1.898283, 0.5355191, -1.094691, 0, 0, 0, 1, 1,
-1.88318, 0.4380026, -0.2717067, 0, 0, 0, 1, 1,
-1.875564, 0.08805171, -1.35806, 0, 0, 0, 1, 1,
-1.869074, 1.080635, 1.058944, 0, 0, 0, 1, 1,
-1.820528, -1.840862, -1.779357, 0, 0, 0, 1, 1,
-1.800901, -0.822215, -0.8835761, 0, 0, 0, 1, 1,
-1.786289, 2.383801, 1.329279, 0, 0, 0, 1, 1,
-1.762908, 0.2396779, -1.898003, 1, 1, 1, 1, 1,
-1.755762, -0.01070219, -1.217504, 1, 1, 1, 1, 1,
-1.748505, -0.4637815, -0.6490027, 1, 1, 1, 1, 1,
-1.746447, -0.6567876, -2.865411, 1, 1, 1, 1, 1,
-1.722221, 0.003442784, -2.690966, 1, 1, 1, 1, 1,
-1.702246, 0.7931026, -0.0338596, 1, 1, 1, 1, 1,
-1.694297, -1.384751, -0.6530209, 1, 1, 1, 1, 1,
-1.685061, -1.453969, -1.899346, 1, 1, 1, 1, 1,
-1.682827, 0.5027238, -2.333567, 1, 1, 1, 1, 1,
-1.674257, -0.9035771, -2.348511, 1, 1, 1, 1, 1,
-1.672379, -0.8183334, -1.155706, 1, 1, 1, 1, 1,
-1.664517, -1.805437, -1.300244, 1, 1, 1, 1, 1,
-1.658413, -0.94966, -2.767688, 1, 1, 1, 1, 1,
-1.643379, -0.9002549, -1.211928, 1, 1, 1, 1, 1,
-1.632892, 0.5388545, -1.525648, 1, 1, 1, 1, 1,
-1.630965, 1.33856, 0.3929918, 0, 0, 1, 1, 1,
-1.627745, 0.3631921, -0.6325551, 1, 0, 0, 1, 1,
-1.607437, -0.380315, -2.019475, 1, 0, 0, 1, 1,
-1.601896, -0.3679335, -1.945248, 1, 0, 0, 1, 1,
-1.59898, -1.200771, -0.7780936, 1, 0, 0, 1, 1,
-1.578066, 0.2641555, 1.219695, 1, 0, 0, 1, 1,
-1.575643, 0.1942758, -1.207938, 0, 0, 0, 1, 1,
-1.530094, -1.52027, -2.263849, 0, 0, 0, 1, 1,
-1.518659, 1.29891, -1.15604, 0, 0, 0, 1, 1,
-1.518448, -0.3348843, -1.00082, 0, 0, 0, 1, 1,
-1.509722, -0.4817773, -1.52011, 0, 0, 0, 1, 1,
-1.496008, 0.3436155, -2.352819, 0, 0, 0, 1, 1,
-1.471581, -0.2717539, -3.417436, 0, 0, 0, 1, 1,
-1.466115, -0.1837273, -1.944203, 1, 1, 1, 1, 1,
-1.456038, -1.744624, -3.867509, 1, 1, 1, 1, 1,
-1.448692, 0.6013464, -2.148757, 1, 1, 1, 1, 1,
-1.444661, 0.5679376, -0.2161198, 1, 1, 1, 1, 1,
-1.436578, -1.015399, -0.7620253, 1, 1, 1, 1, 1,
-1.432418, -0.9472287, -2.182703, 1, 1, 1, 1, 1,
-1.430571, 0.0114547, -1.149906, 1, 1, 1, 1, 1,
-1.420169, 0.8661367, -1.813051, 1, 1, 1, 1, 1,
-1.407978, -1.08562, -2.137713, 1, 1, 1, 1, 1,
-1.401858, 0.4442399, -4.076365, 1, 1, 1, 1, 1,
-1.387127, 0.3096727, -1.46314, 1, 1, 1, 1, 1,
-1.378422, 0.04137383, -1.173859, 1, 1, 1, 1, 1,
-1.371112, 0.3118375, -0.7106277, 1, 1, 1, 1, 1,
-1.363269, -0.8050604, -1.37933, 1, 1, 1, 1, 1,
-1.360315, -0.1925147, -0.9746536, 1, 1, 1, 1, 1,
-1.352765, -0.07104432, -2.771955, 0, 0, 1, 1, 1,
-1.341912, -0.5130851, -3.419752, 1, 0, 0, 1, 1,
-1.337781, -0.790749, -2.622517, 1, 0, 0, 1, 1,
-1.334495, -0.4665372, -3.10043, 1, 0, 0, 1, 1,
-1.330087, 0.1715679, -1.936337, 1, 0, 0, 1, 1,
-1.326077, 0.1892256, -0.2011503, 1, 0, 0, 1, 1,
-1.32171, 0.541053, -0.5662636, 0, 0, 0, 1, 1,
-1.308704, -1.248913, -1.260628, 0, 0, 0, 1, 1,
-1.308396, 0.6639497, -1.631266, 0, 0, 0, 1, 1,
-1.306685, -0.02126803, -2.397909, 0, 0, 0, 1, 1,
-1.303247, 1.522296, 1.569032, 0, 0, 0, 1, 1,
-1.294448, 2.49988, 1.258882, 0, 0, 0, 1, 1,
-1.286262, -1.446918, -1.409964, 0, 0, 0, 1, 1,
-1.282081, 0.6007527, -2.718134, 1, 1, 1, 1, 1,
-1.280547, -1.960287, -2.102331, 1, 1, 1, 1, 1,
-1.279492, 1.900927, -1.06783, 1, 1, 1, 1, 1,
-1.2668, -0.3750651, -3.92876, 1, 1, 1, 1, 1,
-1.259004, 0.6033704, -0.268952, 1, 1, 1, 1, 1,
-1.252344, 0.4752281, -0.2743794, 1, 1, 1, 1, 1,
-1.245391, 0.4965918, -2.646496, 1, 1, 1, 1, 1,
-1.242239, 1.081453, -4.651748, 1, 1, 1, 1, 1,
-1.23808, 1.206085, -1.217196, 1, 1, 1, 1, 1,
-1.236176, 0.1966457, -0.5583372, 1, 1, 1, 1, 1,
-1.229534, -0.2888578, -1.610557, 1, 1, 1, 1, 1,
-1.221993, -0.8043742, -3.023322, 1, 1, 1, 1, 1,
-1.2213, 1.486653, 0.09055055, 1, 1, 1, 1, 1,
-1.219792, 0.5309148, -0.8639059, 1, 1, 1, 1, 1,
-1.205289, 0.005136034, -1.492678, 1, 1, 1, 1, 1,
-1.20112, -0.2365724, -1.637656, 0, 0, 1, 1, 1,
-1.198929, -0.2530581, -1.75693, 1, 0, 0, 1, 1,
-1.19752, -1.490143, -3.127197, 1, 0, 0, 1, 1,
-1.1931, 0.5618052, -2.774736, 1, 0, 0, 1, 1,
-1.190716, 1.044765, -2.007116, 1, 0, 0, 1, 1,
-1.188721, 0.4856716, -1.446892, 1, 0, 0, 1, 1,
-1.177876, 0.6947039, -0.5086188, 0, 0, 0, 1, 1,
-1.173834, -0.8816552, -2.746113, 0, 0, 0, 1, 1,
-1.169466, -0.8682172, -0.9514364, 0, 0, 0, 1, 1,
-1.16172, -0.05286783, -0.4879407, 0, 0, 0, 1, 1,
-1.157731, 0.1742961, -2.217406, 0, 0, 0, 1, 1,
-1.15229, 0.1564851, -2.416386, 0, 0, 0, 1, 1,
-1.151935, -1.172941, -3.325734, 0, 0, 0, 1, 1,
-1.143793, 0.2472933, -2.748504, 1, 1, 1, 1, 1,
-1.143697, -0.5957997, -0.4810291, 1, 1, 1, 1, 1,
-1.139377, 2.248571, -0.6201178, 1, 1, 1, 1, 1,
-1.138761, 0.4421393, -1.743318, 1, 1, 1, 1, 1,
-1.118397, 1.552578, -1.056865, 1, 1, 1, 1, 1,
-1.110316, 1.387072, -2.083387, 1, 1, 1, 1, 1,
-1.108974, -0.6370338, -1.21146, 1, 1, 1, 1, 1,
-1.108647, -0.3981468, -1.422179, 1, 1, 1, 1, 1,
-1.104103, -1.805282, -4.618478, 1, 1, 1, 1, 1,
-1.091125, 1.579409, 0.6115694, 1, 1, 1, 1, 1,
-1.088967, -0.9934543, -2.397444, 1, 1, 1, 1, 1,
-1.074582, -0.1857129, -2.369631, 1, 1, 1, 1, 1,
-1.071581, -0.4424236, -2.273134, 1, 1, 1, 1, 1,
-1.061564, -0.148672, -2.22877, 1, 1, 1, 1, 1,
-1.061002, -0.8512894, -1.605301, 1, 1, 1, 1, 1,
-1.059076, 0.2225964, -0.809779, 0, 0, 1, 1, 1,
-1.054325, -0.8880816, -3.864132, 1, 0, 0, 1, 1,
-1.052102, 1.195609, 0.05757878, 1, 0, 0, 1, 1,
-1.049867, -1.581081, -1.128854, 1, 0, 0, 1, 1,
-1.046342, -1.585576, -2.893277, 1, 0, 0, 1, 1,
-1.044994, 1.672383, 0.1963056, 1, 0, 0, 1, 1,
-1.041412, -0.2574403, -2.722982, 0, 0, 0, 1, 1,
-1.039038, -0.3250149, -2.36007, 0, 0, 0, 1, 1,
-1.034619, -0.7497986, -1.936293, 0, 0, 0, 1, 1,
-1.030318, 0.4641293, -1.041771, 0, 0, 0, 1, 1,
-1.026228, -0.7117705, -2.227086, 0, 0, 0, 1, 1,
-1.012234, -0.9373811, -1.766156, 0, 0, 0, 1, 1,
-1.008613, 1.384973, -0.2824153, 0, 0, 0, 1, 1,
-1.00552, 0.1332074, -1.034509, 1, 1, 1, 1, 1,
-1.003941, 0.5592046, -0.06241521, 1, 1, 1, 1, 1,
-0.9942706, -0.7926648, -3.365652, 1, 1, 1, 1, 1,
-0.9906996, 1.009417, -1.039548, 1, 1, 1, 1, 1,
-0.9835664, 1.655878, 0.2290668, 1, 1, 1, 1, 1,
-0.9778786, -0.1574465, -0.1677428, 1, 1, 1, 1, 1,
-0.9775372, -0.4959584, -2.29041, 1, 1, 1, 1, 1,
-0.9743534, 0.6250497, 0.06311941, 1, 1, 1, 1, 1,
-0.9626882, 0.6282865, -0.8383794, 1, 1, 1, 1, 1,
-0.960341, 0.8408587, -1.361678, 1, 1, 1, 1, 1,
-0.9494609, -1.222049, -1.006248, 1, 1, 1, 1, 1,
-0.9433252, 0.3611154, -1.420674, 1, 1, 1, 1, 1,
-0.9278313, -0.5784618, -3.867686, 1, 1, 1, 1, 1,
-0.9235804, 0.02684612, -0.4236534, 1, 1, 1, 1, 1,
-0.9235183, 1.097646, -0.8103334, 1, 1, 1, 1, 1,
-0.9154412, -1.762941, -3.849756, 0, 0, 1, 1, 1,
-0.9101419, 1.574105, 0.494075, 1, 0, 0, 1, 1,
-0.9091888, 0.6396222, 1.008542, 1, 0, 0, 1, 1,
-0.9054503, 0.01988457, -0.8931141, 1, 0, 0, 1, 1,
-0.904227, -0.3246734, -3.76331, 1, 0, 0, 1, 1,
-0.8942857, 2.647406, 0.5056508, 1, 0, 0, 1, 1,
-0.8926395, -0.1786874, -2.840448, 0, 0, 0, 1, 1,
-0.888933, 2.098243, -1.81399, 0, 0, 0, 1, 1,
-0.8856322, -0.8246139, -0.3694223, 0, 0, 0, 1, 1,
-0.8810095, -1.392133, -1.266466, 0, 0, 0, 1, 1,
-0.8791812, 0.6136669, -0.6803346, 0, 0, 0, 1, 1,
-0.8787568, -1.790458, -1.787278, 0, 0, 0, 1, 1,
-0.8757293, -0.8197145, -1.448865, 0, 0, 0, 1, 1,
-0.8732896, -0.8442176, -2.027987, 1, 1, 1, 1, 1,
-0.8715112, -1.120456, -1.846538, 1, 1, 1, 1, 1,
-0.8623723, 1.267135, -0.3743138, 1, 1, 1, 1, 1,
-0.8619797, 0.5127025, -0.919132, 1, 1, 1, 1, 1,
-0.8614371, 0.1927866, -1.485455, 1, 1, 1, 1, 1,
-0.8553218, 0.5898643, -0.4083629, 1, 1, 1, 1, 1,
-0.8526555, 1.418661, 0.1211874, 1, 1, 1, 1, 1,
-0.8448949, 0.6819835, -0.6908824, 1, 1, 1, 1, 1,
-0.8431162, -0.574435, -2.74573, 1, 1, 1, 1, 1,
-0.8424446, 0.9839035, -1.325815, 1, 1, 1, 1, 1,
-0.8417304, -1.920637, -4.113462, 1, 1, 1, 1, 1,
-0.8371814, -1.53887, -1.597368, 1, 1, 1, 1, 1,
-0.8365883, 0.4644584, -0.9267876, 1, 1, 1, 1, 1,
-0.8320076, -0.3186991, -4.328399, 1, 1, 1, 1, 1,
-0.8319443, -0.9547324, -1.266066, 1, 1, 1, 1, 1,
-0.8292974, -0.5285404, -2.333002, 0, 0, 1, 1, 1,
-0.8288804, -0.01713724, -2.219254, 1, 0, 0, 1, 1,
-0.8240858, 0.3857675, -1.311798, 1, 0, 0, 1, 1,
-0.8239183, -0.1246423, -0.321083, 1, 0, 0, 1, 1,
-0.8220195, -1.128066, -2.468753, 1, 0, 0, 1, 1,
-0.8189964, 0.6142285, -0.8536175, 1, 0, 0, 1, 1,
-0.8187312, -0.8460156, -1.371664, 0, 0, 0, 1, 1,
-0.8110005, -0.8461819, -1.483474, 0, 0, 0, 1, 1,
-0.8070903, 0.3516485, 0.1286432, 0, 0, 0, 1, 1,
-0.7961673, 0.1006828, -0.0603646, 0, 0, 0, 1, 1,
-0.7930003, -1.025702, -1.155303, 0, 0, 0, 1, 1,
-0.784549, -1.181046, -2.996327, 0, 0, 0, 1, 1,
-0.7843885, -1.238758, -1.356898, 0, 0, 0, 1, 1,
-0.7838685, -0.7952963, -1.31381, 1, 1, 1, 1, 1,
-0.7821, 1.094115, -1.993382, 1, 1, 1, 1, 1,
-0.780418, -1.224446, -1.174861, 1, 1, 1, 1, 1,
-0.7792038, -0.007834095, -0.6170974, 1, 1, 1, 1, 1,
-0.7751026, -0.5730789, -2.167179, 1, 1, 1, 1, 1,
-0.7713872, -0.8455943, -2.037834, 1, 1, 1, 1, 1,
-0.7695931, -1.083272, -3.381597, 1, 1, 1, 1, 1,
-0.7674661, 2.259843, -0.5843673, 1, 1, 1, 1, 1,
-0.7658125, 0.4433537, 0.5096424, 1, 1, 1, 1, 1,
-0.7582743, -0.5831735, -2.094647, 1, 1, 1, 1, 1,
-0.757583, -0.4439344, -3.222546, 1, 1, 1, 1, 1,
-0.7561188, -0.2100173, -2.01193, 1, 1, 1, 1, 1,
-0.7546856, 1.211558, -0.4899555, 1, 1, 1, 1, 1,
-0.7524863, -0.2103899, -4.14265, 1, 1, 1, 1, 1,
-0.7481386, 0.7677251, -2.21543, 1, 1, 1, 1, 1,
-0.7478544, 1.823553, -0.3106913, 0, 0, 1, 1, 1,
-0.7442895, 0.1338044, -1.304367, 1, 0, 0, 1, 1,
-0.7413484, -0.4166693, -1.176201, 1, 0, 0, 1, 1,
-0.7314475, -0.7567361, -2.091749, 1, 0, 0, 1, 1,
-0.7311487, 0.6907451, -0.2724045, 1, 0, 0, 1, 1,
-0.7301921, 0.2367783, -1.583579, 1, 0, 0, 1, 1,
-0.7290263, -1.040784, -2.617594, 0, 0, 0, 1, 1,
-0.7219059, -0.09412746, -2.04917, 0, 0, 0, 1, 1,
-0.7129455, 1.031126, -1.241217, 0, 0, 0, 1, 1,
-0.7112519, 0.8625485, 0.1253423, 0, 0, 0, 1, 1,
-0.709204, 0.02309819, -0.4554588, 0, 0, 0, 1, 1,
-0.7080964, -0.09823697, -0.8098575, 0, 0, 0, 1, 1,
-0.7080815, -1.530531, -2.651872, 0, 0, 0, 1, 1,
-0.7065607, -1.186677, -3.114948, 1, 1, 1, 1, 1,
-0.7029454, -0.3059023, -1.179953, 1, 1, 1, 1, 1,
-0.7009236, 0.4550698, 0.104644, 1, 1, 1, 1, 1,
-0.6986578, 1.475393, -1.00918, 1, 1, 1, 1, 1,
-0.6946285, -1.72148, -1.762712, 1, 1, 1, 1, 1,
-0.6926691, 0.4465999, -0.6379708, 1, 1, 1, 1, 1,
-0.6858988, 0.04070104, -2.080047, 1, 1, 1, 1, 1,
-0.6805305, 0.9586429, -1.415664, 1, 1, 1, 1, 1,
-0.6796094, -2.087274, -2.51053, 1, 1, 1, 1, 1,
-0.6793609, -0.636906, -2.010918, 1, 1, 1, 1, 1,
-0.6767761, 0.2086041, -2.07044, 1, 1, 1, 1, 1,
-0.6754809, 0.1880616, -1.846982, 1, 1, 1, 1, 1,
-0.6702023, 1.271939, 1.553468, 1, 1, 1, 1, 1,
-0.6657201, -0.7173204, -3.404446, 1, 1, 1, 1, 1,
-0.6644172, -0.5095081, -1.453799, 1, 1, 1, 1, 1,
-0.6601254, 1.685026, -2.270925, 0, 0, 1, 1, 1,
-0.6595883, 1.479768, -0.992588, 1, 0, 0, 1, 1,
-0.6568902, 0.1571615, -1.74157, 1, 0, 0, 1, 1,
-0.655944, -0.561927, -2.256418, 1, 0, 0, 1, 1,
-0.6529267, -1.637346, -2.194694, 1, 0, 0, 1, 1,
-0.6481064, -1.188117, -1.797191, 1, 0, 0, 1, 1,
-0.6458688, -0.4804949, -2.979218, 0, 0, 0, 1, 1,
-0.6433635, -1.446985, -2.536766, 0, 0, 0, 1, 1,
-0.6432833, 0.6945454, -0.9343617, 0, 0, 0, 1, 1,
-0.6364829, 0.4769026, -2.611489, 0, 0, 0, 1, 1,
-0.6363971, 0.03221431, -2.168139, 0, 0, 0, 1, 1,
-0.6360431, -0.288876, -2.908852, 0, 0, 0, 1, 1,
-0.6338198, 1.24614, -0.9848577, 0, 0, 0, 1, 1,
-0.6322417, -1.587928, -3.491238, 1, 1, 1, 1, 1,
-0.6312975, 0.4931609, -0.2524289, 1, 1, 1, 1, 1,
-0.6310273, 1.643941, 1.069823, 1, 1, 1, 1, 1,
-0.629199, -2.028466, -4.544874, 1, 1, 1, 1, 1,
-0.6266049, -1.457479, -2.407722, 1, 1, 1, 1, 1,
-0.6252164, 0.6328506, -1.603817, 1, 1, 1, 1, 1,
-0.624139, 1.729451, -0.6133262, 1, 1, 1, 1, 1,
-0.6221474, 0.3455606, -0.3264452, 1, 1, 1, 1, 1,
-0.6220149, 0.2115681, -1.127868, 1, 1, 1, 1, 1,
-0.6176273, -0.3888918, -2.557861, 1, 1, 1, 1, 1,
-0.6049922, -0.5270053, -2.734015, 1, 1, 1, 1, 1,
-0.6049816, -0.3587319, -1.968357, 1, 1, 1, 1, 1,
-0.6046881, -1.421433, -0.7609857, 1, 1, 1, 1, 1,
-0.6046868, -1.292409, -0.808849, 1, 1, 1, 1, 1,
-0.5901803, 2.446323, -1.500093, 1, 1, 1, 1, 1,
-0.5835052, -1.024449, -1.274032, 0, 0, 1, 1, 1,
-0.5821368, -0.3245227, -1.821304, 1, 0, 0, 1, 1,
-0.5806995, -0.531486, -3.250036, 1, 0, 0, 1, 1,
-0.5770506, 0.8295992, -0.0595912, 1, 0, 0, 1, 1,
-0.5689562, -0.906086, -2.292876, 1, 0, 0, 1, 1,
-0.5676714, -0.4439494, -2.210701, 1, 0, 0, 1, 1,
-0.5627905, 1.415325, -0.1146601, 0, 0, 0, 1, 1,
-0.5625878, 0.4328921, -0.9376789, 0, 0, 0, 1, 1,
-0.5625352, -0.5203384, -2.055915, 0, 0, 0, 1, 1,
-0.5616778, -0.6005661, -1.475275, 0, 0, 0, 1, 1,
-0.5581746, 0.7842627, -0.349894, 0, 0, 0, 1, 1,
-0.5571392, 0.8007913, 1.422836, 0, 0, 0, 1, 1,
-0.5549198, 2.89735, 0.7593009, 0, 0, 0, 1, 1,
-0.5476374, -1.196359, -3.014367, 1, 1, 1, 1, 1,
-0.5445845, 0.1500735, -0.3700559, 1, 1, 1, 1, 1,
-0.5424064, -0.7895399, -3.518064, 1, 1, 1, 1, 1,
-0.5417609, -0.2095554, -0.5776257, 1, 1, 1, 1, 1,
-0.5412602, -0.3692054, -0.8673075, 1, 1, 1, 1, 1,
-0.5385361, 0.91684, 0.514834, 1, 1, 1, 1, 1,
-0.5381604, -1.593201, -2.119031, 1, 1, 1, 1, 1,
-0.5381598, 1.134542, 0.1425936, 1, 1, 1, 1, 1,
-0.5337048, -1.454043, -3.34292, 1, 1, 1, 1, 1,
-0.5316285, 0.8569557, -2.759382, 1, 1, 1, 1, 1,
-0.5316115, 0.02429033, -1.569927, 1, 1, 1, 1, 1,
-0.5255405, -1.863571, -2.144614, 1, 1, 1, 1, 1,
-0.5223935, 0.02253859, -0.8639398, 1, 1, 1, 1, 1,
-0.5210086, 1.117796, 0.4791304, 1, 1, 1, 1, 1,
-0.5196645, -0.3314773, -1.424552, 1, 1, 1, 1, 1,
-0.5182111, -0.7886966, -2.248956, 0, 0, 1, 1, 1,
-0.517574, -1.991115, -1.657043, 1, 0, 0, 1, 1,
-0.5153741, -0.7980457, -1.229007, 1, 0, 0, 1, 1,
-0.5129725, 0.1079464, -0.7971528, 1, 0, 0, 1, 1,
-0.5089043, 1.088616, -0.1822473, 1, 0, 0, 1, 1,
-0.5079148, -1.523528, -4.362563, 1, 0, 0, 1, 1,
-0.5067915, 1.487786, -0.5281312, 0, 0, 0, 1, 1,
-0.5049292, 0.03474117, -1.605737, 0, 0, 0, 1, 1,
-0.5022039, 0.3381923, -1.423839, 0, 0, 0, 1, 1,
-0.5002371, -1.512254, -1.989482, 0, 0, 0, 1, 1,
-0.4988948, 0.5871652, -0.4343358, 0, 0, 0, 1, 1,
-0.4959104, 1.31685, 0.9177254, 0, 0, 0, 1, 1,
-0.4958481, 0.3022017, 0.2919647, 0, 0, 0, 1, 1,
-0.4945668, -0.3576048, -1.280492, 1, 1, 1, 1, 1,
-0.4922265, -0.221356, -2.515417, 1, 1, 1, 1, 1,
-0.4902738, 1.570304, -0.2131288, 1, 1, 1, 1, 1,
-0.49011, -0.09855875, -1.416059, 1, 1, 1, 1, 1,
-0.4847315, 0.3063464, -0.9859865, 1, 1, 1, 1, 1,
-0.4834949, -0.671794, -2.796004, 1, 1, 1, 1, 1,
-0.4822587, -0.9212013, -1.330025, 1, 1, 1, 1, 1,
-0.481418, -0.2577668, -1.279986, 1, 1, 1, 1, 1,
-0.4759087, 0.5821026, -1.940033, 1, 1, 1, 1, 1,
-0.4720536, 1.004848, 0.2166515, 1, 1, 1, 1, 1,
-0.4713472, -0.9359007, -3.028463, 1, 1, 1, 1, 1,
-0.4696803, 0.5427375, -0.1740471, 1, 1, 1, 1, 1,
-0.4690609, 0.6615406, -2.263586, 1, 1, 1, 1, 1,
-0.4663756, -1.349271, -3.831829, 1, 1, 1, 1, 1,
-0.4649881, -1.483234, -3.782015, 1, 1, 1, 1, 1,
-0.4633601, -0.564009, -2.192508, 0, 0, 1, 1, 1,
-0.4629948, -0.008873255, -0.03889279, 1, 0, 0, 1, 1,
-0.461686, 0.460697, -2.132913, 1, 0, 0, 1, 1,
-0.4607498, 0.5189951, -1.528931, 1, 0, 0, 1, 1,
-0.4599137, -0.1961486, -0.6083491, 1, 0, 0, 1, 1,
-0.4564687, -0.2517466, -1.922562, 1, 0, 0, 1, 1,
-0.4544945, 0.4434907, -0.1153324, 0, 0, 0, 1, 1,
-0.4431386, -1.460795, -3.661057, 0, 0, 0, 1, 1,
-0.4410798, 1.809532, -0.1627843, 0, 0, 0, 1, 1,
-0.439453, -0.666065, -2.888207, 0, 0, 0, 1, 1,
-0.4356838, 0.3682112, -1.027034, 0, 0, 0, 1, 1,
-0.4322998, -1.056597, -3.806355, 0, 0, 0, 1, 1,
-0.4322302, -0.3327517, -2.439171, 0, 0, 0, 1, 1,
-0.4306891, 2.560231, -1.477991, 1, 1, 1, 1, 1,
-0.4294679, 0.2995451, -2.281037, 1, 1, 1, 1, 1,
-0.4282719, -1.111184, -3.362705, 1, 1, 1, 1, 1,
-0.4249328, 1.153458, 0.9369201, 1, 1, 1, 1, 1,
-0.4215943, -0.3441314, -1.860033, 1, 1, 1, 1, 1,
-0.4210688, -1.158809, -2.565943, 1, 1, 1, 1, 1,
-0.4205776, 0.8100083, -0.9782838, 1, 1, 1, 1, 1,
-0.4201664, -0.1107815, -3.172856, 1, 1, 1, 1, 1,
-0.417192, -0.07990087, -0.03497798, 1, 1, 1, 1, 1,
-0.4157981, -0.6469826, -1.812341, 1, 1, 1, 1, 1,
-0.4072383, -1.137907, -2.018316, 1, 1, 1, 1, 1,
-0.4063437, -0.2532686, -2.722387, 1, 1, 1, 1, 1,
-0.4009184, -0.4942602, -2.210599, 1, 1, 1, 1, 1,
-0.3959399, 1.251473, 0.6913677, 1, 1, 1, 1, 1,
-0.3942149, 0.05443805, -0.2209618, 1, 1, 1, 1, 1,
-0.3923657, -1.365265, -4.010257, 0, 0, 1, 1, 1,
-0.3923298, 1.145891, -0.3163942, 1, 0, 0, 1, 1,
-0.3910438, 0.6014361, -0.3970407, 1, 0, 0, 1, 1,
-0.3904316, 0.3616266, -0.3773461, 1, 0, 0, 1, 1,
-0.387282, -1.41149, -2.389069, 1, 0, 0, 1, 1,
-0.3833392, 1.11518, 1.205365, 1, 0, 0, 1, 1,
-0.3797819, -0.5191062, -1.513795, 0, 0, 0, 1, 1,
-0.3718712, -0.7826898, -2.689139, 0, 0, 0, 1, 1,
-0.3623571, -0.021464, -1.503275, 0, 0, 0, 1, 1,
-0.3617881, 0.2907302, -1.765804, 0, 0, 0, 1, 1,
-0.3611253, 0.751343, 1.643041, 0, 0, 0, 1, 1,
-0.3602178, -1.058166, -2.206225, 0, 0, 0, 1, 1,
-0.3587752, 1.914208, -1.543176, 0, 0, 0, 1, 1,
-0.3561924, 2.423075, -1.548576, 1, 1, 1, 1, 1,
-0.3487216, -0.9057916, -2.584651, 1, 1, 1, 1, 1,
-0.3444947, -0.8097034, -3.833575, 1, 1, 1, 1, 1,
-0.3414429, -0.1986858, -1.35185, 1, 1, 1, 1, 1,
-0.3384998, -0.3101178, -2.480806, 1, 1, 1, 1, 1,
-0.3374245, 1.505545, -0.03566489, 1, 1, 1, 1, 1,
-0.3344206, -0.4377871, -3.171983, 1, 1, 1, 1, 1,
-0.3338318, -0.7472872, -2.336515, 1, 1, 1, 1, 1,
-0.3334209, 1.117978, -1.230708, 1, 1, 1, 1, 1,
-0.324377, 0.3299267, -0.8421018, 1, 1, 1, 1, 1,
-0.3218912, 1.345593, 0.4687703, 1, 1, 1, 1, 1,
-0.3218394, 0.5619264, -0.3464864, 1, 1, 1, 1, 1,
-0.3191668, 0.3349844, -0.7472941, 1, 1, 1, 1, 1,
-0.3116638, -1.135039, -2.288765, 1, 1, 1, 1, 1,
-0.3106524, -0.4290903, -1.623726, 1, 1, 1, 1, 1,
-0.304515, 0.5185985, 0.6486151, 0, 0, 1, 1, 1,
-0.3024302, 0.7689447, -1.072904, 1, 0, 0, 1, 1,
-0.3020583, 0.1297634, -0.3240723, 1, 0, 0, 1, 1,
-0.2991858, -1.184381, -1.656076, 1, 0, 0, 1, 1,
-0.2861686, -0.4255878, -1.598684, 1, 0, 0, 1, 1,
-0.2855865, 1.216341, -0.5986128, 1, 0, 0, 1, 1,
-0.2832852, -0.05742579, -0.6586258, 0, 0, 0, 1, 1,
-0.2771115, 1.494892, -0.5649008, 0, 0, 0, 1, 1,
-0.2764854, -1.438461, -2.287135, 0, 0, 0, 1, 1,
-0.2749003, 0.176364, -1.413248, 0, 0, 0, 1, 1,
-0.2745988, 0.9246252, -0.3081154, 0, 0, 0, 1, 1,
-0.2720805, -0.07848522, -1.972519, 0, 0, 0, 1, 1,
-0.2671326, -0.4209139, -5.702852, 0, 0, 0, 1, 1,
-0.2593133, 0.02549405, -2.573554, 1, 1, 1, 1, 1,
-0.2552513, 0.8975539, -0.4047098, 1, 1, 1, 1, 1,
-0.2447939, -2.176514, -3.493798, 1, 1, 1, 1, 1,
-0.241326, 1.173804, -0.1509359, 1, 1, 1, 1, 1,
-0.2410667, -0.2288557, -1.377905, 1, 1, 1, 1, 1,
-0.2388417, 0.7959483, -0.3366794, 1, 1, 1, 1, 1,
-0.2372389, -0.2392277, -3.699955, 1, 1, 1, 1, 1,
-0.2361182, 0.4004403, 0.01630091, 1, 1, 1, 1, 1,
-0.2333435, 1.895623, 0.9634455, 1, 1, 1, 1, 1,
-0.2320926, -2.03846, -1.655052, 1, 1, 1, 1, 1,
-0.231468, 1.999145, -0.6574602, 1, 1, 1, 1, 1,
-0.2269488, -1.632218, -3.412408, 1, 1, 1, 1, 1,
-0.2260029, 0.186711, 0.8229018, 1, 1, 1, 1, 1,
-0.224304, -0.3289606, -2.854201, 1, 1, 1, 1, 1,
-0.216362, -1.02555, -2.26022, 1, 1, 1, 1, 1,
-0.2100955, -0.647278, -0.7601065, 0, 0, 1, 1, 1,
-0.2090489, 1.337545, -0.9640412, 1, 0, 0, 1, 1,
-0.2078677, -0.5417214, -1.048156, 1, 0, 0, 1, 1,
-0.2056682, 0.7441154, -0.5500214, 1, 0, 0, 1, 1,
-0.2032295, 2.581402, 0.3414162, 1, 0, 0, 1, 1,
-0.2028814, 0.4473929, 0.3739513, 1, 0, 0, 1, 1,
-0.2019, -0.3896536, -2.915419, 0, 0, 0, 1, 1,
-0.1949859, 0.8034936, 1.363241, 0, 0, 0, 1, 1,
-0.1859485, -0.8094103, -3.000842, 0, 0, 0, 1, 1,
-0.181097, -0.3877395, -3.784019, 0, 0, 0, 1, 1,
-0.1767859, 0.1626978, -2.536334, 0, 0, 0, 1, 1,
-0.1673097, 0.4977525, -2.487092, 0, 0, 0, 1, 1,
-0.1672468, 0.3069276, -0.5551978, 0, 0, 0, 1, 1,
-0.1665854, 1.568324, -0.329404, 1, 1, 1, 1, 1,
-0.1654666, 0.8952417, -0.0647549, 1, 1, 1, 1, 1,
-0.1652911, 0.0794198, -0.01880638, 1, 1, 1, 1, 1,
-0.1643538, -0.300052, -3.742836, 1, 1, 1, 1, 1,
-0.1633585, 0.2575411, -0.03910043, 1, 1, 1, 1, 1,
-0.1615165, -2.104955, -3.632641, 1, 1, 1, 1, 1,
-0.1606432, 0.7930065, 0.8980262, 1, 1, 1, 1, 1,
-0.1605134, 0.2952572, -1.491438, 1, 1, 1, 1, 1,
-0.1596052, -1.815115, -3.341175, 1, 1, 1, 1, 1,
-0.1551909, -1.277979, -1.892601, 1, 1, 1, 1, 1,
-0.146473, 0.327686, 0.9326732, 1, 1, 1, 1, 1,
-0.1458387, 2.288442, 0.5150769, 1, 1, 1, 1, 1,
-0.1438815, -0.374826, -2.271992, 1, 1, 1, 1, 1,
-0.1339541, 0.5608648, -1.304728, 1, 1, 1, 1, 1,
-0.133744, -0.8953454, -1.859467, 1, 1, 1, 1, 1,
-0.1285711, -1.102645, -2.080786, 0, 0, 1, 1, 1,
-0.1085587, 0.2056913, -0.731528, 1, 0, 0, 1, 1,
-0.1058026, 0.3935063, -0.9677391, 1, 0, 0, 1, 1,
-0.1027661, -0.7153189, -3.154807, 1, 0, 0, 1, 1,
-0.1014507, 0.01431413, -0.4522015, 1, 0, 0, 1, 1,
-0.09994306, -1.273893, -3.315033, 1, 0, 0, 1, 1,
-0.09942673, -0.4198143, -0.9868781, 0, 0, 0, 1, 1,
-0.09869144, 0.2806683, 0.1040029, 0, 0, 0, 1, 1,
-0.09630196, -0.7556844, -2.71261, 0, 0, 0, 1, 1,
-0.09212244, 0.2316018, -1.986376, 0, 0, 0, 1, 1,
-0.09192967, 0.384629, -0.03052696, 0, 0, 0, 1, 1,
-0.08924274, 0.9082408, 0.4201455, 0, 0, 0, 1, 1,
-0.08864062, -0.4014725, -4.473058, 0, 0, 0, 1, 1,
-0.08619183, 2.081826, -1.300889, 1, 1, 1, 1, 1,
-0.08081023, -1.503782, -2.996062, 1, 1, 1, 1, 1,
-0.07787362, -0.006973621, -2.773797, 1, 1, 1, 1, 1,
-0.07421084, -0.3753127, -3.435799, 1, 1, 1, 1, 1,
-0.07173943, 0.1014046, 0.8106987, 1, 1, 1, 1, 1,
-0.06263199, -0.7812491, -3.239711, 1, 1, 1, 1, 1,
-0.06240584, -2.594543, -3.688883, 1, 1, 1, 1, 1,
-0.06226002, -1.224367, -4.061309, 1, 1, 1, 1, 1,
-0.05823564, -0.01816599, -1.318624, 1, 1, 1, 1, 1,
-0.04604232, 0.4253246, -0.256648, 1, 1, 1, 1, 1,
-0.04382822, -0.3775487, -3.174943, 1, 1, 1, 1, 1,
-0.0431926, 0.84678, 1.254776, 1, 1, 1, 1, 1,
-0.0358679, 1.595047, 1.096964, 1, 1, 1, 1, 1,
-0.03503443, -0.3462229, -4.035984, 1, 1, 1, 1, 1,
-0.03246292, 0.7271612, -0.8495179, 1, 1, 1, 1, 1,
-0.03103272, 0.7749467, -1.391587, 0, 0, 1, 1, 1,
-0.03077698, -1.945906, -4.458361, 1, 0, 0, 1, 1,
-0.027034, 0.5558085, -0.6081468, 1, 0, 0, 1, 1,
-0.02522235, -0.3215927, -3.075945, 1, 0, 0, 1, 1,
-0.02394287, -0.7469263, -3.218898, 1, 0, 0, 1, 1,
-0.0219433, -0.7932414, -2.973397, 1, 0, 0, 1, 1,
-0.02107044, 1.062424, 1.170642, 0, 0, 0, 1, 1,
-0.01659187, 2.27667, 0.9777476, 0, 0, 0, 1, 1,
-0.0148145, -1.367639, -1.877203, 0, 0, 0, 1, 1,
-0.01409236, -1.270697, -3.213617, 0, 0, 0, 1, 1,
-0.01098892, -0.02287176, -4.815311, 0, 0, 0, 1, 1,
-0.007742449, -0.3908223, -1.185463, 0, 0, 0, 1, 1,
-0.007518723, 0.7900206, -0.02488216, 0, 0, 0, 1, 1,
-0.005533822, 0.5240673, -0.7619706, 1, 1, 1, 1, 1,
0.0003866131, 0.03196177, -0.2971934, 1, 1, 1, 1, 1,
0.0008701, -2.687893, 1.186952, 1, 1, 1, 1, 1,
0.00518467, 0.2263255, -0.3847306, 1, 1, 1, 1, 1,
0.007493118, 2.175848, 0.698688, 1, 1, 1, 1, 1,
0.007571761, 0.5232955, 1.330377, 1, 1, 1, 1, 1,
0.008663001, -0.2411997, 3.347003, 1, 1, 1, 1, 1,
0.008919357, 0.3609539, 0.2455309, 1, 1, 1, 1, 1,
0.009623406, 0.00286489, 1.665581, 1, 1, 1, 1, 1,
0.01213923, -1.030253, 1.571334, 1, 1, 1, 1, 1,
0.01251548, 0.02702225, 0.894457, 1, 1, 1, 1, 1,
0.01304864, 1.335711, 0.9846176, 1, 1, 1, 1, 1,
0.01362503, -1.348116, 2.35625, 1, 1, 1, 1, 1,
0.01446664, 1.382769, -1.108586, 1, 1, 1, 1, 1,
0.01473579, 1.012586, -0.7066889, 1, 1, 1, 1, 1,
0.01511636, 0.4492746, -1.658923, 0, 0, 1, 1, 1,
0.01556975, 1.164235, -0.2822357, 1, 0, 0, 1, 1,
0.01905619, 0.1567785, 0.003253399, 1, 0, 0, 1, 1,
0.02166378, 1.05841, 0.4606322, 1, 0, 0, 1, 1,
0.02213855, 1.043811, -0.6640384, 1, 0, 0, 1, 1,
0.02433085, -0.9748982, 2.076947, 1, 0, 0, 1, 1,
0.0251882, 1.253005, 0.4819531, 0, 0, 0, 1, 1,
0.0260768, -0.9885199, 3.100268, 0, 0, 0, 1, 1,
0.02938916, 1.076734, 0.6857091, 0, 0, 0, 1, 1,
0.02943367, -0.001783569, 0.8598216, 0, 0, 0, 1, 1,
0.03511866, 0.5151088, 0.3563909, 0, 0, 0, 1, 1,
0.03699486, -1.253868, 3.728877, 0, 0, 0, 1, 1,
0.03777746, 0.9620546, -1.639454, 0, 0, 0, 1, 1,
0.03995002, 0.4005359, 0.1482931, 1, 1, 1, 1, 1,
0.04075651, 2.535951, 1.013027, 1, 1, 1, 1, 1,
0.04585078, -1.117715, 4.684391, 1, 1, 1, 1, 1,
0.04636401, 1.797665, 1.234516, 1, 1, 1, 1, 1,
0.04708286, 0.6078021, 0.221676, 1, 1, 1, 1, 1,
0.04839906, 0.2094599, 0.6113744, 1, 1, 1, 1, 1,
0.04896808, -1.485525, 1.314975, 1, 1, 1, 1, 1,
0.05167563, -1.099984, 4.485513, 1, 1, 1, 1, 1,
0.05272084, -0.7419261, 3.049264, 1, 1, 1, 1, 1,
0.05454094, 1.428171, 1.834146, 1, 1, 1, 1, 1,
0.05808549, -0.8564034, 2.435026, 1, 1, 1, 1, 1,
0.05879762, 1.227141, -0.3421912, 1, 1, 1, 1, 1,
0.05894352, -0.0303819, 3.375945, 1, 1, 1, 1, 1,
0.0589631, 2.384176, -0.8607627, 1, 1, 1, 1, 1,
0.06073236, 0.7216185, 1.183275, 1, 1, 1, 1, 1,
0.0670021, -1.010487, 3.072482, 0, 0, 1, 1, 1,
0.06862187, -0.8458012, 3.637695, 1, 0, 0, 1, 1,
0.07762159, -1.610956, 3.434882, 1, 0, 0, 1, 1,
0.07866447, -0.4727026, 0.6651258, 1, 0, 0, 1, 1,
0.08026034, -0.7956863, 2.643901, 1, 0, 0, 1, 1,
0.08052861, 0.3140313, -1.023684, 1, 0, 0, 1, 1,
0.08361579, -0.2892178, 2.508979, 0, 0, 0, 1, 1,
0.08558173, 0.5261365, -0.5369791, 0, 0, 0, 1, 1,
0.08697494, 2.040629, 1.077297, 0, 0, 0, 1, 1,
0.09031818, -0.490724, 3.057566, 0, 0, 0, 1, 1,
0.09259515, -1.028215, 2.996883, 0, 0, 0, 1, 1,
0.0954155, 0.8888192, -0.2656467, 0, 0, 0, 1, 1,
0.09560601, -1.019475, 1.765856, 0, 0, 0, 1, 1,
0.101238, -0.7657552, 3.161754, 1, 1, 1, 1, 1,
0.1019488, -1.26335, 3.036101, 1, 1, 1, 1, 1,
0.1046266, 1.422816, 1.357558, 1, 1, 1, 1, 1,
0.1056762, 0.5750019, 0.8444086, 1, 1, 1, 1, 1,
0.1191822, -0.7200027, 4.000137, 1, 1, 1, 1, 1,
0.1204552, -0.9344673, 2.12192, 1, 1, 1, 1, 1,
0.1236685, 0.000780075, 1.972059, 1, 1, 1, 1, 1,
0.124078, -0.28473, 2.016888, 1, 1, 1, 1, 1,
0.1248075, 0.192095, 0.1253437, 1, 1, 1, 1, 1,
0.1269163, 1.985555, 0.05320823, 1, 1, 1, 1, 1,
0.129012, -0.470386, 3.422023, 1, 1, 1, 1, 1,
0.1308863, -0.2519019, 3.863498, 1, 1, 1, 1, 1,
0.1350321, -0.2536133, 3.142896, 1, 1, 1, 1, 1,
0.1354993, -1.210086, 3.980255, 1, 1, 1, 1, 1,
0.1385972, 1.0022, 0.01959561, 1, 1, 1, 1, 1,
0.141842, 1.366493, 0.8453185, 0, 0, 1, 1, 1,
0.1448457, -0.5302425, 2.218201, 1, 0, 0, 1, 1,
0.1448785, 0.8977767, 1.225989, 1, 0, 0, 1, 1,
0.1456519, -0.7975271, 4.275886, 1, 0, 0, 1, 1,
0.1459138, 0.4237364, -0.5083616, 1, 0, 0, 1, 1,
0.1468215, 0.4672114, -0.6881596, 1, 0, 0, 1, 1,
0.1488537, -0.1153648, 2.501525, 0, 0, 0, 1, 1,
0.153874, 2.309859, -0.9048243, 0, 0, 0, 1, 1,
0.1550421, -1.512814, 3.590635, 0, 0, 0, 1, 1,
0.1650331, -0.059706, 1.895716, 0, 0, 0, 1, 1,
0.1653307, 0.2283481, 0.2928853, 0, 0, 0, 1, 1,
0.1654819, 0.149656, 0.6430426, 0, 0, 0, 1, 1,
0.1659629, -1.807992, 2.664018, 0, 0, 0, 1, 1,
0.1689649, 1.12028, 1.699893, 1, 1, 1, 1, 1,
0.1716154, 0.8519367, 1.298284, 1, 1, 1, 1, 1,
0.1768737, -0.3932506, 3.634745, 1, 1, 1, 1, 1,
0.17948, -0.7382012, 3.252638, 1, 1, 1, 1, 1,
0.1795898, -0.5249057, 2.579968, 1, 1, 1, 1, 1,
0.1811683, 1.231347, -1.817799, 1, 1, 1, 1, 1,
0.1894924, 0.2611568, -1.685459, 1, 1, 1, 1, 1,
0.1899358, -0.6165298, 1.288757, 1, 1, 1, 1, 1,
0.1926716, 0.3861469, 1.361736, 1, 1, 1, 1, 1,
0.1954433, -0.328818, 3.243113, 1, 1, 1, 1, 1,
0.1979939, -0.6503208, 3.932626, 1, 1, 1, 1, 1,
0.1989942, 0.7671668, 0.1232529, 1, 1, 1, 1, 1,
0.2052761, -1.695527, 3.139537, 1, 1, 1, 1, 1,
0.2097702, 1.198744, -0.3651187, 1, 1, 1, 1, 1,
0.2137336, -0.07391915, 1.869713, 1, 1, 1, 1, 1,
0.2154711, 1.545263, 0.6390698, 0, 0, 1, 1, 1,
0.2204588, -0.2285165, 3.124109, 1, 0, 0, 1, 1,
0.2288872, 0.5396088, -0.9488636, 1, 0, 0, 1, 1,
0.229073, 0.04745344, 0.1080852, 1, 0, 0, 1, 1,
0.230636, 1.331308, 0.9105099, 1, 0, 0, 1, 1,
0.2325861, -0.0003855197, 0.2796684, 1, 0, 0, 1, 1,
0.2331722, -1.014177, 2.942462, 0, 0, 0, 1, 1,
0.234428, -0.1827909, 2.267768, 0, 0, 0, 1, 1,
0.2357549, 0.1848309, 0.859252, 0, 0, 0, 1, 1,
0.2364738, -0.7639011, 0.08297986, 0, 0, 0, 1, 1,
0.2407508, -0.5730913, 2.469468, 0, 0, 0, 1, 1,
0.2415338, -0.5306017, 2.063292, 0, 0, 0, 1, 1,
0.2416529, 0.2363288, 1.626671, 0, 0, 0, 1, 1,
0.2448806, -0.3813516, 1.753791, 1, 1, 1, 1, 1,
0.2500218, 0.5435236, -0.6647187, 1, 1, 1, 1, 1,
0.2542934, -3.093051, 4.452436, 1, 1, 1, 1, 1,
0.2543836, -0.2313285, 4.16037, 1, 1, 1, 1, 1,
0.2636486, 0.3126568, -1.347133, 1, 1, 1, 1, 1,
0.2652978, 0.5110869, 1.060046, 1, 1, 1, 1, 1,
0.2676685, -1.50691, 3.276158, 1, 1, 1, 1, 1,
0.2695661, 0.5506996, 1.605852, 1, 1, 1, 1, 1,
0.2712196, 1.249293, -0.955474, 1, 1, 1, 1, 1,
0.2752403, -0.5812728, 1.402862, 1, 1, 1, 1, 1,
0.2785814, 1.038211, -0.6003954, 1, 1, 1, 1, 1,
0.2807672, -0.1629051, 3.184376, 1, 1, 1, 1, 1,
0.281109, 0.574489, -0.3935295, 1, 1, 1, 1, 1,
0.2814038, 1.684928, 2.650567, 1, 1, 1, 1, 1,
0.2834455, 1.740691, -0.02149392, 1, 1, 1, 1, 1,
0.2864374, -0.9852934, 2.287086, 0, 0, 1, 1, 1,
0.2921616, -1.285438, 2.659874, 1, 0, 0, 1, 1,
0.2971677, 1.908878, -2.562228, 1, 0, 0, 1, 1,
0.2974434, -1.503349, 1.654241, 1, 0, 0, 1, 1,
0.2994963, 1.133924, -0.1405195, 1, 0, 0, 1, 1,
0.3015689, 0.3434036, 1.554296, 1, 0, 0, 1, 1,
0.3023862, 0.7479699, 0.412944, 0, 0, 0, 1, 1,
0.3024952, 0.9410526, 0.6259562, 0, 0, 0, 1, 1,
0.3065563, 0.2008998, 2.45613, 0, 0, 0, 1, 1,
0.3082964, -0.9979165, 3.336714, 0, 0, 0, 1, 1,
0.3104195, -0.3981597, 2.215149, 0, 0, 0, 1, 1,
0.3117265, 1.572542, -0.2368457, 0, 0, 0, 1, 1,
0.3153254, -0.1122395, 0.09152855, 0, 0, 0, 1, 1,
0.3165852, -0.9521062, 3.680525, 1, 1, 1, 1, 1,
0.319286, -1.663038, 4.440049, 1, 1, 1, 1, 1,
0.3256349, 2.220773, 0.9437858, 1, 1, 1, 1, 1,
0.3266574, -0.2047865, 0.6583709, 1, 1, 1, 1, 1,
0.327665, -0.6929535, 1.047913, 1, 1, 1, 1, 1,
0.3285096, 0.4665804, 0.7279568, 1, 1, 1, 1, 1,
0.331683, 1.352861, -1.340038, 1, 1, 1, 1, 1,
0.3317746, 3.93703, -1.747422, 1, 1, 1, 1, 1,
0.3322054, 0.3488266, 1.104407, 1, 1, 1, 1, 1,
0.3382552, 1.510864, 0.1321014, 1, 1, 1, 1, 1,
0.3415717, -0.6448193, 2.475602, 1, 1, 1, 1, 1,
0.3416499, 0.565144, 0.1986177, 1, 1, 1, 1, 1,
0.3420037, 0.9179874, -0.5056686, 1, 1, 1, 1, 1,
0.3471559, 0.12249, 2.009731, 1, 1, 1, 1, 1,
0.3489946, -0.5845484, 3.767302, 1, 1, 1, 1, 1,
0.3515113, 0.1166629, 3.485251, 0, 0, 1, 1, 1,
0.3541799, 1.638074, 0.06020519, 1, 0, 0, 1, 1,
0.356848, -1.163809, 2.792702, 1, 0, 0, 1, 1,
0.3604338, -0.8922738, 3.756592, 1, 0, 0, 1, 1,
0.3620445, -0.8310373, 1.807425, 1, 0, 0, 1, 1,
0.3668876, 1.032522, 0.6293714, 1, 0, 0, 1, 1,
0.3668946, 0.6861685, 1.149988, 0, 0, 0, 1, 1,
0.3675171, -0.09614437, 3.691586, 0, 0, 0, 1, 1,
0.368652, 0.9160773, 0.7326944, 0, 0, 0, 1, 1,
0.3689129, -0.2558323, 1.79572, 0, 0, 0, 1, 1,
0.3727972, 0.3549843, -0.22578, 0, 0, 0, 1, 1,
0.3766996, 0.2725248, 1.572397, 0, 0, 0, 1, 1,
0.3784774, -0.3130647, 4.523427, 0, 0, 0, 1, 1,
0.3820249, 1.820165, 2.830665, 1, 1, 1, 1, 1,
0.3850277, 1.026672, 0.02449353, 1, 1, 1, 1, 1,
0.3855363, -3.693345, 3.130012, 1, 1, 1, 1, 1,
0.3897547, 0.309635, 1.017842, 1, 1, 1, 1, 1,
0.3975083, 0.6155461, -0.4887714, 1, 1, 1, 1, 1,
0.3993056, 0.8991747, 0.5938846, 1, 1, 1, 1, 1,
0.4001652, 1.020721, 0.01836258, 1, 1, 1, 1, 1,
0.4058564, 1.531682, -0.1892025, 1, 1, 1, 1, 1,
0.4070016, -0.3194428, 2.021876, 1, 1, 1, 1, 1,
0.4092173, 0.7911879, 1.914483, 1, 1, 1, 1, 1,
0.4134369, 0.1685094, 0.1427979, 1, 1, 1, 1, 1,
0.4145326, -1.570666, 2.786113, 1, 1, 1, 1, 1,
0.41519, -0.6538319, 1.597853, 1, 1, 1, 1, 1,
0.4164886, 0.03583018, 1.176036, 1, 1, 1, 1, 1,
0.4174549, -0.08717397, 1.750642, 1, 1, 1, 1, 1,
0.422897, -0.1317906, 0.1675149, 0, 0, 1, 1, 1,
0.4258939, -0.9334426, 3.019799, 1, 0, 0, 1, 1,
0.426038, -0.2275734, 2.978838, 1, 0, 0, 1, 1,
0.4331651, 0.1134411, 0.9927393, 1, 0, 0, 1, 1,
0.4348322, 0.1359713, 1.638237, 1, 0, 0, 1, 1,
0.4362933, -0.2653112, 2.414176, 1, 0, 0, 1, 1,
0.4382131, 0.8038575, 0.5837424, 0, 0, 0, 1, 1,
0.4418653, -0.3972335, 3.080017, 0, 0, 0, 1, 1,
0.4476891, 1.082801, 1.347086, 0, 0, 0, 1, 1,
0.4483249, 1.213352, -0.1303377, 0, 0, 0, 1, 1,
0.4486833, 0.17953, 0.05355907, 0, 0, 0, 1, 1,
0.4502369, 0.6408347, 1.946972, 0, 0, 0, 1, 1,
0.4570942, 0.2944816, 0.4151926, 0, 0, 0, 1, 1,
0.4599499, 1.201052, 0.7663314, 1, 1, 1, 1, 1,
0.4632566, -0.3703496, 2.815688, 1, 1, 1, 1, 1,
0.4648028, 0.3084599, 2.023572, 1, 1, 1, 1, 1,
0.4651507, 0.3801611, -0.6585097, 1, 1, 1, 1, 1,
0.46752, -0.3127019, 1.743282, 1, 1, 1, 1, 1,
0.4720775, 0.6274871, 1.22282, 1, 1, 1, 1, 1,
0.4766982, -0.04060655, 2.486065, 1, 1, 1, 1, 1,
0.4834397, -0.2463153, 1.76795, 1, 1, 1, 1, 1,
0.4845893, -1.017937, 3.132257, 1, 1, 1, 1, 1,
0.4895071, -2.250112, 2.719005, 1, 1, 1, 1, 1,
0.4901919, -1.199456, 3.953741, 1, 1, 1, 1, 1,
0.4973432, -1.762242, 3.831068, 1, 1, 1, 1, 1,
0.5018197, -1.767658, 3.014808, 1, 1, 1, 1, 1,
0.5018914, 0.6647212, 1.044061, 1, 1, 1, 1, 1,
0.501919, 0.7097521, -0.264001, 1, 1, 1, 1, 1,
0.5037119, 1.034313, 0.5135121, 0, 0, 1, 1, 1,
0.5055839, -0.1244185, 2.254949, 1, 0, 0, 1, 1,
0.5061762, 0.3378748, 1.318004, 1, 0, 0, 1, 1,
0.5085379, -1.353475, 2.513707, 1, 0, 0, 1, 1,
0.5114916, 1.005504, -1.199801, 1, 0, 0, 1, 1,
0.5202173, 0.02018617, 1.892731, 1, 0, 0, 1, 1,
0.5239988, -1.282791, 2.455888, 0, 0, 0, 1, 1,
0.5268393, -1.212791, 1.559059, 0, 0, 0, 1, 1,
0.5269763, 1.664474, 1.011426, 0, 0, 0, 1, 1,
0.5285928, -0.1471823, 1.747568, 0, 0, 0, 1, 1,
0.5287151, 0.8722512, -0.7671907, 0, 0, 0, 1, 1,
0.5293589, 0.4020473, 0.6252639, 0, 0, 0, 1, 1,
0.5303289, -0.02207467, 2.131552, 0, 0, 0, 1, 1,
0.5318475, 0.9189228, 0.5813704, 1, 1, 1, 1, 1,
0.5340618, -1.799847, 1.527614, 1, 1, 1, 1, 1,
0.5386975, 0.1245707, -0.3731006, 1, 1, 1, 1, 1,
0.546795, 0.2981487, 1.442439, 1, 1, 1, 1, 1,
0.5500751, 1.496446, 0.1431588, 1, 1, 1, 1, 1,
0.5520328, -0.07456148, 1.878767, 1, 1, 1, 1, 1,
0.555122, -1.265592, 1.837994, 1, 1, 1, 1, 1,
0.556451, -0.5161625, 2.294827, 1, 1, 1, 1, 1,
0.5571645, -0.1265119, 0.1977454, 1, 1, 1, 1, 1,
0.5591748, 1.197137, 0.3126816, 1, 1, 1, 1, 1,
0.5600787, -1.625943, 2.87448, 1, 1, 1, 1, 1,
0.5695863, 0.5358428, 1.477846, 1, 1, 1, 1, 1,
0.5732831, 0.1091903, 2.545648, 1, 1, 1, 1, 1,
0.5768321, 1.17807, 0.8392825, 1, 1, 1, 1, 1,
0.5782437, -0.8776147, 1.737529, 1, 1, 1, 1, 1,
0.5820074, -1.628584, 4.01387, 0, 0, 1, 1, 1,
0.5828819, 1.141021, 1.30556, 1, 0, 0, 1, 1,
0.5833876, -0.4048747, 4.848278, 1, 0, 0, 1, 1,
0.5862762, 1.49115, -0.2954235, 1, 0, 0, 1, 1,
0.5893984, -1.427434, 2.458081, 1, 0, 0, 1, 1,
0.5896727, -1.393027, 2.431561, 1, 0, 0, 1, 1,
0.5936228, -0.9578, 1.876988, 0, 0, 0, 1, 1,
0.593958, -0.389414, 0.2851268, 0, 0, 0, 1, 1,
0.5994918, -0.548695, 2.751693, 0, 0, 0, 1, 1,
0.6003993, 0.126833, 2.252531, 0, 0, 0, 1, 1,
0.6026372, -0.853205, 3.393425, 0, 0, 0, 1, 1,
0.6063617, -1.397584, 2.318812, 0, 0, 0, 1, 1,
0.6099665, 2.355491, -0.4451598, 0, 0, 0, 1, 1,
0.6102947, 0.595434, -1.137249, 1, 1, 1, 1, 1,
0.6147308, -0.06953412, 0.668282, 1, 1, 1, 1, 1,
0.6148959, -0.5340737, 1.572035, 1, 1, 1, 1, 1,
0.6156354, 0.1090762, 1.099468, 1, 1, 1, 1, 1,
0.6195324, -0.1307222, 2.131367, 1, 1, 1, 1, 1,
0.6214835, -0.8950297, 3.861671, 1, 1, 1, 1, 1,
0.6240348, -0.6032932, 2.947387, 1, 1, 1, 1, 1,
0.6240912, -0.2863613, 1.802494, 1, 1, 1, 1, 1,
0.6242302, 0.003626327, 0.59979, 1, 1, 1, 1, 1,
0.6298442, -1.23336, 2.951412, 1, 1, 1, 1, 1,
0.631654, 0.3371644, 0.8554353, 1, 1, 1, 1, 1,
0.6371046, -1.451825, 3.956374, 1, 1, 1, 1, 1,
0.6447644, 0.1090297, 1.856879, 1, 1, 1, 1, 1,
0.6462381, -0.5596548, 1.912325, 1, 1, 1, 1, 1,
0.6477584, 1.148596, 1.285046, 1, 1, 1, 1, 1,
0.6495938, -0.1668678, 0.3427912, 0, 0, 1, 1, 1,
0.650708, -1.192541, 1.392659, 1, 0, 0, 1, 1,
0.6513634, -0.9815139, 2.285431, 1, 0, 0, 1, 1,
0.6515355, 0.2133993, 1.207342, 1, 0, 0, 1, 1,
0.6540072, -1.189184, 4.544443, 1, 0, 0, 1, 1,
0.6552443, -0.7404245, 1.528906, 1, 0, 0, 1, 1,
0.655845, 0.6696221, -1.080825, 0, 0, 0, 1, 1,
0.6581029, -0.05314475, 0.6483112, 0, 0, 0, 1, 1,
0.6584053, -0.107849, 2.19197, 0, 0, 0, 1, 1,
0.6593735, 0.3380321, 2.174477, 0, 0, 0, 1, 1,
0.6594101, 1.104199, -1.007101, 0, 0, 0, 1, 1,
0.6639541, -0.7300831, 1.313834, 0, 0, 0, 1, 1,
0.6649328, 0.3571828, 0.007024369, 0, 0, 0, 1, 1,
0.6681661, -1.360858, 3.715582, 1, 1, 1, 1, 1,
0.6693975, 0.5443234, 1.055286, 1, 1, 1, 1, 1,
0.6729495, -2.182039, 2.401636, 1, 1, 1, 1, 1,
0.6751397, 1.063502, 1.797538, 1, 1, 1, 1, 1,
0.6765024, 0.4193567, 0.8192992, 1, 1, 1, 1, 1,
0.6848598, 0.7057652, 0.7006261, 1, 1, 1, 1, 1,
0.6895884, 0.159411, 2.10044, 1, 1, 1, 1, 1,
0.6909549, 0.3436342, 1.051703, 1, 1, 1, 1, 1,
0.6939953, 1.072388, 0.1826306, 1, 1, 1, 1, 1,
0.6996685, 0.2175672, 3.081608, 1, 1, 1, 1, 1,
0.7048153, 0.515739, 1.02365, 1, 1, 1, 1, 1,
0.7110684, -0.5506894, 1.655062, 1, 1, 1, 1, 1,
0.7113094, 0.7580275, -0.1685759, 1, 1, 1, 1, 1,
0.7134324, -0.1098898, 4.200172, 1, 1, 1, 1, 1,
0.7195168, 0.8604523, 1.074742, 1, 1, 1, 1, 1,
0.7315143, -0.7486697, 1.396982, 0, 0, 1, 1, 1,
0.7400988, 1.256415, -0.02377352, 1, 0, 0, 1, 1,
0.7476182, 0.2771414, 0.6648135, 1, 0, 0, 1, 1,
0.7478495, -0.662066, 2.826459, 1, 0, 0, 1, 1,
0.7487104, -0.7237884, 0.2296134, 1, 0, 0, 1, 1,
0.7545696, -1.528174, 3.178752, 1, 0, 0, 1, 1,
0.7567397, 1.805972, -0.6334119, 0, 0, 0, 1, 1,
0.760807, -1.180705, 3.218388, 0, 0, 0, 1, 1,
0.7668843, -0.7974539, 0.7917575, 0, 0, 0, 1, 1,
0.7735538, -0.09142599, 1.57106, 0, 0, 0, 1, 1,
0.7774706, 1.57542, 1.332395, 0, 0, 0, 1, 1,
0.779647, -0.113908, 1.84732, 0, 0, 0, 1, 1,
0.7827198, 0.6745433, 0.9397602, 0, 0, 0, 1, 1,
0.7838235, 0.4464302, -0.06192757, 1, 1, 1, 1, 1,
0.7871, 0.3729696, 0.6483809, 1, 1, 1, 1, 1,
0.7897973, 0.1574206, -0.004411868, 1, 1, 1, 1, 1,
0.7945009, 1.600873, 1.706483, 1, 1, 1, 1, 1,
0.7994702, -0.4985984, 2.092435, 1, 1, 1, 1, 1,
0.7994739, -1.490313, 3.642975, 1, 1, 1, 1, 1,
0.8018366, 1.034693, -0.3925975, 1, 1, 1, 1, 1,
0.8045824, 0.9322484, 0.9837324, 1, 1, 1, 1, 1,
0.8201114, -0.06380839, 0.6579269, 1, 1, 1, 1, 1,
0.8207701, -0.1400121, 0.5301364, 1, 1, 1, 1, 1,
0.8335723, -2.057564, 4.181551, 1, 1, 1, 1, 1,
0.8349054, 0.492269, 2.33176, 1, 1, 1, 1, 1,
0.8352548, 1.187066, 0.5777496, 1, 1, 1, 1, 1,
0.8414529, 0.4580296, -0.2478311, 1, 1, 1, 1, 1,
0.8444995, -1.232918, 2.991901, 1, 1, 1, 1, 1,
0.8488134, -1.504914, 3.608586, 0, 0, 1, 1, 1,
0.8492696, 0.09498185, 4.287847, 1, 0, 0, 1, 1,
0.8523642, 0.3133402, 0.2931072, 1, 0, 0, 1, 1,
0.8527497, -0.08343775, 1.06158, 1, 0, 0, 1, 1,
0.8531497, 0.7006636, 0.8531507, 1, 0, 0, 1, 1,
0.8595227, 0.7974159, 1.370488, 1, 0, 0, 1, 1,
0.8607579, -1.43991, 2.623787, 0, 0, 0, 1, 1,
0.8625865, 0.9611277, 0.7482173, 0, 0, 0, 1, 1,
0.8721415, 0.0861733, 3.51464, 0, 0, 0, 1, 1,
0.8867859, 0.3450953, 1.493791, 0, 0, 0, 1, 1,
0.8900917, 0.5172373, 0.1470656, 0, 0, 0, 1, 1,
0.891629, -2.208218, 2.603238, 0, 0, 0, 1, 1,
0.8952382, 0.03657716, 0.2029807, 0, 0, 0, 1, 1,
0.8954539, 0.1616123, 0.7895697, 1, 1, 1, 1, 1,
0.8999503, -1.716293, 0.8015945, 1, 1, 1, 1, 1,
0.9096527, 0.9574601, -2.383653, 1, 1, 1, 1, 1,
0.9269481, 1.157628, 0.3093594, 1, 1, 1, 1, 1,
0.9274171, -0.7883688, 0.3330422, 1, 1, 1, 1, 1,
0.9288986, 1.210057, 0.8275605, 1, 1, 1, 1, 1,
0.9351584, 1.648474, -0.006051215, 1, 1, 1, 1, 1,
0.9355954, 0.5463197, 0.2635665, 1, 1, 1, 1, 1,
0.9358344, -0.4904579, -0.1034791, 1, 1, 1, 1, 1,
0.9377866, -0.5788216, 2.792211, 1, 1, 1, 1, 1,
0.9382346, -0.9994769, 0.8961024, 1, 1, 1, 1, 1,
0.93847, 0.2849712, 1.346737, 1, 1, 1, 1, 1,
0.9393879, -0.08421065, 1.508034, 1, 1, 1, 1, 1,
0.9410231, -0.1806565, -0.3636011, 1, 1, 1, 1, 1,
0.941769, -1.701432, 3.54506, 1, 1, 1, 1, 1,
0.9580777, 1.740122, 0.2734849, 0, 0, 1, 1, 1,
0.962148, 0.5160128, 0.7639055, 1, 0, 0, 1, 1,
0.962551, 0.1115386, 2.001864, 1, 0, 0, 1, 1,
0.9735645, -0.8476523, 2.63578, 1, 0, 0, 1, 1,
0.9817473, 0.2657259, -0.4552994, 1, 0, 0, 1, 1,
0.9863656, 2.393469, 1.368024, 1, 0, 0, 1, 1,
0.9893996, -0.8429955, 1.676277, 0, 0, 0, 1, 1,
0.9923374, 1.008345, -0.3785221, 0, 0, 0, 1, 1,
0.9944274, -0.514132, 0.4924142, 0, 0, 0, 1, 1,
0.9980436, -1.392796, 0.9172124, 0, 0, 0, 1, 1,
1.003204, -1.987837, 1.930643, 0, 0, 0, 1, 1,
1.010597, 0.2284801, 1.350291, 0, 0, 0, 1, 1,
1.018666, 0.5225186, 2.483638, 0, 0, 0, 1, 1,
1.022524, 0.7639496, 2.931838, 1, 1, 1, 1, 1,
1.023129, 0.3769905, 2.953509, 1, 1, 1, 1, 1,
1.024179, 0.3601515, 1.737399, 1, 1, 1, 1, 1,
1.029037, 0.2305678, 1.004296, 1, 1, 1, 1, 1,
1.034201, 0.2951002, 1.022305, 1, 1, 1, 1, 1,
1.03554, -0.6839906, 2.01274, 1, 1, 1, 1, 1,
1.042876, 0.0001622706, 3.285194, 1, 1, 1, 1, 1,
1.047805, -0.5317798, 1.756919, 1, 1, 1, 1, 1,
1.049894, -0.3977693, 3.134287, 1, 1, 1, 1, 1,
1.05857, 0.3163744, 1.589472, 1, 1, 1, 1, 1,
1.066564, 0.6338491, 2.640555, 1, 1, 1, 1, 1,
1.070238, 0.3030474, 1.024131, 1, 1, 1, 1, 1,
1.072515, 1.1269, -0.1813855, 1, 1, 1, 1, 1,
1.074136, 0.47964, -0.2702549, 1, 1, 1, 1, 1,
1.07736, -1.362832, 1.967886, 1, 1, 1, 1, 1,
1.084017, -1.136338, 4.034607, 0, 0, 1, 1, 1,
1.08768, -0.4666615, 1.496607, 1, 0, 0, 1, 1,
1.087736, 1.307565, 0.9380983, 1, 0, 0, 1, 1,
1.091167, 0.3650626, 2.401083, 1, 0, 0, 1, 1,
1.109519, -2.465855, 1.883711, 1, 0, 0, 1, 1,
1.111839, 0.588859, 1.233595, 1, 0, 0, 1, 1,
1.113274, -0.639987, 2.630916, 0, 0, 0, 1, 1,
1.118771, 0.7314852, 0.4711394, 0, 0, 0, 1, 1,
1.121722, 0.7051764, 0.7404787, 0, 0, 0, 1, 1,
1.122172, -1.15685, 3.580877, 0, 0, 0, 1, 1,
1.123326, 0.445323, 1.747457, 0, 0, 0, 1, 1,
1.126626, -0.1715936, 1.973506, 0, 0, 0, 1, 1,
1.142833, 0.7684572, 2.310655, 0, 0, 0, 1, 1,
1.162085, -0.5016908, 2.573321, 1, 1, 1, 1, 1,
1.175503, -0.2491954, 2.506793, 1, 1, 1, 1, 1,
1.184602, 0.458172, 2.623557, 1, 1, 1, 1, 1,
1.195061, 1.40409, 1.372406, 1, 1, 1, 1, 1,
1.201525, 1.181633, 0.3228566, 1, 1, 1, 1, 1,
1.203929, -0.1182191, 1.940873, 1, 1, 1, 1, 1,
1.208764, 0.424062, 3.206624, 1, 1, 1, 1, 1,
1.212308, -0.7458802, 1.423539, 1, 1, 1, 1, 1,
1.219431, -1.101888, 3.359901, 1, 1, 1, 1, 1,
1.223775, -1.070441, 4.517243, 1, 1, 1, 1, 1,
1.228961, 0.2918135, 0.4837682, 1, 1, 1, 1, 1,
1.233863, 0.5248578, 0.5721329, 1, 1, 1, 1, 1,
1.237121, 0.7854913, 1.045019, 1, 1, 1, 1, 1,
1.237933, -0.7848713, 1.800845, 1, 1, 1, 1, 1,
1.245602, 2.609799, -0.298097, 1, 1, 1, 1, 1,
1.257709, 1.575012, -0.137047, 0, 0, 1, 1, 1,
1.276409, -0.4009608, 1.393227, 1, 0, 0, 1, 1,
1.278628, -0.4823577, 2.093056, 1, 0, 0, 1, 1,
1.280464, 0.1353876, 1.097536, 1, 0, 0, 1, 1,
1.293685, 0.1403262, 1.769342, 1, 0, 0, 1, 1,
1.301484, 0.2362686, 0.8690997, 1, 0, 0, 1, 1,
1.309131, -0.8490001, 3.763891, 0, 0, 0, 1, 1,
1.313739, 1.81349, 0.4969263, 0, 0, 0, 1, 1,
1.32281, 1.43849, 2.499135, 0, 0, 0, 1, 1,
1.326807, 0.7048912, 0.4952989, 0, 0, 0, 1, 1,
1.33319, -0.321805, 1.562984, 0, 0, 0, 1, 1,
1.341874, -1.728305, 0.6645645, 0, 0, 0, 1, 1,
1.343563, -0.4344105, 1.113383, 0, 0, 0, 1, 1,
1.345571, 1.057132, 0.09126639, 1, 1, 1, 1, 1,
1.351659, -0.3178633, 0.739274, 1, 1, 1, 1, 1,
1.358004, -0.07718324, 2.845247, 1, 1, 1, 1, 1,
1.365281, -0.3123877, 2.691476, 1, 1, 1, 1, 1,
1.374004, 0.1391153, 0.9711812, 1, 1, 1, 1, 1,
1.380918, -0.4966451, 2.366794, 1, 1, 1, 1, 1,
1.387781, 0.9872686, 2.524675, 1, 1, 1, 1, 1,
1.390924, -0.1192423, 1.617951, 1, 1, 1, 1, 1,
1.399478, 1.137663, 1.055869, 1, 1, 1, 1, 1,
1.401232, 0.0009627839, 1.808699, 1, 1, 1, 1, 1,
1.402421, -0.7503946, 3.227238, 1, 1, 1, 1, 1,
1.408183, 1.002247, 0.9237761, 1, 1, 1, 1, 1,
1.427172, -0.3092165, 1.509096, 1, 1, 1, 1, 1,
1.448641, -0.03727654, 0.9868978, 1, 1, 1, 1, 1,
1.461188, 1.197061, 1.917324, 1, 1, 1, 1, 1,
1.466824, -0.3254071, 1.843426, 0, 0, 1, 1, 1,
1.472338, -1.616488, 2.907025, 1, 0, 0, 1, 1,
1.480925, 0.9181616, 0.1201686, 1, 0, 0, 1, 1,
1.500962, 0.3998871, 3.084022, 1, 0, 0, 1, 1,
1.501462, -0.5936847, 1.718328, 1, 0, 0, 1, 1,
1.517157, 1.007186, 0.4886923, 1, 0, 0, 1, 1,
1.525261, -1.454159, 1.042377, 0, 0, 0, 1, 1,
1.532592, -1.040826, 2.897676, 0, 0, 0, 1, 1,
1.53688, 0.9282062, 1.371899, 0, 0, 0, 1, 1,
1.552004, -0.2966729, 0.4487467, 0, 0, 0, 1, 1,
1.560338, 0.2695385, 1.563238, 0, 0, 0, 1, 1,
1.566432, -0.3275745, 0.4647848, 0, 0, 0, 1, 1,
1.582417, -0.05525772, 1.637187, 0, 0, 0, 1, 1,
1.584349, 0.4590022, 0.17156, 1, 1, 1, 1, 1,
1.587868, -0.5304933, 3.655028, 1, 1, 1, 1, 1,
1.593893, 1.389831, 0.03454081, 1, 1, 1, 1, 1,
1.628481, -0.6545187, 1.037817, 1, 1, 1, 1, 1,
1.635758, 0.3612697, 2.048706, 1, 1, 1, 1, 1,
1.64633, 0.7756238, 0.9642806, 1, 1, 1, 1, 1,
1.661534, -1.138841, 2.752374, 1, 1, 1, 1, 1,
1.669416, 1.428065, -0.1788014, 1, 1, 1, 1, 1,
1.671986, -0.7438445, 2.631941, 1, 1, 1, 1, 1,
1.672378, -0.5702571, 1.107391, 1, 1, 1, 1, 1,
1.701346, -0.4529273, 0.8708702, 1, 1, 1, 1, 1,
1.705256, -1.345962, 1.618411, 1, 1, 1, 1, 1,
1.725366, 0.303998, 2.522289, 1, 1, 1, 1, 1,
1.746876, -1.044472, 1.842369, 1, 1, 1, 1, 1,
1.752094, 0.7457143, 0.156713, 1, 1, 1, 1, 1,
1.770277, -0.217696, 1.250019, 0, 0, 1, 1, 1,
1.775514, -2.047646, 3.223764, 1, 0, 0, 1, 1,
1.78882, -0.3245605, 2.834179, 1, 0, 0, 1, 1,
1.793901, -0.9239929, 1.199789, 1, 0, 0, 1, 1,
1.79556, -2.050569, 2.728835, 1, 0, 0, 1, 1,
1.8042, 1.013056, 0.5993708, 1, 0, 0, 1, 1,
1.810056, 0.6570443, 1.494932, 0, 0, 0, 1, 1,
1.862571, -0.2482807, 2.119133, 0, 0, 0, 1, 1,
1.863959, -0.06891121, 0.3243506, 0, 0, 0, 1, 1,
1.89001, 1.200059, -0.6447256, 0, 0, 0, 1, 1,
1.893206, 1.380059, 2.085914, 0, 0, 0, 1, 1,
1.900502, 0.3616496, -0.513979, 0, 0, 0, 1, 1,
1.907113, -0.5129106, 3.605909, 0, 0, 0, 1, 1,
1.917211, -2.113817, 1.075615, 1, 1, 1, 1, 1,
1.936477, 0.1627053, 1.134428, 1, 1, 1, 1, 1,
1.960126, -1.184929, 1.745883, 1, 1, 1, 1, 1,
1.966975, -0.6336955, 1.484035, 1, 1, 1, 1, 1,
1.967955, 0.01116859, 1.447044, 1, 1, 1, 1, 1,
1.971198, -0.9388587, 1.814818, 1, 1, 1, 1, 1,
2.000866, -0.9573681, 2.906208, 1, 1, 1, 1, 1,
2.013041, -0.08595429, 0.02934059, 1, 1, 1, 1, 1,
2.014, -0.03333107, 0.9201121, 1, 1, 1, 1, 1,
2.049966, 0.6189455, 0.1647042, 1, 1, 1, 1, 1,
2.074959, -1.100276, 2.659744, 1, 1, 1, 1, 1,
2.076542, 0.440194, -0.07886475, 1, 1, 1, 1, 1,
2.07878, -0.5252228, 2.708858, 1, 1, 1, 1, 1,
2.100194, 1.740226, 0.1917942, 1, 1, 1, 1, 1,
2.119819, -2.07647, 2.895088, 1, 1, 1, 1, 1,
2.132911, -0.5851879, 0.5481808, 0, 0, 1, 1, 1,
2.156586, -0.03963371, 2.058236, 1, 0, 0, 1, 1,
2.191309, -1.419524, 2.982728, 1, 0, 0, 1, 1,
2.218788, 1.806071, 1.057877, 1, 0, 0, 1, 1,
2.227104, -1.162877, -0.2806346, 1, 0, 0, 1, 1,
2.268799, 3.041045, 1.773249, 1, 0, 0, 1, 1,
2.28547, 2.313153, -0.6670998, 0, 0, 0, 1, 1,
2.29658, 1.254382, 1.604155, 0, 0, 0, 1, 1,
2.309286, 0.1430137, 2.869781, 0, 0, 0, 1, 1,
2.379227, 1.354605, 2.149352, 0, 0, 0, 1, 1,
2.401887, 1.852628, 1.402002, 0, 0, 0, 1, 1,
2.437116, -0.7991599, 3.49418, 0, 0, 0, 1, 1,
2.476688, 0.5280073, 2.052115, 0, 0, 0, 1, 1,
2.504418, 1.37959, -0.1241921, 1, 1, 1, 1, 1,
2.577523, -0.3725858, 1.558832, 1, 1, 1, 1, 1,
2.607295, 1.581442, -1.617199, 1, 1, 1, 1, 1,
2.664588, -0.174385, 0.3174829, 1, 1, 1, 1, 1,
2.684891, 0.292204, 2.503111, 1, 1, 1, 1, 1,
2.865196, 0.651612, -0.1940813, 1, 1, 1, 1, 1,
2.890118, -1.166071, 0.3443992, 1, 1, 1, 1, 1
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
var radius = 9.701943;
var distance = 34.07767;
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
mvMatrix.translate( 0.01151633, -0.1218424, 0.4272871 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07767);
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