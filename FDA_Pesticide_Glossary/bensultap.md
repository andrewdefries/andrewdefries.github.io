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
-3.056769, -0.8834374, -0.5824242, 1, 0, 0, 1,
-3.013434, 0.7115226, -2.495544, 1, 0.007843138, 0, 1,
-2.729001, -1.163836, -1.775226, 1, 0.01176471, 0, 1,
-2.699747, 1.665676, -0.8321931, 1, 0.01960784, 0, 1,
-2.548569, -0.804031, -2.019298, 1, 0.02352941, 0, 1,
-2.236732, 0.02900575, -0.4983378, 1, 0.03137255, 0, 1,
-2.218768, 0.9231685, -2.282387, 1, 0.03529412, 0, 1,
-2.08871, -1.233423, -2.350391, 1, 0.04313726, 0, 1,
-2.041281, -1.573402, -2.506656, 1, 0.04705882, 0, 1,
-2.010921, 0.05973725, -1.753323, 1, 0.05490196, 0, 1,
-2.009384, 1.977507, 0.7298981, 1, 0.05882353, 0, 1,
-2.000458, -0.7386049, -1.266657, 1, 0.06666667, 0, 1,
-1.994519, -0.5625266, -1.532882, 1, 0.07058824, 0, 1,
-1.993514, -0.8703523, -2.179278, 1, 0.07843138, 0, 1,
-1.98165, 0.6810375, -1.857045, 1, 0.08235294, 0, 1,
-1.969108, 1.966336, -1.133563, 1, 0.09019608, 0, 1,
-1.96358, 1.54829, -2.23377, 1, 0.09411765, 0, 1,
-1.941076, 0.6690078, -2.167473, 1, 0.1019608, 0, 1,
-1.939473, 0.5517638, 0.2348245, 1, 0.1098039, 0, 1,
-1.924008, 0.2496322, -1.666934, 1, 0.1137255, 0, 1,
-1.904114, -0.9901922, -3.217115, 1, 0.1215686, 0, 1,
-1.878901, -2.482539, -1.677623, 1, 0.1254902, 0, 1,
-1.874194, -0.134026, -4.624654, 1, 0.1333333, 0, 1,
-1.86894, 0.4343763, -0.07261243, 1, 0.1372549, 0, 1,
-1.867869, 0.1204622, -0.6715008, 1, 0.145098, 0, 1,
-1.864771, 0.2255212, -0.2864346, 1, 0.1490196, 0, 1,
-1.859986, 1.133306, 0.2986868, 1, 0.1568628, 0, 1,
-1.859685, 0.5952893, -0.7233728, 1, 0.1607843, 0, 1,
-1.847363, 0.1357562, -3.130982, 1, 0.1686275, 0, 1,
-1.829987, 1.286597, -3.754237, 1, 0.172549, 0, 1,
-1.829852, 0.1560125, -0.1962415, 1, 0.1803922, 0, 1,
-1.763337, 0.9619788, -0.7408257, 1, 0.1843137, 0, 1,
-1.76053, -0.7482061, -2.047523, 1, 0.1921569, 0, 1,
-1.756135, -0.9819814, -1.750673, 1, 0.1960784, 0, 1,
-1.751764, -1.234631, -1.25158, 1, 0.2039216, 0, 1,
-1.743138, -0.407983, -2.438694, 1, 0.2117647, 0, 1,
-1.737401, 0.7970311, -1.949295, 1, 0.2156863, 0, 1,
-1.705686, 1.116976, -1.259002, 1, 0.2235294, 0, 1,
-1.688222, 0.8722146, 0.2241079, 1, 0.227451, 0, 1,
-1.674626, 1.29736, 0.6697871, 1, 0.2352941, 0, 1,
-1.663725, -0.3171008, -3.416279, 1, 0.2392157, 0, 1,
-1.61205, 0.6640046, -1.014871, 1, 0.2470588, 0, 1,
-1.607568, 0.4876757, -1.706358, 1, 0.2509804, 0, 1,
-1.604974, 0.9965069, -1.645918, 1, 0.2588235, 0, 1,
-1.589548, -0.8727756, -2.609283, 1, 0.2627451, 0, 1,
-1.58579, 0.7617307, -1.621828, 1, 0.2705882, 0, 1,
-1.573567, 0.27993, -1.557121, 1, 0.2745098, 0, 1,
-1.572968, -1.427364, -2.471398, 1, 0.282353, 0, 1,
-1.57149, -1.644637, -2.726528, 1, 0.2862745, 0, 1,
-1.569333, -0.2873257, -0.7255918, 1, 0.2941177, 0, 1,
-1.565407, 1.838274, -1.450757, 1, 0.3019608, 0, 1,
-1.546011, 0.46037, -2.30801, 1, 0.3058824, 0, 1,
-1.544425, -0.2847446, -4.493069, 1, 0.3137255, 0, 1,
-1.526819, -0.3858494, -0.7424728, 1, 0.3176471, 0, 1,
-1.52515, 1.109725, -0.3609325, 1, 0.3254902, 0, 1,
-1.510626, 0.4723647, -1.733566, 1, 0.3294118, 0, 1,
-1.508699, -1.336234, -2.433653, 1, 0.3372549, 0, 1,
-1.486301, -0.1570699, -2.350236, 1, 0.3411765, 0, 1,
-1.484554, -1.871137, -2.515724, 1, 0.3490196, 0, 1,
-1.475159, -0.8684583, -0.5081265, 1, 0.3529412, 0, 1,
-1.469767, 0.1852052, -2.22327, 1, 0.3607843, 0, 1,
-1.45662, 1.075034, -1.203432, 1, 0.3647059, 0, 1,
-1.441284, -1.018495, -2.044325, 1, 0.372549, 0, 1,
-1.437999, 0.0107569, -1.719911, 1, 0.3764706, 0, 1,
-1.437685, 1.078279, -0.4016635, 1, 0.3843137, 0, 1,
-1.432249, 0.6543699, -1.921224, 1, 0.3882353, 0, 1,
-1.424953, -0.9234666, -1.674058, 1, 0.3960784, 0, 1,
-1.42344, -1.977717, -1.607372, 1, 0.4039216, 0, 1,
-1.417324, -0.8179018, -3.309129, 1, 0.4078431, 0, 1,
-1.410998, 0.8675298, -1.019974, 1, 0.4156863, 0, 1,
-1.410501, 1.042513, -0.2084288, 1, 0.4196078, 0, 1,
-1.39992, -0.120815, -0.9862583, 1, 0.427451, 0, 1,
-1.399655, 1.625053, -1.095463, 1, 0.4313726, 0, 1,
-1.397501, -1.008296, -2.118115, 1, 0.4392157, 0, 1,
-1.394414, 0.9688413, -1.196439, 1, 0.4431373, 0, 1,
-1.393212, -0.5600458, -3.519532, 1, 0.4509804, 0, 1,
-1.390954, -0.5123186, 1.45401, 1, 0.454902, 0, 1,
-1.385987, -1.159576, -3.068971, 1, 0.4627451, 0, 1,
-1.382649, 0.1640605, -1.850792, 1, 0.4666667, 0, 1,
-1.377695, -0.3539567, -3.304575, 1, 0.4745098, 0, 1,
-1.373411, -0.4143736, -3.677963, 1, 0.4784314, 0, 1,
-1.347953, -0.9261231, -1.168144, 1, 0.4862745, 0, 1,
-1.344061, 1.979066, -0.1495593, 1, 0.4901961, 0, 1,
-1.330142, -0.3994848, -0.3735108, 1, 0.4980392, 0, 1,
-1.328636, 0.7482877, -0.5592865, 1, 0.5058824, 0, 1,
-1.327254, 0.2961949, -0.9566919, 1, 0.509804, 0, 1,
-1.321477, 0.4483678, -0.8038559, 1, 0.5176471, 0, 1,
-1.319514, -0.7760061, -1.819903, 1, 0.5215687, 0, 1,
-1.311819, -0.7749211, -2.271116, 1, 0.5294118, 0, 1,
-1.311103, 0.3021002, 0.2667136, 1, 0.5333334, 0, 1,
-1.303078, -1.031979, -1.320587, 1, 0.5411765, 0, 1,
-1.293471, 1.919845, 1.024942, 1, 0.5450981, 0, 1,
-1.287978, 2.200372, 0.3030608, 1, 0.5529412, 0, 1,
-1.282423, 0.875574, -1.650989, 1, 0.5568628, 0, 1,
-1.2694, -0.05288839, 0.8775709, 1, 0.5647059, 0, 1,
-1.268346, -0.555084, -3.199128, 1, 0.5686275, 0, 1,
-1.261241, -0.1723714, -0.8689626, 1, 0.5764706, 0, 1,
-1.25673, -1.1835, -1.631823, 1, 0.5803922, 0, 1,
-1.251716, 0.8846824, -1.362427, 1, 0.5882353, 0, 1,
-1.248157, 0.6878976, -0.1541802, 1, 0.5921569, 0, 1,
-1.24223, -0.4966375, -1.462684, 1, 0.6, 0, 1,
-1.240094, -0.6018251, -1.104627, 1, 0.6078432, 0, 1,
-1.237932, 1.129457, -0.8433708, 1, 0.6117647, 0, 1,
-1.236754, -1.641782, -1.254858, 1, 0.6196079, 0, 1,
-1.234557, -1.751479, -1.917807, 1, 0.6235294, 0, 1,
-1.231953, 0.7935303, -2.007024, 1, 0.6313726, 0, 1,
-1.231138, -0.05297105, -3.832187, 1, 0.6352941, 0, 1,
-1.213733, 1.954193, -1.782088, 1, 0.6431373, 0, 1,
-1.208683, 0.9445366, -0.7788211, 1, 0.6470588, 0, 1,
-1.20864, -0.1684017, -1.907015, 1, 0.654902, 0, 1,
-1.207498, 1.763109, -1.386634, 1, 0.6588235, 0, 1,
-1.206368, -0.3018604, -1.675201, 1, 0.6666667, 0, 1,
-1.199929, -0.2580093, -1.193554, 1, 0.6705883, 0, 1,
-1.198337, -0.4909283, -0.6116992, 1, 0.6784314, 0, 1,
-1.191055, 1.380852, -0.09835692, 1, 0.682353, 0, 1,
-1.190328, 0.5665075, -1.853997, 1, 0.6901961, 0, 1,
-1.186127, 1.051563, -1.556088, 1, 0.6941177, 0, 1,
-1.185684, 1.611546, 1.909443, 1, 0.7019608, 0, 1,
-1.177781, 0.2187944, -1.182079, 1, 0.7098039, 0, 1,
-1.175406, 0.8502773, -0.3051384, 1, 0.7137255, 0, 1,
-1.17195, -0.6795234, -0.2418166, 1, 0.7215686, 0, 1,
-1.167917, 0.187495, -2.673791, 1, 0.7254902, 0, 1,
-1.156463, 0.2746713, -1.179257, 1, 0.7333333, 0, 1,
-1.154036, 1.498734, -0.5842878, 1, 0.7372549, 0, 1,
-1.149943, -0.1129449, -2.330528, 1, 0.7450981, 0, 1,
-1.149458, -1.130456, -2.760587, 1, 0.7490196, 0, 1,
-1.146865, -0.1815439, -1.141114, 1, 0.7568628, 0, 1,
-1.142049, 0.3110491, 0.5012607, 1, 0.7607843, 0, 1,
-1.129793, 0.8204578, -1.046964, 1, 0.7686275, 0, 1,
-1.121146, -0.1914501, -0.9154596, 1, 0.772549, 0, 1,
-1.096923, 2.198001, 0.7212076, 1, 0.7803922, 0, 1,
-1.096249, 0.9679847, -2.072067, 1, 0.7843137, 0, 1,
-1.095386, 2.158736, -0.2025754, 1, 0.7921569, 0, 1,
-1.093301, 0.3190456, -3.524221, 1, 0.7960784, 0, 1,
-1.093125, -0.2215751, -4.639042, 1, 0.8039216, 0, 1,
-1.090101, -0.5071492, -1.738323, 1, 0.8117647, 0, 1,
-1.080554, -1.191405, -2.999018, 1, 0.8156863, 0, 1,
-1.077419, 1.850206, -0.4346876, 1, 0.8235294, 0, 1,
-1.076637, 0.4222514, -0.07358395, 1, 0.827451, 0, 1,
-1.075532, 1.398768, -1.809265, 1, 0.8352941, 0, 1,
-1.074523, -1.295916, -3.093865, 1, 0.8392157, 0, 1,
-1.068505, -0.4702393, -1.677331, 1, 0.8470588, 0, 1,
-1.058549, 0.3311597, -0.4884736, 1, 0.8509804, 0, 1,
-1.052631, 1.61648, -0.5755464, 1, 0.8588235, 0, 1,
-1.050526, -0.1549522, -1.265316, 1, 0.8627451, 0, 1,
-1.050356, -0.8441858, -3.632349, 1, 0.8705882, 0, 1,
-1.04334, -0.1799896, -2.617474, 1, 0.8745098, 0, 1,
-1.038034, 1.619748, -0.7254772, 1, 0.8823529, 0, 1,
-1.0313, -0.7256736, -1.657442, 1, 0.8862745, 0, 1,
-1.026048, -0.01336914, -1.758633, 1, 0.8941177, 0, 1,
-1.02597, -0.7637736, -2.552594, 1, 0.8980392, 0, 1,
-1.023745, -0.4300035, -3.015006, 1, 0.9058824, 0, 1,
-1.0156, 1.654946, -2.105502, 1, 0.9137255, 0, 1,
-1.011001, 0.6048974, -1.055016, 1, 0.9176471, 0, 1,
-1.005399, -0.2053799, -3.16973, 1, 0.9254902, 0, 1,
-1.005308, 0.3587608, -1.889193, 1, 0.9294118, 0, 1,
-0.9994133, -0.8868728, -2.470014, 1, 0.9372549, 0, 1,
-0.9928631, 0.726858, -0.5858361, 1, 0.9411765, 0, 1,
-0.9920351, -0.1514196, -3.090288, 1, 0.9490196, 0, 1,
-0.9905168, 0.1815857, -0.03027374, 1, 0.9529412, 0, 1,
-0.9883211, 0.6444681, -0.8451476, 1, 0.9607843, 0, 1,
-0.9851628, -0.6448782, -1.426049, 1, 0.9647059, 0, 1,
-0.9778311, -0.6343472, -2.615915, 1, 0.972549, 0, 1,
-0.97156, -0.8803103, -2.491161, 1, 0.9764706, 0, 1,
-0.971204, 0.4409387, -0.721475, 1, 0.9843137, 0, 1,
-0.965606, -1.514992, -3.695516, 1, 0.9882353, 0, 1,
-0.9625263, -1.90123, -1.591609, 1, 0.9960784, 0, 1,
-0.9617281, -0.8374202, -2.5873, 0.9960784, 1, 0, 1,
-0.9565183, 1.949366, -0.6272179, 0.9921569, 1, 0, 1,
-0.9545513, -0.690872, -2.987236, 0.9843137, 1, 0, 1,
-0.9364506, -1.117736, -2.766452, 0.9803922, 1, 0, 1,
-0.9321283, -1.694485, 0.08764446, 0.972549, 1, 0, 1,
-0.9220804, 0.3430763, 0.2068135, 0.9686275, 1, 0, 1,
-0.9183087, 1.183315, -1.071709, 0.9607843, 1, 0, 1,
-0.9170815, -0.9929732, -1.833485, 0.9568627, 1, 0, 1,
-0.9128967, -1.148807, -2.399937, 0.9490196, 1, 0, 1,
-0.9116117, 1.183513, 0.09524937, 0.945098, 1, 0, 1,
-0.9110832, -0.9934856, -2.976056, 0.9372549, 1, 0, 1,
-0.9090741, 0.6569344, -0.4338129, 0.9333333, 1, 0, 1,
-0.9064227, -0.34233, -1.517968, 0.9254902, 1, 0, 1,
-0.8979503, 0.1117594, -2.622395, 0.9215686, 1, 0, 1,
-0.8955874, 0.8109064, -1.251111, 0.9137255, 1, 0, 1,
-0.894032, 0.43272, -0.8219532, 0.9098039, 1, 0, 1,
-0.8878363, -0.2163467, -3.913956, 0.9019608, 1, 0, 1,
-0.8863116, -1.050271, -2.814992, 0.8941177, 1, 0, 1,
-0.8852686, -0.1305681, -2.840057, 0.8901961, 1, 0, 1,
-0.8826646, 0.5432791, -2.503541, 0.8823529, 1, 0, 1,
-0.8800188, -0.867353, -1.671179, 0.8784314, 1, 0, 1,
-0.8782189, 0.8495305, 0.2308661, 0.8705882, 1, 0, 1,
-0.8779597, 0.3198226, 0.1851089, 0.8666667, 1, 0, 1,
-0.8769805, -0.04305297, -0.9653786, 0.8588235, 1, 0, 1,
-0.8745025, 0.1366701, 0.09713507, 0.854902, 1, 0, 1,
-0.8736252, -0.6816489, -0.2716629, 0.8470588, 1, 0, 1,
-0.8725095, 0.07321963, -1.617886, 0.8431373, 1, 0, 1,
-0.8706502, 0.9776281, 0.700561, 0.8352941, 1, 0, 1,
-0.8676483, -1.087633, -3.182743, 0.8313726, 1, 0, 1,
-0.8626605, 0.9353341, -0.7459452, 0.8235294, 1, 0, 1,
-0.8562582, -0.8489896, -2.276732, 0.8196079, 1, 0, 1,
-0.8469195, -0.5501117, -1.528582, 0.8117647, 1, 0, 1,
-0.8442463, 0.7076957, -0.2987129, 0.8078431, 1, 0, 1,
-0.842916, -0.8321268, -2.355544, 0.8, 1, 0, 1,
-0.8420143, 0.2232835, -1.51193, 0.7921569, 1, 0, 1,
-0.8370041, 0.4892242, -1.610964, 0.7882353, 1, 0, 1,
-0.827576, 0.4341328, -1.476458, 0.7803922, 1, 0, 1,
-0.8139321, 0.4236187, -3.273659, 0.7764706, 1, 0, 1,
-0.8034462, -1.639814, -2.463103, 0.7686275, 1, 0, 1,
-0.8032206, -1.117949, -1.938179, 0.7647059, 1, 0, 1,
-0.792133, -2.297508, -1.402256, 0.7568628, 1, 0, 1,
-0.7915059, -0.3695442, -2.773641, 0.7529412, 1, 0, 1,
-0.7857169, -0.7131284, -1.664795, 0.7450981, 1, 0, 1,
-0.7741851, 1.194982, -0.5595799, 0.7411765, 1, 0, 1,
-0.771734, 0.5781636, -1.813661, 0.7333333, 1, 0, 1,
-0.7685106, 1.490382, 1.921613, 0.7294118, 1, 0, 1,
-0.7682809, 0.3019278, -0.4298282, 0.7215686, 1, 0, 1,
-0.7618906, -0.1007007, -2.908452, 0.7176471, 1, 0, 1,
-0.7617342, -0.7879607, -2.960157, 0.7098039, 1, 0, 1,
-0.7612534, 0.03689711, -3.398425, 0.7058824, 1, 0, 1,
-0.7580231, 0.8791931, 0.6372489, 0.6980392, 1, 0, 1,
-0.7479907, -0.9438758, -2.405738, 0.6901961, 1, 0, 1,
-0.7393283, 1.629785, -1.664804, 0.6862745, 1, 0, 1,
-0.726889, -1.622126, -2.710704, 0.6784314, 1, 0, 1,
-0.7252082, -0.3447067, -1.932275, 0.6745098, 1, 0, 1,
-0.7249579, 0.1974612, 0.04589914, 0.6666667, 1, 0, 1,
-0.7233493, 1.038526, -0.2369394, 0.6627451, 1, 0, 1,
-0.7205848, 1.003171, -0.7200882, 0.654902, 1, 0, 1,
-0.7172937, -0.5285671, -0.7332535, 0.6509804, 1, 0, 1,
-0.7151093, -0.4062442, -3.318691, 0.6431373, 1, 0, 1,
-0.7144556, 1.497023, -0.8748388, 0.6392157, 1, 0, 1,
-0.7070945, 1.243815, -1.185652, 0.6313726, 1, 0, 1,
-0.7055514, 0.7022633, -0.1427891, 0.627451, 1, 0, 1,
-0.7038249, 2.043236, -0.3524007, 0.6196079, 1, 0, 1,
-0.7000108, 0.6469744, -1.619269, 0.6156863, 1, 0, 1,
-0.6978027, -0.2630757, -1.631706, 0.6078432, 1, 0, 1,
-0.6912244, 1.163572, -0.6340913, 0.6039216, 1, 0, 1,
-0.6841409, -0.8564607, -2.904938, 0.5960785, 1, 0, 1,
-0.6833991, 2.236957, -0.2990206, 0.5882353, 1, 0, 1,
-0.6737673, 1.472465, -1.1445, 0.5843138, 1, 0, 1,
-0.6703686, 0.731801, 0.6611118, 0.5764706, 1, 0, 1,
-0.664741, 0.1801554, -0.7761387, 0.572549, 1, 0, 1,
-0.6641364, -1.274259, -3.4616, 0.5647059, 1, 0, 1,
-0.6497417, 0.3462245, -0.5560247, 0.5607843, 1, 0, 1,
-0.6495925, 0.4410581, -0.1704555, 0.5529412, 1, 0, 1,
-0.6493689, -0.9564994, -3.42793, 0.5490196, 1, 0, 1,
-0.6463695, -0.4501885, -2.260056, 0.5411765, 1, 0, 1,
-0.6448767, 0.8918663, 1.21298, 0.5372549, 1, 0, 1,
-0.6411512, 0.06552195, -2.109803, 0.5294118, 1, 0, 1,
-0.6373183, -1.60812, -2.345833, 0.5254902, 1, 0, 1,
-0.6369991, 0.9887493, -0.9184271, 0.5176471, 1, 0, 1,
-0.6354204, 1.325091, 0.5380378, 0.5137255, 1, 0, 1,
-0.632414, 0.1107486, -1.358356, 0.5058824, 1, 0, 1,
-0.6295085, -1.74629, -5.435312, 0.5019608, 1, 0, 1,
-0.6137455, -1.947776, -3.976364, 0.4941176, 1, 0, 1,
-0.6046031, 1.221641, 0.1844828, 0.4862745, 1, 0, 1,
-0.6028478, -0.4816329, -3.027546, 0.4823529, 1, 0, 1,
-0.6027275, -0.3824053, -1.110407, 0.4745098, 1, 0, 1,
-0.5999593, 1.752061, -0.4955039, 0.4705882, 1, 0, 1,
-0.5998302, -1.351275, -2.417791, 0.4627451, 1, 0, 1,
-0.5997693, -2.137254, -4.92733, 0.4588235, 1, 0, 1,
-0.5948473, -0.009228785, -2.727802, 0.4509804, 1, 0, 1,
-0.5940335, -0.01564161, -1.486291, 0.4470588, 1, 0, 1,
-0.5937761, -1.322292, -1.70464, 0.4392157, 1, 0, 1,
-0.5918401, -2.682868, -2.958621, 0.4352941, 1, 0, 1,
-0.5901558, -1.486722, -3.233446, 0.427451, 1, 0, 1,
-0.5890503, 0.6746163, 1.017292, 0.4235294, 1, 0, 1,
-0.5880948, -0.614004, -2.838791, 0.4156863, 1, 0, 1,
-0.5825915, -1.792889, -4.617598, 0.4117647, 1, 0, 1,
-0.5803527, -0.9867777, -3.890451, 0.4039216, 1, 0, 1,
-0.5788205, 0.1747466, -1.839758, 0.3960784, 1, 0, 1,
-0.5782686, 0.2619585, -1.390293, 0.3921569, 1, 0, 1,
-0.5779959, 0.4771156, 0.04194796, 0.3843137, 1, 0, 1,
-0.577828, 2.485318, 0.0210203, 0.3803922, 1, 0, 1,
-0.5696697, 2.220042, 0.2442833, 0.372549, 1, 0, 1,
-0.5650679, -1.046744, -1.912765, 0.3686275, 1, 0, 1,
-0.5604378, -1.580304, -2.734042, 0.3607843, 1, 0, 1,
-0.5588686, -0.190806, -1.399596, 0.3568628, 1, 0, 1,
-0.5526527, 1.688016, -0.1945668, 0.3490196, 1, 0, 1,
-0.5454143, -2.450522, -4.022348, 0.345098, 1, 0, 1,
-0.538922, 0.6165352, -0.6624361, 0.3372549, 1, 0, 1,
-0.5373414, -0.9413297, -2.946487, 0.3333333, 1, 0, 1,
-0.5353872, 0.1361242, -0.1505402, 0.3254902, 1, 0, 1,
-0.5339449, -0.1468255, -0.1288712, 0.3215686, 1, 0, 1,
-0.5177882, -1.742109, -3.456632, 0.3137255, 1, 0, 1,
-0.5123283, -0.751946, -4.08111, 0.3098039, 1, 0, 1,
-0.5110252, -0.4514452, -3.120233, 0.3019608, 1, 0, 1,
-0.5104303, 0.5686907, -0.2417935, 0.2941177, 1, 0, 1,
-0.5098967, 1.171979, 0.3274664, 0.2901961, 1, 0, 1,
-0.504209, -0.1114016, -2.704901, 0.282353, 1, 0, 1,
-0.4991591, -2.096831, -3.459048, 0.2784314, 1, 0, 1,
-0.49805, -0.9078079, -2.005708, 0.2705882, 1, 0, 1,
-0.4979957, -0.9785849, -4.003343, 0.2666667, 1, 0, 1,
-0.4973404, 1.847011, 0.3842472, 0.2588235, 1, 0, 1,
-0.4944247, -2.324024, -2.156861, 0.254902, 1, 0, 1,
-0.4941321, -0.3868788, -3.208458, 0.2470588, 1, 0, 1,
-0.4899053, 1.245448, 0.321942, 0.2431373, 1, 0, 1,
-0.4870954, 1.462935, -0.5270824, 0.2352941, 1, 0, 1,
-0.4837789, -0.9775278, -2.869422, 0.2313726, 1, 0, 1,
-0.4817197, 0.9322091, -0.2573951, 0.2235294, 1, 0, 1,
-0.4764566, 0.6809021, -0.5304359, 0.2196078, 1, 0, 1,
-0.4715927, 0.1183361, -2.191092, 0.2117647, 1, 0, 1,
-0.4708623, -2.357939, -2.834143, 0.2078431, 1, 0, 1,
-0.463137, 0.1811023, -1.532232, 0.2, 1, 0, 1,
-0.4540516, 1.17817, -0.7467872, 0.1921569, 1, 0, 1,
-0.4518265, 1.119707, -0.4876176, 0.1882353, 1, 0, 1,
-0.4498232, -1.29336, -2.412194, 0.1803922, 1, 0, 1,
-0.443035, -0.6969992, -2.322418, 0.1764706, 1, 0, 1,
-0.4321226, 0.04841514, -2.656778, 0.1686275, 1, 0, 1,
-0.429807, 0.8368669, -0.1267124, 0.1647059, 1, 0, 1,
-0.4294131, -0.6384702, -2.959486, 0.1568628, 1, 0, 1,
-0.4293554, 1.227989, 0.11211, 0.1529412, 1, 0, 1,
-0.419764, -1.330733, -2.641095, 0.145098, 1, 0, 1,
-0.418878, -0.1177559, -1.638983, 0.1411765, 1, 0, 1,
-0.4159539, 2.171397, -1.140901, 0.1333333, 1, 0, 1,
-0.4145279, 1.502623, -1.510647, 0.1294118, 1, 0, 1,
-0.4130162, -0.9380954, -4.631125, 0.1215686, 1, 0, 1,
-0.4128201, 0.2090694, -0.7377345, 0.1176471, 1, 0, 1,
-0.410336, -0.2378361, -3.356806, 0.1098039, 1, 0, 1,
-0.4031286, -0.7488188, -4.91502, 0.1058824, 1, 0, 1,
-0.4016511, -0.1361234, -1.930513, 0.09803922, 1, 0, 1,
-0.3981563, -0.1371621, -2.108658, 0.09019608, 1, 0, 1,
-0.3876314, -1.830766, -4.177977, 0.08627451, 1, 0, 1,
-0.3865139, 0.8639588, -0.641398, 0.07843138, 1, 0, 1,
-0.3856563, -0.7303131, -2.621405, 0.07450981, 1, 0, 1,
-0.3848954, 1.144292, -0.4576393, 0.06666667, 1, 0, 1,
-0.3847435, 0.585024, 0.5126139, 0.0627451, 1, 0, 1,
-0.3842361, -2.167021, -2.519915, 0.05490196, 1, 0, 1,
-0.382588, 0.5005497, -0.69717, 0.05098039, 1, 0, 1,
-0.3812018, -0.5121019, -3.812135, 0.04313726, 1, 0, 1,
-0.3805337, 0.4607221, -1.470795, 0.03921569, 1, 0, 1,
-0.3771167, -1.492641, -2.51811, 0.03137255, 1, 0, 1,
-0.3754797, -0.4688487, -1.344763, 0.02745098, 1, 0, 1,
-0.3660267, -0.5910463, -1.855678, 0.01960784, 1, 0, 1,
-0.3644501, -0.5858835, -2.261926, 0.01568628, 1, 0, 1,
-0.3619652, 0.556044, 0.8650744, 0.007843138, 1, 0, 1,
-0.3619598, -1.358063, -3.560077, 0.003921569, 1, 0, 1,
-0.358817, 0.3332357, -1.875269, 0, 1, 0.003921569, 1,
-0.3560136, 0.6679143, 0.2929929, 0, 1, 0.01176471, 1,
-0.3558561, -0.1326602, -2.051409, 0, 1, 0.01568628, 1,
-0.3548942, -0.9189373, -2.189392, 0, 1, 0.02352941, 1,
-0.3546962, 1.126415, -0.8141932, 0, 1, 0.02745098, 1,
-0.354226, -0.2135203, -1.571698, 0, 1, 0.03529412, 1,
-0.3489781, 0.03813463, -2.186097, 0, 1, 0.03921569, 1,
-0.3473931, -0.6690196, -2.989104, 0, 1, 0.04705882, 1,
-0.3459505, -0.04095815, -1.496732, 0, 1, 0.05098039, 1,
-0.338978, 0.7860819, 0.2102261, 0, 1, 0.05882353, 1,
-0.3351173, -0.05560992, -1.768372, 0, 1, 0.0627451, 1,
-0.3335473, -1.074383, -2.587567, 0, 1, 0.07058824, 1,
-0.3284747, -0.8380661, -3.963418, 0, 1, 0.07450981, 1,
-0.3282357, 1.83563, 0.3967654, 0, 1, 0.08235294, 1,
-0.3231231, -0.4777056, -3.099654, 0, 1, 0.08627451, 1,
-0.3175699, -0.6124403, -3.138953, 0, 1, 0.09411765, 1,
-0.3165885, 0.7178082, -0.4852546, 0, 1, 0.1019608, 1,
-0.3162664, -0.1396513, -2.388794, 0, 1, 0.1058824, 1,
-0.3153061, 0.4372871, -0.5567119, 0, 1, 0.1137255, 1,
-0.3124277, 0.867693, -2.231961, 0, 1, 0.1176471, 1,
-0.3057778, 0.2211091, -1.24505, 0, 1, 0.1254902, 1,
-0.3027778, 0.2011761, -2.076264, 0, 1, 0.1294118, 1,
-0.2978862, 0.2478955, -3.063932, 0, 1, 0.1372549, 1,
-0.2965089, 0.2560578, 0.5543858, 0, 1, 0.1411765, 1,
-0.2960207, -1.505026, -4.404417, 0, 1, 0.1490196, 1,
-0.2894391, -0.03249669, -2.085769, 0, 1, 0.1529412, 1,
-0.2878514, -0.0261252, -0.4135995, 0, 1, 0.1607843, 1,
-0.2876059, -0.3909999, -1.490152, 0, 1, 0.1647059, 1,
-0.2863214, 1.557846, -0.1413376, 0, 1, 0.172549, 1,
-0.2834997, 0.8483745, -0.9577342, 0, 1, 0.1764706, 1,
-0.2823831, -0.3772492, -1.850786, 0, 1, 0.1843137, 1,
-0.2654169, 0.6813799, -0.5892477, 0, 1, 0.1882353, 1,
-0.2543317, 0.9789491, -0.514728, 0, 1, 0.1960784, 1,
-0.2494669, -0.3296129, -1.625078, 0, 1, 0.2039216, 1,
-0.2487453, -0.7947208, -2.180212, 0, 1, 0.2078431, 1,
-0.2475956, -0.565872, -2.291146, 0, 1, 0.2156863, 1,
-0.2420879, 1.332232, 1.342774, 0, 1, 0.2196078, 1,
-0.2356091, 3.261759, -1.273612, 0, 1, 0.227451, 1,
-0.2342121, 0.08261061, -1.220222, 0, 1, 0.2313726, 1,
-0.2239693, -0.1561508, -1.817553, 0, 1, 0.2392157, 1,
-0.2228761, 1.705231, -0.5345005, 0, 1, 0.2431373, 1,
-0.2203099, 1.356883, -0.4865341, 0, 1, 0.2509804, 1,
-0.2188188, -0.6306685, -3.236296, 0, 1, 0.254902, 1,
-0.2108932, -1.776712, -4.221097, 0, 1, 0.2627451, 1,
-0.2073996, -0.9794973, -3.783454, 0, 1, 0.2666667, 1,
-0.2035442, -0.4272815, -3.062212, 0, 1, 0.2745098, 1,
-0.1986071, -1.573676, -2.020359, 0, 1, 0.2784314, 1,
-0.1973483, -0.4472133, -3.830352, 0, 1, 0.2862745, 1,
-0.1953019, -1.852553, -3.451255, 0, 1, 0.2901961, 1,
-0.1946671, -0.1889862, -2.676378, 0, 1, 0.2980392, 1,
-0.1934557, 2.040176, -0.4219306, 0, 1, 0.3058824, 1,
-0.1924835, 0.9365128, 0.04820091, 0, 1, 0.3098039, 1,
-0.1900209, 0.1182647, -0.525084, 0, 1, 0.3176471, 1,
-0.1885318, 2.028592, 0.6076623, 0, 1, 0.3215686, 1,
-0.1868262, -0.2479506, -1.294958, 0, 1, 0.3294118, 1,
-0.1854177, 1.086181, -0.3748814, 0, 1, 0.3333333, 1,
-0.1849881, 1.063593, -0.6178561, 0, 1, 0.3411765, 1,
-0.1806695, 0.3367998, 0.5053223, 0, 1, 0.345098, 1,
-0.1802823, 1.715307, 1.324739, 0, 1, 0.3529412, 1,
-0.1800335, 2.121866, 0.05442192, 0, 1, 0.3568628, 1,
-0.1732621, -0.1353631, -0.5606516, 0, 1, 0.3647059, 1,
-0.1720441, -0.8215168, -3.172921, 0, 1, 0.3686275, 1,
-0.1717555, -0.8707476, -2.626195, 0, 1, 0.3764706, 1,
-0.1686057, 1.442323, -0.5517438, 0, 1, 0.3803922, 1,
-0.1681629, 0.05658404, -2.069273, 0, 1, 0.3882353, 1,
-0.1666851, 0.2474312, -0.6546215, 0, 1, 0.3921569, 1,
-0.1634104, 0.4887475, -2.314305, 0, 1, 0.4, 1,
-0.1629341, 0.4465722, 0.1507818, 0, 1, 0.4078431, 1,
-0.1628747, -2.184999, -2.568439, 0, 1, 0.4117647, 1,
-0.1616127, 0.01156378, -1.537256, 0, 1, 0.4196078, 1,
-0.1478654, 0.3569025, 0.4795296, 0, 1, 0.4235294, 1,
-0.1424504, -1.93754, -2.79662, 0, 1, 0.4313726, 1,
-0.1407418, -0.8377345, -1.815274, 0, 1, 0.4352941, 1,
-0.1402876, 0.2998611, 0.2672522, 0, 1, 0.4431373, 1,
-0.1380013, 1.035051, 1.398861, 0, 1, 0.4470588, 1,
-0.1378666, -1.413264, -2.23782, 0, 1, 0.454902, 1,
-0.1368459, 2.100904, 0.406039, 0, 1, 0.4588235, 1,
-0.1362035, 1.957573, -0.179812, 0, 1, 0.4666667, 1,
-0.1361158, -0.02811833, 1.54459, 0, 1, 0.4705882, 1,
-0.1333219, -0.4063518, -2.303093, 0, 1, 0.4784314, 1,
-0.1324323, 0.2583542, -0.9495552, 0, 1, 0.4823529, 1,
-0.1227323, 0.6068041, 1.866373, 0, 1, 0.4901961, 1,
-0.1201883, -1.283604, -2.481113, 0, 1, 0.4941176, 1,
-0.1174182, -1.11774, -2.139889, 0, 1, 0.5019608, 1,
-0.1152552, -0.876902, -2.158878, 0, 1, 0.509804, 1,
-0.1107995, 1.139056, -1.311309, 0, 1, 0.5137255, 1,
-0.106489, 1.67131, 0.8397236, 0, 1, 0.5215687, 1,
-0.1064082, -0.3102334, -4.567832, 0, 1, 0.5254902, 1,
-0.1063128, 0.2830217, 2.250616, 0, 1, 0.5333334, 1,
-0.1051093, 1.685749, 0.5376697, 0, 1, 0.5372549, 1,
-0.1042407, -0.3633936, -2.407194, 0, 1, 0.5450981, 1,
-0.1030371, 2.053383, 0.9561989, 0, 1, 0.5490196, 1,
-0.1019617, -0.06761729, -1.306908, 0, 1, 0.5568628, 1,
-0.1019243, -1.07074, -4.056385, 0, 1, 0.5607843, 1,
-0.1016324, -0.708551, -2.219842, 0, 1, 0.5686275, 1,
-0.09789298, 0.991736, -0.6878466, 0, 1, 0.572549, 1,
-0.0977991, -1.073502, -2.568459, 0, 1, 0.5803922, 1,
-0.09428608, 0.3854904, 0.1685205, 0, 1, 0.5843138, 1,
-0.09375563, -0.2443193, -1.79486, 0, 1, 0.5921569, 1,
-0.09366991, 0.2925946, -0.3950777, 0, 1, 0.5960785, 1,
-0.09303969, -0.8868304, -3.160772, 0, 1, 0.6039216, 1,
-0.09297261, 0.9437439, 1.773305, 0, 1, 0.6117647, 1,
-0.0921904, 0.2622828, 0.8548665, 0, 1, 0.6156863, 1,
-0.08995599, 1.257848, -0.6617465, 0, 1, 0.6235294, 1,
-0.08851068, 1.657302, 0.6806966, 0, 1, 0.627451, 1,
-0.08733, 0.02384801, -2.016426, 0, 1, 0.6352941, 1,
-0.08696082, 0.8861725, -0.2260254, 0, 1, 0.6392157, 1,
-0.08328804, 0.9449909, 1.02644, 0, 1, 0.6470588, 1,
-0.08191116, -0.03314259, -2.278946, 0, 1, 0.6509804, 1,
-0.08003449, 0.4243937, 0.8459237, 0, 1, 0.6588235, 1,
-0.07315603, -0.4133928, -1.077094, 0, 1, 0.6627451, 1,
-0.07208389, -2.24064, -2.91132, 0, 1, 0.6705883, 1,
-0.07196616, -0.03712443, -0.8165059, 0, 1, 0.6745098, 1,
-0.07172933, 0.5988259, 2.188225, 0, 1, 0.682353, 1,
-0.07012466, 0.007768295, -0.9764339, 0, 1, 0.6862745, 1,
-0.06990007, -1.091589, -2.904388, 0, 1, 0.6941177, 1,
-0.06669436, 0.1399016, -1.619646, 0, 1, 0.7019608, 1,
-0.06369389, 1.560357, -0.3771563, 0, 1, 0.7058824, 1,
-0.05794996, 0.5136756, 0.3355436, 0, 1, 0.7137255, 1,
-0.05658999, 1.375959, 2.286107, 0, 1, 0.7176471, 1,
-0.05308921, -0.8443541, -1.866281, 0, 1, 0.7254902, 1,
-0.05036856, -0.6965095, -2.20176, 0, 1, 0.7294118, 1,
-0.0449889, 0.5433201, 1.08012, 0, 1, 0.7372549, 1,
-0.04376441, 0.914695, 0.1871553, 0, 1, 0.7411765, 1,
-0.04261368, 0.07198379, -0.2359037, 0, 1, 0.7490196, 1,
-0.03896799, -0.06947453, -1.957043, 0, 1, 0.7529412, 1,
-0.03428731, 0.6162993, 1.533005, 0, 1, 0.7607843, 1,
-0.03092581, 0.6001848, -0.02685377, 0, 1, 0.7647059, 1,
-0.03007328, 0.07597694, -1.40072, 0, 1, 0.772549, 1,
-0.02563581, 0.5562836, -0.5711585, 0, 1, 0.7764706, 1,
-0.02108019, 0.2317187, -0.3783918, 0, 1, 0.7843137, 1,
-0.02098354, -0.1058654, -3.3105, 0, 1, 0.7882353, 1,
-0.02009778, 1.473119, 0.6503465, 0, 1, 0.7960784, 1,
-0.01988407, 0.4319317, -0.7279818, 0, 1, 0.8039216, 1,
-0.01772763, -1.071656, -2.706647, 0, 1, 0.8078431, 1,
-0.01306275, -0.9021924, -3.897503, 0, 1, 0.8156863, 1,
-0.01291453, -0.5133772, -2.746238, 0, 1, 0.8196079, 1,
-0.01140331, -1.916169, -2.962261, 0, 1, 0.827451, 1,
-0.008503711, 0.3074452, 0.6124841, 0, 1, 0.8313726, 1,
-0.007062946, -1.145199, -3.400923, 0, 1, 0.8392157, 1,
-0.004592397, 1.205922, -0.3916025, 0, 1, 0.8431373, 1,
-0.0041534, 1.141366, -0.9020593, 0, 1, 0.8509804, 1,
-0.004007647, -0.3807544, -3.811844, 0, 1, 0.854902, 1,
-0.002164539, -0.4401813, -1.965981, 0, 1, 0.8627451, 1,
-0.0005075642, -0.2361387, -2.940789, 0, 1, 0.8666667, 1,
0.003659689, -1.012982, 5.353397, 0, 1, 0.8745098, 1,
0.004386954, -0.6995917, 2.743091, 0, 1, 0.8784314, 1,
0.008033229, -0.5895378, 5.598377, 0, 1, 0.8862745, 1,
0.01010714, -0.02829847, 2.766439, 0, 1, 0.8901961, 1,
0.01018904, -0.3573159, 3.79018, 0, 1, 0.8980392, 1,
0.01132558, -0.01728192, 1.823154, 0, 1, 0.9058824, 1,
0.01843885, -0.2615847, 2.749652, 0, 1, 0.9098039, 1,
0.02196258, 0.1658622, 1.599397, 0, 1, 0.9176471, 1,
0.0226345, -1.284713, 2.79373, 0, 1, 0.9215686, 1,
0.02348966, 0.6233426, -0.05955883, 0, 1, 0.9294118, 1,
0.02457792, -1.233242, 1.018114, 0, 1, 0.9333333, 1,
0.02846105, 1.881153, 0.3019104, 0, 1, 0.9411765, 1,
0.03392431, 1.321674, -1.72009, 0, 1, 0.945098, 1,
0.03774948, -0.7162412, 3.074164, 0, 1, 0.9529412, 1,
0.0382089, 0.9353135, -0.08179792, 0, 1, 0.9568627, 1,
0.03857092, 0.6233701, -0.8084623, 0, 1, 0.9647059, 1,
0.03875585, -0.398402, 5.460745, 0, 1, 0.9686275, 1,
0.04377449, 0.8015442, 0.3050834, 0, 1, 0.9764706, 1,
0.04538269, 0.180293, 0.8693331, 0, 1, 0.9803922, 1,
0.0556443, -0.8621746, 2.011183, 0, 1, 0.9882353, 1,
0.05589939, -1.25011, 4.684094, 0, 1, 0.9921569, 1,
0.06046085, -0.251286, 4.329998, 0, 1, 1, 1,
0.06298452, -0.8966023, 3.797269, 0, 0.9921569, 1, 1,
0.06412794, 0.2634673, 2.190467, 0, 0.9882353, 1, 1,
0.06419449, -0.16488, 2.996366, 0, 0.9803922, 1, 1,
0.06587327, -1.85681, 4.102194, 0, 0.9764706, 1, 1,
0.06808764, -0.7904095, 2.582115, 0, 0.9686275, 1, 1,
0.06898104, 0.0006375393, 0.8759209, 0, 0.9647059, 1, 1,
0.06917053, -1.141091, 2.212291, 0, 0.9568627, 1, 1,
0.07029907, 1.751265, -0.2843794, 0, 0.9529412, 1, 1,
0.07213389, -0.5531717, 2.20395, 0, 0.945098, 1, 1,
0.07380425, -0.5975896, 3.189857, 0, 0.9411765, 1, 1,
0.07436501, 1.545076, 0.2074266, 0, 0.9333333, 1, 1,
0.07512178, 0.71766, -1.142597, 0, 0.9294118, 1, 1,
0.07533459, -0.1220518, 3.003227, 0, 0.9215686, 1, 1,
0.077491, -0.4171801, 3.403196, 0, 0.9176471, 1, 1,
0.07761548, -0.2621504, 2.952164, 0, 0.9098039, 1, 1,
0.08033129, -0.2337707, 1.928168, 0, 0.9058824, 1, 1,
0.08041582, 0.6053377, -0.8213268, 0, 0.8980392, 1, 1,
0.08673446, -0.7034144, 3.260015, 0, 0.8901961, 1, 1,
0.09065253, 1.123157, 0.5347877, 0, 0.8862745, 1, 1,
0.09544243, -0.6153745, 2.666414, 0, 0.8784314, 1, 1,
0.09974354, 0.9086933, -0.4078115, 0, 0.8745098, 1, 1,
0.104387, -1.066141, 3.68075, 0, 0.8666667, 1, 1,
0.1053312, 0.6022804, 1.317201, 0, 0.8627451, 1, 1,
0.1056984, 0.9743018, 0.2879378, 0, 0.854902, 1, 1,
0.1086207, -0.6196698, 2.923368, 0, 0.8509804, 1, 1,
0.1087577, 0.006950694, 2.191928, 0, 0.8431373, 1, 1,
0.111663, -0.3717996, 2.328697, 0, 0.8392157, 1, 1,
0.1122323, -0.4215066, 5.839304, 0, 0.8313726, 1, 1,
0.1153695, -0.7064793, 2.011585, 0, 0.827451, 1, 1,
0.1156268, -0.0778482, 0.9324144, 0, 0.8196079, 1, 1,
0.1174391, -0.2676986, 1.95219, 0, 0.8156863, 1, 1,
0.1231479, -1.243653, 3.396675, 0, 0.8078431, 1, 1,
0.1250993, 0.8047052, 1.251309, 0, 0.8039216, 1, 1,
0.1309204, -0.5542331, 2.340432, 0, 0.7960784, 1, 1,
0.1338194, -0.07545801, 1.451505, 0, 0.7882353, 1, 1,
0.137042, 1.268269, 2.384991, 0, 0.7843137, 1, 1,
0.1405294, 0.4875487, -2.025213, 0, 0.7764706, 1, 1,
0.1421749, 0.2634785, 1.423104, 0, 0.772549, 1, 1,
0.145616, 1.38557, -0.2027356, 0, 0.7647059, 1, 1,
0.1485617, -0.8973474, 2.58996, 0, 0.7607843, 1, 1,
0.1595039, -1.710684, 4.409444, 0, 0.7529412, 1, 1,
0.1625046, 1.021035, -0.1935669, 0, 0.7490196, 1, 1,
0.1638729, -0.4276991, 2.986681, 0, 0.7411765, 1, 1,
0.1659331, 0.3425836, 0.9478512, 0, 0.7372549, 1, 1,
0.1668827, 0.7516291, -0.9005698, 0, 0.7294118, 1, 1,
0.1679039, 2.609228, -0.1160898, 0, 0.7254902, 1, 1,
0.1682031, 0.5936536, 2.351663, 0, 0.7176471, 1, 1,
0.1707239, -0.9422525, 3.987447, 0, 0.7137255, 1, 1,
0.1721528, 1.076841, 0.4498259, 0, 0.7058824, 1, 1,
0.1740988, 0.7699954, 0.1604625, 0, 0.6980392, 1, 1,
0.1747597, 0.4864156, 0.7753779, 0, 0.6941177, 1, 1,
0.1765259, 0.1948848, 0.5888973, 0, 0.6862745, 1, 1,
0.1790581, -0.2446193, 2.449247, 0, 0.682353, 1, 1,
0.186242, 0.2911684, 1.259572, 0, 0.6745098, 1, 1,
0.1901846, -0.135966, 2.500153, 0, 0.6705883, 1, 1,
0.1932415, -0.3137294, 2.20947, 0, 0.6627451, 1, 1,
0.1946126, -0.06861934, 1.864916, 0, 0.6588235, 1, 1,
0.1958975, 0.8487009, -0.7543309, 0, 0.6509804, 1, 1,
0.2028269, 0.6569895, -0.2126257, 0, 0.6470588, 1, 1,
0.2047082, 1.363871, 0.7819217, 0, 0.6392157, 1, 1,
0.2050387, 0.3609177, -0.8704845, 0, 0.6352941, 1, 1,
0.2068702, -0.6152095, 2.288195, 0, 0.627451, 1, 1,
0.2096594, -1.343816, 2.545084, 0, 0.6235294, 1, 1,
0.2104274, 1.252157, 0.8307738, 0, 0.6156863, 1, 1,
0.2116801, -0.7153302, 2.694256, 0, 0.6117647, 1, 1,
0.2184334, -1.621299, 2.506462, 0, 0.6039216, 1, 1,
0.2201057, 2.125147, -1.192814, 0, 0.5960785, 1, 1,
0.2213601, -0.2801299, 3.895377, 0, 0.5921569, 1, 1,
0.2245568, 0.7001135, -0.6245723, 0, 0.5843138, 1, 1,
0.2254908, 2.329364, -0.9047096, 0, 0.5803922, 1, 1,
0.2312983, -0.3681934, 3.605333, 0, 0.572549, 1, 1,
0.2337591, 0.3497612, 0.6484145, 0, 0.5686275, 1, 1,
0.2341282, -0.4344997, 3.405974, 0, 0.5607843, 1, 1,
0.2353915, -0.4006575, 1.015798, 0, 0.5568628, 1, 1,
0.2400148, 0.6882274, -0.1190343, 0, 0.5490196, 1, 1,
0.242307, 0.2419765, 1.102182, 0, 0.5450981, 1, 1,
0.2463296, 1.542919, -0.1473172, 0, 0.5372549, 1, 1,
0.2506058, -0.2524601, 1.978982, 0, 0.5333334, 1, 1,
0.2517997, -1.102402, 5.349036, 0, 0.5254902, 1, 1,
0.2520857, 0.9615783, -0.5091584, 0, 0.5215687, 1, 1,
0.2536514, -0.07370774, 1.992799, 0, 0.5137255, 1, 1,
0.2637199, -1.144876, 3.523919, 0, 0.509804, 1, 1,
0.2654065, -0.1196507, 2.436286, 0, 0.5019608, 1, 1,
0.2660976, 0.691553, 0.528925, 0, 0.4941176, 1, 1,
0.2681625, 0.8676999, -0.2088512, 0, 0.4901961, 1, 1,
0.2731031, -0.4868742, 2.290182, 0, 0.4823529, 1, 1,
0.2778934, -0.2306489, 2.663491, 0, 0.4784314, 1, 1,
0.278766, -0.1498939, 0.6837811, 0, 0.4705882, 1, 1,
0.279021, -0.9131487, 2.353929, 0, 0.4666667, 1, 1,
0.2814673, 0.6157389, 0.2694746, 0, 0.4588235, 1, 1,
0.2814833, -1.197989, 5.467882, 0, 0.454902, 1, 1,
0.2816523, -0.703269, 0.6055858, 0, 0.4470588, 1, 1,
0.2833207, 0.9333388, -0.5895059, 0, 0.4431373, 1, 1,
0.2848978, 0.3391629, 0.5049014, 0, 0.4352941, 1, 1,
0.2887952, -0.9557593, 2.89498, 0, 0.4313726, 1, 1,
0.2915916, 1.546073, 1.070718, 0, 0.4235294, 1, 1,
0.2933712, -0.3421735, 1.734887, 0, 0.4196078, 1, 1,
0.2962052, -0.552941, 1.934359, 0, 0.4117647, 1, 1,
0.3007666, 1.051761, 1.282594, 0, 0.4078431, 1, 1,
0.3074901, 0.6845465, -0.05193609, 0, 0.4, 1, 1,
0.3085614, 0.3156829, 0.0174807, 0, 0.3921569, 1, 1,
0.308732, -0.1270987, 0.01820637, 0, 0.3882353, 1, 1,
0.3117663, -0.7048069, 3.115832, 0, 0.3803922, 1, 1,
0.314053, -1.242747, 3.810319, 0, 0.3764706, 1, 1,
0.3157403, -2.262344, 3.36298, 0, 0.3686275, 1, 1,
0.3177596, -0.3523916, 1.828657, 0, 0.3647059, 1, 1,
0.3197743, 0.2479415, -1.816464, 0, 0.3568628, 1, 1,
0.3272778, 1.295263, 1.063097, 0, 0.3529412, 1, 1,
0.328303, -0.9448547, 3.686921, 0, 0.345098, 1, 1,
0.3289147, -1.466448, 3.302664, 0, 0.3411765, 1, 1,
0.3292549, -2.083879, 3.384346, 0, 0.3333333, 1, 1,
0.3314424, 0.4955773, 2.135744, 0, 0.3294118, 1, 1,
0.3361216, -0.3220733, 2.188083, 0, 0.3215686, 1, 1,
0.3417032, 0.2904887, 0.320737, 0, 0.3176471, 1, 1,
0.342526, 0.1102006, 2.753166, 0, 0.3098039, 1, 1,
0.3447589, 0.6946819, 0.9067503, 0, 0.3058824, 1, 1,
0.3462786, -0.8381419, 3.271577, 0, 0.2980392, 1, 1,
0.3481731, 0.939994, 0.5792036, 0, 0.2901961, 1, 1,
0.3516789, 0.7700368, 0.637581, 0, 0.2862745, 1, 1,
0.356949, -1.384585, 4.681352, 0, 0.2784314, 1, 1,
0.3586535, -0.1886748, 1.774241, 0, 0.2745098, 1, 1,
0.3626412, 0.007881139, 2.003652, 0, 0.2666667, 1, 1,
0.3633512, 1.591445, 1.568716, 0, 0.2627451, 1, 1,
0.3633994, 0.3561883, -0.2580856, 0, 0.254902, 1, 1,
0.3647424, -0.254611, 1.59546, 0, 0.2509804, 1, 1,
0.3651109, -0.4192422, 2.516801, 0, 0.2431373, 1, 1,
0.3651261, 1.31371, -0.7571291, 0, 0.2392157, 1, 1,
0.3682505, 1.056526, 0.6299679, 0, 0.2313726, 1, 1,
0.3696483, -0.1940919, 3.141368, 0, 0.227451, 1, 1,
0.3738912, 2.023878, 2.412388, 0, 0.2196078, 1, 1,
0.3767887, 0.5232608, 1.074729, 0, 0.2156863, 1, 1,
0.3778362, -0.2218829, 0.5203996, 0, 0.2078431, 1, 1,
0.3807476, -1.066353, 3.427216, 0, 0.2039216, 1, 1,
0.3847768, -0.6196539, 2.194068, 0, 0.1960784, 1, 1,
0.3853209, 1.953519, 0.2632747, 0, 0.1882353, 1, 1,
0.3975202, 1.519874, 0.6887868, 0, 0.1843137, 1, 1,
0.3980918, -2.225743, 2.805284, 0, 0.1764706, 1, 1,
0.398767, 1.132234, -0.3202745, 0, 0.172549, 1, 1,
0.4041697, 1.320058, 1.618975, 0, 0.1647059, 1, 1,
0.4049208, -0.01984948, 1.512208, 0, 0.1607843, 1, 1,
0.4049225, 1.56513, -0.9332796, 0, 0.1529412, 1, 1,
0.4060122, 0.1598618, 0.3621106, 0, 0.1490196, 1, 1,
0.4065158, 0.3738475, -0.8513083, 0, 0.1411765, 1, 1,
0.4081974, 0.6868961, 0.8721319, 0, 0.1372549, 1, 1,
0.4098042, -0.8527458, 1.093523, 0, 0.1294118, 1, 1,
0.4147907, -0.6165232, 3.79889, 0, 0.1254902, 1, 1,
0.4148741, 1.668478, 1.125561, 0, 0.1176471, 1, 1,
0.418579, 1.269865, -0.6607051, 0, 0.1137255, 1, 1,
0.4201671, -0.009357931, 1.209703, 0, 0.1058824, 1, 1,
0.4258402, 1.147244, -1.106245, 0, 0.09803922, 1, 1,
0.4294251, -1.45516, 3.01416, 0, 0.09411765, 1, 1,
0.4312187, 1.615545, 0.09431119, 0, 0.08627451, 1, 1,
0.4333552, -0.889322, 2.018054, 0, 0.08235294, 1, 1,
0.4362439, -0.4298343, 3.194702, 0, 0.07450981, 1, 1,
0.4372247, 1.050756, 1.082274, 0, 0.07058824, 1, 1,
0.4438933, 0.452644, -1.054755, 0, 0.0627451, 1, 1,
0.4448125, 1.11194, 0.003592141, 0, 0.05882353, 1, 1,
0.4488869, -0.378843, 2.852256, 0, 0.05098039, 1, 1,
0.4510974, 0.02007629, 1.057447, 0, 0.04705882, 1, 1,
0.4516763, -2.113884, 3.68876, 0, 0.03921569, 1, 1,
0.4535966, 2.073301, 1.627991, 0, 0.03529412, 1, 1,
0.4537386, 1.36981, 0.04267924, 0, 0.02745098, 1, 1,
0.4539726, -1.09322, 2.713211, 0, 0.02352941, 1, 1,
0.4548776, 0.5936394, 0.6712209, 0, 0.01568628, 1, 1,
0.4549374, 1.2083, 0.4597596, 0, 0.01176471, 1, 1,
0.457521, 1.513423, 0.8560912, 0, 0.003921569, 1, 1,
0.4589596, -0.4326232, 2.468379, 0.003921569, 0, 1, 1,
0.4620552, -1.601434, 1.805307, 0.007843138, 0, 1, 1,
0.4661797, 1.671525, 0.1694948, 0.01568628, 0, 1, 1,
0.4689495, 0.1310034, 0.8354694, 0.01960784, 0, 1, 1,
0.4697397, -0.3522792, 3.442329, 0.02745098, 0, 1, 1,
0.4707841, 0.1622926, 1.635432, 0.03137255, 0, 1, 1,
0.4723488, 1.689575, 0.4692359, 0.03921569, 0, 1, 1,
0.4744239, -1.241875, 3.773151, 0.04313726, 0, 1, 1,
0.4744505, -0.5731151, 2.467501, 0.05098039, 0, 1, 1,
0.4781342, -0.2410749, 3.34888, 0.05490196, 0, 1, 1,
0.4803031, 1.07506, 1.569021, 0.0627451, 0, 1, 1,
0.485078, 1.196176, 1.136771, 0.06666667, 0, 1, 1,
0.4900948, 1.545803, 0.4000873, 0.07450981, 0, 1, 1,
0.4904042, 0.490844, 0.7539682, 0.07843138, 0, 1, 1,
0.4947596, 1.137969, -1.284198, 0.08627451, 0, 1, 1,
0.496943, -0.03276073, 3.517605, 0.09019608, 0, 1, 1,
0.4984558, 0.4688866, 1.068888, 0.09803922, 0, 1, 1,
0.5002963, -0.0972594, 1.715511, 0.1058824, 0, 1, 1,
0.5033565, -0.1875682, 2.528949, 0.1098039, 0, 1, 1,
0.5039255, 0.6179187, 1.591864, 0.1176471, 0, 1, 1,
0.506739, -1.005597, 0.43735, 0.1215686, 0, 1, 1,
0.51301, 0.4098642, 1.499706, 0.1294118, 0, 1, 1,
0.5136143, 1.124653, 0.04780157, 0.1333333, 0, 1, 1,
0.5166978, 0.4472258, 1.287301, 0.1411765, 0, 1, 1,
0.5179146, 0.001553936, 1.876093, 0.145098, 0, 1, 1,
0.5230177, 0.05349981, 1.366845, 0.1529412, 0, 1, 1,
0.5261679, -0.1836212, 3.562703, 0.1568628, 0, 1, 1,
0.5294591, -0.4640103, 2.311329, 0.1647059, 0, 1, 1,
0.5323074, 2.385981, 1.028098, 0.1686275, 0, 1, 1,
0.5324571, 0.3128231, 0.4449147, 0.1764706, 0, 1, 1,
0.533525, -0.8036345, 2.36324, 0.1803922, 0, 1, 1,
0.5353413, -1.280326, 3.074106, 0.1882353, 0, 1, 1,
0.5354426, -1.30338, 2.635772, 0.1921569, 0, 1, 1,
0.538911, -0.1029067, 0.8428833, 0.2, 0, 1, 1,
0.5417932, 1.482318, 1.401435, 0.2078431, 0, 1, 1,
0.5423925, 0.345576, 0.3987002, 0.2117647, 0, 1, 1,
0.5438244, 0.7695456, -0.5275983, 0.2196078, 0, 1, 1,
0.5471645, -0.03572898, 0.4438079, 0.2235294, 0, 1, 1,
0.5497321, -0.02047981, 1.647906, 0.2313726, 0, 1, 1,
0.552018, 0.4344001, 1.776881, 0.2352941, 0, 1, 1,
0.5544727, 0.2086324, 1.501392, 0.2431373, 0, 1, 1,
0.5558019, -0.8659489, 2.279497, 0.2470588, 0, 1, 1,
0.5590671, -0.1183223, 1.361932, 0.254902, 0, 1, 1,
0.5595404, -0.3002164, 2.411293, 0.2588235, 0, 1, 1,
0.5605095, -1.066733, 1.328584, 0.2666667, 0, 1, 1,
0.5606795, 0.7372041, 0.1449645, 0.2705882, 0, 1, 1,
0.5615156, 1.343445, 1.735718, 0.2784314, 0, 1, 1,
0.5632228, 0.4108642, 0.4955217, 0.282353, 0, 1, 1,
0.5670838, 0.5433619, 1.605475, 0.2901961, 0, 1, 1,
0.5681395, 1.454538, 0.7102981, 0.2941177, 0, 1, 1,
0.5747002, -0.4964482, 3.885547, 0.3019608, 0, 1, 1,
0.5776199, 0.5094767, 2.571076, 0.3098039, 0, 1, 1,
0.58076, -0.3549835, 3.198078, 0.3137255, 0, 1, 1,
0.5811468, -0.1177986, 2.055693, 0.3215686, 0, 1, 1,
0.5817378, 0.9482088, -0.8532836, 0.3254902, 0, 1, 1,
0.5830456, 0.09260883, 1.044945, 0.3333333, 0, 1, 1,
0.583101, -1.345969, 3.146057, 0.3372549, 0, 1, 1,
0.583244, -0.81404, 3.046514, 0.345098, 0, 1, 1,
0.586291, -0.1232524, 1.689642, 0.3490196, 0, 1, 1,
0.5868644, -0.8695964, 4.333811, 0.3568628, 0, 1, 1,
0.5869538, -0.2203521, 0.6168826, 0.3607843, 0, 1, 1,
0.5897282, -1.002416, 2.570577, 0.3686275, 0, 1, 1,
0.5923439, 0.3207905, 0.25162, 0.372549, 0, 1, 1,
0.6020308, -1.600913, 3.478214, 0.3803922, 0, 1, 1,
0.6165696, -1.281067, 3.887542, 0.3843137, 0, 1, 1,
0.6206791, 1.919348, 0.7447871, 0.3921569, 0, 1, 1,
0.6207116, 0.5308911, 0.6888512, 0.3960784, 0, 1, 1,
0.6265054, 1.41422, 0.7749397, 0.4039216, 0, 1, 1,
0.6325632, -1.617558, 3.39589, 0.4117647, 0, 1, 1,
0.6352422, 1.046313, 0.220977, 0.4156863, 0, 1, 1,
0.6402071, 0.9466223, 0.9084378, 0.4235294, 0, 1, 1,
0.6404313, -0.3812494, 1.34443, 0.427451, 0, 1, 1,
0.6447026, -0.8800239, 2.451901, 0.4352941, 0, 1, 1,
0.6506031, -0.6213608, 2.275541, 0.4392157, 0, 1, 1,
0.6542022, 0.2627917, 1.019647, 0.4470588, 0, 1, 1,
0.6562823, -1.332594, 1.188494, 0.4509804, 0, 1, 1,
0.6611049, -1.102538, 1.732531, 0.4588235, 0, 1, 1,
0.6642845, -0.9490215, 3.718186, 0.4627451, 0, 1, 1,
0.6699393, 0.4133125, 0.7218993, 0.4705882, 0, 1, 1,
0.6883292, -0.5155623, 1.393926, 0.4745098, 0, 1, 1,
0.6883432, -0.02761709, 1.404557, 0.4823529, 0, 1, 1,
0.6899063, -0.5405554, 2.371078, 0.4862745, 0, 1, 1,
0.6925873, -0.5136817, 2.667449, 0.4941176, 0, 1, 1,
0.7092436, 0.9607277, 2.134912, 0.5019608, 0, 1, 1,
0.7096257, 0.7996975, 0.08171631, 0.5058824, 0, 1, 1,
0.7103462, -0.3690504, 2.986936, 0.5137255, 0, 1, 1,
0.7134404, -0.501388, 1.093038, 0.5176471, 0, 1, 1,
0.7158232, 1.499913, -0.3714516, 0.5254902, 0, 1, 1,
0.7172385, 0.540967, 0.009835812, 0.5294118, 0, 1, 1,
0.7187417, -0.8216596, 1.836885, 0.5372549, 0, 1, 1,
0.7226983, -0.2100996, 0.7022253, 0.5411765, 0, 1, 1,
0.7283131, -0.2616614, 0.1769536, 0.5490196, 0, 1, 1,
0.7377326, 0.2198532, 1.660268, 0.5529412, 0, 1, 1,
0.7390977, 1.143607, 0.7962059, 0.5607843, 0, 1, 1,
0.7444292, -1.28435, 0.09984504, 0.5647059, 0, 1, 1,
0.7478834, -2.436259, 1.645157, 0.572549, 0, 1, 1,
0.7567388, -2.061335, 3.567417, 0.5764706, 0, 1, 1,
0.7596174, -1.717164, 3.681446, 0.5843138, 0, 1, 1,
0.7600707, 0.07700907, 0.4316135, 0.5882353, 0, 1, 1,
0.7612066, 0.2408429, 0.7780731, 0.5960785, 0, 1, 1,
0.7632416, -0.3380319, 1.789068, 0.6039216, 0, 1, 1,
0.7675571, -0.7030391, 1.580076, 0.6078432, 0, 1, 1,
0.7678, -1.015347, 2.897837, 0.6156863, 0, 1, 1,
0.7710011, -0.9628348, 1.647839, 0.6196079, 0, 1, 1,
0.7746582, -2.005053, 3.398728, 0.627451, 0, 1, 1,
0.7831556, 0.3747846, 0.2530472, 0.6313726, 0, 1, 1,
0.7856383, 0.1367415, 1.529069, 0.6392157, 0, 1, 1,
0.7864344, -1.029711, 2.540794, 0.6431373, 0, 1, 1,
0.7868956, -0.6842358, 1.722146, 0.6509804, 0, 1, 1,
0.7872985, 1.685422, -0.6086423, 0.654902, 0, 1, 1,
0.7876121, 1.120511, 0.8540885, 0.6627451, 0, 1, 1,
0.7888988, 0.5564702, 0.739679, 0.6666667, 0, 1, 1,
0.7926321, 0.1512091, 2.373481, 0.6745098, 0, 1, 1,
0.7934969, 0.1406386, 3.870154, 0.6784314, 0, 1, 1,
0.7954099, -2.834718, 3.257496, 0.6862745, 0, 1, 1,
0.7969118, 0.3617665, 1.241339, 0.6901961, 0, 1, 1,
0.7969677, 0.3628323, -0.4403507, 0.6980392, 0, 1, 1,
0.7980018, -0.0820141, 1.799832, 0.7058824, 0, 1, 1,
0.799542, 0.7787046, 2.514917, 0.7098039, 0, 1, 1,
0.8001302, -1.431596, 1.91002, 0.7176471, 0, 1, 1,
0.8034107, 0.6275715, 2.924684, 0.7215686, 0, 1, 1,
0.8034682, 1.269551, 1.039326, 0.7294118, 0, 1, 1,
0.8047265, 0.7410655, 0.08827075, 0.7333333, 0, 1, 1,
0.8064122, -2.363536, 1.281213, 0.7411765, 0, 1, 1,
0.8079078, 0.8048958, 1.238626, 0.7450981, 0, 1, 1,
0.8160835, -0.4769699, 3.338455, 0.7529412, 0, 1, 1,
0.8166192, 0.520027, 1.767926, 0.7568628, 0, 1, 1,
0.8182127, -2.002039, 2.283944, 0.7647059, 0, 1, 1,
0.8215366, 0.5343549, 1.440004, 0.7686275, 0, 1, 1,
0.8216451, -1.787746, 3.18872, 0.7764706, 0, 1, 1,
0.8247356, -0.1741008, 2.295742, 0.7803922, 0, 1, 1,
0.8274366, -0.1356459, 0.6708167, 0.7882353, 0, 1, 1,
0.828798, -0.786431, 1.106981, 0.7921569, 0, 1, 1,
0.8306999, 1.041051, 1.267047, 0.8, 0, 1, 1,
0.8311056, 0.3841142, 2.006273, 0.8078431, 0, 1, 1,
0.8347588, -1.749522, 2.63713, 0.8117647, 0, 1, 1,
0.8408971, 1.243307, 0.8601702, 0.8196079, 0, 1, 1,
0.8459725, -0.5043795, 0.3954281, 0.8235294, 0, 1, 1,
0.8500224, 1.498814, 0.4427942, 0.8313726, 0, 1, 1,
0.8529801, -0.2750472, 0.4203176, 0.8352941, 0, 1, 1,
0.8537787, 0.7624158, 0.5999728, 0.8431373, 0, 1, 1,
0.8565487, -0.9026858, 3.899183, 0.8470588, 0, 1, 1,
0.8571398, 0.6597827, 2.962298, 0.854902, 0, 1, 1,
0.8710134, 0.1720836, 2.741318, 0.8588235, 0, 1, 1,
0.8722293, -0.3243115, 3.448582, 0.8666667, 0, 1, 1,
0.8723001, -0.3380202, 3.656718, 0.8705882, 0, 1, 1,
0.8745498, -0.1537734, 2.2248, 0.8784314, 0, 1, 1,
0.8828586, -1.210734, 3.213478, 0.8823529, 0, 1, 1,
0.8871211, 0.9172761, -1.111474, 0.8901961, 0, 1, 1,
0.8922175, -0.1628882, 1.336095, 0.8941177, 0, 1, 1,
0.894272, 0.8002064, 0.3893517, 0.9019608, 0, 1, 1,
0.8961433, -0.1016284, 2.244786, 0.9098039, 0, 1, 1,
0.9075268, -0.3822491, 0.8923152, 0.9137255, 0, 1, 1,
0.9144219, -1.462376, 3.696511, 0.9215686, 0, 1, 1,
0.9186817, 0.573283, 2.922066, 0.9254902, 0, 1, 1,
0.9320692, -1.422462, 1.808262, 0.9333333, 0, 1, 1,
0.9327103, 0.2352906, 2.321751, 0.9372549, 0, 1, 1,
0.9498405, -1.249049, 3.223278, 0.945098, 0, 1, 1,
0.9572847, -0.8541692, 1.92441, 0.9490196, 0, 1, 1,
0.9598582, 1.560172, 1.129498, 0.9568627, 0, 1, 1,
0.9669915, 1.735804, -0.09047338, 0.9607843, 0, 1, 1,
0.9685969, 1.119069, 0.05380312, 0.9686275, 0, 1, 1,
0.9742956, 1.168667, 1.439516, 0.972549, 0, 1, 1,
0.978189, 0.3805507, 2.151565, 0.9803922, 0, 1, 1,
0.9812335, -0.148665, 2.051559, 0.9843137, 0, 1, 1,
0.9905248, -1.261158, 1.852898, 0.9921569, 0, 1, 1,
1.023047, 0.9659902, 2.128439, 0.9960784, 0, 1, 1,
1.03877, 0.5746078, -0.5727906, 1, 0, 0.9960784, 1,
1.039643, 0.389694, 1.532599, 1, 0, 0.9882353, 1,
1.040248, -0.3507237, 0.8486903, 1, 0, 0.9843137, 1,
1.042621, -3.215519, 2.090647, 1, 0, 0.9764706, 1,
1.049833, -0.7967757, 3.941305, 1, 0, 0.972549, 1,
1.06131, 0.2945459, 0.7006912, 1, 0, 0.9647059, 1,
1.06548, -1.489465, 3.63126, 1, 0, 0.9607843, 1,
1.072643, 0.6229504, -0.6063842, 1, 0, 0.9529412, 1,
1.076753, -0.03383636, 0.7525254, 1, 0, 0.9490196, 1,
1.077995, 0.945447, 1.045512, 1, 0, 0.9411765, 1,
1.081374, -0.04963617, 1.519221, 1, 0, 0.9372549, 1,
1.082829, -1.495076, 2.697109, 1, 0, 0.9294118, 1,
1.086612, 0.1282663, 1.092964, 1, 0, 0.9254902, 1,
1.087494, 1.05338, 0.7671254, 1, 0, 0.9176471, 1,
1.091317, -0.4475777, 1.555632, 1, 0, 0.9137255, 1,
1.093084, -0.7957838, 3.71616, 1, 0, 0.9058824, 1,
1.094451, 0.1662657, 0.6106088, 1, 0, 0.9019608, 1,
1.095566, 0.7684826, -0.3871861, 1, 0, 0.8941177, 1,
1.1033, 1.238743, 0.6753275, 1, 0, 0.8862745, 1,
1.108574, -0.9810926, 2.135732, 1, 0, 0.8823529, 1,
1.109979, -1.196762, 2.425314, 1, 0, 0.8745098, 1,
1.114328, -1.8745, 3.685414, 1, 0, 0.8705882, 1,
1.117255, 0.9489578, 0.552129, 1, 0, 0.8627451, 1,
1.121764, 1.014868, 1.16496, 1, 0, 0.8588235, 1,
1.122052, 1.413332, 2.357663, 1, 0, 0.8509804, 1,
1.122391, 1.423215, 0.64596, 1, 0, 0.8470588, 1,
1.126189, -0.4001942, 2.218586, 1, 0, 0.8392157, 1,
1.126702, -0.9507327, 0.2240585, 1, 0, 0.8352941, 1,
1.132581, 0.3328047, 2.332189, 1, 0, 0.827451, 1,
1.136389, -0.5046754, 3.523557, 1, 0, 0.8235294, 1,
1.138641, -0.5292928, 2.397578, 1, 0, 0.8156863, 1,
1.140248, 0.0889318, 3.37814, 1, 0, 0.8117647, 1,
1.144568, -0.8287357, 2.655892, 1, 0, 0.8039216, 1,
1.145658, -0.07254161, 0.3167209, 1, 0, 0.7960784, 1,
1.148422, -1.337215, 1.074954, 1, 0, 0.7921569, 1,
1.156654, -0.02100563, 2.177236, 1, 0, 0.7843137, 1,
1.157741, -0.1772354, 2.812117, 1, 0, 0.7803922, 1,
1.159255, -0.3767211, 0.7319291, 1, 0, 0.772549, 1,
1.159424, -0.1740538, 0.6198654, 1, 0, 0.7686275, 1,
1.160111, 0.1027083, 1.298587, 1, 0, 0.7607843, 1,
1.171563, -2.699433, 4.660756, 1, 0, 0.7568628, 1,
1.175289, 0.5018033, 0.2792771, 1, 0, 0.7490196, 1,
1.181231, -1.795519, 4.725455, 1, 0, 0.7450981, 1,
1.187319, -0.2758869, 4.417243, 1, 0, 0.7372549, 1,
1.191669, -0.06190538, 1.380488, 1, 0, 0.7333333, 1,
1.195639, 1.394268, 0.501182, 1, 0, 0.7254902, 1,
1.199175, 0.4232558, 1.365549, 1, 0, 0.7215686, 1,
1.201445, -1.00724, 3.327235, 1, 0, 0.7137255, 1,
1.201473, 0.589319, 1.53486, 1, 0, 0.7098039, 1,
1.203229, 1.74113, 1.613319, 1, 0, 0.7019608, 1,
1.209525, -1.082145, 2.019239, 1, 0, 0.6941177, 1,
1.211949, 0.1444916, 0.1865061, 1, 0, 0.6901961, 1,
1.215884, -0.950649, 2.328431, 1, 0, 0.682353, 1,
1.218698, -0.7842413, 1.071124, 1, 0, 0.6784314, 1,
1.22154, 1.077393, 2.223844, 1, 0, 0.6705883, 1,
1.224762, 1.022092, 0.7532359, 1, 0, 0.6666667, 1,
1.225524, 1.737934, 1.336287, 1, 0, 0.6588235, 1,
1.230118, -1.698109, 2.915028, 1, 0, 0.654902, 1,
1.232887, -0.3668737, 2.219935, 1, 0, 0.6470588, 1,
1.239425, -0.2376796, -1.476519, 1, 0, 0.6431373, 1,
1.240229, -0.8727269, 2.989843, 1, 0, 0.6352941, 1,
1.241643, 1.973157, 0.8708704, 1, 0, 0.6313726, 1,
1.24459, -0.8181353, 1.460687, 1, 0, 0.6235294, 1,
1.245936, -0.4400052, 2.192573, 1, 0, 0.6196079, 1,
1.247228, 1.817567, 0.1729476, 1, 0, 0.6117647, 1,
1.249547, -1.103356, 3.203751, 1, 0, 0.6078432, 1,
1.251478, 1.12611, 0.3681675, 1, 0, 0.6, 1,
1.260697, 0.4434493, 1.507167, 1, 0, 0.5921569, 1,
1.264478, -0.4145206, 2.824309, 1, 0, 0.5882353, 1,
1.281048, -0.7441626, 2.670559, 1, 0, 0.5803922, 1,
1.287901, -1.275844, 3.793349, 1, 0, 0.5764706, 1,
1.289212, 0.1836399, 2.978487, 1, 0, 0.5686275, 1,
1.305369, 0.1820082, 1.090883, 1, 0, 0.5647059, 1,
1.305511, 0.9215541, 1.665902, 1, 0, 0.5568628, 1,
1.320582, 0.2587324, 2.588975, 1, 0, 0.5529412, 1,
1.33398, -1.572645, 1.685438, 1, 0, 0.5450981, 1,
1.336555, 0.6964029, 0.1594068, 1, 0, 0.5411765, 1,
1.341547, -0.488872, 3.497102, 1, 0, 0.5333334, 1,
1.348243, 0.285861, 1.121744, 1, 0, 0.5294118, 1,
1.350915, -0.6305598, 4.12816, 1, 0, 0.5215687, 1,
1.351236, 0.5713421, -0.973901, 1, 0, 0.5176471, 1,
1.357632, 0.6676714, 1.206315, 1, 0, 0.509804, 1,
1.36129, -0.02329255, 2.686103, 1, 0, 0.5058824, 1,
1.36732, -0.8085687, 1.99272, 1, 0, 0.4980392, 1,
1.370858, -0.221605, 1.218753, 1, 0, 0.4901961, 1,
1.381359, 0.459234, 0.9477172, 1, 0, 0.4862745, 1,
1.381558, -0.2988206, 1.877203, 1, 0, 0.4784314, 1,
1.382309, -1.259365, 3.620711, 1, 0, 0.4745098, 1,
1.388374, -0.5465229, 0.7085118, 1, 0, 0.4666667, 1,
1.398039, 0.2130106, 2.55816, 1, 0, 0.4627451, 1,
1.40377, -1.371668, 1.401164, 1, 0, 0.454902, 1,
1.409203, 0.6105081, -0.06577528, 1, 0, 0.4509804, 1,
1.410637, -0.01299699, 1.809049, 1, 0, 0.4431373, 1,
1.436492, -0.0684468, 2.196211, 1, 0, 0.4392157, 1,
1.444891, 1.360479, 1.505458, 1, 0, 0.4313726, 1,
1.446431, 0.2439691, 1.247201, 1, 0, 0.427451, 1,
1.450635, -1.174243, 2.313838, 1, 0, 0.4196078, 1,
1.450655, -1.058418, 4.331246, 1, 0, 0.4156863, 1,
1.453274, -0.8275887, 2.430006, 1, 0, 0.4078431, 1,
1.456145, 0.09773767, 2.240838, 1, 0, 0.4039216, 1,
1.460578, 1.339295, 1.587263, 1, 0, 0.3960784, 1,
1.469629, 0.02872809, 2.451598, 1, 0, 0.3882353, 1,
1.485774, -2.293029, 3.138221, 1, 0, 0.3843137, 1,
1.498226, 0.4748259, 1.033604, 1, 0, 0.3764706, 1,
1.504346, 0.74777, 1.73496, 1, 0, 0.372549, 1,
1.512408, -0.2850977, 1.642606, 1, 0, 0.3647059, 1,
1.524158, 0.1679809, 1.524798, 1, 0, 0.3607843, 1,
1.52974, 0.9229525, 0.5705634, 1, 0, 0.3529412, 1,
1.530464, -0.6604497, 2.087862, 1, 0, 0.3490196, 1,
1.531369, -0.5519412, 1.719293, 1, 0, 0.3411765, 1,
1.548537, 2.57325, -1.677614, 1, 0, 0.3372549, 1,
1.550494, 0.5372406, 1.225085, 1, 0, 0.3294118, 1,
1.55408, -0.6653399, 2.497977, 1, 0, 0.3254902, 1,
1.555773, 0.7259629, 0.9448828, 1, 0, 0.3176471, 1,
1.561038, 0.5340094, 2.910546, 1, 0, 0.3137255, 1,
1.576885, 0.2459407, 1.476514, 1, 0, 0.3058824, 1,
1.580519, -2.429443, 1.981681, 1, 0, 0.2980392, 1,
1.590606, 0.6013793, 0.6850185, 1, 0, 0.2941177, 1,
1.596058, 0.08992603, 1.764539, 1, 0, 0.2862745, 1,
1.617392, -0.8980831, 3.580744, 1, 0, 0.282353, 1,
1.638537, 0.8745769, 0.4178686, 1, 0, 0.2745098, 1,
1.640029, 0.9691869, 0.9064892, 1, 0, 0.2705882, 1,
1.640706, -0.2755933, 1.159917, 1, 0, 0.2627451, 1,
1.645759, 1.32658, 0.1265421, 1, 0, 0.2588235, 1,
1.652182, -0.1632145, 1.052371, 1, 0, 0.2509804, 1,
1.659104, 0.4130923, 1.139493, 1, 0, 0.2470588, 1,
1.659243, 0.9182798, 0.09644254, 1, 0, 0.2392157, 1,
1.665288, 1.062153, 0.1937405, 1, 0, 0.2352941, 1,
1.673256, 0.3204204, 0.5960381, 1, 0, 0.227451, 1,
1.732186, -1.005773, 1.783601, 1, 0, 0.2235294, 1,
1.741172, 0.6383722, 2.280163, 1, 0, 0.2156863, 1,
1.74947, 0.1240483, 0.8239511, 1, 0, 0.2117647, 1,
1.776876, -0.6867366, 1.113006, 1, 0, 0.2039216, 1,
1.784818, -3.440794, 2.351623, 1, 0, 0.1960784, 1,
1.791605, -1.07889, 1.671654, 1, 0, 0.1921569, 1,
1.807218, -1.163891, 1.860539, 1, 0, 0.1843137, 1,
1.810168, -1.791369, 2.934845, 1, 0, 0.1803922, 1,
1.819768, 0.2457732, -0.320931, 1, 0, 0.172549, 1,
1.831706, -0.7598699, 3.718215, 1, 0, 0.1686275, 1,
1.878398, -0.9761551, 3.6868, 1, 0, 0.1607843, 1,
1.884525, 0.5465787, 0.04190661, 1, 0, 0.1568628, 1,
1.890465, -0.9126509, 2.2119, 1, 0, 0.1490196, 1,
1.890614, -0.3457863, 0.3775891, 1, 0, 0.145098, 1,
1.894454, -0.2890121, 1.264533, 1, 0, 0.1372549, 1,
1.907112, 0.3330663, 2.866372, 1, 0, 0.1333333, 1,
1.907964, -0.5289356, 2.429694, 1, 0, 0.1254902, 1,
1.913214, 0.02745521, 0.9696615, 1, 0, 0.1215686, 1,
1.920064, -0.08120617, 0.1299028, 1, 0, 0.1137255, 1,
1.925584, 0.1080748, 1.64724, 1, 0, 0.1098039, 1,
1.974628, -1.578596, 2.870014, 1, 0, 0.1019608, 1,
1.977772, -3.844418, 1.615612, 1, 0, 0.09411765, 1,
1.980163, -1.926285, 3.243514, 1, 0, 0.09019608, 1,
2.027814, 1.683324, 2.5165, 1, 0, 0.08235294, 1,
2.043818, 0.6335639, 2.094662, 1, 0, 0.07843138, 1,
2.14363, -0.6440609, 0.7394427, 1, 0, 0.07058824, 1,
2.255222, 0.2608419, 1.791653, 1, 0, 0.06666667, 1,
2.261189, -0.31467, 2.31669, 1, 0, 0.05882353, 1,
2.389585, -0.3566074, 1.084323, 1, 0, 0.05490196, 1,
2.418898, 0.0758015, 2.562027, 1, 0, 0.04705882, 1,
2.512022, 0.6653189, 1.389446, 1, 0, 0.04313726, 1,
2.520098, -0.5528382, 2.316132, 1, 0, 0.03529412, 1,
2.578909, 0.8439418, 2.061864, 1, 0, 0.03137255, 1,
2.661966, 0.09702833, 3.372102, 1, 0, 0.02352941, 1,
2.718731, -0.195376, 1.754531, 1, 0, 0.01960784, 1,
2.745313, -1.093242, 1.714985, 1, 0, 0.01176471, 1,
3.531331, 0.7572284, 1.459166, 1, 0, 0.007843138, 1
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
0.2372808, -5.048914, -7.34636, 0, -0.5, 0.5, 0.5,
0.2372808, -5.048914, -7.34636, 1, -0.5, 0.5, 0.5,
0.2372808, -5.048914, -7.34636, 1, 1.5, 0.5, 0.5,
0.2372808, -5.048914, -7.34636, 0, 1.5, 0.5, 0.5
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
-4.173452, -0.2913295, -7.34636, 0, -0.5, 0.5, 0.5,
-4.173452, -0.2913295, -7.34636, 1, -0.5, 0.5, 0.5,
-4.173452, -0.2913295, -7.34636, 1, 1.5, 0.5, 0.5,
-4.173452, -0.2913295, -7.34636, 0, 1.5, 0.5, 0.5
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
-4.173452, -5.048914, 0.2019958, 0, -0.5, 0.5, 0.5,
-4.173452, -5.048914, 0.2019958, 1, -0.5, 0.5, 0.5,
-4.173452, -5.048914, 0.2019958, 1, 1.5, 0.5, 0.5,
-4.173452, -5.048914, 0.2019958, 0, 1.5, 0.5, 0.5
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
-3, -3.95101, -5.604432,
3, -3.95101, -5.604432,
-3, -3.95101, -5.604432,
-3, -4.133994, -5.894753,
-2, -3.95101, -5.604432,
-2, -4.133994, -5.894753,
-1, -3.95101, -5.604432,
-1, -4.133994, -5.894753,
0, -3.95101, -5.604432,
0, -4.133994, -5.894753,
1, -3.95101, -5.604432,
1, -4.133994, -5.894753,
2, -3.95101, -5.604432,
2, -4.133994, -5.894753,
3, -3.95101, -5.604432,
3, -4.133994, -5.894753
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
-3, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
-3, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
-3, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
-3, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
-2, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
-2, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
-2, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
-2, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
-1, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
-1, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
-1, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
-1, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
0, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
0, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
0, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
0, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
1, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
1, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
1, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
1, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
2, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
2, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
2, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
2, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5,
3, -4.499962, -6.475396, 0, -0.5, 0.5, 0.5,
3, -4.499962, -6.475396, 1, -0.5, 0.5, 0.5,
3, -4.499962, -6.475396, 1, 1.5, 0.5, 0.5,
3, -4.499962, -6.475396, 0, 1.5, 0.5, 0.5
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
-3.155591, -2, -5.604432,
-3.155591, 2, -5.604432,
-3.155591, -2, -5.604432,
-3.325234, -2, -5.894753,
-3.155591, 0, -5.604432,
-3.325234, 0, -5.894753,
-3.155591, 2, -5.604432,
-3.325234, 2, -5.894753
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
-3.664521, -2, -6.475396, 0, -0.5, 0.5, 0.5,
-3.664521, -2, -6.475396, 1, -0.5, 0.5, 0.5,
-3.664521, -2, -6.475396, 1, 1.5, 0.5, 0.5,
-3.664521, -2, -6.475396, 0, 1.5, 0.5, 0.5,
-3.664521, 0, -6.475396, 0, -0.5, 0.5, 0.5,
-3.664521, 0, -6.475396, 1, -0.5, 0.5, 0.5,
-3.664521, 0, -6.475396, 1, 1.5, 0.5, 0.5,
-3.664521, 0, -6.475396, 0, 1.5, 0.5, 0.5,
-3.664521, 2, -6.475396, 0, -0.5, 0.5, 0.5,
-3.664521, 2, -6.475396, 1, -0.5, 0.5, 0.5,
-3.664521, 2, -6.475396, 1, 1.5, 0.5, 0.5,
-3.664521, 2, -6.475396, 0, 1.5, 0.5, 0.5
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
-3.155591, -3.95101, -4,
-3.155591, -3.95101, 4,
-3.155591, -3.95101, -4,
-3.325234, -4.133994, -4,
-3.155591, -3.95101, -2,
-3.325234, -4.133994, -2,
-3.155591, -3.95101, 0,
-3.325234, -4.133994, 0,
-3.155591, -3.95101, 2,
-3.325234, -4.133994, 2,
-3.155591, -3.95101, 4,
-3.325234, -4.133994, 4
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
-3.664521, -4.499962, -4, 0, -0.5, 0.5, 0.5,
-3.664521, -4.499962, -4, 1, -0.5, 0.5, 0.5,
-3.664521, -4.499962, -4, 1, 1.5, 0.5, 0.5,
-3.664521, -4.499962, -4, 0, 1.5, 0.5, 0.5,
-3.664521, -4.499962, -2, 0, -0.5, 0.5, 0.5,
-3.664521, -4.499962, -2, 1, -0.5, 0.5, 0.5,
-3.664521, -4.499962, -2, 1, 1.5, 0.5, 0.5,
-3.664521, -4.499962, -2, 0, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 0, 0, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 0, 1, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 0, 1, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 0, 0, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 2, 0, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 2, 1, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 2, 1, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 2, 0, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 4, 0, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 4, 1, -0.5, 0.5, 0.5,
-3.664521, -4.499962, 4, 1, 1.5, 0.5, 0.5,
-3.664521, -4.499962, 4, 0, 1.5, 0.5, 0.5
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
-3.155591, -3.95101, -5.604432,
-3.155591, 3.368351, -5.604432,
-3.155591, -3.95101, 6.008423,
-3.155591, 3.368351, 6.008423,
-3.155591, -3.95101, -5.604432,
-3.155591, -3.95101, 6.008423,
-3.155591, 3.368351, -5.604432,
-3.155591, 3.368351, 6.008423,
-3.155591, -3.95101, -5.604432,
3.630152, -3.95101, -5.604432,
-3.155591, -3.95101, 6.008423,
3.630152, -3.95101, 6.008423,
-3.155591, 3.368351, -5.604432,
3.630152, 3.368351, -5.604432,
-3.155591, 3.368351, 6.008423,
3.630152, 3.368351, 6.008423,
3.630152, -3.95101, -5.604432,
3.630152, 3.368351, -5.604432,
3.630152, -3.95101, 6.008423,
3.630152, 3.368351, 6.008423,
3.630152, -3.95101, -5.604432,
3.630152, -3.95101, 6.008423,
3.630152, 3.368351, -5.604432,
3.630152, 3.368351, 6.008423
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
var radius = 8.176666;
var distance = 36.37891;
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
mvMatrix.translate( -0.2372808, 0.2913295, -0.2019958 );
mvMatrix.scale( 1.302845, 1.207861, 0.7612919 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.37891);
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
bensultap<-read.table("bensultap.xyz")
```

```
## Error in read.table("bensultap.xyz"): no lines available in input
```

```r
x<-bensultap$V2
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
y<-bensultap$V3
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
z<-bensultap$V4
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
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
-3.056769, -0.8834374, -0.5824242, 0, 0, 1, 1, 1,
-3.013434, 0.7115226, -2.495544, 1, 0, 0, 1, 1,
-2.729001, -1.163836, -1.775226, 1, 0, 0, 1, 1,
-2.699747, 1.665676, -0.8321931, 1, 0, 0, 1, 1,
-2.548569, -0.804031, -2.019298, 1, 0, 0, 1, 1,
-2.236732, 0.02900575, -0.4983378, 1, 0, 0, 1, 1,
-2.218768, 0.9231685, -2.282387, 0, 0, 0, 1, 1,
-2.08871, -1.233423, -2.350391, 0, 0, 0, 1, 1,
-2.041281, -1.573402, -2.506656, 0, 0, 0, 1, 1,
-2.010921, 0.05973725, -1.753323, 0, 0, 0, 1, 1,
-2.009384, 1.977507, 0.7298981, 0, 0, 0, 1, 1,
-2.000458, -0.7386049, -1.266657, 0, 0, 0, 1, 1,
-1.994519, -0.5625266, -1.532882, 0, 0, 0, 1, 1,
-1.993514, -0.8703523, -2.179278, 1, 1, 1, 1, 1,
-1.98165, 0.6810375, -1.857045, 1, 1, 1, 1, 1,
-1.969108, 1.966336, -1.133563, 1, 1, 1, 1, 1,
-1.96358, 1.54829, -2.23377, 1, 1, 1, 1, 1,
-1.941076, 0.6690078, -2.167473, 1, 1, 1, 1, 1,
-1.939473, 0.5517638, 0.2348245, 1, 1, 1, 1, 1,
-1.924008, 0.2496322, -1.666934, 1, 1, 1, 1, 1,
-1.904114, -0.9901922, -3.217115, 1, 1, 1, 1, 1,
-1.878901, -2.482539, -1.677623, 1, 1, 1, 1, 1,
-1.874194, -0.134026, -4.624654, 1, 1, 1, 1, 1,
-1.86894, 0.4343763, -0.07261243, 1, 1, 1, 1, 1,
-1.867869, 0.1204622, -0.6715008, 1, 1, 1, 1, 1,
-1.864771, 0.2255212, -0.2864346, 1, 1, 1, 1, 1,
-1.859986, 1.133306, 0.2986868, 1, 1, 1, 1, 1,
-1.859685, 0.5952893, -0.7233728, 1, 1, 1, 1, 1,
-1.847363, 0.1357562, -3.130982, 0, 0, 1, 1, 1,
-1.829987, 1.286597, -3.754237, 1, 0, 0, 1, 1,
-1.829852, 0.1560125, -0.1962415, 1, 0, 0, 1, 1,
-1.763337, 0.9619788, -0.7408257, 1, 0, 0, 1, 1,
-1.76053, -0.7482061, -2.047523, 1, 0, 0, 1, 1,
-1.756135, -0.9819814, -1.750673, 1, 0, 0, 1, 1,
-1.751764, -1.234631, -1.25158, 0, 0, 0, 1, 1,
-1.743138, -0.407983, -2.438694, 0, 0, 0, 1, 1,
-1.737401, 0.7970311, -1.949295, 0, 0, 0, 1, 1,
-1.705686, 1.116976, -1.259002, 0, 0, 0, 1, 1,
-1.688222, 0.8722146, 0.2241079, 0, 0, 0, 1, 1,
-1.674626, 1.29736, 0.6697871, 0, 0, 0, 1, 1,
-1.663725, -0.3171008, -3.416279, 0, 0, 0, 1, 1,
-1.61205, 0.6640046, -1.014871, 1, 1, 1, 1, 1,
-1.607568, 0.4876757, -1.706358, 1, 1, 1, 1, 1,
-1.604974, 0.9965069, -1.645918, 1, 1, 1, 1, 1,
-1.589548, -0.8727756, -2.609283, 1, 1, 1, 1, 1,
-1.58579, 0.7617307, -1.621828, 1, 1, 1, 1, 1,
-1.573567, 0.27993, -1.557121, 1, 1, 1, 1, 1,
-1.572968, -1.427364, -2.471398, 1, 1, 1, 1, 1,
-1.57149, -1.644637, -2.726528, 1, 1, 1, 1, 1,
-1.569333, -0.2873257, -0.7255918, 1, 1, 1, 1, 1,
-1.565407, 1.838274, -1.450757, 1, 1, 1, 1, 1,
-1.546011, 0.46037, -2.30801, 1, 1, 1, 1, 1,
-1.544425, -0.2847446, -4.493069, 1, 1, 1, 1, 1,
-1.526819, -0.3858494, -0.7424728, 1, 1, 1, 1, 1,
-1.52515, 1.109725, -0.3609325, 1, 1, 1, 1, 1,
-1.510626, 0.4723647, -1.733566, 1, 1, 1, 1, 1,
-1.508699, -1.336234, -2.433653, 0, 0, 1, 1, 1,
-1.486301, -0.1570699, -2.350236, 1, 0, 0, 1, 1,
-1.484554, -1.871137, -2.515724, 1, 0, 0, 1, 1,
-1.475159, -0.8684583, -0.5081265, 1, 0, 0, 1, 1,
-1.469767, 0.1852052, -2.22327, 1, 0, 0, 1, 1,
-1.45662, 1.075034, -1.203432, 1, 0, 0, 1, 1,
-1.441284, -1.018495, -2.044325, 0, 0, 0, 1, 1,
-1.437999, 0.0107569, -1.719911, 0, 0, 0, 1, 1,
-1.437685, 1.078279, -0.4016635, 0, 0, 0, 1, 1,
-1.432249, 0.6543699, -1.921224, 0, 0, 0, 1, 1,
-1.424953, -0.9234666, -1.674058, 0, 0, 0, 1, 1,
-1.42344, -1.977717, -1.607372, 0, 0, 0, 1, 1,
-1.417324, -0.8179018, -3.309129, 0, 0, 0, 1, 1,
-1.410998, 0.8675298, -1.019974, 1, 1, 1, 1, 1,
-1.410501, 1.042513, -0.2084288, 1, 1, 1, 1, 1,
-1.39992, -0.120815, -0.9862583, 1, 1, 1, 1, 1,
-1.399655, 1.625053, -1.095463, 1, 1, 1, 1, 1,
-1.397501, -1.008296, -2.118115, 1, 1, 1, 1, 1,
-1.394414, 0.9688413, -1.196439, 1, 1, 1, 1, 1,
-1.393212, -0.5600458, -3.519532, 1, 1, 1, 1, 1,
-1.390954, -0.5123186, 1.45401, 1, 1, 1, 1, 1,
-1.385987, -1.159576, -3.068971, 1, 1, 1, 1, 1,
-1.382649, 0.1640605, -1.850792, 1, 1, 1, 1, 1,
-1.377695, -0.3539567, -3.304575, 1, 1, 1, 1, 1,
-1.373411, -0.4143736, -3.677963, 1, 1, 1, 1, 1,
-1.347953, -0.9261231, -1.168144, 1, 1, 1, 1, 1,
-1.344061, 1.979066, -0.1495593, 1, 1, 1, 1, 1,
-1.330142, -0.3994848, -0.3735108, 1, 1, 1, 1, 1,
-1.328636, 0.7482877, -0.5592865, 0, 0, 1, 1, 1,
-1.327254, 0.2961949, -0.9566919, 1, 0, 0, 1, 1,
-1.321477, 0.4483678, -0.8038559, 1, 0, 0, 1, 1,
-1.319514, -0.7760061, -1.819903, 1, 0, 0, 1, 1,
-1.311819, -0.7749211, -2.271116, 1, 0, 0, 1, 1,
-1.311103, 0.3021002, 0.2667136, 1, 0, 0, 1, 1,
-1.303078, -1.031979, -1.320587, 0, 0, 0, 1, 1,
-1.293471, 1.919845, 1.024942, 0, 0, 0, 1, 1,
-1.287978, 2.200372, 0.3030608, 0, 0, 0, 1, 1,
-1.282423, 0.875574, -1.650989, 0, 0, 0, 1, 1,
-1.2694, -0.05288839, 0.8775709, 0, 0, 0, 1, 1,
-1.268346, -0.555084, -3.199128, 0, 0, 0, 1, 1,
-1.261241, -0.1723714, -0.8689626, 0, 0, 0, 1, 1,
-1.25673, -1.1835, -1.631823, 1, 1, 1, 1, 1,
-1.251716, 0.8846824, -1.362427, 1, 1, 1, 1, 1,
-1.248157, 0.6878976, -0.1541802, 1, 1, 1, 1, 1,
-1.24223, -0.4966375, -1.462684, 1, 1, 1, 1, 1,
-1.240094, -0.6018251, -1.104627, 1, 1, 1, 1, 1,
-1.237932, 1.129457, -0.8433708, 1, 1, 1, 1, 1,
-1.236754, -1.641782, -1.254858, 1, 1, 1, 1, 1,
-1.234557, -1.751479, -1.917807, 1, 1, 1, 1, 1,
-1.231953, 0.7935303, -2.007024, 1, 1, 1, 1, 1,
-1.231138, -0.05297105, -3.832187, 1, 1, 1, 1, 1,
-1.213733, 1.954193, -1.782088, 1, 1, 1, 1, 1,
-1.208683, 0.9445366, -0.7788211, 1, 1, 1, 1, 1,
-1.20864, -0.1684017, -1.907015, 1, 1, 1, 1, 1,
-1.207498, 1.763109, -1.386634, 1, 1, 1, 1, 1,
-1.206368, -0.3018604, -1.675201, 1, 1, 1, 1, 1,
-1.199929, -0.2580093, -1.193554, 0, 0, 1, 1, 1,
-1.198337, -0.4909283, -0.6116992, 1, 0, 0, 1, 1,
-1.191055, 1.380852, -0.09835692, 1, 0, 0, 1, 1,
-1.190328, 0.5665075, -1.853997, 1, 0, 0, 1, 1,
-1.186127, 1.051563, -1.556088, 1, 0, 0, 1, 1,
-1.185684, 1.611546, 1.909443, 1, 0, 0, 1, 1,
-1.177781, 0.2187944, -1.182079, 0, 0, 0, 1, 1,
-1.175406, 0.8502773, -0.3051384, 0, 0, 0, 1, 1,
-1.17195, -0.6795234, -0.2418166, 0, 0, 0, 1, 1,
-1.167917, 0.187495, -2.673791, 0, 0, 0, 1, 1,
-1.156463, 0.2746713, -1.179257, 0, 0, 0, 1, 1,
-1.154036, 1.498734, -0.5842878, 0, 0, 0, 1, 1,
-1.149943, -0.1129449, -2.330528, 0, 0, 0, 1, 1,
-1.149458, -1.130456, -2.760587, 1, 1, 1, 1, 1,
-1.146865, -0.1815439, -1.141114, 1, 1, 1, 1, 1,
-1.142049, 0.3110491, 0.5012607, 1, 1, 1, 1, 1,
-1.129793, 0.8204578, -1.046964, 1, 1, 1, 1, 1,
-1.121146, -0.1914501, -0.9154596, 1, 1, 1, 1, 1,
-1.096923, 2.198001, 0.7212076, 1, 1, 1, 1, 1,
-1.096249, 0.9679847, -2.072067, 1, 1, 1, 1, 1,
-1.095386, 2.158736, -0.2025754, 1, 1, 1, 1, 1,
-1.093301, 0.3190456, -3.524221, 1, 1, 1, 1, 1,
-1.093125, -0.2215751, -4.639042, 1, 1, 1, 1, 1,
-1.090101, -0.5071492, -1.738323, 1, 1, 1, 1, 1,
-1.080554, -1.191405, -2.999018, 1, 1, 1, 1, 1,
-1.077419, 1.850206, -0.4346876, 1, 1, 1, 1, 1,
-1.076637, 0.4222514, -0.07358395, 1, 1, 1, 1, 1,
-1.075532, 1.398768, -1.809265, 1, 1, 1, 1, 1,
-1.074523, -1.295916, -3.093865, 0, 0, 1, 1, 1,
-1.068505, -0.4702393, -1.677331, 1, 0, 0, 1, 1,
-1.058549, 0.3311597, -0.4884736, 1, 0, 0, 1, 1,
-1.052631, 1.61648, -0.5755464, 1, 0, 0, 1, 1,
-1.050526, -0.1549522, -1.265316, 1, 0, 0, 1, 1,
-1.050356, -0.8441858, -3.632349, 1, 0, 0, 1, 1,
-1.04334, -0.1799896, -2.617474, 0, 0, 0, 1, 1,
-1.038034, 1.619748, -0.7254772, 0, 0, 0, 1, 1,
-1.0313, -0.7256736, -1.657442, 0, 0, 0, 1, 1,
-1.026048, -0.01336914, -1.758633, 0, 0, 0, 1, 1,
-1.02597, -0.7637736, -2.552594, 0, 0, 0, 1, 1,
-1.023745, -0.4300035, -3.015006, 0, 0, 0, 1, 1,
-1.0156, 1.654946, -2.105502, 0, 0, 0, 1, 1,
-1.011001, 0.6048974, -1.055016, 1, 1, 1, 1, 1,
-1.005399, -0.2053799, -3.16973, 1, 1, 1, 1, 1,
-1.005308, 0.3587608, -1.889193, 1, 1, 1, 1, 1,
-0.9994133, -0.8868728, -2.470014, 1, 1, 1, 1, 1,
-0.9928631, 0.726858, -0.5858361, 1, 1, 1, 1, 1,
-0.9920351, -0.1514196, -3.090288, 1, 1, 1, 1, 1,
-0.9905168, 0.1815857, -0.03027374, 1, 1, 1, 1, 1,
-0.9883211, 0.6444681, -0.8451476, 1, 1, 1, 1, 1,
-0.9851628, -0.6448782, -1.426049, 1, 1, 1, 1, 1,
-0.9778311, -0.6343472, -2.615915, 1, 1, 1, 1, 1,
-0.97156, -0.8803103, -2.491161, 1, 1, 1, 1, 1,
-0.971204, 0.4409387, -0.721475, 1, 1, 1, 1, 1,
-0.965606, -1.514992, -3.695516, 1, 1, 1, 1, 1,
-0.9625263, -1.90123, -1.591609, 1, 1, 1, 1, 1,
-0.9617281, -0.8374202, -2.5873, 1, 1, 1, 1, 1,
-0.9565183, 1.949366, -0.6272179, 0, 0, 1, 1, 1,
-0.9545513, -0.690872, -2.987236, 1, 0, 0, 1, 1,
-0.9364506, -1.117736, -2.766452, 1, 0, 0, 1, 1,
-0.9321283, -1.694485, 0.08764446, 1, 0, 0, 1, 1,
-0.9220804, 0.3430763, 0.2068135, 1, 0, 0, 1, 1,
-0.9183087, 1.183315, -1.071709, 1, 0, 0, 1, 1,
-0.9170815, -0.9929732, -1.833485, 0, 0, 0, 1, 1,
-0.9128967, -1.148807, -2.399937, 0, 0, 0, 1, 1,
-0.9116117, 1.183513, 0.09524937, 0, 0, 0, 1, 1,
-0.9110832, -0.9934856, -2.976056, 0, 0, 0, 1, 1,
-0.9090741, 0.6569344, -0.4338129, 0, 0, 0, 1, 1,
-0.9064227, -0.34233, -1.517968, 0, 0, 0, 1, 1,
-0.8979503, 0.1117594, -2.622395, 0, 0, 0, 1, 1,
-0.8955874, 0.8109064, -1.251111, 1, 1, 1, 1, 1,
-0.894032, 0.43272, -0.8219532, 1, 1, 1, 1, 1,
-0.8878363, -0.2163467, -3.913956, 1, 1, 1, 1, 1,
-0.8863116, -1.050271, -2.814992, 1, 1, 1, 1, 1,
-0.8852686, -0.1305681, -2.840057, 1, 1, 1, 1, 1,
-0.8826646, 0.5432791, -2.503541, 1, 1, 1, 1, 1,
-0.8800188, -0.867353, -1.671179, 1, 1, 1, 1, 1,
-0.8782189, 0.8495305, 0.2308661, 1, 1, 1, 1, 1,
-0.8779597, 0.3198226, 0.1851089, 1, 1, 1, 1, 1,
-0.8769805, -0.04305297, -0.9653786, 1, 1, 1, 1, 1,
-0.8745025, 0.1366701, 0.09713507, 1, 1, 1, 1, 1,
-0.8736252, -0.6816489, -0.2716629, 1, 1, 1, 1, 1,
-0.8725095, 0.07321963, -1.617886, 1, 1, 1, 1, 1,
-0.8706502, 0.9776281, 0.700561, 1, 1, 1, 1, 1,
-0.8676483, -1.087633, -3.182743, 1, 1, 1, 1, 1,
-0.8626605, 0.9353341, -0.7459452, 0, 0, 1, 1, 1,
-0.8562582, -0.8489896, -2.276732, 1, 0, 0, 1, 1,
-0.8469195, -0.5501117, -1.528582, 1, 0, 0, 1, 1,
-0.8442463, 0.7076957, -0.2987129, 1, 0, 0, 1, 1,
-0.842916, -0.8321268, -2.355544, 1, 0, 0, 1, 1,
-0.8420143, 0.2232835, -1.51193, 1, 0, 0, 1, 1,
-0.8370041, 0.4892242, -1.610964, 0, 0, 0, 1, 1,
-0.827576, 0.4341328, -1.476458, 0, 0, 0, 1, 1,
-0.8139321, 0.4236187, -3.273659, 0, 0, 0, 1, 1,
-0.8034462, -1.639814, -2.463103, 0, 0, 0, 1, 1,
-0.8032206, -1.117949, -1.938179, 0, 0, 0, 1, 1,
-0.792133, -2.297508, -1.402256, 0, 0, 0, 1, 1,
-0.7915059, -0.3695442, -2.773641, 0, 0, 0, 1, 1,
-0.7857169, -0.7131284, -1.664795, 1, 1, 1, 1, 1,
-0.7741851, 1.194982, -0.5595799, 1, 1, 1, 1, 1,
-0.771734, 0.5781636, -1.813661, 1, 1, 1, 1, 1,
-0.7685106, 1.490382, 1.921613, 1, 1, 1, 1, 1,
-0.7682809, 0.3019278, -0.4298282, 1, 1, 1, 1, 1,
-0.7618906, -0.1007007, -2.908452, 1, 1, 1, 1, 1,
-0.7617342, -0.7879607, -2.960157, 1, 1, 1, 1, 1,
-0.7612534, 0.03689711, -3.398425, 1, 1, 1, 1, 1,
-0.7580231, 0.8791931, 0.6372489, 1, 1, 1, 1, 1,
-0.7479907, -0.9438758, -2.405738, 1, 1, 1, 1, 1,
-0.7393283, 1.629785, -1.664804, 1, 1, 1, 1, 1,
-0.726889, -1.622126, -2.710704, 1, 1, 1, 1, 1,
-0.7252082, -0.3447067, -1.932275, 1, 1, 1, 1, 1,
-0.7249579, 0.1974612, 0.04589914, 1, 1, 1, 1, 1,
-0.7233493, 1.038526, -0.2369394, 1, 1, 1, 1, 1,
-0.7205848, 1.003171, -0.7200882, 0, 0, 1, 1, 1,
-0.7172937, -0.5285671, -0.7332535, 1, 0, 0, 1, 1,
-0.7151093, -0.4062442, -3.318691, 1, 0, 0, 1, 1,
-0.7144556, 1.497023, -0.8748388, 1, 0, 0, 1, 1,
-0.7070945, 1.243815, -1.185652, 1, 0, 0, 1, 1,
-0.7055514, 0.7022633, -0.1427891, 1, 0, 0, 1, 1,
-0.7038249, 2.043236, -0.3524007, 0, 0, 0, 1, 1,
-0.7000108, 0.6469744, -1.619269, 0, 0, 0, 1, 1,
-0.6978027, -0.2630757, -1.631706, 0, 0, 0, 1, 1,
-0.6912244, 1.163572, -0.6340913, 0, 0, 0, 1, 1,
-0.6841409, -0.8564607, -2.904938, 0, 0, 0, 1, 1,
-0.6833991, 2.236957, -0.2990206, 0, 0, 0, 1, 1,
-0.6737673, 1.472465, -1.1445, 0, 0, 0, 1, 1,
-0.6703686, 0.731801, 0.6611118, 1, 1, 1, 1, 1,
-0.664741, 0.1801554, -0.7761387, 1, 1, 1, 1, 1,
-0.6641364, -1.274259, -3.4616, 1, 1, 1, 1, 1,
-0.6497417, 0.3462245, -0.5560247, 1, 1, 1, 1, 1,
-0.6495925, 0.4410581, -0.1704555, 1, 1, 1, 1, 1,
-0.6493689, -0.9564994, -3.42793, 1, 1, 1, 1, 1,
-0.6463695, -0.4501885, -2.260056, 1, 1, 1, 1, 1,
-0.6448767, 0.8918663, 1.21298, 1, 1, 1, 1, 1,
-0.6411512, 0.06552195, -2.109803, 1, 1, 1, 1, 1,
-0.6373183, -1.60812, -2.345833, 1, 1, 1, 1, 1,
-0.6369991, 0.9887493, -0.9184271, 1, 1, 1, 1, 1,
-0.6354204, 1.325091, 0.5380378, 1, 1, 1, 1, 1,
-0.632414, 0.1107486, -1.358356, 1, 1, 1, 1, 1,
-0.6295085, -1.74629, -5.435312, 1, 1, 1, 1, 1,
-0.6137455, -1.947776, -3.976364, 1, 1, 1, 1, 1,
-0.6046031, 1.221641, 0.1844828, 0, 0, 1, 1, 1,
-0.6028478, -0.4816329, -3.027546, 1, 0, 0, 1, 1,
-0.6027275, -0.3824053, -1.110407, 1, 0, 0, 1, 1,
-0.5999593, 1.752061, -0.4955039, 1, 0, 0, 1, 1,
-0.5998302, -1.351275, -2.417791, 1, 0, 0, 1, 1,
-0.5997693, -2.137254, -4.92733, 1, 0, 0, 1, 1,
-0.5948473, -0.009228785, -2.727802, 0, 0, 0, 1, 1,
-0.5940335, -0.01564161, -1.486291, 0, 0, 0, 1, 1,
-0.5937761, -1.322292, -1.70464, 0, 0, 0, 1, 1,
-0.5918401, -2.682868, -2.958621, 0, 0, 0, 1, 1,
-0.5901558, -1.486722, -3.233446, 0, 0, 0, 1, 1,
-0.5890503, 0.6746163, 1.017292, 0, 0, 0, 1, 1,
-0.5880948, -0.614004, -2.838791, 0, 0, 0, 1, 1,
-0.5825915, -1.792889, -4.617598, 1, 1, 1, 1, 1,
-0.5803527, -0.9867777, -3.890451, 1, 1, 1, 1, 1,
-0.5788205, 0.1747466, -1.839758, 1, 1, 1, 1, 1,
-0.5782686, 0.2619585, -1.390293, 1, 1, 1, 1, 1,
-0.5779959, 0.4771156, 0.04194796, 1, 1, 1, 1, 1,
-0.577828, 2.485318, 0.0210203, 1, 1, 1, 1, 1,
-0.5696697, 2.220042, 0.2442833, 1, 1, 1, 1, 1,
-0.5650679, -1.046744, -1.912765, 1, 1, 1, 1, 1,
-0.5604378, -1.580304, -2.734042, 1, 1, 1, 1, 1,
-0.5588686, -0.190806, -1.399596, 1, 1, 1, 1, 1,
-0.5526527, 1.688016, -0.1945668, 1, 1, 1, 1, 1,
-0.5454143, -2.450522, -4.022348, 1, 1, 1, 1, 1,
-0.538922, 0.6165352, -0.6624361, 1, 1, 1, 1, 1,
-0.5373414, -0.9413297, -2.946487, 1, 1, 1, 1, 1,
-0.5353872, 0.1361242, -0.1505402, 1, 1, 1, 1, 1,
-0.5339449, -0.1468255, -0.1288712, 0, 0, 1, 1, 1,
-0.5177882, -1.742109, -3.456632, 1, 0, 0, 1, 1,
-0.5123283, -0.751946, -4.08111, 1, 0, 0, 1, 1,
-0.5110252, -0.4514452, -3.120233, 1, 0, 0, 1, 1,
-0.5104303, 0.5686907, -0.2417935, 1, 0, 0, 1, 1,
-0.5098967, 1.171979, 0.3274664, 1, 0, 0, 1, 1,
-0.504209, -0.1114016, -2.704901, 0, 0, 0, 1, 1,
-0.4991591, -2.096831, -3.459048, 0, 0, 0, 1, 1,
-0.49805, -0.9078079, -2.005708, 0, 0, 0, 1, 1,
-0.4979957, -0.9785849, -4.003343, 0, 0, 0, 1, 1,
-0.4973404, 1.847011, 0.3842472, 0, 0, 0, 1, 1,
-0.4944247, -2.324024, -2.156861, 0, 0, 0, 1, 1,
-0.4941321, -0.3868788, -3.208458, 0, 0, 0, 1, 1,
-0.4899053, 1.245448, 0.321942, 1, 1, 1, 1, 1,
-0.4870954, 1.462935, -0.5270824, 1, 1, 1, 1, 1,
-0.4837789, -0.9775278, -2.869422, 1, 1, 1, 1, 1,
-0.4817197, 0.9322091, -0.2573951, 1, 1, 1, 1, 1,
-0.4764566, 0.6809021, -0.5304359, 1, 1, 1, 1, 1,
-0.4715927, 0.1183361, -2.191092, 1, 1, 1, 1, 1,
-0.4708623, -2.357939, -2.834143, 1, 1, 1, 1, 1,
-0.463137, 0.1811023, -1.532232, 1, 1, 1, 1, 1,
-0.4540516, 1.17817, -0.7467872, 1, 1, 1, 1, 1,
-0.4518265, 1.119707, -0.4876176, 1, 1, 1, 1, 1,
-0.4498232, -1.29336, -2.412194, 1, 1, 1, 1, 1,
-0.443035, -0.6969992, -2.322418, 1, 1, 1, 1, 1,
-0.4321226, 0.04841514, -2.656778, 1, 1, 1, 1, 1,
-0.429807, 0.8368669, -0.1267124, 1, 1, 1, 1, 1,
-0.4294131, -0.6384702, -2.959486, 1, 1, 1, 1, 1,
-0.4293554, 1.227989, 0.11211, 0, 0, 1, 1, 1,
-0.419764, -1.330733, -2.641095, 1, 0, 0, 1, 1,
-0.418878, -0.1177559, -1.638983, 1, 0, 0, 1, 1,
-0.4159539, 2.171397, -1.140901, 1, 0, 0, 1, 1,
-0.4145279, 1.502623, -1.510647, 1, 0, 0, 1, 1,
-0.4130162, -0.9380954, -4.631125, 1, 0, 0, 1, 1,
-0.4128201, 0.2090694, -0.7377345, 0, 0, 0, 1, 1,
-0.410336, -0.2378361, -3.356806, 0, 0, 0, 1, 1,
-0.4031286, -0.7488188, -4.91502, 0, 0, 0, 1, 1,
-0.4016511, -0.1361234, -1.930513, 0, 0, 0, 1, 1,
-0.3981563, -0.1371621, -2.108658, 0, 0, 0, 1, 1,
-0.3876314, -1.830766, -4.177977, 0, 0, 0, 1, 1,
-0.3865139, 0.8639588, -0.641398, 0, 0, 0, 1, 1,
-0.3856563, -0.7303131, -2.621405, 1, 1, 1, 1, 1,
-0.3848954, 1.144292, -0.4576393, 1, 1, 1, 1, 1,
-0.3847435, 0.585024, 0.5126139, 1, 1, 1, 1, 1,
-0.3842361, -2.167021, -2.519915, 1, 1, 1, 1, 1,
-0.382588, 0.5005497, -0.69717, 1, 1, 1, 1, 1,
-0.3812018, -0.5121019, -3.812135, 1, 1, 1, 1, 1,
-0.3805337, 0.4607221, -1.470795, 1, 1, 1, 1, 1,
-0.3771167, -1.492641, -2.51811, 1, 1, 1, 1, 1,
-0.3754797, -0.4688487, -1.344763, 1, 1, 1, 1, 1,
-0.3660267, -0.5910463, -1.855678, 1, 1, 1, 1, 1,
-0.3644501, -0.5858835, -2.261926, 1, 1, 1, 1, 1,
-0.3619652, 0.556044, 0.8650744, 1, 1, 1, 1, 1,
-0.3619598, -1.358063, -3.560077, 1, 1, 1, 1, 1,
-0.358817, 0.3332357, -1.875269, 1, 1, 1, 1, 1,
-0.3560136, 0.6679143, 0.2929929, 1, 1, 1, 1, 1,
-0.3558561, -0.1326602, -2.051409, 0, 0, 1, 1, 1,
-0.3548942, -0.9189373, -2.189392, 1, 0, 0, 1, 1,
-0.3546962, 1.126415, -0.8141932, 1, 0, 0, 1, 1,
-0.354226, -0.2135203, -1.571698, 1, 0, 0, 1, 1,
-0.3489781, 0.03813463, -2.186097, 1, 0, 0, 1, 1,
-0.3473931, -0.6690196, -2.989104, 1, 0, 0, 1, 1,
-0.3459505, -0.04095815, -1.496732, 0, 0, 0, 1, 1,
-0.338978, 0.7860819, 0.2102261, 0, 0, 0, 1, 1,
-0.3351173, -0.05560992, -1.768372, 0, 0, 0, 1, 1,
-0.3335473, -1.074383, -2.587567, 0, 0, 0, 1, 1,
-0.3284747, -0.8380661, -3.963418, 0, 0, 0, 1, 1,
-0.3282357, 1.83563, 0.3967654, 0, 0, 0, 1, 1,
-0.3231231, -0.4777056, -3.099654, 0, 0, 0, 1, 1,
-0.3175699, -0.6124403, -3.138953, 1, 1, 1, 1, 1,
-0.3165885, 0.7178082, -0.4852546, 1, 1, 1, 1, 1,
-0.3162664, -0.1396513, -2.388794, 1, 1, 1, 1, 1,
-0.3153061, 0.4372871, -0.5567119, 1, 1, 1, 1, 1,
-0.3124277, 0.867693, -2.231961, 1, 1, 1, 1, 1,
-0.3057778, 0.2211091, -1.24505, 1, 1, 1, 1, 1,
-0.3027778, 0.2011761, -2.076264, 1, 1, 1, 1, 1,
-0.2978862, 0.2478955, -3.063932, 1, 1, 1, 1, 1,
-0.2965089, 0.2560578, 0.5543858, 1, 1, 1, 1, 1,
-0.2960207, -1.505026, -4.404417, 1, 1, 1, 1, 1,
-0.2894391, -0.03249669, -2.085769, 1, 1, 1, 1, 1,
-0.2878514, -0.0261252, -0.4135995, 1, 1, 1, 1, 1,
-0.2876059, -0.3909999, -1.490152, 1, 1, 1, 1, 1,
-0.2863214, 1.557846, -0.1413376, 1, 1, 1, 1, 1,
-0.2834997, 0.8483745, -0.9577342, 1, 1, 1, 1, 1,
-0.2823831, -0.3772492, -1.850786, 0, 0, 1, 1, 1,
-0.2654169, 0.6813799, -0.5892477, 1, 0, 0, 1, 1,
-0.2543317, 0.9789491, -0.514728, 1, 0, 0, 1, 1,
-0.2494669, -0.3296129, -1.625078, 1, 0, 0, 1, 1,
-0.2487453, -0.7947208, -2.180212, 1, 0, 0, 1, 1,
-0.2475956, -0.565872, -2.291146, 1, 0, 0, 1, 1,
-0.2420879, 1.332232, 1.342774, 0, 0, 0, 1, 1,
-0.2356091, 3.261759, -1.273612, 0, 0, 0, 1, 1,
-0.2342121, 0.08261061, -1.220222, 0, 0, 0, 1, 1,
-0.2239693, -0.1561508, -1.817553, 0, 0, 0, 1, 1,
-0.2228761, 1.705231, -0.5345005, 0, 0, 0, 1, 1,
-0.2203099, 1.356883, -0.4865341, 0, 0, 0, 1, 1,
-0.2188188, -0.6306685, -3.236296, 0, 0, 0, 1, 1,
-0.2108932, -1.776712, -4.221097, 1, 1, 1, 1, 1,
-0.2073996, -0.9794973, -3.783454, 1, 1, 1, 1, 1,
-0.2035442, -0.4272815, -3.062212, 1, 1, 1, 1, 1,
-0.1986071, -1.573676, -2.020359, 1, 1, 1, 1, 1,
-0.1973483, -0.4472133, -3.830352, 1, 1, 1, 1, 1,
-0.1953019, -1.852553, -3.451255, 1, 1, 1, 1, 1,
-0.1946671, -0.1889862, -2.676378, 1, 1, 1, 1, 1,
-0.1934557, 2.040176, -0.4219306, 1, 1, 1, 1, 1,
-0.1924835, 0.9365128, 0.04820091, 1, 1, 1, 1, 1,
-0.1900209, 0.1182647, -0.525084, 1, 1, 1, 1, 1,
-0.1885318, 2.028592, 0.6076623, 1, 1, 1, 1, 1,
-0.1868262, -0.2479506, -1.294958, 1, 1, 1, 1, 1,
-0.1854177, 1.086181, -0.3748814, 1, 1, 1, 1, 1,
-0.1849881, 1.063593, -0.6178561, 1, 1, 1, 1, 1,
-0.1806695, 0.3367998, 0.5053223, 1, 1, 1, 1, 1,
-0.1802823, 1.715307, 1.324739, 0, 0, 1, 1, 1,
-0.1800335, 2.121866, 0.05442192, 1, 0, 0, 1, 1,
-0.1732621, -0.1353631, -0.5606516, 1, 0, 0, 1, 1,
-0.1720441, -0.8215168, -3.172921, 1, 0, 0, 1, 1,
-0.1717555, -0.8707476, -2.626195, 1, 0, 0, 1, 1,
-0.1686057, 1.442323, -0.5517438, 1, 0, 0, 1, 1,
-0.1681629, 0.05658404, -2.069273, 0, 0, 0, 1, 1,
-0.1666851, 0.2474312, -0.6546215, 0, 0, 0, 1, 1,
-0.1634104, 0.4887475, -2.314305, 0, 0, 0, 1, 1,
-0.1629341, 0.4465722, 0.1507818, 0, 0, 0, 1, 1,
-0.1628747, -2.184999, -2.568439, 0, 0, 0, 1, 1,
-0.1616127, 0.01156378, -1.537256, 0, 0, 0, 1, 1,
-0.1478654, 0.3569025, 0.4795296, 0, 0, 0, 1, 1,
-0.1424504, -1.93754, -2.79662, 1, 1, 1, 1, 1,
-0.1407418, -0.8377345, -1.815274, 1, 1, 1, 1, 1,
-0.1402876, 0.2998611, 0.2672522, 1, 1, 1, 1, 1,
-0.1380013, 1.035051, 1.398861, 1, 1, 1, 1, 1,
-0.1378666, -1.413264, -2.23782, 1, 1, 1, 1, 1,
-0.1368459, 2.100904, 0.406039, 1, 1, 1, 1, 1,
-0.1362035, 1.957573, -0.179812, 1, 1, 1, 1, 1,
-0.1361158, -0.02811833, 1.54459, 1, 1, 1, 1, 1,
-0.1333219, -0.4063518, -2.303093, 1, 1, 1, 1, 1,
-0.1324323, 0.2583542, -0.9495552, 1, 1, 1, 1, 1,
-0.1227323, 0.6068041, 1.866373, 1, 1, 1, 1, 1,
-0.1201883, -1.283604, -2.481113, 1, 1, 1, 1, 1,
-0.1174182, -1.11774, -2.139889, 1, 1, 1, 1, 1,
-0.1152552, -0.876902, -2.158878, 1, 1, 1, 1, 1,
-0.1107995, 1.139056, -1.311309, 1, 1, 1, 1, 1,
-0.106489, 1.67131, 0.8397236, 0, 0, 1, 1, 1,
-0.1064082, -0.3102334, -4.567832, 1, 0, 0, 1, 1,
-0.1063128, 0.2830217, 2.250616, 1, 0, 0, 1, 1,
-0.1051093, 1.685749, 0.5376697, 1, 0, 0, 1, 1,
-0.1042407, -0.3633936, -2.407194, 1, 0, 0, 1, 1,
-0.1030371, 2.053383, 0.9561989, 1, 0, 0, 1, 1,
-0.1019617, -0.06761729, -1.306908, 0, 0, 0, 1, 1,
-0.1019243, -1.07074, -4.056385, 0, 0, 0, 1, 1,
-0.1016324, -0.708551, -2.219842, 0, 0, 0, 1, 1,
-0.09789298, 0.991736, -0.6878466, 0, 0, 0, 1, 1,
-0.0977991, -1.073502, -2.568459, 0, 0, 0, 1, 1,
-0.09428608, 0.3854904, 0.1685205, 0, 0, 0, 1, 1,
-0.09375563, -0.2443193, -1.79486, 0, 0, 0, 1, 1,
-0.09366991, 0.2925946, -0.3950777, 1, 1, 1, 1, 1,
-0.09303969, -0.8868304, -3.160772, 1, 1, 1, 1, 1,
-0.09297261, 0.9437439, 1.773305, 1, 1, 1, 1, 1,
-0.0921904, 0.2622828, 0.8548665, 1, 1, 1, 1, 1,
-0.08995599, 1.257848, -0.6617465, 1, 1, 1, 1, 1,
-0.08851068, 1.657302, 0.6806966, 1, 1, 1, 1, 1,
-0.08733, 0.02384801, -2.016426, 1, 1, 1, 1, 1,
-0.08696082, 0.8861725, -0.2260254, 1, 1, 1, 1, 1,
-0.08328804, 0.9449909, 1.02644, 1, 1, 1, 1, 1,
-0.08191116, -0.03314259, -2.278946, 1, 1, 1, 1, 1,
-0.08003449, 0.4243937, 0.8459237, 1, 1, 1, 1, 1,
-0.07315603, -0.4133928, -1.077094, 1, 1, 1, 1, 1,
-0.07208389, -2.24064, -2.91132, 1, 1, 1, 1, 1,
-0.07196616, -0.03712443, -0.8165059, 1, 1, 1, 1, 1,
-0.07172933, 0.5988259, 2.188225, 1, 1, 1, 1, 1,
-0.07012466, 0.007768295, -0.9764339, 0, 0, 1, 1, 1,
-0.06990007, -1.091589, -2.904388, 1, 0, 0, 1, 1,
-0.06669436, 0.1399016, -1.619646, 1, 0, 0, 1, 1,
-0.06369389, 1.560357, -0.3771563, 1, 0, 0, 1, 1,
-0.05794996, 0.5136756, 0.3355436, 1, 0, 0, 1, 1,
-0.05658999, 1.375959, 2.286107, 1, 0, 0, 1, 1,
-0.05308921, -0.8443541, -1.866281, 0, 0, 0, 1, 1,
-0.05036856, -0.6965095, -2.20176, 0, 0, 0, 1, 1,
-0.0449889, 0.5433201, 1.08012, 0, 0, 0, 1, 1,
-0.04376441, 0.914695, 0.1871553, 0, 0, 0, 1, 1,
-0.04261368, 0.07198379, -0.2359037, 0, 0, 0, 1, 1,
-0.03896799, -0.06947453, -1.957043, 0, 0, 0, 1, 1,
-0.03428731, 0.6162993, 1.533005, 0, 0, 0, 1, 1,
-0.03092581, 0.6001848, -0.02685377, 1, 1, 1, 1, 1,
-0.03007328, 0.07597694, -1.40072, 1, 1, 1, 1, 1,
-0.02563581, 0.5562836, -0.5711585, 1, 1, 1, 1, 1,
-0.02108019, 0.2317187, -0.3783918, 1, 1, 1, 1, 1,
-0.02098354, -0.1058654, -3.3105, 1, 1, 1, 1, 1,
-0.02009778, 1.473119, 0.6503465, 1, 1, 1, 1, 1,
-0.01988407, 0.4319317, -0.7279818, 1, 1, 1, 1, 1,
-0.01772763, -1.071656, -2.706647, 1, 1, 1, 1, 1,
-0.01306275, -0.9021924, -3.897503, 1, 1, 1, 1, 1,
-0.01291453, -0.5133772, -2.746238, 1, 1, 1, 1, 1,
-0.01140331, -1.916169, -2.962261, 1, 1, 1, 1, 1,
-0.008503711, 0.3074452, 0.6124841, 1, 1, 1, 1, 1,
-0.007062946, -1.145199, -3.400923, 1, 1, 1, 1, 1,
-0.004592397, 1.205922, -0.3916025, 1, 1, 1, 1, 1,
-0.0041534, 1.141366, -0.9020593, 1, 1, 1, 1, 1,
-0.004007647, -0.3807544, -3.811844, 0, 0, 1, 1, 1,
-0.002164539, -0.4401813, -1.965981, 1, 0, 0, 1, 1,
-0.0005075642, -0.2361387, -2.940789, 1, 0, 0, 1, 1,
0.003659689, -1.012982, 5.353397, 1, 0, 0, 1, 1,
0.004386954, -0.6995917, 2.743091, 1, 0, 0, 1, 1,
0.008033229, -0.5895378, 5.598377, 1, 0, 0, 1, 1,
0.01010714, -0.02829847, 2.766439, 0, 0, 0, 1, 1,
0.01018904, -0.3573159, 3.79018, 0, 0, 0, 1, 1,
0.01132558, -0.01728192, 1.823154, 0, 0, 0, 1, 1,
0.01843885, -0.2615847, 2.749652, 0, 0, 0, 1, 1,
0.02196258, 0.1658622, 1.599397, 0, 0, 0, 1, 1,
0.0226345, -1.284713, 2.79373, 0, 0, 0, 1, 1,
0.02348966, 0.6233426, -0.05955883, 0, 0, 0, 1, 1,
0.02457792, -1.233242, 1.018114, 1, 1, 1, 1, 1,
0.02846105, 1.881153, 0.3019104, 1, 1, 1, 1, 1,
0.03392431, 1.321674, -1.72009, 1, 1, 1, 1, 1,
0.03774948, -0.7162412, 3.074164, 1, 1, 1, 1, 1,
0.0382089, 0.9353135, -0.08179792, 1, 1, 1, 1, 1,
0.03857092, 0.6233701, -0.8084623, 1, 1, 1, 1, 1,
0.03875585, -0.398402, 5.460745, 1, 1, 1, 1, 1,
0.04377449, 0.8015442, 0.3050834, 1, 1, 1, 1, 1,
0.04538269, 0.180293, 0.8693331, 1, 1, 1, 1, 1,
0.0556443, -0.8621746, 2.011183, 1, 1, 1, 1, 1,
0.05589939, -1.25011, 4.684094, 1, 1, 1, 1, 1,
0.06046085, -0.251286, 4.329998, 1, 1, 1, 1, 1,
0.06298452, -0.8966023, 3.797269, 1, 1, 1, 1, 1,
0.06412794, 0.2634673, 2.190467, 1, 1, 1, 1, 1,
0.06419449, -0.16488, 2.996366, 1, 1, 1, 1, 1,
0.06587327, -1.85681, 4.102194, 0, 0, 1, 1, 1,
0.06808764, -0.7904095, 2.582115, 1, 0, 0, 1, 1,
0.06898104, 0.0006375393, 0.8759209, 1, 0, 0, 1, 1,
0.06917053, -1.141091, 2.212291, 1, 0, 0, 1, 1,
0.07029907, 1.751265, -0.2843794, 1, 0, 0, 1, 1,
0.07213389, -0.5531717, 2.20395, 1, 0, 0, 1, 1,
0.07380425, -0.5975896, 3.189857, 0, 0, 0, 1, 1,
0.07436501, 1.545076, 0.2074266, 0, 0, 0, 1, 1,
0.07512178, 0.71766, -1.142597, 0, 0, 0, 1, 1,
0.07533459, -0.1220518, 3.003227, 0, 0, 0, 1, 1,
0.077491, -0.4171801, 3.403196, 0, 0, 0, 1, 1,
0.07761548, -0.2621504, 2.952164, 0, 0, 0, 1, 1,
0.08033129, -0.2337707, 1.928168, 0, 0, 0, 1, 1,
0.08041582, 0.6053377, -0.8213268, 1, 1, 1, 1, 1,
0.08673446, -0.7034144, 3.260015, 1, 1, 1, 1, 1,
0.09065253, 1.123157, 0.5347877, 1, 1, 1, 1, 1,
0.09544243, -0.6153745, 2.666414, 1, 1, 1, 1, 1,
0.09974354, 0.9086933, -0.4078115, 1, 1, 1, 1, 1,
0.104387, -1.066141, 3.68075, 1, 1, 1, 1, 1,
0.1053312, 0.6022804, 1.317201, 1, 1, 1, 1, 1,
0.1056984, 0.9743018, 0.2879378, 1, 1, 1, 1, 1,
0.1086207, -0.6196698, 2.923368, 1, 1, 1, 1, 1,
0.1087577, 0.006950694, 2.191928, 1, 1, 1, 1, 1,
0.111663, -0.3717996, 2.328697, 1, 1, 1, 1, 1,
0.1122323, -0.4215066, 5.839304, 1, 1, 1, 1, 1,
0.1153695, -0.7064793, 2.011585, 1, 1, 1, 1, 1,
0.1156268, -0.0778482, 0.9324144, 1, 1, 1, 1, 1,
0.1174391, -0.2676986, 1.95219, 1, 1, 1, 1, 1,
0.1231479, -1.243653, 3.396675, 0, 0, 1, 1, 1,
0.1250993, 0.8047052, 1.251309, 1, 0, 0, 1, 1,
0.1309204, -0.5542331, 2.340432, 1, 0, 0, 1, 1,
0.1338194, -0.07545801, 1.451505, 1, 0, 0, 1, 1,
0.137042, 1.268269, 2.384991, 1, 0, 0, 1, 1,
0.1405294, 0.4875487, -2.025213, 1, 0, 0, 1, 1,
0.1421749, 0.2634785, 1.423104, 0, 0, 0, 1, 1,
0.145616, 1.38557, -0.2027356, 0, 0, 0, 1, 1,
0.1485617, -0.8973474, 2.58996, 0, 0, 0, 1, 1,
0.1595039, -1.710684, 4.409444, 0, 0, 0, 1, 1,
0.1625046, 1.021035, -0.1935669, 0, 0, 0, 1, 1,
0.1638729, -0.4276991, 2.986681, 0, 0, 0, 1, 1,
0.1659331, 0.3425836, 0.9478512, 0, 0, 0, 1, 1,
0.1668827, 0.7516291, -0.9005698, 1, 1, 1, 1, 1,
0.1679039, 2.609228, -0.1160898, 1, 1, 1, 1, 1,
0.1682031, 0.5936536, 2.351663, 1, 1, 1, 1, 1,
0.1707239, -0.9422525, 3.987447, 1, 1, 1, 1, 1,
0.1721528, 1.076841, 0.4498259, 1, 1, 1, 1, 1,
0.1740988, 0.7699954, 0.1604625, 1, 1, 1, 1, 1,
0.1747597, 0.4864156, 0.7753779, 1, 1, 1, 1, 1,
0.1765259, 0.1948848, 0.5888973, 1, 1, 1, 1, 1,
0.1790581, -0.2446193, 2.449247, 1, 1, 1, 1, 1,
0.186242, 0.2911684, 1.259572, 1, 1, 1, 1, 1,
0.1901846, -0.135966, 2.500153, 1, 1, 1, 1, 1,
0.1932415, -0.3137294, 2.20947, 1, 1, 1, 1, 1,
0.1946126, -0.06861934, 1.864916, 1, 1, 1, 1, 1,
0.1958975, 0.8487009, -0.7543309, 1, 1, 1, 1, 1,
0.2028269, 0.6569895, -0.2126257, 1, 1, 1, 1, 1,
0.2047082, 1.363871, 0.7819217, 0, 0, 1, 1, 1,
0.2050387, 0.3609177, -0.8704845, 1, 0, 0, 1, 1,
0.2068702, -0.6152095, 2.288195, 1, 0, 0, 1, 1,
0.2096594, -1.343816, 2.545084, 1, 0, 0, 1, 1,
0.2104274, 1.252157, 0.8307738, 1, 0, 0, 1, 1,
0.2116801, -0.7153302, 2.694256, 1, 0, 0, 1, 1,
0.2184334, -1.621299, 2.506462, 0, 0, 0, 1, 1,
0.2201057, 2.125147, -1.192814, 0, 0, 0, 1, 1,
0.2213601, -0.2801299, 3.895377, 0, 0, 0, 1, 1,
0.2245568, 0.7001135, -0.6245723, 0, 0, 0, 1, 1,
0.2254908, 2.329364, -0.9047096, 0, 0, 0, 1, 1,
0.2312983, -0.3681934, 3.605333, 0, 0, 0, 1, 1,
0.2337591, 0.3497612, 0.6484145, 0, 0, 0, 1, 1,
0.2341282, -0.4344997, 3.405974, 1, 1, 1, 1, 1,
0.2353915, -0.4006575, 1.015798, 1, 1, 1, 1, 1,
0.2400148, 0.6882274, -0.1190343, 1, 1, 1, 1, 1,
0.242307, 0.2419765, 1.102182, 1, 1, 1, 1, 1,
0.2463296, 1.542919, -0.1473172, 1, 1, 1, 1, 1,
0.2506058, -0.2524601, 1.978982, 1, 1, 1, 1, 1,
0.2517997, -1.102402, 5.349036, 1, 1, 1, 1, 1,
0.2520857, 0.9615783, -0.5091584, 1, 1, 1, 1, 1,
0.2536514, -0.07370774, 1.992799, 1, 1, 1, 1, 1,
0.2637199, -1.144876, 3.523919, 1, 1, 1, 1, 1,
0.2654065, -0.1196507, 2.436286, 1, 1, 1, 1, 1,
0.2660976, 0.691553, 0.528925, 1, 1, 1, 1, 1,
0.2681625, 0.8676999, -0.2088512, 1, 1, 1, 1, 1,
0.2731031, -0.4868742, 2.290182, 1, 1, 1, 1, 1,
0.2778934, -0.2306489, 2.663491, 1, 1, 1, 1, 1,
0.278766, -0.1498939, 0.6837811, 0, 0, 1, 1, 1,
0.279021, -0.9131487, 2.353929, 1, 0, 0, 1, 1,
0.2814673, 0.6157389, 0.2694746, 1, 0, 0, 1, 1,
0.2814833, -1.197989, 5.467882, 1, 0, 0, 1, 1,
0.2816523, -0.703269, 0.6055858, 1, 0, 0, 1, 1,
0.2833207, 0.9333388, -0.5895059, 1, 0, 0, 1, 1,
0.2848978, 0.3391629, 0.5049014, 0, 0, 0, 1, 1,
0.2887952, -0.9557593, 2.89498, 0, 0, 0, 1, 1,
0.2915916, 1.546073, 1.070718, 0, 0, 0, 1, 1,
0.2933712, -0.3421735, 1.734887, 0, 0, 0, 1, 1,
0.2962052, -0.552941, 1.934359, 0, 0, 0, 1, 1,
0.3007666, 1.051761, 1.282594, 0, 0, 0, 1, 1,
0.3074901, 0.6845465, -0.05193609, 0, 0, 0, 1, 1,
0.3085614, 0.3156829, 0.0174807, 1, 1, 1, 1, 1,
0.308732, -0.1270987, 0.01820637, 1, 1, 1, 1, 1,
0.3117663, -0.7048069, 3.115832, 1, 1, 1, 1, 1,
0.314053, -1.242747, 3.810319, 1, 1, 1, 1, 1,
0.3157403, -2.262344, 3.36298, 1, 1, 1, 1, 1,
0.3177596, -0.3523916, 1.828657, 1, 1, 1, 1, 1,
0.3197743, 0.2479415, -1.816464, 1, 1, 1, 1, 1,
0.3272778, 1.295263, 1.063097, 1, 1, 1, 1, 1,
0.328303, -0.9448547, 3.686921, 1, 1, 1, 1, 1,
0.3289147, -1.466448, 3.302664, 1, 1, 1, 1, 1,
0.3292549, -2.083879, 3.384346, 1, 1, 1, 1, 1,
0.3314424, 0.4955773, 2.135744, 1, 1, 1, 1, 1,
0.3361216, -0.3220733, 2.188083, 1, 1, 1, 1, 1,
0.3417032, 0.2904887, 0.320737, 1, 1, 1, 1, 1,
0.342526, 0.1102006, 2.753166, 1, 1, 1, 1, 1,
0.3447589, 0.6946819, 0.9067503, 0, 0, 1, 1, 1,
0.3462786, -0.8381419, 3.271577, 1, 0, 0, 1, 1,
0.3481731, 0.939994, 0.5792036, 1, 0, 0, 1, 1,
0.3516789, 0.7700368, 0.637581, 1, 0, 0, 1, 1,
0.356949, -1.384585, 4.681352, 1, 0, 0, 1, 1,
0.3586535, -0.1886748, 1.774241, 1, 0, 0, 1, 1,
0.3626412, 0.007881139, 2.003652, 0, 0, 0, 1, 1,
0.3633512, 1.591445, 1.568716, 0, 0, 0, 1, 1,
0.3633994, 0.3561883, -0.2580856, 0, 0, 0, 1, 1,
0.3647424, -0.254611, 1.59546, 0, 0, 0, 1, 1,
0.3651109, -0.4192422, 2.516801, 0, 0, 0, 1, 1,
0.3651261, 1.31371, -0.7571291, 0, 0, 0, 1, 1,
0.3682505, 1.056526, 0.6299679, 0, 0, 0, 1, 1,
0.3696483, -0.1940919, 3.141368, 1, 1, 1, 1, 1,
0.3738912, 2.023878, 2.412388, 1, 1, 1, 1, 1,
0.3767887, 0.5232608, 1.074729, 1, 1, 1, 1, 1,
0.3778362, -0.2218829, 0.5203996, 1, 1, 1, 1, 1,
0.3807476, -1.066353, 3.427216, 1, 1, 1, 1, 1,
0.3847768, -0.6196539, 2.194068, 1, 1, 1, 1, 1,
0.3853209, 1.953519, 0.2632747, 1, 1, 1, 1, 1,
0.3975202, 1.519874, 0.6887868, 1, 1, 1, 1, 1,
0.3980918, -2.225743, 2.805284, 1, 1, 1, 1, 1,
0.398767, 1.132234, -0.3202745, 1, 1, 1, 1, 1,
0.4041697, 1.320058, 1.618975, 1, 1, 1, 1, 1,
0.4049208, -0.01984948, 1.512208, 1, 1, 1, 1, 1,
0.4049225, 1.56513, -0.9332796, 1, 1, 1, 1, 1,
0.4060122, 0.1598618, 0.3621106, 1, 1, 1, 1, 1,
0.4065158, 0.3738475, -0.8513083, 1, 1, 1, 1, 1,
0.4081974, 0.6868961, 0.8721319, 0, 0, 1, 1, 1,
0.4098042, -0.8527458, 1.093523, 1, 0, 0, 1, 1,
0.4147907, -0.6165232, 3.79889, 1, 0, 0, 1, 1,
0.4148741, 1.668478, 1.125561, 1, 0, 0, 1, 1,
0.418579, 1.269865, -0.6607051, 1, 0, 0, 1, 1,
0.4201671, -0.009357931, 1.209703, 1, 0, 0, 1, 1,
0.4258402, 1.147244, -1.106245, 0, 0, 0, 1, 1,
0.4294251, -1.45516, 3.01416, 0, 0, 0, 1, 1,
0.4312187, 1.615545, 0.09431119, 0, 0, 0, 1, 1,
0.4333552, -0.889322, 2.018054, 0, 0, 0, 1, 1,
0.4362439, -0.4298343, 3.194702, 0, 0, 0, 1, 1,
0.4372247, 1.050756, 1.082274, 0, 0, 0, 1, 1,
0.4438933, 0.452644, -1.054755, 0, 0, 0, 1, 1,
0.4448125, 1.11194, 0.003592141, 1, 1, 1, 1, 1,
0.4488869, -0.378843, 2.852256, 1, 1, 1, 1, 1,
0.4510974, 0.02007629, 1.057447, 1, 1, 1, 1, 1,
0.4516763, -2.113884, 3.68876, 1, 1, 1, 1, 1,
0.4535966, 2.073301, 1.627991, 1, 1, 1, 1, 1,
0.4537386, 1.36981, 0.04267924, 1, 1, 1, 1, 1,
0.4539726, -1.09322, 2.713211, 1, 1, 1, 1, 1,
0.4548776, 0.5936394, 0.6712209, 1, 1, 1, 1, 1,
0.4549374, 1.2083, 0.4597596, 1, 1, 1, 1, 1,
0.457521, 1.513423, 0.8560912, 1, 1, 1, 1, 1,
0.4589596, -0.4326232, 2.468379, 1, 1, 1, 1, 1,
0.4620552, -1.601434, 1.805307, 1, 1, 1, 1, 1,
0.4661797, 1.671525, 0.1694948, 1, 1, 1, 1, 1,
0.4689495, 0.1310034, 0.8354694, 1, 1, 1, 1, 1,
0.4697397, -0.3522792, 3.442329, 1, 1, 1, 1, 1,
0.4707841, 0.1622926, 1.635432, 0, 0, 1, 1, 1,
0.4723488, 1.689575, 0.4692359, 1, 0, 0, 1, 1,
0.4744239, -1.241875, 3.773151, 1, 0, 0, 1, 1,
0.4744505, -0.5731151, 2.467501, 1, 0, 0, 1, 1,
0.4781342, -0.2410749, 3.34888, 1, 0, 0, 1, 1,
0.4803031, 1.07506, 1.569021, 1, 0, 0, 1, 1,
0.485078, 1.196176, 1.136771, 0, 0, 0, 1, 1,
0.4900948, 1.545803, 0.4000873, 0, 0, 0, 1, 1,
0.4904042, 0.490844, 0.7539682, 0, 0, 0, 1, 1,
0.4947596, 1.137969, -1.284198, 0, 0, 0, 1, 1,
0.496943, -0.03276073, 3.517605, 0, 0, 0, 1, 1,
0.4984558, 0.4688866, 1.068888, 0, 0, 0, 1, 1,
0.5002963, -0.0972594, 1.715511, 0, 0, 0, 1, 1,
0.5033565, -0.1875682, 2.528949, 1, 1, 1, 1, 1,
0.5039255, 0.6179187, 1.591864, 1, 1, 1, 1, 1,
0.506739, -1.005597, 0.43735, 1, 1, 1, 1, 1,
0.51301, 0.4098642, 1.499706, 1, 1, 1, 1, 1,
0.5136143, 1.124653, 0.04780157, 1, 1, 1, 1, 1,
0.5166978, 0.4472258, 1.287301, 1, 1, 1, 1, 1,
0.5179146, 0.001553936, 1.876093, 1, 1, 1, 1, 1,
0.5230177, 0.05349981, 1.366845, 1, 1, 1, 1, 1,
0.5261679, -0.1836212, 3.562703, 1, 1, 1, 1, 1,
0.5294591, -0.4640103, 2.311329, 1, 1, 1, 1, 1,
0.5323074, 2.385981, 1.028098, 1, 1, 1, 1, 1,
0.5324571, 0.3128231, 0.4449147, 1, 1, 1, 1, 1,
0.533525, -0.8036345, 2.36324, 1, 1, 1, 1, 1,
0.5353413, -1.280326, 3.074106, 1, 1, 1, 1, 1,
0.5354426, -1.30338, 2.635772, 1, 1, 1, 1, 1,
0.538911, -0.1029067, 0.8428833, 0, 0, 1, 1, 1,
0.5417932, 1.482318, 1.401435, 1, 0, 0, 1, 1,
0.5423925, 0.345576, 0.3987002, 1, 0, 0, 1, 1,
0.5438244, 0.7695456, -0.5275983, 1, 0, 0, 1, 1,
0.5471645, -0.03572898, 0.4438079, 1, 0, 0, 1, 1,
0.5497321, -0.02047981, 1.647906, 1, 0, 0, 1, 1,
0.552018, 0.4344001, 1.776881, 0, 0, 0, 1, 1,
0.5544727, 0.2086324, 1.501392, 0, 0, 0, 1, 1,
0.5558019, -0.8659489, 2.279497, 0, 0, 0, 1, 1,
0.5590671, -0.1183223, 1.361932, 0, 0, 0, 1, 1,
0.5595404, -0.3002164, 2.411293, 0, 0, 0, 1, 1,
0.5605095, -1.066733, 1.328584, 0, 0, 0, 1, 1,
0.5606795, 0.7372041, 0.1449645, 0, 0, 0, 1, 1,
0.5615156, 1.343445, 1.735718, 1, 1, 1, 1, 1,
0.5632228, 0.4108642, 0.4955217, 1, 1, 1, 1, 1,
0.5670838, 0.5433619, 1.605475, 1, 1, 1, 1, 1,
0.5681395, 1.454538, 0.7102981, 1, 1, 1, 1, 1,
0.5747002, -0.4964482, 3.885547, 1, 1, 1, 1, 1,
0.5776199, 0.5094767, 2.571076, 1, 1, 1, 1, 1,
0.58076, -0.3549835, 3.198078, 1, 1, 1, 1, 1,
0.5811468, -0.1177986, 2.055693, 1, 1, 1, 1, 1,
0.5817378, 0.9482088, -0.8532836, 1, 1, 1, 1, 1,
0.5830456, 0.09260883, 1.044945, 1, 1, 1, 1, 1,
0.583101, -1.345969, 3.146057, 1, 1, 1, 1, 1,
0.583244, -0.81404, 3.046514, 1, 1, 1, 1, 1,
0.586291, -0.1232524, 1.689642, 1, 1, 1, 1, 1,
0.5868644, -0.8695964, 4.333811, 1, 1, 1, 1, 1,
0.5869538, -0.2203521, 0.6168826, 1, 1, 1, 1, 1,
0.5897282, -1.002416, 2.570577, 0, 0, 1, 1, 1,
0.5923439, 0.3207905, 0.25162, 1, 0, 0, 1, 1,
0.6020308, -1.600913, 3.478214, 1, 0, 0, 1, 1,
0.6165696, -1.281067, 3.887542, 1, 0, 0, 1, 1,
0.6206791, 1.919348, 0.7447871, 1, 0, 0, 1, 1,
0.6207116, 0.5308911, 0.6888512, 1, 0, 0, 1, 1,
0.6265054, 1.41422, 0.7749397, 0, 0, 0, 1, 1,
0.6325632, -1.617558, 3.39589, 0, 0, 0, 1, 1,
0.6352422, 1.046313, 0.220977, 0, 0, 0, 1, 1,
0.6402071, 0.9466223, 0.9084378, 0, 0, 0, 1, 1,
0.6404313, -0.3812494, 1.34443, 0, 0, 0, 1, 1,
0.6447026, -0.8800239, 2.451901, 0, 0, 0, 1, 1,
0.6506031, -0.6213608, 2.275541, 0, 0, 0, 1, 1,
0.6542022, 0.2627917, 1.019647, 1, 1, 1, 1, 1,
0.6562823, -1.332594, 1.188494, 1, 1, 1, 1, 1,
0.6611049, -1.102538, 1.732531, 1, 1, 1, 1, 1,
0.6642845, -0.9490215, 3.718186, 1, 1, 1, 1, 1,
0.6699393, 0.4133125, 0.7218993, 1, 1, 1, 1, 1,
0.6883292, -0.5155623, 1.393926, 1, 1, 1, 1, 1,
0.6883432, -0.02761709, 1.404557, 1, 1, 1, 1, 1,
0.6899063, -0.5405554, 2.371078, 1, 1, 1, 1, 1,
0.6925873, -0.5136817, 2.667449, 1, 1, 1, 1, 1,
0.7092436, 0.9607277, 2.134912, 1, 1, 1, 1, 1,
0.7096257, 0.7996975, 0.08171631, 1, 1, 1, 1, 1,
0.7103462, -0.3690504, 2.986936, 1, 1, 1, 1, 1,
0.7134404, -0.501388, 1.093038, 1, 1, 1, 1, 1,
0.7158232, 1.499913, -0.3714516, 1, 1, 1, 1, 1,
0.7172385, 0.540967, 0.009835812, 1, 1, 1, 1, 1,
0.7187417, -0.8216596, 1.836885, 0, 0, 1, 1, 1,
0.7226983, -0.2100996, 0.7022253, 1, 0, 0, 1, 1,
0.7283131, -0.2616614, 0.1769536, 1, 0, 0, 1, 1,
0.7377326, 0.2198532, 1.660268, 1, 0, 0, 1, 1,
0.7390977, 1.143607, 0.7962059, 1, 0, 0, 1, 1,
0.7444292, -1.28435, 0.09984504, 1, 0, 0, 1, 1,
0.7478834, -2.436259, 1.645157, 0, 0, 0, 1, 1,
0.7567388, -2.061335, 3.567417, 0, 0, 0, 1, 1,
0.7596174, -1.717164, 3.681446, 0, 0, 0, 1, 1,
0.7600707, 0.07700907, 0.4316135, 0, 0, 0, 1, 1,
0.7612066, 0.2408429, 0.7780731, 0, 0, 0, 1, 1,
0.7632416, -0.3380319, 1.789068, 0, 0, 0, 1, 1,
0.7675571, -0.7030391, 1.580076, 0, 0, 0, 1, 1,
0.7678, -1.015347, 2.897837, 1, 1, 1, 1, 1,
0.7710011, -0.9628348, 1.647839, 1, 1, 1, 1, 1,
0.7746582, -2.005053, 3.398728, 1, 1, 1, 1, 1,
0.7831556, 0.3747846, 0.2530472, 1, 1, 1, 1, 1,
0.7856383, 0.1367415, 1.529069, 1, 1, 1, 1, 1,
0.7864344, -1.029711, 2.540794, 1, 1, 1, 1, 1,
0.7868956, -0.6842358, 1.722146, 1, 1, 1, 1, 1,
0.7872985, 1.685422, -0.6086423, 1, 1, 1, 1, 1,
0.7876121, 1.120511, 0.8540885, 1, 1, 1, 1, 1,
0.7888988, 0.5564702, 0.739679, 1, 1, 1, 1, 1,
0.7926321, 0.1512091, 2.373481, 1, 1, 1, 1, 1,
0.7934969, 0.1406386, 3.870154, 1, 1, 1, 1, 1,
0.7954099, -2.834718, 3.257496, 1, 1, 1, 1, 1,
0.7969118, 0.3617665, 1.241339, 1, 1, 1, 1, 1,
0.7969677, 0.3628323, -0.4403507, 1, 1, 1, 1, 1,
0.7980018, -0.0820141, 1.799832, 0, 0, 1, 1, 1,
0.799542, 0.7787046, 2.514917, 1, 0, 0, 1, 1,
0.8001302, -1.431596, 1.91002, 1, 0, 0, 1, 1,
0.8034107, 0.6275715, 2.924684, 1, 0, 0, 1, 1,
0.8034682, 1.269551, 1.039326, 1, 0, 0, 1, 1,
0.8047265, 0.7410655, 0.08827075, 1, 0, 0, 1, 1,
0.8064122, -2.363536, 1.281213, 0, 0, 0, 1, 1,
0.8079078, 0.8048958, 1.238626, 0, 0, 0, 1, 1,
0.8160835, -0.4769699, 3.338455, 0, 0, 0, 1, 1,
0.8166192, 0.520027, 1.767926, 0, 0, 0, 1, 1,
0.8182127, -2.002039, 2.283944, 0, 0, 0, 1, 1,
0.8215366, 0.5343549, 1.440004, 0, 0, 0, 1, 1,
0.8216451, -1.787746, 3.18872, 0, 0, 0, 1, 1,
0.8247356, -0.1741008, 2.295742, 1, 1, 1, 1, 1,
0.8274366, -0.1356459, 0.6708167, 1, 1, 1, 1, 1,
0.828798, -0.786431, 1.106981, 1, 1, 1, 1, 1,
0.8306999, 1.041051, 1.267047, 1, 1, 1, 1, 1,
0.8311056, 0.3841142, 2.006273, 1, 1, 1, 1, 1,
0.8347588, -1.749522, 2.63713, 1, 1, 1, 1, 1,
0.8408971, 1.243307, 0.8601702, 1, 1, 1, 1, 1,
0.8459725, -0.5043795, 0.3954281, 1, 1, 1, 1, 1,
0.8500224, 1.498814, 0.4427942, 1, 1, 1, 1, 1,
0.8529801, -0.2750472, 0.4203176, 1, 1, 1, 1, 1,
0.8537787, 0.7624158, 0.5999728, 1, 1, 1, 1, 1,
0.8565487, -0.9026858, 3.899183, 1, 1, 1, 1, 1,
0.8571398, 0.6597827, 2.962298, 1, 1, 1, 1, 1,
0.8710134, 0.1720836, 2.741318, 1, 1, 1, 1, 1,
0.8722293, -0.3243115, 3.448582, 1, 1, 1, 1, 1,
0.8723001, -0.3380202, 3.656718, 0, 0, 1, 1, 1,
0.8745498, -0.1537734, 2.2248, 1, 0, 0, 1, 1,
0.8828586, -1.210734, 3.213478, 1, 0, 0, 1, 1,
0.8871211, 0.9172761, -1.111474, 1, 0, 0, 1, 1,
0.8922175, -0.1628882, 1.336095, 1, 0, 0, 1, 1,
0.894272, 0.8002064, 0.3893517, 1, 0, 0, 1, 1,
0.8961433, -0.1016284, 2.244786, 0, 0, 0, 1, 1,
0.9075268, -0.3822491, 0.8923152, 0, 0, 0, 1, 1,
0.9144219, -1.462376, 3.696511, 0, 0, 0, 1, 1,
0.9186817, 0.573283, 2.922066, 0, 0, 0, 1, 1,
0.9320692, -1.422462, 1.808262, 0, 0, 0, 1, 1,
0.9327103, 0.2352906, 2.321751, 0, 0, 0, 1, 1,
0.9498405, -1.249049, 3.223278, 0, 0, 0, 1, 1,
0.9572847, -0.8541692, 1.92441, 1, 1, 1, 1, 1,
0.9598582, 1.560172, 1.129498, 1, 1, 1, 1, 1,
0.9669915, 1.735804, -0.09047338, 1, 1, 1, 1, 1,
0.9685969, 1.119069, 0.05380312, 1, 1, 1, 1, 1,
0.9742956, 1.168667, 1.439516, 1, 1, 1, 1, 1,
0.978189, 0.3805507, 2.151565, 1, 1, 1, 1, 1,
0.9812335, -0.148665, 2.051559, 1, 1, 1, 1, 1,
0.9905248, -1.261158, 1.852898, 1, 1, 1, 1, 1,
1.023047, 0.9659902, 2.128439, 1, 1, 1, 1, 1,
1.03877, 0.5746078, -0.5727906, 1, 1, 1, 1, 1,
1.039643, 0.389694, 1.532599, 1, 1, 1, 1, 1,
1.040248, -0.3507237, 0.8486903, 1, 1, 1, 1, 1,
1.042621, -3.215519, 2.090647, 1, 1, 1, 1, 1,
1.049833, -0.7967757, 3.941305, 1, 1, 1, 1, 1,
1.06131, 0.2945459, 0.7006912, 1, 1, 1, 1, 1,
1.06548, -1.489465, 3.63126, 0, 0, 1, 1, 1,
1.072643, 0.6229504, -0.6063842, 1, 0, 0, 1, 1,
1.076753, -0.03383636, 0.7525254, 1, 0, 0, 1, 1,
1.077995, 0.945447, 1.045512, 1, 0, 0, 1, 1,
1.081374, -0.04963617, 1.519221, 1, 0, 0, 1, 1,
1.082829, -1.495076, 2.697109, 1, 0, 0, 1, 1,
1.086612, 0.1282663, 1.092964, 0, 0, 0, 1, 1,
1.087494, 1.05338, 0.7671254, 0, 0, 0, 1, 1,
1.091317, -0.4475777, 1.555632, 0, 0, 0, 1, 1,
1.093084, -0.7957838, 3.71616, 0, 0, 0, 1, 1,
1.094451, 0.1662657, 0.6106088, 0, 0, 0, 1, 1,
1.095566, 0.7684826, -0.3871861, 0, 0, 0, 1, 1,
1.1033, 1.238743, 0.6753275, 0, 0, 0, 1, 1,
1.108574, -0.9810926, 2.135732, 1, 1, 1, 1, 1,
1.109979, -1.196762, 2.425314, 1, 1, 1, 1, 1,
1.114328, -1.8745, 3.685414, 1, 1, 1, 1, 1,
1.117255, 0.9489578, 0.552129, 1, 1, 1, 1, 1,
1.121764, 1.014868, 1.16496, 1, 1, 1, 1, 1,
1.122052, 1.413332, 2.357663, 1, 1, 1, 1, 1,
1.122391, 1.423215, 0.64596, 1, 1, 1, 1, 1,
1.126189, -0.4001942, 2.218586, 1, 1, 1, 1, 1,
1.126702, -0.9507327, 0.2240585, 1, 1, 1, 1, 1,
1.132581, 0.3328047, 2.332189, 1, 1, 1, 1, 1,
1.136389, -0.5046754, 3.523557, 1, 1, 1, 1, 1,
1.138641, -0.5292928, 2.397578, 1, 1, 1, 1, 1,
1.140248, 0.0889318, 3.37814, 1, 1, 1, 1, 1,
1.144568, -0.8287357, 2.655892, 1, 1, 1, 1, 1,
1.145658, -0.07254161, 0.3167209, 1, 1, 1, 1, 1,
1.148422, -1.337215, 1.074954, 0, 0, 1, 1, 1,
1.156654, -0.02100563, 2.177236, 1, 0, 0, 1, 1,
1.157741, -0.1772354, 2.812117, 1, 0, 0, 1, 1,
1.159255, -0.3767211, 0.7319291, 1, 0, 0, 1, 1,
1.159424, -0.1740538, 0.6198654, 1, 0, 0, 1, 1,
1.160111, 0.1027083, 1.298587, 1, 0, 0, 1, 1,
1.171563, -2.699433, 4.660756, 0, 0, 0, 1, 1,
1.175289, 0.5018033, 0.2792771, 0, 0, 0, 1, 1,
1.181231, -1.795519, 4.725455, 0, 0, 0, 1, 1,
1.187319, -0.2758869, 4.417243, 0, 0, 0, 1, 1,
1.191669, -0.06190538, 1.380488, 0, 0, 0, 1, 1,
1.195639, 1.394268, 0.501182, 0, 0, 0, 1, 1,
1.199175, 0.4232558, 1.365549, 0, 0, 0, 1, 1,
1.201445, -1.00724, 3.327235, 1, 1, 1, 1, 1,
1.201473, 0.589319, 1.53486, 1, 1, 1, 1, 1,
1.203229, 1.74113, 1.613319, 1, 1, 1, 1, 1,
1.209525, -1.082145, 2.019239, 1, 1, 1, 1, 1,
1.211949, 0.1444916, 0.1865061, 1, 1, 1, 1, 1,
1.215884, -0.950649, 2.328431, 1, 1, 1, 1, 1,
1.218698, -0.7842413, 1.071124, 1, 1, 1, 1, 1,
1.22154, 1.077393, 2.223844, 1, 1, 1, 1, 1,
1.224762, 1.022092, 0.7532359, 1, 1, 1, 1, 1,
1.225524, 1.737934, 1.336287, 1, 1, 1, 1, 1,
1.230118, -1.698109, 2.915028, 1, 1, 1, 1, 1,
1.232887, -0.3668737, 2.219935, 1, 1, 1, 1, 1,
1.239425, -0.2376796, -1.476519, 1, 1, 1, 1, 1,
1.240229, -0.8727269, 2.989843, 1, 1, 1, 1, 1,
1.241643, 1.973157, 0.8708704, 1, 1, 1, 1, 1,
1.24459, -0.8181353, 1.460687, 0, 0, 1, 1, 1,
1.245936, -0.4400052, 2.192573, 1, 0, 0, 1, 1,
1.247228, 1.817567, 0.1729476, 1, 0, 0, 1, 1,
1.249547, -1.103356, 3.203751, 1, 0, 0, 1, 1,
1.251478, 1.12611, 0.3681675, 1, 0, 0, 1, 1,
1.260697, 0.4434493, 1.507167, 1, 0, 0, 1, 1,
1.264478, -0.4145206, 2.824309, 0, 0, 0, 1, 1,
1.281048, -0.7441626, 2.670559, 0, 0, 0, 1, 1,
1.287901, -1.275844, 3.793349, 0, 0, 0, 1, 1,
1.289212, 0.1836399, 2.978487, 0, 0, 0, 1, 1,
1.305369, 0.1820082, 1.090883, 0, 0, 0, 1, 1,
1.305511, 0.9215541, 1.665902, 0, 0, 0, 1, 1,
1.320582, 0.2587324, 2.588975, 0, 0, 0, 1, 1,
1.33398, -1.572645, 1.685438, 1, 1, 1, 1, 1,
1.336555, 0.6964029, 0.1594068, 1, 1, 1, 1, 1,
1.341547, -0.488872, 3.497102, 1, 1, 1, 1, 1,
1.348243, 0.285861, 1.121744, 1, 1, 1, 1, 1,
1.350915, -0.6305598, 4.12816, 1, 1, 1, 1, 1,
1.351236, 0.5713421, -0.973901, 1, 1, 1, 1, 1,
1.357632, 0.6676714, 1.206315, 1, 1, 1, 1, 1,
1.36129, -0.02329255, 2.686103, 1, 1, 1, 1, 1,
1.36732, -0.8085687, 1.99272, 1, 1, 1, 1, 1,
1.370858, -0.221605, 1.218753, 1, 1, 1, 1, 1,
1.381359, 0.459234, 0.9477172, 1, 1, 1, 1, 1,
1.381558, -0.2988206, 1.877203, 1, 1, 1, 1, 1,
1.382309, -1.259365, 3.620711, 1, 1, 1, 1, 1,
1.388374, -0.5465229, 0.7085118, 1, 1, 1, 1, 1,
1.398039, 0.2130106, 2.55816, 1, 1, 1, 1, 1,
1.40377, -1.371668, 1.401164, 0, 0, 1, 1, 1,
1.409203, 0.6105081, -0.06577528, 1, 0, 0, 1, 1,
1.410637, -0.01299699, 1.809049, 1, 0, 0, 1, 1,
1.436492, -0.0684468, 2.196211, 1, 0, 0, 1, 1,
1.444891, 1.360479, 1.505458, 1, 0, 0, 1, 1,
1.446431, 0.2439691, 1.247201, 1, 0, 0, 1, 1,
1.450635, -1.174243, 2.313838, 0, 0, 0, 1, 1,
1.450655, -1.058418, 4.331246, 0, 0, 0, 1, 1,
1.453274, -0.8275887, 2.430006, 0, 0, 0, 1, 1,
1.456145, 0.09773767, 2.240838, 0, 0, 0, 1, 1,
1.460578, 1.339295, 1.587263, 0, 0, 0, 1, 1,
1.469629, 0.02872809, 2.451598, 0, 0, 0, 1, 1,
1.485774, -2.293029, 3.138221, 0, 0, 0, 1, 1,
1.498226, 0.4748259, 1.033604, 1, 1, 1, 1, 1,
1.504346, 0.74777, 1.73496, 1, 1, 1, 1, 1,
1.512408, -0.2850977, 1.642606, 1, 1, 1, 1, 1,
1.524158, 0.1679809, 1.524798, 1, 1, 1, 1, 1,
1.52974, 0.9229525, 0.5705634, 1, 1, 1, 1, 1,
1.530464, -0.6604497, 2.087862, 1, 1, 1, 1, 1,
1.531369, -0.5519412, 1.719293, 1, 1, 1, 1, 1,
1.548537, 2.57325, -1.677614, 1, 1, 1, 1, 1,
1.550494, 0.5372406, 1.225085, 1, 1, 1, 1, 1,
1.55408, -0.6653399, 2.497977, 1, 1, 1, 1, 1,
1.555773, 0.7259629, 0.9448828, 1, 1, 1, 1, 1,
1.561038, 0.5340094, 2.910546, 1, 1, 1, 1, 1,
1.576885, 0.2459407, 1.476514, 1, 1, 1, 1, 1,
1.580519, -2.429443, 1.981681, 1, 1, 1, 1, 1,
1.590606, 0.6013793, 0.6850185, 1, 1, 1, 1, 1,
1.596058, 0.08992603, 1.764539, 0, 0, 1, 1, 1,
1.617392, -0.8980831, 3.580744, 1, 0, 0, 1, 1,
1.638537, 0.8745769, 0.4178686, 1, 0, 0, 1, 1,
1.640029, 0.9691869, 0.9064892, 1, 0, 0, 1, 1,
1.640706, -0.2755933, 1.159917, 1, 0, 0, 1, 1,
1.645759, 1.32658, 0.1265421, 1, 0, 0, 1, 1,
1.652182, -0.1632145, 1.052371, 0, 0, 0, 1, 1,
1.659104, 0.4130923, 1.139493, 0, 0, 0, 1, 1,
1.659243, 0.9182798, 0.09644254, 0, 0, 0, 1, 1,
1.665288, 1.062153, 0.1937405, 0, 0, 0, 1, 1,
1.673256, 0.3204204, 0.5960381, 0, 0, 0, 1, 1,
1.732186, -1.005773, 1.783601, 0, 0, 0, 1, 1,
1.741172, 0.6383722, 2.280163, 0, 0, 0, 1, 1,
1.74947, 0.1240483, 0.8239511, 1, 1, 1, 1, 1,
1.776876, -0.6867366, 1.113006, 1, 1, 1, 1, 1,
1.784818, -3.440794, 2.351623, 1, 1, 1, 1, 1,
1.791605, -1.07889, 1.671654, 1, 1, 1, 1, 1,
1.807218, -1.163891, 1.860539, 1, 1, 1, 1, 1,
1.810168, -1.791369, 2.934845, 1, 1, 1, 1, 1,
1.819768, 0.2457732, -0.320931, 1, 1, 1, 1, 1,
1.831706, -0.7598699, 3.718215, 1, 1, 1, 1, 1,
1.878398, -0.9761551, 3.6868, 1, 1, 1, 1, 1,
1.884525, 0.5465787, 0.04190661, 1, 1, 1, 1, 1,
1.890465, -0.9126509, 2.2119, 1, 1, 1, 1, 1,
1.890614, -0.3457863, 0.3775891, 1, 1, 1, 1, 1,
1.894454, -0.2890121, 1.264533, 1, 1, 1, 1, 1,
1.907112, 0.3330663, 2.866372, 1, 1, 1, 1, 1,
1.907964, -0.5289356, 2.429694, 1, 1, 1, 1, 1,
1.913214, 0.02745521, 0.9696615, 0, 0, 1, 1, 1,
1.920064, -0.08120617, 0.1299028, 1, 0, 0, 1, 1,
1.925584, 0.1080748, 1.64724, 1, 0, 0, 1, 1,
1.974628, -1.578596, 2.870014, 1, 0, 0, 1, 1,
1.977772, -3.844418, 1.615612, 1, 0, 0, 1, 1,
1.980163, -1.926285, 3.243514, 1, 0, 0, 1, 1,
2.027814, 1.683324, 2.5165, 0, 0, 0, 1, 1,
2.043818, 0.6335639, 2.094662, 0, 0, 0, 1, 1,
2.14363, -0.6440609, 0.7394427, 0, 0, 0, 1, 1,
2.255222, 0.2608419, 1.791653, 0, 0, 0, 1, 1,
2.261189, -0.31467, 2.31669, 0, 0, 0, 1, 1,
2.389585, -0.3566074, 1.084323, 0, 0, 0, 1, 1,
2.418898, 0.0758015, 2.562027, 0, 0, 0, 1, 1,
2.512022, 0.6653189, 1.389446, 1, 1, 1, 1, 1,
2.520098, -0.5528382, 2.316132, 1, 1, 1, 1, 1,
2.578909, 0.8439418, 2.061864, 1, 1, 1, 1, 1,
2.661966, 0.09702833, 3.372102, 1, 1, 1, 1, 1,
2.718731, -0.195376, 1.754531, 1, 1, 1, 1, 1,
2.745313, -1.093242, 1.714985, 1, 1, 1, 1, 1,
3.531331, 0.7572284, 1.459166, 1, 1, 1, 1, 1
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
var radius = 10.03495;
var distance = 35.24734;
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
mvMatrix.translate( -0.2372808, 0.2913294, -0.2019958 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.24734);
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
