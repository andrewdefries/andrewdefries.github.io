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
-3.453806, -0.34125, -0.3576552, 1, 0, 0, 1,
-3.218559, -2.231974, -3.649531, 1, 0.007843138, 0, 1,
-2.905642, 0.2886928, -0.974107, 1, 0.01176471, 0, 1,
-2.87561, 0.5320404, -1.186612, 1, 0.01960784, 0, 1,
-2.837598, -0.3631324, -3.155085, 1, 0.02352941, 0, 1,
-2.791416, 1.075318, -0.655017, 1, 0.03137255, 0, 1,
-2.747641, 0.1664532, -2.477155, 1, 0.03529412, 0, 1,
-2.704715, 1.073285, 0.4504237, 1, 0.04313726, 0, 1,
-2.621693, -0.7719638, -1.261994, 1, 0.04705882, 0, 1,
-2.621336, -0.8011322, -1.877413, 1, 0.05490196, 0, 1,
-2.564144, 0.06389888, -0.7966685, 1, 0.05882353, 0, 1,
-2.562358, -1.956013, -1.836622, 1, 0.06666667, 0, 1,
-2.50433, -1.005569, -1.834898, 1, 0.07058824, 0, 1,
-2.378572, -1.768947, -2.275386, 1, 0.07843138, 0, 1,
-2.33603, 0.4832, -1.59575, 1, 0.08235294, 0, 1,
-2.291991, -0.7244788, -0.6767312, 1, 0.09019608, 0, 1,
-2.245011, -0.1400867, -2.882668, 1, 0.09411765, 0, 1,
-2.215685, -0.7486033, -0.7111072, 1, 0.1019608, 0, 1,
-2.171104, -0.653119, -1.255085, 1, 0.1098039, 0, 1,
-2.120444, 0.5428019, -1.813333, 1, 0.1137255, 0, 1,
-2.075025, 0.1456154, -0.000847946, 1, 0.1215686, 0, 1,
-2.02388, -0.2811849, -2.213375, 1, 0.1254902, 0, 1,
-1.998094, -1.405196, -2.660122, 1, 0.1333333, 0, 1,
-1.98106, 1.912936, -1.529455, 1, 0.1372549, 0, 1,
-1.980409, 0.700773, -0.6423454, 1, 0.145098, 0, 1,
-1.965124, -1.167317, -2.912272, 1, 0.1490196, 0, 1,
-1.95475, 0.04976651, -1.901052, 1, 0.1568628, 0, 1,
-1.949458, -1.407168, -3.984477, 1, 0.1607843, 0, 1,
-1.938545, -1.679449, -2.11688, 1, 0.1686275, 0, 1,
-1.911341, -0.8984293, -1.570277, 1, 0.172549, 0, 1,
-1.882064, 0.6349839, 0.2620152, 1, 0.1803922, 0, 1,
-1.876473, -0.9127731, -0.5455035, 1, 0.1843137, 0, 1,
-1.872933, -0.9295863, -2.325474, 1, 0.1921569, 0, 1,
-1.829162, 0.7178342, -1.893325, 1, 0.1960784, 0, 1,
-1.828132, 1.436061, -2.34249, 1, 0.2039216, 0, 1,
-1.823555, 1.303939, -1.456891, 1, 0.2117647, 0, 1,
-1.820665, -0.4022061, -1.598544, 1, 0.2156863, 0, 1,
-1.815195, 0.2732533, -1.063936, 1, 0.2235294, 0, 1,
-1.805632, -1.756461, -1.671445, 1, 0.227451, 0, 1,
-1.786755, -0.390896, -3.007132, 1, 0.2352941, 0, 1,
-1.784919, -1.359633, -0.6451352, 1, 0.2392157, 0, 1,
-1.751117, -0.1609602, -1.326829, 1, 0.2470588, 0, 1,
-1.722834, -1.372167, -1.938352, 1, 0.2509804, 0, 1,
-1.71568, -0.5850259, 0.4156119, 1, 0.2588235, 0, 1,
-1.70363, 0.2271272, -2.035985, 1, 0.2627451, 0, 1,
-1.676517, -0.2858784, 0.4655044, 1, 0.2705882, 0, 1,
-1.654529, -0.9172307, -2.410716, 1, 0.2745098, 0, 1,
-1.649053, 0.9159447, -1.980264, 1, 0.282353, 0, 1,
-1.648142, 0.0205284, 0.3678228, 1, 0.2862745, 0, 1,
-1.644157, -0.3687839, -1.992959, 1, 0.2941177, 0, 1,
-1.634057, -1.04325, -1.37076, 1, 0.3019608, 0, 1,
-1.613425, -1.543911, -1.933325, 1, 0.3058824, 0, 1,
-1.613136, 1.908566, -0.8199065, 1, 0.3137255, 0, 1,
-1.603108, 0.1116278, -1.904593, 1, 0.3176471, 0, 1,
-1.596603, -0.4968242, -1.108938, 1, 0.3254902, 0, 1,
-1.5849, -0.2255099, -1.323918, 1, 0.3294118, 0, 1,
-1.584486, 0.4279059, -0.2265912, 1, 0.3372549, 0, 1,
-1.564541, 0.8870883, -0.8479617, 1, 0.3411765, 0, 1,
-1.557927, -1.614894, -1.714594, 1, 0.3490196, 0, 1,
-1.538072, 0.5522373, -1.598146, 1, 0.3529412, 0, 1,
-1.537222, 0.2554278, -3.790006, 1, 0.3607843, 0, 1,
-1.537188, 0.09444891, -1.099329, 1, 0.3647059, 0, 1,
-1.526922, -1.784637, -2.566725, 1, 0.372549, 0, 1,
-1.521097, -0.6647877, -1.70057, 1, 0.3764706, 0, 1,
-1.510076, -2.162513, -2.709327, 1, 0.3843137, 0, 1,
-1.503578, 0.9849773, -2.19489, 1, 0.3882353, 0, 1,
-1.502679, 1.371335, -0.9652497, 1, 0.3960784, 0, 1,
-1.499309, -0.311798, -1.216459, 1, 0.4039216, 0, 1,
-1.494704, 0.1527737, -1.043111, 1, 0.4078431, 0, 1,
-1.491631, -1.077882, -0.8743284, 1, 0.4156863, 0, 1,
-1.489223, -0.4869761, -2.826067, 1, 0.4196078, 0, 1,
-1.476917, 0.6825263, -1.981356, 1, 0.427451, 0, 1,
-1.442367, -1.041443, -2.180662, 1, 0.4313726, 0, 1,
-1.43257, -0.5086009, 0.3613247, 1, 0.4392157, 0, 1,
-1.431066, 0.7789844, -0.8497429, 1, 0.4431373, 0, 1,
-1.423606, -1.068464, -2.243817, 1, 0.4509804, 0, 1,
-1.416737, 2.32463, -0.7416226, 1, 0.454902, 0, 1,
-1.415549, -0.2270238, -1.148097, 1, 0.4627451, 0, 1,
-1.405227, 0.00169057, -1.98266, 1, 0.4666667, 0, 1,
-1.401242, -0.2742627, -2.205364, 1, 0.4745098, 0, 1,
-1.399543, 0.581729, -2.043598, 1, 0.4784314, 0, 1,
-1.399178, -1.149477, -3.703231, 1, 0.4862745, 0, 1,
-1.389638, -1.083169, -0.1643914, 1, 0.4901961, 0, 1,
-1.382779, -0.6691586, -1.964965, 1, 0.4980392, 0, 1,
-1.371856, -0.9811879, -2.861376, 1, 0.5058824, 0, 1,
-1.364847, -0.8378419, -1.439762, 1, 0.509804, 0, 1,
-1.354605, -2.497474, -1.574033, 1, 0.5176471, 0, 1,
-1.352186, 0.2218481, -1.227507, 1, 0.5215687, 0, 1,
-1.348562, 0.02995552, -1.749305, 1, 0.5294118, 0, 1,
-1.344456, -1.605774, -2.11588, 1, 0.5333334, 0, 1,
-1.342323, -0.4749531, -3.017091, 1, 0.5411765, 0, 1,
-1.330234, -0.712183, -2.263795, 1, 0.5450981, 0, 1,
-1.323488, -0.7598692, -0.04588696, 1, 0.5529412, 0, 1,
-1.311296, -1.647192, -2.456984, 1, 0.5568628, 0, 1,
-1.30975, -0.8790251, -1.593451, 1, 0.5647059, 0, 1,
-1.297181, -1.245518, -3.812853, 1, 0.5686275, 0, 1,
-1.29682, -0.5057814, -1.830808, 1, 0.5764706, 0, 1,
-1.29629, -0.8436825, 0.3488777, 1, 0.5803922, 0, 1,
-1.283252, 0.3468253, -1.691279, 1, 0.5882353, 0, 1,
-1.277045, 0.05013029, -3.16272, 1, 0.5921569, 0, 1,
-1.273349, -1.064976, -1.729251, 1, 0.6, 0, 1,
-1.273129, 1.052493, -1.071775, 1, 0.6078432, 0, 1,
-1.272205, 0.1277572, -0.6067323, 1, 0.6117647, 0, 1,
-1.268904, -0.07217735, -3.758644, 1, 0.6196079, 0, 1,
-1.266428, -1.091664, -2.46931, 1, 0.6235294, 0, 1,
-1.263891, 1.36043, -2.625712, 1, 0.6313726, 0, 1,
-1.262217, -0.4951349, -0.03551391, 1, 0.6352941, 0, 1,
-1.261762, -2.042237, -2.875989, 1, 0.6431373, 0, 1,
-1.260125, -0.9263334, -1.570905, 1, 0.6470588, 0, 1,
-1.24691, -0.7911913, -2.666162, 1, 0.654902, 0, 1,
-1.246757, 0.208538, -1.047235, 1, 0.6588235, 0, 1,
-1.246312, 1.602797, -0.8115281, 1, 0.6666667, 0, 1,
-1.240871, 1.421112, -0.5705675, 1, 0.6705883, 0, 1,
-1.236004, 0.2927069, -3.237777, 1, 0.6784314, 0, 1,
-1.235383, 0.2501659, -0.5764059, 1, 0.682353, 0, 1,
-1.197729, 1.361781, -0.8336279, 1, 0.6901961, 0, 1,
-1.190994, -0.6785924, -1.86722, 1, 0.6941177, 0, 1,
-1.183092, 0.4617524, 0.6343068, 1, 0.7019608, 0, 1,
-1.180765, 0.925543, -2.13876, 1, 0.7098039, 0, 1,
-1.174995, 0.451606, -0.1685458, 1, 0.7137255, 0, 1,
-1.160373, 0.6331235, -1.391821, 1, 0.7215686, 0, 1,
-1.159497, -0.3495749, -2.776175, 1, 0.7254902, 0, 1,
-1.157301, 1.113208, -2.30597, 1, 0.7333333, 0, 1,
-1.156577, 0.8481563, 0.4627279, 1, 0.7372549, 0, 1,
-1.15572, -0.3493795, -2.516898, 1, 0.7450981, 0, 1,
-1.155712, -1.554666, -1.436825, 1, 0.7490196, 0, 1,
-1.142953, -0.1005344, -3.487511, 1, 0.7568628, 0, 1,
-1.138738, -0.006022419, -1.487692, 1, 0.7607843, 0, 1,
-1.138406, 0.1671537, -2.035317, 1, 0.7686275, 0, 1,
-1.133686, 0.5697617, -2.028698, 1, 0.772549, 0, 1,
-1.129418, 0.3784301, -1.919527, 1, 0.7803922, 0, 1,
-1.129204, 1.346272, -1.277373, 1, 0.7843137, 0, 1,
-1.126747, -0.159638, -2.324422, 1, 0.7921569, 0, 1,
-1.117875, -1.742615, -2.609525, 1, 0.7960784, 0, 1,
-1.110794, -0.02565303, -0.5686808, 1, 0.8039216, 0, 1,
-1.108841, -0.04730386, -1.048383, 1, 0.8117647, 0, 1,
-1.102648, -0.09912284, -2.010739, 1, 0.8156863, 0, 1,
-1.093475, -0.08891015, -1.562497, 1, 0.8235294, 0, 1,
-1.08952, 1.419701, -1.411262, 1, 0.827451, 0, 1,
-1.08687, 1.431283, -0.6607564, 1, 0.8352941, 0, 1,
-1.084635, 1.15888, 0.4624763, 1, 0.8392157, 0, 1,
-1.079829, 1.429169, 0.8388094, 1, 0.8470588, 0, 1,
-1.072844, -1.18308, -3.040569, 1, 0.8509804, 0, 1,
-1.070255, -0.6762332, -2.419206, 1, 0.8588235, 0, 1,
-1.066677, 0.3825915, -0.6455055, 1, 0.8627451, 0, 1,
-1.064643, 0.2110875, -1.393882, 1, 0.8705882, 0, 1,
-1.060158, -0.5040436, -1.938354, 1, 0.8745098, 0, 1,
-1.059217, 0.1713627, -1.555544, 1, 0.8823529, 0, 1,
-1.059157, -0.9382017, -3.58423, 1, 0.8862745, 0, 1,
-1.053146, -0.02105881, -2.664338, 1, 0.8941177, 0, 1,
-1.051814, 0.4138112, -0.4780746, 1, 0.8980392, 0, 1,
-1.041587, 0.5208746, -1.578187, 1, 0.9058824, 0, 1,
-1.032849, -0.4978578, -2.8037, 1, 0.9137255, 0, 1,
-1.021844, -0.9218653, -1.807599, 1, 0.9176471, 0, 1,
-1.021842, -1.171561, -0.6721008, 1, 0.9254902, 0, 1,
-1.009718, -0.3123282, -2.390164, 1, 0.9294118, 0, 1,
-1.00619, 1.654342, 0.6700635, 1, 0.9372549, 0, 1,
-1.00287, 0.7677817, -1.173495, 1, 0.9411765, 0, 1,
-1.001082, 0.5881582, -1.136367, 1, 0.9490196, 0, 1,
-0.9911968, 0.3879766, -2.434821, 1, 0.9529412, 0, 1,
-0.98634, 1.73199, -0.5471509, 1, 0.9607843, 0, 1,
-0.9863108, 0.8042496, -0.4100437, 1, 0.9647059, 0, 1,
-0.9854874, 0.004256977, -1.969944, 1, 0.972549, 0, 1,
-0.9781607, 0.2139022, -0.2741491, 1, 0.9764706, 0, 1,
-0.9768024, 0.4636034, -1.721248, 1, 0.9843137, 0, 1,
-0.9754461, 0.06162702, -0.6728486, 1, 0.9882353, 0, 1,
-0.970491, 0.133375, -3.777444, 1, 0.9960784, 0, 1,
-0.969157, 0.8074825, -1.748733, 0.9960784, 1, 0, 1,
-0.9442828, -1.420462, -3.131067, 0.9921569, 1, 0, 1,
-0.9359215, 2.574986, 0.3106504, 0.9843137, 1, 0, 1,
-0.9353104, 2.004851, -0.7804516, 0.9803922, 1, 0, 1,
-0.9333913, 0.3664536, -0.05449478, 0.972549, 1, 0, 1,
-0.9252979, 1.381638, -0.9969918, 0.9686275, 1, 0, 1,
-0.9234313, 0.3240476, -0.8427494, 0.9607843, 1, 0, 1,
-0.9151897, 0.7163135, -1.756522, 0.9568627, 1, 0, 1,
-0.91267, -0.7273636, -2.08831, 0.9490196, 1, 0, 1,
-0.9117462, 1.093212, -0.6214623, 0.945098, 1, 0, 1,
-0.9069172, -0.7202145, -2.374916, 0.9372549, 1, 0, 1,
-0.9068124, 0.2105984, -1.115355, 0.9333333, 1, 0, 1,
-0.906697, 0.2503333, -0.4703812, 0.9254902, 1, 0, 1,
-0.9028642, -0.4326996, -1.784851, 0.9215686, 1, 0, 1,
-0.9017466, -1.012017, -3.304492, 0.9137255, 1, 0, 1,
-0.8954813, 1.663347, -0.6862422, 0.9098039, 1, 0, 1,
-0.8902435, 0.2878118, 1.168279, 0.9019608, 1, 0, 1,
-0.8896101, -0.2699562, -0.4649382, 0.8941177, 1, 0, 1,
-0.8875794, 0.6479296, -1.433388, 0.8901961, 1, 0, 1,
-0.8874906, 0.8398579, -2.720455, 0.8823529, 1, 0, 1,
-0.8836959, -0.4808881, -1.940202, 0.8784314, 1, 0, 1,
-0.8819978, -0.2463049, -2.568808, 0.8705882, 1, 0, 1,
-0.8762094, 0.790104, -2.40308, 0.8666667, 1, 0, 1,
-0.8737323, 0.7498462, -1.917374, 0.8588235, 1, 0, 1,
-0.8713499, -0.8750502, -4.011167, 0.854902, 1, 0, 1,
-0.8699698, 1.504451, -0.7408872, 0.8470588, 1, 0, 1,
-0.8696925, -0.2044377, -2.019006, 0.8431373, 1, 0, 1,
-0.8583059, 1.407089, -1.928936, 0.8352941, 1, 0, 1,
-0.8568618, -0.6383443, -1.777187, 0.8313726, 1, 0, 1,
-0.8553285, 1.404516, -0.9797596, 0.8235294, 1, 0, 1,
-0.8549573, 0.635193, -1.274828, 0.8196079, 1, 0, 1,
-0.8546904, -0.2688283, -1.07111, 0.8117647, 1, 0, 1,
-0.8517212, 0.03311616, -0.9264547, 0.8078431, 1, 0, 1,
-0.8495966, 1.259283, 0.1961344, 0.8, 1, 0, 1,
-0.8431286, -1.019095, -2.246056, 0.7921569, 1, 0, 1,
-0.8374701, 0.7201471, -0.4501145, 0.7882353, 1, 0, 1,
-0.833734, 0.1021946, 0.5656968, 0.7803922, 1, 0, 1,
-0.8317549, 1.440907, -2.075448, 0.7764706, 1, 0, 1,
-0.8289372, -0.09754115, -3.669602, 0.7686275, 1, 0, 1,
-0.8284621, 0.6000179, -1.351552, 0.7647059, 1, 0, 1,
-0.8230673, -0.7491417, -3.069477, 0.7568628, 1, 0, 1,
-0.8230131, 1.421328, -1.549817, 0.7529412, 1, 0, 1,
-0.8229102, -0.8119343, -1.970428, 0.7450981, 1, 0, 1,
-0.8208355, -1.173016, -3.039872, 0.7411765, 1, 0, 1,
-0.8142251, -0.2520635, -1.469182, 0.7333333, 1, 0, 1,
-0.8102978, -0.2474259, -3.028148, 0.7294118, 1, 0, 1,
-0.8099879, 0.361797, -2.781235, 0.7215686, 1, 0, 1,
-0.8050254, 0.1715324, -2.785432, 0.7176471, 1, 0, 1,
-0.8045403, 1.611597, 1.360842, 0.7098039, 1, 0, 1,
-0.7985114, -0.2792869, -1.855918, 0.7058824, 1, 0, 1,
-0.7939188, -0.6264865, -3.132238, 0.6980392, 1, 0, 1,
-0.7875251, 1.793688, 1.460664, 0.6901961, 1, 0, 1,
-0.7823684, -0.8583227, -2.755447, 0.6862745, 1, 0, 1,
-0.777916, 0.5022159, -1.183292, 0.6784314, 1, 0, 1,
-0.775228, 0.6234323, -0.2191336, 0.6745098, 1, 0, 1,
-0.7725569, -0.2125023, -0.8462614, 0.6666667, 1, 0, 1,
-0.7711348, -0.0342234, -1.289658, 0.6627451, 1, 0, 1,
-0.7644298, 1.2732, -1.14492, 0.654902, 1, 0, 1,
-0.7636251, -0.9136608, -2.502469, 0.6509804, 1, 0, 1,
-0.7628608, -1.623757, -4.908214, 0.6431373, 1, 0, 1,
-0.7615952, -1.595292, -1.335683, 0.6392157, 1, 0, 1,
-0.7588009, -0.3045417, -2.908364, 0.6313726, 1, 0, 1,
-0.7489436, -2.088449, -4.05128, 0.627451, 1, 0, 1,
-0.7474822, 0.520615, 0.3941041, 0.6196079, 1, 0, 1,
-0.7440471, 0.472955, -2.091323, 0.6156863, 1, 0, 1,
-0.7408085, -0.5931581, -2.647305, 0.6078432, 1, 0, 1,
-0.7379078, 0.5417484, -0.934018, 0.6039216, 1, 0, 1,
-0.735332, 0.01918489, -2.302645, 0.5960785, 1, 0, 1,
-0.7325574, -1.039939, -1.269747, 0.5882353, 1, 0, 1,
-0.7288998, -1.574041, -4.227058, 0.5843138, 1, 0, 1,
-0.7284325, 0.1046707, -3.354596, 0.5764706, 1, 0, 1,
-0.7278992, 0.8380857, -1.273685, 0.572549, 1, 0, 1,
-0.718729, 0.5833103, -1.640166, 0.5647059, 1, 0, 1,
-0.7184348, -0.3623925, -2.209058, 0.5607843, 1, 0, 1,
-0.7174488, 0.5921315, -0.008403691, 0.5529412, 1, 0, 1,
-0.7143697, -1.73801, -3.581657, 0.5490196, 1, 0, 1,
-0.7120696, -0.09098681, -3.475309, 0.5411765, 1, 0, 1,
-0.7088875, -0.1100291, -2.697442, 0.5372549, 1, 0, 1,
-0.705215, 0.3000204, -0.5559044, 0.5294118, 1, 0, 1,
-0.7040201, -1.004998, -2.051998, 0.5254902, 1, 0, 1,
-0.6985379, -0.832779, -1.538675, 0.5176471, 1, 0, 1,
-0.6959221, 1.244043, -0.9914041, 0.5137255, 1, 0, 1,
-0.6937634, 0.4014027, -1.735157, 0.5058824, 1, 0, 1,
-0.6925343, 1.174605, -0.7322943, 0.5019608, 1, 0, 1,
-0.6900566, -1.650182, -1.005772, 0.4941176, 1, 0, 1,
-0.6873512, 0.6610214, 0.2052718, 0.4862745, 1, 0, 1,
-0.6854408, -0.635544, -2.001666, 0.4823529, 1, 0, 1,
-0.6848831, -0.4906875, -2.166962, 0.4745098, 1, 0, 1,
-0.6835737, 0.7062153, -1.129167, 0.4705882, 1, 0, 1,
-0.6834204, 2.012696, -0.2432427, 0.4627451, 1, 0, 1,
-0.6800802, -0.001567104, -1.287162, 0.4588235, 1, 0, 1,
-0.6797244, 1.34982, -0.1677472, 0.4509804, 1, 0, 1,
-0.6791525, -0.4140024, -4.098475, 0.4470588, 1, 0, 1,
-0.6756606, 1.051672, 0.5711889, 0.4392157, 1, 0, 1,
-0.6738877, -0.8659973, -2.09935, 0.4352941, 1, 0, 1,
-0.6738772, 0.1002202, -0.7502497, 0.427451, 1, 0, 1,
-0.6707059, 0.01852382, -0.8362726, 0.4235294, 1, 0, 1,
-0.6660088, -0.7709928, -3.605356, 0.4156863, 1, 0, 1,
-0.6645364, 0.722455, 1.364027, 0.4117647, 1, 0, 1,
-0.6619589, -1.5601, -3.359645, 0.4039216, 1, 0, 1,
-0.6616064, -1.694675, -0.2958953, 0.3960784, 1, 0, 1,
-0.6582531, 1.349887, -0.4811687, 0.3921569, 1, 0, 1,
-0.6578398, -0.0368776, -2.161094, 0.3843137, 1, 0, 1,
-0.6560764, 0.7353995, -0.2732692, 0.3803922, 1, 0, 1,
-0.6525487, 0.6967174, -0.9928157, 0.372549, 1, 0, 1,
-0.6474534, -0.1600377, -1.032518, 0.3686275, 1, 0, 1,
-0.6430517, -0.8067394, -2.230947, 0.3607843, 1, 0, 1,
-0.634611, -1.172145, -1.463876, 0.3568628, 1, 0, 1,
-0.6337146, 0.8373055, -1.535467, 0.3490196, 1, 0, 1,
-0.6327059, -1.542821, -1.441425, 0.345098, 1, 0, 1,
-0.6296821, 2.061767, -0.3182929, 0.3372549, 1, 0, 1,
-0.6254769, -1.306777, -3.550906, 0.3333333, 1, 0, 1,
-0.6199213, 0.2666035, 0.7071726, 0.3254902, 1, 0, 1,
-0.6170648, -1.59201, -1.864676, 0.3215686, 1, 0, 1,
-0.615428, 0.8430351, -1.838076, 0.3137255, 1, 0, 1,
-0.6126599, -0.9570642, -3.752422, 0.3098039, 1, 0, 1,
-0.6096169, -1.331528, -2.937238, 0.3019608, 1, 0, 1,
-0.5977694, -0.5402014, -4.641827, 0.2941177, 1, 0, 1,
-0.5970737, 1.05492, 0.4286949, 0.2901961, 1, 0, 1,
-0.592801, 0.3614931, -0.414073, 0.282353, 1, 0, 1,
-0.5887687, -2.050708, -3.093917, 0.2784314, 1, 0, 1,
-0.5881754, -0.02031672, -0.2507647, 0.2705882, 1, 0, 1,
-0.5876774, 0.465804, -1.88949, 0.2666667, 1, 0, 1,
-0.5863957, -1.131673, -1.985826, 0.2588235, 1, 0, 1,
-0.5839813, 0.3399531, -0.147163, 0.254902, 1, 0, 1,
-0.5809752, -0.09521279, -2.481721, 0.2470588, 1, 0, 1,
-0.5784897, 1.091241, -0.682246, 0.2431373, 1, 0, 1,
-0.5738624, -0.06087452, -2.363621, 0.2352941, 1, 0, 1,
-0.5728381, -1.985356, -2.523471, 0.2313726, 1, 0, 1,
-0.5705411, 1.061692, -1.59702, 0.2235294, 1, 0, 1,
-0.5659178, 0.7667482, -1.433112, 0.2196078, 1, 0, 1,
-0.5506459, 1.103779, -1.772495, 0.2117647, 1, 0, 1,
-0.5480664, 0.4019329, -1.70179, 0.2078431, 1, 0, 1,
-0.5470225, -0.838329, -4.158268, 0.2, 1, 0, 1,
-0.5453017, 0.470569, 1.04617, 0.1921569, 1, 0, 1,
-0.5396075, -1.274103, -4.510534, 0.1882353, 1, 0, 1,
-0.5374076, -1.113795, -5.721111, 0.1803922, 1, 0, 1,
-0.5372111, 0.4110385, -0.4434511, 0.1764706, 1, 0, 1,
-0.535633, -1.468287, -2.323943, 0.1686275, 1, 0, 1,
-0.5351639, -0.1626764, -2.712578, 0.1647059, 1, 0, 1,
-0.5349006, 0.2335452, -2.170648, 0.1568628, 1, 0, 1,
-0.5330493, -0.6804165, -4.320894, 0.1529412, 1, 0, 1,
-0.5304123, -0.546378, -3.539918, 0.145098, 1, 0, 1,
-0.526758, -0.6551346, -1.015974, 0.1411765, 1, 0, 1,
-0.5263038, 2.835534, 0.1842625, 0.1333333, 1, 0, 1,
-0.524867, 1.138738, -0.1514925, 0.1294118, 1, 0, 1,
-0.522408, 0.7360704, -2.652206, 0.1215686, 1, 0, 1,
-0.5187733, -0.5041575, -3.388811, 0.1176471, 1, 0, 1,
-0.5169759, 0.1200533, -1.328734, 0.1098039, 1, 0, 1,
-0.5147488, 0.7543312, -0.8092983, 0.1058824, 1, 0, 1,
-0.5143424, -1.434417, -2.458125, 0.09803922, 1, 0, 1,
-0.5101751, 0.3565257, -1.409817, 0.09019608, 1, 0, 1,
-0.5090714, 1.067904, -2.386724, 0.08627451, 1, 0, 1,
-0.5075194, -0.8378134, -3.306346, 0.07843138, 1, 0, 1,
-0.5051297, -0.07030924, -0.8769912, 0.07450981, 1, 0, 1,
-0.5049864, -0.3354622, -2.308121, 0.06666667, 1, 0, 1,
-0.5032633, -0.2415621, -3.899846, 0.0627451, 1, 0, 1,
-0.4998565, -0.6276601, -2.407489, 0.05490196, 1, 0, 1,
-0.4869131, -1.089978, -3.110044, 0.05098039, 1, 0, 1,
-0.4843125, -0.5300524, -3.583307, 0.04313726, 1, 0, 1,
-0.4807529, 0.3856796, -1.30086, 0.03921569, 1, 0, 1,
-0.4775694, 1.821489, 0.03469459, 0.03137255, 1, 0, 1,
-0.4767336, -0.5352765, -1.529866, 0.02745098, 1, 0, 1,
-0.474065, 1.046329, -2.24588, 0.01960784, 1, 0, 1,
-0.4730559, 1.36423, 0.06716793, 0.01568628, 1, 0, 1,
-0.4694273, -1.234449, -3.195523, 0.007843138, 1, 0, 1,
-0.4679249, 0.6282075, 0.8162748, 0.003921569, 1, 0, 1,
-0.4679166, 0.2225051, -0.1801321, 0, 1, 0.003921569, 1,
-0.467434, -0.4445518, -3.44193, 0, 1, 0.01176471, 1,
-0.4640352, -1.800697, -4.02809, 0, 1, 0.01568628, 1,
-0.4625416, 0.6889336, -0.7064489, 0, 1, 0.02352941, 1,
-0.4559709, -0.4465246, -2.271368, 0, 1, 0.02745098, 1,
-0.4474595, 0.06651792, -3.162916, 0, 1, 0.03529412, 1,
-0.4430368, -0.5402098, -3.178769, 0, 1, 0.03921569, 1,
-0.4429647, -1.317689, -2.514452, 0, 1, 0.04705882, 1,
-0.4374249, -0.4154712, -4.206077, 0, 1, 0.05098039, 1,
-0.4347921, -0.2786525, -2.839152, 0, 1, 0.05882353, 1,
-0.4318454, -0.3764453, -0.7525738, 0, 1, 0.0627451, 1,
-0.4306784, 0.5769021, 0.0464637, 0, 1, 0.07058824, 1,
-0.428859, -1.756284, -3.420799, 0, 1, 0.07450981, 1,
-0.4261467, -0.3847467, -2.440663, 0, 1, 0.08235294, 1,
-0.422647, -0.8530105, -3.660426, 0, 1, 0.08627451, 1,
-0.4203863, 1.040527, -0.326898, 0, 1, 0.09411765, 1,
-0.4202232, 0.4047068, -1.631838, 0, 1, 0.1019608, 1,
-0.4170903, 0.3433689, -0.6001405, 0, 1, 0.1058824, 1,
-0.4162552, -0.9655749, -1.983691, 0, 1, 0.1137255, 1,
-0.4150405, 0.09686057, -1.59371, 0, 1, 0.1176471, 1,
-0.4143187, -1.289145, -4.10275, 0, 1, 0.1254902, 1,
-0.4132284, 0.9821731, -0.1596462, 0, 1, 0.1294118, 1,
-0.4097862, -0.06407405, -3.427385, 0, 1, 0.1372549, 1,
-0.4083513, 0.6008816, 0.188114, 0, 1, 0.1411765, 1,
-0.4067399, -0.2948253, -2.51009, 0, 1, 0.1490196, 1,
-0.4061461, -1.50842, -3.062763, 0, 1, 0.1529412, 1,
-0.3962425, 0.7673678, -1.661405, 0, 1, 0.1607843, 1,
-0.395226, -0.6020576, -1.803482, 0, 1, 0.1647059, 1,
-0.3928998, 0.3445411, -0.7744527, 0, 1, 0.172549, 1,
-0.3890533, 0.2121796, -0.4166232, 0, 1, 0.1764706, 1,
-0.3865588, -0.3197047, 0.679477, 0, 1, 0.1843137, 1,
-0.386196, 0.1485007, 0.1382986, 0, 1, 0.1882353, 1,
-0.3817978, 0.6441134, 0.3505289, 0, 1, 0.1960784, 1,
-0.3757715, -1.161572, -2.97107, 0, 1, 0.2039216, 1,
-0.3755301, 0.9636682, -0.448324, 0, 1, 0.2078431, 1,
-0.370062, 0.5899609, -0.2704709, 0, 1, 0.2156863, 1,
-0.3676935, 0.09409626, -2.346015, 0, 1, 0.2196078, 1,
-0.3661085, -0.8152833, -3.002754, 0, 1, 0.227451, 1,
-0.3656132, -0.7121531, -3.693707, 0, 1, 0.2313726, 1,
-0.3628712, 0.5412724, -1.764228, 0, 1, 0.2392157, 1,
-0.3589839, 0.7985839, -0.52507, 0, 1, 0.2431373, 1,
-0.3585589, -0.1532623, -3.173752, 0, 1, 0.2509804, 1,
-0.358108, 0.3552108, 0.01901918, 0, 1, 0.254902, 1,
-0.3551146, -0.6219379, 0.2502533, 0, 1, 0.2627451, 1,
-0.3541213, -0.482548, -2.690238, 0, 1, 0.2666667, 1,
-0.3540822, -0.6828977, -3.751525, 0, 1, 0.2745098, 1,
-0.3438171, -0.6719592, -2.815937, 0, 1, 0.2784314, 1,
-0.3390509, 1.298104, 0.2561182, 0, 1, 0.2862745, 1,
-0.3389813, 0.8568652, 0.9066728, 0, 1, 0.2901961, 1,
-0.3338552, -1.95441, -2.82164, 0, 1, 0.2980392, 1,
-0.3318073, 1.417608, -2.244667, 0, 1, 0.3058824, 1,
-0.3310831, -0.09074572, -3.018703, 0, 1, 0.3098039, 1,
-0.3293258, 2.435924, 1.214193, 0, 1, 0.3176471, 1,
-0.3255912, 0.8989749, -2.471716, 0, 1, 0.3215686, 1,
-0.3190278, 0.2822606, -0.2349639, 0, 1, 0.3294118, 1,
-0.3185041, -0.08775603, -0.3620814, 0, 1, 0.3333333, 1,
-0.3177917, -1.331704, -2.105564, 0, 1, 0.3411765, 1,
-0.3152146, 0.3957806, 0.5475209, 0, 1, 0.345098, 1,
-0.3148423, 0.9152047, -0.9499927, 0, 1, 0.3529412, 1,
-0.3054965, -0.9200341, -2.770022, 0, 1, 0.3568628, 1,
-0.3014132, -0.4490741, -3.53315, 0, 1, 0.3647059, 1,
-0.3001969, 0.4073052, 0.3140749, 0, 1, 0.3686275, 1,
-0.2989258, -0.3657328, -2.053681, 0, 1, 0.3764706, 1,
-0.2912783, 1.286632, 2.129516, 0, 1, 0.3803922, 1,
-0.2874638, 0.5139065, 1.52329, 0, 1, 0.3882353, 1,
-0.2859712, -0.1514995, -0.4674232, 0, 1, 0.3921569, 1,
-0.2846461, -3.624569, -2.976902, 0, 1, 0.4, 1,
-0.2827681, 1.060992, 1.226737, 0, 1, 0.4078431, 1,
-0.2791791, 0.7998049, -0.327025, 0, 1, 0.4117647, 1,
-0.2706537, -0.6516281, -1.423182, 0, 1, 0.4196078, 1,
-0.2696302, 0.655873, -0.921171, 0, 1, 0.4235294, 1,
-0.2653793, 0.04261122, -1.275501, 0, 1, 0.4313726, 1,
-0.2645698, -0.4906192, -1.043651, 0, 1, 0.4352941, 1,
-0.2634377, -1.683964, -2.449908, 0, 1, 0.4431373, 1,
-0.2634281, -0.7320418, -2.548994, 0, 1, 0.4470588, 1,
-0.2615263, 1.569535, 0.5945982, 0, 1, 0.454902, 1,
-0.2584867, 0.3428932, -0.9334953, 0, 1, 0.4588235, 1,
-0.2542503, -2.124824, -5.086804, 0, 1, 0.4666667, 1,
-0.2540395, -0.8815753, -2.765628, 0, 1, 0.4705882, 1,
-0.2420058, -0.7435117, -1.116584, 0, 1, 0.4784314, 1,
-0.2399511, -0.2818933, -1.433684, 0, 1, 0.4823529, 1,
-0.2381202, -0.3066018, -2.007179, 0, 1, 0.4901961, 1,
-0.2342597, 0.8130785, -1.083755, 0, 1, 0.4941176, 1,
-0.2335057, -0.7975709, -3.483207, 0, 1, 0.5019608, 1,
-0.227139, -0.3505759, -2.756561, 0, 1, 0.509804, 1,
-0.2262071, -1.012528, -2.112543, 0, 1, 0.5137255, 1,
-0.2238765, -1.136362, -1.056447, 0, 1, 0.5215687, 1,
-0.2214254, 1.097646, -0.3186624, 0, 1, 0.5254902, 1,
-0.2206936, 0.2038095, -1.775965, 0, 1, 0.5333334, 1,
-0.2165583, -0.8572028, -2.088426, 0, 1, 0.5372549, 1,
-0.2145575, -1.111054, -4.098858, 0, 1, 0.5450981, 1,
-0.2136705, -0.1560493, -3.152136, 0, 1, 0.5490196, 1,
-0.210769, 1.600925, 0.304616, 0, 1, 0.5568628, 1,
-0.2101827, 0.3052574, -0.8853632, 0, 1, 0.5607843, 1,
-0.2064769, -0.475501, -0.2613613, 0, 1, 0.5686275, 1,
-0.2048894, -1.166049, -4.944773, 0, 1, 0.572549, 1,
-0.2033662, 0.1023062, -1.553112, 0, 1, 0.5803922, 1,
-0.2025242, -1.858883, -3.540071, 0, 1, 0.5843138, 1,
-0.1936148, 1.274249, -1.382954, 0, 1, 0.5921569, 1,
-0.1909213, 0.8532472, -0.4477853, 0, 1, 0.5960785, 1,
-0.1901674, 1.31343, -0.8201134, 0, 1, 0.6039216, 1,
-0.1886918, -1.111137, -4.950766, 0, 1, 0.6117647, 1,
-0.1880454, 0.1597787, -0.9364821, 0, 1, 0.6156863, 1,
-0.1848731, 0.1707217, -0.804437, 0, 1, 0.6235294, 1,
-0.1843663, -0.6903761, -3.112079, 0, 1, 0.627451, 1,
-0.1825572, -0.2488596, -0.5213693, 0, 1, 0.6352941, 1,
-0.1793859, 1.302248, -1.177758, 0, 1, 0.6392157, 1,
-0.1780329, 3.398487, 1.505486, 0, 1, 0.6470588, 1,
-0.1778758, -0.8075579, -1.366575, 0, 1, 0.6509804, 1,
-0.1747197, -0.05826063, -1.426399, 0, 1, 0.6588235, 1,
-0.1745972, -0.2983447, -3.302097, 0, 1, 0.6627451, 1,
-0.1723275, -0.332795, -1.894962, 0, 1, 0.6705883, 1,
-0.1710694, 1.145009, -0.3611253, 0, 1, 0.6745098, 1,
-0.1694238, 0.8043411, -0.9242229, 0, 1, 0.682353, 1,
-0.1646252, -1.005151, -3.849166, 0, 1, 0.6862745, 1,
-0.1609707, 1.819152, -0.6005076, 0, 1, 0.6941177, 1,
-0.1594561, 1.296849, 1.124905, 0, 1, 0.7019608, 1,
-0.1566303, 1.071448, -0.7829481, 0, 1, 0.7058824, 1,
-0.1542602, -0.4586043, -2.729389, 0, 1, 0.7137255, 1,
-0.1478792, 0.684321, -2.664021, 0, 1, 0.7176471, 1,
-0.1475171, 0.7577328, -0.08093113, 0, 1, 0.7254902, 1,
-0.1444715, -0.4672834, -3.145467, 0, 1, 0.7294118, 1,
-0.1422635, 2.124092, 0.5036983, 0, 1, 0.7372549, 1,
-0.1383685, 0.6342998, 0.01111419, 0, 1, 0.7411765, 1,
-0.1337063, -0.7587306, -3.075151, 0, 1, 0.7490196, 1,
-0.1310778, -0.6622143, -2.818151, 0, 1, 0.7529412, 1,
-0.1308291, 0.9115462, -3.251333, 0, 1, 0.7607843, 1,
-0.1302212, 0.6064113, -0.08973686, 0, 1, 0.7647059, 1,
-0.1294414, -0.08436448, -2.940556, 0, 1, 0.772549, 1,
-0.1286792, -0.5792826, -2.275224, 0, 1, 0.7764706, 1,
-0.1251314, 1.532992, 0.6230801, 0, 1, 0.7843137, 1,
-0.1240959, -1.705714, -3.120982, 0, 1, 0.7882353, 1,
-0.12196, -1.543728, -2.450941, 0, 1, 0.7960784, 1,
-0.1164744, -0.2552785, -2.579473, 0, 1, 0.8039216, 1,
-0.1146254, -0.0461202, -1.443209, 0, 1, 0.8078431, 1,
-0.113538, 0.7025083, -0.1374987, 0, 1, 0.8156863, 1,
-0.112358, 0.2098155, -1.612142, 0, 1, 0.8196079, 1,
-0.1110744, -1.796235, -2.570414, 0, 1, 0.827451, 1,
-0.108609, -0.999923, -1.854429, 0, 1, 0.8313726, 1,
-0.1083197, -1.002935, 0.121539, 0, 1, 0.8392157, 1,
-0.107382, -1.309903, -1.764672, 0, 1, 0.8431373, 1,
-0.1063107, 0.5396622, -1.420372, 0, 1, 0.8509804, 1,
-0.09444113, 1.411537, -0.9089917, 0, 1, 0.854902, 1,
-0.08598118, 0.594153, 0.1869421, 0, 1, 0.8627451, 1,
-0.08323096, -1.581412, -4.481739, 0, 1, 0.8666667, 1,
-0.08142368, -0.7736087, -1.349583, 0, 1, 0.8745098, 1,
-0.08022285, 1.40014, 1.572947, 0, 1, 0.8784314, 1,
-0.07947135, 0.2111344, -0.03480805, 0, 1, 0.8862745, 1,
-0.07846353, 1.035955, -0.6598181, 0, 1, 0.8901961, 1,
-0.07820351, 1.284144, -1.130326, 0, 1, 0.8980392, 1,
-0.07364205, 0.3737347, -0.6044073, 0, 1, 0.9058824, 1,
-0.0685923, 0.3672019, -0.4212688, 0, 1, 0.9098039, 1,
-0.06432426, 2.638697, 0.03733388, 0, 1, 0.9176471, 1,
-0.06332514, 1.617842, -1.367827, 0, 1, 0.9215686, 1,
-0.05858595, 1.245166, 0.3907959, 0, 1, 0.9294118, 1,
-0.0522989, -1.068103, -2.80046, 0, 1, 0.9333333, 1,
-0.05107614, 0.0413799, -3.064619, 0, 1, 0.9411765, 1,
-0.05061547, 1.00184, -0.4138412, 0, 1, 0.945098, 1,
-0.04709708, -0.3566458, -1.984231, 0, 1, 0.9529412, 1,
-0.03970969, -0.3076992, -0.5629573, 0, 1, 0.9568627, 1,
-0.03952026, -0.6309905, -2.699287, 0, 1, 0.9647059, 1,
-0.03809946, -0.2062706, -5.161587, 0, 1, 0.9686275, 1,
-0.03454135, -0.5473027, -3.236559, 0, 1, 0.9764706, 1,
-0.03082858, 1.47095, -0.273143, 0, 1, 0.9803922, 1,
-0.03065676, -1.853638, -3.804931, 0, 1, 0.9882353, 1,
-0.02622098, -0.6562703, -4.425571, 0, 1, 0.9921569, 1,
-0.02572127, -1.475542, -3.098188, 0, 1, 1, 1,
-0.02047042, 0.5558958, 0.3094107, 0, 0.9921569, 1, 1,
-0.01742354, 0.1677252, -0.7960442, 0, 0.9882353, 1, 1,
-0.0159358, 0.1160751, -0.2988158, 0, 0.9803922, 1, 1,
-0.01592104, -0.7849327, -3.733837, 0, 0.9764706, 1, 1,
-0.01436776, 0.3599206, -1.473681, 0, 0.9686275, 1, 1,
-0.01370365, 1.481074, -1.001314, 0, 0.9647059, 1, 1,
-0.01223592, 1.388919, -0.4963169, 0, 0.9568627, 1, 1,
-0.009247861, 1.103323, 0.2267697, 0, 0.9529412, 1, 1,
-0.007304271, -1.534954, -3.107388, 0, 0.945098, 1, 1,
-0.002122229, 1.636496, 0.5723859, 0, 0.9411765, 1, 1,
0.001960511, -0.181032, 2.403853, 0, 0.9333333, 1, 1,
0.002399089, 1.534063, -1.904349, 0, 0.9294118, 1, 1,
0.006429798, 0.4747185, -0.4730863, 0, 0.9215686, 1, 1,
0.01155717, -0.4627906, 3.638279, 0, 0.9176471, 1, 1,
0.01232487, 1.18428, 0.6060599, 0, 0.9098039, 1, 1,
0.01382423, 0.4354013, 0.04057011, 0, 0.9058824, 1, 1,
0.02877552, -1.021212, 3.115562, 0, 0.8980392, 1, 1,
0.02990761, 0.0004188842, 2.37958, 0, 0.8901961, 1, 1,
0.03194818, -1.241305, 1.081375, 0, 0.8862745, 1, 1,
0.03431565, -0.7693585, 3.14346, 0, 0.8784314, 1, 1,
0.03489713, -0.5956927, 3.404875, 0, 0.8745098, 1, 1,
0.03518135, -1.373291, 5.320567, 0, 0.8666667, 1, 1,
0.0357971, 0.3049895, -0.1751806, 0, 0.8627451, 1, 1,
0.03595502, -0.707844, 3.366413, 0, 0.854902, 1, 1,
0.03863351, -1.547883, 3.516191, 0, 0.8509804, 1, 1,
0.04405059, -0.4236185, 3.567401, 0, 0.8431373, 1, 1,
0.04712626, 0.8433278, 0.3800101, 0, 0.8392157, 1, 1,
0.05771883, 0.8609279, -0.2210268, 0, 0.8313726, 1, 1,
0.06194764, -0.07496336, 2.919253, 0, 0.827451, 1, 1,
0.06583206, 0.894758, 0.4234766, 0, 0.8196079, 1, 1,
0.07225076, -0.1672868, 2.804652, 0, 0.8156863, 1, 1,
0.07441358, 1.108518, 0.5269159, 0, 0.8078431, 1, 1,
0.07675172, 2.21747, -0.4585696, 0, 0.8039216, 1, 1,
0.07721376, 0.9633806, -0.8881137, 0, 0.7960784, 1, 1,
0.08045251, -0.950841, 3.852927, 0, 0.7882353, 1, 1,
0.08584306, -0.5425344, 2.222848, 0, 0.7843137, 1, 1,
0.08750582, 0.1850731, -1.042656, 0, 0.7764706, 1, 1,
0.08891375, 0.5652831, 0.09288296, 0, 0.772549, 1, 1,
0.09106138, -0.9080096, 3.411585, 0, 0.7647059, 1, 1,
0.09323784, 0.1628452, 0.9619572, 0, 0.7607843, 1, 1,
0.09787545, -0.3410837, 6.378627, 0, 0.7529412, 1, 1,
0.09788077, 0.2680621, -0.8771377, 0, 0.7490196, 1, 1,
0.1000294, 0.3387245, 0.9966841, 0, 0.7411765, 1, 1,
0.101236, -0.8724097, 3.196084, 0, 0.7372549, 1, 1,
0.1028321, -0.5447498, 2.067931, 0, 0.7294118, 1, 1,
0.1069129, -0.863293, 3.339619, 0, 0.7254902, 1, 1,
0.1074037, 1.022465, 0.7708484, 0, 0.7176471, 1, 1,
0.1120796, -0.9563707, 3.162467, 0, 0.7137255, 1, 1,
0.1140417, 0.8444365, 0.8313788, 0, 0.7058824, 1, 1,
0.1154717, 1.638548, -2.794693, 0, 0.6980392, 1, 1,
0.1181934, -0.2414544, 1.677282, 0, 0.6941177, 1, 1,
0.1182862, 0.7902953, 0.786265, 0, 0.6862745, 1, 1,
0.1209978, -2.383984, 2.544673, 0, 0.682353, 1, 1,
0.1241293, -0.6354353, 1.951941, 0, 0.6745098, 1, 1,
0.1246887, 1.107749, 1.508077, 0, 0.6705883, 1, 1,
0.1271729, -1.198389, 2.246597, 0, 0.6627451, 1, 1,
0.1307941, 0.4265642, -1.231536, 0, 0.6588235, 1, 1,
0.1325445, 1.704746, 1.183037, 0, 0.6509804, 1, 1,
0.1325863, 0.9749046, -0.1166782, 0, 0.6470588, 1, 1,
0.1332214, 0.9985399, 1.410185, 0, 0.6392157, 1, 1,
0.1358599, -0.4435433, 2.227613, 0, 0.6352941, 1, 1,
0.1383398, -1.402369, 3.799904, 0, 0.627451, 1, 1,
0.1404591, 1.55428, 0.07460748, 0, 0.6235294, 1, 1,
0.1411476, 0.1454193, -0.07967629, 0, 0.6156863, 1, 1,
0.1415273, 0.4910048, 1.970737, 0, 0.6117647, 1, 1,
0.1427365, 1.047448, 0.04965312, 0, 0.6039216, 1, 1,
0.144557, -0.3370304, 1.988778, 0, 0.5960785, 1, 1,
0.1465209, 0.5798291, 1.657675, 0, 0.5921569, 1, 1,
0.1490044, -0.4965585, 3.870955, 0, 0.5843138, 1, 1,
0.1500809, -0.644304, 4.292461, 0, 0.5803922, 1, 1,
0.1501768, 1.212654, -2.202613, 0, 0.572549, 1, 1,
0.1515737, -1.797126, 4.077978, 0, 0.5686275, 1, 1,
0.1534222, -0.85743, 2.611395, 0, 0.5607843, 1, 1,
0.1546224, 1.042125, -1.511182, 0, 0.5568628, 1, 1,
0.1609684, 0.1451737, 1.641486, 0, 0.5490196, 1, 1,
0.1615865, -0.8748817, 3.319754, 0, 0.5450981, 1, 1,
0.1626664, 1.234541, -0.9963109, 0, 0.5372549, 1, 1,
0.1649857, -1.146954, 3.060377, 0, 0.5333334, 1, 1,
0.1651921, 1.255806, -0.07976626, 0, 0.5254902, 1, 1,
0.1652204, -0.5234972, 2.449528, 0, 0.5215687, 1, 1,
0.1673081, -2.039016, 2.676709, 0, 0.5137255, 1, 1,
0.1699868, -0.1022174, 1.069033, 0, 0.509804, 1, 1,
0.1715878, -0.8419683, 3.268247, 0, 0.5019608, 1, 1,
0.1734001, -0.6746596, 3.048985, 0, 0.4941176, 1, 1,
0.1739609, -0.6640707, 2.995567, 0, 0.4901961, 1, 1,
0.1747469, 0.3025491, -0.3171804, 0, 0.4823529, 1, 1,
0.178774, -0.3547827, 1.450385, 0, 0.4784314, 1, 1,
0.1789981, 0.8206782, 2.666428, 0, 0.4705882, 1, 1,
0.1797043, 1.143003, 1.298345, 0, 0.4666667, 1, 1,
0.1803301, 0.8124637, 0.8676764, 0, 0.4588235, 1, 1,
0.1866715, 0.8984467, 0.2319976, 0, 0.454902, 1, 1,
0.1874427, 0.7003253, 1.25896, 0, 0.4470588, 1, 1,
0.188166, -0.8610123, 3.553606, 0, 0.4431373, 1, 1,
0.1956397, -0.7230196, 1.962276, 0, 0.4352941, 1, 1,
0.1965412, 0.598822, 0.5658665, 0, 0.4313726, 1, 1,
0.1977923, -0.6627162, 3.122176, 0, 0.4235294, 1, 1,
0.2000249, 0.2024867, 0.5366965, 0, 0.4196078, 1, 1,
0.2024158, 0.05383062, 1.504275, 0, 0.4117647, 1, 1,
0.215592, -2.368496, 3.020627, 0, 0.4078431, 1, 1,
0.2167636, -1.419026, 2.251829, 0, 0.4, 1, 1,
0.2196497, -0.3254515, 3.720721, 0, 0.3921569, 1, 1,
0.2206603, -0.2273591, 2.705308, 0, 0.3882353, 1, 1,
0.223777, -1.345136, 1.427943, 0, 0.3803922, 1, 1,
0.2252182, -2.144241, 2.324194, 0, 0.3764706, 1, 1,
0.2312083, 1.679947, 1.463493, 0, 0.3686275, 1, 1,
0.2312179, -0.3991227, 2.233305, 0, 0.3647059, 1, 1,
0.2334491, -0.5494875, 2.323276, 0, 0.3568628, 1, 1,
0.2338238, -0.3209238, 1.380416, 0, 0.3529412, 1, 1,
0.2403839, 0.2187018, 0.7421001, 0, 0.345098, 1, 1,
0.241737, -0.9657261, 0.5719528, 0, 0.3411765, 1, 1,
0.243563, 0.5823517, -1.011756, 0, 0.3333333, 1, 1,
0.2438888, 0.02765485, 1.287209, 0, 0.3294118, 1, 1,
0.2495706, 1.288963, 1.406368, 0, 0.3215686, 1, 1,
0.2504445, -1.442444, 4.054369, 0, 0.3176471, 1, 1,
0.2536399, -1.27332, 1.782611, 0, 0.3098039, 1, 1,
0.2552302, 1.878746, -1.44319, 0, 0.3058824, 1, 1,
0.263303, -0.4860674, 0.8416432, 0, 0.2980392, 1, 1,
0.267696, -0.5131326, 2.766534, 0, 0.2901961, 1, 1,
0.2770273, -2.381315, 2.160674, 0, 0.2862745, 1, 1,
0.2790676, -0.2241054, 2.474744, 0, 0.2784314, 1, 1,
0.2814004, 1.686139, -0.4575624, 0, 0.2745098, 1, 1,
0.2836821, 0.08352432, 0.3070775, 0, 0.2666667, 1, 1,
0.285505, 0.6891355, 1.170636, 0, 0.2627451, 1, 1,
0.2917672, 0.7027401, 0.1048906, 0, 0.254902, 1, 1,
0.2957435, -1.270715, 2.632533, 0, 0.2509804, 1, 1,
0.2963412, 2.608095, 0.008561552, 0, 0.2431373, 1, 1,
0.2969926, 1.3718, -0.4000477, 0, 0.2392157, 1, 1,
0.2979631, -0.7989003, 3.202853, 0, 0.2313726, 1, 1,
0.2986924, -0.346606, 1.62295, 0, 0.227451, 1, 1,
0.2991432, 1.673767, -1.366474, 0, 0.2196078, 1, 1,
0.3047444, 0.2082881, 2.989866, 0, 0.2156863, 1, 1,
0.3056847, -1.011508, 4.574055, 0, 0.2078431, 1, 1,
0.3101736, -1.085895, 3.052704, 0, 0.2039216, 1, 1,
0.3135328, -1.549851, 3.685422, 0, 0.1960784, 1, 1,
0.3146787, -0.3130211, 2.24456, 0, 0.1882353, 1, 1,
0.3153644, 1.537632, 0.5367419, 0, 0.1843137, 1, 1,
0.3165631, 0.02472121, 0.885286, 0, 0.1764706, 1, 1,
0.3185249, -0.6830533, 3.043616, 0, 0.172549, 1, 1,
0.3194483, -0.5849622, 2.054569, 0, 0.1647059, 1, 1,
0.3202119, 0.4932146, 0.3933196, 0, 0.1607843, 1, 1,
0.3232316, -1.408885, 3.85083, 0, 0.1529412, 1, 1,
0.3266467, -0.303227, 2.02081, 0, 0.1490196, 1, 1,
0.3272258, 0.2271684, 1.608945, 0, 0.1411765, 1, 1,
0.3273402, 2.532769, -0.4371382, 0, 0.1372549, 1, 1,
0.3286598, 0.1171449, 2.480302, 0, 0.1294118, 1, 1,
0.3318735, -2.217027, 3.214623, 0, 0.1254902, 1, 1,
0.3335844, -0.3153326, 3.295208, 0, 0.1176471, 1, 1,
0.3376839, -1.062858, 2.120003, 0, 0.1137255, 1, 1,
0.3452593, -2.092112, 2.580513, 0, 0.1058824, 1, 1,
0.3506892, 0.2437601, 1.885873, 0, 0.09803922, 1, 1,
0.3566011, -0.3900521, 3.78362, 0, 0.09411765, 1, 1,
0.3582357, 0.7307867, -0.03884459, 0, 0.08627451, 1, 1,
0.3649227, -0.4813392, 2.188216, 0, 0.08235294, 1, 1,
0.3667322, 1.737024, 0.7854552, 0, 0.07450981, 1, 1,
0.3697577, -2.081121, 2.002655, 0, 0.07058824, 1, 1,
0.3697912, 0.05620614, 3.399717, 0, 0.0627451, 1, 1,
0.3755033, -0.2286577, 1.981183, 0, 0.05882353, 1, 1,
0.379116, -2.445658, 2.763909, 0, 0.05098039, 1, 1,
0.3802125, -1.650005, 4.519809, 0, 0.04705882, 1, 1,
0.3811217, -0.04774403, 1.240643, 0, 0.03921569, 1, 1,
0.3814566, -0.3372432, 1.806928, 0, 0.03529412, 1, 1,
0.3820839, 2.036338, 0.4002869, 0, 0.02745098, 1, 1,
0.3834381, -0.414612, 2.364897, 0, 0.02352941, 1, 1,
0.3881156, 0.7879316, 1.407235, 0, 0.01568628, 1, 1,
0.3901756, -0.07043288, 1.73709, 0, 0.01176471, 1, 1,
0.3906898, -0.5287029, 2.192861, 0, 0.003921569, 1, 1,
0.3914427, -0.3452202, 1.670663, 0.003921569, 0, 1, 1,
0.3915347, 0.8915959, -0.4679276, 0.007843138, 0, 1, 1,
0.3922252, 0.06090855, 1.994172, 0.01568628, 0, 1, 1,
0.3930067, 0.4173721, -1.291818, 0.01960784, 0, 1, 1,
0.3931147, 0.2474812, 0.5054172, 0.02745098, 0, 1, 1,
0.3931192, 0.2854554, 1.259007, 0.03137255, 0, 1, 1,
0.3975059, -0.145339, 1.543436, 0.03921569, 0, 1, 1,
0.3985112, -0.346186, 1.687463, 0.04313726, 0, 1, 1,
0.4056491, 0.3763442, -0.6353896, 0.05098039, 0, 1, 1,
0.4057547, -0.221011, 1.587386, 0.05490196, 0, 1, 1,
0.4072973, 0.958184, 0.03840085, 0.0627451, 0, 1, 1,
0.4076844, -0.4917536, 4.144929, 0.06666667, 0, 1, 1,
0.4079331, -0.8900487, 2.784533, 0.07450981, 0, 1, 1,
0.4080971, -1.652256, 3.557191, 0.07843138, 0, 1, 1,
0.4085277, 0.5149673, 0.06515805, 0.08627451, 0, 1, 1,
0.4108256, -0.7648975, 2.303197, 0.09019608, 0, 1, 1,
0.4113815, 0.122496, -1.975103, 0.09803922, 0, 1, 1,
0.415955, -0.4797018, 2.775424, 0.1058824, 0, 1, 1,
0.4203398, 0.009952495, 3.299261, 0.1098039, 0, 1, 1,
0.4242213, -2.392486, 3.383444, 0.1176471, 0, 1, 1,
0.4243951, 0.6853163, 0.6122543, 0.1215686, 0, 1, 1,
0.4327365, -0.1672437, 0.0250736, 0.1294118, 0, 1, 1,
0.4339007, -1.625836, 3.514132, 0.1333333, 0, 1, 1,
0.4341139, -0.2558043, 2.076985, 0.1411765, 0, 1, 1,
0.4368877, -0.1460912, 1.989336, 0.145098, 0, 1, 1,
0.4409561, 1.688385, 0.04356455, 0.1529412, 0, 1, 1,
0.4421561, -0.3281061, 2.129892, 0.1568628, 0, 1, 1,
0.4426587, -0.1109113, 1.028678, 0.1647059, 0, 1, 1,
0.4454509, -1.933521, 3.369694, 0.1686275, 0, 1, 1,
0.4454878, 0.4150963, 1.909165, 0.1764706, 0, 1, 1,
0.4460011, 0.8491129, 2.083697, 0.1803922, 0, 1, 1,
0.4479285, -0.2824121, 2.016117, 0.1882353, 0, 1, 1,
0.4488879, 0.2642806, -0.3139103, 0.1921569, 0, 1, 1,
0.4569487, -0.8265671, 1.779877, 0.2, 0, 1, 1,
0.4608132, 1.857503, 0.93667, 0.2078431, 0, 1, 1,
0.4640483, 0.003465365, 1.614142, 0.2117647, 0, 1, 1,
0.4690106, 1.194989, 1.09842, 0.2196078, 0, 1, 1,
0.4742323, 0.6950552, 1.398466, 0.2235294, 0, 1, 1,
0.4795536, -0.105953, 1.884716, 0.2313726, 0, 1, 1,
0.4850523, 0.1660526, 1.975605, 0.2352941, 0, 1, 1,
0.4850736, 0.07535366, 1.203002, 0.2431373, 0, 1, 1,
0.4887909, 0.3941772, 0.6338786, 0.2470588, 0, 1, 1,
0.4923369, -1.259776, 3.656166, 0.254902, 0, 1, 1,
0.4924735, 0.09505481, 1.183399, 0.2588235, 0, 1, 1,
0.4933929, 0.3119874, 2.615903, 0.2666667, 0, 1, 1,
0.4977047, -0.3003783, -0.08826046, 0.2705882, 0, 1, 1,
0.4986864, 0.06948501, 1.251999, 0.2784314, 0, 1, 1,
0.4999198, 0.2024388, 1.885141, 0.282353, 0, 1, 1,
0.5020086, -0.1839095, 1.410008, 0.2901961, 0, 1, 1,
0.5026499, 0.7279273, -0.7530509, 0.2941177, 0, 1, 1,
0.5030972, -1.458648, 4.48315, 0.3019608, 0, 1, 1,
0.5049633, -0.4106724, 0.7878578, 0.3098039, 0, 1, 1,
0.5084088, 0.688616, 0.03079121, 0.3137255, 0, 1, 1,
0.5122927, -0.3988512, 2.35118, 0.3215686, 0, 1, 1,
0.5148896, 1.430333, 1.078873, 0.3254902, 0, 1, 1,
0.5223423, 0.5100269, 1.061784, 0.3333333, 0, 1, 1,
0.5230268, -1.175529, 2.81217, 0.3372549, 0, 1, 1,
0.5294553, -0.878579, 3.522438, 0.345098, 0, 1, 1,
0.5299073, -0.1780729, 1.648164, 0.3490196, 0, 1, 1,
0.5299803, 0.7124022, 0.4904256, 0.3568628, 0, 1, 1,
0.5330951, -0.2045792, 1.600726, 0.3607843, 0, 1, 1,
0.5349985, -0.01486397, 1.270826, 0.3686275, 0, 1, 1,
0.5374125, -0.2470298, 4.395246, 0.372549, 0, 1, 1,
0.5427155, -0.2045937, -0.4273734, 0.3803922, 0, 1, 1,
0.5433758, -2.095421, 1.629111, 0.3843137, 0, 1, 1,
0.5474365, -0.5114415, 2.397282, 0.3921569, 0, 1, 1,
0.5501391, -1.066687, 3.288671, 0.3960784, 0, 1, 1,
0.5527759, -2.010352, 3.000387, 0.4039216, 0, 1, 1,
0.5546579, 0.5526355, -0.1833151, 0.4117647, 0, 1, 1,
0.5548744, 0.08577256, 1.142631, 0.4156863, 0, 1, 1,
0.5582608, -0.319589, 2.218235, 0.4235294, 0, 1, 1,
0.5612322, -0.764701, 2.413038, 0.427451, 0, 1, 1,
0.5619786, -0.4104334, 4.075405, 0.4352941, 0, 1, 1,
0.5629551, 0.5544562, -0.4245706, 0.4392157, 0, 1, 1,
0.5664424, 1.07192, 0.2828904, 0.4470588, 0, 1, 1,
0.5891057, 0.114637, 1.423357, 0.4509804, 0, 1, 1,
0.5955919, 0.4174654, 0.6628775, 0.4588235, 0, 1, 1,
0.5975188, -0.4371369, 0.9311697, 0.4627451, 0, 1, 1,
0.5986473, 0.171486, 2.732554, 0.4705882, 0, 1, 1,
0.5988144, 0.6767325, 0.7317683, 0.4745098, 0, 1, 1,
0.6034088, 0.9928595, 0.2819692, 0.4823529, 0, 1, 1,
0.6063142, -1.255377, 3.357993, 0.4862745, 0, 1, 1,
0.6098169, -1.455156, 3.620718, 0.4941176, 0, 1, 1,
0.625384, 1.486576, 2.088575, 0.5019608, 0, 1, 1,
0.6334755, 0.3865729, -0.2523648, 0.5058824, 0, 1, 1,
0.6334783, -0.3765136, 3.49502, 0.5137255, 0, 1, 1,
0.6351315, 0.9208832, 0.5161018, 0.5176471, 0, 1, 1,
0.6439911, -0.9720997, 3.456725, 0.5254902, 0, 1, 1,
0.6446059, -1.663389, 2.329346, 0.5294118, 0, 1, 1,
0.6464422, 0.453899, 1.221977, 0.5372549, 0, 1, 1,
0.6484443, -0.4349245, 2.685725, 0.5411765, 0, 1, 1,
0.6490389, -2.122506, 2.740774, 0.5490196, 0, 1, 1,
0.6530858, -0.2591716, 2.531657, 0.5529412, 0, 1, 1,
0.6574382, -0.1244925, 1.861879, 0.5607843, 0, 1, 1,
0.6611986, -0.1445837, 1.418609, 0.5647059, 0, 1, 1,
0.6615388, 0.05490527, 3.632637, 0.572549, 0, 1, 1,
0.6651341, -1.342873, 1.159281, 0.5764706, 0, 1, 1,
0.6656311, -2.00573, 2.31024, 0.5843138, 0, 1, 1,
0.6680443, 1.049007, 2.236274, 0.5882353, 0, 1, 1,
0.6704187, 0.3363754, 2.443623, 0.5960785, 0, 1, 1,
0.6744641, 1.452838, -0.8288692, 0.6039216, 0, 1, 1,
0.6747025, -1.942392, 2.674387, 0.6078432, 0, 1, 1,
0.6840602, -1.470744, 4.405814, 0.6156863, 0, 1, 1,
0.6891193, 0.8837419, -0.195337, 0.6196079, 0, 1, 1,
0.695296, 0.9028701, -0.3615031, 0.627451, 0, 1, 1,
0.6964319, 0.4522954, 0.9461133, 0.6313726, 0, 1, 1,
0.6979011, -0.4628318, 2.397107, 0.6392157, 0, 1, 1,
0.7089265, -0.7600775, 1.934331, 0.6431373, 0, 1, 1,
0.7128663, -1.201319, 2.4603, 0.6509804, 0, 1, 1,
0.7134964, 0.6874246, 1.946539, 0.654902, 0, 1, 1,
0.7136949, 0.6743618, 1.851395, 0.6627451, 0, 1, 1,
0.7142548, -0.1558573, 2.313222, 0.6666667, 0, 1, 1,
0.7164329, -0.9999807, 3.094368, 0.6745098, 0, 1, 1,
0.7172026, 0.4093769, 3.455161, 0.6784314, 0, 1, 1,
0.7183802, 0.5144473, 0.03689612, 0.6862745, 0, 1, 1,
0.7256197, -1.727982, 3.815099, 0.6901961, 0, 1, 1,
0.7375762, -0.5293031, 0.7506518, 0.6980392, 0, 1, 1,
0.7391455, -0.07659651, 0.4125254, 0.7058824, 0, 1, 1,
0.7445697, 1.210989, 1.62401, 0.7098039, 0, 1, 1,
0.7450106, 0.4395809, 1.230215, 0.7176471, 0, 1, 1,
0.7536443, 2.017807, 0.4363878, 0.7215686, 0, 1, 1,
0.7552778, 1.374707, 0.9853336, 0.7294118, 0, 1, 1,
0.7587377, 0.2795534, 1.010008, 0.7333333, 0, 1, 1,
0.7624077, -0.6655128, 3.094633, 0.7411765, 0, 1, 1,
0.7629889, 1.241949, -0.6785631, 0.7450981, 0, 1, 1,
0.7697132, -0.3710098, 2.333025, 0.7529412, 0, 1, 1,
0.7734127, 1.054975, 1.706196, 0.7568628, 0, 1, 1,
0.7784213, -0.2252833, 3.262337, 0.7647059, 0, 1, 1,
0.780681, 0.7747803, -0.2926968, 0.7686275, 0, 1, 1,
0.7858984, 0.3302801, 0.8968216, 0.7764706, 0, 1, 1,
0.7876886, 0.3110404, 2.038487, 0.7803922, 0, 1, 1,
0.7906251, 0.3495468, 2.635678, 0.7882353, 0, 1, 1,
0.8240341, 0.9015318, 1.419022, 0.7921569, 0, 1, 1,
0.824613, -0.6150867, 2.265557, 0.8, 0, 1, 1,
0.8277168, 0.1887793, 1.792575, 0.8078431, 0, 1, 1,
0.8397421, 0.392763, 0.8130934, 0.8117647, 0, 1, 1,
0.8416193, 0.3768192, 2.172305, 0.8196079, 0, 1, 1,
0.8549027, 0.3130032, 2.088704, 0.8235294, 0, 1, 1,
0.8559294, 0.8486707, 1.208118, 0.8313726, 0, 1, 1,
0.8561653, -0.04143211, 1.273129, 0.8352941, 0, 1, 1,
0.8587596, 1.410152, 0.8512205, 0.8431373, 0, 1, 1,
0.8602484, -1.62749, 5.023364, 0.8470588, 0, 1, 1,
0.860359, -0.4443518, 0.9029644, 0.854902, 0, 1, 1,
0.8611668, -0.07228255, 2.518294, 0.8588235, 0, 1, 1,
0.8713888, 0.08716095, 1.241696, 0.8666667, 0, 1, 1,
0.8794799, -0.2066644, 1.186095, 0.8705882, 0, 1, 1,
0.8835065, -0.5793861, 2.016198, 0.8784314, 0, 1, 1,
0.8835525, -0.7874108, 3.378637, 0.8823529, 0, 1, 1,
0.8848183, -0.9229627, 1.748911, 0.8901961, 0, 1, 1,
0.8868124, 0.85355, 0.9237543, 0.8941177, 0, 1, 1,
0.8897871, 1.673181, 1.382327, 0.9019608, 0, 1, 1,
0.890015, -0.3774836, 3.411714, 0.9098039, 0, 1, 1,
0.8907154, 2.932983, 0.4666225, 0.9137255, 0, 1, 1,
0.8942556, -0.1062821, -0.6591333, 0.9215686, 0, 1, 1,
0.8957456, -1.862133, 3.136393, 0.9254902, 0, 1, 1,
0.8975926, -1.233283, -0.7192534, 0.9333333, 0, 1, 1,
0.9007864, -1.426762, 1.205029, 0.9372549, 0, 1, 1,
0.9019408, 1.9019, 0.9519665, 0.945098, 0, 1, 1,
0.9031575, 0.3844368, 2.190978, 0.9490196, 0, 1, 1,
0.9172918, -0.59209, 1.401147, 0.9568627, 0, 1, 1,
0.9176875, 1.307033, 0.4375781, 0.9607843, 0, 1, 1,
0.923875, 0.621751, -0.3142264, 0.9686275, 0, 1, 1,
0.927842, 1.579138, 0.4966894, 0.972549, 0, 1, 1,
0.9297383, -0.1128121, 1.484152, 0.9803922, 0, 1, 1,
0.9328408, -0.1000914, 0.1384818, 0.9843137, 0, 1, 1,
0.9349214, 0.1899202, 1.043036, 0.9921569, 0, 1, 1,
0.9393033, -2.078401, 3.588804, 0.9960784, 0, 1, 1,
0.9394029, -1.342742, 1.027074, 1, 0, 0.9960784, 1,
0.9396638, 0.9866548, 1.809998, 1, 0, 0.9882353, 1,
0.9473854, -0.1329048, 0.8230934, 1, 0, 0.9843137, 1,
0.9480706, 0.05374204, 2.178692, 1, 0, 0.9764706, 1,
0.9529129, 0.07943188, -0.9731312, 1, 0, 0.972549, 1,
0.9530087, -0.5697312, 1.406395, 1, 0, 0.9647059, 1,
0.9549296, -1.731053, 2.72835, 1, 0, 0.9607843, 1,
0.9583437, -1.793917, 2.111716, 1, 0, 0.9529412, 1,
0.9634011, -1.134344, 3.227185, 1, 0, 0.9490196, 1,
0.9663059, 0.1750214, 1.095115, 1, 0, 0.9411765, 1,
0.9665859, -0.2599202, 2.45764, 1, 0, 0.9372549, 1,
0.9795344, 0.9209188, 0.3960047, 1, 0, 0.9294118, 1,
0.9839956, -0.1073766, 1.421474, 1, 0, 0.9254902, 1,
1.012141, 0.08149021, 2.098675, 1, 0, 0.9176471, 1,
1.01241, -0.9815466, 2.506656, 1, 0, 0.9137255, 1,
1.023919, 0.3211299, 2.140265, 1, 0, 0.9058824, 1,
1.024135, -0.7978008, 2.544924, 1, 0, 0.9019608, 1,
1.026751, -0.1778692, 3.056015, 1, 0, 0.8941177, 1,
1.028264, -0.5235676, 1.725291, 1, 0, 0.8862745, 1,
1.031008, -1.176104, 3.322221, 1, 0, 0.8823529, 1,
1.032044, -1.060346, 2.519509, 1, 0, 0.8745098, 1,
1.034469, 1.203161, -0.6261554, 1, 0, 0.8705882, 1,
1.034698, -0.1248937, 1.632618, 1, 0, 0.8627451, 1,
1.036531, 0.9445204, 0.368942, 1, 0, 0.8588235, 1,
1.037725, -1.072637, 1.468315, 1, 0, 0.8509804, 1,
1.043918, -0.7505537, 0.5332641, 1, 0, 0.8470588, 1,
1.045322, 0.3693853, 0.8440353, 1, 0, 0.8392157, 1,
1.047286, 0.4863203, -0.07782011, 1, 0, 0.8352941, 1,
1.060612, -0.1316677, 0.3942039, 1, 0, 0.827451, 1,
1.069045, -0.9084972, 1.260742, 1, 0, 0.8235294, 1,
1.078243, 0.6835012, 0.04986737, 1, 0, 0.8156863, 1,
1.083834, 0.6044884, -0.1547879, 1, 0, 0.8117647, 1,
1.085925, 1.851566, 0.496042, 1, 0, 0.8039216, 1,
1.086487, -0.85563, 1.384178, 1, 0, 0.7960784, 1,
1.096716, -0.237793, 2.321219, 1, 0, 0.7921569, 1,
1.098445, 0.4903263, 0.09979116, 1, 0, 0.7843137, 1,
1.102109, -0.3915696, 1.962867, 1, 0, 0.7803922, 1,
1.110386, -1.653327, 3.468565, 1, 0, 0.772549, 1,
1.110736, 0.2711048, 0.7969649, 1, 0, 0.7686275, 1,
1.115844, 0.8675332, 0.3732219, 1, 0, 0.7607843, 1,
1.12277, -1.039304, 2.750304, 1, 0, 0.7568628, 1,
1.125948, 1.153544, 2.021614, 1, 0, 0.7490196, 1,
1.130511, 2.537792, 0.9044787, 1, 0, 0.7450981, 1,
1.134433, -0.2933456, 1.995174, 1, 0, 0.7372549, 1,
1.13981, 1.72001, -0.7396759, 1, 0, 0.7333333, 1,
1.146775, 0.4721673, 1.556065, 1, 0, 0.7254902, 1,
1.157655, -0.2388801, 0.2705115, 1, 0, 0.7215686, 1,
1.168654, -0.7553223, 4.06673, 1, 0, 0.7137255, 1,
1.17717, 0.4448295, 2.867183, 1, 0, 0.7098039, 1,
1.180617, -1.004928, 2.867456, 1, 0, 0.7019608, 1,
1.180858, 0.8540523, 1.852288, 1, 0, 0.6941177, 1,
1.182944, 0.7006772, 1.924538, 1, 0, 0.6901961, 1,
1.186239, -1.188839, 3.239349, 1, 0, 0.682353, 1,
1.187683, 0.3042474, 1.544165, 1, 0, 0.6784314, 1,
1.193122, -1.800393, 2.033861, 1, 0, 0.6705883, 1,
1.204992, -1.277716, 1.971808, 1, 0, 0.6666667, 1,
1.205494, 0.4866506, 1.124063, 1, 0, 0.6588235, 1,
1.205976, 0.1317752, 1.00037, 1, 0, 0.654902, 1,
1.207467, -0.5984742, 0.6139522, 1, 0, 0.6470588, 1,
1.208387, 0.4950691, 0.9297352, 1, 0, 0.6431373, 1,
1.213683, -1.068969, 3.65421, 1, 0, 0.6352941, 1,
1.230296, -0.4915316, 2.34281, 1, 0, 0.6313726, 1,
1.2336, -1.448128, 2.529353, 1, 0, 0.6235294, 1,
1.238602, 0.5202447, 1.286925, 1, 0, 0.6196079, 1,
1.242544, 0.01705706, 0.170161, 1, 0, 0.6117647, 1,
1.243281, 0.9427598, 3.381798, 1, 0, 0.6078432, 1,
1.252354, -0.7170612, 1.002526, 1, 0, 0.6, 1,
1.253482, 0.5830137, 2.007311, 1, 0, 0.5921569, 1,
1.253928, 0.3798022, -0.1194572, 1, 0, 0.5882353, 1,
1.267276, 0.08157288, 1.688189, 1, 0, 0.5803922, 1,
1.267726, -0.7614655, 3.976737, 1, 0, 0.5764706, 1,
1.269468, -0.295887, 2.765606, 1, 0, 0.5686275, 1,
1.273133, 0.3647431, 2.040046, 1, 0, 0.5647059, 1,
1.27396, 0.6051549, 2.083078, 1, 0, 0.5568628, 1,
1.29534, -0.4276858, 2.837639, 1, 0, 0.5529412, 1,
1.317286, -1.388408, 2.157567, 1, 0, 0.5450981, 1,
1.322065, 0.5816051, 2.139227, 1, 0, 0.5411765, 1,
1.32736, 1.059546, 1.308216, 1, 0, 0.5333334, 1,
1.329772, 0.1302172, 0.6368181, 1, 0, 0.5294118, 1,
1.33696, 0.3219353, 0.9762568, 1, 0, 0.5215687, 1,
1.342561, -0.6370866, 0.6167567, 1, 0, 0.5176471, 1,
1.350673, -0.4874854, 1.121191, 1, 0, 0.509804, 1,
1.353927, -0.3624452, 3.921416, 1, 0, 0.5058824, 1,
1.362234, -0.07319821, 1.653667, 1, 0, 0.4980392, 1,
1.364225, -1.310179, 1.110407, 1, 0, 0.4901961, 1,
1.373459, -0.02217221, 3.386108, 1, 0, 0.4862745, 1,
1.386377, -0.5595087, 1.733778, 1, 0, 0.4784314, 1,
1.388774, 3.303368, 2.287258, 1, 0, 0.4745098, 1,
1.389875, 0.820841, 1.010803, 1, 0, 0.4666667, 1,
1.400413, -0.4895336, 1.44589, 1, 0, 0.4627451, 1,
1.40494, -0.4965342, 0.7232247, 1, 0, 0.454902, 1,
1.418396, -0.06033567, 1.124178, 1, 0, 0.4509804, 1,
1.428, -0.1588753, 1.353716, 1, 0, 0.4431373, 1,
1.466835, -1.299813, 2.300316, 1, 0, 0.4392157, 1,
1.482726, -0.8147637, 2.559508, 1, 0, 0.4313726, 1,
1.494185, -0.2824852, 1.666364, 1, 0, 0.427451, 1,
1.502115, -0.5380598, 4.526972, 1, 0, 0.4196078, 1,
1.512314, -1.310947, 2.520959, 1, 0, 0.4156863, 1,
1.512797, -0.2102626, 3.521609, 1, 0, 0.4078431, 1,
1.515415, 1.18992, 0.8906113, 1, 0, 0.4039216, 1,
1.527421, 2.69163, -0.06350099, 1, 0, 0.3960784, 1,
1.537954, -0.393784, 1.407769, 1, 0, 0.3882353, 1,
1.538038, -0.04042916, 1.218252, 1, 0, 0.3843137, 1,
1.541769, 0.2608424, 1.611992, 1, 0, 0.3764706, 1,
1.546853, 0.08186904, 0.6570485, 1, 0, 0.372549, 1,
1.5589, -1.025931, 2.59525, 1, 0, 0.3647059, 1,
1.566788, 1.009179, 0.9210129, 1, 0, 0.3607843, 1,
1.567822, -0.7690458, 2.480345, 1, 0, 0.3529412, 1,
1.568422, 0.3159932, 1.771427, 1, 0, 0.3490196, 1,
1.569026, -0.7371034, 2.372813, 1, 0, 0.3411765, 1,
1.576886, 0.4428031, 0.09100877, 1, 0, 0.3372549, 1,
1.577571, 0.7679526, 2.566834, 1, 0, 0.3294118, 1,
1.581557, -0.7888259, 2.489215, 1, 0, 0.3254902, 1,
1.589642, -0.9682551, 1.855435, 1, 0, 0.3176471, 1,
1.607354, -0.0836713, 1.330857, 1, 0, 0.3137255, 1,
1.610729, 0.08444224, 1.127543, 1, 0, 0.3058824, 1,
1.617524, 0.6847581, 3.122195, 1, 0, 0.2980392, 1,
1.626261, -1.133357, 1.237009, 1, 0, 0.2941177, 1,
1.628075, 0.2664132, 0.9025638, 1, 0, 0.2862745, 1,
1.645414, -1.197375, 2.068372, 1, 0, 0.282353, 1,
1.647981, 0.2936693, 1.462392, 1, 0, 0.2745098, 1,
1.661845, -0.7329396, 1.556218, 1, 0, 0.2705882, 1,
1.677426, 1.820534, 0.9790508, 1, 0, 0.2627451, 1,
1.685971, -0.9223186, 3.346689, 1, 0, 0.2588235, 1,
1.691521, 1.691544, 0.2373701, 1, 0, 0.2509804, 1,
1.694355, -0.7975456, 3.378119, 1, 0, 0.2470588, 1,
1.699604, -2.927211, 2.665856, 1, 0, 0.2392157, 1,
1.708509, 0.3241415, 1.604496, 1, 0, 0.2352941, 1,
1.712779, 0.2538681, 1.761789, 1, 0, 0.227451, 1,
1.733006, 0.9100437, 1.487623, 1, 0, 0.2235294, 1,
1.739374, 2.005665, 0.5322492, 1, 0, 0.2156863, 1,
1.742097, 1.917389, 1.924672, 1, 0, 0.2117647, 1,
1.767823, -2.020994, 2.713485, 1, 0, 0.2039216, 1,
1.785452, -1.221531, 1.95891, 1, 0, 0.1960784, 1,
1.792203, -0.3838229, 2.049449, 1, 0, 0.1921569, 1,
1.800833, -1.327369, 2.3753, 1, 0, 0.1843137, 1,
1.819177, 1.379945, 0.6489068, 1, 0, 0.1803922, 1,
1.831698, 0.9702679, -0.3255713, 1, 0, 0.172549, 1,
1.847823, -1.182077, 1.827775, 1, 0, 0.1686275, 1,
1.887834, 0.940839, 0.7496502, 1, 0, 0.1607843, 1,
1.913825, 0.4718937, 1.177761, 1, 0, 0.1568628, 1,
1.949126, -0.1763202, 3.654937, 1, 0, 0.1490196, 1,
1.9808, -0.02017483, 0.5350203, 1, 0, 0.145098, 1,
2.002673, 0.724839, 2.765149, 1, 0, 0.1372549, 1,
2.016464, -1.236331, 2.899201, 1, 0, 0.1333333, 1,
2.027966, 0.5138654, 2.475494, 1, 0, 0.1254902, 1,
2.029173, -2.286131, 2.51313, 1, 0, 0.1215686, 1,
2.030818, 1.705429, 2.346772, 1, 0, 0.1137255, 1,
2.031312, 1.712993, 2.137877, 1, 0, 0.1098039, 1,
2.113765, -0.02851252, 1.818281, 1, 0, 0.1019608, 1,
2.123165, 0.03879067, 1.864385, 1, 0, 0.09411765, 1,
2.136743, -0.365775, 3.227323, 1, 0, 0.09019608, 1,
2.146555, 0.592719, 1.11712, 1, 0, 0.08235294, 1,
2.150692, 0.6594297, 2.182081, 1, 0, 0.07843138, 1,
2.156697, 0.296548, 2.295725, 1, 0, 0.07058824, 1,
2.18814, 1.235763, 0.4906024, 1, 0, 0.06666667, 1,
2.20809, 0.5024289, 1.234385, 1, 0, 0.05882353, 1,
2.344517, -0.1426063, 1.132456, 1, 0, 0.05490196, 1,
2.34645, 1.425159, 1.867935, 1, 0, 0.04705882, 1,
2.369603, -0.4737378, 3.551221, 1, 0, 0.04313726, 1,
2.454499, 0.1763618, 1.70755, 1, 0, 0.03529412, 1,
2.475945, -1.014973, 0.2033376, 1, 0, 0.03137255, 1,
2.594787, 0.07022623, 1.170903, 1, 0, 0.02352941, 1,
2.603483, -0.3154114, 1.946473, 1, 0, 0.01960784, 1,
2.641053, -1.642366, 0.9668242, 1, 0, 0.01176471, 1,
2.835643, 1.235213, 1.361915, 1, 0, 0.007843138, 1
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
-0.3090814, -4.814977, -7.772017, 0, -0.5, 0.5, 0.5,
-0.3090814, -4.814977, -7.772017, 1, -0.5, 0.5, 0.5,
-0.3090814, -4.814977, -7.772017, 1, 1.5, 0.5, 0.5,
-0.3090814, -4.814977, -7.772017, 0, 1.5, 0.5, 0.5
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
-4.519867, -0.1130413, -7.772017, 0, -0.5, 0.5, 0.5,
-4.519867, -0.1130413, -7.772017, 1, -0.5, 0.5, 0.5,
-4.519867, -0.1130413, -7.772017, 1, 1.5, 0.5, 0.5,
-4.519867, -0.1130413, -7.772017, 0, 1.5, 0.5, 0.5
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
-4.519867, -4.814977, 0.3287578, 0, -0.5, 0.5, 0.5,
-4.519867, -4.814977, 0.3287578, 1, -0.5, 0.5, 0.5,
-4.519867, -4.814977, 0.3287578, 1, 1.5, 0.5, 0.5,
-4.519867, -4.814977, 0.3287578, 0, 1.5, 0.5, 0.5
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
-3, -3.729915, -5.902607,
2, -3.729915, -5.902607,
-3, -3.729915, -5.902607,
-3, -3.910759, -6.214176,
-2, -3.729915, -5.902607,
-2, -3.910759, -6.214176,
-1, -3.729915, -5.902607,
-1, -3.910759, -6.214176,
0, -3.729915, -5.902607,
0, -3.910759, -6.214176,
1, -3.729915, -5.902607,
1, -3.910759, -6.214176,
2, -3.729915, -5.902607,
2, -3.910759, -6.214176
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
-3, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
-3, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
-3, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
-3, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5,
-2, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
-2, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
-2, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
-2, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5,
-1, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
-1, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
-1, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
-1, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5,
0, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
0, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
0, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
0, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5,
1, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
1, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
1, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
1, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5,
2, -4.272446, -6.837312, 0, -0.5, 0.5, 0.5,
2, -4.272446, -6.837312, 1, -0.5, 0.5, 0.5,
2, -4.272446, -6.837312, 1, 1.5, 0.5, 0.5,
2, -4.272446, -6.837312, 0, 1.5, 0.5, 0.5
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
-3.548148, -2, -5.902607,
-3.548148, 2, -5.902607,
-3.548148, -2, -5.902607,
-3.710101, -2, -6.214176,
-3.548148, 0, -5.902607,
-3.710101, 0, -6.214176,
-3.548148, 2, -5.902607,
-3.710101, 2, -6.214176
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
-4.034008, -2, -6.837312, 0, -0.5, 0.5, 0.5,
-4.034008, -2, -6.837312, 1, -0.5, 0.5, 0.5,
-4.034008, -2, -6.837312, 1, 1.5, 0.5, 0.5,
-4.034008, -2, -6.837312, 0, 1.5, 0.5, 0.5,
-4.034008, 0, -6.837312, 0, -0.5, 0.5, 0.5,
-4.034008, 0, -6.837312, 1, -0.5, 0.5, 0.5,
-4.034008, 0, -6.837312, 1, 1.5, 0.5, 0.5,
-4.034008, 0, -6.837312, 0, 1.5, 0.5, 0.5,
-4.034008, 2, -6.837312, 0, -0.5, 0.5, 0.5,
-4.034008, 2, -6.837312, 1, -0.5, 0.5, 0.5,
-4.034008, 2, -6.837312, 1, 1.5, 0.5, 0.5,
-4.034008, 2, -6.837312, 0, 1.5, 0.5, 0.5
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
-3.548148, -3.729915, -4,
-3.548148, -3.729915, 6,
-3.548148, -3.729915, -4,
-3.710101, -3.910759, -4,
-3.548148, -3.729915, -2,
-3.710101, -3.910759, -2,
-3.548148, -3.729915, 0,
-3.710101, -3.910759, 0,
-3.548148, -3.729915, 2,
-3.710101, -3.910759, 2,
-3.548148, -3.729915, 4,
-3.710101, -3.910759, 4,
-3.548148, -3.729915, 6,
-3.710101, -3.910759, 6
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
"4",
"6"
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
-4.034008, -4.272446, -4, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, -4, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, -4, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, -4, 0, 1.5, 0.5, 0.5,
-4.034008, -4.272446, -2, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, -2, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, -2, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, -2, 0, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 0, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 0, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 0, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 0, 0, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 2, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 2, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 2, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 2, 0, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 4, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 4, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 4, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 4, 0, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 6, 0, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 6, 1, -0.5, 0.5, 0.5,
-4.034008, -4.272446, 6, 1, 1.5, 0.5, 0.5,
-4.034008, -4.272446, 6, 0, 1.5, 0.5, 0.5
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
-3.548148, -3.729915, -5.902607,
-3.548148, 3.503832, -5.902607,
-3.548148, -3.729915, 6.560123,
-3.548148, 3.503832, 6.560123,
-3.548148, -3.729915, -5.902607,
-3.548148, -3.729915, 6.560123,
-3.548148, 3.503832, -5.902607,
-3.548148, 3.503832, 6.560123,
-3.548148, -3.729915, -5.902607,
2.929985, -3.729915, -5.902607,
-3.548148, -3.729915, 6.560123,
2.929985, -3.729915, 6.560123,
-3.548148, 3.503832, -5.902607,
2.929985, 3.503832, -5.902607,
-3.548148, 3.503832, 6.560123,
2.929985, 3.503832, 6.560123,
2.929985, -3.729915, -5.902607,
2.929985, 3.503832, -5.902607,
2.929985, -3.729915, 6.560123,
2.929985, 3.503832, 6.560123,
2.929985, -3.729915, -5.902607,
2.929985, -3.729915, 6.560123,
2.929985, 3.503832, -5.902607,
2.929985, 3.503832, 6.560123
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
var radius = 8.436436;
var distance = 37.53466;
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
mvMatrix.translate( 0.3090814, 0.1130413, -0.3287578 );
mvMatrix.scale( 1.408066, 1.260984, 0.7319134 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.53466);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Phenothrin<-read.table("Phenothrin.xyz")
```

```
## Error in read.table("Phenothrin.xyz"): no lines available in input
```

```r
x<-Phenothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
y<-Phenothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
z<-Phenothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
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
-3.453806, -0.34125, -0.3576552, 0, 0, 1, 1, 1,
-3.218559, -2.231974, -3.649531, 1, 0, 0, 1, 1,
-2.905642, 0.2886928, -0.974107, 1, 0, 0, 1, 1,
-2.87561, 0.5320404, -1.186612, 1, 0, 0, 1, 1,
-2.837598, -0.3631324, -3.155085, 1, 0, 0, 1, 1,
-2.791416, 1.075318, -0.655017, 1, 0, 0, 1, 1,
-2.747641, 0.1664532, -2.477155, 0, 0, 0, 1, 1,
-2.704715, 1.073285, 0.4504237, 0, 0, 0, 1, 1,
-2.621693, -0.7719638, -1.261994, 0, 0, 0, 1, 1,
-2.621336, -0.8011322, -1.877413, 0, 0, 0, 1, 1,
-2.564144, 0.06389888, -0.7966685, 0, 0, 0, 1, 1,
-2.562358, -1.956013, -1.836622, 0, 0, 0, 1, 1,
-2.50433, -1.005569, -1.834898, 0, 0, 0, 1, 1,
-2.378572, -1.768947, -2.275386, 1, 1, 1, 1, 1,
-2.33603, 0.4832, -1.59575, 1, 1, 1, 1, 1,
-2.291991, -0.7244788, -0.6767312, 1, 1, 1, 1, 1,
-2.245011, -0.1400867, -2.882668, 1, 1, 1, 1, 1,
-2.215685, -0.7486033, -0.7111072, 1, 1, 1, 1, 1,
-2.171104, -0.653119, -1.255085, 1, 1, 1, 1, 1,
-2.120444, 0.5428019, -1.813333, 1, 1, 1, 1, 1,
-2.075025, 0.1456154, -0.000847946, 1, 1, 1, 1, 1,
-2.02388, -0.2811849, -2.213375, 1, 1, 1, 1, 1,
-1.998094, -1.405196, -2.660122, 1, 1, 1, 1, 1,
-1.98106, 1.912936, -1.529455, 1, 1, 1, 1, 1,
-1.980409, 0.700773, -0.6423454, 1, 1, 1, 1, 1,
-1.965124, -1.167317, -2.912272, 1, 1, 1, 1, 1,
-1.95475, 0.04976651, -1.901052, 1, 1, 1, 1, 1,
-1.949458, -1.407168, -3.984477, 1, 1, 1, 1, 1,
-1.938545, -1.679449, -2.11688, 0, 0, 1, 1, 1,
-1.911341, -0.8984293, -1.570277, 1, 0, 0, 1, 1,
-1.882064, 0.6349839, 0.2620152, 1, 0, 0, 1, 1,
-1.876473, -0.9127731, -0.5455035, 1, 0, 0, 1, 1,
-1.872933, -0.9295863, -2.325474, 1, 0, 0, 1, 1,
-1.829162, 0.7178342, -1.893325, 1, 0, 0, 1, 1,
-1.828132, 1.436061, -2.34249, 0, 0, 0, 1, 1,
-1.823555, 1.303939, -1.456891, 0, 0, 0, 1, 1,
-1.820665, -0.4022061, -1.598544, 0, 0, 0, 1, 1,
-1.815195, 0.2732533, -1.063936, 0, 0, 0, 1, 1,
-1.805632, -1.756461, -1.671445, 0, 0, 0, 1, 1,
-1.786755, -0.390896, -3.007132, 0, 0, 0, 1, 1,
-1.784919, -1.359633, -0.6451352, 0, 0, 0, 1, 1,
-1.751117, -0.1609602, -1.326829, 1, 1, 1, 1, 1,
-1.722834, -1.372167, -1.938352, 1, 1, 1, 1, 1,
-1.71568, -0.5850259, 0.4156119, 1, 1, 1, 1, 1,
-1.70363, 0.2271272, -2.035985, 1, 1, 1, 1, 1,
-1.676517, -0.2858784, 0.4655044, 1, 1, 1, 1, 1,
-1.654529, -0.9172307, -2.410716, 1, 1, 1, 1, 1,
-1.649053, 0.9159447, -1.980264, 1, 1, 1, 1, 1,
-1.648142, 0.0205284, 0.3678228, 1, 1, 1, 1, 1,
-1.644157, -0.3687839, -1.992959, 1, 1, 1, 1, 1,
-1.634057, -1.04325, -1.37076, 1, 1, 1, 1, 1,
-1.613425, -1.543911, -1.933325, 1, 1, 1, 1, 1,
-1.613136, 1.908566, -0.8199065, 1, 1, 1, 1, 1,
-1.603108, 0.1116278, -1.904593, 1, 1, 1, 1, 1,
-1.596603, -0.4968242, -1.108938, 1, 1, 1, 1, 1,
-1.5849, -0.2255099, -1.323918, 1, 1, 1, 1, 1,
-1.584486, 0.4279059, -0.2265912, 0, 0, 1, 1, 1,
-1.564541, 0.8870883, -0.8479617, 1, 0, 0, 1, 1,
-1.557927, -1.614894, -1.714594, 1, 0, 0, 1, 1,
-1.538072, 0.5522373, -1.598146, 1, 0, 0, 1, 1,
-1.537222, 0.2554278, -3.790006, 1, 0, 0, 1, 1,
-1.537188, 0.09444891, -1.099329, 1, 0, 0, 1, 1,
-1.526922, -1.784637, -2.566725, 0, 0, 0, 1, 1,
-1.521097, -0.6647877, -1.70057, 0, 0, 0, 1, 1,
-1.510076, -2.162513, -2.709327, 0, 0, 0, 1, 1,
-1.503578, 0.9849773, -2.19489, 0, 0, 0, 1, 1,
-1.502679, 1.371335, -0.9652497, 0, 0, 0, 1, 1,
-1.499309, -0.311798, -1.216459, 0, 0, 0, 1, 1,
-1.494704, 0.1527737, -1.043111, 0, 0, 0, 1, 1,
-1.491631, -1.077882, -0.8743284, 1, 1, 1, 1, 1,
-1.489223, -0.4869761, -2.826067, 1, 1, 1, 1, 1,
-1.476917, 0.6825263, -1.981356, 1, 1, 1, 1, 1,
-1.442367, -1.041443, -2.180662, 1, 1, 1, 1, 1,
-1.43257, -0.5086009, 0.3613247, 1, 1, 1, 1, 1,
-1.431066, 0.7789844, -0.8497429, 1, 1, 1, 1, 1,
-1.423606, -1.068464, -2.243817, 1, 1, 1, 1, 1,
-1.416737, 2.32463, -0.7416226, 1, 1, 1, 1, 1,
-1.415549, -0.2270238, -1.148097, 1, 1, 1, 1, 1,
-1.405227, 0.00169057, -1.98266, 1, 1, 1, 1, 1,
-1.401242, -0.2742627, -2.205364, 1, 1, 1, 1, 1,
-1.399543, 0.581729, -2.043598, 1, 1, 1, 1, 1,
-1.399178, -1.149477, -3.703231, 1, 1, 1, 1, 1,
-1.389638, -1.083169, -0.1643914, 1, 1, 1, 1, 1,
-1.382779, -0.6691586, -1.964965, 1, 1, 1, 1, 1,
-1.371856, -0.9811879, -2.861376, 0, 0, 1, 1, 1,
-1.364847, -0.8378419, -1.439762, 1, 0, 0, 1, 1,
-1.354605, -2.497474, -1.574033, 1, 0, 0, 1, 1,
-1.352186, 0.2218481, -1.227507, 1, 0, 0, 1, 1,
-1.348562, 0.02995552, -1.749305, 1, 0, 0, 1, 1,
-1.344456, -1.605774, -2.11588, 1, 0, 0, 1, 1,
-1.342323, -0.4749531, -3.017091, 0, 0, 0, 1, 1,
-1.330234, -0.712183, -2.263795, 0, 0, 0, 1, 1,
-1.323488, -0.7598692, -0.04588696, 0, 0, 0, 1, 1,
-1.311296, -1.647192, -2.456984, 0, 0, 0, 1, 1,
-1.30975, -0.8790251, -1.593451, 0, 0, 0, 1, 1,
-1.297181, -1.245518, -3.812853, 0, 0, 0, 1, 1,
-1.29682, -0.5057814, -1.830808, 0, 0, 0, 1, 1,
-1.29629, -0.8436825, 0.3488777, 1, 1, 1, 1, 1,
-1.283252, 0.3468253, -1.691279, 1, 1, 1, 1, 1,
-1.277045, 0.05013029, -3.16272, 1, 1, 1, 1, 1,
-1.273349, -1.064976, -1.729251, 1, 1, 1, 1, 1,
-1.273129, 1.052493, -1.071775, 1, 1, 1, 1, 1,
-1.272205, 0.1277572, -0.6067323, 1, 1, 1, 1, 1,
-1.268904, -0.07217735, -3.758644, 1, 1, 1, 1, 1,
-1.266428, -1.091664, -2.46931, 1, 1, 1, 1, 1,
-1.263891, 1.36043, -2.625712, 1, 1, 1, 1, 1,
-1.262217, -0.4951349, -0.03551391, 1, 1, 1, 1, 1,
-1.261762, -2.042237, -2.875989, 1, 1, 1, 1, 1,
-1.260125, -0.9263334, -1.570905, 1, 1, 1, 1, 1,
-1.24691, -0.7911913, -2.666162, 1, 1, 1, 1, 1,
-1.246757, 0.208538, -1.047235, 1, 1, 1, 1, 1,
-1.246312, 1.602797, -0.8115281, 1, 1, 1, 1, 1,
-1.240871, 1.421112, -0.5705675, 0, 0, 1, 1, 1,
-1.236004, 0.2927069, -3.237777, 1, 0, 0, 1, 1,
-1.235383, 0.2501659, -0.5764059, 1, 0, 0, 1, 1,
-1.197729, 1.361781, -0.8336279, 1, 0, 0, 1, 1,
-1.190994, -0.6785924, -1.86722, 1, 0, 0, 1, 1,
-1.183092, 0.4617524, 0.6343068, 1, 0, 0, 1, 1,
-1.180765, 0.925543, -2.13876, 0, 0, 0, 1, 1,
-1.174995, 0.451606, -0.1685458, 0, 0, 0, 1, 1,
-1.160373, 0.6331235, -1.391821, 0, 0, 0, 1, 1,
-1.159497, -0.3495749, -2.776175, 0, 0, 0, 1, 1,
-1.157301, 1.113208, -2.30597, 0, 0, 0, 1, 1,
-1.156577, 0.8481563, 0.4627279, 0, 0, 0, 1, 1,
-1.15572, -0.3493795, -2.516898, 0, 0, 0, 1, 1,
-1.155712, -1.554666, -1.436825, 1, 1, 1, 1, 1,
-1.142953, -0.1005344, -3.487511, 1, 1, 1, 1, 1,
-1.138738, -0.006022419, -1.487692, 1, 1, 1, 1, 1,
-1.138406, 0.1671537, -2.035317, 1, 1, 1, 1, 1,
-1.133686, 0.5697617, -2.028698, 1, 1, 1, 1, 1,
-1.129418, 0.3784301, -1.919527, 1, 1, 1, 1, 1,
-1.129204, 1.346272, -1.277373, 1, 1, 1, 1, 1,
-1.126747, -0.159638, -2.324422, 1, 1, 1, 1, 1,
-1.117875, -1.742615, -2.609525, 1, 1, 1, 1, 1,
-1.110794, -0.02565303, -0.5686808, 1, 1, 1, 1, 1,
-1.108841, -0.04730386, -1.048383, 1, 1, 1, 1, 1,
-1.102648, -0.09912284, -2.010739, 1, 1, 1, 1, 1,
-1.093475, -0.08891015, -1.562497, 1, 1, 1, 1, 1,
-1.08952, 1.419701, -1.411262, 1, 1, 1, 1, 1,
-1.08687, 1.431283, -0.6607564, 1, 1, 1, 1, 1,
-1.084635, 1.15888, 0.4624763, 0, 0, 1, 1, 1,
-1.079829, 1.429169, 0.8388094, 1, 0, 0, 1, 1,
-1.072844, -1.18308, -3.040569, 1, 0, 0, 1, 1,
-1.070255, -0.6762332, -2.419206, 1, 0, 0, 1, 1,
-1.066677, 0.3825915, -0.6455055, 1, 0, 0, 1, 1,
-1.064643, 0.2110875, -1.393882, 1, 0, 0, 1, 1,
-1.060158, -0.5040436, -1.938354, 0, 0, 0, 1, 1,
-1.059217, 0.1713627, -1.555544, 0, 0, 0, 1, 1,
-1.059157, -0.9382017, -3.58423, 0, 0, 0, 1, 1,
-1.053146, -0.02105881, -2.664338, 0, 0, 0, 1, 1,
-1.051814, 0.4138112, -0.4780746, 0, 0, 0, 1, 1,
-1.041587, 0.5208746, -1.578187, 0, 0, 0, 1, 1,
-1.032849, -0.4978578, -2.8037, 0, 0, 0, 1, 1,
-1.021844, -0.9218653, -1.807599, 1, 1, 1, 1, 1,
-1.021842, -1.171561, -0.6721008, 1, 1, 1, 1, 1,
-1.009718, -0.3123282, -2.390164, 1, 1, 1, 1, 1,
-1.00619, 1.654342, 0.6700635, 1, 1, 1, 1, 1,
-1.00287, 0.7677817, -1.173495, 1, 1, 1, 1, 1,
-1.001082, 0.5881582, -1.136367, 1, 1, 1, 1, 1,
-0.9911968, 0.3879766, -2.434821, 1, 1, 1, 1, 1,
-0.98634, 1.73199, -0.5471509, 1, 1, 1, 1, 1,
-0.9863108, 0.8042496, -0.4100437, 1, 1, 1, 1, 1,
-0.9854874, 0.004256977, -1.969944, 1, 1, 1, 1, 1,
-0.9781607, 0.2139022, -0.2741491, 1, 1, 1, 1, 1,
-0.9768024, 0.4636034, -1.721248, 1, 1, 1, 1, 1,
-0.9754461, 0.06162702, -0.6728486, 1, 1, 1, 1, 1,
-0.970491, 0.133375, -3.777444, 1, 1, 1, 1, 1,
-0.969157, 0.8074825, -1.748733, 1, 1, 1, 1, 1,
-0.9442828, -1.420462, -3.131067, 0, 0, 1, 1, 1,
-0.9359215, 2.574986, 0.3106504, 1, 0, 0, 1, 1,
-0.9353104, 2.004851, -0.7804516, 1, 0, 0, 1, 1,
-0.9333913, 0.3664536, -0.05449478, 1, 0, 0, 1, 1,
-0.9252979, 1.381638, -0.9969918, 1, 0, 0, 1, 1,
-0.9234313, 0.3240476, -0.8427494, 1, 0, 0, 1, 1,
-0.9151897, 0.7163135, -1.756522, 0, 0, 0, 1, 1,
-0.91267, -0.7273636, -2.08831, 0, 0, 0, 1, 1,
-0.9117462, 1.093212, -0.6214623, 0, 0, 0, 1, 1,
-0.9069172, -0.7202145, -2.374916, 0, 0, 0, 1, 1,
-0.9068124, 0.2105984, -1.115355, 0, 0, 0, 1, 1,
-0.906697, 0.2503333, -0.4703812, 0, 0, 0, 1, 1,
-0.9028642, -0.4326996, -1.784851, 0, 0, 0, 1, 1,
-0.9017466, -1.012017, -3.304492, 1, 1, 1, 1, 1,
-0.8954813, 1.663347, -0.6862422, 1, 1, 1, 1, 1,
-0.8902435, 0.2878118, 1.168279, 1, 1, 1, 1, 1,
-0.8896101, -0.2699562, -0.4649382, 1, 1, 1, 1, 1,
-0.8875794, 0.6479296, -1.433388, 1, 1, 1, 1, 1,
-0.8874906, 0.8398579, -2.720455, 1, 1, 1, 1, 1,
-0.8836959, -0.4808881, -1.940202, 1, 1, 1, 1, 1,
-0.8819978, -0.2463049, -2.568808, 1, 1, 1, 1, 1,
-0.8762094, 0.790104, -2.40308, 1, 1, 1, 1, 1,
-0.8737323, 0.7498462, -1.917374, 1, 1, 1, 1, 1,
-0.8713499, -0.8750502, -4.011167, 1, 1, 1, 1, 1,
-0.8699698, 1.504451, -0.7408872, 1, 1, 1, 1, 1,
-0.8696925, -0.2044377, -2.019006, 1, 1, 1, 1, 1,
-0.8583059, 1.407089, -1.928936, 1, 1, 1, 1, 1,
-0.8568618, -0.6383443, -1.777187, 1, 1, 1, 1, 1,
-0.8553285, 1.404516, -0.9797596, 0, 0, 1, 1, 1,
-0.8549573, 0.635193, -1.274828, 1, 0, 0, 1, 1,
-0.8546904, -0.2688283, -1.07111, 1, 0, 0, 1, 1,
-0.8517212, 0.03311616, -0.9264547, 1, 0, 0, 1, 1,
-0.8495966, 1.259283, 0.1961344, 1, 0, 0, 1, 1,
-0.8431286, -1.019095, -2.246056, 1, 0, 0, 1, 1,
-0.8374701, 0.7201471, -0.4501145, 0, 0, 0, 1, 1,
-0.833734, 0.1021946, 0.5656968, 0, 0, 0, 1, 1,
-0.8317549, 1.440907, -2.075448, 0, 0, 0, 1, 1,
-0.8289372, -0.09754115, -3.669602, 0, 0, 0, 1, 1,
-0.8284621, 0.6000179, -1.351552, 0, 0, 0, 1, 1,
-0.8230673, -0.7491417, -3.069477, 0, 0, 0, 1, 1,
-0.8230131, 1.421328, -1.549817, 0, 0, 0, 1, 1,
-0.8229102, -0.8119343, -1.970428, 1, 1, 1, 1, 1,
-0.8208355, -1.173016, -3.039872, 1, 1, 1, 1, 1,
-0.8142251, -0.2520635, -1.469182, 1, 1, 1, 1, 1,
-0.8102978, -0.2474259, -3.028148, 1, 1, 1, 1, 1,
-0.8099879, 0.361797, -2.781235, 1, 1, 1, 1, 1,
-0.8050254, 0.1715324, -2.785432, 1, 1, 1, 1, 1,
-0.8045403, 1.611597, 1.360842, 1, 1, 1, 1, 1,
-0.7985114, -0.2792869, -1.855918, 1, 1, 1, 1, 1,
-0.7939188, -0.6264865, -3.132238, 1, 1, 1, 1, 1,
-0.7875251, 1.793688, 1.460664, 1, 1, 1, 1, 1,
-0.7823684, -0.8583227, -2.755447, 1, 1, 1, 1, 1,
-0.777916, 0.5022159, -1.183292, 1, 1, 1, 1, 1,
-0.775228, 0.6234323, -0.2191336, 1, 1, 1, 1, 1,
-0.7725569, -0.2125023, -0.8462614, 1, 1, 1, 1, 1,
-0.7711348, -0.0342234, -1.289658, 1, 1, 1, 1, 1,
-0.7644298, 1.2732, -1.14492, 0, 0, 1, 1, 1,
-0.7636251, -0.9136608, -2.502469, 1, 0, 0, 1, 1,
-0.7628608, -1.623757, -4.908214, 1, 0, 0, 1, 1,
-0.7615952, -1.595292, -1.335683, 1, 0, 0, 1, 1,
-0.7588009, -0.3045417, -2.908364, 1, 0, 0, 1, 1,
-0.7489436, -2.088449, -4.05128, 1, 0, 0, 1, 1,
-0.7474822, 0.520615, 0.3941041, 0, 0, 0, 1, 1,
-0.7440471, 0.472955, -2.091323, 0, 0, 0, 1, 1,
-0.7408085, -0.5931581, -2.647305, 0, 0, 0, 1, 1,
-0.7379078, 0.5417484, -0.934018, 0, 0, 0, 1, 1,
-0.735332, 0.01918489, -2.302645, 0, 0, 0, 1, 1,
-0.7325574, -1.039939, -1.269747, 0, 0, 0, 1, 1,
-0.7288998, -1.574041, -4.227058, 0, 0, 0, 1, 1,
-0.7284325, 0.1046707, -3.354596, 1, 1, 1, 1, 1,
-0.7278992, 0.8380857, -1.273685, 1, 1, 1, 1, 1,
-0.718729, 0.5833103, -1.640166, 1, 1, 1, 1, 1,
-0.7184348, -0.3623925, -2.209058, 1, 1, 1, 1, 1,
-0.7174488, 0.5921315, -0.008403691, 1, 1, 1, 1, 1,
-0.7143697, -1.73801, -3.581657, 1, 1, 1, 1, 1,
-0.7120696, -0.09098681, -3.475309, 1, 1, 1, 1, 1,
-0.7088875, -0.1100291, -2.697442, 1, 1, 1, 1, 1,
-0.705215, 0.3000204, -0.5559044, 1, 1, 1, 1, 1,
-0.7040201, -1.004998, -2.051998, 1, 1, 1, 1, 1,
-0.6985379, -0.832779, -1.538675, 1, 1, 1, 1, 1,
-0.6959221, 1.244043, -0.9914041, 1, 1, 1, 1, 1,
-0.6937634, 0.4014027, -1.735157, 1, 1, 1, 1, 1,
-0.6925343, 1.174605, -0.7322943, 1, 1, 1, 1, 1,
-0.6900566, -1.650182, -1.005772, 1, 1, 1, 1, 1,
-0.6873512, 0.6610214, 0.2052718, 0, 0, 1, 1, 1,
-0.6854408, -0.635544, -2.001666, 1, 0, 0, 1, 1,
-0.6848831, -0.4906875, -2.166962, 1, 0, 0, 1, 1,
-0.6835737, 0.7062153, -1.129167, 1, 0, 0, 1, 1,
-0.6834204, 2.012696, -0.2432427, 1, 0, 0, 1, 1,
-0.6800802, -0.001567104, -1.287162, 1, 0, 0, 1, 1,
-0.6797244, 1.34982, -0.1677472, 0, 0, 0, 1, 1,
-0.6791525, -0.4140024, -4.098475, 0, 0, 0, 1, 1,
-0.6756606, 1.051672, 0.5711889, 0, 0, 0, 1, 1,
-0.6738877, -0.8659973, -2.09935, 0, 0, 0, 1, 1,
-0.6738772, 0.1002202, -0.7502497, 0, 0, 0, 1, 1,
-0.6707059, 0.01852382, -0.8362726, 0, 0, 0, 1, 1,
-0.6660088, -0.7709928, -3.605356, 0, 0, 0, 1, 1,
-0.6645364, 0.722455, 1.364027, 1, 1, 1, 1, 1,
-0.6619589, -1.5601, -3.359645, 1, 1, 1, 1, 1,
-0.6616064, -1.694675, -0.2958953, 1, 1, 1, 1, 1,
-0.6582531, 1.349887, -0.4811687, 1, 1, 1, 1, 1,
-0.6578398, -0.0368776, -2.161094, 1, 1, 1, 1, 1,
-0.6560764, 0.7353995, -0.2732692, 1, 1, 1, 1, 1,
-0.6525487, 0.6967174, -0.9928157, 1, 1, 1, 1, 1,
-0.6474534, -0.1600377, -1.032518, 1, 1, 1, 1, 1,
-0.6430517, -0.8067394, -2.230947, 1, 1, 1, 1, 1,
-0.634611, -1.172145, -1.463876, 1, 1, 1, 1, 1,
-0.6337146, 0.8373055, -1.535467, 1, 1, 1, 1, 1,
-0.6327059, -1.542821, -1.441425, 1, 1, 1, 1, 1,
-0.6296821, 2.061767, -0.3182929, 1, 1, 1, 1, 1,
-0.6254769, -1.306777, -3.550906, 1, 1, 1, 1, 1,
-0.6199213, 0.2666035, 0.7071726, 1, 1, 1, 1, 1,
-0.6170648, -1.59201, -1.864676, 0, 0, 1, 1, 1,
-0.615428, 0.8430351, -1.838076, 1, 0, 0, 1, 1,
-0.6126599, -0.9570642, -3.752422, 1, 0, 0, 1, 1,
-0.6096169, -1.331528, -2.937238, 1, 0, 0, 1, 1,
-0.5977694, -0.5402014, -4.641827, 1, 0, 0, 1, 1,
-0.5970737, 1.05492, 0.4286949, 1, 0, 0, 1, 1,
-0.592801, 0.3614931, -0.414073, 0, 0, 0, 1, 1,
-0.5887687, -2.050708, -3.093917, 0, 0, 0, 1, 1,
-0.5881754, -0.02031672, -0.2507647, 0, 0, 0, 1, 1,
-0.5876774, 0.465804, -1.88949, 0, 0, 0, 1, 1,
-0.5863957, -1.131673, -1.985826, 0, 0, 0, 1, 1,
-0.5839813, 0.3399531, -0.147163, 0, 0, 0, 1, 1,
-0.5809752, -0.09521279, -2.481721, 0, 0, 0, 1, 1,
-0.5784897, 1.091241, -0.682246, 1, 1, 1, 1, 1,
-0.5738624, -0.06087452, -2.363621, 1, 1, 1, 1, 1,
-0.5728381, -1.985356, -2.523471, 1, 1, 1, 1, 1,
-0.5705411, 1.061692, -1.59702, 1, 1, 1, 1, 1,
-0.5659178, 0.7667482, -1.433112, 1, 1, 1, 1, 1,
-0.5506459, 1.103779, -1.772495, 1, 1, 1, 1, 1,
-0.5480664, 0.4019329, -1.70179, 1, 1, 1, 1, 1,
-0.5470225, -0.838329, -4.158268, 1, 1, 1, 1, 1,
-0.5453017, 0.470569, 1.04617, 1, 1, 1, 1, 1,
-0.5396075, -1.274103, -4.510534, 1, 1, 1, 1, 1,
-0.5374076, -1.113795, -5.721111, 1, 1, 1, 1, 1,
-0.5372111, 0.4110385, -0.4434511, 1, 1, 1, 1, 1,
-0.535633, -1.468287, -2.323943, 1, 1, 1, 1, 1,
-0.5351639, -0.1626764, -2.712578, 1, 1, 1, 1, 1,
-0.5349006, 0.2335452, -2.170648, 1, 1, 1, 1, 1,
-0.5330493, -0.6804165, -4.320894, 0, 0, 1, 1, 1,
-0.5304123, -0.546378, -3.539918, 1, 0, 0, 1, 1,
-0.526758, -0.6551346, -1.015974, 1, 0, 0, 1, 1,
-0.5263038, 2.835534, 0.1842625, 1, 0, 0, 1, 1,
-0.524867, 1.138738, -0.1514925, 1, 0, 0, 1, 1,
-0.522408, 0.7360704, -2.652206, 1, 0, 0, 1, 1,
-0.5187733, -0.5041575, -3.388811, 0, 0, 0, 1, 1,
-0.5169759, 0.1200533, -1.328734, 0, 0, 0, 1, 1,
-0.5147488, 0.7543312, -0.8092983, 0, 0, 0, 1, 1,
-0.5143424, -1.434417, -2.458125, 0, 0, 0, 1, 1,
-0.5101751, 0.3565257, -1.409817, 0, 0, 0, 1, 1,
-0.5090714, 1.067904, -2.386724, 0, 0, 0, 1, 1,
-0.5075194, -0.8378134, -3.306346, 0, 0, 0, 1, 1,
-0.5051297, -0.07030924, -0.8769912, 1, 1, 1, 1, 1,
-0.5049864, -0.3354622, -2.308121, 1, 1, 1, 1, 1,
-0.5032633, -0.2415621, -3.899846, 1, 1, 1, 1, 1,
-0.4998565, -0.6276601, -2.407489, 1, 1, 1, 1, 1,
-0.4869131, -1.089978, -3.110044, 1, 1, 1, 1, 1,
-0.4843125, -0.5300524, -3.583307, 1, 1, 1, 1, 1,
-0.4807529, 0.3856796, -1.30086, 1, 1, 1, 1, 1,
-0.4775694, 1.821489, 0.03469459, 1, 1, 1, 1, 1,
-0.4767336, -0.5352765, -1.529866, 1, 1, 1, 1, 1,
-0.474065, 1.046329, -2.24588, 1, 1, 1, 1, 1,
-0.4730559, 1.36423, 0.06716793, 1, 1, 1, 1, 1,
-0.4694273, -1.234449, -3.195523, 1, 1, 1, 1, 1,
-0.4679249, 0.6282075, 0.8162748, 1, 1, 1, 1, 1,
-0.4679166, 0.2225051, -0.1801321, 1, 1, 1, 1, 1,
-0.467434, -0.4445518, -3.44193, 1, 1, 1, 1, 1,
-0.4640352, -1.800697, -4.02809, 0, 0, 1, 1, 1,
-0.4625416, 0.6889336, -0.7064489, 1, 0, 0, 1, 1,
-0.4559709, -0.4465246, -2.271368, 1, 0, 0, 1, 1,
-0.4474595, 0.06651792, -3.162916, 1, 0, 0, 1, 1,
-0.4430368, -0.5402098, -3.178769, 1, 0, 0, 1, 1,
-0.4429647, -1.317689, -2.514452, 1, 0, 0, 1, 1,
-0.4374249, -0.4154712, -4.206077, 0, 0, 0, 1, 1,
-0.4347921, -0.2786525, -2.839152, 0, 0, 0, 1, 1,
-0.4318454, -0.3764453, -0.7525738, 0, 0, 0, 1, 1,
-0.4306784, 0.5769021, 0.0464637, 0, 0, 0, 1, 1,
-0.428859, -1.756284, -3.420799, 0, 0, 0, 1, 1,
-0.4261467, -0.3847467, -2.440663, 0, 0, 0, 1, 1,
-0.422647, -0.8530105, -3.660426, 0, 0, 0, 1, 1,
-0.4203863, 1.040527, -0.326898, 1, 1, 1, 1, 1,
-0.4202232, 0.4047068, -1.631838, 1, 1, 1, 1, 1,
-0.4170903, 0.3433689, -0.6001405, 1, 1, 1, 1, 1,
-0.4162552, -0.9655749, -1.983691, 1, 1, 1, 1, 1,
-0.4150405, 0.09686057, -1.59371, 1, 1, 1, 1, 1,
-0.4143187, -1.289145, -4.10275, 1, 1, 1, 1, 1,
-0.4132284, 0.9821731, -0.1596462, 1, 1, 1, 1, 1,
-0.4097862, -0.06407405, -3.427385, 1, 1, 1, 1, 1,
-0.4083513, 0.6008816, 0.188114, 1, 1, 1, 1, 1,
-0.4067399, -0.2948253, -2.51009, 1, 1, 1, 1, 1,
-0.4061461, -1.50842, -3.062763, 1, 1, 1, 1, 1,
-0.3962425, 0.7673678, -1.661405, 1, 1, 1, 1, 1,
-0.395226, -0.6020576, -1.803482, 1, 1, 1, 1, 1,
-0.3928998, 0.3445411, -0.7744527, 1, 1, 1, 1, 1,
-0.3890533, 0.2121796, -0.4166232, 1, 1, 1, 1, 1,
-0.3865588, -0.3197047, 0.679477, 0, 0, 1, 1, 1,
-0.386196, 0.1485007, 0.1382986, 1, 0, 0, 1, 1,
-0.3817978, 0.6441134, 0.3505289, 1, 0, 0, 1, 1,
-0.3757715, -1.161572, -2.97107, 1, 0, 0, 1, 1,
-0.3755301, 0.9636682, -0.448324, 1, 0, 0, 1, 1,
-0.370062, 0.5899609, -0.2704709, 1, 0, 0, 1, 1,
-0.3676935, 0.09409626, -2.346015, 0, 0, 0, 1, 1,
-0.3661085, -0.8152833, -3.002754, 0, 0, 0, 1, 1,
-0.3656132, -0.7121531, -3.693707, 0, 0, 0, 1, 1,
-0.3628712, 0.5412724, -1.764228, 0, 0, 0, 1, 1,
-0.3589839, 0.7985839, -0.52507, 0, 0, 0, 1, 1,
-0.3585589, -0.1532623, -3.173752, 0, 0, 0, 1, 1,
-0.358108, 0.3552108, 0.01901918, 0, 0, 0, 1, 1,
-0.3551146, -0.6219379, 0.2502533, 1, 1, 1, 1, 1,
-0.3541213, -0.482548, -2.690238, 1, 1, 1, 1, 1,
-0.3540822, -0.6828977, -3.751525, 1, 1, 1, 1, 1,
-0.3438171, -0.6719592, -2.815937, 1, 1, 1, 1, 1,
-0.3390509, 1.298104, 0.2561182, 1, 1, 1, 1, 1,
-0.3389813, 0.8568652, 0.9066728, 1, 1, 1, 1, 1,
-0.3338552, -1.95441, -2.82164, 1, 1, 1, 1, 1,
-0.3318073, 1.417608, -2.244667, 1, 1, 1, 1, 1,
-0.3310831, -0.09074572, -3.018703, 1, 1, 1, 1, 1,
-0.3293258, 2.435924, 1.214193, 1, 1, 1, 1, 1,
-0.3255912, 0.8989749, -2.471716, 1, 1, 1, 1, 1,
-0.3190278, 0.2822606, -0.2349639, 1, 1, 1, 1, 1,
-0.3185041, -0.08775603, -0.3620814, 1, 1, 1, 1, 1,
-0.3177917, -1.331704, -2.105564, 1, 1, 1, 1, 1,
-0.3152146, 0.3957806, 0.5475209, 1, 1, 1, 1, 1,
-0.3148423, 0.9152047, -0.9499927, 0, 0, 1, 1, 1,
-0.3054965, -0.9200341, -2.770022, 1, 0, 0, 1, 1,
-0.3014132, -0.4490741, -3.53315, 1, 0, 0, 1, 1,
-0.3001969, 0.4073052, 0.3140749, 1, 0, 0, 1, 1,
-0.2989258, -0.3657328, -2.053681, 1, 0, 0, 1, 1,
-0.2912783, 1.286632, 2.129516, 1, 0, 0, 1, 1,
-0.2874638, 0.5139065, 1.52329, 0, 0, 0, 1, 1,
-0.2859712, -0.1514995, -0.4674232, 0, 0, 0, 1, 1,
-0.2846461, -3.624569, -2.976902, 0, 0, 0, 1, 1,
-0.2827681, 1.060992, 1.226737, 0, 0, 0, 1, 1,
-0.2791791, 0.7998049, -0.327025, 0, 0, 0, 1, 1,
-0.2706537, -0.6516281, -1.423182, 0, 0, 0, 1, 1,
-0.2696302, 0.655873, -0.921171, 0, 0, 0, 1, 1,
-0.2653793, 0.04261122, -1.275501, 1, 1, 1, 1, 1,
-0.2645698, -0.4906192, -1.043651, 1, 1, 1, 1, 1,
-0.2634377, -1.683964, -2.449908, 1, 1, 1, 1, 1,
-0.2634281, -0.7320418, -2.548994, 1, 1, 1, 1, 1,
-0.2615263, 1.569535, 0.5945982, 1, 1, 1, 1, 1,
-0.2584867, 0.3428932, -0.9334953, 1, 1, 1, 1, 1,
-0.2542503, -2.124824, -5.086804, 1, 1, 1, 1, 1,
-0.2540395, -0.8815753, -2.765628, 1, 1, 1, 1, 1,
-0.2420058, -0.7435117, -1.116584, 1, 1, 1, 1, 1,
-0.2399511, -0.2818933, -1.433684, 1, 1, 1, 1, 1,
-0.2381202, -0.3066018, -2.007179, 1, 1, 1, 1, 1,
-0.2342597, 0.8130785, -1.083755, 1, 1, 1, 1, 1,
-0.2335057, -0.7975709, -3.483207, 1, 1, 1, 1, 1,
-0.227139, -0.3505759, -2.756561, 1, 1, 1, 1, 1,
-0.2262071, -1.012528, -2.112543, 1, 1, 1, 1, 1,
-0.2238765, -1.136362, -1.056447, 0, 0, 1, 1, 1,
-0.2214254, 1.097646, -0.3186624, 1, 0, 0, 1, 1,
-0.2206936, 0.2038095, -1.775965, 1, 0, 0, 1, 1,
-0.2165583, -0.8572028, -2.088426, 1, 0, 0, 1, 1,
-0.2145575, -1.111054, -4.098858, 1, 0, 0, 1, 1,
-0.2136705, -0.1560493, -3.152136, 1, 0, 0, 1, 1,
-0.210769, 1.600925, 0.304616, 0, 0, 0, 1, 1,
-0.2101827, 0.3052574, -0.8853632, 0, 0, 0, 1, 1,
-0.2064769, -0.475501, -0.2613613, 0, 0, 0, 1, 1,
-0.2048894, -1.166049, -4.944773, 0, 0, 0, 1, 1,
-0.2033662, 0.1023062, -1.553112, 0, 0, 0, 1, 1,
-0.2025242, -1.858883, -3.540071, 0, 0, 0, 1, 1,
-0.1936148, 1.274249, -1.382954, 0, 0, 0, 1, 1,
-0.1909213, 0.8532472, -0.4477853, 1, 1, 1, 1, 1,
-0.1901674, 1.31343, -0.8201134, 1, 1, 1, 1, 1,
-0.1886918, -1.111137, -4.950766, 1, 1, 1, 1, 1,
-0.1880454, 0.1597787, -0.9364821, 1, 1, 1, 1, 1,
-0.1848731, 0.1707217, -0.804437, 1, 1, 1, 1, 1,
-0.1843663, -0.6903761, -3.112079, 1, 1, 1, 1, 1,
-0.1825572, -0.2488596, -0.5213693, 1, 1, 1, 1, 1,
-0.1793859, 1.302248, -1.177758, 1, 1, 1, 1, 1,
-0.1780329, 3.398487, 1.505486, 1, 1, 1, 1, 1,
-0.1778758, -0.8075579, -1.366575, 1, 1, 1, 1, 1,
-0.1747197, -0.05826063, -1.426399, 1, 1, 1, 1, 1,
-0.1745972, -0.2983447, -3.302097, 1, 1, 1, 1, 1,
-0.1723275, -0.332795, -1.894962, 1, 1, 1, 1, 1,
-0.1710694, 1.145009, -0.3611253, 1, 1, 1, 1, 1,
-0.1694238, 0.8043411, -0.9242229, 1, 1, 1, 1, 1,
-0.1646252, -1.005151, -3.849166, 0, 0, 1, 1, 1,
-0.1609707, 1.819152, -0.6005076, 1, 0, 0, 1, 1,
-0.1594561, 1.296849, 1.124905, 1, 0, 0, 1, 1,
-0.1566303, 1.071448, -0.7829481, 1, 0, 0, 1, 1,
-0.1542602, -0.4586043, -2.729389, 1, 0, 0, 1, 1,
-0.1478792, 0.684321, -2.664021, 1, 0, 0, 1, 1,
-0.1475171, 0.7577328, -0.08093113, 0, 0, 0, 1, 1,
-0.1444715, -0.4672834, -3.145467, 0, 0, 0, 1, 1,
-0.1422635, 2.124092, 0.5036983, 0, 0, 0, 1, 1,
-0.1383685, 0.6342998, 0.01111419, 0, 0, 0, 1, 1,
-0.1337063, -0.7587306, -3.075151, 0, 0, 0, 1, 1,
-0.1310778, -0.6622143, -2.818151, 0, 0, 0, 1, 1,
-0.1308291, 0.9115462, -3.251333, 0, 0, 0, 1, 1,
-0.1302212, 0.6064113, -0.08973686, 1, 1, 1, 1, 1,
-0.1294414, -0.08436448, -2.940556, 1, 1, 1, 1, 1,
-0.1286792, -0.5792826, -2.275224, 1, 1, 1, 1, 1,
-0.1251314, 1.532992, 0.6230801, 1, 1, 1, 1, 1,
-0.1240959, -1.705714, -3.120982, 1, 1, 1, 1, 1,
-0.12196, -1.543728, -2.450941, 1, 1, 1, 1, 1,
-0.1164744, -0.2552785, -2.579473, 1, 1, 1, 1, 1,
-0.1146254, -0.0461202, -1.443209, 1, 1, 1, 1, 1,
-0.113538, 0.7025083, -0.1374987, 1, 1, 1, 1, 1,
-0.112358, 0.2098155, -1.612142, 1, 1, 1, 1, 1,
-0.1110744, -1.796235, -2.570414, 1, 1, 1, 1, 1,
-0.108609, -0.999923, -1.854429, 1, 1, 1, 1, 1,
-0.1083197, -1.002935, 0.121539, 1, 1, 1, 1, 1,
-0.107382, -1.309903, -1.764672, 1, 1, 1, 1, 1,
-0.1063107, 0.5396622, -1.420372, 1, 1, 1, 1, 1,
-0.09444113, 1.411537, -0.9089917, 0, 0, 1, 1, 1,
-0.08598118, 0.594153, 0.1869421, 1, 0, 0, 1, 1,
-0.08323096, -1.581412, -4.481739, 1, 0, 0, 1, 1,
-0.08142368, -0.7736087, -1.349583, 1, 0, 0, 1, 1,
-0.08022285, 1.40014, 1.572947, 1, 0, 0, 1, 1,
-0.07947135, 0.2111344, -0.03480805, 1, 0, 0, 1, 1,
-0.07846353, 1.035955, -0.6598181, 0, 0, 0, 1, 1,
-0.07820351, 1.284144, -1.130326, 0, 0, 0, 1, 1,
-0.07364205, 0.3737347, -0.6044073, 0, 0, 0, 1, 1,
-0.0685923, 0.3672019, -0.4212688, 0, 0, 0, 1, 1,
-0.06432426, 2.638697, 0.03733388, 0, 0, 0, 1, 1,
-0.06332514, 1.617842, -1.367827, 0, 0, 0, 1, 1,
-0.05858595, 1.245166, 0.3907959, 0, 0, 0, 1, 1,
-0.0522989, -1.068103, -2.80046, 1, 1, 1, 1, 1,
-0.05107614, 0.0413799, -3.064619, 1, 1, 1, 1, 1,
-0.05061547, 1.00184, -0.4138412, 1, 1, 1, 1, 1,
-0.04709708, -0.3566458, -1.984231, 1, 1, 1, 1, 1,
-0.03970969, -0.3076992, -0.5629573, 1, 1, 1, 1, 1,
-0.03952026, -0.6309905, -2.699287, 1, 1, 1, 1, 1,
-0.03809946, -0.2062706, -5.161587, 1, 1, 1, 1, 1,
-0.03454135, -0.5473027, -3.236559, 1, 1, 1, 1, 1,
-0.03082858, 1.47095, -0.273143, 1, 1, 1, 1, 1,
-0.03065676, -1.853638, -3.804931, 1, 1, 1, 1, 1,
-0.02622098, -0.6562703, -4.425571, 1, 1, 1, 1, 1,
-0.02572127, -1.475542, -3.098188, 1, 1, 1, 1, 1,
-0.02047042, 0.5558958, 0.3094107, 1, 1, 1, 1, 1,
-0.01742354, 0.1677252, -0.7960442, 1, 1, 1, 1, 1,
-0.0159358, 0.1160751, -0.2988158, 1, 1, 1, 1, 1,
-0.01592104, -0.7849327, -3.733837, 0, 0, 1, 1, 1,
-0.01436776, 0.3599206, -1.473681, 1, 0, 0, 1, 1,
-0.01370365, 1.481074, -1.001314, 1, 0, 0, 1, 1,
-0.01223592, 1.388919, -0.4963169, 1, 0, 0, 1, 1,
-0.009247861, 1.103323, 0.2267697, 1, 0, 0, 1, 1,
-0.007304271, -1.534954, -3.107388, 1, 0, 0, 1, 1,
-0.002122229, 1.636496, 0.5723859, 0, 0, 0, 1, 1,
0.001960511, -0.181032, 2.403853, 0, 0, 0, 1, 1,
0.002399089, 1.534063, -1.904349, 0, 0, 0, 1, 1,
0.006429798, 0.4747185, -0.4730863, 0, 0, 0, 1, 1,
0.01155717, -0.4627906, 3.638279, 0, 0, 0, 1, 1,
0.01232487, 1.18428, 0.6060599, 0, 0, 0, 1, 1,
0.01382423, 0.4354013, 0.04057011, 0, 0, 0, 1, 1,
0.02877552, -1.021212, 3.115562, 1, 1, 1, 1, 1,
0.02990761, 0.0004188842, 2.37958, 1, 1, 1, 1, 1,
0.03194818, -1.241305, 1.081375, 1, 1, 1, 1, 1,
0.03431565, -0.7693585, 3.14346, 1, 1, 1, 1, 1,
0.03489713, -0.5956927, 3.404875, 1, 1, 1, 1, 1,
0.03518135, -1.373291, 5.320567, 1, 1, 1, 1, 1,
0.0357971, 0.3049895, -0.1751806, 1, 1, 1, 1, 1,
0.03595502, -0.707844, 3.366413, 1, 1, 1, 1, 1,
0.03863351, -1.547883, 3.516191, 1, 1, 1, 1, 1,
0.04405059, -0.4236185, 3.567401, 1, 1, 1, 1, 1,
0.04712626, 0.8433278, 0.3800101, 1, 1, 1, 1, 1,
0.05771883, 0.8609279, -0.2210268, 1, 1, 1, 1, 1,
0.06194764, -0.07496336, 2.919253, 1, 1, 1, 1, 1,
0.06583206, 0.894758, 0.4234766, 1, 1, 1, 1, 1,
0.07225076, -0.1672868, 2.804652, 1, 1, 1, 1, 1,
0.07441358, 1.108518, 0.5269159, 0, 0, 1, 1, 1,
0.07675172, 2.21747, -0.4585696, 1, 0, 0, 1, 1,
0.07721376, 0.9633806, -0.8881137, 1, 0, 0, 1, 1,
0.08045251, -0.950841, 3.852927, 1, 0, 0, 1, 1,
0.08584306, -0.5425344, 2.222848, 1, 0, 0, 1, 1,
0.08750582, 0.1850731, -1.042656, 1, 0, 0, 1, 1,
0.08891375, 0.5652831, 0.09288296, 0, 0, 0, 1, 1,
0.09106138, -0.9080096, 3.411585, 0, 0, 0, 1, 1,
0.09323784, 0.1628452, 0.9619572, 0, 0, 0, 1, 1,
0.09787545, -0.3410837, 6.378627, 0, 0, 0, 1, 1,
0.09788077, 0.2680621, -0.8771377, 0, 0, 0, 1, 1,
0.1000294, 0.3387245, 0.9966841, 0, 0, 0, 1, 1,
0.101236, -0.8724097, 3.196084, 0, 0, 0, 1, 1,
0.1028321, -0.5447498, 2.067931, 1, 1, 1, 1, 1,
0.1069129, -0.863293, 3.339619, 1, 1, 1, 1, 1,
0.1074037, 1.022465, 0.7708484, 1, 1, 1, 1, 1,
0.1120796, -0.9563707, 3.162467, 1, 1, 1, 1, 1,
0.1140417, 0.8444365, 0.8313788, 1, 1, 1, 1, 1,
0.1154717, 1.638548, -2.794693, 1, 1, 1, 1, 1,
0.1181934, -0.2414544, 1.677282, 1, 1, 1, 1, 1,
0.1182862, 0.7902953, 0.786265, 1, 1, 1, 1, 1,
0.1209978, -2.383984, 2.544673, 1, 1, 1, 1, 1,
0.1241293, -0.6354353, 1.951941, 1, 1, 1, 1, 1,
0.1246887, 1.107749, 1.508077, 1, 1, 1, 1, 1,
0.1271729, -1.198389, 2.246597, 1, 1, 1, 1, 1,
0.1307941, 0.4265642, -1.231536, 1, 1, 1, 1, 1,
0.1325445, 1.704746, 1.183037, 1, 1, 1, 1, 1,
0.1325863, 0.9749046, -0.1166782, 1, 1, 1, 1, 1,
0.1332214, 0.9985399, 1.410185, 0, 0, 1, 1, 1,
0.1358599, -0.4435433, 2.227613, 1, 0, 0, 1, 1,
0.1383398, -1.402369, 3.799904, 1, 0, 0, 1, 1,
0.1404591, 1.55428, 0.07460748, 1, 0, 0, 1, 1,
0.1411476, 0.1454193, -0.07967629, 1, 0, 0, 1, 1,
0.1415273, 0.4910048, 1.970737, 1, 0, 0, 1, 1,
0.1427365, 1.047448, 0.04965312, 0, 0, 0, 1, 1,
0.144557, -0.3370304, 1.988778, 0, 0, 0, 1, 1,
0.1465209, 0.5798291, 1.657675, 0, 0, 0, 1, 1,
0.1490044, -0.4965585, 3.870955, 0, 0, 0, 1, 1,
0.1500809, -0.644304, 4.292461, 0, 0, 0, 1, 1,
0.1501768, 1.212654, -2.202613, 0, 0, 0, 1, 1,
0.1515737, -1.797126, 4.077978, 0, 0, 0, 1, 1,
0.1534222, -0.85743, 2.611395, 1, 1, 1, 1, 1,
0.1546224, 1.042125, -1.511182, 1, 1, 1, 1, 1,
0.1609684, 0.1451737, 1.641486, 1, 1, 1, 1, 1,
0.1615865, -0.8748817, 3.319754, 1, 1, 1, 1, 1,
0.1626664, 1.234541, -0.9963109, 1, 1, 1, 1, 1,
0.1649857, -1.146954, 3.060377, 1, 1, 1, 1, 1,
0.1651921, 1.255806, -0.07976626, 1, 1, 1, 1, 1,
0.1652204, -0.5234972, 2.449528, 1, 1, 1, 1, 1,
0.1673081, -2.039016, 2.676709, 1, 1, 1, 1, 1,
0.1699868, -0.1022174, 1.069033, 1, 1, 1, 1, 1,
0.1715878, -0.8419683, 3.268247, 1, 1, 1, 1, 1,
0.1734001, -0.6746596, 3.048985, 1, 1, 1, 1, 1,
0.1739609, -0.6640707, 2.995567, 1, 1, 1, 1, 1,
0.1747469, 0.3025491, -0.3171804, 1, 1, 1, 1, 1,
0.178774, -0.3547827, 1.450385, 1, 1, 1, 1, 1,
0.1789981, 0.8206782, 2.666428, 0, 0, 1, 1, 1,
0.1797043, 1.143003, 1.298345, 1, 0, 0, 1, 1,
0.1803301, 0.8124637, 0.8676764, 1, 0, 0, 1, 1,
0.1866715, 0.8984467, 0.2319976, 1, 0, 0, 1, 1,
0.1874427, 0.7003253, 1.25896, 1, 0, 0, 1, 1,
0.188166, -0.8610123, 3.553606, 1, 0, 0, 1, 1,
0.1956397, -0.7230196, 1.962276, 0, 0, 0, 1, 1,
0.1965412, 0.598822, 0.5658665, 0, 0, 0, 1, 1,
0.1977923, -0.6627162, 3.122176, 0, 0, 0, 1, 1,
0.2000249, 0.2024867, 0.5366965, 0, 0, 0, 1, 1,
0.2024158, 0.05383062, 1.504275, 0, 0, 0, 1, 1,
0.215592, -2.368496, 3.020627, 0, 0, 0, 1, 1,
0.2167636, -1.419026, 2.251829, 0, 0, 0, 1, 1,
0.2196497, -0.3254515, 3.720721, 1, 1, 1, 1, 1,
0.2206603, -0.2273591, 2.705308, 1, 1, 1, 1, 1,
0.223777, -1.345136, 1.427943, 1, 1, 1, 1, 1,
0.2252182, -2.144241, 2.324194, 1, 1, 1, 1, 1,
0.2312083, 1.679947, 1.463493, 1, 1, 1, 1, 1,
0.2312179, -0.3991227, 2.233305, 1, 1, 1, 1, 1,
0.2334491, -0.5494875, 2.323276, 1, 1, 1, 1, 1,
0.2338238, -0.3209238, 1.380416, 1, 1, 1, 1, 1,
0.2403839, 0.2187018, 0.7421001, 1, 1, 1, 1, 1,
0.241737, -0.9657261, 0.5719528, 1, 1, 1, 1, 1,
0.243563, 0.5823517, -1.011756, 1, 1, 1, 1, 1,
0.2438888, 0.02765485, 1.287209, 1, 1, 1, 1, 1,
0.2495706, 1.288963, 1.406368, 1, 1, 1, 1, 1,
0.2504445, -1.442444, 4.054369, 1, 1, 1, 1, 1,
0.2536399, -1.27332, 1.782611, 1, 1, 1, 1, 1,
0.2552302, 1.878746, -1.44319, 0, 0, 1, 1, 1,
0.263303, -0.4860674, 0.8416432, 1, 0, 0, 1, 1,
0.267696, -0.5131326, 2.766534, 1, 0, 0, 1, 1,
0.2770273, -2.381315, 2.160674, 1, 0, 0, 1, 1,
0.2790676, -0.2241054, 2.474744, 1, 0, 0, 1, 1,
0.2814004, 1.686139, -0.4575624, 1, 0, 0, 1, 1,
0.2836821, 0.08352432, 0.3070775, 0, 0, 0, 1, 1,
0.285505, 0.6891355, 1.170636, 0, 0, 0, 1, 1,
0.2917672, 0.7027401, 0.1048906, 0, 0, 0, 1, 1,
0.2957435, -1.270715, 2.632533, 0, 0, 0, 1, 1,
0.2963412, 2.608095, 0.008561552, 0, 0, 0, 1, 1,
0.2969926, 1.3718, -0.4000477, 0, 0, 0, 1, 1,
0.2979631, -0.7989003, 3.202853, 0, 0, 0, 1, 1,
0.2986924, -0.346606, 1.62295, 1, 1, 1, 1, 1,
0.2991432, 1.673767, -1.366474, 1, 1, 1, 1, 1,
0.3047444, 0.2082881, 2.989866, 1, 1, 1, 1, 1,
0.3056847, -1.011508, 4.574055, 1, 1, 1, 1, 1,
0.3101736, -1.085895, 3.052704, 1, 1, 1, 1, 1,
0.3135328, -1.549851, 3.685422, 1, 1, 1, 1, 1,
0.3146787, -0.3130211, 2.24456, 1, 1, 1, 1, 1,
0.3153644, 1.537632, 0.5367419, 1, 1, 1, 1, 1,
0.3165631, 0.02472121, 0.885286, 1, 1, 1, 1, 1,
0.3185249, -0.6830533, 3.043616, 1, 1, 1, 1, 1,
0.3194483, -0.5849622, 2.054569, 1, 1, 1, 1, 1,
0.3202119, 0.4932146, 0.3933196, 1, 1, 1, 1, 1,
0.3232316, -1.408885, 3.85083, 1, 1, 1, 1, 1,
0.3266467, -0.303227, 2.02081, 1, 1, 1, 1, 1,
0.3272258, 0.2271684, 1.608945, 1, 1, 1, 1, 1,
0.3273402, 2.532769, -0.4371382, 0, 0, 1, 1, 1,
0.3286598, 0.1171449, 2.480302, 1, 0, 0, 1, 1,
0.3318735, -2.217027, 3.214623, 1, 0, 0, 1, 1,
0.3335844, -0.3153326, 3.295208, 1, 0, 0, 1, 1,
0.3376839, -1.062858, 2.120003, 1, 0, 0, 1, 1,
0.3452593, -2.092112, 2.580513, 1, 0, 0, 1, 1,
0.3506892, 0.2437601, 1.885873, 0, 0, 0, 1, 1,
0.3566011, -0.3900521, 3.78362, 0, 0, 0, 1, 1,
0.3582357, 0.7307867, -0.03884459, 0, 0, 0, 1, 1,
0.3649227, -0.4813392, 2.188216, 0, 0, 0, 1, 1,
0.3667322, 1.737024, 0.7854552, 0, 0, 0, 1, 1,
0.3697577, -2.081121, 2.002655, 0, 0, 0, 1, 1,
0.3697912, 0.05620614, 3.399717, 0, 0, 0, 1, 1,
0.3755033, -0.2286577, 1.981183, 1, 1, 1, 1, 1,
0.379116, -2.445658, 2.763909, 1, 1, 1, 1, 1,
0.3802125, -1.650005, 4.519809, 1, 1, 1, 1, 1,
0.3811217, -0.04774403, 1.240643, 1, 1, 1, 1, 1,
0.3814566, -0.3372432, 1.806928, 1, 1, 1, 1, 1,
0.3820839, 2.036338, 0.4002869, 1, 1, 1, 1, 1,
0.3834381, -0.414612, 2.364897, 1, 1, 1, 1, 1,
0.3881156, 0.7879316, 1.407235, 1, 1, 1, 1, 1,
0.3901756, -0.07043288, 1.73709, 1, 1, 1, 1, 1,
0.3906898, -0.5287029, 2.192861, 1, 1, 1, 1, 1,
0.3914427, -0.3452202, 1.670663, 1, 1, 1, 1, 1,
0.3915347, 0.8915959, -0.4679276, 1, 1, 1, 1, 1,
0.3922252, 0.06090855, 1.994172, 1, 1, 1, 1, 1,
0.3930067, 0.4173721, -1.291818, 1, 1, 1, 1, 1,
0.3931147, 0.2474812, 0.5054172, 1, 1, 1, 1, 1,
0.3931192, 0.2854554, 1.259007, 0, 0, 1, 1, 1,
0.3975059, -0.145339, 1.543436, 1, 0, 0, 1, 1,
0.3985112, -0.346186, 1.687463, 1, 0, 0, 1, 1,
0.4056491, 0.3763442, -0.6353896, 1, 0, 0, 1, 1,
0.4057547, -0.221011, 1.587386, 1, 0, 0, 1, 1,
0.4072973, 0.958184, 0.03840085, 1, 0, 0, 1, 1,
0.4076844, -0.4917536, 4.144929, 0, 0, 0, 1, 1,
0.4079331, -0.8900487, 2.784533, 0, 0, 0, 1, 1,
0.4080971, -1.652256, 3.557191, 0, 0, 0, 1, 1,
0.4085277, 0.5149673, 0.06515805, 0, 0, 0, 1, 1,
0.4108256, -0.7648975, 2.303197, 0, 0, 0, 1, 1,
0.4113815, 0.122496, -1.975103, 0, 0, 0, 1, 1,
0.415955, -0.4797018, 2.775424, 0, 0, 0, 1, 1,
0.4203398, 0.009952495, 3.299261, 1, 1, 1, 1, 1,
0.4242213, -2.392486, 3.383444, 1, 1, 1, 1, 1,
0.4243951, 0.6853163, 0.6122543, 1, 1, 1, 1, 1,
0.4327365, -0.1672437, 0.0250736, 1, 1, 1, 1, 1,
0.4339007, -1.625836, 3.514132, 1, 1, 1, 1, 1,
0.4341139, -0.2558043, 2.076985, 1, 1, 1, 1, 1,
0.4368877, -0.1460912, 1.989336, 1, 1, 1, 1, 1,
0.4409561, 1.688385, 0.04356455, 1, 1, 1, 1, 1,
0.4421561, -0.3281061, 2.129892, 1, 1, 1, 1, 1,
0.4426587, -0.1109113, 1.028678, 1, 1, 1, 1, 1,
0.4454509, -1.933521, 3.369694, 1, 1, 1, 1, 1,
0.4454878, 0.4150963, 1.909165, 1, 1, 1, 1, 1,
0.4460011, 0.8491129, 2.083697, 1, 1, 1, 1, 1,
0.4479285, -0.2824121, 2.016117, 1, 1, 1, 1, 1,
0.4488879, 0.2642806, -0.3139103, 1, 1, 1, 1, 1,
0.4569487, -0.8265671, 1.779877, 0, 0, 1, 1, 1,
0.4608132, 1.857503, 0.93667, 1, 0, 0, 1, 1,
0.4640483, 0.003465365, 1.614142, 1, 0, 0, 1, 1,
0.4690106, 1.194989, 1.09842, 1, 0, 0, 1, 1,
0.4742323, 0.6950552, 1.398466, 1, 0, 0, 1, 1,
0.4795536, -0.105953, 1.884716, 1, 0, 0, 1, 1,
0.4850523, 0.1660526, 1.975605, 0, 0, 0, 1, 1,
0.4850736, 0.07535366, 1.203002, 0, 0, 0, 1, 1,
0.4887909, 0.3941772, 0.6338786, 0, 0, 0, 1, 1,
0.4923369, -1.259776, 3.656166, 0, 0, 0, 1, 1,
0.4924735, 0.09505481, 1.183399, 0, 0, 0, 1, 1,
0.4933929, 0.3119874, 2.615903, 0, 0, 0, 1, 1,
0.4977047, -0.3003783, -0.08826046, 0, 0, 0, 1, 1,
0.4986864, 0.06948501, 1.251999, 1, 1, 1, 1, 1,
0.4999198, 0.2024388, 1.885141, 1, 1, 1, 1, 1,
0.5020086, -0.1839095, 1.410008, 1, 1, 1, 1, 1,
0.5026499, 0.7279273, -0.7530509, 1, 1, 1, 1, 1,
0.5030972, -1.458648, 4.48315, 1, 1, 1, 1, 1,
0.5049633, -0.4106724, 0.7878578, 1, 1, 1, 1, 1,
0.5084088, 0.688616, 0.03079121, 1, 1, 1, 1, 1,
0.5122927, -0.3988512, 2.35118, 1, 1, 1, 1, 1,
0.5148896, 1.430333, 1.078873, 1, 1, 1, 1, 1,
0.5223423, 0.5100269, 1.061784, 1, 1, 1, 1, 1,
0.5230268, -1.175529, 2.81217, 1, 1, 1, 1, 1,
0.5294553, -0.878579, 3.522438, 1, 1, 1, 1, 1,
0.5299073, -0.1780729, 1.648164, 1, 1, 1, 1, 1,
0.5299803, 0.7124022, 0.4904256, 1, 1, 1, 1, 1,
0.5330951, -0.2045792, 1.600726, 1, 1, 1, 1, 1,
0.5349985, -0.01486397, 1.270826, 0, 0, 1, 1, 1,
0.5374125, -0.2470298, 4.395246, 1, 0, 0, 1, 1,
0.5427155, -0.2045937, -0.4273734, 1, 0, 0, 1, 1,
0.5433758, -2.095421, 1.629111, 1, 0, 0, 1, 1,
0.5474365, -0.5114415, 2.397282, 1, 0, 0, 1, 1,
0.5501391, -1.066687, 3.288671, 1, 0, 0, 1, 1,
0.5527759, -2.010352, 3.000387, 0, 0, 0, 1, 1,
0.5546579, 0.5526355, -0.1833151, 0, 0, 0, 1, 1,
0.5548744, 0.08577256, 1.142631, 0, 0, 0, 1, 1,
0.5582608, -0.319589, 2.218235, 0, 0, 0, 1, 1,
0.5612322, -0.764701, 2.413038, 0, 0, 0, 1, 1,
0.5619786, -0.4104334, 4.075405, 0, 0, 0, 1, 1,
0.5629551, 0.5544562, -0.4245706, 0, 0, 0, 1, 1,
0.5664424, 1.07192, 0.2828904, 1, 1, 1, 1, 1,
0.5891057, 0.114637, 1.423357, 1, 1, 1, 1, 1,
0.5955919, 0.4174654, 0.6628775, 1, 1, 1, 1, 1,
0.5975188, -0.4371369, 0.9311697, 1, 1, 1, 1, 1,
0.5986473, 0.171486, 2.732554, 1, 1, 1, 1, 1,
0.5988144, 0.6767325, 0.7317683, 1, 1, 1, 1, 1,
0.6034088, 0.9928595, 0.2819692, 1, 1, 1, 1, 1,
0.6063142, -1.255377, 3.357993, 1, 1, 1, 1, 1,
0.6098169, -1.455156, 3.620718, 1, 1, 1, 1, 1,
0.625384, 1.486576, 2.088575, 1, 1, 1, 1, 1,
0.6334755, 0.3865729, -0.2523648, 1, 1, 1, 1, 1,
0.6334783, -0.3765136, 3.49502, 1, 1, 1, 1, 1,
0.6351315, 0.9208832, 0.5161018, 1, 1, 1, 1, 1,
0.6439911, -0.9720997, 3.456725, 1, 1, 1, 1, 1,
0.6446059, -1.663389, 2.329346, 1, 1, 1, 1, 1,
0.6464422, 0.453899, 1.221977, 0, 0, 1, 1, 1,
0.6484443, -0.4349245, 2.685725, 1, 0, 0, 1, 1,
0.6490389, -2.122506, 2.740774, 1, 0, 0, 1, 1,
0.6530858, -0.2591716, 2.531657, 1, 0, 0, 1, 1,
0.6574382, -0.1244925, 1.861879, 1, 0, 0, 1, 1,
0.6611986, -0.1445837, 1.418609, 1, 0, 0, 1, 1,
0.6615388, 0.05490527, 3.632637, 0, 0, 0, 1, 1,
0.6651341, -1.342873, 1.159281, 0, 0, 0, 1, 1,
0.6656311, -2.00573, 2.31024, 0, 0, 0, 1, 1,
0.6680443, 1.049007, 2.236274, 0, 0, 0, 1, 1,
0.6704187, 0.3363754, 2.443623, 0, 0, 0, 1, 1,
0.6744641, 1.452838, -0.8288692, 0, 0, 0, 1, 1,
0.6747025, -1.942392, 2.674387, 0, 0, 0, 1, 1,
0.6840602, -1.470744, 4.405814, 1, 1, 1, 1, 1,
0.6891193, 0.8837419, -0.195337, 1, 1, 1, 1, 1,
0.695296, 0.9028701, -0.3615031, 1, 1, 1, 1, 1,
0.6964319, 0.4522954, 0.9461133, 1, 1, 1, 1, 1,
0.6979011, -0.4628318, 2.397107, 1, 1, 1, 1, 1,
0.7089265, -0.7600775, 1.934331, 1, 1, 1, 1, 1,
0.7128663, -1.201319, 2.4603, 1, 1, 1, 1, 1,
0.7134964, 0.6874246, 1.946539, 1, 1, 1, 1, 1,
0.7136949, 0.6743618, 1.851395, 1, 1, 1, 1, 1,
0.7142548, -0.1558573, 2.313222, 1, 1, 1, 1, 1,
0.7164329, -0.9999807, 3.094368, 1, 1, 1, 1, 1,
0.7172026, 0.4093769, 3.455161, 1, 1, 1, 1, 1,
0.7183802, 0.5144473, 0.03689612, 1, 1, 1, 1, 1,
0.7256197, -1.727982, 3.815099, 1, 1, 1, 1, 1,
0.7375762, -0.5293031, 0.7506518, 1, 1, 1, 1, 1,
0.7391455, -0.07659651, 0.4125254, 0, 0, 1, 1, 1,
0.7445697, 1.210989, 1.62401, 1, 0, 0, 1, 1,
0.7450106, 0.4395809, 1.230215, 1, 0, 0, 1, 1,
0.7536443, 2.017807, 0.4363878, 1, 0, 0, 1, 1,
0.7552778, 1.374707, 0.9853336, 1, 0, 0, 1, 1,
0.7587377, 0.2795534, 1.010008, 1, 0, 0, 1, 1,
0.7624077, -0.6655128, 3.094633, 0, 0, 0, 1, 1,
0.7629889, 1.241949, -0.6785631, 0, 0, 0, 1, 1,
0.7697132, -0.3710098, 2.333025, 0, 0, 0, 1, 1,
0.7734127, 1.054975, 1.706196, 0, 0, 0, 1, 1,
0.7784213, -0.2252833, 3.262337, 0, 0, 0, 1, 1,
0.780681, 0.7747803, -0.2926968, 0, 0, 0, 1, 1,
0.7858984, 0.3302801, 0.8968216, 0, 0, 0, 1, 1,
0.7876886, 0.3110404, 2.038487, 1, 1, 1, 1, 1,
0.7906251, 0.3495468, 2.635678, 1, 1, 1, 1, 1,
0.8240341, 0.9015318, 1.419022, 1, 1, 1, 1, 1,
0.824613, -0.6150867, 2.265557, 1, 1, 1, 1, 1,
0.8277168, 0.1887793, 1.792575, 1, 1, 1, 1, 1,
0.8397421, 0.392763, 0.8130934, 1, 1, 1, 1, 1,
0.8416193, 0.3768192, 2.172305, 1, 1, 1, 1, 1,
0.8549027, 0.3130032, 2.088704, 1, 1, 1, 1, 1,
0.8559294, 0.8486707, 1.208118, 1, 1, 1, 1, 1,
0.8561653, -0.04143211, 1.273129, 1, 1, 1, 1, 1,
0.8587596, 1.410152, 0.8512205, 1, 1, 1, 1, 1,
0.8602484, -1.62749, 5.023364, 1, 1, 1, 1, 1,
0.860359, -0.4443518, 0.9029644, 1, 1, 1, 1, 1,
0.8611668, -0.07228255, 2.518294, 1, 1, 1, 1, 1,
0.8713888, 0.08716095, 1.241696, 1, 1, 1, 1, 1,
0.8794799, -0.2066644, 1.186095, 0, 0, 1, 1, 1,
0.8835065, -0.5793861, 2.016198, 1, 0, 0, 1, 1,
0.8835525, -0.7874108, 3.378637, 1, 0, 0, 1, 1,
0.8848183, -0.9229627, 1.748911, 1, 0, 0, 1, 1,
0.8868124, 0.85355, 0.9237543, 1, 0, 0, 1, 1,
0.8897871, 1.673181, 1.382327, 1, 0, 0, 1, 1,
0.890015, -0.3774836, 3.411714, 0, 0, 0, 1, 1,
0.8907154, 2.932983, 0.4666225, 0, 0, 0, 1, 1,
0.8942556, -0.1062821, -0.6591333, 0, 0, 0, 1, 1,
0.8957456, -1.862133, 3.136393, 0, 0, 0, 1, 1,
0.8975926, -1.233283, -0.7192534, 0, 0, 0, 1, 1,
0.9007864, -1.426762, 1.205029, 0, 0, 0, 1, 1,
0.9019408, 1.9019, 0.9519665, 0, 0, 0, 1, 1,
0.9031575, 0.3844368, 2.190978, 1, 1, 1, 1, 1,
0.9172918, -0.59209, 1.401147, 1, 1, 1, 1, 1,
0.9176875, 1.307033, 0.4375781, 1, 1, 1, 1, 1,
0.923875, 0.621751, -0.3142264, 1, 1, 1, 1, 1,
0.927842, 1.579138, 0.4966894, 1, 1, 1, 1, 1,
0.9297383, -0.1128121, 1.484152, 1, 1, 1, 1, 1,
0.9328408, -0.1000914, 0.1384818, 1, 1, 1, 1, 1,
0.9349214, 0.1899202, 1.043036, 1, 1, 1, 1, 1,
0.9393033, -2.078401, 3.588804, 1, 1, 1, 1, 1,
0.9394029, -1.342742, 1.027074, 1, 1, 1, 1, 1,
0.9396638, 0.9866548, 1.809998, 1, 1, 1, 1, 1,
0.9473854, -0.1329048, 0.8230934, 1, 1, 1, 1, 1,
0.9480706, 0.05374204, 2.178692, 1, 1, 1, 1, 1,
0.9529129, 0.07943188, -0.9731312, 1, 1, 1, 1, 1,
0.9530087, -0.5697312, 1.406395, 1, 1, 1, 1, 1,
0.9549296, -1.731053, 2.72835, 0, 0, 1, 1, 1,
0.9583437, -1.793917, 2.111716, 1, 0, 0, 1, 1,
0.9634011, -1.134344, 3.227185, 1, 0, 0, 1, 1,
0.9663059, 0.1750214, 1.095115, 1, 0, 0, 1, 1,
0.9665859, -0.2599202, 2.45764, 1, 0, 0, 1, 1,
0.9795344, 0.9209188, 0.3960047, 1, 0, 0, 1, 1,
0.9839956, -0.1073766, 1.421474, 0, 0, 0, 1, 1,
1.012141, 0.08149021, 2.098675, 0, 0, 0, 1, 1,
1.01241, -0.9815466, 2.506656, 0, 0, 0, 1, 1,
1.023919, 0.3211299, 2.140265, 0, 0, 0, 1, 1,
1.024135, -0.7978008, 2.544924, 0, 0, 0, 1, 1,
1.026751, -0.1778692, 3.056015, 0, 0, 0, 1, 1,
1.028264, -0.5235676, 1.725291, 0, 0, 0, 1, 1,
1.031008, -1.176104, 3.322221, 1, 1, 1, 1, 1,
1.032044, -1.060346, 2.519509, 1, 1, 1, 1, 1,
1.034469, 1.203161, -0.6261554, 1, 1, 1, 1, 1,
1.034698, -0.1248937, 1.632618, 1, 1, 1, 1, 1,
1.036531, 0.9445204, 0.368942, 1, 1, 1, 1, 1,
1.037725, -1.072637, 1.468315, 1, 1, 1, 1, 1,
1.043918, -0.7505537, 0.5332641, 1, 1, 1, 1, 1,
1.045322, 0.3693853, 0.8440353, 1, 1, 1, 1, 1,
1.047286, 0.4863203, -0.07782011, 1, 1, 1, 1, 1,
1.060612, -0.1316677, 0.3942039, 1, 1, 1, 1, 1,
1.069045, -0.9084972, 1.260742, 1, 1, 1, 1, 1,
1.078243, 0.6835012, 0.04986737, 1, 1, 1, 1, 1,
1.083834, 0.6044884, -0.1547879, 1, 1, 1, 1, 1,
1.085925, 1.851566, 0.496042, 1, 1, 1, 1, 1,
1.086487, -0.85563, 1.384178, 1, 1, 1, 1, 1,
1.096716, -0.237793, 2.321219, 0, 0, 1, 1, 1,
1.098445, 0.4903263, 0.09979116, 1, 0, 0, 1, 1,
1.102109, -0.3915696, 1.962867, 1, 0, 0, 1, 1,
1.110386, -1.653327, 3.468565, 1, 0, 0, 1, 1,
1.110736, 0.2711048, 0.7969649, 1, 0, 0, 1, 1,
1.115844, 0.8675332, 0.3732219, 1, 0, 0, 1, 1,
1.12277, -1.039304, 2.750304, 0, 0, 0, 1, 1,
1.125948, 1.153544, 2.021614, 0, 0, 0, 1, 1,
1.130511, 2.537792, 0.9044787, 0, 0, 0, 1, 1,
1.134433, -0.2933456, 1.995174, 0, 0, 0, 1, 1,
1.13981, 1.72001, -0.7396759, 0, 0, 0, 1, 1,
1.146775, 0.4721673, 1.556065, 0, 0, 0, 1, 1,
1.157655, -0.2388801, 0.2705115, 0, 0, 0, 1, 1,
1.168654, -0.7553223, 4.06673, 1, 1, 1, 1, 1,
1.17717, 0.4448295, 2.867183, 1, 1, 1, 1, 1,
1.180617, -1.004928, 2.867456, 1, 1, 1, 1, 1,
1.180858, 0.8540523, 1.852288, 1, 1, 1, 1, 1,
1.182944, 0.7006772, 1.924538, 1, 1, 1, 1, 1,
1.186239, -1.188839, 3.239349, 1, 1, 1, 1, 1,
1.187683, 0.3042474, 1.544165, 1, 1, 1, 1, 1,
1.193122, -1.800393, 2.033861, 1, 1, 1, 1, 1,
1.204992, -1.277716, 1.971808, 1, 1, 1, 1, 1,
1.205494, 0.4866506, 1.124063, 1, 1, 1, 1, 1,
1.205976, 0.1317752, 1.00037, 1, 1, 1, 1, 1,
1.207467, -0.5984742, 0.6139522, 1, 1, 1, 1, 1,
1.208387, 0.4950691, 0.9297352, 1, 1, 1, 1, 1,
1.213683, -1.068969, 3.65421, 1, 1, 1, 1, 1,
1.230296, -0.4915316, 2.34281, 1, 1, 1, 1, 1,
1.2336, -1.448128, 2.529353, 0, 0, 1, 1, 1,
1.238602, 0.5202447, 1.286925, 1, 0, 0, 1, 1,
1.242544, 0.01705706, 0.170161, 1, 0, 0, 1, 1,
1.243281, 0.9427598, 3.381798, 1, 0, 0, 1, 1,
1.252354, -0.7170612, 1.002526, 1, 0, 0, 1, 1,
1.253482, 0.5830137, 2.007311, 1, 0, 0, 1, 1,
1.253928, 0.3798022, -0.1194572, 0, 0, 0, 1, 1,
1.267276, 0.08157288, 1.688189, 0, 0, 0, 1, 1,
1.267726, -0.7614655, 3.976737, 0, 0, 0, 1, 1,
1.269468, -0.295887, 2.765606, 0, 0, 0, 1, 1,
1.273133, 0.3647431, 2.040046, 0, 0, 0, 1, 1,
1.27396, 0.6051549, 2.083078, 0, 0, 0, 1, 1,
1.29534, -0.4276858, 2.837639, 0, 0, 0, 1, 1,
1.317286, -1.388408, 2.157567, 1, 1, 1, 1, 1,
1.322065, 0.5816051, 2.139227, 1, 1, 1, 1, 1,
1.32736, 1.059546, 1.308216, 1, 1, 1, 1, 1,
1.329772, 0.1302172, 0.6368181, 1, 1, 1, 1, 1,
1.33696, 0.3219353, 0.9762568, 1, 1, 1, 1, 1,
1.342561, -0.6370866, 0.6167567, 1, 1, 1, 1, 1,
1.350673, -0.4874854, 1.121191, 1, 1, 1, 1, 1,
1.353927, -0.3624452, 3.921416, 1, 1, 1, 1, 1,
1.362234, -0.07319821, 1.653667, 1, 1, 1, 1, 1,
1.364225, -1.310179, 1.110407, 1, 1, 1, 1, 1,
1.373459, -0.02217221, 3.386108, 1, 1, 1, 1, 1,
1.386377, -0.5595087, 1.733778, 1, 1, 1, 1, 1,
1.388774, 3.303368, 2.287258, 1, 1, 1, 1, 1,
1.389875, 0.820841, 1.010803, 1, 1, 1, 1, 1,
1.400413, -0.4895336, 1.44589, 1, 1, 1, 1, 1,
1.40494, -0.4965342, 0.7232247, 0, 0, 1, 1, 1,
1.418396, -0.06033567, 1.124178, 1, 0, 0, 1, 1,
1.428, -0.1588753, 1.353716, 1, 0, 0, 1, 1,
1.466835, -1.299813, 2.300316, 1, 0, 0, 1, 1,
1.482726, -0.8147637, 2.559508, 1, 0, 0, 1, 1,
1.494185, -0.2824852, 1.666364, 1, 0, 0, 1, 1,
1.502115, -0.5380598, 4.526972, 0, 0, 0, 1, 1,
1.512314, -1.310947, 2.520959, 0, 0, 0, 1, 1,
1.512797, -0.2102626, 3.521609, 0, 0, 0, 1, 1,
1.515415, 1.18992, 0.8906113, 0, 0, 0, 1, 1,
1.527421, 2.69163, -0.06350099, 0, 0, 0, 1, 1,
1.537954, -0.393784, 1.407769, 0, 0, 0, 1, 1,
1.538038, -0.04042916, 1.218252, 0, 0, 0, 1, 1,
1.541769, 0.2608424, 1.611992, 1, 1, 1, 1, 1,
1.546853, 0.08186904, 0.6570485, 1, 1, 1, 1, 1,
1.5589, -1.025931, 2.59525, 1, 1, 1, 1, 1,
1.566788, 1.009179, 0.9210129, 1, 1, 1, 1, 1,
1.567822, -0.7690458, 2.480345, 1, 1, 1, 1, 1,
1.568422, 0.3159932, 1.771427, 1, 1, 1, 1, 1,
1.569026, -0.7371034, 2.372813, 1, 1, 1, 1, 1,
1.576886, 0.4428031, 0.09100877, 1, 1, 1, 1, 1,
1.577571, 0.7679526, 2.566834, 1, 1, 1, 1, 1,
1.581557, -0.7888259, 2.489215, 1, 1, 1, 1, 1,
1.589642, -0.9682551, 1.855435, 1, 1, 1, 1, 1,
1.607354, -0.0836713, 1.330857, 1, 1, 1, 1, 1,
1.610729, 0.08444224, 1.127543, 1, 1, 1, 1, 1,
1.617524, 0.6847581, 3.122195, 1, 1, 1, 1, 1,
1.626261, -1.133357, 1.237009, 1, 1, 1, 1, 1,
1.628075, 0.2664132, 0.9025638, 0, 0, 1, 1, 1,
1.645414, -1.197375, 2.068372, 1, 0, 0, 1, 1,
1.647981, 0.2936693, 1.462392, 1, 0, 0, 1, 1,
1.661845, -0.7329396, 1.556218, 1, 0, 0, 1, 1,
1.677426, 1.820534, 0.9790508, 1, 0, 0, 1, 1,
1.685971, -0.9223186, 3.346689, 1, 0, 0, 1, 1,
1.691521, 1.691544, 0.2373701, 0, 0, 0, 1, 1,
1.694355, -0.7975456, 3.378119, 0, 0, 0, 1, 1,
1.699604, -2.927211, 2.665856, 0, 0, 0, 1, 1,
1.708509, 0.3241415, 1.604496, 0, 0, 0, 1, 1,
1.712779, 0.2538681, 1.761789, 0, 0, 0, 1, 1,
1.733006, 0.9100437, 1.487623, 0, 0, 0, 1, 1,
1.739374, 2.005665, 0.5322492, 0, 0, 0, 1, 1,
1.742097, 1.917389, 1.924672, 1, 1, 1, 1, 1,
1.767823, -2.020994, 2.713485, 1, 1, 1, 1, 1,
1.785452, -1.221531, 1.95891, 1, 1, 1, 1, 1,
1.792203, -0.3838229, 2.049449, 1, 1, 1, 1, 1,
1.800833, -1.327369, 2.3753, 1, 1, 1, 1, 1,
1.819177, 1.379945, 0.6489068, 1, 1, 1, 1, 1,
1.831698, 0.9702679, -0.3255713, 1, 1, 1, 1, 1,
1.847823, -1.182077, 1.827775, 1, 1, 1, 1, 1,
1.887834, 0.940839, 0.7496502, 1, 1, 1, 1, 1,
1.913825, 0.4718937, 1.177761, 1, 1, 1, 1, 1,
1.949126, -0.1763202, 3.654937, 1, 1, 1, 1, 1,
1.9808, -0.02017483, 0.5350203, 1, 1, 1, 1, 1,
2.002673, 0.724839, 2.765149, 1, 1, 1, 1, 1,
2.016464, -1.236331, 2.899201, 1, 1, 1, 1, 1,
2.027966, 0.5138654, 2.475494, 1, 1, 1, 1, 1,
2.029173, -2.286131, 2.51313, 0, 0, 1, 1, 1,
2.030818, 1.705429, 2.346772, 1, 0, 0, 1, 1,
2.031312, 1.712993, 2.137877, 1, 0, 0, 1, 1,
2.113765, -0.02851252, 1.818281, 1, 0, 0, 1, 1,
2.123165, 0.03879067, 1.864385, 1, 0, 0, 1, 1,
2.136743, -0.365775, 3.227323, 1, 0, 0, 1, 1,
2.146555, 0.592719, 1.11712, 0, 0, 0, 1, 1,
2.150692, 0.6594297, 2.182081, 0, 0, 0, 1, 1,
2.156697, 0.296548, 2.295725, 0, 0, 0, 1, 1,
2.18814, 1.235763, 0.4906024, 0, 0, 0, 1, 1,
2.20809, 0.5024289, 1.234385, 0, 0, 0, 1, 1,
2.344517, -0.1426063, 1.132456, 0, 0, 0, 1, 1,
2.34645, 1.425159, 1.867935, 0, 0, 0, 1, 1,
2.369603, -0.4737378, 3.551221, 1, 1, 1, 1, 1,
2.454499, 0.1763618, 1.70755, 1, 1, 1, 1, 1,
2.475945, -1.014973, 0.2033376, 1, 1, 1, 1, 1,
2.594787, 0.07022623, 1.170903, 1, 1, 1, 1, 1,
2.603483, -0.3154114, 1.946473, 1, 1, 1, 1, 1,
2.641053, -1.642366, 0.9668242, 1, 1, 1, 1, 1,
2.835643, 1.235213, 1.361915, 1, 1, 1, 1, 1
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
var radius = 10.27386;
var distance = 36.08651;
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
mvMatrix.translate( 0.3090814, 0.1130412, -0.3287578 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.08651);
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
