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
-3.205659, -0.8905977, -1.071064, 1, 0, 0, 1,
-3.066948, -0.02010111, -1.859045, 1, 0.007843138, 0, 1,
-3.019878, -0.6310169, -2.098762, 1, 0.01176471, 0, 1,
-2.583313, -0.9329944, -1.932397, 1, 0.01960784, 0, 1,
-2.456316, -0.5355385, -0.7817703, 1, 0.02352941, 0, 1,
-2.426054, -1.366968, -0.9840199, 1, 0.03137255, 0, 1,
-2.376505, 0.2958592, -2.399644, 1, 0.03529412, 0, 1,
-2.345904, 0.9617934, 0.6098496, 1, 0.04313726, 0, 1,
-2.326406, -0.4844771, -2.380881, 1, 0.04705882, 0, 1,
-2.224355, 0.3152652, -2.317541, 1, 0.05490196, 0, 1,
-2.140224, 0.4569525, 1.038089, 1, 0.05882353, 0, 1,
-2.104654, -0.9071648, -3.600285, 1, 0.06666667, 0, 1,
-2.085333, 0.6373667, -1.785024, 1, 0.07058824, 0, 1,
-2.07068, -1.245206, -1.90061, 1, 0.07843138, 0, 1,
-2.03447, 1.165348, -1.846079, 1, 0.08235294, 0, 1,
-1.932383, -0.7446803, -1.725155, 1, 0.09019608, 0, 1,
-1.913652, 0.3292612, -1.102162, 1, 0.09411765, 0, 1,
-1.905167, 0.6862894, -0.7346627, 1, 0.1019608, 0, 1,
-1.904542, -0.2838895, -1.396794, 1, 0.1098039, 0, 1,
-1.903847, -0.2780221, -0.7330858, 1, 0.1137255, 0, 1,
-1.871252, 0.1727654, -1.515567, 1, 0.1215686, 0, 1,
-1.870237, 0.5876249, -0.3014748, 1, 0.1254902, 0, 1,
-1.859126, -0.5202554, -2.280501, 1, 0.1333333, 0, 1,
-1.8557, -0.9617386, -3.553616, 1, 0.1372549, 0, 1,
-1.831158, -0.1008412, -0.4217861, 1, 0.145098, 0, 1,
-1.807695, -0.3748881, -0.9278197, 1, 0.1490196, 0, 1,
-1.805668, -1.622031, -1.532341, 1, 0.1568628, 0, 1,
-1.795967, 0.4825253, -3.040802, 1, 0.1607843, 0, 1,
-1.795204, -0.2318623, -3.535092, 1, 0.1686275, 0, 1,
-1.776891, -0.5300093, -2.502513, 1, 0.172549, 0, 1,
-1.749423, -0.5444965, -2.173576, 1, 0.1803922, 0, 1,
-1.731727, -0.08039697, -2.092869, 1, 0.1843137, 0, 1,
-1.72066, 0.5330052, -2.48681, 1, 0.1921569, 0, 1,
-1.703901, 1.508694, -1.508275, 1, 0.1960784, 0, 1,
-1.69484, -1.691359, -2.586321, 1, 0.2039216, 0, 1,
-1.684129, 0.8124483, -2.163605, 1, 0.2117647, 0, 1,
-1.681491, 1.427366, -2.453038, 1, 0.2156863, 0, 1,
-1.676711, 1.245788, 0.8884115, 1, 0.2235294, 0, 1,
-1.671573, 0.02574777, -1.644166, 1, 0.227451, 0, 1,
-1.649841, 0.3460266, -1.006517, 1, 0.2352941, 0, 1,
-1.649261, -0.246105, -1.081953, 1, 0.2392157, 0, 1,
-1.644175, 1.203252, -0.8637032, 1, 0.2470588, 0, 1,
-1.621589, -0.7209696, -3.937815, 1, 0.2509804, 0, 1,
-1.618059, -0.3057594, -3.799643, 1, 0.2588235, 0, 1,
-1.600049, -0.839587, -3.480489, 1, 0.2627451, 0, 1,
-1.595649, -0.2746797, -1.954983, 1, 0.2705882, 0, 1,
-1.591547, -0.3790862, -1.996756, 1, 0.2745098, 0, 1,
-1.581484, 0.9286619, 1.411975, 1, 0.282353, 0, 1,
-1.580921, -0.21668, -2.373842, 1, 0.2862745, 0, 1,
-1.567907, 0.9805868, -0.8320076, 1, 0.2941177, 0, 1,
-1.548196, -1.038003, -3.042968, 1, 0.3019608, 0, 1,
-1.540107, 0.2079762, -2.09822, 1, 0.3058824, 0, 1,
-1.530117, -1.314813, -2.20431, 1, 0.3137255, 0, 1,
-1.520304, 1.793947, -0.9682485, 1, 0.3176471, 0, 1,
-1.514677, 0.2970709, -2.055455, 1, 0.3254902, 0, 1,
-1.499039, -1.082895, -4.543365, 1, 0.3294118, 0, 1,
-1.487382, -0.2382624, -3.329561, 1, 0.3372549, 0, 1,
-1.474792, -0.2105614, -1.018553, 1, 0.3411765, 0, 1,
-1.467903, -0.1395398, -1.269433, 1, 0.3490196, 0, 1,
-1.465371, -0.06123254, -1.530477, 1, 0.3529412, 0, 1,
-1.46434, -1.592394, -2.124351, 1, 0.3607843, 0, 1,
-1.459446, -0.8774292, -2.325789, 1, 0.3647059, 0, 1,
-1.459028, -1.013376, -0.8826223, 1, 0.372549, 0, 1,
-1.446675, 0.7106231, -1.326246, 1, 0.3764706, 0, 1,
-1.443353, 1.177593, 0.7883662, 1, 0.3843137, 0, 1,
-1.44002, -0.326752, -0.5843841, 1, 0.3882353, 0, 1,
-1.421497, 0.3377602, 0.8582533, 1, 0.3960784, 0, 1,
-1.420901, 0.7240571, -0.6772813, 1, 0.4039216, 0, 1,
-1.418472, 0.3960528, -2.136282, 1, 0.4078431, 0, 1,
-1.418096, -0.4229749, -2.691653, 1, 0.4156863, 0, 1,
-1.413514, 1.379582, -0.4858803, 1, 0.4196078, 0, 1,
-1.411039, -0.7316869, -1.507093, 1, 0.427451, 0, 1,
-1.408377, -0.1390308, -1.675172, 1, 0.4313726, 0, 1,
-1.395939, 1.082705, -1.56389, 1, 0.4392157, 0, 1,
-1.385915, 0.4690198, -1.639298, 1, 0.4431373, 0, 1,
-1.385884, 0.8069039, 0.2911154, 1, 0.4509804, 0, 1,
-1.382886, -0.4450887, -2.057904, 1, 0.454902, 0, 1,
-1.379696, -0.9409775, -2.787549, 1, 0.4627451, 0, 1,
-1.378958, -0.5667177, -0.9520288, 1, 0.4666667, 0, 1,
-1.37831, -0.4877431, -1.719199, 1, 0.4745098, 0, 1,
-1.372872, 0.1837666, -3.394989, 1, 0.4784314, 0, 1,
-1.370178, -0.8708797, -2.406579, 1, 0.4862745, 0, 1,
-1.357643, 0.4128594, -2.409924, 1, 0.4901961, 0, 1,
-1.35239, 0.03680865, 0.5031306, 1, 0.4980392, 0, 1,
-1.347955, -0.8071324, -1.312553, 1, 0.5058824, 0, 1,
-1.331525, -0.5810003, -1.983165, 1, 0.509804, 0, 1,
-1.328626, 1.490102, -0.2450167, 1, 0.5176471, 0, 1,
-1.314983, 0.7667875, -0.7853289, 1, 0.5215687, 0, 1,
-1.29349, -0.6638494, -4.967207, 1, 0.5294118, 0, 1,
-1.290844, -1.172022, -0.5845303, 1, 0.5333334, 0, 1,
-1.290327, -0.5375573, -0.8619579, 1, 0.5411765, 0, 1,
-1.288061, -0.1277052, -0.6289043, 1, 0.5450981, 0, 1,
-1.287535, 0.4339598, -2.203849, 1, 0.5529412, 0, 1,
-1.28739, 1.434891, 0.701873, 1, 0.5568628, 0, 1,
-1.269771, -0.6391901, -1.671704, 1, 0.5647059, 0, 1,
-1.26386, 0.01525856, 0.2532472, 1, 0.5686275, 0, 1,
-1.263065, -1.709704, -2.143807, 1, 0.5764706, 0, 1,
-1.255786, -0.1826753, -2.611573, 1, 0.5803922, 0, 1,
-1.24461, -2.126961, -3.52521, 1, 0.5882353, 0, 1,
-1.236327, -2.124618, -3.341552, 1, 0.5921569, 0, 1,
-1.229462, 0.05466602, -0.250043, 1, 0.6, 0, 1,
-1.228631, -2.245683, -3.061717, 1, 0.6078432, 0, 1,
-1.227052, 0.6026226, 0.3823662, 1, 0.6117647, 0, 1,
-1.220433, 0.4678524, -1.13933, 1, 0.6196079, 0, 1,
-1.211977, -0.2501867, -2.256591, 1, 0.6235294, 0, 1,
-1.208964, -0.7730696, -2.250627, 1, 0.6313726, 0, 1,
-1.20086, 0.3016677, -3.583643, 1, 0.6352941, 0, 1,
-1.197874, 2.075666, -0.9982263, 1, 0.6431373, 0, 1,
-1.19786, -0.7405763, -0.3452258, 1, 0.6470588, 0, 1,
-1.194642, 0.4359157, -0.6270376, 1, 0.654902, 0, 1,
-1.193385, 0.02095855, -2.143165, 1, 0.6588235, 0, 1,
-1.187047, -0.08000063, -2.062219, 1, 0.6666667, 0, 1,
-1.186156, 0.7599807, -0.2894918, 1, 0.6705883, 0, 1,
-1.182112, -1.984918, -0.713328, 1, 0.6784314, 0, 1,
-1.177888, -0.06849921, -1.608703, 1, 0.682353, 0, 1,
-1.171862, -1.295773, -3.253127, 1, 0.6901961, 0, 1,
-1.169912, 0.7935439, -0.5950474, 1, 0.6941177, 0, 1,
-1.164694, -0.4602804, -1.136006, 1, 0.7019608, 0, 1,
-1.164443, -0.5310104, -3.315356, 1, 0.7098039, 0, 1,
-1.159358, -1.060697, -2.889357, 1, 0.7137255, 0, 1,
-1.157524, 0.756224, 0.3154507, 1, 0.7215686, 0, 1,
-1.153224, -0.6630912, -2.215138, 1, 0.7254902, 0, 1,
-1.151312, 1.07133, -2.55959, 1, 0.7333333, 0, 1,
-1.138188, 0.4058025, -0.9935836, 1, 0.7372549, 0, 1,
-1.127381, -1.863469, -1.338573, 1, 0.7450981, 0, 1,
-1.125548, -0.2601652, 0.08302984, 1, 0.7490196, 0, 1,
-1.122404, 1.888627, -1.271252, 1, 0.7568628, 0, 1,
-1.118945, -0.2548045, -2.015601, 1, 0.7607843, 0, 1,
-1.11729, -0.2593651, -2.679982, 1, 0.7686275, 0, 1,
-1.115536, -0.7896467, -1.8305, 1, 0.772549, 0, 1,
-1.115454, -0.06817213, -1.938773, 1, 0.7803922, 0, 1,
-1.11367, -0.4249766, -3.818118, 1, 0.7843137, 0, 1,
-1.112467, -0.705533, -2.327477, 1, 0.7921569, 0, 1,
-1.110191, -1.397152, -1.068314, 1, 0.7960784, 0, 1,
-1.108337, 1.701031, 0.04366067, 1, 0.8039216, 0, 1,
-1.107651, -0.08265319, -3.261738, 1, 0.8117647, 0, 1,
-1.099815, 0.4885485, -1.35202, 1, 0.8156863, 0, 1,
-1.096269, -1.825762, -3.074417, 1, 0.8235294, 0, 1,
-1.095773, 0.2006588, -3.602501, 1, 0.827451, 0, 1,
-1.086284, 0.7228327, -2.474967, 1, 0.8352941, 0, 1,
-1.084148, 0.9189801, -0.4004057, 1, 0.8392157, 0, 1,
-1.082425, -1.004298, -1.715087, 1, 0.8470588, 0, 1,
-1.082359, 1.363938, -2.539202, 1, 0.8509804, 0, 1,
-1.079062, -0.347341, -0.9054549, 1, 0.8588235, 0, 1,
-1.075239, -0.5902706, -1.442379, 1, 0.8627451, 0, 1,
-1.073916, -0.4536125, -2.483919, 1, 0.8705882, 0, 1,
-1.073338, 0.8469267, -0.0811623, 1, 0.8745098, 0, 1,
-1.064715, 0.5341073, -1.727506, 1, 0.8823529, 0, 1,
-1.063087, -0.1113772, -1.393763, 1, 0.8862745, 0, 1,
-1.062269, 0.0446688, -1.458516, 1, 0.8941177, 0, 1,
-1.057565, 0.4581425, 0.0674988, 1, 0.8980392, 0, 1,
-1.053107, -0.3188355, -2.234217, 1, 0.9058824, 0, 1,
-1.049914, 0.868133, -3.735892, 1, 0.9137255, 0, 1,
-1.048996, 0.3500347, -1.213993, 1, 0.9176471, 0, 1,
-1.03972, -0.4996153, -1.049586, 1, 0.9254902, 0, 1,
-1.037164, -0.7654477, -1.236142, 1, 0.9294118, 0, 1,
-1.028931, 1.323332, -2.523402, 1, 0.9372549, 0, 1,
-1.027295, -0.1263431, -1.37009, 1, 0.9411765, 0, 1,
-1.0222, -0.9392816, -0.3157246, 1, 0.9490196, 0, 1,
-1.021625, 0.3346737, -0.9649746, 1, 0.9529412, 0, 1,
-1.010504, -0.05578025, -1.894497, 1, 0.9607843, 0, 1,
-1.010439, -0.1062375, -1.891107, 1, 0.9647059, 0, 1,
-1.007473, -1.109486, -2.146277, 1, 0.972549, 0, 1,
-1.005753, 0.9669738, -0.5045702, 1, 0.9764706, 0, 1,
-1.005204, -1.192461, -2.466797, 1, 0.9843137, 0, 1,
-1.002601, -0.9001936, -3.571964, 1, 0.9882353, 0, 1,
-0.9926366, 0.5488807, -1.063125, 1, 0.9960784, 0, 1,
-0.9922728, -0.8206894, -2.444481, 0.9960784, 1, 0, 1,
-0.9894236, 0.310617, -1.344242, 0.9921569, 1, 0, 1,
-0.9818639, 0.5616701, -1.496332, 0.9843137, 1, 0, 1,
-0.9724965, -1.923203, -3.543796, 0.9803922, 1, 0, 1,
-0.9681674, -2.328845, -3.563465, 0.972549, 1, 0, 1,
-0.964834, -0.1690463, -1.380926, 0.9686275, 1, 0, 1,
-0.9584343, -1.214459, -2.563443, 0.9607843, 1, 0, 1,
-0.9579472, -2.41885, -3.982969, 0.9568627, 1, 0, 1,
-0.9447243, -0.6162876, -1.326138, 0.9490196, 1, 0, 1,
-0.9445676, -2.026966, -1.597109, 0.945098, 1, 0, 1,
-0.937563, -0.531955, -1.623785, 0.9372549, 1, 0, 1,
-0.9365468, 0.7549574, -2.961966, 0.9333333, 1, 0, 1,
-0.9264351, -0.9942985, -2.534071, 0.9254902, 1, 0, 1,
-0.9205613, 1.172107, -0.7266036, 0.9215686, 1, 0, 1,
-0.9189216, 0.23173, -0.144869, 0.9137255, 1, 0, 1,
-0.9182147, -0.7381723, -3.1546, 0.9098039, 1, 0, 1,
-0.9168406, 1.481518, -1.004294, 0.9019608, 1, 0, 1,
-0.9165556, -0.408353, -3.994255, 0.8941177, 1, 0, 1,
-0.9146985, 0.7536806, -1.36066, 0.8901961, 1, 0, 1,
-0.9105774, -0.3018671, -1.16781, 0.8823529, 1, 0, 1,
-0.9102477, 1.717036, -1.704327, 0.8784314, 1, 0, 1,
-0.909739, 0.7914725, -2.035317, 0.8705882, 1, 0, 1,
-0.9018316, -0.1051028, -0.880276, 0.8666667, 1, 0, 1,
-0.8996041, 0.4374638, -0.565231, 0.8588235, 1, 0, 1,
-0.8977479, -0.8066983, 0.09756855, 0.854902, 1, 0, 1,
-0.8972656, 1.451763, -0.9776216, 0.8470588, 1, 0, 1,
-0.8965047, -0.05599669, -1.960823, 0.8431373, 1, 0, 1,
-0.8914337, 1.101811, 0.07654944, 0.8352941, 1, 0, 1,
-0.8731011, 1.075982, 0.03710501, 0.8313726, 1, 0, 1,
-0.8604247, -0.6876407, -1.086071, 0.8235294, 1, 0, 1,
-0.8522564, 1.543108, 0.2346984, 0.8196079, 1, 0, 1,
-0.8468749, -0.4620624, -1.142176, 0.8117647, 1, 0, 1,
-0.8468023, 0.5958312, -1.084934, 0.8078431, 1, 0, 1,
-0.84209, 0.173798, -0.892356, 0.8, 1, 0, 1,
-0.8410419, 0.2546152, -0.1528989, 0.7921569, 1, 0, 1,
-0.8405676, -0.8946375, -1.657624, 0.7882353, 1, 0, 1,
-0.8237054, -1.073961, -2.836854, 0.7803922, 1, 0, 1,
-0.8186152, -0.388831, 0.3907707, 0.7764706, 1, 0, 1,
-0.8083877, 1.634741, 0.8761918, 0.7686275, 1, 0, 1,
-0.8055729, 0.1845914, -0.6228616, 0.7647059, 1, 0, 1,
-0.8051507, -0.2269945, -1.408691, 0.7568628, 1, 0, 1,
-0.8026756, -0.6134546, -3.867402, 0.7529412, 1, 0, 1,
-0.7996953, -0.6828165, -1.499845, 0.7450981, 1, 0, 1,
-0.797622, 0.4390095, -0.9888301, 0.7411765, 1, 0, 1,
-0.7913077, -1.169057, -4.326065, 0.7333333, 1, 0, 1,
-0.7859642, 1.257347, -0.009340611, 0.7294118, 1, 0, 1,
-0.7806445, 0.6357628, -2.564693, 0.7215686, 1, 0, 1,
-0.780413, 0.5253196, -2.772386, 0.7176471, 1, 0, 1,
-0.7800932, 0.03562296, -0.4943959, 0.7098039, 1, 0, 1,
-0.7751138, 0.7594907, -2.218943, 0.7058824, 1, 0, 1,
-0.7715756, -0.8025979, -1.314952, 0.6980392, 1, 0, 1,
-0.7679496, -2.172995, -4.998102, 0.6901961, 1, 0, 1,
-0.7596174, -0.9045231, -2.883634, 0.6862745, 1, 0, 1,
-0.759615, -0.9805618, -3.000523, 0.6784314, 1, 0, 1,
-0.758997, 0.5827409, 0.3397095, 0.6745098, 1, 0, 1,
-0.7520531, 0.07184758, -1.967217, 0.6666667, 1, 0, 1,
-0.7497991, -2.705333, -2.523376, 0.6627451, 1, 0, 1,
-0.7477781, 0.5418894, -1.545192, 0.654902, 1, 0, 1,
-0.7450591, 0.6543863, -2.386147, 0.6509804, 1, 0, 1,
-0.7383327, 1.761274, 1.317376, 0.6431373, 1, 0, 1,
-0.7321073, 1.455476, 0.4026052, 0.6392157, 1, 0, 1,
-0.7299098, -0.3429336, -0.4148605, 0.6313726, 1, 0, 1,
-0.7266018, 1.127329, -0.1249801, 0.627451, 1, 0, 1,
-0.7240338, 0.1187106, -1.259528, 0.6196079, 1, 0, 1,
-0.7221626, -0.7118403, -2.141517, 0.6156863, 1, 0, 1,
-0.7188276, 0.2761571, -0.8219903, 0.6078432, 1, 0, 1,
-0.7174417, 0.6318209, -1.016251, 0.6039216, 1, 0, 1,
-0.7066925, -0.6667557, -3.498568, 0.5960785, 1, 0, 1,
-0.7010878, 0.3482443, -1.541122, 0.5882353, 1, 0, 1,
-0.6982689, 0.7903152, -0.3082524, 0.5843138, 1, 0, 1,
-0.6961074, 1.317586, -2.11324, 0.5764706, 1, 0, 1,
-0.6928184, -1.487265, -1.924512, 0.572549, 1, 0, 1,
-0.689923, 1.387727, -2.186503, 0.5647059, 1, 0, 1,
-0.6891589, -0.1567553, -1.092253, 0.5607843, 1, 0, 1,
-0.6878618, 0.8990248, 0.3873607, 0.5529412, 1, 0, 1,
-0.6877122, 0.2113071, -0.3470663, 0.5490196, 1, 0, 1,
-0.6836458, -0.01270224, -3.218122, 0.5411765, 1, 0, 1,
-0.6831642, -1.325576, -1.996909, 0.5372549, 1, 0, 1,
-0.6826583, 1.57478, -1.458467, 0.5294118, 1, 0, 1,
-0.6740603, -0.6023083, -1.749379, 0.5254902, 1, 0, 1,
-0.6734133, 0.2268092, -0.6349002, 0.5176471, 1, 0, 1,
-0.6705753, 1.194496, -0.6194317, 0.5137255, 1, 0, 1,
-0.6663661, -0.1143857, -1.787675, 0.5058824, 1, 0, 1,
-0.6555283, 0.3356673, -1.061561, 0.5019608, 1, 0, 1,
-0.6554963, 1.611591, -1.623476, 0.4941176, 1, 0, 1,
-0.6522976, 1.127672, -0.7007036, 0.4862745, 1, 0, 1,
-0.6438554, -1.252899, -2.295962, 0.4823529, 1, 0, 1,
-0.6392565, 1.770644, 1.829794, 0.4745098, 1, 0, 1,
-0.634674, 0.7641497, -2.640851, 0.4705882, 1, 0, 1,
-0.6282, 1.14825, -0.2357654, 0.4627451, 1, 0, 1,
-0.6256695, 1.808019, -0.9765223, 0.4588235, 1, 0, 1,
-0.6256147, -0.4096307, -2.173652, 0.4509804, 1, 0, 1,
-0.6253021, -2.352373, -3.083092, 0.4470588, 1, 0, 1,
-0.62326, 0.2794836, -2.477332, 0.4392157, 1, 0, 1,
-0.6185094, -0.8629263, -1.701373, 0.4352941, 1, 0, 1,
-0.6176197, -0.3308622, -2.591271, 0.427451, 1, 0, 1,
-0.6151051, 0.578608, -1.052868, 0.4235294, 1, 0, 1,
-0.6089399, -1.453755, -3.596759, 0.4156863, 1, 0, 1,
-0.6028273, -1.076854, -2.325318, 0.4117647, 1, 0, 1,
-0.6005759, -1.018165, -4.031537, 0.4039216, 1, 0, 1,
-0.5981686, -0.9992204, -2.810413, 0.3960784, 1, 0, 1,
-0.5967641, -0.9137247, -1.364074, 0.3921569, 1, 0, 1,
-0.5947088, 0.04550584, -3.777145, 0.3843137, 1, 0, 1,
-0.5935227, 0.06632407, -1.853279, 0.3803922, 1, 0, 1,
-0.5895607, 0.09032718, -0.221718, 0.372549, 1, 0, 1,
-0.588573, -1.163338, -3.503171, 0.3686275, 1, 0, 1,
-0.5814783, 0.2359198, -0.7077011, 0.3607843, 1, 0, 1,
-0.580142, -0.6100642, -3.539833, 0.3568628, 1, 0, 1,
-0.5800777, 0.2090518, -0.4682106, 0.3490196, 1, 0, 1,
-0.5777472, 0.1902438, -1.229107, 0.345098, 1, 0, 1,
-0.5746532, 0.8357193, -1.4878, 0.3372549, 1, 0, 1,
-0.5745864, -0.2209165, -1.712748, 0.3333333, 1, 0, 1,
-0.5687026, 0.7220607, -0.0208206, 0.3254902, 1, 0, 1,
-0.5686622, 1.373033, -0.5909333, 0.3215686, 1, 0, 1,
-0.5684044, 1.480588, -1.089066, 0.3137255, 1, 0, 1,
-0.5683201, 0.9155145, 0.9873877, 0.3098039, 1, 0, 1,
-0.5657771, -0.2200221, -0.2535414, 0.3019608, 1, 0, 1,
-0.5636421, 1.305737, -0.8708386, 0.2941177, 1, 0, 1,
-0.5616665, 1.429109, -1.123233, 0.2901961, 1, 0, 1,
-0.5612943, 0.4449212, -1.284507, 0.282353, 1, 0, 1,
-0.5544415, -0.09843982, -1.518815, 0.2784314, 1, 0, 1,
-0.553332, -0.8861599, -1.461055, 0.2705882, 1, 0, 1,
-0.5491115, -0.2815363, -5.135869, 0.2666667, 1, 0, 1,
-0.5467761, 0.3264726, -1.836439, 0.2588235, 1, 0, 1,
-0.5443765, -0.3069513, -1.5357, 0.254902, 1, 0, 1,
-0.5430111, 0.1145719, -2.944438, 0.2470588, 1, 0, 1,
-0.5406077, -0.1658454, -2.302187, 0.2431373, 1, 0, 1,
-0.531477, 0.07723103, -1.305537, 0.2352941, 1, 0, 1,
-0.5308148, -0.4508339, -2.732992, 0.2313726, 1, 0, 1,
-0.5282323, 0.9754377, -0.5201992, 0.2235294, 1, 0, 1,
-0.5266088, 0.8159792, -1.793331, 0.2196078, 1, 0, 1,
-0.5198771, -0.1414296, -2.84605, 0.2117647, 1, 0, 1,
-0.5178743, 1.530597, -1.989587, 0.2078431, 1, 0, 1,
-0.5141432, -1.061635, -2.094486, 0.2, 1, 0, 1,
-0.511181, 0.1358822, 0.5646867, 0.1921569, 1, 0, 1,
-0.5095927, 0.1373813, -1.946364, 0.1882353, 1, 0, 1,
-0.5079608, 0.6184802, -0.4506869, 0.1803922, 1, 0, 1,
-0.4939658, 2.577714, -0.08479433, 0.1764706, 1, 0, 1,
-0.4840118, 0.8322852, 0.1474667, 0.1686275, 1, 0, 1,
-0.4826511, -0.5161921, 0.3549741, 0.1647059, 1, 0, 1,
-0.4612755, -1.116519, -2.82713, 0.1568628, 1, 0, 1,
-0.455519, 0.8841264, 0.000907701, 0.1529412, 1, 0, 1,
-0.4531902, 0.3757711, -2.226682, 0.145098, 1, 0, 1,
-0.4517247, -0.7699652, 0.3163843, 0.1411765, 1, 0, 1,
-0.441081, -0.1544905, -1.939961, 0.1333333, 1, 0, 1,
-0.4399195, 0.2154422, -3.063023, 0.1294118, 1, 0, 1,
-0.4393402, 0.3476177, -0.5808401, 0.1215686, 1, 0, 1,
-0.4359964, 0.2506353, 0.01406621, 0.1176471, 1, 0, 1,
-0.4252297, -1.168168, -3.945029, 0.1098039, 1, 0, 1,
-0.4207524, -0.7074584, -1.315587, 0.1058824, 1, 0, 1,
-0.4205633, 2.192091, -0.4452908, 0.09803922, 1, 0, 1,
-0.4192766, -0.9601995, -2.857914, 0.09019608, 1, 0, 1,
-0.4147557, -1.303037, -3.067554, 0.08627451, 1, 0, 1,
-0.4115469, -0.3169127, -1.752643, 0.07843138, 1, 0, 1,
-0.4099535, -1.14527, -3.613407, 0.07450981, 1, 0, 1,
-0.4097475, 0.5826698, 1.499575, 0.06666667, 1, 0, 1,
-0.4096636, -1.016198, -4.984644, 0.0627451, 1, 0, 1,
-0.4090626, -0.1553908, -2.29422, 0.05490196, 1, 0, 1,
-0.409043, -0.2381223, -1.735501, 0.05098039, 1, 0, 1,
-0.4086125, 2.137709, 0.580284, 0.04313726, 1, 0, 1,
-0.4066799, -1.163664, -2.213805, 0.03921569, 1, 0, 1,
-0.4041086, -0.6239769, -2.297027, 0.03137255, 1, 0, 1,
-0.396724, -0.8371079, -3.78772, 0.02745098, 1, 0, 1,
-0.3959526, -1.001922, -3.769815, 0.01960784, 1, 0, 1,
-0.3945503, -1.29135, -2.147718, 0.01568628, 1, 0, 1,
-0.3939846, 0.2115237, -1.887756, 0.007843138, 1, 0, 1,
-0.3914767, 1.18021, -1.168049, 0.003921569, 1, 0, 1,
-0.3902451, -1.261731, -3.212373, 0, 1, 0.003921569, 1,
-0.380644, 0.648784, -0.479549, 0, 1, 0.01176471, 1,
-0.3790294, -1.109475, -2.719358, 0, 1, 0.01568628, 1,
-0.3770472, -0.7449402, -4.848349, 0, 1, 0.02352941, 1,
-0.3744341, 1.070509, -0.6432232, 0, 1, 0.02745098, 1,
-0.3722809, 1.246265, -0.3197659, 0, 1, 0.03529412, 1,
-0.3700519, 0.07244135, -2.137973, 0, 1, 0.03921569, 1,
-0.3697755, -0.002436349, -0.7768826, 0, 1, 0.04705882, 1,
-0.3631684, -2.611362, -2.762791, 0, 1, 0.05098039, 1,
-0.35675, 0.4361824, 1.037284, 0, 1, 0.05882353, 1,
-0.3562901, -0.6701515, -2.811936, 0, 1, 0.0627451, 1,
-0.3542488, 0.9826027, 0.2169302, 0, 1, 0.07058824, 1,
-0.3528582, 0.4849457, -1.351246, 0, 1, 0.07450981, 1,
-0.3415309, -0.1777608, -1.374394, 0, 1, 0.08235294, 1,
-0.3347203, -0.7398885, -2.67494, 0, 1, 0.08627451, 1,
-0.3337998, -1.730736, -1.430805, 0, 1, 0.09411765, 1,
-0.3316314, 0.4043932, -1.547867, 0, 1, 0.1019608, 1,
-0.3307755, -0.7854675, -3.018768, 0, 1, 0.1058824, 1,
-0.3296212, -0.6713361, -2.35097, 0, 1, 0.1137255, 1,
-0.3268624, 0.3127317, -1.817922, 0, 1, 0.1176471, 1,
-0.2992153, 1.066545, -2.576014, 0, 1, 0.1254902, 1,
-0.2974787, 0.7614236, 0.7486246, 0, 1, 0.1294118, 1,
-0.2949557, 1.133547, -1.726456, 0, 1, 0.1372549, 1,
-0.2937312, 0.5313234, 0.5196248, 0, 1, 0.1411765, 1,
-0.2897365, -0.6428804, -2.332316, 0, 1, 0.1490196, 1,
-0.2836361, -1.217223, -2.199283, 0, 1, 0.1529412, 1,
-0.2751974, 1.141934, -0.7592384, 0, 1, 0.1607843, 1,
-0.2642837, 0.3990203, -1.433305, 0, 1, 0.1647059, 1,
-0.2613267, -1.014201, -3.827487, 0, 1, 0.172549, 1,
-0.2597711, 0.4565697, -1.120444, 0, 1, 0.1764706, 1,
-0.25752, -0.3582519, -3.405318, 0, 1, 0.1843137, 1,
-0.2567771, -1.804855, -1.869498, 0, 1, 0.1882353, 1,
-0.2556557, -2.250183, -0.9247985, 0, 1, 0.1960784, 1,
-0.2536226, -0.354398, -2.125854, 0, 1, 0.2039216, 1,
-0.2530802, 0.5376031, 1.216681, 0, 1, 0.2078431, 1,
-0.2496414, -0.1071648, -2.344175, 0, 1, 0.2156863, 1,
-0.2462596, 0.5767592, 0.5391758, 0, 1, 0.2196078, 1,
-0.2448875, 0.8756025, 0.3578337, 0, 1, 0.227451, 1,
-0.2426167, 1.984591, 0.04334727, 0, 1, 0.2313726, 1,
-0.2384629, -0.17866, -1.269393, 0, 1, 0.2392157, 1,
-0.2364794, 0.2427329, 0.03283489, 0, 1, 0.2431373, 1,
-0.2357487, -0.9498615, -2.099942, 0, 1, 0.2509804, 1,
-0.2348177, -1.489996, -4.102509, 0, 1, 0.254902, 1,
-0.232781, 1.174657, -0.223008, 0, 1, 0.2627451, 1,
-0.2324226, -0.8042238, -3.275713, 0, 1, 0.2666667, 1,
-0.2311547, 1.279464, -2.374769, 0, 1, 0.2745098, 1,
-0.2294082, -0.7465593, -4.074401, 0, 1, 0.2784314, 1,
-0.2271115, 0.2896342, 0.8482395, 0, 1, 0.2862745, 1,
-0.2139043, -0.2205016, -3.362107, 0, 1, 0.2901961, 1,
-0.2125835, 0.7012452, 0.5576282, 0, 1, 0.2980392, 1,
-0.2124368, 0.4894962, -0.6156526, 0, 1, 0.3058824, 1,
-0.2119366, 0.4644158, -1.796259, 0, 1, 0.3098039, 1,
-0.2107911, -0.1139231, -3.717968, 0, 1, 0.3176471, 1,
-0.2100901, 0.3061633, -0.9129216, 0, 1, 0.3215686, 1,
-0.2096488, 1.150541, -0.1822424, 0, 1, 0.3294118, 1,
-0.2072835, -0.3459345, -2.520377, 0, 1, 0.3333333, 1,
-0.2071095, 0.1845013, -1.216433, 0, 1, 0.3411765, 1,
-0.2054326, -0.1074553, -2.947435, 0, 1, 0.345098, 1,
-0.2052216, 0.4645128, -0.5064588, 0, 1, 0.3529412, 1,
-0.2027276, 0.8421097, 0.8346529, 0, 1, 0.3568628, 1,
-0.1937083, -1.262344, -3.900812, 0, 1, 0.3647059, 1,
-0.1934601, 1.403675, -1.620874, 0, 1, 0.3686275, 1,
-0.1903751, -0.3039539, -3.811032, 0, 1, 0.3764706, 1,
-0.1830407, 1.67441, 0.2089142, 0, 1, 0.3803922, 1,
-0.1827265, -0.01064804, -1.372263, 0, 1, 0.3882353, 1,
-0.1792866, 0.2046736, -0.7871228, 0, 1, 0.3921569, 1,
-0.1781978, -1.867822, -3.611062, 0, 1, 0.4, 1,
-0.1781097, 0.5600779, -0.9539281, 0, 1, 0.4078431, 1,
-0.1763084, 0.1020658, -0.7230046, 0, 1, 0.4117647, 1,
-0.1752421, 0.457858, -1.362122, 0, 1, 0.4196078, 1,
-0.1711127, 0.6585131, 0.7697331, 0, 1, 0.4235294, 1,
-0.1705268, 0.3719739, -0.3598792, 0, 1, 0.4313726, 1,
-0.1700953, 0.2062336, 0.3550257, 0, 1, 0.4352941, 1,
-0.1688768, 0.9262791, 0.1615885, 0, 1, 0.4431373, 1,
-0.1611719, -0.6583815, -1.290703, 0, 1, 0.4470588, 1,
-0.1560664, -1.107212, -2.877959, 0, 1, 0.454902, 1,
-0.1551581, -0.7229562, -3.813497, 0, 1, 0.4588235, 1,
-0.1510156, -1.224115, -1.387128, 0, 1, 0.4666667, 1,
-0.1467663, 0.1766762, -0.5967127, 0, 1, 0.4705882, 1,
-0.1458811, 0.5016498, 0.4468382, 0, 1, 0.4784314, 1,
-0.1456333, -2.036145, -2.492517, 0, 1, 0.4823529, 1,
-0.1430862, -0.2129757, -0.7153847, 0, 1, 0.4901961, 1,
-0.1370973, -2.110185, -2.66607, 0, 1, 0.4941176, 1,
-0.1350626, -1.929035, -1.950707, 0, 1, 0.5019608, 1,
-0.1346531, -0.1249487, -1.409113, 0, 1, 0.509804, 1,
-0.1322926, 0.5780927, 0.5370669, 0, 1, 0.5137255, 1,
-0.1322219, -0.5991247, -2.877913, 0, 1, 0.5215687, 1,
-0.1312093, 0.4550306, -0.7971755, 0, 1, 0.5254902, 1,
-0.1276123, -0.7585337, -2.287603, 0, 1, 0.5333334, 1,
-0.1241448, 1.069096, 1.246194, 0, 1, 0.5372549, 1,
-0.1209905, -0.7368668, -3.453852, 0, 1, 0.5450981, 1,
-0.1203725, 2.146982, 1.872509, 0, 1, 0.5490196, 1,
-0.1052699, -0.5196714, -2.330916, 0, 1, 0.5568628, 1,
-0.1038973, 1.41613, 1.051416, 0, 1, 0.5607843, 1,
-0.1011269, -1.102334, -4.432845, 0, 1, 0.5686275, 1,
-0.0945909, 1.641158, -0.3659889, 0, 1, 0.572549, 1,
-0.09439642, -0.3702515, -2.936419, 0, 1, 0.5803922, 1,
-0.09332024, -0.5459796, -2.480445, 0, 1, 0.5843138, 1,
-0.09279649, -1.347445, -2.937737, 0, 1, 0.5921569, 1,
-0.09195212, 0.8210354, -0.9730116, 0, 1, 0.5960785, 1,
-0.08975091, -0.6755726, -3.724339, 0, 1, 0.6039216, 1,
-0.08600515, -0.2919498, -2.647648, 0, 1, 0.6117647, 1,
-0.0856272, -0.4201942, -1.781987, 0, 1, 0.6156863, 1,
-0.0838928, -1.537456, -2.928444, 0, 1, 0.6235294, 1,
-0.08267837, -0.474367, -3.241796, 0, 1, 0.627451, 1,
-0.07561694, 0.7465217, -0.05125607, 0, 1, 0.6352941, 1,
-0.07448967, -1.444389, -2.240744, 0, 1, 0.6392157, 1,
-0.07135445, -0.5631096, -5.365424, 0, 1, 0.6470588, 1,
-0.07030933, 0.1530688, -1.510724, 0, 1, 0.6509804, 1,
-0.06964725, 0.8785425, 1.197346, 0, 1, 0.6588235, 1,
-0.06578163, -0.2260632, -0.8098898, 0, 1, 0.6627451, 1,
-0.06398445, -0.8549724, -2.586333, 0, 1, 0.6705883, 1,
-0.05805396, 0.5893963, 0.1836667, 0, 1, 0.6745098, 1,
-0.05266022, 0.3229643, -0.5253975, 0, 1, 0.682353, 1,
-0.0496684, -0.6751478, -3.043441, 0, 1, 0.6862745, 1,
-0.04623275, 0.5619597, -1.32151, 0, 1, 0.6941177, 1,
-0.04516782, -0.7211012, -1.531761, 0, 1, 0.7019608, 1,
-0.04364455, -0.1483563, -2.07669, 0, 1, 0.7058824, 1,
-0.04183116, 1.017161, -0.6754357, 0, 1, 0.7137255, 1,
-0.04045367, -0.8279378, -3.76281, 0, 1, 0.7176471, 1,
-0.03678196, -0.3581747, -3.675371, 0, 1, 0.7254902, 1,
-0.03052594, 1.035776, -0.3223398, 0, 1, 0.7294118, 1,
-0.02626468, -0.624921, -2.557927, 0, 1, 0.7372549, 1,
-0.02421903, -1.158317, -2.79363, 0, 1, 0.7411765, 1,
-0.0227652, -0.9366916, -3.212443, 0, 1, 0.7490196, 1,
-0.02154932, 1.052064, 0.4865634, 0, 1, 0.7529412, 1,
-0.02082339, -0.2891289, -3.386148, 0, 1, 0.7607843, 1,
-0.01997204, 0.5159017, -0.1538308, 0, 1, 0.7647059, 1,
-0.01947688, 0.09753982, -0.9943935, 0, 1, 0.772549, 1,
-0.01902809, -0.6236995, -2.065337, 0, 1, 0.7764706, 1,
-0.01700915, 0.6214902, -0.05563647, 0, 1, 0.7843137, 1,
-0.01637744, 0.9613201, -0.4573651, 0, 1, 0.7882353, 1,
-0.01497485, 1.684196, -0.1379598, 0, 1, 0.7960784, 1,
-0.01192408, -1.706314, -4.370688, 0, 1, 0.8039216, 1,
-0.01173175, 1.280419, 0.09568109, 0, 1, 0.8078431, 1,
-0.01069507, 1.37189, 0.810459, 0, 1, 0.8156863, 1,
-0.0102853, 0.5968432, -2.058831, 0, 1, 0.8196079, 1,
-0.008983089, -0.3409733, -3.582262, 0, 1, 0.827451, 1,
-0.008839543, 1.453973, 0.8194179, 0, 1, 0.8313726, 1,
0.0008105439, 0.1004499, -0.007049171, 0, 1, 0.8392157, 1,
0.001669903, -0.03391369, 2.437443, 0, 1, 0.8431373, 1,
0.002153818, 0.9534225, 0.6444859, 0, 1, 0.8509804, 1,
0.003755615, 0.1371959, 0.05997741, 0, 1, 0.854902, 1,
0.02008408, 0.7479494, -0.3110269, 0, 1, 0.8627451, 1,
0.02169119, 0.9514812, -0.4624987, 0, 1, 0.8666667, 1,
0.02628744, -1.51463, 2.329647, 0, 1, 0.8745098, 1,
0.02699809, -1.196584, 2.835674, 0, 1, 0.8784314, 1,
0.03515661, 0.7525247, -0.3408765, 0, 1, 0.8862745, 1,
0.03559551, -0.7607452, 2.560996, 0, 1, 0.8901961, 1,
0.03606644, -0.1187545, 1.650357, 0, 1, 0.8980392, 1,
0.03775604, -0.107927, 2.164193, 0, 1, 0.9058824, 1,
0.03976477, 1.649665, 0.9410814, 0, 1, 0.9098039, 1,
0.04027115, 1.738523, 1.20388, 0, 1, 0.9176471, 1,
0.0412131, 1.277615, -1.231422, 0, 1, 0.9215686, 1,
0.04750597, 0.3648718, 0.2386638, 0, 1, 0.9294118, 1,
0.04793971, 0.142878, 0.1565205, 0, 1, 0.9333333, 1,
0.04883215, 0.2880896, 1.312802, 0, 1, 0.9411765, 1,
0.05097774, -0.5099152, 5.042693, 0, 1, 0.945098, 1,
0.05449125, -0.6888022, 1.455028, 0, 1, 0.9529412, 1,
0.05507679, -1.41351, 3.207685, 0, 1, 0.9568627, 1,
0.05967306, -1.113532, 3.129792, 0, 1, 0.9647059, 1,
0.06316403, -0.4458983, 1.713323, 0, 1, 0.9686275, 1,
0.0685653, 0.7162992, 1.255712, 0, 1, 0.9764706, 1,
0.06881462, 0.7917629, 1.780454, 0, 1, 0.9803922, 1,
0.07401735, -0.1506156, 2.254704, 0, 1, 0.9882353, 1,
0.07412121, 0.5264942, -0.1293177, 0, 1, 0.9921569, 1,
0.07670393, 0.9723567, 1.569948, 0, 1, 1, 1,
0.07799906, 0.2662688, 0.008137641, 0, 0.9921569, 1, 1,
0.07892068, -0.05539525, 3.049255, 0, 0.9882353, 1, 1,
0.08093267, 0.963155, -1.529046, 0, 0.9803922, 1, 1,
0.08503217, -1.666477, 2.078778, 0, 0.9764706, 1, 1,
0.08666771, -0.9052194, 1.815721, 0, 0.9686275, 1, 1,
0.08919349, -0.5102674, 3.517342, 0, 0.9647059, 1, 1,
0.09144616, -0.6306922, 3.653477, 0, 0.9568627, 1, 1,
0.0919985, -1.59466, 4.651613, 0, 0.9529412, 1, 1,
0.09439176, -1.654586, 2.464863, 0, 0.945098, 1, 1,
0.09564529, -0.8571608, 3.122778, 0, 0.9411765, 1, 1,
0.09569356, -1.539407, 4.136395, 0, 0.9333333, 1, 1,
0.0957129, 0.639311, -0.4068721, 0, 0.9294118, 1, 1,
0.09829191, 0.8712921, 1.369992, 0, 0.9215686, 1, 1,
0.1036449, -0.5338227, 1.930766, 0, 0.9176471, 1, 1,
0.1037662, 0.4898683, -0.5899262, 0, 0.9098039, 1, 1,
0.10646, 1.495659, -0.5208987, 0, 0.9058824, 1, 1,
0.116511, 0.6568663, -0.1558645, 0, 0.8980392, 1, 1,
0.1227856, -0.6079788, 2.483716, 0, 0.8901961, 1, 1,
0.1245423, 0.3878725, 1.374972, 0, 0.8862745, 1, 1,
0.1256603, -1.228802, 2.49029, 0, 0.8784314, 1, 1,
0.1268107, -0.2465917, 2.617049, 0, 0.8745098, 1, 1,
0.1300317, 0.01022614, 1.944282, 0, 0.8666667, 1, 1,
0.1352263, 1.540285, -0.2881884, 0, 0.8627451, 1, 1,
0.1410159, 1.694967, -0.7552491, 0, 0.854902, 1, 1,
0.141324, -0.05813536, 2.211611, 0, 0.8509804, 1, 1,
0.143032, -0.078105, 0.5704365, 0, 0.8431373, 1, 1,
0.1442064, 0.7517484, 0.2987894, 0, 0.8392157, 1, 1,
0.1474737, -3.436869, 3.624182, 0, 0.8313726, 1, 1,
0.1507153, -2.664559, 2.382049, 0, 0.827451, 1, 1,
0.1537127, 1.423959, -0.1662841, 0, 0.8196079, 1, 1,
0.1540868, -0.9807901, 4.1477, 0, 0.8156863, 1, 1,
0.1542423, -0.1601154, 2.930739, 0, 0.8078431, 1, 1,
0.1549212, -0.7710497, 3.077111, 0, 0.8039216, 1, 1,
0.1553306, -0.2610617, 2.203059, 0, 0.7960784, 1, 1,
0.1584182, -1.034717, 1.021391, 0, 0.7882353, 1, 1,
0.159484, -0.1663641, 2.562209, 0, 0.7843137, 1, 1,
0.1679505, -1.462045, 4.039416, 0, 0.7764706, 1, 1,
0.1700799, 0.008180617, 1.501348, 0, 0.772549, 1, 1,
0.1717354, 0.1193873, 1.157671, 0, 0.7647059, 1, 1,
0.173283, 0.8078403, 0.8801139, 0, 0.7607843, 1, 1,
0.1761163, -0.0344111, 2.084514, 0, 0.7529412, 1, 1,
0.1784243, 0.1237787, 0.8144485, 0, 0.7490196, 1, 1,
0.1791621, -2.143087, 2.403882, 0, 0.7411765, 1, 1,
0.1830743, -0.6224971, 2.072268, 0, 0.7372549, 1, 1,
0.1892379, 0.6524214, 0.4334952, 0, 0.7294118, 1, 1,
0.1901073, 2.055137, -1.588091, 0, 0.7254902, 1, 1,
0.1918022, 0.4608834, 0.4261748, 0, 0.7176471, 1, 1,
0.1921746, -0.2467427, 1.0251, 0, 0.7137255, 1, 1,
0.2038143, 0.5610595, -0.2315857, 0, 0.7058824, 1, 1,
0.2041411, -1.715583, 0.7421168, 0, 0.6980392, 1, 1,
0.2043485, -0.2754736, 2.107574, 0, 0.6941177, 1, 1,
0.2052114, 1.492569, 0.7160444, 0, 0.6862745, 1, 1,
0.2070196, -0.9804635, 0.2237652, 0, 0.682353, 1, 1,
0.2079828, 0.9318659, -0.3000235, 0, 0.6745098, 1, 1,
0.2112941, -0.9788114, 5.90504, 0, 0.6705883, 1, 1,
0.2135124, 0.534923, -0.06917821, 0, 0.6627451, 1, 1,
0.2162583, -0.2044133, 3.44711, 0, 0.6588235, 1, 1,
0.218863, 0.8372167, 0.2366483, 0, 0.6509804, 1, 1,
0.2203946, 0.3379001, 0.4285195, 0, 0.6470588, 1, 1,
0.2218279, 0.483044, 0.2302867, 0, 0.6392157, 1, 1,
0.2258386, 2.315253, 0.5559595, 0, 0.6352941, 1, 1,
0.229598, -1.444555, 2.199822, 0, 0.627451, 1, 1,
0.2296229, 0.4157249, 0.3158017, 0, 0.6235294, 1, 1,
0.231762, -1.903393, 0.5543648, 0, 0.6156863, 1, 1,
0.2403568, 0.1574601, -0.1234723, 0, 0.6117647, 1, 1,
0.2448409, 1.106452, 0.6982351, 0, 0.6039216, 1, 1,
0.2448411, -0.4401253, 2.171615, 0, 0.5960785, 1, 1,
0.2449812, -1.173933, 3.541089, 0, 0.5921569, 1, 1,
0.2462561, -0.8498193, 2.980691, 0, 0.5843138, 1, 1,
0.2476535, 0.04677413, 0.8553105, 0, 0.5803922, 1, 1,
0.2477758, -0.008908288, 0.5026644, 0, 0.572549, 1, 1,
0.2487206, 0.106011, 1.215729, 0, 0.5686275, 1, 1,
0.2546449, 0.1123723, -0.4757202, 0, 0.5607843, 1, 1,
0.2569751, 0.6876933, -0.7483183, 0, 0.5568628, 1, 1,
0.2581469, 0.9911784, 1.699019, 0, 0.5490196, 1, 1,
0.266628, -0.4703197, 3.781039, 0, 0.5450981, 1, 1,
0.2677003, 0.2702987, 1.073184, 0, 0.5372549, 1, 1,
0.2711891, 0.1301802, 0.6102544, 0, 0.5333334, 1, 1,
0.273824, -1.57196, 2.418065, 0, 0.5254902, 1, 1,
0.2793385, 1.038263, 1.867143, 0, 0.5215687, 1, 1,
0.281839, 1.486916, 2.091486, 0, 0.5137255, 1, 1,
0.2825734, -0.5821561, 1.549683, 0, 0.509804, 1, 1,
0.3047878, 0.1972155, 0.8594438, 0, 0.5019608, 1, 1,
0.3080024, -0.1763071, 0.9967977, 0, 0.4941176, 1, 1,
0.3130915, 2.470568, 0.8877636, 0, 0.4901961, 1, 1,
0.3145534, 0.03949066, 0.7852064, 0, 0.4823529, 1, 1,
0.3156676, 0.2530077, 2.001725, 0, 0.4784314, 1, 1,
0.3187701, -2.079069, 1.45703, 0, 0.4705882, 1, 1,
0.3216861, -1.236762, 2.034894, 0, 0.4666667, 1, 1,
0.3234974, -1.56583, 1.748627, 0, 0.4588235, 1, 1,
0.32598, -0.812473, 4.897808, 0, 0.454902, 1, 1,
0.3274728, -0.06233079, 0.9428743, 0, 0.4470588, 1, 1,
0.329665, 0.2307131, 0.770686, 0, 0.4431373, 1, 1,
0.3420947, 1.22594, -0.6731198, 0, 0.4352941, 1, 1,
0.3431791, -0.2490358, 2.891178, 0, 0.4313726, 1, 1,
0.3446782, -1.056258, 2.089616, 0, 0.4235294, 1, 1,
0.344953, 0.7174556, 0.04137241, 0, 0.4196078, 1, 1,
0.3526376, -0.155936, 1.761287, 0, 0.4117647, 1, 1,
0.3530259, 1.38384, -0.9782362, 0, 0.4078431, 1, 1,
0.3533148, -1.350564, 4.225289, 0, 0.4, 1, 1,
0.3540621, 1.296758, -0.4920141, 0, 0.3921569, 1, 1,
0.3546667, 0.007071375, 3.397549, 0, 0.3882353, 1, 1,
0.3572682, -1.23455, 3.577323, 0, 0.3803922, 1, 1,
0.3579873, 1.314516, 0.7371821, 0, 0.3764706, 1, 1,
0.3584171, 0.3154125, 1.886431, 0, 0.3686275, 1, 1,
0.3686325, -0.9010881, 3.929217, 0, 0.3647059, 1, 1,
0.3709622, -0.7236255, 2.002608, 0, 0.3568628, 1, 1,
0.3724038, 1.250051, 0.6177694, 0, 0.3529412, 1, 1,
0.375202, -0.4136528, 1.939395, 0, 0.345098, 1, 1,
0.3766779, 1.044278, 0.3667277, 0, 0.3411765, 1, 1,
0.3790145, -0.7168585, 1.702469, 0, 0.3333333, 1, 1,
0.3813626, 1.086689, 0.9556512, 0, 0.3294118, 1, 1,
0.3816278, 0.9966542, 0.1362572, 0, 0.3215686, 1, 1,
0.3829391, -0.3945345, 1.913546, 0, 0.3176471, 1, 1,
0.3841332, -0.9407635, 3.281896, 0, 0.3098039, 1, 1,
0.3850153, 1.799994, 0.8711736, 0, 0.3058824, 1, 1,
0.3854292, -2.542889, 4.502125, 0, 0.2980392, 1, 1,
0.3869195, 2.020074, -0.04673282, 0, 0.2901961, 1, 1,
0.3874363, -0.3101068, 2.267349, 0, 0.2862745, 1, 1,
0.388303, 1.535798, 1.089785, 0, 0.2784314, 1, 1,
0.3891127, -0.7851918, 2.61051, 0, 0.2745098, 1, 1,
0.3962698, -0.757634, 2.583208, 0, 0.2666667, 1, 1,
0.3974237, 0.04847635, 2.189321, 0, 0.2627451, 1, 1,
0.3979636, -1.240391, 2.294628, 0, 0.254902, 1, 1,
0.399868, 0.9695082, -0.1180303, 0, 0.2509804, 1, 1,
0.4095298, -0.4115638, 1.857836, 0, 0.2431373, 1, 1,
0.4095729, 0.4984642, 0.3018672, 0, 0.2392157, 1, 1,
0.4099323, 0.8843963, 0.6133794, 0, 0.2313726, 1, 1,
0.4118391, 0.2232637, -1.194769, 0, 0.227451, 1, 1,
0.4141142, 0.1303535, 1.495201, 0, 0.2196078, 1, 1,
0.4157089, 0.5605768, -0.3603876, 0, 0.2156863, 1, 1,
0.4167271, -0.2418769, 2.67645, 0, 0.2078431, 1, 1,
0.4171254, 0.1120001, 2.63643, 0, 0.2039216, 1, 1,
0.4184896, -0.7388884, 2.341141, 0, 0.1960784, 1, 1,
0.4185295, 0.03079945, 2.639642, 0, 0.1882353, 1, 1,
0.4238161, -0.8549516, 1.627806, 0, 0.1843137, 1, 1,
0.4263433, -0.07427056, 1.644818, 0, 0.1764706, 1, 1,
0.4290057, -1.407715, 4.364629, 0, 0.172549, 1, 1,
0.4322708, 0.6636294, 1.613882, 0, 0.1647059, 1, 1,
0.4376558, 0.002553713, 2.346452, 0, 0.1607843, 1, 1,
0.4411537, 0.8742077, 0.006225863, 0, 0.1529412, 1, 1,
0.4434321, -0.4690357, 0.2638365, 0, 0.1490196, 1, 1,
0.4462729, -0.4077505, 1.814998, 0, 0.1411765, 1, 1,
0.44819, -2.123257, 3.16415, 0, 0.1372549, 1, 1,
0.4491502, -1.099389, 2.638474, 0, 0.1294118, 1, 1,
0.4551457, 0.267563, 1.656266, 0, 0.1254902, 1, 1,
0.4569798, -0.8241459, 1.852655, 0, 0.1176471, 1, 1,
0.4570403, -0.3245179, 2.532572, 0, 0.1137255, 1, 1,
0.4577729, 0.7493256, 0.259497, 0, 0.1058824, 1, 1,
0.4601815, 0.7390983, 0.545713, 0, 0.09803922, 1, 1,
0.461837, 1.353492, 0.584594, 0, 0.09411765, 1, 1,
0.4625671, 0.7305568, -0.362188, 0, 0.08627451, 1, 1,
0.4662585, -0.5382123, 1.784746, 0, 0.08235294, 1, 1,
0.4688899, -1.136836, 2.412958, 0, 0.07450981, 1, 1,
0.4692539, -0.5378007, 2.336999, 0, 0.07058824, 1, 1,
0.4694323, 0.372185, 0.2741258, 0, 0.0627451, 1, 1,
0.4743078, -0.3727232, 2.701248, 0, 0.05882353, 1, 1,
0.4764022, -0.05699388, 1.169382, 0, 0.05098039, 1, 1,
0.4790635, -1.152393, 2.499913, 0, 0.04705882, 1, 1,
0.4792883, 0.446055, 0.02595235, 0, 0.03921569, 1, 1,
0.4863684, -0.385832, 2.370223, 0, 0.03529412, 1, 1,
0.4928629, -0.3706529, 3.428787, 0, 0.02745098, 1, 1,
0.4940439, -0.5722769, 2.34455, 0, 0.02352941, 1, 1,
0.4976292, -1.420737, 2.677093, 0, 0.01568628, 1, 1,
0.500452, 2.210124, -0.06041585, 0, 0.01176471, 1, 1,
0.501393, 1.126331, 1.48187, 0, 0.003921569, 1, 1,
0.5039245, -1.664952, 4.382134, 0.003921569, 0, 1, 1,
0.5045599, 0.1789019, 0.06815417, 0.007843138, 0, 1, 1,
0.506929, -0.7055949, 2.056361, 0.01568628, 0, 1, 1,
0.5076647, 0.3832451, 1.14334, 0.01960784, 0, 1, 1,
0.5086524, 0.2490719, 0.2054028, 0.02745098, 0, 1, 1,
0.5148814, -0.08095538, 1.263736, 0.03137255, 0, 1, 1,
0.5167914, 0.7653751, -0.4874224, 0.03921569, 0, 1, 1,
0.5181555, 0.3078139, 1.33164, 0.04313726, 0, 1, 1,
0.5184259, 0.3905692, -0.6500138, 0.05098039, 0, 1, 1,
0.518611, 1.322014, -1.578961, 0.05490196, 0, 1, 1,
0.5208802, 0.2694138, 2.8947, 0.0627451, 0, 1, 1,
0.5214698, 0.1425916, 0.8407117, 0.06666667, 0, 1, 1,
0.5269424, 0.8959804, -0.1033846, 0.07450981, 0, 1, 1,
0.5286036, 0.8192642, -0.7321312, 0.07843138, 0, 1, 1,
0.5304459, -0.8425304, 3.529489, 0.08627451, 0, 1, 1,
0.5309432, 1.036384, 0.5553406, 0.09019608, 0, 1, 1,
0.5358748, -0.2919926, 3.296343, 0.09803922, 0, 1, 1,
0.5385238, -1.016181, 2.595397, 0.1058824, 0, 1, 1,
0.5411763, 0.5031505, 1.177527, 0.1098039, 0, 1, 1,
0.5429617, 0.06930572, 0.04504615, 0.1176471, 0, 1, 1,
0.5505926, -1.646363, 3.842621, 0.1215686, 0, 1, 1,
0.5564876, 0.225373, 1.077797, 0.1294118, 0, 1, 1,
0.5585726, 0.1131244, 2.664932, 0.1333333, 0, 1, 1,
0.5589404, -1.082227, 1.770053, 0.1411765, 0, 1, 1,
0.5674039, -1.744303, 3.832668, 0.145098, 0, 1, 1,
0.5679759, 0.109586, 1.320024, 0.1529412, 0, 1, 1,
0.5685239, -2.429965, 4.230329, 0.1568628, 0, 1, 1,
0.5714523, 0.8405977, 0.0864667, 0.1647059, 0, 1, 1,
0.5725932, 0.5013313, 2.233613, 0.1686275, 0, 1, 1,
0.575661, -1.293411, 2.68966, 0.1764706, 0, 1, 1,
0.5771433, -0.4730128, 1.357132, 0.1803922, 0, 1, 1,
0.5792907, 2.369245, -0.5074405, 0.1882353, 0, 1, 1,
0.5800337, 0.1984509, 1.959367, 0.1921569, 0, 1, 1,
0.5812078, -1.024721, 4.905887, 0.2, 0, 1, 1,
0.5814479, -1.989782, 2.655418, 0.2078431, 0, 1, 1,
0.5822069, -0.3117425, 2.741927, 0.2117647, 0, 1, 1,
0.5888479, -0.6171533, 1.798804, 0.2196078, 0, 1, 1,
0.593049, 1.006713, 0.856372, 0.2235294, 0, 1, 1,
0.5935408, -0.6187783, 4.280949, 0.2313726, 0, 1, 1,
0.5945439, 0.03387973, 1.113413, 0.2352941, 0, 1, 1,
0.6007206, 0.1921168, 0.9262748, 0.2431373, 0, 1, 1,
0.6064721, -2.004381, 2.341939, 0.2470588, 0, 1, 1,
0.6099163, 0.3780834, 1.563134, 0.254902, 0, 1, 1,
0.6100592, 0.1498597, -0.6179414, 0.2588235, 0, 1, 1,
0.6150413, -1.512323, 3.099045, 0.2666667, 0, 1, 1,
0.619565, -0.723834, 0.9213035, 0.2705882, 0, 1, 1,
0.6205168, -0.8033704, 2.385836, 0.2784314, 0, 1, 1,
0.6253656, 0.6149952, -0.7381278, 0.282353, 0, 1, 1,
0.6270684, -0.1073864, 1.709532, 0.2901961, 0, 1, 1,
0.629143, 0.3697067, -0.9299957, 0.2941177, 0, 1, 1,
0.6329679, 1.018243, 0.04152298, 0.3019608, 0, 1, 1,
0.6393321, -0.9881365, 1.137207, 0.3098039, 0, 1, 1,
0.646279, 1.502058, 0.8666824, 0.3137255, 0, 1, 1,
0.6486605, -0.2782111, 3.964171, 0.3215686, 0, 1, 1,
0.650544, 0.8311571, -0.05661409, 0.3254902, 0, 1, 1,
0.6514704, -1.32321, 3.113307, 0.3333333, 0, 1, 1,
0.6534608, 1.065171, -0.4351103, 0.3372549, 0, 1, 1,
0.6536795, -1.617581, 2.348327, 0.345098, 0, 1, 1,
0.6567236, 0.7146893, 0.004687759, 0.3490196, 0, 1, 1,
0.660003, 0.06821021, 1.637252, 0.3568628, 0, 1, 1,
0.6609132, 1.77725, -0.5759357, 0.3607843, 0, 1, 1,
0.666364, -1.284524, -0.946716, 0.3686275, 0, 1, 1,
0.6664722, -1.992509, 2.578703, 0.372549, 0, 1, 1,
0.6667265, -0.4601005, 3.107514, 0.3803922, 0, 1, 1,
0.6682394, 2.195687, 1.600564, 0.3843137, 0, 1, 1,
0.6698014, -0.06664554, 2.460014, 0.3921569, 0, 1, 1,
0.6699247, -1.455458, 1.491081, 0.3960784, 0, 1, 1,
0.6704313, 1.312734, 0.3336693, 0.4039216, 0, 1, 1,
0.6770768, 1.190681, 0.9655294, 0.4117647, 0, 1, 1,
0.678129, 0.05832798, 1.17645, 0.4156863, 0, 1, 1,
0.6792111, -0.06283917, 1.123097, 0.4235294, 0, 1, 1,
0.6804112, -0.2645403, 0.3604905, 0.427451, 0, 1, 1,
0.6837149, 0.2161444, -0.9105411, 0.4352941, 0, 1, 1,
0.6905299, 0.9612797, 1.740649, 0.4392157, 0, 1, 1,
0.6915768, -1.542934, 2.280269, 0.4470588, 0, 1, 1,
0.6941753, -0.8181432, 1.413416, 0.4509804, 0, 1, 1,
0.6949592, -1.754734, 3.431651, 0.4588235, 0, 1, 1,
0.6973951, -0.2956355, 0.3789987, 0.4627451, 0, 1, 1,
0.7070614, -0.386935, 2.49196, 0.4705882, 0, 1, 1,
0.7078262, -0.2144903, -0.1043029, 0.4745098, 0, 1, 1,
0.7079988, -0.106778, 1.513525, 0.4823529, 0, 1, 1,
0.7100001, 0.1520897, 2.162066, 0.4862745, 0, 1, 1,
0.7101802, -1.037698, 2.38039, 0.4941176, 0, 1, 1,
0.7183089, -0.1572637, 2.175935, 0.5019608, 0, 1, 1,
0.7193384, 0.8129261, 1.06797, 0.5058824, 0, 1, 1,
0.7194316, 0.5148466, -0.7928793, 0.5137255, 0, 1, 1,
0.7218913, -2.138817, 2.05045, 0.5176471, 0, 1, 1,
0.7270415, -0.7501921, 3.349685, 0.5254902, 0, 1, 1,
0.7272927, -0.4733704, 3.83365, 0.5294118, 0, 1, 1,
0.7277681, -0.8657181, 2.382921, 0.5372549, 0, 1, 1,
0.7309905, 0.6768947, 1.027054, 0.5411765, 0, 1, 1,
0.7320708, -0.03910097, 0.3238519, 0.5490196, 0, 1, 1,
0.7332124, 0.1854745, 2.028694, 0.5529412, 0, 1, 1,
0.7333847, -2.305673, 2.304316, 0.5607843, 0, 1, 1,
0.7340928, -0.5239853, 4.460244, 0.5647059, 0, 1, 1,
0.7366034, -0.143204, 3.138247, 0.572549, 0, 1, 1,
0.7420372, 0.5710095, 0.2610962, 0.5764706, 0, 1, 1,
0.7426255, 0.4451683, -0.01645303, 0.5843138, 0, 1, 1,
0.7438437, -0.4974615, 2.966189, 0.5882353, 0, 1, 1,
0.7439303, 1.456907, 1.019264, 0.5960785, 0, 1, 1,
0.7519938, 0.7122425, 1.529586, 0.6039216, 0, 1, 1,
0.7534163, 0.5874253, 0.8575484, 0.6078432, 0, 1, 1,
0.758257, 1.843831, 0.5714238, 0.6156863, 0, 1, 1,
0.7609885, -2.010146, 2.415199, 0.6196079, 0, 1, 1,
0.7646618, -0.5745029, 0.8982504, 0.627451, 0, 1, 1,
0.7713991, 0.8065194, 1.527359, 0.6313726, 0, 1, 1,
0.771731, 1.08124, 0.164511, 0.6392157, 0, 1, 1,
0.7729344, 0.386412, 1.142265, 0.6431373, 0, 1, 1,
0.7803469, 1.119085, -0.3831605, 0.6509804, 0, 1, 1,
0.7808186, -0.572635, 1.532599, 0.654902, 0, 1, 1,
0.7902525, 0.8821096, 0.5504308, 0.6627451, 0, 1, 1,
0.790807, -0.5197094, 2.830265, 0.6666667, 0, 1, 1,
0.7929242, -0.8630844, 1.244157, 0.6745098, 0, 1, 1,
0.7938086, -0.517436, 1.757724, 0.6784314, 0, 1, 1,
0.8012736, -0.2130504, 1.181335, 0.6862745, 0, 1, 1,
0.8035498, 0.8379918, 0.1337266, 0.6901961, 0, 1, 1,
0.807198, -0.1030903, 1.11662, 0.6980392, 0, 1, 1,
0.8087086, -0.04305241, 1.074157, 0.7058824, 0, 1, 1,
0.8091438, 2.495265, 1.699282, 0.7098039, 0, 1, 1,
0.809451, 0.4094106, 0.2316708, 0.7176471, 0, 1, 1,
0.8095326, -0.5519637, 2.039775, 0.7215686, 0, 1, 1,
0.8122121, 1.456447, -0.6870149, 0.7294118, 0, 1, 1,
0.8169508, -1.622485, 2.334521, 0.7333333, 0, 1, 1,
0.8205729, 1.016107, 0.5979488, 0.7411765, 0, 1, 1,
0.8227473, 0.7325739, 0.2742466, 0.7450981, 0, 1, 1,
0.8255207, 1.492511, 0.04616725, 0.7529412, 0, 1, 1,
0.8284535, -0.01920604, 1.31207, 0.7568628, 0, 1, 1,
0.828992, 0.008412901, 1.164356, 0.7647059, 0, 1, 1,
0.83373, 0.4859125, -0.3467986, 0.7686275, 0, 1, 1,
0.8388178, -0.7648181, 3.046606, 0.7764706, 0, 1, 1,
0.8389707, 1.025795, 0.5758857, 0.7803922, 0, 1, 1,
0.8392901, 1.633585, 3.206032, 0.7882353, 0, 1, 1,
0.8414556, 0.6847863, 1.851941, 0.7921569, 0, 1, 1,
0.8431951, -0.05300867, 1.325778, 0.8, 0, 1, 1,
0.8433334, -0.6670166, 2.049816, 0.8078431, 0, 1, 1,
0.8452901, -1.667438, 2.509247, 0.8117647, 0, 1, 1,
0.8511269, 0.09112626, 1.312788, 0.8196079, 0, 1, 1,
0.8597035, 1.348948, 1.560864, 0.8235294, 0, 1, 1,
0.8609279, -0.1864646, 2.851493, 0.8313726, 0, 1, 1,
0.8622633, 0.320987, 1.641411, 0.8352941, 0, 1, 1,
0.8648478, 1.774471, -0.3533209, 0.8431373, 0, 1, 1,
0.865647, -0.9248305, 1.565666, 0.8470588, 0, 1, 1,
0.8702784, 0.4907373, 0.3065409, 0.854902, 0, 1, 1,
0.8705593, 0.5746509, 1.085114, 0.8588235, 0, 1, 1,
0.8749433, 1.803931, 0.7711732, 0.8666667, 0, 1, 1,
0.8788495, -0.533439, 1.701432, 0.8705882, 0, 1, 1,
0.8809589, 0.8305123, 2.634705, 0.8784314, 0, 1, 1,
0.882145, -0.850336, 1.456812, 0.8823529, 0, 1, 1,
0.8927365, 1.156284, 1.250487, 0.8901961, 0, 1, 1,
0.8962809, -0.8183542, 2.517508, 0.8941177, 0, 1, 1,
0.9003235, -1.317488, 2.911754, 0.9019608, 0, 1, 1,
0.9009448, 0.1541968, 1.337246, 0.9098039, 0, 1, 1,
0.9012498, 1.133853, 1.427635, 0.9137255, 0, 1, 1,
0.9052486, 0.941708, 0.5601133, 0.9215686, 0, 1, 1,
0.9058592, -0.7655054, 2.182983, 0.9254902, 0, 1, 1,
0.9085915, 1.008969, 0.8079879, 0.9333333, 0, 1, 1,
0.9119613, 1.316664, 0.603021, 0.9372549, 0, 1, 1,
0.9133729, -0.01426801, 3.370292, 0.945098, 0, 1, 1,
0.9144477, 1.205494, 1.934605, 0.9490196, 0, 1, 1,
0.9146762, -0.1945319, 3.875438, 0.9568627, 0, 1, 1,
0.9193483, -0.7411339, 2.356715, 0.9607843, 0, 1, 1,
0.9257888, -1.588169, 3.725447, 0.9686275, 0, 1, 1,
0.9402583, 0.1282278, 0.335382, 0.972549, 0, 1, 1,
0.945995, -1.03884, 4.142297, 0.9803922, 0, 1, 1,
0.9555839, -0.5572386, 2.178813, 0.9843137, 0, 1, 1,
0.9569793, -0.7245299, 1.297176, 0.9921569, 0, 1, 1,
0.9589746, 0.6545182, 0.6163297, 0.9960784, 0, 1, 1,
0.9610776, 0.304351, 1.43184, 1, 0, 0.9960784, 1,
0.9620367, -0.4690413, 4.088103, 1, 0, 0.9882353, 1,
0.9659719, 2.405533, 1.033682, 1, 0, 0.9843137, 1,
0.970835, -0.2917493, 0.1509397, 1, 0, 0.9764706, 1,
0.9790031, -0.9039009, 1.216731, 1, 0, 0.972549, 1,
0.9799161, 0.9090629, 0.8894599, 1, 0, 0.9647059, 1,
0.9801818, 0.6216503, 0.0783203, 1, 0, 0.9607843, 1,
0.9849758, 0.3949029, 0.931629, 1, 0, 0.9529412, 1,
0.9888011, 1.575363, 1.341402, 1, 0, 0.9490196, 1,
0.9908137, -0.2548856, 0.6800905, 1, 0, 0.9411765, 1,
0.9929391, 0.5970021, 1.610895, 1, 0, 0.9372549, 1,
0.9940949, -1.512764, 3.003438, 1, 0, 0.9294118, 1,
0.9953854, -0.8835712, 1.995437, 1, 0, 0.9254902, 1,
0.9973596, 0.79027, 1.082098, 1, 0, 0.9176471, 1,
1.000843, -0.4844583, 3.240693, 1, 0, 0.9137255, 1,
1.00339, -0.05078057, 0.1711913, 1, 0, 0.9058824, 1,
1.014417, -1.282342, 1.219226, 1, 0, 0.9019608, 1,
1.016096, 0.3684295, 0.7067184, 1, 0, 0.8941177, 1,
1.017165, 0.1182014, 1.643996, 1, 0, 0.8862745, 1,
1.018672, 0.591397, 0.7677997, 1, 0, 0.8823529, 1,
1.022309, -0.7887336, 1.111757, 1, 0, 0.8745098, 1,
1.022624, 1.009075, -0.8763525, 1, 0, 0.8705882, 1,
1.026087, 0.8565225, -0.5589625, 1, 0, 0.8627451, 1,
1.029298, 0.4562699, 1.491524, 1, 0, 0.8588235, 1,
1.033129, 1.915933, 1.451252, 1, 0, 0.8509804, 1,
1.033218, 0.448565, 1.126771, 1, 0, 0.8470588, 1,
1.035416, 0.423407, 1.404543, 1, 0, 0.8392157, 1,
1.045216, -0.6447405, 2.510208, 1, 0, 0.8352941, 1,
1.0494, -0.09006023, 1.098399, 1, 0, 0.827451, 1,
1.055251, 1.623529, -0.4830337, 1, 0, 0.8235294, 1,
1.069348, 0.797053, 0.7360022, 1, 0, 0.8156863, 1,
1.071574, -0.01629043, 1.752868, 1, 0, 0.8117647, 1,
1.076667, -0.3687248, 2.717223, 1, 0, 0.8039216, 1,
1.083129, 0.3408251, 0.91053, 1, 0, 0.7960784, 1,
1.084746, 0.9615096, 1.916614, 1, 0, 0.7921569, 1,
1.087946, -0.7188351, 2.508612, 1, 0, 0.7843137, 1,
1.089107, -0.5413629, 2.764583, 1, 0, 0.7803922, 1,
1.094567, -0.2581358, 2.409137, 1, 0, 0.772549, 1,
1.104441, 0.492266, 1.715968, 1, 0, 0.7686275, 1,
1.10523, -0.2581685, 0.4219134, 1, 0, 0.7607843, 1,
1.110015, 0.8721022, 1.792741, 1, 0, 0.7568628, 1,
1.111191, -0.6294385, 1.604553, 1, 0, 0.7490196, 1,
1.111949, 2.315654, -0.7115327, 1, 0, 0.7450981, 1,
1.118665, 0.2152558, 0.9242344, 1, 0, 0.7372549, 1,
1.120281, -0.05907295, 1.507355, 1, 0, 0.7333333, 1,
1.121569, 1.009982, 1.202392, 1, 0, 0.7254902, 1,
1.123534, -0.2791134, 3.474061, 1, 0, 0.7215686, 1,
1.135014, -1.091445, 2.133245, 1, 0, 0.7137255, 1,
1.146664, -1.352564, 3.421075, 1, 0, 0.7098039, 1,
1.154145, -0.6616749, 2.997815, 1, 0, 0.7019608, 1,
1.156378, -0.3107601, 2.112389, 1, 0, 0.6941177, 1,
1.159179, 0.5540686, 2.369904, 1, 0, 0.6901961, 1,
1.159884, -1.896411, 1.214387, 1, 0, 0.682353, 1,
1.160917, -0.2621334, 2.187832, 1, 0, 0.6784314, 1,
1.169215, -1.928826, 2.185157, 1, 0, 0.6705883, 1,
1.182083, 1.241702, 2.203998, 1, 0, 0.6666667, 1,
1.187987, -0.4578341, 2.402439, 1, 0, 0.6588235, 1,
1.189935, -0.1476636, 2.489419, 1, 0, 0.654902, 1,
1.193423, -2.447032, 3.548924, 1, 0, 0.6470588, 1,
1.199922, 0.6951649, 2.528011, 1, 0, 0.6431373, 1,
1.202678, -0.3915652, 0.4249565, 1, 0, 0.6352941, 1,
1.206792, -0.8944334, 1.304402, 1, 0, 0.6313726, 1,
1.209125, 2.141088, 0.3182904, 1, 0, 0.6235294, 1,
1.223117, 0.2104551, 2.564741, 1, 0, 0.6196079, 1,
1.241061, 0.1643728, 0.6834505, 1, 0, 0.6117647, 1,
1.247067, 2.067566, -0.166984, 1, 0, 0.6078432, 1,
1.248122, -1.181881, 3.114265, 1, 0, 0.6, 1,
1.255394, -0.7177652, 1.952485, 1, 0, 0.5921569, 1,
1.277936, 1.945045, -0.1969805, 1, 0, 0.5882353, 1,
1.28511, -0.0005602441, 2.411218, 1, 0, 0.5803922, 1,
1.291261, 0.5394271, -0.4454145, 1, 0, 0.5764706, 1,
1.296934, 0.2117696, 1.794564, 1, 0, 0.5686275, 1,
1.302793, 0.06643042, 1.8846, 1, 0, 0.5647059, 1,
1.310238, 0.5029894, 2.910536, 1, 0, 0.5568628, 1,
1.311068, -1.180841, 1.658706, 1, 0, 0.5529412, 1,
1.324602, -1.041147, 0.664615, 1, 0, 0.5450981, 1,
1.332387, 1.068408, 0.004753714, 1, 0, 0.5411765, 1,
1.333803, 0.3474848, 3.234729, 1, 0, 0.5333334, 1,
1.350031, -0.1669927, 2.34281, 1, 0, 0.5294118, 1,
1.353458, -0.2434918, 1.857781, 1, 0, 0.5215687, 1,
1.362016, -1.331818, 0.5913661, 1, 0, 0.5176471, 1,
1.362641, 0.7353984, 2.292413, 1, 0, 0.509804, 1,
1.369614, -1.615565, 3.045537, 1, 0, 0.5058824, 1,
1.380689, -1.477713, 4.273118, 1, 0, 0.4980392, 1,
1.385377, 0.1377469, -1.35763, 1, 0, 0.4901961, 1,
1.401523, 1.164314, 1.276807, 1, 0, 0.4862745, 1,
1.411177, 0.2108723, 0.7017179, 1, 0, 0.4784314, 1,
1.414518, 0.5546508, 0.7127697, 1, 0, 0.4745098, 1,
1.427141, -1.777194, 4.110029, 1, 0, 0.4666667, 1,
1.428067, 0.2165816, 2.85854, 1, 0, 0.4627451, 1,
1.435869, -0.957187, 2.217126, 1, 0, 0.454902, 1,
1.445573, 1.243522, 1.275666, 1, 0, 0.4509804, 1,
1.449611, 0.6912717, 0.8922971, 1, 0, 0.4431373, 1,
1.462081, 0.5621222, 1.644752, 1, 0, 0.4392157, 1,
1.463729, 0.2462577, 0.5996868, 1, 0, 0.4313726, 1,
1.475676, 0.1160329, 0.4690777, 1, 0, 0.427451, 1,
1.491568, -0.6644014, 1.190238, 1, 0, 0.4196078, 1,
1.497538, 0.2635487, 1.428123, 1, 0, 0.4156863, 1,
1.507421, 1.517191, 0.6583676, 1, 0, 0.4078431, 1,
1.516325, -0.8211006, 2.464405, 1, 0, 0.4039216, 1,
1.517839, -1.504594, 2.538223, 1, 0, 0.3960784, 1,
1.519757, 0.7312673, 2.237007, 1, 0, 0.3882353, 1,
1.520487, -0.5536407, 2.073067, 1, 0, 0.3843137, 1,
1.529083, -0.4607392, 1.196427, 1, 0, 0.3764706, 1,
1.529394, 0.3754597, 2.734552, 1, 0, 0.372549, 1,
1.530555, -0.1003446, 3.056695, 1, 0, 0.3647059, 1,
1.544152, -0.5519415, 3.10587, 1, 0, 0.3607843, 1,
1.555883, 0.3674451, -0.1296836, 1, 0, 0.3529412, 1,
1.561862, -0.1103406, 3.476422, 1, 0, 0.3490196, 1,
1.565492, 0.1059397, 1.121285, 1, 0, 0.3411765, 1,
1.572717, 0.06660857, 0.8303803, 1, 0, 0.3372549, 1,
1.580959, 0.5602655, 1.743584, 1, 0, 0.3294118, 1,
1.580962, 1.073374, 1.171041, 1, 0, 0.3254902, 1,
1.586535, 1.517031, 0.5449459, 1, 0, 0.3176471, 1,
1.601762, -0.5777663, 2.684166, 1, 0, 0.3137255, 1,
1.607108, 0.4147934, -0.1146595, 1, 0, 0.3058824, 1,
1.609113, -0.4862253, 2.202265, 1, 0, 0.2980392, 1,
1.612044, 0.8015136, 2.076879, 1, 0, 0.2941177, 1,
1.624733, 0.1325392, 2.400482, 1, 0, 0.2862745, 1,
1.626009, 0.6453712, 0.4050184, 1, 0, 0.282353, 1,
1.626965, -0.2106921, 0.1407373, 1, 0, 0.2745098, 1,
1.631305, -0.9662158, 1.057205, 1, 0, 0.2705882, 1,
1.638145, -0.4535158, 1.536419, 1, 0, 0.2627451, 1,
1.663797, -1.15664, 3.782826, 1, 0, 0.2588235, 1,
1.671627, 0.6621592, 0.171264, 1, 0, 0.2509804, 1,
1.672255, 0.3806493, 1.627515, 1, 0, 0.2470588, 1,
1.697975, 0.7355372, 2.43422, 1, 0, 0.2392157, 1,
1.712874, -1.443794, -0.2065639, 1, 0, 0.2352941, 1,
1.754356, -0.1074874, 1.557263, 1, 0, 0.227451, 1,
1.762659, 1.578794, 1.848705, 1, 0, 0.2235294, 1,
1.78305, 1.859989, -0.7582675, 1, 0, 0.2156863, 1,
1.790099, 0.6419358, 1.040251, 1, 0, 0.2117647, 1,
1.805666, 1.685647, 0.9901709, 1, 0, 0.2039216, 1,
1.823339, -0.03300162, 0.1000643, 1, 0, 0.1960784, 1,
1.826038, 0.8561109, 1.962587, 1, 0, 0.1921569, 1,
1.827027, 0.2217912, 0.9131555, 1, 0, 0.1843137, 1,
1.840085, 1.713474, 2.636671, 1, 0, 0.1803922, 1,
1.936499, -2.259788, 2.827532, 1, 0, 0.172549, 1,
1.941702, -0.1188132, 2.896311, 1, 0, 0.1686275, 1,
1.956726, 0.8740208, 0.9388511, 1, 0, 0.1607843, 1,
1.98471, 1.138045, 0.8642052, 1, 0, 0.1568628, 1,
1.999359, -0.8455576, 3.150975, 1, 0, 0.1490196, 1,
2.005336, -1.242172, 1.769192, 1, 0, 0.145098, 1,
2.029012, 0.3118431, 2.519929, 1, 0, 0.1372549, 1,
2.058685, 1.662725, 1.483548, 1, 0, 0.1333333, 1,
2.062212, -0.4017932, -0.2914162, 1, 0, 0.1254902, 1,
2.087376, -0.3110239, 0.9093348, 1, 0, 0.1215686, 1,
2.106257, -0.05235777, 2.694568, 1, 0, 0.1137255, 1,
2.110364, -0.005122648, 2.474517, 1, 0, 0.1098039, 1,
2.139321, -0.5614384, 1.83419, 1, 0, 0.1019608, 1,
2.147707, 1.14048, 1.319099, 1, 0, 0.09411765, 1,
2.229628, -1.767616, 1.219848, 1, 0, 0.09019608, 1,
2.257052, -0.8848931, 1.735617, 1, 0, 0.08235294, 1,
2.258285, 0.2756413, 2.683695, 1, 0, 0.07843138, 1,
2.295045, 0.7603396, 1.02046, 1, 0, 0.07058824, 1,
2.352054, -0.3510813, 2.383379, 1, 0, 0.06666667, 1,
2.364112, -0.141977, 1.774247, 1, 0, 0.05882353, 1,
2.364712, -1.323027, 1.638174, 1, 0, 0.05490196, 1,
2.506913, -0.2650174, 0.9191476, 1, 0, 0.04705882, 1,
2.509921, -0.8653116, 4.087795, 1, 0, 0.04313726, 1,
2.803421, 1.602329, -0.7200411, 1, 0, 0.03529412, 1,
2.813023, 0.1743484, 3.141394, 1, 0, 0.03137255, 1,
2.900579, -0.050114, 0.9946439, 1, 0, 0.02352941, 1,
2.959518, -0.4933841, 1.794139, 1, 0, 0.01960784, 1,
3.06699, -0.2523319, 1.727332, 1, 0, 0.01176471, 1,
3.258686, 0.2621486, 2.359525, 1, 0, 0.007843138, 1
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
0.0265137, -4.456341, -7.275768, 0, -0.5, 0.5, 0.5,
0.0265137, -4.456341, -7.275768, 1, -0.5, 0.5, 0.5,
0.0265137, -4.456341, -7.275768, 1, 1.5, 0.5, 0.5,
0.0265137, -4.456341, -7.275768, 0, 1.5, 0.5, 0.5
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
-4.301365, -0.4295775, -7.275768, 0, -0.5, 0.5, 0.5,
-4.301365, -0.4295775, -7.275768, 1, -0.5, 0.5, 0.5,
-4.301365, -0.4295775, -7.275768, 1, 1.5, 0.5, 0.5,
-4.301365, -0.4295775, -7.275768, 0, 1.5, 0.5, 0.5
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
-4.301365, -4.456341, 0.2698078, 0, -0.5, 0.5, 0.5,
-4.301365, -4.456341, 0.2698078, 1, -0.5, 0.5, 0.5,
-4.301365, -4.456341, 0.2698078, 1, 1.5, 0.5, 0.5,
-4.301365, -4.456341, 0.2698078, 0, 1.5, 0.5, 0.5
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
-3, -3.527088, -5.534481,
3, -3.527088, -5.534481,
-3, -3.527088, -5.534481,
-3, -3.681963, -5.824696,
-2, -3.527088, -5.534481,
-2, -3.681963, -5.824696,
-1, -3.527088, -5.534481,
-1, -3.681963, -5.824696,
0, -3.527088, -5.534481,
0, -3.681963, -5.824696,
1, -3.527088, -5.534481,
1, -3.681963, -5.824696,
2, -3.527088, -5.534481,
2, -3.681963, -5.824696,
3, -3.527088, -5.534481,
3, -3.681963, -5.824696
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
-3, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
-3, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
-3, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
-3, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
-2, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
-2, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
-2, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
-2, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
-1, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
-1, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
-1, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
-1, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
0, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
0, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
0, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
0, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
1, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
1, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
1, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
1, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
2, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
2, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
2, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
2, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5,
3, -3.991714, -6.405125, 0, -0.5, 0.5, 0.5,
3, -3.991714, -6.405125, 1, -0.5, 0.5, 0.5,
3, -3.991714, -6.405125, 1, 1.5, 0.5, 0.5,
3, -3.991714, -6.405125, 0, 1.5, 0.5, 0.5
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
-3.302624, -3, -5.534481,
-3.302624, 2, -5.534481,
-3.302624, -3, -5.534481,
-3.469081, -3, -5.824696,
-3.302624, -2, -5.534481,
-3.469081, -2, -5.824696,
-3.302624, -1, -5.534481,
-3.469081, -1, -5.824696,
-3.302624, 0, -5.534481,
-3.469081, 0, -5.824696,
-3.302624, 1, -5.534481,
-3.469081, 1, -5.824696,
-3.302624, 2, -5.534481,
-3.469081, 2, -5.824696
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
-3.801995, -3, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, -3, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, -3, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, -3, -6.405125, 0, 1.5, 0.5, 0.5,
-3.801995, -2, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, -2, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, -2, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, -2, -6.405125, 0, 1.5, 0.5, 0.5,
-3.801995, -1, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, -1, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, -1, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, -1, -6.405125, 0, 1.5, 0.5, 0.5,
-3.801995, 0, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, 0, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, 0, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, 0, -6.405125, 0, 1.5, 0.5, 0.5,
-3.801995, 1, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, 1, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, 1, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, 1, -6.405125, 0, 1.5, 0.5, 0.5,
-3.801995, 2, -6.405125, 0, -0.5, 0.5, 0.5,
-3.801995, 2, -6.405125, 1, -0.5, 0.5, 0.5,
-3.801995, 2, -6.405125, 1, 1.5, 0.5, 0.5,
-3.801995, 2, -6.405125, 0, 1.5, 0.5, 0.5
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
-3.302624, -3.527088, -4,
-3.302624, -3.527088, 4,
-3.302624, -3.527088, -4,
-3.469081, -3.681963, -4,
-3.302624, -3.527088, -2,
-3.469081, -3.681963, -2,
-3.302624, -3.527088, 0,
-3.469081, -3.681963, 0,
-3.302624, -3.527088, 2,
-3.469081, -3.681963, 2,
-3.302624, -3.527088, 4,
-3.469081, -3.681963, 4
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
-3.801995, -3.991714, -4, 0, -0.5, 0.5, 0.5,
-3.801995, -3.991714, -4, 1, -0.5, 0.5, 0.5,
-3.801995, -3.991714, -4, 1, 1.5, 0.5, 0.5,
-3.801995, -3.991714, -4, 0, 1.5, 0.5, 0.5,
-3.801995, -3.991714, -2, 0, -0.5, 0.5, 0.5,
-3.801995, -3.991714, -2, 1, -0.5, 0.5, 0.5,
-3.801995, -3.991714, -2, 1, 1.5, 0.5, 0.5,
-3.801995, -3.991714, -2, 0, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 0, 0, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 0, 1, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 0, 1, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 0, 0, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 2, 0, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 2, 1, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 2, 1, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 2, 0, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 4, 0, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 4, 1, -0.5, 0.5, 0.5,
-3.801995, -3.991714, 4, 1, 1.5, 0.5, 0.5,
-3.801995, -3.991714, 4, 0, 1.5, 0.5, 0.5
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
-3.302624, -3.527088, -5.534481,
-3.302624, 2.667933, -5.534481,
-3.302624, -3.527088, 6.074097,
-3.302624, 2.667933, 6.074097,
-3.302624, -3.527088, -5.534481,
-3.302624, -3.527088, 6.074097,
-3.302624, 2.667933, -5.534481,
-3.302624, 2.667933, 6.074097,
-3.302624, -3.527088, -5.534481,
3.355651, -3.527088, -5.534481,
-3.302624, -3.527088, 6.074097,
3.355651, -3.527088, 6.074097,
-3.302624, 2.667933, -5.534481,
3.355651, 2.667933, -5.534481,
-3.302624, 2.667933, 6.074097,
3.355651, 2.667933, 6.074097,
3.355651, -3.527088, -5.534481,
3.355651, 2.667933, -5.534481,
3.355651, -3.527088, 6.074097,
3.355651, 2.667933, 6.074097,
3.355651, -3.527088, -5.534481,
3.355651, -3.527088, 6.074097,
3.355651, 2.667933, -5.534481,
3.355651, 2.667933, 6.074097
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
var radius = 7.874539;
var distance = 35.03471;
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
mvMatrix.translate( -0.0265137, 0.4295775, -0.2698078 );
mvMatrix.scale( 1.278725, 1.374347, 0.7334323 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03471);
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
acetanilide<-read.table("acetanilide.xyz")
```

```
## Error in read.table("acetanilide.xyz"): no lines available in input
```

```r
x<-acetanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
```

```r
y<-acetanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
```

```r
z<-acetanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
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
-3.205659, -0.8905977, -1.071064, 0, 0, 1, 1, 1,
-3.066948, -0.02010111, -1.859045, 1, 0, 0, 1, 1,
-3.019878, -0.6310169, -2.098762, 1, 0, 0, 1, 1,
-2.583313, -0.9329944, -1.932397, 1, 0, 0, 1, 1,
-2.456316, -0.5355385, -0.7817703, 1, 0, 0, 1, 1,
-2.426054, -1.366968, -0.9840199, 1, 0, 0, 1, 1,
-2.376505, 0.2958592, -2.399644, 0, 0, 0, 1, 1,
-2.345904, 0.9617934, 0.6098496, 0, 0, 0, 1, 1,
-2.326406, -0.4844771, -2.380881, 0, 0, 0, 1, 1,
-2.224355, 0.3152652, -2.317541, 0, 0, 0, 1, 1,
-2.140224, 0.4569525, 1.038089, 0, 0, 0, 1, 1,
-2.104654, -0.9071648, -3.600285, 0, 0, 0, 1, 1,
-2.085333, 0.6373667, -1.785024, 0, 0, 0, 1, 1,
-2.07068, -1.245206, -1.90061, 1, 1, 1, 1, 1,
-2.03447, 1.165348, -1.846079, 1, 1, 1, 1, 1,
-1.932383, -0.7446803, -1.725155, 1, 1, 1, 1, 1,
-1.913652, 0.3292612, -1.102162, 1, 1, 1, 1, 1,
-1.905167, 0.6862894, -0.7346627, 1, 1, 1, 1, 1,
-1.904542, -0.2838895, -1.396794, 1, 1, 1, 1, 1,
-1.903847, -0.2780221, -0.7330858, 1, 1, 1, 1, 1,
-1.871252, 0.1727654, -1.515567, 1, 1, 1, 1, 1,
-1.870237, 0.5876249, -0.3014748, 1, 1, 1, 1, 1,
-1.859126, -0.5202554, -2.280501, 1, 1, 1, 1, 1,
-1.8557, -0.9617386, -3.553616, 1, 1, 1, 1, 1,
-1.831158, -0.1008412, -0.4217861, 1, 1, 1, 1, 1,
-1.807695, -0.3748881, -0.9278197, 1, 1, 1, 1, 1,
-1.805668, -1.622031, -1.532341, 1, 1, 1, 1, 1,
-1.795967, 0.4825253, -3.040802, 1, 1, 1, 1, 1,
-1.795204, -0.2318623, -3.535092, 0, 0, 1, 1, 1,
-1.776891, -0.5300093, -2.502513, 1, 0, 0, 1, 1,
-1.749423, -0.5444965, -2.173576, 1, 0, 0, 1, 1,
-1.731727, -0.08039697, -2.092869, 1, 0, 0, 1, 1,
-1.72066, 0.5330052, -2.48681, 1, 0, 0, 1, 1,
-1.703901, 1.508694, -1.508275, 1, 0, 0, 1, 1,
-1.69484, -1.691359, -2.586321, 0, 0, 0, 1, 1,
-1.684129, 0.8124483, -2.163605, 0, 0, 0, 1, 1,
-1.681491, 1.427366, -2.453038, 0, 0, 0, 1, 1,
-1.676711, 1.245788, 0.8884115, 0, 0, 0, 1, 1,
-1.671573, 0.02574777, -1.644166, 0, 0, 0, 1, 1,
-1.649841, 0.3460266, -1.006517, 0, 0, 0, 1, 1,
-1.649261, -0.246105, -1.081953, 0, 0, 0, 1, 1,
-1.644175, 1.203252, -0.8637032, 1, 1, 1, 1, 1,
-1.621589, -0.7209696, -3.937815, 1, 1, 1, 1, 1,
-1.618059, -0.3057594, -3.799643, 1, 1, 1, 1, 1,
-1.600049, -0.839587, -3.480489, 1, 1, 1, 1, 1,
-1.595649, -0.2746797, -1.954983, 1, 1, 1, 1, 1,
-1.591547, -0.3790862, -1.996756, 1, 1, 1, 1, 1,
-1.581484, 0.9286619, 1.411975, 1, 1, 1, 1, 1,
-1.580921, -0.21668, -2.373842, 1, 1, 1, 1, 1,
-1.567907, 0.9805868, -0.8320076, 1, 1, 1, 1, 1,
-1.548196, -1.038003, -3.042968, 1, 1, 1, 1, 1,
-1.540107, 0.2079762, -2.09822, 1, 1, 1, 1, 1,
-1.530117, -1.314813, -2.20431, 1, 1, 1, 1, 1,
-1.520304, 1.793947, -0.9682485, 1, 1, 1, 1, 1,
-1.514677, 0.2970709, -2.055455, 1, 1, 1, 1, 1,
-1.499039, -1.082895, -4.543365, 1, 1, 1, 1, 1,
-1.487382, -0.2382624, -3.329561, 0, 0, 1, 1, 1,
-1.474792, -0.2105614, -1.018553, 1, 0, 0, 1, 1,
-1.467903, -0.1395398, -1.269433, 1, 0, 0, 1, 1,
-1.465371, -0.06123254, -1.530477, 1, 0, 0, 1, 1,
-1.46434, -1.592394, -2.124351, 1, 0, 0, 1, 1,
-1.459446, -0.8774292, -2.325789, 1, 0, 0, 1, 1,
-1.459028, -1.013376, -0.8826223, 0, 0, 0, 1, 1,
-1.446675, 0.7106231, -1.326246, 0, 0, 0, 1, 1,
-1.443353, 1.177593, 0.7883662, 0, 0, 0, 1, 1,
-1.44002, -0.326752, -0.5843841, 0, 0, 0, 1, 1,
-1.421497, 0.3377602, 0.8582533, 0, 0, 0, 1, 1,
-1.420901, 0.7240571, -0.6772813, 0, 0, 0, 1, 1,
-1.418472, 0.3960528, -2.136282, 0, 0, 0, 1, 1,
-1.418096, -0.4229749, -2.691653, 1, 1, 1, 1, 1,
-1.413514, 1.379582, -0.4858803, 1, 1, 1, 1, 1,
-1.411039, -0.7316869, -1.507093, 1, 1, 1, 1, 1,
-1.408377, -0.1390308, -1.675172, 1, 1, 1, 1, 1,
-1.395939, 1.082705, -1.56389, 1, 1, 1, 1, 1,
-1.385915, 0.4690198, -1.639298, 1, 1, 1, 1, 1,
-1.385884, 0.8069039, 0.2911154, 1, 1, 1, 1, 1,
-1.382886, -0.4450887, -2.057904, 1, 1, 1, 1, 1,
-1.379696, -0.9409775, -2.787549, 1, 1, 1, 1, 1,
-1.378958, -0.5667177, -0.9520288, 1, 1, 1, 1, 1,
-1.37831, -0.4877431, -1.719199, 1, 1, 1, 1, 1,
-1.372872, 0.1837666, -3.394989, 1, 1, 1, 1, 1,
-1.370178, -0.8708797, -2.406579, 1, 1, 1, 1, 1,
-1.357643, 0.4128594, -2.409924, 1, 1, 1, 1, 1,
-1.35239, 0.03680865, 0.5031306, 1, 1, 1, 1, 1,
-1.347955, -0.8071324, -1.312553, 0, 0, 1, 1, 1,
-1.331525, -0.5810003, -1.983165, 1, 0, 0, 1, 1,
-1.328626, 1.490102, -0.2450167, 1, 0, 0, 1, 1,
-1.314983, 0.7667875, -0.7853289, 1, 0, 0, 1, 1,
-1.29349, -0.6638494, -4.967207, 1, 0, 0, 1, 1,
-1.290844, -1.172022, -0.5845303, 1, 0, 0, 1, 1,
-1.290327, -0.5375573, -0.8619579, 0, 0, 0, 1, 1,
-1.288061, -0.1277052, -0.6289043, 0, 0, 0, 1, 1,
-1.287535, 0.4339598, -2.203849, 0, 0, 0, 1, 1,
-1.28739, 1.434891, 0.701873, 0, 0, 0, 1, 1,
-1.269771, -0.6391901, -1.671704, 0, 0, 0, 1, 1,
-1.26386, 0.01525856, 0.2532472, 0, 0, 0, 1, 1,
-1.263065, -1.709704, -2.143807, 0, 0, 0, 1, 1,
-1.255786, -0.1826753, -2.611573, 1, 1, 1, 1, 1,
-1.24461, -2.126961, -3.52521, 1, 1, 1, 1, 1,
-1.236327, -2.124618, -3.341552, 1, 1, 1, 1, 1,
-1.229462, 0.05466602, -0.250043, 1, 1, 1, 1, 1,
-1.228631, -2.245683, -3.061717, 1, 1, 1, 1, 1,
-1.227052, 0.6026226, 0.3823662, 1, 1, 1, 1, 1,
-1.220433, 0.4678524, -1.13933, 1, 1, 1, 1, 1,
-1.211977, -0.2501867, -2.256591, 1, 1, 1, 1, 1,
-1.208964, -0.7730696, -2.250627, 1, 1, 1, 1, 1,
-1.20086, 0.3016677, -3.583643, 1, 1, 1, 1, 1,
-1.197874, 2.075666, -0.9982263, 1, 1, 1, 1, 1,
-1.19786, -0.7405763, -0.3452258, 1, 1, 1, 1, 1,
-1.194642, 0.4359157, -0.6270376, 1, 1, 1, 1, 1,
-1.193385, 0.02095855, -2.143165, 1, 1, 1, 1, 1,
-1.187047, -0.08000063, -2.062219, 1, 1, 1, 1, 1,
-1.186156, 0.7599807, -0.2894918, 0, 0, 1, 1, 1,
-1.182112, -1.984918, -0.713328, 1, 0, 0, 1, 1,
-1.177888, -0.06849921, -1.608703, 1, 0, 0, 1, 1,
-1.171862, -1.295773, -3.253127, 1, 0, 0, 1, 1,
-1.169912, 0.7935439, -0.5950474, 1, 0, 0, 1, 1,
-1.164694, -0.4602804, -1.136006, 1, 0, 0, 1, 1,
-1.164443, -0.5310104, -3.315356, 0, 0, 0, 1, 1,
-1.159358, -1.060697, -2.889357, 0, 0, 0, 1, 1,
-1.157524, 0.756224, 0.3154507, 0, 0, 0, 1, 1,
-1.153224, -0.6630912, -2.215138, 0, 0, 0, 1, 1,
-1.151312, 1.07133, -2.55959, 0, 0, 0, 1, 1,
-1.138188, 0.4058025, -0.9935836, 0, 0, 0, 1, 1,
-1.127381, -1.863469, -1.338573, 0, 0, 0, 1, 1,
-1.125548, -0.2601652, 0.08302984, 1, 1, 1, 1, 1,
-1.122404, 1.888627, -1.271252, 1, 1, 1, 1, 1,
-1.118945, -0.2548045, -2.015601, 1, 1, 1, 1, 1,
-1.11729, -0.2593651, -2.679982, 1, 1, 1, 1, 1,
-1.115536, -0.7896467, -1.8305, 1, 1, 1, 1, 1,
-1.115454, -0.06817213, -1.938773, 1, 1, 1, 1, 1,
-1.11367, -0.4249766, -3.818118, 1, 1, 1, 1, 1,
-1.112467, -0.705533, -2.327477, 1, 1, 1, 1, 1,
-1.110191, -1.397152, -1.068314, 1, 1, 1, 1, 1,
-1.108337, 1.701031, 0.04366067, 1, 1, 1, 1, 1,
-1.107651, -0.08265319, -3.261738, 1, 1, 1, 1, 1,
-1.099815, 0.4885485, -1.35202, 1, 1, 1, 1, 1,
-1.096269, -1.825762, -3.074417, 1, 1, 1, 1, 1,
-1.095773, 0.2006588, -3.602501, 1, 1, 1, 1, 1,
-1.086284, 0.7228327, -2.474967, 1, 1, 1, 1, 1,
-1.084148, 0.9189801, -0.4004057, 0, 0, 1, 1, 1,
-1.082425, -1.004298, -1.715087, 1, 0, 0, 1, 1,
-1.082359, 1.363938, -2.539202, 1, 0, 0, 1, 1,
-1.079062, -0.347341, -0.9054549, 1, 0, 0, 1, 1,
-1.075239, -0.5902706, -1.442379, 1, 0, 0, 1, 1,
-1.073916, -0.4536125, -2.483919, 1, 0, 0, 1, 1,
-1.073338, 0.8469267, -0.0811623, 0, 0, 0, 1, 1,
-1.064715, 0.5341073, -1.727506, 0, 0, 0, 1, 1,
-1.063087, -0.1113772, -1.393763, 0, 0, 0, 1, 1,
-1.062269, 0.0446688, -1.458516, 0, 0, 0, 1, 1,
-1.057565, 0.4581425, 0.0674988, 0, 0, 0, 1, 1,
-1.053107, -0.3188355, -2.234217, 0, 0, 0, 1, 1,
-1.049914, 0.868133, -3.735892, 0, 0, 0, 1, 1,
-1.048996, 0.3500347, -1.213993, 1, 1, 1, 1, 1,
-1.03972, -0.4996153, -1.049586, 1, 1, 1, 1, 1,
-1.037164, -0.7654477, -1.236142, 1, 1, 1, 1, 1,
-1.028931, 1.323332, -2.523402, 1, 1, 1, 1, 1,
-1.027295, -0.1263431, -1.37009, 1, 1, 1, 1, 1,
-1.0222, -0.9392816, -0.3157246, 1, 1, 1, 1, 1,
-1.021625, 0.3346737, -0.9649746, 1, 1, 1, 1, 1,
-1.010504, -0.05578025, -1.894497, 1, 1, 1, 1, 1,
-1.010439, -0.1062375, -1.891107, 1, 1, 1, 1, 1,
-1.007473, -1.109486, -2.146277, 1, 1, 1, 1, 1,
-1.005753, 0.9669738, -0.5045702, 1, 1, 1, 1, 1,
-1.005204, -1.192461, -2.466797, 1, 1, 1, 1, 1,
-1.002601, -0.9001936, -3.571964, 1, 1, 1, 1, 1,
-0.9926366, 0.5488807, -1.063125, 1, 1, 1, 1, 1,
-0.9922728, -0.8206894, -2.444481, 1, 1, 1, 1, 1,
-0.9894236, 0.310617, -1.344242, 0, 0, 1, 1, 1,
-0.9818639, 0.5616701, -1.496332, 1, 0, 0, 1, 1,
-0.9724965, -1.923203, -3.543796, 1, 0, 0, 1, 1,
-0.9681674, -2.328845, -3.563465, 1, 0, 0, 1, 1,
-0.964834, -0.1690463, -1.380926, 1, 0, 0, 1, 1,
-0.9584343, -1.214459, -2.563443, 1, 0, 0, 1, 1,
-0.9579472, -2.41885, -3.982969, 0, 0, 0, 1, 1,
-0.9447243, -0.6162876, -1.326138, 0, 0, 0, 1, 1,
-0.9445676, -2.026966, -1.597109, 0, 0, 0, 1, 1,
-0.937563, -0.531955, -1.623785, 0, 0, 0, 1, 1,
-0.9365468, 0.7549574, -2.961966, 0, 0, 0, 1, 1,
-0.9264351, -0.9942985, -2.534071, 0, 0, 0, 1, 1,
-0.9205613, 1.172107, -0.7266036, 0, 0, 0, 1, 1,
-0.9189216, 0.23173, -0.144869, 1, 1, 1, 1, 1,
-0.9182147, -0.7381723, -3.1546, 1, 1, 1, 1, 1,
-0.9168406, 1.481518, -1.004294, 1, 1, 1, 1, 1,
-0.9165556, -0.408353, -3.994255, 1, 1, 1, 1, 1,
-0.9146985, 0.7536806, -1.36066, 1, 1, 1, 1, 1,
-0.9105774, -0.3018671, -1.16781, 1, 1, 1, 1, 1,
-0.9102477, 1.717036, -1.704327, 1, 1, 1, 1, 1,
-0.909739, 0.7914725, -2.035317, 1, 1, 1, 1, 1,
-0.9018316, -0.1051028, -0.880276, 1, 1, 1, 1, 1,
-0.8996041, 0.4374638, -0.565231, 1, 1, 1, 1, 1,
-0.8977479, -0.8066983, 0.09756855, 1, 1, 1, 1, 1,
-0.8972656, 1.451763, -0.9776216, 1, 1, 1, 1, 1,
-0.8965047, -0.05599669, -1.960823, 1, 1, 1, 1, 1,
-0.8914337, 1.101811, 0.07654944, 1, 1, 1, 1, 1,
-0.8731011, 1.075982, 0.03710501, 1, 1, 1, 1, 1,
-0.8604247, -0.6876407, -1.086071, 0, 0, 1, 1, 1,
-0.8522564, 1.543108, 0.2346984, 1, 0, 0, 1, 1,
-0.8468749, -0.4620624, -1.142176, 1, 0, 0, 1, 1,
-0.8468023, 0.5958312, -1.084934, 1, 0, 0, 1, 1,
-0.84209, 0.173798, -0.892356, 1, 0, 0, 1, 1,
-0.8410419, 0.2546152, -0.1528989, 1, 0, 0, 1, 1,
-0.8405676, -0.8946375, -1.657624, 0, 0, 0, 1, 1,
-0.8237054, -1.073961, -2.836854, 0, 0, 0, 1, 1,
-0.8186152, -0.388831, 0.3907707, 0, 0, 0, 1, 1,
-0.8083877, 1.634741, 0.8761918, 0, 0, 0, 1, 1,
-0.8055729, 0.1845914, -0.6228616, 0, 0, 0, 1, 1,
-0.8051507, -0.2269945, -1.408691, 0, 0, 0, 1, 1,
-0.8026756, -0.6134546, -3.867402, 0, 0, 0, 1, 1,
-0.7996953, -0.6828165, -1.499845, 1, 1, 1, 1, 1,
-0.797622, 0.4390095, -0.9888301, 1, 1, 1, 1, 1,
-0.7913077, -1.169057, -4.326065, 1, 1, 1, 1, 1,
-0.7859642, 1.257347, -0.009340611, 1, 1, 1, 1, 1,
-0.7806445, 0.6357628, -2.564693, 1, 1, 1, 1, 1,
-0.780413, 0.5253196, -2.772386, 1, 1, 1, 1, 1,
-0.7800932, 0.03562296, -0.4943959, 1, 1, 1, 1, 1,
-0.7751138, 0.7594907, -2.218943, 1, 1, 1, 1, 1,
-0.7715756, -0.8025979, -1.314952, 1, 1, 1, 1, 1,
-0.7679496, -2.172995, -4.998102, 1, 1, 1, 1, 1,
-0.7596174, -0.9045231, -2.883634, 1, 1, 1, 1, 1,
-0.759615, -0.9805618, -3.000523, 1, 1, 1, 1, 1,
-0.758997, 0.5827409, 0.3397095, 1, 1, 1, 1, 1,
-0.7520531, 0.07184758, -1.967217, 1, 1, 1, 1, 1,
-0.7497991, -2.705333, -2.523376, 1, 1, 1, 1, 1,
-0.7477781, 0.5418894, -1.545192, 0, 0, 1, 1, 1,
-0.7450591, 0.6543863, -2.386147, 1, 0, 0, 1, 1,
-0.7383327, 1.761274, 1.317376, 1, 0, 0, 1, 1,
-0.7321073, 1.455476, 0.4026052, 1, 0, 0, 1, 1,
-0.7299098, -0.3429336, -0.4148605, 1, 0, 0, 1, 1,
-0.7266018, 1.127329, -0.1249801, 1, 0, 0, 1, 1,
-0.7240338, 0.1187106, -1.259528, 0, 0, 0, 1, 1,
-0.7221626, -0.7118403, -2.141517, 0, 0, 0, 1, 1,
-0.7188276, 0.2761571, -0.8219903, 0, 0, 0, 1, 1,
-0.7174417, 0.6318209, -1.016251, 0, 0, 0, 1, 1,
-0.7066925, -0.6667557, -3.498568, 0, 0, 0, 1, 1,
-0.7010878, 0.3482443, -1.541122, 0, 0, 0, 1, 1,
-0.6982689, 0.7903152, -0.3082524, 0, 0, 0, 1, 1,
-0.6961074, 1.317586, -2.11324, 1, 1, 1, 1, 1,
-0.6928184, -1.487265, -1.924512, 1, 1, 1, 1, 1,
-0.689923, 1.387727, -2.186503, 1, 1, 1, 1, 1,
-0.6891589, -0.1567553, -1.092253, 1, 1, 1, 1, 1,
-0.6878618, 0.8990248, 0.3873607, 1, 1, 1, 1, 1,
-0.6877122, 0.2113071, -0.3470663, 1, 1, 1, 1, 1,
-0.6836458, -0.01270224, -3.218122, 1, 1, 1, 1, 1,
-0.6831642, -1.325576, -1.996909, 1, 1, 1, 1, 1,
-0.6826583, 1.57478, -1.458467, 1, 1, 1, 1, 1,
-0.6740603, -0.6023083, -1.749379, 1, 1, 1, 1, 1,
-0.6734133, 0.2268092, -0.6349002, 1, 1, 1, 1, 1,
-0.6705753, 1.194496, -0.6194317, 1, 1, 1, 1, 1,
-0.6663661, -0.1143857, -1.787675, 1, 1, 1, 1, 1,
-0.6555283, 0.3356673, -1.061561, 1, 1, 1, 1, 1,
-0.6554963, 1.611591, -1.623476, 1, 1, 1, 1, 1,
-0.6522976, 1.127672, -0.7007036, 0, 0, 1, 1, 1,
-0.6438554, -1.252899, -2.295962, 1, 0, 0, 1, 1,
-0.6392565, 1.770644, 1.829794, 1, 0, 0, 1, 1,
-0.634674, 0.7641497, -2.640851, 1, 0, 0, 1, 1,
-0.6282, 1.14825, -0.2357654, 1, 0, 0, 1, 1,
-0.6256695, 1.808019, -0.9765223, 1, 0, 0, 1, 1,
-0.6256147, -0.4096307, -2.173652, 0, 0, 0, 1, 1,
-0.6253021, -2.352373, -3.083092, 0, 0, 0, 1, 1,
-0.62326, 0.2794836, -2.477332, 0, 0, 0, 1, 1,
-0.6185094, -0.8629263, -1.701373, 0, 0, 0, 1, 1,
-0.6176197, -0.3308622, -2.591271, 0, 0, 0, 1, 1,
-0.6151051, 0.578608, -1.052868, 0, 0, 0, 1, 1,
-0.6089399, -1.453755, -3.596759, 0, 0, 0, 1, 1,
-0.6028273, -1.076854, -2.325318, 1, 1, 1, 1, 1,
-0.6005759, -1.018165, -4.031537, 1, 1, 1, 1, 1,
-0.5981686, -0.9992204, -2.810413, 1, 1, 1, 1, 1,
-0.5967641, -0.9137247, -1.364074, 1, 1, 1, 1, 1,
-0.5947088, 0.04550584, -3.777145, 1, 1, 1, 1, 1,
-0.5935227, 0.06632407, -1.853279, 1, 1, 1, 1, 1,
-0.5895607, 0.09032718, -0.221718, 1, 1, 1, 1, 1,
-0.588573, -1.163338, -3.503171, 1, 1, 1, 1, 1,
-0.5814783, 0.2359198, -0.7077011, 1, 1, 1, 1, 1,
-0.580142, -0.6100642, -3.539833, 1, 1, 1, 1, 1,
-0.5800777, 0.2090518, -0.4682106, 1, 1, 1, 1, 1,
-0.5777472, 0.1902438, -1.229107, 1, 1, 1, 1, 1,
-0.5746532, 0.8357193, -1.4878, 1, 1, 1, 1, 1,
-0.5745864, -0.2209165, -1.712748, 1, 1, 1, 1, 1,
-0.5687026, 0.7220607, -0.0208206, 1, 1, 1, 1, 1,
-0.5686622, 1.373033, -0.5909333, 0, 0, 1, 1, 1,
-0.5684044, 1.480588, -1.089066, 1, 0, 0, 1, 1,
-0.5683201, 0.9155145, 0.9873877, 1, 0, 0, 1, 1,
-0.5657771, -0.2200221, -0.2535414, 1, 0, 0, 1, 1,
-0.5636421, 1.305737, -0.8708386, 1, 0, 0, 1, 1,
-0.5616665, 1.429109, -1.123233, 1, 0, 0, 1, 1,
-0.5612943, 0.4449212, -1.284507, 0, 0, 0, 1, 1,
-0.5544415, -0.09843982, -1.518815, 0, 0, 0, 1, 1,
-0.553332, -0.8861599, -1.461055, 0, 0, 0, 1, 1,
-0.5491115, -0.2815363, -5.135869, 0, 0, 0, 1, 1,
-0.5467761, 0.3264726, -1.836439, 0, 0, 0, 1, 1,
-0.5443765, -0.3069513, -1.5357, 0, 0, 0, 1, 1,
-0.5430111, 0.1145719, -2.944438, 0, 0, 0, 1, 1,
-0.5406077, -0.1658454, -2.302187, 1, 1, 1, 1, 1,
-0.531477, 0.07723103, -1.305537, 1, 1, 1, 1, 1,
-0.5308148, -0.4508339, -2.732992, 1, 1, 1, 1, 1,
-0.5282323, 0.9754377, -0.5201992, 1, 1, 1, 1, 1,
-0.5266088, 0.8159792, -1.793331, 1, 1, 1, 1, 1,
-0.5198771, -0.1414296, -2.84605, 1, 1, 1, 1, 1,
-0.5178743, 1.530597, -1.989587, 1, 1, 1, 1, 1,
-0.5141432, -1.061635, -2.094486, 1, 1, 1, 1, 1,
-0.511181, 0.1358822, 0.5646867, 1, 1, 1, 1, 1,
-0.5095927, 0.1373813, -1.946364, 1, 1, 1, 1, 1,
-0.5079608, 0.6184802, -0.4506869, 1, 1, 1, 1, 1,
-0.4939658, 2.577714, -0.08479433, 1, 1, 1, 1, 1,
-0.4840118, 0.8322852, 0.1474667, 1, 1, 1, 1, 1,
-0.4826511, -0.5161921, 0.3549741, 1, 1, 1, 1, 1,
-0.4612755, -1.116519, -2.82713, 1, 1, 1, 1, 1,
-0.455519, 0.8841264, 0.000907701, 0, 0, 1, 1, 1,
-0.4531902, 0.3757711, -2.226682, 1, 0, 0, 1, 1,
-0.4517247, -0.7699652, 0.3163843, 1, 0, 0, 1, 1,
-0.441081, -0.1544905, -1.939961, 1, 0, 0, 1, 1,
-0.4399195, 0.2154422, -3.063023, 1, 0, 0, 1, 1,
-0.4393402, 0.3476177, -0.5808401, 1, 0, 0, 1, 1,
-0.4359964, 0.2506353, 0.01406621, 0, 0, 0, 1, 1,
-0.4252297, -1.168168, -3.945029, 0, 0, 0, 1, 1,
-0.4207524, -0.7074584, -1.315587, 0, 0, 0, 1, 1,
-0.4205633, 2.192091, -0.4452908, 0, 0, 0, 1, 1,
-0.4192766, -0.9601995, -2.857914, 0, 0, 0, 1, 1,
-0.4147557, -1.303037, -3.067554, 0, 0, 0, 1, 1,
-0.4115469, -0.3169127, -1.752643, 0, 0, 0, 1, 1,
-0.4099535, -1.14527, -3.613407, 1, 1, 1, 1, 1,
-0.4097475, 0.5826698, 1.499575, 1, 1, 1, 1, 1,
-0.4096636, -1.016198, -4.984644, 1, 1, 1, 1, 1,
-0.4090626, -0.1553908, -2.29422, 1, 1, 1, 1, 1,
-0.409043, -0.2381223, -1.735501, 1, 1, 1, 1, 1,
-0.4086125, 2.137709, 0.580284, 1, 1, 1, 1, 1,
-0.4066799, -1.163664, -2.213805, 1, 1, 1, 1, 1,
-0.4041086, -0.6239769, -2.297027, 1, 1, 1, 1, 1,
-0.396724, -0.8371079, -3.78772, 1, 1, 1, 1, 1,
-0.3959526, -1.001922, -3.769815, 1, 1, 1, 1, 1,
-0.3945503, -1.29135, -2.147718, 1, 1, 1, 1, 1,
-0.3939846, 0.2115237, -1.887756, 1, 1, 1, 1, 1,
-0.3914767, 1.18021, -1.168049, 1, 1, 1, 1, 1,
-0.3902451, -1.261731, -3.212373, 1, 1, 1, 1, 1,
-0.380644, 0.648784, -0.479549, 1, 1, 1, 1, 1,
-0.3790294, -1.109475, -2.719358, 0, 0, 1, 1, 1,
-0.3770472, -0.7449402, -4.848349, 1, 0, 0, 1, 1,
-0.3744341, 1.070509, -0.6432232, 1, 0, 0, 1, 1,
-0.3722809, 1.246265, -0.3197659, 1, 0, 0, 1, 1,
-0.3700519, 0.07244135, -2.137973, 1, 0, 0, 1, 1,
-0.3697755, -0.002436349, -0.7768826, 1, 0, 0, 1, 1,
-0.3631684, -2.611362, -2.762791, 0, 0, 0, 1, 1,
-0.35675, 0.4361824, 1.037284, 0, 0, 0, 1, 1,
-0.3562901, -0.6701515, -2.811936, 0, 0, 0, 1, 1,
-0.3542488, 0.9826027, 0.2169302, 0, 0, 0, 1, 1,
-0.3528582, 0.4849457, -1.351246, 0, 0, 0, 1, 1,
-0.3415309, -0.1777608, -1.374394, 0, 0, 0, 1, 1,
-0.3347203, -0.7398885, -2.67494, 0, 0, 0, 1, 1,
-0.3337998, -1.730736, -1.430805, 1, 1, 1, 1, 1,
-0.3316314, 0.4043932, -1.547867, 1, 1, 1, 1, 1,
-0.3307755, -0.7854675, -3.018768, 1, 1, 1, 1, 1,
-0.3296212, -0.6713361, -2.35097, 1, 1, 1, 1, 1,
-0.3268624, 0.3127317, -1.817922, 1, 1, 1, 1, 1,
-0.2992153, 1.066545, -2.576014, 1, 1, 1, 1, 1,
-0.2974787, 0.7614236, 0.7486246, 1, 1, 1, 1, 1,
-0.2949557, 1.133547, -1.726456, 1, 1, 1, 1, 1,
-0.2937312, 0.5313234, 0.5196248, 1, 1, 1, 1, 1,
-0.2897365, -0.6428804, -2.332316, 1, 1, 1, 1, 1,
-0.2836361, -1.217223, -2.199283, 1, 1, 1, 1, 1,
-0.2751974, 1.141934, -0.7592384, 1, 1, 1, 1, 1,
-0.2642837, 0.3990203, -1.433305, 1, 1, 1, 1, 1,
-0.2613267, -1.014201, -3.827487, 1, 1, 1, 1, 1,
-0.2597711, 0.4565697, -1.120444, 1, 1, 1, 1, 1,
-0.25752, -0.3582519, -3.405318, 0, 0, 1, 1, 1,
-0.2567771, -1.804855, -1.869498, 1, 0, 0, 1, 1,
-0.2556557, -2.250183, -0.9247985, 1, 0, 0, 1, 1,
-0.2536226, -0.354398, -2.125854, 1, 0, 0, 1, 1,
-0.2530802, 0.5376031, 1.216681, 1, 0, 0, 1, 1,
-0.2496414, -0.1071648, -2.344175, 1, 0, 0, 1, 1,
-0.2462596, 0.5767592, 0.5391758, 0, 0, 0, 1, 1,
-0.2448875, 0.8756025, 0.3578337, 0, 0, 0, 1, 1,
-0.2426167, 1.984591, 0.04334727, 0, 0, 0, 1, 1,
-0.2384629, -0.17866, -1.269393, 0, 0, 0, 1, 1,
-0.2364794, 0.2427329, 0.03283489, 0, 0, 0, 1, 1,
-0.2357487, -0.9498615, -2.099942, 0, 0, 0, 1, 1,
-0.2348177, -1.489996, -4.102509, 0, 0, 0, 1, 1,
-0.232781, 1.174657, -0.223008, 1, 1, 1, 1, 1,
-0.2324226, -0.8042238, -3.275713, 1, 1, 1, 1, 1,
-0.2311547, 1.279464, -2.374769, 1, 1, 1, 1, 1,
-0.2294082, -0.7465593, -4.074401, 1, 1, 1, 1, 1,
-0.2271115, 0.2896342, 0.8482395, 1, 1, 1, 1, 1,
-0.2139043, -0.2205016, -3.362107, 1, 1, 1, 1, 1,
-0.2125835, 0.7012452, 0.5576282, 1, 1, 1, 1, 1,
-0.2124368, 0.4894962, -0.6156526, 1, 1, 1, 1, 1,
-0.2119366, 0.4644158, -1.796259, 1, 1, 1, 1, 1,
-0.2107911, -0.1139231, -3.717968, 1, 1, 1, 1, 1,
-0.2100901, 0.3061633, -0.9129216, 1, 1, 1, 1, 1,
-0.2096488, 1.150541, -0.1822424, 1, 1, 1, 1, 1,
-0.2072835, -0.3459345, -2.520377, 1, 1, 1, 1, 1,
-0.2071095, 0.1845013, -1.216433, 1, 1, 1, 1, 1,
-0.2054326, -0.1074553, -2.947435, 1, 1, 1, 1, 1,
-0.2052216, 0.4645128, -0.5064588, 0, 0, 1, 1, 1,
-0.2027276, 0.8421097, 0.8346529, 1, 0, 0, 1, 1,
-0.1937083, -1.262344, -3.900812, 1, 0, 0, 1, 1,
-0.1934601, 1.403675, -1.620874, 1, 0, 0, 1, 1,
-0.1903751, -0.3039539, -3.811032, 1, 0, 0, 1, 1,
-0.1830407, 1.67441, 0.2089142, 1, 0, 0, 1, 1,
-0.1827265, -0.01064804, -1.372263, 0, 0, 0, 1, 1,
-0.1792866, 0.2046736, -0.7871228, 0, 0, 0, 1, 1,
-0.1781978, -1.867822, -3.611062, 0, 0, 0, 1, 1,
-0.1781097, 0.5600779, -0.9539281, 0, 0, 0, 1, 1,
-0.1763084, 0.1020658, -0.7230046, 0, 0, 0, 1, 1,
-0.1752421, 0.457858, -1.362122, 0, 0, 0, 1, 1,
-0.1711127, 0.6585131, 0.7697331, 0, 0, 0, 1, 1,
-0.1705268, 0.3719739, -0.3598792, 1, 1, 1, 1, 1,
-0.1700953, 0.2062336, 0.3550257, 1, 1, 1, 1, 1,
-0.1688768, 0.9262791, 0.1615885, 1, 1, 1, 1, 1,
-0.1611719, -0.6583815, -1.290703, 1, 1, 1, 1, 1,
-0.1560664, -1.107212, -2.877959, 1, 1, 1, 1, 1,
-0.1551581, -0.7229562, -3.813497, 1, 1, 1, 1, 1,
-0.1510156, -1.224115, -1.387128, 1, 1, 1, 1, 1,
-0.1467663, 0.1766762, -0.5967127, 1, 1, 1, 1, 1,
-0.1458811, 0.5016498, 0.4468382, 1, 1, 1, 1, 1,
-0.1456333, -2.036145, -2.492517, 1, 1, 1, 1, 1,
-0.1430862, -0.2129757, -0.7153847, 1, 1, 1, 1, 1,
-0.1370973, -2.110185, -2.66607, 1, 1, 1, 1, 1,
-0.1350626, -1.929035, -1.950707, 1, 1, 1, 1, 1,
-0.1346531, -0.1249487, -1.409113, 1, 1, 1, 1, 1,
-0.1322926, 0.5780927, 0.5370669, 1, 1, 1, 1, 1,
-0.1322219, -0.5991247, -2.877913, 0, 0, 1, 1, 1,
-0.1312093, 0.4550306, -0.7971755, 1, 0, 0, 1, 1,
-0.1276123, -0.7585337, -2.287603, 1, 0, 0, 1, 1,
-0.1241448, 1.069096, 1.246194, 1, 0, 0, 1, 1,
-0.1209905, -0.7368668, -3.453852, 1, 0, 0, 1, 1,
-0.1203725, 2.146982, 1.872509, 1, 0, 0, 1, 1,
-0.1052699, -0.5196714, -2.330916, 0, 0, 0, 1, 1,
-0.1038973, 1.41613, 1.051416, 0, 0, 0, 1, 1,
-0.1011269, -1.102334, -4.432845, 0, 0, 0, 1, 1,
-0.0945909, 1.641158, -0.3659889, 0, 0, 0, 1, 1,
-0.09439642, -0.3702515, -2.936419, 0, 0, 0, 1, 1,
-0.09332024, -0.5459796, -2.480445, 0, 0, 0, 1, 1,
-0.09279649, -1.347445, -2.937737, 0, 0, 0, 1, 1,
-0.09195212, 0.8210354, -0.9730116, 1, 1, 1, 1, 1,
-0.08975091, -0.6755726, -3.724339, 1, 1, 1, 1, 1,
-0.08600515, -0.2919498, -2.647648, 1, 1, 1, 1, 1,
-0.0856272, -0.4201942, -1.781987, 1, 1, 1, 1, 1,
-0.0838928, -1.537456, -2.928444, 1, 1, 1, 1, 1,
-0.08267837, -0.474367, -3.241796, 1, 1, 1, 1, 1,
-0.07561694, 0.7465217, -0.05125607, 1, 1, 1, 1, 1,
-0.07448967, -1.444389, -2.240744, 1, 1, 1, 1, 1,
-0.07135445, -0.5631096, -5.365424, 1, 1, 1, 1, 1,
-0.07030933, 0.1530688, -1.510724, 1, 1, 1, 1, 1,
-0.06964725, 0.8785425, 1.197346, 1, 1, 1, 1, 1,
-0.06578163, -0.2260632, -0.8098898, 1, 1, 1, 1, 1,
-0.06398445, -0.8549724, -2.586333, 1, 1, 1, 1, 1,
-0.05805396, 0.5893963, 0.1836667, 1, 1, 1, 1, 1,
-0.05266022, 0.3229643, -0.5253975, 1, 1, 1, 1, 1,
-0.0496684, -0.6751478, -3.043441, 0, 0, 1, 1, 1,
-0.04623275, 0.5619597, -1.32151, 1, 0, 0, 1, 1,
-0.04516782, -0.7211012, -1.531761, 1, 0, 0, 1, 1,
-0.04364455, -0.1483563, -2.07669, 1, 0, 0, 1, 1,
-0.04183116, 1.017161, -0.6754357, 1, 0, 0, 1, 1,
-0.04045367, -0.8279378, -3.76281, 1, 0, 0, 1, 1,
-0.03678196, -0.3581747, -3.675371, 0, 0, 0, 1, 1,
-0.03052594, 1.035776, -0.3223398, 0, 0, 0, 1, 1,
-0.02626468, -0.624921, -2.557927, 0, 0, 0, 1, 1,
-0.02421903, -1.158317, -2.79363, 0, 0, 0, 1, 1,
-0.0227652, -0.9366916, -3.212443, 0, 0, 0, 1, 1,
-0.02154932, 1.052064, 0.4865634, 0, 0, 0, 1, 1,
-0.02082339, -0.2891289, -3.386148, 0, 0, 0, 1, 1,
-0.01997204, 0.5159017, -0.1538308, 1, 1, 1, 1, 1,
-0.01947688, 0.09753982, -0.9943935, 1, 1, 1, 1, 1,
-0.01902809, -0.6236995, -2.065337, 1, 1, 1, 1, 1,
-0.01700915, 0.6214902, -0.05563647, 1, 1, 1, 1, 1,
-0.01637744, 0.9613201, -0.4573651, 1, 1, 1, 1, 1,
-0.01497485, 1.684196, -0.1379598, 1, 1, 1, 1, 1,
-0.01192408, -1.706314, -4.370688, 1, 1, 1, 1, 1,
-0.01173175, 1.280419, 0.09568109, 1, 1, 1, 1, 1,
-0.01069507, 1.37189, 0.810459, 1, 1, 1, 1, 1,
-0.0102853, 0.5968432, -2.058831, 1, 1, 1, 1, 1,
-0.008983089, -0.3409733, -3.582262, 1, 1, 1, 1, 1,
-0.008839543, 1.453973, 0.8194179, 1, 1, 1, 1, 1,
0.0008105439, 0.1004499, -0.007049171, 1, 1, 1, 1, 1,
0.001669903, -0.03391369, 2.437443, 1, 1, 1, 1, 1,
0.002153818, 0.9534225, 0.6444859, 1, 1, 1, 1, 1,
0.003755615, 0.1371959, 0.05997741, 0, 0, 1, 1, 1,
0.02008408, 0.7479494, -0.3110269, 1, 0, 0, 1, 1,
0.02169119, 0.9514812, -0.4624987, 1, 0, 0, 1, 1,
0.02628744, -1.51463, 2.329647, 1, 0, 0, 1, 1,
0.02699809, -1.196584, 2.835674, 1, 0, 0, 1, 1,
0.03515661, 0.7525247, -0.3408765, 1, 0, 0, 1, 1,
0.03559551, -0.7607452, 2.560996, 0, 0, 0, 1, 1,
0.03606644, -0.1187545, 1.650357, 0, 0, 0, 1, 1,
0.03775604, -0.107927, 2.164193, 0, 0, 0, 1, 1,
0.03976477, 1.649665, 0.9410814, 0, 0, 0, 1, 1,
0.04027115, 1.738523, 1.20388, 0, 0, 0, 1, 1,
0.0412131, 1.277615, -1.231422, 0, 0, 0, 1, 1,
0.04750597, 0.3648718, 0.2386638, 0, 0, 0, 1, 1,
0.04793971, 0.142878, 0.1565205, 1, 1, 1, 1, 1,
0.04883215, 0.2880896, 1.312802, 1, 1, 1, 1, 1,
0.05097774, -0.5099152, 5.042693, 1, 1, 1, 1, 1,
0.05449125, -0.6888022, 1.455028, 1, 1, 1, 1, 1,
0.05507679, -1.41351, 3.207685, 1, 1, 1, 1, 1,
0.05967306, -1.113532, 3.129792, 1, 1, 1, 1, 1,
0.06316403, -0.4458983, 1.713323, 1, 1, 1, 1, 1,
0.0685653, 0.7162992, 1.255712, 1, 1, 1, 1, 1,
0.06881462, 0.7917629, 1.780454, 1, 1, 1, 1, 1,
0.07401735, -0.1506156, 2.254704, 1, 1, 1, 1, 1,
0.07412121, 0.5264942, -0.1293177, 1, 1, 1, 1, 1,
0.07670393, 0.9723567, 1.569948, 1, 1, 1, 1, 1,
0.07799906, 0.2662688, 0.008137641, 1, 1, 1, 1, 1,
0.07892068, -0.05539525, 3.049255, 1, 1, 1, 1, 1,
0.08093267, 0.963155, -1.529046, 1, 1, 1, 1, 1,
0.08503217, -1.666477, 2.078778, 0, 0, 1, 1, 1,
0.08666771, -0.9052194, 1.815721, 1, 0, 0, 1, 1,
0.08919349, -0.5102674, 3.517342, 1, 0, 0, 1, 1,
0.09144616, -0.6306922, 3.653477, 1, 0, 0, 1, 1,
0.0919985, -1.59466, 4.651613, 1, 0, 0, 1, 1,
0.09439176, -1.654586, 2.464863, 1, 0, 0, 1, 1,
0.09564529, -0.8571608, 3.122778, 0, 0, 0, 1, 1,
0.09569356, -1.539407, 4.136395, 0, 0, 0, 1, 1,
0.0957129, 0.639311, -0.4068721, 0, 0, 0, 1, 1,
0.09829191, 0.8712921, 1.369992, 0, 0, 0, 1, 1,
0.1036449, -0.5338227, 1.930766, 0, 0, 0, 1, 1,
0.1037662, 0.4898683, -0.5899262, 0, 0, 0, 1, 1,
0.10646, 1.495659, -0.5208987, 0, 0, 0, 1, 1,
0.116511, 0.6568663, -0.1558645, 1, 1, 1, 1, 1,
0.1227856, -0.6079788, 2.483716, 1, 1, 1, 1, 1,
0.1245423, 0.3878725, 1.374972, 1, 1, 1, 1, 1,
0.1256603, -1.228802, 2.49029, 1, 1, 1, 1, 1,
0.1268107, -0.2465917, 2.617049, 1, 1, 1, 1, 1,
0.1300317, 0.01022614, 1.944282, 1, 1, 1, 1, 1,
0.1352263, 1.540285, -0.2881884, 1, 1, 1, 1, 1,
0.1410159, 1.694967, -0.7552491, 1, 1, 1, 1, 1,
0.141324, -0.05813536, 2.211611, 1, 1, 1, 1, 1,
0.143032, -0.078105, 0.5704365, 1, 1, 1, 1, 1,
0.1442064, 0.7517484, 0.2987894, 1, 1, 1, 1, 1,
0.1474737, -3.436869, 3.624182, 1, 1, 1, 1, 1,
0.1507153, -2.664559, 2.382049, 1, 1, 1, 1, 1,
0.1537127, 1.423959, -0.1662841, 1, 1, 1, 1, 1,
0.1540868, -0.9807901, 4.1477, 1, 1, 1, 1, 1,
0.1542423, -0.1601154, 2.930739, 0, 0, 1, 1, 1,
0.1549212, -0.7710497, 3.077111, 1, 0, 0, 1, 1,
0.1553306, -0.2610617, 2.203059, 1, 0, 0, 1, 1,
0.1584182, -1.034717, 1.021391, 1, 0, 0, 1, 1,
0.159484, -0.1663641, 2.562209, 1, 0, 0, 1, 1,
0.1679505, -1.462045, 4.039416, 1, 0, 0, 1, 1,
0.1700799, 0.008180617, 1.501348, 0, 0, 0, 1, 1,
0.1717354, 0.1193873, 1.157671, 0, 0, 0, 1, 1,
0.173283, 0.8078403, 0.8801139, 0, 0, 0, 1, 1,
0.1761163, -0.0344111, 2.084514, 0, 0, 0, 1, 1,
0.1784243, 0.1237787, 0.8144485, 0, 0, 0, 1, 1,
0.1791621, -2.143087, 2.403882, 0, 0, 0, 1, 1,
0.1830743, -0.6224971, 2.072268, 0, 0, 0, 1, 1,
0.1892379, 0.6524214, 0.4334952, 1, 1, 1, 1, 1,
0.1901073, 2.055137, -1.588091, 1, 1, 1, 1, 1,
0.1918022, 0.4608834, 0.4261748, 1, 1, 1, 1, 1,
0.1921746, -0.2467427, 1.0251, 1, 1, 1, 1, 1,
0.2038143, 0.5610595, -0.2315857, 1, 1, 1, 1, 1,
0.2041411, -1.715583, 0.7421168, 1, 1, 1, 1, 1,
0.2043485, -0.2754736, 2.107574, 1, 1, 1, 1, 1,
0.2052114, 1.492569, 0.7160444, 1, 1, 1, 1, 1,
0.2070196, -0.9804635, 0.2237652, 1, 1, 1, 1, 1,
0.2079828, 0.9318659, -0.3000235, 1, 1, 1, 1, 1,
0.2112941, -0.9788114, 5.90504, 1, 1, 1, 1, 1,
0.2135124, 0.534923, -0.06917821, 1, 1, 1, 1, 1,
0.2162583, -0.2044133, 3.44711, 1, 1, 1, 1, 1,
0.218863, 0.8372167, 0.2366483, 1, 1, 1, 1, 1,
0.2203946, 0.3379001, 0.4285195, 1, 1, 1, 1, 1,
0.2218279, 0.483044, 0.2302867, 0, 0, 1, 1, 1,
0.2258386, 2.315253, 0.5559595, 1, 0, 0, 1, 1,
0.229598, -1.444555, 2.199822, 1, 0, 0, 1, 1,
0.2296229, 0.4157249, 0.3158017, 1, 0, 0, 1, 1,
0.231762, -1.903393, 0.5543648, 1, 0, 0, 1, 1,
0.2403568, 0.1574601, -0.1234723, 1, 0, 0, 1, 1,
0.2448409, 1.106452, 0.6982351, 0, 0, 0, 1, 1,
0.2448411, -0.4401253, 2.171615, 0, 0, 0, 1, 1,
0.2449812, -1.173933, 3.541089, 0, 0, 0, 1, 1,
0.2462561, -0.8498193, 2.980691, 0, 0, 0, 1, 1,
0.2476535, 0.04677413, 0.8553105, 0, 0, 0, 1, 1,
0.2477758, -0.008908288, 0.5026644, 0, 0, 0, 1, 1,
0.2487206, 0.106011, 1.215729, 0, 0, 0, 1, 1,
0.2546449, 0.1123723, -0.4757202, 1, 1, 1, 1, 1,
0.2569751, 0.6876933, -0.7483183, 1, 1, 1, 1, 1,
0.2581469, 0.9911784, 1.699019, 1, 1, 1, 1, 1,
0.266628, -0.4703197, 3.781039, 1, 1, 1, 1, 1,
0.2677003, 0.2702987, 1.073184, 1, 1, 1, 1, 1,
0.2711891, 0.1301802, 0.6102544, 1, 1, 1, 1, 1,
0.273824, -1.57196, 2.418065, 1, 1, 1, 1, 1,
0.2793385, 1.038263, 1.867143, 1, 1, 1, 1, 1,
0.281839, 1.486916, 2.091486, 1, 1, 1, 1, 1,
0.2825734, -0.5821561, 1.549683, 1, 1, 1, 1, 1,
0.3047878, 0.1972155, 0.8594438, 1, 1, 1, 1, 1,
0.3080024, -0.1763071, 0.9967977, 1, 1, 1, 1, 1,
0.3130915, 2.470568, 0.8877636, 1, 1, 1, 1, 1,
0.3145534, 0.03949066, 0.7852064, 1, 1, 1, 1, 1,
0.3156676, 0.2530077, 2.001725, 1, 1, 1, 1, 1,
0.3187701, -2.079069, 1.45703, 0, 0, 1, 1, 1,
0.3216861, -1.236762, 2.034894, 1, 0, 0, 1, 1,
0.3234974, -1.56583, 1.748627, 1, 0, 0, 1, 1,
0.32598, -0.812473, 4.897808, 1, 0, 0, 1, 1,
0.3274728, -0.06233079, 0.9428743, 1, 0, 0, 1, 1,
0.329665, 0.2307131, 0.770686, 1, 0, 0, 1, 1,
0.3420947, 1.22594, -0.6731198, 0, 0, 0, 1, 1,
0.3431791, -0.2490358, 2.891178, 0, 0, 0, 1, 1,
0.3446782, -1.056258, 2.089616, 0, 0, 0, 1, 1,
0.344953, 0.7174556, 0.04137241, 0, 0, 0, 1, 1,
0.3526376, -0.155936, 1.761287, 0, 0, 0, 1, 1,
0.3530259, 1.38384, -0.9782362, 0, 0, 0, 1, 1,
0.3533148, -1.350564, 4.225289, 0, 0, 0, 1, 1,
0.3540621, 1.296758, -0.4920141, 1, 1, 1, 1, 1,
0.3546667, 0.007071375, 3.397549, 1, 1, 1, 1, 1,
0.3572682, -1.23455, 3.577323, 1, 1, 1, 1, 1,
0.3579873, 1.314516, 0.7371821, 1, 1, 1, 1, 1,
0.3584171, 0.3154125, 1.886431, 1, 1, 1, 1, 1,
0.3686325, -0.9010881, 3.929217, 1, 1, 1, 1, 1,
0.3709622, -0.7236255, 2.002608, 1, 1, 1, 1, 1,
0.3724038, 1.250051, 0.6177694, 1, 1, 1, 1, 1,
0.375202, -0.4136528, 1.939395, 1, 1, 1, 1, 1,
0.3766779, 1.044278, 0.3667277, 1, 1, 1, 1, 1,
0.3790145, -0.7168585, 1.702469, 1, 1, 1, 1, 1,
0.3813626, 1.086689, 0.9556512, 1, 1, 1, 1, 1,
0.3816278, 0.9966542, 0.1362572, 1, 1, 1, 1, 1,
0.3829391, -0.3945345, 1.913546, 1, 1, 1, 1, 1,
0.3841332, -0.9407635, 3.281896, 1, 1, 1, 1, 1,
0.3850153, 1.799994, 0.8711736, 0, 0, 1, 1, 1,
0.3854292, -2.542889, 4.502125, 1, 0, 0, 1, 1,
0.3869195, 2.020074, -0.04673282, 1, 0, 0, 1, 1,
0.3874363, -0.3101068, 2.267349, 1, 0, 0, 1, 1,
0.388303, 1.535798, 1.089785, 1, 0, 0, 1, 1,
0.3891127, -0.7851918, 2.61051, 1, 0, 0, 1, 1,
0.3962698, -0.757634, 2.583208, 0, 0, 0, 1, 1,
0.3974237, 0.04847635, 2.189321, 0, 0, 0, 1, 1,
0.3979636, -1.240391, 2.294628, 0, 0, 0, 1, 1,
0.399868, 0.9695082, -0.1180303, 0, 0, 0, 1, 1,
0.4095298, -0.4115638, 1.857836, 0, 0, 0, 1, 1,
0.4095729, 0.4984642, 0.3018672, 0, 0, 0, 1, 1,
0.4099323, 0.8843963, 0.6133794, 0, 0, 0, 1, 1,
0.4118391, 0.2232637, -1.194769, 1, 1, 1, 1, 1,
0.4141142, 0.1303535, 1.495201, 1, 1, 1, 1, 1,
0.4157089, 0.5605768, -0.3603876, 1, 1, 1, 1, 1,
0.4167271, -0.2418769, 2.67645, 1, 1, 1, 1, 1,
0.4171254, 0.1120001, 2.63643, 1, 1, 1, 1, 1,
0.4184896, -0.7388884, 2.341141, 1, 1, 1, 1, 1,
0.4185295, 0.03079945, 2.639642, 1, 1, 1, 1, 1,
0.4238161, -0.8549516, 1.627806, 1, 1, 1, 1, 1,
0.4263433, -0.07427056, 1.644818, 1, 1, 1, 1, 1,
0.4290057, -1.407715, 4.364629, 1, 1, 1, 1, 1,
0.4322708, 0.6636294, 1.613882, 1, 1, 1, 1, 1,
0.4376558, 0.002553713, 2.346452, 1, 1, 1, 1, 1,
0.4411537, 0.8742077, 0.006225863, 1, 1, 1, 1, 1,
0.4434321, -0.4690357, 0.2638365, 1, 1, 1, 1, 1,
0.4462729, -0.4077505, 1.814998, 1, 1, 1, 1, 1,
0.44819, -2.123257, 3.16415, 0, 0, 1, 1, 1,
0.4491502, -1.099389, 2.638474, 1, 0, 0, 1, 1,
0.4551457, 0.267563, 1.656266, 1, 0, 0, 1, 1,
0.4569798, -0.8241459, 1.852655, 1, 0, 0, 1, 1,
0.4570403, -0.3245179, 2.532572, 1, 0, 0, 1, 1,
0.4577729, 0.7493256, 0.259497, 1, 0, 0, 1, 1,
0.4601815, 0.7390983, 0.545713, 0, 0, 0, 1, 1,
0.461837, 1.353492, 0.584594, 0, 0, 0, 1, 1,
0.4625671, 0.7305568, -0.362188, 0, 0, 0, 1, 1,
0.4662585, -0.5382123, 1.784746, 0, 0, 0, 1, 1,
0.4688899, -1.136836, 2.412958, 0, 0, 0, 1, 1,
0.4692539, -0.5378007, 2.336999, 0, 0, 0, 1, 1,
0.4694323, 0.372185, 0.2741258, 0, 0, 0, 1, 1,
0.4743078, -0.3727232, 2.701248, 1, 1, 1, 1, 1,
0.4764022, -0.05699388, 1.169382, 1, 1, 1, 1, 1,
0.4790635, -1.152393, 2.499913, 1, 1, 1, 1, 1,
0.4792883, 0.446055, 0.02595235, 1, 1, 1, 1, 1,
0.4863684, -0.385832, 2.370223, 1, 1, 1, 1, 1,
0.4928629, -0.3706529, 3.428787, 1, 1, 1, 1, 1,
0.4940439, -0.5722769, 2.34455, 1, 1, 1, 1, 1,
0.4976292, -1.420737, 2.677093, 1, 1, 1, 1, 1,
0.500452, 2.210124, -0.06041585, 1, 1, 1, 1, 1,
0.501393, 1.126331, 1.48187, 1, 1, 1, 1, 1,
0.5039245, -1.664952, 4.382134, 1, 1, 1, 1, 1,
0.5045599, 0.1789019, 0.06815417, 1, 1, 1, 1, 1,
0.506929, -0.7055949, 2.056361, 1, 1, 1, 1, 1,
0.5076647, 0.3832451, 1.14334, 1, 1, 1, 1, 1,
0.5086524, 0.2490719, 0.2054028, 1, 1, 1, 1, 1,
0.5148814, -0.08095538, 1.263736, 0, 0, 1, 1, 1,
0.5167914, 0.7653751, -0.4874224, 1, 0, 0, 1, 1,
0.5181555, 0.3078139, 1.33164, 1, 0, 0, 1, 1,
0.5184259, 0.3905692, -0.6500138, 1, 0, 0, 1, 1,
0.518611, 1.322014, -1.578961, 1, 0, 0, 1, 1,
0.5208802, 0.2694138, 2.8947, 1, 0, 0, 1, 1,
0.5214698, 0.1425916, 0.8407117, 0, 0, 0, 1, 1,
0.5269424, 0.8959804, -0.1033846, 0, 0, 0, 1, 1,
0.5286036, 0.8192642, -0.7321312, 0, 0, 0, 1, 1,
0.5304459, -0.8425304, 3.529489, 0, 0, 0, 1, 1,
0.5309432, 1.036384, 0.5553406, 0, 0, 0, 1, 1,
0.5358748, -0.2919926, 3.296343, 0, 0, 0, 1, 1,
0.5385238, -1.016181, 2.595397, 0, 0, 0, 1, 1,
0.5411763, 0.5031505, 1.177527, 1, 1, 1, 1, 1,
0.5429617, 0.06930572, 0.04504615, 1, 1, 1, 1, 1,
0.5505926, -1.646363, 3.842621, 1, 1, 1, 1, 1,
0.5564876, 0.225373, 1.077797, 1, 1, 1, 1, 1,
0.5585726, 0.1131244, 2.664932, 1, 1, 1, 1, 1,
0.5589404, -1.082227, 1.770053, 1, 1, 1, 1, 1,
0.5674039, -1.744303, 3.832668, 1, 1, 1, 1, 1,
0.5679759, 0.109586, 1.320024, 1, 1, 1, 1, 1,
0.5685239, -2.429965, 4.230329, 1, 1, 1, 1, 1,
0.5714523, 0.8405977, 0.0864667, 1, 1, 1, 1, 1,
0.5725932, 0.5013313, 2.233613, 1, 1, 1, 1, 1,
0.575661, -1.293411, 2.68966, 1, 1, 1, 1, 1,
0.5771433, -0.4730128, 1.357132, 1, 1, 1, 1, 1,
0.5792907, 2.369245, -0.5074405, 1, 1, 1, 1, 1,
0.5800337, 0.1984509, 1.959367, 1, 1, 1, 1, 1,
0.5812078, -1.024721, 4.905887, 0, 0, 1, 1, 1,
0.5814479, -1.989782, 2.655418, 1, 0, 0, 1, 1,
0.5822069, -0.3117425, 2.741927, 1, 0, 0, 1, 1,
0.5888479, -0.6171533, 1.798804, 1, 0, 0, 1, 1,
0.593049, 1.006713, 0.856372, 1, 0, 0, 1, 1,
0.5935408, -0.6187783, 4.280949, 1, 0, 0, 1, 1,
0.5945439, 0.03387973, 1.113413, 0, 0, 0, 1, 1,
0.6007206, 0.1921168, 0.9262748, 0, 0, 0, 1, 1,
0.6064721, -2.004381, 2.341939, 0, 0, 0, 1, 1,
0.6099163, 0.3780834, 1.563134, 0, 0, 0, 1, 1,
0.6100592, 0.1498597, -0.6179414, 0, 0, 0, 1, 1,
0.6150413, -1.512323, 3.099045, 0, 0, 0, 1, 1,
0.619565, -0.723834, 0.9213035, 0, 0, 0, 1, 1,
0.6205168, -0.8033704, 2.385836, 1, 1, 1, 1, 1,
0.6253656, 0.6149952, -0.7381278, 1, 1, 1, 1, 1,
0.6270684, -0.1073864, 1.709532, 1, 1, 1, 1, 1,
0.629143, 0.3697067, -0.9299957, 1, 1, 1, 1, 1,
0.6329679, 1.018243, 0.04152298, 1, 1, 1, 1, 1,
0.6393321, -0.9881365, 1.137207, 1, 1, 1, 1, 1,
0.646279, 1.502058, 0.8666824, 1, 1, 1, 1, 1,
0.6486605, -0.2782111, 3.964171, 1, 1, 1, 1, 1,
0.650544, 0.8311571, -0.05661409, 1, 1, 1, 1, 1,
0.6514704, -1.32321, 3.113307, 1, 1, 1, 1, 1,
0.6534608, 1.065171, -0.4351103, 1, 1, 1, 1, 1,
0.6536795, -1.617581, 2.348327, 1, 1, 1, 1, 1,
0.6567236, 0.7146893, 0.004687759, 1, 1, 1, 1, 1,
0.660003, 0.06821021, 1.637252, 1, 1, 1, 1, 1,
0.6609132, 1.77725, -0.5759357, 1, 1, 1, 1, 1,
0.666364, -1.284524, -0.946716, 0, 0, 1, 1, 1,
0.6664722, -1.992509, 2.578703, 1, 0, 0, 1, 1,
0.6667265, -0.4601005, 3.107514, 1, 0, 0, 1, 1,
0.6682394, 2.195687, 1.600564, 1, 0, 0, 1, 1,
0.6698014, -0.06664554, 2.460014, 1, 0, 0, 1, 1,
0.6699247, -1.455458, 1.491081, 1, 0, 0, 1, 1,
0.6704313, 1.312734, 0.3336693, 0, 0, 0, 1, 1,
0.6770768, 1.190681, 0.9655294, 0, 0, 0, 1, 1,
0.678129, 0.05832798, 1.17645, 0, 0, 0, 1, 1,
0.6792111, -0.06283917, 1.123097, 0, 0, 0, 1, 1,
0.6804112, -0.2645403, 0.3604905, 0, 0, 0, 1, 1,
0.6837149, 0.2161444, -0.9105411, 0, 0, 0, 1, 1,
0.6905299, 0.9612797, 1.740649, 0, 0, 0, 1, 1,
0.6915768, -1.542934, 2.280269, 1, 1, 1, 1, 1,
0.6941753, -0.8181432, 1.413416, 1, 1, 1, 1, 1,
0.6949592, -1.754734, 3.431651, 1, 1, 1, 1, 1,
0.6973951, -0.2956355, 0.3789987, 1, 1, 1, 1, 1,
0.7070614, -0.386935, 2.49196, 1, 1, 1, 1, 1,
0.7078262, -0.2144903, -0.1043029, 1, 1, 1, 1, 1,
0.7079988, -0.106778, 1.513525, 1, 1, 1, 1, 1,
0.7100001, 0.1520897, 2.162066, 1, 1, 1, 1, 1,
0.7101802, -1.037698, 2.38039, 1, 1, 1, 1, 1,
0.7183089, -0.1572637, 2.175935, 1, 1, 1, 1, 1,
0.7193384, 0.8129261, 1.06797, 1, 1, 1, 1, 1,
0.7194316, 0.5148466, -0.7928793, 1, 1, 1, 1, 1,
0.7218913, -2.138817, 2.05045, 1, 1, 1, 1, 1,
0.7270415, -0.7501921, 3.349685, 1, 1, 1, 1, 1,
0.7272927, -0.4733704, 3.83365, 1, 1, 1, 1, 1,
0.7277681, -0.8657181, 2.382921, 0, 0, 1, 1, 1,
0.7309905, 0.6768947, 1.027054, 1, 0, 0, 1, 1,
0.7320708, -0.03910097, 0.3238519, 1, 0, 0, 1, 1,
0.7332124, 0.1854745, 2.028694, 1, 0, 0, 1, 1,
0.7333847, -2.305673, 2.304316, 1, 0, 0, 1, 1,
0.7340928, -0.5239853, 4.460244, 1, 0, 0, 1, 1,
0.7366034, -0.143204, 3.138247, 0, 0, 0, 1, 1,
0.7420372, 0.5710095, 0.2610962, 0, 0, 0, 1, 1,
0.7426255, 0.4451683, -0.01645303, 0, 0, 0, 1, 1,
0.7438437, -0.4974615, 2.966189, 0, 0, 0, 1, 1,
0.7439303, 1.456907, 1.019264, 0, 0, 0, 1, 1,
0.7519938, 0.7122425, 1.529586, 0, 0, 0, 1, 1,
0.7534163, 0.5874253, 0.8575484, 0, 0, 0, 1, 1,
0.758257, 1.843831, 0.5714238, 1, 1, 1, 1, 1,
0.7609885, -2.010146, 2.415199, 1, 1, 1, 1, 1,
0.7646618, -0.5745029, 0.8982504, 1, 1, 1, 1, 1,
0.7713991, 0.8065194, 1.527359, 1, 1, 1, 1, 1,
0.771731, 1.08124, 0.164511, 1, 1, 1, 1, 1,
0.7729344, 0.386412, 1.142265, 1, 1, 1, 1, 1,
0.7803469, 1.119085, -0.3831605, 1, 1, 1, 1, 1,
0.7808186, -0.572635, 1.532599, 1, 1, 1, 1, 1,
0.7902525, 0.8821096, 0.5504308, 1, 1, 1, 1, 1,
0.790807, -0.5197094, 2.830265, 1, 1, 1, 1, 1,
0.7929242, -0.8630844, 1.244157, 1, 1, 1, 1, 1,
0.7938086, -0.517436, 1.757724, 1, 1, 1, 1, 1,
0.8012736, -0.2130504, 1.181335, 1, 1, 1, 1, 1,
0.8035498, 0.8379918, 0.1337266, 1, 1, 1, 1, 1,
0.807198, -0.1030903, 1.11662, 1, 1, 1, 1, 1,
0.8087086, -0.04305241, 1.074157, 0, 0, 1, 1, 1,
0.8091438, 2.495265, 1.699282, 1, 0, 0, 1, 1,
0.809451, 0.4094106, 0.2316708, 1, 0, 0, 1, 1,
0.8095326, -0.5519637, 2.039775, 1, 0, 0, 1, 1,
0.8122121, 1.456447, -0.6870149, 1, 0, 0, 1, 1,
0.8169508, -1.622485, 2.334521, 1, 0, 0, 1, 1,
0.8205729, 1.016107, 0.5979488, 0, 0, 0, 1, 1,
0.8227473, 0.7325739, 0.2742466, 0, 0, 0, 1, 1,
0.8255207, 1.492511, 0.04616725, 0, 0, 0, 1, 1,
0.8284535, -0.01920604, 1.31207, 0, 0, 0, 1, 1,
0.828992, 0.008412901, 1.164356, 0, 0, 0, 1, 1,
0.83373, 0.4859125, -0.3467986, 0, 0, 0, 1, 1,
0.8388178, -0.7648181, 3.046606, 0, 0, 0, 1, 1,
0.8389707, 1.025795, 0.5758857, 1, 1, 1, 1, 1,
0.8392901, 1.633585, 3.206032, 1, 1, 1, 1, 1,
0.8414556, 0.6847863, 1.851941, 1, 1, 1, 1, 1,
0.8431951, -0.05300867, 1.325778, 1, 1, 1, 1, 1,
0.8433334, -0.6670166, 2.049816, 1, 1, 1, 1, 1,
0.8452901, -1.667438, 2.509247, 1, 1, 1, 1, 1,
0.8511269, 0.09112626, 1.312788, 1, 1, 1, 1, 1,
0.8597035, 1.348948, 1.560864, 1, 1, 1, 1, 1,
0.8609279, -0.1864646, 2.851493, 1, 1, 1, 1, 1,
0.8622633, 0.320987, 1.641411, 1, 1, 1, 1, 1,
0.8648478, 1.774471, -0.3533209, 1, 1, 1, 1, 1,
0.865647, -0.9248305, 1.565666, 1, 1, 1, 1, 1,
0.8702784, 0.4907373, 0.3065409, 1, 1, 1, 1, 1,
0.8705593, 0.5746509, 1.085114, 1, 1, 1, 1, 1,
0.8749433, 1.803931, 0.7711732, 1, 1, 1, 1, 1,
0.8788495, -0.533439, 1.701432, 0, 0, 1, 1, 1,
0.8809589, 0.8305123, 2.634705, 1, 0, 0, 1, 1,
0.882145, -0.850336, 1.456812, 1, 0, 0, 1, 1,
0.8927365, 1.156284, 1.250487, 1, 0, 0, 1, 1,
0.8962809, -0.8183542, 2.517508, 1, 0, 0, 1, 1,
0.9003235, -1.317488, 2.911754, 1, 0, 0, 1, 1,
0.9009448, 0.1541968, 1.337246, 0, 0, 0, 1, 1,
0.9012498, 1.133853, 1.427635, 0, 0, 0, 1, 1,
0.9052486, 0.941708, 0.5601133, 0, 0, 0, 1, 1,
0.9058592, -0.7655054, 2.182983, 0, 0, 0, 1, 1,
0.9085915, 1.008969, 0.8079879, 0, 0, 0, 1, 1,
0.9119613, 1.316664, 0.603021, 0, 0, 0, 1, 1,
0.9133729, -0.01426801, 3.370292, 0, 0, 0, 1, 1,
0.9144477, 1.205494, 1.934605, 1, 1, 1, 1, 1,
0.9146762, -0.1945319, 3.875438, 1, 1, 1, 1, 1,
0.9193483, -0.7411339, 2.356715, 1, 1, 1, 1, 1,
0.9257888, -1.588169, 3.725447, 1, 1, 1, 1, 1,
0.9402583, 0.1282278, 0.335382, 1, 1, 1, 1, 1,
0.945995, -1.03884, 4.142297, 1, 1, 1, 1, 1,
0.9555839, -0.5572386, 2.178813, 1, 1, 1, 1, 1,
0.9569793, -0.7245299, 1.297176, 1, 1, 1, 1, 1,
0.9589746, 0.6545182, 0.6163297, 1, 1, 1, 1, 1,
0.9610776, 0.304351, 1.43184, 1, 1, 1, 1, 1,
0.9620367, -0.4690413, 4.088103, 1, 1, 1, 1, 1,
0.9659719, 2.405533, 1.033682, 1, 1, 1, 1, 1,
0.970835, -0.2917493, 0.1509397, 1, 1, 1, 1, 1,
0.9790031, -0.9039009, 1.216731, 1, 1, 1, 1, 1,
0.9799161, 0.9090629, 0.8894599, 1, 1, 1, 1, 1,
0.9801818, 0.6216503, 0.0783203, 0, 0, 1, 1, 1,
0.9849758, 0.3949029, 0.931629, 1, 0, 0, 1, 1,
0.9888011, 1.575363, 1.341402, 1, 0, 0, 1, 1,
0.9908137, -0.2548856, 0.6800905, 1, 0, 0, 1, 1,
0.9929391, 0.5970021, 1.610895, 1, 0, 0, 1, 1,
0.9940949, -1.512764, 3.003438, 1, 0, 0, 1, 1,
0.9953854, -0.8835712, 1.995437, 0, 0, 0, 1, 1,
0.9973596, 0.79027, 1.082098, 0, 0, 0, 1, 1,
1.000843, -0.4844583, 3.240693, 0, 0, 0, 1, 1,
1.00339, -0.05078057, 0.1711913, 0, 0, 0, 1, 1,
1.014417, -1.282342, 1.219226, 0, 0, 0, 1, 1,
1.016096, 0.3684295, 0.7067184, 0, 0, 0, 1, 1,
1.017165, 0.1182014, 1.643996, 0, 0, 0, 1, 1,
1.018672, 0.591397, 0.7677997, 1, 1, 1, 1, 1,
1.022309, -0.7887336, 1.111757, 1, 1, 1, 1, 1,
1.022624, 1.009075, -0.8763525, 1, 1, 1, 1, 1,
1.026087, 0.8565225, -0.5589625, 1, 1, 1, 1, 1,
1.029298, 0.4562699, 1.491524, 1, 1, 1, 1, 1,
1.033129, 1.915933, 1.451252, 1, 1, 1, 1, 1,
1.033218, 0.448565, 1.126771, 1, 1, 1, 1, 1,
1.035416, 0.423407, 1.404543, 1, 1, 1, 1, 1,
1.045216, -0.6447405, 2.510208, 1, 1, 1, 1, 1,
1.0494, -0.09006023, 1.098399, 1, 1, 1, 1, 1,
1.055251, 1.623529, -0.4830337, 1, 1, 1, 1, 1,
1.069348, 0.797053, 0.7360022, 1, 1, 1, 1, 1,
1.071574, -0.01629043, 1.752868, 1, 1, 1, 1, 1,
1.076667, -0.3687248, 2.717223, 1, 1, 1, 1, 1,
1.083129, 0.3408251, 0.91053, 1, 1, 1, 1, 1,
1.084746, 0.9615096, 1.916614, 0, 0, 1, 1, 1,
1.087946, -0.7188351, 2.508612, 1, 0, 0, 1, 1,
1.089107, -0.5413629, 2.764583, 1, 0, 0, 1, 1,
1.094567, -0.2581358, 2.409137, 1, 0, 0, 1, 1,
1.104441, 0.492266, 1.715968, 1, 0, 0, 1, 1,
1.10523, -0.2581685, 0.4219134, 1, 0, 0, 1, 1,
1.110015, 0.8721022, 1.792741, 0, 0, 0, 1, 1,
1.111191, -0.6294385, 1.604553, 0, 0, 0, 1, 1,
1.111949, 2.315654, -0.7115327, 0, 0, 0, 1, 1,
1.118665, 0.2152558, 0.9242344, 0, 0, 0, 1, 1,
1.120281, -0.05907295, 1.507355, 0, 0, 0, 1, 1,
1.121569, 1.009982, 1.202392, 0, 0, 0, 1, 1,
1.123534, -0.2791134, 3.474061, 0, 0, 0, 1, 1,
1.135014, -1.091445, 2.133245, 1, 1, 1, 1, 1,
1.146664, -1.352564, 3.421075, 1, 1, 1, 1, 1,
1.154145, -0.6616749, 2.997815, 1, 1, 1, 1, 1,
1.156378, -0.3107601, 2.112389, 1, 1, 1, 1, 1,
1.159179, 0.5540686, 2.369904, 1, 1, 1, 1, 1,
1.159884, -1.896411, 1.214387, 1, 1, 1, 1, 1,
1.160917, -0.2621334, 2.187832, 1, 1, 1, 1, 1,
1.169215, -1.928826, 2.185157, 1, 1, 1, 1, 1,
1.182083, 1.241702, 2.203998, 1, 1, 1, 1, 1,
1.187987, -0.4578341, 2.402439, 1, 1, 1, 1, 1,
1.189935, -0.1476636, 2.489419, 1, 1, 1, 1, 1,
1.193423, -2.447032, 3.548924, 1, 1, 1, 1, 1,
1.199922, 0.6951649, 2.528011, 1, 1, 1, 1, 1,
1.202678, -0.3915652, 0.4249565, 1, 1, 1, 1, 1,
1.206792, -0.8944334, 1.304402, 1, 1, 1, 1, 1,
1.209125, 2.141088, 0.3182904, 0, 0, 1, 1, 1,
1.223117, 0.2104551, 2.564741, 1, 0, 0, 1, 1,
1.241061, 0.1643728, 0.6834505, 1, 0, 0, 1, 1,
1.247067, 2.067566, -0.166984, 1, 0, 0, 1, 1,
1.248122, -1.181881, 3.114265, 1, 0, 0, 1, 1,
1.255394, -0.7177652, 1.952485, 1, 0, 0, 1, 1,
1.277936, 1.945045, -0.1969805, 0, 0, 0, 1, 1,
1.28511, -0.0005602441, 2.411218, 0, 0, 0, 1, 1,
1.291261, 0.5394271, -0.4454145, 0, 0, 0, 1, 1,
1.296934, 0.2117696, 1.794564, 0, 0, 0, 1, 1,
1.302793, 0.06643042, 1.8846, 0, 0, 0, 1, 1,
1.310238, 0.5029894, 2.910536, 0, 0, 0, 1, 1,
1.311068, -1.180841, 1.658706, 0, 0, 0, 1, 1,
1.324602, -1.041147, 0.664615, 1, 1, 1, 1, 1,
1.332387, 1.068408, 0.004753714, 1, 1, 1, 1, 1,
1.333803, 0.3474848, 3.234729, 1, 1, 1, 1, 1,
1.350031, -0.1669927, 2.34281, 1, 1, 1, 1, 1,
1.353458, -0.2434918, 1.857781, 1, 1, 1, 1, 1,
1.362016, -1.331818, 0.5913661, 1, 1, 1, 1, 1,
1.362641, 0.7353984, 2.292413, 1, 1, 1, 1, 1,
1.369614, -1.615565, 3.045537, 1, 1, 1, 1, 1,
1.380689, -1.477713, 4.273118, 1, 1, 1, 1, 1,
1.385377, 0.1377469, -1.35763, 1, 1, 1, 1, 1,
1.401523, 1.164314, 1.276807, 1, 1, 1, 1, 1,
1.411177, 0.2108723, 0.7017179, 1, 1, 1, 1, 1,
1.414518, 0.5546508, 0.7127697, 1, 1, 1, 1, 1,
1.427141, -1.777194, 4.110029, 1, 1, 1, 1, 1,
1.428067, 0.2165816, 2.85854, 1, 1, 1, 1, 1,
1.435869, -0.957187, 2.217126, 0, 0, 1, 1, 1,
1.445573, 1.243522, 1.275666, 1, 0, 0, 1, 1,
1.449611, 0.6912717, 0.8922971, 1, 0, 0, 1, 1,
1.462081, 0.5621222, 1.644752, 1, 0, 0, 1, 1,
1.463729, 0.2462577, 0.5996868, 1, 0, 0, 1, 1,
1.475676, 0.1160329, 0.4690777, 1, 0, 0, 1, 1,
1.491568, -0.6644014, 1.190238, 0, 0, 0, 1, 1,
1.497538, 0.2635487, 1.428123, 0, 0, 0, 1, 1,
1.507421, 1.517191, 0.6583676, 0, 0, 0, 1, 1,
1.516325, -0.8211006, 2.464405, 0, 0, 0, 1, 1,
1.517839, -1.504594, 2.538223, 0, 0, 0, 1, 1,
1.519757, 0.7312673, 2.237007, 0, 0, 0, 1, 1,
1.520487, -0.5536407, 2.073067, 0, 0, 0, 1, 1,
1.529083, -0.4607392, 1.196427, 1, 1, 1, 1, 1,
1.529394, 0.3754597, 2.734552, 1, 1, 1, 1, 1,
1.530555, -0.1003446, 3.056695, 1, 1, 1, 1, 1,
1.544152, -0.5519415, 3.10587, 1, 1, 1, 1, 1,
1.555883, 0.3674451, -0.1296836, 1, 1, 1, 1, 1,
1.561862, -0.1103406, 3.476422, 1, 1, 1, 1, 1,
1.565492, 0.1059397, 1.121285, 1, 1, 1, 1, 1,
1.572717, 0.06660857, 0.8303803, 1, 1, 1, 1, 1,
1.580959, 0.5602655, 1.743584, 1, 1, 1, 1, 1,
1.580962, 1.073374, 1.171041, 1, 1, 1, 1, 1,
1.586535, 1.517031, 0.5449459, 1, 1, 1, 1, 1,
1.601762, -0.5777663, 2.684166, 1, 1, 1, 1, 1,
1.607108, 0.4147934, -0.1146595, 1, 1, 1, 1, 1,
1.609113, -0.4862253, 2.202265, 1, 1, 1, 1, 1,
1.612044, 0.8015136, 2.076879, 1, 1, 1, 1, 1,
1.624733, 0.1325392, 2.400482, 0, 0, 1, 1, 1,
1.626009, 0.6453712, 0.4050184, 1, 0, 0, 1, 1,
1.626965, -0.2106921, 0.1407373, 1, 0, 0, 1, 1,
1.631305, -0.9662158, 1.057205, 1, 0, 0, 1, 1,
1.638145, -0.4535158, 1.536419, 1, 0, 0, 1, 1,
1.663797, -1.15664, 3.782826, 1, 0, 0, 1, 1,
1.671627, 0.6621592, 0.171264, 0, 0, 0, 1, 1,
1.672255, 0.3806493, 1.627515, 0, 0, 0, 1, 1,
1.697975, 0.7355372, 2.43422, 0, 0, 0, 1, 1,
1.712874, -1.443794, -0.2065639, 0, 0, 0, 1, 1,
1.754356, -0.1074874, 1.557263, 0, 0, 0, 1, 1,
1.762659, 1.578794, 1.848705, 0, 0, 0, 1, 1,
1.78305, 1.859989, -0.7582675, 0, 0, 0, 1, 1,
1.790099, 0.6419358, 1.040251, 1, 1, 1, 1, 1,
1.805666, 1.685647, 0.9901709, 1, 1, 1, 1, 1,
1.823339, -0.03300162, 0.1000643, 1, 1, 1, 1, 1,
1.826038, 0.8561109, 1.962587, 1, 1, 1, 1, 1,
1.827027, 0.2217912, 0.9131555, 1, 1, 1, 1, 1,
1.840085, 1.713474, 2.636671, 1, 1, 1, 1, 1,
1.936499, -2.259788, 2.827532, 1, 1, 1, 1, 1,
1.941702, -0.1188132, 2.896311, 1, 1, 1, 1, 1,
1.956726, 0.8740208, 0.9388511, 1, 1, 1, 1, 1,
1.98471, 1.138045, 0.8642052, 1, 1, 1, 1, 1,
1.999359, -0.8455576, 3.150975, 1, 1, 1, 1, 1,
2.005336, -1.242172, 1.769192, 1, 1, 1, 1, 1,
2.029012, 0.3118431, 2.519929, 1, 1, 1, 1, 1,
2.058685, 1.662725, 1.483548, 1, 1, 1, 1, 1,
2.062212, -0.4017932, -0.2914162, 1, 1, 1, 1, 1,
2.087376, -0.3110239, 0.9093348, 0, 0, 1, 1, 1,
2.106257, -0.05235777, 2.694568, 1, 0, 0, 1, 1,
2.110364, -0.005122648, 2.474517, 1, 0, 0, 1, 1,
2.139321, -0.5614384, 1.83419, 1, 0, 0, 1, 1,
2.147707, 1.14048, 1.319099, 1, 0, 0, 1, 1,
2.229628, -1.767616, 1.219848, 1, 0, 0, 1, 1,
2.257052, -0.8848931, 1.735617, 0, 0, 0, 1, 1,
2.258285, 0.2756413, 2.683695, 0, 0, 0, 1, 1,
2.295045, 0.7603396, 1.02046, 0, 0, 0, 1, 1,
2.352054, -0.3510813, 2.383379, 0, 0, 0, 1, 1,
2.364112, -0.141977, 1.774247, 0, 0, 0, 1, 1,
2.364712, -1.323027, 1.638174, 0, 0, 0, 1, 1,
2.506913, -0.2650174, 0.9191476, 0, 0, 0, 1, 1,
2.509921, -0.8653116, 4.087795, 1, 1, 1, 1, 1,
2.803421, 1.602329, -0.7200411, 1, 1, 1, 1, 1,
2.813023, 0.1743484, 3.141394, 1, 1, 1, 1, 1,
2.900579, -0.050114, 0.9946439, 1, 1, 1, 1, 1,
2.959518, -0.4933841, 1.794139, 1, 1, 1, 1, 1,
3.06699, -0.2523319, 1.727332, 1, 1, 1, 1, 1,
3.258686, 0.2621486, 2.359525, 1, 1, 1, 1, 1
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
var radius = 9.714686;
var distance = 34.12242;
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
mvMatrix.translate( -0.02651358, 0.4295775, -0.2698078 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12242);
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
