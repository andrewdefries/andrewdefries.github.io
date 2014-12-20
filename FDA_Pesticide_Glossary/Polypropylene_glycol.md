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
-2.9332, 0.1212767, -0.3608856, 1, 0, 0, 1,
-2.927573, 0.366248, -1.311046, 1, 0.007843138, 0, 1,
-2.820154, -1.282778, -1.628518, 1, 0.01176471, 0, 1,
-2.782539, 2.436564, -0.5250269, 1, 0.01960784, 0, 1,
-2.766458, -1.195664, -1.317762, 1, 0.02352941, 0, 1,
-2.696191, 0.05253337, -1.588541, 1, 0.03137255, 0, 1,
-2.670378, 0.5223091, -1.864949, 1, 0.03529412, 0, 1,
-2.642122, -2.1277, -2.179329, 1, 0.04313726, 0, 1,
-2.625022, 0.05411592, -2.466988, 1, 0.04705882, 0, 1,
-2.593553, 0.1532915, -2.28882, 1, 0.05490196, 0, 1,
-2.479981, 1.062985, -2.465354, 1, 0.05882353, 0, 1,
-2.466271, 0.0241744, -1.416807, 1, 0.06666667, 0, 1,
-2.375363, 0.6924334, -1.193619, 1, 0.07058824, 0, 1,
-2.286836, 2.812714, -0.1969052, 1, 0.07843138, 0, 1,
-2.204735, -0.8582741, -1.540878, 1, 0.08235294, 0, 1,
-2.196072, 3.376678, -0.4393023, 1, 0.09019608, 0, 1,
-2.193493, 0.1832073, -1.085106, 1, 0.09411765, 0, 1,
-2.190624, 0.2783789, -2.143856, 1, 0.1019608, 0, 1,
-2.144769, 0.5766929, -1.283643, 1, 0.1098039, 0, 1,
-2.127431, 0.9076007, -1.477155, 1, 0.1137255, 0, 1,
-2.086566, 0.4464861, -3.492214, 1, 0.1215686, 0, 1,
-2.053716, 0.262238, -3.307423, 1, 0.1254902, 0, 1,
-1.999734, -0.4197092, -2.653391, 1, 0.1333333, 0, 1,
-1.981725, -1.792327, -4.033811, 1, 0.1372549, 0, 1,
-1.980897, 0.8708635, 0.07590672, 1, 0.145098, 0, 1,
-1.97014, 1.282485, -0.5023347, 1, 0.1490196, 0, 1,
-1.955322, 1.417214, -2.465726, 1, 0.1568628, 0, 1,
-1.953767, -1.226372, -1.944091, 1, 0.1607843, 0, 1,
-1.920381, 0.1986177, -2.590023, 1, 0.1686275, 0, 1,
-1.913741, 0.5277528, -0.9922919, 1, 0.172549, 0, 1,
-1.87425, -1.14286, 0.1061215, 1, 0.1803922, 0, 1,
-1.860467, 1.086807, -0.9735307, 1, 0.1843137, 0, 1,
-1.829647, -1.207971, -0.02057081, 1, 0.1921569, 0, 1,
-1.823932, 0.9279579, -1.141502, 1, 0.1960784, 0, 1,
-1.821465, -0.8598461, -3.766641, 1, 0.2039216, 0, 1,
-1.806947, -0.05602309, -2.108804, 1, 0.2117647, 0, 1,
-1.794669, 0.5480095, -1.443121, 1, 0.2156863, 0, 1,
-1.790646, -0.2919894, -0.815586, 1, 0.2235294, 0, 1,
-1.768838, 0.08318498, -1.349882, 1, 0.227451, 0, 1,
-1.767408, -1.023083, -1.93908, 1, 0.2352941, 0, 1,
-1.76623, -0.813472, -1.797544, 1, 0.2392157, 0, 1,
-1.751409, 0.000571437, -1.286954, 1, 0.2470588, 0, 1,
-1.747166, -1.484313, -3.07594, 1, 0.2509804, 0, 1,
-1.736935, -0.05313905, -0.8589404, 1, 0.2588235, 0, 1,
-1.730728, 1.754699, -1.718056, 1, 0.2627451, 0, 1,
-1.728688, -2.203069, -2.418734, 1, 0.2705882, 0, 1,
-1.727809, -1.897839, -2.039121, 1, 0.2745098, 0, 1,
-1.725893, -2.047126, -1.699018, 1, 0.282353, 0, 1,
-1.71611, -0.9584243, -1.732982, 1, 0.2862745, 0, 1,
-1.711986, -1.372877, -2.05369, 1, 0.2941177, 0, 1,
-1.700722, -0.2321297, -3.041179, 1, 0.3019608, 0, 1,
-1.677859, -1.505812, -3.600221, 1, 0.3058824, 0, 1,
-1.666831, 0.2230982, 0.03278373, 1, 0.3137255, 0, 1,
-1.65816, -0.2763104, -0.3389093, 1, 0.3176471, 0, 1,
-1.658118, 0.03462586, -0.1079292, 1, 0.3254902, 0, 1,
-1.657127, -0.896176, -1.768788, 1, 0.3294118, 0, 1,
-1.651268, 0.7135817, -0.3710051, 1, 0.3372549, 0, 1,
-1.647563, 0.5085829, -1.025485, 1, 0.3411765, 0, 1,
-1.624327, 1.482911, -0.238744, 1, 0.3490196, 0, 1,
-1.622708, -0.08952501, -0.2254232, 1, 0.3529412, 0, 1,
-1.603054, 0.844951, -2.736048, 1, 0.3607843, 0, 1,
-1.5858, 1.413006, -0.2452593, 1, 0.3647059, 0, 1,
-1.583899, 1.817456, -0.374561, 1, 0.372549, 0, 1,
-1.551366, 1.673431, -0.3108091, 1, 0.3764706, 0, 1,
-1.548911, 0.5653842, -1.067785, 1, 0.3843137, 0, 1,
-1.548343, -0.1834451, -0.1380303, 1, 0.3882353, 0, 1,
-1.531049, 0.6817566, -3.24923, 1, 0.3960784, 0, 1,
-1.523404, 0.06500974, -2.656317, 1, 0.4039216, 0, 1,
-1.494087, 0.4568495, -1.77921, 1, 0.4078431, 0, 1,
-1.471661, 1.125419, -2.472415, 1, 0.4156863, 0, 1,
-1.464968, -0.6977736, -0.8971524, 1, 0.4196078, 0, 1,
-1.464945, 1.621837, 0.416384, 1, 0.427451, 0, 1,
-1.463069, -1.040188, -1.715188, 1, 0.4313726, 0, 1,
-1.462907, 0.9806107, -1.617485, 1, 0.4392157, 0, 1,
-1.462745, -0.4869755, -0.9491735, 1, 0.4431373, 0, 1,
-1.448671, -1.366472, -3.056949, 1, 0.4509804, 0, 1,
-1.447759, 0.581126, -2.223902, 1, 0.454902, 0, 1,
-1.445632, 1.331918, -0.9786928, 1, 0.4627451, 0, 1,
-1.443995, -0.2233832, -3.376898, 1, 0.4666667, 0, 1,
-1.435375, 0.3926046, -2.004321, 1, 0.4745098, 0, 1,
-1.40134, -1.590667, -2.862721, 1, 0.4784314, 0, 1,
-1.389765, 0.7891321, -1.919018, 1, 0.4862745, 0, 1,
-1.384564, -0.2576314, -0.8133112, 1, 0.4901961, 0, 1,
-1.378092, -0.4141703, -3.687537, 1, 0.4980392, 0, 1,
-1.373847, 2.353305, -0.9949965, 1, 0.5058824, 0, 1,
-1.36954, 0.4680457, -1.911505, 1, 0.509804, 0, 1,
-1.368722, 0.1654177, -0.09915362, 1, 0.5176471, 0, 1,
-1.365831, -1.904173, -2.738459, 1, 0.5215687, 0, 1,
-1.358576, -1.263408, -0.3433922, 1, 0.5294118, 0, 1,
-1.354165, 0.2833028, -2.474495, 1, 0.5333334, 0, 1,
-1.347715, -0.5631132, -2.867538, 1, 0.5411765, 0, 1,
-1.338385, 1.408729, 0.3205299, 1, 0.5450981, 0, 1,
-1.336226, 0.6878879, -0.8810425, 1, 0.5529412, 0, 1,
-1.323489, -0.4531458, -1.840711, 1, 0.5568628, 0, 1,
-1.315964, -0.4077246, -2.637421, 1, 0.5647059, 0, 1,
-1.314569, -2.196646, -2.07772, 1, 0.5686275, 0, 1,
-1.310547, 1.606243, 0.3383054, 1, 0.5764706, 0, 1,
-1.307295, 0.5341467, -1.853988, 1, 0.5803922, 0, 1,
-1.305014, 2.053879, -1.512626, 1, 0.5882353, 0, 1,
-1.304341, 0.0142843, -3.799155, 1, 0.5921569, 0, 1,
-1.279507, 0.3341402, 2.03679, 1, 0.6, 0, 1,
-1.273931, -2.042789, -3.005329, 1, 0.6078432, 0, 1,
-1.272217, -1.756052, -3.632768, 1, 0.6117647, 0, 1,
-1.263034, 0.5333734, -1.26824, 1, 0.6196079, 0, 1,
-1.262561, 0.7338958, -0.3789176, 1, 0.6235294, 0, 1,
-1.258289, 1.03791, 0.1563366, 1, 0.6313726, 0, 1,
-1.252167, 0.118175, -1.088477, 1, 0.6352941, 0, 1,
-1.24556, -1.69974, -2.05332, 1, 0.6431373, 0, 1,
-1.237869, 1.195063, -0.6439474, 1, 0.6470588, 0, 1,
-1.228717, -0.3850971, -2.658942, 1, 0.654902, 0, 1,
-1.200368, -0.8214815, -1.76272, 1, 0.6588235, 0, 1,
-1.194268, -0.468904, -1.911562, 1, 0.6666667, 0, 1,
-1.186732, 0.3144187, -3.822245, 1, 0.6705883, 0, 1,
-1.148611, 1.879793, -1.809782, 1, 0.6784314, 0, 1,
-1.146791, 0.2575915, -0.9815378, 1, 0.682353, 0, 1,
-1.140253, 0.3059278, -0.7979546, 1, 0.6901961, 0, 1,
-1.138605, 1.281903, -1.410166, 1, 0.6941177, 0, 1,
-1.135509, -0.8598389, -2.185096, 1, 0.7019608, 0, 1,
-1.135493, -1.325164, -2.598135, 1, 0.7098039, 0, 1,
-1.132107, 2.045506, -1.483296, 1, 0.7137255, 0, 1,
-1.130946, 0.9700218, -2.396834, 1, 0.7215686, 0, 1,
-1.130523, 0.8052897, -0.09044833, 1, 0.7254902, 0, 1,
-1.127637, -1.757917, -3.083102, 1, 0.7333333, 0, 1,
-1.127412, -0.8382711, -2.897698, 1, 0.7372549, 0, 1,
-1.118153, -0.286037, -2.468326, 1, 0.7450981, 0, 1,
-1.11633, 0.8263617, -2.236202, 1, 0.7490196, 0, 1,
-1.114164, -0.957501, -3.910759, 1, 0.7568628, 0, 1,
-1.108922, 0.9887452, -1.791265, 1, 0.7607843, 0, 1,
-1.108495, -0.6616725, -1.212894, 1, 0.7686275, 0, 1,
-1.105453, 0.4811608, 0.2692968, 1, 0.772549, 0, 1,
-1.100504, -0.009521389, -1.886618, 1, 0.7803922, 0, 1,
-1.100076, 0.9590233, -1.176342, 1, 0.7843137, 0, 1,
-1.099378, 0.5162259, -0.6213192, 1, 0.7921569, 0, 1,
-1.098907, 0.2237089, -2.629187, 1, 0.7960784, 0, 1,
-1.096866, -2.178317, -3.338937, 1, 0.8039216, 0, 1,
-1.088075, -1.159525, -2.836411, 1, 0.8117647, 0, 1,
-1.079721, 0.501605, -2.46921, 1, 0.8156863, 0, 1,
-1.078769, -0.07101375, -1.896536, 1, 0.8235294, 0, 1,
-1.074217, -1.64798, -2.881387, 1, 0.827451, 0, 1,
-1.05658, -0.152761, -2.332398, 1, 0.8352941, 0, 1,
-1.055713, 0.2772409, 0.08029398, 1, 0.8392157, 0, 1,
-1.053901, -0.3046418, -2.447352, 1, 0.8470588, 0, 1,
-1.049974, 1.342384, -1.311361, 1, 0.8509804, 0, 1,
-1.042209, 0.08915232, -2.561177, 1, 0.8588235, 0, 1,
-1.040551, -0.475147, -4.325582, 1, 0.8627451, 0, 1,
-1.038248, 0.2106605, -3.194395, 1, 0.8705882, 0, 1,
-1.033844, 0.2315282, -0.6969857, 1, 0.8745098, 0, 1,
-1.033734, -0.1311682, -0.2731156, 1, 0.8823529, 0, 1,
-1.028792, 0.171494, -0.4765343, 1, 0.8862745, 0, 1,
-1.028734, -0.487423, -2.704092, 1, 0.8941177, 0, 1,
-1.028284, -0.4733958, -1.559332, 1, 0.8980392, 0, 1,
-1.026869, 0.6176451, -0.5593111, 1, 0.9058824, 0, 1,
-1.024879, 1.264001, -1.080174, 1, 0.9137255, 0, 1,
-1.022612, -0.2313584, -1.979532, 1, 0.9176471, 0, 1,
-1.010646, -1.207085, -1.052908, 1, 0.9254902, 0, 1,
-1.010114, -0.8274482, -0.9574239, 1, 0.9294118, 0, 1,
-1.008364, 2.855661, -2.934508, 1, 0.9372549, 0, 1,
-1.00552, -1.911381, -1.597005, 1, 0.9411765, 0, 1,
-1.005352, -0.1360974, -1.067108, 1, 0.9490196, 0, 1,
-1.004601, 1.096386, -0.02343324, 1, 0.9529412, 0, 1,
-0.9918088, -0.725651, -3.522976, 1, 0.9607843, 0, 1,
-0.9869072, -0.8265923, -2.819688, 1, 0.9647059, 0, 1,
-0.98678, 0.5701333, -2.53436, 1, 0.972549, 0, 1,
-0.9829163, -0.3930721, -3.419179, 1, 0.9764706, 0, 1,
-0.9664957, 1.094258, -1.418643, 1, 0.9843137, 0, 1,
-0.9660721, -0.6998188, -2.235547, 1, 0.9882353, 0, 1,
-0.9613639, -1.846355, -2.360101, 1, 0.9960784, 0, 1,
-0.9592015, -1.092425, -0.8120778, 0.9960784, 1, 0, 1,
-0.9571491, 0.1124963, -1.225148, 0.9921569, 1, 0, 1,
-0.9455943, 0.5218772, -1.628871, 0.9843137, 1, 0, 1,
-0.9451666, 1.57497, -0.5258868, 0.9803922, 1, 0, 1,
-0.9428843, -0.02771227, -1.489172, 0.972549, 1, 0, 1,
-0.9355616, -0.6491959, -2.179214, 0.9686275, 1, 0, 1,
-0.934824, 1.181341, -2.160048, 0.9607843, 1, 0, 1,
-0.9346966, -0.8811527, -1.337101, 0.9568627, 1, 0, 1,
-0.9314338, 0.775144, -0.7822086, 0.9490196, 1, 0, 1,
-0.9286095, 0.3882137, -1.011879, 0.945098, 1, 0, 1,
-0.9215198, 0.1516727, -1.799772, 0.9372549, 1, 0, 1,
-0.9192104, 0.1313781, -0.6398912, 0.9333333, 1, 0, 1,
-0.9171881, -0.3905805, -0.4635451, 0.9254902, 1, 0, 1,
-0.9157045, -0.1544114, -2.369831, 0.9215686, 1, 0, 1,
-0.9144349, 0.6340928, -1.712138, 0.9137255, 1, 0, 1,
-0.9076456, -0.2083801, -2.545702, 0.9098039, 1, 0, 1,
-0.9041025, 0.4728544, -1.233288, 0.9019608, 1, 0, 1,
-0.90177, 1.728333, -0.1738177, 0.8941177, 1, 0, 1,
-0.8863242, 0.2487694, -3.578497, 0.8901961, 1, 0, 1,
-0.8855392, -0.6918252, -2.107971, 0.8823529, 1, 0, 1,
-0.8837804, -0.7191061, -1.965792, 0.8784314, 1, 0, 1,
-0.8834127, -0.573996, -1.651509, 0.8705882, 1, 0, 1,
-0.8784466, 0.04536409, -2.075706, 0.8666667, 1, 0, 1,
-0.8781399, 0.1814509, -0.4768299, 0.8588235, 1, 0, 1,
-0.8454283, -0.1100524, -0.9529319, 0.854902, 1, 0, 1,
-0.8442098, -0.552429, -3.837449, 0.8470588, 1, 0, 1,
-0.8369452, 0.0878322, -1.379565, 0.8431373, 1, 0, 1,
-0.8360742, -0.33566, -1.3188, 0.8352941, 1, 0, 1,
-0.8339912, 0.6855259, -0.2457769, 0.8313726, 1, 0, 1,
-0.8326338, 1.663081, -0.5396288, 0.8235294, 1, 0, 1,
-0.8301828, 0.5846205, -2.717342, 0.8196079, 1, 0, 1,
-0.8257879, -1.249958, -3.193236, 0.8117647, 1, 0, 1,
-0.8226744, -0.1609142, -1.406271, 0.8078431, 1, 0, 1,
-0.8209159, -0.8175421, 0.6226043, 0.8, 1, 0, 1,
-0.8138786, 0.8419036, 0.9839898, 0.7921569, 1, 0, 1,
-0.812596, 0.9996276, -1.80397, 0.7882353, 1, 0, 1,
-0.8066204, -0.05254457, -2.646661, 0.7803922, 1, 0, 1,
-0.7960114, 1.254159, -0.1535328, 0.7764706, 1, 0, 1,
-0.7955869, 1.123262, -1.369099, 0.7686275, 1, 0, 1,
-0.7948393, -0.6423477, -1.719247, 0.7647059, 1, 0, 1,
-0.7920395, 0.2619716, -2.069748, 0.7568628, 1, 0, 1,
-0.7857015, -0.02812405, -2.004436, 0.7529412, 1, 0, 1,
-0.7852802, -0.3157812, -3.85868, 0.7450981, 1, 0, 1,
-0.7852709, 1.518601, 0.04219629, 0.7411765, 1, 0, 1,
-0.7802975, 0.4498246, -2.347426, 0.7333333, 1, 0, 1,
-0.7782755, -0.5296127, -1.597326, 0.7294118, 1, 0, 1,
-0.7738801, -0.3303479, -2.223368, 0.7215686, 1, 0, 1,
-0.7735105, -1.276596, -3.913945, 0.7176471, 1, 0, 1,
-0.7729611, -0.1630418, -2.391265, 0.7098039, 1, 0, 1,
-0.7721465, -0.8188271, -1.319741, 0.7058824, 1, 0, 1,
-0.7718551, -0.1691466, -0.5497444, 0.6980392, 1, 0, 1,
-0.7692015, -0.3334158, -3.113803, 0.6901961, 1, 0, 1,
-0.7670681, 0.6743193, -1.283923, 0.6862745, 1, 0, 1,
-0.7631894, 0.04522714, -1.379637, 0.6784314, 1, 0, 1,
-0.7522774, 0.3935788, -0.6336458, 0.6745098, 1, 0, 1,
-0.7345753, -0.76017, -1.888181, 0.6666667, 1, 0, 1,
-0.7337984, 1.030001, 0.1312426, 0.6627451, 1, 0, 1,
-0.7284858, 0.08207195, -2.560835, 0.654902, 1, 0, 1,
-0.7252149, -0.3039928, -1.89595, 0.6509804, 1, 0, 1,
-0.7227495, 1.354856, -1.92274, 0.6431373, 1, 0, 1,
-0.7158231, 0.8398467, -2.131069, 0.6392157, 1, 0, 1,
-0.7149144, -0.812752, -2.447258, 0.6313726, 1, 0, 1,
-0.710839, 1.203419, -0.9167789, 0.627451, 1, 0, 1,
-0.7102215, -0.7074288, -3.808753, 0.6196079, 1, 0, 1,
-0.7089673, 0.065556, -0.8916793, 0.6156863, 1, 0, 1,
-0.7059681, -0.06563087, -1.33378, 0.6078432, 1, 0, 1,
-0.7028104, -2.119376, -2.506614, 0.6039216, 1, 0, 1,
-0.7012489, 0.9518888, -1.197773, 0.5960785, 1, 0, 1,
-0.7000427, -0.498826, -2.532063, 0.5882353, 1, 0, 1,
-0.6999005, -0.07752007, 0.1347869, 0.5843138, 1, 0, 1,
-0.6998768, -2.354639, -2.042015, 0.5764706, 1, 0, 1,
-0.6980048, 0.695475, -1.043929, 0.572549, 1, 0, 1,
-0.695957, -0.9947318, -2.869539, 0.5647059, 1, 0, 1,
-0.6917881, 1.268631, -1.298984, 0.5607843, 1, 0, 1,
-0.6901249, -0.4169143, -2.258377, 0.5529412, 1, 0, 1,
-0.688059, 1.534489, -0.3430844, 0.5490196, 1, 0, 1,
-0.6877388, -0.9164071, -2.851162, 0.5411765, 1, 0, 1,
-0.6849925, -1.020579, -3.610919, 0.5372549, 1, 0, 1,
-0.6823418, 0.4319601, -1.838575, 0.5294118, 1, 0, 1,
-0.6774923, 0.2043259, -3.015322, 0.5254902, 1, 0, 1,
-0.675498, 0.3150081, -1.282099, 0.5176471, 1, 0, 1,
-0.6745968, -2.624464, -1.843141, 0.5137255, 1, 0, 1,
-0.6726256, -0.9513739, -3.616836, 0.5058824, 1, 0, 1,
-0.6694385, -0.707451, -0.8078938, 0.5019608, 1, 0, 1,
-0.6654831, 1.142806, -1.172143, 0.4941176, 1, 0, 1,
-0.6573905, 1.210707, -0.3852477, 0.4862745, 1, 0, 1,
-0.6542361, -0.6257047, -2.771149, 0.4823529, 1, 0, 1,
-0.6515607, 1.53618, -0.05052965, 0.4745098, 1, 0, 1,
-0.6502874, 0.5874303, -1.467289, 0.4705882, 1, 0, 1,
-0.6458647, 0.03962204, -1.161908, 0.4627451, 1, 0, 1,
-0.6410319, 0.3146551, -0.5769399, 0.4588235, 1, 0, 1,
-0.6379545, -0.5919792, -0.4373133, 0.4509804, 1, 0, 1,
-0.6369922, 0.8304886, -0.2740202, 0.4470588, 1, 0, 1,
-0.6307883, -1.026442, -2.901151, 0.4392157, 1, 0, 1,
-0.6272722, 0.5394977, 0.02452078, 0.4352941, 1, 0, 1,
-0.6238187, 0.3103268, 0.623616, 0.427451, 1, 0, 1,
-0.6139579, 0.06175827, -1.728964, 0.4235294, 1, 0, 1,
-0.6127779, 0.3712342, -2.586985, 0.4156863, 1, 0, 1,
-0.6126539, -0.4304566, -0.8539619, 0.4117647, 1, 0, 1,
-0.6082506, -0.2224443, -1.828586, 0.4039216, 1, 0, 1,
-0.6071002, -0.4049513, -1.912951, 0.3960784, 1, 0, 1,
-0.6069502, 1.483454, 0.8418068, 0.3921569, 1, 0, 1,
-0.6068518, -0.8254138, -2.529895, 0.3843137, 1, 0, 1,
-0.6067078, 0.5967466, -0.6042027, 0.3803922, 1, 0, 1,
-0.6065042, 0.6397757, -0.4348223, 0.372549, 1, 0, 1,
-0.606469, -0.3404464, -1.423687, 0.3686275, 1, 0, 1,
-0.6051396, 0.02785998, -0.6469176, 0.3607843, 1, 0, 1,
-0.6038112, -1.720025, -2.376172, 0.3568628, 1, 0, 1,
-0.6004909, 1.130371, -0.1176361, 0.3490196, 1, 0, 1,
-0.5951693, -0.427538, -2.694168, 0.345098, 1, 0, 1,
-0.5936909, 0.6601055, -0.399952, 0.3372549, 1, 0, 1,
-0.593657, 1.05461, 0.3414261, 0.3333333, 1, 0, 1,
-0.5865272, -0.1757465, -2.892421, 0.3254902, 1, 0, 1,
-0.5861619, 0.3789249, -1.717303, 0.3215686, 1, 0, 1,
-0.5785629, 0.2493272, -1.958672, 0.3137255, 1, 0, 1,
-0.5712618, 0.4238274, -2.0267, 0.3098039, 1, 0, 1,
-0.5671992, 0.956344, -0.3287924, 0.3019608, 1, 0, 1,
-0.5604811, 0.557409, -0.3879822, 0.2941177, 1, 0, 1,
-0.560046, -0.8044032, -3.462359, 0.2901961, 1, 0, 1,
-0.5542886, -0.5730701, -1.191908, 0.282353, 1, 0, 1,
-0.5532922, 0.2708335, -2.139535, 0.2784314, 1, 0, 1,
-0.5503656, -0.2299107, -2.769112, 0.2705882, 1, 0, 1,
-0.5478737, 0.3122759, -1.278914, 0.2666667, 1, 0, 1,
-0.5468183, -1.252403, -2.900261, 0.2588235, 1, 0, 1,
-0.5440198, -0.01366588, -1.137592, 0.254902, 1, 0, 1,
-0.5338602, -0.02879407, -2.427858, 0.2470588, 1, 0, 1,
-0.5317557, 0.5534203, -1.541711, 0.2431373, 1, 0, 1,
-0.5230086, 0.7961743, 0.2967412, 0.2352941, 1, 0, 1,
-0.5228178, 0.2832955, 0.3915108, 0.2313726, 1, 0, 1,
-0.5219976, -0.4742622, -1.16651, 0.2235294, 1, 0, 1,
-0.5188468, 0.6243999, -0.2904578, 0.2196078, 1, 0, 1,
-0.5181764, -0.5963693, -3.717121, 0.2117647, 1, 0, 1,
-0.5179428, -3.176713, -3.307356, 0.2078431, 1, 0, 1,
-0.5107197, 0.05396334, -3.098882, 0.2, 1, 0, 1,
-0.5071622, 0.6934565, 0.8747364, 0.1921569, 1, 0, 1,
-0.5056175, -0.08832601, -2.327573, 0.1882353, 1, 0, 1,
-0.5047364, 1.072496, 1.855092, 0.1803922, 1, 0, 1,
-0.4999153, 0.7342864, 1.219383, 0.1764706, 1, 0, 1,
-0.4973902, -0.2937877, -2.820919, 0.1686275, 1, 0, 1,
-0.4932638, -1.653523, -2.460815, 0.1647059, 1, 0, 1,
-0.483675, -0.5977563, -2.127342, 0.1568628, 1, 0, 1,
-0.4797257, 0.03115207, 0.4003404, 0.1529412, 1, 0, 1,
-0.4780823, 0.2502531, -1.278135, 0.145098, 1, 0, 1,
-0.4750162, -0.02982697, -3.372528, 0.1411765, 1, 0, 1,
-0.47315, 0.5115845, -1.612515, 0.1333333, 1, 0, 1,
-0.4671867, -0.4021608, -0.8350057, 0.1294118, 1, 0, 1,
-0.4617846, -1.141489, -2.252073, 0.1215686, 1, 0, 1,
-0.4594149, -0.5587433, -3.006677, 0.1176471, 1, 0, 1,
-0.4593891, 0.3414415, -0.9623297, 0.1098039, 1, 0, 1,
-0.4577703, 1.480008, -3.459568, 0.1058824, 1, 0, 1,
-0.4576113, -0.9486484, -2.573793, 0.09803922, 1, 0, 1,
-0.4571226, -2.092534, -3.723305, 0.09019608, 1, 0, 1,
-0.4545221, 0.01587774, -2.575346, 0.08627451, 1, 0, 1,
-0.4538811, -2.079737, -3.474284, 0.07843138, 1, 0, 1,
-0.4538744, -0.8685335, -3.033524, 0.07450981, 1, 0, 1,
-0.4506293, -0.5396746, -2.74839, 0.06666667, 1, 0, 1,
-0.4502223, 0.6620406, -1.062956, 0.0627451, 1, 0, 1,
-0.4489094, -0.959009, -3.3582, 0.05490196, 1, 0, 1,
-0.4460482, 0.556267, -1.093216, 0.05098039, 1, 0, 1,
-0.4407214, 0.5693843, -1.880452, 0.04313726, 1, 0, 1,
-0.4402461, 2.735753, -0.8963793, 0.03921569, 1, 0, 1,
-0.4395726, 0.1408491, -0.216859, 0.03137255, 1, 0, 1,
-0.4332796, -0.0494803, -2.575948, 0.02745098, 1, 0, 1,
-0.4329297, -0.7513791, -1.383755, 0.01960784, 1, 0, 1,
-0.4310066, 0.3426884, -1.416066, 0.01568628, 1, 0, 1,
-0.4173434, 0.2129924, -0.7151426, 0.007843138, 1, 0, 1,
-0.4172826, 0.3056441, 0.07808756, 0.003921569, 1, 0, 1,
-0.4125325, -1.472262, -0.5767956, 0, 1, 0.003921569, 1,
-0.4047253, 0.5678462, -1.303532, 0, 1, 0.01176471, 1,
-0.4043328, -1.004112, -2.564887, 0, 1, 0.01568628, 1,
-0.4040233, 0.1012903, 0.9562658, 0, 1, 0.02352941, 1,
-0.4027908, 0.3237326, -0.7844911, 0, 1, 0.02745098, 1,
-0.4006596, 2.713332, -0.2674209, 0, 1, 0.03529412, 1,
-0.4006039, -1.003245, -4.092962, 0, 1, 0.03921569, 1,
-0.4003437, 0.346516, -0.01915757, 0, 1, 0.04705882, 1,
-0.4000162, -1.152525, -1.472964, 0, 1, 0.05098039, 1,
-0.3989963, -0.02569997, -0.9367334, 0, 1, 0.05882353, 1,
-0.3963086, -0.5074409, -3.244331, 0, 1, 0.0627451, 1,
-0.3952256, -0.6282126, -2.341451, 0, 1, 0.07058824, 1,
-0.3948973, -0.8653562, -1.173265, 0, 1, 0.07450981, 1,
-0.3936457, 0.5630439, -2.136589, 0, 1, 0.08235294, 1,
-0.3921601, 0.6693249, -1.238051, 0, 1, 0.08627451, 1,
-0.3847786, -0.1862074, -1.726641, 0, 1, 0.09411765, 1,
-0.3846659, -0.9331332, -3.041006, 0, 1, 0.1019608, 1,
-0.3831536, -1.593044, -2.709071, 0, 1, 0.1058824, 1,
-0.3830514, -0.7984852, -4.38892, 0, 1, 0.1137255, 1,
-0.3809275, -0.1466395, -3.040934, 0, 1, 0.1176471, 1,
-0.379249, 0.04452363, -1.808992, 0, 1, 0.1254902, 1,
-0.3791693, -0.8942682, -3.816071, 0, 1, 0.1294118, 1,
-0.3786502, 0.4424513, -0.4912413, 0, 1, 0.1372549, 1,
-0.3768796, -0.9151371, -1.775233, 0, 1, 0.1411765, 1,
-0.3730898, 1.757433, -0.976152, 0, 1, 0.1490196, 1,
-0.3719245, 0.8970871, 0.5709461, 0, 1, 0.1529412, 1,
-0.3710071, -0.4690193, -3.415854, 0, 1, 0.1607843, 1,
-0.3686079, 1.169141, 1.527377, 0, 1, 0.1647059, 1,
-0.3677288, -0.2844426, -2.938588, 0, 1, 0.172549, 1,
-0.3651982, 0.5812516, -0.2585452, 0, 1, 0.1764706, 1,
-0.3618782, 1.309689, 0.3105176, 0, 1, 0.1843137, 1,
-0.3583231, 0.8488486, -1.67467, 0, 1, 0.1882353, 1,
-0.3579451, -0.1212798, -2.105995, 0, 1, 0.1960784, 1,
-0.3533345, 0.05039392, -1.287984, 0, 1, 0.2039216, 1,
-0.3465792, -0.7600579, -2.690585, 0, 1, 0.2078431, 1,
-0.3435833, 1.635606, 0.15266, 0, 1, 0.2156863, 1,
-0.3426271, -0.947676, -2.033904, 0, 1, 0.2196078, 1,
-0.3401346, -1.548904, -4.314074, 0, 1, 0.227451, 1,
-0.339154, -2.223976, -3.955611, 0, 1, 0.2313726, 1,
-0.3354855, -1.710034, -1.507174, 0, 1, 0.2392157, 1,
-0.3325268, 0.058438, -1.197185, 0, 1, 0.2431373, 1,
-0.3323839, -0.106538, -2.099143, 0, 1, 0.2509804, 1,
-0.3308077, -0.8749279, -2.231633, 0, 1, 0.254902, 1,
-0.3273836, 0.3252286, -1.825006, 0, 1, 0.2627451, 1,
-0.326259, -1.577186, -1.246811, 0, 1, 0.2666667, 1,
-0.3233874, 0.7453438, 0.2644916, 0, 1, 0.2745098, 1,
-0.3214958, -0.5026213, -3.461703, 0, 1, 0.2784314, 1,
-0.3180463, 1.004849, -0.6456373, 0, 1, 0.2862745, 1,
-0.3178328, -0.4967078, -1.925597, 0, 1, 0.2901961, 1,
-0.3171865, 1.084162, -0.267334, 0, 1, 0.2980392, 1,
-0.3155799, -0.8783712, -2.735298, 0, 1, 0.3058824, 1,
-0.3149491, -1.0556, -3.023444, 0, 1, 0.3098039, 1,
-0.3069284, 0.1208581, -1.5389, 0, 1, 0.3176471, 1,
-0.3064656, 0.5668429, 0.7148001, 0, 1, 0.3215686, 1,
-0.2923709, 1.21706, 0.9748448, 0, 1, 0.3294118, 1,
-0.291395, 0.09213074, -1.314856, 0, 1, 0.3333333, 1,
-0.2901912, 0.8983983, 1.390794, 0, 1, 0.3411765, 1,
-0.2896279, -0.9065976, -3.275547, 0, 1, 0.345098, 1,
-0.2894252, -1.639127, -2.718283, 0, 1, 0.3529412, 1,
-0.2705485, -0.6830123, -2.726091, 0, 1, 0.3568628, 1,
-0.264115, -0.4627816, -3.786667, 0, 1, 0.3647059, 1,
-0.2629613, 1.785568, -0.7958775, 0, 1, 0.3686275, 1,
-0.2609951, 1.211048, 0.9048747, 0, 1, 0.3764706, 1,
-0.2598687, 1.21413, -0.09060477, 0, 1, 0.3803922, 1,
-0.2525583, -0.504143, -4.283053, 0, 1, 0.3882353, 1,
-0.251946, -0.05831218, -2.603472, 0, 1, 0.3921569, 1,
-0.2510189, -1.252495, -2.024821, 0, 1, 0.4, 1,
-0.2441083, 0.7667691, 0.647541, 0, 1, 0.4078431, 1,
-0.2422202, 0.9786885, -0.7374744, 0, 1, 0.4117647, 1,
-0.2400329, -0.7435915, -1.489821, 0, 1, 0.4196078, 1,
-0.2352237, -0.6803931, -3.500073, 0, 1, 0.4235294, 1,
-0.2326917, 0.5241228, 0.3532283, 0, 1, 0.4313726, 1,
-0.2279864, -1.394471, -3.283406, 0, 1, 0.4352941, 1,
-0.2278591, 1.20109, -0.03030386, 0, 1, 0.4431373, 1,
-0.2275725, -0.04822022, -1.254081, 0, 1, 0.4470588, 1,
-0.2264562, -0.1478314, -1.511595, 0, 1, 0.454902, 1,
-0.2213214, -0.04199524, -2.683967, 0, 1, 0.4588235, 1,
-0.2208065, -1.323399, -2.722077, 0, 1, 0.4666667, 1,
-0.2206156, -0.6567277, -2.225263, 0, 1, 0.4705882, 1,
-0.2111528, -0.1154288, -2.058985, 0, 1, 0.4784314, 1,
-0.2108178, -0.6836976, -2.347786, 0, 1, 0.4823529, 1,
-0.2038978, 0.4589737, 1.091028, 0, 1, 0.4901961, 1,
-0.2032436, -2.375036, -4.182424, 0, 1, 0.4941176, 1,
-0.2027221, -0.1892415, -2.468173, 0, 1, 0.5019608, 1,
-0.2026871, -0.05675607, -2.710404, 0, 1, 0.509804, 1,
-0.1890566, -1.27257, -4.071442, 0, 1, 0.5137255, 1,
-0.1885517, -0.254377, -2.228532, 0, 1, 0.5215687, 1,
-0.1884059, 0.2739458, -1.609513, 0, 1, 0.5254902, 1,
-0.1851654, 0.7380085, -1.833327, 0, 1, 0.5333334, 1,
-0.1821649, 1.62171, 0.2799629, 0, 1, 0.5372549, 1,
-0.1809002, 0.6619512, -0.393934, 0, 1, 0.5450981, 1,
-0.1786682, 0.4353891, -0.6302045, 0, 1, 0.5490196, 1,
-0.1762634, -2.112957, -3.047009, 0, 1, 0.5568628, 1,
-0.1742584, 1.106833, 0.4522839, 0, 1, 0.5607843, 1,
-0.1713142, -0.1083817, -2.613939, 0, 1, 0.5686275, 1,
-0.1700324, -2.128872, -2.085167, 0, 1, 0.572549, 1,
-0.1667675, -0.6005651, -3.137439, 0, 1, 0.5803922, 1,
-0.1659157, -1.173607, -3.086103, 0, 1, 0.5843138, 1,
-0.1634131, 0.05201345, -2.508807, 0, 1, 0.5921569, 1,
-0.1619616, -0.7038105, -3.021364, 0, 1, 0.5960785, 1,
-0.1616076, -0.6184946, -3.064767, 0, 1, 0.6039216, 1,
-0.1596875, 0.124631, -1.642519, 0, 1, 0.6117647, 1,
-0.1573703, 1.384452, -0.4043032, 0, 1, 0.6156863, 1,
-0.1571129, 0.161744, 0.7912269, 0, 1, 0.6235294, 1,
-0.155094, 0.2983683, 0.8999795, 0, 1, 0.627451, 1,
-0.1540452, -0.5634685, -2.459287, 0, 1, 0.6352941, 1,
-0.1527112, 1.184924, -0.5246203, 0, 1, 0.6392157, 1,
-0.1478993, 0.6254657, -0.371198, 0, 1, 0.6470588, 1,
-0.1465243, 0.4205512, 0.8476143, 0, 1, 0.6509804, 1,
-0.1432429, -0.8383069, -1.970366, 0, 1, 0.6588235, 1,
-0.1424564, 0.5326152, -0.4375779, 0, 1, 0.6627451, 1,
-0.1345515, 0.0791638, -1.139421, 0, 1, 0.6705883, 1,
-0.1306071, 1.704113, -0.03310381, 0, 1, 0.6745098, 1,
-0.1275455, 0.1805188, -0.7539486, 0, 1, 0.682353, 1,
-0.1246416, 0.5127106, -0.2237281, 0, 1, 0.6862745, 1,
-0.1240318, -0.443115, -1.566143, 0, 1, 0.6941177, 1,
-0.1222987, 1.022362, -0.7735309, 0, 1, 0.7019608, 1,
-0.1199133, -0.003155802, -0.6234444, 0, 1, 0.7058824, 1,
-0.1175897, 0.7199698, -1.382834, 0, 1, 0.7137255, 1,
-0.1174145, -0.5990244, -4.335066, 0, 1, 0.7176471, 1,
-0.1161677, 0.2151062, -0.2130816, 0, 1, 0.7254902, 1,
-0.1133933, -1.11207, -3.951877, 0, 1, 0.7294118, 1,
-0.1133645, -1.230202, -1.548891, 0, 1, 0.7372549, 1,
-0.1098663, 2.037205, -0.2592855, 0, 1, 0.7411765, 1,
-0.1072121, 0.05698089, -0.3416359, 0, 1, 0.7490196, 1,
-0.1072091, 1.36649, -0.6880782, 0, 1, 0.7529412, 1,
-0.09948128, -0.7069127, -3.679085, 0, 1, 0.7607843, 1,
-0.0977775, 2.051578, 0.7490557, 0, 1, 0.7647059, 1,
-0.09641768, -0.3910246, -3.935756, 0, 1, 0.772549, 1,
-0.09294008, 0.1896827, 0.1098419, 0, 1, 0.7764706, 1,
-0.09262861, -0.009244451, -0.629737, 0, 1, 0.7843137, 1,
-0.08927351, 0.4523388, -0.3490318, 0, 1, 0.7882353, 1,
-0.08294433, -0.09273835, -2.632487, 0, 1, 0.7960784, 1,
-0.08245038, 0.9400037, -0.4867811, 0, 1, 0.8039216, 1,
-0.08054535, 0.1788022, -0.7615432, 0, 1, 0.8078431, 1,
-0.07846941, -0.1466795, -3.478028, 0, 1, 0.8156863, 1,
-0.07676493, -0.2729847, -2.823703, 0, 1, 0.8196079, 1,
-0.0749685, 0.4456051, 0.9752169, 0, 1, 0.827451, 1,
-0.07349139, -0.4959347, -2.31412, 0, 1, 0.8313726, 1,
-0.07185625, 0.220976, 0.7854359, 0, 1, 0.8392157, 1,
-0.07128458, 0.2237248, -0.4413563, 0, 1, 0.8431373, 1,
-0.06764533, -0.3799922, -2.306829, 0, 1, 0.8509804, 1,
-0.06641014, -0.4993235, -3.290407, 0, 1, 0.854902, 1,
-0.06425182, -0.7627798, -3.16874, 0, 1, 0.8627451, 1,
-0.06204917, 2.206155, -1.027951, 0, 1, 0.8666667, 1,
-0.06124402, 0.8700906, 1.611246, 0, 1, 0.8745098, 1,
-0.04993092, -0.3503228, -3.712986, 0, 1, 0.8784314, 1,
-0.04641955, -0.2140645, -3.529979, 0, 1, 0.8862745, 1,
-0.04202193, 0.09253034, -0.25499, 0, 1, 0.8901961, 1,
-0.04154643, -1.069906, -2.968737, 0, 1, 0.8980392, 1,
-0.04153415, -0.1824257, -1.906113, 0, 1, 0.9058824, 1,
-0.04132405, -0.1496393, -3.437726, 0, 1, 0.9098039, 1,
-0.04036753, -0.8022339, -1.616832, 0, 1, 0.9176471, 1,
-0.03820142, 0.8023968, -0.05638291, 0, 1, 0.9215686, 1,
-0.03753915, 1.108901, 0.5122782, 0, 1, 0.9294118, 1,
-0.03579124, -2.07143, -1.022387, 0, 1, 0.9333333, 1,
-0.03175601, -0.4909743, -2.714608, 0, 1, 0.9411765, 1,
-0.03123732, -0.2550336, -4.133245, 0, 1, 0.945098, 1,
-0.02622359, 1.512043, 0.5106871, 0, 1, 0.9529412, 1,
-0.02529055, -0.4123015, -2.943067, 0, 1, 0.9568627, 1,
-0.02468429, -0.4511668, -1.689984, 0, 1, 0.9647059, 1,
-0.02270532, 0.1276401, -0.2225828, 0, 1, 0.9686275, 1,
-0.02061051, -0.6817316, -2.931659, 0, 1, 0.9764706, 1,
-0.02039408, 1.074129, -0.4353597, 0, 1, 0.9803922, 1,
-0.02014804, 0.06099247, 1.234796, 0, 1, 0.9882353, 1,
-0.01962235, -0.1449113, -1.752904, 0, 1, 0.9921569, 1,
-0.0174525, 0.05993075, 2.190071, 0, 1, 1, 1,
-0.01669316, -1.839388, -2.589358, 0, 0.9921569, 1, 1,
-0.01644676, -1.446065, -3.006062, 0, 0.9882353, 1, 1,
-0.01610704, 0.1587787, 0.215243, 0, 0.9803922, 1, 1,
-0.01508994, -0.3495674, -2.514749, 0, 0.9764706, 1, 1,
-0.01460108, 0.8528571, -1.540367, 0, 0.9686275, 1, 1,
-0.01411248, -1.171388, -2.67912, 0, 0.9647059, 1, 1,
-0.01342214, -0.7537295, -4.275003, 0, 0.9568627, 1, 1,
-0.01284864, 0.4995644, 0.1862703, 0, 0.9529412, 1, 1,
-0.01157528, -0.3414326, -3.794384, 0, 0.945098, 1, 1,
-0.00728157, 1.037665, -1.040586, 0, 0.9411765, 1, 1,
-0.006643987, 1.846681, 1.441494, 0, 0.9333333, 1, 1,
-0.003791445, 1.217058, -0.2592364, 0, 0.9294118, 1, 1,
-0.002918717, 0.9396923, 0.001703322, 0, 0.9215686, 1, 1,
0.003579622, -0.7089853, 2.509602, 0, 0.9176471, 1, 1,
0.00393424, -1.524225, 3.741611, 0, 0.9098039, 1, 1,
0.005657522, 0.1415106, -0.5938727, 0, 0.9058824, 1, 1,
0.006906625, -1.237803, 3.507842, 0, 0.8980392, 1, 1,
0.007310845, 1.108755, 1.001296, 0, 0.8901961, 1, 1,
0.0084198, 1.479401, -0.787735, 0, 0.8862745, 1, 1,
0.01036785, 0.5608151, -1.176707, 0, 0.8784314, 1, 1,
0.01375136, 0.8341112, -1.093565, 0, 0.8745098, 1, 1,
0.01428869, 0.9147683, -1.43838, 0, 0.8666667, 1, 1,
0.01987183, 0.1093441, 1.387142, 0, 0.8627451, 1, 1,
0.02137988, 0.9270285, 0.8286775, 0, 0.854902, 1, 1,
0.02153543, 0.06484701, -0.1671131, 0, 0.8509804, 1, 1,
0.02442915, -2.467045, 4.393991, 0, 0.8431373, 1, 1,
0.02645448, 1.099913, -0.1605667, 0, 0.8392157, 1, 1,
0.02770204, -1.42326, 2.994591, 0, 0.8313726, 1, 1,
0.03245079, 0.6981768, 0.3481896, 0, 0.827451, 1, 1,
0.03673928, 0.6243642, 2.943257, 0, 0.8196079, 1, 1,
0.03772275, -0.4376591, 2.126141, 0, 0.8156863, 1, 1,
0.03796166, -1.088232, 1.769086, 0, 0.8078431, 1, 1,
0.04532854, -1.356288, 1.61166, 0, 0.8039216, 1, 1,
0.04553305, -0.4338947, 3.06375, 0, 0.7960784, 1, 1,
0.04603089, -1.900832, 2.397902, 0, 0.7882353, 1, 1,
0.04726181, 0.5616816, -0.5230571, 0, 0.7843137, 1, 1,
0.04770618, 1.274766, 1.019171, 0, 0.7764706, 1, 1,
0.0491066, -0.06154316, 3.189433, 0, 0.772549, 1, 1,
0.0498657, -1.531478, 2.787994, 0, 0.7647059, 1, 1,
0.05174142, -0.2108559, 2.436073, 0, 0.7607843, 1, 1,
0.05427746, -0.5128624, 2.785143, 0, 0.7529412, 1, 1,
0.0547202, -0.5067493, 2.490835, 0, 0.7490196, 1, 1,
0.05690784, -0.8793924, 1.803035, 0, 0.7411765, 1, 1,
0.05706925, -0.1574271, 3.691656, 0, 0.7372549, 1, 1,
0.05755058, 0.6376531, -1.926604, 0, 0.7294118, 1, 1,
0.05867231, -0.2774827, 3.156436, 0, 0.7254902, 1, 1,
0.06124028, 1.611316, 1.25197, 0, 0.7176471, 1, 1,
0.0627676, 0.03308975, -0.3078439, 0, 0.7137255, 1, 1,
0.06328933, 1.389671, -1.323985, 0, 0.7058824, 1, 1,
0.06710228, -0.1754147, 3.064644, 0, 0.6980392, 1, 1,
0.07079254, 0.6086484, -1.181668, 0, 0.6941177, 1, 1,
0.07363862, 0.8880703, 0.1254853, 0, 0.6862745, 1, 1,
0.07410278, -0.008926642, 1.30682, 0, 0.682353, 1, 1,
0.08437097, -0.295123, 3.704691, 0, 0.6745098, 1, 1,
0.08721295, -1.097592, 2.855298, 0, 0.6705883, 1, 1,
0.08781253, 0.1681313, 1.409904, 0, 0.6627451, 1, 1,
0.09050707, 0.2729754, 0.8199165, 0, 0.6588235, 1, 1,
0.09107672, 0.2173877, 0.9786776, 0, 0.6509804, 1, 1,
0.09184545, 0.3552526, 0.2308258, 0, 0.6470588, 1, 1,
0.09296126, -1.062941, 4.191165, 0, 0.6392157, 1, 1,
0.09727453, 0.6264843, 0.03443082, 0, 0.6352941, 1, 1,
0.09900961, 1.223346, 0.6155908, 0, 0.627451, 1, 1,
0.1006545, 0.5640165, 0.292287, 0, 0.6235294, 1, 1,
0.1015824, -0.04524936, 2.004228, 0, 0.6156863, 1, 1,
0.1034417, 0.2481403, 0.9469615, 0, 0.6117647, 1, 1,
0.1042348, 0.6975306, -1.783564, 0, 0.6039216, 1, 1,
0.1098181, -0.6589961, 4.167677, 0, 0.5960785, 1, 1,
0.113954, 0.196556, 0.6893383, 0, 0.5921569, 1, 1,
0.1158141, -0.09517407, 1.775209, 0, 0.5843138, 1, 1,
0.1175387, 0.1524735, 0.247037, 0, 0.5803922, 1, 1,
0.1188053, 0.8750502, 0.6498752, 0, 0.572549, 1, 1,
0.122147, -0.7232819, 1.516206, 0, 0.5686275, 1, 1,
0.1238994, -1.442302, 4.395388, 0, 0.5607843, 1, 1,
0.1252831, 1.49949, 0.1242863, 0, 0.5568628, 1, 1,
0.127053, -2.569145, 3.152065, 0, 0.5490196, 1, 1,
0.1287865, -1.776753, 3.880515, 0, 0.5450981, 1, 1,
0.1375294, 0.4661064, -1.739763, 0, 0.5372549, 1, 1,
0.1390411, 0.5077354, 1.700738, 0, 0.5333334, 1, 1,
0.142938, 0.1218075, 0.4525422, 0, 0.5254902, 1, 1,
0.1440009, -0.9278699, 4.891879, 0, 0.5215687, 1, 1,
0.1517207, -0.5832011, 4.115126, 0, 0.5137255, 1, 1,
0.1519764, 1.301688, 0.5914077, 0, 0.509804, 1, 1,
0.154014, 1.371357, -0.3160838, 0, 0.5019608, 1, 1,
0.1568691, 0.5687073, 1.266171, 0, 0.4941176, 1, 1,
0.1611141, -0.1145432, 2.180216, 0, 0.4901961, 1, 1,
0.1632753, -0.1437663, 2.108175, 0, 0.4823529, 1, 1,
0.1636466, -0.6314145, 2.318049, 0, 0.4784314, 1, 1,
0.1669107, 1.098787, 0.1366203, 0, 0.4705882, 1, 1,
0.173363, 0.8484359, -0.456271, 0, 0.4666667, 1, 1,
0.186314, -0.6857558, 2.921776, 0, 0.4588235, 1, 1,
0.1914242, -0.7081656, 3.493898, 0, 0.454902, 1, 1,
0.1921998, -0.4147293, 2.459754, 0, 0.4470588, 1, 1,
0.1931909, -0.04012967, 2.573128, 0, 0.4431373, 1, 1,
0.1944937, 0.8219987, 1.111803, 0, 0.4352941, 1, 1,
0.1945894, -0.3786624, 3.591162, 0, 0.4313726, 1, 1,
0.1981804, 1.132153, 0.1607701, 0, 0.4235294, 1, 1,
0.2003906, -0.5969031, 1.426377, 0, 0.4196078, 1, 1,
0.2010961, 0.6336309, 0.4146717, 0, 0.4117647, 1, 1,
0.2068879, -0.7193635, 5.067078, 0, 0.4078431, 1, 1,
0.2087495, -0.9450428, 3.016196, 0, 0.4, 1, 1,
0.2131227, 0.9947577, 1.046895, 0, 0.3921569, 1, 1,
0.2135245, -2.326203, 3.630027, 0, 0.3882353, 1, 1,
0.2168666, -1.180438, 2.638113, 0, 0.3803922, 1, 1,
0.2198633, -1.70525, 4.953088, 0, 0.3764706, 1, 1,
0.2212364, -0.8282217, 4.144312, 0, 0.3686275, 1, 1,
0.2222507, 1.131291, -1.231471, 0, 0.3647059, 1, 1,
0.2252356, 0.07302162, 0.9037771, 0, 0.3568628, 1, 1,
0.2255757, 0.3056391, -0.5418153, 0, 0.3529412, 1, 1,
0.2302605, -0.02787624, 1.207575, 0, 0.345098, 1, 1,
0.2318065, 0.2516326, 0.7718267, 0, 0.3411765, 1, 1,
0.2359607, 0.002824183, 2.569503, 0, 0.3333333, 1, 1,
0.2363591, -1.216132, 1.621048, 0, 0.3294118, 1, 1,
0.243628, 0.04041823, 0.6838673, 0, 0.3215686, 1, 1,
0.2438507, 1.051723, 1.109777, 0, 0.3176471, 1, 1,
0.2451596, 0.01137709, 1.234724, 0, 0.3098039, 1, 1,
0.2457819, -0.2970882, 1.947499, 0, 0.3058824, 1, 1,
0.2468639, 0.1600605, 0.9226856, 0, 0.2980392, 1, 1,
0.2469282, -0.1215028, 4.964094, 0, 0.2901961, 1, 1,
0.2491476, 1.732421, -0.4846547, 0, 0.2862745, 1, 1,
0.2505437, -1.247234, 2.000901, 0, 0.2784314, 1, 1,
0.2507644, 1.4593, -0.5053543, 0, 0.2745098, 1, 1,
0.2552459, 1.021345, -0.02680639, 0, 0.2666667, 1, 1,
0.255466, 1.43565, 1.206798, 0, 0.2627451, 1, 1,
0.2555093, 0.18469, 0.8854542, 0, 0.254902, 1, 1,
0.2587944, -0.2335949, 2.375588, 0, 0.2509804, 1, 1,
0.2598466, 0.06674287, 0.8092912, 0, 0.2431373, 1, 1,
0.2653781, 2.108974, -1.453334, 0, 0.2392157, 1, 1,
0.2703424, 0.9021499, 1.738841, 0, 0.2313726, 1, 1,
0.2722059, -1.56482, 3.934219, 0, 0.227451, 1, 1,
0.2764135, -0.1584424, 2.296759, 0, 0.2196078, 1, 1,
0.2770297, 1.436162, -0.09689596, 0, 0.2156863, 1, 1,
0.2803744, 1.757894, 0.370731, 0, 0.2078431, 1, 1,
0.2805338, -1.383549, 2.995721, 0, 0.2039216, 1, 1,
0.2823042, -2.222272, 2.574847, 0, 0.1960784, 1, 1,
0.2857004, -0.9669871, 1.347689, 0, 0.1882353, 1, 1,
0.2872762, 0.4917233, 0.9474698, 0, 0.1843137, 1, 1,
0.2888344, 1.705898, 0.4212123, 0, 0.1764706, 1, 1,
0.2906565, 0.319737, 0.3675448, 0, 0.172549, 1, 1,
0.296661, 0.4080294, 0.7373713, 0, 0.1647059, 1, 1,
0.2986063, 0.2158219, -0.8935123, 0, 0.1607843, 1, 1,
0.3031385, 0.6260129, 0.6646391, 0, 0.1529412, 1, 1,
0.303166, 0.7369719, 0.1543537, 0, 0.1490196, 1, 1,
0.3066975, 0.6304429, 0.5060304, 0, 0.1411765, 1, 1,
0.3068401, -0.8427929, 2.809353, 0, 0.1372549, 1, 1,
0.3089031, 0.8455592, -0.4138381, 0, 0.1294118, 1, 1,
0.3102765, -0.4782522, 1.303634, 0, 0.1254902, 1, 1,
0.310854, -0.193873, 1.971135, 0, 0.1176471, 1, 1,
0.3139424, -0.6570098, 3.459709, 0, 0.1137255, 1, 1,
0.3173993, -0.2169746, 1.46207, 0, 0.1058824, 1, 1,
0.3180603, 1.268709, 0.3289183, 0, 0.09803922, 1, 1,
0.3187791, -1.719596, 3.943634, 0, 0.09411765, 1, 1,
0.3211735, -0.5871003, 1.314781, 0, 0.08627451, 1, 1,
0.3283031, -0.963475, 3.287088, 0, 0.08235294, 1, 1,
0.3301712, -0.2652085, 2.866802, 0, 0.07450981, 1, 1,
0.338745, 0.003147732, 2.015226, 0, 0.07058824, 1, 1,
0.3409194, -0.3155368, 2.618547, 0, 0.0627451, 1, 1,
0.346744, -0.5795795, 2.547588, 0, 0.05882353, 1, 1,
0.3497187, 1.092069, 1.473996, 0, 0.05098039, 1, 1,
0.3510346, 0.7356426, -0.4798843, 0, 0.04705882, 1, 1,
0.3562878, 0.04575275, 3.186018, 0, 0.03921569, 1, 1,
0.3571159, 0.07408389, 0.7011325, 0, 0.03529412, 1, 1,
0.3655634, 0.4398638, 0.02068334, 0, 0.02745098, 1, 1,
0.3662663, -0.6924972, 2.451126, 0, 0.02352941, 1, 1,
0.3679602, 1.456809, 0.7695239, 0, 0.01568628, 1, 1,
0.3744457, -1.699034, 1.681437, 0, 0.01176471, 1, 1,
0.3794548, -0.5733387, 3.233015, 0, 0.003921569, 1, 1,
0.3851111, 1.166527, -0.1610988, 0.003921569, 0, 1, 1,
0.3859476, -0.4275197, 2.075752, 0.007843138, 0, 1, 1,
0.3870721, 1.220132, -1.09098, 0.01568628, 0, 1, 1,
0.3912958, 0.7354913, 2.082118, 0.01960784, 0, 1, 1,
0.3916345, 1.148301, 1.435349, 0.02745098, 0, 1, 1,
0.3918078, -0.8601247, 2.347352, 0.03137255, 0, 1, 1,
0.3922747, -1.052913, 3.587811, 0.03921569, 0, 1, 1,
0.3948051, 0.9543526, 1.192765, 0.04313726, 0, 1, 1,
0.3973544, -0.8525827, 1.303938, 0.05098039, 0, 1, 1,
0.399014, 0.3979059, 0.8039771, 0.05490196, 0, 1, 1,
0.4000218, 0.4822475, 0.2456442, 0.0627451, 0, 1, 1,
0.4076171, -1.465586, 3.80911, 0.06666667, 0, 1, 1,
0.4078189, 1.380516, -1.034097, 0.07450981, 0, 1, 1,
0.4126985, 1.42141, 0.06021843, 0.07843138, 0, 1, 1,
0.4141441, 1.213287, 0.6370454, 0.08627451, 0, 1, 1,
0.4154587, -1.163528, 1.974433, 0.09019608, 0, 1, 1,
0.4156031, -1.124533, 3.129315, 0.09803922, 0, 1, 1,
0.415914, 0.5496787, 0.7029033, 0.1058824, 0, 1, 1,
0.4162986, 0.2365288, 1.24443, 0.1098039, 0, 1, 1,
0.4179155, -1.053197, 1.452517, 0.1176471, 0, 1, 1,
0.4275897, 0.7215158, -0.6166103, 0.1215686, 0, 1, 1,
0.4430121, -0.1694525, 3.130474, 0.1294118, 0, 1, 1,
0.4501245, 1.043709, -0.2305865, 0.1333333, 0, 1, 1,
0.4535075, 0.1495369, 1.60487, 0.1411765, 0, 1, 1,
0.4595663, 0.9779463, 0.8521046, 0.145098, 0, 1, 1,
0.4598319, 0.1181481, 1.578127, 0.1529412, 0, 1, 1,
0.460073, -0.7131877, 0.09329741, 0.1568628, 0, 1, 1,
0.460752, 1.056566, 1.494222, 0.1647059, 0, 1, 1,
0.4694612, -1.909097, 3.676418, 0.1686275, 0, 1, 1,
0.4744157, -1.174117, 2.844921, 0.1764706, 0, 1, 1,
0.4746192, -0.5346065, 3.818229, 0.1803922, 0, 1, 1,
0.476438, 1.503198, -0.398968, 0.1882353, 0, 1, 1,
0.4766902, -2.664759, 1.967944, 0.1921569, 0, 1, 1,
0.4775262, -0.5330243, 5.067925, 0.2, 0, 1, 1,
0.4778644, -0.338699, 2.195354, 0.2078431, 0, 1, 1,
0.4814526, 0.04849032, 1.150923, 0.2117647, 0, 1, 1,
0.4830253, -0.6656396, 4.402987, 0.2196078, 0, 1, 1,
0.4847209, 0.2599821, 0.3463653, 0.2235294, 0, 1, 1,
0.4888302, -0.3964266, 3.305958, 0.2313726, 0, 1, 1,
0.4914095, -0.2340392, 2.147824, 0.2352941, 0, 1, 1,
0.5050445, -0.02322024, 0.05617062, 0.2431373, 0, 1, 1,
0.507209, 1.457707, 0.2003577, 0.2470588, 0, 1, 1,
0.5101854, -0.902863, 1.699672, 0.254902, 0, 1, 1,
0.5130893, -0.8931656, 2.206502, 0.2588235, 0, 1, 1,
0.5210266, 0.9920492, 0.698028, 0.2666667, 0, 1, 1,
0.5228134, -2.334257, 3.715909, 0.2705882, 0, 1, 1,
0.5229046, 0.2387006, 2.655682, 0.2784314, 0, 1, 1,
0.5334981, 0.5102744, -0.7996809, 0.282353, 0, 1, 1,
0.5366268, -0.1415035, 0.9787734, 0.2901961, 0, 1, 1,
0.5378774, -0.7219922, 2.098238, 0.2941177, 0, 1, 1,
0.5535182, -1.034885, 3.148947, 0.3019608, 0, 1, 1,
0.5545561, -0.8943747, 1.599952, 0.3098039, 0, 1, 1,
0.5559933, -1.096763, 2.955, 0.3137255, 0, 1, 1,
0.5610741, 0.2765883, 1.000368, 0.3215686, 0, 1, 1,
0.5633219, 0.3105391, 1.268544, 0.3254902, 0, 1, 1,
0.563341, -0.743699, 4.694536, 0.3333333, 0, 1, 1,
0.5661138, 0.1125137, -0.2798526, 0.3372549, 0, 1, 1,
0.5771021, 1.596087, 0.8821861, 0.345098, 0, 1, 1,
0.581479, 3.159679, 0.7869881, 0.3490196, 0, 1, 1,
0.5915031, -0.3231567, 2.575921, 0.3568628, 0, 1, 1,
0.5933764, -0.4727048, 1.76085, 0.3607843, 0, 1, 1,
0.6059005, -0.389835, 1.738496, 0.3686275, 0, 1, 1,
0.6074412, 0.8824258, 1.25088, 0.372549, 0, 1, 1,
0.6186143, -0.7475188, 2.438869, 0.3803922, 0, 1, 1,
0.6223592, 1.300711, 0.6580986, 0.3843137, 0, 1, 1,
0.6253179, -0.3489292, 2.328993, 0.3921569, 0, 1, 1,
0.6263833, 1.000283, 1.286689, 0.3960784, 0, 1, 1,
0.6268957, -0.3922053, 1.464661, 0.4039216, 0, 1, 1,
0.6329647, 0.8066433, 1.0187, 0.4117647, 0, 1, 1,
0.6351654, 1.032025, -1.030056, 0.4156863, 0, 1, 1,
0.6414347, -1.684292, 2.788105, 0.4235294, 0, 1, 1,
0.6452424, 0.755995, 0.1781571, 0.427451, 0, 1, 1,
0.6495104, -0.1018864, 2.878633, 0.4352941, 0, 1, 1,
0.6510906, 0.7898314, 0.1467569, 0.4392157, 0, 1, 1,
0.6649476, -0.9508655, 4.220275, 0.4470588, 0, 1, 1,
0.6656221, -1.312991, 4.813324, 0.4509804, 0, 1, 1,
0.6674574, 0.2996845, 0.505482, 0.4588235, 0, 1, 1,
0.6678921, 0.8350018, 0.7405216, 0.4627451, 0, 1, 1,
0.6681245, 0.7303591, 1.204417, 0.4705882, 0, 1, 1,
0.6690814, 0.07221983, 2.469687, 0.4745098, 0, 1, 1,
0.6723589, 0.5757281, 2.604138, 0.4823529, 0, 1, 1,
0.6724082, 1.96494, -1.644788, 0.4862745, 0, 1, 1,
0.6770551, 0.6102703, 0.8003314, 0.4941176, 0, 1, 1,
0.6771782, -0.8522196, 2.139981, 0.5019608, 0, 1, 1,
0.684853, -1.305669, 2.55792, 0.5058824, 0, 1, 1,
0.6850736, -0.6135899, 3.921492, 0.5137255, 0, 1, 1,
0.6897994, 0.2096141, 2.036944, 0.5176471, 0, 1, 1,
0.6908663, -0.3073387, 1.375955, 0.5254902, 0, 1, 1,
0.6936782, 0.09092168, 2.34358, 0.5294118, 0, 1, 1,
0.6949995, -0.5800968, 3.340981, 0.5372549, 0, 1, 1,
0.6958019, -0.5892193, 4.522361, 0.5411765, 0, 1, 1,
0.700416, 1.017063, -0.8362746, 0.5490196, 0, 1, 1,
0.7017177, -0.02543269, 1.449588, 0.5529412, 0, 1, 1,
0.7024213, -0.01412988, 2.540015, 0.5607843, 0, 1, 1,
0.710896, -0.301922, 1.974217, 0.5647059, 0, 1, 1,
0.71163, 1.12233, 1.234133, 0.572549, 0, 1, 1,
0.7147754, 0.7159203, 0.8231317, 0.5764706, 0, 1, 1,
0.7226903, -0.3786798, 2.288029, 0.5843138, 0, 1, 1,
0.7248958, -1.474469, 1.968674, 0.5882353, 0, 1, 1,
0.7265723, -2.199432, 4.351827, 0.5960785, 0, 1, 1,
0.7277393, 1.875243, 2.715247, 0.6039216, 0, 1, 1,
0.7355652, -0.3218288, -0.8112912, 0.6078432, 0, 1, 1,
0.7460806, -1.088829, 2.159642, 0.6156863, 0, 1, 1,
0.7466447, -0.4671674, 1.717906, 0.6196079, 0, 1, 1,
0.7484131, 0.2000129, 3.035179, 0.627451, 0, 1, 1,
0.748598, -2.079933, 1.043759, 0.6313726, 0, 1, 1,
0.748757, 0.2787158, 1.294866, 0.6392157, 0, 1, 1,
0.7570161, -1.196062, 2.113821, 0.6431373, 0, 1, 1,
0.7609176, -1.705681, 1.64257, 0.6509804, 0, 1, 1,
0.7615981, 1.751576, 0.6336808, 0.654902, 0, 1, 1,
0.76234, -1.267199, 2.381507, 0.6627451, 0, 1, 1,
0.7645639, -0.415433, 1.979567, 0.6666667, 0, 1, 1,
0.7654611, 0.4048554, -0.6773492, 0.6745098, 0, 1, 1,
0.7685866, 0.9846324, 2.125249, 0.6784314, 0, 1, 1,
0.7686525, 0.5299434, 0.5306738, 0.6862745, 0, 1, 1,
0.7729971, -0.2245066, 1.406603, 0.6901961, 0, 1, 1,
0.7784826, -1.98701, 2.823294, 0.6980392, 0, 1, 1,
0.7924443, -0.6285285, 1.347832, 0.7058824, 0, 1, 1,
0.7963948, 0.1463927, 1.366723, 0.7098039, 0, 1, 1,
0.7970203, 1.015122, -0.01371411, 0.7176471, 0, 1, 1,
0.7980133, -0.7081251, 0.9674664, 0.7215686, 0, 1, 1,
0.798458, 0.7908559, -0.7811508, 0.7294118, 0, 1, 1,
0.8020127, 0.4826616, 2.500991, 0.7333333, 0, 1, 1,
0.8095882, -0.1190009, 2.022166, 0.7411765, 0, 1, 1,
0.8101214, -0.8572685, 3.287338, 0.7450981, 0, 1, 1,
0.8105248, 1.688949, 0.01582556, 0.7529412, 0, 1, 1,
0.8116353, -0.5931216, 2.718279, 0.7568628, 0, 1, 1,
0.8116403, 1.086416, 1.660328, 0.7647059, 0, 1, 1,
0.8122321, 0.2268621, 0.7192528, 0.7686275, 0, 1, 1,
0.8140417, 0.1082871, 1.890846, 0.7764706, 0, 1, 1,
0.8147587, 1.295117, 0.9272019, 0.7803922, 0, 1, 1,
0.8173981, 0.7398873, 1.259051, 0.7882353, 0, 1, 1,
0.818738, 0.8275353, 1.994774, 0.7921569, 0, 1, 1,
0.8268882, -0.3047937, 0.2831694, 0.8, 0, 1, 1,
0.8293075, -0.6924348, 0.6870545, 0.8078431, 0, 1, 1,
0.8300699, -1.048951, 3.090365, 0.8117647, 0, 1, 1,
0.8417773, -1.1528, 2.217221, 0.8196079, 0, 1, 1,
0.8439459, -1.202238, 3.850271, 0.8235294, 0, 1, 1,
0.8476065, 0.1004571, 1.695475, 0.8313726, 0, 1, 1,
0.8543247, 0.9449777, -0.01445972, 0.8352941, 0, 1, 1,
0.8593227, -1.736841, 1.738339, 0.8431373, 0, 1, 1,
0.881172, -0.3619444, 2.773703, 0.8470588, 0, 1, 1,
0.8861766, -0.2933019, 0.6580086, 0.854902, 0, 1, 1,
0.8867307, -0.3022401, 2.088677, 0.8588235, 0, 1, 1,
0.8941189, 0.22559, -0.7255271, 0.8666667, 0, 1, 1,
0.9089093, 0.6116511, 2.319561, 0.8705882, 0, 1, 1,
0.9153379, -1.206177, 2.384074, 0.8784314, 0, 1, 1,
0.9162873, 0.4103821, 3.168593, 0.8823529, 0, 1, 1,
0.9172021, -1.416885, 3.778532, 0.8901961, 0, 1, 1,
0.9332538, 0.1709272, 3.002524, 0.8941177, 0, 1, 1,
0.9409977, 1.110862, 0.2656128, 0.9019608, 0, 1, 1,
0.9432434, -1.154416, 2.412332, 0.9098039, 0, 1, 1,
0.9448449, 0.7104674, 0.5590873, 0.9137255, 0, 1, 1,
0.9508718, -1.57552, 3.263738, 0.9215686, 0, 1, 1,
0.9537992, 0.4699233, 1.200664, 0.9254902, 0, 1, 1,
0.9578665, -0.9065102, 2.414441, 0.9333333, 0, 1, 1,
0.9579809, 0.1674993, 1.954939, 0.9372549, 0, 1, 1,
0.9592822, 1.294416, 1.475416, 0.945098, 0, 1, 1,
0.9632015, 1.855677, -0.7296388, 0.9490196, 0, 1, 1,
0.9640567, -1.794284, 4.375602, 0.9568627, 0, 1, 1,
0.9655915, -0.5497466, 2.916425, 0.9607843, 0, 1, 1,
0.9705486, -0.3655918, 0.8339699, 0.9686275, 0, 1, 1,
0.9758714, 0.9470279, 0.9846957, 0.972549, 0, 1, 1,
0.9914941, -0.8454821, 2.13512, 0.9803922, 0, 1, 1,
1.00056, -1.284075, 0.8387169, 0.9843137, 0, 1, 1,
1.005407, -1.683715, 3.201591, 0.9921569, 0, 1, 1,
1.005495, 1.067461, 1.16439, 0.9960784, 0, 1, 1,
1.006006, -0.7825283, 2.94822, 1, 0, 0.9960784, 1,
1.007608, -0.1399373, 2.578722, 1, 0, 0.9882353, 1,
1.014643, 1.56947, 2.035572, 1, 0, 0.9843137, 1,
1.02747, -0.3113487, 3.132463, 1, 0, 0.9764706, 1,
1.031005, -0.5260532, 4.515676, 1, 0, 0.972549, 1,
1.033006, -0.4958373, 0.5906584, 1, 0, 0.9647059, 1,
1.043172, -0.3336285, 0.2276095, 1, 0, 0.9607843, 1,
1.048383, -1.089568, 2.659368, 1, 0, 0.9529412, 1,
1.048648, -2.380821, 4.476367, 1, 0, 0.9490196, 1,
1.048877, 0.6087878, 2.285297, 1, 0, 0.9411765, 1,
1.060422, -0.2637972, 2.642044, 1, 0, 0.9372549, 1,
1.063175, 1.444489, 1.728218, 1, 0, 0.9294118, 1,
1.068563, -1.478673, 2.892003, 1, 0, 0.9254902, 1,
1.072437, 0.02417474, 2.293976, 1, 0, 0.9176471, 1,
1.081135, -1.740016, 2.656365, 1, 0, 0.9137255, 1,
1.084122, 1.545722, -1.488375, 1, 0, 0.9058824, 1,
1.086602, -1.391965, 0.478445, 1, 0, 0.9019608, 1,
1.087759, -0.4770499, 0.6736137, 1, 0, 0.8941177, 1,
1.089499, -0.5418216, 2.693761, 1, 0, 0.8862745, 1,
1.096167, 0.8787363, 2.045697, 1, 0, 0.8823529, 1,
1.110032, 0.7630934, 0.6004704, 1, 0, 0.8745098, 1,
1.110463, -0.9711612, 1.882507, 1, 0, 0.8705882, 1,
1.111197, 0.6577754, 0.05221725, 1, 0, 0.8627451, 1,
1.111405, -1.970395, 0.9775691, 1, 0, 0.8588235, 1,
1.118624, 1.596367, 1.656424, 1, 0, 0.8509804, 1,
1.119465, 1.445814, -0.01136534, 1, 0, 0.8470588, 1,
1.122975, -0.8893049, 0.999773, 1, 0, 0.8392157, 1,
1.124469, 1.885192, 0.338612, 1, 0, 0.8352941, 1,
1.133458, -1.124666, 1.927897, 1, 0, 0.827451, 1,
1.135298, -0.6852719, 3.648879, 1, 0, 0.8235294, 1,
1.139605, 0.9816574, 0.6852324, 1, 0, 0.8156863, 1,
1.141082, -0.3121127, 1.917459, 1, 0, 0.8117647, 1,
1.14366, 1.672771, 1.486313, 1, 0, 0.8039216, 1,
1.143949, -0.2408568, 1.330416, 1, 0, 0.7960784, 1,
1.146217, -0.5454637, 2.011871, 1, 0, 0.7921569, 1,
1.146835, 0.002338803, 0.8044728, 1, 0, 0.7843137, 1,
1.157393, 0.7828128, 0.5020428, 1, 0, 0.7803922, 1,
1.163654, -1.010554, 2.959202, 1, 0, 0.772549, 1,
1.172344, 0.9235289, 0.6568974, 1, 0, 0.7686275, 1,
1.176674, -1.621168, 0.7546576, 1, 0, 0.7607843, 1,
1.189456, 0.3908194, 1.054776, 1, 0, 0.7568628, 1,
1.192543, -1.031341, 1.804994, 1, 0, 0.7490196, 1,
1.197435, 0.2353739, 1.026241, 1, 0, 0.7450981, 1,
1.203756, 1.620967, 0.122656, 1, 0, 0.7372549, 1,
1.20421, -0.6550352, 0.4546301, 1, 0, 0.7333333, 1,
1.208829, -0.2152745, 0.5415754, 1, 0, 0.7254902, 1,
1.211653, 0.656562, 0.8348436, 1, 0, 0.7215686, 1,
1.220811, -0.5529224, 1.125777, 1, 0, 0.7137255, 1,
1.222411, 1.710867, 0.4279396, 1, 0, 0.7098039, 1,
1.224334, -0.6683655, 1.335629, 1, 0, 0.7019608, 1,
1.234011, -1.770054, 0.9142475, 1, 0, 0.6941177, 1,
1.24405, -0.3890502, 2.507156, 1, 0, 0.6901961, 1,
1.247256, -0.3128434, 2.455632, 1, 0, 0.682353, 1,
1.24895, -0.4348659, 1.65037, 1, 0, 0.6784314, 1,
1.249057, 1.397128, -0.489182, 1, 0, 0.6705883, 1,
1.250786, -0.0211052, 1.190536, 1, 0, 0.6666667, 1,
1.252009, 0.9557721, -0.9481809, 1, 0, 0.6588235, 1,
1.257661, 0.1786617, 1.855301, 1, 0, 0.654902, 1,
1.260448, 0.5001021, 1.806526, 1, 0, 0.6470588, 1,
1.274516, 0.417639, 1.552019, 1, 0, 0.6431373, 1,
1.277117, 0.0420122, -0.6185734, 1, 0, 0.6352941, 1,
1.280339, 0.2339875, 0.7764451, 1, 0, 0.6313726, 1,
1.282576, -1.867606, 4.100593, 1, 0, 0.6235294, 1,
1.286121, -0.8678528, 2.27266, 1, 0, 0.6196079, 1,
1.295318, -1.815202, 1.583753, 1, 0, 0.6117647, 1,
1.295571, 1.076573, 2.675772, 1, 0, 0.6078432, 1,
1.302385, -0.2317625, -0.6335906, 1, 0, 0.6, 1,
1.304107, 0.6864976, 1.69031, 1, 0, 0.5921569, 1,
1.3083, 0.9711058, 1.062123, 1, 0, 0.5882353, 1,
1.311509, -0.8244953, 1.781347, 1, 0, 0.5803922, 1,
1.32177, 2.824226, -0.6748613, 1, 0, 0.5764706, 1,
1.329423, 0.9385552, -0.1083743, 1, 0, 0.5686275, 1,
1.329425, 1.510258, -0.3452871, 1, 0, 0.5647059, 1,
1.333848, -0.6424142, 2.98678, 1, 0, 0.5568628, 1,
1.338354, 0.4009622, 1.374119, 1, 0, 0.5529412, 1,
1.344982, 0.2972221, 2.181277, 1, 0, 0.5450981, 1,
1.34555, 1.703575, 0.9115, 1, 0, 0.5411765, 1,
1.365969, -0.3587093, 1.101814, 1, 0, 0.5333334, 1,
1.367075, -1.80663, 0.8907449, 1, 0, 0.5294118, 1,
1.371699, 0.02493383, 1.205268, 1, 0, 0.5215687, 1,
1.38176, -0.9332672, 2.899591, 1, 0, 0.5176471, 1,
1.403434, -1.284737, 1.922261, 1, 0, 0.509804, 1,
1.404497, -1.928812, 2.691267, 1, 0, 0.5058824, 1,
1.404768, -0.2098455, 3.631022, 1, 0, 0.4980392, 1,
1.405417, -0.1272776, 0.2751875, 1, 0, 0.4901961, 1,
1.409094, 1.325168, 1.895894, 1, 0, 0.4862745, 1,
1.410505, -0.1198117, 2.574445, 1, 0, 0.4784314, 1,
1.413559, -1.280967, 3.669783, 1, 0, 0.4745098, 1,
1.426148, 0.04991479, 1.70013, 1, 0, 0.4666667, 1,
1.434979, 0.9852249, -0.3676331, 1, 0, 0.4627451, 1,
1.461642, 0.9855251, 0.8380576, 1, 0, 0.454902, 1,
1.471164, 0.158855, 0.8624698, 1, 0, 0.4509804, 1,
1.487367, 1.032841, 2.754735, 1, 0, 0.4431373, 1,
1.506603, -0.5773001, 1.392293, 1, 0, 0.4392157, 1,
1.509385, 0.4920564, 1.418396, 1, 0, 0.4313726, 1,
1.517382, 0.230824, 0.6870307, 1, 0, 0.427451, 1,
1.526427, -0.7210249, 1.731568, 1, 0, 0.4196078, 1,
1.52804, 0.7762528, -0.6082838, 1, 0, 0.4156863, 1,
1.52944, 0.04491536, 1.844392, 1, 0, 0.4078431, 1,
1.531397, -1.418535, 0.8375658, 1, 0, 0.4039216, 1,
1.544645, 0.657271, -0.16587, 1, 0, 0.3960784, 1,
1.54541, 0.1163982, 2.531126, 1, 0, 0.3882353, 1,
1.553336, -0.3745356, -1.067398, 1, 0, 0.3843137, 1,
1.555146, 0.2609523, 1.666764, 1, 0, 0.3764706, 1,
1.567784, 0.6471763, 1.464407, 1, 0, 0.372549, 1,
1.591846, 0.3009438, 1.962223, 1, 0, 0.3647059, 1,
1.601603, 0.4216934, 1.863805, 1, 0, 0.3607843, 1,
1.603434, -0.1289235, 0.3895896, 1, 0, 0.3529412, 1,
1.609531, -0.6786164, 1.351852, 1, 0, 0.3490196, 1,
1.625298, -1.992682, 0.9811231, 1, 0, 0.3411765, 1,
1.628592, -0.07534104, 3.986923, 1, 0, 0.3372549, 1,
1.63573, 1.863516, -0.4316959, 1, 0, 0.3294118, 1,
1.639061, -0.08264414, 2.465204, 1, 0, 0.3254902, 1,
1.649177, 0.7980596, 1.617676, 1, 0, 0.3176471, 1,
1.650847, 0.06244935, 2.052244, 1, 0, 0.3137255, 1,
1.657461, 0.5933432, 2.951302, 1, 0, 0.3058824, 1,
1.667325, 0.7451027, 0.1481358, 1, 0, 0.2980392, 1,
1.668611, -0.08871676, 1.240172, 1, 0, 0.2941177, 1,
1.672456, 0.7507531, 0.6370181, 1, 0, 0.2862745, 1,
1.674929, -0.118643, 0.4936056, 1, 0, 0.282353, 1,
1.676198, 0.5750176, 1.64457, 1, 0, 0.2745098, 1,
1.68034, -0.1400539, 2.94399, 1, 0, 0.2705882, 1,
1.705867, 1.604023, -0.2054888, 1, 0, 0.2627451, 1,
1.716826, 1.390694, 2.34706, 1, 0, 0.2588235, 1,
1.728681, 0.01947879, 2.289181, 1, 0, 0.2509804, 1,
1.761376, -1.201279, 3.239592, 1, 0, 0.2470588, 1,
1.766068, -1.480369, 3.128137, 1, 0, 0.2392157, 1,
1.769272, -1.161919, 3.754696, 1, 0, 0.2352941, 1,
1.773228, -1.605653, 2.716258, 1, 0, 0.227451, 1,
1.776855, -3.17415, 3.424617, 1, 0, 0.2235294, 1,
1.784672, 2.090654, 1.09579, 1, 0, 0.2156863, 1,
1.797495, -1.557796, 3.098511, 1, 0, 0.2117647, 1,
1.829573, 1.903235, 0.3159411, 1, 0, 0.2039216, 1,
1.83537, -0.7759502, 2.724789, 1, 0, 0.1960784, 1,
1.860531, -0.2310982, 1.021359, 1, 0, 0.1921569, 1,
1.89569, -0.5219828, 1.20389, 1, 0, 0.1843137, 1,
1.897792, -0.4566324, 0.9283137, 1, 0, 0.1803922, 1,
1.903839, 0.7868877, 1.449566, 1, 0, 0.172549, 1,
1.907881, 1.494982, 0.5250199, 1, 0, 0.1686275, 1,
1.95992, -0.7261835, 1.543756, 1, 0, 0.1607843, 1,
1.973312, -1.485538, 0.2384876, 1, 0, 0.1568628, 1,
1.984705, 0.6184968, 0.1451221, 1, 0, 0.1490196, 1,
1.990215, -0.9824306, 2.145021, 1, 0, 0.145098, 1,
1.990535, -0.1628909, 1.219443, 1, 0, 0.1372549, 1,
1.991278, 1.693286, 0.48344, 1, 0, 0.1333333, 1,
2.000122, -0.199247, 2.498513, 1, 0, 0.1254902, 1,
2.020441, -0.8020644, 0.9362939, 1, 0, 0.1215686, 1,
2.021091, 0.4458427, 1.028333, 1, 0, 0.1137255, 1,
2.038354, 0.1391685, 2.870323, 1, 0, 0.1098039, 1,
2.065283, 1.445063, 1.925994, 1, 0, 0.1019608, 1,
2.097916, 0.5747579, 1.728709, 1, 0, 0.09411765, 1,
2.13697, 1.469618, 1.183246, 1, 0, 0.09019608, 1,
2.187305, -0.7218764, 1.724509, 1, 0, 0.08235294, 1,
2.188799, 1.104034, 0.4376522, 1, 0, 0.07843138, 1,
2.191051, -0.8479103, 3.305233, 1, 0, 0.07058824, 1,
2.197851, -0.2567336, 1.959358, 1, 0, 0.06666667, 1,
2.201594, -0.8591482, 1.573399, 1, 0, 0.05882353, 1,
2.379936, -0.9384218, 1.529313, 1, 0, 0.05490196, 1,
2.438979, -0.5027574, 2.117611, 1, 0, 0.04705882, 1,
2.468067, -0.604974, 1.424237, 1, 0, 0.04313726, 1,
2.606485, 0.6764176, 1.011588, 1, 0, 0.03529412, 1,
2.618833, 0.9859391, 0.763973, 1, 0, 0.03137255, 1,
2.627524, -1.452094, 1.976181, 1, 0, 0.02352941, 1,
2.726743, -0.6926641, 1.442993, 1, 0, 0.01960784, 1,
2.852761, 0.2641225, 1.270016, 1, 0, 0.01176471, 1,
3.0832, -0.1023423, 0.1146168, 1, 0, 0.007843138, 1
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
0.07500005, -4.287513, -5.991856, 0, -0.5, 0.5, 0.5,
0.07500005, -4.287513, -5.991856, 1, -0.5, 0.5, 0.5,
0.07500005, -4.287513, -5.991856, 1, 1.5, 0.5, 0.5,
0.07500005, -4.287513, -5.991856, 0, 1.5, 0.5, 0.5
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
-3.952979, 0.09998238, -5.991856, 0, -0.5, 0.5, 0.5,
-3.952979, 0.09998238, -5.991856, 1, -0.5, 0.5, 0.5,
-3.952979, 0.09998238, -5.991856, 1, 1.5, 0.5, 0.5,
-3.952979, 0.09998238, -5.991856, 0, 1.5, 0.5, 0.5
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
-3.952979, -4.287513, 0.3395023, 0, -0.5, 0.5, 0.5,
-3.952979, -4.287513, 0.3395023, 1, -0.5, 0.5, 0.5,
-3.952979, -4.287513, 0.3395023, 1, 1.5, 0.5, 0.5,
-3.952979, -4.287513, 0.3395023, 0, 1.5, 0.5, 0.5
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
-2, -3.275014, -4.530773,
3, -3.275014, -4.530773,
-2, -3.275014, -4.530773,
-2, -3.443764, -4.774287,
-1, -3.275014, -4.530773,
-1, -3.443764, -4.774287,
0, -3.275014, -4.530773,
0, -3.443764, -4.774287,
1, -3.275014, -4.530773,
1, -3.443764, -4.774287,
2, -3.275014, -4.530773,
2, -3.443764, -4.774287,
3, -3.275014, -4.530773,
3, -3.443764, -4.774287
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
-2, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
-2, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
-2, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
-2, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5,
-1, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
-1, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
-1, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
-1, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5,
0, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
0, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
0, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
0, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5,
1, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
1, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
1, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
1, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5,
2, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
2, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
2, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
2, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5,
3, -3.781264, -5.261314, 0, -0.5, 0.5, 0.5,
3, -3.781264, -5.261314, 1, -0.5, 0.5, 0.5,
3, -3.781264, -5.261314, 1, 1.5, 0.5, 0.5,
3, -3.781264, -5.261314, 0, 1.5, 0.5, 0.5
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
-3.023446, -3, -4.530773,
-3.023446, 3, -4.530773,
-3.023446, -3, -4.530773,
-3.178368, -3, -4.774287,
-3.023446, -2, -4.530773,
-3.178368, -2, -4.774287,
-3.023446, -1, -4.530773,
-3.178368, -1, -4.774287,
-3.023446, 0, -4.530773,
-3.178368, 0, -4.774287,
-3.023446, 1, -4.530773,
-3.178368, 1, -4.774287,
-3.023446, 2, -4.530773,
-3.178368, 2, -4.774287,
-3.023446, 3, -4.530773,
-3.178368, 3, -4.774287
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
-3.488213, -3, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, -3, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, -3, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, -3, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, -2, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, -2, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, -2, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, -2, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, -1, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, -1, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, -1, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, -1, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, 0, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, 0, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, 0, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, 0, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, 1, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, 1, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, 1, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, 1, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, 2, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, 2, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, 2, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, 2, -5.261314, 0, 1.5, 0.5, 0.5,
-3.488213, 3, -5.261314, 0, -0.5, 0.5, 0.5,
-3.488213, 3, -5.261314, 1, -0.5, 0.5, 0.5,
-3.488213, 3, -5.261314, 1, 1.5, 0.5, 0.5,
-3.488213, 3, -5.261314, 0, 1.5, 0.5, 0.5
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
-3.023446, -3.275014, -4,
-3.023446, -3.275014, 4,
-3.023446, -3.275014, -4,
-3.178368, -3.443764, -4,
-3.023446, -3.275014, -2,
-3.178368, -3.443764, -2,
-3.023446, -3.275014, 0,
-3.178368, -3.443764, 0,
-3.023446, -3.275014, 2,
-3.178368, -3.443764, 2,
-3.023446, -3.275014, 4,
-3.178368, -3.443764, 4
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
-3.488213, -3.781264, -4, 0, -0.5, 0.5, 0.5,
-3.488213, -3.781264, -4, 1, -0.5, 0.5, 0.5,
-3.488213, -3.781264, -4, 1, 1.5, 0.5, 0.5,
-3.488213, -3.781264, -4, 0, 1.5, 0.5, 0.5,
-3.488213, -3.781264, -2, 0, -0.5, 0.5, 0.5,
-3.488213, -3.781264, -2, 1, -0.5, 0.5, 0.5,
-3.488213, -3.781264, -2, 1, 1.5, 0.5, 0.5,
-3.488213, -3.781264, -2, 0, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 0, 0, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 0, 1, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 0, 1, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 0, 0, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 2, 0, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 2, 1, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 2, 1, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 2, 0, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 4, 0, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 4, 1, -0.5, 0.5, 0.5,
-3.488213, -3.781264, 4, 1, 1.5, 0.5, 0.5,
-3.488213, -3.781264, 4, 0, 1.5, 0.5, 0.5
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
-3.023446, -3.275014, -4.530773,
-3.023446, 3.474979, -4.530773,
-3.023446, -3.275014, 5.209778,
-3.023446, 3.474979, 5.209778,
-3.023446, -3.275014, -4.530773,
-3.023446, -3.275014, 5.209778,
-3.023446, 3.474979, -4.530773,
-3.023446, 3.474979, 5.209778,
-3.023446, -3.275014, -4.530773,
3.173446, -3.275014, -4.530773,
-3.023446, -3.275014, 5.209778,
3.173446, -3.275014, 5.209778,
-3.023446, 3.474979, -4.530773,
3.173446, 3.474979, -4.530773,
-3.023446, 3.474979, 5.209778,
3.173446, 3.474979, 5.209778,
3.173446, -3.275014, -4.530773,
3.173446, 3.474979, -4.530773,
3.173446, -3.275014, 5.209778,
3.173446, 3.474979, 5.209778,
3.173446, -3.275014, -4.530773,
3.173446, -3.275014, 5.209778,
3.173446, 3.474979, -4.530773,
3.173446, 3.474979, 5.209778
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
var radius = 7.141023;
var distance = 31.77122;
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
mvMatrix.translate( -0.07500005, -0.09998238, -0.3395023 );
mvMatrix.scale( 1.24595, 1.143855, 0.7926672 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.77122);
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
Polypropylene_glycol<-read.table("Polypropylene_glycol.xyz")
```

```
## Error in read.table("Polypropylene_glycol.xyz"): no lines available in input
```

```r
x<-Polypropylene_glycol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
```

```r
y<-Polypropylene_glycol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
```

```r
z<-Polypropylene_glycol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Polypropylene_glycol' not found
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
-2.9332, 0.1212767, -0.3608856, 0, 0, 1, 1, 1,
-2.927573, 0.366248, -1.311046, 1, 0, 0, 1, 1,
-2.820154, -1.282778, -1.628518, 1, 0, 0, 1, 1,
-2.782539, 2.436564, -0.5250269, 1, 0, 0, 1, 1,
-2.766458, -1.195664, -1.317762, 1, 0, 0, 1, 1,
-2.696191, 0.05253337, -1.588541, 1, 0, 0, 1, 1,
-2.670378, 0.5223091, -1.864949, 0, 0, 0, 1, 1,
-2.642122, -2.1277, -2.179329, 0, 0, 0, 1, 1,
-2.625022, 0.05411592, -2.466988, 0, 0, 0, 1, 1,
-2.593553, 0.1532915, -2.28882, 0, 0, 0, 1, 1,
-2.479981, 1.062985, -2.465354, 0, 0, 0, 1, 1,
-2.466271, 0.0241744, -1.416807, 0, 0, 0, 1, 1,
-2.375363, 0.6924334, -1.193619, 0, 0, 0, 1, 1,
-2.286836, 2.812714, -0.1969052, 1, 1, 1, 1, 1,
-2.204735, -0.8582741, -1.540878, 1, 1, 1, 1, 1,
-2.196072, 3.376678, -0.4393023, 1, 1, 1, 1, 1,
-2.193493, 0.1832073, -1.085106, 1, 1, 1, 1, 1,
-2.190624, 0.2783789, -2.143856, 1, 1, 1, 1, 1,
-2.144769, 0.5766929, -1.283643, 1, 1, 1, 1, 1,
-2.127431, 0.9076007, -1.477155, 1, 1, 1, 1, 1,
-2.086566, 0.4464861, -3.492214, 1, 1, 1, 1, 1,
-2.053716, 0.262238, -3.307423, 1, 1, 1, 1, 1,
-1.999734, -0.4197092, -2.653391, 1, 1, 1, 1, 1,
-1.981725, -1.792327, -4.033811, 1, 1, 1, 1, 1,
-1.980897, 0.8708635, 0.07590672, 1, 1, 1, 1, 1,
-1.97014, 1.282485, -0.5023347, 1, 1, 1, 1, 1,
-1.955322, 1.417214, -2.465726, 1, 1, 1, 1, 1,
-1.953767, -1.226372, -1.944091, 1, 1, 1, 1, 1,
-1.920381, 0.1986177, -2.590023, 0, 0, 1, 1, 1,
-1.913741, 0.5277528, -0.9922919, 1, 0, 0, 1, 1,
-1.87425, -1.14286, 0.1061215, 1, 0, 0, 1, 1,
-1.860467, 1.086807, -0.9735307, 1, 0, 0, 1, 1,
-1.829647, -1.207971, -0.02057081, 1, 0, 0, 1, 1,
-1.823932, 0.9279579, -1.141502, 1, 0, 0, 1, 1,
-1.821465, -0.8598461, -3.766641, 0, 0, 0, 1, 1,
-1.806947, -0.05602309, -2.108804, 0, 0, 0, 1, 1,
-1.794669, 0.5480095, -1.443121, 0, 0, 0, 1, 1,
-1.790646, -0.2919894, -0.815586, 0, 0, 0, 1, 1,
-1.768838, 0.08318498, -1.349882, 0, 0, 0, 1, 1,
-1.767408, -1.023083, -1.93908, 0, 0, 0, 1, 1,
-1.76623, -0.813472, -1.797544, 0, 0, 0, 1, 1,
-1.751409, 0.000571437, -1.286954, 1, 1, 1, 1, 1,
-1.747166, -1.484313, -3.07594, 1, 1, 1, 1, 1,
-1.736935, -0.05313905, -0.8589404, 1, 1, 1, 1, 1,
-1.730728, 1.754699, -1.718056, 1, 1, 1, 1, 1,
-1.728688, -2.203069, -2.418734, 1, 1, 1, 1, 1,
-1.727809, -1.897839, -2.039121, 1, 1, 1, 1, 1,
-1.725893, -2.047126, -1.699018, 1, 1, 1, 1, 1,
-1.71611, -0.9584243, -1.732982, 1, 1, 1, 1, 1,
-1.711986, -1.372877, -2.05369, 1, 1, 1, 1, 1,
-1.700722, -0.2321297, -3.041179, 1, 1, 1, 1, 1,
-1.677859, -1.505812, -3.600221, 1, 1, 1, 1, 1,
-1.666831, 0.2230982, 0.03278373, 1, 1, 1, 1, 1,
-1.65816, -0.2763104, -0.3389093, 1, 1, 1, 1, 1,
-1.658118, 0.03462586, -0.1079292, 1, 1, 1, 1, 1,
-1.657127, -0.896176, -1.768788, 1, 1, 1, 1, 1,
-1.651268, 0.7135817, -0.3710051, 0, 0, 1, 1, 1,
-1.647563, 0.5085829, -1.025485, 1, 0, 0, 1, 1,
-1.624327, 1.482911, -0.238744, 1, 0, 0, 1, 1,
-1.622708, -0.08952501, -0.2254232, 1, 0, 0, 1, 1,
-1.603054, 0.844951, -2.736048, 1, 0, 0, 1, 1,
-1.5858, 1.413006, -0.2452593, 1, 0, 0, 1, 1,
-1.583899, 1.817456, -0.374561, 0, 0, 0, 1, 1,
-1.551366, 1.673431, -0.3108091, 0, 0, 0, 1, 1,
-1.548911, 0.5653842, -1.067785, 0, 0, 0, 1, 1,
-1.548343, -0.1834451, -0.1380303, 0, 0, 0, 1, 1,
-1.531049, 0.6817566, -3.24923, 0, 0, 0, 1, 1,
-1.523404, 0.06500974, -2.656317, 0, 0, 0, 1, 1,
-1.494087, 0.4568495, -1.77921, 0, 0, 0, 1, 1,
-1.471661, 1.125419, -2.472415, 1, 1, 1, 1, 1,
-1.464968, -0.6977736, -0.8971524, 1, 1, 1, 1, 1,
-1.464945, 1.621837, 0.416384, 1, 1, 1, 1, 1,
-1.463069, -1.040188, -1.715188, 1, 1, 1, 1, 1,
-1.462907, 0.9806107, -1.617485, 1, 1, 1, 1, 1,
-1.462745, -0.4869755, -0.9491735, 1, 1, 1, 1, 1,
-1.448671, -1.366472, -3.056949, 1, 1, 1, 1, 1,
-1.447759, 0.581126, -2.223902, 1, 1, 1, 1, 1,
-1.445632, 1.331918, -0.9786928, 1, 1, 1, 1, 1,
-1.443995, -0.2233832, -3.376898, 1, 1, 1, 1, 1,
-1.435375, 0.3926046, -2.004321, 1, 1, 1, 1, 1,
-1.40134, -1.590667, -2.862721, 1, 1, 1, 1, 1,
-1.389765, 0.7891321, -1.919018, 1, 1, 1, 1, 1,
-1.384564, -0.2576314, -0.8133112, 1, 1, 1, 1, 1,
-1.378092, -0.4141703, -3.687537, 1, 1, 1, 1, 1,
-1.373847, 2.353305, -0.9949965, 0, 0, 1, 1, 1,
-1.36954, 0.4680457, -1.911505, 1, 0, 0, 1, 1,
-1.368722, 0.1654177, -0.09915362, 1, 0, 0, 1, 1,
-1.365831, -1.904173, -2.738459, 1, 0, 0, 1, 1,
-1.358576, -1.263408, -0.3433922, 1, 0, 0, 1, 1,
-1.354165, 0.2833028, -2.474495, 1, 0, 0, 1, 1,
-1.347715, -0.5631132, -2.867538, 0, 0, 0, 1, 1,
-1.338385, 1.408729, 0.3205299, 0, 0, 0, 1, 1,
-1.336226, 0.6878879, -0.8810425, 0, 0, 0, 1, 1,
-1.323489, -0.4531458, -1.840711, 0, 0, 0, 1, 1,
-1.315964, -0.4077246, -2.637421, 0, 0, 0, 1, 1,
-1.314569, -2.196646, -2.07772, 0, 0, 0, 1, 1,
-1.310547, 1.606243, 0.3383054, 0, 0, 0, 1, 1,
-1.307295, 0.5341467, -1.853988, 1, 1, 1, 1, 1,
-1.305014, 2.053879, -1.512626, 1, 1, 1, 1, 1,
-1.304341, 0.0142843, -3.799155, 1, 1, 1, 1, 1,
-1.279507, 0.3341402, 2.03679, 1, 1, 1, 1, 1,
-1.273931, -2.042789, -3.005329, 1, 1, 1, 1, 1,
-1.272217, -1.756052, -3.632768, 1, 1, 1, 1, 1,
-1.263034, 0.5333734, -1.26824, 1, 1, 1, 1, 1,
-1.262561, 0.7338958, -0.3789176, 1, 1, 1, 1, 1,
-1.258289, 1.03791, 0.1563366, 1, 1, 1, 1, 1,
-1.252167, 0.118175, -1.088477, 1, 1, 1, 1, 1,
-1.24556, -1.69974, -2.05332, 1, 1, 1, 1, 1,
-1.237869, 1.195063, -0.6439474, 1, 1, 1, 1, 1,
-1.228717, -0.3850971, -2.658942, 1, 1, 1, 1, 1,
-1.200368, -0.8214815, -1.76272, 1, 1, 1, 1, 1,
-1.194268, -0.468904, -1.911562, 1, 1, 1, 1, 1,
-1.186732, 0.3144187, -3.822245, 0, 0, 1, 1, 1,
-1.148611, 1.879793, -1.809782, 1, 0, 0, 1, 1,
-1.146791, 0.2575915, -0.9815378, 1, 0, 0, 1, 1,
-1.140253, 0.3059278, -0.7979546, 1, 0, 0, 1, 1,
-1.138605, 1.281903, -1.410166, 1, 0, 0, 1, 1,
-1.135509, -0.8598389, -2.185096, 1, 0, 0, 1, 1,
-1.135493, -1.325164, -2.598135, 0, 0, 0, 1, 1,
-1.132107, 2.045506, -1.483296, 0, 0, 0, 1, 1,
-1.130946, 0.9700218, -2.396834, 0, 0, 0, 1, 1,
-1.130523, 0.8052897, -0.09044833, 0, 0, 0, 1, 1,
-1.127637, -1.757917, -3.083102, 0, 0, 0, 1, 1,
-1.127412, -0.8382711, -2.897698, 0, 0, 0, 1, 1,
-1.118153, -0.286037, -2.468326, 0, 0, 0, 1, 1,
-1.11633, 0.8263617, -2.236202, 1, 1, 1, 1, 1,
-1.114164, -0.957501, -3.910759, 1, 1, 1, 1, 1,
-1.108922, 0.9887452, -1.791265, 1, 1, 1, 1, 1,
-1.108495, -0.6616725, -1.212894, 1, 1, 1, 1, 1,
-1.105453, 0.4811608, 0.2692968, 1, 1, 1, 1, 1,
-1.100504, -0.009521389, -1.886618, 1, 1, 1, 1, 1,
-1.100076, 0.9590233, -1.176342, 1, 1, 1, 1, 1,
-1.099378, 0.5162259, -0.6213192, 1, 1, 1, 1, 1,
-1.098907, 0.2237089, -2.629187, 1, 1, 1, 1, 1,
-1.096866, -2.178317, -3.338937, 1, 1, 1, 1, 1,
-1.088075, -1.159525, -2.836411, 1, 1, 1, 1, 1,
-1.079721, 0.501605, -2.46921, 1, 1, 1, 1, 1,
-1.078769, -0.07101375, -1.896536, 1, 1, 1, 1, 1,
-1.074217, -1.64798, -2.881387, 1, 1, 1, 1, 1,
-1.05658, -0.152761, -2.332398, 1, 1, 1, 1, 1,
-1.055713, 0.2772409, 0.08029398, 0, 0, 1, 1, 1,
-1.053901, -0.3046418, -2.447352, 1, 0, 0, 1, 1,
-1.049974, 1.342384, -1.311361, 1, 0, 0, 1, 1,
-1.042209, 0.08915232, -2.561177, 1, 0, 0, 1, 1,
-1.040551, -0.475147, -4.325582, 1, 0, 0, 1, 1,
-1.038248, 0.2106605, -3.194395, 1, 0, 0, 1, 1,
-1.033844, 0.2315282, -0.6969857, 0, 0, 0, 1, 1,
-1.033734, -0.1311682, -0.2731156, 0, 0, 0, 1, 1,
-1.028792, 0.171494, -0.4765343, 0, 0, 0, 1, 1,
-1.028734, -0.487423, -2.704092, 0, 0, 0, 1, 1,
-1.028284, -0.4733958, -1.559332, 0, 0, 0, 1, 1,
-1.026869, 0.6176451, -0.5593111, 0, 0, 0, 1, 1,
-1.024879, 1.264001, -1.080174, 0, 0, 0, 1, 1,
-1.022612, -0.2313584, -1.979532, 1, 1, 1, 1, 1,
-1.010646, -1.207085, -1.052908, 1, 1, 1, 1, 1,
-1.010114, -0.8274482, -0.9574239, 1, 1, 1, 1, 1,
-1.008364, 2.855661, -2.934508, 1, 1, 1, 1, 1,
-1.00552, -1.911381, -1.597005, 1, 1, 1, 1, 1,
-1.005352, -0.1360974, -1.067108, 1, 1, 1, 1, 1,
-1.004601, 1.096386, -0.02343324, 1, 1, 1, 1, 1,
-0.9918088, -0.725651, -3.522976, 1, 1, 1, 1, 1,
-0.9869072, -0.8265923, -2.819688, 1, 1, 1, 1, 1,
-0.98678, 0.5701333, -2.53436, 1, 1, 1, 1, 1,
-0.9829163, -0.3930721, -3.419179, 1, 1, 1, 1, 1,
-0.9664957, 1.094258, -1.418643, 1, 1, 1, 1, 1,
-0.9660721, -0.6998188, -2.235547, 1, 1, 1, 1, 1,
-0.9613639, -1.846355, -2.360101, 1, 1, 1, 1, 1,
-0.9592015, -1.092425, -0.8120778, 1, 1, 1, 1, 1,
-0.9571491, 0.1124963, -1.225148, 0, 0, 1, 1, 1,
-0.9455943, 0.5218772, -1.628871, 1, 0, 0, 1, 1,
-0.9451666, 1.57497, -0.5258868, 1, 0, 0, 1, 1,
-0.9428843, -0.02771227, -1.489172, 1, 0, 0, 1, 1,
-0.9355616, -0.6491959, -2.179214, 1, 0, 0, 1, 1,
-0.934824, 1.181341, -2.160048, 1, 0, 0, 1, 1,
-0.9346966, -0.8811527, -1.337101, 0, 0, 0, 1, 1,
-0.9314338, 0.775144, -0.7822086, 0, 0, 0, 1, 1,
-0.9286095, 0.3882137, -1.011879, 0, 0, 0, 1, 1,
-0.9215198, 0.1516727, -1.799772, 0, 0, 0, 1, 1,
-0.9192104, 0.1313781, -0.6398912, 0, 0, 0, 1, 1,
-0.9171881, -0.3905805, -0.4635451, 0, 0, 0, 1, 1,
-0.9157045, -0.1544114, -2.369831, 0, 0, 0, 1, 1,
-0.9144349, 0.6340928, -1.712138, 1, 1, 1, 1, 1,
-0.9076456, -0.2083801, -2.545702, 1, 1, 1, 1, 1,
-0.9041025, 0.4728544, -1.233288, 1, 1, 1, 1, 1,
-0.90177, 1.728333, -0.1738177, 1, 1, 1, 1, 1,
-0.8863242, 0.2487694, -3.578497, 1, 1, 1, 1, 1,
-0.8855392, -0.6918252, -2.107971, 1, 1, 1, 1, 1,
-0.8837804, -0.7191061, -1.965792, 1, 1, 1, 1, 1,
-0.8834127, -0.573996, -1.651509, 1, 1, 1, 1, 1,
-0.8784466, 0.04536409, -2.075706, 1, 1, 1, 1, 1,
-0.8781399, 0.1814509, -0.4768299, 1, 1, 1, 1, 1,
-0.8454283, -0.1100524, -0.9529319, 1, 1, 1, 1, 1,
-0.8442098, -0.552429, -3.837449, 1, 1, 1, 1, 1,
-0.8369452, 0.0878322, -1.379565, 1, 1, 1, 1, 1,
-0.8360742, -0.33566, -1.3188, 1, 1, 1, 1, 1,
-0.8339912, 0.6855259, -0.2457769, 1, 1, 1, 1, 1,
-0.8326338, 1.663081, -0.5396288, 0, 0, 1, 1, 1,
-0.8301828, 0.5846205, -2.717342, 1, 0, 0, 1, 1,
-0.8257879, -1.249958, -3.193236, 1, 0, 0, 1, 1,
-0.8226744, -0.1609142, -1.406271, 1, 0, 0, 1, 1,
-0.8209159, -0.8175421, 0.6226043, 1, 0, 0, 1, 1,
-0.8138786, 0.8419036, 0.9839898, 1, 0, 0, 1, 1,
-0.812596, 0.9996276, -1.80397, 0, 0, 0, 1, 1,
-0.8066204, -0.05254457, -2.646661, 0, 0, 0, 1, 1,
-0.7960114, 1.254159, -0.1535328, 0, 0, 0, 1, 1,
-0.7955869, 1.123262, -1.369099, 0, 0, 0, 1, 1,
-0.7948393, -0.6423477, -1.719247, 0, 0, 0, 1, 1,
-0.7920395, 0.2619716, -2.069748, 0, 0, 0, 1, 1,
-0.7857015, -0.02812405, -2.004436, 0, 0, 0, 1, 1,
-0.7852802, -0.3157812, -3.85868, 1, 1, 1, 1, 1,
-0.7852709, 1.518601, 0.04219629, 1, 1, 1, 1, 1,
-0.7802975, 0.4498246, -2.347426, 1, 1, 1, 1, 1,
-0.7782755, -0.5296127, -1.597326, 1, 1, 1, 1, 1,
-0.7738801, -0.3303479, -2.223368, 1, 1, 1, 1, 1,
-0.7735105, -1.276596, -3.913945, 1, 1, 1, 1, 1,
-0.7729611, -0.1630418, -2.391265, 1, 1, 1, 1, 1,
-0.7721465, -0.8188271, -1.319741, 1, 1, 1, 1, 1,
-0.7718551, -0.1691466, -0.5497444, 1, 1, 1, 1, 1,
-0.7692015, -0.3334158, -3.113803, 1, 1, 1, 1, 1,
-0.7670681, 0.6743193, -1.283923, 1, 1, 1, 1, 1,
-0.7631894, 0.04522714, -1.379637, 1, 1, 1, 1, 1,
-0.7522774, 0.3935788, -0.6336458, 1, 1, 1, 1, 1,
-0.7345753, -0.76017, -1.888181, 1, 1, 1, 1, 1,
-0.7337984, 1.030001, 0.1312426, 1, 1, 1, 1, 1,
-0.7284858, 0.08207195, -2.560835, 0, 0, 1, 1, 1,
-0.7252149, -0.3039928, -1.89595, 1, 0, 0, 1, 1,
-0.7227495, 1.354856, -1.92274, 1, 0, 0, 1, 1,
-0.7158231, 0.8398467, -2.131069, 1, 0, 0, 1, 1,
-0.7149144, -0.812752, -2.447258, 1, 0, 0, 1, 1,
-0.710839, 1.203419, -0.9167789, 1, 0, 0, 1, 1,
-0.7102215, -0.7074288, -3.808753, 0, 0, 0, 1, 1,
-0.7089673, 0.065556, -0.8916793, 0, 0, 0, 1, 1,
-0.7059681, -0.06563087, -1.33378, 0, 0, 0, 1, 1,
-0.7028104, -2.119376, -2.506614, 0, 0, 0, 1, 1,
-0.7012489, 0.9518888, -1.197773, 0, 0, 0, 1, 1,
-0.7000427, -0.498826, -2.532063, 0, 0, 0, 1, 1,
-0.6999005, -0.07752007, 0.1347869, 0, 0, 0, 1, 1,
-0.6998768, -2.354639, -2.042015, 1, 1, 1, 1, 1,
-0.6980048, 0.695475, -1.043929, 1, 1, 1, 1, 1,
-0.695957, -0.9947318, -2.869539, 1, 1, 1, 1, 1,
-0.6917881, 1.268631, -1.298984, 1, 1, 1, 1, 1,
-0.6901249, -0.4169143, -2.258377, 1, 1, 1, 1, 1,
-0.688059, 1.534489, -0.3430844, 1, 1, 1, 1, 1,
-0.6877388, -0.9164071, -2.851162, 1, 1, 1, 1, 1,
-0.6849925, -1.020579, -3.610919, 1, 1, 1, 1, 1,
-0.6823418, 0.4319601, -1.838575, 1, 1, 1, 1, 1,
-0.6774923, 0.2043259, -3.015322, 1, 1, 1, 1, 1,
-0.675498, 0.3150081, -1.282099, 1, 1, 1, 1, 1,
-0.6745968, -2.624464, -1.843141, 1, 1, 1, 1, 1,
-0.6726256, -0.9513739, -3.616836, 1, 1, 1, 1, 1,
-0.6694385, -0.707451, -0.8078938, 1, 1, 1, 1, 1,
-0.6654831, 1.142806, -1.172143, 1, 1, 1, 1, 1,
-0.6573905, 1.210707, -0.3852477, 0, 0, 1, 1, 1,
-0.6542361, -0.6257047, -2.771149, 1, 0, 0, 1, 1,
-0.6515607, 1.53618, -0.05052965, 1, 0, 0, 1, 1,
-0.6502874, 0.5874303, -1.467289, 1, 0, 0, 1, 1,
-0.6458647, 0.03962204, -1.161908, 1, 0, 0, 1, 1,
-0.6410319, 0.3146551, -0.5769399, 1, 0, 0, 1, 1,
-0.6379545, -0.5919792, -0.4373133, 0, 0, 0, 1, 1,
-0.6369922, 0.8304886, -0.2740202, 0, 0, 0, 1, 1,
-0.6307883, -1.026442, -2.901151, 0, 0, 0, 1, 1,
-0.6272722, 0.5394977, 0.02452078, 0, 0, 0, 1, 1,
-0.6238187, 0.3103268, 0.623616, 0, 0, 0, 1, 1,
-0.6139579, 0.06175827, -1.728964, 0, 0, 0, 1, 1,
-0.6127779, 0.3712342, -2.586985, 0, 0, 0, 1, 1,
-0.6126539, -0.4304566, -0.8539619, 1, 1, 1, 1, 1,
-0.6082506, -0.2224443, -1.828586, 1, 1, 1, 1, 1,
-0.6071002, -0.4049513, -1.912951, 1, 1, 1, 1, 1,
-0.6069502, 1.483454, 0.8418068, 1, 1, 1, 1, 1,
-0.6068518, -0.8254138, -2.529895, 1, 1, 1, 1, 1,
-0.6067078, 0.5967466, -0.6042027, 1, 1, 1, 1, 1,
-0.6065042, 0.6397757, -0.4348223, 1, 1, 1, 1, 1,
-0.606469, -0.3404464, -1.423687, 1, 1, 1, 1, 1,
-0.6051396, 0.02785998, -0.6469176, 1, 1, 1, 1, 1,
-0.6038112, -1.720025, -2.376172, 1, 1, 1, 1, 1,
-0.6004909, 1.130371, -0.1176361, 1, 1, 1, 1, 1,
-0.5951693, -0.427538, -2.694168, 1, 1, 1, 1, 1,
-0.5936909, 0.6601055, -0.399952, 1, 1, 1, 1, 1,
-0.593657, 1.05461, 0.3414261, 1, 1, 1, 1, 1,
-0.5865272, -0.1757465, -2.892421, 1, 1, 1, 1, 1,
-0.5861619, 0.3789249, -1.717303, 0, 0, 1, 1, 1,
-0.5785629, 0.2493272, -1.958672, 1, 0, 0, 1, 1,
-0.5712618, 0.4238274, -2.0267, 1, 0, 0, 1, 1,
-0.5671992, 0.956344, -0.3287924, 1, 0, 0, 1, 1,
-0.5604811, 0.557409, -0.3879822, 1, 0, 0, 1, 1,
-0.560046, -0.8044032, -3.462359, 1, 0, 0, 1, 1,
-0.5542886, -0.5730701, -1.191908, 0, 0, 0, 1, 1,
-0.5532922, 0.2708335, -2.139535, 0, 0, 0, 1, 1,
-0.5503656, -0.2299107, -2.769112, 0, 0, 0, 1, 1,
-0.5478737, 0.3122759, -1.278914, 0, 0, 0, 1, 1,
-0.5468183, -1.252403, -2.900261, 0, 0, 0, 1, 1,
-0.5440198, -0.01366588, -1.137592, 0, 0, 0, 1, 1,
-0.5338602, -0.02879407, -2.427858, 0, 0, 0, 1, 1,
-0.5317557, 0.5534203, -1.541711, 1, 1, 1, 1, 1,
-0.5230086, 0.7961743, 0.2967412, 1, 1, 1, 1, 1,
-0.5228178, 0.2832955, 0.3915108, 1, 1, 1, 1, 1,
-0.5219976, -0.4742622, -1.16651, 1, 1, 1, 1, 1,
-0.5188468, 0.6243999, -0.2904578, 1, 1, 1, 1, 1,
-0.5181764, -0.5963693, -3.717121, 1, 1, 1, 1, 1,
-0.5179428, -3.176713, -3.307356, 1, 1, 1, 1, 1,
-0.5107197, 0.05396334, -3.098882, 1, 1, 1, 1, 1,
-0.5071622, 0.6934565, 0.8747364, 1, 1, 1, 1, 1,
-0.5056175, -0.08832601, -2.327573, 1, 1, 1, 1, 1,
-0.5047364, 1.072496, 1.855092, 1, 1, 1, 1, 1,
-0.4999153, 0.7342864, 1.219383, 1, 1, 1, 1, 1,
-0.4973902, -0.2937877, -2.820919, 1, 1, 1, 1, 1,
-0.4932638, -1.653523, -2.460815, 1, 1, 1, 1, 1,
-0.483675, -0.5977563, -2.127342, 1, 1, 1, 1, 1,
-0.4797257, 0.03115207, 0.4003404, 0, 0, 1, 1, 1,
-0.4780823, 0.2502531, -1.278135, 1, 0, 0, 1, 1,
-0.4750162, -0.02982697, -3.372528, 1, 0, 0, 1, 1,
-0.47315, 0.5115845, -1.612515, 1, 0, 0, 1, 1,
-0.4671867, -0.4021608, -0.8350057, 1, 0, 0, 1, 1,
-0.4617846, -1.141489, -2.252073, 1, 0, 0, 1, 1,
-0.4594149, -0.5587433, -3.006677, 0, 0, 0, 1, 1,
-0.4593891, 0.3414415, -0.9623297, 0, 0, 0, 1, 1,
-0.4577703, 1.480008, -3.459568, 0, 0, 0, 1, 1,
-0.4576113, -0.9486484, -2.573793, 0, 0, 0, 1, 1,
-0.4571226, -2.092534, -3.723305, 0, 0, 0, 1, 1,
-0.4545221, 0.01587774, -2.575346, 0, 0, 0, 1, 1,
-0.4538811, -2.079737, -3.474284, 0, 0, 0, 1, 1,
-0.4538744, -0.8685335, -3.033524, 1, 1, 1, 1, 1,
-0.4506293, -0.5396746, -2.74839, 1, 1, 1, 1, 1,
-0.4502223, 0.6620406, -1.062956, 1, 1, 1, 1, 1,
-0.4489094, -0.959009, -3.3582, 1, 1, 1, 1, 1,
-0.4460482, 0.556267, -1.093216, 1, 1, 1, 1, 1,
-0.4407214, 0.5693843, -1.880452, 1, 1, 1, 1, 1,
-0.4402461, 2.735753, -0.8963793, 1, 1, 1, 1, 1,
-0.4395726, 0.1408491, -0.216859, 1, 1, 1, 1, 1,
-0.4332796, -0.0494803, -2.575948, 1, 1, 1, 1, 1,
-0.4329297, -0.7513791, -1.383755, 1, 1, 1, 1, 1,
-0.4310066, 0.3426884, -1.416066, 1, 1, 1, 1, 1,
-0.4173434, 0.2129924, -0.7151426, 1, 1, 1, 1, 1,
-0.4172826, 0.3056441, 0.07808756, 1, 1, 1, 1, 1,
-0.4125325, -1.472262, -0.5767956, 1, 1, 1, 1, 1,
-0.4047253, 0.5678462, -1.303532, 1, 1, 1, 1, 1,
-0.4043328, -1.004112, -2.564887, 0, 0, 1, 1, 1,
-0.4040233, 0.1012903, 0.9562658, 1, 0, 0, 1, 1,
-0.4027908, 0.3237326, -0.7844911, 1, 0, 0, 1, 1,
-0.4006596, 2.713332, -0.2674209, 1, 0, 0, 1, 1,
-0.4006039, -1.003245, -4.092962, 1, 0, 0, 1, 1,
-0.4003437, 0.346516, -0.01915757, 1, 0, 0, 1, 1,
-0.4000162, -1.152525, -1.472964, 0, 0, 0, 1, 1,
-0.3989963, -0.02569997, -0.9367334, 0, 0, 0, 1, 1,
-0.3963086, -0.5074409, -3.244331, 0, 0, 0, 1, 1,
-0.3952256, -0.6282126, -2.341451, 0, 0, 0, 1, 1,
-0.3948973, -0.8653562, -1.173265, 0, 0, 0, 1, 1,
-0.3936457, 0.5630439, -2.136589, 0, 0, 0, 1, 1,
-0.3921601, 0.6693249, -1.238051, 0, 0, 0, 1, 1,
-0.3847786, -0.1862074, -1.726641, 1, 1, 1, 1, 1,
-0.3846659, -0.9331332, -3.041006, 1, 1, 1, 1, 1,
-0.3831536, -1.593044, -2.709071, 1, 1, 1, 1, 1,
-0.3830514, -0.7984852, -4.38892, 1, 1, 1, 1, 1,
-0.3809275, -0.1466395, -3.040934, 1, 1, 1, 1, 1,
-0.379249, 0.04452363, -1.808992, 1, 1, 1, 1, 1,
-0.3791693, -0.8942682, -3.816071, 1, 1, 1, 1, 1,
-0.3786502, 0.4424513, -0.4912413, 1, 1, 1, 1, 1,
-0.3768796, -0.9151371, -1.775233, 1, 1, 1, 1, 1,
-0.3730898, 1.757433, -0.976152, 1, 1, 1, 1, 1,
-0.3719245, 0.8970871, 0.5709461, 1, 1, 1, 1, 1,
-0.3710071, -0.4690193, -3.415854, 1, 1, 1, 1, 1,
-0.3686079, 1.169141, 1.527377, 1, 1, 1, 1, 1,
-0.3677288, -0.2844426, -2.938588, 1, 1, 1, 1, 1,
-0.3651982, 0.5812516, -0.2585452, 1, 1, 1, 1, 1,
-0.3618782, 1.309689, 0.3105176, 0, 0, 1, 1, 1,
-0.3583231, 0.8488486, -1.67467, 1, 0, 0, 1, 1,
-0.3579451, -0.1212798, -2.105995, 1, 0, 0, 1, 1,
-0.3533345, 0.05039392, -1.287984, 1, 0, 0, 1, 1,
-0.3465792, -0.7600579, -2.690585, 1, 0, 0, 1, 1,
-0.3435833, 1.635606, 0.15266, 1, 0, 0, 1, 1,
-0.3426271, -0.947676, -2.033904, 0, 0, 0, 1, 1,
-0.3401346, -1.548904, -4.314074, 0, 0, 0, 1, 1,
-0.339154, -2.223976, -3.955611, 0, 0, 0, 1, 1,
-0.3354855, -1.710034, -1.507174, 0, 0, 0, 1, 1,
-0.3325268, 0.058438, -1.197185, 0, 0, 0, 1, 1,
-0.3323839, -0.106538, -2.099143, 0, 0, 0, 1, 1,
-0.3308077, -0.8749279, -2.231633, 0, 0, 0, 1, 1,
-0.3273836, 0.3252286, -1.825006, 1, 1, 1, 1, 1,
-0.326259, -1.577186, -1.246811, 1, 1, 1, 1, 1,
-0.3233874, 0.7453438, 0.2644916, 1, 1, 1, 1, 1,
-0.3214958, -0.5026213, -3.461703, 1, 1, 1, 1, 1,
-0.3180463, 1.004849, -0.6456373, 1, 1, 1, 1, 1,
-0.3178328, -0.4967078, -1.925597, 1, 1, 1, 1, 1,
-0.3171865, 1.084162, -0.267334, 1, 1, 1, 1, 1,
-0.3155799, -0.8783712, -2.735298, 1, 1, 1, 1, 1,
-0.3149491, -1.0556, -3.023444, 1, 1, 1, 1, 1,
-0.3069284, 0.1208581, -1.5389, 1, 1, 1, 1, 1,
-0.3064656, 0.5668429, 0.7148001, 1, 1, 1, 1, 1,
-0.2923709, 1.21706, 0.9748448, 1, 1, 1, 1, 1,
-0.291395, 0.09213074, -1.314856, 1, 1, 1, 1, 1,
-0.2901912, 0.8983983, 1.390794, 1, 1, 1, 1, 1,
-0.2896279, -0.9065976, -3.275547, 1, 1, 1, 1, 1,
-0.2894252, -1.639127, -2.718283, 0, 0, 1, 1, 1,
-0.2705485, -0.6830123, -2.726091, 1, 0, 0, 1, 1,
-0.264115, -0.4627816, -3.786667, 1, 0, 0, 1, 1,
-0.2629613, 1.785568, -0.7958775, 1, 0, 0, 1, 1,
-0.2609951, 1.211048, 0.9048747, 1, 0, 0, 1, 1,
-0.2598687, 1.21413, -0.09060477, 1, 0, 0, 1, 1,
-0.2525583, -0.504143, -4.283053, 0, 0, 0, 1, 1,
-0.251946, -0.05831218, -2.603472, 0, 0, 0, 1, 1,
-0.2510189, -1.252495, -2.024821, 0, 0, 0, 1, 1,
-0.2441083, 0.7667691, 0.647541, 0, 0, 0, 1, 1,
-0.2422202, 0.9786885, -0.7374744, 0, 0, 0, 1, 1,
-0.2400329, -0.7435915, -1.489821, 0, 0, 0, 1, 1,
-0.2352237, -0.6803931, -3.500073, 0, 0, 0, 1, 1,
-0.2326917, 0.5241228, 0.3532283, 1, 1, 1, 1, 1,
-0.2279864, -1.394471, -3.283406, 1, 1, 1, 1, 1,
-0.2278591, 1.20109, -0.03030386, 1, 1, 1, 1, 1,
-0.2275725, -0.04822022, -1.254081, 1, 1, 1, 1, 1,
-0.2264562, -0.1478314, -1.511595, 1, 1, 1, 1, 1,
-0.2213214, -0.04199524, -2.683967, 1, 1, 1, 1, 1,
-0.2208065, -1.323399, -2.722077, 1, 1, 1, 1, 1,
-0.2206156, -0.6567277, -2.225263, 1, 1, 1, 1, 1,
-0.2111528, -0.1154288, -2.058985, 1, 1, 1, 1, 1,
-0.2108178, -0.6836976, -2.347786, 1, 1, 1, 1, 1,
-0.2038978, 0.4589737, 1.091028, 1, 1, 1, 1, 1,
-0.2032436, -2.375036, -4.182424, 1, 1, 1, 1, 1,
-0.2027221, -0.1892415, -2.468173, 1, 1, 1, 1, 1,
-0.2026871, -0.05675607, -2.710404, 1, 1, 1, 1, 1,
-0.1890566, -1.27257, -4.071442, 1, 1, 1, 1, 1,
-0.1885517, -0.254377, -2.228532, 0, 0, 1, 1, 1,
-0.1884059, 0.2739458, -1.609513, 1, 0, 0, 1, 1,
-0.1851654, 0.7380085, -1.833327, 1, 0, 0, 1, 1,
-0.1821649, 1.62171, 0.2799629, 1, 0, 0, 1, 1,
-0.1809002, 0.6619512, -0.393934, 1, 0, 0, 1, 1,
-0.1786682, 0.4353891, -0.6302045, 1, 0, 0, 1, 1,
-0.1762634, -2.112957, -3.047009, 0, 0, 0, 1, 1,
-0.1742584, 1.106833, 0.4522839, 0, 0, 0, 1, 1,
-0.1713142, -0.1083817, -2.613939, 0, 0, 0, 1, 1,
-0.1700324, -2.128872, -2.085167, 0, 0, 0, 1, 1,
-0.1667675, -0.6005651, -3.137439, 0, 0, 0, 1, 1,
-0.1659157, -1.173607, -3.086103, 0, 0, 0, 1, 1,
-0.1634131, 0.05201345, -2.508807, 0, 0, 0, 1, 1,
-0.1619616, -0.7038105, -3.021364, 1, 1, 1, 1, 1,
-0.1616076, -0.6184946, -3.064767, 1, 1, 1, 1, 1,
-0.1596875, 0.124631, -1.642519, 1, 1, 1, 1, 1,
-0.1573703, 1.384452, -0.4043032, 1, 1, 1, 1, 1,
-0.1571129, 0.161744, 0.7912269, 1, 1, 1, 1, 1,
-0.155094, 0.2983683, 0.8999795, 1, 1, 1, 1, 1,
-0.1540452, -0.5634685, -2.459287, 1, 1, 1, 1, 1,
-0.1527112, 1.184924, -0.5246203, 1, 1, 1, 1, 1,
-0.1478993, 0.6254657, -0.371198, 1, 1, 1, 1, 1,
-0.1465243, 0.4205512, 0.8476143, 1, 1, 1, 1, 1,
-0.1432429, -0.8383069, -1.970366, 1, 1, 1, 1, 1,
-0.1424564, 0.5326152, -0.4375779, 1, 1, 1, 1, 1,
-0.1345515, 0.0791638, -1.139421, 1, 1, 1, 1, 1,
-0.1306071, 1.704113, -0.03310381, 1, 1, 1, 1, 1,
-0.1275455, 0.1805188, -0.7539486, 1, 1, 1, 1, 1,
-0.1246416, 0.5127106, -0.2237281, 0, 0, 1, 1, 1,
-0.1240318, -0.443115, -1.566143, 1, 0, 0, 1, 1,
-0.1222987, 1.022362, -0.7735309, 1, 0, 0, 1, 1,
-0.1199133, -0.003155802, -0.6234444, 1, 0, 0, 1, 1,
-0.1175897, 0.7199698, -1.382834, 1, 0, 0, 1, 1,
-0.1174145, -0.5990244, -4.335066, 1, 0, 0, 1, 1,
-0.1161677, 0.2151062, -0.2130816, 0, 0, 0, 1, 1,
-0.1133933, -1.11207, -3.951877, 0, 0, 0, 1, 1,
-0.1133645, -1.230202, -1.548891, 0, 0, 0, 1, 1,
-0.1098663, 2.037205, -0.2592855, 0, 0, 0, 1, 1,
-0.1072121, 0.05698089, -0.3416359, 0, 0, 0, 1, 1,
-0.1072091, 1.36649, -0.6880782, 0, 0, 0, 1, 1,
-0.09948128, -0.7069127, -3.679085, 0, 0, 0, 1, 1,
-0.0977775, 2.051578, 0.7490557, 1, 1, 1, 1, 1,
-0.09641768, -0.3910246, -3.935756, 1, 1, 1, 1, 1,
-0.09294008, 0.1896827, 0.1098419, 1, 1, 1, 1, 1,
-0.09262861, -0.009244451, -0.629737, 1, 1, 1, 1, 1,
-0.08927351, 0.4523388, -0.3490318, 1, 1, 1, 1, 1,
-0.08294433, -0.09273835, -2.632487, 1, 1, 1, 1, 1,
-0.08245038, 0.9400037, -0.4867811, 1, 1, 1, 1, 1,
-0.08054535, 0.1788022, -0.7615432, 1, 1, 1, 1, 1,
-0.07846941, -0.1466795, -3.478028, 1, 1, 1, 1, 1,
-0.07676493, -0.2729847, -2.823703, 1, 1, 1, 1, 1,
-0.0749685, 0.4456051, 0.9752169, 1, 1, 1, 1, 1,
-0.07349139, -0.4959347, -2.31412, 1, 1, 1, 1, 1,
-0.07185625, 0.220976, 0.7854359, 1, 1, 1, 1, 1,
-0.07128458, 0.2237248, -0.4413563, 1, 1, 1, 1, 1,
-0.06764533, -0.3799922, -2.306829, 1, 1, 1, 1, 1,
-0.06641014, -0.4993235, -3.290407, 0, 0, 1, 1, 1,
-0.06425182, -0.7627798, -3.16874, 1, 0, 0, 1, 1,
-0.06204917, 2.206155, -1.027951, 1, 0, 0, 1, 1,
-0.06124402, 0.8700906, 1.611246, 1, 0, 0, 1, 1,
-0.04993092, -0.3503228, -3.712986, 1, 0, 0, 1, 1,
-0.04641955, -0.2140645, -3.529979, 1, 0, 0, 1, 1,
-0.04202193, 0.09253034, -0.25499, 0, 0, 0, 1, 1,
-0.04154643, -1.069906, -2.968737, 0, 0, 0, 1, 1,
-0.04153415, -0.1824257, -1.906113, 0, 0, 0, 1, 1,
-0.04132405, -0.1496393, -3.437726, 0, 0, 0, 1, 1,
-0.04036753, -0.8022339, -1.616832, 0, 0, 0, 1, 1,
-0.03820142, 0.8023968, -0.05638291, 0, 0, 0, 1, 1,
-0.03753915, 1.108901, 0.5122782, 0, 0, 0, 1, 1,
-0.03579124, -2.07143, -1.022387, 1, 1, 1, 1, 1,
-0.03175601, -0.4909743, -2.714608, 1, 1, 1, 1, 1,
-0.03123732, -0.2550336, -4.133245, 1, 1, 1, 1, 1,
-0.02622359, 1.512043, 0.5106871, 1, 1, 1, 1, 1,
-0.02529055, -0.4123015, -2.943067, 1, 1, 1, 1, 1,
-0.02468429, -0.4511668, -1.689984, 1, 1, 1, 1, 1,
-0.02270532, 0.1276401, -0.2225828, 1, 1, 1, 1, 1,
-0.02061051, -0.6817316, -2.931659, 1, 1, 1, 1, 1,
-0.02039408, 1.074129, -0.4353597, 1, 1, 1, 1, 1,
-0.02014804, 0.06099247, 1.234796, 1, 1, 1, 1, 1,
-0.01962235, -0.1449113, -1.752904, 1, 1, 1, 1, 1,
-0.0174525, 0.05993075, 2.190071, 1, 1, 1, 1, 1,
-0.01669316, -1.839388, -2.589358, 1, 1, 1, 1, 1,
-0.01644676, -1.446065, -3.006062, 1, 1, 1, 1, 1,
-0.01610704, 0.1587787, 0.215243, 1, 1, 1, 1, 1,
-0.01508994, -0.3495674, -2.514749, 0, 0, 1, 1, 1,
-0.01460108, 0.8528571, -1.540367, 1, 0, 0, 1, 1,
-0.01411248, -1.171388, -2.67912, 1, 0, 0, 1, 1,
-0.01342214, -0.7537295, -4.275003, 1, 0, 0, 1, 1,
-0.01284864, 0.4995644, 0.1862703, 1, 0, 0, 1, 1,
-0.01157528, -0.3414326, -3.794384, 1, 0, 0, 1, 1,
-0.00728157, 1.037665, -1.040586, 0, 0, 0, 1, 1,
-0.006643987, 1.846681, 1.441494, 0, 0, 0, 1, 1,
-0.003791445, 1.217058, -0.2592364, 0, 0, 0, 1, 1,
-0.002918717, 0.9396923, 0.001703322, 0, 0, 0, 1, 1,
0.003579622, -0.7089853, 2.509602, 0, 0, 0, 1, 1,
0.00393424, -1.524225, 3.741611, 0, 0, 0, 1, 1,
0.005657522, 0.1415106, -0.5938727, 0, 0, 0, 1, 1,
0.006906625, -1.237803, 3.507842, 1, 1, 1, 1, 1,
0.007310845, 1.108755, 1.001296, 1, 1, 1, 1, 1,
0.0084198, 1.479401, -0.787735, 1, 1, 1, 1, 1,
0.01036785, 0.5608151, -1.176707, 1, 1, 1, 1, 1,
0.01375136, 0.8341112, -1.093565, 1, 1, 1, 1, 1,
0.01428869, 0.9147683, -1.43838, 1, 1, 1, 1, 1,
0.01987183, 0.1093441, 1.387142, 1, 1, 1, 1, 1,
0.02137988, 0.9270285, 0.8286775, 1, 1, 1, 1, 1,
0.02153543, 0.06484701, -0.1671131, 1, 1, 1, 1, 1,
0.02442915, -2.467045, 4.393991, 1, 1, 1, 1, 1,
0.02645448, 1.099913, -0.1605667, 1, 1, 1, 1, 1,
0.02770204, -1.42326, 2.994591, 1, 1, 1, 1, 1,
0.03245079, 0.6981768, 0.3481896, 1, 1, 1, 1, 1,
0.03673928, 0.6243642, 2.943257, 1, 1, 1, 1, 1,
0.03772275, -0.4376591, 2.126141, 1, 1, 1, 1, 1,
0.03796166, -1.088232, 1.769086, 0, 0, 1, 1, 1,
0.04532854, -1.356288, 1.61166, 1, 0, 0, 1, 1,
0.04553305, -0.4338947, 3.06375, 1, 0, 0, 1, 1,
0.04603089, -1.900832, 2.397902, 1, 0, 0, 1, 1,
0.04726181, 0.5616816, -0.5230571, 1, 0, 0, 1, 1,
0.04770618, 1.274766, 1.019171, 1, 0, 0, 1, 1,
0.0491066, -0.06154316, 3.189433, 0, 0, 0, 1, 1,
0.0498657, -1.531478, 2.787994, 0, 0, 0, 1, 1,
0.05174142, -0.2108559, 2.436073, 0, 0, 0, 1, 1,
0.05427746, -0.5128624, 2.785143, 0, 0, 0, 1, 1,
0.0547202, -0.5067493, 2.490835, 0, 0, 0, 1, 1,
0.05690784, -0.8793924, 1.803035, 0, 0, 0, 1, 1,
0.05706925, -0.1574271, 3.691656, 0, 0, 0, 1, 1,
0.05755058, 0.6376531, -1.926604, 1, 1, 1, 1, 1,
0.05867231, -0.2774827, 3.156436, 1, 1, 1, 1, 1,
0.06124028, 1.611316, 1.25197, 1, 1, 1, 1, 1,
0.0627676, 0.03308975, -0.3078439, 1, 1, 1, 1, 1,
0.06328933, 1.389671, -1.323985, 1, 1, 1, 1, 1,
0.06710228, -0.1754147, 3.064644, 1, 1, 1, 1, 1,
0.07079254, 0.6086484, -1.181668, 1, 1, 1, 1, 1,
0.07363862, 0.8880703, 0.1254853, 1, 1, 1, 1, 1,
0.07410278, -0.008926642, 1.30682, 1, 1, 1, 1, 1,
0.08437097, -0.295123, 3.704691, 1, 1, 1, 1, 1,
0.08721295, -1.097592, 2.855298, 1, 1, 1, 1, 1,
0.08781253, 0.1681313, 1.409904, 1, 1, 1, 1, 1,
0.09050707, 0.2729754, 0.8199165, 1, 1, 1, 1, 1,
0.09107672, 0.2173877, 0.9786776, 1, 1, 1, 1, 1,
0.09184545, 0.3552526, 0.2308258, 1, 1, 1, 1, 1,
0.09296126, -1.062941, 4.191165, 0, 0, 1, 1, 1,
0.09727453, 0.6264843, 0.03443082, 1, 0, 0, 1, 1,
0.09900961, 1.223346, 0.6155908, 1, 0, 0, 1, 1,
0.1006545, 0.5640165, 0.292287, 1, 0, 0, 1, 1,
0.1015824, -0.04524936, 2.004228, 1, 0, 0, 1, 1,
0.1034417, 0.2481403, 0.9469615, 1, 0, 0, 1, 1,
0.1042348, 0.6975306, -1.783564, 0, 0, 0, 1, 1,
0.1098181, -0.6589961, 4.167677, 0, 0, 0, 1, 1,
0.113954, 0.196556, 0.6893383, 0, 0, 0, 1, 1,
0.1158141, -0.09517407, 1.775209, 0, 0, 0, 1, 1,
0.1175387, 0.1524735, 0.247037, 0, 0, 0, 1, 1,
0.1188053, 0.8750502, 0.6498752, 0, 0, 0, 1, 1,
0.122147, -0.7232819, 1.516206, 0, 0, 0, 1, 1,
0.1238994, -1.442302, 4.395388, 1, 1, 1, 1, 1,
0.1252831, 1.49949, 0.1242863, 1, 1, 1, 1, 1,
0.127053, -2.569145, 3.152065, 1, 1, 1, 1, 1,
0.1287865, -1.776753, 3.880515, 1, 1, 1, 1, 1,
0.1375294, 0.4661064, -1.739763, 1, 1, 1, 1, 1,
0.1390411, 0.5077354, 1.700738, 1, 1, 1, 1, 1,
0.142938, 0.1218075, 0.4525422, 1, 1, 1, 1, 1,
0.1440009, -0.9278699, 4.891879, 1, 1, 1, 1, 1,
0.1517207, -0.5832011, 4.115126, 1, 1, 1, 1, 1,
0.1519764, 1.301688, 0.5914077, 1, 1, 1, 1, 1,
0.154014, 1.371357, -0.3160838, 1, 1, 1, 1, 1,
0.1568691, 0.5687073, 1.266171, 1, 1, 1, 1, 1,
0.1611141, -0.1145432, 2.180216, 1, 1, 1, 1, 1,
0.1632753, -0.1437663, 2.108175, 1, 1, 1, 1, 1,
0.1636466, -0.6314145, 2.318049, 1, 1, 1, 1, 1,
0.1669107, 1.098787, 0.1366203, 0, 0, 1, 1, 1,
0.173363, 0.8484359, -0.456271, 1, 0, 0, 1, 1,
0.186314, -0.6857558, 2.921776, 1, 0, 0, 1, 1,
0.1914242, -0.7081656, 3.493898, 1, 0, 0, 1, 1,
0.1921998, -0.4147293, 2.459754, 1, 0, 0, 1, 1,
0.1931909, -0.04012967, 2.573128, 1, 0, 0, 1, 1,
0.1944937, 0.8219987, 1.111803, 0, 0, 0, 1, 1,
0.1945894, -0.3786624, 3.591162, 0, 0, 0, 1, 1,
0.1981804, 1.132153, 0.1607701, 0, 0, 0, 1, 1,
0.2003906, -0.5969031, 1.426377, 0, 0, 0, 1, 1,
0.2010961, 0.6336309, 0.4146717, 0, 0, 0, 1, 1,
0.2068879, -0.7193635, 5.067078, 0, 0, 0, 1, 1,
0.2087495, -0.9450428, 3.016196, 0, 0, 0, 1, 1,
0.2131227, 0.9947577, 1.046895, 1, 1, 1, 1, 1,
0.2135245, -2.326203, 3.630027, 1, 1, 1, 1, 1,
0.2168666, -1.180438, 2.638113, 1, 1, 1, 1, 1,
0.2198633, -1.70525, 4.953088, 1, 1, 1, 1, 1,
0.2212364, -0.8282217, 4.144312, 1, 1, 1, 1, 1,
0.2222507, 1.131291, -1.231471, 1, 1, 1, 1, 1,
0.2252356, 0.07302162, 0.9037771, 1, 1, 1, 1, 1,
0.2255757, 0.3056391, -0.5418153, 1, 1, 1, 1, 1,
0.2302605, -0.02787624, 1.207575, 1, 1, 1, 1, 1,
0.2318065, 0.2516326, 0.7718267, 1, 1, 1, 1, 1,
0.2359607, 0.002824183, 2.569503, 1, 1, 1, 1, 1,
0.2363591, -1.216132, 1.621048, 1, 1, 1, 1, 1,
0.243628, 0.04041823, 0.6838673, 1, 1, 1, 1, 1,
0.2438507, 1.051723, 1.109777, 1, 1, 1, 1, 1,
0.2451596, 0.01137709, 1.234724, 1, 1, 1, 1, 1,
0.2457819, -0.2970882, 1.947499, 0, 0, 1, 1, 1,
0.2468639, 0.1600605, 0.9226856, 1, 0, 0, 1, 1,
0.2469282, -0.1215028, 4.964094, 1, 0, 0, 1, 1,
0.2491476, 1.732421, -0.4846547, 1, 0, 0, 1, 1,
0.2505437, -1.247234, 2.000901, 1, 0, 0, 1, 1,
0.2507644, 1.4593, -0.5053543, 1, 0, 0, 1, 1,
0.2552459, 1.021345, -0.02680639, 0, 0, 0, 1, 1,
0.255466, 1.43565, 1.206798, 0, 0, 0, 1, 1,
0.2555093, 0.18469, 0.8854542, 0, 0, 0, 1, 1,
0.2587944, -0.2335949, 2.375588, 0, 0, 0, 1, 1,
0.2598466, 0.06674287, 0.8092912, 0, 0, 0, 1, 1,
0.2653781, 2.108974, -1.453334, 0, 0, 0, 1, 1,
0.2703424, 0.9021499, 1.738841, 0, 0, 0, 1, 1,
0.2722059, -1.56482, 3.934219, 1, 1, 1, 1, 1,
0.2764135, -0.1584424, 2.296759, 1, 1, 1, 1, 1,
0.2770297, 1.436162, -0.09689596, 1, 1, 1, 1, 1,
0.2803744, 1.757894, 0.370731, 1, 1, 1, 1, 1,
0.2805338, -1.383549, 2.995721, 1, 1, 1, 1, 1,
0.2823042, -2.222272, 2.574847, 1, 1, 1, 1, 1,
0.2857004, -0.9669871, 1.347689, 1, 1, 1, 1, 1,
0.2872762, 0.4917233, 0.9474698, 1, 1, 1, 1, 1,
0.2888344, 1.705898, 0.4212123, 1, 1, 1, 1, 1,
0.2906565, 0.319737, 0.3675448, 1, 1, 1, 1, 1,
0.296661, 0.4080294, 0.7373713, 1, 1, 1, 1, 1,
0.2986063, 0.2158219, -0.8935123, 1, 1, 1, 1, 1,
0.3031385, 0.6260129, 0.6646391, 1, 1, 1, 1, 1,
0.303166, 0.7369719, 0.1543537, 1, 1, 1, 1, 1,
0.3066975, 0.6304429, 0.5060304, 1, 1, 1, 1, 1,
0.3068401, -0.8427929, 2.809353, 0, 0, 1, 1, 1,
0.3089031, 0.8455592, -0.4138381, 1, 0, 0, 1, 1,
0.3102765, -0.4782522, 1.303634, 1, 0, 0, 1, 1,
0.310854, -0.193873, 1.971135, 1, 0, 0, 1, 1,
0.3139424, -0.6570098, 3.459709, 1, 0, 0, 1, 1,
0.3173993, -0.2169746, 1.46207, 1, 0, 0, 1, 1,
0.3180603, 1.268709, 0.3289183, 0, 0, 0, 1, 1,
0.3187791, -1.719596, 3.943634, 0, 0, 0, 1, 1,
0.3211735, -0.5871003, 1.314781, 0, 0, 0, 1, 1,
0.3283031, -0.963475, 3.287088, 0, 0, 0, 1, 1,
0.3301712, -0.2652085, 2.866802, 0, 0, 0, 1, 1,
0.338745, 0.003147732, 2.015226, 0, 0, 0, 1, 1,
0.3409194, -0.3155368, 2.618547, 0, 0, 0, 1, 1,
0.346744, -0.5795795, 2.547588, 1, 1, 1, 1, 1,
0.3497187, 1.092069, 1.473996, 1, 1, 1, 1, 1,
0.3510346, 0.7356426, -0.4798843, 1, 1, 1, 1, 1,
0.3562878, 0.04575275, 3.186018, 1, 1, 1, 1, 1,
0.3571159, 0.07408389, 0.7011325, 1, 1, 1, 1, 1,
0.3655634, 0.4398638, 0.02068334, 1, 1, 1, 1, 1,
0.3662663, -0.6924972, 2.451126, 1, 1, 1, 1, 1,
0.3679602, 1.456809, 0.7695239, 1, 1, 1, 1, 1,
0.3744457, -1.699034, 1.681437, 1, 1, 1, 1, 1,
0.3794548, -0.5733387, 3.233015, 1, 1, 1, 1, 1,
0.3851111, 1.166527, -0.1610988, 1, 1, 1, 1, 1,
0.3859476, -0.4275197, 2.075752, 1, 1, 1, 1, 1,
0.3870721, 1.220132, -1.09098, 1, 1, 1, 1, 1,
0.3912958, 0.7354913, 2.082118, 1, 1, 1, 1, 1,
0.3916345, 1.148301, 1.435349, 1, 1, 1, 1, 1,
0.3918078, -0.8601247, 2.347352, 0, 0, 1, 1, 1,
0.3922747, -1.052913, 3.587811, 1, 0, 0, 1, 1,
0.3948051, 0.9543526, 1.192765, 1, 0, 0, 1, 1,
0.3973544, -0.8525827, 1.303938, 1, 0, 0, 1, 1,
0.399014, 0.3979059, 0.8039771, 1, 0, 0, 1, 1,
0.4000218, 0.4822475, 0.2456442, 1, 0, 0, 1, 1,
0.4076171, -1.465586, 3.80911, 0, 0, 0, 1, 1,
0.4078189, 1.380516, -1.034097, 0, 0, 0, 1, 1,
0.4126985, 1.42141, 0.06021843, 0, 0, 0, 1, 1,
0.4141441, 1.213287, 0.6370454, 0, 0, 0, 1, 1,
0.4154587, -1.163528, 1.974433, 0, 0, 0, 1, 1,
0.4156031, -1.124533, 3.129315, 0, 0, 0, 1, 1,
0.415914, 0.5496787, 0.7029033, 0, 0, 0, 1, 1,
0.4162986, 0.2365288, 1.24443, 1, 1, 1, 1, 1,
0.4179155, -1.053197, 1.452517, 1, 1, 1, 1, 1,
0.4275897, 0.7215158, -0.6166103, 1, 1, 1, 1, 1,
0.4430121, -0.1694525, 3.130474, 1, 1, 1, 1, 1,
0.4501245, 1.043709, -0.2305865, 1, 1, 1, 1, 1,
0.4535075, 0.1495369, 1.60487, 1, 1, 1, 1, 1,
0.4595663, 0.9779463, 0.8521046, 1, 1, 1, 1, 1,
0.4598319, 0.1181481, 1.578127, 1, 1, 1, 1, 1,
0.460073, -0.7131877, 0.09329741, 1, 1, 1, 1, 1,
0.460752, 1.056566, 1.494222, 1, 1, 1, 1, 1,
0.4694612, -1.909097, 3.676418, 1, 1, 1, 1, 1,
0.4744157, -1.174117, 2.844921, 1, 1, 1, 1, 1,
0.4746192, -0.5346065, 3.818229, 1, 1, 1, 1, 1,
0.476438, 1.503198, -0.398968, 1, 1, 1, 1, 1,
0.4766902, -2.664759, 1.967944, 1, 1, 1, 1, 1,
0.4775262, -0.5330243, 5.067925, 0, 0, 1, 1, 1,
0.4778644, -0.338699, 2.195354, 1, 0, 0, 1, 1,
0.4814526, 0.04849032, 1.150923, 1, 0, 0, 1, 1,
0.4830253, -0.6656396, 4.402987, 1, 0, 0, 1, 1,
0.4847209, 0.2599821, 0.3463653, 1, 0, 0, 1, 1,
0.4888302, -0.3964266, 3.305958, 1, 0, 0, 1, 1,
0.4914095, -0.2340392, 2.147824, 0, 0, 0, 1, 1,
0.5050445, -0.02322024, 0.05617062, 0, 0, 0, 1, 1,
0.507209, 1.457707, 0.2003577, 0, 0, 0, 1, 1,
0.5101854, -0.902863, 1.699672, 0, 0, 0, 1, 1,
0.5130893, -0.8931656, 2.206502, 0, 0, 0, 1, 1,
0.5210266, 0.9920492, 0.698028, 0, 0, 0, 1, 1,
0.5228134, -2.334257, 3.715909, 0, 0, 0, 1, 1,
0.5229046, 0.2387006, 2.655682, 1, 1, 1, 1, 1,
0.5334981, 0.5102744, -0.7996809, 1, 1, 1, 1, 1,
0.5366268, -0.1415035, 0.9787734, 1, 1, 1, 1, 1,
0.5378774, -0.7219922, 2.098238, 1, 1, 1, 1, 1,
0.5535182, -1.034885, 3.148947, 1, 1, 1, 1, 1,
0.5545561, -0.8943747, 1.599952, 1, 1, 1, 1, 1,
0.5559933, -1.096763, 2.955, 1, 1, 1, 1, 1,
0.5610741, 0.2765883, 1.000368, 1, 1, 1, 1, 1,
0.5633219, 0.3105391, 1.268544, 1, 1, 1, 1, 1,
0.563341, -0.743699, 4.694536, 1, 1, 1, 1, 1,
0.5661138, 0.1125137, -0.2798526, 1, 1, 1, 1, 1,
0.5771021, 1.596087, 0.8821861, 1, 1, 1, 1, 1,
0.581479, 3.159679, 0.7869881, 1, 1, 1, 1, 1,
0.5915031, -0.3231567, 2.575921, 1, 1, 1, 1, 1,
0.5933764, -0.4727048, 1.76085, 1, 1, 1, 1, 1,
0.6059005, -0.389835, 1.738496, 0, 0, 1, 1, 1,
0.6074412, 0.8824258, 1.25088, 1, 0, 0, 1, 1,
0.6186143, -0.7475188, 2.438869, 1, 0, 0, 1, 1,
0.6223592, 1.300711, 0.6580986, 1, 0, 0, 1, 1,
0.6253179, -0.3489292, 2.328993, 1, 0, 0, 1, 1,
0.6263833, 1.000283, 1.286689, 1, 0, 0, 1, 1,
0.6268957, -0.3922053, 1.464661, 0, 0, 0, 1, 1,
0.6329647, 0.8066433, 1.0187, 0, 0, 0, 1, 1,
0.6351654, 1.032025, -1.030056, 0, 0, 0, 1, 1,
0.6414347, -1.684292, 2.788105, 0, 0, 0, 1, 1,
0.6452424, 0.755995, 0.1781571, 0, 0, 0, 1, 1,
0.6495104, -0.1018864, 2.878633, 0, 0, 0, 1, 1,
0.6510906, 0.7898314, 0.1467569, 0, 0, 0, 1, 1,
0.6649476, -0.9508655, 4.220275, 1, 1, 1, 1, 1,
0.6656221, -1.312991, 4.813324, 1, 1, 1, 1, 1,
0.6674574, 0.2996845, 0.505482, 1, 1, 1, 1, 1,
0.6678921, 0.8350018, 0.7405216, 1, 1, 1, 1, 1,
0.6681245, 0.7303591, 1.204417, 1, 1, 1, 1, 1,
0.6690814, 0.07221983, 2.469687, 1, 1, 1, 1, 1,
0.6723589, 0.5757281, 2.604138, 1, 1, 1, 1, 1,
0.6724082, 1.96494, -1.644788, 1, 1, 1, 1, 1,
0.6770551, 0.6102703, 0.8003314, 1, 1, 1, 1, 1,
0.6771782, -0.8522196, 2.139981, 1, 1, 1, 1, 1,
0.684853, -1.305669, 2.55792, 1, 1, 1, 1, 1,
0.6850736, -0.6135899, 3.921492, 1, 1, 1, 1, 1,
0.6897994, 0.2096141, 2.036944, 1, 1, 1, 1, 1,
0.6908663, -0.3073387, 1.375955, 1, 1, 1, 1, 1,
0.6936782, 0.09092168, 2.34358, 1, 1, 1, 1, 1,
0.6949995, -0.5800968, 3.340981, 0, 0, 1, 1, 1,
0.6958019, -0.5892193, 4.522361, 1, 0, 0, 1, 1,
0.700416, 1.017063, -0.8362746, 1, 0, 0, 1, 1,
0.7017177, -0.02543269, 1.449588, 1, 0, 0, 1, 1,
0.7024213, -0.01412988, 2.540015, 1, 0, 0, 1, 1,
0.710896, -0.301922, 1.974217, 1, 0, 0, 1, 1,
0.71163, 1.12233, 1.234133, 0, 0, 0, 1, 1,
0.7147754, 0.7159203, 0.8231317, 0, 0, 0, 1, 1,
0.7226903, -0.3786798, 2.288029, 0, 0, 0, 1, 1,
0.7248958, -1.474469, 1.968674, 0, 0, 0, 1, 1,
0.7265723, -2.199432, 4.351827, 0, 0, 0, 1, 1,
0.7277393, 1.875243, 2.715247, 0, 0, 0, 1, 1,
0.7355652, -0.3218288, -0.8112912, 0, 0, 0, 1, 1,
0.7460806, -1.088829, 2.159642, 1, 1, 1, 1, 1,
0.7466447, -0.4671674, 1.717906, 1, 1, 1, 1, 1,
0.7484131, 0.2000129, 3.035179, 1, 1, 1, 1, 1,
0.748598, -2.079933, 1.043759, 1, 1, 1, 1, 1,
0.748757, 0.2787158, 1.294866, 1, 1, 1, 1, 1,
0.7570161, -1.196062, 2.113821, 1, 1, 1, 1, 1,
0.7609176, -1.705681, 1.64257, 1, 1, 1, 1, 1,
0.7615981, 1.751576, 0.6336808, 1, 1, 1, 1, 1,
0.76234, -1.267199, 2.381507, 1, 1, 1, 1, 1,
0.7645639, -0.415433, 1.979567, 1, 1, 1, 1, 1,
0.7654611, 0.4048554, -0.6773492, 1, 1, 1, 1, 1,
0.7685866, 0.9846324, 2.125249, 1, 1, 1, 1, 1,
0.7686525, 0.5299434, 0.5306738, 1, 1, 1, 1, 1,
0.7729971, -0.2245066, 1.406603, 1, 1, 1, 1, 1,
0.7784826, -1.98701, 2.823294, 1, 1, 1, 1, 1,
0.7924443, -0.6285285, 1.347832, 0, 0, 1, 1, 1,
0.7963948, 0.1463927, 1.366723, 1, 0, 0, 1, 1,
0.7970203, 1.015122, -0.01371411, 1, 0, 0, 1, 1,
0.7980133, -0.7081251, 0.9674664, 1, 0, 0, 1, 1,
0.798458, 0.7908559, -0.7811508, 1, 0, 0, 1, 1,
0.8020127, 0.4826616, 2.500991, 1, 0, 0, 1, 1,
0.8095882, -0.1190009, 2.022166, 0, 0, 0, 1, 1,
0.8101214, -0.8572685, 3.287338, 0, 0, 0, 1, 1,
0.8105248, 1.688949, 0.01582556, 0, 0, 0, 1, 1,
0.8116353, -0.5931216, 2.718279, 0, 0, 0, 1, 1,
0.8116403, 1.086416, 1.660328, 0, 0, 0, 1, 1,
0.8122321, 0.2268621, 0.7192528, 0, 0, 0, 1, 1,
0.8140417, 0.1082871, 1.890846, 0, 0, 0, 1, 1,
0.8147587, 1.295117, 0.9272019, 1, 1, 1, 1, 1,
0.8173981, 0.7398873, 1.259051, 1, 1, 1, 1, 1,
0.818738, 0.8275353, 1.994774, 1, 1, 1, 1, 1,
0.8268882, -0.3047937, 0.2831694, 1, 1, 1, 1, 1,
0.8293075, -0.6924348, 0.6870545, 1, 1, 1, 1, 1,
0.8300699, -1.048951, 3.090365, 1, 1, 1, 1, 1,
0.8417773, -1.1528, 2.217221, 1, 1, 1, 1, 1,
0.8439459, -1.202238, 3.850271, 1, 1, 1, 1, 1,
0.8476065, 0.1004571, 1.695475, 1, 1, 1, 1, 1,
0.8543247, 0.9449777, -0.01445972, 1, 1, 1, 1, 1,
0.8593227, -1.736841, 1.738339, 1, 1, 1, 1, 1,
0.881172, -0.3619444, 2.773703, 1, 1, 1, 1, 1,
0.8861766, -0.2933019, 0.6580086, 1, 1, 1, 1, 1,
0.8867307, -0.3022401, 2.088677, 1, 1, 1, 1, 1,
0.8941189, 0.22559, -0.7255271, 1, 1, 1, 1, 1,
0.9089093, 0.6116511, 2.319561, 0, 0, 1, 1, 1,
0.9153379, -1.206177, 2.384074, 1, 0, 0, 1, 1,
0.9162873, 0.4103821, 3.168593, 1, 0, 0, 1, 1,
0.9172021, -1.416885, 3.778532, 1, 0, 0, 1, 1,
0.9332538, 0.1709272, 3.002524, 1, 0, 0, 1, 1,
0.9409977, 1.110862, 0.2656128, 1, 0, 0, 1, 1,
0.9432434, -1.154416, 2.412332, 0, 0, 0, 1, 1,
0.9448449, 0.7104674, 0.5590873, 0, 0, 0, 1, 1,
0.9508718, -1.57552, 3.263738, 0, 0, 0, 1, 1,
0.9537992, 0.4699233, 1.200664, 0, 0, 0, 1, 1,
0.9578665, -0.9065102, 2.414441, 0, 0, 0, 1, 1,
0.9579809, 0.1674993, 1.954939, 0, 0, 0, 1, 1,
0.9592822, 1.294416, 1.475416, 0, 0, 0, 1, 1,
0.9632015, 1.855677, -0.7296388, 1, 1, 1, 1, 1,
0.9640567, -1.794284, 4.375602, 1, 1, 1, 1, 1,
0.9655915, -0.5497466, 2.916425, 1, 1, 1, 1, 1,
0.9705486, -0.3655918, 0.8339699, 1, 1, 1, 1, 1,
0.9758714, 0.9470279, 0.9846957, 1, 1, 1, 1, 1,
0.9914941, -0.8454821, 2.13512, 1, 1, 1, 1, 1,
1.00056, -1.284075, 0.8387169, 1, 1, 1, 1, 1,
1.005407, -1.683715, 3.201591, 1, 1, 1, 1, 1,
1.005495, 1.067461, 1.16439, 1, 1, 1, 1, 1,
1.006006, -0.7825283, 2.94822, 1, 1, 1, 1, 1,
1.007608, -0.1399373, 2.578722, 1, 1, 1, 1, 1,
1.014643, 1.56947, 2.035572, 1, 1, 1, 1, 1,
1.02747, -0.3113487, 3.132463, 1, 1, 1, 1, 1,
1.031005, -0.5260532, 4.515676, 1, 1, 1, 1, 1,
1.033006, -0.4958373, 0.5906584, 1, 1, 1, 1, 1,
1.043172, -0.3336285, 0.2276095, 0, 0, 1, 1, 1,
1.048383, -1.089568, 2.659368, 1, 0, 0, 1, 1,
1.048648, -2.380821, 4.476367, 1, 0, 0, 1, 1,
1.048877, 0.6087878, 2.285297, 1, 0, 0, 1, 1,
1.060422, -0.2637972, 2.642044, 1, 0, 0, 1, 1,
1.063175, 1.444489, 1.728218, 1, 0, 0, 1, 1,
1.068563, -1.478673, 2.892003, 0, 0, 0, 1, 1,
1.072437, 0.02417474, 2.293976, 0, 0, 0, 1, 1,
1.081135, -1.740016, 2.656365, 0, 0, 0, 1, 1,
1.084122, 1.545722, -1.488375, 0, 0, 0, 1, 1,
1.086602, -1.391965, 0.478445, 0, 0, 0, 1, 1,
1.087759, -0.4770499, 0.6736137, 0, 0, 0, 1, 1,
1.089499, -0.5418216, 2.693761, 0, 0, 0, 1, 1,
1.096167, 0.8787363, 2.045697, 1, 1, 1, 1, 1,
1.110032, 0.7630934, 0.6004704, 1, 1, 1, 1, 1,
1.110463, -0.9711612, 1.882507, 1, 1, 1, 1, 1,
1.111197, 0.6577754, 0.05221725, 1, 1, 1, 1, 1,
1.111405, -1.970395, 0.9775691, 1, 1, 1, 1, 1,
1.118624, 1.596367, 1.656424, 1, 1, 1, 1, 1,
1.119465, 1.445814, -0.01136534, 1, 1, 1, 1, 1,
1.122975, -0.8893049, 0.999773, 1, 1, 1, 1, 1,
1.124469, 1.885192, 0.338612, 1, 1, 1, 1, 1,
1.133458, -1.124666, 1.927897, 1, 1, 1, 1, 1,
1.135298, -0.6852719, 3.648879, 1, 1, 1, 1, 1,
1.139605, 0.9816574, 0.6852324, 1, 1, 1, 1, 1,
1.141082, -0.3121127, 1.917459, 1, 1, 1, 1, 1,
1.14366, 1.672771, 1.486313, 1, 1, 1, 1, 1,
1.143949, -0.2408568, 1.330416, 1, 1, 1, 1, 1,
1.146217, -0.5454637, 2.011871, 0, 0, 1, 1, 1,
1.146835, 0.002338803, 0.8044728, 1, 0, 0, 1, 1,
1.157393, 0.7828128, 0.5020428, 1, 0, 0, 1, 1,
1.163654, -1.010554, 2.959202, 1, 0, 0, 1, 1,
1.172344, 0.9235289, 0.6568974, 1, 0, 0, 1, 1,
1.176674, -1.621168, 0.7546576, 1, 0, 0, 1, 1,
1.189456, 0.3908194, 1.054776, 0, 0, 0, 1, 1,
1.192543, -1.031341, 1.804994, 0, 0, 0, 1, 1,
1.197435, 0.2353739, 1.026241, 0, 0, 0, 1, 1,
1.203756, 1.620967, 0.122656, 0, 0, 0, 1, 1,
1.20421, -0.6550352, 0.4546301, 0, 0, 0, 1, 1,
1.208829, -0.2152745, 0.5415754, 0, 0, 0, 1, 1,
1.211653, 0.656562, 0.8348436, 0, 0, 0, 1, 1,
1.220811, -0.5529224, 1.125777, 1, 1, 1, 1, 1,
1.222411, 1.710867, 0.4279396, 1, 1, 1, 1, 1,
1.224334, -0.6683655, 1.335629, 1, 1, 1, 1, 1,
1.234011, -1.770054, 0.9142475, 1, 1, 1, 1, 1,
1.24405, -0.3890502, 2.507156, 1, 1, 1, 1, 1,
1.247256, -0.3128434, 2.455632, 1, 1, 1, 1, 1,
1.24895, -0.4348659, 1.65037, 1, 1, 1, 1, 1,
1.249057, 1.397128, -0.489182, 1, 1, 1, 1, 1,
1.250786, -0.0211052, 1.190536, 1, 1, 1, 1, 1,
1.252009, 0.9557721, -0.9481809, 1, 1, 1, 1, 1,
1.257661, 0.1786617, 1.855301, 1, 1, 1, 1, 1,
1.260448, 0.5001021, 1.806526, 1, 1, 1, 1, 1,
1.274516, 0.417639, 1.552019, 1, 1, 1, 1, 1,
1.277117, 0.0420122, -0.6185734, 1, 1, 1, 1, 1,
1.280339, 0.2339875, 0.7764451, 1, 1, 1, 1, 1,
1.282576, -1.867606, 4.100593, 0, 0, 1, 1, 1,
1.286121, -0.8678528, 2.27266, 1, 0, 0, 1, 1,
1.295318, -1.815202, 1.583753, 1, 0, 0, 1, 1,
1.295571, 1.076573, 2.675772, 1, 0, 0, 1, 1,
1.302385, -0.2317625, -0.6335906, 1, 0, 0, 1, 1,
1.304107, 0.6864976, 1.69031, 1, 0, 0, 1, 1,
1.3083, 0.9711058, 1.062123, 0, 0, 0, 1, 1,
1.311509, -0.8244953, 1.781347, 0, 0, 0, 1, 1,
1.32177, 2.824226, -0.6748613, 0, 0, 0, 1, 1,
1.329423, 0.9385552, -0.1083743, 0, 0, 0, 1, 1,
1.329425, 1.510258, -0.3452871, 0, 0, 0, 1, 1,
1.333848, -0.6424142, 2.98678, 0, 0, 0, 1, 1,
1.338354, 0.4009622, 1.374119, 0, 0, 0, 1, 1,
1.344982, 0.2972221, 2.181277, 1, 1, 1, 1, 1,
1.34555, 1.703575, 0.9115, 1, 1, 1, 1, 1,
1.365969, -0.3587093, 1.101814, 1, 1, 1, 1, 1,
1.367075, -1.80663, 0.8907449, 1, 1, 1, 1, 1,
1.371699, 0.02493383, 1.205268, 1, 1, 1, 1, 1,
1.38176, -0.9332672, 2.899591, 1, 1, 1, 1, 1,
1.403434, -1.284737, 1.922261, 1, 1, 1, 1, 1,
1.404497, -1.928812, 2.691267, 1, 1, 1, 1, 1,
1.404768, -0.2098455, 3.631022, 1, 1, 1, 1, 1,
1.405417, -0.1272776, 0.2751875, 1, 1, 1, 1, 1,
1.409094, 1.325168, 1.895894, 1, 1, 1, 1, 1,
1.410505, -0.1198117, 2.574445, 1, 1, 1, 1, 1,
1.413559, -1.280967, 3.669783, 1, 1, 1, 1, 1,
1.426148, 0.04991479, 1.70013, 1, 1, 1, 1, 1,
1.434979, 0.9852249, -0.3676331, 1, 1, 1, 1, 1,
1.461642, 0.9855251, 0.8380576, 0, 0, 1, 1, 1,
1.471164, 0.158855, 0.8624698, 1, 0, 0, 1, 1,
1.487367, 1.032841, 2.754735, 1, 0, 0, 1, 1,
1.506603, -0.5773001, 1.392293, 1, 0, 0, 1, 1,
1.509385, 0.4920564, 1.418396, 1, 0, 0, 1, 1,
1.517382, 0.230824, 0.6870307, 1, 0, 0, 1, 1,
1.526427, -0.7210249, 1.731568, 0, 0, 0, 1, 1,
1.52804, 0.7762528, -0.6082838, 0, 0, 0, 1, 1,
1.52944, 0.04491536, 1.844392, 0, 0, 0, 1, 1,
1.531397, -1.418535, 0.8375658, 0, 0, 0, 1, 1,
1.544645, 0.657271, -0.16587, 0, 0, 0, 1, 1,
1.54541, 0.1163982, 2.531126, 0, 0, 0, 1, 1,
1.553336, -0.3745356, -1.067398, 0, 0, 0, 1, 1,
1.555146, 0.2609523, 1.666764, 1, 1, 1, 1, 1,
1.567784, 0.6471763, 1.464407, 1, 1, 1, 1, 1,
1.591846, 0.3009438, 1.962223, 1, 1, 1, 1, 1,
1.601603, 0.4216934, 1.863805, 1, 1, 1, 1, 1,
1.603434, -0.1289235, 0.3895896, 1, 1, 1, 1, 1,
1.609531, -0.6786164, 1.351852, 1, 1, 1, 1, 1,
1.625298, -1.992682, 0.9811231, 1, 1, 1, 1, 1,
1.628592, -0.07534104, 3.986923, 1, 1, 1, 1, 1,
1.63573, 1.863516, -0.4316959, 1, 1, 1, 1, 1,
1.639061, -0.08264414, 2.465204, 1, 1, 1, 1, 1,
1.649177, 0.7980596, 1.617676, 1, 1, 1, 1, 1,
1.650847, 0.06244935, 2.052244, 1, 1, 1, 1, 1,
1.657461, 0.5933432, 2.951302, 1, 1, 1, 1, 1,
1.667325, 0.7451027, 0.1481358, 1, 1, 1, 1, 1,
1.668611, -0.08871676, 1.240172, 1, 1, 1, 1, 1,
1.672456, 0.7507531, 0.6370181, 0, 0, 1, 1, 1,
1.674929, -0.118643, 0.4936056, 1, 0, 0, 1, 1,
1.676198, 0.5750176, 1.64457, 1, 0, 0, 1, 1,
1.68034, -0.1400539, 2.94399, 1, 0, 0, 1, 1,
1.705867, 1.604023, -0.2054888, 1, 0, 0, 1, 1,
1.716826, 1.390694, 2.34706, 1, 0, 0, 1, 1,
1.728681, 0.01947879, 2.289181, 0, 0, 0, 1, 1,
1.761376, -1.201279, 3.239592, 0, 0, 0, 1, 1,
1.766068, -1.480369, 3.128137, 0, 0, 0, 1, 1,
1.769272, -1.161919, 3.754696, 0, 0, 0, 1, 1,
1.773228, -1.605653, 2.716258, 0, 0, 0, 1, 1,
1.776855, -3.17415, 3.424617, 0, 0, 0, 1, 1,
1.784672, 2.090654, 1.09579, 0, 0, 0, 1, 1,
1.797495, -1.557796, 3.098511, 1, 1, 1, 1, 1,
1.829573, 1.903235, 0.3159411, 1, 1, 1, 1, 1,
1.83537, -0.7759502, 2.724789, 1, 1, 1, 1, 1,
1.860531, -0.2310982, 1.021359, 1, 1, 1, 1, 1,
1.89569, -0.5219828, 1.20389, 1, 1, 1, 1, 1,
1.897792, -0.4566324, 0.9283137, 1, 1, 1, 1, 1,
1.903839, 0.7868877, 1.449566, 1, 1, 1, 1, 1,
1.907881, 1.494982, 0.5250199, 1, 1, 1, 1, 1,
1.95992, -0.7261835, 1.543756, 1, 1, 1, 1, 1,
1.973312, -1.485538, 0.2384876, 1, 1, 1, 1, 1,
1.984705, 0.6184968, 0.1451221, 1, 1, 1, 1, 1,
1.990215, -0.9824306, 2.145021, 1, 1, 1, 1, 1,
1.990535, -0.1628909, 1.219443, 1, 1, 1, 1, 1,
1.991278, 1.693286, 0.48344, 1, 1, 1, 1, 1,
2.000122, -0.199247, 2.498513, 1, 1, 1, 1, 1,
2.020441, -0.8020644, 0.9362939, 0, 0, 1, 1, 1,
2.021091, 0.4458427, 1.028333, 1, 0, 0, 1, 1,
2.038354, 0.1391685, 2.870323, 1, 0, 0, 1, 1,
2.065283, 1.445063, 1.925994, 1, 0, 0, 1, 1,
2.097916, 0.5747579, 1.728709, 1, 0, 0, 1, 1,
2.13697, 1.469618, 1.183246, 1, 0, 0, 1, 1,
2.187305, -0.7218764, 1.724509, 0, 0, 0, 1, 1,
2.188799, 1.104034, 0.4376522, 0, 0, 0, 1, 1,
2.191051, -0.8479103, 3.305233, 0, 0, 0, 1, 1,
2.197851, -0.2567336, 1.959358, 0, 0, 0, 1, 1,
2.201594, -0.8591482, 1.573399, 0, 0, 0, 1, 1,
2.379936, -0.9384218, 1.529313, 0, 0, 0, 1, 1,
2.438979, -0.5027574, 2.117611, 0, 0, 0, 1, 1,
2.468067, -0.604974, 1.424237, 1, 1, 1, 1, 1,
2.606485, 0.6764176, 1.011588, 1, 1, 1, 1, 1,
2.618833, 0.9859391, 0.763973, 1, 1, 1, 1, 1,
2.627524, -1.452094, 1.976181, 1, 1, 1, 1, 1,
2.726743, -0.6926641, 1.442993, 1, 1, 1, 1, 1,
2.852761, 0.2641225, 1.270016, 1, 1, 1, 1, 1,
3.0832, -0.1023423, 0.1146168, 1, 1, 1, 1, 1
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
var radius = 9.015345;
var distance = 31.66602;
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
mvMatrix.translate( -0.07499993, -0.0999825, -0.3395023 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.66602);
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
