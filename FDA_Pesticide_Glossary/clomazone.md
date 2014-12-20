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
-3.409503, -1.153877, -1.501567, 1, 0, 0, 1,
-3.261292, -1.002194, -2.533968, 1, 0.007843138, 0, 1,
-3.088925, 0.1989157, -1.41771, 1, 0.01176471, 0, 1,
-2.980074, -0.951781, -0.02108961, 1, 0.01960784, 0, 1,
-2.566886, -0.4044444, -1.328596, 1, 0.02352941, 0, 1,
-2.503641, -0.8544492, -2.448961, 1, 0.03137255, 0, 1,
-2.441833, -0.4139744, -1.347564, 1, 0.03529412, 0, 1,
-2.32295, 0.4914085, -3.342242, 1, 0.04313726, 0, 1,
-2.320272, 1.045911, -1.057958, 1, 0.04705882, 0, 1,
-2.309943, 1.672982, -1.65767, 1, 0.05490196, 0, 1,
-2.256694, 1.309416, 0.638268, 1, 0.05882353, 0, 1,
-2.241609, 2.15346, -1.048902, 1, 0.06666667, 0, 1,
-2.229998, -2.24881, -2.135874, 1, 0.07058824, 0, 1,
-2.215183, -0.8996345, -4.224787, 1, 0.07843138, 0, 1,
-2.191939, -0.9288366, -1.782477, 1, 0.08235294, 0, 1,
-2.145795, 0.4100782, -1.156976, 1, 0.09019608, 0, 1,
-2.121882, 1.472806, -2.298972, 1, 0.09411765, 0, 1,
-2.12079, 0.5365472, -1.500965, 1, 0.1019608, 0, 1,
-2.089309, 1.113646, -2.48712, 1, 0.1098039, 0, 1,
-2.075475, -0.06828616, -2.116514, 1, 0.1137255, 0, 1,
-2.06348, 0.9148403, -3.415637, 1, 0.1215686, 0, 1,
-2.059397, 0.5012807, -0.1607746, 1, 0.1254902, 0, 1,
-2.055229, -0.2344622, -1.339703, 1, 0.1333333, 0, 1,
-2.050012, 0.2303294, -0.3287524, 1, 0.1372549, 0, 1,
-2.015168, -0.1489062, 0.01351954, 1, 0.145098, 0, 1,
-1.994479, 0.26365, 0.2080108, 1, 0.1490196, 0, 1,
-1.993584, 0.901247, -2.34898, 1, 0.1568628, 0, 1,
-1.972316, -0.7195492, -3.916791, 1, 0.1607843, 0, 1,
-1.940246, 0.6092377, -1.378531, 1, 0.1686275, 0, 1,
-1.936136, -2.099184, -1.776318, 1, 0.172549, 0, 1,
-1.929304, 1.027803, -1.008141, 1, 0.1803922, 0, 1,
-1.927103, -0.2145927, -2.698452, 1, 0.1843137, 0, 1,
-1.92162, 0.2570077, -0.3362703, 1, 0.1921569, 0, 1,
-1.917783, 0.5605176, -2.354746, 1, 0.1960784, 0, 1,
-1.903265, 0.7378357, -0.8307275, 1, 0.2039216, 0, 1,
-1.893561, -1.125084, -1.816667, 1, 0.2117647, 0, 1,
-1.893432, -0.7687042, -3.656435, 1, 0.2156863, 0, 1,
-1.84635, 1.62932, -0.3554535, 1, 0.2235294, 0, 1,
-1.83277, 0.6160265, -0.9271302, 1, 0.227451, 0, 1,
-1.774112, 0.9739326, -0.2024601, 1, 0.2352941, 0, 1,
-1.752119, 0.05661641, -0.7860018, 1, 0.2392157, 0, 1,
-1.743576, 1.436841, -2.020876, 1, 0.2470588, 0, 1,
-1.740074, 1.161771, -2.916938, 1, 0.2509804, 0, 1,
-1.731421, 0.3366799, -0.3421018, 1, 0.2588235, 0, 1,
-1.730546, 0.129405, -1.606891, 1, 0.2627451, 0, 1,
-1.726804, -0.4320264, -1.031304, 1, 0.2705882, 0, 1,
-1.706541, -1.687861, -2.753936, 1, 0.2745098, 0, 1,
-1.690384, 0.5291813, -2.350499, 1, 0.282353, 0, 1,
-1.669257, -0.4744139, -1.592527, 1, 0.2862745, 0, 1,
-1.660705, -2.123205, -1.672934, 1, 0.2941177, 0, 1,
-1.62571, 1.973597, 0.03393933, 1, 0.3019608, 0, 1,
-1.625417, -0.01984507, -2.383818, 1, 0.3058824, 0, 1,
-1.621853, -0.3134476, -1.455952, 1, 0.3137255, 0, 1,
-1.608873, -1.390386, -2.232941, 1, 0.3176471, 0, 1,
-1.60551, 1.552792, -3.070417, 1, 0.3254902, 0, 1,
-1.583955, 0.15586, 0.2383201, 1, 0.3294118, 0, 1,
-1.58121, 0.5393597, -1.193047, 1, 0.3372549, 0, 1,
-1.580986, -0.6476737, -1.137984, 1, 0.3411765, 0, 1,
-1.577863, -0.8755273, -1.64832, 1, 0.3490196, 0, 1,
-1.567703, -1.51545, -1.147907, 1, 0.3529412, 0, 1,
-1.565425, 0.0354705, -0.1618132, 1, 0.3607843, 0, 1,
-1.564818, -0.7935631, -2.177521, 1, 0.3647059, 0, 1,
-1.549643, 0.8526284, -0.6591762, 1, 0.372549, 0, 1,
-1.527808, 0.2065996, -2.15858, 1, 0.3764706, 0, 1,
-1.525287, -0.2209953, -2.973968, 1, 0.3843137, 0, 1,
-1.522721, 0.07485865, -1.119168, 1, 0.3882353, 0, 1,
-1.518022, 0.04087942, -0.3448759, 1, 0.3960784, 0, 1,
-1.510744, -0.7924649, -2.228974, 1, 0.4039216, 0, 1,
-1.498054, -1.129824, -3.396148, 1, 0.4078431, 0, 1,
-1.474037, -0.1494766, -2.700278, 1, 0.4156863, 0, 1,
-1.464235, 0.7219431, -1.924406, 1, 0.4196078, 0, 1,
-1.459763, -1.876769, -3.245713, 1, 0.427451, 0, 1,
-1.457595, -0.5091208, -1.993595, 1, 0.4313726, 0, 1,
-1.451004, -0.2271705, -3.031257, 1, 0.4392157, 0, 1,
-1.449981, -0.01622819, 0.3878722, 1, 0.4431373, 0, 1,
-1.447213, 1.006524, -1.046239, 1, 0.4509804, 0, 1,
-1.444199, -0.1722454, -2.897715, 1, 0.454902, 0, 1,
-1.442768, -2.225399, -2.856159, 1, 0.4627451, 0, 1,
-1.441605, -0.1661276, -0.7536876, 1, 0.4666667, 0, 1,
-1.437984, 1.299331, -0.8266696, 1, 0.4745098, 0, 1,
-1.43197, 0.1392411, -1.705838, 1, 0.4784314, 0, 1,
-1.429659, 0.4417359, -1.239825, 1, 0.4862745, 0, 1,
-1.428144, 0.7414083, -1.236998, 1, 0.4901961, 0, 1,
-1.425029, 0.6742082, -1.206474, 1, 0.4980392, 0, 1,
-1.414673, -1.778819, -2.674707, 1, 0.5058824, 0, 1,
-1.41453, -2.295045, -2.791605, 1, 0.509804, 0, 1,
-1.400363, 0.3693015, -2.08148, 1, 0.5176471, 0, 1,
-1.397191, -0.2521842, -2.283374, 1, 0.5215687, 0, 1,
-1.383819, -0.2796607, -0.3376967, 1, 0.5294118, 0, 1,
-1.380258, -0.8950398, -2.03604, 1, 0.5333334, 0, 1,
-1.376462, -0.2122315, -3.18374, 1, 0.5411765, 0, 1,
-1.374497, 0.3775072, -1.973137, 1, 0.5450981, 0, 1,
-1.369216, -0.4722387, -2.064532, 1, 0.5529412, 0, 1,
-1.362725, -0.4637604, -0.6058314, 1, 0.5568628, 0, 1,
-1.359598, 1.371787, 0.1135065, 1, 0.5647059, 0, 1,
-1.358202, 0.2424965, -0.7343999, 1, 0.5686275, 0, 1,
-1.338085, -1.500089, -3.931033, 1, 0.5764706, 0, 1,
-1.331132, 0.624675, -1.418042, 1, 0.5803922, 0, 1,
-1.330773, -0.8010997, -3.070286, 1, 0.5882353, 0, 1,
-1.316059, -0.6557755, -0.7053419, 1, 0.5921569, 0, 1,
-1.283333, 0.3496622, -1.460388, 1, 0.6, 0, 1,
-1.278467, -0.380185, -2.152227, 1, 0.6078432, 0, 1,
-1.266307, -1.218114, -3.257287, 1, 0.6117647, 0, 1,
-1.266259, -0.2697866, -1.495791, 1, 0.6196079, 0, 1,
-1.254971, 0.7489262, -0.4512763, 1, 0.6235294, 0, 1,
-1.254939, 1.89907, 0.4204929, 1, 0.6313726, 0, 1,
-1.25388, 0.5113831, -0.1777084, 1, 0.6352941, 0, 1,
-1.247776, -0.8423383, -2.197443, 1, 0.6431373, 0, 1,
-1.242581, -0.2413434, -0.9029352, 1, 0.6470588, 0, 1,
-1.237609, -1.777059, -2.297864, 1, 0.654902, 0, 1,
-1.231713, -0.6978919, -3.740915, 1, 0.6588235, 0, 1,
-1.230786, 0.9492607, -1.654272, 1, 0.6666667, 0, 1,
-1.221972, -0.2783107, -1.04995, 1, 0.6705883, 0, 1,
-1.209235, -0.5270008, -3.673878, 1, 0.6784314, 0, 1,
-1.208387, 1.420235, 0.5318347, 1, 0.682353, 0, 1,
-1.206185, 0.3355831, -0.1455856, 1, 0.6901961, 0, 1,
-1.175677, -1.41587, -2.458509, 1, 0.6941177, 0, 1,
-1.17423, 1.427127, -1.212805, 1, 0.7019608, 0, 1,
-1.170797, 0.9934148, -3.388155, 1, 0.7098039, 0, 1,
-1.163532, -0.4708177, -1.409922, 1, 0.7137255, 0, 1,
-1.162713, -0.4798704, 0.702277, 1, 0.7215686, 0, 1,
-1.162349, -2.410935, -1.774318, 1, 0.7254902, 0, 1,
-1.151407, -0.1474258, -2.901393, 1, 0.7333333, 0, 1,
-1.141547, 0.5151879, -0.9833571, 1, 0.7372549, 0, 1,
-1.135126, 0.5437098, -1.76873, 1, 0.7450981, 0, 1,
-1.125688, 0.0573616, -2.051624, 1, 0.7490196, 0, 1,
-1.125571, -1.007378, -3.211407, 1, 0.7568628, 0, 1,
-1.125051, 0.3691305, -1.308463, 1, 0.7607843, 0, 1,
-1.124915, -0.1431626, -0.4347751, 1, 0.7686275, 0, 1,
-1.116621, 1.162686, -2.191135, 1, 0.772549, 0, 1,
-1.110222, 1.477462, -1.398723, 1, 0.7803922, 0, 1,
-1.107118, -2.347904, -1.442905, 1, 0.7843137, 0, 1,
-1.089862, 0.5434996, -3.05194, 1, 0.7921569, 0, 1,
-1.087251, -0.2776353, -3.228773, 1, 0.7960784, 0, 1,
-1.084969, 1.544342, -1.04636, 1, 0.8039216, 0, 1,
-1.078454, 0.6619971, -0.1015139, 1, 0.8117647, 0, 1,
-1.072839, -1.271123, -1.514594, 1, 0.8156863, 0, 1,
-1.071994, -1.772194, -3.480903, 1, 0.8235294, 0, 1,
-1.066545, 0.9441637, 0.1043115, 1, 0.827451, 0, 1,
-1.062354, 1.357141, -1.377961, 1, 0.8352941, 0, 1,
-1.061877, -0.2470846, -2.088435, 1, 0.8392157, 0, 1,
-1.060979, -0.8299879, -4.42943, 1, 0.8470588, 0, 1,
-1.059809, -0.1942814, -3.132788, 1, 0.8509804, 0, 1,
-1.059392, 0.04030813, 1.514099, 1, 0.8588235, 0, 1,
-1.058788, -1.401186, -2.927136, 1, 0.8627451, 0, 1,
-1.056944, 0.9949146, 0.9470816, 1, 0.8705882, 0, 1,
-1.053089, -1.389769, -2.475685, 1, 0.8745098, 0, 1,
-1.044134, 0.2348098, 1.653221, 1, 0.8823529, 0, 1,
-1.043983, -0.1556528, -3.723868, 1, 0.8862745, 0, 1,
-1.039023, 2.462442, 0.8468201, 1, 0.8941177, 0, 1,
-1.037087, 1.156601, -2.143563, 1, 0.8980392, 0, 1,
-1.028926, -0.1518656, -1.508772, 1, 0.9058824, 0, 1,
-1.024123, 0.226889, -2.756758, 1, 0.9137255, 0, 1,
-1.021899, 1.010051, -2.119787, 1, 0.9176471, 0, 1,
-1.020228, -0.7991986, -1.394717, 1, 0.9254902, 0, 1,
-1.016726, -0.7907432, -2.417352, 1, 0.9294118, 0, 1,
-1.013412, 0.3448968, -1.890595, 1, 0.9372549, 0, 1,
-1.00868, -0.3026667, -2.578456, 1, 0.9411765, 0, 1,
-1.005219, -0.8559968, -2.614682, 1, 0.9490196, 0, 1,
-0.9633196, 1.37023, -1.535027, 1, 0.9529412, 0, 1,
-0.9570599, -0.03754856, -3.850858, 1, 0.9607843, 0, 1,
-0.9537235, -1.0528, -1.523171, 1, 0.9647059, 0, 1,
-0.9500912, 1.045632, -1.71862, 1, 0.972549, 0, 1,
-0.9494249, -1.543883, -1.86731, 1, 0.9764706, 0, 1,
-0.9469912, -1.206768, -2.054423, 1, 0.9843137, 0, 1,
-0.9451598, 1.010451, -1.951403, 1, 0.9882353, 0, 1,
-0.9387338, 0.3785161, -1.812556, 1, 0.9960784, 0, 1,
-0.9339373, -3.079627, -4.151008, 0.9960784, 1, 0, 1,
-0.9326804, 0.1121681, -2.088508, 0.9921569, 1, 0, 1,
-0.9307656, -0.09009893, 0.7127895, 0.9843137, 1, 0, 1,
-0.9292139, -0.3552767, -0.7080981, 0.9803922, 1, 0, 1,
-0.9277294, 0.4487453, -1.102638, 0.972549, 1, 0, 1,
-0.9238433, -0.907369, -3.225383, 0.9686275, 1, 0, 1,
-0.9090893, 1.915269, 0.5762777, 0.9607843, 1, 0, 1,
-0.903237, -1.197093, -2.068559, 0.9568627, 1, 0, 1,
-0.9021466, -0.1541409, -0.5564225, 0.9490196, 1, 0, 1,
-0.9021162, 0.8534601, -0.8504107, 0.945098, 1, 0, 1,
-0.8999836, -0.3968879, -2.802807, 0.9372549, 1, 0, 1,
-0.8952051, -0.6650963, -1.750697, 0.9333333, 1, 0, 1,
-0.8870724, -0.7800622, -1.233839, 0.9254902, 1, 0, 1,
-0.8861412, 0.3117788, -2.636111, 0.9215686, 1, 0, 1,
-0.8853386, 1.219944, 1.405092, 0.9137255, 1, 0, 1,
-0.8657174, -0.9402152, -3.540243, 0.9098039, 1, 0, 1,
-0.8653715, -0.7408512, -2.046013, 0.9019608, 1, 0, 1,
-0.8608301, 0.01572141, -0.7721058, 0.8941177, 1, 0, 1,
-0.8572049, 1.750076, -1.799621, 0.8901961, 1, 0, 1,
-0.8564819, 0.3864091, -2.718754, 0.8823529, 1, 0, 1,
-0.8545305, 0.3606403, -0.7058626, 0.8784314, 1, 0, 1,
-0.8465262, 0.1430744, -2.048534, 0.8705882, 1, 0, 1,
-0.843434, 0.1261898, -1.409638, 0.8666667, 1, 0, 1,
-0.8421422, -0.3805654, -4.335756, 0.8588235, 1, 0, 1,
-0.8398337, -0.3566212, -1.795771, 0.854902, 1, 0, 1,
-0.8339382, -0.1091804, -2.400437, 0.8470588, 1, 0, 1,
-0.8263826, 0.1295002, -1.268402, 0.8431373, 1, 0, 1,
-0.8174318, 1.838511, -0.8818327, 0.8352941, 1, 0, 1,
-0.8169568, 0.35486, -2.610366, 0.8313726, 1, 0, 1,
-0.8088411, 0.8461087, -0.8517286, 0.8235294, 1, 0, 1,
-0.8082098, 0.1074366, -2.207626, 0.8196079, 1, 0, 1,
-0.8039716, 1.428349, -0.0131563, 0.8117647, 1, 0, 1,
-0.8036066, 1.248601, 0.3780676, 0.8078431, 1, 0, 1,
-0.8035664, 0.6833282, 0.07129068, 0.8, 1, 0, 1,
-0.8000255, -0.1614922, -1.06404, 0.7921569, 1, 0, 1,
-0.7970276, 0.7251462, 0.07135114, 0.7882353, 1, 0, 1,
-0.7963179, 1.408373, 0.2866773, 0.7803922, 1, 0, 1,
-0.7906355, -2.199032, -2.757091, 0.7764706, 1, 0, 1,
-0.7870342, 0.4955937, -0.2388421, 0.7686275, 1, 0, 1,
-0.7795256, 0.02485109, -0.9605978, 0.7647059, 1, 0, 1,
-0.7749437, -0.2648476, -1.129118, 0.7568628, 1, 0, 1,
-0.7702095, -1.701458, -1.177331, 0.7529412, 1, 0, 1,
-0.7667832, 0.2028127, -0.03539526, 0.7450981, 1, 0, 1,
-0.7655688, 1.320104, 0.6961303, 0.7411765, 1, 0, 1,
-0.7581236, 0.2285295, -2.228089, 0.7333333, 1, 0, 1,
-0.7492301, -0.07634129, -1.231115, 0.7294118, 1, 0, 1,
-0.7487708, -0.7703155, -2.264284, 0.7215686, 1, 0, 1,
-0.7446857, -1.321092, -3.762612, 0.7176471, 1, 0, 1,
-0.7425272, -0.1723563, -1.32833, 0.7098039, 1, 0, 1,
-0.7424479, 1.089795, -0.7634115, 0.7058824, 1, 0, 1,
-0.740878, 0.3994675, -0.8354279, 0.6980392, 1, 0, 1,
-0.7392289, -0.751779, -3.536715, 0.6901961, 1, 0, 1,
-0.7385336, 0.9608915, 0.8075666, 0.6862745, 1, 0, 1,
-0.7365832, -1.496929, -1.765379, 0.6784314, 1, 0, 1,
-0.7242714, -0.3588357, -1.917986, 0.6745098, 1, 0, 1,
-0.7226636, -0.6014956, -1.66142, 0.6666667, 1, 0, 1,
-0.7186226, 1.076267, 0.002734392, 0.6627451, 1, 0, 1,
-0.717584, -1.106521, -1.87356, 0.654902, 1, 0, 1,
-0.7117972, 0.6425931, 1.572593, 0.6509804, 1, 0, 1,
-0.706515, -0.4034172, -2.386044, 0.6431373, 1, 0, 1,
-0.7051958, -1.776207, -1.925448, 0.6392157, 1, 0, 1,
-0.7019716, 0.4968539, -0.6759533, 0.6313726, 1, 0, 1,
-0.7003767, 1.692416, -0.7922588, 0.627451, 1, 0, 1,
-0.6952539, 0.4727648, -1.738233, 0.6196079, 1, 0, 1,
-0.6899192, -0.2822468, -1.324275, 0.6156863, 1, 0, 1,
-0.6896715, -0.9299641, -3.300746, 0.6078432, 1, 0, 1,
-0.6870661, 1.296174, -0.3951733, 0.6039216, 1, 0, 1,
-0.6854657, -0.07993986, -3.186191, 0.5960785, 1, 0, 1,
-0.6831903, -2.422971, -4.947716, 0.5882353, 1, 0, 1,
-0.6803569, -0.903778, -3.922847, 0.5843138, 1, 0, 1,
-0.6799398, 0.7086962, -0.6954368, 0.5764706, 1, 0, 1,
-0.6713248, 1.098299, -0.7324482, 0.572549, 1, 0, 1,
-0.6690385, -2.033383, -1.690306, 0.5647059, 1, 0, 1,
-0.6671081, -0.418721, -2.998188, 0.5607843, 1, 0, 1,
-0.6668316, -0.08889987, -2.344949, 0.5529412, 1, 0, 1,
-0.6653075, 0.4056147, -2.94676, 0.5490196, 1, 0, 1,
-0.6629501, 0.3388443, -1.164259, 0.5411765, 1, 0, 1,
-0.6530739, 0.7391844, -1.111152, 0.5372549, 1, 0, 1,
-0.6528196, 0.850527, -0.75984, 0.5294118, 1, 0, 1,
-0.6527026, -0.6568022, -3.368977, 0.5254902, 1, 0, 1,
-0.6499771, 0.5456855, 0.6196157, 0.5176471, 1, 0, 1,
-0.6475548, 0.741147, -3.262654, 0.5137255, 1, 0, 1,
-0.6386051, -1.4873, -2.565119, 0.5058824, 1, 0, 1,
-0.6375028, 0.3631569, -1.739858, 0.5019608, 1, 0, 1,
-0.6367812, 0.0392475, -1.881194, 0.4941176, 1, 0, 1,
-0.61866, -0.2289464, -2.195443, 0.4862745, 1, 0, 1,
-0.6185119, 0.4707203, -0.2786601, 0.4823529, 1, 0, 1,
-0.6036636, -0.1690171, -0.8240386, 0.4745098, 1, 0, 1,
-0.5996802, 0.4819388, -1.06069, 0.4705882, 1, 0, 1,
-0.5990658, -0.3551553, -1.887618, 0.4627451, 1, 0, 1,
-0.5910378, 1.679146, -0.8858644, 0.4588235, 1, 0, 1,
-0.5845343, -2.32018, -3.183587, 0.4509804, 1, 0, 1,
-0.583259, -1.895394, -2.226525, 0.4470588, 1, 0, 1,
-0.5824541, -1.226161, -2.238618, 0.4392157, 1, 0, 1,
-0.5776564, 1.483903, -0.8317442, 0.4352941, 1, 0, 1,
-0.5759967, 1.54444, -0.6943033, 0.427451, 1, 0, 1,
-0.5739598, -0.6824952, -3.719123, 0.4235294, 1, 0, 1,
-0.5736668, 1.990211, -0.1592048, 0.4156863, 1, 0, 1,
-0.5731114, 1.157164, -1.575025, 0.4117647, 1, 0, 1,
-0.5645486, 0.9655844, -0.1797614, 0.4039216, 1, 0, 1,
-0.5637065, -0.972098, -1.39555, 0.3960784, 1, 0, 1,
-0.5627076, -0.408103, -0.7655957, 0.3921569, 1, 0, 1,
-0.5581653, -0.08092624, -0.973923, 0.3843137, 1, 0, 1,
-0.5581583, 0.03169265, -0.5562481, 0.3803922, 1, 0, 1,
-0.5573319, 1.317741, -1.167528, 0.372549, 1, 0, 1,
-0.5525141, -0.6921834, -3.438781, 0.3686275, 1, 0, 1,
-0.5504352, -2.513259, -3.604859, 0.3607843, 1, 0, 1,
-0.5485435, 0.553956, -1.639574, 0.3568628, 1, 0, 1,
-0.5429674, 1.364514, 0.8305812, 0.3490196, 1, 0, 1,
-0.540027, -0.5088197, -2.469566, 0.345098, 1, 0, 1,
-0.5372401, -0.05193867, -1.849203, 0.3372549, 1, 0, 1,
-0.5371718, 1.695886, -1.710212, 0.3333333, 1, 0, 1,
-0.5312878, 0.06049244, 0.2303237, 0.3254902, 1, 0, 1,
-0.5289996, 1.440809, 0.1602611, 0.3215686, 1, 0, 1,
-0.5263711, 1.308848, -0.7501265, 0.3137255, 1, 0, 1,
-0.5251154, -0.9533232, -3.472116, 0.3098039, 1, 0, 1,
-0.524193, 1.64555, -0.5220127, 0.3019608, 1, 0, 1,
-0.523382, 0.0156005, -1.739858, 0.2941177, 1, 0, 1,
-0.5186989, -1.049572, -3.850356, 0.2901961, 1, 0, 1,
-0.5170042, 0.2695299, -2.912139, 0.282353, 1, 0, 1,
-0.5146704, -0.1901469, -2.584476, 0.2784314, 1, 0, 1,
-0.5105544, 0.2360586, -1.453617, 0.2705882, 1, 0, 1,
-0.5067297, 0.3816753, -0.2822968, 0.2666667, 1, 0, 1,
-0.506508, -0.04695839, -1.611184, 0.2588235, 1, 0, 1,
-0.5030495, -0.7738054, -3.520595, 0.254902, 1, 0, 1,
-0.4997534, -0.5712925, -3.020835, 0.2470588, 1, 0, 1,
-0.4993535, -0.8174585, -4.450125, 0.2431373, 1, 0, 1,
-0.4972848, 0.7964035, -2.109202, 0.2352941, 1, 0, 1,
-0.4972707, 0.6992179, 1.246539, 0.2313726, 1, 0, 1,
-0.4935534, 0.1071422, -1.610246, 0.2235294, 1, 0, 1,
-0.492545, 1.131881, -1.141187, 0.2196078, 1, 0, 1,
-0.4921574, -0.6747649, -2.620161, 0.2117647, 1, 0, 1,
-0.4881716, -0.473416, -3.675202, 0.2078431, 1, 0, 1,
-0.4821211, 0.3754077, -0.6134419, 0.2, 1, 0, 1,
-0.481794, -0.2236039, -3.174167, 0.1921569, 1, 0, 1,
-0.4814683, -1.278968, -4.092904, 0.1882353, 1, 0, 1,
-0.4740238, -0.3755446, -2.517701, 0.1803922, 1, 0, 1,
-0.4719909, 0.262965, 1.333391, 0.1764706, 1, 0, 1,
-0.471745, 0.1429256, -0.05712614, 0.1686275, 1, 0, 1,
-0.4705618, -0.0703807, -0.3567723, 0.1647059, 1, 0, 1,
-0.4701423, 1.564142, -0.2440661, 0.1568628, 1, 0, 1,
-0.4696949, 0.1435569, -0.08549224, 0.1529412, 1, 0, 1,
-0.465003, 0.2862303, -0.9836938, 0.145098, 1, 0, 1,
-0.4608862, -0.7345282, -3.66375, 0.1411765, 1, 0, 1,
-0.4606884, -0.1642209, -2.579537, 0.1333333, 1, 0, 1,
-0.4530374, 0.5251726, -0.8908262, 0.1294118, 1, 0, 1,
-0.4472122, -0.5781001, -2.710634, 0.1215686, 1, 0, 1,
-0.4421899, 1.170567, -1.417184, 0.1176471, 1, 0, 1,
-0.4317823, 1.015174, -0.9397747, 0.1098039, 1, 0, 1,
-0.4278209, -0.3130111, -3.111882, 0.1058824, 1, 0, 1,
-0.4257344, 1.854282, -1.061385, 0.09803922, 1, 0, 1,
-0.4245884, -0.4825506, -1.727632, 0.09019608, 1, 0, 1,
-0.4240058, 0.1438855, -2.30156, 0.08627451, 1, 0, 1,
-0.4228091, -0.9696807, -2.757584, 0.07843138, 1, 0, 1,
-0.422173, -1.073402, -3.903967, 0.07450981, 1, 0, 1,
-0.4220354, -0.8686921, -3.845951, 0.06666667, 1, 0, 1,
-0.4214867, -1.240703, -2.229649, 0.0627451, 1, 0, 1,
-0.4205421, 0.2462666, -0.1955695, 0.05490196, 1, 0, 1,
-0.4204739, 0.6543311, -0.6806529, 0.05098039, 1, 0, 1,
-0.4128657, 1.096373, -1.090043, 0.04313726, 1, 0, 1,
-0.4101911, 0.7985398, -0.5215183, 0.03921569, 1, 0, 1,
-0.4098737, 0.162239, -1.747074, 0.03137255, 1, 0, 1,
-0.406132, -1.202652, -4.615131, 0.02745098, 1, 0, 1,
-0.4005838, -1.558047, -2.884182, 0.01960784, 1, 0, 1,
-0.3923682, 0.7655181, 0.2328585, 0.01568628, 1, 0, 1,
-0.386708, -0.8272164, -2.823127, 0.007843138, 1, 0, 1,
-0.3851348, 0.387675, -2.754933, 0.003921569, 1, 0, 1,
-0.3829731, -0.06538901, 0.02526525, 0, 1, 0.003921569, 1,
-0.3775906, 0.05949458, -2.67946, 0, 1, 0.01176471, 1,
-0.3768784, 0.6906997, -0.8571355, 0, 1, 0.01568628, 1,
-0.3701544, -0.9396453, -2.345233, 0, 1, 0.02352941, 1,
-0.369931, -0.9288014, -3.054099, 0, 1, 0.02745098, 1,
-0.3681431, -0.684773, -2.718313, 0, 1, 0.03529412, 1,
-0.3605791, -0.1342098, -2.395506, 0, 1, 0.03921569, 1,
-0.3600232, -0.08600149, -1.063771, 0, 1, 0.04705882, 1,
-0.3561514, 1.291778, 0.9681134, 0, 1, 0.05098039, 1,
-0.3535007, -0.2906559, -1.453807, 0, 1, 0.05882353, 1,
-0.3532977, 0.2322474, -2.24259, 0, 1, 0.0627451, 1,
-0.3435913, -0.1782986, -1.747537, 0, 1, 0.07058824, 1,
-0.3413181, -0.635803, -2.773759, 0, 1, 0.07450981, 1,
-0.3390259, 0.4592414, -0.6246652, 0, 1, 0.08235294, 1,
-0.3368456, -1.298214, -3.87874, 0, 1, 0.08627451, 1,
-0.3315456, -0.2514559, -2.540154, 0, 1, 0.09411765, 1,
-0.3313237, 0.8284515, 0.1216885, 0, 1, 0.1019608, 1,
-0.3294785, -0.7679597, -1.76998, 0, 1, 0.1058824, 1,
-0.3280789, -1.488236, -2.960497, 0, 1, 0.1137255, 1,
-0.3267811, -2.822462, -0.9880255, 0, 1, 0.1176471, 1,
-0.3263949, 1.52057, -0.1949002, 0, 1, 0.1254902, 1,
-0.3229153, 0.9464061, -1.795543, 0, 1, 0.1294118, 1,
-0.3208196, -0.3076817, -2.462311, 0, 1, 0.1372549, 1,
-0.3179411, -1.432345, -3.987122, 0, 1, 0.1411765, 1,
-0.3162277, 1.006413, -0.0125529, 0, 1, 0.1490196, 1,
-0.3132344, 0.6300104, -1.484624, 0, 1, 0.1529412, 1,
-0.3129413, 0.4374437, 0.5701632, 0, 1, 0.1607843, 1,
-0.3060398, 0.638716, 0.6577451, 0, 1, 0.1647059, 1,
-0.3033672, -1.223963, -4.642652, 0, 1, 0.172549, 1,
-0.3032166, 1.24647, -0.2049376, 0, 1, 0.1764706, 1,
-0.3015674, 0.7590361, -1.360736, 0, 1, 0.1843137, 1,
-0.3014415, 0.883516, -1.169084, 0, 1, 0.1882353, 1,
-0.3008859, -1.189172, -2.507856, 0, 1, 0.1960784, 1,
-0.2999043, 1.195884, -1.034204, 0, 1, 0.2039216, 1,
-0.2993267, -0.3117103, -0.9465694, 0, 1, 0.2078431, 1,
-0.2942749, 0.1013814, -4.283347, 0, 1, 0.2156863, 1,
-0.290545, -1.292199, -2.334751, 0, 1, 0.2196078, 1,
-0.2896032, -1.056386, -2.930207, 0, 1, 0.227451, 1,
-0.2873276, 1.747911, -0.1857821, 0, 1, 0.2313726, 1,
-0.2843083, 0.02593767, -0.6530665, 0, 1, 0.2392157, 1,
-0.2839123, -1.914242, -2.446892, 0, 1, 0.2431373, 1,
-0.2828597, 0.2127429, -0.3965561, 0, 1, 0.2509804, 1,
-0.2824899, 1.61661, -0.8128121, 0, 1, 0.254902, 1,
-0.2804469, 0.3390502, -1.844886, 0, 1, 0.2627451, 1,
-0.2798821, 1.566553, 1.203657, 0, 1, 0.2666667, 1,
-0.2777568, 0.5092107, -2.033039, 0, 1, 0.2745098, 1,
-0.2758448, -0.03095812, -2.207004, 0, 1, 0.2784314, 1,
-0.2741446, -0.5529685, -3.936802, 0, 1, 0.2862745, 1,
-0.2728712, 0.268447, -0.8446226, 0, 1, 0.2901961, 1,
-0.2700625, -0.5801951, -3.074702, 0, 1, 0.2980392, 1,
-0.2673481, -1.329967, -3.038817, 0, 1, 0.3058824, 1,
-0.2664264, 0.2233947, 0.3481215, 0, 1, 0.3098039, 1,
-0.2659555, -0.8942936, -2.867048, 0, 1, 0.3176471, 1,
-0.2658664, 0.7573894, -0.3447006, 0, 1, 0.3215686, 1,
-0.2641649, -1.427066, -2.744577, 0, 1, 0.3294118, 1,
-0.2625387, 0.1582635, 0.4805887, 0, 1, 0.3333333, 1,
-0.2573909, -0.4120914, -1.778494, 0, 1, 0.3411765, 1,
-0.2571644, -0.6406609, -1.427397, 0, 1, 0.345098, 1,
-0.2558841, 0.125429, -1.244098, 0, 1, 0.3529412, 1,
-0.2558444, 0.1001853, -0.9476641, 0, 1, 0.3568628, 1,
-0.2501199, -0.287738, -2.961726, 0, 1, 0.3647059, 1,
-0.2485345, 0.05025616, -1.220783, 0, 1, 0.3686275, 1,
-0.247877, -2.827747, -3.417841, 0, 1, 0.3764706, 1,
-0.244166, 0.8641182, -0.301862, 0, 1, 0.3803922, 1,
-0.2432772, 0.06654614, -0.267692, 0, 1, 0.3882353, 1,
-0.2430316, 0.8792022, -0.7891385, 0, 1, 0.3921569, 1,
-0.2363602, 1.512015, 0.4593887, 0, 1, 0.4, 1,
-0.2346256, 0.5383611, -1.360053, 0, 1, 0.4078431, 1,
-0.233906, 0.403549, -1.476508, 0, 1, 0.4117647, 1,
-0.2333767, 0.842101, 2.039727, 0, 1, 0.4196078, 1,
-0.229388, 0.1734844, -0.01052978, 0, 1, 0.4235294, 1,
-0.22865, -0.9938012, -2.664515, 0, 1, 0.4313726, 1,
-0.2270797, 0.1953834, -1.30683, 0, 1, 0.4352941, 1,
-0.2268781, 0.8453825, 0.4013711, 0, 1, 0.4431373, 1,
-0.2237324, 1.293162, 1.170231, 0, 1, 0.4470588, 1,
-0.2233149, -1.954903, -3.900734, 0, 1, 0.454902, 1,
-0.2225619, 1.375935, 1.979196, 0, 1, 0.4588235, 1,
-0.2193577, -1.094378, -1.471133, 0, 1, 0.4666667, 1,
-0.2188933, 0.1777205, -0.9008849, 0, 1, 0.4705882, 1,
-0.2107971, 1.329085, 0.8724224, 0, 1, 0.4784314, 1,
-0.2104571, 0.6658344, -0.4651668, 0, 1, 0.4823529, 1,
-0.2093082, -0.09635831, -3.817576, 0, 1, 0.4901961, 1,
-0.2091456, 0.3172129, 0.06310511, 0, 1, 0.4941176, 1,
-0.2075009, 0.9041999, -0.9136993, 0, 1, 0.5019608, 1,
-0.2071586, 0.5788853, 1.854289, 0, 1, 0.509804, 1,
-0.2015392, 0.7056923, -0.9080769, 0, 1, 0.5137255, 1,
-0.1958855, 0.7691491, -1.988899, 0, 1, 0.5215687, 1,
-0.1929909, 1.010776, 0.1561398, 0, 1, 0.5254902, 1,
-0.192816, -0.3128841, -1.865541, 0, 1, 0.5333334, 1,
-0.1907513, -0.6059715, -1.956339, 0, 1, 0.5372549, 1,
-0.1891367, 0.6986516, 0.3805708, 0, 1, 0.5450981, 1,
-0.1852463, 1.514423, -1.13739, 0, 1, 0.5490196, 1,
-0.1803861, 0.5694255, 0.1344998, 0, 1, 0.5568628, 1,
-0.1797333, -0.4994166, -3.75294, 0, 1, 0.5607843, 1,
-0.1779762, 0.8152642, 1.022776, 0, 1, 0.5686275, 1,
-0.1745429, 0.8915638, -1.074036, 0, 1, 0.572549, 1,
-0.1718948, 0.6527998, -0.8815345, 0, 1, 0.5803922, 1,
-0.1717803, 0.5384498, -0.3618678, 0, 1, 0.5843138, 1,
-0.1692412, 0.1756617, -0.1350292, 0, 1, 0.5921569, 1,
-0.1690991, -1.122082, -2.758892, 0, 1, 0.5960785, 1,
-0.167994, -0.2232946, -3.082942, 0, 1, 0.6039216, 1,
-0.1672043, -0.219545, -1.461925, 0, 1, 0.6117647, 1,
-0.1658559, -1.259011, -3.134847, 0, 1, 0.6156863, 1,
-0.1656481, 0.266712, -1.044308, 0, 1, 0.6235294, 1,
-0.1638331, 1.156535, 0.2015807, 0, 1, 0.627451, 1,
-0.1558401, -0.1937117, -2.023082, 0, 1, 0.6352941, 1,
-0.1521354, -0.1174472, -1.930206, 0, 1, 0.6392157, 1,
-0.1485559, -0.2267865, -2.795057, 0, 1, 0.6470588, 1,
-0.1473342, 1.08454, 0.3806003, 0, 1, 0.6509804, 1,
-0.1468112, 1.40256, 0.3777732, 0, 1, 0.6588235, 1,
-0.1413725, -0.2067999, -2.368665, 0, 1, 0.6627451, 1,
-0.1411204, 0.4981772, -1.470149, 0, 1, 0.6705883, 1,
-0.1342012, 1.167375, 0.3984104, 0, 1, 0.6745098, 1,
-0.1331923, 0.7761817, 0.7780613, 0, 1, 0.682353, 1,
-0.1329676, 1.749978, 0.4889582, 0, 1, 0.6862745, 1,
-0.1297977, -0.1336421, -1.772841, 0, 1, 0.6941177, 1,
-0.1291748, -1.91066, -2.224231, 0, 1, 0.7019608, 1,
-0.1282229, -0.3742235, -5.413109, 0, 1, 0.7058824, 1,
-0.1269627, -0.2660646, -1.431999, 0, 1, 0.7137255, 1,
-0.1236544, -0.7295482, -2.752192, 0, 1, 0.7176471, 1,
-0.1185753, -1.439518, -3.876185, 0, 1, 0.7254902, 1,
-0.1177806, 1.342909, -0.0763436, 0, 1, 0.7294118, 1,
-0.1108273, 0.0376152, -2.649572, 0, 1, 0.7372549, 1,
-0.1096187, 0.3265267, -0.4766783, 0, 1, 0.7411765, 1,
-0.1089637, -0.7765565, -2.828545, 0, 1, 0.7490196, 1,
-0.1080123, -1.217001, -0.4668953, 0, 1, 0.7529412, 1,
-0.1075461, -0.2676184, -4.247778, 0, 1, 0.7607843, 1,
-0.1044703, 0.2199828, -0.6693481, 0, 1, 0.7647059, 1,
-0.09289846, 0.05429062, -3.274031, 0, 1, 0.772549, 1,
-0.09200372, 0.5654715, 0.7628491, 0, 1, 0.7764706, 1,
-0.09026273, -1.267834, -2.805235, 0, 1, 0.7843137, 1,
-0.08486486, -0.3700014, -2.847155, 0, 1, 0.7882353, 1,
-0.08464888, -0.4923946, -2.621804, 0, 1, 0.7960784, 1,
-0.08274645, -0.8558602, -2.231356, 0, 1, 0.8039216, 1,
-0.08025593, 0.8820078, 0.4543282, 0, 1, 0.8078431, 1,
-0.07898, 0.9923722, -2.220373, 0, 1, 0.8156863, 1,
-0.0779236, 0.2180525, -0.6156668, 0, 1, 0.8196079, 1,
-0.07044952, 0.5675159, 0.9336452, 0, 1, 0.827451, 1,
-0.06733934, 1.052721, 0.6934096, 0, 1, 0.8313726, 1,
-0.06731483, -1.120645, -4.764376, 0, 1, 0.8392157, 1,
-0.06621332, 0.548755, 0.283303, 0, 1, 0.8431373, 1,
-0.05613158, -1.620768, -4.73565, 0, 1, 0.8509804, 1,
-0.05329893, 1.642504, -0.4411264, 0, 1, 0.854902, 1,
-0.04850462, -0.2386191, -1.428296, 0, 1, 0.8627451, 1,
-0.04636747, -0.3826614, -3.773321, 0, 1, 0.8666667, 1,
-0.04630008, -0.4821538, -5.721406, 0, 1, 0.8745098, 1,
-0.04512246, -0.2310502, -1.977685, 0, 1, 0.8784314, 1,
-0.0423724, 0.5244194, 0.7700134, 0, 1, 0.8862745, 1,
-0.04103011, 1.579946, 1.583057, 0, 1, 0.8901961, 1,
-0.04017569, 0.3730053, -1.112418, 0, 1, 0.8980392, 1,
-0.0394539, 0.9798975, 0.8445292, 0, 1, 0.9058824, 1,
-0.03702257, 0.1790067, -1.223604, 0, 1, 0.9098039, 1,
-0.02290093, -0.3641545, -1.768641, 0, 1, 0.9176471, 1,
-0.0199418, -1.792295, -4.18497, 0, 1, 0.9215686, 1,
-0.01950775, 0.1395182, 0.01688521, 0, 1, 0.9294118, 1,
-0.01880613, 0.8562165, 1.008182, 0, 1, 0.9333333, 1,
-0.01584127, 1.457191, -1.145539, 0, 1, 0.9411765, 1,
-0.0135347, -0.08095881, -1.682752, 0, 1, 0.945098, 1,
-0.01041892, 1.490825, -0.9039654, 0, 1, 0.9529412, 1,
-0.01034442, -1.038569, -3.863731, 0, 1, 0.9568627, 1,
-0.007707682, 2.470243, 2.525166, 0, 1, 0.9647059, 1,
-0.00685399, 2.947467, 0.7440927, 0, 1, 0.9686275, 1,
-0.005163634, 1.385601, 0.08397784, 0, 1, 0.9764706, 1,
-0.002575534, -1.786351, -2.430469, 0, 1, 0.9803922, 1,
-0.002194369, -0.6461389, -2.377802, 0, 1, 0.9882353, 1,
0.00194155, 2.203692, -2.190876, 0, 1, 0.9921569, 1,
0.003392422, 0.6843109, -0.5058144, 0, 1, 1, 1,
0.003697208, 1.095604, 1.916499, 0, 0.9921569, 1, 1,
0.005187841, -0.7242594, 1.484574, 0, 0.9882353, 1, 1,
0.007741631, 0.8231421, 1.00953, 0, 0.9803922, 1, 1,
0.008788337, 1.255672, 0.971112, 0, 0.9764706, 1, 1,
0.009506966, -0.9786533, 1.751954, 0, 0.9686275, 1, 1,
0.01297483, -0.266589, 6.080313, 0, 0.9647059, 1, 1,
0.01561243, -1.727436, 2.036379, 0, 0.9568627, 1, 1,
0.01749097, -0.8924853, 3.938442, 0, 0.9529412, 1, 1,
0.01944051, -1.545533, 2.977426, 0, 0.945098, 1, 1,
0.02137957, 0.5466679, 1.003942, 0, 0.9411765, 1, 1,
0.02666344, 0.7813954, -0.1328991, 0, 0.9333333, 1, 1,
0.02746919, -0.1001541, 2.721713, 0, 0.9294118, 1, 1,
0.02926278, -0.180746, 2.614276, 0, 0.9215686, 1, 1,
0.02948077, 0.8170348, 0.6747916, 0, 0.9176471, 1, 1,
0.02960422, 0.09415031, 2.432584, 0, 0.9098039, 1, 1,
0.03060585, 0.03057247, 1.0384, 0, 0.9058824, 1, 1,
0.03418777, 1.200276, -2.188527, 0, 0.8980392, 1, 1,
0.03608472, -0.3481198, 2.376652, 0, 0.8901961, 1, 1,
0.03685125, 1.001099, 0.005270064, 0, 0.8862745, 1, 1,
0.03783319, 0.4638879, 0.3317219, 0, 0.8784314, 1, 1,
0.04230563, -1.515335, 3.002604, 0, 0.8745098, 1, 1,
0.04713522, -0.7636369, 2.810475, 0, 0.8666667, 1, 1,
0.04798935, -0.6343141, 1.831566, 0, 0.8627451, 1, 1,
0.0499125, -1.464319, 3.661962, 0, 0.854902, 1, 1,
0.05221009, 2.199311, 0.6387752, 0, 0.8509804, 1, 1,
0.06167722, -1.058944, 2.650219, 0, 0.8431373, 1, 1,
0.0617469, -0.82342, 4.934938, 0, 0.8392157, 1, 1,
0.06567112, -0.9738324, 4.952086, 0, 0.8313726, 1, 1,
0.06998431, -0.01130806, 0.8561653, 0, 0.827451, 1, 1,
0.07003842, -1.007753, 1.927131, 0, 0.8196079, 1, 1,
0.07786096, -0.05327428, 2.170672, 0, 0.8156863, 1, 1,
0.07848687, 2.127911, 0.9593826, 0, 0.8078431, 1, 1,
0.08227243, 2.334361, 0.05480079, 0, 0.8039216, 1, 1,
0.08355872, -0.3322554, 5.244098, 0, 0.7960784, 1, 1,
0.08492805, -1.774524, 1.82127, 0, 0.7882353, 1, 1,
0.08561824, 0.9017017, -0.04805277, 0, 0.7843137, 1, 1,
0.08619993, -0.6597437, 1.791871, 0, 0.7764706, 1, 1,
0.09085271, -2.129825, 4.043276, 0, 0.772549, 1, 1,
0.09154179, 0.6579569, -1.558012, 0, 0.7647059, 1, 1,
0.09447464, -0.2614734, 2.109018, 0, 0.7607843, 1, 1,
0.09720615, -0.9023429, 2.85561, 0, 0.7529412, 1, 1,
0.09733822, -1.067171, 2.231714, 0, 0.7490196, 1, 1,
0.09892112, -0.04567996, 0.2673584, 0, 0.7411765, 1, 1,
0.1013557, -0.6452709, 2.480795, 0, 0.7372549, 1, 1,
0.1019932, -0.9156128, 4.271604, 0, 0.7294118, 1, 1,
0.1023894, -0.103254, 1.513291, 0, 0.7254902, 1, 1,
0.1024808, 1.332056, -0.8568463, 0, 0.7176471, 1, 1,
0.1033963, -0.9899585, 2.918796, 0, 0.7137255, 1, 1,
0.1050819, 0.5383574, -0.7077054, 0, 0.7058824, 1, 1,
0.1079213, -1.655917, 2.98717, 0, 0.6980392, 1, 1,
0.1102004, 0.2727798, 0.5741088, 0, 0.6941177, 1, 1,
0.1146655, -1.91001, 4.401845, 0, 0.6862745, 1, 1,
0.1162112, 0.7108107, -0.4274403, 0, 0.682353, 1, 1,
0.1173185, -1.342195, 4.602918, 0, 0.6745098, 1, 1,
0.117795, -0.8576571, 2.477127, 0, 0.6705883, 1, 1,
0.1194269, 0.1854559, 0.1444032, 0, 0.6627451, 1, 1,
0.1195774, 1.297643, 0.02828023, 0, 0.6588235, 1, 1,
0.1261558, 0.08865107, 1.138306, 0, 0.6509804, 1, 1,
0.1315493, -0.8766702, 3.472553, 0, 0.6470588, 1, 1,
0.1384183, 1.131813, 0.6075057, 0, 0.6392157, 1, 1,
0.1405011, -0.7793032, 2.1863, 0, 0.6352941, 1, 1,
0.1425525, -1.153927, 3.30601, 0, 0.627451, 1, 1,
0.1426603, 0.2720793, -0.2167342, 0, 0.6235294, 1, 1,
0.1469387, -0.4142939, 2.156183, 0, 0.6156863, 1, 1,
0.1500435, 0.08510745, -0.4020888, 0, 0.6117647, 1, 1,
0.1510894, 0.6455028, 0.2325925, 0, 0.6039216, 1, 1,
0.1511068, -0.7811639, 4.068071, 0, 0.5960785, 1, 1,
0.1526522, 0.6503819, -0.1804905, 0, 0.5921569, 1, 1,
0.1542011, -0.8627622, 2.153563, 0, 0.5843138, 1, 1,
0.1593532, -1.045491, 2.518201, 0, 0.5803922, 1, 1,
0.1597523, -0.4943117, 2.735938, 0, 0.572549, 1, 1,
0.1615584, -1.119782, 2.973651, 0, 0.5686275, 1, 1,
0.1684901, 0.5907391, 0.09862848, 0, 0.5607843, 1, 1,
0.1698749, 0.768537, 1.190293, 0, 0.5568628, 1, 1,
0.1711704, -0.8528628, 4.839212, 0, 0.5490196, 1, 1,
0.1712229, -0.6055492, 2.71743, 0, 0.5450981, 1, 1,
0.1733555, 0.6940748, 0.5584306, 0, 0.5372549, 1, 1,
0.1738799, 0.8678699, 1.552618, 0, 0.5333334, 1, 1,
0.1744978, -0.8281417, 0.9488983, 0, 0.5254902, 1, 1,
0.1746066, -0.2380979, 2.457308, 0, 0.5215687, 1, 1,
0.1768326, -1.685336, 2.55964, 0, 0.5137255, 1, 1,
0.1788781, -1.90644, 3.048465, 0, 0.509804, 1, 1,
0.179771, -0.1919794, 0.6100235, 0, 0.5019608, 1, 1,
0.1813202, 2.070462, 0.1867909, 0, 0.4941176, 1, 1,
0.1838572, -1.854401, 5.158466, 0, 0.4901961, 1, 1,
0.1867651, -0.1685326, -0.6679344, 0, 0.4823529, 1, 1,
0.190036, -0.1531148, 2.603744, 0, 0.4784314, 1, 1,
0.1902868, 0.8090248, -0.5145268, 0, 0.4705882, 1, 1,
0.1914127, -1.000087, 3.793699, 0, 0.4666667, 1, 1,
0.1921225, 2.175619, 0.8590337, 0, 0.4588235, 1, 1,
0.2028092, 1.829448, 1.795266, 0, 0.454902, 1, 1,
0.2063137, -0.8530942, 3.737347, 0, 0.4470588, 1, 1,
0.2075254, -0.838961, 3.981708, 0, 0.4431373, 1, 1,
0.2092213, 1.395465, -0.5211939, 0, 0.4352941, 1, 1,
0.2196311, 0.5402129, 1.458477, 0, 0.4313726, 1, 1,
0.2218866, -0.932094, 4.031953, 0, 0.4235294, 1, 1,
0.2247634, 0.5517222, -0.9008912, 0, 0.4196078, 1, 1,
0.2299467, -1.197437, 2.554191, 0, 0.4117647, 1, 1,
0.2381926, -0.968803, 4.020999, 0, 0.4078431, 1, 1,
0.2421849, -0.6395403, 0.8143377, 0, 0.4, 1, 1,
0.2436326, 0.3646338, 0.871205, 0, 0.3921569, 1, 1,
0.246188, -0.7782001, 1.763943, 0, 0.3882353, 1, 1,
0.251083, 0.1959485, 1.335897, 0, 0.3803922, 1, 1,
0.2545736, -2.353247, 2.330355, 0, 0.3764706, 1, 1,
0.2586031, -2.421824, 3.181607, 0, 0.3686275, 1, 1,
0.2616335, -0.1505063, 3.943676, 0, 0.3647059, 1, 1,
0.2617171, -1.010314, 3.921972, 0, 0.3568628, 1, 1,
0.2628799, 0.7424248, 0.1357029, 0, 0.3529412, 1, 1,
0.2677763, 2.317687, 0.2176321, 0, 0.345098, 1, 1,
0.273905, 0.1991266, 2.42208, 0, 0.3411765, 1, 1,
0.2767156, -0.8113628, 3.612648, 0, 0.3333333, 1, 1,
0.2778685, 1.100906, -0.6021825, 0, 0.3294118, 1, 1,
0.2794762, -0.5561711, 3.527624, 0, 0.3215686, 1, 1,
0.2812137, -0.02318436, 2.262791, 0, 0.3176471, 1, 1,
0.2854536, -1.835253, -0.03785114, 0, 0.3098039, 1, 1,
0.2870896, -0.06679504, 0.01522125, 0, 0.3058824, 1, 1,
0.2878413, -0.1181645, 2.330244, 0, 0.2980392, 1, 1,
0.2915146, -0.5076673, 3.828072, 0, 0.2901961, 1, 1,
0.2959742, 1.317539, 1.385811, 0, 0.2862745, 1, 1,
0.2964301, -0.9290136, 4.162168, 0, 0.2784314, 1, 1,
0.3007536, 0.1923567, 1.095328, 0, 0.2745098, 1, 1,
0.3008461, 0.642366, 2.324479, 0, 0.2666667, 1, 1,
0.3052341, 0.4764915, 0.5907121, 0, 0.2627451, 1, 1,
0.3085406, 0.4667959, 2.444631, 0, 0.254902, 1, 1,
0.3108959, 1.580203, -0.2612095, 0, 0.2509804, 1, 1,
0.3165189, -0.01682822, 0.6502242, 0, 0.2431373, 1, 1,
0.3253894, -0.68514, 3.202522, 0, 0.2392157, 1, 1,
0.3264515, -0.6374321, 3.273296, 0, 0.2313726, 1, 1,
0.3283736, -0.1701577, 1.682511, 0, 0.227451, 1, 1,
0.3284853, 1.34557, -0.8533666, 0, 0.2196078, 1, 1,
0.3289172, 0.03698024, 0.2033175, 0, 0.2156863, 1, 1,
0.329296, 0.7314283, -1.484755, 0, 0.2078431, 1, 1,
0.3309728, 0.9305273, 0.5987418, 0, 0.2039216, 1, 1,
0.3316244, 0.05332608, 1.741081, 0, 0.1960784, 1, 1,
0.3347539, -0.8367572, 5.370909, 0, 0.1882353, 1, 1,
0.3353885, 0.6978781, 0.4223899, 0, 0.1843137, 1, 1,
0.3390117, 0.03488552, 2.109301, 0, 0.1764706, 1, 1,
0.342533, 0.1363815, 0.6540051, 0, 0.172549, 1, 1,
0.3437727, -1.54493, 2.923437, 0, 0.1647059, 1, 1,
0.3455799, 0.6550399, 1.651399, 0, 0.1607843, 1, 1,
0.3471395, -0.8188444, 4.291647, 0, 0.1529412, 1, 1,
0.3473413, -0.7984289, 2.310017, 0, 0.1490196, 1, 1,
0.3487422, -1.822747, 2.241093, 0, 0.1411765, 1, 1,
0.3493567, -1.81345, 1.283426, 0, 0.1372549, 1, 1,
0.3520224, 0.08196942, 1.43465, 0, 0.1294118, 1, 1,
0.3561732, -0.4138428, 1.411651, 0, 0.1254902, 1, 1,
0.3564721, -0.7939343, 2.679784, 0, 0.1176471, 1, 1,
0.3572042, -1.216587, 2.847623, 0, 0.1137255, 1, 1,
0.362589, 1.12371, 0.5721051, 0, 0.1058824, 1, 1,
0.3646206, 1.192773, 1.782774, 0, 0.09803922, 1, 1,
0.3646894, -0.8928146, 3.503817, 0, 0.09411765, 1, 1,
0.3727848, 1.407169, 1.464976, 0, 0.08627451, 1, 1,
0.372895, 1.583991, 1.990845, 0, 0.08235294, 1, 1,
0.3747732, -0.8146962, 3.752073, 0, 0.07450981, 1, 1,
0.3767054, -0.4169024, 2.016947, 0, 0.07058824, 1, 1,
0.3800713, -1.689348, 2.807457, 0, 0.0627451, 1, 1,
0.3825302, -0.2643749, 3.421144, 0, 0.05882353, 1, 1,
0.3850729, -0.3841137, 3.221549, 0, 0.05098039, 1, 1,
0.3858618, -1.378203, 3.079586, 0, 0.04705882, 1, 1,
0.3878485, 0.04868403, 0.2158308, 0, 0.03921569, 1, 1,
0.3939766, -1.250994, 1.2368, 0, 0.03529412, 1, 1,
0.3967693, -0.9142903, 2.17487, 0, 0.02745098, 1, 1,
0.3976827, 0.02398083, -0.3228302, 0, 0.02352941, 1, 1,
0.3998729, -1.371085, 2.785941, 0, 0.01568628, 1, 1,
0.4003489, 0.9174144, 0.6191378, 0, 0.01176471, 1, 1,
0.4046958, 0.4924358, -0.1253172, 0, 0.003921569, 1, 1,
0.4065402, -0.4663195, 1.236122, 0.003921569, 0, 1, 1,
0.4070682, 0.3753006, 1.753089, 0.007843138, 0, 1, 1,
0.4099286, -0.1581592, 3.003217, 0.01568628, 0, 1, 1,
0.410676, -0.9023536, 3.2314, 0.01960784, 0, 1, 1,
0.411584, -0.4444151, 3.058419, 0.02745098, 0, 1, 1,
0.4143515, -1.605087, 2.456801, 0.03137255, 0, 1, 1,
0.4152696, 1.089325, -0.04428332, 0.03921569, 0, 1, 1,
0.4233717, 0.05667847, 1.43788, 0.04313726, 0, 1, 1,
0.429863, -1.88771, 2.46223, 0.05098039, 0, 1, 1,
0.4411126, 0.9097059, 0.1433553, 0.05490196, 0, 1, 1,
0.4469331, 0.02933002, 2.157619, 0.0627451, 0, 1, 1,
0.4484421, 1.716788, 0.3048079, 0.06666667, 0, 1, 1,
0.4488686, -0.7224464, 2.415218, 0.07450981, 0, 1, 1,
0.4521311, 1.063895, -0.6439998, 0.07843138, 0, 1, 1,
0.4570622, 0.05445296, 2.273669, 0.08627451, 0, 1, 1,
0.4584387, -0.3115095, 0.6051093, 0.09019608, 0, 1, 1,
0.4683431, 0.5671592, -0.7618037, 0.09803922, 0, 1, 1,
0.4691097, -0.2639499, 3.132432, 0.1058824, 0, 1, 1,
0.4708869, 0.8677208, -0.2669885, 0.1098039, 0, 1, 1,
0.4739725, -0.4449752, 1.865136, 0.1176471, 0, 1, 1,
0.4773569, 2.030651, -0.8902346, 0.1215686, 0, 1, 1,
0.4774326, 0.7571325, 3.183943, 0.1294118, 0, 1, 1,
0.4775009, 1.623524, 2.125317, 0.1333333, 0, 1, 1,
0.4804385, 0.1468992, -1.081958, 0.1411765, 0, 1, 1,
0.481997, -1.012858, 4.146198, 0.145098, 0, 1, 1,
0.48209, 0.1177501, 1.809133, 0.1529412, 0, 1, 1,
0.48841, -1.885386, 2.449771, 0.1568628, 0, 1, 1,
0.49433, -0.9206061, 4.340171, 0.1647059, 0, 1, 1,
0.5114526, -1.640275, 3.132543, 0.1686275, 0, 1, 1,
0.511979, 1.020615, 1.021151, 0.1764706, 0, 1, 1,
0.5133427, 0.002840916, 1.393674, 0.1803922, 0, 1, 1,
0.5168468, -0.1430176, 1.576664, 0.1882353, 0, 1, 1,
0.5210522, -1.523403, 2.525951, 0.1921569, 0, 1, 1,
0.5265958, 0.2714455, 1.591907, 0.2, 0, 1, 1,
0.5321429, 0.1460822, 0.248006, 0.2078431, 0, 1, 1,
0.5338345, 0.772383, 0.7579662, 0.2117647, 0, 1, 1,
0.5344182, -0.731392, 2.740985, 0.2196078, 0, 1, 1,
0.5380036, -1.265753, 4.984212, 0.2235294, 0, 1, 1,
0.5381881, 1.359109, -1.083831, 0.2313726, 0, 1, 1,
0.5390168, 0.1025355, 1.036789, 0.2352941, 0, 1, 1,
0.5401142, -0.0245221, 1.725998, 0.2431373, 0, 1, 1,
0.5538056, -0.2189921, 3.755975, 0.2470588, 0, 1, 1,
0.5569442, 0.03783745, 1.464406, 0.254902, 0, 1, 1,
0.5574198, 0.9513097, 0.3836192, 0.2588235, 0, 1, 1,
0.5576898, 0.09814771, 1.873114, 0.2666667, 0, 1, 1,
0.5589929, 0.7352766, 0.1628233, 0.2705882, 0, 1, 1,
0.5602991, 0.6690345, 0.8070368, 0.2784314, 0, 1, 1,
0.5611205, -0.3287543, 1.7999, 0.282353, 0, 1, 1,
0.5654224, -0.1184817, 1.040771, 0.2901961, 0, 1, 1,
0.5673121, -0.09033351, 1.731782, 0.2941177, 0, 1, 1,
0.5687889, 0.3922561, 0.2997409, 0.3019608, 0, 1, 1,
0.5729681, 0.1477248, 2.202258, 0.3098039, 0, 1, 1,
0.5738759, 1.286683, 2.176838, 0.3137255, 0, 1, 1,
0.5782932, 1.234265, 0.07910194, 0.3215686, 0, 1, 1,
0.5807634, -0.3758582, 2.757743, 0.3254902, 0, 1, 1,
0.5843655, -0.28907, 2.913563, 0.3333333, 0, 1, 1,
0.5870686, -1.206843, 2.552073, 0.3372549, 0, 1, 1,
0.5885888, -0.9475172, 4.976433, 0.345098, 0, 1, 1,
0.591905, 0.8002572, 0.504249, 0.3490196, 0, 1, 1,
0.5925565, 1.832963, -1.444343, 0.3568628, 0, 1, 1,
0.5986199, 0.6859229, -0.2848816, 0.3607843, 0, 1, 1,
0.6048281, -0.1396611, 2.294938, 0.3686275, 0, 1, 1,
0.606353, -0.7444955, 2.117597, 0.372549, 0, 1, 1,
0.6077469, -1.590629, 1.459681, 0.3803922, 0, 1, 1,
0.6106617, -0.667985, 1.866574, 0.3843137, 0, 1, 1,
0.6107396, 0.4802964, 0.1484321, 0.3921569, 0, 1, 1,
0.6114392, 0.1865012, 0.5057259, 0.3960784, 0, 1, 1,
0.623536, -0.1842554, 1.83222, 0.4039216, 0, 1, 1,
0.6249315, 0.0739803, 3.364261, 0.4117647, 0, 1, 1,
0.6390477, 1.302247, -0.004161123, 0.4156863, 0, 1, 1,
0.6429763, -1.646281, 4.352602, 0.4235294, 0, 1, 1,
0.6436406, -0.9056937, 1.113, 0.427451, 0, 1, 1,
0.6463453, -1.144879, 3.374434, 0.4352941, 0, 1, 1,
0.6488308, -1.038041, 3.301743, 0.4392157, 0, 1, 1,
0.6505675, 0.245184, 0.8596085, 0.4470588, 0, 1, 1,
0.6557905, 1.607656, 1.698202, 0.4509804, 0, 1, 1,
0.6604652, 0.5688564, 0.5467086, 0.4588235, 0, 1, 1,
0.6633921, -1.073002, 4.021889, 0.4627451, 0, 1, 1,
0.6639384, 1.671765, -1.120914, 0.4705882, 0, 1, 1,
0.6653345, 0.1297823, 2.033409, 0.4745098, 0, 1, 1,
0.6683978, -1.731974, 1.498735, 0.4823529, 0, 1, 1,
0.6723576, 0.3585601, -0.04095004, 0.4862745, 0, 1, 1,
0.6746195, 1.923528, 1.57953, 0.4941176, 0, 1, 1,
0.6751764, 1.014897, -0.003666713, 0.5019608, 0, 1, 1,
0.676872, -1.498978, 2.428293, 0.5058824, 0, 1, 1,
0.6780882, 0.9414949, -0.641554, 0.5137255, 0, 1, 1,
0.6805664, -0.02481876, 0.5260894, 0.5176471, 0, 1, 1,
0.6836491, 1.2987, 1.63123, 0.5254902, 0, 1, 1,
0.6869488, 0.08451968, 1.515437, 0.5294118, 0, 1, 1,
0.6902093, -1.258237, 2.257826, 0.5372549, 0, 1, 1,
0.6931473, -0.6860064, 2.149782, 0.5411765, 0, 1, 1,
0.7019585, -1.00661, 2.413762, 0.5490196, 0, 1, 1,
0.7091555, -0.3724831, 2.919652, 0.5529412, 0, 1, 1,
0.7102602, -1.26241, 3.059173, 0.5607843, 0, 1, 1,
0.7196715, 0.4304131, -1.313245, 0.5647059, 0, 1, 1,
0.7210512, 1.809429, -0.7704901, 0.572549, 0, 1, 1,
0.7226195, -0.8096077, 1.84656, 0.5764706, 0, 1, 1,
0.7278439, -0.4705856, 3.11915, 0.5843138, 0, 1, 1,
0.7284782, -1.423702, 1.858036, 0.5882353, 0, 1, 1,
0.7285122, 0.4348738, 3.617095, 0.5960785, 0, 1, 1,
0.7313782, -1.327715, 1.438142, 0.6039216, 0, 1, 1,
0.7321448, -1.184586, 3.434488, 0.6078432, 0, 1, 1,
0.7326455, -0.2479118, -0.01745289, 0.6156863, 0, 1, 1,
0.738555, 1.079338, 1.41206, 0.6196079, 0, 1, 1,
0.7428097, 2.847149, -0.0609706, 0.627451, 0, 1, 1,
0.7431037, -0.07670496, 1.144891, 0.6313726, 0, 1, 1,
0.7433256, -1.17264, 4.26497, 0.6392157, 0, 1, 1,
0.7435513, -0.2355229, 1.565952, 0.6431373, 0, 1, 1,
0.7444766, 0.8402275, 0.9844568, 0.6509804, 0, 1, 1,
0.7532785, -0.7797549, 0.2794372, 0.654902, 0, 1, 1,
0.7578276, -0.1407988, 0.02628571, 0.6627451, 0, 1, 1,
0.7597202, -0.03605964, 1.027438, 0.6666667, 0, 1, 1,
0.7644822, 1.24708, -0.7229294, 0.6745098, 0, 1, 1,
0.7647372, -0.3782464, 2.62603, 0.6784314, 0, 1, 1,
0.7648279, -0.7395696, 3.095737, 0.6862745, 0, 1, 1,
0.7736681, 3.139762, 0.550377, 0.6901961, 0, 1, 1,
0.7741274, 0.2967528, 3.389961, 0.6980392, 0, 1, 1,
0.7752039, 0.8455924, 0.2966072, 0.7058824, 0, 1, 1,
0.7770128, -2.672567, 3.596918, 0.7098039, 0, 1, 1,
0.7774105, -0.73562, 1.332194, 0.7176471, 0, 1, 1,
0.7858893, 0.5048545, 1.189044, 0.7215686, 0, 1, 1,
0.7862946, -0.8910019, 2.400234, 0.7294118, 0, 1, 1,
0.7905723, 0.4958788, -0.6765209, 0.7333333, 0, 1, 1,
0.7927109, 1.042523, 1.595685, 0.7411765, 0, 1, 1,
0.7954598, -1.039759, 2.326317, 0.7450981, 0, 1, 1,
0.7963901, -0.2734122, 1.505476, 0.7529412, 0, 1, 1,
0.8053471, 0.455763, 2.054772, 0.7568628, 0, 1, 1,
0.8082052, -0.4280724, 2.057754, 0.7647059, 0, 1, 1,
0.8099524, -1.441003, 2.840076, 0.7686275, 0, 1, 1,
0.8103279, 0.2327919, 2.64765, 0.7764706, 0, 1, 1,
0.8112406, 1.0978, 1.074975, 0.7803922, 0, 1, 1,
0.8117174, -1.432117, 0.6712517, 0.7882353, 0, 1, 1,
0.8143429, -0.4366235, 0.967064, 0.7921569, 0, 1, 1,
0.8149298, -1.25153, 3.282724, 0.8, 0, 1, 1,
0.8217774, -1.189865, 2.135311, 0.8078431, 0, 1, 1,
0.8249859, 3.009408, 0.5665516, 0.8117647, 0, 1, 1,
0.8330585, -1.226448, 1.920863, 0.8196079, 0, 1, 1,
0.8335206, -1.843322, 4.203841, 0.8235294, 0, 1, 1,
0.8392435, -0.7668815, 3.931261, 0.8313726, 0, 1, 1,
0.8423871, -0.05747243, 2.105478, 0.8352941, 0, 1, 1,
0.8510863, 1.122074, 0.07817721, 0.8431373, 0, 1, 1,
0.8519592, -0.5887972, 2.538511, 0.8470588, 0, 1, 1,
0.8531056, -1.572252, 3.55544, 0.854902, 0, 1, 1,
0.8534424, -0.8091332, 4.431012, 0.8588235, 0, 1, 1,
0.8542971, -0.02571522, 2.453098, 0.8666667, 0, 1, 1,
0.8592319, 0.4506662, 0.6455758, 0.8705882, 0, 1, 1,
0.8615451, 1.6067, 0.1996716, 0.8784314, 0, 1, 1,
0.8648925, 1.260332, 2.10225, 0.8823529, 0, 1, 1,
0.8657242, -1.118935, 2.204896, 0.8901961, 0, 1, 1,
0.8657461, -1.095011, 2.353272, 0.8941177, 0, 1, 1,
0.8659957, 0.1793735, 1.621951, 0.9019608, 0, 1, 1,
0.868647, 0.2475061, 0.7018335, 0.9098039, 0, 1, 1,
0.8721928, -1.538347, 3.516815, 0.9137255, 0, 1, 1,
0.878676, 0.4885725, 1.461826, 0.9215686, 0, 1, 1,
0.8816078, 0.6076851, 2.005222, 0.9254902, 0, 1, 1,
0.8875436, 1.228068, 0.2859448, 0.9333333, 0, 1, 1,
0.8904905, 1.355614, -0.1758536, 0.9372549, 0, 1, 1,
0.8958545, -0.775246, 1.58753, 0.945098, 0, 1, 1,
0.8977541, -1.437755, 1.9938, 0.9490196, 0, 1, 1,
0.9039631, -1.15919, 2.117129, 0.9568627, 0, 1, 1,
0.9065878, 0.01014328, 1.85571, 0.9607843, 0, 1, 1,
0.9095342, -1.821919, 3.025819, 0.9686275, 0, 1, 1,
0.91699, -0.1281834, 1.615642, 0.972549, 0, 1, 1,
0.9175746, -0.07879844, 1.155678, 0.9803922, 0, 1, 1,
0.9212577, 0.2456914, -0.07355727, 0.9843137, 0, 1, 1,
0.9251555, -0.5151088, 0.6654711, 0.9921569, 0, 1, 1,
0.9253045, 0.4728156, 2.112933, 0.9960784, 0, 1, 1,
0.9471475, 1.028656, -1.43854, 1, 0, 0.9960784, 1,
0.9510792, 0.2982192, 2.314951, 1, 0, 0.9882353, 1,
0.9554209, 0.2939677, -0.4841116, 1, 0, 0.9843137, 1,
0.9568606, 0.2504211, -0.6086825, 1, 0, 0.9764706, 1,
0.957974, 0.2415859, 1.32863, 1, 0, 0.972549, 1,
0.9616852, 0.3016426, 2.104677, 1, 0, 0.9647059, 1,
0.9664999, -0.5840794, 0.1419563, 1, 0, 0.9607843, 1,
0.9682001, -0.5127446, 2.57629, 1, 0, 0.9529412, 1,
0.9693049, -0.5260879, 2.733028, 1, 0, 0.9490196, 1,
0.9735405, 1.339864, 0.1600878, 1, 0, 0.9411765, 1,
0.9785365, -0.02425537, 1.751314, 1, 0, 0.9372549, 1,
0.9957187, 1.754807, -0.599467, 1, 0, 0.9294118, 1,
1.010343, 0.6281314, 1.464175, 1, 0, 0.9254902, 1,
1.017081, -0.2238002, 0.7040431, 1, 0, 0.9176471, 1,
1.017399, -0.04482258, 0.8398917, 1, 0, 0.9137255, 1,
1.017779, -0.4933365, 3.466143, 1, 0, 0.9058824, 1,
1.023755, -0.1442166, 1.268399, 1, 0, 0.9019608, 1,
1.027056, 0.3964514, 2.190152, 1, 0, 0.8941177, 1,
1.033359, -1.641271, 2.308841, 1, 0, 0.8862745, 1,
1.042823, 1.646854, -0.9874119, 1, 0, 0.8823529, 1,
1.044855, 0.2949251, 1.402589, 1, 0, 0.8745098, 1,
1.045947, 0.921775, 0.9119353, 1, 0, 0.8705882, 1,
1.047425, -0.4848109, 1.327034, 1, 0, 0.8627451, 1,
1.054968, 0.3027741, -0.2849955, 1, 0, 0.8588235, 1,
1.060722, 1.072973, 1.332763, 1, 0, 0.8509804, 1,
1.068355, 0.9368755, 2.472357, 1, 0, 0.8470588, 1,
1.070259, -0.4544702, 0.5213776, 1, 0, 0.8392157, 1,
1.072471, 0.4002799, 1.435842, 1, 0, 0.8352941, 1,
1.077065, 0.2915289, 1.619377, 1, 0, 0.827451, 1,
1.090034, 1.034233, 1.678552, 1, 0, 0.8235294, 1,
1.099257, 0.6075533, 1.660321, 1, 0, 0.8156863, 1,
1.101108, 1.407599, 0.7667824, 1, 0, 0.8117647, 1,
1.105354, 0.9470339, 1.307133, 1, 0, 0.8039216, 1,
1.107056, 2.255886, 1.189753, 1, 0, 0.7960784, 1,
1.1122, -1.733083, 2.625797, 1, 0, 0.7921569, 1,
1.113403, 0.1178207, 2.739211, 1, 0, 0.7843137, 1,
1.117285, -1.52703, 1.356469, 1, 0, 0.7803922, 1,
1.128989, 0.6660538, 0.4239658, 1, 0, 0.772549, 1,
1.130289, -1.739958, 2.73158, 1, 0, 0.7686275, 1,
1.132997, 0.7351457, 0.904038, 1, 0, 0.7607843, 1,
1.133607, -1.706673, 3.415771, 1, 0, 0.7568628, 1,
1.137699, 1.238176, 0.3131048, 1, 0, 0.7490196, 1,
1.13828, 0.06199319, 2.244184, 1, 0, 0.7450981, 1,
1.139076, 0.08380406, 0.3563235, 1, 0, 0.7372549, 1,
1.159096, -0.1080303, 2.652458, 1, 0, 0.7333333, 1,
1.167073, -0.223741, 3.847618, 1, 0, 0.7254902, 1,
1.169545, 0.8842146, 0.8225884, 1, 0, 0.7215686, 1,
1.173064, 0.2302528, 2.273709, 1, 0, 0.7137255, 1,
1.177571, 0.37174, 0.5557533, 1, 0, 0.7098039, 1,
1.178383, -0.9347286, 3.210516, 1, 0, 0.7019608, 1,
1.179233, 0.9931365, -1.051334, 1, 0, 0.6941177, 1,
1.180031, 1.190787, 1.051957, 1, 0, 0.6901961, 1,
1.184596, -0.5626621, 3.02607, 1, 0, 0.682353, 1,
1.192559, 0.1148738, 0.2252453, 1, 0, 0.6784314, 1,
1.199443, 1.232427, -0.8903463, 1, 0, 0.6705883, 1,
1.200406, -0.394983, 2.140766, 1, 0, 0.6666667, 1,
1.232959, 0.4845744, 1.17279, 1, 0, 0.6588235, 1,
1.238032, 0.7962488, -0.03690995, 1, 0, 0.654902, 1,
1.250648, 0.7180871, 1.302678, 1, 0, 0.6470588, 1,
1.251158, -0.3926613, 1.089209, 1, 0, 0.6431373, 1,
1.256217, -0.7642341, 2.0306, 1, 0, 0.6352941, 1,
1.261869, 1.261947, 0.9223822, 1, 0, 0.6313726, 1,
1.266136, -0.9212995, 0.7503442, 1, 0, 0.6235294, 1,
1.267529, -0.1830091, 1.998827, 1, 0, 0.6196079, 1,
1.267604, -0.6180226, 1.270317, 1, 0, 0.6117647, 1,
1.27552, 0.5430149, 0.3385877, 1, 0, 0.6078432, 1,
1.290838, -0.2839775, 1.332216, 1, 0, 0.6, 1,
1.299903, 0.869606, 0.4047302, 1, 0, 0.5921569, 1,
1.309002, -1.346948, 2.86277, 1, 0, 0.5882353, 1,
1.309004, 0.3778396, 1.588348, 1, 0, 0.5803922, 1,
1.312361, 0.5058521, 1.780042, 1, 0, 0.5764706, 1,
1.312579, -1.3208, 1.808082, 1, 0, 0.5686275, 1,
1.312822, -1.881004, 3.213198, 1, 0, 0.5647059, 1,
1.313213, -0.7718223, 0.9693093, 1, 0, 0.5568628, 1,
1.319221, 0.3535505, 1.426108, 1, 0, 0.5529412, 1,
1.319275, 0.6265997, 1.494993, 1, 0, 0.5450981, 1,
1.321385, -0.744033, 1.444365, 1, 0, 0.5411765, 1,
1.327768, -0.513073, 2.095812, 1, 0, 0.5333334, 1,
1.335187, 0.8867282, 1.738083, 1, 0, 0.5294118, 1,
1.351177, 0.895759, 2.160446, 1, 0, 0.5215687, 1,
1.354902, 2.027298, 2.012076, 1, 0, 0.5176471, 1,
1.355113, -0.2300728, 2.07155, 1, 0, 0.509804, 1,
1.369819, 1.339251, 0.269545, 1, 0, 0.5058824, 1,
1.389708, -2.177306, 2.56905, 1, 0, 0.4980392, 1,
1.400337, 0.5219368, 1.240999, 1, 0, 0.4901961, 1,
1.404077, -1.329734, 2.395152, 1, 0, 0.4862745, 1,
1.404101, 0.04975423, 2.272464, 1, 0, 0.4784314, 1,
1.407402, 1.732416, 1.341851, 1, 0, 0.4745098, 1,
1.427916, -0.8817658, 1.356269, 1, 0, 0.4666667, 1,
1.42815, -1.941791, 4.71383, 1, 0, 0.4627451, 1,
1.429258, -1.617172, 1.317302, 1, 0, 0.454902, 1,
1.460272, 0.3573793, 1.357113, 1, 0, 0.4509804, 1,
1.473425, 0.4482553, 2.638642, 1, 0, 0.4431373, 1,
1.474158, 0.3083929, 0.8910112, 1, 0, 0.4392157, 1,
1.485447, 0.7280912, 1.442325, 1, 0, 0.4313726, 1,
1.490523, -0.1495806, 1.037099, 1, 0, 0.427451, 1,
1.500793, 0.4041667, -0.3763551, 1, 0, 0.4196078, 1,
1.500845, 1.4268, 0.4601467, 1, 0, 0.4156863, 1,
1.511747, 1.934812, 1.924263, 1, 0, 0.4078431, 1,
1.528308, -0.7934334, 3.240225, 1, 0, 0.4039216, 1,
1.539171, 0.8781927, 2.586236, 1, 0, 0.3960784, 1,
1.543036, 1.51367, 0.9663677, 1, 0, 0.3882353, 1,
1.554817, 0.8487889, 0.1070519, 1, 0, 0.3843137, 1,
1.5628, -0.1561032, 2.036157, 1, 0, 0.3764706, 1,
1.577304, 0.7847969, 1.336034, 1, 0, 0.372549, 1,
1.579681, -1.270566, -0.2558478, 1, 0, 0.3647059, 1,
1.58018, 0.8576182, 1.214145, 1, 0, 0.3607843, 1,
1.594707, -0.3285174, 0.3479865, 1, 0, 0.3529412, 1,
1.594872, -0.7295123, 1.605346, 1, 0, 0.3490196, 1,
1.598281, 1.050036, -0.6210772, 1, 0, 0.3411765, 1,
1.60146, -0.9010534, 1.917146, 1, 0, 0.3372549, 1,
1.608229, 0.3458355, 1.24116, 1, 0, 0.3294118, 1,
1.612329, 0.5914829, -0.04687671, 1, 0, 0.3254902, 1,
1.619607, 1.86061, -0.2900071, 1, 0, 0.3176471, 1,
1.622843, -0.9998049, 2.09617, 1, 0, 0.3137255, 1,
1.629406, -1.579976, 4.135748, 1, 0, 0.3058824, 1,
1.649043, 0.5306785, 0.948763, 1, 0, 0.2980392, 1,
1.66837, 1.087988, -0.3594685, 1, 0, 0.2941177, 1,
1.677878, 1.19882, 1.669756, 1, 0, 0.2862745, 1,
1.685757, -1.364063, 2.398412, 1, 0, 0.282353, 1,
1.688689, -1.400114, 3.627875, 1, 0, 0.2745098, 1,
1.690961, -0.9308995, 2.126188, 1, 0, 0.2705882, 1,
1.702583, 0.9577082, -0.006688209, 1, 0, 0.2627451, 1,
1.706035, -0.1961107, 1.5466, 1, 0, 0.2588235, 1,
1.711156, -0.7606379, 1.260366, 1, 0, 0.2509804, 1,
1.717016, -0.232391, 2.742867, 1, 0, 0.2470588, 1,
1.717587, 0.1191878, 1.080898, 1, 0, 0.2392157, 1,
1.742536, 1.155553, 1.085779, 1, 0, 0.2352941, 1,
1.788815, 0.5316716, 1.535515, 1, 0, 0.227451, 1,
1.791614, -1.008939, 1.990347, 1, 0, 0.2235294, 1,
1.795506, 1.088085, 0.9836989, 1, 0, 0.2156863, 1,
1.817214, 0.4912302, 0.1132814, 1, 0, 0.2117647, 1,
1.826244, -0.5744566, 3.209201, 1, 0, 0.2039216, 1,
1.836112, 0.8319889, 3.439811, 1, 0, 0.1960784, 1,
1.846979, 1.550881, 0.2618189, 1, 0, 0.1921569, 1,
1.883937, -0.04916698, 2.325005, 1, 0, 0.1843137, 1,
1.900366, -2.308347, 3.739875, 1, 0, 0.1803922, 1,
1.938107, 0.903913, 1.642563, 1, 0, 0.172549, 1,
1.941528, 0.8208749, 2.621396, 1, 0, 0.1686275, 1,
1.948432, 1.112876, 1.927434, 1, 0, 0.1607843, 1,
1.955424, -0.3577691, 2.138856, 1, 0, 0.1568628, 1,
1.964762, -1.548393, 2.547204, 1, 0, 0.1490196, 1,
1.967599, -1.990328, 0.9719619, 1, 0, 0.145098, 1,
1.970964, -0.2013373, 1.396445, 1, 0, 0.1372549, 1,
1.980458, 0.5167052, 1.44918, 1, 0, 0.1333333, 1,
2.046178, -0.2602116, 1.686708, 1, 0, 0.1254902, 1,
2.04647, 0.7312192, 1.604491, 1, 0, 0.1215686, 1,
2.083444, -1.110005, 3.584457, 1, 0, 0.1137255, 1,
2.085986, -0.8152105, 2.600687, 1, 0, 0.1098039, 1,
2.08933, 0.1652508, -0.7679823, 1, 0, 0.1019608, 1,
2.156439, 1.698956, 1.653864, 1, 0, 0.09411765, 1,
2.163868, 1.64386, 1.005436, 1, 0, 0.09019608, 1,
2.238477, 0.4778785, 0.4055799, 1, 0, 0.08235294, 1,
2.245078, 0.4512823, 0.2006588, 1, 0, 0.07843138, 1,
2.302845, 0.8995088, 1.796545, 1, 0, 0.07058824, 1,
2.515184, -0.7002169, 3.064376, 1, 0, 0.06666667, 1,
2.537921, -0.6564301, 0.4904025, 1, 0, 0.05882353, 1,
2.548904, 1.945147, 0.7397944, 1, 0, 0.05490196, 1,
2.625987, 0.7633737, 0.5767081, 1, 0, 0.04705882, 1,
2.637182, 1.807936, 0.5089096, 1, 0, 0.04313726, 1,
2.707146, 0.09175072, 2.87113, 1, 0, 0.03529412, 1,
2.725222, 0.179316, 1.522704, 1, 0, 0.03137255, 1,
2.940923, 1.577478, 1.679856, 1, 0, 0.02352941, 1,
3.122406, -0.2361011, 0.6656605, 1, 0, 0.01960784, 1,
3.412448, -0.4384995, 1.823183, 1, 0, 0.01176471, 1,
3.498172, 0.95883, 0.9691933, 1, 0, 0.007843138, 1
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
0.04433441, -4.133813, -7.721798, 0, -0.5, 0.5, 0.5,
0.04433441, -4.133813, -7.721798, 1, -0.5, 0.5, 0.5,
0.04433441, -4.133813, -7.721798, 1, 1.5, 0.5, 0.5,
0.04433441, -4.133813, -7.721798, 0, 1.5, 0.5, 0.5
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
-4.580355, 0.03006768, -7.721798, 0, -0.5, 0.5, 0.5,
-4.580355, 0.03006768, -7.721798, 1, -0.5, 0.5, 0.5,
-4.580355, 0.03006768, -7.721798, 1, 1.5, 0.5, 0.5,
-4.580355, 0.03006768, -7.721798, 0, 1.5, 0.5, 0.5
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
-4.580355, -4.133813, 0.1794531, 0, -0.5, 0.5, 0.5,
-4.580355, -4.133813, 0.1794531, 1, -0.5, 0.5, 0.5,
-4.580355, -4.133813, 0.1794531, 1, 1.5, 0.5, 0.5,
-4.580355, -4.133813, 0.1794531, 0, 1.5, 0.5, 0.5
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
-3, -3.172918, -5.898432,
3, -3.172918, -5.898432,
-3, -3.172918, -5.898432,
-3, -3.333067, -6.202326,
-2, -3.172918, -5.898432,
-2, -3.333067, -6.202326,
-1, -3.172918, -5.898432,
-1, -3.333067, -6.202326,
0, -3.172918, -5.898432,
0, -3.333067, -6.202326,
1, -3.172918, -5.898432,
1, -3.333067, -6.202326,
2, -3.172918, -5.898432,
2, -3.333067, -6.202326,
3, -3.172918, -5.898432,
3, -3.333067, -6.202326
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
-3, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
-3, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
-3, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
-3, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
-2, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
-2, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
-2, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
-2, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
-1, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
-1, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
-1, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
-1, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
0, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
0, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
0, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
0, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
1, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
1, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
1, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
1, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
2, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
2, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
2, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
2, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5,
3, -3.653365, -6.810115, 0, -0.5, 0.5, 0.5,
3, -3.653365, -6.810115, 1, -0.5, 0.5, 0.5,
3, -3.653365, -6.810115, 1, 1.5, 0.5, 0.5,
3, -3.653365, -6.810115, 0, 1.5, 0.5, 0.5
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
-3.513119, -3, -5.898432,
-3.513119, 3, -5.898432,
-3.513119, -3, -5.898432,
-3.690991, -3, -6.202326,
-3.513119, -2, -5.898432,
-3.690991, -2, -6.202326,
-3.513119, -1, -5.898432,
-3.690991, -1, -6.202326,
-3.513119, 0, -5.898432,
-3.690991, 0, -6.202326,
-3.513119, 1, -5.898432,
-3.690991, 1, -6.202326,
-3.513119, 2, -5.898432,
-3.690991, 2, -6.202326,
-3.513119, 3, -5.898432,
-3.690991, 3, -6.202326
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
-4.046737, -3, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, -3, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, -3, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, -3, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, -2, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, -2, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, -2, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, -2, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, -1, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, -1, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, -1, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, -1, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, 0, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, 0, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, 0, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, 0, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, 1, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, 1, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, 1, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, 1, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, 2, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, 2, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, 2, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, 2, -6.810115, 0, 1.5, 0.5, 0.5,
-4.046737, 3, -6.810115, 0, -0.5, 0.5, 0.5,
-4.046737, 3, -6.810115, 1, -0.5, 0.5, 0.5,
-4.046737, 3, -6.810115, 1, 1.5, 0.5, 0.5,
-4.046737, 3, -6.810115, 0, 1.5, 0.5, 0.5
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
-3.513119, -3.172918, -4,
-3.513119, -3.172918, 6,
-3.513119, -3.172918, -4,
-3.690991, -3.333067, -4,
-3.513119, -3.172918, -2,
-3.690991, -3.333067, -2,
-3.513119, -3.172918, 0,
-3.690991, -3.333067, 0,
-3.513119, -3.172918, 2,
-3.690991, -3.333067, 2,
-3.513119, -3.172918, 4,
-3.690991, -3.333067, 4,
-3.513119, -3.172918, 6,
-3.690991, -3.333067, 6
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
-4.046737, -3.653365, -4, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, -4, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, -4, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, -4, 0, 1.5, 0.5, 0.5,
-4.046737, -3.653365, -2, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, -2, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, -2, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, -2, 0, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 0, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 0, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 0, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 0, 0, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 2, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 2, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 2, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 2, 0, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 4, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 4, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 4, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 4, 0, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 6, 0, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 6, 1, -0.5, 0.5, 0.5,
-4.046737, -3.653365, 6, 1, 1.5, 0.5, 0.5,
-4.046737, -3.653365, 6, 0, 1.5, 0.5, 0.5
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
-3.513119, -3.172918, -5.898432,
-3.513119, 3.233053, -5.898432,
-3.513119, -3.172918, 6.257339,
-3.513119, 3.233053, 6.257339,
-3.513119, -3.172918, -5.898432,
-3.513119, -3.172918, 6.257339,
-3.513119, 3.233053, -5.898432,
-3.513119, 3.233053, 6.257339,
-3.513119, -3.172918, -5.898432,
3.601787, -3.172918, -5.898432,
-3.513119, -3.172918, 6.257339,
3.601787, -3.172918, 6.257339,
-3.513119, 3.233053, -5.898432,
3.601787, 3.233053, -5.898432,
-3.513119, 3.233053, 6.257339,
3.601787, 3.233053, 6.257339,
3.601787, -3.172918, -5.898432,
3.601787, 3.233053, -5.898432,
3.601787, -3.172918, 6.257339,
3.601787, 3.233053, 6.257339,
3.601787, -3.172918, -5.898432,
3.601787, -3.172918, 6.257339,
3.601787, 3.233053, -5.898432,
3.601787, 3.233053, 6.257339
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
var radius = 8.262409;
var distance = 36.76039;
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
mvMatrix.translate( -0.04433441, -0.03006768, -0.1794531 );
mvMatrix.scale( 1.2556, 1.394555, 0.7349167 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76039);
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
clomazone<-read.table("clomazone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clomazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
y<-clomazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
z<-clomazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
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
-3.409503, -1.153877, -1.501567, 0, 0, 1, 1, 1,
-3.261292, -1.002194, -2.533968, 1, 0, 0, 1, 1,
-3.088925, 0.1989157, -1.41771, 1, 0, 0, 1, 1,
-2.980074, -0.951781, -0.02108961, 1, 0, 0, 1, 1,
-2.566886, -0.4044444, -1.328596, 1, 0, 0, 1, 1,
-2.503641, -0.8544492, -2.448961, 1, 0, 0, 1, 1,
-2.441833, -0.4139744, -1.347564, 0, 0, 0, 1, 1,
-2.32295, 0.4914085, -3.342242, 0, 0, 0, 1, 1,
-2.320272, 1.045911, -1.057958, 0, 0, 0, 1, 1,
-2.309943, 1.672982, -1.65767, 0, 0, 0, 1, 1,
-2.256694, 1.309416, 0.638268, 0, 0, 0, 1, 1,
-2.241609, 2.15346, -1.048902, 0, 0, 0, 1, 1,
-2.229998, -2.24881, -2.135874, 0, 0, 0, 1, 1,
-2.215183, -0.8996345, -4.224787, 1, 1, 1, 1, 1,
-2.191939, -0.9288366, -1.782477, 1, 1, 1, 1, 1,
-2.145795, 0.4100782, -1.156976, 1, 1, 1, 1, 1,
-2.121882, 1.472806, -2.298972, 1, 1, 1, 1, 1,
-2.12079, 0.5365472, -1.500965, 1, 1, 1, 1, 1,
-2.089309, 1.113646, -2.48712, 1, 1, 1, 1, 1,
-2.075475, -0.06828616, -2.116514, 1, 1, 1, 1, 1,
-2.06348, 0.9148403, -3.415637, 1, 1, 1, 1, 1,
-2.059397, 0.5012807, -0.1607746, 1, 1, 1, 1, 1,
-2.055229, -0.2344622, -1.339703, 1, 1, 1, 1, 1,
-2.050012, 0.2303294, -0.3287524, 1, 1, 1, 1, 1,
-2.015168, -0.1489062, 0.01351954, 1, 1, 1, 1, 1,
-1.994479, 0.26365, 0.2080108, 1, 1, 1, 1, 1,
-1.993584, 0.901247, -2.34898, 1, 1, 1, 1, 1,
-1.972316, -0.7195492, -3.916791, 1, 1, 1, 1, 1,
-1.940246, 0.6092377, -1.378531, 0, 0, 1, 1, 1,
-1.936136, -2.099184, -1.776318, 1, 0, 0, 1, 1,
-1.929304, 1.027803, -1.008141, 1, 0, 0, 1, 1,
-1.927103, -0.2145927, -2.698452, 1, 0, 0, 1, 1,
-1.92162, 0.2570077, -0.3362703, 1, 0, 0, 1, 1,
-1.917783, 0.5605176, -2.354746, 1, 0, 0, 1, 1,
-1.903265, 0.7378357, -0.8307275, 0, 0, 0, 1, 1,
-1.893561, -1.125084, -1.816667, 0, 0, 0, 1, 1,
-1.893432, -0.7687042, -3.656435, 0, 0, 0, 1, 1,
-1.84635, 1.62932, -0.3554535, 0, 0, 0, 1, 1,
-1.83277, 0.6160265, -0.9271302, 0, 0, 0, 1, 1,
-1.774112, 0.9739326, -0.2024601, 0, 0, 0, 1, 1,
-1.752119, 0.05661641, -0.7860018, 0, 0, 0, 1, 1,
-1.743576, 1.436841, -2.020876, 1, 1, 1, 1, 1,
-1.740074, 1.161771, -2.916938, 1, 1, 1, 1, 1,
-1.731421, 0.3366799, -0.3421018, 1, 1, 1, 1, 1,
-1.730546, 0.129405, -1.606891, 1, 1, 1, 1, 1,
-1.726804, -0.4320264, -1.031304, 1, 1, 1, 1, 1,
-1.706541, -1.687861, -2.753936, 1, 1, 1, 1, 1,
-1.690384, 0.5291813, -2.350499, 1, 1, 1, 1, 1,
-1.669257, -0.4744139, -1.592527, 1, 1, 1, 1, 1,
-1.660705, -2.123205, -1.672934, 1, 1, 1, 1, 1,
-1.62571, 1.973597, 0.03393933, 1, 1, 1, 1, 1,
-1.625417, -0.01984507, -2.383818, 1, 1, 1, 1, 1,
-1.621853, -0.3134476, -1.455952, 1, 1, 1, 1, 1,
-1.608873, -1.390386, -2.232941, 1, 1, 1, 1, 1,
-1.60551, 1.552792, -3.070417, 1, 1, 1, 1, 1,
-1.583955, 0.15586, 0.2383201, 1, 1, 1, 1, 1,
-1.58121, 0.5393597, -1.193047, 0, 0, 1, 1, 1,
-1.580986, -0.6476737, -1.137984, 1, 0, 0, 1, 1,
-1.577863, -0.8755273, -1.64832, 1, 0, 0, 1, 1,
-1.567703, -1.51545, -1.147907, 1, 0, 0, 1, 1,
-1.565425, 0.0354705, -0.1618132, 1, 0, 0, 1, 1,
-1.564818, -0.7935631, -2.177521, 1, 0, 0, 1, 1,
-1.549643, 0.8526284, -0.6591762, 0, 0, 0, 1, 1,
-1.527808, 0.2065996, -2.15858, 0, 0, 0, 1, 1,
-1.525287, -0.2209953, -2.973968, 0, 0, 0, 1, 1,
-1.522721, 0.07485865, -1.119168, 0, 0, 0, 1, 1,
-1.518022, 0.04087942, -0.3448759, 0, 0, 0, 1, 1,
-1.510744, -0.7924649, -2.228974, 0, 0, 0, 1, 1,
-1.498054, -1.129824, -3.396148, 0, 0, 0, 1, 1,
-1.474037, -0.1494766, -2.700278, 1, 1, 1, 1, 1,
-1.464235, 0.7219431, -1.924406, 1, 1, 1, 1, 1,
-1.459763, -1.876769, -3.245713, 1, 1, 1, 1, 1,
-1.457595, -0.5091208, -1.993595, 1, 1, 1, 1, 1,
-1.451004, -0.2271705, -3.031257, 1, 1, 1, 1, 1,
-1.449981, -0.01622819, 0.3878722, 1, 1, 1, 1, 1,
-1.447213, 1.006524, -1.046239, 1, 1, 1, 1, 1,
-1.444199, -0.1722454, -2.897715, 1, 1, 1, 1, 1,
-1.442768, -2.225399, -2.856159, 1, 1, 1, 1, 1,
-1.441605, -0.1661276, -0.7536876, 1, 1, 1, 1, 1,
-1.437984, 1.299331, -0.8266696, 1, 1, 1, 1, 1,
-1.43197, 0.1392411, -1.705838, 1, 1, 1, 1, 1,
-1.429659, 0.4417359, -1.239825, 1, 1, 1, 1, 1,
-1.428144, 0.7414083, -1.236998, 1, 1, 1, 1, 1,
-1.425029, 0.6742082, -1.206474, 1, 1, 1, 1, 1,
-1.414673, -1.778819, -2.674707, 0, 0, 1, 1, 1,
-1.41453, -2.295045, -2.791605, 1, 0, 0, 1, 1,
-1.400363, 0.3693015, -2.08148, 1, 0, 0, 1, 1,
-1.397191, -0.2521842, -2.283374, 1, 0, 0, 1, 1,
-1.383819, -0.2796607, -0.3376967, 1, 0, 0, 1, 1,
-1.380258, -0.8950398, -2.03604, 1, 0, 0, 1, 1,
-1.376462, -0.2122315, -3.18374, 0, 0, 0, 1, 1,
-1.374497, 0.3775072, -1.973137, 0, 0, 0, 1, 1,
-1.369216, -0.4722387, -2.064532, 0, 0, 0, 1, 1,
-1.362725, -0.4637604, -0.6058314, 0, 0, 0, 1, 1,
-1.359598, 1.371787, 0.1135065, 0, 0, 0, 1, 1,
-1.358202, 0.2424965, -0.7343999, 0, 0, 0, 1, 1,
-1.338085, -1.500089, -3.931033, 0, 0, 0, 1, 1,
-1.331132, 0.624675, -1.418042, 1, 1, 1, 1, 1,
-1.330773, -0.8010997, -3.070286, 1, 1, 1, 1, 1,
-1.316059, -0.6557755, -0.7053419, 1, 1, 1, 1, 1,
-1.283333, 0.3496622, -1.460388, 1, 1, 1, 1, 1,
-1.278467, -0.380185, -2.152227, 1, 1, 1, 1, 1,
-1.266307, -1.218114, -3.257287, 1, 1, 1, 1, 1,
-1.266259, -0.2697866, -1.495791, 1, 1, 1, 1, 1,
-1.254971, 0.7489262, -0.4512763, 1, 1, 1, 1, 1,
-1.254939, 1.89907, 0.4204929, 1, 1, 1, 1, 1,
-1.25388, 0.5113831, -0.1777084, 1, 1, 1, 1, 1,
-1.247776, -0.8423383, -2.197443, 1, 1, 1, 1, 1,
-1.242581, -0.2413434, -0.9029352, 1, 1, 1, 1, 1,
-1.237609, -1.777059, -2.297864, 1, 1, 1, 1, 1,
-1.231713, -0.6978919, -3.740915, 1, 1, 1, 1, 1,
-1.230786, 0.9492607, -1.654272, 1, 1, 1, 1, 1,
-1.221972, -0.2783107, -1.04995, 0, 0, 1, 1, 1,
-1.209235, -0.5270008, -3.673878, 1, 0, 0, 1, 1,
-1.208387, 1.420235, 0.5318347, 1, 0, 0, 1, 1,
-1.206185, 0.3355831, -0.1455856, 1, 0, 0, 1, 1,
-1.175677, -1.41587, -2.458509, 1, 0, 0, 1, 1,
-1.17423, 1.427127, -1.212805, 1, 0, 0, 1, 1,
-1.170797, 0.9934148, -3.388155, 0, 0, 0, 1, 1,
-1.163532, -0.4708177, -1.409922, 0, 0, 0, 1, 1,
-1.162713, -0.4798704, 0.702277, 0, 0, 0, 1, 1,
-1.162349, -2.410935, -1.774318, 0, 0, 0, 1, 1,
-1.151407, -0.1474258, -2.901393, 0, 0, 0, 1, 1,
-1.141547, 0.5151879, -0.9833571, 0, 0, 0, 1, 1,
-1.135126, 0.5437098, -1.76873, 0, 0, 0, 1, 1,
-1.125688, 0.0573616, -2.051624, 1, 1, 1, 1, 1,
-1.125571, -1.007378, -3.211407, 1, 1, 1, 1, 1,
-1.125051, 0.3691305, -1.308463, 1, 1, 1, 1, 1,
-1.124915, -0.1431626, -0.4347751, 1, 1, 1, 1, 1,
-1.116621, 1.162686, -2.191135, 1, 1, 1, 1, 1,
-1.110222, 1.477462, -1.398723, 1, 1, 1, 1, 1,
-1.107118, -2.347904, -1.442905, 1, 1, 1, 1, 1,
-1.089862, 0.5434996, -3.05194, 1, 1, 1, 1, 1,
-1.087251, -0.2776353, -3.228773, 1, 1, 1, 1, 1,
-1.084969, 1.544342, -1.04636, 1, 1, 1, 1, 1,
-1.078454, 0.6619971, -0.1015139, 1, 1, 1, 1, 1,
-1.072839, -1.271123, -1.514594, 1, 1, 1, 1, 1,
-1.071994, -1.772194, -3.480903, 1, 1, 1, 1, 1,
-1.066545, 0.9441637, 0.1043115, 1, 1, 1, 1, 1,
-1.062354, 1.357141, -1.377961, 1, 1, 1, 1, 1,
-1.061877, -0.2470846, -2.088435, 0, 0, 1, 1, 1,
-1.060979, -0.8299879, -4.42943, 1, 0, 0, 1, 1,
-1.059809, -0.1942814, -3.132788, 1, 0, 0, 1, 1,
-1.059392, 0.04030813, 1.514099, 1, 0, 0, 1, 1,
-1.058788, -1.401186, -2.927136, 1, 0, 0, 1, 1,
-1.056944, 0.9949146, 0.9470816, 1, 0, 0, 1, 1,
-1.053089, -1.389769, -2.475685, 0, 0, 0, 1, 1,
-1.044134, 0.2348098, 1.653221, 0, 0, 0, 1, 1,
-1.043983, -0.1556528, -3.723868, 0, 0, 0, 1, 1,
-1.039023, 2.462442, 0.8468201, 0, 0, 0, 1, 1,
-1.037087, 1.156601, -2.143563, 0, 0, 0, 1, 1,
-1.028926, -0.1518656, -1.508772, 0, 0, 0, 1, 1,
-1.024123, 0.226889, -2.756758, 0, 0, 0, 1, 1,
-1.021899, 1.010051, -2.119787, 1, 1, 1, 1, 1,
-1.020228, -0.7991986, -1.394717, 1, 1, 1, 1, 1,
-1.016726, -0.7907432, -2.417352, 1, 1, 1, 1, 1,
-1.013412, 0.3448968, -1.890595, 1, 1, 1, 1, 1,
-1.00868, -0.3026667, -2.578456, 1, 1, 1, 1, 1,
-1.005219, -0.8559968, -2.614682, 1, 1, 1, 1, 1,
-0.9633196, 1.37023, -1.535027, 1, 1, 1, 1, 1,
-0.9570599, -0.03754856, -3.850858, 1, 1, 1, 1, 1,
-0.9537235, -1.0528, -1.523171, 1, 1, 1, 1, 1,
-0.9500912, 1.045632, -1.71862, 1, 1, 1, 1, 1,
-0.9494249, -1.543883, -1.86731, 1, 1, 1, 1, 1,
-0.9469912, -1.206768, -2.054423, 1, 1, 1, 1, 1,
-0.9451598, 1.010451, -1.951403, 1, 1, 1, 1, 1,
-0.9387338, 0.3785161, -1.812556, 1, 1, 1, 1, 1,
-0.9339373, -3.079627, -4.151008, 1, 1, 1, 1, 1,
-0.9326804, 0.1121681, -2.088508, 0, 0, 1, 1, 1,
-0.9307656, -0.09009893, 0.7127895, 1, 0, 0, 1, 1,
-0.9292139, -0.3552767, -0.7080981, 1, 0, 0, 1, 1,
-0.9277294, 0.4487453, -1.102638, 1, 0, 0, 1, 1,
-0.9238433, -0.907369, -3.225383, 1, 0, 0, 1, 1,
-0.9090893, 1.915269, 0.5762777, 1, 0, 0, 1, 1,
-0.903237, -1.197093, -2.068559, 0, 0, 0, 1, 1,
-0.9021466, -0.1541409, -0.5564225, 0, 0, 0, 1, 1,
-0.9021162, 0.8534601, -0.8504107, 0, 0, 0, 1, 1,
-0.8999836, -0.3968879, -2.802807, 0, 0, 0, 1, 1,
-0.8952051, -0.6650963, -1.750697, 0, 0, 0, 1, 1,
-0.8870724, -0.7800622, -1.233839, 0, 0, 0, 1, 1,
-0.8861412, 0.3117788, -2.636111, 0, 0, 0, 1, 1,
-0.8853386, 1.219944, 1.405092, 1, 1, 1, 1, 1,
-0.8657174, -0.9402152, -3.540243, 1, 1, 1, 1, 1,
-0.8653715, -0.7408512, -2.046013, 1, 1, 1, 1, 1,
-0.8608301, 0.01572141, -0.7721058, 1, 1, 1, 1, 1,
-0.8572049, 1.750076, -1.799621, 1, 1, 1, 1, 1,
-0.8564819, 0.3864091, -2.718754, 1, 1, 1, 1, 1,
-0.8545305, 0.3606403, -0.7058626, 1, 1, 1, 1, 1,
-0.8465262, 0.1430744, -2.048534, 1, 1, 1, 1, 1,
-0.843434, 0.1261898, -1.409638, 1, 1, 1, 1, 1,
-0.8421422, -0.3805654, -4.335756, 1, 1, 1, 1, 1,
-0.8398337, -0.3566212, -1.795771, 1, 1, 1, 1, 1,
-0.8339382, -0.1091804, -2.400437, 1, 1, 1, 1, 1,
-0.8263826, 0.1295002, -1.268402, 1, 1, 1, 1, 1,
-0.8174318, 1.838511, -0.8818327, 1, 1, 1, 1, 1,
-0.8169568, 0.35486, -2.610366, 1, 1, 1, 1, 1,
-0.8088411, 0.8461087, -0.8517286, 0, 0, 1, 1, 1,
-0.8082098, 0.1074366, -2.207626, 1, 0, 0, 1, 1,
-0.8039716, 1.428349, -0.0131563, 1, 0, 0, 1, 1,
-0.8036066, 1.248601, 0.3780676, 1, 0, 0, 1, 1,
-0.8035664, 0.6833282, 0.07129068, 1, 0, 0, 1, 1,
-0.8000255, -0.1614922, -1.06404, 1, 0, 0, 1, 1,
-0.7970276, 0.7251462, 0.07135114, 0, 0, 0, 1, 1,
-0.7963179, 1.408373, 0.2866773, 0, 0, 0, 1, 1,
-0.7906355, -2.199032, -2.757091, 0, 0, 0, 1, 1,
-0.7870342, 0.4955937, -0.2388421, 0, 0, 0, 1, 1,
-0.7795256, 0.02485109, -0.9605978, 0, 0, 0, 1, 1,
-0.7749437, -0.2648476, -1.129118, 0, 0, 0, 1, 1,
-0.7702095, -1.701458, -1.177331, 0, 0, 0, 1, 1,
-0.7667832, 0.2028127, -0.03539526, 1, 1, 1, 1, 1,
-0.7655688, 1.320104, 0.6961303, 1, 1, 1, 1, 1,
-0.7581236, 0.2285295, -2.228089, 1, 1, 1, 1, 1,
-0.7492301, -0.07634129, -1.231115, 1, 1, 1, 1, 1,
-0.7487708, -0.7703155, -2.264284, 1, 1, 1, 1, 1,
-0.7446857, -1.321092, -3.762612, 1, 1, 1, 1, 1,
-0.7425272, -0.1723563, -1.32833, 1, 1, 1, 1, 1,
-0.7424479, 1.089795, -0.7634115, 1, 1, 1, 1, 1,
-0.740878, 0.3994675, -0.8354279, 1, 1, 1, 1, 1,
-0.7392289, -0.751779, -3.536715, 1, 1, 1, 1, 1,
-0.7385336, 0.9608915, 0.8075666, 1, 1, 1, 1, 1,
-0.7365832, -1.496929, -1.765379, 1, 1, 1, 1, 1,
-0.7242714, -0.3588357, -1.917986, 1, 1, 1, 1, 1,
-0.7226636, -0.6014956, -1.66142, 1, 1, 1, 1, 1,
-0.7186226, 1.076267, 0.002734392, 1, 1, 1, 1, 1,
-0.717584, -1.106521, -1.87356, 0, 0, 1, 1, 1,
-0.7117972, 0.6425931, 1.572593, 1, 0, 0, 1, 1,
-0.706515, -0.4034172, -2.386044, 1, 0, 0, 1, 1,
-0.7051958, -1.776207, -1.925448, 1, 0, 0, 1, 1,
-0.7019716, 0.4968539, -0.6759533, 1, 0, 0, 1, 1,
-0.7003767, 1.692416, -0.7922588, 1, 0, 0, 1, 1,
-0.6952539, 0.4727648, -1.738233, 0, 0, 0, 1, 1,
-0.6899192, -0.2822468, -1.324275, 0, 0, 0, 1, 1,
-0.6896715, -0.9299641, -3.300746, 0, 0, 0, 1, 1,
-0.6870661, 1.296174, -0.3951733, 0, 0, 0, 1, 1,
-0.6854657, -0.07993986, -3.186191, 0, 0, 0, 1, 1,
-0.6831903, -2.422971, -4.947716, 0, 0, 0, 1, 1,
-0.6803569, -0.903778, -3.922847, 0, 0, 0, 1, 1,
-0.6799398, 0.7086962, -0.6954368, 1, 1, 1, 1, 1,
-0.6713248, 1.098299, -0.7324482, 1, 1, 1, 1, 1,
-0.6690385, -2.033383, -1.690306, 1, 1, 1, 1, 1,
-0.6671081, -0.418721, -2.998188, 1, 1, 1, 1, 1,
-0.6668316, -0.08889987, -2.344949, 1, 1, 1, 1, 1,
-0.6653075, 0.4056147, -2.94676, 1, 1, 1, 1, 1,
-0.6629501, 0.3388443, -1.164259, 1, 1, 1, 1, 1,
-0.6530739, 0.7391844, -1.111152, 1, 1, 1, 1, 1,
-0.6528196, 0.850527, -0.75984, 1, 1, 1, 1, 1,
-0.6527026, -0.6568022, -3.368977, 1, 1, 1, 1, 1,
-0.6499771, 0.5456855, 0.6196157, 1, 1, 1, 1, 1,
-0.6475548, 0.741147, -3.262654, 1, 1, 1, 1, 1,
-0.6386051, -1.4873, -2.565119, 1, 1, 1, 1, 1,
-0.6375028, 0.3631569, -1.739858, 1, 1, 1, 1, 1,
-0.6367812, 0.0392475, -1.881194, 1, 1, 1, 1, 1,
-0.61866, -0.2289464, -2.195443, 0, 0, 1, 1, 1,
-0.6185119, 0.4707203, -0.2786601, 1, 0, 0, 1, 1,
-0.6036636, -0.1690171, -0.8240386, 1, 0, 0, 1, 1,
-0.5996802, 0.4819388, -1.06069, 1, 0, 0, 1, 1,
-0.5990658, -0.3551553, -1.887618, 1, 0, 0, 1, 1,
-0.5910378, 1.679146, -0.8858644, 1, 0, 0, 1, 1,
-0.5845343, -2.32018, -3.183587, 0, 0, 0, 1, 1,
-0.583259, -1.895394, -2.226525, 0, 0, 0, 1, 1,
-0.5824541, -1.226161, -2.238618, 0, 0, 0, 1, 1,
-0.5776564, 1.483903, -0.8317442, 0, 0, 0, 1, 1,
-0.5759967, 1.54444, -0.6943033, 0, 0, 0, 1, 1,
-0.5739598, -0.6824952, -3.719123, 0, 0, 0, 1, 1,
-0.5736668, 1.990211, -0.1592048, 0, 0, 0, 1, 1,
-0.5731114, 1.157164, -1.575025, 1, 1, 1, 1, 1,
-0.5645486, 0.9655844, -0.1797614, 1, 1, 1, 1, 1,
-0.5637065, -0.972098, -1.39555, 1, 1, 1, 1, 1,
-0.5627076, -0.408103, -0.7655957, 1, 1, 1, 1, 1,
-0.5581653, -0.08092624, -0.973923, 1, 1, 1, 1, 1,
-0.5581583, 0.03169265, -0.5562481, 1, 1, 1, 1, 1,
-0.5573319, 1.317741, -1.167528, 1, 1, 1, 1, 1,
-0.5525141, -0.6921834, -3.438781, 1, 1, 1, 1, 1,
-0.5504352, -2.513259, -3.604859, 1, 1, 1, 1, 1,
-0.5485435, 0.553956, -1.639574, 1, 1, 1, 1, 1,
-0.5429674, 1.364514, 0.8305812, 1, 1, 1, 1, 1,
-0.540027, -0.5088197, -2.469566, 1, 1, 1, 1, 1,
-0.5372401, -0.05193867, -1.849203, 1, 1, 1, 1, 1,
-0.5371718, 1.695886, -1.710212, 1, 1, 1, 1, 1,
-0.5312878, 0.06049244, 0.2303237, 1, 1, 1, 1, 1,
-0.5289996, 1.440809, 0.1602611, 0, 0, 1, 1, 1,
-0.5263711, 1.308848, -0.7501265, 1, 0, 0, 1, 1,
-0.5251154, -0.9533232, -3.472116, 1, 0, 0, 1, 1,
-0.524193, 1.64555, -0.5220127, 1, 0, 0, 1, 1,
-0.523382, 0.0156005, -1.739858, 1, 0, 0, 1, 1,
-0.5186989, -1.049572, -3.850356, 1, 0, 0, 1, 1,
-0.5170042, 0.2695299, -2.912139, 0, 0, 0, 1, 1,
-0.5146704, -0.1901469, -2.584476, 0, 0, 0, 1, 1,
-0.5105544, 0.2360586, -1.453617, 0, 0, 0, 1, 1,
-0.5067297, 0.3816753, -0.2822968, 0, 0, 0, 1, 1,
-0.506508, -0.04695839, -1.611184, 0, 0, 0, 1, 1,
-0.5030495, -0.7738054, -3.520595, 0, 0, 0, 1, 1,
-0.4997534, -0.5712925, -3.020835, 0, 0, 0, 1, 1,
-0.4993535, -0.8174585, -4.450125, 1, 1, 1, 1, 1,
-0.4972848, 0.7964035, -2.109202, 1, 1, 1, 1, 1,
-0.4972707, 0.6992179, 1.246539, 1, 1, 1, 1, 1,
-0.4935534, 0.1071422, -1.610246, 1, 1, 1, 1, 1,
-0.492545, 1.131881, -1.141187, 1, 1, 1, 1, 1,
-0.4921574, -0.6747649, -2.620161, 1, 1, 1, 1, 1,
-0.4881716, -0.473416, -3.675202, 1, 1, 1, 1, 1,
-0.4821211, 0.3754077, -0.6134419, 1, 1, 1, 1, 1,
-0.481794, -0.2236039, -3.174167, 1, 1, 1, 1, 1,
-0.4814683, -1.278968, -4.092904, 1, 1, 1, 1, 1,
-0.4740238, -0.3755446, -2.517701, 1, 1, 1, 1, 1,
-0.4719909, 0.262965, 1.333391, 1, 1, 1, 1, 1,
-0.471745, 0.1429256, -0.05712614, 1, 1, 1, 1, 1,
-0.4705618, -0.0703807, -0.3567723, 1, 1, 1, 1, 1,
-0.4701423, 1.564142, -0.2440661, 1, 1, 1, 1, 1,
-0.4696949, 0.1435569, -0.08549224, 0, 0, 1, 1, 1,
-0.465003, 0.2862303, -0.9836938, 1, 0, 0, 1, 1,
-0.4608862, -0.7345282, -3.66375, 1, 0, 0, 1, 1,
-0.4606884, -0.1642209, -2.579537, 1, 0, 0, 1, 1,
-0.4530374, 0.5251726, -0.8908262, 1, 0, 0, 1, 1,
-0.4472122, -0.5781001, -2.710634, 1, 0, 0, 1, 1,
-0.4421899, 1.170567, -1.417184, 0, 0, 0, 1, 1,
-0.4317823, 1.015174, -0.9397747, 0, 0, 0, 1, 1,
-0.4278209, -0.3130111, -3.111882, 0, 0, 0, 1, 1,
-0.4257344, 1.854282, -1.061385, 0, 0, 0, 1, 1,
-0.4245884, -0.4825506, -1.727632, 0, 0, 0, 1, 1,
-0.4240058, 0.1438855, -2.30156, 0, 0, 0, 1, 1,
-0.4228091, -0.9696807, -2.757584, 0, 0, 0, 1, 1,
-0.422173, -1.073402, -3.903967, 1, 1, 1, 1, 1,
-0.4220354, -0.8686921, -3.845951, 1, 1, 1, 1, 1,
-0.4214867, -1.240703, -2.229649, 1, 1, 1, 1, 1,
-0.4205421, 0.2462666, -0.1955695, 1, 1, 1, 1, 1,
-0.4204739, 0.6543311, -0.6806529, 1, 1, 1, 1, 1,
-0.4128657, 1.096373, -1.090043, 1, 1, 1, 1, 1,
-0.4101911, 0.7985398, -0.5215183, 1, 1, 1, 1, 1,
-0.4098737, 0.162239, -1.747074, 1, 1, 1, 1, 1,
-0.406132, -1.202652, -4.615131, 1, 1, 1, 1, 1,
-0.4005838, -1.558047, -2.884182, 1, 1, 1, 1, 1,
-0.3923682, 0.7655181, 0.2328585, 1, 1, 1, 1, 1,
-0.386708, -0.8272164, -2.823127, 1, 1, 1, 1, 1,
-0.3851348, 0.387675, -2.754933, 1, 1, 1, 1, 1,
-0.3829731, -0.06538901, 0.02526525, 1, 1, 1, 1, 1,
-0.3775906, 0.05949458, -2.67946, 1, 1, 1, 1, 1,
-0.3768784, 0.6906997, -0.8571355, 0, 0, 1, 1, 1,
-0.3701544, -0.9396453, -2.345233, 1, 0, 0, 1, 1,
-0.369931, -0.9288014, -3.054099, 1, 0, 0, 1, 1,
-0.3681431, -0.684773, -2.718313, 1, 0, 0, 1, 1,
-0.3605791, -0.1342098, -2.395506, 1, 0, 0, 1, 1,
-0.3600232, -0.08600149, -1.063771, 1, 0, 0, 1, 1,
-0.3561514, 1.291778, 0.9681134, 0, 0, 0, 1, 1,
-0.3535007, -0.2906559, -1.453807, 0, 0, 0, 1, 1,
-0.3532977, 0.2322474, -2.24259, 0, 0, 0, 1, 1,
-0.3435913, -0.1782986, -1.747537, 0, 0, 0, 1, 1,
-0.3413181, -0.635803, -2.773759, 0, 0, 0, 1, 1,
-0.3390259, 0.4592414, -0.6246652, 0, 0, 0, 1, 1,
-0.3368456, -1.298214, -3.87874, 0, 0, 0, 1, 1,
-0.3315456, -0.2514559, -2.540154, 1, 1, 1, 1, 1,
-0.3313237, 0.8284515, 0.1216885, 1, 1, 1, 1, 1,
-0.3294785, -0.7679597, -1.76998, 1, 1, 1, 1, 1,
-0.3280789, -1.488236, -2.960497, 1, 1, 1, 1, 1,
-0.3267811, -2.822462, -0.9880255, 1, 1, 1, 1, 1,
-0.3263949, 1.52057, -0.1949002, 1, 1, 1, 1, 1,
-0.3229153, 0.9464061, -1.795543, 1, 1, 1, 1, 1,
-0.3208196, -0.3076817, -2.462311, 1, 1, 1, 1, 1,
-0.3179411, -1.432345, -3.987122, 1, 1, 1, 1, 1,
-0.3162277, 1.006413, -0.0125529, 1, 1, 1, 1, 1,
-0.3132344, 0.6300104, -1.484624, 1, 1, 1, 1, 1,
-0.3129413, 0.4374437, 0.5701632, 1, 1, 1, 1, 1,
-0.3060398, 0.638716, 0.6577451, 1, 1, 1, 1, 1,
-0.3033672, -1.223963, -4.642652, 1, 1, 1, 1, 1,
-0.3032166, 1.24647, -0.2049376, 1, 1, 1, 1, 1,
-0.3015674, 0.7590361, -1.360736, 0, 0, 1, 1, 1,
-0.3014415, 0.883516, -1.169084, 1, 0, 0, 1, 1,
-0.3008859, -1.189172, -2.507856, 1, 0, 0, 1, 1,
-0.2999043, 1.195884, -1.034204, 1, 0, 0, 1, 1,
-0.2993267, -0.3117103, -0.9465694, 1, 0, 0, 1, 1,
-0.2942749, 0.1013814, -4.283347, 1, 0, 0, 1, 1,
-0.290545, -1.292199, -2.334751, 0, 0, 0, 1, 1,
-0.2896032, -1.056386, -2.930207, 0, 0, 0, 1, 1,
-0.2873276, 1.747911, -0.1857821, 0, 0, 0, 1, 1,
-0.2843083, 0.02593767, -0.6530665, 0, 0, 0, 1, 1,
-0.2839123, -1.914242, -2.446892, 0, 0, 0, 1, 1,
-0.2828597, 0.2127429, -0.3965561, 0, 0, 0, 1, 1,
-0.2824899, 1.61661, -0.8128121, 0, 0, 0, 1, 1,
-0.2804469, 0.3390502, -1.844886, 1, 1, 1, 1, 1,
-0.2798821, 1.566553, 1.203657, 1, 1, 1, 1, 1,
-0.2777568, 0.5092107, -2.033039, 1, 1, 1, 1, 1,
-0.2758448, -0.03095812, -2.207004, 1, 1, 1, 1, 1,
-0.2741446, -0.5529685, -3.936802, 1, 1, 1, 1, 1,
-0.2728712, 0.268447, -0.8446226, 1, 1, 1, 1, 1,
-0.2700625, -0.5801951, -3.074702, 1, 1, 1, 1, 1,
-0.2673481, -1.329967, -3.038817, 1, 1, 1, 1, 1,
-0.2664264, 0.2233947, 0.3481215, 1, 1, 1, 1, 1,
-0.2659555, -0.8942936, -2.867048, 1, 1, 1, 1, 1,
-0.2658664, 0.7573894, -0.3447006, 1, 1, 1, 1, 1,
-0.2641649, -1.427066, -2.744577, 1, 1, 1, 1, 1,
-0.2625387, 0.1582635, 0.4805887, 1, 1, 1, 1, 1,
-0.2573909, -0.4120914, -1.778494, 1, 1, 1, 1, 1,
-0.2571644, -0.6406609, -1.427397, 1, 1, 1, 1, 1,
-0.2558841, 0.125429, -1.244098, 0, 0, 1, 1, 1,
-0.2558444, 0.1001853, -0.9476641, 1, 0, 0, 1, 1,
-0.2501199, -0.287738, -2.961726, 1, 0, 0, 1, 1,
-0.2485345, 0.05025616, -1.220783, 1, 0, 0, 1, 1,
-0.247877, -2.827747, -3.417841, 1, 0, 0, 1, 1,
-0.244166, 0.8641182, -0.301862, 1, 0, 0, 1, 1,
-0.2432772, 0.06654614, -0.267692, 0, 0, 0, 1, 1,
-0.2430316, 0.8792022, -0.7891385, 0, 0, 0, 1, 1,
-0.2363602, 1.512015, 0.4593887, 0, 0, 0, 1, 1,
-0.2346256, 0.5383611, -1.360053, 0, 0, 0, 1, 1,
-0.233906, 0.403549, -1.476508, 0, 0, 0, 1, 1,
-0.2333767, 0.842101, 2.039727, 0, 0, 0, 1, 1,
-0.229388, 0.1734844, -0.01052978, 0, 0, 0, 1, 1,
-0.22865, -0.9938012, -2.664515, 1, 1, 1, 1, 1,
-0.2270797, 0.1953834, -1.30683, 1, 1, 1, 1, 1,
-0.2268781, 0.8453825, 0.4013711, 1, 1, 1, 1, 1,
-0.2237324, 1.293162, 1.170231, 1, 1, 1, 1, 1,
-0.2233149, -1.954903, -3.900734, 1, 1, 1, 1, 1,
-0.2225619, 1.375935, 1.979196, 1, 1, 1, 1, 1,
-0.2193577, -1.094378, -1.471133, 1, 1, 1, 1, 1,
-0.2188933, 0.1777205, -0.9008849, 1, 1, 1, 1, 1,
-0.2107971, 1.329085, 0.8724224, 1, 1, 1, 1, 1,
-0.2104571, 0.6658344, -0.4651668, 1, 1, 1, 1, 1,
-0.2093082, -0.09635831, -3.817576, 1, 1, 1, 1, 1,
-0.2091456, 0.3172129, 0.06310511, 1, 1, 1, 1, 1,
-0.2075009, 0.9041999, -0.9136993, 1, 1, 1, 1, 1,
-0.2071586, 0.5788853, 1.854289, 1, 1, 1, 1, 1,
-0.2015392, 0.7056923, -0.9080769, 1, 1, 1, 1, 1,
-0.1958855, 0.7691491, -1.988899, 0, 0, 1, 1, 1,
-0.1929909, 1.010776, 0.1561398, 1, 0, 0, 1, 1,
-0.192816, -0.3128841, -1.865541, 1, 0, 0, 1, 1,
-0.1907513, -0.6059715, -1.956339, 1, 0, 0, 1, 1,
-0.1891367, 0.6986516, 0.3805708, 1, 0, 0, 1, 1,
-0.1852463, 1.514423, -1.13739, 1, 0, 0, 1, 1,
-0.1803861, 0.5694255, 0.1344998, 0, 0, 0, 1, 1,
-0.1797333, -0.4994166, -3.75294, 0, 0, 0, 1, 1,
-0.1779762, 0.8152642, 1.022776, 0, 0, 0, 1, 1,
-0.1745429, 0.8915638, -1.074036, 0, 0, 0, 1, 1,
-0.1718948, 0.6527998, -0.8815345, 0, 0, 0, 1, 1,
-0.1717803, 0.5384498, -0.3618678, 0, 0, 0, 1, 1,
-0.1692412, 0.1756617, -0.1350292, 0, 0, 0, 1, 1,
-0.1690991, -1.122082, -2.758892, 1, 1, 1, 1, 1,
-0.167994, -0.2232946, -3.082942, 1, 1, 1, 1, 1,
-0.1672043, -0.219545, -1.461925, 1, 1, 1, 1, 1,
-0.1658559, -1.259011, -3.134847, 1, 1, 1, 1, 1,
-0.1656481, 0.266712, -1.044308, 1, 1, 1, 1, 1,
-0.1638331, 1.156535, 0.2015807, 1, 1, 1, 1, 1,
-0.1558401, -0.1937117, -2.023082, 1, 1, 1, 1, 1,
-0.1521354, -0.1174472, -1.930206, 1, 1, 1, 1, 1,
-0.1485559, -0.2267865, -2.795057, 1, 1, 1, 1, 1,
-0.1473342, 1.08454, 0.3806003, 1, 1, 1, 1, 1,
-0.1468112, 1.40256, 0.3777732, 1, 1, 1, 1, 1,
-0.1413725, -0.2067999, -2.368665, 1, 1, 1, 1, 1,
-0.1411204, 0.4981772, -1.470149, 1, 1, 1, 1, 1,
-0.1342012, 1.167375, 0.3984104, 1, 1, 1, 1, 1,
-0.1331923, 0.7761817, 0.7780613, 1, 1, 1, 1, 1,
-0.1329676, 1.749978, 0.4889582, 0, 0, 1, 1, 1,
-0.1297977, -0.1336421, -1.772841, 1, 0, 0, 1, 1,
-0.1291748, -1.91066, -2.224231, 1, 0, 0, 1, 1,
-0.1282229, -0.3742235, -5.413109, 1, 0, 0, 1, 1,
-0.1269627, -0.2660646, -1.431999, 1, 0, 0, 1, 1,
-0.1236544, -0.7295482, -2.752192, 1, 0, 0, 1, 1,
-0.1185753, -1.439518, -3.876185, 0, 0, 0, 1, 1,
-0.1177806, 1.342909, -0.0763436, 0, 0, 0, 1, 1,
-0.1108273, 0.0376152, -2.649572, 0, 0, 0, 1, 1,
-0.1096187, 0.3265267, -0.4766783, 0, 0, 0, 1, 1,
-0.1089637, -0.7765565, -2.828545, 0, 0, 0, 1, 1,
-0.1080123, -1.217001, -0.4668953, 0, 0, 0, 1, 1,
-0.1075461, -0.2676184, -4.247778, 0, 0, 0, 1, 1,
-0.1044703, 0.2199828, -0.6693481, 1, 1, 1, 1, 1,
-0.09289846, 0.05429062, -3.274031, 1, 1, 1, 1, 1,
-0.09200372, 0.5654715, 0.7628491, 1, 1, 1, 1, 1,
-0.09026273, -1.267834, -2.805235, 1, 1, 1, 1, 1,
-0.08486486, -0.3700014, -2.847155, 1, 1, 1, 1, 1,
-0.08464888, -0.4923946, -2.621804, 1, 1, 1, 1, 1,
-0.08274645, -0.8558602, -2.231356, 1, 1, 1, 1, 1,
-0.08025593, 0.8820078, 0.4543282, 1, 1, 1, 1, 1,
-0.07898, 0.9923722, -2.220373, 1, 1, 1, 1, 1,
-0.0779236, 0.2180525, -0.6156668, 1, 1, 1, 1, 1,
-0.07044952, 0.5675159, 0.9336452, 1, 1, 1, 1, 1,
-0.06733934, 1.052721, 0.6934096, 1, 1, 1, 1, 1,
-0.06731483, -1.120645, -4.764376, 1, 1, 1, 1, 1,
-0.06621332, 0.548755, 0.283303, 1, 1, 1, 1, 1,
-0.05613158, -1.620768, -4.73565, 1, 1, 1, 1, 1,
-0.05329893, 1.642504, -0.4411264, 0, 0, 1, 1, 1,
-0.04850462, -0.2386191, -1.428296, 1, 0, 0, 1, 1,
-0.04636747, -0.3826614, -3.773321, 1, 0, 0, 1, 1,
-0.04630008, -0.4821538, -5.721406, 1, 0, 0, 1, 1,
-0.04512246, -0.2310502, -1.977685, 1, 0, 0, 1, 1,
-0.0423724, 0.5244194, 0.7700134, 1, 0, 0, 1, 1,
-0.04103011, 1.579946, 1.583057, 0, 0, 0, 1, 1,
-0.04017569, 0.3730053, -1.112418, 0, 0, 0, 1, 1,
-0.0394539, 0.9798975, 0.8445292, 0, 0, 0, 1, 1,
-0.03702257, 0.1790067, -1.223604, 0, 0, 0, 1, 1,
-0.02290093, -0.3641545, -1.768641, 0, 0, 0, 1, 1,
-0.0199418, -1.792295, -4.18497, 0, 0, 0, 1, 1,
-0.01950775, 0.1395182, 0.01688521, 0, 0, 0, 1, 1,
-0.01880613, 0.8562165, 1.008182, 1, 1, 1, 1, 1,
-0.01584127, 1.457191, -1.145539, 1, 1, 1, 1, 1,
-0.0135347, -0.08095881, -1.682752, 1, 1, 1, 1, 1,
-0.01041892, 1.490825, -0.9039654, 1, 1, 1, 1, 1,
-0.01034442, -1.038569, -3.863731, 1, 1, 1, 1, 1,
-0.007707682, 2.470243, 2.525166, 1, 1, 1, 1, 1,
-0.00685399, 2.947467, 0.7440927, 1, 1, 1, 1, 1,
-0.005163634, 1.385601, 0.08397784, 1, 1, 1, 1, 1,
-0.002575534, -1.786351, -2.430469, 1, 1, 1, 1, 1,
-0.002194369, -0.6461389, -2.377802, 1, 1, 1, 1, 1,
0.00194155, 2.203692, -2.190876, 1, 1, 1, 1, 1,
0.003392422, 0.6843109, -0.5058144, 1, 1, 1, 1, 1,
0.003697208, 1.095604, 1.916499, 1, 1, 1, 1, 1,
0.005187841, -0.7242594, 1.484574, 1, 1, 1, 1, 1,
0.007741631, 0.8231421, 1.00953, 1, 1, 1, 1, 1,
0.008788337, 1.255672, 0.971112, 0, 0, 1, 1, 1,
0.009506966, -0.9786533, 1.751954, 1, 0, 0, 1, 1,
0.01297483, -0.266589, 6.080313, 1, 0, 0, 1, 1,
0.01561243, -1.727436, 2.036379, 1, 0, 0, 1, 1,
0.01749097, -0.8924853, 3.938442, 1, 0, 0, 1, 1,
0.01944051, -1.545533, 2.977426, 1, 0, 0, 1, 1,
0.02137957, 0.5466679, 1.003942, 0, 0, 0, 1, 1,
0.02666344, 0.7813954, -0.1328991, 0, 0, 0, 1, 1,
0.02746919, -0.1001541, 2.721713, 0, 0, 0, 1, 1,
0.02926278, -0.180746, 2.614276, 0, 0, 0, 1, 1,
0.02948077, 0.8170348, 0.6747916, 0, 0, 0, 1, 1,
0.02960422, 0.09415031, 2.432584, 0, 0, 0, 1, 1,
0.03060585, 0.03057247, 1.0384, 0, 0, 0, 1, 1,
0.03418777, 1.200276, -2.188527, 1, 1, 1, 1, 1,
0.03608472, -0.3481198, 2.376652, 1, 1, 1, 1, 1,
0.03685125, 1.001099, 0.005270064, 1, 1, 1, 1, 1,
0.03783319, 0.4638879, 0.3317219, 1, 1, 1, 1, 1,
0.04230563, -1.515335, 3.002604, 1, 1, 1, 1, 1,
0.04713522, -0.7636369, 2.810475, 1, 1, 1, 1, 1,
0.04798935, -0.6343141, 1.831566, 1, 1, 1, 1, 1,
0.0499125, -1.464319, 3.661962, 1, 1, 1, 1, 1,
0.05221009, 2.199311, 0.6387752, 1, 1, 1, 1, 1,
0.06167722, -1.058944, 2.650219, 1, 1, 1, 1, 1,
0.0617469, -0.82342, 4.934938, 1, 1, 1, 1, 1,
0.06567112, -0.9738324, 4.952086, 1, 1, 1, 1, 1,
0.06998431, -0.01130806, 0.8561653, 1, 1, 1, 1, 1,
0.07003842, -1.007753, 1.927131, 1, 1, 1, 1, 1,
0.07786096, -0.05327428, 2.170672, 1, 1, 1, 1, 1,
0.07848687, 2.127911, 0.9593826, 0, 0, 1, 1, 1,
0.08227243, 2.334361, 0.05480079, 1, 0, 0, 1, 1,
0.08355872, -0.3322554, 5.244098, 1, 0, 0, 1, 1,
0.08492805, -1.774524, 1.82127, 1, 0, 0, 1, 1,
0.08561824, 0.9017017, -0.04805277, 1, 0, 0, 1, 1,
0.08619993, -0.6597437, 1.791871, 1, 0, 0, 1, 1,
0.09085271, -2.129825, 4.043276, 0, 0, 0, 1, 1,
0.09154179, 0.6579569, -1.558012, 0, 0, 0, 1, 1,
0.09447464, -0.2614734, 2.109018, 0, 0, 0, 1, 1,
0.09720615, -0.9023429, 2.85561, 0, 0, 0, 1, 1,
0.09733822, -1.067171, 2.231714, 0, 0, 0, 1, 1,
0.09892112, -0.04567996, 0.2673584, 0, 0, 0, 1, 1,
0.1013557, -0.6452709, 2.480795, 0, 0, 0, 1, 1,
0.1019932, -0.9156128, 4.271604, 1, 1, 1, 1, 1,
0.1023894, -0.103254, 1.513291, 1, 1, 1, 1, 1,
0.1024808, 1.332056, -0.8568463, 1, 1, 1, 1, 1,
0.1033963, -0.9899585, 2.918796, 1, 1, 1, 1, 1,
0.1050819, 0.5383574, -0.7077054, 1, 1, 1, 1, 1,
0.1079213, -1.655917, 2.98717, 1, 1, 1, 1, 1,
0.1102004, 0.2727798, 0.5741088, 1, 1, 1, 1, 1,
0.1146655, -1.91001, 4.401845, 1, 1, 1, 1, 1,
0.1162112, 0.7108107, -0.4274403, 1, 1, 1, 1, 1,
0.1173185, -1.342195, 4.602918, 1, 1, 1, 1, 1,
0.117795, -0.8576571, 2.477127, 1, 1, 1, 1, 1,
0.1194269, 0.1854559, 0.1444032, 1, 1, 1, 1, 1,
0.1195774, 1.297643, 0.02828023, 1, 1, 1, 1, 1,
0.1261558, 0.08865107, 1.138306, 1, 1, 1, 1, 1,
0.1315493, -0.8766702, 3.472553, 1, 1, 1, 1, 1,
0.1384183, 1.131813, 0.6075057, 0, 0, 1, 1, 1,
0.1405011, -0.7793032, 2.1863, 1, 0, 0, 1, 1,
0.1425525, -1.153927, 3.30601, 1, 0, 0, 1, 1,
0.1426603, 0.2720793, -0.2167342, 1, 0, 0, 1, 1,
0.1469387, -0.4142939, 2.156183, 1, 0, 0, 1, 1,
0.1500435, 0.08510745, -0.4020888, 1, 0, 0, 1, 1,
0.1510894, 0.6455028, 0.2325925, 0, 0, 0, 1, 1,
0.1511068, -0.7811639, 4.068071, 0, 0, 0, 1, 1,
0.1526522, 0.6503819, -0.1804905, 0, 0, 0, 1, 1,
0.1542011, -0.8627622, 2.153563, 0, 0, 0, 1, 1,
0.1593532, -1.045491, 2.518201, 0, 0, 0, 1, 1,
0.1597523, -0.4943117, 2.735938, 0, 0, 0, 1, 1,
0.1615584, -1.119782, 2.973651, 0, 0, 0, 1, 1,
0.1684901, 0.5907391, 0.09862848, 1, 1, 1, 1, 1,
0.1698749, 0.768537, 1.190293, 1, 1, 1, 1, 1,
0.1711704, -0.8528628, 4.839212, 1, 1, 1, 1, 1,
0.1712229, -0.6055492, 2.71743, 1, 1, 1, 1, 1,
0.1733555, 0.6940748, 0.5584306, 1, 1, 1, 1, 1,
0.1738799, 0.8678699, 1.552618, 1, 1, 1, 1, 1,
0.1744978, -0.8281417, 0.9488983, 1, 1, 1, 1, 1,
0.1746066, -0.2380979, 2.457308, 1, 1, 1, 1, 1,
0.1768326, -1.685336, 2.55964, 1, 1, 1, 1, 1,
0.1788781, -1.90644, 3.048465, 1, 1, 1, 1, 1,
0.179771, -0.1919794, 0.6100235, 1, 1, 1, 1, 1,
0.1813202, 2.070462, 0.1867909, 1, 1, 1, 1, 1,
0.1838572, -1.854401, 5.158466, 1, 1, 1, 1, 1,
0.1867651, -0.1685326, -0.6679344, 1, 1, 1, 1, 1,
0.190036, -0.1531148, 2.603744, 1, 1, 1, 1, 1,
0.1902868, 0.8090248, -0.5145268, 0, 0, 1, 1, 1,
0.1914127, -1.000087, 3.793699, 1, 0, 0, 1, 1,
0.1921225, 2.175619, 0.8590337, 1, 0, 0, 1, 1,
0.2028092, 1.829448, 1.795266, 1, 0, 0, 1, 1,
0.2063137, -0.8530942, 3.737347, 1, 0, 0, 1, 1,
0.2075254, -0.838961, 3.981708, 1, 0, 0, 1, 1,
0.2092213, 1.395465, -0.5211939, 0, 0, 0, 1, 1,
0.2196311, 0.5402129, 1.458477, 0, 0, 0, 1, 1,
0.2218866, -0.932094, 4.031953, 0, 0, 0, 1, 1,
0.2247634, 0.5517222, -0.9008912, 0, 0, 0, 1, 1,
0.2299467, -1.197437, 2.554191, 0, 0, 0, 1, 1,
0.2381926, -0.968803, 4.020999, 0, 0, 0, 1, 1,
0.2421849, -0.6395403, 0.8143377, 0, 0, 0, 1, 1,
0.2436326, 0.3646338, 0.871205, 1, 1, 1, 1, 1,
0.246188, -0.7782001, 1.763943, 1, 1, 1, 1, 1,
0.251083, 0.1959485, 1.335897, 1, 1, 1, 1, 1,
0.2545736, -2.353247, 2.330355, 1, 1, 1, 1, 1,
0.2586031, -2.421824, 3.181607, 1, 1, 1, 1, 1,
0.2616335, -0.1505063, 3.943676, 1, 1, 1, 1, 1,
0.2617171, -1.010314, 3.921972, 1, 1, 1, 1, 1,
0.2628799, 0.7424248, 0.1357029, 1, 1, 1, 1, 1,
0.2677763, 2.317687, 0.2176321, 1, 1, 1, 1, 1,
0.273905, 0.1991266, 2.42208, 1, 1, 1, 1, 1,
0.2767156, -0.8113628, 3.612648, 1, 1, 1, 1, 1,
0.2778685, 1.100906, -0.6021825, 1, 1, 1, 1, 1,
0.2794762, -0.5561711, 3.527624, 1, 1, 1, 1, 1,
0.2812137, -0.02318436, 2.262791, 1, 1, 1, 1, 1,
0.2854536, -1.835253, -0.03785114, 1, 1, 1, 1, 1,
0.2870896, -0.06679504, 0.01522125, 0, 0, 1, 1, 1,
0.2878413, -0.1181645, 2.330244, 1, 0, 0, 1, 1,
0.2915146, -0.5076673, 3.828072, 1, 0, 0, 1, 1,
0.2959742, 1.317539, 1.385811, 1, 0, 0, 1, 1,
0.2964301, -0.9290136, 4.162168, 1, 0, 0, 1, 1,
0.3007536, 0.1923567, 1.095328, 1, 0, 0, 1, 1,
0.3008461, 0.642366, 2.324479, 0, 0, 0, 1, 1,
0.3052341, 0.4764915, 0.5907121, 0, 0, 0, 1, 1,
0.3085406, 0.4667959, 2.444631, 0, 0, 0, 1, 1,
0.3108959, 1.580203, -0.2612095, 0, 0, 0, 1, 1,
0.3165189, -0.01682822, 0.6502242, 0, 0, 0, 1, 1,
0.3253894, -0.68514, 3.202522, 0, 0, 0, 1, 1,
0.3264515, -0.6374321, 3.273296, 0, 0, 0, 1, 1,
0.3283736, -0.1701577, 1.682511, 1, 1, 1, 1, 1,
0.3284853, 1.34557, -0.8533666, 1, 1, 1, 1, 1,
0.3289172, 0.03698024, 0.2033175, 1, 1, 1, 1, 1,
0.329296, 0.7314283, -1.484755, 1, 1, 1, 1, 1,
0.3309728, 0.9305273, 0.5987418, 1, 1, 1, 1, 1,
0.3316244, 0.05332608, 1.741081, 1, 1, 1, 1, 1,
0.3347539, -0.8367572, 5.370909, 1, 1, 1, 1, 1,
0.3353885, 0.6978781, 0.4223899, 1, 1, 1, 1, 1,
0.3390117, 0.03488552, 2.109301, 1, 1, 1, 1, 1,
0.342533, 0.1363815, 0.6540051, 1, 1, 1, 1, 1,
0.3437727, -1.54493, 2.923437, 1, 1, 1, 1, 1,
0.3455799, 0.6550399, 1.651399, 1, 1, 1, 1, 1,
0.3471395, -0.8188444, 4.291647, 1, 1, 1, 1, 1,
0.3473413, -0.7984289, 2.310017, 1, 1, 1, 1, 1,
0.3487422, -1.822747, 2.241093, 1, 1, 1, 1, 1,
0.3493567, -1.81345, 1.283426, 0, 0, 1, 1, 1,
0.3520224, 0.08196942, 1.43465, 1, 0, 0, 1, 1,
0.3561732, -0.4138428, 1.411651, 1, 0, 0, 1, 1,
0.3564721, -0.7939343, 2.679784, 1, 0, 0, 1, 1,
0.3572042, -1.216587, 2.847623, 1, 0, 0, 1, 1,
0.362589, 1.12371, 0.5721051, 1, 0, 0, 1, 1,
0.3646206, 1.192773, 1.782774, 0, 0, 0, 1, 1,
0.3646894, -0.8928146, 3.503817, 0, 0, 0, 1, 1,
0.3727848, 1.407169, 1.464976, 0, 0, 0, 1, 1,
0.372895, 1.583991, 1.990845, 0, 0, 0, 1, 1,
0.3747732, -0.8146962, 3.752073, 0, 0, 0, 1, 1,
0.3767054, -0.4169024, 2.016947, 0, 0, 0, 1, 1,
0.3800713, -1.689348, 2.807457, 0, 0, 0, 1, 1,
0.3825302, -0.2643749, 3.421144, 1, 1, 1, 1, 1,
0.3850729, -0.3841137, 3.221549, 1, 1, 1, 1, 1,
0.3858618, -1.378203, 3.079586, 1, 1, 1, 1, 1,
0.3878485, 0.04868403, 0.2158308, 1, 1, 1, 1, 1,
0.3939766, -1.250994, 1.2368, 1, 1, 1, 1, 1,
0.3967693, -0.9142903, 2.17487, 1, 1, 1, 1, 1,
0.3976827, 0.02398083, -0.3228302, 1, 1, 1, 1, 1,
0.3998729, -1.371085, 2.785941, 1, 1, 1, 1, 1,
0.4003489, 0.9174144, 0.6191378, 1, 1, 1, 1, 1,
0.4046958, 0.4924358, -0.1253172, 1, 1, 1, 1, 1,
0.4065402, -0.4663195, 1.236122, 1, 1, 1, 1, 1,
0.4070682, 0.3753006, 1.753089, 1, 1, 1, 1, 1,
0.4099286, -0.1581592, 3.003217, 1, 1, 1, 1, 1,
0.410676, -0.9023536, 3.2314, 1, 1, 1, 1, 1,
0.411584, -0.4444151, 3.058419, 1, 1, 1, 1, 1,
0.4143515, -1.605087, 2.456801, 0, 0, 1, 1, 1,
0.4152696, 1.089325, -0.04428332, 1, 0, 0, 1, 1,
0.4233717, 0.05667847, 1.43788, 1, 0, 0, 1, 1,
0.429863, -1.88771, 2.46223, 1, 0, 0, 1, 1,
0.4411126, 0.9097059, 0.1433553, 1, 0, 0, 1, 1,
0.4469331, 0.02933002, 2.157619, 1, 0, 0, 1, 1,
0.4484421, 1.716788, 0.3048079, 0, 0, 0, 1, 1,
0.4488686, -0.7224464, 2.415218, 0, 0, 0, 1, 1,
0.4521311, 1.063895, -0.6439998, 0, 0, 0, 1, 1,
0.4570622, 0.05445296, 2.273669, 0, 0, 0, 1, 1,
0.4584387, -0.3115095, 0.6051093, 0, 0, 0, 1, 1,
0.4683431, 0.5671592, -0.7618037, 0, 0, 0, 1, 1,
0.4691097, -0.2639499, 3.132432, 0, 0, 0, 1, 1,
0.4708869, 0.8677208, -0.2669885, 1, 1, 1, 1, 1,
0.4739725, -0.4449752, 1.865136, 1, 1, 1, 1, 1,
0.4773569, 2.030651, -0.8902346, 1, 1, 1, 1, 1,
0.4774326, 0.7571325, 3.183943, 1, 1, 1, 1, 1,
0.4775009, 1.623524, 2.125317, 1, 1, 1, 1, 1,
0.4804385, 0.1468992, -1.081958, 1, 1, 1, 1, 1,
0.481997, -1.012858, 4.146198, 1, 1, 1, 1, 1,
0.48209, 0.1177501, 1.809133, 1, 1, 1, 1, 1,
0.48841, -1.885386, 2.449771, 1, 1, 1, 1, 1,
0.49433, -0.9206061, 4.340171, 1, 1, 1, 1, 1,
0.5114526, -1.640275, 3.132543, 1, 1, 1, 1, 1,
0.511979, 1.020615, 1.021151, 1, 1, 1, 1, 1,
0.5133427, 0.002840916, 1.393674, 1, 1, 1, 1, 1,
0.5168468, -0.1430176, 1.576664, 1, 1, 1, 1, 1,
0.5210522, -1.523403, 2.525951, 1, 1, 1, 1, 1,
0.5265958, 0.2714455, 1.591907, 0, 0, 1, 1, 1,
0.5321429, 0.1460822, 0.248006, 1, 0, 0, 1, 1,
0.5338345, 0.772383, 0.7579662, 1, 0, 0, 1, 1,
0.5344182, -0.731392, 2.740985, 1, 0, 0, 1, 1,
0.5380036, -1.265753, 4.984212, 1, 0, 0, 1, 1,
0.5381881, 1.359109, -1.083831, 1, 0, 0, 1, 1,
0.5390168, 0.1025355, 1.036789, 0, 0, 0, 1, 1,
0.5401142, -0.0245221, 1.725998, 0, 0, 0, 1, 1,
0.5538056, -0.2189921, 3.755975, 0, 0, 0, 1, 1,
0.5569442, 0.03783745, 1.464406, 0, 0, 0, 1, 1,
0.5574198, 0.9513097, 0.3836192, 0, 0, 0, 1, 1,
0.5576898, 0.09814771, 1.873114, 0, 0, 0, 1, 1,
0.5589929, 0.7352766, 0.1628233, 0, 0, 0, 1, 1,
0.5602991, 0.6690345, 0.8070368, 1, 1, 1, 1, 1,
0.5611205, -0.3287543, 1.7999, 1, 1, 1, 1, 1,
0.5654224, -0.1184817, 1.040771, 1, 1, 1, 1, 1,
0.5673121, -0.09033351, 1.731782, 1, 1, 1, 1, 1,
0.5687889, 0.3922561, 0.2997409, 1, 1, 1, 1, 1,
0.5729681, 0.1477248, 2.202258, 1, 1, 1, 1, 1,
0.5738759, 1.286683, 2.176838, 1, 1, 1, 1, 1,
0.5782932, 1.234265, 0.07910194, 1, 1, 1, 1, 1,
0.5807634, -0.3758582, 2.757743, 1, 1, 1, 1, 1,
0.5843655, -0.28907, 2.913563, 1, 1, 1, 1, 1,
0.5870686, -1.206843, 2.552073, 1, 1, 1, 1, 1,
0.5885888, -0.9475172, 4.976433, 1, 1, 1, 1, 1,
0.591905, 0.8002572, 0.504249, 1, 1, 1, 1, 1,
0.5925565, 1.832963, -1.444343, 1, 1, 1, 1, 1,
0.5986199, 0.6859229, -0.2848816, 1, 1, 1, 1, 1,
0.6048281, -0.1396611, 2.294938, 0, 0, 1, 1, 1,
0.606353, -0.7444955, 2.117597, 1, 0, 0, 1, 1,
0.6077469, -1.590629, 1.459681, 1, 0, 0, 1, 1,
0.6106617, -0.667985, 1.866574, 1, 0, 0, 1, 1,
0.6107396, 0.4802964, 0.1484321, 1, 0, 0, 1, 1,
0.6114392, 0.1865012, 0.5057259, 1, 0, 0, 1, 1,
0.623536, -0.1842554, 1.83222, 0, 0, 0, 1, 1,
0.6249315, 0.0739803, 3.364261, 0, 0, 0, 1, 1,
0.6390477, 1.302247, -0.004161123, 0, 0, 0, 1, 1,
0.6429763, -1.646281, 4.352602, 0, 0, 0, 1, 1,
0.6436406, -0.9056937, 1.113, 0, 0, 0, 1, 1,
0.6463453, -1.144879, 3.374434, 0, 0, 0, 1, 1,
0.6488308, -1.038041, 3.301743, 0, 0, 0, 1, 1,
0.6505675, 0.245184, 0.8596085, 1, 1, 1, 1, 1,
0.6557905, 1.607656, 1.698202, 1, 1, 1, 1, 1,
0.6604652, 0.5688564, 0.5467086, 1, 1, 1, 1, 1,
0.6633921, -1.073002, 4.021889, 1, 1, 1, 1, 1,
0.6639384, 1.671765, -1.120914, 1, 1, 1, 1, 1,
0.6653345, 0.1297823, 2.033409, 1, 1, 1, 1, 1,
0.6683978, -1.731974, 1.498735, 1, 1, 1, 1, 1,
0.6723576, 0.3585601, -0.04095004, 1, 1, 1, 1, 1,
0.6746195, 1.923528, 1.57953, 1, 1, 1, 1, 1,
0.6751764, 1.014897, -0.003666713, 1, 1, 1, 1, 1,
0.676872, -1.498978, 2.428293, 1, 1, 1, 1, 1,
0.6780882, 0.9414949, -0.641554, 1, 1, 1, 1, 1,
0.6805664, -0.02481876, 0.5260894, 1, 1, 1, 1, 1,
0.6836491, 1.2987, 1.63123, 1, 1, 1, 1, 1,
0.6869488, 0.08451968, 1.515437, 1, 1, 1, 1, 1,
0.6902093, -1.258237, 2.257826, 0, 0, 1, 1, 1,
0.6931473, -0.6860064, 2.149782, 1, 0, 0, 1, 1,
0.7019585, -1.00661, 2.413762, 1, 0, 0, 1, 1,
0.7091555, -0.3724831, 2.919652, 1, 0, 0, 1, 1,
0.7102602, -1.26241, 3.059173, 1, 0, 0, 1, 1,
0.7196715, 0.4304131, -1.313245, 1, 0, 0, 1, 1,
0.7210512, 1.809429, -0.7704901, 0, 0, 0, 1, 1,
0.7226195, -0.8096077, 1.84656, 0, 0, 0, 1, 1,
0.7278439, -0.4705856, 3.11915, 0, 0, 0, 1, 1,
0.7284782, -1.423702, 1.858036, 0, 0, 0, 1, 1,
0.7285122, 0.4348738, 3.617095, 0, 0, 0, 1, 1,
0.7313782, -1.327715, 1.438142, 0, 0, 0, 1, 1,
0.7321448, -1.184586, 3.434488, 0, 0, 0, 1, 1,
0.7326455, -0.2479118, -0.01745289, 1, 1, 1, 1, 1,
0.738555, 1.079338, 1.41206, 1, 1, 1, 1, 1,
0.7428097, 2.847149, -0.0609706, 1, 1, 1, 1, 1,
0.7431037, -0.07670496, 1.144891, 1, 1, 1, 1, 1,
0.7433256, -1.17264, 4.26497, 1, 1, 1, 1, 1,
0.7435513, -0.2355229, 1.565952, 1, 1, 1, 1, 1,
0.7444766, 0.8402275, 0.9844568, 1, 1, 1, 1, 1,
0.7532785, -0.7797549, 0.2794372, 1, 1, 1, 1, 1,
0.7578276, -0.1407988, 0.02628571, 1, 1, 1, 1, 1,
0.7597202, -0.03605964, 1.027438, 1, 1, 1, 1, 1,
0.7644822, 1.24708, -0.7229294, 1, 1, 1, 1, 1,
0.7647372, -0.3782464, 2.62603, 1, 1, 1, 1, 1,
0.7648279, -0.7395696, 3.095737, 1, 1, 1, 1, 1,
0.7736681, 3.139762, 0.550377, 1, 1, 1, 1, 1,
0.7741274, 0.2967528, 3.389961, 1, 1, 1, 1, 1,
0.7752039, 0.8455924, 0.2966072, 0, 0, 1, 1, 1,
0.7770128, -2.672567, 3.596918, 1, 0, 0, 1, 1,
0.7774105, -0.73562, 1.332194, 1, 0, 0, 1, 1,
0.7858893, 0.5048545, 1.189044, 1, 0, 0, 1, 1,
0.7862946, -0.8910019, 2.400234, 1, 0, 0, 1, 1,
0.7905723, 0.4958788, -0.6765209, 1, 0, 0, 1, 1,
0.7927109, 1.042523, 1.595685, 0, 0, 0, 1, 1,
0.7954598, -1.039759, 2.326317, 0, 0, 0, 1, 1,
0.7963901, -0.2734122, 1.505476, 0, 0, 0, 1, 1,
0.8053471, 0.455763, 2.054772, 0, 0, 0, 1, 1,
0.8082052, -0.4280724, 2.057754, 0, 0, 0, 1, 1,
0.8099524, -1.441003, 2.840076, 0, 0, 0, 1, 1,
0.8103279, 0.2327919, 2.64765, 0, 0, 0, 1, 1,
0.8112406, 1.0978, 1.074975, 1, 1, 1, 1, 1,
0.8117174, -1.432117, 0.6712517, 1, 1, 1, 1, 1,
0.8143429, -0.4366235, 0.967064, 1, 1, 1, 1, 1,
0.8149298, -1.25153, 3.282724, 1, 1, 1, 1, 1,
0.8217774, -1.189865, 2.135311, 1, 1, 1, 1, 1,
0.8249859, 3.009408, 0.5665516, 1, 1, 1, 1, 1,
0.8330585, -1.226448, 1.920863, 1, 1, 1, 1, 1,
0.8335206, -1.843322, 4.203841, 1, 1, 1, 1, 1,
0.8392435, -0.7668815, 3.931261, 1, 1, 1, 1, 1,
0.8423871, -0.05747243, 2.105478, 1, 1, 1, 1, 1,
0.8510863, 1.122074, 0.07817721, 1, 1, 1, 1, 1,
0.8519592, -0.5887972, 2.538511, 1, 1, 1, 1, 1,
0.8531056, -1.572252, 3.55544, 1, 1, 1, 1, 1,
0.8534424, -0.8091332, 4.431012, 1, 1, 1, 1, 1,
0.8542971, -0.02571522, 2.453098, 1, 1, 1, 1, 1,
0.8592319, 0.4506662, 0.6455758, 0, 0, 1, 1, 1,
0.8615451, 1.6067, 0.1996716, 1, 0, 0, 1, 1,
0.8648925, 1.260332, 2.10225, 1, 0, 0, 1, 1,
0.8657242, -1.118935, 2.204896, 1, 0, 0, 1, 1,
0.8657461, -1.095011, 2.353272, 1, 0, 0, 1, 1,
0.8659957, 0.1793735, 1.621951, 1, 0, 0, 1, 1,
0.868647, 0.2475061, 0.7018335, 0, 0, 0, 1, 1,
0.8721928, -1.538347, 3.516815, 0, 0, 0, 1, 1,
0.878676, 0.4885725, 1.461826, 0, 0, 0, 1, 1,
0.8816078, 0.6076851, 2.005222, 0, 0, 0, 1, 1,
0.8875436, 1.228068, 0.2859448, 0, 0, 0, 1, 1,
0.8904905, 1.355614, -0.1758536, 0, 0, 0, 1, 1,
0.8958545, -0.775246, 1.58753, 0, 0, 0, 1, 1,
0.8977541, -1.437755, 1.9938, 1, 1, 1, 1, 1,
0.9039631, -1.15919, 2.117129, 1, 1, 1, 1, 1,
0.9065878, 0.01014328, 1.85571, 1, 1, 1, 1, 1,
0.9095342, -1.821919, 3.025819, 1, 1, 1, 1, 1,
0.91699, -0.1281834, 1.615642, 1, 1, 1, 1, 1,
0.9175746, -0.07879844, 1.155678, 1, 1, 1, 1, 1,
0.9212577, 0.2456914, -0.07355727, 1, 1, 1, 1, 1,
0.9251555, -0.5151088, 0.6654711, 1, 1, 1, 1, 1,
0.9253045, 0.4728156, 2.112933, 1, 1, 1, 1, 1,
0.9471475, 1.028656, -1.43854, 1, 1, 1, 1, 1,
0.9510792, 0.2982192, 2.314951, 1, 1, 1, 1, 1,
0.9554209, 0.2939677, -0.4841116, 1, 1, 1, 1, 1,
0.9568606, 0.2504211, -0.6086825, 1, 1, 1, 1, 1,
0.957974, 0.2415859, 1.32863, 1, 1, 1, 1, 1,
0.9616852, 0.3016426, 2.104677, 1, 1, 1, 1, 1,
0.9664999, -0.5840794, 0.1419563, 0, 0, 1, 1, 1,
0.9682001, -0.5127446, 2.57629, 1, 0, 0, 1, 1,
0.9693049, -0.5260879, 2.733028, 1, 0, 0, 1, 1,
0.9735405, 1.339864, 0.1600878, 1, 0, 0, 1, 1,
0.9785365, -0.02425537, 1.751314, 1, 0, 0, 1, 1,
0.9957187, 1.754807, -0.599467, 1, 0, 0, 1, 1,
1.010343, 0.6281314, 1.464175, 0, 0, 0, 1, 1,
1.017081, -0.2238002, 0.7040431, 0, 0, 0, 1, 1,
1.017399, -0.04482258, 0.8398917, 0, 0, 0, 1, 1,
1.017779, -0.4933365, 3.466143, 0, 0, 0, 1, 1,
1.023755, -0.1442166, 1.268399, 0, 0, 0, 1, 1,
1.027056, 0.3964514, 2.190152, 0, 0, 0, 1, 1,
1.033359, -1.641271, 2.308841, 0, 0, 0, 1, 1,
1.042823, 1.646854, -0.9874119, 1, 1, 1, 1, 1,
1.044855, 0.2949251, 1.402589, 1, 1, 1, 1, 1,
1.045947, 0.921775, 0.9119353, 1, 1, 1, 1, 1,
1.047425, -0.4848109, 1.327034, 1, 1, 1, 1, 1,
1.054968, 0.3027741, -0.2849955, 1, 1, 1, 1, 1,
1.060722, 1.072973, 1.332763, 1, 1, 1, 1, 1,
1.068355, 0.9368755, 2.472357, 1, 1, 1, 1, 1,
1.070259, -0.4544702, 0.5213776, 1, 1, 1, 1, 1,
1.072471, 0.4002799, 1.435842, 1, 1, 1, 1, 1,
1.077065, 0.2915289, 1.619377, 1, 1, 1, 1, 1,
1.090034, 1.034233, 1.678552, 1, 1, 1, 1, 1,
1.099257, 0.6075533, 1.660321, 1, 1, 1, 1, 1,
1.101108, 1.407599, 0.7667824, 1, 1, 1, 1, 1,
1.105354, 0.9470339, 1.307133, 1, 1, 1, 1, 1,
1.107056, 2.255886, 1.189753, 1, 1, 1, 1, 1,
1.1122, -1.733083, 2.625797, 0, 0, 1, 1, 1,
1.113403, 0.1178207, 2.739211, 1, 0, 0, 1, 1,
1.117285, -1.52703, 1.356469, 1, 0, 0, 1, 1,
1.128989, 0.6660538, 0.4239658, 1, 0, 0, 1, 1,
1.130289, -1.739958, 2.73158, 1, 0, 0, 1, 1,
1.132997, 0.7351457, 0.904038, 1, 0, 0, 1, 1,
1.133607, -1.706673, 3.415771, 0, 0, 0, 1, 1,
1.137699, 1.238176, 0.3131048, 0, 0, 0, 1, 1,
1.13828, 0.06199319, 2.244184, 0, 0, 0, 1, 1,
1.139076, 0.08380406, 0.3563235, 0, 0, 0, 1, 1,
1.159096, -0.1080303, 2.652458, 0, 0, 0, 1, 1,
1.167073, -0.223741, 3.847618, 0, 0, 0, 1, 1,
1.169545, 0.8842146, 0.8225884, 0, 0, 0, 1, 1,
1.173064, 0.2302528, 2.273709, 1, 1, 1, 1, 1,
1.177571, 0.37174, 0.5557533, 1, 1, 1, 1, 1,
1.178383, -0.9347286, 3.210516, 1, 1, 1, 1, 1,
1.179233, 0.9931365, -1.051334, 1, 1, 1, 1, 1,
1.180031, 1.190787, 1.051957, 1, 1, 1, 1, 1,
1.184596, -0.5626621, 3.02607, 1, 1, 1, 1, 1,
1.192559, 0.1148738, 0.2252453, 1, 1, 1, 1, 1,
1.199443, 1.232427, -0.8903463, 1, 1, 1, 1, 1,
1.200406, -0.394983, 2.140766, 1, 1, 1, 1, 1,
1.232959, 0.4845744, 1.17279, 1, 1, 1, 1, 1,
1.238032, 0.7962488, -0.03690995, 1, 1, 1, 1, 1,
1.250648, 0.7180871, 1.302678, 1, 1, 1, 1, 1,
1.251158, -0.3926613, 1.089209, 1, 1, 1, 1, 1,
1.256217, -0.7642341, 2.0306, 1, 1, 1, 1, 1,
1.261869, 1.261947, 0.9223822, 1, 1, 1, 1, 1,
1.266136, -0.9212995, 0.7503442, 0, 0, 1, 1, 1,
1.267529, -0.1830091, 1.998827, 1, 0, 0, 1, 1,
1.267604, -0.6180226, 1.270317, 1, 0, 0, 1, 1,
1.27552, 0.5430149, 0.3385877, 1, 0, 0, 1, 1,
1.290838, -0.2839775, 1.332216, 1, 0, 0, 1, 1,
1.299903, 0.869606, 0.4047302, 1, 0, 0, 1, 1,
1.309002, -1.346948, 2.86277, 0, 0, 0, 1, 1,
1.309004, 0.3778396, 1.588348, 0, 0, 0, 1, 1,
1.312361, 0.5058521, 1.780042, 0, 0, 0, 1, 1,
1.312579, -1.3208, 1.808082, 0, 0, 0, 1, 1,
1.312822, -1.881004, 3.213198, 0, 0, 0, 1, 1,
1.313213, -0.7718223, 0.9693093, 0, 0, 0, 1, 1,
1.319221, 0.3535505, 1.426108, 0, 0, 0, 1, 1,
1.319275, 0.6265997, 1.494993, 1, 1, 1, 1, 1,
1.321385, -0.744033, 1.444365, 1, 1, 1, 1, 1,
1.327768, -0.513073, 2.095812, 1, 1, 1, 1, 1,
1.335187, 0.8867282, 1.738083, 1, 1, 1, 1, 1,
1.351177, 0.895759, 2.160446, 1, 1, 1, 1, 1,
1.354902, 2.027298, 2.012076, 1, 1, 1, 1, 1,
1.355113, -0.2300728, 2.07155, 1, 1, 1, 1, 1,
1.369819, 1.339251, 0.269545, 1, 1, 1, 1, 1,
1.389708, -2.177306, 2.56905, 1, 1, 1, 1, 1,
1.400337, 0.5219368, 1.240999, 1, 1, 1, 1, 1,
1.404077, -1.329734, 2.395152, 1, 1, 1, 1, 1,
1.404101, 0.04975423, 2.272464, 1, 1, 1, 1, 1,
1.407402, 1.732416, 1.341851, 1, 1, 1, 1, 1,
1.427916, -0.8817658, 1.356269, 1, 1, 1, 1, 1,
1.42815, -1.941791, 4.71383, 1, 1, 1, 1, 1,
1.429258, -1.617172, 1.317302, 0, 0, 1, 1, 1,
1.460272, 0.3573793, 1.357113, 1, 0, 0, 1, 1,
1.473425, 0.4482553, 2.638642, 1, 0, 0, 1, 1,
1.474158, 0.3083929, 0.8910112, 1, 0, 0, 1, 1,
1.485447, 0.7280912, 1.442325, 1, 0, 0, 1, 1,
1.490523, -0.1495806, 1.037099, 1, 0, 0, 1, 1,
1.500793, 0.4041667, -0.3763551, 0, 0, 0, 1, 1,
1.500845, 1.4268, 0.4601467, 0, 0, 0, 1, 1,
1.511747, 1.934812, 1.924263, 0, 0, 0, 1, 1,
1.528308, -0.7934334, 3.240225, 0, 0, 0, 1, 1,
1.539171, 0.8781927, 2.586236, 0, 0, 0, 1, 1,
1.543036, 1.51367, 0.9663677, 0, 0, 0, 1, 1,
1.554817, 0.8487889, 0.1070519, 0, 0, 0, 1, 1,
1.5628, -0.1561032, 2.036157, 1, 1, 1, 1, 1,
1.577304, 0.7847969, 1.336034, 1, 1, 1, 1, 1,
1.579681, -1.270566, -0.2558478, 1, 1, 1, 1, 1,
1.58018, 0.8576182, 1.214145, 1, 1, 1, 1, 1,
1.594707, -0.3285174, 0.3479865, 1, 1, 1, 1, 1,
1.594872, -0.7295123, 1.605346, 1, 1, 1, 1, 1,
1.598281, 1.050036, -0.6210772, 1, 1, 1, 1, 1,
1.60146, -0.9010534, 1.917146, 1, 1, 1, 1, 1,
1.608229, 0.3458355, 1.24116, 1, 1, 1, 1, 1,
1.612329, 0.5914829, -0.04687671, 1, 1, 1, 1, 1,
1.619607, 1.86061, -0.2900071, 1, 1, 1, 1, 1,
1.622843, -0.9998049, 2.09617, 1, 1, 1, 1, 1,
1.629406, -1.579976, 4.135748, 1, 1, 1, 1, 1,
1.649043, 0.5306785, 0.948763, 1, 1, 1, 1, 1,
1.66837, 1.087988, -0.3594685, 1, 1, 1, 1, 1,
1.677878, 1.19882, 1.669756, 0, 0, 1, 1, 1,
1.685757, -1.364063, 2.398412, 1, 0, 0, 1, 1,
1.688689, -1.400114, 3.627875, 1, 0, 0, 1, 1,
1.690961, -0.9308995, 2.126188, 1, 0, 0, 1, 1,
1.702583, 0.9577082, -0.006688209, 1, 0, 0, 1, 1,
1.706035, -0.1961107, 1.5466, 1, 0, 0, 1, 1,
1.711156, -0.7606379, 1.260366, 0, 0, 0, 1, 1,
1.717016, -0.232391, 2.742867, 0, 0, 0, 1, 1,
1.717587, 0.1191878, 1.080898, 0, 0, 0, 1, 1,
1.742536, 1.155553, 1.085779, 0, 0, 0, 1, 1,
1.788815, 0.5316716, 1.535515, 0, 0, 0, 1, 1,
1.791614, -1.008939, 1.990347, 0, 0, 0, 1, 1,
1.795506, 1.088085, 0.9836989, 0, 0, 0, 1, 1,
1.817214, 0.4912302, 0.1132814, 1, 1, 1, 1, 1,
1.826244, -0.5744566, 3.209201, 1, 1, 1, 1, 1,
1.836112, 0.8319889, 3.439811, 1, 1, 1, 1, 1,
1.846979, 1.550881, 0.2618189, 1, 1, 1, 1, 1,
1.883937, -0.04916698, 2.325005, 1, 1, 1, 1, 1,
1.900366, -2.308347, 3.739875, 1, 1, 1, 1, 1,
1.938107, 0.903913, 1.642563, 1, 1, 1, 1, 1,
1.941528, 0.8208749, 2.621396, 1, 1, 1, 1, 1,
1.948432, 1.112876, 1.927434, 1, 1, 1, 1, 1,
1.955424, -0.3577691, 2.138856, 1, 1, 1, 1, 1,
1.964762, -1.548393, 2.547204, 1, 1, 1, 1, 1,
1.967599, -1.990328, 0.9719619, 1, 1, 1, 1, 1,
1.970964, -0.2013373, 1.396445, 1, 1, 1, 1, 1,
1.980458, 0.5167052, 1.44918, 1, 1, 1, 1, 1,
2.046178, -0.2602116, 1.686708, 1, 1, 1, 1, 1,
2.04647, 0.7312192, 1.604491, 0, 0, 1, 1, 1,
2.083444, -1.110005, 3.584457, 1, 0, 0, 1, 1,
2.085986, -0.8152105, 2.600687, 1, 0, 0, 1, 1,
2.08933, 0.1652508, -0.7679823, 1, 0, 0, 1, 1,
2.156439, 1.698956, 1.653864, 1, 0, 0, 1, 1,
2.163868, 1.64386, 1.005436, 1, 0, 0, 1, 1,
2.238477, 0.4778785, 0.4055799, 0, 0, 0, 1, 1,
2.245078, 0.4512823, 0.2006588, 0, 0, 0, 1, 1,
2.302845, 0.8995088, 1.796545, 0, 0, 0, 1, 1,
2.515184, -0.7002169, 3.064376, 0, 0, 0, 1, 1,
2.537921, -0.6564301, 0.4904025, 0, 0, 0, 1, 1,
2.548904, 1.945147, 0.7397944, 0, 0, 0, 1, 1,
2.625987, 0.7633737, 0.5767081, 0, 0, 0, 1, 1,
2.637182, 1.807936, 0.5089096, 1, 1, 1, 1, 1,
2.707146, 0.09175072, 2.87113, 1, 1, 1, 1, 1,
2.725222, 0.179316, 1.522704, 1, 1, 1, 1, 1,
2.940923, 1.577478, 1.679856, 1, 1, 1, 1, 1,
3.122406, -0.2361011, 0.6656605, 1, 1, 1, 1, 1,
3.412448, -0.4384995, 1.823183, 1, 1, 1, 1, 1,
3.498172, 0.95883, 0.9691933, 1, 1, 1, 1, 1
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
var radius = 10.10254;
var distance = 35.48473;
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
mvMatrix.translate( -0.04433441, -0.03006744, -0.1794531 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.48473);
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
