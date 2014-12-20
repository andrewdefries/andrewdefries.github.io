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
-3.407094, -0.3775012, -2.434688, 1, 0, 0, 1,
-3.127765, -1.040609, -1.925603, 1, 0.007843138, 0, 1,
-2.601889, 0.9102181, -0.9362987, 1, 0.01176471, 0, 1,
-2.592472, -0.6480186, -2.290027, 1, 0.01960784, 0, 1,
-2.565262, -2.059254, -3.644202, 1, 0.02352941, 0, 1,
-2.510345, -0.3671905, -1.453455, 1, 0.03137255, 0, 1,
-2.500417, 0.2123719, -0.5685369, 1, 0.03529412, 0, 1,
-2.486521, 0.6835643, -1.299561, 1, 0.04313726, 0, 1,
-2.479646, 0.09670249, -2.517809, 1, 0.04705882, 0, 1,
-2.415145, 1.101642, -0.04166645, 1, 0.05490196, 0, 1,
-2.390376, -2.042872, -3.329601, 1, 0.05882353, 0, 1,
-2.385853, 0.9859165, -2.439682, 1, 0.06666667, 0, 1,
-2.322594, -1.06013, 0.3595088, 1, 0.07058824, 0, 1,
-2.306653, 0.1597405, -0.8494445, 1, 0.07843138, 0, 1,
-2.145963, -1.313021, -2.387276, 1, 0.08235294, 0, 1,
-2.075182, -1.556507, -1.823686, 1, 0.09019608, 0, 1,
-2.053591, 0.4276635, 0.6374028, 1, 0.09411765, 0, 1,
-2.023425, 1.439453, -0.4460013, 1, 0.1019608, 0, 1,
-2.022437, -1.232998, -3.344846, 1, 0.1098039, 0, 1,
-2.011881, 0.8642078, -0.104222, 1, 0.1137255, 0, 1,
-1.998417, -0.7776825, -1.588105, 1, 0.1215686, 0, 1,
-1.979733, -0.06307621, -0.01405267, 1, 0.1254902, 0, 1,
-1.967884, 0.1426758, -2.353018, 1, 0.1333333, 0, 1,
-1.954032, -0.6389227, -0.1525559, 1, 0.1372549, 0, 1,
-1.936982, -0.2458331, -1.57261, 1, 0.145098, 0, 1,
-1.922177, 0.8704517, -0.9034604, 1, 0.1490196, 0, 1,
-1.89474, 1.327124, -0.5537285, 1, 0.1568628, 0, 1,
-1.86424, 0.493575, -3.755621, 1, 0.1607843, 0, 1,
-1.863454, -0.7436509, -2.540517, 1, 0.1686275, 0, 1,
-1.848623, -0.6943722, -1.014418, 1, 0.172549, 0, 1,
-1.842158, -0.06888348, -0.9704949, 1, 0.1803922, 0, 1,
-1.832368, 1.378523, -0.220137, 1, 0.1843137, 0, 1,
-1.831397, -0.5275871, -0.8638396, 1, 0.1921569, 0, 1,
-1.825542, -1.011327, -1.584953, 1, 0.1960784, 0, 1,
-1.817193, -0.4838134, -2.143001, 1, 0.2039216, 0, 1,
-1.803693, 0.243757, -0.8193432, 1, 0.2117647, 0, 1,
-1.799824, 1.064705, 0.1851579, 1, 0.2156863, 0, 1,
-1.777135, -0.6646579, -2.507608, 1, 0.2235294, 0, 1,
-1.773964, -0.5579183, 0.4531242, 1, 0.227451, 0, 1,
-1.760335, -1.358363, -1.915757, 1, 0.2352941, 0, 1,
-1.752198, 0.9039645, -1.760736, 1, 0.2392157, 0, 1,
-1.750264, 0.1505942, -1.729917, 1, 0.2470588, 0, 1,
-1.749154, 1.433108, -1.13945, 1, 0.2509804, 0, 1,
-1.749005, 0.3990998, -0.6628466, 1, 0.2588235, 0, 1,
-1.747166, 0.7378473, -1.62739, 1, 0.2627451, 0, 1,
-1.723514, -0.3608648, -1.379673, 1, 0.2705882, 0, 1,
-1.719899, 0.9091302, -2.634469, 1, 0.2745098, 0, 1,
-1.718547, 1.073566, -1.35779, 1, 0.282353, 0, 1,
-1.718402, 0.1093943, -2.842177, 1, 0.2862745, 0, 1,
-1.697043, 3.00196, -0.08554307, 1, 0.2941177, 0, 1,
-1.651416, -0.2327813, -2.339107, 1, 0.3019608, 0, 1,
-1.646288, 0.2356812, -2.431059, 1, 0.3058824, 0, 1,
-1.633629, -0.3543617, -0.9495327, 1, 0.3137255, 0, 1,
-1.620517, 0.03933415, -2.474306, 1, 0.3176471, 0, 1,
-1.612642, 0.8995008, -1.490197, 1, 0.3254902, 0, 1,
-1.585093, -0.1617657, -0.2361646, 1, 0.3294118, 0, 1,
-1.576156, -0.1845944, -1.776283, 1, 0.3372549, 0, 1,
-1.57228, 0.5310192, -0.4270981, 1, 0.3411765, 0, 1,
-1.568488, -0.07688784, -2.489379, 1, 0.3490196, 0, 1,
-1.568484, -0.2352619, -0.562773, 1, 0.3529412, 0, 1,
-1.564409, -0.534725, -0.8382055, 1, 0.3607843, 0, 1,
-1.56397, -1.098323, -0.3841002, 1, 0.3647059, 0, 1,
-1.545872, 0.7733528, -2.55256, 1, 0.372549, 0, 1,
-1.545461, -1.3527, -2.739296, 1, 0.3764706, 0, 1,
-1.518441, 0.2301442, -1.905406, 1, 0.3843137, 0, 1,
-1.511816, 1.586521, -0.9962348, 1, 0.3882353, 0, 1,
-1.506378, -0.7841291, -2.098512, 1, 0.3960784, 0, 1,
-1.502695, -0.1615877, -0.01347088, 1, 0.4039216, 0, 1,
-1.500701, 0.9483137, -2.003867, 1, 0.4078431, 0, 1,
-1.497714, -0.4775473, -3.573449, 1, 0.4156863, 0, 1,
-1.477798, -0.9635971, -0.2587099, 1, 0.4196078, 0, 1,
-1.474429, -1.944418, -2.384136, 1, 0.427451, 0, 1,
-1.473767, -0.4084006, -0.5700061, 1, 0.4313726, 0, 1,
-1.45708, -0.8951252, -2.779451, 1, 0.4392157, 0, 1,
-1.455203, -0.4834525, -1.447349, 1, 0.4431373, 0, 1,
-1.454366, -0.8080681, -2.95875, 1, 0.4509804, 0, 1,
-1.448274, -1.266252, -2.347678, 1, 0.454902, 0, 1,
-1.447114, -0.386725, -1.467616, 1, 0.4627451, 0, 1,
-1.442024, -0.4571522, 0.02142227, 1, 0.4666667, 0, 1,
-1.440878, 0.4052445, -0.8422813, 1, 0.4745098, 0, 1,
-1.433567, 0.7232731, -1.792745, 1, 0.4784314, 0, 1,
-1.433083, 0.2688477, -3.740532, 1, 0.4862745, 0, 1,
-1.428462, 0.2702272, -1.315854, 1, 0.4901961, 0, 1,
-1.424977, 1.864197, 0.332181, 1, 0.4980392, 0, 1,
-1.419233, -1.353382, -1.377547, 1, 0.5058824, 0, 1,
-1.415177, -1.427241, -2.383627, 1, 0.509804, 0, 1,
-1.403473, -0.511108, -3.180958, 1, 0.5176471, 0, 1,
-1.396817, 0.3633863, -2.517546, 1, 0.5215687, 0, 1,
-1.395765, -0.9177142, -3.465794, 1, 0.5294118, 0, 1,
-1.386411, -0.7836036, -1.678684, 1, 0.5333334, 0, 1,
-1.378306, -1.021504, -2.318732, 1, 0.5411765, 0, 1,
-1.362596, 0.09480797, -1.608413, 1, 0.5450981, 0, 1,
-1.360589, 0.4302211, -1.003602, 1, 0.5529412, 0, 1,
-1.357528, -2.89215, -3.152145, 1, 0.5568628, 0, 1,
-1.355229, 1.317228, -1.121417, 1, 0.5647059, 0, 1,
-1.350682, 1.991502, 0.8244179, 1, 0.5686275, 0, 1,
-1.343588, 1.37824, -0.5708136, 1, 0.5764706, 0, 1,
-1.313233, -2.218215, -2.595355, 1, 0.5803922, 0, 1,
-1.312959, 1.035679, -0.6119882, 1, 0.5882353, 0, 1,
-1.300644, -1.034086, -3.453556, 1, 0.5921569, 0, 1,
-1.29873, 0.3003227, -1.616686, 1, 0.6, 0, 1,
-1.289032, 0.0748398, -1.869925, 1, 0.6078432, 0, 1,
-1.277289, -2.414002, -5.564851, 1, 0.6117647, 0, 1,
-1.276801, -1.227466, -2.689045, 1, 0.6196079, 0, 1,
-1.274642, -0.7011199, -1.774705, 1, 0.6235294, 0, 1,
-1.269227, 0.3204089, -2.93536, 1, 0.6313726, 0, 1,
-1.266854, 0.8856146, -2.570355, 1, 0.6352941, 0, 1,
-1.264882, 0.08844272, -2.467879, 1, 0.6431373, 0, 1,
-1.260534, 1.421552, -0.469144, 1, 0.6470588, 0, 1,
-1.256394, -1.92386, -4.023499, 1, 0.654902, 0, 1,
-1.254601, 0.1258945, -2.876465, 1, 0.6588235, 0, 1,
-1.254541, 1.171429, 0.4266637, 1, 0.6666667, 0, 1,
-1.253774, 0.3182226, -1.69333, 1, 0.6705883, 0, 1,
-1.25135, -0.1486129, -1.967363, 1, 0.6784314, 0, 1,
-1.239538, -0.5601459, -1.665549, 1, 0.682353, 0, 1,
-1.238042, 0.274481, -2.879153, 1, 0.6901961, 0, 1,
-1.23507, -0.2567194, -1.037349, 1, 0.6941177, 0, 1,
-1.228383, -0.638992, -2.190763, 1, 0.7019608, 0, 1,
-1.226836, -2.616778, -3.474886, 1, 0.7098039, 0, 1,
-1.215044, 1.110131, -1.773724, 1, 0.7137255, 0, 1,
-1.210374, -0.1838017, -2.679075, 1, 0.7215686, 0, 1,
-1.200599, 1.745638, -0.5362192, 1, 0.7254902, 0, 1,
-1.198685, -0.06815017, -2.990735, 1, 0.7333333, 0, 1,
-1.190284, 0.3502223, 0.2015028, 1, 0.7372549, 0, 1,
-1.187652, -0.5444321, -1.843916, 1, 0.7450981, 0, 1,
-1.184903, 1.985698, -0.566049, 1, 0.7490196, 0, 1,
-1.177547, 0.2687797, -2.360699, 1, 0.7568628, 0, 1,
-1.169565, 0.2507506, -2.964303, 1, 0.7607843, 0, 1,
-1.168797, 0.4751582, -0.9993523, 1, 0.7686275, 0, 1,
-1.156059, 2.692052, 1.322694, 1, 0.772549, 0, 1,
-1.155389, -1.986893, -2.042532, 1, 0.7803922, 0, 1,
-1.154256, 0.717204, -0.9217529, 1, 0.7843137, 0, 1,
-1.152337, -0.05218777, -1.813688, 1, 0.7921569, 0, 1,
-1.148745, -0.3300896, -1.286713, 1, 0.7960784, 0, 1,
-1.148295, 0.5144482, -3.086541, 1, 0.8039216, 0, 1,
-1.143326, -1.944283, -1.793996, 1, 0.8117647, 0, 1,
-1.133893, -0.2989141, -0.7921486, 1, 0.8156863, 0, 1,
-1.124245, 0.3836744, -0.3136906, 1, 0.8235294, 0, 1,
-1.11244, 0.4371762, 0.518707, 1, 0.827451, 0, 1,
-1.103176, -0.2446425, -0.9279849, 1, 0.8352941, 0, 1,
-1.100452, 0.840693, -1.500115, 1, 0.8392157, 0, 1,
-1.094034, -0.4736234, -2.611299, 1, 0.8470588, 0, 1,
-1.079568, 0.2939978, -1.205693, 1, 0.8509804, 0, 1,
-1.07719, 0.3391063, -1.443744, 1, 0.8588235, 0, 1,
-1.070961, 2.008394, -1.130998, 1, 0.8627451, 0, 1,
-1.063461, 0.9225693, -2.305956, 1, 0.8705882, 0, 1,
-1.050037, -1.304366, -3.815886, 1, 0.8745098, 0, 1,
-1.044294, -0.7103141, -2.654735, 1, 0.8823529, 0, 1,
-1.042937, -0.5811983, -2.239527, 1, 0.8862745, 0, 1,
-1.042136, -1.404987, -2.991326, 1, 0.8941177, 0, 1,
-1.037337, -1.135061, -3.19488, 1, 0.8980392, 0, 1,
-1.032962, -1.669977, -2.948932, 1, 0.9058824, 0, 1,
-1.026807, -0.02351019, -3.503114, 1, 0.9137255, 0, 1,
-1.024985, 0.06949174, -1.333322, 1, 0.9176471, 0, 1,
-1.021922, -1.240913, -2.054709, 1, 0.9254902, 0, 1,
-1.015719, 2.398206, 1.153245, 1, 0.9294118, 0, 1,
-1.010018, -0.7365111, -2.914149, 1, 0.9372549, 0, 1,
-1.009742, 1.870147, -2.070717, 1, 0.9411765, 0, 1,
-1.001646, 0.2586676, -1.565808, 1, 0.9490196, 0, 1,
-0.9931421, 0.3928394, -1.880382, 1, 0.9529412, 0, 1,
-0.9823199, -0.3316388, -2.293111, 1, 0.9607843, 0, 1,
-0.9812607, -0.2002782, -0.1424513, 1, 0.9647059, 0, 1,
-0.9739271, -0.2778331, -2.617844, 1, 0.972549, 0, 1,
-0.9639747, -1.779805, -3.528255, 1, 0.9764706, 0, 1,
-0.9627284, 0.8872905, -1.764177, 1, 0.9843137, 0, 1,
-0.9540246, 0.2659111, -1.846436, 1, 0.9882353, 0, 1,
-0.9535754, 1.379172, -0.7958968, 1, 0.9960784, 0, 1,
-0.9529424, 0.07355042, -0.5150766, 0.9960784, 1, 0, 1,
-0.9521312, -0.04746526, -1.521283, 0.9921569, 1, 0, 1,
-0.9362686, -0.2190683, -2.182432, 0.9843137, 1, 0, 1,
-0.9356507, 1.208771, 1.17924, 0.9803922, 1, 0, 1,
-0.9328083, 0.2954277, -1.333793, 0.972549, 1, 0, 1,
-0.9284616, 0.6695825, 0.1573019, 0.9686275, 1, 0, 1,
-0.9093896, 1.305437, 0.1967718, 0.9607843, 1, 0, 1,
-0.9093654, 0.6886624, -2.019435, 0.9568627, 1, 0, 1,
-0.9081376, -1.151126, -1.955805, 0.9490196, 1, 0, 1,
-0.9052125, 1.751036, -0.3568008, 0.945098, 1, 0, 1,
-0.8883915, 1.401414, -1.842607, 0.9372549, 1, 0, 1,
-0.8874584, 0.3107972, -0.4572471, 0.9333333, 1, 0, 1,
-0.8874081, -0.8435782, -0.5097246, 0.9254902, 1, 0, 1,
-0.8792017, 1.005232, -0.04083215, 0.9215686, 1, 0, 1,
-0.8777481, -1.484681, -2.235025, 0.9137255, 1, 0, 1,
-0.8702779, 0.1695057, -3.09685, 0.9098039, 1, 0, 1,
-0.8692032, 1.069431, -0.1976998, 0.9019608, 1, 0, 1,
-0.8659239, -1.448846, -2.135607, 0.8941177, 1, 0, 1,
-0.8658596, -1.738519, -2.043476, 0.8901961, 1, 0, 1,
-0.8627211, 1.734116, -0.3937927, 0.8823529, 1, 0, 1,
-0.8574749, 0.1544946, -3.461734, 0.8784314, 1, 0, 1,
-0.8548865, 1.308594, 1.221576, 0.8705882, 1, 0, 1,
-0.8530638, -0.1734983, -1.709083, 0.8666667, 1, 0, 1,
-0.8514332, 1.883117, 1.799142, 0.8588235, 1, 0, 1,
-0.8512471, 0.5329722, -0.4654324, 0.854902, 1, 0, 1,
-0.8459722, -1.373623, -4.008098, 0.8470588, 1, 0, 1,
-0.8457867, -0.1810015, -0.5820885, 0.8431373, 1, 0, 1,
-0.8441889, 1.067473, -0.76056, 0.8352941, 1, 0, 1,
-0.8391163, -0.1932682, -3.275748, 0.8313726, 1, 0, 1,
-0.8391042, 0.263427, -2.665706, 0.8235294, 1, 0, 1,
-0.8390458, 0.08480813, -0.9155256, 0.8196079, 1, 0, 1,
-0.8347884, -1.04187, -2.306192, 0.8117647, 1, 0, 1,
-0.8328124, 1.091722, 0.8139114, 0.8078431, 1, 0, 1,
-0.8249919, 0.3577046, -0.7206668, 0.8, 1, 0, 1,
-0.8240347, 3.054732, -1.242137, 0.7921569, 1, 0, 1,
-0.8146866, -1.23861, -3.207551, 0.7882353, 1, 0, 1,
-0.8133565, -1.329641, -1.517062, 0.7803922, 1, 0, 1,
-0.8118555, 1.025294, -1.492977, 0.7764706, 1, 0, 1,
-0.811745, -0.2790743, -2.408676, 0.7686275, 1, 0, 1,
-0.8116896, -1.373402, -1.171317, 0.7647059, 1, 0, 1,
-0.8073607, 0.1745545, -0.7373171, 0.7568628, 1, 0, 1,
-0.8066053, 0.344514, -0.6435418, 0.7529412, 1, 0, 1,
-0.7977569, 1.584685, -1.771078, 0.7450981, 1, 0, 1,
-0.7970547, -0.06523187, -1.204461, 0.7411765, 1, 0, 1,
-0.7938712, 0.6107516, -0.7452422, 0.7333333, 1, 0, 1,
-0.7916108, 0.5572835, 0.06575049, 0.7294118, 1, 0, 1,
-0.7916012, 0.2732153, -0.3527267, 0.7215686, 1, 0, 1,
-0.7884486, -0.5457701, -1.799815, 0.7176471, 1, 0, 1,
-0.7829973, -0.5576625, -2.816712, 0.7098039, 1, 0, 1,
-0.7766713, 0.8411174, -0.7607754, 0.7058824, 1, 0, 1,
-0.7758326, 0.6498258, -1.991331, 0.6980392, 1, 0, 1,
-0.773409, -0.4373708, -1.761306, 0.6901961, 1, 0, 1,
-0.7635863, 0.6555272, 0.1476597, 0.6862745, 1, 0, 1,
-0.7602582, -1.358471, -2.748687, 0.6784314, 1, 0, 1,
-0.7579833, 0.06092377, -0.9164438, 0.6745098, 1, 0, 1,
-0.7485334, 0.567776, -2.684156, 0.6666667, 1, 0, 1,
-0.7447149, -0.9368627, -2.666295, 0.6627451, 1, 0, 1,
-0.7425164, 0.06414615, -1.774, 0.654902, 1, 0, 1,
-0.7416099, -0.2891488, -3.380489, 0.6509804, 1, 0, 1,
-0.7377706, -0.09187878, -0.7605911, 0.6431373, 1, 0, 1,
-0.7309119, -0.5574049, -0.8746699, 0.6392157, 1, 0, 1,
-0.7288285, 2.196517, -0.4943145, 0.6313726, 1, 0, 1,
-0.7272187, 0.03977487, -1.044203, 0.627451, 1, 0, 1,
-0.7259237, 1.110639, -0.3020428, 0.6196079, 1, 0, 1,
-0.725371, -0.3657102, -2.627573, 0.6156863, 1, 0, 1,
-0.7196514, 0.7166654, -0.7085671, 0.6078432, 1, 0, 1,
-0.7194591, 1.151565, 0.2915596, 0.6039216, 1, 0, 1,
-0.7146304, 0.9800134, -0.9082776, 0.5960785, 1, 0, 1,
-0.710848, 0.662879, -0.07672483, 0.5882353, 1, 0, 1,
-0.7061586, 0.7561672, -1.537266, 0.5843138, 1, 0, 1,
-0.7039238, -1.106952, -2.332102, 0.5764706, 1, 0, 1,
-0.7033787, 1.264385, -1.176356, 0.572549, 1, 0, 1,
-0.700788, -0.8758078, -3.863559, 0.5647059, 1, 0, 1,
-0.6992097, -1.547566, -3.510463, 0.5607843, 1, 0, 1,
-0.6897439, 0.6657466, -0.7385491, 0.5529412, 1, 0, 1,
-0.6781026, -0.05361808, -3.103813, 0.5490196, 1, 0, 1,
-0.6733239, -0.6299852, -3.418266, 0.5411765, 1, 0, 1,
-0.6691307, -1.070185, -5.131871, 0.5372549, 1, 0, 1,
-0.6642891, 0.4782911, 0.3848831, 0.5294118, 1, 0, 1,
-0.6494402, -0.08415312, -1.499117, 0.5254902, 1, 0, 1,
-0.6489636, 0.4081744, -0.8896994, 0.5176471, 1, 0, 1,
-0.6478428, 0.5021451, -1.468198, 0.5137255, 1, 0, 1,
-0.6463295, -0.7811521, -1.298145, 0.5058824, 1, 0, 1,
-0.6445103, 0.200901, -1.504812, 0.5019608, 1, 0, 1,
-0.6437123, -0.3921984, -2.450087, 0.4941176, 1, 0, 1,
-0.643347, -1.300064, -3.812068, 0.4862745, 1, 0, 1,
-0.6395187, 0.1628605, -0.2093866, 0.4823529, 1, 0, 1,
-0.6393071, -1.429434, -1.477992, 0.4745098, 1, 0, 1,
-0.6388956, -0.5626769, -1.65374, 0.4705882, 1, 0, 1,
-0.6380687, -1.631022, -2.375219, 0.4627451, 1, 0, 1,
-0.6359366, -0.5327581, -2.32259, 0.4588235, 1, 0, 1,
-0.631977, -0.07798231, -2.853928, 0.4509804, 1, 0, 1,
-0.6318371, -0.4871348, -1.531667, 0.4470588, 1, 0, 1,
-0.6301073, -0.6249939, -2.716554, 0.4392157, 1, 0, 1,
-0.6240675, -0.4150764, -3.088574, 0.4352941, 1, 0, 1,
-0.62257, -1.392861, -1.222339, 0.427451, 1, 0, 1,
-0.6179146, 1.684477, -0.4140752, 0.4235294, 1, 0, 1,
-0.6178482, 0.8392816, -0.01737507, 0.4156863, 1, 0, 1,
-0.6170752, 0.6816015, -0.1084796, 0.4117647, 1, 0, 1,
-0.6087323, 0.03462812, -2.36672, 0.4039216, 1, 0, 1,
-0.602558, 1.235131, 0.6059064, 0.3960784, 1, 0, 1,
-0.5999085, -0.4049802, -2.324324, 0.3921569, 1, 0, 1,
-0.5890466, 0.3955866, -1.276499, 0.3843137, 1, 0, 1,
-0.5873571, -0.3441231, -2.82563, 0.3803922, 1, 0, 1,
-0.5797688, -0.5243445, -1.349954, 0.372549, 1, 0, 1,
-0.5715128, 2.244719, -0.686291, 0.3686275, 1, 0, 1,
-0.5598386, 2.739014, 0.6007463, 0.3607843, 1, 0, 1,
-0.5586683, -1.526025, -2.221802, 0.3568628, 1, 0, 1,
-0.5579625, 0.247026, -1.82536, 0.3490196, 1, 0, 1,
-0.5568569, 0.5901053, 0.8311968, 0.345098, 1, 0, 1,
-0.5547964, -0.3990566, -2.550992, 0.3372549, 1, 0, 1,
-0.5521869, 0.5258361, -0.04583803, 0.3333333, 1, 0, 1,
-0.551224, -1.925039, -1.607682, 0.3254902, 1, 0, 1,
-0.5500031, 0.4354184, -1.923163, 0.3215686, 1, 0, 1,
-0.549299, -0.2510908, -2.537378, 0.3137255, 1, 0, 1,
-0.5458575, -0.9846549, -3.263964, 0.3098039, 1, 0, 1,
-0.5433643, -0.6089306, -1.915794, 0.3019608, 1, 0, 1,
-0.5417332, 0.9506249, -0.7020037, 0.2941177, 1, 0, 1,
-0.5390423, -0.5791979, -2.810498, 0.2901961, 1, 0, 1,
-0.5380511, 0.1507282, -1.778756, 0.282353, 1, 0, 1,
-0.5370036, -0.591752, -3.464864, 0.2784314, 1, 0, 1,
-0.5345938, 0.04153538, -2.485494, 0.2705882, 1, 0, 1,
-0.5301159, -0.249978, -2.004654, 0.2666667, 1, 0, 1,
-0.5279953, -1.878406, -2.752524, 0.2588235, 1, 0, 1,
-0.5279173, 0.1376139, -2.124099, 0.254902, 1, 0, 1,
-0.5241474, -1.475438, -3.429924, 0.2470588, 1, 0, 1,
-0.5212273, -0.3278908, -0.7430359, 0.2431373, 1, 0, 1,
-0.5207471, 0.6503499, -1.235606, 0.2352941, 1, 0, 1,
-0.5202338, 1.200817, -0.1685563, 0.2313726, 1, 0, 1,
-0.5189924, 0.5496123, -1.032645, 0.2235294, 1, 0, 1,
-0.5149282, 0.8848683, 1.812718, 0.2196078, 1, 0, 1,
-0.5130199, 1.850128, 0.04004275, 0.2117647, 1, 0, 1,
-0.5118989, -0.3986699, -0.7704741, 0.2078431, 1, 0, 1,
-0.5100479, -0.4757527, -1.998353, 0.2, 1, 0, 1,
-0.5095139, -0.7268513, -3.731868, 0.1921569, 1, 0, 1,
-0.5056869, -0.3234981, -1.532594, 0.1882353, 1, 0, 1,
-0.4988077, -0.6213453, -1.22525, 0.1803922, 1, 0, 1,
-0.4942304, 0.5321956, -1.391312, 0.1764706, 1, 0, 1,
-0.492923, 0.2742408, -1.36724, 0.1686275, 1, 0, 1,
-0.4926994, 0.6359329, -0.6175435, 0.1647059, 1, 0, 1,
-0.4915237, -0.1969238, -1.552009, 0.1568628, 1, 0, 1,
-0.4832032, 0.04066749, -0.1929759, 0.1529412, 1, 0, 1,
-0.481883, 0.5017125, 0.7054755, 0.145098, 1, 0, 1,
-0.4779437, 0.4466498, -3.077233, 0.1411765, 1, 0, 1,
-0.4772508, -0.6886132, -0.9382118, 0.1333333, 1, 0, 1,
-0.4694663, 0.1022768, -4.060309, 0.1294118, 1, 0, 1,
-0.4678726, 0.6653976, 0.2689715, 0.1215686, 1, 0, 1,
-0.4645236, 0.8172585, -1.347103, 0.1176471, 1, 0, 1,
-0.4630275, -2.54602, -4.136349, 0.1098039, 1, 0, 1,
-0.457538, 0.6085993, 0.02052916, 0.1058824, 1, 0, 1,
-0.4550287, -0.6100261, -2.565668, 0.09803922, 1, 0, 1,
-0.4493688, 0.09511582, -1.879412, 0.09019608, 1, 0, 1,
-0.4475461, 0.8086323, 0.6678181, 0.08627451, 1, 0, 1,
-0.4446712, -0.9224705, -3.238566, 0.07843138, 1, 0, 1,
-0.4396143, 0.3075299, -1.084258, 0.07450981, 1, 0, 1,
-0.4375699, 1.755295, -2.125557, 0.06666667, 1, 0, 1,
-0.4350766, 1.050822, 1.609693, 0.0627451, 1, 0, 1,
-0.4320433, -1.167799, -3.823687, 0.05490196, 1, 0, 1,
-0.4315984, -0.8205019, -3.518048, 0.05098039, 1, 0, 1,
-0.429691, 0.119183, -2.319645, 0.04313726, 1, 0, 1,
-0.4236439, -0.4881128, -2.28164, 0.03921569, 1, 0, 1,
-0.4235007, -0.8260351, -4.142267, 0.03137255, 1, 0, 1,
-0.4227602, 1.778935, -0.9279579, 0.02745098, 1, 0, 1,
-0.4225766, -1.379277, -4.211766, 0.01960784, 1, 0, 1,
-0.4215118, -0.4441734, -3.960427, 0.01568628, 1, 0, 1,
-0.4127086, 0.3193606, -1.545138, 0.007843138, 1, 0, 1,
-0.4123385, 0.392533, 0.2992674, 0.003921569, 1, 0, 1,
-0.4104709, 0.5578303, -1.903501, 0, 1, 0.003921569, 1,
-0.4087156, 0.9038507, -0.1497837, 0, 1, 0.01176471, 1,
-0.407033, 1.045202, 2.276496, 0, 1, 0.01568628, 1,
-0.4030654, 0.3101963, 0.4448479, 0, 1, 0.02352941, 1,
-0.4029625, -1.244716, -3.331853, 0, 1, 0.02745098, 1,
-0.4003594, 0.05004013, -2.289106, 0, 1, 0.03529412, 1,
-0.3994775, -1.637728, -3.545774, 0, 1, 0.03921569, 1,
-0.3955255, -1.41907, -2.796448, 0, 1, 0.04705882, 1,
-0.3947708, -0.3273802, -1.755554, 0, 1, 0.05098039, 1,
-0.3896464, 1.517534, 0.344052, 0, 1, 0.05882353, 1,
-0.3885776, 1.053408, -0.3969191, 0, 1, 0.0627451, 1,
-0.3872214, -0.8307989, -1.112647, 0, 1, 0.07058824, 1,
-0.3848546, -0.5878869, -1.432513, 0, 1, 0.07450981, 1,
-0.3815826, -1.222514, -2.949931, 0, 1, 0.08235294, 1,
-0.380414, -0.8737997, -2.299753, 0, 1, 0.08627451, 1,
-0.3780635, -1.267718, -1.618188, 0, 1, 0.09411765, 1,
-0.37695, 1.122977, -0.9909962, 0, 1, 0.1019608, 1,
-0.3759404, -1.461876, -1.807346, 0, 1, 0.1058824, 1,
-0.3755369, 0.6055138, 0.01476347, 0, 1, 0.1137255, 1,
-0.3740614, -0.8319343, -3.067769, 0, 1, 0.1176471, 1,
-0.3728841, -0.4344961, -2.030623, 0, 1, 0.1254902, 1,
-0.3622165, 0.599611, 0.07406225, 0, 1, 0.1294118, 1,
-0.3589184, -0.6116725, 0.2708187, 0, 1, 0.1372549, 1,
-0.3587244, -0.3070367, -3.0718, 0, 1, 0.1411765, 1,
-0.3580519, 0.3185017, 0.3940839, 0, 1, 0.1490196, 1,
-0.3556019, 0.6108792, 0.3195567, 0, 1, 0.1529412, 1,
-0.3511524, -0.03084745, -1.555555, 0, 1, 0.1607843, 1,
-0.3508531, -0.05991625, -2.107565, 0, 1, 0.1647059, 1,
-0.3460081, -0.8572727, -3.68723, 0, 1, 0.172549, 1,
-0.3459624, -0.970649, -2.89433, 0, 1, 0.1764706, 1,
-0.344289, 0.6197187, -0.4038013, 0, 1, 0.1843137, 1,
-0.3424317, -0.05721889, -1.240246, 0, 1, 0.1882353, 1,
-0.3407758, 0.2204784, -1.898586, 0, 1, 0.1960784, 1,
-0.3396891, 2.180278, -0.3116468, 0, 1, 0.2039216, 1,
-0.337864, -0.07488936, -2.290842, 0, 1, 0.2078431, 1,
-0.3372773, -0.2435783, -0.6290278, 0, 1, 0.2156863, 1,
-0.3355054, -0.7624086, -3.682568, 0, 1, 0.2196078, 1,
-0.3340611, 0.06771117, -0.7384894, 0, 1, 0.227451, 1,
-0.3337874, 0.7365263, -0.7137921, 0, 1, 0.2313726, 1,
-0.3273576, -0.1995132, -2.521386, 0, 1, 0.2392157, 1,
-0.3141759, -2.049967, -2.169445, 0, 1, 0.2431373, 1,
-0.3128118, -2.047187, -3.251447, 0, 1, 0.2509804, 1,
-0.3114141, -0.1386803, -2.252558, 0, 1, 0.254902, 1,
-0.3109643, -0.2135745, -2.118891, 0, 1, 0.2627451, 1,
-0.309752, 0.6439398, 1.052156, 0, 1, 0.2666667, 1,
-0.3062721, -0.6921555, -2.864264, 0, 1, 0.2745098, 1,
-0.3053112, 0.4779111, -3.409598, 0, 1, 0.2784314, 1,
-0.3047717, -0.3658466, -2.747232, 0, 1, 0.2862745, 1,
-0.3040143, 0.4496736, 0.588966, 0, 1, 0.2901961, 1,
-0.3030134, -0.06646472, -2.857614, 0, 1, 0.2980392, 1,
-0.3025843, 0.6085626, -0.2209519, 0, 1, 0.3058824, 1,
-0.3019494, 0.2893133, 0.6291471, 0, 1, 0.3098039, 1,
-0.2970736, -0.9656951, -3.568232, 0, 1, 0.3176471, 1,
-0.2965615, -0.6633952, -3.463947, 0, 1, 0.3215686, 1,
-0.2931789, 1.808227, 0.1706234, 0, 1, 0.3294118, 1,
-0.2870807, 0.4116533, -1.328663, 0, 1, 0.3333333, 1,
-0.2867212, -1.596626, -3.499436, 0, 1, 0.3411765, 1,
-0.2844697, 1.965498, -0.3683205, 0, 1, 0.345098, 1,
-0.2779938, 0.02001021, -0.6386293, 0, 1, 0.3529412, 1,
-0.273074, 0.2858201, 0.2838016, 0, 1, 0.3568628, 1,
-0.2714408, -1.27535, -2.305481, 0, 1, 0.3647059, 1,
-0.2713178, -2.099242, -1.07909, 0, 1, 0.3686275, 1,
-0.2691182, -0.7569413, -3.171809, 0, 1, 0.3764706, 1,
-0.2656044, -0.4045864, -0.9995407, 0, 1, 0.3803922, 1,
-0.2649971, 1.597887, -1.012685, 0, 1, 0.3882353, 1,
-0.2648234, -1.714299, -2.980388, 0, 1, 0.3921569, 1,
-0.2647464, -0.61349, -1.727232, 0, 1, 0.4, 1,
-0.2617685, 1.855888, 1.161874, 0, 1, 0.4078431, 1,
-0.2616281, 1.090439, 0.4131177, 0, 1, 0.4117647, 1,
-0.2615462, 0.8742595, -1.025118, 0, 1, 0.4196078, 1,
-0.2601165, -0.3289959, -1.822734, 0, 1, 0.4235294, 1,
-0.2595849, -1.706975, -3.289057, 0, 1, 0.4313726, 1,
-0.257951, 0.4194214, -0.6498855, 0, 1, 0.4352941, 1,
-0.2571689, -0.04358281, -2.106676, 0, 1, 0.4431373, 1,
-0.2550267, -1.033942, -3.13304, 0, 1, 0.4470588, 1,
-0.2521307, 1.392465, -1.78344, 0, 1, 0.454902, 1,
-0.2517696, 0.5630332, -1.263492, 0, 1, 0.4588235, 1,
-0.2469257, 0.240332, -1.165077, 0, 1, 0.4666667, 1,
-0.2457206, -0.8141224, -3.720005, 0, 1, 0.4705882, 1,
-0.2421308, 1.252362, 0.4645158, 0, 1, 0.4784314, 1,
-0.2421171, 0.5213944, -0.7856334, 0, 1, 0.4823529, 1,
-0.240295, 0.9798297, -1.409582, 0, 1, 0.4901961, 1,
-0.2386834, -0.2185757, -3.940358, 0, 1, 0.4941176, 1,
-0.2376745, 0.4701435, 0.3489701, 0, 1, 0.5019608, 1,
-0.2348332, 0.6639763, 0.7683071, 0, 1, 0.509804, 1,
-0.2308378, -0.3804729, -1.688347, 0, 1, 0.5137255, 1,
-0.2278845, -0.3960921, -3.119856, 0, 1, 0.5215687, 1,
-0.224841, -0.7306464, -1.782595, 0, 1, 0.5254902, 1,
-0.2229391, 1.507017, 0.6418856, 0, 1, 0.5333334, 1,
-0.2177027, 0.008227372, -1.623152, 0, 1, 0.5372549, 1,
-0.2176258, 0.3271736, 0.5479107, 0, 1, 0.5450981, 1,
-0.217429, -0.9970079, -3.409048, 0, 1, 0.5490196, 1,
-0.2149861, 1.442789, -0.6660036, 0, 1, 0.5568628, 1,
-0.2118739, -0.93269, -3.284051, 0, 1, 0.5607843, 1,
-0.2107501, 1.39784, 1.257543, 0, 1, 0.5686275, 1,
-0.2056052, -1.643659, -2.844636, 0, 1, 0.572549, 1,
-0.2019872, -0.1381786, -0.9648073, 0, 1, 0.5803922, 1,
-0.1997886, 0.3370989, -2.070142, 0, 1, 0.5843138, 1,
-0.1983141, -1.20155, -1.762453, 0, 1, 0.5921569, 1,
-0.1973072, 0.5033939, 1.927495, 0, 1, 0.5960785, 1,
-0.1954525, 0.2305487, -0.3343738, 0, 1, 0.6039216, 1,
-0.1945155, 2.500517, -1.143412, 0, 1, 0.6117647, 1,
-0.1907192, 1.003494, 0.3244659, 0, 1, 0.6156863, 1,
-0.1897768, 0.7105572, 0.06447154, 0, 1, 0.6235294, 1,
-0.1892488, -1.925698, -2.321692, 0, 1, 0.627451, 1,
-0.1844939, -0.178889, -3.184979, 0, 1, 0.6352941, 1,
-0.1838563, 0.06565994, -1.93154, 0, 1, 0.6392157, 1,
-0.1829886, -0.6921612, -3.493379, 0, 1, 0.6470588, 1,
-0.1829181, 0.444012, -0.3335148, 0, 1, 0.6509804, 1,
-0.182651, 0.5162784, 0.3731148, 0, 1, 0.6588235, 1,
-0.1812446, 0.7500835, -0.4518868, 0, 1, 0.6627451, 1,
-0.1771661, -0.3884515, -1.516726, 0, 1, 0.6705883, 1,
-0.1763191, 0.8728975, -0.2199558, 0, 1, 0.6745098, 1,
-0.1760181, -0.1029076, -3.206954, 0, 1, 0.682353, 1,
-0.1699475, 0.5770644, -0.3025304, 0, 1, 0.6862745, 1,
-0.167154, 0.4826816, 0.2918591, 0, 1, 0.6941177, 1,
-0.1662182, -0.4611338, -1.427982, 0, 1, 0.7019608, 1,
-0.1654857, 0.4191881, -0.6119764, 0, 1, 0.7058824, 1,
-0.1645205, -0.5796827, -4.071593, 0, 1, 0.7137255, 1,
-0.1640341, -0.782698, -2.324409, 0, 1, 0.7176471, 1,
-0.1608561, -1.915714, -4.372212, 0, 1, 0.7254902, 1,
-0.151892, -0.148963, -3.14155, 0, 1, 0.7294118, 1,
-0.150626, -0.3784506, -1.533182, 0, 1, 0.7372549, 1,
-0.1494175, 0.3396365, -0.6065553, 0, 1, 0.7411765, 1,
-0.1487745, 0.8286037, -1.316357, 0, 1, 0.7490196, 1,
-0.139085, -1.437622, -4.125017, 0, 1, 0.7529412, 1,
-0.1380549, 2.191029, -0.9354085, 0, 1, 0.7607843, 1,
-0.1375857, -2.278588, -2.596453, 0, 1, 0.7647059, 1,
-0.1358806, 0.2757504, -0.3216839, 0, 1, 0.772549, 1,
-0.1319989, -0.8222266, -3.35139, 0, 1, 0.7764706, 1,
-0.1299039, 0.1411722, -0.8495789, 0, 1, 0.7843137, 1,
-0.1282138, 0.7076184, 0.275979, 0, 1, 0.7882353, 1,
-0.1235215, 1.596832, -0.9913459, 0, 1, 0.7960784, 1,
-0.1107562, 0.5775619, -0.7832213, 0, 1, 0.8039216, 1,
-0.1105387, -1.144942, -1.475097, 0, 1, 0.8078431, 1,
-0.1003823, -0.3675717, -2.330635, 0, 1, 0.8156863, 1,
-0.09155204, 0.4082241, 0.8278774, 0, 1, 0.8196079, 1,
-0.08608971, -0.873807, -4.347996, 0, 1, 0.827451, 1,
-0.08432052, 1.478869, 0.02124419, 0, 1, 0.8313726, 1,
-0.08361374, 1.378848, 1.204468, 0, 1, 0.8392157, 1,
-0.07738376, 1.677756, -0.9099169, 0, 1, 0.8431373, 1,
-0.07671305, 0.1154359, 0.4647329, 0, 1, 0.8509804, 1,
-0.07375169, -0.1330291, -2.104281, 0, 1, 0.854902, 1,
-0.07317003, 0.8561212, -1.694153, 0, 1, 0.8627451, 1,
-0.06895535, -1.343869, -2.74671, 0, 1, 0.8666667, 1,
-0.06528811, -0.4593967, -3.43527, 0, 1, 0.8745098, 1,
-0.06416064, 0.05780344, -0.5121211, 0, 1, 0.8784314, 1,
-0.06404196, -0.4384969, -3.105659, 0, 1, 0.8862745, 1,
-0.05980289, -0.4575596, -3.851403, 0, 1, 0.8901961, 1,
-0.05971995, -1.072702, -1.556595, 0, 1, 0.8980392, 1,
-0.05766277, -1.458369, -3.051981, 0, 1, 0.9058824, 1,
-0.05707628, -1.386664, -2.22371, 0, 1, 0.9098039, 1,
-0.05103133, -1.118462, -2.993542, 0, 1, 0.9176471, 1,
-0.04798834, -0.4319636, -4.137803, 0, 1, 0.9215686, 1,
-0.04689129, 1.147102, 0.1719323, 0, 1, 0.9294118, 1,
-0.04622496, -1.175615, -3.192578, 0, 1, 0.9333333, 1,
-0.0459683, 0.2826658, -0.7636843, 0, 1, 0.9411765, 1,
-0.04482809, -1.837141, -4.686481, 0, 1, 0.945098, 1,
-0.04440526, -1.851723, -5.284079, 0, 1, 0.9529412, 1,
-0.04174742, 0.1862976, 1.347764, 0, 1, 0.9568627, 1,
-0.03907588, -1.149562, -2.654896, 0, 1, 0.9647059, 1,
-0.0389596, 0.6764148, 0.4014592, 0, 1, 0.9686275, 1,
-0.03885563, 0.1998394, -0.1659445, 0, 1, 0.9764706, 1,
-0.03633195, -1.433096, -1.650591, 0, 1, 0.9803922, 1,
-0.03125986, 0.3485954, 1.576203, 0, 1, 0.9882353, 1,
-0.02682992, 0.287149, -2.531109, 0, 1, 0.9921569, 1,
-0.02358192, -0.7510836, -3.891879, 0, 1, 1, 1,
-0.02257483, 1.274506, 0.1093584, 0, 0.9921569, 1, 1,
-0.02188032, -1.526194, -2.289805, 0, 0.9882353, 1, 1,
-0.02059402, -0.5610701, -6.049675, 0, 0.9803922, 1, 1,
-0.01994691, -0.05107397, -2.33586, 0, 0.9764706, 1, 1,
-0.01689535, -0.4096105, -3.408602, 0, 0.9686275, 1, 1,
-0.01661852, 1.395185, 0.9769015, 0, 0.9647059, 1, 1,
-0.01574429, -0.6949118, -3.929188, 0, 0.9568627, 1, 1,
-0.01529264, -0.9412891, -2.87785, 0, 0.9529412, 1, 1,
-0.01049139, -1.86888, -2.0492, 0, 0.945098, 1, 1,
-0.008631311, 0.7081668, 0.4557267, 0, 0.9411765, 1, 1,
-0.006758273, -1.054067, -1.819356, 0, 0.9333333, 1, 1,
-0.006284861, -1.396187, -3.470215, 0, 0.9294118, 1, 1,
-0.003746951, -2.304364, -2.207178, 0, 0.9215686, 1, 1,
-0.002023514, 0.637132, -1.052834, 0, 0.9176471, 1, 1,
6.101895e-05, 0.1632614, -0.2454351, 0, 0.9098039, 1, 1,
0.00292241, -1.377059, 4.653257, 0, 0.9058824, 1, 1,
0.01218296, 0.02393867, 0.7063826, 0, 0.8980392, 1, 1,
0.01436959, 1.117571, -0.9415048, 0, 0.8901961, 1, 1,
0.01772277, -1.084438, 3.886229, 0, 0.8862745, 1, 1,
0.03086187, -1.14829, 4.244261, 0, 0.8784314, 1, 1,
0.03138579, -0.5039811, 2.847507, 0, 0.8745098, 1, 1,
0.03405128, -1.929783, 2.492081, 0, 0.8666667, 1, 1,
0.03479289, 0.9258432, 0.668278, 0, 0.8627451, 1, 1,
0.03559787, -1.269289, 4.845455, 0, 0.854902, 1, 1,
0.03722341, -0.3786435, 2.983738, 0, 0.8509804, 1, 1,
0.03745437, 0.6292582, -1.199711, 0, 0.8431373, 1, 1,
0.04000269, 0.5273757, -0.9553427, 0, 0.8392157, 1, 1,
0.04012874, -1.014764, 4.853413, 0, 0.8313726, 1, 1,
0.04200324, -0.508105, 2.387105, 0, 0.827451, 1, 1,
0.0501031, -0.06932528, 2.972333, 0, 0.8196079, 1, 1,
0.05100926, 0.335387, 0.1023617, 0, 0.8156863, 1, 1,
0.05423602, 0.6600352, 0.6544865, 0, 0.8078431, 1, 1,
0.05642478, 1.068112, -0.1724827, 0, 0.8039216, 1, 1,
0.05742698, 0.6913085, -0.7895405, 0, 0.7960784, 1, 1,
0.06030742, -0.2008333, 3.087254, 0, 0.7882353, 1, 1,
0.0611053, -0.4079878, 2.892328, 0, 0.7843137, 1, 1,
0.07241132, -0.9458791, 3.296845, 0, 0.7764706, 1, 1,
0.0739275, 0.6533283, 1.05797, 0, 0.772549, 1, 1,
0.07533545, -0.3248836, 3.744763, 0, 0.7647059, 1, 1,
0.07742015, 0.8359205, -1.371156, 0, 0.7607843, 1, 1,
0.0774415, -0.2116854, 1.353242, 0, 0.7529412, 1, 1,
0.07774685, 1.036823, 1.734762, 0, 0.7490196, 1, 1,
0.07801965, 2.75327, 1.605745, 0, 0.7411765, 1, 1,
0.07899887, -1.150371, 2.885833, 0, 0.7372549, 1, 1,
0.0794564, -1.247048, 4.682434, 0, 0.7294118, 1, 1,
0.08126505, -1.309725, 3.308366, 0, 0.7254902, 1, 1,
0.08324792, -0.7831964, 4.833554, 0, 0.7176471, 1, 1,
0.08464558, -0.4787069, 3.573874, 0, 0.7137255, 1, 1,
0.09394134, 0.2209032, 1.379246, 0, 0.7058824, 1, 1,
0.09473609, 0.1573387, 0.8699965, 0, 0.6980392, 1, 1,
0.09521162, -1.701359, 1.95867, 0, 0.6941177, 1, 1,
0.09589773, -0.3690783, 3.199971, 0, 0.6862745, 1, 1,
0.0976035, 0.9886358, 0.1115392, 0, 0.682353, 1, 1,
0.09800216, -0.6760669, 2.388963, 0, 0.6745098, 1, 1,
0.0983022, 0.7361125, -0.974786, 0, 0.6705883, 1, 1,
0.09852628, -1.913725, 1.933071, 0, 0.6627451, 1, 1,
0.09876928, -0.1405912, 2.17226, 0, 0.6588235, 1, 1,
0.1029519, 0.3236305, 0.3740654, 0, 0.6509804, 1, 1,
0.1094122, 0.3968129, -0.7259538, 0, 0.6470588, 1, 1,
0.1152927, 0.2486238, 1.302452, 0, 0.6392157, 1, 1,
0.1166383, 0.08198144, -0.5223004, 0, 0.6352941, 1, 1,
0.1184489, 0.03863857, 0.9314882, 0, 0.627451, 1, 1,
0.1189153, -1.833974, 4.96397, 0, 0.6235294, 1, 1,
0.1218138, 1.625297, 0.5617865, 0, 0.6156863, 1, 1,
0.1228544, -0.8998042, 1.629846, 0, 0.6117647, 1, 1,
0.1234194, 1.248274, -0.9429736, 0, 0.6039216, 1, 1,
0.1238873, 0.2948923, 0.2008095, 0, 0.5960785, 1, 1,
0.1265576, -1.438801, 2.157893, 0, 0.5921569, 1, 1,
0.1276913, 0.8413643, 0.4114268, 0, 0.5843138, 1, 1,
0.1282136, 1.609992, 1.196885, 0, 0.5803922, 1, 1,
0.1282322, 1.238407, 0.223956, 0, 0.572549, 1, 1,
0.133432, 1.239326, 0.6944011, 0, 0.5686275, 1, 1,
0.1369648, -1.44837, 2.896317, 0, 0.5607843, 1, 1,
0.1460564, -0.1782514, 1.08823, 0, 0.5568628, 1, 1,
0.1628141, 1.446447, 0.2427236, 0, 0.5490196, 1, 1,
0.1628597, 0.523417, -1.678165, 0, 0.5450981, 1, 1,
0.1634515, -1.209083, 2.083554, 0, 0.5372549, 1, 1,
0.1641435, -0.1665352, 3.818939, 0, 0.5333334, 1, 1,
0.1781819, -1.330613, 4.372283, 0, 0.5254902, 1, 1,
0.1821973, -0.1748445, 1.008878, 0, 0.5215687, 1, 1,
0.1848223, -1.050122, 3.139549, 0, 0.5137255, 1, 1,
0.185608, 0.114183, 3.012436, 0, 0.509804, 1, 1,
0.1890746, -0.6950207, 3.040732, 0, 0.5019608, 1, 1,
0.1918764, -0.1364174, 2.70506, 0, 0.4941176, 1, 1,
0.1921107, -0.3178419, 3.181082, 0, 0.4901961, 1, 1,
0.1931816, 0.3212777, 0.1154126, 0, 0.4823529, 1, 1,
0.1935144, 1.349199, 0.376902, 0, 0.4784314, 1, 1,
0.1966716, -1.063365, 3.392054, 0, 0.4705882, 1, 1,
0.1980347, 0.473244, -0.3845426, 0, 0.4666667, 1, 1,
0.1981636, 0.4662095, -0.5217918, 0, 0.4588235, 1, 1,
0.1987177, 0.7245467, 0.9772604, 0, 0.454902, 1, 1,
0.1993946, -0.09448419, 1.490897, 0, 0.4470588, 1, 1,
0.2066357, -0.3708012, 3.523481, 0, 0.4431373, 1, 1,
0.223846, 1.223204, -0.6590518, 0, 0.4352941, 1, 1,
0.225589, -0.4679761, 3.132363, 0, 0.4313726, 1, 1,
0.2294166, 2.035026, -0.8264928, 0, 0.4235294, 1, 1,
0.235752, -0.3083472, 4.101443, 0, 0.4196078, 1, 1,
0.2393365, -1.081103, 4.12516, 0, 0.4117647, 1, 1,
0.2408959, -0.6837737, 4.048583, 0, 0.4078431, 1, 1,
0.241179, 1.487749, 0.7397208, 0, 0.4, 1, 1,
0.2415029, 0.1237463, 0.4209581, 0, 0.3921569, 1, 1,
0.2423001, 0.8365409, 0.9492213, 0, 0.3882353, 1, 1,
0.2468107, -0.5875202, 3.366846, 0, 0.3803922, 1, 1,
0.2484905, -0.4630741, 2.673079, 0, 0.3764706, 1, 1,
0.2487726, -0.4583116, 2.608815, 0, 0.3686275, 1, 1,
0.2571881, -1.536579, 2.802434, 0, 0.3647059, 1, 1,
0.2572198, 1.015048, 0.2027389, 0, 0.3568628, 1, 1,
0.2597905, 1.806863, -1.390867, 0, 0.3529412, 1, 1,
0.2829279, -2.639336, 3.682771, 0, 0.345098, 1, 1,
0.2859844, 0.06146489, 2.891562, 0, 0.3411765, 1, 1,
0.2880129, -0.2451846, 1.330321, 0, 0.3333333, 1, 1,
0.2909316, 0.492706, 1.915961, 0, 0.3294118, 1, 1,
0.3075174, 0.842468, -0.9264645, 0, 0.3215686, 1, 1,
0.3080549, -0.2975118, 1.536114, 0, 0.3176471, 1, 1,
0.3089225, -1.301206, 2.902512, 0, 0.3098039, 1, 1,
0.3109068, -0.7724633, 2.432906, 0, 0.3058824, 1, 1,
0.3136351, 0.2389642, 0.08767406, 0, 0.2980392, 1, 1,
0.3142303, -0.1041083, 1.610768, 0, 0.2901961, 1, 1,
0.3191632, -2.083297, 3.555496, 0, 0.2862745, 1, 1,
0.3193556, 0.3758999, 1.053966, 0, 0.2784314, 1, 1,
0.3196365, -0.09890833, 1.5646, 0, 0.2745098, 1, 1,
0.3247917, -0.1524819, 4.982022, 0, 0.2666667, 1, 1,
0.3279022, -1.810094, 2.769976, 0, 0.2627451, 1, 1,
0.328826, -0.4686582, 3.536518, 0, 0.254902, 1, 1,
0.330189, -1.413057, 2.780352, 0, 0.2509804, 1, 1,
0.3310022, -0.297998, 1.711995, 0, 0.2431373, 1, 1,
0.3339924, 0.2701807, -0.8640802, 0, 0.2392157, 1, 1,
0.3348614, 0.3943375, -0.0869339, 0, 0.2313726, 1, 1,
0.3444327, -0.005308291, 1.993012, 0, 0.227451, 1, 1,
0.3468371, 0.4777458, 0.4340537, 0, 0.2196078, 1, 1,
0.3480265, -0.2394209, 2.433622, 0, 0.2156863, 1, 1,
0.3482014, -0.870171, 1.50788, 0, 0.2078431, 1, 1,
0.3542977, -0.8983967, 2.779444, 0, 0.2039216, 1, 1,
0.3598019, 0.8271281, -0.6284214, 0, 0.1960784, 1, 1,
0.3641049, 0.7005197, 2.297305, 0, 0.1882353, 1, 1,
0.3654205, -1.291385, 3.178728, 0, 0.1843137, 1, 1,
0.3716303, 0.6893472, 0.9408765, 0, 0.1764706, 1, 1,
0.3789266, 2.107478, 0.4682095, 0, 0.172549, 1, 1,
0.3794606, 1.108451, 0.4831078, 0, 0.1647059, 1, 1,
0.3825382, -0.2064505, 2.158048, 0, 0.1607843, 1, 1,
0.389105, 0.03680443, -0.08138794, 0, 0.1529412, 1, 1,
0.3926947, 0.0755275, 0.2441302, 0, 0.1490196, 1, 1,
0.392782, 0.5105025, 0.456459, 0, 0.1411765, 1, 1,
0.3966505, 0.9415287, -0.41095, 0, 0.1372549, 1, 1,
0.3969572, -1.548736, 3.54539, 0, 0.1294118, 1, 1,
0.4021618, -0.5444992, 0.7942149, 0, 0.1254902, 1, 1,
0.4039442, -0.8622858, 1.584362, 0, 0.1176471, 1, 1,
0.4048394, 0.2665817, 1.011613, 0, 0.1137255, 1, 1,
0.4092882, -0.3448946, 1.990892, 0, 0.1058824, 1, 1,
0.412115, 1.976321, 1.090624, 0, 0.09803922, 1, 1,
0.4158195, 0.3116321, 1.052903, 0, 0.09411765, 1, 1,
0.4200653, 0.9742005, 0.3049221, 0, 0.08627451, 1, 1,
0.421428, -1.521028, 2.876821, 0, 0.08235294, 1, 1,
0.4243835, -0.2874084, 2.613721, 0, 0.07450981, 1, 1,
0.4252623, 0.7605106, -0.369899, 0, 0.07058824, 1, 1,
0.4283574, 0.5277236, 0.4048291, 0, 0.0627451, 1, 1,
0.4323043, -0.2351269, -0.1504534, 0, 0.05882353, 1, 1,
0.4346521, -0.6750096, 2.873317, 0, 0.05098039, 1, 1,
0.4366744, -1.024998, 4.383327, 0, 0.04705882, 1, 1,
0.4433398, -0.5699027, 2.381139, 0, 0.03921569, 1, 1,
0.4507822, -0.131505, 1.727559, 0, 0.03529412, 1, 1,
0.4547288, -0.6282361, 0.3492655, 0, 0.02745098, 1, 1,
0.4563892, 0.03019791, 1.900166, 0, 0.02352941, 1, 1,
0.459654, -0.2442479, 3.046206, 0, 0.01568628, 1, 1,
0.4599351, 0.9235344, 1.040501, 0, 0.01176471, 1, 1,
0.4610423, -1.7606, 2.209282, 0, 0.003921569, 1, 1,
0.4620908, 0.5687835, 2.368149, 0.003921569, 0, 1, 1,
0.4630348, -0.3758975, 2.031255, 0.007843138, 0, 1, 1,
0.463202, 1.443191, -0.5118733, 0.01568628, 0, 1, 1,
0.4634425, 0.3516634, 1.757705, 0.01960784, 0, 1, 1,
0.4640557, -0.2127281, 2.419554, 0.02745098, 0, 1, 1,
0.466445, 1.454542, 0.3380075, 0.03137255, 0, 1, 1,
0.4699667, 1.550778, 0.5047966, 0.03921569, 0, 1, 1,
0.47833, -0.07283189, 3.198592, 0.04313726, 0, 1, 1,
0.47884, 0.007289731, 1.162053, 0.05098039, 0, 1, 1,
0.4884123, -1.711935, 2.003622, 0.05490196, 0, 1, 1,
0.4894892, -0.1250244, 0.3100376, 0.0627451, 0, 1, 1,
0.4914174, 0.7226829, 0.05578575, 0.06666667, 0, 1, 1,
0.493509, 0.125919, 0.8724873, 0.07450981, 0, 1, 1,
0.4946822, 0.08466731, 3.299754, 0.07843138, 0, 1, 1,
0.4990809, 0.3594528, 1.487756, 0.08627451, 0, 1, 1,
0.5003957, 0.6743103, 1.997355, 0.09019608, 0, 1, 1,
0.502065, -0.116748, 1.526475, 0.09803922, 0, 1, 1,
0.5027971, -0.1031623, 1.670407, 0.1058824, 0, 1, 1,
0.5040324, 0.9469681, 0.1894708, 0.1098039, 0, 1, 1,
0.5070264, 0.5739407, 1.929244, 0.1176471, 0, 1, 1,
0.5091408, -0.733211, 2.960316, 0.1215686, 0, 1, 1,
0.5097484, -1.449873, 3.93912, 0.1294118, 0, 1, 1,
0.5121063, 2.162898, 1.094957, 0.1333333, 0, 1, 1,
0.5173294, -0.3269896, 1.780497, 0.1411765, 0, 1, 1,
0.520626, -0.2274595, 1.396996, 0.145098, 0, 1, 1,
0.521539, -1.457921, 1.610053, 0.1529412, 0, 1, 1,
0.5219428, 0.563154, 0.5336925, 0.1568628, 0, 1, 1,
0.5249091, -0.463072, 4.613332, 0.1647059, 0, 1, 1,
0.5261195, -0.8528965, 4.775915, 0.1686275, 0, 1, 1,
0.5270082, 0.4512811, 0.1081259, 0.1764706, 0, 1, 1,
0.5323101, 1.385323, 2.742815, 0.1803922, 0, 1, 1,
0.5368417, 1.048436, 0.3038607, 0.1882353, 0, 1, 1,
0.5405282, -1.276991, 3.826464, 0.1921569, 0, 1, 1,
0.5413619, 2.108317, -0.4158445, 0.2, 0, 1, 1,
0.5421408, -1.10798, 2.232342, 0.2078431, 0, 1, 1,
0.5462123, 0.1530295, 2.302698, 0.2117647, 0, 1, 1,
0.5464874, 0.6027268, -0.7275516, 0.2196078, 0, 1, 1,
0.5503398, -2.483073, 2.576486, 0.2235294, 0, 1, 1,
0.5506718, 0.3038991, 0.1735118, 0.2313726, 0, 1, 1,
0.5508431, -0.09101924, 0.3289097, 0.2352941, 0, 1, 1,
0.5508625, 0.4650812, 1.523755, 0.2431373, 0, 1, 1,
0.5526662, 0.5527881, 0.522594, 0.2470588, 0, 1, 1,
0.5561281, 0.9891664, 1.000157, 0.254902, 0, 1, 1,
0.5611305, -1.383159, 3.487385, 0.2588235, 0, 1, 1,
0.5614405, 1.488201, -0.173613, 0.2666667, 0, 1, 1,
0.5633203, -1.047035, 2.367114, 0.2705882, 0, 1, 1,
0.5652266, 0.5083717, 1.21406, 0.2784314, 0, 1, 1,
0.5678755, 0.6223362, -0.118732, 0.282353, 0, 1, 1,
0.5687762, 2.530606, -0.7307893, 0.2901961, 0, 1, 1,
0.5687898, 0.8074275, 1.345343, 0.2941177, 0, 1, 1,
0.569405, 0.209498, 2.434437, 0.3019608, 0, 1, 1,
0.5716671, 0.06225916, 1.663275, 0.3098039, 0, 1, 1,
0.5766428, -1.530604, 0.9122215, 0.3137255, 0, 1, 1,
0.5766706, -1.326103, 3.582451, 0.3215686, 0, 1, 1,
0.578047, 0.9899268, 0.7546465, 0.3254902, 0, 1, 1,
0.5849173, 0.1441521, 1.79367, 0.3333333, 0, 1, 1,
0.5936224, -0.2460077, 2.030618, 0.3372549, 0, 1, 1,
0.5970042, 0.2024348, 2.026775, 0.345098, 0, 1, 1,
0.5974584, -0.63187, 2.988352, 0.3490196, 0, 1, 1,
0.6016638, -0.7129374, 3.262324, 0.3568628, 0, 1, 1,
0.6033031, 0.7232625, 0.4361157, 0.3607843, 0, 1, 1,
0.6071396, 2.95286, 2.451798, 0.3686275, 0, 1, 1,
0.6086008, 0.7093606, 2.690367, 0.372549, 0, 1, 1,
0.6136447, 0.6407455, -0.637763, 0.3803922, 0, 1, 1,
0.6152324, -1.976172, 2.269624, 0.3843137, 0, 1, 1,
0.6162311, 0.7395667, 1.430952, 0.3921569, 0, 1, 1,
0.6177665, -2.196155, 3.328122, 0.3960784, 0, 1, 1,
0.6235808, 0.5148799, 1.222614, 0.4039216, 0, 1, 1,
0.6237615, -1.936437, 2.369786, 0.4117647, 0, 1, 1,
0.6265598, 0.4848177, 1.332861, 0.4156863, 0, 1, 1,
0.6271673, 0.9876478, -1.735864, 0.4235294, 0, 1, 1,
0.6290023, 1.186476, 1.761528, 0.427451, 0, 1, 1,
0.6375549, -0.02329768, 2.440561, 0.4352941, 0, 1, 1,
0.6407134, 0.1462251, 0.4670308, 0.4392157, 0, 1, 1,
0.6473801, 3.144001, 0.6737379, 0.4470588, 0, 1, 1,
0.6493642, -0.746722, 1.669539, 0.4509804, 0, 1, 1,
0.6508197, 0.6333166, 0.5686947, 0.4588235, 0, 1, 1,
0.6510258, 0.2949523, 0.1098312, 0.4627451, 0, 1, 1,
0.6531242, 0.8749728, 1.537129, 0.4705882, 0, 1, 1,
0.6573625, -0.6393113, 2.18785, 0.4745098, 0, 1, 1,
0.6581526, -1.348888, 2.553277, 0.4823529, 0, 1, 1,
0.6603108, -1.623677, 3.947293, 0.4862745, 0, 1, 1,
0.6611871, 0.1803047, 2.014186, 0.4941176, 0, 1, 1,
0.6629366, 0.5077389, 0.4544509, 0.5019608, 0, 1, 1,
0.6645473, -0.7279453, 2.031728, 0.5058824, 0, 1, 1,
0.6645567, -0.961653, 3.261446, 0.5137255, 0, 1, 1,
0.6678237, 0.3098269, 2.920274, 0.5176471, 0, 1, 1,
0.6751789, -0.55038, 1.724227, 0.5254902, 0, 1, 1,
0.6769255, 1.137846, 1.84489, 0.5294118, 0, 1, 1,
0.6808966, 0.1488634, 0.7502599, 0.5372549, 0, 1, 1,
0.6829727, 0.4905072, 0.8337829, 0.5411765, 0, 1, 1,
0.6851285, 1.152224, -0.8149374, 0.5490196, 0, 1, 1,
0.6855929, -1.663676, 2.463078, 0.5529412, 0, 1, 1,
0.6865882, -0.1906264, 2.973434, 0.5607843, 0, 1, 1,
0.6885141, -1.268542, 4.126187, 0.5647059, 0, 1, 1,
0.6886197, 0.135955, 1.120638, 0.572549, 0, 1, 1,
0.6912972, -0.2841498, 2.1303, 0.5764706, 0, 1, 1,
0.6945422, 1.660412, -0.406062, 0.5843138, 0, 1, 1,
0.695154, -0.07876673, 0.9965068, 0.5882353, 0, 1, 1,
0.703528, 0.8147368, 3.152579, 0.5960785, 0, 1, 1,
0.7052618, -0.8270432, 3.796624, 0.6039216, 0, 1, 1,
0.7065155, 1.840599, 1.262889, 0.6078432, 0, 1, 1,
0.7084621, 1.059678, 0.289863, 0.6156863, 0, 1, 1,
0.7093571, 0.1551395, 2.694803, 0.6196079, 0, 1, 1,
0.712658, 0.6003892, 0.7726198, 0.627451, 0, 1, 1,
0.7170766, 0.5235502, 1.765843, 0.6313726, 0, 1, 1,
0.7206482, -0.4808986, 2.157328, 0.6392157, 0, 1, 1,
0.7218763, -0.1454382, 2.719211, 0.6431373, 0, 1, 1,
0.7224637, -0.356014, 2.320909, 0.6509804, 0, 1, 1,
0.725356, 0.9684551, -1.011272, 0.654902, 0, 1, 1,
0.7480653, 0.1275182, 1.338588, 0.6627451, 0, 1, 1,
0.7553167, 0.9017791, -0.3575983, 0.6666667, 0, 1, 1,
0.7622291, -0.6318709, 1.790705, 0.6745098, 0, 1, 1,
0.7646455, 1.183473, -0.109873, 0.6784314, 0, 1, 1,
0.7674288, -0.2484702, 1.588649, 0.6862745, 0, 1, 1,
0.7684558, 0.2014872, 0.9574232, 0.6901961, 0, 1, 1,
0.7688891, 0.07065412, 3.350996, 0.6980392, 0, 1, 1,
0.7752186, 0.2686699, 0.589149, 0.7058824, 0, 1, 1,
0.7798254, 0.7492521, -0.2605648, 0.7098039, 0, 1, 1,
0.7809005, 1.363771, -1.114247, 0.7176471, 0, 1, 1,
0.8063158, -2.840216, 2.039667, 0.7215686, 0, 1, 1,
0.8074275, -0.4679164, 1.709206, 0.7294118, 0, 1, 1,
0.8092299, -1.074359, 2.833876, 0.7333333, 0, 1, 1,
0.8116714, -0.6295272, 1.814707, 0.7411765, 0, 1, 1,
0.8119759, -0.2553395, 1.949513, 0.7450981, 0, 1, 1,
0.8146074, 1.566742, 1.579383, 0.7529412, 0, 1, 1,
0.8338178, -0.1433562, 2.500129, 0.7568628, 0, 1, 1,
0.8354735, -0.4925361, 3.040791, 0.7647059, 0, 1, 1,
0.8356646, 1.295855, 2.357974, 0.7686275, 0, 1, 1,
0.837324, -0.7199945, 1.423355, 0.7764706, 0, 1, 1,
0.8395379, 0.1662837, 1.778958, 0.7803922, 0, 1, 1,
0.8399817, 0.4841261, 1.274205, 0.7882353, 0, 1, 1,
0.8436601, -1.473456, 2.074862, 0.7921569, 0, 1, 1,
0.8465257, -0.05499104, 2.614108, 0.8, 0, 1, 1,
0.8526908, -0.3426718, 1.781082, 0.8078431, 0, 1, 1,
0.8568939, 1.158688, -0.3319308, 0.8117647, 0, 1, 1,
0.8571978, 0.8105229, 0.7128234, 0.8196079, 0, 1, 1,
0.8619363, -0.5501748, 2.695275, 0.8235294, 0, 1, 1,
0.875016, 0.6747015, 1.916155, 0.8313726, 0, 1, 1,
0.8753005, -0.7001438, 1.031099, 0.8352941, 0, 1, 1,
0.8760366, 0.727919, -0.5477351, 0.8431373, 0, 1, 1,
0.8814294, 0.2016535, 1.953512, 0.8470588, 0, 1, 1,
0.8887948, 0.4840506, -0.49241, 0.854902, 0, 1, 1,
0.910469, -1.101323, 2.39555, 0.8588235, 0, 1, 1,
0.9107285, -1.413219, 4.34924, 0.8666667, 0, 1, 1,
0.9154179, 0.2137227, 1.248642, 0.8705882, 0, 1, 1,
0.9191386, 1.540492, 2.8118, 0.8784314, 0, 1, 1,
0.9228824, 1.686947, 0.2106049, 0.8823529, 0, 1, 1,
0.9268187, 0.2629697, 2.372683, 0.8901961, 0, 1, 1,
0.9287468, 1.557747, 0.03246873, 0.8941177, 0, 1, 1,
0.9359089, -0.4353313, 1.425941, 0.9019608, 0, 1, 1,
0.9406703, 0.5557114, 0.4359381, 0.9098039, 0, 1, 1,
0.9411859, 1.594792, -0.4413682, 0.9137255, 0, 1, 1,
0.9434859, 1.352525, -0.08313351, 0.9215686, 0, 1, 1,
0.946465, 1.249746, 1.936834, 0.9254902, 0, 1, 1,
0.9493883, -2.412032, 2.260713, 0.9333333, 0, 1, 1,
0.9503975, 0.1164836, 2.116919, 0.9372549, 0, 1, 1,
0.9519781, -0.7887766, 0.5231134, 0.945098, 0, 1, 1,
0.9543365, 0.3696545, 1.718534, 0.9490196, 0, 1, 1,
0.964582, 1.232644, 1.024554, 0.9568627, 0, 1, 1,
0.9682664, -0.8043405, 2.487428, 0.9607843, 0, 1, 1,
0.9683935, 2.067345, 1.370142, 0.9686275, 0, 1, 1,
0.9720297, -0.1268215, 2.420436, 0.972549, 0, 1, 1,
0.9772391, -1.272791, 1.447749, 0.9803922, 0, 1, 1,
1.00105, 0.6515058, 0.1827341, 0.9843137, 0, 1, 1,
1.001572, 0.460271, -0.2552503, 0.9921569, 0, 1, 1,
1.003175, 1.24834, 1.349359, 0.9960784, 0, 1, 1,
1.006891, -0.5323197, 2.626293, 1, 0, 0.9960784, 1,
1.010046, 0.08530024, 0.5141507, 1, 0, 0.9882353, 1,
1.01315, -0.3260027, 1.015227, 1, 0, 0.9843137, 1,
1.015029, -1.103529, 2.315527, 1, 0, 0.9764706, 1,
1.015557, -0.4547994, 2.457051, 1, 0, 0.972549, 1,
1.0178, 0.3967882, 0.553577, 1, 0, 0.9647059, 1,
1.023303, 0.5485351, 2.79415, 1, 0, 0.9607843, 1,
1.025987, -0.02245978, 2.832162, 1, 0, 0.9529412, 1,
1.03095, -1.424849, 4.93743, 1, 0, 0.9490196, 1,
1.037093, -0.8519231, 2.52032, 1, 0, 0.9411765, 1,
1.043745, 0.7693692, 0.4232309, 1, 0, 0.9372549, 1,
1.05134, 0.7463455, -0.4696569, 1, 0, 0.9294118, 1,
1.056137, -1.144358, 3.420377, 1, 0, 0.9254902, 1,
1.061122, 1.409563, 0.9382994, 1, 0, 0.9176471, 1,
1.062019, -0.4507771, 3.065663, 1, 0, 0.9137255, 1,
1.062727, 0.4490065, 2.54549, 1, 0, 0.9058824, 1,
1.065939, -0.8893327, 0.4243751, 1, 0, 0.9019608, 1,
1.078126, -1.075112, 3.538829, 1, 0, 0.8941177, 1,
1.085613, -1.298815, 2.232929, 1, 0, 0.8862745, 1,
1.089718, 1.607285, -0.631766, 1, 0, 0.8823529, 1,
1.094205, 1.229625, 0.3737598, 1, 0, 0.8745098, 1,
1.103476, 0.02838581, 0.9487458, 1, 0, 0.8705882, 1,
1.108279, 0.1707376, 0.2739942, 1, 0, 0.8627451, 1,
1.113331, 0.3943617, 1.290008, 1, 0, 0.8588235, 1,
1.114379, -0.3599855, 1.96826, 1, 0, 0.8509804, 1,
1.116524, 0.5110009, 1.299388, 1, 0, 0.8470588, 1,
1.119543, -2.306264, 1.497301, 1, 0, 0.8392157, 1,
1.12785, -0.7992542, 3.692924, 1, 0, 0.8352941, 1,
1.130499, 1.387506, 1.27564, 1, 0, 0.827451, 1,
1.13536, -0.04110691, 0.9084107, 1, 0, 0.8235294, 1,
1.135458, 1.394062, 0.7886969, 1, 0, 0.8156863, 1,
1.139342, -0.563534, 1.289205, 1, 0, 0.8117647, 1,
1.147755, -0.524213, 1.54586, 1, 0, 0.8039216, 1,
1.151938, -0.735683, 2.235098, 1, 0, 0.7960784, 1,
1.155635, 1.062842, 0.8059888, 1, 0, 0.7921569, 1,
1.170165, 1.117684, -0.6838005, 1, 0, 0.7843137, 1,
1.175061, -1.391401, 2.548812, 1, 0, 0.7803922, 1,
1.175167, -1.477529, 3.089466, 1, 0, 0.772549, 1,
1.183049, 0.8165312, 0.5787162, 1, 0, 0.7686275, 1,
1.187568, -0.9599589, 3.029908, 1, 0, 0.7607843, 1,
1.190631, -1.945416, 1.744673, 1, 0, 0.7568628, 1,
1.196158, 1.037481, 0.6626897, 1, 0, 0.7490196, 1,
1.201257, -2.093853, 2.945895, 1, 0, 0.7450981, 1,
1.209573, -0.7996621, 1.499904, 1, 0, 0.7372549, 1,
1.20986, -0.2149088, 2.608011, 1, 0, 0.7333333, 1,
1.214188, 1.647566, 1.706042, 1, 0, 0.7254902, 1,
1.217018, -0.9203489, 0.9877718, 1, 0, 0.7215686, 1,
1.224717, 1.247441, 1.083107, 1, 0, 0.7137255, 1,
1.226116, -0.5749911, 0.9911346, 1, 0, 0.7098039, 1,
1.227729, -0.7276004, 2.331186, 1, 0, 0.7019608, 1,
1.231384, -0.8864852, 1.550554, 1, 0, 0.6941177, 1,
1.237975, -0.8287032, 1.822348, 1, 0, 0.6901961, 1,
1.244492, -0.1989523, 2.939698, 1, 0, 0.682353, 1,
1.251813, 0.8855922, -0.8824875, 1, 0, 0.6784314, 1,
1.252296, -0.04103184, 1.776897, 1, 0, 0.6705883, 1,
1.257698, 0.5629426, 1.921264, 1, 0, 0.6666667, 1,
1.259428, -1.486437, 2.184962, 1, 0, 0.6588235, 1,
1.264994, -2.648059, 1.281514, 1, 0, 0.654902, 1,
1.26561, 0.2350063, 2.220492, 1, 0, 0.6470588, 1,
1.266346, 1.289256, 0.762073, 1, 0, 0.6431373, 1,
1.300372, 1.314066, 1.707786, 1, 0, 0.6352941, 1,
1.300774, 0.9949523, 2.653685, 1, 0, 0.6313726, 1,
1.30562, -1.850195, 0.9010158, 1, 0, 0.6235294, 1,
1.30662, -1.247724, 1.016601, 1, 0, 0.6196079, 1,
1.309366, -1.03338, 2.004962, 1, 0, 0.6117647, 1,
1.30966, -1.03988, 2.421595, 1, 0, 0.6078432, 1,
1.316848, -0.9925996, 3.90217, 1, 0, 0.6, 1,
1.332592, 1.127335, 1.042371, 1, 0, 0.5921569, 1,
1.33326, -0.1537962, 2.286896, 1, 0, 0.5882353, 1,
1.33432, 0.8607622, -0.594119, 1, 0, 0.5803922, 1,
1.341309, 0.5290483, 0.7389439, 1, 0, 0.5764706, 1,
1.34137, 0.4287506, 2.192168, 1, 0, 0.5686275, 1,
1.341717, -0.4582295, 2.26987, 1, 0, 0.5647059, 1,
1.350747, -0.5512292, 2.287164, 1, 0, 0.5568628, 1,
1.357746, -0.5892044, 1.185889, 1, 0, 0.5529412, 1,
1.386027, 0.02221439, 0.6376146, 1, 0, 0.5450981, 1,
1.391098, -0.4105047, -0.1088651, 1, 0, 0.5411765, 1,
1.391998, 0.1820113, 2.914498, 1, 0, 0.5333334, 1,
1.395066, 0.7212071, 1.778742, 1, 0, 0.5294118, 1,
1.400702, -0.4178903, 1.299034, 1, 0, 0.5215687, 1,
1.401339, -1.372398, 3.434804, 1, 0, 0.5176471, 1,
1.404134, 0.02766578, 1.32112, 1, 0, 0.509804, 1,
1.406576, 2.518817, 2.273106, 1, 0, 0.5058824, 1,
1.415756, -1.402031, 0.5834836, 1, 0, 0.4980392, 1,
1.417254, 0.03003117, 2.321638, 1, 0, 0.4901961, 1,
1.419325, 0.4837964, 1.173578, 1, 0, 0.4862745, 1,
1.421303, 1.716558, 1.370504, 1, 0, 0.4784314, 1,
1.426761, -1.798828, 2.355641, 1, 0, 0.4745098, 1,
1.426804, -0.1724213, 0.1052098, 1, 0, 0.4666667, 1,
1.433143, -0.6856086, 0.972582, 1, 0, 0.4627451, 1,
1.443493, 0.2481857, 1.136486, 1, 0, 0.454902, 1,
1.444052, 0.6416375, 1.024151, 1, 0, 0.4509804, 1,
1.444762, -0.6912406, 2.697293, 1, 0, 0.4431373, 1,
1.450276, -0.4664841, 0.9698988, 1, 0, 0.4392157, 1,
1.451769, 0.618207, 3.141305, 1, 0, 0.4313726, 1,
1.463957, 1.104624, -0.01282693, 1, 0, 0.427451, 1,
1.483374, -1.099477, 2.947829, 1, 0, 0.4196078, 1,
1.504399, 1.066561, 1.741531, 1, 0, 0.4156863, 1,
1.521696, 1.695136, -0.623057, 1, 0, 0.4078431, 1,
1.53708, 0.4733621, 1.100372, 1, 0, 0.4039216, 1,
1.53929, 0.02428223, 1.812995, 1, 0, 0.3960784, 1,
1.55662, -0.5968294, 0.6061851, 1, 0, 0.3882353, 1,
1.558192, 0.5393794, 0.4324793, 1, 0, 0.3843137, 1,
1.574745, -1.327651, 2.186392, 1, 0, 0.3764706, 1,
1.585166, 1.456178, 0.003609673, 1, 0, 0.372549, 1,
1.586971, 0.1728607, 0.9335235, 1, 0, 0.3647059, 1,
1.587072, 0.4448282, 0.7298127, 1, 0, 0.3607843, 1,
1.588091, -1.192905, 2.370888, 1, 0, 0.3529412, 1,
1.590328, 0.9307356, 1.952623, 1, 0, 0.3490196, 1,
1.612932, -0.2295576, 1.052064, 1, 0, 0.3411765, 1,
1.625956, 1.208171, 1.266227, 1, 0, 0.3372549, 1,
1.640045, -0.5508727, 2.829196, 1, 0, 0.3294118, 1,
1.645527, 1.519264, 1.224267, 1, 0, 0.3254902, 1,
1.647643, -1.01179, 2.643135, 1, 0, 0.3176471, 1,
1.649714, -0.3220261, 1.595623, 1, 0, 0.3137255, 1,
1.652013, -0.4255291, 4.882208, 1, 0, 0.3058824, 1,
1.663774, -0.2176373, 4.024646, 1, 0, 0.2980392, 1,
1.664108, -2.31982, 3.085489, 1, 0, 0.2941177, 1,
1.664936, -1.018681, 2.577014, 1, 0, 0.2862745, 1,
1.676768, 1.478562, -0.5364863, 1, 0, 0.282353, 1,
1.678658, -2.296081, 3.338106, 1, 0, 0.2745098, 1,
1.690739, -0.7017235, 1.504713, 1, 0, 0.2705882, 1,
1.698509, 1.102193, 0.2756624, 1, 0, 0.2627451, 1,
1.74323, -1.425049, 2.311082, 1, 0, 0.2588235, 1,
1.76677, 0.8877273, 2.015974, 1, 0, 0.2509804, 1,
1.800584, 1.23533, 2.051474, 1, 0, 0.2470588, 1,
1.810752, 0.005994042, 1.559338, 1, 0, 0.2392157, 1,
1.813662, -1.195899, 4.224618, 1, 0, 0.2352941, 1,
1.817804, 0.2429044, 0.7599662, 1, 0, 0.227451, 1,
1.829427, 1.376768, 2.150594, 1, 0, 0.2235294, 1,
1.834566, 0.4078532, 2.266602, 1, 0, 0.2156863, 1,
1.863821, 0.814179, 2.423274, 1, 0, 0.2117647, 1,
1.87074, 1.168751, 1.33702, 1, 0, 0.2039216, 1,
1.873859, 1.21116, 1.918288, 1, 0, 0.1960784, 1,
1.902838, 1.015858, 1.527095, 1, 0, 0.1921569, 1,
1.96348, 1.035217, 0.9389026, 1, 0, 0.1843137, 1,
1.992401, 0.4886016, 3.424818, 1, 0, 0.1803922, 1,
2.066724, -0.09703736, 2.572286, 1, 0, 0.172549, 1,
2.078773, -0.1882454, 1.437626, 1, 0, 0.1686275, 1,
2.083259, -0.8685311, 1.190277, 1, 0, 0.1607843, 1,
2.08938, 0.9995091, 2.070937, 1, 0, 0.1568628, 1,
2.127643, 0.2371022, 1.435457, 1, 0, 0.1490196, 1,
2.129301, -0.7622731, 3.754704, 1, 0, 0.145098, 1,
2.158503, 0.6396068, 2.026814, 1, 0, 0.1372549, 1,
2.161113, 0.241461, 0.2207752, 1, 0, 0.1333333, 1,
2.183176, 0.07831751, 3.701435, 1, 0, 0.1254902, 1,
2.1978, -1.10362, 0.3983778, 1, 0, 0.1215686, 1,
2.201414, 0.05255523, 1.899784, 1, 0, 0.1137255, 1,
2.203057, 0.8768763, -0.3315591, 1, 0, 0.1098039, 1,
2.204592, 0.80928, 0.9771013, 1, 0, 0.1019608, 1,
2.22913, 0.5514526, 0.3976511, 1, 0, 0.09411765, 1,
2.25338, 0.1395786, 2.77748, 1, 0, 0.09019608, 1,
2.283879, -1.076817, 0.6509916, 1, 0, 0.08235294, 1,
2.361109, -0.5493419, 2.201566, 1, 0, 0.07843138, 1,
2.401942, -0.5081747, 1.000329, 1, 0, 0.07058824, 1,
2.425848, -0.5891572, 1.678131, 1, 0, 0.06666667, 1,
2.458258, -2.090965, 2.201866, 1, 0, 0.05882353, 1,
2.485934, -0.5843826, 2.643086, 1, 0, 0.05490196, 1,
2.524527, 0.8834341, 0.4775527, 1, 0, 0.04705882, 1,
2.542912, 0.06706334, 1.156877, 1, 0, 0.04313726, 1,
2.614714, -0.3109155, 2.863947, 1, 0, 0.03529412, 1,
2.63752, -0.8659, 1.835864, 1, 0, 0.03137255, 1,
2.958507, 1.019174, 3.620974, 1, 0, 0.02352941, 1,
2.973183, -1.473958, 2.341973, 1, 0, 0.01960784, 1,
3.519184, 0.9318871, 2.116481, 1, 0, 0.01176471, 1,
3.701276, -0.651567, 1.679858, 1, 0, 0.007843138, 1
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
0.1470907, -3.915277, -7.919548, 0, -0.5, 0.5, 0.5,
0.1470907, -3.915277, -7.919548, 1, -0.5, 0.5, 0.5,
0.1470907, -3.915277, -7.919548, 1, 1.5, 0.5, 0.5,
0.1470907, -3.915277, -7.919548, 0, 1.5, 0.5, 0.5
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
-4.611963, 0.1259255, -7.919548, 0, -0.5, 0.5, 0.5,
-4.611963, 0.1259255, -7.919548, 1, -0.5, 0.5, 0.5,
-4.611963, 0.1259255, -7.919548, 1, 1.5, 0.5, 0.5,
-4.611963, 0.1259255, -7.919548, 0, 1.5, 0.5, 0.5
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
-4.611963, -3.915277, -0.5338266, 0, -0.5, 0.5, 0.5,
-4.611963, -3.915277, -0.5338266, 1, -0.5, 0.5, 0.5,
-4.611963, -3.915277, -0.5338266, 1, 1.5, 0.5, 0.5,
-4.611963, -3.915277, -0.5338266, 0, 1.5, 0.5, 0.5
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
-2, -2.982692, -6.215151,
2, -2.982692, -6.215151,
-2, -2.982692, -6.215151,
-2, -3.138123, -6.499217,
0, -2.982692, -6.215151,
0, -3.138123, -6.499217,
2, -2.982692, -6.215151,
2, -3.138123, -6.499217
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
-2, -3.448985, -7.067349, 0, -0.5, 0.5, 0.5,
-2, -3.448985, -7.067349, 1, -0.5, 0.5, 0.5,
-2, -3.448985, -7.067349, 1, 1.5, 0.5, 0.5,
-2, -3.448985, -7.067349, 0, 1.5, 0.5, 0.5,
0, -3.448985, -7.067349, 0, -0.5, 0.5, 0.5,
0, -3.448985, -7.067349, 1, -0.5, 0.5, 0.5,
0, -3.448985, -7.067349, 1, 1.5, 0.5, 0.5,
0, -3.448985, -7.067349, 0, 1.5, 0.5, 0.5,
2, -3.448985, -7.067349, 0, -0.5, 0.5, 0.5,
2, -3.448985, -7.067349, 1, -0.5, 0.5, 0.5,
2, -3.448985, -7.067349, 1, 1.5, 0.5, 0.5,
2, -3.448985, -7.067349, 0, 1.5, 0.5, 0.5
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
-3.51372, -2, -6.215151,
-3.51372, 3, -6.215151,
-3.51372, -2, -6.215151,
-3.696761, -2, -6.499217,
-3.51372, -1, -6.215151,
-3.696761, -1, -6.499217,
-3.51372, 0, -6.215151,
-3.696761, 0, -6.499217,
-3.51372, 1, -6.215151,
-3.696761, 1, -6.499217,
-3.51372, 2, -6.215151,
-3.696761, 2, -6.499217,
-3.51372, 3, -6.215151,
-3.696761, 3, -6.499217
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
-4.062841, -2, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, -2, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, -2, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, -2, -7.067349, 0, 1.5, 0.5, 0.5,
-4.062841, -1, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, -1, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, -1, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, -1, -7.067349, 0, 1.5, 0.5, 0.5,
-4.062841, 0, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, 0, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, 0, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, 0, -7.067349, 0, 1.5, 0.5, 0.5,
-4.062841, 1, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, 1, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, 1, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, 1, -7.067349, 0, 1.5, 0.5, 0.5,
-4.062841, 2, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, 2, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, 2, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, 2, -7.067349, 0, 1.5, 0.5, 0.5,
-4.062841, 3, -7.067349, 0, -0.5, 0.5, 0.5,
-4.062841, 3, -7.067349, 1, -0.5, 0.5, 0.5,
-4.062841, 3, -7.067349, 1, 1.5, 0.5, 0.5,
-4.062841, 3, -7.067349, 0, 1.5, 0.5, 0.5
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
-3.51372, -2.982692, -6,
-3.51372, -2.982692, 4,
-3.51372, -2.982692, -6,
-3.696761, -3.138123, -6,
-3.51372, -2.982692, -4,
-3.696761, -3.138123, -4,
-3.51372, -2.982692, -2,
-3.696761, -3.138123, -2,
-3.51372, -2.982692, 0,
-3.696761, -3.138123, 0,
-3.51372, -2.982692, 2,
-3.696761, -3.138123, 2,
-3.51372, -2.982692, 4,
-3.696761, -3.138123, 4
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
"-6",
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
-4.062841, -3.448985, -6, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -6, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -6, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, -6, 0, 1.5, 0.5, 0.5,
-4.062841, -3.448985, -4, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -4, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -4, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, -4, 0, 1.5, 0.5, 0.5,
-4.062841, -3.448985, -2, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -2, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, -2, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, -2, 0, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 0, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 0, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 0, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 0, 0, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 2, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 2, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 2, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 2, 0, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 4, 0, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 4, 1, -0.5, 0.5, 0.5,
-4.062841, -3.448985, 4, 1, 1.5, 0.5, 0.5,
-4.062841, -3.448985, 4, 0, 1.5, 0.5, 0.5
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
-3.51372, -2.982692, -6.215151,
-3.51372, 3.234543, -6.215151,
-3.51372, -2.982692, 5.147498,
-3.51372, 3.234543, 5.147498,
-3.51372, -2.982692, -6.215151,
-3.51372, -2.982692, 5.147498,
-3.51372, 3.234543, -6.215151,
-3.51372, 3.234543, 5.147498,
-3.51372, -2.982692, -6.215151,
3.807901, -2.982692, -6.215151,
-3.51372, -2.982692, 5.147498,
3.807901, -2.982692, 5.147498,
-3.51372, 3.234543, -6.215151,
3.807901, 3.234543, -6.215151,
-3.51372, 3.234543, 5.147498,
3.807901, 3.234543, 5.147498,
3.807901, -2.982692, -6.215151,
3.807901, 3.234543, -6.215151,
3.807901, -2.982692, 5.147498,
3.807901, 3.234543, 5.147498,
3.807901, -2.982692, -6.215151,
3.807901, -2.982692, 5.147498,
3.807901, 3.234543, -6.215151,
3.807901, 3.234543, 5.147498
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
var radius = 7.944833;
var distance = 35.34746;
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
mvMatrix.translate( -0.1470907, -0.1259255, 0.5338266 );
mvMatrix.scale( 1.173252, 1.381661, 0.7559953 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34746);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Stam<-read.table("Stam.xyz")
```

```
## Error in read.table("Stam.xyz"): no lines available in input
```

```r
x<-Stam$V2
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
```

```r
y<-Stam$V3
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
```

```r
z<-Stam$V4
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
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
-3.407094, -0.3775012, -2.434688, 0, 0, 1, 1, 1,
-3.127765, -1.040609, -1.925603, 1, 0, 0, 1, 1,
-2.601889, 0.9102181, -0.9362987, 1, 0, 0, 1, 1,
-2.592472, -0.6480186, -2.290027, 1, 0, 0, 1, 1,
-2.565262, -2.059254, -3.644202, 1, 0, 0, 1, 1,
-2.510345, -0.3671905, -1.453455, 1, 0, 0, 1, 1,
-2.500417, 0.2123719, -0.5685369, 0, 0, 0, 1, 1,
-2.486521, 0.6835643, -1.299561, 0, 0, 0, 1, 1,
-2.479646, 0.09670249, -2.517809, 0, 0, 0, 1, 1,
-2.415145, 1.101642, -0.04166645, 0, 0, 0, 1, 1,
-2.390376, -2.042872, -3.329601, 0, 0, 0, 1, 1,
-2.385853, 0.9859165, -2.439682, 0, 0, 0, 1, 1,
-2.322594, -1.06013, 0.3595088, 0, 0, 0, 1, 1,
-2.306653, 0.1597405, -0.8494445, 1, 1, 1, 1, 1,
-2.145963, -1.313021, -2.387276, 1, 1, 1, 1, 1,
-2.075182, -1.556507, -1.823686, 1, 1, 1, 1, 1,
-2.053591, 0.4276635, 0.6374028, 1, 1, 1, 1, 1,
-2.023425, 1.439453, -0.4460013, 1, 1, 1, 1, 1,
-2.022437, -1.232998, -3.344846, 1, 1, 1, 1, 1,
-2.011881, 0.8642078, -0.104222, 1, 1, 1, 1, 1,
-1.998417, -0.7776825, -1.588105, 1, 1, 1, 1, 1,
-1.979733, -0.06307621, -0.01405267, 1, 1, 1, 1, 1,
-1.967884, 0.1426758, -2.353018, 1, 1, 1, 1, 1,
-1.954032, -0.6389227, -0.1525559, 1, 1, 1, 1, 1,
-1.936982, -0.2458331, -1.57261, 1, 1, 1, 1, 1,
-1.922177, 0.8704517, -0.9034604, 1, 1, 1, 1, 1,
-1.89474, 1.327124, -0.5537285, 1, 1, 1, 1, 1,
-1.86424, 0.493575, -3.755621, 1, 1, 1, 1, 1,
-1.863454, -0.7436509, -2.540517, 0, 0, 1, 1, 1,
-1.848623, -0.6943722, -1.014418, 1, 0, 0, 1, 1,
-1.842158, -0.06888348, -0.9704949, 1, 0, 0, 1, 1,
-1.832368, 1.378523, -0.220137, 1, 0, 0, 1, 1,
-1.831397, -0.5275871, -0.8638396, 1, 0, 0, 1, 1,
-1.825542, -1.011327, -1.584953, 1, 0, 0, 1, 1,
-1.817193, -0.4838134, -2.143001, 0, 0, 0, 1, 1,
-1.803693, 0.243757, -0.8193432, 0, 0, 0, 1, 1,
-1.799824, 1.064705, 0.1851579, 0, 0, 0, 1, 1,
-1.777135, -0.6646579, -2.507608, 0, 0, 0, 1, 1,
-1.773964, -0.5579183, 0.4531242, 0, 0, 0, 1, 1,
-1.760335, -1.358363, -1.915757, 0, 0, 0, 1, 1,
-1.752198, 0.9039645, -1.760736, 0, 0, 0, 1, 1,
-1.750264, 0.1505942, -1.729917, 1, 1, 1, 1, 1,
-1.749154, 1.433108, -1.13945, 1, 1, 1, 1, 1,
-1.749005, 0.3990998, -0.6628466, 1, 1, 1, 1, 1,
-1.747166, 0.7378473, -1.62739, 1, 1, 1, 1, 1,
-1.723514, -0.3608648, -1.379673, 1, 1, 1, 1, 1,
-1.719899, 0.9091302, -2.634469, 1, 1, 1, 1, 1,
-1.718547, 1.073566, -1.35779, 1, 1, 1, 1, 1,
-1.718402, 0.1093943, -2.842177, 1, 1, 1, 1, 1,
-1.697043, 3.00196, -0.08554307, 1, 1, 1, 1, 1,
-1.651416, -0.2327813, -2.339107, 1, 1, 1, 1, 1,
-1.646288, 0.2356812, -2.431059, 1, 1, 1, 1, 1,
-1.633629, -0.3543617, -0.9495327, 1, 1, 1, 1, 1,
-1.620517, 0.03933415, -2.474306, 1, 1, 1, 1, 1,
-1.612642, 0.8995008, -1.490197, 1, 1, 1, 1, 1,
-1.585093, -0.1617657, -0.2361646, 1, 1, 1, 1, 1,
-1.576156, -0.1845944, -1.776283, 0, 0, 1, 1, 1,
-1.57228, 0.5310192, -0.4270981, 1, 0, 0, 1, 1,
-1.568488, -0.07688784, -2.489379, 1, 0, 0, 1, 1,
-1.568484, -0.2352619, -0.562773, 1, 0, 0, 1, 1,
-1.564409, -0.534725, -0.8382055, 1, 0, 0, 1, 1,
-1.56397, -1.098323, -0.3841002, 1, 0, 0, 1, 1,
-1.545872, 0.7733528, -2.55256, 0, 0, 0, 1, 1,
-1.545461, -1.3527, -2.739296, 0, 0, 0, 1, 1,
-1.518441, 0.2301442, -1.905406, 0, 0, 0, 1, 1,
-1.511816, 1.586521, -0.9962348, 0, 0, 0, 1, 1,
-1.506378, -0.7841291, -2.098512, 0, 0, 0, 1, 1,
-1.502695, -0.1615877, -0.01347088, 0, 0, 0, 1, 1,
-1.500701, 0.9483137, -2.003867, 0, 0, 0, 1, 1,
-1.497714, -0.4775473, -3.573449, 1, 1, 1, 1, 1,
-1.477798, -0.9635971, -0.2587099, 1, 1, 1, 1, 1,
-1.474429, -1.944418, -2.384136, 1, 1, 1, 1, 1,
-1.473767, -0.4084006, -0.5700061, 1, 1, 1, 1, 1,
-1.45708, -0.8951252, -2.779451, 1, 1, 1, 1, 1,
-1.455203, -0.4834525, -1.447349, 1, 1, 1, 1, 1,
-1.454366, -0.8080681, -2.95875, 1, 1, 1, 1, 1,
-1.448274, -1.266252, -2.347678, 1, 1, 1, 1, 1,
-1.447114, -0.386725, -1.467616, 1, 1, 1, 1, 1,
-1.442024, -0.4571522, 0.02142227, 1, 1, 1, 1, 1,
-1.440878, 0.4052445, -0.8422813, 1, 1, 1, 1, 1,
-1.433567, 0.7232731, -1.792745, 1, 1, 1, 1, 1,
-1.433083, 0.2688477, -3.740532, 1, 1, 1, 1, 1,
-1.428462, 0.2702272, -1.315854, 1, 1, 1, 1, 1,
-1.424977, 1.864197, 0.332181, 1, 1, 1, 1, 1,
-1.419233, -1.353382, -1.377547, 0, 0, 1, 1, 1,
-1.415177, -1.427241, -2.383627, 1, 0, 0, 1, 1,
-1.403473, -0.511108, -3.180958, 1, 0, 0, 1, 1,
-1.396817, 0.3633863, -2.517546, 1, 0, 0, 1, 1,
-1.395765, -0.9177142, -3.465794, 1, 0, 0, 1, 1,
-1.386411, -0.7836036, -1.678684, 1, 0, 0, 1, 1,
-1.378306, -1.021504, -2.318732, 0, 0, 0, 1, 1,
-1.362596, 0.09480797, -1.608413, 0, 0, 0, 1, 1,
-1.360589, 0.4302211, -1.003602, 0, 0, 0, 1, 1,
-1.357528, -2.89215, -3.152145, 0, 0, 0, 1, 1,
-1.355229, 1.317228, -1.121417, 0, 0, 0, 1, 1,
-1.350682, 1.991502, 0.8244179, 0, 0, 0, 1, 1,
-1.343588, 1.37824, -0.5708136, 0, 0, 0, 1, 1,
-1.313233, -2.218215, -2.595355, 1, 1, 1, 1, 1,
-1.312959, 1.035679, -0.6119882, 1, 1, 1, 1, 1,
-1.300644, -1.034086, -3.453556, 1, 1, 1, 1, 1,
-1.29873, 0.3003227, -1.616686, 1, 1, 1, 1, 1,
-1.289032, 0.0748398, -1.869925, 1, 1, 1, 1, 1,
-1.277289, -2.414002, -5.564851, 1, 1, 1, 1, 1,
-1.276801, -1.227466, -2.689045, 1, 1, 1, 1, 1,
-1.274642, -0.7011199, -1.774705, 1, 1, 1, 1, 1,
-1.269227, 0.3204089, -2.93536, 1, 1, 1, 1, 1,
-1.266854, 0.8856146, -2.570355, 1, 1, 1, 1, 1,
-1.264882, 0.08844272, -2.467879, 1, 1, 1, 1, 1,
-1.260534, 1.421552, -0.469144, 1, 1, 1, 1, 1,
-1.256394, -1.92386, -4.023499, 1, 1, 1, 1, 1,
-1.254601, 0.1258945, -2.876465, 1, 1, 1, 1, 1,
-1.254541, 1.171429, 0.4266637, 1, 1, 1, 1, 1,
-1.253774, 0.3182226, -1.69333, 0, 0, 1, 1, 1,
-1.25135, -0.1486129, -1.967363, 1, 0, 0, 1, 1,
-1.239538, -0.5601459, -1.665549, 1, 0, 0, 1, 1,
-1.238042, 0.274481, -2.879153, 1, 0, 0, 1, 1,
-1.23507, -0.2567194, -1.037349, 1, 0, 0, 1, 1,
-1.228383, -0.638992, -2.190763, 1, 0, 0, 1, 1,
-1.226836, -2.616778, -3.474886, 0, 0, 0, 1, 1,
-1.215044, 1.110131, -1.773724, 0, 0, 0, 1, 1,
-1.210374, -0.1838017, -2.679075, 0, 0, 0, 1, 1,
-1.200599, 1.745638, -0.5362192, 0, 0, 0, 1, 1,
-1.198685, -0.06815017, -2.990735, 0, 0, 0, 1, 1,
-1.190284, 0.3502223, 0.2015028, 0, 0, 0, 1, 1,
-1.187652, -0.5444321, -1.843916, 0, 0, 0, 1, 1,
-1.184903, 1.985698, -0.566049, 1, 1, 1, 1, 1,
-1.177547, 0.2687797, -2.360699, 1, 1, 1, 1, 1,
-1.169565, 0.2507506, -2.964303, 1, 1, 1, 1, 1,
-1.168797, 0.4751582, -0.9993523, 1, 1, 1, 1, 1,
-1.156059, 2.692052, 1.322694, 1, 1, 1, 1, 1,
-1.155389, -1.986893, -2.042532, 1, 1, 1, 1, 1,
-1.154256, 0.717204, -0.9217529, 1, 1, 1, 1, 1,
-1.152337, -0.05218777, -1.813688, 1, 1, 1, 1, 1,
-1.148745, -0.3300896, -1.286713, 1, 1, 1, 1, 1,
-1.148295, 0.5144482, -3.086541, 1, 1, 1, 1, 1,
-1.143326, -1.944283, -1.793996, 1, 1, 1, 1, 1,
-1.133893, -0.2989141, -0.7921486, 1, 1, 1, 1, 1,
-1.124245, 0.3836744, -0.3136906, 1, 1, 1, 1, 1,
-1.11244, 0.4371762, 0.518707, 1, 1, 1, 1, 1,
-1.103176, -0.2446425, -0.9279849, 1, 1, 1, 1, 1,
-1.100452, 0.840693, -1.500115, 0, 0, 1, 1, 1,
-1.094034, -0.4736234, -2.611299, 1, 0, 0, 1, 1,
-1.079568, 0.2939978, -1.205693, 1, 0, 0, 1, 1,
-1.07719, 0.3391063, -1.443744, 1, 0, 0, 1, 1,
-1.070961, 2.008394, -1.130998, 1, 0, 0, 1, 1,
-1.063461, 0.9225693, -2.305956, 1, 0, 0, 1, 1,
-1.050037, -1.304366, -3.815886, 0, 0, 0, 1, 1,
-1.044294, -0.7103141, -2.654735, 0, 0, 0, 1, 1,
-1.042937, -0.5811983, -2.239527, 0, 0, 0, 1, 1,
-1.042136, -1.404987, -2.991326, 0, 0, 0, 1, 1,
-1.037337, -1.135061, -3.19488, 0, 0, 0, 1, 1,
-1.032962, -1.669977, -2.948932, 0, 0, 0, 1, 1,
-1.026807, -0.02351019, -3.503114, 0, 0, 0, 1, 1,
-1.024985, 0.06949174, -1.333322, 1, 1, 1, 1, 1,
-1.021922, -1.240913, -2.054709, 1, 1, 1, 1, 1,
-1.015719, 2.398206, 1.153245, 1, 1, 1, 1, 1,
-1.010018, -0.7365111, -2.914149, 1, 1, 1, 1, 1,
-1.009742, 1.870147, -2.070717, 1, 1, 1, 1, 1,
-1.001646, 0.2586676, -1.565808, 1, 1, 1, 1, 1,
-0.9931421, 0.3928394, -1.880382, 1, 1, 1, 1, 1,
-0.9823199, -0.3316388, -2.293111, 1, 1, 1, 1, 1,
-0.9812607, -0.2002782, -0.1424513, 1, 1, 1, 1, 1,
-0.9739271, -0.2778331, -2.617844, 1, 1, 1, 1, 1,
-0.9639747, -1.779805, -3.528255, 1, 1, 1, 1, 1,
-0.9627284, 0.8872905, -1.764177, 1, 1, 1, 1, 1,
-0.9540246, 0.2659111, -1.846436, 1, 1, 1, 1, 1,
-0.9535754, 1.379172, -0.7958968, 1, 1, 1, 1, 1,
-0.9529424, 0.07355042, -0.5150766, 1, 1, 1, 1, 1,
-0.9521312, -0.04746526, -1.521283, 0, 0, 1, 1, 1,
-0.9362686, -0.2190683, -2.182432, 1, 0, 0, 1, 1,
-0.9356507, 1.208771, 1.17924, 1, 0, 0, 1, 1,
-0.9328083, 0.2954277, -1.333793, 1, 0, 0, 1, 1,
-0.9284616, 0.6695825, 0.1573019, 1, 0, 0, 1, 1,
-0.9093896, 1.305437, 0.1967718, 1, 0, 0, 1, 1,
-0.9093654, 0.6886624, -2.019435, 0, 0, 0, 1, 1,
-0.9081376, -1.151126, -1.955805, 0, 0, 0, 1, 1,
-0.9052125, 1.751036, -0.3568008, 0, 0, 0, 1, 1,
-0.8883915, 1.401414, -1.842607, 0, 0, 0, 1, 1,
-0.8874584, 0.3107972, -0.4572471, 0, 0, 0, 1, 1,
-0.8874081, -0.8435782, -0.5097246, 0, 0, 0, 1, 1,
-0.8792017, 1.005232, -0.04083215, 0, 0, 0, 1, 1,
-0.8777481, -1.484681, -2.235025, 1, 1, 1, 1, 1,
-0.8702779, 0.1695057, -3.09685, 1, 1, 1, 1, 1,
-0.8692032, 1.069431, -0.1976998, 1, 1, 1, 1, 1,
-0.8659239, -1.448846, -2.135607, 1, 1, 1, 1, 1,
-0.8658596, -1.738519, -2.043476, 1, 1, 1, 1, 1,
-0.8627211, 1.734116, -0.3937927, 1, 1, 1, 1, 1,
-0.8574749, 0.1544946, -3.461734, 1, 1, 1, 1, 1,
-0.8548865, 1.308594, 1.221576, 1, 1, 1, 1, 1,
-0.8530638, -0.1734983, -1.709083, 1, 1, 1, 1, 1,
-0.8514332, 1.883117, 1.799142, 1, 1, 1, 1, 1,
-0.8512471, 0.5329722, -0.4654324, 1, 1, 1, 1, 1,
-0.8459722, -1.373623, -4.008098, 1, 1, 1, 1, 1,
-0.8457867, -0.1810015, -0.5820885, 1, 1, 1, 1, 1,
-0.8441889, 1.067473, -0.76056, 1, 1, 1, 1, 1,
-0.8391163, -0.1932682, -3.275748, 1, 1, 1, 1, 1,
-0.8391042, 0.263427, -2.665706, 0, 0, 1, 1, 1,
-0.8390458, 0.08480813, -0.9155256, 1, 0, 0, 1, 1,
-0.8347884, -1.04187, -2.306192, 1, 0, 0, 1, 1,
-0.8328124, 1.091722, 0.8139114, 1, 0, 0, 1, 1,
-0.8249919, 0.3577046, -0.7206668, 1, 0, 0, 1, 1,
-0.8240347, 3.054732, -1.242137, 1, 0, 0, 1, 1,
-0.8146866, -1.23861, -3.207551, 0, 0, 0, 1, 1,
-0.8133565, -1.329641, -1.517062, 0, 0, 0, 1, 1,
-0.8118555, 1.025294, -1.492977, 0, 0, 0, 1, 1,
-0.811745, -0.2790743, -2.408676, 0, 0, 0, 1, 1,
-0.8116896, -1.373402, -1.171317, 0, 0, 0, 1, 1,
-0.8073607, 0.1745545, -0.7373171, 0, 0, 0, 1, 1,
-0.8066053, 0.344514, -0.6435418, 0, 0, 0, 1, 1,
-0.7977569, 1.584685, -1.771078, 1, 1, 1, 1, 1,
-0.7970547, -0.06523187, -1.204461, 1, 1, 1, 1, 1,
-0.7938712, 0.6107516, -0.7452422, 1, 1, 1, 1, 1,
-0.7916108, 0.5572835, 0.06575049, 1, 1, 1, 1, 1,
-0.7916012, 0.2732153, -0.3527267, 1, 1, 1, 1, 1,
-0.7884486, -0.5457701, -1.799815, 1, 1, 1, 1, 1,
-0.7829973, -0.5576625, -2.816712, 1, 1, 1, 1, 1,
-0.7766713, 0.8411174, -0.7607754, 1, 1, 1, 1, 1,
-0.7758326, 0.6498258, -1.991331, 1, 1, 1, 1, 1,
-0.773409, -0.4373708, -1.761306, 1, 1, 1, 1, 1,
-0.7635863, 0.6555272, 0.1476597, 1, 1, 1, 1, 1,
-0.7602582, -1.358471, -2.748687, 1, 1, 1, 1, 1,
-0.7579833, 0.06092377, -0.9164438, 1, 1, 1, 1, 1,
-0.7485334, 0.567776, -2.684156, 1, 1, 1, 1, 1,
-0.7447149, -0.9368627, -2.666295, 1, 1, 1, 1, 1,
-0.7425164, 0.06414615, -1.774, 0, 0, 1, 1, 1,
-0.7416099, -0.2891488, -3.380489, 1, 0, 0, 1, 1,
-0.7377706, -0.09187878, -0.7605911, 1, 0, 0, 1, 1,
-0.7309119, -0.5574049, -0.8746699, 1, 0, 0, 1, 1,
-0.7288285, 2.196517, -0.4943145, 1, 0, 0, 1, 1,
-0.7272187, 0.03977487, -1.044203, 1, 0, 0, 1, 1,
-0.7259237, 1.110639, -0.3020428, 0, 0, 0, 1, 1,
-0.725371, -0.3657102, -2.627573, 0, 0, 0, 1, 1,
-0.7196514, 0.7166654, -0.7085671, 0, 0, 0, 1, 1,
-0.7194591, 1.151565, 0.2915596, 0, 0, 0, 1, 1,
-0.7146304, 0.9800134, -0.9082776, 0, 0, 0, 1, 1,
-0.710848, 0.662879, -0.07672483, 0, 0, 0, 1, 1,
-0.7061586, 0.7561672, -1.537266, 0, 0, 0, 1, 1,
-0.7039238, -1.106952, -2.332102, 1, 1, 1, 1, 1,
-0.7033787, 1.264385, -1.176356, 1, 1, 1, 1, 1,
-0.700788, -0.8758078, -3.863559, 1, 1, 1, 1, 1,
-0.6992097, -1.547566, -3.510463, 1, 1, 1, 1, 1,
-0.6897439, 0.6657466, -0.7385491, 1, 1, 1, 1, 1,
-0.6781026, -0.05361808, -3.103813, 1, 1, 1, 1, 1,
-0.6733239, -0.6299852, -3.418266, 1, 1, 1, 1, 1,
-0.6691307, -1.070185, -5.131871, 1, 1, 1, 1, 1,
-0.6642891, 0.4782911, 0.3848831, 1, 1, 1, 1, 1,
-0.6494402, -0.08415312, -1.499117, 1, 1, 1, 1, 1,
-0.6489636, 0.4081744, -0.8896994, 1, 1, 1, 1, 1,
-0.6478428, 0.5021451, -1.468198, 1, 1, 1, 1, 1,
-0.6463295, -0.7811521, -1.298145, 1, 1, 1, 1, 1,
-0.6445103, 0.200901, -1.504812, 1, 1, 1, 1, 1,
-0.6437123, -0.3921984, -2.450087, 1, 1, 1, 1, 1,
-0.643347, -1.300064, -3.812068, 0, 0, 1, 1, 1,
-0.6395187, 0.1628605, -0.2093866, 1, 0, 0, 1, 1,
-0.6393071, -1.429434, -1.477992, 1, 0, 0, 1, 1,
-0.6388956, -0.5626769, -1.65374, 1, 0, 0, 1, 1,
-0.6380687, -1.631022, -2.375219, 1, 0, 0, 1, 1,
-0.6359366, -0.5327581, -2.32259, 1, 0, 0, 1, 1,
-0.631977, -0.07798231, -2.853928, 0, 0, 0, 1, 1,
-0.6318371, -0.4871348, -1.531667, 0, 0, 0, 1, 1,
-0.6301073, -0.6249939, -2.716554, 0, 0, 0, 1, 1,
-0.6240675, -0.4150764, -3.088574, 0, 0, 0, 1, 1,
-0.62257, -1.392861, -1.222339, 0, 0, 0, 1, 1,
-0.6179146, 1.684477, -0.4140752, 0, 0, 0, 1, 1,
-0.6178482, 0.8392816, -0.01737507, 0, 0, 0, 1, 1,
-0.6170752, 0.6816015, -0.1084796, 1, 1, 1, 1, 1,
-0.6087323, 0.03462812, -2.36672, 1, 1, 1, 1, 1,
-0.602558, 1.235131, 0.6059064, 1, 1, 1, 1, 1,
-0.5999085, -0.4049802, -2.324324, 1, 1, 1, 1, 1,
-0.5890466, 0.3955866, -1.276499, 1, 1, 1, 1, 1,
-0.5873571, -0.3441231, -2.82563, 1, 1, 1, 1, 1,
-0.5797688, -0.5243445, -1.349954, 1, 1, 1, 1, 1,
-0.5715128, 2.244719, -0.686291, 1, 1, 1, 1, 1,
-0.5598386, 2.739014, 0.6007463, 1, 1, 1, 1, 1,
-0.5586683, -1.526025, -2.221802, 1, 1, 1, 1, 1,
-0.5579625, 0.247026, -1.82536, 1, 1, 1, 1, 1,
-0.5568569, 0.5901053, 0.8311968, 1, 1, 1, 1, 1,
-0.5547964, -0.3990566, -2.550992, 1, 1, 1, 1, 1,
-0.5521869, 0.5258361, -0.04583803, 1, 1, 1, 1, 1,
-0.551224, -1.925039, -1.607682, 1, 1, 1, 1, 1,
-0.5500031, 0.4354184, -1.923163, 0, 0, 1, 1, 1,
-0.549299, -0.2510908, -2.537378, 1, 0, 0, 1, 1,
-0.5458575, -0.9846549, -3.263964, 1, 0, 0, 1, 1,
-0.5433643, -0.6089306, -1.915794, 1, 0, 0, 1, 1,
-0.5417332, 0.9506249, -0.7020037, 1, 0, 0, 1, 1,
-0.5390423, -0.5791979, -2.810498, 1, 0, 0, 1, 1,
-0.5380511, 0.1507282, -1.778756, 0, 0, 0, 1, 1,
-0.5370036, -0.591752, -3.464864, 0, 0, 0, 1, 1,
-0.5345938, 0.04153538, -2.485494, 0, 0, 0, 1, 1,
-0.5301159, -0.249978, -2.004654, 0, 0, 0, 1, 1,
-0.5279953, -1.878406, -2.752524, 0, 0, 0, 1, 1,
-0.5279173, 0.1376139, -2.124099, 0, 0, 0, 1, 1,
-0.5241474, -1.475438, -3.429924, 0, 0, 0, 1, 1,
-0.5212273, -0.3278908, -0.7430359, 1, 1, 1, 1, 1,
-0.5207471, 0.6503499, -1.235606, 1, 1, 1, 1, 1,
-0.5202338, 1.200817, -0.1685563, 1, 1, 1, 1, 1,
-0.5189924, 0.5496123, -1.032645, 1, 1, 1, 1, 1,
-0.5149282, 0.8848683, 1.812718, 1, 1, 1, 1, 1,
-0.5130199, 1.850128, 0.04004275, 1, 1, 1, 1, 1,
-0.5118989, -0.3986699, -0.7704741, 1, 1, 1, 1, 1,
-0.5100479, -0.4757527, -1.998353, 1, 1, 1, 1, 1,
-0.5095139, -0.7268513, -3.731868, 1, 1, 1, 1, 1,
-0.5056869, -0.3234981, -1.532594, 1, 1, 1, 1, 1,
-0.4988077, -0.6213453, -1.22525, 1, 1, 1, 1, 1,
-0.4942304, 0.5321956, -1.391312, 1, 1, 1, 1, 1,
-0.492923, 0.2742408, -1.36724, 1, 1, 1, 1, 1,
-0.4926994, 0.6359329, -0.6175435, 1, 1, 1, 1, 1,
-0.4915237, -0.1969238, -1.552009, 1, 1, 1, 1, 1,
-0.4832032, 0.04066749, -0.1929759, 0, 0, 1, 1, 1,
-0.481883, 0.5017125, 0.7054755, 1, 0, 0, 1, 1,
-0.4779437, 0.4466498, -3.077233, 1, 0, 0, 1, 1,
-0.4772508, -0.6886132, -0.9382118, 1, 0, 0, 1, 1,
-0.4694663, 0.1022768, -4.060309, 1, 0, 0, 1, 1,
-0.4678726, 0.6653976, 0.2689715, 1, 0, 0, 1, 1,
-0.4645236, 0.8172585, -1.347103, 0, 0, 0, 1, 1,
-0.4630275, -2.54602, -4.136349, 0, 0, 0, 1, 1,
-0.457538, 0.6085993, 0.02052916, 0, 0, 0, 1, 1,
-0.4550287, -0.6100261, -2.565668, 0, 0, 0, 1, 1,
-0.4493688, 0.09511582, -1.879412, 0, 0, 0, 1, 1,
-0.4475461, 0.8086323, 0.6678181, 0, 0, 0, 1, 1,
-0.4446712, -0.9224705, -3.238566, 0, 0, 0, 1, 1,
-0.4396143, 0.3075299, -1.084258, 1, 1, 1, 1, 1,
-0.4375699, 1.755295, -2.125557, 1, 1, 1, 1, 1,
-0.4350766, 1.050822, 1.609693, 1, 1, 1, 1, 1,
-0.4320433, -1.167799, -3.823687, 1, 1, 1, 1, 1,
-0.4315984, -0.8205019, -3.518048, 1, 1, 1, 1, 1,
-0.429691, 0.119183, -2.319645, 1, 1, 1, 1, 1,
-0.4236439, -0.4881128, -2.28164, 1, 1, 1, 1, 1,
-0.4235007, -0.8260351, -4.142267, 1, 1, 1, 1, 1,
-0.4227602, 1.778935, -0.9279579, 1, 1, 1, 1, 1,
-0.4225766, -1.379277, -4.211766, 1, 1, 1, 1, 1,
-0.4215118, -0.4441734, -3.960427, 1, 1, 1, 1, 1,
-0.4127086, 0.3193606, -1.545138, 1, 1, 1, 1, 1,
-0.4123385, 0.392533, 0.2992674, 1, 1, 1, 1, 1,
-0.4104709, 0.5578303, -1.903501, 1, 1, 1, 1, 1,
-0.4087156, 0.9038507, -0.1497837, 1, 1, 1, 1, 1,
-0.407033, 1.045202, 2.276496, 0, 0, 1, 1, 1,
-0.4030654, 0.3101963, 0.4448479, 1, 0, 0, 1, 1,
-0.4029625, -1.244716, -3.331853, 1, 0, 0, 1, 1,
-0.4003594, 0.05004013, -2.289106, 1, 0, 0, 1, 1,
-0.3994775, -1.637728, -3.545774, 1, 0, 0, 1, 1,
-0.3955255, -1.41907, -2.796448, 1, 0, 0, 1, 1,
-0.3947708, -0.3273802, -1.755554, 0, 0, 0, 1, 1,
-0.3896464, 1.517534, 0.344052, 0, 0, 0, 1, 1,
-0.3885776, 1.053408, -0.3969191, 0, 0, 0, 1, 1,
-0.3872214, -0.8307989, -1.112647, 0, 0, 0, 1, 1,
-0.3848546, -0.5878869, -1.432513, 0, 0, 0, 1, 1,
-0.3815826, -1.222514, -2.949931, 0, 0, 0, 1, 1,
-0.380414, -0.8737997, -2.299753, 0, 0, 0, 1, 1,
-0.3780635, -1.267718, -1.618188, 1, 1, 1, 1, 1,
-0.37695, 1.122977, -0.9909962, 1, 1, 1, 1, 1,
-0.3759404, -1.461876, -1.807346, 1, 1, 1, 1, 1,
-0.3755369, 0.6055138, 0.01476347, 1, 1, 1, 1, 1,
-0.3740614, -0.8319343, -3.067769, 1, 1, 1, 1, 1,
-0.3728841, -0.4344961, -2.030623, 1, 1, 1, 1, 1,
-0.3622165, 0.599611, 0.07406225, 1, 1, 1, 1, 1,
-0.3589184, -0.6116725, 0.2708187, 1, 1, 1, 1, 1,
-0.3587244, -0.3070367, -3.0718, 1, 1, 1, 1, 1,
-0.3580519, 0.3185017, 0.3940839, 1, 1, 1, 1, 1,
-0.3556019, 0.6108792, 0.3195567, 1, 1, 1, 1, 1,
-0.3511524, -0.03084745, -1.555555, 1, 1, 1, 1, 1,
-0.3508531, -0.05991625, -2.107565, 1, 1, 1, 1, 1,
-0.3460081, -0.8572727, -3.68723, 1, 1, 1, 1, 1,
-0.3459624, -0.970649, -2.89433, 1, 1, 1, 1, 1,
-0.344289, 0.6197187, -0.4038013, 0, 0, 1, 1, 1,
-0.3424317, -0.05721889, -1.240246, 1, 0, 0, 1, 1,
-0.3407758, 0.2204784, -1.898586, 1, 0, 0, 1, 1,
-0.3396891, 2.180278, -0.3116468, 1, 0, 0, 1, 1,
-0.337864, -0.07488936, -2.290842, 1, 0, 0, 1, 1,
-0.3372773, -0.2435783, -0.6290278, 1, 0, 0, 1, 1,
-0.3355054, -0.7624086, -3.682568, 0, 0, 0, 1, 1,
-0.3340611, 0.06771117, -0.7384894, 0, 0, 0, 1, 1,
-0.3337874, 0.7365263, -0.7137921, 0, 0, 0, 1, 1,
-0.3273576, -0.1995132, -2.521386, 0, 0, 0, 1, 1,
-0.3141759, -2.049967, -2.169445, 0, 0, 0, 1, 1,
-0.3128118, -2.047187, -3.251447, 0, 0, 0, 1, 1,
-0.3114141, -0.1386803, -2.252558, 0, 0, 0, 1, 1,
-0.3109643, -0.2135745, -2.118891, 1, 1, 1, 1, 1,
-0.309752, 0.6439398, 1.052156, 1, 1, 1, 1, 1,
-0.3062721, -0.6921555, -2.864264, 1, 1, 1, 1, 1,
-0.3053112, 0.4779111, -3.409598, 1, 1, 1, 1, 1,
-0.3047717, -0.3658466, -2.747232, 1, 1, 1, 1, 1,
-0.3040143, 0.4496736, 0.588966, 1, 1, 1, 1, 1,
-0.3030134, -0.06646472, -2.857614, 1, 1, 1, 1, 1,
-0.3025843, 0.6085626, -0.2209519, 1, 1, 1, 1, 1,
-0.3019494, 0.2893133, 0.6291471, 1, 1, 1, 1, 1,
-0.2970736, -0.9656951, -3.568232, 1, 1, 1, 1, 1,
-0.2965615, -0.6633952, -3.463947, 1, 1, 1, 1, 1,
-0.2931789, 1.808227, 0.1706234, 1, 1, 1, 1, 1,
-0.2870807, 0.4116533, -1.328663, 1, 1, 1, 1, 1,
-0.2867212, -1.596626, -3.499436, 1, 1, 1, 1, 1,
-0.2844697, 1.965498, -0.3683205, 1, 1, 1, 1, 1,
-0.2779938, 0.02001021, -0.6386293, 0, 0, 1, 1, 1,
-0.273074, 0.2858201, 0.2838016, 1, 0, 0, 1, 1,
-0.2714408, -1.27535, -2.305481, 1, 0, 0, 1, 1,
-0.2713178, -2.099242, -1.07909, 1, 0, 0, 1, 1,
-0.2691182, -0.7569413, -3.171809, 1, 0, 0, 1, 1,
-0.2656044, -0.4045864, -0.9995407, 1, 0, 0, 1, 1,
-0.2649971, 1.597887, -1.012685, 0, 0, 0, 1, 1,
-0.2648234, -1.714299, -2.980388, 0, 0, 0, 1, 1,
-0.2647464, -0.61349, -1.727232, 0, 0, 0, 1, 1,
-0.2617685, 1.855888, 1.161874, 0, 0, 0, 1, 1,
-0.2616281, 1.090439, 0.4131177, 0, 0, 0, 1, 1,
-0.2615462, 0.8742595, -1.025118, 0, 0, 0, 1, 1,
-0.2601165, -0.3289959, -1.822734, 0, 0, 0, 1, 1,
-0.2595849, -1.706975, -3.289057, 1, 1, 1, 1, 1,
-0.257951, 0.4194214, -0.6498855, 1, 1, 1, 1, 1,
-0.2571689, -0.04358281, -2.106676, 1, 1, 1, 1, 1,
-0.2550267, -1.033942, -3.13304, 1, 1, 1, 1, 1,
-0.2521307, 1.392465, -1.78344, 1, 1, 1, 1, 1,
-0.2517696, 0.5630332, -1.263492, 1, 1, 1, 1, 1,
-0.2469257, 0.240332, -1.165077, 1, 1, 1, 1, 1,
-0.2457206, -0.8141224, -3.720005, 1, 1, 1, 1, 1,
-0.2421308, 1.252362, 0.4645158, 1, 1, 1, 1, 1,
-0.2421171, 0.5213944, -0.7856334, 1, 1, 1, 1, 1,
-0.240295, 0.9798297, -1.409582, 1, 1, 1, 1, 1,
-0.2386834, -0.2185757, -3.940358, 1, 1, 1, 1, 1,
-0.2376745, 0.4701435, 0.3489701, 1, 1, 1, 1, 1,
-0.2348332, 0.6639763, 0.7683071, 1, 1, 1, 1, 1,
-0.2308378, -0.3804729, -1.688347, 1, 1, 1, 1, 1,
-0.2278845, -0.3960921, -3.119856, 0, 0, 1, 1, 1,
-0.224841, -0.7306464, -1.782595, 1, 0, 0, 1, 1,
-0.2229391, 1.507017, 0.6418856, 1, 0, 0, 1, 1,
-0.2177027, 0.008227372, -1.623152, 1, 0, 0, 1, 1,
-0.2176258, 0.3271736, 0.5479107, 1, 0, 0, 1, 1,
-0.217429, -0.9970079, -3.409048, 1, 0, 0, 1, 1,
-0.2149861, 1.442789, -0.6660036, 0, 0, 0, 1, 1,
-0.2118739, -0.93269, -3.284051, 0, 0, 0, 1, 1,
-0.2107501, 1.39784, 1.257543, 0, 0, 0, 1, 1,
-0.2056052, -1.643659, -2.844636, 0, 0, 0, 1, 1,
-0.2019872, -0.1381786, -0.9648073, 0, 0, 0, 1, 1,
-0.1997886, 0.3370989, -2.070142, 0, 0, 0, 1, 1,
-0.1983141, -1.20155, -1.762453, 0, 0, 0, 1, 1,
-0.1973072, 0.5033939, 1.927495, 1, 1, 1, 1, 1,
-0.1954525, 0.2305487, -0.3343738, 1, 1, 1, 1, 1,
-0.1945155, 2.500517, -1.143412, 1, 1, 1, 1, 1,
-0.1907192, 1.003494, 0.3244659, 1, 1, 1, 1, 1,
-0.1897768, 0.7105572, 0.06447154, 1, 1, 1, 1, 1,
-0.1892488, -1.925698, -2.321692, 1, 1, 1, 1, 1,
-0.1844939, -0.178889, -3.184979, 1, 1, 1, 1, 1,
-0.1838563, 0.06565994, -1.93154, 1, 1, 1, 1, 1,
-0.1829886, -0.6921612, -3.493379, 1, 1, 1, 1, 1,
-0.1829181, 0.444012, -0.3335148, 1, 1, 1, 1, 1,
-0.182651, 0.5162784, 0.3731148, 1, 1, 1, 1, 1,
-0.1812446, 0.7500835, -0.4518868, 1, 1, 1, 1, 1,
-0.1771661, -0.3884515, -1.516726, 1, 1, 1, 1, 1,
-0.1763191, 0.8728975, -0.2199558, 1, 1, 1, 1, 1,
-0.1760181, -0.1029076, -3.206954, 1, 1, 1, 1, 1,
-0.1699475, 0.5770644, -0.3025304, 0, 0, 1, 1, 1,
-0.167154, 0.4826816, 0.2918591, 1, 0, 0, 1, 1,
-0.1662182, -0.4611338, -1.427982, 1, 0, 0, 1, 1,
-0.1654857, 0.4191881, -0.6119764, 1, 0, 0, 1, 1,
-0.1645205, -0.5796827, -4.071593, 1, 0, 0, 1, 1,
-0.1640341, -0.782698, -2.324409, 1, 0, 0, 1, 1,
-0.1608561, -1.915714, -4.372212, 0, 0, 0, 1, 1,
-0.151892, -0.148963, -3.14155, 0, 0, 0, 1, 1,
-0.150626, -0.3784506, -1.533182, 0, 0, 0, 1, 1,
-0.1494175, 0.3396365, -0.6065553, 0, 0, 0, 1, 1,
-0.1487745, 0.8286037, -1.316357, 0, 0, 0, 1, 1,
-0.139085, -1.437622, -4.125017, 0, 0, 0, 1, 1,
-0.1380549, 2.191029, -0.9354085, 0, 0, 0, 1, 1,
-0.1375857, -2.278588, -2.596453, 1, 1, 1, 1, 1,
-0.1358806, 0.2757504, -0.3216839, 1, 1, 1, 1, 1,
-0.1319989, -0.8222266, -3.35139, 1, 1, 1, 1, 1,
-0.1299039, 0.1411722, -0.8495789, 1, 1, 1, 1, 1,
-0.1282138, 0.7076184, 0.275979, 1, 1, 1, 1, 1,
-0.1235215, 1.596832, -0.9913459, 1, 1, 1, 1, 1,
-0.1107562, 0.5775619, -0.7832213, 1, 1, 1, 1, 1,
-0.1105387, -1.144942, -1.475097, 1, 1, 1, 1, 1,
-0.1003823, -0.3675717, -2.330635, 1, 1, 1, 1, 1,
-0.09155204, 0.4082241, 0.8278774, 1, 1, 1, 1, 1,
-0.08608971, -0.873807, -4.347996, 1, 1, 1, 1, 1,
-0.08432052, 1.478869, 0.02124419, 1, 1, 1, 1, 1,
-0.08361374, 1.378848, 1.204468, 1, 1, 1, 1, 1,
-0.07738376, 1.677756, -0.9099169, 1, 1, 1, 1, 1,
-0.07671305, 0.1154359, 0.4647329, 1, 1, 1, 1, 1,
-0.07375169, -0.1330291, -2.104281, 0, 0, 1, 1, 1,
-0.07317003, 0.8561212, -1.694153, 1, 0, 0, 1, 1,
-0.06895535, -1.343869, -2.74671, 1, 0, 0, 1, 1,
-0.06528811, -0.4593967, -3.43527, 1, 0, 0, 1, 1,
-0.06416064, 0.05780344, -0.5121211, 1, 0, 0, 1, 1,
-0.06404196, -0.4384969, -3.105659, 1, 0, 0, 1, 1,
-0.05980289, -0.4575596, -3.851403, 0, 0, 0, 1, 1,
-0.05971995, -1.072702, -1.556595, 0, 0, 0, 1, 1,
-0.05766277, -1.458369, -3.051981, 0, 0, 0, 1, 1,
-0.05707628, -1.386664, -2.22371, 0, 0, 0, 1, 1,
-0.05103133, -1.118462, -2.993542, 0, 0, 0, 1, 1,
-0.04798834, -0.4319636, -4.137803, 0, 0, 0, 1, 1,
-0.04689129, 1.147102, 0.1719323, 0, 0, 0, 1, 1,
-0.04622496, -1.175615, -3.192578, 1, 1, 1, 1, 1,
-0.0459683, 0.2826658, -0.7636843, 1, 1, 1, 1, 1,
-0.04482809, -1.837141, -4.686481, 1, 1, 1, 1, 1,
-0.04440526, -1.851723, -5.284079, 1, 1, 1, 1, 1,
-0.04174742, 0.1862976, 1.347764, 1, 1, 1, 1, 1,
-0.03907588, -1.149562, -2.654896, 1, 1, 1, 1, 1,
-0.0389596, 0.6764148, 0.4014592, 1, 1, 1, 1, 1,
-0.03885563, 0.1998394, -0.1659445, 1, 1, 1, 1, 1,
-0.03633195, -1.433096, -1.650591, 1, 1, 1, 1, 1,
-0.03125986, 0.3485954, 1.576203, 1, 1, 1, 1, 1,
-0.02682992, 0.287149, -2.531109, 1, 1, 1, 1, 1,
-0.02358192, -0.7510836, -3.891879, 1, 1, 1, 1, 1,
-0.02257483, 1.274506, 0.1093584, 1, 1, 1, 1, 1,
-0.02188032, -1.526194, -2.289805, 1, 1, 1, 1, 1,
-0.02059402, -0.5610701, -6.049675, 1, 1, 1, 1, 1,
-0.01994691, -0.05107397, -2.33586, 0, 0, 1, 1, 1,
-0.01689535, -0.4096105, -3.408602, 1, 0, 0, 1, 1,
-0.01661852, 1.395185, 0.9769015, 1, 0, 0, 1, 1,
-0.01574429, -0.6949118, -3.929188, 1, 0, 0, 1, 1,
-0.01529264, -0.9412891, -2.87785, 1, 0, 0, 1, 1,
-0.01049139, -1.86888, -2.0492, 1, 0, 0, 1, 1,
-0.008631311, 0.7081668, 0.4557267, 0, 0, 0, 1, 1,
-0.006758273, -1.054067, -1.819356, 0, 0, 0, 1, 1,
-0.006284861, -1.396187, -3.470215, 0, 0, 0, 1, 1,
-0.003746951, -2.304364, -2.207178, 0, 0, 0, 1, 1,
-0.002023514, 0.637132, -1.052834, 0, 0, 0, 1, 1,
6.101895e-05, 0.1632614, -0.2454351, 0, 0, 0, 1, 1,
0.00292241, -1.377059, 4.653257, 0, 0, 0, 1, 1,
0.01218296, 0.02393867, 0.7063826, 1, 1, 1, 1, 1,
0.01436959, 1.117571, -0.9415048, 1, 1, 1, 1, 1,
0.01772277, -1.084438, 3.886229, 1, 1, 1, 1, 1,
0.03086187, -1.14829, 4.244261, 1, 1, 1, 1, 1,
0.03138579, -0.5039811, 2.847507, 1, 1, 1, 1, 1,
0.03405128, -1.929783, 2.492081, 1, 1, 1, 1, 1,
0.03479289, 0.9258432, 0.668278, 1, 1, 1, 1, 1,
0.03559787, -1.269289, 4.845455, 1, 1, 1, 1, 1,
0.03722341, -0.3786435, 2.983738, 1, 1, 1, 1, 1,
0.03745437, 0.6292582, -1.199711, 1, 1, 1, 1, 1,
0.04000269, 0.5273757, -0.9553427, 1, 1, 1, 1, 1,
0.04012874, -1.014764, 4.853413, 1, 1, 1, 1, 1,
0.04200324, -0.508105, 2.387105, 1, 1, 1, 1, 1,
0.0501031, -0.06932528, 2.972333, 1, 1, 1, 1, 1,
0.05100926, 0.335387, 0.1023617, 1, 1, 1, 1, 1,
0.05423602, 0.6600352, 0.6544865, 0, 0, 1, 1, 1,
0.05642478, 1.068112, -0.1724827, 1, 0, 0, 1, 1,
0.05742698, 0.6913085, -0.7895405, 1, 0, 0, 1, 1,
0.06030742, -0.2008333, 3.087254, 1, 0, 0, 1, 1,
0.0611053, -0.4079878, 2.892328, 1, 0, 0, 1, 1,
0.07241132, -0.9458791, 3.296845, 1, 0, 0, 1, 1,
0.0739275, 0.6533283, 1.05797, 0, 0, 0, 1, 1,
0.07533545, -0.3248836, 3.744763, 0, 0, 0, 1, 1,
0.07742015, 0.8359205, -1.371156, 0, 0, 0, 1, 1,
0.0774415, -0.2116854, 1.353242, 0, 0, 0, 1, 1,
0.07774685, 1.036823, 1.734762, 0, 0, 0, 1, 1,
0.07801965, 2.75327, 1.605745, 0, 0, 0, 1, 1,
0.07899887, -1.150371, 2.885833, 0, 0, 0, 1, 1,
0.0794564, -1.247048, 4.682434, 1, 1, 1, 1, 1,
0.08126505, -1.309725, 3.308366, 1, 1, 1, 1, 1,
0.08324792, -0.7831964, 4.833554, 1, 1, 1, 1, 1,
0.08464558, -0.4787069, 3.573874, 1, 1, 1, 1, 1,
0.09394134, 0.2209032, 1.379246, 1, 1, 1, 1, 1,
0.09473609, 0.1573387, 0.8699965, 1, 1, 1, 1, 1,
0.09521162, -1.701359, 1.95867, 1, 1, 1, 1, 1,
0.09589773, -0.3690783, 3.199971, 1, 1, 1, 1, 1,
0.0976035, 0.9886358, 0.1115392, 1, 1, 1, 1, 1,
0.09800216, -0.6760669, 2.388963, 1, 1, 1, 1, 1,
0.0983022, 0.7361125, -0.974786, 1, 1, 1, 1, 1,
0.09852628, -1.913725, 1.933071, 1, 1, 1, 1, 1,
0.09876928, -0.1405912, 2.17226, 1, 1, 1, 1, 1,
0.1029519, 0.3236305, 0.3740654, 1, 1, 1, 1, 1,
0.1094122, 0.3968129, -0.7259538, 1, 1, 1, 1, 1,
0.1152927, 0.2486238, 1.302452, 0, 0, 1, 1, 1,
0.1166383, 0.08198144, -0.5223004, 1, 0, 0, 1, 1,
0.1184489, 0.03863857, 0.9314882, 1, 0, 0, 1, 1,
0.1189153, -1.833974, 4.96397, 1, 0, 0, 1, 1,
0.1218138, 1.625297, 0.5617865, 1, 0, 0, 1, 1,
0.1228544, -0.8998042, 1.629846, 1, 0, 0, 1, 1,
0.1234194, 1.248274, -0.9429736, 0, 0, 0, 1, 1,
0.1238873, 0.2948923, 0.2008095, 0, 0, 0, 1, 1,
0.1265576, -1.438801, 2.157893, 0, 0, 0, 1, 1,
0.1276913, 0.8413643, 0.4114268, 0, 0, 0, 1, 1,
0.1282136, 1.609992, 1.196885, 0, 0, 0, 1, 1,
0.1282322, 1.238407, 0.223956, 0, 0, 0, 1, 1,
0.133432, 1.239326, 0.6944011, 0, 0, 0, 1, 1,
0.1369648, -1.44837, 2.896317, 1, 1, 1, 1, 1,
0.1460564, -0.1782514, 1.08823, 1, 1, 1, 1, 1,
0.1628141, 1.446447, 0.2427236, 1, 1, 1, 1, 1,
0.1628597, 0.523417, -1.678165, 1, 1, 1, 1, 1,
0.1634515, -1.209083, 2.083554, 1, 1, 1, 1, 1,
0.1641435, -0.1665352, 3.818939, 1, 1, 1, 1, 1,
0.1781819, -1.330613, 4.372283, 1, 1, 1, 1, 1,
0.1821973, -0.1748445, 1.008878, 1, 1, 1, 1, 1,
0.1848223, -1.050122, 3.139549, 1, 1, 1, 1, 1,
0.185608, 0.114183, 3.012436, 1, 1, 1, 1, 1,
0.1890746, -0.6950207, 3.040732, 1, 1, 1, 1, 1,
0.1918764, -0.1364174, 2.70506, 1, 1, 1, 1, 1,
0.1921107, -0.3178419, 3.181082, 1, 1, 1, 1, 1,
0.1931816, 0.3212777, 0.1154126, 1, 1, 1, 1, 1,
0.1935144, 1.349199, 0.376902, 1, 1, 1, 1, 1,
0.1966716, -1.063365, 3.392054, 0, 0, 1, 1, 1,
0.1980347, 0.473244, -0.3845426, 1, 0, 0, 1, 1,
0.1981636, 0.4662095, -0.5217918, 1, 0, 0, 1, 1,
0.1987177, 0.7245467, 0.9772604, 1, 0, 0, 1, 1,
0.1993946, -0.09448419, 1.490897, 1, 0, 0, 1, 1,
0.2066357, -0.3708012, 3.523481, 1, 0, 0, 1, 1,
0.223846, 1.223204, -0.6590518, 0, 0, 0, 1, 1,
0.225589, -0.4679761, 3.132363, 0, 0, 0, 1, 1,
0.2294166, 2.035026, -0.8264928, 0, 0, 0, 1, 1,
0.235752, -0.3083472, 4.101443, 0, 0, 0, 1, 1,
0.2393365, -1.081103, 4.12516, 0, 0, 0, 1, 1,
0.2408959, -0.6837737, 4.048583, 0, 0, 0, 1, 1,
0.241179, 1.487749, 0.7397208, 0, 0, 0, 1, 1,
0.2415029, 0.1237463, 0.4209581, 1, 1, 1, 1, 1,
0.2423001, 0.8365409, 0.9492213, 1, 1, 1, 1, 1,
0.2468107, -0.5875202, 3.366846, 1, 1, 1, 1, 1,
0.2484905, -0.4630741, 2.673079, 1, 1, 1, 1, 1,
0.2487726, -0.4583116, 2.608815, 1, 1, 1, 1, 1,
0.2571881, -1.536579, 2.802434, 1, 1, 1, 1, 1,
0.2572198, 1.015048, 0.2027389, 1, 1, 1, 1, 1,
0.2597905, 1.806863, -1.390867, 1, 1, 1, 1, 1,
0.2829279, -2.639336, 3.682771, 1, 1, 1, 1, 1,
0.2859844, 0.06146489, 2.891562, 1, 1, 1, 1, 1,
0.2880129, -0.2451846, 1.330321, 1, 1, 1, 1, 1,
0.2909316, 0.492706, 1.915961, 1, 1, 1, 1, 1,
0.3075174, 0.842468, -0.9264645, 1, 1, 1, 1, 1,
0.3080549, -0.2975118, 1.536114, 1, 1, 1, 1, 1,
0.3089225, -1.301206, 2.902512, 1, 1, 1, 1, 1,
0.3109068, -0.7724633, 2.432906, 0, 0, 1, 1, 1,
0.3136351, 0.2389642, 0.08767406, 1, 0, 0, 1, 1,
0.3142303, -0.1041083, 1.610768, 1, 0, 0, 1, 1,
0.3191632, -2.083297, 3.555496, 1, 0, 0, 1, 1,
0.3193556, 0.3758999, 1.053966, 1, 0, 0, 1, 1,
0.3196365, -0.09890833, 1.5646, 1, 0, 0, 1, 1,
0.3247917, -0.1524819, 4.982022, 0, 0, 0, 1, 1,
0.3279022, -1.810094, 2.769976, 0, 0, 0, 1, 1,
0.328826, -0.4686582, 3.536518, 0, 0, 0, 1, 1,
0.330189, -1.413057, 2.780352, 0, 0, 0, 1, 1,
0.3310022, -0.297998, 1.711995, 0, 0, 0, 1, 1,
0.3339924, 0.2701807, -0.8640802, 0, 0, 0, 1, 1,
0.3348614, 0.3943375, -0.0869339, 0, 0, 0, 1, 1,
0.3444327, -0.005308291, 1.993012, 1, 1, 1, 1, 1,
0.3468371, 0.4777458, 0.4340537, 1, 1, 1, 1, 1,
0.3480265, -0.2394209, 2.433622, 1, 1, 1, 1, 1,
0.3482014, -0.870171, 1.50788, 1, 1, 1, 1, 1,
0.3542977, -0.8983967, 2.779444, 1, 1, 1, 1, 1,
0.3598019, 0.8271281, -0.6284214, 1, 1, 1, 1, 1,
0.3641049, 0.7005197, 2.297305, 1, 1, 1, 1, 1,
0.3654205, -1.291385, 3.178728, 1, 1, 1, 1, 1,
0.3716303, 0.6893472, 0.9408765, 1, 1, 1, 1, 1,
0.3789266, 2.107478, 0.4682095, 1, 1, 1, 1, 1,
0.3794606, 1.108451, 0.4831078, 1, 1, 1, 1, 1,
0.3825382, -0.2064505, 2.158048, 1, 1, 1, 1, 1,
0.389105, 0.03680443, -0.08138794, 1, 1, 1, 1, 1,
0.3926947, 0.0755275, 0.2441302, 1, 1, 1, 1, 1,
0.392782, 0.5105025, 0.456459, 1, 1, 1, 1, 1,
0.3966505, 0.9415287, -0.41095, 0, 0, 1, 1, 1,
0.3969572, -1.548736, 3.54539, 1, 0, 0, 1, 1,
0.4021618, -0.5444992, 0.7942149, 1, 0, 0, 1, 1,
0.4039442, -0.8622858, 1.584362, 1, 0, 0, 1, 1,
0.4048394, 0.2665817, 1.011613, 1, 0, 0, 1, 1,
0.4092882, -0.3448946, 1.990892, 1, 0, 0, 1, 1,
0.412115, 1.976321, 1.090624, 0, 0, 0, 1, 1,
0.4158195, 0.3116321, 1.052903, 0, 0, 0, 1, 1,
0.4200653, 0.9742005, 0.3049221, 0, 0, 0, 1, 1,
0.421428, -1.521028, 2.876821, 0, 0, 0, 1, 1,
0.4243835, -0.2874084, 2.613721, 0, 0, 0, 1, 1,
0.4252623, 0.7605106, -0.369899, 0, 0, 0, 1, 1,
0.4283574, 0.5277236, 0.4048291, 0, 0, 0, 1, 1,
0.4323043, -0.2351269, -0.1504534, 1, 1, 1, 1, 1,
0.4346521, -0.6750096, 2.873317, 1, 1, 1, 1, 1,
0.4366744, -1.024998, 4.383327, 1, 1, 1, 1, 1,
0.4433398, -0.5699027, 2.381139, 1, 1, 1, 1, 1,
0.4507822, -0.131505, 1.727559, 1, 1, 1, 1, 1,
0.4547288, -0.6282361, 0.3492655, 1, 1, 1, 1, 1,
0.4563892, 0.03019791, 1.900166, 1, 1, 1, 1, 1,
0.459654, -0.2442479, 3.046206, 1, 1, 1, 1, 1,
0.4599351, 0.9235344, 1.040501, 1, 1, 1, 1, 1,
0.4610423, -1.7606, 2.209282, 1, 1, 1, 1, 1,
0.4620908, 0.5687835, 2.368149, 1, 1, 1, 1, 1,
0.4630348, -0.3758975, 2.031255, 1, 1, 1, 1, 1,
0.463202, 1.443191, -0.5118733, 1, 1, 1, 1, 1,
0.4634425, 0.3516634, 1.757705, 1, 1, 1, 1, 1,
0.4640557, -0.2127281, 2.419554, 1, 1, 1, 1, 1,
0.466445, 1.454542, 0.3380075, 0, 0, 1, 1, 1,
0.4699667, 1.550778, 0.5047966, 1, 0, 0, 1, 1,
0.47833, -0.07283189, 3.198592, 1, 0, 0, 1, 1,
0.47884, 0.007289731, 1.162053, 1, 0, 0, 1, 1,
0.4884123, -1.711935, 2.003622, 1, 0, 0, 1, 1,
0.4894892, -0.1250244, 0.3100376, 1, 0, 0, 1, 1,
0.4914174, 0.7226829, 0.05578575, 0, 0, 0, 1, 1,
0.493509, 0.125919, 0.8724873, 0, 0, 0, 1, 1,
0.4946822, 0.08466731, 3.299754, 0, 0, 0, 1, 1,
0.4990809, 0.3594528, 1.487756, 0, 0, 0, 1, 1,
0.5003957, 0.6743103, 1.997355, 0, 0, 0, 1, 1,
0.502065, -0.116748, 1.526475, 0, 0, 0, 1, 1,
0.5027971, -0.1031623, 1.670407, 0, 0, 0, 1, 1,
0.5040324, 0.9469681, 0.1894708, 1, 1, 1, 1, 1,
0.5070264, 0.5739407, 1.929244, 1, 1, 1, 1, 1,
0.5091408, -0.733211, 2.960316, 1, 1, 1, 1, 1,
0.5097484, -1.449873, 3.93912, 1, 1, 1, 1, 1,
0.5121063, 2.162898, 1.094957, 1, 1, 1, 1, 1,
0.5173294, -0.3269896, 1.780497, 1, 1, 1, 1, 1,
0.520626, -0.2274595, 1.396996, 1, 1, 1, 1, 1,
0.521539, -1.457921, 1.610053, 1, 1, 1, 1, 1,
0.5219428, 0.563154, 0.5336925, 1, 1, 1, 1, 1,
0.5249091, -0.463072, 4.613332, 1, 1, 1, 1, 1,
0.5261195, -0.8528965, 4.775915, 1, 1, 1, 1, 1,
0.5270082, 0.4512811, 0.1081259, 1, 1, 1, 1, 1,
0.5323101, 1.385323, 2.742815, 1, 1, 1, 1, 1,
0.5368417, 1.048436, 0.3038607, 1, 1, 1, 1, 1,
0.5405282, -1.276991, 3.826464, 1, 1, 1, 1, 1,
0.5413619, 2.108317, -0.4158445, 0, 0, 1, 1, 1,
0.5421408, -1.10798, 2.232342, 1, 0, 0, 1, 1,
0.5462123, 0.1530295, 2.302698, 1, 0, 0, 1, 1,
0.5464874, 0.6027268, -0.7275516, 1, 0, 0, 1, 1,
0.5503398, -2.483073, 2.576486, 1, 0, 0, 1, 1,
0.5506718, 0.3038991, 0.1735118, 1, 0, 0, 1, 1,
0.5508431, -0.09101924, 0.3289097, 0, 0, 0, 1, 1,
0.5508625, 0.4650812, 1.523755, 0, 0, 0, 1, 1,
0.5526662, 0.5527881, 0.522594, 0, 0, 0, 1, 1,
0.5561281, 0.9891664, 1.000157, 0, 0, 0, 1, 1,
0.5611305, -1.383159, 3.487385, 0, 0, 0, 1, 1,
0.5614405, 1.488201, -0.173613, 0, 0, 0, 1, 1,
0.5633203, -1.047035, 2.367114, 0, 0, 0, 1, 1,
0.5652266, 0.5083717, 1.21406, 1, 1, 1, 1, 1,
0.5678755, 0.6223362, -0.118732, 1, 1, 1, 1, 1,
0.5687762, 2.530606, -0.7307893, 1, 1, 1, 1, 1,
0.5687898, 0.8074275, 1.345343, 1, 1, 1, 1, 1,
0.569405, 0.209498, 2.434437, 1, 1, 1, 1, 1,
0.5716671, 0.06225916, 1.663275, 1, 1, 1, 1, 1,
0.5766428, -1.530604, 0.9122215, 1, 1, 1, 1, 1,
0.5766706, -1.326103, 3.582451, 1, 1, 1, 1, 1,
0.578047, 0.9899268, 0.7546465, 1, 1, 1, 1, 1,
0.5849173, 0.1441521, 1.79367, 1, 1, 1, 1, 1,
0.5936224, -0.2460077, 2.030618, 1, 1, 1, 1, 1,
0.5970042, 0.2024348, 2.026775, 1, 1, 1, 1, 1,
0.5974584, -0.63187, 2.988352, 1, 1, 1, 1, 1,
0.6016638, -0.7129374, 3.262324, 1, 1, 1, 1, 1,
0.6033031, 0.7232625, 0.4361157, 1, 1, 1, 1, 1,
0.6071396, 2.95286, 2.451798, 0, 0, 1, 1, 1,
0.6086008, 0.7093606, 2.690367, 1, 0, 0, 1, 1,
0.6136447, 0.6407455, -0.637763, 1, 0, 0, 1, 1,
0.6152324, -1.976172, 2.269624, 1, 0, 0, 1, 1,
0.6162311, 0.7395667, 1.430952, 1, 0, 0, 1, 1,
0.6177665, -2.196155, 3.328122, 1, 0, 0, 1, 1,
0.6235808, 0.5148799, 1.222614, 0, 0, 0, 1, 1,
0.6237615, -1.936437, 2.369786, 0, 0, 0, 1, 1,
0.6265598, 0.4848177, 1.332861, 0, 0, 0, 1, 1,
0.6271673, 0.9876478, -1.735864, 0, 0, 0, 1, 1,
0.6290023, 1.186476, 1.761528, 0, 0, 0, 1, 1,
0.6375549, -0.02329768, 2.440561, 0, 0, 0, 1, 1,
0.6407134, 0.1462251, 0.4670308, 0, 0, 0, 1, 1,
0.6473801, 3.144001, 0.6737379, 1, 1, 1, 1, 1,
0.6493642, -0.746722, 1.669539, 1, 1, 1, 1, 1,
0.6508197, 0.6333166, 0.5686947, 1, 1, 1, 1, 1,
0.6510258, 0.2949523, 0.1098312, 1, 1, 1, 1, 1,
0.6531242, 0.8749728, 1.537129, 1, 1, 1, 1, 1,
0.6573625, -0.6393113, 2.18785, 1, 1, 1, 1, 1,
0.6581526, -1.348888, 2.553277, 1, 1, 1, 1, 1,
0.6603108, -1.623677, 3.947293, 1, 1, 1, 1, 1,
0.6611871, 0.1803047, 2.014186, 1, 1, 1, 1, 1,
0.6629366, 0.5077389, 0.4544509, 1, 1, 1, 1, 1,
0.6645473, -0.7279453, 2.031728, 1, 1, 1, 1, 1,
0.6645567, -0.961653, 3.261446, 1, 1, 1, 1, 1,
0.6678237, 0.3098269, 2.920274, 1, 1, 1, 1, 1,
0.6751789, -0.55038, 1.724227, 1, 1, 1, 1, 1,
0.6769255, 1.137846, 1.84489, 1, 1, 1, 1, 1,
0.6808966, 0.1488634, 0.7502599, 0, 0, 1, 1, 1,
0.6829727, 0.4905072, 0.8337829, 1, 0, 0, 1, 1,
0.6851285, 1.152224, -0.8149374, 1, 0, 0, 1, 1,
0.6855929, -1.663676, 2.463078, 1, 0, 0, 1, 1,
0.6865882, -0.1906264, 2.973434, 1, 0, 0, 1, 1,
0.6885141, -1.268542, 4.126187, 1, 0, 0, 1, 1,
0.6886197, 0.135955, 1.120638, 0, 0, 0, 1, 1,
0.6912972, -0.2841498, 2.1303, 0, 0, 0, 1, 1,
0.6945422, 1.660412, -0.406062, 0, 0, 0, 1, 1,
0.695154, -0.07876673, 0.9965068, 0, 0, 0, 1, 1,
0.703528, 0.8147368, 3.152579, 0, 0, 0, 1, 1,
0.7052618, -0.8270432, 3.796624, 0, 0, 0, 1, 1,
0.7065155, 1.840599, 1.262889, 0, 0, 0, 1, 1,
0.7084621, 1.059678, 0.289863, 1, 1, 1, 1, 1,
0.7093571, 0.1551395, 2.694803, 1, 1, 1, 1, 1,
0.712658, 0.6003892, 0.7726198, 1, 1, 1, 1, 1,
0.7170766, 0.5235502, 1.765843, 1, 1, 1, 1, 1,
0.7206482, -0.4808986, 2.157328, 1, 1, 1, 1, 1,
0.7218763, -0.1454382, 2.719211, 1, 1, 1, 1, 1,
0.7224637, -0.356014, 2.320909, 1, 1, 1, 1, 1,
0.725356, 0.9684551, -1.011272, 1, 1, 1, 1, 1,
0.7480653, 0.1275182, 1.338588, 1, 1, 1, 1, 1,
0.7553167, 0.9017791, -0.3575983, 1, 1, 1, 1, 1,
0.7622291, -0.6318709, 1.790705, 1, 1, 1, 1, 1,
0.7646455, 1.183473, -0.109873, 1, 1, 1, 1, 1,
0.7674288, -0.2484702, 1.588649, 1, 1, 1, 1, 1,
0.7684558, 0.2014872, 0.9574232, 1, 1, 1, 1, 1,
0.7688891, 0.07065412, 3.350996, 1, 1, 1, 1, 1,
0.7752186, 0.2686699, 0.589149, 0, 0, 1, 1, 1,
0.7798254, 0.7492521, -0.2605648, 1, 0, 0, 1, 1,
0.7809005, 1.363771, -1.114247, 1, 0, 0, 1, 1,
0.8063158, -2.840216, 2.039667, 1, 0, 0, 1, 1,
0.8074275, -0.4679164, 1.709206, 1, 0, 0, 1, 1,
0.8092299, -1.074359, 2.833876, 1, 0, 0, 1, 1,
0.8116714, -0.6295272, 1.814707, 0, 0, 0, 1, 1,
0.8119759, -0.2553395, 1.949513, 0, 0, 0, 1, 1,
0.8146074, 1.566742, 1.579383, 0, 0, 0, 1, 1,
0.8338178, -0.1433562, 2.500129, 0, 0, 0, 1, 1,
0.8354735, -0.4925361, 3.040791, 0, 0, 0, 1, 1,
0.8356646, 1.295855, 2.357974, 0, 0, 0, 1, 1,
0.837324, -0.7199945, 1.423355, 0, 0, 0, 1, 1,
0.8395379, 0.1662837, 1.778958, 1, 1, 1, 1, 1,
0.8399817, 0.4841261, 1.274205, 1, 1, 1, 1, 1,
0.8436601, -1.473456, 2.074862, 1, 1, 1, 1, 1,
0.8465257, -0.05499104, 2.614108, 1, 1, 1, 1, 1,
0.8526908, -0.3426718, 1.781082, 1, 1, 1, 1, 1,
0.8568939, 1.158688, -0.3319308, 1, 1, 1, 1, 1,
0.8571978, 0.8105229, 0.7128234, 1, 1, 1, 1, 1,
0.8619363, -0.5501748, 2.695275, 1, 1, 1, 1, 1,
0.875016, 0.6747015, 1.916155, 1, 1, 1, 1, 1,
0.8753005, -0.7001438, 1.031099, 1, 1, 1, 1, 1,
0.8760366, 0.727919, -0.5477351, 1, 1, 1, 1, 1,
0.8814294, 0.2016535, 1.953512, 1, 1, 1, 1, 1,
0.8887948, 0.4840506, -0.49241, 1, 1, 1, 1, 1,
0.910469, -1.101323, 2.39555, 1, 1, 1, 1, 1,
0.9107285, -1.413219, 4.34924, 1, 1, 1, 1, 1,
0.9154179, 0.2137227, 1.248642, 0, 0, 1, 1, 1,
0.9191386, 1.540492, 2.8118, 1, 0, 0, 1, 1,
0.9228824, 1.686947, 0.2106049, 1, 0, 0, 1, 1,
0.9268187, 0.2629697, 2.372683, 1, 0, 0, 1, 1,
0.9287468, 1.557747, 0.03246873, 1, 0, 0, 1, 1,
0.9359089, -0.4353313, 1.425941, 1, 0, 0, 1, 1,
0.9406703, 0.5557114, 0.4359381, 0, 0, 0, 1, 1,
0.9411859, 1.594792, -0.4413682, 0, 0, 0, 1, 1,
0.9434859, 1.352525, -0.08313351, 0, 0, 0, 1, 1,
0.946465, 1.249746, 1.936834, 0, 0, 0, 1, 1,
0.9493883, -2.412032, 2.260713, 0, 0, 0, 1, 1,
0.9503975, 0.1164836, 2.116919, 0, 0, 0, 1, 1,
0.9519781, -0.7887766, 0.5231134, 0, 0, 0, 1, 1,
0.9543365, 0.3696545, 1.718534, 1, 1, 1, 1, 1,
0.964582, 1.232644, 1.024554, 1, 1, 1, 1, 1,
0.9682664, -0.8043405, 2.487428, 1, 1, 1, 1, 1,
0.9683935, 2.067345, 1.370142, 1, 1, 1, 1, 1,
0.9720297, -0.1268215, 2.420436, 1, 1, 1, 1, 1,
0.9772391, -1.272791, 1.447749, 1, 1, 1, 1, 1,
1.00105, 0.6515058, 0.1827341, 1, 1, 1, 1, 1,
1.001572, 0.460271, -0.2552503, 1, 1, 1, 1, 1,
1.003175, 1.24834, 1.349359, 1, 1, 1, 1, 1,
1.006891, -0.5323197, 2.626293, 1, 1, 1, 1, 1,
1.010046, 0.08530024, 0.5141507, 1, 1, 1, 1, 1,
1.01315, -0.3260027, 1.015227, 1, 1, 1, 1, 1,
1.015029, -1.103529, 2.315527, 1, 1, 1, 1, 1,
1.015557, -0.4547994, 2.457051, 1, 1, 1, 1, 1,
1.0178, 0.3967882, 0.553577, 1, 1, 1, 1, 1,
1.023303, 0.5485351, 2.79415, 0, 0, 1, 1, 1,
1.025987, -0.02245978, 2.832162, 1, 0, 0, 1, 1,
1.03095, -1.424849, 4.93743, 1, 0, 0, 1, 1,
1.037093, -0.8519231, 2.52032, 1, 0, 0, 1, 1,
1.043745, 0.7693692, 0.4232309, 1, 0, 0, 1, 1,
1.05134, 0.7463455, -0.4696569, 1, 0, 0, 1, 1,
1.056137, -1.144358, 3.420377, 0, 0, 0, 1, 1,
1.061122, 1.409563, 0.9382994, 0, 0, 0, 1, 1,
1.062019, -0.4507771, 3.065663, 0, 0, 0, 1, 1,
1.062727, 0.4490065, 2.54549, 0, 0, 0, 1, 1,
1.065939, -0.8893327, 0.4243751, 0, 0, 0, 1, 1,
1.078126, -1.075112, 3.538829, 0, 0, 0, 1, 1,
1.085613, -1.298815, 2.232929, 0, 0, 0, 1, 1,
1.089718, 1.607285, -0.631766, 1, 1, 1, 1, 1,
1.094205, 1.229625, 0.3737598, 1, 1, 1, 1, 1,
1.103476, 0.02838581, 0.9487458, 1, 1, 1, 1, 1,
1.108279, 0.1707376, 0.2739942, 1, 1, 1, 1, 1,
1.113331, 0.3943617, 1.290008, 1, 1, 1, 1, 1,
1.114379, -0.3599855, 1.96826, 1, 1, 1, 1, 1,
1.116524, 0.5110009, 1.299388, 1, 1, 1, 1, 1,
1.119543, -2.306264, 1.497301, 1, 1, 1, 1, 1,
1.12785, -0.7992542, 3.692924, 1, 1, 1, 1, 1,
1.130499, 1.387506, 1.27564, 1, 1, 1, 1, 1,
1.13536, -0.04110691, 0.9084107, 1, 1, 1, 1, 1,
1.135458, 1.394062, 0.7886969, 1, 1, 1, 1, 1,
1.139342, -0.563534, 1.289205, 1, 1, 1, 1, 1,
1.147755, -0.524213, 1.54586, 1, 1, 1, 1, 1,
1.151938, -0.735683, 2.235098, 1, 1, 1, 1, 1,
1.155635, 1.062842, 0.8059888, 0, 0, 1, 1, 1,
1.170165, 1.117684, -0.6838005, 1, 0, 0, 1, 1,
1.175061, -1.391401, 2.548812, 1, 0, 0, 1, 1,
1.175167, -1.477529, 3.089466, 1, 0, 0, 1, 1,
1.183049, 0.8165312, 0.5787162, 1, 0, 0, 1, 1,
1.187568, -0.9599589, 3.029908, 1, 0, 0, 1, 1,
1.190631, -1.945416, 1.744673, 0, 0, 0, 1, 1,
1.196158, 1.037481, 0.6626897, 0, 0, 0, 1, 1,
1.201257, -2.093853, 2.945895, 0, 0, 0, 1, 1,
1.209573, -0.7996621, 1.499904, 0, 0, 0, 1, 1,
1.20986, -0.2149088, 2.608011, 0, 0, 0, 1, 1,
1.214188, 1.647566, 1.706042, 0, 0, 0, 1, 1,
1.217018, -0.9203489, 0.9877718, 0, 0, 0, 1, 1,
1.224717, 1.247441, 1.083107, 1, 1, 1, 1, 1,
1.226116, -0.5749911, 0.9911346, 1, 1, 1, 1, 1,
1.227729, -0.7276004, 2.331186, 1, 1, 1, 1, 1,
1.231384, -0.8864852, 1.550554, 1, 1, 1, 1, 1,
1.237975, -0.8287032, 1.822348, 1, 1, 1, 1, 1,
1.244492, -0.1989523, 2.939698, 1, 1, 1, 1, 1,
1.251813, 0.8855922, -0.8824875, 1, 1, 1, 1, 1,
1.252296, -0.04103184, 1.776897, 1, 1, 1, 1, 1,
1.257698, 0.5629426, 1.921264, 1, 1, 1, 1, 1,
1.259428, -1.486437, 2.184962, 1, 1, 1, 1, 1,
1.264994, -2.648059, 1.281514, 1, 1, 1, 1, 1,
1.26561, 0.2350063, 2.220492, 1, 1, 1, 1, 1,
1.266346, 1.289256, 0.762073, 1, 1, 1, 1, 1,
1.300372, 1.314066, 1.707786, 1, 1, 1, 1, 1,
1.300774, 0.9949523, 2.653685, 1, 1, 1, 1, 1,
1.30562, -1.850195, 0.9010158, 0, 0, 1, 1, 1,
1.30662, -1.247724, 1.016601, 1, 0, 0, 1, 1,
1.309366, -1.03338, 2.004962, 1, 0, 0, 1, 1,
1.30966, -1.03988, 2.421595, 1, 0, 0, 1, 1,
1.316848, -0.9925996, 3.90217, 1, 0, 0, 1, 1,
1.332592, 1.127335, 1.042371, 1, 0, 0, 1, 1,
1.33326, -0.1537962, 2.286896, 0, 0, 0, 1, 1,
1.33432, 0.8607622, -0.594119, 0, 0, 0, 1, 1,
1.341309, 0.5290483, 0.7389439, 0, 0, 0, 1, 1,
1.34137, 0.4287506, 2.192168, 0, 0, 0, 1, 1,
1.341717, -0.4582295, 2.26987, 0, 0, 0, 1, 1,
1.350747, -0.5512292, 2.287164, 0, 0, 0, 1, 1,
1.357746, -0.5892044, 1.185889, 0, 0, 0, 1, 1,
1.386027, 0.02221439, 0.6376146, 1, 1, 1, 1, 1,
1.391098, -0.4105047, -0.1088651, 1, 1, 1, 1, 1,
1.391998, 0.1820113, 2.914498, 1, 1, 1, 1, 1,
1.395066, 0.7212071, 1.778742, 1, 1, 1, 1, 1,
1.400702, -0.4178903, 1.299034, 1, 1, 1, 1, 1,
1.401339, -1.372398, 3.434804, 1, 1, 1, 1, 1,
1.404134, 0.02766578, 1.32112, 1, 1, 1, 1, 1,
1.406576, 2.518817, 2.273106, 1, 1, 1, 1, 1,
1.415756, -1.402031, 0.5834836, 1, 1, 1, 1, 1,
1.417254, 0.03003117, 2.321638, 1, 1, 1, 1, 1,
1.419325, 0.4837964, 1.173578, 1, 1, 1, 1, 1,
1.421303, 1.716558, 1.370504, 1, 1, 1, 1, 1,
1.426761, -1.798828, 2.355641, 1, 1, 1, 1, 1,
1.426804, -0.1724213, 0.1052098, 1, 1, 1, 1, 1,
1.433143, -0.6856086, 0.972582, 1, 1, 1, 1, 1,
1.443493, 0.2481857, 1.136486, 0, 0, 1, 1, 1,
1.444052, 0.6416375, 1.024151, 1, 0, 0, 1, 1,
1.444762, -0.6912406, 2.697293, 1, 0, 0, 1, 1,
1.450276, -0.4664841, 0.9698988, 1, 0, 0, 1, 1,
1.451769, 0.618207, 3.141305, 1, 0, 0, 1, 1,
1.463957, 1.104624, -0.01282693, 1, 0, 0, 1, 1,
1.483374, -1.099477, 2.947829, 0, 0, 0, 1, 1,
1.504399, 1.066561, 1.741531, 0, 0, 0, 1, 1,
1.521696, 1.695136, -0.623057, 0, 0, 0, 1, 1,
1.53708, 0.4733621, 1.100372, 0, 0, 0, 1, 1,
1.53929, 0.02428223, 1.812995, 0, 0, 0, 1, 1,
1.55662, -0.5968294, 0.6061851, 0, 0, 0, 1, 1,
1.558192, 0.5393794, 0.4324793, 0, 0, 0, 1, 1,
1.574745, -1.327651, 2.186392, 1, 1, 1, 1, 1,
1.585166, 1.456178, 0.003609673, 1, 1, 1, 1, 1,
1.586971, 0.1728607, 0.9335235, 1, 1, 1, 1, 1,
1.587072, 0.4448282, 0.7298127, 1, 1, 1, 1, 1,
1.588091, -1.192905, 2.370888, 1, 1, 1, 1, 1,
1.590328, 0.9307356, 1.952623, 1, 1, 1, 1, 1,
1.612932, -0.2295576, 1.052064, 1, 1, 1, 1, 1,
1.625956, 1.208171, 1.266227, 1, 1, 1, 1, 1,
1.640045, -0.5508727, 2.829196, 1, 1, 1, 1, 1,
1.645527, 1.519264, 1.224267, 1, 1, 1, 1, 1,
1.647643, -1.01179, 2.643135, 1, 1, 1, 1, 1,
1.649714, -0.3220261, 1.595623, 1, 1, 1, 1, 1,
1.652013, -0.4255291, 4.882208, 1, 1, 1, 1, 1,
1.663774, -0.2176373, 4.024646, 1, 1, 1, 1, 1,
1.664108, -2.31982, 3.085489, 1, 1, 1, 1, 1,
1.664936, -1.018681, 2.577014, 0, 0, 1, 1, 1,
1.676768, 1.478562, -0.5364863, 1, 0, 0, 1, 1,
1.678658, -2.296081, 3.338106, 1, 0, 0, 1, 1,
1.690739, -0.7017235, 1.504713, 1, 0, 0, 1, 1,
1.698509, 1.102193, 0.2756624, 1, 0, 0, 1, 1,
1.74323, -1.425049, 2.311082, 1, 0, 0, 1, 1,
1.76677, 0.8877273, 2.015974, 0, 0, 0, 1, 1,
1.800584, 1.23533, 2.051474, 0, 0, 0, 1, 1,
1.810752, 0.005994042, 1.559338, 0, 0, 0, 1, 1,
1.813662, -1.195899, 4.224618, 0, 0, 0, 1, 1,
1.817804, 0.2429044, 0.7599662, 0, 0, 0, 1, 1,
1.829427, 1.376768, 2.150594, 0, 0, 0, 1, 1,
1.834566, 0.4078532, 2.266602, 0, 0, 0, 1, 1,
1.863821, 0.814179, 2.423274, 1, 1, 1, 1, 1,
1.87074, 1.168751, 1.33702, 1, 1, 1, 1, 1,
1.873859, 1.21116, 1.918288, 1, 1, 1, 1, 1,
1.902838, 1.015858, 1.527095, 1, 1, 1, 1, 1,
1.96348, 1.035217, 0.9389026, 1, 1, 1, 1, 1,
1.992401, 0.4886016, 3.424818, 1, 1, 1, 1, 1,
2.066724, -0.09703736, 2.572286, 1, 1, 1, 1, 1,
2.078773, -0.1882454, 1.437626, 1, 1, 1, 1, 1,
2.083259, -0.8685311, 1.190277, 1, 1, 1, 1, 1,
2.08938, 0.9995091, 2.070937, 1, 1, 1, 1, 1,
2.127643, 0.2371022, 1.435457, 1, 1, 1, 1, 1,
2.129301, -0.7622731, 3.754704, 1, 1, 1, 1, 1,
2.158503, 0.6396068, 2.026814, 1, 1, 1, 1, 1,
2.161113, 0.241461, 0.2207752, 1, 1, 1, 1, 1,
2.183176, 0.07831751, 3.701435, 1, 1, 1, 1, 1,
2.1978, -1.10362, 0.3983778, 0, 0, 1, 1, 1,
2.201414, 0.05255523, 1.899784, 1, 0, 0, 1, 1,
2.203057, 0.8768763, -0.3315591, 1, 0, 0, 1, 1,
2.204592, 0.80928, 0.9771013, 1, 0, 0, 1, 1,
2.22913, 0.5514526, 0.3976511, 1, 0, 0, 1, 1,
2.25338, 0.1395786, 2.77748, 1, 0, 0, 1, 1,
2.283879, -1.076817, 0.6509916, 0, 0, 0, 1, 1,
2.361109, -0.5493419, 2.201566, 0, 0, 0, 1, 1,
2.401942, -0.5081747, 1.000329, 0, 0, 0, 1, 1,
2.425848, -0.5891572, 1.678131, 0, 0, 0, 1, 1,
2.458258, -2.090965, 2.201866, 0, 0, 0, 1, 1,
2.485934, -0.5843826, 2.643086, 0, 0, 0, 1, 1,
2.524527, 0.8834341, 0.4775527, 0, 0, 0, 1, 1,
2.542912, 0.06706334, 1.156877, 1, 1, 1, 1, 1,
2.614714, -0.3109155, 2.863947, 1, 1, 1, 1, 1,
2.63752, -0.8659, 1.835864, 1, 1, 1, 1, 1,
2.958507, 1.019174, 3.620974, 1, 1, 1, 1, 1,
2.973183, -1.473958, 2.341973, 1, 1, 1, 1, 1,
3.519184, 0.9318871, 2.116481, 1, 1, 1, 1, 1,
3.701276, -0.651567, 1.679858, 1, 1, 1, 1, 1
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
var radius = 9.798143;
var distance = 34.41556;
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
mvMatrix.translate( -0.1470907, -0.1259255, 0.5338266 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41556);
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
