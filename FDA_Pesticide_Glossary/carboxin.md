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
-3.191378, -0.05604776, 0.3740655, 1, 0, 0, 1,
-2.972055, -0.9594078, -0.8088859, 1, 0.007843138, 0, 1,
-2.926687, -0.1571148, -2.002234, 1, 0.01176471, 0, 1,
-2.80216, -1.205608, -3.549703, 1, 0.01960784, 0, 1,
-2.65821, -0.4027522, -2.308067, 1, 0.02352941, 0, 1,
-2.648573, -1.04512, -1.787719, 1, 0.03137255, 0, 1,
-2.5361, 0.8023962, -2.544336, 1, 0.03529412, 0, 1,
-2.511805, 0.3801239, -2.475403, 1, 0.04313726, 0, 1,
-2.406399, 0.3484934, -2.127672, 1, 0.04705882, 0, 1,
-2.39989, 1.498468, -0.6005947, 1, 0.05490196, 0, 1,
-2.390867, 0.2618919, -1.177776, 1, 0.05882353, 0, 1,
-2.382111, -0.1007454, -3.699769, 1, 0.06666667, 0, 1,
-2.343819, -0.3398281, -3.376315, 1, 0.07058824, 0, 1,
-2.337645, 0.2656247, -2.266533, 1, 0.07843138, 0, 1,
-2.329556, 0.7664929, -1.891886, 1, 0.08235294, 0, 1,
-2.315552, -0.4018805, -0.4735529, 1, 0.09019608, 0, 1,
-2.295459, 0.6456192, -2.692273, 1, 0.09411765, 0, 1,
-2.213696, 0.5568866, -2.226651, 1, 0.1019608, 0, 1,
-2.144524, -0.1367186, -0.1532786, 1, 0.1098039, 0, 1,
-2.097051, -1.040467, -1.461052, 1, 0.1137255, 0, 1,
-2.086898, -0.03676283, -2.139799, 1, 0.1215686, 0, 1,
-2.074887, 0.689455, -0.5351359, 1, 0.1254902, 0, 1,
-2.058577, 1.071268, -2.072097, 1, 0.1333333, 0, 1,
-2.048552, 3.371266, 0.06714004, 1, 0.1372549, 0, 1,
-2.045965, 0.579119, -0.8852443, 1, 0.145098, 0, 1,
-2.028036, 0.4517165, 0.2993982, 1, 0.1490196, 0, 1,
-2.025821, 1.739204, 1.293603, 1, 0.1568628, 0, 1,
-1.969856, -0.3325185, -2.084412, 1, 0.1607843, 0, 1,
-1.955159, 0.9437179, -0.1251451, 1, 0.1686275, 0, 1,
-1.95454, -0.5057108, -1.942117, 1, 0.172549, 0, 1,
-1.950527, 0.2238988, -0.4934535, 1, 0.1803922, 0, 1,
-1.912684, 0.1375802, -2.06434, 1, 0.1843137, 0, 1,
-1.853945, -0.1383835, -1.801621, 1, 0.1921569, 0, 1,
-1.842535, -0.8425628, -3.798062, 1, 0.1960784, 0, 1,
-1.84024, -0.898135, -1.231201, 1, 0.2039216, 0, 1,
-1.823508, -0.1513593, -2.436031, 1, 0.2117647, 0, 1,
-1.822368, 0.7485168, -1.483125, 1, 0.2156863, 0, 1,
-1.818457, -0.339285, -3.223766, 1, 0.2235294, 0, 1,
-1.810527, -1.416088, -1.572754, 1, 0.227451, 0, 1,
-1.802226, 1.277283, -0.2277021, 1, 0.2352941, 0, 1,
-1.79351, 0.5692171, -0.5451087, 1, 0.2392157, 0, 1,
-1.791038, 0.4526297, -1.796735, 1, 0.2470588, 0, 1,
-1.786754, -0.7701823, 0.00694977, 1, 0.2509804, 0, 1,
-1.763279, 1.131453, 1.794956, 1, 0.2588235, 0, 1,
-1.751006, 0.1435068, -2.346212, 1, 0.2627451, 0, 1,
-1.749454, -0.08400407, -1.979363, 1, 0.2705882, 0, 1,
-1.737415, -0.5137462, -0.9143092, 1, 0.2745098, 0, 1,
-1.726033, -0.6938013, -0.7068684, 1, 0.282353, 0, 1,
-1.716509, -1.435272, -2.888888, 1, 0.2862745, 0, 1,
-1.706635, -0.3320359, -1.629058, 1, 0.2941177, 0, 1,
-1.699898, -2.069534, -1.768479, 1, 0.3019608, 0, 1,
-1.689595, 0.02959608, -1.19995, 1, 0.3058824, 0, 1,
-1.689553, -0.1474422, -0.3972403, 1, 0.3137255, 0, 1,
-1.688392, 1.203397, -0.6198424, 1, 0.3176471, 0, 1,
-1.684867, 1.982404, -1.434967, 1, 0.3254902, 0, 1,
-1.680338, 0.09851301, -1.119683, 1, 0.3294118, 0, 1,
-1.679791, 0.6202962, -0.8856307, 1, 0.3372549, 0, 1,
-1.67275, 1.989823, -0.441149, 1, 0.3411765, 0, 1,
-1.653266, -0.6775038, -2.314455, 1, 0.3490196, 0, 1,
-1.648507, -1.071963, -2.827269, 1, 0.3529412, 0, 1,
-1.630555, -0.2655651, -0.4963689, 1, 0.3607843, 0, 1,
-1.617754, 2.391223, -2.519134, 1, 0.3647059, 0, 1,
-1.614471, 0.8525088, -2.11627, 1, 0.372549, 0, 1,
-1.605653, -0.9335935, -2.317039, 1, 0.3764706, 0, 1,
-1.590458, 0.6429734, 0.4862493, 1, 0.3843137, 0, 1,
-1.576859, 1.933295, -1.975869, 1, 0.3882353, 0, 1,
-1.576727, 0.3252847, -1.706978, 1, 0.3960784, 0, 1,
-1.569017, 0.1874829, -2.678946, 1, 0.4039216, 0, 1,
-1.56097, -0.04845636, -1.521109, 1, 0.4078431, 0, 1,
-1.558021, -0.3891791, -2.081596, 1, 0.4156863, 0, 1,
-1.546363, 1.70109, 0.8068004, 1, 0.4196078, 0, 1,
-1.520931, -0.5494988, -1.0252, 1, 0.427451, 0, 1,
-1.506639, 0.6455107, -2.875103, 1, 0.4313726, 0, 1,
-1.500346, -1.393771, -0.9654788, 1, 0.4392157, 0, 1,
-1.497892, 0.2573009, -2.898809, 1, 0.4431373, 0, 1,
-1.486493, -0.5870095, -3.4879, 1, 0.4509804, 0, 1,
-1.484136, 0.1645143, -1.669849, 1, 0.454902, 0, 1,
-1.475603, 0.5603238, -3.271642, 1, 0.4627451, 0, 1,
-1.461366, -2.06014, -3.787857, 1, 0.4666667, 0, 1,
-1.44941, -1.699685, -3.065196, 1, 0.4745098, 0, 1,
-1.445398, 0.4990057, -0.5562745, 1, 0.4784314, 0, 1,
-1.428727, 0.1039091, 1.0401, 1, 0.4862745, 0, 1,
-1.418986, -0.6094276, -2.747686, 1, 0.4901961, 0, 1,
-1.416676, 0.2489967, -3.276688, 1, 0.4980392, 0, 1,
-1.41252, 0.1398601, -0.8135041, 1, 0.5058824, 0, 1,
-1.412164, 0.4187412, -1.794156, 1, 0.509804, 0, 1,
-1.410813, -0.6469623, -0.6917264, 1, 0.5176471, 0, 1,
-1.402936, 0.4256326, -1.277442, 1, 0.5215687, 0, 1,
-1.399481, -0.5256562, -2.314407, 1, 0.5294118, 0, 1,
-1.397012, 0.6557312, -1.159453, 1, 0.5333334, 0, 1,
-1.394781, 1.612238, -1.633126, 1, 0.5411765, 0, 1,
-1.392234, 1.690308, 0.5116788, 1, 0.5450981, 0, 1,
-1.391221, -1.102781, -2.851301, 1, 0.5529412, 0, 1,
-1.389854, 0.4884357, -0.2642666, 1, 0.5568628, 0, 1,
-1.388733, 1.748576, -0.2547429, 1, 0.5647059, 0, 1,
-1.366163, 1.277437, -2.105787, 1, 0.5686275, 0, 1,
-1.360659, 0.957728, -3.009267, 1, 0.5764706, 0, 1,
-1.357254, -0.8998819, -0.6148431, 1, 0.5803922, 0, 1,
-1.351907, -0.7279257, -1.612599, 1, 0.5882353, 0, 1,
-1.342122, 2.237972, 0.2187251, 1, 0.5921569, 0, 1,
-1.341636, 1.880585, -1.220769, 1, 0.6, 0, 1,
-1.328954, 0.984991, -1.382575, 1, 0.6078432, 0, 1,
-1.323085, -0.1193393, -1.043136, 1, 0.6117647, 0, 1,
-1.29744, -1.285172, -3.659098, 1, 0.6196079, 0, 1,
-1.289502, -1.114252, -1.205066, 1, 0.6235294, 0, 1,
-1.286207, -1.478334, -2.807834, 1, 0.6313726, 0, 1,
-1.283563, 0.09130421, -1.52589, 1, 0.6352941, 0, 1,
-1.273714, -0.4461289, -2.176068, 1, 0.6431373, 0, 1,
-1.260978, -0.2604154, -3.5731, 1, 0.6470588, 0, 1,
-1.253488, -1.119316, -1.908845, 1, 0.654902, 0, 1,
-1.248569, -1.06346, -2.130986, 1, 0.6588235, 0, 1,
-1.246776, 1.987889, -0.2092882, 1, 0.6666667, 0, 1,
-1.245677, -0.09271943, -1.15832, 1, 0.6705883, 0, 1,
-1.242659, -0.06740195, 0.7783868, 1, 0.6784314, 0, 1,
-1.241629, -0.5062671, -1.188004, 1, 0.682353, 0, 1,
-1.239069, 0.6887967, 0.8294641, 1, 0.6901961, 0, 1,
-1.237453, 1.968731, -0.3477705, 1, 0.6941177, 0, 1,
-1.228994, 2.447222, -0.7137415, 1, 0.7019608, 0, 1,
-1.228457, -0.6446294, -1.123961, 1, 0.7098039, 0, 1,
-1.224296, -0.3037509, -2.696641, 1, 0.7137255, 0, 1,
-1.221966, -0.5068012, -0.4643904, 1, 0.7215686, 0, 1,
-1.221698, -0.4109085, -0.1513716, 1, 0.7254902, 0, 1,
-1.219293, 1.035811, -0.4264005, 1, 0.7333333, 0, 1,
-1.215707, -0.6548476, -1.589928, 1, 0.7372549, 0, 1,
-1.210807, -0.9900921, -1.569366, 1, 0.7450981, 0, 1,
-1.208526, 1.345253, -0.9218575, 1, 0.7490196, 0, 1,
-1.207096, -1.094307, -0.4913953, 1, 0.7568628, 0, 1,
-1.202976, 0.7501733, -1.553995, 1, 0.7607843, 0, 1,
-1.191204, 0.9988636, -1.181455, 1, 0.7686275, 0, 1,
-1.190189, -0.07417444, -0.8010074, 1, 0.772549, 0, 1,
-1.189615, 0.7168132, -0.8948882, 1, 0.7803922, 0, 1,
-1.188504, -0.2560176, -1.325627, 1, 0.7843137, 0, 1,
-1.186827, -0.5903616, -2.907072, 1, 0.7921569, 0, 1,
-1.178381, -0.1703559, -3.532531, 1, 0.7960784, 0, 1,
-1.176968, -0.8801227, -2.466725, 1, 0.8039216, 0, 1,
-1.166108, 0.8494028, -1.037634, 1, 0.8117647, 0, 1,
-1.163377, 0.6525608, -1.970987, 1, 0.8156863, 0, 1,
-1.158825, -0.8094986, -1.536224, 1, 0.8235294, 0, 1,
-1.148593, -0.983595, -1.458029, 1, 0.827451, 0, 1,
-1.140518, -0.972868, -1.765591, 1, 0.8352941, 0, 1,
-1.139152, -1.523858, -4.021183, 1, 0.8392157, 0, 1,
-1.136018, -0.1270199, -1.953616, 1, 0.8470588, 0, 1,
-1.115981, -1.089789, -1.484336, 1, 0.8509804, 0, 1,
-1.114993, 0.8353907, -1.290352, 1, 0.8588235, 0, 1,
-1.114604, 0.9536796, -0.5430502, 1, 0.8627451, 0, 1,
-1.113796, 0.3193191, -0.9812933, 1, 0.8705882, 0, 1,
-1.112728, -0.2252506, -3.02709, 1, 0.8745098, 0, 1,
-1.109398, 1.777724, -1.169534, 1, 0.8823529, 0, 1,
-1.107852, 1.288028, -0.8061541, 1, 0.8862745, 0, 1,
-1.10572, -0.3801588, -3.173765, 1, 0.8941177, 0, 1,
-1.097801, 2.180377, 0.04096158, 1, 0.8980392, 0, 1,
-1.094208, 0.0007161781, -2.140033, 1, 0.9058824, 0, 1,
-1.093867, 1.010306, -1.32033, 1, 0.9137255, 0, 1,
-1.091354, 0.1310533, -0.5534083, 1, 0.9176471, 0, 1,
-1.083802, 0.07179764, -3.353076, 1, 0.9254902, 0, 1,
-1.081844, 0.1577723, -2.230099, 1, 0.9294118, 0, 1,
-1.077493, -1.234774, -2.063746, 1, 0.9372549, 0, 1,
-1.074844, 1.628619, -1.576496, 1, 0.9411765, 0, 1,
-1.069486, 1.348523, 0.09859963, 1, 0.9490196, 0, 1,
-1.069226, -0.8355378, -2.440334, 1, 0.9529412, 0, 1,
-1.068889, -0.3872637, -0.4515741, 1, 0.9607843, 0, 1,
-1.065839, 1.518772, -1.532479, 1, 0.9647059, 0, 1,
-1.062605, 1.66867, 0.5214087, 1, 0.972549, 0, 1,
-1.059445, 0.975055, -0.04149979, 1, 0.9764706, 0, 1,
-1.057011, -1.779005, -2.143348, 1, 0.9843137, 0, 1,
-1.053503, 0.7023982, -1.233616, 1, 0.9882353, 0, 1,
-1.047895, -1.513077, -1.447187, 1, 0.9960784, 0, 1,
-1.043875, -1.42302, -3.07903, 0.9960784, 1, 0, 1,
-1.037793, -1.307341, -2.337966, 0.9921569, 1, 0, 1,
-1.037785, 1.510007, -1.802046, 0.9843137, 1, 0, 1,
-1.03423, 1.605939, -1.506284, 0.9803922, 1, 0, 1,
-1.033172, 2.345214, 0.5856351, 0.972549, 1, 0, 1,
-1.032443, 0.5754876, -1.896631, 0.9686275, 1, 0, 1,
-1.032396, 1.168048, -2.478502, 0.9607843, 1, 0, 1,
-1.029028, 1.605739, -1.522182, 0.9568627, 1, 0, 1,
-1.028942, 0.7108213, -0.7401126, 0.9490196, 1, 0, 1,
-1.027385, -1.579752, -2.268208, 0.945098, 1, 0, 1,
-1.013021, 1.495603, -0.08090797, 0.9372549, 1, 0, 1,
-1.011762, 1.072583, 0.182652, 0.9333333, 1, 0, 1,
-1.011691, -1.171109, -3.896819, 0.9254902, 1, 0, 1,
-1.008704, -0.5087175, -2.919251, 0.9215686, 1, 0, 1,
-1.008436, -0.231655, -1.404005, 0.9137255, 1, 0, 1,
-1.006545, 0.4824964, -1.036696, 0.9098039, 1, 0, 1,
-1.005864, 0.3561507, 0.114989, 0.9019608, 1, 0, 1,
-1.002209, -1.301964, -1.844467, 0.8941177, 1, 0, 1,
-0.9973739, 1.411834, 2.090962, 0.8901961, 1, 0, 1,
-0.9915808, 0.7288143, -0.714246, 0.8823529, 1, 0, 1,
-0.9900291, -1.643616, -2.534507, 0.8784314, 1, 0, 1,
-0.9859483, -0.4606763, -3.535134, 0.8705882, 1, 0, 1,
-0.9765663, -0.1603196, -1.438765, 0.8666667, 1, 0, 1,
-0.9759668, -1.05984, -1.186808, 0.8588235, 1, 0, 1,
-0.972277, 0.755529, -0.9738738, 0.854902, 1, 0, 1,
-0.9646735, 0.2742186, -2.237087, 0.8470588, 1, 0, 1,
-0.9605642, 0.7507307, -2.709659, 0.8431373, 1, 0, 1,
-0.9493853, -0.4745568, -1.833786, 0.8352941, 1, 0, 1,
-0.9483247, -0.2877159, -3.01771, 0.8313726, 1, 0, 1,
-0.941617, 0.6725169, -2.039387, 0.8235294, 1, 0, 1,
-0.9378706, -1.209177, -4.696946, 0.8196079, 1, 0, 1,
-0.9338194, 2.900896, -1.558627, 0.8117647, 1, 0, 1,
-0.9312067, -0.8275562, -3.059867, 0.8078431, 1, 0, 1,
-0.9299745, 0.5206396, -2.466699, 0.8, 1, 0, 1,
-0.9269114, 0.6972205, -2.453279, 0.7921569, 1, 0, 1,
-0.9186965, -0.5170388, -2.775458, 0.7882353, 1, 0, 1,
-0.9168919, -0.9703979, -1.581532, 0.7803922, 1, 0, 1,
-0.9122706, 1.251352, -1.633714, 0.7764706, 1, 0, 1,
-0.9086511, 1.022368, -2.137022, 0.7686275, 1, 0, 1,
-0.9043001, -0.502928, -0.5348882, 0.7647059, 1, 0, 1,
-0.8980551, 0.2871647, -0.7126544, 0.7568628, 1, 0, 1,
-0.8892963, 1.331217, -2.766045, 0.7529412, 1, 0, 1,
-0.8860758, 0.016489, -2.635455, 0.7450981, 1, 0, 1,
-0.8762025, 0.1571019, -1.322481, 0.7411765, 1, 0, 1,
-0.8760363, 1.237515, -2.524951, 0.7333333, 1, 0, 1,
-0.8750743, 1.206659, 0.01682495, 0.7294118, 1, 0, 1,
-0.8736812, -0.06218213, -2.641566, 0.7215686, 1, 0, 1,
-0.8710782, 0.1878671, -2.725795, 0.7176471, 1, 0, 1,
-0.8625472, 0.7172292, -1.726568, 0.7098039, 1, 0, 1,
-0.8622464, -0.08167597, 0.1726608, 0.7058824, 1, 0, 1,
-0.8540013, -0.1225811, -0.6305172, 0.6980392, 1, 0, 1,
-0.8531027, 0.8142781, 0.3765461, 0.6901961, 1, 0, 1,
-0.8485873, -0.9888883, -2.745769, 0.6862745, 1, 0, 1,
-0.8460146, -0.6647573, -2.745163, 0.6784314, 1, 0, 1,
-0.8448535, 1.167045, 0.5960585, 0.6745098, 1, 0, 1,
-0.8415076, 1.920931, 1.239892, 0.6666667, 1, 0, 1,
-0.8386351, 2.368319, -1.206736, 0.6627451, 1, 0, 1,
-0.8342326, -0.4994898, -3.629872, 0.654902, 1, 0, 1,
-0.8297397, 0.1438655, -1.689884, 0.6509804, 1, 0, 1,
-0.8263986, 1.592446, -1.918584, 0.6431373, 1, 0, 1,
-0.8251109, -0.4323089, -2.4771, 0.6392157, 1, 0, 1,
-0.8210062, -0.4407642, -2.727677, 0.6313726, 1, 0, 1,
-0.8132588, 0.530987, -0.644944, 0.627451, 1, 0, 1,
-0.8117936, 1.229599, -0.9128504, 0.6196079, 1, 0, 1,
-0.7991548, 0.1756929, 0.5458927, 0.6156863, 1, 0, 1,
-0.7853204, -0.9350594, -1.931644, 0.6078432, 1, 0, 1,
-0.7784588, -0.1567443, -2.681319, 0.6039216, 1, 0, 1,
-0.7691731, -0.2080844, -4.089314, 0.5960785, 1, 0, 1,
-0.7671152, -0.3694898, -1.563552, 0.5882353, 1, 0, 1,
-0.7588938, 1.133621, -0.2623419, 0.5843138, 1, 0, 1,
-0.7578717, 0.4088274, -0.7804205, 0.5764706, 1, 0, 1,
-0.7398804, 0.07766391, -3.496525, 0.572549, 1, 0, 1,
-0.736592, 1.011268, 0.0787287, 0.5647059, 1, 0, 1,
-0.732587, 2.100052, 0.8003393, 0.5607843, 1, 0, 1,
-0.731194, -0.1402941, -2.626419, 0.5529412, 1, 0, 1,
-0.7289078, -1.373809, -1.820972, 0.5490196, 1, 0, 1,
-0.7258806, -2.192814, -3.68339, 0.5411765, 1, 0, 1,
-0.7219837, -1.629864, -4.034853, 0.5372549, 1, 0, 1,
-0.7207406, 0.8174456, -0.6955417, 0.5294118, 1, 0, 1,
-0.7202067, 0.2076086, -2.654391, 0.5254902, 1, 0, 1,
-0.7202058, -0.1295925, -1.964357, 0.5176471, 1, 0, 1,
-0.7196739, 0.2185988, -2.047059, 0.5137255, 1, 0, 1,
-0.7144532, 2.841466, -0.08054585, 0.5058824, 1, 0, 1,
-0.7142233, -0.3791651, -1.627005, 0.5019608, 1, 0, 1,
-0.7101949, -2.200002, -1.376445, 0.4941176, 1, 0, 1,
-0.7094458, 0.2988383, -0.3934605, 0.4862745, 1, 0, 1,
-0.7070089, -2.288295, -3.406954, 0.4823529, 1, 0, 1,
-0.7056168, -0.9214759, -0.9109194, 0.4745098, 1, 0, 1,
-0.700804, -0.3691379, -3.331894, 0.4705882, 1, 0, 1,
-0.6986609, -0.903955, -3.870894, 0.4627451, 1, 0, 1,
-0.6970853, -0.7518192, -1.956853, 0.4588235, 1, 0, 1,
-0.6955312, 0.6833838, 1.424562, 0.4509804, 1, 0, 1,
-0.6940101, -0.7616777, -2.72775, 0.4470588, 1, 0, 1,
-0.6910384, -0.720042, -2.722518, 0.4392157, 1, 0, 1,
-0.6881958, -0.2909323, -3.910258, 0.4352941, 1, 0, 1,
-0.6857185, -2.607447, -4.334766, 0.427451, 1, 0, 1,
-0.6852381, 0.2721938, -2.31386, 0.4235294, 1, 0, 1,
-0.6814082, 0.1506428, 1.362919, 0.4156863, 1, 0, 1,
-0.6667685, 0.4832906, 1.496176, 0.4117647, 1, 0, 1,
-0.6664124, 1.489842, -1.346881, 0.4039216, 1, 0, 1,
-0.6628887, 1.074212, -0.4743166, 0.3960784, 1, 0, 1,
-0.6589218, -0.1200411, -1.851235, 0.3921569, 1, 0, 1,
-0.6559672, -0.5350901, -3.738218, 0.3843137, 1, 0, 1,
-0.6524791, 1.024421, -2.678493, 0.3803922, 1, 0, 1,
-0.6513418, 0.3694031, -0.4751683, 0.372549, 1, 0, 1,
-0.6512856, -0.5893458, -0.1593841, 0.3686275, 1, 0, 1,
-0.6501771, -0.704877, -1.72659, 0.3607843, 1, 0, 1,
-0.649445, -0.3085617, -0.6044131, 0.3568628, 1, 0, 1,
-0.6488997, 0.2534069, -0.02460053, 0.3490196, 1, 0, 1,
-0.645936, 2.491838, -0.01437315, 0.345098, 1, 0, 1,
-0.6428148, 0.5310716, -0.3644564, 0.3372549, 1, 0, 1,
-0.6405903, 0.05361307, 0.03714086, 0.3333333, 1, 0, 1,
-0.6355025, -1.911147, -3.331074, 0.3254902, 1, 0, 1,
-0.6350525, 0.6398221, -1.189983, 0.3215686, 1, 0, 1,
-0.6337395, 0.4583296, -0.4943503, 0.3137255, 1, 0, 1,
-0.6332505, 0.6220275, -1.975348, 0.3098039, 1, 0, 1,
-0.6327818, -0.4168171, -3.040262, 0.3019608, 1, 0, 1,
-0.6233721, -1.450367, -2.566475, 0.2941177, 1, 0, 1,
-0.6193913, 0.1320815, -1.054281, 0.2901961, 1, 0, 1,
-0.618724, -0.1135527, -0.8832842, 0.282353, 1, 0, 1,
-0.6130222, -0.02462596, -2.499474, 0.2784314, 1, 0, 1,
-0.6127604, 1.554133, 0.5272628, 0.2705882, 1, 0, 1,
-0.6125117, -1.149919, -0.5725469, 0.2666667, 1, 0, 1,
-0.6105986, -0.0776661, -1.720374, 0.2588235, 1, 0, 1,
-0.6098948, -1.67305, -4.793012, 0.254902, 1, 0, 1,
-0.608099, 0.1688177, -3.00152, 0.2470588, 1, 0, 1,
-0.6024977, -0.2452209, -2.145634, 0.2431373, 1, 0, 1,
-0.6022175, -0.2001005, -2.589386, 0.2352941, 1, 0, 1,
-0.5982218, -1.755555, -3.972452, 0.2313726, 1, 0, 1,
-0.5970711, 1.914524, -0.1991731, 0.2235294, 1, 0, 1,
-0.5946776, 1.067303, -0.4806437, 0.2196078, 1, 0, 1,
-0.5943859, -0.2183514, -2.230248, 0.2117647, 1, 0, 1,
-0.5924715, 1.426947, 0.407149, 0.2078431, 1, 0, 1,
-0.5895656, -0.4055656, 0.9460652, 0.2, 1, 0, 1,
-0.5758945, 0.7769822, -0.7646208, 0.1921569, 1, 0, 1,
-0.5749994, -0.04577389, -1.104782, 0.1882353, 1, 0, 1,
-0.5720255, -1.819682, -3.104201, 0.1803922, 1, 0, 1,
-0.5700611, -1.418856, -1.341658, 0.1764706, 1, 0, 1,
-0.5618545, 0.4982371, -1.073129, 0.1686275, 1, 0, 1,
-0.5606162, -1.293866, -1.633356, 0.1647059, 1, 0, 1,
-0.555522, -0.3916753, -0.9231371, 0.1568628, 1, 0, 1,
-0.5542445, -1.363251, -2.448372, 0.1529412, 1, 0, 1,
-0.5437048, 0.1510115, -1.950781, 0.145098, 1, 0, 1,
-0.5432143, 0.4305766, -0.918756, 0.1411765, 1, 0, 1,
-0.5404312, -1.695978, -0.6470255, 0.1333333, 1, 0, 1,
-0.5370427, -1.307393, -3.310641, 0.1294118, 1, 0, 1,
-0.5368217, -1.060575, -1.792933, 0.1215686, 1, 0, 1,
-0.5346048, -0.7611526, -2.147767, 0.1176471, 1, 0, 1,
-0.5286982, 0.3406478, -2.047475, 0.1098039, 1, 0, 1,
-0.5273031, -0.7076777, -3.242166, 0.1058824, 1, 0, 1,
-0.5234025, 1.645253, -1.087196, 0.09803922, 1, 0, 1,
-0.5212857, -0.008687861, -1.099664, 0.09019608, 1, 0, 1,
-0.5179806, -0.5390223, -2.937947, 0.08627451, 1, 0, 1,
-0.517451, -0.2719261, -1.263537, 0.07843138, 1, 0, 1,
-0.5159013, -0.5132403, -2.380365, 0.07450981, 1, 0, 1,
-0.5134088, -0.7194585, -3.304829, 0.06666667, 1, 0, 1,
-0.5074704, -0.3737085, -1.085765, 0.0627451, 1, 0, 1,
-0.5051641, 0.4541023, -1.377277, 0.05490196, 1, 0, 1,
-0.5049328, -0.3988379, -2.036136, 0.05098039, 1, 0, 1,
-0.5001693, 0.9793432, 0.5633359, 0.04313726, 1, 0, 1,
-0.4945905, 1.393471, -0.3370713, 0.03921569, 1, 0, 1,
-0.4941723, -0.4577418, -3.166817, 0.03137255, 1, 0, 1,
-0.4912853, 0.03377298, -2.130356, 0.02745098, 1, 0, 1,
-0.4899157, -0.4957812, -1.881939, 0.01960784, 1, 0, 1,
-0.484679, -0.1513217, -2.070973, 0.01568628, 1, 0, 1,
-0.483642, -1.291775, -5.373691, 0.007843138, 1, 0, 1,
-0.4825696, 0.1355336, 1.093656, 0.003921569, 1, 0, 1,
-0.4783508, -2.292639, -2.010864, 0, 1, 0.003921569, 1,
-0.4756239, 0.5822176, -0.3570979, 0, 1, 0.01176471, 1,
-0.4754901, 0.4043594, -2.255393, 0, 1, 0.01568628, 1,
-0.4713349, -0.3818527, -2.026874, 0, 1, 0.02352941, 1,
-0.4677365, 1.443589, -1.011023, 0, 1, 0.02745098, 1,
-0.4659455, -0.0842986, -3.096806, 0, 1, 0.03529412, 1,
-0.4595672, 0.7385461, -1.359693, 0, 1, 0.03921569, 1,
-0.4586273, 0.82508, 0.5408992, 0, 1, 0.04705882, 1,
-0.4537905, -1.740224, -2.145787, 0, 1, 0.05098039, 1,
-0.4495231, 0.7635152, -0.9103902, 0, 1, 0.05882353, 1,
-0.4483189, -1.582651, -1.797514, 0, 1, 0.0627451, 1,
-0.4473816, 0.7257785, -0.5381492, 0, 1, 0.07058824, 1,
-0.4450269, 0.6427129, -0.8835188, 0, 1, 0.07450981, 1,
-0.4446932, 0.6618133, -1.557889, 0, 1, 0.08235294, 1,
-0.4444372, 0.6516044, 1.22505, 0, 1, 0.08627451, 1,
-0.4423195, -0.484635, -2.157842, 0, 1, 0.09411765, 1,
-0.4415668, 0.3716225, -0.4075248, 0, 1, 0.1019608, 1,
-0.4411729, -1.183075, -2.875515, 0, 1, 0.1058824, 1,
-0.4411064, -0.0675155, -3.666606, 0, 1, 0.1137255, 1,
-0.4391531, -0.6548812, -1.202798, 0, 1, 0.1176471, 1,
-0.4389024, -0.3689039, -3.365467, 0, 1, 0.1254902, 1,
-0.4388167, -0.03644554, -1.236428, 0, 1, 0.1294118, 1,
-0.4382792, -0.4593826, -2.016778, 0, 1, 0.1372549, 1,
-0.4326935, -0.4888137, -3.084092, 0, 1, 0.1411765, 1,
-0.4243702, -1.017255, -2.949021, 0, 1, 0.1490196, 1,
-0.4211346, -0.9583747, -1.375947, 0, 1, 0.1529412, 1,
-0.4129325, -0.6176484, -1.638617, 0, 1, 0.1607843, 1,
-0.4104743, 0.8302823, -0.883921, 0, 1, 0.1647059, 1,
-0.4055246, 0.8081325, -0.2537562, 0, 1, 0.172549, 1,
-0.4040981, -0.159131, -0.888119, 0, 1, 0.1764706, 1,
-0.4040221, -0.006808237, -2.369325, 0, 1, 0.1843137, 1,
-0.4038389, -1.291144, -2.478309, 0, 1, 0.1882353, 1,
-0.4006881, -0.6997303, -3.021434, 0, 1, 0.1960784, 1,
-0.3979137, -1.19058, -1.990143, 0, 1, 0.2039216, 1,
-0.3920779, -0.2151183, -1.839425, 0, 1, 0.2078431, 1,
-0.3900578, -0.6674943, -2.539259, 0, 1, 0.2156863, 1,
-0.390036, -1.062788, -2.181507, 0, 1, 0.2196078, 1,
-0.3877091, -1.864712, -1.484719, 0, 1, 0.227451, 1,
-0.3873481, 0.1138486, -1.081266, 0, 1, 0.2313726, 1,
-0.3873325, -0.02805143, -2.65141, 0, 1, 0.2392157, 1,
-0.3869546, -0.9828219, -2.714731, 0, 1, 0.2431373, 1,
-0.3863079, -0.2758656, -4.003588, 0, 1, 0.2509804, 1,
-0.3837051, -0.2856162, -2.681286, 0, 1, 0.254902, 1,
-0.3833199, -0.08115196, -2.234108, 0, 1, 0.2627451, 1,
-0.376139, -0.03489024, -2.727067, 0, 1, 0.2666667, 1,
-0.3755055, -2.185349, -4.853174, 0, 1, 0.2745098, 1,
-0.3672958, 0.1723695, -1.405499, 0, 1, 0.2784314, 1,
-0.3662789, -1.942393, -2.574999, 0, 1, 0.2862745, 1,
-0.362139, 0.9835839, -1.359301, 0, 1, 0.2901961, 1,
-0.3574024, 1.76424, -0.7936949, 0, 1, 0.2980392, 1,
-0.3567272, -0.7390818, -3.335211, 0, 1, 0.3058824, 1,
-0.352997, -1.267815, -0.6765632, 0, 1, 0.3098039, 1,
-0.3507579, -0.8289831, -3.249384, 0, 1, 0.3176471, 1,
-0.3506916, 0.8451918, 0.1206596, 0, 1, 0.3215686, 1,
-0.3469844, 0.5832921, -0.9086533, 0, 1, 0.3294118, 1,
-0.3466197, 0.9335247, -0.05640284, 0, 1, 0.3333333, 1,
-0.3457024, 1.33894, 1.176676, 0, 1, 0.3411765, 1,
-0.3427654, -0.6905459, -3.569, 0, 1, 0.345098, 1,
-0.3401167, -1.959966, -3.140753, 0, 1, 0.3529412, 1,
-0.3396959, -0.02825113, -2.218802, 0, 1, 0.3568628, 1,
-0.3383601, 0.1294394, -2.465163, 0, 1, 0.3647059, 1,
-0.3316256, -1.343108, -2.694203, 0, 1, 0.3686275, 1,
-0.3260892, -1.558624, -2.092569, 0, 1, 0.3764706, 1,
-0.3176875, 0.04161732, -3.747687, 0, 1, 0.3803922, 1,
-0.3154338, 0.06761674, -1.264923, 0, 1, 0.3882353, 1,
-0.311671, -1.232536, -3.88464, 0, 1, 0.3921569, 1,
-0.3061431, 0.02929738, -1.349873, 0, 1, 0.4, 1,
-0.3004712, -0.5765179, -3.364034, 0, 1, 0.4078431, 1,
-0.2985495, -1.707728, -1.872853, 0, 1, 0.4117647, 1,
-0.2935173, -1.323102, -3.44118, 0, 1, 0.4196078, 1,
-0.2908408, -0.02076405, -2.466561, 0, 1, 0.4235294, 1,
-0.2903231, -0.9685435, -1.021508, 0, 1, 0.4313726, 1,
-0.2884641, -1.227264, -3.364558, 0, 1, 0.4352941, 1,
-0.2883877, -0.6613395, -3.075526, 0, 1, 0.4431373, 1,
-0.2878373, 0.3261985, -1.028838, 0, 1, 0.4470588, 1,
-0.2875087, -1.315623, -3.576792, 0, 1, 0.454902, 1,
-0.286251, 0.7074289, 0.4695024, 0, 1, 0.4588235, 1,
-0.2839032, -0.1022396, -1.640284, 0, 1, 0.4666667, 1,
-0.2828165, -0.7999419, -2.604072, 0, 1, 0.4705882, 1,
-0.2757663, 1.039233, -0.6147801, 0, 1, 0.4784314, 1,
-0.2739215, 1.12032, -0.9795298, 0, 1, 0.4823529, 1,
-0.2737827, 0.08796065, -1.419586, 0, 1, 0.4901961, 1,
-0.2733822, 0.3366819, -1.648243, 0, 1, 0.4941176, 1,
-0.2714731, -1.117544, -2.326105, 0, 1, 0.5019608, 1,
-0.2684497, -1.017277, -2.68458, 0, 1, 0.509804, 1,
-0.2677661, 0.6999758, 1.341427, 0, 1, 0.5137255, 1,
-0.2629464, 0.7320733, -3.061274, 0, 1, 0.5215687, 1,
-0.2591777, -0.8546107, -0.8518893, 0, 1, 0.5254902, 1,
-0.2560125, -1.26341, -1.392326, 0, 1, 0.5333334, 1,
-0.2549486, -1.403521, -1.708443, 0, 1, 0.5372549, 1,
-0.2547559, -1.060327, -2.273464, 0, 1, 0.5450981, 1,
-0.2545244, 1.358217, 0.298546, 0, 1, 0.5490196, 1,
-0.2507686, -1.192452, -0.9103892, 0, 1, 0.5568628, 1,
-0.2501693, -0.4057359, -1.623125, 0, 1, 0.5607843, 1,
-0.248361, 1.899979, -1.487412, 0, 1, 0.5686275, 1,
-0.2470703, 1.419028, 0.7403093, 0, 1, 0.572549, 1,
-0.2447972, -1.183696, -2.888385, 0, 1, 0.5803922, 1,
-0.2431911, -0.3216131, -4.201521, 0, 1, 0.5843138, 1,
-0.2391146, -0.567872, -2.598852, 0, 1, 0.5921569, 1,
-0.2387275, -0.2658749, -4.043813, 0, 1, 0.5960785, 1,
-0.2369441, 0.2263744, -0.597249, 0, 1, 0.6039216, 1,
-0.2358487, -0.8967725, -2.933481, 0, 1, 0.6117647, 1,
-0.231133, -1.20812, -2.82207, 0, 1, 0.6156863, 1,
-0.2301484, 1.92804, -0.2778432, 0, 1, 0.6235294, 1,
-0.2253092, 0.1882161, -0.3349334, 0, 1, 0.627451, 1,
-0.2188204, 2.323934, -0.4909927, 0, 1, 0.6352941, 1,
-0.2086781, -1.026533, -2.814132, 0, 1, 0.6392157, 1,
-0.2077512, -0.5363451, -2.071013, 0, 1, 0.6470588, 1,
-0.2066022, -0.4682086, -1.424538, 0, 1, 0.6509804, 1,
-0.206319, 1.076672, -1.12844, 0, 1, 0.6588235, 1,
-0.2044072, -0.1401959, -3.369819, 0, 1, 0.6627451, 1,
-0.2009877, 1.224673, -0.3491612, 0, 1, 0.6705883, 1,
-0.199293, -0.2345424, -0.8949749, 0, 1, 0.6745098, 1,
-0.1944648, 0.4965595, -0.9639466, 0, 1, 0.682353, 1,
-0.1931721, -1.688694, -3.061382, 0, 1, 0.6862745, 1,
-0.1904338, 1.206372, -0.7999074, 0, 1, 0.6941177, 1,
-0.1882479, 1.804765, -1.178652, 0, 1, 0.7019608, 1,
-0.1822242, -1.1337, -3.293304, 0, 1, 0.7058824, 1,
-0.1805828, 1.121932, 0.406809, 0, 1, 0.7137255, 1,
-0.1784134, 0.1423802, -0.5261153, 0, 1, 0.7176471, 1,
-0.1777488, 0.6955452, -0.929905, 0, 1, 0.7254902, 1,
-0.1753213, 1.273875, -0.6671573, 0, 1, 0.7294118, 1,
-0.1743782, -0.1718426, -2.808581, 0, 1, 0.7372549, 1,
-0.1685959, -1.249463, -3.700691, 0, 1, 0.7411765, 1,
-0.168591, 0.5068246, 0.638736, 0, 1, 0.7490196, 1,
-0.1671635, -1.146485, -2.769887, 0, 1, 0.7529412, 1,
-0.1601643, -0.6193896, -2.766382, 0, 1, 0.7607843, 1,
-0.1598106, -1.387311, -3.466518, 0, 1, 0.7647059, 1,
-0.1562254, 0.270069, 0.6497303, 0, 1, 0.772549, 1,
-0.1555697, 0.9240702, -0.02239832, 0, 1, 0.7764706, 1,
-0.1555545, -1.266312, -3.911461, 0, 1, 0.7843137, 1,
-0.1553993, -1.260868, -2.934286, 0, 1, 0.7882353, 1,
-0.1551955, 0.5467392, 0.09425966, 0, 1, 0.7960784, 1,
-0.1527367, -0.3594238, -2.137812, 0, 1, 0.8039216, 1,
-0.1508676, -1.935031, -2.963314, 0, 1, 0.8078431, 1,
-0.1508034, 0.7912861, -0.3646076, 0, 1, 0.8156863, 1,
-0.1444396, -1.156042, -4.12812, 0, 1, 0.8196079, 1,
-0.1426357, -0.4296385, -4.204103, 0, 1, 0.827451, 1,
-0.1406984, -0.4970162, -2.582457, 0, 1, 0.8313726, 1,
-0.1403125, -0.9239391, -4.201562, 0, 1, 0.8392157, 1,
-0.1399838, 0.2309659, -1.444525, 0, 1, 0.8431373, 1,
-0.1392436, -0.1253666, -2.578073, 0, 1, 0.8509804, 1,
-0.1354623, 1.738732, 0.8351394, 0, 1, 0.854902, 1,
-0.1336388, -0.4027708, -1.841344, 0, 1, 0.8627451, 1,
-0.130621, -1.134795, -3.266595, 0, 1, 0.8666667, 1,
-0.1233929, 0.1275675, -1.790203, 0, 1, 0.8745098, 1,
-0.118177, 0.1824906, -1.176666, 0, 1, 0.8784314, 1,
-0.1169632, -0.3841053, -2.79401, 0, 1, 0.8862745, 1,
-0.1168002, -1.187195, -3.034806, 0, 1, 0.8901961, 1,
-0.1161414, 0.9886277, 0.09435297, 0, 1, 0.8980392, 1,
-0.1131918, -0.7134783, -2.609025, 0, 1, 0.9058824, 1,
-0.10893, -1.295911, -5.000494, 0, 1, 0.9098039, 1,
-0.10862, 1.351316, -1.25597, 0, 1, 0.9176471, 1,
-0.1067638, 1.022689, -0.3066478, 0, 1, 0.9215686, 1,
-0.1022483, -1.270337, -3.371753, 0, 1, 0.9294118, 1,
-0.1016665, 0.5056938, -0.1455042, 0, 1, 0.9333333, 1,
-0.09372801, -0.9333988, -1.10452, 0, 1, 0.9411765, 1,
-0.09103442, -1.460066, -3.402699, 0, 1, 0.945098, 1,
-0.08960043, 0.1555388, -0.620622, 0, 1, 0.9529412, 1,
-0.08936004, 0.7662041, 0.7473878, 0, 1, 0.9568627, 1,
-0.08898035, -1.697467, -3.956734, 0, 1, 0.9647059, 1,
-0.0860163, 0.9087977, 0.7201138, 0, 1, 0.9686275, 1,
-0.08407456, 0.201788, -1.862714, 0, 1, 0.9764706, 1,
-0.07856124, -0.6157609, -1.575301, 0, 1, 0.9803922, 1,
-0.07388717, -0.308375, -3.974179, 0, 1, 0.9882353, 1,
-0.06385886, 0.2918595, -0.1535022, 0, 1, 0.9921569, 1,
-0.06185514, 0.8346441, -0.1574524, 0, 1, 1, 1,
-0.06044038, 0.2351085, -0.9688611, 0, 0.9921569, 1, 1,
-0.05865071, -0.2955537, -3.700918, 0, 0.9882353, 1, 1,
-0.04926967, 0.0565504, 0.04966477, 0, 0.9803922, 1, 1,
-0.04390465, 0.1154845, -0.6969469, 0, 0.9764706, 1, 1,
-0.0408817, 0.7860927, 0.3463663, 0, 0.9686275, 1, 1,
-0.04082911, -0.4037602, -1.37266, 0, 0.9647059, 1, 1,
-0.03894323, -0.09883524, -2.323582, 0, 0.9568627, 1, 1,
-0.034939, -0.1591749, -3.362088, 0, 0.9529412, 1, 1,
-0.03491256, 0.8700396, -0.5396446, 0, 0.945098, 1, 1,
-0.03323485, -0.1213129, -2.687411, 0, 0.9411765, 1, 1,
-0.02762562, -0.3679644, -4.247044, 0, 0.9333333, 1, 1,
-0.02438878, 1.061228, -0.01352739, 0, 0.9294118, 1, 1,
-0.02381135, -1.200091, -3.929377, 0, 0.9215686, 1, 1,
-0.014114, 0.7060075, 1.037102, 0, 0.9176471, 1, 1,
-0.005275948, -0.03996842, -2.034671, 0, 0.9098039, 1, 1,
-0.001582872, 0.5436003, 1.386301, 0, 0.9058824, 1, 1,
0.002030078, 0.4227515, -0.7245263, 0, 0.8980392, 1, 1,
0.002297358, 0.4522405, 0.6322052, 0, 0.8901961, 1, 1,
0.003910097, -0.1550329, 3.50653, 0, 0.8862745, 1, 1,
0.005789924, -1.366366, 3.818679, 0, 0.8784314, 1, 1,
0.008895595, 1.267269, -0.8137999, 0, 0.8745098, 1, 1,
0.008911294, 0.8901857, 1.869215, 0, 0.8666667, 1, 1,
0.0108573, -0.3647175, 4.05713, 0, 0.8627451, 1, 1,
0.01120412, 0.2064298, 1.518996, 0, 0.854902, 1, 1,
0.01460979, -1.280867, 4.638102, 0, 0.8509804, 1, 1,
0.01775023, -0.1519409, 3.140064, 0, 0.8431373, 1, 1,
0.01788895, 0.1378983, -1.255761, 0, 0.8392157, 1, 1,
0.02306423, -0.2035481, 6.242257, 0, 0.8313726, 1, 1,
0.02897037, -1.580853, 3.650153, 0, 0.827451, 1, 1,
0.03475363, 0.1932752, 0.5415504, 0, 0.8196079, 1, 1,
0.03653898, -0.1804644, 1.009208, 0, 0.8156863, 1, 1,
0.03841364, 0.6104422, -1.889281, 0, 0.8078431, 1, 1,
0.03965915, -0.09335098, 3.241316, 0, 0.8039216, 1, 1,
0.04293778, 1.155648, -1.145383, 0, 0.7960784, 1, 1,
0.05377854, 0.1533887, -0.7029579, 0, 0.7882353, 1, 1,
0.05501191, -0.8702653, 2.54018, 0, 0.7843137, 1, 1,
0.0554451, -2.238609, 2.278503, 0, 0.7764706, 1, 1,
0.05756482, -1.212842, 3.18364, 0, 0.772549, 1, 1,
0.06315818, 0.4963772, 0.3645315, 0, 0.7647059, 1, 1,
0.06504689, 0.8175819, 0.3877293, 0, 0.7607843, 1, 1,
0.06511636, 0.9420622, 1.875368, 0, 0.7529412, 1, 1,
0.06532752, -0.2456463, 3.345405, 0, 0.7490196, 1, 1,
0.06562559, -0.1571525, 3.699471, 0, 0.7411765, 1, 1,
0.06852627, 0.2499445, -0.9803646, 0, 0.7372549, 1, 1,
0.06998866, -1.755918, 4.342051, 0, 0.7294118, 1, 1,
0.07418615, 1.34926, -0.4067158, 0, 0.7254902, 1, 1,
0.07627212, -0.4799113, 3.327332, 0, 0.7176471, 1, 1,
0.08401554, -1.70809, 4.138252, 0, 0.7137255, 1, 1,
0.08531024, -1.642861, 3.353654, 0, 0.7058824, 1, 1,
0.08991565, 0.5589036, 0.5986665, 0, 0.6980392, 1, 1,
0.09085766, 0.006414331, 1.644985, 0, 0.6941177, 1, 1,
0.09366914, 0.5734429, -0.3617198, 0, 0.6862745, 1, 1,
0.09373118, 1.086622, -0.7758744, 0, 0.682353, 1, 1,
0.09673974, -0.02701727, 1.783543, 0, 0.6745098, 1, 1,
0.1007897, 0.04356267, 0.1363829, 0, 0.6705883, 1, 1,
0.1009735, -0.04825645, 3.186151, 0, 0.6627451, 1, 1,
0.1063219, 1.930873, 1.550775, 0, 0.6588235, 1, 1,
0.1112134, 1.137252, 1.663022, 0, 0.6509804, 1, 1,
0.1129164, 0.3411123, 1.422393, 0, 0.6470588, 1, 1,
0.1133882, 0.7594718, 0.1137887, 0, 0.6392157, 1, 1,
0.1138994, 1.772616, -1.090756, 0, 0.6352941, 1, 1,
0.1153547, 0.1577437, 2.461209, 0, 0.627451, 1, 1,
0.1175218, -0.3737516, 2.335515, 0, 0.6235294, 1, 1,
0.1186816, 0.6802539, 0.7529272, 0, 0.6156863, 1, 1,
0.1298048, -0.7332867, 1.877927, 0, 0.6117647, 1, 1,
0.1339374, -1.752157, 3.299984, 0, 0.6039216, 1, 1,
0.1347022, -0.3029709, 2.065855, 0, 0.5960785, 1, 1,
0.1379795, 0.3774936, -0.763804, 0, 0.5921569, 1, 1,
0.1400869, 1.927958, -0.3251057, 0, 0.5843138, 1, 1,
0.1408496, 1.754333, 0.5826323, 0, 0.5803922, 1, 1,
0.14302, -1.383437, 3.178064, 0, 0.572549, 1, 1,
0.1463727, -0.03038908, 1.470035, 0, 0.5686275, 1, 1,
0.1539874, -0.5707037, 3.531582, 0, 0.5607843, 1, 1,
0.1570029, 0.4658418, -0.4146936, 0, 0.5568628, 1, 1,
0.1582509, 0.6178226, -1.229398, 0, 0.5490196, 1, 1,
0.1589853, 0.879214, -0.4539082, 0, 0.5450981, 1, 1,
0.1599807, -1.579872, 0.1421015, 0, 0.5372549, 1, 1,
0.1612531, 0.3227133, 0.1385335, 0, 0.5333334, 1, 1,
0.1629103, -0.485035, 2.080787, 0, 0.5254902, 1, 1,
0.1644632, -1.729277, 2.39672, 0, 0.5215687, 1, 1,
0.1650502, 0.1062373, 0.905163, 0, 0.5137255, 1, 1,
0.1652296, 0.3976561, 1.644771, 0, 0.509804, 1, 1,
0.1670837, 0.05034227, -0.4368349, 0, 0.5019608, 1, 1,
0.168597, -1.063759, 2.350437, 0, 0.4941176, 1, 1,
0.1700843, -0.7655174, 4.272112, 0, 0.4901961, 1, 1,
0.1754172, 1.682972, 0.3376217, 0, 0.4823529, 1, 1,
0.1755471, 0.003614889, 2.009247, 0, 0.4784314, 1, 1,
0.1766326, -0.1509648, 2.355497, 0, 0.4705882, 1, 1,
0.1771732, -1.606252, 3.69126, 0, 0.4666667, 1, 1,
0.1781137, 0.9075594, 0.9189159, 0, 0.4588235, 1, 1,
0.181639, 0.1355928, 0.9736058, 0, 0.454902, 1, 1,
0.1850609, 0.6591299, -1.758633, 0, 0.4470588, 1, 1,
0.1850649, 0.2830433, 1.229321, 0, 0.4431373, 1, 1,
0.1886182, -0.1304939, 1.803946, 0, 0.4352941, 1, 1,
0.1887266, 0.4570964, -0.2428276, 0, 0.4313726, 1, 1,
0.1907437, -1.031263, 2.425376, 0, 0.4235294, 1, 1,
0.1924071, 0.1175758, 0.09448025, 0, 0.4196078, 1, 1,
0.1971173, 0.569094, 1.757738, 0, 0.4117647, 1, 1,
0.1981665, -0.3955309, 3.189715, 0, 0.4078431, 1, 1,
0.2026532, -0.6900265, 1.943163, 0, 0.4, 1, 1,
0.2031447, -1.005653, 2.025379, 0, 0.3921569, 1, 1,
0.2045224, -1.589998, 3.745944, 0, 0.3882353, 1, 1,
0.2048461, -2.269313, 2.24345, 0, 0.3803922, 1, 1,
0.2053012, 0.1956737, 0.06164869, 0, 0.3764706, 1, 1,
0.2088444, 0.1728752, 2.06671, 0, 0.3686275, 1, 1,
0.2098785, 0.7971901, -1.289956, 0, 0.3647059, 1, 1,
0.2118877, 1.017848, 0.6605544, 0, 0.3568628, 1, 1,
0.2135808, 0.02927931, 1.750132, 0, 0.3529412, 1, 1,
0.2153374, -2.283116, 3.30644, 0, 0.345098, 1, 1,
0.2163877, 1.56785, -1.070076, 0, 0.3411765, 1, 1,
0.2169631, -1.621972, 3.240823, 0, 0.3333333, 1, 1,
0.221325, 0.8922824, 1.052392, 0, 0.3294118, 1, 1,
0.2257024, -0.4308951, 3.072967, 0, 0.3215686, 1, 1,
0.2264255, -0.7903613, 3.563643, 0, 0.3176471, 1, 1,
0.2266161, -1.014043, 1.347139, 0, 0.3098039, 1, 1,
0.2324793, 1.533734, 2.489143, 0, 0.3058824, 1, 1,
0.2428827, 1.60702, -2.057913, 0, 0.2980392, 1, 1,
0.246517, 2.073209, 0.07615294, 0, 0.2901961, 1, 1,
0.2511592, -1.519298, 4.169228, 0, 0.2862745, 1, 1,
0.2516741, -0.237231, 2.150204, 0, 0.2784314, 1, 1,
0.2536285, -0.5574402, 1.265173, 0, 0.2745098, 1, 1,
0.2609689, 1.874207, 0.6990277, 0, 0.2666667, 1, 1,
0.2665676, 1.010458, -0.5231504, 0, 0.2627451, 1, 1,
0.2746699, -1.437832, 2.457239, 0, 0.254902, 1, 1,
0.2831203, 0.1758467, 1.589111, 0, 0.2509804, 1, 1,
0.2842778, 1.044579, -1.411592, 0, 0.2431373, 1, 1,
0.2859719, -1.834691, 3.72379, 0, 0.2392157, 1, 1,
0.2872604, -0.8552517, 3.700844, 0, 0.2313726, 1, 1,
0.2889574, -1.79932, 2.943707, 0, 0.227451, 1, 1,
0.2896197, 0.4978995, 1.377622, 0, 0.2196078, 1, 1,
0.289637, 0.04787956, 1.639102, 0, 0.2156863, 1, 1,
0.2928925, 0.9658527, 0.230321, 0, 0.2078431, 1, 1,
0.2942494, -0.12957, 2.749962, 0, 0.2039216, 1, 1,
0.2946465, 1.525233, -0.1169157, 0, 0.1960784, 1, 1,
0.2968176, 0.8289667, -0.6889002, 0, 0.1882353, 1, 1,
0.3032904, 0.3268777, -0.03973011, 0, 0.1843137, 1, 1,
0.3041959, 0.3458456, 0.8507761, 0, 0.1764706, 1, 1,
0.3047878, 0.09968006, 0.848409, 0, 0.172549, 1, 1,
0.3060341, 0.2185188, 0.9941159, 0, 0.1647059, 1, 1,
0.3086532, 0.7027242, 1.363834, 0, 0.1607843, 1, 1,
0.3097989, 1.205396, -0.2765695, 0, 0.1529412, 1, 1,
0.3098384, -1.201542, 1.3537, 0, 0.1490196, 1, 1,
0.3124557, -0.6602755, 2.134763, 0, 0.1411765, 1, 1,
0.3126693, 0.5520803, -0.1869441, 0, 0.1372549, 1, 1,
0.313427, 0.09050147, -0.326253, 0, 0.1294118, 1, 1,
0.3207411, -0.4022674, 1.210536, 0, 0.1254902, 1, 1,
0.3261208, 1.509183, -0.2129729, 0, 0.1176471, 1, 1,
0.3408034, -0.4743112, 2.170382, 0, 0.1137255, 1, 1,
0.3432069, 0.3502627, -0.3559008, 0, 0.1058824, 1, 1,
0.3467393, 1.004861, -0.4527814, 0, 0.09803922, 1, 1,
0.3485537, 0.1868851, 0.7018593, 0, 0.09411765, 1, 1,
0.3510079, 0.846168, 0.3985322, 0, 0.08627451, 1, 1,
0.3513033, 1.194854, -0.9605361, 0, 0.08235294, 1, 1,
0.3533241, 0.2149459, -0.02955583, 0, 0.07450981, 1, 1,
0.3556993, -0.1813655, 0.4628236, 0, 0.07058824, 1, 1,
0.3599336, -0.581606, 2.370546, 0, 0.0627451, 1, 1,
0.3626329, -1.184293, 3.452093, 0, 0.05882353, 1, 1,
0.3678682, -0.7319888, 3.506463, 0, 0.05098039, 1, 1,
0.3686561, -1.787936, 1.839133, 0, 0.04705882, 1, 1,
0.3708897, -0.7363106, 1.607035, 0, 0.03921569, 1, 1,
0.3765188, -0.5520325, 1.567879, 0, 0.03529412, 1, 1,
0.3767529, 1.050309, 0.8823371, 0, 0.02745098, 1, 1,
0.4029096, -0.0430246, 0.7651064, 0, 0.02352941, 1, 1,
0.4030494, 0.5795139, 0.3265113, 0, 0.01568628, 1, 1,
0.4038131, 0.9566413, 1.223966, 0, 0.01176471, 1, 1,
0.4045855, -0.1255818, 1.864778, 0, 0.003921569, 1, 1,
0.4061508, -2.184992, 2.712371, 0.003921569, 0, 1, 1,
0.4074672, 0.3047409, 4.183084, 0.007843138, 0, 1, 1,
0.4158262, 1.266055, -1.806696, 0.01568628, 0, 1, 1,
0.4166459, 0.3845993, 1.495084, 0.01960784, 0, 1, 1,
0.41803, 0.4560557, 1.799116, 0.02745098, 0, 1, 1,
0.4180942, -0.7889091, 2.454157, 0.03137255, 0, 1, 1,
0.4254628, -1.058139, 1.261099, 0.03921569, 0, 1, 1,
0.4270093, -0.5542315, 3.462225, 0.04313726, 0, 1, 1,
0.4348042, -0.3239162, 2.925157, 0.05098039, 0, 1, 1,
0.4438762, 0.2481722, 0.05014015, 0.05490196, 0, 1, 1,
0.4443493, 0.314061, 2.609521, 0.0627451, 0, 1, 1,
0.4487571, 1.219528, -0.532445, 0.06666667, 0, 1, 1,
0.4502859, 0.8309589, 1.053741, 0.07450981, 0, 1, 1,
0.4537844, 0.6015533, -0.2578362, 0.07843138, 0, 1, 1,
0.4555862, 0.2621845, 1.686474, 0.08627451, 0, 1, 1,
0.4564092, -0.6313047, 2.793967, 0.09019608, 0, 1, 1,
0.456857, 1.21182, 1.219343, 0.09803922, 0, 1, 1,
0.4569409, -1.101902, 3.680769, 0.1058824, 0, 1, 1,
0.4572334, 0.03727655, 1.936962, 0.1098039, 0, 1, 1,
0.4638182, -0.2196519, 1.682275, 0.1176471, 0, 1, 1,
0.4667366, 0.2259741, 0.9580405, 0.1215686, 0, 1, 1,
0.4707027, 1.540956, 0.02547046, 0.1294118, 0, 1, 1,
0.4751643, -0.1571446, 1.258988, 0.1333333, 0, 1, 1,
0.4769757, 0.8566793, 2.579857, 0.1411765, 0, 1, 1,
0.4801001, -0.01025499, 2.663808, 0.145098, 0, 1, 1,
0.4860046, -1.213146, 2.749269, 0.1529412, 0, 1, 1,
0.4865737, -0.5232925, 2.506751, 0.1568628, 0, 1, 1,
0.4881989, -0.8915364, 2.419594, 0.1647059, 0, 1, 1,
0.49324, -1.592018, 3.120842, 0.1686275, 0, 1, 1,
0.4973555, -1.372351, 0.7293868, 0.1764706, 0, 1, 1,
0.502718, -0.4554733, 1.691797, 0.1803922, 0, 1, 1,
0.5032138, -0.9702839, 2.584829, 0.1882353, 0, 1, 1,
0.5162667, 0.1254459, 1.216226, 0.1921569, 0, 1, 1,
0.5180202, 0.8298255, -0.6038219, 0.2, 0, 1, 1,
0.520447, 0.003870359, 2.744315, 0.2078431, 0, 1, 1,
0.5325876, -2.600113, 3.220095, 0.2117647, 0, 1, 1,
0.5330319, -0.7738465, 2.591344, 0.2196078, 0, 1, 1,
0.533348, -0.7917495, 2.068128, 0.2235294, 0, 1, 1,
0.5339206, -0.9713343, 3.123852, 0.2313726, 0, 1, 1,
0.5361043, 0.8544509, 0.4000434, 0.2352941, 0, 1, 1,
0.5386237, -2.463428, 2.553663, 0.2431373, 0, 1, 1,
0.5450073, 0.6190648, -1.034752, 0.2470588, 0, 1, 1,
0.5475918, 1.138495, 0.8789118, 0.254902, 0, 1, 1,
0.5490077, 0.1318051, 2.118436, 0.2588235, 0, 1, 1,
0.5504004, 0.663197, 1.57625, 0.2666667, 0, 1, 1,
0.5560315, 0.05727835, 2.715545, 0.2705882, 0, 1, 1,
0.5605111, 2.060478, -0.1225684, 0.2784314, 0, 1, 1,
0.5607606, 0.652591, 0.3372359, 0.282353, 0, 1, 1,
0.5664616, -0.3389035, 0.9444448, 0.2901961, 0, 1, 1,
0.5694737, 1.089282, -0.6451566, 0.2941177, 0, 1, 1,
0.5697479, 0.6196201, 1.296511, 0.3019608, 0, 1, 1,
0.5733503, -0.2430882, 2.157222, 0.3098039, 0, 1, 1,
0.5751568, 0.5872397, 2.928268, 0.3137255, 0, 1, 1,
0.5752866, -0.7220173, 2.693418, 0.3215686, 0, 1, 1,
0.5822497, -0.3374889, 2.837022, 0.3254902, 0, 1, 1,
0.5835047, 0.4581164, 0.4683029, 0.3333333, 0, 1, 1,
0.585305, -0.3129453, 0.6337782, 0.3372549, 0, 1, 1,
0.5896802, -0.698976, 1.679967, 0.345098, 0, 1, 1,
0.5933937, -0.309151, 1.972316, 0.3490196, 0, 1, 1,
0.5963778, -0.6250502, 1.684247, 0.3568628, 0, 1, 1,
0.6015582, 1.103101, 0.7567474, 0.3607843, 0, 1, 1,
0.603599, -0.8670778, 1.390523, 0.3686275, 0, 1, 1,
0.6046798, -0.6719856, 3.841852, 0.372549, 0, 1, 1,
0.608083, 1.081184, 1.561455, 0.3803922, 0, 1, 1,
0.6120254, -0.08285532, 0.7276239, 0.3843137, 0, 1, 1,
0.6134974, -0.3194085, 2.997159, 0.3921569, 0, 1, 1,
0.616897, 1.097039, 0.4897772, 0.3960784, 0, 1, 1,
0.6185483, 1.599867, 1.211043, 0.4039216, 0, 1, 1,
0.6193253, 0.3555009, 1.580103, 0.4117647, 0, 1, 1,
0.6253106, -0.3347332, 2.457064, 0.4156863, 0, 1, 1,
0.6258751, -1.733545, 2.501559, 0.4235294, 0, 1, 1,
0.6267485, -0.9849608, 1.872872, 0.427451, 0, 1, 1,
0.6290339, 0.8131092, 1.289292, 0.4352941, 0, 1, 1,
0.6304065, 0.7033181, 0.0064157, 0.4392157, 0, 1, 1,
0.6321782, -0.3308381, 2.419723, 0.4470588, 0, 1, 1,
0.6365486, -0.0004134761, 1.958025, 0.4509804, 0, 1, 1,
0.6381305, 0.2335469, 2.185042, 0.4588235, 0, 1, 1,
0.643231, 0.3766842, 0.948577, 0.4627451, 0, 1, 1,
0.6458868, -1.354715, 4.475314, 0.4705882, 0, 1, 1,
0.6520262, 1.227083, -0.1733165, 0.4745098, 0, 1, 1,
0.6579849, -1.176872, 1.714357, 0.4823529, 0, 1, 1,
0.6621565, 0.1840733, 1.523133, 0.4862745, 0, 1, 1,
0.6637414, -1.483708, 3.124674, 0.4941176, 0, 1, 1,
0.6666789, -1.688582, 3.444964, 0.5019608, 0, 1, 1,
0.6671725, 0.657319, 1.164434, 0.5058824, 0, 1, 1,
0.6714829, 0.3449215, 0.04025352, 0.5137255, 0, 1, 1,
0.6747168, -0.2669225, 1.657525, 0.5176471, 0, 1, 1,
0.6788935, -0.07943929, 1.182051, 0.5254902, 0, 1, 1,
0.6831103, 1.281028, 0.7896531, 0.5294118, 0, 1, 1,
0.6831524, 1.504172, 1.961162, 0.5372549, 0, 1, 1,
0.6852437, -1.040043, 2.303058, 0.5411765, 0, 1, 1,
0.6883434, -0.9045746, 0.4419397, 0.5490196, 0, 1, 1,
0.6895751, 0.04442688, 1.288724, 0.5529412, 0, 1, 1,
0.6907604, 0.5084726, 2.591868, 0.5607843, 0, 1, 1,
0.6928011, -0.6058115, 2.204056, 0.5647059, 0, 1, 1,
0.6931071, 0.01664989, 2.813994, 0.572549, 0, 1, 1,
0.6955997, -0.9707761, 2.021252, 0.5764706, 0, 1, 1,
0.6969456, -0.02452708, 0.5274527, 0.5843138, 0, 1, 1,
0.6982464, 0.9348013, 2.536248, 0.5882353, 0, 1, 1,
0.7133728, 0.3162668, 1.079665, 0.5960785, 0, 1, 1,
0.7142006, -0.3849603, 3.416362, 0.6039216, 0, 1, 1,
0.7153812, 0.4380749, -0.1764636, 0.6078432, 0, 1, 1,
0.7156593, -1.151646, 1.497664, 0.6156863, 0, 1, 1,
0.7174379, 1.386078, 1.028085, 0.6196079, 0, 1, 1,
0.7193758, 2.230921, 1.002535, 0.627451, 0, 1, 1,
0.7227503, 0.1538798, 0.8950431, 0.6313726, 0, 1, 1,
0.7239164, 1.16331, -0.2981142, 0.6392157, 0, 1, 1,
0.7254466, -0.7780066, 2.535522, 0.6431373, 0, 1, 1,
0.7289516, 2.311678, -1.49666, 0.6509804, 0, 1, 1,
0.7302107, 0.3564391, -0.0526039, 0.654902, 0, 1, 1,
0.7318903, -0.3810881, 0.6172933, 0.6627451, 0, 1, 1,
0.7441089, 0.4472002, 1.435009, 0.6666667, 0, 1, 1,
0.746452, -0.7895519, 2.682608, 0.6745098, 0, 1, 1,
0.7498925, 1.182188, 0.6152595, 0.6784314, 0, 1, 1,
0.7569509, 0.1400088, 2.952878, 0.6862745, 0, 1, 1,
0.7584936, 0.8144479, 1.991035, 0.6901961, 0, 1, 1,
0.7626019, -0.4216184, 1.654999, 0.6980392, 0, 1, 1,
0.7659109, -0.5433952, 4.416866, 0.7058824, 0, 1, 1,
0.7701197, 0.2530333, 1.051375, 0.7098039, 0, 1, 1,
0.7727838, 1.063762, -0.002669716, 0.7176471, 0, 1, 1,
0.7731267, 0.2741643, 1.905967, 0.7215686, 0, 1, 1,
0.7741535, -0.7131472, 1.757326, 0.7294118, 0, 1, 1,
0.7757621, -0.7698315, 3.284476, 0.7333333, 0, 1, 1,
0.7844771, -1.246773, 2.674307, 0.7411765, 0, 1, 1,
0.7861549, 0.4736896, 2.298581, 0.7450981, 0, 1, 1,
0.7913018, -0.3457911, 1.523089, 0.7529412, 0, 1, 1,
0.7950809, -0.8017434, 3.86572, 0.7568628, 0, 1, 1,
0.7956474, -1.234605, 2.723803, 0.7647059, 0, 1, 1,
0.8100131, 0.979768, 1.735132, 0.7686275, 0, 1, 1,
0.8132598, -0.5628029, 2.597384, 0.7764706, 0, 1, 1,
0.8203819, 0.2547774, 2.297834, 0.7803922, 0, 1, 1,
0.8232681, -0.09864884, 1.845758, 0.7882353, 0, 1, 1,
0.8248535, 0.3007859, 1.990088, 0.7921569, 0, 1, 1,
0.828802, -2.468921, 3.177058, 0.8, 0, 1, 1,
0.832101, -1.082423, 1.609308, 0.8078431, 0, 1, 1,
0.8333797, 0.9232239, 2.305833, 0.8117647, 0, 1, 1,
0.8337979, 1.335223, -0.6497672, 0.8196079, 0, 1, 1,
0.8531178, 1.204185, 0.2679484, 0.8235294, 0, 1, 1,
0.857331, 0.1917578, 2.234619, 0.8313726, 0, 1, 1,
0.8573852, 0.4222212, -0.001718279, 0.8352941, 0, 1, 1,
0.8651616, -1.903021, 2.171607, 0.8431373, 0, 1, 1,
0.8726813, 1.178144, 1.028099, 0.8470588, 0, 1, 1,
0.8781717, 0.4293807, 1.224162, 0.854902, 0, 1, 1,
0.8782293, -2.003019, 1.667469, 0.8588235, 0, 1, 1,
0.8807894, 2.790677, 0.4447111, 0.8666667, 0, 1, 1,
0.8818969, -1.999968, 4.017894, 0.8705882, 0, 1, 1,
0.8840725, -0.7336776, 2.779538, 0.8784314, 0, 1, 1,
0.8877295, 1.439337, 0.3700454, 0.8823529, 0, 1, 1,
0.8878037, -0.5740579, 0.7554721, 0.8901961, 0, 1, 1,
0.8963041, -0.2188159, 1.922454, 0.8941177, 0, 1, 1,
0.9012769, -0.582835, 2.569297, 0.9019608, 0, 1, 1,
0.9027275, -0.9981406, 3.016195, 0.9098039, 0, 1, 1,
0.9027471, -0.4080459, 2.303952, 0.9137255, 0, 1, 1,
0.9036565, 0.3479034, 1.437495, 0.9215686, 0, 1, 1,
0.9079081, -0.3055499, 1.938361, 0.9254902, 0, 1, 1,
0.9084837, 0.8942038, 1.108562, 0.9333333, 0, 1, 1,
0.91083, -0.5579417, 2.247239, 0.9372549, 0, 1, 1,
0.9145588, -0.4841532, 1.91596, 0.945098, 0, 1, 1,
0.9169378, -0.7600225, 1.871772, 0.9490196, 0, 1, 1,
0.9208262, 0.9663346, -0.2450138, 0.9568627, 0, 1, 1,
0.9216662, 1.302674, 0.9055817, 0.9607843, 0, 1, 1,
0.9294865, 0.223083, 0.8973389, 0.9686275, 0, 1, 1,
0.9324951, -1.008403, 2.572884, 0.972549, 0, 1, 1,
0.9375279, -2.207747, 3.081643, 0.9803922, 0, 1, 1,
0.9408996, 1.364661, 0.5677593, 0.9843137, 0, 1, 1,
0.9453343, 1.050152, 0.6458357, 0.9921569, 0, 1, 1,
0.9463139, 1.051654, 2.12361, 0.9960784, 0, 1, 1,
0.9498, 0.08263656, 1.328325, 1, 0, 0.9960784, 1,
0.9601756, 0.9763205, 0.785267, 1, 0, 0.9882353, 1,
0.9623718, -0.7889934, 2.65906, 1, 0, 0.9843137, 1,
0.9637287, 1.097182, 1.184487, 1, 0, 0.9764706, 1,
0.9639106, -0.8959439, 1.878193, 1, 0, 0.972549, 1,
0.9743737, 0.1177319, 1.728363, 1, 0, 0.9647059, 1,
0.9756711, -0.001565372, 2.459064, 1, 0, 0.9607843, 1,
0.9841699, 0.2027955, 3.359063, 1, 0, 0.9529412, 1,
0.9869599, -0.2643088, 2.288366, 1, 0, 0.9490196, 1,
0.9870893, 1.151158, 2.623497, 1, 0, 0.9411765, 1,
0.9918872, 0.2020044, 1.660161, 1, 0, 0.9372549, 1,
0.9934325, 1.200927, 0.7621205, 1, 0, 0.9294118, 1,
0.9938948, 0.6257139, 1.547, 1, 0, 0.9254902, 1,
1.000254, -0.6263617, 2.476708, 1, 0, 0.9176471, 1,
1.000303, -0.9614166, 1.671527, 1, 0, 0.9137255, 1,
1.008126, 0.5572893, 1.643547, 1, 0, 0.9058824, 1,
1.014338, 0.1314628, 2.822966, 1, 0, 0.9019608, 1,
1.015569, -0.3191379, 1.647042, 1, 0, 0.8941177, 1,
1.017874, -1.28119, 2.47895, 1, 0, 0.8862745, 1,
1.019922, 0.3718352, 1.207493, 1, 0, 0.8823529, 1,
1.024275, -0.9405632, 3.307722, 1, 0, 0.8745098, 1,
1.027196, -0.3051693, -0.3828948, 1, 0, 0.8705882, 1,
1.035774, 0.5246478, 1.886447, 1, 0, 0.8627451, 1,
1.037895, 0.124901, 1.035997, 1, 0, 0.8588235, 1,
1.039671, 1.025518, 3.98004, 1, 0, 0.8509804, 1,
1.03977, -1.526327, 2.724469, 1, 0, 0.8470588, 1,
1.041318, 0.1783546, 1.175712, 1, 0, 0.8392157, 1,
1.042228, -0.6052932, 1.37039, 1, 0, 0.8352941, 1,
1.043251, -0.6075472, 1.540803, 1, 0, 0.827451, 1,
1.049626, 1.586555, -0.5017392, 1, 0, 0.8235294, 1,
1.051297, -0.1582199, 0.6030697, 1, 0, 0.8156863, 1,
1.052309, 1.953393, 0.5586454, 1, 0, 0.8117647, 1,
1.057991, -0.5749786, 0.8748357, 1, 0, 0.8039216, 1,
1.067362, 1.736134, 1.067449, 1, 0, 0.7960784, 1,
1.071575, -0.6556676, 0.7285888, 1, 0, 0.7921569, 1,
1.081671, 0.1742137, 0.9324226, 1, 0, 0.7843137, 1,
1.091624, 1.141175, 2.761597, 1, 0, 0.7803922, 1,
1.097733, -1.273759, 2.569792, 1, 0, 0.772549, 1,
1.099928, -0.4696565, 1.087854, 1, 0, 0.7686275, 1,
1.104889, -0.7883394, 0.1296178, 1, 0, 0.7607843, 1,
1.105189, 0.8542465, -0.02393943, 1, 0, 0.7568628, 1,
1.125232, 0.3765949, 1.304092, 1, 0, 0.7490196, 1,
1.127747, -1.856308, 2.329876, 1, 0, 0.7450981, 1,
1.133109, -0.472878, 1.450794, 1, 0, 0.7372549, 1,
1.133216, 1.105052, 0.2337644, 1, 0, 0.7333333, 1,
1.135324, -0.8815189, 2.237531, 1, 0, 0.7254902, 1,
1.137808, 1.188899, -0.5387648, 1, 0, 0.7215686, 1,
1.141917, 0.5590131, -0.2525001, 1, 0, 0.7137255, 1,
1.142227, 0.2488075, 1.242842, 1, 0, 0.7098039, 1,
1.145654, -1.029399, 2.80933, 1, 0, 0.7019608, 1,
1.146505, -0.9638284, 3.024082, 1, 0, 0.6941177, 1,
1.174604, 0.2947702, 2.98534, 1, 0, 0.6901961, 1,
1.180179, 0.1137387, 1.230963, 1, 0, 0.682353, 1,
1.185599, 0.5265355, 1.133506, 1, 0, 0.6784314, 1,
1.188769, -0.0961326, 2.25919, 1, 0, 0.6705883, 1,
1.193891, -0.488438, 1.462427, 1, 0, 0.6666667, 1,
1.194749, -0.6332567, 1.084264, 1, 0, 0.6588235, 1,
1.203392, 1.340884, 0.7742227, 1, 0, 0.654902, 1,
1.203481, 0.8477039, -2.807429, 1, 0, 0.6470588, 1,
1.217057, -0.04130533, 2.040946, 1, 0, 0.6431373, 1,
1.220561, 0.5739237, 1.493412, 1, 0, 0.6352941, 1,
1.230382, 1.049852, -1.606452, 1, 0, 0.6313726, 1,
1.230658, 0.5042574, 0.9380572, 1, 0, 0.6235294, 1,
1.23188, 1.29802, 0.4631826, 1, 0, 0.6196079, 1,
1.239279, 0.4345433, 1.215373, 1, 0, 0.6117647, 1,
1.239482, -0.104664, -0.09701248, 1, 0, 0.6078432, 1,
1.240046, -0.2928671, 2.228282, 1, 0, 0.6, 1,
1.252977, 1.644544, -0.01866635, 1, 0, 0.5921569, 1,
1.264782, 0.691815, 1.826172, 1, 0, 0.5882353, 1,
1.273811, -0.4225017, 0.4409477, 1, 0, 0.5803922, 1,
1.278137, -1.091869, 1.195996, 1, 0, 0.5764706, 1,
1.280348, 0.4670451, 2.516258, 1, 0, 0.5686275, 1,
1.284225, 0.327252, 2.423143, 1, 0, 0.5647059, 1,
1.303328, -0.248762, 0.2490814, 1, 0, 0.5568628, 1,
1.315246, -0.5434383, 1.886175, 1, 0, 0.5529412, 1,
1.321373, 1.597994, 1.533297, 1, 0, 0.5450981, 1,
1.332921, 0.6861531, -0.05505203, 1, 0, 0.5411765, 1,
1.337962, -1.444393, 1.745035, 1, 0, 0.5333334, 1,
1.338983, -0.6027797, 1.173321, 1, 0, 0.5294118, 1,
1.33948, 0.9250154, 1.308155, 1, 0, 0.5215687, 1,
1.340984, -0.998625, 1.784451, 1, 0, 0.5176471, 1,
1.356168, 0.6893634, 2.809711, 1, 0, 0.509804, 1,
1.364231, 1.37702, -0.4288354, 1, 0, 0.5058824, 1,
1.365808, -1.091306, 1.50958, 1, 0, 0.4980392, 1,
1.36619, 0.7925554, 2.662528, 1, 0, 0.4901961, 1,
1.417972, -1.672353, 2.503545, 1, 0, 0.4862745, 1,
1.418242, -2.305057, 3.422798, 1, 0, 0.4784314, 1,
1.418786, 1.715692, 1.876617, 1, 0, 0.4745098, 1,
1.419975, -1.993773, 2.093976, 1, 0, 0.4666667, 1,
1.423226, 0.7155294, 1.798487, 1, 0, 0.4627451, 1,
1.446586, 0.1103052, 1.583398, 1, 0, 0.454902, 1,
1.453722, 0.3059599, 2.099537, 1, 0, 0.4509804, 1,
1.457057, 1.322036, 1.190878, 1, 0, 0.4431373, 1,
1.458416, -0.5721219, 2.340837, 1, 0, 0.4392157, 1,
1.463245, 0.46059, 2.300601, 1, 0, 0.4313726, 1,
1.470858, 0.5447227, -0.1412071, 1, 0, 0.427451, 1,
1.487622, -1.089698, 3.677245, 1, 0, 0.4196078, 1,
1.490386, 0.5176225, 0.2593761, 1, 0, 0.4156863, 1,
1.49739, 0.5201883, 2.363513, 1, 0, 0.4078431, 1,
1.50451, -1.595992, 2.156196, 1, 0, 0.4039216, 1,
1.512014, -0.02876253, -0.3553216, 1, 0, 0.3960784, 1,
1.516595, 1.432706, 1.336429, 1, 0, 0.3882353, 1,
1.519417, -1.705629, 0.5051811, 1, 0, 0.3843137, 1,
1.525817, 0.1521147, 2.56411, 1, 0, 0.3764706, 1,
1.532879, 0.02896927, 0.1283933, 1, 0, 0.372549, 1,
1.537611, 0.8865117, 0.2570464, 1, 0, 0.3647059, 1,
1.542886, 1.618066, -1.244776, 1, 0, 0.3607843, 1,
1.544218, 0.9404026, 1.514383, 1, 0, 0.3529412, 1,
1.549755, -0.798167, 3.353824, 1, 0, 0.3490196, 1,
1.552447, -0.7346885, 2.696891, 1, 0, 0.3411765, 1,
1.554523, -0.6635954, 2.295738, 1, 0, 0.3372549, 1,
1.55861, -1.894073, 3.155507, 1, 0, 0.3294118, 1,
1.559044, 0.573673, 1.921178, 1, 0, 0.3254902, 1,
1.56174, -0.5588969, 1.721149, 1, 0, 0.3176471, 1,
1.568242, 0.05498814, 1.828195, 1, 0, 0.3137255, 1,
1.608474, -1.092949, 0.4435851, 1, 0, 0.3058824, 1,
1.622927, 0.8022664, 0.7884892, 1, 0, 0.2980392, 1,
1.641025, -0.8819661, 4.453779, 1, 0, 0.2941177, 1,
1.649176, 0.1213209, 1.925373, 1, 0, 0.2862745, 1,
1.653859, 0.204098, 1.891576, 1, 0, 0.282353, 1,
1.669064, 1.392932, 0.4601003, 1, 0, 0.2745098, 1,
1.671551, -0.6539468, 3.245661, 1, 0, 0.2705882, 1,
1.67844, 1.218804, 2.118049, 1, 0, 0.2627451, 1,
1.692599, 0.5362526, 1.066326, 1, 0, 0.2588235, 1,
1.699545, 0.04971698, 0.43126, 1, 0, 0.2509804, 1,
1.702539, -1.431162, 2.863892, 1, 0, 0.2470588, 1,
1.704534, -0.6870924, 3.11256, 1, 0, 0.2392157, 1,
1.716915, -0.5179579, 2.231188, 1, 0, 0.2352941, 1,
1.717822, -0.115483, 1.739801, 1, 0, 0.227451, 1,
1.731396, -1.006401, 2.007489, 1, 0, 0.2235294, 1,
1.758325, 1.804906, 3.248197, 1, 0, 0.2156863, 1,
1.766569, -0.664515, 1.583698, 1, 0, 0.2117647, 1,
1.786759, -0.2161741, 0.7141896, 1, 0, 0.2039216, 1,
1.799607, 0.7854466, 0.8900505, 1, 0, 0.1960784, 1,
1.801797, 0.1387116, 2.559585, 1, 0, 0.1921569, 1,
1.840306, -0.6491747, 2.136448, 1, 0, 0.1843137, 1,
1.848473, -0.7549487, 2.747374, 1, 0, 0.1803922, 1,
1.849198, -0.8967468, 1.357442, 1, 0, 0.172549, 1,
1.874219, -0.2668032, 4.373644, 1, 0, 0.1686275, 1,
1.8776, 0.921214, -0.1043878, 1, 0, 0.1607843, 1,
1.888674, 1.076759, 1.653771, 1, 0, 0.1568628, 1,
1.889458, 0.8798454, 2.014575, 1, 0, 0.1490196, 1,
1.94715, 0.09287402, 2.180694, 1, 0, 0.145098, 1,
1.951512, 0.3313932, 1.674203, 1, 0, 0.1372549, 1,
1.955416, -0.5360402, 3.943573, 1, 0, 0.1333333, 1,
1.972187, 1.343295, 0.8677434, 1, 0, 0.1254902, 1,
1.995336, -0.3434929, -0.2246646, 1, 0, 0.1215686, 1,
1.997854, 1.209089, -0.1114969, 1, 0, 0.1137255, 1,
1.998422, 0.935314, 3.175218, 1, 0, 0.1098039, 1,
2.00512, -1.409102, 2.053591, 1, 0, 0.1019608, 1,
2.019254, -0.4030288, 0.7659117, 1, 0, 0.09411765, 1,
2.045088, 1.114202, -0.09356727, 1, 0, 0.09019608, 1,
2.057363, -0.1145558, 2.092092, 1, 0, 0.08235294, 1,
2.101379, -0.796571, 2.332913, 1, 0, 0.07843138, 1,
2.12425, 0.5630254, 2.321229, 1, 0, 0.07058824, 1,
2.124574, 1.448084, 0.8260157, 1, 0, 0.06666667, 1,
2.128055, -0.172704, 0.7044213, 1, 0, 0.05882353, 1,
2.248455, 0.8237716, 2.146496, 1, 0, 0.05490196, 1,
2.274364, -0.01070996, 1.342467, 1, 0, 0.04705882, 1,
2.325978, 1.430907, -0.01800204, 1, 0, 0.04313726, 1,
2.363114, 0.1669424, 2.532396, 1, 0, 0.03529412, 1,
2.406385, -1.013909, 1.442627, 1, 0, 0.03137255, 1,
2.643451, -0.0002303782, 0.9095778, 1, 0, 0.02352941, 1,
2.684386, -0.3655578, 3.218936, 1, 0, 0.01960784, 1,
3.204793, -0.2018002, 1.168501, 1, 0, 0.01176471, 1,
3.662267, 1.252211, 0.7374386, 1, 0, 0.007843138, 1
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
0.2354445, -3.620839, -7.342594, 0, -0.5, 0.5, 0.5,
0.2354445, -3.620839, -7.342594, 1, -0.5, 0.5, 0.5,
0.2354445, -3.620839, -7.342594, 1, 1.5, 0.5, 0.5,
0.2354445, -3.620839, -7.342594, 0, 1.5, 0.5, 0.5
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
-4.353071, 0.3819093, -7.342594, 0, -0.5, 0.5, 0.5,
-4.353071, 0.3819093, -7.342594, 1, -0.5, 0.5, 0.5,
-4.353071, 0.3819093, -7.342594, 1, 1.5, 0.5, 0.5,
-4.353071, 0.3819093, -7.342594, 0, 1.5, 0.5, 0.5
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
-4.353071, -3.620839, 0.434283, 0, -0.5, 0.5, 0.5,
-4.353071, -3.620839, 0.434283, 1, -0.5, 0.5, 0.5,
-4.353071, -3.620839, 0.434283, 1, 1.5, 0.5, 0.5,
-4.353071, -3.620839, 0.434283, 0, 1.5, 0.5, 0.5
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
-3, -2.697128, -5.54793,
3, -2.697128, -5.54793,
-3, -2.697128, -5.54793,
-3, -2.85108, -5.847041,
-2, -2.697128, -5.54793,
-2, -2.85108, -5.847041,
-1, -2.697128, -5.54793,
-1, -2.85108, -5.847041,
0, -2.697128, -5.54793,
0, -2.85108, -5.847041,
1, -2.697128, -5.54793,
1, -2.85108, -5.847041,
2, -2.697128, -5.54793,
2, -2.85108, -5.847041,
3, -2.697128, -5.54793,
3, -2.85108, -5.847041
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
-3, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
-3, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
-3, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
-3, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
-2, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
-2, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
-2, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
-2, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
-1, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
-1, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
-1, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
-1, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
0, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
0, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
0, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
0, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
1, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
1, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
1, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
1, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
2, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
2, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
2, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
2, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5,
3, -3.158984, -6.445262, 0, -0.5, 0.5, 0.5,
3, -3.158984, -6.445262, 1, -0.5, 0.5, 0.5,
3, -3.158984, -6.445262, 1, 1.5, 0.5, 0.5,
3, -3.158984, -6.445262, 0, 1.5, 0.5, 0.5
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
-3.294183, -2, -5.54793,
-3.294183, 3, -5.54793,
-3.294183, -2, -5.54793,
-3.470665, -2, -5.847041,
-3.294183, -1, -5.54793,
-3.470665, -1, -5.847041,
-3.294183, 0, -5.54793,
-3.470665, 0, -5.847041,
-3.294183, 1, -5.54793,
-3.470665, 1, -5.847041,
-3.294183, 2, -5.54793,
-3.470665, 2, -5.847041,
-3.294183, 3, -5.54793,
-3.470665, 3, -5.847041
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
-3.823627, -2, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, -2, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, -2, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, -2, -6.445262, 0, 1.5, 0.5, 0.5,
-3.823627, -1, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, -1, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, -1, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, -1, -6.445262, 0, 1.5, 0.5, 0.5,
-3.823627, 0, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, 0, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, 0, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, 0, -6.445262, 0, 1.5, 0.5, 0.5,
-3.823627, 1, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, 1, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, 1, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, 1, -6.445262, 0, 1.5, 0.5, 0.5,
-3.823627, 2, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, 2, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, 2, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, 2, -6.445262, 0, 1.5, 0.5, 0.5,
-3.823627, 3, -6.445262, 0, -0.5, 0.5, 0.5,
-3.823627, 3, -6.445262, 1, -0.5, 0.5, 0.5,
-3.823627, 3, -6.445262, 1, 1.5, 0.5, 0.5,
-3.823627, 3, -6.445262, 0, 1.5, 0.5, 0.5
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
-3.294183, -2.697128, -4,
-3.294183, -2.697128, 6,
-3.294183, -2.697128, -4,
-3.470665, -2.85108, -4,
-3.294183, -2.697128, -2,
-3.470665, -2.85108, -2,
-3.294183, -2.697128, 0,
-3.470665, -2.85108, 0,
-3.294183, -2.697128, 2,
-3.470665, -2.85108, 2,
-3.294183, -2.697128, 4,
-3.470665, -2.85108, 4,
-3.294183, -2.697128, 6,
-3.470665, -2.85108, 6
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
-3.823627, -3.158984, -4, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, -4, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, -4, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, -4, 0, 1.5, 0.5, 0.5,
-3.823627, -3.158984, -2, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, -2, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, -2, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, -2, 0, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 0, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 0, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 0, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 0, 0, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 2, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 2, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 2, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 2, 0, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 4, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 4, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 4, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 4, 0, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 6, 0, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 6, 1, -0.5, 0.5, 0.5,
-3.823627, -3.158984, 6, 1, 1.5, 0.5, 0.5,
-3.823627, -3.158984, 6, 0, 1.5, 0.5, 0.5
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
-3.294183, -2.697128, -5.54793,
-3.294183, 3.460947, -5.54793,
-3.294183, -2.697128, 6.416496,
-3.294183, 3.460947, 6.416496,
-3.294183, -2.697128, -5.54793,
-3.294183, -2.697128, 6.416496,
-3.294183, 3.460947, -5.54793,
-3.294183, 3.460947, 6.416496,
-3.294183, -2.697128, -5.54793,
3.765072, -2.697128, -5.54793,
-3.294183, -2.697128, 6.416496,
3.765072, -2.697128, 6.416496,
-3.294183, 3.460947, -5.54793,
3.765072, 3.460947, -5.54793,
-3.294183, 3.460947, 6.416496,
3.765072, 3.460947, 6.416496,
3.765072, -2.697128, -5.54793,
3.765072, 3.460947, -5.54793,
3.765072, -2.697128, 6.416496,
3.765072, 3.460947, 6.416496,
3.765072, -2.697128, -5.54793,
3.765072, -2.697128, 6.416496,
3.765072, 3.460947, -5.54793,
3.765072, 3.460947, 6.416496
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
var radius = 8.114089;
var distance = 36.1005;
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
mvMatrix.translate( -0.2354445, -0.3819093, -0.434283 );
mvMatrix.scale( 1.242782, 1.424652, 0.7332664 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.1005);
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
carboxin<-read.table("carboxin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
```

```r
y<-carboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
```

```r
z<-carboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxin' not found
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
-3.191378, -0.05604776, 0.3740655, 0, 0, 1, 1, 1,
-2.972055, -0.9594078, -0.8088859, 1, 0, 0, 1, 1,
-2.926687, -0.1571148, -2.002234, 1, 0, 0, 1, 1,
-2.80216, -1.205608, -3.549703, 1, 0, 0, 1, 1,
-2.65821, -0.4027522, -2.308067, 1, 0, 0, 1, 1,
-2.648573, -1.04512, -1.787719, 1, 0, 0, 1, 1,
-2.5361, 0.8023962, -2.544336, 0, 0, 0, 1, 1,
-2.511805, 0.3801239, -2.475403, 0, 0, 0, 1, 1,
-2.406399, 0.3484934, -2.127672, 0, 0, 0, 1, 1,
-2.39989, 1.498468, -0.6005947, 0, 0, 0, 1, 1,
-2.390867, 0.2618919, -1.177776, 0, 0, 0, 1, 1,
-2.382111, -0.1007454, -3.699769, 0, 0, 0, 1, 1,
-2.343819, -0.3398281, -3.376315, 0, 0, 0, 1, 1,
-2.337645, 0.2656247, -2.266533, 1, 1, 1, 1, 1,
-2.329556, 0.7664929, -1.891886, 1, 1, 1, 1, 1,
-2.315552, -0.4018805, -0.4735529, 1, 1, 1, 1, 1,
-2.295459, 0.6456192, -2.692273, 1, 1, 1, 1, 1,
-2.213696, 0.5568866, -2.226651, 1, 1, 1, 1, 1,
-2.144524, -0.1367186, -0.1532786, 1, 1, 1, 1, 1,
-2.097051, -1.040467, -1.461052, 1, 1, 1, 1, 1,
-2.086898, -0.03676283, -2.139799, 1, 1, 1, 1, 1,
-2.074887, 0.689455, -0.5351359, 1, 1, 1, 1, 1,
-2.058577, 1.071268, -2.072097, 1, 1, 1, 1, 1,
-2.048552, 3.371266, 0.06714004, 1, 1, 1, 1, 1,
-2.045965, 0.579119, -0.8852443, 1, 1, 1, 1, 1,
-2.028036, 0.4517165, 0.2993982, 1, 1, 1, 1, 1,
-2.025821, 1.739204, 1.293603, 1, 1, 1, 1, 1,
-1.969856, -0.3325185, -2.084412, 1, 1, 1, 1, 1,
-1.955159, 0.9437179, -0.1251451, 0, 0, 1, 1, 1,
-1.95454, -0.5057108, -1.942117, 1, 0, 0, 1, 1,
-1.950527, 0.2238988, -0.4934535, 1, 0, 0, 1, 1,
-1.912684, 0.1375802, -2.06434, 1, 0, 0, 1, 1,
-1.853945, -0.1383835, -1.801621, 1, 0, 0, 1, 1,
-1.842535, -0.8425628, -3.798062, 1, 0, 0, 1, 1,
-1.84024, -0.898135, -1.231201, 0, 0, 0, 1, 1,
-1.823508, -0.1513593, -2.436031, 0, 0, 0, 1, 1,
-1.822368, 0.7485168, -1.483125, 0, 0, 0, 1, 1,
-1.818457, -0.339285, -3.223766, 0, 0, 0, 1, 1,
-1.810527, -1.416088, -1.572754, 0, 0, 0, 1, 1,
-1.802226, 1.277283, -0.2277021, 0, 0, 0, 1, 1,
-1.79351, 0.5692171, -0.5451087, 0, 0, 0, 1, 1,
-1.791038, 0.4526297, -1.796735, 1, 1, 1, 1, 1,
-1.786754, -0.7701823, 0.00694977, 1, 1, 1, 1, 1,
-1.763279, 1.131453, 1.794956, 1, 1, 1, 1, 1,
-1.751006, 0.1435068, -2.346212, 1, 1, 1, 1, 1,
-1.749454, -0.08400407, -1.979363, 1, 1, 1, 1, 1,
-1.737415, -0.5137462, -0.9143092, 1, 1, 1, 1, 1,
-1.726033, -0.6938013, -0.7068684, 1, 1, 1, 1, 1,
-1.716509, -1.435272, -2.888888, 1, 1, 1, 1, 1,
-1.706635, -0.3320359, -1.629058, 1, 1, 1, 1, 1,
-1.699898, -2.069534, -1.768479, 1, 1, 1, 1, 1,
-1.689595, 0.02959608, -1.19995, 1, 1, 1, 1, 1,
-1.689553, -0.1474422, -0.3972403, 1, 1, 1, 1, 1,
-1.688392, 1.203397, -0.6198424, 1, 1, 1, 1, 1,
-1.684867, 1.982404, -1.434967, 1, 1, 1, 1, 1,
-1.680338, 0.09851301, -1.119683, 1, 1, 1, 1, 1,
-1.679791, 0.6202962, -0.8856307, 0, 0, 1, 1, 1,
-1.67275, 1.989823, -0.441149, 1, 0, 0, 1, 1,
-1.653266, -0.6775038, -2.314455, 1, 0, 0, 1, 1,
-1.648507, -1.071963, -2.827269, 1, 0, 0, 1, 1,
-1.630555, -0.2655651, -0.4963689, 1, 0, 0, 1, 1,
-1.617754, 2.391223, -2.519134, 1, 0, 0, 1, 1,
-1.614471, 0.8525088, -2.11627, 0, 0, 0, 1, 1,
-1.605653, -0.9335935, -2.317039, 0, 0, 0, 1, 1,
-1.590458, 0.6429734, 0.4862493, 0, 0, 0, 1, 1,
-1.576859, 1.933295, -1.975869, 0, 0, 0, 1, 1,
-1.576727, 0.3252847, -1.706978, 0, 0, 0, 1, 1,
-1.569017, 0.1874829, -2.678946, 0, 0, 0, 1, 1,
-1.56097, -0.04845636, -1.521109, 0, 0, 0, 1, 1,
-1.558021, -0.3891791, -2.081596, 1, 1, 1, 1, 1,
-1.546363, 1.70109, 0.8068004, 1, 1, 1, 1, 1,
-1.520931, -0.5494988, -1.0252, 1, 1, 1, 1, 1,
-1.506639, 0.6455107, -2.875103, 1, 1, 1, 1, 1,
-1.500346, -1.393771, -0.9654788, 1, 1, 1, 1, 1,
-1.497892, 0.2573009, -2.898809, 1, 1, 1, 1, 1,
-1.486493, -0.5870095, -3.4879, 1, 1, 1, 1, 1,
-1.484136, 0.1645143, -1.669849, 1, 1, 1, 1, 1,
-1.475603, 0.5603238, -3.271642, 1, 1, 1, 1, 1,
-1.461366, -2.06014, -3.787857, 1, 1, 1, 1, 1,
-1.44941, -1.699685, -3.065196, 1, 1, 1, 1, 1,
-1.445398, 0.4990057, -0.5562745, 1, 1, 1, 1, 1,
-1.428727, 0.1039091, 1.0401, 1, 1, 1, 1, 1,
-1.418986, -0.6094276, -2.747686, 1, 1, 1, 1, 1,
-1.416676, 0.2489967, -3.276688, 1, 1, 1, 1, 1,
-1.41252, 0.1398601, -0.8135041, 0, 0, 1, 1, 1,
-1.412164, 0.4187412, -1.794156, 1, 0, 0, 1, 1,
-1.410813, -0.6469623, -0.6917264, 1, 0, 0, 1, 1,
-1.402936, 0.4256326, -1.277442, 1, 0, 0, 1, 1,
-1.399481, -0.5256562, -2.314407, 1, 0, 0, 1, 1,
-1.397012, 0.6557312, -1.159453, 1, 0, 0, 1, 1,
-1.394781, 1.612238, -1.633126, 0, 0, 0, 1, 1,
-1.392234, 1.690308, 0.5116788, 0, 0, 0, 1, 1,
-1.391221, -1.102781, -2.851301, 0, 0, 0, 1, 1,
-1.389854, 0.4884357, -0.2642666, 0, 0, 0, 1, 1,
-1.388733, 1.748576, -0.2547429, 0, 0, 0, 1, 1,
-1.366163, 1.277437, -2.105787, 0, 0, 0, 1, 1,
-1.360659, 0.957728, -3.009267, 0, 0, 0, 1, 1,
-1.357254, -0.8998819, -0.6148431, 1, 1, 1, 1, 1,
-1.351907, -0.7279257, -1.612599, 1, 1, 1, 1, 1,
-1.342122, 2.237972, 0.2187251, 1, 1, 1, 1, 1,
-1.341636, 1.880585, -1.220769, 1, 1, 1, 1, 1,
-1.328954, 0.984991, -1.382575, 1, 1, 1, 1, 1,
-1.323085, -0.1193393, -1.043136, 1, 1, 1, 1, 1,
-1.29744, -1.285172, -3.659098, 1, 1, 1, 1, 1,
-1.289502, -1.114252, -1.205066, 1, 1, 1, 1, 1,
-1.286207, -1.478334, -2.807834, 1, 1, 1, 1, 1,
-1.283563, 0.09130421, -1.52589, 1, 1, 1, 1, 1,
-1.273714, -0.4461289, -2.176068, 1, 1, 1, 1, 1,
-1.260978, -0.2604154, -3.5731, 1, 1, 1, 1, 1,
-1.253488, -1.119316, -1.908845, 1, 1, 1, 1, 1,
-1.248569, -1.06346, -2.130986, 1, 1, 1, 1, 1,
-1.246776, 1.987889, -0.2092882, 1, 1, 1, 1, 1,
-1.245677, -0.09271943, -1.15832, 0, 0, 1, 1, 1,
-1.242659, -0.06740195, 0.7783868, 1, 0, 0, 1, 1,
-1.241629, -0.5062671, -1.188004, 1, 0, 0, 1, 1,
-1.239069, 0.6887967, 0.8294641, 1, 0, 0, 1, 1,
-1.237453, 1.968731, -0.3477705, 1, 0, 0, 1, 1,
-1.228994, 2.447222, -0.7137415, 1, 0, 0, 1, 1,
-1.228457, -0.6446294, -1.123961, 0, 0, 0, 1, 1,
-1.224296, -0.3037509, -2.696641, 0, 0, 0, 1, 1,
-1.221966, -0.5068012, -0.4643904, 0, 0, 0, 1, 1,
-1.221698, -0.4109085, -0.1513716, 0, 0, 0, 1, 1,
-1.219293, 1.035811, -0.4264005, 0, 0, 0, 1, 1,
-1.215707, -0.6548476, -1.589928, 0, 0, 0, 1, 1,
-1.210807, -0.9900921, -1.569366, 0, 0, 0, 1, 1,
-1.208526, 1.345253, -0.9218575, 1, 1, 1, 1, 1,
-1.207096, -1.094307, -0.4913953, 1, 1, 1, 1, 1,
-1.202976, 0.7501733, -1.553995, 1, 1, 1, 1, 1,
-1.191204, 0.9988636, -1.181455, 1, 1, 1, 1, 1,
-1.190189, -0.07417444, -0.8010074, 1, 1, 1, 1, 1,
-1.189615, 0.7168132, -0.8948882, 1, 1, 1, 1, 1,
-1.188504, -0.2560176, -1.325627, 1, 1, 1, 1, 1,
-1.186827, -0.5903616, -2.907072, 1, 1, 1, 1, 1,
-1.178381, -0.1703559, -3.532531, 1, 1, 1, 1, 1,
-1.176968, -0.8801227, -2.466725, 1, 1, 1, 1, 1,
-1.166108, 0.8494028, -1.037634, 1, 1, 1, 1, 1,
-1.163377, 0.6525608, -1.970987, 1, 1, 1, 1, 1,
-1.158825, -0.8094986, -1.536224, 1, 1, 1, 1, 1,
-1.148593, -0.983595, -1.458029, 1, 1, 1, 1, 1,
-1.140518, -0.972868, -1.765591, 1, 1, 1, 1, 1,
-1.139152, -1.523858, -4.021183, 0, 0, 1, 1, 1,
-1.136018, -0.1270199, -1.953616, 1, 0, 0, 1, 1,
-1.115981, -1.089789, -1.484336, 1, 0, 0, 1, 1,
-1.114993, 0.8353907, -1.290352, 1, 0, 0, 1, 1,
-1.114604, 0.9536796, -0.5430502, 1, 0, 0, 1, 1,
-1.113796, 0.3193191, -0.9812933, 1, 0, 0, 1, 1,
-1.112728, -0.2252506, -3.02709, 0, 0, 0, 1, 1,
-1.109398, 1.777724, -1.169534, 0, 0, 0, 1, 1,
-1.107852, 1.288028, -0.8061541, 0, 0, 0, 1, 1,
-1.10572, -0.3801588, -3.173765, 0, 0, 0, 1, 1,
-1.097801, 2.180377, 0.04096158, 0, 0, 0, 1, 1,
-1.094208, 0.0007161781, -2.140033, 0, 0, 0, 1, 1,
-1.093867, 1.010306, -1.32033, 0, 0, 0, 1, 1,
-1.091354, 0.1310533, -0.5534083, 1, 1, 1, 1, 1,
-1.083802, 0.07179764, -3.353076, 1, 1, 1, 1, 1,
-1.081844, 0.1577723, -2.230099, 1, 1, 1, 1, 1,
-1.077493, -1.234774, -2.063746, 1, 1, 1, 1, 1,
-1.074844, 1.628619, -1.576496, 1, 1, 1, 1, 1,
-1.069486, 1.348523, 0.09859963, 1, 1, 1, 1, 1,
-1.069226, -0.8355378, -2.440334, 1, 1, 1, 1, 1,
-1.068889, -0.3872637, -0.4515741, 1, 1, 1, 1, 1,
-1.065839, 1.518772, -1.532479, 1, 1, 1, 1, 1,
-1.062605, 1.66867, 0.5214087, 1, 1, 1, 1, 1,
-1.059445, 0.975055, -0.04149979, 1, 1, 1, 1, 1,
-1.057011, -1.779005, -2.143348, 1, 1, 1, 1, 1,
-1.053503, 0.7023982, -1.233616, 1, 1, 1, 1, 1,
-1.047895, -1.513077, -1.447187, 1, 1, 1, 1, 1,
-1.043875, -1.42302, -3.07903, 1, 1, 1, 1, 1,
-1.037793, -1.307341, -2.337966, 0, 0, 1, 1, 1,
-1.037785, 1.510007, -1.802046, 1, 0, 0, 1, 1,
-1.03423, 1.605939, -1.506284, 1, 0, 0, 1, 1,
-1.033172, 2.345214, 0.5856351, 1, 0, 0, 1, 1,
-1.032443, 0.5754876, -1.896631, 1, 0, 0, 1, 1,
-1.032396, 1.168048, -2.478502, 1, 0, 0, 1, 1,
-1.029028, 1.605739, -1.522182, 0, 0, 0, 1, 1,
-1.028942, 0.7108213, -0.7401126, 0, 0, 0, 1, 1,
-1.027385, -1.579752, -2.268208, 0, 0, 0, 1, 1,
-1.013021, 1.495603, -0.08090797, 0, 0, 0, 1, 1,
-1.011762, 1.072583, 0.182652, 0, 0, 0, 1, 1,
-1.011691, -1.171109, -3.896819, 0, 0, 0, 1, 1,
-1.008704, -0.5087175, -2.919251, 0, 0, 0, 1, 1,
-1.008436, -0.231655, -1.404005, 1, 1, 1, 1, 1,
-1.006545, 0.4824964, -1.036696, 1, 1, 1, 1, 1,
-1.005864, 0.3561507, 0.114989, 1, 1, 1, 1, 1,
-1.002209, -1.301964, -1.844467, 1, 1, 1, 1, 1,
-0.9973739, 1.411834, 2.090962, 1, 1, 1, 1, 1,
-0.9915808, 0.7288143, -0.714246, 1, 1, 1, 1, 1,
-0.9900291, -1.643616, -2.534507, 1, 1, 1, 1, 1,
-0.9859483, -0.4606763, -3.535134, 1, 1, 1, 1, 1,
-0.9765663, -0.1603196, -1.438765, 1, 1, 1, 1, 1,
-0.9759668, -1.05984, -1.186808, 1, 1, 1, 1, 1,
-0.972277, 0.755529, -0.9738738, 1, 1, 1, 1, 1,
-0.9646735, 0.2742186, -2.237087, 1, 1, 1, 1, 1,
-0.9605642, 0.7507307, -2.709659, 1, 1, 1, 1, 1,
-0.9493853, -0.4745568, -1.833786, 1, 1, 1, 1, 1,
-0.9483247, -0.2877159, -3.01771, 1, 1, 1, 1, 1,
-0.941617, 0.6725169, -2.039387, 0, 0, 1, 1, 1,
-0.9378706, -1.209177, -4.696946, 1, 0, 0, 1, 1,
-0.9338194, 2.900896, -1.558627, 1, 0, 0, 1, 1,
-0.9312067, -0.8275562, -3.059867, 1, 0, 0, 1, 1,
-0.9299745, 0.5206396, -2.466699, 1, 0, 0, 1, 1,
-0.9269114, 0.6972205, -2.453279, 1, 0, 0, 1, 1,
-0.9186965, -0.5170388, -2.775458, 0, 0, 0, 1, 1,
-0.9168919, -0.9703979, -1.581532, 0, 0, 0, 1, 1,
-0.9122706, 1.251352, -1.633714, 0, 0, 0, 1, 1,
-0.9086511, 1.022368, -2.137022, 0, 0, 0, 1, 1,
-0.9043001, -0.502928, -0.5348882, 0, 0, 0, 1, 1,
-0.8980551, 0.2871647, -0.7126544, 0, 0, 0, 1, 1,
-0.8892963, 1.331217, -2.766045, 0, 0, 0, 1, 1,
-0.8860758, 0.016489, -2.635455, 1, 1, 1, 1, 1,
-0.8762025, 0.1571019, -1.322481, 1, 1, 1, 1, 1,
-0.8760363, 1.237515, -2.524951, 1, 1, 1, 1, 1,
-0.8750743, 1.206659, 0.01682495, 1, 1, 1, 1, 1,
-0.8736812, -0.06218213, -2.641566, 1, 1, 1, 1, 1,
-0.8710782, 0.1878671, -2.725795, 1, 1, 1, 1, 1,
-0.8625472, 0.7172292, -1.726568, 1, 1, 1, 1, 1,
-0.8622464, -0.08167597, 0.1726608, 1, 1, 1, 1, 1,
-0.8540013, -0.1225811, -0.6305172, 1, 1, 1, 1, 1,
-0.8531027, 0.8142781, 0.3765461, 1, 1, 1, 1, 1,
-0.8485873, -0.9888883, -2.745769, 1, 1, 1, 1, 1,
-0.8460146, -0.6647573, -2.745163, 1, 1, 1, 1, 1,
-0.8448535, 1.167045, 0.5960585, 1, 1, 1, 1, 1,
-0.8415076, 1.920931, 1.239892, 1, 1, 1, 1, 1,
-0.8386351, 2.368319, -1.206736, 1, 1, 1, 1, 1,
-0.8342326, -0.4994898, -3.629872, 0, 0, 1, 1, 1,
-0.8297397, 0.1438655, -1.689884, 1, 0, 0, 1, 1,
-0.8263986, 1.592446, -1.918584, 1, 0, 0, 1, 1,
-0.8251109, -0.4323089, -2.4771, 1, 0, 0, 1, 1,
-0.8210062, -0.4407642, -2.727677, 1, 0, 0, 1, 1,
-0.8132588, 0.530987, -0.644944, 1, 0, 0, 1, 1,
-0.8117936, 1.229599, -0.9128504, 0, 0, 0, 1, 1,
-0.7991548, 0.1756929, 0.5458927, 0, 0, 0, 1, 1,
-0.7853204, -0.9350594, -1.931644, 0, 0, 0, 1, 1,
-0.7784588, -0.1567443, -2.681319, 0, 0, 0, 1, 1,
-0.7691731, -0.2080844, -4.089314, 0, 0, 0, 1, 1,
-0.7671152, -0.3694898, -1.563552, 0, 0, 0, 1, 1,
-0.7588938, 1.133621, -0.2623419, 0, 0, 0, 1, 1,
-0.7578717, 0.4088274, -0.7804205, 1, 1, 1, 1, 1,
-0.7398804, 0.07766391, -3.496525, 1, 1, 1, 1, 1,
-0.736592, 1.011268, 0.0787287, 1, 1, 1, 1, 1,
-0.732587, 2.100052, 0.8003393, 1, 1, 1, 1, 1,
-0.731194, -0.1402941, -2.626419, 1, 1, 1, 1, 1,
-0.7289078, -1.373809, -1.820972, 1, 1, 1, 1, 1,
-0.7258806, -2.192814, -3.68339, 1, 1, 1, 1, 1,
-0.7219837, -1.629864, -4.034853, 1, 1, 1, 1, 1,
-0.7207406, 0.8174456, -0.6955417, 1, 1, 1, 1, 1,
-0.7202067, 0.2076086, -2.654391, 1, 1, 1, 1, 1,
-0.7202058, -0.1295925, -1.964357, 1, 1, 1, 1, 1,
-0.7196739, 0.2185988, -2.047059, 1, 1, 1, 1, 1,
-0.7144532, 2.841466, -0.08054585, 1, 1, 1, 1, 1,
-0.7142233, -0.3791651, -1.627005, 1, 1, 1, 1, 1,
-0.7101949, -2.200002, -1.376445, 1, 1, 1, 1, 1,
-0.7094458, 0.2988383, -0.3934605, 0, 0, 1, 1, 1,
-0.7070089, -2.288295, -3.406954, 1, 0, 0, 1, 1,
-0.7056168, -0.9214759, -0.9109194, 1, 0, 0, 1, 1,
-0.700804, -0.3691379, -3.331894, 1, 0, 0, 1, 1,
-0.6986609, -0.903955, -3.870894, 1, 0, 0, 1, 1,
-0.6970853, -0.7518192, -1.956853, 1, 0, 0, 1, 1,
-0.6955312, 0.6833838, 1.424562, 0, 0, 0, 1, 1,
-0.6940101, -0.7616777, -2.72775, 0, 0, 0, 1, 1,
-0.6910384, -0.720042, -2.722518, 0, 0, 0, 1, 1,
-0.6881958, -0.2909323, -3.910258, 0, 0, 0, 1, 1,
-0.6857185, -2.607447, -4.334766, 0, 0, 0, 1, 1,
-0.6852381, 0.2721938, -2.31386, 0, 0, 0, 1, 1,
-0.6814082, 0.1506428, 1.362919, 0, 0, 0, 1, 1,
-0.6667685, 0.4832906, 1.496176, 1, 1, 1, 1, 1,
-0.6664124, 1.489842, -1.346881, 1, 1, 1, 1, 1,
-0.6628887, 1.074212, -0.4743166, 1, 1, 1, 1, 1,
-0.6589218, -0.1200411, -1.851235, 1, 1, 1, 1, 1,
-0.6559672, -0.5350901, -3.738218, 1, 1, 1, 1, 1,
-0.6524791, 1.024421, -2.678493, 1, 1, 1, 1, 1,
-0.6513418, 0.3694031, -0.4751683, 1, 1, 1, 1, 1,
-0.6512856, -0.5893458, -0.1593841, 1, 1, 1, 1, 1,
-0.6501771, -0.704877, -1.72659, 1, 1, 1, 1, 1,
-0.649445, -0.3085617, -0.6044131, 1, 1, 1, 1, 1,
-0.6488997, 0.2534069, -0.02460053, 1, 1, 1, 1, 1,
-0.645936, 2.491838, -0.01437315, 1, 1, 1, 1, 1,
-0.6428148, 0.5310716, -0.3644564, 1, 1, 1, 1, 1,
-0.6405903, 0.05361307, 0.03714086, 1, 1, 1, 1, 1,
-0.6355025, -1.911147, -3.331074, 1, 1, 1, 1, 1,
-0.6350525, 0.6398221, -1.189983, 0, 0, 1, 1, 1,
-0.6337395, 0.4583296, -0.4943503, 1, 0, 0, 1, 1,
-0.6332505, 0.6220275, -1.975348, 1, 0, 0, 1, 1,
-0.6327818, -0.4168171, -3.040262, 1, 0, 0, 1, 1,
-0.6233721, -1.450367, -2.566475, 1, 0, 0, 1, 1,
-0.6193913, 0.1320815, -1.054281, 1, 0, 0, 1, 1,
-0.618724, -0.1135527, -0.8832842, 0, 0, 0, 1, 1,
-0.6130222, -0.02462596, -2.499474, 0, 0, 0, 1, 1,
-0.6127604, 1.554133, 0.5272628, 0, 0, 0, 1, 1,
-0.6125117, -1.149919, -0.5725469, 0, 0, 0, 1, 1,
-0.6105986, -0.0776661, -1.720374, 0, 0, 0, 1, 1,
-0.6098948, -1.67305, -4.793012, 0, 0, 0, 1, 1,
-0.608099, 0.1688177, -3.00152, 0, 0, 0, 1, 1,
-0.6024977, -0.2452209, -2.145634, 1, 1, 1, 1, 1,
-0.6022175, -0.2001005, -2.589386, 1, 1, 1, 1, 1,
-0.5982218, -1.755555, -3.972452, 1, 1, 1, 1, 1,
-0.5970711, 1.914524, -0.1991731, 1, 1, 1, 1, 1,
-0.5946776, 1.067303, -0.4806437, 1, 1, 1, 1, 1,
-0.5943859, -0.2183514, -2.230248, 1, 1, 1, 1, 1,
-0.5924715, 1.426947, 0.407149, 1, 1, 1, 1, 1,
-0.5895656, -0.4055656, 0.9460652, 1, 1, 1, 1, 1,
-0.5758945, 0.7769822, -0.7646208, 1, 1, 1, 1, 1,
-0.5749994, -0.04577389, -1.104782, 1, 1, 1, 1, 1,
-0.5720255, -1.819682, -3.104201, 1, 1, 1, 1, 1,
-0.5700611, -1.418856, -1.341658, 1, 1, 1, 1, 1,
-0.5618545, 0.4982371, -1.073129, 1, 1, 1, 1, 1,
-0.5606162, -1.293866, -1.633356, 1, 1, 1, 1, 1,
-0.555522, -0.3916753, -0.9231371, 1, 1, 1, 1, 1,
-0.5542445, -1.363251, -2.448372, 0, 0, 1, 1, 1,
-0.5437048, 0.1510115, -1.950781, 1, 0, 0, 1, 1,
-0.5432143, 0.4305766, -0.918756, 1, 0, 0, 1, 1,
-0.5404312, -1.695978, -0.6470255, 1, 0, 0, 1, 1,
-0.5370427, -1.307393, -3.310641, 1, 0, 0, 1, 1,
-0.5368217, -1.060575, -1.792933, 1, 0, 0, 1, 1,
-0.5346048, -0.7611526, -2.147767, 0, 0, 0, 1, 1,
-0.5286982, 0.3406478, -2.047475, 0, 0, 0, 1, 1,
-0.5273031, -0.7076777, -3.242166, 0, 0, 0, 1, 1,
-0.5234025, 1.645253, -1.087196, 0, 0, 0, 1, 1,
-0.5212857, -0.008687861, -1.099664, 0, 0, 0, 1, 1,
-0.5179806, -0.5390223, -2.937947, 0, 0, 0, 1, 1,
-0.517451, -0.2719261, -1.263537, 0, 0, 0, 1, 1,
-0.5159013, -0.5132403, -2.380365, 1, 1, 1, 1, 1,
-0.5134088, -0.7194585, -3.304829, 1, 1, 1, 1, 1,
-0.5074704, -0.3737085, -1.085765, 1, 1, 1, 1, 1,
-0.5051641, 0.4541023, -1.377277, 1, 1, 1, 1, 1,
-0.5049328, -0.3988379, -2.036136, 1, 1, 1, 1, 1,
-0.5001693, 0.9793432, 0.5633359, 1, 1, 1, 1, 1,
-0.4945905, 1.393471, -0.3370713, 1, 1, 1, 1, 1,
-0.4941723, -0.4577418, -3.166817, 1, 1, 1, 1, 1,
-0.4912853, 0.03377298, -2.130356, 1, 1, 1, 1, 1,
-0.4899157, -0.4957812, -1.881939, 1, 1, 1, 1, 1,
-0.484679, -0.1513217, -2.070973, 1, 1, 1, 1, 1,
-0.483642, -1.291775, -5.373691, 1, 1, 1, 1, 1,
-0.4825696, 0.1355336, 1.093656, 1, 1, 1, 1, 1,
-0.4783508, -2.292639, -2.010864, 1, 1, 1, 1, 1,
-0.4756239, 0.5822176, -0.3570979, 1, 1, 1, 1, 1,
-0.4754901, 0.4043594, -2.255393, 0, 0, 1, 1, 1,
-0.4713349, -0.3818527, -2.026874, 1, 0, 0, 1, 1,
-0.4677365, 1.443589, -1.011023, 1, 0, 0, 1, 1,
-0.4659455, -0.0842986, -3.096806, 1, 0, 0, 1, 1,
-0.4595672, 0.7385461, -1.359693, 1, 0, 0, 1, 1,
-0.4586273, 0.82508, 0.5408992, 1, 0, 0, 1, 1,
-0.4537905, -1.740224, -2.145787, 0, 0, 0, 1, 1,
-0.4495231, 0.7635152, -0.9103902, 0, 0, 0, 1, 1,
-0.4483189, -1.582651, -1.797514, 0, 0, 0, 1, 1,
-0.4473816, 0.7257785, -0.5381492, 0, 0, 0, 1, 1,
-0.4450269, 0.6427129, -0.8835188, 0, 0, 0, 1, 1,
-0.4446932, 0.6618133, -1.557889, 0, 0, 0, 1, 1,
-0.4444372, 0.6516044, 1.22505, 0, 0, 0, 1, 1,
-0.4423195, -0.484635, -2.157842, 1, 1, 1, 1, 1,
-0.4415668, 0.3716225, -0.4075248, 1, 1, 1, 1, 1,
-0.4411729, -1.183075, -2.875515, 1, 1, 1, 1, 1,
-0.4411064, -0.0675155, -3.666606, 1, 1, 1, 1, 1,
-0.4391531, -0.6548812, -1.202798, 1, 1, 1, 1, 1,
-0.4389024, -0.3689039, -3.365467, 1, 1, 1, 1, 1,
-0.4388167, -0.03644554, -1.236428, 1, 1, 1, 1, 1,
-0.4382792, -0.4593826, -2.016778, 1, 1, 1, 1, 1,
-0.4326935, -0.4888137, -3.084092, 1, 1, 1, 1, 1,
-0.4243702, -1.017255, -2.949021, 1, 1, 1, 1, 1,
-0.4211346, -0.9583747, -1.375947, 1, 1, 1, 1, 1,
-0.4129325, -0.6176484, -1.638617, 1, 1, 1, 1, 1,
-0.4104743, 0.8302823, -0.883921, 1, 1, 1, 1, 1,
-0.4055246, 0.8081325, -0.2537562, 1, 1, 1, 1, 1,
-0.4040981, -0.159131, -0.888119, 1, 1, 1, 1, 1,
-0.4040221, -0.006808237, -2.369325, 0, 0, 1, 1, 1,
-0.4038389, -1.291144, -2.478309, 1, 0, 0, 1, 1,
-0.4006881, -0.6997303, -3.021434, 1, 0, 0, 1, 1,
-0.3979137, -1.19058, -1.990143, 1, 0, 0, 1, 1,
-0.3920779, -0.2151183, -1.839425, 1, 0, 0, 1, 1,
-0.3900578, -0.6674943, -2.539259, 1, 0, 0, 1, 1,
-0.390036, -1.062788, -2.181507, 0, 0, 0, 1, 1,
-0.3877091, -1.864712, -1.484719, 0, 0, 0, 1, 1,
-0.3873481, 0.1138486, -1.081266, 0, 0, 0, 1, 1,
-0.3873325, -0.02805143, -2.65141, 0, 0, 0, 1, 1,
-0.3869546, -0.9828219, -2.714731, 0, 0, 0, 1, 1,
-0.3863079, -0.2758656, -4.003588, 0, 0, 0, 1, 1,
-0.3837051, -0.2856162, -2.681286, 0, 0, 0, 1, 1,
-0.3833199, -0.08115196, -2.234108, 1, 1, 1, 1, 1,
-0.376139, -0.03489024, -2.727067, 1, 1, 1, 1, 1,
-0.3755055, -2.185349, -4.853174, 1, 1, 1, 1, 1,
-0.3672958, 0.1723695, -1.405499, 1, 1, 1, 1, 1,
-0.3662789, -1.942393, -2.574999, 1, 1, 1, 1, 1,
-0.362139, 0.9835839, -1.359301, 1, 1, 1, 1, 1,
-0.3574024, 1.76424, -0.7936949, 1, 1, 1, 1, 1,
-0.3567272, -0.7390818, -3.335211, 1, 1, 1, 1, 1,
-0.352997, -1.267815, -0.6765632, 1, 1, 1, 1, 1,
-0.3507579, -0.8289831, -3.249384, 1, 1, 1, 1, 1,
-0.3506916, 0.8451918, 0.1206596, 1, 1, 1, 1, 1,
-0.3469844, 0.5832921, -0.9086533, 1, 1, 1, 1, 1,
-0.3466197, 0.9335247, -0.05640284, 1, 1, 1, 1, 1,
-0.3457024, 1.33894, 1.176676, 1, 1, 1, 1, 1,
-0.3427654, -0.6905459, -3.569, 1, 1, 1, 1, 1,
-0.3401167, -1.959966, -3.140753, 0, 0, 1, 1, 1,
-0.3396959, -0.02825113, -2.218802, 1, 0, 0, 1, 1,
-0.3383601, 0.1294394, -2.465163, 1, 0, 0, 1, 1,
-0.3316256, -1.343108, -2.694203, 1, 0, 0, 1, 1,
-0.3260892, -1.558624, -2.092569, 1, 0, 0, 1, 1,
-0.3176875, 0.04161732, -3.747687, 1, 0, 0, 1, 1,
-0.3154338, 0.06761674, -1.264923, 0, 0, 0, 1, 1,
-0.311671, -1.232536, -3.88464, 0, 0, 0, 1, 1,
-0.3061431, 0.02929738, -1.349873, 0, 0, 0, 1, 1,
-0.3004712, -0.5765179, -3.364034, 0, 0, 0, 1, 1,
-0.2985495, -1.707728, -1.872853, 0, 0, 0, 1, 1,
-0.2935173, -1.323102, -3.44118, 0, 0, 0, 1, 1,
-0.2908408, -0.02076405, -2.466561, 0, 0, 0, 1, 1,
-0.2903231, -0.9685435, -1.021508, 1, 1, 1, 1, 1,
-0.2884641, -1.227264, -3.364558, 1, 1, 1, 1, 1,
-0.2883877, -0.6613395, -3.075526, 1, 1, 1, 1, 1,
-0.2878373, 0.3261985, -1.028838, 1, 1, 1, 1, 1,
-0.2875087, -1.315623, -3.576792, 1, 1, 1, 1, 1,
-0.286251, 0.7074289, 0.4695024, 1, 1, 1, 1, 1,
-0.2839032, -0.1022396, -1.640284, 1, 1, 1, 1, 1,
-0.2828165, -0.7999419, -2.604072, 1, 1, 1, 1, 1,
-0.2757663, 1.039233, -0.6147801, 1, 1, 1, 1, 1,
-0.2739215, 1.12032, -0.9795298, 1, 1, 1, 1, 1,
-0.2737827, 0.08796065, -1.419586, 1, 1, 1, 1, 1,
-0.2733822, 0.3366819, -1.648243, 1, 1, 1, 1, 1,
-0.2714731, -1.117544, -2.326105, 1, 1, 1, 1, 1,
-0.2684497, -1.017277, -2.68458, 1, 1, 1, 1, 1,
-0.2677661, 0.6999758, 1.341427, 1, 1, 1, 1, 1,
-0.2629464, 0.7320733, -3.061274, 0, 0, 1, 1, 1,
-0.2591777, -0.8546107, -0.8518893, 1, 0, 0, 1, 1,
-0.2560125, -1.26341, -1.392326, 1, 0, 0, 1, 1,
-0.2549486, -1.403521, -1.708443, 1, 0, 0, 1, 1,
-0.2547559, -1.060327, -2.273464, 1, 0, 0, 1, 1,
-0.2545244, 1.358217, 0.298546, 1, 0, 0, 1, 1,
-0.2507686, -1.192452, -0.9103892, 0, 0, 0, 1, 1,
-0.2501693, -0.4057359, -1.623125, 0, 0, 0, 1, 1,
-0.248361, 1.899979, -1.487412, 0, 0, 0, 1, 1,
-0.2470703, 1.419028, 0.7403093, 0, 0, 0, 1, 1,
-0.2447972, -1.183696, -2.888385, 0, 0, 0, 1, 1,
-0.2431911, -0.3216131, -4.201521, 0, 0, 0, 1, 1,
-0.2391146, -0.567872, -2.598852, 0, 0, 0, 1, 1,
-0.2387275, -0.2658749, -4.043813, 1, 1, 1, 1, 1,
-0.2369441, 0.2263744, -0.597249, 1, 1, 1, 1, 1,
-0.2358487, -0.8967725, -2.933481, 1, 1, 1, 1, 1,
-0.231133, -1.20812, -2.82207, 1, 1, 1, 1, 1,
-0.2301484, 1.92804, -0.2778432, 1, 1, 1, 1, 1,
-0.2253092, 0.1882161, -0.3349334, 1, 1, 1, 1, 1,
-0.2188204, 2.323934, -0.4909927, 1, 1, 1, 1, 1,
-0.2086781, -1.026533, -2.814132, 1, 1, 1, 1, 1,
-0.2077512, -0.5363451, -2.071013, 1, 1, 1, 1, 1,
-0.2066022, -0.4682086, -1.424538, 1, 1, 1, 1, 1,
-0.206319, 1.076672, -1.12844, 1, 1, 1, 1, 1,
-0.2044072, -0.1401959, -3.369819, 1, 1, 1, 1, 1,
-0.2009877, 1.224673, -0.3491612, 1, 1, 1, 1, 1,
-0.199293, -0.2345424, -0.8949749, 1, 1, 1, 1, 1,
-0.1944648, 0.4965595, -0.9639466, 1, 1, 1, 1, 1,
-0.1931721, -1.688694, -3.061382, 0, 0, 1, 1, 1,
-0.1904338, 1.206372, -0.7999074, 1, 0, 0, 1, 1,
-0.1882479, 1.804765, -1.178652, 1, 0, 0, 1, 1,
-0.1822242, -1.1337, -3.293304, 1, 0, 0, 1, 1,
-0.1805828, 1.121932, 0.406809, 1, 0, 0, 1, 1,
-0.1784134, 0.1423802, -0.5261153, 1, 0, 0, 1, 1,
-0.1777488, 0.6955452, -0.929905, 0, 0, 0, 1, 1,
-0.1753213, 1.273875, -0.6671573, 0, 0, 0, 1, 1,
-0.1743782, -0.1718426, -2.808581, 0, 0, 0, 1, 1,
-0.1685959, -1.249463, -3.700691, 0, 0, 0, 1, 1,
-0.168591, 0.5068246, 0.638736, 0, 0, 0, 1, 1,
-0.1671635, -1.146485, -2.769887, 0, 0, 0, 1, 1,
-0.1601643, -0.6193896, -2.766382, 0, 0, 0, 1, 1,
-0.1598106, -1.387311, -3.466518, 1, 1, 1, 1, 1,
-0.1562254, 0.270069, 0.6497303, 1, 1, 1, 1, 1,
-0.1555697, 0.9240702, -0.02239832, 1, 1, 1, 1, 1,
-0.1555545, -1.266312, -3.911461, 1, 1, 1, 1, 1,
-0.1553993, -1.260868, -2.934286, 1, 1, 1, 1, 1,
-0.1551955, 0.5467392, 0.09425966, 1, 1, 1, 1, 1,
-0.1527367, -0.3594238, -2.137812, 1, 1, 1, 1, 1,
-0.1508676, -1.935031, -2.963314, 1, 1, 1, 1, 1,
-0.1508034, 0.7912861, -0.3646076, 1, 1, 1, 1, 1,
-0.1444396, -1.156042, -4.12812, 1, 1, 1, 1, 1,
-0.1426357, -0.4296385, -4.204103, 1, 1, 1, 1, 1,
-0.1406984, -0.4970162, -2.582457, 1, 1, 1, 1, 1,
-0.1403125, -0.9239391, -4.201562, 1, 1, 1, 1, 1,
-0.1399838, 0.2309659, -1.444525, 1, 1, 1, 1, 1,
-0.1392436, -0.1253666, -2.578073, 1, 1, 1, 1, 1,
-0.1354623, 1.738732, 0.8351394, 0, 0, 1, 1, 1,
-0.1336388, -0.4027708, -1.841344, 1, 0, 0, 1, 1,
-0.130621, -1.134795, -3.266595, 1, 0, 0, 1, 1,
-0.1233929, 0.1275675, -1.790203, 1, 0, 0, 1, 1,
-0.118177, 0.1824906, -1.176666, 1, 0, 0, 1, 1,
-0.1169632, -0.3841053, -2.79401, 1, 0, 0, 1, 1,
-0.1168002, -1.187195, -3.034806, 0, 0, 0, 1, 1,
-0.1161414, 0.9886277, 0.09435297, 0, 0, 0, 1, 1,
-0.1131918, -0.7134783, -2.609025, 0, 0, 0, 1, 1,
-0.10893, -1.295911, -5.000494, 0, 0, 0, 1, 1,
-0.10862, 1.351316, -1.25597, 0, 0, 0, 1, 1,
-0.1067638, 1.022689, -0.3066478, 0, 0, 0, 1, 1,
-0.1022483, -1.270337, -3.371753, 0, 0, 0, 1, 1,
-0.1016665, 0.5056938, -0.1455042, 1, 1, 1, 1, 1,
-0.09372801, -0.9333988, -1.10452, 1, 1, 1, 1, 1,
-0.09103442, -1.460066, -3.402699, 1, 1, 1, 1, 1,
-0.08960043, 0.1555388, -0.620622, 1, 1, 1, 1, 1,
-0.08936004, 0.7662041, 0.7473878, 1, 1, 1, 1, 1,
-0.08898035, -1.697467, -3.956734, 1, 1, 1, 1, 1,
-0.0860163, 0.9087977, 0.7201138, 1, 1, 1, 1, 1,
-0.08407456, 0.201788, -1.862714, 1, 1, 1, 1, 1,
-0.07856124, -0.6157609, -1.575301, 1, 1, 1, 1, 1,
-0.07388717, -0.308375, -3.974179, 1, 1, 1, 1, 1,
-0.06385886, 0.2918595, -0.1535022, 1, 1, 1, 1, 1,
-0.06185514, 0.8346441, -0.1574524, 1, 1, 1, 1, 1,
-0.06044038, 0.2351085, -0.9688611, 1, 1, 1, 1, 1,
-0.05865071, -0.2955537, -3.700918, 1, 1, 1, 1, 1,
-0.04926967, 0.0565504, 0.04966477, 1, 1, 1, 1, 1,
-0.04390465, 0.1154845, -0.6969469, 0, 0, 1, 1, 1,
-0.0408817, 0.7860927, 0.3463663, 1, 0, 0, 1, 1,
-0.04082911, -0.4037602, -1.37266, 1, 0, 0, 1, 1,
-0.03894323, -0.09883524, -2.323582, 1, 0, 0, 1, 1,
-0.034939, -0.1591749, -3.362088, 1, 0, 0, 1, 1,
-0.03491256, 0.8700396, -0.5396446, 1, 0, 0, 1, 1,
-0.03323485, -0.1213129, -2.687411, 0, 0, 0, 1, 1,
-0.02762562, -0.3679644, -4.247044, 0, 0, 0, 1, 1,
-0.02438878, 1.061228, -0.01352739, 0, 0, 0, 1, 1,
-0.02381135, -1.200091, -3.929377, 0, 0, 0, 1, 1,
-0.014114, 0.7060075, 1.037102, 0, 0, 0, 1, 1,
-0.005275948, -0.03996842, -2.034671, 0, 0, 0, 1, 1,
-0.001582872, 0.5436003, 1.386301, 0, 0, 0, 1, 1,
0.002030078, 0.4227515, -0.7245263, 1, 1, 1, 1, 1,
0.002297358, 0.4522405, 0.6322052, 1, 1, 1, 1, 1,
0.003910097, -0.1550329, 3.50653, 1, 1, 1, 1, 1,
0.005789924, -1.366366, 3.818679, 1, 1, 1, 1, 1,
0.008895595, 1.267269, -0.8137999, 1, 1, 1, 1, 1,
0.008911294, 0.8901857, 1.869215, 1, 1, 1, 1, 1,
0.0108573, -0.3647175, 4.05713, 1, 1, 1, 1, 1,
0.01120412, 0.2064298, 1.518996, 1, 1, 1, 1, 1,
0.01460979, -1.280867, 4.638102, 1, 1, 1, 1, 1,
0.01775023, -0.1519409, 3.140064, 1, 1, 1, 1, 1,
0.01788895, 0.1378983, -1.255761, 1, 1, 1, 1, 1,
0.02306423, -0.2035481, 6.242257, 1, 1, 1, 1, 1,
0.02897037, -1.580853, 3.650153, 1, 1, 1, 1, 1,
0.03475363, 0.1932752, 0.5415504, 1, 1, 1, 1, 1,
0.03653898, -0.1804644, 1.009208, 1, 1, 1, 1, 1,
0.03841364, 0.6104422, -1.889281, 0, 0, 1, 1, 1,
0.03965915, -0.09335098, 3.241316, 1, 0, 0, 1, 1,
0.04293778, 1.155648, -1.145383, 1, 0, 0, 1, 1,
0.05377854, 0.1533887, -0.7029579, 1, 0, 0, 1, 1,
0.05501191, -0.8702653, 2.54018, 1, 0, 0, 1, 1,
0.0554451, -2.238609, 2.278503, 1, 0, 0, 1, 1,
0.05756482, -1.212842, 3.18364, 0, 0, 0, 1, 1,
0.06315818, 0.4963772, 0.3645315, 0, 0, 0, 1, 1,
0.06504689, 0.8175819, 0.3877293, 0, 0, 0, 1, 1,
0.06511636, 0.9420622, 1.875368, 0, 0, 0, 1, 1,
0.06532752, -0.2456463, 3.345405, 0, 0, 0, 1, 1,
0.06562559, -0.1571525, 3.699471, 0, 0, 0, 1, 1,
0.06852627, 0.2499445, -0.9803646, 0, 0, 0, 1, 1,
0.06998866, -1.755918, 4.342051, 1, 1, 1, 1, 1,
0.07418615, 1.34926, -0.4067158, 1, 1, 1, 1, 1,
0.07627212, -0.4799113, 3.327332, 1, 1, 1, 1, 1,
0.08401554, -1.70809, 4.138252, 1, 1, 1, 1, 1,
0.08531024, -1.642861, 3.353654, 1, 1, 1, 1, 1,
0.08991565, 0.5589036, 0.5986665, 1, 1, 1, 1, 1,
0.09085766, 0.006414331, 1.644985, 1, 1, 1, 1, 1,
0.09366914, 0.5734429, -0.3617198, 1, 1, 1, 1, 1,
0.09373118, 1.086622, -0.7758744, 1, 1, 1, 1, 1,
0.09673974, -0.02701727, 1.783543, 1, 1, 1, 1, 1,
0.1007897, 0.04356267, 0.1363829, 1, 1, 1, 1, 1,
0.1009735, -0.04825645, 3.186151, 1, 1, 1, 1, 1,
0.1063219, 1.930873, 1.550775, 1, 1, 1, 1, 1,
0.1112134, 1.137252, 1.663022, 1, 1, 1, 1, 1,
0.1129164, 0.3411123, 1.422393, 1, 1, 1, 1, 1,
0.1133882, 0.7594718, 0.1137887, 0, 0, 1, 1, 1,
0.1138994, 1.772616, -1.090756, 1, 0, 0, 1, 1,
0.1153547, 0.1577437, 2.461209, 1, 0, 0, 1, 1,
0.1175218, -0.3737516, 2.335515, 1, 0, 0, 1, 1,
0.1186816, 0.6802539, 0.7529272, 1, 0, 0, 1, 1,
0.1298048, -0.7332867, 1.877927, 1, 0, 0, 1, 1,
0.1339374, -1.752157, 3.299984, 0, 0, 0, 1, 1,
0.1347022, -0.3029709, 2.065855, 0, 0, 0, 1, 1,
0.1379795, 0.3774936, -0.763804, 0, 0, 0, 1, 1,
0.1400869, 1.927958, -0.3251057, 0, 0, 0, 1, 1,
0.1408496, 1.754333, 0.5826323, 0, 0, 0, 1, 1,
0.14302, -1.383437, 3.178064, 0, 0, 0, 1, 1,
0.1463727, -0.03038908, 1.470035, 0, 0, 0, 1, 1,
0.1539874, -0.5707037, 3.531582, 1, 1, 1, 1, 1,
0.1570029, 0.4658418, -0.4146936, 1, 1, 1, 1, 1,
0.1582509, 0.6178226, -1.229398, 1, 1, 1, 1, 1,
0.1589853, 0.879214, -0.4539082, 1, 1, 1, 1, 1,
0.1599807, -1.579872, 0.1421015, 1, 1, 1, 1, 1,
0.1612531, 0.3227133, 0.1385335, 1, 1, 1, 1, 1,
0.1629103, -0.485035, 2.080787, 1, 1, 1, 1, 1,
0.1644632, -1.729277, 2.39672, 1, 1, 1, 1, 1,
0.1650502, 0.1062373, 0.905163, 1, 1, 1, 1, 1,
0.1652296, 0.3976561, 1.644771, 1, 1, 1, 1, 1,
0.1670837, 0.05034227, -0.4368349, 1, 1, 1, 1, 1,
0.168597, -1.063759, 2.350437, 1, 1, 1, 1, 1,
0.1700843, -0.7655174, 4.272112, 1, 1, 1, 1, 1,
0.1754172, 1.682972, 0.3376217, 1, 1, 1, 1, 1,
0.1755471, 0.003614889, 2.009247, 1, 1, 1, 1, 1,
0.1766326, -0.1509648, 2.355497, 0, 0, 1, 1, 1,
0.1771732, -1.606252, 3.69126, 1, 0, 0, 1, 1,
0.1781137, 0.9075594, 0.9189159, 1, 0, 0, 1, 1,
0.181639, 0.1355928, 0.9736058, 1, 0, 0, 1, 1,
0.1850609, 0.6591299, -1.758633, 1, 0, 0, 1, 1,
0.1850649, 0.2830433, 1.229321, 1, 0, 0, 1, 1,
0.1886182, -0.1304939, 1.803946, 0, 0, 0, 1, 1,
0.1887266, 0.4570964, -0.2428276, 0, 0, 0, 1, 1,
0.1907437, -1.031263, 2.425376, 0, 0, 0, 1, 1,
0.1924071, 0.1175758, 0.09448025, 0, 0, 0, 1, 1,
0.1971173, 0.569094, 1.757738, 0, 0, 0, 1, 1,
0.1981665, -0.3955309, 3.189715, 0, 0, 0, 1, 1,
0.2026532, -0.6900265, 1.943163, 0, 0, 0, 1, 1,
0.2031447, -1.005653, 2.025379, 1, 1, 1, 1, 1,
0.2045224, -1.589998, 3.745944, 1, 1, 1, 1, 1,
0.2048461, -2.269313, 2.24345, 1, 1, 1, 1, 1,
0.2053012, 0.1956737, 0.06164869, 1, 1, 1, 1, 1,
0.2088444, 0.1728752, 2.06671, 1, 1, 1, 1, 1,
0.2098785, 0.7971901, -1.289956, 1, 1, 1, 1, 1,
0.2118877, 1.017848, 0.6605544, 1, 1, 1, 1, 1,
0.2135808, 0.02927931, 1.750132, 1, 1, 1, 1, 1,
0.2153374, -2.283116, 3.30644, 1, 1, 1, 1, 1,
0.2163877, 1.56785, -1.070076, 1, 1, 1, 1, 1,
0.2169631, -1.621972, 3.240823, 1, 1, 1, 1, 1,
0.221325, 0.8922824, 1.052392, 1, 1, 1, 1, 1,
0.2257024, -0.4308951, 3.072967, 1, 1, 1, 1, 1,
0.2264255, -0.7903613, 3.563643, 1, 1, 1, 1, 1,
0.2266161, -1.014043, 1.347139, 1, 1, 1, 1, 1,
0.2324793, 1.533734, 2.489143, 0, 0, 1, 1, 1,
0.2428827, 1.60702, -2.057913, 1, 0, 0, 1, 1,
0.246517, 2.073209, 0.07615294, 1, 0, 0, 1, 1,
0.2511592, -1.519298, 4.169228, 1, 0, 0, 1, 1,
0.2516741, -0.237231, 2.150204, 1, 0, 0, 1, 1,
0.2536285, -0.5574402, 1.265173, 1, 0, 0, 1, 1,
0.2609689, 1.874207, 0.6990277, 0, 0, 0, 1, 1,
0.2665676, 1.010458, -0.5231504, 0, 0, 0, 1, 1,
0.2746699, -1.437832, 2.457239, 0, 0, 0, 1, 1,
0.2831203, 0.1758467, 1.589111, 0, 0, 0, 1, 1,
0.2842778, 1.044579, -1.411592, 0, 0, 0, 1, 1,
0.2859719, -1.834691, 3.72379, 0, 0, 0, 1, 1,
0.2872604, -0.8552517, 3.700844, 0, 0, 0, 1, 1,
0.2889574, -1.79932, 2.943707, 1, 1, 1, 1, 1,
0.2896197, 0.4978995, 1.377622, 1, 1, 1, 1, 1,
0.289637, 0.04787956, 1.639102, 1, 1, 1, 1, 1,
0.2928925, 0.9658527, 0.230321, 1, 1, 1, 1, 1,
0.2942494, -0.12957, 2.749962, 1, 1, 1, 1, 1,
0.2946465, 1.525233, -0.1169157, 1, 1, 1, 1, 1,
0.2968176, 0.8289667, -0.6889002, 1, 1, 1, 1, 1,
0.3032904, 0.3268777, -0.03973011, 1, 1, 1, 1, 1,
0.3041959, 0.3458456, 0.8507761, 1, 1, 1, 1, 1,
0.3047878, 0.09968006, 0.848409, 1, 1, 1, 1, 1,
0.3060341, 0.2185188, 0.9941159, 1, 1, 1, 1, 1,
0.3086532, 0.7027242, 1.363834, 1, 1, 1, 1, 1,
0.3097989, 1.205396, -0.2765695, 1, 1, 1, 1, 1,
0.3098384, -1.201542, 1.3537, 1, 1, 1, 1, 1,
0.3124557, -0.6602755, 2.134763, 1, 1, 1, 1, 1,
0.3126693, 0.5520803, -0.1869441, 0, 0, 1, 1, 1,
0.313427, 0.09050147, -0.326253, 1, 0, 0, 1, 1,
0.3207411, -0.4022674, 1.210536, 1, 0, 0, 1, 1,
0.3261208, 1.509183, -0.2129729, 1, 0, 0, 1, 1,
0.3408034, -0.4743112, 2.170382, 1, 0, 0, 1, 1,
0.3432069, 0.3502627, -0.3559008, 1, 0, 0, 1, 1,
0.3467393, 1.004861, -0.4527814, 0, 0, 0, 1, 1,
0.3485537, 0.1868851, 0.7018593, 0, 0, 0, 1, 1,
0.3510079, 0.846168, 0.3985322, 0, 0, 0, 1, 1,
0.3513033, 1.194854, -0.9605361, 0, 0, 0, 1, 1,
0.3533241, 0.2149459, -0.02955583, 0, 0, 0, 1, 1,
0.3556993, -0.1813655, 0.4628236, 0, 0, 0, 1, 1,
0.3599336, -0.581606, 2.370546, 0, 0, 0, 1, 1,
0.3626329, -1.184293, 3.452093, 1, 1, 1, 1, 1,
0.3678682, -0.7319888, 3.506463, 1, 1, 1, 1, 1,
0.3686561, -1.787936, 1.839133, 1, 1, 1, 1, 1,
0.3708897, -0.7363106, 1.607035, 1, 1, 1, 1, 1,
0.3765188, -0.5520325, 1.567879, 1, 1, 1, 1, 1,
0.3767529, 1.050309, 0.8823371, 1, 1, 1, 1, 1,
0.4029096, -0.0430246, 0.7651064, 1, 1, 1, 1, 1,
0.4030494, 0.5795139, 0.3265113, 1, 1, 1, 1, 1,
0.4038131, 0.9566413, 1.223966, 1, 1, 1, 1, 1,
0.4045855, -0.1255818, 1.864778, 1, 1, 1, 1, 1,
0.4061508, -2.184992, 2.712371, 1, 1, 1, 1, 1,
0.4074672, 0.3047409, 4.183084, 1, 1, 1, 1, 1,
0.4158262, 1.266055, -1.806696, 1, 1, 1, 1, 1,
0.4166459, 0.3845993, 1.495084, 1, 1, 1, 1, 1,
0.41803, 0.4560557, 1.799116, 1, 1, 1, 1, 1,
0.4180942, -0.7889091, 2.454157, 0, 0, 1, 1, 1,
0.4254628, -1.058139, 1.261099, 1, 0, 0, 1, 1,
0.4270093, -0.5542315, 3.462225, 1, 0, 0, 1, 1,
0.4348042, -0.3239162, 2.925157, 1, 0, 0, 1, 1,
0.4438762, 0.2481722, 0.05014015, 1, 0, 0, 1, 1,
0.4443493, 0.314061, 2.609521, 1, 0, 0, 1, 1,
0.4487571, 1.219528, -0.532445, 0, 0, 0, 1, 1,
0.4502859, 0.8309589, 1.053741, 0, 0, 0, 1, 1,
0.4537844, 0.6015533, -0.2578362, 0, 0, 0, 1, 1,
0.4555862, 0.2621845, 1.686474, 0, 0, 0, 1, 1,
0.4564092, -0.6313047, 2.793967, 0, 0, 0, 1, 1,
0.456857, 1.21182, 1.219343, 0, 0, 0, 1, 1,
0.4569409, -1.101902, 3.680769, 0, 0, 0, 1, 1,
0.4572334, 0.03727655, 1.936962, 1, 1, 1, 1, 1,
0.4638182, -0.2196519, 1.682275, 1, 1, 1, 1, 1,
0.4667366, 0.2259741, 0.9580405, 1, 1, 1, 1, 1,
0.4707027, 1.540956, 0.02547046, 1, 1, 1, 1, 1,
0.4751643, -0.1571446, 1.258988, 1, 1, 1, 1, 1,
0.4769757, 0.8566793, 2.579857, 1, 1, 1, 1, 1,
0.4801001, -0.01025499, 2.663808, 1, 1, 1, 1, 1,
0.4860046, -1.213146, 2.749269, 1, 1, 1, 1, 1,
0.4865737, -0.5232925, 2.506751, 1, 1, 1, 1, 1,
0.4881989, -0.8915364, 2.419594, 1, 1, 1, 1, 1,
0.49324, -1.592018, 3.120842, 1, 1, 1, 1, 1,
0.4973555, -1.372351, 0.7293868, 1, 1, 1, 1, 1,
0.502718, -0.4554733, 1.691797, 1, 1, 1, 1, 1,
0.5032138, -0.9702839, 2.584829, 1, 1, 1, 1, 1,
0.5162667, 0.1254459, 1.216226, 1, 1, 1, 1, 1,
0.5180202, 0.8298255, -0.6038219, 0, 0, 1, 1, 1,
0.520447, 0.003870359, 2.744315, 1, 0, 0, 1, 1,
0.5325876, -2.600113, 3.220095, 1, 0, 0, 1, 1,
0.5330319, -0.7738465, 2.591344, 1, 0, 0, 1, 1,
0.533348, -0.7917495, 2.068128, 1, 0, 0, 1, 1,
0.5339206, -0.9713343, 3.123852, 1, 0, 0, 1, 1,
0.5361043, 0.8544509, 0.4000434, 0, 0, 0, 1, 1,
0.5386237, -2.463428, 2.553663, 0, 0, 0, 1, 1,
0.5450073, 0.6190648, -1.034752, 0, 0, 0, 1, 1,
0.5475918, 1.138495, 0.8789118, 0, 0, 0, 1, 1,
0.5490077, 0.1318051, 2.118436, 0, 0, 0, 1, 1,
0.5504004, 0.663197, 1.57625, 0, 0, 0, 1, 1,
0.5560315, 0.05727835, 2.715545, 0, 0, 0, 1, 1,
0.5605111, 2.060478, -0.1225684, 1, 1, 1, 1, 1,
0.5607606, 0.652591, 0.3372359, 1, 1, 1, 1, 1,
0.5664616, -0.3389035, 0.9444448, 1, 1, 1, 1, 1,
0.5694737, 1.089282, -0.6451566, 1, 1, 1, 1, 1,
0.5697479, 0.6196201, 1.296511, 1, 1, 1, 1, 1,
0.5733503, -0.2430882, 2.157222, 1, 1, 1, 1, 1,
0.5751568, 0.5872397, 2.928268, 1, 1, 1, 1, 1,
0.5752866, -0.7220173, 2.693418, 1, 1, 1, 1, 1,
0.5822497, -0.3374889, 2.837022, 1, 1, 1, 1, 1,
0.5835047, 0.4581164, 0.4683029, 1, 1, 1, 1, 1,
0.585305, -0.3129453, 0.6337782, 1, 1, 1, 1, 1,
0.5896802, -0.698976, 1.679967, 1, 1, 1, 1, 1,
0.5933937, -0.309151, 1.972316, 1, 1, 1, 1, 1,
0.5963778, -0.6250502, 1.684247, 1, 1, 1, 1, 1,
0.6015582, 1.103101, 0.7567474, 1, 1, 1, 1, 1,
0.603599, -0.8670778, 1.390523, 0, 0, 1, 1, 1,
0.6046798, -0.6719856, 3.841852, 1, 0, 0, 1, 1,
0.608083, 1.081184, 1.561455, 1, 0, 0, 1, 1,
0.6120254, -0.08285532, 0.7276239, 1, 0, 0, 1, 1,
0.6134974, -0.3194085, 2.997159, 1, 0, 0, 1, 1,
0.616897, 1.097039, 0.4897772, 1, 0, 0, 1, 1,
0.6185483, 1.599867, 1.211043, 0, 0, 0, 1, 1,
0.6193253, 0.3555009, 1.580103, 0, 0, 0, 1, 1,
0.6253106, -0.3347332, 2.457064, 0, 0, 0, 1, 1,
0.6258751, -1.733545, 2.501559, 0, 0, 0, 1, 1,
0.6267485, -0.9849608, 1.872872, 0, 0, 0, 1, 1,
0.6290339, 0.8131092, 1.289292, 0, 0, 0, 1, 1,
0.6304065, 0.7033181, 0.0064157, 0, 0, 0, 1, 1,
0.6321782, -0.3308381, 2.419723, 1, 1, 1, 1, 1,
0.6365486, -0.0004134761, 1.958025, 1, 1, 1, 1, 1,
0.6381305, 0.2335469, 2.185042, 1, 1, 1, 1, 1,
0.643231, 0.3766842, 0.948577, 1, 1, 1, 1, 1,
0.6458868, -1.354715, 4.475314, 1, 1, 1, 1, 1,
0.6520262, 1.227083, -0.1733165, 1, 1, 1, 1, 1,
0.6579849, -1.176872, 1.714357, 1, 1, 1, 1, 1,
0.6621565, 0.1840733, 1.523133, 1, 1, 1, 1, 1,
0.6637414, -1.483708, 3.124674, 1, 1, 1, 1, 1,
0.6666789, -1.688582, 3.444964, 1, 1, 1, 1, 1,
0.6671725, 0.657319, 1.164434, 1, 1, 1, 1, 1,
0.6714829, 0.3449215, 0.04025352, 1, 1, 1, 1, 1,
0.6747168, -0.2669225, 1.657525, 1, 1, 1, 1, 1,
0.6788935, -0.07943929, 1.182051, 1, 1, 1, 1, 1,
0.6831103, 1.281028, 0.7896531, 1, 1, 1, 1, 1,
0.6831524, 1.504172, 1.961162, 0, 0, 1, 1, 1,
0.6852437, -1.040043, 2.303058, 1, 0, 0, 1, 1,
0.6883434, -0.9045746, 0.4419397, 1, 0, 0, 1, 1,
0.6895751, 0.04442688, 1.288724, 1, 0, 0, 1, 1,
0.6907604, 0.5084726, 2.591868, 1, 0, 0, 1, 1,
0.6928011, -0.6058115, 2.204056, 1, 0, 0, 1, 1,
0.6931071, 0.01664989, 2.813994, 0, 0, 0, 1, 1,
0.6955997, -0.9707761, 2.021252, 0, 0, 0, 1, 1,
0.6969456, -0.02452708, 0.5274527, 0, 0, 0, 1, 1,
0.6982464, 0.9348013, 2.536248, 0, 0, 0, 1, 1,
0.7133728, 0.3162668, 1.079665, 0, 0, 0, 1, 1,
0.7142006, -0.3849603, 3.416362, 0, 0, 0, 1, 1,
0.7153812, 0.4380749, -0.1764636, 0, 0, 0, 1, 1,
0.7156593, -1.151646, 1.497664, 1, 1, 1, 1, 1,
0.7174379, 1.386078, 1.028085, 1, 1, 1, 1, 1,
0.7193758, 2.230921, 1.002535, 1, 1, 1, 1, 1,
0.7227503, 0.1538798, 0.8950431, 1, 1, 1, 1, 1,
0.7239164, 1.16331, -0.2981142, 1, 1, 1, 1, 1,
0.7254466, -0.7780066, 2.535522, 1, 1, 1, 1, 1,
0.7289516, 2.311678, -1.49666, 1, 1, 1, 1, 1,
0.7302107, 0.3564391, -0.0526039, 1, 1, 1, 1, 1,
0.7318903, -0.3810881, 0.6172933, 1, 1, 1, 1, 1,
0.7441089, 0.4472002, 1.435009, 1, 1, 1, 1, 1,
0.746452, -0.7895519, 2.682608, 1, 1, 1, 1, 1,
0.7498925, 1.182188, 0.6152595, 1, 1, 1, 1, 1,
0.7569509, 0.1400088, 2.952878, 1, 1, 1, 1, 1,
0.7584936, 0.8144479, 1.991035, 1, 1, 1, 1, 1,
0.7626019, -0.4216184, 1.654999, 1, 1, 1, 1, 1,
0.7659109, -0.5433952, 4.416866, 0, 0, 1, 1, 1,
0.7701197, 0.2530333, 1.051375, 1, 0, 0, 1, 1,
0.7727838, 1.063762, -0.002669716, 1, 0, 0, 1, 1,
0.7731267, 0.2741643, 1.905967, 1, 0, 0, 1, 1,
0.7741535, -0.7131472, 1.757326, 1, 0, 0, 1, 1,
0.7757621, -0.7698315, 3.284476, 1, 0, 0, 1, 1,
0.7844771, -1.246773, 2.674307, 0, 0, 0, 1, 1,
0.7861549, 0.4736896, 2.298581, 0, 0, 0, 1, 1,
0.7913018, -0.3457911, 1.523089, 0, 0, 0, 1, 1,
0.7950809, -0.8017434, 3.86572, 0, 0, 0, 1, 1,
0.7956474, -1.234605, 2.723803, 0, 0, 0, 1, 1,
0.8100131, 0.979768, 1.735132, 0, 0, 0, 1, 1,
0.8132598, -0.5628029, 2.597384, 0, 0, 0, 1, 1,
0.8203819, 0.2547774, 2.297834, 1, 1, 1, 1, 1,
0.8232681, -0.09864884, 1.845758, 1, 1, 1, 1, 1,
0.8248535, 0.3007859, 1.990088, 1, 1, 1, 1, 1,
0.828802, -2.468921, 3.177058, 1, 1, 1, 1, 1,
0.832101, -1.082423, 1.609308, 1, 1, 1, 1, 1,
0.8333797, 0.9232239, 2.305833, 1, 1, 1, 1, 1,
0.8337979, 1.335223, -0.6497672, 1, 1, 1, 1, 1,
0.8531178, 1.204185, 0.2679484, 1, 1, 1, 1, 1,
0.857331, 0.1917578, 2.234619, 1, 1, 1, 1, 1,
0.8573852, 0.4222212, -0.001718279, 1, 1, 1, 1, 1,
0.8651616, -1.903021, 2.171607, 1, 1, 1, 1, 1,
0.8726813, 1.178144, 1.028099, 1, 1, 1, 1, 1,
0.8781717, 0.4293807, 1.224162, 1, 1, 1, 1, 1,
0.8782293, -2.003019, 1.667469, 1, 1, 1, 1, 1,
0.8807894, 2.790677, 0.4447111, 1, 1, 1, 1, 1,
0.8818969, -1.999968, 4.017894, 0, 0, 1, 1, 1,
0.8840725, -0.7336776, 2.779538, 1, 0, 0, 1, 1,
0.8877295, 1.439337, 0.3700454, 1, 0, 0, 1, 1,
0.8878037, -0.5740579, 0.7554721, 1, 0, 0, 1, 1,
0.8963041, -0.2188159, 1.922454, 1, 0, 0, 1, 1,
0.9012769, -0.582835, 2.569297, 1, 0, 0, 1, 1,
0.9027275, -0.9981406, 3.016195, 0, 0, 0, 1, 1,
0.9027471, -0.4080459, 2.303952, 0, 0, 0, 1, 1,
0.9036565, 0.3479034, 1.437495, 0, 0, 0, 1, 1,
0.9079081, -0.3055499, 1.938361, 0, 0, 0, 1, 1,
0.9084837, 0.8942038, 1.108562, 0, 0, 0, 1, 1,
0.91083, -0.5579417, 2.247239, 0, 0, 0, 1, 1,
0.9145588, -0.4841532, 1.91596, 0, 0, 0, 1, 1,
0.9169378, -0.7600225, 1.871772, 1, 1, 1, 1, 1,
0.9208262, 0.9663346, -0.2450138, 1, 1, 1, 1, 1,
0.9216662, 1.302674, 0.9055817, 1, 1, 1, 1, 1,
0.9294865, 0.223083, 0.8973389, 1, 1, 1, 1, 1,
0.9324951, -1.008403, 2.572884, 1, 1, 1, 1, 1,
0.9375279, -2.207747, 3.081643, 1, 1, 1, 1, 1,
0.9408996, 1.364661, 0.5677593, 1, 1, 1, 1, 1,
0.9453343, 1.050152, 0.6458357, 1, 1, 1, 1, 1,
0.9463139, 1.051654, 2.12361, 1, 1, 1, 1, 1,
0.9498, 0.08263656, 1.328325, 1, 1, 1, 1, 1,
0.9601756, 0.9763205, 0.785267, 1, 1, 1, 1, 1,
0.9623718, -0.7889934, 2.65906, 1, 1, 1, 1, 1,
0.9637287, 1.097182, 1.184487, 1, 1, 1, 1, 1,
0.9639106, -0.8959439, 1.878193, 1, 1, 1, 1, 1,
0.9743737, 0.1177319, 1.728363, 1, 1, 1, 1, 1,
0.9756711, -0.001565372, 2.459064, 0, 0, 1, 1, 1,
0.9841699, 0.2027955, 3.359063, 1, 0, 0, 1, 1,
0.9869599, -0.2643088, 2.288366, 1, 0, 0, 1, 1,
0.9870893, 1.151158, 2.623497, 1, 0, 0, 1, 1,
0.9918872, 0.2020044, 1.660161, 1, 0, 0, 1, 1,
0.9934325, 1.200927, 0.7621205, 1, 0, 0, 1, 1,
0.9938948, 0.6257139, 1.547, 0, 0, 0, 1, 1,
1.000254, -0.6263617, 2.476708, 0, 0, 0, 1, 1,
1.000303, -0.9614166, 1.671527, 0, 0, 0, 1, 1,
1.008126, 0.5572893, 1.643547, 0, 0, 0, 1, 1,
1.014338, 0.1314628, 2.822966, 0, 0, 0, 1, 1,
1.015569, -0.3191379, 1.647042, 0, 0, 0, 1, 1,
1.017874, -1.28119, 2.47895, 0, 0, 0, 1, 1,
1.019922, 0.3718352, 1.207493, 1, 1, 1, 1, 1,
1.024275, -0.9405632, 3.307722, 1, 1, 1, 1, 1,
1.027196, -0.3051693, -0.3828948, 1, 1, 1, 1, 1,
1.035774, 0.5246478, 1.886447, 1, 1, 1, 1, 1,
1.037895, 0.124901, 1.035997, 1, 1, 1, 1, 1,
1.039671, 1.025518, 3.98004, 1, 1, 1, 1, 1,
1.03977, -1.526327, 2.724469, 1, 1, 1, 1, 1,
1.041318, 0.1783546, 1.175712, 1, 1, 1, 1, 1,
1.042228, -0.6052932, 1.37039, 1, 1, 1, 1, 1,
1.043251, -0.6075472, 1.540803, 1, 1, 1, 1, 1,
1.049626, 1.586555, -0.5017392, 1, 1, 1, 1, 1,
1.051297, -0.1582199, 0.6030697, 1, 1, 1, 1, 1,
1.052309, 1.953393, 0.5586454, 1, 1, 1, 1, 1,
1.057991, -0.5749786, 0.8748357, 1, 1, 1, 1, 1,
1.067362, 1.736134, 1.067449, 1, 1, 1, 1, 1,
1.071575, -0.6556676, 0.7285888, 0, 0, 1, 1, 1,
1.081671, 0.1742137, 0.9324226, 1, 0, 0, 1, 1,
1.091624, 1.141175, 2.761597, 1, 0, 0, 1, 1,
1.097733, -1.273759, 2.569792, 1, 0, 0, 1, 1,
1.099928, -0.4696565, 1.087854, 1, 0, 0, 1, 1,
1.104889, -0.7883394, 0.1296178, 1, 0, 0, 1, 1,
1.105189, 0.8542465, -0.02393943, 0, 0, 0, 1, 1,
1.125232, 0.3765949, 1.304092, 0, 0, 0, 1, 1,
1.127747, -1.856308, 2.329876, 0, 0, 0, 1, 1,
1.133109, -0.472878, 1.450794, 0, 0, 0, 1, 1,
1.133216, 1.105052, 0.2337644, 0, 0, 0, 1, 1,
1.135324, -0.8815189, 2.237531, 0, 0, 0, 1, 1,
1.137808, 1.188899, -0.5387648, 0, 0, 0, 1, 1,
1.141917, 0.5590131, -0.2525001, 1, 1, 1, 1, 1,
1.142227, 0.2488075, 1.242842, 1, 1, 1, 1, 1,
1.145654, -1.029399, 2.80933, 1, 1, 1, 1, 1,
1.146505, -0.9638284, 3.024082, 1, 1, 1, 1, 1,
1.174604, 0.2947702, 2.98534, 1, 1, 1, 1, 1,
1.180179, 0.1137387, 1.230963, 1, 1, 1, 1, 1,
1.185599, 0.5265355, 1.133506, 1, 1, 1, 1, 1,
1.188769, -0.0961326, 2.25919, 1, 1, 1, 1, 1,
1.193891, -0.488438, 1.462427, 1, 1, 1, 1, 1,
1.194749, -0.6332567, 1.084264, 1, 1, 1, 1, 1,
1.203392, 1.340884, 0.7742227, 1, 1, 1, 1, 1,
1.203481, 0.8477039, -2.807429, 1, 1, 1, 1, 1,
1.217057, -0.04130533, 2.040946, 1, 1, 1, 1, 1,
1.220561, 0.5739237, 1.493412, 1, 1, 1, 1, 1,
1.230382, 1.049852, -1.606452, 1, 1, 1, 1, 1,
1.230658, 0.5042574, 0.9380572, 0, 0, 1, 1, 1,
1.23188, 1.29802, 0.4631826, 1, 0, 0, 1, 1,
1.239279, 0.4345433, 1.215373, 1, 0, 0, 1, 1,
1.239482, -0.104664, -0.09701248, 1, 0, 0, 1, 1,
1.240046, -0.2928671, 2.228282, 1, 0, 0, 1, 1,
1.252977, 1.644544, -0.01866635, 1, 0, 0, 1, 1,
1.264782, 0.691815, 1.826172, 0, 0, 0, 1, 1,
1.273811, -0.4225017, 0.4409477, 0, 0, 0, 1, 1,
1.278137, -1.091869, 1.195996, 0, 0, 0, 1, 1,
1.280348, 0.4670451, 2.516258, 0, 0, 0, 1, 1,
1.284225, 0.327252, 2.423143, 0, 0, 0, 1, 1,
1.303328, -0.248762, 0.2490814, 0, 0, 0, 1, 1,
1.315246, -0.5434383, 1.886175, 0, 0, 0, 1, 1,
1.321373, 1.597994, 1.533297, 1, 1, 1, 1, 1,
1.332921, 0.6861531, -0.05505203, 1, 1, 1, 1, 1,
1.337962, -1.444393, 1.745035, 1, 1, 1, 1, 1,
1.338983, -0.6027797, 1.173321, 1, 1, 1, 1, 1,
1.33948, 0.9250154, 1.308155, 1, 1, 1, 1, 1,
1.340984, -0.998625, 1.784451, 1, 1, 1, 1, 1,
1.356168, 0.6893634, 2.809711, 1, 1, 1, 1, 1,
1.364231, 1.37702, -0.4288354, 1, 1, 1, 1, 1,
1.365808, -1.091306, 1.50958, 1, 1, 1, 1, 1,
1.36619, 0.7925554, 2.662528, 1, 1, 1, 1, 1,
1.417972, -1.672353, 2.503545, 1, 1, 1, 1, 1,
1.418242, -2.305057, 3.422798, 1, 1, 1, 1, 1,
1.418786, 1.715692, 1.876617, 1, 1, 1, 1, 1,
1.419975, -1.993773, 2.093976, 1, 1, 1, 1, 1,
1.423226, 0.7155294, 1.798487, 1, 1, 1, 1, 1,
1.446586, 0.1103052, 1.583398, 0, 0, 1, 1, 1,
1.453722, 0.3059599, 2.099537, 1, 0, 0, 1, 1,
1.457057, 1.322036, 1.190878, 1, 0, 0, 1, 1,
1.458416, -0.5721219, 2.340837, 1, 0, 0, 1, 1,
1.463245, 0.46059, 2.300601, 1, 0, 0, 1, 1,
1.470858, 0.5447227, -0.1412071, 1, 0, 0, 1, 1,
1.487622, -1.089698, 3.677245, 0, 0, 0, 1, 1,
1.490386, 0.5176225, 0.2593761, 0, 0, 0, 1, 1,
1.49739, 0.5201883, 2.363513, 0, 0, 0, 1, 1,
1.50451, -1.595992, 2.156196, 0, 0, 0, 1, 1,
1.512014, -0.02876253, -0.3553216, 0, 0, 0, 1, 1,
1.516595, 1.432706, 1.336429, 0, 0, 0, 1, 1,
1.519417, -1.705629, 0.5051811, 0, 0, 0, 1, 1,
1.525817, 0.1521147, 2.56411, 1, 1, 1, 1, 1,
1.532879, 0.02896927, 0.1283933, 1, 1, 1, 1, 1,
1.537611, 0.8865117, 0.2570464, 1, 1, 1, 1, 1,
1.542886, 1.618066, -1.244776, 1, 1, 1, 1, 1,
1.544218, 0.9404026, 1.514383, 1, 1, 1, 1, 1,
1.549755, -0.798167, 3.353824, 1, 1, 1, 1, 1,
1.552447, -0.7346885, 2.696891, 1, 1, 1, 1, 1,
1.554523, -0.6635954, 2.295738, 1, 1, 1, 1, 1,
1.55861, -1.894073, 3.155507, 1, 1, 1, 1, 1,
1.559044, 0.573673, 1.921178, 1, 1, 1, 1, 1,
1.56174, -0.5588969, 1.721149, 1, 1, 1, 1, 1,
1.568242, 0.05498814, 1.828195, 1, 1, 1, 1, 1,
1.608474, -1.092949, 0.4435851, 1, 1, 1, 1, 1,
1.622927, 0.8022664, 0.7884892, 1, 1, 1, 1, 1,
1.641025, -0.8819661, 4.453779, 1, 1, 1, 1, 1,
1.649176, 0.1213209, 1.925373, 0, 0, 1, 1, 1,
1.653859, 0.204098, 1.891576, 1, 0, 0, 1, 1,
1.669064, 1.392932, 0.4601003, 1, 0, 0, 1, 1,
1.671551, -0.6539468, 3.245661, 1, 0, 0, 1, 1,
1.67844, 1.218804, 2.118049, 1, 0, 0, 1, 1,
1.692599, 0.5362526, 1.066326, 1, 0, 0, 1, 1,
1.699545, 0.04971698, 0.43126, 0, 0, 0, 1, 1,
1.702539, -1.431162, 2.863892, 0, 0, 0, 1, 1,
1.704534, -0.6870924, 3.11256, 0, 0, 0, 1, 1,
1.716915, -0.5179579, 2.231188, 0, 0, 0, 1, 1,
1.717822, -0.115483, 1.739801, 0, 0, 0, 1, 1,
1.731396, -1.006401, 2.007489, 0, 0, 0, 1, 1,
1.758325, 1.804906, 3.248197, 0, 0, 0, 1, 1,
1.766569, -0.664515, 1.583698, 1, 1, 1, 1, 1,
1.786759, -0.2161741, 0.7141896, 1, 1, 1, 1, 1,
1.799607, 0.7854466, 0.8900505, 1, 1, 1, 1, 1,
1.801797, 0.1387116, 2.559585, 1, 1, 1, 1, 1,
1.840306, -0.6491747, 2.136448, 1, 1, 1, 1, 1,
1.848473, -0.7549487, 2.747374, 1, 1, 1, 1, 1,
1.849198, -0.8967468, 1.357442, 1, 1, 1, 1, 1,
1.874219, -0.2668032, 4.373644, 1, 1, 1, 1, 1,
1.8776, 0.921214, -0.1043878, 1, 1, 1, 1, 1,
1.888674, 1.076759, 1.653771, 1, 1, 1, 1, 1,
1.889458, 0.8798454, 2.014575, 1, 1, 1, 1, 1,
1.94715, 0.09287402, 2.180694, 1, 1, 1, 1, 1,
1.951512, 0.3313932, 1.674203, 1, 1, 1, 1, 1,
1.955416, -0.5360402, 3.943573, 1, 1, 1, 1, 1,
1.972187, 1.343295, 0.8677434, 1, 1, 1, 1, 1,
1.995336, -0.3434929, -0.2246646, 0, 0, 1, 1, 1,
1.997854, 1.209089, -0.1114969, 1, 0, 0, 1, 1,
1.998422, 0.935314, 3.175218, 1, 0, 0, 1, 1,
2.00512, -1.409102, 2.053591, 1, 0, 0, 1, 1,
2.019254, -0.4030288, 0.7659117, 1, 0, 0, 1, 1,
2.045088, 1.114202, -0.09356727, 1, 0, 0, 1, 1,
2.057363, -0.1145558, 2.092092, 0, 0, 0, 1, 1,
2.101379, -0.796571, 2.332913, 0, 0, 0, 1, 1,
2.12425, 0.5630254, 2.321229, 0, 0, 0, 1, 1,
2.124574, 1.448084, 0.8260157, 0, 0, 0, 1, 1,
2.128055, -0.172704, 0.7044213, 0, 0, 0, 1, 1,
2.248455, 0.8237716, 2.146496, 0, 0, 0, 1, 1,
2.274364, -0.01070996, 1.342467, 0, 0, 0, 1, 1,
2.325978, 1.430907, -0.01800204, 1, 1, 1, 1, 1,
2.363114, 0.1669424, 2.532396, 1, 1, 1, 1, 1,
2.406385, -1.013909, 1.442627, 1, 1, 1, 1, 1,
2.643451, -0.0002303782, 0.9095778, 1, 1, 1, 1, 1,
2.684386, -0.3655578, 3.218936, 1, 1, 1, 1, 1,
3.204793, -0.2018002, 1.168501, 1, 1, 1, 1, 1,
3.662267, 1.252211, 0.7374386, 1, 1, 1, 1, 1
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
var radius = 9.952431;
var distance = 34.95749;
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
mvMatrix.translate( -0.2354445, -0.3819093, -0.434283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.95749);
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
