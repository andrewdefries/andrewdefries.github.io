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
-3.623656, 1.254973, -1.769469, 1, 0, 0, 1,
-3.042274, -0.0731553, -1.975271, 1, 0.007843138, 0, 1,
-2.98608, 0.6056933, 0.6213946, 1, 0.01176471, 0, 1,
-2.945093, 1.28302, 0.433977, 1, 0.01960784, 0, 1,
-2.72761, -0.1445763, -0.7077651, 1, 0.02352941, 0, 1,
-2.689938, 0.5881743, -3.375769, 1, 0.03137255, 0, 1,
-2.621445, 1.091518, 0.09365002, 1, 0.03529412, 0, 1,
-2.521386, -1.225917, -3.870166, 1, 0.04313726, 0, 1,
-2.492036, 1.107117, -0.2711418, 1, 0.04705882, 0, 1,
-2.432263, -0.5408677, -1.826173, 1, 0.05490196, 0, 1,
-2.429305, -0.4434169, -1.923833, 1, 0.05882353, 0, 1,
-2.322762, -0.4488066, -2.075926, 1, 0.06666667, 0, 1,
-2.242475, -0.6796189, -1.376837, 1, 0.07058824, 0, 1,
-2.240958, 0.6328048, 0.3526401, 1, 0.07843138, 0, 1,
-2.222198, 0.5202996, -1.376525, 1, 0.08235294, 0, 1,
-2.207073, 0.3385132, -1.113559, 1, 0.09019608, 0, 1,
-2.164707, 0.5727744, -1.833698, 1, 0.09411765, 0, 1,
-2.155272, -0.9478, -1.353723, 1, 0.1019608, 0, 1,
-2.13242, -1.795431, -2.537544, 1, 0.1098039, 0, 1,
-2.128545, 0.2764511, 0.06419232, 1, 0.1137255, 0, 1,
-2.103656, -0.5166967, -2.100713, 1, 0.1215686, 0, 1,
-2.096126, -0.1886772, -2.905135, 1, 0.1254902, 0, 1,
-2.036753, 0.9349, -1.267861, 1, 0.1333333, 0, 1,
-2.030319, -0.06562084, -1.217529, 1, 0.1372549, 0, 1,
-2.029619, -0.4326356, -1.48431, 1, 0.145098, 0, 1,
-2.027081, -0.1403291, -1.131404, 1, 0.1490196, 0, 1,
-2.00272, 1.718189, -0.5455102, 1, 0.1568628, 0, 1,
-1.987902, -0.5223761, 0.1511393, 1, 0.1607843, 0, 1,
-1.968368, -0.8534259, -2.839145, 1, 0.1686275, 0, 1,
-1.962335, -2.373572, -1.941057, 1, 0.172549, 0, 1,
-1.929098, -1.988129, -2.901386, 1, 0.1803922, 0, 1,
-1.893856, 1.067905, -0.8908765, 1, 0.1843137, 0, 1,
-1.871542, 0.157912, -0.501293, 1, 0.1921569, 0, 1,
-1.849643, -0.300436, -2.939501, 1, 0.1960784, 0, 1,
-1.849276, -1.444791, -1.690232, 1, 0.2039216, 0, 1,
-1.849059, 1.199219, -0.3969205, 1, 0.2117647, 0, 1,
-1.837064, 0.47828, -1.75094, 1, 0.2156863, 0, 1,
-1.83565, -1.760829, -2.251559, 1, 0.2235294, 0, 1,
-1.833745, -0.06814179, -2.059696, 1, 0.227451, 0, 1,
-1.830709, 1.213493, -1.998585, 1, 0.2352941, 0, 1,
-1.806441, -0.8776785, -3.864572, 1, 0.2392157, 0, 1,
-1.792482, 0.3614475, -0.1715024, 1, 0.2470588, 0, 1,
-1.784156, 2.584419, -2.19013, 1, 0.2509804, 0, 1,
-1.774273, 0.3789858, -1.835684, 1, 0.2588235, 0, 1,
-1.768509, 0.7709663, -1.057443, 1, 0.2627451, 0, 1,
-1.764573, -0.4870148, -2.311894, 1, 0.2705882, 0, 1,
-1.747197, 2.097125, -1.00007, 1, 0.2745098, 0, 1,
-1.747058, 0.07902017, 0.02707865, 1, 0.282353, 0, 1,
-1.744963, 0.6768047, -1.347906, 1, 0.2862745, 0, 1,
-1.742197, -0.5667813, -0.8771, 1, 0.2941177, 0, 1,
-1.70009, -0.5509896, -1.714759, 1, 0.3019608, 0, 1,
-1.699038, 1.247643, -1.589949, 1, 0.3058824, 0, 1,
-1.684596, -0.8559472, -1.953186, 1, 0.3137255, 0, 1,
-1.682612, 0.339597, -0.6927065, 1, 0.3176471, 0, 1,
-1.67851, -2.980322, -2.485677, 1, 0.3254902, 0, 1,
-1.675959, 0.3043328, -1.653107, 1, 0.3294118, 0, 1,
-1.67355, -0.3962486, -2.011903, 1, 0.3372549, 0, 1,
-1.667274, 0.2612328, 0.3058488, 1, 0.3411765, 0, 1,
-1.645598, 1.237383, -0.7395937, 1, 0.3490196, 0, 1,
-1.633751, -0.5331297, -2.460892, 1, 0.3529412, 0, 1,
-1.627955, 2.081775, -0.4181195, 1, 0.3607843, 0, 1,
-1.62241, 1.537345, -0.1307014, 1, 0.3647059, 0, 1,
-1.613438, -0.3178578, -1.234853, 1, 0.372549, 0, 1,
-1.592089, -0.3714657, -2.381754, 1, 0.3764706, 0, 1,
-1.562156, 1.332584, -1.548323, 1, 0.3843137, 0, 1,
-1.561597, -0.006153462, -3.042759, 1, 0.3882353, 0, 1,
-1.536353, 0.4223222, -0.45654, 1, 0.3960784, 0, 1,
-1.535139, 0.007289491, -3.531319, 1, 0.4039216, 0, 1,
-1.534678, 0.06696635, -0.2338541, 1, 0.4078431, 0, 1,
-1.5286, -0.9334952, -3.594278, 1, 0.4156863, 0, 1,
-1.516667, -0.07587735, -2.403781, 1, 0.4196078, 0, 1,
-1.497062, -0.299786, -1.45373, 1, 0.427451, 0, 1,
-1.496027, 2.659888, -1.291127, 1, 0.4313726, 0, 1,
-1.486838, 0.6498526, -0.5156031, 1, 0.4392157, 0, 1,
-1.485342, -1.659693, -4.120572, 1, 0.4431373, 0, 1,
-1.48024, -0.5112981, -2.676966, 1, 0.4509804, 0, 1,
-1.477573, 0.5164791, -2.371869, 1, 0.454902, 0, 1,
-1.476495, -1.514871, -2.163319, 1, 0.4627451, 0, 1,
-1.47149, 0.4498338, -1.042325, 1, 0.4666667, 0, 1,
-1.467733, 0.9155918, 0.04478702, 1, 0.4745098, 0, 1,
-1.459188, -0.08179712, -2.85148, 1, 0.4784314, 0, 1,
-1.450944, -0.623196, -2.744211, 1, 0.4862745, 0, 1,
-1.437948, 1.395895, 0.2414499, 1, 0.4901961, 0, 1,
-1.435963, -1.914306, -1.081226, 1, 0.4980392, 0, 1,
-1.419419, 2.244378, -3.429357, 1, 0.5058824, 0, 1,
-1.39458, -0.3313201, -2.28536, 1, 0.509804, 0, 1,
-1.384814, -0.5568762, -2.03898, 1, 0.5176471, 0, 1,
-1.379013, -0.3656694, 0.1016552, 1, 0.5215687, 0, 1,
-1.361797, 2.098596, 0.1715177, 1, 0.5294118, 0, 1,
-1.361338, -0.6688257, -1.725575, 1, 0.5333334, 0, 1,
-1.344933, -1.144596, -2.511967, 1, 0.5411765, 0, 1,
-1.344572, 0.8956159, -1.453983, 1, 0.5450981, 0, 1,
-1.339135, -0.4476972, -2.095641, 1, 0.5529412, 0, 1,
-1.337212, 0.5680605, -2.352981, 1, 0.5568628, 0, 1,
-1.329989, 0.4475757, -4.480598, 1, 0.5647059, 0, 1,
-1.329893, -0.126099, -0.6120705, 1, 0.5686275, 0, 1,
-1.32705, 0.6978163, -1.763732, 1, 0.5764706, 0, 1,
-1.321039, -0.3387963, -1.80542, 1, 0.5803922, 0, 1,
-1.318599, 0.9965974, -1.312703, 1, 0.5882353, 0, 1,
-1.312619, -0.1022881, -0.8238992, 1, 0.5921569, 0, 1,
-1.309311, -0.01295567, -2.657128, 1, 0.6, 0, 1,
-1.293449, 1.481567, -0.4334787, 1, 0.6078432, 0, 1,
-1.289232, 0.6995407, -0.7704023, 1, 0.6117647, 0, 1,
-1.28337, -0.06602028, -1.29213, 1, 0.6196079, 0, 1,
-1.279964, -1.253878, -2.056582, 1, 0.6235294, 0, 1,
-1.276656, -1.333056, -3.140198, 1, 0.6313726, 0, 1,
-1.266132, 0.3168409, -1.682231, 1, 0.6352941, 0, 1,
-1.260646, 0.2813175, -1.358425, 1, 0.6431373, 0, 1,
-1.258506, -0.3105022, -3.56161, 1, 0.6470588, 0, 1,
-1.256434, 0.3750223, 0.6441293, 1, 0.654902, 0, 1,
-1.251873, 1.478047, -2.888768, 1, 0.6588235, 0, 1,
-1.247956, 0.5948742, -1.567893, 1, 0.6666667, 0, 1,
-1.240934, -0.1222372, 0.2170895, 1, 0.6705883, 0, 1,
-1.235704, 0.1432985, -3.043856, 1, 0.6784314, 0, 1,
-1.231674, 1.793155, 0.01904796, 1, 0.682353, 0, 1,
-1.230637, -0.534552, -2.061296, 1, 0.6901961, 0, 1,
-1.21778, -1.391995, -2.257765, 1, 0.6941177, 0, 1,
-1.217119, 2.718374, -1.254998, 1, 0.7019608, 0, 1,
-1.214551, -0.2262772, -1.499089, 1, 0.7098039, 0, 1,
-1.209764, 0.5693925, -1.161678, 1, 0.7137255, 0, 1,
-1.208796, 0.8975949, -0.3891552, 1, 0.7215686, 0, 1,
-1.201512, 0.4706753, 0.09236436, 1, 0.7254902, 0, 1,
-1.198036, 0.258362, -1.516897, 1, 0.7333333, 0, 1,
-1.197467, -1.228052, -0.9397856, 1, 0.7372549, 0, 1,
-1.191936, 0.5928936, -1.621855, 1, 0.7450981, 0, 1,
-1.189202, -0.174096, -1.55239, 1, 0.7490196, 0, 1,
-1.185112, 1.382661, -1.986371, 1, 0.7568628, 0, 1,
-1.184249, 0.2243648, -0.3907163, 1, 0.7607843, 0, 1,
-1.180567, 0.7978714, -2.749606, 1, 0.7686275, 0, 1,
-1.178711, 1.768395, -0.252764, 1, 0.772549, 0, 1,
-1.173229, 2.206181, -0.3156316, 1, 0.7803922, 0, 1,
-1.172917, -2.472466, -4.397991, 1, 0.7843137, 0, 1,
-1.169552, -1.893278, -2.91653, 1, 0.7921569, 0, 1,
-1.160919, -0.8714707, -1.345746, 1, 0.7960784, 0, 1,
-1.158213, 0.4852657, -0.1205724, 1, 0.8039216, 0, 1,
-1.156869, -1.210939, 0.08027261, 1, 0.8117647, 0, 1,
-1.152331, 0.462577, -0.5050658, 1, 0.8156863, 0, 1,
-1.146297, 1.714472, -2.144902, 1, 0.8235294, 0, 1,
-1.144595, 0.4115192, -1.838747, 1, 0.827451, 0, 1,
-1.14236, 1.723187, -0.2136233, 1, 0.8352941, 0, 1,
-1.139581, 2.094557, 0.3390146, 1, 0.8392157, 0, 1,
-1.139352, 0.007858552, -0.9799249, 1, 0.8470588, 0, 1,
-1.139198, -2.188514, -4.278955, 1, 0.8509804, 0, 1,
-1.13724, 1.901084, 0.8774642, 1, 0.8588235, 0, 1,
-1.1328, 1.3292, -0.05070176, 1, 0.8627451, 0, 1,
-1.132186, 1.148805, 1.270027, 1, 0.8705882, 0, 1,
-1.13078, 1.189999, 1.001331, 1, 0.8745098, 0, 1,
-1.126652, 1.725733, -0.771692, 1, 0.8823529, 0, 1,
-1.122349, -0.3096001, -1.830712, 1, 0.8862745, 0, 1,
-1.120747, 0.9338884, -0.2149193, 1, 0.8941177, 0, 1,
-1.116281, -0.7510156, -1.9524, 1, 0.8980392, 0, 1,
-1.108811, -0.4841002, -1.435345, 1, 0.9058824, 0, 1,
-1.106415, 0.7027926, -0.5467386, 1, 0.9137255, 0, 1,
-1.101824, -0.5817991, -4.122141, 1, 0.9176471, 0, 1,
-1.093279, -0.4094006, -1.099571, 1, 0.9254902, 0, 1,
-1.092439, 0.9656124, -2.922842, 1, 0.9294118, 0, 1,
-1.080582, -0.1769316, -0.2763259, 1, 0.9372549, 0, 1,
-1.076927, 0.04140495, -2.112365, 1, 0.9411765, 0, 1,
-1.070552, 0.353642, -0.7945342, 1, 0.9490196, 0, 1,
-1.069167, 1.063299, -0.9481644, 1, 0.9529412, 0, 1,
-1.064831, 0.1619179, -2.646375, 1, 0.9607843, 0, 1,
-1.062024, -0.7481569, -2.446439, 1, 0.9647059, 0, 1,
-1.05384, -0.3196214, -1.622636, 1, 0.972549, 0, 1,
-1.05304, -0.498902, -2.638499, 1, 0.9764706, 0, 1,
-1.053017, 1.304172, 0.1110511, 1, 0.9843137, 0, 1,
-1.048431, -0.003908793, -3.381464, 1, 0.9882353, 0, 1,
-1.047294, -0.4165118, -0.8868204, 1, 0.9960784, 0, 1,
-1.04328, -0.656703, -3.362687, 0.9960784, 1, 0, 1,
-1.042108, 1.009624, -0.5011678, 0.9921569, 1, 0, 1,
-1.040442, 0.1560981, -1.742757, 0.9843137, 1, 0, 1,
-1.029048, 0.6868532, -1.907151, 0.9803922, 1, 0, 1,
-1.02886, 0.9268153, -2.10405, 0.972549, 1, 0, 1,
-1.02811, -0.8320945, -0.8814749, 0.9686275, 1, 0, 1,
-1.023474, 0.001859075, -0.0001695634, 0.9607843, 1, 0, 1,
-1.0206, -2.143626, -2.389824, 0.9568627, 1, 0, 1,
-1.013124, -0.8545094, -2.707446, 0.9490196, 1, 0, 1,
-1.012797, 0.5033882, 0.4260779, 0.945098, 1, 0, 1,
-1.012752, 1.029022, -2.489501, 0.9372549, 1, 0, 1,
-1.012133, 0.7793679, -1.191328, 0.9333333, 1, 0, 1,
-1.009244, 2.070071, -0.7012603, 0.9254902, 1, 0, 1,
-1.006886, 0.8881817, -1.363619, 0.9215686, 1, 0, 1,
-0.9911477, -1.89674, -1.466583, 0.9137255, 1, 0, 1,
-0.9898565, -0.8867548, -3.564832, 0.9098039, 1, 0, 1,
-0.9810474, 1.34984, -0.08362586, 0.9019608, 1, 0, 1,
-0.9786892, -0.5586764, -2.498719, 0.8941177, 1, 0, 1,
-0.9760943, 0.6920306, 0.7237132, 0.8901961, 1, 0, 1,
-0.9680108, -0.428621, -2.900715, 0.8823529, 1, 0, 1,
-0.9540603, -0.269187, -2.611434, 0.8784314, 1, 0, 1,
-0.9490324, 0.3387897, -0.1185584, 0.8705882, 1, 0, 1,
-0.9427122, 0.09435797, -1.106329, 0.8666667, 1, 0, 1,
-0.941461, -1.537412, -3.727866, 0.8588235, 1, 0, 1,
-0.9368839, -1.527246, -2.495354, 0.854902, 1, 0, 1,
-0.9362619, 3.791144, 1.136207, 0.8470588, 1, 0, 1,
-0.936259, -0.5753033, -1.75527, 0.8431373, 1, 0, 1,
-0.9219692, 0.4936167, -0.04395301, 0.8352941, 1, 0, 1,
-0.917771, -0.3798981, -2.848892, 0.8313726, 1, 0, 1,
-0.9021559, -1.609817, -3.242081, 0.8235294, 1, 0, 1,
-0.8962051, -0.7688679, -0.314221, 0.8196079, 1, 0, 1,
-0.8942798, -0.623912, -3.958092, 0.8117647, 1, 0, 1,
-0.8913999, 0.08555891, -0.4787038, 0.8078431, 1, 0, 1,
-0.8826404, -0.1516373, -1.550977, 0.8, 1, 0, 1,
-0.8820747, -0.5824199, -2.647864, 0.7921569, 1, 0, 1,
-0.8588524, -0.2892566, -2.39321, 0.7882353, 1, 0, 1,
-0.8557061, 0.5695805, -0.6369114, 0.7803922, 1, 0, 1,
-0.8533375, 0.2117753, 0.5037737, 0.7764706, 1, 0, 1,
-0.8448254, 1.015932, -0.3608148, 0.7686275, 1, 0, 1,
-0.8389397, -0.4593677, -0.2891052, 0.7647059, 1, 0, 1,
-0.8329811, 0.6710799, -0.8346072, 0.7568628, 1, 0, 1,
-0.8324581, -0.70508, -1.989221, 0.7529412, 1, 0, 1,
-0.8263595, -0.3005789, -2.507094, 0.7450981, 1, 0, 1,
-0.825928, 0.4290566, -1.410435, 0.7411765, 1, 0, 1,
-0.8232257, -1.628245, -3.039308, 0.7333333, 1, 0, 1,
-0.8208523, -1.001366, -2.79353, 0.7294118, 1, 0, 1,
-0.8166299, -0.8681644, -1.937119, 0.7215686, 1, 0, 1,
-0.8154674, 1.512866, -0.4643932, 0.7176471, 1, 0, 1,
-0.8125719, -0.9825915, -1.47948, 0.7098039, 1, 0, 1,
-0.810833, 0.5107444, -1.01236, 0.7058824, 1, 0, 1,
-0.8069419, -0.9414981, -2.569611, 0.6980392, 1, 0, 1,
-0.7948229, -0.7315978, -2.490811, 0.6901961, 1, 0, 1,
-0.794179, -0.4430879, -0.9792082, 0.6862745, 1, 0, 1,
-0.7925037, -0.17741, -2.445538, 0.6784314, 1, 0, 1,
-0.7892862, -1.061272, -2.525442, 0.6745098, 1, 0, 1,
-0.7840515, -1.549485, -2.244533, 0.6666667, 1, 0, 1,
-0.7756707, -0.7992281, -2.320255, 0.6627451, 1, 0, 1,
-0.7754245, 0.3514272, -0.1569674, 0.654902, 1, 0, 1,
-0.772, -0.1669444, 0.1710608, 0.6509804, 1, 0, 1,
-0.7719185, 0.709141, -1.386681, 0.6431373, 1, 0, 1,
-0.7680377, 1.50358, -0.4585514, 0.6392157, 1, 0, 1,
-0.7675843, 0.220846, -1.615598, 0.6313726, 1, 0, 1,
-0.7653289, -0.5331214, -1.95376, 0.627451, 1, 0, 1,
-0.7628176, 0.5751818, -0.8706478, 0.6196079, 1, 0, 1,
-0.7592671, -1.445413, -3.535919, 0.6156863, 1, 0, 1,
-0.7569855, 0.003797444, -1.468535, 0.6078432, 1, 0, 1,
-0.756337, -0.8603989, -3.242738, 0.6039216, 1, 0, 1,
-0.7559976, 1.254673, -0.1961722, 0.5960785, 1, 0, 1,
-0.7491001, 1.256343, -0.8821743, 0.5882353, 1, 0, 1,
-0.7474604, 0.2153239, -2.32477, 0.5843138, 1, 0, 1,
-0.7445304, -0.6975001, -2.246507, 0.5764706, 1, 0, 1,
-0.743291, -0.7508564, -3.025757, 0.572549, 1, 0, 1,
-0.7421864, -0.8768625, -3.131895, 0.5647059, 1, 0, 1,
-0.7416912, 1.255031, -0.470206, 0.5607843, 1, 0, 1,
-0.7414247, 0.7862272, 1.19479, 0.5529412, 1, 0, 1,
-0.7393348, 1.10364, -1.254156, 0.5490196, 1, 0, 1,
-0.7389376, 1.569834, -1.569762, 0.5411765, 1, 0, 1,
-0.7389154, -0.6302217, -0.9060452, 0.5372549, 1, 0, 1,
-0.7377666, -0.2256511, -1.918295, 0.5294118, 1, 0, 1,
-0.7359124, -0.788983, -1.667901, 0.5254902, 1, 0, 1,
-0.7284535, 0.2961061, -1.993942, 0.5176471, 1, 0, 1,
-0.7278395, -0.6068513, -2.309574, 0.5137255, 1, 0, 1,
-0.7248716, -0.5162455, -1.077766, 0.5058824, 1, 0, 1,
-0.7191994, -1.127116, -1.313182, 0.5019608, 1, 0, 1,
-0.7160897, -0.1890115, -0.9829059, 0.4941176, 1, 0, 1,
-0.7132584, 0.4117197, -0.6428227, 0.4862745, 1, 0, 1,
-0.7117409, -0.2770357, -1.503936, 0.4823529, 1, 0, 1,
-0.7093441, -0.1783952, -2.579927, 0.4745098, 1, 0, 1,
-0.7080786, 0.8109154, -0.8102258, 0.4705882, 1, 0, 1,
-0.7056482, -0.9302581, -1.466082, 0.4627451, 1, 0, 1,
-0.7047434, 0.3582878, -0.4888152, 0.4588235, 1, 0, 1,
-0.70406, -1.661639, -2.508216, 0.4509804, 1, 0, 1,
-0.7029272, 0.0041352, -0.5523618, 0.4470588, 1, 0, 1,
-0.7010028, 0.2542318, -2.10008, 0.4392157, 1, 0, 1,
-0.6903448, 0.162482, -3.292168, 0.4352941, 1, 0, 1,
-0.6778145, 0.360448, -0.3629829, 0.427451, 1, 0, 1,
-0.6720145, 0.246681, -0.9367028, 0.4235294, 1, 0, 1,
-0.6706363, -0.3074574, -0.7234948, 0.4156863, 1, 0, 1,
-0.6703947, 0.05523417, -2.435817, 0.4117647, 1, 0, 1,
-0.6699259, 0.519504, -2.332445, 0.4039216, 1, 0, 1,
-0.6623922, 0.8616574, 0.8984521, 0.3960784, 1, 0, 1,
-0.6617527, -0.2303597, -2.125189, 0.3921569, 1, 0, 1,
-0.6591828, 0.3672165, 0.4830342, 0.3843137, 1, 0, 1,
-0.6567417, 0.2497795, -0.6900282, 0.3803922, 1, 0, 1,
-0.6567068, 1.353786, -3.069684, 0.372549, 1, 0, 1,
-0.6410682, -0.7707927, -2.07218, 0.3686275, 1, 0, 1,
-0.6339957, -0.4648857, -1.877602, 0.3607843, 1, 0, 1,
-0.6069701, 0.2251882, -1.267756, 0.3568628, 1, 0, 1,
-0.6044591, 0.9663762, 0.5995025, 0.3490196, 1, 0, 1,
-0.603965, -1.792135, -2.495446, 0.345098, 1, 0, 1,
-0.5997729, -0.1225579, -2.876638, 0.3372549, 1, 0, 1,
-0.598897, 0.1480463, -2.869004, 0.3333333, 1, 0, 1,
-0.5940776, -0.05088575, -0.9815955, 0.3254902, 1, 0, 1,
-0.5904721, -0.1955782, -1.248525, 0.3215686, 1, 0, 1,
-0.5850459, -0.5762959, -2.568657, 0.3137255, 1, 0, 1,
-0.5843004, -0.3940793, -4.089636, 0.3098039, 1, 0, 1,
-0.5840375, -0.1943335, -1.259394, 0.3019608, 1, 0, 1,
-0.5830916, 0.6653036, 1.533826, 0.2941177, 1, 0, 1,
-0.5803975, -0.8874761, -2.730541, 0.2901961, 1, 0, 1,
-0.5757791, -0.6816232, -1.278745, 0.282353, 1, 0, 1,
-0.5737367, -0.6646813, -3.521539, 0.2784314, 1, 0, 1,
-0.5634997, 1.757337, 0.9449084, 0.2705882, 1, 0, 1,
-0.5624051, -1.109607, -1.436215, 0.2666667, 1, 0, 1,
-0.5609314, -0.8627834, -2.474048, 0.2588235, 1, 0, 1,
-0.5573742, 0.09074076, -1.663253, 0.254902, 1, 0, 1,
-0.5562748, -0.141883, -2.297077, 0.2470588, 1, 0, 1,
-0.5553592, -0.9325182, -2.202806, 0.2431373, 1, 0, 1,
-0.5552109, 0.06765889, -0.9903234, 0.2352941, 1, 0, 1,
-0.5542594, 0.9059348, -2.228229, 0.2313726, 1, 0, 1,
-0.5516271, 0.8266618, -0.8040665, 0.2235294, 1, 0, 1,
-0.5476732, 0.5309489, 0.1567525, 0.2196078, 1, 0, 1,
-0.5453765, -1.640936, -1.382592, 0.2117647, 1, 0, 1,
-0.5432844, -1.161752, -2.854877, 0.2078431, 1, 0, 1,
-0.5407341, 0.8839985, 0.676231, 0.2, 1, 0, 1,
-0.5402012, 2.179139, -0.6397775, 0.1921569, 1, 0, 1,
-0.5357391, 0.5358922, 0.08160044, 0.1882353, 1, 0, 1,
-0.5334795, -1.535295, -0.882208, 0.1803922, 1, 0, 1,
-0.5325486, -1.312616, -2.857475, 0.1764706, 1, 0, 1,
-0.5309336, -0.5875738, -2.550194, 0.1686275, 1, 0, 1,
-0.5302392, 0.477376, -0.8030204, 0.1647059, 1, 0, 1,
-0.5298808, -0.6444275, -2.108078, 0.1568628, 1, 0, 1,
-0.52817, -1.720028, -4.017635, 0.1529412, 1, 0, 1,
-0.5267748, -1.829623, -3.193836, 0.145098, 1, 0, 1,
-0.5227298, -0.7807619, -2.16732, 0.1411765, 1, 0, 1,
-0.5224743, -1.352374, -2.911597, 0.1333333, 1, 0, 1,
-0.5200579, -0.6124198, -3.293726, 0.1294118, 1, 0, 1,
-0.5148562, 0.8116003, -0.5058877, 0.1215686, 1, 0, 1,
-0.514211, 0.8760527, -1.527856, 0.1176471, 1, 0, 1,
-0.5123408, 1.269413, -0.7421414, 0.1098039, 1, 0, 1,
-0.5072336, -0.7459815, -3.447904, 0.1058824, 1, 0, 1,
-0.5049149, -2.595747, -1.392047, 0.09803922, 1, 0, 1,
-0.5028765, 0.5954645, -1.118783, 0.09019608, 1, 0, 1,
-0.5027407, 0.1071101, -3.427562, 0.08627451, 1, 0, 1,
-0.5022171, 2.05717, 0.6084334, 0.07843138, 1, 0, 1,
-0.4978462, 2.279036, -0.07990915, 0.07450981, 1, 0, 1,
-0.4905784, 2.750325, -0.3230401, 0.06666667, 1, 0, 1,
-0.4902581, -0.2406556, -0.7451981, 0.0627451, 1, 0, 1,
-0.4800421, -0.6971726, -1.215402, 0.05490196, 1, 0, 1,
-0.4761809, -0.3645538, -4.221689, 0.05098039, 1, 0, 1,
-0.47299, -0.6295319, -2.874309, 0.04313726, 1, 0, 1,
-0.4716047, -1.700751, -0.9356112, 0.03921569, 1, 0, 1,
-0.4640512, 0.4137321, 0.5956558, 0.03137255, 1, 0, 1,
-0.4431751, 0.3969572, -1.100218, 0.02745098, 1, 0, 1,
-0.4397415, -1.183779, -2.552045, 0.01960784, 1, 0, 1,
-0.4386899, -1.071769, -2.789763, 0.01568628, 1, 0, 1,
-0.4298679, -1.95153, -4.383133, 0.007843138, 1, 0, 1,
-0.4270901, -0.7057609, -2.550173, 0.003921569, 1, 0, 1,
-0.4260205, -1.509038, -4.314107, 0, 1, 0.003921569, 1,
-0.4239487, 0.009866813, -2.368954, 0, 1, 0.01176471, 1,
-0.423675, -0.3924907, -1.537547, 0, 1, 0.01568628, 1,
-0.4200548, -1.703186, -0.7107262, 0, 1, 0.02352941, 1,
-0.4177279, 0.3660888, -0.8033976, 0, 1, 0.02745098, 1,
-0.4174741, 0.4850633, -0.2385357, 0, 1, 0.03529412, 1,
-0.4149199, 0.5258198, 0.7089828, 0, 1, 0.03921569, 1,
-0.412408, 0.8909883, -2.476259, 0, 1, 0.04705882, 1,
-0.4099964, 0.3202943, -0.2023009, 0, 1, 0.05098039, 1,
-0.4081197, 1.305662, -0.1644078, 0, 1, 0.05882353, 1,
-0.4074158, 0.3977196, -1.138055, 0, 1, 0.0627451, 1,
-0.4050319, -0.03307506, -1.274948, 0, 1, 0.07058824, 1,
-0.4034724, 0.3749387, -1.742861, 0, 1, 0.07450981, 1,
-0.3995256, -0.7195878, -2.594013, 0, 1, 0.08235294, 1,
-0.3986116, -0.3682757, -1.622618, 0, 1, 0.08627451, 1,
-0.3936296, -0.6205926, -3.202487, 0, 1, 0.09411765, 1,
-0.3928318, 0.5724269, -1.546062, 0, 1, 0.1019608, 1,
-0.3923342, -0.1634479, -1.461521, 0, 1, 0.1058824, 1,
-0.3907285, 1.242622, 0.1471496, 0, 1, 0.1137255, 1,
-0.3871504, -1.601694, -3.074851, 0, 1, 0.1176471, 1,
-0.3851129, -0.8202412, -1.514711, 0, 1, 0.1254902, 1,
-0.3847315, 0.07825053, -1.458484, 0, 1, 0.1294118, 1,
-0.3826442, -1.428106, -4.5917, 0, 1, 0.1372549, 1,
-0.3818896, -1.190186, -2.91402, 0, 1, 0.1411765, 1,
-0.3816729, -0.7343746, -1.937862, 0, 1, 0.1490196, 1,
-0.381011, -1.157663, -4.354165, 0, 1, 0.1529412, 1,
-0.3770945, -1.601153, -3.87726, 0, 1, 0.1607843, 1,
-0.3696518, -0.7306017, -4.211507, 0, 1, 0.1647059, 1,
-0.3691983, -0.8283586, -4.058684, 0, 1, 0.172549, 1,
-0.3668049, 1.305401, 0.8242332, 0, 1, 0.1764706, 1,
-0.3653651, 0.6875625, -0.3747014, 0, 1, 0.1843137, 1,
-0.3646561, 0.1077162, -0.6158403, 0, 1, 0.1882353, 1,
-0.3607048, -0.5937395, -4.580686, 0, 1, 0.1960784, 1,
-0.360222, -1.598317, -2.938138, 0, 1, 0.2039216, 1,
-0.359173, -0.1338372, -1.035968, 0, 1, 0.2078431, 1,
-0.3588798, 0.60982, -0.06713043, 0, 1, 0.2156863, 1,
-0.3577507, 0.4849527, -0.1304071, 0, 1, 0.2196078, 1,
-0.3486235, 0.6043757, -0.3479457, 0, 1, 0.227451, 1,
-0.3418053, -1.437426, -3.569407, 0, 1, 0.2313726, 1,
-0.337899, 0.4564544, -1.194933, 0, 1, 0.2392157, 1,
-0.3368311, -0.9971867, -1.913864, 0, 1, 0.2431373, 1,
-0.3332719, -0.5494031, -2.647673, 0, 1, 0.2509804, 1,
-0.3285019, -1.231912, -1.18412, 0, 1, 0.254902, 1,
-0.3268656, -0.170935, -2.895414, 0, 1, 0.2627451, 1,
-0.3239318, 1.415787, -1.599738, 0, 1, 0.2666667, 1,
-0.3236, -0.3569695, -1.848449, 0, 1, 0.2745098, 1,
-0.3230575, -3.138206, -2.354611, 0, 1, 0.2784314, 1,
-0.3191198, 1.069904, 0.2800182, 0, 1, 0.2862745, 1,
-0.3166897, 1.699437, -0.9229955, 0, 1, 0.2901961, 1,
-0.3160484, 0.3079246, 1.296665, 0, 1, 0.2980392, 1,
-0.3148035, 0.9697117, 0.570928, 0, 1, 0.3058824, 1,
-0.3067956, -0.0468246, -0.7808753, 0, 1, 0.3098039, 1,
-0.304853, -0.1026579, -0.8068869, 0, 1, 0.3176471, 1,
-0.3027, 1.434096, 0.3603555, 0, 1, 0.3215686, 1,
-0.3005942, 0.8803573, -0.5047988, 0, 1, 0.3294118, 1,
-0.2980975, 0.1120499, -1.280724, 0, 1, 0.3333333, 1,
-0.2975902, -0.8825044, -2.086468, 0, 1, 0.3411765, 1,
-0.2951013, 0.6639118, 1.332924, 0, 1, 0.345098, 1,
-0.2898797, 1.279848, -0.1320173, 0, 1, 0.3529412, 1,
-0.2854475, 0.9154796, -0.5872473, 0, 1, 0.3568628, 1,
-0.2839545, -0.2422495, -1.01187, 0, 1, 0.3647059, 1,
-0.280367, 2.530428, -1.010921, 0, 1, 0.3686275, 1,
-0.2795431, -0.4556311, -2.938914, 0, 1, 0.3764706, 1,
-0.2790447, -0.4709811, -3.229353, 0, 1, 0.3803922, 1,
-0.2782258, -1.24083, -3.74367, 0, 1, 0.3882353, 1,
-0.2753407, 0.7182272, -0.3563012, 0, 1, 0.3921569, 1,
-0.2723058, -0.2516157, -1.969331, 0, 1, 0.4, 1,
-0.2702489, 0.5411236, -1.231442, 0, 1, 0.4078431, 1,
-0.2646286, 1.135474, -1.175415, 0, 1, 0.4117647, 1,
-0.2627762, 0.3352472, -1.461226, 0, 1, 0.4196078, 1,
-0.2616319, 0.3259261, -0.7168581, 0, 1, 0.4235294, 1,
-0.2552728, 1.832632, -0.5970678, 0, 1, 0.4313726, 1,
-0.2515228, -0.8445627, -3.372777, 0, 1, 0.4352941, 1,
-0.2502499, -0.267666, -1.785895, 0, 1, 0.4431373, 1,
-0.2422137, 0.5514585, -0.07158817, 0, 1, 0.4470588, 1,
-0.2391061, 0.04846303, -1.901666, 0, 1, 0.454902, 1,
-0.2389514, 0.4459779, -1.216811, 0, 1, 0.4588235, 1,
-0.2318232, -0.3847016, -1.452702, 0, 1, 0.4666667, 1,
-0.2312995, -0.8724324, -4.485762, 0, 1, 0.4705882, 1,
-0.2301453, -1.234154, -2.106138, 0, 1, 0.4784314, 1,
-0.2297678, 2.732978, 1.331915, 0, 1, 0.4823529, 1,
-0.2278062, -0.9515141, -3.303963, 0, 1, 0.4901961, 1,
-0.2269901, 0.6888472, 0.07399205, 0, 1, 0.4941176, 1,
-0.2261722, 0.578375, -0.3076526, 0, 1, 0.5019608, 1,
-0.2245263, 1.292746, -0.040422, 0, 1, 0.509804, 1,
-0.223614, -2.070251, -2.524068, 0, 1, 0.5137255, 1,
-0.2218281, -1.310914, -4.110995, 0, 1, 0.5215687, 1,
-0.2217305, 0.05814907, -3.031034, 0, 1, 0.5254902, 1,
-0.2194212, -0.5565888, -3.820209, 0, 1, 0.5333334, 1,
-0.2145462, -0.9352029, -3.354334, 0, 1, 0.5372549, 1,
-0.2053545, -2.017155, -3.466595, 0, 1, 0.5450981, 1,
-0.205317, 0.6480069, 0.9359509, 0, 1, 0.5490196, 1,
-0.200966, 1.885155, 0.8597249, 0, 1, 0.5568628, 1,
-0.1949468, -0.8272477, -2.818779, 0, 1, 0.5607843, 1,
-0.192921, -0.3070373, -3.266598, 0, 1, 0.5686275, 1,
-0.1925138, -0.2970469, -2.221993, 0, 1, 0.572549, 1,
-0.1872948, -0.2776954, -1.191303, 0, 1, 0.5803922, 1,
-0.1804812, -0.5124946, -3.822453, 0, 1, 0.5843138, 1,
-0.1795757, -0.258687, -3.391033, 0, 1, 0.5921569, 1,
-0.1771918, 0.07484701, -1.922025, 0, 1, 0.5960785, 1,
-0.1756987, -1.620922, -1.578587, 0, 1, 0.6039216, 1,
-0.1735622, -0.7361145, -2.137869, 0, 1, 0.6117647, 1,
-0.1724403, 0.330443, -2.171473, 0, 1, 0.6156863, 1,
-0.1712328, -0.6369948, -4.130226, 0, 1, 0.6235294, 1,
-0.1685986, 1.548972, -0.2309539, 0, 1, 0.627451, 1,
-0.1656913, -0.05282013, -1.822385, 0, 1, 0.6352941, 1,
-0.1629417, 0.3281917, -1.881157, 0, 1, 0.6392157, 1,
-0.1610442, 1.061759, -0.8055552, 0, 1, 0.6470588, 1,
-0.1548069, 0.2608032, -2.392895, 0, 1, 0.6509804, 1,
-0.1544639, 1.310094, 2.130768, 0, 1, 0.6588235, 1,
-0.1534325, -0.8266373, -3.397866, 0, 1, 0.6627451, 1,
-0.1487177, 0.5869924, -2.562608, 0, 1, 0.6705883, 1,
-0.1485399, 1.591643, -0.2435339, 0, 1, 0.6745098, 1,
-0.1482846, 0.03014615, -0.8720893, 0, 1, 0.682353, 1,
-0.1482735, 0.1947731, -0.0970028, 0, 1, 0.6862745, 1,
-0.1425047, -0.9868727, -3.58873, 0, 1, 0.6941177, 1,
-0.133546, -1.233766, -3.767869, 0, 1, 0.7019608, 1,
-0.1316942, 1.758451, -1.521231, 0, 1, 0.7058824, 1,
-0.1259627, -1.513055, -3.835638, 0, 1, 0.7137255, 1,
-0.1249362, 2.429984, -0.9941313, 0, 1, 0.7176471, 1,
-0.1244989, -0.09082382, -2.307671, 0, 1, 0.7254902, 1,
-0.1242605, -0.06617948, -1.599409, 0, 1, 0.7294118, 1,
-0.1224869, 0.6249785, -0.01998887, 0, 1, 0.7372549, 1,
-0.1213875, -1.367609, -2.677427, 0, 1, 0.7411765, 1,
-0.1212019, -0.2749667, -3.485357, 0, 1, 0.7490196, 1,
-0.1172872, 0.8517958, -2.133768, 0, 1, 0.7529412, 1,
-0.1141804, -0.032733, -0.8811622, 0, 1, 0.7607843, 1,
-0.1135881, 0.01938155, -1.262431, 0, 1, 0.7647059, 1,
-0.1105607, 1.092068, -0.8082014, 0, 1, 0.772549, 1,
-0.1104569, -0.5123349, -5.85184, 0, 1, 0.7764706, 1,
-0.110143, 0.3565648, -1.573331, 0, 1, 0.7843137, 1,
-0.1089539, -2.475227, -2.699122, 0, 1, 0.7882353, 1,
-0.106494, 1.486196, -0.6376773, 0, 1, 0.7960784, 1,
-0.1048495, 1.463557, -1.228699, 0, 1, 0.8039216, 1,
-0.1045215, 0.4750231, 0.1290919, 0, 1, 0.8078431, 1,
-0.1020464, -0.4760883, -2.025707, 0, 1, 0.8156863, 1,
-0.1014853, 1.664539, -1.133259, 0, 1, 0.8196079, 1,
-0.1009104, -2.447172, -3.479942, 0, 1, 0.827451, 1,
-0.09908204, -1.109555, -2.820178, 0, 1, 0.8313726, 1,
-0.09895204, -0.6175336, -2.387361, 0, 1, 0.8392157, 1,
-0.09880601, 1.12155, -1.074223, 0, 1, 0.8431373, 1,
-0.09816614, 1.655489, -1.584939, 0, 1, 0.8509804, 1,
-0.09641203, 0.08450522, -0.6079906, 0, 1, 0.854902, 1,
-0.09620411, 0.6939079, 1.691323, 0, 1, 0.8627451, 1,
-0.09550384, -0.2648403, -2.84995, 0, 1, 0.8666667, 1,
-0.09356101, 1.355143, -0.8166963, 0, 1, 0.8745098, 1,
-0.09259798, -0.2535914, -2.145188, 0, 1, 0.8784314, 1,
-0.09007519, 0.3579475, 1.569997, 0, 1, 0.8862745, 1,
-0.08679105, 0.1292125, -0.5938548, 0, 1, 0.8901961, 1,
-0.08102883, -1.01517, -3.28229, 0, 1, 0.8980392, 1,
-0.07914547, -0.2523777, -3.633608, 0, 1, 0.9058824, 1,
-0.07626371, -2.09416, -2.102172, 0, 1, 0.9098039, 1,
-0.07191908, -1.092067, -0.5382348, 0, 1, 0.9176471, 1,
-0.05697769, -1.060221, -2.919687, 0, 1, 0.9215686, 1,
-0.05439916, 2.037326, -0.5228666, 0, 1, 0.9294118, 1,
-0.05288842, 0.3622161, 2.71508, 0, 1, 0.9333333, 1,
-0.04963574, -0.5279159, -3.752883, 0, 1, 0.9411765, 1,
-0.04929066, -0.2487875, -3.717984, 0, 1, 0.945098, 1,
-0.04679365, 1.419686, -1.486188, 0, 1, 0.9529412, 1,
-0.04468456, -0.6610219, -4.064798, 0, 1, 0.9568627, 1,
-0.04279051, -1.686541, -1.865615, 0, 1, 0.9647059, 1,
-0.03315409, 1.191774, 0.06368177, 0, 1, 0.9686275, 1,
-0.02560402, -0.9264826, -1.292608, 0, 1, 0.9764706, 1,
-0.0223977, -1.792294, -5.167527, 0, 1, 0.9803922, 1,
-0.01408096, 0.5945816, 0.0592608, 0, 1, 0.9882353, 1,
-0.01248355, -0.4087731, -3.672065, 0, 1, 0.9921569, 1,
-0.0121823, 0.08517619, -1.978929, 0, 1, 1, 1,
-0.008101295, -2.074297, -4.130555, 0, 0.9921569, 1, 1,
-0.007058064, 0.8200413, -0.7372222, 0, 0.9882353, 1, 1,
-0.004513262, 0.05770338, -0.445806, 0, 0.9803922, 1, 1,
-0.004354571, 1.173363, 0.649411, 0, 0.9764706, 1, 1,
-0.003983601, -0.3020985, -1.845113, 0, 0.9686275, 1, 1,
-0.002952769, -0.1514818, -4.043228, 0, 0.9647059, 1, 1,
0.003038215, -1.392733, 2.432207, 0, 0.9568627, 1, 1,
0.004058156, 0.4228866, -0.3731005, 0, 0.9529412, 1, 1,
0.008951198, 0.1299578, 0.3484007, 0, 0.945098, 1, 1,
0.01534044, -0.9847302, 1.917722, 0, 0.9411765, 1, 1,
0.01978996, -1.018582, 1.897497, 0, 0.9333333, 1, 1,
0.02004921, 0.5364373, 1.486353, 0, 0.9294118, 1, 1,
0.02205647, 0.4768098, 2.146691, 0, 0.9215686, 1, 1,
0.02464268, 0.7160411, 0.07910308, 0, 0.9176471, 1, 1,
0.02663972, 0.7274271, -1.529243, 0, 0.9098039, 1, 1,
0.02832861, 1.763791, 2.378205, 0, 0.9058824, 1, 1,
0.03689757, -0.4718643, 2.921563, 0, 0.8980392, 1, 1,
0.04012933, 2.339964, -0.03872189, 0, 0.8901961, 1, 1,
0.04053233, 0.7330415, -1.699083, 0, 0.8862745, 1, 1,
0.04129363, 0.1500223, -0.001119926, 0, 0.8784314, 1, 1,
0.04538727, 0.06583807, 1.385965, 0, 0.8745098, 1, 1,
0.04702326, 1.543709, -2.03751, 0, 0.8666667, 1, 1,
0.04728673, 1.275586, -1.035632, 0, 0.8627451, 1, 1,
0.04745327, 0.104733, 0.5017044, 0, 0.854902, 1, 1,
0.04996956, -1.093248, 4.015657, 0, 0.8509804, 1, 1,
0.05634822, 0.3125842, -1.14346, 0, 0.8431373, 1, 1,
0.06075791, -0.5060883, 3.12343, 0, 0.8392157, 1, 1,
0.06085445, -0.1089548, 3.513062, 0, 0.8313726, 1, 1,
0.06900075, 0.04818907, 1.33173, 0, 0.827451, 1, 1,
0.07621852, -0.1718115, 2.87175, 0, 0.8196079, 1, 1,
0.07962131, -1.55176, 2.993918, 0, 0.8156863, 1, 1,
0.08009231, -0.6155503, 4.385077, 0, 0.8078431, 1, 1,
0.08616976, -1.048734, 4.175795, 0, 0.8039216, 1, 1,
0.08794113, -0.7673098, 2.778414, 0, 0.7960784, 1, 1,
0.08840406, 0.4798579, 0.0929669, 0, 0.7882353, 1, 1,
0.09487995, -0.1928999, 3.542169, 0, 0.7843137, 1, 1,
0.09989709, -0.250517, 3.38316, 0, 0.7764706, 1, 1,
0.1013619, -0.9911293, 4.774476, 0, 0.772549, 1, 1,
0.1021157, -0.2921993, 1.081709, 0, 0.7647059, 1, 1,
0.1036933, 0.6846754, -0.1055436, 0, 0.7607843, 1, 1,
0.1139429, -0.3013926, 5.053552, 0, 0.7529412, 1, 1,
0.114836, -0.5805286, 3.287185, 0, 0.7490196, 1, 1,
0.1220658, -0.3469411, 2.172513, 0, 0.7411765, 1, 1,
0.1229525, -0.8638378, 2.967479, 0, 0.7372549, 1, 1,
0.1229639, -2.070977, 4.645613, 0, 0.7294118, 1, 1,
0.123023, -0.6035669, 2.756329, 0, 0.7254902, 1, 1,
0.1288655, 1.557864, 0.2417903, 0, 0.7176471, 1, 1,
0.1301655, -0.3039415, 3.701647, 0, 0.7137255, 1, 1,
0.1311599, 2.455218e-05, 1.236897, 0, 0.7058824, 1, 1,
0.1415406, -0.5164027, 3.34594, 0, 0.6980392, 1, 1,
0.1485087, -0.2995505, 1.905781, 0, 0.6941177, 1, 1,
0.1550355, 0.4207407, -1.563488, 0, 0.6862745, 1, 1,
0.1553387, -0.2767907, 1.657488, 0, 0.682353, 1, 1,
0.158117, 0.6408934, -0.5753576, 0, 0.6745098, 1, 1,
0.1604362, -0.09286159, 4.528022, 0, 0.6705883, 1, 1,
0.1607593, 0.01673763, 1.168632, 0, 0.6627451, 1, 1,
0.1614986, 0.4169879, -1.957364, 0, 0.6588235, 1, 1,
0.1619193, 0.2938844, 1.221586, 0, 0.6509804, 1, 1,
0.1652278, 0.1167498, 1.421318, 0, 0.6470588, 1, 1,
0.1714405, -0.01122886, 2.355247, 0, 0.6392157, 1, 1,
0.1739411, 0.4416128, 1.817873, 0, 0.6352941, 1, 1,
0.1777156, -2.167747, 1.860623, 0, 0.627451, 1, 1,
0.1817891, 0.7417848, 0.09077521, 0, 0.6235294, 1, 1,
0.1827429, -1.236503, 4.637922, 0, 0.6156863, 1, 1,
0.1829346, 1.042564, 0.2243383, 0, 0.6117647, 1, 1,
0.1831113, 0.06743845, 1.217813, 0, 0.6039216, 1, 1,
0.1876307, 0.5545738, -0.02155628, 0, 0.5960785, 1, 1,
0.1882361, 0.001132762, 0.8049091, 0, 0.5921569, 1, 1,
0.1917619, 0.908564, -0.4944046, 0, 0.5843138, 1, 1,
0.2012392, -1.255846, 3.250476, 0, 0.5803922, 1, 1,
0.2041941, 1.020663, -1.825695, 0, 0.572549, 1, 1,
0.2080839, 0.1770642, 0.9388058, 0, 0.5686275, 1, 1,
0.210139, 0.2171965, 1.703291, 0, 0.5607843, 1, 1,
0.2106813, 0.926616, -0.8320349, 0, 0.5568628, 1, 1,
0.2116574, 0.7251201, 0.4236127, 0, 0.5490196, 1, 1,
0.2125883, 1.281692, -1.02038, 0, 0.5450981, 1, 1,
0.21369, 1.689211, 0.06729296, 0, 0.5372549, 1, 1,
0.2156198, 0.5237769, -0.1984413, 0, 0.5333334, 1, 1,
0.2240224, 1.310082, 0.1785963, 0, 0.5254902, 1, 1,
0.2249844, -0.3306774, 1.00679, 0, 0.5215687, 1, 1,
0.2265295, 1.949891, 0.07459959, 0, 0.5137255, 1, 1,
0.2288736, 0.3849912, 0.6992319, 0, 0.509804, 1, 1,
0.2302514, -0.8645612, 4.508726, 0, 0.5019608, 1, 1,
0.2325622, -2.87274, 2.621677, 0, 0.4941176, 1, 1,
0.2352604, -2.08039, 3.024056, 0, 0.4901961, 1, 1,
0.2383524, 0.1386438, 0.2577572, 0, 0.4823529, 1, 1,
0.2413401, 0.5940403, 0.6156116, 0, 0.4784314, 1, 1,
0.2432011, 2.14094, -0.9423046, 0, 0.4705882, 1, 1,
0.2432182, -0.239902, 2.882873, 0, 0.4666667, 1, 1,
0.2434441, -0.7232411, 3.560037, 0, 0.4588235, 1, 1,
0.2436232, -0.07394671, 1.335167, 0, 0.454902, 1, 1,
0.2457318, -0.3712557, 3.84103, 0, 0.4470588, 1, 1,
0.2497415, -0.1523388, 2.055221, 0, 0.4431373, 1, 1,
0.2527337, -0.7084553, 2.003365, 0, 0.4352941, 1, 1,
0.2537989, 0.5109433, 0.7156163, 0, 0.4313726, 1, 1,
0.2705944, 2.552613, -0.6524386, 0, 0.4235294, 1, 1,
0.2754546, -1.024627, 2.81846, 0, 0.4196078, 1, 1,
0.2779687, 2.22884, -0.7022619, 0, 0.4117647, 1, 1,
0.279969, 0.6961133, -0.2736672, 0, 0.4078431, 1, 1,
0.2806275, -0.6757106, 3.573333, 0, 0.4, 1, 1,
0.2809816, 1.283274, 1.388889, 0, 0.3921569, 1, 1,
0.2822549, -0.8063782, 2.826645, 0, 0.3882353, 1, 1,
0.2849459, 2.313164, -0.3626392, 0, 0.3803922, 1, 1,
0.2853727, -1.282153, 1.771081, 0, 0.3764706, 1, 1,
0.29538, -0.7400938, 2.259258, 0, 0.3686275, 1, 1,
0.2964892, 1.81416, -0.03810506, 0, 0.3647059, 1, 1,
0.2992882, 0.1726466, 1.806244, 0, 0.3568628, 1, 1,
0.3035157, -1.024902, 3.826627, 0, 0.3529412, 1, 1,
0.3035778, 1.282076, 0.1349025, 0, 0.345098, 1, 1,
0.3048578, -0.5006713, 2.971613, 0, 0.3411765, 1, 1,
0.3068388, -0.8250959, 3.812655, 0, 0.3333333, 1, 1,
0.3167985, 0.1801306, 1.413008, 0, 0.3294118, 1, 1,
0.3190445, -0.2945808, -0.4316222, 0, 0.3215686, 1, 1,
0.3198413, -1.1328, 2.708841, 0, 0.3176471, 1, 1,
0.3249105, -1.074391, 1.746473, 0, 0.3098039, 1, 1,
0.3253997, 0.482329, -0.3872692, 0, 0.3058824, 1, 1,
0.3275025, 1.482145, 0.8499264, 0, 0.2980392, 1, 1,
0.3310622, 0.7016096, 0.06793934, 0, 0.2901961, 1, 1,
0.3321528, 0.9564756, 1.83929, 0, 0.2862745, 1, 1,
0.3367667, 0.02103704, 2.393414, 0, 0.2784314, 1, 1,
0.3431968, 0.03916644, 0.9687276, 0, 0.2745098, 1, 1,
0.3447579, -1.74149, 1.888869, 0, 0.2666667, 1, 1,
0.3453166, 1.014243, 0.5594161, 0, 0.2627451, 1, 1,
0.3461929, -1.278532, 1.849263, 0, 0.254902, 1, 1,
0.3489407, 0.8468673, -0.6866189, 0, 0.2509804, 1, 1,
0.3501223, -0.6898295, 1.576746, 0, 0.2431373, 1, 1,
0.3559407, -0.2962767, 2.477624, 0, 0.2392157, 1, 1,
0.3587939, -0.3929494, 2.000617, 0, 0.2313726, 1, 1,
0.360781, 0.7040694, 0.5035043, 0, 0.227451, 1, 1,
0.3644193, 0.5924605, -0.2070263, 0, 0.2196078, 1, 1,
0.3654775, 1.113984, 1.655158, 0, 0.2156863, 1, 1,
0.3665965, -1.402434, 5.216116, 0, 0.2078431, 1, 1,
0.3666918, 0.6607727, 0.1489375, 0, 0.2039216, 1, 1,
0.3752878, 0.07886177, 2.746653, 0, 0.1960784, 1, 1,
0.3765204, -1.465056, 2.796268, 0, 0.1882353, 1, 1,
0.3775527, -1.44344, 0.7010179, 0, 0.1843137, 1, 1,
0.3831481, -0.7899302, 0.13376, 0, 0.1764706, 1, 1,
0.3845657, 0.2276481, 0.6596524, 0, 0.172549, 1, 1,
0.3846213, -1.573057, 3.422043, 0, 0.1647059, 1, 1,
0.3856223, 1.668201, 0.3978472, 0, 0.1607843, 1, 1,
0.3887263, -1.21964, 1.969875, 0, 0.1529412, 1, 1,
0.3904339, -0.3516493, 2.561542, 0, 0.1490196, 1, 1,
0.3921732, 1.304649, 0.6193288, 0, 0.1411765, 1, 1,
0.3961144, -0.3805312, 3.347645, 0, 0.1372549, 1, 1,
0.3969375, 1.393846, -0.4281186, 0, 0.1294118, 1, 1,
0.403635, 0.2353782, 2.008469, 0, 0.1254902, 1, 1,
0.4041297, -2.024135, 3.051738, 0, 0.1176471, 1, 1,
0.4094507, 1.188807, -0.003962288, 0, 0.1137255, 1, 1,
0.4098162, 0.3504015, 0.9282866, 0, 0.1058824, 1, 1,
0.4102333, 0.6014499, 0.6849452, 0, 0.09803922, 1, 1,
0.4110188, 0.8581115, 1.268058, 0, 0.09411765, 1, 1,
0.4156622, -0.3658722, 2.273694, 0, 0.08627451, 1, 1,
0.4169187, -0.2550144, 0.529265, 0, 0.08235294, 1, 1,
0.4175247, 0.9030343, 1.493074, 0, 0.07450981, 1, 1,
0.4248992, -0.3067629, 3.558586, 0, 0.07058824, 1, 1,
0.4260674, -1.155661, 3.678073, 0, 0.0627451, 1, 1,
0.4331274, -0.06933431, 1.388112, 0, 0.05882353, 1, 1,
0.4395718, -0.0594015, 3.643132, 0, 0.05098039, 1, 1,
0.4463777, 0.2184794, 0.9440748, 0, 0.04705882, 1, 1,
0.4488571, -0.2472233, 2.562588, 0, 0.03921569, 1, 1,
0.451697, -0.3430248, 2.711946, 0, 0.03529412, 1, 1,
0.4582456, -0.2402363, 0.8656663, 0, 0.02745098, 1, 1,
0.460523, -1.183229, 2.1811, 0, 0.02352941, 1, 1,
0.460718, 0.1424313, 0.3872841, 0, 0.01568628, 1, 1,
0.4688669, -1.27888, 2.548251, 0, 0.01176471, 1, 1,
0.4725813, 1.599808, 1.41899, 0, 0.003921569, 1, 1,
0.4732246, -0.7939525, 2.367961, 0.003921569, 0, 1, 1,
0.476846, 1.190225, 2.021578, 0.007843138, 0, 1, 1,
0.4774847, -0.3900798, 2.119034, 0.01568628, 0, 1, 1,
0.4811185, -1.123885, 2.753901, 0.01960784, 0, 1, 1,
0.4896904, -0.4677941, 2.898304, 0.02745098, 0, 1, 1,
0.4957074, 0.4729419, 1.129392, 0.03137255, 0, 1, 1,
0.5003717, 0.2257605, 1.23812, 0.03921569, 0, 1, 1,
0.504123, 0.5114444, 0.9661431, 0.04313726, 0, 1, 1,
0.5047963, 0.1156697, -0.4588619, 0.05098039, 0, 1, 1,
0.5048165, -1.030267, 1.744025, 0.05490196, 0, 1, 1,
0.5055963, 0.6349903, 1.220073, 0.0627451, 0, 1, 1,
0.5119212, 1.913275, -1.490557, 0.06666667, 0, 1, 1,
0.5143421, -0.5830963, 1.162252, 0.07450981, 0, 1, 1,
0.5176015, -1.471702, 3.02682, 0.07843138, 0, 1, 1,
0.5184303, -1.112529, 3.451533, 0.08627451, 0, 1, 1,
0.5211035, 0.6332489, 2.195136, 0.09019608, 0, 1, 1,
0.52377, 0.01406745, 1.19525, 0.09803922, 0, 1, 1,
0.5239608, 1.589241, 0.4600226, 0.1058824, 0, 1, 1,
0.5240377, -1.318236, 1.691806, 0.1098039, 0, 1, 1,
0.5244557, -1.179239, 2.673091, 0.1176471, 0, 1, 1,
0.5245636, -0.3685554, 2.360111, 0.1215686, 0, 1, 1,
0.5269786, -0.5767137, 3.567677, 0.1294118, 0, 1, 1,
0.5284294, -0.5674217, 1.274408, 0.1333333, 0, 1, 1,
0.5323433, -3.175916, 2.910728, 0.1411765, 0, 1, 1,
0.5372465, 0.9037508, -0.3775201, 0.145098, 0, 1, 1,
0.5394242, 0.5382091, 0.6912934, 0.1529412, 0, 1, 1,
0.5409222, -0.9192726, 0.09435663, 0.1568628, 0, 1, 1,
0.5428228, -1.103785, 2.493997, 0.1647059, 0, 1, 1,
0.5436608, -0.2208172, 2.548187, 0.1686275, 0, 1, 1,
0.5461258, 0.534802, 0.9331266, 0.1764706, 0, 1, 1,
0.5465738, 0.5969317, 1.056009, 0.1803922, 0, 1, 1,
0.5468021, 1.291293, 0.7975729, 0.1882353, 0, 1, 1,
0.547495, 2.294145, 1.96696, 0.1921569, 0, 1, 1,
0.5479656, -1.043966, 3.396818, 0.2, 0, 1, 1,
0.5510308, 0.7576753, 1.611585, 0.2078431, 0, 1, 1,
0.5580022, -0.8840545, 3.031644, 0.2117647, 0, 1, 1,
0.5620237, 1.462727, 0.2541183, 0.2196078, 0, 1, 1,
0.5621037, -1.201548, 4.048704, 0.2235294, 0, 1, 1,
0.5622498, 0.1878926, 0.6800924, 0.2313726, 0, 1, 1,
0.5659752, -0.08618294, 0.1649841, 0.2352941, 0, 1, 1,
0.5723861, 1.248219, 0.5714983, 0.2431373, 0, 1, 1,
0.5804179, 0.3181761, 0.8769442, 0.2470588, 0, 1, 1,
0.584387, -1.749553, 2.05699, 0.254902, 0, 1, 1,
0.5863229, -0.8438477, 1.815735, 0.2588235, 0, 1, 1,
0.5863332, -0.8834459, 2.78061, 0.2666667, 0, 1, 1,
0.5915993, -0.1615082, 1.268509, 0.2705882, 0, 1, 1,
0.5953578, 1.037725, 1.890794, 0.2784314, 0, 1, 1,
0.5975511, -0.278076, 1.803238, 0.282353, 0, 1, 1,
0.5976993, -2.109152, 3.568651, 0.2901961, 0, 1, 1,
0.5994337, -0.8833316, 3.038912, 0.2941177, 0, 1, 1,
0.6012151, 1.173817, -2.359816, 0.3019608, 0, 1, 1,
0.6077355, -1.43468, 2.268815, 0.3098039, 0, 1, 1,
0.6100454, -1.081087, 1.340174, 0.3137255, 0, 1, 1,
0.617179, -1.169188, 2.487117, 0.3215686, 0, 1, 1,
0.6183754, -0.7444708, 1.75893, 0.3254902, 0, 1, 1,
0.6198199, 0.2999755, 0.9681939, 0.3333333, 0, 1, 1,
0.6263387, 1.072042, 1.975605, 0.3372549, 0, 1, 1,
0.6290013, -0.7084367, 3.227643, 0.345098, 0, 1, 1,
0.6422213, -0.1802135, 2.469903, 0.3490196, 0, 1, 1,
0.6502283, 0.2969168, 0.9281088, 0.3568628, 0, 1, 1,
0.6585527, 0.2847334, 0.6218718, 0.3607843, 0, 1, 1,
0.6603075, -0.6232007, 4.088992, 0.3686275, 0, 1, 1,
0.6613737, 0.2348451, 1.69837, 0.372549, 0, 1, 1,
0.6620892, 0.9111563, 1.101382, 0.3803922, 0, 1, 1,
0.6651011, 1.204293, 2.048471, 0.3843137, 0, 1, 1,
0.6718698, 0.09387757, 0.942892, 0.3921569, 0, 1, 1,
0.6756259, 0.297782, 2.122595, 0.3960784, 0, 1, 1,
0.6773999, 0.4870244, 2.57718, 0.4039216, 0, 1, 1,
0.6806601, 0.1749591, 1.350597, 0.4117647, 0, 1, 1,
0.6906266, 1.413319, 0.3159468, 0.4156863, 0, 1, 1,
0.6953772, -2.169041, 3.529432, 0.4235294, 0, 1, 1,
0.7028829, -1.208874, 2.641815, 0.427451, 0, 1, 1,
0.7072666, -0.7842709, 2.28233, 0.4352941, 0, 1, 1,
0.7108496, -0.1567311, -0.9153246, 0.4392157, 0, 1, 1,
0.7134574, -0.5185145, 0.5868368, 0.4470588, 0, 1, 1,
0.7136837, -0.0358603, 1.38596, 0.4509804, 0, 1, 1,
0.7172114, -1.142813, 4.623432, 0.4588235, 0, 1, 1,
0.722682, 0.3608085, 0.8896131, 0.4627451, 0, 1, 1,
0.7228786, -0.8380136, 3.68376, 0.4705882, 0, 1, 1,
0.724079, 0.3302867, 1.991923, 0.4745098, 0, 1, 1,
0.7247912, -0.1358417, -0.1196251, 0.4823529, 0, 1, 1,
0.7265449, 1.436547, -0.979148, 0.4862745, 0, 1, 1,
0.7298532, 1.044025, 0.8205358, 0.4941176, 0, 1, 1,
0.7299137, 1.831263, 0.05500003, 0.5019608, 0, 1, 1,
0.7320725, -0.8922748, 2.875258, 0.5058824, 0, 1, 1,
0.7330291, 0.2434398, 1.91392, 0.5137255, 0, 1, 1,
0.7364596, 1.33775, -0.5215213, 0.5176471, 0, 1, 1,
0.7388595, -1.611227, 3.958254, 0.5254902, 0, 1, 1,
0.7407126, 1.563765, 0.3358729, 0.5294118, 0, 1, 1,
0.7459876, -1.327521, 2.128728, 0.5372549, 0, 1, 1,
0.7467995, -0.8459885, 3.370532, 0.5411765, 0, 1, 1,
0.7500129, -1.344328, 4.0787, 0.5490196, 0, 1, 1,
0.7535228, 0.04630151, 0.544248, 0.5529412, 0, 1, 1,
0.7552022, -0.2346664, 2.382782, 0.5607843, 0, 1, 1,
0.7559253, -2.98385, 3.027739, 0.5647059, 0, 1, 1,
0.7584999, 0.9351373, 0.3717082, 0.572549, 0, 1, 1,
0.7615742, -1.114369, 2.470695, 0.5764706, 0, 1, 1,
0.7664205, -2.334447, 3.340588, 0.5843138, 0, 1, 1,
0.7699741, 0.5868893, -0.6867588, 0.5882353, 0, 1, 1,
0.7742209, 0.7235635, 1.565735, 0.5960785, 0, 1, 1,
0.7754067, -0.9448682, 2.083851, 0.6039216, 0, 1, 1,
0.7779878, 1.200291, 0.2495963, 0.6078432, 0, 1, 1,
0.7794296, 0.1331187, 0.4263103, 0.6156863, 0, 1, 1,
0.7814817, -0.8509974, 3.554553, 0.6196079, 0, 1, 1,
0.7826251, -1.7925, 2.058203, 0.627451, 0, 1, 1,
0.7837073, 0.7777251, 0.8865683, 0.6313726, 0, 1, 1,
0.7844626, -0.2943576, 1.541135, 0.6392157, 0, 1, 1,
0.7846649, -0.6387263, 2.322916, 0.6431373, 0, 1, 1,
0.787056, -1.547255, 4.971692, 0.6509804, 0, 1, 1,
0.7933024, 0.1911914, 0.5442289, 0.654902, 0, 1, 1,
0.7933803, -0.02796185, 3.0064, 0.6627451, 0, 1, 1,
0.7958353, 0.5865349, 1.490435, 0.6666667, 0, 1, 1,
0.800154, 1.0018, 0.9908337, 0.6745098, 0, 1, 1,
0.8129215, -0.5569859, -0.2848582, 0.6784314, 0, 1, 1,
0.8198366, 0.1329423, 2.433623, 0.6862745, 0, 1, 1,
0.8246258, 0.2644765, 0.1303656, 0.6901961, 0, 1, 1,
0.8341584, 0.3050524, 0.338033, 0.6980392, 0, 1, 1,
0.8355138, -2.136183, 0.7692362, 0.7058824, 0, 1, 1,
0.8360212, 1.39404, -0.6113914, 0.7098039, 0, 1, 1,
0.8392477, -0.1780824, 4.668472, 0.7176471, 0, 1, 1,
0.8410695, -0.6716204, 2.746713, 0.7215686, 0, 1, 1,
0.8431785, -1.620928, 2.178517, 0.7294118, 0, 1, 1,
0.8462497, 1.594765, 1.766519, 0.7333333, 0, 1, 1,
0.846858, 0.2893531, 0.2851037, 0.7411765, 0, 1, 1,
0.8469781, 0.3548381, 2.573871, 0.7450981, 0, 1, 1,
0.8475157, -1.06567, 4.465769, 0.7529412, 0, 1, 1,
0.8518976, -0.7327828, 2.06821, 0.7568628, 0, 1, 1,
0.8530344, -0.5483136, 3.708332, 0.7647059, 0, 1, 1,
0.8539121, -0.581935, 0.7355016, 0.7686275, 0, 1, 1,
0.8558378, 0.940133, -0.608241, 0.7764706, 0, 1, 1,
0.861737, 0.1565742, 0.3899148, 0.7803922, 0, 1, 1,
0.8625553, -1.902832, 4.759005, 0.7882353, 0, 1, 1,
0.8673171, 0.1002314, 0.0805975, 0.7921569, 0, 1, 1,
0.8704294, -0.02130126, 1.067552, 0.8, 0, 1, 1,
0.873072, 1.119662, 1.086253, 0.8078431, 0, 1, 1,
0.8782967, 0.2103458, 2.198056, 0.8117647, 0, 1, 1,
0.8840764, 1.538678, 0.001549822, 0.8196079, 0, 1, 1,
0.8843715, 0.02688887, 1.551533, 0.8235294, 0, 1, 1,
0.8855031, -2.817692, 3.949494, 0.8313726, 0, 1, 1,
0.8860439, -0.4451905, 0.8107848, 0.8352941, 0, 1, 1,
0.8892636, 1.210526, 1.483647, 0.8431373, 0, 1, 1,
0.890296, 0.773937, 3.424695, 0.8470588, 0, 1, 1,
0.8953959, -0.3607969, 1.614655, 0.854902, 0, 1, 1,
0.8973828, 1.315805, 0.139073, 0.8588235, 0, 1, 1,
0.9004307, -1.553214, 1.919847, 0.8666667, 0, 1, 1,
0.902476, 0.6150996, 0.6181066, 0.8705882, 0, 1, 1,
0.9039526, -0.2623143, 2.74687, 0.8784314, 0, 1, 1,
0.9046454, -2.42264, 2.649759, 0.8823529, 0, 1, 1,
0.9081821, -1.285576, 2.097006, 0.8901961, 0, 1, 1,
0.9172505, -0.8589652, 2.169542, 0.8941177, 0, 1, 1,
0.9220707, 0.5386164, 0.4833382, 0.9019608, 0, 1, 1,
0.9226118, 0.5681019, 1.677641, 0.9098039, 0, 1, 1,
0.92365, -0.2730822, 1.767582, 0.9137255, 0, 1, 1,
0.9248124, 0.01565091, 0.3022758, 0.9215686, 0, 1, 1,
0.9249766, 0.8069935, 0.8486168, 0.9254902, 0, 1, 1,
0.9268323, 0.7628415, -0.7426657, 0.9333333, 0, 1, 1,
0.9421142, -1.764541, 2.756889, 0.9372549, 0, 1, 1,
0.9435955, 0.5878746, 0.2325482, 0.945098, 0, 1, 1,
0.9458844, -1.442053, 2.438663, 0.9490196, 0, 1, 1,
0.9472805, 0.2559444, 0.2002675, 0.9568627, 0, 1, 1,
0.9502194, -0.7820451, 2.052124, 0.9607843, 0, 1, 1,
0.9558139, 0.4559857, 1.891153, 0.9686275, 0, 1, 1,
0.9559816, -0.3524039, 2.922494, 0.972549, 0, 1, 1,
0.9579245, -0.4292057, 3.135692, 0.9803922, 0, 1, 1,
0.960181, 0.08846415, 3.32256, 0.9843137, 0, 1, 1,
0.9613013, -0.2338937, 2.016491, 0.9921569, 0, 1, 1,
0.9620382, 1.64341, 0.2588574, 0.9960784, 0, 1, 1,
0.9639304, -0.0777102, -0.2460913, 1, 0, 0.9960784, 1,
0.968342, -2.658982, 3.470109, 1, 0, 0.9882353, 1,
0.9811471, 0.7114483, 1.761016, 1, 0, 0.9843137, 1,
0.9844679, -0.8875784, 1.325185, 1, 0, 0.9764706, 1,
0.9870359, -0.1632566, 2.669277, 1, 0, 0.972549, 1,
0.9927562, 0.0397925, -0.2408313, 1, 0, 0.9647059, 1,
1.00558, -0.2312149, 2.889866, 1, 0, 0.9607843, 1,
1.008977, 2.056029, -0.609342, 1, 0, 0.9529412, 1,
1.016879, -0.1198528, 0.5159798, 1, 0, 0.9490196, 1,
1.020436, -0.3746775, 3.110588, 1, 0, 0.9411765, 1,
1.042953, -1.4278, 1.347743, 1, 0, 0.9372549, 1,
1.044366, -0.02745504, 1.377226, 1, 0, 0.9294118, 1,
1.046137, -1.288974, 2.652099, 1, 0, 0.9254902, 1,
1.047077, 3.331313, 1.219975, 1, 0, 0.9176471, 1,
1.050729, 0.6646537, -0.2309068, 1, 0, 0.9137255, 1,
1.054977, -0.6036847, 1.907032, 1, 0, 0.9058824, 1,
1.060001, 1.337853, 1.955086, 1, 0, 0.9019608, 1,
1.070965, 0.0186698, 1.716877, 1, 0, 0.8941177, 1,
1.071561, 0.3847459, 1.261723, 1, 0, 0.8862745, 1,
1.074933, -0.1140252, 2.966684, 1, 0, 0.8823529, 1,
1.077152, 0.1461549, 2.963671, 1, 0, 0.8745098, 1,
1.080233, 0.03412589, 2.348577, 1, 0, 0.8705882, 1,
1.083171, 0.2783078, 2.60534, 1, 0, 0.8627451, 1,
1.086249, 3.67505, -0.7478639, 1, 0, 0.8588235, 1,
1.087972, 0.4772869, 0.9751289, 1, 0, 0.8509804, 1,
1.088185, -0.4360632, 2.858472, 1, 0, 0.8470588, 1,
1.091068, -1.287075, 3.630392, 1, 0, 0.8392157, 1,
1.09298, -0.9766876, 3.001851, 1, 0, 0.8352941, 1,
1.097379, 0.4737814, 2.620594, 1, 0, 0.827451, 1,
1.101325, -0.8204805, 4.227804, 1, 0, 0.8235294, 1,
1.115577, -0.5203408, 1.540595, 1, 0, 0.8156863, 1,
1.116014, 0.06616873, 3.180506, 1, 0, 0.8117647, 1,
1.118146, -0.9225439, 3.002822, 1, 0, 0.8039216, 1,
1.125314, -0.7650838, 2.17672, 1, 0, 0.7960784, 1,
1.128158, -0.9383178, 3.594364, 1, 0, 0.7921569, 1,
1.129552, 0.4185699, 1.057388, 1, 0, 0.7843137, 1,
1.131144, -1.013992, 0.2494999, 1, 0, 0.7803922, 1,
1.148302, 0.7915848, 0.7916456, 1, 0, 0.772549, 1,
1.156963, -1.094216, 1.732369, 1, 0, 0.7686275, 1,
1.158594, -1.620295, 4.076891, 1, 0, 0.7607843, 1,
1.168559, -1.79847, 0.3857638, 1, 0, 0.7568628, 1,
1.169827, 0.2483207, 2.139979, 1, 0, 0.7490196, 1,
1.19114, 0.3371536, 2.854713, 1, 0, 0.7450981, 1,
1.191516, 1.303651, 0.2208847, 1, 0, 0.7372549, 1,
1.197175, 0.2139681, 0.5223213, 1, 0, 0.7333333, 1,
1.197966, -0.2807374, 1.588609, 1, 0, 0.7254902, 1,
1.204055, -0.6706882, 1.342988, 1, 0, 0.7215686, 1,
1.206591, 0.5555295, 1.58276, 1, 0, 0.7137255, 1,
1.211642, -1.960092, 4.547091, 1, 0, 0.7098039, 1,
1.214632, -0.5610242, 0.7261245, 1, 0, 0.7019608, 1,
1.224339, 0.9182761, 0.3233358, 1, 0, 0.6941177, 1,
1.237565, -0.3682265, -0.1493032, 1, 0, 0.6901961, 1,
1.238548, 0.7221247, -0.4159782, 1, 0, 0.682353, 1,
1.238834, 0.1241455, 1.170249, 1, 0, 0.6784314, 1,
1.245267, -0.2398992, 2.236509, 1, 0, 0.6705883, 1,
1.246837, 0.8060678, 1.72699, 1, 0, 0.6666667, 1,
1.256788, 0.7206107, 0.8430686, 1, 0, 0.6588235, 1,
1.275683, -0.3084972, 2.550631, 1, 0, 0.654902, 1,
1.278207, 0.7527794, 0.3710053, 1, 0, 0.6470588, 1,
1.285754, -0.03988558, 0.6099243, 1, 0, 0.6431373, 1,
1.288146, -0.2194316, 1.898266, 1, 0, 0.6352941, 1,
1.301833, -1.354384, 4.606353, 1, 0, 0.6313726, 1,
1.303282, -0.6206334, 1.826359, 1, 0, 0.6235294, 1,
1.305184, 1.15804, 0.7030832, 1, 0, 0.6196079, 1,
1.311308, -0.941299, 1.284329, 1, 0, 0.6117647, 1,
1.314096, 0.1195426, 0.9876035, 1, 0, 0.6078432, 1,
1.315121, -0.1311612, -0.7041624, 1, 0, 0.6, 1,
1.315188, -0.7924107, 2.398561, 1, 0, 0.5921569, 1,
1.330378, -0.8981918, 1.085761, 1, 0, 0.5882353, 1,
1.332072, -0.02401619, 1.932997, 1, 0, 0.5803922, 1,
1.332676, 0.7473499, -0.09232686, 1, 0, 0.5764706, 1,
1.344977, -0.9227253, 3.152313, 1, 0, 0.5686275, 1,
1.35288, -0.268093, 1.589876, 1, 0, 0.5647059, 1,
1.355258, -0.4241786, 1.006198, 1, 0, 0.5568628, 1,
1.362139, -1.318823, 2.402164, 1, 0, 0.5529412, 1,
1.362192, -0.1207536, 1.233911, 1, 0, 0.5450981, 1,
1.365231, 0.6663704, -0.004023794, 1, 0, 0.5411765, 1,
1.384796, 0.2842651, 0.05849864, 1, 0, 0.5333334, 1,
1.3868, -0.08295078, 2.436604, 1, 0, 0.5294118, 1,
1.388498, 0.6170429, 1.521339, 1, 0, 0.5215687, 1,
1.405883, -1.590066, 1.094082, 1, 0, 0.5176471, 1,
1.407085, 0.2334088, 2.486997, 1, 0, 0.509804, 1,
1.407468, -1.812464, 2.177594, 1, 0, 0.5058824, 1,
1.410817, 0.6562823, 0.4655135, 1, 0, 0.4980392, 1,
1.416208, -0.4247479, 2.589424, 1, 0, 0.4901961, 1,
1.416412, -0.7201384, 1.629013, 1, 0, 0.4862745, 1,
1.423664, 0.2536114, 1.164773, 1, 0, 0.4784314, 1,
1.431144, 0.01650175, 1.35947, 1, 0, 0.4745098, 1,
1.437913, -1.13738, 3.592254, 1, 0, 0.4666667, 1,
1.443384, 0.2958283, 1.067582, 1, 0, 0.4627451, 1,
1.453487, -0.2496776, -0.2167699, 1, 0, 0.454902, 1,
1.45797, 1.486873, -1.639482, 1, 0, 0.4509804, 1,
1.458352, -0.593547, 0.9732078, 1, 0, 0.4431373, 1,
1.460113, -1.269195, 2.890167, 1, 0, 0.4392157, 1,
1.460119, -2.167068, 1.314138, 1, 0, 0.4313726, 1,
1.466579, -2.092379, 1.123332, 1, 0, 0.427451, 1,
1.477816, 0.4898857, 2.528156, 1, 0, 0.4196078, 1,
1.479512, -1.010255, 3.037235, 1, 0, 0.4156863, 1,
1.479723, -1.017101, 2.514057, 1, 0, 0.4078431, 1,
1.483333, -1.126201, 2.517712, 1, 0, 0.4039216, 1,
1.494515, -0.5219681, 0.4373471, 1, 0, 0.3960784, 1,
1.494956, 1.015448, -0.6765047, 1, 0, 0.3882353, 1,
1.497244, 2.344659, -0.415953, 1, 0, 0.3843137, 1,
1.510567, -1.43003, 2.73246, 1, 0, 0.3764706, 1,
1.543509, 2.084867, 1.209823, 1, 0, 0.372549, 1,
1.566461, -1.317735, 1.891066, 1, 0, 0.3647059, 1,
1.585347, 0.6551331, 3.984237, 1, 0, 0.3607843, 1,
1.587085, 0.02721303, 2.160573, 1, 0, 0.3529412, 1,
1.588764, 0.940396, 1.301969, 1, 0, 0.3490196, 1,
1.598772, -0.5730615, 0.1036511, 1, 0, 0.3411765, 1,
1.60883, 1.057153, 1.095059, 1, 0, 0.3372549, 1,
1.613959, -1.131925, 2.229767, 1, 0, 0.3294118, 1,
1.629755, 0.02800614, 0.4464937, 1, 0, 0.3254902, 1,
1.633428, 0.3578846, 0.7967407, 1, 0, 0.3176471, 1,
1.637301, 0.7944171, 2.273065, 1, 0, 0.3137255, 1,
1.639843, 0.3648494, 1.082037, 1, 0, 0.3058824, 1,
1.666689, -0.1440565, 1.880006, 1, 0, 0.2980392, 1,
1.668324, -2.735852, 2.59426, 1, 0, 0.2941177, 1,
1.68347, 0.6580883, 0.8552335, 1, 0, 0.2862745, 1,
1.685379, 1.795308, 1.573042, 1, 0, 0.282353, 1,
1.687431, -1.215645, 1.184556, 1, 0, 0.2745098, 1,
1.694947, -1.432208, 1.005108, 1, 0, 0.2705882, 1,
1.69694, -1.030826, 2.573116, 1, 0, 0.2627451, 1,
1.73492, 0.828046, 0.03735368, 1, 0, 0.2588235, 1,
1.743163, 2.114759, 0.08643635, 1, 0, 0.2509804, 1,
1.744761, 1.406588, 0.8712761, 1, 0, 0.2470588, 1,
1.755814, 0.7754344, 2.3462, 1, 0, 0.2392157, 1,
1.764992, -0.3248886, 0.05957161, 1, 0, 0.2352941, 1,
1.774665, -0.3020321, 1.27821, 1, 0, 0.227451, 1,
1.782604, 1.151716, 0.2458816, 1, 0, 0.2235294, 1,
1.784741, -0.6013358, 1.000974, 1, 0, 0.2156863, 1,
1.795137, 0.7390498, 0.9836786, 1, 0, 0.2117647, 1,
1.807115, 1.90198, 0.9539073, 1, 0, 0.2039216, 1,
1.827662, 1.016458, 1.066141, 1, 0, 0.1960784, 1,
1.868647, -0.8585188, 2.703078, 1, 0, 0.1921569, 1,
1.877501, -1.640211, 1.505646, 1, 0, 0.1843137, 1,
1.923288, -0.9143155, 2.933197, 1, 0, 0.1803922, 1,
1.928025, 0.1096055, 1.377256, 1, 0, 0.172549, 1,
1.950498, -1.208642, 2.234679, 1, 0, 0.1686275, 1,
1.954755, 0.6312234, 1.549271, 1, 0, 0.1607843, 1,
1.95522, -0.1066874, 0.1583391, 1, 0, 0.1568628, 1,
1.958779, 0.7340891, -0.1996469, 1, 0, 0.1490196, 1,
1.989557, 1.32829, 0.123678, 1, 0, 0.145098, 1,
2.039227, 0.4174601, 1.803502, 1, 0, 0.1372549, 1,
2.039376, -0.7274863, 0.9575371, 1, 0, 0.1333333, 1,
2.040642, -2.393015, 2.315507, 1, 0, 0.1254902, 1,
2.050759, -0.0967469, 3.708083, 1, 0, 0.1215686, 1,
2.160171, 1.253068, 0.3055138, 1, 0, 0.1137255, 1,
2.219822, -0.2773479, 3.939156, 1, 0, 0.1098039, 1,
2.226333, -0.6311439, 1.800104, 1, 0, 0.1019608, 1,
2.226558, 0.761371, 1.587012, 1, 0, 0.09411765, 1,
2.232739, -0.1183698, 0.5230937, 1, 0, 0.09019608, 1,
2.234628, -0.2598903, 1.659906, 1, 0, 0.08235294, 1,
2.240996, 0.3689499, 1.718957, 1, 0, 0.07843138, 1,
2.28213, -0.3033694, 1.49335, 1, 0, 0.07058824, 1,
2.320002, 0.7580928, 1.591657, 1, 0, 0.06666667, 1,
2.335818, -0.2864066, 2.275162, 1, 0, 0.05882353, 1,
2.356123, 1.232156, 1.309748, 1, 0, 0.05490196, 1,
2.371531, 0.5611108, 0.4201259, 1, 0, 0.04705882, 1,
2.43672, -0.06354696, 3.829999, 1, 0, 0.04313726, 1,
2.517823, -0.7784356, 2.668851, 1, 0, 0.03529412, 1,
2.546338, -0.2686827, 4.226404, 1, 0, 0.03137255, 1,
2.776268, 0.3578541, 0.3418544, 1, 0, 0.02352941, 1,
2.837817, 0.7930837, 1.393325, 1, 0, 0.01960784, 1,
3.253403, -1.66818, 3.55813, 1, 0, 0.01176471, 1,
4.67329, -1.310572, 1.52606, 1, 0, 0.007843138, 1
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
0.5248171, -4.356833, -7.727859, 0, -0.5, 0.5, 0.5,
0.5248171, -4.356833, -7.727859, 1, -0.5, 0.5, 0.5,
0.5248171, -4.356833, -7.727859, 1, 1.5, 0.5, 0.5,
0.5248171, -4.356833, -7.727859, 0, 1.5, 0.5, 0.5
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
-5.029988, 0.3076142, -7.727859, 0, -0.5, 0.5, 0.5,
-5.029988, 0.3076142, -7.727859, 1, -0.5, 0.5, 0.5,
-5.029988, 0.3076142, -7.727859, 1, 1.5, 0.5, 0.5,
-5.029988, 0.3076142, -7.727859, 0, 1.5, 0.5, 0.5
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
-5.029988, -4.356833, -0.3178618, 0, -0.5, 0.5, 0.5,
-5.029988, -4.356833, -0.3178618, 1, -0.5, 0.5, 0.5,
-5.029988, -4.356833, -0.3178618, 1, 1.5, 0.5, 0.5,
-5.029988, -4.356833, -0.3178618, 0, 1.5, 0.5, 0.5
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
-2, -3.280422, -6.017859,
4, -3.280422, -6.017859,
-2, -3.280422, -6.017859,
-2, -3.459823, -6.302859,
0, -3.280422, -6.017859,
0, -3.459823, -6.302859,
2, -3.280422, -6.017859,
2, -3.459823, -6.302859,
4, -3.280422, -6.017859,
4, -3.459823, -6.302859
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
"2",
"4"
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
-2, -3.818627, -6.872859, 0, -0.5, 0.5, 0.5,
-2, -3.818627, -6.872859, 1, -0.5, 0.5, 0.5,
-2, -3.818627, -6.872859, 1, 1.5, 0.5, 0.5,
-2, -3.818627, -6.872859, 0, 1.5, 0.5, 0.5,
0, -3.818627, -6.872859, 0, -0.5, 0.5, 0.5,
0, -3.818627, -6.872859, 1, -0.5, 0.5, 0.5,
0, -3.818627, -6.872859, 1, 1.5, 0.5, 0.5,
0, -3.818627, -6.872859, 0, 1.5, 0.5, 0.5,
2, -3.818627, -6.872859, 0, -0.5, 0.5, 0.5,
2, -3.818627, -6.872859, 1, -0.5, 0.5, 0.5,
2, -3.818627, -6.872859, 1, 1.5, 0.5, 0.5,
2, -3.818627, -6.872859, 0, 1.5, 0.5, 0.5,
4, -3.818627, -6.872859, 0, -0.5, 0.5, 0.5,
4, -3.818627, -6.872859, 1, -0.5, 0.5, 0.5,
4, -3.818627, -6.872859, 1, 1.5, 0.5, 0.5,
4, -3.818627, -6.872859, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.74811, -3, -6.017859,
-3.74811, 3, -6.017859,
-3.74811, -3, -6.017859,
-3.961756, -3, -6.302859,
-3.74811, -2, -6.017859,
-3.961756, -2, -6.302859,
-3.74811, -1, -6.017859,
-3.961756, -1, -6.302859,
-3.74811, 0, -6.017859,
-3.961756, 0, -6.302859,
-3.74811, 1, -6.017859,
-3.961756, 1, -6.302859,
-3.74811, 2, -6.017859,
-3.961756, 2, -6.302859,
-3.74811, 3, -6.017859,
-3.961756, 3, -6.302859
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
-4.389049, -3, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, -3, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, -3, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, -3, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, -2, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, -2, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, -2, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, -2, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, -1, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, -1, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, -1, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, -1, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, 0, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, 0, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, 0, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, 0, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, 1, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, 1, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, 1, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, 1, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, 2, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, 2, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, 2, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, 2, -6.872859, 0, 1.5, 0.5, 0.5,
-4.389049, 3, -6.872859, 0, -0.5, 0.5, 0.5,
-4.389049, 3, -6.872859, 1, -0.5, 0.5, 0.5,
-4.389049, 3, -6.872859, 1, 1.5, 0.5, 0.5,
-4.389049, 3, -6.872859, 0, 1.5, 0.5, 0.5
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
-3.74811, -3.280422, -4,
-3.74811, -3.280422, 4,
-3.74811, -3.280422, -4,
-3.961756, -3.459823, -4,
-3.74811, -3.280422, -2,
-3.961756, -3.459823, -2,
-3.74811, -3.280422, 0,
-3.961756, -3.459823, 0,
-3.74811, -3.280422, 2,
-3.961756, -3.459823, 2,
-3.74811, -3.280422, 4,
-3.961756, -3.459823, 4
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
-4.389049, -3.818627, -4, 0, -0.5, 0.5, 0.5,
-4.389049, -3.818627, -4, 1, -0.5, 0.5, 0.5,
-4.389049, -3.818627, -4, 1, 1.5, 0.5, 0.5,
-4.389049, -3.818627, -4, 0, 1.5, 0.5, 0.5,
-4.389049, -3.818627, -2, 0, -0.5, 0.5, 0.5,
-4.389049, -3.818627, -2, 1, -0.5, 0.5, 0.5,
-4.389049, -3.818627, -2, 1, 1.5, 0.5, 0.5,
-4.389049, -3.818627, -2, 0, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 0, 0, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 0, 1, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 0, 1, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 0, 0, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 2, 0, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 2, 1, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 2, 1, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 2, 0, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 4, 0, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 4, 1, -0.5, 0.5, 0.5,
-4.389049, -3.818627, 4, 1, 1.5, 0.5, 0.5,
-4.389049, -3.818627, 4, 0, 1.5, 0.5, 0.5
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
-3.74811, -3.280422, -6.017859,
-3.74811, 3.89565, -6.017859,
-3.74811, -3.280422, 5.382136,
-3.74811, 3.89565, 5.382136,
-3.74811, -3.280422, -6.017859,
-3.74811, -3.280422, 5.382136,
-3.74811, 3.89565, -6.017859,
-3.74811, 3.89565, 5.382136,
-3.74811, -3.280422, -6.017859,
4.797744, -3.280422, -6.017859,
-3.74811, -3.280422, 5.382136,
4.797744, -3.280422, 5.382136,
-3.74811, 3.89565, -6.017859,
4.797744, 3.89565, -6.017859,
-3.74811, 3.89565, 5.382136,
4.797744, 3.89565, 5.382136,
4.797744, -3.280422, -6.017859,
4.797744, 3.89565, -6.017859,
4.797744, -3.280422, 5.382136,
4.797744, 3.89565, 5.382136,
4.797744, -3.280422, -6.017859,
4.797744, -3.280422, 5.382136,
4.797744, 3.89565, -6.017859,
4.797744, 3.89565, 5.382136
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
var radius = 8.518413;
var distance = 37.89938;
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
mvMatrix.translate( -0.5248171, -0.3076142, 0.3178618 );
mvMatrix.scale( 1.077748, 1.28347, 0.8079192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.89938);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
alloxydim-sodium<-read.table("alloxydim-sodium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-alloxydim-sodium$V2
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
```

```r
y<-alloxydim-sodium$V3
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
```

```r
z<-alloxydim-sodium$V4
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
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
-3.623656, 1.254973, -1.769469, 0, 0, 1, 1, 1,
-3.042274, -0.0731553, -1.975271, 1, 0, 0, 1, 1,
-2.98608, 0.6056933, 0.6213946, 1, 0, 0, 1, 1,
-2.945093, 1.28302, 0.433977, 1, 0, 0, 1, 1,
-2.72761, -0.1445763, -0.7077651, 1, 0, 0, 1, 1,
-2.689938, 0.5881743, -3.375769, 1, 0, 0, 1, 1,
-2.621445, 1.091518, 0.09365002, 0, 0, 0, 1, 1,
-2.521386, -1.225917, -3.870166, 0, 0, 0, 1, 1,
-2.492036, 1.107117, -0.2711418, 0, 0, 0, 1, 1,
-2.432263, -0.5408677, -1.826173, 0, 0, 0, 1, 1,
-2.429305, -0.4434169, -1.923833, 0, 0, 0, 1, 1,
-2.322762, -0.4488066, -2.075926, 0, 0, 0, 1, 1,
-2.242475, -0.6796189, -1.376837, 0, 0, 0, 1, 1,
-2.240958, 0.6328048, 0.3526401, 1, 1, 1, 1, 1,
-2.222198, 0.5202996, -1.376525, 1, 1, 1, 1, 1,
-2.207073, 0.3385132, -1.113559, 1, 1, 1, 1, 1,
-2.164707, 0.5727744, -1.833698, 1, 1, 1, 1, 1,
-2.155272, -0.9478, -1.353723, 1, 1, 1, 1, 1,
-2.13242, -1.795431, -2.537544, 1, 1, 1, 1, 1,
-2.128545, 0.2764511, 0.06419232, 1, 1, 1, 1, 1,
-2.103656, -0.5166967, -2.100713, 1, 1, 1, 1, 1,
-2.096126, -0.1886772, -2.905135, 1, 1, 1, 1, 1,
-2.036753, 0.9349, -1.267861, 1, 1, 1, 1, 1,
-2.030319, -0.06562084, -1.217529, 1, 1, 1, 1, 1,
-2.029619, -0.4326356, -1.48431, 1, 1, 1, 1, 1,
-2.027081, -0.1403291, -1.131404, 1, 1, 1, 1, 1,
-2.00272, 1.718189, -0.5455102, 1, 1, 1, 1, 1,
-1.987902, -0.5223761, 0.1511393, 1, 1, 1, 1, 1,
-1.968368, -0.8534259, -2.839145, 0, 0, 1, 1, 1,
-1.962335, -2.373572, -1.941057, 1, 0, 0, 1, 1,
-1.929098, -1.988129, -2.901386, 1, 0, 0, 1, 1,
-1.893856, 1.067905, -0.8908765, 1, 0, 0, 1, 1,
-1.871542, 0.157912, -0.501293, 1, 0, 0, 1, 1,
-1.849643, -0.300436, -2.939501, 1, 0, 0, 1, 1,
-1.849276, -1.444791, -1.690232, 0, 0, 0, 1, 1,
-1.849059, 1.199219, -0.3969205, 0, 0, 0, 1, 1,
-1.837064, 0.47828, -1.75094, 0, 0, 0, 1, 1,
-1.83565, -1.760829, -2.251559, 0, 0, 0, 1, 1,
-1.833745, -0.06814179, -2.059696, 0, 0, 0, 1, 1,
-1.830709, 1.213493, -1.998585, 0, 0, 0, 1, 1,
-1.806441, -0.8776785, -3.864572, 0, 0, 0, 1, 1,
-1.792482, 0.3614475, -0.1715024, 1, 1, 1, 1, 1,
-1.784156, 2.584419, -2.19013, 1, 1, 1, 1, 1,
-1.774273, 0.3789858, -1.835684, 1, 1, 1, 1, 1,
-1.768509, 0.7709663, -1.057443, 1, 1, 1, 1, 1,
-1.764573, -0.4870148, -2.311894, 1, 1, 1, 1, 1,
-1.747197, 2.097125, -1.00007, 1, 1, 1, 1, 1,
-1.747058, 0.07902017, 0.02707865, 1, 1, 1, 1, 1,
-1.744963, 0.6768047, -1.347906, 1, 1, 1, 1, 1,
-1.742197, -0.5667813, -0.8771, 1, 1, 1, 1, 1,
-1.70009, -0.5509896, -1.714759, 1, 1, 1, 1, 1,
-1.699038, 1.247643, -1.589949, 1, 1, 1, 1, 1,
-1.684596, -0.8559472, -1.953186, 1, 1, 1, 1, 1,
-1.682612, 0.339597, -0.6927065, 1, 1, 1, 1, 1,
-1.67851, -2.980322, -2.485677, 1, 1, 1, 1, 1,
-1.675959, 0.3043328, -1.653107, 1, 1, 1, 1, 1,
-1.67355, -0.3962486, -2.011903, 0, 0, 1, 1, 1,
-1.667274, 0.2612328, 0.3058488, 1, 0, 0, 1, 1,
-1.645598, 1.237383, -0.7395937, 1, 0, 0, 1, 1,
-1.633751, -0.5331297, -2.460892, 1, 0, 0, 1, 1,
-1.627955, 2.081775, -0.4181195, 1, 0, 0, 1, 1,
-1.62241, 1.537345, -0.1307014, 1, 0, 0, 1, 1,
-1.613438, -0.3178578, -1.234853, 0, 0, 0, 1, 1,
-1.592089, -0.3714657, -2.381754, 0, 0, 0, 1, 1,
-1.562156, 1.332584, -1.548323, 0, 0, 0, 1, 1,
-1.561597, -0.006153462, -3.042759, 0, 0, 0, 1, 1,
-1.536353, 0.4223222, -0.45654, 0, 0, 0, 1, 1,
-1.535139, 0.007289491, -3.531319, 0, 0, 0, 1, 1,
-1.534678, 0.06696635, -0.2338541, 0, 0, 0, 1, 1,
-1.5286, -0.9334952, -3.594278, 1, 1, 1, 1, 1,
-1.516667, -0.07587735, -2.403781, 1, 1, 1, 1, 1,
-1.497062, -0.299786, -1.45373, 1, 1, 1, 1, 1,
-1.496027, 2.659888, -1.291127, 1, 1, 1, 1, 1,
-1.486838, 0.6498526, -0.5156031, 1, 1, 1, 1, 1,
-1.485342, -1.659693, -4.120572, 1, 1, 1, 1, 1,
-1.48024, -0.5112981, -2.676966, 1, 1, 1, 1, 1,
-1.477573, 0.5164791, -2.371869, 1, 1, 1, 1, 1,
-1.476495, -1.514871, -2.163319, 1, 1, 1, 1, 1,
-1.47149, 0.4498338, -1.042325, 1, 1, 1, 1, 1,
-1.467733, 0.9155918, 0.04478702, 1, 1, 1, 1, 1,
-1.459188, -0.08179712, -2.85148, 1, 1, 1, 1, 1,
-1.450944, -0.623196, -2.744211, 1, 1, 1, 1, 1,
-1.437948, 1.395895, 0.2414499, 1, 1, 1, 1, 1,
-1.435963, -1.914306, -1.081226, 1, 1, 1, 1, 1,
-1.419419, 2.244378, -3.429357, 0, 0, 1, 1, 1,
-1.39458, -0.3313201, -2.28536, 1, 0, 0, 1, 1,
-1.384814, -0.5568762, -2.03898, 1, 0, 0, 1, 1,
-1.379013, -0.3656694, 0.1016552, 1, 0, 0, 1, 1,
-1.361797, 2.098596, 0.1715177, 1, 0, 0, 1, 1,
-1.361338, -0.6688257, -1.725575, 1, 0, 0, 1, 1,
-1.344933, -1.144596, -2.511967, 0, 0, 0, 1, 1,
-1.344572, 0.8956159, -1.453983, 0, 0, 0, 1, 1,
-1.339135, -0.4476972, -2.095641, 0, 0, 0, 1, 1,
-1.337212, 0.5680605, -2.352981, 0, 0, 0, 1, 1,
-1.329989, 0.4475757, -4.480598, 0, 0, 0, 1, 1,
-1.329893, -0.126099, -0.6120705, 0, 0, 0, 1, 1,
-1.32705, 0.6978163, -1.763732, 0, 0, 0, 1, 1,
-1.321039, -0.3387963, -1.80542, 1, 1, 1, 1, 1,
-1.318599, 0.9965974, -1.312703, 1, 1, 1, 1, 1,
-1.312619, -0.1022881, -0.8238992, 1, 1, 1, 1, 1,
-1.309311, -0.01295567, -2.657128, 1, 1, 1, 1, 1,
-1.293449, 1.481567, -0.4334787, 1, 1, 1, 1, 1,
-1.289232, 0.6995407, -0.7704023, 1, 1, 1, 1, 1,
-1.28337, -0.06602028, -1.29213, 1, 1, 1, 1, 1,
-1.279964, -1.253878, -2.056582, 1, 1, 1, 1, 1,
-1.276656, -1.333056, -3.140198, 1, 1, 1, 1, 1,
-1.266132, 0.3168409, -1.682231, 1, 1, 1, 1, 1,
-1.260646, 0.2813175, -1.358425, 1, 1, 1, 1, 1,
-1.258506, -0.3105022, -3.56161, 1, 1, 1, 1, 1,
-1.256434, 0.3750223, 0.6441293, 1, 1, 1, 1, 1,
-1.251873, 1.478047, -2.888768, 1, 1, 1, 1, 1,
-1.247956, 0.5948742, -1.567893, 1, 1, 1, 1, 1,
-1.240934, -0.1222372, 0.2170895, 0, 0, 1, 1, 1,
-1.235704, 0.1432985, -3.043856, 1, 0, 0, 1, 1,
-1.231674, 1.793155, 0.01904796, 1, 0, 0, 1, 1,
-1.230637, -0.534552, -2.061296, 1, 0, 0, 1, 1,
-1.21778, -1.391995, -2.257765, 1, 0, 0, 1, 1,
-1.217119, 2.718374, -1.254998, 1, 0, 0, 1, 1,
-1.214551, -0.2262772, -1.499089, 0, 0, 0, 1, 1,
-1.209764, 0.5693925, -1.161678, 0, 0, 0, 1, 1,
-1.208796, 0.8975949, -0.3891552, 0, 0, 0, 1, 1,
-1.201512, 0.4706753, 0.09236436, 0, 0, 0, 1, 1,
-1.198036, 0.258362, -1.516897, 0, 0, 0, 1, 1,
-1.197467, -1.228052, -0.9397856, 0, 0, 0, 1, 1,
-1.191936, 0.5928936, -1.621855, 0, 0, 0, 1, 1,
-1.189202, -0.174096, -1.55239, 1, 1, 1, 1, 1,
-1.185112, 1.382661, -1.986371, 1, 1, 1, 1, 1,
-1.184249, 0.2243648, -0.3907163, 1, 1, 1, 1, 1,
-1.180567, 0.7978714, -2.749606, 1, 1, 1, 1, 1,
-1.178711, 1.768395, -0.252764, 1, 1, 1, 1, 1,
-1.173229, 2.206181, -0.3156316, 1, 1, 1, 1, 1,
-1.172917, -2.472466, -4.397991, 1, 1, 1, 1, 1,
-1.169552, -1.893278, -2.91653, 1, 1, 1, 1, 1,
-1.160919, -0.8714707, -1.345746, 1, 1, 1, 1, 1,
-1.158213, 0.4852657, -0.1205724, 1, 1, 1, 1, 1,
-1.156869, -1.210939, 0.08027261, 1, 1, 1, 1, 1,
-1.152331, 0.462577, -0.5050658, 1, 1, 1, 1, 1,
-1.146297, 1.714472, -2.144902, 1, 1, 1, 1, 1,
-1.144595, 0.4115192, -1.838747, 1, 1, 1, 1, 1,
-1.14236, 1.723187, -0.2136233, 1, 1, 1, 1, 1,
-1.139581, 2.094557, 0.3390146, 0, 0, 1, 1, 1,
-1.139352, 0.007858552, -0.9799249, 1, 0, 0, 1, 1,
-1.139198, -2.188514, -4.278955, 1, 0, 0, 1, 1,
-1.13724, 1.901084, 0.8774642, 1, 0, 0, 1, 1,
-1.1328, 1.3292, -0.05070176, 1, 0, 0, 1, 1,
-1.132186, 1.148805, 1.270027, 1, 0, 0, 1, 1,
-1.13078, 1.189999, 1.001331, 0, 0, 0, 1, 1,
-1.126652, 1.725733, -0.771692, 0, 0, 0, 1, 1,
-1.122349, -0.3096001, -1.830712, 0, 0, 0, 1, 1,
-1.120747, 0.9338884, -0.2149193, 0, 0, 0, 1, 1,
-1.116281, -0.7510156, -1.9524, 0, 0, 0, 1, 1,
-1.108811, -0.4841002, -1.435345, 0, 0, 0, 1, 1,
-1.106415, 0.7027926, -0.5467386, 0, 0, 0, 1, 1,
-1.101824, -0.5817991, -4.122141, 1, 1, 1, 1, 1,
-1.093279, -0.4094006, -1.099571, 1, 1, 1, 1, 1,
-1.092439, 0.9656124, -2.922842, 1, 1, 1, 1, 1,
-1.080582, -0.1769316, -0.2763259, 1, 1, 1, 1, 1,
-1.076927, 0.04140495, -2.112365, 1, 1, 1, 1, 1,
-1.070552, 0.353642, -0.7945342, 1, 1, 1, 1, 1,
-1.069167, 1.063299, -0.9481644, 1, 1, 1, 1, 1,
-1.064831, 0.1619179, -2.646375, 1, 1, 1, 1, 1,
-1.062024, -0.7481569, -2.446439, 1, 1, 1, 1, 1,
-1.05384, -0.3196214, -1.622636, 1, 1, 1, 1, 1,
-1.05304, -0.498902, -2.638499, 1, 1, 1, 1, 1,
-1.053017, 1.304172, 0.1110511, 1, 1, 1, 1, 1,
-1.048431, -0.003908793, -3.381464, 1, 1, 1, 1, 1,
-1.047294, -0.4165118, -0.8868204, 1, 1, 1, 1, 1,
-1.04328, -0.656703, -3.362687, 1, 1, 1, 1, 1,
-1.042108, 1.009624, -0.5011678, 0, 0, 1, 1, 1,
-1.040442, 0.1560981, -1.742757, 1, 0, 0, 1, 1,
-1.029048, 0.6868532, -1.907151, 1, 0, 0, 1, 1,
-1.02886, 0.9268153, -2.10405, 1, 0, 0, 1, 1,
-1.02811, -0.8320945, -0.8814749, 1, 0, 0, 1, 1,
-1.023474, 0.001859075, -0.0001695634, 1, 0, 0, 1, 1,
-1.0206, -2.143626, -2.389824, 0, 0, 0, 1, 1,
-1.013124, -0.8545094, -2.707446, 0, 0, 0, 1, 1,
-1.012797, 0.5033882, 0.4260779, 0, 0, 0, 1, 1,
-1.012752, 1.029022, -2.489501, 0, 0, 0, 1, 1,
-1.012133, 0.7793679, -1.191328, 0, 0, 0, 1, 1,
-1.009244, 2.070071, -0.7012603, 0, 0, 0, 1, 1,
-1.006886, 0.8881817, -1.363619, 0, 0, 0, 1, 1,
-0.9911477, -1.89674, -1.466583, 1, 1, 1, 1, 1,
-0.9898565, -0.8867548, -3.564832, 1, 1, 1, 1, 1,
-0.9810474, 1.34984, -0.08362586, 1, 1, 1, 1, 1,
-0.9786892, -0.5586764, -2.498719, 1, 1, 1, 1, 1,
-0.9760943, 0.6920306, 0.7237132, 1, 1, 1, 1, 1,
-0.9680108, -0.428621, -2.900715, 1, 1, 1, 1, 1,
-0.9540603, -0.269187, -2.611434, 1, 1, 1, 1, 1,
-0.9490324, 0.3387897, -0.1185584, 1, 1, 1, 1, 1,
-0.9427122, 0.09435797, -1.106329, 1, 1, 1, 1, 1,
-0.941461, -1.537412, -3.727866, 1, 1, 1, 1, 1,
-0.9368839, -1.527246, -2.495354, 1, 1, 1, 1, 1,
-0.9362619, 3.791144, 1.136207, 1, 1, 1, 1, 1,
-0.936259, -0.5753033, -1.75527, 1, 1, 1, 1, 1,
-0.9219692, 0.4936167, -0.04395301, 1, 1, 1, 1, 1,
-0.917771, -0.3798981, -2.848892, 1, 1, 1, 1, 1,
-0.9021559, -1.609817, -3.242081, 0, 0, 1, 1, 1,
-0.8962051, -0.7688679, -0.314221, 1, 0, 0, 1, 1,
-0.8942798, -0.623912, -3.958092, 1, 0, 0, 1, 1,
-0.8913999, 0.08555891, -0.4787038, 1, 0, 0, 1, 1,
-0.8826404, -0.1516373, -1.550977, 1, 0, 0, 1, 1,
-0.8820747, -0.5824199, -2.647864, 1, 0, 0, 1, 1,
-0.8588524, -0.2892566, -2.39321, 0, 0, 0, 1, 1,
-0.8557061, 0.5695805, -0.6369114, 0, 0, 0, 1, 1,
-0.8533375, 0.2117753, 0.5037737, 0, 0, 0, 1, 1,
-0.8448254, 1.015932, -0.3608148, 0, 0, 0, 1, 1,
-0.8389397, -0.4593677, -0.2891052, 0, 0, 0, 1, 1,
-0.8329811, 0.6710799, -0.8346072, 0, 0, 0, 1, 1,
-0.8324581, -0.70508, -1.989221, 0, 0, 0, 1, 1,
-0.8263595, -0.3005789, -2.507094, 1, 1, 1, 1, 1,
-0.825928, 0.4290566, -1.410435, 1, 1, 1, 1, 1,
-0.8232257, -1.628245, -3.039308, 1, 1, 1, 1, 1,
-0.8208523, -1.001366, -2.79353, 1, 1, 1, 1, 1,
-0.8166299, -0.8681644, -1.937119, 1, 1, 1, 1, 1,
-0.8154674, 1.512866, -0.4643932, 1, 1, 1, 1, 1,
-0.8125719, -0.9825915, -1.47948, 1, 1, 1, 1, 1,
-0.810833, 0.5107444, -1.01236, 1, 1, 1, 1, 1,
-0.8069419, -0.9414981, -2.569611, 1, 1, 1, 1, 1,
-0.7948229, -0.7315978, -2.490811, 1, 1, 1, 1, 1,
-0.794179, -0.4430879, -0.9792082, 1, 1, 1, 1, 1,
-0.7925037, -0.17741, -2.445538, 1, 1, 1, 1, 1,
-0.7892862, -1.061272, -2.525442, 1, 1, 1, 1, 1,
-0.7840515, -1.549485, -2.244533, 1, 1, 1, 1, 1,
-0.7756707, -0.7992281, -2.320255, 1, 1, 1, 1, 1,
-0.7754245, 0.3514272, -0.1569674, 0, 0, 1, 1, 1,
-0.772, -0.1669444, 0.1710608, 1, 0, 0, 1, 1,
-0.7719185, 0.709141, -1.386681, 1, 0, 0, 1, 1,
-0.7680377, 1.50358, -0.4585514, 1, 0, 0, 1, 1,
-0.7675843, 0.220846, -1.615598, 1, 0, 0, 1, 1,
-0.7653289, -0.5331214, -1.95376, 1, 0, 0, 1, 1,
-0.7628176, 0.5751818, -0.8706478, 0, 0, 0, 1, 1,
-0.7592671, -1.445413, -3.535919, 0, 0, 0, 1, 1,
-0.7569855, 0.003797444, -1.468535, 0, 0, 0, 1, 1,
-0.756337, -0.8603989, -3.242738, 0, 0, 0, 1, 1,
-0.7559976, 1.254673, -0.1961722, 0, 0, 0, 1, 1,
-0.7491001, 1.256343, -0.8821743, 0, 0, 0, 1, 1,
-0.7474604, 0.2153239, -2.32477, 0, 0, 0, 1, 1,
-0.7445304, -0.6975001, -2.246507, 1, 1, 1, 1, 1,
-0.743291, -0.7508564, -3.025757, 1, 1, 1, 1, 1,
-0.7421864, -0.8768625, -3.131895, 1, 1, 1, 1, 1,
-0.7416912, 1.255031, -0.470206, 1, 1, 1, 1, 1,
-0.7414247, 0.7862272, 1.19479, 1, 1, 1, 1, 1,
-0.7393348, 1.10364, -1.254156, 1, 1, 1, 1, 1,
-0.7389376, 1.569834, -1.569762, 1, 1, 1, 1, 1,
-0.7389154, -0.6302217, -0.9060452, 1, 1, 1, 1, 1,
-0.7377666, -0.2256511, -1.918295, 1, 1, 1, 1, 1,
-0.7359124, -0.788983, -1.667901, 1, 1, 1, 1, 1,
-0.7284535, 0.2961061, -1.993942, 1, 1, 1, 1, 1,
-0.7278395, -0.6068513, -2.309574, 1, 1, 1, 1, 1,
-0.7248716, -0.5162455, -1.077766, 1, 1, 1, 1, 1,
-0.7191994, -1.127116, -1.313182, 1, 1, 1, 1, 1,
-0.7160897, -0.1890115, -0.9829059, 1, 1, 1, 1, 1,
-0.7132584, 0.4117197, -0.6428227, 0, 0, 1, 1, 1,
-0.7117409, -0.2770357, -1.503936, 1, 0, 0, 1, 1,
-0.7093441, -0.1783952, -2.579927, 1, 0, 0, 1, 1,
-0.7080786, 0.8109154, -0.8102258, 1, 0, 0, 1, 1,
-0.7056482, -0.9302581, -1.466082, 1, 0, 0, 1, 1,
-0.7047434, 0.3582878, -0.4888152, 1, 0, 0, 1, 1,
-0.70406, -1.661639, -2.508216, 0, 0, 0, 1, 1,
-0.7029272, 0.0041352, -0.5523618, 0, 0, 0, 1, 1,
-0.7010028, 0.2542318, -2.10008, 0, 0, 0, 1, 1,
-0.6903448, 0.162482, -3.292168, 0, 0, 0, 1, 1,
-0.6778145, 0.360448, -0.3629829, 0, 0, 0, 1, 1,
-0.6720145, 0.246681, -0.9367028, 0, 0, 0, 1, 1,
-0.6706363, -0.3074574, -0.7234948, 0, 0, 0, 1, 1,
-0.6703947, 0.05523417, -2.435817, 1, 1, 1, 1, 1,
-0.6699259, 0.519504, -2.332445, 1, 1, 1, 1, 1,
-0.6623922, 0.8616574, 0.8984521, 1, 1, 1, 1, 1,
-0.6617527, -0.2303597, -2.125189, 1, 1, 1, 1, 1,
-0.6591828, 0.3672165, 0.4830342, 1, 1, 1, 1, 1,
-0.6567417, 0.2497795, -0.6900282, 1, 1, 1, 1, 1,
-0.6567068, 1.353786, -3.069684, 1, 1, 1, 1, 1,
-0.6410682, -0.7707927, -2.07218, 1, 1, 1, 1, 1,
-0.6339957, -0.4648857, -1.877602, 1, 1, 1, 1, 1,
-0.6069701, 0.2251882, -1.267756, 1, 1, 1, 1, 1,
-0.6044591, 0.9663762, 0.5995025, 1, 1, 1, 1, 1,
-0.603965, -1.792135, -2.495446, 1, 1, 1, 1, 1,
-0.5997729, -0.1225579, -2.876638, 1, 1, 1, 1, 1,
-0.598897, 0.1480463, -2.869004, 1, 1, 1, 1, 1,
-0.5940776, -0.05088575, -0.9815955, 1, 1, 1, 1, 1,
-0.5904721, -0.1955782, -1.248525, 0, 0, 1, 1, 1,
-0.5850459, -0.5762959, -2.568657, 1, 0, 0, 1, 1,
-0.5843004, -0.3940793, -4.089636, 1, 0, 0, 1, 1,
-0.5840375, -0.1943335, -1.259394, 1, 0, 0, 1, 1,
-0.5830916, 0.6653036, 1.533826, 1, 0, 0, 1, 1,
-0.5803975, -0.8874761, -2.730541, 1, 0, 0, 1, 1,
-0.5757791, -0.6816232, -1.278745, 0, 0, 0, 1, 1,
-0.5737367, -0.6646813, -3.521539, 0, 0, 0, 1, 1,
-0.5634997, 1.757337, 0.9449084, 0, 0, 0, 1, 1,
-0.5624051, -1.109607, -1.436215, 0, 0, 0, 1, 1,
-0.5609314, -0.8627834, -2.474048, 0, 0, 0, 1, 1,
-0.5573742, 0.09074076, -1.663253, 0, 0, 0, 1, 1,
-0.5562748, -0.141883, -2.297077, 0, 0, 0, 1, 1,
-0.5553592, -0.9325182, -2.202806, 1, 1, 1, 1, 1,
-0.5552109, 0.06765889, -0.9903234, 1, 1, 1, 1, 1,
-0.5542594, 0.9059348, -2.228229, 1, 1, 1, 1, 1,
-0.5516271, 0.8266618, -0.8040665, 1, 1, 1, 1, 1,
-0.5476732, 0.5309489, 0.1567525, 1, 1, 1, 1, 1,
-0.5453765, -1.640936, -1.382592, 1, 1, 1, 1, 1,
-0.5432844, -1.161752, -2.854877, 1, 1, 1, 1, 1,
-0.5407341, 0.8839985, 0.676231, 1, 1, 1, 1, 1,
-0.5402012, 2.179139, -0.6397775, 1, 1, 1, 1, 1,
-0.5357391, 0.5358922, 0.08160044, 1, 1, 1, 1, 1,
-0.5334795, -1.535295, -0.882208, 1, 1, 1, 1, 1,
-0.5325486, -1.312616, -2.857475, 1, 1, 1, 1, 1,
-0.5309336, -0.5875738, -2.550194, 1, 1, 1, 1, 1,
-0.5302392, 0.477376, -0.8030204, 1, 1, 1, 1, 1,
-0.5298808, -0.6444275, -2.108078, 1, 1, 1, 1, 1,
-0.52817, -1.720028, -4.017635, 0, 0, 1, 1, 1,
-0.5267748, -1.829623, -3.193836, 1, 0, 0, 1, 1,
-0.5227298, -0.7807619, -2.16732, 1, 0, 0, 1, 1,
-0.5224743, -1.352374, -2.911597, 1, 0, 0, 1, 1,
-0.5200579, -0.6124198, -3.293726, 1, 0, 0, 1, 1,
-0.5148562, 0.8116003, -0.5058877, 1, 0, 0, 1, 1,
-0.514211, 0.8760527, -1.527856, 0, 0, 0, 1, 1,
-0.5123408, 1.269413, -0.7421414, 0, 0, 0, 1, 1,
-0.5072336, -0.7459815, -3.447904, 0, 0, 0, 1, 1,
-0.5049149, -2.595747, -1.392047, 0, 0, 0, 1, 1,
-0.5028765, 0.5954645, -1.118783, 0, 0, 0, 1, 1,
-0.5027407, 0.1071101, -3.427562, 0, 0, 0, 1, 1,
-0.5022171, 2.05717, 0.6084334, 0, 0, 0, 1, 1,
-0.4978462, 2.279036, -0.07990915, 1, 1, 1, 1, 1,
-0.4905784, 2.750325, -0.3230401, 1, 1, 1, 1, 1,
-0.4902581, -0.2406556, -0.7451981, 1, 1, 1, 1, 1,
-0.4800421, -0.6971726, -1.215402, 1, 1, 1, 1, 1,
-0.4761809, -0.3645538, -4.221689, 1, 1, 1, 1, 1,
-0.47299, -0.6295319, -2.874309, 1, 1, 1, 1, 1,
-0.4716047, -1.700751, -0.9356112, 1, 1, 1, 1, 1,
-0.4640512, 0.4137321, 0.5956558, 1, 1, 1, 1, 1,
-0.4431751, 0.3969572, -1.100218, 1, 1, 1, 1, 1,
-0.4397415, -1.183779, -2.552045, 1, 1, 1, 1, 1,
-0.4386899, -1.071769, -2.789763, 1, 1, 1, 1, 1,
-0.4298679, -1.95153, -4.383133, 1, 1, 1, 1, 1,
-0.4270901, -0.7057609, -2.550173, 1, 1, 1, 1, 1,
-0.4260205, -1.509038, -4.314107, 1, 1, 1, 1, 1,
-0.4239487, 0.009866813, -2.368954, 1, 1, 1, 1, 1,
-0.423675, -0.3924907, -1.537547, 0, 0, 1, 1, 1,
-0.4200548, -1.703186, -0.7107262, 1, 0, 0, 1, 1,
-0.4177279, 0.3660888, -0.8033976, 1, 0, 0, 1, 1,
-0.4174741, 0.4850633, -0.2385357, 1, 0, 0, 1, 1,
-0.4149199, 0.5258198, 0.7089828, 1, 0, 0, 1, 1,
-0.412408, 0.8909883, -2.476259, 1, 0, 0, 1, 1,
-0.4099964, 0.3202943, -0.2023009, 0, 0, 0, 1, 1,
-0.4081197, 1.305662, -0.1644078, 0, 0, 0, 1, 1,
-0.4074158, 0.3977196, -1.138055, 0, 0, 0, 1, 1,
-0.4050319, -0.03307506, -1.274948, 0, 0, 0, 1, 1,
-0.4034724, 0.3749387, -1.742861, 0, 0, 0, 1, 1,
-0.3995256, -0.7195878, -2.594013, 0, 0, 0, 1, 1,
-0.3986116, -0.3682757, -1.622618, 0, 0, 0, 1, 1,
-0.3936296, -0.6205926, -3.202487, 1, 1, 1, 1, 1,
-0.3928318, 0.5724269, -1.546062, 1, 1, 1, 1, 1,
-0.3923342, -0.1634479, -1.461521, 1, 1, 1, 1, 1,
-0.3907285, 1.242622, 0.1471496, 1, 1, 1, 1, 1,
-0.3871504, -1.601694, -3.074851, 1, 1, 1, 1, 1,
-0.3851129, -0.8202412, -1.514711, 1, 1, 1, 1, 1,
-0.3847315, 0.07825053, -1.458484, 1, 1, 1, 1, 1,
-0.3826442, -1.428106, -4.5917, 1, 1, 1, 1, 1,
-0.3818896, -1.190186, -2.91402, 1, 1, 1, 1, 1,
-0.3816729, -0.7343746, -1.937862, 1, 1, 1, 1, 1,
-0.381011, -1.157663, -4.354165, 1, 1, 1, 1, 1,
-0.3770945, -1.601153, -3.87726, 1, 1, 1, 1, 1,
-0.3696518, -0.7306017, -4.211507, 1, 1, 1, 1, 1,
-0.3691983, -0.8283586, -4.058684, 1, 1, 1, 1, 1,
-0.3668049, 1.305401, 0.8242332, 1, 1, 1, 1, 1,
-0.3653651, 0.6875625, -0.3747014, 0, 0, 1, 1, 1,
-0.3646561, 0.1077162, -0.6158403, 1, 0, 0, 1, 1,
-0.3607048, -0.5937395, -4.580686, 1, 0, 0, 1, 1,
-0.360222, -1.598317, -2.938138, 1, 0, 0, 1, 1,
-0.359173, -0.1338372, -1.035968, 1, 0, 0, 1, 1,
-0.3588798, 0.60982, -0.06713043, 1, 0, 0, 1, 1,
-0.3577507, 0.4849527, -0.1304071, 0, 0, 0, 1, 1,
-0.3486235, 0.6043757, -0.3479457, 0, 0, 0, 1, 1,
-0.3418053, -1.437426, -3.569407, 0, 0, 0, 1, 1,
-0.337899, 0.4564544, -1.194933, 0, 0, 0, 1, 1,
-0.3368311, -0.9971867, -1.913864, 0, 0, 0, 1, 1,
-0.3332719, -0.5494031, -2.647673, 0, 0, 0, 1, 1,
-0.3285019, -1.231912, -1.18412, 0, 0, 0, 1, 1,
-0.3268656, -0.170935, -2.895414, 1, 1, 1, 1, 1,
-0.3239318, 1.415787, -1.599738, 1, 1, 1, 1, 1,
-0.3236, -0.3569695, -1.848449, 1, 1, 1, 1, 1,
-0.3230575, -3.138206, -2.354611, 1, 1, 1, 1, 1,
-0.3191198, 1.069904, 0.2800182, 1, 1, 1, 1, 1,
-0.3166897, 1.699437, -0.9229955, 1, 1, 1, 1, 1,
-0.3160484, 0.3079246, 1.296665, 1, 1, 1, 1, 1,
-0.3148035, 0.9697117, 0.570928, 1, 1, 1, 1, 1,
-0.3067956, -0.0468246, -0.7808753, 1, 1, 1, 1, 1,
-0.304853, -0.1026579, -0.8068869, 1, 1, 1, 1, 1,
-0.3027, 1.434096, 0.3603555, 1, 1, 1, 1, 1,
-0.3005942, 0.8803573, -0.5047988, 1, 1, 1, 1, 1,
-0.2980975, 0.1120499, -1.280724, 1, 1, 1, 1, 1,
-0.2975902, -0.8825044, -2.086468, 1, 1, 1, 1, 1,
-0.2951013, 0.6639118, 1.332924, 1, 1, 1, 1, 1,
-0.2898797, 1.279848, -0.1320173, 0, 0, 1, 1, 1,
-0.2854475, 0.9154796, -0.5872473, 1, 0, 0, 1, 1,
-0.2839545, -0.2422495, -1.01187, 1, 0, 0, 1, 1,
-0.280367, 2.530428, -1.010921, 1, 0, 0, 1, 1,
-0.2795431, -0.4556311, -2.938914, 1, 0, 0, 1, 1,
-0.2790447, -0.4709811, -3.229353, 1, 0, 0, 1, 1,
-0.2782258, -1.24083, -3.74367, 0, 0, 0, 1, 1,
-0.2753407, 0.7182272, -0.3563012, 0, 0, 0, 1, 1,
-0.2723058, -0.2516157, -1.969331, 0, 0, 0, 1, 1,
-0.2702489, 0.5411236, -1.231442, 0, 0, 0, 1, 1,
-0.2646286, 1.135474, -1.175415, 0, 0, 0, 1, 1,
-0.2627762, 0.3352472, -1.461226, 0, 0, 0, 1, 1,
-0.2616319, 0.3259261, -0.7168581, 0, 0, 0, 1, 1,
-0.2552728, 1.832632, -0.5970678, 1, 1, 1, 1, 1,
-0.2515228, -0.8445627, -3.372777, 1, 1, 1, 1, 1,
-0.2502499, -0.267666, -1.785895, 1, 1, 1, 1, 1,
-0.2422137, 0.5514585, -0.07158817, 1, 1, 1, 1, 1,
-0.2391061, 0.04846303, -1.901666, 1, 1, 1, 1, 1,
-0.2389514, 0.4459779, -1.216811, 1, 1, 1, 1, 1,
-0.2318232, -0.3847016, -1.452702, 1, 1, 1, 1, 1,
-0.2312995, -0.8724324, -4.485762, 1, 1, 1, 1, 1,
-0.2301453, -1.234154, -2.106138, 1, 1, 1, 1, 1,
-0.2297678, 2.732978, 1.331915, 1, 1, 1, 1, 1,
-0.2278062, -0.9515141, -3.303963, 1, 1, 1, 1, 1,
-0.2269901, 0.6888472, 0.07399205, 1, 1, 1, 1, 1,
-0.2261722, 0.578375, -0.3076526, 1, 1, 1, 1, 1,
-0.2245263, 1.292746, -0.040422, 1, 1, 1, 1, 1,
-0.223614, -2.070251, -2.524068, 1, 1, 1, 1, 1,
-0.2218281, -1.310914, -4.110995, 0, 0, 1, 1, 1,
-0.2217305, 0.05814907, -3.031034, 1, 0, 0, 1, 1,
-0.2194212, -0.5565888, -3.820209, 1, 0, 0, 1, 1,
-0.2145462, -0.9352029, -3.354334, 1, 0, 0, 1, 1,
-0.2053545, -2.017155, -3.466595, 1, 0, 0, 1, 1,
-0.205317, 0.6480069, 0.9359509, 1, 0, 0, 1, 1,
-0.200966, 1.885155, 0.8597249, 0, 0, 0, 1, 1,
-0.1949468, -0.8272477, -2.818779, 0, 0, 0, 1, 1,
-0.192921, -0.3070373, -3.266598, 0, 0, 0, 1, 1,
-0.1925138, -0.2970469, -2.221993, 0, 0, 0, 1, 1,
-0.1872948, -0.2776954, -1.191303, 0, 0, 0, 1, 1,
-0.1804812, -0.5124946, -3.822453, 0, 0, 0, 1, 1,
-0.1795757, -0.258687, -3.391033, 0, 0, 0, 1, 1,
-0.1771918, 0.07484701, -1.922025, 1, 1, 1, 1, 1,
-0.1756987, -1.620922, -1.578587, 1, 1, 1, 1, 1,
-0.1735622, -0.7361145, -2.137869, 1, 1, 1, 1, 1,
-0.1724403, 0.330443, -2.171473, 1, 1, 1, 1, 1,
-0.1712328, -0.6369948, -4.130226, 1, 1, 1, 1, 1,
-0.1685986, 1.548972, -0.2309539, 1, 1, 1, 1, 1,
-0.1656913, -0.05282013, -1.822385, 1, 1, 1, 1, 1,
-0.1629417, 0.3281917, -1.881157, 1, 1, 1, 1, 1,
-0.1610442, 1.061759, -0.8055552, 1, 1, 1, 1, 1,
-0.1548069, 0.2608032, -2.392895, 1, 1, 1, 1, 1,
-0.1544639, 1.310094, 2.130768, 1, 1, 1, 1, 1,
-0.1534325, -0.8266373, -3.397866, 1, 1, 1, 1, 1,
-0.1487177, 0.5869924, -2.562608, 1, 1, 1, 1, 1,
-0.1485399, 1.591643, -0.2435339, 1, 1, 1, 1, 1,
-0.1482846, 0.03014615, -0.8720893, 1, 1, 1, 1, 1,
-0.1482735, 0.1947731, -0.0970028, 0, 0, 1, 1, 1,
-0.1425047, -0.9868727, -3.58873, 1, 0, 0, 1, 1,
-0.133546, -1.233766, -3.767869, 1, 0, 0, 1, 1,
-0.1316942, 1.758451, -1.521231, 1, 0, 0, 1, 1,
-0.1259627, -1.513055, -3.835638, 1, 0, 0, 1, 1,
-0.1249362, 2.429984, -0.9941313, 1, 0, 0, 1, 1,
-0.1244989, -0.09082382, -2.307671, 0, 0, 0, 1, 1,
-0.1242605, -0.06617948, -1.599409, 0, 0, 0, 1, 1,
-0.1224869, 0.6249785, -0.01998887, 0, 0, 0, 1, 1,
-0.1213875, -1.367609, -2.677427, 0, 0, 0, 1, 1,
-0.1212019, -0.2749667, -3.485357, 0, 0, 0, 1, 1,
-0.1172872, 0.8517958, -2.133768, 0, 0, 0, 1, 1,
-0.1141804, -0.032733, -0.8811622, 0, 0, 0, 1, 1,
-0.1135881, 0.01938155, -1.262431, 1, 1, 1, 1, 1,
-0.1105607, 1.092068, -0.8082014, 1, 1, 1, 1, 1,
-0.1104569, -0.5123349, -5.85184, 1, 1, 1, 1, 1,
-0.110143, 0.3565648, -1.573331, 1, 1, 1, 1, 1,
-0.1089539, -2.475227, -2.699122, 1, 1, 1, 1, 1,
-0.106494, 1.486196, -0.6376773, 1, 1, 1, 1, 1,
-0.1048495, 1.463557, -1.228699, 1, 1, 1, 1, 1,
-0.1045215, 0.4750231, 0.1290919, 1, 1, 1, 1, 1,
-0.1020464, -0.4760883, -2.025707, 1, 1, 1, 1, 1,
-0.1014853, 1.664539, -1.133259, 1, 1, 1, 1, 1,
-0.1009104, -2.447172, -3.479942, 1, 1, 1, 1, 1,
-0.09908204, -1.109555, -2.820178, 1, 1, 1, 1, 1,
-0.09895204, -0.6175336, -2.387361, 1, 1, 1, 1, 1,
-0.09880601, 1.12155, -1.074223, 1, 1, 1, 1, 1,
-0.09816614, 1.655489, -1.584939, 1, 1, 1, 1, 1,
-0.09641203, 0.08450522, -0.6079906, 0, 0, 1, 1, 1,
-0.09620411, 0.6939079, 1.691323, 1, 0, 0, 1, 1,
-0.09550384, -0.2648403, -2.84995, 1, 0, 0, 1, 1,
-0.09356101, 1.355143, -0.8166963, 1, 0, 0, 1, 1,
-0.09259798, -0.2535914, -2.145188, 1, 0, 0, 1, 1,
-0.09007519, 0.3579475, 1.569997, 1, 0, 0, 1, 1,
-0.08679105, 0.1292125, -0.5938548, 0, 0, 0, 1, 1,
-0.08102883, -1.01517, -3.28229, 0, 0, 0, 1, 1,
-0.07914547, -0.2523777, -3.633608, 0, 0, 0, 1, 1,
-0.07626371, -2.09416, -2.102172, 0, 0, 0, 1, 1,
-0.07191908, -1.092067, -0.5382348, 0, 0, 0, 1, 1,
-0.05697769, -1.060221, -2.919687, 0, 0, 0, 1, 1,
-0.05439916, 2.037326, -0.5228666, 0, 0, 0, 1, 1,
-0.05288842, 0.3622161, 2.71508, 1, 1, 1, 1, 1,
-0.04963574, -0.5279159, -3.752883, 1, 1, 1, 1, 1,
-0.04929066, -0.2487875, -3.717984, 1, 1, 1, 1, 1,
-0.04679365, 1.419686, -1.486188, 1, 1, 1, 1, 1,
-0.04468456, -0.6610219, -4.064798, 1, 1, 1, 1, 1,
-0.04279051, -1.686541, -1.865615, 1, 1, 1, 1, 1,
-0.03315409, 1.191774, 0.06368177, 1, 1, 1, 1, 1,
-0.02560402, -0.9264826, -1.292608, 1, 1, 1, 1, 1,
-0.0223977, -1.792294, -5.167527, 1, 1, 1, 1, 1,
-0.01408096, 0.5945816, 0.0592608, 1, 1, 1, 1, 1,
-0.01248355, -0.4087731, -3.672065, 1, 1, 1, 1, 1,
-0.0121823, 0.08517619, -1.978929, 1, 1, 1, 1, 1,
-0.008101295, -2.074297, -4.130555, 1, 1, 1, 1, 1,
-0.007058064, 0.8200413, -0.7372222, 1, 1, 1, 1, 1,
-0.004513262, 0.05770338, -0.445806, 1, 1, 1, 1, 1,
-0.004354571, 1.173363, 0.649411, 0, 0, 1, 1, 1,
-0.003983601, -0.3020985, -1.845113, 1, 0, 0, 1, 1,
-0.002952769, -0.1514818, -4.043228, 1, 0, 0, 1, 1,
0.003038215, -1.392733, 2.432207, 1, 0, 0, 1, 1,
0.004058156, 0.4228866, -0.3731005, 1, 0, 0, 1, 1,
0.008951198, 0.1299578, 0.3484007, 1, 0, 0, 1, 1,
0.01534044, -0.9847302, 1.917722, 0, 0, 0, 1, 1,
0.01978996, -1.018582, 1.897497, 0, 0, 0, 1, 1,
0.02004921, 0.5364373, 1.486353, 0, 0, 0, 1, 1,
0.02205647, 0.4768098, 2.146691, 0, 0, 0, 1, 1,
0.02464268, 0.7160411, 0.07910308, 0, 0, 0, 1, 1,
0.02663972, 0.7274271, -1.529243, 0, 0, 0, 1, 1,
0.02832861, 1.763791, 2.378205, 0, 0, 0, 1, 1,
0.03689757, -0.4718643, 2.921563, 1, 1, 1, 1, 1,
0.04012933, 2.339964, -0.03872189, 1, 1, 1, 1, 1,
0.04053233, 0.7330415, -1.699083, 1, 1, 1, 1, 1,
0.04129363, 0.1500223, -0.001119926, 1, 1, 1, 1, 1,
0.04538727, 0.06583807, 1.385965, 1, 1, 1, 1, 1,
0.04702326, 1.543709, -2.03751, 1, 1, 1, 1, 1,
0.04728673, 1.275586, -1.035632, 1, 1, 1, 1, 1,
0.04745327, 0.104733, 0.5017044, 1, 1, 1, 1, 1,
0.04996956, -1.093248, 4.015657, 1, 1, 1, 1, 1,
0.05634822, 0.3125842, -1.14346, 1, 1, 1, 1, 1,
0.06075791, -0.5060883, 3.12343, 1, 1, 1, 1, 1,
0.06085445, -0.1089548, 3.513062, 1, 1, 1, 1, 1,
0.06900075, 0.04818907, 1.33173, 1, 1, 1, 1, 1,
0.07621852, -0.1718115, 2.87175, 1, 1, 1, 1, 1,
0.07962131, -1.55176, 2.993918, 1, 1, 1, 1, 1,
0.08009231, -0.6155503, 4.385077, 0, 0, 1, 1, 1,
0.08616976, -1.048734, 4.175795, 1, 0, 0, 1, 1,
0.08794113, -0.7673098, 2.778414, 1, 0, 0, 1, 1,
0.08840406, 0.4798579, 0.0929669, 1, 0, 0, 1, 1,
0.09487995, -0.1928999, 3.542169, 1, 0, 0, 1, 1,
0.09989709, -0.250517, 3.38316, 1, 0, 0, 1, 1,
0.1013619, -0.9911293, 4.774476, 0, 0, 0, 1, 1,
0.1021157, -0.2921993, 1.081709, 0, 0, 0, 1, 1,
0.1036933, 0.6846754, -0.1055436, 0, 0, 0, 1, 1,
0.1139429, -0.3013926, 5.053552, 0, 0, 0, 1, 1,
0.114836, -0.5805286, 3.287185, 0, 0, 0, 1, 1,
0.1220658, -0.3469411, 2.172513, 0, 0, 0, 1, 1,
0.1229525, -0.8638378, 2.967479, 0, 0, 0, 1, 1,
0.1229639, -2.070977, 4.645613, 1, 1, 1, 1, 1,
0.123023, -0.6035669, 2.756329, 1, 1, 1, 1, 1,
0.1288655, 1.557864, 0.2417903, 1, 1, 1, 1, 1,
0.1301655, -0.3039415, 3.701647, 1, 1, 1, 1, 1,
0.1311599, 2.455218e-05, 1.236897, 1, 1, 1, 1, 1,
0.1415406, -0.5164027, 3.34594, 1, 1, 1, 1, 1,
0.1485087, -0.2995505, 1.905781, 1, 1, 1, 1, 1,
0.1550355, 0.4207407, -1.563488, 1, 1, 1, 1, 1,
0.1553387, -0.2767907, 1.657488, 1, 1, 1, 1, 1,
0.158117, 0.6408934, -0.5753576, 1, 1, 1, 1, 1,
0.1604362, -0.09286159, 4.528022, 1, 1, 1, 1, 1,
0.1607593, 0.01673763, 1.168632, 1, 1, 1, 1, 1,
0.1614986, 0.4169879, -1.957364, 1, 1, 1, 1, 1,
0.1619193, 0.2938844, 1.221586, 1, 1, 1, 1, 1,
0.1652278, 0.1167498, 1.421318, 1, 1, 1, 1, 1,
0.1714405, -0.01122886, 2.355247, 0, 0, 1, 1, 1,
0.1739411, 0.4416128, 1.817873, 1, 0, 0, 1, 1,
0.1777156, -2.167747, 1.860623, 1, 0, 0, 1, 1,
0.1817891, 0.7417848, 0.09077521, 1, 0, 0, 1, 1,
0.1827429, -1.236503, 4.637922, 1, 0, 0, 1, 1,
0.1829346, 1.042564, 0.2243383, 1, 0, 0, 1, 1,
0.1831113, 0.06743845, 1.217813, 0, 0, 0, 1, 1,
0.1876307, 0.5545738, -0.02155628, 0, 0, 0, 1, 1,
0.1882361, 0.001132762, 0.8049091, 0, 0, 0, 1, 1,
0.1917619, 0.908564, -0.4944046, 0, 0, 0, 1, 1,
0.2012392, -1.255846, 3.250476, 0, 0, 0, 1, 1,
0.2041941, 1.020663, -1.825695, 0, 0, 0, 1, 1,
0.2080839, 0.1770642, 0.9388058, 0, 0, 0, 1, 1,
0.210139, 0.2171965, 1.703291, 1, 1, 1, 1, 1,
0.2106813, 0.926616, -0.8320349, 1, 1, 1, 1, 1,
0.2116574, 0.7251201, 0.4236127, 1, 1, 1, 1, 1,
0.2125883, 1.281692, -1.02038, 1, 1, 1, 1, 1,
0.21369, 1.689211, 0.06729296, 1, 1, 1, 1, 1,
0.2156198, 0.5237769, -0.1984413, 1, 1, 1, 1, 1,
0.2240224, 1.310082, 0.1785963, 1, 1, 1, 1, 1,
0.2249844, -0.3306774, 1.00679, 1, 1, 1, 1, 1,
0.2265295, 1.949891, 0.07459959, 1, 1, 1, 1, 1,
0.2288736, 0.3849912, 0.6992319, 1, 1, 1, 1, 1,
0.2302514, -0.8645612, 4.508726, 1, 1, 1, 1, 1,
0.2325622, -2.87274, 2.621677, 1, 1, 1, 1, 1,
0.2352604, -2.08039, 3.024056, 1, 1, 1, 1, 1,
0.2383524, 0.1386438, 0.2577572, 1, 1, 1, 1, 1,
0.2413401, 0.5940403, 0.6156116, 1, 1, 1, 1, 1,
0.2432011, 2.14094, -0.9423046, 0, 0, 1, 1, 1,
0.2432182, -0.239902, 2.882873, 1, 0, 0, 1, 1,
0.2434441, -0.7232411, 3.560037, 1, 0, 0, 1, 1,
0.2436232, -0.07394671, 1.335167, 1, 0, 0, 1, 1,
0.2457318, -0.3712557, 3.84103, 1, 0, 0, 1, 1,
0.2497415, -0.1523388, 2.055221, 1, 0, 0, 1, 1,
0.2527337, -0.7084553, 2.003365, 0, 0, 0, 1, 1,
0.2537989, 0.5109433, 0.7156163, 0, 0, 0, 1, 1,
0.2705944, 2.552613, -0.6524386, 0, 0, 0, 1, 1,
0.2754546, -1.024627, 2.81846, 0, 0, 0, 1, 1,
0.2779687, 2.22884, -0.7022619, 0, 0, 0, 1, 1,
0.279969, 0.6961133, -0.2736672, 0, 0, 0, 1, 1,
0.2806275, -0.6757106, 3.573333, 0, 0, 0, 1, 1,
0.2809816, 1.283274, 1.388889, 1, 1, 1, 1, 1,
0.2822549, -0.8063782, 2.826645, 1, 1, 1, 1, 1,
0.2849459, 2.313164, -0.3626392, 1, 1, 1, 1, 1,
0.2853727, -1.282153, 1.771081, 1, 1, 1, 1, 1,
0.29538, -0.7400938, 2.259258, 1, 1, 1, 1, 1,
0.2964892, 1.81416, -0.03810506, 1, 1, 1, 1, 1,
0.2992882, 0.1726466, 1.806244, 1, 1, 1, 1, 1,
0.3035157, -1.024902, 3.826627, 1, 1, 1, 1, 1,
0.3035778, 1.282076, 0.1349025, 1, 1, 1, 1, 1,
0.3048578, -0.5006713, 2.971613, 1, 1, 1, 1, 1,
0.3068388, -0.8250959, 3.812655, 1, 1, 1, 1, 1,
0.3167985, 0.1801306, 1.413008, 1, 1, 1, 1, 1,
0.3190445, -0.2945808, -0.4316222, 1, 1, 1, 1, 1,
0.3198413, -1.1328, 2.708841, 1, 1, 1, 1, 1,
0.3249105, -1.074391, 1.746473, 1, 1, 1, 1, 1,
0.3253997, 0.482329, -0.3872692, 0, 0, 1, 1, 1,
0.3275025, 1.482145, 0.8499264, 1, 0, 0, 1, 1,
0.3310622, 0.7016096, 0.06793934, 1, 0, 0, 1, 1,
0.3321528, 0.9564756, 1.83929, 1, 0, 0, 1, 1,
0.3367667, 0.02103704, 2.393414, 1, 0, 0, 1, 1,
0.3431968, 0.03916644, 0.9687276, 1, 0, 0, 1, 1,
0.3447579, -1.74149, 1.888869, 0, 0, 0, 1, 1,
0.3453166, 1.014243, 0.5594161, 0, 0, 0, 1, 1,
0.3461929, -1.278532, 1.849263, 0, 0, 0, 1, 1,
0.3489407, 0.8468673, -0.6866189, 0, 0, 0, 1, 1,
0.3501223, -0.6898295, 1.576746, 0, 0, 0, 1, 1,
0.3559407, -0.2962767, 2.477624, 0, 0, 0, 1, 1,
0.3587939, -0.3929494, 2.000617, 0, 0, 0, 1, 1,
0.360781, 0.7040694, 0.5035043, 1, 1, 1, 1, 1,
0.3644193, 0.5924605, -0.2070263, 1, 1, 1, 1, 1,
0.3654775, 1.113984, 1.655158, 1, 1, 1, 1, 1,
0.3665965, -1.402434, 5.216116, 1, 1, 1, 1, 1,
0.3666918, 0.6607727, 0.1489375, 1, 1, 1, 1, 1,
0.3752878, 0.07886177, 2.746653, 1, 1, 1, 1, 1,
0.3765204, -1.465056, 2.796268, 1, 1, 1, 1, 1,
0.3775527, -1.44344, 0.7010179, 1, 1, 1, 1, 1,
0.3831481, -0.7899302, 0.13376, 1, 1, 1, 1, 1,
0.3845657, 0.2276481, 0.6596524, 1, 1, 1, 1, 1,
0.3846213, -1.573057, 3.422043, 1, 1, 1, 1, 1,
0.3856223, 1.668201, 0.3978472, 1, 1, 1, 1, 1,
0.3887263, -1.21964, 1.969875, 1, 1, 1, 1, 1,
0.3904339, -0.3516493, 2.561542, 1, 1, 1, 1, 1,
0.3921732, 1.304649, 0.6193288, 1, 1, 1, 1, 1,
0.3961144, -0.3805312, 3.347645, 0, 0, 1, 1, 1,
0.3969375, 1.393846, -0.4281186, 1, 0, 0, 1, 1,
0.403635, 0.2353782, 2.008469, 1, 0, 0, 1, 1,
0.4041297, -2.024135, 3.051738, 1, 0, 0, 1, 1,
0.4094507, 1.188807, -0.003962288, 1, 0, 0, 1, 1,
0.4098162, 0.3504015, 0.9282866, 1, 0, 0, 1, 1,
0.4102333, 0.6014499, 0.6849452, 0, 0, 0, 1, 1,
0.4110188, 0.8581115, 1.268058, 0, 0, 0, 1, 1,
0.4156622, -0.3658722, 2.273694, 0, 0, 0, 1, 1,
0.4169187, -0.2550144, 0.529265, 0, 0, 0, 1, 1,
0.4175247, 0.9030343, 1.493074, 0, 0, 0, 1, 1,
0.4248992, -0.3067629, 3.558586, 0, 0, 0, 1, 1,
0.4260674, -1.155661, 3.678073, 0, 0, 0, 1, 1,
0.4331274, -0.06933431, 1.388112, 1, 1, 1, 1, 1,
0.4395718, -0.0594015, 3.643132, 1, 1, 1, 1, 1,
0.4463777, 0.2184794, 0.9440748, 1, 1, 1, 1, 1,
0.4488571, -0.2472233, 2.562588, 1, 1, 1, 1, 1,
0.451697, -0.3430248, 2.711946, 1, 1, 1, 1, 1,
0.4582456, -0.2402363, 0.8656663, 1, 1, 1, 1, 1,
0.460523, -1.183229, 2.1811, 1, 1, 1, 1, 1,
0.460718, 0.1424313, 0.3872841, 1, 1, 1, 1, 1,
0.4688669, -1.27888, 2.548251, 1, 1, 1, 1, 1,
0.4725813, 1.599808, 1.41899, 1, 1, 1, 1, 1,
0.4732246, -0.7939525, 2.367961, 1, 1, 1, 1, 1,
0.476846, 1.190225, 2.021578, 1, 1, 1, 1, 1,
0.4774847, -0.3900798, 2.119034, 1, 1, 1, 1, 1,
0.4811185, -1.123885, 2.753901, 1, 1, 1, 1, 1,
0.4896904, -0.4677941, 2.898304, 1, 1, 1, 1, 1,
0.4957074, 0.4729419, 1.129392, 0, 0, 1, 1, 1,
0.5003717, 0.2257605, 1.23812, 1, 0, 0, 1, 1,
0.504123, 0.5114444, 0.9661431, 1, 0, 0, 1, 1,
0.5047963, 0.1156697, -0.4588619, 1, 0, 0, 1, 1,
0.5048165, -1.030267, 1.744025, 1, 0, 0, 1, 1,
0.5055963, 0.6349903, 1.220073, 1, 0, 0, 1, 1,
0.5119212, 1.913275, -1.490557, 0, 0, 0, 1, 1,
0.5143421, -0.5830963, 1.162252, 0, 0, 0, 1, 1,
0.5176015, -1.471702, 3.02682, 0, 0, 0, 1, 1,
0.5184303, -1.112529, 3.451533, 0, 0, 0, 1, 1,
0.5211035, 0.6332489, 2.195136, 0, 0, 0, 1, 1,
0.52377, 0.01406745, 1.19525, 0, 0, 0, 1, 1,
0.5239608, 1.589241, 0.4600226, 0, 0, 0, 1, 1,
0.5240377, -1.318236, 1.691806, 1, 1, 1, 1, 1,
0.5244557, -1.179239, 2.673091, 1, 1, 1, 1, 1,
0.5245636, -0.3685554, 2.360111, 1, 1, 1, 1, 1,
0.5269786, -0.5767137, 3.567677, 1, 1, 1, 1, 1,
0.5284294, -0.5674217, 1.274408, 1, 1, 1, 1, 1,
0.5323433, -3.175916, 2.910728, 1, 1, 1, 1, 1,
0.5372465, 0.9037508, -0.3775201, 1, 1, 1, 1, 1,
0.5394242, 0.5382091, 0.6912934, 1, 1, 1, 1, 1,
0.5409222, -0.9192726, 0.09435663, 1, 1, 1, 1, 1,
0.5428228, -1.103785, 2.493997, 1, 1, 1, 1, 1,
0.5436608, -0.2208172, 2.548187, 1, 1, 1, 1, 1,
0.5461258, 0.534802, 0.9331266, 1, 1, 1, 1, 1,
0.5465738, 0.5969317, 1.056009, 1, 1, 1, 1, 1,
0.5468021, 1.291293, 0.7975729, 1, 1, 1, 1, 1,
0.547495, 2.294145, 1.96696, 1, 1, 1, 1, 1,
0.5479656, -1.043966, 3.396818, 0, 0, 1, 1, 1,
0.5510308, 0.7576753, 1.611585, 1, 0, 0, 1, 1,
0.5580022, -0.8840545, 3.031644, 1, 0, 0, 1, 1,
0.5620237, 1.462727, 0.2541183, 1, 0, 0, 1, 1,
0.5621037, -1.201548, 4.048704, 1, 0, 0, 1, 1,
0.5622498, 0.1878926, 0.6800924, 1, 0, 0, 1, 1,
0.5659752, -0.08618294, 0.1649841, 0, 0, 0, 1, 1,
0.5723861, 1.248219, 0.5714983, 0, 0, 0, 1, 1,
0.5804179, 0.3181761, 0.8769442, 0, 0, 0, 1, 1,
0.584387, -1.749553, 2.05699, 0, 0, 0, 1, 1,
0.5863229, -0.8438477, 1.815735, 0, 0, 0, 1, 1,
0.5863332, -0.8834459, 2.78061, 0, 0, 0, 1, 1,
0.5915993, -0.1615082, 1.268509, 0, 0, 0, 1, 1,
0.5953578, 1.037725, 1.890794, 1, 1, 1, 1, 1,
0.5975511, -0.278076, 1.803238, 1, 1, 1, 1, 1,
0.5976993, -2.109152, 3.568651, 1, 1, 1, 1, 1,
0.5994337, -0.8833316, 3.038912, 1, 1, 1, 1, 1,
0.6012151, 1.173817, -2.359816, 1, 1, 1, 1, 1,
0.6077355, -1.43468, 2.268815, 1, 1, 1, 1, 1,
0.6100454, -1.081087, 1.340174, 1, 1, 1, 1, 1,
0.617179, -1.169188, 2.487117, 1, 1, 1, 1, 1,
0.6183754, -0.7444708, 1.75893, 1, 1, 1, 1, 1,
0.6198199, 0.2999755, 0.9681939, 1, 1, 1, 1, 1,
0.6263387, 1.072042, 1.975605, 1, 1, 1, 1, 1,
0.6290013, -0.7084367, 3.227643, 1, 1, 1, 1, 1,
0.6422213, -0.1802135, 2.469903, 1, 1, 1, 1, 1,
0.6502283, 0.2969168, 0.9281088, 1, 1, 1, 1, 1,
0.6585527, 0.2847334, 0.6218718, 1, 1, 1, 1, 1,
0.6603075, -0.6232007, 4.088992, 0, 0, 1, 1, 1,
0.6613737, 0.2348451, 1.69837, 1, 0, 0, 1, 1,
0.6620892, 0.9111563, 1.101382, 1, 0, 0, 1, 1,
0.6651011, 1.204293, 2.048471, 1, 0, 0, 1, 1,
0.6718698, 0.09387757, 0.942892, 1, 0, 0, 1, 1,
0.6756259, 0.297782, 2.122595, 1, 0, 0, 1, 1,
0.6773999, 0.4870244, 2.57718, 0, 0, 0, 1, 1,
0.6806601, 0.1749591, 1.350597, 0, 0, 0, 1, 1,
0.6906266, 1.413319, 0.3159468, 0, 0, 0, 1, 1,
0.6953772, -2.169041, 3.529432, 0, 0, 0, 1, 1,
0.7028829, -1.208874, 2.641815, 0, 0, 0, 1, 1,
0.7072666, -0.7842709, 2.28233, 0, 0, 0, 1, 1,
0.7108496, -0.1567311, -0.9153246, 0, 0, 0, 1, 1,
0.7134574, -0.5185145, 0.5868368, 1, 1, 1, 1, 1,
0.7136837, -0.0358603, 1.38596, 1, 1, 1, 1, 1,
0.7172114, -1.142813, 4.623432, 1, 1, 1, 1, 1,
0.722682, 0.3608085, 0.8896131, 1, 1, 1, 1, 1,
0.7228786, -0.8380136, 3.68376, 1, 1, 1, 1, 1,
0.724079, 0.3302867, 1.991923, 1, 1, 1, 1, 1,
0.7247912, -0.1358417, -0.1196251, 1, 1, 1, 1, 1,
0.7265449, 1.436547, -0.979148, 1, 1, 1, 1, 1,
0.7298532, 1.044025, 0.8205358, 1, 1, 1, 1, 1,
0.7299137, 1.831263, 0.05500003, 1, 1, 1, 1, 1,
0.7320725, -0.8922748, 2.875258, 1, 1, 1, 1, 1,
0.7330291, 0.2434398, 1.91392, 1, 1, 1, 1, 1,
0.7364596, 1.33775, -0.5215213, 1, 1, 1, 1, 1,
0.7388595, -1.611227, 3.958254, 1, 1, 1, 1, 1,
0.7407126, 1.563765, 0.3358729, 1, 1, 1, 1, 1,
0.7459876, -1.327521, 2.128728, 0, 0, 1, 1, 1,
0.7467995, -0.8459885, 3.370532, 1, 0, 0, 1, 1,
0.7500129, -1.344328, 4.0787, 1, 0, 0, 1, 1,
0.7535228, 0.04630151, 0.544248, 1, 0, 0, 1, 1,
0.7552022, -0.2346664, 2.382782, 1, 0, 0, 1, 1,
0.7559253, -2.98385, 3.027739, 1, 0, 0, 1, 1,
0.7584999, 0.9351373, 0.3717082, 0, 0, 0, 1, 1,
0.7615742, -1.114369, 2.470695, 0, 0, 0, 1, 1,
0.7664205, -2.334447, 3.340588, 0, 0, 0, 1, 1,
0.7699741, 0.5868893, -0.6867588, 0, 0, 0, 1, 1,
0.7742209, 0.7235635, 1.565735, 0, 0, 0, 1, 1,
0.7754067, -0.9448682, 2.083851, 0, 0, 0, 1, 1,
0.7779878, 1.200291, 0.2495963, 0, 0, 0, 1, 1,
0.7794296, 0.1331187, 0.4263103, 1, 1, 1, 1, 1,
0.7814817, -0.8509974, 3.554553, 1, 1, 1, 1, 1,
0.7826251, -1.7925, 2.058203, 1, 1, 1, 1, 1,
0.7837073, 0.7777251, 0.8865683, 1, 1, 1, 1, 1,
0.7844626, -0.2943576, 1.541135, 1, 1, 1, 1, 1,
0.7846649, -0.6387263, 2.322916, 1, 1, 1, 1, 1,
0.787056, -1.547255, 4.971692, 1, 1, 1, 1, 1,
0.7933024, 0.1911914, 0.5442289, 1, 1, 1, 1, 1,
0.7933803, -0.02796185, 3.0064, 1, 1, 1, 1, 1,
0.7958353, 0.5865349, 1.490435, 1, 1, 1, 1, 1,
0.800154, 1.0018, 0.9908337, 1, 1, 1, 1, 1,
0.8129215, -0.5569859, -0.2848582, 1, 1, 1, 1, 1,
0.8198366, 0.1329423, 2.433623, 1, 1, 1, 1, 1,
0.8246258, 0.2644765, 0.1303656, 1, 1, 1, 1, 1,
0.8341584, 0.3050524, 0.338033, 1, 1, 1, 1, 1,
0.8355138, -2.136183, 0.7692362, 0, 0, 1, 1, 1,
0.8360212, 1.39404, -0.6113914, 1, 0, 0, 1, 1,
0.8392477, -0.1780824, 4.668472, 1, 0, 0, 1, 1,
0.8410695, -0.6716204, 2.746713, 1, 0, 0, 1, 1,
0.8431785, -1.620928, 2.178517, 1, 0, 0, 1, 1,
0.8462497, 1.594765, 1.766519, 1, 0, 0, 1, 1,
0.846858, 0.2893531, 0.2851037, 0, 0, 0, 1, 1,
0.8469781, 0.3548381, 2.573871, 0, 0, 0, 1, 1,
0.8475157, -1.06567, 4.465769, 0, 0, 0, 1, 1,
0.8518976, -0.7327828, 2.06821, 0, 0, 0, 1, 1,
0.8530344, -0.5483136, 3.708332, 0, 0, 0, 1, 1,
0.8539121, -0.581935, 0.7355016, 0, 0, 0, 1, 1,
0.8558378, 0.940133, -0.608241, 0, 0, 0, 1, 1,
0.861737, 0.1565742, 0.3899148, 1, 1, 1, 1, 1,
0.8625553, -1.902832, 4.759005, 1, 1, 1, 1, 1,
0.8673171, 0.1002314, 0.0805975, 1, 1, 1, 1, 1,
0.8704294, -0.02130126, 1.067552, 1, 1, 1, 1, 1,
0.873072, 1.119662, 1.086253, 1, 1, 1, 1, 1,
0.8782967, 0.2103458, 2.198056, 1, 1, 1, 1, 1,
0.8840764, 1.538678, 0.001549822, 1, 1, 1, 1, 1,
0.8843715, 0.02688887, 1.551533, 1, 1, 1, 1, 1,
0.8855031, -2.817692, 3.949494, 1, 1, 1, 1, 1,
0.8860439, -0.4451905, 0.8107848, 1, 1, 1, 1, 1,
0.8892636, 1.210526, 1.483647, 1, 1, 1, 1, 1,
0.890296, 0.773937, 3.424695, 1, 1, 1, 1, 1,
0.8953959, -0.3607969, 1.614655, 1, 1, 1, 1, 1,
0.8973828, 1.315805, 0.139073, 1, 1, 1, 1, 1,
0.9004307, -1.553214, 1.919847, 1, 1, 1, 1, 1,
0.902476, 0.6150996, 0.6181066, 0, 0, 1, 1, 1,
0.9039526, -0.2623143, 2.74687, 1, 0, 0, 1, 1,
0.9046454, -2.42264, 2.649759, 1, 0, 0, 1, 1,
0.9081821, -1.285576, 2.097006, 1, 0, 0, 1, 1,
0.9172505, -0.8589652, 2.169542, 1, 0, 0, 1, 1,
0.9220707, 0.5386164, 0.4833382, 1, 0, 0, 1, 1,
0.9226118, 0.5681019, 1.677641, 0, 0, 0, 1, 1,
0.92365, -0.2730822, 1.767582, 0, 0, 0, 1, 1,
0.9248124, 0.01565091, 0.3022758, 0, 0, 0, 1, 1,
0.9249766, 0.8069935, 0.8486168, 0, 0, 0, 1, 1,
0.9268323, 0.7628415, -0.7426657, 0, 0, 0, 1, 1,
0.9421142, -1.764541, 2.756889, 0, 0, 0, 1, 1,
0.9435955, 0.5878746, 0.2325482, 0, 0, 0, 1, 1,
0.9458844, -1.442053, 2.438663, 1, 1, 1, 1, 1,
0.9472805, 0.2559444, 0.2002675, 1, 1, 1, 1, 1,
0.9502194, -0.7820451, 2.052124, 1, 1, 1, 1, 1,
0.9558139, 0.4559857, 1.891153, 1, 1, 1, 1, 1,
0.9559816, -0.3524039, 2.922494, 1, 1, 1, 1, 1,
0.9579245, -0.4292057, 3.135692, 1, 1, 1, 1, 1,
0.960181, 0.08846415, 3.32256, 1, 1, 1, 1, 1,
0.9613013, -0.2338937, 2.016491, 1, 1, 1, 1, 1,
0.9620382, 1.64341, 0.2588574, 1, 1, 1, 1, 1,
0.9639304, -0.0777102, -0.2460913, 1, 1, 1, 1, 1,
0.968342, -2.658982, 3.470109, 1, 1, 1, 1, 1,
0.9811471, 0.7114483, 1.761016, 1, 1, 1, 1, 1,
0.9844679, -0.8875784, 1.325185, 1, 1, 1, 1, 1,
0.9870359, -0.1632566, 2.669277, 1, 1, 1, 1, 1,
0.9927562, 0.0397925, -0.2408313, 1, 1, 1, 1, 1,
1.00558, -0.2312149, 2.889866, 0, 0, 1, 1, 1,
1.008977, 2.056029, -0.609342, 1, 0, 0, 1, 1,
1.016879, -0.1198528, 0.5159798, 1, 0, 0, 1, 1,
1.020436, -0.3746775, 3.110588, 1, 0, 0, 1, 1,
1.042953, -1.4278, 1.347743, 1, 0, 0, 1, 1,
1.044366, -0.02745504, 1.377226, 1, 0, 0, 1, 1,
1.046137, -1.288974, 2.652099, 0, 0, 0, 1, 1,
1.047077, 3.331313, 1.219975, 0, 0, 0, 1, 1,
1.050729, 0.6646537, -0.2309068, 0, 0, 0, 1, 1,
1.054977, -0.6036847, 1.907032, 0, 0, 0, 1, 1,
1.060001, 1.337853, 1.955086, 0, 0, 0, 1, 1,
1.070965, 0.0186698, 1.716877, 0, 0, 0, 1, 1,
1.071561, 0.3847459, 1.261723, 0, 0, 0, 1, 1,
1.074933, -0.1140252, 2.966684, 1, 1, 1, 1, 1,
1.077152, 0.1461549, 2.963671, 1, 1, 1, 1, 1,
1.080233, 0.03412589, 2.348577, 1, 1, 1, 1, 1,
1.083171, 0.2783078, 2.60534, 1, 1, 1, 1, 1,
1.086249, 3.67505, -0.7478639, 1, 1, 1, 1, 1,
1.087972, 0.4772869, 0.9751289, 1, 1, 1, 1, 1,
1.088185, -0.4360632, 2.858472, 1, 1, 1, 1, 1,
1.091068, -1.287075, 3.630392, 1, 1, 1, 1, 1,
1.09298, -0.9766876, 3.001851, 1, 1, 1, 1, 1,
1.097379, 0.4737814, 2.620594, 1, 1, 1, 1, 1,
1.101325, -0.8204805, 4.227804, 1, 1, 1, 1, 1,
1.115577, -0.5203408, 1.540595, 1, 1, 1, 1, 1,
1.116014, 0.06616873, 3.180506, 1, 1, 1, 1, 1,
1.118146, -0.9225439, 3.002822, 1, 1, 1, 1, 1,
1.125314, -0.7650838, 2.17672, 1, 1, 1, 1, 1,
1.128158, -0.9383178, 3.594364, 0, 0, 1, 1, 1,
1.129552, 0.4185699, 1.057388, 1, 0, 0, 1, 1,
1.131144, -1.013992, 0.2494999, 1, 0, 0, 1, 1,
1.148302, 0.7915848, 0.7916456, 1, 0, 0, 1, 1,
1.156963, -1.094216, 1.732369, 1, 0, 0, 1, 1,
1.158594, -1.620295, 4.076891, 1, 0, 0, 1, 1,
1.168559, -1.79847, 0.3857638, 0, 0, 0, 1, 1,
1.169827, 0.2483207, 2.139979, 0, 0, 0, 1, 1,
1.19114, 0.3371536, 2.854713, 0, 0, 0, 1, 1,
1.191516, 1.303651, 0.2208847, 0, 0, 0, 1, 1,
1.197175, 0.2139681, 0.5223213, 0, 0, 0, 1, 1,
1.197966, -0.2807374, 1.588609, 0, 0, 0, 1, 1,
1.204055, -0.6706882, 1.342988, 0, 0, 0, 1, 1,
1.206591, 0.5555295, 1.58276, 1, 1, 1, 1, 1,
1.211642, -1.960092, 4.547091, 1, 1, 1, 1, 1,
1.214632, -0.5610242, 0.7261245, 1, 1, 1, 1, 1,
1.224339, 0.9182761, 0.3233358, 1, 1, 1, 1, 1,
1.237565, -0.3682265, -0.1493032, 1, 1, 1, 1, 1,
1.238548, 0.7221247, -0.4159782, 1, 1, 1, 1, 1,
1.238834, 0.1241455, 1.170249, 1, 1, 1, 1, 1,
1.245267, -0.2398992, 2.236509, 1, 1, 1, 1, 1,
1.246837, 0.8060678, 1.72699, 1, 1, 1, 1, 1,
1.256788, 0.7206107, 0.8430686, 1, 1, 1, 1, 1,
1.275683, -0.3084972, 2.550631, 1, 1, 1, 1, 1,
1.278207, 0.7527794, 0.3710053, 1, 1, 1, 1, 1,
1.285754, -0.03988558, 0.6099243, 1, 1, 1, 1, 1,
1.288146, -0.2194316, 1.898266, 1, 1, 1, 1, 1,
1.301833, -1.354384, 4.606353, 1, 1, 1, 1, 1,
1.303282, -0.6206334, 1.826359, 0, 0, 1, 1, 1,
1.305184, 1.15804, 0.7030832, 1, 0, 0, 1, 1,
1.311308, -0.941299, 1.284329, 1, 0, 0, 1, 1,
1.314096, 0.1195426, 0.9876035, 1, 0, 0, 1, 1,
1.315121, -0.1311612, -0.7041624, 1, 0, 0, 1, 1,
1.315188, -0.7924107, 2.398561, 1, 0, 0, 1, 1,
1.330378, -0.8981918, 1.085761, 0, 0, 0, 1, 1,
1.332072, -0.02401619, 1.932997, 0, 0, 0, 1, 1,
1.332676, 0.7473499, -0.09232686, 0, 0, 0, 1, 1,
1.344977, -0.9227253, 3.152313, 0, 0, 0, 1, 1,
1.35288, -0.268093, 1.589876, 0, 0, 0, 1, 1,
1.355258, -0.4241786, 1.006198, 0, 0, 0, 1, 1,
1.362139, -1.318823, 2.402164, 0, 0, 0, 1, 1,
1.362192, -0.1207536, 1.233911, 1, 1, 1, 1, 1,
1.365231, 0.6663704, -0.004023794, 1, 1, 1, 1, 1,
1.384796, 0.2842651, 0.05849864, 1, 1, 1, 1, 1,
1.3868, -0.08295078, 2.436604, 1, 1, 1, 1, 1,
1.388498, 0.6170429, 1.521339, 1, 1, 1, 1, 1,
1.405883, -1.590066, 1.094082, 1, 1, 1, 1, 1,
1.407085, 0.2334088, 2.486997, 1, 1, 1, 1, 1,
1.407468, -1.812464, 2.177594, 1, 1, 1, 1, 1,
1.410817, 0.6562823, 0.4655135, 1, 1, 1, 1, 1,
1.416208, -0.4247479, 2.589424, 1, 1, 1, 1, 1,
1.416412, -0.7201384, 1.629013, 1, 1, 1, 1, 1,
1.423664, 0.2536114, 1.164773, 1, 1, 1, 1, 1,
1.431144, 0.01650175, 1.35947, 1, 1, 1, 1, 1,
1.437913, -1.13738, 3.592254, 1, 1, 1, 1, 1,
1.443384, 0.2958283, 1.067582, 1, 1, 1, 1, 1,
1.453487, -0.2496776, -0.2167699, 0, 0, 1, 1, 1,
1.45797, 1.486873, -1.639482, 1, 0, 0, 1, 1,
1.458352, -0.593547, 0.9732078, 1, 0, 0, 1, 1,
1.460113, -1.269195, 2.890167, 1, 0, 0, 1, 1,
1.460119, -2.167068, 1.314138, 1, 0, 0, 1, 1,
1.466579, -2.092379, 1.123332, 1, 0, 0, 1, 1,
1.477816, 0.4898857, 2.528156, 0, 0, 0, 1, 1,
1.479512, -1.010255, 3.037235, 0, 0, 0, 1, 1,
1.479723, -1.017101, 2.514057, 0, 0, 0, 1, 1,
1.483333, -1.126201, 2.517712, 0, 0, 0, 1, 1,
1.494515, -0.5219681, 0.4373471, 0, 0, 0, 1, 1,
1.494956, 1.015448, -0.6765047, 0, 0, 0, 1, 1,
1.497244, 2.344659, -0.415953, 0, 0, 0, 1, 1,
1.510567, -1.43003, 2.73246, 1, 1, 1, 1, 1,
1.543509, 2.084867, 1.209823, 1, 1, 1, 1, 1,
1.566461, -1.317735, 1.891066, 1, 1, 1, 1, 1,
1.585347, 0.6551331, 3.984237, 1, 1, 1, 1, 1,
1.587085, 0.02721303, 2.160573, 1, 1, 1, 1, 1,
1.588764, 0.940396, 1.301969, 1, 1, 1, 1, 1,
1.598772, -0.5730615, 0.1036511, 1, 1, 1, 1, 1,
1.60883, 1.057153, 1.095059, 1, 1, 1, 1, 1,
1.613959, -1.131925, 2.229767, 1, 1, 1, 1, 1,
1.629755, 0.02800614, 0.4464937, 1, 1, 1, 1, 1,
1.633428, 0.3578846, 0.7967407, 1, 1, 1, 1, 1,
1.637301, 0.7944171, 2.273065, 1, 1, 1, 1, 1,
1.639843, 0.3648494, 1.082037, 1, 1, 1, 1, 1,
1.666689, -0.1440565, 1.880006, 1, 1, 1, 1, 1,
1.668324, -2.735852, 2.59426, 1, 1, 1, 1, 1,
1.68347, 0.6580883, 0.8552335, 0, 0, 1, 1, 1,
1.685379, 1.795308, 1.573042, 1, 0, 0, 1, 1,
1.687431, -1.215645, 1.184556, 1, 0, 0, 1, 1,
1.694947, -1.432208, 1.005108, 1, 0, 0, 1, 1,
1.69694, -1.030826, 2.573116, 1, 0, 0, 1, 1,
1.73492, 0.828046, 0.03735368, 1, 0, 0, 1, 1,
1.743163, 2.114759, 0.08643635, 0, 0, 0, 1, 1,
1.744761, 1.406588, 0.8712761, 0, 0, 0, 1, 1,
1.755814, 0.7754344, 2.3462, 0, 0, 0, 1, 1,
1.764992, -0.3248886, 0.05957161, 0, 0, 0, 1, 1,
1.774665, -0.3020321, 1.27821, 0, 0, 0, 1, 1,
1.782604, 1.151716, 0.2458816, 0, 0, 0, 1, 1,
1.784741, -0.6013358, 1.000974, 0, 0, 0, 1, 1,
1.795137, 0.7390498, 0.9836786, 1, 1, 1, 1, 1,
1.807115, 1.90198, 0.9539073, 1, 1, 1, 1, 1,
1.827662, 1.016458, 1.066141, 1, 1, 1, 1, 1,
1.868647, -0.8585188, 2.703078, 1, 1, 1, 1, 1,
1.877501, -1.640211, 1.505646, 1, 1, 1, 1, 1,
1.923288, -0.9143155, 2.933197, 1, 1, 1, 1, 1,
1.928025, 0.1096055, 1.377256, 1, 1, 1, 1, 1,
1.950498, -1.208642, 2.234679, 1, 1, 1, 1, 1,
1.954755, 0.6312234, 1.549271, 1, 1, 1, 1, 1,
1.95522, -0.1066874, 0.1583391, 1, 1, 1, 1, 1,
1.958779, 0.7340891, -0.1996469, 1, 1, 1, 1, 1,
1.989557, 1.32829, 0.123678, 1, 1, 1, 1, 1,
2.039227, 0.4174601, 1.803502, 1, 1, 1, 1, 1,
2.039376, -0.7274863, 0.9575371, 1, 1, 1, 1, 1,
2.040642, -2.393015, 2.315507, 1, 1, 1, 1, 1,
2.050759, -0.0967469, 3.708083, 0, 0, 1, 1, 1,
2.160171, 1.253068, 0.3055138, 1, 0, 0, 1, 1,
2.219822, -0.2773479, 3.939156, 1, 0, 0, 1, 1,
2.226333, -0.6311439, 1.800104, 1, 0, 0, 1, 1,
2.226558, 0.761371, 1.587012, 1, 0, 0, 1, 1,
2.232739, -0.1183698, 0.5230937, 1, 0, 0, 1, 1,
2.234628, -0.2598903, 1.659906, 0, 0, 0, 1, 1,
2.240996, 0.3689499, 1.718957, 0, 0, 0, 1, 1,
2.28213, -0.3033694, 1.49335, 0, 0, 0, 1, 1,
2.320002, 0.7580928, 1.591657, 0, 0, 0, 1, 1,
2.335818, -0.2864066, 2.275162, 0, 0, 0, 1, 1,
2.356123, 1.232156, 1.309748, 0, 0, 0, 1, 1,
2.371531, 0.5611108, 0.4201259, 0, 0, 0, 1, 1,
2.43672, -0.06354696, 3.829999, 1, 1, 1, 1, 1,
2.517823, -0.7784356, 2.668851, 1, 1, 1, 1, 1,
2.546338, -0.2686827, 4.226404, 1, 1, 1, 1, 1,
2.776268, 0.3578541, 0.3418544, 1, 1, 1, 1, 1,
2.837817, 0.7930837, 1.393325, 1, 1, 1, 1, 1,
3.253403, -1.66818, 3.55813, 1, 1, 1, 1, 1,
4.67329, -1.310572, 1.52606, 1, 1, 1, 1, 1
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
var radius = 10.39495;
var distance = 36.51183;
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
mvMatrix.translate( -0.5248172, -0.3076143, 0.3178618 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.51183);
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