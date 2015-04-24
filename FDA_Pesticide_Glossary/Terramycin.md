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
-3.571536, 0.8459972, -2.407539, 1, 0, 0, 1,
-3.189276, -0.069313, -1.274494, 1, 0.007843138, 0, 1,
-3.097338, -1.722443, -1.610461, 1, 0.01176471, 0, 1,
-2.905734, -0.1916076, -1.507128, 1, 0.01960784, 0, 1,
-2.886395, 2.233674, -1.587448, 1, 0.02352941, 0, 1,
-2.790487, 0.4244817, -0.3823358, 1, 0.03137255, 0, 1,
-2.454038, -1.018652, -0.609947, 1, 0.03529412, 0, 1,
-2.430151, -1.615031, -2.886732, 1, 0.04313726, 0, 1,
-2.401056, -0.5189252, -0.5704582, 1, 0.04705882, 0, 1,
-2.398601, 1.489406, -0.8796551, 1, 0.05490196, 0, 1,
-2.369776, 1.003251, -1.78018, 1, 0.05882353, 0, 1,
-2.364035, 0.3122133, -1.80182, 1, 0.06666667, 0, 1,
-2.357434, -1.812549, -2.675377, 1, 0.07058824, 0, 1,
-2.353452, 0.1181099, -3.341745, 1, 0.07843138, 0, 1,
-2.307034, -0.1985387, -2.212555, 1, 0.08235294, 0, 1,
-2.292277, -1.046573, -2.58668, 1, 0.09019608, 0, 1,
-2.241647, 0.1852704, -1.823707, 1, 0.09411765, 0, 1,
-2.113799, -1.037999, -3.540139, 1, 0.1019608, 0, 1,
-2.099221, 0.2138309, -1.450958, 1, 0.1098039, 0, 1,
-2.093835, -0.890591, -0.278915, 1, 0.1137255, 0, 1,
-2.02094, -0.3707154, 0.001708632, 1, 0.1215686, 0, 1,
-2.012563, -0.6971473, 0.2288768, 1, 0.1254902, 0, 1,
-2.011671, -0.4783689, -3.370846, 1, 0.1333333, 0, 1,
-2.007519, 0.6478459, -1.169685, 1, 0.1372549, 0, 1,
-1.971734, 0.7822665, -0.8625481, 1, 0.145098, 0, 1,
-1.952154, -0.1951877, -0.76402, 1, 0.1490196, 0, 1,
-1.941092, -0.07878766, -2.892779, 1, 0.1568628, 0, 1,
-1.877989, -0.9163533, -2.055753, 1, 0.1607843, 0, 1,
-1.865416, 0.08610649, -3.499144, 1, 0.1686275, 0, 1,
-1.859404, -1.868573, -1.823636, 1, 0.172549, 0, 1,
-1.849389, -1.046579, -2.342995, 1, 0.1803922, 0, 1,
-1.841221, 1.123531, 0.2296795, 1, 0.1843137, 0, 1,
-1.821299, -0.7304597, -1.14536, 1, 0.1921569, 0, 1,
-1.785098, 0.5195382, -3.142427, 1, 0.1960784, 0, 1,
-1.778154, -1.375345, -3.020515, 1, 0.2039216, 0, 1,
-1.739744, 0.1789996, -2.300453, 1, 0.2117647, 0, 1,
-1.737254, -0.8390925, -2.965739, 1, 0.2156863, 0, 1,
-1.734022, 1.105686, 1.190347, 1, 0.2235294, 0, 1,
-1.729673, 0.4308001, 0.1354478, 1, 0.227451, 0, 1,
-1.723028, -1.583383, -0.748051, 1, 0.2352941, 0, 1,
-1.716197, 0.3496921, -2.841293, 1, 0.2392157, 0, 1,
-1.711527, 1.001481, 0.4719727, 1, 0.2470588, 0, 1,
-1.697659, 1.107461, -0.6944075, 1, 0.2509804, 0, 1,
-1.692676, 0.626156, -1.053674, 1, 0.2588235, 0, 1,
-1.68339, 0.007238253, -2.785256, 1, 0.2627451, 0, 1,
-1.641443, 1.318609, -0.152166, 1, 0.2705882, 0, 1,
-1.638774, 0.3242696, -2.585611, 1, 0.2745098, 0, 1,
-1.636612, -0.1861107, -2.674337, 1, 0.282353, 0, 1,
-1.634853, 0.5072723, -0.8712763, 1, 0.2862745, 0, 1,
-1.597878, 0.3444593, -0.9360055, 1, 0.2941177, 0, 1,
-1.592402, -0.6527779, -2.713505, 1, 0.3019608, 0, 1,
-1.589131, -0.3083802, -1.533888, 1, 0.3058824, 0, 1,
-1.581423, 0.3301378, 0.4504347, 1, 0.3137255, 0, 1,
-1.555413, 0.7320451, -0.8792497, 1, 0.3176471, 0, 1,
-1.5469, -0.1530338, -2.443797, 1, 0.3254902, 0, 1,
-1.537756, 0.2730055, 0.9284324, 1, 0.3294118, 0, 1,
-1.537708, 0.9111055, -0.4119795, 1, 0.3372549, 0, 1,
-1.533745, -1.076253, -2.073434, 1, 0.3411765, 0, 1,
-1.495742, -0.7488108, -1.681045, 1, 0.3490196, 0, 1,
-1.484515, 1.043566, -2.275724, 1, 0.3529412, 0, 1,
-1.479871, -1.48982, -2.774851, 1, 0.3607843, 0, 1,
-1.46134, -0.2596022, -1.931035, 1, 0.3647059, 0, 1,
-1.445247, -0.4469504, 0.5853027, 1, 0.372549, 0, 1,
-1.443176, -0.9518939, -1.096497, 1, 0.3764706, 0, 1,
-1.431377, 0.1221338, -1.583468, 1, 0.3843137, 0, 1,
-1.428752, 1.848069, -0.4123126, 1, 0.3882353, 0, 1,
-1.419631, 1.452116, -0.7173463, 1, 0.3960784, 0, 1,
-1.416167, 0.01760221, -2.671122, 1, 0.4039216, 0, 1,
-1.408188, 0.9357923, -0.2281563, 1, 0.4078431, 0, 1,
-1.405774, 1.154717, -2.030941, 1, 0.4156863, 0, 1,
-1.393755, -0.03022021, -2.904791, 1, 0.4196078, 0, 1,
-1.389119, 0.2048346, -0.3810031, 1, 0.427451, 0, 1,
-1.38818, -0.1920367, -0.5958685, 1, 0.4313726, 0, 1,
-1.364684, 0.02757236, -0.4063684, 1, 0.4392157, 0, 1,
-1.364627, 3.162744, -0.3956538, 1, 0.4431373, 0, 1,
-1.361381, -1.995366, -1.027242, 1, 0.4509804, 0, 1,
-1.354584, 0.7285551, 2.317766, 1, 0.454902, 0, 1,
-1.350186, 0.8883446, -0.2174942, 1, 0.4627451, 0, 1,
-1.348833, -0.9261208, -2.280446, 1, 0.4666667, 0, 1,
-1.34746, -2.024215, -3.269559, 1, 0.4745098, 0, 1,
-1.346731, -0.9443326, -3.44696, 1, 0.4784314, 0, 1,
-1.34635, 1.890568, -2.375469, 1, 0.4862745, 0, 1,
-1.34442, -0.03681294, -1.468246, 1, 0.4901961, 0, 1,
-1.333364, 0.4123498, -0.7467211, 1, 0.4980392, 0, 1,
-1.329998, 0.3951142, -1.904346, 1, 0.5058824, 0, 1,
-1.310239, 0.2535779, -1.394279, 1, 0.509804, 0, 1,
-1.309615, -0.3191675, -2.979963, 1, 0.5176471, 0, 1,
-1.306612, -0.0925347, -2.196943, 1, 0.5215687, 0, 1,
-1.300098, -2.234596, -2.848588, 1, 0.5294118, 0, 1,
-1.297182, -1.385549, -1.861162, 1, 0.5333334, 0, 1,
-1.290288, -0.1702713, -0.8935081, 1, 0.5411765, 0, 1,
-1.283812, 0.3719272, -3.536457, 1, 0.5450981, 0, 1,
-1.280665, -0.5991089, -1.098523, 1, 0.5529412, 0, 1,
-1.280601, -0.2459346, -3.158638, 1, 0.5568628, 0, 1,
-1.274147, 0.3235106, -1.184206, 1, 0.5647059, 0, 1,
-1.208946, 0.7278692, -0.7199412, 1, 0.5686275, 0, 1,
-1.206822, -1.128448, -2.63209, 1, 0.5764706, 0, 1,
-1.206372, 0.03020742, -2.774331, 1, 0.5803922, 0, 1,
-1.198559, -0.7046978, -3.437287, 1, 0.5882353, 0, 1,
-1.193699, 1.878209, -0.3081771, 1, 0.5921569, 0, 1,
-1.192672, 0.7869332, -0.5318964, 1, 0.6, 0, 1,
-1.191852, 0.805662, -2.75034, 1, 0.6078432, 0, 1,
-1.191831, 1.650065, -0.4602458, 1, 0.6117647, 0, 1,
-1.189664, 0.2151819, -0.5985281, 1, 0.6196079, 0, 1,
-1.183829, -0.494827, -0.261442, 1, 0.6235294, 0, 1,
-1.182669, 0.6979172, -1.26935, 1, 0.6313726, 0, 1,
-1.18078, -0.5384659, -1.941244, 1, 0.6352941, 0, 1,
-1.176167, -0.02656732, -0.9973914, 1, 0.6431373, 0, 1,
-1.1652, 0.3529637, -0.8822954, 1, 0.6470588, 0, 1,
-1.162297, 0.4604003, -0.06128711, 1, 0.654902, 0, 1,
-1.160682, -0.8903332, -2.80452, 1, 0.6588235, 0, 1,
-1.159627, 0.2917287, -0.001307762, 1, 0.6666667, 0, 1,
-1.157568, 0.3342362, -2.928842, 1, 0.6705883, 0, 1,
-1.139065, -1.226835, -4.076917, 1, 0.6784314, 0, 1,
-1.136509, 0.1819115, -1.659576, 1, 0.682353, 0, 1,
-1.130403, 1.995661, -1.0842, 1, 0.6901961, 0, 1,
-1.130334, -0.19086, -2.28023, 1, 0.6941177, 0, 1,
-1.12993, 0.3933468, 0.1511457, 1, 0.7019608, 0, 1,
-1.1298, -0.7608599, -3.314636, 1, 0.7098039, 0, 1,
-1.117947, 0.4304953, -0.05469563, 1, 0.7137255, 0, 1,
-1.110772, 1.060919, -0.9062175, 1, 0.7215686, 0, 1,
-1.095377, -0.5523574, -0.6595768, 1, 0.7254902, 0, 1,
-1.093287, 0.3063358, -1.03244, 1, 0.7333333, 0, 1,
-1.091675, -0.6719953, -1.124877, 1, 0.7372549, 0, 1,
-1.085694, 1.267886, -1.533266, 1, 0.7450981, 0, 1,
-1.083637, -1.587901, -1.943525, 1, 0.7490196, 0, 1,
-1.080888, 1.595252, -0.3766987, 1, 0.7568628, 0, 1,
-1.076093, 0.5744956, -0.2908645, 1, 0.7607843, 0, 1,
-1.068637, -2.002715, -3.981028, 1, 0.7686275, 0, 1,
-1.058506, -0.9996594, -4.331427, 1, 0.772549, 0, 1,
-1.058416, 0.3544159, -1.68279, 1, 0.7803922, 0, 1,
-1.035506, 1.545372, 0.7726771, 1, 0.7843137, 0, 1,
-1.023911, 0.7169328, -1.006646, 1, 0.7921569, 0, 1,
-1.022315, 0.06579655, -1.763358, 1, 0.7960784, 0, 1,
-1.020814, -0.4439855, -1.450702, 1, 0.8039216, 0, 1,
-1.015304, -1.852421, -2.897207, 1, 0.8117647, 0, 1,
-1.011931, -0.6904877, -2.356157, 1, 0.8156863, 0, 1,
-1.006238, -0.3987811, -2.746705, 1, 0.8235294, 0, 1,
-0.9882771, 0.123535, -0.9638695, 1, 0.827451, 0, 1,
-0.9880395, -0.4323697, -0.5220003, 1, 0.8352941, 0, 1,
-0.985256, -0.05582117, -1.225468, 1, 0.8392157, 0, 1,
-0.9819559, -0.7405159, -1.981045, 1, 0.8470588, 0, 1,
-0.9819394, 0.2487538, -1.325035, 1, 0.8509804, 0, 1,
-0.9791573, -0.7611685, -2.164717, 1, 0.8588235, 0, 1,
-0.976814, -0.5848635, -2.195045, 1, 0.8627451, 0, 1,
-0.9696218, 0.7824428, -2.854705, 1, 0.8705882, 0, 1,
-0.9693338, -1.097235, -2.404938, 1, 0.8745098, 0, 1,
-0.9664502, -1.360827, -3.010914, 1, 0.8823529, 0, 1,
-0.9647417, 0.5836523, -1.858113, 1, 0.8862745, 0, 1,
-0.9585053, -0.5287383, -4.314908, 1, 0.8941177, 0, 1,
-0.9479097, 0.281441, -2.264618, 1, 0.8980392, 0, 1,
-0.9444937, -1.522385, -4.500266, 1, 0.9058824, 0, 1,
-0.9441984, -0.01982605, -1.945825, 1, 0.9137255, 0, 1,
-0.9391888, -0.3438063, -2.415204, 1, 0.9176471, 0, 1,
-0.9365832, -0.3425023, -3.142347, 1, 0.9254902, 0, 1,
-0.9358398, 0.7233027, -0.8974863, 1, 0.9294118, 0, 1,
-0.9331999, -1.03579, -2.020014, 1, 0.9372549, 0, 1,
-0.9287118, 1.074949, -1.271512, 1, 0.9411765, 0, 1,
-0.9255835, -0.8165125, -3.191899, 1, 0.9490196, 0, 1,
-0.9213123, -0.4471514, -2.260335, 1, 0.9529412, 0, 1,
-0.9160324, -0.6555775, -4.064248, 1, 0.9607843, 0, 1,
-0.9015803, 0.1933933, -1.296128, 1, 0.9647059, 0, 1,
-0.9015309, -0.6885989, -1.083085, 1, 0.972549, 0, 1,
-0.8954267, -0.5531614, -2.273386, 1, 0.9764706, 0, 1,
-0.8934792, -0.07416701, -1.526658, 1, 0.9843137, 0, 1,
-0.8917279, 0.1293481, -1.877031, 1, 0.9882353, 0, 1,
-0.8778152, -1.309606, -4.114558, 1, 0.9960784, 0, 1,
-0.8732491, -0.5025164, -2.381074, 0.9960784, 1, 0, 1,
-0.8718106, 0.4700354, -1.488727, 0.9921569, 1, 0, 1,
-0.8695692, 1.168324, -1.515179, 0.9843137, 1, 0, 1,
-0.8677454, 0.3111822, -1.084256, 0.9803922, 1, 0, 1,
-0.8630746, 0.2115408, -1.020684, 0.972549, 1, 0, 1,
-0.8515439, -1.758338, -2.304799, 0.9686275, 1, 0, 1,
-0.8498574, -0.6959743, -3.344481, 0.9607843, 1, 0, 1,
-0.8450266, -1.015361, -3.69751, 0.9568627, 1, 0, 1,
-0.8434795, -0.2232707, -0.7103196, 0.9490196, 1, 0, 1,
-0.8419464, 0.4670912, 0.5946216, 0.945098, 1, 0, 1,
-0.8399698, -1.301071, -1.550535, 0.9372549, 1, 0, 1,
-0.837335, 0.9823532, -0.3186305, 0.9333333, 1, 0, 1,
-0.8340457, -0.2400598, -2.115962, 0.9254902, 1, 0, 1,
-0.8337613, 2.271368, -0.934364, 0.9215686, 1, 0, 1,
-0.832629, -0.0939263, -1.498546, 0.9137255, 1, 0, 1,
-0.8312177, 0.4897916, -2.902366, 0.9098039, 1, 0, 1,
-0.8301287, 2.164724, -0.4563314, 0.9019608, 1, 0, 1,
-0.8283418, -1.703246, -2.800688, 0.8941177, 1, 0, 1,
-0.8222395, 0.7980497, -1.63726, 0.8901961, 1, 0, 1,
-0.8215344, 0.9496434, -1.0187, 0.8823529, 1, 0, 1,
-0.8181795, -1.365404, -2.965568, 0.8784314, 1, 0, 1,
-0.8176705, 1.107406, 0.2222365, 0.8705882, 1, 0, 1,
-0.8156387, -1.480909, -3.917755, 0.8666667, 1, 0, 1,
-0.8139025, 2.106048, 0.612512, 0.8588235, 1, 0, 1,
-0.8122311, 1.56827, -2.280302, 0.854902, 1, 0, 1,
-0.8067352, 0.7281547, -1.438741, 0.8470588, 1, 0, 1,
-0.8043175, 1.306114, -1.416103, 0.8431373, 1, 0, 1,
-0.8025765, -2.27011, -3.253996, 0.8352941, 1, 0, 1,
-0.8006403, -0.792666, -3.828065, 0.8313726, 1, 0, 1,
-0.7998975, 3.156719, 0.8251563, 0.8235294, 1, 0, 1,
-0.7982794, -0.01585029, -3.898597, 0.8196079, 1, 0, 1,
-0.7938472, 0.8525194, -0.9927865, 0.8117647, 1, 0, 1,
-0.7936934, 0.0232114, -1.949918, 0.8078431, 1, 0, 1,
-0.7906309, -1.076135, -2.675485, 0.8, 1, 0, 1,
-0.7901628, -2.326471, -3.379733, 0.7921569, 1, 0, 1,
-0.7897022, -1.396672, -5.230417, 0.7882353, 1, 0, 1,
-0.7835417, 1.182328, -0.4115656, 0.7803922, 1, 0, 1,
-0.7785424, -1.086101, -6.239012, 0.7764706, 1, 0, 1,
-0.7732757, 2.034125, -0.9395491, 0.7686275, 1, 0, 1,
-0.7731707, 0.5365626, -3.043681, 0.7647059, 1, 0, 1,
-0.7711192, -0.6163586, -1.268964, 0.7568628, 1, 0, 1,
-0.7648204, -0.4177791, -1.854205, 0.7529412, 1, 0, 1,
-0.7622697, 0.01531468, -1.823328, 0.7450981, 1, 0, 1,
-0.7607352, 1.593828, 1.738752, 0.7411765, 1, 0, 1,
-0.7589289, -0.10054, -2.667852, 0.7333333, 1, 0, 1,
-0.7549375, -0.1026837, -1.491477, 0.7294118, 1, 0, 1,
-0.7502409, -0.2576984, -2.189095, 0.7215686, 1, 0, 1,
-0.7433395, 0.9573849, -0.1879463, 0.7176471, 1, 0, 1,
-0.7376907, 0.07794076, -2.371227, 0.7098039, 1, 0, 1,
-0.7284275, -0.2958451, -3.107017, 0.7058824, 1, 0, 1,
-0.7281843, -0.733458, -1.820116, 0.6980392, 1, 0, 1,
-0.7274277, -0.2172014, -1.499053, 0.6901961, 1, 0, 1,
-0.7245688, -0.2079175, -1.322497, 0.6862745, 1, 0, 1,
-0.7231768, 1.025443, 0.406945, 0.6784314, 1, 0, 1,
-0.722334, 1.231739, 0.4164179, 0.6745098, 1, 0, 1,
-0.7203331, 0.06654982, -2.414306, 0.6666667, 1, 0, 1,
-0.7193263, -0.8304639, -1.352737, 0.6627451, 1, 0, 1,
-0.7131661, 1.067899, -1.108056, 0.654902, 1, 0, 1,
-0.7128842, -0.5485181, -1.195702, 0.6509804, 1, 0, 1,
-0.7101154, 0.3804837, -2.571105, 0.6431373, 1, 0, 1,
-0.7014832, -1.006476, -3.968715, 0.6392157, 1, 0, 1,
-0.6968556, -1.191596, -2.633208, 0.6313726, 1, 0, 1,
-0.69288, 1.371503, -1.209059, 0.627451, 1, 0, 1,
-0.689097, -0.05958506, -0.9782842, 0.6196079, 1, 0, 1,
-0.6870889, -0.005870979, -1.198339, 0.6156863, 1, 0, 1,
-0.6842039, -0.9611532, -3.350829, 0.6078432, 1, 0, 1,
-0.6832837, 1.092761, -1.223912, 0.6039216, 1, 0, 1,
-0.6830089, -1.385752, -2.374963, 0.5960785, 1, 0, 1,
-0.67782, -0.1236238, -1.741424, 0.5882353, 1, 0, 1,
-0.6734184, -0.5717872, -2.841902, 0.5843138, 1, 0, 1,
-0.671026, 0.3925321, -2.154821, 0.5764706, 1, 0, 1,
-0.6697206, -1.092043, -3.051679, 0.572549, 1, 0, 1,
-0.6694025, -0.1272168, -2.010931, 0.5647059, 1, 0, 1,
-0.6625272, -0.06123151, -1.650915, 0.5607843, 1, 0, 1,
-0.6616149, -0.7881064, -1.813696, 0.5529412, 1, 0, 1,
-0.6599457, 0.1361407, -1.415393, 0.5490196, 1, 0, 1,
-0.6536021, 1.747668, -0.8324388, 0.5411765, 1, 0, 1,
-0.6526766, 0.01180347, -2.336674, 0.5372549, 1, 0, 1,
-0.6498635, -3.230963, -3.464487, 0.5294118, 1, 0, 1,
-0.6494497, 0.577662, -1.751781, 0.5254902, 1, 0, 1,
-0.6487767, -0.03485466, -0.1559938, 0.5176471, 1, 0, 1,
-0.6481214, 0.8516108, -0.9066136, 0.5137255, 1, 0, 1,
-0.6478127, -0.4904327, -0.7122149, 0.5058824, 1, 0, 1,
-0.6455956, -0.8083063, -2.340751, 0.5019608, 1, 0, 1,
-0.6434963, 0.8695, -0.2604422, 0.4941176, 1, 0, 1,
-0.641209, -0.4606665, 0.453988, 0.4862745, 1, 0, 1,
-0.6396157, -2.607595, -2.7054, 0.4823529, 1, 0, 1,
-0.6370507, -0.8564546, -3.470201, 0.4745098, 1, 0, 1,
-0.632604, 0.9044838, 0.3348617, 0.4705882, 1, 0, 1,
-0.6320779, 0.6758342, -0.1747601, 0.4627451, 1, 0, 1,
-0.6307162, 0.7609575, -1.214848, 0.4588235, 1, 0, 1,
-0.6293561, 1.209099, -0.06187779, 0.4509804, 1, 0, 1,
-0.6291388, -0.5867314, -2.304727, 0.4470588, 1, 0, 1,
-0.6290174, 0.4019433, -1.013878, 0.4392157, 1, 0, 1,
-0.6289716, 0.9974577, -1.575239, 0.4352941, 1, 0, 1,
-0.6287884, 0.8709891, 0.1355492, 0.427451, 1, 0, 1,
-0.62492, -0.7503222, -1.781882, 0.4235294, 1, 0, 1,
-0.6205614, 0.644155, -1.979054, 0.4156863, 1, 0, 1,
-0.6158892, 0.3319455, -0.3557606, 0.4117647, 1, 0, 1,
-0.6139395, 2.05638, 0.3904401, 0.4039216, 1, 0, 1,
-0.613553, 0.09904631, -1.162418, 0.3960784, 1, 0, 1,
-0.6074409, 0.1983612, -0.9743264, 0.3921569, 1, 0, 1,
-0.6072041, -1.386113, -2.205898, 0.3843137, 1, 0, 1,
-0.602783, 1.116173, -1.909289, 0.3803922, 1, 0, 1,
-0.6024868, 1.647232, 0.6514716, 0.372549, 1, 0, 1,
-0.5995446, -1.090658, -1.872307, 0.3686275, 1, 0, 1,
-0.5947555, -0.2432311, -1.32344, 0.3607843, 1, 0, 1,
-0.5910754, -0.8418172, -2.317604, 0.3568628, 1, 0, 1,
-0.5901645, -0.001056765, -0.830362, 0.3490196, 1, 0, 1,
-0.5884589, -0.3127097, -2.521366, 0.345098, 1, 0, 1,
-0.5883702, -0.4604961, -2.577847, 0.3372549, 1, 0, 1,
-0.5870643, -1.115272, -2.741396, 0.3333333, 1, 0, 1,
-0.5866336, 0.4064361, -0.01027149, 0.3254902, 1, 0, 1,
-0.5866067, -1.012089, -1.909105, 0.3215686, 1, 0, 1,
-0.5815762, -0.6945186, -1.820165, 0.3137255, 1, 0, 1,
-0.5771657, 0.4975, -1.040202, 0.3098039, 1, 0, 1,
-0.5759667, -0.6674484, -2.745306, 0.3019608, 1, 0, 1,
-0.5747759, 0.2212015, -2.678756, 0.2941177, 1, 0, 1,
-0.5683658, 1.203015, 1.254908, 0.2901961, 1, 0, 1,
-0.562065, 1.062742, -0.5567774, 0.282353, 1, 0, 1,
-0.5615925, 0.3167955, -0.9159086, 0.2784314, 1, 0, 1,
-0.5610204, 0.562196, 0.0427783, 0.2705882, 1, 0, 1,
-0.5575276, 0.8881342, -0.3022969, 0.2666667, 1, 0, 1,
-0.5572971, 0.2516501, -1.371811, 0.2588235, 1, 0, 1,
-0.5568733, 0.3682709, -2.377904, 0.254902, 1, 0, 1,
-0.5563505, 0.6975535, -0.624079, 0.2470588, 1, 0, 1,
-0.5547101, 0.6373205, -2.586052, 0.2431373, 1, 0, 1,
-0.5511984, 0.1258134, -0.791998, 0.2352941, 1, 0, 1,
-0.5471679, 0.6362542, -0.5480638, 0.2313726, 1, 0, 1,
-0.5418807, 0.9296028, -1.349518, 0.2235294, 1, 0, 1,
-0.5363721, 0.6086624, -0.6065387, 0.2196078, 1, 0, 1,
-0.5327865, 1.380567, -0.9379378, 0.2117647, 1, 0, 1,
-0.5322575, 0.08592524, -1.495405, 0.2078431, 1, 0, 1,
-0.5320083, -1.017421, -1.517658, 0.2, 1, 0, 1,
-0.5282715, -1.281627, -2.754487, 0.1921569, 1, 0, 1,
-0.5279171, 0.7493058, 0.7696461, 0.1882353, 1, 0, 1,
-0.5259293, -1.523786, -1.810332, 0.1803922, 1, 0, 1,
-0.5183439, -2.372605, -3.361423, 0.1764706, 1, 0, 1,
-0.5122562, 1.294438, 0.7146853, 0.1686275, 1, 0, 1,
-0.5096411, 0.2095311, -0.1071262, 0.1647059, 1, 0, 1,
-0.5070654, 0.8332487, -0.0115182, 0.1568628, 1, 0, 1,
-0.5036262, -3.740248, -3.339687, 0.1529412, 1, 0, 1,
-0.5024552, 0.3054385, -0.4746559, 0.145098, 1, 0, 1,
-0.5012559, 0.542758, -0.9302439, 0.1411765, 1, 0, 1,
-0.4991043, 2.61484, -0.268783, 0.1333333, 1, 0, 1,
-0.4949446, 1.87305, 1.585204, 0.1294118, 1, 0, 1,
-0.4942344, -1.048064, -2.143086, 0.1215686, 1, 0, 1,
-0.4920614, -0.4785022, -0.770204, 0.1176471, 1, 0, 1,
-0.4834355, 0.9883323, 0.8420456, 0.1098039, 1, 0, 1,
-0.4815222, 1.267409, 1.38188, 0.1058824, 1, 0, 1,
-0.4813049, 1.058229, 0.4980431, 0.09803922, 1, 0, 1,
-0.4804854, -0.5507543, -2.464824, 0.09019608, 1, 0, 1,
-0.4801634, -1.741219, -1.978033, 0.08627451, 1, 0, 1,
-0.4742708, -0.4417482, -2.480226, 0.07843138, 1, 0, 1,
-0.4737723, -0.1623548, -1.5954, 0.07450981, 1, 0, 1,
-0.4685778, 0.3307414, -2.429151, 0.06666667, 1, 0, 1,
-0.4666036, 0.7431954, 0.1675944, 0.0627451, 1, 0, 1,
-0.464223, 1.725682, -2.003984, 0.05490196, 1, 0, 1,
-0.4633526, 1.521759, -0.1740273, 0.05098039, 1, 0, 1,
-0.4617345, 1.370301, -0.248216, 0.04313726, 1, 0, 1,
-0.4610838, -2.030002, -3.156435, 0.03921569, 1, 0, 1,
-0.4598885, 1.031434, 0.6762233, 0.03137255, 1, 0, 1,
-0.4556331, -0.7569466, -1.354529, 0.02745098, 1, 0, 1,
-0.4555035, 0.8948125, 2.057033, 0.01960784, 1, 0, 1,
-0.4503768, -0.7501256, -4.112569, 0.01568628, 1, 0, 1,
-0.4503579, -0.02970277, -0.7830494, 0.007843138, 1, 0, 1,
-0.4497474, 2.446507, 0.1996886, 0.003921569, 1, 0, 1,
-0.4449983, 0.6245478, -0.04981435, 0, 1, 0.003921569, 1,
-0.4383993, 1.371996, -0.241894, 0, 1, 0.01176471, 1,
-0.433722, 1.394542, -0.3000866, 0, 1, 0.01568628, 1,
-0.4311651, 0.2930868, -1.440729, 0, 1, 0.02352941, 1,
-0.4291142, -0.2778114, -2.213275, 0, 1, 0.02745098, 1,
-0.4223256, 0.04130785, -2.172043, 0, 1, 0.03529412, 1,
-0.4190699, 0.6621172, 0.1581056, 0, 1, 0.03921569, 1,
-0.4181885, 1.342053, -0.7658316, 0, 1, 0.04705882, 1,
-0.4101739, -0.666081, -2.432025, 0, 1, 0.05098039, 1,
-0.4059339, 0.02368122, -0.6498331, 0, 1, 0.05882353, 1,
-0.405417, 0.04199234, -0.6125643, 0, 1, 0.0627451, 1,
-0.4049062, 0.03302243, 0.290358, 0, 1, 0.07058824, 1,
-0.4045678, 0.9609936, -0.6032102, 0, 1, 0.07450981, 1,
-0.4041586, 0.5086727, -1.46285, 0, 1, 0.08235294, 1,
-0.4021566, 0.3835209, -0.4825723, 0, 1, 0.08627451, 1,
-0.401116, 1.428029, -0.6087358, 0, 1, 0.09411765, 1,
-0.3975641, -0.7268025, -4.365678, 0, 1, 0.1019608, 1,
-0.3967145, -1.83248, -2.673221, 0, 1, 0.1058824, 1,
-0.3943563, 0.1302782, -1.220603, 0, 1, 0.1137255, 1,
-0.3935224, -0.03236136, -1.422427, 0, 1, 0.1176471, 1,
-0.3914984, 0.5311175, -1.560237, 0, 1, 0.1254902, 1,
-0.3802535, -1.147005, -1.876748, 0, 1, 0.1294118, 1,
-0.379276, 0.6460775, -0.08839269, 0, 1, 0.1372549, 1,
-0.3728501, 0.1015437, -1.331639, 0, 1, 0.1411765, 1,
-0.3703732, -0.5187595, -3.028466, 0, 1, 0.1490196, 1,
-0.3657536, -0.6308458, -3.547379, 0, 1, 0.1529412, 1,
-0.3618563, -1.498224, -4.007973, 0, 1, 0.1607843, 1,
-0.3601007, -0.8205656, -1.613626, 0, 1, 0.1647059, 1,
-0.3598129, 1.009315, -0.810708, 0, 1, 0.172549, 1,
-0.359577, 1.403169, -0.701456, 0, 1, 0.1764706, 1,
-0.3577418, -0.3106229, -2.108615, 0, 1, 0.1843137, 1,
-0.3543804, 0.06368916, -0.9165871, 0, 1, 0.1882353, 1,
-0.3501782, 0.5323529, -0.9143253, 0, 1, 0.1960784, 1,
-0.349644, 0.999607, 0.6473282, 0, 1, 0.2039216, 1,
-0.3446655, -1.136703, -3.5422, 0, 1, 0.2078431, 1,
-0.3407417, 0.5666992, 0.9921152, 0, 1, 0.2156863, 1,
-0.3281657, -2.202828, -3.103918, 0, 1, 0.2196078, 1,
-0.3276433, 0.09000298, -0.4440838, 0, 1, 0.227451, 1,
-0.3243361, -0.6477135, -2.002898, 0, 1, 0.2313726, 1,
-0.3238332, 1.307636, -0.6558433, 0, 1, 0.2392157, 1,
-0.3222445, 0.3323123, -1.933588, 0, 1, 0.2431373, 1,
-0.3207118, 0.08745144, -1.390945, 0, 1, 0.2509804, 1,
-0.3179016, -0.2798077, -4.226788, 0, 1, 0.254902, 1,
-0.3017871, 2.316074, 1.147534, 0, 1, 0.2627451, 1,
-0.3004736, -0.2132642, -0.7909253, 0, 1, 0.2666667, 1,
-0.299861, -1.37459, -2.091421, 0, 1, 0.2745098, 1,
-0.2973902, 0.6651577, -0.205965, 0, 1, 0.2784314, 1,
-0.2913212, -0.5107397, -2.609237, 0, 1, 0.2862745, 1,
-0.2883359, 2.019432, -0.6550571, 0, 1, 0.2901961, 1,
-0.2882141, 0.330887, -1.285687, 0, 1, 0.2980392, 1,
-0.2775592, -0.4514596, -3.046787, 0, 1, 0.3058824, 1,
-0.2753453, -0.8372883, -1.792298, 0, 1, 0.3098039, 1,
-0.2750363, -1.24724, -3.163362, 0, 1, 0.3176471, 1,
-0.2733745, 0.1941261, 0.9427312, 0, 1, 0.3215686, 1,
-0.272735, -1.175372, -3.612329, 0, 1, 0.3294118, 1,
-0.2706837, 0.4398059, -1.057898, 0, 1, 0.3333333, 1,
-0.2692531, -1.11917, -2.651769, 0, 1, 0.3411765, 1,
-0.2685738, 0.1500238, 0.1843661, 0, 1, 0.345098, 1,
-0.2683867, -0.4558428, -3.610822, 0, 1, 0.3529412, 1,
-0.2672029, 0.2105002, -0.717304, 0, 1, 0.3568628, 1,
-0.248443, -0.5515691, -3.501856, 0, 1, 0.3647059, 1,
-0.2413843, -2.675204, -3.402532, 0, 1, 0.3686275, 1,
-0.2410943, -0.6314154, -5.078277, 0, 1, 0.3764706, 1,
-0.2402155, -1.099117, -3.851667, 0, 1, 0.3803922, 1,
-0.2391265, 1.042465, 0.4273803, 0, 1, 0.3882353, 1,
-0.236487, 1.104699, 0.122672, 0, 1, 0.3921569, 1,
-0.235397, 0.06910928, -1.302761, 0, 1, 0.4, 1,
-0.2234691, 1.523197, 0.1990092, 0, 1, 0.4078431, 1,
-0.2230058, 0.3356336, -0.2895634, 0, 1, 0.4117647, 1,
-0.2218133, 1.236088, -1.468772, 0, 1, 0.4196078, 1,
-0.2202785, -0.168657, -3.428075, 0, 1, 0.4235294, 1,
-0.2192142, 0.7191993, -1.583088, 0, 1, 0.4313726, 1,
-0.2173265, 1.887592, 0.6328374, 0, 1, 0.4352941, 1,
-0.2153143, 0.2474632, 1.816511, 0, 1, 0.4431373, 1,
-0.208771, -1.548529, -3.756073, 0, 1, 0.4470588, 1,
-0.2085155, 2.2788, -0.09712293, 0, 1, 0.454902, 1,
-0.2018853, 0.2597061, -0.3594782, 0, 1, 0.4588235, 1,
-0.2015459, -0.7135455, -1.876768, 0, 1, 0.4666667, 1,
-0.1986698, -0.6109882, -5.176612, 0, 1, 0.4705882, 1,
-0.1967814, 1.46896, -0.6507506, 0, 1, 0.4784314, 1,
-0.1959381, -0.1816634, -0.1248947, 0, 1, 0.4823529, 1,
-0.1935763, 0.5063642, 0.4321023, 0, 1, 0.4901961, 1,
-0.1927336, 0.1598273, -0.5888342, 0, 1, 0.4941176, 1,
-0.1896644, 0.8853101, -0.3571297, 0, 1, 0.5019608, 1,
-0.1887135, 0.760418, 1.550516, 0, 1, 0.509804, 1,
-0.1881621, -0.8581954, -3.462132, 0, 1, 0.5137255, 1,
-0.1879354, -1.352394, -2.161872, 0, 1, 0.5215687, 1,
-0.1871504, 0.1724649, -1.816092, 0, 1, 0.5254902, 1,
-0.186431, -0.03087386, -1.839129, 0, 1, 0.5333334, 1,
-0.1825608, -0.5644252, -3.582656, 0, 1, 0.5372549, 1,
-0.1808306, -0.08570009, -2.346035, 0, 1, 0.5450981, 1,
-0.1781301, -0.1007619, -2.867612, 0, 1, 0.5490196, 1,
-0.1780324, 0.01734016, -1.428117, 0, 1, 0.5568628, 1,
-0.1778379, 1.019473, 0.9420386, 0, 1, 0.5607843, 1,
-0.1731473, -1.694449, -2.881267, 0, 1, 0.5686275, 1,
-0.171629, -1.103726, -3.410485, 0, 1, 0.572549, 1,
-0.1686233, -0.8693037, -0.6677213, 0, 1, 0.5803922, 1,
-0.1645222, 0.8378166, -0.7841569, 0, 1, 0.5843138, 1,
-0.1623112, -2.290189, -3.95889, 0, 1, 0.5921569, 1,
-0.1610873, 0.475344, -1.075614, 0, 1, 0.5960785, 1,
-0.1587486, -0.2948486, -2.994688, 0, 1, 0.6039216, 1,
-0.1572852, 0.6601351, 0.405169, 0, 1, 0.6117647, 1,
-0.1568929, -0.1261954, -1.581993, 0, 1, 0.6156863, 1,
-0.1560013, -0.4039993, -3.021845, 0, 1, 0.6235294, 1,
-0.154993, 2.222767, -0.7966615, 0, 1, 0.627451, 1,
-0.1536225, -1.20573, -3.399543, 0, 1, 0.6352941, 1,
-0.152225, -0.38552, -3.361293, 0, 1, 0.6392157, 1,
-0.1519089, 0.5917655, -2.477887, 0, 1, 0.6470588, 1,
-0.1504294, -2.193346, -2.683687, 0, 1, 0.6509804, 1,
-0.1499393, -0.3387066, -4.725367, 0, 1, 0.6588235, 1,
-0.1496039, -0.5484573, -3.205235, 0, 1, 0.6627451, 1,
-0.1400206, 0.1288185, 0.9271945, 0, 1, 0.6705883, 1,
-0.1392979, -1.400944, -3.495469, 0, 1, 0.6745098, 1,
-0.1367426, 0.1805326, -0.4336661, 0, 1, 0.682353, 1,
-0.1296636, 1.85062, -0.03182262, 0, 1, 0.6862745, 1,
-0.1220523, 1.103449, -1.517397, 0, 1, 0.6941177, 1,
-0.119158, 1.041611, -1.702006, 0, 1, 0.7019608, 1,
-0.1137138, 1.668878, 2.377443, 0, 1, 0.7058824, 1,
-0.1127407, 0.6897389, 0.1961773, 0, 1, 0.7137255, 1,
-0.1093712, -0.4278222, -3.333736, 0, 1, 0.7176471, 1,
-0.1090362, -0.3633861, 0.1179493, 0, 1, 0.7254902, 1,
-0.1071613, -1.617003, -1.15892, 0, 1, 0.7294118, 1,
-0.1038164, 1.762207, -0.4316403, 0, 1, 0.7372549, 1,
-0.1033816, 1.586969, 1.255875, 0, 1, 0.7411765, 1,
-0.09605691, -0.6175527, -5.188752, 0, 1, 0.7490196, 1,
-0.09342293, 1.176502, -2.317548, 0, 1, 0.7529412, 1,
-0.09126878, -0.06013061, -2.043249, 0, 1, 0.7607843, 1,
-0.08943943, 0.5944532, -0.5434685, 0, 1, 0.7647059, 1,
-0.08488446, 0.9117792, 1.024341, 0, 1, 0.772549, 1,
-0.08458899, 0.2789481, -1.230514, 0, 1, 0.7764706, 1,
-0.08304759, 0.9804549, -1.779551, 0, 1, 0.7843137, 1,
-0.07904521, 0.7517779, 0.1917257, 0, 1, 0.7882353, 1,
-0.07721693, 0.9941812, 1.448732, 0, 1, 0.7960784, 1,
-0.07249095, 0.2216413, -0.2292969, 0, 1, 0.8039216, 1,
-0.06654462, -0.4214294, -2.539221, 0, 1, 0.8078431, 1,
-0.06595388, -0.674673, -2.492275, 0, 1, 0.8156863, 1,
-0.05743011, 1.001143, -0.1655784, 0, 1, 0.8196079, 1,
-0.05430711, -0.4966561, -2.338412, 0, 1, 0.827451, 1,
-0.04131132, 0.2121169, 0.2714741, 0, 1, 0.8313726, 1,
-0.04063743, -0.01382237, -0.5266513, 0, 1, 0.8392157, 1,
-0.03950553, -0.571599, -2.895603, 0, 1, 0.8431373, 1,
-0.03631334, -0.8278733, -2.946253, 0, 1, 0.8509804, 1,
-0.0350499, 0.4900469, 0.2710379, 0, 1, 0.854902, 1,
-0.03077821, 0.1756452, -2.936107, 0, 1, 0.8627451, 1,
-0.02951605, -2.059885, -1.345386, 0, 1, 0.8666667, 1,
-0.02929894, -0.9765689, -3.621115, 0, 1, 0.8745098, 1,
-0.02723282, 0.7136534, 1.008814, 0, 1, 0.8784314, 1,
-0.02186143, -0.443218, -2.459233, 0, 1, 0.8862745, 1,
-0.02012584, 0.4202321, -2.621736, 0, 1, 0.8901961, 1,
-0.01980075, -1.456007, -4.140788, 0, 1, 0.8980392, 1,
-0.01741254, -1.060617, -3.552457, 0, 1, 0.9058824, 1,
-0.0146075, -0.262633, -3.460282, 0, 1, 0.9098039, 1,
-0.01297788, -0.8787624, -2.02359, 0, 1, 0.9176471, 1,
-0.007598932, 1.151209, -0.8639533, 0, 1, 0.9215686, 1,
-0.005057889, -0.8456602, -2.908015, 0, 1, 0.9294118, 1,
-0.001895396, 2.003908, 0.30372, 0, 1, 0.9333333, 1,
-0.001182949, -1.207723, -1.760398, 0, 1, 0.9411765, 1,
0.000217959, 0.4413552, -0.9187828, 0, 1, 0.945098, 1,
0.0004179331, -0.3326518, 2.330473, 0, 1, 0.9529412, 1,
0.001887188, -1.024499, 3.066984, 0, 1, 0.9568627, 1,
0.01695015, -1.07464, 3.83313, 0, 1, 0.9647059, 1,
0.02103852, -0.1770309, 3.994731, 0, 1, 0.9686275, 1,
0.02187571, -1.63679, 1.613555, 0, 1, 0.9764706, 1,
0.02604471, 0.9209087, 0.7742438, 0, 1, 0.9803922, 1,
0.02767329, -0.1881476, 2.11684, 0, 1, 0.9882353, 1,
0.02837742, 2.266526, 1.5682, 0, 1, 0.9921569, 1,
0.02848118, 1.132986, 0.5509568, 0, 1, 1, 1,
0.02938954, 1.363484, 0.5075975, 0, 0.9921569, 1, 1,
0.03060279, 1.16143, 1.546948, 0, 0.9882353, 1, 1,
0.03179365, -0.6472965, 1.781991, 0, 0.9803922, 1, 1,
0.03831238, -0.3426329, 3.314632, 0, 0.9764706, 1, 1,
0.03914629, -0.01210148, 1.713482, 0, 0.9686275, 1, 1,
0.03995375, 0.9450197, 1.131282, 0, 0.9647059, 1, 1,
0.04161076, 0.3792385, -0.3136629, 0, 0.9568627, 1, 1,
0.04166927, 1.256329, -1.68131, 0, 0.9529412, 1, 1,
0.04362046, 0.2699301, 0.8362707, 0, 0.945098, 1, 1,
0.04774961, 1.269717, 0.8908635, 0, 0.9411765, 1, 1,
0.04966516, -0.8485956, 4.967972, 0, 0.9333333, 1, 1,
0.0565716, 0.8529028, 1.885037, 0, 0.9294118, 1, 1,
0.05978006, -0.3791205, 1.593071, 0, 0.9215686, 1, 1,
0.06057278, -0.9197072, 4.086553, 0, 0.9176471, 1, 1,
0.06094756, -0.5169402, 3.219106, 0, 0.9098039, 1, 1,
0.06128273, 1.441314, 1.523711, 0, 0.9058824, 1, 1,
0.06224031, -0.1616599, 3.286045, 0, 0.8980392, 1, 1,
0.06322645, 0.818309, 0.9347665, 0, 0.8901961, 1, 1,
0.07032224, 0.1075664, 1.970129, 0, 0.8862745, 1, 1,
0.07666215, -0.6872221, 4.464001, 0, 0.8784314, 1, 1,
0.07713754, 0.5325664, 0.106613, 0, 0.8745098, 1, 1,
0.08589152, 0.7828004, 0.7169275, 0, 0.8666667, 1, 1,
0.08623458, 0.6588939, 0.5131889, 0, 0.8627451, 1, 1,
0.08652902, 0.1359657, 1.012878, 0, 0.854902, 1, 1,
0.09128707, -1.386433, 3.17425, 0, 0.8509804, 1, 1,
0.0932695, 1.238756, -0.8273165, 0, 0.8431373, 1, 1,
0.09538098, -0.06523042, 1.543459, 0, 0.8392157, 1, 1,
0.09701677, -0.748293, 1.936401, 0, 0.8313726, 1, 1,
0.09729282, 0.5213403, 0.004190502, 0, 0.827451, 1, 1,
0.1011606, 0.9729659, 0.1864644, 0, 0.8196079, 1, 1,
0.1059121, 1.439547, -0.2723996, 0, 0.8156863, 1, 1,
0.1059424, -0.5564139, 4.044745, 0, 0.8078431, 1, 1,
0.1106447, -0.7493632, 3.68263, 0, 0.8039216, 1, 1,
0.1131749, -0.7110801, 1.485766, 0, 0.7960784, 1, 1,
0.1178906, -0.6671956, 2.838766, 0, 0.7882353, 1, 1,
0.1183647, 0.8579888, -0.6117972, 0, 0.7843137, 1, 1,
0.119658, -0.2168578, 2.926853, 0, 0.7764706, 1, 1,
0.1213814, 1.829593, 0.1478793, 0, 0.772549, 1, 1,
0.1218176, 0.4040124, -0.5833783, 0, 0.7647059, 1, 1,
0.1239487, 0.8019407, 1.407686, 0, 0.7607843, 1, 1,
0.1244422, -0.1474686, 2.394297, 0, 0.7529412, 1, 1,
0.1281241, 0.5808623, 1.311824, 0, 0.7490196, 1, 1,
0.1289522, 0.721357, -1.230106, 0, 0.7411765, 1, 1,
0.1388722, -0.1632487, 2.707104, 0, 0.7372549, 1, 1,
0.1405361, 1.499003, 0.2499309, 0, 0.7294118, 1, 1,
0.1433722, -0.28528, 2.741039, 0, 0.7254902, 1, 1,
0.1531356, -0.2015072, 3.090577, 0, 0.7176471, 1, 1,
0.1545, 1.229694, -0.03639023, 0, 0.7137255, 1, 1,
0.1632058, 0.5148444, -0.9714574, 0, 0.7058824, 1, 1,
0.1632925, -2.367722, 5.097535, 0, 0.6980392, 1, 1,
0.1655158, -0.1480344, 0.8892629, 0, 0.6941177, 1, 1,
0.166283, -1.221725, 2.989799, 0, 0.6862745, 1, 1,
0.1672869, -1.625396, 4.489491, 0, 0.682353, 1, 1,
0.1709089, 1.208752, -0.8946375, 0, 0.6745098, 1, 1,
0.1747486, 0.6507881, 1.527889, 0, 0.6705883, 1, 1,
0.1751198, 1.388883, -0.08817867, 0, 0.6627451, 1, 1,
0.1761511, -2.086266, 4.21664, 0, 0.6588235, 1, 1,
0.1814647, 0.071164, 1.732086, 0, 0.6509804, 1, 1,
0.1817676, -0.2900272, 2.887302, 0, 0.6470588, 1, 1,
0.1820323, -1.961169, 2.154956, 0, 0.6392157, 1, 1,
0.1851773, -2.752485, 1.903432, 0, 0.6352941, 1, 1,
0.1858312, -0.01203031, 2.319616, 0, 0.627451, 1, 1,
0.1899612, -0.02131254, 1.814197, 0, 0.6235294, 1, 1,
0.1900392, 0.2734448, -0.6603753, 0, 0.6156863, 1, 1,
0.1924636, -1.309804, 4.168609, 0, 0.6117647, 1, 1,
0.1937499, -0.4503884, 3.123117, 0, 0.6039216, 1, 1,
0.1949844, -0.3366005, 2.617884, 0, 0.5960785, 1, 1,
0.1964392, 0.5475405, 0.04793888, 0, 0.5921569, 1, 1,
0.2014876, -0.6335691, 3.471128, 0, 0.5843138, 1, 1,
0.2039533, 0.03853416, 2.51723, 0, 0.5803922, 1, 1,
0.2062168, 0.885586, -1.275428, 0, 0.572549, 1, 1,
0.2070214, -0.3774217, 3.879095, 0, 0.5686275, 1, 1,
0.2117557, 0.1387783, 0.08142704, 0, 0.5607843, 1, 1,
0.2118547, 0.3169121, -0.4045964, 0, 0.5568628, 1, 1,
0.2123964, -1.167299, 1.529904, 0, 0.5490196, 1, 1,
0.2124992, -0.05248781, 1.011443, 0, 0.5450981, 1, 1,
0.2155811, -0.2033687, 3.055565, 0, 0.5372549, 1, 1,
0.2179591, 0.279389, -1.129403, 0, 0.5333334, 1, 1,
0.2204766, 0.7773494, -0.03669345, 0, 0.5254902, 1, 1,
0.2301688, -0.3924519, 2.233746, 0, 0.5215687, 1, 1,
0.2308948, 0.2444121, 0.3170381, 0, 0.5137255, 1, 1,
0.2348915, 2.043745, 0.6325124, 0, 0.509804, 1, 1,
0.2363107, -0.2349547, 1.550258, 0, 0.5019608, 1, 1,
0.2387519, 0.4134519, -1.266743, 0, 0.4941176, 1, 1,
0.2393583, 0.1269946, 1.262926, 0, 0.4901961, 1, 1,
0.2422853, 0.8196089, 1.183063, 0, 0.4823529, 1, 1,
0.2430022, -0.963975, 2.84958, 0, 0.4784314, 1, 1,
0.2500033, -1.22307, 1.412678, 0, 0.4705882, 1, 1,
0.2528813, -2.773321, 2.513216, 0, 0.4666667, 1, 1,
0.2549644, 0.8499297, 1.164357, 0, 0.4588235, 1, 1,
0.2600324, 1.348806, 0.05223108, 0, 0.454902, 1, 1,
0.2658185, -0.0837017, 1.776173, 0, 0.4470588, 1, 1,
0.267441, -0.4503412, 2.970596, 0, 0.4431373, 1, 1,
0.2683649, 2.778525, 0.4472179, 0, 0.4352941, 1, 1,
0.2698156, 0.4039441, 0.4251624, 0, 0.4313726, 1, 1,
0.2730594, -0.4329904, 2.52375, 0, 0.4235294, 1, 1,
0.2790098, -0.9945312, 0.121035, 0, 0.4196078, 1, 1,
0.2819341, -0.1460072, 1.86057, 0, 0.4117647, 1, 1,
0.282124, 0.5300724, 0.8873773, 0, 0.4078431, 1, 1,
0.2822657, -0.0332698, 1.144181, 0, 0.4, 1, 1,
0.2841596, -1.575134, 4.418832, 0, 0.3921569, 1, 1,
0.2851255, -0.9135857, 1.976482, 0, 0.3882353, 1, 1,
0.2857554, -0.5311671, 2.65397, 0, 0.3803922, 1, 1,
0.2911186, 0.1104708, 3.112988, 0, 0.3764706, 1, 1,
0.2915276, 0.6329854, -1.442493, 0, 0.3686275, 1, 1,
0.2919586, 0.01180694, -0.2972171, 0, 0.3647059, 1, 1,
0.302471, 1.231173, -0.5914959, 0, 0.3568628, 1, 1,
0.3033287, -0.03734175, 1.721459, 0, 0.3529412, 1, 1,
0.3063231, -1.79703, 3.253976, 0, 0.345098, 1, 1,
0.3065411, 1.766955, 1.020305, 0, 0.3411765, 1, 1,
0.3076457, 0.5198522, 1.365213, 0, 0.3333333, 1, 1,
0.3080429, -0.4863902, 2.656086, 0, 0.3294118, 1, 1,
0.3084113, -0.4617844, 4.588468, 0, 0.3215686, 1, 1,
0.3110927, -1.546653, 1.419733, 0, 0.3176471, 1, 1,
0.3127616, 1.091511, 1.353822, 0, 0.3098039, 1, 1,
0.3152217, 0.9113936, 2.02167, 0, 0.3058824, 1, 1,
0.3162208, -0.4129719, 1.461102, 0, 0.2980392, 1, 1,
0.3162361, 0.8110712, -1.03563, 0, 0.2901961, 1, 1,
0.3162821, 0.8234328, -1.322403, 0, 0.2862745, 1, 1,
0.3212317, -0.7875138, 4.590897, 0, 0.2784314, 1, 1,
0.3221013, -1.527151, 2.315525, 0, 0.2745098, 1, 1,
0.3227359, 1.341447, 1.913804, 0, 0.2666667, 1, 1,
0.3282762, 0.3200763, 0.8127716, 0, 0.2627451, 1, 1,
0.3330811, -0.756561, 1.936433, 0, 0.254902, 1, 1,
0.3355553, 1.316103, 0.2565927, 0, 0.2509804, 1, 1,
0.3367943, -0.7567704, 3.669023, 0, 0.2431373, 1, 1,
0.3380173, 1.442513, -0.08080764, 0, 0.2392157, 1, 1,
0.3381914, 2.153306, -0.2202374, 0, 0.2313726, 1, 1,
0.3400837, -0.7096193, 2.49221, 0, 0.227451, 1, 1,
0.3426495, -0.1602324, 2.491115, 0, 0.2196078, 1, 1,
0.3450104, 0.1233197, 1.80385, 0, 0.2156863, 1, 1,
0.345335, 1.126812, -0.09166674, 0, 0.2078431, 1, 1,
0.3489529, -0.6979524, 2.612779, 0, 0.2039216, 1, 1,
0.3511162, 0.2527528, 0.4800269, 0, 0.1960784, 1, 1,
0.3532648, 0.3783873, -0.2367021, 0, 0.1882353, 1, 1,
0.3544313, -1.167812, 1.837182, 0, 0.1843137, 1, 1,
0.3618177, -1.252553, 2.185534, 0, 0.1764706, 1, 1,
0.3790328, -0.6975777, 1.120729, 0, 0.172549, 1, 1,
0.3795449, -0.047847, 1.519969, 0, 0.1647059, 1, 1,
0.3800478, 0.30613, -0.6449003, 0, 0.1607843, 1, 1,
0.3803344, -0.7817335, 3.127183, 0, 0.1529412, 1, 1,
0.3806465, 1.936404, 0.9399583, 0, 0.1490196, 1, 1,
0.3849781, -0.5751751, 2.751514, 0, 0.1411765, 1, 1,
0.3857228, 0.4764611, -0.3670946, 0, 0.1372549, 1, 1,
0.385803, 1.340663, 0.348819, 0, 0.1294118, 1, 1,
0.3862027, 1.581992, -0.5564045, 0, 0.1254902, 1, 1,
0.3979093, 0.2913624, 2.408225, 0, 0.1176471, 1, 1,
0.3997085, 0.6158026, 0.5592327, 0, 0.1137255, 1, 1,
0.4010644, -0.07465634, 2.073849, 0, 0.1058824, 1, 1,
0.4027121, -0.2683959, 2.513069, 0, 0.09803922, 1, 1,
0.4042486, -0.06737489, 2.635489, 0, 0.09411765, 1, 1,
0.4045138, -0.5258065, 1.605984, 0, 0.08627451, 1, 1,
0.4058786, 2.844046, -1.790591, 0, 0.08235294, 1, 1,
0.4080431, 0.5142407, 0.3033688, 0, 0.07450981, 1, 1,
0.409088, 0.7752631, 3.006678, 0, 0.07058824, 1, 1,
0.410173, 0.6365962, 0.9433527, 0, 0.0627451, 1, 1,
0.4114378, 0.6657256, -0.3680291, 0, 0.05882353, 1, 1,
0.4193371, 0.3756597, 1.075936, 0, 0.05098039, 1, 1,
0.4195593, 0.8982828, -0.9619527, 0, 0.04705882, 1, 1,
0.4227482, -1.604459, 2.485798, 0, 0.03921569, 1, 1,
0.4235525, 1.944134, -1.182862, 0, 0.03529412, 1, 1,
0.4236599, -0.3498822, 4.049751, 0, 0.02745098, 1, 1,
0.4238155, -0.2193047, 1.520398, 0, 0.02352941, 1, 1,
0.4247901, 0.469882, 2.121881, 0, 0.01568628, 1, 1,
0.4284662, 0.9254221, 1.346141, 0, 0.01176471, 1, 1,
0.4348142, -1.153371, 3.346563, 0, 0.003921569, 1, 1,
0.4387828, 0.117632, 1.778829, 0.003921569, 0, 1, 1,
0.4396493, 0.8973348, -0.8249423, 0.007843138, 0, 1, 1,
0.4399923, -0.4367198, 2.003911, 0.01568628, 0, 1, 1,
0.4402078, -0.01469168, 2.066861, 0.01960784, 0, 1, 1,
0.4431483, -0.1558727, 1.802578, 0.02745098, 0, 1, 1,
0.4490336, 0.9180458, -0.7684039, 0.03137255, 0, 1, 1,
0.4493418, -0.3630513, -0.664167, 0.03921569, 0, 1, 1,
0.4508587, 0.6465185, 0.996238, 0.04313726, 0, 1, 1,
0.4511491, -0.7022935, 1.898817, 0.05098039, 0, 1, 1,
0.4564311, 0.3893629, 1.796481, 0.05490196, 0, 1, 1,
0.4597636, 0.3554639, 0.9454796, 0.0627451, 0, 1, 1,
0.4599261, -0.9654311, 4.928247, 0.06666667, 0, 1, 1,
0.4621508, 0.003431603, 0.2133127, 0.07450981, 0, 1, 1,
0.465652, -0.4555301, 3.840902, 0.07843138, 0, 1, 1,
0.4661058, 0.0398973, 1.549797, 0.08627451, 0, 1, 1,
0.4689714, 0.9313595, 0.3567533, 0.09019608, 0, 1, 1,
0.4715828, 1.353663, 1.817266, 0.09803922, 0, 1, 1,
0.4716102, -0.431254, 3.546179, 0.1058824, 0, 1, 1,
0.4718039, -0.4372072, 2.224438, 0.1098039, 0, 1, 1,
0.4771214, 1.222292, 0.8981425, 0.1176471, 0, 1, 1,
0.47944, -0.7957724, 3.469013, 0.1215686, 0, 1, 1,
0.4800934, -0.4242442, 2.002254, 0.1294118, 0, 1, 1,
0.4830404, -1.053879, 1.904409, 0.1333333, 0, 1, 1,
0.4831945, -1.212066, 2.116415, 0.1411765, 0, 1, 1,
0.4842454, 0.6284752, -0.8369953, 0.145098, 0, 1, 1,
0.488012, 0.5749979, -1.210411, 0.1529412, 0, 1, 1,
0.4885741, 0.9935555, 1.835937, 0.1568628, 0, 1, 1,
0.4885893, -0.7708447, 4.063821, 0.1647059, 0, 1, 1,
0.5021673, 1.117455, -0.2566901, 0.1686275, 0, 1, 1,
0.5044397, -1.942592, 2.897804, 0.1764706, 0, 1, 1,
0.5052658, -0.5620853, 3.597991, 0.1803922, 0, 1, 1,
0.5101617, -0.1681104, 2.312045, 0.1882353, 0, 1, 1,
0.5141219, -0.7526056, 2.097082, 0.1921569, 0, 1, 1,
0.5161405, 1.090101, -0.9853563, 0.2, 0, 1, 1,
0.5170539, -1.126011, 4.213525, 0.2078431, 0, 1, 1,
0.5173521, -0.8505393, 2.878653, 0.2117647, 0, 1, 1,
0.5191936, -1.676563, 4.14849, 0.2196078, 0, 1, 1,
0.5273234, 0.2888499, 0.6202307, 0.2235294, 0, 1, 1,
0.5281439, 1.354729, 0.8411539, 0.2313726, 0, 1, 1,
0.530803, -0.7165768, 3.082002, 0.2352941, 0, 1, 1,
0.5323312, -0.49967, 1.820155, 0.2431373, 0, 1, 1,
0.5343873, -1.752793, 2.94045, 0.2470588, 0, 1, 1,
0.5344152, -1.462373, 3.319039, 0.254902, 0, 1, 1,
0.539944, 1.427751, 1.486924, 0.2588235, 0, 1, 1,
0.5401341, -1.586559, 1.370889, 0.2666667, 0, 1, 1,
0.5402841, 0.9888635, 1.118629, 0.2705882, 0, 1, 1,
0.5407765, -0.6797067, 2.098822, 0.2784314, 0, 1, 1,
0.5459076, -1.759696, 3.473514, 0.282353, 0, 1, 1,
0.5479798, 0.1739511, 2.139288, 0.2901961, 0, 1, 1,
0.5491441, 1.72608, 2.755947, 0.2941177, 0, 1, 1,
0.5496116, -0.5546796, 2.062257, 0.3019608, 0, 1, 1,
0.5563557, 0.6737155, 2.110337, 0.3098039, 0, 1, 1,
0.5569755, 0.3189092, 2.069394, 0.3137255, 0, 1, 1,
0.5599146, 2.145583, 0.8992131, 0.3215686, 0, 1, 1,
0.5673274, 0.4106963, 0.7693243, 0.3254902, 0, 1, 1,
0.5714043, 0.03447427, 2.721124, 0.3333333, 0, 1, 1,
0.5747381, 0.516467, 3.32527, 0.3372549, 0, 1, 1,
0.5748756, -1.059949, 3.322511, 0.345098, 0, 1, 1,
0.5771163, -1.502255, 2.673978, 0.3490196, 0, 1, 1,
0.5802148, -0.5233577, 3.506724, 0.3568628, 0, 1, 1,
0.5892468, -0.9435272, 5.121631, 0.3607843, 0, 1, 1,
0.5930471, 1.175866, 1.572618, 0.3686275, 0, 1, 1,
0.5951147, -1.255356, 2.486748, 0.372549, 0, 1, 1,
0.5957496, -1.149191, 0.8869666, 0.3803922, 0, 1, 1,
0.6005723, -0.06265119, 1.748678, 0.3843137, 0, 1, 1,
0.6013328, 1.400834, -0.4318386, 0.3921569, 0, 1, 1,
0.6023013, 0.5148793, 1.070417, 0.3960784, 0, 1, 1,
0.6085277, -0.8186517, 0.8380368, 0.4039216, 0, 1, 1,
0.6091233, 0.01038034, 0.415346, 0.4117647, 0, 1, 1,
0.612089, -0.9184546, 2.794197, 0.4156863, 0, 1, 1,
0.6169009, 0.2918163, 2.865141, 0.4235294, 0, 1, 1,
0.6178748, 0.5888769, 2.593304, 0.427451, 0, 1, 1,
0.6203043, -1.130389, 2.036204, 0.4352941, 0, 1, 1,
0.6219639, -1.785222, 1.418592, 0.4392157, 0, 1, 1,
0.6232294, -0.06029201, 1.489057, 0.4470588, 0, 1, 1,
0.6256361, 0.4781411, 0.8773711, 0.4509804, 0, 1, 1,
0.6279248, 0.4206813, 0.9309402, 0.4588235, 0, 1, 1,
0.6287369, 0.06455044, 1.719471, 0.4627451, 0, 1, 1,
0.6313562, -0.133387, 1.141516, 0.4705882, 0, 1, 1,
0.6422871, -0.8490158, 1.021072, 0.4745098, 0, 1, 1,
0.645061, 1.216237, 1.964918, 0.4823529, 0, 1, 1,
0.6497949, -0.3265109, 3.068037, 0.4862745, 0, 1, 1,
0.6595479, -0.2438965, 3.476102, 0.4941176, 0, 1, 1,
0.6630098, 0.7726433, 0.4709891, 0.5019608, 0, 1, 1,
0.6630676, -0.9801027, 0.8126792, 0.5058824, 0, 1, 1,
0.6647114, -0.8811244, 2.831925, 0.5137255, 0, 1, 1,
0.6680846, -0.2474814, 0.5787329, 0.5176471, 0, 1, 1,
0.6705411, 0.4373715, 1.348588, 0.5254902, 0, 1, 1,
0.6725238, 0.5809796, 0.6153386, 0.5294118, 0, 1, 1,
0.6867926, -0.3984233, 2.070338, 0.5372549, 0, 1, 1,
0.6910427, 2.116337, -0.5068928, 0.5411765, 0, 1, 1,
0.693904, -0.1794793, 1.085772, 0.5490196, 0, 1, 1,
0.6971238, 1.033032, -0.8064436, 0.5529412, 0, 1, 1,
0.6971573, 0.7263216, 0.3857884, 0.5607843, 0, 1, 1,
0.7005239, 0.6754742, -0.3606282, 0.5647059, 0, 1, 1,
0.7035425, 0.3522434, 1.469651, 0.572549, 0, 1, 1,
0.7146291, -0.3976641, 4.333546, 0.5764706, 0, 1, 1,
0.7166513, -0.1988511, 3.25695, 0.5843138, 0, 1, 1,
0.7191843, 0.8351939, 0.8016176, 0.5882353, 0, 1, 1,
0.7221386, 0.3342929, -0.1258171, 0.5960785, 0, 1, 1,
0.7275649, -0.5747356, 1.645671, 0.6039216, 0, 1, 1,
0.7279688, 1.263884, 0.006684836, 0.6078432, 0, 1, 1,
0.7281581, -0.003790747, 0.8285802, 0.6156863, 0, 1, 1,
0.7338837, -0.5946096, 2.98009, 0.6196079, 0, 1, 1,
0.7388564, -0.5237525, 4.349413, 0.627451, 0, 1, 1,
0.7471184, -0.2738712, 1.026281, 0.6313726, 0, 1, 1,
0.7482232, 0.9883587, 1.295154, 0.6392157, 0, 1, 1,
0.752643, 0.6017138, 1.101333, 0.6431373, 0, 1, 1,
0.7531186, 1.209466, 0.5258774, 0.6509804, 0, 1, 1,
0.7572334, -1.531607, 1.691917, 0.654902, 0, 1, 1,
0.7659839, -0.431143, 1.362728, 0.6627451, 0, 1, 1,
0.7662637, 0.5058705, 1.91647, 0.6666667, 0, 1, 1,
0.7777827, -0.986353, 2.157783, 0.6745098, 0, 1, 1,
0.7816027, -0.3279896, 1.736737, 0.6784314, 0, 1, 1,
0.7828132, 0.3213727, 0.4688005, 0.6862745, 0, 1, 1,
0.7847092, 0.3819265, 1.739622, 0.6901961, 0, 1, 1,
0.7849303, 0.1490591, 1.432148, 0.6980392, 0, 1, 1,
0.788027, -0.673432, 2.31779, 0.7058824, 0, 1, 1,
0.7907495, 0.02277442, 1.325678, 0.7098039, 0, 1, 1,
0.7960872, -1.165425, 1.923133, 0.7176471, 0, 1, 1,
0.7962196, -1.249764, 2.051435, 0.7215686, 0, 1, 1,
0.8041688, 0.71072, -0.06360365, 0.7294118, 0, 1, 1,
0.8055782, 0.1606411, 0.9519027, 0.7333333, 0, 1, 1,
0.8074037, 1.555168, 0.7319798, 0.7411765, 0, 1, 1,
0.8075787, 1.065168, 0.8198051, 0.7450981, 0, 1, 1,
0.8077143, -1.122938, 2.159317, 0.7529412, 0, 1, 1,
0.8092967, -0.183785, 2.908585, 0.7568628, 0, 1, 1,
0.8093888, 1.219227, 0.2687638, 0.7647059, 0, 1, 1,
0.8117779, -1.086567, 2.315608, 0.7686275, 0, 1, 1,
0.8128293, -1.593627, 0.3334723, 0.7764706, 0, 1, 1,
0.8129787, -0.4767871, 2.171551, 0.7803922, 0, 1, 1,
0.8197625, -0.2814301, 1.803146, 0.7882353, 0, 1, 1,
0.8255755, 1.086325, -0.1441979, 0.7921569, 0, 1, 1,
0.8258204, 2.118663, -1.526666, 0.8, 0, 1, 1,
0.8273476, 0.94918, 0.9540625, 0.8078431, 0, 1, 1,
0.8301889, -0.8589405, 2.544683, 0.8117647, 0, 1, 1,
0.8307146, -1.434306, 2.928046, 0.8196079, 0, 1, 1,
0.8348271, 1.095531, 1.025551, 0.8235294, 0, 1, 1,
0.8357833, -0.3410658, 0.9072897, 0.8313726, 0, 1, 1,
0.8372194, 0.8976175, -0.6190714, 0.8352941, 0, 1, 1,
0.8385478, -0.6233179, 2.932261, 0.8431373, 0, 1, 1,
0.839762, 0.9432933, 1.262394, 0.8470588, 0, 1, 1,
0.8573515, 0.90338, 0.08625043, 0.854902, 0, 1, 1,
0.8598201, -0.580029, 1.651518, 0.8588235, 0, 1, 1,
0.8614939, -0.7340313, 0.7264399, 0.8666667, 0, 1, 1,
0.8634999, -0.2115026, 3.313181, 0.8705882, 0, 1, 1,
0.8666626, 1.432395, 0.5704417, 0.8784314, 0, 1, 1,
0.8724223, -1.528472, 3.736137, 0.8823529, 0, 1, 1,
0.8824167, 0.1300368, 4.258002, 0.8901961, 0, 1, 1,
0.8845134, 0.9321789, 1.875822, 0.8941177, 0, 1, 1,
0.8874621, 0.4874788, 1.25163, 0.9019608, 0, 1, 1,
0.8956505, 1.292648, 0.7295851, 0.9098039, 0, 1, 1,
0.8957425, -0.3787689, 0.7015879, 0.9137255, 0, 1, 1,
0.9017004, -0.7854572, 1.59622, 0.9215686, 0, 1, 1,
0.9043958, -0.3113701, 4.360175, 0.9254902, 0, 1, 1,
0.9045856, -0.09851072, 3.12723, 0.9333333, 0, 1, 1,
0.9047916, 0.6407094, 1.587354, 0.9372549, 0, 1, 1,
0.9056786, -0.3278444, 1.015655, 0.945098, 0, 1, 1,
0.9079179, 0.2126572, 1.873549, 0.9490196, 0, 1, 1,
0.9101468, 0.125892, 1.493657, 0.9568627, 0, 1, 1,
0.9102083, 0.03638276, 1.469387, 0.9607843, 0, 1, 1,
0.9104572, -1.512061, 2.000854, 0.9686275, 0, 1, 1,
0.9257846, 0.844837, 0.3235134, 0.972549, 0, 1, 1,
0.9314663, 0.1972346, 1.228964, 0.9803922, 0, 1, 1,
0.9397702, -1.143361, 1.310752, 0.9843137, 0, 1, 1,
0.9398535, 0.05189366, 1.72018, 0.9921569, 0, 1, 1,
0.9499677, 1.343732, -0.3220434, 0.9960784, 0, 1, 1,
0.9513639, -0.1809643, 1.842926, 1, 0, 0.9960784, 1,
0.9555456, 0.396009, 1.12733, 1, 0, 0.9882353, 1,
0.9675171, -1.245809, 4.303555, 1, 0, 0.9843137, 1,
0.968245, -0.4305493, 2.508811, 1, 0, 0.9764706, 1,
0.9700205, -1.859005, 2.327322, 1, 0, 0.972549, 1,
0.9722341, -0.9418554, 2.359209, 1, 0, 0.9647059, 1,
0.9724087, -0.6984577, -0.02423805, 1, 0, 0.9607843, 1,
0.9783981, 0.01174149, 1.624064, 1, 0, 0.9529412, 1,
0.979228, -0.0865984, 1.756432, 1, 0, 0.9490196, 1,
0.9802907, 0.4356111, 0.9270873, 1, 0, 0.9411765, 1,
0.9853669, 1.362434, 2.541436, 1, 0, 0.9372549, 1,
0.9870526, -1.615808, 2.196886, 1, 0, 0.9294118, 1,
0.9885225, 0.803502, 2.027019, 1, 0, 0.9254902, 1,
0.9894723, -0.2796648, 2.357687, 1, 0, 0.9176471, 1,
0.9937021, 0.6352541, -0.7442752, 1, 0, 0.9137255, 1,
0.9939618, -1.91483, 3.033408, 1, 0, 0.9058824, 1,
0.9955546, -0.4281605, 1.986947, 1, 0, 0.9019608, 1,
0.9975246, -0.03501772, 1.2763, 1, 0, 0.8941177, 1,
0.9981363, -1.127201, 1.335891, 1, 0, 0.8862745, 1,
1.007484, 0.08215373, 1.619985, 1, 0, 0.8823529, 1,
1.009617, -2.456728, 3.708179, 1, 0, 0.8745098, 1,
1.011993, -0.2307799, 1.55765, 1, 0, 0.8705882, 1,
1.016608, 2.728627, 1.738339, 1, 0, 0.8627451, 1,
1.022365, -0.8474166, 2.35182, 1, 0, 0.8588235, 1,
1.031169, 0.6835255, -0.2221082, 1, 0, 0.8509804, 1,
1.041004, 0.02364918, 3.347296, 1, 0, 0.8470588, 1,
1.044771, -0.3235813, 2.575036, 1, 0, 0.8392157, 1,
1.046335, 0.1250173, 0.3930794, 1, 0, 0.8352941, 1,
1.049326, 1.800198, 0.9830261, 1, 0, 0.827451, 1,
1.054119, 1.540416, -1.233098, 1, 0, 0.8235294, 1,
1.05435, -2.228463, 2.712898, 1, 0, 0.8156863, 1,
1.062744, 1.595011, -1.269067, 1, 0, 0.8117647, 1,
1.068256, -0.5290108, 3.589482, 1, 0, 0.8039216, 1,
1.071158, 1.819667, -0.1393568, 1, 0, 0.7960784, 1,
1.071198, -1.316926, 2.211079, 1, 0, 0.7921569, 1,
1.078188, 1.22131, 0.3828837, 1, 0, 0.7843137, 1,
1.080118, 0.3913262, 1.712891, 1, 0, 0.7803922, 1,
1.082527, -0.5824137, 0.9063456, 1, 0, 0.772549, 1,
1.094548, -0.5224581, 1.768852, 1, 0, 0.7686275, 1,
1.099684, -0.9362155, 2.356371, 1, 0, 0.7607843, 1,
1.102861, -1.817031, 3.505117, 1, 0, 0.7568628, 1,
1.132366, 2.064381, 1.773046, 1, 0, 0.7490196, 1,
1.13682, 0.2140819, 0.8747668, 1, 0, 0.7450981, 1,
1.138677, 0.7365014, 0.7423927, 1, 0, 0.7372549, 1,
1.140676, -0.5069488, 2.006075, 1, 0, 0.7333333, 1,
1.149125, 0.2906268, -1.275933, 1, 0, 0.7254902, 1,
1.156341, -1.760553, 3.888151, 1, 0, 0.7215686, 1,
1.15894, -0.3301868, 1.416936, 1, 0, 0.7137255, 1,
1.163394, -1.396878, 3.47027, 1, 0, 0.7098039, 1,
1.166822, -0.06420251, 3.19593, 1, 0, 0.7019608, 1,
1.169301, -0.3523006, 1.146487, 1, 0, 0.6941177, 1,
1.171626, -0.4467239, 2.073108, 1, 0, 0.6901961, 1,
1.186311, 1.382312, 0.5636373, 1, 0, 0.682353, 1,
1.187458, -0.9204208, 4.209356, 1, 0, 0.6784314, 1,
1.191907, 1.512567, -0.199421, 1, 0, 0.6705883, 1,
1.193211, 0.7898201, 0.8654366, 1, 0, 0.6666667, 1,
1.207281, -0.0933779, 2.187131, 1, 0, 0.6588235, 1,
1.224449, 1.039806, 0.5143298, 1, 0, 0.654902, 1,
1.231063, 0.4978025, 0.5386868, 1, 0, 0.6470588, 1,
1.250071, -0.7846324, 0.9647142, 1, 0, 0.6431373, 1,
1.251272, 1.608554, -1.134515, 1, 0, 0.6352941, 1,
1.251493, -0.6020912, 2.467019, 1, 0, 0.6313726, 1,
1.252705, -0.3980622, 3.153256, 1, 0, 0.6235294, 1,
1.261634, -1.096292, 4.174837, 1, 0, 0.6196079, 1,
1.263702, -0.2375084, 1.648955, 1, 0, 0.6117647, 1,
1.265461, 1.41765, 1.56551, 1, 0, 0.6078432, 1,
1.266414, -0.6465951, 1.373975, 1, 0, 0.6, 1,
1.269318, -0.7851583, 2.08635, 1, 0, 0.5921569, 1,
1.271131, 1.381699, 1.39423, 1, 0, 0.5882353, 1,
1.278142, -0.08864725, 1.895567, 1, 0, 0.5803922, 1,
1.283351, 0.7053987, 1.185664, 1, 0, 0.5764706, 1,
1.289362, -0.008722612, 1.993653, 1, 0, 0.5686275, 1,
1.293808, 0.2969547, -0.3043331, 1, 0, 0.5647059, 1,
1.301092, -0.2636863, 0.6361474, 1, 0, 0.5568628, 1,
1.301725, 1.889357, -0.1212373, 1, 0, 0.5529412, 1,
1.309742, -1.773084, 2.527521, 1, 0, 0.5450981, 1,
1.310317, -0.5337365, 3.114215, 1, 0, 0.5411765, 1,
1.312935, -2.405701, 1.050687, 1, 0, 0.5333334, 1,
1.313649, -0.05703999, 1.993509, 1, 0, 0.5294118, 1,
1.320702, -0.7474996, 2.752208, 1, 0, 0.5215687, 1,
1.323182, -1.436101, 2.445737, 1, 0, 0.5176471, 1,
1.334556, 1.557557, 0.1468274, 1, 0, 0.509804, 1,
1.355158, -0.5029451, 0.7290412, 1, 0, 0.5058824, 1,
1.370412, 0.1888593, 3.504224, 1, 0, 0.4980392, 1,
1.370835, 1.3579, 1.823486, 1, 0, 0.4901961, 1,
1.373328, 0.6450146, 1.316899, 1, 0, 0.4862745, 1,
1.376098, 0.7706212, 0.2065867, 1, 0, 0.4784314, 1,
1.394832, -0.2493819, 2.890926, 1, 0, 0.4745098, 1,
1.397168, 0.3882774, 2.782373, 1, 0, 0.4666667, 1,
1.398685, -0.3533574, 2.588261, 1, 0, 0.4627451, 1,
1.404338, 0.6589248, 1.153399, 1, 0, 0.454902, 1,
1.425429, -0.4862423, 3.615664, 1, 0, 0.4509804, 1,
1.434383, -0.4544334, 2.570177, 1, 0, 0.4431373, 1,
1.440144, -0.03726588, 2.063007, 1, 0, 0.4392157, 1,
1.445518, 1.532083, 0.860148, 1, 0, 0.4313726, 1,
1.446121, 1.669989, 1.582124, 1, 0, 0.427451, 1,
1.449626, 0.5739481, -1.057352, 1, 0, 0.4196078, 1,
1.464897, -0.2924038, 2.145821, 1, 0, 0.4156863, 1,
1.478259, 0.3783664, 0.4997181, 1, 0, 0.4078431, 1,
1.497087, -0.002513615, 1.569053, 1, 0, 0.4039216, 1,
1.497226, -0.488424, 0.9414125, 1, 0, 0.3960784, 1,
1.515061, -1.125712, 3.972988, 1, 0, 0.3882353, 1,
1.519258, -0.6789905, 3.089413, 1, 0, 0.3843137, 1,
1.528472, 0.4285251, 1.545686, 1, 0, 0.3764706, 1,
1.530336, 1.446322, 1.054096, 1, 0, 0.372549, 1,
1.538666, -0.3370261, 1.294096, 1, 0, 0.3647059, 1,
1.539373, -0.2221547, 1.392409, 1, 0, 0.3607843, 1,
1.549284, 0.3545964, 1.062289, 1, 0, 0.3529412, 1,
1.57246, -0.6240407, 0.4902866, 1, 0, 0.3490196, 1,
1.574464, 1.690463, 0.8165184, 1, 0, 0.3411765, 1,
1.585199, -0.8727204, 1.629917, 1, 0, 0.3372549, 1,
1.585715, -0.6211761, 1.280818, 1, 0, 0.3294118, 1,
1.590126, -1.430951, 3.640685, 1, 0, 0.3254902, 1,
1.591994, -0.9823474, 1.300506, 1, 0, 0.3176471, 1,
1.60045, -1.874483, 1.75525, 1, 0, 0.3137255, 1,
1.600576, -0.8663144, 2.81503, 1, 0, 0.3058824, 1,
1.604347, -0.4188302, 1.260478, 1, 0, 0.2980392, 1,
1.610897, 0.6213488, 0.4646024, 1, 0, 0.2941177, 1,
1.626636, 0.3469146, 0.3743525, 1, 0, 0.2862745, 1,
1.637509, 1.13037, 0.7633097, 1, 0, 0.282353, 1,
1.640141, -0.2080472, 2.504896, 1, 0, 0.2745098, 1,
1.641459, -0.6968215, 0.4422362, 1, 0, 0.2705882, 1,
1.646356, 1.139963, 0.7686371, 1, 0, 0.2627451, 1,
1.64859, -0.2501309, 2.133755, 1, 0, 0.2588235, 1,
1.649318, 0.2426119, 2.153161, 1, 0, 0.2509804, 1,
1.650663, -0.1294315, 0.9131203, 1, 0, 0.2470588, 1,
1.670339, -0.2542118, 1.836172, 1, 0, 0.2392157, 1,
1.678249, -0.3826745, 2.392857, 1, 0, 0.2352941, 1,
1.688281, 0.1522349, 1.379781, 1, 0, 0.227451, 1,
1.706843, 0.1316127, -1.570969, 1, 0, 0.2235294, 1,
1.708099, -0.09639342, 1.786227, 1, 0, 0.2156863, 1,
1.729878, -0.1407563, 4.312506, 1, 0, 0.2117647, 1,
1.738709, 0.7832806, 1.462021, 1, 0, 0.2039216, 1,
1.767523, -1.168795, 2.960974, 1, 0, 0.1960784, 1,
1.789957, -1.951583, 1.792615, 1, 0, 0.1921569, 1,
1.7938, -0.2052726, 3.739147, 1, 0, 0.1843137, 1,
1.803395, -2.225628, 2.272298, 1, 0, 0.1803922, 1,
1.812774, -1.217044, 2.867518, 1, 0, 0.172549, 1,
1.821607, -0.6441976, 1.644511, 1, 0, 0.1686275, 1,
1.840218, -1.484695, 2.7052, 1, 0, 0.1607843, 1,
1.844189, 0.8817779, 1.206044, 1, 0, 0.1568628, 1,
1.890708, -0.4394327, 0.3179416, 1, 0, 0.1490196, 1,
1.890871, -1.440609, 2.107003, 1, 0, 0.145098, 1,
1.895904, 1.387086, 1.672888, 1, 0, 0.1372549, 1,
1.898131, -0.4631783, 1.660455, 1, 0, 0.1333333, 1,
1.933007, 0.8835959, 1.345855, 1, 0, 0.1254902, 1,
1.935758, 0.5909959, 0.7751764, 1, 0, 0.1215686, 1,
1.969792, -1.020519, 0.1092057, 1, 0, 0.1137255, 1,
1.990857, -0.6193683, 2.732947, 1, 0, 0.1098039, 1,
2.038675, 0.3551144, 2.350139, 1, 0, 0.1019608, 1,
2.074433, 0.1387575, 2.775873, 1, 0, 0.09411765, 1,
2.109838, 0.933332, 0.4431275, 1, 0, 0.09019608, 1,
2.137164, 1.768606, -0.4525306, 1, 0, 0.08235294, 1,
2.210615, -0.7269921, 2.093589, 1, 0, 0.07843138, 1,
2.220025, 1.141621, 0.7304373, 1, 0, 0.07058824, 1,
2.22837, 1.502763, 0.3549856, 1, 0, 0.06666667, 1,
2.229159, 0.09497207, 0.4232489, 1, 0, 0.05882353, 1,
2.230438, 0.3558497, 0.5512932, 1, 0, 0.05490196, 1,
2.34251, 1.981606, 2.091969, 1, 0, 0.04705882, 1,
2.348874, -0.3628131, 1.648147, 1, 0, 0.04313726, 1,
2.394691, -0.6553126, 1.908714, 1, 0, 0.03529412, 1,
2.499663, -0.3844216, 0.6895689, 1, 0, 0.03137255, 1,
2.677302, -1.267074, 1.201374, 1, 0, 0.02352941, 1,
2.738194, -1.623154, 1.866288, 1, 0, 0.01960784, 1,
2.829675, 1.177936, 1.028357, 1, 0, 0.01176471, 1,
3.208701, -0.8972646, 2.030069, 1, 0, 0.007843138, 1
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
-0.1814176, -4.910305, -8.16464, 0, -0.5, 0.5, 0.5,
-0.1814176, -4.910305, -8.16464, 1, -0.5, 0.5, 0.5,
-0.1814176, -4.910305, -8.16464, 1, 1.5, 0.5, 0.5,
-0.1814176, -4.910305, -8.16464, 0, 1.5, 0.5, 0.5
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
-4.720786, -0.2887522, -8.16464, 0, -0.5, 0.5, 0.5,
-4.720786, -0.2887522, -8.16464, 1, -0.5, 0.5, 0.5,
-4.720786, -0.2887522, -8.16464, 1, 1.5, 0.5, 0.5,
-4.720786, -0.2887522, -8.16464, 0, 1.5, 0.5, 0.5
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
-4.720786, -4.910305, -0.5586905, 0, -0.5, 0.5, 0.5,
-4.720786, -4.910305, -0.5586905, 1, -0.5, 0.5, 0.5,
-4.720786, -4.910305, -0.5586905, 1, 1.5, 0.5, 0.5,
-4.720786, -4.910305, -0.5586905, 0, 1.5, 0.5, 0.5
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
-3, -3.843793, -6.409421,
3, -3.843793, -6.409421,
-3, -3.843793, -6.409421,
-3, -4.021545, -6.701958,
-2, -3.843793, -6.409421,
-2, -4.021545, -6.701958,
-1, -3.843793, -6.409421,
-1, -4.021545, -6.701958,
0, -3.843793, -6.409421,
0, -4.021545, -6.701958,
1, -3.843793, -6.409421,
1, -4.021545, -6.701958,
2, -3.843793, -6.409421,
2, -4.021545, -6.701958,
3, -3.843793, -6.409421,
3, -4.021545, -6.701958
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
-3, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
-3, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
-3, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
-3, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
-2, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
-2, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
-2, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
-2, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
-1, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
-1, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
-1, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
-1, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
0, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
0, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
0, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
0, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
1, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
1, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
1, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
1, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
2, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
2, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
2, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
2, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5,
3, -4.377049, -7.287031, 0, -0.5, 0.5, 0.5,
3, -4.377049, -7.287031, 1, -0.5, 0.5, 0.5,
3, -4.377049, -7.287031, 1, 1.5, 0.5, 0.5,
3, -4.377049, -7.287031, 0, 1.5, 0.5, 0.5
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
-3.673239, -3, -6.409421,
-3.673239, 3, -6.409421,
-3.673239, -3, -6.409421,
-3.847831, -3, -6.701958,
-3.673239, -2, -6.409421,
-3.847831, -2, -6.701958,
-3.673239, -1, -6.409421,
-3.847831, -1, -6.701958,
-3.673239, 0, -6.409421,
-3.847831, 0, -6.701958,
-3.673239, 1, -6.409421,
-3.847831, 1, -6.701958,
-3.673239, 2, -6.409421,
-3.847831, 2, -6.701958,
-3.673239, 3, -6.409421,
-3.847831, 3, -6.701958
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
-4.197012, -3, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, -3, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, -3, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, -3, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, -2, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, -2, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, -2, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, -2, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, -1, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, -1, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, -1, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, -1, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, 0, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, 0, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, 0, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, 0, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, 1, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, 1, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, 1, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, 1, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, 2, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, 2, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, 2, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, 2, -7.287031, 0, 1.5, 0.5, 0.5,
-4.197012, 3, -7.287031, 0, -0.5, 0.5, 0.5,
-4.197012, 3, -7.287031, 1, -0.5, 0.5, 0.5,
-4.197012, 3, -7.287031, 1, 1.5, 0.5, 0.5,
-4.197012, 3, -7.287031, 0, 1.5, 0.5, 0.5
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
-3.673239, -3.843793, -6,
-3.673239, -3.843793, 4,
-3.673239, -3.843793, -6,
-3.847831, -4.021545, -6,
-3.673239, -3.843793, -4,
-3.847831, -4.021545, -4,
-3.673239, -3.843793, -2,
-3.847831, -4.021545, -2,
-3.673239, -3.843793, 0,
-3.847831, -4.021545, 0,
-3.673239, -3.843793, 2,
-3.847831, -4.021545, 2,
-3.673239, -3.843793, 4,
-3.847831, -4.021545, 4
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
-4.197012, -4.377049, -6, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -6, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -6, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, -6, 0, 1.5, 0.5, 0.5,
-4.197012, -4.377049, -4, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -4, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -4, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, -4, 0, 1.5, 0.5, 0.5,
-4.197012, -4.377049, -2, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -2, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, -2, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, -2, 0, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 0, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 0, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 0, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 0, 0, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 2, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 2, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 2, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 2, 0, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 4, 0, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 4, 1, -0.5, 0.5, 0.5,
-4.197012, -4.377049, 4, 1, 1.5, 0.5, 0.5,
-4.197012, -4.377049, 4, 0, 1.5, 0.5, 0.5
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
-3.673239, -3.843793, -6.409421,
-3.673239, 3.266289, -6.409421,
-3.673239, -3.843793, 5.29204,
-3.673239, 3.266289, 5.29204,
-3.673239, -3.843793, -6.409421,
-3.673239, -3.843793, 5.29204,
-3.673239, 3.266289, -6.409421,
-3.673239, 3.266289, 5.29204,
-3.673239, -3.843793, -6.409421,
3.310404, -3.843793, -6.409421,
-3.673239, -3.843793, 5.29204,
3.310404, -3.843793, 5.29204,
-3.673239, 3.266289, -6.409421,
3.310404, 3.266289, -6.409421,
-3.673239, 3.266289, 5.29204,
3.310404, 3.266289, 5.29204,
3.310404, -3.843793, -6.409421,
3.310404, 3.266289, -6.409421,
3.310404, -3.843793, 5.29204,
3.310404, 3.266289, 5.29204,
3.310404, -3.843793, -6.409421,
3.310404, -3.843793, 5.29204,
3.310404, 3.266289, -6.409421,
3.310404, 3.266289, 5.29204
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
var radius = 8.207487;
var distance = 36.51604;
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
mvMatrix.translate( 0.1814176, 0.2887522, 0.5586905 );
mvMatrix.scale( 1.270697, 1.248101, 0.758375 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.51604);
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
Terramycin<-read.table("Terramycin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Terramycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
```

```r
y<-Terramycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
```

```r
z<-Terramycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
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
-3.571536, 0.8459972, -2.407539, 0, 0, 1, 1, 1,
-3.189276, -0.069313, -1.274494, 1, 0, 0, 1, 1,
-3.097338, -1.722443, -1.610461, 1, 0, 0, 1, 1,
-2.905734, -0.1916076, -1.507128, 1, 0, 0, 1, 1,
-2.886395, 2.233674, -1.587448, 1, 0, 0, 1, 1,
-2.790487, 0.4244817, -0.3823358, 1, 0, 0, 1, 1,
-2.454038, -1.018652, -0.609947, 0, 0, 0, 1, 1,
-2.430151, -1.615031, -2.886732, 0, 0, 0, 1, 1,
-2.401056, -0.5189252, -0.5704582, 0, 0, 0, 1, 1,
-2.398601, 1.489406, -0.8796551, 0, 0, 0, 1, 1,
-2.369776, 1.003251, -1.78018, 0, 0, 0, 1, 1,
-2.364035, 0.3122133, -1.80182, 0, 0, 0, 1, 1,
-2.357434, -1.812549, -2.675377, 0, 0, 0, 1, 1,
-2.353452, 0.1181099, -3.341745, 1, 1, 1, 1, 1,
-2.307034, -0.1985387, -2.212555, 1, 1, 1, 1, 1,
-2.292277, -1.046573, -2.58668, 1, 1, 1, 1, 1,
-2.241647, 0.1852704, -1.823707, 1, 1, 1, 1, 1,
-2.113799, -1.037999, -3.540139, 1, 1, 1, 1, 1,
-2.099221, 0.2138309, -1.450958, 1, 1, 1, 1, 1,
-2.093835, -0.890591, -0.278915, 1, 1, 1, 1, 1,
-2.02094, -0.3707154, 0.001708632, 1, 1, 1, 1, 1,
-2.012563, -0.6971473, 0.2288768, 1, 1, 1, 1, 1,
-2.011671, -0.4783689, -3.370846, 1, 1, 1, 1, 1,
-2.007519, 0.6478459, -1.169685, 1, 1, 1, 1, 1,
-1.971734, 0.7822665, -0.8625481, 1, 1, 1, 1, 1,
-1.952154, -0.1951877, -0.76402, 1, 1, 1, 1, 1,
-1.941092, -0.07878766, -2.892779, 1, 1, 1, 1, 1,
-1.877989, -0.9163533, -2.055753, 1, 1, 1, 1, 1,
-1.865416, 0.08610649, -3.499144, 0, 0, 1, 1, 1,
-1.859404, -1.868573, -1.823636, 1, 0, 0, 1, 1,
-1.849389, -1.046579, -2.342995, 1, 0, 0, 1, 1,
-1.841221, 1.123531, 0.2296795, 1, 0, 0, 1, 1,
-1.821299, -0.7304597, -1.14536, 1, 0, 0, 1, 1,
-1.785098, 0.5195382, -3.142427, 1, 0, 0, 1, 1,
-1.778154, -1.375345, -3.020515, 0, 0, 0, 1, 1,
-1.739744, 0.1789996, -2.300453, 0, 0, 0, 1, 1,
-1.737254, -0.8390925, -2.965739, 0, 0, 0, 1, 1,
-1.734022, 1.105686, 1.190347, 0, 0, 0, 1, 1,
-1.729673, 0.4308001, 0.1354478, 0, 0, 0, 1, 1,
-1.723028, -1.583383, -0.748051, 0, 0, 0, 1, 1,
-1.716197, 0.3496921, -2.841293, 0, 0, 0, 1, 1,
-1.711527, 1.001481, 0.4719727, 1, 1, 1, 1, 1,
-1.697659, 1.107461, -0.6944075, 1, 1, 1, 1, 1,
-1.692676, 0.626156, -1.053674, 1, 1, 1, 1, 1,
-1.68339, 0.007238253, -2.785256, 1, 1, 1, 1, 1,
-1.641443, 1.318609, -0.152166, 1, 1, 1, 1, 1,
-1.638774, 0.3242696, -2.585611, 1, 1, 1, 1, 1,
-1.636612, -0.1861107, -2.674337, 1, 1, 1, 1, 1,
-1.634853, 0.5072723, -0.8712763, 1, 1, 1, 1, 1,
-1.597878, 0.3444593, -0.9360055, 1, 1, 1, 1, 1,
-1.592402, -0.6527779, -2.713505, 1, 1, 1, 1, 1,
-1.589131, -0.3083802, -1.533888, 1, 1, 1, 1, 1,
-1.581423, 0.3301378, 0.4504347, 1, 1, 1, 1, 1,
-1.555413, 0.7320451, -0.8792497, 1, 1, 1, 1, 1,
-1.5469, -0.1530338, -2.443797, 1, 1, 1, 1, 1,
-1.537756, 0.2730055, 0.9284324, 1, 1, 1, 1, 1,
-1.537708, 0.9111055, -0.4119795, 0, 0, 1, 1, 1,
-1.533745, -1.076253, -2.073434, 1, 0, 0, 1, 1,
-1.495742, -0.7488108, -1.681045, 1, 0, 0, 1, 1,
-1.484515, 1.043566, -2.275724, 1, 0, 0, 1, 1,
-1.479871, -1.48982, -2.774851, 1, 0, 0, 1, 1,
-1.46134, -0.2596022, -1.931035, 1, 0, 0, 1, 1,
-1.445247, -0.4469504, 0.5853027, 0, 0, 0, 1, 1,
-1.443176, -0.9518939, -1.096497, 0, 0, 0, 1, 1,
-1.431377, 0.1221338, -1.583468, 0, 0, 0, 1, 1,
-1.428752, 1.848069, -0.4123126, 0, 0, 0, 1, 1,
-1.419631, 1.452116, -0.7173463, 0, 0, 0, 1, 1,
-1.416167, 0.01760221, -2.671122, 0, 0, 0, 1, 1,
-1.408188, 0.9357923, -0.2281563, 0, 0, 0, 1, 1,
-1.405774, 1.154717, -2.030941, 1, 1, 1, 1, 1,
-1.393755, -0.03022021, -2.904791, 1, 1, 1, 1, 1,
-1.389119, 0.2048346, -0.3810031, 1, 1, 1, 1, 1,
-1.38818, -0.1920367, -0.5958685, 1, 1, 1, 1, 1,
-1.364684, 0.02757236, -0.4063684, 1, 1, 1, 1, 1,
-1.364627, 3.162744, -0.3956538, 1, 1, 1, 1, 1,
-1.361381, -1.995366, -1.027242, 1, 1, 1, 1, 1,
-1.354584, 0.7285551, 2.317766, 1, 1, 1, 1, 1,
-1.350186, 0.8883446, -0.2174942, 1, 1, 1, 1, 1,
-1.348833, -0.9261208, -2.280446, 1, 1, 1, 1, 1,
-1.34746, -2.024215, -3.269559, 1, 1, 1, 1, 1,
-1.346731, -0.9443326, -3.44696, 1, 1, 1, 1, 1,
-1.34635, 1.890568, -2.375469, 1, 1, 1, 1, 1,
-1.34442, -0.03681294, -1.468246, 1, 1, 1, 1, 1,
-1.333364, 0.4123498, -0.7467211, 1, 1, 1, 1, 1,
-1.329998, 0.3951142, -1.904346, 0, 0, 1, 1, 1,
-1.310239, 0.2535779, -1.394279, 1, 0, 0, 1, 1,
-1.309615, -0.3191675, -2.979963, 1, 0, 0, 1, 1,
-1.306612, -0.0925347, -2.196943, 1, 0, 0, 1, 1,
-1.300098, -2.234596, -2.848588, 1, 0, 0, 1, 1,
-1.297182, -1.385549, -1.861162, 1, 0, 0, 1, 1,
-1.290288, -0.1702713, -0.8935081, 0, 0, 0, 1, 1,
-1.283812, 0.3719272, -3.536457, 0, 0, 0, 1, 1,
-1.280665, -0.5991089, -1.098523, 0, 0, 0, 1, 1,
-1.280601, -0.2459346, -3.158638, 0, 0, 0, 1, 1,
-1.274147, 0.3235106, -1.184206, 0, 0, 0, 1, 1,
-1.208946, 0.7278692, -0.7199412, 0, 0, 0, 1, 1,
-1.206822, -1.128448, -2.63209, 0, 0, 0, 1, 1,
-1.206372, 0.03020742, -2.774331, 1, 1, 1, 1, 1,
-1.198559, -0.7046978, -3.437287, 1, 1, 1, 1, 1,
-1.193699, 1.878209, -0.3081771, 1, 1, 1, 1, 1,
-1.192672, 0.7869332, -0.5318964, 1, 1, 1, 1, 1,
-1.191852, 0.805662, -2.75034, 1, 1, 1, 1, 1,
-1.191831, 1.650065, -0.4602458, 1, 1, 1, 1, 1,
-1.189664, 0.2151819, -0.5985281, 1, 1, 1, 1, 1,
-1.183829, -0.494827, -0.261442, 1, 1, 1, 1, 1,
-1.182669, 0.6979172, -1.26935, 1, 1, 1, 1, 1,
-1.18078, -0.5384659, -1.941244, 1, 1, 1, 1, 1,
-1.176167, -0.02656732, -0.9973914, 1, 1, 1, 1, 1,
-1.1652, 0.3529637, -0.8822954, 1, 1, 1, 1, 1,
-1.162297, 0.4604003, -0.06128711, 1, 1, 1, 1, 1,
-1.160682, -0.8903332, -2.80452, 1, 1, 1, 1, 1,
-1.159627, 0.2917287, -0.001307762, 1, 1, 1, 1, 1,
-1.157568, 0.3342362, -2.928842, 0, 0, 1, 1, 1,
-1.139065, -1.226835, -4.076917, 1, 0, 0, 1, 1,
-1.136509, 0.1819115, -1.659576, 1, 0, 0, 1, 1,
-1.130403, 1.995661, -1.0842, 1, 0, 0, 1, 1,
-1.130334, -0.19086, -2.28023, 1, 0, 0, 1, 1,
-1.12993, 0.3933468, 0.1511457, 1, 0, 0, 1, 1,
-1.1298, -0.7608599, -3.314636, 0, 0, 0, 1, 1,
-1.117947, 0.4304953, -0.05469563, 0, 0, 0, 1, 1,
-1.110772, 1.060919, -0.9062175, 0, 0, 0, 1, 1,
-1.095377, -0.5523574, -0.6595768, 0, 0, 0, 1, 1,
-1.093287, 0.3063358, -1.03244, 0, 0, 0, 1, 1,
-1.091675, -0.6719953, -1.124877, 0, 0, 0, 1, 1,
-1.085694, 1.267886, -1.533266, 0, 0, 0, 1, 1,
-1.083637, -1.587901, -1.943525, 1, 1, 1, 1, 1,
-1.080888, 1.595252, -0.3766987, 1, 1, 1, 1, 1,
-1.076093, 0.5744956, -0.2908645, 1, 1, 1, 1, 1,
-1.068637, -2.002715, -3.981028, 1, 1, 1, 1, 1,
-1.058506, -0.9996594, -4.331427, 1, 1, 1, 1, 1,
-1.058416, 0.3544159, -1.68279, 1, 1, 1, 1, 1,
-1.035506, 1.545372, 0.7726771, 1, 1, 1, 1, 1,
-1.023911, 0.7169328, -1.006646, 1, 1, 1, 1, 1,
-1.022315, 0.06579655, -1.763358, 1, 1, 1, 1, 1,
-1.020814, -0.4439855, -1.450702, 1, 1, 1, 1, 1,
-1.015304, -1.852421, -2.897207, 1, 1, 1, 1, 1,
-1.011931, -0.6904877, -2.356157, 1, 1, 1, 1, 1,
-1.006238, -0.3987811, -2.746705, 1, 1, 1, 1, 1,
-0.9882771, 0.123535, -0.9638695, 1, 1, 1, 1, 1,
-0.9880395, -0.4323697, -0.5220003, 1, 1, 1, 1, 1,
-0.985256, -0.05582117, -1.225468, 0, 0, 1, 1, 1,
-0.9819559, -0.7405159, -1.981045, 1, 0, 0, 1, 1,
-0.9819394, 0.2487538, -1.325035, 1, 0, 0, 1, 1,
-0.9791573, -0.7611685, -2.164717, 1, 0, 0, 1, 1,
-0.976814, -0.5848635, -2.195045, 1, 0, 0, 1, 1,
-0.9696218, 0.7824428, -2.854705, 1, 0, 0, 1, 1,
-0.9693338, -1.097235, -2.404938, 0, 0, 0, 1, 1,
-0.9664502, -1.360827, -3.010914, 0, 0, 0, 1, 1,
-0.9647417, 0.5836523, -1.858113, 0, 0, 0, 1, 1,
-0.9585053, -0.5287383, -4.314908, 0, 0, 0, 1, 1,
-0.9479097, 0.281441, -2.264618, 0, 0, 0, 1, 1,
-0.9444937, -1.522385, -4.500266, 0, 0, 0, 1, 1,
-0.9441984, -0.01982605, -1.945825, 0, 0, 0, 1, 1,
-0.9391888, -0.3438063, -2.415204, 1, 1, 1, 1, 1,
-0.9365832, -0.3425023, -3.142347, 1, 1, 1, 1, 1,
-0.9358398, 0.7233027, -0.8974863, 1, 1, 1, 1, 1,
-0.9331999, -1.03579, -2.020014, 1, 1, 1, 1, 1,
-0.9287118, 1.074949, -1.271512, 1, 1, 1, 1, 1,
-0.9255835, -0.8165125, -3.191899, 1, 1, 1, 1, 1,
-0.9213123, -0.4471514, -2.260335, 1, 1, 1, 1, 1,
-0.9160324, -0.6555775, -4.064248, 1, 1, 1, 1, 1,
-0.9015803, 0.1933933, -1.296128, 1, 1, 1, 1, 1,
-0.9015309, -0.6885989, -1.083085, 1, 1, 1, 1, 1,
-0.8954267, -0.5531614, -2.273386, 1, 1, 1, 1, 1,
-0.8934792, -0.07416701, -1.526658, 1, 1, 1, 1, 1,
-0.8917279, 0.1293481, -1.877031, 1, 1, 1, 1, 1,
-0.8778152, -1.309606, -4.114558, 1, 1, 1, 1, 1,
-0.8732491, -0.5025164, -2.381074, 1, 1, 1, 1, 1,
-0.8718106, 0.4700354, -1.488727, 0, 0, 1, 1, 1,
-0.8695692, 1.168324, -1.515179, 1, 0, 0, 1, 1,
-0.8677454, 0.3111822, -1.084256, 1, 0, 0, 1, 1,
-0.8630746, 0.2115408, -1.020684, 1, 0, 0, 1, 1,
-0.8515439, -1.758338, -2.304799, 1, 0, 0, 1, 1,
-0.8498574, -0.6959743, -3.344481, 1, 0, 0, 1, 1,
-0.8450266, -1.015361, -3.69751, 0, 0, 0, 1, 1,
-0.8434795, -0.2232707, -0.7103196, 0, 0, 0, 1, 1,
-0.8419464, 0.4670912, 0.5946216, 0, 0, 0, 1, 1,
-0.8399698, -1.301071, -1.550535, 0, 0, 0, 1, 1,
-0.837335, 0.9823532, -0.3186305, 0, 0, 0, 1, 1,
-0.8340457, -0.2400598, -2.115962, 0, 0, 0, 1, 1,
-0.8337613, 2.271368, -0.934364, 0, 0, 0, 1, 1,
-0.832629, -0.0939263, -1.498546, 1, 1, 1, 1, 1,
-0.8312177, 0.4897916, -2.902366, 1, 1, 1, 1, 1,
-0.8301287, 2.164724, -0.4563314, 1, 1, 1, 1, 1,
-0.8283418, -1.703246, -2.800688, 1, 1, 1, 1, 1,
-0.8222395, 0.7980497, -1.63726, 1, 1, 1, 1, 1,
-0.8215344, 0.9496434, -1.0187, 1, 1, 1, 1, 1,
-0.8181795, -1.365404, -2.965568, 1, 1, 1, 1, 1,
-0.8176705, 1.107406, 0.2222365, 1, 1, 1, 1, 1,
-0.8156387, -1.480909, -3.917755, 1, 1, 1, 1, 1,
-0.8139025, 2.106048, 0.612512, 1, 1, 1, 1, 1,
-0.8122311, 1.56827, -2.280302, 1, 1, 1, 1, 1,
-0.8067352, 0.7281547, -1.438741, 1, 1, 1, 1, 1,
-0.8043175, 1.306114, -1.416103, 1, 1, 1, 1, 1,
-0.8025765, -2.27011, -3.253996, 1, 1, 1, 1, 1,
-0.8006403, -0.792666, -3.828065, 1, 1, 1, 1, 1,
-0.7998975, 3.156719, 0.8251563, 0, 0, 1, 1, 1,
-0.7982794, -0.01585029, -3.898597, 1, 0, 0, 1, 1,
-0.7938472, 0.8525194, -0.9927865, 1, 0, 0, 1, 1,
-0.7936934, 0.0232114, -1.949918, 1, 0, 0, 1, 1,
-0.7906309, -1.076135, -2.675485, 1, 0, 0, 1, 1,
-0.7901628, -2.326471, -3.379733, 1, 0, 0, 1, 1,
-0.7897022, -1.396672, -5.230417, 0, 0, 0, 1, 1,
-0.7835417, 1.182328, -0.4115656, 0, 0, 0, 1, 1,
-0.7785424, -1.086101, -6.239012, 0, 0, 0, 1, 1,
-0.7732757, 2.034125, -0.9395491, 0, 0, 0, 1, 1,
-0.7731707, 0.5365626, -3.043681, 0, 0, 0, 1, 1,
-0.7711192, -0.6163586, -1.268964, 0, 0, 0, 1, 1,
-0.7648204, -0.4177791, -1.854205, 0, 0, 0, 1, 1,
-0.7622697, 0.01531468, -1.823328, 1, 1, 1, 1, 1,
-0.7607352, 1.593828, 1.738752, 1, 1, 1, 1, 1,
-0.7589289, -0.10054, -2.667852, 1, 1, 1, 1, 1,
-0.7549375, -0.1026837, -1.491477, 1, 1, 1, 1, 1,
-0.7502409, -0.2576984, -2.189095, 1, 1, 1, 1, 1,
-0.7433395, 0.9573849, -0.1879463, 1, 1, 1, 1, 1,
-0.7376907, 0.07794076, -2.371227, 1, 1, 1, 1, 1,
-0.7284275, -0.2958451, -3.107017, 1, 1, 1, 1, 1,
-0.7281843, -0.733458, -1.820116, 1, 1, 1, 1, 1,
-0.7274277, -0.2172014, -1.499053, 1, 1, 1, 1, 1,
-0.7245688, -0.2079175, -1.322497, 1, 1, 1, 1, 1,
-0.7231768, 1.025443, 0.406945, 1, 1, 1, 1, 1,
-0.722334, 1.231739, 0.4164179, 1, 1, 1, 1, 1,
-0.7203331, 0.06654982, -2.414306, 1, 1, 1, 1, 1,
-0.7193263, -0.8304639, -1.352737, 1, 1, 1, 1, 1,
-0.7131661, 1.067899, -1.108056, 0, 0, 1, 1, 1,
-0.7128842, -0.5485181, -1.195702, 1, 0, 0, 1, 1,
-0.7101154, 0.3804837, -2.571105, 1, 0, 0, 1, 1,
-0.7014832, -1.006476, -3.968715, 1, 0, 0, 1, 1,
-0.6968556, -1.191596, -2.633208, 1, 0, 0, 1, 1,
-0.69288, 1.371503, -1.209059, 1, 0, 0, 1, 1,
-0.689097, -0.05958506, -0.9782842, 0, 0, 0, 1, 1,
-0.6870889, -0.005870979, -1.198339, 0, 0, 0, 1, 1,
-0.6842039, -0.9611532, -3.350829, 0, 0, 0, 1, 1,
-0.6832837, 1.092761, -1.223912, 0, 0, 0, 1, 1,
-0.6830089, -1.385752, -2.374963, 0, 0, 0, 1, 1,
-0.67782, -0.1236238, -1.741424, 0, 0, 0, 1, 1,
-0.6734184, -0.5717872, -2.841902, 0, 0, 0, 1, 1,
-0.671026, 0.3925321, -2.154821, 1, 1, 1, 1, 1,
-0.6697206, -1.092043, -3.051679, 1, 1, 1, 1, 1,
-0.6694025, -0.1272168, -2.010931, 1, 1, 1, 1, 1,
-0.6625272, -0.06123151, -1.650915, 1, 1, 1, 1, 1,
-0.6616149, -0.7881064, -1.813696, 1, 1, 1, 1, 1,
-0.6599457, 0.1361407, -1.415393, 1, 1, 1, 1, 1,
-0.6536021, 1.747668, -0.8324388, 1, 1, 1, 1, 1,
-0.6526766, 0.01180347, -2.336674, 1, 1, 1, 1, 1,
-0.6498635, -3.230963, -3.464487, 1, 1, 1, 1, 1,
-0.6494497, 0.577662, -1.751781, 1, 1, 1, 1, 1,
-0.6487767, -0.03485466, -0.1559938, 1, 1, 1, 1, 1,
-0.6481214, 0.8516108, -0.9066136, 1, 1, 1, 1, 1,
-0.6478127, -0.4904327, -0.7122149, 1, 1, 1, 1, 1,
-0.6455956, -0.8083063, -2.340751, 1, 1, 1, 1, 1,
-0.6434963, 0.8695, -0.2604422, 1, 1, 1, 1, 1,
-0.641209, -0.4606665, 0.453988, 0, 0, 1, 1, 1,
-0.6396157, -2.607595, -2.7054, 1, 0, 0, 1, 1,
-0.6370507, -0.8564546, -3.470201, 1, 0, 0, 1, 1,
-0.632604, 0.9044838, 0.3348617, 1, 0, 0, 1, 1,
-0.6320779, 0.6758342, -0.1747601, 1, 0, 0, 1, 1,
-0.6307162, 0.7609575, -1.214848, 1, 0, 0, 1, 1,
-0.6293561, 1.209099, -0.06187779, 0, 0, 0, 1, 1,
-0.6291388, -0.5867314, -2.304727, 0, 0, 0, 1, 1,
-0.6290174, 0.4019433, -1.013878, 0, 0, 0, 1, 1,
-0.6289716, 0.9974577, -1.575239, 0, 0, 0, 1, 1,
-0.6287884, 0.8709891, 0.1355492, 0, 0, 0, 1, 1,
-0.62492, -0.7503222, -1.781882, 0, 0, 0, 1, 1,
-0.6205614, 0.644155, -1.979054, 0, 0, 0, 1, 1,
-0.6158892, 0.3319455, -0.3557606, 1, 1, 1, 1, 1,
-0.6139395, 2.05638, 0.3904401, 1, 1, 1, 1, 1,
-0.613553, 0.09904631, -1.162418, 1, 1, 1, 1, 1,
-0.6074409, 0.1983612, -0.9743264, 1, 1, 1, 1, 1,
-0.6072041, -1.386113, -2.205898, 1, 1, 1, 1, 1,
-0.602783, 1.116173, -1.909289, 1, 1, 1, 1, 1,
-0.6024868, 1.647232, 0.6514716, 1, 1, 1, 1, 1,
-0.5995446, -1.090658, -1.872307, 1, 1, 1, 1, 1,
-0.5947555, -0.2432311, -1.32344, 1, 1, 1, 1, 1,
-0.5910754, -0.8418172, -2.317604, 1, 1, 1, 1, 1,
-0.5901645, -0.001056765, -0.830362, 1, 1, 1, 1, 1,
-0.5884589, -0.3127097, -2.521366, 1, 1, 1, 1, 1,
-0.5883702, -0.4604961, -2.577847, 1, 1, 1, 1, 1,
-0.5870643, -1.115272, -2.741396, 1, 1, 1, 1, 1,
-0.5866336, 0.4064361, -0.01027149, 1, 1, 1, 1, 1,
-0.5866067, -1.012089, -1.909105, 0, 0, 1, 1, 1,
-0.5815762, -0.6945186, -1.820165, 1, 0, 0, 1, 1,
-0.5771657, 0.4975, -1.040202, 1, 0, 0, 1, 1,
-0.5759667, -0.6674484, -2.745306, 1, 0, 0, 1, 1,
-0.5747759, 0.2212015, -2.678756, 1, 0, 0, 1, 1,
-0.5683658, 1.203015, 1.254908, 1, 0, 0, 1, 1,
-0.562065, 1.062742, -0.5567774, 0, 0, 0, 1, 1,
-0.5615925, 0.3167955, -0.9159086, 0, 0, 0, 1, 1,
-0.5610204, 0.562196, 0.0427783, 0, 0, 0, 1, 1,
-0.5575276, 0.8881342, -0.3022969, 0, 0, 0, 1, 1,
-0.5572971, 0.2516501, -1.371811, 0, 0, 0, 1, 1,
-0.5568733, 0.3682709, -2.377904, 0, 0, 0, 1, 1,
-0.5563505, 0.6975535, -0.624079, 0, 0, 0, 1, 1,
-0.5547101, 0.6373205, -2.586052, 1, 1, 1, 1, 1,
-0.5511984, 0.1258134, -0.791998, 1, 1, 1, 1, 1,
-0.5471679, 0.6362542, -0.5480638, 1, 1, 1, 1, 1,
-0.5418807, 0.9296028, -1.349518, 1, 1, 1, 1, 1,
-0.5363721, 0.6086624, -0.6065387, 1, 1, 1, 1, 1,
-0.5327865, 1.380567, -0.9379378, 1, 1, 1, 1, 1,
-0.5322575, 0.08592524, -1.495405, 1, 1, 1, 1, 1,
-0.5320083, -1.017421, -1.517658, 1, 1, 1, 1, 1,
-0.5282715, -1.281627, -2.754487, 1, 1, 1, 1, 1,
-0.5279171, 0.7493058, 0.7696461, 1, 1, 1, 1, 1,
-0.5259293, -1.523786, -1.810332, 1, 1, 1, 1, 1,
-0.5183439, -2.372605, -3.361423, 1, 1, 1, 1, 1,
-0.5122562, 1.294438, 0.7146853, 1, 1, 1, 1, 1,
-0.5096411, 0.2095311, -0.1071262, 1, 1, 1, 1, 1,
-0.5070654, 0.8332487, -0.0115182, 1, 1, 1, 1, 1,
-0.5036262, -3.740248, -3.339687, 0, 0, 1, 1, 1,
-0.5024552, 0.3054385, -0.4746559, 1, 0, 0, 1, 1,
-0.5012559, 0.542758, -0.9302439, 1, 0, 0, 1, 1,
-0.4991043, 2.61484, -0.268783, 1, 0, 0, 1, 1,
-0.4949446, 1.87305, 1.585204, 1, 0, 0, 1, 1,
-0.4942344, -1.048064, -2.143086, 1, 0, 0, 1, 1,
-0.4920614, -0.4785022, -0.770204, 0, 0, 0, 1, 1,
-0.4834355, 0.9883323, 0.8420456, 0, 0, 0, 1, 1,
-0.4815222, 1.267409, 1.38188, 0, 0, 0, 1, 1,
-0.4813049, 1.058229, 0.4980431, 0, 0, 0, 1, 1,
-0.4804854, -0.5507543, -2.464824, 0, 0, 0, 1, 1,
-0.4801634, -1.741219, -1.978033, 0, 0, 0, 1, 1,
-0.4742708, -0.4417482, -2.480226, 0, 0, 0, 1, 1,
-0.4737723, -0.1623548, -1.5954, 1, 1, 1, 1, 1,
-0.4685778, 0.3307414, -2.429151, 1, 1, 1, 1, 1,
-0.4666036, 0.7431954, 0.1675944, 1, 1, 1, 1, 1,
-0.464223, 1.725682, -2.003984, 1, 1, 1, 1, 1,
-0.4633526, 1.521759, -0.1740273, 1, 1, 1, 1, 1,
-0.4617345, 1.370301, -0.248216, 1, 1, 1, 1, 1,
-0.4610838, -2.030002, -3.156435, 1, 1, 1, 1, 1,
-0.4598885, 1.031434, 0.6762233, 1, 1, 1, 1, 1,
-0.4556331, -0.7569466, -1.354529, 1, 1, 1, 1, 1,
-0.4555035, 0.8948125, 2.057033, 1, 1, 1, 1, 1,
-0.4503768, -0.7501256, -4.112569, 1, 1, 1, 1, 1,
-0.4503579, -0.02970277, -0.7830494, 1, 1, 1, 1, 1,
-0.4497474, 2.446507, 0.1996886, 1, 1, 1, 1, 1,
-0.4449983, 0.6245478, -0.04981435, 1, 1, 1, 1, 1,
-0.4383993, 1.371996, -0.241894, 1, 1, 1, 1, 1,
-0.433722, 1.394542, -0.3000866, 0, 0, 1, 1, 1,
-0.4311651, 0.2930868, -1.440729, 1, 0, 0, 1, 1,
-0.4291142, -0.2778114, -2.213275, 1, 0, 0, 1, 1,
-0.4223256, 0.04130785, -2.172043, 1, 0, 0, 1, 1,
-0.4190699, 0.6621172, 0.1581056, 1, 0, 0, 1, 1,
-0.4181885, 1.342053, -0.7658316, 1, 0, 0, 1, 1,
-0.4101739, -0.666081, -2.432025, 0, 0, 0, 1, 1,
-0.4059339, 0.02368122, -0.6498331, 0, 0, 0, 1, 1,
-0.405417, 0.04199234, -0.6125643, 0, 0, 0, 1, 1,
-0.4049062, 0.03302243, 0.290358, 0, 0, 0, 1, 1,
-0.4045678, 0.9609936, -0.6032102, 0, 0, 0, 1, 1,
-0.4041586, 0.5086727, -1.46285, 0, 0, 0, 1, 1,
-0.4021566, 0.3835209, -0.4825723, 0, 0, 0, 1, 1,
-0.401116, 1.428029, -0.6087358, 1, 1, 1, 1, 1,
-0.3975641, -0.7268025, -4.365678, 1, 1, 1, 1, 1,
-0.3967145, -1.83248, -2.673221, 1, 1, 1, 1, 1,
-0.3943563, 0.1302782, -1.220603, 1, 1, 1, 1, 1,
-0.3935224, -0.03236136, -1.422427, 1, 1, 1, 1, 1,
-0.3914984, 0.5311175, -1.560237, 1, 1, 1, 1, 1,
-0.3802535, -1.147005, -1.876748, 1, 1, 1, 1, 1,
-0.379276, 0.6460775, -0.08839269, 1, 1, 1, 1, 1,
-0.3728501, 0.1015437, -1.331639, 1, 1, 1, 1, 1,
-0.3703732, -0.5187595, -3.028466, 1, 1, 1, 1, 1,
-0.3657536, -0.6308458, -3.547379, 1, 1, 1, 1, 1,
-0.3618563, -1.498224, -4.007973, 1, 1, 1, 1, 1,
-0.3601007, -0.8205656, -1.613626, 1, 1, 1, 1, 1,
-0.3598129, 1.009315, -0.810708, 1, 1, 1, 1, 1,
-0.359577, 1.403169, -0.701456, 1, 1, 1, 1, 1,
-0.3577418, -0.3106229, -2.108615, 0, 0, 1, 1, 1,
-0.3543804, 0.06368916, -0.9165871, 1, 0, 0, 1, 1,
-0.3501782, 0.5323529, -0.9143253, 1, 0, 0, 1, 1,
-0.349644, 0.999607, 0.6473282, 1, 0, 0, 1, 1,
-0.3446655, -1.136703, -3.5422, 1, 0, 0, 1, 1,
-0.3407417, 0.5666992, 0.9921152, 1, 0, 0, 1, 1,
-0.3281657, -2.202828, -3.103918, 0, 0, 0, 1, 1,
-0.3276433, 0.09000298, -0.4440838, 0, 0, 0, 1, 1,
-0.3243361, -0.6477135, -2.002898, 0, 0, 0, 1, 1,
-0.3238332, 1.307636, -0.6558433, 0, 0, 0, 1, 1,
-0.3222445, 0.3323123, -1.933588, 0, 0, 0, 1, 1,
-0.3207118, 0.08745144, -1.390945, 0, 0, 0, 1, 1,
-0.3179016, -0.2798077, -4.226788, 0, 0, 0, 1, 1,
-0.3017871, 2.316074, 1.147534, 1, 1, 1, 1, 1,
-0.3004736, -0.2132642, -0.7909253, 1, 1, 1, 1, 1,
-0.299861, -1.37459, -2.091421, 1, 1, 1, 1, 1,
-0.2973902, 0.6651577, -0.205965, 1, 1, 1, 1, 1,
-0.2913212, -0.5107397, -2.609237, 1, 1, 1, 1, 1,
-0.2883359, 2.019432, -0.6550571, 1, 1, 1, 1, 1,
-0.2882141, 0.330887, -1.285687, 1, 1, 1, 1, 1,
-0.2775592, -0.4514596, -3.046787, 1, 1, 1, 1, 1,
-0.2753453, -0.8372883, -1.792298, 1, 1, 1, 1, 1,
-0.2750363, -1.24724, -3.163362, 1, 1, 1, 1, 1,
-0.2733745, 0.1941261, 0.9427312, 1, 1, 1, 1, 1,
-0.272735, -1.175372, -3.612329, 1, 1, 1, 1, 1,
-0.2706837, 0.4398059, -1.057898, 1, 1, 1, 1, 1,
-0.2692531, -1.11917, -2.651769, 1, 1, 1, 1, 1,
-0.2685738, 0.1500238, 0.1843661, 1, 1, 1, 1, 1,
-0.2683867, -0.4558428, -3.610822, 0, 0, 1, 1, 1,
-0.2672029, 0.2105002, -0.717304, 1, 0, 0, 1, 1,
-0.248443, -0.5515691, -3.501856, 1, 0, 0, 1, 1,
-0.2413843, -2.675204, -3.402532, 1, 0, 0, 1, 1,
-0.2410943, -0.6314154, -5.078277, 1, 0, 0, 1, 1,
-0.2402155, -1.099117, -3.851667, 1, 0, 0, 1, 1,
-0.2391265, 1.042465, 0.4273803, 0, 0, 0, 1, 1,
-0.236487, 1.104699, 0.122672, 0, 0, 0, 1, 1,
-0.235397, 0.06910928, -1.302761, 0, 0, 0, 1, 1,
-0.2234691, 1.523197, 0.1990092, 0, 0, 0, 1, 1,
-0.2230058, 0.3356336, -0.2895634, 0, 0, 0, 1, 1,
-0.2218133, 1.236088, -1.468772, 0, 0, 0, 1, 1,
-0.2202785, -0.168657, -3.428075, 0, 0, 0, 1, 1,
-0.2192142, 0.7191993, -1.583088, 1, 1, 1, 1, 1,
-0.2173265, 1.887592, 0.6328374, 1, 1, 1, 1, 1,
-0.2153143, 0.2474632, 1.816511, 1, 1, 1, 1, 1,
-0.208771, -1.548529, -3.756073, 1, 1, 1, 1, 1,
-0.2085155, 2.2788, -0.09712293, 1, 1, 1, 1, 1,
-0.2018853, 0.2597061, -0.3594782, 1, 1, 1, 1, 1,
-0.2015459, -0.7135455, -1.876768, 1, 1, 1, 1, 1,
-0.1986698, -0.6109882, -5.176612, 1, 1, 1, 1, 1,
-0.1967814, 1.46896, -0.6507506, 1, 1, 1, 1, 1,
-0.1959381, -0.1816634, -0.1248947, 1, 1, 1, 1, 1,
-0.1935763, 0.5063642, 0.4321023, 1, 1, 1, 1, 1,
-0.1927336, 0.1598273, -0.5888342, 1, 1, 1, 1, 1,
-0.1896644, 0.8853101, -0.3571297, 1, 1, 1, 1, 1,
-0.1887135, 0.760418, 1.550516, 1, 1, 1, 1, 1,
-0.1881621, -0.8581954, -3.462132, 1, 1, 1, 1, 1,
-0.1879354, -1.352394, -2.161872, 0, 0, 1, 1, 1,
-0.1871504, 0.1724649, -1.816092, 1, 0, 0, 1, 1,
-0.186431, -0.03087386, -1.839129, 1, 0, 0, 1, 1,
-0.1825608, -0.5644252, -3.582656, 1, 0, 0, 1, 1,
-0.1808306, -0.08570009, -2.346035, 1, 0, 0, 1, 1,
-0.1781301, -0.1007619, -2.867612, 1, 0, 0, 1, 1,
-0.1780324, 0.01734016, -1.428117, 0, 0, 0, 1, 1,
-0.1778379, 1.019473, 0.9420386, 0, 0, 0, 1, 1,
-0.1731473, -1.694449, -2.881267, 0, 0, 0, 1, 1,
-0.171629, -1.103726, -3.410485, 0, 0, 0, 1, 1,
-0.1686233, -0.8693037, -0.6677213, 0, 0, 0, 1, 1,
-0.1645222, 0.8378166, -0.7841569, 0, 0, 0, 1, 1,
-0.1623112, -2.290189, -3.95889, 0, 0, 0, 1, 1,
-0.1610873, 0.475344, -1.075614, 1, 1, 1, 1, 1,
-0.1587486, -0.2948486, -2.994688, 1, 1, 1, 1, 1,
-0.1572852, 0.6601351, 0.405169, 1, 1, 1, 1, 1,
-0.1568929, -0.1261954, -1.581993, 1, 1, 1, 1, 1,
-0.1560013, -0.4039993, -3.021845, 1, 1, 1, 1, 1,
-0.154993, 2.222767, -0.7966615, 1, 1, 1, 1, 1,
-0.1536225, -1.20573, -3.399543, 1, 1, 1, 1, 1,
-0.152225, -0.38552, -3.361293, 1, 1, 1, 1, 1,
-0.1519089, 0.5917655, -2.477887, 1, 1, 1, 1, 1,
-0.1504294, -2.193346, -2.683687, 1, 1, 1, 1, 1,
-0.1499393, -0.3387066, -4.725367, 1, 1, 1, 1, 1,
-0.1496039, -0.5484573, -3.205235, 1, 1, 1, 1, 1,
-0.1400206, 0.1288185, 0.9271945, 1, 1, 1, 1, 1,
-0.1392979, -1.400944, -3.495469, 1, 1, 1, 1, 1,
-0.1367426, 0.1805326, -0.4336661, 1, 1, 1, 1, 1,
-0.1296636, 1.85062, -0.03182262, 0, 0, 1, 1, 1,
-0.1220523, 1.103449, -1.517397, 1, 0, 0, 1, 1,
-0.119158, 1.041611, -1.702006, 1, 0, 0, 1, 1,
-0.1137138, 1.668878, 2.377443, 1, 0, 0, 1, 1,
-0.1127407, 0.6897389, 0.1961773, 1, 0, 0, 1, 1,
-0.1093712, -0.4278222, -3.333736, 1, 0, 0, 1, 1,
-0.1090362, -0.3633861, 0.1179493, 0, 0, 0, 1, 1,
-0.1071613, -1.617003, -1.15892, 0, 0, 0, 1, 1,
-0.1038164, 1.762207, -0.4316403, 0, 0, 0, 1, 1,
-0.1033816, 1.586969, 1.255875, 0, 0, 0, 1, 1,
-0.09605691, -0.6175527, -5.188752, 0, 0, 0, 1, 1,
-0.09342293, 1.176502, -2.317548, 0, 0, 0, 1, 1,
-0.09126878, -0.06013061, -2.043249, 0, 0, 0, 1, 1,
-0.08943943, 0.5944532, -0.5434685, 1, 1, 1, 1, 1,
-0.08488446, 0.9117792, 1.024341, 1, 1, 1, 1, 1,
-0.08458899, 0.2789481, -1.230514, 1, 1, 1, 1, 1,
-0.08304759, 0.9804549, -1.779551, 1, 1, 1, 1, 1,
-0.07904521, 0.7517779, 0.1917257, 1, 1, 1, 1, 1,
-0.07721693, 0.9941812, 1.448732, 1, 1, 1, 1, 1,
-0.07249095, 0.2216413, -0.2292969, 1, 1, 1, 1, 1,
-0.06654462, -0.4214294, -2.539221, 1, 1, 1, 1, 1,
-0.06595388, -0.674673, -2.492275, 1, 1, 1, 1, 1,
-0.05743011, 1.001143, -0.1655784, 1, 1, 1, 1, 1,
-0.05430711, -0.4966561, -2.338412, 1, 1, 1, 1, 1,
-0.04131132, 0.2121169, 0.2714741, 1, 1, 1, 1, 1,
-0.04063743, -0.01382237, -0.5266513, 1, 1, 1, 1, 1,
-0.03950553, -0.571599, -2.895603, 1, 1, 1, 1, 1,
-0.03631334, -0.8278733, -2.946253, 1, 1, 1, 1, 1,
-0.0350499, 0.4900469, 0.2710379, 0, 0, 1, 1, 1,
-0.03077821, 0.1756452, -2.936107, 1, 0, 0, 1, 1,
-0.02951605, -2.059885, -1.345386, 1, 0, 0, 1, 1,
-0.02929894, -0.9765689, -3.621115, 1, 0, 0, 1, 1,
-0.02723282, 0.7136534, 1.008814, 1, 0, 0, 1, 1,
-0.02186143, -0.443218, -2.459233, 1, 0, 0, 1, 1,
-0.02012584, 0.4202321, -2.621736, 0, 0, 0, 1, 1,
-0.01980075, -1.456007, -4.140788, 0, 0, 0, 1, 1,
-0.01741254, -1.060617, -3.552457, 0, 0, 0, 1, 1,
-0.0146075, -0.262633, -3.460282, 0, 0, 0, 1, 1,
-0.01297788, -0.8787624, -2.02359, 0, 0, 0, 1, 1,
-0.007598932, 1.151209, -0.8639533, 0, 0, 0, 1, 1,
-0.005057889, -0.8456602, -2.908015, 0, 0, 0, 1, 1,
-0.001895396, 2.003908, 0.30372, 1, 1, 1, 1, 1,
-0.001182949, -1.207723, -1.760398, 1, 1, 1, 1, 1,
0.000217959, 0.4413552, -0.9187828, 1, 1, 1, 1, 1,
0.0004179331, -0.3326518, 2.330473, 1, 1, 1, 1, 1,
0.001887188, -1.024499, 3.066984, 1, 1, 1, 1, 1,
0.01695015, -1.07464, 3.83313, 1, 1, 1, 1, 1,
0.02103852, -0.1770309, 3.994731, 1, 1, 1, 1, 1,
0.02187571, -1.63679, 1.613555, 1, 1, 1, 1, 1,
0.02604471, 0.9209087, 0.7742438, 1, 1, 1, 1, 1,
0.02767329, -0.1881476, 2.11684, 1, 1, 1, 1, 1,
0.02837742, 2.266526, 1.5682, 1, 1, 1, 1, 1,
0.02848118, 1.132986, 0.5509568, 1, 1, 1, 1, 1,
0.02938954, 1.363484, 0.5075975, 1, 1, 1, 1, 1,
0.03060279, 1.16143, 1.546948, 1, 1, 1, 1, 1,
0.03179365, -0.6472965, 1.781991, 1, 1, 1, 1, 1,
0.03831238, -0.3426329, 3.314632, 0, 0, 1, 1, 1,
0.03914629, -0.01210148, 1.713482, 1, 0, 0, 1, 1,
0.03995375, 0.9450197, 1.131282, 1, 0, 0, 1, 1,
0.04161076, 0.3792385, -0.3136629, 1, 0, 0, 1, 1,
0.04166927, 1.256329, -1.68131, 1, 0, 0, 1, 1,
0.04362046, 0.2699301, 0.8362707, 1, 0, 0, 1, 1,
0.04774961, 1.269717, 0.8908635, 0, 0, 0, 1, 1,
0.04966516, -0.8485956, 4.967972, 0, 0, 0, 1, 1,
0.0565716, 0.8529028, 1.885037, 0, 0, 0, 1, 1,
0.05978006, -0.3791205, 1.593071, 0, 0, 0, 1, 1,
0.06057278, -0.9197072, 4.086553, 0, 0, 0, 1, 1,
0.06094756, -0.5169402, 3.219106, 0, 0, 0, 1, 1,
0.06128273, 1.441314, 1.523711, 0, 0, 0, 1, 1,
0.06224031, -0.1616599, 3.286045, 1, 1, 1, 1, 1,
0.06322645, 0.818309, 0.9347665, 1, 1, 1, 1, 1,
0.07032224, 0.1075664, 1.970129, 1, 1, 1, 1, 1,
0.07666215, -0.6872221, 4.464001, 1, 1, 1, 1, 1,
0.07713754, 0.5325664, 0.106613, 1, 1, 1, 1, 1,
0.08589152, 0.7828004, 0.7169275, 1, 1, 1, 1, 1,
0.08623458, 0.6588939, 0.5131889, 1, 1, 1, 1, 1,
0.08652902, 0.1359657, 1.012878, 1, 1, 1, 1, 1,
0.09128707, -1.386433, 3.17425, 1, 1, 1, 1, 1,
0.0932695, 1.238756, -0.8273165, 1, 1, 1, 1, 1,
0.09538098, -0.06523042, 1.543459, 1, 1, 1, 1, 1,
0.09701677, -0.748293, 1.936401, 1, 1, 1, 1, 1,
0.09729282, 0.5213403, 0.004190502, 1, 1, 1, 1, 1,
0.1011606, 0.9729659, 0.1864644, 1, 1, 1, 1, 1,
0.1059121, 1.439547, -0.2723996, 1, 1, 1, 1, 1,
0.1059424, -0.5564139, 4.044745, 0, 0, 1, 1, 1,
0.1106447, -0.7493632, 3.68263, 1, 0, 0, 1, 1,
0.1131749, -0.7110801, 1.485766, 1, 0, 0, 1, 1,
0.1178906, -0.6671956, 2.838766, 1, 0, 0, 1, 1,
0.1183647, 0.8579888, -0.6117972, 1, 0, 0, 1, 1,
0.119658, -0.2168578, 2.926853, 1, 0, 0, 1, 1,
0.1213814, 1.829593, 0.1478793, 0, 0, 0, 1, 1,
0.1218176, 0.4040124, -0.5833783, 0, 0, 0, 1, 1,
0.1239487, 0.8019407, 1.407686, 0, 0, 0, 1, 1,
0.1244422, -0.1474686, 2.394297, 0, 0, 0, 1, 1,
0.1281241, 0.5808623, 1.311824, 0, 0, 0, 1, 1,
0.1289522, 0.721357, -1.230106, 0, 0, 0, 1, 1,
0.1388722, -0.1632487, 2.707104, 0, 0, 0, 1, 1,
0.1405361, 1.499003, 0.2499309, 1, 1, 1, 1, 1,
0.1433722, -0.28528, 2.741039, 1, 1, 1, 1, 1,
0.1531356, -0.2015072, 3.090577, 1, 1, 1, 1, 1,
0.1545, 1.229694, -0.03639023, 1, 1, 1, 1, 1,
0.1632058, 0.5148444, -0.9714574, 1, 1, 1, 1, 1,
0.1632925, -2.367722, 5.097535, 1, 1, 1, 1, 1,
0.1655158, -0.1480344, 0.8892629, 1, 1, 1, 1, 1,
0.166283, -1.221725, 2.989799, 1, 1, 1, 1, 1,
0.1672869, -1.625396, 4.489491, 1, 1, 1, 1, 1,
0.1709089, 1.208752, -0.8946375, 1, 1, 1, 1, 1,
0.1747486, 0.6507881, 1.527889, 1, 1, 1, 1, 1,
0.1751198, 1.388883, -0.08817867, 1, 1, 1, 1, 1,
0.1761511, -2.086266, 4.21664, 1, 1, 1, 1, 1,
0.1814647, 0.071164, 1.732086, 1, 1, 1, 1, 1,
0.1817676, -0.2900272, 2.887302, 1, 1, 1, 1, 1,
0.1820323, -1.961169, 2.154956, 0, 0, 1, 1, 1,
0.1851773, -2.752485, 1.903432, 1, 0, 0, 1, 1,
0.1858312, -0.01203031, 2.319616, 1, 0, 0, 1, 1,
0.1899612, -0.02131254, 1.814197, 1, 0, 0, 1, 1,
0.1900392, 0.2734448, -0.6603753, 1, 0, 0, 1, 1,
0.1924636, -1.309804, 4.168609, 1, 0, 0, 1, 1,
0.1937499, -0.4503884, 3.123117, 0, 0, 0, 1, 1,
0.1949844, -0.3366005, 2.617884, 0, 0, 0, 1, 1,
0.1964392, 0.5475405, 0.04793888, 0, 0, 0, 1, 1,
0.2014876, -0.6335691, 3.471128, 0, 0, 0, 1, 1,
0.2039533, 0.03853416, 2.51723, 0, 0, 0, 1, 1,
0.2062168, 0.885586, -1.275428, 0, 0, 0, 1, 1,
0.2070214, -0.3774217, 3.879095, 0, 0, 0, 1, 1,
0.2117557, 0.1387783, 0.08142704, 1, 1, 1, 1, 1,
0.2118547, 0.3169121, -0.4045964, 1, 1, 1, 1, 1,
0.2123964, -1.167299, 1.529904, 1, 1, 1, 1, 1,
0.2124992, -0.05248781, 1.011443, 1, 1, 1, 1, 1,
0.2155811, -0.2033687, 3.055565, 1, 1, 1, 1, 1,
0.2179591, 0.279389, -1.129403, 1, 1, 1, 1, 1,
0.2204766, 0.7773494, -0.03669345, 1, 1, 1, 1, 1,
0.2301688, -0.3924519, 2.233746, 1, 1, 1, 1, 1,
0.2308948, 0.2444121, 0.3170381, 1, 1, 1, 1, 1,
0.2348915, 2.043745, 0.6325124, 1, 1, 1, 1, 1,
0.2363107, -0.2349547, 1.550258, 1, 1, 1, 1, 1,
0.2387519, 0.4134519, -1.266743, 1, 1, 1, 1, 1,
0.2393583, 0.1269946, 1.262926, 1, 1, 1, 1, 1,
0.2422853, 0.8196089, 1.183063, 1, 1, 1, 1, 1,
0.2430022, -0.963975, 2.84958, 1, 1, 1, 1, 1,
0.2500033, -1.22307, 1.412678, 0, 0, 1, 1, 1,
0.2528813, -2.773321, 2.513216, 1, 0, 0, 1, 1,
0.2549644, 0.8499297, 1.164357, 1, 0, 0, 1, 1,
0.2600324, 1.348806, 0.05223108, 1, 0, 0, 1, 1,
0.2658185, -0.0837017, 1.776173, 1, 0, 0, 1, 1,
0.267441, -0.4503412, 2.970596, 1, 0, 0, 1, 1,
0.2683649, 2.778525, 0.4472179, 0, 0, 0, 1, 1,
0.2698156, 0.4039441, 0.4251624, 0, 0, 0, 1, 1,
0.2730594, -0.4329904, 2.52375, 0, 0, 0, 1, 1,
0.2790098, -0.9945312, 0.121035, 0, 0, 0, 1, 1,
0.2819341, -0.1460072, 1.86057, 0, 0, 0, 1, 1,
0.282124, 0.5300724, 0.8873773, 0, 0, 0, 1, 1,
0.2822657, -0.0332698, 1.144181, 0, 0, 0, 1, 1,
0.2841596, -1.575134, 4.418832, 1, 1, 1, 1, 1,
0.2851255, -0.9135857, 1.976482, 1, 1, 1, 1, 1,
0.2857554, -0.5311671, 2.65397, 1, 1, 1, 1, 1,
0.2911186, 0.1104708, 3.112988, 1, 1, 1, 1, 1,
0.2915276, 0.6329854, -1.442493, 1, 1, 1, 1, 1,
0.2919586, 0.01180694, -0.2972171, 1, 1, 1, 1, 1,
0.302471, 1.231173, -0.5914959, 1, 1, 1, 1, 1,
0.3033287, -0.03734175, 1.721459, 1, 1, 1, 1, 1,
0.3063231, -1.79703, 3.253976, 1, 1, 1, 1, 1,
0.3065411, 1.766955, 1.020305, 1, 1, 1, 1, 1,
0.3076457, 0.5198522, 1.365213, 1, 1, 1, 1, 1,
0.3080429, -0.4863902, 2.656086, 1, 1, 1, 1, 1,
0.3084113, -0.4617844, 4.588468, 1, 1, 1, 1, 1,
0.3110927, -1.546653, 1.419733, 1, 1, 1, 1, 1,
0.3127616, 1.091511, 1.353822, 1, 1, 1, 1, 1,
0.3152217, 0.9113936, 2.02167, 0, 0, 1, 1, 1,
0.3162208, -0.4129719, 1.461102, 1, 0, 0, 1, 1,
0.3162361, 0.8110712, -1.03563, 1, 0, 0, 1, 1,
0.3162821, 0.8234328, -1.322403, 1, 0, 0, 1, 1,
0.3212317, -0.7875138, 4.590897, 1, 0, 0, 1, 1,
0.3221013, -1.527151, 2.315525, 1, 0, 0, 1, 1,
0.3227359, 1.341447, 1.913804, 0, 0, 0, 1, 1,
0.3282762, 0.3200763, 0.8127716, 0, 0, 0, 1, 1,
0.3330811, -0.756561, 1.936433, 0, 0, 0, 1, 1,
0.3355553, 1.316103, 0.2565927, 0, 0, 0, 1, 1,
0.3367943, -0.7567704, 3.669023, 0, 0, 0, 1, 1,
0.3380173, 1.442513, -0.08080764, 0, 0, 0, 1, 1,
0.3381914, 2.153306, -0.2202374, 0, 0, 0, 1, 1,
0.3400837, -0.7096193, 2.49221, 1, 1, 1, 1, 1,
0.3426495, -0.1602324, 2.491115, 1, 1, 1, 1, 1,
0.3450104, 0.1233197, 1.80385, 1, 1, 1, 1, 1,
0.345335, 1.126812, -0.09166674, 1, 1, 1, 1, 1,
0.3489529, -0.6979524, 2.612779, 1, 1, 1, 1, 1,
0.3511162, 0.2527528, 0.4800269, 1, 1, 1, 1, 1,
0.3532648, 0.3783873, -0.2367021, 1, 1, 1, 1, 1,
0.3544313, -1.167812, 1.837182, 1, 1, 1, 1, 1,
0.3618177, -1.252553, 2.185534, 1, 1, 1, 1, 1,
0.3790328, -0.6975777, 1.120729, 1, 1, 1, 1, 1,
0.3795449, -0.047847, 1.519969, 1, 1, 1, 1, 1,
0.3800478, 0.30613, -0.6449003, 1, 1, 1, 1, 1,
0.3803344, -0.7817335, 3.127183, 1, 1, 1, 1, 1,
0.3806465, 1.936404, 0.9399583, 1, 1, 1, 1, 1,
0.3849781, -0.5751751, 2.751514, 1, 1, 1, 1, 1,
0.3857228, 0.4764611, -0.3670946, 0, 0, 1, 1, 1,
0.385803, 1.340663, 0.348819, 1, 0, 0, 1, 1,
0.3862027, 1.581992, -0.5564045, 1, 0, 0, 1, 1,
0.3979093, 0.2913624, 2.408225, 1, 0, 0, 1, 1,
0.3997085, 0.6158026, 0.5592327, 1, 0, 0, 1, 1,
0.4010644, -0.07465634, 2.073849, 1, 0, 0, 1, 1,
0.4027121, -0.2683959, 2.513069, 0, 0, 0, 1, 1,
0.4042486, -0.06737489, 2.635489, 0, 0, 0, 1, 1,
0.4045138, -0.5258065, 1.605984, 0, 0, 0, 1, 1,
0.4058786, 2.844046, -1.790591, 0, 0, 0, 1, 1,
0.4080431, 0.5142407, 0.3033688, 0, 0, 0, 1, 1,
0.409088, 0.7752631, 3.006678, 0, 0, 0, 1, 1,
0.410173, 0.6365962, 0.9433527, 0, 0, 0, 1, 1,
0.4114378, 0.6657256, -0.3680291, 1, 1, 1, 1, 1,
0.4193371, 0.3756597, 1.075936, 1, 1, 1, 1, 1,
0.4195593, 0.8982828, -0.9619527, 1, 1, 1, 1, 1,
0.4227482, -1.604459, 2.485798, 1, 1, 1, 1, 1,
0.4235525, 1.944134, -1.182862, 1, 1, 1, 1, 1,
0.4236599, -0.3498822, 4.049751, 1, 1, 1, 1, 1,
0.4238155, -0.2193047, 1.520398, 1, 1, 1, 1, 1,
0.4247901, 0.469882, 2.121881, 1, 1, 1, 1, 1,
0.4284662, 0.9254221, 1.346141, 1, 1, 1, 1, 1,
0.4348142, -1.153371, 3.346563, 1, 1, 1, 1, 1,
0.4387828, 0.117632, 1.778829, 1, 1, 1, 1, 1,
0.4396493, 0.8973348, -0.8249423, 1, 1, 1, 1, 1,
0.4399923, -0.4367198, 2.003911, 1, 1, 1, 1, 1,
0.4402078, -0.01469168, 2.066861, 1, 1, 1, 1, 1,
0.4431483, -0.1558727, 1.802578, 1, 1, 1, 1, 1,
0.4490336, 0.9180458, -0.7684039, 0, 0, 1, 1, 1,
0.4493418, -0.3630513, -0.664167, 1, 0, 0, 1, 1,
0.4508587, 0.6465185, 0.996238, 1, 0, 0, 1, 1,
0.4511491, -0.7022935, 1.898817, 1, 0, 0, 1, 1,
0.4564311, 0.3893629, 1.796481, 1, 0, 0, 1, 1,
0.4597636, 0.3554639, 0.9454796, 1, 0, 0, 1, 1,
0.4599261, -0.9654311, 4.928247, 0, 0, 0, 1, 1,
0.4621508, 0.003431603, 0.2133127, 0, 0, 0, 1, 1,
0.465652, -0.4555301, 3.840902, 0, 0, 0, 1, 1,
0.4661058, 0.0398973, 1.549797, 0, 0, 0, 1, 1,
0.4689714, 0.9313595, 0.3567533, 0, 0, 0, 1, 1,
0.4715828, 1.353663, 1.817266, 0, 0, 0, 1, 1,
0.4716102, -0.431254, 3.546179, 0, 0, 0, 1, 1,
0.4718039, -0.4372072, 2.224438, 1, 1, 1, 1, 1,
0.4771214, 1.222292, 0.8981425, 1, 1, 1, 1, 1,
0.47944, -0.7957724, 3.469013, 1, 1, 1, 1, 1,
0.4800934, -0.4242442, 2.002254, 1, 1, 1, 1, 1,
0.4830404, -1.053879, 1.904409, 1, 1, 1, 1, 1,
0.4831945, -1.212066, 2.116415, 1, 1, 1, 1, 1,
0.4842454, 0.6284752, -0.8369953, 1, 1, 1, 1, 1,
0.488012, 0.5749979, -1.210411, 1, 1, 1, 1, 1,
0.4885741, 0.9935555, 1.835937, 1, 1, 1, 1, 1,
0.4885893, -0.7708447, 4.063821, 1, 1, 1, 1, 1,
0.5021673, 1.117455, -0.2566901, 1, 1, 1, 1, 1,
0.5044397, -1.942592, 2.897804, 1, 1, 1, 1, 1,
0.5052658, -0.5620853, 3.597991, 1, 1, 1, 1, 1,
0.5101617, -0.1681104, 2.312045, 1, 1, 1, 1, 1,
0.5141219, -0.7526056, 2.097082, 1, 1, 1, 1, 1,
0.5161405, 1.090101, -0.9853563, 0, 0, 1, 1, 1,
0.5170539, -1.126011, 4.213525, 1, 0, 0, 1, 1,
0.5173521, -0.8505393, 2.878653, 1, 0, 0, 1, 1,
0.5191936, -1.676563, 4.14849, 1, 0, 0, 1, 1,
0.5273234, 0.2888499, 0.6202307, 1, 0, 0, 1, 1,
0.5281439, 1.354729, 0.8411539, 1, 0, 0, 1, 1,
0.530803, -0.7165768, 3.082002, 0, 0, 0, 1, 1,
0.5323312, -0.49967, 1.820155, 0, 0, 0, 1, 1,
0.5343873, -1.752793, 2.94045, 0, 0, 0, 1, 1,
0.5344152, -1.462373, 3.319039, 0, 0, 0, 1, 1,
0.539944, 1.427751, 1.486924, 0, 0, 0, 1, 1,
0.5401341, -1.586559, 1.370889, 0, 0, 0, 1, 1,
0.5402841, 0.9888635, 1.118629, 0, 0, 0, 1, 1,
0.5407765, -0.6797067, 2.098822, 1, 1, 1, 1, 1,
0.5459076, -1.759696, 3.473514, 1, 1, 1, 1, 1,
0.5479798, 0.1739511, 2.139288, 1, 1, 1, 1, 1,
0.5491441, 1.72608, 2.755947, 1, 1, 1, 1, 1,
0.5496116, -0.5546796, 2.062257, 1, 1, 1, 1, 1,
0.5563557, 0.6737155, 2.110337, 1, 1, 1, 1, 1,
0.5569755, 0.3189092, 2.069394, 1, 1, 1, 1, 1,
0.5599146, 2.145583, 0.8992131, 1, 1, 1, 1, 1,
0.5673274, 0.4106963, 0.7693243, 1, 1, 1, 1, 1,
0.5714043, 0.03447427, 2.721124, 1, 1, 1, 1, 1,
0.5747381, 0.516467, 3.32527, 1, 1, 1, 1, 1,
0.5748756, -1.059949, 3.322511, 1, 1, 1, 1, 1,
0.5771163, -1.502255, 2.673978, 1, 1, 1, 1, 1,
0.5802148, -0.5233577, 3.506724, 1, 1, 1, 1, 1,
0.5892468, -0.9435272, 5.121631, 1, 1, 1, 1, 1,
0.5930471, 1.175866, 1.572618, 0, 0, 1, 1, 1,
0.5951147, -1.255356, 2.486748, 1, 0, 0, 1, 1,
0.5957496, -1.149191, 0.8869666, 1, 0, 0, 1, 1,
0.6005723, -0.06265119, 1.748678, 1, 0, 0, 1, 1,
0.6013328, 1.400834, -0.4318386, 1, 0, 0, 1, 1,
0.6023013, 0.5148793, 1.070417, 1, 0, 0, 1, 1,
0.6085277, -0.8186517, 0.8380368, 0, 0, 0, 1, 1,
0.6091233, 0.01038034, 0.415346, 0, 0, 0, 1, 1,
0.612089, -0.9184546, 2.794197, 0, 0, 0, 1, 1,
0.6169009, 0.2918163, 2.865141, 0, 0, 0, 1, 1,
0.6178748, 0.5888769, 2.593304, 0, 0, 0, 1, 1,
0.6203043, -1.130389, 2.036204, 0, 0, 0, 1, 1,
0.6219639, -1.785222, 1.418592, 0, 0, 0, 1, 1,
0.6232294, -0.06029201, 1.489057, 1, 1, 1, 1, 1,
0.6256361, 0.4781411, 0.8773711, 1, 1, 1, 1, 1,
0.6279248, 0.4206813, 0.9309402, 1, 1, 1, 1, 1,
0.6287369, 0.06455044, 1.719471, 1, 1, 1, 1, 1,
0.6313562, -0.133387, 1.141516, 1, 1, 1, 1, 1,
0.6422871, -0.8490158, 1.021072, 1, 1, 1, 1, 1,
0.645061, 1.216237, 1.964918, 1, 1, 1, 1, 1,
0.6497949, -0.3265109, 3.068037, 1, 1, 1, 1, 1,
0.6595479, -0.2438965, 3.476102, 1, 1, 1, 1, 1,
0.6630098, 0.7726433, 0.4709891, 1, 1, 1, 1, 1,
0.6630676, -0.9801027, 0.8126792, 1, 1, 1, 1, 1,
0.6647114, -0.8811244, 2.831925, 1, 1, 1, 1, 1,
0.6680846, -0.2474814, 0.5787329, 1, 1, 1, 1, 1,
0.6705411, 0.4373715, 1.348588, 1, 1, 1, 1, 1,
0.6725238, 0.5809796, 0.6153386, 1, 1, 1, 1, 1,
0.6867926, -0.3984233, 2.070338, 0, 0, 1, 1, 1,
0.6910427, 2.116337, -0.5068928, 1, 0, 0, 1, 1,
0.693904, -0.1794793, 1.085772, 1, 0, 0, 1, 1,
0.6971238, 1.033032, -0.8064436, 1, 0, 0, 1, 1,
0.6971573, 0.7263216, 0.3857884, 1, 0, 0, 1, 1,
0.7005239, 0.6754742, -0.3606282, 1, 0, 0, 1, 1,
0.7035425, 0.3522434, 1.469651, 0, 0, 0, 1, 1,
0.7146291, -0.3976641, 4.333546, 0, 0, 0, 1, 1,
0.7166513, -0.1988511, 3.25695, 0, 0, 0, 1, 1,
0.7191843, 0.8351939, 0.8016176, 0, 0, 0, 1, 1,
0.7221386, 0.3342929, -0.1258171, 0, 0, 0, 1, 1,
0.7275649, -0.5747356, 1.645671, 0, 0, 0, 1, 1,
0.7279688, 1.263884, 0.006684836, 0, 0, 0, 1, 1,
0.7281581, -0.003790747, 0.8285802, 1, 1, 1, 1, 1,
0.7338837, -0.5946096, 2.98009, 1, 1, 1, 1, 1,
0.7388564, -0.5237525, 4.349413, 1, 1, 1, 1, 1,
0.7471184, -0.2738712, 1.026281, 1, 1, 1, 1, 1,
0.7482232, 0.9883587, 1.295154, 1, 1, 1, 1, 1,
0.752643, 0.6017138, 1.101333, 1, 1, 1, 1, 1,
0.7531186, 1.209466, 0.5258774, 1, 1, 1, 1, 1,
0.7572334, -1.531607, 1.691917, 1, 1, 1, 1, 1,
0.7659839, -0.431143, 1.362728, 1, 1, 1, 1, 1,
0.7662637, 0.5058705, 1.91647, 1, 1, 1, 1, 1,
0.7777827, -0.986353, 2.157783, 1, 1, 1, 1, 1,
0.7816027, -0.3279896, 1.736737, 1, 1, 1, 1, 1,
0.7828132, 0.3213727, 0.4688005, 1, 1, 1, 1, 1,
0.7847092, 0.3819265, 1.739622, 1, 1, 1, 1, 1,
0.7849303, 0.1490591, 1.432148, 1, 1, 1, 1, 1,
0.788027, -0.673432, 2.31779, 0, 0, 1, 1, 1,
0.7907495, 0.02277442, 1.325678, 1, 0, 0, 1, 1,
0.7960872, -1.165425, 1.923133, 1, 0, 0, 1, 1,
0.7962196, -1.249764, 2.051435, 1, 0, 0, 1, 1,
0.8041688, 0.71072, -0.06360365, 1, 0, 0, 1, 1,
0.8055782, 0.1606411, 0.9519027, 1, 0, 0, 1, 1,
0.8074037, 1.555168, 0.7319798, 0, 0, 0, 1, 1,
0.8075787, 1.065168, 0.8198051, 0, 0, 0, 1, 1,
0.8077143, -1.122938, 2.159317, 0, 0, 0, 1, 1,
0.8092967, -0.183785, 2.908585, 0, 0, 0, 1, 1,
0.8093888, 1.219227, 0.2687638, 0, 0, 0, 1, 1,
0.8117779, -1.086567, 2.315608, 0, 0, 0, 1, 1,
0.8128293, -1.593627, 0.3334723, 0, 0, 0, 1, 1,
0.8129787, -0.4767871, 2.171551, 1, 1, 1, 1, 1,
0.8197625, -0.2814301, 1.803146, 1, 1, 1, 1, 1,
0.8255755, 1.086325, -0.1441979, 1, 1, 1, 1, 1,
0.8258204, 2.118663, -1.526666, 1, 1, 1, 1, 1,
0.8273476, 0.94918, 0.9540625, 1, 1, 1, 1, 1,
0.8301889, -0.8589405, 2.544683, 1, 1, 1, 1, 1,
0.8307146, -1.434306, 2.928046, 1, 1, 1, 1, 1,
0.8348271, 1.095531, 1.025551, 1, 1, 1, 1, 1,
0.8357833, -0.3410658, 0.9072897, 1, 1, 1, 1, 1,
0.8372194, 0.8976175, -0.6190714, 1, 1, 1, 1, 1,
0.8385478, -0.6233179, 2.932261, 1, 1, 1, 1, 1,
0.839762, 0.9432933, 1.262394, 1, 1, 1, 1, 1,
0.8573515, 0.90338, 0.08625043, 1, 1, 1, 1, 1,
0.8598201, -0.580029, 1.651518, 1, 1, 1, 1, 1,
0.8614939, -0.7340313, 0.7264399, 1, 1, 1, 1, 1,
0.8634999, -0.2115026, 3.313181, 0, 0, 1, 1, 1,
0.8666626, 1.432395, 0.5704417, 1, 0, 0, 1, 1,
0.8724223, -1.528472, 3.736137, 1, 0, 0, 1, 1,
0.8824167, 0.1300368, 4.258002, 1, 0, 0, 1, 1,
0.8845134, 0.9321789, 1.875822, 1, 0, 0, 1, 1,
0.8874621, 0.4874788, 1.25163, 1, 0, 0, 1, 1,
0.8956505, 1.292648, 0.7295851, 0, 0, 0, 1, 1,
0.8957425, -0.3787689, 0.7015879, 0, 0, 0, 1, 1,
0.9017004, -0.7854572, 1.59622, 0, 0, 0, 1, 1,
0.9043958, -0.3113701, 4.360175, 0, 0, 0, 1, 1,
0.9045856, -0.09851072, 3.12723, 0, 0, 0, 1, 1,
0.9047916, 0.6407094, 1.587354, 0, 0, 0, 1, 1,
0.9056786, -0.3278444, 1.015655, 0, 0, 0, 1, 1,
0.9079179, 0.2126572, 1.873549, 1, 1, 1, 1, 1,
0.9101468, 0.125892, 1.493657, 1, 1, 1, 1, 1,
0.9102083, 0.03638276, 1.469387, 1, 1, 1, 1, 1,
0.9104572, -1.512061, 2.000854, 1, 1, 1, 1, 1,
0.9257846, 0.844837, 0.3235134, 1, 1, 1, 1, 1,
0.9314663, 0.1972346, 1.228964, 1, 1, 1, 1, 1,
0.9397702, -1.143361, 1.310752, 1, 1, 1, 1, 1,
0.9398535, 0.05189366, 1.72018, 1, 1, 1, 1, 1,
0.9499677, 1.343732, -0.3220434, 1, 1, 1, 1, 1,
0.9513639, -0.1809643, 1.842926, 1, 1, 1, 1, 1,
0.9555456, 0.396009, 1.12733, 1, 1, 1, 1, 1,
0.9675171, -1.245809, 4.303555, 1, 1, 1, 1, 1,
0.968245, -0.4305493, 2.508811, 1, 1, 1, 1, 1,
0.9700205, -1.859005, 2.327322, 1, 1, 1, 1, 1,
0.9722341, -0.9418554, 2.359209, 1, 1, 1, 1, 1,
0.9724087, -0.6984577, -0.02423805, 0, 0, 1, 1, 1,
0.9783981, 0.01174149, 1.624064, 1, 0, 0, 1, 1,
0.979228, -0.0865984, 1.756432, 1, 0, 0, 1, 1,
0.9802907, 0.4356111, 0.9270873, 1, 0, 0, 1, 1,
0.9853669, 1.362434, 2.541436, 1, 0, 0, 1, 1,
0.9870526, -1.615808, 2.196886, 1, 0, 0, 1, 1,
0.9885225, 0.803502, 2.027019, 0, 0, 0, 1, 1,
0.9894723, -0.2796648, 2.357687, 0, 0, 0, 1, 1,
0.9937021, 0.6352541, -0.7442752, 0, 0, 0, 1, 1,
0.9939618, -1.91483, 3.033408, 0, 0, 0, 1, 1,
0.9955546, -0.4281605, 1.986947, 0, 0, 0, 1, 1,
0.9975246, -0.03501772, 1.2763, 0, 0, 0, 1, 1,
0.9981363, -1.127201, 1.335891, 0, 0, 0, 1, 1,
1.007484, 0.08215373, 1.619985, 1, 1, 1, 1, 1,
1.009617, -2.456728, 3.708179, 1, 1, 1, 1, 1,
1.011993, -0.2307799, 1.55765, 1, 1, 1, 1, 1,
1.016608, 2.728627, 1.738339, 1, 1, 1, 1, 1,
1.022365, -0.8474166, 2.35182, 1, 1, 1, 1, 1,
1.031169, 0.6835255, -0.2221082, 1, 1, 1, 1, 1,
1.041004, 0.02364918, 3.347296, 1, 1, 1, 1, 1,
1.044771, -0.3235813, 2.575036, 1, 1, 1, 1, 1,
1.046335, 0.1250173, 0.3930794, 1, 1, 1, 1, 1,
1.049326, 1.800198, 0.9830261, 1, 1, 1, 1, 1,
1.054119, 1.540416, -1.233098, 1, 1, 1, 1, 1,
1.05435, -2.228463, 2.712898, 1, 1, 1, 1, 1,
1.062744, 1.595011, -1.269067, 1, 1, 1, 1, 1,
1.068256, -0.5290108, 3.589482, 1, 1, 1, 1, 1,
1.071158, 1.819667, -0.1393568, 1, 1, 1, 1, 1,
1.071198, -1.316926, 2.211079, 0, 0, 1, 1, 1,
1.078188, 1.22131, 0.3828837, 1, 0, 0, 1, 1,
1.080118, 0.3913262, 1.712891, 1, 0, 0, 1, 1,
1.082527, -0.5824137, 0.9063456, 1, 0, 0, 1, 1,
1.094548, -0.5224581, 1.768852, 1, 0, 0, 1, 1,
1.099684, -0.9362155, 2.356371, 1, 0, 0, 1, 1,
1.102861, -1.817031, 3.505117, 0, 0, 0, 1, 1,
1.132366, 2.064381, 1.773046, 0, 0, 0, 1, 1,
1.13682, 0.2140819, 0.8747668, 0, 0, 0, 1, 1,
1.138677, 0.7365014, 0.7423927, 0, 0, 0, 1, 1,
1.140676, -0.5069488, 2.006075, 0, 0, 0, 1, 1,
1.149125, 0.2906268, -1.275933, 0, 0, 0, 1, 1,
1.156341, -1.760553, 3.888151, 0, 0, 0, 1, 1,
1.15894, -0.3301868, 1.416936, 1, 1, 1, 1, 1,
1.163394, -1.396878, 3.47027, 1, 1, 1, 1, 1,
1.166822, -0.06420251, 3.19593, 1, 1, 1, 1, 1,
1.169301, -0.3523006, 1.146487, 1, 1, 1, 1, 1,
1.171626, -0.4467239, 2.073108, 1, 1, 1, 1, 1,
1.186311, 1.382312, 0.5636373, 1, 1, 1, 1, 1,
1.187458, -0.9204208, 4.209356, 1, 1, 1, 1, 1,
1.191907, 1.512567, -0.199421, 1, 1, 1, 1, 1,
1.193211, 0.7898201, 0.8654366, 1, 1, 1, 1, 1,
1.207281, -0.0933779, 2.187131, 1, 1, 1, 1, 1,
1.224449, 1.039806, 0.5143298, 1, 1, 1, 1, 1,
1.231063, 0.4978025, 0.5386868, 1, 1, 1, 1, 1,
1.250071, -0.7846324, 0.9647142, 1, 1, 1, 1, 1,
1.251272, 1.608554, -1.134515, 1, 1, 1, 1, 1,
1.251493, -0.6020912, 2.467019, 1, 1, 1, 1, 1,
1.252705, -0.3980622, 3.153256, 0, 0, 1, 1, 1,
1.261634, -1.096292, 4.174837, 1, 0, 0, 1, 1,
1.263702, -0.2375084, 1.648955, 1, 0, 0, 1, 1,
1.265461, 1.41765, 1.56551, 1, 0, 0, 1, 1,
1.266414, -0.6465951, 1.373975, 1, 0, 0, 1, 1,
1.269318, -0.7851583, 2.08635, 1, 0, 0, 1, 1,
1.271131, 1.381699, 1.39423, 0, 0, 0, 1, 1,
1.278142, -0.08864725, 1.895567, 0, 0, 0, 1, 1,
1.283351, 0.7053987, 1.185664, 0, 0, 0, 1, 1,
1.289362, -0.008722612, 1.993653, 0, 0, 0, 1, 1,
1.293808, 0.2969547, -0.3043331, 0, 0, 0, 1, 1,
1.301092, -0.2636863, 0.6361474, 0, 0, 0, 1, 1,
1.301725, 1.889357, -0.1212373, 0, 0, 0, 1, 1,
1.309742, -1.773084, 2.527521, 1, 1, 1, 1, 1,
1.310317, -0.5337365, 3.114215, 1, 1, 1, 1, 1,
1.312935, -2.405701, 1.050687, 1, 1, 1, 1, 1,
1.313649, -0.05703999, 1.993509, 1, 1, 1, 1, 1,
1.320702, -0.7474996, 2.752208, 1, 1, 1, 1, 1,
1.323182, -1.436101, 2.445737, 1, 1, 1, 1, 1,
1.334556, 1.557557, 0.1468274, 1, 1, 1, 1, 1,
1.355158, -0.5029451, 0.7290412, 1, 1, 1, 1, 1,
1.370412, 0.1888593, 3.504224, 1, 1, 1, 1, 1,
1.370835, 1.3579, 1.823486, 1, 1, 1, 1, 1,
1.373328, 0.6450146, 1.316899, 1, 1, 1, 1, 1,
1.376098, 0.7706212, 0.2065867, 1, 1, 1, 1, 1,
1.394832, -0.2493819, 2.890926, 1, 1, 1, 1, 1,
1.397168, 0.3882774, 2.782373, 1, 1, 1, 1, 1,
1.398685, -0.3533574, 2.588261, 1, 1, 1, 1, 1,
1.404338, 0.6589248, 1.153399, 0, 0, 1, 1, 1,
1.425429, -0.4862423, 3.615664, 1, 0, 0, 1, 1,
1.434383, -0.4544334, 2.570177, 1, 0, 0, 1, 1,
1.440144, -0.03726588, 2.063007, 1, 0, 0, 1, 1,
1.445518, 1.532083, 0.860148, 1, 0, 0, 1, 1,
1.446121, 1.669989, 1.582124, 1, 0, 0, 1, 1,
1.449626, 0.5739481, -1.057352, 0, 0, 0, 1, 1,
1.464897, -0.2924038, 2.145821, 0, 0, 0, 1, 1,
1.478259, 0.3783664, 0.4997181, 0, 0, 0, 1, 1,
1.497087, -0.002513615, 1.569053, 0, 0, 0, 1, 1,
1.497226, -0.488424, 0.9414125, 0, 0, 0, 1, 1,
1.515061, -1.125712, 3.972988, 0, 0, 0, 1, 1,
1.519258, -0.6789905, 3.089413, 0, 0, 0, 1, 1,
1.528472, 0.4285251, 1.545686, 1, 1, 1, 1, 1,
1.530336, 1.446322, 1.054096, 1, 1, 1, 1, 1,
1.538666, -0.3370261, 1.294096, 1, 1, 1, 1, 1,
1.539373, -0.2221547, 1.392409, 1, 1, 1, 1, 1,
1.549284, 0.3545964, 1.062289, 1, 1, 1, 1, 1,
1.57246, -0.6240407, 0.4902866, 1, 1, 1, 1, 1,
1.574464, 1.690463, 0.8165184, 1, 1, 1, 1, 1,
1.585199, -0.8727204, 1.629917, 1, 1, 1, 1, 1,
1.585715, -0.6211761, 1.280818, 1, 1, 1, 1, 1,
1.590126, -1.430951, 3.640685, 1, 1, 1, 1, 1,
1.591994, -0.9823474, 1.300506, 1, 1, 1, 1, 1,
1.60045, -1.874483, 1.75525, 1, 1, 1, 1, 1,
1.600576, -0.8663144, 2.81503, 1, 1, 1, 1, 1,
1.604347, -0.4188302, 1.260478, 1, 1, 1, 1, 1,
1.610897, 0.6213488, 0.4646024, 1, 1, 1, 1, 1,
1.626636, 0.3469146, 0.3743525, 0, 0, 1, 1, 1,
1.637509, 1.13037, 0.7633097, 1, 0, 0, 1, 1,
1.640141, -0.2080472, 2.504896, 1, 0, 0, 1, 1,
1.641459, -0.6968215, 0.4422362, 1, 0, 0, 1, 1,
1.646356, 1.139963, 0.7686371, 1, 0, 0, 1, 1,
1.64859, -0.2501309, 2.133755, 1, 0, 0, 1, 1,
1.649318, 0.2426119, 2.153161, 0, 0, 0, 1, 1,
1.650663, -0.1294315, 0.9131203, 0, 0, 0, 1, 1,
1.670339, -0.2542118, 1.836172, 0, 0, 0, 1, 1,
1.678249, -0.3826745, 2.392857, 0, 0, 0, 1, 1,
1.688281, 0.1522349, 1.379781, 0, 0, 0, 1, 1,
1.706843, 0.1316127, -1.570969, 0, 0, 0, 1, 1,
1.708099, -0.09639342, 1.786227, 0, 0, 0, 1, 1,
1.729878, -0.1407563, 4.312506, 1, 1, 1, 1, 1,
1.738709, 0.7832806, 1.462021, 1, 1, 1, 1, 1,
1.767523, -1.168795, 2.960974, 1, 1, 1, 1, 1,
1.789957, -1.951583, 1.792615, 1, 1, 1, 1, 1,
1.7938, -0.2052726, 3.739147, 1, 1, 1, 1, 1,
1.803395, -2.225628, 2.272298, 1, 1, 1, 1, 1,
1.812774, -1.217044, 2.867518, 1, 1, 1, 1, 1,
1.821607, -0.6441976, 1.644511, 1, 1, 1, 1, 1,
1.840218, -1.484695, 2.7052, 1, 1, 1, 1, 1,
1.844189, 0.8817779, 1.206044, 1, 1, 1, 1, 1,
1.890708, -0.4394327, 0.3179416, 1, 1, 1, 1, 1,
1.890871, -1.440609, 2.107003, 1, 1, 1, 1, 1,
1.895904, 1.387086, 1.672888, 1, 1, 1, 1, 1,
1.898131, -0.4631783, 1.660455, 1, 1, 1, 1, 1,
1.933007, 0.8835959, 1.345855, 1, 1, 1, 1, 1,
1.935758, 0.5909959, 0.7751764, 0, 0, 1, 1, 1,
1.969792, -1.020519, 0.1092057, 1, 0, 0, 1, 1,
1.990857, -0.6193683, 2.732947, 1, 0, 0, 1, 1,
2.038675, 0.3551144, 2.350139, 1, 0, 0, 1, 1,
2.074433, 0.1387575, 2.775873, 1, 0, 0, 1, 1,
2.109838, 0.933332, 0.4431275, 1, 0, 0, 1, 1,
2.137164, 1.768606, -0.4525306, 0, 0, 0, 1, 1,
2.210615, -0.7269921, 2.093589, 0, 0, 0, 1, 1,
2.220025, 1.141621, 0.7304373, 0, 0, 0, 1, 1,
2.22837, 1.502763, 0.3549856, 0, 0, 0, 1, 1,
2.229159, 0.09497207, 0.4232489, 0, 0, 0, 1, 1,
2.230438, 0.3558497, 0.5512932, 0, 0, 0, 1, 1,
2.34251, 1.981606, 2.091969, 0, 0, 0, 1, 1,
2.348874, -0.3628131, 1.648147, 1, 1, 1, 1, 1,
2.394691, -0.6553126, 1.908714, 1, 1, 1, 1, 1,
2.499663, -0.3844216, 0.6895689, 1, 1, 1, 1, 1,
2.677302, -1.267074, 1.201374, 1, 1, 1, 1, 1,
2.738194, -1.623154, 1.866288, 1, 1, 1, 1, 1,
2.829675, 1.177936, 1.028357, 1, 1, 1, 1, 1,
3.208701, -0.8972646, 2.030069, 1, 1, 1, 1, 1
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
var radius = 10.06459;
var distance = 35.35144;
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
mvMatrix.translate( 0.1814177, 0.2887521, 0.5586905 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.35144);
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