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
-3.393056, -0.02319302, -1.886271, 1, 0, 0, 1,
-2.979836, -0.636326, -2.210886, 1, 0.007843138, 0, 1,
-2.775062, 0.08881647, -1.26063, 1, 0.01176471, 0, 1,
-2.435128, -0.4203471, -0.6491125, 1, 0.01960784, 0, 1,
-2.432334, -1.168545, -3.067378, 1, 0.02352941, 0, 1,
-2.385265, -1.841904, -2.666821, 1, 0.03137255, 0, 1,
-2.327869, 0.6208325, 0.5334024, 1, 0.03529412, 0, 1,
-2.294389, 1.604561, -1.117006, 1, 0.04313726, 0, 1,
-2.270703, -0.1151423, -0.08711847, 1, 0.04705882, 0, 1,
-2.244631, -0.7463224, -2.962835, 1, 0.05490196, 0, 1,
-2.161212, -0.4808951, -0.694277, 1, 0.05882353, 0, 1,
-2.127942, 1.913393, 0.0004835782, 1, 0.06666667, 0, 1,
-2.099819, -0.1755333, -3.016154, 1, 0.07058824, 0, 1,
-2.090319, 2.475961, -0.1269078, 1, 0.07843138, 0, 1,
-2.081205, -0.6314401, -1.459546, 1, 0.08235294, 0, 1,
-2.072255, -0.5100191, -3.600376, 1, 0.09019608, 0, 1,
-2.046833, -1.373266, -1.713354, 1, 0.09411765, 0, 1,
-2.036054, -0.111699, -1.408331, 1, 0.1019608, 0, 1,
-2.035954, -0.6965746, -2.7033, 1, 0.1098039, 0, 1,
-2.015198, -0.4135959, -2.221701, 1, 0.1137255, 0, 1,
-1.97273, -1.356219, -1.15303, 1, 0.1215686, 0, 1,
-1.970022, -0.3246189, -0.8677366, 1, 0.1254902, 0, 1,
-1.96807, 1.410314, -1.265909, 1, 0.1333333, 0, 1,
-1.965093, -1.212435, -1.903544, 1, 0.1372549, 0, 1,
-1.944631, -1.118445, -2.061129, 1, 0.145098, 0, 1,
-1.937114, 0.3888558, -1.130705, 1, 0.1490196, 0, 1,
-1.923756, -0.4448366, -1.15963, 1, 0.1568628, 0, 1,
-1.896995, 0.07064997, -2.743246, 1, 0.1607843, 0, 1,
-1.877966, -0.7863777, -4.95422, 1, 0.1686275, 0, 1,
-1.844881, 0.1126828, -1.962213, 1, 0.172549, 0, 1,
-1.832539, -0.4664875, -1.377848, 1, 0.1803922, 0, 1,
-1.829841, -0.6297525, -0.1547881, 1, 0.1843137, 0, 1,
-1.827767, -0.9417261, -1.299598, 1, 0.1921569, 0, 1,
-1.784499, 0.5745854, -1.705761, 1, 0.1960784, 0, 1,
-1.780368, -0.05280419, -0.755927, 1, 0.2039216, 0, 1,
-1.754453, 0.1052485, -1.197577, 1, 0.2117647, 0, 1,
-1.748825, -0.6058567, -1.579564, 1, 0.2156863, 0, 1,
-1.737543, -0.2054379, 0.5275, 1, 0.2235294, 0, 1,
-1.730549, 1.126471, 0.2757629, 1, 0.227451, 0, 1,
-1.725189, -0.2642572, -1.403595, 1, 0.2352941, 0, 1,
-1.717182, 0.6131828, -0.3170475, 1, 0.2392157, 0, 1,
-1.703417, -1.491707, -2.554515, 1, 0.2470588, 0, 1,
-1.701109, 0.2623227, -2.812722, 1, 0.2509804, 0, 1,
-1.691472, 1.332343, -0.8338823, 1, 0.2588235, 0, 1,
-1.678194, 0.7911072, -1.949931, 1, 0.2627451, 0, 1,
-1.670716, -0.7126777, -2.200149, 1, 0.2705882, 0, 1,
-1.658024, -0.8259474, -1.392669, 1, 0.2745098, 0, 1,
-1.64649, 1.673223, -1.286139, 1, 0.282353, 0, 1,
-1.646163, -1.226699, -1.601851, 1, 0.2862745, 0, 1,
-1.631428, -1.659765, -2.954208, 1, 0.2941177, 0, 1,
-1.629184, 0.2048847, -1.86245, 1, 0.3019608, 0, 1,
-1.625253, -0.4508438, -1.742134, 1, 0.3058824, 0, 1,
-1.62515, 0.685855, -0.976714, 1, 0.3137255, 0, 1,
-1.624837, 0.2810413, -1.439149, 1, 0.3176471, 0, 1,
-1.591887, -1.36105, -1.826231, 1, 0.3254902, 0, 1,
-1.590243, 0.2285534, -0.2322546, 1, 0.3294118, 0, 1,
-1.577866, 0.6918396, -1.247116, 1, 0.3372549, 0, 1,
-1.568175, -0.5484298, -1.483483, 1, 0.3411765, 0, 1,
-1.555979, -0.09105083, -1.163472, 1, 0.3490196, 0, 1,
-1.5245, 1.097916, -1.154685, 1, 0.3529412, 0, 1,
-1.512905, 0.7253217, -0.1206448, 1, 0.3607843, 0, 1,
-1.492951, 1.196048, -1.248026, 1, 0.3647059, 0, 1,
-1.488742, 0.785543, -2.904556, 1, 0.372549, 0, 1,
-1.471387, -0.1727358, -0.3176379, 1, 0.3764706, 0, 1,
-1.464388, 0.2163504, -1.394017, 1, 0.3843137, 0, 1,
-1.449691, -0.341528, -2.738621, 1, 0.3882353, 0, 1,
-1.412205, 0.5049456, -2.029926, 1, 0.3960784, 0, 1,
-1.409027, -0.3672662, -1.437401, 1, 0.4039216, 0, 1,
-1.404338, 0.3909053, -1.146335, 1, 0.4078431, 0, 1,
-1.402193, -0.2455957, -2.212415, 1, 0.4156863, 0, 1,
-1.38752, 1.117058, -0.9220049, 1, 0.4196078, 0, 1,
-1.386899, 1.030308, -1.719836, 1, 0.427451, 0, 1,
-1.375112, 0.7385988, -3.035735, 1, 0.4313726, 0, 1,
-1.374697, -0.04253621, -1.362077, 1, 0.4392157, 0, 1,
-1.363275, -0.4258462, -2.262344, 1, 0.4431373, 0, 1,
-1.353304, -0.8246407, -0.7394167, 1, 0.4509804, 0, 1,
-1.349663, 0.3831365, -0.6164929, 1, 0.454902, 0, 1,
-1.336386, 0.2220032, -2.941753, 1, 0.4627451, 0, 1,
-1.333692, 0.5215591, -1.300606, 1, 0.4666667, 0, 1,
-1.332749, 0.29893, -3.136359, 1, 0.4745098, 0, 1,
-1.324021, 1.706076, -2.010119, 1, 0.4784314, 0, 1,
-1.32019, 1.367593, -1.678931, 1, 0.4862745, 0, 1,
-1.317327, 0.5891111, -1.656122, 1, 0.4901961, 0, 1,
-1.316723, 1.883264, 1.476173, 1, 0.4980392, 0, 1,
-1.309174, 1.548252, -1.653061, 1, 0.5058824, 0, 1,
-1.29871, 0.5999578, -0.8778443, 1, 0.509804, 0, 1,
-1.29816, 1.012449, 0.4262331, 1, 0.5176471, 0, 1,
-1.297644, -0.2507513, -1.857622, 1, 0.5215687, 0, 1,
-1.293545, 2.387583, -1.532531, 1, 0.5294118, 0, 1,
-1.283696, -0.913982, -3.243876, 1, 0.5333334, 0, 1,
-1.283656, 1.226747, -0.4912932, 1, 0.5411765, 0, 1,
-1.271137, -0.1680023, -0.9184556, 1, 0.5450981, 0, 1,
-1.270441, 1.097915, -1.518761, 1, 0.5529412, 0, 1,
-1.267934, 0.4436775, 0.3979846, 1, 0.5568628, 0, 1,
-1.267688, -2.347433, -2.09558, 1, 0.5647059, 0, 1,
-1.263715, -0.1587503, -2.194221, 1, 0.5686275, 0, 1,
-1.260864, -1.568124, -2.516433, 1, 0.5764706, 0, 1,
-1.259394, 1.086487, 0.06046212, 1, 0.5803922, 0, 1,
-1.25365, 0.2853701, -1.012369, 1, 0.5882353, 0, 1,
-1.248059, 0.9933493, -2.34841, 1, 0.5921569, 0, 1,
-1.244558, 0.8656014, -0.4906131, 1, 0.6, 0, 1,
-1.244479, 0.4716102, -0.7514209, 1, 0.6078432, 0, 1,
-1.237868, 1.219077, -0.02482656, 1, 0.6117647, 0, 1,
-1.237138, 0.5052524, -1.595502, 1, 0.6196079, 0, 1,
-1.22655, 2.136579, 0.01270469, 1, 0.6235294, 0, 1,
-1.214406, -0.1657742, -1.948006, 1, 0.6313726, 0, 1,
-1.202433, -1.069111, -2.760053, 1, 0.6352941, 0, 1,
-1.194537, 0.9616547, -0.4769849, 1, 0.6431373, 0, 1,
-1.189431, 2.601712, -1.162795, 1, 0.6470588, 0, 1,
-1.183489, 2.341262, -0.7140619, 1, 0.654902, 0, 1,
-1.183308, -1.261868, -3.198196, 1, 0.6588235, 0, 1,
-1.174214, -0.2123125, -1.73786, 1, 0.6666667, 0, 1,
-1.162942, 1.247266, -1.163594, 1, 0.6705883, 0, 1,
-1.157789, 0.4520214, -0.4815972, 1, 0.6784314, 0, 1,
-1.157787, -1.013639, -2.880367, 1, 0.682353, 0, 1,
-1.155599, 0.169972, -1.986133, 1, 0.6901961, 0, 1,
-1.138587, 0.249227, -1.647404, 1, 0.6941177, 0, 1,
-1.136798, 1.352936, -1.66561, 1, 0.7019608, 0, 1,
-1.136704, -0.8207291, -2.578935, 1, 0.7098039, 0, 1,
-1.136702, 0.6146369, 0.7327498, 1, 0.7137255, 0, 1,
-1.133772, -1.363352, -1.807424, 1, 0.7215686, 0, 1,
-1.13123, 1.675663, -1.992371, 1, 0.7254902, 0, 1,
-1.130157, -0.4165266, -3.685329, 1, 0.7333333, 0, 1,
-1.11389, -1.368733, -2.062292, 1, 0.7372549, 0, 1,
-1.106727, -0.433342, -2.166191, 1, 0.7450981, 0, 1,
-1.098195, 0.3027074, -1.09357, 1, 0.7490196, 0, 1,
-1.095421, 0.3657089, -1.708752, 1, 0.7568628, 0, 1,
-1.094599, 1.887301, -0.8604419, 1, 0.7607843, 0, 1,
-1.085392, 0.0299602, -0.5233889, 1, 0.7686275, 0, 1,
-1.084935, -1.567465, -2.676642, 1, 0.772549, 0, 1,
-1.083307, -0.006446843, -1.784083, 1, 0.7803922, 0, 1,
-1.081422, 0.00627053, -0.54724, 1, 0.7843137, 0, 1,
-1.081308, -0.8721566, -2.294213, 1, 0.7921569, 0, 1,
-1.080282, -0.1451919, -1.089465, 1, 0.7960784, 0, 1,
-1.075383, 0.8039358, -2.191995, 1, 0.8039216, 0, 1,
-1.072148, -0.1048594, -0.6010012, 1, 0.8117647, 0, 1,
-1.071483, 0.8282803, -0.2978706, 1, 0.8156863, 0, 1,
-1.070125, 0.5033714, -2.335339, 1, 0.8235294, 0, 1,
-1.068259, -1.056785, -1.324561, 1, 0.827451, 0, 1,
-1.065022, 0.2086053, -2.262195, 1, 0.8352941, 0, 1,
-1.064488, 2.114878, -2.118857, 1, 0.8392157, 0, 1,
-1.05084, 1.21434, -1.27657, 1, 0.8470588, 0, 1,
-1.043006, -0.04820713, -3.000477, 1, 0.8509804, 0, 1,
-1.040913, -0.06160777, -0.2847732, 1, 0.8588235, 0, 1,
-1.038946, 1.259649, 0.3078816, 1, 0.8627451, 0, 1,
-1.038055, -1.20151, -2.717805, 1, 0.8705882, 0, 1,
-1.035953, 0.1294332, -1.184522, 1, 0.8745098, 0, 1,
-1.033504, -0.3821402, -2.367954, 1, 0.8823529, 0, 1,
-1.030261, 1.324921, -1.986073, 1, 0.8862745, 0, 1,
-1.025946, -0.2307341, -1.872313, 1, 0.8941177, 0, 1,
-1.022875, 0.5562951, 0.1079201, 1, 0.8980392, 0, 1,
-1.019442, -0.2826871, -1.19873, 1, 0.9058824, 0, 1,
-1.015341, 0.3855951, -3.851693, 1, 0.9137255, 0, 1,
-1.010763, 0.05480324, -0.3813752, 1, 0.9176471, 0, 1,
-1.009341, -2.309493, -2.009666, 1, 0.9254902, 0, 1,
-1.003128, 0.1589036, -1.171601, 1, 0.9294118, 0, 1,
-0.9994164, 0.7354469, -1.191582, 1, 0.9372549, 0, 1,
-0.9972423, -0.3130069, -2.784732, 1, 0.9411765, 0, 1,
-0.9917237, -1.037688, -1.177515, 1, 0.9490196, 0, 1,
-0.9913894, -0.7711484, -2.414575, 1, 0.9529412, 0, 1,
-0.9908614, 2.306798, -0.06713194, 1, 0.9607843, 0, 1,
-0.9889811, -0.1815359, -2.268208, 1, 0.9647059, 0, 1,
-0.9880899, 0.2943703, -1.923374, 1, 0.972549, 0, 1,
-0.9831901, -0.1598651, -1.325308, 1, 0.9764706, 0, 1,
-0.9815847, 1.227526, 0.8157244, 1, 0.9843137, 0, 1,
-0.9805179, 0.9736361, -1.453303, 1, 0.9882353, 0, 1,
-0.9774699, 0.6556797, -1.195253, 1, 0.9960784, 0, 1,
-0.9723554, 0.3969716, -1.496962, 0.9960784, 1, 0, 1,
-0.9665601, 0.5627808, 0.01714049, 0.9921569, 1, 0, 1,
-0.9642338, -1.168013, -0.9384004, 0.9843137, 1, 0, 1,
-0.9633124, 0.2496884, -1.74933, 0.9803922, 1, 0, 1,
-0.962558, -1.197799, -3.207187, 0.972549, 1, 0, 1,
-0.9611294, -0.5327203, -3.675695, 0.9686275, 1, 0, 1,
-0.9595972, 1.38155, -1.743478, 0.9607843, 1, 0, 1,
-0.9455813, 0.290411, -2.379708, 0.9568627, 1, 0, 1,
-0.9424098, 0.6038437, -0.4769411, 0.9490196, 1, 0, 1,
-0.9397425, 0.2008239, -0.9214051, 0.945098, 1, 0, 1,
-0.9350675, 0.5972578, -0.2875897, 0.9372549, 1, 0, 1,
-0.9332226, 0.7256809, 0.3634819, 0.9333333, 1, 0, 1,
-0.9313834, -0.8342528, -2.976825, 0.9254902, 1, 0, 1,
-0.9215773, -1.395312, -1.498693, 0.9215686, 1, 0, 1,
-0.9107805, -0.002576947, -1.516339, 0.9137255, 1, 0, 1,
-0.9107642, 1.098324, -2.441873, 0.9098039, 1, 0, 1,
-0.9105227, 0.7107699, -0.5058189, 0.9019608, 1, 0, 1,
-0.900774, -0.2215216, -2.205498, 0.8941177, 1, 0, 1,
-0.8996821, 0.1781121, -1.051396, 0.8901961, 1, 0, 1,
-0.8932565, -0.03987534, -2.28536, 0.8823529, 1, 0, 1,
-0.8895887, 0.1713787, -2.49272, 0.8784314, 1, 0, 1,
-0.8884791, 1.180409, 0.2797132, 0.8705882, 1, 0, 1,
-0.8836159, -0.0455848, -1.391459, 0.8666667, 1, 0, 1,
-0.8815913, -1.450255, -3.230201, 0.8588235, 1, 0, 1,
-0.8803671, -2.575491, -3.575196, 0.854902, 1, 0, 1,
-0.8746442, 0.5415871, -1.611027, 0.8470588, 1, 0, 1,
-0.8709939, -0.6168044, -1.712979, 0.8431373, 1, 0, 1,
-0.8671955, -0.5587279, -2.430006, 0.8352941, 1, 0, 1,
-0.8654418, 0.5914654, -2.230356, 0.8313726, 1, 0, 1,
-0.8580495, 0.6325071, -0.6287228, 0.8235294, 1, 0, 1,
-0.856248, -0.9191806, -3.582202, 0.8196079, 1, 0, 1,
-0.8481851, -0.2127809, -1.869008, 0.8117647, 1, 0, 1,
-0.8407139, -2.608335, -3.312243, 0.8078431, 1, 0, 1,
-0.8310254, -1.744436, -1.545897, 0.8, 1, 0, 1,
-0.8304785, 1.453183, -0.9068952, 0.7921569, 1, 0, 1,
-0.8270473, 2.413364, -0.8889871, 0.7882353, 1, 0, 1,
-0.8197567, 1.716719, 0.972484, 0.7803922, 1, 0, 1,
-0.8140945, -0.05459515, -1.825538, 0.7764706, 1, 0, 1,
-0.8137274, 0.86404, -0.6079431, 0.7686275, 1, 0, 1,
-0.8073004, 2.46929, 0.1516432, 0.7647059, 1, 0, 1,
-0.8035281, -1.318985, -0.9776846, 0.7568628, 1, 0, 1,
-0.8033481, 0.2215026, 0.1022111, 0.7529412, 1, 0, 1,
-0.8011265, -1.803376, -2.741099, 0.7450981, 1, 0, 1,
-0.7980118, 1.071151, -1.027631, 0.7411765, 1, 0, 1,
-0.79642, 0.6303337, -0.1055801, 0.7333333, 1, 0, 1,
-0.7934731, -1.050643, -3.003813, 0.7294118, 1, 0, 1,
-0.7914389, 0.05631925, -2.853384, 0.7215686, 1, 0, 1,
-0.7913049, 2.195318, -1.724783, 0.7176471, 1, 0, 1,
-0.7841169, 1.527174, -0.7329128, 0.7098039, 1, 0, 1,
-0.782633, -2.130466, -4.266055, 0.7058824, 1, 0, 1,
-0.7805608, -0.2364835, -1.01972, 0.6980392, 1, 0, 1,
-0.7782602, -0.9368308, -3.221115, 0.6901961, 1, 0, 1,
-0.7774498, 0.6830764, -0.005233573, 0.6862745, 1, 0, 1,
-0.7763364, -0.8129768, -3.854665, 0.6784314, 1, 0, 1,
-0.7756524, 0.9831649, -0.6393012, 0.6745098, 1, 0, 1,
-0.7752088, 1.015833, 0.8513069, 0.6666667, 1, 0, 1,
-0.7745447, 0.4247696, -1.696165, 0.6627451, 1, 0, 1,
-0.7723439, -0.7877917, -2.580153, 0.654902, 1, 0, 1,
-0.7714573, 1.044988, 0.229827, 0.6509804, 1, 0, 1,
-0.7698444, 1.827307, -1.321499, 0.6431373, 1, 0, 1,
-0.7625252, -1.011954, -2.796793, 0.6392157, 1, 0, 1,
-0.7613221, 1.840554, -0.968716, 0.6313726, 1, 0, 1,
-0.7606737, -0.1925564, -0.3109924, 0.627451, 1, 0, 1,
-0.7601328, 1.419824, -1.409041, 0.6196079, 1, 0, 1,
-0.7593604, -0.9860489, -1.422915, 0.6156863, 1, 0, 1,
-0.7573187, -0.6020555, -1.03906, 0.6078432, 1, 0, 1,
-0.7539737, -1.16436, -0.6428048, 0.6039216, 1, 0, 1,
-0.747719, -1.249306, -2.803757, 0.5960785, 1, 0, 1,
-0.7454662, 0.214467, -2.142837, 0.5882353, 1, 0, 1,
-0.744665, 0.1868721, -1.281137, 0.5843138, 1, 0, 1,
-0.7425509, 1.392344, -0.5250765, 0.5764706, 1, 0, 1,
-0.7424166, -0.1282495, -3.494455, 0.572549, 1, 0, 1,
-0.7406865, 0.592459, 0.2848054, 0.5647059, 1, 0, 1,
-0.739556, -1.68295, -2.8091, 0.5607843, 1, 0, 1,
-0.7333429, 1.107843, -1.269049, 0.5529412, 1, 0, 1,
-0.7262629, 0.7532395, -0.6198999, 0.5490196, 1, 0, 1,
-0.7251018, -0.6052754, -0.9344252, 0.5411765, 1, 0, 1,
-0.7185163, -1.121198, -1.668045, 0.5372549, 1, 0, 1,
-0.716269, 1.207838, 1.682204, 0.5294118, 1, 0, 1,
-0.715367, -0.1356842, -1.58708, 0.5254902, 1, 0, 1,
-0.7101487, 0.007633083, -1.174226, 0.5176471, 1, 0, 1,
-0.7055328, -0.7687818, -4.080583, 0.5137255, 1, 0, 1,
-0.7018722, 1.549312, 1.084708, 0.5058824, 1, 0, 1,
-0.6926128, -0.5700027, 0.1742076, 0.5019608, 1, 0, 1,
-0.6925899, 0.3203183, -1.427229, 0.4941176, 1, 0, 1,
-0.690722, 0.2125788, -0.2548509, 0.4862745, 1, 0, 1,
-0.6859009, -2.763558, -3.566025, 0.4823529, 1, 0, 1,
-0.6802856, -0.3046468, -0.8993416, 0.4745098, 1, 0, 1,
-0.6791925, 0.6317266, -2.935484, 0.4705882, 1, 0, 1,
-0.6726083, -2.002294, -1.273482, 0.4627451, 1, 0, 1,
-0.6709671, 0.3938959, -2.495581, 0.4588235, 1, 0, 1,
-0.6682417, 0.2477634, -0.695897, 0.4509804, 1, 0, 1,
-0.6656862, 0.3683031, -2.43836, 0.4470588, 1, 0, 1,
-0.664888, -0.03148758, -2.912069, 0.4392157, 1, 0, 1,
-0.6620784, -1.54074, -0.03440759, 0.4352941, 1, 0, 1,
-0.6600238, -0.4365356, -1.728082, 0.427451, 1, 0, 1,
-0.6593232, 0.6251993, -1.050663, 0.4235294, 1, 0, 1,
-0.6560428, 0.5372131, 0.1100794, 0.4156863, 1, 0, 1,
-0.6525829, 1.056237, -0.679193, 0.4117647, 1, 0, 1,
-0.6477513, -1.682219, -3.490577, 0.4039216, 1, 0, 1,
-0.6440498, -0.8499216, -1.640961, 0.3960784, 1, 0, 1,
-0.6429419, -0.9577132, -2.455124, 0.3921569, 1, 0, 1,
-0.6418986, -0.008629618, -2.60234, 0.3843137, 1, 0, 1,
-0.6391329, -0.8926103, -1.9785, 0.3803922, 1, 0, 1,
-0.6348539, 0.03261742, -3.189596, 0.372549, 1, 0, 1,
-0.6312618, 0.5586399, -0.1839506, 0.3686275, 1, 0, 1,
-0.6229352, -0.8084733, -1.987349, 0.3607843, 1, 0, 1,
-0.6142039, 0.3158289, -2.624145, 0.3568628, 1, 0, 1,
-0.610162, -0.6446096, -0.796983, 0.3490196, 1, 0, 1,
-0.6094618, -0.8137087, -2.501008, 0.345098, 1, 0, 1,
-0.6084842, 0.4230201, -2.377655, 0.3372549, 1, 0, 1,
-0.6046504, -1.109054, -0.4129604, 0.3333333, 1, 0, 1,
-0.6028453, 1.004245, -0.3233044, 0.3254902, 1, 0, 1,
-0.6016749, 1.113088, 1.175045, 0.3215686, 1, 0, 1,
-0.5979242, 0.9712332, 1.380372, 0.3137255, 1, 0, 1,
-0.5977269, 0.3875223, -0.6593757, 0.3098039, 1, 0, 1,
-0.596619, -1.227169, -3.074632, 0.3019608, 1, 0, 1,
-0.5846224, 1.201684, -2.166402, 0.2941177, 1, 0, 1,
-0.5835787, 0.7440794, -0.4458241, 0.2901961, 1, 0, 1,
-0.5819162, -0.5133795, -0.9386934, 0.282353, 1, 0, 1,
-0.5790395, -1.295963, -1.973088, 0.2784314, 1, 0, 1,
-0.5606211, -1.561728, -0.678753, 0.2705882, 1, 0, 1,
-0.5536001, 2.320467, -1.172821, 0.2666667, 1, 0, 1,
-0.5533302, 1.399873, -1.232536, 0.2588235, 1, 0, 1,
-0.5525801, 0.3705933, -2.203913, 0.254902, 1, 0, 1,
-0.5501986, 0.6775674, -1.00562, 0.2470588, 1, 0, 1,
-0.5466013, 1.200268, -1.190539, 0.2431373, 1, 0, 1,
-0.5450139, -0.07739031, -1.772609, 0.2352941, 1, 0, 1,
-0.5357604, -0.09240279, -4.162071, 0.2313726, 1, 0, 1,
-0.5354562, -0.6226406, -4.731578, 0.2235294, 1, 0, 1,
-0.5327988, 0.5409586, -1.256411, 0.2196078, 1, 0, 1,
-0.5303722, 0.7184764, -1.745282, 0.2117647, 1, 0, 1,
-0.5280057, -1.064824, -3.784508, 0.2078431, 1, 0, 1,
-0.5247378, -2.160345, -3.76174, 0.2, 1, 0, 1,
-0.523888, 0.6259933, -0.5132648, 0.1921569, 1, 0, 1,
-0.5237681, 0.5881397, 0.2819754, 0.1882353, 1, 0, 1,
-0.521345, 0.1493184, -1.473744, 0.1803922, 1, 0, 1,
-0.5165975, 1.876008, -0.877714, 0.1764706, 1, 0, 1,
-0.5162661, 1.365028, 0.2362449, 0.1686275, 1, 0, 1,
-0.5152627, 1.54289, 0.1801012, 0.1647059, 1, 0, 1,
-0.5060003, 0.7215564, 1.008454, 0.1568628, 1, 0, 1,
-0.5042972, 0.6243083, -0.9421394, 0.1529412, 1, 0, 1,
-0.5033676, -1.100653, -1.695785, 0.145098, 1, 0, 1,
-0.5006605, -0.1934269, -2.497312, 0.1411765, 1, 0, 1,
-0.5002964, 0.4386911, -0.3322732, 0.1333333, 1, 0, 1,
-0.4979259, -1.679312, -3.081218, 0.1294118, 1, 0, 1,
-0.4971137, -0.3421867, -2.546736, 0.1215686, 1, 0, 1,
-0.4929894, 0.1502642, -0.5768122, 0.1176471, 1, 0, 1,
-0.4888247, -0.1566001, -1.905569, 0.1098039, 1, 0, 1,
-0.4876623, -1.497557, -2.84133, 0.1058824, 1, 0, 1,
-0.4872184, 0.05902561, -2.101547, 0.09803922, 1, 0, 1,
-0.4848099, 0.6046654, -0.5573661, 0.09019608, 1, 0, 1,
-0.4830426, -0.4547137, -3.360337, 0.08627451, 1, 0, 1,
-0.482893, -0.8819999, -2.775578, 0.07843138, 1, 0, 1,
-0.4819947, 0.3568261, -0.6134717, 0.07450981, 1, 0, 1,
-0.479194, -0.1411494, -1.167738, 0.06666667, 1, 0, 1,
-0.4745068, 1.542218, -0.8416923, 0.0627451, 1, 0, 1,
-0.4726475, -1.052878, -1.72949, 0.05490196, 1, 0, 1,
-0.4719422, 0.327785, -1.772764, 0.05098039, 1, 0, 1,
-0.4715672, -1.200572, -2.111444, 0.04313726, 1, 0, 1,
-0.4681627, -0.9146399, -3.319539, 0.03921569, 1, 0, 1,
-0.4608327, 0.4180414, -1.676826, 0.03137255, 1, 0, 1,
-0.4555713, 0.086049, -0.5292261, 0.02745098, 1, 0, 1,
-0.4543734, -1.754074, -1.843258, 0.01960784, 1, 0, 1,
-0.4535451, -0.1874868, -2.472022, 0.01568628, 1, 0, 1,
-0.4451974, -1.088169, -3.528351, 0.007843138, 1, 0, 1,
-0.4418489, -0.08025396, -1.351577, 0.003921569, 1, 0, 1,
-0.4398211, -0.2046905, -2.452442, 0, 1, 0.003921569, 1,
-0.4354588, -0.8607875, -2.966669, 0, 1, 0.01176471, 1,
-0.4347037, 1.061113, 0.6985302, 0, 1, 0.01568628, 1,
-0.4271972, 0.5021369, 0.3174114, 0, 1, 0.02352941, 1,
-0.4262132, -1.726892, -2.438765, 0, 1, 0.02745098, 1,
-0.4259268, 1.083546, 0.428384, 0, 1, 0.03529412, 1,
-0.4257119, -1.177724, -2.990619, 0, 1, 0.03921569, 1,
-0.4245151, 1.665565, 0.4333023, 0, 1, 0.04705882, 1,
-0.4242756, -0.6246632, -2.795118, 0, 1, 0.05098039, 1,
-0.4217234, 0.730978, -1.436152, 0, 1, 0.05882353, 1,
-0.4204915, -1.140229, -1.248062, 0, 1, 0.0627451, 1,
-0.4147317, 0.5649417, -0.2885029, 0, 1, 0.07058824, 1,
-0.4090445, 0.7003568, -1.29496, 0, 1, 0.07450981, 1,
-0.405116, 0.09583013, -2.023381, 0, 1, 0.08235294, 1,
-0.4027984, 0.3917821, -0.1061798, 0, 1, 0.08627451, 1,
-0.4018457, -0.1468925, -2.607126, 0, 1, 0.09411765, 1,
-0.4016097, 3.246449, -1.230651, 0, 1, 0.1019608, 1,
-0.3997735, -0.6862378, -2.203908, 0, 1, 0.1058824, 1,
-0.3971543, 0.3223649, -1.452503, 0, 1, 0.1137255, 1,
-0.396983, 2.4765, -0.3995193, 0, 1, 0.1176471, 1,
-0.3938942, 0.01150465, -1.894843, 0, 1, 0.1254902, 1,
-0.3934412, 0.3526938, 0.5069286, 0, 1, 0.1294118, 1,
-0.3914123, 0.2892243, -0.2951313, 0, 1, 0.1372549, 1,
-0.3911024, -0.3818658, -2.67705, 0, 1, 0.1411765, 1,
-0.3839735, -0.02981679, -4.022078, 0, 1, 0.1490196, 1,
-0.3817007, 0.7385898, -0.1593108, 0, 1, 0.1529412, 1,
-0.3815303, 0.7747658, -2.310194, 0, 1, 0.1607843, 1,
-0.3758357, 0.3295033, -1.657024, 0, 1, 0.1647059, 1,
-0.3678083, 0.8958497, -0.3108906, 0, 1, 0.172549, 1,
-0.3676069, 0.1336806, -1.478943, 0, 1, 0.1764706, 1,
-0.3660521, 0.04664575, -0.7159016, 0, 1, 0.1843137, 1,
-0.3589157, -2.386708, -2.283641, 0, 1, 0.1882353, 1,
-0.3584579, 1.395089, 2.137, 0, 1, 0.1960784, 1,
-0.3570924, 1.031743, -0.1614127, 0, 1, 0.2039216, 1,
-0.3451675, 1.015991, 0.3808065, 0, 1, 0.2078431, 1,
-0.3432245, 0.9035975, 0.180481, 0, 1, 0.2156863, 1,
-0.3409458, -0.6832162, -3.146199, 0, 1, 0.2196078, 1,
-0.3403824, 1.165759, -0.209219, 0, 1, 0.227451, 1,
-0.3384563, -0.4330152, -2.255507, 0, 1, 0.2313726, 1,
-0.3376667, 0.5712299, -0.5034844, 0, 1, 0.2392157, 1,
-0.3364564, 0.7211365, 0.2238472, 0, 1, 0.2431373, 1,
-0.3358173, 1.118688, 0.4442, 0, 1, 0.2509804, 1,
-0.3313676, 1.823226, -0.3889419, 0, 1, 0.254902, 1,
-0.3254796, 0.9460625, 1.529398, 0, 1, 0.2627451, 1,
-0.318859, -0.7020324, -1.399881, 0, 1, 0.2666667, 1,
-0.3187363, -0.7107996, -1.399417, 0, 1, 0.2745098, 1,
-0.3176319, -2.694921, -3.676728, 0, 1, 0.2784314, 1,
-0.3173128, 1.336568, 1.976293, 0, 1, 0.2862745, 1,
-0.3168357, 0.1123568, -2.158256, 0, 1, 0.2901961, 1,
-0.3130575, 0.4456897, -0.2556371, 0, 1, 0.2980392, 1,
-0.3125805, 1.185601, 0.4274822, 0, 1, 0.3058824, 1,
-0.3097853, 1.92135, -2.53742, 0, 1, 0.3098039, 1,
-0.3087731, -0.5347181, -2.002663, 0, 1, 0.3176471, 1,
-0.3076559, 0.646684, 0.2887599, 0, 1, 0.3215686, 1,
-0.3076447, 1.682009, 0.8733646, 0, 1, 0.3294118, 1,
-0.3075237, -0.09843883, -2.706271, 0, 1, 0.3333333, 1,
-0.3024584, -0.2744432, -2.313126, 0, 1, 0.3411765, 1,
-0.298513, 0.4951414, -0.00517152, 0, 1, 0.345098, 1,
-0.2936618, -0.4375846, -3.52683, 0, 1, 0.3529412, 1,
-0.2927044, 1.598699, -0.5642042, 0, 1, 0.3568628, 1,
-0.2920443, -0.1185791, -0.280082, 0, 1, 0.3647059, 1,
-0.2862252, -1.001092, -3.400613, 0, 1, 0.3686275, 1,
-0.2789486, -0.342906, -3.402009, 0, 1, 0.3764706, 1,
-0.278299, 1.450094, 0.01987646, 0, 1, 0.3803922, 1,
-0.278277, 0.02558535, 0.6023295, 0, 1, 0.3882353, 1,
-0.2767636, -1.448161, -4.983953, 0, 1, 0.3921569, 1,
-0.2755138, -1.115592, -3.484719, 0, 1, 0.4, 1,
-0.275187, -0.07829069, -2.41626, 0, 1, 0.4078431, 1,
-0.2721258, 0.13335, 0.3414511, 0, 1, 0.4117647, 1,
-0.2671251, 1.034845, 0.1453261, 0, 1, 0.4196078, 1,
-0.2670068, -0.2529911, -1.067304, 0, 1, 0.4235294, 1,
-0.2616513, 0.7702571, -0.1578363, 0, 1, 0.4313726, 1,
-0.2611954, 0.8345647, 0.316546, 0, 1, 0.4352941, 1,
-0.258272, 0.09820465, -2.880999, 0, 1, 0.4431373, 1,
-0.2575779, 0.6071954, 0.4926565, 0, 1, 0.4470588, 1,
-0.2569852, -0.1359749, -2.759935, 0, 1, 0.454902, 1,
-0.2542296, -0.2519357, -0.9333765, 0, 1, 0.4588235, 1,
-0.2520273, -0.4194631, -2.1115, 0, 1, 0.4666667, 1,
-0.2517664, -0.5915525, -4.269112, 0, 1, 0.4705882, 1,
-0.2509965, 0.3786618, 0.692621, 0, 1, 0.4784314, 1,
-0.2496793, 1.54199, 1.11507, 0, 1, 0.4823529, 1,
-0.2495424, -1.615311, -3.480969, 0, 1, 0.4901961, 1,
-0.2489805, -2.448871, -2.196296, 0, 1, 0.4941176, 1,
-0.248825, 0.5504289, -0.1641599, 0, 1, 0.5019608, 1,
-0.2487779, -0.6042753, -3.624459, 0, 1, 0.509804, 1,
-0.2470372, 1.220016, -2.078141, 0, 1, 0.5137255, 1,
-0.2366733, -0.6382589, -3.809945, 0, 1, 0.5215687, 1,
-0.236538, 0.679797, 1.381951, 0, 1, 0.5254902, 1,
-0.236161, -0.08953459, -1.475176, 0, 1, 0.5333334, 1,
-0.2354077, -2.151699, -3.416715, 0, 1, 0.5372549, 1,
-0.2253505, 0.6745096, 0.02777844, 0, 1, 0.5450981, 1,
-0.2218865, 0.5737437, 1.305439, 0, 1, 0.5490196, 1,
-0.2211992, 0.5615048, -0.4240693, 0, 1, 0.5568628, 1,
-0.2135804, 2.354808, 0.05231931, 0, 1, 0.5607843, 1,
-0.2133053, 0.6743977, -1.034008, 0, 1, 0.5686275, 1,
-0.2109306, -0.8871367, -2.121976, 0, 1, 0.572549, 1,
-0.2092399, -0.9952245, -2.926732, 0, 1, 0.5803922, 1,
-0.2078649, 0.7890708, -2.115284, 0, 1, 0.5843138, 1,
-0.2065809, 0.7288723, 1.531972, 0, 1, 0.5921569, 1,
-0.2048163, -0.04396292, 1.471907, 0, 1, 0.5960785, 1,
-0.2036073, -0.07841728, -3.617766, 0, 1, 0.6039216, 1,
-0.2022212, 0.36946, -0.2285502, 0, 1, 0.6117647, 1,
-0.1920353, -0.9123224, -2.212799, 0, 1, 0.6156863, 1,
-0.1891042, 1.924204, 0.5793216, 0, 1, 0.6235294, 1,
-0.1879466, -0.8443979, -4.037313, 0, 1, 0.627451, 1,
-0.1857641, -0.5144887, -3.173142, 0, 1, 0.6352941, 1,
-0.1854217, 0.4843472, 0.7651405, 0, 1, 0.6392157, 1,
-0.1818049, -0.535267, -1.938361, 0, 1, 0.6470588, 1,
-0.1794069, 0.04118375, -2.155294, 0, 1, 0.6509804, 1,
-0.1778451, -1.479513, -3.236434, 0, 1, 0.6588235, 1,
-0.1620718, -0.6751035, -3.106315, 0, 1, 0.6627451, 1,
-0.1612583, -0.5934891, -4.176069, 0, 1, 0.6705883, 1,
-0.1598406, -0.3536196, -3.331381, 0, 1, 0.6745098, 1,
-0.1551836, -1.604239, -2.698016, 0, 1, 0.682353, 1,
-0.1547704, 1.232985, 0.6581668, 0, 1, 0.6862745, 1,
-0.1543747, 0.2994452, 2.349931, 0, 1, 0.6941177, 1,
-0.1531365, 0.05520423, -0.09400313, 0, 1, 0.7019608, 1,
-0.1525263, -0.5313262, -2.752726, 0, 1, 0.7058824, 1,
-0.1446452, -1.470748, -3.676347, 0, 1, 0.7137255, 1,
-0.1406296, 0.5496464, 0.1935026, 0, 1, 0.7176471, 1,
-0.140448, -0.2201303, -3.831432, 0, 1, 0.7254902, 1,
-0.1370235, 0.9233446, -0.1503345, 0, 1, 0.7294118, 1,
-0.1348246, 0.2034588, -0.8095928, 0, 1, 0.7372549, 1,
-0.1346049, -0.9968784, -5.362523, 0, 1, 0.7411765, 1,
-0.1333589, -1.401439, -0.9890242, 0, 1, 0.7490196, 1,
-0.1314919, -0.1643, -1.377179, 0, 1, 0.7529412, 1,
-0.1284526, 1.085392, -1.793706, 0, 1, 0.7607843, 1,
-0.1249778, 0.7786271, 0.5441467, 0, 1, 0.7647059, 1,
-0.1223449, -0.3830405, -2.535187, 0, 1, 0.772549, 1,
-0.118047, -1.118869, -3.922821, 0, 1, 0.7764706, 1,
-0.1171825, 0.479185, 0.7088873, 0, 1, 0.7843137, 1,
-0.1164405, 0.6646543, 1.858009, 0, 1, 0.7882353, 1,
-0.1129522, -0.4857984, -3.809833, 0, 1, 0.7960784, 1,
-0.1122086, 0.3567986, -0.1777729, 0, 1, 0.8039216, 1,
-0.1100527, -0.1647784, -2.352094, 0, 1, 0.8078431, 1,
-0.109852, 0.1154726, -1.195531, 0, 1, 0.8156863, 1,
-0.1083061, 0.6601779, -1.100348, 0, 1, 0.8196079, 1,
-0.1018217, -1.156063, -3.289387, 0, 1, 0.827451, 1,
-0.1013163, -0.1362465, -0.4432341, 0, 1, 0.8313726, 1,
-0.101206, -0.5099132, -4.867139, 0, 1, 0.8392157, 1,
-0.09754376, 0.9646242, 0.01179545, 0, 1, 0.8431373, 1,
-0.09269764, 1.333139, -2.222623, 0, 1, 0.8509804, 1,
-0.08897085, 0.2352619, 0.4755245, 0, 1, 0.854902, 1,
-0.08771323, 2.127772, -0.3868757, 0, 1, 0.8627451, 1,
-0.07712817, -0.6955292, -2.873914, 0, 1, 0.8666667, 1,
-0.07700264, -0.7411654, -0.8360422, 0, 1, 0.8745098, 1,
-0.07503834, 0.4266778, 0.3172544, 0, 1, 0.8784314, 1,
-0.07498553, 1.381652, 1.792229, 0, 1, 0.8862745, 1,
-0.065824, -1.005243, -2.806991, 0, 1, 0.8901961, 1,
-0.06394345, 1.099197, 0.4505343, 0, 1, 0.8980392, 1,
-0.05824848, 1.194474, -0.2461261, 0, 1, 0.9058824, 1,
-0.0575667, 1.08506, 1.258759, 0, 1, 0.9098039, 1,
-0.05586077, -0.8576092, -3.373983, 0, 1, 0.9176471, 1,
-0.05465757, 0.1854452, 0.04688592, 0, 1, 0.9215686, 1,
-0.05402359, 0.4857554, -0.3263567, 0, 1, 0.9294118, 1,
-0.0525223, 1.537086, 0.3624821, 0, 1, 0.9333333, 1,
-0.04603784, -0.4247551, -2.32997, 0, 1, 0.9411765, 1,
-0.04532719, -0.1887142, -2.055495, 0, 1, 0.945098, 1,
-0.03409366, -1.278461, -4.422779, 0, 1, 0.9529412, 1,
-0.02129511, 0.266334, -1.01353, 0, 1, 0.9568627, 1,
-0.01683849, 2.525162, -1.305499, 0, 1, 0.9647059, 1,
-0.01232765, -1.21638, -5.78877, 0, 1, 0.9686275, 1,
-0.009133062, -0.4559391, -3.757218, 0, 1, 0.9764706, 1,
-0.008968422, 0.5601984, -0.461167, 0, 1, 0.9803922, 1,
-0.008615249, 0.4039507, 0.3352705, 0, 1, 0.9882353, 1,
-0.007292381, 0.6034088, 1.177999, 0, 1, 0.9921569, 1,
-0.005882219, 1.753354, -0.1810404, 0, 1, 1, 1,
-0.005026949, 1.520858, -1.233784, 0, 0.9921569, 1, 1,
-0.00238106, 0.419496, 1.357581, 0, 0.9882353, 1, 1,
-0.001934062, -2.997334, -5.676562, 0, 0.9803922, 1, 1,
-0.001012454, -1.325643, -2.218739, 0, 0.9764706, 1, 1,
-0.0009593024, 0.08921033, 1.588725, 0, 0.9686275, 1, 1,
0.0006333459, -0.1426509, 3.794906, 0, 0.9647059, 1, 1,
0.001460606, -1.100907, 2.539811, 0, 0.9568627, 1, 1,
0.004159974, 0.09159599, 0.979652, 0, 0.9529412, 1, 1,
0.006614833, 0.03002725, -0.9762405, 0, 0.945098, 1, 1,
0.007143845, -1.271286, 2.717187, 0, 0.9411765, 1, 1,
0.009899016, 0.01774815, 0.4097745, 0, 0.9333333, 1, 1,
0.01089208, -0.3857269, 2.145428, 0, 0.9294118, 1, 1,
0.01156007, 0.2772785, 1.274056, 0, 0.9215686, 1, 1,
0.01353992, -0.3281563, 4.357573, 0, 0.9176471, 1, 1,
0.01358559, -0.4536986, 2.296512, 0, 0.9098039, 1, 1,
0.01430972, -0.3827103, 2.280466, 0, 0.9058824, 1, 1,
0.01565705, -0.1902018, 1.580925, 0, 0.8980392, 1, 1,
0.01822864, -0.6358516, 1.120283, 0, 0.8901961, 1, 1,
0.02214025, 0.2491654, 1.101634, 0, 0.8862745, 1, 1,
0.02303741, -0.1465588, 2.30565, 0, 0.8784314, 1, 1,
0.02780962, 2.33053, -0.1703124, 0, 0.8745098, 1, 1,
0.0310726, 0.4567178, -0.5254123, 0, 0.8666667, 1, 1,
0.03431891, 0.4051128, 0.5184627, 0, 0.8627451, 1, 1,
0.03588032, -1.639228, 1.830471, 0, 0.854902, 1, 1,
0.03816315, 1.441553, -0.06105029, 0, 0.8509804, 1, 1,
0.04253049, -0.3176691, 3.746652, 0, 0.8431373, 1, 1,
0.04445496, 1.24518, -1.006244, 0, 0.8392157, 1, 1,
0.04969988, 1.087895, -1.909762, 0, 0.8313726, 1, 1,
0.04999427, 0.1124446, -1.208413, 0, 0.827451, 1, 1,
0.05009328, 1.211225, 0.1821076, 0, 0.8196079, 1, 1,
0.05148282, 1.464769, -1.911993, 0, 0.8156863, 1, 1,
0.05581662, -1.624202, 2.268031, 0, 0.8078431, 1, 1,
0.05804447, -0.974743, 3.530671, 0, 0.8039216, 1, 1,
0.05812206, -0.8275271, 2.867533, 0, 0.7960784, 1, 1,
0.05864064, -0.8831232, 3.345501, 0, 0.7882353, 1, 1,
0.05917171, 2.023243, 1.148984, 0, 0.7843137, 1, 1,
0.06200568, 0.7543775, -1.118638, 0, 0.7764706, 1, 1,
0.06371847, 0.9068885, -1.937269, 0, 0.772549, 1, 1,
0.06910951, -0.7378718, 2.385799, 0, 0.7647059, 1, 1,
0.07150138, -0.372166, 6.333499, 0, 0.7607843, 1, 1,
0.07264708, 0.3597131, 0.02265512, 0, 0.7529412, 1, 1,
0.07327346, -0.1943886, 2.689404, 0, 0.7490196, 1, 1,
0.07468463, 0.3421265, -0.1939375, 0, 0.7411765, 1, 1,
0.07675604, -0.3412221, 4.393424, 0, 0.7372549, 1, 1,
0.07695565, 0.2780147, 0.05534308, 0, 0.7294118, 1, 1,
0.0809297, 0.1150667, 0.07326692, 0, 0.7254902, 1, 1,
0.08357428, -0.4703856, 2.389807, 0, 0.7176471, 1, 1,
0.08380066, 0.5532501, -0.05175683, 0, 0.7137255, 1, 1,
0.09107863, 0.780578, 0.04372947, 0, 0.7058824, 1, 1,
0.09167685, 0.1427144, 1.125756, 0, 0.6980392, 1, 1,
0.09419506, 0.6718802, 0.993101, 0, 0.6941177, 1, 1,
0.09469851, 0.8978967, -1.001495, 0, 0.6862745, 1, 1,
0.09471233, 0.2904682, 1.391962, 0, 0.682353, 1, 1,
0.09603652, -0.2862147, 4.118479, 0, 0.6745098, 1, 1,
0.09753269, -0.2161221, 2.479182, 0, 0.6705883, 1, 1,
0.09804929, 1.354324, 0.8966681, 0, 0.6627451, 1, 1,
0.0984759, 1.576902, 1.302336, 0, 0.6588235, 1, 1,
0.1003229, 0.2414854, -0.9068946, 0, 0.6509804, 1, 1,
0.1003609, 2.600996, -0.06058193, 0, 0.6470588, 1, 1,
0.1014885, 0.3567071, 0.8993729, 0, 0.6392157, 1, 1,
0.1082328, 0.2309312, -0.05413108, 0, 0.6352941, 1, 1,
0.108707, -0.6385943, 2.213269, 0, 0.627451, 1, 1,
0.1090396, 0.7315376, -1.106643, 0, 0.6235294, 1, 1,
0.1112093, -1.329639, 2.829529, 0, 0.6156863, 1, 1,
0.1159821, -0.0895326, 1.529191, 0, 0.6117647, 1, 1,
0.1188598, 0.0341877, 1.279199, 0, 0.6039216, 1, 1,
0.1234591, 0.2616212, 0.7690203, 0, 0.5960785, 1, 1,
0.1235502, 0.5438477, 1.673091, 0, 0.5921569, 1, 1,
0.1240771, -1.135838, 4.725578, 0, 0.5843138, 1, 1,
0.1268439, 1.026262, -0.3872712, 0, 0.5803922, 1, 1,
0.1298608, -0.04722133, 1.161743, 0, 0.572549, 1, 1,
0.1313482, -0.3503921, 2.606184, 0, 0.5686275, 1, 1,
0.1346998, -1.687939, 4.717995, 0, 0.5607843, 1, 1,
0.1359998, 1.914242, -0.4519961, 0, 0.5568628, 1, 1,
0.1368414, 1.647801, 1.515099, 0, 0.5490196, 1, 1,
0.1415695, 0.8867671, 0.2982951, 0, 0.5450981, 1, 1,
0.1426753, 0.2794065, -0.1272332, 0, 0.5372549, 1, 1,
0.1445569, 1.077353, 0.2403338, 0, 0.5333334, 1, 1,
0.1459538, -2.101025, 3.072485, 0, 0.5254902, 1, 1,
0.1468165, -0.1150734, 2.68041, 0, 0.5215687, 1, 1,
0.1485843, -0.7089479, 2.759602, 0, 0.5137255, 1, 1,
0.1534878, -0.5546395, 3.398473, 0, 0.509804, 1, 1,
0.1647065, -0.3648846, 2.042545, 0, 0.5019608, 1, 1,
0.1679522, -0.1922906, 1.62996, 0, 0.4941176, 1, 1,
0.1702807, -0.4764327, 1.910684, 0, 0.4901961, 1, 1,
0.1709136, -0.2864918, 4.164738, 0, 0.4823529, 1, 1,
0.1721944, 0.6915135, 1.537432, 0, 0.4784314, 1, 1,
0.1724066, 0.02791755, 1.710477, 0, 0.4705882, 1, 1,
0.1766845, -1.587674, 2.833406, 0, 0.4666667, 1, 1,
0.179954, -2.647674, 2.097112, 0, 0.4588235, 1, 1,
0.1867885, 0.2673293, 1.007535, 0, 0.454902, 1, 1,
0.1907445, -1.601021, 2.38857, 0, 0.4470588, 1, 1,
0.192218, 0.6353964, 2.030857, 0, 0.4431373, 1, 1,
0.2017149, -0.3933705, 1.457806, 0, 0.4352941, 1, 1,
0.2036228, -0.3144336, 3.770578, 0, 0.4313726, 1, 1,
0.2059453, -1.033592, 3.552706, 0, 0.4235294, 1, 1,
0.2082983, -1.396871, 1.698858, 0, 0.4196078, 1, 1,
0.2179238, -1.824922, 3.455581, 0, 0.4117647, 1, 1,
0.219094, -1.400248, 3.195576, 0, 0.4078431, 1, 1,
0.2204378, 1.040992, -0.06793333, 0, 0.4, 1, 1,
0.2258341, -0.2553043, 2.385098, 0, 0.3921569, 1, 1,
0.2266237, -2.671495, 5.055635, 0, 0.3882353, 1, 1,
0.2282733, 0.3512275, 0.3350079, 0, 0.3803922, 1, 1,
0.2316696, -0.346251, 2.702984, 0, 0.3764706, 1, 1,
0.2332399, -2.391026, 0.2721339, 0, 0.3686275, 1, 1,
0.2333387, -0.419444, 2.285607, 0, 0.3647059, 1, 1,
0.2401787, 1.657273, 0.6239687, 0, 0.3568628, 1, 1,
0.241222, -1.000873, 3.957537, 0, 0.3529412, 1, 1,
0.2441525, 0.9728681, -1.029801, 0, 0.345098, 1, 1,
0.2461825, -0.7805788, 1.941971, 0, 0.3411765, 1, 1,
0.2478587, 0.8986195, -0.7040665, 0, 0.3333333, 1, 1,
0.2495647, -0.2890065, 1.226842, 0, 0.3294118, 1, 1,
0.2509807, 0.936487, -1.534719, 0, 0.3215686, 1, 1,
0.2511944, 0.2329363, -0.3417366, 0, 0.3176471, 1, 1,
0.2523325, 0.942936, 0.3706508, 0, 0.3098039, 1, 1,
0.2590453, 1.163361, 0.2308757, 0, 0.3058824, 1, 1,
0.2610085, 1.783128, -0.3378912, 0, 0.2980392, 1, 1,
0.2692034, 0.1647824, 2.317118, 0, 0.2901961, 1, 1,
0.2765761, -0.4187374, 1.170111, 0, 0.2862745, 1, 1,
0.2791693, 0.3412398, -0.2220325, 0, 0.2784314, 1, 1,
0.2845987, -1.830127, 3.718004, 0, 0.2745098, 1, 1,
0.2860383, -0.6636575, 3.279536, 0, 0.2666667, 1, 1,
0.2871723, 0.4990536, -1.018758, 0, 0.2627451, 1, 1,
0.2900783, 0.5387747, 0.6068226, 0, 0.254902, 1, 1,
0.2904415, 0.4495189, 0.5871224, 0, 0.2509804, 1, 1,
0.2918513, -0.6485396, 2.289077, 0, 0.2431373, 1, 1,
0.2992921, -0.402475, 1.449179, 0, 0.2392157, 1, 1,
0.3003514, -1.739006, 2.191289, 0, 0.2313726, 1, 1,
0.3033185, 0.06613226, 0.5206214, 0, 0.227451, 1, 1,
0.3044191, 1.205289, 0.2152419, 0, 0.2196078, 1, 1,
0.3052216, 0.04496951, -0.4978039, 0, 0.2156863, 1, 1,
0.3055263, -0.6833786, 2.63099, 0, 0.2078431, 1, 1,
0.3062298, -0.02650901, 0.2293646, 0, 0.2039216, 1, 1,
0.3119075, 1.707996, -0.1842085, 0, 0.1960784, 1, 1,
0.3119132, -0.9118127, 2.114477, 0, 0.1882353, 1, 1,
0.3136732, 0.803916, -0.9608469, 0, 0.1843137, 1, 1,
0.3153729, 0.01007124, 1.290516, 0, 0.1764706, 1, 1,
0.3161854, -0.7536657, 1.303725, 0, 0.172549, 1, 1,
0.3174859, -0.3711665, 3.814048, 0, 0.1647059, 1, 1,
0.3184539, -0.3927594, 2.031274, 0, 0.1607843, 1, 1,
0.3189388, -0.6709991, 3.052395, 0, 0.1529412, 1, 1,
0.3284102, 0.1310977, 3.473918, 0, 0.1490196, 1, 1,
0.3323686, 0.3572192, -0.2528969, 0, 0.1411765, 1, 1,
0.3343081, -1.165304, 4.886333, 0, 0.1372549, 1, 1,
0.3358698, 0.1076188, 1.721984, 0, 0.1294118, 1, 1,
0.3372877, 2.001749, 0.3748221, 0, 0.1254902, 1, 1,
0.338962, -1.250993, 5.142352, 0, 0.1176471, 1, 1,
0.342137, 0.4095185, -0.1899307, 0, 0.1137255, 1, 1,
0.3454012, 1.803249, -0.471718, 0, 0.1058824, 1, 1,
0.3460989, -0.2646601, 1.924369, 0, 0.09803922, 1, 1,
0.3538612, 0.1894406, 0.06813033, 0, 0.09411765, 1, 1,
0.3584231, 1.434277, -1.898897, 0, 0.08627451, 1, 1,
0.3640276, -0.4617421, 2.390704, 0, 0.08235294, 1, 1,
0.3670573, 1.060455, 0.1681668, 0, 0.07450981, 1, 1,
0.3717231, 0.234083, -0.3488204, 0, 0.07058824, 1, 1,
0.3764501, 0.6958734, -0.9049749, 0, 0.0627451, 1, 1,
0.3768665, 0.5225813, 0.2640983, 0, 0.05882353, 1, 1,
0.3829068, 0.1771822, 2.680421, 0, 0.05098039, 1, 1,
0.3837333, 0.2054152, 1.043381, 0, 0.04705882, 1, 1,
0.38745, 0.4593557, 1.570434, 0, 0.03921569, 1, 1,
0.3888904, 0.5970321, 2.313519, 0, 0.03529412, 1, 1,
0.3939828, -1.198291, 2.278235, 0, 0.02745098, 1, 1,
0.3977387, -0.3670287, 2.298934, 0, 0.02352941, 1, 1,
0.4003716, -2.048296, 3.604659, 0, 0.01568628, 1, 1,
0.4015084, -1.109833, 3.193014, 0, 0.01176471, 1, 1,
0.4016946, 0.674066, 0.8883377, 0, 0.003921569, 1, 1,
0.4131076, -0.05890134, 2.084276, 0.003921569, 0, 1, 1,
0.4158438, 0.05140283, 1.397667, 0.007843138, 0, 1, 1,
0.4163793, 1.062151, 0.3449138, 0.01568628, 0, 1, 1,
0.4171481, 2.133983, 0.2542333, 0.01960784, 0, 1, 1,
0.4208154, 1.128967, 0.1265766, 0.02745098, 0, 1, 1,
0.4212717, -1.02169, 2.653094, 0.03137255, 0, 1, 1,
0.4218934, -0.4190336, 1.493991, 0.03921569, 0, 1, 1,
0.4222471, 0.5927666, 0.7031686, 0.04313726, 0, 1, 1,
0.4233761, -0.01128269, 2.944721, 0.05098039, 0, 1, 1,
0.423687, 0.2228111, 1.483876, 0.05490196, 0, 1, 1,
0.4279563, 0.8794816, -0.2617714, 0.0627451, 0, 1, 1,
0.4302955, -0.2402637, 3.068338, 0.06666667, 0, 1, 1,
0.4338243, 0.6130419, 1.951394, 0.07450981, 0, 1, 1,
0.4346928, 0.6695126, -0.6862994, 0.07843138, 0, 1, 1,
0.4477768, -1.026857, 3.31085, 0.08627451, 0, 1, 1,
0.4496456, 0.1691494, 0.5199701, 0.09019608, 0, 1, 1,
0.4499842, -0.6968044, 1.614362, 0.09803922, 0, 1, 1,
0.4517941, -0.378684, 3.271461, 0.1058824, 0, 1, 1,
0.4606916, -0.1023517, 2.171637, 0.1098039, 0, 1, 1,
0.4645078, 0.4417686, 1.146076, 0.1176471, 0, 1, 1,
0.4657699, -0.05313331, 0.9440638, 0.1215686, 0, 1, 1,
0.4713334, 0.1853195, 1.565718, 0.1294118, 0, 1, 1,
0.4719971, 0.0733174, 2.662471, 0.1333333, 0, 1, 1,
0.47425, 1.278135, -1.126034, 0.1411765, 0, 1, 1,
0.4768656, 2.061042, -0.0003187514, 0.145098, 0, 1, 1,
0.4812762, 0.173298, 0.5679491, 0.1529412, 0, 1, 1,
0.4834206, -2.205537, 2.545283, 0.1568628, 0, 1, 1,
0.4858595, 0.0051332, 2.641656, 0.1647059, 0, 1, 1,
0.488497, -0.2840192, 2.857177, 0.1686275, 0, 1, 1,
0.489698, 0.3070447, 0.9033846, 0.1764706, 0, 1, 1,
0.490316, 1.34162, -0.1065325, 0.1803922, 0, 1, 1,
0.4909286, 0.1657766, 0.3333393, 0.1882353, 0, 1, 1,
0.4926008, -0.2193759, 0.7184802, 0.1921569, 0, 1, 1,
0.4929991, -1.243331, 2.879961, 0.2, 0, 1, 1,
0.4939683, 0.4455171, 0.02512387, 0.2078431, 0, 1, 1,
0.4956367, 0.5854935, 0.8196735, 0.2117647, 0, 1, 1,
0.4956437, 1.231492, 0.2599759, 0.2196078, 0, 1, 1,
0.4971614, -1.121079, 3.768483, 0.2235294, 0, 1, 1,
0.5031657, 0.4985929, 0.1937366, 0.2313726, 0, 1, 1,
0.5051018, -0.5427321, 2.331035, 0.2352941, 0, 1, 1,
0.5131749, 0.9548333, 0.9295766, 0.2431373, 0, 1, 1,
0.517418, -1.144349, 3.803382, 0.2470588, 0, 1, 1,
0.5193648, -0.1401585, 0.9940773, 0.254902, 0, 1, 1,
0.5246277, 0.02786898, 0.6657202, 0.2588235, 0, 1, 1,
0.5259054, 1.269048, -0.7302707, 0.2666667, 0, 1, 1,
0.5295687, 1.121548, -1.130418, 0.2705882, 0, 1, 1,
0.5326357, 0.7498007, 0.5218124, 0.2784314, 0, 1, 1,
0.5344612, 0.4082849, 1.68931, 0.282353, 0, 1, 1,
0.5356594, 1.210185, 0.8621299, 0.2901961, 0, 1, 1,
0.5375135, 2.278511, 1.652207, 0.2941177, 0, 1, 1,
0.5410346, 0.1461352, 1.510713, 0.3019608, 0, 1, 1,
0.5423738, -0.6518134, 2.222147, 0.3098039, 0, 1, 1,
0.5521223, -0.5963165, 3.12359, 0.3137255, 0, 1, 1,
0.5552941, -0.8393291, 0.7818049, 0.3215686, 0, 1, 1,
0.5643886, -0.6912582, 2.11112, 0.3254902, 0, 1, 1,
0.5658298, 0.8255817, 0.6331936, 0.3333333, 0, 1, 1,
0.5713276, 1.02038, -0.3078974, 0.3372549, 0, 1, 1,
0.5760002, -0.07729322, 1.432854, 0.345098, 0, 1, 1,
0.5784052, 0.5114462, -0.4577612, 0.3490196, 0, 1, 1,
0.5853127, -1.136875, 1.518219, 0.3568628, 0, 1, 1,
0.5885107, 0.01363236, 0.9624338, 0.3607843, 0, 1, 1,
0.5924343, 0.8056115, -0.1268575, 0.3686275, 0, 1, 1,
0.596327, -0.0415623, 1.86227, 0.372549, 0, 1, 1,
0.5982682, 0.4806225, -1.405521, 0.3803922, 0, 1, 1,
0.6059144, 0.1952804, -0.0568324, 0.3843137, 0, 1, 1,
0.6075908, 0.220832, 2.434525, 0.3921569, 0, 1, 1,
0.6091111, -0.1881155, -0.1316852, 0.3960784, 0, 1, 1,
0.6121233, -1.141766, 2.017717, 0.4039216, 0, 1, 1,
0.6156843, 0.765898, 1.614617, 0.4117647, 0, 1, 1,
0.620014, 0.4947227, 1.66145, 0.4156863, 0, 1, 1,
0.6239178, 0.1381173, 3.112399, 0.4235294, 0, 1, 1,
0.6267073, 2.238085, 1.105235, 0.427451, 0, 1, 1,
0.6352763, 1.121124, -0.875266, 0.4352941, 0, 1, 1,
0.6362193, -1.0327, 0.7070223, 0.4392157, 0, 1, 1,
0.6401411, -0.3583359, 0.7988413, 0.4470588, 0, 1, 1,
0.6402152, 0.5799664, 1.735244, 0.4509804, 0, 1, 1,
0.6420204, -0.6695303, 2.156004, 0.4588235, 0, 1, 1,
0.6458668, 1.705454, -1.31263, 0.4627451, 0, 1, 1,
0.6541466, 0.7074269, 2.29379, 0.4705882, 0, 1, 1,
0.6573729, 0.4713269, 0.2824525, 0.4745098, 0, 1, 1,
0.6696784, 0.9348928, -1.483709, 0.4823529, 0, 1, 1,
0.6713135, -0.8474042, 1.2175, 0.4862745, 0, 1, 1,
0.674251, -3.139535, 2.857765, 0.4941176, 0, 1, 1,
0.6880934, -1.135855, 2.469526, 0.5019608, 0, 1, 1,
0.6964028, -0.249442, 2.162596, 0.5058824, 0, 1, 1,
0.699453, -1.051285, 0.5874742, 0.5137255, 0, 1, 1,
0.7002836, 0.336019, 2.18129, 0.5176471, 0, 1, 1,
0.7038602, -0.5517974, 3.022107, 0.5254902, 0, 1, 1,
0.7087072, -0.9064028, 2.443218, 0.5294118, 0, 1, 1,
0.7095366, -1.776883, 3.14211, 0.5372549, 0, 1, 1,
0.7109074, -1.820346, 1.18986, 0.5411765, 0, 1, 1,
0.7114556, -0.8747091, 2.701508, 0.5490196, 0, 1, 1,
0.7120008, 0.7409393, 0.09748438, 0.5529412, 0, 1, 1,
0.717299, 1.70529, 1.679568, 0.5607843, 0, 1, 1,
0.7176375, 0.5352645, 1.839635, 0.5647059, 0, 1, 1,
0.7191526, -0.477676, 4.523795, 0.572549, 0, 1, 1,
0.7210965, 1.077714, 1.689028, 0.5764706, 0, 1, 1,
0.7214535, 0.9569795, 1.214601, 0.5843138, 0, 1, 1,
0.7217034, 0.03105995, 1.288773, 0.5882353, 0, 1, 1,
0.7223608, 0.3822408, 0.1254489, 0.5960785, 0, 1, 1,
0.7235873, -0.07866769, 2.359486, 0.6039216, 0, 1, 1,
0.7235918, -0.0885582, -0.1582005, 0.6078432, 0, 1, 1,
0.7239383, -0.8514754, 1.970716, 0.6156863, 0, 1, 1,
0.7277148, 0.2137521, -0.1127147, 0.6196079, 0, 1, 1,
0.7413734, 0.4280441, 0.8181801, 0.627451, 0, 1, 1,
0.7439489, -0.4832352, 2.184319, 0.6313726, 0, 1, 1,
0.7443705, 0.9140376, 2.187513, 0.6392157, 0, 1, 1,
0.7445372, 0.8763832, 3.017267, 0.6431373, 0, 1, 1,
0.7491094, -0.3268124, 2.66282, 0.6509804, 0, 1, 1,
0.7493993, 0.2113669, 2.372962, 0.654902, 0, 1, 1,
0.7504063, 0.9872354, 0.5434933, 0.6627451, 0, 1, 1,
0.7598542, -0.1742594, 1.38694, 0.6666667, 0, 1, 1,
0.7680359, -0.0252206, 0.5859014, 0.6745098, 0, 1, 1,
0.7718427, -1.874909, 3.193685, 0.6784314, 0, 1, 1,
0.772112, 0.4400927, -0.2042266, 0.6862745, 0, 1, 1,
0.7753971, -0.9479541, 3.161687, 0.6901961, 0, 1, 1,
0.7773781, -0.9281726, 1.998022, 0.6980392, 0, 1, 1,
0.7834978, -0.7625152, 3.920964, 0.7058824, 0, 1, 1,
0.7870092, -2.305404, 1.57779, 0.7098039, 0, 1, 1,
0.78908, -0.1702939, 2.369812, 0.7176471, 0, 1, 1,
0.7911063, -0.4836158, 1.08764, 0.7215686, 0, 1, 1,
0.795073, 0.01861268, 1.700305, 0.7294118, 0, 1, 1,
0.7962214, -0.6122136, 2.026637, 0.7333333, 0, 1, 1,
0.8149036, -0.4209839, 2.943632, 0.7411765, 0, 1, 1,
0.8158335, 0.8120727, 0.3459196, 0.7450981, 0, 1, 1,
0.8241628, 0.3990786, -0.07792256, 0.7529412, 0, 1, 1,
0.8286474, 1.833823, 0.9850758, 0.7568628, 0, 1, 1,
0.8308779, 0.6001371, 0.2371616, 0.7647059, 0, 1, 1,
0.832597, -0.4194686, 1.042322, 0.7686275, 0, 1, 1,
0.8334767, -0.2689396, 4.413045, 0.7764706, 0, 1, 1,
0.8388773, 0.3497329, 2.135967, 0.7803922, 0, 1, 1,
0.8432097, -1.200184, 3.709439, 0.7882353, 0, 1, 1,
0.8453335, -1.303264, 2.609365, 0.7921569, 0, 1, 1,
0.850059, -0.5384075, 2.324687, 0.8, 0, 1, 1,
0.8570773, -0.08706327, 1.408757, 0.8078431, 0, 1, 1,
0.8589609, 0.1832314, 1.186834, 0.8117647, 0, 1, 1,
0.8603832, 1.002785, 1.339314, 0.8196079, 0, 1, 1,
0.8640602, -0.2840293, 2.632167, 0.8235294, 0, 1, 1,
0.8656408, -0.1049104, -0.8368307, 0.8313726, 0, 1, 1,
0.8688359, 0.4390514, -0.1348121, 0.8352941, 0, 1, 1,
0.8693799, 2.442792, 1.151284, 0.8431373, 0, 1, 1,
0.8722149, -0.9878417, 3.67258, 0.8470588, 0, 1, 1,
0.8735105, -1.172506, 1.854725, 0.854902, 0, 1, 1,
0.8778933, 0.3010531, 0.9195684, 0.8588235, 0, 1, 1,
0.8836166, 0.7630134, 1.988244, 0.8666667, 0, 1, 1,
0.8854554, 0.2403676, 1.588376, 0.8705882, 0, 1, 1,
0.8871472, -0.1559704, 1.24936, 0.8784314, 0, 1, 1,
0.8994159, -1.350651, 1.236652, 0.8823529, 0, 1, 1,
0.9012926, -0.61665, 3.457827, 0.8901961, 0, 1, 1,
0.9018595, 0.9464656, 1.868416, 0.8941177, 0, 1, 1,
0.9027802, -1.464844, 3.520204, 0.9019608, 0, 1, 1,
0.9051939, -0.1304057, 1.131597, 0.9098039, 0, 1, 1,
0.9176047, -0.7821001, 3.84477, 0.9137255, 0, 1, 1,
0.9184818, 0.6438105, -1.022537, 0.9215686, 0, 1, 1,
0.9187801, 1.02281, 2.146576, 0.9254902, 0, 1, 1,
0.9188436, -0.4071021, 2.078903, 0.9333333, 0, 1, 1,
0.9432767, 1.017054, 1.029708, 0.9372549, 0, 1, 1,
0.9454686, 0.1279281, 0.1963589, 0.945098, 0, 1, 1,
0.9548855, -0.454972, 2.37833, 0.9490196, 0, 1, 1,
0.9611016, -0.3430051, 1.226539, 0.9568627, 0, 1, 1,
0.9613174, 0.7067558, 1.642637, 0.9607843, 0, 1, 1,
0.9656718, 0.169313, 0.6959201, 0.9686275, 0, 1, 1,
0.9694816, -1.356433, 5.493468, 0.972549, 0, 1, 1,
0.972218, 0.6362064, 0.4994102, 0.9803922, 0, 1, 1,
0.9729781, 1.004042, -0.8207384, 0.9843137, 0, 1, 1,
0.9731744, 0.6888787, 1.403624, 0.9921569, 0, 1, 1,
0.9744672, -0.4580723, 3.172064, 0.9960784, 0, 1, 1,
0.9754612, -1.516272, 3.059046, 1, 0, 0.9960784, 1,
0.9788345, 0.2084717, 0.8709804, 1, 0, 0.9882353, 1,
0.981311, 0.924971, -0.2105609, 1, 0, 0.9843137, 1,
0.9814735, -0.3674612, 0.8613154, 1, 0, 0.9764706, 1,
0.9852265, 0.1329153, 1.146374, 1, 0, 0.972549, 1,
0.9853966, 0.863324, 1.32458, 1, 0, 0.9647059, 1,
0.9961319, -0.2940121, 0.532606, 1, 0, 0.9607843, 1,
0.9976645, 1.883339, 0.8678365, 1, 0, 0.9529412, 1,
0.9995832, -0.4936831, 0.2220088, 1, 0, 0.9490196, 1,
1.001369, 1.354145, -0.5376267, 1, 0, 0.9411765, 1,
1.011152, -0.7837788, 1.443945, 1, 0, 0.9372549, 1,
1.012027, 0.3460658, 3.238901, 1, 0, 0.9294118, 1,
1.012527, -0.5326717, 2.318572, 1, 0, 0.9254902, 1,
1.027027, 0.2204961, 1.64086, 1, 0, 0.9176471, 1,
1.028605, 1.896597, 0.5529252, 1, 0, 0.9137255, 1,
1.030692, 0.09236152, 1.39756, 1, 0, 0.9058824, 1,
1.030814, 1.369933, -0.8637889, 1, 0, 0.9019608, 1,
1.03579, -0.1274755, 0.226101, 1, 0, 0.8941177, 1,
1.03663, 0.2350186, 1.824327, 1, 0, 0.8862745, 1,
1.038241, 0.8675932, -0.04479479, 1, 0, 0.8823529, 1,
1.03913, 1.775277, 1.591857, 1, 0, 0.8745098, 1,
1.042404, 1.22657, 1.489155, 1, 0, 0.8705882, 1,
1.044675, 0.7902598, 0.8490142, 1, 0, 0.8627451, 1,
1.047518, 1.624731, 0.2272484, 1, 0, 0.8588235, 1,
1.054812, -0.03906002, 1.485664, 1, 0, 0.8509804, 1,
1.057263, 0.5412985, 2.5014, 1, 0, 0.8470588, 1,
1.069861, -0.4961379, 2.034179, 1, 0, 0.8392157, 1,
1.077267, -0.8975563, 3.847001, 1, 0, 0.8352941, 1,
1.082566, -0.9409152, 3.529636, 1, 0, 0.827451, 1,
1.082864, 0.05379795, 2.015938, 1, 0, 0.8235294, 1,
1.082932, 0.1406627, -1.571873, 1, 0, 0.8156863, 1,
1.087868, 0.4689291, 1.098884, 1, 0, 0.8117647, 1,
1.10873, 1.225933, 0.6735678, 1, 0, 0.8039216, 1,
1.109638, 1.108026, 0.9517193, 1, 0, 0.7960784, 1,
1.121733, -1.01646, 2.560089, 1, 0, 0.7921569, 1,
1.122503, 0.5174161, 1.443413, 1, 0, 0.7843137, 1,
1.126984, -0.7053951, 4.22946, 1, 0, 0.7803922, 1,
1.136033, -0.8590953, 2.282752, 1, 0, 0.772549, 1,
1.136723, 0.0180279, 1.374613, 1, 0, 0.7686275, 1,
1.150568, 0.3880219, 0.822273, 1, 0, 0.7607843, 1,
1.158326, 0.1607648, 0.2612379, 1, 0, 0.7568628, 1,
1.158912, 1.42865, 0.6985042, 1, 0, 0.7490196, 1,
1.159465, -0.7644216, 2.038158, 1, 0, 0.7450981, 1,
1.163408, 0.7901327, 2.354741, 1, 0, 0.7372549, 1,
1.164629, -1.95226, 0.8466068, 1, 0, 0.7333333, 1,
1.166005, 0.03711501, 1.102601, 1, 0, 0.7254902, 1,
1.168439, -0.704417, 2.157861, 1, 0, 0.7215686, 1,
1.171718, -0.7365799, 4.198503, 1, 0, 0.7137255, 1,
1.175765, 1.60745, 1.085304, 1, 0, 0.7098039, 1,
1.189422, -0.0665772, 2.01362, 1, 0, 0.7019608, 1,
1.194384, 0.3737032, 0.7516084, 1, 0, 0.6941177, 1,
1.206089, 0.541045, 1.116579, 1, 0, 0.6901961, 1,
1.215441, -1.320424, 1.697172, 1, 0, 0.682353, 1,
1.216168, -0.2266748, 1.792721, 1, 0, 0.6784314, 1,
1.227239, -0.5398984, 1.198793, 1, 0, 0.6705883, 1,
1.228157, -0.5669934, 0.8951425, 1, 0, 0.6666667, 1,
1.231404, -0.32867, 1.69646, 1, 0, 0.6588235, 1,
1.231862, 0.3603026, 2.046399, 1, 0, 0.654902, 1,
1.232002, 0.7984982, 0.5060414, 1, 0, 0.6470588, 1,
1.235526, -0.3635137, 3.138688, 1, 0, 0.6431373, 1,
1.240044, -0.9491786, 3.195371, 1, 0, 0.6352941, 1,
1.247645, -0.2859997, 1.72462, 1, 0, 0.6313726, 1,
1.250948, 0.8972816, 0.2509962, 1, 0, 0.6235294, 1,
1.256703, 0.04405945, 2.076068, 1, 0, 0.6196079, 1,
1.266227, -0.7752328, 2.828528, 1, 0, 0.6117647, 1,
1.274128, -0.1979909, 1.332724, 1, 0, 0.6078432, 1,
1.28185, -0.768162, 1.798055, 1, 0, 0.6, 1,
1.29633, 1.223137, -0.9334919, 1, 0, 0.5921569, 1,
1.297844, 0.2825877, 1.215762, 1, 0, 0.5882353, 1,
1.302087, -0.9777099, 2.426365, 1, 0, 0.5803922, 1,
1.319201, 1.222209, 1.391647, 1, 0, 0.5764706, 1,
1.319483, -0.7264013, 1.236568, 1, 0, 0.5686275, 1,
1.320934, -1.900802, 3.12646, 1, 0, 0.5647059, 1,
1.337702, -1.005731, 2.004052, 1, 0, 0.5568628, 1,
1.341447, 0.9105555, -0.4124178, 1, 0, 0.5529412, 1,
1.356135, 1.670668, -0.07655949, 1, 0, 0.5450981, 1,
1.359119, 0.4735183, -1.743585, 1, 0, 0.5411765, 1,
1.3607, 0.2558329, 0.9222955, 1, 0, 0.5333334, 1,
1.364906, -0.4189482, 1.510497, 1, 0, 0.5294118, 1,
1.368066, 1.544215, -0.53673, 1, 0, 0.5215687, 1,
1.368159, -0.7321914, 0.8536246, 1, 0, 0.5176471, 1,
1.373539, -1.037836, 2.963568, 1, 0, 0.509804, 1,
1.386585, -1.150421, 0.6366821, 1, 0, 0.5058824, 1,
1.386721, -0.4381046, 0.03163999, 1, 0, 0.4980392, 1,
1.390174, 1.922052, 0.8796534, 1, 0, 0.4901961, 1,
1.395266, -0.3903244, 1.350631, 1, 0, 0.4862745, 1,
1.406663, -0.8861486, 2.332064, 1, 0, 0.4784314, 1,
1.41249, 0.8455026, 2.7166, 1, 0, 0.4745098, 1,
1.41673, -1.489302, 1.739042, 1, 0, 0.4666667, 1,
1.423196, 0.1459574, 1.70202, 1, 0, 0.4627451, 1,
1.423609, -1.127405, 3.614684, 1, 0, 0.454902, 1,
1.438815, -0.7024398, 2.227668, 1, 0, 0.4509804, 1,
1.443841, -0.1257239, 2.710115, 1, 0, 0.4431373, 1,
1.455258, -0.2829785, 1.582335, 1, 0, 0.4392157, 1,
1.46177, 0.4500327, 3.753395, 1, 0, 0.4313726, 1,
1.469559, -0.5766336, 1.712709, 1, 0, 0.427451, 1,
1.481426, -1.226692, 1.15357, 1, 0, 0.4196078, 1,
1.487423, -0.9765534, 2.545441, 1, 0, 0.4156863, 1,
1.495362, -1.383063, 1.986854, 1, 0, 0.4078431, 1,
1.495713, 0.5819342, 0.6100914, 1, 0, 0.4039216, 1,
1.498179, -0.2128858, -0.1076222, 1, 0, 0.3960784, 1,
1.501248, -1.28558, 2.301457, 1, 0, 0.3882353, 1,
1.507638, 0.7696394, 2.431406, 1, 0, 0.3843137, 1,
1.508146, 0.4398026, 1.347043, 1, 0, 0.3764706, 1,
1.513838, 0.4719574, 2.567248, 1, 0, 0.372549, 1,
1.526486, 0.749086, 2.237257, 1, 0, 0.3647059, 1,
1.52934, -0.9327608, 1.240141, 1, 0, 0.3607843, 1,
1.541014, 1.679259, 1.714234, 1, 0, 0.3529412, 1,
1.541929, -0.7455086, 3.038686, 1, 0, 0.3490196, 1,
1.54264, -1.716177, 3.117536, 1, 0, 0.3411765, 1,
1.551709, -1.169519, 1.547559, 1, 0, 0.3372549, 1,
1.566811, 0.5549322, 3.858509, 1, 0, 0.3294118, 1,
1.572906, 1.544499, 1.172553, 1, 0, 0.3254902, 1,
1.581816, 0.09069112, 1.456879, 1, 0, 0.3176471, 1,
1.60328, 0.9529439, 0.02760209, 1, 0, 0.3137255, 1,
1.61153, 0.4094003, 0.9453367, 1, 0, 0.3058824, 1,
1.6291, -1.169644, 2.117054, 1, 0, 0.2980392, 1,
1.629912, 0.72887, 1.788954, 1, 0, 0.2941177, 1,
1.637881, -0.7731653, 2.299451, 1, 0, 0.2862745, 1,
1.64875, 0.03160007, 1.890185, 1, 0, 0.282353, 1,
1.649828, 0.1644351, 1.083903, 1, 0, 0.2745098, 1,
1.656805, 0.3550332, 2.592185, 1, 0, 0.2705882, 1,
1.657458, 0.2008573, 1.059392, 1, 0, 0.2627451, 1,
1.673374, 0.978155, 1.21618, 1, 0, 0.2588235, 1,
1.700611, 0.7219931, 2.621546, 1, 0, 0.2509804, 1,
1.710982, -3.130842, 0.8718277, 1, 0, 0.2470588, 1,
1.719593, -0.4046389, 2.307984, 1, 0, 0.2392157, 1,
1.758368, 0.02546133, 2.0347, 1, 0, 0.2352941, 1,
1.758536, 0.785295, 1.215793, 1, 0, 0.227451, 1,
1.760583, -1.355402, 3.542789, 1, 0, 0.2235294, 1,
1.760793, 0.4257848, 1.655458, 1, 0, 0.2156863, 1,
1.788626, 0.3097211, 0.04805544, 1, 0, 0.2117647, 1,
1.807958, 1.753417, -0.6529124, 1, 0, 0.2039216, 1,
1.827017, -3.032298, 2.105559, 1, 0, 0.1960784, 1,
1.90418, 0.5752529, 2.178286, 1, 0, 0.1921569, 1,
1.907069, 0.3203226, 2.111045, 1, 0, 0.1843137, 1,
1.913279, 0.467986, 2.793977, 1, 0, 0.1803922, 1,
1.916248, 0.4540604, 1.500339, 1, 0, 0.172549, 1,
1.92422, -0.609901, 2.218122, 1, 0, 0.1686275, 1,
1.959834, -2.805375, 1.706256, 1, 0, 0.1607843, 1,
1.986171, 0.7685132, -0.2075348, 1, 0, 0.1568628, 1,
1.98799, 0.8001691, 1.107767, 1, 0, 0.1490196, 1,
2.00211, 0.5561864, 2.242047, 1, 0, 0.145098, 1,
2.023518, 0.2518874, 3.305674, 1, 0, 0.1372549, 1,
2.041171, 1.020676, 1.933967, 1, 0, 0.1333333, 1,
2.043676, 1.822929, 1.455529, 1, 0, 0.1254902, 1,
2.051607, -2.246487, 1.982281, 1, 0, 0.1215686, 1,
2.060966, 1.332488, 2.388891, 1, 0, 0.1137255, 1,
2.073781, 1.395497, 0.9958219, 1, 0, 0.1098039, 1,
2.074175, -0.2321308, 3.16595, 1, 0, 0.1019608, 1,
2.081732, 0.1237449, 2.509052, 1, 0, 0.09411765, 1,
2.108911, -1.853079, 3.683525, 1, 0, 0.09019608, 1,
2.114496, -0.3668568, 0.8525451, 1, 0, 0.08235294, 1,
2.172692, -0.2370589, 1.274846, 1, 0, 0.07843138, 1,
2.215203, -0.6497317, 0.5494663, 1, 0, 0.07058824, 1,
2.282474, -0.7208554, 2.14584, 1, 0, 0.06666667, 1,
2.312247, -0.1904641, 1.579411, 1, 0, 0.05882353, 1,
2.349605, -0.385256, 2.802758, 1, 0, 0.05490196, 1,
2.352997, -0.3943574, 2.044642, 1, 0, 0.04705882, 1,
2.377809, 0.2573144, 2.527413, 1, 0, 0.04313726, 1,
2.400571, -1.279251, 1.329523, 1, 0, 0.03529412, 1,
2.433538, 0.6444893, 1.724757, 1, 0, 0.03137255, 1,
2.468533, -0.5420049, 2.911103, 1, 0, 0.02352941, 1,
2.572402, 0.6051085, 3.302027, 1, 0, 0.01960784, 1,
3.260866, -0.2216386, 1.050931, 1, 0, 0.01176471, 1,
3.590412, 1.154743, 1.306273, 1, 0, 0.007843138, 1
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
0.09867823, -4.221959, -7.843495, 0, -0.5, 0.5, 0.5,
0.09867823, -4.221959, -7.843495, 1, -0.5, 0.5, 0.5,
0.09867823, -4.221959, -7.843495, 1, 1.5, 0.5, 0.5,
0.09867823, -4.221959, -7.843495, 0, 1.5, 0.5, 0.5
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
-4.576754, 0.0534569, -7.843495, 0, -0.5, 0.5, 0.5,
-4.576754, 0.0534569, -7.843495, 1, -0.5, 0.5, 0.5,
-4.576754, 0.0534569, -7.843495, 1, 1.5, 0.5, 0.5,
-4.576754, 0.0534569, -7.843495, 0, 1.5, 0.5, 0.5
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
-4.576754, -4.221959, 0.2723644, 0, -0.5, 0.5, 0.5,
-4.576754, -4.221959, 0.2723644, 1, -0.5, 0.5, 0.5,
-4.576754, -4.221959, 0.2723644, 1, 1.5, 0.5, 0.5,
-4.576754, -4.221959, 0.2723644, 0, 1.5, 0.5, 0.5
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
-3, -3.235324, -5.970604,
3, -3.235324, -5.970604,
-3, -3.235324, -5.970604,
-3, -3.399764, -6.282753,
-2, -3.235324, -5.970604,
-2, -3.399764, -6.282753,
-1, -3.235324, -5.970604,
-1, -3.399764, -6.282753,
0, -3.235324, -5.970604,
0, -3.399764, -6.282753,
1, -3.235324, -5.970604,
1, -3.399764, -6.282753,
2, -3.235324, -5.970604,
2, -3.399764, -6.282753,
3, -3.235324, -5.970604,
3, -3.399764, -6.282753
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
-3, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
-3, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
-3, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
-3, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
-2, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
-2, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
-2, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
-2, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
-1, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
-1, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
-1, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
-1, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
0, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
0, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
0, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
0, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
1, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
1, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
1, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
1, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
2, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
2, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
2, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
2, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5,
3, -3.728642, -6.90705, 0, -0.5, 0.5, 0.5,
3, -3.728642, -6.90705, 1, -0.5, 0.5, 0.5,
3, -3.728642, -6.90705, 1, 1.5, 0.5, 0.5,
3, -3.728642, -6.90705, 0, 1.5, 0.5, 0.5
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
-3.497808, -3, -5.970604,
-3.497808, 3, -5.970604,
-3.497808, -3, -5.970604,
-3.677632, -3, -6.282753,
-3.497808, -2, -5.970604,
-3.677632, -2, -6.282753,
-3.497808, -1, -5.970604,
-3.677632, -1, -6.282753,
-3.497808, 0, -5.970604,
-3.677632, 0, -6.282753,
-3.497808, 1, -5.970604,
-3.677632, 1, -6.282753,
-3.497808, 2, -5.970604,
-3.677632, 2, -6.282753,
-3.497808, 3, -5.970604,
-3.677632, 3, -6.282753
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
-4.037281, -3, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, -3, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, -3, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, -3, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, -2, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, -2, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, -2, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, -2, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, -1, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, -1, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, -1, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, -1, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, 0, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, 0, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, 0, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, 0, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, 1, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, 1, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, 1, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, 1, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, 2, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, 2, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, 2, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, 2, -6.90705, 0, 1.5, 0.5, 0.5,
-4.037281, 3, -6.90705, 0, -0.5, 0.5, 0.5,
-4.037281, 3, -6.90705, 1, -0.5, 0.5, 0.5,
-4.037281, 3, -6.90705, 1, 1.5, 0.5, 0.5,
-4.037281, 3, -6.90705, 0, 1.5, 0.5, 0.5
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
-3.497808, -3.235324, -4,
-3.497808, -3.235324, 6,
-3.497808, -3.235324, -4,
-3.677632, -3.399764, -4,
-3.497808, -3.235324, -2,
-3.677632, -3.399764, -2,
-3.497808, -3.235324, 0,
-3.677632, -3.399764, 0,
-3.497808, -3.235324, 2,
-3.677632, -3.399764, 2,
-3.497808, -3.235324, 4,
-3.677632, -3.399764, 4,
-3.497808, -3.235324, 6,
-3.677632, -3.399764, 6
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
-4.037281, -3.728642, -4, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, -4, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, -4, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, -4, 0, 1.5, 0.5, 0.5,
-4.037281, -3.728642, -2, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, -2, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, -2, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, -2, 0, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 0, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 0, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 0, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 0, 0, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 2, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 2, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 2, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 2, 0, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 4, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 4, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 4, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 4, 0, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 6, 0, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 6, 1, -0.5, 0.5, 0.5,
-4.037281, -3.728642, 6, 1, 1.5, 0.5, 0.5,
-4.037281, -3.728642, 6, 0, 1.5, 0.5, 0.5
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
-3.497808, -3.235324, -5.970604,
-3.497808, 3.342238, -5.970604,
-3.497808, -3.235324, 6.515333,
-3.497808, 3.342238, 6.515333,
-3.497808, -3.235324, -5.970604,
-3.497808, -3.235324, 6.515333,
-3.497808, 3.342238, -5.970604,
-3.497808, 3.342238, 6.515333,
-3.497808, -3.235324, -5.970604,
3.695164, -3.235324, -5.970604,
-3.497808, -3.235324, 6.515333,
3.695164, -3.235324, 6.515333,
-3.497808, 3.342238, -5.970604,
3.695164, 3.342238, -5.970604,
-3.497808, 3.342238, 6.515333,
3.695164, 3.342238, 6.515333,
3.695164, -3.235324, -5.970604,
3.695164, 3.342238, -5.970604,
3.695164, -3.235324, 6.515333,
3.695164, 3.342238, 6.515333,
3.695164, -3.235324, -5.970604,
3.695164, -3.235324, 6.515333,
3.695164, 3.342238, -5.970604,
3.695164, 3.342238, 6.515333
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
var radius = 8.458188;
var distance = 37.63144;
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
mvMatrix.translate( -0.09867823, -0.0534569, -0.2723644 );
mvMatrix.scale( 1.271402, 1.390357, 0.7324367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.63144);
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
bioresmethrin<-read.table("bioresmethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bioresmethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
```

```r
y<-bioresmethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
```

```r
z<-bioresmethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
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
-3.393056, -0.02319302, -1.886271, 0, 0, 1, 1, 1,
-2.979836, -0.636326, -2.210886, 1, 0, 0, 1, 1,
-2.775062, 0.08881647, -1.26063, 1, 0, 0, 1, 1,
-2.435128, -0.4203471, -0.6491125, 1, 0, 0, 1, 1,
-2.432334, -1.168545, -3.067378, 1, 0, 0, 1, 1,
-2.385265, -1.841904, -2.666821, 1, 0, 0, 1, 1,
-2.327869, 0.6208325, 0.5334024, 0, 0, 0, 1, 1,
-2.294389, 1.604561, -1.117006, 0, 0, 0, 1, 1,
-2.270703, -0.1151423, -0.08711847, 0, 0, 0, 1, 1,
-2.244631, -0.7463224, -2.962835, 0, 0, 0, 1, 1,
-2.161212, -0.4808951, -0.694277, 0, 0, 0, 1, 1,
-2.127942, 1.913393, 0.0004835782, 0, 0, 0, 1, 1,
-2.099819, -0.1755333, -3.016154, 0, 0, 0, 1, 1,
-2.090319, 2.475961, -0.1269078, 1, 1, 1, 1, 1,
-2.081205, -0.6314401, -1.459546, 1, 1, 1, 1, 1,
-2.072255, -0.5100191, -3.600376, 1, 1, 1, 1, 1,
-2.046833, -1.373266, -1.713354, 1, 1, 1, 1, 1,
-2.036054, -0.111699, -1.408331, 1, 1, 1, 1, 1,
-2.035954, -0.6965746, -2.7033, 1, 1, 1, 1, 1,
-2.015198, -0.4135959, -2.221701, 1, 1, 1, 1, 1,
-1.97273, -1.356219, -1.15303, 1, 1, 1, 1, 1,
-1.970022, -0.3246189, -0.8677366, 1, 1, 1, 1, 1,
-1.96807, 1.410314, -1.265909, 1, 1, 1, 1, 1,
-1.965093, -1.212435, -1.903544, 1, 1, 1, 1, 1,
-1.944631, -1.118445, -2.061129, 1, 1, 1, 1, 1,
-1.937114, 0.3888558, -1.130705, 1, 1, 1, 1, 1,
-1.923756, -0.4448366, -1.15963, 1, 1, 1, 1, 1,
-1.896995, 0.07064997, -2.743246, 1, 1, 1, 1, 1,
-1.877966, -0.7863777, -4.95422, 0, 0, 1, 1, 1,
-1.844881, 0.1126828, -1.962213, 1, 0, 0, 1, 1,
-1.832539, -0.4664875, -1.377848, 1, 0, 0, 1, 1,
-1.829841, -0.6297525, -0.1547881, 1, 0, 0, 1, 1,
-1.827767, -0.9417261, -1.299598, 1, 0, 0, 1, 1,
-1.784499, 0.5745854, -1.705761, 1, 0, 0, 1, 1,
-1.780368, -0.05280419, -0.755927, 0, 0, 0, 1, 1,
-1.754453, 0.1052485, -1.197577, 0, 0, 0, 1, 1,
-1.748825, -0.6058567, -1.579564, 0, 0, 0, 1, 1,
-1.737543, -0.2054379, 0.5275, 0, 0, 0, 1, 1,
-1.730549, 1.126471, 0.2757629, 0, 0, 0, 1, 1,
-1.725189, -0.2642572, -1.403595, 0, 0, 0, 1, 1,
-1.717182, 0.6131828, -0.3170475, 0, 0, 0, 1, 1,
-1.703417, -1.491707, -2.554515, 1, 1, 1, 1, 1,
-1.701109, 0.2623227, -2.812722, 1, 1, 1, 1, 1,
-1.691472, 1.332343, -0.8338823, 1, 1, 1, 1, 1,
-1.678194, 0.7911072, -1.949931, 1, 1, 1, 1, 1,
-1.670716, -0.7126777, -2.200149, 1, 1, 1, 1, 1,
-1.658024, -0.8259474, -1.392669, 1, 1, 1, 1, 1,
-1.64649, 1.673223, -1.286139, 1, 1, 1, 1, 1,
-1.646163, -1.226699, -1.601851, 1, 1, 1, 1, 1,
-1.631428, -1.659765, -2.954208, 1, 1, 1, 1, 1,
-1.629184, 0.2048847, -1.86245, 1, 1, 1, 1, 1,
-1.625253, -0.4508438, -1.742134, 1, 1, 1, 1, 1,
-1.62515, 0.685855, -0.976714, 1, 1, 1, 1, 1,
-1.624837, 0.2810413, -1.439149, 1, 1, 1, 1, 1,
-1.591887, -1.36105, -1.826231, 1, 1, 1, 1, 1,
-1.590243, 0.2285534, -0.2322546, 1, 1, 1, 1, 1,
-1.577866, 0.6918396, -1.247116, 0, 0, 1, 1, 1,
-1.568175, -0.5484298, -1.483483, 1, 0, 0, 1, 1,
-1.555979, -0.09105083, -1.163472, 1, 0, 0, 1, 1,
-1.5245, 1.097916, -1.154685, 1, 0, 0, 1, 1,
-1.512905, 0.7253217, -0.1206448, 1, 0, 0, 1, 1,
-1.492951, 1.196048, -1.248026, 1, 0, 0, 1, 1,
-1.488742, 0.785543, -2.904556, 0, 0, 0, 1, 1,
-1.471387, -0.1727358, -0.3176379, 0, 0, 0, 1, 1,
-1.464388, 0.2163504, -1.394017, 0, 0, 0, 1, 1,
-1.449691, -0.341528, -2.738621, 0, 0, 0, 1, 1,
-1.412205, 0.5049456, -2.029926, 0, 0, 0, 1, 1,
-1.409027, -0.3672662, -1.437401, 0, 0, 0, 1, 1,
-1.404338, 0.3909053, -1.146335, 0, 0, 0, 1, 1,
-1.402193, -0.2455957, -2.212415, 1, 1, 1, 1, 1,
-1.38752, 1.117058, -0.9220049, 1, 1, 1, 1, 1,
-1.386899, 1.030308, -1.719836, 1, 1, 1, 1, 1,
-1.375112, 0.7385988, -3.035735, 1, 1, 1, 1, 1,
-1.374697, -0.04253621, -1.362077, 1, 1, 1, 1, 1,
-1.363275, -0.4258462, -2.262344, 1, 1, 1, 1, 1,
-1.353304, -0.8246407, -0.7394167, 1, 1, 1, 1, 1,
-1.349663, 0.3831365, -0.6164929, 1, 1, 1, 1, 1,
-1.336386, 0.2220032, -2.941753, 1, 1, 1, 1, 1,
-1.333692, 0.5215591, -1.300606, 1, 1, 1, 1, 1,
-1.332749, 0.29893, -3.136359, 1, 1, 1, 1, 1,
-1.324021, 1.706076, -2.010119, 1, 1, 1, 1, 1,
-1.32019, 1.367593, -1.678931, 1, 1, 1, 1, 1,
-1.317327, 0.5891111, -1.656122, 1, 1, 1, 1, 1,
-1.316723, 1.883264, 1.476173, 1, 1, 1, 1, 1,
-1.309174, 1.548252, -1.653061, 0, 0, 1, 1, 1,
-1.29871, 0.5999578, -0.8778443, 1, 0, 0, 1, 1,
-1.29816, 1.012449, 0.4262331, 1, 0, 0, 1, 1,
-1.297644, -0.2507513, -1.857622, 1, 0, 0, 1, 1,
-1.293545, 2.387583, -1.532531, 1, 0, 0, 1, 1,
-1.283696, -0.913982, -3.243876, 1, 0, 0, 1, 1,
-1.283656, 1.226747, -0.4912932, 0, 0, 0, 1, 1,
-1.271137, -0.1680023, -0.9184556, 0, 0, 0, 1, 1,
-1.270441, 1.097915, -1.518761, 0, 0, 0, 1, 1,
-1.267934, 0.4436775, 0.3979846, 0, 0, 0, 1, 1,
-1.267688, -2.347433, -2.09558, 0, 0, 0, 1, 1,
-1.263715, -0.1587503, -2.194221, 0, 0, 0, 1, 1,
-1.260864, -1.568124, -2.516433, 0, 0, 0, 1, 1,
-1.259394, 1.086487, 0.06046212, 1, 1, 1, 1, 1,
-1.25365, 0.2853701, -1.012369, 1, 1, 1, 1, 1,
-1.248059, 0.9933493, -2.34841, 1, 1, 1, 1, 1,
-1.244558, 0.8656014, -0.4906131, 1, 1, 1, 1, 1,
-1.244479, 0.4716102, -0.7514209, 1, 1, 1, 1, 1,
-1.237868, 1.219077, -0.02482656, 1, 1, 1, 1, 1,
-1.237138, 0.5052524, -1.595502, 1, 1, 1, 1, 1,
-1.22655, 2.136579, 0.01270469, 1, 1, 1, 1, 1,
-1.214406, -0.1657742, -1.948006, 1, 1, 1, 1, 1,
-1.202433, -1.069111, -2.760053, 1, 1, 1, 1, 1,
-1.194537, 0.9616547, -0.4769849, 1, 1, 1, 1, 1,
-1.189431, 2.601712, -1.162795, 1, 1, 1, 1, 1,
-1.183489, 2.341262, -0.7140619, 1, 1, 1, 1, 1,
-1.183308, -1.261868, -3.198196, 1, 1, 1, 1, 1,
-1.174214, -0.2123125, -1.73786, 1, 1, 1, 1, 1,
-1.162942, 1.247266, -1.163594, 0, 0, 1, 1, 1,
-1.157789, 0.4520214, -0.4815972, 1, 0, 0, 1, 1,
-1.157787, -1.013639, -2.880367, 1, 0, 0, 1, 1,
-1.155599, 0.169972, -1.986133, 1, 0, 0, 1, 1,
-1.138587, 0.249227, -1.647404, 1, 0, 0, 1, 1,
-1.136798, 1.352936, -1.66561, 1, 0, 0, 1, 1,
-1.136704, -0.8207291, -2.578935, 0, 0, 0, 1, 1,
-1.136702, 0.6146369, 0.7327498, 0, 0, 0, 1, 1,
-1.133772, -1.363352, -1.807424, 0, 0, 0, 1, 1,
-1.13123, 1.675663, -1.992371, 0, 0, 0, 1, 1,
-1.130157, -0.4165266, -3.685329, 0, 0, 0, 1, 1,
-1.11389, -1.368733, -2.062292, 0, 0, 0, 1, 1,
-1.106727, -0.433342, -2.166191, 0, 0, 0, 1, 1,
-1.098195, 0.3027074, -1.09357, 1, 1, 1, 1, 1,
-1.095421, 0.3657089, -1.708752, 1, 1, 1, 1, 1,
-1.094599, 1.887301, -0.8604419, 1, 1, 1, 1, 1,
-1.085392, 0.0299602, -0.5233889, 1, 1, 1, 1, 1,
-1.084935, -1.567465, -2.676642, 1, 1, 1, 1, 1,
-1.083307, -0.006446843, -1.784083, 1, 1, 1, 1, 1,
-1.081422, 0.00627053, -0.54724, 1, 1, 1, 1, 1,
-1.081308, -0.8721566, -2.294213, 1, 1, 1, 1, 1,
-1.080282, -0.1451919, -1.089465, 1, 1, 1, 1, 1,
-1.075383, 0.8039358, -2.191995, 1, 1, 1, 1, 1,
-1.072148, -0.1048594, -0.6010012, 1, 1, 1, 1, 1,
-1.071483, 0.8282803, -0.2978706, 1, 1, 1, 1, 1,
-1.070125, 0.5033714, -2.335339, 1, 1, 1, 1, 1,
-1.068259, -1.056785, -1.324561, 1, 1, 1, 1, 1,
-1.065022, 0.2086053, -2.262195, 1, 1, 1, 1, 1,
-1.064488, 2.114878, -2.118857, 0, 0, 1, 1, 1,
-1.05084, 1.21434, -1.27657, 1, 0, 0, 1, 1,
-1.043006, -0.04820713, -3.000477, 1, 0, 0, 1, 1,
-1.040913, -0.06160777, -0.2847732, 1, 0, 0, 1, 1,
-1.038946, 1.259649, 0.3078816, 1, 0, 0, 1, 1,
-1.038055, -1.20151, -2.717805, 1, 0, 0, 1, 1,
-1.035953, 0.1294332, -1.184522, 0, 0, 0, 1, 1,
-1.033504, -0.3821402, -2.367954, 0, 0, 0, 1, 1,
-1.030261, 1.324921, -1.986073, 0, 0, 0, 1, 1,
-1.025946, -0.2307341, -1.872313, 0, 0, 0, 1, 1,
-1.022875, 0.5562951, 0.1079201, 0, 0, 0, 1, 1,
-1.019442, -0.2826871, -1.19873, 0, 0, 0, 1, 1,
-1.015341, 0.3855951, -3.851693, 0, 0, 0, 1, 1,
-1.010763, 0.05480324, -0.3813752, 1, 1, 1, 1, 1,
-1.009341, -2.309493, -2.009666, 1, 1, 1, 1, 1,
-1.003128, 0.1589036, -1.171601, 1, 1, 1, 1, 1,
-0.9994164, 0.7354469, -1.191582, 1, 1, 1, 1, 1,
-0.9972423, -0.3130069, -2.784732, 1, 1, 1, 1, 1,
-0.9917237, -1.037688, -1.177515, 1, 1, 1, 1, 1,
-0.9913894, -0.7711484, -2.414575, 1, 1, 1, 1, 1,
-0.9908614, 2.306798, -0.06713194, 1, 1, 1, 1, 1,
-0.9889811, -0.1815359, -2.268208, 1, 1, 1, 1, 1,
-0.9880899, 0.2943703, -1.923374, 1, 1, 1, 1, 1,
-0.9831901, -0.1598651, -1.325308, 1, 1, 1, 1, 1,
-0.9815847, 1.227526, 0.8157244, 1, 1, 1, 1, 1,
-0.9805179, 0.9736361, -1.453303, 1, 1, 1, 1, 1,
-0.9774699, 0.6556797, -1.195253, 1, 1, 1, 1, 1,
-0.9723554, 0.3969716, -1.496962, 1, 1, 1, 1, 1,
-0.9665601, 0.5627808, 0.01714049, 0, 0, 1, 1, 1,
-0.9642338, -1.168013, -0.9384004, 1, 0, 0, 1, 1,
-0.9633124, 0.2496884, -1.74933, 1, 0, 0, 1, 1,
-0.962558, -1.197799, -3.207187, 1, 0, 0, 1, 1,
-0.9611294, -0.5327203, -3.675695, 1, 0, 0, 1, 1,
-0.9595972, 1.38155, -1.743478, 1, 0, 0, 1, 1,
-0.9455813, 0.290411, -2.379708, 0, 0, 0, 1, 1,
-0.9424098, 0.6038437, -0.4769411, 0, 0, 0, 1, 1,
-0.9397425, 0.2008239, -0.9214051, 0, 0, 0, 1, 1,
-0.9350675, 0.5972578, -0.2875897, 0, 0, 0, 1, 1,
-0.9332226, 0.7256809, 0.3634819, 0, 0, 0, 1, 1,
-0.9313834, -0.8342528, -2.976825, 0, 0, 0, 1, 1,
-0.9215773, -1.395312, -1.498693, 0, 0, 0, 1, 1,
-0.9107805, -0.002576947, -1.516339, 1, 1, 1, 1, 1,
-0.9107642, 1.098324, -2.441873, 1, 1, 1, 1, 1,
-0.9105227, 0.7107699, -0.5058189, 1, 1, 1, 1, 1,
-0.900774, -0.2215216, -2.205498, 1, 1, 1, 1, 1,
-0.8996821, 0.1781121, -1.051396, 1, 1, 1, 1, 1,
-0.8932565, -0.03987534, -2.28536, 1, 1, 1, 1, 1,
-0.8895887, 0.1713787, -2.49272, 1, 1, 1, 1, 1,
-0.8884791, 1.180409, 0.2797132, 1, 1, 1, 1, 1,
-0.8836159, -0.0455848, -1.391459, 1, 1, 1, 1, 1,
-0.8815913, -1.450255, -3.230201, 1, 1, 1, 1, 1,
-0.8803671, -2.575491, -3.575196, 1, 1, 1, 1, 1,
-0.8746442, 0.5415871, -1.611027, 1, 1, 1, 1, 1,
-0.8709939, -0.6168044, -1.712979, 1, 1, 1, 1, 1,
-0.8671955, -0.5587279, -2.430006, 1, 1, 1, 1, 1,
-0.8654418, 0.5914654, -2.230356, 1, 1, 1, 1, 1,
-0.8580495, 0.6325071, -0.6287228, 0, 0, 1, 1, 1,
-0.856248, -0.9191806, -3.582202, 1, 0, 0, 1, 1,
-0.8481851, -0.2127809, -1.869008, 1, 0, 0, 1, 1,
-0.8407139, -2.608335, -3.312243, 1, 0, 0, 1, 1,
-0.8310254, -1.744436, -1.545897, 1, 0, 0, 1, 1,
-0.8304785, 1.453183, -0.9068952, 1, 0, 0, 1, 1,
-0.8270473, 2.413364, -0.8889871, 0, 0, 0, 1, 1,
-0.8197567, 1.716719, 0.972484, 0, 0, 0, 1, 1,
-0.8140945, -0.05459515, -1.825538, 0, 0, 0, 1, 1,
-0.8137274, 0.86404, -0.6079431, 0, 0, 0, 1, 1,
-0.8073004, 2.46929, 0.1516432, 0, 0, 0, 1, 1,
-0.8035281, -1.318985, -0.9776846, 0, 0, 0, 1, 1,
-0.8033481, 0.2215026, 0.1022111, 0, 0, 0, 1, 1,
-0.8011265, -1.803376, -2.741099, 1, 1, 1, 1, 1,
-0.7980118, 1.071151, -1.027631, 1, 1, 1, 1, 1,
-0.79642, 0.6303337, -0.1055801, 1, 1, 1, 1, 1,
-0.7934731, -1.050643, -3.003813, 1, 1, 1, 1, 1,
-0.7914389, 0.05631925, -2.853384, 1, 1, 1, 1, 1,
-0.7913049, 2.195318, -1.724783, 1, 1, 1, 1, 1,
-0.7841169, 1.527174, -0.7329128, 1, 1, 1, 1, 1,
-0.782633, -2.130466, -4.266055, 1, 1, 1, 1, 1,
-0.7805608, -0.2364835, -1.01972, 1, 1, 1, 1, 1,
-0.7782602, -0.9368308, -3.221115, 1, 1, 1, 1, 1,
-0.7774498, 0.6830764, -0.005233573, 1, 1, 1, 1, 1,
-0.7763364, -0.8129768, -3.854665, 1, 1, 1, 1, 1,
-0.7756524, 0.9831649, -0.6393012, 1, 1, 1, 1, 1,
-0.7752088, 1.015833, 0.8513069, 1, 1, 1, 1, 1,
-0.7745447, 0.4247696, -1.696165, 1, 1, 1, 1, 1,
-0.7723439, -0.7877917, -2.580153, 0, 0, 1, 1, 1,
-0.7714573, 1.044988, 0.229827, 1, 0, 0, 1, 1,
-0.7698444, 1.827307, -1.321499, 1, 0, 0, 1, 1,
-0.7625252, -1.011954, -2.796793, 1, 0, 0, 1, 1,
-0.7613221, 1.840554, -0.968716, 1, 0, 0, 1, 1,
-0.7606737, -0.1925564, -0.3109924, 1, 0, 0, 1, 1,
-0.7601328, 1.419824, -1.409041, 0, 0, 0, 1, 1,
-0.7593604, -0.9860489, -1.422915, 0, 0, 0, 1, 1,
-0.7573187, -0.6020555, -1.03906, 0, 0, 0, 1, 1,
-0.7539737, -1.16436, -0.6428048, 0, 0, 0, 1, 1,
-0.747719, -1.249306, -2.803757, 0, 0, 0, 1, 1,
-0.7454662, 0.214467, -2.142837, 0, 0, 0, 1, 1,
-0.744665, 0.1868721, -1.281137, 0, 0, 0, 1, 1,
-0.7425509, 1.392344, -0.5250765, 1, 1, 1, 1, 1,
-0.7424166, -0.1282495, -3.494455, 1, 1, 1, 1, 1,
-0.7406865, 0.592459, 0.2848054, 1, 1, 1, 1, 1,
-0.739556, -1.68295, -2.8091, 1, 1, 1, 1, 1,
-0.7333429, 1.107843, -1.269049, 1, 1, 1, 1, 1,
-0.7262629, 0.7532395, -0.6198999, 1, 1, 1, 1, 1,
-0.7251018, -0.6052754, -0.9344252, 1, 1, 1, 1, 1,
-0.7185163, -1.121198, -1.668045, 1, 1, 1, 1, 1,
-0.716269, 1.207838, 1.682204, 1, 1, 1, 1, 1,
-0.715367, -0.1356842, -1.58708, 1, 1, 1, 1, 1,
-0.7101487, 0.007633083, -1.174226, 1, 1, 1, 1, 1,
-0.7055328, -0.7687818, -4.080583, 1, 1, 1, 1, 1,
-0.7018722, 1.549312, 1.084708, 1, 1, 1, 1, 1,
-0.6926128, -0.5700027, 0.1742076, 1, 1, 1, 1, 1,
-0.6925899, 0.3203183, -1.427229, 1, 1, 1, 1, 1,
-0.690722, 0.2125788, -0.2548509, 0, 0, 1, 1, 1,
-0.6859009, -2.763558, -3.566025, 1, 0, 0, 1, 1,
-0.6802856, -0.3046468, -0.8993416, 1, 0, 0, 1, 1,
-0.6791925, 0.6317266, -2.935484, 1, 0, 0, 1, 1,
-0.6726083, -2.002294, -1.273482, 1, 0, 0, 1, 1,
-0.6709671, 0.3938959, -2.495581, 1, 0, 0, 1, 1,
-0.6682417, 0.2477634, -0.695897, 0, 0, 0, 1, 1,
-0.6656862, 0.3683031, -2.43836, 0, 0, 0, 1, 1,
-0.664888, -0.03148758, -2.912069, 0, 0, 0, 1, 1,
-0.6620784, -1.54074, -0.03440759, 0, 0, 0, 1, 1,
-0.6600238, -0.4365356, -1.728082, 0, 0, 0, 1, 1,
-0.6593232, 0.6251993, -1.050663, 0, 0, 0, 1, 1,
-0.6560428, 0.5372131, 0.1100794, 0, 0, 0, 1, 1,
-0.6525829, 1.056237, -0.679193, 1, 1, 1, 1, 1,
-0.6477513, -1.682219, -3.490577, 1, 1, 1, 1, 1,
-0.6440498, -0.8499216, -1.640961, 1, 1, 1, 1, 1,
-0.6429419, -0.9577132, -2.455124, 1, 1, 1, 1, 1,
-0.6418986, -0.008629618, -2.60234, 1, 1, 1, 1, 1,
-0.6391329, -0.8926103, -1.9785, 1, 1, 1, 1, 1,
-0.6348539, 0.03261742, -3.189596, 1, 1, 1, 1, 1,
-0.6312618, 0.5586399, -0.1839506, 1, 1, 1, 1, 1,
-0.6229352, -0.8084733, -1.987349, 1, 1, 1, 1, 1,
-0.6142039, 0.3158289, -2.624145, 1, 1, 1, 1, 1,
-0.610162, -0.6446096, -0.796983, 1, 1, 1, 1, 1,
-0.6094618, -0.8137087, -2.501008, 1, 1, 1, 1, 1,
-0.6084842, 0.4230201, -2.377655, 1, 1, 1, 1, 1,
-0.6046504, -1.109054, -0.4129604, 1, 1, 1, 1, 1,
-0.6028453, 1.004245, -0.3233044, 1, 1, 1, 1, 1,
-0.6016749, 1.113088, 1.175045, 0, 0, 1, 1, 1,
-0.5979242, 0.9712332, 1.380372, 1, 0, 0, 1, 1,
-0.5977269, 0.3875223, -0.6593757, 1, 0, 0, 1, 1,
-0.596619, -1.227169, -3.074632, 1, 0, 0, 1, 1,
-0.5846224, 1.201684, -2.166402, 1, 0, 0, 1, 1,
-0.5835787, 0.7440794, -0.4458241, 1, 0, 0, 1, 1,
-0.5819162, -0.5133795, -0.9386934, 0, 0, 0, 1, 1,
-0.5790395, -1.295963, -1.973088, 0, 0, 0, 1, 1,
-0.5606211, -1.561728, -0.678753, 0, 0, 0, 1, 1,
-0.5536001, 2.320467, -1.172821, 0, 0, 0, 1, 1,
-0.5533302, 1.399873, -1.232536, 0, 0, 0, 1, 1,
-0.5525801, 0.3705933, -2.203913, 0, 0, 0, 1, 1,
-0.5501986, 0.6775674, -1.00562, 0, 0, 0, 1, 1,
-0.5466013, 1.200268, -1.190539, 1, 1, 1, 1, 1,
-0.5450139, -0.07739031, -1.772609, 1, 1, 1, 1, 1,
-0.5357604, -0.09240279, -4.162071, 1, 1, 1, 1, 1,
-0.5354562, -0.6226406, -4.731578, 1, 1, 1, 1, 1,
-0.5327988, 0.5409586, -1.256411, 1, 1, 1, 1, 1,
-0.5303722, 0.7184764, -1.745282, 1, 1, 1, 1, 1,
-0.5280057, -1.064824, -3.784508, 1, 1, 1, 1, 1,
-0.5247378, -2.160345, -3.76174, 1, 1, 1, 1, 1,
-0.523888, 0.6259933, -0.5132648, 1, 1, 1, 1, 1,
-0.5237681, 0.5881397, 0.2819754, 1, 1, 1, 1, 1,
-0.521345, 0.1493184, -1.473744, 1, 1, 1, 1, 1,
-0.5165975, 1.876008, -0.877714, 1, 1, 1, 1, 1,
-0.5162661, 1.365028, 0.2362449, 1, 1, 1, 1, 1,
-0.5152627, 1.54289, 0.1801012, 1, 1, 1, 1, 1,
-0.5060003, 0.7215564, 1.008454, 1, 1, 1, 1, 1,
-0.5042972, 0.6243083, -0.9421394, 0, 0, 1, 1, 1,
-0.5033676, -1.100653, -1.695785, 1, 0, 0, 1, 1,
-0.5006605, -0.1934269, -2.497312, 1, 0, 0, 1, 1,
-0.5002964, 0.4386911, -0.3322732, 1, 0, 0, 1, 1,
-0.4979259, -1.679312, -3.081218, 1, 0, 0, 1, 1,
-0.4971137, -0.3421867, -2.546736, 1, 0, 0, 1, 1,
-0.4929894, 0.1502642, -0.5768122, 0, 0, 0, 1, 1,
-0.4888247, -0.1566001, -1.905569, 0, 0, 0, 1, 1,
-0.4876623, -1.497557, -2.84133, 0, 0, 0, 1, 1,
-0.4872184, 0.05902561, -2.101547, 0, 0, 0, 1, 1,
-0.4848099, 0.6046654, -0.5573661, 0, 0, 0, 1, 1,
-0.4830426, -0.4547137, -3.360337, 0, 0, 0, 1, 1,
-0.482893, -0.8819999, -2.775578, 0, 0, 0, 1, 1,
-0.4819947, 0.3568261, -0.6134717, 1, 1, 1, 1, 1,
-0.479194, -0.1411494, -1.167738, 1, 1, 1, 1, 1,
-0.4745068, 1.542218, -0.8416923, 1, 1, 1, 1, 1,
-0.4726475, -1.052878, -1.72949, 1, 1, 1, 1, 1,
-0.4719422, 0.327785, -1.772764, 1, 1, 1, 1, 1,
-0.4715672, -1.200572, -2.111444, 1, 1, 1, 1, 1,
-0.4681627, -0.9146399, -3.319539, 1, 1, 1, 1, 1,
-0.4608327, 0.4180414, -1.676826, 1, 1, 1, 1, 1,
-0.4555713, 0.086049, -0.5292261, 1, 1, 1, 1, 1,
-0.4543734, -1.754074, -1.843258, 1, 1, 1, 1, 1,
-0.4535451, -0.1874868, -2.472022, 1, 1, 1, 1, 1,
-0.4451974, -1.088169, -3.528351, 1, 1, 1, 1, 1,
-0.4418489, -0.08025396, -1.351577, 1, 1, 1, 1, 1,
-0.4398211, -0.2046905, -2.452442, 1, 1, 1, 1, 1,
-0.4354588, -0.8607875, -2.966669, 1, 1, 1, 1, 1,
-0.4347037, 1.061113, 0.6985302, 0, 0, 1, 1, 1,
-0.4271972, 0.5021369, 0.3174114, 1, 0, 0, 1, 1,
-0.4262132, -1.726892, -2.438765, 1, 0, 0, 1, 1,
-0.4259268, 1.083546, 0.428384, 1, 0, 0, 1, 1,
-0.4257119, -1.177724, -2.990619, 1, 0, 0, 1, 1,
-0.4245151, 1.665565, 0.4333023, 1, 0, 0, 1, 1,
-0.4242756, -0.6246632, -2.795118, 0, 0, 0, 1, 1,
-0.4217234, 0.730978, -1.436152, 0, 0, 0, 1, 1,
-0.4204915, -1.140229, -1.248062, 0, 0, 0, 1, 1,
-0.4147317, 0.5649417, -0.2885029, 0, 0, 0, 1, 1,
-0.4090445, 0.7003568, -1.29496, 0, 0, 0, 1, 1,
-0.405116, 0.09583013, -2.023381, 0, 0, 0, 1, 1,
-0.4027984, 0.3917821, -0.1061798, 0, 0, 0, 1, 1,
-0.4018457, -0.1468925, -2.607126, 1, 1, 1, 1, 1,
-0.4016097, 3.246449, -1.230651, 1, 1, 1, 1, 1,
-0.3997735, -0.6862378, -2.203908, 1, 1, 1, 1, 1,
-0.3971543, 0.3223649, -1.452503, 1, 1, 1, 1, 1,
-0.396983, 2.4765, -0.3995193, 1, 1, 1, 1, 1,
-0.3938942, 0.01150465, -1.894843, 1, 1, 1, 1, 1,
-0.3934412, 0.3526938, 0.5069286, 1, 1, 1, 1, 1,
-0.3914123, 0.2892243, -0.2951313, 1, 1, 1, 1, 1,
-0.3911024, -0.3818658, -2.67705, 1, 1, 1, 1, 1,
-0.3839735, -0.02981679, -4.022078, 1, 1, 1, 1, 1,
-0.3817007, 0.7385898, -0.1593108, 1, 1, 1, 1, 1,
-0.3815303, 0.7747658, -2.310194, 1, 1, 1, 1, 1,
-0.3758357, 0.3295033, -1.657024, 1, 1, 1, 1, 1,
-0.3678083, 0.8958497, -0.3108906, 1, 1, 1, 1, 1,
-0.3676069, 0.1336806, -1.478943, 1, 1, 1, 1, 1,
-0.3660521, 0.04664575, -0.7159016, 0, 0, 1, 1, 1,
-0.3589157, -2.386708, -2.283641, 1, 0, 0, 1, 1,
-0.3584579, 1.395089, 2.137, 1, 0, 0, 1, 1,
-0.3570924, 1.031743, -0.1614127, 1, 0, 0, 1, 1,
-0.3451675, 1.015991, 0.3808065, 1, 0, 0, 1, 1,
-0.3432245, 0.9035975, 0.180481, 1, 0, 0, 1, 1,
-0.3409458, -0.6832162, -3.146199, 0, 0, 0, 1, 1,
-0.3403824, 1.165759, -0.209219, 0, 0, 0, 1, 1,
-0.3384563, -0.4330152, -2.255507, 0, 0, 0, 1, 1,
-0.3376667, 0.5712299, -0.5034844, 0, 0, 0, 1, 1,
-0.3364564, 0.7211365, 0.2238472, 0, 0, 0, 1, 1,
-0.3358173, 1.118688, 0.4442, 0, 0, 0, 1, 1,
-0.3313676, 1.823226, -0.3889419, 0, 0, 0, 1, 1,
-0.3254796, 0.9460625, 1.529398, 1, 1, 1, 1, 1,
-0.318859, -0.7020324, -1.399881, 1, 1, 1, 1, 1,
-0.3187363, -0.7107996, -1.399417, 1, 1, 1, 1, 1,
-0.3176319, -2.694921, -3.676728, 1, 1, 1, 1, 1,
-0.3173128, 1.336568, 1.976293, 1, 1, 1, 1, 1,
-0.3168357, 0.1123568, -2.158256, 1, 1, 1, 1, 1,
-0.3130575, 0.4456897, -0.2556371, 1, 1, 1, 1, 1,
-0.3125805, 1.185601, 0.4274822, 1, 1, 1, 1, 1,
-0.3097853, 1.92135, -2.53742, 1, 1, 1, 1, 1,
-0.3087731, -0.5347181, -2.002663, 1, 1, 1, 1, 1,
-0.3076559, 0.646684, 0.2887599, 1, 1, 1, 1, 1,
-0.3076447, 1.682009, 0.8733646, 1, 1, 1, 1, 1,
-0.3075237, -0.09843883, -2.706271, 1, 1, 1, 1, 1,
-0.3024584, -0.2744432, -2.313126, 1, 1, 1, 1, 1,
-0.298513, 0.4951414, -0.00517152, 1, 1, 1, 1, 1,
-0.2936618, -0.4375846, -3.52683, 0, 0, 1, 1, 1,
-0.2927044, 1.598699, -0.5642042, 1, 0, 0, 1, 1,
-0.2920443, -0.1185791, -0.280082, 1, 0, 0, 1, 1,
-0.2862252, -1.001092, -3.400613, 1, 0, 0, 1, 1,
-0.2789486, -0.342906, -3.402009, 1, 0, 0, 1, 1,
-0.278299, 1.450094, 0.01987646, 1, 0, 0, 1, 1,
-0.278277, 0.02558535, 0.6023295, 0, 0, 0, 1, 1,
-0.2767636, -1.448161, -4.983953, 0, 0, 0, 1, 1,
-0.2755138, -1.115592, -3.484719, 0, 0, 0, 1, 1,
-0.275187, -0.07829069, -2.41626, 0, 0, 0, 1, 1,
-0.2721258, 0.13335, 0.3414511, 0, 0, 0, 1, 1,
-0.2671251, 1.034845, 0.1453261, 0, 0, 0, 1, 1,
-0.2670068, -0.2529911, -1.067304, 0, 0, 0, 1, 1,
-0.2616513, 0.7702571, -0.1578363, 1, 1, 1, 1, 1,
-0.2611954, 0.8345647, 0.316546, 1, 1, 1, 1, 1,
-0.258272, 0.09820465, -2.880999, 1, 1, 1, 1, 1,
-0.2575779, 0.6071954, 0.4926565, 1, 1, 1, 1, 1,
-0.2569852, -0.1359749, -2.759935, 1, 1, 1, 1, 1,
-0.2542296, -0.2519357, -0.9333765, 1, 1, 1, 1, 1,
-0.2520273, -0.4194631, -2.1115, 1, 1, 1, 1, 1,
-0.2517664, -0.5915525, -4.269112, 1, 1, 1, 1, 1,
-0.2509965, 0.3786618, 0.692621, 1, 1, 1, 1, 1,
-0.2496793, 1.54199, 1.11507, 1, 1, 1, 1, 1,
-0.2495424, -1.615311, -3.480969, 1, 1, 1, 1, 1,
-0.2489805, -2.448871, -2.196296, 1, 1, 1, 1, 1,
-0.248825, 0.5504289, -0.1641599, 1, 1, 1, 1, 1,
-0.2487779, -0.6042753, -3.624459, 1, 1, 1, 1, 1,
-0.2470372, 1.220016, -2.078141, 1, 1, 1, 1, 1,
-0.2366733, -0.6382589, -3.809945, 0, 0, 1, 1, 1,
-0.236538, 0.679797, 1.381951, 1, 0, 0, 1, 1,
-0.236161, -0.08953459, -1.475176, 1, 0, 0, 1, 1,
-0.2354077, -2.151699, -3.416715, 1, 0, 0, 1, 1,
-0.2253505, 0.6745096, 0.02777844, 1, 0, 0, 1, 1,
-0.2218865, 0.5737437, 1.305439, 1, 0, 0, 1, 1,
-0.2211992, 0.5615048, -0.4240693, 0, 0, 0, 1, 1,
-0.2135804, 2.354808, 0.05231931, 0, 0, 0, 1, 1,
-0.2133053, 0.6743977, -1.034008, 0, 0, 0, 1, 1,
-0.2109306, -0.8871367, -2.121976, 0, 0, 0, 1, 1,
-0.2092399, -0.9952245, -2.926732, 0, 0, 0, 1, 1,
-0.2078649, 0.7890708, -2.115284, 0, 0, 0, 1, 1,
-0.2065809, 0.7288723, 1.531972, 0, 0, 0, 1, 1,
-0.2048163, -0.04396292, 1.471907, 1, 1, 1, 1, 1,
-0.2036073, -0.07841728, -3.617766, 1, 1, 1, 1, 1,
-0.2022212, 0.36946, -0.2285502, 1, 1, 1, 1, 1,
-0.1920353, -0.9123224, -2.212799, 1, 1, 1, 1, 1,
-0.1891042, 1.924204, 0.5793216, 1, 1, 1, 1, 1,
-0.1879466, -0.8443979, -4.037313, 1, 1, 1, 1, 1,
-0.1857641, -0.5144887, -3.173142, 1, 1, 1, 1, 1,
-0.1854217, 0.4843472, 0.7651405, 1, 1, 1, 1, 1,
-0.1818049, -0.535267, -1.938361, 1, 1, 1, 1, 1,
-0.1794069, 0.04118375, -2.155294, 1, 1, 1, 1, 1,
-0.1778451, -1.479513, -3.236434, 1, 1, 1, 1, 1,
-0.1620718, -0.6751035, -3.106315, 1, 1, 1, 1, 1,
-0.1612583, -0.5934891, -4.176069, 1, 1, 1, 1, 1,
-0.1598406, -0.3536196, -3.331381, 1, 1, 1, 1, 1,
-0.1551836, -1.604239, -2.698016, 1, 1, 1, 1, 1,
-0.1547704, 1.232985, 0.6581668, 0, 0, 1, 1, 1,
-0.1543747, 0.2994452, 2.349931, 1, 0, 0, 1, 1,
-0.1531365, 0.05520423, -0.09400313, 1, 0, 0, 1, 1,
-0.1525263, -0.5313262, -2.752726, 1, 0, 0, 1, 1,
-0.1446452, -1.470748, -3.676347, 1, 0, 0, 1, 1,
-0.1406296, 0.5496464, 0.1935026, 1, 0, 0, 1, 1,
-0.140448, -0.2201303, -3.831432, 0, 0, 0, 1, 1,
-0.1370235, 0.9233446, -0.1503345, 0, 0, 0, 1, 1,
-0.1348246, 0.2034588, -0.8095928, 0, 0, 0, 1, 1,
-0.1346049, -0.9968784, -5.362523, 0, 0, 0, 1, 1,
-0.1333589, -1.401439, -0.9890242, 0, 0, 0, 1, 1,
-0.1314919, -0.1643, -1.377179, 0, 0, 0, 1, 1,
-0.1284526, 1.085392, -1.793706, 0, 0, 0, 1, 1,
-0.1249778, 0.7786271, 0.5441467, 1, 1, 1, 1, 1,
-0.1223449, -0.3830405, -2.535187, 1, 1, 1, 1, 1,
-0.118047, -1.118869, -3.922821, 1, 1, 1, 1, 1,
-0.1171825, 0.479185, 0.7088873, 1, 1, 1, 1, 1,
-0.1164405, 0.6646543, 1.858009, 1, 1, 1, 1, 1,
-0.1129522, -0.4857984, -3.809833, 1, 1, 1, 1, 1,
-0.1122086, 0.3567986, -0.1777729, 1, 1, 1, 1, 1,
-0.1100527, -0.1647784, -2.352094, 1, 1, 1, 1, 1,
-0.109852, 0.1154726, -1.195531, 1, 1, 1, 1, 1,
-0.1083061, 0.6601779, -1.100348, 1, 1, 1, 1, 1,
-0.1018217, -1.156063, -3.289387, 1, 1, 1, 1, 1,
-0.1013163, -0.1362465, -0.4432341, 1, 1, 1, 1, 1,
-0.101206, -0.5099132, -4.867139, 1, 1, 1, 1, 1,
-0.09754376, 0.9646242, 0.01179545, 1, 1, 1, 1, 1,
-0.09269764, 1.333139, -2.222623, 1, 1, 1, 1, 1,
-0.08897085, 0.2352619, 0.4755245, 0, 0, 1, 1, 1,
-0.08771323, 2.127772, -0.3868757, 1, 0, 0, 1, 1,
-0.07712817, -0.6955292, -2.873914, 1, 0, 0, 1, 1,
-0.07700264, -0.7411654, -0.8360422, 1, 0, 0, 1, 1,
-0.07503834, 0.4266778, 0.3172544, 1, 0, 0, 1, 1,
-0.07498553, 1.381652, 1.792229, 1, 0, 0, 1, 1,
-0.065824, -1.005243, -2.806991, 0, 0, 0, 1, 1,
-0.06394345, 1.099197, 0.4505343, 0, 0, 0, 1, 1,
-0.05824848, 1.194474, -0.2461261, 0, 0, 0, 1, 1,
-0.0575667, 1.08506, 1.258759, 0, 0, 0, 1, 1,
-0.05586077, -0.8576092, -3.373983, 0, 0, 0, 1, 1,
-0.05465757, 0.1854452, 0.04688592, 0, 0, 0, 1, 1,
-0.05402359, 0.4857554, -0.3263567, 0, 0, 0, 1, 1,
-0.0525223, 1.537086, 0.3624821, 1, 1, 1, 1, 1,
-0.04603784, -0.4247551, -2.32997, 1, 1, 1, 1, 1,
-0.04532719, -0.1887142, -2.055495, 1, 1, 1, 1, 1,
-0.03409366, -1.278461, -4.422779, 1, 1, 1, 1, 1,
-0.02129511, 0.266334, -1.01353, 1, 1, 1, 1, 1,
-0.01683849, 2.525162, -1.305499, 1, 1, 1, 1, 1,
-0.01232765, -1.21638, -5.78877, 1, 1, 1, 1, 1,
-0.009133062, -0.4559391, -3.757218, 1, 1, 1, 1, 1,
-0.008968422, 0.5601984, -0.461167, 1, 1, 1, 1, 1,
-0.008615249, 0.4039507, 0.3352705, 1, 1, 1, 1, 1,
-0.007292381, 0.6034088, 1.177999, 1, 1, 1, 1, 1,
-0.005882219, 1.753354, -0.1810404, 1, 1, 1, 1, 1,
-0.005026949, 1.520858, -1.233784, 1, 1, 1, 1, 1,
-0.00238106, 0.419496, 1.357581, 1, 1, 1, 1, 1,
-0.001934062, -2.997334, -5.676562, 1, 1, 1, 1, 1,
-0.001012454, -1.325643, -2.218739, 0, 0, 1, 1, 1,
-0.0009593024, 0.08921033, 1.588725, 1, 0, 0, 1, 1,
0.0006333459, -0.1426509, 3.794906, 1, 0, 0, 1, 1,
0.001460606, -1.100907, 2.539811, 1, 0, 0, 1, 1,
0.004159974, 0.09159599, 0.979652, 1, 0, 0, 1, 1,
0.006614833, 0.03002725, -0.9762405, 1, 0, 0, 1, 1,
0.007143845, -1.271286, 2.717187, 0, 0, 0, 1, 1,
0.009899016, 0.01774815, 0.4097745, 0, 0, 0, 1, 1,
0.01089208, -0.3857269, 2.145428, 0, 0, 0, 1, 1,
0.01156007, 0.2772785, 1.274056, 0, 0, 0, 1, 1,
0.01353992, -0.3281563, 4.357573, 0, 0, 0, 1, 1,
0.01358559, -0.4536986, 2.296512, 0, 0, 0, 1, 1,
0.01430972, -0.3827103, 2.280466, 0, 0, 0, 1, 1,
0.01565705, -0.1902018, 1.580925, 1, 1, 1, 1, 1,
0.01822864, -0.6358516, 1.120283, 1, 1, 1, 1, 1,
0.02214025, 0.2491654, 1.101634, 1, 1, 1, 1, 1,
0.02303741, -0.1465588, 2.30565, 1, 1, 1, 1, 1,
0.02780962, 2.33053, -0.1703124, 1, 1, 1, 1, 1,
0.0310726, 0.4567178, -0.5254123, 1, 1, 1, 1, 1,
0.03431891, 0.4051128, 0.5184627, 1, 1, 1, 1, 1,
0.03588032, -1.639228, 1.830471, 1, 1, 1, 1, 1,
0.03816315, 1.441553, -0.06105029, 1, 1, 1, 1, 1,
0.04253049, -0.3176691, 3.746652, 1, 1, 1, 1, 1,
0.04445496, 1.24518, -1.006244, 1, 1, 1, 1, 1,
0.04969988, 1.087895, -1.909762, 1, 1, 1, 1, 1,
0.04999427, 0.1124446, -1.208413, 1, 1, 1, 1, 1,
0.05009328, 1.211225, 0.1821076, 1, 1, 1, 1, 1,
0.05148282, 1.464769, -1.911993, 1, 1, 1, 1, 1,
0.05581662, -1.624202, 2.268031, 0, 0, 1, 1, 1,
0.05804447, -0.974743, 3.530671, 1, 0, 0, 1, 1,
0.05812206, -0.8275271, 2.867533, 1, 0, 0, 1, 1,
0.05864064, -0.8831232, 3.345501, 1, 0, 0, 1, 1,
0.05917171, 2.023243, 1.148984, 1, 0, 0, 1, 1,
0.06200568, 0.7543775, -1.118638, 1, 0, 0, 1, 1,
0.06371847, 0.9068885, -1.937269, 0, 0, 0, 1, 1,
0.06910951, -0.7378718, 2.385799, 0, 0, 0, 1, 1,
0.07150138, -0.372166, 6.333499, 0, 0, 0, 1, 1,
0.07264708, 0.3597131, 0.02265512, 0, 0, 0, 1, 1,
0.07327346, -0.1943886, 2.689404, 0, 0, 0, 1, 1,
0.07468463, 0.3421265, -0.1939375, 0, 0, 0, 1, 1,
0.07675604, -0.3412221, 4.393424, 0, 0, 0, 1, 1,
0.07695565, 0.2780147, 0.05534308, 1, 1, 1, 1, 1,
0.0809297, 0.1150667, 0.07326692, 1, 1, 1, 1, 1,
0.08357428, -0.4703856, 2.389807, 1, 1, 1, 1, 1,
0.08380066, 0.5532501, -0.05175683, 1, 1, 1, 1, 1,
0.09107863, 0.780578, 0.04372947, 1, 1, 1, 1, 1,
0.09167685, 0.1427144, 1.125756, 1, 1, 1, 1, 1,
0.09419506, 0.6718802, 0.993101, 1, 1, 1, 1, 1,
0.09469851, 0.8978967, -1.001495, 1, 1, 1, 1, 1,
0.09471233, 0.2904682, 1.391962, 1, 1, 1, 1, 1,
0.09603652, -0.2862147, 4.118479, 1, 1, 1, 1, 1,
0.09753269, -0.2161221, 2.479182, 1, 1, 1, 1, 1,
0.09804929, 1.354324, 0.8966681, 1, 1, 1, 1, 1,
0.0984759, 1.576902, 1.302336, 1, 1, 1, 1, 1,
0.1003229, 0.2414854, -0.9068946, 1, 1, 1, 1, 1,
0.1003609, 2.600996, -0.06058193, 1, 1, 1, 1, 1,
0.1014885, 0.3567071, 0.8993729, 0, 0, 1, 1, 1,
0.1082328, 0.2309312, -0.05413108, 1, 0, 0, 1, 1,
0.108707, -0.6385943, 2.213269, 1, 0, 0, 1, 1,
0.1090396, 0.7315376, -1.106643, 1, 0, 0, 1, 1,
0.1112093, -1.329639, 2.829529, 1, 0, 0, 1, 1,
0.1159821, -0.0895326, 1.529191, 1, 0, 0, 1, 1,
0.1188598, 0.0341877, 1.279199, 0, 0, 0, 1, 1,
0.1234591, 0.2616212, 0.7690203, 0, 0, 0, 1, 1,
0.1235502, 0.5438477, 1.673091, 0, 0, 0, 1, 1,
0.1240771, -1.135838, 4.725578, 0, 0, 0, 1, 1,
0.1268439, 1.026262, -0.3872712, 0, 0, 0, 1, 1,
0.1298608, -0.04722133, 1.161743, 0, 0, 0, 1, 1,
0.1313482, -0.3503921, 2.606184, 0, 0, 0, 1, 1,
0.1346998, -1.687939, 4.717995, 1, 1, 1, 1, 1,
0.1359998, 1.914242, -0.4519961, 1, 1, 1, 1, 1,
0.1368414, 1.647801, 1.515099, 1, 1, 1, 1, 1,
0.1415695, 0.8867671, 0.2982951, 1, 1, 1, 1, 1,
0.1426753, 0.2794065, -0.1272332, 1, 1, 1, 1, 1,
0.1445569, 1.077353, 0.2403338, 1, 1, 1, 1, 1,
0.1459538, -2.101025, 3.072485, 1, 1, 1, 1, 1,
0.1468165, -0.1150734, 2.68041, 1, 1, 1, 1, 1,
0.1485843, -0.7089479, 2.759602, 1, 1, 1, 1, 1,
0.1534878, -0.5546395, 3.398473, 1, 1, 1, 1, 1,
0.1647065, -0.3648846, 2.042545, 1, 1, 1, 1, 1,
0.1679522, -0.1922906, 1.62996, 1, 1, 1, 1, 1,
0.1702807, -0.4764327, 1.910684, 1, 1, 1, 1, 1,
0.1709136, -0.2864918, 4.164738, 1, 1, 1, 1, 1,
0.1721944, 0.6915135, 1.537432, 1, 1, 1, 1, 1,
0.1724066, 0.02791755, 1.710477, 0, 0, 1, 1, 1,
0.1766845, -1.587674, 2.833406, 1, 0, 0, 1, 1,
0.179954, -2.647674, 2.097112, 1, 0, 0, 1, 1,
0.1867885, 0.2673293, 1.007535, 1, 0, 0, 1, 1,
0.1907445, -1.601021, 2.38857, 1, 0, 0, 1, 1,
0.192218, 0.6353964, 2.030857, 1, 0, 0, 1, 1,
0.2017149, -0.3933705, 1.457806, 0, 0, 0, 1, 1,
0.2036228, -0.3144336, 3.770578, 0, 0, 0, 1, 1,
0.2059453, -1.033592, 3.552706, 0, 0, 0, 1, 1,
0.2082983, -1.396871, 1.698858, 0, 0, 0, 1, 1,
0.2179238, -1.824922, 3.455581, 0, 0, 0, 1, 1,
0.219094, -1.400248, 3.195576, 0, 0, 0, 1, 1,
0.2204378, 1.040992, -0.06793333, 0, 0, 0, 1, 1,
0.2258341, -0.2553043, 2.385098, 1, 1, 1, 1, 1,
0.2266237, -2.671495, 5.055635, 1, 1, 1, 1, 1,
0.2282733, 0.3512275, 0.3350079, 1, 1, 1, 1, 1,
0.2316696, -0.346251, 2.702984, 1, 1, 1, 1, 1,
0.2332399, -2.391026, 0.2721339, 1, 1, 1, 1, 1,
0.2333387, -0.419444, 2.285607, 1, 1, 1, 1, 1,
0.2401787, 1.657273, 0.6239687, 1, 1, 1, 1, 1,
0.241222, -1.000873, 3.957537, 1, 1, 1, 1, 1,
0.2441525, 0.9728681, -1.029801, 1, 1, 1, 1, 1,
0.2461825, -0.7805788, 1.941971, 1, 1, 1, 1, 1,
0.2478587, 0.8986195, -0.7040665, 1, 1, 1, 1, 1,
0.2495647, -0.2890065, 1.226842, 1, 1, 1, 1, 1,
0.2509807, 0.936487, -1.534719, 1, 1, 1, 1, 1,
0.2511944, 0.2329363, -0.3417366, 1, 1, 1, 1, 1,
0.2523325, 0.942936, 0.3706508, 1, 1, 1, 1, 1,
0.2590453, 1.163361, 0.2308757, 0, 0, 1, 1, 1,
0.2610085, 1.783128, -0.3378912, 1, 0, 0, 1, 1,
0.2692034, 0.1647824, 2.317118, 1, 0, 0, 1, 1,
0.2765761, -0.4187374, 1.170111, 1, 0, 0, 1, 1,
0.2791693, 0.3412398, -0.2220325, 1, 0, 0, 1, 1,
0.2845987, -1.830127, 3.718004, 1, 0, 0, 1, 1,
0.2860383, -0.6636575, 3.279536, 0, 0, 0, 1, 1,
0.2871723, 0.4990536, -1.018758, 0, 0, 0, 1, 1,
0.2900783, 0.5387747, 0.6068226, 0, 0, 0, 1, 1,
0.2904415, 0.4495189, 0.5871224, 0, 0, 0, 1, 1,
0.2918513, -0.6485396, 2.289077, 0, 0, 0, 1, 1,
0.2992921, -0.402475, 1.449179, 0, 0, 0, 1, 1,
0.3003514, -1.739006, 2.191289, 0, 0, 0, 1, 1,
0.3033185, 0.06613226, 0.5206214, 1, 1, 1, 1, 1,
0.3044191, 1.205289, 0.2152419, 1, 1, 1, 1, 1,
0.3052216, 0.04496951, -0.4978039, 1, 1, 1, 1, 1,
0.3055263, -0.6833786, 2.63099, 1, 1, 1, 1, 1,
0.3062298, -0.02650901, 0.2293646, 1, 1, 1, 1, 1,
0.3119075, 1.707996, -0.1842085, 1, 1, 1, 1, 1,
0.3119132, -0.9118127, 2.114477, 1, 1, 1, 1, 1,
0.3136732, 0.803916, -0.9608469, 1, 1, 1, 1, 1,
0.3153729, 0.01007124, 1.290516, 1, 1, 1, 1, 1,
0.3161854, -0.7536657, 1.303725, 1, 1, 1, 1, 1,
0.3174859, -0.3711665, 3.814048, 1, 1, 1, 1, 1,
0.3184539, -0.3927594, 2.031274, 1, 1, 1, 1, 1,
0.3189388, -0.6709991, 3.052395, 1, 1, 1, 1, 1,
0.3284102, 0.1310977, 3.473918, 1, 1, 1, 1, 1,
0.3323686, 0.3572192, -0.2528969, 1, 1, 1, 1, 1,
0.3343081, -1.165304, 4.886333, 0, 0, 1, 1, 1,
0.3358698, 0.1076188, 1.721984, 1, 0, 0, 1, 1,
0.3372877, 2.001749, 0.3748221, 1, 0, 0, 1, 1,
0.338962, -1.250993, 5.142352, 1, 0, 0, 1, 1,
0.342137, 0.4095185, -0.1899307, 1, 0, 0, 1, 1,
0.3454012, 1.803249, -0.471718, 1, 0, 0, 1, 1,
0.3460989, -0.2646601, 1.924369, 0, 0, 0, 1, 1,
0.3538612, 0.1894406, 0.06813033, 0, 0, 0, 1, 1,
0.3584231, 1.434277, -1.898897, 0, 0, 0, 1, 1,
0.3640276, -0.4617421, 2.390704, 0, 0, 0, 1, 1,
0.3670573, 1.060455, 0.1681668, 0, 0, 0, 1, 1,
0.3717231, 0.234083, -0.3488204, 0, 0, 0, 1, 1,
0.3764501, 0.6958734, -0.9049749, 0, 0, 0, 1, 1,
0.3768665, 0.5225813, 0.2640983, 1, 1, 1, 1, 1,
0.3829068, 0.1771822, 2.680421, 1, 1, 1, 1, 1,
0.3837333, 0.2054152, 1.043381, 1, 1, 1, 1, 1,
0.38745, 0.4593557, 1.570434, 1, 1, 1, 1, 1,
0.3888904, 0.5970321, 2.313519, 1, 1, 1, 1, 1,
0.3939828, -1.198291, 2.278235, 1, 1, 1, 1, 1,
0.3977387, -0.3670287, 2.298934, 1, 1, 1, 1, 1,
0.4003716, -2.048296, 3.604659, 1, 1, 1, 1, 1,
0.4015084, -1.109833, 3.193014, 1, 1, 1, 1, 1,
0.4016946, 0.674066, 0.8883377, 1, 1, 1, 1, 1,
0.4131076, -0.05890134, 2.084276, 1, 1, 1, 1, 1,
0.4158438, 0.05140283, 1.397667, 1, 1, 1, 1, 1,
0.4163793, 1.062151, 0.3449138, 1, 1, 1, 1, 1,
0.4171481, 2.133983, 0.2542333, 1, 1, 1, 1, 1,
0.4208154, 1.128967, 0.1265766, 1, 1, 1, 1, 1,
0.4212717, -1.02169, 2.653094, 0, 0, 1, 1, 1,
0.4218934, -0.4190336, 1.493991, 1, 0, 0, 1, 1,
0.4222471, 0.5927666, 0.7031686, 1, 0, 0, 1, 1,
0.4233761, -0.01128269, 2.944721, 1, 0, 0, 1, 1,
0.423687, 0.2228111, 1.483876, 1, 0, 0, 1, 1,
0.4279563, 0.8794816, -0.2617714, 1, 0, 0, 1, 1,
0.4302955, -0.2402637, 3.068338, 0, 0, 0, 1, 1,
0.4338243, 0.6130419, 1.951394, 0, 0, 0, 1, 1,
0.4346928, 0.6695126, -0.6862994, 0, 0, 0, 1, 1,
0.4477768, -1.026857, 3.31085, 0, 0, 0, 1, 1,
0.4496456, 0.1691494, 0.5199701, 0, 0, 0, 1, 1,
0.4499842, -0.6968044, 1.614362, 0, 0, 0, 1, 1,
0.4517941, -0.378684, 3.271461, 0, 0, 0, 1, 1,
0.4606916, -0.1023517, 2.171637, 1, 1, 1, 1, 1,
0.4645078, 0.4417686, 1.146076, 1, 1, 1, 1, 1,
0.4657699, -0.05313331, 0.9440638, 1, 1, 1, 1, 1,
0.4713334, 0.1853195, 1.565718, 1, 1, 1, 1, 1,
0.4719971, 0.0733174, 2.662471, 1, 1, 1, 1, 1,
0.47425, 1.278135, -1.126034, 1, 1, 1, 1, 1,
0.4768656, 2.061042, -0.0003187514, 1, 1, 1, 1, 1,
0.4812762, 0.173298, 0.5679491, 1, 1, 1, 1, 1,
0.4834206, -2.205537, 2.545283, 1, 1, 1, 1, 1,
0.4858595, 0.0051332, 2.641656, 1, 1, 1, 1, 1,
0.488497, -0.2840192, 2.857177, 1, 1, 1, 1, 1,
0.489698, 0.3070447, 0.9033846, 1, 1, 1, 1, 1,
0.490316, 1.34162, -0.1065325, 1, 1, 1, 1, 1,
0.4909286, 0.1657766, 0.3333393, 1, 1, 1, 1, 1,
0.4926008, -0.2193759, 0.7184802, 1, 1, 1, 1, 1,
0.4929991, -1.243331, 2.879961, 0, 0, 1, 1, 1,
0.4939683, 0.4455171, 0.02512387, 1, 0, 0, 1, 1,
0.4956367, 0.5854935, 0.8196735, 1, 0, 0, 1, 1,
0.4956437, 1.231492, 0.2599759, 1, 0, 0, 1, 1,
0.4971614, -1.121079, 3.768483, 1, 0, 0, 1, 1,
0.5031657, 0.4985929, 0.1937366, 1, 0, 0, 1, 1,
0.5051018, -0.5427321, 2.331035, 0, 0, 0, 1, 1,
0.5131749, 0.9548333, 0.9295766, 0, 0, 0, 1, 1,
0.517418, -1.144349, 3.803382, 0, 0, 0, 1, 1,
0.5193648, -0.1401585, 0.9940773, 0, 0, 0, 1, 1,
0.5246277, 0.02786898, 0.6657202, 0, 0, 0, 1, 1,
0.5259054, 1.269048, -0.7302707, 0, 0, 0, 1, 1,
0.5295687, 1.121548, -1.130418, 0, 0, 0, 1, 1,
0.5326357, 0.7498007, 0.5218124, 1, 1, 1, 1, 1,
0.5344612, 0.4082849, 1.68931, 1, 1, 1, 1, 1,
0.5356594, 1.210185, 0.8621299, 1, 1, 1, 1, 1,
0.5375135, 2.278511, 1.652207, 1, 1, 1, 1, 1,
0.5410346, 0.1461352, 1.510713, 1, 1, 1, 1, 1,
0.5423738, -0.6518134, 2.222147, 1, 1, 1, 1, 1,
0.5521223, -0.5963165, 3.12359, 1, 1, 1, 1, 1,
0.5552941, -0.8393291, 0.7818049, 1, 1, 1, 1, 1,
0.5643886, -0.6912582, 2.11112, 1, 1, 1, 1, 1,
0.5658298, 0.8255817, 0.6331936, 1, 1, 1, 1, 1,
0.5713276, 1.02038, -0.3078974, 1, 1, 1, 1, 1,
0.5760002, -0.07729322, 1.432854, 1, 1, 1, 1, 1,
0.5784052, 0.5114462, -0.4577612, 1, 1, 1, 1, 1,
0.5853127, -1.136875, 1.518219, 1, 1, 1, 1, 1,
0.5885107, 0.01363236, 0.9624338, 1, 1, 1, 1, 1,
0.5924343, 0.8056115, -0.1268575, 0, 0, 1, 1, 1,
0.596327, -0.0415623, 1.86227, 1, 0, 0, 1, 1,
0.5982682, 0.4806225, -1.405521, 1, 0, 0, 1, 1,
0.6059144, 0.1952804, -0.0568324, 1, 0, 0, 1, 1,
0.6075908, 0.220832, 2.434525, 1, 0, 0, 1, 1,
0.6091111, -0.1881155, -0.1316852, 1, 0, 0, 1, 1,
0.6121233, -1.141766, 2.017717, 0, 0, 0, 1, 1,
0.6156843, 0.765898, 1.614617, 0, 0, 0, 1, 1,
0.620014, 0.4947227, 1.66145, 0, 0, 0, 1, 1,
0.6239178, 0.1381173, 3.112399, 0, 0, 0, 1, 1,
0.6267073, 2.238085, 1.105235, 0, 0, 0, 1, 1,
0.6352763, 1.121124, -0.875266, 0, 0, 0, 1, 1,
0.6362193, -1.0327, 0.7070223, 0, 0, 0, 1, 1,
0.6401411, -0.3583359, 0.7988413, 1, 1, 1, 1, 1,
0.6402152, 0.5799664, 1.735244, 1, 1, 1, 1, 1,
0.6420204, -0.6695303, 2.156004, 1, 1, 1, 1, 1,
0.6458668, 1.705454, -1.31263, 1, 1, 1, 1, 1,
0.6541466, 0.7074269, 2.29379, 1, 1, 1, 1, 1,
0.6573729, 0.4713269, 0.2824525, 1, 1, 1, 1, 1,
0.6696784, 0.9348928, -1.483709, 1, 1, 1, 1, 1,
0.6713135, -0.8474042, 1.2175, 1, 1, 1, 1, 1,
0.674251, -3.139535, 2.857765, 1, 1, 1, 1, 1,
0.6880934, -1.135855, 2.469526, 1, 1, 1, 1, 1,
0.6964028, -0.249442, 2.162596, 1, 1, 1, 1, 1,
0.699453, -1.051285, 0.5874742, 1, 1, 1, 1, 1,
0.7002836, 0.336019, 2.18129, 1, 1, 1, 1, 1,
0.7038602, -0.5517974, 3.022107, 1, 1, 1, 1, 1,
0.7087072, -0.9064028, 2.443218, 1, 1, 1, 1, 1,
0.7095366, -1.776883, 3.14211, 0, 0, 1, 1, 1,
0.7109074, -1.820346, 1.18986, 1, 0, 0, 1, 1,
0.7114556, -0.8747091, 2.701508, 1, 0, 0, 1, 1,
0.7120008, 0.7409393, 0.09748438, 1, 0, 0, 1, 1,
0.717299, 1.70529, 1.679568, 1, 0, 0, 1, 1,
0.7176375, 0.5352645, 1.839635, 1, 0, 0, 1, 1,
0.7191526, -0.477676, 4.523795, 0, 0, 0, 1, 1,
0.7210965, 1.077714, 1.689028, 0, 0, 0, 1, 1,
0.7214535, 0.9569795, 1.214601, 0, 0, 0, 1, 1,
0.7217034, 0.03105995, 1.288773, 0, 0, 0, 1, 1,
0.7223608, 0.3822408, 0.1254489, 0, 0, 0, 1, 1,
0.7235873, -0.07866769, 2.359486, 0, 0, 0, 1, 1,
0.7235918, -0.0885582, -0.1582005, 0, 0, 0, 1, 1,
0.7239383, -0.8514754, 1.970716, 1, 1, 1, 1, 1,
0.7277148, 0.2137521, -0.1127147, 1, 1, 1, 1, 1,
0.7413734, 0.4280441, 0.8181801, 1, 1, 1, 1, 1,
0.7439489, -0.4832352, 2.184319, 1, 1, 1, 1, 1,
0.7443705, 0.9140376, 2.187513, 1, 1, 1, 1, 1,
0.7445372, 0.8763832, 3.017267, 1, 1, 1, 1, 1,
0.7491094, -0.3268124, 2.66282, 1, 1, 1, 1, 1,
0.7493993, 0.2113669, 2.372962, 1, 1, 1, 1, 1,
0.7504063, 0.9872354, 0.5434933, 1, 1, 1, 1, 1,
0.7598542, -0.1742594, 1.38694, 1, 1, 1, 1, 1,
0.7680359, -0.0252206, 0.5859014, 1, 1, 1, 1, 1,
0.7718427, -1.874909, 3.193685, 1, 1, 1, 1, 1,
0.772112, 0.4400927, -0.2042266, 1, 1, 1, 1, 1,
0.7753971, -0.9479541, 3.161687, 1, 1, 1, 1, 1,
0.7773781, -0.9281726, 1.998022, 1, 1, 1, 1, 1,
0.7834978, -0.7625152, 3.920964, 0, 0, 1, 1, 1,
0.7870092, -2.305404, 1.57779, 1, 0, 0, 1, 1,
0.78908, -0.1702939, 2.369812, 1, 0, 0, 1, 1,
0.7911063, -0.4836158, 1.08764, 1, 0, 0, 1, 1,
0.795073, 0.01861268, 1.700305, 1, 0, 0, 1, 1,
0.7962214, -0.6122136, 2.026637, 1, 0, 0, 1, 1,
0.8149036, -0.4209839, 2.943632, 0, 0, 0, 1, 1,
0.8158335, 0.8120727, 0.3459196, 0, 0, 0, 1, 1,
0.8241628, 0.3990786, -0.07792256, 0, 0, 0, 1, 1,
0.8286474, 1.833823, 0.9850758, 0, 0, 0, 1, 1,
0.8308779, 0.6001371, 0.2371616, 0, 0, 0, 1, 1,
0.832597, -0.4194686, 1.042322, 0, 0, 0, 1, 1,
0.8334767, -0.2689396, 4.413045, 0, 0, 0, 1, 1,
0.8388773, 0.3497329, 2.135967, 1, 1, 1, 1, 1,
0.8432097, -1.200184, 3.709439, 1, 1, 1, 1, 1,
0.8453335, -1.303264, 2.609365, 1, 1, 1, 1, 1,
0.850059, -0.5384075, 2.324687, 1, 1, 1, 1, 1,
0.8570773, -0.08706327, 1.408757, 1, 1, 1, 1, 1,
0.8589609, 0.1832314, 1.186834, 1, 1, 1, 1, 1,
0.8603832, 1.002785, 1.339314, 1, 1, 1, 1, 1,
0.8640602, -0.2840293, 2.632167, 1, 1, 1, 1, 1,
0.8656408, -0.1049104, -0.8368307, 1, 1, 1, 1, 1,
0.8688359, 0.4390514, -0.1348121, 1, 1, 1, 1, 1,
0.8693799, 2.442792, 1.151284, 1, 1, 1, 1, 1,
0.8722149, -0.9878417, 3.67258, 1, 1, 1, 1, 1,
0.8735105, -1.172506, 1.854725, 1, 1, 1, 1, 1,
0.8778933, 0.3010531, 0.9195684, 1, 1, 1, 1, 1,
0.8836166, 0.7630134, 1.988244, 1, 1, 1, 1, 1,
0.8854554, 0.2403676, 1.588376, 0, 0, 1, 1, 1,
0.8871472, -0.1559704, 1.24936, 1, 0, 0, 1, 1,
0.8994159, -1.350651, 1.236652, 1, 0, 0, 1, 1,
0.9012926, -0.61665, 3.457827, 1, 0, 0, 1, 1,
0.9018595, 0.9464656, 1.868416, 1, 0, 0, 1, 1,
0.9027802, -1.464844, 3.520204, 1, 0, 0, 1, 1,
0.9051939, -0.1304057, 1.131597, 0, 0, 0, 1, 1,
0.9176047, -0.7821001, 3.84477, 0, 0, 0, 1, 1,
0.9184818, 0.6438105, -1.022537, 0, 0, 0, 1, 1,
0.9187801, 1.02281, 2.146576, 0, 0, 0, 1, 1,
0.9188436, -0.4071021, 2.078903, 0, 0, 0, 1, 1,
0.9432767, 1.017054, 1.029708, 0, 0, 0, 1, 1,
0.9454686, 0.1279281, 0.1963589, 0, 0, 0, 1, 1,
0.9548855, -0.454972, 2.37833, 1, 1, 1, 1, 1,
0.9611016, -0.3430051, 1.226539, 1, 1, 1, 1, 1,
0.9613174, 0.7067558, 1.642637, 1, 1, 1, 1, 1,
0.9656718, 0.169313, 0.6959201, 1, 1, 1, 1, 1,
0.9694816, -1.356433, 5.493468, 1, 1, 1, 1, 1,
0.972218, 0.6362064, 0.4994102, 1, 1, 1, 1, 1,
0.9729781, 1.004042, -0.8207384, 1, 1, 1, 1, 1,
0.9731744, 0.6888787, 1.403624, 1, 1, 1, 1, 1,
0.9744672, -0.4580723, 3.172064, 1, 1, 1, 1, 1,
0.9754612, -1.516272, 3.059046, 1, 1, 1, 1, 1,
0.9788345, 0.2084717, 0.8709804, 1, 1, 1, 1, 1,
0.981311, 0.924971, -0.2105609, 1, 1, 1, 1, 1,
0.9814735, -0.3674612, 0.8613154, 1, 1, 1, 1, 1,
0.9852265, 0.1329153, 1.146374, 1, 1, 1, 1, 1,
0.9853966, 0.863324, 1.32458, 1, 1, 1, 1, 1,
0.9961319, -0.2940121, 0.532606, 0, 0, 1, 1, 1,
0.9976645, 1.883339, 0.8678365, 1, 0, 0, 1, 1,
0.9995832, -0.4936831, 0.2220088, 1, 0, 0, 1, 1,
1.001369, 1.354145, -0.5376267, 1, 0, 0, 1, 1,
1.011152, -0.7837788, 1.443945, 1, 0, 0, 1, 1,
1.012027, 0.3460658, 3.238901, 1, 0, 0, 1, 1,
1.012527, -0.5326717, 2.318572, 0, 0, 0, 1, 1,
1.027027, 0.2204961, 1.64086, 0, 0, 0, 1, 1,
1.028605, 1.896597, 0.5529252, 0, 0, 0, 1, 1,
1.030692, 0.09236152, 1.39756, 0, 0, 0, 1, 1,
1.030814, 1.369933, -0.8637889, 0, 0, 0, 1, 1,
1.03579, -0.1274755, 0.226101, 0, 0, 0, 1, 1,
1.03663, 0.2350186, 1.824327, 0, 0, 0, 1, 1,
1.038241, 0.8675932, -0.04479479, 1, 1, 1, 1, 1,
1.03913, 1.775277, 1.591857, 1, 1, 1, 1, 1,
1.042404, 1.22657, 1.489155, 1, 1, 1, 1, 1,
1.044675, 0.7902598, 0.8490142, 1, 1, 1, 1, 1,
1.047518, 1.624731, 0.2272484, 1, 1, 1, 1, 1,
1.054812, -0.03906002, 1.485664, 1, 1, 1, 1, 1,
1.057263, 0.5412985, 2.5014, 1, 1, 1, 1, 1,
1.069861, -0.4961379, 2.034179, 1, 1, 1, 1, 1,
1.077267, -0.8975563, 3.847001, 1, 1, 1, 1, 1,
1.082566, -0.9409152, 3.529636, 1, 1, 1, 1, 1,
1.082864, 0.05379795, 2.015938, 1, 1, 1, 1, 1,
1.082932, 0.1406627, -1.571873, 1, 1, 1, 1, 1,
1.087868, 0.4689291, 1.098884, 1, 1, 1, 1, 1,
1.10873, 1.225933, 0.6735678, 1, 1, 1, 1, 1,
1.109638, 1.108026, 0.9517193, 1, 1, 1, 1, 1,
1.121733, -1.01646, 2.560089, 0, 0, 1, 1, 1,
1.122503, 0.5174161, 1.443413, 1, 0, 0, 1, 1,
1.126984, -0.7053951, 4.22946, 1, 0, 0, 1, 1,
1.136033, -0.8590953, 2.282752, 1, 0, 0, 1, 1,
1.136723, 0.0180279, 1.374613, 1, 0, 0, 1, 1,
1.150568, 0.3880219, 0.822273, 1, 0, 0, 1, 1,
1.158326, 0.1607648, 0.2612379, 0, 0, 0, 1, 1,
1.158912, 1.42865, 0.6985042, 0, 0, 0, 1, 1,
1.159465, -0.7644216, 2.038158, 0, 0, 0, 1, 1,
1.163408, 0.7901327, 2.354741, 0, 0, 0, 1, 1,
1.164629, -1.95226, 0.8466068, 0, 0, 0, 1, 1,
1.166005, 0.03711501, 1.102601, 0, 0, 0, 1, 1,
1.168439, -0.704417, 2.157861, 0, 0, 0, 1, 1,
1.171718, -0.7365799, 4.198503, 1, 1, 1, 1, 1,
1.175765, 1.60745, 1.085304, 1, 1, 1, 1, 1,
1.189422, -0.0665772, 2.01362, 1, 1, 1, 1, 1,
1.194384, 0.3737032, 0.7516084, 1, 1, 1, 1, 1,
1.206089, 0.541045, 1.116579, 1, 1, 1, 1, 1,
1.215441, -1.320424, 1.697172, 1, 1, 1, 1, 1,
1.216168, -0.2266748, 1.792721, 1, 1, 1, 1, 1,
1.227239, -0.5398984, 1.198793, 1, 1, 1, 1, 1,
1.228157, -0.5669934, 0.8951425, 1, 1, 1, 1, 1,
1.231404, -0.32867, 1.69646, 1, 1, 1, 1, 1,
1.231862, 0.3603026, 2.046399, 1, 1, 1, 1, 1,
1.232002, 0.7984982, 0.5060414, 1, 1, 1, 1, 1,
1.235526, -0.3635137, 3.138688, 1, 1, 1, 1, 1,
1.240044, -0.9491786, 3.195371, 1, 1, 1, 1, 1,
1.247645, -0.2859997, 1.72462, 1, 1, 1, 1, 1,
1.250948, 0.8972816, 0.2509962, 0, 0, 1, 1, 1,
1.256703, 0.04405945, 2.076068, 1, 0, 0, 1, 1,
1.266227, -0.7752328, 2.828528, 1, 0, 0, 1, 1,
1.274128, -0.1979909, 1.332724, 1, 0, 0, 1, 1,
1.28185, -0.768162, 1.798055, 1, 0, 0, 1, 1,
1.29633, 1.223137, -0.9334919, 1, 0, 0, 1, 1,
1.297844, 0.2825877, 1.215762, 0, 0, 0, 1, 1,
1.302087, -0.9777099, 2.426365, 0, 0, 0, 1, 1,
1.319201, 1.222209, 1.391647, 0, 0, 0, 1, 1,
1.319483, -0.7264013, 1.236568, 0, 0, 0, 1, 1,
1.320934, -1.900802, 3.12646, 0, 0, 0, 1, 1,
1.337702, -1.005731, 2.004052, 0, 0, 0, 1, 1,
1.341447, 0.9105555, -0.4124178, 0, 0, 0, 1, 1,
1.356135, 1.670668, -0.07655949, 1, 1, 1, 1, 1,
1.359119, 0.4735183, -1.743585, 1, 1, 1, 1, 1,
1.3607, 0.2558329, 0.9222955, 1, 1, 1, 1, 1,
1.364906, -0.4189482, 1.510497, 1, 1, 1, 1, 1,
1.368066, 1.544215, -0.53673, 1, 1, 1, 1, 1,
1.368159, -0.7321914, 0.8536246, 1, 1, 1, 1, 1,
1.373539, -1.037836, 2.963568, 1, 1, 1, 1, 1,
1.386585, -1.150421, 0.6366821, 1, 1, 1, 1, 1,
1.386721, -0.4381046, 0.03163999, 1, 1, 1, 1, 1,
1.390174, 1.922052, 0.8796534, 1, 1, 1, 1, 1,
1.395266, -0.3903244, 1.350631, 1, 1, 1, 1, 1,
1.406663, -0.8861486, 2.332064, 1, 1, 1, 1, 1,
1.41249, 0.8455026, 2.7166, 1, 1, 1, 1, 1,
1.41673, -1.489302, 1.739042, 1, 1, 1, 1, 1,
1.423196, 0.1459574, 1.70202, 1, 1, 1, 1, 1,
1.423609, -1.127405, 3.614684, 0, 0, 1, 1, 1,
1.438815, -0.7024398, 2.227668, 1, 0, 0, 1, 1,
1.443841, -0.1257239, 2.710115, 1, 0, 0, 1, 1,
1.455258, -0.2829785, 1.582335, 1, 0, 0, 1, 1,
1.46177, 0.4500327, 3.753395, 1, 0, 0, 1, 1,
1.469559, -0.5766336, 1.712709, 1, 0, 0, 1, 1,
1.481426, -1.226692, 1.15357, 0, 0, 0, 1, 1,
1.487423, -0.9765534, 2.545441, 0, 0, 0, 1, 1,
1.495362, -1.383063, 1.986854, 0, 0, 0, 1, 1,
1.495713, 0.5819342, 0.6100914, 0, 0, 0, 1, 1,
1.498179, -0.2128858, -0.1076222, 0, 0, 0, 1, 1,
1.501248, -1.28558, 2.301457, 0, 0, 0, 1, 1,
1.507638, 0.7696394, 2.431406, 0, 0, 0, 1, 1,
1.508146, 0.4398026, 1.347043, 1, 1, 1, 1, 1,
1.513838, 0.4719574, 2.567248, 1, 1, 1, 1, 1,
1.526486, 0.749086, 2.237257, 1, 1, 1, 1, 1,
1.52934, -0.9327608, 1.240141, 1, 1, 1, 1, 1,
1.541014, 1.679259, 1.714234, 1, 1, 1, 1, 1,
1.541929, -0.7455086, 3.038686, 1, 1, 1, 1, 1,
1.54264, -1.716177, 3.117536, 1, 1, 1, 1, 1,
1.551709, -1.169519, 1.547559, 1, 1, 1, 1, 1,
1.566811, 0.5549322, 3.858509, 1, 1, 1, 1, 1,
1.572906, 1.544499, 1.172553, 1, 1, 1, 1, 1,
1.581816, 0.09069112, 1.456879, 1, 1, 1, 1, 1,
1.60328, 0.9529439, 0.02760209, 1, 1, 1, 1, 1,
1.61153, 0.4094003, 0.9453367, 1, 1, 1, 1, 1,
1.6291, -1.169644, 2.117054, 1, 1, 1, 1, 1,
1.629912, 0.72887, 1.788954, 1, 1, 1, 1, 1,
1.637881, -0.7731653, 2.299451, 0, 0, 1, 1, 1,
1.64875, 0.03160007, 1.890185, 1, 0, 0, 1, 1,
1.649828, 0.1644351, 1.083903, 1, 0, 0, 1, 1,
1.656805, 0.3550332, 2.592185, 1, 0, 0, 1, 1,
1.657458, 0.2008573, 1.059392, 1, 0, 0, 1, 1,
1.673374, 0.978155, 1.21618, 1, 0, 0, 1, 1,
1.700611, 0.7219931, 2.621546, 0, 0, 0, 1, 1,
1.710982, -3.130842, 0.8718277, 0, 0, 0, 1, 1,
1.719593, -0.4046389, 2.307984, 0, 0, 0, 1, 1,
1.758368, 0.02546133, 2.0347, 0, 0, 0, 1, 1,
1.758536, 0.785295, 1.215793, 0, 0, 0, 1, 1,
1.760583, -1.355402, 3.542789, 0, 0, 0, 1, 1,
1.760793, 0.4257848, 1.655458, 0, 0, 0, 1, 1,
1.788626, 0.3097211, 0.04805544, 1, 1, 1, 1, 1,
1.807958, 1.753417, -0.6529124, 1, 1, 1, 1, 1,
1.827017, -3.032298, 2.105559, 1, 1, 1, 1, 1,
1.90418, 0.5752529, 2.178286, 1, 1, 1, 1, 1,
1.907069, 0.3203226, 2.111045, 1, 1, 1, 1, 1,
1.913279, 0.467986, 2.793977, 1, 1, 1, 1, 1,
1.916248, 0.4540604, 1.500339, 1, 1, 1, 1, 1,
1.92422, -0.609901, 2.218122, 1, 1, 1, 1, 1,
1.959834, -2.805375, 1.706256, 1, 1, 1, 1, 1,
1.986171, 0.7685132, -0.2075348, 1, 1, 1, 1, 1,
1.98799, 0.8001691, 1.107767, 1, 1, 1, 1, 1,
2.00211, 0.5561864, 2.242047, 1, 1, 1, 1, 1,
2.023518, 0.2518874, 3.305674, 1, 1, 1, 1, 1,
2.041171, 1.020676, 1.933967, 1, 1, 1, 1, 1,
2.043676, 1.822929, 1.455529, 1, 1, 1, 1, 1,
2.051607, -2.246487, 1.982281, 0, 0, 1, 1, 1,
2.060966, 1.332488, 2.388891, 1, 0, 0, 1, 1,
2.073781, 1.395497, 0.9958219, 1, 0, 0, 1, 1,
2.074175, -0.2321308, 3.16595, 1, 0, 0, 1, 1,
2.081732, 0.1237449, 2.509052, 1, 0, 0, 1, 1,
2.108911, -1.853079, 3.683525, 1, 0, 0, 1, 1,
2.114496, -0.3668568, 0.8525451, 0, 0, 0, 1, 1,
2.172692, -0.2370589, 1.274846, 0, 0, 0, 1, 1,
2.215203, -0.6497317, 0.5494663, 0, 0, 0, 1, 1,
2.282474, -0.7208554, 2.14584, 0, 0, 0, 1, 1,
2.312247, -0.1904641, 1.579411, 0, 0, 0, 1, 1,
2.349605, -0.385256, 2.802758, 0, 0, 0, 1, 1,
2.352997, -0.3943574, 2.044642, 0, 0, 0, 1, 1,
2.377809, 0.2573144, 2.527413, 1, 1, 1, 1, 1,
2.400571, -1.279251, 1.329523, 1, 1, 1, 1, 1,
2.433538, 0.6444893, 1.724757, 1, 1, 1, 1, 1,
2.468533, -0.5420049, 2.911103, 1, 1, 1, 1, 1,
2.572402, 0.6051085, 3.302027, 1, 1, 1, 1, 1,
3.260866, -0.2216386, 1.050931, 1, 1, 1, 1, 1,
3.590412, 1.154743, 1.306273, 1, 1, 1, 1, 1
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
var radius = 10.2964;
var distance = 36.16568;
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
mvMatrix.translate( -0.09867811, -0.05345678, -0.2723644 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.16568);
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
