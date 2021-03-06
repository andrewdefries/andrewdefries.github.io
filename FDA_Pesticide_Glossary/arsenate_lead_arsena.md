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
-3.164712, 1.710388, -1.070689, 1, 0, 0, 1,
-3.099388, 0.4428247, -0.8964333, 1, 0.007843138, 0, 1,
-2.80115, 0.1704149, -2.256166, 1, 0.01176471, 0, 1,
-2.801028, -0.3428904, -1.642921, 1, 0.01960784, 0, 1,
-2.762215, 0.351679, -1.27332, 1, 0.02352941, 0, 1,
-2.547817, -0.2826982, -1.780134, 1, 0.03137255, 0, 1,
-2.519187, -0.1279149, -1.351174, 1, 0.03529412, 0, 1,
-2.473452, -0.664583, -3.624332, 1, 0.04313726, 0, 1,
-2.458065, -0.8456773, -3.80684, 1, 0.04705882, 0, 1,
-2.444944, -1.947847, -1.086707, 1, 0.05490196, 0, 1,
-2.344175, -1.370954, -1.845361, 1, 0.05882353, 0, 1,
-2.288789, -1.428568, -0.5533149, 1, 0.06666667, 0, 1,
-2.269222, 0.1339832, -0.825689, 1, 0.07058824, 0, 1,
-2.176176, 0.4717782, -2.627702, 1, 0.07843138, 0, 1,
-2.123061, 0.9188336, -1.195446, 1, 0.08235294, 0, 1,
-2.117718, 2.414562, -0.8953458, 1, 0.09019608, 0, 1,
-2.093129, -0.02509256, -1.854874, 1, 0.09411765, 0, 1,
-2.092334, 0.688507, -0.3495157, 1, 0.1019608, 0, 1,
-2.072048, 3.44792, 0.07371525, 1, 0.1098039, 0, 1,
-2.017227, -0.1581201, -2.379289, 1, 0.1137255, 0, 1,
-1.995359, 1.36105, -1.009259, 1, 0.1215686, 0, 1,
-1.982355, -1.336781, -1.374923, 1, 0.1254902, 0, 1,
-1.976352, 0.2592667, -0.6114848, 1, 0.1333333, 0, 1,
-1.913828, -1.62955, -2.057516, 1, 0.1372549, 0, 1,
-1.905158, 1.63729, -1.032079, 1, 0.145098, 0, 1,
-1.905026, 0.2694946, -3.060727, 1, 0.1490196, 0, 1,
-1.898928, 1.60453, -0.3701473, 1, 0.1568628, 0, 1,
-1.890543, -0.1451982, -2.05946, 1, 0.1607843, 0, 1,
-1.888632, 0.2161207, -3.374964, 1, 0.1686275, 0, 1,
-1.88623, -0.3776727, -3.106376, 1, 0.172549, 0, 1,
-1.866742, -0.3413265, -0.7693959, 1, 0.1803922, 0, 1,
-1.831601, -0.8169782, -4.578825, 1, 0.1843137, 0, 1,
-1.82224, -0.3206211, -1.609005, 1, 0.1921569, 0, 1,
-1.788623, -0.4130142, -2.006009, 1, 0.1960784, 0, 1,
-1.785981, 1.659687, -0.8828727, 1, 0.2039216, 0, 1,
-1.780693, 0.9698743, -1.808688, 1, 0.2117647, 0, 1,
-1.751075, -0.4525118, -2.453876, 1, 0.2156863, 0, 1,
-1.742975, 1.358964, -1.849023, 1, 0.2235294, 0, 1,
-1.740819, -0.9116402, -1.38311, 1, 0.227451, 0, 1,
-1.739294, -0.5154901, -0.2060301, 1, 0.2352941, 0, 1,
-1.72912, 0.3284472, -1.147421, 1, 0.2392157, 0, 1,
-1.722666, 1.208205, -2.708391, 1, 0.2470588, 0, 1,
-1.718091, 1.113927, -0.5206245, 1, 0.2509804, 0, 1,
-1.714289, 1.254525, -0.6751618, 1, 0.2588235, 0, 1,
-1.713313, -1.207883, -3.436264, 1, 0.2627451, 0, 1,
-1.699685, -1.421028, -3.161075, 1, 0.2705882, 0, 1,
-1.676817, -1.283285, -1.202743, 1, 0.2745098, 0, 1,
-1.645752, 2.11427, -2.625957, 1, 0.282353, 0, 1,
-1.642506, 0.6277849, -1.502896, 1, 0.2862745, 0, 1,
-1.638714, 1.731216, -0.5117567, 1, 0.2941177, 0, 1,
-1.638612, 1.458017, -1.79081, 1, 0.3019608, 0, 1,
-1.636824, 0.7439966, -0.7938775, 1, 0.3058824, 0, 1,
-1.635726, -0.101349, -2.86066, 1, 0.3137255, 0, 1,
-1.630417, -0.1014791, -2.624356, 1, 0.3176471, 0, 1,
-1.628502, 0.09994566, -1.536634, 1, 0.3254902, 0, 1,
-1.621137, -1.321805, -4.766067, 1, 0.3294118, 0, 1,
-1.614503, -1.184636, -2.299801, 1, 0.3372549, 0, 1,
-1.611487, 0.4056107, -0.1729504, 1, 0.3411765, 0, 1,
-1.608514, 0.4572216, -0.05398591, 1, 0.3490196, 0, 1,
-1.596339, 0.5968531, 0.5397225, 1, 0.3529412, 0, 1,
-1.578375, -0.9542192, -0.7628325, 1, 0.3607843, 0, 1,
-1.578221, 1.201708, -0.3270117, 1, 0.3647059, 0, 1,
-1.576984, -1.066085, -1.513744, 1, 0.372549, 0, 1,
-1.555172, 2.309796, -2.351573, 1, 0.3764706, 0, 1,
-1.553451, 1.234198, 0.8447374, 1, 0.3843137, 0, 1,
-1.543232, -1.689186, -2.035369, 1, 0.3882353, 0, 1,
-1.541115, -0.2044837, -1.769011, 1, 0.3960784, 0, 1,
-1.53976, -1.613952, -3.486143, 1, 0.4039216, 0, 1,
-1.534265, 1.573677, -1.995801, 1, 0.4078431, 0, 1,
-1.531809, -0.678958, -1.770234, 1, 0.4156863, 0, 1,
-1.506387, -0.2423937, -1.288947, 1, 0.4196078, 0, 1,
-1.495377, -0.00387604, -2.967749, 1, 0.427451, 0, 1,
-1.484933, -0.5704353, -1.849877, 1, 0.4313726, 0, 1,
-1.47498, 1.396767, -1.514658, 1, 0.4392157, 0, 1,
-1.466097, 0.7580653, 0.08860148, 1, 0.4431373, 0, 1,
-1.463704, 0.1173438, -1.582504, 1, 0.4509804, 0, 1,
-1.45347, -0.05511127, -0.04604069, 1, 0.454902, 0, 1,
-1.446242, -0.9547205, -3.426187, 1, 0.4627451, 0, 1,
-1.445685, -1.611285, -3.364431, 1, 0.4666667, 0, 1,
-1.430246, -1.003103, -2.081323, 1, 0.4745098, 0, 1,
-1.418519, 0.8853166, -0.3887689, 1, 0.4784314, 0, 1,
-1.415213, 0.004881151, -2.583562, 1, 0.4862745, 0, 1,
-1.394296, -0.5780256, -1.756819, 1, 0.4901961, 0, 1,
-1.386159, 0.7439691, 0.2126524, 1, 0.4980392, 0, 1,
-1.385632, -0.2172361, -1.601104, 1, 0.5058824, 0, 1,
-1.385168, 0.888899, -1.424392, 1, 0.509804, 0, 1,
-1.384598, -0.2866637, -1.119645, 1, 0.5176471, 0, 1,
-1.382707, -0.3414454, -1.777373, 1, 0.5215687, 0, 1,
-1.379359, -0.4110063, -1.181119, 1, 0.5294118, 0, 1,
-1.377621, 0.8772107, -0.8050349, 1, 0.5333334, 0, 1,
-1.369332, 1.508983, 1.365449, 1, 0.5411765, 0, 1,
-1.357202, 0.6576566, -0.9398921, 1, 0.5450981, 0, 1,
-1.352877, 0.09520143, -2.181505, 1, 0.5529412, 0, 1,
-1.352188, 0.3730569, -1.041031, 1, 0.5568628, 0, 1,
-1.350195, -1.945128, -3.011339, 1, 0.5647059, 0, 1,
-1.346446, -0.1417119, -3.203277, 1, 0.5686275, 0, 1,
-1.341502, -0.5104386, -2.041357, 1, 0.5764706, 0, 1,
-1.340919, -0.4456955, 0.8837448, 1, 0.5803922, 0, 1,
-1.329812, 1.020213, -0.4990733, 1, 0.5882353, 0, 1,
-1.323796, 0.3059473, -1.057935, 1, 0.5921569, 0, 1,
-1.322727, 1.100587, 0.745566, 1, 0.6, 0, 1,
-1.318096, 0.04932109, -2.147033, 1, 0.6078432, 0, 1,
-1.317459, 2.05807, -0.5059243, 1, 0.6117647, 0, 1,
-1.312714, -0.5900283, 0.238738, 1, 0.6196079, 0, 1,
-1.306057, 1.511233, -0.6491888, 1, 0.6235294, 0, 1,
-1.303152, -2.857601, -1.930222, 1, 0.6313726, 0, 1,
-1.29253, 0.02313442, -3.073381, 1, 0.6352941, 0, 1,
-1.288754, -0.6517785, -1.462859, 1, 0.6431373, 0, 1,
-1.287096, -1.243439, -2.505631, 1, 0.6470588, 0, 1,
-1.279535, -1.796251, -1.619941, 1, 0.654902, 0, 1,
-1.268239, -0.4675362, -2.184435, 1, 0.6588235, 0, 1,
-1.26577, -0.9137626, -1.791683, 1, 0.6666667, 0, 1,
-1.257525, -0.2259704, -3.335475, 1, 0.6705883, 0, 1,
-1.230194, 0.7767891, -2.387628, 1, 0.6784314, 0, 1,
-1.227295, -0.1744642, -2.503715, 1, 0.682353, 0, 1,
-1.227164, -0.7050821, -1.419169, 1, 0.6901961, 0, 1,
-1.226083, -1.136101, -2.306334, 1, 0.6941177, 0, 1,
-1.217339, -1.392477, -2.352677, 1, 0.7019608, 0, 1,
-1.197503, 0.2451858, -4.41115, 1, 0.7098039, 0, 1,
-1.197484, -1.252115, -3.117842, 1, 0.7137255, 0, 1,
-1.195375, -1.603312, -2.30034, 1, 0.7215686, 0, 1,
-1.19374, -0.2850739, -2.050545, 1, 0.7254902, 0, 1,
-1.193032, 0.671352, -0.4097212, 1, 0.7333333, 0, 1,
-1.188831, -0.4228812, -1.635499, 1, 0.7372549, 0, 1,
-1.185163, 0.4196741, 0.5954897, 1, 0.7450981, 0, 1,
-1.182972, -0.02288518, -3.268332, 1, 0.7490196, 0, 1,
-1.176705, -0.5181378, -2.254622, 1, 0.7568628, 0, 1,
-1.170971, 2.234448, -0.9184459, 1, 0.7607843, 0, 1,
-1.169952, 1.131831, -0.6009745, 1, 0.7686275, 0, 1,
-1.165371, 0.1644159, -0.7866834, 1, 0.772549, 0, 1,
-1.163716, 1.909636, 1.268731, 1, 0.7803922, 0, 1,
-1.157206, -0.3236829, -0.9888091, 1, 0.7843137, 0, 1,
-1.156345, -0.9800498, -1.09602, 1, 0.7921569, 0, 1,
-1.150279, 1.329443, 0.5328301, 1, 0.7960784, 0, 1,
-1.143777, 0.8220413, -2.243948, 1, 0.8039216, 0, 1,
-1.14344, -1.289799, -3.292525, 1, 0.8117647, 0, 1,
-1.142523, -0.6054257, -2.526872, 1, 0.8156863, 0, 1,
-1.141866, -0.08423863, -1.249538, 1, 0.8235294, 0, 1,
-1.136183, -0.5218035, -0.8330886, 1, 0.827451, 0, 1,
-1.135242, 1.639477, -0.6026196, 1, 0.8352941, 0, 1,
-1.133164, -1.013903, -1.433883, 1, 0.8392157, 0, 1,
-1.124447, -0.9565317, -0.5096571, 1, 0.8470588, 0, 1,
-1.124238, -1.177875, -2.017574, 1, 0.8509804, 0, 1,
-1.122902, -1.147681, -3.853913, 1, 0.8588235, 0, 1,
-1.115606, -1.348969, -2.646075, 1, 0.8627451, 0, 1,
-1.112403, -1.028518, -1.14865, 1, 0.8705882, 0, 1,
-1.101016, -1.573862, -1.553936, 1, 0.8745098, 0, 1,
-1.100473, 1.166112, -0.7609771, 1, 0.8823529, 0, 1,
-1.097355, -0.3425954, -3.682095, 1, 0.8862745, 0, 1,
-1.09417, -0.01708765, -2.153969, 1, 0.8941177, 0, 1,
-1.093245, -0.3607319, -2.011531, 1, 0.8980392, 0, 1,
-1.092912, -0.9152931, -2.357193, 1, 0.9058824, 0, 1,
-1.092768, 0.4423289, -0.7426894, 1, 0.9137255, 0, 1,
-1.091091, 0.3293448, -1.786805, 1, 0.9176471, 0, 1,
-1.082475, 1.043082, -1.401463, 1, 0.9254902, 0, 1,
-1.078558, 1.337965, -0.2248153, 1, 0.9294118, 0, 1,
-1.074275, -1.328509, -2.829255, 1, 0.9372549, 0, 1,
-1.072959, 0.1652568, -1.578609, 1, 0.9411765, 0, 1,
-1.068258, 1.248981, -1.739786, 1, 0.9490196, 0, 1,
-1.059794, -1.036983, -3.01612, 1, 0.9529412, 0, 1,
-1.059643, 0.06010694, -3.087099, 1, 0.9607843, 0, 1,
-1.046785, -0.1541706, -1.43228, 1, 0.9647059, 0, 1,
-1.045921, 0.5175838, -1.334651, 1, 0.972549, 0, 1,
-1.045815, -2.26755, -2.598968, 1, 0.9764706, 0, 1,
-1.045398, -0.1124401, 0.3445062, 1, 0.9843137, 0, 1,
-1.040319, 0.8881192, -1.293357, 1, 0.9882353, 0, 1,
-1.027859, 1.065136, -0.9934281, 1, 0.9960784, 0, 1,
-1.023489, 0.2593083, -1.588263, 0.9960784, 1, 0, 1,
-1.013193, -0.07581781, -1.540956, 0.9921569, 1, 0, 1,
-0.9960598, -0.1248701, -2.610133, 0.9843137, 1, 0, 1,
-0.9945467, -0.4101885, -1.817314, 0.9803922, 1, 0, 1,
-0.9928632, 0.8932407, 0.5017555, 0.972549, 1, 0, 1,
-0.992326, -1.108554, -2.373828, 0.9686275, 1, 0, 1,
-0.9919732, 2.764508, -1.051841, 0.9607843, 1, 0, 1,
-0.9901833, -1.589544, -0.8249509, 0.9568627, 1, 0, 1,
-0.9795783, -1.125272, -1.199676, 0.9490196, 1, 0, 1,
-0.9783903, -1.803179, -1.570785, 0.945098, 1, 0, 1,
-0.9765516, -1.013459, -1.801689, 0.9372549, 1, 0, 1,
-0.9686976, 0.4238335, -2.910557, 0.9333333, 1, 0, 1,
-0.9680774, -0.8441638, -0.6404916, 0.9254902, 1, 0, 1,
-0.961568, -1.149283, -2.682577, 0.9215686, 1, 0, 1,
-0.9614865, -0.6734526, -3.037058, 0.9137255, 1, 0, 1,
-0.9567915, -0.953392, -1.342016, 0.9098039, 1, 0, 1,
-0.9564222, 1.28133, 1.484326, 0.9019608, 1, 0, 1,
-0.9534487, -1.890525, -1.035961, 0.8941177, 1, 0, 1,
-0.953306, 0.2832032, -1.283271, 0.8901961, 1, 0, 1,
-0.951738, -0.3299606, -2.795938, 0.8823529, 1, 0, 1,
-0.947326, 0.6017349, -2.098645, 0.8784314, 1, 0, 1,
-0.9448282, 0.2953434, -1.326124, 0.8705882, 1, 0, 1,
-0.9376388, -1.131267, -1.950096, 0.8666667, 1, 0, 1,
-0.9340386, 1.505779, -0.4102502, 0.8588235, 1, 0, 1,
-0.9313183, -0.2792064, -1.448241, 0.854902, 1, 0, 1,
-0.9310063, -1.088612, -1.485039, 0.8470588, 1, 0, 1,
-0.9287765, -2.744065, -2.631034, 0.8431373, 1, 0, 1,
-0.9247141, -0.5410091, -3.265813, 0.8352941, 1, 0, 1,
-0.9176224, 2.011875, 0.5596292, 0.8313726, 1, 0, 1,
-0.9171233, -1.049645, -2.286858, 0.8235294, 1, 0, 1,
-0.9165506, -0.5107322, -3.136774, 0.8196079, 1, 0, 1,
-0.9123455, -1.397434, -2.851859, 0.8117647, 1, 0, 1,
-0.9112719, 0.02370086, -0.4381514, 0.8078431, 1, 0, 1,
-0.9031698, 1.341587, -0.07747574, 0.8, 1, 0, 1,
-0.8993204, -1.019683, -2.009966, 0.7921569, 1, 0, 1,
-0.8893759, -0.3042752, -2.778972, 0.7882353, 1, 0, 1,
-0.8890987, 0.5394148, 0.529144, 0.7803922, 1, 0, 1,
-0.8850707, 0.6313477, -2.826875, 0.7764706, 1, 0, 1,
-0.8763016, 1.73761, 0.1919972, 0.7686275, 1, 0, 1,
-0.873142, -0.07233476, -1.216579, 0.7647059, 1, 0, 1,
-0.8676227, 0.5258108, -1.263825, 0.7568628, 1, 0, 1,
-0.8595654, 1.535278, 1.159335, 0.7529412, 1, 0, 1,
-0.8579568, 0.5839259, 0.2763683, 0.7450981, 1, 0, 1,
-0.8527966, -1.899835, -2.047903, 0.7411765, 1, 0, 1,
-0.852591, -0.3887959, -2.842377, 0.7333333, 1, 0, 1,
-0.8505221, 0.03219134, -3.038098, 0.7294118, 1, 0, 1,
-0.8484461, 0.2113248, -4.18772, 0.7215686, 1, 0, 1,
-0.8471209, 1.282161, -2.825092, 0.7176471, 1, 0, 1,
-0.845249, 1.759979, -1.130871, 0.7098039, 1, 0, 1,
-0.8418123, 0.3620666, -2.310332, 0.7058824, 1, 0, 1,
-0.8399253, -2.058509, -3.449712, 0.6980392, 1, 0, 1,
-0.8386815, -0.9708085, -1.438716, 0.6901961, 1, 0, 1,
-0.8384918, -0.9813385, -3.50965, 0.6862745, 1, 0, 1,
-0.8381301, 0.4909188, -0.8587824, 0.6784314, 1, 0, 1,
-0.8312895, 0.09275713, -0.9983599, 0.6745098, 1, 0, 1,
-0.8298393, -1.429017, -2.354421, 0.6666667, 1, 0, 1,
-0.8254139, 1.196605, 0.1502883, 0.6627451, 1, 0, 1,
-0.8223491, 0.5189641, 0.1792573, 0.654902, 1, 0, 1,
-0.8196055, -3.904019e-05, -3.294598, 0.6509804, 1, 0, 1,
-0.8151696, -0.2602757, -2.364222, 0.6431373, 1, 0, 1,
-0.8151061, -0.549512, -0.2833833, 0.6392157, 1, 0, 1,
-0.791784, 2.224162, -0.3928064, 0.6313726, 1, 0, 1,
-0.7909807, 0.5637453, -1.017644, 0.627451, 1, 0, 1,
-0.7908461, -0.5671486, -1.328238, 0.6196079, 1, 0, 1,
-0.7772515, 0.4335603, -0.982661, 0.6156863, 1, 0, 1,
-0.7664876, -1.335258, -1.679298, 0.6078432, 1, 0, 1,
-0.766071, 1.081877, -0.2865346, 0.6039216, 1, 0, 1,
-0.7590669, 0.03215121, -2.140557, 0.5960785, 1, 0, 1,
-0.7565659, 0.3215813, -1.977576, 0.5882353, 1, 0, 1,
-0.7550082, 0.9012244, -0.6447466, 0.5843138, 1, 0, 1,
-0.7518127, 0.1288161, -1.432283, 0.5764706, 1, 0, 1,
-0.7489729, -0.8987303, -1.93096, 0.572549, 1, 0, 1,
-0.7449691, -0.1012328, -4.34713, 0.5647059, 1, 0, 1,
-0.743856, 1.049052, -0.04493229, 0.5607843, 1, 0, 1,
-0.7431138, 1.186062, -0.8901676, 0.5529412, 1, 0, 1,
-0.7368007, 0.9341965, 0.02030804, 0.5490196, 1, 0, 1,
-0.7326502, -0.9117986, -2.279023, 0.5411765, 1, 0, 1,
-0.7324963, 1.508703, -0.3238528, 0.5372549, 1, 0, 1,
-0.7313551, 0.09624366, -2.014808, 0.5294118, 1, 0, 1,
-0.7311829, 0.206263, -1.976673, 0.5254902, 1, 0, 1,
-0.7298045, -0.1446725, -2.265309, 0.5176471, 1, 0, 1,
-0.7297672, 0.9706239, -0.5690963, 0.5137255, 1, 0, 1,
-0.727331, 0.2070435, -1.616326, 0.5058824, 1, 0, 1,
-0.722887, 0.7200871, 0.1791446, 0.5019608, 1, 0, 1,
-0.7212949, -0.3012705, -1.314147, 0.4941176, 1, 0, 1,
-0.7199261, 1.346346, 1.081793, 0.4862745, 1, 0, 1,
-0.7142568, -1.129364, -3.131229, 0.4823529, 1, 0, 1,
-0.7126398, -0.1280418, -1.224507, 0.4745098, 1, 0, 1,
-0.7114443, 1.056487, 1.194328, 0.4705882, 1, 0, 1,
-0.7027282, -1.916026, -2.666825, 0.4627451, 1, 0, 1,
-0.7000465, 0.1375674, -0.01989709, 0.4588235, 1, 0, 1,
-0.6963441, -1.907662, -2.632478, 0.4509804, 1, 0, 1,
-0.6920292, -0.1499997, -1.814319, 0.4470588, 1, 0, 1,
-0.6905085, -0.8719164, -1.196838, 0.4392157, 1, 0, 1,
-0.6893892, 0.1168325, -0.7434986, 0.4352941, 1, 0, 1,
-0.6763855, 0.2410002, -1.935594, 0.427451, 1, 0, 1,
-0.6761757, -0.8251195, -0.1193291, 0.4235294, 1, 0, 1,
-0.6719609, 0.3548692, -0.7801399, 0.4156863, 1, 0, 1,
-0.6709639, 2.025586, 0.1886189, 0.4117647, 1, 0, 1,
-0.6693165, -0.7776805, -2.276204, 0.4039216, 1, 0, 1,
-0.6686564, 0.4046388, -0.2602379, 0.3960784, 1, 0, 1,
-0.666388, -1.560733, -4.575026, 0.3921569, 1, 0, 1,
-0.6654476, -1.52069, -4.341417, 0.3843137, 1, 0, 1,
-0.6583435, -2.463661, -3.601362, 0.3803922, 1, 0, 1,
-0.6577137, 0.1613512, -0.5549151, 0.372549, 1, 0, 1,
-0.6555364, -0.06626941, -2.684978, 0.3686275, 1, 0, 1,
-0.6496129, -1.165422, -1.394935, 0.3607843, 1, 0, 1,
-0.6477177, -1.257412, -2.096332, 0.3568628, 1, 0, 1,
-0.6448182, 0.4976535, -1.803528, 0.3490196, 1, 0, 1,
-0.6412154, -1.4225, -1.603601, 0.345098, 1, 0, 1,
-0.6247123, 1.3909, -0.4581822, 0.3372549, 1, 0, 1,
-0.6202174, -0.06848372, -2.669423, 0.3333333, 1, 0, 1,
-0.6143873, -0.5167533, -1.004024, 0.3254902, 1, 0, 1,
-0.6098529, 0.6474467, -1.330556, 0.3215686, 1, 0, 1,
-0.609372, -0.3828504, -2.933917, 0.3137255, 1, 0, 1,
-0.6091151, 0.7733909, -1.181975, 0.3098039, 1, 0, 1,
-0.6078105, 0.5997058, -1.464885, 0.3019608, 1, 0, 1,
-0.6015096, -0.5418749, -1.421736, 0.2941177, 1, 0, 1,
-0.5978207, -0.457132, -2.386531, 0.2901961, 1, 0, 1,
-0.5939344, 0.6004974, -1.207735, 0.282353, 1, 0, 1,
-0.5869713, -0.6877435, -3.065428, 0.2784314, 1, 0, 1,
-0.5861782, 0.8693532, -0.683663, 0.2705882, 1, 0, 1,
-0.5812396, 1.458455, -0.05853387, 0.2666667, 1, 0, 1,
-0.5808603, 0.2944196, 0.2065616, 0.2588235, 1, 0, 1,
-0.580471, -0.6436957, -2.680972, 0.254902, 1, 0, 1,
-0.578921, -1.785243, -4.43545, 0.2470588, 1, 0, 1,
-0.5781472, -0.7342592, -1.19928, 0.2431373, 1, 0, 1,
-0.5769531, -0.7548508, -2.657166, 0.2352941, 1, 0, 1,
-0.5742931, 0.01770008, -1.73477, 0.2313726, 1, 0, 1,
-0.5722484, -1.691264, -2.35064, 0.2235294, 1, 0, 1,
-0.5685604, 0.05057469, -1.221537, 0.2196078, 1, 0, 1,
-0.5675347, 0.2576222, 0.07552142, 0.2117647, 1, 0, 1,
-0.5652241, 1.581821, -1.164317, 0.2078431, 1, 0, 1,
-0.5624909, 0.4765956, -1.639187, 0.2, 1, 0, 1,
-0.5562415, -1.112604, -3.290657, 0.1921569, 1, 0, 1,
-0.5538567, -1.073612, -4.905321, 0.1882353, 1, 0, 1,
-0.5534722, -0.6963447, -3.604983, 0.1803922, 1, 0, 1,
-0.5524455, -0.04876527, -0.7400025, 0.1764706, 1, 0, 1,
-0.5510407, 0.567416, -1.374085, 0.1686275, 1, 0, 1,
-0.5481028, 1.31422, 1.252621, 0.1647059, 1, 0, 1,
-0.5471991, -2.165842, -3.756555, 0.1568628, 1, 0, 1,
-0.5467572, 0.5003877, -1.9938, 0.1529412, 1, 0, 1,
-0.5411864, -1.512969, -3.260304, 0.145098, 1, 0, 1,
-0.5409595, -0.8968181, -3.121517, 0.1411765, 1, 0, 1,
-0.5381825, -0.6932911, -1.860558, 0.1333333, 1, 0, 1,
-0.5377597, -0.1187761, -0.6034754, 0.1294118, 1, 0, 1,
-0.531632, -1.729043, -2.533658, 0.1215686, 1, 0, 1,
-0.530397, 0.9502516, -0.8110039, 0.1176471, 1, 0, 1,
-0.5291312, -1.169087, -2.768199, 0.1098039, 1, 0, 1,
-0.5258263, -0.1597166, -2.480605, 0.1058824, 1, 0, 1,
-0.5221176, 1.684199, -0.3696498, 0.09803922, 1, 0, 1,
-0.5213246, 0.1484311, -1.648799, 0.09019608, 1, 0, 1,
-0.5183188, 1.927909, -0.6821689, 0.08627451, 1, 0, 1,
-0.5181532, -0.5770651, -1.829098, 0.07843138, 1, 0, 1,
-0.5123342, 1.644413, -0.9041177, 0.07450981, 1, 0, 1,
-0.5098914, 0.4494008, 0.1505535, 0.06666667, 1, 0, 1,
-0.508012, 0.6457404, -0.7360647, 0.0627451, 1, 0, 1,
-0.507911, -1.291575, -2.228196, 0.05490196, 1, 0, 1,
-0.5056918, 0.08406864, -1.334989, 0.05098039, 1, 0, 1,
-0.5029846, -0.7083682, -2.103611, 0.04313726, 1, 0, 1,
-0.4984816, -1.497684, -3.408652, 0.03921569, 1, 0, 1,
-0.4963545, -0.8541694, -4.379835, 0.03137255, 1, 0, 1,
-0.4953358, -0.7635518, -3.322381, 0.02745098, 1, 0, 1,
-0.4935115, 0.215259, -2.901504, 0.01960784, 1, 0, 1,
-0.4838442, -2.203226, -2.484026, 0.01568628, 1, 0, 1,
-0.4827684, 0.6051776, -1.087935, 0.007843138, 1, 0, 1,
-0.4805922, -0.1950382, -2.009065, 0.003921569, 1, 0, 1,
-0.4796483, -0.5819642, -2.556067, 0, 1, 0.003921569, 1,
-0.4792931, -1.36826, -3.802721, 0, 1, 0.01176471, 1,
-0.4791299, 2.085325, 2.190364, 0, 1, 0.01568628, 1,
-0.4779405, -0.7667168, -2.528604, 0, 1, 0.02352941, 1,
-0.4719741, 1.126548, -1.003429, 0, 1, 0.02745098, 1,
-0.4718877, 0.8484119, 0.2139997, 0, 1, 0.03529412, 1,
-0.4716627, -1.906547, -2.140265, 0, 1, 0.03921569, 1,
-0.4703745, -1.172245, -1.237572, 0, 1, 0.04705882, 1,
-0.468473, 1.347067, 0.9624351, 0, 1, 0.05098039, 1,
-0.467964, -0.007955398, -2.113607, 0, 1, 0.05882353, 1,
-0.4673467, 1.358452, -0.2893845, 0, 1, 0.0627451, 1,
-0.4622786, 0.2706739, -0.8897011, 0, 1, 0.07058824, 1,
-0.4613031, 1.370435, -3.129548, 0, 1, 0.07450981, 1,
-0.4562939, 0.5460966, -0.6935797, 0, 1, 0.08235294, 1,
-0.4559477, 0.08614094, -2.172338, 0, 1, 0.08627451, 1,
-0.4556521, -0.6344415, -1.764, 0, 1, 0.09411765, 1,
-0.4527645, -0.80165, -3.721822, 0, 1, 0.1019608, 1,
-0.4496276, 0.1355015, -1.132307, 0, 1, 0.1058824, 1,
-0.438576, 0.4844778, -0.5725569, 0, 1, 0.1137255, 1,
-0.4347969, -0.1413349, -2.977482, 0, 1, 0.1176471, 1,
-0.4311607, -1.480563, -3.153461, 0, 1, 0.1254902, 1,
-0.4301576, -0.9590951, -2.581368, 0, 1, 0.1294118, 1,
-0.428984, -0.5495926, -2.204225, 0, 1, 0.1372549, 1,
-0.4287331, -0.2898559, -0.3122035, 0, 1, 0.1411765, 1,
-0.4197723, 0.9471083, -0.385931, 0, 1, 0.1490196, 1,
-0.4149595, -0.07168679, -1.211996, 0, 1, 0.1529412, 1,
-0.413975, 0.203436, 0.3593128, 0, 1, 0.1607843, 1,
-0.4112254, -0.5350224, -1.329522, 0, 1, 0.1647059, 1,
-0.4091892, 0.7097713, 1.190933, 0, 1, 0.172549, 1,
-0.4059335, 1.370112, 0.4589381, 0, 1, 0.1764706, 1,
-0.4002487, 0.440655, 0.4425704, 0, 1, 0.1843137, 1,
-0.4001816, -0.6416229, -3.427965, 0, 1, 0.1882353, 1,
-0.3982563, 0.04640616, -0.4285631, 0, 1, 0.1960784, 1,
-0.3968502, -0.1944306, -2.084264, 0, 1, 0.2039216, 1,
-0.395988, -1.103204, -2.690397, 0, 1, 0.2078431, 1,
-0.3915986, -1.520965, -3.929914, 0, 1, 0.2156863, 1,
-0.3833797, 0.0710908, -0.9925024, 0, 1, 0.2196078, 1,
-0.3831704, 0.7134616, -0.7502413, 0, 1, 0.227451, 1,
-0.3830773, 1.031788, -1.95829, 0, 1, 0.2313726, 1,
-0.3782904, -1.876793, -2.927575, 0, 1, 0.2392157, 1,
-0.3754429, -0.9189013, -4.285316, 0, 1, 0.2431373, 1,
-0.3723752, -1.336605, -3.238736, 0, 1, 0.2509804, 1,
-0.3643313, 1.691406, -0.01365697, 0, 1, 0.254902, 1,
-0.3563652, -1.806571, -2.048996, 0, 1, 0.2627451, 1,
-0.3524872, -0.06973618, -3.327003, 0, 1, 0.2666667, 1,
-0.352, -1.061407, -2.024929, 0, 1, 0.2745098, 1,
-0.3488359, 2.560641, 1.807314, 0, 1, 0.2784314, 1,
-0.3449111, 1.597619, -0.289621, 0, 1, 0.2862745, 1,
-0.3447468, -1.309493, -4.446408, 0, 1, 0.2901961, 1,
-0.3401616, -0.7902158, -2.516883, 0, 1, 0.2980392, 1,
-0.3386107, 0.319984, -3.472391, 0, 1, 0.3058824, 1,
-0.3240034, 0.4378673, 0.9389589, 0, 1, 0.3098039, 1,
-0.3238002, 0.3213274, 0.04623375, 0, 1, 0.3176471, 1,
-0.3160306, -0.08088637, -2.954057, 0, 1, 0.3215686, 1,
-0.3142564, -0.208864, -0.4669152, 0, 1, 0.3294118, 1,
-0.3129896, 0.5777932, -1.303784, 0, 1, 0.3333333, 1,
-0.3107702, 0.1781846, -0.1200867, 0, 1, 0.3411765, 1,
-0.3100084, -0.1640201, -1.838099, 0, 1, 0.345098, 1,
-0.3075693, -0.02458298, -1.894579, 0, 1, 0.3529412, 1,
-0.2934848, 0.04758718, -0.4286653, 0, 1, 0.3568628, 1,
-0.2932425, -0.6398094, -3.232268, 0, 1, 0.3647059, 1,
-0.2839986, -0.1912592, -1.212615, 0, 1, 0.3686275, 1,
-0.283728, -0.2000076, -1.481827, 0, 1, 0.3764706, 1,
-0.2771008, 0.6044942, -0.5265551, 0, 1, 0.3803922, 1,
-0.271624, -0.007514498, -1.061611, 0, 1, 0.3882353, 1,
-0.2700053, -0.6651205, -2.062082, 0, 1, 0.3921569, 1,
-0.2615563, -0.2306325, -2.630939, 0, 1, 0.4, 1,
-0.2609251, 2.163973, 1.160708, 0, 1, 0.4078431, 1,
-0.2595368, -0.1952993, -2.143223, 0, 1, 0.4117647, 1,
-0.2544383, 2.575818, -0.3735149, 0, 1, 0.4196078, 1,
-0.2511791, -1.852566, -3.9373, 0, 1, 0.4235294, 1,
-0.2453319, -1.250587, -4.719905, 0, 1, 0.4313726, 1,
-0.2434442, 0.7851251, 0.4391536, 0, 1, 0.4352941, 1,
-0.2424033, 1.450825, 0.05907233, 0, 1, 0.4431373, 1,
-0.2337809, -0.4264382, -4.920991, 0, 1, 0.4470588, 1,
-0.2321623, 0.064983, -1.164253, 0, 1, 0.454902, 1,
-0.2314097, -0.2261489, -4.024738, 0, 1, 0.4588235, 1,
-0.2307203, -0.3099417, -1.436937, 0, 1, 0.4666667, 1,
-0.2290562, -0.8593901, -2.073423, 0, 1, 0.4705882, 1,
-0.2267517, 0.7451831, 0.9619797, 0, 1, 0.4784314, 1,
-0.2227638, -1.361162, -2.787186, 0, 1, 0.4823529, 1,
-0.2225874, 0.8690854, 0.1945636, 0, 1, 0.4901961, 1,
-0.2214839, -0.155602, -2.138234, 0, 1, 0.4941176, 1,
-0.2211212, 0.6638674, 0.2927253, 0, 1, 0.5019608, 1,
-0.2207485, -1.462609, -0.6783102, 0, 1, 0.509804, 1,
-0.2207033, 0.4443101, -0.6887472, 0, 1, 0.5137255, 1,
-0.2205873, -0.267747, -0.8002036, 0, 1, 0.5215687, 1,
-0.2202111, -0.09807091, -1.645545, 0, 1, 0.5254902, 1,
-0.2201135, 0.02309842, -1.085999, 0, 1, 0.5333334, 1,
-0.2195053, -0.5620947, -2.905659, 0, 1, 0.5372549, 1,
-0.218994, -0.3471149, -2.734325, 0, 1, 0.5450981, 1,
-0.2176422, -0.9272637, -4.797865, 0, 1, 0.5490196, 1,
-0.2136329, 0.4650701, -1.304852, 0, 1, 0.5568628, 1,
-0.2118178, 0.4637308, -0.03598891, 0, 1, 0.5607843, 1,
-0.2060032, 1.536139, -0.1458197, 0, 1, 0.5686275, 1,
-0.2057596, 0.8496305, 1.052653, 0, 1, 0.572549, 1,
-0.2019099, -0.3281403, -2.7299, 0, 1, 0.5803922, 1,
-0.1989704, -0.1207057, -0.8984913, 0, 1, 0.5843138, 1,
-0.1919594, -1.244995, -2.317136, 0, 1, 0.5921569, 1,
-0.1915481, 0.3361303, -3.722526, 0, 1, 0.5960785, 1,
-0.1882193, 0.4250139, -0.2010132, 0, 1, 0.6039216, 1,
-0.1845751, -0.361279, -2.810709, 0, 1, 0.6117647, 1,
-0.1831742, 0.6780393, -0.5464801, 0, 1, 0.6156863, 1,
-0.1830856, -0.2782005, -3.541358, 0, 1, 0.6235294, 1,
-0.1828658, -0.553398, -1.965524, 0, 1, 0.627451, 1,
-0.1798897, -1.794469, -4.108449, 0, 1, 0.6352941, 1,
-0.1790061, 0.2470773, -0.5195487, 0, 1, 0.6392157, 1,
-0.1773744, 0.427707, -0.7607601, 0, 1, 0.6470588, 1,
-0.1764366, -0.2862787, -1.357064, 0, 1, 0.6509804, 1,
-0.1664061, -1.010403, -3.561718, 0, 1, 0.6588235, 1,
-0.1661654, 0.06524488, 0.02953721, 0, 1, 0.6627451, 1,
-0.164365, 2.043446, 0.2911635, 0, 1, 0.6705883, 1,
-0.1630163, 0.4531561, 0.305537, 0, 1, 0.6745098, 1,
-0.1530738, -0.2079615, -3.839211, 0, 1, 0.682353, 1,
-0.1496007, -1.042133, -3.507453, 0, 1, 0.6862745, 1,
-0.1487661, 0.4842107, -0.2834437, 0, 1, 0.6941177, 1,
-0.1483436, -0.2688663, -1.605658, 0, 1, 0.7019608, 1,
-0.148336, -1.722473, -4.640535, 0, 1, 0.7058824, 1,
-0.1474236, -0.5153385, -2.419948, 0, 1, 0.7137255, 1,
-0.1452721, -0.1188945, -1.150981, 0, 1, 0.7176471, 1,
-0.1368093, -1.523723, -3.413945, 0, 1, 0.7254902, 1,
-0.1365241, -0.3390364, -2.936716, 0, 1, 0.7294118, 1,
-0.1361158, -0.5104825, -1.667961, 0, 1, 0.7372549, 1,
-0.1356611, -0.502822, -3.786668, 0, 1, 0.7411765, 1,
-0.1339131, 1.054236, -0.8828683, 0, 1, 0.7490196, 1,
-0.1336377, -0.4494884, -2.575094, 0, 1, 0.7529412, 1,
-0.1318958, 1.773558, -1.974382, 0, 1, 0.7607843, 1,
-0.1318721, 0.3518566, 0.2392709, 0, 1, 0.7647059, 1,
-0.1314004, -0.3492433, -4.284009, 0, 1, 0.772549, 1,
-0.128647, -0.5845144, -2.024557, 0, 1, 0.7764706, 1,
-0.1203175, 1.610095, 0.2747528, 0, 1, 0.7843137, 1,
-0.1138542, -0.06543471, -2.939782, 0, 1, 0.7882353, 1,
-0.1136568, 0.8557194, 0.3294668, 0, 1, 0.7960784, 1,
-0.11167, 1.675277, 1.122777, 0, 1, 0.8039216, 1,
-0.1098627, -0.1540862, -1.734349, 0, 1, 0.8078431, 1,
-0.1083006, -1.370808, -3.943754, 0, 1, 0.8156863, 1,
-0.1062346, 0.2924903, -1.363006, 0, 1, 0.8196079, 1,
-0.1062205, -0.3178353, -1.372156, 0, 1, 0.827451, 1,
-0.1009769, 2.701695, 1.162405, 0, 1, 0.8313726, 1,
-0.1005559, -0.6180588, -2.719762, 0, 1, 0.8392157, 1,
-0.09991562, 0.5176525, -0.8767374, 0, 1, 0.8431373, 1,
-0.09933423, -0.3898808, -2.804786, 0, 1, 0.8509804, 1,
-0.09489172, 0.6543279, 0.01498617, 0, 1, 0.854902, 1,
-0.091135, 0.1320032, -2.429671, 0, 1, 0.8627451, 1,
-0.09003598, 0.4012865, -1.424846, 0, 1, 0.8666667, 1,
-0.09000233, 1.106988, -0.006338181, 0, 1, 0.8745098, 1,
-0.08586064, 1.818334, 0.416271, 0, 1, 0.8784314, 1,
-0.08345693, 1.765581, 0.1294798, 0, 1, 0.8862745, 1,
-0.08342479, -0.8008935, -2.535171, 0, 1, 0.8901961, 1,
-0.08171741, -0.03932365, -4.089936, 0, 1, 0.8980392, 1,
-0.08040497, -1.049871, -2.734853, 0, 1, 0.9058824, 1,
-0.07961141, 1.128332, 2.441222, 0, 1, 0.9098039, 1,
-0.07343949, -0.855299, -3.554497, 0, 1, 0.9176471, 1,
-0.07270022, 0.2395196, -0.5943257, 0, 1, 0.9215686, 1,
-0.06997011, -0.2981718, -3.844058, 0, 1, 0.9294118, 1,
-0.06317998, -0.5632238, -2.077521, 0, 1, 0.9333333, 1,
-0.06259492, 0.3741811, -0.1272425, 0, 1, 0.9411765, 1,
-0.06175597, -0.6363373, -3.211966, 0, 1, 0.945098, 1,
-0.05824676, -0.6125088, -4.945011, 0, 1, 0.9529412, 1,
-0.05568816, -0.1623099, -5.288041, 0, 1, 0.9568627, 1,
-0.04975323, -0.2574503, -2.614794, 0, 1, 0.9647059, 1,
-0.04798726, 0.7819905, -1.188983, 0, 1, 0.9686275, 1,
-0.03977476, -1.679916, -4.764516, 0, 1, 0.9764706, 1,
-0.03973631, 0.4377646, -1.802305, 0, 1, 0.9803922, 1,
-0.0328216, 0.3800555, 0.6359464, 0, 1, 0.9882353, 1,
-0.03182161, 0.09908553, 1.173609, 0, 1, 0.9921569, 1,
-0.02966649, 0.4547234, -1.594448, 0, 1, 1, 1,
-0.02583067, 0.5689071, 0.06315488, 0, 0.9921569, 1, 1,
-0.01935434, 0.1015346, -0.9403514, 0, 0.9882353, 1, 1,
-0.01442228, -0.01393305, -1.772279, 0, 0.9803922, 1, 1,
-0.009175436, -0.7804828, -5.173225, 0, 0.9764706, 1, 1,
-0.009146463, -0.4998257, -3.916521, 0, 0.9686275, 1, 1,
-0.0001782938, -0.1710578, -3.955154, 0, 0.9647059, 1, 1,
0.01801332, 2.220378, 0.5188216, 0, 0.9568627, 1, 1,
0.01898187, 0.4596812, -1.630151, 0, 0.9529412, 1, 1,
0.02042275, 2.12801, -0.9391924, 0, 0.945098, 1, 1,
0.02206457, 1.514705, -0.7441307, 0, 0.9411765, 1, 1,
0.02334206, -0.1322345, 2.289576, 0, 0.9333333, 1, 1,
0.02348239, -2.246233, 2.25149, 0, 0.9294118, 1, 1,
0.02630543, -0.6670781, 2.709611, 0, 0.9215686, 1, 1,
0.02950957, -0.004885622, 1.861522, 0, 0.9176471, 1, 1,
0.03320455, -0.2615043, 2.502322, 0, 0.9098039, 1, 1,
0.03790409, 0.5022488, -1.161102, 0, 0.9058824, 1, 1,
0.04644983, -1.522507, 1.688831, 0, 0.8980392, 1, 1,
0.04899359, 1.078779, -0.8897336, 0, 0.8901961, 1, 1,
0.04924873, 0.4984432, 0.5347365, 0, 0.8862745, 1, 1,
0.04979417, 1.679934, -0.8745038, 0, 0.8784314, 1, 1,
0.05118786, -0.4533964, 2.847041, 0, 0.8745098, 1, 1,
0.05220349, 0.9179125, -0.8002697, 0, 0.8666667, 1, 1,
0.0548446, -1.787408, 3.372105, 0, 0.8627451, 1, 1,
0.05748985, -0.8461858, 1.477465, 0, 0.854902, 1, 1,
0.05921156, -0.9100608, 2.681239, 0, 0.8509804, 1, 1,
0.06020894, 3.290085, 1.838565, 0, 0.8431373, 1, 1,
0.06158586, 0.254025, -0.5713819, 0, 0.8392157, 1, 1,
0.06745879, -0.1333494, 1.584859, 0, 0.8313726, 1, 1,
0.06812921, -2.226889, 3.133582, 0, 0.827451, 1, 1,
0.0687761, 1.262058, -0.4039873, 0, 0.8196079, 1, 1,
0.06948294, -0.4463666, 3.077669, 0, 0.8156863, 1, 1,
0.07033474, -0.8117591, 2.497643, 0, 0.8078431, 1, 1,
0.07317646, -0.4445588, 3.630352, 0, 0.8039216, 1, 1,
0.07806392, -1.139474, 3.796314, 0, 0.7960784, 1, 1,
0.07915834, 0.5431728, 0.1205011, 0, 0.7882353, 1, 1,
0.09654979, -0.4821616, 3.569116, 0, 0.7843137, 1, 1,
0.1008953, -0.5693716, 2.865644, 0, 0.7764706, 1, 1,
0.1029032, 1.12467, 0.3012154, 0, 0.772549, 1, 1,
0.1038909, -0.6714163, 2.64068, 0, 0.7647059, 1, 1,
0.1102649, -0.355491, 4.591847, 0, 0.7607843, 1, 1,
0.1103922, 0.2756024, 0.3288292, 0, 0.7529412, 1, 1,
0.1153679, 0.2788377, 0.6607091, 0, 0.7490196, 1, 1,
0.1169389, 0.05713096, -0.2651031, 0, 0.7411765, 1, 1,
0.1196333, -0.4600866, 3.373023, 0, 0.7372549, 1, 1,
0.1208068, 0.7684042, -0.02444118, 0, 0.7294118, 1, 1,
0.1237646, 0.4442999, 0.1708086, 0, 0.7254902, 1, 1,
0.1278038, 0.1136136, 0.259332, 0, 0.7176471, 1, 1,
0.1376331, -0.7089365, 1.84577, 0, 0.7137255, 1, 1,
0.1382243, -0.204462, 1.172722, 0, 0.7058824, 1, 1,
0.1410468, 0.4623922, -0.7815998, 0, 0.6980392, 1, 1,
0.1437118, -0.1021269, 3.920466, 0, 0.6941177, 1, 1,
0.1479303, -1.086174, 4.272011, 0, 0.6862745, 1, 1,
0.1491195, -0.001380634, 0.7373851, 0, 0.682353, 1, 1,
0.1538585, 0.1420807, 2.122024, 0, 0.6745098, 1, 1,
0.1566567, 1.500031, -0.2672797, 0, 0.6705883, 1, 1,
0.157738, -0.5025642, 2.484488, 0, 0.6627451, 1, 1,
0.1592086, -0.9173553, 2.573658, 0, 0.6588235, 1, 1,
0.1613246, 0.6474571, 1.078287, 0, 0.6509804, 1, 1,
0.1650373, 1.913401, -0.8121239, 0, 0.6470588, 1, 1,
0.1682815, 0.669246, 0.8074036, 0, 0.6392157, 1, 1,
0.1700798, -1.652857, 3.628249, 0, 0.6352941, 1, 1,
0.1706211, -0.8200303, 3.263258, 0, 0.627451, 1, 1,
0.1730346, -0.6644867, 4.437515, 0, 0.6235294, 1, 1,
0.1741716, -0.6118199, 3.12118, 0, 0.6156863, 1, 1,
0.1743567, 0.7500923, 1.010631, 0, 0.6117647, 1, 1,
0.1782028, 1.020919, -0.648495, 0, 0.6039216, 1, 1,
0.1818747, -0.7098209, 3.34716, 0, 0.5960785, 1, 1,
0.1824903, -0.4464096, 2.767064, 0, 0.5921569, 1, 1,
0.1842401, 0.06671123, 2.309297, 0, 0.5843138, 1, 1,
0.1848591, 0.6428897, 2.000089, 0, 0.5803922, 1, 1,
0.1869538, -1.180624, 4.82516, 0, 0.572549, 1, 1,
0.1874435, -1.428147, 2.246782, 0, 0.5686275, 1, 1,
0.1897058, -0.1249095, -0.1339087, 0, 0.5607843, 1, 1,
0.1933937, 0.2092897, 0.7812384, 0, 0.5568628, 1, 1,
0.1938519, 0.9067355, -1.143344, 0, 0.5490196, 1, 1,
0.1942463, -2.092388, 4.655971, 0, 0.5450981, 1, 1,
0.1962071, -1.023076, 5.23518, 0, 0.5372549, 1, 1,
0.2020646, -0.6473618, 2.192509, 0, 0.5333334, 1, 1,
0.208703, -1.3418, 1.860327, 0, 0.5254902, 1, 1,
0.2095948, 0.2314578, 0.586516, 0, 0.5215687, 1, 1,
0.2103406, 2.04175, -0.05970271, 0, 0.5137255, 1, 1,
0.2130578, 0.7857714, 0.17379, 0, 0.509804, 1, 1,
0.2181426, 1.293288, 0.4365468, 0, 0.5019608, 1, 1,
0.2253944, -1.709658, 3.836273, 0, 0.4941176, 1, 1,
0.2323825, -1.309726, 2.278104, 0, 0.4901961, 1, 1,
0.2333959, 0.0301386, 2.099509, 0, 0.4823529, 1, 1,
0.2334729, 0.5365439, 1.322951, 0, 0.4784314, 1, 1,
0.2360907, 0.7300152, 1.364301, 0, 0.4705882, 1, 1,
0.2367185, -2.049931, 2.989533, 0, 0.4666667, 1, 1,
0.23897, 0.7631767, 1.193819, 0, 0.4588235, 1, 1,
0.2398754, -0.002557958, 0.6671316, 0, 0.454902, 1, 1,
0.2414783, 0.1565681, 2.79629, 0, 0.4470588, 1, 1,
0.2523414, 1.203918, 0.7677076, 0, 0.4431373, 1, 1,
0.2561349, 0.1484241, -0.03933778, 0, 0.4352941, 1, 1,
0.2568358, 0.7389719, 1.262458, 0, 0.4313726, 1, 1,
0.2589167, 1.267638, 1.229593, 0, 0.4235294, 1, 1,
0.2631649, 0.3947146, 0.8742663, 0, 0.4196078, 1, 1,
0.2659424, 0.8517075, 0.6411806, 0, 0.4117647, 1, 1,
0.2674753, 0.07501785, 0.1437872, 0, 0.4078431, 1, 1,
0.2693587, -0.4219252, 1.738114, 0, 0.4, 1, 1,
0.2810232, -1.071185, 2.7883, 0, 0.3921569, 1, 1,
0.2822771, -0.05229847, 0.9379735, 0, 0.3882353, 1, 1,
0.2851376, -0.570805, 1.80361, 0, 0.3803922, 1, 1,
0.2856231, 2.618958, -2.119758, 0, 0.3764706, 1, 1,
0.285921, 0.2476899, 1.034117, 0, 0.3686275, 1, 1,
0.2887254, -0.9117671, 2.681071, 0, 0.3647059, 1, 1,
0.2898944, -0.8211139, 3.580196, 0, 0.3568628, 1, 1,
0.2936037, -0.1495681, 1.878411, 0, 0.3529412, 1, 1,
0.2953118, -0.5821445, 4.313413, 0, 0.345098, 1, 1,
0.297192, -0.8501315, 1.892457, 0, 0.3411765, 1, 1,
0.3002749, -0.6829205, 2.309842, 0, 0.3333333, 1, 1,
0.300556, 0.3685614, 0.3681147, 0, 0.3294118, 1, 1,
0.302167, 0.1681802, 2.208159, 0, 0.3215686, 1, 1,
0.3034001, 0.7551579, -1.372178, 0, 0.3176471, 1, 1,
0.3091255, -0.1463732, 2.778302, 0, 0.3098039, 1, 1,
0.3124092, 1.366515, 1.182789, 0, 0.3058824, 1, 1,
0.3128116, -0.2919573, 1.739196, 0, 0.2980392, 1, 1,
0.3134008, -1.245078, 3.191496, 0, 0.2901961, 1, 1,
0.3143604, -0.615943, 2.815532, 0, 0.2862745, 1, 1,
0.3164648, -0.7832164, 2.644397, 0, 0.2784314, 1, 1,
0.3195254, 0.07327257, 1.123708, 0, 0.2745098, 1, 1,
0.3211911, 1.522226, -0.9534581, 0, 0.2666667, 1, 1,
0.3239799, 1.59028, -0.1440295, 0, 0.2627451, 1, 1,
0.3247098, 0.81804, 0.6638045, 0, 0.254902, 1, 1,
0.3258604, 1.60664, 1.031386, 0, 0.2509804, 1, 1,
0.3404676, 1.502067, 1.897022, 0, 0.2431373, 1, 1,
0.3479968, -2.139695, 1.259474, 0, 0.2392157, 1, 1,
0.3509181, 1.214281, -0.0455882, 0, 0.2313726, 1, 1,
0.3597569, 0.6633987, -0.1714311, 0, 0.227451, 1, 1,
0.3651122, 0.07647855, 1.36274, 0, 0.2196078, 1, 1,
0.3679314, 1.352408, 0.3771642, 0, 0.2156863, 1, 1,
0.3685819, -0.5632355, 2.027189, 0, 0.2078431, 1, 1,
0.3702571, -0.79325, 3.097428, 0, 0.2039216, 1, 1,
0.3712622, -0.4000248, 3.363988, 0, 0.1960784, 1, 1,
0.3732251, 1.742794, -0.5009127, 0, 0.1882353, 1, 1,
0.3767407, -1.02452, 4.534026, 0, 0.1843137, 1, 1,
0.3792725, -2.368478, 1.692604, 0, 0.1764706, 1, 1,
0.3836634, -0.6211389, 3.481662, 0, 0.172549, 1, 1,
0.3853782, 0.8498418, 0.8592623, 0, 0.1647059, 1, 1,
0.3880669, 1.360575, 2.326631, 0, 0.1607843, 1, 1,
0.3911905, -1.215336, 2.399775, 0, 0.1529412, 1, 1,
0.3962206, -0.1843651, 2.247061, 0, 0.1490196, 1, 1,
0.3972682, -0.5136434, 0.06796031, 0, 0.1411765, 1, 1,
0.3974982, -0.3714077, 3.653208, 0, 0.1372549, 1, 1,
0.398167, -1.049227, 3.173284, 0, 0.1294118, 1, 1,
0.4004018, -0.9182215, 2.75288, 0, 0.1254902, 1, 1,
0.4007472, -1.576184, 1.789614, 0, 0.1176471, 1, 1,
0.4082004, -0.6557607, 1.365505, 0, 0.1137255, 1, 1,
0.4248893, -1.036822, 4.104482, 0, 0.1058824, 1, 1,
0.4252932, 0.7798356, 0.6052787, 0, 0.09803922, 1, 1,
0.4273684, 1.172742, -0.1618436, 0, 0.09411765, 1, 1,
0.4278659, -0.4658098, 2.004931, 0, 0.08627451, 1, 1,
0.4286098, 1.168068, 1.252453, 0, 0.08235294, 1, 1,
0.429911, -1.664812, 3.007934, 0, 0.07450981, 1, 1,
0.430518, 0.2717439, 2.180836, 0, 0.07058824, 1, 1,
0.4311523, 2.698591, 1.189526, 0, 0.0627451, 1, 1,
0.4317887, -0.06490348, 1.644145, 0, 0.05882353, 1, 1,
0.4359047, -0.7238519, 1.553818, 0, 0.05098039, 1, 1,
0.4397739, -0.04611342, 2.07892, 0, 0.04705882, 1, 1,
0.4400333, -0.01489623, 1.752053, 0, 0.03921569, 1, 1,
0.4405604, -0.9887295, 2.667891, 0, 0.03529412, 1, 1,
0.4423105, -2.995437, 1.992948, 0, 0.02745098, 1, 1,
0.442537, 0.3483415, 0.5265898, 0, 0.02352941, 1, 1,
0.4448949, 0.5877317, 1.522485, 0, 0.01568628, 1, 1,
0.4464265, 0.1703195, 2.712749, 0, 0.01176471, 1, 1,
0.4514847, 0.4543026, -0.6137679, 0, 0.003921569, 1, 1,
0.4527845, -1.419722, 2.803407, 0.003921569, 0, 1, 1,
0.4534197, -0.3531858, 3.32481, 0.007843138, 0, 1, 1,
0.4582775, 0.2811258, 0.2849568, 0.01568628, 0, 1, 1,
0.4631408, -0.1875536, 2.902456, 0.01960784, 0, 1, 1,
0.4654745, -1.694222, 2.012207, 0.02745098, 0, 1, 1,
0.4679308, -1.692371, 3.888442, 0.03137255, 0, 1, 1,
0.4685932, 0.1010429, 3.00148, 0.03921569, 0, 1, 1,
0.4700786, 0.1093659, 1.730609, 0.04313726, 0, 1, 1,
0.4757639, 0.06611546, 0.6951886, 0.05098039, 0, 1, 1,
0.4770925, 0.2328854, 0.1107126, 0.05490196, 0, 1, 1,
0.4808324, 0.06104634, 1.423852, 0.0627451, 0, 1, 1,
0.486439, -1.626315, 1.84282, 0.06666667, 0, 1, 1,
0.4864891, 1.469778, 0.07786129, 0.07450981, 0, 1, 1,
0.4881564, 1.474972, -0.03902602, 0.07843138, 0, 1, 1,
0.4894966, -0.2543732, 2.084146, 0.08627451, 0, 1, 1,
0.4964809, 1.19943, 0.6088539, 0.09019608, 0, 1, 1,
0.498526, -0.7493376, 2.452715, 0.09803922, 0, 1, 1,
0.5007107, 2.182125, -0.4258348, 0.1058824, 0, 1, 1,
0.5038012, -1.953264, 3.2363, 0.1098039, 0, 1, 1,
0.5082108, 1.332196, 0.01958104, 0.1176471, 0, 1, 1,
0.509382, 0.3401374, 0.5732148, 0.1215686, 0, 1, 1,
0.5133641, -0.8906972, 3.143048, 0.1294118, 0, 1, 1,
0.5192982, -0.07921324, 2.217215, 0.1333333, 0, 1, 1,
0.5290397, 1.927408, -0.2006665, 0.1411765, 0, 1, 1,
0.5298675, 0.0912307, 0.1809594, 0.145098, 0, 1, 1,
0.5302354, -0.6400309, 1.465403, 0.1529412, 0, 1, 1,
0.5304657, -0.1248591, 1.836304, 0.1568628, 0, 1, 1,
0.5341464, 0.03719719, 2.755101, 0.1647059, 0, 1, 1,
0.5347788, -1.557203, 1.94546, 0.1686275, 0, 1, 1,
0.536895, 0.811283, 0.7238928, 0.1764706, 0, 1, 1,
0.5393263, -0.8040616, 4.843609, 0.1803922, 0, 1, 1,
0.5438839, 0.6306027, 1.800811, 0.1882353, 0, 1, 1,
0.5463856, 0.7545838, 0.2680633, 0.1921569, 0, 1, 1,
0.5486016, -1.162178, 3.170262, 0.2, 0, 1, 1,
0.5489423, 1.120987, 1.985165, 0.2078431, 0, 1, 1,
0.5503498, -0.2133814, 2.811836, 0.2117647, 0, 1, 1,
0.5580906, 1.969751, 0.177622, 0.2196078, 0, 1, 1,
0.5622443, 0.1949285, 1.087072, 0.2235294, 0, 1, 1,
0.568059, -0.6842938, 2.642814, 0.2313726, 0, 1, 1,
0.5689961, 0.8766853, -0.2812629, 0.2352941, 0, 1, 1,
0.5690787, -0.2602585, 1.538773, 0.2431373, 0, 1, 1,
0.5763838, -0.6674079, 4.010922, 0.2470588, 0, 1, 1,
0.5798315, 0.04754051, 2.051639, 0.254902, 0, 1, 1,
0.5851626, 0.7154977, 1.955627, 0.2588235, 0, 1, 1,
0.5852611, 1.58291, -1.0531, 0.2666667, 0, 1, 1,
0.5908516, -1.128651, 3.213022, 0.2705882, 0, 1, 1,
0.6028679, -0.1777864, 0.6022577, 0.2784314, 0, 1, 1,
0.6043541, -0.1079899, 1.115093, 0.282353, 0, 1, 1,
0.6049314, 1.067149, 0.1489134, 0.2901961, 0, 1, 1,
0.6108203, -0.04082814, 3.758634, 0.2941177, 0, 1, 1,
0.6137874, 0.3417934, 1.704665, 0.3019608, 0, 1, 1,
0.6213529, 0.7763869, -0.883104, 0.3098039, 0, 1, 1,
0.6242077, 1.135227, 1.69906, 0.3137255, 0, 1, 1,
0.6263943, -0.4035453, 2.819729, 0.3215686, 0, 1, 1,
0.6296449, 0.4701244, 1.560584, 0.3254902, 0, 1, 1,
0.6357668, 1.957282, -0.04933026, 0.3333333, 0, 1, 1,
0.6378147, -1.18146, 2.77491, 0.3372549, 0, 1, 1,
0.6384485, -0.0494079, 2.035621, 0.345098, 0, 1, 1,
0.6416671, -1.289216, 3.117656, 0.3490196, 0, 1, 1,
0.6424805, 0.633289, 0.1313745, 0.3568628, 0, 1, 1,
0.6477951, 1.350182, 0.5536196, 0.3607843, 0, 1, 1,
0.6480772, 0.3598019, 1.397598, 0.3686275, 0, 1, 1,
0.6529856, 0.5856984, 1.01818, 0.372549, 0, 1, 1,
0.6548417, 2.030271, 0.5762656, 0.3803922, 0, 1, 1,
0.6552495, -0.06605913, 0.935129, 0.3843137, 0, 1, 1,
0.6590487, 0.8018076, 1.096989, 0.3921569, 0, 1, 1,
0.6602845, 0.8741608, 1.560868, 0.3960784, 0, 1, 1,
0.660296, 1.058453, 0.04194037, 0.4039216, 0, 1, 1,
0.6619357, -0.2982739, 1.453319, 0.4117647, 0, 1, 1,
0.66257, 0.2684952, 2.071046, 0.4156863, 0, 1, 1,
0.6666557, 0.009814939, 2.633871, 0.4235294, 0, 1, 1,
0.667184, 1.590233, -0.2359914, 0.427451, 0, 1, 1,
0.6749984, -0.5355729, 4.753732, 0.4352941, 0, 1, 1,
0.6765485, 0.6583926, 1.248686, 0.4392157, 0, 1, 1,
0.6792176, 0.09829459, 2.412228, 0.4470588, 0, 1, 1,
0.6875536, -0.655067, 3.078943, 0.4509804, 0, 1, 1,
0.6889817, 0.2897762, 2.539885, 0.4588235, 0, 1, 1,
0.693747, 0.2136733, 2.405692, 0.4627451, 0, 1, 1,
0.6938586, -0.1682916, 1.400344, 0.4705882, 0, 1, 1,
0.6951183, 1.106815, 0.9412293, 0.4745098, 0, 1, 1,
0.6964955, -0.3629769, 1.267673, 0.4823529, 0, 1, 1,
0.7020225, -0.6891034, 1.838763, 0.4862745, 0, 1, 1,
0.7025715, 1.201501, 3.284059, 0.4941176, 0, 1, 1,
0.7052106, -1.02926, 2.506153, 0.5019608, 0, 1, 1,
0.7072052, -1.623254, 3.324936, 0.5058824, 0, 1, 1,
0.7175187, -0.475623, 2.778585, 0.5137255, 0, 1, 1,
0.7202708, 0.6639693, 3.028903, 0.5176471, 0, 1, 1,
0.7230514, 0.1415655, 1.063025, 0.5254902, 0, 1, 1,
0.7261466, -0.2293208, 0.1544373, 0.5294118, 0, 1, 1,
0.7278167, 0.3777885, 0.02879413, 0.5372549, 0, 1, 1,
0.7281399, 1.888156, -0.1321163, 0.5411765, 0, 1, 1,
0.7287107, 0.391894, 2.767213, 0.5490196, 0, 1, 1,
0.7320778, -1.279767, 4.272944, 0.5529412, 0, 1, 1,
0.7325721, 0.8430394, -0.03854377, 0.5607843, 0, 1, 1,
0.7357612, -0.7660486, 0.9437075, 0.5647059, 0, 1, 1,
0.739976, -1.455, 1.272629, 0.572549, 0, 1, 1,
0.7403625, 0.9588813, 0.6481037, 0.5764706, 0, 1, 1,
0.7447007, -1.052056, 2.860293, 0.5843138, 0, 1, 1,
0.7455573, 0.6262317, 1.660683, 0.5882353, 0, 1, 1,
0.7456464, 0.402032, 0.9492336, 0.5960785, 0, 1, 1,
0.7473152, -1.046849, 2.471779, 0.6039216, 0, 1, 1,
0.7507188, 0.3472471, 0.7950925, 0.6078432, 0, 1, 1,
0.7528231, -0.5171781, 2.088704, 0.6156863, 0, 1, 1,
0.7545189, -1.332587, 2.519291, 0.6196079, 0, 1, 1,
0.7552009, 0.09988818, 2.085647, 0.627451, 0, 1, 1,
0.7566398, -0.9616134, 0.6799675, 0.6313726, 0, 1, 1,
0.757704, -0.1585197, 1.757445, 0.6392157, 0, 1, 1,
0.7579923, -0.4641678, 1.98515, 0.6431373, 0, 1, 1,
0.7598746, 0.673565, -1.677829, 0.6509804, 0, 1, 1,
0.7602369, -0.6284296, 3.712489, 0.654902, 0, 1, 1,
0.7634242, 1.888858, 0.6354994, 0.6627451, 0, 1, 1,
0.7637014, -0.5723819, 1.0612, 0.6666667, 0, 1, 1,
0.7653158, 0.9664957, -0.650902, 0.6745098, 0, 1, 1,
0.7699958, -0.2348533, 1.475903, 0.6784314, 0, 1, 1,
0.7725961, 2.427594, 0.4624879, 0.6862745, 0, 1, 1,
0.7743827, -0.9212056, 3.556218, 0.6901961, 0, 1, 1,
0.7753999, -1.099947, 4.043295, 0.6980392, 0, 1, 1,
0.7803623, 0.8625369, 1.370105, 0.7058824, 0, 1, 1,
0.7835621, 1.155405, 0.7719215, 0.7098039, 0, 1, 1,
0.7838519, -0.8426521, 1.977417, 0.7176471, 0, 1, 1,
0.7842836, 0.5219805, 1.666969, 0.7215686, 0, 1, 1,
0.7860398, -0.749386, 2.149892, 0.7294118, 0, 1, 1,
0.786379, -0.3918678, 2.394511, 0.7333333, 0, 1, 1,
0.7945271, -0.3413666, 2.013029, 0.7411765, 0, 1, 1,
0.7947332, -0.2949107, 3.071738, 0.7450981, 0, 1, 1,
0.7984949, 0.912904, 0.3768604, 0.7529412, 0, 1, 1,
0.8010728, -0.6117212, 2.073314, 0.7568628, 0, 1, 1,
0.8100757, -0.4263351, 1.974394, 0.7647059, 0, 1, 1,
0.8114297, -0.3196583, 2.625833, 0.7686275, 0, 1, 1,
0.8136947, 0.211712, 1.760214, 0.7764706, 0, 1, 1,
0.8153642, 0.6282547, 0.418262, 0.7803922, 0, 1, 1,
0.8231136, 0.4013179, 2.398315, 0.7882353, 0, 1, 1,
0.8236296, -0.955909, 2.474367, 0.7921569, 0, 1, 1,
0.8269646, 0.8019042, 1.588767, 0.8, 0, 1, 1,
0.8288863, 1.030321, 0.09843411, 0.8078431, 0, 1, 1,
0.8298661, 2.173198, -0.177805, 0.8117647, 0, 1, 1,
0.8332248, -0.7626536, 2.546629, 0.8196079, 0, 1, 1,
0.8369274, 0.2553568, 2.08627, 0.8235294, 0, 1, 1,
0.847958, 0.8952829, 2.196128, 0.8313726, 0, 1, 1,
0.8539262, -0.7585589, 1.439007, 0.8352941, 0, 1, 1,
0.8601714, 0.09684099, 1.721748, 0.8431373, 0, 1, 1,
0.8647944, -2.013766, 2.915074, 0.8470588, 0, 1, 1,
0.866621, -0.03070832, 0.2157109, 0.854902, 0, 1, 1,
0.8770106, -1.560557, 2.975002, 0.8588235, 0, 1, 1,
0.8820332, -0.5330153, 2.716247, 0.8666667, 0, 1, 1,
0.882399, 0.9288625, 1.038457, 0.8705882, 0, 1, 1,
0.8847498, -1.430098, 4.601906, 0.8784314, 0, 1, 1,
0.8888637, -0.6538001, 2.468138, 0.8823529, 0, 1, 1,
0.8892354, -0.9104826, 3.791054, 0.8901961, 0, 1, 1,
0.8895685, 1.192777, 0.9070527, 0.8941177, 0, 1, 1,
0.8943985, 0.273899, 2.811008, 0.9019608, 0, 1, 1,
0.896597, 0.795345, 2.172618, 0.9098039, 0, 1, 1,
0.8968591, -1.292213, 1.216977, 0.9137255, 0, 1, 1,
0.9003807, -0.05368036, 1.66319, 0.9215686, 0, 1, 1,
0.9032829, 1.072482, -0.7440495, 0.9254902, 0, 1, 1,
0.9060335, -0.9552481, 2.088879, 0.9333333, 0, 1, 1,
0.9073, 1.215829, 0.9213545, 0.9372549, 0, 1, 1,
0.9155133, -2.284647, 3.804439, 0.945098, 0, 1, 1,
0.9196418, -1.243593, 2.103944, 0.9490196, 0, 1, 1,
0.9224973, -0.1919889, 3.931696, 0.9568627, 0, 1, 1,
0.9254925, 0.923444, 1.608401, 0.9607843, 0, 1, 1,
0.927355, -0.6224809, 0.4353432, 0.9686275, 0, 1, 1,
0.9278439, -0.06154964, 4.201064, 0.972549, 0, 1, 1,
0.9292154, -0.4263133, 3.223282, 0.9803922, 0, 1, 1,
0.9297546, 0.1005566, -1.209702, 0.9843137, 0, 1, 1,
0.937471, -0.1851092, 1.775522, 0.9921569, 0, 1, 1,
0.9383293, -0.9847671, 2.646341, 0.9960784, 0, 1, 1,
0.9404027, 0.3315958, -0.3415812, 1, 0, 0.9960784, 1,
0.94446, -0.9958982, 2.660118, 1, 0, 0.9882353, 1,
0.9461445, 0.9525317, 0.5342766, 1, 0, 0.9843137, 1,
0.9479108, -0.1235394, 2.633408, 1, 0, 0.9764706, 1,
0.9504972, 0.7068338, 1.211036, 1, 0, 0.972549, 1,
0.9516021, 1.578449, -0.8125919, 1, 0, 0.9647059, 1,
0.9520175, -0.07103284, 1.905422, 1, 0, 0.9607843, 1,
0.9530711, 1.221409, 1.231589, 1, 0, 0.9529412, 1,
0.9569033, 2.234733, 0.4408871, 1, 0, 0.9490196, 1,
0.9624378, 1.718785, 2.411994, 1, 0, 0.9411765, 1,
0.9641941, -0.1009943, 2.733172, 1, 0, 0.9372549, 1,
0.9643763, 0.2743539, 2.882396, 1, 0, 0.9294118, 1,
0.964647, 0.549628, -0.5367841, 1, 0, 0.9254902, 1,
0.9657087, 0.7750972, 1.906407, 1, 0, 0.9176471, 1,
0.9730034, -1.015655, 3.633382, 1, 0, 0.9137255, 1,
0.9820694, 1.032818, 3.104206, 1, 0, 0.9058824, 1,
0.9889407, -0.1109816, -0.9153265, 1, 0, 0.9019608, 1,
0.9897218, 0.3767781, 1.126588, 1, 0, 0.8941177, 1,
0.9966916, -0.4753264, 2.715407, 1, 0, 0.8862745, 1,
0.9981945, 0.3031889, 0.5437814, 1, 0, 0.8823529, 1,
0.998198, -2.226833, 3.557707, 1, 0, 0.8745098, 1,
0.9993213, -0.4054376, 0.8658703, 1, 0, 0.8705882, 1,
1.007657, 0.2446652, 2.541531, 1, 0, 0.8627451, 1,
1.01041, -0.32903, 2.265601, 1, 0, 0.8588235, 1,
1.010729, 1.292047, 1.151801, 1, 0, 0.8509804, 1,
1.01229, 0.9370121, 1.068208, 1, 0, 0.8470588, 1,
1.013432, 0.4792058, 0.909016, 1, 0, 0.8392157, 1,
1.0192, -2.223922, 3.895036, 1, 0, 0.8352941, 1,
1.020155, -1.150688, 0.5928363, 1, 0, 0.827451, 1,
1.020756, -1.054177, 1.91334, 1, 0, 0.8235294, 1,
1.02265, 1.025127, 0.6076546, 1, 0, 0.8156863, 1,
1.028634, 0.1774157, 2.378758, 1, 0, 0.8117647, 1,
1.031608, 0.1999939, -0.2429598, 1, 0, 0.8039216, 1,
1.033935, 0.6299508, 2.16684, 1, 0, 0.7960784, 1,
1.03544, 0.8935117, 1.789876, 1, 0, 0.7921569, 1,
1.048091, -0.5371252, 1.714503, 1, 0, 0.7843137, 1,
1.050551, -0.2335653, 1.484049, 1, 0, 0.7803922, 1,
1.055675, -1.136613, 3.118435, 1, 0, 0.772549, 1,
1.056114, 1.187166, -0.03321193, 1, 0, 0.7686275, 1,
1.06363, -1.998639, 2.344589, 1, 0, 0.7607843, 1,
1.066799, -0.6263231, 2.683535, 1, 0, 0.7568628, 1,
1.073193, 0.8117584, 1.638657, 1, 0, 0.7490196, 1,
1.076264, 0.1338232, 3.079653, 1, 0, 0.7450981, 1,
1.081345, -0.3537765, 0.1346823, 1, 0, 0.7372549, 1,
1.081831, -0.8670758, 1.844317, 1, 0, 0.7333333, 1,
1.083058, 0.4604674, 0.8598856, 1, 0, 0.7254902, 1,
1.099748, 0.05691886, 1.002968, 1, 0, 0.7215686, 1,
1.103431, -1.134623, 0.8134555, 1, 0, 0.7137255, 1,
1.103668, -0.7895157, 2.74312, 1, 0, 0.7098039, 1,
1.120597, 1.924144, -1.053646, 1, 0, 0.7019608, 1,
1.121985, 1.573184, -1.572365, 1, 0, 0.6941177, 1,
1.12957, 1.510937, 0.7277111, 1, 0, 0.6901961, 1,
1.134749, -0.2810691, 2.37261, 1, 0, 0.682353, 1,
1.151259, -1.690859, 3.1171, 1, 0, 0.6784314, 1,
1.153068, 1.14859, -1.303456, 1, 0, 0.6705883, 1,
1.163248, -0.754242, 3.701479, 1, 0, 0.6666667, 1,
1.164286, -0.6181254, 2.508725, 1, 0, 0.6588235, 1,
1.167618, 1.383935, -2.307534, 1, 0, 0.654902, 1,
1.17493, 0.2593535, -0.2704912, 1, 0, 0.6470588, 1,
1.17799, -1.735366, 3.156211, 1, 0, 0.6431373, 1,
1.178033, 0.09792604, 3.127446, 1, 0, 0.6352941, 1,
1.178547, 0.7794011, 0.7571656, 1, 0, 0.6313726, 1,
1.180337, 0.6186481, 2.492031, 1, 0, 0.6235294, 1,
1.18573, -0.1746908, 0.4444255, 1, 0, 0.6196079, 1,
1.186931, -2.488314, 2.417405, 1, 0, 0.6117647, 1,
1.188919, -0.1996475, 0.3577445, 1, 0, 0.6078432, 1,
1.188934, 0.3758949, 0.2252426, 1, 0, 0.6, 1,
1.20582, -0.466368, 0.607767, 1, 0, 0.5921569, 1,
1.224618, 1.871971, -0.5254011, 1, 0, 0.5882353, 1,
1.248323, -0.1049378, 2.358743, 1, 0, 0.5803922, 1,
1.248611, -0.00718718, 2.252652, 1, 0, 0.5764706, 1,
1.253181, -2.591363, 4.18982, 1, 0, 0.5686275, 1,
1.26165, 1.388598, 2.19509, 1, 0, 0.5647059, 1,
1.269041, -0.2705423, 3.237023, 1, 0, 0.5568628, 1,
1.27173, 0.9300541, -0.6160632, 1, 0, 0.5529412, 1,
1.272918, -0.7870542, 2.39942, 1, 0, 0.5450981, 1,
1.273811, -0.9276241, 1.720609, 1, 0, 0.5411765, 1,
1.276611, 1.782276, 0.3777931, 1, 0, 0.5333334, 1,
1.277053, 0.317692, 2.113446, 1, 0, 0.5294118, 1,
1.283183, 0.4501112, 2.287529, 1, 0, 0.5215687, 1,
1.287082, -0.0484729, 2.313534, 1, 0, 0.5176471, 1,
1.287298, -0.5852268, 2.821238, 1, 0, 0.509804, 1,
1.306722, 0.9063824, -0.4128329, 1, 0, 0.5058824, 1,
1.309492, -2.30527, 3.22875, 1, 0, 0.4980392, 1,
1.311839, -0.9274694, 1.608038, 1, 0, 0.4901961, 1,
1.319927, -1.210882, 2.5746, 1, 0, 0.4862745, 1,
1.32558, 2.308216, 1.538458, 1, 0, 0.4784314, 1,
1.328819, 0.1601055, 2.51137, 1, 0, 0.4745098, 1,
1.343575, -0.8909054, -0.8656038, 1, 0, 0.4666667, 1,
1.346452, -0.05501808, 1.556292, 1, 0, 0.4627451, 1,
1.347098, 0.3561061, 1.95781, 1, 0, 0.454902, 1,
1.353726, -1.480606, 2.235495, 1, 0, 0.4509804, 1,
1.358239, 0.5622756, 0.7034559, 1, 0, 0.4431373, 1,
1.361637, 1.042108, -0.7327685, 1, 0, 0.4392157, 1,
1.37222, 1.044688, -0.01377039, 1, 0, 0.4313726, 1,
1.375015, 0.9010516, 1.398158, 1, 0, 0.427451, 1,
1.375863, 1.868845, 1.570279, 1, 0, 0.4196078, 1,
1.384849, -1.209141, 2.211875, 1, 0, 0.4156863, 1,
1.389649, -0.4513586, 0.01245347, 1, 0, 0.4078431, 1,
1.402218, -0.3945382, 1.538735, 1, 0, 0.4039216, 1,
1.411331, 0.6364212, 0.9889445, 1, 0, 0.3960784, 1,
1.416319, 0.06174488, 1.673248, 1, 0, 0.3882353, 1,
1.422966, -0.1058185, 1.364207, 1, 0, 0.3843137, 1,
1.429525, 1.01543, 0.07850732, 1, 0, 0.3764706, 1,
1.429718, -0.3315246, 2.621272, 1, 0, 0.372549, 1,
1.442561, 0.1565141, 2.924919, 1, 0, 0.3647059, 1,
1.468289, -0.3287345, 2.35476, 1, 0, 0.3607843, 1,
1.485994, 0.284299, 1.458491, 1, 0, 0.3529412, 1,
1.505656, -0.4846255, 1.736036, 1, 0, 0.3490196, 1,
1.506306, 0.734637, 0.7169754, 1, 0, 0.3411765, 1,
1.53484, 1.187571, 0.6120589, 1, 0, 0.3372549, 1,
1.55705, -0.1485901, 0.7574073, 1, 0, 0.3294118, 1,
1.560006, 1.19129, -1.891301, 1, 0, 0.3254902, 1,
1.563869, -0.4097351, 1.423416, 1, 0, 0.3176471, 1,
1.56774, 1.398349, 0.3969776, 1, 0, 0.3137255, 1,
1.571238, 0.03814974, 0.9755888, 1, 0, 0.3058824, 1,
1.614851, 1.202997, 1.238857, 1, 0, 0.2980392, 1,
1.619466, -0.217837, 2.347178, 1, 0, 0.2941177, 1,
1.63516, -0.409759, 2.700396, 1, 0, 0.2862745, 1,
1.647464, -0.2234285, 0.5166647, 1, 0, 0.282353, 1,
1.65565, 2.021965, -1.096286, 1, 0, 0.2745098, 1,
1.662363, -1.381734, 1.500177, 1, 0, 0.2705882, 1,
1.682765, -0.5345721, 3.199358, 1, 0, 0.2627451, 1,
1.687638, -0.6434516, 1.422312, 1, 0, 0.2588235, 1,
1.690183, 0.8888717, 0.02609184, 1, 0, 0.2509804, 1,
1.696663, -1.01726, 2.711694, 1, 0, 0.2470588, 1,
1.697965, 0.8207242, 1.877032, 1, 0, 0.2392157, 1,
1.702574, 1.037671, 1.875934, 1, 0, 0.2352941, 1,
1.726322, 1.058173, 0.2688413, 1, 0, 0.227451, 1,
1.727232, 1.096421, 0.6553056, 1, 0, 0.2235294, 1,
1.729572, -0.9491994, 1.904185, 1, 0, 0.2156863, 1,
1.735456, 1.81806, 1.266876, 1, 0, 0.2117647, 1,
1.750368, 0.2309548, 0.982584, 1, 0, 0.2039216, 1,
1.771791, -0.1369455, 2.969984, 1, 0, 0.1960784, 1,
1.806785, -0.2052218, 1.844644, 1, 0, 0.1921569, 1,
1.844158, -0.2923699, -1.289499, 1, 0, 0.1843137, 1,
1.852498, -1.598793, 1.867197, 1, 0, 0.1803922, 1,
1.861591, -1.066442, 0.8045114, 1, 0, 0.172549, 1,
1.871432, -0.5543894, 3.349879, 1, 0, 0.1686275, 1,
1.880636, -1.298245, 2.642919, 1, 0, 0.1607843, 1,
1.889946, -0.4394901, 2.518586, 1, 0, 0.1568628, 1,
1.912738, 0.7559332, 0.2384693, 1, 0, 0.1490196, 1,
1.914057, 0.1444924, 2.573204, 1, 0, 0.145098, 1,
1.928156, -1.388461, 2.33998, 1, 0, 0.1372549, 1,
2.046994, 0.3866939, 1.122613, 1, 0, 0.1333333, 1,
2.058119, -0.1734369, 3.00866, 1, 0, 0.1254902, 1,
2.059278, 0.6680157, 0.3302044, 1, 0, 0.1215686, 1,
2.080482, -0.9654617, -0.07570187, 1, 0, 0.1137255, 1,
2.181544, 0.5409951, -0.2739601, 1, 0, 0.1098039, 1,
2.254687, -0.3867473, 2.001689, 1, 0, 0.1019608, 1,
2.32231, -1.160215, 1.781298, 1, 0, 0.09411765, 1,
2.339508, 1.65635, -0.1899825, 1, 0, 0.09019608, 1,
2.354256, 0.7749159, 0.5443231, 1, 0, 0.08235294, 1,
2.364707, -1.895869, 2.461984, 1, 0, 0.07843138, 1,
2.424576, 0.4495308, 2.008462, 1, 0, 0.07058824, 1,
2.480008, -0.4014149, 1.969892, 1, 0, 0.06666667, 1,
2.494908, -1.901035, 1.310522, 1, 0, 0.05882353, 1,
2.500518, -0.437999, 2.776487, 1, 0, 0.05490196, 1,
2.556492, -0.08093967, 2.569041, 1, 0, 0.04705882, 1,
2.576162, -1.354709, 0.8889596, 1, 0, 0.04313726, 1,
2.604676, 0.5605639, 2.136701, 1, 0, 0.03529412, 1,
2.678921, -0.0259085, 0.60177, 1, 0, 0.03137255, 1,
2.881733, 2.643525, 0.2291196, 1, 0, 0.02352941, 1,
3.022636, -1.402088, 2.510431, 1, 0, 0.01960784, 1,
3.189775, -1.665976, 1.997653, 1, 0, 0.01176471, 1,
3.249748, -0.1483224, 1.189566, 1, 0, 0.007843138, 1
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
0.04251802, -4.087586, -7.071727, 0, -0.5, 0.5, 0.5,
0.04251802, -4.087586, -7.071727, 1, -0.5, 0.5, 0.5,
0.04251802, -4.087586, -7.071727, 1, 1.5, 0.5, 0.5,
0.04251802, -4.087586, -7.071727, 0, 1.5, 0.5, 0.5
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
-4.251963, 0.2262415, -7.071727, 0, -0.5, 0.5, 0.5,
-4.251963, 0.2262415, -7.071727, 1, -0.5, 0.5, 0.5,
-4.251963, 0.2262415, -7.071727, 1, 1.5, 0.5, 0.5,
-4.251963, 0.2262415, -7.071727, 0, 1.5, 0.5, 0.5
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
-4.251963, -4.087586, -0.02643037, 0, -0.5, 0.5, 0.5,
-4.251963, -4.087586, -0.02643037, 1, -0.5, 0.5, 0.5,
-4.251963, -4.087586, -0.02643037, 1, 1.5, 0.5, 0.5,
-4.251963, -4.087586, -0.02643037, 0, 1.5, 0.5, 0.5
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
-3, -3.092088, -5.445889,
3, -3.092088, -5.445889,
-3, -3.092088, -5.445889,
-3, -3.258004, -5.716862,
-2, -3.092088, -5.445889,
-2, -3.258004, -5.716862,
-1, -3.092088, -5.445889,
-1, -3.258004, -5.716862,
0, -3.092088, -5.445889,
0, -3.258004, -5.716862,
1, -3.092088, -5.445889,
1, -3.258004, -5.716862,
2, -3.092088, -5.445889,
2, -3.258004, -5.716862,
3, -3.092088, -5.445889,
3, -3.258004, -5.716862
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
-3, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
-3, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
-3, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
-3, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
-2, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
-2, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
-2, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
-2, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
-1, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
-1, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
-1, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
-1, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
0, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
0, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
0, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
0, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
1, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
1, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
1, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
1, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
2, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
2, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
2, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
2, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5,
3, -3.589837, -6.258808, 0, -0.5, 0.5, 0.5,
3, -3.589837, -6.258808, 1, -0.5, 0.5, 0.5,
3, -3.589837, -6.258808, 1, 1.5, 0.5, 0.5,
3, -3.589837, -6.258808, 0, 1.5, 0.5, 0.5
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
-3.260929, -2, -5.445889,
-3.260929, 3, -5.445889,
-3.260929, -2, -5.445889,
-3.426101, -2, -5.716862,
-3.260929, -1, -5.445889,
-3.426101, -1, -5.716862,
-3.260929, 0, -5.445889,
-3.426101, 0, -5.716862,
-3.260929, 1, -5.445889,
-3.426101, 1, -5.716862,
-3.260929, 2, -5.445889,
-3.426101, 2, -5.716862,
-3.260929, 3, -5.445889,
-3.426101, 3, -5.716862
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
-3.756446, -2, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, -2, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, -2, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, -2, -6.258808, 0, 1.5, 0.5, 0.5,
-3.756446, -1, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, -1, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, -1, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, -1, -6.258808, 0, 1.5, 0.5, 0.5,
-3.756446, 0, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, 0, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, 0, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, 0, -6.258808, 0, 1.5, 0.5, 0.5,
-3.756446, 1, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, 1, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, 1, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, 1, -6.258808, 0, 1.5, 0.5, 0.5,
-3.756446, 2, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, 2, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, 2, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, 2, -6.258808, 0, 1.5, 0.5, 0.5,
-3.756446, 3, -6.258808, 0, -0.5, 0.5, 0.5,
-3.756446, 3, -6.258808, 1, -0.5, 0.5, 0.5,
-3.756446, 3, -6.258808, 1, 1.5, 0.5, 0.5,
-3.756446, 3, -6.258808, 0, 1.5, 0.5, 0.5
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
-3.260929, -3.092088, -4,
-3.260929, -3.092088, 4,
-3.260929, -3.092088, -4,
-3.426101, -3.258004, -4,
-3.260929, -3.092088, -2,
-3.426101, -3.258004, -2,
-3.260929, -3.092088, 0,
-3.426101, -3.258004, 0,
-3.260929, -3.092088, 2,
-3.426101, -3.258004, 2,
-3.260929, -3.092088, 4,
-3.426101, -3.258004, 4
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
-3.756446, -3.589837, -4, 0, -0.5, 0.5, 0.5,
-3.756446, -3.589837, -4, 1, -0.5, 0.5, 0.5,
-3.756446, -3.589837, -4, 1, 1.5, 0.5, 0.5,
-3.756446, -3.589837, -4, 0, 1.5, 0.5, 0.5,
-3.756446, -3.589837, -2, 0, -0.5, 0.5, 0.5,
-3.756446, -3.589837, -2, 1, -0.5, 0.5, 0.5,
-3.756446, -3.589837, -2, 1, 1.5, 0.5, 0.5,
-3.756446, -3.589837, -2, 0, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 0, 0, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 0, 1, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 0, 1, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 0, 0, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 2, 0, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 2, 1, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 2, 1, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 2, 0, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 4, 0, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 4, 1, -0.5, 0.5, 0.5,
-3.756446, -3.589837, 4, 1, 1.5, 0.5, 0.5,
-3.756446, -3.589837, 4, 0, 1.5, 0.5, 0.5
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
-3.260929, -3.092088, -5.445889,
-3.260929, 3.544571, -5.445889,
-3.260929, -3.092088, 5.393029,
-3.260929, 3.544571, 5.393029,
-3.260929, -3.092088, -5.445889,
-3.260929, -3.092088, 5.393029,
-3.260929, 3.544571, -5.445889,
-3.260929, 3.544571, 5.393029,
-3.260929, -3.092088, -5.445889,
3.345965, -3.092088, -5.445889,
-3.260929, -3.092088, 5.393029,
3.345965, -3.092088, 5.393029,
-3.260929, 3.544571, -5.445889,
3.345965, 3.544571, -5.445889,
-3.260929, 3.544571, 5.393029,
3.345965, 3.544571, 5.393029,
3.345965, -3.092088, -5.445889,
3.345965, 3.544571, -5.445889,
3.345965, -3.092088, 5.393029,
3.345965, 3.544571, 5.393029,
3.345965, -3.092088, -5.445889,
3.345965, -3.092088, 5.393029,
3.345965, 3.544571, -5.445889,
3.345965, 3.544571, 5.393029
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
var radius = 7.648765;
var distance = 34.03022;
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
mvMatrix.translate( -0.04251802, -0.2262415, 0.02643037 );
mvMatrix.scale( 1.251722, 1.246108, 0.7629908 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03022);
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
arsenate_lead_arsena<-read.table("arsenate_lead_arsena.xyz", skip=1)
x<-arsenate_lead_arsena$V2
y<-arsenate_lead_arsena$V3
z<-arsenate_lead_arsena$V4
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
5, 7, 2, 0, 0, 1, 1, 1,
1, 2, 1, 1, 0, 0, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
1, 3, 1, 1, 0, 0, 1, 1,
3, 1, 1, 1, 0, 0, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
4, 1, 1, 0, 0, 0, 1, 1,
1, 6, 1, 0, 0, 0, 1, 1,
1, 5, 1, 0, 0, 0, 1, 1,
1, 4, 1, 0, 0, 0, 1, 1,
3, 5, 1, 0, 0, 0, 1, 1,
2, 5, 1, 0, 0, 0, 1, 1
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
var radius = 5.742169;
var distance = 20.16912;
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
mvMatrix.translate( -3, -4, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -20.16912);
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
for (var i = 0; i < 12; i++) {
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
