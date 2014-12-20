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
-3.038022, -0.1154812, -1.259035, 1, 0, 0, 1,
-2.868762, 0.527672, -1.481047, 1, 0.007843138, 0, 1,
-2.859469, -0.6370822, -0.2877093, 1, 0.01176471, 0, 1,
-2.707893, -0.087289, -2.505806, 1, 0.01960784, 0, 1,
-2.69385, 0.01542205, -1.653513, 1, 0.02352941, 0, 1,
-2.670781, -1.050138, -0.3068298, 1, 0.03137255, 0, 1,
-2.647567, -0.2135018, -0.7429844, 1, 0.03529412, 0, 1,
-2.589957, 0.8262122, 0.5565042, 1, 0.04313726, 0, 1,
-2.56533, 1.853463, -2.269851, 1, 0.04705882, 0, 1,
-2.448981, 0.1889595, -1.000661, 1, 0.05490196, 0, 1,
-2.446564, 0.1749864, 2.359738, 1, 0.05882353, 0, 1,
-2.366875, -0.3963458, -0.3565312, 1, 0.06666667, 0, 1,
-2.313705, 1.868388, -0.7495422, 1, 0.07058824, 0, 1,
-2.304058, 2.032664, -0.4164153, 1, 0.07843138, 0, 1,
-2.292847, -1.765419, -2.124026, 1, 0.08235294, 0, 1,
-2.27067, 0.1535591, -0.8643391, 1, 0.09019608, 0, 1,
-2.251687, -0.1984426, -1.20546, 1, 0.09411765, 0, 1,
-2.248314, 0.6168077, -2.67161, 1, 0.1019608, 0, 1,
-2.247438, 0.4897558, -2.28964, 1, 0.1098039, 0, 1,
-2.247266, 0.3864094, -0.1573333, 1, 0.1137255, 0, 1,
-2.200223, -0.7115355, -2.03147, 1, 0.1215686, 0, 1,
-2.187335, 1.18561, -2.977687, 1, 0.1254902, 0, 1,
-2.181609, -0.09811889, -3.851714, 1, 0.1333333, 0, 1,
-2.156251, 0.5559283, 0.03926344, 1, 0.1372549, 0, 1,
-2.108906, -0.452928, -1.194276, 1, 0.145098, 0, 1,
-2.070337, -0.9570867, -4.03568, 1, 0.1490196, 0, 1,
-2.064753, -2.370617, -2.748141, 1, 0.1568628, 0, 1,
-2.052967, 0.4929715, -1.575652, 1, 0.1607843, 0, 1,
-2.024161, -0.1852424, -2.175885, 1, 0.1686275, 0, 1,
-2.020658, -1.116181, -3.628103, 1, 0.172549, 0, 1,
-2.008185, 0.5797758, -1.29747, 1, 0.1803922, 0, 1,
-1.998162, -0.4626102, -2.093283, 1, 0.1843137, 0, 1,
-1.962124, 0.1264884, -1.74201, 1, 0.1921569, 0, 1,
-1.938414, -1.083546, -2.639794, 1, 0.1960784, 0, 1,
-1.901437, 0.4500808, -1.43518, 1, 0.2039216, 0, 1,
-1.869852, -0.6581796, -2.567612, 1, 0.2117647, 0, 1,
-1.867615, -2.188997, -0.8475764, 1, 0.2156863, 0, 1,
-1.865838, 0.3357712, -0.6664178, 1, 0.2235294, 0, 1,
-1.863519, 0.6733103, -1.664257, 1, 0.227451, 0, 1,
-1.826778, 1.408621, -1.148721, 1, 0.2352941, 0, 1,
-1.823555, -0.3355577, 1.293087, 1, 0.2392157, 0, 1,
-1.810691, 0.5074095, -1.554355, 1, 0.2470588, 0, 1,
-1.808827, 1.037672, 1.427298, 1, 0.2509804, 0, 1,
-1.787534, -0.1278475, -0.6602821, 1, 0.2588235, 0, 1,
-1.783132, 0.3308664, -3.331719, 1, 0.2627451, 0, 1,
-1.775019, 1.052816, -0.6573107, 1, 0.2705882, 0, 1,
-1.744305, -0.7671689, -1.281924, 1, 0.2745098, 0, 1,
-1.736945, 0.7643043, -1.618442, 1, 0.282353, 0, 1,
-1.716597, -0.1499589, -0.6985079, 1, 0.2862745, 0, 1,
-1.715117, -1.280053, -1.668048, 1, 0.2941177, 0, 1,
-1.711445, 0.2422257, -0.6926793, 1, 0.3019608, 0, 1,
-1.693029, 0.4297907, -1.627266, 1, 0.3058824, 0, 1,
-1.69143, 1.424023, 0.5758185, 1, 0.3137255, 0, 1,
-1.681545, -0.673449, -1.60382, 1, 0.3176471, 0, 1,
-1.658285, 1.548275, -1.681703, 1, 0.3254902, 0, 1,
-1.653374, -0.3114079, -1.442267, 1, 0.3294118, 0, 1,
-1.639306, -1.68728, -3.100722, 1, 0.3372549, 0, 1,
-1.630492, -1.11768, -2.029388, 1, 0.3411765, 0, 1,
-1.622414, -0.108012, -0.4571357, 1, 0.3490196, 0, 1,
-1.615619, -0.1905043, -1.055873, 1, 0.3529412, 0, 1,
-1.612903, 1.139245, -1.165213, 1, 0.3607843, 0, 1,
-1.582099, -0.2688088, -2.350372, 1, 0.3647059, 0, 1,
-1.562333, -0.2583059, -1.655369, 1, 0.372549, 0, 1,
-1.5553, -1.769609, -1.884051, 1, 0.3764706, 0, 1,
-1.546321, 0.75099, -1.364479, 1, 0.3843137, 0, 1,
-1.538396, -0.1508509, -4.222418, 1, 0.3882353, 0, 1,
-1.524871, -0.8830878, -0.8718458, 1, 0.3960784, 0, 1,
-1.523519, 2.190138, -1.047607, 1, 0.4039216, 0, 1,
-1.50957, -0.2666385, -0.1858351, 1, 0.4078431, 0, 1,
-1.495859, 0.3050009, -2.009212, 1, 0.4156863, 0, 1,
-1.483989, -2.039143, -3.107373, 1, 0.4196078, 0, 1,
-1.473128, 0.3098707, -2.838184, 1, 0.427451, 0, 1,
-1.472961, -0.970881, -1.613724, 1, 0.4313726, 0, 1,
-1.464498, -0.219984, -2.481603, 1, 0.4392157, 0, 1,
-1.451328, -0.4311751, -2.462935, 1, 0.4431373, 0, 1,
-1.4487, 2.119874, 1.028875, 1, 0.4509804, 0, 1,
-1.431373, 1.061509, -2.032307, 1, 0.454902, 0, 1,
-1.422598, 0.693417, -1.11798, 1, 0.4627451, 0, 1,
-1.413437, 0.927976, 0.2791288, 1, 0.4666667, 0, 1,
-1.408783, -0.5798498, -1.77978, 1, 0.4745098, 0, 1,
-1.404699, -0.9935692, -1.620396, 1, 0.4784314, 0, 1,
-1.400357, 0.6404215, -2.588871, 1, 0.4862745, 0, 1,
-1.38019, 0.3579926, -1.815628, 1, 0.4901961, 0, 1,
-1.379897, 0.01608443, -1.185989, 1, 0.4980392, 0, 1,
-1.371305, -0.1532222, -1.963615, 1, 0.5058824, 0, 1,
-1.368078, 1.755044, -0.1310605, 1, 0.509804, 0, 1,
-1.364818, 0.9575691, -1.728407, 1, 0.5176471, 0, 1,
-1.354858, 1.051225, -0.6289824, 1, 0.5215687, 0, 1,
-1.354482, -0.4614727, -2.324792, 1, 0.5294118, 0, 1,
-1.35133, -0.4649351, -1.5499, 1, 0.5333334, 0, 1,
-1.34584, 1.246712, 0.3122669, 1, 0.5411765, 0, 1,
-1.345696, -0.02102376, -0.6852528, 1, 0.5450981, 0, 1,
-1.336306, -0.2102777, -1.347883, 1, 0.5529412, 0, 1,
-1.315578, -0.03666697, -0.3576967, 1, 0.5568628, 0, 1,
-1.308074, -1.161984, -2.576324, 1, 0.5647059, 0, 1,
-1.30723, 0.3580862, -2.000722, 1, 0.5686275, 0, 1,
-1.306429, -0.9706215, -2.776904, 1, 0.5764706, 0, 1,
-1.302797, -0.7748351, -3.32306, 1, 0.5803922, 0, 1,
-1.302572, 2.008724, -0.02594251, 1, 0.5882353, 0, 1,
-1.292356, -0.02512251, -1.382383, 1, 0.5921569, 0, 1,
-1.290887, 1.5294, 0.06094692, 1, 0.6, 0, 1,
-1.287797, -1.970749, -1.940977, 1, 0.6078432, 0, 1,
-1.278927, 0.9982802, 0.4036368, 1, 0.6117647, 0, 1,
-1.276414, 0.1423599, -1.700363, 1, 0.6196079, 0, 1,
-1.275929, -1.079492, -1.975135, 1, 0.6235294, 0, 1,
-1.268307, -0.4639161, -2.819067, 1, 0.6313726, 0, 1,
-1.266581, -0.2865678, -1.427777, 1, 0.6352941, 0, 1,
-1.264995, -0.6917986, -2.230131, 1, 0.6431373, 0, 1,
-1.248908, -0.3802088, -0.8385381, 1, 0.6470588, 0, 1,
-1.248294, 0.5342623, -0.9956689, 1, 0.654902, 0, 1,
-1.247248, -0.4049735, -1.839875, 1, 0.6588235, 0, 1,
-1.245451, -2.217592, -1.747188, 1, 0.6666667, 0, 1,
-1.244074, 1.797029, -0.7958071, 1, 0.6705883, 0, 1,
-1.225461, 0.6854562, -0.5733484, 1, 0.6784314, 0, 1,
-1.214156, 0.03845606, -0.5866632, 1, 0.682353, 0, 1,
-1.213008, 0.4150614, 0.5022414, 1, 0.6901961, 0, 1,
-1.212372, 0.5340832, -2.625195, 1, 0.6941177, 0, 1,
-1.211429, -0.2796369, 0.6571994, 1, 0.7019608, 0, 1,
-1.201661, 1.491151, -2.162905, 1, 0.7098039, 0, 1,
-1.200061, -0.7379362, -0.2333582, 1, 0.7137255, 0, 1,
-1.19052, -0.2890825, -0.2936282, 1, 0.7215686, 0, 1,
-1.17749, -0.7291389, -2.711358, 1, 0.7254902, 0, 1,
-1.17441, -2.10993, -4.618024, 1, 0.7333333, 0, 1,
-1.17212, -0.4893586, -2.202421, 1, 0.7372549, 0, 1,
-1.17091, 1.474801, -1.03258, 1, 0.7450981, 0, 1,
-1.167578, -0.2903112, -1.757779, 1, 0.7490196, 0, 1,
-1.164758, 1.24016, -2.20536, 1, 0.7568628, 0, 1,
-1.159292, -1.463791, -3.029913, 1, 0.7607843, 0, 1,
-1.157339, -0.1125929, 0.4633846, 1, 0.7686275, 0, 1,
-1.152657, 0.9825928, -0.2516157, 1, 0.772549, 0, 1,
-1.145246, -0.180896, -3.75948, 1, 0.7803922, 0, 1,
-1.131609, 2.210795, 0.08791923, 1, 0.7843137, 0, 1,
-1.122668, 1.025551, 0.6837319, 1, 0.7921569, 0, 1,
-1.11728, -1.171944, -2.554107, 1, 0.7960784, 0, 1,
-1.107082, -0.8705279, -1.441613, 1, 0.8039216, 0, 1,
-1.103088, 0.7039379, -1.201414, 1, 0.8117647, 0, 1,
-1.101815, -1.395216, -2.03538, 1, 0.8156863, 0, 1,
-1.099571, -1.675117, -2.715353, 1, 0.8235294, 0, 1,
-1.093318, 0.2543131, -1.721696, 1, 0.827451, 0, 1,
-1.088704, -0.9118949, -1.4022, 1, 0.8352941, 0, 1,
-1.088171, 0.6836303, -0.6704978, 1, 0.8392157, 0, 1,
-1.078235, -1.105941, -2.345869, 1, 0.8470588, 0, 1,
-1.074852, -0.9323874, -2.250304, 1, 0.8509804, 0, 1,
-1.069373, 0.9753454, -0.3510507, 1, 0.8588235, 0, 1,
-1.058782, 1.439963, -3.832194, 1, 0.8627451, 0, 1,
-1.057229, -0.555143, -1.45139, 1, 0.8705882, 0, 1,
-1.057004, 1.020545, -1.026354, 1, 0.8745098, 0, 1,
-1.051623, 0.05598741, -0.454472, 1, 0.8823529, 0, 1,
-1.04178, 0.7596609, 0.1688767, 1, 0.8862745, 0, 1,
-1.039988, -1.173879, -2.772266, 1, 0.8941177, 0, 1,
-1.036265, -0.4174527, -1.120273, 1, 0.8980392, 0, 1,
-1.017122, -0.7159557, -2.774211, 1, 0.9058824, 0, 1,
-1.011567, -0.8301732, -1.403386, 1, 0.9137255, 0, 1,
-1.009343, -0.5865329, -1.468634, 1, 0.9176471, 0, 1,
-1.002103, 1.36482, -0.7656128, 1, 0.9254902, 0, 1,
-1.001433, 1.268613, -0.6618843, 1, 0.9294118, 0, 1,
-0.995843, -0.6611558, -3.624426, 1, 0.9372549, 0, 1,
-0.9949195, -1.281124, -1.920911, 1, 0.9411765, 0, 1,
-0.9947284, 0.9816337, -0.7112774, 1, 0.9490196, 0, 1,
-0.9942884, -0.02127898, -3.136147, 1, 0.9529412, 0, 1,
-0.9911904, 1.957862, -0.2235066, 1, 0.9607843, 0, 1,
-0.9838696, 0.8491306, 0.3070371, 1, 0.9647059, 0, 1,
-0.9805247, -0.5577029, -2.311099, 1, 0.972549, 0, 1,
-0.9751456, 0.3992178, -0.9870355, 1, 0.9764706, 0, 1,
-0.963645, -0.1571957, -1.86755, 1, 0.9843137, 0, 1,
-0.9580103, 0.5404864, 0.6864637, 1, 0.9882353, 0, 1,
-0.9508195, -0.001639824, -1.450129, 1, 0.9960784, 0, 1,
-0.9428288, 0.2374534, -0.1306609, 0.9960784, 1, 0, 1,
-0.9352877, -0.3727081, -1.943745, 0.9921569, 1, 0, 1,
-0.9333192, 1.090257, -0.002665402, 0.9843137, 1, 0, 1,
-0.9280683, -1.809232, -3.081954, 0.9803922, 1, 0, 1,
-0.9274591, 0.3383229, -1.194231, 0.972549, 1, 0, 1,
-0.9268228, -0.1726201, -1.643553, 0.9686275, 1, 0, 1,
-0.9140921, 0.951322, -0.7596719, 0.9607843, 1, 0, 1,
-0.9065942, -0.005677766, -0.8243778, 0.9568627, 1, 0, 1,
-0.9049263, -1.637564, -4.06429, 0.9490196, 1, 0, 1,
-0.9024584, -0.203434, -1.837246, 0.945098, 1, 0, 1,
-0.9024025, -0.7017198, -1.717409, 0.9372549, 1, 0, 1,
-0.9018711, -0.3021578, -1.762985, 0.9333333, 1, 0, 1,
-0.8955607, 0.2425147, -2.377649, 0.9254902, 1, 0, 1,
-0.8933148, -0.6338953, -1.947542, 0.9215686, 1, 0, 1,
-0.8920831, 0.4681836, 0.2196973, 0.9137255, 1, 0, 1,
-0.8912095, 0.438613, 0.6633505, 0.9098039, 1, 0, 1,
-0.8891255, -1.910481, -3.872134, 0.9019608, 1, 0, 1,
-0.8861911, 0.8227599, -3.1803, 0.8941177, 1, 0, 1,
-0.882857, 0.4535494, -0.398693, 0.8901961, 1, 0, 1,
-0.8770587, 1.0915, 0.6492379, 0.8823529, 1, 0, 1,
-0.8763747, -0.2443305, -2.016541, 0.8784314, 1, 0, 1,
-0.8658106, 1.036873, -1.480898, 0.8705882, 1, 0, 1,
-0.8611038, -0.1509199, -1.686685, 0.8666667, 1, 0, 1,
-0.8604187, -1.087327, -2.077474, 0.8588235, 1, 0, 1,
-0.859046, 0.5877317, -2.639901, 0.854902, 1, 0, 1,
-0.8581457, -1.368402, -3.609681, 0.8470588, 1, 0, 1,
-0.8511628, 0.7042933, -1.032934, 0.8431373, 1, 0, 1,
-0.8457199, 0.8461334, 1.294095, 0.8352941, 1, 0, 1,
-0.8409841, 0.8526627, -2.12552, 0.8313726, 1, 0, 1,
-0.840597, -1.686121, -2.052026, 0.8235294, 1, 0, 1,
-0.838496, -0.6473729, -1.655296, 0.8196079, 1, 0, 1,
-0.8355973, -0.8612042, -2.297575, 0.8117647, 1, 0, 1,
-0.8315567, -0.08743323, -2.778988, 0.8078431, 1, 0, 1,
-0.819598, -1.631917, -3.427178, 0.8, 1, 0, 1,
-0.8188815, -1.065015, -2.846404, 0.7921569, 1, 0, 1,
-0.8128752, -0.5785772, -2.344427, 0.7882353, 1, 0, 1,
-0.8108987, -1.49229, -3.37936, 0.7803922, 1, 0, 1,
-0.8071512, 0.2007892, -2.043631, 0.7764706, 1, 0, 1,
-0.8013074, 1.395262, 0.4401029, 0.7686275, 1, 0, 1,
-0.8003595, -2.237863, -1.867987, 0.7647059, 1, 0, 1,
-0.7998282, -1.087524, -2.694444, 0.7568628, 1, 0, 1,
-0.7919332, 0.2573209, -0.7155038, 0.7529412, 1, 0, 1,
-0.7901958, 0.6389548, -1.681982, 0.7450981, 1, 0, 1,
-0.7855855, -0.3683822, -2.188231, 0.7411765, 1, 0, 1,
-0.7826782, -1.473281, -3.385137, 0.7333333, 1, 0, 1,
-0.7736196, -0.01349413, -2.377866, 0.7294118, 1, 0, 1,
-0.7733654, 1.558992, -0.9058441, 0.7215686, 1, 0, 1,
-0.7713476, 0.148358, -0.5319023, 0.7176471, 1, 0, 1,
-0.769208, 0.2502818, 0.00442078, 0.7098039, 1, 0, 1,
-0.7656046, -1.458264, -1.770971, 0.7058824, 1, 0, 1,
-0.7647181, 0.1996516, -0.9896951, 0.6980392, 1, 0, 1,
-0.7621014, -0.8839421, -2.174789, 0.6901961, 1, 0, 1,
-0.7598606, 0.767632, -1.054219, 0.6862745, 1, 0, 1,
-0.7401311, -0.1096421, 0.04960933, 0.6784314, 1, 0, 1,
-0.7376534, -0.7248716, -2.42337, 0.6745098, 1, 0, 1,
-0.7327383, -1.566672, -3.109492, 0.6666667, 1, 0, 1,
-0.7326401, -0.9406249, -2.199574, 0.6627451, 1, 0, 1,
-0.7296872, -0.5206922, -2.062312, 0.654902, 1, 0, 1,
-0.7284758, -1.08801, -3.104853, 0.6509804, 1, 0, 1,
-0.7269102, -0.9917442, -1.567803, 0.6431373, 1, 0, 1,
-0.7241791, 0.2344747, -2.54339, 0.6392157, 1, 0, 1,
-0.7155501, 0.6043901, 1.326394, 0.6313726, 1, 0, 1,
-0.7100883, 0.3583547, -1.912521, 0.627451, 1, 0, 1,
-0.7086591, -0.2889232, -2.111788, 0.6196079, 1, 0, 1,
-0.7077377, -0.1199831, -2.887149, 0.6156863, 1, 0, 1,
-0.7056524, 0.6717631, -2.075462, 0.6078432, 1, 0, 1,
-0.7046706, 0.422359, -2.916239, 0.6039216, 1, 0, 1,
-0.7021602, -0.2150298, -2.537802, 0.5960785, 1, 0, 1,
-0.6978784, -2.005367, -1.418567, 0.5882353, 1, 0, 1,
-0.6936685, -1.68111, -1.763633, 0.5843138, 1, 0, 1,
-0.6922488, -2.023635, -3.285468, 0.5764706, 1, 0, 1,
-0.6917326, -0.1392788, -1.746201, 0.572549, 1, 0, 1,
-0.6892639, -0.3378766, -3.383452, 0.5647059, 1, 0, 1,
-0.687608, -0.9719934, -1.224308, 0.5607843, 1, 0, 1,
-0.6859476, -0.04145567, -1.472059, 0.5529412, 1, 0, 1,
-0.6811468, -0.4656925, -1.114184, 0.5490196, 1, 0, 1,
-0.6723674, -1.103779, -3.696594, 0.5411765, 1, 0, 1,
-0.6692318, 0.2337508, -1.842095, 0.5372549, 1, 0, 1,
-0.6651506, 0.1854422, -1.440693, 0.5294118, 1, 0, 1,
-0.6648889, -1.845121, -3.994792, 0.5254902, 1, 0, 1,
-0.6648654, -1.428518, -2.626556, 0.5176471, 1, 0, 1,
-0.6631843, -0.5504667, -0.8407647, 0.5137255, 1, 0, 1,
-0.6618213, -0.9173422, -1.352911, 0.5058824, 1, 0, 1,
-0.6585456, -0.05830719, -1.116932, 0.5019608, 1, 0, 1,
-0.6533551, -0.4962865, -2.196148, 0.4941176, 1, 0, 1,
-0.6523824, -0.07159182, -0.7514688, 0.4862745, 1, 0, 1,
-0.6510927, -3.00563, -4.054305, 0.4823529, 1, 0, 1,
-0.6487849, 0.5622827, -0.8875582, 0.4745098, 1, 0, 1,
-0.6483116, -0.307827, -1.962146, 0.4705882, 1, 0, 1,
-0.6452046, -0.2156914, -2.593423, 0.4627451, 1, 0, 1,
-0.6370585, 0.6543386, 0.07287098, 0.4588235, 1, 0, 1,
-0.6359693, 3.187069, 1.182223, 0.4509804, 1, 0, 1,
-0.6352781, -1.411497, -5.571631, 0.4470588, 1, 0, 1,
-0.6345496, -0.3991307, -2.84454, 0.4392157, 1, 0, 1,
-0.6329802, -1.578383, -2.485429, 0.4352941, 1, 0, 1,
-0.6319402, -0.5703089, -1.779857, 0.427451, 1, 0, 1,
-0.6310095, 1.043775, -0.07548895, 0.4235294, 1, 0, 1,
-0.6273675, 2.343264, -0.286389, 0.4156863, 1, 0, 1,
-0.6177535, 0.1673997, -0.8115858, 0.4117647, 1, 0, 1,
-0.6176984, 1.003177, 1.231943, 0.4039216, 1, 0, 1,
-0.6160731, -1.060254, -3.90852, 0.3960784, 1, 0, 1,
-0.6117373, -0.7917247, -3.353061, 0.3921569, 1, 0, 1,
-0.6109079, 0.2364867, -0.6577789, 0.3843137, 1, 0, 1,
-0.6055292, -0.145882, -3.118628, 0.3803922, 1, 0, 1,
-0.6054836, 2.121908, -1.122159, 0.372549, 1, 0, 1,
-0.6038024, -0.9826216, -2.005609, 0.3686275, 1, 0, 1,
-0.6037638, -0.0235347, -2.384641, 0.3607843, 1, 0, 1,
-0.6022194, -2.020325, -2.259839, 0.3568628, 1, 0, 1,
-0.5976539, -1.455049, -2.726163, 0.3490196, 1, 0, 1,
-0.5957459, -0.464629, -2.474414, 0.345098, 1, 0, 1,
-0.5905858, 0.4663215, -1.914312, 0.3372549, 1, 0, 1,
-0.5817555, 2.136093, 0.1820755, 0.3333333, 1, 0, 1,
-0.5793634, 1.125036, 1.094992, 0.3254902, 1, 0, 1,
-0.5731313, -1.585396, -2.285622, 0.3215686, 1, 0, 1,
-0.5730718, -0.8674768, -4.085951, 0.3137255, 1, 0, 1,
-0.5700418, 0.1195559, -0.4833293, 0.3098039, 1, 0, 1,
-0.5626525, 0.2348903, 0.007167099, 0.3019608, 1, 0, 1,
-0.556644, -0.05182991, 0.8928139, 0.2941177, 1, 0, 1,
-0.5563381, -0.4789227, -1.482254, 0.2901961, 1, 0, 1,
-0.555981, 0.8161242, -1.788597, 0.282353, 1, 0, 1,
-0.5526174, -2.717168, -3.292816, 0.2784314, 1, 0, 1,
-0.5496644, 1.852506, 0.9566461, 0.2705882, 1, 0, 1,
-0.5476282, 0.9267417, -1.515564, 0.2666667, 1, 0, 1,
-0.5358034, 0.6582663, -0.4175878, 0.2588235, 1, 0, 1,
-0.5354274, 0.09034244, -1.196473, 0.254902, 1, 0, 1,
-0.5325371, 1.609914, -0.9837955, 0.2470588, 1, 0, 1,
-0.5323997, -2.064777, -2.089948, 0.2431373, 1, 0, 1,
-0.5261702, -2.226944, -1.662159, 0.2352941, 1, 0, 1,
-0.5253718, -1.087327, -3.428517, 0.2313726, 1, 0, 1,
-0.5228266, 1.130794, -2.510676, 0.2235294, 1, 0, 1,
-0.5211396, -1.619339, -1.914982, 0.2196078, 1, 0, 1,
-0.5186891, -1.283547, -2.424083, 0.2117647, 1, 0, 1,
-0.5184776, 0.04413037, -0.8451837, 0.2078431, 1, 0, 1,
-0.5123389, -0.1237351, -1.644117, 0.2, 1, 0, 1,
-0.5116227, 0.53096, -1.498299, 0.1921569, 1, 0, 1,
-0.5112649, 0.1716506, -1.97982, 0.1882353, 1, 0, 1,
-0.5101947, -0.7887924, -1.871014, 0.1803922, 1, 0, 1,
-0.5082928, -0.4113614, -3.042616, 0.1764706, 1, 0, 1,
-0.5054294, -0.7332571, -2.899339, 0.1686275, 1, 0, 1,
-0.5048988, -0.3693865, -3.574136, 0.1647059, 1, 0, 1,
-0.4983193, -0.1813843, -4.244028, 0.1568628, 1, 0, 1,
-0.4982146, -0.6246819, -2.425706, 0.1529412, 1, 0, 1,
-0.49591, 0.606225, 0.06799968, 0.145098, 1, 0, 1,
-0.4945561, 1.014302, -0.448603, 0.1411765, 1, 0, 1,
-0.4913746, 0.5771111, -0.701426, 0.1333333, 1, 0, 1,
-0.4901309, -0.9066716, -1.162902, 0.1294118, 1, 0, 1,
-0.4861787, 0.8790472, -0.9037505, 0.1215686, 1, 0, 1,
-0.4853904, -0.3002308, -2.718358, 0.1176471, 1, 0, 1,
-0.4807551, 0.5836722, -0.6965531, 0.1098039, 1, 0, 1,
-0.4770626, -1.612708, -0.7543149, 0.1058824, 1, 0, 1,
-0.4734077, 1.517702, -1.828468, 0.09803922, 1, 0, 1,
-0.4726883, -0.1551291, -2.789364, 0.09019608, 1, 0, 1,
-0.4713654, 0.3117891, -1.394718, 0.08627451, 1, 0, 1,
-0.4660252, -0.03402545, -0.914781, 0.07843138, 1, 0, 1,
-0.4657634, -1.075152, -3.472511, 0.07450981, 1, 0, 1,
-0.4600987, 1.315896, -0.4769049, 0.06666667, 1, 0, 1,
-0.4596, 0.1665286, -0.4024902, 0.0627451, 1, 0, 1,
-0.4594736, 1.592421, 0.02246654, 0.05490196, 1, 0, 1,
-0.4594672, -0.3686863, 0.28383, 0.05098039, 1, 0, 1,
-0.4574931, -1.118804, -3.154243, 0.04313726, 1, 0, 1,
-0.4549193, -1.728158, -2.58214, 0.03921569, 1, 0, 1,
-0.4533301, -0.8700312, -1.858258, 0.03137255, 1, 0, 1,
-0.447981, -0.9863414, -2.02212, 0.02745098, 1, 0, 1,
-0.447915, 0.05109223, -3.604711, 0.01960784, 1, 0, 1,
-0.4469783, -0.4996967, -1.815854, 0.01568628, 1, 0, 1,
-0.446674, -1.752067, -2.281695, 0.007843138, 1, 0, 1,
-0.4430592, -1.92057, -3.868084, 0.003921569, 1, 0, 1,
-0.4424281, 0.0570281, -0.3659868, 0, 1, 0.003921569, 1,
-0.4348495, -0.4631626, -1.871584, 0, 1, 0.01176471, 1,
-0.4334263, 0.4792273, -1.080813, 0, 1, 0.01568628, 1,
-0.431904, -0.1407162, -3.284123, 0, 1, 0.02352941, 1,
-0.4289, -0.6448099, -2.284684, 0, 1, 0.02745098, 1,
-0.4232424, 1.990443, -0.03267453, 0, 1, 0.03529412, 1,
-0.4221375, -0.1212536, -3.386266, 0, 1, 0.03921569, 1,
-0.4220698, 0.5261391, -0.1915512, 0, 1, 0.04705882, 1,
-0.4177427, -1.740058, -4.442208, 0, 1, 0.05098039, 1,
-0.4143992, -0.9020889, -3.910715, 0, 1, 0.05882353, 1,
-0.4143199, -0.4994513, -2.041748, 0, 1, 0.0627451, 1,
-0.410981, -0.7260606, -3.02639, 0, 1, 0.07058824, 1,
-0.4046342, 0.3015698, -0.3499491, 0, 1, 0.07450981, 1,
-0.4033235, 0.1634438, -1.145019, 0, 1, 0.08235294, 1,
-0.4024003, 1.627363, -0.9064549, 0, 1, 0.08627451, 1,
-0.4021599, 1.290156, 0.0857512, 0, 1, 0.09411765, 1,
-0.3946975, 0.2929046, -0.3578033, 0, 1, 0.1019608, 1,
-0.3900794, 0.3025596, -1.306981, 0, 1, 0.1058824, 1,
-0.3880211, -0.3710722, -1.462698, 0, 1, 0.1137255, 1,
-0.382321, 0.4323684, -0.7451642, 0, 1, 0.1176471, 1,
-0.3810714, -0.3511521, -1.67147, 0, 1, 0.1254902, 1,
-0.3790477, -0.7323425, -2.379322, 0, 1, 0.1294118, 1,
-0.3711172, 0.3265939, -1.020793, 0, 1, 0.1372549, 1,
-0.3697334, 0.0870342, -0.3896703, 0, 1, 0.1411765, 1,
-0.3693602, 1.363791, -0.1014115, 0, 1, 0.1490196, 1,
-0.3623177, 0.4258231, -0.9769687, 0, 1, 0.1529412, 1,
-0.3607468, -1.131346, -2.858701, 0, 1, 0.1607843, 1,
-0.3564705, 2.893656, 0.2304517, 0, 1, 0.1647059, 1,
-0.3539723, 1.325001, -0.5439497, 0, 1, 0.172549, 1,
-0.3538322, -0.9007432, -0.8305421, 0, 1, 0.1764706, 1,
-0.350007, -0.5248293, -2.728702, 0, 1, 0.1843137, 1,
-0.3495441, 0.3509329, 0.7110119, 0, 1, 0.1882353, 1,
-0.3460702, 0.01858114, -2.140181, 0, 1, 0.1960784, 1,
-0.3438803, -0.7055904, -3.319513, 0, 1, 0.2039216, 1,
-0.3428309, -0.5989847, -2.577758, 0, 1, 0.2078431, 1,
-0.3413647, 0.08645732, -0.8159205, 0, 1, 0.2156863, 1,
-0.3385695, 1.612357, 0.3499653, 0, 1, 0.2196078, 1,
-0.3367219, -0.1209845, -1.155105, 0, 1, 0.227451, 1,
-0.3365922, 1.117199, -0.8890119, 0, 1, 0.2313726, 1,
-0.3354849, 0.3537494, 0.893128, 0, 1, 0.2392157, 1,
-0.3353367, 0.1307073, -1.996856, 0, 1, 0.2431373, 1,
-0.3340971, 0.8383003, -1.527064, 0, 1, 0.2509804, 1,
-0.3326004, 0.4960045, -0.8907323, 0, 1, 0.254902, 1,
-0.3307817, 1.890279, 0.6638002, 0, 1, 0.2627451, 1,
-0.32979, -0.4797894, -2.168252, 0, 1, 0.2666667, 1,
-0.3258513, -0.467955, -0.9559091, 0, 1, 0.2745098, 1,
-0.3251841, 0.04623425, -2.283495, 0, 1, 0.2784314, 1,
-0.3183464, -0.3609467, -1.141393, 0, 1, 0.2862745, 1,
-0.3172588, -0.04064238, -2.384289, 0, 1, 0.2901961, 1,
-0.3156605, 1.179409, -2.005561, 0, 1, 0.2980392, 1,
-0.3142871, 0.7362694, -1.998797, 0, 1, 0.3058824, 1,
-0.3118041, -1.042616, -1.83756, 0, 1, 0.3098039, 1,
-0.3106614, -0.4290387, -1.492694, 0, 1, 0.3176471, 1,
-0.3105331, 1.010948, -0.5458618, 0, 1, 0.3215686, 1,
-0.3097363, -0.249297, -3.902747, 0, 1, 0.3294118, 1,
-0.3093523, 0.5840886, -0.07655677, 0, 1, 0.3333333, 1,
-0.308192, 1.490281, -0.2911325, 0, 1, 0.3411765, 1,
-0.307174, 1.064899, -0.1588834, 0, 1, 0.345098, 1,
-0.3050508, -1.11853, -2.113884, 0, 1, 0.3529412, 1,
-0.30151, 0.118268, -1.652256, 0, 1, 0.3568628, 1,
-0.3011818, 0.3403019, -3.149643, 0, 1, 0.3647059, 1,
-0.3005913, 1.70081, -0.5560407, 0, 1, 0.3686275, 1,
-0.299691, -1.638366, -2.800911, 0, 1, 0.3764706, 1,
-0.2948228, -1.190844, -1.834226, 0, 1, 0.3803922, 1,
-0.2924688, 0.7171443, 1.180323, 0, 1, 0.3882353, 1,
-0.2913051, 1.601666, -0.7409574, 0, 1, 0.3921569, 1,
-0.2898173, 2.457161, -0.4808518, 0, 1, 0.4, 1,
-0.2887193, -1.305506, -2.895876, 0, 1, 0.4078431, 1,
-0.2854969, 0.05220659, -1.459344, 0, 1, 0.4117647, 1,
-0.2841483, 0.973288, -1.322161, 0, 1, 0.4196078, 1,
-0.2812524, 0.8017243, -1.335356, 0, 1, 0.4235294, 1,
-0.2811788, -0.4645104, -3.07367, 0, 1, 0.4313726, 1,
-0.2723371, 0.2851941, 0.4216627, 0, 1, 0.4352941, 1,
-0.267263, 0.2520697, 0.1262472, 0, 1, 0.4431373, 1,
-0.2671285, 1.69239, 0.5856231, 0, 1, 0.4470588, 1,
-0.2639105, 2.287918, -1.08985, 0, 1, 0.454902, 1,
-0.2594541, 0.03073992, 0.3757576, 0, 1, 0.4588235, 1,
-0.257521, -0.1737766, -3.376866, 0, 1, 0.4666667, 1,
-0.2555984, 0.7365486, 0.6612446, 0, 1, 0.4705882, 1,
-0.2543762, -0.02685118, -1.918547, 0, 1, 0.4784314, 1,
-0.252079, -0.002046771, -2.389629, 0, 1, 0.4823529, 1,
-0.2509029, 0.2799011, -0.09083349, 0, 1, 0.4901961, 1,
-0.2506879, 1.218403, -1.570411, 0, 1, 0.4941176, 1,
-0.2493875, -0.5789487, -3.827209, 0, 1, 0.5019608, 1,
-0.2480029, 1.029823, 0.512257, 0, 1, 0.509804, 1,
-0.2454637, -1.778555, -2.903202, 0, 1, 0.5137255, 1,
-0.2442939, -0.5953202, -3.125045, 0, 1, 0.5215687, 1,
-0.2442196, -0.9679385, -1.470536, 0, 1, 0.5254902, 1,
-0.2435977, 0.1383313, -0.6913566, 0, 1, 0.5333334, 1,
-0.2422854, -0.03634786, -1.903293, 0, 1, 0.5372549, 1,
-0.2400989, -0.33889, -0.52026, 0, 1, 0.5450981, 1,
-0.2377289, 0.411336, -0.104579, 0, 1, 0.5490196, 1,
-0.2375875, 1.434219, -1.168983, 0, 1, 0.5568628, 1,
-0.2362257, -0.4989971, -3.088878, 0, 1, 0.5607843, 1,
-0.2343828, -0.1398339, -2.388499, 0, 1, 0.5686275, 1,
-0.2324342, -1.365614, -5.011516, 0, 1, 0.572549, 1,
-0.2316035, -1.458237, -4.259958, 0, 1, 0.5803922, 1,
-0.2268285, -1.001328, -2.947688, 0, 1, 0.5843138, 1,
-0.226271, -0.1994312, -3.405113, 0, 1, 0.5921569, 1,
-0.2211827, -0.07060421, -1.731283, 0, 1, 0.5960785, 1,
-0.2206566, 1.579938, -0.400676, 0, 1, 0.6039216, 1,
-0.2081723, 0.8201513, -0.4736916, 0, 1, 0.6117647, 1,
-0.2039628, -0.3502116, -3.441534, 0, 1, 0.6156863, 1,
-0.1976662, 0.2015288, 1.336847, 0, 1, 0.6235294, 1,
-0.192857, -0.8265218, -2.577023, 0, 1, 0.627451, 1,
-0.1870518, -0.2468764, -1.79845, 0, 1, 0.6352941, 1,
-0.1839996, -2.892385, -3.892878, 0, 1, 0.6392157, 1,
-0.1828474, -0.1470025, -2.057291, 0, 1, 0.6470588, 1,
-0.1826338, -0.5608795, -2.275842, 0, 1, 0.6509804, 1,
-0.1786565, -0.7793225, -2.104677, 0, 1, 0.6588235, 1,
-0.1774575, -1.746532, -4.494762, 0, 1, 0.6627451, 1,
-0.1769135, 0.8116654, 2.075752, 0, 1, 0.6705883, 1,
-0.1744902, 0.8436936, -0.4488344, 0, 1, 0.6745098, 1,
-0.1706117, 0.5700563, -0.7642261, 0, 1, 0.682353, 1,
-0.1700734, -0.1483279, -1.273945, 0, 1, 0.6862745, 1,
-0.1671076, 0.09938617, -2.409281, 0, 1, 0.6941177, 1,
-0.1655727, 0.3723192, -1.29936, 0, 1, 0.7019608, 1,
-0.1632383, 0.2556182, -0.3870265, 0, 1, 0.7058824, 1,
-0.1621061, -0.395752, -1.915728, 0, 1, 0.7137255, 1,
-0.1619379, -0.8526947, -2.978019, 0, 1, 0.7176471, 1,
-0.1585226, -0.3877598, -2.014528, 0, 1, 0.7254902, 1,
-0.158499, -1.224433, -1.368363, 0, 1, 0.7294118, 1,
-0.1578208, 0.4295362, 1.340476, 0, 1, 0.7372549, 1,
-0.1566601, 0.4297425, -1.020352, 0, 1, 0.7411765, 1,
-0.1550132, -0.2214963, -3.254359, 0, 1, 0.7490196, 1,
-0.1510429, 1.540546, -0.2998589, 0, 1, 0.7529412, 1,
-0.1506088, 0.9480265, 0.4192808, 0, 1, 0.7607843, 1,
-0.147627, -0.3007988, -3.64762, 0, 1, 0.7647059, 1,
-0.1474971, -1.516689, -2.357821, 0, 1, 0.772549, 1,
-0.140798, -0.3637225, -1.121909, 0, 1, 0.7764706, 1,
-0.139883, -0.8091819, -3.94267, 0, 1, 0.7843137, 1,
-0.1386863, -1.108328, -3.919199, 0, 1, 0.7882353, 1,
-0.1365812, -1.947685, -3.272333, 0, 1, 0.7960784, 1,
-0.1328307, 2.347333, 0.28245, 0, 1, 0.8039216, 1,
-0.131113, -1.608822, -2.301904, 0, 1, 0.8078431, 1,
-0.1240508, 0.2320217, -0.1918954, 0, 1, 0.8156863, 1,
-0.1151299, 1.457957, -1.746083, 0, 1, 0.8196079, 1,
-0.1137318, 2.273908, 1.736208, 0, 1, 0.827451, 1,
-0.1108996, -0.2066802, -3.947641, 0, 1, 0.8313726, 1,
-0.1050969, 0.7885543, -0.713834, 0, 1, 0.8392157, 1,
-0.1033459, -0.2311717, -4.284172, 0, 1, 0.8431373, 1,
-0.1027541, -0.4841391, -2.391188, 0, 1, 0.8509804, 1,
-0.1001063, 1.672619, -0.154014, 0, 1, 0.854902, 1,
-0.0989256, -1.127418, -2.951119, 0, 1, 0.8627451, 1,
-0.0988847, 1.092764, -0.09399043, 0, 1, 0.8666667, 1,
-0.09758983, -2.770983, -2.421154, 0, 1, 0.8745098, 1,
-0.09505204, -1.944505, -2.830251, 0, 1, 0.8784314, 1,
-0.09119028, 0.4975004, -0.2351327, 0, 1, 0.8862745, 1,
-0.08792853, 0.09149376, -1.284257, 0, 1, 0.8901961, 1,
-0.08230095, 0.7372997, 0.9222958, 0, 1, 0.8980392, 1,
-0.08185497, -0.4763643, -1.276519, 0, 1, 0.9058824, 1,
-0.07884039, -0.7213061, -3.239877, 0, 1, 0.9098039, 1,
-0.07792993, 1.434187, -0.4021039, 0, 1, 0.9176471, 1,
-0.07486952, -0.5726309, -2.506343, 0, 1, 0.9215686, 1,
-0.0727505, 0.3266377, -0.7919635, 0, 1, 0.9294118, 1,
-0.06849144, -2.501196, -2.885715, 0, 1, 0.9333333, 1,
-0.05954688, -0.3883991, -2.046766, 0, 1, 0.9411765, 1,
-0.05763223, 1.050221, -0.8207243, 0, 1, 0.945098, 1,
-0.05759086, 0.8755652, -1.468224, 0, 1, 0.9529412, 1,
-0.05576564, 0.6619806, -2.556331, 0, 1, 0.9568627, 1,
-0.05549983, 1.333761, -0.3582214, 0, 1, 0.9647059, 1,
-0.05380968, 0.974292, -3.245607, 0, 1, 0.9686275, 1,
-0.05325481, 0.2187354, 0.8399348, 0, 1, 0.9764706, 1,
-0.05285117, -0.8122653, -0.9204208, 0, 1, 0.9803922, 1,
-0.04582474, 0.36769, -0.2036051, 0, 1, 0.9882353, 1,
-0.04546079, 1.268916, -1.623263, 0, 1, 0.9921569, 1,
-0.04052418, -0.4509511, -2.473568, 0, 1, 1, 1,
-0.03951535, -1.350548, -4.552555, 0, 0.9921569, 1, 1,
-0.03016725, 2.590945, 0.2014601, 0, 0.9882353, 1, 1,
-0.02519261, -0.02821566, -3.76017, 0, 0.9803922, 1, 1,
-0.0239071, -0.1074985, -2.737935, 0, 0.9764706, 1, 1,
-0.02333207, -0.5305542, -4.646214, 0, 0.9686275, 1, 1,
-0.02216559, 0.06887431, 0.5950899, 0, 0.9647059, 1, 1,
-0.01716197, 0.4254552, 2.143513, 0, 0.9568627, 1, 1,
-0.01058849, 0.2546543, -1.054246, 0, 0.9529412, 1, 1,
-0.009726441, 0.5727203, 0.806471, 0, 0.945098, 1, 1,
-0.007498971, -0.5069124, -3.298187, 0, 0.9411765, 1, 1,
-0.002852666, -1.068558, -3.3462, 0, 0.9333333, 1, 1,
-0.0005758698, -0.1889251, -3.452935, 0, 0.9294118, 1, 1,
0.0003888343, 0.8713685, 1.136001, 0, 0.9215686, 1, 1,
0.0004896302, 1.91714, 0.5542136, 0, 0.9176471, 1, 1,
0.005369106, 2.960025, -0.8307398, 0, 0.9098039, 1, 1,
0.006677093, 2.509888, 0.8072157, 0, 0.9058824, 1, 1,
0.006799295, 0.177911, 1.113949, 0, 0.8980392, 1, 1,
0.00767451, -1.754394, 3.842916, 0, 0.8901961, 1, 1,
0.009486469, -1.611124, 3.437533, 0, 0.8862745, 1, 1,
0.01323644, 1.521511, -1.904024, 0, 0.8784314, 1, 1,
0.01388881, -1.9396, 6.046277, 0, 0.8745098, 1, 1,
0.01839678, 0.3958391, 0.1326845, 0, 0.8666667, 1, 1,
0.01890401, -1.273966, 3.36531, 0, 0.8627451, 1, 1,
0.01963401, -0.496375, 2.55799, 0, 0.854902, 1, 1,
0.0234776, -0.9400543, 2.217238, 0, 0.8509804, 1, 1,
0.02580709, 0.3847421, 0.7861429, 0, 0.8431373, 1, 1,
0.0258088, 1.198812, 1.487829, 0, 0.8392157, 1, 1,
0.02598512, -0.01435336, 2.416011, 0, 0.8313726, 1, 1,
0.03188357, -2.104833, 3.98594, 0, 0.827451, 1, 1,
0.03209506, -0.5911362, 2.927795, 0, 0.8196079, 1, 1,
0.03212012, 0.5144289, -1.5712, 0, 0.8156863, 1, 1,
0.03214331, -0.9841928, 1.868539, 0, 0.8078431, 1, 1,
0.0366263, -1.060784, 3.210615, 0, 0.8039216, 1, 1,
0.03822607, 1.47643, 0.3367811, 0, 0.7960784, 1, 1,
0.0445226, 0.2651197, -1.881933, 0, 0.7882353, 1, 1,
0.04816014, 0.02070371, 2.657324, 0, 0.7843137, 1, 1,
0.05194184, -1.777022, 3.374956, 0, 0.7764706, 1, 1,
0.06080833, -1.689689, 1.279238, 0, 0.772549, 1, 1,
0.06329657, -0.8876895, 2.216277, 0, 0.7647059, 1, 1,
0.06388437, 0.7598706, 0.1678755, 0, 0.7607843, 1, 1,
0.06489058, 0.6577427, 1.886975, 0, 0.7529412, 1, 1,
0.06921954, 0.2532989, -1.328007, 0, 0.7490196, 1, 1,
0.06928913, -0.06354625, 1.757553, 0, 0.7411765, 1, 1,
0.07679996, 1.264723, -1.671029, 0, 0.7372549, 1, 1,
0.07940111, -1.258599, 2.72174, 0, 0.7294118, 1, 1,
0.07971197, 1.020447, -0.5820581, 0, 0.7254902, 1, 1,
0.08165701, -1.396579, 2.95671, 0, 0.7176471, 1, 1,
0.08201034, -0.7695808, 3.630929, 0, 0.7137255, 1, 1,
0.08697617, -0.112871, 3.416408, 0, 0.7058824, 1, 1,
0.08778554, 0.03078954, 1.754127, 0, 0.6980392, 1, 1,
0.0878297, 1.187082, 0.2148771, 0, 0.6941177, 1, 1,
0.09179809, 0.8493366, -0.90235, 0, 0.6862745, 1, 1,
0.09522596, -0.2902991, 1.367614, 0, 0.682353, 1, 1,
0.09686422, -0.7328468, 4.278951, 0, 0.6745098, 1, 1,
0.09848174, -1.556522, 3.290881, 0, 0.6705883, 1, 1,
0.09984038, 1.721994, 1.083551, 0, 0.6627451, 1, 1,
0.100645, -0.9880192, 3.663433, 0, 0.6588235, 1, 1,
0.1014485, -1.940089, 3.668991, 0, 0.6509804, 1, 1,
0.102083, 0.5977395, 0.06974522, 0, 0.6470588, 1, 1,
0.1046134, -1.003603, 3.896375, 0, 0.6392157, 1, 1,
0.1057855, 0.840704, -1.89218, 0, 0.6352941, 1, 1,
0.1098721, 2.128526, 0.1884936, 0, 0.627451, 1, 1,
0.1107228, -0.7400106, 2.960091, 0, 0.6235294, 1, 1,
0.1155164, -1.147018, 1.24463, 0, 0.6156863, 1, 1,
0.1169449, 0.9863717, 0.0706772, 0, 0.6117647, 1, 1,
0.1179686, 0.09208676, 1.928642, 0, 0.6039216, 1, 1,
0.1214409, 0.02909374, 2.096386, 0, 0.5960785, 1, 1,
0.1218058, 0.1294222, 0.8453467, 0, 0.5921569, 1, 1,
0.1384136, 0.5002748, -0.7091713, 0, 0.5843138, 1, 1,
0.1389272, -1.606555, 4.848806, 0, 0.5803922, 1, 1,
0.1398806, -1.552233, 2.499454, 0, 0.572549, 1, 1,
0.1497657, -0.03053784, 1.759085, 0, 0.5686275, 1, 1,
0.1513897, -0.9448026, 4.194747, 0, 0.5607843, 1, 1,
0.1515184, -0.3846097, 2.005632, 0, 0.5568628, 1, 1,
0.1529546, -0.6990402, 3.268558, 0, 0.5490196, 1, 1,
0.1553865, 0.06131035, -0.06822693, 0, 0.5450981, 1, 1,
0.158357, -0.4070855, 1.805397, 0, 0.5372549, 1, 1,
0.1587304, 1.405095, -0.01535615, 0, 0.5333334, 1, 1,
0.1590219, -0.8264338, 3.251724, 0, 0.5254902, 1, 1,
0.1669804, -1.067033, 2.802102, 0, 0.5215687, 1, 1,
0.1672143, -0.6620973, 2.398343, 0, 0.5137255, 1, 1,
0.1726574, 1.200347, 0.8851299, 0, 0.509804, 1, 1,
0.173296, 1.858522, -0.2984301, 0, 0.5019608, 1, 1,
0.1809466, 1.522503, 0.5932841, 0, 0.4941176, 1, 1,
0.1937334, 0.5738354, 0.2522455, 0, 0.4901961, 1, 1,
0.1953614, -1.644822, 3.195211, 0, 0.4823529, 1, 1,
0.1954882, -0.06675649, 2.600726, 0, 0.4784314, 1, 1,
0.2002212, 0.01301812, 3.042745, 0, 0.4705882, 1, 1,
0.2005522, 0.4462101, 1.886911, 0, 0.4666667, 1, 1,
0.2021157, 0.1167035, 0.2045898, 0, 0.4588235, 1, 1,
0.2036648, 1.908895, 0.1963963, 0, 0.454902, 1, 1,
0.2065597, -0.5449741, 2.842777, 0, 0.4470588, 1, 1,
0.2118258, -0.6349158, 3.164889, 0, 0.4431373, 1, 1,
0.211929, 0.2144734, -1.832851, 0, 0.4352941, 1, 1,
0.2168631, 0.3686042, -0.4068721, 0, 0.4313726, 1, 1,
0.2196604, 0.4608209, 0.6496441, 0, 0.4235294, 1, 1,
0.2208804, 0.04355952, 1.762738, 0, 0.4196078, 1, 1,
0.2214636, 0.1986555, -0.4290487, 0, 0.4117647, 1, 1,
0.2224633, -1.185507, 3.78646, 0, 0.4078431, 1, 1,
0.2265027, 1.120613, -1.084449, 0, 0.4, 1, 1,
0.2266831, 2.368663, 4.048741, 0, 0.3921569, 1, 1,
0.2273982, 1.180285, -1.591837, 0, 0.3882353, 1, 1,
0.2283337, -1.944601, 2.195468, 0, 0.3803922, 1, 1,
0.2328981, -0.2392174, 4.216743, 0, 0.3764706, 1, 1,
0.2340451, -0.4408127, 2.667362, 0, 0.3686275, 1, 1,
0.2395107, 1.720488, -0.7528151, 0, 0.3647059, 1, 1,
0.2406897, -0.6416096, 1.92187, 0, 0.3568628, 1, 1,
0.2416204, 0.1747533, 1.488384, 0, 0.3529412, 1, 1,
0.2423981, -2.285417, 2.409056, 0, 0.345098, 1, 1,
0.2464378, -1.828862, 2.763039, 0, 0.3411765, 1, 1,
0.247083, 0.256316, 1.551034, 0, 0.3333333, 1, 1,
0.2503012, 0.3203046, -2.785494, 0, 0.3294118, 1, 1,
0.2524049, -0.3702098, 1.607726, 0, 0.3215686, 1, 1,
0.2563211, -0.4563854, 3.085064, 0, 0.3176471, 1, 1,
0.2608289, 0.5663456, 0.4070131, 0, 0.3098039, 1, 1,
0.266287, -0.3892514, 1.113031, 0, 0.3058824, 1, 1,
0.271609, 0.02877767, 1.298773, 0, 0.2980392, 1, 1,
0.2749243, -0.5445205, 1.221103, 0, 0.2901961, 1, 1,
0.2778495, 0.5060632, 0.3931181, 0, 0.2862745, 1, 1,
0.2793977, 0.172527, 1.34385, 0, 0.2784314, 1, 1,
0.2861017, 1.716286, 0.1369937, 0, 0.2745098, 1, 1,
0.2864373, -0.6650059, 2.087636, 0, 0.2666667, 1, 1,
0.2896651, -0.8101947, 3.228175, 0, 0.2627451, 1, 1,
0.2924175, -0.8847694, 2.305436, 0, 0.254902, 1, 1,
0.2933607, -0.01000554, 0.3859473, 0, 0.2509804, 1, 1,
0.2973884, -0.359629, 3.336169, 0, 0.2431373, 1, 1,
0.3004036, 0.5449005, 0.4934715, 0, 0.2392157, 1, 1,
0.3006723, -1.246942, 4.117069, 0, 0.2313726, 1, 1,
0.3030085, -1.394017, 4.322913, 0, 0.227451, 1, 1,
0.3087091, -0.5036505, 2.887534, 0, 0.2196078, 1, 1,
0.3145328, -0.5394006, 2.36057, 0, 0.2156863, 1, 1,
0.3149751, 0.316234, 2.343148, 0, 0.2078431, 1, 1,
0.3150645, -1.038603, 1.021347, 0, 0.2039216, 1, 1,
0.3167915, -0.1432469, 1.96701, 0, 0.1960784, 1, 1,
0.3174125, -0.3136761, 3.157795, 0, 0.1882353, 1, 1,
0.3178269, -1.097193, 3.090988, 0, 0.1843137, 1, 1,
0.3209916, -0.3644639, 2.014353, 0, 0.1764706, 1, 1,
0.3223172, 1.061758, -0.7181643, 0, 0.172549, 1, 1,
0.3241397, 2.747693, -0.390855, 0, 0.1647059, 1, 1,
0.3274078, 0.9186888, -0.9273102, 0, 0.1607843, 1, 1,
0.3281656, 0.2446293, 1.183618, 0, 0.1529412, 1, 1,
0.3307246, -0.1154776, 2.595762, 0, 0.1490196, 1, 1,
0.3338301, -0.125878, 2.235344, 0, 0.1411765, 1, 1,
0.3345497, 0.8355807, 2.20358, 0, 0.1372549, 1, 1,
0.334939, 0.5588763, 0.6910686, 0, 0.1294118, 1, 1,
0.3367128, 1.735754, 0.8704773, 0, 0.1254902, 1, 1,
0.33991, 0.5629725, 1.543488, 0, 0.1176471, 1, 1,
0.3402336, -1.316258, 2.994888, 0, 0.1137255, 1, 1,
0.3423176, 1.145416, -0.05308105, 0, 0.1058824, 1, 1,
0.3439037, 1.762726, 1.168123, 0, 0.09803922, 1, 1,
0.3442183, -0.5844349, 1.747541, 0, 0.09411765, 1, 1,
0.3458019, 0.8521692, 0.7866437, 0, 0.08627451, 1, 1,
0.3516985, -0.2425682, 1.122068, 0, 0.08235294, 1, 1,
0.3531763, -1.658543, 1.940776, 0, 0.07450981, 1, 1,
0.3566453, -0.5663826, 1.786304, 0, 0.07058824, 1, 1,
0.3589437, -0.8884873, 4.491225, 0, 0.0627451, 1, 1,
0.364149, 0.7321528, 2.116506, 0, 0.05882353, 1, 1,
0.3643074, 1.279918, -0.2740528, 0, 0.05098039, 1, 1,
0.3660229, -0.0672666, 1.911502, 0, 0.04705882, 1, 1,
0.3679241, -0.7774752, 2.670035, 0, 0.03921569, 1, 1,
0.3692985, 1.747759, -0.6727495, 0, 0.03529412, 1, 1,
0.3700297, 0.2092783, 0.2179147, 0, 0.02745098, 1, 1,
0.3757101, -2.218687, 3.624902, 0, 0.02352941, 1, 1,
0.3767251, 0.753758, 1.231356, 0, 0.01568628, 1, 1,
0.3808421, 1.315226, 0.1827708, 0, 0.01176471, 1, 1,
0.3866976, 2.404871, -0.01551632, 0, 0.003921569, 1, 1,
0.3869525, -0.01107891, 1.685115, 0.003921569, 0, 1, 1,
0.3884903, 0.1344807, 0.7236961, 0.007843138, 0, 1, 1,
0.3905582, 0.8001887, -1.442776, 0.01568628, 0, 1, 1,
0.4018227, -0.1247237, 3.509566, 0.01960784, 0, 1, 1,
0.4029299, -1.232361, 2.834347, 0.02745098, 0, 1, 1,
0.4042773, -0.7334642, 3.406325, 0.03137255, 0, 1, 1,
0.4043729, -0.188426, 1.924158, 0.03921569, 0, 1, 1,
0.4043752, 0.6968732, -0.8929346, 0.04313726, 0, 1, 1,
0.4104662, -0.03177464, 1.807822, 0.05098039, 0, 1, 1,
0.4116599, 0.6113253, 0.8219385, 0.05490196, 0, 1, 1,
0.4158492, -2.096889, 3.098272, 0.0627451, 0, 1, 1,
0.4291451, -1.191046, 1.687496, 0.06666667, 0, 1, 1,
0.4388782, -1.184709, 4.089149, 0.07450981, 0, 1, 1,
0.4434629, 0.006859828, 0.3571935, 0.07843138, 0, 1, 1,
0.4444371, 0.9458263, 0.1763204, 0.08627451, 0, 1, 1,
0.4461872, -1.506625, 3.203587, 0.09019608, 0, 1, 1,
0.4472072, -0.6387749, 2.812777, 0.09803922, 0, 1, 1,
0.4503013, -1.226915, 2.328659, 0.1058824, 0, 1, 1,
0.4515514, -0.07603166, 1.931286, 0.1098039, 0, 1, 1,
0.4540502, 0.126849, 0.7639996, 0.1176471, 0, 1, 1,
0.462753, 0.6702384, 1.715922, 0.1215686, 0, 1, 1,
0.4671805, -0.7389742, 3.138742, 0.1294118, 0, 1, 1,
0.4685186, 0.9143317, 1.083267, 0.1333333, 0, 1, 1,
0.4688927, 2.060185, -0.02884523, 0.1411765, 0, 1, 1,
0.4691474, 0.3220935, 0.7315785, 0.145098, 0, 1, 1,
0.471925, -1.817221, 3.919451, 0.1529412, 0, 1, 1,
0.4752798, 0.1641727, 1.104047, 0.1568628, 0, 1, 1,
0.4776556, -0.4301671, 2.092018, 0.1647059, 0, 1, 1,
0.4793046, 0.2150266, -0.039559, 0.1686275, 0, 1, 1,
0.4799351, -1.744646, 3.464561, 0.1764706, 0, 1, 1,
0.4804256, -0.1066014, 1.925254, 0.1803922, 0, 1, 1,
0.4841668, 0.0237166, 2.312002, 0.1882353, 0, 1, 1,
0.4891087, -0.399589, 3.570621, 0.1921569, 0, 1, 1,
0.4891198, -2.018528, 5.100458, 0.2, 0, 1, 1,
0.4916748, 0.9549616, 1.097694, 0.2078431, 0, 1, 1,
0.4964026, -0.1847717, 2.156449, 0.2117647, 0, 1, 1,
0.4987491, 0.1450452, 2.035653, 0.2196078, 0, 1, 1,
0.5077095, -0.1076963, 1.094502, 0.2235294, 0, 1, 1,
0.5141395, -0.07993534, 2.324113, 0.2313726, 0, 1, 1,
0.5156761, 1.79518, -0.2342466, 0.2352941, 0, 1, 1,
0.5162143, 0.448203, 1.182341, 0.2431373, 0, 1, 1,
0.5165967, -0.4228427, 0.7466301, 0.2470588, 0, 1, 1,
0.5191099, -0.5635753, 2.859604, 0.254902, 0, 1, 1,
0.5208054, -1.424634, 3.809685, 0.2588235, 0, 1, 1,
0.5219325, 0.2088246, -0.2153369, 0.2666667, 0, 1, 1,
0.5224515, -0.216838, 2.927644, 0.2705882, 0, 1, 1,
0.522555, 0.08475016, 1.416854, 0.2784314, 0, 1, 1,
0.5238772, -0.4482974, 2.022123, 0.282353, 0, 1, 1,
0.5250872, 0.9676108, -0.8528959, 0.2901961, 0, 1, 1,
0.5288265, 0.8650419, 0.4428407, 0.2941177, 0, 1, 1,
0.5295385, 0.5612248, 0.9886256, 0.3019608, 0, 1, 1,
0.5316573, -0.7525058, 3.032076, 0.3098039, 0, 1, 1,
0.5333347, -0.6702445, 1.94347, 0.3137255, 0, 1, 1,
0.5371923, 0.8534144, 1.144402, 0.3215686, 0, 1, 1,
0.5374631, -1.278355, 2.017114, 0.3254902, 0, 1, 1,
0.5392737, -0.07552177, 2.53485, 0.3333333, 0, 1, 1,
0.5408813, -1.725502, 4.457843, 0.3372549, 0, 1, 1,
0.5409121, -0.2883193, 1.599445, 0.345098, 0, 1, 1,
0.5449352, -0.8906525, 3.008697, 0.3490196, 0, 1, 1,
0.5474246, 1.001312, 1.391327, 0.3568628, 0, 1, 1,
0.5522493, 1.483334, -0.2869647, 0.3607843, 0, 1, 1,
0.5597947, -1.200276, 4.279799, 0.3686275, 0, 1, 1,
0.5607231, 0.4572777, 0.7471457, 0.372549, 0, 1, 1,
0.5608516, 0.04896536, 0.1416099, 0.3803922, 0, 1, 1,
0.561805, -2.165435, 2.433761, 0.3843137, 0, 1, 1,
0.5630084, -0.3359978, 2.828086, 0.3921569, 0, 1, 1,
0.5662432, -0.3238349, 0.9289513, 0.3960784, 0, 1, 1,
0.5662557, 1.854324, -0.2117153, 0.4039216, 0, 1, 1,
0.5740435, 1.789907, -2.740928, 0.4117647, 0, 1, 1,
0.576, 0.2279326, 1.710318, 0.4156863, 0, 1, 1,
0.5793942, -2.123983, 4.100106, 0.4235294, 0, 1, 1,
0.5795699, -1.820078, 3.852089, 0.427451, 0, 1, 1,
0.5855594, -0.08469345, 1.280734, 0.4352941, 0, 1, 1,
0.5948459, -1.290229, 1.40061, 0.4392157, 0, 1, 1,
0.5968751, -0.4893197, 1.919133, 0.4470588, 0, 1, 1,
0.5976212, -0.2777368, 1.633855, 0.4509804, 0, 1, 1,
0.5976626, 0.5447317, 0.7792147, 0.4588235, 0, 1, 1,
0.6114035, -0.408275, 3.961173, 0.4627451, 0, 1, 1,
0.6167784, -0.465969, 1.837404, 0.4705882, 0, 1, 1,
0.6190448, 0.4845166, 2.064196, 0.4745098, 0, 1, 1,
0.6245113, 0.5825073, 0.9056042, 0.4823529, 0, 1, 1,
0.6263294, 1.147043, -0.6001529, 0.4862745, 0, 1, 1,
0.6279772, -0.8842189, 4.359715, 0.4941176, 0, 1, 1,
0.6286979, -0.3267045, 1.097644, 0.5019608, 0, 1, 1,
0.633356, -1.123144, 1.925398, 0.5058824, 0, 1, 1,
0.6379013, -0.8453424, 2.449713, 0.5137255, 0, 1, 1,
0.6393273, 0.5552579, 1.563652, 0.5176471, 0, 1, 1,
0.6448334, -1.368835, 2.175879, 0.5254902, 0, 1, 1,
0.6502326, -0.4742178, 0.2983415, 0.5294118, 0, 1, 1,
0.6522004, 1.677402, 1.020091, 0.5372549, 0, 1, 1,
0.6525928, -0.09881753, 1.868799, 0.5411765, 0, 1, 1,
0.6527913, 1.800333, 0.4574568, 0.5490196, 0, 1, 1,
0.6653738, -1.00431, 0.7223909, 0.5529412, 0, 1, 1,
0.6662955, 0.0536084, 1.739844, 0.5607843, 0, 1, 1,
0.6765761, 0.3144101, 1.376545, 0.5647059, 0, 1, 1,
0.6767288, 0.01608379, 1.510785, 0.572549, 0, 1, 1,
0.6784934, -2.70543, 2.394453, 0.5764706, 0, 1, 1,
0.6806204, -1.378661, 3.25897, 0.5843138, 0, 1, 1,
0.6843273, 0.3307103, 0.3723118, 0.5882353, 0, 1, 1,
0.6886951, -1.521273, 2.076522, 0.5960785, 0, 1, 1,
0.6937829, -1.087543, 1.990648, 0.6039216, 0, 1, 1,
0.6959875, -3.022197, 2.504335, 0.6078432, 0, 1, 1,
0.6973123, -0.4327566, 1.59671, 0.6156863, 0, 1, 1,
0.7009677, -1.19892, 2.535861, 0.6196079, 0, 1, 1,
0.7058679, -1.37201, 2.993888, 0.627451, 0, 1, 1,
0.7059084, -0.5924801, 3.134195, 0.6313726, 0, 1, 1,
0.7120588, -0.5704118, 2.146211, 0.6392157, 0, 1, 1,
0.7146736, 1.033049, -0.5412312, 0.6431373, 0, 1, 1,
0.7149132, -0.9705389, 2.701997, 0.6509804, 0, 1, 1,
0.7164152, -0.5286409, 3.002584, 0.654902, 0, 1, 1,
0.7164727, -0.479487, 2.331804, 0.6627451, 0, 1, 1,
0.7176161, 0.8310916, 1.076767, 0.6666667, 0, 1, 1,
0.7196842, 1.181907, -0.5115218, 0.6745098, 0, 1, 1,
0.7200503, 0.3696343, 1.913267, 0.6784314, 0, 1, 1,
0.723101, -0.5097048, 2.391538, 0.6862745, 0, 1, 1,
0.7256716, -0.08397055, 3.20757, 0.6901961, 0, 1, 1,
0.7274716, 0.310526, 0.4008052, 0.6980392, 0, 1, 1,
0.7304064, 1.326761, 0.2296184, 0.7058824, 0, 1, 1,
0.7509236, 0.8099777, 1.511243, 0.7098039, 0, 1, 1,
0.7515157, -0.5956353, 0.7406294, 0.7176471, 0, 1, 1,
0.7560422, 1.128345, 0.175155, 0.7215686, 0, 1, 1,
0.7569187, 0.4211178, 0.3680837, 0.7294118, 0, 1, 1,
0.7678978, 0.7725281, 0.6160035, 0.7333333, 0, 1, 1,
0.7735131, 1.670327, 0.6496463, 0.7411765, 0, 1, 1,
0.7806493, -0.8578043, 2.215046, 0.7450981, 0, 1, 1,
0.7850505, 0.1398247, 2.758529, 0.7529412, 0, 1, 1,
0.7888978, 1.159678, 1.378876, 0.7568628, 0, 1, 1,
0.7932003, 0.3141721, 0.7134043, 0.7647059, 0, 1, 1,
0.8003493, 0.7716107, 0.2698053, 0.7686275, 0, 1, 1,
0.8011619, 0.2026571, 2.503835, 0.7764706, 0, 1, 1,
0.8019486, 1.650503, -0.2221869, 0.7803922, 0, 1, 1,
0.8052924, 0.8832797, 2.944375, 0.7882353, 0, 1, 1,
0.8067213, 1.070926, -0.6747383, 0.7921569, 0, 1, 1,
0.8155384, -1.568637, 2.590259, 0.8, 0, 1, 1,
0.8248209, 0.3617162, 2.382577, 0.8078431, 0, 1, 1,
0.8301609, -0.5646701, 2.949646, 0.8117647, 0, 1, 1,
0.8302809, -1.667588, 2.611156, 0.8196079, 0, 1, 1,
0.8313541, 0.0330174, 2.060704, 0.8235294, 0, 1, 1,
0.8314923, -0.5653486, 3.230037, 0.8313726, 0, 1, 1,
0.8339497, -0.9150887, 0.07548001, 0.8352941, 0, 1, 1,
0.8347301, 2.419679, 0.1230645, 0.8431373, 0, 1, 1,
0.8356813, 1.700253, -0.4211884, 0.8470588, 0, 1, 1,
0.844314, 0.01284743, 0.9659171, 0.854902, 0, 1, 1,
0.8505404, 0.1341336, 1.769359, 0.8588235, 0, 1, 1,
0.852477, 1.395658, 0.3138871, 0.8666667, 0, 1, 1,
0.8565155, -1.499995, 3.67255, 0.8705882, 0, 1, 1,
0.8620642, -0.1812309, -0.03219958, 0.8784314, 0, 1, 1,
0.8630854, 0.9081753, 1.339855, 0.8823529, 0, 1, 1,
0.8645737, -0.5743582, 2.694096, 0.8901961, 0, 1, 1,
0.870997, 0.7926596, 0.4149317, 0.8941177, 0, 1, 1,
0.8733862, -0.1703986, 1.976573, 0.9019608, 0, 1, 1,
0.8745466, -0.2537758, 0.651117, 0.9098039, 0, 1, 1,
0.8763486, 0.42625, -0.00125293, 0.9137255, 0, 1, 1,
0.8829003, 0.7653705, 1.98534, 0.9215686, 0, 1, 1,
0.8851597, 0.9845848, 1.901894, 0.9254902, 0, 1, 1,
0.8861475, 0.148, 3.607234, 0.9333333, 0, 1, 1,
0.8910062, 0.1937464, 1.641354, 0.9372549, 0, 1, 1,
0.8945076, 0.6527106, 0.04592086, 0.945098, 0, 1, 1,
0.9016007, -0.01142541, 1.638636, 0.9490196, 0, 1, 1,
0.9019948, -0.9715084, 2.846739, 0.9568627, 0, 1, 1,
0.9075786, 0.5108615, 0.764857, 0.9607843, 0, 1, 1,
0.9173965, 0.2515416, 0.009638747, 0.9686275, 0, 1, 1,
0.9182677, -1.004693, 2.937505, 0.972549, 0, 1, 1,
0.9249948, -0.2882629, 1.37158, 0.9803922, 0, 1, 1,
0.9250968, -0.07111485, 0.7102534, 0.9843137, 0, 1, 1,
0.9288251, -0.5287833, 1.053427, 0.9921569, 0, 1, 1,
0.9293789, 0.4702261, 0.1113739, 0.9960784, 0, 1, 1,
0.9304486, -0.1844713, 1.985454, 1, 0, 0.9960784, 1,
0.9315423, -0.9975228, 4.843014, 1, 0, 0.9882353, 1,
0.9326419, -1.235749, 2.673678, 1, 0, 0.9843137, 1,
0.9347054, -1.123251, 3.336988, 1, 0, 0.9764706, 1,
0.9347945, 0.1010341, 1.561641, 1, 0, 0.972549, 1,
0.9388966, -0.9095718, 3.264251, 1, 0, 0.9647059, 1,
0.9413116, -0.9255339, 1.198643, 1, 0, 0.9607843, 1,
0.9415432, -0.642025, 1.389249, 1, 0, 0.9529412, 1,
0.947359, -1.390919, 0.9735983, 1, 0, 0.9490196, 1,
0.949158, 2.000667, -1.729984, 1, 0, 0.9411765, 1,
0.9593618, 0.6238979, 2.215654, 1, 0, 0.9372549, 1,
0.9683233, -0.667099, 0.0189924, 1, 0, 0.9294118, 1,
0.9770619, 2.721878, 1.694771, 1, 0, 0.9254902, 1,
0.9774874, -0.2408784, 1.821952, 1, 0, 0.9176471, 1,
0.9804145, 1.295808, -1.310014, 1, 0, 0.9137255, 1,
0.9836968, 0.6265106, 1.566571, 1, 0, 0.9058824, 1,
0.9841422, -0.7307434, 0.4732957, 1, 0, 0.9019608, 1,
0.9927334, -0.6012232, 1.799023, 1, 0, 0.8941177, 1,
0.9928194, -0.4121554, 0.2454846, 1, 0, 0.8862745, 1,
0.9948049, -0.768216, 2.004649, 1, 0, 0.8823529, 1,
0.9961261, 0.06928288, 1.316912, 1, 0, 0.8745098, 1,
1.000004, -0.8555666, 2.279818, 1, 0, 0.8705882, 1,
1.005657, 2.075737, 0.0421792, 1, 0, 0.8627451, 1,
1.011468, 0.5974406, 1.515712, 1, 0, 0.8588235, 1,
1.012425, -0.8092175, 1.697978, 1, 0, 0.8509804, 1,
1.014101, -1.138665, 2.370881, 1, 0, 0.8470588, 1,
1.016759, 1.427211, -0.09169615, 1, 0, 0.8392157, 1,
1.017972, -0.3324086, -0.03447802, 1, 0, 0.8352941, 1,
1.021444, -0.1955633, 1.996114, 1, 0, 0.827451, 1,
1.023905, -0.942327, 3.289733, 1, 0, 0.8235294, 1,
1.025251, -0.06460996, 2.744823, 1, 0, 0.8156863, 1,
1.027397, 1.479911, 1.405179, 1, 0, 0.8117647, 1,
1.028367, 0.9180326, 2.202363, 1, 0, 0.8039216, 1,
1.029293, 0.2785187, 2.354229, 1, 0, 0.7960784, 1,
1.033794, -0.2409551, 1.931257, 1, 0, 0.7921569, 1,
1.035141, 2.27213, 0.04223813, 1, 0, 0.7843137, 1,
1.040067, -1.516721, 4.121491, 1, 0, 0.7803922, 1,
1.052809, -0.1398792, 3.730979, 1, 0, 0.772549, 1,
1.062656, 1.37528, -0.3889887, 1, 0, 0.7686275, 1,
1.064725, 0.9519148, 0.09851419, 1, 0, 0.7607843, 1,
1.066001, -1.930024, 2.259308, 1, 0, 0.7568628, 1,
1.076396, -1.66875, 1.236253, 1, 0, 0.7490196, 1,
1.083921, 0.04203636, 1.36876, 1, 0, 0.7450981, 1,
1.084345, 0.2334148, 1.317006, 1, 0, 0.7372549, 1,
1.090146, 1.07846, 1.56849, 1, 0, 0.7333333, 1,
1.100491, -0.5382641, 1.287009, 1, 0, 0.7254902, 1,
1.10156, 1.729587, 1.142932, 1, 0, 0.7215686, 1,
1.119138, -2.299925, 3.647359, 1, 0, 0.7137255, 1,
1.119541, -1.624234, 4.452116, 1, 0, 0.7098039, 1,
1.123002, 0.1328418, 3.039483, 1, 0, 0.7019608, 1,
1.12382, 1.035407, 1.606882, 1, 0, 0.6941177, 1,
1.131654, 0.1191231, 1.011819, 1, 0, 0.6901961, 1,
1.132644, -0.03153364, 2.892525, 1, 0, 0.682353, 1,
1.136154, 0.2460326, 2.635648, 1, 0, 0.6784314, 1,
1.136804, -0.2475879, 3.717234, 1, 0, 0.6705883, 1,
1.137575, 0.736767, 0.7325334, 1, 0, 0.6666667, 1,
1.138556, -0.9616833, 2.687281, 1, 0, 0.6588235, 1,
1.140896, 0.5851688, -0.2260643, 1, 0, 0.654902, 1,
1.141307, 0.8332477, 1.202732, 1, 0, 0.6470588, 1,
1.142368, 0.5365005, 2.32375, 1, 0, 0.6431373, 1,
1.145133, -0.5483446, 0.9387773, 1, 0, 0.6352941, 1,
1.149139, 0.07670559, 2.265201, 1, 0, 0.6313726, 1,
1.155182, -0.2395875, 2.370855, 1, 0, 0.6235294, 1,
1.167382, -1.736144, 3.291757, 1, 0, 0.6196079, 1,
1.181333, -0.3219844, 1.831946, 1, 0, 0.6117647, 1,
1.18199, -0.601169, 1.260881, 1, 0, 0.6078432, 1,
1.184355, -1.280057, 2.062855, 1, 0, 0.6, 1,
1.192333, 0.6653233, 1.347803, 1, 0, 0.5921569, 1,
1.196914, -0.9370488, 2.413464, 1, 0, 0.5882353, 1,
1.202766, -1.111877, 2.795734, 1, 0, 0.5803922, 1,
1.205887, 1.273841, -0.2895238, 1, 0, 0.5764706, 1,
1.211365, -0.1553435, 2.587958, 1, 0, 0.5686275, 1,
1.216162, -0.6299985, 2.689519, 1, 0, 0.5647059, 1,
1.227362, 1.407698, 0.1341633, 1, 0, 0.5568628, 1,
1.246457, 0.4037874, -0.4480731, 1, 0, 0.5529412, 1,
1.248186, -0.07914425, 3.440456, 1, 0, 0.5450981, 1,
1.253528, 1.206674, 1.58038, 1, 0, 0.5411765, 1,
1.256961, -1.066139, 1.581934, 1, 0, 0.5333334, 1,
1.257048, 0.9864272, 1.012195, 1, 0, 0.5294118, 1,
1.259323, -0.7620822, 2.826333, 1, 0, 0.5215687, 1,
1.261375, -1.144099, 3.070686, 1, 0, 0.5176471, 1,
1.264783, -0.3085462, -0.6762683, 1, 0, 0.509804, 1,
1.269678, -0.4065211, -0.2594478, 1, 0, 0.5058824, 1,
1.272907, -1.400253, 2.785012, 1, 0, 0.4980392, 1,
1.285573, 0.6450239, 0.1835924, 1, 0, 0.4901961, 1,
1.289535, 0.4776866, 0.3416436, 1, 0, 0.4862745, 1,
1.295572, -1.260559, 2.928039, 1, 0, 0.4784314, 1,
1.295744, 0.6319565, 0.9771259, 1, 0, 0.4745098, 1,
1.302666, 2.17704, 0.8828095, 1, 0, 0.4666667, 1,
1.30284, 0.1792611, 0.6253145, 1, 0, 0.4627451, 1,
1.310669, 1.124953, 0.5757319, 1, 0, 0.454902, 1,
1.315922, 0.8058648, 0.8550238, 1, 0, 0.4509804, 1,
1.316421, -1.448394, 2.990746, 1, 0, 0.4431373, 1,
1.319609, 0.04276736, 3.017803, 1, 0, 0.4392157, 1,
1.322243, -0.7935303, 1.041897, 1, 0, 0.4313726, 1,
1.326626, 0.6779721, 0.386773, 1, 0, 0.427451, 1,
1.338234, -0.6744687, 1.809722, 1, 0, 0.4196078, 1,
1.344907, -1.74733, 3.202488, 1, 0, 0.4156863, 1,
1.352056, -1.601857, 0.9532803, 1, 0, 0.4078431, 1,
1.364409, 0.1892508, 2.318089, 1, 0, 0.4039216, 1,
1.36774, -1.218091, 4.753896, 1, 0, 0.3960784, 1,
1.372191, -0.7845269, 1.096968, 1, 0, 0.3882353, 1,
1.372406, 0.3031207, 1.654763, 1, 0, 0.3843137, 1,
1.389663, -1.040573, 1.44594, 1, 0, 0.3764706, 1,
1.400258, -0.8622118, 3.165517, 1, 0, 0.372549, 1,
1.410064, -0.1253634, 0.7138382, 1, 0, 0.3647059, 1,
1.413513, 0.6828985, 2.350567, 1, 0, 0.3607843, 1,
1.423766, -0.6713335, 1.584272, 1, 0, 0.3529412, 1,
1.433644, 1.386254, 2.243176, 1, 0, 0.3490196, 1,
1.43496, 0.2356181, 0.9677378, 1, 0, 0.3411765, 1,
1.435806, -1.358849, 2.955134, 1, 0, 0.3372549, 1,
1.435835, -1.207997, 3.439285, 1, 0, 0.3294118, 1,
1.448248, -0.3479053, 2.882703, 1, 0, 0.3254902, 1,
1.460377, 0.2597311, 2.248076, 1, 0, 0.3176471, 1,
1.476495, 0.88519, 2.174165, 1, 0, 0.3137255, 1,
1.491568, -0.05200059, 1.363903, 1, 0, 0.3058824, 1,
1.521092, 0.09456453, 1.148398, 1, 0, 0.2980392, 1,
1.523647, -0.4137926, 2.775403, 1, 0, 0.2941177, 1,
1.53944, -1.149784, 1.926927, 1, 0, 0.2862745, 1,
1.540145, -1.00787, 2.229825, 1, 0, 0.282353, 1,
1.553157, -1.444228, 3.132235, 1, 0, 0.2745098, 1,
1.558846, 1.799796, 1.0318, 1, 0, 0.2705882, 1,
1.562083, 1.57264, -0.8548328, 1, 0, 0.2627451, 1,
1.592989, -0.8586199, 2.006777, 1, 0, 0.2588235, 1,
1.617732, -1.310074, 2.121325, 1, 0, 0.2509804, 1,
1.620093, 0.4359966, 0.7223029, 1, 0, 0.2470588, 1,
1.624372, 0.250307, 2.13908, 1, 0, 0.2392157, 1,
1.630096, -0.2987078, 2.518388, 1, 0, 0.2352941, 1,
1.631457, -0.4597526, 3.664441, 1, 0, 0.227451, 1,
1.642037, 0.4840704, 0.3083739, 1, 0, 0.2235294, 1,
1.649366, -1.613299, 2.108454, 1, 0, 0.2156863, 1,
1.650041, 0.895403, 0.9117275, 1, 0, 0.2117647, 1,
1.677292, -0.3141428, 2.039395, 1, 0, 0.2039216, 1,
1.689887, -0.4693155, 2.411295, 1, 0, 0.1960784, 1,
1.705918, 0.1267377, 0.8472506, 1, 0, 0.1921569, 1,
1.706584, -0.9295164, 4.516261, 1, 0, 0.1843137, 1,
1.720676, 1.631206, 2.486442, 1, 0, 0.1803922, 1,
1.72071, 1.071221, 0.1602476, 1, 0, 0.172549, 1,
1.754611, -0.3270026, 2.248881, 1, 0, 0.1686275, 1,
1.822158, 0.8060611, 2.148846, 1, 0, 0.1607843, 1,
1.886355, -0.7680882, 1.769735, 1, 0, 0.1568628, 1,
1.914474, -0.08412137, 1.676781, 1, 0, 0.1490196, 1,
1.948347, -2.369568, 2.343442, 1, 0, 0.145098, 1,
1.950724, -1.461978, 4.79433, 1, 0, 0.1372549, 1,
1.958728, 0.2407044, 1.21839, 1, 0, 0.1333333, 1,
1.986888, 0.2080792, 1.80965, 1, 0, 0.1254902, 1,
1.993283, 1.295676, 1.733101, 1, 0, 0.1215686, 1,
2.013342, 0.4727443, 1.878371, 1, 0, 0.1137255, 1,
2.013641, -1.444989, 1.50181, 1, 0, 0.1098039, 1,
2.025081, -0.8363332, 2.978184, 1, 0, 0.1019608, 1,
2.070804, -1.654024, 0.5524379, 1, 0, 0.09411765, 1,
2.224413, -0.02446705, 1.566687, 1, 0, 0.09019608, 1,
2.236928, -0.1666661, 2.312959, 1, 0, 0.08235294, 1,
2.238317, 1.205904, 1.430067, 1, 0, 0.07843138, 1,
2.291322, 0.463214, 2.266952, 1, 0, 0.07058824, 1,
2.309106, -1.110205, 2.790073, 1, 0, 0.06666667, 1,
2.410534, 1.03179, 1.391478, 1, 0, 0.05882353, 1,
2.461225, -1.383752, 1.306117, 1, 0, 0.05490196, 1,
2.505018, 0.6571844, 2.496406, 1, 0, 0.04705882, 1,
2.597342, 0.3147792, 2.925838, 1, 0, 0.04313726, 1,
2.607587, -0.3009952, 1.531276, 1, 0, 0.03529412, 1,
2.622198, -1.715154, 1.048383, 1, 0, 0.03137255, 1,
2.803566, -1.08009, 0.9570925, 1, 0, 0.02352941, 1,
2.809928, 0.5445293, -0.3442716, 1, 0, 0.01960784, 1,
2.833201, -0.6791835, 1.653101, 1, 0, 0.01176471, 1,
2.990954, 0.4892574, 0.8515951, 1, 0, 0.007843138, 1
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
-0.02353394, -4.074667, -7.540867, 0, -0.5, 0.5, 0.5,
-0.02353394, -4.074667, -7.540867, 1, -0.5, 0.5, 0.5,
-0.02353394, -4.074667, -7.540867, 1, 1.5, 0.5, 0.5,
-0.02353394, -4.074667, -7.540867, 0, 1.5, 0.5, 0.5
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
-4.059934, 0.08243608, -7.540867, 0, -0.5, 0.5, 0.5,
-4.059934, 0.08243608, -7.540867, 1, -0.5, 0.5, 0.5,
-4.059934, 0.08243608, -7.540867, 1, 1.5, 0.5, 0.5,
-4.059934, 0.08243608, -7.540867, 0, 1.5, 0.5, 0.5
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
-4.059934, -4.074667, 0.2373226, 0, -0.5, 0.5, 0.5,
-4.059934, -4.074667, 0.2373226, 1, -0.5, 0.5, 0.5,
-4.059934, -4.074667, 0.2373226, 1, 1.5, 0.5, 0.5,
-4.059934, -4.074667, 0.2373226, 0, 1.5, 0.5, 0.5
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
-3, -3.115335, -5.7459,
2, -3.115335, -5.7459,
-3, -3.115335, -5.7459,
-3, -3.275224, -6.045061,
-2, -3.115335, -5.7459,
-2, -3.275224, -6.045061,
-1, -3.115335, -5.7459,
-1, -3.275224, -6.045061,
0, -3.115335, -5.7459,
0, -3.275224, -6.045061,
1, -3.115335, -5.7459,
1, -3.275224, -6.045061,
2, -3.115335, -5.7459,
2, -3.275224, -6.045061
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
-3, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
-3, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
-3, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
-3, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5,
-2, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
-2, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
-2, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
-2, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5,
-1, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
-1, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
-1, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
-1, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5,
0, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
0, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
0, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
0, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5,
1, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
1, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
1, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
1, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5,
2, -3.595001, -6.643384, 0, -0.5, 0.5, 0.5,
2, -3.595001, -6.643384, 1, -0.5, 0.5, 0.5,
2, -3.595001, -6.643384, 1, 1.5, 0.5, 0.5,
2, -3.595001, -6.643384, 0, 1.5, 0.5, 0.5
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
-3.128457, -3, -5.7459,
-3.128457, 3, -5.7459,
-3.128457, -3, -5.7459,
-3.283703, -3, -6.045061,
-3.128457, -2, -5.7459,
-3.283703, -2, -6.045061,
-3.128457, -1, -5.7459,
-3.283703, -1, -6.045061,
-3.128457, 0, -5.7459,
-3.283703, 0, -6.045061,
-3.128457, 1, -5.7459,
-3.283703, 1, -6.045061,
-3.128457, 2, -5.7459,
-3.283703, 2, -6.045061,
-3.128457, 3, -5.7459,
-3.283703, 3, -6.045061
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
-3.594195, -3, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, -3, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, -3, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, -3, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, -2, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, -2, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, -2, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, -2, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, -1, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, -1, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, -1, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, -1, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, 0, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, 0, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, 0, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, 0, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, 1, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, 1, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, 1, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, 1, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, 2, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, 2, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, 2, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, 2, -6.643384, 0, 1.5, 0.5, 0.5,
-3.594195, 3, -6.643384, 0, -0.5, 0.5, 0.5,
-3.594195, 3, -6.643384, 1, -0.5, 0.5, 0.5,
-3.594195, 3, -6.643384, 1, 1.5, 0.5, 0.5,
-3.594195, 3, -6.643384, 0, 1.5, 0.5, 0.5
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
-3.128457, -3.115335, -4,
-3.128457, -3.115335, 6,
-3.128457, -3.115335, -4,
-3.283703, -3.275224, -4,
-3.128457, -3.115335, -2,
-3.283703, -3.275224, -2,
-3.128457, -3.115335, 0,
-3.283703, -3.275224, 0,
-3.128457, -3.115335, 2,
-3.283703, -3.275224, 2,
-3.128457, -3.115335, 4,
-3.283703, -3.275224, 4,
-3.128457, -3.115335, 6,
-3.283703, -3.275224, 6
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
-3.594195, -3.595001, -4, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, -4, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, -4, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, -4, 0, 1.5, 0.5, 0.5,
-3.594195, -3.595001, -2, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, -2, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, -2, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, -2, 0, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 0, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 0, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 0, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 0, 0, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 2, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 2, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 2, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 2, 0, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 4, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 4, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 4, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 4, 0, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 6, 0, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 6, 1, -0.5, 0.5, 0.5,
-3.594195, -3.595001, 6, 1, 1.5, 0.5, 0.5,
-3.594195, -3.595001, 6, 0, 1.5, 0.5, 0.5
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
-3.128457, -3.115335, -5.7459,
-3.128457, 3.280208, -5.7459,
-3.128457, -3.115335, 6.220545,
-3.128457, 3.280208, 6.220545,
-3.128457, -3.115335, -5.7459,
-3.128457, -3.115335, 6.220545,
-3.128457, 3.280208, -5.7459,
-3.128457, 3.280208, 6.220545,
-3.128457, -3.115335, -5.7459,
3.081389, -3.115335, -5.7459,
-3.128457, -3.115335, 6.220545,
3.081389, -3.115335, 6.220545,
-3.128457, 3.280208, -5.7459,
3.081389, 3.280208, -5.7459,
-3.128457, 3.280208, 6.220545,
3.081389, 3.280208, 6.220545,
3.081389, -3.115335, -5.7459,
3.081389, 3.280208, -5.7459,
3.081389, -3.115335, 6.220545,
3.081389, 3.280208, 6.220545,
3.081389, -3.115335, -5.7459,
3.081389, -3.115335, 6.220545,
3.081389, 3.280208, -5.7459,
3.081389, 3.280208, 6.220545
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
var radius = 7.967967;
var distance = 35.45039;
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
mvMatrix.translate( 0.02353394, -0.08243608, -0.2373226 );
mvMatrix.scale( 1.387333, 1.347051, 0.7199399 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45039);
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
Pyrazophos<-read.table("Pyrazophos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyrazophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
y<-Pyrazophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
z<-Pyrazophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
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
-3.038022, -0.1154812, -1.259035, 0, 0, 1, 1, 1,
-2.868762, 0.527672, -1.481047, 1, 0, 0, 1, 1,
-2.859469, -0.6370822, -0.2877093, 1, 0, 0, 1, 1,
-2.707893, -0.087289, -2.505806, 1, 0, 0, 1, 1,
-2.69385, 0.01542205, -1.653513, 1, 0, 0, 1, 1,
-2.670781, -1.050138, -0.3068298, 1, 0, 0, 1, 1,
-2.647567, -0.2135018, -0.7429844, 0, 0, 0, 1, 1,
-2.589957, 0.8262122, 0.5565042, 0, 0, 0, 1, 1,
-2.56533, 1.853463, -2.269851, 0, 0, 0, 1, 1,
-2.448981, 0.1889595, -1.000661, 0, 0, 0, 1, 1,
-2.446564, 0.1749864, 2.359738, 0, 0, 0, 1, 1,
-2.366875, -0.3963458, -0.3565312, 0, 0, 0, 1, 1,
-2.313705, 1.868388, -0.7495422, 0, 0, 0, 1, 1,
-2.304058, 2.032664, -0.4164153, 1, 1, 1, 1, 1,
-2.292847, -1.765419, -2.124026, 1, 1, 1, 1, 1,
-2.27067, 0.1535591, -0.8643391, 1, 1, 1, 1, 1,
-2.251687, -0.1984426, -1.20546, 1, 1, 1, 1, 1,
-2.248314, 0.6168077, -2.67161, 1, 1, 1, 1, 1,
-2.247438, 0.4897558, -2.28964, 1, 1, 1, 1, 1,
-2.247266, 0.3864094, -0.1573333, 1, 1, 1, 1, 1,
-2.200223, -0.7115355, -2.03147, 1, 1, 1, 1, 1,
-2.187335, 1.18561, -2.977687, 1, 1, 1, 1, 1,
-2.181609, -0.09811889, -3.851714, 1, 1, 1, 1, 1,
-2.156251, 0.5559283, 0.03926344, 1, 1, 1, 1, 1,
-2.108906, -0.452928, -1.194276, 1, 1, 1, 1, 1,
-2.070337, -0.9570867, -4.03568, 1, 1, 1, 1, 1,
-2.064753, -2.370617, -2.748141, 1, 1, 1, 1, 1,
-2.052967, 0.4929715, -1.575652, 1, 1, 1, 1, 1,
-2.024161, -0.1852424, -2.175885, 0, 0, 1, 1, 1,
-2.020658, -1.116181, -3.628103, 1, 0, 0, 1, 1,
-2.008185, 0.5797758, -1.29747, 1, 0, 0, 1, 1,
-1.998162, -0.4626102, -2.093283, 1, 0, 0, 1, 1,
-1.962124, 0.1264884, -1.74201, 1, 0, 0, 1, 1,
-1.938414, -1.083546, -2.639794, 1, 0, 0, 1, 1,
-1.901437, 0.4500808, -1.43518, 0, 0, 0, 1, 1,
-1.869852, -0.6581796, -2.567612, 0, 0, 0, 1, 1,
-1.867615, -2.188997, -0.8475764, 0, 0, 0, 1, 1,
-1.865838, 0.3357712, -0.6664178, 0, 0, 0, 1, 1,
-1.863519, 0.6733103, -1.664257, 0, 0, 0, 1, 1,
-1.826778, 1.408621, -1.148721, 0, 0, 0, 1, 1,
-1.823555, -0.3355577, 1.293087, 0, 0, 0, 1, 1,
-1.810691, 0.5074095, -1.554355, 1, 1, 1, 1, 1,
-1.808827, 1.037672, 1.427298, 1, 1, 1, 1, 1,
-1.787534, -0.1278475, -0.6602821, 1, 1, 1, 1, 1,
-1.783132, 0.3308664, -3.331719, 1, 1, 1, 1, 1,
-1.775019, 1.052816, -0.6573107, 1, 1, 1, 1, 1,
-1.744305, -0.7671689, -1.281924, 1, 1, 1, 1, 1,
-1.736945, 0.7643043, -1.618442, 1, 1, 1, 1, 1,
-1.716597, -0.1499589, -0.6985079, 1, 1, 1, 1, 1,
-1.715117, -1.280053, -1.668048, 1, 1, 1, 1, 1,
-1.711445, 0.2422257, -0.6926793, 1, 1, 1, 1, 1,
-1.693029, 0.4297907, -1.627266, 1, 1, 1, 1, 1,
-1.69143, 1.424023, 0.5758185, 1, 1, 1, 1, 1,
-1.681545, -0.673449, -1.60382, 1, 1, 1, 1, 1,
-1.658285, 1.548275, -1.681703, 1, 1, 1, 1, 1,
-1.653374, -0.3114079, -1.442267, 1, 1, 1, 1, 1,
-1.639306, -1.68728, -3.100722, 0, 0, 1, 1, 1,
-1.630492, -1.11768, -2.029388, 1, 0, 0, 1, 1,
-1.622414, -0.108012, -0.4571357, 1, 0, 0, 1, 1,
-1.615619, -0.1905043, -1.055873, 1, 0, 0, 1, 1,
-1.612903, 1.139245, -1.165213, 1, 0, 0, 1, 1,
-1.582099, -0.2688088, -2.350372, 1, 0, 0, 1, 1,
-1.562333, -0.2583059, -1.655369, 0, 0, 0, 1, 1,
-1.5553, -1.769609, -1.884051, 0, 0, 0, 1, 1,
-1.546321, 0.75099, -1.364479, 0, 0, 0, 1, 1,
-1.538396, -0.1508509, -4.222418, 0, 0, 0, 1, 1,
-1.524871, -0.8830878, -0.8718458, 0, 0, 0, 1, 1,
-1.523519, 2.190138, -1.047607, 0, 0, 0, 1, 1,
-1.50957, -0.2666385, -0.1858351, 0, 0, 0, 1, 1,
-1.495859, 0.3050009, -2.009212, 1, 1, 1, 1, 1,
-1.483989, -2.039143, -3.107373, 1, 1, 1, 1, 1,
-1.473128, 0.3098707, -2.838184, 1, 1, 1, 1, 1,
-1.472961, -0.970881, -1.613724, 1, 1, 1, 1, 1,
-1.464498, -0.219984, -2.481603, 1, 1, 1, 1, 1,
-1.451328, -0.4311751, -2.462935, 1, 1, 1, 1, 1,
-1.4487, 2.119874, 1.028875, 1, 1, 1, 1, 1,
-1.431373, 1.061509, -2.032307, 1, 1, 1, 1, 1,
-1.422598, 0.693417, -1.11798, 1, 1, 1, 1, 1,
-1.413437, 0.927976, 0.2791288, 1, 1, 1, 1, 1,
-1.408783, -0.5798498, -1.77978, 1, 1, 1, 1, 1,
-1.404699, -0.9935692, -1.620396, 1, 1, 1, 1, 1,
-1.400357, 0.6404215, -2.588871, 1, 1, 1, 1, 1,
-1.38019, 0.3579926, -1.815628, 1, 1, 1, 1, 1,
-1.379897, 0.01608443, -1.185989, 1, 1, 1, 1, 1,
-1.371305, -0.1532222, -1.963615, 0, 0, 1, 1, 1,
-1.368078, 1.755044, -0.1310605, 1, 0, 0, 1, 1,
-1.364818, 0.9575691, -1.728407, 1, 0, 0, 1, 1,
-1.354858, 1.051225, -0.6289824, 1, 0, 0, 1, 1,
-1.354482, -0.4614727, -2.324792, 1, 0, 0, 1, 1,
-1.35133, -0.4649351, -1.5499, 1, 0, 0, 1, 1,
-1.34584, 1.246712, 0.3122669, 0, 0, 0, 1, 1,
-1.345696, -0.02102376, -0.6852528, 0, 0, 0, 1, 1,
-1.336306, -0.2102777, -1.347883, 0, 0, 0, 1, 1,
-1.315578, -0.03666697, -0.3576967, 0, 0, 0, 1, 1,
-1.308074, -1.161984, -2.576324, 0, 0, 0, 1, 1,
-1.30723, 0.3580862, -2.000722, 0, 0, 0, 1, 1,
-1.306429, -0.9706215, -2.776904, 0, 0, 0, 1, 1,
-1.302797, -0.7748351, -3.32306, 1, 1, 1, 1, 1,
-1.302572, 2.008724, -0.02594251, 1, 1, 1, 1, 1,
-1.292356, -0.02512251, -1.382383, 1, 1, 1, 1, 1,
-1.290887, 1.5294, 0.06094692, 1, 1, 1, 1, 1,
-1.287797, -1.970749, -1.940977, 1, 1, 1, 1, 1,
-1.278927, 0.9982802, 0.4036368, 1, 1, 1, 1, 1,
-1.276414, 0.1423599, -1.700363, 1, 1, 1, 1, 1,
-1.275929, -1.079492, -1.975135, 1, 1, 1, 1, 1,
-1.268307, -0.4639161, -2.819067, 1, 1, 1, 1, 1,
-1.266581, -0.2865678, -1.427777, 1, 1, 1, 1, 1,
-1.264995, -0.6917986, -2.230131, 1, 1, 1, 1, 1,
-1.248908, -0.3802088, -0.8385381, 1, 1, 1, 1, 1,
-1.248294, 0.5342623, -0.9956689, 1, 1, 1, 1, 1,
-1.247248, -0.4049735, -1.839875, 1, 1, 1, 1, 1,
-1.245451, -2.217592, -1.747188, 1, 1, 1, 1, 1,
-1.244074, 1.797029, -0.7958071, 0, 0, 1, 1, 1,
-1.225461, 0.6854562, -0.5733484, 1, 0, 0, 1, 1,
-1.214156, 0.03845606, -0.5866632, 1, 0, 0, 1, 1,
-1.213008, 0.4150614, 0.5022414, 1, 0, 0, 1, 1,
-1.212372, 0.5340832, -2.625195, 1, 0, 0, 1, 1,
-1.211429, -0.2796369, 0.6571994, 1, 0, 0, 1, 1,
-1.201661, 1.491151, -2.162905, 0, 0, 0, 1, 1,
-1.200061, -0.7379362, -0.2333582, 0, 0, 0, 1, 1,
-1.19052, -0.2890825, -0.2936282, 0, 0, 0, 1, 1,
-1.17749, -0.7291389, -2.711358, 0, 0, 0, 1, 1,
-1.17441, -2.10993, -4.618024, 0, 0, 0, 1, 1,
-1.17212, -0.4893586, -2.202421, 0, 0, 0, 1, 1,
-1.17091, 1.474801, -1.03258, 0, 0, 0, 1, 1,
-1.167578, -0.2903112, -1.757779, 1, 1, 1, 1, 1,
-1.164758, 1.24016, -2.20536, 1, 1, 1, 1, 1,
-1.159292, -1.463791, -3.029913, 1, 1, 1, 1, 1,
-1.157339, -0.1125929, 0.4633846, 1, 1, 1, 1, 1,
-1.152657, 0.9825928, -0.2516157, 1, 1, 1, 1, 1,
-1.145246, -0.180896, -3.75948, 1, 1, 1, 1, 1,
-1.131609, 2.210795, 0.08791923, 1, 1, 1, 1, 1,
-1.122668, 1.025551, 0.6837319, 1, 1, 1, 1, 1,
-1.11728, -1.171944, -2.554107, 1, 1, 1, 1, 1,
-1.107082, -0.8705279, -1.441613, 1, 1, 1, 1, 1,
-1.103088, 0.7039379, -1.201414, 1, 1, 1, 1, 1,
-1.101815, -1.395216, -2.03538, 1, 1, 1, 1, 1,
-1.099571, -1.675117, -2.715353, 1, 1, 1, 1, 1,
-1.093318, 0.2543131, -1.721696, 1, 1, 1, 1, 1,
-1.088704, -0.9118949, -1.4022, 1, 1, 1, 1, 1,
-1.088171, 0.6836303, -0.6704978, 0, 0, 1, 1, 1,
-1.078235, -1.105941, -2.345869, 1, 0, 0, 1, 1,
-1.074852, -0.9323874, -2.250304, 1, 0, 0, 1, 1,
-1.069373, 0.9753454, -0.3510507, 1, 0, 0, 1, 1,
-1.058782, 1.439963, -3.832194, 1, 0, 0, 1, 1,
-1.057229, -0.555143, -1.45139, 1, 0, 0, 1, 1,
-1.057004, 1.020545, -1.026354, 0, 0, 0, 1, 1,
-1.051623, 0.05598741, -0.454472, 0, 0, 0, 1, 1,
-1.04178, 0.7596609, 0.1688767, 0, 0, 0, 1, 1,
-1.039988, -1.173879, -2.772266, 0, 0, 0, 1, 1,
-1.036265, -0.4174527, -1.120273, 0, 0, 0, 1, 1,
-1.017122, -0.7159557, -2.774211, 0, 0, 0, 1, 1,
-1.011567, -0.8301732, -1.403386, 0, 0, 0, 1, 1,
-1.009343, -0.5865329, -1.468634, 1, 1, 1, 1, 1,
-1.002103, 1.36482, -0.7656128, 1, 1, 1, 1, 1,
-1.001433, 1.268613, -0.6618843, 1, 1, 1, 1, 1,
-0.995843, -0.6611558, -3.624426, 1, 1, 1, 1, 1,
-0.9949195, -1.281124, -1.920911, 1, 1, 1, 1, 1,
-0.9947284, 0.9816337, -0.7112774, 1, 1, 1, 1, 1,
-0.9942884, -0.02127898, -3.136147, 1, 1, 1, 1, 1,
-0.9911904, 1.957862, -0.2235066, 1, 1, 1, 1, 1,
-0.9838696, 0.8491306, 0.3070371, 1, 1, 1, 1, 1,
-0.9805247, -0.5577029, -2.311099, 1, 1, 1, 1, 1,
-0.9751456, 0.3992178, -0.9870355, 1, 1, 1, 1, 1,
-0.963645, -0.1571957, -1.86755, 1, 1, 1, 1, 1,
-0.9580103, 0.5404864, 0.6864637, 1, 1, 1, 1, 1,
-0.9508195, -0.001639824, -1.450129, 1, 1, 1, 1, 1,
-0.9428288, 0.2374534, -0.1306609, 1, 1, 1, 1, 1,
-0.9352877, -0.3727081, -1.943745, 0, 0, 1, 1, 1,
-0.9333192, 1.090257, -0.002665402, 1, 0, 0, 1, 1,
-0.9280683, -1.809232, -3.081954, 1, 0, 0, 1, 1,
-0.9274591, 0.3383229, -1.194231, 1, 0, 0, 1, 1,
-0.9268228, -0.1726201, -1.643553, 1, 0, 0, 1, 1,
-0.9140921, 0.951322, -0.7596719, 1, 0, 0, 1, 1,
-0.9065942, -0.005677766, -0.8243778, 0, 0, 0, 1, 1,
-0.9049263, -1.637564, -4.06429, 0, 0, 0, 1, 1,
-0.9024584, -0.203434, -1.837246, 0, 0, 0, 1, 1,
-0.9024025, -0.7017198, -1.717409, 0, 0, 0, 1, 1,
-0.9018711, -0.3021578, -1.762985, 0, 0, 0, 1, 1,
-0.8955607, 0.2425147, -2.377649, 0, 0, 0, 1, 1,
-0.8933148, -0.6338953, -1.947542, 0, 0, 0, 1, 1,
-0.8920831, 0.4681836, 0.2196973, 1, 1, 1, 1, 1,
-0.8912095, 0.438613, 0.6633505, 1, 1, 1, 1, 1,
-0.8891255, -1.910481, -3.872134, 1, 1, 1, 1, 1,
-0.8861911, 0.8227599, -3.1803, 1, 1, 1, 1, 1,
-0.882857, 0.4535494, -0.398693, 1, 1, 1, 1, 1,
-0.8770587, 1.0915, 0.6492379, 1, 1, 1, 1, 1,
-0.8763747, -0.2443305, -2.016541, 1, 1, 1, 1, 1,
-0.8658106, 1.036873, -1.480898, 1, 1, 1, 1, 1,
-0.8611038, -0.1509199, -1.686685, 1, 1, 1, 1, 1,
-0.8604187, -1.087327, -2.077474, 1, 1, 1, 1, 1,
-0.859046, 0.5877317, -2.639901, 1, 1, 1, 1, 1,
-0.8581457, -1.368402, -3.609681, 1, 1, 1, 1, 1,
-0.8511628, 0.7042933, -1.032934, 1, 1, 1, 1, 1,
-0.8457199, 0.8461334, 1.294095, 1, 1, 1, 1, 1,
-0.8409841, 0.8526627, -2.12552, 1, 1, 1, 1, 1,
-0.840597, -1.686121, -2.052026, 0, 0, 1, 1, 1,
-0.838496, -0.6473729, -1.655296, 1, 0, 0, 1, 1,
-0.8355973, -0.8612042, -2.297575, 1, 0, 0, 1, 1,
-0.8315567, -0.08743323, -2.778988, 1, 0, 0, 1, 1,
-0.819598, -1.631917, -3.427178, 1, 0, 0, 1, 1,
-0.8188815, -1.065015, -2.846404, 1, 0, 0, 1, 1,
-0.8128752, -0.5785772, -2.344427, 0, 0, 0, 1, 1,
-0.8108987, -1.49229, -3.37936, 0, 0, 0, 1, 1,
-0.8071512, 0.2007892, -2.043631, 0, 0, 0, 1, 1,
-0.8013074, 1.395262, 0.4401029, 0, 0, 0, 1, 1,
-0.8003595, -2.237863, -1.867987, 0, 0, 0, 1, 1,
-0.7998282, -1.087524, -2.694444, 0, 0, 0, 1, 1,
-0.7919332, 0.2573209, -0.7155038, 0, 0, 0, 1, 1,
-0.7901958, 0.6389548, -1.681982, 1, 1, 1, 1, 1,
-0.7855855, -0.3683822, -2.188231, 1, 1, 1, 1, 1,
-0.7826782, -1.473281, -3.385137, 1, 1, 1, 1, 1,
-0.7736196, -0.01349413, -2.377866, 1, 1, 1, 1, 1,
-0.7733654, 1.558992, -0.9058441, 1, 1, 1, 1, 1,
-0.7713476, 0.148358, -0.5319023, 1, 1, 1, 1, 1,
-0.769208, 0.2502818, 0.00442078, 1, 1, 1, 1, 1,
-0.7656046, -1.458264, -1.770971, 1, 1, 1, 1, 1,
-0.7647181, 0.1996516, -0.9896951, 1, 1, 1, 1, 1,
-0.7621014, -0.8839421, -2.174789, 1, 1, 1, 1, 1,
-0.7598606, 0.767632, -1.054219, 1, 1, 1, 1, 1,
-0.7401311, -0.1096421, 0.04960933, 1, 1, 1, 1, 1,
-0.7376534, -0.7248716, -2.42337, 1, 1, 1, 1, 1,
-0.7327383, -1.566672, -3.109492, 1, 1, 1, 1, 1,
-0.7326401, -0.9406249, -2.199574, 1, 1, 1, 1, 1,
-0.7296872, -0.5206922, -2.062312, 0, 0, 1, 1, 1,
-0.7284758, -1.08801, -3.104853, 1, 0, 0, 1, 1,
-0.7269102, -0.9917442, -1.567803, 1, 0, 0, 1, 1,
-0.7241791, 0.2344747, -2.54339, 1, 0, 0, 1, 1,
-0.7155501, 0.6043901, 1.326394, 1, 0, 0, 1, 1,
-0.7100883, 0.3583547, -1.912521, 1, 0, 0, 1, 1,
-0.7086591, -0.2889232, -2.111788, 0, 0, 0, 1, 1,
-0.7077377, -0.1199831, -2.887149, 0, 0, 0, 1, 1,
-0.7056524, 0.6717631, -2.075462, 0, 0, 0, 1, 1,
-0.7046706, 0.422359, -2.916239, 0, 0, 0, 1, 1,
-0.7021602, -0.2150298, -2.537802, 0, 0, 0, 1, 1,
-0.6978784, -2.005367, -1.418567, 0, 0, 0, 1, 1,
-0.6936685, -1.68111, -1.763633, 0, 0, 0, 1, 1,
-0.6922488, -2.023635, -3.285468, 1, 1, 1, 1, 1,
-0.6917326, -0.1392788, -1.746201, 1, 1, 1, 1, 1,
-0.6892639, -0.3378766, -3.383452, 1, 1, 1, 1, 1,
-0.687608, -0.9719934, -1.224308, 1, 1, 1, 1, 1,
-0.6859476, -0.04145567, -1.472059, 1, 1, 1, 1, 1,
-0.6811468, -0.4656925, -1.114184, 1, 1, 1, 1, 1,
-0.6723674, -1.103779, -3.696594, 1, 1, 1, 1, 1,
-0.6692318, 0.2337508, -1.842095, 1, 1, 1, 1, 1,
-0.6651506, 0.1854422, -1.440693, 1, 1, 1, 1, 1,
-0.6648889, -1.845121, -3.994792, 1, 1, 1, 1, 1,
-0.6648654, -1.428518, -2.626556, 1, 1, 1, 1, 1,
-0.6631843, -0.5504667, -0.8407647, 1, 1, 1, 1, 1,
-0.6618213, -0.9173422, -1.352911, 1, 1, 1, 1, 1,
-0.6585456, -0.05830719, -1.116932, 1, 1, 1, 1, 1,
-0.6533551, -0.4962865, -2.196148, 1, 1, 1, 1, 1,
-0.6523824, -0.07159182, -0.7514688, 0, 0, 1, 1, 1,
-0.6510927, -3.00563, -4.054305, 1, 0, 0, 1, 1,
-0.6487849, 0.5622827, -0.8875582, 1, 0, 0, 1, 1,
-0.6483116, -0.307827, -1.962146, 1, 0, 0, 1, 1,
-0.6452046, -0.2156914, -2.593423, 1, 0, 0, 1, 1,
-0.6370585, 0.6543386, 0.07287098, 1, 0, 0, 1, 1,
-0.6359693, 3.187069, 1.182223, 0, 0, 0, 1, 1,
-0.6352781, -1.411497, -5.571631, 0, 0, 0, 1, 1,
-0.6345496, -0.3991307, -2.84454, 0, 0, 0, 1, 1,
-0.6329802, -1.578383, -2.485429, 0, 0, 0, 1, 1,
-0.6319402, -0.5703089, -1.779857, 0, 0, 0, 1, 1,
-0.6310095, 1.043775, -0.07548895, 0, 0, 0, 1, 1,
-0.6273675, 2.343264, -0.286389, 0, 0, 0, 1, 1,
-0.6177535, 0.1673997, -0.8115858, 1, 1, 1, 1, 1,
-0.6176984, 1.003177, 1.231943, 1, 1, 1, 1, 1,
-0.6160731, -1.060254, -3.90852, 1, 1, 1, 1, 1,
-0.6117373, -0.7917247, -3.353061, 1, 1, 1, 1, 1,
-0.6109079, 0.2364867, -0.6577789, 1, 1, 1, 1, 1,
-0.6055292, -0.145882, -3.118628, 1, 1, 1, 1, 1,
-0.6054836, 2.121908, -1.122159, 1, 1, 1, 1, 1,
-0.6038024, -0.9826216, -2.005609, 1, 1, 1, 1, 1,
-0.6037638, -0.0235347, -2.384641, 1, 1, 1, 1, 1,
-0.6022194, -2.020325, -2.259839, 1, 1, 1, 1, 1,
-0.5976539, -1.455049, -2.726163, 1, 1, 1, 1, 1,
-0.5957459, -0.464629, -2.474414, 1, 1, 1, 1, 1,
-0.5905858, 0.4663215, -1.914312, 1, 1, 1, 1, 1,
-0.5817555, 2.136093, 0.1820755, 1, 1, 1, 1, 1,
-0.5793634, 1.125036, 1.094992, 1, 1, 1, 1, 1,
-0.5731313, -1.585396, -2.285622, 0, 0, 1, 1, 1,
-0.5730718, -0.8674768, -4.085951, 1, 0, 0, 1, 1,
-0.5700418, 0.1195559, -0.4833293, 1, 0, 0, 1, 1,
-0.5626525, 0.2348903, 0.007167099, 1, 0, 0, 1, 1,
-0.556644, -0.05182991, 0.8928139, 1, 0, 0, 1, 1,
-0.5563381, -0.4789227, -1.482254, 1, 0, 0, 1, 1,
-0.555981, 0.8161242, -1.788597, 0, 0, 0, 1, 1,
-0.5526174, -2.717168, -3.292816, 0, 0, 0, 1, 1,
-0.5496644, 1.852506, 0.9566461, 0, 0, 0, 1, 1,
-0.5476282, 0.9267417, -1.515564, 0, 0, 0, 1, 1,
-0.5358034, 0.6582663, -0.4175878, 0, 0, 0, 1, 1,
-0.5354274, 0.09034244, -1.196473, 0, 0, 0, 1, 1,
-0.5325371, 1.609914, -0.9837955, 0, 0, 0, 1, 1,
-0.5323997, -2.064777, -2.089948, 1, 1, 1, 1, 1,
-0.5261702, -2.226944, -1.662159, 1, 1, 1, 1, 1,
-0.5253718, -1.087327, -3.428517, 1, 1, 1, 1, 1,
-0.5228266, 1.130794, -2.510676, 1, 1, 1, 1, 1,
-0.5211396, -1.619339, -1.914982, 1, 1, 1, 1, 1,
-0.5186891, -1.283547, -2.424083, 1, 1, 1, 1, 1,
-0.5184776, 0.04413037, -0.8451837, 1, 1, 1, 1, 1,
-0.5123389, -0.1237351, -1.644117, 1, 1, 1, 1, 1,
-0.5116227, 0.53096, -1.498299, 1, 1, 1, 1, 1,
-0.5112649, 0.1716506, -1.97982, 1, 1, 1, 1, 1,
-0.5101947, -0.7887924, -1.871014, 1, 1, 1, 1, 1,
-0.5082928, -0.4113614, -3.042616, 1, 1, 1, 1, 1,
-0.5054294, -0.7332571, -2.899339, 1, 1, 1, 1, 1,
-0.5048988, -0.3693865, -3.574136, 1, 1, 1, 1, 1,
-0.4983193, -0.1813843, -4.244028, 1, 1, 1, 1, 1,
-0.4982146, -0.6246819, -2.425706, 0, 0, 1, 1, 1,
-0.49591, 0.606225, 0.06799968, 1, 0, 0, 1, 1,
-0.4945561, 1.014302, -0.448603, 1, 0, 0, 1, 1,
-0.4913746, 0.5771111, -0.701426, 1, 0, 0, 1, 1,
-0.4901309, -0.9066716, -1.162902, 1, 0, 0, 1, 1,
-0.4861787, 0.8790472, -0.9037505, 1, 0, 0, 1, 1,
-0.4853904, -0.3002308, -2.718358, 0, 0, 0, 1, 1,
-0.4807551, 0.5836722, -0.6965531, 0, 0, 0, 1, 1,
-0.4770626, -1.612708, -0.7543149, 0, 0, 0, 1, 1,
-0.4734077, 1.517702, -1.828468, 0, 0, 0, 1, 1,
-0.4726883, -0.1551291, -2.789364, 0, 0, 0, 1, 1,
-0.4713654, 0.3117891, -1.394718, 0, 0, 0, 1, 1,
-0.4660252, -0.03402545, -0.914781, 0, 0, 0, 1, 1,
-0.4657634, -1.075152, -3.472511, 1, 1, 1, 1, 1,
-0.4600987, 1.315896, -0.4769049, 1, 1, 1, 1, 1,
-0.4596, 0.1665286, -0.4024902, 1, 1, 1, 1, 1,
-0.4594736, 1.592421, 0.02246654, 1, 1, 1, 1, 1,
-0.4594672, -0.3686863, 0.28383, 1, 1, 1, 1, 1,
-0.4574931, -1.118804, -3.154243, 1, 1, 1, 1, 1,
-0.4549193, -1.728158, -2.58214, 1, 1, 1, 1, 1,
-0.4533301, -0.8700312, -1.858258, 1, 1, 1, 1, 1,
-0.447981, -0.9863414, -2.02212, 1, 1, 1, 1, 1,
-0.447915, 0.05109223, -3.604711, 1, 1, 1, 1, 1,
-0.4469783, -0.4996967, -1.815854, 1, 1, 1, 1, 1,
-0.446674, -1.752067, -2.281695, 1, 1, 1, 1, 1,
-0.4430592, -1.92057, -3.868084, 1, 1, 1, 1, 1,
-0.4424281, 0.0570281, -0.3659868, 1, 1, 1, 1, 1,
-0.4348495, -0.4631626, -1.871584, 1, 1, 1, 1, 1,
-0.4334263, 0.4792273, -1.080813, 0, 0, 1, 1, 1,
-0.431904, -0.1407162, -3.284123, 1, 0, 0, 1, 1,
-0.4289, -0.6448099, -2.284684, 1, 0, 0, 1, 1,
-0.4232424, 1.990443, -0.03267453, 1, 0, 0, 1, 1,
-0.4221375, -0.1212536, -3.386266, 1, 0, 0, 1, 1,
-0.4220698, 0.5261391, -0.1915512, 1, 0, 0, 1, 1,
-0.4177427, -1.740058, -4.442208, 0, 0, 0, 1, 1,
-0.4143992, -0.9020889, -3.910715, 0, 0, 0, 1, 1,
-0.4143199, -0.4994513, -2.041748, 0, 0, 0, 1, 1,
-0.410981, -0.7260606, -3.02639, 0, 0, 0, 1, 1,
-0.4046342, 0.3015698, -0.3499491, 0, 0, 0, 1, 1,
-0.4033235, 0.1634438, -1.145019, 0, 0, 0, 1, 1,
-0.4024003, 1.627363, -0.9064549, 0, 0, 0, 1, 1,
-0.4021599, 1.290156, 0.0857512, 1, 1, 1, 1, 1,
-0.3946975, 0.2929046, -0.3578033, 1, 1, 1, 1, 1,
-0.3900794, 0.3025596, -1.306981, 1, 1, 1, 1, 1,
-0.3880211, -0.3710722, -1.462698, 1, 1, 1, 1, 1,
-0.382321, 0.4323684, -0.7451642, 1, 1, 1, 1, 1,
-0.3810714, -0.3511521, -1.67147, 1, 1, 1, 1, 1,
-0.3790477, -0.7323425, -2.379322, 1, 1, 1, 1, 1,
-0.3711172, 0.3265939, -1.020793, 1, 1, 1, 1, 1,
-0.3697334, 0.0870342, -0.3896703, 1, 1, 1, 1, 1,
-0.3693602, 1.363791, -0.1014115, 1, 1, 1, 1, 1,
-0.3623177, 0.4258231, -0.9769687, 1, 1, 1, 1, 1,
-0.3607468, -1.131346, -2.858701, 1, 1, 1, 1, 1,
-0.3564705, 2.893656, 0.2304517, 1, 1, 1, 1, 1,
-0.3539723, 1.325001, -0.5439497, 1, 1, 1, 1, 1,
-0.3538322, -0.9007432, -0.8305421, 1, 1, 1, 1, 1,
-0.350007, -0.5248293, -2.728702, 0, 0, 1, 1, 1,
-0.3495441, 0.3509329, 0.7110119, 1, 0, 0, 1, 1,
-0.3460702, 0.01858114, -2.140181, 1, 0, 0, 1, 1,
-0.3438803, -0.7055904, -3.319513, 1, 0, 0, 1, 1,
-0.3428309, -0.5989847, -2.577758, 1, 0, 0, 1, 1,
-0.3413647, 0.08645732, -0.8159205, 1, 0, 0, 1, 1,
-0.3385695, 1.612357, 0.3499653, 0, 0, 0, 1, 1,
-0.3367219, -0.1209845, -1.155105, 0, 0, 0, 1, 1,
-0.3365922, 1.117199, -0.8890119, 0, 0, 0, 1, 1,
-0.3354849, 0.3537494, 0.893128, 0, 0, 0, 1, 1,
-0.3353367, 0.1307073, -1.996856, 0, 0, 0, 1, 1,
-0.3340971, 0.8383003, -1.527064, 0, 0, 0, 1, 1,
-0.3326004, 0.4960045, -0.8907323, 0, 0, 0, 1, 1,
-0.3307817, 1.890279, 0.6638002, 1, 1, 1, 1, 1,
-0.32979, -0.4797894, -2.168252, 1, 1, 1, 1, 1,
-0.3258513, -0.467955, -0.9559091, 1, 1, 1, 1, 1,
-0.3251841, 0.04623425, -2.283495, 1, 1, 1, 1, 1,
-0.3183464, -0.3609467, -1.141393, 1, 1, 1, 1, 1,
-0.3172588, -0.04064238, -2.384289, 1, 1, 1, 1, 1,
-0.3156605, 1.179409, -2.005561, 1, 1, 1, 1, 1,
-0.3142871, 0.7362694, -1.998797, 1, 1, 1, 1, 1,
-0.3118041, -1.042616, -1.83756, 1, 1, 1, 1, 1,
-0.3106614, -0.4290387, -1.492694, 1, 1, 1, 1, 1,
-0.3105331, 1.010948, -0.5458618, 1, 1, 1, 1, 1,
-0.3097363, -0.249297, -3.902747, 1, 1, 1, 1, 1,
-0.3093523, 0.5840886, -0.07655677, 1, 1, 1, 1, 1,
-0.308192, 1.490281, -0.2911325, 1, 1, 1, 1, 1,
-0.307174, 1.064899, -0.1588834, 1, 1, 1, 1, 1,
-0.3050508, -1.11853, -2.113884, 0, 0, 1, 1, 1,
-0.30151, 0.118268, -1.652256, 1, 0, 0, 1, 1,
-0.3011818, 0.3403019, -3.149643, 1, 0, 0, 1, 1,
-0.3005913, 1.70081, -0.5560407, 1, 0, 0, 1, 1,
-0.299691, -1.638366, -2.800911, 1, 0, 0, 1, 1,
-0.2948228, -1.190844, -1.834226, 1, 0, 0, 1, 1,
-0.2924688, 0.7171443, 1.180323, 0, 0, 0, 1, 1,
-0.2913051, 1.601666, -0.7409574, 0, 0, 0, 1, 1,
-0.2898173, 2.457161, -0.4808518, 0, 0, 0, 1, 1,
-0.2887193, -1.305506, -2.895876, 0, 0, 0, 1, 1,
-0.2854969, 0.05220659, -1.459344, 0, 0, 0, 1, 1,
-0.2841483, 0.973288, -1.322161, 0, 0, 0, 1, 1,
-0.2812524, 0.8017243, -1.335356, 0, 0, 0, 1, 1,
-0.2811788, -0.4645104, -3.07367, 1, 1, 1, 1, 1,
-0.2723371, 0.2851941, 0.4216627, 1, 1, 1, 1, 1,
-0.267263, 0.2520697, 0.1262472, 1, 1, 1, 1, 1,
-0.2671285, 1.69239, 0.5856231, 1, 1, 1, 1, 1,
-0.2639105, 2.287918, -1.08985, 1, 1, 1, 1, 1,
-0.2594541, 0.03073992, 0.3757576, 1, 1, 1, 1, 1,
-0.257521, -0.1737766, -3.376866, 1, 1, 1, 1, 1,
-0.2555984, 0.7365486, 0.6612446, 1, 1, 1, 1, 1,
-0.2543762, -0.02685118, -1.918547, 1, 1, 1, 1, 1,
-0.252079, -0.002046771, -2.389629, 1, 1, 1, 1, 1,
-0.2509029, 0.2799011, -0.09083349, 1, 1, 1, 1, 1,
-0.2506879, 1.218403, -1.570411, 1, 1, 1, 1, 1,
-0.2493875, -0.5789487, -3.827209, 1, 1, 1, 1, 1,
-0.2480029, 1.029823, 0.512257, 1, 1, 1, 1, 1,
-0.2454637, -1.778555, -2.903202, 1, 1, 1, 1, 1,
-0.2442939, -0.5953202, -3.125045, 0, 0, 1, 1, 1,
-0.2442196, -0.9679385, -1.470536, 1, 0, 0, 1, 1,
-0.2435977, 0.1383313, -0.6913566, 1, 0, 0, 1, 1,
-0.2422854, -0.03634786, -1.903293, 1, 0, 0, 1, 1,
-0.2400989, -0.33889, -0.52026, 1, 0, 0, 1, 1,
-0.2377289, 0.411336, -0.104579, 1, 0, 0, 1, 1,
-0.2375875, 1.434219, -1.168983, 0, 0, 0, 1, 1,
-0.2362257, -0.4989971, -3.088878, 0, 0, 0, 1, 1,
-0.2343828, -0.1398339, -2.388499, 0, 0, 0, 1, 1,
-0.2324342, -1.365614, -5.011516, 0, 0, 0, 1, 1,
-0.2316035, -1.458237, -4.259958, 0, 0, 0, 1, 1,
-0.2268285, -1.001328, -2.947688, 0, 0, 0, 1, 1,
-0.226271, -0.1994312, -3.405113, 0, 0, 0, 1, 1,
-0.2211827, -0.07060421, -1.731283, 1, 1, 1, 1, 1,
-0.2206566, 1.579938, -0.400676, 1, 1, 1, 1, 1,
-0.2081723, 0.8201513, -0.4736916, 1, 1, 1, 1, 1,
-0.2039628, -0.3502116, -3.441534, 1, 1, 1, 1, 1,
-0.1976662, 0.2015288, 1.336847, 1, 1, 1, 1, 1,
-0.192857, -0.8265218, -2.577023, 1, 1, 1, 1, 1,
-0.1870518, -0.2468764, -1.79845, 1, 1, 1, 1, 1,
-0.1839996, -2.892385, -3.892878, 1, 1, 1, 1, 1,
-0.1828474, -0.1470025, -2.057291, 1, 1, 1, 1, 1,
-0.1826338, -0.5608795, -2.275842, 1, 1, 1, 1, 1,
-0.1786565, -0.7793225, -2.104677, 1, 1, 1, 1, 1,
-0.1774575, -1.746532, -4.494762, 1, 1, 1, 1, 1,
-0.1769135, 0.8116654, 2.075752, 1, 1, 1, 1, 1,
-0.1744902, 0.8436936, -0.4488344, 1, 1, 1, 1, 1,
-0.1706117, 0.5700563, -0.7642261, 1, 1, 1, 1, 1,
-0.1700734, -0.1483279, -1.273945, 0, 0, 1, 1, 1,
-0.1671076, 0.09938617, -2.409281, 1, 0, 0, 1, 1,
-0.1655727, 0.3723192, -1.29936, 1, 0, 0, 1, 1,
-0.1632383, 0.2556182, -0.3870265, 1, 0, 0, 1, 1,
-0.1621061, -0.395752, -1.915728, 1, 0, 0, 1, 1,
-0.1619379, -0.8526947, -2.978019, 1, 0, 0, 1, 1,
-0.1585226, -0.3877598, -2.014528, 0, 0, 0, 1, 1,
-0.158499, -1.224433, -1.368363, 0, 0, 0, 1, 1,
-0.1578208, 0.4295362, 1.340476, 0, 0, 0, 1, 1,
-0.1566601, 0.4297425, -1.020352, 0, 0, 0, 1, 1,
-0.1550132, -0.2214963, -3.254359, 0, 0, 0, 1, 1,
-0.1510429, 1.540546, -0.2998589, 0, 0, 0, 1, 1,
-0.1506088, 0.9480265, 0.4192808, 0, 0, 0, 1, 1,
-0.147627, -0.3007988, -3.64762, 1, 1, 1, 1, 1,
-0.1474971, -1.516689, -2.357821, 1, 1, 1, 1, 1,
-0.140798, -0.3637225, -1.121909, 1, 1, 1, 1, 1,
-0.139883, -0.8091819, -3.94267, 1, 1, 1, 1, 1,
-0.1386863, -1.108328, -3.919199, 1, 1, 1, 1, 1,
-0.1365812, -1.947685, -3.272333, 1, 1, 1, 1, 1,
-0.1328307, 2.347333, 0.28245, 1, 1, 1, 1, 1,
-0.131113, -1.608822, -2.301904, 1, 1, 1, 1, 1,
-0.1240508, 0.2320217, -0.1918954, 1, 1, 1, 1, 1,
-0.1151299, 1.457957, -1.746083, 1, 1, 1, 1, 1,
-0.1137318, 2.273908, 1.736208, 1, 1, 1, 1, 1,
-0.1108996, -0.2066802, -3.947641, 1, 1, 1, 1, 1,
-0.1050969, 0.7885543, -0.713834, 1, 1, 1, 1, 1,
-0.1033459, -0.2311717, -4.284172, 1, 1, 1, 1, 1,
-0.1027541, -0.4841391, -2.391188, 1, 1, 1, 1, 1,
-0.1001063, 1.672619, -0.154014, 0, 0, 1, 1, 1,
-0.0989256, -1.127418, -2.951119, 1, 0, 0, 1, 1,
-0.0988847, 1.092764, -0.09399043, 1, 0, 0, 1, 1,
-0.09758983, -2.770983, -2.421154, 1, 0, 0, 1, 1,
-0.09505204, -1.944505, -2.830251, 1, 0, 0, 1, 1,
-0.09119028, 0.4975004, -0.2351327, 1, 0, 0, 1, 1,
-0.08792853, 0.09149376, -1.284257, 0, 0, 0, 1, 1,
-0.08230095, 0.7372997, 0.9222958, 0, 0, 0, 1, 1,
-0.08185497, -0.4763643, -1.276519, 0, 0, 0, 1, 1,
-0.07884039, -0.7213061, -3.239877, 0, 0, 0, 1, 1,
-0.07792993, 1.434187, -0.4021039, 0, 0, 0, 1, 1,
-0.07486952, -0.5726309, -2.506343, 0, 0, 0, 1, 1,
-0.0727505, 0.3266377, -0.7919635, 0, 0, 0, 1, 1,
-0.06849144, -2.501196, -2.885715, 1, 1, 1, 1, 1,
-0.05954688, -0.3883991, -2.046766, 1, 1, 1, 1, 1,
-0.05763223, 1.050221, -0.8207243, 1, 1, 1, 1, 1,
-0.05759086, 0.8755652, -1.468224, 1, 1, 1, 1, 1,
-0.05576564, 0.6619806, -2.556331, 1, 1, 1, 1, 1,
-0.05549983, 1.333761, -0.3582214, 1, 1, 1, 1, 1,
-0.05380968, 0.974292, -3.245607, 1, 1, 1, 1, 1,
-0.05325481, 0.2187354, 0.8399348, 1, 1, 1, 1, 1,
-0.05285117, -0.8122653, -0.9204208, 1, 1, 1, 1, 1,
-0.04582474, 0.36769, -0.2036051, 1, 1, 1, 1, 1,
-0.04546079, 1.268916, -1.623263, 1, 1, 1, 1, 1,
-0.04052418, -0.4509511, -2.473568, 1, 1, 1, 1, 1,
-0.03951535, -1.350548, -4.552555, 1, 1, 1, 1, 1,
-0.03016725, 2.590945, 0.2014601, 1, 1, 1, 1, 1,
-0.02519261, -0.02821566, -3.76017, 1, 1, 1, 1, 1,
-0.0239071, -0.1074985, -2.737935, 0, 0, 1, 1, 1,
-0.02333207, -0.5305542, -4.646214, 1, 0, 0, 1, 1,
-0.02216559, 0.06887431, 0.5950899, 1, 0, 0, 1, 1,
-0.01716197, 0.4254552, 2.143513, 1, 0, 0, 1, 1,
-0.01058849, 0.2546543, -1.054246, 1, 0, 0, 1, 1,
-0.009726441, 0.5727203, 0.806471, 1, 0, 0, 1, 1,
-0.007498971, -0.5069124, -3.298187, 0, 0, 0, 1, 1,
-0.002852666, -1.068558, -3.3462, 0, 0, 0, 1, 1,
-0.0005758698, -0.1889251, -3.452935, 0, 0, 0, 1, 1,
0.0003888343, 0.8713685, 1.136001, 0, 0, 0, 1, 1,
0.0004896302, 1.91714, 0.5542136, 0, 0, 0, 1, 1,
0.005369106, 2.960025, -0.8307398, 0, 0, 0, 1, 1,
0.006677093, 2.509888, 0.8072157, 0, 0, 0, 1, 1,
0.006799295, 0.177911, 1.113949, 1, 1, 1, 1, 1,
0.00767451, -1.754394, 3.842916, 1, 1, 1, 1, 1,
0.009486469, -1.611124, 3.437533, 1, 1, 1, 1, 1,
0.01323644, 1.521511, -1.904024, 1, 1, 1, 1, 1,
0.01388881, -1.9396, 6.046277, 1, 1, 1, 1, 1,
0.01839678, 0.3958391, 0.1326845, 1, 1, 1, 1, 1,
0.01890401, -1.273966, 3.36531, 1, 1, 1, 1, 1,
0.01963401, -0.496375, 2.55799, 1, 1, 1, 1, 1,
0.0234776, -0.9400543, 2.217238, 1, 1, 1, 1, 1,
0.02580709, 0.3847421, 0.7861429, 1, 1, 1, 1, 1,
0.0258088, 1.198812, 1.487829, 1, 1, 1, 1, 1,
0.02598512, -0.01435336, 2.416011, 1, 1, 1, 1, 1,
0.03188357, -2.104833, 3.98594, 1, 1, 1, 1, 1,
0.03209506, -0.5911362, 2.927795, 1, 1, 1, 1, 1,
0.03212012, 0.5144289, -1.5712, 1, 1, 1, 1, 1,
0.03214331, -0.9841928, 1.868539, 0, 0, 1, 1, 1,
0.0366263, -1.060784, 3.210615, 1, 0, 0, 1, 1,
0.03822607, 1.47643, 0.3367811, 1, 0, 0, 1, 1,
0.0445226, 0.2651197, -1.881933, 1, 0, 0, 1, 1,
0.04816014, 0.02070371, 2.657324, 1, 0, 0, 1, 1,
0.05194184, -1.777022, 3.374956, 1, 0, 0, 1, 1,
0.06080833, -1.689689, 1.279238, 0, 0, 0, 1, 1,
0.06329657, -0.8876895, 2.216277, 0, 0, 0, 1, 1,
0.06388437, 0.7598706, 0.1678755, 0, 0, 0, 1, 1,
0.06489058, 0.6577427, 1.886975, 0, 0, 0, 1, 1,
0.06921954, 0.2532989, -1.328007, 0, 0, 0, 1, 1,
0.06928913, -0.06354625, 1.757553, 0, 0, 0, 1, 1,
0.07679996, 1.264723, -1.671029, 0, 0, 0, 1, 1,
0.07940111, -1.258599, 2.72174, 1, 1, 1, 1, 1,
0.07971197, 1.020447, -0.5820581, 1, 1, 1, 1, 1,
0.08165701, -1.396579, 2.95671, 1, 1, 1, 1, 1,
0.08201034, -0.7695808, 3.630929, 1, 1, 1, 1, 1,
0.08697617, -0.112871, 3.416408, 1, 1, 1, 1, 1,
0.08778554, 0.03078954, 1.754127, 1, 1, 1, 1, 1,
0.0878297, 1.187082, 0.2148771, 1, 1, 1, 1, 1,
0.09179809, 0.8493366, -0.90235, 1, 1, 1, 1, 1,
0.09522596, -0.2902991, 1.367614, 1, 1, 1, 1, 1,
0.09686422, -0.7328468, 4.278951, 1, 1, 1, 1, 1,
0.09848174, -1.556522, 3.290881, 1, 1, 1, 1, 1,
0.09984038, 1.721994, 1.083551, 1, 1, 1, 1, 1,
0.100645, -0.9880192, 3.663433, 1, 1, 1, 1, 1,
0.1014485, -1.940089, 3.668991, 1, 1, 1, 1, 1,
0.102083, 0.5977395, 0.06974522, 1, 1, 1, 1, 1,
0.1046134, -1.003603, 3.896375, 0, 0, 1, 1, 1,
0.1057855, 0.840704, -1.89218, 1, 0, 0, 1, 1,
0.1098721, 2.128526, 0.1884936, 1, 0, 0, 1, 1,
0.1107228, -0.7400106, 2.960091, 1, 0, 0, 1, 1,
0.1155164, -1.147018, 1.24463, 1, 0, 0, 1, 1,
0.1169449, 0.9863717, 0.0706772, 1, 0, 0, 1, 1,
0.1179686, 0.09208676, 1.928642, 0, 0, 0, 1, 1,
0.1214409, 0.02909374, 2.096386, 0, 0, 0, 1, 1,
0.1218058, 0.1294222, 0.8453467, 0, 0, 0, 1, 1,
0.1384136, 0.5002748, -0.7091713, 0, 0, 0, 1, 1,
0.1389272, -1.606555, 4.848806, 0, 0, 0, 1, 1,
0.1398806, -1.552233, 2.499454, 0, 0, 0, 1, 1,
0.1497657, -0.03053784, 1.759085, 0, 0, 0, 1, 1,
0.1513897, -0.9448026, 4.194747, 1, 1, 1, 1, 1,
0.1515184, -0.3846097, 2.005632, 1, 1, 1, 1, 1,
0.1529546, -0.6990402, 3.268558, 1, 1, 1, 1, 1,
0.1553865, 0.06131035, -0.06822693, 1, 1, 1, 1, 1,
0.158357, -0.4070855, 1.805397, 1, 1, 1, 1, 1,
0.1587304, 1.405095, -0.01535615, 1, 1, 1, 1, 1,
0.1590219, -0.8264338, 3.251724, 1, 1, 1, 1, 1,
0.1669804, -1.067033, 2.802102, 1, 1, 1, 1, 1,
0.1672143, -0.6620973, 2.398343, 1, 1, 1, 1, 1,
0.1726574, 1.200347, 0.8851299, 1, 1, 1, 1, 1,
0.173296, 1.858522, -0.2984301, 1, 1, 1, 1, 1,
0.1809466, 1.522503, 0.5932841, 1, 1, 1, 1, 1,
0.1937334, 0.5738354, 0.2522455, 1, 1, 1, 1, 1,
0.1953614, -1.644822, 3.195211, 1, 1, 1, 1, 1,
0.1954882, -0.06675649, 2.600726, 1, 1, 1, 1, 1,
0.2002212, 0.01301812, 3.042745, 0, 0, 1, 1, 1,
0.2005522, 0.4462101, 1.886911, 1, 0, 0, 1, 1,
0.2021157, 0.1167035, 0.2045898, 1, 0, 0, 1, 1,
0.2036648, 1.908895, 0.1963963, 1, 0, 0, 1, 1,
0.2065597, -0.5449741, 2.842777, 1, 0, 0, 1, 1,
0.2118258, -0.6349158, 3.164889, 1, 0, 0, 1, 1,
0.211929, 0.2144734, -1.832851, 0, 0, 0, 1, 1,
0.2168631, 0.3686042, -0.4068721, 0, 0, 0, 1, 1,
0.2196604, 0.4608209, 0.6496441, 0, 0, 0, 1, 1,
0.2208804, 0.04355952, 1.762738, 0, 0, 0, 1, 1,
0.2214636, 0.1986555, -0.4290487, 0, 0, 0, 1, 1,
0.2224633, -1.185507, 3.78646, 0, 0, 0, 1, 1,
0.2265027, 1.120613, -1.084449, 0, 0, 0, 1, 1,
0.2266831, 2.368663, 4.048741, 1, 1, 1, 1, 1,
0.2273982, 1.180285, -1.591837, 1, 1, 1, 1, 1,
0.2283337, -1.944601, 2.195468, 1, 1, 1, 1, 1,
0.2328981, -0.2392174, 4.216743, 1, 1, 1, 1, 1,
0.2340451, -0.4408127, 2.667362, 1, 1, 1, 1, 1,
0.2395107, 1.720488, -0.7528151, 1, 1, 1, 1, 1,
0.2406897, -0.6416096, 1.92187, 1, 1, 1, 1, 1,
0.2416204, 0.1747533, 1.488384, 1, 1, 1, 1, 1,
0.2423981, -2.285417, 2.409056, 1, 1, 1, 1, 1,
0.2464378, -1.828862, 2.763039, 1, 1, 1, 1, 1,
0.247083, 0.256316, 1.551034, 1, 1, 1, 1, 1,
0.2503012, 0.3203046, -2.785494, 1, 1, 1, 1, 1,
0.2524049, -0.3702098, 1.607726, 1, 1, 1, 1, 1,
0.2563211, -0.4563854, 3.085064, 1, 1, 1, 1, 1,
0.2608289, 0.5663456, 0.4070131, 1, 1, 1, 1, 1,
0.266287, -0.3892514, 1.113031, 0, 0, 1, 1, 1,
0.271609, 0.02877767, 1.298773, 1, 0, 0, 1, 1,
0.2749243, -0.5445205, 1.221103, 1, 0, 0, 1, 1,
0.2778495, 0.5060632, 0.3931181, 1, 0, 0, 1, 1,
0.2793977, 0.172527, 1.34385, 1, 0, 0, 1, 1,
0.2861017, 1.716286, 0.1369937, 1, 0, 0, 1, 1,
0.2864373, -0.6650059, 2.087636, 0, 0, 0, 1, 1,
0.2896651, -0.8101947, 3.228175, 0, 0, 0, 1, 1,
0.2924175, -0.8847694, 2.305436, 0, 0, 0, 1, 1,
0.2933607, -0.01000554, 0.3859473, 0, 0, 0, 1, 1,
0.2973884, -0.359629, 3.336169, 0, 0, 0, 1, 1,
0.3004036, 0.5449005, 0.4934715, 0, 0, 0, 1, 1,
0.3006723, -1.246942, 4.117069, 0, 0, 0, 1, 1,
0.3030085, -1.394017, 4.322913, 1, 1, 1, 1, 1,
0.3087091, -0.5036505, 2.887534, 1, 1, 1, 1, 1,
0.3145328, -0.5394006, 2.36057, 1, 1, 1, 1, 1,
0.3149751, 0.316234, 2.343148, 1, 1, 1, 1, 1,
0.3150645, -1.038603, 1.021347, 1, 1, 1, 1, 1,
0.3167915, -0.1432469, 1.96701, 1, 1, 1, 1, 1,
0.3174125, -0.3136761, 3.157795, 1, 1, 1, 1, 1,
0.3178269, -1.097193, 3.090988, 1, 1, 1, 1, 1,
0.3209916, -0.3644639, 2.014353, 1, 1, 1, 1, 1,
0.3223172, 1.061758, -0.7181643, 1, 1, 1, 1, 1,
0.3241397, 2.747693, -0.390855, 1, 1, 1, 1, 1,
0.3274078, 0.9186888, -0.9273102, 1, 1, 1, 1, 1,
0.3281656, 0.2446293, 1.183618, 1, 1, 1, 1, 1,
0.3307246, -0.1154776, 2.595762, 1, 1, 1, 1, 1,
0.3338301, -0.125878, 2.235344, 1, 1, 1, 1, 1,
0.3345497, 0.8355807, 2.20358, 0, 0, 1, 1, 1,
0.334939, 0.5588763, 0.6910686, 1, 0, 0, 1, 1,
0.3367128, 1.735754, 0.8704773, 1, 0, 0, 1, 1,
0.33991, 0.5629725, 1.543488, 1, 0, 0, 1, 1,
0.3402336, -1.316258, 2.994888, 1, 0, 0, 1, 1,
0.3423176, 1.145416, -0.05308105, 1, 0, 0, 1, 1,
0.3439037, 1.762726, 1.168123, 0, 0, 0, 1, 1,
0.3442183, -0.5844349, 1.747541, 0, 0, 0, 1, 1,
0.3458019, 0.8521692, 0.7866437, 0, 0, 0, 1, 1,
0.3516985, -0.2425682, 1.122068, 0, 0, 0, 1, 1,
0.3531763, -1.658543, 1.940776, 0, 0, 0, 1, 1,
0.3566453, -0.5663826, 1.786304, 0, 0, 0, 1, 1,
0.3589437, -0.8884873, 4.491225, 0, 0, 0, 1, 1,
0.364149, 0.7321528, 2.116506, 1, 1, 1, 1, 1,
0.3643074, 1.279918, -0.2740528, 1, 1, 1, 1, 1,
0.3660229, -0.0672666, 1.911502, 1, 1, 1, 1, 1,
0.3679241, -0.7774752, 2.670035, 1, 1, 1, 1, 1,
0.3692985, 1.747759, -0.6727495, 1, 1, 1, 1, 1,
0.3700297, 0.2092783, 0.2179147, 1, 1, 1, 1, 1,
0.3757101, -2.218687, 3.624902, 1, 1, 1, 1, 1,
0.3767251, 0.753758, 1.231356, 1, 1, 1, 1, 1,
0.3808421, 1.315226, 0.1827708, 1, 1, 1, 1, 1,
0.3866976, 2.404871, -0.01551632, 1, 1, 1, 1, 1,
0.3869525, -0.01107891, 1.685115, 1, 1, 1, 1, 1,
0.3884903, 0.1344807, 0.7236961, 1, 1, 1, 1, 1,
0.3905582, 0.8001887, -1.442776, 1, 1, 1, 1, 1,
0.4018227, -0.1247237, 3.509566, 1, 1, 1, 1, 1,
0.4029299, -1.232361, 2.834347, 1, 1, 1, 1, 1,
0.4042773, -0.7334642, 3.406325, 0, 0, 1, 1, 1,
0.4043729, -0.188426, 1.924158, 1, 0, 0, 1, 1,
0.4043752, 0.6968732, -0.8929346, 1, 0, 0, 1, 1,
0.4104662, -0.03177464, 1.807822, 1, 0, 0, 1, 1,
0.4116599, 0.6113253, 0.8219385, 1, 0, 0, 1, 1,
0.4158492, -2.096889, 3.098272, 1, 0, 0, 1, 1,
0.4291451, -1.191046, 1.687496, 0, 0, 0, 1, 1,
0.4388782, -1.184709, 4.089149, 0, 0, 0, 1, 1,
0.4434629, 0.006859828, 0.3571935, 0, 0, 0, 1, 1,
0.4444371, 0.9458263, 0.1763204, 0, 0, 0, 1, 1,
0.4461872, -1.506625, 3.203587, 0, 0, 0, 1, 1,
0.4472072, -0.6387749, 2.812777, 0, 0, 0, 1, 1,
0.4503013, -1.226915, 2.328659, 0, 0, 0, 1, 1,
0.4515514, -0.07603166, 1.931286, 1, 1, 1, 1, 1,
0.4540502, 0.126849, 0.7639996, 1, 1, 1, 1, 1,
0.462753, 0.6702384, 1.715922, 1, 1, 1, 1, 1,
0.4671805, -0.7389742, 3.138742, 1, 1, 1, 1, 1,
0.4685186, 0.9143317, 1.083267, 1, 1, 1, 1, 1,
0.4688927, 2.060185, -0.02884523, 1, 1, 1, 1, 1,
0.4691474, 0.3220935, 0.7315785, 1, 1, 1, 1, 1,
0.471925, -1.817221, 3.919451, 1, 1, 1, 1, 1,
0.4752798, 0.1641727, 1.104047, 1, 1, 1, 1, 1,
0.4776556, -0.4301671, 2.092018, 1, 1, 1, 1, 1,
0.4793046, 0.2150266, -0.039559, 1, 1, 1, 1, 1,
0.4799351, -1.744646, 3.464561, 1, 1, 1, 1, 1,
0.4804256, -0.1066014, 1.925254, 1, 1, 1, 1, 1,
0.4841668, 0.0237166, 2.312002, 1, 1, 1, 1, 1,
0.4891087, -0.399589, 3.570621, 1, 1, 1, 1, 1,
0.4891198, -2.018528, 5.100458, 0, 0, 1, 1, 1,
0.4916748, 0.9549616, 1.097694, 1, 0, 0, 1, 1,
0.4964026, -0.1847717, 2.156449, 1, 0, 0, 1, 1,
0.4987491, 0.1450452, 2.035653, 1, 0, 0, 1, 1,
0.5077095, -0.1076963, 1.094502, 1, 0, 0, 1, 1,
0.5141395, -0.07993534, 2.324113, 1, 0, 0, 1, 1,
0.5156761, 1.79518, -0.2342466, 0, 0, 0, 1, 1,
0.5162143, 0.448203, 1.182341, 0, 0, 0, 1, 1,
0.5165967, -0.4228427, 0.7466301, 0, 0, 0, 1, 1,
0.5191099, -0.5635753, 2.859604, 0, 0, 0, 1, 1,
0.5208054, -1.424634, 3.809685, 0, 0, 0, 1, 1,
0.5219325, 0.2088246, -0.2153369, 0, 0, 0, 1, 1,
0.5224515, -0.216838, 2.927644, 0, 0, 0, 1, 1,
0.522555, 0.08475016, 1.416854, 1, 1, 1, 1, 1,
0.5238772, -0.4482974, 2.022123, 1, 1, 1, 1, 1,
0.5250872, 0.9676108, -0.8528959, 1, 1, 1, 1, 1,
0.5288265, 0.8650419, 0.4428407, 1, 1, 1, 1, 1,
0.5295385, 0.5612248, 0.9886256, 1, 1, 1, 1, 1,
0.5316573, -0.7525058, 3.032076, 1, 1, 1, 1, 1,
0.5333347, -0.6702445, 1.94347, 1, 1, 1, 1, 1,
0.5371923, 0.8534144, 1.144402, 1, 1, 1, 1, 1,
0.5374631, -1.278355, 2.017114, 1, 1, 1, 1, 1,
0.5392737, -0.07552177, 2.53485, 1, 1, 1, 1, 1,
0.5408813, -1.725502, 4.457843, 1, 1, 1, 1, 1,
0.5409121, -0.2883193, 1.599445, 1, 1, 1, 1, 1,
0.5449352, -0.8906525, 3.008697, 1, 1, 1, 1, 1,
0.5474246, 1.001312, 1.391327, 1, 1, 1, 1, 1,
0.5522493, 1.483334, -0.2869647, 1, 1, 1, 1, 1,
0.5597947, -1.200276, 4.279799, 0, 0, 1, 1, 1,
0.5607231, 0.4572777, 0.7471457, 1, 0, 0, 1, 1,
0.5608516, 0.04896536, 0.1416099, 1, 0, 0, 1, 1,
0.561805, -2.165435, 2.433761, 1, 0, 0, 1, 1,
0.5630084, -0.3359978, 2.828086, 1, 0, 0, 1, 1,
0.5662432, -0.3238349, 0.9289513, 1, 0, 0, 1, 1,
0.5662557, 1.854324, -0.2117153, 0, 0, 0, 1, 1,
0.5740435, 1.789907, -2.740928, 0, 0, 0, 1, 1,
0.576, 0.2279326, 1.710318, 0, 0, 0, 1, 1,
0.5793942, -2.123983, 4.100106, 0, 0, 0, 1, 1,
0.5795699, -1.820078, 3.852089, 0, 0, 0, 1, 1,
0.5855594, -0.08469345, 1.280734, 0, 0, 0, 1, 1,
0.5948459, -1.290229, 1.40061, 0, 0, 0, 1, 1,
0.5968751, -0.4893197, 1.919133, 1, 1, 1, 1, 1,
0.5976212, -0.2777368, 1.633855, 1, 1, 1, 1, 1,
0.5976626, 0.5447317, 0.7792147, 1, 1, 1, 1, 1,
0.6114035, -0.408275, 3.961173, 1, 1, 1, 1, 1,
0.6167784, -0.465969, 1.837404, 1, 1, 1, 1, 1,
0.6190448, 0.4845166, 2.064196, 1, 1, 1, 1, 1,
0.6245113, 0.5825073, 0.9056042, 1, 1, 1, 1, 1,
0.6263294, 1.147043, -0.6001529, 1, 1, 1, 1, 1,
0.6279772, -0.8842189, 4.359715, 1, 1, 1, 1, 1,
0.6286979, -0.3267045, 1.097644, 1, 1, 1, 1, 1,
0.633356, -1.123144, 1.925398, 1, 1, 1, 1, 1,
0.6379013, -0.8453424, 2.449713, 1, 1, 1, 1, 1,
0.6393273, 0.5552579, 1.563652, 1, 1, 1, 1, 1,
0.6448334, -1.368835, 2.175879, 1, 1, 1, 1, 1,
0.6502326, -0.4742178, 0.2983415, 1, 1, 1, 1, 1,
0.6522004, 1.677402, 1.020091, 0, 0, 1, 1, 1,
0.6525928, -0.09881753, 1.868799, 1, 0, 0, 1, 1,
0.6527913, 1.800333, 0.4574568, 1, 0, 0, 1, 1,
0.6653738, -1.00431, 0.7223909, 1, 0, 0, 1, 1,
0.6662955, 0.0536084, 1.739844, 1, 0, 0, 1, 1,
0.6765761, 0.3144101, 1.376545, 1, 0, 0, 1, 1,
0.6767288, 0.01608379, 1.510785, 0, 0, 0, 1, 1,
0.6784934, -2.70543, 2.394453, 0, 0, 0, 1, 1,
0.6806204, -1.378661, 3.25897, 0, 0, 0, 1, 1,
0.6843273, 0.3307103, 0.3723118, 0, 0, 0, 1, 1,
0.6886951, -1.521273, 2.076522, 0, 0, 0, 1, 1,
0.6937829, -1.087543, 1.990648, 0, 0, 0, 1, 1,
0.6959875, -3.022197, 2.504335, 0, 0, 0, 1, 1,
0.6973123, -0.4327566, 1.59671, 1, 1, 1, 1, 1,
0.7009677, -1.19892, 2.535861, 1, 1, 1, 1, 1,
0.7058679, -1.37201, 2.993888, 1, 1, 1, 1, 1,
0.7059084, -0.5924801, 3.134195, 1, 1, 1, 1, 1,
0.7120588, -0.5704118, 2.146211, 1, 1, 1, 1, 1,
0.7146736, 1.033049, -0.5412312, 1, 1, 1, 1, 1,
0.7149132, -0.9705389, 2.701997, 1, 1, 1, 1, 1,
0.7164152, -0.5286409, 3.002584, 1, 1, 1, 1, 1,
0.7164727, -0.479487, 2.331804, 1, 1, 1, 1, 1,
0.7176161, 0.8310916, 1.076767, 1, 1, 1, 1, 1,
0.7196842, 1.181907, -0.5115218, 1, 1, 1, 1, 1,
0.7200503, 0.3696343, 1.913267, 1, 1, 1, 1, 1,
0.723101, -0.5097048, 2.391538, 1, 1, 1, 1, 1,
0.7256716, -0.08397055, 3.20757, 1, 1, 1, 1, 1,
0.7274716, 0.310526, 0.4008052, 1, 1, 1, 1, 1,
0.7304064, 1.326761, 0.2296184, 0, 0, 1, 1, 1,
0.7509236, 0.8099777, 1.511243, 1, 0, 0, 1, 1,
0.7515157, -0.5956353, 0.7406294, 1, 0, 0, 1, 1,
0.7560422, 1.128345, 0.175155, 1, 0, 0, 1, 1,
0.7569187, 0.4211178, 0.3680837, 1, 0, 0, 1, 1,
0.7678978, 0.7725281, 0.6160035, 1, 0, 0, 1, 1,
0.7735131, 1.670327, 0.6496463, 0, 0, 0, 1, 1,
0.7806493, -0.8578043, 2.215046, 0, 0, 0, 1, 1,
0.7850505, 0.1398247, 2.758529, 0, 0, 0, 1, 1,
0.7888978, 1.159678, 1.378876, 0, 0, 0, 1, 1,
0.7932003, 0.3141721, 0.7134043, 0, 0, 0, 1, 1,
0.8003493, 0.7716107, 0.2698053, 0, 0, 0, 1, 1,
0.8011619, 0.2026571, 2.503835, 0, 0, 0, 1, 1,
0.8019486, 1.650503, -0.2221869, 1, 1, 1, 1, 1,
0.8052924, 0.8832797, 2.944375, 1, 1, 1, 1, 1,
0.8067213, 1.070926, -0.6747383, 1, 1, 1, 1, 1,
0.8155384, -1.568637, 2.590259, 1, 1, 1, 1, 1,
0.8248209, 0.3617162, 2.382577, 1, 1, 1, 1, 1,
0.8301609, -0.5646701, 2.949646, 1, 1, 1, 1, 1,
0.8302809, -1.667588, 2.611156, 1, 1, 1, 1, 1,
0.8313541, 0.0330174, 2.060704, 1, 1, 1, 1, 1,
0.8314923, -0.5653486, 3.230037, 1, 1, 1, 1, 1,
0.8339497, -0.9150887, 0.07548001, 1, 1, 1, 1, 1,
0.8347301, 2.419679, 0.1230645, 1, 1, 1, 1, 1,
0.8356813, 1.700253, -0.4211884, 1, 1, 1, 1, 1,
0.844314, 0.01284743, 0.9659171, 1, 1, 1, 1, 1,
0.8505404, 0.1341336, 1.769359, 1, 1, 1, 1, 1,
0.852477, 1.395658, 0.3138871, 1, 1, 1, 1, 1,
0.8565155, -1.499995, 3.67255, 0, 0, 1, 1, 1,
0.8620642, -0.1812309, -0.03219958, 1, 0, 0, 1, 1,
0.8630854, 0.9081753, 1.339855, 1, 0, 0, 1, 1,
0.8645737, -0.5743582, 2.694096, 1, 0, 0, 1, 1,
0.870997, 0.7926596, 0.4149317, 1, 0, 0, 1, 1,
0.8733862, -0.1703986, 1.976573, 1, 0, 0, 1, 1,
0.8745466, -0.2537758, 0.651117, 0, 0, 0, 1, 1,
0.8763486, 0.42625, -0.00125293, 0, 0, 0, 1, 1,
0.8829003, 0.7653705, 1.98534, 0, 0, 0, 1, 1,
0.8851597, 0.9845848, 1.901894, 0, 0, 0, 1, 1,
0.8861475, 0.148, 3.607234, 0, 0, 0, 1, 1,
0.8910062, 0.1937464, 1.641354, 0, 0, 0, 1, 1,
0.8945076, 0.6527106, 0.04592086, 0, 0, 0, 1, 1,
0.9016007, -0.01142541, 1.638636, 1, 1, 1, 1, 1,
0.9019948, -0.9715084, 2.846739, 1, 1, 1, 1, 1,
0.9075786, 0.5108615, 0.764857, 1, 1, 1, 1, 1,
0.9173965, 0.2515416, 0.009638747, 1, 1, 1, 1, 1,
0.9182677, -1.004693, 2.937505, 1, 1, 1, 1, 1,
0.9249948, -0.2882629, 1.37158, 1, 1, 1, 1, 1,
0.9250968, -0.07111485, 0.7102534, 1, 1, 1, 1, 1,
0.9288251, -0.5287833, 1.053427, 1, 1, 1, 1, 1,
0.9293789, 0.4702261, 0.1113739, 1, 1, 1, 1, 1,
0.9304486, -0.1844713, 1.985454, 1, 1, 1, 1, 1,
0.9315423, -0.9975228, 4.843014, 1, 1, 1, 1, 1,
0.9326419, -1.235749, 2.673678, 1, 1, 1, 1, 1,
0.9347054, -1.123251, 3.336988, 1, 1, 1, 1, 1,
0.9347945, 0.1010341, 1.561641, 1, 1, 1, 1, 1,
0.9388966, -0.9095718, 3.264251, 1, 1, 1, 1, 1,
0.9413116, -0.9255339, 1.198643, 0, 0, 1, 1, 1,
0.9415432, -0.642025, 1.389249, 1, 0, 0, 1, 1,
0.947359, -1.390919, 0.9735983, 1, 0, 0, 1, 1,
0.949158, 2.000667, -1.729984, 1, 0, 0, 1, 1,
0.9593618, 0.6238979, 2.215654, 1, 0, 0, 1, 1,
0.9683233, -0.667099, 0.0189924, 1, 0, 0, 1, 1,
0.9770619, 2.721878, 1.694771, 0, 0, 0, 1, 1,
0.9774874, -0.2408784, 1.821952, 0, 0, 0, 1, 1,
0.9804145, 1.295808, -1.310014, 0, 0, 0, 1, 1,
0.9836968, 0.6265106, 1.566571, 0, 0, 0, 1, 1,
0.9841422, -0.7307434, 0.4732957, 0, 0, 0, 1, 1,
0.9927334, -0.6012232, 1.799023, 0, 0, 0, 1, 1,
0.9928194, -0.4121554, 0.2454846, 0, 0, 0, 1, 1,
0.9948049, -0.768216, 2.004649, 1, 1, 1, 1, 1,
0.9961261, 0.06928288, 1.316912, 1, 1, 1, 1, 1,
1.000004, -0.8555666, 2.279818, 1, 1, 1, 1, 1,
1.005657, 2.075737, 0.0421792, 1, 1, 1, 1, 1,
1.011468, 0.5974406, 1.515712, 1, 1, 1, 1, 1,
1.012425, -0.8092175, 1.697978, 1, 1, 1, 1, 1,
1.014101, -1.138665, 2.370881, 1, 1, 1, 1, 1,
1.016759, 1.427211, -0.09169615, 1, 1, 1, 1, 1,
1.017972, -0.3324086, -0.03447802, 1, 1, 1, 1, 1,
1.021444, -0.1955633, 1.996114, 1, 1, 1, 1, 1,
1.023905, -0.942327, 3.289733, 1, 1, 1, 1, 1,
1.025251, -0.06460996, 2.744823, 1, 1, 1, 1, 1,
1.027397, 1.479911, 1.405179, 1, 1, 1, 1, 1,
1.028367, 0.9180326, 2.202363, 1, 1, 1, 1, 1,
1.029293, 0.2785187, 2.354229, 1, 1, 1, 1, 1,
1.033794, -0.2409551, 1.931257, 0, 0, 1, 1, 1,
1.035141, 2.27213, 0.04223813, 1, 0, 0, 1, 1,
1.040067, -1.516721, 4.121491, 1, 0, 0, 1, 1,
1.052809, -0.1398792, 3.730979, 1, 0, 0, 1, 1,
1.062656, 1.37528, -0.3889887, 1, 0, 0, 1, 1,
1.064725, 0.9519148, 0.09851419, 1, 0, 0, 1, 1,
1.066001, -1.930024, 2.259308, 0, 0, 0, 1, 1,
1.076396, -1.66875, 1.236253, 0, 0, 0, 1, 1,
1.083921, 0.04203636, 1.36876, 0, 0, 0, 1, 1,
1.084345, 0.2334148, 1.317006, 0, 0, 0, 1, 1,
1.090146, 1.07846, 1.56849, 0, 0, 0, 1, 1,
1.100491, -0.5382641, 1.287009, 0, 0, 0, 1, 1,
1.10156, 1.729587, 1.142932, 0, 0, 0, 1, 1,
1.119138, -2.299925, 3.647359, 1, 1, 1, 1, 1,
1.119541, -1.624234, 4.452116, 1, 1, 1, 1, 1,
1.123002, 0.1328418, 3.039483, 1, 1, 1, 1, 1,
1.12382, 1.035407, 1.606882, 1, 1, 1, 1, 1,
1.131654, 0.1191231, 1.011819, 1, 1, 1, 1, 1,
1.132644, -0.03153364, 2.892525, 1, 1, 1, 1, 1,
1.136154, 0.2460326, 2.635648, 1, 1, 1, 1, 1,
1.136804, -0.2475879, 3.717234, 1, 1, 1, 1, 1,
1.137575, 0.736767, 0.7325334, 1, 1, 1, 1, 1,
1.138556, -0.9616833, 2.687281, 1, 1, 1, 1, 1,
1.140896, 0.5851688, -0.2260643, 1, 1, 1, 1, 1,
1.141307, 0.8332477, 1.202732, 1, 1, 1, 1, 1,
1.142368, 0.5365005, 2.32375, 1, 1, 1, 1, 1,
1.145133, -0.5483446, 0.9387773, 1, 1, 1, 1, 1,
1.149139, 0.07670559, 2.265201, 1, 1, 1, 1, 1,
1.155182, -0.2395875, 2.370855, 0, 0, 1, 1, 1,
1.167382, -1.736144, 3.291757, 1, 0, 0, 1, 1,
1.181333, -0.3219844, 1.831946, 1, 0, 0, 1, 1,
1.18199, -0.601169, 1.260881, 1, 0, 0, 1, 1,
1.184355, -1.280057, 2.062855, 1, 0, 0, 1, 1,
1.192333, 0.6653233, 1.347803, 1, 0, 0, 1, 1,
1.196914, -0.9370488, 2.413464, 0, 0, 0, 1, 1,
1.202766, -1.111877, 2.795734, 0, 0, 0, 1, 1,
1.205887, 1.273841, -0.2895238, 0, 0, 0, 1, 1,
1.211365, -0.1553435, 2.587958, 0, 0, 0, 1, 1,
1.216162, -0.6299985, 2.689519, 0, 0, 0, 1, 1,
1.227362, 1.407698, 0.1341633, 0, 0, 0, 1, 1,
1.246457, 0.4037874, -0.4480731, 0, 0, 0, 1, 1,
1.248186, -0.07914425, 3.440456, 1, 1, 1, 1, 1,
1.253528, 1.206674, 1.58038, 1, 1, 1, 1, 1,
1.256961, -1.066139, 1.581934, 1, 1, 1, 1, 1,
1.257048, 0.9864272, 1.012195, 1, 1, 1, 1, 1,
1.259323, -0.7620822, 2.826333, 1, 1, 1, 1, 1,
1.261375, -1.144099, 3.070686, 1, 1, 1, 1, 1,
1.264783, -0.3085462, -0.6762683, 1, 1, 1, 1, 1,
1.269678, -0.4065211, -0.2594478, 1, 1, 1, 1, 1,
1.272907, -1.400253, 2.785012, 1, 1, 1, 1, 1,
1.285573, 0.6450239, 0.1835924, 1, 1, 1, 1, 1,
1.289535, 0.4776866, 0.3416436, 1, 1, 1, 1, 1,
1.295572, -1.260559, 2.928039, 1, 1, 1, 1, 1,
1.295744, 0.6319565, 0.9771259, 1, 1, 1, 1, 1,
1.302666, 2.17704, 0.8828095, 1, 1, 1, 1, 1,
1.30284, 0.1792611, 0.6253145, 1, 1, 1, 1, 1,
1.310669, 1.124953, 0.5757319, 0, 0, 1, 1, 1,
1.315922, 0.8058648, 0.8550238, 1, 0, 0, 1, 1,
1.316421, -1.448394, 2.990746, 1, 0, 0, 1, 1,
1.319609, 0.04276736, 3.017803, 1, 0, 0, 1, 1,
1.322243, -0.7935303, 1.041897, 1, 0, 0, 1, 1,
1.326626, 0.6779721, 0.386773, 1, 0, 0, 1, 1,
1.338234, -0.6744687, 1.809722, 0, 0, 0, 1, 1,
1.344907, -1.74733, 3.202488, 0, 0, 0, 1, 1,
1.352056, -1.601857, 0.9532803, 0, 0, 0, 1, 1,
1.364409, 0.1892508, 2.318089, 0, 0, 0, 1, 1,
1.36774, -1.218091, 4.753896, 0, 0, 0, 1, 1,
1.372191, -0.7845269, 1.096968, 0, 0, 0, 1, 1,
1.372406, 0.3031207, 1.654763, 0, 0, 0, 1, 1,
1.389663, -1.040573, 1.44594, 1, 1, 1, 1, 1,
1.400258, -0.8622118, 3.165517, 1, 1, 1, 1, 1,
1.410064, -0.1253634, 0.7138382, 1, 1, 1, 1, 1,
1.413513, 0.6828985, 2.350567, 1, 1, 1, 1, 1,
1.423766, -0.6713335, 1.584272, 1, 1, 1, 1, 1,
1.433644, 1.386254, 2.243176, 1, 1, 1, 1, 1,
1.43496, 0.2356181, 0.9677378, 1, 1, 1, 1, 1,
1.435806, -1.358849, 2.955134, 1, 1, 1, 1, 1,
1.435835, -1.207997, 3.439285, 1, 1, 1, 1, 1,
1.448248, -0.3479053, 2.882703, 1, 1, 1, 1, 1,
1.460377, 0.2597311, 2.248076, 1, 1, 1, 1, 1,
1.476495, 0.88519, 2.174165, 1, 1, 1, 1, 1,
1.491568, -0.05200059, 1.363903, 1, 1, 1, 1, 1,
1.521092, 0.09456453, 1.148398, 1, 1, 1, 1, 1,
1.523647, -0.4137926, 2.775403, 1, 1, 1, 1, 1,
1.53944, -1.149784, 1.926927, 0, 0, 1, 1, 1,
1.540145, -1.00787, 2.229825, 1, 0, 0, 1, 1,
1.553157, -1.444228, 3.132235, 1, 0, 0, 1, 1,
1.558846, 1.799796, 1.0318, 1, 0, 0, 1, 1,
1.562083, 1.57264, -0.8548328, 1, 0, 0, 1, 1,
1.592989, -0.8586199, 2.006777, 1, 0, 0, 1, 1,
1.617732, -1.310074, 2.121325, 0, 0, 0, 1, 1,
1.620093, 0.4359966, 0.7223029, 0, 0, 0, 1, 1,
1.624372, 0.250307, 2.13908, 0, 0, 0, 1, 1,
1.630096, -0.2987078, 2.518388, 0, 0, 0, 1, 1,
1.631457, -0.4597526, 3.664441, 0, 0, 0, 1, 1,
1.642037, 0.4840704, 0.3083739, 0, 0, 0, 1, 1,
1.649366, -1.613299, 2.108454, 0, 0, 0, 1, 1,
1.650041, 0.895403, 0.9117275, 1, 1, 1, 1, 1,
1.677292, -0.3141428, 2.039395, 1, 1, 1, 1, 1,
1.689887, -0.4693155, 2.411295, 1, 1, 1, 1, 1,
1.705918, 0.1267377, 0.8472506, 1, 1, 1, 1, 1,
1.706584, -0.9295164, 4.516261, 1, 1, 1, 1, 1,
1.720676, 1.631206, 2.486442, 1, 1, 1, 1, 1,
1.72071, 1.071221, 0.1602476, 1, 1, 1, 1, 1,
1.754611, -0.3270026, 2.248881, 1, 1, 1, 1, 1,
1.822158, 0.8060611, 2.148846, 1, 1, 1, 1, 1,
1.886355, -0.7680882, 1.769735, 1, 1, 1, 1, 1,
1.914474, -0.08412137, 1.676781, 1, 1, 1, 1, 1,
1.948347, -2.369568, 2.343442, 1, 1, 1, 1, 1,
1.950724, -1.461978, 4.79433, 1, 1, 1, 1, 1,
1.958728, 0.2407044, 1.21839, 1, 1, 1, 1, 1,
1.986888, 0.2080792, 1.80965, 1, 1, 1, 1, 1,
1.993283, 1.295676, 1.733101, 0, 0, 1, 1, 1,
2.013342, 0.4727443, 1.878371, 1, 0, 0, 1, 1,
2.013641, -1.444989, 1.50181, 1, 0, 0, 1, 1,
2.025081, -0.8363332, 2.978184, 1, 0, 0, 1, 1,
2.070804, -1.654024, 0.5524379, 1, 0, 0, 1, 1,
2.224413, -0.02446705, 1.566687, 1, 0, 0, 1, 1,
2.236928, -0.1666661, 2.312959, 0, 0, 0, 1, 1,
2.238317, 1.205904, 1.430067, 0, 0, 0, 1, 1,
2.291322, 0.463214, 2.266952, 0, 0, 0, 1, 1,
2.309106, -1.110205, 2.790073, 0, 0, 0, 1, 1,
2.410534, 1.03179, 1.391478, 0, 0, 0, 1, 1,
2.461225, -1.383752, 1.306117, 0, 0, 0, 1, 1,
2.505018, 0.6571844, 2.496406, 0, 0, 0, 1, 1,
2.597342, 0.3147792, 2.925838, 1, 1, 1, 1, 1,
2.607587, -0.3009952, 1.531276, 1, 1, 1, 1, 1,
2.622198, -1.715154, 1.048383, 1, 1, 1, 1, 1,
2.803566, -1.08009, 0.9570925, 1, 1, 1, 1, 1,
2.809928, 0.5445293, -0.3442716, 1, 1, 1, 1, 1,
2.833201, -0.6791835, 1.653101, 1, 1, 1, 1, 1,
2.990954, 0.4892574, 0.8515951, 1, 1, 1, 1, 1
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
var radius = 9.797165;
var distance = 34.41213;
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
mvMatrix.translate( 0.02353394, -0.08243608, -0.2373226 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41213);
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
