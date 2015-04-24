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
-2.971769, -1.665445, -1.164983, 1, 0, 0, 1,
-2.71933, -0.5693981, -1.692149, 1, 0.007843138, 0, 1,
-2.591898, 1.009652, -0.2710752, 1, 0.01176471, 0, 1,
-2.577674, -1.079831, -1.520329, 1, 0.01960784, 0, 1,
-2.403959, -2.291527, -0.9697587, 1, 0.02352941, 0, 1,
-2.36824, -0.8892434, -1.839367, 1, 0.03137255, 0, 1,
-2.351598, -0.05667754, -2.33541, 1, 0.03529412, 0, 1,
-2.335397, -0.6531909, -2.719504, 1, 0.04313726, 0, 1,
-2.307029, 1.0721, -1.699888, 1, 0.04705882, 0, 1,
-2.285063, 0.3203976, -1.954253, 1, 0.05490196, 0, 1,
-2.266946, -1.081762, -2.079301, 1, 0.05882353, 0, 1,
-2.188382, 0.75217, -1.68235, 1, 0.06666667, 0, 1,
-2.18175, -0.02343246, -0.09256177, 1, 0.07058824, 0, 1,
-2.17317, 0.4263735, -1.772389, 1, 0.07843138, 0, 1,
-2.15381, 0.1890736, -2.448672, 1, 0.08235294, 0, 1,
-2.137402, 0.241891, -0.4250992, 1, 0.09019608, 0, 1,
-2.060771, 0.05483992, -1.912886, 1, 0.09411765, 0, 1,
-2.053319, 1.253526, -2.69291, 1, 0.1019608, 0, 1,
-2.02754, 0.5785684, -0.681327, 1, 0.1098039, 0, 1,
-2.021522, 0.6884875, -0.8903363, 1, 0.1137255, 0, 1,
-1.990979, 1.436187, -0.3199212, 1, 0.1215686, 0, 1,
-1.984435, -0.850765, -2.959673, 1, 0.1254902, 0, 1,
-1.961191, -0.1755042, -0.23391, 1, 0.1333333, 0, 1,
-1.949144, 1.204669, 0.2634557, 1, 0.1372549, 0, 1,
-1.946279, 0.1401882, -1.221261, 1, 0.145098, 0, 1,
-1.938195, 0.5144285, -0.1464397, 1, 0.1490196, 0, 1,
-1.927583, -1.086053, -2.961828, 1, 0.1568628, 0, 1,
-1.914752, 0.08295844, -0.316588, 1, 0.1607843, 0, 1,
-1.899268, -1.133118, -1.934648, 1, 0.1686275, 0, 1,
-1.884155, 0.4860685, -0.8083607, 1, 0.172549, 0, 1,
-1.8595, 1.336607, -1.751479, 1, 0.1803922, 0, 1,
-1.839728, -0.3392161, -1.136326, 1, 0.1843137, 0, 1,
-1.827833, 0.4300306, -0.8827888, 1, 0.1921569, 0, 1,
-1.784989, -0.3310745, -3.93874, 1, 0.1960784, 0, 1,
-1.784855, -1.051739, -1.941558, 1, 0.2039216, 0, 1,
-1.756348, -1.660157, -2.011233, 1, 0.2117647, 0, 1,
-1.742055, 0.1774946, -1.606843, 1, 0.2156863, 0, 1,
-1.736104, 0.9132939, 0.09605719, 1, 0.2235294, 0, 1,
-1.722447, -1.203044, -3.926977, 1, 0.227451, 0, 1,
-1.696544, 1.25385, -0.6630045, 1, 0.2352941, 0, 1,
-1.691535, 1.309067, 0.5552328, 1, 0.2392157, 0, 1,
-1.676053, -1.175828, -1.116298, 1, 0.2470588, 0, 1,
-1.663549, -0.3317659, -1.368363, 1, 0.2509804, 0, 1,
-1.646289, 0.09525391, -1.243903, 1, 0.2588235, 0, 1,
-1.645033, 1.52371, -0.07385015, 1, 0.2627451, 0, 1,
-1.643157, 0.3100939, -0.09583326, 1, 0.2705882, 0, 1,
-1.642424, 1.046525, -1.557576, 1, 0.2745098, 0, 1,
-1.637843, -1.059397, -2.29402, 1, 0.282353, 0, 1,
-1.637364, 0.6743476, -0.8879147, 1, 0.2862745, 0, 1,
-1.634114, 0.4758636, -0.7707671, 1, 0.2941177, 0, 1,
-1.631297, 1.815246, -1.523971, 1, 0.3019608, 0, 1,
-1.605503, 0.1032494, -1.285021, 1, 0.3058824, 0, 1,
-1.595258, 0.2552582, -0.9641935, 1, 0.3137255, 0, 1,
-1.56962, -0.7536311, -2.422815, 1, 0.3176471, 0, 1,
-1.55914, 0.4073571, -0.2204934, 1, 0.3254902, 0, 1,
-1.552915, -0.07369801, -2.010327, 1, 0.3294118, 0, 1,
-1.55138, -0.7253498, -2.447663, 1, 0.3372549, 0, 1,
-1.547223, 0.271898, -1.023016, 1, 0.3411765, 0, 1,
-1.537382, 0.2918252, -1.498779, 1, 0.3490196, 0, 1,
-1.53088, -0.788765, -2.309685, 1, 0.3529412, 0, 1,
-1.524048, -0.5897728, -2.013552, 1, 0.3607843, 0, 1,
-1.520613, -1.265433, -1.228131, 1, 0.3647059, 0, 1,
-1.52003, 0.4544918, -2.510324, 1, 0.372549, 0, 1,
-1.506624, 1.40505, -1.951993, 1, 0.3764706, 0, 1,
-1.504321, -0.4916027, -4.234939, 1, 0.3843137, 0, 1,
-1.48423, 0.9037533, 0.743512, 1, 0.3882353, 0, 1,
-1.483884, 1.022768, -1.420035, 1, 0.3960784, 0, 1,
-1.481418, -0.03712652, -2.702205, 1, 0.4039216, 0, 1,
-1.463063, 0.6747412, -3.169187, 1, 0.4078431, 0, 1,
-1.447482, 0.437402, -1.230706, 1, 0.4156863, 0, 1,
-1.444194, 0.06132374, -3.164116, 1, 0.4196078, 0, 1,
-1.443162, -2.190938, -3.51597, 1, 0.427451, 0, 1,
-1.441307, -0.1094154, -2.688032, 1, 0.4313726, 0, 1,
-1.435478, 0.6893659, -1.98134, 1, 0.4392157, 0, 1,
-1.431008, 0.2270874, -2.018436, 1, 0.4431373, 0, 1,
-1.421306, -0.1765707, -2.949394, 1, 0.4509804, 0, 1,
-1.411646, -0.3438718, -2.983756, 1, 0.454902, 0, 1,
-1.411524, 0.03901534, -1.972787, 1, 0.4627451, 0, 1,
-1.40691, -0.6967927, -2.929788, 1, 0.4666667, 0, 1,
-1.405709, -1.504714, -3.03073, 1, 0.4745098, 0, 1,
-1.401354, 0.5812212, -1.798811, 1, 0.4784314, 0, 1,
-1.389147, -0.4080867, -1.960045, 1, 0.4862745, 0, 1,
-1.384706, 3.087256, -0.8905839, 1, 0.4901961, 0, 1,
-1.384338, 0.2003688, -0.4318656, 1, 0.4980392, 0, 1,
-1.371404, -0.4735915, -2.235903, 1, 0.5058824, 0, 1,
-1.367411, 0.9264227, -1.614206, 1, 0.509804, 0, 1,
-1.359265, -1.114208, -2.523554, 1, 0.5176471, 0, 1,
-1.358716, -1.003671, -3.786245, 1, 0.5215687, 0, 1,
-1.357497, -1.284171, -3.582656, 1, 0.5294118, 0, 1,
-1.355021, -0.2548214, -0.2350545, 1, 0.5333334, 0, 1,
-1.350721, -0.1364449, -0.07915912, 1, 0.5411765, 0, 1,
-1.347984, 2.526026, -1.739341, 1, 0.5450981, 0, 1,
-1.342961, 0.9232414, -1.82781, 1, 0.5529412, 0, 1,
-1.342796, -1.485621, -2.219618, 1, 0.5568628, 0, 1,
-1.340055, 0.5898468, -2.295779, 1, 0.5647059, 0, 1,
-1.329743, 1.154524, 0.3706723, 1, 0.5686275, 0, 1,
-1.303959, -1.14895, -3.789867, 1, 0.5764706, 0, 1,
-1.303788, 0.07561313, -0.5960245, 1, 0.5803922, 0, 1,
-1.297236, -0.03616245, -2.356753, 1, 0.5882353, 0, 1,
-1.279147, -0.1505758, -1.535701, 1, 0.5921569, 0, 1,
-1.277248, -0.6379833, -2.661332, 1, 0.6, 0, 1,
-1.272905, -1.264983, -2.740843, 1, 0.6078432, 0, 1,
-1.272507, -0.8848115, -1.608865, 1, 0.6117647, 0, 1,
-1.269704, 0.4510752, -1.647607, 1, 0.6196079, 0, 1,
-1.266048, -0.1849772, -0.4994425, 1, 0.6235294, 0, 1,
-1.265009, 1.614514, -2.126284, 1, 0.6313726, 0, 1,
-1.260089, 0.3053228, -0.2232078, 1, 0.6352941, 0, 1,
-1.25912, 1.26083, -1.24711, 1, 0.6431373, 0, 1,
-1.256913, -0.9228618, -1.815567, 1, 0.6470588, 0, 1,
-1.251745, -0.2462335, -2.320604, 1, 0.654902, 0, 1,
-1.242565, 1.030389, -1.305473, 1, 0.6588235, 0, 1,
-1.231614, -0.1878694, -1.374537, 1, 0.6666667, 0, 1,
-1.225836, 0.7979844, -3.279552, 1, 0.6705883, 0, 1,
-1.220112, 0.1736643, -3.391968, 1, 0.6784314, 0, 1,
-1.215848, 0.7583157, -1.569988, 1, 0.682353, 0, 1,
-1.20691, 0.3112733, -1.846881, 1, 0.6901961, 0, 1,
-1.206863, -0.2333361, -2.939816, 1, 0.6941177, 0, 1,
-1.200821, 1.227507, -1.714843, 1, 0.7019608, 0, 1,
-1.195477, 0.2475537, 0.4054049, 1, 0.7098039, 0, 1,
-1.184788, 0.9766781, 0.5706217, 1, 0.7137255, 0, 1,
-1.179467, -1.556966, -0.6526297, 1, 0.7215686, 0, 1,
-1.178003, 1.7264, -0.6179809, 1, 0.7254902, 0, 1,
-1.171304, -1.105178, -2.058904, 1, 0.7333333, 0, 1,
-1.166964, -0.3833838, -1.28249, 1, 0.7372549, 0, 1,
-1.154625, 0.1752656, -2.225785, 1, 0.7450981, 0, 1,
-1.154584, 1.165214, -0.7297469, 1, 0.7490196, 0, 1,
-1.144032, 1.505892, 0.763085, 1, 0.7568628, 0, 1,
-1.14261, 0.7128581, -1.939003, 1, 0.7607843, 0, 1,
-1.1365, 1.496575, 0.493813, 1, 0.7686275, 0, 1,
-1.127678, -0.1339596, -0.9857349, 1, 0.772549, 0, 1,
-1.124507, 0.5517348, -1.251349, 1, 0.7803922, 0, 1,
-1.122051, 0.1880098, -1.469731, 1, 0.7843137, 0, 1,
-1.115899, -1.13835, -2.943018, 1, 0.7921569, 0, 1,
-1.114881, 1.289124, -0.362446, 1, 0.7960784, 0, 1,
-1.114066, -0.6334913, -1.763666, 1, 0.8039216, 0, 1,
-1.098953, 0.4197351, -1.624714, 1, 0.8117647, 0, 1,
-1.091796, 0.5387251, -1.726597, 1, 0.8156863, 0, 1,
-1.090518, -1.046475, -3.58579, 1, 0.8235294, 0, 1,
-1.083887, -0.2375881, -1.390945, 1, 0.827451, 0, 1,
-1.081198, 0.4215098, -1.973535, 1, 0.8352941, 0, 1,
-1.075945, -1.220266, -0.9984903, 1, 0.8392157, 0, 1,
-1.073438, 0.3083488, -1.971233, 1, 0.8470588, 0, 1,
-1.056603, -0.6600219, -1.574291, 1, 0.8509804, 0, 1,
-1.038277, -0.4613733, -2.600816, 1, 0.8588235, 0, 1,
-1.031358, 0.8356544, -0.2110955, 1, 0.8627451, 0, 1,
-1.030446, -0.6926856, -1.684998, 1, 0.8705882, 0, 1,
-1.02989, -0.3191242, -3.214667, 1, 0.8745098, 0, 1,
-1.015146, -0.1356079, -4.718759, 1, 0.8823529, 0, 1,
-1.011402, -0.4842045, -1.742369, 1, 0.8862745, 0, 1,
-1.003912, 0.3227643, 0.2594008, 1, 0.8941177, 0, 1,
-1.002396, -1.023423, -1.439598, 1, 0.8980392, 0, 1,
-1.001258, 0.4097675, -0.7072486, 1, 0.9058824, 0, 1,
-0.9970721, 0.9399766, -2.819481, 1, 0.9137255, 0, 1,
-0.9905627, 0.6216836, -3.009402, 1, 0.9176471, 0, 1,
-0.9772635, 0.3696855, -1.86785, 1, 0.9254902, 0, 1,
-0.9757726, 1.456554, -1.118672, 1, 0.9294118, 0, 1,
-0.9641925, -1.903603, -2.967263, 1, 0.9372549, 0, 1,
-0.9559183, 0.8416621, -1.36128, 1, 0.9411765, 0, 1,
-0.954951, 0.003611882, -1.860425, 1, 0.9490196, 0, 1,
-0.9512577, 0.08430342, -0.5673042, 1, 0.9529412, 0, 1,
-0.9462402, -1.320326, -4.211583, 1, 0.9607843, 0, 1,
-0.941532, -0.03058363, -3.124461, 1, 0.9647059, 0, 1,
-0.9414963, 1.418605, 0.2212693, 1, 0.972549, 0, 1,
-0.9309886, -1.039648, -2.382276, 1, 0.9764706, 0, 1,
-0.9309158, -1.06324, -4.275105, 1, 0.9843137, 0, 1,
-0.9235629, -0.008852544, -2.081947, 1, 0.9882353, 0, 1,
-0.9150103, -0.4027506, -1.321332, 1, 0.9960784, 0, 1,
-0.9122563, 0.1334472, -2.245504, 0.9960784, 1, 0, 1,
-0.9118676, 0.1818356, -2.227288, 0.9921569, 1, 0, 1,
-0.908739, 0.506668, -1.118835, 0.9843137, 1, 0, 1,
-0.9047157, -1.053411, -1.978156, 0.9803922, 1, 0, 1,
-0.9009586, -0.3923846, -2.485717, 0.972549, 1, 0, 1,
-0.8907992, -0.418339, -2.145713, 0.9686275, 1, 0, 1,
-0.8907743, 0.8459255, -1.170991, 0.9607843, 1, 0, 1,
-0.8876056, -0.08258355, -1.154282, 0.9568627, 1, 0, 1,
-0.8818424, 0.5693398, 0.1048025, 0.9490196, 1, 0, 1,
-0.8795304, 0.6270344, -2.195647, 0.945098, 1, 0, 1,
-0.8779438, -1.232185, -1.927246, 0.9372549, 1, 0, 1,
-0.8751634, -0.0180543, -2.648293, 0.9333333, 1, 0, 1,
-0.8696696, 0.4400733, -0.8801998, 0.9254902, 1, 0, 1,
-0.8690247, 0.8685022, -1.646223, 0.9215686, 1, 0, 1,
-0.8639849, -0.4876318, -1.451534, 0.9137255, 1, 0, 1,
-0.8592267, -1.156696, -2.018393, 0.9098039, 1, 0, 1,
-0.8589113, 0.6839417, -1.955544, 0.9019608, 1, 0, 1,
-0.8554157, 1.000559, -0.07546578, 0.8941177, 1, 0, 1,
-0.8547437, -0.68737, -1.930892, 0.8901961, 1, 0, 1,
-0.8531132, 1.722209, -0.1734924, 0.8823529, 1, 0, 1,
-0.8517333, 0.2681746, -0.7144492, 0.8784314, 1, 0, 1,
-0.8439423, -1.227221, -4.429399, 0.8705882, 1, 0, 1,
-0.841553, 0.2117999, -0.9145016, 0.8666667, 1, 0, 1,
-0.8411581, -0.3530307, -3.154606, 0.8588235, 1, 0, 1,
-0.8411481, -2.900471, -3.047578, 0.854902, 1, 0, 1,
-0.8342663, -0.4715923, -2.483227, 0.8470588, 1, 0, 1,
-0.8338875, -0.09304529, -2.588482, 0.8431373, 1, 0, 1,
-0.8328869, -0.08697276, -1.186528, 0.8352941, 1, 0, 1,
-0.8286492, 1.366999, -0.279027, 0.8313726, 1, 0, 1,
-0.8280019, -0.8923763, -1.849288, 0.8235294, 1, 0, 1,
-0.8233787, -0.1147712, -1.94269, 0.8196079, 1, 0, 1,
-0.821412, -1.319264, -2.292138, 0.8117647, 1, 0, 1,
-0.8196472, 0.03021848, -0.7042634, 0.8078431, 1, 0, 1,
-0.8147437, 0.6563948, -1.291687, 0.8, 1, 0, 1,
-0.8106625, -0.5985498, -2.820263, 0.7921569, 1, 0, 1,
-0.8091487, 1.276699, -2.554054, 0.7882353, 1, 0, 1,
-0.8048502, 0.02282363, -1.391347, 0.7803922, 1, 0, 1,
-0.8046178, 0.7204605, -0.5788142, 0.7764706, 1, 0, 1,
-0.7992364, 0.06392931, -1.606254, 0.7686275, 1, 0, 1,
-0.7926096, 2.081454, 0.6169172, 0.7647059, 1, 0, 1,
-0.7915223, -0.2799853, -0.5138116, 0.7568628, 1, 0, 1,
-0.7913031, 0.5253471, -1.513464, 0.7529412, 1, 0, 1,
-0.7867707, 1.131519, -0.6623058, 0.7450981, 1, 0, 1,
-0.7862991, 1.392267, -0.9913089, 0.7411765, 1, 0, 1,
-0.7776982, -0.1486792, -0.3881208, 0.7333333, 1, 0, 1,
-0.7769103, -0.4339965, -2.193235, 0.7294118, 1, 0, 1,
-0.7703705, -1.478052, -2.020449, 0.7215686, 1, 0, 1,
-0.7682179, 0.4652496, -1.02371, 0.7176471, 1, 0, 1,
-0.7675122, 1.48646, 0.6617223, 0.7098039, 1, 0, 1,
-0.7602606, -0.412646, -2.1798, 0.7058824, 1, 0, 1,
-0.7471238, 0.2099714, -0.1684385, 0.6980392, 1, 0, 1,
-0.7438444, -1.2848, -3.567003, 0.6901961, 1, 0, 1,
-0.7414206, 0.992706, -2.224543, 0.6862745, 1, 0, 1,
-0.7411781, -0.8082233, -2.663642, 0.6784314, 1, 0, 1,
-0.7394756, -0.9423538, -3.894195, 0.6745098, 1, 0, 1,
-0.7353491, 0.3029424, -1.617388, 0.6666667, 1, 0, 1,
-0.7346585, -0.316212, -3.523108, 0.6627451, 1, 0, 1,
-0.7321679, -0.3997249, -1.593667, 0.654902, 1, 0, 1,
-0.7293377, -1.962005, -1.759085, 0.6509804, 1, 0, 1,
-0.7183707, -1.572269, -4.849489, 0.6431373, 1, 0, 1,
-0.7139238, -1.154329, -2.726461, 0.6392157, 1, 0, 1,
-0.7080371, 0.04802765, -1.905014, 0.6313726, 1, 0, 1,
-0.6961559, -0.3571486, -2.809992, 0.627451, 1, 0, 1,
-0.6950303, 2.164196, -2.148195, 0.6196079, 1, 0, 1,
-0.6943189, -1.868279, -3.307119, 0.6156863, 1, 0, 1,
-0.6923329, 0.2905652, -0.8497826, 0.6078432, 1, 0, 1,
-0.6788592, -0.3618777, -2.351274, 0.6039216, 1, 0, 1,
-0.677093, -2.351131, -2.634181, 0.5960785, 1, 0, 1,
-0.6770271, -0.4849983, -3.365132, 0.5882353, 1, 0, 1,
-0.6758787, -0.4137633, -2.173537, 0.5843138, 1, 0, 1,
-0.6704184, -0.1107591, -2.142073, 0.5764706, 1, 0, 1,
-0.6580448, 1.938944, 0.009951696, 0.572549, 1, 0, 1,
-0.6577002, -0.1171398, -1.643667, 0.5647059, 1, 0, 1,
-0.6518407, 1.665197, -0.3309436, 0.5607843, 1, 0, 1,
-0.6516046, -0.5213783, -0.6569355, 0.5529412, 1, 0, 1,
-0.6408672, -1.600763, -3.494063, 0.5490196, 1, 0, 1,
-0.6380262, 0.3813882, 0.1660911, 0.5411765, 1, 0, 1,
-0.6352704, 0.607852, -0.5753617, 0.5372549, 1, 0, 1,
-0.6300816, 0.6944879, -0.9557381, 0.5294118, 1, 0, 1,
-0.6275207, -0.5944239, -3.657744, 0.5254902, 1, 0, 1,
-0.6258044, 0.4288646, -0.1433928, 0.5176471, 1, 0, 1,
-0.6254681, -0.449686, -3.470613, 0.5137255, 1, 0, 1,
-0.6222525, 0.3421923, -1.022155, 0.5058824, 1, 0, 1,
-0.617514, 0.3735164, 0.1809961, 0.5019608, 1, 0, 1,
-0.6174173, 0.1916878, -2.248741, 0.4941176, 1, 0, 1,
-0.6133052, 0.5969138, -0.7603018, 0.4862745, 1, 0, 1,
-0.606062, 0.2930759, -0.7953185, 0.4823529, 1, 0, 1,
-0.5986843, -1.29978, -3.154011, 0.4745098, 1, 0, 1,
-0.5976868, 0.08371176, -1.930171, 0.4705882, 1, 0, 1,
-0.5970409, 0.441337, -1.399488, 0.4627451, 1, 0, 1,
-0.5947135, 0.4951922, -1.92565, 0.4588235, 1, 0, 1,
-0.5939744, 1.239587, -1.298126, 0.4509804, 1, 0, 1,
-0.5864778, -0.7182254, -1.724059, 0.4470588, 1, 0, 1,
-0.5857868, -0.8211035, -2.362287, 0.4392157, 1, 0, 1,
-0.5847976, 0.7886655, -1.646495, 0.4352941, 1, 0, 1,
-0.5825232, 0.2150203, -0.9042399, 0.427451, 1, 0, 1,
-0.5794932, 0.9682099, 0.6768791, 0.4235294, 1, 0, 1,
-0.579353, -0.4462817, -0.003657522, 0.4156863, 1, 0, 1,
-0.5788409, 0.9274244, -1.22171, 0.4117647, 1, 0, 1,
-0.5766854, -0.5613205, -3.026284, 0.4039216, 1, 0, 1,
-0.5765396, -1.584341, -3.287261, 0.3960784, 1, 0, 1,
-0.5702948, -0.7072978, -3.173195, 0.3921569, 1, 0, 1,
-0.5692904, 0.01978132, -1.435155, 0.3843137, 1, 0, 1,
-0.5683701, 1.938418, -1.533925, 0.3803922, 1, 0, 1,
-0.5639794, 0.02471367, -2.056938, 0.372549, 1, 0, 1,
-0.5624943, 0.1683864, -0.140279, 0.3686275, 1, 0, 1,
-0.5567527, 0.9006597, -0.131656, 0.3607843, 1, 0, 1,
-0.5558329, 0.5787485, -1.010286, 0.3568628, 1, 0, 1,
-0.544825, -0.02941843, 0.137543, 0.3490196, 1, 0, 1,
-0.5434148, -0.6996306, -2.593061, 0.345098, 1, 0, 1,
-0.5387402, -0.9959236, -2.384912, 0.3372549, 1, 0, 1,
-0.5374969, 0.8133548, -1.040712, 0.3333333, 1, 0, 1,
-0.5306872, 1.685451, -1.040614, 0.3254902, 1, 0, 1,
-0.520601, 0.993815, -1.065166, 0.3215686, 1, 0, 1,
-0.5130021, 0.32807, -1.682535, 0.3137255, 1, 0, 1,
-0.51191, -0.6330976, -1.834339, 0.3098039, 1, 0, 1,
-0.5072633, -1.890752, -2.077529, 0.3019608, 1, 0, 1,
-0.5014326, 0.2227423, -0.8739306, 0.2941177, 1, 0, 1,
-0.4996987, -1.541971, -2.816572, 0.2901961, 1, 0, 1,
-0.4986609, 0.6162777, -0.1759515, 0.282353, 1, 0, 1,
-0.4903262, 0.320599, -1.654769, 0.2784314, 1, 0, 1,
-0.4872653, -1.459085, -3.104691, 0.2705882, 1, 0, 1,
-0.4866639, -0.5238965, -3.090655, 0.2666667, 1, 0, 1,
-0.4817921, -0.7266112, -1.041944, 0.2588235, 1, 0, 1,
-0.4817528, -1.498533, -1.473459, 0.254902, 1, 0, 1,
-0.4812334, 1.273983, -0.7987849, 0.2470588, 1, 0, 1,
-0.4810806, 0.7317753, 1.221905, 0.2431373, 1, 0, 1,
-0.4749983, 1.559567, -0.9495946, 0.2352941, 1, 0, 1,
-0.4708564, 1.057545, 0.02336718, 0.2313726, 1, 0, 1,
-0.4654254, 0.9425678, 0.3837424, 0.2235294, 1, 0, 1,
-0.4549356, 0.5114638, -1.057128, 0.2196078, 1, 0, 1,
-0.4522441, 1.885609, 0.8719075, 0.2117647, 1, 0, 1,
-0.4481844, -0.2437433, -3.269305, 0.2078431, 1, 0, 1,
-0.4382157, 0.1023137, -2.037525, 0.2, 1, 0, 1,
-0.4295223, 0.1720215, -2.67095, 0.1921569, 1, 0, 1,
-0.4265878, -0.3922071, -0.3600366, 0.1882353, 1, 0, 1,
-0.4255176, -0.7379014, -2.488615, 0.1803922, 1, 0, 1,
-0.4227902, -1.2847, -1.792332, 0.1764706, 1, 0, 1,
-0.4211943, -1.778115, -3.392372, 0.1686275, 1, 0, 1,
-0.4207887, 1.103048, -0.8978274, 0.1647059, 1, 0, 1,
-0.4186177, -0.8122767, -1.714638, 0.1568628, 1, 0, 1,
-0.4139969, 0.6159095, -1.730067, 0.1529412, 1, 0, 1,
-0.4116995, 0.8679966, 0.7776396, 0.145098, 1, 0, 1,
-0.4078377, -1.034971, -3.224516, 0.1411765, 1, 0, 1,
-0.4046212, 0.9921615, 0.3083549, 0.1333333, 1, 0, 1,
-0.400409, 0.6885251, 0.5608968, 0.1294118, 1, 0, 1,
-0.3984998, 0.3504323, -0.5513218, 0.1215686, 1, 0, 1,
-0.395647, -0.7346272, -2.008629, 0.1176471, 1, 0, 1,
-0.3938493, 0.3706521, -1.4486, 0.1098039, 1, 0, 1,
-0.3926323, -1.154874, -1.303118, 0.1058824, 1, 0, 1,
-0.392561, 0.5760875, -1.795973, 0.09803922, 1, 0, 1,
-0.3899359, -0.5014172, -1.83497, 0.09019608, 1, 0, 1,
-0.3898314, 0.09688271, -1.877327, 0.08627451, 1, 0, 1,
-0.3841604, 0.6017689, -0.815208, 0.07843138, 1, 0, 1,
-0.3815009, 0.9800632, -2.487545, 0.07450981, 1, 0, 1,
-0.3811775, -0.3204254, -2.257041, 0.06666667, 1, 0, 1,
-0.3787946, 0.05422553, -2.989161, 0.0627451, 1, 0, 1,
-0.3786881, 1.435167, -2.02316, 0.05490196, 1, 0, 1,
-0.377712, -0.8783332, -1.620772, 0.05098039, 1, 0, 1,
-0.3765441, 1.556669, 1.342926, 0.04313726, 1, 0, 1,
-0.3763166, 0.9425846, 0.2099693, 0.03921569, 1, 0, 1,
-0.3747231, 0.1933428, -1.511728, 0.03137255, 1, 0, 1,
-0.3744273, -0.6605338, -4.540183, 0.02745098, 1, 0, 1,
-0.3720163, -0.4578097, -2.276185, 0.01960784, 1, 0, 1,
-0.3652058, 0.723795, -0.5447639, 0.01568628, 1, 0, 1,
-0.3646621, 0.5077133, -1.285754, 0.007843138, 1, 0, 1,
-0.3602583, -0.7403908, -4.33793, 0.003921569, 1, 0, 1,
-0.3564707, -1.189512, -3.835744, 0, 1, 0.003921569, 1,
-0.3555874, -0.6683809, -1.56252, 0, 1, 0.01176471, 1,
-0.3537309, 1.495596, -0.3505654, 0, 1, 0.01568628, 1,
-0.3493764, 0.9697251, -1.515389, 0, 1, 0.02352941, 1,
-0.3487819, 0.430564, -1.483433, 0, 1, 0.02745098, 1,
-0.3468616, -0.4299917, -2.609285, 0, 1, 0.03529412, 1,
-0.3405825, -0.2515936, -2.956986, 0, 1, 0.03921569, 1,
-0.3404959, -0.2050695, -1.720612, 0, 1, 0.04705882, 1,
-0.3402192, -1.049091, -4.100547, 0, 1, 0.05098039, 1,
-0.3369301, 0.3430886, -2.104678, 0, 1, 0.05882353, 1,
-0.3330747, 0.4363035, -0.973919, 0, 1, 0.0627451, 1,
-0.3326877, 0.9267392, -0.7528258, 0, 1, 0.07058824, 1,
-0.3323178, -0.8585056, -1.677315, 0, 1, 0.07450981, 1,
-0.3243265, 0.7181934, -1.646837, 0, 1, 0.08235294, 1,
-0.3218384, -0.1658716, -2.220605, 0, 1, 0.08627451, 1,
-0.3202951, -0.5138845, -3.39594, 0, 1, 0.09411765, 1,
-0.3190333, -1.400806, -3.763587, 0, 1, 0.1019608, 1,
-0.3161783, 0.727122, -2.51578, 0, 1, 0.1058824, 1,
-0.3147267, -0.5905604, -2.66793, 0, 1, 0.1137255, 1,
-0.314505, 1.471511, -1.455054, 0, 1, 0.1176471, 1,
-0.3127311, 0.41061, -1.894855, 0, 1, 0.1254902, 1,
-0.3123922, -1.001419, -2.609933, 0, 1, 0.1294118, 1,
-0.307621, 1.420039, 0.4106363, 0, 1, 0.1372549, 1,
-0.3070223, -0.2719787, -0.5700079, 0, 1, 0.1411765, 1,
-0.3068765, -1.024855, -3.435369, 0, 1, 0.1490196, 1,
-0.3019488, 0.123249, 0.4743201, 0, 1, 0.1529412, 1,
-0.299119, -0.2916291, -3.059254, 0, 1, 0.1607843, 1,
-0.2966568, -1.071538, -2.597218, 0, 1, 0.1647059, 1,
-0.295492, 2.046502, 0.5924138, 0, 1, 0.172549, 1,
-0.2942785, -1.567042, -2.822914, 0, 1, 0.1764706, 1,
-0.2866574, -0.2832839, -3.36497, 0, 1, 0.1843137, 1,
-0.2819425, 0.4326459, -1.332268, 0, 1, 0.1882353, 1,
-0.2800469, -1.360954, -3.373559, 0, 1, 0.1960784, 1,
-0.2783485, -0.3490198, -1.913881, 0, 1, 0.2039216, 1,
-0.275928, 1.353709, -0.5775856, 0, 1, 0.2078431, 1,
-0.2755767, 0.8522268, -0.6793132, 0, 1, 0.2156863, 1,
-0.2742107, -0.9103677, -2.991429, 0, 1, 0.2196078, 1,
-0.2730716, 2.23338, 0.6015579, 0, 1, 0.227451, 1,
-0.2706637, 1.212652, -0.9820022, 0, 1, 0.2313726, 1,
-0.2685233, 2.041344, 0.1910398, 0, 1, 0.2392157, 1,
-0.2669142, 0.6557215, 0.5897957, 0, 1, 0.2431373, 1,
-0.2667982, 0.4263521, -1.21471, 0, 1, 0.2509804, 1,
-0.2667666, 1.560215, 0.02016081, 0, 1, 0.254902, 1,
-0.2631295, 1.280593, -2.352627, 0, 1, 0.2627451, 1,
-0.2594676, 1.3194, -1.509616, 0, 1, 0.2666667, 1,
-0.2571057, -1.352365, -0.5872893, 0, 1, 0.2745098, 1,
-0.2553748, 0.2318571, -0.5592337, 0, 1, 0.2784314, 1,
-0.2518, 0.9692326, -1.591598, 0, 1, 0.2862745, 1,
-0.251303, -1.597636, -2.68195, 0, 1, 0.2901961, 1,
-0.2510233, -0.662411, -3.619497, 0, 1, 0.2980392, 1,
-0.2463071, -0.7248315, -3.24682, 0, 1, 0.3058824, 1,
-0.2435836, 1.111058, 0.2084882, 0, 1, 0.3098039, 1,
-0.2432351, 1.66957, 0.792983, 0, 1, 0.3176471, 1,
-0.2426018, 0.9555072, -0.9199315, 0, 1, 0.3215686, 1,
-0.2421186, -0.6181702, -2.822448, 0, 1, 0.3294118, 1,
-0.2368016, -0.07809813, -2.728169, 0, 1, 0.3333333, 1,
-0.2343135, -0.3205951, -3.251155, 0, 1, 0.3411765, 1,
-0.2254603, 0.1279361, -2.458768, 0, 1, 0.345098, 1,
-0.2240464, 1.564073, 1.939507, 0, 1, 0.3529412, 1,
-0.2220059, -0.4435548, -0.7006543, 0, 1, 0.3568628, 1,
-0.2163932, -1.288492, -2.080731, 0, 1, 0.3647059, 1,
-0.2132008, 0.7380288, 1.793702, 0, 1, 0.3686275, 1,
-0.2106347, -0.5225959, -3.97853, 0, 1, 0.3764706, 1,
-0.210236, 1.780285, 0.8620207, 0, 1, 0.3803922, 1,
-0.2083233, -1.837533, -2.423051, 0, 1, 0.3882353, 1,
-0.2082078, 0.9853176, 0.8601488, 0, 1, 0.3921569, 1,
-0.2077757, 0.6626722, -0.8028071, 0, 1, 0.4, 1,
-0.2069446, -0.4343924, -3.083212, 0, 1, 0.4078431, 1,
-0.2063275, -0.2305465, -3.907071, 0, 1, 0.4117647, 1,
-0.2044209, 0.4223351, 0.1315157, 0, 1, 0.4196078, 1,
-0.203008, 0.3275042, 0.2920513, 0, 1, 0.4235294, 1,
-0.1976799, 0.7775108, -2.095682, 0, 1, 0.4313726, 1,
-0.19729, -0.6598023, -4.637136, 0, 1, 0.4352941, 1,
-0.1927424, 2.365887, -0.6670722, 0, 1, 0.4431373, 1,
-0.1915843, 1.388931, -1.610254, 0, 1, 0.4470588, 1,
-0.1905026, 1.21366, 0.1543825, 0, 1, 0.454902, 1,
-0.1899564, 1.20732, -0.0008575697, 0, 1, 0.4588235, 1,
-0.1889, 1.484788, 0.3503481, 0, 1, 0.4666667, 1,
-0.1882467, -1.572138, -2.996051, 0, 1, 0.4705882, 1,
-0.1871464, -1.373127, -4.507644, 0, 1, 0.4784314, 1,
-0.1820702, -0.1240617, -3.485397, 0, 1, 0.4823529, 1,
-0.1820055, -0.7943916, -2.631974, 0, 1, 0.4901961, 1,
-0.1793042, 1.653965, 0.0691619, 0, 1, 0.4941176, 1,
-0.1760432, 0.7570087, -1.070793, 0, 1, 0.5019608, 1,
-0.1735078, 0.2692806, 0.3239569, 0, 1, 0.509804, 1,
-0.1699913, -0.09545576, -2.672623, 0, 1, 0.5137255, 1,
-0.1675034, -1.006368, -1.705529, 0, 1, 0.5215687, 1,
-0.1673917, 0.02943549, -1.712552, 0, 1, 0.5254902, 1,
-0.1614567, 1.070304, -0.5196666, 0, 1, 0.5333334, 1,
-0.1604073, -0.4124679, -2.916607, 0, 1, 0.5372549, 1,
-0.157608, 0.6481946, 0.5316566, 0, 1, 0.5450981, 1,
-0.1574471, -0.6256282, -4.595826, 0, 1, 0.5490196, 1,
-0.1521446, 0.9356932, -0.9531792, 0, 1, 0.5568628, 1,
-0.1519233, 1.041284, -1.009898, 0, 1, 0.5607843, 1,
-0.1518046, -0.3501123, -5.239659, 0, 1, 0.5686275, 1,
-0.150602, 0.5809578, 0.08165056, 0, 1, 0.572549, 1,
-0.1497025, -0.8444713, -2.334411, 0, 1, 0.5803922, 1,
-0.1487018, 0.9297749, -2.738206, 0, 1, 0.5843138, 1,
-0.1458689, 0.09768609, -0.5240152, 0, 1, 0.5921569, 1,
-0.1442163, 0.9527191, 0.1916815, 0, 1, 0.5960785, 1,
-0.1383319, -2.670072, -4.191225, 0, 1, 0.6039216, 1,
-0.1342228, 0.7689185, 2.270539, 0, 1, 0.6117647, 1,
-0.1306611, -0.6902569, -3.275846, 0, 1, 0.6156863, 1,
-0.1302565, 0.4853487, -0.6617, 0, 1, 0.6235294, 1,
-0.1281475, -0.5173523, -1.312979, 0, 1, 0.627451, 1,
-0.1281317, 0.3510402, -0.5849907, 0, 1, 0.6352941, 1,
-0.1269345, -0.9393888, -4.238044, 0, 1, 0.6392157, 1,
-0.1249221, -0.2504778, -2.964028, 0, 1, 0.6470588, 1,
-0.1220443, 0.4205059, 0.7124594, 0, 1, 0.6509804, 1,
-0.1217625, -0.1036684, -2.82354, 0, 1, 0.6588235, 1,
-0.1116649, -0.9430944, -3.345439, 0, 1, 0.6627451, 1,
-0.1076896, 1.187734, 0.8708826, 0, 1, 0.6705883, 1,
-0.106922, -1.901163, -1.677539, 0, 1, 0.6745098, 1,
-0.09993625, -1.181424, -3.465902, 0, 1, 0.682353, 1,
-0.09847269, -0.1440945, -3.658917, 0, 1, 0.6862745, 1,
-0.09221093, -2.009883, -3.321231, 0, 1, 0.6941177, 1,
-0.09064034, -1.222553, -3.216458, 0, 1, 0.7019608, 1,
-0.09016822, -0.1328765, -2.105982, 0, 1, 0.7058824, 1,
-0.08808371, 0.8556643, -2.26869, 0, 1, 0.7137255, 1,
-0.08483005, 0.6347769, 1.771195, 0, 1, 0.7176471, 1,
-0.07755254, -1.226899, -3.854946, 0, 1, 0.7254902, 1,
-0.07690252, -0.2194304, -4.248286, 0, 1, 0.7294118, 1,
-0.0729938, 1.022845, -0.1086655, 0, 1, 0.7372549, 1,
-0.07295003, -0.08650159, -1.492813, 0, 1, 0.7411765, 1,
-0.07011441, 0.8109829, -0.9579772, 0, 1, 0.7490196, 1,
-0.0664644, 1.11181, -0.9955013, 0, 1, 0.7529412, 1,
-0.06383178, 1.900121, -0.6176187, 0, 1, 0.7607843, 1,
-0.06323611, -1.625637, -2.700989, 0, 1, 0.7647059, 1,
-0.0607276, -0.1716415, -3.765579, 0, 1, 0.772549, 1,
-0.06028072, 1.203672, -0.03995034, 0, 1, 0.7764706, 1,
-0.05819882, 0.1363472, -1.269569, 0, 1, 0.7843137, 1,
-0.05725605, -1.027578, -2.430265, 0, 1, 0.7882353, 1,
-0.05707157, -0.08428139, -1.241763, 0, 1, 0.7960784, 1,
-0.05607081, 0.4802115, -2.12604, 0, 1, 0.8039216, 1,
-0.0540344, 0.2845035, -2.416838, 0, 1, 0.8078431, 1,
-0.05313568, 0.8395745, 1.415925, 0, 1, 0.8156863, 1,
-0.04860304, 0.1559098, 0.09143984, 0, 1, 0.8196079, 1,
-0.04730687, -1.338386, -2.606522, 0, 1, 0.827451, 1,
-0.04376091, 1.399235, 0.01057171, 0, 1, 0.8313726, 1,
-0.03813548, 0.4113005, 1.00783, 0, 1, 0.8392157, 1,
-0.03715875, 0.3773256, -0.1663695, 0, 1, 0.8431373, 1,
-0.03661932, 1.074757, 0.9311229, 0, 1, 0.8509804, 1,
-0.03441883, -0.9300045, -2.637929, 0, 1, 0.854902, 1,
-0.03308179, 0.7907581, 1.298889, 0, 1, 0.8627451, 1,
-0.02972145, 0.302069, 0.06012284, 0, 1, 0.8666667, 1,
-0.02580722, -1.299851, -1.468854, 0, 1, 0.8745098, 1,
-0.01785414, 1.714467, -0.4287446, 0, 1, 0.8784314, 1,
-0.0127714, 0.5681935, 0.8024933, 0, 1, 0.8862745, 1,
-0.01009477, -0.8202155, -3.142439, 0, 1, 0.8901961, 1,
-0.007946409, -0.496016, -3.130192, 0, 1, 0.8980392, 1,
-0.007757546, 0.2828232, 0.4203463, 0, 1, 0.9058824, 1,
-0.004285824, -0.8579789, -3.008443, 0, 1, 0.9098039, 1,
-0.0008742828, 1.634992, -0.7875876, 0, 1, 0.9176471, 1,
0.0007670178, 0.8567137, 0.8700041, 0, 1, 0.9215686, 1,
0.0007726019, -1.36742, 2.332681, 0, 1, 0.9294118, 1,
0.001295027, 0.4363002, -0.1696115, 0, 1, 0.9333333, 1,
0.00147869, -0.9477077, 2.209144, 0, 1, 0.9411765, 1,
0.004907244, -0.1595828, 2.463552, 0, 1, 0.945098, 1,
0.007406266, -0.448051, 4.331243, 0, 1, 0.9529412, 1,
0.009231374, 0.4477301, 0.720144, 0, 1, 0.9568627, 1,
0.01059722, -0.5734784, 3.033118, 0, 1, 0.9647059, 1,
0.01082788, -1.162546, 4.904657, 0, 1, 0.9686275, 1,
0.01218284, -0.9238106, 4.54271, 0, 1, 0.9764706, 1,
0.01295095, -2.291335, 4.417597, 0, 1, 0.9803922, 1,
0.01457051, 0.6799082, 0.09847321, 0, 1, 0.9882353, 1,
0.01788828, -0.5852988, 4.096508, 0, 1, 0.9921569, 1,
0.0183948, -0.1627799, 2.263385, 0, 1, 1, 1,
0.02002599, 1.458818, -0.682459, 0, 0.9921569, 1, 1,
0.02237414, 2.291106, 0.47854, 0, 0.9882353, 1, 1,
0.02473109, -0.1922472, 2.059187, 0, 0.9803922, 1, 1,
0.03040875, -0.2903415, 2.24608, 0, 0.9764706, 1, 1,
0.03172695, 0.6811101, 0.8151774, 0, 0.9686275, 1, 1,
0.03247861, 0.6661173, -0.9807981, 0, 0.9647059, 1, 1,
0.03357203, -0.01788669, 1.752995, 0, 0.9568627, 1, 1,
0.03566365, -0.4977829, 2.421483, 0, 0.9529412, 1, 1,
0.04061519, 0.9339912, -0.5784929, 0, 0.945098, 1, 1,
0.04232506, 1.577456, 1.256804, 0, 0.9411765, 1, 1,
0.04488277, 1.062045, -0.7856439, 0, 0.9333333, 1, 1,
0.04674771, -0.4664423, 3.033969, 0, 0.9294118, 1, 1,
0.05173799, 1.426542, -1.681716, 0, 0.9215686, 1, 1,
0.0532495, -0.314344, 1.594891, 0, 0.9176471, 1, 1,
0.05362954, -2.142108, 3.685535, 0, 0.9098039, 1, 1,
0.05380265, 0.7283705, -2.753271, 0, 0.9058824, 1, 1,
0.0559257, -0.733439, 4.013495, 0, 0.8980392, 1, 1,
0.0587795, 0.7330743, 0.6846182, 0, 0.8901961, 1, 1,
0.05898217, -0.7710406, 2.417843, 0, 0.8862745, 1, 1,
0.06020022, -1.722499, 3.230448, 0, 0.8784314, 1, 1,
0.06157885, 0.8294751, -0.394699, 0, 0.8745098, 1, 1,
0.06303872, 1.457762, -1.676816, 0, 0.8666667, 1, 1,
0.06337722, -0.1853424, 1.319408, 0, 0.8627451, 1, 1,
0.06606476, -1.559038, 2.946064, 0, 0.854902, 1, 1,
0.06782956, -0.2751585, 2.720228, 0, 0.8509804, 1, 1,
0.06805795, 0.0287711, 1.139019, 0, 0.8431373, 1, 1,
0.07122757, 1.109618, 1.19645, 0, 0.8392157, 1, 1,
0.072679, -0.09941269, 2.149382, 0, 0.8313726, 1, 1,
0.07271194, -0.02659372, 3.192917, 0, 0.827451, 1, 1,
0.07780467, -0.1826301, 1.302605, 0, 0.8196079, 1, 1,
0.07973804, 0.2439389, 0.2080703, 0, 0.8156863, 1, 1,
0.08117257, -0.9469727, 3.624676, 0, 0.8078431, 1, 1,
0.08462532, 0.5180219, -0.1971847, 0, 0.8039216, 1, 1,
0.08753236, -1.78712, 1.722052, 0, 0.7960784, 1, 1,
0.09033888, -1.180551, 3.006429, 0, 0.7882353, 1, 1,
0.09039413, -2.415721, 3.506517, 0, 0.7843137, 1, 1,
0.09160683, 0.1309798, 0.7223491, 0, 0.7764706, 1, 1,
0.0932681, -0.5166836, 0.2788204, 0, 0.772549, 1, 1,
0.0960728, -1.106031, 1.427302, 0, 0.7647059, 1, 1,
0.1007036, -0.372449, 3.631544, 0, 0.7607843, 1, 1,
0.1009568, 0.4751668, 2.49298, 0, 0.7529412, 1, 1,
0.1085411, 1.102432, 0.1630742, 0, 0.7490196, 1, 1,
0.1108891, 0.05648342, 0.8978128, 0, 0.7411765, 1, 1,
0.1171264, 0.5397299, 1.436291, 0, 0.7372549, 1, 1,
0.1176023, 0.9611374, 0.504478, 0, 0.7294118, 1, 1,
0.1232715, -0.07273811, 3.071215, 0, 0.7254902, 1, 1,
0.1266429, -0.7196482, 2.581322, 0, 0.7176471, 1, 1,
0.1284022, 0.4661888, -1.003161, 0, 0.7137255, 1, 1,
0.1367345, -1.482217, 3.010146, 0, 0.7058824, 1, 1,
0.1392427, 1.448589, -0.6250312, 0, 0.6980392, 1, 1,
0.139664, -1.442163, 2.81629, 0, 0.6941177, 1, 1,
0.1412289, -0.2512781, 2.358571, 0, 0.6862745, 1, 1,
0.1415036, -1.753824, 3.353657, 0, 0.682353, 1, 1,
0.1438174, 0.1779988, 1.288167, 0, 0.6745098, 1, 1,
0.1446227, 1.299288, -0.5752842, 0, 0.6705883, 1, 1,
0.1460382, -1.695032, 3.856854, 0, 0.6627451, 1, 1,
0.1493526, -0.113703, 3.095854, 0, 0.6588235, 1, 1,
0.1505995, 0.4710514, 0.1679844, 0, 0.6509804, 1, 1,
0.1513232, 0.09996037, -0.8943477, 0, 0.6470588, 1, 1,
0.152211, -0.87949, 4.192071, 0, 0.6392157, 1, 1,
0.153876, 1.428007, -1.301497, 0, 0.6352941, 1, 1,
0.1571517, -0.8825524, 3.066354, 0, 0.627451, 1, 1,
0.1587728, -1.613107, 2.596419, 0, 0.6235294, 1, 1,
0.1594602, 0.5855036, -0.1193234, 0, 0.6156863, 1, 1,
0.1613603, 0.448732, -0.8165104, 0, 0.6117647, 1, 1,
0.1635815, -0.8666926, 2.320182, 0, 0.6039216, 1, 1,
0.1665256, 0.7110261, 0.1235519, 0, 0.5960785, 1, 1,
0.1671121, 0.4901522, 0.9842962, 0, 0.5921569, 1, 1,
0.1714698, 0.702493, 0.6723663, 0, 0.5843138, 1, 1,
0.1749702, 0.5809895, -1.053009, 0, 0.5803922, 1, 1,
0.1764353, -1.454155, 1.103414, 0, 0.572549, 1, 1,
0.1775075, 0.3132673, 1.393301, 0, 0.5686275, 1, 1,
0.1779296, 0.6213146, -0.8031609, 0, 0.5607843, 1, 1,
0.1787434, 1.868302, 0.9014882, 0, 0.5568628, 1, 1,
0.1805782, -0.0130922, 2.578204, 0, 0.5490196, 1, 1,
0.1875816, -0.8216973, 3.256867, 0, 0.5450981, 1, 1,
0.1877984, -1.924886, 3.420309, 0, 0.5372549, 1, 1,
0.1882657, -0.4710654, 2.962266, 0, 0.5333334, 1, 1,
0.1886112, 2.202207, -1.420936, 0, 0.5254902, 1, 1,
0.1914499, -1.295823, 3.52499, 0, 0.5215687, 1, 1,
0.1921549, -0.8323514, 2.905993, 0, 0.5137255, 1, 1,
0.195153, 0.08687405, 1.010177, 0, 0.509804, 1, 1,
0.1959222, -0.316542, 3.263274, 0, 0.5019608, 1, 1,
0.2053148, -0.961965, 2.269197, 0, 0.4941176, 1, 1,
0.2129175, -0.8902715, 5.430385, 0, 0.4901961, 1, 1,
0.2147482, 1.161121, 1.877234, 0, 0.4823529, 1, 1,
0.220413, 2.754285, 0.5710533, 0, 0.4784314, 1, 1,
0.2222061, -0.2189053, 1.508947, 0, 0.4705882, 1, 1,
0.2235276, -2.106576, 1.819158, 0, 0.4666667, 1, 1,
0.2255531, -0.2247203, 1.947897, 0, 0.4588235, 1, 1,
0.2264569, 0.05034923, 2.108593, 0, 0.454902, 1, 1,
0.2298749, -1.190003, 1.956383, 0, 0.4470588, 1, 1,
0.2303907, 0.3451588, -1.733737, 0, 0.4431373, 1, 1,
0.2383544, -1.294077, 3.456322, 0, 0.4352941, 1, 1,
0.2400657, -0.5962911, 3.147715, 0, 0.4313726, 1, 1,
0.2402549, 0.6268653, -2.085047, 0, 0.4235294, 1, 1,
0.2431922, -0.4092144, 3.717066, 0, 0.4196078, 1, 1,
0.2459027, 0.6987899, 0.3683206, 0, 0.4117647, 1, 1,
0.2475335, -1.684508, 3.382874, 0, 0.4078431, 1, 1,
0.2491445, 0.4544969, 2.502845, 0, 0.4, 1, 1,
0.2549803, 1.702919, 0.08254787, 0, 0.3921569, 1, 1,
0.2550707, 0.2881816, 2.312587, 0, 0.3882353, 1, 1,
0.2589066, 0.03151088, 0.6904029, 0, 0.3803922, 1, 1,
0.2591363, -0.1394179, 2.858436, 0, 0.3764706, 1, 1,
0.2595028, 0.09348959, 1.112642, 0, 0.3686275, 1, 1,
0.2602111, -1.331703, 2.837771, 0, 0.3647059, 1, 1,
0.2612208, -0.5327989, 3.375245, 0, 0.3568628, 1, 1,
0.2613718, 0.06122102, 2.656328, 0, 0.3529412, 1, 1,
0.2674979, 0.5507898, 0.6621852, 0, 0.345098, 1, 1,
0.2681906, -0.5920027, 2.923743, 0, 0.3411765, 1, 1,
0.2703997, 0.5808141, 0.6186823, 0, 0.3333333, 1, 1,
0.2704816, -0.0622791, 2.054868, 0, 0.3294118, 1, 1,
0.2713936, -1.043315, 3.313119, 0, 0.3215686, 1, 1,
0.2736535, 1.650743, 1.225645, 0, 0.3176471, 1, 1,
0.2737429, -0.7488675, 2.240246, 0, 0.3098039, 1, 1,
0.2775691, 1.128451, -0.8067743, 0, 0.3058824, 1, 1,
0.2790327, 1.718918, 1.644139, 0, 0.2980392, 1, 1,
0.2792705, -0.2961506, 1.730525, 0, 0.2901961, 1, 1,
0.2808041, -1.095586, 2.496271, 0, 0.2862745, 1, 1,
0.2818121, 0.9994162, -0.2163165, 0, 0.2784314, 1, 1,
0.2849393, 0.001705533, 2.677276, 0, 0.2745098, 1, 1,
0.2872122, -0.8355606, 2.213397, 0, 0.2666667, 1, 1,
0.2878051, 1.882705, -0.6890485, 0, 0.2627451, 1, 1,
0.2897824, 1.121408, -0.5135581, 0, 0.254902, 1, 1,
0.2953189, -1.228043, 2.966758, 0, 0.2509804, 1, 1,
0.3046336, 1.315147, 1.048127, 0, 0.2431373, 1, 1,
0.3071267, -0.9751415, 2.046549, 0, 0.2392157, 1, 1,
0.3075684, 0.6423121, -0.8589676, 0, 0.2313726, 1, 1,
0.3105752, -0.8385611, 2.234005, 0, 0.227451, 1, 1,
0.3111292, -0.8140163, 3.584126, 0, 0.2196078, 1, 1,
0.3112188, -0.6174357, 1.730222, 0, 0.2156863, 1, 1,
0.3130908, -1.107448, 3.002518, 0, 0.2078431, 1, 1,
0.3162696, 0.9285444, -0.5115968, 0, 0.2039216, 1, 1,
0.3205878, 0.3318817, 2.041003, 0, 0.1960784, 1, 1,
0.3230291, 0.8951577, -0.8991234, 0, 0.1882353, 1, 1,
0.3261436, 0.7588884, 0.01718837, 0, 0.1843137, 1, 1,
0.3264098, -0.5649453, 1.776785, 0, 0.1764706, 1, 1,
0.328486, -0.2592716, 4.145261, 0, 0.172549, 1, 1,
0.3327299, -0.3986989, 1.608084, 0, 0.1647059, 1, 1,
0.3372848, 0.7924494, 2.815331, 0, 0.1607843, 1, 1,
0.3427876, -0.3030336, 2.742727, 0, 0.1529412, 1, 1,
0.3435883, -0.3381265, 2.064579, 0, 0.1490196, 1, 1,
0.3451554, -1.013447, 2.699335, 0, 0.1411765, 1, 1,
0.3465614, -0.3162536, 1.843208, 0, 0.1372549, 1, 1,
0.3564823, -0.0002494843, 2.297508, 0, 0.1294118, 1, 1,
0.3579343, -0.3817793, 2.709214, 0, 0.1254902, 1, 1,
0.3582969, -0.2014027, 2.423587, 0, 0.1176471, 1, 1,
0.3603777, -1.649462, 3.907644, 0, 0.1137255, 1, 1,
0.3604359, 0.1158133, 1.655735, 0, 0.1058824, 1, 1,
0.3605543, -0.6936912, 3.778468, 0, 0.09803922, 1, 1,
0.3622095, -1.485776, 3.970613, 0, 0.09411765, 1, 1,
0.3649088, 1.659945, 1.520762, 0, 0.08627451, 1, 1,
0.3674402, -1.018854, 2.273199, 0, 0.08235294, 1, 1,
0.367933, 1.569386, 0.790638, 0, 0.07450981, 1, 1,
0.3777295, 1.446381, 0.2077337, 0, 0.07058824, 1, 1,
0.3788173, 1.137175, 0.4100555, 0, 0.0627451, 1, 1,
0.3853057, 1.161002, 1.042203, 0, 0.05882353, 1, 1,
0.3867141, -0.424246, 2.466698, 0, 0.05098039, 1, 1,
0.3892206, 1.047181, -0.4630702, 0, 0.04705882, 1, 1,
0.3928124, 0.5167733, 0.335993, 0, 0.03921569, 1, 1,
0.3973316, -0.4820369, 1.029131, 0, 0.03529412, 1, 1,
0.3989325, 0.2281715, 2.447419, 0, 0.02745098, 1, 1,
0.4009812, 0.1989944, 0.5040983, 0, 0.02352941, 1, 1,
0.410005, 0.06162607, 2.735292, 0, 0.01568628, 1, 1,
0.41495, -0.692419, 3.063015, 0, 0.01176471, 1, 1,
0.4193023, -0.8471659, 4.278908, 0, 0.003921569, 1, 1,
0.4221912, 1.46781, 0.9706407, 0.003921569, 0, 1, 1,
0.4223133, -0.04706164, 2.694029, 0.007843138, 0, 1, 1,
0.4281487, -1.230115, 5.170234, 0.01568628, 0, 1, 1,
0.4307063, 0.58401, 1.312143, 0.01960784, 0, 1, 1,
0.4331333, 0.7383589, 0.3532619, 0.02745098, 0, 1, 1,
0.4358192, 0.2017225, -0.06484817, 0.03137255, 0, 1, 1,
0.4371147, 1.008815, -0.007406462, 0.03921569, 0, 1, 1,
0.4453678, 0.6804157, -0.8575791, 0.04313726, 0, 1, 1,
0.4487027, 1.311267, 0.8034253, 0.05098039, 0, 1, 1,
0.4529724, -0.1197359, 0.7445009, 0.05490196, 0, 1, 1,
0.453176, -0.1746141, 3.823221, 0.0627451, 0, 1, 1,
0.4558549, -0.2837775, 1.378726, 0.06666667, 0, 1, 1,
0.45632, 1.4239, 1.338171, 0.07450981, 0, 1, 1,
0.4590335, 1.454608, 1.77962, 0.07843138, 0, 1, 1,
0.4638036, -0.1280069, 2.212451, 0.08627451, 0, 1, 1,
0.4674847, -0.5973947, 0.7972526, 0.09019608, 0, 1, 1,
0.469377, -0.2604299, 2.478892, 0.09803922, 0, 1, 1,
0.4719495, 0.7893286, 1.144574, 0.1058824, 0, 1, 1,
0.4774713, -0.6880196, 2.199989, 0.1098039, 0, 1, 1,
0.4808972, -0.3723881, 1.005614, 0.1176471, 0, 1, 1,
0.4825279, 1.34191, 0.06687518, 0.1215686, 0, 1, 1,
0.4843008, 0.1251498, 1.441718, 0.1294118, 0, 1, 1,
0.4854454, -2.39977, 1.889464, 0.1333333, 0, 1, 1,
0.4924271, -0.7277767, 1.387311, 0.1411765, 0, 1, 1,
0.496384, -0.7148192, 2.230057, 0.145098, 0, 1, 1,
0.497819, 0.05607004, 1.151988, 0.1529412, 0, 1, 1,
0.5047802, -0.9901199, 2.852593, 0.1568628, 0, 1, 1,
0.5048735, 0.04437754, 1.639157, 0.1647059, 0, 1, 1,
0.505801, -0.1112043, 2.845991, 0.1686275, 0, 1, 1,
0.5064108, -0.4697651, 2.008671, 0.1764706, 0, 1, 1,
0.5098801, -0.8848786, 2.850181, 0.1803922, 0, 1, 1,
0.510444, -0.951644, 3.180832, 0.1882353, 0, 1, 1,
0.5129827, 1.415546, 0.5816444, 0.1921569, 0, 1, 1,
0.5138682, -0.356509, 2.410245, 0.2, 0, 1, 1,
0.516556, -1.054383, 2.263044, 0.2078431, 0, 1, 1,
0.5166334, 1.436863, 0.7975269, 0.2117647, 0, 1, 1,
0.5239676, -0.444183, 1.948562, 0.2196078, 0, 1, 1,
0.5250923, -0.01276339, 1.34904, 0.2235294, 0, 1, 1,
0.5278965, -1.017636, 0.3802665, 0.2313726, 0, 1, 1,
0.5306212, -0.6976126, 2.331188, 0.2352941, 0, 1, 1,
0.5339535, -0.7943998, 0.8490726, 0.2431373, 0, 1, 1,
0.5399866, 1.476224, 1.02721, 0.2470588, 0, 1, 1,
0.5429457, -0.01499289, 2.062461, 0.254902, 0, 1, 1,
0.5435096, 1.516197, 0.3806817, 0.2588235, 0, 1, 1,
0.5437918, -0.8073069, 2.731177, 0.2666667, 0, 1, 1,
0.5454425, 0.3208855, 3.07875, 0.2705882, 0, 1, 1,
0.5498846, 1.015109, 1.591056, 0.2784314, 0, 1, 1,
0.5499318, 0.1511493, 3.735193, 0.282353, 0, 1, 1,
0.5638086, 0.7611045, 0.7783353, 0.2901961, 0, 1, 1,
0.564903, 0.1903529, 2.656761, 0.2941177, 0, 1, 1,
0.5684511, -3.141912, 3.137655, 0.3019608, 0, 1, 1,
0.5698475, -0.01519454, -0.1198018, 0.3098039, 0, 1, 1,
0.571247, -1.858814, 2.759627, 0.3137255, 0, 1, 1,
0.5717288, -2.456494, 4.02764, 0.3215686, 0, 1, 1,
0.5731849, 1.067617, 2.190613, 0.3254902, 0, 1, 1,
0.5732244, 0.01825256, 1.774909, 0.3333333, 0, 1, 1,
0.5791545, -0.4510107, 2.722622, 0.3372549, 0, 1, 1,
0.5824238, -0.8401977, 2.886932, 0.345098, 0, 1, 1,
0.5865218, 0.4420427, 0.6702849, 0.3490196, 0, 1, 1,
0.5921742, -0.1586858, 0.5961142, 0.3568628, 0, 1, 1,
0.5977339, 0.6625661, 0.1253341, 0.3607843, 0, 1, 1,
0.6009195, 1.522591, 0.775977, 0.3686275, 0, 1, 1,
0.6069863, 0.4857216, -0.2874606, 0.372549, 0, 1, 1,
0.6074949, 0.892043, 2.976838, 0.3803922, 0, 1, 1,
0.6104468, 0.3049144, 0.3238465, 0.3843137, 0, 1, 1,
0.6166773, -0.4660037, 2.27222, 0.3921569, 0, 1, 1,
0.6209968, 0.385245, 0.03816266, 0.3960784, 0, 1, 1,
0.6227491, 0.2235991, 1.928986, 0.4039216, 0, 1, 1,
0.6236904, -0.639741, 4.572777, 0.4117647, 0, 1, 1,
0.6250067, -0.3191997, 2.317487, 0.4156863, 0, 1, 1,
0.6297036, -0.232092, 0.6984825, 0.4235294, 0, 1, 1,
0.63006, -0.789633, 4.02869, 0.427451, 0, 1, 1,
0.6311492, 2.239307, -0.7373023, 0.4352941, 0, 1, 1,
0.6323367, -0.2215631, 1.0487, 0.4392157, 0, 1, 1,
0.6337562, 0.7362799, 2.414376, 0.4470588, 0, 1, 1,
0.6343285, -0.9893796, 2.454303, 0.4509804, 0, 1, 1,
0.6345877, -1.994342, 4.101457, 0.4588235, 0, 1, 1,
0.6360822, -0.2360475, 1.02065, 0.4627451, 0, 1, 1,
0.6376079, 0.291064, 0.4135896, 0.4705882, 0, 1, 1,
0.6413345, -0.1528793, 1.467596, 0.4745098, 0, 1, 1,
0.6445889, 0.5742026, 0.5041354, 0.4823529, 0, 1, 1,
0.6501275, -0.07916009, 1.573856, 0.4862745, 0, 1, 1,
0.6506169, 0.7146053, 3.013361, 0.4941176, 0, 1, 1,
0.6514292, -0.5956096, 2.525387, 0.5019608, 0, 1, 1,
0.6524562, 1.726442, 3.230663, 0.5058824, 0, 1, 1,
0.6538241, 0.7535188, 1.9858, 0.5137255, 0, 1, 1,
0.655865, -1.151534, 3.780147, 0.5176471, 0, 1, 1,
0.6560115, -1.134882, 1.911554, 0.5254902, 0, 1, 1,
0.6563471, 0.5438927, 0.7190836, 0.5294118, 0, 1, 1,
0.6615847, 0.1459609, 1.017987, 0.5372549, 0, 1, 1,
0.6621899, 0.144627, -0.106474, 0.5411765, 0, 1, 1,
0.6692944, 0.06753181, 4.017353, 0.5490196, 0, 1, 1,
0.6765409, 1.332776, -1.369899, 0.5529412, 0, 1, 1,
0.6833355, 1.865921, -0.08999584, 0.5607843, 0, 1, 1,
0.685705, 1.00762, 0.6553597, 0.5647059, 0, 1, 1,
0.6900372, 0.5110235, 1.072192, 0.572549, 0, 1, 1,
0.690119, 1.031803, 1.469011, 0.5764706, 0, 1, 1,
0.6915329, 0.8755033, 0.8557894, 0.5843138, 0, 1, 1,
0.6963274, 0.2631777, 2.526762, 0.5882353, 0, 1, 1,
0.6979435, 0.3774758, 1.87855, 0.5960785, 0, 1, 1,
0.7009083, 1.472816, -0.2039042, 0.6039216, 0, 1, 1,
0.7141794, 1.251316, 1.421259, 0.6078432, 0, 1, 1,
0.7147129, 0.01059012, 1.988321, 0.6156863, 0, 1, 1,
0.7192068, 0.6281321, -0.1227604, 0.6196079, 0, 1, 1,
0.7211989, 0.02211377, 1.319122, 0.627451, 0, 1, 1,
0.7216431, -0.6534642, 2.822893, 0.6313726, 0, 1, 1,
0.724978, 0.2017309, 0.9238049, 0.6392157, 0, 1, 1,
0.7300171, -0.3525211, 1.624735, 0.6431373, 0, 1, 1,
0.732359, 0.6111243, -0.3388886, 0.6509804, 0, 1, 1,
0.7324661, 0.76376, -0.5513718, 0.654902, 0, 1, 1,
0.7353632, 1.325591, -0.4909524, 0.6627451, 0, 1, 1,
0.7388242, -2.508346, 3.342378, 0.6666667, 0, 1, 1,
0.7407383, -1.122737, 3.41929, 0.6745098, 0, 1, 1,
0.7430563, -0.2255865, 1.086102, 0.6784314, 0, 1, 1,
0.7439137, -0.5053674, -0.377187, 0.6862745, 0, 1, 1,
0.7458292, 0.7787491, 1.072804, 0.6901961, 0, 1, 1,
0.7555036, 0.7544998, 0.1897509, 0.6980392, 0, 1, 1,
0.7582654, -0.7196426, 1.969687, 0.7058824, 0, 1, 1,
0.7610085, 1.065923, 0.8904194, 0.7098039, 0, 1, 1,
0.7615777, -0.9030017, 3.821736, 0.7176471, 0, 1, 1,
0.7658132, -0.9816345, 2.072841, 0.7215686, 0, 1, 1,
0.7659574, -0.9883657, 1.229697, 0.7294118, 0, 1, 1,
0.7708557, 2.088565, 0.629391, 0.7333333, 0, 1, 1,
0.7718221, 0.09459752, 0.6737189, 0.7411765, 0, 1, 1,
0.7718486, -0.1704659, 3.366537, 0.7450981, 0, 1, 1,
0.7725475, 0.6340187, 2.168085, 0.7529412, 0, 1, 1,
0.775308, 1.549013, 0.6269827, 0.7568628, 0, 1, 1,
0.7777489, 1.27059, 0.7989145, 0.7647059, 0, 1, 1,
0.7837081, 2.81708, 1.430881, 0.7686275, 0, 1, 1,
0.7869744, -1.088155, 1.127539, 0.7764706, 0, 1, 1,
0.793461, -0.8893464, 1.644519, 0.7803922, 0, 1, 1,
0.7937406, 1.14102, 2.664826, 0.7882353, 0, 1, 1,
0.7969997, 1.373161, -0.1176448, 0.7921569, 0, 1, 1,
0.8009871, -0.1934961, 1.91168, 0.8, 0, 1, 1,
0.8115941, -0.7116783, 3.034314, 0.8078431, 0, 1, 1,
0.8170536, -0.7947254, 1.78925, 0.8117647, 0, 1, 1,
0.8282866, -0.1725633, 1.57558, 0.8196079, 0, 1, 1,
0.8305398, 2.112, 0.5999467, 0.8235294, 0, 1, 1,
0.8414423, -0.8054293, 1.295113, 0.8313726, 0, 1, 1,
0.8537083, 1.138146, 1.486977, 0.8352941, 0, 1, 1,
0.8578253, 0.01251075, 0.7689416, 0.8431373, 0, 1, 1,
0.859103, 0.5694084, 0.986861, 0.8470588, 0, 1, 1,
0.8605953, 0.1866484, 0.872305, 0.854902, 0, 1, 1,
0.8637975, 0.8140737, 1.25294, 0.8588235, 0, 1, 1,
0.8677331, -1.47146, 3.183957, 0.8666667, 0, 1, 1,
0.8765538, -0.6455773, 2.919467, 0.8705882, 0, 1, 1,
0.8821644, -0.7320042, 3.040281, 0.8784314, 0, 1, 1,
0.8842347, 0.5071815, 0.806586, 0.8823529, 0, 1, 1,
0.8863408, -0.1399442, 2.338749, 0.8901961, 0, 1, 1,
0.8863762, -0.683854, 0.9344093, 0.8941177, 0, 1, 1,
0.8925115, -1.283401, 2.648687, 0.9019608, 0, 1, 1,
0.8987514, 0.004304079, 1.402979, 0.9098039, 0, 1, 1,
0.8995482, -0.2414895, 1.056418, 0.9137255, 0, 1, 1,
0.9005085, -0.5816786, 2.673744, 0.9215686, 0, 1, 1,
0.9007125, 0.1400474, 1.692013, 0.9254902, 0, 1, 1,
0.9048256, -2.539541, 3.46645, 0.9333333, 0, 1, 1,
0.9049891, 0.7209908, 2.186085, 0.9372549, 0, 1, 1,
0.9063689, 0.3400576, 0.9888732, 0.945098, 0, 1, 1,
0.906873, -0.2273878, 1.565795, 0.9490196, 0, 1, 1,
0.9146715, -0.4896881, 1.967913, 0.9568627, 0, 1, 1,
0.915746, -1.397013, 2.951997, 0.9607843, 0, 1, 1,
0.916591, 1.380605, 0.03796679, 0.9686275, 0, 1, 1,
0.9193026, -1.040163, 0.7828668, 0.972549, 0, 1, 1,
0.9201733, -1.420857, 0.8632984, 0.9803922, 0, 1, 1,
0.9219841, 0.8051375, -0.09063119, 0.9843137, 0, 1, 1,
0.9274483, 1.317527, 0.5375286, 0.9921569, 0, 1, 1,
0.9288105, 2.10956, 0.2966694, 0.9960784, 0, 1, 1,
0.9362414, -0.2250143, 2.962158, 1, 0, 0.9960784, 1,
0.9449995, -0.02801773, 0.9171932, 1, 0, 0.9882353, 1,
0.9455272, 0.528066, 2.341952, 1, 0, 0.9843137, 1,
0.9468187, 0.03379442, 1.778462, 1, 0, 0.9764706, 1,
0.9538608, 0.05643076, 1.015126, 1, 0, 0.972549, 1,
0.9653443, 0.5038534, 1.89893, 1, 0, 0.9647059, 1,
0.9685052, 1.40196, 1.026748, 1, 0, 0.9607843, 1,
0.9700202, 0.55022, 0.9169165, 1, 0, 0.9529412, 1,
0.9758315, -1.35865, 1.780706, 1, 0, 0.9490196, 1,
0.9807449, 0.3977296, 1.10804, 1, 0, 0.9411765, 1,
0.9860961, -0.08226899, 1.466515, 1, 0, 0.9372549, 1,
1.009163, 0.7223435, 0.3198669, 1, 0, 0.9294118, 1,
1.017164, 0.8703514, 2.175858, 1, 0, 0.9254902, 1,
1.019782, -0.8222057, 1.098205, 1, 0, 0.9176471, 1,
1.024794, -0.5350854, 1.864509, 1, 0, 0.9137255, 1,
1.028105, 0.03221091, 2.102503, 1, 0, 0.9058824, 1,
1.036158, -0.1677818, 1.464919, 1, 0, 0.9019608, 1,
1.045738, 1.774824, -0.2170881, 1, 0, 0.8941177, 1,
1.048841, -0.720525, 0.5973856, 1, 0, 0.8862745, 1,
1.049138, -0.6011918, 2.785558, 1, 0, 0.8823529, 1,
1.050247, -1.37693, 2.745249, 1, 0, 0.8745098, 1,
1.051829, 0.1123471, 1.001826, 1, 0, 0.8705882, 1,
1.05214, 0.6439877, 1.039207, 1, 0, 0.8627451, 1,
1.054137, 1.018556, 0.4460923, 1, 0, 0.8588235, 1,
1.057084, 0.3314403, 0.5142907, 1, 0, 0.8509804, 1,
1.058455, -0.04637076, 1.440914, 1, 0, 0.8470588, 1,
1.064684, -0.2731324, 3.183281, 1, 0, 0.8392157, 1,
1.068902, -1.727874, 3.710933, 1, 0, 0.8352941, 1,
1.070456, 2.678333, 0.7401587, 1, 0, 0.827451, 1,
1.072388, -0.8717101, 2.830474, 1, 0, 0.8235294, 1,
1.079543, 0.3866515, 2.52974, 1, 0, 0.8156863, 1,
1.080427, -0.8086394, 1.847402, 1, 0, 0.8117647, 1,
1.082457, 0.2650879, 2.412418, 1, 0, 0.8039216, 1,
1.083314, 0.7903789, 0.2183907, 1, 0, 0.7960784, 1,
1.085396, -1.199924, 3.317819, 1, 0, 0.7921569, 1,
1.08674, 0.4458022, 1.296478, 1, 0, 0.7843137, 1,
1.099622, -0.01045674, 0.1396182, 1, 0, 0.7803922, 1,
1.103419, 0.6715225, 2.30678, 1, 0, 0.772549, 1,
1.108761, -1.965531, 3.979827, 1, 0, 0.7686275, 1,
1.109788, -0.1587142, 2.991303, 1, 0, 0.7607843, 1,
1.120712, 0.8132908, 1.588871, 1, 0, 0.7568628, 1,
1.1248, 1.057076, 1.29448, 1, 0, 0.7490196, 1,
1.126196, -2.266597, 1.416789, 1, 0, 0.7450981, 1,
1.128111, 0.1834496, 1.149391, 1, 0, 0.7372549, 1,
1.128169, 0.541707, 1.239131, 1, 0, 0.7333333, 1,
1.128708, 2.293621, -0.4993884, 1, 0, 0.7254902, 1,
1.132005, -2.792222, -0.2534342, 1, 0, 0.7215686, 1,
1.13369, 0.9171358, 1.941228, 1, 0, 0.7137255, 1,
1.137071, 0.9898884, -0.2173152, 1, 0, 0.7098039, 1,
1.141437, 0.1481106, 0.6345741, 1, 0, 0.7019608, 1,
1.145365, -1.365153, 3.71028, 1, 0, 0.6941177, 1,
1.148989, 0.1664346, 0.3986182, 1, 0, 0.6901961, 1,
1.159558, 0.3658752, 0.5525423, 1, 0, 0.682353, 1,
1.175787, 1.427443, 1.720706, 1, 0, 0.6784314, 1,
1.189368, -1.113485, 2.871278, 1, 0, 0.6705883, 1,
1.194257, 0.4592908, 1.235789, 1, 0, 0.6666667, 1,
1.202168, -0.5774241, 1.805347, 1, 0, 0.6588235, 1,
1.20985, -1.062447, 3.433763, 1, 0, 0.654902, 1,
1.212467, 1.118702, 0.1216105, 1, 0, 0.6470588, 1,
1.225711, -3.113241, 2.127076, 1, 0, 0.6431373, 1,
1.228469, -0.0403455, 1.073766, 1, 0, 0.6352941, 1,
1.229695, -0.6182701, 2.131052, 1, 0, 0.6313726, 1,
1.238989, -1.235219, 1.829288, 1, 0, 0.6235294, 1,
1.243369, 1.889578, -0.2804379, 1, 0, 0.6196079, 1,
1.248978, 1.465827, 2.375282, 1, 0, 0.6117647, 1,
1.250304, 0.6290758, 1.699779, 1, 0, 0.6078432, 1,
1.256556, 0.6029229, 0.9257075, 1, 0, 0.6, 1,
1.267708, -1.024775, 2.410819, 1, 0, 0.5921569, 1,
1.292264, 1.630325, 0.7842643, 1, 0, 0.5882353, 1,
1.292581, 0.493392, 2.297258, 1, 0, 0.5803922, 1,
1.296919, -0.5449181, 2.751139, 1, 0, 0.5764706, 1,
1.299478, -0.4572525, -0.08902863, 1, 0, 0.5686275, 1,
1.301108, 0.04587482, 0.3181304, 1, 0, 0.5647059, 1,
1.301114, 0.6286047, 1.608297, 1, 0, 0.5568628, 1,
1.308448, 0.3883801, 0.9231622, 1, 0, 0.5529412, 1,
1.320712, 0.09944649, 3.479962, 1, 0, 0.5450981, 1,
1.323214, 0.5002187, -0.2083387, 1, 0, 0.5411765, 1,
1.327249, -0.1134958, 3.162797, 1, 0, 0.5333334, 1,
1.331744, -0.4454104, 2.829496, 1, 0, 0.5294118, 1,
1.344614, 1.47404, 0.1297842, 1, 0, 0.5215687, 1,
1.345625, 2.530889, -1.054096, 1, 0, 0.5176471, 1,
1.345829, -0.1745047, 2.770344, 1, 0, 0.509804, 1,
1.346844, -0.2043592, 0.7736501, 1, 0, 0.5058824, 1,
1.34766, -0.7144859, 1.28697, 1, 0, 0.4980392, 1,
1.347787, 0.5822504, 0.7453409, 1, 0, 0.4901961, 1,
1.357046, 0.2985384, 0.5892762, 1, 0, 0.4862745, 1,
1.360254, 0.2947918, 1.337471, 1, 0, 0.4784314, 1,
1.364647, 0.147937, 1.189197, 1, 0, 0.4745098, 1,
1.364916, -1.087364, 1.850813, 1, 0, 0.4666667, 1,
1.365825, -0.3676142, 1.290247, 1, 0, 0.4627451, 1,
1.367239, 0.4598271, 0.2477677, 1, 0, 0.454902, 1,
1.368834, -1.028764, 1.758515, 1, 0, 0.4509804, 1,
1.384373, 0.1974686, 1.196321, 1, 0, 0.4431373, 1,
1.389613, -1.688479, 0.5732033, 1, 0, 0.4392157, 1,
1.391827, 1.938533, 2.336958, 1, 0, 0.4313726, 1,
1.392504, 0.1771744, -0.364437, 1, 0, 0.427451, 1,
1.396876, 0.2621717, 1.092603, 1, 0, 0.4196078, 1,
1.405182, 0.825831, 0.4911935, 1, 0, 0.4156863, 1,
1.409333, -0.3474089, 2.23969, 1, 0, 0.4078431, 1,
1.413651, 1.220675, -0.5933034, 1, 0, 0.4039216, 1,
1.41441, -0.0422162, 1.48111, 1, 0, 0.3960784, 1,
1.42303, 1.28993, -0.04683977, 1, 0, 0.3882353, 1,
1.42658, -0.7630238, 1.172515, 1, 0, 0.3843137, 1,
1.43595, 0.3015465, -0.2341433, 1, 0, 0.3764706, 1,
1.449415, 1.064208, 1.649904, 1, 0, 0.372549, 1,
1.473626, -0.1066976, 1.670682, 1, 0, 0.3647059, 1,
1.479782, -0.3533362, 1.313531, 1, 0, 0.3607843, 1,
1.48165, -1.299431, 1.61887, 1, 0, 0.3529412, 1,
1.502116, -0.9010018, 1.786805, 1, 0, 0.3490196, 1,
1.502797, 0.3590466, 2.864372, 1, 0, 0.3411765, 1,
1.507568, -0.1194899, 0.3034092, 1, 0, 0.3372549, 1,
1.508827, 0.9454728, 1.710394, 1, 0, 0.3294118, 1,
1.509997, 0.6436499, -0.6343276, 1, 0, 0.3254902, 1,
1.510332, -1.003182, 2.236684, 1, 0, 0.3176471, 1,
1.54204, 0.9821608, 1.510515, 1, 0, 0.3137255, 1,
1.54549, -0.737846, 2.426329, 1, 0, 0.3058824, 1,
1.546955, 1.689165, 2.374041, 1, 0, 0.2980392, 1,
1.562705, -0.5780833, 2.146565, 1, 0, 0.2941177, 1,
1.566751, 0.3424592, 1.913347, 1, 0, 0.2862745, 1,
1.58716, -0.2286708, 1.062199, 1, 0, 0.282353, 1,
1.602363, -1.685656, 2.394017, 1, 0, 0.2745098, 1,
1.610547, 0.2417768, 2.376286, 1, 0, 0.2705882, 1,
1.618233, -1.86092, 3.320008, 1, 0, 0.2627451, 1,
1.621563, -1.828455, 1.920175, 1, 0, 0.2588235, 1,
1.635471, -1.223544, 1.899477, 1, 0, 0.2509804, 1,
1.644302, -1.477037, 1.763929, 1, 0, 0.2470588, 1,
1.665674, 1.472682, 0.8590075, 1, 0, 0.2392157, 1,
1.692342, 0.5483345, 2.147964, 1, 0, 0.2352941, 1,
1.700053, 0.5806629, 2.116669, 1, 0, 0.227451, 1,
1.702766, 1.345544, 3.130831, 1, 0, 0.2235294, 1,
1.744286, 0.6560421, 1.509415, 1, 0, 0.2156863, 1,
1.747261, 1.07984, 2.403119, 1, 0, 0.2117647, 1,
1.747542, -0.6917356, 3.09055, 1, 0, 0.2039216, 1,
1.748709, 0.1772059, 2.423354, 1, 0, 0.1960784, 1,
1.753458, 0.03202902, 1.813434, 1, 0, 0.1921569, 1,
1.754656, 0.540666, 1.72484, 1, 0, 0.1843137, 1,
1.755299, 0.2150651, 1.682394, 1, 0, 0.1803922, 1,
1.762077, 0.2321461, 0.8752227, 1, 0, 0.172549, 1,
1.795608, -1.33905, 1.219628, 1, 0, 0.1686275, 1,
1.796197, -0.4642992, 0.8305868, 1, 0, 0.1607843, 1,
1.824902, 1.354396, -1.050553, 1, 0, 0.1568628, 1,
1.842421, 0.2941549, -0.4609272, 1, 0, 0.1490196, 1,
1.852382, -0.9843482, 2.981599, 1, 0, 0.145098, 1,
1.875119, -0.3592235, 2.308228, 1, 0, 0.1372549, 1,
1.914759, 1.517487, -1.741346, 1, 0, 0.1333333, 1,
1.923295, -0.4412573, 0.7821401, 1, 0, 0.1254902, 1,
1.943086, -0.5256903, 3.085223, 1, 0, 0.1215686, 1,
1.99056, 0.2185929, 1.459594, 1, 0, 0.1137255, 1,
2.011736, -0.3917021, 2.2746, 1, 0, 0.1098039, 1,
2.030786, -0.2281993, 1.065102, 1, 0, 0.1019608, 1,
2.049067, -0.472595, 2.032653, 1, 0, 0.09411765, 1,
2.050368, -0.3389719, 1.566113, 1, 0, 0.09019608, 1,
2.131356, 2.035942, 1.146257, 1, 0, 0.08235294, 1,
2.142934, 0.3156315, 0.9977422, 1, 0, 0.07843138, 1,
2.146455, -1.044663, 3.004872, 1, 0, 0.07058824, 1,
2.158373, -1.021384, 1.822213, 1, 0, 0.06666667, 1,
2.181052, 1.050738, 2.235354, 1, 0, 0.05882353, 1,
2.281317, 1.14634, 1.145867, 1, 0, 0.05490196, 1,
2.315509, 0.07161608, 2.104047, 1, 0, 0.04705882, 1,
2.449494, 0.6581845, 2.818229, 1, 0, 0.04313726, 1,
2.486217, -2.320759, 2.540165, 1, 0, 0.03529412, 1,
2.497059, -0.8174602, 2.35268, 1, 0, 0.03137255, 1,
2.514272, 0.2026626, 1.60012, 1, 0, 0.02352941, 1,
2.571376, 0.3906139, 1.415714, 1, 0, 0.01960784, 1,
2.637141, 0.9478475, 2.333616, 1, 0, 0.01176471, 1,
3.013213, -1.301695, 1.985408, 1, 0, 0.007843138, 1
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
0.02072203, -4.197755, -7.048231, 0, -0.5, 0.5, 0.5,
0.02072203, -4.197755, -7.048231, 1, -0.5, 0.5, 0.5,
0.02072203, -4.197755, -7.048231, 1, 1.5, 0.5, 0.5,
0.02072203, -4.197755, -7.048231, 0, 1.5, 0.5, 0.5
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
-3.986223, -0.0273279, -7.048231, 0, -0.5, 0.5, 0.5,
-3.986223, -0.0273279, -7.048231, 1, -0.5, 0.5, 0.5,
-3.986223, -0.0273279, -7.048231, 1, 1.5, 0.5, 0.5,
-3.986223, -0.0273279, -7.048231, 0, 1.5, 0.5, 0.5
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
-3.986223, -4.197755, 0.09536314, 0, -0.5, 0.5, 0.5,
-3.986223, -4.197755, 0.09536314, 1, -0.5, 0.5, 0.5,
-3.986223, -4.197755, 0.09536314, 1, 1.5, 0.5, 0.5,
-3.986223, -4.197755, 0.09536314, 0, 1.5, 0.5, 0.5
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
-2, -3.235349, -5.39971,
3, -3.235349, -5.39971,
-2, -3.235349, -5.39971,
-2, -3.39575, -5.674463,
-1, -3.235349, -5.39971,
-1, -3.39575, -5.674463,
0, -3.235349, -5.39971,
0, -3.39575, -5.674463,
1, -3.235349, -5.39971,
1, -3.39575, -5.674463,
2, -3.235349, -5.39971,
2, -3.39575, -5.674463,
3, -3.235349, -5.39971,
3, -3.39575, -5.674463
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
-2, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
-2, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
-2, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
-2, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5,
-1, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
-1, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
-1, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
-1, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5,
0, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
0, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
0, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
0, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5,
1, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
1, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
1, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
1, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5,
2, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
2, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
2, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
2, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5,
3, -3.716552, -6.22397, 0, -0.5, 0.5, 0.5,
3, -3.716552, -6.22397, 1, -0.5, 0.5, 0.5,
3, -3.716552, -6.22397, 1, 1.5, 0.5, 0.5,
3, -3.716552, -6.22397, 0, 1.5, 0.5, 0.5
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
-3.061543, -3, -5.39971,
-3.061543, 3, -5.39971,
-3.061543, -3, -5.39971,
-3.215657, -3, -5.674463,
-3.061543, -2, -5.39971,
-3.215657, -2, -5.674463,
-3.061543, -1, -5.39971,
-3.215657, -1, -5.674463,
-3.061543, 0, -5.39971,
-3.215657, 0, -5.674463,
-3.061543, 1, -5.39971,
-3.215657, 1, -5.674463,
-3.061543, 2, -5.39971,
-3.215657, 2, -5.674463,
-3.061543, 3, -5.39971,
-3.215657, 3, -5.674463
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
-3.523883, -3, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, -3, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, -3, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, -3, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, -2, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, -2, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, -2, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, -2, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, -1, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, -1, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, -1, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, -1, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, 0, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, 0, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, 0, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, 0, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, 1, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, 1, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, 1, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, 1, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, 2, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, 2, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, 2, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, 2, -6.22397, 0, 1.5, 0.5, 0.5,
-3.523883, 3, -6.22397, 0, -0.5, 0.5, 0.5,
-3.523883, 3, -6.22397, 1, -0.5, 0.5, 0.5,
-3.523883, 3, -6.22397, 1, 1.5, 0.5, 0.5,
-3.523883, 3, -6.22397, 0, 1.5, 0.5, 0.5
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
-3.061543, -3.235349, -4,
-3.061543, -3.235349, 4,
-3.061543, -3.235349, -4,
-3.215657, -3.39575, -4,
-3.061543, -3.235349, -2,
-3.215657, -3.39575, -2,
-3.061543, -3.235349, 0,
-3.215657, -3.39575, 0,
-3.061543, -3.235349, 2,
-3.215657, -3.39575, 2,
-3.061543, -3.235349, 4,
-3.215657, -3.39575, 4
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
-3.523883, -3.716552, -4, 0, -0.5, 0.5, 0.5,
-3.523883, -3.716552, -4, 1, -0.5, 0.5, 0.5,
-3.523883, -3.716552, -4, 1, 1.5, 0.5, 0.5,
-3.523883, -3.716552, -4, 0, 1.5, 0.5, 0.5,
-3.523883, -3.716552, -2, 0, -0.5, 0.5, 0.5,
-3.523883, -3.716552, -2, 1, -0.5, 0.5, 0.5,
-3.523883, -3.716552, -2, 1, 1.5, 0.5, 0.5,
-3.523883, -3.716552, -2, 0, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 0, 0, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 0, 1, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 0, 1, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 0, 0, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 2, 0, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 2, 1, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 2, 1, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 2, 0, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 4, 0, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 4, 1, -0.5, 0.5, 0.5,
-3.523883, -3.716552, 4, 1, 1.5, 0.5, 0.5,
-3.523883, -3.716552, 4, 0, 1.5, 0.5, 0.5
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
-3.061543, -3.235349, -5.39971,
-3.061543, 3.180693, -5.39971,
-3.061543, -3.235349, 5.590436,
-3.061543, 3.180693, 5.590436,
-3.061543, -3.235349, -5.39971,
-3.061543, -3.235349, 5.590436,
-3.061543, 3.180693, -5.39971,
-3.061543, 3.180693, 5.590436,
-3.061543, -3.235349, -5.39971,
3.102987, -3.235349, -5.39971,
-3.061543, -3.235349, 5.590436,
3.102987, -3.235349, 5.590436,
-3.061543, 3.180693, -5.39971,
3.102987, 3.180693, -5.39971,
-3.061543, 3.180693, 5.590436,
3.102987, 3.180693, 5.590436,
3.102987, -3.235349, -5.39971,
3.102987, 3.180693, -5.39971,
3.102987, -3.235349, 5.590436,
3.102987, 3.180693, 5.590436,
3.102987, -3.235349, -5.39971,
3.102987, -3.235349, 5.590436,
3.102987, 3.180693, -5.39971,
3.102987, 3.180693, 5.590436
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
var radius = 7.550688;
var distance = 33.59387;
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
mvMatrix.translate( -0.02072203, 0.0273279, -0.09536314 );
mvMatrix.scale( 1.324343, 1.272428, 0.742843 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59387);
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
Vinclozolin<-read.table("Vinclozolin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Vinclozolin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
```

```r
y<-Vinclozolin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
```

```r
z<-Vinclozolin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vinclozolin' not found
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
-2.971769, -1.665445, -1.164983, 0, 0, 1, 1, 1,
-2.71933, -0.5693981, -1.692149, 1, 0, 0, 1, 1,
-2.591898, 1.009652, -0.2710752, 1, 0, 0, 1, 1,
-2.577674, -1.079831, -1.520329, 1, 0, 0, 1, 1,
-2.403959, -2.291527, -0.9697587, 1, 0, 0, 1, 1,
-2.36824, -0.8892434, -1.839367, 1, 0, 0, 1, 1,
-2.351598, -0.05667754, -2.33541, 0, 0, 0, 1, 1,
-2.335397, -0.6531909, -2.719504, 0, 0, 0, 1, 1,
-2.307029, 1.0721, -1.699888, 0, 0, 0, 1, 1,
-2.285063, 0.3203976, -1.954253, 0, 0, 0, 1, 1,
-2.266946, -1.081762, -2.079301, 0, 0, 0, 1, 1,
-2.188382, 0.75217, -1.68235, 0, 0, 0, 1, 1,
-2.18175, -0.02343246, -0.09256177, 0, 0, 0, 1, 1,
-2.17317, 0.4263735, -1.772389, 1, 1, 1, 1, 1,
-2.15381, 0.1890736, -2.448672, 1, 1, 1, 1, 1,
-2.137402, 0.241891, -0.4250992, 1, 1, 1, 1, 1,
-2.060771, 0.05483992, -1.912886, 1, 1, 1, 1, 1,
-2.053319, 1.253526, -2.69291, 1, 1, 1, 1, 1,
-2.02754, 0.5785684, -0.681327, 1, 1, 1, 1, 1,
-2.021522, 0.6884875, -0.8903363, 1, 1, 1, 1, 1,
-1.990979, 1.436187, -0.3199212, 1, 1, 1, 1, 1,
-1.984435, -0.850765, -2.959673, 1, 1, 1, 1, 1,
-1.961191, -0.1755042, -0.23391, 1, 1, 1, 1, 1,
-1.949144, 1.204669, 0.2634557, 1, 1, 1, 1, 1,
-1.946279, 0.1401882, -1.221261, 1, 1, 1, 1, 1,
-1.938195, 0.5144285, -0.1464397, 1, 1, 1, 1, 1,
-1.927583, -1.086053, -2.961828, 1, 1, 1, 1, 1,
-1.914752, 0.08295844, -0.316588, 1, 1, 1, 1, 1,
-1.899268, -1.133118, -1.934648, 0, 0, 1, 1, 1,
-1.884155, 0.4860685, -0.8083607, 1, 0, 0, 1, 1,
-1.8595, 1.336607, -1.751479, 1, 0, 0, 1, 1,
-1.839728, -0.3392161, -1.136326, 1, 0, 0, 1, 1,
-1.827833, 0.4300306, -0.8827888, 1, 0, 0, 1, 1,
-1.784989, -0.3310745, -3.93874, 1, 0, 0, 1, 1,
-1.784855, -1.051739, -1.941558, 0, 0, 0, 1, 1,
-1.756348, -1.660157, -2.011233, 0, 0, 0, 1, 1,
-1.742055, 0.1774946, -1.606843, 0, 0, 0, 1, 1,
-1.736104, 0.9132939, 0.09605719, 0, 0, 0, 1, 1,
-1.722447, -1.203044, -3.926977, 0, 0, 0, 1, 1,
-1.696544, 1.25385, -0.6630045, 0, 0, 0, 1, 1,
-1.691535, 1.309067, 0.5552328, 0, 0, 0, 1, 1,
-1.676053, -1.175828, -1.116298, 1, 1, 1, 1, 1,
-1.663549, -0.3317659, -1.368363, 1, 1, 1, 1, 1,
-1.646289, 0.09525391, -1.243903, 1, 1, 1, 1, 1,
-1.645033, 1.52371, -0.07385015, 1, 1, 1, 1, 1,
-1.643157, 0.3100939, -0.09583326, 1, 1, 1, 1, 1,
-1.642424, 1.046525, -1.557576, 1, 1, 1, 1, 1,
-1.637843, -1.059397, -2.29402, 1, 1, 1, 1, 1,
-1.637364, 0.6743476, -0.8879147, 1, 1, 1, 1, 1,
-1.634114, 0.4758636, -0.7707671, 1, 1, 1, 1, 1,
-1.631297, 1.815246, -1.523971, 1, 1, 1, 1, 1,
-1.605503, 0.1032494, -1.285021, 1, 1, 1, 1, 1,
-1.595258, 0.2552582, -0.9641935, 1, 1, 1, 1, 1,
-1.56962, -0.7536311, -2.422815, 1, 1, 1, 1, 1,
-1.55914, 0.4073571, -0.2204934, 1, 1, 1, 1, 1,
-1.552915, -0.07369801, -2.010327, 1, 1, 1, 1, 1,
-1.55138, -0.7253498, -2.447663, 0, 0, 1, 1, 1,
-1.547223, 0.271898, -1.023016, 1, 0, 0, 1, 1,
-1.537382, 0.2918252, -1.498779, 1, 0, 0, 1, 1,
-1.53088, -0.788765, -2.309685, 1, 0, 0, 1, 1,
-1.524048, -0.5897728, -2.013552, 1, 0, 0, 1, 1,
-1.520613, -1.265433, -1.228131, 1, 0, 0, 1, 1,
-1.52003, 0.4544918, -2.510324, 0, 0, 0, 1, 1,
-1.506624, 1.40505, -1.951993, 0, 0, 0, 1, 1,
-1.504321, -0.4916027, -4.234939, 0, 0, 0, 1, 1,
-1.48423, 0.9037533, 0.743512, 0, 0, 0, 1, 1,
-1.483884, 1.022768, -1.420035, 0, 0, 0, 1, 1,
-1.481418, -0.03712652, -2.702205, 0, 0, 0, 1, 1,
-1.463063, 0.6747412, -3.169187, 0, 0, 0, 1, 1,
-1.447482, 0.437402, -1.230706, 1, 1, 1, 1, 1,
-1.444194, 0.06132374, -3.164116, 1, 1, 1, 1, 1,
-1.443162, -2.190938, -3.51597, 1, 1, 1, 1, 1,
-1.441307, -0.1094154, -2.688032, 1, 1, 1, 1, 1,
-1.435478, 0.6893659, -1.98134, 1, 1, 1, 1, 1,
-1.431008, 0.2270874, -2.018436, 1, 1, 1, 1, 1,
-1.421306, -0.1765707, -2.949394, 1, 1, 1, 1, 1,
-1.411646, -0.3438718, -2.983756, 1, 1, 1, 1, 1,
-1.411524, 0.03901534, -1.972787, 1, 1, 1, 1, 1,
-1.40691, -0.6967927, -2.929788, 1, 1, 1, 1, 1,
-1.405709, -1.504714, -3.03073, 1, 1, 1, 1, 1,
-1.401354, 0.5812212, -1.798811, 1, 1, 1, 1, 1,
-1.389147, -0.4080867, -1.960045, 1, 1, 1, 1, 1,
-1.384706, 3.087256, -0.8905839, 1, 1, 1, 1, 1,
-1.384338, 0.2003688, -0.4318656, 1, 1, 1, 1, 1,
-1.371404, -0.4735915, -2.235903, 0, 0, 1, 1, 1,
-1.367411, 0.9264227, -1.614206, 1, 0, 0, 1, 1,
-1.359265, -1.114208, -2.523554, 1, 0, 0, 1, 1,
-1.358716, -1.003671, -3.786245, 1, 0, 0, 1, 1,
-1.357497, -1.284171, -3.582656, 1, 0, 0, 1, 1,
-1.355021, -0.2548214, -0.2350545, 1, 0, 0, 1, 1,
-1.350721, -0.1364449, -0.07915912, 0, 0, 0, 1, 1,
-1.347984, 2.526026, -1.739341, 0, 0, 0, 1, 1,
-1.342961, 0.9232414, -1.82781, 0, 0, 0, 1, 1,
-1.342796, -1.485621, -2.219618, 0, 0, 0, 1, 1,
-1.340055, 0.5898468, -2.295779, 0, 0, 0, 1, 1,
-1.329743, 1.154524, 0.3706723, 0, 0, 0, 1, 1,
-1.303959, -1.14895, -3.789867, 0, 0, 0, 1, 1,
-1.303788, 0.07561313, -0.5960245, 1, 1, 1, 1, 1,
-1.297236, -0.03616245, -2.356753, 1, 1, 1, 1, 1,
-1.279147, -0.1505758, -1.535701, 1, 1, 1, 1, 1,
-1.277248, -0.6379833, -2.661332, 1, 1, 1, 1, 1,
-1.272905, -1.264983, -2.740843, 1, 1, 1, 1, 1,
-1.272507, -0.8848115, -1.608865, 1, 1, 1, 1, 1,
-1.269704, 0.4510752, -1.647607, 1, 1, 1, 1, 1,
-1.266048, -0.1849772, -0.4994425, 1, 1, 1, 1, 1,
-1.265009, 1.614514, -2.126284, 1, 1, 1, 1, 1,
-1.260089, 0.3053228, -0.2232078, 1, 1, 1, 1, 1,
-1.25912, 1.26083, -1.24711, 1, 1, 1, 1, 1,
-1.256913, -0.9228618, -1.815567, 1, 1, 1, 1, 1,
-1.251745, -0.2462335, -2.320604, 1, 1, 1, 1, 1,
-1.242565, 1.030389, -1.305473, 1, 1, 1, 1, 1,
-1.231614, -0.1878694, -1.374537, 1, 1, 1, 1, 1,
-1.225836, 0.7979844, -3.279552, 0, 0, 1, 1, 1,
-1.220112, 0.1736643, -3.391968, 1, 0, 0, 1, 1,
-1.215848, 0.7583157, -1.569988, 1, 0, 0, 1, 1,
-1.20691, 0.3112733, -1.846881, 1, 0, 0, 1, 1,
-1.206863, -0.2333361, -2.939816, 1, 0, 0, 1, 1,
-1.200821, 1.227507, -1.714843, 1, 0, 0, 1, 1,
-1.195477, 0.2475537, 0.4054049, 0, 0, 0, 1, 1,
-1.184788, 0.9766781, 0.5706217, 0, 0, 0, 1, 1,
-1.179467, -1.556966, -0.6526297, 0, 0, 0, 1, 1,
-1.178003, 1.7264, -0.6179809, 0, 0, 0, 1, 1,
-1.171304, -1.105178, -2.058904, 0, 0, 0, 1, 1,
-1.166964, -0.3833838, -1.28249, 0, 0, 0, 1, 1,
-1.154625, 0.1752656, -2.225785, 0, 0, 0, 1, 1,
-1.154584, 1.165214, -0.7297469, 1, 1, 1, 1, 1,
-1.144032, 1.505892, 0.763085, 1, 1, 1, 1, 1,
-1.14261, 0.7128581, -1.939003, 1, 1, 1, 1, 1,
-1.1365, 1.496575, 0.493813, 1, 1, 1, 1, 1,
-1.127678, -0.1339596, -0.9857349, 1, 1, 1, 1, 1,
-1.124507, 0.5517348, -1.251349, 1, 1, 1, 1, 1,
-1.122051, 0.1880098, -1.469731, 1, 1, 1, 1, 1,
-1.115899, -1.13835, -2.943018, 1, 1, 1, 1, 1,
-1.114881, 1.289124, -0.362446, 1, 1, 1, 1, 1,
-1.114066, -0.6334913, -1.763666, 1, 1, 1, 1, 1,
-1.098953, 0.4197351, -1.624714, 1, 1, 1, 1, 1,
-1.091796, 0.5387251, -1.726597, 1, 1, 1, 1, 1,
-1.090518, -1.046475, -3.58579, 1, 1, 1, 1, 1,
-1.083887, -0.2375881, -1.390945, 1, 1, 1, 1, 1,
-1.081198, 0.4215098, -1.973535, 1, 1, 1, 1, 1,
-1.075945, -1.220266, -0.9984903, 0, 0, 1, 1, 1,
-1.073438, 0.3083488, -1.971233, 1, 0, 0, 1, 1,
-1.056603, -0.6600219, -1.574291, 1, 0, 0, 1, 1,
-1.038277, -0.4613733, -2.600816, 1, 0, 0, 1, 1,
-1.031358, 0.8356544, -0.2110955, 1, 0, 0, 1, 1,
-1.030446, -0.6926856, -1.684998, 1, 0, 0, 1, 1,
-1.02989, -0.3191242, -3.214667, 0, 0, 0, 1, 1,
-1.015146, -0.1356079, -4.718759, 0, 0, 0, 1, 1,
-1.011402, -0.4842045, -1.742369, 0, 0, 0, 1, 1,
-1.003912, 0.3227643, 0.2594008, 0, 0, 0, 1, 1,
-1.002396, -1.023423, -1.439598, 0, 0, 0, 1, 1,
-1.001258, 0.4097675, -0.7072486, 0, 0, 0, 1, 1,
-0.9970721, 0.9399766, -2.819481, 0, 0, 0, 1, 1,
-0.9905627, 0.6216836, -3.009402, 1, 1, 1, 1, 1,
-0.9772635, 0.3696855, -1.86785, 1, 1, 1, 1, 1,
-0.9757726, 1.456554, -1.118672, 1, 1, 1, 1, 1,
-0.9641925, -1.903603, -2.967263, 1, 1, 1, 1, 1,
-0.9559183, 0.8416621, -1.36128, 1, 1, 1, 1, 1,
-0.954951, 0.003611882, -1.860425, 1, 1, 1, 1, 1,
-0.9512577, 0.08430342, -0.5673042, 1, 1, 1, 1, 1,
-0.9462402, -1.320326, -4.211583, 1, 1, 1, 1, 1,
-0.941532, -0.03058363, -3.124461, 1, 1, 1, 1, 1,
-0.9414963, 1.418605, 0.2212693, 1, 1, 1, 1, 1,
-0.9309886, -1.039648, -2.382276, 1, 1, 1, 1, 1,
-0.9309158, -1.06324, -4.275105, 1, 1, 1, 1, 1,
-0.9235629, -0.008852544, -2.081947, 1, 1, 1, 1, 1,
-0.9150103, -0.4027506, -1.321332, 1, 1, 1, 1, 1,
-0.9122563, 0.1334472, -2.245504, 1, 1, 1, 1, 1,
-0.9118676, 0.1818356, -2.227288, 0, 0, 1, 1, 1,
-0.908739, 0.506668, -1.118835, 1, 0, 0, 1, 1,
-0.9047157, -1.053411, -1.978156, 1, 0, 0, 1, 1,
-0.9009586, -0.3923846, -2.485717, 1, 0, 0, 1, 1,
-0.8907992, -0.418339, -2.145713, 1, 0, 0, 1, 1,
-0.8907743, 0.8459255, -1.170991, 1, 0, 0, 1, 1,
-0.8876056, -0.08258355, -1.154282, 0, 0, 0, 1, 1,
-0.8818424, 0.5693398, 0.1048025, 0, 0, 0, 1, 1,
-0.8795304, 0.6270344, -2.195647, 0, 0, 0, 1, 1,
-0.8779438, -1.232185, -1.927246, 0, 0, 0, 1, 1,
-0.8751634, -0.0180543, -2.648293, 0, 0, 0, 1, 1,
-0.8696696, 0.4400733, -0.8801998, 0, 0, 0, 1, 1,
-0.8690247, 0.8685022, -1.646223, 0, 0, 0, 1, 1,
-0.8639849, -0.4876318, -1.451534, 1, 1, 1, 1, 1,
-0.8592267, -1.156696, -2.018393, 1, 1, 1, 1, 1,
-0.8589113, 0.6839417, -1.955544, 1, 1, 1, 1, 1,
-0.8554157, 1.000559, -0.07546578, 1, 1, 1, 1, 1,
-0.8547437, -0.68737, -1.930892, 1, 1, 1, 1, 1,
-0.8531132, 1.722209, -0.1734924, 1, 1, 1, 1, 1,
-0.8517333, 0.2681746, -0.7144492, 1, 1, 1, 1, 1,
-0.8439423, -1.227221, -4.429399, 1, 1, 1, 1, 1,
-0.841553, 0.2117999, -0.9145016, 1, 1, 1, 1, 1,
-0.8411581, -0.3530307, -3.154606, 1, 1, 1, 1, 1,
-0.8411481, -2.900471, -3.047578, 1, 1, 1, 1, 1,
-0.8342663, -0.4715923, -2.483227, 1, 1, 1, 1, 1,
-0.8338875, -0.09304529, -2.588482, 1, 1, 1, 1, 1,
-0.8328869, -0.08697276, -1.186528, 1, 1, 1, 1, 1,
-0.8286492, 1.366999, -0.279027, 1, 1, 1, 1, 1,
-0.8280019, -0.8923763, -1.849288, 0, 0, 1, 1, 1,
-0.8233787, -0.1147712, -1.94269, 1, 0, 0, 1, 1,
-0.821412, -1.319264, -2.292138, 1, 0, 0, 1, 1,
-0.8196472, 0.03021848, -0.7042634, 1, 0, 0, 1, 1,
-0.8147437, 0.6563948, -1.291687, 1, 0, 0, 1, 1,
-0.8106625, -0.5985498, -2.820263, 1, 0, 0, 1, 1,
-0.8091487, 1.276699, -2.554054, 0, 0, 0, 1, 1,
-0.8048502, 0.02282363, -1.391347, 0, 0, 0, 1, 1,
-0.8046178, 0.7204605, -0.5788142, 0, 0, 0, 1, 1,
-0.7992364, 0.06392931, -1.606254, 0, 0, 0, 1, 1,
-0.7926096, 2.081454, 0.6169172, 0, 0, 0, 1, 1,
-0.7915223, -0.2799853, -0.5138116, 0, 0, 0, 1, 1,
-0.7913031, 0.5253471, -1.513464, 0, 0, 0, 1, 1,
-0.7867707, 1.131519, -0.6623058, 1, 1, 1, 1, 1,
-0.7862991, 1.392267, -0.9913089, 1, 1, 1, 1, 1,
-0.7776982, -0.1486792, -0.3881208, 1, 1, 1, 1, 1,
-0.7769103, -0.4339965, -2.193235, 1, 1, 1, 1, 1,
-0.7703705, -1.478052, -2.020449, 1, 1, 1, 1, 1,
-0.7682179, 0.4652496, -1.02371, 1, 1, 1, 1, 1,
-0.7675122, 1.48646, 0.6617223, 1, 1, 1, 1, 1,
-0.7602606, -0.412646, -2.1798, 1, 1, 1, 1, 1,
-0.7471238, 0.2099714, -0.1684385, 1, 1, 1, 1, 1,
-0.7438444, -1.2848, -3.567003, 1, 1, 1, 1, 1,
-0.7414206, 0.992706, -2.224543, 1, 1, 1, 1, 1,
-0.7411781, -0.8082233, -2.663642, 1, 1, 1, 1, 1,
-0.7394756, -0.9423538, -3.894195, 1, 1, 1, 1, 1,
-0.7353491, 0.3029424, -1.617388, 1, 1, 1, 1, 1,
-0.7346585, -0.316212, -3.523108, 1, 1, 1, 1, 1,
-0.7321679, -0.3997249, -1.593667, 0, 0, 1, 1, 1,
-0.7293377, -1.962005, -1.759085, 1, 0, 0, 1, 1,
-0.7183707, -1.572269, -4.849489, 1, 0, 0, 1, 1,
-0.7139238, -1.154329, -2.726461, 1, 0, 0, 1, 1,
-0.7080371, 0.04802765, -1.905014, 1, 0, 0, 1, 1,
-0.6961559, -0.3571486, -2.809992, 1, 0, 0, 1, 1,
-0.6950303, 2.164196, -2.148195, 0, 0, 0, 1, 1,
-0.6943189, -1.868279, -3.307119, 0, 0, 0, 1, 1,
-0.6923329, 0.2905652, -0.8497826, 0, 0, 0, 1, 1,
-0.6788592, -0.3618777, -2.351274, 0, 0, 0, 1, 1,
-0.677093, -2.351131, -2.634181, 0, 0, 0, 1, 1,
-0.6770271, -0.4849983, -3.365132, 0, 0, 0, 1, 1,
-0.6758787, -0.4137633, -2.173537, 0, 0, 0, 1, 1,
-0.6704184, -0.1107591, -2.142073, 1, 1, 1, 1, 1,
-0.6580448, 1.938944, 0.009951696, 1, 1, 1, 1, 1,
-0.6577002, -0.1171398, -1.643667, 1, 1, 1, 1, 1,
-0.6518407, 1.665197, -0.3309436, 1, 1, 1, 1, 1,
-0.6516046, -0.5213783, -0.6569355, 1, 1, 1, 1, 1,
-0.6408672, -1.600763, -3.494063, 1, 1, 1, 1, 1,
-0.6380262, 0.3813882, 0.1660911, 1, 1, 1, 1, 1,
-0.6352704, 0.607852, -0.5753617, 1, 1, 1, 1, 1,
-0.6300816, 0.6944879, -0.9557381, 1, 1, 1, 1, 1,
-0.6275207, -0.5944239, -3.657744, 1, 1, 1, 1, 1,
-0.6258044, 0.4288646, -0.1433928, 1, 1, 1, 1, 1,
-0.6254681, -0.449686, -3.470613, 1, 1, 1, 1, 1,
-0.6222525, 0.3421923, -1.022155, 1, 1, 1, 1, 1,
-0.617514, 0.3735164, 0.1809961, 1, 1, 1, 1, 1,
-0.6174173, 0.1916878, -2.248741, 1, 1, 1, 1, 1,
-0.6133052, 0.5969138, -0.7603018, 0, 0, 1, 1, 1,
-0.606062, 0.2930759, -0.7953185, 1, 0, 0, 1, 1,
-0.5986843, -1.29978, -3.154011, 1, 0, 0, 1, 1,
-0.5976868, 0.08371176, -1.930171, 1, 0, 0, 1, 1,
-0.5970409, 0.441337, -1.399488, 1, 0, 0, 1, 1,
-0.5947135, 0.4951922, -1.92565, 1, 0, 0, 1, 1,
-0.5939744, 1.239587, -1.298126, 0, 0, 0, 1, 1,
-0.5864778, -0.7182254, -1.724059, 0, 0, 0, 1, 1,
-0.5857868, -0.8211035, -2.362287, 0, 0, 0, 1, 1,
-0.5847976, 0.7886655, -1.646495, 0, 0, 0, 1, 1,
-0.5825232, 0.2150203, -0.9042399, 0, 0, 0, 1, 1,
-0.5794932, 0.9682099, 0.6768791, 0, 0, 0, 1, 1,
-0.579353, -0.4462817, -0.003657522, 0, 0, 0, 1, 1,
-0.5788409, 0.9274244, -1.22171, 1, 1, 1, 1, 1,
-0.5766854, -0.5613205, -3.026284, 1, 1, 1, 1, 1,
-0.5765396, -1.584341, -3.287261, 1, 1, 1, 1, 1,
-0.5702948, -0.7072978, -3.173195, 1, 1, 1, 1, 1,
-0.5692904, 0.01978132, -1.435155, 1, 1, 1, 1, 1,
-0.5683701, 1.938418, -1.533925, 1, 1, 1, 1, 1,
-0.5639794, 0.02471367, -2.056938, 1, 1, 1, 1, 1,
-0.5624943, 0.1683864, -0.140279, 1, 1, 1, 1, 1,
-0.5567527, 0.9006597, -0.131656, 1, 1, 1, 1, 1,
-0.5558329, 0.5787485, -1.010286, 1, 1, 1, 1, 1,
-0.544825, -0.02941843, 0.137543, 1, 1, 1, 1, 1,
-0.5434148, -0.6996306, -2.593061, 1, 1, 1, 1, 1,
-0.5387402, -0.9959236, -2.384912, 1, 1, 1, 1, 1,
-0.5374969, 0.8133548, -1.040712, 1, 1, 1, 1, 1,
-0.5306872, 1.685451, -1.040614, 1, 1, 1, 1, 1,
-0.520601, 0.993815, -1.065166, 0, 0, 1, 1, 1,
-0.5130021, 0.32807, -1.682535, 1, 0, 0, 1, 1,
-0.51191, -0.6330976, -1.834339, 1, 0, 0, 1, 1,
-0.5072633, -1.890752, -2.077529, 1, 0, 0, 1, 1,
-0.5014326, 0.2227423, -0.8739306, 1, 0, 0, 1, 1,
-0.4996987, -1.541971, -2.816572, 1, 0, 0, 1, 1,
-0.4986609, 0.6162777, -0.1759515, 0, 0, 0, 1, 1,
-0.4903262, 0.320599, -1.654769, 0, 0, 0, 1, 1,
-0.4872653, -1.459085, -3.104691, 0, 0, 0, 1, 1,
-0.4866639, -0.5238965, -3.090655, 0, 0, 0, 1, 1,
-0.4817921, -0.7266112, -1.041944, 0, 0, 0, 1, 1,
-0.4817528, -1.498533, -1.473459, 0, 0, 0, 1, 1,
-0.4812334, 1.273983, -0.7987849, 0, 0, 0, 1, 1,
-0.4810806, 0.7317753, 1.221905, 1, 1, 1, 1, 1,
-0.4749983, 1.559567, -0.9495946, 1, 1, 1, 1, 1,
-0.4708564, 1.057545, 0.02336718, 1, 1, 1, 1, 1,
-0.4654254, 0.9425678, 0.3837424, 1, 1, 1, 1, 1,
-0.4549356, 0.5114638, -1.057128, 1, 1, 1, 1, 1,
-0.4522441, 1.885609, 0.8719075, 1, 1, 1, 1, 1,
-0.4481844, -0.2437433, -3.269305, 1, 1, 1, 1, 1,
-0.4382157, 0.1023137, -2.037525, 1, 1, 1, 1, 1,
-0.4295223, 0.1720215, -2.67095, 1, 1, 1, 1, 1,
-0.4265878, -0.3922071, -0.3600366, 1, 1, 1, 1, 1,
-0.4255176, -0.7379014, -2.488615, 1, 1, 1, 1, 1,
-0.4227902, -1.2847, -1.792332, 1, 1, 1, 1, 1,
-0.4211943, -1.778115, -3.392372, 1, 1, 1, 1, 1,
-0.4207887, 1.103048, -0.8978274, 1, 1, 1, 1, 1,
-0.4186177, -0.8122767, -1.714638, 1, 1, 1, 1, 1,
-0.4139969, 0.6159095, -1.730067, 0, 0, 1, 1, 1,
-0.4116995, 0.8679966, 0.7776396, 1, 0, 0, 1, 1,
-0.4078377, -1.034971, -3.224516, 1, 0, 0, 1, 1,
-0.4046212, 0.9921615, 0.3083549, 1, 0, 0, 1, 1,
-0.400409, 0.6885251, 0.5608968, 1, 0, 0, 1, 1,
-0.3984998, 0.3504323, -0.5513218, 1, 0, 0, 1, 1,
-0.395647, -0.7346272, -2.008629, 0, 0, 0, 1, 1,
-0.3938493, 0.3706521, -1.4486, 0, 0, 0, 1, 1,
-0.3926323, -1.154874, -1.303118, 0, 0, 0, 1, 1,
-0.392561, 0.5760875, -1.795973, 0, 0, 0, 1, 1,
-0.3899359, -0.5014172, -1.83497, 0, 0, 0, 1, 1,
-0.3898314, 0.09688271, -1.877327, 0, 0, 0, 1, 1,
-0.3841604, 0.6017689, -0.815208, 0, 0, 0, 1, 1,
-0.3815009, 0.9800632, -2.487545, 1, 1, 1, 1, 1,
-0.3811775, -0.3204254, -2.257041, 1, 1, 1, 1, 1,
-0.3787946, 0.05422553, -2.989161, 1, 1, 1, 1, 1,
-0.3786881, 1.435167, -2.02316, 1, 1, 1, 1, 1,
-0.377712, -0.8783332, -1.620772, 1, 1, 1, 1, 1,
-0.3765441, 1.556669, 1.342926, 1, 1, 1, 1, 1,
-0.3763166, 0.9425846, 0.2099693, 1, 1, 1, 1, 1,
-0.3747231, 0.1933428, -1.511728, 1, 1, 1, 1, 1,
-0.3744273, -0.6605338, -4.540183, 1, 1, 1, 1, 1,
-0.3720163, -0.4578097, -2.276185, 1, 1, 1, 1, 1,
-0.3652058, 0.723795, -0.5447639, 1, 1, 1, 1, 1,
-0.3646621, 0.5077133, -1.285754, 1, 1, 1, 1, 1,
-0.3602583, -0.7403908, -4.33793, 1, 1, 1, 1, 1,
-0.3564707, -1.189512, -3.835744, 1, 1, 1, 1, 1,
-0.3555874, -0.6683809, -1.56252, 1, 1, 1, 1, 1,
-0.3537309, 1.495596, -0.3505654, 0, 0, 1, 1, 1,
-0.3493764, 0.9697251, -1.515389, 1, 0, 0, 1, 1,
-0.3487819, 0.430564, -1.483433, 1, 0, 0, 1, 1,
-0.3468616, -0.4299917, -2.609285, 1, 0, 0, 1, 1,
-0.3405825, -0.2515936, -2.956986, 1, 0, 0, 1, 1,
-0.3404959, -0.2050695, -1.720612, 1, 0, 0, 1, 1,
-0.3402192, -1.049091, -4.100547, 0, 0, 0, 1, 1,
-0.3369301, 0.3430886, -2.104678, 0, 0, 0, 1, 1,
-0.3330747, 0.4363035, -0.973919, 0, 0, 0, 1, 1,
-0.3326877, 0.9267392, -0.7528258, 0, 0, 0, 1, 1,
-0.3323178, -0.8585056, -1.677315, 0, 0, 0, 1, 1,
-0.3243265, 0.7181934, -1.646837, 0, 0, 0, 1, 1,
-0.3218384, -0.1658716, -2.220605, 0, 0, 0, 1, 1,
-0.3202951, -0.5138845, -3.39594, 1, 1, 1, 1, 1,
-0.3190333, -1.400806, -3.763587, 1, 1, 1, 1, 1,
-0.3161783, 0.727122, -2.51578, 1, 1, 1, 1, 1,
-0.3147267, -0.5905604, -2.66793, 1, 1, 1, 1, 1,
-0.314505, 1.471511, -1.455054, 1, 1, 1, 1, 1,
-0.3127311, 0.41061, -1.894855, 1, 1, 1, 1, 1,
-0.3123922, -1.001419, -2.609933, 1, 1, 1, 1, 1,
-0.307621, 1.420039, 0.4106363, 1, 1, 1, 1, 1,
-0.3070223, -0.2719787, -0.5700079, 1, 1, 1, 1, 1,
-0.3068765, -1.024855, -3.435369, 1, 1, 1, 1, 1,
-0.3019488, 0.123249, 0.4743201, 1, 1, 1, 1, 1,
-0.299119, -0.2916291, -3.059254, 1, 1, 1, 1, 1,
-0.2966568, -1.071538, -2.597218, 1, 1, 1, 1, 1,
-0.295492, 2.046502, 0.5924138, 1, 1, 1, 1, 1,
-0.2942785, -1.567042, -2.822914, 1, 1, 1, 1, 1,
-0.2866574, -0.2832839, -3.36497, 0, 0, 1, 1, 1,
-0.2819425, 0.4326459, -1.332268, 1, 0, 0, 1, 1,
-0.2800469, -1.360954, -3.373559, 1, 0, 0, 1, 1,
-0.2783485, -0.3490198, -1.913881, 1, 0, 0, 1, 1,
-0.275928, 1.353709, -0.5775856, 1, 0, 0, 1, 1,
-0.2755767, 0.8522268, -0.6793132, 1, 0, 0, 1, 1,
-0.2742107, -0.9103677, -2.991429, 0, 0, 0, 1, 1,
-0.2730716, 2.23338, 0.6015579, 0, 0, 0, 1, 1,
-0.2706637, 1.212652, -0.9820022, 0, 0, 0, 1, 1,
-0.2685233, 2.041344, 0.1910398, 0, 0, 0, 1, 1,
-0.2669142, 0.6557215, 0.5897957, 0, 0, 0, 1, 1,
-0.2667982, 0.4263521, -1.21471, 0, 0, 0, 1, 1,
-0.2667666, 1.560215, 0.02016081, 0, 0, 0, 1, 1,
-0.2631295, 1.280593, -2.352627, 1, 1, 1, 1, 1,
-0.2594676, 1.3194, -1.509616, 1, 1, 1, 1, 1,
-0.2571057, -1.352365, -0.5872893, 1, 1, 1, 1, 1,
-0.2553748, 0.2318571, -0.5592337, 1, 1, 1, 1, 1,
-0.2518, 0.9692326, -1.591598, 1, 1, 1, 1, 1,
-0.251303, -1.597636, -2.68195, 1, 1, 1, 1, 1,
-0.2510233, -0.662411, -3.619497, 1, 1, 1, 1, 1,
-0.2463071, -0.7248315, -3.24682, 1, 1, 1, 1, 1,
-0.2435836, 1.111058, 0.2084882, 1, 1, 1, 1, 1,
-0.2432351, 1.66957, 0.792983, 1, 1, 1, 1, 1,
-0.2426018, 0.9555072, -0.9199315, 1, 1, 1, 1, 1,
-0.2421186, -0.6181702, -2.822448, 1, 1, 1, 1, 1,
-0.2368016, -0.07809813, -2.728169, 1, 1, 1, 1, 1,
-0.2343135, -0.3205951, -3.251155, 1, 1, 1, 1, 1,
-0.2254603, 0.1279361, -2.458768, 1, 1, 1, 1, 1,
-0.2240464, 1.564073, 1.939507, 0, 0, 1, 1, 1,
-0.2220059, -0.4435548, -0.7006543, 1, 0, 0, 1, 1,
-0.2163932, -1.288492, -2.080731, 1, 0, 0, 1, 1,
-0.2132008, 0.7380288, 1.793702, 1, 0, 0, 1, 1,
-0.2106347, -0.5225959, -3.97853, 1, 0, 0, 1, 1,
-0.210236, 1.780285, 0.8620207, 1, 0, 0, 1, 1,
-0.2083233, -1.837533, -2.423051, 0, 0, 0, 1, 1,
-0.2082078, 0.9853176, 0.8601488, 0, 0, 0, 1, 1,
-0.2077757, 0.6626722, -0.8028071, 0, 0, 0, 1, 1,
-0.2069446, -0.4343924, -3.083212, 0, 0, 0, 1, 1,
-0.2063275, -0.2305465, -3.907071, 0, 0, 0, 1, 1,
-0.2044209, 0.4223351, 0.1315157, 0, 0, 0, 1, 1,
-0.203008, 0.3275042, 0.2920513, 0, 0, 0, 1, 1,
-0.1976799, 0.7775108, -2.095682, 1, 1, 1, 1, 1,
-0.19729, -0.6598023, -4.637136, 1, 1, 1, 1, 1,
-0.1927424, 2.365887, -0.6670722, 1, 1, 1, 1, 1,
-0.1915843, 1.388931, -1.610254, 1, 1, 1, 1, 1,
-0.1905026, 1.21366, 0.1543825, 1, 1, 1, 1, 1,
-0.1899564, 1.20732, -0.0008575697, 1, 1, 1, 1, 1,
-0.1889, 1.484788, 0.3503481, 1, 1, 1, 1, 1,
-0.1882467, -1.572138, -2.996051, 1, 1, 1, 1, 1,
-0.1871464, -1.373127, -4.507644, 1, 1, 1, 1, 1,
-0.1820702, -0.1240617, -3.485397, 1, 1, 1, 1, 1,
-0.1820055, -0.7943916, -2.631974, 1, 1, 1, 1, 1,
-0.1793042, 1.653965, 0.0691619, 1, 1, 1, 1, 1,
-0.1760432, 0.7570087, -1.070793, 1, 1, 1, 1, 1,
-0.1735078, 0.2692806, 0.3239569, 1, 1, 1, 1, 1,
-0.1699913, -0.09545576, -2.672623, 1, 1, 1, 1, 1,
-0.1675034, -1.006368, -1.705529, 0, 0, 1, 1, 1,
-0.1673917, 0.02943549, -1.712552, 1, 0, 0, 1, 1,
-0.1614567, 1.070304, -0.5196666, 1, 0, 0, 1, 1,
-0.1604073, -0.4124679, -2.916607, 1, 0, 0, 1, 1,
-0.157608, 0.6481946, 0.5316566, 1, 0, 0, 1, 1,
-0.1574471, -0.6256282, -4.595826, 1, 0, 0, 1, 1,
-0.1521446, 0.9356932, -0.9531792, 0, 0, 0, 1, 1,
-0.1519233, 1.041284, -1.009898, 0, 0, 0, 1, 1,
-0.1518046, -0.3501123, -5.239659, 0, 0, 0, 1, 1,
-0.150602, 0.5809578, 0.08165056, 0, 0, 0, 1, 1,
-0.1497025, -0.8444713, -2.334411, 0, 0, 0, 1, 1,
-0.1487018, 0.9297749, -2.738206, 0, 0, 0, 1, 1,
-0.1458689, 0.09768609, -0.5240152, 0, 0, 0, 1, 1,
-0.1442163, 0.9527191, 0.1916815, 1, 1, 1, 1, 1,
-0.1383319, -2.670072, -4.191225, 1, 1, 1, 1, 1,
-0.1342228, 0.7689185, 2.270539, 1, 1, 1, 1, 1,
-0.1306611, -0.6902569, -3.275846, 1, 1, 1, 1, 1,
-0.1302565, 0.4853487, -0.6617, 1, 1, 1, 1, 1,
-0.1281475, -0.5173523, -1.312979, 1, 1, 1, 1, 1,
-0.1281317, 0.3510402, -0.5849907, 1, 1, 1, 1, 1,
-0.1269345, -0.9393888, -4.238044, 1, 1, 1, 1, 1,
-0.1249221, -0.2504778, -2.964028, 1, 1, 1, 1, 1,
-0.1220443, 0.4205059, 0.7124594, 1, 1, 1, 1, 1,
-0.1217625, -0.1036684, -2.82354, 1, 1, 1, 1, 1,
-0.1116649, -0.9430944, -3.345439, 1, 1, 1, 1, 1,
-0.1076896, 1.187734, 0.8708826, 1, 1, 1, 1, 1,
-0.106922, -1.901163, -1.677539, 1, 1, 1, 1, 1,
-0.09993625, -1.181424, -3.465902, 1, 1, 1, 1, 1,
-0.09847269, -0.1440945, -3.658917, 0, 0, 1, 1, 1,
-0.09221093, -2.009883, -3.321231, 1, 0, 0, 1, 1,
-0.09064034, -1.222553, -3.216458, 1, 0, 0, 1, 1,
-0.09016822, -0.1328765, -2.105982, 1, 0, 0, 1, 1,
-0.08808371, 0.8556643, -2.26869, 1, 0, 0, 1, 1,
-0.08483005, 0.6347769, 1.771195, 1, 0, 0, 1, 1,
-0.07755254, -1.226899, -3.854946, 0, 0, 0, 1, 1,
-0.07690252, -0.2194304, -4.248286, 0, 0, 0, 1, 1,
-0.0729938, 1.022845, -0.1086655, 0, 0, 0, 1, 1,
-0.07295003, -0.08650159, -1.492813, 0, 0, 0, 1, 1,
-0.07011441, 0.8109829, -0.9579772, 0, 0, 0, 1, 1,
-0.0664644, 1.11181, -0.9955013, 0, 0, 0, 1, 1,
-0.06383178, 1.900121, -0.6176187, 0, 0, 0, 1, 1,
-0.06323611, -1.625637, -2.700989, 1, 1, 1, 1, 1,
-0.0607276, -0.1716415, -3.765579, 1, 1, 1, 1, 1,
-0.06028072, 1.203672, -0.03995034, 1, 1, 1, 1, 1,
-0.05819882, 0.1363472, -1.269569, 1, 1, 1, 1, 1,
-0.05725605, -1.027578, -2.430265, 1, 1, 1, 1, 1,
-0.05707157, -0.08428139, -1.241763, 1, 1, 1, 1, 1,
-0.05607081, 0.4802115, -2.12604, 1, 1, 1, 1, 1,
-0.0540344, 0.2845035, -2.416838, 1, 1, 1, 1, 1,
-0.05313568, 0.8395745, 1.415925, 1, 1, 1, 1, 1,
-0.04860304, 0.1559098, 0.09143984, 1, 1, 1, 1, 1,
-0.04730687, -1.338386, -2.606522, 1, 1, 1, 1, 1,
-0.04376091, 1.399235, 0.01057171, 1, 1, 1, 1, 1,
-0.03813548, 0.4113005, 1.00783, 1, 1, 1, 1, 1,
-0.03715875, 0.3773256, -0.1663695, 1, 1, 1, 1, 1,
-0.03661932, 1.074757, 0.9311229, 1, 1, 1, 1, 1,
-0.03441883, -0.9300045, -2.637929, 0, 0, 1, 1, 1,
-0.03308179, 0.7907581, 1.298889, 1, 0, 0, 1, 1,
-0.02972145, 0.302069, 0.06012284, 1, 0, 0, 1, 1,
-0.02580722, -1.299851, -1.468854, 1, 0, 0, 1, 1,
-0.01785414, 1.714467, -0.4287446, 1, 0, 0, 1, 1,
-0.0127714, 0.5681935, 0.8024933, 1, 0, 0, 1, 1,
-0.01009477, -0.8202155, -3.142439, 0, 0, 0, 1, 1,
-0.007946409, -0.496016, -3.130192, 0, 0, 0, 1, 1,
-0.007757546, 0.2828232, 0.4203463, 0, 0, 0, 1, 1,
-0.004285824, -0.8579789, -3.008443, 0, 0, 0, 1, 1,
-0.0008742828, 1.634992, -0.7875876, 0, 0, 0, 1, 1,
0.0007670178, 0.8567137, 0.8700041, 0, 0, 0, 1, 1,
0.0007726019, -1.36742, 2.332681, 0, 0, 0, 1, 1,
0.001295027, 0.4363002, -0.1696115, 1, 1, 1, 1, 1,
0.00147869, -0.9477077, 2.209144, 1, 1, 1, 1, 1,
0.004907244, -0.1595828, 2.463552, 1, 1, 1, 1, 1,
0.007406266, -0.448051, 4.331243, 1, 1, 1, 1, 1,
0.009231374, 0.4477301, 0.720144, 1, 1, 1, 1, 1,
0.01059722, -0.5734784, 3.033118, 1, 1, 1, 1, 1,
0.01082788, -1.162546, 4.904657, 1, 1, 1, 1, 1,
0.01218284, -0.9238106, 4.54271, 1, 1, 1, 1, 1,
0.01295095, -2.291335, 4.417597, 1, 1, 1, 1, 1,
0.01457051, 0.6799082, 0.09847321, 1, 1, 1, 1, 1,
0.01788828, -0.5852988, 4.096508, 1, 1, 1, 1, 1,
0.0183948, -0.1627799, 2.263385, 1, 1, 1, 1, 1,
0.02002599, 1.458818, -0.682459, 1, 1, 1, 1, 1,
0.02237414, 2.291106, 0.47854, 1, 1, 1, 1, 1,
0.02473109, -0.1922472, 2.059187, 1, 1, 1, 1, 1,
0.03040875, -0.2903415, 2.24608, 0, 0, 1, 1, 1,
0.03172695, 0.6811101, 0.8151774, 1, 0, 0, 1, 1,
0.03247861, 0.6661173, -0.9807981, 1, 0, 0, 1, 1,
0.03357203, -0.01788669, 1.752995, 1, 0, 0, 1, 1,
0.03566365, -0.4977829, 2.421483, 1, 0, 0, 1, 1,
0.04061519, 0.9339912, -0.5784929, 1, 0, 0, 1, 1,
0.04232506, 1.577456, 1.256804, 0, 0, 0, 1, 1,
0.04488277, 1.062045, -0.7856439, 0, 0, 0, 1, 1,
0.04674771, -0.4664423, 3.033969, 0, 0, 0, 1, 1,
0.05173799, 1.426542, -1.681716, 0, 0, 0, 1, 1,
0.0532495, -0.314344, 1.594891, 0, 0, 0, 1, 1,
0.05362954, -2.142108, 3.685535, 0, 0, 0, 1, 1,
0.05380265, 0.7283705, -2.753271, 0, 0, 0, 1, 1,
0.0559257, -0.733439, 4.013495, 1, 1, 1, 1, 1,
0.0587795, 0.7330743, 0.6846182, 1, 1, 1, 1, 1,
0.05898217, -0.7710406, 2.417843, 1, 1, 1, 1, 1,
0.06020022, -1.722499, 3.230448, 1, 1, 1, 1, 1,
0.06157885, 0.8294751, -0.394699, 1, 1, 1, 1, 1,
0.06303872, 1.457762, -1.676816, 1, 1, 1, 1, 1,
0.06337722, -0.1853424, 1.319408, 1, 1, 1, 1, 1,
0.06606476, -1.559038, 2.946064, 1, 1, 1, 1, 1,
0.06782956, -0.2751585, 2.720228, 1, 1, 1, 1, 1,
0.06805795, 0.0287711, 1.139019, 1, 1, 1, 1, 1,
0.07122757, 1.109618, 1.19645, 1, 1, 1, 1, 1,
0.072679, -0.09941269, 2.149382, 1, 1, 1, 1, 1,
0.07271194, -0.02659372, 3.192917, 1, 1, 1, 1, 1,
0.07780467, -0.1826301, 1.302605, 1, 1, 1, 1, 1,
0.07973804, 0.2439389, 0.2080703, 1, 1, 1, 1, 1,
0.08117257, -0.9469727, 3.624676, 0, 0, 1, 1, 1,
0.08462532, 0.5180219, -0.1971847, 1, 0, 0, 1, 1,
0.08753236, -1.78712, 1.722052, 1, 0, 0, 1, 1,
0.09033888, -1.180551, 3.006429, 1, 0, 0, 1, 1,
0.09039413, -2.415721, 3.506517, 1, 0, 0, 1, 1,
0.09160683, 0.1309798, 0.7223491, 1, 0, 0, 1, 1,
0.0932681, -0.5166836, 0.2788204, 0, 0, 0, 1, 1,
0.0960728, -1.106031, 1.427302, 0, 0, 0, 1, 1,
0.1007036, -0.372449, 3.631544, 0, 0, 0, 1, 1,
0.1009568, 0.4751668, 2.49298, 0, 0, 0, 1, 1,
0.1085411, 1.102432, 0.1630742, 0, 0, 0, 1, 1,
0.1108891, 0.05648342, 0.8978128, 0, 0, 0, 1, 1,
0.1171264, 0.5397299, 1.436291, 0, 0, 0, 1, 1,
0.1176023, 0.9611374, 0.504478, 1, 1, 1, 1, 1,
0.1232715, -0.07273811, 3.071215, 1, 1, 1, 1, 1,
0.1266429, -0.7196482, 2.581322, 1, 1, 1, 1, 1,
0.1284022, 0.4661888, -1.003161, 1, 1, 1, 1, 1,
0.1367345, -1.482217, 3.010146, 1, 1, 1, 1, 1,
0.1392427, 1.448589, -0.6250312, 1, 1, 1, 1, 1,
0.139664, -1.442163, 2.81629, 1, 1, 1, 1, 1,
0.1412289, -0.2512781, 2.358571, 1, 1, 1, 1, 1,
0.1415036, -1.753824, 3.353657, 1, 1, 1, 1, 1,
0.1438174, 0.1779988, 1.288167, 1, 1, 1, 1, 1,
0.1446227, 1.299288, -0.5752842, 1, 1, 1, 1, 1,
0.1460382, -1.695032, 3.856854, 1, 1, 1, 1, 1,
0.1493526, -0.113703, 3.095854, 1, 1, 1, 1, 1,
0.1505995, 0.4710514, 0.1679844, 1, 1, 1, 1, 1,
0.1513232, 0.09996037, -0.8943477, 1, 1, 1, 1, 1,
0.152211, -0.87949, 4.192071, 0, 0, 1, 1, 1,
0.153876, 1.428007, -1.301497, 1, 0, 0, 1, 1,
0.1571517, -0.8825524, 3.066354, 1, 0, 0, 1, 1,
0.1587728, -1.613107, 2.596419, 1, 0, 0, 1, 1,
0.1594602, 0.5855036, -0.1193234, 1, 0, 0, 1, 1,
0.1613603, 0.448732, -0.8165104, 1, 0, 0, 1, 1,
0.1635815, -0.8666926, 2.320182, 0, 0, 0, 1, 1,
0.1665256, 0.7110261, 0.1235519, 0, 0, 0, 1, 1,
0.1671121, 0.4901522, 0.9842962, 0, 0, 0, 1, 1,
0.1714698, 0.702493, 0.6723663, 0, 0, 0, 1, 1,
0.1749702, 0.5809895, -1.053009, 0, 0, 0, 1, 1,
0.1764353, -1.454155, 1.103414, 0, 0, 0, 1, 1,
0.1775075, 0.3132673, 1.393301, 0, 0, 0, 1, 1,
0.1779296, 0.6213146, -0.8031609, 1, 1, 1, 1, 1,
0.1787434, 1.868302, 0.9014882, 1, 1, 1, 1, 1,
0.1805782, -0.0130922, 2.578204, 1, 1, 1, 1, 1,
0.1875816, -0.8216973, 3.256867, 1, 1, 1, 1, 1,
0.1877984, -1.924886, 3.420309, 1, 1, 1, 1, 1,
0.1882657, -0.4710654, 2.962266, 1, 1, 1, 1, 1,
0.1886112, 2.202207, -1.420936, 1, 1, 1, 1, 1,
0.1914499, -1.295823, 3.52499, 1, 1, 1, 1, 1,
0.1921549, -0.8323514, 2.905993, 1, 1, 1, 1, 1,
0.195153, 0.08687405, 1.010177, 1, 1, 1, 1, 1,
0.1959222, -0.316542, 3.263274, 1, 1, 1, 1, 1,
0.2053148, -0.961965, 2.269197, 1, 1, 1, 1, 1,
0.2129175, -0.8902715, 5.430385, 1, 1, 1, 1, 1,
0.2147482, 1.161121, 1.877234, 1, 1, 1, 1, 1,
0.220413, 2.754285, 0.5710533, 1, 1, 1, 1, 1,
0.2222061, -0.2189053, 1.508947, 0, 0, 1, 1, 1,
0.2235276, -2.106576, 1.819158, 1, 0, 0, 1, 1,
0.2255531, -0.2247203, 1.947897, 1, 0, 0, 1, 1,
0.2264569, 0.05034923, 2.108593, 1, 0, 0, 1, 1,
0.2298749, -1.190003, 1.956383, 1, 0, 0, 1, 1,
0.2303907, 0.3451588, -1.733737, 1, 0, 0, 1, 1,
0.2383544, -1.294077, 3.456322, 0, 0, 0, 1, 1,
0.2400657, -0.5962911, 3.147715, 0, 0, 0, 1, 1,
0.2402549, 0.6268653, -2.085047, 0, 0, 0, 1, 1,
0.2431922, -0.4092144, 3.717066, 0, 0, 0, 1, 1,
0.2459027, 0.6987899, 0.3683206, 0, 0, 0, 1, 1,
0.2475335, -1.684508, 3.382874, 0, 0, 0, 1, 1,
0.2491445, 0.4544969, 2.502845, 0, 0, 0, 1, 1,
0.2549803, 1.702919, 0.08254787, 1, 1, 1, 1, 1,
0.2550707, 0.2881816, 2.312587, 1, 1, 1, 1, 1,
0.2589066, 0.03151088, 0.6904029, 1, 1, 1, 1, 1,
0.2591363, -0.1394179, 2.858436, 1, 1, 1, 1, 1,
0.2595028, 0.09348959, 1.112642, 1, 1, 1, 1, 1,
0.2602111, -1.331703, 2.837771, 1, 1, 1, 1, 1,
0.2612208, -0.5327989, 3.375245, 1, 1, 1, 1, 1,
0.2613718, 0.06122102, 2.656328, 1, 1, 1, 1, 1,
0.2674979, 0.5507898, 0.6621852, 1, 1, 1, 1, 1,
0.2681906, -0.5920027, 2.923743, 1, 1, 1, 1, 1,
0.2703997, 0.5808141, 0.6186823, 1, 1, 1, 1, 1,
0.2704816, -0.0622791, 2.054868, 1, 1, 1, 1, 1,
0.2713936, -1.043315, 3.313119, 1, 1, 1, 1, 1,
0.2736535, 1.650743, 1.225645, 1, 1, 1, 1, 1,
0.2737429, -0.7488675, 2.240246, 1, 1, 1, 1, 1,
0.2775691, 1.128451, -0.8067743, 0, 0, 1, 1, 1,
0.2790327, 1.718918, 1.644139, 1, 0, 0, 1, 1,
0.2792705, -0.2961506, 1.730525, 1, 0, 0, 1, 1,
0.2808041, -1.095586, 2.496271, 1, 0, 0, 1, 1,
0.2818121, 0.9994162, -0.2163165, 1, 0, 0, 1, 1,
0.2849393, 0.001705533, 2.677276, 1, 0, 0, 1, 1,
0.2872122, -0.8355606, 2.213397, 0, 0, 0, 1, 1,
0.2878051, 1.882705, -0.6890485, 0, 0, 0, 1, 1,
0.2897824, 1.121408, -0.5135581, 0, 0, 0, 1, 1,
0.2953189, -1.228043, 2.966758, 0, 0, 0, 1, 1,
0.3046336, 1.315147, 1.048127, 0, 0, 0, 1, 1,
0.3071267, -0.9751415, 2.046549, 0, 0, 0, 1, 1,
0.3075684, 0.6423121, -0.8589676, 0, 0, 0, 1, 1,
0.3105752, -0.8385611, 2.234005, 1, 1, 1, 1, 1,
0.3111292, -0.8140163, 3.584126, 1, 1, 1, 1, 1,
0.3112188, -0.6174357, 1.730222, 1, 1, 1, 1, 1,
0.3130908, -1.107448, 3.002518, 1, 1, 1, 1, 1,
0.3162696, 0.9285444, -0.5115968, 1, 1, 1, 1, 1,
0.3205878, 0.3318817, 2.041003, 1, 1, 1, 1, 1,
0.3230291, 0.8951577, -0.8991234, 1, 1, 1, 1, 1,
0.3261436, 0.7588884, 0.01718837, 1, 1, 1, 1, 1,
0.3264098, -0.5649453, 1.776785, 1, 1, 1, 1, 1,
0.328486, -0.2592716, 4.145261, 1, 1, 1, 1, 1,
0.3327299, -0.3986989, 1.608084, 1, 1, 1, 1, 1,
0.3372848, 0.7924494, 2.815331, 1, 1, 1, 1, 1,
0.3427876, -0.3030336, 2.742727, 1, 1, 1, 1, 1,
0.3435883, -0.3381265, 2.064579, 1, 1, 1, 1, 1,
0.3451554, -1.013447, 2.699335, 1, 1, 1, 1, 1,
0.3465614, -0.3162536, 1.843208, 0, 0, 1, 1, 1,
0.3564823, -0.0002494843, 2.297508, 1, 0, 0, 1, 1,
0.3579343, -0.3817793, 2.709214, 1, 0, 0, 1, 1,
0.3582969, -0.2014027, 2.423587, 1, 0, 0, 1, 1,
0.3603777, -1.649462, 3.907644, 1, 0, 0, 1, 1,
0.3604359, 0.1158133, 1.655735, 1, 0, 0, 1, 1,
0.3605543, -0.6936912, 3.778468, 0, 0, 0, 1, 1,
0.3622095, -1.485776, 3.970613, 0, 0, 0, 1, 1,
0.3649088, 1.659945, 1.520762, 0, 0, 0, 1, 1,
0.3674402, -1.018854, 2.273199, 0, 0, 0, 1, 1,
0.367933, 1.569386, 0.790638, 0, 0, 0, 1, 1,
0.3777295, 1.446381, 0.2077337, 0, 0, 0, 1, 1,
0.3788173, 1.137175, 0.4100555, 0, 0, 0, 1, 1,
0.3853057, 1.161002, 1.042203, 1, 1, 1, 1, 1,
0.3867141, -0.424246, 2.466698, 1, 1, 1, 1, 1,
0.3892206, 1.047181, -0.4630702, 1, 1, 1, 1, 1,
0.3928124, 0.5167733, 0.335993, 1, 1, 1, 1, 1,
0.3973316, -0.4820369, 1.029131, 1, 1, 1, 1, 1,
0.3989325, 0.2281715, 2.447419, 1, 1, 1, 1, 1,
0.4009812, 0.1989944, 0.5040983, 1, 1, 1, 1, 1,
0.410005, 0.06162607, 2.735292, 1, 1, 1, 1, 1,
0.41495, -0.692419, 3.063015, 1, 1, 1, 1, 1,
0.4193023, -0.8471659, 4.278908, 1, 1, 1, 1, 1,
0.4221912, 1.46781, 0.9706407, 1, 1, 1, 1, 1,
0.4223133, -0.04706164, 2.694029, 1, 1, 1, 1, 1,
0.4281487, -1.230115, 5.170234, 1, 1, 1, 1, 1,
0.4307063, 0.58401, 1.312143, 1, 1, 1, 1, 1,
0.4331333, 0.7383589, 0.3532619, 1, 1, 1, 1, 1,
0.4358192, 0.2017225, -0.06484817, 0, 0, 1, 1, 1,
0.4371147, 1.008815, -0.007406462, 1, 0, 0, 1, 1,
0.4453678, 0.6804157, -0.8575791, 1, 0, 0, 1, 1,
0.4487027, 1.311267, 0.8034253, 1, 0, 0, 1, 1,
0.4529724, -0.1197359, 0.7445009, 1, 0, 0, 1, 1,
0.453176, -0.1746141, 3.823221, 1, 0, 0, 1, 1,
0.4558549, -0.2837775, 1.378726, 0, 0, 0, 1, 1,
0.45632, 1.4239, 1.338171, 0, 0, 0, 1, 1,
0.4590335, 1.454608, 1.77962, 0, 0, 0, 1, 1,
0.4638036, -0.1280069, 2.212451, 0, 0, 0, 1, 1,
0.4674847, -0.5973947, 0.7972526, 0, 0, 0, 1, 1,
0.469377, -0.2604299, 2.478892, 0, 0, 0, 1, 1,
0.4719495, 0.7893286, 1.144574, 0, 0, 0, 1, 1,
0.4774713, -0.6880196, 2.199989, 1, 1, 1, 1, 1,
0.4808972, -0.3723881, 1.005614, 1, 1, 1, 1, 1,
0.4825279, 1.34191, 0.06687518, 1, 1, 1, 1, 1,
0.4843008, 0.1251498, 1.441718, 1, 1, 1, 1, 1,
0.4854454, -2.39977, 1.889464, 1, 1, 1, 1, 1,
0.4924271, -0.7277767, 1.387311, 1, 1, 1, 1, 1,
0.496384, -0.7148192, 2.230057, 1, 1, 1, 1, 1,
0.497819, 0.05607004, 1.151988, 1, 1, 1, 1, 1,
0.5047802, -0.9901199, 2.852593, 1, 1, 1, 1, 1,
0.5048735, 0.04437754, 1.639157, 1, 1, 1, 1, 1,
0.505801, -0.1112043, 2.845991, 1, 1, 1, 1, 1,
0.5064108, -0.4697651, 2.008671, 1, 1, 1, 1, 1,
0.5098801, -0.8848786, 2.850181, 1, 1, 1, 1, 1,
0.510444, -0.951644, 3.180832, 1, 1, 1, 1, 1,
0.5129827, 1.415546, 0.5816444, 1, 1, 1, 1, 1,
0.5138682, -0.356509, 2.410245, 0, 0, 1, 1, 1,
0.516556, -1.054383, 2.263044, 1, 0, 0, 1, 1,
0.5166334, 1.436863, 0.7975269, 1, 0, 0, 1, 1,
0.5239676, -0.444183, 1.948562, 1, 0, 0, 1, 1,
0.5250923, -0.01276339, 1.34904, 1, 0, 0, 1, 1,
0.5278965, -1.017636, 0.3802665, 1, 0, 0, 1, 1,
0.5306212, -0.6976126, 2.331188, 0, 0, 0, 1, 1,
0.5339535, -0.7943998, 0.8490726, 0, 0, 0, 1, 1,
0.5399866, 1.476224, 1.02721, 0, 0, 0, 1, 1,
0.5429457, -0.01499289, 2.062461, 0, 0, 0, 1, 1,
0.5435096, 1.516197, 0.3806817, 0, 0, 0, 1, 1,
0.5437918, -0.8073069, 2.731177, 0, 0, 0, 1, 1,
0.5454425, 0.3208855, 3.07875, 0, 0, 0, 1, 1,
0.5498846, 1.015109, 1.591056, 1, 1, 1, 1, 1,
0.5499318, 0.1511493, 3.735193, 1, 1, 1, 1, 1,
0.5638086, 0.7611045, 0.7783353, 1, 1, 1, 1, 1,
0.564903, 0.1903529, 2.656761, 1, 1, 1, 1, 1,
0.5684511, -3.141912, 3.137655, 1, 1, 1, 1, 1,
0.5698475, -0.01519454, -0.1198018, 1, 1, 1, 1, 1,
0.571247, -1.858814, 2.759627, 1, 1, 1, 1, 1,
0.5717288, -2.456494, 4.02764, 1, 1, 1, 1, 1,
0.5731849, 1.067617, 2.190613, 1, 1, 1, 1, 1,
0.5732244, 0.01825256, 1.774909, 1, 1, 1, 1, 1,
0.5791545, -0.4510107, 2.722622, 1, 1, 1, 1, 1,
0.5824238, -0.8401977, 2.886932, 1, 1, 1, 1, 1,
0.5865218, 0.4420427, 0.6702849, 1, 1, 1, 1, 1,
0.5921742, -0.1586858, 0.5961142, 1, 1, 1, 1, 1,
0.5977339, 0.6625661, 0.1253341, 1, 1, 1, 1, 1,
0.6009195, 1.522591, 0.775977, 0, 0, 1, 1, 1,
0.6069863, 0.4857216, -0.2874606, 1, 0, 0, 1, 1,
0.6074949, 0.892043, 2.976838, 1, 0, 0, 1, 1,
0.6104468, 0.3049144, 0.3238465, 1, 0, 0, 1, 1,
0.6166773, -0.4660037, 2.27222, 1, 0, 0, 1, 1,
0.6209968, 0.385245, 0.03816266, 1, 0, 0, 1, 1,
0.6227491, 0.2235991, 1.928986, 0, 0, 0, 1, 1,
0.6236904, -0.639741, 4.572777, 0, 0, 0, 1, 1,
0.6250067, -0.3191997, 2.317487, 0, 0, 0, 1, 1,
0.6297036, -0.232092, 0.6984825, 0, 0, 0, 1, 1,
0.63006, -0.789633, 4.02869, 0, 0, 0, 1, 1,
0.6311492, 2.239307, -0.7373023, 0, 0, 0, 1, 1,
0.6323367, -0.2215631, 1.0487, 0, 0, 0, 1, 1,
0.6337562, 0.7362799, 2.414376, 1, 1, 1, 1, 1,
0.6343285, -0.9893796, 2.454303, 1, 1, 1, 1, 1,
0.6345877, -1.994342, 4.101457, 1, 1, 1, 1, 1,
0.6360822, -0.2360475, 1.02065, 1, 1, 1, 1, 1,
0.6376079, 0.291064, 0.4135896, 1, 1, 1, 1, 1,
0.6413345, -0.1528793, 1.467596, 1, 1, 1, 1, 1,
0.6445889, 0.5742026, 0.5041354, 1, 1, 1, 1, 1,
0.6501275, -0.07916009, 1.573856, 1, 1, 1, 1, 1,
0.6506169, 0.7146053, 3.013361, 1, 1, 1, 1, 1,
0.6514292, -0.5956096, 2.525387, 1, 1, 1, 1, 1,
0.6524562, 1.726442, 3.230663, 1, 1, 1, 1, 1,
0.6538241, 0.7535188, 1.9858, 1, 1, 1, 1, 1,
0.655865, -1.151534, 3.780147, 1, 1, 1, 1, 1,
0.6560115, -1.134882, 1.911554, 1, 1, 1, 1, 1,
0.6563471, 0.5438927, 0.7190836, 1, 1, 1, 1, 1,
0.6615847, 0.1459609, 1.017987, 0, 0, 1, 1, 1,
0.6621899, 0.144627, -0.106474, 1, 0, 0, 1, 1,
0.6692944, 0.06753181, 4.017353, 1, 0, 0, 1, 1,
0.6765409, 1.332776, -1.369899, 1, 0, 0, 1, 1,
0.6833355, 1.865921, -0.08999584, 1, 0, 0, 1, 1,
0.685705, 1.00762, 0.6553597, 1, 0, 0, 1, 1,
0.6900372, 0.5110235, 1.072192, 0, 0, 0, 1, 1,
0.690119, 1.031803, 1.469011, 0, 0, 0, 1, 1,
0.6915329, 0.8755033, 0.8557894, 0, 0, 0, 1, 1,
0.6963274, 0.2631777, 2.526762, 0, 0, 0, 1, 1,
0.6979435, 0.3774758, 1.87855, 0, 0, 0, 1, 1,
0.7009083, 1.472816, -0.2039042, 0, 0, 0, 1, 1,
0.7141794, 1.251316, 1.421259, 0, 0, 0, 1, 1,
0.7147129, 0.01059012, 1.988321, 1, 1, 1, 1, 1,
0.7192068, 0.6281321, -0.1227604, 1, 1, 1, 1, 1,
0.7211989, 0.02211377, 1.319122, 1, 1, 1, 1, 1,
0.7216431, -0.6534642, 2.822893, 1, 1, 1, 1, 1,
0.724978, 0.2017309, 0.9238049, 1, 1, 1, 1, 1,
0.7300171, -0.3525211, 1.624735, 1, 1, 1, 1, 1,
0.732359, 0.6111243, -0.3388886, 1, 1, 1, 1, 1,
0.7324661, 0.76376, -0.5513718, 1, 1, 1, 1, 1,
0.7353632, 1.325591, -0.4909524, 1, 1, 1, 1, 1,
0.7388242, -2.508346, 3.342378, 1, 1, 1, 1, 1,
0.7407383, -1.122737, 3.41929, 1, 1, 1, 1, 1,
0.7430563, -0.2255865, 1.086102, 1, 1, 1, 1, 1,
0.7439137, -0.5053674, -0.377187, 1, 1, 1, 1, 1,
0.7458292, 0.7787491, 1.072804, 1, 1, 1, 1, 1,
0.7555036, 0.7544998, 0.1897509, 1, 1, 1, 1, 1,
0.7582654, -0.7196426, 1.969687, 0, 0, 1, 1, 1,
0.7610085, 1.065923, 0.8904194, 1, 0, 0, 1, 1,
0.7615777, -0.9030017, 3.821736, 1, 0, 0, 1, 1,
0.7658132, -0.9816345, 2.072841, 1, 0, 0, 1, 1,
0.7659574, -0.9883657, 1.229697, 1, 0, 0, 1, 1,
0.7708557, 2.088565, 0.629391, 1, 0, 0, 1, 1,
0.7718221, 0.09459752, 0.6737189, 0, 0, 0, 1, 1,
0.7718486, -0.1704659, 3.366537, 0, 0, 0, 1, 1,
0.7725475, 0.6340187, 2.168085, 0, 0, 0, 1, 1,
0.775308, 1.549013, 0.6269827, 0, 0, 0, 1, 1,
0.7777489, 1.27059, 0.7989145, 0, 0, 0, 1, 1,
0.7837081, 2.81708, 1.430881, 0, 0, 0, 1, 1,
0.7869744, -1.088155, 1.127539, 0, 0, 0, 1, 1,
0.793461, -0.8893464, 1.644519, 1, 1, 1, 1, 1,
0.7937406, 1.14102, 2.664826, 1, 1, 1, 1, 1,
0.7969997, 1.373161, -0.1176448, 1, 1, 1, 1, 1,
0.8009871, -0.1934961, 1.91168, 1, 1, 1, 1, 1,
0.8115941, -0.7116783, 3.034314, 1, 1, 1, 1, 1,
0.8170536, -0.7947254, 1.78925, 1, 1, 1, 1, 1,
0.8282866, -0.1725633, 1.57558, 1, 1, 1, 1, 1,
0.8305398, 2.112, 0.5999467, 1, 1, 1, 1, 1,
0.8414423, -0.8054293, 1.295113, 1, 1, 1, 1, 1,
0.8537083, 1.138146, 1.486977, 1, 1, 1, 1, 1,
0.8578253, 0.01251075, 0.7689416, 1, 1, 1, 1, 1,
0.859103, 0.5694084, 0.986861, 1, 1, 1, 1, 1,
0.8605953, 0.1866484, 0.872305, 1, 1, 1, 1, 1,
0.8637975, 0.8140737, 1.25294, 1, 1, 1, 1, 1,
0.8677331, -1.47146, 3.183957, 1, 1, 1, 1, 1,
0.8765538, -0.6455773, 2.919467, 0, 0, 1, 1, 1,
0.8821644, -0.7320042, 3.040281, 1, 0, 0, 1, 1,
0.8842347, 0.5071815, 0.806586, 1, 0, 0, 1, 1,
0.8863408, -0.1399442, 2.338749, 1, 0, 0, 1, 1,
0.8863762, -0.683854, 0.9344093, 1, 0, 0, 1, 1,
0.8925115, -1.283401, 2.648687, 1, 0, 0, 1, 1,
0.8987514, 0.004304079, 1.402979, 0, 0, 0, 1, 1,
0.8995482, -0.2414895, 1.056418, 0, 0, 0, 1, 1,
0.9005085, -0.5816786, 2.673744, 0, 0, 0, 1, 1,
0.9007125, 0.1400474, 1.692013, 0, 0, 0, 1, 1,
0.9048256, -2.539541, 3.46645, 0, 0, 0, 1, 1,
0.9049891, 0.7209908, 2.186085, 0, 0, 0, 1, 1,
0.9063689, 0.3400576, 0.9888732, 0, 0, 0, 1, 1,
0.906873, -0.2273878, 1.565795, 1, 1, 1, 1, 1,
0.9146715, -0.4896881, 1.967913, 1, 1, 1, 1, 1,
0.915746, -1.397013, 2.951997, 1, 1, 1, 1, 1,
0.916591, 1.380605, 0.03796679, 1, 1, 1, 1, 1,
0.9193026, -1.040163, 0.7828668, 1, 1, 1, 1, 1,
0.9201733, -1.420857, 0.8632984, 1, 1, 1, 1, 1,
0.9219841, 0.8051375, -0.09063119, 1, 1, 1, 1, 1,
0.9274483, 1.317527, 0.5375286, 1, 1, 1, 1, 1,
0.9288105, 2.10956, 0.2966694, 1, 1, 1, 1, 1,
0.9362414, -0.2250143, 2.962158, 1, 1, 1, 1, 1,
0.9449995, -0.02801773, 0.9171932, 1, 1, 1, 1, 1,
0.9455272, 0.528066, 2.341952, 1, 1, 1, 1, 1,
0.9468187, 0.03379442, 1.778462, 1, 1, 1, 1, 1,
0.9538608, 0.05643076, 1.015126, 1, 1, 1, 1, 1,
0.9653443, 0.5038534, 1.89893, 1, 1, 1, 1, 1,
0.9685052, 1.40196, 1.026748, 0, 0, 1, 1, 1,
0.9700202, 0.55022, 0.9169165, 1, 0, 0, 1, 1,
0.9758315, -1.35865, 1.780706, 1, 0, 0, 1, 1,
0.9807449, 0.3977296, 1.10804, 1, 0, 0, 1, 1,
0.9860961, -0.08226899, 1.466515, 1, 0, 0, 1, 1,
1.009163, 0.7223435, 0.3198669, 1, 0, 0, 1, 1,
1.017164, 0.8703514, 2.175858, 0, 0, 0, 1, 1,
1.019782, -0.8222057, 1.098205, 0, 0, 0, 1, 1,
1.024794, -0.5350854, 1.864509, 0, 0, 0, 1, 1,
1.028105, 0.03221091, 2.102503, 0, 0, 0, 1, 1,
1.036158, -0.1677818, 1.464919, 0, 0, 0, 1, 1,
1.045738, 1.774824, -0.2170881, 0, 0, 0, 1, 1,
1.048841, -0.720525, 0.5973856, 0, 0, 0, 1, 1,
1.049138, -0.6011918, 2.785558, 1, 1, 1, 1, 1,
1.050247, -1.37693, 2.745249, 1, 1, 1, 1, 1,
1.051829, 0.1123471, 1.001826, 1, 1, 1, 1, 1,
1.05214, 0.6439877, 1.039207, 1, 1, 1, 1, 1,
1.054137, 1.018556, 0.4460923, 1, 1, 1, 1, 1,
1.057084, 0.3314403, 0.5142907, 1, 1, 1, 1, 1,
1.058455, -0.04637076, 1.440914, 1, 1, 1, 1, 1,
1.064684, -0.2731324, 3.183281, 1, 1, 1, 1, 1,
1.068902, -1.727874, 3.710933, 1, 1, 1, 1, 1,
1.070456, 2.678333, 0.7401587, 1, 1, 1, 1, 1,
1.072388, -0.8717101, 2.830474, 1, 1, 1, 1, 1,
1.079543, 0.3866515, 2.52974, 1, 1, 1, 1, 1,
1.080427, -0.8086394, 1.847402, 1, 1, 1, 1, 1,
1.082457, 0.2650879, 2.412418, 1, 1, 1, 1, 1,
1.083314, 0.7903789, 0.2183907, 1, 1, 1, 1, 1,
1.085396, -1.199924, 3.317819, 0, 0, 1, 1, 1,
1.08674, 0.4458022, 1.296478, 1, 0, 0, 1, 1,
1.099622, -0.01045674, 0.1396182, 1, 0, 0, 1, 1,
1.103419, 0.6715225, 2.30678, 1, 0, 0, 1, 1,
1.108761, -1.965531, 3.979827, 1, 0, 0, 1, 1,
1.109788, -0.1587142, 2.991303, 1, 0, 0, 1, 1,
1.120712, 0.8132908, 1.588871, 0, 0, 0, 1, 1,
1.1248, 1.057076, 1.29448, 0, 0, 0, 1, 1,
1.126196, -2.266597, 1.416789, 0, 0, 0, 1, 1,
1.128111, 0.1834496, 1.149391, 0, 0, 0, 1, 1,
1.128169, 0.541707, 1.239131, 0, 0, 0, 1, 1,
1.128708, 2.293621, -0.4993884, 0, 0, 0, 1, 1,
1.132005, -2.792222, -0.2534342, 0, 0, 0, 1, 1,
1.13369, 0.9171358, 1.941228, 1, 1, 1, 1, 1,
1.137071, 0.9898884, -0.2173152, 1, 1, 1, 1, 1,
1.141437, 0.1481106, 0.6345741, 1, 1, 1, 1, 1,
1.145365, -1.365153, 3.71028, 1, 1, 1, 1, 1,
1.148989, 0.1664346, 0.3986182, 1, 1, 1, 1, 1,
1.159558, 0.3658752, 0.5525423, 1, 1, 1, 1, 1,
1.175787, 1.427443, 1.720706, 1, 1, 1, 1, 1,
1.189368, -1.113485, 2.871278, 1, 1, 1, 1, 1,
1.194257, 0.4592908, 1.235789, 1, 1, 1, 1, 1,
1.202168, -0.5774241, 1.805347, 1, 1, 1, 1, 1,
1.20985, -1.062447, 3.433763, 1, 1, 1, 1, 1,
1.212467, 1.118702, 0.1216105, 1, 1, 1, 1, 1,
1.225711, -3.113241, 2.127076, 1, 1, 1, 1, 1,
1.228469, -0.0403455, 1.073766, 1, 1, 1, 1, 1,
1.229695, -0.6182701, 2.131052, 1, 1, 1, 1, 1,
1.238989, -1.235219, 1.829288, 0, 0, 1, 1, 1,
1.243369, 1.889578, -0.2804379, 1, 0, 0, 1, 1,
1.248978, 1.465827, 2.375282, 1, 0, 0, 1, 1,
1.250304, 0.6290758, 1.699779, 1, 0, 0, 1, 1,
1.256556, 0.6029229, 0.9257075, 1, 0, 0, 1, 1,
1.267708, -1.024775, 2.410819, 1, 0, 0, 1, 1,
1.292264, 1.630325, 0.7842643, 0, 0, 0, 1, 1,
1.292581, 0.493392, 2.297258, 0, 0, 0, 1, 1,
1.296919, -0.5449181, 2.751139, 0, 0, 0, 1, 1,
1.299478, -0.4572525, -0.08902863, 0, 0, 0, 1, 1,
1.301108, 0.04587482, 0.3181304, 0, 0, 0, 1, 1,
1.301114, 0.6286047, 1.608297, 0, 0, 0, 1, 1,
1.308448, 0.3883801, 0.9231622, 0, 0, 0, 1, 1,
1.320712, 0.09944649, 3.479962, 1, 1, 1, 1, 1,
1.323214, 0.5002187, -0.2083387, 1, 1, 1, 1, 1,
1.327249, -0.1134958, 3.162797, 1, 1, 1, 1, 1,
1.331744, -0.4454104, 2.829496, 1, 1, 1, 1, 1,
1.344614, 1.47404, 0.1297842, 1, 1, 1, 1, 1,
1.345625, 2.530889, -1.054096, 1, 1, 1, 1, 1,
1.345829, -0.1745047, 2.770344, 1, 1, 1, 1, 1,
1.346844, -0.2043592, 0.7736501, 1, 1, 1, 1, 1,
1.34766, -0.7144859, 1.28697, 1, 1, 1, 1, 1,
1.347787, 0.5822504, 0.7453409, 1, 1, 1, 1, 1,
1.357046, 0.2985384, 0.5892762, 1, 1, 1, 1, 1,
1.360254, 0.2947918, 1.337471, 1, 1, 1, 1, 1,
1.364647, 0.147937, 1.189197, 1, 1, 1, 1, 1,
1.364916, -1.087364, 1.850813, 1, 1, 1, 1, 1,
1.365825, -0.3676142, 1.290247, 1, 1, 1, 1, 1,
1.367239, 0.4598271, 0.2477677, 0, 0, 1, 1, 1,
1.368834, -1.028764, 1.758515, 1, 0, 0, 1, 1,
1.384373, 0.1974686, 1.196321, 1, 0, 0, 1, 1,
1.389613, -1.688479, 0.5732033, 1, 0, 0, 1, 1,
1.391827, 1.938533, 2.336958, 1, 0, 0, 1, 1,
1.392504, 0.1771744, -0.364437, 1, 0, 0, 1, 1,
1.396876, 0.2621717, 1.092603, 0, 0, 0, 1, 1,
1.405182, 0.825831, 0.4911935, 0, 0, 0, 1, 1,
1.409333, -0.3474089, 2.23969, 0, 0, 0, 1, 1,
1.413651, 1.220675, -0.5933034, 0, 0, 0, 1, 1,
1.41441, -0.0422162, 1.48111, 0, 0, 0, 1, 1,
1.42303, 1.28993, -0.04683977, 0, 0, 0, 1, 1,
1.42658, -0.7630238, 1.172515, 0, 0, 0, 1, 1,
1.43595, 0.3015465, -0.2341433, 1, 1, 1, 1, 1,
1.449415, 1.064208, 1.649904, 1, 1, 1, 1, 1,
1.473626, -0.1066976, 1.670682, 1, 1, 1, 1, 1,
1.479782, -0.3533362, 1.313531, 1, 1, 1, 1, 1,
1.48165, -1.299431, 1.61887, 1, 1, 1, 1, 1,
1.502116, -0.9010018, 1.786805, 1, 1, 1, 1, 1,
1.502797, 0.3590466, 2.864372, 1, 1, 1, 1, 1,
1.507568, -0.1194899, 0.3034092, 1, 1, 1, 1, 1,
1.508827, 0.9454728, 1.710394, 1, 1, 1, 1, 1,
1.509997, 0.6436499, -0.6343276, 1, 1, 1, 1, 1,
1.510332, -1.003182, 2.236684, 1, 1, 1, 1, 1,
1.54204, 0.9821608, 1.510515, 1, 1, 1, 1, 1,
1.54549, -0.737846, 2.426329, 1, 1, 1, 1, 1,
1.546955, 1.689165, 2.374041, 1, 1, 1, 1, 1,
1.562705, -0.5780833, 2.146565, 1, 1, 1, 1, 1,
1.566751, 0.3424592, 1.913347, 0, 0, 1, 1, 1,
1.58716, -0.2286708, 1.062199, 1, 0, 0, 1, 1,
1.602363, -1.685656, 2.394017, 1, 0, 0, 1, 1,
1.610547, 0.2417768, 2.376286, 1, 0, 0, 1, 1,
1.618233, -1.86092, 3.320008, 1, 0, 0, 1, 1,
1.621563, -1.828455, 1.920175, 1, 0, 0, 1, 1,
1.635471, -1.223544, 1.899477, 0, 0, 0, 1, 1,
1.644302, -1.477037, 1.763929, 0, 0, 0, 1, 1,
1.665674, 1.472682, 0.8590075, 0, 0, 0, 1, 1,
1.692342, 0.5483345, 2.147964, 0, 0, 0, 1, 1,
1.700053, 0.5806629, 2.116669, 0, 0, 0, 1, 1,
1.702766, 1.345544, 3.130831, 0, 0, 0, 1, 1,
1.744286, 0.6560421, 1.509415, 0, 0, 0, 1, 1,
1.747261, 1.07984, 2.403119, 1, 1, 1, 1, 1,
1.747542, -0.6917356, 3.09055, 1, 1, 1, 1, 1,
1.748709, 0.1772059, 2.423354, 1, 1, 1, 1, 1,
1.753458, 0.03202902, 1.813434, 1, 1, 1, 1, 1,
1.754656, 0.540666, 1.72484, 1, 1, 1, 1, 1,
1.755299, 0.2150651, 1.682394, 1, 1, 1, 1, 1,
1.762077, 0.2321461, 0.8752227, 1, 1, 1, 1, 1,
1.795608, -1.33905, 1.219628, 1, 1, 1, 1, 1,
1.796197, -0.4642992, 0.8305868, 1, 1, 1, 1, 1,
1.824902, 1.354396, -1.050553, 1, 1, 1, 1, 1,
1.842421, 0.2941549, -0.4609272, 1, 1, 1, 1, 1,
1.852382, -0.9843482, 2.981599, 1, 1, 1, 1, 1,
1.875119, -0.3592235, 2.308228, 1, 1, 1, 1, 1,
1.914759, 1.517487, -1.741346, 1, 1, 1, 1, 1,
1.923295, -0.4412573, 0.7821401, 1, 1, 1, 1, 1,
1.943086, -0.5256903, 3.085223, 0, 0, 1, 1, 1,
1.99056, 0.2185929, 1.459594, 1, 0, 0, 1, 1,
2.011736, -0.3917021, 2.2746, 1, 0, 0, 1, 1,
2.030786, -0.2281993, 1.065102, 1, 0, 0, 1, 1,
2.049067, -0.472595, 2.032653, 1, 0, 0, 1, 1,
2.050368, -0.3389719, 1.566113, 1, 0, 0, 1, 1,
2.131356, 2.035942, 1.146257, 0, 0, 0, 1, 1,
2.142934, 0.3156315, 0.9977422, 0, 0, 0, 1, 1,
2.146455, -1.044663, 3.004872, 0, 0, 0, 1, 1,
2.158373, -1.021384, 1.822213, 0, 0, 0, 1, 1,
2.181052, 1.050738, 2.235354, 0, 0, 0, 1, 1,
2.281317, 1.14634, 1.145867, 0, 0, 0, 1, 1,
2.315509, 0.07161608, 2.104047, 0, 0, 0, 1, 1,
2.449494, 0.6581845, 2.818229, 1, 1, 1, 1, 1,
2.486217, -2.320759, 2.540165, 1, 1, 1, 1, 1,
2.497059, -0.8174602, 2.35268, 1, 1, 1, 1, 1,
2.514272, 0.2026626, 1.60012, 1, 1, 1, 1, 1,
2.571376, 0.3906139, 1.415714, 1, 1, 1, 1, 1,
2.637141, 0.9478475, 2.333616, 1, 1, 1, 1, 1,
3.013213, -1.301695, 1.985408, 1, 1, 1, 1, 1
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
var radius = 9.398551;
var distance = 33.01201;
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
mvMatrix.translate( -0.02072203, 0.02732801, -0.09536314 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01201);
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