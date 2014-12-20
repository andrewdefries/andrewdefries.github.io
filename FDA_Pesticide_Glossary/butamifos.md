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
-3.142522, -0.1227182, -1.201127, 1, 0, 0, 1,
-2.654974, -1.306707, -1.692504, 1, 0.007843138, 0, 1,
-2.612097, 0.3946529, -0.6533794, 1, 0.01176471, 0, 1,
-2.55314, -0.6702446, -0.605914, 1, 0.01960784, 0, 1,
-2.472025, 1.245848, -1.945395, 1, 0.02352941, 0, 1,
-2.426324, -0.2898991, -0.2922917, 1, 0.03137255, 0, 1,
-2.402971, 0.9932705, -1.184557, 1, 0.03529412, 0, 1,
-2.394339, -0.1716196, -1.87869, 1, 0.04313726, 0, 1,
-2.371524, 1.005836, 0.3215511, 1, 0.04705882, 0, 1,
-2.351677, -0.08280241, -2.465104, 1, 0.05490196, 0, 1,
-2.350086, 0.1755734, -3.488743, 1, 0.05882353, 0, 1,
-2.214961, -1.622845, -2.901206, 1, 0.06666667, 0, 1,
-2.179426, 1.853155, -1.50851, 1, 0.07058824, 0, 1,
-2.144635, -1.801276, -1.633142, 1, 0.07843138, 0, 1,
-2.138144, -0.03476208, -1.535528, 1, 0.08235294, 0, 1,
-2.099093, 0.9776719, -0.4528134, 1, 0.09019608, 0, 1,
-2.070948, -0.1702452, -2.064751, 1, 0.09411765, 0, 1,
-2.04108, 0.8542714, -0.9293148, 1, 0.1019608, 0, 1,
-2.006062, -1.563086, -1.284558, 1, 0.1098039, 0, 1,
-1.988109, -1.200275, -2.319866, 1, 0.1137255, 0, 1,
-1.976692, -1.879429, -0.3719107, 1, 0.1215686, 0, 1,
-1.965734, 1.725906, -1.396544, 1, 0.1254902, 0, 1,
-1.950733, 0.1949815, -1.962953, 1, 0.1333333, 0, 1,
-1.907602, 0.8638847, -1.349531, 1, 0.1372549, 0, 1,
-1.898959, 1.061522, -0.07438812, 1, 0.145098, 0, 1,
-1.89682, 0.9830633, -3.010786, 1, 0.1490196, 0, 1,
-1.887872, 1.715096, -0.1293432, 1, 0.1568628, 0, 1,
-1.849926, 0.6377301, -2.076149, 1, 0.1607843, 0, 1,
-1.829301, 0.3797176, -2.83944, 1, 0.1686275, 0, 1,
-1.794982, 0.6112306, -3.00515, 1, 0.172549, 0, 1,
-1.787261, 0.2387308, -0.5082222, 1, 0.1803922, 0, 1,
-1.772171, 0.7771372, -0.2162325, 1, 0.1843137, 0, 1,
-1.769543, 0.5792868, -0.1808206, 1, 0.1921569, 0, 1,
-1.761703, 0.2707382, -3.012164, 1, 0.1960784, 0, 1,
-1.740075, 0.0168828, -0.1617108, 1, 0.2039216, 0, 1,
-1.72822, 0.7713302, -1.496859, 1, 0.2117647, 0, 1,
-1.719514, -0.02101708, -1.915581, 1, 0.2156863, 0, 1,
-1.697384, 1.426106, -2.488904, 1, 0.2235294, 0, 1,
-1.677586, -1.451444, -1.768333, 1, 0.227451, 0, 1,
-1.644893, -0.7650506, -2.058347, 1, 0.2352941, 0, 1,
-1.636129, -1.997876, -5.427893, 1, 0.2392157, 0, 1,
-1.635023, -0.2182458, -1.738051, 1, 0.2470588, 0, 1,
-1.630903, 1.427024, -1.83281, 1, 0.2509804, 0, 1,
-1.624145, 0.674808, -1.695786, 1, 0.2588235, 0, 1,
-1.621988, 1.064846, 1.194594, 1, 0.2627451, 0, 1,
-1.618146, 0.6317091, -1.478243, 1, 0.2705882, 0, 1,
-1.598636, -1.64623, -2.590589, 1, 0.2745098, 0, 1,
-1.586922, 0.526422, -1.454565, 1, 0.282353, 0, 1,
-1.576683, -0.6009241, -1.122228, 1, 0.2862745, 0, 1,
-1.571764, -0.9669824, -3.456934, 1, 0.2941177, 0, 1,
-1.551968, -1.669697, -3.966152, 1, 0.3019608, 0, 1,
-1.551867, -0.2047472, -2.023416, 1, 0.3058824, 0, 1,
-1.54836, -0.1428211, -1.835285, 1, 0.3137255, 0, 1,
-1.538179, 0.4724423, -1.930757, 1, 0.3176471, 0, 1,
-1.533092, 0.432664, -2.43754, 1, 0.3254902, 0, 1,
-1.529444, 1.626726, -0.8423004, 1, 0.3294118, 0, 1,
-1.518728, 2.100309, -1.438799, 1, 0.3372549, 0, 1,
-1.510847, -0.01477553, -1.532497, 1, 0.3411765, 0, 1,
-1.508138, -1.014106, -2.725976, 1, 0.3490196, 0, 1,
-1.494641, -0.7659639, -2.544734, 1, 0.3529412, 0, 1,
-1.481784, 0.9193977, 0.8516368, 1, 0.3607843, 0, 1,
-1.480981, -0.4664005, -1.819195, 1, 0.3647059, 0, 1,
-1.451466, -1.037491, -2.832232, 1, 0.372549, 0, 1,
-1.446928, -0.4978541, -3.198388, 1, 0.3764706, 0, 1,
-1.438068, -0.2085061, -2.877845, 1, 0.3843137, 0, 1,
-1.433604, 0.09797532, -0.3006685, 1, 0.3882353, 0, 1,
-1.42653, 0.693289, -3.039846, 1, 0.3960784, 0, 1,
-1.420727, 0.2417491, -2.768726, 1, 0.4039216, 0, 1,
-1.413401, 0.2096607, -1.854131, 1, 0.4078431, 0, 1,
-1.393164, -0.9995672, -3.597196, 1, 0.4156863, 0, 1,
-1.387826, 0.1360857, -1.088878, 1, 0.4196078, 0, 1,
-1.368712, 0.6827818, -1.551409, 1, 0.427451, 0, 1,
-1.359513, 0.6298606, -1.69582, 1, 0.4313726, 0, 1,
-1.358861, 1.625116, -1.99658, 1, 0.4392157, 0, 1,
-1.353983, -0.8649572, -0.6652672, 1, 0.4431373, 0, 1,
-1.353275, 0.2967593, -1.718597, 1, 0.4509804, 0, 1,
-1.352168, -0.1501533, 0.07328339, 1, 0.454902, 0, 1,
-1.344931, 0.8180386, 0.04868805, 1, 0.4627451, 0, 1,
-1.335797, -0.6003497, -2.933637, 1, 0.4666667, 0, 1,
-1.328482, -0.7859034, -2.714831, 1, 0.4745098, 0, 1,
-1.315526, 0.9261371, 0.138289, 1, 0.4784314, 0, 1,
-1.306436, 0.72297, -1.702541, 1, 0.4862745, 0, 1,
-1.302803, -0.3399701, -0.07138158, 1, 0.4901961, 0, 1,
-1.290856, -0.1866961, -2.552682, 1, 0.4980392, 0, 1,
-1.282973, 0.8803484, -0.6089303, 1, 0.5058824, 0, 1,
-1.262829, -0.005487115, -2.803972, 1, 0.509804, 0, 1,
-1.261187, 1.699609, -1.456571, 1, 0.5176471, 0, 1,
-1.254443, 1.250592, -0.5993125, 1, 0.5215687, 0, 1,
-1.252828, 0.7308532, 0.6181326, 1, 0.5294118, 0, 1,
-1.248578, -1.177923, -2.827756, 1, 0.5333334, 0, 1,
-1.232036, 0.908604, -0.6956907, 1, 0.5411765, 0, 1,
-1.224349, -0.3060598, -0.7969686, 1, 0.5450981, 0, 1,
-1.213612, -0.6587724, -1.06015, 1, 0.5529412, 0, 1,
-1.211871, 0.700235, -0.89787, 1, 0.5568628, 0, 1,
-1.210396, 1.601626, -2.562798, 1, 0.5647059, 0, 1,
-1.207604, -0.05463437, -1.96327, 1, 0.5686275, 0, 1,
-1.205662, 0.4124321, 0.106914, 1, 0.5764706, 0, 1,
-1.205509, -2.00901, -3.121656, 1, 0.5803922, 0, 1,
-1.198635, -0.4958918, -3.369123, 1, 0.5882353, 0, 1,
-1.188232, 0.1455827, -2.38743, 1, 0.5921569, 0, 1,
-1.170256, -0.01150185, -3.21998, 1, 0.6, 0, 1,
-1.154139, 0.4194513, 0.4725932, 1, 0.6078432, 0, 1,
-1.141915, -0.992056, -1.426059, 1, 0.6117647, 0, 1,
-1.129924, 0.1442386, -1.460199, 1, 0.6196079, 0, 1,
-1.125495, -0.5933709, -1.407519, 1, 0.6235294, 0, 1,
-1.120703, 0.5693561, -1.481671, 1, 0.6313726, 0, 1,
-1.119939, 1.428157, -2.206435, 1, 0.6352941, 0, 1,
-1.116152, -1.084602, -2.964065, 1, 0.6431373, 0, 1,
-1.115316, -0.6038524, -2.240247, 1, 0.6470588, 0, 1,
-1.113808, 0.5660797, -2.18258, 1, 0.654902, 0, 1,
-1.109677, 0.1434489, -2.884348, 1, 0.6588235, 0, 1,
-1.108157, 0.7351664, -0.2156492, 1, 0.6666667, 0, 1,
-1.10434, 1.517727, -0.7468367, 1, 0.6705883, 0, 1,
-1.097225, -0.4864225, -2.196454, 1, 0.6784314, 0, 1,
-1.096497, -0.1022583, -2.347143, 1, 0.682353, 0, 1,
-1.09536, -0.784857, -2.653539, 1, 0.6901961, 0, 1,
-1.086086, -0.638392, -2.488683, 1, 0.6941177, 0, 1,
-1.08434, -0.6046143, -1.364838, 1, 0.7019608, 0, 1,
-1.084046, 0.6862674, -0.3329075, 1, 0.7098039, 0, 1,
-1.071421, -0.9431562, -0.9444461, 1, 0.7137255, 0, 1,
-1.071107, 0.7570666, -0.475179, 1, 0.7215686, 0, 1,
-1.068483, 1.01934, -0.8975068, 1, 0.7254902, 0, 1,
-1.067369, 1.471754, -1.349589, 1, 0.7333333, 0, 1,
-1.066885, -0.8014351, -1.037086, 1, 0.7372549, 0, 1,
-1.06164, 1.773935, 1.487002, 1, 0.7450981, 0, 1,
-1.06136, 0.8210633, -0.3186503, 1, 0.7490196, 0, 1,
-1.052582, 0.607927, -1.108594, 1, 0.7568628, 0, 1,
-1.047066, 0.3949422, 0.4144339, 1, 0.7607843, 0, 1,
-1.042951, -0.2000075, -3.309127, 1, 0.7686275, 0, 1,
-1.042674, -0.1502012, -2.178509, 1, 0.772549, 0, 1,
-1.037227, 1.056522, -0.9017711, 1, 0.7803922, 0, 1,
-1.034203, 1.232312, 0.1856665, 1, 0.7843137, 0, 1,
-1.034185, -0.2172187, -2.5822, 1, 0.7921569, 0, 1,
-1.030777, 1.202878, -1.269663, 1, 0.7960784, 0, 1,
-1.029306, -0.6336479, -3.156666, 1, 0.8039216, 0, 1,
-1.027861, 1.115091, -0.5967811, 1, 0.8117647, 0, 1,
-1.027669, 0.6837182, -1.512978, 1, 0.8156863, 0, 1,
-1.012991, -0.06581417, -2.190595, 1, 0.8235294, 0, 1,
-1.011258, 0.00793699, -1.742877, 1, 0.827451, 0, 1,
-1.008946, 1.635215, -0.4397668, 1, 0.8352941, 0, 1,
-1.007973, -1.028378, -2.942628, 1, 0.8392157, 0, 1,
-0.9985563, -1.100322, -3.257085, 1, 0.8470588, 0, 1,
-0.9923077, 1.42046, -0.8001261, 1, 0.8509804, 0, 1,
-0.9907104, -0.7394905, -2.058891, 1, 0.8588235, 0, 1,
-0.9907051, 0.2634645, -3.485022, 1, 0.8627451, 0, 1,
-0.9859417, 0.1201319, -0.3226679, 1, 0.8705882, 0, 1,
-0.9746887, 0.773863, -1.589859, 1, 0.8745098, 0, 1,
-0.9724525, 0.7667197, -0.9043198, 1, 0.8823529, 0, 1,
-0.9684535, 1.197709, -0.3289398, 1, 0.8862745, 0, 1,
-0.9668388, 0.5126109, -2.426957, 1, 0.8941177, 0, 1,
-0.9665046, -1.309248, -1.988428, 1, 0.8980392, 0, 1,
-0.9664714, -0.152501, 0.4789277, 1, 0.9058824, 0, 1,
-0.9631755, 0.7435107, 1.70325, 1, 0.9137255, 0, 1,
-0.9617369, -0.8548203, -1.564372, 1, 0.9176471, 0, 1,
-0.9509646, 0.05612072, -0.5551735, 1, 0.9254902, 0, 1,
-0.9470519, 1.834072, 1.28539, 1, 0.9294118, 0, 1,
-0.9260626, 1.381772, -1.400282, 1, 0.9372549, 0, 1,
-0.9251747, 0.6757034, 0.01055122, 1, 0.9411765, 0, 1,
-0.9138733, 0.6454373, -3.184992, 1, 0.9490196, 0, 1,
-0.9101399, 0.5062217, -0.2581344, 1, 0.9529412, 0, 1,
-0.9082677, 0.05876142, -1.020683, 1, 0.9607843, 0, 1,
-0.9049416, -0.5958508, -2.692867, 1, 0.9647059, 0, 1,
-0.9022897, 1.102516, -1.493564, 1, 0.972549, 0, 1,
-0.8998116, 0.2380595, -1.419178, 1, 0.9764706, 0, 1,
-0.8948407, -1.89444, -2.714469, 1, 0.9843137, 0, 1,
-0.8944852, 0.4627272, -1.163892, 1, 0.9882353, 0, 1,
-0.8922222, -0.8450215, -1.696237, 1, 0.9960784, 0, 1,
-0.8912253, -0.9616635, -2.795151, 0.9960784, 1, 0, 1,
-0.8902352, 0.3291503, -2.649692, 0.9921569, 1, 0, 1,
-0.8817587, 0.3712474, -1.55362, 0.9843137, 1, 0, 1,
-0.8817374, -0.2239957, -2.048838, 0.9803922, 1, 0, 1,
-0.8816444, 0.251722, -2.165563, 0.972549, 1, 0, 1,
-0.8805901, -0.2626151, -2.447649, 0.9686275, 1, 0, 1,
-0.8747441, -1.800919, -3.462519, 0.9607843, 1, 0, 1,
-0.8725367, -1.963695, -2.882639, 0.9568627, 1, 0, 1,
-0.8596339, -0.2363295, -2.402556, 0.9490196, 1, 0, 1,
-0.8589273, 0.8137168, -1.715327, 0.945098, 1, 0, 1,
-0.8531687, -0.05497188, -1.047851, 0.9372549, 1, 0, 1,
-0.8443207, -0.9609303, -3.538338, 0.9333333, 1, 0, 1,
-0.8369945, 1.379262, -1.99337, 0.9254902, 1, 0, 1,
-0.8365285, -0.5070772, -2.718184, 0.9215686, 1, 0, 1,
-0.8336769, 0.1728709, -0.192641, 0.9137255, 1, 0, 1,
-0.8312437, -0.6988149, -2.725967, 0.9098039, 1, 0, 1,
-0.8258855, -0.3947974, -1.893216, 0.9019608, 1, 0, 1,
-0.8189297, 0.9542019, -0.5358638, 0.8941177, 1, 0, 1,
-0.8117958, -0.4454424, -2.312338, 0.8901961, 1, 0, 1,
-0.8108346, 1.813945, -1.74617, 0.8823529, 1, 0, 1,
-0.8108303, 1.711841, 1.730342, 0.8784314, 1, 0, 1,
-0.8061723, 0.137107, -2.52009, 0.8705882, 1, 0, 1,
-0.8007939, -0.5553976, -2.249804, 0.8666667, 1, 0, 1,
-0.8005612, -1.592787, -1.692518, 0.8588235, 1, 0, 1,
-0.8002904, 2.015211, -1.113714, 0.854902, 1, 0, 1,
-0.7991561, 2.547479, -0.6729995, 0.8470588, 1, 0, 1,
-0.7906873, -0.7497036, -3.556267, 0.8431373, 1, 0, 1,
-0.7853927, -1.799379, -1.692084, 0.8352941, 1, 0, 1,
-0.7852752, -1.110085, -1.526459, 0.8313726, 1, 0, 1,
-0.7805407, -0.8095335, -2.023343, 0.8235294, 1, 0, 1,
-0.7798449, 0.2751452, -0.5761209, 0.8196079, 1, 0, 1,
-0.7764781, 0.3726224, -2.030798, 0.8117647, 1, 0, 1,
-0.7742217, -0.9485984, -1.98091, 0.8078431, 1, 0, 1,
-0.7713429, 0.201593, -1.553918, 0.8, 1, 0, 1,
-0.7690793, -0.4615567, -3.070339, 0.7921569, 1, 0, 1,
-0.7674903, 1.499432, 0.6663844, 0.7882353, 1, 0, 1,
-0.7612335, 0.9250718, -1.462092, 0.7803922, 1, 0, 1,
-0.7580956, 2.246448, -1.609781, 0.7764706, 1, 0, 1,
-0.756594, 0.00393155, -1.756222, 0.7686275, 1, 0, 1,
-0.7565363, -0.2726246, -2.156873, 0.7647059, 1, 0, 1,
-0.7527848, -1.143654, -3.046181, 0.7568628, 1, 0, 1,
-0.7491007, 1.025502, -1.057157, 0.7529412, 1, 0, 1,
-0.7457575, -1.247201, -0.9391271, 0.7450981, 1, 0, 1,
-0.7432612, 1.642815, 0.2943901, 0.7411765, 1, 0, 1,
-0.7252821, -0.2311417, -3.361808, 0.7333333, 1, 0, 1,
-0.722405, -0.00644477, -1.983362, 0.7294118, 1, 0, 1,
-0.7207419, 0.3366888, -1.919892, 0.7215686, 1, 0, 1,
-0.7147969, -0.5262023, -2.380799, 0.7176471, 1, 0, 1,
-0.7132177, -0.5856084, -2.106514, 0.7098039, 1, 0, 1,
-0.7070529, 2.319216, -1.01043, 0.7058824, 1, 0, 1,
-0.7032151, -0.5074031, -1.957518, 0.6980392, 1, 0, 1,
-0.7029817, 0.357552, 2.27713, 0.6901961, 1, 0, 1,
-0.7018201, 0.167859, -1.597626, 0.6862745, 1, 0, 1,
-0.6913324, 2.066491, -1.172758, 0.6784314, 1, 0, 1,
-0.6882159, -0.3480699, -2.493923, 0.6745098, 1, 0, 1,
-0.6859264, -0.0885024, -1.001069, 0.6666667, 1, 0, 1,
-0.6848755, -0.300504, -1.304164, 0.6627451, 1, 0, 1,
-0.6839302, 2.062665, 0.1452521, 0.654902, 1, 0, 1,
-0.6794648, -0.1563125, -2.7099, 0.6509804, 1, 0, 1,
-0.675483, -0.8626713, -3.23141, 0.6431373, 1, 0, 1,
-0.6699846, 0.07465607, -1.246024, 0.6392157, 1, 0, 1,
-0.6697449, 2.388597, 0.6116625, 0.6313726, 1, 0, 1,
-0.6695865, 0.2716123, -1.157935, 0.627451, 1, 0, 1,
-0.6667662, -1.415731, -3.794747, 0.6196079, 1, 0, 1,
-0.6622107, -0.07080461, -1.52926, 0.6156863, 1, 0, 1,
-0.6619868, 0.2235702, -0.8631584, 0.6078432, 1, 0, 1,
-0.6610751, -1.822819, -2.78896, 0.6039216, 1, 0, 1,
-0.6535765, 0.4595143, -2.023497, 0.5960785, 1, 0, 1,
-0.6431763, -2.834653, -2.885051, 0.5882353, 1, 0, 1,
-0.6405448, -1.006983, -2.244795, 0.5843138, 1, 0, 1,
-0.6380175, 0.8439931, -1.389695, 0.5764706, 1, 0, 1,
-0.6378323, 0.8908235, -0.04518399, 0.572549, 1, 0, 1,
-0.6266719, 0.4324266, -0.0791077, 0.5647059, 1, 0, 1,
-0.6236957, -0.507043, -2.273038, 0.5607843, 1, 0, 1,
-0.62333, 1.205559, -1.745188, 0.5529412, 1, 0, 1,
-0.6224433, 0.09932631, -0.9857094, 0.5490196, 1, 0, 1,
-0.6220791, 0.0477456, -1.063777, 0.5411765, 1, 0, 1,
-0.6210845, -0.9388953, -3.904613, 0.5372549, 1, 0, 1,
-0.6145167, -1.390926, -3.457208, 0.5294118, 1, 0, 1,
-0.6141787, 0.001654479, -1.451234, 0.5254902, 1, 0, 1,
-0.6098294, 0.455158, -1.955197, 0.5176471, 1, 0, 1,
-0.6058567, -0.5942865, -2.4325, 0.5137255, 1, 0, 1,
-0.6057333, -0.5872367, -2.831246, 0.5058824, 1, 0, 1,
-0.6035581, 0.9327695, 1.220455, 0.5019608, 1, 0, 1,
-0.600847, 0.1430923, -1.422981, 0.4941176, 1, 0, 1,
-0.5982571, 0.8236915, -0.8936762, 0.4862745, 1, 0, 1,
-0.5964144, 0.4771999, -1.722487, 0.4823529, 1, 0, 1,
-0.5921145, 1.32089, -0.946062, 0.4745098, 1, 0, 1,
-0.5896348, -0.02805946, -2.463377, 0.4705882, 1, 0, 1,
-0.5869049, 0.6230937, -0.8287826, 0.4627451, 1, 0, 1,
-0.5866002, 0.3503753, -1.639534, 0.4588235, 1, 0, 1,
-0.5813975, 0.636139, -1.828419, 0.4509804, 1, 0, 1,
-0.580349, 1.043194, -1.838, 0.4470588, 1, 0, 1,
-0.5725833, -0.273429, 0.3062291, 0.4392157, 1, 0, 1,
-0.5716717, -0.3384129, -1.061762, 0.4352941, 1, 0, 1,
-0.5676153, 0.007385978, -2.495062, 0.427451, 1, 0, 1,
-0.5633708, 0.6243075, -0.1508391, 0.4235294, 1, 0, 1,
-0.5627268, -0.4563128, -3.246435, 0.4156863, 1, 0, 1,
-0.5580848, -0.06990967, -1.289467, 0.4117647, 1, 0, 1,
-0.5546229, -0.1323273, -3.224289, 0.4039216, 1, 0, 1,
-0.5545284, -0.7421869, -2.342579, 0.3960784, 1, 0, 1,
-0.5477791, 1.336903, -0.5835397, 0.3921569, 1, 0, 1,
-0.5464619, 0.9117057, -0.0642179, 0.3843137, 1, 0, 1,
-0.5455398, 0.4086804, -1.200459, 0.3803922, 1, 0, 1,
-0.5428877, -0.08641271, -1.895723, 0.372549, 1, 0, 1,
-0.5341256, -0.9063978, -4.996191, 0.3686275, 1, 0, 1,
-0.5308087, -0.8956404, -1.562639, 0.3607843, 1, 0, 1,
-0.5304964, 0.5023865, 0.2708272, 0.3568628, 1, 0, 1,
-0.5303441, 0.6899914, -0.9814756, 0.3490196, 1, 0, 1,
-0.5266132, -1.806205, -2.328294, 0.345098, 1, 0, 1,
-0.5250294, 0.9991607, -1.7388, 0.3372549, 1, 0, 1,
-0.524274, 1.044917, 1.342091, 0.3333333, 1, 0, 1,
-0.520349, 1.114518, -1.982135, 0.3254902, 1, 0, 1,
-0.518892, 0.3667692, -1.196023, 0.3215686, 1, 0, 1,
-0.5182948, -0.3618076, -1.565024, 0.3137255, 1, 0, 1,
-0.5155247, -1.11859, -2.685449, 0.3098039, 1, 0, 1,
-0.5140996, -0.6353305, -1.772042, 0.3019608, 1, 0, 1,
-0.5140296, 2.088264, -0.9849916, 0.2941177, 1, 0, 1,
-0.5104637, -1.081611, -2.822123, 0.2901961, 1, 0, 1,
-0.5031817, -0.4209821, -3.4791, 0.282353, 1, 0, 1,
-0.4972377, 1.430454, -1.118155, 0.2784314, 1, 0, 1,
-0.4971994, -1.021504, -1.425102, 0.2705882, 1, 0, 1,
-0.4945719, 0.655139, -1.806481, 0.2666667, 1, 0, 1,
-0.4931318, 0.5459203, 0.2696628, 0.2588235, 1, 0, 1,
-0.4870414, -0.09216546, -1.501998, 0.254902, 1, 0, 1,
-0.4837468, -1.069028, -3.333554, 0.2470588, 1, 0, 1,
-0.4820929, 0.191992, -2.637381, 0.2431373, 1, 0, 1,
-0.4812005, 1.653684, -0.1723045, 0.2352941, 1, 0, 1,
-0.4781144, -1.218287, -3.236227, 0.2313726, 1, 0, 1,
-0.4716507, -1.224484, -2.372362, 0.2235294, 1, 0, 1,
-0.4698988, 2.176503, -1.283188, 0.2196078, 1, 0, 1,
-0.462718, 1.15134, -0.1213747, 0.2117647, 1, 0, 1,
-0.4617749, -0.0197279, -1.040291, 0.2078431, 1, 0, 1,
-0.4569188, -1.17939, -2.583624, 0.2, 1, 0, 1,
-0.4518383, -1.811218, -5.09795, 0.1921569, 1, 0, 1,
-0.4471321, -0.5756062, -3.142304, 0.1882353, 1, 0, 1,
-0.4436321, -1.003146, -2.182151, 0.1803922, 1, 0, 1,
-0.4284077, 0.0464451, 0.4220228, 0.1764706, 1, 0, 1,
-0.4281063, -1.088546, -3.430193, 0.1686275, 1, 0, 1,
-0.4250732, -1.353876, -3.471116, 0.1647059, 1, 0, 1,
-0.4238053, -1.328427, -5.201992, 0.1568628, 1, 0, 1,
-0.4188307, -0.1783985, -2.146541, 0.1529412, 1, 0, 1,
-0.4173352, -1.54823, -0.04121641, 0.145098, 1, 0, 1,
-0.4166578, -0.2226492, -1.683813, 0.1411765, 1, 0, 1,
-0.4125778, 0.3530043, -2.08584, 0.1333333, 1, 0, 1,
-0.4067059, 0.7291827, -2.397182, 0.1294118, 1, 0, 1,
-0.4062373, 0.06505841, -1.24793, 0.1215686, 1, 0, 1,
-0.4054278, 0.339609, -1.527998, 0.1176471, 1, 0, 1,
-0.4014274, -0.7766855, -1.817829, 0.1098039, 1, 0, 1,
-0.393044, -0.07780524, -1.035689, 0.1058824, 1, 0, 1,
-0.3907016, 0.2937575, -2.853067, 0.09803922, 1, 0, 1,
-0.3906423, 0.1861853, -2.381393, 0.09019608, 1, 0, 1,
-0.3876955, -0.08497287, -1.968844, 0.08627451, 1, 0, 1,
-0.3837104, 0.0281884, -2.558116, 0.07843138, 1, 0, 1,
-0.3827547, -0.03329565, -1.057342, 0.07450981, 1, 0, 1,
-0.3797478, 0.08770894, -1.547856, 0.06666667, 1, 0, 1,
-0.3759953, -1.093318, -2.483568, 0.0627451, 1, 0, 1,
-0.3756155, -0.367752, -1.293272, 0.05490196, 1, 0, 1,
-0.3738708, 0.2870661, -1.938267, 0.05098039, 1, 0, 1,
-0.3738531, -0.4429133, -1.923674, 0.04313726, 1, 0, 1,
-0.3630747, -0.407187, -1.506004, 0.03921569, 1, 0, 1,
-0.3590884, 0.8513777, 0.7431465, 0.03137255, 1, 0, 1,
-0.3580557, 0.02873106, -0.8180487, 0.02745098, 1, 0, 1,
-0.3551529, 0.1270895, -0.8070522, 0.01960784, 1, 0, 1,
-0.3542694, 1.96818, -0.974626, 0.01568628, 1, 0, 1,
-0.3513062, -0.1074991, -2.390711, 0.007843138, 1, 0, 1,
-0.3511807, 0.2019504, -1.240474, 0.003921569, 1, 0, 1,
-0.3469838, 0.8742681, 1.172925, 0, 1, 0.003921569, 1,
-0.3456753, -0.6370466, -3.157587, 0, 1, 0.01176471, 1,
-0.3385088, -0.9871556, -0.6385141, 0, 1, 0.01568628, 1,
-0.3376322, 0.4718067, -0.61595, 0, 1, 0.02352941, 1,
-0.3373765, 1.857518, 0.02402886, 0, 1, 0.02745098, 1,
-0.3368545, 1.845025, -0.543439, 0, 1, 0.03529412, 1,
-0.3352419, 0.5660263, -0.3753723, 0, 1, 0.03921569, 1,
-0.3351307, -0.2476112, -1.534861, 0, 1, 0.04705882, 1,
-0.3349214, 0.9340423, -0.4643237, 0, 1, 0.05098039, 1,
-0.3342605, -0.1662042, -2.719921, 0, 1, 0.05882353, 1,
-0.3336551, -1.409108, -3.742515, 0, 1, 0.0627451, 1,
-0.3320272, -0.7363873, -3.92485, 0, 1, 0.07058824, 1,
-0.3320025, 1.40505, -0.7115314, 0, 1, 0.07450981, 1,
-0.3232143, 0.1224129, -2.474285, 0, 1, 0.08235294, 1,
-0.3177562, -0.7062864, -1.075558, 0, 1, 0.08627451, 1,
-0.3172449, -0.07274751, -5.183649, 0, 1, 0.09411765, 1,
-0.3140546, -0.8209796, -1.692246, 0, 1, 0.1019608, 1,
-0.3128141, -0.9946117, -3.544363, 0, 1, 0.1058824, 1,
-0.3104061, -0.8494623, -1.454018, 0, 1, 0.1137255, 1,
-0.3072557, -1.096787, -1.745925, 0, 1, 0.1176471, 1,
-0.2986939, 0.4697944, -1.46272, 0, 1, 0.1254902, 1,
-0.29482, -0.9194575, -0.8586681, 0, 1, 0.1294118, 1,
-0.2914299, 0.2288746, -0.9635553, 0, 1, 0.1372549, 1,
-0.2881437, 0.2959768, -1.400651, 0, 1, 0.1411765, 1,
-0.2878497, 0.5416503, -0.3683881, 0, 1, 0.1490196, 1,
-0.2847421, -0.06392103, -1.41889, 0, 1, 0.1529412, 1,
-0.2831681, 0.5041441, 1.337927, 0, 1, 0.1607843, 1,
-0.2828658, 0.2613103, 0.3607135, 0, 1, 0.1647059, 1,
-0.2784913, -0.293492, -2.087559, 0, 1, 0.172549, 1,
-0.2730841, 0.5623009, 0.4500187, 0, 1, 0.1764706, 1,
-0.2721192, 1.081993, 0.2721735, 0, 1, 0.1843137, 1,
-0.2659067, 1.318965, -0.7555038, 0, 1, 0.1882353, 1,
-0.2619938, 1.207329, -1.090553, 0, 1, 0.1960784, 1,
-0.2606284, 0.6765022, 1.125694, 0, 1, 0.2039216, 1,
-0.2583938, 0.4920079, 0.4161413, 0, 1, 0.2078431, 1,
-0.2564381, -0.2209866, -3.196989, 0, 1, 0.2156863, 1,
-0.2552655, -0.3923942, -2.591956, 0, 1, 0.2196078, 1,
-0.2539304, -0.1612221, -2.555865, 0, 1, 0.227451, 1,
-0.2536788, 0.704748, -0.5902771, 0, 1, 0.2313726, 1,
-0.2496953, 0.3642061, -0.6142875, 0, 1, 0.2392157, 1,
-0.2431338, -1.281208, -2.130975, 0, 1, 0.2431373, 1,
-0.2412804, 0.8998815, -1.126042, 0, 1, 0.2509804, 1,
-0.2379263, -1.974394, -1.535902, 0, 1, 0.254902, 1,
-0.2341647, -0.757097, -2.42261, 0, 1, 0.2627451, 1,
-0.2320731, 2.096962, -1.261031, 0, 1, 0.2666667, 1,
-0.2313126, 0.6481441, 0.4756088, 0, 1, 0.2745098, 1,
-0.2311882, -0.00855764, -2.918561, 0, 1, 0.2784314, 1,
-0.2293124, -0.5214618, -4.221155, 0, 1, 0.2862745, 1,
-0.2242936, 0.352096, -1.545097, 0, 1, 0.2901961, 1,
-0.2234867, -0.1978526, -2.608185, 0, 1, 0.2980392, 1,
-0.2234062, -1.248278, -4.298249, 0, 1, 0.3058824, 1,
-0.2203719, 1.43278, -0.3395751, 0, 1, 0.3098039, 1,
-0.2164988, 0.2071866, -0.291793, 0, 1, 0.3176471, 1,
-0.2160665, 1.343787, -0.2065698, 0, 1, 0.3215686, 1,
-0.2140991, -0.2923792, -2.581038, 0, 1, 0.3294118, 1,
-0.2131972, 1.441032, 0.2009516, 0, 1, 0.3333333, 1,
-0.2081796, 0.5026321, -1.170632, 0, 1, 0.3411765, 1,
-0.2067757, 0.352573, 1.203057, 0, 1, 0.345098, 1,
-0.2060513, -0.4970638, -4.025454, 0, 1, 0.3529412, 1,
-0.2043869, -1.946791, -1.613908, 0, 1, 0.3568628, 1,
-0.2031188, -1.157218, -4.57134, 0, 1, 0.3647059, 1,
-0.2027491, -0.253304, -4.403503, 0, 1, 0.3686275, 1,
-0.1988824, -0.01849698, -0.3504845, 0, 1, 0.3764706, 1,
-0.1939018, 0.04312455, -0.8725867, 0, 1, 0.3803922, 1,
-0.1858743, -0.4681102, -3.635449, 0, 1, 0.3882353, 1,
-0.1803893, -0.1968633, -2.073211, 0, 1, 0.3921569, 1,
-0.1766819, 1.04671, -0.1774289, 0, 1, 0.4, 1,
-0.1691093, 0.1211981, -0.4351759, 0, 1, 0.4078431, 1,
-0.1673506, -0.9792817, -2.901517, 0, 1, 0.4117647, 1,
-0.1645083, 1.075276, -0.6242154, 0, 1, 0.4196078, 1,
-0.1627855, -0.2016921, 0.193253, 0, 1, 0.4235294, 1,
-0.1626972, -0.127376, -2.013197, 0, 1, 0.4313726, 1,
-0.159193, 1.470687, -0.5266883, 0, 1, 0.4352941, 1,
-0.1584157, -0.7686282, -4.953182, 0, 1, 0.4431373, 1,
-0.1553436, -0.40721, -0.2647284, 0, 1, 0.4470588, 1,
-0.1520394, 1.073076, -0.3692641, 0, 1, 0.454902, 1,
-0.1515733, -1.057356, -2.614878, 0, 1, 0.4588235, 1,
-0.1512358, 0.5684696, 0.2920462, 0, 1, 0.4666667, 1,
-0.1500425, 1.85882, -0.3544855, 0, 1, 0.4705882, 1,
-0.1486448, 0.4153734, 0.2663143, 0, 1, 0.4784314, 1,
-0.1467124, 0.6796134, -0.6680884, 0, 1, 0.4823529, 1,
-0.1449817, -0.6527906, -2.787681, 0, 1, 0.4901961, 1,
-0.1447905, 0.2779139, -0.843661, 0, 1, 0.4941176, 1,
-0.1437863, 0.8356887, -2.708573, 0, 1, 0.5019608, 1,
-0.143687, -2.475317, -2.224993, 0, 1, 0.509804, 1,
-0.1428696, -1.411661, -4.863844, 0, 1, 0.5137255, 1,
-0.1413958, -0.01632547, -0.7867399, 0, 1, 0.5215687, 1,
-0.140663, -0.3075469, -0.9237896, 0, 1, 0.5254902, 1,
-0.1393314, -0.3370705, -2.746463, 0, 1, 0.5333334, 1,
-0.1387323, -0.6095089, -2.887627, 0, 1, 0.5372549, 1,
-0.1374498, 0.3318375, 0.5082687, 0, 1, 0.5450981, 1,
-0.1325615, 0.02456657, 0.7633576, 0, 1, 0.5490196, 1,
-0.1286652, 0.6977906, -0.1912148, 0, 1, 0.5568628, 1,
-0.1190925, 1.65993, -1.782031, 0, 1, 0.5607843, 1,
-0.1159832, 0.3637404, -0.8639494, 0, 1, 0.5686275, 1,
-0.115227, 0.0278404, -2.310601, 0, 1, 0.572549, 1,
-0.1150905, 1.249171, 1.51811, 0, 1, 0.5803922, 1,
-0.1147892, -0.27772, -1.742614, 0, 1, 0.5843138, 1,
-0.1132836, 1.211471, -0.2281219, 0, 1, 0.5921569, 1,
-0.1124087, 0.4255612, 0.9312981, 0, 1, 0.5960785, 1,
-0.1121889, 0.6494239, 0.2231425, 0, 1, 0.6039216, 1,
-0.1112203, 0.1209704, -1.113379, 0, 1, 0.6117647, 1,
-0.1078772, -0.5715858, -2.696548, 0, 1, 0.6156863, 1,
-0.09923373, -0.4188462, -2.301569, 0, 1, 0.6235294, 1,
-0.09770277, 2.155279, 0.9738239, 0, 1, 0.627451, 1,
-0.09621385, -0.9123842, -1.471511, 0, 1, 0.6352941, 1,
-0.09469916, 0.9801856, -0.2128958, 0, 1, 0.6392157, 1,
-0.09342437, 0.6958369, -0.413457, 0, 1, 0.6470588, 1,
-0.09294493, 0.4466016, 1.438723, 0, 1, 0.6509804, 1,
-0.09210351, 1.214094, -0.1475375, 0, 1, 0.6588235, 1,
-0.08817009, -1.315812, -2.982528, 0, 1, 0.6627451, 1,
-0.08713339, -0.07004314, -2.893652, 0, 1, 0.6705883, 1,
-0.08533356, 1.68427, 0.4883817, 0, 1, 0.6745098, 1,
-0.08496132, 0.395566, 1.269006, 0, 1, 0.682353, 1,
-0.07193278, 0.144466, 0.3005809, 0, 1, 0.6862745, 1,
-0.06799892, 0.4483843, -1.181969, 0, 1, 0.6941177, 1,
-0.0669753, 1.162349, 0.4309393, 0, 1, 0.7019608, 1,
-0.06611934, -0.7579033, -3.222746, 0, 1, 0.7058824, 1,
-0.06306481, 1.088197, 1.297419, 0, 1, 0.7137255, 1,
-0.06211377, -2.531934, -3.724142, 0, 1, 0.7176471, 1,
-0.06183447, 0.4338204, 0.2255516, 0, 1, 0.7254902, 1,
-0.06066434, -0.3426904, -2.07005, 0, 1, 0.7294118, 1,
-0.05878911, -0.5055055, -3.508831, 0, 1, 0.7372549, 1,
-0.05729189, -1.756504, -3.648952, 0, 1, 0.7411765, 1,
-0.05677103, 0.4622911, -1.150887, 0, 1, 0.7490196, 1,
-0.05443714, -0.5799347, -2.494202, 0, 1, 0.7529412, 1,
-0.04998844, 1.040624, 2.443827, 0, 1, 0.7607843, 1,
-0.04995227, -2.046193, -3.324208, 0, 1, 0.7647059, 1,
-0.04283537, 1.020782, 1.86668, 0, 1, 0.772549, 1,
-0.04062296, 1.141728, -0.05497969, 0, 1, 0.7764706, 1,
-0.03906989, 0.467098, -1.433735, 0, 1, 0.7843137, 1,
-0.03011784, 0.4374045, -1.545782, 0, 1, 0.7882353, 1,
-0.02992125, 0.3871289, -0.3591487, 0, 1, 0.7960784, 1,
-0.02892885, -1.192066, -3.446434, 0, 1, 0.8039216, 1,
-0.02022067, 0.5949309, -0.9568323, 0, 1, 0.8078431, 1,
-0.01407961, 0.6113563, -0.2293799, 0, 1, 0.8156863, 1,
-0.01297938, 0.8349361, -0.03216269, 0, 1, 0.8196079, 1,
-0.01196413, -1.4563, -2.15809, 0, 1, 0.827451, 1,
-0.004156275, -0.340525, -2.533713, 0, 1, 0.8313726, 1,
0.0009365961, 1.834486, -0.7406703, 0, 1, 0.8392157, 1,
0.007600819, 0.3268611, -0.5443007, 0, 1, 0.8431373, 1,
0.008397819, -0.3760682, 2.428018, 0, 1, 0.8509804, 1,
0.01523604, -1.330593, 2.807223, 0, 1, 0.854902, 1,
0.01804744, -1.079225, 2.022747, 0, 1, 0.8627451, 1,
0.02035375, 1.763116, 1.460507, 0, 1, 0.8666667, 1,
0.02233794, -0.124872, 2.69246, 0, 1, 0.8745098, 1,
0.02576814, -0.4390373, 3.463654, 0, 1, 0.8784314, 1,
0.02593445, -0.3451673, 1.278609, 0, 1, 0.8862745, 1,
0.02692458, 1.504589, 0.1442045, 0, 1, 0.8901961, 1,
0.02929211, -0.03298771, 4.380582, 0, 1, 0.8980392, 1,
0.03045169, 0.8241098, 0.1656865, 0, 1, 0.9058824, 1,
0.03120276, 1.707449, -2.360426, 0, 1, 0.9098039, 1,
0.03767493, -0.6776291, 4.869474, 0, 1, 0.9176471, 1,
0.03788065, -0.01096348, 0.6974613, 0, 1, 0.9215686, 1,
0.038916, 0.5049549, -0.8045168, 0, 1, 0.9294118, 1,
0.04229972, -0.5161431, 4.726428, 0, 1, 0.9333333, 1,
0.04235546, 1.223459, -3.435741, 0, 1, 0.9411765, 1,
0.04607318, 1.41577, -1.566391, 0, 1, 0.945098, 1,
0.05064353, -0.04159835, 1.521899, 0, 1, 0.9529412, 1,
0.05141838, -1.644249, 2.511214, 0, 1, 0.9568627, 1,
0.05171586, -0.884053, 0.9029221, 0, 1, 0.9647059, 1,
0.05692627, -1.572598, 1.557027, 0, 1, 0.9686275, 1,
0.05753877, 0.3688862, 0.2096358, 0, 1, 0.9764706, 1,
0.0580048, 1.020982, -0.8400782, 0, 1, 0.9803922, 1,
0.06016776, 0.8435929, 0.01223873, 0, 1, 0.9882353, 1,
0.06198326, 2.350069, 1.96068, 0, 1, 0.9921569, 1,
0.06255822, -0.5768741, 2.429968, 0, 1, 1, 1,
0.06541368, -2.546122, 3.067562, 0, 0.9921569, 1, 1,
0.06942209, -0.1467342, 1.97218, 0, 0.9882353, 1, 1,
0.07022525, -0.1184507, 2.658556, 0, 0.9803922, 1, 1,
0.0703622, 0.6390131, 0.5585494, 0, 0.9764706, 1, 1,
0.07379945, 0.4074549, 0.01189362, 0, 0.9686275, 1, 1,
0.0759614, -0.5339882, 1.243029, 0, 0.9647059, 1, 1,
0.07824751, 0.03539015, 1.048389, 0, 0.9568627, 1, 1,
0.07854161, 1.013252, -1.423928, 0, 0.9529412, 1, 1,
0.08020604, 2.062412, 0.3200291, 0, 0.945098, 1, 1,
0.09248052, -1.626806, 3.515659, 0, 0.9411765, 1, 1,
0.09252382, 0.4372918, -0.7516139, 0, 0.9333333, 1, 1,
0.0929143, -0.2727874, 2.4083, 0, 0.9294118, 1, 1,
0.09397766, 1.038266, 0.50748, 0, 0.9215686, 1, 1,
0.09925367, -0.1190756, 2.213737, 0, 0.9176471, 1, 1,
0.1001601, -0.2808385, 2.461347, 0, 0.9098039, 1, 1,
0.100614, -1.083122, 3.32803, 0, 0.9058824, 1, 1,
0.102835, -0.2808458, 3.98022, 0, 0.8980392, 1, 1,
0.103242, -0.5383387, 0.8520743, 0, 0.8901961, 1, 1,
0.1043665, -0.2406959, 4.15912, 0, 0.8862745, 1, 1,
0.1071604, 1.68292, -0.1911005, 0, 0.8784314, 1, 1,
0.1094736, -1.414423, 2.723337, 0, 0.8745098, 1, 1,
0.1100472, -0.07027417, 0.2056985, 0, 0.8666667, 1, 1,
0.1132939, 0.7903628, 1.660641, 0, 0.8627451, 1, 1,
0.1135004, -0.9010402, 1.844118, 0, 0.854902, 1, 1,
0.1168106, -0.06958684, 1.906188, 0, 0.8509804, 1, 1,
0.1181609, -0.4098515, 2.199799, 0, 0.8431373, 1, 1,
0.1218508, 0.05296529, 1.901167, 0, 0.8392157, 1, 1,
0.1267033, 0.4124695, 0.4526223, 0, 0.8313726, 1, 1,
0.1293675, -0.8325654, 5.116487, 0, 0.827451, 1, 1,
0.1304126, -0.1572786, 3.020205, 0, 0.8196079, 1, 1,
0.1339356, 1.721953, 0.8202034, 0, 0.8156863, 1, 1,
0.1365272, -0.6786124, 2.152407, 0, 0.8078431, 1, 1,
0.1375726, -0.06749143, 3.705673, 0, 0.8039216, 1, 1,
0.1399981, 0.1153665, 2.327459, 0, 0.7960784, 1, 1,
0.1436525, -0.08482274, 0.5879028, 0, 0.7882353, 1, 1,
0.1461307, 1.159107, -0.6336578, 0, 0.7843137, 1, 1,
0.148629, 0.1241498, 1.148124, 0, 0.7764706, 1, 1,
0.1490871, -0.3465092, 0.8529444, 0, 0.772549, 1, 1,
0.1524665, -1.231734, 3.589849, 0, 0.7647059, 1, 1,
0.1540212, -0.998885, 4.002164, 0, 0.7607843, 1, 1,
0.1556952, 0.1279341, 2.323439, 0, 0.7529412, 1, 1,
0.1568902, 0.4355856, 0.3406596, 0, 0.7490196, 1, 1,
0.1572725, -1.518328, 2.513859, 0, 0.7411765, 1, 1,
0.1600035, 0.6886095, 1.236357, 0, 0.7372549, 1, 1,
0.1609137, 0.9616944, -2.634656, 0, 0.7294118, 1, 1,
0.1617033, -1.224183, 1.931918, 0, 0.7254902, 1, 1,
0.1635242, 0.8213716, -0.381347, 0, 0.7176471, 1, 1,
0.1653349, 0.959142, -0.360979, 0, 0.7137255, 1, 1,
0.1676937, -0.2959002, 3.572246, 0, 0.7058824, 1, 1,
0.1687859, 1.019021, 0.2419627, 0, 0.6980392, 1, 1,
0.1695465, -0.0004617984, 0.8568364, 0, 0.6941177, 1, 1,
0.1730467, 2.167426, -0.4097496, 0, 0.6862745, 1, 1,
0.180607, 0.4817381, 1.166007, 0, 0.682353, 1, 1,
0.1809882, -0.3477309, 3.592899, 0, 0.6745098, 1, 1,
0.182215, 0.09033386, 1.78857, 0, 0.6705883, 1, 1,
0.1833452, 0.6717392, -0.01314067, 0, 0.6627451, 1, 1,
0.1882758, 0.9875997, 1.510806, 0, 0.6588235, 1, 1,
0.1897483, 0.6803993, 1.864419, 0, 0.6509804, 1, 1,
0.1906436, -0.2529354, 4.591814, 0, 0.6470588, 1, 1,
0.1948863, 0.1375979, 1.828124, 0, 0.6392157, 1, 1,
0.1959532, 0.09874188, 0.1459306, 0, 0.6352941, 1, 1,
0.1971465, 0.04294772, 0.7996711, 0, 0.627451, 1, 1,
0.1981563, 0.6843811, -1.14091, 0, 0.6235294, 1, 1,
0.2002722, 1.054679, 0.457298, 0, 0.6156863, 1, 1,
0.2006247, 0.03930686, 0.7928722, 0, 0.6117647, 1, 1,
0.2011529, -2.450843, 2.058014, 0, 0.6039216, 1, 1,
0.2025771, 0.1796591, 2.617971, 0, 0.5960785, 1, 1,
0.2072185, 0.7858294, 0.5513347, 0, 0.5921569, 1, 1,
0.2101313, 1.970449, -1.694282, 0, 0.5843138, 1, 1,
0.2107387, 2.330181, -1.313831, 0, 0.5803922, 1, 1,
0.2136751, -0.3693906, 1.10562, 0, 0.572549, 1, 1,
0.2144564, 1.16204, 0.03761964, 0, 0.5686275, 1, 1,
0.2147038, -0.0953782, 0.9120355, 0, 0.5607843, 1, 1,
0.2181174, 0.1835464, -0.5441443, 0, 0.5568628, 1, 1,
0.2192702, -0.4421592, 2.26973, 0, 0.5490196, 1, 1,
0.2208031, 0.7399145, -0.07511098, 0, 0.5450981, 1, 1,
0.2215523, 1.287614, 0.9487062, 0, 0.5372549, 1, 1,
0.225635, 0.7755412, 0.0923044, 0, 0.5333334, 1, 1,
0.2270061, -0.4183365, 1.94547, 0, 0.5254902, 1, 1,
0.2283691, 0.9552492, 0.935411, 0, 0.5215687, 1, 1,
0.2288331, -0.9890572, 3.988689, 0, 0.5137255, 1, 1,
0.2293381, -2.522094, 2.468885, 0, 0.509804, 1, 1,
0.2304363, -1.092529, 3.540523, 0, 0.5019608, 1, 1,
0.2330311, -0.4695358, 3.457638, 0, 0.4941176, 1, 1,
0.2333145, -0.7799923, 2.97391, 0, 0.4901961, 1, 1,
0.2337905, 0.8110957, 0.6594914, 0, 0.4823529, 1, 1,
0.234541, -0.5771098, 3.037664, 0, 0.4784314, 1, 1,
0.2406096, -0.7982531, 3.422126, 0, 0.4705882, 1, 1,
0.2408505, -0.2703782, 1.398369, 0, 0.4666667, 1, 1,
0.2424036, 0.6997693, 0.27756, 0, 0.4588235, 1, 1,
0.2431985, -1.264333, 2.44464, 0, 0.454902, 1, 1,
0.2467573, -1.678563, 3.257779, 0, 0.4470588, 1, 1,
0.250898, 0.04805043, 2.238252, 0, 0.4431373, 1, 1,
0.2514177, 1.134961, 0.1451131, 0, 0.4352941, 1, 1,
0.2527482, -0.4965176, 1.909338, 0, 0.4313726, 1, 1,
0.2538332, -2.315961, 2.231719, 0, 0.4235294, 1, 1,
0.2570584, -1.062577, 3.471136, 0, 0.4196078, 1, 1,
0.2586418, -0.7146741, 3.048233, 0, 0.4117647, 1, 1,
0.2618909, -0.757387, 3.530467, 0, 0.4078431, 1, 1,
0.2628498, -0.3417526, 2.300168, 0, 0.4, 1, 1,
0.2640484, -1.884736, 3.473151, 0, 0.3921569, 1, 1,
0.2715116, 1.741158, -0.1461177, 0, 0.3882353, 1, 1,
0.2729451, 1.10755, 0.404894, 0, 0.3803922, 1, 1,
0.2786146, 0.1193228, 0.6928816, 0, 0.3764706, 1, 1,
0.2796121, -0.5551019, 2.435107, 0, 0.3686275, 1, 1,
0.2828137, -0.07211241, 1.469888, 0, 0.3647059, 1, 1,
0.2848134, 0.6868686, 0.9518555, 0, 0.3568628, 1, 1,
0.2908917, -0.01348138, 2.631494, 0, 0.3529412, 1, 1,
0.2928704, 0.3504983, -0.6861457, 0, 0.345098, 1, 1,
0.2957873, 0.7654309, -0.51022, 0, 0.3411765, 1, 1,
0.295799, 0.4755841, -0.5866005, 0, 0.3333333, 1, 1,
0.2971241, -0.3323386, 1.524348, 0, 0.3294118, 1, 1,
0.3018143, 1.299391, -0.4432816, 0, 0.3215686, 1, 1,
0.3028053, -0.3205974, 2.643287, 0, 0.3176471, 1, 1,
0.3029018, -0.2820384, 1.779828, 0, 0.3098039, 1, 1,
0.3048966, -3.641743, 4.036408, 0, 0.3058824, 1, 1,
0.3070084, 0.9317418, 0.7222681, 0, 0.2980392, 1, 1,
0.3077015, -0.6281056, 3.876603, 0, 0.2901961, 1, 1,
0.3099491, 0.7728755, -0.6851532, 0, 0.2862745, 1, 1,
0.3119438, -1.656313, 3.883463, 0, 0.2784314, 1, 1,
0.3128404, -0.3042313, 1.097534, 0, 0.2745098, 1, 1,
0.3138785, -0.8441578, 2.282993, 0, 0.2666667, 1, 1,
0.3154697, -0.7081876, 2.418798, 0, 0.2627451, 1, 1,
0.3178628, 0.8739026, -0.1459482, 0, 0.254902, 1, 1,
0.3180842, -0.6753769, 2.080362, 0, 0.2509804, 1, 1,
0.3216585, 0.9369835, -0.609931, 0, 0.2431373, 1, 1,
0.3227452, -1.785176, 4.008255, 0, 0.2392157, 1, 1,
0.3237799, 1.587433, -0.1025819, 0, 0.2313726, 1, 1,
0.3257528, 0.3543375, -0.461136, 0, 0.227451, 1, 1,
0.3265746, -0.2637949, 2.895766, 0, 0.2196078, 1, 1,
0.3273512, -0.8380958, 2.483302, 0, 0.2156863, 1, 1,
0.3323107, 1.470887, 1.628446, 0, 0.2078431, 1, 1,
0.3331982, -1.048134, 3.137293, 0, 0.2039216, 1, 1,
0.33563, 0.4218432, -0.8540736, 0, 0.1960784, 1, 1,
0.3379863, -0.5105949, 1.33717, 0, 0.1882353, 1, 1,
0.3419381, 0.9041784, 0.255661, 0, 0.1843137, 1, 1,
0.3441015, -0.147919, 2.458016, 0, 0.1764706, 1, 1,
0.3442431, -1.486113, 2.737946, 0, 0.172549, 1, 1,
0.3456621, 1.007191, 0.02217212, 0, 0.1647059, 1, 1,
0.3524617, -0.8297412, 1.46292, 0, 0.1607843, 1, 1,
0.3535418, 0.6725699, 1.077027, 0, 0.1529412, 1, 1,
0.3542242, 0.04558662, 2.585739, 0, 0.1490196, 1, 1,
0.3545487, -1.4013, 3.813625, 0, 0.1411765, 1, 1,
0.3554537, 0.0006605179, 2.137117, 0, 0.1372549, 1, 1,
0.3587774, -0.6059602, 2.628817, 0, 0.1294118, 1, 1,
0.3590209, 0.2094094, 0.8673942, 0, 0.1254902, 1, 1,
0.3590839, -1.476152, 4.067194, 0, 0.1176471, 1, 1,
0.3597527, -1.351369, 4.42198, 0, 0.1137255, 1, 1,
0.3667853, -0.3859095, 2.294208, 0, 0.1058824, 1, 1,
0.3681626, -0.7400231, 1.596549, 0, 0.09803922, 1, 1,
0.3690676, -0.9989851, 1.192638, 0, 0.09411765, 1, 1,
0.3696843, -0.3007936, 5.522673, 0, 0.08627451, 1, 1,
0.3769453, -0.4622152, 3.282051, 0, 0.08235294, 1, 1,
0.3776477, 2.006516, 0.1583047, 0, 0.07450981, 1, 1,
0.3779982, -0.6921883, 1.56472, 0, 0.07058824, 1, 1,
0.3786123, -1.135028, 4.05784, 0, 0.0627451, 1, 1,
0.3796744, 0.5069168, -0.6205449, 0, 0.05882353, 1, 1,
0.3824582, -0.06960939, 3.354589, 0, 0.05098039, 1, 1,
0.3853233, -0.2814148, 2.976595, 0, 0.04705882, 1, 1,
0.3896353, -0.1785867, 1.603202, 0, 0.03921569, 1, 1,
0.3990765, -0.8373463, 2.47159, 0, 0.03529412, 1, 1,
0.420058, 0.6928138, 0.966615, 0, 0.02745098, 1, 1,
0.4229738, -0.002289997, 2.655361, 0, 0.02352941, 1, 1,
0.4287669, -0.03467461, 0.6807585, 0, 0.01568628, 1, 1,
0.4293704, 1.593358, 1.112879, 0, 0.01176471, 1, 1,
0.4321844, -0.8051027, 2.805119, 0, 0.003921569, 1, 1,
0.436379, -0.3904622, 1.557912, 0.003921569, 0, 1, 1,
0.4371811, -1.65194, 1.730651, 0.007843138, 0, 1, 1,
0.4391689, -0.3954512, 3.170301, 0.01568628, 0, 1, 1,
0.4394958, 0.7750118, 0.7805467, 0.01960784, 0, 1, 1,
0.4404924, 0.06259016, 1.635235, 0.02745098, 0, 1, 1,
0.4417538, 0.0729158, 0.2776196, 0.03137255, 0, 1, 1,
0.4502919, -0.6402301, 2.056062, 0.03921569, 0, 1, 1,
0.4515319, 1.128608, 1.115306, 0.04313726, 0, 1, 1,
0.4530204, 0.1192374, -0.1485866, 0.05098039, 0, 1, 1,
0.4538972, 0.08771001, 2.936912, 0.05490196, 0, 1, 1,
0.4538981, 0.8019674, 0.9698905, 0.0627451, 0, 1, 1,
0.4564633, 0.5751629, 2.003494, 0.06666667, 0, 1, 1,
0.457857, 0.2270762, 1.502144, 0.07450981, 0, 1, 1,
0.4580409, -0.5380117, 3.179839, 0.07843138, 0, 1, 1,
0.4616418, -0.01416029, 4.058342, 0.08627451, 0, 1, 1,
0.4630144, 2.205104, 1.090016, 0.09019608, 0, 1, 1,
0.47035, 0.8528, -0.2135572, 0.09803922, 0, 1, 1,
0.4744009, 0.5367482, 1.986971, 0.1058824, 0, 1, 1,
0.4883819, 0.8557547, 0.2428689, 0.1098039, 0, 1, 1,
0.4913405, -0.4571449, 0.005745852, 0.1176471, 0, 1, 1,
0.4948536, -0.2781689, 1.295253, 0.1215686, 0, 1, 1,
0.4949659, 0.09970591, 2.489386, 0.1294118, 0, 1, 1,
0.498745, 0.3938361, 2.34197, 0.1333333, 0, 1, 1,
0.4989413, -1.164509, 3.572995, 0.1411765, 0, 1, 1,
0.5044593, 0.1914985, 0.714948, 0.145098, 0, 1, 1,
0.5057015, -0.639393, 2.860178, 0.1529412, 0, 1, 1,
0.5145494, -1.178303, 2.382507, 0.1568628, 0, 1, 1,
0.5203438, -1.533099, 1.964823, 0.1647059, 0, 1, 1,
0.5279546, -0.4172819, 1.420125, 0.1686275, 0, 1, 1,
0.5399791, -1.763817, 2.37388, 0.1764706, 0, 1, 1,
0.5443037, 0.1956769, 1.346791, 0.1803922, 0, 1, 1,
0.5452268, 0.7035752, -0.4705457, 0.1882353, 0, 1, 1,
0.5614527, -0.8304301, 0.8439582, 0.1921569, 0, 1, 1,
0.5626888, -0.1733388, 1.613865, 0.2, 0, 1, 1,
0.5714045, 0.9246306, 1.750524, 0.2078431, 0, 1, 1,
0.5760195, 0.3250111, 2.118061, 0.2117647, 0, 1, 1,
0.5789635, 0.5187678, 1.980802, 0.2196078, 0, 1, 1,
0.5837946, -1.904514, 3.318484, 0.2235294, 0, 1, 1,
0.5897979, 1.270592, -0.2199652, 0.2313726, 0, 1, 1,
0.590611, 0.05508806, 1.78411, 0.2352941, 0, 1, 1,
0.5999078, -0.2198166, 2.165337, 0.2431373, 0, 1, 1,
0.6043751, 1.179722, -0.3017553, 0.2470588, 0, 1, 1,
0.6089681, 1.070375, -0.1941632, 0.254902, 0, 1, 1,
0.610801, -2.191675, 1.832808, 0.2588235, 0, 1, 1,
0.6160542, 0.6011653, 0.7427034, 0.2666667, 0, 1, 1,
0.6162427, -1.559043, 2.747106, 0.2705882, 0, 1, 1,
0.6188381, 0.8704591, -1.327882, 0.2784314, 0, 1, 1,
0.6291355, 1.93571, 0.451827, 0.282353, 0, 1, 1,
0.6302917, -0.1528044, 1.494329, 0.2901961, 0, 1, 1,
0.6328254, 2.426522, -0.9860229, 0.2941177, 0, 1, 1,
0.6333328, -0.1013925, 1.18957, 0.3019608, 0, 1, 1,
0.6350914, 1.551995, 0.9396105, 0.3098039, 0, 1, 1,
0.6352773, 0.08206739, 0.3252256, 0.3137255, 0, 1, 1,
0.6404124, -0.9551836, 4.179817, 0.3215686, 0, 1, 1,
0.6408879, -0.01296872, 2.260141, 0.3254902, 0, 1, 1,
0.6443434, 1.347541, -0.6528518, 0.3333333, 0, 1, 1,
0.6487654, 1.103594, -0.01414415, 0.3372549, 0, 1, 1,
0.6645908, -0.5112321, 1.535479, 0.345098, 0, 1, 1,
0.6646917, -0.2133266, 0.3710081, 0.3490196, 0, 1, 1,
0.6656705, -0.8548378, 0.0117337, 0.3568628, 0, 1, 1,
0.6663775, -0.5364939, 2.740122, 0.3607843, 0, 1, 1,
0.6691943, 0.528744, 1.350603, 0.3686275, 0, 1, 1,
0.6728765, -0.7374735, 1.567574, 0.372549, 0, 1, 1,
0.6768684, 1.335768, 0.9697819, 0.3803922, 0, 1, 1,
0.6769769, 0.7737743, 0.978883, 0.3843137, 0, 1, 1,
0.677797, -0.3453173, 3.501428, 0.3921569, 0, 1, 1,
0.6780207, -3.568315, 2.773931, 0.3960784, 0, 1, 1,
0.6781524, 1.841589, 0.2709651, 0.4039216, 0, 1, 1,
0.6800607, 0.3352975, -0.6971045, 0.4117647, 0, 1, 1,
0.6821737, -0.8877681, 2.956339, 0.4156863, 0, 1, 1,
0.6856353, -0.9097062, 2.007365, 0.4235294, 0, 1, 1,
0.6882164, -0.02701928, 1.638011, 0.427451, 0, 1, 1,
0.6943925, -0.6218818, 4.230501, 0.4352941, 0, 1, 1,
0.6964884, -2.332279, 3.514247, 0.4392157, 0, 1, 1,
0.696686, 0.917793, -0.9937938, 0.4470588, 0, 1, 1,
0.6969838, -0.3331328, 2.667876, 0.4509804, 0, 1, 1,
0.704863, -0.6156009, 1.792972, 0.4588235, 0, 1, 1,
0.710857, 0.5051717, 1.391559, 0.4627451, 0, 1, 1,
0.7114018, 0.4464922, 1.90893, 0.4705882, 0, 1, 1,
0.7127784, 1.617186, 0.2320014, 0.4745098, 0, 1, 1,
0.7133551, -0.3691154, 3.146334, 0.4823529, 0, 1, 1,
0.7145504, -0.5072858, 1.371346, 0.4862745, 0, 1, 1,
0.7178448, -0.6718159, 2.312265, 0.4941176, 0, 1, 1,
0.7218052, -0.9375561, 2.559658, 0.5019608, 0, 1, 1,
0.7220692, -0.8318914, 2.225901, 0.5058824, 0, 1, 1,
0.7228214, 1.186889, -0.3614607, 0.5137255, 0, 1, 1,
0.724148, 1.658364, 1.712626, 0.5176471, 0, 1, 1,
0.7280965, 0.9678695, -1.827665, 0.5254902, 0, 1, 1,
0.7302018, -0.6307102, 2.887696, 0.5294118, 0, 1, 1,
0.7386559, 0.1587283, 1.303633, 0.5372549, 0, 1, 1,
0.7447971, 0.3775595, 0.9895252, 0.5411765, 0, 1, 1,
0.7465578, -0.3691662, 0.837734, 0.5490196, 0, 1, 1,
0.752697, 0.3520816, 0.4317345, 0.5529412, 0, 1, 1,
0.7548617, -1.122663, 2.3891, 0.5607843, 0, 1, 1,
0.7587371, -1.731732, 3.771338, 0.5647059, 0, 1, 1,
0.7599092, -0.2000723, 2.817434, 0.572549, 0, 1, 1,
0.7634014, 1.73019, 0.959457, 0.5764706, 0, 1, 1,
0.7652786, -0.240903, 1.50253, 0.5843138, 0, 1, 1,
0.7661329, -0.1589238, 0.7085632, 0.5882353, 0, 1, 1,
0.766724, -0.1921649, 1.344031, 0.5960785, 0, 1, 1,
0.7754664, 0.640221, 0.8364636, 0.6039216, 0, 1, 1,
0.7797299, -0.6519459, 1.179568, 0.6078432, 0, 1, 1,
0.7817774, 1.02775, 0.1369785, 0.6156863, 0, 1, 1,
0.7853154, 0.574867, 1.826725, 0.6196079, 0, 1, 1,
0.7901309, -0.08243313, 1.915759, 0.627451, 0, 1, 1,
0.7939125, -1.40718, 2.874677, 0.6313726, 0, 1, 1,
0.7964529, -2.028674, 1.370902, 0.6392157, 0, 1, 1,
0.79693, -0.6176203, 1.075673, 0.6431373, 0, 1, 1,
0.7981844, 1.605884, 0.8909094, 0.6509804, 0, 1, 1,
0.7988746, -0.9728646, 3.366717, 0.654902, 0, 1, 1,
0.7993945, -0.2390453, 2.222696, 0.6627451, 0, 1, 1,
0.7998077, 1.18166, 1.284412, 0.6666667, 0, 1, 1,
0.8000987, 0.6633232, 1.149965, 0.6745098, 0, 1, 1,
0.8012657, 0.007707037, -0.1135888, 0.6784314, 0, 1, 1,
0.8020142, -1.477399, 4.180989, 0.6862745, 0, 1, 1,
0.8052503, 2.302097, -0.2910429, 0.6901961, 0, 1, 1,
0.8188684, -0.09825246, 2.196194, 0.6980392, 0, 1, 1,
0.8212107, -0.3173666, 2.267603, 0.7058824, 0, 1, 1,
0.8215642, -0.1930624, 1.178434, 0.7098039, 0, 1, 1,
0.8227348, 0.3730909, 0.8590189, 0.7176471, 0, 1, 1,
0.8270304, -0.4851972, 1.674993, 0.7215686, 0, 1, 1,
0.8302761, 0.5786851, 1.728785, 0.7294118, 0, 1, 1,
0.8312318, 2.9124, -0.0115549, 0.7333333, 0, 1, 1,
0.8394222, 0.6489251, -0.02600088, 0.7411765, 0, 1, 1,
0.8422335, 2.039427, -0.3723484, 0.7450981, 0, 1, 1,
0.8445746, -0.8137401, 2.335131, 0.7529412, 0, 1, 1,
0.8446151, -0.5057399, 2.201884, 0.7568628, 0, 1, 1,
0.8479574, 0.6078026, 0.6346592, 0.7647059, 0, 1, 1,
0.8490264, -2.23685, 2.201427, 0.7686275, 0, 1, 1,
0.8492528, -0.01426642, 1.720767, 0.7764706, 0, 1, 1,
0.8598512, 0.3184128, 1.34785, 0.7803922, 0, 1, 1,
0.8625838, 1.41786, 1.209433, 0.7882353, 0, 1, 1,
0.8632737, 0.9289713, -0.1259299, 0.7921569, 0, 1, 1,
0.8637225, -0.7336138, 1.120221, 0.8, 0, 1, 1,
0.8646379, 1.466327, 0.2871764, 0.8078431, 0, 1, 1,
0.8661566, -0.3976812, 1.894811, 0.8117647, 0, 1, 1,
0.8665761, -3.112269, 2.700646, 0.8196079, 0, 1, 1,
0.8759964, 0.1712128, 1.642671, 0.8235294, 0, 1, 1,
0.8766526, 0.2970174, 0.687197, 0.8313726, 0, 1, 1,
0.8767985, 2.076756, -0.8090439, 0.8352941, 0, 1, 1,
0.8815425, -0.4654311, 1.421405, 0.8431373, 0, 1, 1,
0.892002, 1.536584, 2.450428, 0.8470588, 0, 1, 1,
0.8954954, -0.03316825, 1.344545, 0.854902, 0, 1, 1,
0.8991091, 1.670063, 0.150753, 0.8588235, 0, 1, 1,
0.9007019, 0.377162, 2.766748, 0.8666667, 0, 1, 1,
0.9015273, 0.9176136, 0.4980237, 0.8705882, 0, 1, 1,
0.9046556, -1.158562, 2.064598, 0.8784314, 0, 1, 1,
0.9048572, -0.4598008, 0.534954, 0.8823529, 0, 1, 1,
0.9067042, -1.265161, 2.943939, 0.8901961, 0, 1, 1,
0.9179649, 1.149429, 1.337334, 0.8941177, 0, 1, 1,
0.9218481, -1.016032, 1.575199, 0.9019608, 0, 1, 1,
0.9243594, -0.1998143, 2.238027, 0.9098039, 0, 1, 1,
0.9286911, -1.401187, 2.964339, 0.9137255, 0, 1, 1,
0.9291206, -2.032356, 1.6167, 0.9215686, 0, 1, 1,
0.9327769, -0.04688081, 0.6454465, 0.9254902, 0, 1, 1,
0.9421843, 0.07009717, 2.809467, 0.9333333, 0, 1, 1,
0.9587715, -0.5433402, 0.972657, 0.9372549, 0, 1, 1,
0.9618388, -0.03381182, 0.8186423, 0.945098, 0, 1, 1,
0.9628932, 0.8833045, -0.19668, 0.9490196, 0, 1, 1,
0.964309, 0.4557784, 0.5820205, 0.9568627, 0, 1, 1,
0.9651144, 1.648265, 2.370459, 0.9607843, 0, 1, 1,
0.9658267, -0.008034991, 2.415303, 0.9686275, 0, 1, 1,
0.9748743, 0.4765996, 0.1611525, 0.972549, 0, 1, 1,
0.9757124, 1.64014, 0.9929277, 0.9803922, 0, 1, 1,
0.97945, -2.896233, 1.839353, 0.9843137, 0, 1, 1,
0.9802855, -1.554897, 2.711141, 0.9921569, 0, 1, 1,
0.9877087, -0.4664747, 2.470963, 0.9960784, 0, 1, 1,
0.9945161, -1.825908, 1.964053, 1, 0, 0.9960784, 1,
0.998045, -0.1019555, 1.428799, 1, 0, 0.9882353, 1,
1.005355, 2.81123, 2.226682, 1, 0, 0.9843137, 1,
1.010211, -0.2518989, 1.514689, 1, 0, 0.9764706, 1,
1.015776, -1.158913, 2.296801, 1, 0, 0.972549, 1,
1.019066, -1.079258, 1.731174, 1, 0, 0.9647059, 1,
1.020202, -0.0911025, 0.8920009, 1, 0, 0.9607843, 1,
1.027014, -1.480023, 4.426349, 1, 0, 0.9529412, 1,
1.031544, -0.740158, 1.422253, 1, 0, 0.9490196, 1,
1.032074, 0.4492447, -0.6549965, 1, 0, 0.9411765, 1,
1.033103, 0.7376831, 0.5951127, 1, 0, 0.9372549, 1,
1.042867, 0.7857159, 0.878994, 1, 0, 0.9294118, 1,
1.043109, 1.378684, 0.2991691, 1, 0, 0.9254902, 1,
1.046863, -0.4595197, 1.93971, 1, 0, 0.9176471, 1,
1.048492, -0.08502391, 1.761802, 1, 0, 0.9137255, 1,
1.054247, -0.9009656, 0.01160607, 1, 0, 0.9058824, 1,
1.055563, 1.705919, 1.37973, 1, 0, 0.9019608, 1,
1.056258, 0.6011639, -0.2145158, 1, 0, 0.8941177, 1,
1.062318, 1.003136, 0.2473335, 1, 0, 0.8862745, 1,
1.062579, 0.1655151, 0.6877843, 1, 0, 0.8823529, 1,
1.063534, -1.55992, 2.85819, 1, 0, 0.8745098, 1,
1.075836, -0.4620344, 2.96873, 1, 0, 0.8705882, 1,
1.076628, -0.9462572, 4.639576, 1, 0, 0.8627451, 1,
1.084636, 1.313472, 1.673307, 1, 0, 0.8588235, 1,
1.08694, -0.1142795, 1.681332, 1, 0, 0.8509804, 1,
1.088288, 0.445073, 0.9622211, 1, 0, 0.8470588, 1,
1.090394, 1.086636, 1.793496, 1, 0, 0.8392157, 1,
1.091652, -0.1835603, 2.728768, 1, 0, 0.8352941, 1,
1.102231, 1.185448, 0.2823336, 1, 0, 0.827451, 1,
1.102335, -0.4150031, 0.9500564, 1, 0, 0.8235294, 1,
1.104533, -1.42326, 1.440655, 1, 0, 0.8156863, 1,
1.135667, 0.3640255, 0.3612039, 1, 0, 0.8117647, 1,
1.136923, -3.161343, 2.998963, 1, 0, 0.8039216, 1,
1.14011, 0.3506854, 0.8470304, 1, 0, 0.7960784, 1,
1.144117, -0.2138547, 0.1565939, 1, 0, 0.7921569, 1,
1.145579, -0.7204004, 1.402542, 1, 0, 0.7843137, 1,
1.155067, -1.034398, 2.955079, 1, 0, 0.7803922, 1,
1.16273, -0.3021058, -1.513581, 1, 0, 0.772549, 1,
1.163419, -0.6880798, 1.243776, 1, 0, 0.7686275, 1,
1.169212, 0.5104345, 0.2719221, 1, 0, 0.7607843, 1,
1.169363, -0.9002034, 1.475862, 1, 0, 0.7568628, 1,
1.170166, -0.2316673, 1.042661, 1, 0, 0.7490196, 1,
1.174396, -2.348185, 3.159129, 1, 0, 0.7450981, 1,
1.180455, 0.500479, 0.8506446, 1, 0, 0.7372549, 1,
1.181271, 0.1173685, 1.811673, 1, 0, 0.7333333, 1,
1.183533, -0.563824, 1.508736, 1, 0, 0.7254902, 1,
1.187521, 1.166182, 2.60035, 1, 0, 0.7215686, 1,
1.190973, -1.260322, 3.245739, 1, 0, 0.7137255, 1,
1.192477, 0.6591681, 2.228299, 1, 0, 0.7098039, 1,
1.198463, 0.392016, 1.765092, 1, 0, 0.7019608, 1,
1.199042, 0.6837965, 1.601369, 1, 0, 0.6941177, 1,
1.199691, 0.08742031, 2.752854, 1, 0, 0.6901961, 1,
1.201284, 0.3716809, -0.6511466, 1, 0, 0.682353, 1,
1.201977, -0.6350222, 3.126565, 1, 0, 0.6784314, 1,
1.204176, -1.180971, 1.335991, 1, 0, 0.6705883, 1,
1.215652, 0.9245313, -0.2872553, 1, 0, 0.6666667, 1,
1.218476, 0.14929, 2.661892, 1, 0, 0.6588235, 1,
1.220463, -1.678477, 2.796188, 1, 0, 0.654902, 1,
1.223992, -0.4275918, 3.507286, 1, 0, 0.6470588, 1,
1.235617, 0.9025962, 2.025489, 1, 0, 0.6431373, 1,
1.238612, -1.25308, 5.373685, 1, 0, 0.6352941, 1,
1.241533, -0.9575141, 2.081105, 1, 0, 0.6313726, 1,
1.252116, -0.6738132, 2.937243, 1, 0, 0.6235294, 1,
1.252553, 1.52768, -0.130949, 1, 0, 0.6196079, 1,
1.262862, 1.538301, 0.5154212, 1, 0, 0.6117647, 1,
1.264548, -0.2378266, 1.809483, 1, 0, 0.6078432, 1,
1.2657, 0.06446756, 2.224709, 1, 0, 0.6, 1,
1.287344, -1.427738, 1.400711, 1, 0, 0.5921569, 1,
1.291853, -0.7337788, 2.157258, 1, 0, 0.5882353, 1,
1.294953, -1.507341, 0.3049713, 1, 0, 0.5803922, 1,
1.310879, -0.4400801, 3.324442, 1, 0, 0.5764706, 1,
1.313016, -0.3768509, 1.465058, 1, 0, 0.5686275, 1,
1.314984, 2.557764, 1.858419, 1, 0, 0.5647059, 1,
1.326158, 1.689734, -0.2757372, 1, 0, 0.5568628, 1,
1.32752, 0.5814688, 1.910957, 1, 0, 0.5529412, 1,
1.336701, 1.023869, 0.585187, 1, 0, 0.5450981, 1,
1.346832, -0.3400364, 1.157984, 1, 0, 0.5411765, 1,
1.348978, -0.8202644, 2.457891, 1, 0, 0.5333334, 1,
1.355894, 0.9721475, -0.05221031, 1, 0, 0.5294118, 1,
1.356461, -0.9385492, 1.593108, 1, 0, 0.5215687, 1,
1.364851, -0.03190047, 1.775172, 1, 0, 0.5176471, 1,
1.370987, 1.114506, 0.7831923, 1, 0, 0.509804, 1,
1.377981, 0.4782859, 2.276642, 1, 0, 0.5058824, 1,
1.383561, -0.4976051, 2.436795, 1, 0, 0.4980392, 1,
1.385617, 0.7730181, -0.3199012, 1, 0, 0.4901961, 1,
1.385762, -0.02231481, 2.135285, 1, 0, 0.4862745, 1,
1.386913, 0.2518882, 1.901497, 1, 0, 0.4784314, 1,
1.400304, -1.375784, 2.739328, 1, 0, 0.4745098, 1,
1.407051, -0.868347, 1.942878, 1, 0, 0.4666667, 1,
1.417524, 0.469234, 0.1404294, 1, 0, 0.4627451, 1,
1.420079, -0.006771612, 1.204842, 1, 0, 0.454902, 1,
1.438955, 0.9560736, -0.3293625, 1, 0, 0.4509804, 1,
1.44899, -1.432703, 0.6660834, 1, 0, 0.4431373, 1,
1.457222, 2.566818, 0.3397549, 1, 0, 0.4392157, 1,
1.461499, 2.016533, -0.3632119, 1, 0, 0.4313726, 1,
1.467211, 0.2342269, 2.764404, 1, 0, 0.427451, 1,
1.488777, -0.01451669, 0.9205, 1, 0, 0.4196078, 1,
1.494485, -0.7419221, 2.685526, 1, 0, 0.4156863, 1,
1.524224, 0.02985065, 3.775864, 1, 0, 0.4078431, 1,
1.535019, -0.1710492, 1.608115, 1, 0, 0.4039216, 1,
1.535693, 0.5446957, 0.5605243, 1, 0, 0.3960784, 1,
1.53864, 0.6240127, 1.173071, 1, 0, 0.3882353, 1,
1.558235, -1.200134, 2.220065, 1, 0, 0.3843137, 1,
1.561832, 1.329898, 2.007143, 1, 0, 0.3764706, 1,
1.57708, -0.06905874, 1.745136, 1, 0, 0.372549, 1,
1.579413, 1.228875, 0.5129979, 1, 0, 0.3647059, 1,
1.588761, 0.03099515, 1.317216, 1, 0, 0.3607843, 1,
1.590415, 0.7125097, 1.925858, 1, 0, 0.3529412, 1,
1.591503, -0.6256019, 0.5528941, 1, 0, 0.3490196, 1,
1.598859, 0.5980799, 0.3168299, 1, 0, 0.3411765, 1,
1.605915, -1.55353, 0.7717825, 1, 0, 0.3372549, 1,
1.607463, -0.08081254, 1.66926, 1, 0, 0.3294118, 1,
1.61754, -0.4054821, 0.4494543, 1, 0, 0.3254902, 1,
1.637131, 0.4502449, 1.812592, 1, 0, 0.3176471, 1,
1.64005, -1.093632, 3.042267, 1, 0, 0.3137255, 1,
1.646774, -0.4314251, 1.313901, 1, 0, 0.3058824, 1,
1.652171, -0.8531186, 1.698172, 1, 0, 0.2980392, 1,
1.658631, 0.519728, 0.07836802, 1, 0, 0.2941177, 1,
1.658968, 0.2183003, 0.09169391, 1, 0, 0.2862745, 1,
1.67881, -0.5751234, 2.767715, 1, 0, 0.282353, 1,
1.708416, -0.2617658, 2.201503, 1, 0, 0.2745098, 1,
1.715365, 0.3463584, 1.242823, 1, 0, 0.2705882, 1,
1.768214, 1.454808, -1.168414, 1, 0, 0.2627451, 1,
1.769111, -1.71135, 2.355672, 1, 0, 0.2588235, 1,
1.786775, 0.771575, 1.143669, 1, 0, 0.2509804, 1,
1.810855, 2.539888, -0.2811752, 1, 0, 0.2470588, 1,
1.820698, 1.21932, 0.5427834, 1, 0, 0.2392157, 1,
1.829071, -0.7216922, 3.710361, 1, 0, 0.2352941, 1,
1.851864, -0.02375344, 2.724718, 1, 0, 0.227451, 1,
1.857133, 1.715932, 1.017702, 1, 0, 0.2235294, 1,
1.88726, -0.7321603, 1.807753, 1, 0, 0.2156863, 1,
1.956948, -0.6698472, 1.092374, 1, 0, 0.2117647, 1,
1.964823, -0.7118803, 1.992156, 1, 0, 0.2039216, 1,
2.010358, -1.147451, 3.040978, 1, 0, 0.1960784, 1,
2.032616, 0.7490315, 0.2970062, 1, 0, 0.1921569, 1,
2.040481, -0.3570353, 0.4206805, 1, 0, 0.1843137, 1,
2.064153, 0.6418733, 1.594602, 1, 0, 0.1803922, 1,
2.075727, 0.5424004, -1.220399, 1, 0, 0.172549, 1,
2.081978, 0.08323622, 1.666945, 1, 0, 0.1686275, 1,
2.086462, 0.1689455, 2.620159, 1, 0, 0.1607843, 1,
2.090875, 1.532365, 0.2021361, 1, 0, 0.1568628, 1,
2.097591, -0.7285895, 1.859566, 1, 0, 0.1490196, 1,
2.098459, 0.9493988, -0.1346464, 1, 0, 0.145098, 1,
2.110962, 0.6785719, 2.680315, 1, 0, 0.1372549, 1,
2.136643, 0.03738139, 0.4075446, 1, 0, 0.1333333, 1,
2.139642, 0.7008511, 1.749139, 1, 0, 0.1254902, 1,
2.14843, -1.312378, 1.482763, 1, 0, 0.1215686, 1,
2.214769, -2.394549, 3.246987, 1, 0, 0.1137255, 1,
2.233989, 1.559917, 1.604621, 1, 0, 0.1098039, 1,
2.237437, -0.9269885, 0.6294444, 1, 0, 0.1019608, 1,
2.242097, -0.4708268, 3.10696, 1, 0, 0.09411765, 1,
2.245912, 0.4489881, -0.678264, 1, 0, 0.09019608, 1,
2.256053, 0.183919, -0.2856187, 1, 0, 0.08235294, 1,
2.272492, 0.7007864, 0.6562337, 1, 0, 0.07843138, 1,
2.293638, -1.013351, 3.267958, 1, 0, 0.07058824, 1,
2.297751, -0.09490427, -0.513898, 1, 0, 0.06666667, 1,
2.437796, 0.4377643, 2.667375, 1, 0, 0.05882353, 1,
2.443995, -0.8466417, 2.476209, 1, 0, 0.05490196, 1,
2.449421, -0.6162004, 1.776331, 1, 0, 0.04705882, 1,
2.45855, -1.11891, 1.20336, 1, 0, 0.04313726, 1,
2.513555, 0.5226023, 1.099826, 1, 0, 0.03529412, 1,
2.519029, -2.236715, 1.075645, 1, 0, 0.03137255, 1,
2.568582, 0.5064039, 1.68314, 1, 0, 0.02352941, 1,
2.68314, 1.103168, 1.418629, 1, 0, 0.01960784, 1,
3.024128, 1.097421, 0.3996252, 1, 0, 0.01176471, 1,
3.175345, 0.7472325, -0.623571, 1, 0, 0.007843138, 1
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
0.01641178, -4.75267, -7.284014, 0, -0.5, 0.5, 0.5,
0.01641178, -4.75267, -7.284014, 1, -0.5, 0.5, 0.5,
0.01641178, -4.75267, -7.284014, 1, 1.5, 0.5, 0.5,
0.01641178, -4.75267, -7.284014, 0, 1.5, 0.5, 0.5
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
-4.2134, -0.3646716, -7.284014, 0, -0.5, 0.5, 0.5,
-4.2134, -0.3646716, -7.284014, 1, -0.5, 0.5, 0.5,
-4.2134, -0.3646716, -7.284014, 1, 1.5, 0.5, 0.5,
-4.2134, -0.3646716, -7.284014, 0, 1.5, 0.5, 0.5
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
-4.2134, -4.75267, 0.04738975, 0, -0.5, 0.5, 0.5,
-4.2134, -4.75267, 0.04738975, 1, -0.5, 0.5, 0.5,
-4.2134, -4.75267, 0.04738975, 1, 1.5, 0.5, 0.5,
-4.2134, -4.75267, 0.04738975, 0, 1.5, 0.5, 0.5
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
-3, -3.740055, -5.592152,
3, -3.740055, -5.592152,
-3, -3.740055, -5.592152,
-3, -3.908824, -5.874129,
-2, -3.740055, -5.592152,
-2, -3.908824, -5.874129,
-1, -3.740055, -5.592152,
-1, -3.908824, -5.874129,
0, -3.740055, -5.592152,
0, -3.908824, -5.874129,
1, -3.740055, -5.592152,
1, -3.908824, -5.874129,
2, -3.740055, -5.592152,
2, -3.908824, -5.874129,
3, -3.740055, -5.592152,
3, -3.908824, -5.874129
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
-3, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
-3, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
-3, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
-3, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
-2, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
-2, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
-2, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
-2, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
-1, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
-1, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
-1, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
-1, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
0, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
0, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
0, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
0, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
1, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
1, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
1, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
1, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
2, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
2, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
2, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
2, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5,
3, -4.246362, -6.438083, 0, -0.5, 0.5, 0.5,
3, -4.246362, -6.438083, 1, -0.5, 0.5, 0.5,
3, -4.246362, -6.438083, 1, 1.5, 0.5, 0.5,
3, -4.246362, -6.438083, 0, 1.5, 0.5, 0.5
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
-3.23729, -3, -5.592152,
-3.23729, 2, -5.592152,
-3.23729, -3, -5.592152,
-3.399975, -3, -5.874129,
-3.23729, -2, -5.592152,
-3.399975, -2, -5.874129,
-3.23729, -1, -5.592152,
-3.399975, -1, -5.874129,
-3.23729, 0, -5.592152,
-3.399975, 0, -5.874129,
-3.23729, 1, -5.592152,
-3.399975, 1, -5.874129,
-3.23729, 2, -5.592152,
-3.399975, 2, -5.874129
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
-3.725345, -3, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, -3, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, -3, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, -3, -6.438083, 0, 1.5, 0.5, 0.5,
-3.725345, -2, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, -2, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, -2, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, -2, -6.438083, 0, 1.5, 0.5, 0.5,
-3.725345, -1, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, -1, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, -1, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, -1, -6.438083, 0, 1.5, 0.5, 0.5,
-3.725345, 0, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, 0, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, 0, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, 0, -6.438083, 0, 1.5, 0.5, 0.5,
-3.725345, 1, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, 1, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, 1, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, 1, -6.438083, 0, 1.5, 0.5, 0.5,
-3.725345, 2, -6.438083, 0, -0.5, 0.5, 0.5,
-3.725345, 2, -6.438083, 1, -0.5, 0.5, 0.5,
-3.725345, 2, -6.438083, 1, 1.5, 0.5, 0.5,
-3.725345, 2, -6.438083, 0, 1.5, 0.5, 0.5
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
-3.23729, -3.740055, -4,
-3.23729, -3.740055, 4,
-3.23729, -3.740055, -4,
-3.399975, -3.908824, -4,
-3.23729, -3.740055, -2,
-3.399975, -3.908824, -2,
-3.23729, -3.740055, 0,
-3.399975, -3.908824, 0,
-3.23729, -3.740055, 2,
-3.399975, -3.908824, 2,
-3.23729, -3.740055, 4,
-3.399975, -3.908824, 4
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
-3.725345, -4.246362, -4, 0, -0.5, 0.5, 0.5,
-3.725345, -4.246362, -4, 1, -0.5, 0.5, 0.5,
-3.725345, -4.246362, -4, 1, 1.5, 0.5, 0.5,
-3.725345, -4.246362, -4, 0, 1.5, 0.5, 0.5,
-3.725345, -4.246362, -2, 0, -0.5, 0.5, 0.5,
-3.725345, -4.246362, -2, 1, -0.5, 0.5, 0.5,
-3.725345, -4.246362, -2, 1, 1.5, 0.5, 0.5,
-3.725345, -4.246362, -2, 0, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 0, 0, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 0, 1, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 0, 1, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 0, 0, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 2, 0, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 2, 1, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 2, 1, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 2, 0, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 4, 0, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 4, 1, -0.5, 0.5, 0.5,
-3.725345, -4.246362, 4, 1, 1.5, 0.5, 0.5,
-3.725345, -4.246362, 4, 0, 1.5, 0.5, 0.5
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
-3.23729, -3.740055, -5.592152,
-3.23729, 3.010712, -5.592152,
-3.23729, -3.740055, 5.686931,
-3.23729, 3.010712, 5.686931,
-3.23729, -3.740055, -5.592152,
-3.23729, -3.740055, 5.686931,
-3.23729, 3.010712, -5.592152,
-3.23729, 3.010712, 5.686931,
-3.23729, -3.740055, -5.592152,
3.270113, -3.740055, -5.592152,
-3.23729, -3.740055, 5.686931,
3.270113, -3.740055, 5.686931,
-3.23729, 3.010712, -5.592152,
3.270113, 3.010712, -5.592152,
-3.23729, 3.010712, 5.686931,
3.270113, 3.010712, 5.686931,
3.270113, -3.740055, -5.592152,
3.270113, 3.010712, -5.592152,
3.270113, -3.740055, 5.686931,
3.270113, 3.010712, 5.686931,
3.270113, -3.740055, -5.592152,
3.270113, -3.740055, 5.686931,
3.270113, 3.010712, -5.592152,
3.270113, 3.010712, 5.686931
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
var radius = 7.832184;
var distance = 34.84627;
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
mvMatrix.translate( -0.01641178, 0.3646716, -0.04738975 );
mvMatrix.scale( 1.301335, 1.254422, 0.7507978 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84627);
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
butamifos<-read.table("butamifos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-butamifos$V2
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
```

```r
y<-butamifos$V3
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
```

```r
z<-butamifos$V4
```

```
## Error in eval(expr, envir, enclos): object 'butamifos' not found
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
-3.142522, -0.1227182, -1.201127, 0, 0, 1, 1, 1,
-2.654974, -1.306707, -1.692504, 1, 0, 0, 1, 1,
-2.612097, 0.3946529, -0.6533794, 1, 0, 0, 1, 1,
-2.55314, -0.6702446, -0.605914, 1, 0, 0, 1, 1,
-2.472025, 1.245848, -1.945395, 1, 0, 0, 1, 1,
-2.426324, -0.2898991, -0.2922917, 1, 0, 0, 1, 1,
-2.402971, 0.9932705, -1.184557, 0, 0, 0, 1, 1,
-2.394339, -0.1716196, -1.87869, 0, 0, 0, 1, 1,
-2.371524, 1.005836, 0.3215511, 0, 0, 0, 1, 1,
-2.351677, -0.08280241, -2.465104, 0, 0, 0, 1, 1,
-2.350086, 0.1755734, -3.488743, 0, 0, 0, 1, 1,
-2.214961, -1.622845, -2.901206, 0, 0, 0, 1, 1,
-2.179426, 1.853155, -1.50851, 0, 0, 0, 1, 1,
-2.144635, -1.801276, -1.633142, 1, 1, 1, 1, 1,
-2.138144, -0.03476208, -1.535528, 1, 1, 1, 1, 1,
-2.099093, 0.9776719, -0.4528134, 1, 1, 1, 1, 1,
-2.070948, -0.1702452, -2.064751, 1, 1, 1, 1, 1,
-2.04108, 0.8542714, -0.9293148, 1, 1, 1, 1, 1,
-2.006062, -1.563086, -1.284558, 1, 1, 1, 1, 1,
-1.988109, -1.200275, -2.319866, 1, 1, 1, 1, 1,
-1.976692, -1.879429, -0.3719107, 1, 1, 1, 1, 1,
-1.965734, 1.725906, -1.396544, 1, 1, 1, 1, 1,
-1.950733, 0.1949815, -1.962953, 1, 1, 1, 1, 1,
-1.907602, 0.8638847, -1.349531, 1, 1, 1, 1, 1,
-1.898959, 1.061522, -0.07438812, 1, 1, 1, 1, 1,
-1.89682, 0.9830633, -3.010786, 1, 1, 1, 1, 1,
-1.887872, 1.715096, -0.1293432, 1, 1, 1, 1, 1,
-1.849926, 0.6377301, -2.076149, 1, 1, 1, 1, 1,
-1.829301, 0.3797176, -2.83944, 0, 0, 1, 1, 1,
-1.794982, 0.6112306, -3.00515, 1, 0, 0, 1, 1,
-1.787261, 0.2387308, -0.5082222, 1, 0, 0, 1, 1,
-1.772171, 0.7771372, -0.2162325, 1, 0, 0, 1, 1,
-1.769543, 0.5792868, -0.1808206, 1, 0, 0, 1, 1,
-1.761703, 0.2707382, -3.012164, 1, 0, 0, 1, 1,
-1.740075, 0.0168828, -0.1617108, 0, 0, 0, 1, 1,
-1.72822, 0.7713302, -1.496859, 0, 0, 0, 1, 1,
-1.719514, -0.02101708, -1.915581, 0, 0, 0, 1, 1,
-1.697384, 1.426106, -2.488904, 0, 0, 0, 1, 1,
-1.677586, -1.451444, -1.768333, 0, 0, 0, 1, 1,
-1.644893, -0.7650506, -2.058347, 0, 0, 0, 1, 1,
-1.636129, -1.997876, -5.427893, 0, 0, 0, 1, 1,
-1.635023, -0.2182458, -1.738051, 1, 1, 1, 1, 1,
-1.630903, 1.427024, -1.83281, 1, 1, 1, 1, 1,
-1.624145, 0.674808, -1.695786, 1, 1, 1, 1, 1,
-1.621988, 1.064846, 1.194594, 1, 1, 1, 1, 1,
-1.618146, 0.6317091, -1.478243, 1, 1, 1, 1, 1,
-1.598636, -1.64623, -2.590589, 1, 1, 1, 1, 1,
-1.586922, 0.526422, -1.454565, 1, 1, 1, 1, 1,
-1.576683, -0.6009241, -1.122228, 1, 1, 1, 1, 1,
-1.571764, -0.9669824, -3.456934, 1, 1, 1, 1, 1,
-1.551968, -1.669697, -3.966152, 1, 1, 1, 1, 1,
-1.551867, -0.2047472, -2.023416, 1, 1, 1, 1, 1,
-1.54836, -0.1428211, -1.835285, 1, 1, 1, 1, 1,
-1.538179, 0.4724423, -1.930757, 1, 1, 1, 1, 1,
-1.533092, 0.432664, -2.43754, 1, 1, 1, 1, 1,
-1.529444, 1.626726, -0.8423004, 1, 1, 1, 1, 1,
-1.518728, 2.100309, -1.438799, 0, 0, 1, 1, 1,
-1.510847, -0.01477553, -1.532497, 1, 0, 0, 1, 1,
-1.508138, -1.014106, -2.725976, 1, 0, 0, 1, 1,
-1.494641, -0.7659639, -2.544734, 1, 0, 0, 1, 1,
-1.481784, 0.9193977, 0.8516368, 1, 0, 0, 1, 1,
-1.480981, -0.4664005, -1.819195, 1, 0, 0, 1, 1,
-1.451466, -1.037491, -2.832232, 0, 0, 0, 1, 1,
-1.446928, -0.4978541, -3.198388, 0, 0, 0, 1, 1,
-1.438068, -0.2085061, -2.877845, 0, 0, 0, 1, 1,
-1.433604, 0.09797532, -0.3006685, 0, 0, 0, 1, 1,
-1.42653, 0.693289, -3.039846, 0, 0, 0, 1, 1,
-1.420727, 0.2417491, -2.768726, 0, 0, 0, 1, 1,
-1.413401, 0.2096607, -1.854131, 0, 0, 0, 1, 1,
-1.393164, -0.9995672, -3.597196, 1, 1, 1, 1, 1,
-1.387826, 0.1360857, -1.088878, 1, 1, 1, 1, 1,
-1.368712, 0.6827818, -1.551409, 1, 1, 1, 1, 1,
-1.359513, 0.6298606, -1.69582, 1, 1, 1, 1, 1,
-1.358861, 1.625116, -1.99658, 1, 1, 1, 1, 1,
-1.353983, -0.8649572, -0.6652672, 1, 1, 1, 1, 1,
-1.353275, 0.2967593, -1.718597, 1, 1, 1, 1, 1,
-1.352168, -0.1501533, 0.07328339, 1, 1, 1, 1, 1,
-1.344931, 0.8180386, 0.04868805, 1, 1, 1, 1, 1,
-1.335797, -0.6003497, -2.933637, 1, 1, 1, 1, 1,
-1.328482, -0.7859034, -2.714831, 1, 1, 1, 1, 1,
-1.315526, 0.9261371, 0.138289, 1, 1, 1, 1, 1,
-1.306436, 0.72297, -1.702541, 1, 1, 1, 1, 1,
-1.302803, -0.3399701, -0.07138158, 1, 1, 1, 1, 1,
-1.290856, -0.1866961, -2.552682, 1, 1, 1, 1, 1,
-1.282973, 0.8803484, -0.6089303, 0, 0, 1, 1, 1,
-1.262829, -0.005487115, -2.803972, 1, 0, 0, 1, 1,
-1.261187, 1.699609, -1.456571, 1, 0, 0, 1, 1,
-1.254443, 1.250592, -0.5993125, 1, 0, 0, 1, 1,
-1.252828, 0.7308532, 0.6181326, 1, 0, 0, 1, 1,
-1.248578, -1.177923, -2.827756, 1, 0, 0, 1, 1,
-1.232036, 0.908604, -0.6956907, 0, 0, 0, 1, 1,
-1.224349, -0.3060598, -0.7969686, 0, 0, 0, 1, 1,
-1.213612, -0.6587724, -1.06015, 0, 0, 0, 1, 1,
-1.211871, 0.700235, -0.89787, 0, 0, 0, 1, 1,
-1.210396, 1.601626, -2.562798, 0, 0, 0, 1, 1,
-1.207604, -0.05463437, -1.96327, 0, 0, 0, 1, 1,
-1.205662, 0.4124321, 0.106914, 0, 0, 0, 1, 1,
-1.205509, -2.00901, -3.121656, 1, 1, 1, 1, 1,
-1.198635, -0.4958918, -3.369123, 1, 1, 1, 1, 1,
-1.188232, 0.1455827, -2.38743, 1, 1, 1, 1, 1,
-1.170256, -0.01150185, -3.21998, 1, 1, 1, 1, 1,
-1.154139, 0.4194513, 0.4725932, 1, 1, 1, 1, 1,
-1.141915, -0.992056, -1.426059, 1, 1, 1, 1, 1,
-1.129924, 0.1442386, -1.460199, 1, 1, 1, 1, 1,
-1.125495, -0.5933709, -1.407519, 1, 1, 1, 1, 1,
-1.120703, 0.5693561, -1.481671, 1, 1, 1, 1, 1,
-1.119939, 1.428157, -2.206435, 1, 1, 1, 1, 1,
-1.116152, -1.084602, -2.964065, 1, 1, 1, 1, 1,
-1.115316, -0.6038524, -2.240247, 1, 1, 1, 1, 1,
-1.113808, 0.5660797, -2.18258, 1, 1, 1, 1, 1,
-1.109677, 0.1434489, -2.884348, 1, 1, 1, 1, 1,
-1.108157, 0.7351664, -0.2156492, 1, 1, 1, 1, 1,
-1.10434, 1.517727, -0.7468367, 0, 0, 1, 1, 1,
-1.097225, -0.4864225, -2.196454, 1, 0, 0, 1, 1,
-1.096497, -0.1022583, -2.347143, 1, 0, 0, 1, 1,
-1.09536, -0.784857, -2.653539, 1, 0, 0, 1, 1,
-1.086086, -0.638392, -2.488683, 1, 0, 0, 1, 1,
-1.08434, -0.6046143, -1.364838, 1, 0, 0, 1, 1,
-1.084046, 0.6862674, -0.3329075, 0, 0, 0, 1, 1,
-1.071421, -0.9431562, -0.9444461, 0, 0, 0, 1, 1,
-1.071107, 0.7570666, -0.475179, 0, 0, 0, 1, 1,
-1.068483, 1.01934, -0.8975068, 0, 0, 0, 1, 1,
-1.067369, 1.471754, -1.349589, 0, 0, 0, 1, 1,
-1.066885, -0.8014351, -1.037086, 0, 0, 0, 1, 1,
-1.06164, 1.773935, 1.487002, 0, 0, 0, 1, 1,
-1.06136, 0.8210633, -0.3186503, 1, 1, 1, 1, 1,
-1.052582, 0.607927, -1.108594, 1, 1, 1, 1, 1,
-1.047066, 0.3949422, 0.4144339, 1, 1, 1, 1, 1,
-1.042951, -0.2000075, -3.309127, 1, 1, 1, 1, 1,
-1.042674, -0.1502012, -2.178509, 1, 1, 1, 1, 1,
-1.037227, 1.056522, -0.9017711, 1, 1, 1, 1, 1,
-1.034203, 1.232312, 0.1856665, 1, 1, 1, 1, 1,
-1.034185, -0.2172187, -2.5822, 1, 1, 1, 1, 1,
-1.030777, 1.202878, -1.269663, 1, 1, 1, 1, 1,
-1.029306, -0.6336479, -3.156666, 1, 1, 1, 1, 1,
-1.027861, 1.115091, -0.5967811, 1, 1, 1, 1, 1,
-1.027669, 0.6837182, -1.512978, 1, 1, 1, 1, 1,
-1.012991, -0.06581417, -2.190595, 1, 1, 1, 1, 1,
-1.011258, 0.00793699, -1.742877, 1, 1, 1, 1, 1,
-1.008946, 1.635215, -0.4397668, 1, 1, 1, 1, 1,
-1.007973, -1.028378, -2.942628, 0, 0, 1, 1, 1,
-0.9985563, -1.100322, -3.257085, 1, 0, 0, 1, 1,
-0.9923077, 1.42046, -0.8001261, 1, 0, 0, 1, 1,
-0.9907104, -0.7394905, -2.058891, 1, 0, 0, 1, 1,
-0.9907051, 0.2634645, -3.485022, 1, 0, 0, 1, 1,
-0.9859417, 0.1201319, -0.3226679, 1, 0, 0, 1, 1,
-0.9746887, 0.773863, -1.589859, 0, 0, 0, 1, 1,
-0.9724525, 0.7667197, -0.9043198, 0, 0, 0, 1, 1,
-0.9684535, 1.197709, -0.3289398, 0, 0, 0, 1, 1,
-0.9668388, 0.5126109, -2.426957, 0, 0, 0, 1, 1,
-0.9665046, -1.309248, -1.988428, 0, 0, 0, 1, 1,
-0.9664714, -0.152501, 0.4789277, 0, 0, 0, 1, 1,
-0.9631755, 0.7435107, 1.70325, 0, 0, 0, 1, 1,
-0.9617369, -0.8548203, -1.564372, 1, 1, 1, 1, 1,
-0.9509646, 0.05612072, -0.5551735, 1, 1, 1, 1, 1,
-0.9470519, 1.834072, 1.28539, 1, 1, 1, 1, 1,
-0.9260626, 1.381772, -1.400282, 1, 1, 1, 1, 1,
-0.9251747, 0.6757034, 0.01055122, 1, 1, 1, 1, 1,
-0.9138733, 0.6454373, -3.184992, 1, 1, 1, 1, 1,
-0.9101399, 0.5062217, -0.2581344, 1, 1, 1, 1, 1,
-0.9082677, 0.05876142, -1.020683, 1, 1, 1, 1, 1,
-0.9049416, -0.5958508, -2.692867, 1, 1, 1, 1, 1,
-0.9022897, 1.102516, -1.493564, 1, 1, 1, 1, 1,
-0.8998116, 0.2380595, -1.419178, 1, 1, 1, 1, 1,
-0.8948407, -1.89444, -2.714469, 1, 1, 1, 1, 1,
-0.8944852, 0.4627272, -1.163892, 1, 1, 1, 1, 1,
-0.8922222, -0.8450215, -1.696237, 1, 1, 1, 1, 1,
-0.8912253, -0.9616635, -2.795151, 1, 1, 1, 1, 1,
-0.8902352, 0.3291503, -2.649692, 0, 0, 1, 1, 1,
-0.8817587, 0.3712474, -1.55362, 1, 0, 0, 1, 1,
-0.8817374, -0.2239957, -2.048838, 1, 0, 0, 1, 1,
-0.8816444, 0.251722, -2.165563, 1, 0, 0, 1, 1,
-0.8805901, -0.2626151, -2.447649, 1, 0, 0, 1, 1,
-0.8747441, -1.800919, -3.462519, 1, 0, 0, 1, 1,
-0.8725367, -1.963695, -2.882639, 0, 0, 0, 1, 1,
-0.8596339, -0.2363295, -2.402556, 0, 0, 0, 1, 1,
-0.8589273, 0.8137168, -1.715327, 0, 0, 0, 1, 1,
-0.8531687, -0.05497188, -1.047851, 0, 0, 0, 1, 1,
-0.8443207, -0.9609303, -3.538338, 0, 0, 0, 1, 1,
-0.8369945, 1.379262, -1.99337, 0, 0, 0, 1, 1,
-0.8365285, -0.5070772, -2.718184, 0, 0, 0, 1, 1,
-0.8336769, 0.1728709, -0.192641, 1, 1, 1, 1, 1,
-0.8312437, -0.6988149, -2.725967, 1, 1, 1, 1, 1,
-0.8258855, -0.3947974, -1.893216, 1, 1, 1, 1, 1,
-0.8189297, 0.9542019, -0.5358638, 1, 1, 1, 1, 1,
-0.8117958, -0.4454424, -2.312338, 1, 1, 1, 1, 1,
-0.8108346, 1.813945, -1.74617, 1, 1, 1, 1, 1,
-0.8108303, 1.711841, 1.730342, 1, 1, 1, 1, 1,
-0.8061723, 0.137107, -2.52009, 1, 1, 1, 1, 1,
-0.8007939, -0.5553976, -2.249804, 1, 1, 1, 1, 1,
-0.8005612, -1.592787, -1.692518, 1, 1, 1, 1, 1,
-0.8002904, 2.015211, -1.113714, 1, 1, 1, 1, 1,
-0.7991561, 2.547479, -0.6729995, 1, 1, 1, 1, 1,
-0.7906873, -0.7497036, -3.556267, 1, 1, 1, 1, 1,
-0.7853927, -1.799379, -1.692084, 1, 1, 1, 1, 1,
-0.7852752, -1.110085, -1.526459, 1, 1, 1, 1, 1,
-0.7805407, -0.8095335, -2.023343, 0, 0, 1, 1, 1,
-0.7798449, 0.2751452, -0.5761209, 1, 0, 0, 1, 1,
-0.7764781, 0.3726224, -2.030798, 1, 0, 0, 1, 1,
-0.7742217, -0.9485984, -1.98091, 1, 0, 0, 1, 1,
-0.7713429, 0.201593, -1.553918, 1, 0, 0, 1, 1,
-0.7690793, -0.4615567, -3.070339, 1, 0, 0, 1, 1,
-0.7674903, 1.499432, 0.6663844, 0, 0, 0, 1, 1,
-0.7612335, 0.9250718, -1.462092, 0, 0, 0, 1, 1,
-0.7580956, 2.246448, -1.609781, 0, 0, 0, 1, 1,
-0.756594, 0.00393155, -1.756222, 0, 0, 0, 1, 1,
-0.7565363, -0.2726246, -2.156873, 0, 0, 0, 1, 1,
-0.7527848, -1.143654, -3.046181, 0, 0, 0, 1, 1,
-0.7491007, 1.025502, -1.057157, 0, 0, 0, 1, 1,
-0.7457575, -1.247201, -0.9391271, 1, 1, 1, 1, 1,
-0.7432612, 1.642815, 0.2943901, 1, 1, 1, 1, 1,
-0.7252821, -0.2311417, -3.361808, 1, 1, 1, 1, 1,
-0.722405, -0.00644477, -1.983362, 1, 1, 1, 1, 1,
-0.7207419, 0.3366888, -1.919892, 1, 1, 1, 1, 1,
-0.7147969, -0.5262023, -2.380799, 1, 1, 1, 1, 1,
-0.7132177, -0.5856084, -2.106514, 1, 1, 1, 1, 1,
-0.7070529, 2.319216, -1.01043, 1, 1, 1, 1, 1,
-0.7032151, -0.5074031, -1.957518, 1, 1, 1, 1, 1,
-0.7029817, 0.357552, 2.27713, 1, 1, 1, 1, 1,
-0.7018201, 0.167859, -1.597626, 1, 1, 1, 1, 1,
-0.6913324, 2.066491, -1.172758, 1, 1, 1, 1, 1,
-0.6882159, -0.3480699, -2.493923, 1, 1, 1, 1, 1,
-0.6859264, -0.0885024, -1.001069, 1, 1, 1, 1, 1,
-0.6848755, -0.300504, -1.304164, 1, 1, 1, 1, 1,
-0.6839302, 2.062665, 0.1452521, 0, 0, 1, 1, 1,
-0.6794648, -0.1563125, -2.7099, 1, 0, 0, 1, 1,
-0.675483, -0.8626713, -3.23141, 1, 0, 0, 1, 1,
-0.6699846, 0.07465607, -1.246024, 1, 0, 0, 1, 1,
-0.6697449, 2.388597, 0.6116625, 1, 0, 0, 1, 1,
-0.6695865, 0.2716123, -1.157935, 1, 0, 0, 1, 1,
-0.6667662, -1.415731, -3.794747, 0, 0, 0, 1, 1,
-0.6622107, -0.07080461, -1.52926, 0, 0, 0, 1, 1,
-0.6619868, 0.2235702, -0.8631584, 0, 0, 0, 1, 1,
-0.6610751, -1.822819, -2.78896, 0, 0, 0, 1, 1,
-0.6535765, 0.4595143, -2.023497, 0, 0, 0, 1, 1,
-0.6431763, -2.834653, -2.885051, 0, 0, 0, 1, 1,
-0.6405448, -1.006983, -2.244795, 0, 0, 0, 1, 1,
-0.6380175, 0.8439931, -1.389695, 1, 1, 1, 1, 1,
-0.6378323, 0.8908235, -0.04518399, 1, 1, 1, 1, 1,
-0.6266719, 0.4324266, -0.0791077, 1, 1, 1, 1, 1,
-0.6236957, -0.507043, -2.273038, 1, 1, 1, 1, 1,
-0.62333, 1.205559, -1.745188, 1, 1, 1, 1, 1,
-0.6224433, 0.09932631, -0.9857094, 1, 1, 1, 1, 1,
-0.6220791, 0.0477456, -1.063777, 1, 1, 1, 1, 1,
-0.6210845, -0.9388953, -3.904613, 1, 1, 1, 1, 1,
-0.6145167, -1.390926, -3.457208, 1, 1, 1, 1, 1,
-0.6141787, 0.001654479, -1.451234, 1, 1, 1, 1, 1,
-0.6098294, 0.455158, -1.955197, 1, 1, 1, 1, 1,
-0.6058567, -0.5942865, -2.4325, 1, 1, 1, 1, 1,
-0.6057333, -0.5872367, -2.831246, 1, 1, 1, 1, 1,
-0.6035581, 0.9327695, 1.220455, 1, 1, 1, 1, 1,
-0.600847, 0.1430923, -1.422981, 1, 1, 1, 1, 1,
-0.5982571, 0.8236915, -0.8936762, 0, 0, 1, 1, 1,
-0.5964144, 0.4771999, -1.722487, 1, 0, 0, 1, 1,
-0.5921145, 1.32089, -0.946062, 1, 0, 0, 1, 1,
-0.5896348, -0.02805946, -2.463377, 1, 0, 0, 1, 1,
-0.5869049, 0.6230937, -0.8287826, 1, 0, 0, 1, 1,
-0.5866002, 0.3503753, -1.639534, 1, 0, 0, 1, 1,
-0.5813975, 0.636139, -1.828419, 0, 0, 0, 1, 1,
-0.580349, 1.043194, -1.838, 0, 0, 0, 1, 1,
-0.5725833, -0.273429, 0.3062291, 0, 0, 0, 1, 1,
-0.5716717, -0.3384129, -1.061762, 0, 0, 0, 1, 1,
-0.5676153, 0.007385978, -2.495062, 0, 0, 0, 1, 1,
-0.5633708, 0.6243075, -0.1508391, 0, 0, 0, 1, 1,
-0.5627268, -0.4563128, -3.246435, 0, 0, 0, 1, 1,
-0.5580848, -0.06990967, -1.289467, 1, 1, 1, 1, 1,
-0.5546229, -0.1323273, -3.224289, 1, 1, 1, 1, 1,
-0.5545284, -0.7421869, -2.342579, 1, 1, 1, 1, 1,
-0.5477791, 1.336903, -0.5835397, 1, 1, 1, 1, 1,
-0.5464619, 0.9117057, -0.0642179, 1, 1, 1, 1, 1,
-0.5455398, 0.4086804, -1.200459, 1, 1, 1, 1, 1,
-0.5428877, -0.08641271, -1.895723, 1, 1, 1, 1, 1,
-0.5341256, -0.9063978, -4.996191, 1, 1, 1, 1, 1,
-0.5308087, -0.8956404, -1.562639, 1, 1, 1, 1, 1,
-0.5304964, 0.5023865, 0.2708272, 1, 1, 1, 1, 1,
-0.5303441, 0.6899914, -0.9814756, 1, 1, 1, 1, 1,
-0.5266132, -1.806205, -2.328294, 1, 1, 1, 1, 1,
-0.5250294, 0.9991607, -1.7388, 1, 1, 1, 1, 1,
-0.524274, 1.044917, 1.342091, 1, 1, 1, 1, 1,
-0.520349, 1.114518, -1.982135, 1, 1, 1, 1, 1,
-0.518892, 0.3667692, -1.196023, 0, 0, 1, 1, 1,
-0.5182948, -0.3618076, -1.565024, 1, 0, 0, 1, 1,
-0.5155247, -1.11859, -2.685449, 1, 0, 0, 1, 1,
-0.5140996, -0.6353305, -1.772042, 1, 0, 0, 1, 1,
-0.5140296, 2.088264, -0.9849916, 1, 0, 0, 1, 1,
-0.5104637, -1.081611, -2.822123, 1, 0, 0, 1, 1,
-0.5031817, -0.4209821, -3.4791, 0, 0, 0, 1, 1,
-0.4972377, 1.430454, -1.118155, 0, 0, 0, 1, 1,
-0.4971994, -1.021504, -1.425102, 0, 0, 0, 1, 1,
-0.4945719, 0.655139, -1.806481, 0, 0, 0, 1, 1,
-0.4931318, 0.5459203, 0.2696628, 0, 0, 0, 1, 1,
-0.4870414, -0.09216546, -1.501998, 0, 0, 0, 1, 1,
-0.4837468, -1.069028, -3.333554, 0, 0, 0, 1, 1,
-0.4820929, 0.191992, -2.637381, 1, 1, 1, 1, 1,
-0.4812005, 1.653684, -0.1723045, 1, 1, 1, 1, 1,
-0.4781144, -1.218287, -3.236227, 1, 1, 1, 1, 1,
-0.4716507, -1.224484, -2.372362, 1, 1, 1, 1, 1,
-0.4698988, 2.176503, -1.283188, 1, 1, 1, 1, 1,
-0.462718, 1.15134, -0.1213747, 1, 1, 1, 1, 1,
-0.4617749, -0.0197279, -1.040291, 1, 1, 1, 1, 1,
-0.4569188, -1.17939, -2.583624, 1, 1, 1, 1, 1,
-0.4518383, -1.811218, -5.09795, 1, 1, 1, 1, 1,
-0.4471321, -0.5756062, -3.142304, 1, 1, 1, 1, 1,
-0.4436321, -1.003146, -2.182151, 1, 1, 1, 1, 1,
-0.4284077, 0.0464451, 0.4220228, 1, 1, 1, 1, 1,
-0.4281063, -1.088546, -3.430193, 1, 1, 1, 1, 1,
-0.4250732, -1.353876, -3.471116, 1, 1, 1, 1, 1,
-0.4238053, -1.328427, -5.201992, 1, 1, 1, 1, 1,
-0.4188307, -0.1783985, -2.146541, 0, 0, 1, 1, 1,
-0.4173352, -1.54823, -0.04121641, 1, 0, 0, 1, 1,
-0.4166578, -0.2226492, -1.683813, 1, 0, 0, 1, 1,
-0.4125778, 0.3530043, -2.08584, 1, 0, 0, 1, 1,
-0.4067059, 0.7291827, -2.397182, 1, 0, 0, 1, 1,
-0.4062373, 0.06505841, -1.24793, 1, 0, 0, 1, 1,
-0.4054278, 0.339609, -1.527998, 0, 0, 0, 1, 1,
-0.4014274, -0.7766855, -1.817829, 0, 0, 0, 1, 1,
-0.393044, -0.07780524, -1.035689, 0, 0, 0, 1, 1,
-0.3907016, 0.2937575, -2.853067, 0, 0, 0, 1, 1,
-0.3906423, 0.1861853, -2.381393, 0, 0, 0, 1, 1,
-0.3876955, -0.08497287, -1.968844, 0, 0, 0, 1, 1,
-0.3837104, 0.0281884, -2.558116, 0, 0, 0, 1, 1,
-0.3827547, -0.03329565, -1.057342, 1, 1, 1, 1, 1,
-0.3797478, 0.08770894, -1.547856, 1, 1, 1, 1, 1,
-0.3759953, -1.093318, -2.483568, 1, 1, 1, 1, 1,
-0.3756155, -0.367752, -1.293272, 1, 1, 1, 1, 1,
-0.3738708, 0.2870661, -1.938267, 1, 1, 1, 1, 1,
-0.3738531, -0.4429133, -1.923674, 1, 1, 1, 1, 1,
-0.3630747, -0.407187, -1.506004, 1, 1, 1, 1, 1,
-0.3590884, 0.8513777, 0.7431465, 1, 1, 1, 1, 1,
-0.3580557, 0.02873106, -0.8180487, 1, 1, 1, 1, 1,
-0.3551529, 0.1270895, -0.8070522, 1, 1, 1, 1, 1,
-0.3542694, 1.96818, -0.974626, 1, 1, 1, 1, 1,
-0.3513062, -0.1074991, -2.390711, 1, 1, 1, 1, 1,
-0.3511807, 0.2019504, -1.240474, 1, 1, 1, 1, 1,
-0.3469838, 0.8742681, 1.172925, 1, 1, 1, 1, 1,
-0.3456753, -0.6370466, -3.157587, 1, 1, 1, 1, 1,
-0.3385088, -0.9871556, -0.6385141, 0, 0, 1, 1, 1,
-0.3376322, 0.4718067, -0.61595, 1, 0, 0, 1, 1,
-0.3373765, 1.857518, 0.02402886, 1, 0, 0, 1, 1,
-0.3368545, 1.845025, -0.543439, 1, 0, 0, 1, 1,
-0.3352419, 0.5660263, -0.3753723, 1, 0, 0, 1, 1,
-0.3351307, -0.2476112, -1.534861, 1, 0, 0, 1, 1,
-0.3349214, 0.9340423, -0.4643237, 0, 0, 0, 1, 1,
-0.3342605, -0.1662042, -2.719921, 0, 0, 0, 1, 1,
-0.3336551, -1.409108, -3.742515, 0, 0, 0, 1, 1,
-0.3320272, -0.7363873, -3.92485, 0, 0, 0, 1, 1,
-0.3320025, 1.40505, -0.7115314, 0, 0, 0, 1, 1,
-0.3232143, 0.1224129, -2.474285, 0, 0, 0, 1, 1,
-0.3177562, -0.7062864, -1.075558, 0, 0, 0, 1, 1,
-0.3172449, -0.07274751, -5.183649, 1, 1, 1, 1, 1,
-0.3140546, -0.8209796, -1.692246, 1, 1, 1, 1, 1,
-0.3128141, -0.9946117, -3.544363, 1, 1, 1, 1, 1,
-0.3104061, -0.8494623, -1.454018, 1, 1, 1, 1, 1,
-0.3072557, -1.096787, -1.745925, 1, 1, 1, 1, 1,
-0.2986939, 0.4697944, -1.46272, 1, 1, 1, 1, 1,
-0.29482, -0.9194575, -0.8586681, 1, 1, 1, 1, 1,
-0.2914299, 0.2288746, -0.9635553, 1, 1, 1, 1, 1,
-0.2881437, 0.2959768, -1.400651, 1, 1, 1, 1, 1,
-0.2878497, 0.5416503, -0.3683881, 1, 1, 1, 1, 1,
-0.2847421, -0.06392103, -1.41889, 1, 1, 1, 1, 1,
-0.2831681, 0.5041441, 1.337927, 1, 1, 1, 1, 1,
-0.2828658, 0.2613103, 0.3607135, 1, 1, 1, 1, 1,
-0.2784913, -0.293492, -2.087559, 1, 1, 1, 1, 1,
-0.2730841, 0.5623009, 0.4500187, 1, 1, 1, 1, 1,
-0.2721192, 1.081993, 0.2721735, 0, 0, 1, 1, 1,
-0.2659067, 1.318965, -0.7555038, 1, 0, 0, 1, 1,
-0.2619938, 1.207329, -1.090553, 1, 0, 0, 1, 1,
-0.2606284, 0.6765022, 1.125694, 1, 0, 0, 1, 1,
-0.2583938, 0.4920079, 0.4161413, 1, 0, 0, 1, 1,
-0.2564381, -0.2209866, -3.196989, 1, 0, 0, 1, 1,
-0.2552655, -0.3923942, -2.591956, 0, 0, 0, 1, 1,
-0.2539304, -0.1612221, -2.555865, 0, 0, 0, 1, 1,
-0.2536788, 0.704748, -0.5902771, 0, 0, 0, 1, 1,
-0.2496953, 0.3642061, -0.6142875, 0, 0, 0, 1, 1,
-0.2431338, -1.281208, -2.130975, 0, 0, 0, 1, 1,
-0.2412804, 0.8998815, -1.126042, 0, 0, 0, 1, 1,
-0.2379263, -1.974394, -1.535902, 0, 0, 0, 1, 1,
-0.2341647, -0.757097, -2.42261, 1, 1, 1, 1, 1,
-0.2320731, 2.096962, -1.261031, 1, 1, 1, 1, 1,
-0.2313126, 0.6481441, 0.4756088, 1, 1, 1, 1, 1,
-0.2311882, -0.00855764, -2.918561, 1, 1, 1, 1, 1,
-0.2293124, -0.5214618, -4.221155, 1, 1, 1, 1, 1,
-0.2242936, 0.352096, -1.545097, 1, 1, 1, 1, 1,
-0.2234867, -0.1978526, -2.608185, 1, 1, 1, 1, 1,
-0.2234062, -1.248278, -4.298249, 1, 1, 1, 1, 1,
-0.2203719, 1.43278, -0.3395751, 1, 1, 1, 1, 1,
-0.2164988, 0.2071866, -0.291793, 1, 1, 1, 1, 1,
-0.2160665, 1.343787, -0.2065698, 1, 1, 1, 1, 1,
-0.2140991, -0.2923792, -2.581038, 1, 1, 1, 1, 1,
-0.2131972, 1.441032, 0.2009516, 1, 1, 1, 1, 1,
-0.2081796, 0.5026321, -1.170632, 1, 1, 1, 1, 1,
-0.2067757, 0.352573, 1.203057, 1, 1, 1, 1, 1,
-0.2060513, -0.4970638, -4.025454, 0, 0, 1, 1, 1,
-0.2043869, -1.946791, -1.613908, 1, 0, 0, 1, 1,
-0.2031188, -1.157218, -4.57134, 1, 0, 0, 1, 1,
-0.2027491, -0.253304, -4.403503, 1, 0, 0, 1, 1,
-0.1988824, -0.01849698, -0.3504845, 1, 0, 0, 1, 1,
-0.1939018, 0.04312455, -0.8725867, 1, 0, 0, 1, 1,
-0.1858743, -0.4681102, -3.635449, 0, 0, 0, 1, 1,
-0.1803893, -0.1968633, -2.073211, 0, 0, 0, 1, 1,
-0.1766819, 1.04671, -0.1774289, 0, 0, 0, 1, 1,
-0.1691093, 0.1211981, -0.4351759, 0, 0, 0, 1, 1,
-0.1673506, -0.9792817, -2.901517, 0, 0, 0, 1, 1,
-0.1645083, 1.075276, -0.6242154, 0, 0, 0, 1, 1,
-0.1627855, -0.2016921, 0.193253, 0, 0, 0, 1, 1,
-0.1626972, -0.127376, -2.013197, 1, 1, 1, 1, 1,
-0.159193, 1.470687, -0.5266883, 1, 1, 1, 1, 1,
-0.1584157, -0.7686282, -4.953182, 1, 1, 1, 1, 1,
-0.1553436, -0.40721, -0.2647284, 1, 1, 1, 1, 1,
-0.1520394, 1.073076, -0.3692641, 1, 1, 1, 1, 1,
-0.1515733, -1.057356, -2.614878, 1, 1, 1, 1, 1,
-0.1512358, 0.5684696, 0.2920462, 1, 1, 1, 1, 1,
-0.1500425, 1.85882, -0.3544855, 1, 1, 1, 1, 1,
-0.1486448, 0.4153734, 0.2663143, 1, 1, 1, 1, 1,
-0.1467124, 0.6796134, -0.6680884, 1, 1, 1, 1, 1,
-0.1449817, -0.6527906, -2.787681, 1, 1, 1, 1, 1,
-0.1447905, 0.2779139, -0.843661, 1, 1, 1, 1, 1,
-0.1437863, 0.8356887, -2.708573, 1, 1, 1, 1, 1,
-0.143687, -2.475317, -2.224993, 1, 1, 1, 1, 1,
-0.1428696, -1.411661, -4.863844, 1, 1, 1, 1, 1,
-0.1413958, -0.01632547, -0.7867399, 0, 0, 1, 1, 1,
-0.140663, -0.3075469, -0.9237896, 1, 0, 0, 1, 1,
-0.1393314, -0.3370705, -2.746463, 1, 0, 0, 1, 1,
-0.1387323, -0.6095089, -2.887627, 1, 0, 0, 1, 1,
-0.1374498, 0.3318375, 0.5082687, 1, 0, 0, 1, 1,
-0.1325615, 0.02456657, 0.7633576, 1, 0, 0, 1, 1,
-0.1286652, 0.6977906, -0.1912148, 0, 0, 0, 1, 1,
-0.1190925, 1.65993, -1.782031, 0, 0, 0, 1, 1,
-0.1159832, 0.3637404, -0.8639494, 0, 0, 0, 1, 1,
-0.115227, 0.0278404, -2.310601, 0, 0, 0, 1, 1,
-0.1150905, 1.249171, 1.51811, 0, 0, 0, 1, 1,
-0.1147892, -0.27772, -1.742614, 0, 0, 0, 1, 1,
-0.1132836, 1.211471, -0.2281219, 0, 0, 0, 1, 1,
-0.1124087, 0.4255612, 0.9312981, 1, 1, 1, 1, 1,
-0.1121889, 0.6494239, 0.2231425, 1, 1, 1, 1, 1,
-0.1112203, 0.1209704, -1.113379, 1, 1, 1, 1, 1,
-0.1078772, -0.5715858, -2.696548, 1, 1, 1, 1, 1,
-0.09923373, -0.4188462, -2.301569, 1, 1, 1, 1, 1,
-0.09770277, 2.155279, 0.9738239, 1, 1, 1, 1, 1,
-0.09621385, -0.9123842, -1.471511, 1, 1, 1, 1, 1,
-0.09469916, 0.9801856, -0.2128958, 1, 1, 1, 1, 1,
-0.09342437, 0.6958369, -0.413457, 1, 1, 1, 1, 1,
-0.09294493, 0.4466016, 1.438723, 1, 1, 1, 1, 1,
-0.09210351, 1.214094, -0.1475375, 1, 1, 1, 1, 1,
-0.08817009, -1.315812, -2.982528, 1, 1, 1, 1, 1,
-0.08713339, -0.07004314, -2.893652, 1, 1, 1, 1, 1,
-0.08533356, 1.68427, 0.4883817, 1, 1, 1, 1, 1,
-0.08496132, 0.395566, 1.269006, 1, 1, 1, 1, 1,
-0.07193278, 0.144466, 0.3005809, 0, 0, 1, 1, 1,
-0.06799892, 0.4483843, -1.181969, 1, 0, 0, 1, 1,
-0.0669753, 1.162349, 0.4309393, 1, 0, 0, 1, 1,
-0.06611934, -0.7579033, -3.222746, 1, 0, 0, 1, 1,
-0.06306481, 1.088197, 1.297419, 1, 0, 0, 1, 1,
-0.06211377, -2.531934, -3.724142, 1, 0, 0, 1, 1,
-0.06183447, 0.4338204, 0.2255516, 0, 0, 0, 1, 1,
-0.06066434, -0.3426904, -2.07005, 0, 0, 0, 1, 1,
-0.05878911, -0.5055055, -3.508831, 0, 0, 0, 1, 1,
-0.05729189, -1.756504, -3.648952, 0, 0, 0, 1, 1,
-0.05677103, 0.4622911, -1.150887, 0, 0, 0, 1, 1,
-0.05443714, -0.5799347, -2.494202, 0, 0, 0, 1, 1,
-0.04998844, 1.040624, 2.443827, 0, 0, 0, 1, 1,
-0.04995227, -2.046193, -3.324208, 1, 1, 1, 1, 1,
-0.04283537, 1.020782, 1.86668, 1, 1, 1, 1, 1,
-0.04062296, 1.141728, -0.05497969, 1, 1, 1, 1, 1,
-0.03906989, 0.467098, -1.433735, 1, 1, 1, 1, 1,
-0.03011784, 0.4374045, -1.545782, 1, 1, 1, 1, 1,
-0.02992125, 0.3871289, -0.3591487, 1, 1, 1, 1, 1,
-0.02892885, -1.192066, -3.446434, 1, 1, 1, 1, 1,
-0.02022067, 0.5949309, -0.9568323, 1, 1, 1, 1, 1,
-0.01407961, 0.6113563, -0.2293799, 1, 1, 1, 1, 1,
-0.01297938, 0.8349361, -0.03216269, 1, 1, 1, 1, 1,
-0.01196413, -1.4563, -2.15809, 1, 1, 1, 1, 1,
-0.004156275, -0.340525, -2.533713, 1, 1, 1, 1, 1,
0.0009365961, 1.834486, -0.7406703, 1, 1, 1, 1, 1,
0.007600819, 0.3268611, -0.5443007, 1, 1, 1, 1, 1,
0.008397819, -0.3760682, 2.428018, 1, 1, 1, 1, 1,
0.01523604, -1.330593, 2.807223, 0, 0, 1, 1, 1,
0.01804744, -1.079225, 2.022747, 1, 0, 0, 1, 1,
0.02035375, 1.763116, 1.460507, 1, 0, 0, 1, 1,
0.02233794, -0.124872, 2.69246, 1, 0, 0, 1, 1,
0.02576814, -0.4390373, 3.463654, 1, 0, 0, 1, 1,
0.02593445, -0.3451673, 1.278609, 1, 0, 0, 1, 1,
0.02692458, 1.504589, 0.1442045, 0, 0, 0, 1, 1,
0.02929211, -0.03298771, 4.380582, 0, 0, 0, 1, 1,
0.03045169, 0.8241098, 0.1656865, 0, 0, 0, 1, 1,
0.03120276, 1.707449, -2.360426, 0, 0, 0, 1, 1,
0.03767493, -0.6776291, 4.869474, 0, 0, 0, 1, 1,
0.03788065, -0.01096348, 0.6974613, 0, 0, 0, 1, 1,
0.038916, 0.5049549, -0.8045168, 0, 0, 0, 1, 1,
0.04229972, -0.5161431, 4.726428, 1, 1, 1, 1, 1,
0.04235546, 1.223459, -3.435741, 1, 1, 1, 1, 1,
0.04607318, 1.41577, -1.566391, 1, 1, 1, 1, 1,
0.05064353, -0.04159835, 1.521899, 1, 1, 1, 1, 1,
0.05141838, -1.644249, 2.511214, 1, 1, 1, 1, 1,
0.05171586, -0.884053, 0.9029221, 1, 1, 1, 1, 1,
0.05692627, -1.572598, 1.557027, 1, 1, 1, 1, 1,
0.05753877, 0.3688862, 0.2096358, 1, 1, 1, 1, 1,
0.0580048, 1.020982, -0.8400782, 1, 1, 1, 1, 1,
0.06016776, 0.8435929, 0.01223873, 1, 1, 1, 1, 1,
0.06198326, 2.350069, 1.96068, 1, 1, 1, 1, 1,
0.06255822, -0.5768741, 2.429968, 1, 1, 1, 1, 1,
0.06541368, -2.546122, 3.067562, 1, 1, 1, 1, 1,
0.06942209, -0.1467342, 1.97218, 1, 1, 1, 1, 1,
0.07022525, -0.1184507, 2.658556, 1, 1, 1, 1, 1,
0.0703622, 0.6390131, 0.5585494, 0, 0, 1, 1, 1,
0.07379945, 0.4074549, 0.01189362, 1, 0, 0, 1, 1,
0.0759614, -0.5339882, 1.243029, 1, 0, 0, 1, 1,
0.07824751, 0.03539015, 1.048389, 1, 0, 0, 1, 1,
0.07854161, 1.013252, -1.423928, 1, 0, 0, 1, 1,
0.08020604, 2.062412, 0.3200291, 1, 0, 0, 1, 1,
0.09248052, -1.626806, 3.515659, 0, 0, 0, 1, 1,
0.09252382, 0.4372918, -0.7516139, 0, 0, 0, 1, 1,
0.0929143, -0.2727874, 2.4083, 0, 0, 0, 1, 1,
0.09397766, 1.038266, 0.50748, 0, 0, 0, 1, 1,
0.09925367, -0.1190756, 2.213737, 0, 0, 0, 1, 1,
0.1001601, -0.2808385, 2.461347, 0, 0, 0, 1, 1,
0.100614, -1.083122, 3.32803, 0, 0, 0, 1, 1,
0.102835, -0.2808458, 3.98022, 1, 1, 1, 1, 1,
0.103242, -0.5383387, 0.8520743, 1, 1, 1, 1, 1,
0.1043665, -0.2406959, 4.15912, 1, 1, 1, 1, 1,
0.1071604, 1.68292, -0.1911005, 1, 1, 1, 1, 1,
0.1094736, -1.414423, 2.723337, 1, 1, 1, 1, 1,
0.1100472, -0.07027417, 0.2056985, 1, 1, 1, 1, 1,
0.1132939, 0.7903628, 1.660641, 1, 1, 1, 1, 1,
0.1135004, -0.9010402, 1.844118, 1, 1, 1, 1, 1,
0.1168106, -0.06958684, 1.906188, 1, 1, 1, 1, 1,
0.1181609, -0.4098515, 2.199799, 1, 1, 1, 1, 1,
0.1218508, 0.05296529, 1.901167, 1, 1, 1, 1, 1,
0.1267033, 0.4124695, 0.4526223, 1, 1, 1, 1, 1,
0.1293675, -0.8325654, 5.116487, 1, 1, 1, 1, 1,
0.1304126, -0.1572786, 3.020205, 1, 1, 1, 1, 1,
0.1339356, 1.721953, 0.8202034, 1, 1, 1, 1, 1,
0.1365272, -0.6786124, 2.152407, 0, 0, 1, 1, 1,
0.1375726, -0.06749143, 3.705673, 1, 0, 0, 1, 1,
0.1399981, 0.1153665, 2.327459, 1, 0, 0, 1, 1,
0.1436525, -0.08482274, 0.5879028, 1, 0, 0, 1, 1,
0.1461307, 1.159107, -0.6336578, 1, 0, 0, 1, 1,
0.148629, 0.1241498, 1.148124, 1, 0, 0, 1, 1,
0.1490871, -0.3465092, 0.8529444, 0, 0, 0, 1, 1,
0.1524665, -1.231734, 3.589849, 0, 0, 0, 1, 1,
0.1540212, -0.998885, 4.002164, 0, 0, 0, 1, 1,
0.1556952, 0.1279341, 2.323439, 0, 0, 0, 1, 1,
0.1568902, 0.4355856, 0.3406596, 0, 0, 0, 1, 1,
0.1572725, -1.518328, 2.513859, 0, 0, 0, 1, 1,
0.1600035, 0.6886095, 1.236357, 0, 0, 0, 1, 1,
0.1609137, 0.9616944, -2.634656, 1, 1, 1, 1, 1,
0.1617033, -1.224183, 1.931918, 1, 1, 1, 1, 1,
0.1635242, 0.8213716, -0.381347, 1, 1, 1, 1, 1,
0.1653349, 0.959142, -0.360979, 1, 1, 1, 1, 1,
0.1676937, -0.2959002, 3.572246, 1, 1, 1, 1, 1,
0.1687859, 1.019021, 0.2419627, 1, 1, 1, 1, 1,
0.1695465, -0.0004617984, 0.8568364, 1, 1, 1, 1, 1,
0.1730467, 2.167426, -0.4097496, 1, 1, 1, 1, 1,
0.180607, 0.4817381, 1.166007, 1, 1, 1, 1, 1,
0.1809882, -0.3477309, 3.592899, 1, 1, 1, 1, 1,
0.182215, 0.09033386, 1.78857, 1, 1, 1, 1, 1,
0.1833452, 0.6717392, -0.01314067, 1, 1, 1, 1, 1,
0.1882758, 0.9875997, 1.510806, 1, 1, 1, 1, 1,
0.1897483, 0.6803993, 1.864419, 1, 1, 1, 1, 1,
0.1906436, -0.2529354, 4.591814, 1, 1, 1, 1, 1,
0.1948863, 0.1375979, 1.828124, 0, 0, 1, 1, 1,
0.1959532, 0.09874188, 0.1459306, 1, 0, 0, 1, 1,
0.1971465, 0.04294772, 0.7996711, 1, 0, 0, 1, 1,
0.1981563, 0.6843811, -1.14091, 1, 0, 0, 1, 1,
0.2002722, 1.054679, 0.457298, 1, 0, 0, 1, 1,
0.2006247, 0.03930686, 0.7928722, 1, 0, 0, 1, 1,
0.2011529, -2.450843, 2.058014, 0, 0, 0, 1, 1,
0.2025771, 0.1796591, 2.617971, 0, 0, 0, 1, 1,
0.2072185, 0.7858294, 0.5513347, 0, 0, 0, 1, 1,
0.2101313, 1.970449, -1.694282, 0, 0, 0, 1, 1,
0.2107387, 2.330181, -1.313831, 0, 0, 0, 1, 1,
0.2136751, -0.3693906, 1.10562, 0, 0, 0, 1, 1,
0.2144564, 1.16204, 0.03761964, 0, 0, 0, 1, 1,
0.2147038, -0.0953782, 0.9120355, 1, 1, 1, 1, 1,
0.2181174, 0.1835464, -0.5441443, 1, 1, 1, 1, 1,
0.2192702, -0.4421592, 2.26973, 1, 1, 1, 1, 1,
0.2208031, 0.7399145, -0.07511098, 1, 1, 1, 1, 1,
0.2215523, 1.287614, 0.9487062, 1, 1, 1, 1, 1,
0.225635, 0.7755412, 0.0923044, 1, 1, 1, 1, 1,
0.2270061, -0.4183365, 1.94547, 1, 1, 1, 1, 1,
0.2283691, 0.9552492, 0.935411, 1, 1, 1, 1, 1,
0.2288331, -0.9890572, 3.988689, 1, 1, 1, 1, 1,
0.2293381, -2.522094, 2.468885, 1, 1, 1, 1, 1,
0.2304363, -1.092529, 3.540523, 1, 1, 1, 1, 1,
0.2330311, -0.4695358, 3.457638, 1, 1, 1, 1, 1,
0.2333145, -0.7799923, 2.97391, 1, 1, 1, 1, 1,
0.2337905, 0.8110957, 0.6594914, 1, 1, 1, 1, 1,
0.234541, -0.5771098, 3.037664, 1, 1, 1, 1, 1,
0.2406096, -0.7982531, 3.422126, 0, 0, 1, 1, 1,
0.2408505, -0.2703782, 1.398369, 1, 0, 0, 1, 1,
0.2424036, 0.6997693, 0.27756, 1, 0, 0, 1, 1,
0.2431985, -1.264333, 2.44464, 1, 0, 0, 1, 1,
0.2467573, -1.678563, 3.257779, 1, 0, 0, 1, 1,
0.250898, 0.04805043, 2.238252, 1, 0, 0, 1, 1,
0.2514177, 1.134961, 0.1451131, 0, 0, 0, 1, 1,
0.2527482, -0.4965176, 1.909338, 0, 0, 0, 1, 1,
0.2538332, -2.315961, 2.231719, 0, 0, 0, 1, 1,
0.2570584, -1.062577, 3.471136, 0, 0, 0, 1, 1,
0.2586418, -0.7146741, 3.048233, 0, 0, 0, 1, 1,
0.2618909, -0.757387, 3.530467, 0, 0, 0, 1, 1,
0.2628498, -0.3417526, 2.300168, 0, 0, 0, 1, 1,
0.2640484, -1.884736, 3.473151, 1, 1, 1, 1, 1,
0.2715116, 1.741158, -0.1461177, 1, 1, 1, 1, 1,
0.2729451, 1.10755, 0.404894, 1, 1, 1, 1, 1,
0.2786146, 0.1193228, 0.6928816, 1, 1, 1, 1, 1,
0.2796121, -0.5551019, 2.435107, 1, 1, 1, 1, 1,
0.2828137, -0.07211241, 1.469888, 1, 1, 1, 1, 1,
0.2848134, 0.6868686, 0.9518555, 1, 1, 1, 1, 1,
0.2908917, -0.01348138, 2.631494, 1, 1, 1, 1, 1,
0.2928704, 0.3504983, -0.6861457, 1, 1, 1, 1, 1,
0.2957873, 0.7654309, -0.51022, 1, 1, 1, 1, 1,
0.295799, 0.4755841, -0.5866005, 1, 1, 1, 1, 1,
0.2971241, -0.3323386, 1.524348, 1, 1, 1, 1, 1,
0.3018143, 1.299391, -0.4432816, 1, 1, 1, 1, 1,
0.3028053, -0.3205974, 2.643287, 1, 1, 1, 1, 1,
0.3029018, -0.2820384, 1.779828, 1, 1, 1, 1, 1,
0.3048966, -3.641743, 4.036408, 0, 0, 1, 1, 1,
0.3070084, 0.9317418, 0.7222681, 1, 0, 0, 1, 1,
0.3077015, -0.6281056, 3.876603, 1, 0, 0, 1, 1,
0.3099491, 0.7728755, -0.6851532, 1, 0, 0, 1, 1,
0.3119438, -1.656313, 3.883463, 1, 0, 0, 1, 1,
0.3128404, -0.3042313, 1.097534, 1, 0, 0, 1, 1,
0.3138785, -0.8441578, 2.282993, 0, 0, 0, 1, 1,
0.3154697, -0.7081876, 2.418798, 0, 0, 0, 1, 1,
0.3178628, 0.8739026, -0.1459482, 0, 0, 0, 1, 1,
0.3180842, -0.6753769, 2.080362, 0, 0, 0, 1, 1,
0.3216585, 0.9369835, -0.609931, 0, 0, 0, 1, 1,
0.3227452, -1.785176, 4.008255, 0, 0, 0, 1, 1,
0.3237799, 1.587433, -0.1025819, 0, 0, 0, 1, 1,
0.3257528, 0.3543375, -0.461136, 1, 1, 1, 1, 1,
0.3265746, -0.2637949, 2.895766, 1, 1, 1, 1, 1,
0.3273512, -0.8380958, 2.483302, 1, 1, 1, 1, 1,
0.3323107, 1.470887, 1.628446, 1, 1, 1, 1, 1,
0.3331982, -1.048134, 3.137293, 1, 1, 1, 1, 1,
0.33563, 0.4218432, -0.8540736, 1, 1, 1, 1, 1,
0.3379863, -0.5105949, 1.33717, 1, 1, 1, 1, 1,
0.3419381, 0.9041784, 0.255661, 1, 1, 1, 1, 1,
0.3441015, -0.147919, 2.458016, 1, 1, 1, 1, 1,
0.3442431, -1.486113, 2.737946, 1, 1, 1, 1, 1,
0.3456621, 1.007191, 0.02217212, 1, 1, 1, 1, 1,
0.3524617, -0.8297412, 1.46292, 1, 1, 1, 1, 1,
0.3535418, 0.6725699, 1.077027, 1, 1, 1, 1, 1,
0.3542242, 0.04558662, 2.585739, 1, 1, 1, 1, 1,
0.3545487, -1.4013, 3.813625, 1, 1, 1, 1, 1,
0.3554537, 0.0006605179, 2.137117, 0, 0, 1, 1, 1,
0.3587774, -0.6059602, 2.628817, 1, 0, 0, 1, 1,
0.3590209, 0.2094094, 0.8673942, 1, 0, 0, 1, 1,
0.3590839, -1.476152, 4.067194, 1, 0, 0, 1, 1,
0.3597527, -1.351369, 4.42198, 1, 0, 0, 1, 1,
0.3667853, -0.3859095, 2.294208, 1, 0, 0, 1, 1,
0.3681626, -0.7400231, 1.596549, 0, 0, 0, 1, 1,
0.3690676, -0.9989851, 1.192638, 0, 0, 0, 1, 1,
0.3696843, -0.3007936, 5.522673, 0, 0, 0, 1, 1,
0.3769453, -0.4622152, 3.282051, 0, 0, 0, 1, 1,
0.3776477, 2.006516, 0.1583047, 0, 0, 0, 1, 1,
0.3779982, -0.6921883, 1.56472, 0, 0, 0, 1, 1,
0.3786123, -1.135028, 4.05784, 0, 0, 0, 1, 1,
0.3796744, 0.5069168, -0.6205449, 1, 1, 1, 1, 1,
0.3824582, -0.06960939, 3.354589, 1, 1, 1, 1, 1,
0.3853233, -0.2814148, 2.976595, 1, 1, 1, 1, 1,
0.3896353, -0.1785867, 1.603202, 1, 1, 1, 1, 1,
0.3990765, -0.8373463, 2.47159, 1, 1, 1, 1, 1,
0.420058, 0.6928138, 0.966615, 1, 1, 1, 1, 1,
0.4229738, -0.002289997, 2.655361, 1, 1, 1, 1, 1,
0.4287669, -0.03467461, 0.6807585, 1, 1, 1, 1, 1,
0.4293704, 1.593358, 1.112879, 1, 1, 1, 1, 1,
0.4321844, -0.8051027, 2.805119, 1, 1, 1, 1, 1,
0.436379, -0.3904622, 1.557912, 1, 1, 1, 1, 1,
0.4371811, -1.65194, 1.730651, 1, 1, 1, 1, 1,
0.4391689, -0.3954512, 3.170301, 1, 1, 1, 1, 1,
0.4394958, 0.7750118, 0.7805467, 1, 1, 1, 1, 1,
0.4404924, 0.06259016, 1.635235, 1, 1, 1, 1, 1,
0.4417538, 0.0729158, 0.2776196, 0, 0, 1, 1, 1,
0.4502919, -0.6402301, 2.056062, 1, 0, 0, 1, 1,
0.4515319, 1.128608, 1.115306, 1, 0, 0, 1, 1,
0.4530204, 0.1192374, -0.1485866, 1, 0, 0, 1, 1,
0.4538972, 0.08771001, 2.936912, 1, 0, 0, 1, 1,
0.4538981, 0.8019674, 0.9698905, 1, 0, 0, 1, 1,
0.4564633, 0.5751629, 2.003494, 0, 0, 0, 1, 1,
0.457857, 0.2270762, 1.502144, 0, 0, 0, 1, 1,
0.4580409, -0.5380117, 3.179839, 0, 0, 0, 1, 1,
0.4616418, -0.01416029, 4.058342, 0, 0, 0, 1, 1,
0.4630144, 2.205104, 1.090016, 0, 0, 0, 1, 1,
0.47035, 0.8528, -0.2135572, 0, 0, 0, 1, 1,
0.4744009, 0.5367482, 1.986971, 0, 0, 0, 1, 1,
0.4883819, 0.8557547, 0.2428689, 1, 1, 1, 1, 1,
0.4913405, -0.4571449, 0.005745852, 1, 1, 1, 1, 1,
0.4948536, -0.2781689, 1.295253, 1, 1, 1, 1, 1,
0.4949659, 0.09970591, 2.489386, 1, 1, 1, 1, 1,
0.498745, 0.3938361, 2.34197, 1, 1, 1, 1, 1,
0.4989413, -1.164509, 3.572995, 1, 1, 1, 1, 1,
0.5044593, 0.1914985, 0.714948, 1, 1, 1, 1, 1,
0.5057015, -0.639393, 2.860178, 1, 1, 1, 1, 1,
0.5145494, -1.178303, 2.382507, 1, 1, 1, 1, 1,
0.5203438, -1.533099, 1.964823, 1, 1, 1, 1, 1,
0.5279546, -0.4172819, 1.420125, 1, 1, 1, 1, 1,
0.5399791, -1.763817, 2.37388, 1, 1, 1, 1, 1,
0.5443037, 0.1956769, 1.346791, 1, 1, 1, 1, 1,
0.5452268, 0.7035752, -0.4705457, 1, 1, 1, 1, 1,
0.5614527, -0.8304301, 0.8439582, 1, 1, 1, 1, 1,
0.5626888, -0.1733388, 1.613865, 0, 0, 1, 1, 1,
0.5714045, 0.9246306, 1.750524, 1, 0, 0, 1, 1,
0.5760195, 0.3250111, 2.118061, 1, 0, 0, 1, 1,
0.5789635, 0.5187678, 1.980802, 1, 0, 0, 1, 1,
0.5837946, -1.904514, 3.318484, 1, 0, 0, 1, 1,
0.5897979, 1.270592, -0.2199652, 1, 0, 0, 1, 1,
0.590611, 0.05508806, 1.78411, 0, 0, 0, 1, 1,
0.5999078, -0.2198166, 2.165337, 0, 0, 0, 1, 1,
0.6043751, 1.179722, -0.3017553, 0, 0, 0, 1, 1,
0.6089681, 1.070375, -0.1941632, 0, 0, 0, 1, 1,
0.610801, -2.191675, 1.832808, 0, 0, 0, 1, 1,
0.6160542, 0.6011653, 0.7427034, 0, 0, 0, 1, 1,
0.6162427, -1.559043, 2.747106, 0, 0, 0, 1, 1,
0.6188381, 0.8704591, -1.327882, 1, 1, 1, 1, 1,
0.6291355, 1.93571, 0.451827, 1, 1, 1, 1, 1,
0.6302917, -0.1528044, 1.494329, 1, 1, 1, 1, 1,
0.6328254, 2.426522, -0.9860229, 1, 1, 1, 1, 1,
0.6333328, -0.1013925, 1.18957, 1, 1, 1, 1, 1,
0.6350914, 1.551995, 0.9396105, 1, 1, 1, 1, 1,
0.6352773, 0.08206739, 0.3252256, 1, 1, 1, 1, 1,
0.6404124, -0.9551836, 4.179817, 1, 1, 1, 1, 1,
0.6408879, -0.01296872, 2.260141, 1, 1, 1, 1, 1,
0.6443434, 1.347541, -0.6528518, 1, 1, 1, 1, 1,
0.6487654, 1.103594, -0.01414415, 1, 1, 1, 1, 1,
0.6645908, -0.5112321, 1.535479, 1, 1, 1, 1, 1,
0.6646917, -0.2133266, 0.3710081, 1, 1, 1, 1, 1,
0.6656705, -0.8548378, 0.0117337, 1, 1, 1, 1, 1,
0.6663775, -0.5364939, 2.740122, 1, 1, 1, 1, 1,
0.6691943, 0.528744, 1.350603, 0, 0, 1, 1, 1,
0.6728765, -0.7374735, 1.567574, 1, 0, 0, 1, 1,
0.6768684, 1.335768, 0.9697819, 1, 0, 0, 1, 1,
0.6769769, 0.7737743, 0.978883, 1, 0, 0, 1, 1,
0.677797, -0.3453173, 3.501428, 1, 0, 0, 1, 1,
0.6780207, -3.568315, 2.773931, 1, 0, 0, 1, 1,
0.6781524, 1.841589, 0.2709651, 0, 0, 0, 1, 1,
0.6800607, 0.3352975, -0.6971045, 0, 0, 0, 1, 1,
0.6821737, -0.8877681, 2.956339, 0, 0, 0, 1, 1,
0.6856353, -0.9097062, 2.007365, 0, 0, 0, 1, 1,
0.6882164, -0.02701928, 1.638011, 0, 0, 0, 1, 1,
0.6943925, -0.6218818, 4.230501, 0, 0, 0, 1, 1,
0.6964884, -2.332279, 3.514247, 0, 0, 0, 1, 1,
0.696686, 0.917793, -0.9937938, 1, 1, 1, 1, 1,
0.6969838, -0.3331328, 2.667876, 1, 1, 1, 1, 1,
0.704863, -0.6156009, 1.792972, 1, 1, 1, 1, 1,
0.710857, 0.5051717, 1.391559, 1, 1, 1, 1, 1,
0.7114018, 0.4464922, 1.90893, 1, 1, 1, 1, 1,
0.7127784, 1.617186, 0.2320014, 1, 1, 1, 1, 1,
0.7133551, -0.3691154, 3.146334, 1, 1, 1, 1, 1,
0.7145504, -0.5072858, 1.371346, 1, 1, 1, 1, 1,
0.7178448, -0.6718159, 2.312265, 1, 1, 1, 1, 1,
0.7218052, -0.9375561, 2.559658, 1, 1, 1, 1, 1,
0.7220692, -0.8318914, 2.225901, 1, 1, 1, 1, 1,
0.7228214, 1.186889, -0.3614607, 1, 1, 1, 1, 1,
0.724148, 1.658364, 1.712626, 1, 1, 1, 1, 1,
0.7280965, 0.9678695, -1.827665, 1, 1, 1, 1, 1,
0.7302018, -0.6307102, 2.887696, 1, 1, 1, 1, 1,
0.7386559, 0.1587283, 1.303633, 0, 0, 1, 1, 1,
0.7447971, 0.3775595, 0.9895252, 1, 0, 0, 1, 1,
0.7465578, -0.3691662, 0.837734, 1, 0, 0, 1, 1,
0.752697, 0.3520816, 0.4317345, 1, 0, 0, 1, 1,
0.7548617, -1.122663, 2.3891, 1, 0, 0, 1, 1,
0.7587371, -1.731732, 3.771338, 1, 0, 0, 1, 1,
0.7599092, -0.2000723, 2.817434, 0, 0, 0, 1, 1,
0.7634014, 1.73019, 0.959457, 0, 0, 0, 1, 1,
0.7652786, -0.240903, 1.50253, 0, 0, 0, 1, 1,
0.7661329, -0.1589238, 0.7085632, 0, 0, 0, 1, 1,
0.766724, -0.1921649, 1.344031, 0, 0, 0, 1, 1,
0.7754664, 0.640221, 0.8364636, 0, 0, 0, 1, 1,
0.7797299, -0.6519459, 1.179568, 0, 0, 0, 1, 1,
0.7817774, 1.02775, 0.1369785, 1, 1, 1, 1, 1,
0.7853154, 0.574867, 1.826725, 1, 1, 1, 1, 1,
0.7901309, -0.08243313, 1.915759, 1, 1, 1, 1, 1,
0.7939125, -1.40718, 2.874677, 1, 1, 1, 1, 1,
0.7964529, -2.028674, 1.370902, 1, 1, 1, 1, 1,
0.79693, -0.6176203, 1.075673, 1, 1, 1, 1, 1,
0.7981844, 1.605884, 0.8909094, 1, 1, 1, 1, 1,
0.7988746, -0.9728646, 3.366717, 1, 1, 1, 1, 1,
0.7993945, -0.2390453, 2.222696, 1, 1, 1, 1, 1,
0.7998077, 1.18166, 1.284412, 1, 1, 1, 1, 1,
0.8000987, 0.6633232, 1.149965, 1, 1, 1, 1, 1,
0.8012657, 0.007707037, -0.1135888, 1, 1, 1, 1, 1,
0.8020142, -1.477399, 4.180989, 1, 1, 1, 1, 1,
0.8052503, 2.302097, -0.2910429, 1, 1, 1, 1, 1,
0.8188684, -0.09825246, 2.196194, 1, 1, 1, 1, 1,
0.8212107, -0.3173666, 2.267603, 0, 0, 1, 1, 1,
0.8215642, -0.1930624, 1.178434, 1, 0, 0, 1, 1,
0.8227348, 0.3730909, 0.8590189, 1, 0, 0, 1, 1,
0.8270304, -0.4851972, 1.674993, 1, 0, 0, 1, 1,
0.8302761, 0.5786851, 1.728785, 1, 0, 0, 1, 1,
0.8312318, 2.9124, -0.0115549, 1, 0, 0, 1, 1,
0.8394222, 0.6489251, -0.02600088, 0, 0, 0, 1, 1,
0.8422335, 2.039427, -0.3723484, 0, 0, 0, 1, 1,
0.8445746, -0.8137401, 2.335131, 0, 0, 0, 1, 1,
0.8446151, -0.5057399, 2.201884, 0, 0, 0, 1, 1,
0.8479574, 0.6078026, 0.6346592, 0, 0, 0, 1, 1,
0.8490264, -2.23685, 2.201427, 0, 0, 0, 1, 1,
0.8492528, -0.01426642, 1.720767, 0, 0, 0, 1, 1,
0.8598512, 0.3184128, 1.34785, 1, 1, 1, 1, 1,
0.8625838, 1.41786, 1.209433, 1, 1, 1, 1, 1,
0.8632737, 0.9289713, -0.1259299, 1, 1, 1, 1, 1,
0.8637225, -0.7336138, 1.120221, 1, 1, 1, 1, 1,
0.8646379, 1.466327, 0.2871764, 1, 1, 1, 1, 1,
0.8661566, -0.3976812, 1.894811, 1, 1, 1, 1, 1,
0.8665761, -3.112269, 2.700646, 1, 1, 1, 1, 1,
0.8759964, 0.1712128, 1.642671, 1, 1, 1, 1, 1,
0.8766526, 0.2970174, 0.687197, 1, 1, 1, 1, 1,
0.8767985, 2.076756, -0.8090439, 1, 1, 1, 1, 1,
0.8815425, -0.4654311, 1.421405, 1, 1, 1, 1, 1,
0.892002, 1.536584, 2.450428, 1, 1, 1, 1, 1,
0.8954954, -0.03316825, 1.344545, 1, 1, 1, 1, 1,
0.8991091, 1.670063, 0.150753, 1, 1, 1, 1, 1,
0.9007019, 0.377162, 2.766748, 1, 1, 1, 1, 1,
0.9015273, 0.9176136, 0.4980237, 0, 0, 1, 1, 1,
0.9046556, -1.158562, 2.064598, 1, 0, 0, 1, 1,
0.9048572, -0.4598008, 0.534954, 1, 0, 0, 1, 1,
0.9067042, -1.265161, 2.943939, 1, 0, 0, 1, 1,
0.9179649, 1.149429, 1.337334, 1, 0, 0, 1, 1,
0.9218481, -1.016032, 1.575199, 1, 0, 0, 1, 1,
0.9243594, -0.1998143, 2.238027, 0, 0, 0, 1, 1,
0.9286911, -1.401187, 2.964339, 0, 0, 0, 1, 1,
0.9291206, -2.032356, 1.6167, 0, 0, 0, 1, 1,
0.9327769, -0.04688081, 0.6454465, 0, 0, 0, 1, 1,
0.9421843, 0.07009717, 2.809467, 0, 0, 0, 1, 1,
0.9587715, -0.5433402, 0.972657, 0, 0, 0, 1, 1,
0.9618388, -0.03381182, 0.8186423, 0, 0, 0, 1, 1,
0.9628932, 0.8833045, -0.19668, 1, 1, 1, 1, 1,
0.964309, 0.4557784, 0.5820205, 1, 1, 1, 1, 1,
0.9651144, 1.648265, 2.370459, 1, 1, 1, 1, 1,
0.9658267, -0.008034991, 2.415303, 1, 1, 1, 1, 1,
0.9748743, 0.4765996, 0.1611525, 1, 1, 1, 1, 1,
0.9757124, 1.64014, 0.9929277, 1, 1, 1, 1, 1,
0.97945, -2.896233, 1.839353, 1, 1, 1, 1, 1,
0.9802855, -1.554897, 2.711141, 1, 1, 1, 1, 1,
0.9877087, -0.4664747, 2.470963, 1, 1, 1, 1, 1,
0.9945161, -1.825908, 1.964053, 1, 1, 1, 1, 1,
0.998045, -0.1019555, 1.428799, 1, 1, 1, 1, 1,
1.005355, 2.81123, 2.226682, 1, 1, 1, 1, 1,
1.010211, -0.2518989, 1.514689, 1, 1, 1, 1, 1,
1.015776, -1.158913, 2.296801, 1, 1, 1, 1, 1,
1.019066, -1.079258, 1.731174, 1, 1, 1, 1, 1,
1.020202, -0.0911025, 0.8920009, 0, 0, 1, 1, 1,
1.027014, -1.480023, 4.426349, 1, 0, 0, 1, 1,
1.031544, -0.740158, 1.422253, 1, 0, 0, 1, 1,
1.032074, 0.4492447, -0.6549965, 1, 0, 0, 1, 1,
1.033103, 0.7376831, 0.5951127, 1, 0, 0, 1, 1,
1.042867, 0.7857159, 0.878994, 1, 0, 0, 1, 1,
1.043109, 1.378684, 0.2991691, 0, 0, 0, 1, 1,
1.046863, -0.4595197, 1.93971, 0, 0, 0, 1, 1,
1.048492, -0.08502391, 1.761802, 0, 0, 0, 1, 1,
1.054247, -0.9009656, 0.01160607, 0, 0, 0, 1, 1,
1.055563, 1.705919, 1.37973, 0, 0, 0, 1, 1,
1.056258, 0.6011639, -0.2145158, 0, 0, 0, 1, 1,
1.062318, 1.003136, 0.2473335, 0, 0, 0, 1, 1,
1.062579, 0.1655151, 0.6877843, 1, 1, 1, 1, 1,
1.063534, -1.55992, 2.85819, 1, 1, 1, 1, 1,
1.075836, -0.4620344, 2.96873, 1, 1, 1, 1, 1,
1.076628, -0.9462572, 4.639576, 1, 1, 1, 1, 1,
1.084636, 1.313472, 1.673307, 1, 1, 1, 1, 1,
1.08694, -0.1142795, 1.681332, 1, 1, 1, 1, 1,
1.088288, 0.445073, 0.9622211, 1, 1, 1, 1, 1,
1.090394, 1.086636, 1.793496, 1, 1, 1, 1, 1,
1.091652, -0.1835603, 2.728768, 1, 1, 1, 1, 1,
1.102231, 1.185448, 0.2823336, 1, 1, 1, 1, 1,
1.102335, -0.4150031, 0.9500564, 1, 1, 1, 1, 1,
1.104533, -1.42326, 1.440655, 1, 1, 1, 1, 1,
1.135667, 0.3640255, 0.3612039, 1, 1, 1, 1, 1,
1.136923, -3.161343, 2.998963, 1, 1, 1, 1, 1,
1.14011, 0.3506854, 0.8470304, 1, 1, 1, 1, 1,
1.144117, -0.2138547, 0.1565939, 0, 0, 1, 1, 1,
1.145579, -0.7204004, 1.402542, 1, 0, 0, 1, 1,
1.155067, -1.034398, 2.955079, 1, 0, 0, 1, 1,
1.16273, -0.3021058, -1.513581, 1, 0, 0, 1, 1,
1.163419, -0.6880798, 1.243776, 1, 0, 0, 1, 1,
1.169212, 0.5104345, 0.2719221, 1, 0, 0, 1, 1,
1.169363, -0.9002034, 1.475862, 0, 0, 0, 1, 1,
1.170166, -0.2316673, 1.042661, 0, 0, 0, 1, 1,
1.174396, -2.348185, 3.159129, 0, 0, 0, 1, 1,
1.180455, 0.500479, 0.8506446, 0, 0, 0, 1, 1,
1.181271, 0.1173685, 1.811673, 0, 0, 0, 1, 1,
1.183533, -0.563824, 1.508736, 0, 0, 0, 1, 1,
1.187521, 1.166182, 2.60035, 0, 0, 0, 1, 1,
1.190973, -1.260322, 3.245739, 1, 1, 1, 1, 1,
1.192477, 0.6591681, 2.228299, 1, 1, 1, 1, 1,
1.198463, 0.392016, 1.765092, 1, 1, 1, 1, 1,
1.199042, 0.6837965, 1.601369, 1, 1, 1, 1, 1,
1.199691, 0.08742031, 2.752854, 1, 1, 1, 1, 1,
1.201284, 0.3716809, -0.6511466, 1, 1, 1, 1, 1,
1.201977, -0.6350222, 3.126565, 1, 1, 1, 1, 1,
1.204176, -1.180971, 1.335991, 1, 1, 1, 1, 1,
1.215652, 0.9245313, -0.2872553, 1, 1, 1, 1, 1,
1.218476, 0.14929, 2.661892, 1, 1, 1, 1, 1,
1.220463, -1.678477, 2.796188, 1, 1, 1, 1, 1,
1.223992, -0.4275918, 3.507286, 1, 1, 1, 1, 1,
1.235617, 0.9025962, 2.025489, 1, 1, 1, 1, 1,
1.238612, -1.25308, 5.373685, 1, 1, 1, 1, 1,
1.241533, -0.9575141, 2.081105, 1, 1, 1, 1, 1,
1.252116, -0.6738132, 2.937243, 0, 0, 1, 1, 1,
1.252553, 1.52768, -0.130949, 1, 0, 0, 1, 1,
1.262862, 1.538301, 0.5154212, 1, 0, 0, 1, 1,
1.264548, -0.2378266, 1.809483, 1, 0, 0, 1, 1,
1.2657, 0.06446756, 2.224709, 1, 0, 0, 1, 1,
1.287344, -1.427738, 1.400711, 1, 0, 0, 1, 1,
1.291853, -0.7337788, 2.157258, 0, 0, 0, 1, 1,
1.294953, -1.507341, 0.3049713, 0, 0, 0, 1, 1,
1.310879, -0.4400801, 3.324442, 0, 0, 0, 1, 1,
1.313016, -0.3768509, 1.465058, 0, 0, 0, 1, 1,
1.314984, 2.557764, 1.858419, 0, 0, 0, 1, 1,
1.326158, 1.689734, -0.2757372, 0, 0, 0, 1, 1,
1.32752, 0.5814688, 1.910957, 0, 0, 0, 1, 1,
1.336701, 1.023869, 0.585187, 1, 1, 1, 1, 1,
1.346832, -0.3400364, 1.157984, 1, 1, 1, 1, 1,
1.348978, -0.8202644, 2.457891, 1, 1, 1, 1, 1,
1.355894, 0.9721475, -0.05221031, 1, 1, 1, 1, 1,
1.356461, -0.9385492, 1.593108, 1, 1, 1, 1, 1,
1.364851, -0.03190047, 1.775172, 1, 1, 1, 1, 1,
1.370987, 1.114506, 0.7831923, 1, 1, 1, 1, 1,
1.377981, 0.4782859, 2.276642, 1, 1, 1, 1, 1,
1.383561, -0.4976051, 2.436795, 1, 1, 1, 1, 1,
1.385617, 0.7730181, -0.3199012, 1, 1, 1, 1, 1,
1.385762, -0.02231481, 2.135285, 1, 1, 1, 1, 1,
1.386913, 0.2518882, 1.901497, 1, 1, 1, 1, 1,
1.400304, -1.375784, 2.739328, 1, 1, 1, 1, 1,
1.407051, -0.868347, 1.942878, 1, 1, 1, 1, 1,
1.417524, 0.469234, 0.1404294, 1, 1, 1, 1, 1,
1.420079, -0.006771612, 1.204842, 0, 0, 1, 1, 1,
1.438955, 0.9560736, -0.3293625, 1, 0, 0, 1, 1,
1.44899, -1.432703, 0.6660834, 1, 0, 0, 1, 1,
1.457222, 2.566818, 0.3397549, 1, 0, 0, 1, 1,
1.461499, 2.016533, -0.3632119, 1, 0, 0, 1, 1,
1.467211, 0.2342269, 2.764404, 1, 0, 0, 1, 1,
1.488777, -0.01451669, 0.9205, 0, 0, 0, 1, 1,
1.494485, -0.7419221, 2.685526, 0, 0, 0, 1, 1,
1.524224, 0.02985065, 3.775864, 0, 0, 0, 1, 1,
1.535019, -0.1710492, 1.608115, 0, 0, 0, 1, 1,
1.535693, 0.5446957, 0.5605243, 0, 0, 0, 1, 1,
1.53864, 0.6240127, 1.173071, 0, 0, 0, 1, 1,
1.558235, -1.200134, 2.220065, 0, 0, 0, 1, 1,
1.561832, 1.329898, 2.007143, 1, 1, 1, 1, 1,
1.57708, -0.06905874, 1.745136, 1, 1, 1, 1, 1,
1.579413, 1.228875, 0.5129979, 1, 1, 1, 1, 1,
1.588761, 0.03099515, 1.317216, 1, 1, 1, 1, 1,
1.590415, 0.7125097, 1.925858, 1, 1, 1, 1, 1,
1.591503, -0.6256019, 0.5528941, 1, 1, 1, 1, 1,
1.598859, 0.5980799, 0.3168299, 1, 1, 1, 1, 1,
1.605915, -1.55353, 0.7717825, 1, 1, 1, 1, 1,
1.607463, -0.08081254, 1.66926, 1, 1, 1, 1, 1,
1.61754, -0.4054821, 0.4494543, 1, 1, 1, 1, 1,
1.637131, 0.4502449, 1.812592, 1, 1, 1, 1, 1,
1.64005, -1.093632, 3.042267, 1, 1, 1, 1, 1,
1.646774, -0.4314251, 1.313901, 1, 1, 1, 1, 1,
1.652171, -0.8531186, 1.698172, 1, 1, 1, 1, 1,
1.658631, 0.519728, 0.07836802, 1, 1, 1, 1, 1,
1.658968, 0.2183003, 0.09169391, 0, 0, 1, 1, 1,
1.67881, -0.5751234, 2.767715, 1, 0, 0, 1, 1,
1.708416, -0.2617658, 2.201503, 1, 0, 0, 1, 1,
1.715365, 0.3463584, 1.242823, 1, 0, 0, 1, 1,
1.768214, 1.454808, -1.168414, 1, 0, 0, 1, 1,
1.769111, -1.71135, 2.355672, 1, 0, 0, 1, 1,
1.786775, 0.771575, 1.143669, 0, 0, 0, 1, 1,
1.810855, 2.539888, -0.2811752, 0, 0, 0, 1, 1,
1.820698, 1.21932, 0.5427834, 0, 0, 0, 1, 1,
1.829071, -0.7216922, 3.710361, 0, 0, 0, 1, 1,
1.851864, -0.02375344, 2.724718, 0, 0, 0, 1, 1,
1.857133, 1.715932, 1.017702, 0, 0, 0, 1, 1,
1.88726, -0.7321603, 1.807753, 0, 0, 0, 1, 1,
1.956948, -0.6698472, 1.092374, 1, 1, 1, 1, 1,
1.964823, -0.7118803, 1.992156, 1, 1, 1, 1, 1,
2.010358, -1.147451, 3.040978, 1, 1, 1, 1, 1,
2.032616, 0.7490315, 0.2970062, 1, 1, 1, 1, 1,
2.040481, -0.3570353, 0.4206805, 1, 1, 1, 1, 1,
2.064153, 0.6418733, 1.594602, 1, 1, 1, 1, 1,
2.075727, 0.5424004, -1.220399, 1, 1, 1, 1, 1,
2.081978, 0.08323622, 1.666945, 1, 1, 1, 1, 1,
2.086462, 0.1689455, 2.620159, 1, 1, 1, 1, 1,
2.090875, 1.532365, 0.2021361, 1, 1, 1, 1, 1,
2.097591, -0.7285895, 1.859566, 1, 1, 1, 1, 1,
2.098459, 0.9493988, -0.1346464, 1, 1, 1, 1, 1,
2.110962, 0.6785719, 2.680315, 1, 1, 1, 1, 1,
2.136643, 0.03738139, 0.4075446, 1, 1, 1, 1, 1,
2.139642, 0.7008511, 1.749139, 1, 1, 1, 1, 1,
2.14843, -1.312378, 1.482763, 0, 0, 1, 1, 1,
2.214769, -2.394549, 3.246987, 1, 0, 0, 1, 1,
2.233989, 1.559917, 1.604621, 1, 0, 0, 1, 1,
2.237437, -0.9269885, 0.6294444, 1, 0, 0, 1, 1,
2.242097, -0.4708268, 3.10696, 1, 0, 0, 1, 1,
2.245912, 0.4489881, -0.678264, 1, 0, 0, 1, 1,
2.256053, 0.183919, -0.2856187, 0, 0, 0, 1, 1,
2.272492, 0.7007864, 0.6562337, 0, 0, 0, 1, 1,
2.293638, -1.013351, 3.267958, 0, 0, 0, 1, 1,
2.297751, -0.09490427, -0.513898, 0, 0, 0, 1, 1,
2.437796, 0.4377643, 2.667375, 0, 0, 0, 1, 1,
2.443995, -0.8466417, 2.476209, 0, 0, 0, 1, 1,
2.449421, -0.6162004, 1.776331, 0, 0, 0, 1, 1,
2.45855, -1.11891, 1.20336, 1, 1, 1, 1, 1,
2.513555, 0.5226023, 1.099826, 1, 1, 1, 1, 1,
2.519029, -2.236715, 1.075645, 1, 1, 1, 1, 1,
2.568582, 0.5064039, 1.68314, 1, 1, 1, 1, 1,
2.68314, 1.103168, 1.418629, 1, 1, 1, 1, 1,
3.024128, 1.097421, 0.3996252, 1, 1, 1, 1, 1,
3.175345, 0.7472325, -0.623571, 1, 1, 1, 1, 1
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
var radius = 9.684958;
var distance = 34.01801;
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
mvMatrix.translate( -0.01641178, 0.3646716, -0.04738975 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01801);
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
