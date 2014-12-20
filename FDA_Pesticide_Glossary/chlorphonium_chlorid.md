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
-3.409922, -0.952256, -0.3094428, 1, 0, 0, 1,
-3.198074, 0.7153524, -2.174152, 1, 0.007843138, 0, 1,
-3.016585, -0.3089726, -1.688174, 1, 0.01176471, 0, 1,
-2.954523, -0.1779568, -1.982744, 1, 0.01960784, 0, 1,
-2.744043, 0.3693636, -2.046177, 1, 0.02352941, 0, 1,
-2.727464, 0.5506414, -1.676934, 1, 0.03137255, 0, 1,
-2.650073, -0.7193561, -2.122946, 1, 0.03529412, 0, 1,
-2.605543, -0.5358045, -1.202153, 1, 0.04313726, 0, 1,
-2.603135, -0.380164, 0.09291127, 1, 0.04705882, 0, 1,
-2.593651, 1.313422, -0.273854, 1, 0.05490196, 0, 1,
-2.554217, -0.2494553, -1.707199, 1, 0.05882353, 0, 1,
-2.484866, 0.3197607, -1.508514, 1, 0.06666667, 0, 1,
-2.465817, -1.232678, -3.081321, 1, 0.07058824, 0, 1,
-2.44286, -0.1554329, 0.08058035, 1, 0.07843138, 0, 1,
-2.359379, -2.02578, -2.616305, 1, 0.08235294, 0, 1,
-2.320048, -0.286595, -1.519685, 1, 0.09019608, 0, 1,
-2.265786, 0.5594212, -1.719475, 1, 0.09411765, 0, 1,
-2.221061, -0.436166, -1.251953, 1, 0.1019608, 0, 1,
-2.215013, 0.6194857, -1.94383, 1, 0.1098039, 0, 1,
-2.198842, -0.8546973, -2.596854, 1, 0.1137255, 0, 1,
-2.169505, 0.905828, -0.9669707, 1, 0.1215686, 0, 1,
-2.15829, 0.3000421, -1.831775, 1, 0.1254902, 0, 1,
-2.156797, 2.216319, -0.6652291, 1, 0.1333333, 0, 1,
-2.139803, -0.4005432, -2.326394, 1, 0.1372549, 0, 1,
-2.072361, 0.2059933, -1.429207, 1, 0.145098, 0, 1,
-2.069221, 0.04852362, -2.154471, 1, 0.1490196, 0, 1,
-2.053194, -1.23589, -2.041714, 1, 0.1568628, 0, 1,
-2.024755, -0.2060536, -2.364862, 1, 0.1607843, 0, 1,
-2.01104, 0.3944508, -2.235416, 1, 0.1686275, 0, 1,
-1.956176, -0.2722651, -0.8287996, 1, 0.172549, 0, 1,
-1.953747, 0.1830169, -2.223857, 1, 0.1803922, 0, 1,
-1.946008, -0.4755518, -2.293736, 1, 0.1843137, 0, 1,
-1.94399, -0.3805915, -1.002307, 1, 0.1921569, 0, 1,
-1.906524, 0.1983203, -1.338163, 1, 0.1960784, 0, 1,
-1.900684, 0.556356, -0.6479465, 1, 0.2039216, 0, 1,
-1.858526, 0.5833398, -0.6243964, 1, 0.2117647, 0, 1,
-1.846733, -0.827354, -0.230444, 1, 0.2156863, 0, 1,
-1.82404, 0.3691762, -2.745684, 1, 0.2235294, 0, 1,
-1.81601, -1.803667, -1.280763, 1, 0.227451, 0, 1,
-1.812814, 0.7810686, -0.408534, 1, 0.2352941, 0, 1,
-1.754972, -0.5784491, -2.861984, 1, 0.2392157, 0, 1,
-1.751445, 0.003289585, -1.503132, 1, 0.2470588, 0, 1,
-1.708586, 0.08350439, -1.618093, 1, 0.2509804, 0, 1,
-1.701773, -0.2946572, -1.417782, 1, 0.2588235, 0, 1,
-1.697033, -0.01066509, 0.04426486, 1, 0.2627451, 0, 1,
-1.683228, -0.5190454, -1.771415, 1, 0.2705882, 0, 1,
-1.673487, -2.256379, -4.65837, 1, 0.2745098, 0, 1,
-1.6544, 0.4003044, -1.390197, 1, 0.282353, 0, 1,
-1.643179, 0.02437836, -3.268778, 1, 0.2862745, 0, 1,
-1.641945, 0.4973156, -0.3573542, 1, 0.2941177, 0, 1,
-1.639189, -0.2513689, -2.617436, 1, 0.3019608, 0, 1,
-1.636573, 2.906127, -0.9691156, 1, 0.3058824, 0, 1,
-1.62347, -1.513151, -1.586569, 1, 0.3137255, 0, 1,
-1.601585, 0.9023066, -2.19693, 1, 0.3176471, 0, 1,
-1.597738, 0.916364, -1.550893, 1, 0.3254902, 0, 1,
-1.594089, -1.009471, -4.455382, 1, 0.3294118, 0, 1,
-1.588802, -0.1382134, -2.120462, 1, 0.3372549, 0, 1,
-1.583357, 0.823857, -0.9358517, 1, 0.3411765, 0, 1,
-1.566262, -1.000223, -2.159113, 1, 0.3490196, 0, 1,
-1.557244, 1.749868, -1.771183, 1, 0.3529412, 0, 1,
-1.553832, 1.813514, -1.856996, 1, 0.3607843, 0, 1,
-1.548696, -0.8278532, -0.9791614, 1, 0.3647059, 0, 1,
-1.535632, 0.5081355, -1.884867, 1, 0.372549, 0, 1,
-1.535627, -2.208777, -2.151117, 1, 0.3764706, 0, 1,
-1.534066, 0.1638597, -1.645407, 1, 0.3843137, 0, 1,
-1.533474, -2.567353, -2.37429, 1, 0.3882353, 0, 1,
-1.525645, -0.91747, -1.901817, 1, 0.3960784, 0, 1,
-1.520566, -1.482897, -2.046754, 1, 0.4039216, 0, 1,
-1.514448, -0.06676809, -1.567874, 1, 0.4078431, 0, 1,
-1.502595, -0.08453547, -1.765813, 1, 0.4156863, 0, 1,
-1.498596, -1.035116, -1.848755, 1, 0.4196078, 0, 1,
-1.485992, -0.5378476, -1.969977, 1, 0.427451, 0, 1,
-1.484429, 0.677971, -0.7392437, 1, 0.4313726, 0, 1,
-1.457165, -0.6083218, -1.621728, 1, 0.4392157, 0, 1,
-1.454642, -0.02453769, -3.988707, 1, 0.4431373, 0, 1,
-1.447715, -0.3133356, -1.365771, 1, 0.4509804, 0, 1,
-1.446285, 0.8152162, -1.922587, 1, 0.454902, 0, 1,
-1.443604, 0.9701996, -0.8817713, 1, 0.4627451, 0, 1,
-1.436558, 0.1971048, -1.918777, 1, 0.4666667, 0, 1,
-1.428718, 0.4684429, -0.7737734, 1, 0.4745098, 0, 1,
-1.415848, 0.7427608, -0.3386035, 1, 0.4784314, 0, 1,
-1.412596, 1.987686, -0.07749198, 1, 0.4862745, 0, 1,
-1.409014, 1.373009, -0.3511074, 1, 0.4901961, 0, 1,
-1.402593, 0.6099961, -1.839639, 1, 0.4980392, 0, 1,
-1.396441, 1.242196, -0.2150728, 1, 0.5058824, 0, 1,
-1.395799, 1.013148, -2.594902, 1, 0.509804, 0, 1,
-1.390383, -0.4588327, -3.809747, 1, 0.5176471, 0, 1,
-1.390316, 0.9579138, -0.508957, 1, 0.5215687, 0, 1,
-1.389462, 0.4257872, -2.285681, 1, 0.5294118, 0, 1,
-1.387255, 0.5305951, -0.4287727, 1, 0.5333334, 0, 1,
-1.387189, -0.2824785, -0.4308209, 1, 0.5411765, 0, 1,
-1.379946, -1.993166, -0.6037298, 1, 0.5450981, 0, 1,
-1.379805, -0.4757769, -1.7298, 1, 0.5529412, 0, 1,
-1.374709, 1.073761, -0.3053459, 1, 0.5568628, 0, 1,
-1.370147, -0.3378433, -1.466715, 1, 0.5647059, 0, 1,
-1.368385, -0.7093633, -3.967142, 1, 0.5686275, 0, 1,
-1.36384, 0.9603292, 0.3954047, 1, 0.5764706, 0, 1,
-1.357005, 1.102795, -0.6889507, 1, 0.5803922, 0, 1,
-1.351501, 0.892606, -0.9908075, 1, 0.5882353, 0, 1,
-1.33861, -1.351727, -3.376478, 1, 0.5921569, 0, 1,
-1.331219, -1.292509, -2.91702, 1, 0.6, 0, 1,
-1.323999, -0.2425062, -1.860186, 1, 0.6078432, 0, 1,
-1.305223, 0.9157933, -1.145831, 1, 0.6117647, 0, 1,
-1.301861, -1.109453, -0.9774148, 1, 0.6196079, 0, 1,
-1.300982, -1.494222, -4.169457, 1, 0.6235294, 0, 1,
-1.296261, 0.6419375, 0.849365, 1, 0.6313726, 0, 1,
-1.294148, -0.3800121, -1.699976, 1, 0.6352941, 0, 1,
-1.28739, -0.1263938, -0.3723364, 1, 0.6431373, 0, 1,
-1.280717, -0.8557814, 0.8787683, 1, 0.6470588, 0, 1,
-1.275128, 1.174501, 0.04403739, 1, 0.654902, 0, 1,
-1.267466, -2.464731, -1.696876, 1, 0.6588235, 0, 1,
-1.253165, -0.2702409, -2.766518, 1, 0.6666667, 0, 1,
-1.253057, 0.1289521, -2.397479, 1, 0.6705883, 0, 1,
-1.228919, -2.589555, -3.326906, 1, 0.6784314, 0, 1,
-1.218993, -1.380994, 0.05508844, 1, 0.682353, 0, 1,
-1.212501, -0.8155859, -1.866547, 1, 0.6901961, 0, 1,
-1.210901, 1.644879, 1.138436, 1, 0.6941177, 0, 1,
-1.204055, 0.4202487, -2.74385, 1, 0.7019608, 0, 1,
-1.203159, -0.1519202, -1.550261, 1, 0.7098039, 0, 1,
-1.201161, -1.431533, -3.109659, 1, 0.7137255, 0, 1,
-1.189213, -0.5955641, -1.972614, 1, 0.7215686, 0, 1,
-1.183853, -0.4591013, -1.087329, 1, 0.7254902, 0, 1,
-1.173145, -1.060312, -1.618648, 1, 0.7333333, 0, 1,
-1.162387, 0.7625743, -0.2680446, 1, 0.7372549, 0, 1,
-1.162244, -1.238819, -2.995682, 1, 0.7450981, 0, 1,
-1.149344, 0.6381754, -1.917619, 1, 0.7490196, 0, 1,
-1.13483, 0.1773048, 0.6421733, 1, 0.7568628, 0, 1,
-1.130783, -1.586392, -2.162961, 1, 0.7607843, 0, 1,
-1.127045, -1.018703, -0.7322195, 1, 0.7686275, 0, 1,
-1.113576, -1.328148, -1.640655, 1, 0.772549, 0, 1,
-1.109134, 1.321893, -0.8594647, 1, 0.7803922, 0, 1,
-1.109102, -2.461918, -3.513564, 1, 0.7843137, 0, 1,
-1.101598, -0.7695671, -2.275321, 1, 0.7921569, 0, 1,
-1.097148, -0.1936486, -1.066154, 1, 0.7960784, 0, 1,
-1.090602, 0.04489115, -2.951573, 1, 0.8039216, 0, 1,
-1.088773, -0.2672147, -2.22041, 1, 0.8117647, 0, 1,
-1.088163, 0.6519727, -0.08945566, 1, 0.8156863, 0, 1,
-1.081066, 0.6119687, -1.214491, 1, 0.8235294, 0, 1,
-1.080402, 1.609255, 1.675015, 1, 0.827451, 0, 1,
-1.073342, 0.5029914, -2.077606, 1, 0.8352941, 0, 1,
-1.061021, 0.2015741, -2.208984, 1, 0.8392157, 0, 1,
-1.055719, 0.9142472, 0.2354008, 1, 0.8470588, 0, 1,
-1.052566, -0.4230005, -2.863589, 1, 0.8509804, 0, 1,
-1.048571, -0.3117833, -2.661149, 1, 0.8588235, 0, 1,
-1.048251, 1.452451, 0.1161469, 1, 0.8627451, 0, 1,
-1.044484, 1.284499, -1.908902, 1, 0.8705882, 0, 1,
-1.043032, 0.8851779, -0.8321798, 1, 0.8745098, 0, 1,
-1.041257, -0.3289686, -3.176126, 1, 0.8823529, 0, 1,
-1.038944, 0.9999864, -1.195165, 1, 0.8862745, 0, 1,
-1.038514, -1.204857, -2.729284, 1, 0.8941177, 0, 1,
-1.033422, -0.9866281, -1.615649, 1, 0.8980392, 0, 1,
-1.026194, 1.542083, -0.6415595, 1, 0.9058824, 0, 1,
-1.019262, 0.159882, -2.457798, 1, 0.9137255, 0, 1,
-1.013115, -1.696856, -1.51624, 1, 0.9176471, 0, 1,
-1.009657, -1.234038, -3.751105, 1, 0.9254902, 0, 1,
-0.9992006, -0.149593, -2.210493, 1, 0.9294118, 0, 1,
-0.995342, -0.7379468, -2.721654, 1, 0.9372549, 0, 1,
-0.9946678, -0.4478166, -1.57517, 1, 0.9411765, 0, 1,
-0.9676487, -0.3381743, -2.306931, 1, 0.9490196, 0, 1,
-0.9650995, 0.224378, 0.4196859, 1, 0.9529412, 0, 1,
-0.9649099, -1.508433, -3.120065, 1, 0.9607843, 0, 1,
-0.96355, 0.1196852, -0.78965, 1, 0.9647059, 0, 1,
-0.9585193, 0.6020198, -1.562242, 1, 0.972549, 0, 1,
-0.9584339, -0.2576679, -1.670954, 1, 0.9764706, 0, 1,
-0.9412919, 0.6676185, -1.905284, 1, 0.9843137, 0, 1,
-0.9409506, -0.03430337, -0.02579334, 1, 0.9882353, 0, 1,
-0.9386308, 0.09414975, -1.09972, 1, 0.9960784, 0, 1,
-0.9382702, -0.03299026, -1.871389, 0.9960784, 1, 0, 1,
-0.9291275, -0.927358, -2.375424, 0.9921569, 1, 0, 1,
-0.9243899, 0.1257987, -1.827796, 0.9843137, 1, 0, 1,
-0.9200996, 0.3133444, -1.588146, 0.9803922, 1, 0, 1,
-0.9190503, -0.6865549, -3.038558, 0.972549, 1, 0, 1,
-0.9117377, -1.688902, -3.392007, 0.9686275, 1, 0, 1,
-0.9080324, -0.2436967, -2.201486, 0.9607843, 1, 0, 1,
-0.906341, 1.262851, -0.5308245, 0.9568627, 1, 0, 1,
-0.9056339, 0.0554084, -1.229929, 0.9490196, 1, 0, 1,
-0.9039157, 1.228988, -0.3463834, 0.945098, 1, 0, 1,
-0.9020313, 0.644492, -0.3277147, 0.9372549, 1, 0, 1,
-0.9013596, 0.4095955, -1.503531, 0.9333333, 1, 0, 1,
-0.8961378, 0.8804557, -1.737545, 0.9254902, 1, 0, 1,
-0.8951303, 0.0722862, -1.072294, 0.9215686, 1, 0, 1,
-0.8917404, -0.02132839, -1.601153, 0.9137255, 1, 0, 1,
-0.8910394, 0.5192735, -1.679951, 0.9098039, 1, 0, 1,
-0.887409, 0.0324757, -0.9073024, 0.9019608, 1, 0, 1,
-0.8808874, 0.1139687, -0.8069782, 0.8941177, 1, 0, 1,
-0.8798243, 1.064143, -0.7944852, 0.8901961, 1, 0, 1,
-0.8675651, -1.732192, -1.965917, 0.8823529, 1, 0, 1,
-0.8628519, -1.384395, -1.880862, 0.8784314, 1, 0, 1,
-0.8626334, 0.5112457, -0.2550521, 0.8705882, 1, 0, 1,
-0.8620787, -0.870678, -1.385259, 0.8666667, 1, 0, 1,
-0.8618048, 0.7475571, -1.449818, 0.8588235, 1, 0, 1,
-0.8611522, 1.620013, 0.6565495, 0.854902, 1, 0, 1,
-0.8606845, -0.169026, -3.282346, 0.8470588, 1, 0, 1,
-0.8515656, -0.201594, 0.1051842, 0.8431373, 1, 0, 1,
-0.8505872, -0.66656, -2.063412, 0.8352941, 1, 0, 1,
-0.8493358, -1.650064, -4.657711, 0.8313726, 1, 0, 1,
-0.8476421, -0.4733086, -1.35629, 0.8235294, 1, 0, 1,
-0.8409129, 0.08653995, -2.048248, 0.8196079, 1, 0, 1,
-0.8403166, -0.3577303, -1.964981, 0.8117647, 1, 0, 1,
-0.8384332, 0.5317784, -1.112355, 0.8078431, 1, 0, 1,
-0.8305863, 0.03012357, -2.963937, 0.8, 1, 0, 1,
-0.8196529, 2.403717, 0.01768603, 0.7921569, 1, 0, 1,
-0.8167148, -0.3422073, -0.7399664, 0.7882353, 1, 0, 1,
-0.814958, -1.0086, -1.241779, 0.7803922, 1, 0, 1,
-0.8123581, 1.317819, -1.319159, 0.7764706, 1, 0, 1,
-0.8102549, 0.5777065, -0.342479, 0.7686275, 1, 0, 1,
-0.8101428, -0.8882473, -1.768927, 0.7647059, 1, 0, 1,
-0.8096202, -0.253186, -3.085176, 0.7568628, 1, 0, 1,
-0.8054087, 0.7160462, 0.2201146, 0.7529412, 1, 0, 1,
-0.7999628, 0.8908498, -0.4593849, 0.7450981, 1, 0, 1,
-0.7973716, -0.08976346, -3.116965, 0.7411765, 1, 0, 1,
-0.7956949, 1.20269, -0.4490986, 0.7333333, 1, 0, 1,
-0.7904991, -1.782563, -0.04723027, 0.7294118, 1, 0, 1,
-0.787369, 0.1879653, -1.265493, 0.7215686, 1, 0, 1,
-0.7862686, -0.4647679, -2.169338, 0.7176471, 1, 0, 1,
-0.7816061, -0.04342574, -0.1399184, 0.7098039, 1, 0, 1,
-0.7811332, -0.3173972, -3.540843, 0.7058824, 1, 0, 1,
-0.7775047, 1.005616, 0.6019217, 0.6980392, 1, 0, 1,
-0.7710181, -1.399996, -3.804185, 0.6901961, 1, 0, 1,
-0.7636451, 0.9935499, 0.7270999, 0.6862745, 1, 0, 1,
-0.7609309, -0.6778032, -3.364169, 0.6784314, 1, 0, 1,
-0.756339, 2.930502, 0.8896303, 0.6745098, 1, 0, 1,
-0.7559351, -2.085162, -2.126237, 0.6666667, 1, 0, 1,
-0.7554007, -1.600903, -3.083445, 0.6627451, 1, 0, 1,
-0.7526387, -0.7175004, -2.244456, 0.654902, 1, 0, 1,
-0.7502924, -0.08763172, -2.37154, 0.6509804, 1, 0, 1,
-0.7486999, 0.2763154, -2.853204, 0.6431373, 1, 0, 1,
-0.7466401, -1.39834, -3.425225, 0.6392157, 1, 0, 1,
-0.7353652, 0.06351389, -0.5771053, 0.6313726, 1, 0, 1,
-0.7350745, -0.02907521, -0.7263011, 0.627451, 1, 0, 1,
-0.7342455, 0.2359688, -1.87839, 0.6196079, 1, 0, 1,
-0.7270598, -0.9739069, -2.395088, 0.6156863, 1, 0, 1,
-0.7241907, 2.06094, 0.1835691, 0.6078432, 1, 0, 1,
-0.7207373, -0.5909847, -1.854535, 0.6039216, 1, 0, 1,
-0.7192181, -1.345061, -3.346725, 0.5960785, 1, 0, 1,
-0.7110471, 0.9449301, 0.3364662, 0.5882353, 1, 0, 1,
-0.7105695, -1.50859, -2.991608, 0.5843138, 1, 0, 1,
-0.7064216, 0.1003813, -1.081123, 0.5764706, 1, 0, 1,
-0.704282, -0.1934834, -1.32103, 0.572549, 1, 0, 1,
-0.7041692, -1.523241, -3.252833, 0.5647059, 1, 0, 1,
-0.7029407, -0.8206394, -1.327481, 0.5607843, 1, 0, 1,
-0.6999713, -1.358716, -3.259517, 0.5529412, 1, 0, 1,
-0.6950561, -1.892315, -1.36047, 0.5490196, 1, 0, 1,
-0.6948909, 1.486217, 0.1968296, 0.5411765, 1, 0, 1,
-0.6936085, -1.083314, -1.865526, 0.5372549, 1, 0, 1,
-0.6932739, 0.07324721, -2.518685, 0.5294118, 1, 0, 1,
-0.6914402, -0.4850568, -1.688563, 0.5254902, 1, 0, 1,
-0.6907117, 2.271785, 0.3885805, 0.5176471, 1, 0, 1,
-0.6889283, 0.9551204, -0.8325942, 0.5137255, 1, 0, 1,
-0.6878911, 0.6095355, -1.322165, 0.5058824, 1, 0, 1,
-0.6865036, 1.201647, 0.3294976, 0.5019608, 1, 0, 1,
-0.6845478, -0.715088, -1.464578, 0.4941176, 1, 0, 1,
-0.6816219, -1.261833, -3.969915, 0.4862745, 1, 0, 1,
-0.6771584, 0.9434488, -0.3468015, 0.4823529, 1, 0, 1,
-0.6761721, -0.5688903, -1.291168, 0.4745098, 1, 0, 1,
-0.6747245, -0.6768496, -3.353669, 0.4705882, 1, 0, 1,
-0.6695883, 0.1442664, -1.590959, 0.4627451, 1, 0, 1,
-0.6688109, 0.8222737, -1.437888, 0.4588235, 1, 0, 1,
-0.6685355, -0.3813221, -2.717472, 0.4509804, 1, 0, 1,
-0.6638483, 0.9966944, 0.617253, 0.4470588, 1, 0, 1,
-0.6622139, 0.08522912, -1.36158, 0.4392157, 1, 0, 1,
-0.6453643, -1.38897, -3.003692, 0.4352941, 1, 0, 1,
-0.6436759, -1.060628, -4.067276, 0.427451, 1, 0, 1,
-0.6399054, -0.8975086, -1.787938, 0.4235294, 1, 0, 1,
-0.6396072, 0.3092754, -1.605626, 0.4156863, 1, 0, 1,
-0.6384164, 0.01813042, -0.1388009, 0.4117647, 1, 0, 1,
-0.6367233, -1.805212, -0.6701304, 0.4039216, 1, 0, 1,
-0.6356158, 0.337188, -1.513981, 0.3960784, 1, 0, 1,
-0.6351187, 0.8913484, 0.1074517, 0.3921569, 1, 0, 1,
-0.6265895, 0.1129904, -2.438359, 0.3843137, 1, 0, 1,
-0.6255459, 1.219257, 0.717854, 0.3803922, 1, 0, 1,
-0.6240677, 0.8745376, 0.4489174, 0.372549, 1, 0, 1,
-0.6231309, 0.07081173, 0.01585049, 0.3686275, 1, 0, 1,
-0.6200893, 0.5801231, 0.01081913, 0.3607843, 1, 0, 1,
-0.6198847, -2.15802, -2.320418, 0.3568628, 1, 0, 1,
-0.6166825, -2.636756, -2.313625, 0.3490196, 1, 0, 1,
-0.6158884, 0.6376121, -0.08261734, 0.345098, 1, 0, 1,
-0.6126578, -0.1916637, -1.24473, 0.3372549, 1, 0, 1,
-0.6117187, 1.043373, 0.8099548, 0.3333333, 1, 0, 1,
-0.6117159, 0.4529833, -0.5667688, 0.3254902, 1, 0, 1,
-0.5939915, -1.011305, -1.856832, 0.3215686, 1, 0, 1,
-0.5926419, -0.7123811, -3.030792, 0.3137255, 1, 0, 1,
-0.5892368, 0.6899192, 0.5474062, 0.3098039, 1, 0, 1,
-0.5836917, 0.6452023, 0.009487592, 0.3019608, 1, 0, 1,
-0.5714174, 0.1182626, -1.824638, 0.2941177, 1, 0, 1,
-0.5697755, -0.4018169, -2.212399, 0.2901961, 1, 0, 1,
-0.5687122, -1.662683, -2.278661, 0.282353, 1, 0, 1,
-0.5671369, 0.5152888, -1.815667, 0.2784314, 1, 0, 1,
-0.5645826, 0.1063821, -1.733514, 0.2705882, 1, 0, 1,
-0.5634518, -0.1480852, -0.8190569, 0.2666667, 1, 0, 1,
-0.5621824, 0.677348, -1.956764, 0.2588235, 1, 0, 1,
-0.560889, -1.704957, -3.29817, 0.254902, 1, 0, 1,
-0.5604223, 0.6615574, -0.7376905, 0.2470588, 1, 0, 1,
-0.5556636, -0.6376088, -1.164831, 0.2431373, 1, 0, 1,
-0.5471961, -0.1630024, -1.079451, 0.2352941, 1, 0, 1,
-0.543598, -0.00128206, -0.4367369, 0.2313726, 1, 0, 1,
-0.5423716, -0.6160875, -0.5585899, 0.2235294, 1, 0, 1,
-0.53743, -1.285526, -2.938283, 0.2196078, 1, 0, 1,
-0.5352932, 1.034697, -1.073253, 0.2117647, 1, 0, 1,
-0.5351366, 0.05386339, -2.754367, 0.2078431, 1, 0, 1,
-0.5231021, -2.077549, -3.640047, 0.2, 1, 0, 1,
-0.5158324, -0.1685044, -0.7584388, 0.1921569, 1, 0, 1,
-0.5132697, -1.166911, -3.739727, 0.1882353, 1, 0, 1,
-0.5128914, -0.8781653, -3.896832, 0.1803922, 1, 0, 1,
-0.5077866, -0.5279893, -2.498491, 0.1764706, 1, 0, 1,
-0.505129, 1.848425, 0.1913213, 0.1686275, 1, 0, 1,
-0.5033111, -2.020279, -2.142408, 0.1647059, 1, 0, 1,
-0.4985516, -0.3238502, -1.011762, 0.1568628, 1, 0, 1,
-0.4900858, -0.03752824, -1.113689, 0.1529412, 1, 0, 1,
-0.4890353, -1.072872, -1.04812, 0.145098, 1, 0, 1,
-0.4868016, -0.1368041, -3.0299, 0.1411765, 1, 0, 1,
-0.485713, 0.6047328, 0.2924179, 0.1333333, 1, 0, 1,
-0.4791403, -1.522704, -2.69259, 0.1294118, 1, 0, 1,
-0.4769505, 0.1287459, 0.1752593, 0.1215686, 1, 0, 1,
-0.4750432, -0.8405442, -2.813019, 0.1176471, 1, 0, 1,
-0.4735067, -0.8315045, -3.476568, 0.1098039, 1, 0, 1,
-0.4731621, -0.2069406, -2.787312, 0.1058824, 1, 0, 1,
-0.471187, -0.1684743, -1.905145, 0.09803922, 1, 0, 1,
-0.4708072, -0.3215999, -3.106117, 0.09019608, 1, 0, 1,
-0.4664323, -1.375186, -4.185279, 0.08627451, 1, 0, 1,
-0.4661089, 0.7147785, -0.3434275, 0.07843138, 1, 0, 1,
-0.464632, -0.6383647, -2.044413, 0.07450981, 1, 0, 1,
-0.4629762, 0.9471143, 0.9758719, 0.06666667, 1, 0, 1,
-0.4612459, 0.2020872, -1.92964, 0.0627451, 1, 0, 1,
-0.4580622, 0.2561742, -0.6869404, 0.05490196, 1, 0, 1,
-0.4500288, 0.3803187, -0.6520942, 0.05098039, 1, 0, 1,
-0.4494799, -1.987448, -3.183753, 0.04313726, 1, 0, 1,
-0.4480121, -0.2502326, -2.120908, 0.03921569, 1, 0, 1,
-0.4468158, 0.4554752, -0.9072639, 0.03137255, 1, 0, 1,
-0.4429266, 1.656486, -0.5788215, 0.02745098, 1, 0, 1,
-0.4427142, -0.5164794, -1.537885, 0.01960784, 1, 0, 1,
-0.4414257, -1.129776, -3.259604, 0.01568628, 1, 0, 1,
-0.4370234, -1.43026, -3.068376, 0.007843138, 1, 0, 1,
-0.4365523, -1.699014, -3.433832, 0.003921569, 1, 0, 1,
-0.4359285, -0.7127671, -3.937498, 0, 1, 0.003921569, 1,
-0.4357987, 1.028421, -1.274038, 0, 1, 0.01176471, 1,
-0.4355497, 2.551808, -0.8984822, 0, 1, 0.01568628, 1,
-0.4339834, -2.240265, -1.198615, 0, 1, 0.02352941, 1,
-0.4320551, 0.9969373, -0.8505695, 0, 1, 0.02745098, 1,
-0.4291522, 2.465272, -1.181829, 0, 1, 0.03529412, 1,
-0.4276766, 0.6421633, -0.09578566, 0, 1, 0.03921569, 1,
-0.4261996, 0.3032397, -2.643032, 0, 1, 0.04705882, 1,
-0.4252785, -0.08362357, -2.536859, 0, 1, 0.05098039, 1,
-0.4190766, 1.662133, 0.8222554, 0, 1, 0.05882353, 1,
-0.4156027, -1.414883, -4.478847, 0, 1, 0.0627451, 1,
-0.4144094, 1.156993, -0.9408584, 0, 1, 0.07058824, 1,
-0.413671, 0.4369493, -1.787642, 0, 1, 0.07450981, 1,
-0.4119118, -1.023608, -3.736318, 0, 1, 0.08235294, 1,
-0.4086294, -0.6881512, -2.273292, 0, 1, 0.08627451, 1,
-0.4079927, -0.09383519, -1.018403, 0, 1, 0.09411765, 1,
-0.4045498, -1.03476, -3.485737, 0, 1, 0.1019608, 1,
-0.4038666, 0.9270549, 1.402956, 0, 1, 0.1058824, 1,
-0.4029517, 0.2109385, -1.718674, 0, 1, 0.1137255, 1,
-0.4007111, 0.6259413, -0.4009166, 0, 1, 0.1176471, 1,
-0.3970674, -1.965969, -2.277725, 0, 1, 0.1254902, 1,
-0.396596, 2.035354, -1.04434, 0, 1, 0.1294118, 1,
-0.3965611, -0.9003158, -3.458785, 0, 1, 0.1372549, 1,
-0.3933055, 0.3318406, 1.383565, 0, 1, 0.1411765, 1,
-0.3920781, -0.5976874, -3.21395, 0, 1, 0.1490196, 1,
-0.3917029, 0.3664314, -1.439464, 0, 1, 0.1529412, 1,
-0.3915138, -1.275342, -3.233595, 0, 1, 0.1607843, 1,
-0.3885841, -1.891057, -3.342373, 0, 1, 0.1647059, 1,
-0.3858931, 0.1007455, -1.077587, 0, 1, 0.172549, 1,
-0.3855668, 0.3144138, -0.567488, 0, 1, 0.1764706, 1,
-0.3853266, 0.5172647, 0.559048, 0, 1, 0.1843137, 1,
-0.3841916, 0.4244649, 0.03897257, 0, 1, 0.1882353, 1,
-0.3839109, -0.8039399, -3.480881, 0, 1, 0.1960784, 1,
-0.3828546, 1.097765, 0.09025453, 0, 1, 0.2039216, 1,
-0.3801548, -0.03486915, -3.740165, 0, 1, 0.2078431, 1,
-0.3730609, -1.969529, -4.282017, 0, 1, 0.2156863, 1,
-0.368755, -0.2252058, -3.58548, 0, 1, 0.2196078, 1,
-0.3654467, -0.1200283, -2.055776, 0, 1, 0.227451, 1,
-0.3606799, -1.983155, -2.445912, 0, 1, 0.2313726, 1,
-0.3599893, 0.4580255, -1.578791, 0, 1, 0.2392157, 1,
-0.3559707, 1.653201, -0.04539526, 0, 1, 0.2431373, 1,
-0.3547823, -1.108887, -4.577537, 0, 1, 0.2509804, 1,
-0.3477484, 0.5209025, -0.03596112, 0, 1, 0.254902, 1,
-0.3452935, 0.05313718, -1.401127, 0, 1, 0.2627451, 1,
-0.3433539, -0.1149091, -1.728193, 0, 1, 0.2666667, 1,
-0.33946, -0.6461313, -3.199, 0, 1, 0.2745098, 1,
-0.3361252, 0.3158989, -2.855739, 0, 1, 0.2784314, 1,
-0.3302434, -0.1747185, -2.383044, 0, 1, 0.2862745, 1,
-0.3298729, -0.2912749, -3.516845, 0, 1, 0.2901961, 1,
-0.3271772, -1.397076, -2.012963, 0, 1, 0.2980392, 1,
-0.3268897, -1.222609, -3.883612, 0, 1, 0.3058824, 1,
-0.3265026, -0.3854209, -2.946188, 0, 1, 0.3098039, 1,
-0.3259859, 0.02648739, -1.984968, 0, 1, 0.3176471, 1,
-0.3254442, 0.227, -2.317331, 0, 1, 0.3215686, 1,
-0.3248076, -0.7415105, -2.582659, 0, 1, 0.3294118, 1,
-0.3204996, -0.7949391, -2.999792, 0, 1, 0.3333333, 1,
-0.3202339, 0.8716479, 0.1046022, 0, 1, 0.3411765, 1,
-0.3161556, 1.26101, -0.9459509, 0, 1, 0.345098, 1,
-0.3157818, 0.6003421, -0.6951454, 0, 1, 0.3529412, 1,
-0.3129951, 0.6399328, -0.222917, 0, 1, 0.3568628, 1,
-0.3067387, -1.18735, -2.428419, 0, 1, 0.3647059, 1,
-0.3045017, -0.5672418, -2.547889, 0, 1, 0.3686275, 1,
-0.2961739, 0.1281247, -0.7302848, 0, 1, 0.3764706, 1,
-0.2959842, 2.130455, -0.08992462, 0, 1, 0.3803922, 1,
-0.2943973, 1.730478, 1.600969, 0, 1, 0.3882353, 1,
-0.2921805, 1.410368, -1.094373, 0, 1, 0.3921569, 1,
-0.2904827, -1.097055, -4.074068, 0, 1, 0.4, 1,
-0.28995, -0.1577053, -1.435086, 0, 1, 0.4078431, 1,
-0.2841, 0.2446579, -2.723262, 0, 1, 0.4117647, 1,
-0.2791944, 1.572007, -0.614847, 0, 1, 0.4196078, 1,
-0.2790101, 0.5489914, 0.3889304, 0, 1, 0.4235294, 1,
-0.2748331, 0.8153182, -0.3365323, 0, 1, 0.4313726, 1,
-0.2744603, -0.5449164, -2.400419, 0, 1, 0.4352941, 1,
-0.2693677, -1.062313, -1.975972, 0, 1, 0.4431373, 1,
-0.2681382, -0.967039, -2.415589, 0, 1, 0.4470588, 1,
-0.26774, -0.3649166, -2.953972, 0, 1, 0.454902, 1,
-0.2676173, 1.623423, -1.088046, 0, 1, 0.4588235, 1,
-0.2619146, 1.427647, -1.744712, 0, 1, 0.4666667, 1,
-0.2585256, 1.095691, -1.484082, 0, 1, 0.4705882, 1,
-0.2555064, 0.4831669, -0.4178099, 0, 1, 0.4784314, 1,
-0.2547615, -0.07122757, -2.000377, 0, 1, 0.4823529, 1,
-0.25346, -1.466716, -2.079153, 0, 1, 0.4901961, 1,
-0.2517669, 0.5986302, 0.003168344, 0, 1, 0.4941176, 1,
-0.2513071, 0.5013388, -0.1690993, 0, 1, 0.5019608, 1,
-0.2478013, -1.239362, -5.481884, 0, 1, 0.509804, 1,
-0.2432279, -0.3078937, -3.146636, 0, 1, 0.5137255, 1,
-0.2432252, 0.80918, 0.9935263, 0, 1, 0.5215687, 1,
-0.2420178, 1.494216, 2.276785, 0, 1, 0.5254902, 1,
-0.2347516, 0.1588021, -0.8834237, 0, 1, 0.5333334, 1,
-0.2330565, -1.495687, -3.138295, 0, 1, 0.5372549, 1,
-0.2306168, -0.3265063, -1.959864, 0, 1, 0.5450981, 1,
-0.226182, -1.9251, -4.952163, 0, 1, 0.5490196, 1,
-0.2257358, 1.306051, -2.514445, 0, 1, 0.5568628, 1,
-0.224413, 0.2574029, -1.84471, 0, 1, 0.5607843, 1,
-0.2207032, -0.7665004, -3.384752, 0, 1, 0.5686275, 1,
-0.2199185, -0.05987594, -1.634062, 0, 1, 0.572549, 1,
-0.2177314, -0.5711365, -3.347584, 0, 1, 0.5803922, 1,
-0.2165507, 1.821049, -1.635339, 0, 1, 0.5843138, 1,
-0.2157986, -0.4434869, -3.551682, 0, 1, 0.5921569, 1,
-0.2139667, -0.5793764, -3.350763, 0, 1, 0.5960785, 1,
-0.2122921, -0.4396754, -3.390715, 0, 1, 0.6039216, 1,
-0.2119355, -0.4566396, -2.591976, 0, 1, 0.6117647, 1,
-0.2080289, 2.035668, 0.5079625, 0, 1, 0.6156863, 1,
-0.2057636, -1.003554, -2.673562, 0, 1, 0.6235294, 1,
-0.203939, -1.492684, -2.635513, 0, 1, 0.627451, 1,
-0.201243, -2.11688, -1.154932, 0, 1, 0.6352941, 1,
-0.1927339, 0.2864371, -1.829738, 0, 1, 0.6392157, 1,
-0.1915841, -0.2120466, -4.025086, 0, 1, 0.6470588, 1,
-0.1884666, -0.4611926, -2.719154, 0, 1, 0.6509804, 1,
-0.1856552, 0.3985801, 0.3761352, 0, 1, 0.6588235, 1,
-0.1844644, 1.173067, 0.09849359, 0, 1, 0.6627451, 1,
-0.180745, -0.26888, -1.85552, 0, 1, 0.6705883, 1,
-0.1761563, 0.5124477, -0.7630916, 0, 1, 0.6745098, 1,
-0.1750667, -1.19867, -2.579744, 0, 1, 0.682353, 1,
-0.1748044, 1.351833, -0.8689885, 0, 1, 0.6862745, 1,
-0.1729884, 0.4338401, 1.086091, 0, 1, 0.6941177, 1,
-0.1697322, -0.6243467, -3.663173, 0, 1, 0.7019608, 1,
-0.1662491, 0.4725448, -0.2911373, 0, 1, 0.7058824, 1,
-0.1659918, 0.7250401, 0.1161303, 0, 1, 0.7137255, 1,
-0.1612644, -0.009740275, -1.587362, 0, 1, 0.7176471, 1,
-0.1585662, -0.1467724, -3.358017, 0, 1, 0.7254902, 1,
-0.1582248, -0.9674334, -3.071715, 0, 1, 0.7294118, 1,
-0.158006, -0.5982247, -3.720397, 0, 1, 0.7372549, 1,
-0.1562537, 0.5301159, -0.04442755, 0, 1, 0.7411765, 1,
-0.1539066, -0.087718, -2.297789, 0, 1, 0.7490196, 1,
-0.1538375, -0.6373262, -4.690714, 0, 1, 0.7529412, 1,
-0.1506164, -2.451364, -3.967008, 0, 1, 0.7607843, 1,
-0.1458644, 0.890823, 1.507127, 0, 1, 0.7647059, 1,
-0.1451441, 1.979274, -0.2191563, 0, 1, 0.772549, 1,
-0.1435292, -0.6628026, -3.189257, 0, 1, 0.7764706, 1,
-0.1420233, 0.3961506, -1.523069, 0, 1, 0.7843137, 1,
-0.1407484, -0.2619964, -4.002501, 0, 1, 0.7882353, 1,
-0.1383673, -0.02498492, -0.9671769, 0, 1, 0.7960784, 1,
-0.1374371, 1.713662, 0.6963514, 0, 1, 0.8039216, 1,
-0.135242, 0.7274908, 0.3345896, 0, 1, 0.8078431, 1,
-0.1345854, 0.6943804, 0.4197212, 0, 1, 0.8156863, 1,
-0.1286076, 1.190499, -1.626898, 0, 1, 0.8196079, 1,
-0.1266829, -0.1315539, -2.423968, 0, 1, 0.827451, 1,
-0.1234775, -0.3063777, -2.401444, 0, 1, 0.8313726, 1,
-0.1200098, -0.6525629, -4.090407, 0, 1, 0.8392157, 1,
-0.1094825, 1.719453, -0.757176, 0, 1, 0.8431373, 1,
-0.1051755, -0.3887338, -4.886364, 0, 1, 0.8509804, 1,
-0.1003431, 1.498581, -1.561454, 0, 1, 0.854902, 1,
-0.09754235, -0.5041828, -2.979605, 0, 1, 0.8627451, 1,
-0.09605319, 0.2878481, -0.6134374, 0, 1, 0.8666667, 1,
-0.09082106, -0.3140368, -2.101135, 0, 1, 0.8745098, 1,
-0.08502645, 0.299873, -0.4090575, 0, 1, 0.8784314, 1,
-0.08322075, -1.140633, -2.384064, 0, 1, 0.8862745, 1,
-0.07813477, -1.579315, -0.7629837, 0, 1, 0.8901961, 1,
-0.07789145, 2.728565, 1.126685, 0, 1, 0.8980392, 1,
-0.07649531, -0.03702289, -2.723089, 0, 1, 0.9058824, 1,
-0.07407356, 0.4685462, -0.02840527, 0, 1, 0.9098039, 1,
-0.07403402, 2.216599, -0.3275131, 0, 1, 0.9176471, 1,
-0.06942029, -1.179, -3.961092, 0, 1, 0.9215686, 1,
-0.0662767, -0.4767947, -3.011794, 0, 1, 0.9294118, 1,
-0.06613129, 1.061974, -0.6217396, 0, 1, 0.9333333, 1,
-0.06425528, 0.834821, 0.1866376, 0, 1, 0.9411765, 1,
-0.06255326, -0.976455, -4.615809, 0, 1, 0.945098, 1,
-0.0612921, -0.5451199, -2.720379, 0, 1, 0.9529412, 1,
-0.0606841, -0.7814723, -2.423108, 0, 1, 0.9568627, 1,
-0.05851837, -1.265408, -2.37682, 0, 1, 0.9647059, 1,
-0.05597122, 0.6318533, -0.06760717, 0, 1, 0.9686275, 1,
-0.05099443, -0.9004684, -2.061745, 0, 1, 0.9764706, 1,
-0.04195393, -0.3459556, -1.797129, 0, 1, 0.9803922, 1,
-0.03854667, -0.66576, -3.647185, 0, 1, 0.9882353, 1,
-0.0355756, -0.7080965, -3.691088, 0, 1, 0.9921569, 1,
-0.03507276, -0.3617005, -4.28406, 0, 1, 1, 1,
-0.03025895, 1.640381, 0.4969827, 0, 0.9921569, 1, 1,
-0.02905911, -0.1242905, -2.853149, 0, 0.9882353, 1, 1,
-0.02542039, 0.9683774, -1.450496, 0, 0.9803922, 1, 1,
-0.0248001, -0.5894673, -3.90264, 0, 0.9764706, 1, 1,
-0.02330616, 1.417106, -0.2590767, 0, 0.9686275, 1, 1,
-0.02068142, -0.09692024, -2.168299, 0, 0.9647059, 1, 1,
-0.02040314, 1.681084, 0.0810541, 0, 0.9568627, 1, 1,
-0.01907582, 0.6888739, -0.4503779, 0, 0.9529412, 1, 1,
-0.01886419, 1.827868, 0.156609, 0, 0.945098, 1, 1,
-0.0177518, -1.471504, -2.217891, 0, 0.9411765, 1, 1,
-0.01654921, -0.539181, -4.555712, 0, 0.9333333, 1, 1,
-0.01237618, -0.7752087, -2.912001, 0, 0.9294118, 1, 1,
-0.009449785, -1.16926, -3.757607, 0, 0.9215686, 1, 1,
-0.009405679, -0.8892691, -3.929023, 0, 0.9176471, 1, 1,
-0.008368001, 2.031162, 0.8358019, 0, 0.9098039, 1, 1,
-0.006771153, 0.08176684, -1.344998, 0, 0.9058824, 1, 1,
-0.005105168, 1.291691, -0.1305177, 0, 0.8980392, 1, 1,
-0.002456562, -0.005934281, -3.301031, 0, 0.8901961, 1, 1,
0.005410598, -1.274012, 3.58708, 0, 0.8862745, 1, 1,
0.005535424, -1.76316, 4.011708, 0, 0.8784314, 1, 1,
0.005874701, 0.8121424, 0.06397891, 0, 0.8745098, 1, 1,
0.008081696, 1.855157, -0.5720668, 0, 0.8666667, 1, 1,
0.008091191, 0.7711579, 0.985155, 0, 0.8627451, 1, 1,
0.01191823, -0.3251422, 2.498677, 0, 0.854902, 1, 1,
0.01501704, -0.3887401, 3.277937, 0, 0.8509804, 1, 1,
0.01532426, -1.094925, 4.275298, 0, 0.8431373, 1, 1,
0.01794653, 0.8334194, -0.5454173, 0, 0.8392157, 1, 1,
0.02092116, 1.252038, 0.6051433, 0, 0.8313726, 1, 1,
0.03209894, 1.093292, 1.476251, 0, 0.827451, 1, 1,
0.0333878, -0.02474576, 1.974758, 0, 0.8196079, 1, 1,
0.03499113, 0.2446782, -0.4003714, 0, 0.8156863, 1, 1,
0.0362736, -1.740207, 4.141909, 0, 0.8078431, 1, 1,
0.03982988, -0.6250674, 2.283624, 0, 0.8039216, 1, 1,
0.04183077, 1.27484, -1.337514, 0, 0.7960784, 1, 1,
0.04519075, -0.6581798, 2.808352, 0, 0.7882353, 1, 1,
0.04827847, -1.663711, 2.994806, 0, 0.7843137, 1, 1,
0.05204681, -0.3869109, 3.572814, 0, 0.7764706, 1, 1,
0.05502951, 1.543617, 0.5635228, 0, 0.772549, 1, 1,
0.06009797, -0.5052482, 3.488118, 0, 0.7647059, 1, 1,
0.06486052, 0.4743157, 0.181134, 0, 0.7607843, 1, 1,
0.06506741, -1.964657, 3.8086, 0, 0.7529412, 1, 1,
0.07471091, 0.7053784, 0.8654699, 0, 0.7490196, 1, 1,
0.0751247, -0.08458558, 3.910738, 0, 0.7411765, 1, 1,
0.07738473, -0.7585826, 3.028209, 0, 0.7372549, 1, 1,
0.07985306, 0.6292339, -1.824167, 0, 0.7294118, 1, 1,
0.08643557, 1.219275, 0.9838707, 0, 0.7254902, 1, 1,
0.09332969, 0.4880884, 0.06584816, 0, 0.7176471, 1, 1,
0.09454248, 0.6938433, -1.530444, 0, 0.7137255, 1, 1,
0.09575044, -0.1302355, 2.426856, 0, 0.7058824, 1, 1,
0.0966934, -1.618215, 3.632713, 0, 0.6980392, 1, 1,
0.09681111, -0.9077293, 0.9674279, 0, 0.6941177, 1, 1,
0.1004581, -1.017988, 2.03361, 0, 0.6862745, 1, 1,
0.1041052, 0.7270306, 0.1081759, 0, 0.682353, 1, 1,
0.1079565, 0.5569883, -0.8945505, 0, 0.6745098, 1, 1,
0.1156924, -0.5143366, 3.410461, 0, 0.6705883, 1, 1,
0.1200978, -1.901774, 4.778943, 0, 0.6627451, 1, 1,
0.1202431, -0.4420936, 1.917046, 0, 0.6588235, 1, 1,
0.1213438, -1.128861, 4.792684, 0, 0.6509804, 1, 1,
0.1235844, -0.01741591, 0.9304844, 0, 0.6470588, 1, 1,
0.127265, 1.558618, -0.673973, 0, 0.6392157, 1, 1,
0.1293561, 1.944065, -0.8432304, 0, 0.6352941, 1, 1,
0.1334967, -3.021291, 4.473676, 0, 0.627451, 1, 1,
0.1399569, -0.7385764, 2.920017, 0, 0.6235294, 1, 1,
0.1412488, -0.5991005, 2.051407, 0, 0.6156863, 1, 1,
0.1451647, 0.3234485, 1.83298, 0, 0.6117647, 1, 1,
0.1459642, 0.1249552, -0.5180553, 0, 0.6039216, 1, 1,
0.1498845, 0.8994108, -1.636372, 0, 0.5960785, 1, 1,
0.150894, 0.624958, -0.7751153, 0, 0.5921569, 1, 1,
0.1556446, 0.9702209, 2.529786, 0, 0.5843138, 1, 1,
0.1585399, 2.894211, -0.5023628, 0, 0.5803922, 1, 1,
0.1586863, 0.6446609, 1.247276, 0, 0.572549, 1, 1,
0.1605702, -1.102717, 2.125103, 0, 0.5686275, 1, 1,
0.1639955, -0.47433, 1.686742, 0, 0.5607843, 1, 1,
0.1674275, -0.2819629, 2.13612, 0, 0.5568628, 1, 1,
0.1688446, 1.171086, 0.8985109, 0, 0.5490196, 1, 1,
0.1693099, 1.119746, -0.5021747, 0, 0.5450981, 1, 1,
0.1740678, 0.9172755, 1.253279, 0, 0.5372549, 1, 1,
0.174291, -1.899336, 2.641134, 0, 0.5333334, 1, 1,
0.1751163, 0.1038646, 0.3759429, 0, 0.5254902, 1, 1,
0.1801745, 0.686056, 1.196993, 0, 0.5215687, 1, 1,
0.1832868, 1.347631, 1.053545, 0, 0.5137255, 1, 1,
0.1834096, 0.6374491, 1.412486, 0, 0.509804, 1, 1,
0.1845685, 1.104328, -1.183522, 0, 0.5019608, 1, 1,
0.1868491, 1.399644, -0.8851751, 0, 0.4941176, 1, 1,
0.1888462, -0.3268329, 2.240764, 0, 0.4901961, 1, 1,
0.1897936, -0.5796862, 4.748066, 0, 0.4823529, 1, 1,
0.191067, 1.121718, -0.9102287, 0, 0.4784314, 1, 1,
0.1938056, 0.4701869, 0.5832332, 0, 0.4705882, 1, 1,
0.1950921, 0.06994481, 1.392128, 0, 0.4666667, 1, 1,
0.1975503, -0.3803177, 1.48439, 0, 0.4588235, 1, 1,
0.1990389, 0.05122576, 0.120643, 0, 0.454902, 1, 1,
0.2037225, -0.8360843, 2.635092, 0, 0.4470588, 1, 1,
0.2045867, 0.6634989, 0.4052832, 0, 0.4431373, 1, 1,
0.2076365, 1.223236, 0.9809166, 0, 0.4352941, 1, 1,
0.2081863, 0.3095104, 0.6741717, 0, 0.4313726, 1, 1,
0.208496, -0.1161271, 3.752942, 0, 0.4235294, 1, 1,
0.223389, -0.7302058, 3.655045, 0, 0.4196078, 1, 1,
0.229876, 1.747813, 0.03457774, 0, 0.4117647, 1, 1,
0.2299025, -0.001671456, 3.252064, 0, 0.4078431, 1, 1,
0.23276, -2.500762, 2.644183, 0, 0.4, 1, 1,
0.2333188, -0.6067117, 3.355554, 0, 0.3921569, 1, 1,
0.2350606, -0.1074901, 2.519725, 0, 0.3882353, 1, 1,
0.2373777, -0.74737, 1.69704, 0, 0.3803922, 1, 1,
0.2394761, 1.394387, -0.2878071, 0, 0.3764706, 1, 1,
0.2405694, -1.671922, 3.269348, 0, 0.3686275, 1, 1,
0.2424004, -0.4710797, 2.330589, 0, 0.3647059, 1, 1,
0.2440387, -0.8351564, 2.848493, 0, 0.3568628, 1, 1,
0.2456179, 0.6755237, 1.260316, 0, 0.3529412, 1, 1,
0.2461452, -0.7407453, 1.555054, 0, 0.345098, 1, 1,
0.2463103, 0.3232843, 1.584742, 0, 0.3411765, 1, 1,
0.2489695, 2.450658, -0.1660708, 0, 0.3333333, 1, 1,
0.2500686, 0.8659639, 0.1159365, 0, 0.3294118, 1, 1,
0.2502066, 0.7607469, -0.7460383, 0, 0.3215686, 1, 1,
0.2514004, -0.1720249, 3.173635, 0, 0.3176471, 1, 1,
0.2529425, 0.2559263, 2.69025, 0, 0.3098039, 1, 1,
0.2559145, 0.3301461, 2.001116, 0, 0.3058824, 1, 1,
0.2563463, -0.93918, 3.096584, 0, 0.2980392, 1, 1,
0.2593245, 1.095385, 0.8414655, 0, 0.2901961, 1, 1,
0.2627936, 1.159893, -0.7092721, 0, 0.2862745, 1, 1,
0.2663082, 0.6719682, 0.4014597, 0, 0.2784314, 1, 1,
0.2672914, -0.9541716, 1.599492, 0, 0.2745098, 1, 1,
0.2682113, -0.2281099, 2.706409, 0, 0.2666667, 1, 1,
0.2694439, 0.9495304, -1.795396, 0, 0.2627451, 1, 1,
0.2749226, 1.963889, 1.042509, 0, 0.254902, 1, 1,
0.283145, -0.2867262, 4.317483, 0, 0.2509804, 1, 1,
0.2861013, -0.7513007, 3.629929, 0, 0.2431373, 1, 1,
0.2909397, -1.077623, 4.423751, 0, 0.2392157, 1, 1,
0.2911357, 0.4215068, -0.5447941, 0, 0.2313726, 1, 1,
0.2917018, -1.007328, 2.320112, 0, 0.227451, 1, 1,
0.2920801, 1.110036, -1.284219, 0, 0.2196078, 1, 1,
0.3010109, -0.4278412, 1.268339, 0, 0.2156863, 1, 1,
0.3104984, 0.2738569, 1.678173, 0, 0.2078431, 1, 1,
0.3136119, 0.3992698, -0.4684509, 0, 0.2039216, 1, 1,
0.3178785, 0.8343822, 0.4970433, 0, 0.1960784, 1, 1,
0.3190972, -0.1939243, 1.895123, 0, 0.1882353, 1, 1,
0.3195305, 0.2416653, 0.301701, 0, 0.1843137, 1, 1,
0.3219524, 0.1355252, 3.655259, 0, 0.1764706, 1, 1,
0.3232392, -2.242213, 4.044852, 0, 0.172549, 1, 1,
0.3257657, 1.39017, 0.1572167, 0, 0.1647059, 1, 1,
0.3273892, 0.5438825, 1.018347, 0, 0.1607843, 1, 1,
0.3317455, 0.555994, 0.9786048, 0, 0.1529412, 1, 1,
0.3317693, 0.6574284, -0.3909293, 0, 0.1490196, 1, 1,
0.3358309, 1.715383, 1.086789, 0, 0.1411765, 1, 1,
0.3379936, -1.087914, 4.754317, 0, 0.1372549, 1, 1,
0.3425547, 0.4813628, 0.970969, 0, 0.1294118, 1, 1,
0.3448733, -0.5664703, 0.9005061, 0, 0.1254902, 1, 1,
0.3491604, -1.030513, 2.244905, 0, 0.1176471, 1, 1,
0.3548028, -0.01397048, 1.10848, 0, 0.1137255, 1, 1,
0.3564954, -0.5194284, 2.198967, 0, 0.1058824, 1, 1,
0.3589992, 0.6766906, 0.3152307, 0, 0.09803922, 1, 1,
0.360775, 1.855822, -0.1288981, 0, 0.09411765, 1, 1,
0.3636399, 1.254745, 1.1239, 0, 0.08627451, 1, 1,
0.3669131, -2.121214, 3.788695, 0, 0.08235294, 1, 1,
0.3674799, 1.308531, -0.08229131, 0, 0.07450981, 1, 1,
0.3707612, -0.9311532, 2.534746, 0, 0.07058824, 1, 1,
0.3749539, 0.4148208, 0.9413176, 0, 0.0627451, 1, 1,
0.3756435, 1.418243, -0.9386308, 0, 0.05882353, 1, 1,
0.3763553, -0.8159151, 1.811554, 0, 0.05098039, 1, 1,
0.3798499, -0.06224602, 3.219293, 0, 0.04705882, 1, 1,
0.3852517, -1.567599, 2.014704, 0, 0.03921569, 1, 1,
0.3877664, -1.558821, 2.46704, 0, 0.03529412, 1, 1,
0.3879099, 0.1874679, 1.064147, 0, 0.02745098, 1, 1,
0.3974217, -0.6202756, 2.318032, 0, 0.02352941, 1, 1,
0.4005515, 0.667133, 0.8689164, 0, 0.01568628, 1, 1,
0.4106943, -0.1130235, 1.839151, 0, 0.01176471, 1, 1,
0.4162564, -1.0033, 2.852345, 0, 0.003921569, 1, 1,
0.4179516, 1.914194, -0.4828157, 0.003921569, 0, 1, 1,
0.4209615, -0.3573398, 0.3339994, 0.007843138, 0, 1, 1,
0.4212605, -0.4703313, 3.574542, 0.01568628, 0, 1, 1,
0.4276855, -0.7713598, 2.235391, 0.01960784, 0, 1, 1,
0.4290142, -1.070348, 1.633994, 0.02745098, 0, 1, 1,
0.4305164, 1.461721, 0.6646528, 0.03137255, 0, 1, 1,
0.4320181, -1.366963, 2.044816, 0.03921569, 0, 1, 1,
0.4371695, -0.6076641, 1.233601, 0.04313726, 0, 1, 1,
0.4433604, 0.4160026, 1.642637, 0.05098039, 0, 1, 1,
0.4507866, -1.473373, 1.636107, 0.05490196, 0, 1, 1,
0.4575104, -0.05392351, 3.694357, 0.0627451, 0, 1, 1,
0.458878, 0.852913, 0.8263373, 0.06666667, 0, 1, 1,
0.4590899, 0.3362536, 0.3837357, 0.07450981, 0, 1, 1,
0.4611788, 0.2029776, 1.077248, 0.07843138, 0, 1, 1,
0.4616563, 0.7751034, 2.399266, 0.08627451, 0, 1, 1,
0.4633992, -0.3541862, 1.479424, 0.09019608, 0, 1, 1,
0.4650518, -0.8798862, 2.810363, 0.09803922, 0, 1, 1,
0.4674152, 0.1482445, -0.280345, 0.1058824, 0, 1, 1,
0.469835, 0.3610773, 0.7369755, 0.1098039, 0, 1, 1,
0.472799, 2.515305, -0.4815698, 0.1176471, 0, 1, 1,
0.4740234, -0.7881017, 2.295393, 0.1215686, 0, 1, 1,
0.4742682, -0.7440147, 1.368564, 0.1294118, 0, 1, 1,
0.4744645, 1.656577, 1.039139, 0.1333333, 0, 1, 1,
0.4763836, 2.146705, 1.163755, 0.1411765, 0, 1, 1,
0.4764506, -0.1464387, 2.574017, 0.145098, 0, 1, 1,
0.4764787, 1.203546, -0.3896323, 0.1529412, 0, 1, 1,
0.4782088, 0.5760754, -2.743163, 0.1568628, 0, 1, 1,
0.4803741, 0.2721136, 2.81861, 0.1647059, 0, 1, 1,
0.4822749, -0.06968904, 1.13345, 0.1686275, 0, 1, 1,
0.4841878, 1.02889, 0.4581986, 0.1764706, 0, 1, 1,
0.4849635, 0.4582826, 0.9821098, 0.1803922, 0, 1, 1,
0.4902051, -0.4383259, 1.551646, 0.1882353, 0, 1, 1,
0.4939039, 0.2448922, 0.4589109, 0.1921569, 0, 1, 1,
0.502896, 0.6752155, 1.743237, 0.2, 0, 1, 1,
0.5030537, 0.02716939, 1.912903, 0.2078431, 0, 1, 1,
0.5042542, 0.378858, 1.380728, 0.2117647, 0, 1, 1,
0.5090563, 0.8097485, 0.3015734, 0.2196078, 0, 1, 1,
0.514423, -0.02194511, 2.653871, 0.2235294, 0, 1, 1,
0.5147709, -0.6561773, 2.538277, 0.2313726, 0, 1, 1,
0.5176713, 0.1702107, 1.778953, 0.2352941, 0, 1, 1,
0.5206015, -1.658025, 2.769482, 0.2431373, 0, 1, 1,
0.5235912, -0.05074923, 0.1482379, 0.2470588, 0, 1, 1,
0.5256985, -0.072198, -0.2276196, 0.254902, 0, 1, 1,
0.528779, -0.8533611, 3.343459, 0.2588235, 0, 1, 1,
0.5306136, 0.3926315, 0.351611, 0.2666667, 0, 1, 1,
0.530652, 1.287346, 1.531028, 0.2705882, 0, 1, 1,
0.5347404, 0.8674484, 1.049101, 0.2784314, 0, 1, 1,
0.5352047, -0.2769128, 4.41785, 0.282353, 0, 1, 1,
0.5359663, -0.5926086, 2.822493, 0.2901961, 0, 1, 1,
0.5366147, -0.3255116, 1.871178, 0.2941177, 0, 1, 1,
0.5381508, 0.07342266, 2.11064, 0.3019608, 0, 1, 1,
0.5418367, 0.7515101, -1.10465, 0.3098039, 0, 1, 1,
0.5458724, 0.1889095, 1.273965, 0.3137255, 0, 1, 1,
0.5462446, 0.9383327, 0.5837981, 0.3215686, 0, 1, 1,
0.5508776, -0.3172237, 2.225141, 0.3254902, 0, 1, 1,
0.5514507, -0.2824312, 2.723605, 0.3333333, 0, 1, 1,
0.5554678, 0.8404929, 1.677119, 0.3372549, 0, 1, 1,
0.5574184, 0.4807218, -0.5613532, 0.345098, 0, 1, 1,
0.5579951, 0.7564642, 0.4852546, 0.3490196, 0, 1, 1,
0.5631125, 1.472061, 2.540509, 0.3568628, 0, 1, 1,
0.5631999, 1.95219, 0.4163141, 0.3607843, 0, 1, 1,
0.5633631, -0.1259631, 3.391389, 0.3686275, 0, 1, 1,
0.5641221, -0.9216347, 2.89336, 0.372549, 0, 1, 1,
0.567202, -1.109222, 2.53472, 0.3803922, 0, 1, 1,
0.5676881, -0.5042827, 3.018095, 0.3843137, 0, 1, 1,
0.5718368, -1.201169, 0.9370054, 0.3921569, 0, 1, 1,
0.5754921, -0.4143904, 3.439202, 0.3960784, 0, 1, 1,
0.5768762, -0.7370557, 2.999798, 0.4039216, 0, 1, 1,
0.5809518, 0.6209785, 2.286797, 0.4117647, 0, 1, 1,
0.5812401, 0.8501821, 0.5744163, 0.4156863, 0, 1, 1,
0.5852517, 1.899169, -1.649952, 0.4235294, 0, 1, 1,
0.5865666, -0.2879984, 1.171073, 0.427451, 0, 1, 1,
0.5877324, 0.3442595, 1.918002, 0.4352941, 0, 1, 1,
0.5893288, 0.3185815, 0.6100765, 0.4392157, 0, 1, 1,
0.5924369, -1.720981, 3.530083, 0.4470588, 0, 1, 1,
0.5963168, -0.4499164, 4.621492, 0.4509804, 0, 1, 1,
0.6019732, -0.8508316, 1.489226, 0.4588235, 0, 1, 1,
0.6026202, -1.058795, 2.408526, 0.4627451, 0, 1, 1,
0.6066807, -0.1576867, 1.857288, 0.4705882, 0, 1, 1,
0.6105039, 0.7411936, 1.259389, 0.4745098, 0, 1, 1,
0.6147903, -0.314732, 1.6333, 0.4823529, 0, 1, 1,
0.615445, -0.4178345, 3.888478, 0.4862745, 0, 1, 1,
0.6208579, -1.093009, 2.25361, 0.4941176, 0, 1, 1,
0.6235365, 0.2541879, 2.052992, 0.5019608, 0, 1, 1,
0.6257238, -1.711659, 2.7696, 0.5058824, 0, 1, 1,
0.6276233, -0.426535, 0.7134442, 0.5137255, 0, 1, 1,
0.6345733, 1.389, 0.375131, 0.5176471, 0, 1, 1,
0.6365916, -0.3890814, 1.026603, 0.5254902, 0, 1, 1,
0.6430036, -0.03281182, 0.8443264, 0.5294118, 0, 1, 1,
0.6469486, -0.5183507, 3.755619, 0.5372549, 0, 1, 1,
0.6474776, -0.2950221, 1.733592, 0.5411765, 0, 1, 1,
0.6493538, 0.1257362, 0.8569061, 0.5490196, 0, 1, 1,
0.6536105, -0.7384162, 1.356489, 0.5529412, 0, 1, 1,
0.655035, -0.5872586, 1.690173, 0.5607843, 0, 1, 1,
0.6557772, -1.461037, 2.695125, 0.5647059, 0, 1, 1,
0.6608272, 1.126446, 0.3235581, 0.572549, 0, 1, 1,
0.6612728, 0.3834715, -0.3235785, 0.5764706, 0, 1, 1,
0.6639281, 2.409908, 1.239636, 0.5843138, 0, 1, 1,
0.6648577, -0.4100087, 2.283885, 0.5882353, 0, 1, 1,
0.6732574, -1.062057, 2.905495, 0.5960785, 0, 1, 1,
0.6745744, -0.565038, 3.631785, 0.6039216, 0, 1, 1,
0.6792349, -0.2707569, 1.032232, 0.6078432, 0, 1, 1,
0.6794896, 0.8433522, -0.2117263, 0.6156863, 0, 1, 1,
0.680088, 0.4834382, -0.5232687, 0.6196079, 0, 1, 1,
0.6818228, 0.18098, 0.2465393, 0.627451, 0, 1, 1,
0.6884289, 1.167107, 1.443635, 0.6313726, 0, 1, 1,
0.6889637, 0.5738159, 0.7637072, 0.6392157, 0, 1, 1,
0.6922736, -0.1479075, 3.038052, 0.6431373, 0, 1, 1,
0.6928901, 2.267817, 0.7687712, 0.6509804, 0, 1, 1,
0.6951874, 0.6552928, 1.918431, 0.654902, 0, 1, 1,
0.7001334, 0.5525958, 0.8109114, 0.6627451, 0, 1, 1,
0.7067671, -1.050307, 2.269834, 0.6666667, 0, 1, 1,
0.7156914, -1.067443, 4.587496, 0.6745098, 0, 1, 1,
0.7186996, 0.9752756, 1.262648, 0.6784314, 0, 1, 1,
0.7202356, 0.355658, 0.345001, 0.6862745, 0, 1, 1,
0.7262079, 0.7390237, 0.5432171, 0.6901961, 0, 1, 1,
0.7305322, -1.716515, 3.979238, 0.6980392, 0, 1, 1,
0.737116, -0.5711099, 2.404612, 0.7058824, 0, 1, 1,
0.7394356, 0.1500345, 2.272733, 0.7098039, 0, 1, 1,
0.7433868, -0.5983196, 3.419328, 0.7176471, 0, 1, 1,
0.7492874, 0.7432511, -0.03764387, 0.7215686, 0, 1, 1,
0.7523418, 1.271984, 1.688951, 0.7294118, 0, 1, 1,
0.7611532, 1.288406, 0.4976553, 0.7333333, 0, 1, 1,
0.7628282, -0.2176997, 3.251445, 0.7411765, 0, 1, 1,
0.773305, -0.1145524, 1.468416, 0.7450981, 0, 1, 1,
0.7875329, -3.371153, 2.911953, 0.7529412, 0, 1, 1,
0.7878993, -1.019284, 2.095622, 0.7568628, 0, 1, 1,
0.7889517, -0.1184277, 1.470575, 0.7647059, 0, 1, 1,
0.7889857, -3.027805, 2.667371, 0.7686275, 0, 1, 1,
0.7890924, 1.738631, 0.8707997, 0.7764706, 0, 1, 1,
0.7896987, -0.5435948, 1.846302, 0.7803922, 0, 1, 1,
0.7903471, -0.743516, 1.413025, 0.7882353, 0, 1, 1,
0.7907308, 1.309891, 0.8750952, 0.7921569, 0, 1, 1,
0.7933224, -0.4355673, 2.718848, 0.8, 0, 1, 1,
0.8049682, -0.5679092, 0.8936299, 0.8078431, 0, 1, 1,
0.8093856, -0.9677843, 2.476886, 0.8117647, 0, 1, 1,
0.8137408, 0.7056748, 1.681046, 0.8196079, 0, 1, 1,
0.8150636, 0.1581728, 1.89706, 0.8235294, 0, 1, 1,
0.8162129, 1.172228, -1.347966, 0.8313726, 0, 1, 1,
0.8163788, 1.113092, 0.1315846, 0.8352941, 0, 1, 1,
0.8165727, 1.703844, 1.206965, 0.8431373, 0, 1, 1,
0.8184282, -1.337892, 2.86733, 0.8470588, 0, 1, 1,
0.823983, -0.2889471, 2.538908, 0.854902, 0, 1, 1,
0.8253818, -0.1166145, 4.880819, 0.8588235, 0, 1, 1,
0.8307856, 0.1194682, 2.213905, 0.8666667, 0, 1, 1,
0.8322034, 0.7659757, -0.5583284, 0.8705882, 0, 1, 1,
0.8351903, 0.979238, 0.8404238, 0.8784314, 0, 1, 1,
0.8374816, 0.9330339, 0.6327579, 0.8823529, 0, 1, 1,
0.8403044, -1.856527, 2.690692, 0.8901961, 0, 1, 1,
0.843227, 0.0263279, 1.790647, 0.8941177, 0, 1, 1,
0.8473343, 0.8565583, -0.2382675, 0.9019608, 0, 1, 1,
0.8554912, 0.7270662, 1.855612, 0.9098039, 0, 1, 1,
0.8572187, 0.9616603, 0.1630419, 0.9137255, 0, 1, 1,
0.869192, 0.4813184, 0.1606644, 0.9215686, 0, 1, 1,
0.8725872, 0.7107021, 0.01299435, 0.9254902, 0, 1, 1,
0.8726646, 0.009749753, 1.945561, 0.9333333, 0, 1, 1,
0.8763424, -0.5762514, 3.135761, 0.9372549, 0, 1, 1,
0.8777978, -1.334779, 3.688521, 0.945098, 0, 1, 1,
0.8788362, 0.518966, -0.8510109, 0.9490196, 0, 1, 1,
0.8794737, -0.2208501, 1.551171, 0.9568627, 0, 1, 1,
0.8878238, 2.082808, -0.626132, 0.9607843, 0, 1, 1,
0.8943619, 1.478026, 0.6321899, 0.9686275, 0, 1, 1,
0.895245, 0.1180884, 2.753352, 0.972549, 0, 1, 1,
0.9021603, 0.2280469, 0.8234537, 0.9803922, 0, 1, 1,
0.9035283, -0.0543557, 0.9491845, 0.9843137, 0, 1, 1,
0.91369, -1.119135, 2.253671, 0.9921569, 0, 1, 1,
0.9144829, 1.506799, -0.590503, 0.9960784, 0, 1, 1,
0.9150169, 0.7400163, 0.8805808, 1, 0, 0.9960784, 1,
0.9153924, -0.5118632, 2.09256, 1, 0, 0.9882353, 1,
0.9165093, 1.551377, 0.1989203, 1, 0, 0.9843137, 1,
0.9230642, 1.07985, 1.231881, 1, 0, 0.9764706, 1,
0.9244465, -0.06759994, 1.722293, 1, 0, 0.972549, 1,
0.9386173, 0.377608, 1.744501, 1, 0, 0.9647059, 1,
0.9433679, -2.294669, 1.790265, 1, 0, 0.9607843, 1,
0.943509, 0.3666672, 1.453148, 1, 0, 0.9529412, 1,
0.9521012, -1.414389, 1.096627, 1, 0, 0.9490196, 1,
0.9589402, -0.09633149, 3.025872, 1, 0, 0.9411765, 1,
0.959941, -1.066949, 2.85787, 1, 0, 0.9372549, 1,
0.9605097, 0.0513988, 2.296294, 1, 0, 0.9294118, 1,
0.9625661, 0.4568246, 0.6392555, 1, 0, 0.9254902, 1,
0.9636084, 0.8165857, 1.835505, 1, 0, 0.9176471, 1,
0.9639036, 0.2634714, 3.656016, 1, 0, 0.9137255, 1,
0.967456, -0.1426587, 1.173951, 1, 0, 0.9058824, 1,
0.9685333, -0.2442058, 3.313644, 1, 0, 0.9019608, 1,
0.9811434, 0.09597976, -0.05836247, 1, 0, 0.8941177, 1,
0.9917966, 0.5435202, 0.1811267, 1, 0, 0.8862745, 1,
0.992166, 0.3712853, 2.567046, 1, 0, 0.8823529, 1,
0.9992315, -0.4946219, 1.928384, 1, 0, 0.8745098, 1,
1.000423, -0.5338498, 2.574382, 1, 0, 0.8705882, 1,
1.001754, -0.498034, 1.801492, 1, 0, 0.8627451, 1,
1.008429, -0.6394438, 0.7383125, 1, 0, 0.8588235, 1,
1.014663, 1.084587, 1.742166, 1, 0, 0.8509804, 1,
1.016987, 0.1433518, 0.9001991, 1, 0, 0.8470588, 1,
1.025444, 0.0121465, 0.4508679, 1, 0, 0.8392157, 1,
1.031574, 0.5227113, 1.165918, 1, 0, 0.8352941, 1,
1.040712, -0.04780277, 1.85332, 1, 0, 0.827451, 1,
1.042629, 0.2802682, 1.223899, 1, 0, 0.8235294, 1,
1.047894, 0.1449422, 1.21477, 1, 0, 0.8156863, 1,
1.061945, 0.9347592, 1.15405, 1, 0, 0.8117647, 1,
1.066796, 0.6236709, 0.875202, 1, 0, 0.8039216, 1,
1.075968, -1.239579, 2.516646, 1, 0, 0.7960784, 1,
1.077469, -0.2983255, 0.7314624, 1, 0, 0.7921569, 1,
1.081175, -0.4153135, 2.331413, 1, 0, 0.7843137, 1,
1.095562, -0.8798508, 1.496625, 1, 0, 0.7803922, 1,
1.096984, -0.1027695, 2.34395, 1, 0, 0.772549, 1,
1.099946, -0.04407547, 2.843971, 1, 0, 0.7686275, 1,
1.106283, 0.3086205, 1.903277, 1, 0, 0.7607843, 1,
1.113627, -1.054786, 3.147735, 1, 0, 0.7568628, 1,
1.11422, 1.110705, -0.3329092, 1, 0, 0.7490196, 1,
1.116792, -0.3578971, 1.682514, 1, 0, 0.7450981, 1,
1.119727, -1.364772, 2.776334, 1, 0, 0.7372549, 1,
1.137829, 0.6037831, 1.559191, 1, 0, 0.7333333, 1,
1.138878, 1.072604, -0.02393412, 1, 0, 0.7254902, 1,
1.140387, -2.019275, 5.132554, 1, 0, 0.7215686, 1,
1.140391, -0.8277438, 2.246333, 1, 0, 0.7137255, 1,
1.14439, -0.6897416, 3.038087, 1, 0, 0.7098039, 1,
1.145221, -3.400606, 0.6539561, 1, 0, 0.7019608, 1,
1.146327, -0.3033921, 2.643086, 1, 0, 0.6941177, 1,
1.146461, -0.1585032, 0.1885945, 1, 0, 0.6901961, 1,
1.152237, -0.09161323, 1.499963, 1, 0, 0.682353, 1,
1.161959, 0.3852428, 1.300685, 1, 0, 0.6784314, 1,
1.164231, -0.1186816, 1.036116, 1, 0, 0.6705883, 1,
1.170344, -1.268301, 2.641145, 1, 0, 0.6666667, 1,
1.17872, -0.226118, 1.002567, 1, 0, 0.6588235, 1,
1.184271, -0.6550047, 0.6686224, 1, 0, 0.654902, 1,
1.184767, -0.1365428, 0.8545173, 1, 0, 0.6470588, 1,
1.196813, -0.5180658, 2.631069, 1, 0, 0.6431373, 1,
1.200958, 1.014851, -0.353527, 1, 0, 0.6352941, 1,
1.202293, -0.3900123, 0.53177, 1, 0, 0.6313726, 1,
1.20252, 2.665787, -0.7538701, 1, 0, 0.6235294, 1,
1.204142, 1.391758, 1.857303, 1, 0, 0.6196079, 1,
1.208349, 0.7779593, 3.209833, 1, 0, 0.6117647, 1,
1.221292, 0.4018493, 1.335329, 1, 0, 0.6078432, 1,
1.223006, 2.511509, 1.540253, 1, 0, 0.6, 1,
1.233086, -0.4274436, 1.211605, 1, 0, 0.5921569, 1,
1.237659, -0.7943431, 1.628726, 1, 0, 0.5882353, 1,
1.240583, -1.47843, 2.595103, 1, 0, 0.5803922, 1,
1.245464, 0.8056141, 2.507658, 1, 0, 0.5764706, 1,
1.250168, -0.396122, 0.9192685, 1, 0, 0.5686275, 1,
1.254089, -0.06154766, 0.1889331, 1, 0, 0.5647059, 1,
1.265866, -0.3831326, 1.092204, 1, 0, 0.5568628, 1,
1.266782, 1.535574, -0.4995351, 1, 0, 0.5529412, 1,
1.271691, -0.6745009, 1.190923, 1, 0, 0.5450981, 1,
1.27185, 0.5173612, 0.7954182, 1, 0, 0.5411765, 1,
1.283456, 0.3435445, -0.1779625, 1, 0, 0.5333334, 1,
1.286105, 1.037928, 1.009381, 1, 0, 0.5294118, 1,
1.287707, -0.5056174, 2.805676, 1, 0, 0.5215687, 1,
1.299478, 0.1805493, 0.5996984, 1, 0, 0.5176471, 1,
1.300265, 0.485297, -0.1217537, 1, 0, 0.509804, 1,
1.305718, 0.6478521, -0.9571531, 1, 0, 0.5058824, 1,
1.307586, 0.1199719, 1.700316, 1, 0, 0.4980392, 1,
1.310219, -2.115472, 1.345159, 1, 0, 0.4901961, 1,
1.336666, 0.5417606, 3.071289, 1, 0, 0.4862745, 1,
1.33696, -2.043785, 2.713313, 1, 0, 0.4784314, 1,
1.341035, -0.7421871, 1.414727, 1, 0, 0.4745098, 1,
1.346183, -0.6236102, 2.357663, 1, 0, 0.4666667, 1,
1.350723, 0.532765, 2.615617, 1, 0, 0.4627451, 1,
1.35624, -2.317124, 1.263604, 1, 0, 0.454902, 1,
1.359448, -0.8407663, 3.98929, 1, 0, 0.4509804, 1,
1.364301, -2.244956, 1.799613, 1, 0, 0.4431373, 1,
1.365085, -0.5124488, 1.264049, 1, 0, 0.4392157, 1,
1.380057, 0.1352177, 0.9866432, 1, 0, 0.4313726, 1,
1.399166, 0.9968264, 1.722154, 1, 0, 0.427451, 1,
1.399728, -0.1764166, 0.08414495, 1, 0, 0.4196078, 1,
1.422572, 1.099454, 0.7898681, 1, 0, 0.4156863, 1,
1.437292, 0.7027076, -1.058396, 1, 0, 0.4078431, 1,
1.450471, -1.585808, 1.863681, 1, 0, 0.4039216, 1,
1.457569, 1.056782, 0.1013627, 1, 0, 0.3960784, 1,
1.47952, -0.5000101, 3.862243, 1, 0, 0.3882353, 1,
1.481292, -2.144732, 2.873452, 1, 0, 0.3843137, 1,
1.510556, -1.487255, 3.220338, 1, 0, 0.3764706, 1,
1.516746, -0.1223122, 0.7076101, 1, 0, 0.372549, 1,
1.518234, 0.2589713, 1.991333, 1, 0, 0.3647059, 1,
1.520631, -1.262784, 1.06793, 1, 0, 0.3607843, 1,
1.521698, -1.095575, 1.554727, 1, 0, 0.3529412, 1,
1.535498, -0.01914887, 0.5069681, 1, 0, 0.3490196, 1,
1.56539, 1.192039, 1.710431, 1, 0, 0.3411765, 1,
1.569629, 0.6519796, 1.36727, 1, 0, 0.3372549, 1,
1.582949, -0.02317612, 0.9366257, 1, 0, 0.3294118, 1,
1.591975, -0.6527821, 0.7299399, 1, 0, 0.3254902, 1,
1.609978, 0.1742706, -0.1329408, 1, 0, 0.3176471, 1,
1.612575, -0.4305273, 0.3723829, 1, 0, 0.3137255, 1,
1.618438, -0.1875654, 0.7032037, 1, 0, 0.3058824, 1,
1.623374, 0.1563262, 2.002847, 1, 0, 0.2980392, 1,
1.637031, -0.5041177, 1.072717, 1, 0, 0.2941177, 1,
1.649714, 1.787151, 0.9703304, 1, 0, 0.2862745, 1,
1.654588, 0.2472332, 1.344799, 1, 0, 0.282353, 1,
1.656485, -2.448727, 1.38289, 1, 0, 0.2745098, 1,
1.665265, -0.3240604, 1.222186, 1, 0, 0.2705882, 1,
1.668644, -0.02052881, 1.597485, 1, 0, 0.2627451, 1,
1.697679, 0.4150338, 0.2934341, 1, 0, 0.2588235, 1,
1.71437, -0.2607308, 3.194972, 1, 0, 0.2509804, 1,
1.722444, 0.9622405, 0.8652376, 1, 0, 0.2470588, 1,
1.735881, 0.2478245, 1.119527, 1, 0, 0.2392157, 1,
1.739432, 1.232319, -0.578836, 1, 0, 0.2352941, 1,
1.778815, 1.174175, 0.7656077, 1, 0, 0.227451, 1,
1.785457, 0.2687072, 1.664699, 1, 0, 0.2235294, 1,
1.788697, -0.3151686, 0.2486967, 1, 0, 0.2156863, 1,
1.801131, -1.310312, 1.832212, 1, 0, 0.2117647, 1,
1.802145, 1.646984, 0.2775678, 1, 0, 0.2039216, 1,
1.831842, -0.9606555, 3.36445, 1, 0, 0.1960784, 1,
1.835649, 0.4042481, 0.6431138, 1, 0, 0.1921569, 1,
1.848921, -0.2179192, 1.834009, 1, 0, 0.1843137, 1,
1.859725, -0.8411319, 1.877443, 1, 0, 0.1803922, 1,
1.890243, 0.7445244, 3.276445, 1, 0, 0.172549, 1,
1.904936, -0.28309, 3.282769, 1, 0, 0.1686275, 1,
1.913889, -1.568981, 1.449418, 1, 0, 0.1607843, 1,
1.923486, -0.4248784, 1.066332, 1, 0, 0.1568628, 1,
1.951884, 0.6420226, 0.2819516, 1, 0, 0.1490196, 1,
1.971982, -0.8981066, 0.1897519, 1, 0, 0.145098, 1,
1.973065, -1.10292, 4.038205, 1, 0, 0.1372549, 1,
1.984714, 0.2809513, 1.028854, 1, 0, 0.1333333, 1,
2.019893, 0.1914068, 2.306974, 1, 0, 0.1254902, 1,
2.055686, -1.160929, 1.228548, 1, 0, 0.1215686, 1,
2.055923, -1.532947, 1.089543, 1, 0, 0.1137255, 1,
2.06234, -0.5519556, -0.03504805, 1, 0, 0.1098039, 1,
2.087524, -0.5803965, 0.198661, 1, 0, 0.1019608, 1,
2.111292, -0.6106212, 2.531523, 1, 0, 0.09411765, 1,
2.12051, -1.364052, 2.995223, 1, 0, 0.09019608, 1,
2.126094, -2.666815, 0.7763966, 1, 0, 0.08235294, 1,
2.161304, -0.5371702, 1.975789, 1, 0, 0.07843138, 1,
2.191787, 1.530901, 1.762347, 1, 0, 0.07058824, 1,
2.279917, 0.9423227, 2.047504, 1, 0, 0.06666667, 1,
2.296819, 1.208472, 0.415872, 1, 0, 0.05882353, 1,
2.340698, 0.2388493, 2.707799, 1, 0, 0.05490196, 1,
2.375391, 0.09145713, 3.206157, 1, 0, 0.04705882, 1,
2.407926, 1.495626, 2.303283, 1, 0, 0.04313726, 1,
2.54699, 0.09203943, 2.609241, 1, 0, 0.03529412, 1,
2.718129, -0.4921323, 3.744342, 1, 0, 0.03137255, 1,
2.739765, 0.002677856, -0.6180184, 1, 0, 0.02352941, 1,
2.786684, -1.506174, 2.072575, 1, 0, 0.01960784, 1,
3.008162, -1.234878, 3.184963, 1, 0, 0.01176471, 1,
3.119235, -1.63396, 1.678782, 1, 0, 0.007843138, 1
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
-0.1453432, -4.473729, -7.281031, 0, -0.5, 0.5, 0.5,
-0.1453432, -4.473729, -7.281031, 1, -0.5, 0.5, 0.5,
-0.1453432, -4.473729, -7.281031, 1, 1.5, 0.5, 0.5,
-0.1453432, -4.473729, -7.281031, 0, 1.5, 0.5, 0.5
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
-4.516614, -0.2350518, -7.281031, 0, -0.5, 0.5, 0.5,
-4.516614, -0.2350518, -7.281031, 1, -0.5, 0.5, 0.5,
-4.516614, -0.2350518, -7.281031, 1, 1.5, 0.5, 0.5,
-4.516614, -0.2350518, -7.281031, 0, 1.5, 0.5, 0.5
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
-4.516614, -4.473729, -0.174665, 0, -0.5, 0.5, 0.5,
-4.516614, -4.473729, -0.174665, 1, -0.5, 0.5, 0.5,
-4.516614, -4.473729, -0.174665, 1, 1.5, 0.5, 0.5,
-4.516614, -4.473729, -0.174665, 0, 1.5, 0.5, 0.5
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
-3, -3.495573, -5.6411,
3, -3.495573, -5.6411,
-3, -3.495573, -5.6411,
-3, -3.658599, -5.914422,
-2, -3.495573, -5.6411,
-2, -3.658599, -5.914422,
-1, -3.495573, -5.6411,
-1, -3.658599, -5.914422,
0, -3.495573, -5.6411,
0, -3.658599, -5.914422,
1, -3.495573, -5.6411,
1, -3.658599, -5.914422,
2, -3.495573, -5.6411,
2, -3.658599, -5.914422,
3, -3.495573, -5.6411,
3, -3.658599, -5.914422
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
-3, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
-3, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
-3, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
-3, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
-2, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
-2, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
-2, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
-2, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
-1, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
-1, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
-1, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
-1, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
0, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
0, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
0, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
0, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
1, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
1, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
1, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
1, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
2, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
2, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
2, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
2, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5,
3, -3.984651, -6.461065, 0, -0.5, 0.5, 0.5,
3, -3.984651, -6.461065, 1, -0.5, 0.5, 0.5,
3, -3.984651, -6.461065, 1, 1.5, 0.5, 0.5,
3, -3.984651, -6.461065, 0, 1.5, 0.5, 0.5
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
-3.507859, -3, -5.6411,
-3.507859, 2, -5.6411,
-3.507859, -3, -5.6411,
-3.675985, -3, -5.914422,
-3.507859, -2, -5.6411,
-3.675985, -2, -5.914422,
-3.507859, -1, -5.6411,
-3.675985, -1, -5.914422,
-3.507859, 0, -5.6411,
-3.675985, 0, -5.914422,
-3.507859, 1, -5.6411,
-3.675985, 1, -5.914422,
-3.507859, 2, -5.6411,
-3.675985, 2, -5.914422
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
-4.012237, -3, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, -3, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, -3, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, -3, -6.461065, 0, 1.5, 0.5, 0.5,
-4.012237, -2, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, -2, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, -2, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, -2, -6.461065, 0, 1.5, 0.5, 0.5,
-4.012237, -1, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, -1, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, -1, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, -1, -6.461065, 0, 1.5, 0.5, 0.5,
-4.012237, 0, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, 0, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, 0, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, 0, -6.461065, 0, 1.5, 0.5, 0.5,
-4.012237, 1, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, 1, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, 1, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, 1, -6.461065, 0, 1.5, 0.5, 0.5,
-4.012237, 2, -6.461065, 0, -0.5, 0.5, 0.5,
-4.012237, 2, -6.461065, 1, -0.5, 0.5, 0.5,
-4.012237, 2, -6.461065, 1, 1.5, 0.5, 0.5,
-4.012237, 2, -6.461065, 0, 1.5, 0.5, 0.5
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
-3.507859, -3.495573, -4,
-3.507859, -3.495573, 4,
-3.507859, -3.495573, -4,
-3.675985, -3.658599, -4,
-3.507859, -3.495573, -2,
-3.675985, -3.658599, -2,
-3.507859, -3.495573, 0,
-3.675985, -3.658599, 0,
-3.507859, -3.495573, 2,
-3.675985, -3.658599, 2,
-3.507859, -3.495573, 4,
-3.675985, -3.658599, 4
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
-4.012237, -3.984651, -4, 0, -0.5, 0.5, 0.5,
-4.012237, -3.984651, -4, 1, -0.5, 0.5, 0.5,
-4.012237, -3.984651, -4, 1, 1.5, 0.5, 0.5,
-4.012237, -3.984651, -4, 0, 1.5, 0.5, 0.5,
-4.012237, -3.984651, -2, 0, -0.5, 0.5, 0.5,
-4.012237, -3.984651, -2, 1, -0.5, 0.5, 0.5,
-4.012237, -3.984651, -2, 1, 1.5, 0.5, 0.5,
-4.012237, -3.984651, -2, 0, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 0, 0, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 0, 1, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 0, 1, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 0, 0, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 2, 0, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 2, 1, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 2, 1, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 2, 0, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 4, 0, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 4, 1, -0.5, 0.5, 0.5,
-4.012237, -3.984651, 4, 1, 1.5, 0.5, 0.5,
-4.012237, -3.984651, 4, 0, 1.5, 0.5, 0.5
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
-3.507859, -3.495573, -5.6411,
-3.507859, 3.025469, -5.6411,
-3.507859, -3.495573, 5.29177,
-3.507859, 3.025469, 5.29177,
-3.507859, -3.495573, -5.6411,
-3.507859, -3.495573, 5.29177,
-3.507859, 3.025469, -5.6411,
-3.507859, 3.025469, 5.29177,
-3.507859, -3.495573, -5.6411,
3.217173, -3.495573, -5.6411,
-3.507859, -3.495573, 5.29177,
3.217173, -3.495573, 5.29177,
-3.507859, 3.025469, -5.6411,
3.217173, 3.025469, -5.6411,
-3.507859, 3.025469, 5.29177,
3.217173, 3.025469, 5.29177,
3.217173, -3.495573, -5.6411,
3.217173, 3.025469, -5.6411,
3.217173, -3.495573, 5.29177,
3.217173, 3.025469, 5.29177,
3.217173, -3.495573, -5.6411,
3.217173, -3.495573, 5.29177,
3.217173, 3.025469, -5.6411,
3.217173, 3.025469, 5.29177
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
var radius = 7.687794;
var distance = 34.20386;
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
mvMatrix.translate( 0.1453432, 0.2350518, 0.174665 );
mvMatrix.scale( 1.236008, 1.274673, 0.7602938 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.20386);
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
chlorphonium_chlorid<-read.table("chlorphonium_chlorid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorphonium_chlorid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
y<-chlorphonium_chlorid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
z<-chlorphonium_chlorid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
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
-3.409922, -0.952256, -0.3094428, 0, 0, 1, 1, 1,
-3.198074, 0.7153524, -2.174152, 1, 0, 0, 1, 1,
-3.016585, -0.3089726, -1.688174, 1, 0, 0, 1, 1,
-2.954523, -0.1779568, -1.982744, 1, 0, 0, 1, 1,
-2.744043, 0.3693636, -2.046177, 1, 0, 0, 1, 1,
-2.727464, 0.5506414, -1.676934, 1, 0, 0, 1, 1,
-2.650073, -0.7193561, -2.122946, 0, 0, 0, 1, 1,
-2.605543, -0.5358045, -1.202153, 0, 0, 0, 1, 1,
-2.603135, -0.380164, 0.09291127, 0, 0, 0, 1, 1,
-2.593651, 1.313422, -0.273854, 0, 0, 0, 1, 1,
-2.554217, -0.2494553, -1.707199, 0, 0, 0, 1, 1,
-2.484866, 0.3197607, -1.508514, 0, 0, 0, 1, 1,
-2.465817, -1.232678, -3.081321, 0, 0, 0, 1, 1,
-2.44286, -0.1554329, 0.08058035, 1, 1, 1, 1, 1,
-2.359379, -2.02578, -2.616305, 1, 1, 1, 1, 1,
-2.320048, -0.286595, -1.519685, 1, 1, 1, 1, 1,
-2.265786, 0.5594212, -1.719475, 1, 1, 1, 1, 1,
-2.221061, -0.436166, -1.251953, 1, 1, 1, 1, 1,
-2.215013, 0.6194857, -1.94383, 1, 1, 1, 1, 1,
-2.198842, -0.8546973, -2.596854, 1, 1, 1, 1, 1,
-2.169505, 0.905828, -0.9669707, 1, 1, 1, 1, 1,
-2.15829, 0.3000421, -1.831775, 1, 1, 1, 1, 1,
-2.156797, 2.216319, -0.6652291, 1, 1, 1, 1, 1,
-2.139803, -0.4005432, -2.326394, 1, 1, 1, 1, 1,
-2.072361, 0.2059933, -1.429207, 1, 1, 1, 1, 1,
-2.069221, 0.04852362, -2.154471, 1, 1, 1, 1, 1,
-2.053194, -1.23589, -2.041714, 1, 1, 1, 1, 1,
-2.024755, -0.2060536, -2.364862, 1, 1, 1, 1, 1,
-2.01104, 0.3944508, -2.235416, 0, 0, 1, 1, 1,
-1.956176, -0.2722651, -0.8287996, 1, 0, 0, 1, 1,
-1.953747, 0.1830169, -2.223857, 1, 0, 0, 1, 1,
-1.946008, -0.4755518, -2.293736, 1, 0, 0, 1, 1,
-1.94399, -0.3805915, -1.002307, 1, 0, 0, 1, 1,
-1.906524, 0.1983203, -1.338163, 1, 0, 0, 1, 1,
-1.900684, 0.556356, -0.6479465, 0, 0, 0, 1, 1,
-1.858526, 0.5833398, -0.6243964, 0, 0, 0, 1, 1,
-1.846733, -0.827354, -0.230444, 0, 0, 0, 1, 1,
-1.82404, 0.3691762, -2.745684, 0, 0, 0, 1, 1,
-1.81601, -1.803667, -1.280763, 0, 0, 0, 1, 1,
-1.812814, 0.7810686, -0.408534, 0, 0, 0, 1, 1,
-1.754972, -0.5784491, -2.861984, 0, 0, 0, 1, 1,
-1.751445, 0.003289585, -1.503132, 1, 1, 1, 1, 1,
-1.708586, 0.08350439, -1.618093, 1, 1, 1, 1, 1,
-1.701773, -0.2946572, -1.417782, 1, 1, 1, 1, 1,
-1.697033, -0.01066509, 0.04426486, 1, 1, 1, 1, 1,
-1.683228, -0.5190454, -1.771415, 1, 1, 1, 1, 1,
-1.673487, -2.256379, -4.65837, 1, 1, 1, 1, 1,
-1.6544, 0.4003044, -1.390197, 1, 1, 1, 1, 1,
-1.643179, 0.02437836, -3.268778, 1, 1, 1, 1, 1,
-1.641945, 0.4973156, -0.3573542, 1, 1, 1, 1, 1,
-1.639189, -0.2513689, -2.617436, 1, 1, 1, 1, 1,
-1.636573, 2.906127, -0.9691156, 1, 1, 1, 1, 1,
-1.62347, -1.513151, -1.586569, 1, 1, 1, 1, 1,
-1.601585, 0.9023066, -2.19693, 1, 1, 1, 1, 1,
-1.597738, 0.916364, -1.550893, 1, 1, 1, 1, 1,
-1.594089, -1.009471, -4.455382, 1, 1, 1, 1, 1,
-1.588802, -0.1382134, -2.120462, 0, 0, 1, 1, 1,
-1.583357, 0.823857, -0.9358517, 1, 0, 0, 1, 1,
-1.566262, -1.000223, -2.159113, 1, 0, 0, 1, 1,
-1.557244, 1.749868, -1.771183, 1, 0, 0, 1, 1,
-1.553832, 1.813514, -1.856996, 1, 0, 0, 1, 1,
-1.548696, -0.8278532, -0.9791614, 1, 0, 0, 1, 1,
-1.535632, 0.5081355, -1.884867, 0, 0, 0, 1, 1,
-1.535627, -2.208777, -2.151117, 0, 0, 0, 1, 1,
-1.534066, 0.1638597, -1.645407, 0, 0, 0, 1, 1,
-1.533474, -2.567353, -2.37429, 0, 0, 0, 1, 1,
-1.525645, -0.91747, -1.901817, 0, 0, 0, 1, 1,
-1.520566, -1.482897, -2.046754, 0, 0, 0, 1, 1,
-1.514448, -0.06676809, -1.567874, 0, 0, 0, 1, 1,
-1.502595, -0.08453547, -1.765813, 1, 1, 1, 1, 1,
-1.498596, -1.035116, -1.848755, 1, 1, 1, 1, 1,
-1.485992, -0.5378476, -1.969977, 1, 1, 1, 1, 1,
-1.484429, 0.677971, -0.7392437, 1, 1, 1, 1, 1,
-1.457165, -0.6083218, -1.621728, 1, 1, 1, 1, 1,
-1.454642, -0.02453769, -3.988707, 1, 1, 1, 1, 1,
-1.447715, -0.3133356, -1.365771, 1, 1, 1, 1, 1,
-1.446285, 0.8152162, -1.922587, 1, 1, 1, 1, 1,
-1.443604, 0.9701996, -0.8817713, 1, 1, 1, 1, 1,
-1.436558, 0.1971048, -1.918777, 1, 1, 1, 1, 1,
-1.428718, 0.4684429, -0.7737734, 1, 1, 1, 1, 1,
-1.415848, 0.7427608, -0.3386035, 1, 1, 1, 1, 1,
-1.412596, 1.987686, -0.07749198, 1, 1, 1, 1, 1,
-1.409014, 1.373009, -0.3511074, 1, 1, 1, 1, 1,
-1.402593, 0.6099961, -1.839639, 1, 1, 1, 1, 1,
-1.396441, 1.242196, -0.2150728, 0, 0, 1, 1, 1,
-1.395799, 1.013148, -2.594902, 1, 0, 0, 1, 1,
-1.390383, -0.4588327, -3.809747, 1, 0, 0, 1, 1,
-1.390316, 0.9579138, -0.508957, 1, 0, 0, 1, 1,
-1.389462, 0.4257872, -2.285681, 1, 0, 0, 1, 1,
-1.387255, 0.5305951, -0.4287727, 1, 0, 0, 1, 1,
-1.387189, -0.2824785, -0.4308209, 0, 0, 0, 1, 1,
-1.379946, -1.993166, -0.6037298, 0, 0, 0, 1, 1,
-1.379805, -0.4757769, -1.7298, 0, 0, 0, 1, 1,
-1.374709, 1.073761, -0.3053459, 0, 0, 0, 1, 1,
-1.370147, -0.3378433, -1.466715, 0, 0, 0, 1, 1,
-1.368385, -0.7093633, -3.967142, 0, 0, 0, 1, 1,
-1.36384, 0.9603292, 0.3954047, 0, 0, 0, 1, 1,
-1.357005, 1.102795, -0.6889507, 1, 1, 1, 1, 1,
-1.351501, 0.892606, -0.9908075, 1, 1, 1, 1, 1,
-1.33861, -1.351727, -3.376478, 1, 1, 1, 1, 1,
-1.331219, -1.292509, -2.91702, 1, 1, 1, 1, 1,
-1.323999, -0.2425062, -1.860186, 1, 1, 1, 1, 1,
-1.305223, 0.9157933, -1.145831, 1, 1, 1, 1, 1,
-1.301861, -1.109453, -0.9774148, 1, 1, 1, 1, 1,
-1.300982, -1.494222, -4.169457, 1, 1, 1, 1, 1,
-1.296261, 0.6419375, 0.849365, 1, 1, 1, 1, 1,
-1.294148, -0.3800121, -1.699976, 1, 1, 1, 1, 1,
-1.28739, -0.1263938, -0.3723364, 1, 1, 1, 1, 1,
-1.280717, -0.8557814, 0.8787683, 1, 1, 1, 1, 1,
-1.275128, 1.174501, 0.04403739, 1, 1, 1, 1, 1,
-1.267466, -2.464731, -1.696876, 1, 1, 1, 1, 1,
-1.253165, -0.2702409, -2.766518, 1, 1, 1, 1, 1,
-1.253057, 0.1289521, -2.397479, 0, 0, 1, 1, 1,
-1.228919, -2.589555, -3.326906, 1, 0, 0, 1, 1,
-1.218993, -1.380994, 0.05508844, 1, 0, 0, 1, 1,
-1.212501, -0.8155859, -1.866547, 1, 0, 0, 1, 1,
-1.210901, 1.644879, 1.138436, 1, 0, 0, 1, 1,
-1.204055, 0.4202487, -2.74385, 1, 0, 0, 1, 1,
-1.203159, -0.1519202, -1.550261, 0, 0, 0, 1, 1,
-1.201161, -1.431533, -3.109659, 0, 0, 0, 1, 1,
-1.189213, -0.5955641, -1.972614, 0, 0, 0, 1, 1,
-1.183853, -0.4591013, -1.087329, 0, 0, 0, 1, 1,
-1.173145, -1.060312, -1.618648, 0, 0, 0, 1, 1,
-1.162387, 0.7625743, -0.2680446, 0, 0, 0, 1, 1,
-1.162244, -1.238819, -2.995682, 0, 0, 0, 1, 1,
-1.149344, 0.6381754, -1.917619, 1, 1, 1, 1, 1,
-1.13483, 0.1773048, 0.6421733, 1, 1, 1, 1, 1,
-1.130783, -1.586392, -2.162961, 1, 1, 1, 1, 1,
-1.127045, -1.018703, -0.7322195, 1, 1, 1, 1, 1,
-1.113576, -1.328148, -1.640655, 1, 1, 1, 1, 1,
-1.109134, 1.321893, -0.8594647, 1, 1, 1, 1, 1,
-1.109102, -2.461918, -3.513564, 1, 1, 1, 1, 1,
-1.101598, -0.7695671, -2.275321, 1, 1, 1, 1, 1,
-1.097148, -0.1936486, -1.066154, 1, 1, 1, 1, 1,
-1.090602, 0.04489115, -2.951573, 1, 1, 1, 1, 1,
-1.088773, -0.2672147, -2.22041, 1, 1, 1, 1, 1,
-1.088163, 0.6519727, -0.08945566, 1, 1, 1, 1, 1,
-1.081066, 0.6119687, -1.214491, 1, 1, 1, 1, 1,
-1.080402, 1.609255, 1.675015, 1, 1, 1, 1, 1,
-1.073342, 0.5029914, -2.077606, 1, 1, 1, 1, 1,
-1.061021, 0.2015741, -2.208984, 0, 0, 1, 1, 1,
-1.055719, 0.9142472, 0.2354008, 1, 0, 0, 1, 1,
-1.052566, -0.4230005, -2.863589, 1, 0, 0, 1, 1,
-1.048571, -0.3117833, -2.661149, 1, 0, 0, 1, 1,
-1.048251, 1.452451, 0.1161469, 1, 0, 0, 1, 1,
-1.044484, 1.284499, -1.908902, 1, 0, 0, 1, 1,
-1.043032, 0.8851779, -0.8321798, 0, 0, 0, 1, 1,
-1.041257, -0.3289686, -3.176126, 0, 0, 0, 1, 1,
-1.038944, 0.9999864, -1.195165, 0, 0, 0, 1, 1,
-1.038514, -1.204857, -2.729284, 0, 0, 0, 1, 1,
-1.033422, -0.9866281, -1.615649, 0, 0, 0, 1, 1,
-1.026194, 1.542083, -0.6415595, 0, 0, 0, 1, 1,
-1.019262, 0.159882, -2.457798, 0, 0, 0, 1, 1,
-1.013115, -1.696856, -1.51624, 1, 1, 1, 1, 1,
-1.009657, -1.234038, -3.751105, 1, 1, 1, 1, 1,
-0.9992006, -0.149593, -2.210493, 1, 1, 1, 1, 1,
-0.995342, -0.7379468, -2.721654, 1, 1, 1, 1, 1,
-0.9946678, -0.4478166, -1.57517, 1, 1, 1, 1, 1,
-0.9676487, -0.3381743, -2.306931, 1, 1, 1, 1, 1,
-0.9650995, 0.224378, 0.4196859, 1, 1, 1, 1, 1,
-0.9649099, -1.508433, -3.120065, 1, 1, 1, 1, 1,
-0.96355, 0.1196852, -0.78965, 1, 1, 1, 1, 1,
-0.9585193, 0.6020198, -1.562242, 1, 1, 1, 1, 1,
-0.9584339, -0.2576679, -1.670954, 1, 1, 1, 1, 1,
-0.9412919, 0.6676185, -1.905284, 1, 1, 1, 1, 1,
-0.9409506, -0.03430337, -0.02579334, 1, 1, 1, 1, 1,
-0.9386308, 0.09414975, -1.09972, 1, 1, 1, 1, 1,
-0.9382702, -0.03299026, -1.871389, 1, 1, 1, 1, 1,
-0.9291275, -0.927358, -2.375424, 0, 0, 1, 1, 1,
-0.9243899, 0.1257987, -1.827796, 1, 0, 0, 1, 1,
-0.9200996, 0.3133444, -1.588146, 1, 0, 0, 1, 1,
-0.9190503, -0.6865549, -3.038558, 1, 0, 0, 1, 1,
-0.9117377, -1.688902, -3.392007, 1, 0, 0, 1, 1,
-0.9080324, -0.2436967, -2.201486, 1, 0, 0, 1, 1,
-0.906341, 1.262851, -0.5308245, 0, 0, 0, 1, 1,
-0.9056339, 0.0554084, -1.229929, 0, 0, 0, 1, 1,
-0.9039157, 1.228988, -0.3463834, 0, 0, 0, 1, 1,
-0.9020313, 0.644492, -0.3277147, 0, 0, 0, 1, 1,
-0.9013596, 0.4095955, -1.503531, 0, 0, 0, 1, 1,
-0.8961378, 0.8804557, -1.737545, 0, 0, 0, 1, 1,
-0.8951303, 0.0722862, -1.072294, 0, 0, 0, 1, 1,
-0.8917404, -0.02132839, -1.601153, 1, 1, 1, 1, 1,
-0.8910394, 0.5192735, -1.679951, 1, 1, 1, 1, 1,
-0.887409, 0.0324757, -0.9073024, 1, 1, 1, 1, 1,
-0.8808874, 0.1139687, -0.8069782, 1, 1, 1, 1, 1,
-0.8798243, 1.064143, -0.7944852, 1, 1, 1, 1, 1,
-0.8675651, -1.732192, -1.965917, 1, 1, 1, 1, 1,
-0.8628519, -1.384395, -1.880862, 1, 1, 1, 1, 1,
-0.8626334, 0.5112457, -0.2550521, 1, 1, 1, 1, 1,
-0.8620787, -0.870678, -1.385259, 1, 1, 1, 1, 1,
-0.8618048, 0.7475571, -1.449818, 1, 1, 1, 1, 1,
-0.8611522, 1.620013, 0.6565495, 1, 1, 1, 1, 1,
-0.8606845, -0.169026, -3.282346, 1, 1, 1, 1, 1,
-0.8515656, -0.201594, 0.1051842, 1, 1, 1, 1, 1,
-0.8505872, -0.66656, -2.063412, 1, 1, 1, 1, 1,
-0.8493358, -1.650064, -4.657711, 1, 1, 1, 1, 1,
-0.8476421, -0.4733086, -1.35629, 0, 0, 1, 1, 1,
-0.8409129, 0.08653995, -2.048248, 1, 0, 0, 1, 1,
-0.8403166, -0.3577303, -1.964981, 1, 0, 0, 1, 1,
-0.8384332, 0.5317784, -1.112355, 1, 0, 0, 1, 1,
-0.8305863, 0.03012357, -2.963937, 1, 0, 0, 1, 1,
-0.8196529, 2.403717, 0.01768603, 1, 0, 0, 1, 1,
-0.8167148, -0.3422073, -0.7399664, 0, 0, 0, 1, 1,
-0.814958, -1.0086, -1.241779, 0, 0, 0, 1, 1,
-0.8123581, 1.317819, -1.319159, 0, 0, 0, 1, 1,
-0.8102549, 0.5777065, -0.342479, 0, 0, 0, 1, 1,
-0.8101428, -0.8882473, -1.768927, 0, 0, 0, 1, 1,
-0.8096202, -0.253186, -3.085176, 0, 0, 0, 1, 1,
-0.8054087, 0.7160462, 0.2201146, 0, 0, 0, 1, 1,
-0.7999628, 0.8908498, -0.4593849, 1, 1, 1, 1, 1,
-0.7973716, -0.08976346, -3.116965, 1, 1, 1, 1, 1,
-0.7956949, 1.20269, -0.4490986, 1, 1, 1, 1, 1,
-0.7904991, -1.782563, -0.04723027, 1, 1, 1, 1, 1,
-0.787369, 0.1879653, -1.265493, 1, 1, 1, 1, 1,
-0.7862686, -0.4647679, -2.169338, 1, 1, 1, 1, 1,
-0.7816061, -0.04342574, -0.1399184, 1, 1, 1, 1, 1,
-0.7811332, -0.3173972, -3.540843, 1, 1, 1, 1, 1,
-0.7775047, 1.005616, 0.6019217, 1, 1, 1, 1, 1,
-0.7710181, -1.399996, -3.804185, 1, 1, 1, 1, 1,
-0.7636451, 0.9935499, 0.7270999, 1, 1, 1, 1, 1,
-0.7609309, -0.6778032, -3.364169, 1, 1, 1, 1, 1,
-0.756339, 2.930502, 0.8896303, 1, 1, 1, 1, 1,
-0.7559351, -2.085162, -2.126237, 1, 1, 1, 1, 1,
-0.7554007, -1.600903, -3.083445, 1, 1, 1, 1, 1,
-0.7526387, -0.7175004, -2.244456, 0, 0, 1, 1, 1,
-0.7502924, -0.08763172, -2.37154, 1, 0, 0, 1, 1,
-0.7486999, 0.2763154, -2.853204, 1, 0, 0, 1, 1,
-0.7466401, -1.39834, -3.425225, 1, 0, 0, 1, 1,
-0.7353652, 0.06351389, -0.5771053, 1, 0, 0, 1, 1,
-0.7350745, -0.02907521, -0.7263011, 1, 0, 0, 1, 1,
-0.7342455, 0.2359688, -1.87839, 0, 0, 0, 1, 1,
-0.7270598, -0.9739069, -2.395088, 0, 0, 0, 1, 1,
-0.7241907, 2.06094, 0.1835691, 0, 0, 0, 1, 1,
-0.7207373, -0.5909847, -1.854535, 0, 0, 0, 1, 1,
-0.7192181, -1.345061, -3.346725, 0, 0, 0, 1, 1,
-0.7110471, 0.9449301, 0.3364662, 0, 0, 0, 1, 1,
-0.7105695, -1.50859, -2.991608, 0, 0, 0, 1, 1,
-0.7064216, 0.1003813, -1.081123, 1, 1, 1, 1, 1,
-0.704282, -0.1934834, -1.32103, 1, 1, 1, 1, 1,
-0.7041692, -1.523241, -3.252833, 1, 1, 1, 1, 1,
-0.7029407, -0.8206394, -1.327481, 1, 1, 1, 1, 1,
-0.6999713, -1.358716, -3.259517, 1, 1, 1, 1, 1,
-0.6950561, -1.892315, -1.36047, 1, 1, 1, 1, 1,
-0.6948909, 1.486217, 0.1968296, 1, 1, 1, 1, 1,
-0.6936085, -1.083314, -1.865526, 1, 1, 1, 1, 1,
-0.6932739, 0.07324721, -2.518685, 1, 1, 1, 1, 1,
-0.6914402, -0.4850568, -1.688563, 1, 1, 1, 1, 1,
-0.6907117, 2.271785, 0.3885805, 1, 1, 1, 1, 1,
-0.6889283, 0.9551204, -0.8325942, 1, 1, 1, 1, 1,
-0.6878911, 0.6095355, -1.322165, 1, 1, 1, 1, 1,
-0.6865036, 1.201647, 0.3294976, 1, 1, 1, 1, 1,
-0.6845478, -0.715088, -1.464578, 1, 1, 1, 1, 1,
-0.6816219, -1.261833, -3.969915, 0, 0, 1, 1, 1,
-0.6771584, 0.9434488, -0.3468015, 1, 0, 0, 1, 1,
-0.6761721, -0.5688903, -1.291168, 1, 0, 0, 1, 1,
-0.6747245, -0.6768496, -3.353669, 1, 0, 0, 1, 1,
-0.6695883, 0.1442664, -1.590959, 1, 0, 0, 1, 1,
-0.6688109, 0.8222737, -1.437888, 1, 0, 0, 1, 1,
-0.6685355, -0.3813221, -2.717472, 0, 0, 0, 1, 1,
-0.6638483, 0.9966944, 0.617253, 0, 0, 0, 1, 1,
-0.6622139, 0.08522912, -1.36158, 0, 0, 0, 1, 1,
-0.6453643, -1.38897, -3.003692, 0, 0, 0, 1, 1,
-0.6436759, -1.060628, -4.067276, 0, 0, 0, 1, 1,
-0.6399054, -0.8975086, -1.787938, 0, 0, 0, 1, 1,
-0.6396072, 0.3092754, -1.605626, 0, 0, 0, 1, 1,
-0.6384164, 0.01813042, -0.1388009, 1, 1, 1, 1, 1,
-0.6367233, -1.805212, -0.6701304, 1, 1, 1, 1, 1,
-0.6356158, 0.337188, -1.513981, 1, 1, 1, 1, 1,
-0.6351187, 0.8913484, 0.1074517, 1, 1, 1, 1, 1,
-0.6265895, 0.1129904, -2.438359, 1, 1, 1, 1, 1,
-0.6255459, 1.219257, 0.717854, 1, 1, 1, 1, 1,
-0.6240677, 0.8745376, 0.4489174, 1, 1, 1, 1, 1,
-0.6231309, 0.07081173, 0.01585049, 1, 1, 1, 1, 1,
-0.6200893, 0.5801231, 0.01081913, 1, 1, 1, 1, 1,
-0.6198847, -2.15802, -2.320418, 1, 1, 1, 1, 1,
-0.6166825, -2.636756, -2.313625, 1, 1, 1, 1, 1,
-0.6158884, 0.6376121, -0.08261734, 1, 1, 1, 1, 1,
-0.6126578, -0.1916637, -1.24473, 1, 1, 1, 1, 1,
-0.6117187, 1.043373, 0.8099548, 1, 1, 1, 1, 1,
-0.6117159, 0.4529833, -0.5667688, 1, 1, 1, 1, 1,
-0.5939915, -1.011305, -1.856832, 0, 0, 1, 1, 1,
-0.5926419, -0.7123811, -3.030792, 1, 0, 0, 1, 1,
-0.5892368, 0.6899192, 0.5474062, 1, 0, 0, 1, 1,
-0.5836917, 0.6452023, 0.009487592, 1, 0, 0, 1, 1,
-0.5714174, 0.1182626, -1.824638, 1, 0, 0, 1, 1,
-0.5697755, -0.4018169, -2.212399, 1, 0, 0, 1, 1,
-0.5687122, -1.662683, -2.278661, 0, 0, 0, 1, 1,
-0.5671369, 0.5152888, -1.815667, 0, 0, 0, 1, 1,
-0.5645826, 0.1063821, -1.733514, 0, 0, 0, 1, 1,
-0.5634518, -0.1480852, -0.8190569, 0, 0, 0, 1, 1,
-0.5621824, 0.677348, -1.956764, 0, 0, 0, 1, 1,
-0.560889, -1.704957, -3.29817, 0, 0, 0, 1, 1,
-0.5604223, 0.6615574, -0.7376905, 0, 0, 0, 1, 1,
-0.5556636, -0.6376088, -1.164831, 1, 1, 1, 1, 1,
-0.5471961, -0.1630024, -1.079451, 1, 1, 1, 1, 1,
-0.543598, -0.00128206, -0.4367369, 1, 1, 1, 1, 1,
-0.5423716, -0.6160875, -0.5585899, 1, 1, 1, 1, 1,
-0.53743, -1.285526, -2.938283, 1, 1, 1, 1, 1,
-0.5352932, 1.034697, -1.073253, 1, 1, 1, 1, 1,
-0.5351366, 0.05386339, -2.754367, 1, 1, 1, 1, 1,
-0.5231021, -2.077549, -3.640047, 1, 1, 1, 1, 1,
-0.5158324, -0.1685044, -0.7584388, 1, 1, 1, 1, 1,
-0.5132697, -1.166911, -3.739727, 1, 1, 1, 1, 1,
-0.5128914, -0.8781653, -3.896832, 1, 1, 1, 1, 1,
-0.5077866, -0.5279893, -2.498491, 1, 1, 1, 1, 1,
-0.505129, 1.848425, 0.1913213, 1, 1, 1, 1, 1,
-0.5033111, -2.020279, -2.142408, 1, 1, 1, 1, 1,
-0.4985516, -0.3238502, -1.011762, 1, 1, 1, 1, 1,
-0.4900858, -0.03752824, -1.113689, 0, 0, 1, 1, 1,
-0.4890353, -1.072872, -1.04812, 1, 0, 0, 1, 1,
-0.4868016, -0.1368041, -3.0299, 1, 0, 0, 1, 1,
-0.485713, 0.6047328, 0.2924179, 1, 0, 0, 1, 1,
-0.4791403, -1.522704, -2.69259, 1, 0, 0, 1, 1,
-0.4769505, 0.1287459, 0.1752593, 1, 0, 0, 1, 1,
-0.4750432, -0.8405442, -2.813019, 0, 0, 0, 1, 1,
-0.4735067, -0.8315045, -3.476568, 0, 0, 0, 1, 1,
-0.4731621, -0.2069406, -2.787312, 0, 0, 0, 1, 1,
-0.471187, -0.1684743, -1.905145, 0, 0, 0, 1, 1,
-0.4708072, -0.3215999, -3.106117, 0, 0, 0, 1, 1,
-0.4664323, -1.375186, -4.185279, 0, 0, 0, 1, 1,
-0.4661089, 0.7147785, -0.3434275, 0, 0, 0, 1, 1,
-0.464632, -0.6383647, -2.044413, 1, 1, 1, 1, 1,
-0.4629762, 0.9471143, 0.9758719, 1, 1, 1, 1, 1,
-0.4612459, 0.2020872, -1.92964, 1, 1, 1, 1, 1,
-0.4580622, 0.2561742, -0.6869404, 1, 1, 1, 1, 1,
-0.4500288, 0.3803187, -0.6520942, 1, 1, 1, 1, 1,
-0.4494799, -1.987448, -3.183753, 1, 1, 1, 1, 1,
-0.4480121, -0.2502326, -2.120908, 1, 1, 1, 1, 1,
-0.4468158, 0.4554752, -0.9072639, 1, 1, 1, 1, 1,
-0.4429266, 1.656486, -0.5788215, 1, 1, 1, 1, 1,
-0.4427142, -0.5164794, -1.537885, 1, 1, 1, 1, 1,
-0.4414257, -1.129776, -3.259604, 1, 1, 1, 1, 1,
-0.4370234, -1.43026, -3.068376, 1, 1, 1, 1, 1,
-0.4365523, -1.699014, -3.433832, 1, 1, 1, 1, 1,
-0.4359285, -0.7127671, -3.937498, 1, 1, 1, 1, 1,
-0.4357987, 1.028421, -1.274038, 1, 1, 1, 1, 1,
-0.4355497, 2.551808, -0.8984822, 0, 0, 1, 1, 1,
-0.4339834, -2.240265, -1.198615, 1, 0, 0, 1, 1,
-0.4320551, 0.9969373, -0.8505695, 1, 0, 0, 1, 1,
-0.4291522, 2.465272, -1.181829, 1, 0, 0, 1, 1,
-0.4276766, 0.6421633, -0.09578566, 1, 0, 0, 1, 1,
-0.4261996, 0.3032397, -2.643032, 1, 0, 0, 1, 1,
-0.4252785, -0.08362357, -2.536859, 0, 0, 0, 1, 1,
-0.4190766, 1.662133, 0.8222554, 0, 0, 0, 1, 1,
-0.4156027, -1.414883, -4.478847, 0, 0, 0, 1, 1,
-0.4144094, 1.156993, -0.9408584, 0, 0, 0, 1, 1,
-0.413671, 0.4369493, -1.787642, 0, 0, 0, 1, 1,
-0.4119118, -1.023608, -3.736318, 0, 0, 0, 1, 1,
-0.4086294, -0.6881512, -2.273292, 0, 0, 0, 1, 1,
-0.4079927, -0.09383519, -1.018403, 1, 1, 1, 1, 1,
-0.4045498, -1.03476, -3.485737, 1, 1, 1, 1, 1,
-0.4038666, 0.9270549, 1.402956, 1, 1, 1, 1, 1,
-0.4029517, 0.2109385, -1.718674, 1, 1, 1, 1, 1,
-0.4007111, 0.6259413, -0.4009166, 1, 1, 1, 1, 1,
-0.3970674, -1.965969, -2.277725, 1, 1, 1, 1, 1,
-0.396596, 2.035354, -1.04434, 1, 1, 1, 1, 1,
-0.3965611, -0.9003158, -3.458785, 1, 1, 1, 1, 1,
-0.3933055, 0.3318406, 1.383565, 1, 1, 1, 1, 1,
-0.3920781, -0.5976874, -3.21395, 1, 1, 1, 1, 1,
-0.3917029, 0.3664314, -1.439464, 1, 1, 1, 1, 1,
-0.3915138, -1.275342, -3.233595, 1, 1, 1, 1, 1,
-0.3885841, -1.891057, -3.342373, 1, 1, 1, 1, 1,
-0.3858931, 0.1007455, -1.077587, 1, 1, 1, 1, 1,
-0.3855668, 0.3144138, -0.567488, 1, 1, 1, 1, 1,
-0.3853266, 0.5172647, 0.559048, 0, 0, 1, 1, 1,
-0.3841916, 0.4244649, 0.03897257, 1, 0, 0, 1, 1,
-0.3839109, -0.8039399, -3.480881, 1, 0, 0, 1, 1,
-0.3828546, 1.097765, 0.09025453, 1, 0, 0, 1, 1,
-0.3801548, -0.03486915, -3.740165, 1, 0, 0, 1, 1,
-0.3730609, -1.969529, -4.282017, 1, 0, 0, 1, 1,
-0.368755, -0.2252058, -3.58548, 0, 0, 0, 1, 1,
-0.3654467, -0.1200283, -2.055776, 0, 0, 0, 1, 1,
-0.3606799, -1.983155, -2.445912, 0, 0, 0, 1, 1,
-0.3599893, 0.4580255, -1.578791, 0, 0, 0, 1, 1,
-0.3559707, 1.653201, -0.04539526, 0, 0, 0, 1, 1,
-0.3547823, -1.108887, -4.577537, 0, 0, 0, 1, 1,
-0.3477484, 0.5209025, -0.03596112, 0, 0, 0, 1, 1,
-0.3452935, 0.05313718, -1.401127, 1, 1, 1, 1, 1,
-0.3433539, -0.1149091, -1.728193, 1, 1, 1, 1, 1,
-0.33946, -0.6461313, -3.199, 1, 1, 1, 1, 1,
-0.3361252, 0.3158989, -2.855739, 1, 1, 1, 1, 1,
-0.3302434, -0.1747185, -2.383044, 1, 1, 1, 1, 1,
-0.3298729, -0.2912749, -3.516845, 1, 1, 1, 1, 1,
-0.3271772, -1.397076, -2.012963, 1, 1, 1, 1, 1,
-0.3268897, -1.222609, -3.883612, 1, 1, 1, 1, 1,
-0.3265026, -0.3854209, -2.946188, 1, 1, 1, 1, 1,
-0.3259859, 0.02648739, -1.984968, 1, 1, 1, 1, 1,
-0.3254442, 0.227, -2.317331, 1, 1, 1, 1, 1,
-0.3248076, -0.7415105, -2.582659, 1, 1, 1, 1, 1,
-0.3204996, -0.7949391, -2.999792, 1, 1, 1, 1, 1,
-0.3202339, 0.8716479, 0.1046022, 1, 1, 1, 1, 1,
-0.3161556, 1.26101, -0.9459509, 1, 1, 1, 1, 1,
-0.3157818, 0.6003421, -0.6951454, 0, 0, 1, 1, 1,
-0.3129951, 0.6399328, -0.222917, 1, 0, 0, 1, 1,
-0.3067387, -1.18735, -2.428419, 1, 0, 0, 1, 1,
-0.3045017, -0.5672418, -2.547889, 1, 0, 0, 1, 1,
-0.2961739, 0.1281247, -0.7302848, 1, 0, 0, 1, 1,
-0.2959842, 2.130455, -0.08992462, 1, 0, 0, 1, 1,
-0.2943973, 1.730478, 1.600969, 0, 0, 0, 1, 1,
-0.2921805, 1.410368, -1.094373, 0, 0, 0, 1, 1,
-0.2904827, -1.097055, -4.074068, 0, 0, 0, 1, 1,
-0.28995, -0.1577053, -1.435086, 0, 0, 0, 1, 1,
-0.2841, 0.2446579, -2.723262, 0, 0, 0, 1, 1,
-0.2791944, 1.572007, -0.614847, 0, 0, 0, 1, 1,
-0.2790101, 0.5489914, 0.3889304, 0, 0, 0, 1, 1,
-0.2748331, 0.8153182, -0.3365323, 1, 1, 1, 1, 1,
-0.2744603, -0.5449164, -2.400419, 1, 1, 1, 1, 1,
-0.2693677, -1.062313, -1.975972, 1, 1, 1, 1, 1,
-0.2681382, -0.967039, -2.415589, 1, 1, 1, 1, 1,
-0.26774, -0.3649166, -2.953972, 1, 1, 1, 1, 1,
-0.2676173, 1.623423, -1.088046, 1, 1, 1, 1, 1,
-0.2619146, 1.427647, -1.744712, 1, 1, 1, 1, 1,
-0.2585256, 1.095691, -1.484082, 1, 1, 1, 1, 1,
-0.2555064, 0.4831669, -0.4178099, 1, 1, 1, 1, 1,
-0.2547615, -0.07122757, -2.000377, 1, 1, 1, 1, 1,
-0.25346, -1.466716, -2.079153, 1, 1, 1, 1, 1,
-0.2517669, 0.5986302, 0.003168344, 1, 1, 1, 1, 1,
-0.2513071, 0.5013388, -0.1690993, 1, 1, 1, 1, 1,
-0.2478013, -1.239362, -5.481884, 1, 1, 1, 1, 1,
-0.2432279, -0.3078937, -3.146636, 1, 1, 1, 1, 1,
-0.2432252, 0.80918, 0.9935263, 0, 0, 1, 1, 1,
-0.2420178, 1.494216, 2.276785, 1, 0, 0, 1, 1,
-0.2347516, 0.1588021, -0.8834237, 1, 0, 0, 1, 1,
-0.2330565, -1.495687, -3.138295, 1, 0, 0, 1, 1,
-0.2306168, -0.3265063, -1.959864, 1, 0, 0, 1, 1,
-0.226182, -1.9251, -4.952163, 1, 0, 0, 1, 1,
-0.2257358, 1.306051, -2.514445, 0, 0, 0, 1, 1,
-0.224413, 0.2574029, -1.84471, 0, 0, 0, 1, 1,
-0.2207032, -0.7665004, -3.384752, 0, 0, 0, 1, 1,
-0.2199185, -0.05987594, -1.634062, 0, 0, 0, 1, 1,
-0.2177314, -0.5711365, -3.347584, 0, 0, 0, 1, 1,
-0.2165507, 1.821049, -1.635339, 0, 0, 0, 1, 1,
-0.2157986, -0.4434869, -3.551682, 0, 0, 0, 1, 1,
-0.2139667, -0.5793764, -3.350763, 1, 1, 1, 1, 1,
-0.2122921, -0.4396754, -3.390715, 1, 1, 1, 1, 1,
-0.2119355, -0.4566396, -2.591976, 1, 1, 1, 1, 1,
-0.2080289, 2.035668, 0.5079625, 1, 1, 1, 1, 1,
-0.2057636, -1.003554, -2.673562, 1, 1, 1, 1, 1,
-0.203939, -1.492684, -2.635513, 1, 1, 1, 1, 1,
-0.201243, -2.11688, -1.154932, 1, 1, 1, 1, 1,
-0.1927339, 0.2864371, -1.829738, 1, 1, 1, 1, 1,
-0.1915841, -0.2120466, -4.025086, 1, 1, 1, 1, 1,
-0.1884666, -0.4611926, -2.719154, 1, 1, 1, 1, 1,
-0.1856552, 0.3985801, 0.3761352, 1, 1, 1, 1, 1,
-0.1844644, 1.173067, 0.09849359, 1, 1, 1, 1, 1,
-0.180745, -0.26888, -1.85552, 1, 1, 1, 1, 1,
-0.1761563, 0.5124477, -0.7630916, 1, 1, 1, 1, 1,
-0.1750667, -1.19867, -2.579744, 1, 1, 1, 1, 1,
-0.1748044, 1.351833, -0.8689885, 0, 0, 1, 1, 1,
-0.1729884, 0.4338401, 1.086091, 1, 0, 0, 1, 1,
-0.1697322, -0.6243467, -3.663173, 1, 0, 0, 1, 1,
-0.1662491, 0.4725448, -0.2911373, 1, 0, 0, 1, 1,
-0.1659918, 0.7250401, 0.1161303, 1, 0, 0, 1, 1,
-0.1612644, -0.009740275, -1.587362, 1, 0, 0, 1, 1,
-0.1585662, -0.1467724, -3.358017, 0, 0, 0, 1, 1,
-0.1582248, -0.9674334, -3.071715, 0, 0, 0, 1, 1,
-0.158006, -0.5982247, -3.720397, 0, 0, 0, 1, 1,
-0.1562537, 0.5301159, -0.04442755, 0, 0, 0, 1, 1,
-0.1539066, -0.087718, -2.297789, 0, 0, 0, 1, 1,
-0.1538375, -0.6373262, -4.690714, 0, 0, 0, 1, 1,
-0.1506164, -2.451364, -3.967008, 0, 0, 0, 1, 1,
-0.1458644, 0.890823, 1.507127, 1, 1, 1, 1, 1,
-0.1451441, 1.979274, -0.2191563, 1, 1, 1, 1, 1,
-0.1435292, -0.6628026, -3.189257, 1, 1, 1, 1, 1,
-0.1420233, 0.3961506, -1.523069, 1, 1, 1, 1, 1,
-0.1407484, -0.2619964, -4.002501, 1, 1, 1, 1, 1,
-0.1383673, -0.02498492, -0.9671769, 1, 1, 1, 1, 1,
-0.1374371, 1.713662, 0.6963514, 1, 1, 1, 1, 1,
-0.135242, 0.7274908, 0.3345896, 1, 1, 1, 1, 1,
-0.1345854, 0.6943804, 0.4197212, 1, 1, 1, 1, 1,
-0.1286076, 1.190499, -1.626898, 1, 1, 1, 1, 1,
-0.1266829, -0.1315539, -2.423968, 1, 1, 1, 1, 1,
-0.1234775, -0.3063777, -2.401444, 1, 1, 1, 1, 1,
-0.1200098, -0.6525629, -4.090407, 1, 1, 1, 1, 1,
-0.1094825, 1.719453, -0.757176, 1, 1, 1, 1, 1,
-0.1051755, -0.3887338, -4.886364, 1, 1, 1, 1, 1,
-0.1003431, 1.498581, -1.561454, 0, 0, 1, 1, 1,
-0.09754235, -0.5041828, -2.979605, 1, 0, 0, 1, 1,
-0.09605319, 0.2878481, -0.6134374, 1, 0, 0, 1, 1,
-0.09082106, -0.3140368, -2.101135, 1, 0, 0, 1, 1,
-0.08502645, 0.299873, -0.4090575, 1, 0, 0, 1, 1,
-0.08322075, -1.140633, -2.384064, 1, 0, 0, 1, 1,
-0.07813477, -1.579315, -0.7629837, 0, 0, 0, 1, 1,
-0.07789145, 2.728565, 1.126685, 0, 0, 0, 1, 1,
-0.07649531, -0.03702289, -2.723089, 0, 0, 0, 1, 1,
-0.07407356, 0.4685462, -0.02840527, 0, 0, 0, 1, 1,
-0.07403402, 2.216599, -0.3275131, 0, 0, 0, 1, 1,
-0.06942029, -1.179, -3.961092, 0, 0, 0, 1, 1,
-0.0662767, -0.4767947, -3.011794, 0, 0, 0, 1, 1,
-0.06613129, 1.061974, -0.6217396, 1, 1, 1, 1, 1,
-0.06425528, 0.834821, 0.1866376, 1, 1, 1, 1, 1,
-0.06255326, -0.976455, -4.615809, 1, 1, 1, 1, 1,
-0.0612921, -0.5451199, -2.720379, 1, 1, 1, 1, 1,
-0.0606841, -0.7814723, -2.423108, 1, 1, 1, 1, 1,
-0.05851837, -1.265408, -2.37682, 1, 1, 1, 1, 1,
-0.05597122, 0.6318533, -0.06760717, 1, 1, 1, 1, 1,
-0.05099443, -0.9004684, -2.061745, 1, 1, 1, 1, 1,
-0.04195393, -0.3459556, -1.797129, 1, 1, 1, 1, 1,
-0.03854667, -0.66576, -3.647185, 1, 1, 1, 1, 1,
-0.0355756, -0.7080965, -3.691088, 1, 1, 1, 1, 1,
-0.03507276, -0.3617005, -4.28406, 1, 1, 1, 1, 1,
-0.03025895, 1.640381, 0.4969827, 1, 1, 1, 1, 1,
-0.02905911, -0.1242905, -2.853149, 1, 1, 1, 1, 1,
-0.02542039, 0.9683774, -1.450496, 1, 1, 1, 1, 1,
-0.0248001, -0.5894673, -3.90264, 0, 0, 1, 1, 1,
-0.02330616, 1.417106, -0.2590767, 1, 0, 0, 1, 1,
-0.02068142, -0.09692024, -2.168299, 1, 0, 0, 1, 1,
-0.02040314, 1.681084, 0.0810541, 1, 0, 0, 1, 1,
-0.01907582, 0.6888739, -0.4503779, 1, 0, 0, 1, 1,
-0.01886419, 1.827868, 0.156609, 1, 0, 0, 1, 1,
-0.0177518, -1.471504, -2.217891, 0, 0, 0, 1, 1,
-0.01654921, -0.539181, -4.555712, 0, 0, 0, 1, 1,
-0.01237618, -0.7752087, -2.912001, 0, 0, 0, 1, 1,
-0.009449785, -1.16926, -3.757607, 0, 0, 0, 1, 1,
-0.009405679, -0.8892691, -3.929023, 0, 0, 0, 1, 1,
-0.008368001, 2.031162, 0.8358019, 0, 0, 0, 1, 1,
-0.006771153, 0.08176684, -1.344998, 0, 0, 0, 1, 1,
-0.005105168, 1.291691, -0.1305177, 1, 1, 1, 1, 1,
-0.002456562, -0.005934281, -3.301031, 1, 1, 1, 1, 1,
0.005410598, -1.274012, 3.58708, 1, 1, 1, 1, 1,
0.005535424, -1.76316, 4.011708, 1, 1, 1, 1, 1,
0.005874701, 0.8121424, 0.06397891, 1, 1, 1, 1, 1,
0.008081696, 1.855157, -0.5720668, 1, 1, 1, 1, 1,
0.008091191, 0.7711579, 0.985155, 1, 1, 1, 1, 1,
0.01191823, -0.3251422, 2.498677, 1, 1, 1, 1, 1,
0.01501704, -0.3887401, 3.277937, 1, 1, 1, 1, 1,
0.01532426, -1.094925, 4.275298, 1, 1, 1, 1, 1,
0.01794653, 0.8334194, -0.5454173, 1, 1, 1, 1, 1,
0.02092116, 1.252038, 0.6051433, 1, 1, 1, 1, 1,
0.03209894, 1.093292, 1.476251, 1, 1, 1, 1, 1,
0.0333878, -0.02474576, 1.974758, 1, 1, 1, 1, 1,
0.03499113, 0.2446782, -0.4003714, 1, 1, 1, 1, 1,
0.0362736, -1.740207, 4.141909, 0, 0, 1, 1, 1,
0.03982988, -0.6250674, 2.283624, 1, 0, 0, 1, 1,
0.04183077, 1.27484, -1.337514, 1, 0, 0, 1, 1,
0.04519075, -0.6581798, 2.808352, 1, 0, 0, 1, 1,
0.04827847, -1.663711, 2.994806, 1, 0, 0, 1, 1,
0.05204681, -0.3869109, 3.572814, 1, 0, 0, 1, 1,
0.05502951, 1.543617, 0.5635228, 0, 0, 0, 1, 1,
0.06009797, -0.5052482, 3.488118, 0, 0, 0, 1, 1,
0.06486052, 0.4743157, 0.181134, 0, 0, 0, 1, 1,
0.06506741, -1.964657, 3.8086, 0, 0, 0, 1, 1,
0.07471091, 0.7053784, 0.8654699, 0, 0, 0, 1, 1,
0.0751247, -0.08458558, 3.910738, 0, 0, 0, 1, 1,
0.07738473, -0.7585826, 3.028209, 0, 0, 0, 1, 1,
0.07985306, 0.6292339, -1.824167, 1, 1, 1, 1, 1,
0.08643557, 1.219275, 0.9838707, 1, 1, 1, 1, 1,
0.09332969, 0.4880884, 0.06584816, 1, 1, 1, 1, 1,
0.09454248, 0.6938433, -1.530444, 1, 1, 1, 1, 1,
0.09575044, -0.1302355, 2.426856, 1, 1, 1, 1, 1,
0.0966934, -1.618215, 3.632713, 1, 1, 1, 1, 1,
0.09681111, -0.9077293, 0.9674279, 1, 1, 1, 1, 1,
0.1004581, -1.017988, 2.03361, 1, 1, 1, 1, 1,
0.1041052, 0.7270306, 0.1081759, 1, 1, 1, 1, 1,
0.1079565, 0.5569883, -0.8945505, 1, 1, 1, 1, 1,
0.1156924, -0.5143366, 3.410461, 1, 1, 1, 1, 1,
0.1200978, -1.901774, 4.778943, 1, 1, 1, 1, 1,
0.1202431, -0.4420936, 1.917046, 1, 1, 1, 1, 1,
0.1213438, -1.128861, 4.792684, 1, 1, 1, 1, 1,
0.1235844, -0.01741591, 0.9304844, 1, 1, 1, 1, 1,
0.127265, 1.558618, -0.673973, 0, 0, 1, 1, 1,
0.1293561, 1.944065, -0.8432304, 1, 0, 0, 1, 1,
0.1334967, -3.021291, 4.473676, 1, 0, 0, 1, 1,
0.1399569, -0.7385764, 2.920017, 1, 0, 0, 1, 1,
0.1412488, -0.5991005, 2.051407, 1, 0, 0, 1, 1,
0.1451647, 0.3234485, 1.83298, 1, 0, 0, 1, 1,
0.1459642, 0.1249552, -0.5180553, 0, 0, 0, 1, 1,
0.1498845, 0.8994108, -1.636372, 0, 0, 0, 1, 1,
0.150894, 0.624958, -0.7751153, 0, 0, 0, 1, 1,
0.1556446, 0.9702209, 2.529786, 0, 0, 0, 1, 1,
0.1585399, 2.894211, -0.5023628, 0, 0, 0, 1, 1,
0.1586863, 0.6446609, 1.247276, 0, 0, 0, 1, 1,
0.1605702, -1.102717, 2.125103, 0, 0, 0, 1, 1,
0.1639955, -0.47433, 1.686742, 1, 1, 1, 1, 1,
0.1674275, -0.2819629, 2.13612, 1, 1, 1, 1, 1,
0.1688446, 1.171086, 0.8985109, 1, 1, 1, 1, 1,
0.1693099, 1.119746, -0.5021747, 1, 1, 1, 1, 1,
0.1740678, 0.9172755, 1.253279, 1, 1, 1, 1, 1,
0.174291, -1.899336, 2.641134, 1, 1, 1, 1, 1,
0.1751163, 0.1038646, 0.3759429, 1, 1, 1, 1, 1,
0.1801745, 0.686056, 1.196993, 1, 1, 1, 1, 1,
0.1832868, 1.347631, 1.053545, 1, 1, 1, 1, 1,
0.1834096, 0.6374491, 1.412486, 1, 1, 1, 1, 1,
0.1845685, 1.104328, -1.183522, 1, 1, 1, 1, 1,
0.1868491, 1.399644, -0.8851751, 1, 1, 1, 1, 1,
0.1888462, -0.3268329, 2.240764, 1, 1, 1, 1, 1,
0.1897936, -0.5796862, 4.748066, 1, 1, 1, 1, 1,
0.191067, 1.121718, -0.9102287, 1, 1, 1, 1, 1,
0.1938056, 0.4701869, 0.5832332, 0, 0, 1, 1, 1,
0.1950921, 0.06994481, 1.392128, 1, 0, 0, 1, 1,
0.1975503, -0.3803177, 1.48439, 1, 0, 0, 1, 1,
0.1990389, 0.05122576, 0.120643, 1, 0, 0, 1, 1,
0.2037225, -0.8360843, 2.635092, 1, 0, 0, 1, 1,
0.2045867, 0.6634989, 0.4052832, 1, 0, 0, 1, 1,
0.2076365, 1.223236, 0.9809166, 0, 0, 0, 1, 1,
0.2081863, 0.3095104, 0.6741717, 0, 0, 0, 1, 1,
0.208496, -0.1161271, 3.752942, 0, 0, 0, 1, 1,
0.223389, -0.7302058, 3.655045, 0, 0, 0, 1, 1,
0.229876, 1.747813, 0.03457774, 0, 0, 0, 1, 1,
0.2299025, -0.001671456, 3.252064, 0, 0, 0, 1, 1,
0.23276, -2.500762, 2.644183, 0, 0, 0, 1, 1,
0.2333188, -0.6067117, 3.355554, 1, 1, 1, 1, 1,
0.2350606, -0.1074901, 2.519725, 1, 1, 1, 1, 1,
0.2373777, -0.74737, 1.69704, 1, 1, 1, 1, 1,
0.2394761, 1.394387, -0.2878071, 1, 1, 1, 1, 1,
0.2405694, -1.671922, 3.269348, 1, 1, 1, 1, 1,
0.2424004, -0.4710797, 2.330589, 1, 1, 1, 1, 1,
0.2440387, -0.8351564, 2.848493, 1, 1, 1, 1, 1,
0.2456179, 0.6755237, 1.260316, 1, 1, 1, 1, 1,
0.2461452, -0.7407453, 1.555054, 1, 1, 1, 1, 1,
0.2463103, 0.3232843, 1.584742, 1, 1, 1, 1, 1,
0.2489695, 2.450658, -0.1660708, 1, 1, 1, 1, 1,
0.2500686, 0.8659639, 0.1159365, 1, 1, 1, 1, 1,
0.2502066, 0.7607469, -0.7460383, 1, 1, 1, 1, 1,
0.2514004, -0.1720249, 3.173635, 1, 1, 1, 1, 1,
0.2529425, 0.2559263, 2.69025, 1, 1, 1, 1, 1,
0.2559145, 0.3301461, 2.001116, 0, 0, 1, 1, 1,
0.2563463, -0.93918, 3.096584, 1, 0, 0, 1, 1,
0.2593245, 1.095385, 0.8414655, 1, 0, 0, 1, 1,
0.2627936, 1.159893, -0.7092721, 1, 0, 0, 1, 1,
0.2663082, 0.6719682, 0.4014597, 1, 0, 0, 1, 1,
0.2672914, -0.9541716, 1.599492, 1, 0, 0, 1, 1,
0.2682113, -0.2281099, 2.706409, 0, 0, 0, 1, 1,
0.2694439, 0.9495304, -1.795396, 0, 0, 0, 1, 1,
0.2749226, 1.963889, 1.042509, 0, 0, 0, 1, 1,
0.283145, -0.2867262, 4.317483, 0, 0, 0, 1, 1,
0.2861013, -0.7513007, 3.629929, 0, 0, 0, 1, 1,
0.2909397, -1.077623, 4.423751, 0, 0, 0, 1, 1,
0.2911357, 0.4215068, -0.5447941, 0, 0, 0, 1, 1,
0.2917018, -1.007328, 2.320112, 1, 1, 1, 1, 1,
0.2920801, 1.110036, -1.284219, 1, 1, 1, 1, 1,
0.3010109, -0.4278412, 1.268339, 1, 1, 1, 1, 1,
0.3104984, 0.2738569, 1.678173, 1, 1, 1, 1, 1,
0.3136119, 0.3992698, -0.4684509, 1, 1, 1, 1, 1,
0.3178785, 0.8343822, 0.4970433, 1, 1, 1, 1, 1,
0.3190972, -0.1939243, 1.895123, 1, 1, 1, 1, 1,
0.3195305, 0.2416653, 0.301701, 1, 1, 1, 1, 1,
0.3219524, 0.1355252, 3.655259, 1, 1, 1, 1, 1,
0.3232392, -2.242213, 4.044852, 1, 1, 1, 1, 1,
0.3257657, 1.39017, 0.1572167, 1, 1, 1, 1, 1,
0.3273892, 0.5438825, 1.018347, 1, 1, 1, 1, 1,
0.3317455, 0.555994, 0.9786048, 1, 1, 1, 1, 1,
0.3317693, 0.6574284, -0.3909293, 1, 1, 1, 1, 1,
0.3358309, 1.715383, 1.086789, 1, 1, 1, 1, 1,
0.3379936, -1.087914, 4.754317, 0, 0, 1, 1, 1,
0.3425547, 0.4813628, 0.970969, 1, 0, 0, 1, 1,
0.3448733, -0.5664703, 0.9005061, 1, 0, 0, 1, 1,
0.3491604, -1.030513, 2.244905, 1, 0, 0, 1, 1,
0.3548028, -0.01397048, 1.10848, 1, 0, 0, 1, 1,
0.3564954, -0.5194284, 2.198967, 1, 0, 0, 1, 1,
0.3589992, 0.6766906, 0.3152307, 0, 0, 0, 1, 1,
0.360775, 1.855822, -0.1288981, 0, 0, 0, 1, 1,
0.3636399, 1.254745, 1.1239, 0, 0, 0, 1, 1,
0.3669131, -2.121214, 3.788695, 0, 0, 0, 1, 1,
0.3674799, 1.308531, -0.08229131, 0, 0, 0, 1, 1,
0.3707612, -0.9311532, 2.534746, 0, 0, 0, 1, 1,
0.3749539, 0.4148208, 0.9413176, 0, 0, 0, 1, 1,
0.3756435, 1.418243, -0.9386308, 1, 1, 1, 1, 1,
0.3763553, -0.8159151, 1.811554, 1, 1, 1, 1, 1,
0.3798499, -0.06224602, 3.219293, 1, 1, 1, 1, 1,
0.3852517, -1.567599, 2.014704, 1, 1, 1, 1, 1,
0.3877664, -1.558821, 2.46704, 1, 1, 1, 1, 1,
0.3879099, 0.1874679, 1.064147, 1, 1, 1, 1, 1,
0.3974217, -0.6202756, 2.318032, 1, 1, 1, 1, 1,
0.4005515, 0.667133, 0.8689164, 1, 1, 1, 1, 1,
0.4106943, -0.1130235, 1.839151, 1, 1, 1, 1, 1,
0.4162564, -1.0033, 2.852345, 1, 1, 1, 1, 1,
0.4179516, 1.914194, -0.4828157, 1, 1, 1, 1, 1,
0.4209615, -0.3573398, 0.3339994, 1, 1, 1, 1, 1,
0.4212605, -0.4703313, 3.574542, 1, 1, 1, 1, 1,
0.4276855, -0.7713598, 2.235391, 1, 1, 1, 1, 1,
0.4290142, -1.070348, 1.633994, 1, 1, 1, 1, 1,
0.4305164, 1.461721, 0.6646528, 0, 0, 1, 1, 1,
0.4320181, -1.366963, 2.044816, 1, 0, 0, 1, 1,
0.4371695, -0.6076641, 1.233601, 1, 0, 0, 1, 1,
0.4433604, 0.4160026, 1.642637, 1, 0, 0, 1, 1,
0.4507866, -1.473373, 1.636107, 1, 0, 0, 1, 1,
0.4575104, -0.05392351, 3.694357, 1, 0, 0, 1, 1,
0.458878, 0.852913, 0.8263373, 0, 0, 0, 1, 1,
0.4590899, 0.3362536, 0.3837357, 0, 0, 0, 1, 1,
0.4611788, 0.2029776, 1.077248, 0, 0, 0, 1, 1,
0.4616563, 0.7751034, 2.399266, 0, 0, 0, 1, 1,
0.4633992, -0.3541862, 1.479424, 0, 0, 0, 1, 1,
0.4650518, -0.8798862, 2.810363, 0, 0, 0, 1, 1,
0.4674152, 0.1482445, -0.280345, 0, 0, 0, 1, 1,
0.469835, 0.3610773, 0.7369755, 1, 1, 1, 1, 1,
0.472799, 2.515305, -0.4815698, 1, 1, 1, 1, 1,
0.4740234, -0.7881017, 2.295393, 1, 1, 1, 1, 1,
0.4742682, -0.7440147, 1.368564, 1, 1, 1, 1, 1,
0.4744645, 1.656577, 1.039139, 1, 1, 1, 1, 1,
0.4763836, 2.146705, 1.163755, 1, 1, 1, 1, 1,
0.4764506, -0.1464387, 2.574017, 1, 1, 1, 1, 1,
0.4764787, 1.203546, -0.3896323, 1, 1, 1, 1, 1,
0.4782088, 0.5760754, -2.743163, 1, 1, 1, 1, 1,
0.4803741, 0.2721136, 2.81861, 1, 1, 1, 1, 1,
0.4822749, -0.06968904, 1.13345, 1, 1, 1, 1, 1,
0.4841878, 1.02889, 0.4581986, 1, 1, 1, 1, 1,
0.4849635, 0.4582826, 0.9821098, 1, 1, 1, 1, 1,
0.4902051, -0.4383259, 1.551646, 1, 1, 1, 1, 1,
0.4939039, 0.2448922, 0.4589109, 1, 1, 1, 1, 1,
0.502896, 0.6752155, 1.743237, 0, 0, 1, 1, 1,
0.5030537, 0.02716939, 1.912903, 1, 0, 0, 1, 1,
0.5042542, 0.378858, 1.380728, 1, 0, 0, 1, 1,
0.5090563, 0.8097485, 0.3015734, 1, 0, 0, 1, 1,
0.514423, -0.02194511, 2.653871, 1, 0, 0, 1, 1,
0.5147709, -0.6561773, 2.538277, 1, 0, 0, 1, 1,
0.5176713, 0.1702107, 1.778953, 0, 0, 0, 1, 1,
0.5206015, -1.658025, 2.769482, 0, 0, 0, 1, 1,
0.5235912, -0.05074923, 0.1482379, 0, 0, 0, 1, 1,
0.5256985, -0.072198, -0.2276196, 0, 0, 0, 1, 1,
0.528779, -0.8533611, 3.343459, 0, 0, 0, 1, 1,
0.5306136, 0.3926315, 0.351611, 0, 0, 0, 1, 1,
0.530652, 1.287346, 1.531028, 0, 0, 0, 1, 1,
0.5347404, 0.8674484, 1.049101, 1, 1, 1, 1, 1,
0.5352047, -0.2769128, 4.41785, 1, 1, 1, 1, 1,
0.5359663, -0.5926086, 2.822493, 1, 1, 1, 1, 1,
0.5366147, -0.3255116, 1.871178, 1, 1, 1, 1, 1,
0.5381508, 0.07342266, 2.11064, 1, 1, 1, 1, 1,
0.5418367, 0.7515101, -1.10465, 1, 1, 1, 1, 1,
0.5458724, 0.1889095, 1.273965, 1, 1, 1, 1, 1,
0.5462446, 0.9383327, 0.5837981, 1, 1, 1, 1, 1,
0.5508776, -0.3172237, 2.225141, 1, 1, 1, 1, 1,
0.5514507, -0.2824312, 2.723605, 1, 1, 1, 1, 1,
0.5554678, 0.8404929, 1.677119, 1, 1, 1, 1, 1,
0.5574184, 0.4807218, -0.5613532, 1, 1, 1, 1, 1,
0.5579951, 0.7564642, 0.4852546, 1, 1, 1, 1, 1,
0.5631125, 1.472061, 2.540509, 1, 1, 1, 1, 1,
0.5631999, 1.95219, 0.4163141, 1, 1, 1, 1, 1,
0.5633631, -0.1259631, 3.391389, 0, 0, 1, 1, 1,
0.5641221, -0.9216347, 2.89336, 1, 0, 0, 1, 1,
0.567202, -1.109222, 2.53472, 1, 0, 0, 1, 1,
0.5676881, -0.5042827, 3.018095, 1, 0, 0, 1, 1,
0.5718368, -1.201169, 0.9370054, 1, 0, 0, 1, 1,
0.5754921, -0.4143904, 3.439202, 1, 0, 0, 1, 1,
0.5768762, -0.7370557, 2.999798, 0, 0, 0, 1, 1,
0.5809518, 0.6209785, 2.286797, 0, 0, 0, 1, 1,
0.5812401, 0.8501821, 0.5744163, 0, 0, 0, 1, 1,
0.5852517, 1.899169, -1.649952, 0, 0, 0, 1, 1,
0.5865666, -0.2879984, 1.171073, 0, 0, 0, 1, 1,
0.5877324, 0.3442595, 1.918002, 0, 0, 0, 1, 1,
0.5893288, 0.3185815, 0.6100765, 0, 0, 0, 1, 1,
0.5924369, -1.720981, 3.530083, 1, 1, 1, 1, 1,
0.5963168, -0.4499164, 4.621492, 1, 1, 1, 1, 1,
0.6019732, -0.8508316, 1.489226, 1, 1, 1, 1, 1,
0.6026202, -1.058795, 2.408526, 1, 1, 1, 1, 1,
0.6066807, -0.1576867, 1.857288, 1, 1, 1, 1, 1,
0.6105039, 0.7411936, 1.259389, 1, 1, 1, 1, 1,
0.6147903, -0.314732, 1.6333, 1, 1, 1, 1, 1,
0.615445, -0.4178345, 3.888478, 1, 1, 1, 1, 1,
0.6208579, -1.093009, 2.25361, 1, 1, 1, 1, 1,
0.6235365, 0.2541879, 2.052992, 1, 1, 1, 1, 1,
0.6257238, -1.711659, 2.7696, 1, 1, 1, 1, 1,
0.6276233, -0.426535, 0.7134442, 1, 1, 1, 1, 1,
0.6345733, 1.389, 0.375131, 1, 1, 1, 1, 1,
0.6365916, -0.3890814, 1.026603, 1, 1, 1, 1, 1,
0.6430036, -0.03281182, 0.8443264, 1, 1, 1, 1, 1,
0.6469486, -0.5183507, 3.755619, 0, 0, 1, 1, 1,
0.6474776, -0.2950221, 1.733592, 1, 0, 0, 1, 1,
0.6493538, 0.1257362, 0.8569061, 1, 0, 0, 1, 1,
0.6536105, -0.7384162, 1.356489, 1, 0, 0, 1, 1,
0.655035, -0.5872586, 1.690173, 1, 0, 0, 1, 1,
0.6557772, -1.461037, 2.695125, 1, 0, 0, 1, 1,
0.6608272, 1.126446, 0.3235581, 0, 0, 0, 1, 1,
0.6612728, 0.3834715, -0.3235785, 0, 0, 0, 1, 1,
0.6639281, 2.409908, 1.239636, 0, 0, 0, 1, 1,
0.6648577, -0.4100087, 2.283885, 0, 0, 0, 1, 1,
0.6732574, -1.062057, 2.905495, 0, 0, 0, 1, 1,
0.6745744, -0.565038, 3.631785, 0, 0, 0, 1, 1,
0.6792349, -0.2707569, 1.032232, 0, 0, 0, 1, 1,
0.6794896, 0.8433522, -0.2117263, 1, 1, 1, 1, 1,
0.680088, 0.4834382, -0.5232687, 1, 1, 1, 1, 1,
0.6818228, 0.18098, 0.2465393, 1, 1, 1, 1, 1,
0.6884289, 1.167107, 1.443635, 1, 1, 1, 1, 1,
0.6889637, 0.5738159, 0.7637072, 1, 1, 1, 1, 1,
0.6922736, -0.1479075, 3.038052, 1, 1, 1, 1, 1,
0.6928901, 2.267817, 0.7687712, 1, 1, 1, 1, 1,
0.6951874, 0.6552928, 1.918431, 1, 1, 1, 1, 1,
0.7001334, 0.5525958, 0.8109114, 1, 1, 1, 1, 1,
0.7067671, -1.050307, 2.269834, 1, 1, 1, 1, 1,
0.7156914, -1.067443, 4.587496, 1, 1, 1, 1, 1,
0.7186996, 0.9752756, 1.262648, 1, 1, 1, 1, 1,
0.7202356, 0.355658, 0.345001, 1, 1, 1, 1, 1,
0.7262079, 0.7390237, 0.5432171, 1, 1, 1, 1, 1,
0.7305322, -1.716515, 3.979238, 1, 1, 1, 1, 1,
0.737116, -0.5711099, 2.404612, 0, 0, 1, 1, 1,
0.7394356, 0.1500345, 2.272733, 1, 0, 0, 1, 1,
0.7433868, -0.5983196, 3.419328, 1, 0, 0, 1, 1,
0.7492874, 0.7432511, -0.03764387, 1, 0, 0, 1, 1,
0.7523418, 1.271984, 1.688951, 1, 0, 0, 1, 1,
0.7611532, 1.288406, 0.4976553, 1, 0, 0, 1, 1,
0.7628282, -0.2176997, 3.251445, 0, 0, 0, 1, 1,
0.773305, -0.1145524, 1.468416, 0, 0, 0, 1, 1,
0.7875329, -3.371153, 2.911953, 0, 0, 0, 1, 1,
0.7878993, -1.019284, 2.095622, 0, 0, 0, 1, 1,
0.7889517, -0.1184277, 1.470575, 0, 0, 0, 1, 1,
0.7889857, -3.027805, 2.667371, 0, 0, 0, 1, 1,
0.7890924, 1.738631, 0.8707997, 0, 0, 0, 1, 1,
0.7896987, -0.5435948, 1.846302, 1, 1, 1, 1, 1,
0.7903471, -0.743516, 1.413025, 1, 1, 1, 1, 1,
0.7907308, 1.309891, 0.8750952, 1, 1, 1, 1, 1,
0.7933224, -0.4355673, 2.718848, 1, 1, 1, 1, 1,
0.8049682, -0.5679092, 0.8936299, 1, 1, 1, 1, 1,
0.8093856, -0.9677843, 2.476886, 1, 1, 1, 1, 1,
0.8137408, 0.7056748, 1.681046, 1, 1, 1, 1, 1,
0.8150636, 0.1581728, 1.89706, 1, 1, 1, 1, 1,
0.8162129, 1.172228, -1.347966, 1, 1, 1, 1, 1,
0.8163788, 1.113092, 0.1315846, 1, 1, 1, 1, 1,
0.8165727, 1.703844, 1.206965, 1, 1, 1, 1, 1,
0.8184282, -1.337892, 2.86733, 1, 1, 1, 1, 1,
0.823983, -0.2889471, 2.538908, 1, 1, 1, 1, 1,
0.8253818, -0.1166145, 4.880819, 1, 1, 1, 1, 1,
0.8307856, 0.1194682, 2.213905, 1, 1, 1, 1, 1,
0.8322034, 0.7659757, -0.5583284, 0, 0, 1, 1, 1,
0.8351903, 0.979238, 0.8404238, 1, 0, 0, 1, 1,
0.8374816, 0.9330339, 0.6327579, 1, 0, 0, 1, 1,
0.8403044, -1.856527, 2.690692, 1, 0, 0, 1, 1,
0.843227, 0.0263279, 1.790647, 1, 0, 0, 1, 1,
0.8473343, 0.8565583, -0.2382675, 1, 0, 0, 1, 1,
0.8554912, 0.7270662, 1.855612, 0, 0, 0, 1, 1,
0.8572187, 0.9616603, 0.1630419, 0, 0, 0, 1, 1,
0.869192, 0.4813184, 0.1606644, 0, 0, 0, 1, 1,
0.8725872, 0.7107021, 0.01299435, 0, 0, 0, 1, 1,
0.8726646, 0.009749753, 1.945561, 0, 0, 0, 1, 1,
0.8763424, -0.5762514, 3.135761, 0, 0, 0, 1, 1,
0.8777978, -1.334779, 3.688521, 0, 0, 0, 1, 1,
0.8788362, 0.518966, -0.8510109, 1, 1, 1, 1, 1,
0.8794737, -0.2208501, 1.551171, 1, 1, 1, 1, 1,
0.8878238, 2.082808, -0.626132, 1, 1, 1, 1, 1,
0.8943619, 1.478026, 0.6321899, 1, 1, 1, 1, 1,
0.895245, 0.1180884, 2.753352, 1, 1, 1, 1, 1,
0.9021603, 0.2280469, 0.8234537, 1, 1, 1, 1, 1,
0.9035283, -0.0543557, 0.9491845, 1, 1, 1, 1, 1,
0.91369, -1.119135, 2.253671, 1, 1, 1, 1, 1,
0.9144829, 1.506799, -0.590503, 1, 1, 1, 1, 1,
0.9150169, 0.7400163, 0.8805808, 1, 1, 1, 1, 1,
0.9153924, -0.5118632, 2.09256, 1, 1, 1, 1, 1,
0.9165093, 1.551377, 0.1989203, 1, 1, 1, 1, 1,
0.9230642, 1.07985, 1.231881, 1, 1, 1, 1, 1,
0.9244465, -0.06759994, 1.722293, 1, 1, 1, 1, 1,
0.9386173, 0.377608, 1.744501, 1, 1, 1, 1, 1,
0.9433679, -2.294669, 1.790265, 0, 0, 1, 1, 1,
0.943509, 0.3666672, 1.453148, 1, 0, 0, 1, 1,
0.9521012, -1.414389, 1.096627, 1, 0, 0, 1, 1,
0.9589402, -0.09633149, 3.025872, 1, 0, 0, 1, 1,
0.959941, -1.066949, 2.85787, 1, 0, 0, 1, 1,
0.9605097, 0.0513988, 2.296294, 1, 0, 0, 1, 1,
0.9625661, 0.4568246, 0.6392555, 0, 0, 0, 1, 1,
0.9636084, 0.8165857, 1.835505, 0, 0, 0, 1, 1,
0.9639036, 0.2634714, 3.656016, 0, 0, 0, 1, 1,
0.967456, -0.1426587, 1.173951, 0, 0, 0, 1, 1,
0.9685333, -0.2442058, 3.313644, 0, 0, 0, 1, 1,
0.9811434, 0.09597976, -0.05836247, 0, 0, 0, 1, 1,
0.9917966, 0.5435202, 0.1811267, 0, 0, 0, 1, 1,
0.992166, 0.3712853, 2.567046, 1, 1, 1, 1, 1,
0.9992315, -0.4946219, 1.928384, 1, 1, 1, 1, 1,
1.000423, -0.5338498, 2.574382, 1, 1, 1, 1, 1,
1.001754, -0.498034, 1.801492, 1, 1, 1, 1, 1,
1.008429, -0.6394438, 0.7383125, 1, 1, 1, 1, 1,
1.014663, 1.084587, 1.742166, 1, 1, 1, 1, 1,
1.016987, 0.1433518, 0.9001991, 1, 1, 1, 1, 1,
1.025444, 0.0121465, 0.4508679, 1, 1, 1, 1, 1,
1.031574, 0.5227113, 1.165918, 1, 1, 1, 1, 1,
1.040712, -0.04780277, 1.85332, 1, 1, 1, 1, 1,
1.042629, 0.2802682, 1.223899, 1, 1, 1, 1, 1,
1.047894, 0.1449422, 1.21477, 1, 1, 1, 1, 1,
1.061945, 0.9347592, 1.15405, 1, 1, 1, 1, 1,
1.066796, 0.6236709, 0.875202, 1, 1, 1, 1, 1,
1.075968, -1.239579, 2.516646, 1, 1, 1, 1, 1,
1.077469, -0.2983255, 0.7314624, 0, 0, 1, 1, 1,
1.081175, -0.4153135, 2.331413, 1, 0, 0, 1, 1,
1.095562, -0.8798508, 1.496625, 1, 0, 0, 1, 1,
1.096984, -0.1027695, 2.34395, 1, 0, 0, 1, 1,
1.099946, -0.04407547, 2.843971, 1, 0, 0, 1, 1,
1.106283, 0.3086205, 1.903277, 1, 0, 0, 1, 1,
1.113627, -1.054786, 3.147735, 0, 0, 0, 1, 1,
1.11422, 1.110705, -0.3329092, 0, 0, 0, 1, 1,
1.116792, -0.3578971, 1.682514, 0, 0, 0, 1, 1,
1.119727, -1.364772, 2.776334, 0, 0, 0, 1, 1,
1.137829, 0.6037831, 1.559191, 0, 0, 0, 1, 1,
1.138878, 1.072604, -0.02393412, 0, 0, 0, 1, 1,
1.140387, -2.019275, 5.132554, 0, 0, 0, 1, 1,
1.140391, -0.8277438, 2.246333, 1, 1, 1, 1, 1,
1.14439, -0.6897416, 3.038087, 1, 1, 1, 1, 1,
1.145221, -3.400606, 0.6539561, 1, 1, 1, 1, 1,
1.146327, -0.3033921, 2.643086, 1, 1, 1, 1, 1,
1.146461, -0.1585032, 0.1885945, 1, 1, 1, 1, 1,
1.152237, -0.09161323, 1.499963, 1, 1, 1, 1, 1,
1.161959, 0.3852428, 1.300685, 1, 1, 1, 1, 1,
1.164231, -0.1186816, 1.036116, 1, 1, 1, 1, 1,
1.170344, -1.268301, 2.641145, 1, 1, 1, 1, 1,
1.17872, -0.226118, 1.002567, 1, 1, 1, 1, 1,
1.184271, -0.6550047, 0.6686224, 1, 1, 1, 1, 1,
1.184767, -0.1365428, 0.8545173, 1, 1, 1, 1, 1,
1.196813, -0.5180658, 2.631069, 1, 1, 1, 1, 1,
1.200958, 1.014851, -0.353527, 1, 1, 1, 1, 1,
1.202293, -0.3900123, 0.53177, 1, 1, 1, 1, 1,
1.20252, 2.665787, -0.7538701, 0, 0, 1, 1, 1,
1.204142, 1.391758, 1.857303, 1, 0, 0, 1, 1,
1.208349, 0.7779593, 3.209833, 1, 0, 0, 1, 1,
1.221292, 0.4018493, 1.335329, 1, 0, 0, 1, 1,
1.223006, 2.511509, 1.540253, 1, 0, 0, 1, 1,
1.233086, -0.4274436, 1.211605, 1, 0, 0, 1, 1,
1.237659, -0.7943431, 1.628726, 0, 0, 0, 1, 1,
1.240583, -1.47843, 2.595103, 0, 0, 0, 1, 1,
1.245464, 0.8056141, 2.507658, 0, 0, 0, 1, 1,
1.250168, -0.396122, 0.9192685, 0, 0, 0, 1, 1,
1.254089, -0.06154766, 0.1889331, 0, 0, 0, 1, 1,
1.265866, -0.3831326, 1.092204, 0, 0, 0, 1, 1,
1.266782, 1.535574, -0.4995351, 0, 0, 0, 1, 1,
1.271691, -0.6745009, 1.190923, 1, 1, 1, 1, 1,
1.27185, 0.5173612, 0.7954182, 1, 1, 1, 1, 1,
1.283456, 0.3435445, -0.1779625, 1, 1, 1, 1, 1,
1.286105, 1.037928, 1.009381, 1, 1, 1, 1, 1,
1.287707, -0.5056174, 2.805676, 1, 1, 1, 1, 1,
1.299478, 0.1805493, 0.5996984, 1, 1, 1, 1, 1,
1.300265, 0.485297, -0.1217537, 1, 1, 1, 1, 1,
1.305718, 0.6478521, -0.9571531, 1, 1, 1, 1, 1,
1.307586, 0.1199719, 1.700316, 1, 1, 1, 1, 1,
1.310219, -2.115472, 1.345159, 1, 1, 1, 1, 1,
1.336666, 0.5417606, 3.071289, 1, 1, 1, 1, 1,
1.33696, -2.043785, 2.713313, 1, 1, 1, 1, 1,
1.341035, -0.7421871, 1.414727, 1, 1, 1, 1, 1,
1.346183, -0.6236102, 2.357663, 1, 1, 1, 1, 1,
1.350723, 0.532765, 2.615617, 1, 1, 1, 1, 1,
1.35624, -2.317124, 1.263604, 0, 0, 1, 1, 1,
1.359448, -0.8407663, 3.98929, 1, 0, 0, 1, 1,
1.364301, -2.244956, 1.799613, 1, 0, 0, 1, 1,
1.365085, -0.5124488, 1.264049, 1, 0, 0, 1, 1,
1.380057, 0.1352177, 0.9866432, 1, 0, 0, 1, 1,
1.399166, 0.9968264, 1.722154, 1, 0, 0, 1, 1,
1.399728, -0.1764166, 0.08414495, 0, 0, 0, 1, 1,
1.422572, 1.099454, 0.7898681, 0, 0, 0, 1, 1,
1.437292, 0.7027076, -1.058396, 0, 0, 0, 1, 1,
1.450471, -1.585808, 1.863681, 0, 0, 0, 1, 1,
1.457569, 1.056782, 0.1013627, 0, 0, 0, 1, 1,
1.47952, -0.5000101, 3.862243, 0, 0, 0, 1, 1,
1.481292, -2.144732, 2.873452, 0, 0, 0, 1, 1,
1.510556, -1.487255, 3.220338, 1, 1, 1, 1, 1,
1.516746, -0.1223122, 0.7076101, 1, 1, 1, 1, 1,
1.518234, 0.2589713, 1.991333, 1, 1, 1, 1, 1,
1.520631, -1.262784, 1.06793, 1, 1, 1, 1, 1,
1.521698, -1.095575, 1.554727, 1, 1, 1, 1, 1,
1.535498, -0.01914887, 0.5069681, 1, 1, 1, 1, 1,
1.56539, 1.192039, 1.710431, 1, 1, 1, 1, 1,
1.569629, 0.6519796, 1.36727, 1, 1, 1, 1, 1,
1.582949, -0.02317612, 0.9366257, 1, 1, 1, 1, 1,
1.591975, -0.6527821, 0.7299399, 1, 1, 1, 1, 1,
1.609978, 0.1742706, -0.1329408, 1, 1, 1, 1, 1,
1.612575, -0.4305273, 0.3723829, 1, 1, 1, 1, 1,
1.618438, -0.1875654, 0.7032037, 1, 1, 1, 1, 1,
1.623374, 0.1563262, 2.002847, 1, 1, 1, 1, 1,
1.637031, -0.5041177, 1.072717, 1, 1, 1, 1, 1,
1.649714, 1.787151, 0.9703304, 0, 0, 1, 1, 1,
1.654588, 0.2472332, 1.344799, 1, 0, 0, 1, 1,
1.656485, -2.448727, 1.38289, 1, 0, 0, 1, 1,
1.665265, -0.3240604, 1.222186, 1, 0, 0, 1, 1,
1.668644, -0.02052881, 1.597485, 1, 0, 0, 1, 1,
1.697679, 0.4150338, 0.2934341, 1, 0, 0, 1, 1,
1.71437, -0.2607308, 3.194972, 0, 0, 0, 1, 1,
1.722444, 0.9622405, 0.8652376, 0, 0, 0, 1, 1,
1.735881, 0.2478245, 1.119527, 0, 0, 0, 1, 1,
1.739432, 1.232319, -0.578836, 0, 0, 0, 1, 1,
1.778815, 1.174175, 0.7656077, 0, 0, 0, 1, 1,
1.785457, 0.2687072, 1.664699, 0, 0, 0, 1, 1,
1.788697, -0.3151686, 0.2486967, 0, 0, 0, 1, 1,
1.801131, -1.310312, 1.832212, 1, 1, 1, 1, 1,
1.802145, 1.646984, 0.2775678, 1, 1, 1, 1, 1,
1.831842, -0.9606555, 3.36445, 1, 1, 1, 1, 1,
1.835649, 0.4042481, 0.6431138, 1, 1, 1, 1, 1,
1.848921, -0.2179192, 1.834009, 1, 1, 1, 1, 1,
1.859725, -0.8411319, 1.877443, 1, 1, 1, 1, 1,
1.890243, 0.7445244, 3.276445, 1, 1, 1, 1, 1,
1.904936, -0.28309, 3.282769, 1, 1, 1, 1, 1,
1.913889, -1.568981, 1.449418, 1, 1, 1, 1, 1,
1.923486, -0.4248784, 1.066332, 1, 1, 1, 1, 1,
1.951884, 0.6420226, 0.2819516, 1, 1, 1, 1, 1,
1.971982, -0.8981066, 0.1897519, 1, 1, 1, 1, 1,
1.973065, -1.10292, 4.038205, 1, 1, 1, 1, 1,
1.984714, 0.2809513, 1.028854, 1, 1, 1, 1, 1,
2.019893, 0.1914068, 2.306974, 1, 1, 1, 1, 1,
2.055686, -1.160929, 1.228548, 0, 0, 1, 1, 1,
2.055923, -1.532947, 1.089543, 1, 0, 0, 1, 1,
2.06234, -0.5519556, -0.03504805, 1, 0, 0, 1, 1,
2.087524, -0.5803965, 0.198661, 1, 0, 0, 1, 1,
2.111292, -0.6106212, 2.531523, 1, 0, 0, 1, 1,
2.12051, -1.364052, 2.995223, 1, 0, 0, 1, 1,
2.126094, -2.666815, 0.7763966, 0, 0, 0, 1, 1,
2.161304, -0.5371702, 1.975789, 0, 0, 0, 1, 1,
2.191787, 1.530901, 1.762347, 0, 0, 0, 1, 1,
2.279917, 0.9423227, 2.047504, 0, 0, 0, 1, 1,
2.296819, 1.208472, 0.415872, 0, 0, 0, 1, 1,
2.340698, 0.2388493, 2.707799, 0, 0, 0, 1, 1,
2.375391, 0.09145713, 3.206157, 0, 0, 0, 1, 1,
2.407926, 1.495626, 2.303283, 1, 1, 1, 1, 1,
2.54699, 0.09203943, 2.609241, 1, 1, 1, 1, 1,
2.718129, -0.4921323, 3.744342, 1, 1, 1, 1, 1,
2.739765, 0.002677856, -0.6180184, 1, 1, 1, 1, 1,
2.786684, -1.506174, 2.072575, 1, 1, 1, 1, 1,
3.008162, -1.234878, 3.184963, 1, 1, 1, 1, 1,
3.119235, -1.63396, 1.678782, 1, 1, 1, 1, 1
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
var radius = 9.546547;
var distance = 33.53184;
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
mvMatrix.translate( 0.1453433, 0.2350519, 0.174665 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.53184);
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
