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
-4.443346, -0.01098807, -1.436194, 1, 0, 0, 1,
-3.427011, 0.004100963, -2.151479, 1, 0.007843138, 0, 1,
-2.747239, 1.001247, -1.002455, 1, 0.01176471, 0, 1,
-2.745751, -0.3363889, -2.076446, 1, 0.01960784, 0, 1,
-2.707464, -0.08419032, -2.684917, 1, 0.02352941, 0, 1,
-2.693197, -0.328682, -1.787789, 1, 0.03137255, 0, 1,
-2.387482, 0.1025552, -1.509963, 1, 0.03529412, 0, 1,
-2.387383, -1.089007, 0.1063181, 1, 0.04313726, 0, 1,
-2.295409, -1.715135, -2.452649, 1, 0.04705882, 0, 1,
-2.249228, 0.1308052, -1.048656, 1, 0.05490196, 0, 1,
-2.220218, -1.184575, -1.551619, 1, 0.05882353, 0, 1,
-2.187712, -1.327754, -2.941448, 1, 0.06666667, 0, 1,
-2.182673, 0.7792009, -1.671603, 1, 0.07058824, 0, 1,
-2.161191, 0.02139116, -0.7089172, 1, 0.07843138, 0, 1,
-2.128083, -0.6060649, -2.531453, 1, 0.08235294, 0, 1,
-2.091338, -2.497752, -3.613394, 1, 0.09019608, 0, 1,
-2.085495, 0.8840185, -1.135682, 1, 0.09411765, 0, 1,
-2.082999, 1.050442, -1.717557, 1, 0.1019608, 0, 1,
-2.076374, -0.2362829, -1.676215, 1, 0.1098039, 0, 1,
-2.066222, -0.02971476, -2.427732, 1, 0.1137255, 0, 1,
-2.008625, -1.188537, -3.225377, 1, 0.1215686, 0, 1,
-1.978303, 0.7815243, -0.6589919, 1, 0.1254902, 0, 1,
-1.963575, -1.25625, -0.5712829, 1, 0.1333333, 0, 1,
-1.941818, -0.355886, -2.810165, 1, 0.1372549, 0, 1,
-1.934463, 0.5508516, -2.571087, 1, 0.145098, 0, 1,
-1.931395, 0.7902245, -0.1897982, 1, 0.1490196, 0, 1,
-1.927988, 0.5779018, -0.5246953, 1, 0.1568628, 0, 1,
-1.919949, 1.469354, -0.7865188, 1, 0.1607843, 0, 1,
-1.884697, -0.7048746, -2.450678, 1, 0.1686275, 0, 1,
-1.867752, 0.9158245, -1.169214, 1, 0.172549, 0, 1,
-1.832254, -2.073303, -3.454813, 1, 0.1803922, 0, 1,
-1.812714, -0.7882865, -2.311733, 1, 0.1843137, 0, 1,
-1.808568, 0.1913942, -0.8113448, 1, 0.1921569, 0, 1,
-1.807709, 1.100927, -0.3577235, 1, 0.1960784, 0, 1,
-1.799283, -0.1360045, -1.435811, 1, 0.2039216, 0, 1,
-1.796159, -1.540342, -1.004237, 1, 0.2117647, 0, 1,
-1.792992, 0.01850825, -3.313948, 1, 0.2156863, 0, 1,
-1.772754, -0.7372603, -1.915983, 1, 0.2235294, 0, 1,
-1.768299, -0.2334967, -2.395081, 1, 0.227451, 0, 1,
-1.766162, -0.2784376, -3.042733, 1, 0.2352941, 0, 1,
-1.757515, 1.006637, -1.879332, 1, 0.2392157, 0, 1,
-1.752626, 0.9166313, -1.622638, 1, 0.2470588, 0, 1,
-1.748886, -0.01605198, -1.184415, 1, 0.2509804, 0, 1,
-1.742765, 0.02822643, -4.132539, 1, 0.2588235, 0, 1,
-1.724781, -0.9038318, -1.796284, 1, 0.2627451, 0, 1,
-1.718701, 0.2512865, -0.9600524, 1, 0.2705882, 0, 1,
-1.718507, 0.4986076, -2.030754, 1, 0.2745098, 0, 1,
-1.700447, 0.542048, -1.163087, 1, 0.282353, 0, 1,
-1.648037, -1.565, -3.123298, 1, 0.2862745, 0, 1,
-1.640527, 0.2802271, -2.492922, 1, 0.2941177, 0, 1,
-1.624126, -1.10837, -1.08164, 1, 0.3019608, 0, 1,
-1.604627, -1.106052, -3.333909, 1, 0.3058824, 0, 1,
-1.600218, -0.4168859, -2.696466, 1, 0.3137255, 0, 1,
-1.59338, -0.9728047, -3.143412, 1, 0.3176471, 0, 1,
-1.592394, -0.6925858, -2.114344, 1, 0.3254902, 0, 1,
-1.578081, -0.3510707, -1.379595, 1, 0.3294118, 0, 1,
-1.572572, -0.5773915, -0.6795815, 1, 0.3372549, 0, 1,
-1.562838, 0.4910776, -0.475361, 1, 0.3411765, 0, 1,
-1.558043, 0.05539821, -0.9906761, 1, 0.3490196, 0, 1,
-1.555998, -1.309217, -3.029677, 1, 0.3529412, 0, 1,
-1.550446, 1.031299, -2.510692, 1, 0.3607843, 0, 1,
-1.541746, 0.1477797, -0.4139546, 1, 0.3647059, 0, 1,
-1.537828, -0.2725792, -1.429909, 1, 0.372549, 0, 1,
-1.535447, 0.3409458, -0.6750817, 1, 0.3764706, 0, 1,
-1.5221, 0.2445986, -0.2317155, 1, 0.3843137, 0, 1,
-1.519711, -1.22297, -0.6135731, 1, 0.3882353, 0, 1,
-1.519319, 1.146075, -0.6356256, 1, 0.3960784, 0, 1,
-1.505553, -0.8808175, -1.905379, 1, 0.4039216, 0, 1,
-1.479387, 0.7980868, -0.6244273, 1, 0.4078431, 0, 1,
-1.477352, -0.7606866, -2.025665, 1, 0.4156863, 0, 1,
-1.468874, -0.7955588, -1.484487, 1, 0.4196078, 0, 1,
-1.462556, 0.2762748, -1.851778, 1, 0.427451, 0, 1,
-1.447975, -0.5534247, -1.231597, 1, 0.4313726, 0, 1,
-1.446864, 0.0135665, -2.81849, 1, 0.4392157, 0, 1,
-1.431176, -0.4167252, -1.982168, 1, 0.4431373, 0, 1,
-1.400672, -0.4020541, -1.141896, 1, 0.4509804, 0, 1,
-1.389075, 1.286444, -1.153669, 1, 0.454902, 0, 1,
-1.38467, 0.3372806, -1.242971, 1, 0.4627451, 0, 1,
-1.384453, -0.7125519, -1.602447, 1, 0.4666667, 0, 1,
-1.381727, 1.829031, -1.637166, 1, 0.4745098, 0, 1,
-1.366049, 0.3772856, -2.399973, 1, 0.4784314, 0, 1,
-1.358491, 1.340561, -0.5562028, 1, 0.4862745, 0, 1,
-1.333493, -1.430929, -3.107642, 1, 0.4901961, 0, 1,
-1.321457, 0.4298112, -1.530028, 1, 0.4980392, 0, 1,
-1.314103, 0.7801427, -2.673072, 1, 0.5058824, 0, 1,
-1.310909, 0.9505972, -0.4435973, 1, 0.509804, 0, 1,
-1.308209, 0.4899773, -2.904954, 1, 0.5176471, 0, 1,
-1.308063, -0.5813679, -1.560986, 1, 0.5215687, 0, 1,
-1.308052, 0.6674796, -0.905132, 1, 0.5294118, 0, 1,
-1.300998, 0.7255591, 0.9085501, 1, 0.5333334, 0, 1,
-1.299025, -1.06881, -5.379216, 1, 0.5411765, 0, 1,
-1.296723, -1.042478, -1.95277, 1, 0.5450981, 0, 1,
-1.296578, -0.3096518, -0.9524341, 1, 0.5529412, 0, 1,
-1.286544, 0.7598946, -0.4782838, 1, 0.5568628, 0, 1,
-1.286254, -0.5157633, -2.87659, 1, 0.5647059, 0, 1,
-1.27986, 0.6934683, -0.7599167, 1, 0.5686275, 0, 1,
-1.276879, 0.08010075, -0.9869116, 1, 0.5764706, 0, 1,
-1.271943, -0.05077183, -0.6364696, 1, 0.5803922, 0, 1,
-1.271001, -1.077536, -1.221982, 1, 0.5882353, 0, 1,
-1.267826, -0.08736679, -2.019141, 1, 0.5921569, 0, 1,
-1.259028, 0.1322475, -0.527732, 1, 0.6, 0, 1,
-1.255855, -2.163213, -1.807628, 1, 0.6078432, 0, 1,
-1.245706, 0.06087021, -1.135564, 1, 0.6117647, 0, 1,
-1.245592, -0.1419208, -2.540437, 1, 0.6196079, 0, 1,
-1.243589, -0.7264874, -0.009255524, 1, 0.6235294, 0, 1,
-1.236212, 0.174999, -1.891354, 1, 0.6313726, 0, 1,
-1.233424, -0.2729422, -1.080635, 1, 0.6352941, 0, 1,
-1.229134, -1.36988, -2.319402, 1, 0.6431373, 0, 1,
-1.21907, 0.1224224, -0.3238402, 1, 0.6470588, 0, 1,
-1.214452, -0.5041763, -1.782153, 1, 0.654902, 0, 1,
-1.209356, -1.113603, -0.2927073, 1, 0.6588235, 0, 1,
-1.206684, -1.155653, -0.7319785, 1, 0.6666667, 0, 1,
-1.197213, -0.787519, -0.9111627, 1, 0.6705883, 0, 1,
-1.194768, -0.7153742, -0.6268542, 1, 0.6784314, 0, 1,
-1.194016, -0.5234631, -2.714256, 1, 0.682353, 0, 1,
-1.183508, 0.4499061, 0.1408172, 1, 0.6901961, 0, 1,
-1.180652, 0.5410311, 0.01744216, 1, 0.6941177, 0, 1,
-1.175766, -0.5684025, -1.567708, 1, 0.7019608, 0, 1,
-1.174063, -0.5536026, -3.199163, 1, 0.7098039, 0, 1,
-1.171268, -1.147397, -1.595623, 1, 0.7137255, 0, 1,
-1.170864, -0.4333853, -2.88579, 1, 0.7215686, 0, 1,
-1.16881, 0.2476766, -1.089, 1, 0.7254902, 0, 1,
-1.16424, 0.9562355, -1.672662, 1, 0.7333333, 0, 1,
-1.161274, 0.7704439, -2.199889, 1, 0.7372549, 0, 1,
-1.150547, -1.04432, -2.814091, 1, 0.7450981, 0, 1,
-1.133931, -0.5570914, -1.739729, 1, 0.7490196, 0, 1,
-1.132065, 0.2027546, -1.803433, 1, 0.7568628, 0, 1,
-1.124983, 2.004499, -0.3491743, 1, 0.7607843, 0, 1,
-1.123821, -1.204865, -2.549595, 1, 0.7686275, 0, 1,
-1.121595, -0.379118, 0.2357316, 1, 0.772549, 0, 1,
-1.110552, -0.06134463, 0.5128543, 1, 0.7803922, 0, 1,
-1.108471, 0.6593122, -1.67144, 1, 0.7843137, 0, 1,
-1.106536, 0.2940607, -2.553756, 1, 0.7921569, 0, 1,
-1.106356, 0.09951771, -0.9020172, 1, 0.7960784, 0, 1,
-1.095663, 1.339435, -0.5543377, 1, 0.8039216, 0, 1,
-1.094534, -1.821086, -2.156133, 1, 0.8117647, 0, 1,
-1.088464, 0.1261237, -2.182614, 1, 0.8156863, 0, 1,
-1.08525, -0.7880668, -1.691613, 1, 0.8235294, 0, 1,
-1.083757, -0.7194151, -2.740317, 1, 0.827451, 0, 1,
-1.075784, 1.196487, -1.005198, 1, 0.8352941, 0, 1,
-1.071669, 0.2538231, -1.381801, 1, 0.8392157, 0, 1,
-1.060342, -2.221697, -2.613331, 1, 0.8470588, 0, 1,
-1.054934, 0.1615181, 0.3722239, 1, 0.8509804, 0, 1,
-1.051212, 0.1228776, -1.797454, 1, 0.8588235, 0, 1,
-1.036532, -1.064487, -4.437876, 1, 0.8627451, 0, 1,
-1.035566, -0.150708, -3.998277, 1, 0.8705882, 0, 1,
-1.03176, -1.286629, -2.659803, 1, 0.8745098, 0, 1,
-1.027297, -0.7094268, -3.377165, 1, 0.8823529, 0, 1,
-1.022432, 1.151549, -0.03473141, 1, 0.8862745, 0, 1,
-1.021629, 1.965916, 0.8934045, 1, 0.8941177, 0, 1,
-1.018621, 0.2031375, -0.7588519, 1, 0.8980392, 0, 1,
-1.013191, -0.3590441, -0.8925055, 1, 0.9058824, 0, 1,
-1.007707, 1.482539, 1.128587, 1, 0.9137255, 0, 1,
-1.004012, -0.02117007, 0.1137732, 1, 0.9176471, 0, 1,
-0.9974523, -1.337731, -1.649131, 1, 0.9254902, 0, 1,
-0.9972743, 0.7307232, -1.250171, 1, 0.9294118, 0, 1,
-0.9955379, -1.369254, -2.264385, 1, 0.9372549, 0, 1,
-0.9953955, 2.082295, -1.618904, 1, 0.9411765, 0, 1,
-0.9938173, 1.013653, -0.07768597, 1, 0.9490196, 0, 1,
-0.9894848, -0.4744625, -0.7416754, 1, 0.9529412, 0, 1,
-0.9893823, 1.272601, -0.5034684, 1, 0.9607843, 0, 1,
-0.9863291, 0.7535689, 0.5624121, 1, 0.9647059, 0, 1,
-0.9858316, -1.6528, -2.900695, 1, 0.972549, 0, 1,
-0.9811227, 0.9521978, -0.3605815, 1, 0.9764706, 0, 1,
-0.9766564, 0.9917386, -1.680803, 1, 0.9843137, 0, 1,
-0.9689503, 1.035215, -2.260731, 1, 0.9882353, 0, 1,
-0.9518752, 0.003214641, -3.376056, 1, 0.9960784, 0, 1,
-0.9495314, -0.3609587, -2.577892, 0.9960784, 1, 0, 1,
-0.9425393, 1.409028, 1.058172, 0.9921569, 1, 0, 1,
-0.9383624, -0.9270407, -0.9052736, 0.9843137, 1, 0, 1,
-0.9344965, 0.2052314, -0.3747872, 0.9803922, 1, 0, 1,
-0.9344639, 0.2645427, -1.980517, 0.972549, 1, 0, 1,
-0.9316812, 0.6361727, 0.7946621, 0.9686275, 1, 0, 1,
-0.929832, 1.272616, -1.999822, 0.9607843, 1, 0, 1,
-0.9185487, -1.995194, -1.590846, 0.9568627, 1, 0, 1,
-0.9178769, 0.2517619, -1.823581, 0.9490196, 1, 0, 1,
-0.9178108, -1.681126, -2.325815, 0.945098, 1, 0, 1,
-0.9148165, 0.8097857, -0.08727553, 0.9372549, 1, 0, 1,
-0.9099671, -1.641034, -2.421002, 0.9333333, 1, 0, 1,
-0.9061617, 1.386711, 0.4003255, 0.9254902, 1, 0, 1,
-0.9060768, 2.028874, -0.5910499, 0.9215686, 1, 0, 1,
-0.9049484, 0.4678097, -1.884521, 0.9137255, 1, 0, 1,
-0.8939919, -0.4067338, -2.471204, 0.9098039, 1, 0, 1,
-0.8870445, 0.04307494, -2.847333, 0.9019608, 1, 0, 1,
-0.8846502, 1.161244, -1.022631, 0.8941177, 1, 0, 1,
-0.8814593, -0.2486277, 0.008983854, 0.8901961, 1, 0, 1,
-0.881358, 0.9134324, -2.223548, 0.8823529, 1, 0, 1,
-0.880457, 0.3368011, 0.3369201, 0.8784314, 1, 0, 1,
-0.8798724, -0.1434199, -0.2921517, 0.8705882, 1, 0, 1,
-0.8787667, 0.6660023, -0.8882039, 0.8666667, 1, 0, 1,
-0.8769172, 0.6093638, -1.833856, 0.8588235, 1, 0, 1,
-0.8616295, -2.471649, -3.325111, 0.854902, 1, 0, 1,
-0.8571522, -1.946194, -1.877471, 0.8470588, 1, 0, 1,
-0.8569694, -0.5711851, -2.269946, 0.8431373, 1, 0, 1,
-0.855079, -1.506072, -3.680411, 0.8352941, 1, 0, 1,
-0.8543653, 0.7662964, -0.7154941, 0.8313726, 1, 0, 1,
-0.853108, 1.000187, -0.2114839, 0.8235294, 1, 0, 1,
-0.8529248, 0.9096686, -1.156709, 0.8196079, 1, 0, 1,
-0.8491496, -0.1168672, -4.191466, 0.8117647, 1, 0, 1,
-0.8480542, -0.414264, -1.63806, 0.8078431, 1, 0, 1,
-0.843928, 0.5342413, -2.896811, 0.8, 1, 0, 1,
-0.8424672, -0.1069679, -2.487051, 0.7921569, 1, 0, 1,
-0.839975, 1.468597, -0.8871823, 0.7882353, 1, 0, 1,
-0.8382904, 0.1349486, -1.970954, 0.7803922, 1, 0, 1,
-0.8355974, -0.02045154, -1.773997, 0.7764706, 1, 0, 1,
-0.8313918, -0.4682485, -2.627284, 0.7686275, 1, 0, 1,
-0.828761, 0.1421827, -2.114023, 0.7647059, 1, 0, 1,
-0.8278989, 0.5180334, -1.849961, 0.7568628, 1, 0, 1,
-0.8259097, -1.532765, -0.7398639, 0.7529412, 1, 0, 1,
-0.825824, -1.306133, -1.641905, 0.7450981, 1, 0, 1,
-0.8238121, -1.527915, -2.975764, 0.7411765, 1, 0, 1,
-0.8180804, -0.3880693, -1.539408, 0.7333333, 1, 0, 1,
-0.817586, -0.4306921, -3.171106, 0.7294118, 1, 0, 1,
-0.8159878, -0.9134078, -2.417598, 0.7215686, 1, 0, 1,
-0.8095399, 0.5506949, -0.5462721, 0.7176471, 1, 0, 1,
-0.8088644, -0.3045702, -2.303939, 0.7098039, 1, 0, 1,
-0.8086467, 0.7465001, -1.002671, 0.7058824, 1, 0, 1,
-0.8007522, 2.717051, 0.533747, 0.6980392, 1, 0, 1,
-0.797889, -1.010154, -2.452989, 0.6901961, 1, 0, 1,
-0.7881054, -1.12689, -3.233124, 0.6862745, 1, 0, 1,
-0.7844886, 0.06839707, 0.1516361, 0.6784314, 1, 0, 1,
-0.7813046, 1.396847, 0.008614577, 0.6745098, 1, 0, 1,
-0.7774913, -0.03236142, -0.8471988, 0.6666667, 1, 0, 1,
-0.7591164, 0.6217589, 1.342179, 0.6627451, 1, 0, 1,
-0.7560226, 2.665653, -0.5031751, 0.654902, 1, 0, 1,
-0.7555947, 1.281421, -2.330791, 0.6509804, 1, 0, 1,
-0.7548691, -0.7367395, -2.620368, 0.6431373, 1, 0, 1,
-0.7541558, -0.2524683, -3.188315, 0.6392157, 1, 0, 1,
-0.7518787, 1.088598, 0.1435838, 0.6313726, 1, 0, 1,
-0.7479399, -0.2362629, -2.179481, 0.627451, 1, 0, 1,
-0.7420429, -0.844394, -3.732716, 0.6196079, 1, 0, 1,
-0.7414917, -1.207793, -1.684083, 0.6156863, 1, 0, 1,
-0.7364559, -1.426916, -1.779488, 0.6078432, 1, 0, 1,
-0.7360513, 1.539811, -0.09577876, 0.6039216, 1, 0, 1,
-0.732358, -0.5577701, -2.188328, 0.5960785, 1, 0, 1,
-0.7288515, 0.1821841, -1.676101, 0.5882353, 1, 0, 1,
-0.7265559, -0.1620683, -2.813184, 0.5843138, 1, 0, 1,
-0.7227576, -1.201869, -3.518487, 0.5764706, 1, 0, 1,
-0.7214638, -0.4180075, -1.265403, 0.572549, 1, 0, 1,
-0.7122361, -1.970256, -0.9187837, 0.5647059, 1, 0, 1,
-0.6765897, 0.76749, 1.039143, 0.5607843, 1, 0, 1,
-0.6633844, -0.2763189, -1.634063, 0.5529412, 1, 0, 1,
-0.6587568, 0.4032289, -1.866864, 0.5490196, 1, 0, 1,
-0.6565326, 0.2667529, -3.362415, 0.5411765, 1, 0, 1,
-0.653881, 0.6903428, 1.053439, 0.5372549, 1, 0, 1,
-0.6532648, 0.3496441, -2.056482, 0.5294118, 1, 0, 1,
-0.6525698, 0.8808633, -1.57121, 0.5254902, 1, 0, 1,
-0.6516438, -1.618087, -3.444221, 0.5176471, 1, 0, 1,
-0.6511713, -0.06632135, -1.205301, 0.5137255, 1, 0, 1,
-0.6467216, -1.113406, -1.43532, 0.5058824, 1, 0, 1,
-0.6467062, -1.516386, -1.516917, 0.5019608, 1, 0, 1,
-0.642058, -2.2934, -2.551842, 0.4941176, 1, 0, 1,
-0.6398114, -0.4855779, -3.474819, 0.4862745, 1, 0, 1,
-0.6391392, 2.028749, -0.357901, 0.4823529, 1, 0, 1,
-0.6369269, -0.9818646, -2.488549, 0.4745098, 1, 0, 1,
-0.6354371, 0.7886282, -2.599927, 0.4705882, 1, 0, 1,
-0.635138, 0.4285838, -3.064361, 0.4627451, 1, 0, 1,
-0.6347239, -0.3233335, -2.508361, 0.4588235, 1, 0, 1,
-0.6277565, -0.1615393, -2.177598, 0.4509804, 1, 0, 1,
-0.626182, -0.5198259, -3.958449, 0.4470588, 1, 0, 1,
-0.6255332, 1.933837, -2.718756, 0.4392157, 1, 0, 1,
-0.6244645, -1.055264, -3.617426, 0.4352941, 1, 0, 1,
-0.6170714, 0.4588037, -2.022396, 0.427451, 1, 0, 1,
-0.6089989, 1.021975, -0.4426563, 0.4235294, 1, 0, 1,
-0.6022852, 2.283034, -1.969603, 0.4156863, 1, 0, 1,
-0.5889336, -1.435237, -1.938649, 0.4117647, 1, 0, 1,
-0.5847042, 0.2959893, -0.8829917, 0.4039216, 1, 0, 1,
-0.5792341, -0.8554557, -1.269396, 0.3960784, 1, 0, 1,
-0.5704484, 1.324439, 0.2899638, 0.3921569, 1, 0, 1,
-0.5617648, -0.8939416, -3.185402, 0.3843137, 1, 0, 1,
-0.5617, -0.6331243, -2.780416, 0.3803922, 1, 0, 1,
-0.5610343, -1.07256, -2.405189, 0.372549, 1, 0, 1,
-0.5595298, -1.476145, -3.816287, 0.3686275, 1, 0, 1,
-0.5583115, 0.5346438, 0.02634077, 0.3607843, 1, 0, 1,
-0.5576424, 1.042983, -3.334421, 0.3568628, 1, 0, 1,
-0.5543817, 0.03758924, -0.6966605, 0.3490196, 1, 0, 1,
-0.5541166, -0.2670583, -2.824579, 0.345098, 1, 0, 1,
-0.547883, -0.04560212, -2.158718, 0.3372549, 1, 0, 1,
-0.5450915, -0.7876804, -1.380892, 0.3333333, 1, 0, 1,
-0.5425372, -2.98314, -4.787899, 0.3254902, 1, 0, 1,
-0.5414532, 0.7208887, 0.0294609, 0.3215686, 1, 0, 1,
-0.5410256, 1.23018, -1.403141, 0.3137255, 1, 0, 1,
-0.5404608, -0.4487333, -1.722718, 0.3098039, 1, 0, 1,
-0.5171445, -0.4217947, -2.620457, 0.3019608, 1, 0, 1,
-0.515265, 0.5262885, -1.430426, 0.2941177, 1, 0, 1,
-0.5150508, 0.4271205, -0.759593, 0.2901961, 1, 0, 1,
-0.5134633, -1.790735, -2.768834, 0.282353, 1, 0, 1,
-0.5111926, -0.1712004, -1.656052, 0.2784314, 1, 0, 1,
-0.5084473, 1.688017, 0.06927165, 0.2705882, 1, 0, 1,
-0.4982077, -0.8387138, -3.616523, 0.2666667, 1, 0, 1,
-0.497799, 1.578298, 0.3619249, 0.2588235, 1, 0, 1,
-0.4966646, 1.487227, -0.8620405, 0.254902, 1, 0, 1,
-0.4900754, -1.403518, -2.62591, 0.2470588, 1, 0, 1,
-0.4870103, -0.6868128, -4.21124, 0.2431373, 1, 0, 1,
-0.4867217, 0.6254962, -1.001367, 0.2352941, 1, 0, 1,
-0.4818464, 0.3864697, -0.2059758, 0.2313726, 1, 0, 1,
-0.4787474, -1.717749, -3.863234, 0.2235294, 1, 0, 1,
-0.4762758, -1.256112, -2.348772, 0.2196078, 1, 0, 1,
-0.475769, -0.1266403, -0.9887614, 0.2117647, 1, 0, 1,
-0.4739002, 0.3557251, -0.656233, 0.2078431, 1, 0, 1,
-0.4677262, 1.95118, 0.4220093, 0.2, 1, 0, 1,
-0.4657283, -1.318085, -4.928194, 0.1921569, 1, 0, 1,
-0.4651389, -1.095148, -2.950617, 0.1882353, 1, 0, 1,
-0.4622063, -0.5006642, -4.004513, 0.1803922, 1, 0, 1,
-0.4617344, -0.2567254, -0.9678082, 0.1764706, 1, 0, 1,
-0.457846, -1.080424, -3.158524, 0.1686275, 1, 0, 1,
-0.45442, -0.02678204, -2.356895, 0.1647059, 1, 0, 1,
-0.4541577, 0.9054766, 0.007629241, 0.1568628, 1, 0, 1,
-0.453316, -0.05080996, -1.691347, 0.1529412, 1, 0, 1,
-0.4502174, 1.837084, -0.7781946, 0.145098, 1, 0, 1,
-0.4467009, -0.167645, -0.4582067, 0.1411765, 1, 0, 1,
-0.4460174, -0.7276471, -4.303947, 0.1333333, 1, 0, 1,
-0.4369355, 0.3952468, -0.4296646, 0.1294118, 1, 0, 1,
-0.4368287, 0.5803854, -0.4511071, 0.1215686, 1, 0, 1,
-0.4358619, -1.526203, -2.58141, 0.1176471, 1, 0, 1,
-0.4334491, 0.3650448, 1.09819, 0.1098039, 1, 0, 1,
-0.431074, 0.7428033, 1.502771, 0.1058824, 1, 0, 1,
-0.4296552, 1.43363, -1.246269, 0.09803922, 1, 0, 1,
-0.4280262, -0.2534566, -4.409705, 0.09019608, 1, 0, 1,
-0.4279863, -0.661604, -1.731231, 0.08627451, 1, 0, 1,
-0.4148388, 1.153209, -0.5710562, 0.07843138, 1, 0, 1,
-0.4143892, -0.3450297, -2.912497, 0.07450981, 1, 0, 1,
-0.4129535, -1.390294, -5.747497, 0.06666667, 1, 0, 1,
-0.4121157, -1.442384, -2.28121, 0.0627451, 1, 0, 1,
-0.4095897, 0.2750769, 0.7721029, 0.05490196, 1, 0, 1,
-0.4053879, -0.8245302, -2.895864, 0.05098039, 1, 0, 1,
-0.4053773, 2.667572, -1.049025, 0.04313726, 1, 0, 1,
-0.4022032, 1.379191, -1.140592, 0.03921569, 1, 0, 1,
-0.3904808, -1.065761, -3.945452, 0.03137255, 1, 0, 1,
-0.3885292, 0.5599936, -0.1447939, 0.02745098, 1, 0, 1,
-0.3882423, 1.099034, 0.9188429, 0.01960784, 1, 0, 1,
-0.3811833, 0.2540705, -0.6423716, 0.01568628, 1, 0, 1,
-0.3790371, 1.080467, -0.7211627, 0.007843138, 1, 0, 1,
-0.3784521, 1.892346, -0.6995689, 0.003921569, 1, 0, 1,
-0.3782631, -0.1622643, -1.448455, 0, 1, 0.003921569, 1,
-0.3750091, -0.4736314, -2.42795, 0, 1, 0.01176471, 1,
-0.3747005, 0.1593815, -0.6742345, 0, 1, 0.01568628, 1,
-0.3720274, -1.588059, -2.971885, 0, 1, 0.02352941, 1,
-0.3720096, -0.4094144, -4.151077, 0, 1, 0.02745098, 1,
-0.3719826, 1.500591, -0.09773421, 0, 1, 0.03529412, 1,
-0.3719344, -0.7686072, -1.927894, 0, 1, 0.03921569, 1,
-0.3698739, -0.3949693, -3.808158, 0, 1, 0.04705882, 1,
-0.3687794, -0.8001016, -1.785608, 0, 1, 0.05098039, 1,
-0.3676577, 1.136912, -1.081422, 0, 1, 0.05882353, 1,
-0.3643835, -0.4278572, -3.300382, 0, 1, 0.0627451, 1,
-0.3613326, 0.220141, -1.40409, 0, 1, 0.07058824, 1,
-0.3506834, 1.322896, -0.792943, 0, 1, 0.07450981, 1,
-0.3500928, -0.04427681, -0.2291409, 0, 1, 0.08235294, 1,
-0.3464583, 2.111514, -0.179422, 0, 1, 0.08627451, 1,
-0.3463733, 0.1246075, -1.041286, 0, 1, 0.09411765, 1,
-0.3434863, 0.4351862, -0.7818953, 0, 1, 0.1019608, 1,
-0.3413177, -1.60095, -3.83352, 0, 1, 0.1058824, 1,
-0.3389905, -0.2584203, -1.654453, 0, 1, 0.1137255, 1,
-0.3363204, -1.783674, -3.56399, 0, 1, 0.1176471, 1,
-0.3355602, -0.173342, 1.017364, 0, 1, 0.1254902, 1,
-0.334547, 0.4602071, -1.045091, 0, 1, 0.1294118, 1,
-0.3327146, 1.549678, -0.245466, 0, 1, 0.1372549, 1,
-0.3319985, 0.7410383, -0.3645458, 0, 1, 0.1411765, 1,
-0.3267393, -0.6351343, -3.243443, 0, 1, 0.1490196, 1,
-0.3253507, 0.3914366, 0.3978715, 0, 1, 0.1529412, 1,
-0.3175943, 1.167929, -1.958929, 0, 1, 0.1607843, 1,
-0.3160071, 0.09551429, -0.6466924, 0, 1, 0.1647059, 1,
-0.3099066, 0.6847847, 1.447361, 0, 1, 0.172549, 1,
-0.3002352, 1.684282, 1.533094, 0, 1, 0.1764706, 1,
-0.2940934, -1.06497, -2.645419, 0, 1, 0.1843137, 1,
-0.2900811, -1.171408, -2.600502, 0, 1, 0.1882353, 1,
-0.28933, 0.1972044, -0.3767388, 0, 1, 0.1960784, 1,
-0.2842912, -0.09542278, -0.8802082, 0, 1, 0.2039216, 1,
-0.2840534, -1.454905, -3.073753, 0, 1, 0.2078431, 1,
-0.283807, 0.3436, -1.759175, 0, 1, 0.2156863, 1,
-0.2813196, -0.524247, -2.528595, 0, 1, 0.2196078, 1,
-0.2762462, -1.302205, -2.707074, 0, 1, 0.227451, 1,
-0.2755741, 0.2508717, -1.80039, 0, 1, 0.2313726, 1,
-0.27392, 0.126716, -0.1016448, 0, 1, 0.2392157, 1,
-0.273035, 0.7433715, -0.9577684, 0, 1, 0.2431373, 1,
-0.2713905, 0.2548452, -3.237165, 0, 1, 0.2509804, 1,
-0.2689597, -0.2733936, -1.375099, 0, 1, 0.254902, 1,
-0.2643642, 0.2684653, 0.7629171, 0, 1, 0.2627451, 1,
-0.2624129, -0.04575534, -1.566552, 0, 1, 0.2666667, 1,
-0.2590541, -1.435282, -2.731657, 0, 1, 0.2745098, 1,
-0.2585418, -0.1504046, -3.688825, 0, 1, 0.2784314, 1,
-0.2572063, 1.165096, 0.6255058, 0, 1, 0.2862745, 1,
-0.2535398, -0.3073466, -2.541442, 0, 1, 0.2901961, 1,
-0.2516343, -0.06214335, -2.774029, 0, 1, 0.2980392, 1,
-0.2449469, 1.445435, 0.1319084, 0, 1, 0.3058824, 1,
-0.2447723, -1.810207, -0.9926478, 0, 1, 0.3098039, 1,
-0.2428932, 1.541496, -0.2906453, 0, 1, 0.3176471, 1,
-0.2426361, -0.00674556, -2.807098, 0, 1, 0.3215686, 1,
-0.2402848, -0.03580366, -1.264239, 0, 1, 0.3294118, 1,
-0.235317, 1.789625, 0.09285282, 0, 1, 0.3333333, 1,
-0.2322016, -0.1790065, -1.534438, 0, 1, 0.3411765, 1,
-0.228899, -0.2461936, -3.552247, 0, 1, 0.345098, 1,
-0.2252583, -2.034264, -2.720407, 0, 1, 0.3529412, 1,
-0.2218342, -0.5620364, -2.320022, 0, 1, 0.3568628, 1,
-0.219065, 0.06266894, -1.211707, 0, 1, 0.3647059, 1,
-0.2168367, 1.776706, -0.2485911, 0, 1, 0.3686275, 1,
-0.2160921, 0.6934937, -0.2972352, 0, 1, 0.3764706, 1,
-0.2156936, -0.266874, -2.377056, 0, 1, 0.3803922, 1,
-0.2149427, 0.4740137, 0.9452359, 0, 1, 0.3882353, 1,
-0.208042, -0.2668977, -1.742003, 0, 1, 0.3921569, 1,
-0.2035699, -0.140655, -1.932468, 0, 1, 0.4, 1,
-0.2032959, 1.190123, 1.205772, 0, 1, 0.4078431, 1,
-0.200238, -0.7648934, -2.002253, 0, 1, 0.4117647, 1,
-0.1997397, 1.32325, -0.7213066, 0, 1, 0.4196078, 1,
-0.1969755, 0.5548437, -0.2378434, 0, 1, 0.4235294, 1,
-0.1951399, -0.5869179, -2.88843, 0, 1, 0.4313726, 1,
-0.1926553, 0.06283504, -2.902094, 0, 1, 0.4352941, 1,
-0.1853555, 0.4001602, -0.2797409, 0, 1, 0.4431373, 1,
-0.1841396, -1.957685, -4.655047, 0, 1, 0.4470588, 1,
-0.1830234, -0.1273513, -1.252474, 0, 1, 0.454902, 1,
-0.1829168, -1.299837, -3.419755, 0, 1, 0.4588235, 1,
-0.1771511, 0.07996968, -0.4022465, 0, 1, 0.4666667, 1,
-0.1749316, 0.267087, -0.7033437, 0, 1, 0.4705882, 1,
-0.1745637, -0.4669085, -2.663192, 0, 1, 0.4784314, 1,
-0.1717191, -1.947062, -3.333951, 0, 1, 0.4823529, 1,
-0.1705622, -0.09316063, -1.480441, 0, 1, 0.4901961, 1,
-0.1655551, -2.663581, -1.461395, 0, 1, 0.4941176, 1,
-0.1647786, 1.491757, 0.3771546, 0, 1, 0.5019608, 1,
-0.1622623, 0.5186028, 0.9785392, 0, 1, 0.509804, 1,
-0.1604273, -0.7998211, -1.484658, 0, 1, 0.5137255, 1,
-0.1592778, 1.616621, -0.3249777, 0, 1, 0.5215687, 1,
-0.1591707, -0.4990158, -2.935899, 0, 1, 0.5254902, 1,
-0.1567703, 1.809466, -0.665994, 0, 1, 0.5333334, 1,
-0.1553269, 0.2821831, 0.2221125, 0, 1, 0.5372549, 1,
-0.1540149, -0.7410353, -4.464449, 0, 1, 0.5450981, 1,
-0.1531331, 0.5320444, 0.6538241, 0, 1, 0.5490196, 1,
-0.1488022, -1.929937, -3.491686, 0, 1, 0.5568628, 1,
-0.1446059, 1.435824, -0.2780838, 0, 1, 0.5607843, 1,
-0.1442141, 0.8458127, 0.6833073, 0, 1, 0.5686275, 1,
-0.135053, 0.2142426, 1.108321, 0, 1, 0.572549, 1,
-0.1318068, -0.6679594, -1.659445, 0, 1, 0.5803922, 1,
-0.1301987, -1.072412, -4.096448, 0, 1, 0.5843138, 1,
-0.1288369, -0.2833313, -2.418747, 0, 1, 0.5921569, 1,
-0.1223771, -0.04332369, -3.512377, 0, 1, 0.5960785, 1,
-0.115204, -1.027302, -3.736259, 0, 1, 0.6039216, 1,
-0.1142311, 1.680128, -1.694253, 0, 1, 0.6117647, 1,
-0.1096331, -1.207901, -3.28121, 0, 1, 0.6156863, 1,
-0.1076096, 0.3747485, 0.4740912, 0, 1, 0.6235294, 1,
-0.1075153, -1.25013, -2.531157, 0, 1, 0.627451, 1,
-0.1068234, -0.2856071, -0.7029819, 0, 1, 0.6352941, 1,
-0.1033085, -1.382633, -0.5470634, 0, 1, 0.6392157, 1,
-0.1026107, 0.8701072, 0.6320232, 0, 1, 0.6470588, 1,
-0.1007786, -1.444963, -3.243821, 0, 1, 0.6509804, 1,
-0.09987932, 0.4432189, -0.4735647, 0, 1, 0.6588235, 1,
-0.0990379, -0.0845244, -1.322383, 0, 1, 0.6627451, 1,
-0.09572849, -1.690726, -4.959987, 0, 1, 0.6705883, 1,
-0.09498834, -0.7995499, -4.176929, 0, 1, 0.6745098, 1,
-0.09151956, 0.4871677, 0.1027484, 0, 1, 0.682353, 1,
-0.09101782, 0.3720251, 0.1244934, 0, 1, 0.6862745, 1,
-0.09045173, -1.162901, -3.284743, 0, 1, 0.6941177, 1,
-0.08670105, -0.0586153, -1.679858, 0, 1, 0.7019608, 1,
-0.07219027, 0.283042, 0.3349742, 0, 1, 0.7058824, 1,
-0.06700287, -1.155542, -4.752035, 0, 1, 0.7137255, 1,
-0.06670636, -1.776027, -4.096498, 0, 1, 0.7176471, 1,
-0.06415751, -1.673242, -4.48188, 0, 1, 0.7254902, 1,
-0.06415094, -0.02950583, -0.9911999, 0, 1, 0.7294118, 1,
-0.06152143, 0.07936683, 1.508406, 0, 1, 0.7372549, 1,
-0.05002512, -0.292007, -4.055351, 0, 1, 0.7411765, 1,
-0.04550632, 0.8429959, -1.02444, 0, 1, 0.7490196, 1,
-0.04190718, 1.80471, 0.8986701, 0, 1, 0.7529412, 1,
-0.03181051, -0.9812392, -2.383919, 0, 1, 0.7607843, 1,
-0.03179023, -0.78031, -3.93292, 0, 1, 0.7647059, 1,
-0.0292913, 0.6394985, 0.07922596, 0, 1, 0.772549, 1,
-0.02915965, -1.739998, -2.309666, 0, 1, 0.7764706, 1,
-0.02730603, -0.1081244, -3.882558, 0, 1, 0.7843137, 1,
-0.026045, 0.8218552, -0.2204317, 0, 1, 0.7882353, 1,
-0.02299546, -0.08856671, -1.140084, 0, 1, 0.7960784, 1,
-0.0192964, 1.19297, 0.7527235, 0, 1, 0.8039216, 1,
-0.01894718, 0.1132298, -0.6023541, 0, 1, 0.8078431, 1,
-0.01654361, 0.05630305, -0.6573427, 0, 1, 0.8156863, 1,
-0.01164378, -0.6018198, -2.576988, 0, 1, 0.8196079, 1,
-0.011595, -1.104057, -3.622794, 0, 1, 0.827451, 1,
-0.008562933, -0.6816152, -2.327166, 0, 1, 0.8313726, 1,
-0.006209873, 0.01707357, 0.3813637, 0, 1, 0.8392157, 1,
-0.003952966, -0.1965481, -2.338217, 0, 1, 0.8431373, 1,
-0.003895154, 0.7215583, 1.32511, 0, 1, 0.8509804, 1,
-0.00272375, -0.371976, -2.819213, 0, 1, 0.854902, 1,
1.599622e-05, 0.730303, 0.046489, 0, 1, 0.8627451, 1,
0.001742129, 1.23129, -0.9165646, 0, 1, 0.8666667, 1,
0.00314007, -1.233013, 2.762584, 0, 1, 0.8745098, 1,
0.006859255, -0.8260476, 4.204759, 0, 1, 0.8784314, 1,
0.007496121, -0.4600206, 2.932988, 0, 1, 0.8862745, 1,
0.007796962, 0.4820977, 0.2528953, 0, 1, 0.8901961, 1,
0.01219238, 0.05929533, -0.7959424, 0, 1, 0.8980392, 1,
0.01303665, -2.698933, 3.996653, 0, 1, 0.9058824, 1,
0.01460852, -0.6863583, 3.569622, 0, 1, 0.9098039, 1,
0.01496729, -0.1310465, 2.29882, 0, 1, 0.9176471, 1,
0.01511998, 0.172714, 0.08782791, 0, 1, 0.9215686, 1,
0.01757559, -1.192239, 1.574737, 0, 1, 0.9294118, 1,
0.02017948, -0.9341261, 3.797721, 0, 1, 0.9333333, 1,
0.02479371, -0.2598318, 3.554842, 0, 1, 0.9411765, 1,
0.02481034, 0.5851741, -2.079678, 0, 1, 0.945098, 1,
0.02714387, 1.619407, 2.410541, 0, 1, 0.9529412, 1,
0.03110631, -1.183118, 3.985252, 0, 1, 0.9568627, 1,
0.03290288, -0.536553, 2.196377, 0, 1, 0.9647059, 1,
0.0330181, 0.5345303, -0.5561904, 0, 1, 0.9686275, 1,
0.03371903, -0.7626587, 2.232462, 0, 1, 0.9764706, 1,
0.03558505, -0.04853419, 3.39837, 0, 1, 0.9803922, 1,
0.03950999, 0.2924896, 1.219398, 0, 1, 0.9882353, 1,
0.04014214, -0.6588814, 2.448044, 0, 1, 0.9921569, 1,
0.04234175, 0.1547476, -0.3382759, 0, 1, 1, 1,
0.04388308, -1.564972, 3.658208, 0, 0.9921569, 1, 1,
0.04550381, -0.5881549, 4.326696, 0, 0.9882353, 1, 1,
0.04941716, -1.383796, 1.738012, 0, 0.9803922, 1, 1,
0.05232935, 0.4220232, 0.7017923, 0, 0.9764706, 1, 1,
0.05408882, -2.41039, 4.253207, 0, 0.9686275, 1, 1,
0.05504105, 0.6086408, -1.017122, 0, 0.9647059, 1, 1,
0.0589545, -0.9098287, 3.428015, 0, 0.9568627, 1, 1,
0.06012521, 0.06279352, 1.478342, 0, 0.9529412, 1, 1,
0.06466287, -1.326137, 3.178475, 0, 0.945098, 1, 1,
0.06725045, -0.9327219, 3.562121, 0, 0.9411765, 1, 1,
0.07071377, 0.7116412, 1.039338, 0, 0.9333333, 1, 1,
0.07107417, -0.6155143, 3.443394, 0, 0.9294118, 1, 1,
0.07601873, -0.0009741261, 2.633054, 0, 0.9215686, 1, 1,
0.07699202, 0.4731055, -2.225995, 0, 0.9176471, 1, 1,
0.0791542, 1.314909, 0.1381965, 0, 0.9098039, 1, 1,
0.07980415, 0.07372033, 1.010814, 0, 0.9058824, 1, 1,
0.08307929, -0.1634489, 4.099261, 0, 0.8980392, 1, 1,
0.08466594, 0.977053, -0.3931523, 0, 0.8901961, 1, 1,
0.08775537, -1.159847, 4.324052, 0, 0.8862745, 1, 1,
0.09041195, -1.171877, 2.733191, 0, 0.8784314, 1, 1,
0.09184215, 0.4264847, 0.5434965, 0, 0.8745098, 1, 1,
0.09650724, 1.778907, -0.6433785, 0, 0.8666667, 1, 1,
0.09891677, -1.44574, 2.64609, 0, 0.8627451, 1, 1,
0.1015886, 0.1468144, 0.8752831, 0, 0.854902, 1, 1,
0.1021371, 1.696251, 0.8443122, 0, 0.8509804, 1, 1,
0.1025651, -0.8522754, 2.508907, 0, 0.8431373, 1, 1,
0.1028035, 0.01044308, 2.737526, 0, 0.8392157, 1, 1,
0.1069851, 0.3221319, -0.3985896, 0, 0.8313726, 1, 1,
0.1107192, 0.07430245, 1.814542, 0, 0.827451, 1, 1,
0.1189557, 0.6369278, -1.080012, 0, 0.8196079, 1, 1,
0.1223274, 0.8450294, 1.641573, 0, 0.8156863, 1, 1,
0.1224609, 1.605833, -0.3174819, 0, 0.8078431, 1, 1,
0.1253276, -1.246946, 1.736556, 0, 0.8039216, 1, 1,
0.1285806, -0.0432036, 1.921177, 0, 0.7960784, 1, 1,
0.1325893, -1.147724, 3.268217, 0, 0.7882353, 1, 1,
0.1338172, -2.370685, 3.206937, 0, 0.7843137, 1, 1,
0.1364789, 0.02675739, 3.400589, 0, 0.7764706, 1, 1,
0.1403669, -1.134295, 1.768292, 0, 0.772549, 1, 1,
0.143498, -0.2106143, 2.602086, 0, 0.7647059, 1, 1,
0.148164, -1.435398, 2.281523, 0, 0.7607843, 1, 1,
0.1520803, -1.021204, 0.7207806, 0, 0.7529412, 1, 1,
0.1547524, -1.09796, 2.534276, 0, 0.7490196, 1, 1,
0.1576191, -0.5824403, 5.127508, 0, 0.7411765, 1, 1,
0.1581064, 0.1187616, 2.320397, 0, 0.7372549, 1, 1,
0.1638826, 0.1451734, 2.124574, 0, 0.7294118, 1, 1,
0.1649585, 0.4840262, -1.276411, 0, 0.7254902, 1, 1,
0.1730861, -0.5176802, 3.67675, 0, 0.7176471, 1, 1,
0.1772699, 0.00805729, 1.384989, 0, 0.7137255, 1, 1,
0.1773234, 0.1076396, 0.8863865, 0, 0.7058824, 1, 1,
0.1778166, -1.554257, 2.427909, 0, 0.6980392, 1, 1,
0.1784412, -1.499868, 3.064205, 0, 0.6941177, 1, 1,
0.1870303, 1.475476, -0.4845575, 0, 0.6862745, 1, 1,
0.1886211, 1.157757, 0.2306728, 0, 0.682353, 1, 1,
0.1892934, -0.6642288, 1.651349, 0, 0.6745098, 1, 1,
0.1900198, -0.9159741, 2.477072, 0, 0.6705883, 1, 1,
0.1916259, -0.3494548, 1.960426, 0, 0.6627451, 1, 1,
0.197238, 1.940123, -1.192636, 0, 0.6588235, 1, 1,
0.1989205, -0.2806323, 2.46114, 0, 0.6509804, 1, 1,
0.200179, -1.031638, 3.345613, 0, 0.6470588, 1, 1,
0.2052628, 1.06007, 0.3790326, 0, 0.6392157, 1, 1,
0.2056859, -0.5106389, 4.451963, 0, 0.6352941, 1, 1,
0.2058111, -0.7321057, 2.985516, 0, 0.627451, 1, 1,
0.2152672, -0.7094358, 2.770587, 0, 0.6235294, 1, 1,
0.2159012, -0.3538922, 3.321749, 0, 0.6156863, 1, 1,
0.2191891, -0.6443765, 2.834597, 0, 0.6117647, 1, 1,
0.2207793, -0.04213706, 0.5125761, 0, 0.6039216, 1, 1,
0.2222771, -0.4501142, 2.489754, 0, 0.5960785, 1, 1,
0.2278097, -0.3549799, 1.000054, 0, 0.5921569, 1, 1,
0.2292384, -0.3088029, 2.317448, 0, 0.5843138, 1, 1,
0.2370994, -0.7104273, 4.000879, 0, 0.5803922, 1, 1,
0.2397284, 2.076294, -0.1338338, 0, 0.572549, 1, 1,
0.2405699, -0.1568716, 1.589512, 0, 0.5686275, 1, 1,
0.2406812, -0.07891881, 1.005424, 0, 0.5607843, 1, 1,
0.2424444, 1.773125, 0.3988054, 0, 0.5568628, 1, 1,
0.24251, -2.198805, 1.980945, 0, 0.5490196, 1, 1,
0.2482368, -2.118582, 2.801295, 0, 0.5450981, 1, 1,
0.2501974, -0.6369668, 4.394907, 0, 0.5372549, 1, 1,
0.253921, -0.2103785, 2.441494, 0, 0.5333334, 1, 1,
0.2582539, -0.7464681, 3.823986, 0, 0.5254902, 1, 1,
0.2644078, 0.7219677, -0.0456697, 0, 0.5215687, 1, 1,
0.2644466, -1.135781, 3.367226, 0, 0.5137255, 1, 1,
0.2652034, 0.5589456, 2.144555, 0, 0.509804, 1, 1,
0.2687077, 1.110123, 0.3106591, 0, 0.5019608, 1, 1,
0.2693244, -0.2603484, 2.612254, 0, 0.4941176, 1, 1,
0.2704053, 1.74285, -0.9022433, 0, 0.4901961, 1, 1,
0.2744741, 1.112494, 0.6858507, 0, 0.4823529, 1, 1,
0.2748774, 0.5456544, -0.1252832, 0, 0.4784314, 1, 1,
0.2755965, -0.7823504, 3.139159, 0, 0.4705882, 1, 1,
0.2823083, -0.1921094, 2.007939, 0, 0.4666667, 1, 1,
0.285474, 1.337682, -0.2718588, 0, 0.4588235, 1, 1,
0.2871527, -1.494439, 3.02931, 0, 0.454902, 1, 1,
0.287618, 0.08941977, 1.308948, 0, 0.4470588, 1, 1,
0.288354, -0.1706917, 2.420699, 0, 0.4431373, 1, 1,
0.2884848, -1.178047, 3.338461, 0, 0.4352941, 1, 1,
0.2910751, -0.2114777, 2.47077, 0, 0.4313726, 1, 1,
0.2911819, -0.2547612, -0.2799931, 0, 0.4235294, 1, 1,
0.2915383, -0.6328157, 3.47267, 0, 0.4196078, 1, 1,
0.2929513, -0.3572252, 3.003426, 0, 0.4117647, 1, 1,
0.2962374, -0.3650365, 3.219294, 0, 0.4078431, 1, 1,
0.3034042, 0.1824472, 0.6157715, 0, 0.4, 1, 1,
0.3035283, 2.47341, -0.5179262, 0, 0.3921569, 1, 1,
0.3060219, 1.16146, 1.147085, 0, 0.3882353, 1, 1,
0.3065833, 1.172238, -0.2049366, 0, 0.3803922, 1, 1,
0.307891, -0.1114294, 1.413976, 0, 0.3764706, 1, 1,
0.3109014, -0.1451712, 1.5629, 0, 0.3686275, 1, 1,
0.3112675, 0.1851709, 2.687367, 0, 0.3647059, 1, 1,
0.3136913, 0.6316239, 1.651795, 0, 0.3568628, 1, 1,
0.319942, 0.5477364, 0.8610687, 0, 0.3529412, 1, 1,
0.3210554, 0.3607308, 0.1612137, 0, 0.345098, 1, 1,
0.3215423, 1.408552, 0.1608425, 0, 0.3411765, 1, 1,
0.322613, -0.4334002, 1.640024, 0, 0.3333333, 1, 1,
0.3230409, 0.3231726, 1.220762, 0, 0.3294118, 1, 1,
0.3250789, -0.7992874, 3.261893, 0, 0.3215686, 1, 1,
0.328729, -1.439403, 3.142539, 0, 0.3176471, 1, 1,
0.3311646, -0.1878824, 1.873656, 0, 0.3098039, 1, 1,
0.3341501, 0.1201226, -0.1738528, 0, 0.3058824, 1, 1,
0.3384875, 1.416886, 1.818808, 0, 0.2980392, 1, 1,
0.3405379, -0.589401, 3.614961, 0, 0.2901961, 1, 1,
0.3408338, 2.003131, 3.114705, 0, 0.2862745, 1, 1,
0.3465961, 1.703203, -0.8252982, 0, 0.2784314, 1, 1,
0.3543071, 0.1636109, 2.044606, 0, 0.2745098, 1, 1,
0.3550328, 1.72295, 1.106291, 0, 0.2666667, 1, 1,
0.3612534, 0.7695014, 0.9340211, 0, 0.2627451, 1, 1,
0.362644, -0.1289159, 0.9308472, 0, 0.254902, 1, 1,
0.3639142, 0.03410853, 1.840397, 0, 0.2509804, 1, 1,
0.3680479, -0.53953, 1.836986, 0, 0.2431373, 1, 1,
0.3710324, 0.2214973, 1.577067, 0, 0.2392157, 1, 1,
0.3715093, -0.1785965, 0.8941276, 0, 0.2313726, 1, 1,
0.3742378, 0.04177795, 1.198654, 0, 0.227451, 1, 1,
0.3765948, 1.152535, -0.8859893, 0, 0.2196078, 1, 1,
0.3778598, 0.1748538, 1.386659, 0, 0.2156863, 1, 1,
0.3841705, 0.913893, 1.493166, 0, 0.2078431, 1, 1,
0.3842197, -0.3067295, 4.822292, 0, 0.2039216, 1, 1,
0.3853579, -0.826717, 1.656665, 0, 0.1960784, 1, 1,
0.393259, -0.5753998, 1.137985, 0, 0.1882353, 1, 1,
0.3946961, 0.5041094, 1.122282, 0, 0.1843137, 1, 1,
0.3981315, 0.9931965, -0.7871531, 0, 0.1764706, 1, 1,
0.4036723, -0.5776047, 1.7577, 0, 0.172549, 1, 1,
0.4044172, 0.2347999, 2.212568, 0, 0.1647059, 1, 1,
0.4110051, 0.9089544, 0.06771912, 0, 0.1607843, 1, 1,
0.4113943, -2.021669, 1.692655, 0, 0.1529412, 1, 1,
0.4151279, -0.6358977, 2.038865, 0, 0.1490196, 1, 1,
0.4203879, 1.309214, 0.5331805, 0, 0.1411765, 1, 1,
0.42262, 1.723167, 0.778986, 0, 0.1372549, 1, 1,
0.428004, 0.7793166, -0.6044216, 0, 0.1294118, 1, 1,
0.4283942, -0.6943176, 2.324752, 0, 0.1254902, 1, 1,
0.4400748, -1.776407, 1.516438, 0, 0.1176471, 1, 1,
0.4503458, 0.8594449, 1.153249, 0, 0.1137255, 1, 1,
0.4538414, -0.5521969, 3.709804, 0, 0.1058824, 1, 1,
0.4586465, 0.07789723, 0.8349599, 0, 0.09803922, 1, 1,
0.4603387, -0.8274134, 1.169646, 0, 0.09411765, 1, 1,
0.4605554, 1.006072, 1.254709, 0, 0.08627451, 1, 1,
0.4609708, 1.303191, 1.62869, 0, 0.08235294, 1, 1,
0.4647024, 0.553847, 1.266152, 0, 0.07450981, 1, 1,
0.4682154, 1.22565, -0.4243315, 0, 0.07058824, 1, 1,
0.4712344, 0.3389309, 0.3892341, 0, 0.0627451, 1, 1,
0.4746046, 0.7400275, -1.058727, 0, 0.05882353, 1, 1,
0.4769161, -0.5663647, 0.7842259, 0, 0.05098039, 1, 1,
0.4770367, 0.0523245, 1.389663, 0, 0.04705882, 1, 1,
0.4784915, 1.13939, 0.3896338, 0, 0.03921569, 1, 1,
0.4786026, 0.1765284, -0.8248717, 0, 0.03529412, 1, 1,
0.4794011, -0.1751534, 2.308613, 0, 0.02745098, 1, 1,
0.4800374, 1.002455, -0.5887049, 0, 0.02352941, 1, 1,
0.4801903, 2.229203, 0.2821603, 0, 0.01568628, 1, 1,
0.4838007, 0.1196832, 0.07595685, 0, 0.01176471, 1, 1,
0.4876517, 0.03245938, 0.889345, 0, 0.003921569, 1, 1,
0.4881312, -0.5209696, 4.449995, 0.003921569, 0, 1, 1,
0.4940025, -1.228064, 1.655378, 0.007843138, 0, 1, 1,
0.4975488, -1.486168, 4.200259, 0.01568628, 0, 1, 1,
0.4984297, -0.3823303, 3.757319, 0.01960784, 0, 1, 1,
0.5028911, -0.9135128, 1.329228, 0.02745098, 0, 1, 1,
0.5039244, -0.4851967, 2.63328, 0.03137255, 0, 1, 1,
0.5056166, 0.6971539, 0.1009503, 0.03921569, 0, 1, 1,
0.5086663, 1.009725, 0.3643669, 0.04313726, 0, 1, 1,
0.5088217, 1.062267, 2.200122, 0.05098039, 0, 1, 1,
0.5162027, 1.503479, -0.06636278, 0.05490196, 0, 1, 1,
0.5176846, 0.1382297, 1.393329, 0.0627451, 0, 1, 1,
0.5243304, -0.8887388, 2.949945, 0.06666667, 0, 1, 1,
0.5259827, 0.1398667, 0.01049932, 0.07450981, 0, 1, 1,
0.5263276, -2.398698, 2.544482, 0.07843138, 0, 1, 1,
0.5292885, 0.2531863, -0.009424097, 0.08627451, 0, 1, 1,
0.5306925, -1.160063, 1.040117, 0.09019608, 0, 1, 1,
0.5337002, -0.05908394, 2.152486, 0.09803922, 0, 1, 1,
0.5352388, 0.4344281, 1.448585, 0.1058824, 0, 1, 1,
0.5364525, 0.6484253, -0.1902589, 0.1098039, 0, 1, 1,
0.5384043, -0.07077485, 1.420911, 0.1176471, 0, 1, 1,
0.5467486, 0.553202, -0.1916253, 0.1215686, 0, 1, 1,
0.5470861, 0.04638086, 3.196876, 0.1294118, 0, 1, 1,
0.5493976, 0.421706, 0.6587787, 0.1333333, 0, 1, 1,
0.5519403, 0.6523182, 0.5314836, 0.1411765, 0, 1, 1,
0.5564429, -1.553829, 3.256561, 0.145098, 0, 1, 1,
0.5574163, 0.7972528, 0.3801405, 0.1529412, 0, 1, 1,
0.5622487, 0.0297323, 1.285407, 0.1568628, 0, 1, 1,
0.5688834, -0.03140544, 2.371893, 0.1647059, 0, 1, 1,
0.5706552, 0.4199777, -0.2482789, 0.1686275, 0, 1, 1,
0.5715294, 0.6535924, -0.4045382, 0.1764706, 0, 1, 1,
0.5717577, 0.4815112, 1.45637, 0.1803922, 0, 1, 1,
0.5737723, -0.247096, 1.037756, 0.1882353, 0, 1, 1,
0.5745658, -0.2847969, 1.934813, 0.1921569, 0, 1, 1,
0.5749444, 0.6229135, 2.042757, 0.2, 0, 1, 1,
0.5803609, 0.02242246, 1.043961, 0.2078431, 0, 1, 1,
0.585751, 1.999579, 1.726007, 0.2117647, 0, 1, 1,
0.5889637, -0.2701935, 0.01396614, 0.2196078, 0, 1, 1,
0.5921148, -0.5666181, 3.000029, 0.2235294, 0, 1, 1,
0.5941372, -0.2591074, 1.373885, 0.2313726, 0, 1, 1,
0.5993403, -0.961984, 3.436487, 0.2352941, 0, 1, 1,
0.6049452, -0.9656498, 2.547891, 0.2431373, 0, 1, 1,
0.6129603, -0.82906, 3.484516, 0.2470588, 0, 1, 1,
0.6182961, -1.381262, 2.009272, 0.254902, 0, 1, 1,
0.6210361, 0.9080262, 2.99934, 0.2588235, 0, 1, 1,
0.622901, -0.5770392, 1.247216, 0.2666667, 0, 1, 1,
0.6308587, -0.2397589, 1.743767, 0.2705882, 0, 1, 1,
0.6312954, -0.942038, 0.4394041, 0.2784314, 0, 1, 1,
0.6327157, 0.7161021, -0.08765078, 0.282353, 0, 1, 1,
0.6334682, 1.02854, -0.1762843, 0.2901961, 0, 1, 1,
0.6350801, -0.8814671, 3.462095, 0.2941177, 0, 1, 1,
0.6434923, -0.1900311, 3.578482, 0.3019608, 0, 1, 1,
0.6443101, 0.7742491, 0.7316197, 0.3098039, 0, 1, 1,
0.6460478, -0.7606095, 2.225584, 0.3137255, 0, 1, 1,
0.6467182, -0.3763294, 4.54658, 0.3215686, 0, 1, 1,
0.6478157, -1.253554, 4.152735, 0.3254902, 0, 1, 1,
0.6502209, 0.5419623, 1.904507, 0.3333333, 0, 1, 1,
0.6568347, -1.801254, 2.665775, 0.3372549, 0, 1, 1,
0.6571236, -0.2804604, 1.331654, 0.345098, 0, 1, 1,
0.660133, 1.004465, 0.117342, 0.3490196, 0, 1, 1,
0.662011, -0.2308357, 1.19555, 0.3568628, 0, 1, 1,
0.6625681, -0.5189471, 1.062039, 0.3607843, 0, 1, 1,
0.6630418, -0.8039317, 2.063144, 0.3686275, 0, 1, 1,
0.6644457, -0.5507994, 2.060266, 0.372549, 0, 1, 1,
0.6674131, 1.949339, -0.8126027, 0.3803922, 0, 1, 1,
0.6676157, -1.121755, 2.003415, 0.3843137, 0, 1, 1,
0.6678412, -0.4073046, 1.404072, 0.3921569, 0, 1, 1,
0.669455, 1.057524, 0.6124159, 0.3960784, 0, 1, 1,
0.6765069, -0.3633616, 0.9968883, 0.4039216, 0, 1, 1,
0.6772722, -1.660586, 3.825175, 0.4117647, 0, 1, 1,
0.6784649, -0.6223772, 1.680446, 0.4156863, 0, 1, 1,
0.6793057, -0.8400359, 2.450099, 0.4235294, 0, 1, 1,
0.6812099, 1.257147, 0.1514779, 0.427451, 0, 1, 1,
0.6832511, -1.622564, 2.748972, 0.4352941, 0, 1, 1,
0.6852558, 0.7237848, 0.3574233, 0.4392157, 0, 1, 1,
0.6902502, -0.187542, -1.030426, 0.4470588, 0, 1, 1,
0.69485, 0.07935375, -0.1303951, 0.4509804, 0, 1, 1,
0.6952186, 1.061974, -0.3053765, 0.4588235, 0, 1, 1,
0.6990416, 1.102883, -0.4382548, 0.4627451, 0, 1, 1,
0.6996634, 0.3163971, 2.336457, 0.4705882, 0, 1, 1,
0.7005337, -0.899112, 1.951157, 0.4745098, 0, 1, 1,
0.7028604, 0.2636173, -0.7189934, 0.4823529, 0, 1, 1,
0.7050559, -1.591155, 2.506234, 0.4862745, 0, 1, 1,
0.7067785, -0.2982119, 3.163127, 0.4941176, 0, 1, 1,
0.7125313, 1.309313, -1.800223, 0.5019608, 0, 1, 1,
0.7241056, 2.311318, 0.3721125, 0.5058824, 0, 1, 1,
0.7261098, -1.295573, 1.937893, 0.5137255, 0, 1, 1,
0.7268789, -0.4747474, 1.235057, 0.5176471, 0, 1, 1,
0.734482, 1.476222, -0.8261353, 0.5254902, 0, 1, 1,
0.7380747, 0.7642415, -0.5148792, 0.5294118, 0, 1, 1,
0.7444149, -0.7084824, 3.319295, 0.5372549, 0, 1, 1,
0.7457636, -1.268199, 3.827703, 0.5411765, 0, 1, 1,
0.7472886, 0.05966514, 2.271114, 0.5490196, 0, 1, 1,
0.747763, 0.5800948, 1.558516, 0.5529412, 0, 1, 1,
0.749543, 1.10454, -0.6275464, 0.5607843, 0, 1, 1,
0.7504579, -0.3110845, 3.612636, 0.5647059, 0, 1, 1,
0.7512784, 1.039631, 0.7746431, 0.572549, 0, 1, 1,
0.7583607, 0.6509707, 1.206027, 0.5764706, 0, 1, 1,
0.766606, 1.336283, -0.500699, 0.5843138, 0, 1, 1,
0.7673001, -0.7870314, 3.077673, 0.5882353, 0, 1, 1,
0.7696027, -1.145799, 2.829696, 0.5960785, 0, 1, 1,
0.7714685, -0.7138852, 2.736844, 0.6039216, 0, 1, 1,
0.7768369, 0.240475, 3.129901, 0.6078432, 0, 1, 1,
0.7793437, -1.127758, 3.258492, 0.6156863, 0, 1, 1,
0.7824326, -0.4336497, 2.963715, 0.6196079, 0, 1, 1,
0.7852294, -1.412691, 4.027787, 0.627451, 0, 1, 1,
0.7880332, 0.2722397, 0.7966916, 0.6313726, 0, 1, 1,
0.7899703, -0.2797315, 0.2622026, 0.6392157, 0, 1, 1,
0.791272, 1.107434, -0.7826795, 0.6431373, 0, 1, 1,
0.7918506, -1.471865, 3.125296, 0.6509804, 0, 1, 1,
0.7973903, 0.4332706, 1.3657, 0.654902, 0, 1, 1,
0.8034543, 0.8184811, -0.2955576, 0.6627451, 0, 1, 1,
0.8061723, 1.127233, 0.1148573, 0.6666667, 0, 1, 1,
0.8104348, 1.172714, 1.010746, 0.6745098, 0, 1, 1,
0.810742, -0.2842571, 1.862709, 0.6784314, 0, 1, 1,
0.8196312, -0.3074044, -0.5528479, 0.6862745, 0, 1, 1,
0.8281266, -0.04852346, 1.362638, 0.6901961, 0, 1, 1,
0.8364172, -2.002843, 1.044214, 0.6980392, 0, 1, 1,
0.8423184, 1.496111, 2.210877, 0.7058824, 0, 1, 1,
0.8466073, 0.2157539, 1.742817, 0.7098039, 0, 1, 1,
0.8490901, 0.01633025, 1.627481, 0.7176471, 0, 1, 1,
0.8530893, 2.175238, 0.2159983, 0.7215686, 0, 1, 1,
0.8531061, -0.8885507, 1.392075, 0.7294118, 0, 1, 1,
0.8531328, -0.1995832, 1.503338, 0.7333333, 0, 1, 1,
0.8599343, 0.1934436, 0.8640534, 0.7411765, 0, 1, 1,
0.861143, 0.5080203, 2.775943, 0.7450981, 0, 1, 1,
0.8619544, -0.3409884, 3.01505, 0.7529412, 0, 1, 1,
0.8629791, 0.2126388, 2.20699, 0.7568628, 0, 1, 1,
0.8635789, 0.8547722, 0.7475808, 0.7647059, 0, 1, 1,
0.8668331, 1.344783, 1.365972, 0.7686275, 0, 1, 1,
0.87097, 1.076655, 0.1344564, 0.7764706, 0, 1, 1,
0.8712528, 1.74518, -0.811382, 0.7803922, 0, 1, 1,
0.8729517, -0.225443, 2.840313, 0.7882353, 0, 1, 1,
0.8737366, -0.5575803, 2.464102, 0.7921569, 0, 1, 1,
0.8873306, 0.05103809, 2.26438, 0.8, 0, 1, 1,
0.8923569, 1.345087, 2.940757, 0.8078431, 0, 1, 1,
0.9028607, 0.8909066, 1.21125, 0.8117647, 0, 1, 1,
0.906381, 0.6214658, 2.013631, 0.8196079, 0, 1, 1,
0.9070227, -0.5209005, 3.558147, 0.8235294, 0, 1, 1,
0.9142029, -0.4104425, 3.829602, 0.8313726, 0, 1, 1,
0.91482, -1.31488, 1.614776, 0.8352941, 0, 1, 1,
0.9160362, 0.3546316, 1.834137, 0.8431373, 0, 1, 1,
0.9173298, -0.02268179, 2.096372, 0.8470588, 0, 1, 1,
0.9185482, -0.1375656, 1.801265, 0.854902, 0, 1, 1,
0.9206474, -0.8137466, 1.471365, 0.8588235, 0, 1, 1,
0.9220333, 0.03077511, 1.951136, 0.8666667, 0, 1, 1,
0.9233763, 0.3184076, 2.004825, 0.8705882, 0, 1, 1,
0.9247313, -1.70991, 1.161633, 0.8784314, 0, 1, 1,
0.931272, 0.5345008, -0.05591831, 0.8823529, 0, 1, 1,
0.9369977, -0.4297584, 2.138452, 0.8901961, 0, 1, 1,
0.9406686, 0.9467353, 0.9488937, 0.8941177, 0, 1, 1,
0.9416792, 0.8474391, 0.1177276, 0.9019608, 0, 1, 1,
0.9433603, 0.5110776, 1.678982, 0.9098039, 0, 1, 1,
0.9494129, 0.0975254, 1.727314, 0.9137255, 0, 1, 1,
0.9639263, 0.8487085, 0.4466083, 0.9215686, 0, 1, 1,
0.9653541, -0.9715549, 1.844737, 0.9254902, 0, 1, 1,
0.9659371, -1.379325, 0.4999219, 0.9333333, 0, 1, 1,
0.9808986, 1.343047, -0.7822452, 0.9372549, 0, 1, 1,
0.9809124, 0.7413331, -0.4612689, 0.945098, 0, 1, 1,
0.9811355, -1.420095, 3.087118, 0.9490196, 0, 1, 1,
0.9866522, 1.394883, 0.4537129, 0.9568627, 0, 1, 1,
0.9918072, -0.229628, 1.938626, 0.9607843, 0, 1, 1,
0.9949104, -0.8903559, 1.36067, 0.9686275, 0, 1, 1,
0.997374, 0.6756816, 1.702729, 0.972549, 0, 1, 1,
0.9977205, -1.980239, 4.266215, 0.9803922, 0, 1, 1,
1.003787, 1.764474, 0.9778414, 0.9843137, 0, 1, 1,
1.006756, 0.1044802, 3.517443, 0.9921569, 0, 1, 1,
1.007927, 0.5711049, 1.121445, 0.9960784, 0, 1, 1,
1.00943, -1.090533, 1.121711, 1, 0, 0.9960784, 1,
1.023231, 2.191842, 0.7063549, 1, 0, 0.9882353, 1,
1.042901, -0.3390646, 2.441592, 1, 0, 0.9843137, 1,
1.053463, -1.374655, 2.398395, 1, 0, 0.9764706, 1,
1.061293, -0.3329105, 0.8465875, 1, 0, 0.972549, 1,
1.064866, -0.6490723, 4.073726, 1, 0, 0.9647059, 1,
1.066239, 0.0437741, 1.64177, 1, 0, 0.9607843, 1,
1.072064, 1.388106, 1.306834, 1, 0, 0.9529412, 1,
1.077236, 0.5704973, -0.1438277, 1, 0, 0.9490196, 1,
1.095921, -0.09634033, 1.202873, 1, 0, 0.9411765, 1,
1.098032, -1.258888, 0.9572636, 1, 0, 0.9372549, 1,
1.100086, -5.876545e-05, 0.5379752, 1, 0, 0.9294118, 1,
1.106531, 0.565734, 2.032636, 1, 0, 0.9254902, 1,
1.11175, 0.01183228, 1.881054, 1, 0, 0.9176471, 1,
1.114935, -0.4065227, 0.9311829, 1, 0, 0.9137255, 1,
1.118553, 0.1667206, 0.9575564, 1, 0, 0.9058824, 1,
1.119539, 1.761833, 0.3827409, 1, 0, 0.9019608, 1,
1.127375, -0.8380913, 3.013689, 1, 0, 0.8941177, 1,
1.128396, 0.2974798, 1.693975, 1, 0, 0.8862745, 1,
1.139667, 1.988284, -0.2657309, 1, 0, 0.8823529, 1,
1.15211, 0.1280153, 0.648374, 1, 0, 0.8745098, 1,
1.152523, 2.115681, 0.7782223, 1, 0, 0.8705882, 1,
1.152553, 0.8413373, 1.293234, 1, 0, 0.8627451, 1,
1.164979, 1.425836, 1.096306, 1, 0, 0.8588235, 1,
1.171661, -0.3605112, 2.830216, 1, 0, 0.8509804, 1,
1.174137, 0.06759499, 2.404381, 1, 0, 0.8470588, 1,
1.177751, 1.521917, 0.9862249, 1, 0, 0.8392157, 1,
1.178706, 0.7203178, 3.225222, 1, 0, 0.8352941, 1,
1.182706, -0.9587603, 1.668246, 1, 0, 0.827451, 1,
1.191758, 0.2394752, 0.2852329, 1, 0, 0.8235294, 1,
1.192072, -0.2162125, 2.175936, 1, 0, 0.8156863, 1,
1.198256, 1.262265, 2.689585, 1, 0, 0.8117647, 1,
1.19989, -1.144897, 1.356549, 1, 0, 0.8039216, 1,
1.202305, -1.016443, 2.732326, 1, 0, 0.7960784, 1,
1.203517, 0.06807212, 2.957962, 1, 0, 0.7921569, 1,
1.204026, 0.625416, 0.1806742, 1, 0, 0.7843137, 1,
1.207101, 0.1634457, 2.02757, 1, 0, 0.7803922, 1,
1.20896, 0.76619, 0.1864968, 1, 0, 0.772549, 1,
1.218575, 1.15893, 0.6669952, 1, 0, 0.7686275, 1,
1.220788, -2.758221, 2.719684, 1, 0, 0.7607843, 1,
1.222313, -1.617006, 2.129434, 1, 0, 0.7568628, 1,
1.22723, -0.8338118, 1.46736, 1, 0, 0.7490196, 1,
1.231871, 0.2795897, 1.36383, 1, 0, 0.7450981, 1,
1.235243, 1.131153, 1.030213, 1, 0, 0.7372549, 1,
1.245002, -0.5286939, 2.361069, 1, 0, 0.7333333, 1,
1.257676, 0.07168086, 2.970172, 1, 0, 0.7254902, 1,
1.260448, -0.5200645, 1.99012, 1, 0, 0.7215686, 1,
1.261544, 0.07550121, -0.4155078, 1, 0, 0.7137255, 1,
1.263678, 0.3631268, 0.6336484, 1, 0, 0.7098039, 1,
1.268035, 0.3053965, 1.025449, 1, 0, 0.7019608, 1,
1.274906, -0.2720698, 1.037952, 1, 0, 0.6941177, 1,
1.280926, 1.902148, 1.585755, 1, 0, 0.6901961, 1,
1.28596, 0.8519217, 1.080584, 1, 0, 0.682353, 1,
1.295411, -1.130996, 4.579708, 1, 0, 0.6784314, 1,
1.299205, -0.9415219, 3.347965, 1, 0, 0.6705883, 1,
1.303098, 0.9301637, 0.6931251, 1, 0, 0.6666667, 1,
1.308879, 0.5954446, 0.07345708, 1, 0, 0.6588235, 1,
1.317786, 0.03529441, 2.546076, 1, 0, 0.654902, 1,
1.324944, -0.3101008, 1.749012, 1, 0, 0.6470588, 1,
1.337516, 0.2972868, 1.753255, 1, 0, 0.6431373, 1,
1.341448, 0.706522, -0.3900492, 1, 0, 0.6352941, 1,
1.342023, -0.08331414, 0.09486089, 1, 0, 0.6313726, 1,
1.342649, -0.7247127, 2.450852, 1, 0, 0.6235294, 1,
1.346156, -1.107283, 1.821203, 1, 0, 0.6196079, 1,
1.353654, -0.6167079, 3.643837, 1, 0, 0.6117647, 1,
1.353671, 1.15281, 1.162165, 1, 0, 0.6078432, 1,
1.354201, 0.583108, 0.01737994, 1, 0, 0.6, 1,
1.354601, 1.888838, 2.160271, 1, 0, 0.5921569, 1,
1.359326, 0.05689067, 1.547068, 1, 0, 0.5882353, 1,
1.368034, -0.1632416, 1.671265, 1, 0, 0.5803922, 1,
1.368813, -1.234078, 2.172507, 1, 0, 0.5764706, 1,
1.370032, 0.5455822, 2.419763, 1, 0, 0.5686275, 1,
1.375535, 0.094125, 2.196409, 1, 0, 0.5647059, 1,
1.389349, 0.385175, 0.6764405, 1, 0, 0.5568628, 1,
1.390259, 0.86761, 3.313397, 1, 0, 0.5529412, 1,
1.390785, -1.520953, 2.712541, 1, 0, 0.5450981, 1,
1.398585, 1.224288, 1.84487, 1, 0, 0.5411765, 1,
1.403344, 2.042367, 0.3912366, 1, 0, 0.5333334, 1,
1.414813, -2.074017, 2.723233, 1, 0, 0.5294118, 1,
1.418693, 1.579646, 2.253415, 1, 0, 0.5215687, 1,
1.424252, 1.262462, 1.023404, 1, 0, 0.5176471, 1,
1.42865, 0.6657857, 0.3977594, 1, 0, 0.509804, 1,
1.431643, -0.9428829, 4.063869, 1, 0, 0.5058824, 1,
1.431741, 1.72494, 1.947858, 1, 0, 0.4980392, 1,
1.436402, 0.2407529, 1.94337, 1, 0, 0.4901961, 1,
1.442669, -0.2705543, 3.246006, 1, 0, 0.4862745, 1,
1.4461, 0.6091015, -0.2324249, 1, 0, 0.4784314, 1,
1.450092, -1.696588, 4.054006, 1, 0, 0.4745098, 1,
1.456011, 3.53884, 0.8539624, 1, 0, 0.4666667, 1,
1.468128, 1.076645, 2.195081, 1, 0, 0.4627451, 1,
1.487052, -1.105831, 3.383719, 1, 0, 0.454902, 1,
1.488363, -0.5318866, 1.284851, 1, 0, 0.4509804, 1,
1.495335, 0.6873527, 1.130315, 1, 0, 0.4431373, 1,
1.498193, 0.1907116, 1.06465, 1, 0, 0.4392157, 1,
1.499871, 1.704021, -0.7959793, 1, 0, 0.4313726, 1,
1.502804, -1.276769, 3.007112, 1, 0, 0.427451, 1,
1.513172, 0.9577433, 1.591695, 1, 0, 0.4196078, 1,
1.51324, 1.261521, 0.2886595, 1, 0, 0.4156863, 1,
1.514287, -0.2405366, 1.568179, 1, 0, 0.4078431, 1,
1.525722, 0.4151932, 0.1716653, 1, 0, 0.4039216, 1,
1.552596, -1.241435, 2.774243, 1, 0, 0.3960784, 1,
1.560197, 2.091317, 2.200549, 1, 0, 0.3882353, 1,
1.560659, 1.069401, 0.611818, 1, 0, 0.3843137, 1,
1.56172, 0.08933238, 1.020916, 1, 0, 0.3764706, 1,
1.566078, -0.213525, 2.547951, 1, 0, 0.372549, 1,
1.57076, 0.901691, 2.641775, 1, 0, 0.3647059, 1,
1.572081, -1.350019, 0.9027983, 1, 0, 0.3607843, 1,
1.582669, 0.857929, 2.073995, 1, 0, 0.3529412, 1,
1.592399, -1.379013, 2.071967, 1, 0, 0.3490196, 1,
1.597228, 1.234838, 0.6465068, 1, 0, 0.3411765, 1,
1.602866, -0.565349, 2.347435, 1, 0, 0.3372549, 1,
1.608814, -0.853835, 1.941915, 1, 0, 0.3294118, 1,
1.611568, -0.7928254, 0.5480809, 1, 0, 0.3254902, 1,
1.631334, 1.477024, -0.5854947, 1, 0, 0.3176471, 1,
1.631634, 0.2352766, 0.2053643, 1, 0, 0.3137255, 1,
1.635406, -0.7355221, 0.7761262, 1, 0, 0.3058824, 1,
1.652191, 1.426849, 1.518406, 1, 0, 0.2980392, 1,
1.657596, 0.8968827, 2.090162, 1, 0, 0.2941177, 1,
1.660079, -0.2766432, 1.249408, 1, 0, 0.2862745, 1,
1.665224, -0.8272096, 2.621863, 1, 0, 0.282353, 1,
1.677366, -0.1728737, 1.715688, 1, 0, 0.2745098, 1,
1.678165, 0.2257541, 1.722918, 1, 0, 0.2705882, 1,
1.708944, 0.9593207, 1.877057, 1, 0, 0.2627451, 1,
1.712507, -1.161947, 1.087053, 1, 0, 0.2588235, 1,
1.719778, 1.121226, 1.628224, 1, 0, 0.2509804, 1,
1.753503, -0.3303615, 2.974692, 1, 0, 0.2470588, 1,
1.762308, 1.138386, 2.195858, 1, 0, 0.2392157, 1,
1.765682, -0.1063277, 1.906473, 1, 0, 0.2352941, 1,
1.777684, 0.9223117, 1.392719, 1, 0, 0.227451, 1,
1.797514, 0.2211632, 0.8035876, 1, 0, 0.2235294, 1,
1.797632, 0.815636, 0.1463783, 1, 0, 0.2156863, 1,
1.798241, 0.8782424, -0.4355289, 1, 0, 0.2117647, 1,
1.836146, 1.282898, -0.9658909, 1, 0, 0.2039216, 1,
1.84327, -1.154433, 2.990155, 1, 0, 0.1960784, 1,
1.845676, 1.233526, 1.1631, 1, 0, 0.1921569, 1,
1.868649, -0.9616471, 1.549372, 1, 0, 0.1843137, 1,
1.888465, -0.4914517, -0.8438795, 1, 0, 0.1803922, 1,
1.898041, -0.5326306, 2.831012, 1, 0, 0.172549, 1,
1.932178, -0.009573191, 2.117894, 1, 0, 0.1686275, 1,
1.945881, 0.9900677, 0.4963274, 1, 0, 0.1607843, 1,
1.949414, 0.101686, 0.06060706, 1, 0, 0.1568628, 1,
1.987575, 0.7841338, 1.669461, 1, 0, 0.1490196, 1,
2.014458, -0.2278761, 2.949781, 1, 0, 0.145098, 1,
2.01777, 0.8381757, 2.018131, 1, 0, 0.1372549, 1,
2.021141, -0.6041986, 1.910146, 1, 0, 0.1333333, 1,
2.03182, 1.226998, 0.8940549, 1, 0, 0.1254902, 1,
2.037599, 0.41951, 2.237709, 1, 0, 0.1215686, 1,
2.037616, 1.29048, -0.1792006, 1, 0, 0.1137255, 1,
2.053318, -0.1603104, 2.411868, 1, 0, 0.1098039, 1,
2.069268, 0.8852535, 0.5419998, 1, 0, 0.1019608, 1,
2.075763, 0.1201689, 1.349788, 1, 0, 0.09411765, 1,
2.090411, 0.3101581, 0.9732968, 1, 0, 0.09019608, 1,
2.151968, 0.6898667, 1.245354, 1, 0, 0.08235294, 1,
2.184614, -1.064221, 1.638079, 1, 0, 0.07843138, 1,
2.20038, 1.560924, -0.2865715, 1, 0, 0.07058824, 1,
2.219042, -0.4187312, 3.896473, 1, 0, 0.06666667, 1,
2.226586, -0.6720017, 0.9565232, 1, 0, 0.05882353, 1,
2.227168, -1.480876, 0.9105682, 1, 0, 0.05490196, 1,
2.249141, 0.6156936, 0.9774963, 1, 0, 0.04705882, 1,
2.294553, 1.726141, 0.4316312, 1, 0, 0.04313726, 1,
2.364196, 0.7026515, 1.753724, 1, 0, 0.03529412, 1,
2.377164, -0.3462904, 1.722867, 1, 0, 0.03137255, 1,
2.887737, 0.9447039, 2.672178, 1, 0, 0.02352941, 1,
3.070479, -0.804475, 1.314493, 1, 0, 0.01960784, 1,
3.333419, -0.8904604, 2.87491, 1, 0, 0.01176471, 1,
3.41922, 2.016812, 1.56375, 1, 0, 0.007843138, 1
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
-0.5120631, -4.088615, -7.59081, 0, -0.5, 0.5, 0.5,
-0.5120631, -4.088615, -7.59081, 1, -0.5, 0.5, 0.5,
-0.5120631, -4.088615, -7.59081, 1, 1.5, 0.5, 0.5,
-0.5120631, -4.088615, -7.59081, 0, 1.5, 0.5, 0.5
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
-5.776051, 0.2778502, -7.59081, 0, -0.5, 0.5, 0.5,
-5.776051, 0.2778502, -7.59081, 1, -0.5, 0.5, 0.5,
-5.776051, 0.2778502, -7.59081, 1, 1.5, 0.5, 0.5,
-5.776051, 0.2778502, -7.59081, 0, 1.5, 0.5, 0.5
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
-5.776051, -4.088615, -0.3099945, 0, -0.5, 0.5, 0.5,
-5.776051, -4.088615, -0.3099945, 1, -0.5, 0.5, 0.5,
-5.776051, -4.088615, -0.3099945, 1, 1.5, 0.5, 0.5,
-5.776051, -4.088615, -0.3099945, 0, 1.5, 0.5, 0.5
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
-4, -3.080969, -5.910622,
2, -3.080969, -5.910622,
-4, -3.080969, -5.910622,
-4, -3.24891, -6.190653,
-2, -3.080969, -5.910622,
-2, -3.24891, -6.190653,
0, -3.080969, -5.910622,
0, -3.24891, -6.190653,
2, -3.080969, -5.910622,
2, -3.24891, -6.190653
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
"-4",
"-2",
"0",
"2"
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
-4, -3.584792, -6.750716, 0, -0.5, 0.5, 0.5,
-4, -3.584792, -6.750716, 1, -0.5, 0.5, 0.5,
-4, -3.584792, -6.750716, 1, 1.5, 0.5, 0.5,
-4, -3.584792, -6.750716, 0, 1.5, 0.5, 0.5,
-2, -3.584792, -6.750716, 0, -0.5, 0.5, 0.5,
-2, -3.584792, -6.750716, 1, -0.5, 0.5, 0.5,
-2, -3.584792, -6.750716, 1, 1.5, 0.5, 0.5,
-2, -3.584792, -6.750716, 0, 1.5, 0.5, 0.5,
0, -3.584792, -6.750716, 0, -0.5, 0.5, 0.5,
0, -3.584792, -6.750716, 1, -0.5, 0.5, 0.5,
0, -3.584792, -6.750716, 1, 1.5, 0.5, 0.5,
0, -3.584792, -6.750716, 0, 1.5, 0.5, 0.5,
2, -3.584792, -6.750716, 0, -0.5, 0.5, 0.5,
2, -3.584792, -6.750716, 1, -0.5, 0.5, 0.5,
2, -3.584792, -6.750716, 1, 1.5, 0.5, 0.5,
2, -3.584792, -6.750716, 0, 1.5, 0.5, 0.5
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
-4.561285, -2, -5.910622,
-4.561285, 3, -5.910622,
-4.561285, -2, -5.910622,
-4.763746, -2, -6.190653,
-4.561285, -1, -5.910622,
-4.763746, -1, -6.190653,
-4.561285, 0, -5.910622,
-4.763746, 0, -6.190653,
-4.561285, 1, -5.910622,
-4.763746, 1, -6.190653,
-4.561285, 2, -5.910622,
-4.763746, 2, -6.190653,
-4.561285, 3, -5.910622,
-4.763746, 3, -6.190653
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
-5.168668, -2, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, -2, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, -2, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, -2, -6.750716, 0, 1.5, 0.5, 0.5,
-5.168668, -1, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, -1, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, -1, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, -1, -6.750716, 0, 1.5, 0.5, 0.5,
-5.168668, 0, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, 0, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, 0, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, 0, -6.750716, 0, 1.5, 0.5, 0.5,
-5.168668, 1, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, 1, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, 1, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, 1, -6.750716, 0, 1.5, 0.5, 0.5,
-5.168668, 2, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, 2, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, 2, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, 2, -6.750716, 0, 1.5, 0.5, 0.5,
-5.168668, 3, -6.750716, 0, -0.5, 0.5, 0.5,
-5.168668, 3, -6.750716, 1, -0.5, 0.5, 0.5,
-5.168668, 3, -6.750716, 1, 1.5, 0.5, 0.5,
-5.168668, 3, -6.750716, 0, 1.5, 0.5, 0.5
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
-4.561285, -3.080969, -4,
-4.561285, -3.080969, 4,
-4.561285, -3.080969, -4,
-4.763746, -3.24891, -4,
-4.561285, -3.080969, -2,
-4.763746, -3.24891, -2,
-4.561285, -3.080969, 0,
-4.763746, -3.24891, 0,
-4.561285, -3.080969, 2,
-4.763746, -3.24891, 2,
-4.561285, -3.080969, 4,
-4.763746, -3.24891, 4
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
-5.168668, -3.584792, -4, 0, -0.5, 0.5, 0.5,
-5.168668, -3.584792, -4, 1, -0.5, 0.5, 0.5,
-5.168668, -3.584792, -4, 1, 1.5, 0.5, 0.5,
-5.168668, -3.584792, -4, 0, 1.5, 0.5, 0.5,
-5.168668, -3.584792, -2, 0, -0.5, 0.5, 0.5,
-5.168668, -3.584792, -2, 1, -0.5, 0.5, 0.5,
-5.168668, -3.584792, -2, 1, 1.5, 0.5, 0.5,
-5.168668, -3.584792, -2, 0, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 0, 0, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 0, 1, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 0, 1, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 0, 0, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 2, 0, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 2, 1, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 2, 1, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 2, 0, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 4, 0, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 4, 1, -0.5, 0.5, 0.5,
-5.168668, -3.584792, 4, 1, 1.5, 0.5, 0.5,
-5.168668, -3.584792, 4, 0, 1.5, 0.5, 0.5
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
-4.561285, -3.080969, -5.910622,
-4.561285, 3.63667, -5.910622,
-4.561285, -3.080969, 5.290633,
-4.561285, 3.63667, 5.290633,
-4.561285, -3.080969, -5.910622,
-4.561285, -3.080969, 5.290633,
-4.561285, 3.63667, -5.910622,
-4.561285, 3.63667, 5.290633,
-4.561285, -3.080969, -5.910622,
3.537158, -3.080969, -5.910622,
-4.561285, -3.080969, 5.290633,
3.537158, -3.080969, 5.290633,
-4.561285, 3.63667, -5.910622,
3.537158, 3.63667, -5.910622,
-4.561285, 3.63667, 5.290633,
3.537158, 3.63667, 5.290633,
3.537158, -3.080969, -5.910622,
3.537158, 3.63667, -5.910622,
3.537158, -3.080969, 5.290633,
3.537158, 3.63667, 5.290633,
3.537158, -3.080969, -5.910622,
3.537158, -3.080969, 5.290633,
3.537158, 3.63667, -5.910622,
3.537158, 3.63667, 5.290633
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
var radius = 8.206286;
var distance = 36.51069;
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
mvMatrix.translate( 0.5120631, -0.2778502, 0.3099945 );
mvMatrix.scale( 1.095618, 1.320821, 0.7921252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.51069);
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
cycloate<-read.table("cycloate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cycloate$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
```

```r
y<-cycloate$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
```

```r
z<-cycloate$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
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
-4.443346, -0.01098807, -1.436194, 0, 0, 1, 1, 1,
-3.427011, 0.004100963, -2.151479, 1, 0, 0, 1, 1,
-2.747239, 1.001247, -1.002455, 1, 0, 0, 1, 1,
-2.745751, -0.3363889, -2.076446, 1, 0, 0, 1, 1,
-2.707464, -0.08419032, -2.684917, 1, 0, 0, 1, 1,
-2.693197, -0.328682, -1.787789, 1, 0, 0, 1, 1,
-2.387482, 0.1025552, -1.509963, 0, 0, 0, 1, 1,
-2.387383, -1.089007, 0.1063181, 0, 0, 0, 1, 1,
-2.295409, -1.715135, -2.452649, 0, 0, 0, 1, 1,
-2.249228, 0.1308052, -1.048656, 0, 0, 0, 1, 1,
-2.220218, -1.184575, -1.551619, 0, 0, 0, 1, 1,
-2.187712, -1.327754, -2.941448, 0, 0, 0, 1, 1,
-2.182673, 0.7792009, -1.671603, 0, 0, 0, 1, 1,
-2.161191, 0.02139116, -0.7089172, 1, 1, 1, 1, 1,
-2.128083, -0.6060649, -2.531453, 1, 1, 1, 1, 1,
-2.091338, -2.497752, -3.613394, 1, 1, 1, 1, 1,
-2.085495, 0.8840185, -1.135682, 1, 1, 1, 1, 1,
-2.082999, 1.050442, -1.717557, 1, 1, 1, 1, 1,
-2.076374, -0.2362829, -1.676215, 1, 1, 1, 1, 1,
-2.066222, -0.02971476, -2.427732, 1, 1, 1, 1, 1,
-2.008625, -1.188537, -3.225377, 1, 1, 1, 1, 1,
-1.978303, 0.7815243, -0.6589919, 1, 1, 1, 1, 1,
-1.963575, -1.25625, -0.5712829, 1, 1, 1, 1, 1,
-1.941818, -0.355886, -2.810165, 1, 1, 1, 1, 1,
-1.934463, 0.5508516, -2.571087, 1, 1, 1, 1, 1,
-1.931395, 0.7902245, -0.1897982, 1, 1, 1, 1, 1,
-1.927988, 0.5779018, -0.5246953, 1, 1, 1, 1, 1,
-1.919949, 1.469354, -0.7865188, 1, 1, 1, 1, 1,
-1.884697, -0.7048746, -2.450678, 0, 0, 1, 1, 1,
-1.867752, 0.9158245, -1.169214, 1, 0, 0, 1, 1,
-1.832254, -2.073303, -3.454813, 1, 0, 0, 1, 1,
-1.812714, -0.7882865, -2.311733, 1, 0, 0, 1, 1,
-1.808568, 0.1913942, -0.8113448, 1, 0, 0, 1, 1,
-1.807709, 1.100927, -0.3577235, 1, 0, 0, 1, 1,
-1.799283, -0.1360045, -1.435811, 0, 0, 0, 1, 1,
-1.796159, -1.540342, -1.004237, 0, 0, 0, 1, 1,
-1.792992, 0.01850825, -3.313948, 0, 0, 0, 1, 1,
-1.772754, -0.7372603, -1.915983, 0, 0, 0, 1, 1,
-1.768299, -0.2334967, -2.395081, 0, 0, 0, 1, 1,
-1.766162, -0.2784376, -3.042733, 0, 0, 0, 1, 1,
-1.757515, 1.006637, -1.879332, 0, 0, 0, 1, 1,
-1.752626, 0.9166313, -1.622638, 1, 1, 1, 1, 1,
-1.748886, -0.01605198, -1.184415, 1, 1, 1, 1, 1,
-1.742765, 0.02822643, -4.132539, 1, 1, 1, 1, 1,
-1.724781, -0.9038318, -1.796284, 1, 1, 1, 1, 1,
-1.718701, 0.2512865, -0.9600524, 1, 1, 1, 1, 1,
-1.718507, 0.4986076, -2.030754, 1, 1, 1, 1, 1,
-1.700447, 0.542048, -1.163087, 1, 1, 1, 1, 1,
-1.648037, -1.565, -3.123298, 1, 1, 1, 1, 1,
-1.640527, 0.2802271, -2.492922, 1, 1, 1, 1, 1,
-1.624126, -1.10837, -1.08164, 1, 1, 1, 1, 1,
-1.604627, -1.106052, -3.333909, 1, 1, 1, 1, 1,
-1.600218, -0.4168859, -2.696466, 1, 1, 1, 1, 1,
-1.59338, -0.9728047, -3.143412, 1, 1, 1, 1, 1,
-1.592394, -0.6925858, -2.114344, 1, 1, 1, 1, 1,
-1.578081, -0.3510707, -1.379595, 1, 1, 1, 1, 1,
-1.572572, -0.5773915, -0.6795815, 0, 0, 1, 1, 1,
-1.562838, 0.4910776, -0.475361, 1, 0, 0, 1, 1,
-1.558043, 0.05539821, -0.9906761, 1, 0, 0, 1, 1,
-1.555998, -1.309217, -3.029677, 1, 0, 0, 1, 1,
-1.550446, 1.031299, -2.510692, 1, 0, 0, 1, 1,
-1.541746, 0.1477797, -0.4139546, 1, 0, 0, 1, 1,
-1.537828, -0.2725792, -1.429909, 0, 0, 0, 1, 1,
-1.535447, 0.3409458, -0.6750817, 0, 0, 0, 1, 1,
-1.5221, 0.2445986, -0.2317155, 0, 0, 0, 1, 1,
-1.519711, -1.22297, -0.6135731, 0, 0, 0, 1, 1,
-1.519319, 1.146075, -0.6356256, 0, 0, 0, 1, 1,
-1.505553, -0.8808175, -1.905379, 0, 0, 0, 1, 1,
-1.479387, 0.7980868, -0.6244273, 0, 0, 0, 1, 1,
-1.477352, -0.7606866, -2.025665, 1, 1, 1, 1, 1,
-1.468874, -0.7955588, -1.484487, 1, 1, 1, 1, 1,
-1.462556, 0.2762748, -1.851778, 1, 1, 1, 1, 1,
-1.447975, -0.5534247, -1.231597, 1, 1, 1, 1, 1,
-1.446864, 0.0135665, -2.81849, 1, 1, 1, 1, 1,
-1.431176, -0.4167252, -1.982168, 1, 1, 1, 1, 1,
-1.400672, -0.4020541, -1.141896, 1, 1, 1, 1, 1,
-1.389075, 1.286444, -1.153669, 1, 1, 1, 1, 1,
-1.38467, 0.3372806, -1.242971, 1, 1, 1, 1, 1,
-1.384453, -0.7125519, -1.602447, 1, 1, 1, 1, 1,
-1.381727, 1.829031, -1.637166, 1, 1, 1, 1, 1,
-1.366049, 0.3772856, -2.399973, 1, 1, 1, 1, 1,
-1.358491, 1.340561, -0.5562028, 1, 1, 1, 1, 1,
-1.333493, -1.430929, -3.107642, 1, 1, 1, 1, 1,
-1.321457, 0.4298112, -1.530028, 1, 1, 1, 1, 1,
-1.314103, 0.7801427, -2.673072, 0, 0, 1, 1, 1,
-1.310909, 0.9505972, -0.4435973, 1, 0, 0, 1, 1,
-1.308209, 0.4899773, -2.904954, 1, 0, 0, 1, 1,
-1.308063, -0.5813679, -1.560986, 1, 0, 0, 1, 1,
-1.308052, 0.6674796, -0.905132, 1, 0, 0, 1, 1,
-1.300998, 0.7255591, 0.9085501, 1, 0, 0, 1, 1,
-1.299025, -1.06881, -5.379216, 0, 0, 0, 1, 1,
-1.296723, -1.042478, -1.95277, 0, 0, 0, 1, 1,
-1.296578, -0.3096518, -0.9524341, 0, 0, 0, 1, 1,
-1.286544, 0.7598946, -0.4782838, 0, 0, 0, 1, 1,
-1.286254, -0.5157633, -2.87659, 0, 0, 0, 1, 1,
-1.27986, 0.6934683, -0.7599167, 0, 0, 0, 1, 1,
-1.276879, 0.08010075, -0.9869116, 0, 0, 0, 1, 1,
-1.271943, -0.05077183, -0.6364696, 1, 1, 1, 1, 1,
-1.271001, -1.077536, -1.221982, 1, 1, 1, 1, 1,
-1.267826, -0.08736679, -2.019141, 1, 1, 1, 1, 1,
-1.259028, 0.1322475, -0.527732, 1, 1, 1, 1, 1,
-1.255855, -2.163213, -1.807628, 1, 1, 1, 1, 1,
-1.245706, 0.06087021, -1.135564, 1, 1, 1, 1, 1,
-1.245592, -0.1419208, -2.540437, 1, 1, 1, 1, 1,
-1.243589, -0.7264874, -0.009255524, 1, 1, 1, 1, 1,
-1.236212, 0.174999, -1.891354, 1, 1, 1, 1, 1,
-1.233424, -0.2729422, -1.080635, 1, 1, 1, 1, 1,
-1.229134, -1.36988, -2.319402, 1, 1, 1, 1, 1,
-1.21907, 0.1224224, -0.3238402, 1, 1, 1, 1, 1,
-1.214452, -0.5041763, -1.782153, 1, 1, 1, 1, 1,
-1.209356, -1.113603, -0.2927073, 1, 1, 1, 1, 1,
-1.206684, -1.155653, -0.7319785, 1, 1, 1, 1, 1,
-1.197213, -0.787519, -0.9111627, 0, 0, 1, 1, 1,
-1.194768, -0.7153742, -0.6268542, 1, 0, 0, 1, 1,
-1.194016, -0.5234631, -2.714256, 1, 0, 0, 1, 1,
-1.183508, 0.4499061, 0.1408172, 1, 0, 0, 1, 1,
-1.180652, 0.5410311, 0.01744216, 1, 0, 0, 1, 1,
-1.175766, -0.5684025, -1.567708, 1, 0, 0, 1, 1,
-1.174063, -0.5536026, -3.199163, 0, 0, 0, 1, 1,
-1.171268, -1.147397, -1.595623, 0, 0, 0, 1, 1,
-1.170864, -0.4333853, -2.88579, 0, 0, 0, 1, 1,
-1.16881, 0.2476766, -1.089, 0, 0, 0, 1, 1,
-1.16424, 0.9562355, -1.672662, 0, 0, 0, 1, 1,
-1.161274, 0.7704439, -2.199889, 0, 0, 0, 1, 1,
-1.150547, -1.04432, -2.814091, 0, 0, 0, 1, 1,
-1.133931, -0.5570914, -1.739729, 1, 1, 1, 1, 1,
-1.132065, 0.2027546, -1.803433, 1, 1, 1, 1, 1,
-1.124983, 2.004499, -0.3491743, 1, 1, 1, 1, 1,
-1.123821, -1.204865, -2.549595, 1, 1, 1, 1, 1,
-1.121595, -0.379118, 0.2357316, 1, 1, 1, 1, 1,
-1.110552, -0.06134463, 0.5128543, 1, 1, 1, 1, 1,
-1.108471, 0.6593122, -1.67144, 1, 1, 1, 1, 1,
-1.106536, 0.2940607, -2.553756, 1, 1, 1, 1, 1,
-1.106356, 0.09951771, -0.9020172, 1, 1, 1, 1, 1,
-1.095663, 1.339435, -0.5543377, 1, 1, 1, 1, 1,
-1.094534, -1.821086, -2.156133, 1, 1, 1, 1, 1,
-1.088464, 0.1261237, -2.182614, 1, 1, 1, 1, 1,
-1.08525, -0.7880668, -1.691613, 1, 1, 1, 1, 1,
-1.083757, -0.7194151, -2.740317, 1, 1, 1, 1, 1,
-1.075784, 1.196487, -1.005198, 1, 1, 1, 1, 1,
-1.071669, 0.2538231, -1.381801, 0, 0, 1, 1, 1,
-1.060342, -2.221697, -2.613331, 1, 0, 0, 1, 1,
-1.054934, 0.1615181, 0.3722239, 1, 0, 0, 1, 1,
-1.051212, 0.1228776, -1.797454, 1, 0, 0, 1, 1,
-1.036532, -1.064487, -4.437876, 1, 0, 0, 1, 1,
-1.035566, -0.150708, -3.998277, 1, 0, 0, 1, 1,
-1.03176, -1.286629, -2.659803, 0, 0, 0, 1, 1,
-1.027297, -0.7094268, -3.377165, 0, 0, 0, 1, 1,
-1.022432, 1.151549, -0.03473141, 0, 0, 0, 1, 1,
-1.021629, 1.965916, 0.8934045, 0, 0, 0, 1, 1,
-1.018621, 0.2031375, -0.7588519, 0, 0, 0, 1, 1,
-1.013191, -0.3590441, -0.8925055, 0, 0, 0, 1, 1,
-1.007707, 1.482539, 1.128587, 0, 0, 0, 1, 1,
-1.004012, -0.02117007, 0.1137732, 1, 1, 1, 1, 1,
-0.9974523, -1.337731, -1.649131, 1, 1, 1, 1, 1,
-0.9972743, 0.7307232, -1.250171, 1, 1, 1, 1, 1,
-0.9955379, -1.369254, -2.264385, 1, 1, 1, 1, 1,
-0.9953955, 2.082295, -1.618904, 1, 1, 1, 1, 1,
-0.9938173, 1.013653, -0.07768597, 1, 1, 1, 1, 1,
-0.9894848, -0.4744625, -0.7416754, 1, 1, 1, 1, 1,
-0.9893823, 1.272601, -0.5034684, 1, 1, 1, 1, 1,
-0.9863291, 0.7535689, 0.5624121, 1, 1, 1, 1, 1,
-0.9858316, -1.6528, -2.900695, 1, 1, 1, 1, 1,
-0.9811227, 0.9521978, -0.3605815, 1, 1, 1, 1, 1,
-0.9766564, 0.9917386, -1.680803, 1, 1, 1, 1, 1,
-0.9689503, 1.035215, -2.260731, 1, 1, 1, 1, 1,
-0.9518752, 0.003214641, -3.376056, 1, 1, 1, 1, 1,
-0.9495314, -0.3609587, -2.577892, 1, 1, 1, 1, 1,
-0.9425393, 1.409028, 1.058172, 0, 0, 1, 1, 1,
-0.9383624, -0.9270407, -0.9052736, 1, 0, 0, 1, 1,
-0.9344965, 0.2052314, -0.3747872, 1, 0, 0, 1, 1,
-0.9344639, 0.2645427, -1.980517, 1, 0, 0, 1, 1,
-0.9316812, 0.6361727, 0.7946621, 1, 0, 0, 1, 1,
-0.929832, 1.272616, -1.999822, 1, 0, 0, 1, 1,
-0.9185487, -1.995194, -1.590846, 0, 0, 0, 1, 1,
-0.9178769, 0.2517619, -1.823581, 0, 0, 0, 1, 1,
-0.9178108, -1.681126, -2.325815, 0, 0, 0, 1, 1,
-0.9148165, 0.8097857, -0.08727553, 0, 0, 0, 1, 1,
-0.9099671, -1.641034, -2.421002, 0, 0, 0, 1, 1,
-0.9061617, 1.386711, 0.4003255, 0, 0, 0, 1, 1,
-0.9060768, 2.028874, -0.5910499, 0, 0, 0, 1, 1,
-0.9049484, 0.4678097, -1.884521, 1, 1, 1, 1, 1,
-0.8939919, -0.4067338, -2.471204, 1, 1, 1, 1, 1,
-0.8870445, 0.04307494, -2.847333, 1, 1, 1, 1, 1,
-0.8846502, 1.161244, -1.022631, 1, 1, 1, 1, 1,
-0.8814593, -0.2486277, 0.008983854, 1, 1, 1, 1, 1,
-0.881358, 0.9134324, -2.223548, 1, 1, 1, 1, 1,
-0.880457, 0.3368011, 0.3369201, 1, 1, 1, 1, 1,
-0.8798724, -0.1434199, -0.2921517, 1, 1, 1, 1, 1,
-0.8787667, 0.6660023, -0.8882039, 1, 1, 1, 1, 1,
-0.8769172, 0.6093638, -1.833856, 1, 1, 1, 1, 1,
-0.8616295, -2.471649, -3.325111, 1, 1, 1, 1, 1,
-0.8571522, -1.946194, -1.877471, 1, 1, 1, 1, 1,
-0.8569694, -0.5711851, -2.269946, 1, 1, 1, 1, 1,
-0.855079, -1.506072, -3.680411, 1, 1, 1, 1, 1,
-0.8543653, 0.7662964, -0.7154941, 1, 1, 1, 1, 1,
-0.853108, 1.000187, -0.2114839, 0, 0, 1, 1, 1,
-0.8529248, 0.9096686, -1.156709, 1, 0, 0, 1, 1,
-0.8491496, -0.1168672, -4.191466, 1, 0, 0, 1, 1,
-0.8480542, -0.414264, -1.63806, 1, 0, 0, 1, 1,
-0.843928, 0.5342413, -2.896811, 1, 0, 0, 1, 1,
-0.8424672, -0.1069679, -2.487051, 1, 0, 0, 1, 1,
-0.839975, 1.468597, -0.8871823, 0, 0, 0, 1, 1,
-0.8382904, 0.1349486, -1.970954, 0, 0, 0, 1, 1,
-0.8355974, -0.02045154, -1.773997, 0, 0, 0, 1, 1,
-0.8313918, -0.4682485, -2.627284, 0, 0, 0, 1, 1,
-0.828761, 0.1421827, -2.114023, 0, 0, 0, 1, 1,
-0.8278989, 0.5180334, -1.849961, 0, 0, 0, 1, 1,
-0.8259097, -1.532765, -0.7398639, 0, 0, 0, 1, 1,
-0.825824, -1.306133, -1.641905, 1, 1, 1, 1, 1,
-0.8238121, -1.527915, -2.975764, 1, 1, 1, 1, 1,
-0.8180804, -0.3880693, -1.539408, 1, 1, 1, 1, 1,
-0.817586, -0.4306921, -3.171106, 1, 1, 1, 1, 1,
-0.8159878, -0.9134078, -2.417598, 1, 1, 1, 1, 1,
-0.8095399, 0.5506949, -0.5462721, 1, 1, 1, 1, 1,
-0.8088644, -0.3045702, -2.303939, 1, 1, 1, 1, 1,
-0.8086467, 0.7465001, -1.002671, 1, 1, 1, 1, 1,
-0.8007522, 2.717051, 0.533747, 1, 1, 1, 1, 1,
-0.797889, -1.010154, -2.452989, 1, 1, 1, 1, 1,
-0.7881054, -1.12689, -3.233124, 1, 1, 1, 1, 1,
-0.7844886, 0.06839707, 0.1516361, 1, 1, 1, 1, 1,
-0.7813046, 1.396847, 0.008614577, 1, 1, 1, 1, 1,
-0.7774913, -0.03236142, -0.8471988, 1, 1, 1, 1, 1,
-0.7591164, 0.6217589, 1.342179, 1, 1, 1, 1, 1,
-0.7560226, 2.665653, -0.5031751, 0, 0, 1, 1, 1,
-0.7555947, 1.281421, -2.330791, 1, 0, 0, 1, 1,
-0.7548691, -0.7367395, -2.620368, 1, 0, 0, 1, 1,
-0.7541558, -0.2524683, -3.188315, 1, 0, 0, 1, 1,
-0.7518787, 1.088598, 0.1435838, 1, 0, 0, 1, 1,
-0.7479399, -0.2362629, -2.179481, 1, 0, 0, 1, 1,
-0.7420429, -0.844394, -3.732716, 0, 0, 0, 1, 1,
-0.7414917, -1.207793, -1.684083, 0, 0, 0, 1, 1,
-0.7364559, -1.426916, -1.779488, 0, 0, 0, 1, 1,
-0.7360513, 1.539811, -0.09577876, 0, 0, 0, 1, 1,
-0.732358, -0.5577701, -2.188328, 0, 0, 0, 1, 1,
-0.7288515, 0.1821841, -1.676101, 0, 0, 0, 1, 1,
-0.7265559, -0.1620683, -2.813184, 0, 0, 0, 1, 1,
-0.7227576, -1.201869, -3.518487, 1, 1, 1, 1, 1,
-0.7214638, -0.4180075, -1.265403, 1, 1, 1, 1, 1,
-0.7122361, -1.970256, -0.9187837, 1, 1, 1, 1, 1,
-0.6765897, 0.76749, 1.039143, 1, 1, 1, 1, 1,
-0.6633844, -0.2763189, -1.634063, 1, 1, 1, 1, 1,
-0.6587568, 0.4032289, -1.866864, 1, 1, 1, 1, 1,
-0.6565326, 0.2667529, -3.362415, 1, 1, 1, 1, 1,
-0.653881, 0.6903428, 1.053439, 1, 1, 1, 1, 1,
-0.6532648, 0.3496441, -2.056482, 1, 1, 1, 1, 1,
-0.6525698, 0.8808633, -1.57121, 1, 1, 1, 1, 1,
-0.6516438, -1.618087, -3.444221, 1, 1, 1, 1, 1,
-0.6511713, -0.06632135, -1.205301, 1, 1, 1, 1, 1,
-0.6467216, -1.113406, -1.43532, 1, 1, 1, 1, 1,
-0.6467062, -1.516386, -1.516917, 1, 1, 1, 1, 1,
-0.642058, -2.2934, -2.551842, 1, 1, 1, 1, 1,
-0.6398114, -0.4855779, -3.474819, 0, 0, 1, 1, 1,
-0.6391392, 2.028749, -0.357901, 1, 0, 0, 1, 1,
-0.6369269, -0.9818646, -2.488549, 1, 0, 0, 1, 1,
-0.6354371, 0.7886282, -2.599927, 1, 0, 0, 1, 1,
-0.635138, 0.4285838, -3.064361, 1, 0, 0, 1, 1,
-0.6347239, -0.3233335, -2.508361, 1, 0, 0, 1, 1,
-0.6277565, -0.1615393, -2.177598, 0, 0, 0, 1, 1,
-0.626182, -0.5198259, -3.958449, 0, 0, 0, 1, 1,
-0.6255332, 1.933837, -2.718756, 0, 0, 0, 1, 1,
-0.6244645, -1.055264, -3.617426, 0, 0, 0, 1, 1,
-0.6170714, 0.4588037, -2.022396, 0, 0, 0, 1, 1,
-0.6089989, 1.021975, -0.4426563, 0, 0, 0, 1, 1,
-0.6022852, 2.283034, -1.969603, 0, 0, 0, 1, 1,
-0.5889336, -1.435237, -1.938649, 1, 1, 1, 1, 1,
-0.5847042, 0.2959893, -0.8829917, 1, 1, 1, 1, 1,
-0.5792341, -0.8554557, -1.269396, 1, 1, 1, 1, 1,
-0.5704484, 1.324439, 0.2899638, 1, 1, 1, 1, 1,
-0.5617648, -0.8939416, -3.185402, 1, 1, 1, 1, 1,
-0.5617, -0.6331243, -2.780416, 1, 1, 1, 1, 1,
-0.5610343, -1.07256, -2.405189, 1, 1, 1, 1, 1,
-0.5595298, -1.476145, -3.816287, 1, 1, 1, 1, 1,
-0.5583115, 0.5346438, 0.02634077, 1, 1, 1, 1, 1,
-0.5576424, 1.042983, -3.334421, 1, 1, 1, 1, 1,
-0.5543817, 0.03758924, -0.6966605, 1, 1, 1, 1, 1,
-0.5541166, -0.2670583, -2.824579, 1, 1, 1, 1, 1,
-0.547883, -0.04560212, -2.158718, 1, 1, 1, 1, 1,
-0.5450915, -0.7876804, -1.380892, 1, 1, 1, 1, 1,
-0.5425372, -2.98314, -4.787899, 1, 1, 1, 1, 1,
-0.5414532, 0.7208887, 0.0294609, 0, 0, 1, 1, 1,
-0.5410256, 1.23018, -1.403141, 1, 0, 0, 1, 1,
-0.5404608, -0.4487333, -1.722718, 1, 0, 0, 1, 1,
-0.5171445, -0.4217947, -2.620457, 1, 0, 0, 1, 1,
-0.515265, 0.5262885, -1.430426, 1, 0, 0, 1, 1,
-0.5150508, 0.4271205, -0.759593, 1, 0, 0, 1, 1,
-0.5134633, -1.790735, -2.768834, 0, 0, 0, 1, 1,
-0.5111926, -0.1712004, -1.656052, 0, 0, 0, 1, 1,
-0.5084473, 1.688017, 0.06927165, 0, 0, 0, 1, 1,
-0.4982077, -0.8387138, -3.616523, 0, 0, 0, 1, 1,
-0.497799, 1.578298, 0.3619249, 0, 0, 0, 1, 1,
-0.4966646, 1.487227, -0.8620405, 0, 0, 0, 1, 1,
-0.4900754, -1.403518, -2.62591, 0, 0, 0, 1, 1,
-0.4870103, -0.6868128, -4.21124, 1, 1, 1, 1, 1,
-0.4867217, 0.6254962, -1.001367, 1, 1, 1, 1, 1,
-0.4818464, 0.3864697, -0.2059758, 1, 1, 1, 1, 1,
-0.4787474, -1.717749, -3.863234, 1, 1, 1, 1, 1,
-0.4762758, -1.256112, -2.348772, 1, 1, 1, 1, 1,
-0.475769, -0.1266403, -0.9887614, 1, 1, 1, 1, 1,
-0.4739002, 0.3557251, -0.656233, 1, 1, 1, 1, 1,
-0.4677262, 1.95118, 0.4220093, 1, 1, 1, 1, 1,
-0.4657283, -1.318085, -4.928194, 1, 1, 1, 1, 1,
-0.4651389, -1.095148, -2.950617, 1, 1, 1, 1, 1,
-0.4622063, -0.5006642, -4.004513, 1, 1, 1, 1, 1,
-0.4617344, -0.2567254, -0.9678082, 1, 1, 1, 1, 1,
-0.457846, -1.080424, -3.158524, 1, 1, 1, 1, 1,
-0.45442, -0.02678204, -2.356895, 1, 1, 1, 1, 1,
-0.4541577, 0.9054766, 0.007629241, 1, 1, 1, 1, 1,
-0.453316, -0.05080996, -1.691347, 0, 0, 1, 1, 1,
-0.4502174, 1.837084, -0.7781946, 1, 0, 0, 1, 1,
-0.4467009, -0.167645, -0.4582067, 1, 0, 0, 1, 1,
-0.4460174, -0.7276471, -4.303947, 1, 0, 0, 1, 1,
-0.4369355, 0.3952468, -0.4296646, 1, 0, 0, 1, 1,
-0.4368287, 0.5803854, -0.4511071, 1, 0, 0, 1, 1,
-0.4358619, -1.526203, -2.58141, 0, 0, 0, 1, 1,
-0.4334491, 0.3650448, 1.09819, 0, 0, 0, 1, 1,
-0.431074, 0.7428033, 1.502771, 0, 0, 0, 1, 1,
-0.4296552, 1.43363, -1.246269, 0, 0, 0, 1, 1,
-0.4280262, -0.2534566, -4.409705, 0, 0, 0, 1, 1,
-0.4279863, -0.661604, -1.731231, 0, 0, 0, 1, 1,
-0.4148388, 1.153209, -0.5710562, 0, 0, 0, 1, 1,
-0.4143892, -0.3450297, -2.912497, 1, 1, 1, 1, 1,
-0.4129535, -1.390294, -5.747497, 1, 1, 1, 1, 1,
-0.4121157, -1.442384, -2.28121, 1, 1, 1, 1, 1,
-0.4095897, 0.2750769, 0.7721029, 1, 1, 1, 1, 1,
-0.4053879, -0.8245302, -2.895864, 1, 1, 1, 1, 1,
-0.4053773, 2.667572, -1.049025, 1, 1, 1, 1, 1,
-0.4022032, 1.379191, -1.140592, 1, 1, 1, 1, 1,
-0.3904808, -1.065761, -3.945452, 1, 1, 1, 1, 1,
-0.3885292, 0.5599936, -0.1447939, 1, 1, 1, 1, 1,
-0.3882423, 1.099034, 0.9188429, 1, 1, 1, 1, 1,
-0.3811833, 0.2540705, -0.6423716, 1, 1, 1, 1, 1,
-0.3790371, 1.080467, -0.7211627, 1, 1, 1, 1, 1,
-0.3784521, 1.892346, -0.6995689, 1, 1, 1, 1, 1,
-0.3782631, -0.1622643, -1.448455, 1, 1, 1, 1, 1,
-0.3750091, -0.4736314, -2.42795, 1, 1, 1, 1, 1,
-0.3747005, 0.1593815, -0.6742345, 0, 0, 1, 1, 1,
-0.3720274, -1.588059, -2.971885, 1, 0, 0, 1, 1,
-0.3720096, -0.4094144, -4.151077, 1, 0, 0, 1, 1,
-0.3719826, 1.500591, -0.09773421, 1, 0, 0, 1, 1,
-0.3719344, -0.7686072, -1.927894, 1, 0, 0, 1, 1,
-0.3698739, -0.3949693, -3.808158, 1, 0, 0, 1, 1,
-0.3687794, -0.8001016, -1.785608, 0, 0, 0, 1, 1,
-0.3676577, 1.136912, -1.081422, 0, 0, 0, 1, 1,
-0.3643835, -0.4278572, -3.300382, 0, 0, 0, 1, 1,
-0.3613326, 0.220141, -1.40409, 0, 0, 0, 1, 1,
-0.3506834, 1.322896, -0.792943, 0, 0, 0, 1, 1,
-0.3500928, -0.04427681, -0.2291409, 0, 0, 0, 1, 1,
-0.3464583, 2.111514, -0.179422, 0, 0, 0, 1, 1,
-0.3463733, 0.1246075, -1.041286, 1, 1, 1, 1, 1,
-0.3434863, 0.4351862, -0.7818953, 1, 1, 1, 1, 1,
-0.3413177, -1.60095, -3.83352, 1, 1, 1, 1, 1,
-0.3389905, -0.2584203, -1.654453, 1, 1, 1, 1, 1,
-0.3363204, -1.783674, -3.56399, 1, 1, 1, 1, 1,
-0.3355602, -0.173342, 1.017364, 1, 1, 1, 1, 1,
-0.334547, 0.4602071, -1.045091, 1, 1, 1, 1, 1,
-0.3327146, 1.549678, -0.245466, 1, 1, 1, 1, 1,
-0.3319985, 0.7410383, -0.3645458, 1, 1, 1, 1, 1,
-0.3267393, -0.6351343, -3.243443, 1, 1, 1, 1, 1,
-0.3253507, 0.3914366, 0.3978715, 1, 1, 1, 1, 1,
-0.3175943, 1.167929, -1.958929, 1, 1, 1, 1, 1,
-0.3160071, 0.09551429, -0.6466924, 1, 1, 1, 1, 1,
-0.3099066, 0.6847847, 1.447361, 1, 1, 1, 1, 1,
-0.3002352, 1.684282, 1.533094, 1, 1, 1, 1, 1,
-0.2940934, -1.06497, -2.645419, 0, 0, 1, 1, 1,
-0.2900811, -1.171408, -2.600502, 1, 0, 0, 1, 1,
-0.28933, 0.1972044, -0.3767388, 1, 0, 0, 1, 1,
-0.2842912, -0.09542278, -0.8802082, 1, 0, 0, 1, 1,
-0.2840534, -1.454905, -3.073753, 1, 0, 0, 1, 1,
-0.283807, 0.3436, -1.759175, 1, 0, 0, 1, 1,
-0.2813196, -0.524247, -2.528595, 0, 0, 0, 1, 1,
-0.2762462, -1.302205, -2.707074, 0, 0, 0, 1, 1,
-0.2755741, 0.2508717, -1.80039, 0, 0, 0, 1, 1,
-0.27392, 0.126716, -0.1016448, 0, 0, 0, 1, 1,
-0.273035, 0.7433715, -0.9577684, 0, 0, 0, 1, 1,
-0.2713905, 0.2548452, -3.237165, 0, 0, 0, 1, 1,
-0.2689597, -0.2733936, -1.375099, 0, 0, 0, 1, 1,
-0.2643642, 0.2684653, 0.7629171, 1, 1, 1, 1, 1,
-0.2624129, -0.04575534, -1.566552, 1, 1, 1, 1, 1,
-0.2590541, -1.435282, -2.731657, 1, 1, 1, 1, 1,
-0.2585418, -0.1504046, -3.688825, 1, 1, 1, 1, 1,
-0.2572063, 1.165096, 0.6255058, 1, 1, 1, 1, 1,
-0.2535398, -0.3073466, -2.541442, 1, 1, 1, 1, 1,
-0.2516343, -0.06214335, -2.774029, 1, 1, 1, 1, 1,
-0.2449469, 1.445435, 0.1319084, 1, 1, 1, 1, 1,
-0.2447723, -1.810207, -0.9926478, 1, 1, 1, 1, 1,
-0.2428932, 1.541496, -0.2906453, 1, 1, 1, 1, 1,
-0.2426361, -0.00674556, -2.807098, 1, 1, 1, 1, 1,
-0.2402848, -0.03580366, -1.264239, 1, 1, 1, 1, 1,
-0.235317, 1.789625, 0.09285282, 1, 1, 1, 1, 1,
-0.2322016, -0.1790065, -1.534438, 1, 1, 1, 1, 1,
-0.228899, -0.2461936, -3.552247, 1, 1, 1, 1, 1,
-0.2252583, -2.034264, -2.720407, 0, 0, 1, 1, 1,
-0.2218342, -0.5620364, -2.320022, 1, 0, 0, 1, 1,
-0.219065, 0.06266894, -1.211707, 1, 0, 0, 1, 1,
-0.2168367, 1.776706, -0.2485911, 1, 0, 0, 1, 1,
-0.2160921, 0.6934937, -0.2972352, 1, 0, 0, 1, 1,
-0.2156936, -0.266874, -2.377056, 1, 0, 0, 1, 1,
-0.2149427, 0.4740137, 0.9452359, 0, 0, 0, 1, 1,
-0.208042, -0.2668977, -1.742003, 0, 0, 0, 1, 1,
-0.2035699, -0.140655, -1.932468, 0, 0, 0, 1, 1,
-0.2032959, 1.190123, 1.205772, 0, 0, 0, 1, 1,
-0.200238, -0.7648934, -2.002253, 0, 0, 0, 1, 1,
-0.1997397, 1.32325, -0.7213066, 0, 0, 0, 1, 1,
-0.1969755, 0.5548437, -0.2378434, 0, 0, 0, 1, 1,
-0.1951399, -0.5869179, -2.88843, 1, 1, 1, 1, 1,
-0.1926553, 0.06283504, -2.902094, 1, 1, 1, 1, 1,
-0.1853555, 0.4001602, -0.2797409, 1, 1, 1, 1, 1,
-0.1841396, -1.957685, -4.655047, 1, 1, 1, 1, 1,
-0.1830234, -0.1273513, -1.252474, 1, 1, 1, 1, 1,
-0.1829168, -1.299837, -3.419755, 1, 1, 1, 1, 1,
-0.1771511, 0.07996968, -0.4022465, 1, 1, 1, 1, 1,
-0.1749316, 0.267087, -0.7033437, 1, 1, 1, 1, 1,
-0.1745637, -0.4669085, -2.663192, 1, 1, 1, 1, 1,
-0.1717191, -1.947062, -3.333951, 1, 1, 1, 1, 1,
-0.1705622, -0.09316063, -1.480441, 1, 1, 1, 1, 1,
-0.1655551, -2.663581, -1.461395, 1, 1, 1, 1, 1,
-0.1647786, 1.491757, 0.3771546, 1, 1, 1, 1, 1,
-0.1622623, 0.5186028, 0.9785392, 1, 1, 1, 1, 1,
-0.1604273, -0.7998211, -1.484658, 1, 1, 1, 1, 1,
-0.1592778, 1.616621, -0.3249777, 0, 0, 1, 1, 1,
-0.1591707, -0.4990158, -2.935899, 1, 0, 0, 1, 1,
-0.1567703, 1.809466, -0.665994, 1, 0, 0, 1, 1,
-0.1553269, 0.2821831, 0.2221125, 1, 0, 0, 1, 1,
-0.1540149, -0.7410353, -4.464449, 1, 0, 0, 1, 1,
-0.1531331, 0.5320444, 0.6538241, 1, 0, 0, 1, 1,
-0.1488022, -1.929937, -3.491686, 0, 0, 0, 1, 1,
-0.1446059, 1.435824, -0.2780838, 0, 0, 0, 1, 1,
-0.1442141, 0.8458127, 0.6833073, 0, 0, 0, 1, 1,
-0.135053, 0.2142426, 1.108321, 0, 0, 0, 1, 1,
-0.1318068, -0.6679594, -1.659445, 0, 0, 0, 1, 1,
-0.1301987, -1.072412, -4.096448, 0, 0, 0, 1, 1,
-0.1288369, -0.2833313, -2.418747, 0, 0, 0, 1, 1,
-0.1223771, -0.04332369, -3.512377, 1, 1, 1, 1, 1,
-0.115204, -1.027302, -3.736259, 1, 1, 1, 1, 1,
-0.1142311, 1.680128, -1.694253, 1, 1, 1, 1, 1,
-0.1096331, -1.207901, -3.28121, 1, 1, 1, 1, 1,
-0.1076096, 0.3747485, 0.4740912, 1, 1, 1, 1, 1,
-0.1075153, -1.25013, -2.531157, 1, 1, 1, 1, 1,
-0.1068234, -0.2856071, -0.7029819, 1, 1, 1, 1, 1,
-0.1033085, -1.382633, -0.5470634, 1, 1, 1, 1, 1,
-0.1026107, 0.8701072, 0.6320232, 1, 1, 1, 1, 1,
-0.1007786, -1.444963, -3.243821, 1, 1, 1, 1, 1,
-0.09987932, 0.4432189, -0.4735647, 1, 1, 1, 1, 1,
-0.0990379, -0.0845244, -1.322383, 1, 1, 1, 1, 1,
-0.09572849, -1.690726, -4.959987, 1, 1, 1, 1, 1,
-0.09498834, -0.7995499, -4.176929, 1, 1, 1, 1, 1,
-0.09151956, 0.4871677, 0.1027484, 1, 1, 1, 1, 1,
-0.09101782, 0.3720251, 0.1244934, 0, 0, 1, 1, 1,
-0.09045173, -1.162901, -3.284743, 1, 0, 0, 1, 1,
-0.08670105, -0.0586153, -1.679858, 1, 0, 0, 1, 1,
-0.07219027, 0.283042, 0.3349742, 1, 0, 0, 1, 1,
-0.06700287, -1.155542, -4.752035, 1, 0, 0, 1, 1,
-0.06670636, -1.776027, -4.096498, 1, 0, 0, 1, 1,
-0.06415751, -1.673242, -4.48188, 0, 0, 0, 1, 1,
-0.06415094, -0.02950583, -0.9911999, 0, 0, 0, 1, 1,
-0.06152143, 0.07936683, 1.508406, 0, 0, 0, 1, 1,
-0.05002512, -0.292007, -4.055351, 0, 0, 0, 1, 1,
-0.04550632, 0.8429959, -1.02444, 0, 0, 0, 1, 1,
-0.04190718, 1.80471, 0.8986701, 0, 0, 0, 1, 1,
-0.03181051, -0.9812392, -2.383919, 0, 0, 0, 1, 1,
-0.03179023, -0.78031, -3.93292, 1, 1, 1, 1, 1,
-0.0292913, 0.6394985, 0.07922596, 1, 1, 1, 1, 1,
-0.02915965, -1.739998, -2.309666, 1, 1, 1, 1, 1,
-0.02730603, -0.1081244, -3.882558, 1, 1, 1, 1, 1,
-0.026045, 0.8218552, -0.2204317, 1, 1, 1, 1, 1,
-0.02299546, -0.08856671, -1.140084, 1, 1, 1, 1, 1,
-0.0192964, 1.19297, 0.7527235, 1, 1, 1, 1, 1,
-0.01894718, 0.1132298, -0.6023541, 1, 1, 1, 1, 1,
-0.01654361, 0.05630305, -0.6573427, 1, 1, 1, 1, 1,
-0.01164378, -0.6018198, -2.576988, 1, 1, 1, 1, 1,
-0.011595, -1.104057, -3.622794, 1, 1, 1, 1, 1,
-0.008562933, -0.6816152, -2.327166, 1, 1, 1, 1, 1,
-0.006209873, 0.01707357, 0.3813637, 1, 1, 1, 1, 1,
-0.003952966, -0.1965481, -2.338217, 1, 1, 1, 1, 1,
-0.003895154, 0.7215583, 1.32511, 1, 1, 1, 1, 1,
-0.00272375, -0.371976, -2.819213, 0, 0, 1, 1, 1,
1.599622e-05, 0.730303, 0.046489, 1, 0, 0, 1, 1,
0.001742129, 1.23129, -0.9165646, 1, 0, 0, 1, 1,
0.00314007, -1.233013, 2.762584, 1, 0, 0, 1, 1,
0.006859255, -0.8260476, 4.204759, 1, 0, 0, 1, 1,
0.007496121, -0.4600206, 2.932988, 1, 0, 0, 1, 1,
0.007796962, 0.4820977, 0.2528953, 0, 0, 0, 1, 1,
0.01219238, 0.05929533, -0.7959424, 0, 0, 0, 1, 1,
0.01303665, -2.698933, 3.996653, 0, 0, 0, 1, 1,
0.01460852, -0.6863583, 3.569622, 0, 0, 0, 1, 1,
0.01496729, -0.1310465, 2.29882, 0, 0, 0, 1, 1,
0.01511998, 0.172714, 0.08782791, 0, 0, 0, 1, 1,
0.01757559, -1.192239, 1.574737, 0, 0, 0, 1, 1,
0.02017948, -0.9341261, 3.797721, 1, 1, 1, 1, 1,
0.02479371, -0.2598318, 3.554842, 1, 1, 1, 1, 1,
0.02481034, 0.5851741, -2.079678, 1, 1, 1, 1, 1,
0.02714387, 1.619407, 2.410541, 1, 1, 1, 1, 1,
0.03110631, -1.183118, 3.985252, 1, 1, 1, 1, 1,
0.03290288, -0.536553, 2.196377, 1, 1, 1, 1, 1,
0.0330181, 0.5345303, -0.5561904, 1, 1, 1, 1, 1,
0.03371903, -0.7626587, 2.232462, 1, 1, 1, 1, 1,
0.03558505, -0.04853419, 3.39837, 1, 1, 1, 1, 1,
0.03950999, 0.2924896, 1.219398, 1, 1, 1, 1, 1,
0.04014214, -0.6588814, 2.448044, 1, 1, 1, 1, 1,
0.04234175, 0.1547476, -0.3382759, 1, 1, 1, 1, 1,
0.04388308, -1.564972, 3.658208, 1, 1, 1, 1, 1,
0.04550381, -0.5881549, 4.326696, 1, 1, 1, 1, 1,
0.04941716, -1.383796, 1.738012, 1, 1, 1, 1, 1,
0.05232935, 0.4220232, 0.7017923, 0, 0, 1, 1, 1,
0.05408882, -2.41039, 4.253207, 1, 0, 0, 1, 1,
0.05504105, 0.6086408, -1.017122, 1, 0, 0, 1, 1,
0.0589545, -0.9098287, 3.428015, 1, 0, 0, 1, 1,
0.06012521, 0.06279352, 1.478342, 1, 0, 0, 1, 1,
0.06466287, -1.326137, 3.178475, 1, 0, 0, 1, 1,
0.06725045, -0.9327219, 3.562121, 0, 0, 0, 1, 1,
0.07071377, 0.7116412, 1.039338, 0, 0, 0, 1, 1,
0.07107417, -0.6155143, 3.443394, 0, 0, 0, 1, 1,
0.07601873, -0.0009741261, 2.633054, 0, 0, 0, 1, 1,
0.07699202, 0.4731055, -2.225995, 0, 0, 0, 1, 1,
0.0791542, 1.314909, 0.1381965, 0, 0, 0, 1, 1,
0.07980415, 0.07372033, 1.010814, 0, 0, 0, 1, 1,
0.08307929, -0.1634489, 4.099261, 1, 1, 1, 1, 1,
0.08466594, 0.977053, -0.3931523, 1, 1, 1, 1, 1,
0.08775537, -1.159847, 4.324052, 1, 1, 1, 1, 1,
0.09041195, -1.171877, 2.733191, 1, 1, 1, 1, 1,
0.09184215, 0.4264847, 0.5434965, 1, 1, 1, 1, 1,
0.09650724, 1.778907, -0.6433785, 1, 1, 1, 1, 1,
0.09891677, -1.44574, 2.64609, 1, 1, 1, 1, 1,
0.1015886, 0.1468144, 0.8752831, 1, 1, 1, 1, 1,
0.1021371, 1.696251, 0.8443122, 1, 1, 1, 1, 1,
0.1025651, -0.8522754, 2.508907, 1, 1, 1, 1, 1,
0.1028035, 0.01044308, 2.737526, 1, 1, 1, 1, 1,
0.1069851, 0.3221319, -0.3985896, 1, 1, 1, 1, 1,
0.1107192, 0.07430245, 1.814542, 1, 1, 1, 1, 1,
0.1189557, 0.6369278, -1.080012, 1, 1, 1, 1, 1,
0.1223274, 0.8450294, 1.641573, 1, 1, 1, 1, 1,
0.1224609, 1.605833, -0.3174819, 0, 0, 1, 1, 1,
0.1253276, -1.246946, 1.736556, 1, 0, 0, 1, 1,
0.1285806, -0.0432036, 1.921177, 1, 0, 0, 1, 1,
0.1325893, -1.147724, 3.268217, 1, 0, 0, 1, 1,
0.1338172, -2.370685, 3.206937, 1, 0, 0, 1, 1,
0.1364789, 0.02675739, 3.400589, 1, 0, 0, 1, 1,
0.1403669, -1.134295, 1.768292, 0, 0, 0, 1, 1,
0.143498, -0.2106143, 2.602086, 0, 0, 0, 1, 1,
0.148164, -1.435398, 2.281523, 0, 0, 0, 1, 1,
0.1520803, -1.021204, 0.7207806, 0, 0, 0, 1, 1,
0.1547524, -1.09796, 2.534276, 0, 0, 0, 1, 1,
0.1576191, -0.5824403, 5.127508, 0, 0, 0, 1, 1,
0.1581064, 0.1187616, 2.320397, 0, 0, 0, 1, 1,
0.1638826, 0.1451734, 2.124574, 1, 1, 1, 1, 1,
0.1649585, 0.4840262, -1.276411, 1, 1, 1, 1, 1,
0.1730861, -0.5176802, 3.67675, 1, 1, 1, 1, 1,
0.1772699, 0.00805729, 1.384989, 1, 1, 1, 1, 1,
0.1773234, 0.1076396, 0.8863865, 1, 1, 1, 1, 1,
0.1778166, -1.554257, 2.427909, 1, 1, 1, 1, 1,
0.1784412, -1.499868, 3.064205, 1, 1, 1, 1, 1,
0.1870303, 1.475476, -0.4845575, 1, 1, 1, 1, 1,
0.1886211, 1.157757, 0.2306728, 1, 1, 1, 1, 1,
0.1892934, -0.6642288, 1.651349, 1, 1, 1, 1, 1,
0.1900198, -0.9159741, 2.477072, 1, 1, 1, 1, 1,
0.1916259, -0.3494548, 1.960426, 1, 1, 1, 1, 1,
0.197238, 1.940123, -1.192636, 1, 1, 1, 1, 1,
0.1989205, -0.2806323, 2.46114, 1, 1, 1, 1, 1,
0.200179, -1.031638, 3.345613, 1, 1, 1, 1, 1,
0.2052628, 1.06007, 0.3790326, 0, 0, 1, 1, 1,
0.2056859, -0.5106389, 4.451963, 1, 0, 0, 1, 1,
0.2058111, -0.7321057, 2.985516, 1, 0, 0, 1, 1,
0.2152672, -0.7094358, 2.770587, 1, 0, 0, 1, 1,
0.2159012, -0.3538922, 3.321749, 1, 0, 0, 1, 1,
0.2191891, -0.6443765, 2.834597, 1, 0, 0, 1, 1,
0.2207793, -0.04213706, 0.5125761, 0, 0, 0, 1, 1,
0.2222771, -0.4501142, 2.489754, 0, 0, 0, 1, 1,
0.2278097, -0.3549799, 1.000054, 0, 0, 0, 1, 1,
0.2292384, -0.3088029, 2.317448, 0, 0, 0, 1, 1,
0.2370994, -0.7104273, 4.000879, 0, 0, 0, 1, 1,
0.2397284, 2.076294, -0.1338338, 0, 0, 0, 1, 1,
0.2405699, -0.1568716, 1.589512, 0, 0, 0, 1, 1,
0.2406812, -0.07891881, 1.005424, 1, 1, 1, 1, 1,
0.2424444, 1.773125, 0.3988054, 1, 1, 1, 1, 1,
0.24251, -2.198805, 1.980945, 1, 1, 1, 1, 1,
0.2482368, -2.118582, 2.801295, 1, 1, 1, 1, 1,
0.2501974, -0.6369668, 4.394907, 1, 1, 1, 1, 1,
0.253921, -0.2103785, 2.441494, 1, 1, 1, 1, 1,
0.2582539, -0.7464681, 3.823986, 1, 1, 1, 1, 1,
0.2644078, 0.7219677, -0.0456697, 1, 1, 1, 1, 1,
0.2644466, -1.135781, 3.367226, 1, 1, 1, 1, 1,
0.2652034, 0.5589456, 2.144555, 1, 1, 1, 1, 1,
0.2687077, 1.110123, 0.3106591, 1, 1, 1, 1, 1,
0.2693244, -0.2603484, 2.612254, 1, 1, 1, 1, 1,
0.2704053, 1.74285, -0.9022433, 1, 1, 1, 1, 1,
0.2744741, 1.112494, 0.6858507, 1, 1, 1, 1, 1,
0.2748774, 0.5456544, -0.1252832, 1, 1, 1, 1, 1,
0.2755965, -0.7823504, 3.139159, 0, 0, 1, 1, 1,
0.2823083, -0.1921094, 2.007939, 1, 0, 0, 1, 1,
0.285474, 1.337682, -0.2718588, 1, 0, 0, 1, 1,
0.2871527, -1.494439, 3.02931, 1, 0, 0, 1, 1,
0.287618, 0.08941977, 1.308948, 1, 0, 0, 1, 1,
0.288354, -0.1706917, 2.420699, 1, 0, 0, 1, 1,
0.2884848, -1.178047, 3.338461, 0, 0, 0, 1, 1,
0.2910751, -0.2114777, 2.47077, 0, 0, 0, 1, 1,
0.2911819, -0.2547612, -0.2799931, 0, 0, 0, 1, 1,
0.2915383, -0.6328157, 3.47267, 0, 0, 0, 1, 1,
0.2929513, -0.3572252, 3.003426, 0, 0, 0, 1, 1,
0.2962374, -0.3650365, 3.219294, 0, 0, 0, 1, 1,
0.3034042, 0.1824472, 0.6157715, 0, 0, 0, 1, 1,
0.3035283, 2.47341, -0.5179262, 1, 1, 1, 1, 1,
0.3060219, 1.16146, 1.147085, 1, 1, 1, 1, 1,
0.3065833, 1.172238, -0.2049366, 1, 1, 1, 1, 1,
0.307891, -0.1114294, 1.413976, 1, 1, 1, 1, 1,
0.3109014, -0.1451712, 1.5629, 1, 1, 1, 1, 1,
0.3112675, 0.1851709, 2.687367, 1, 1, 1, 1, 1,
0.3136913, 0.6316239, 1.651795, 1, 1, 1, 1, 1,
0.319942, 0.5477364, 0.8610687, 1, 1, 1, 1, 1,
0.3210554, 0.3607308, 0.1612137, 1, 1, 1, 1, 1,
0.3215423, 1.408552, 0.1608425, 1, 1, 1, 1, 1,
0.322613, -0.4334002, 1.640024, 1, 1, 1, 1, 1,
0.3230409, 0.3231726, 1.220762, 1, 1, 1, 1, 1,
0.3250789, -0.7992874, 3.261893, 1, 1, 1, 1, 1,
0.328729, -1.439403, 3.142539, 1, 1, 1, 1, 1,
0.3311646, -0.1878824, 1.873656, 1, 1, 1, 1, 1,
0.3341501, 0.1201226, -0.1738528, 0, 0, 1, 1, 1,
0.3384875, 1.416886, 1.818808, 1, 0, 0, 1, 1,
0.3405379, -0.589401, 3.614961, 1, 0, 0, 1, 1,
0.3408338, 2.003131, 3.114705, 1, 0, 0, 1, 1,
0.3465961, 1.703203, -0.8252982, 1, 0, 0, 1, 1,
0.3543071, 0.1636109, 2.044606, 1, 0, 0, 1, 1,
0.3550328, 1.72295, 1.106291, 0, 0, 0, 1, 1,
0.3612534, 0.7695014, 0.9340211, 0, 0, 0, 1, 1,
0.362644, -0.1289159, 0.9308472, 0, 0, 0, 1, 1,
0.3639142, 0.03410853, 1.840397, 0, 0, 0, 1, 1,
0.3680479, -0.53953, 1.836986, 0, 0, 0, 1, 1,
0.3710324, 0.2214973, 1.577067, 0, 0, 0, 1, 1,
0.3715093, -0.1785965, 0.8941276, 0, 0, 0, 1, 1,
0.3742378, 0.04177795, 1.198654, 1, 1, 1, 1, 1,
0.3765948, 1.152535, -0.8859893, 1, 1, 1, 1, 1,
0.3778598, 0.1748538, 1.386659, 1, 1, 1, 1, 1,
0.3841705, 0.913893, 1.493166, 1, 1, 1, 1, 1,
0.3842197, -0.3067295, 4.822292, 1, 1, 1, 1, 1,
0.3853579, -0.826717, 1.656665, 1, 1, 1, 1, 1,
0.393259, -0.5753998, 1.137985, 1, 1, 1, 1, 1,
0.3946961, 0.5041094, 1.122282, 1, 1, 1, 1, 1,
0.3981315, 0.9931965, -0.7871531, 1, 1, 1, 1, 1,
0.4036723, -0.5776047, 1.7577, 1, 1, 1, 1, 1,
0.4044172, 0.2347999, 2.212568, 1, 1, 1, 1, 1,
0.4110051, 0.9089544, 0.06771912, 1, 1, 1, 1, 1,
0.4113943, -2.021669, 1.692655, 1, 1, 1, 1, 1,
0.4151279, -0.6358977, 2.038865, 1, 1, 1, 1, 1,
0.4203879, 1.309214, 0.5331805, 1, 1, 1, 1, 1,
0.42262, 1.723167, 0.778986, 0, 0, 1, 1, 1,
0.428004, 0.7793166, -0.6044216, 1, 0, 0, 1, 1,
0.4283942, -0.6943176, 2.324752, 1, 0, 0, 1, 1,
0.4400748, -1.776407, 1.516438, 1, 0, 0, 1, 1,
0.4503458, 0.8594449, 1.153249, 1, 0, 0, 1, 1,
0.4538414, -0.5521969, 3.709804, 1, 0, 0, 1, 1,
0.4586465, 0.07789723, 0.8349599, 0, 0, 0, 1, 1,
0.4603387, -0.8274134, 1.169646, 0, 0, 0, 1, 1,
0.4605554, 1.006072, 1.254709, 0, 0, 0, 1, 1,
0.4609708, 1.303191, 1.62869, 0, 0, 0, 1, 1,
0.4647024, 0.553847, 1.266152, 0, 0, 0, 1, 1,
0.4682154, 1.22565, -0.4243315, 0, 0, 0, 1, 1,
0.4712344, 0.3389309, 0.3892341, 0, 0, 0, 1, 1,
0.4746046, 0.7400275, -1.058727, 1, 1, 1, 1, 1,
0.4769161, -0.5663647, 0.7842259, 1, 1, 1, 1, 1,
0.4770367, 0.0523245, 1.389663, 1, 1, 1, 1, 1,
0.4784915, 1.13939, 0.3896338, 1, 1, 1, 1, 1,
0.4786026, 0.1765284, -0.8248717, 1, 1, 1, 1, 1,
0.4794011, -0.1751534, 2.308613, 1, 1, 1, 1, 1,
0.4800374, 1.002455, -0.5887049, 1, 1, 1, 1, 1,
0.4801903, 2.229203, 0.2821603, 1, 1, 1, 1, 1,
0.4838007, 0.1196832, 0.07595685, 1, 1, 1, 1, 1,
0.4876517, 0.03245938, 0.889345, 1, 1, 1, 1, 1,
0.4881312, -0.5209696, 4.449995, 1, 1, 1, 1, 1,
0.4940025, -1.228064, 1.655378, 1, 1, 1, 1, 1,
0.4975488, -1.486168, 4.200259, 1, 1, 1, 1, 1,
0.4984297, -0.3823303, 3.757319, 1, 1, 1, 1, 1,
0.5028911, -0.9135128, 1.329228, 1, 1, 1, 1, 1,
0.5039244, -0.4851967, 2.63328, 0, 0, 1, 1, 1,
0.5056166, 0.6971539, 0.1009503, 1, 0, 0, 1, 1,
0.5086663, 1.009725, 0.3643669, 1, 0, 0, 1, 1,
0.5088217, 1.062267, 2.200122, 1, 0, 0, 1, 1,
0.5162027, 1.503479, -0.06636278, 1, 0, 0, 1, 1,
0.5176846, 0.1382297, 1.393329, 1, 0, 0, 1, 1,
0.5243304, -0.8887388, 2.949945, 0, 0, 0, 1, 1,
0.5259827, 0.1398667, 0.01049932, 0, 0, 0, 1, 1,
0.5263276, -2.398698, 2.544482, 0, 0, 0, 1, 1,
0.5292885, 0.2531863, -0.009424097, 0, 0, 0, 1, 1,
0.5306925, -1.160063, 1.040117, 0, 0, 0, 1, 1,
0.5337002, -0.05908394, 2.152486, 0, 0, 0, 1, 1,
0.5352388, 0.4344281, 1.448585, 0, 0, 0, 1, 1,
0.5364525, 0.6484253, -0.1902589, 1, 1, 1, 1, 1,
0.5384043, -0.07077485, 1.420911, 1, 1, 1, 1, 1,
0.5467486, 0.553202, -0.1916253, 1, 1, 1, 1, 1,
0.5470861, 0.04638086, 3.196876, 1, 1, 1, 1, 1,
0.5493976, 0.421706, 0.6587787, 1, 1, 1, 1, 1,
0.5519403, 0.6523182, 0.5314836, 1, 1, 1, 1, 1,
0.5564429, -1.553829, 3.256561, 1, 1, 1, 1, 1,
0.5574163, 0.7972528, 0.3801405, 1, 1, 1, 1, 1,
0.5622487, 0.0297323, 1.285407, 1, 1, 1, 1, 1,
0.5688834, -0.03140544, 2.371893, 1, 1, 1, 1, 1,
0.5706552, 0.4199777, -0.2482789, 1, 1, 1, 1, 1,
0.5715294, 0.6535924, -0.4045382, 1, 1, 1, 1, 1,
0.5717577, 0.4815112, 1.45637, 1, 1, 1, 1, 1,
0.5737723, -0.247096, 1.037756, 1, 1, 1, 1, 1,
0.5745658, -0.2847969, 1.934813, 1, 1, 1, 1, 1,
0.5749444, 0.6229135, 2.042757, 0, 0, 1, 1, 1,
0.5803609, 0.02242246, 1.043961, 1, 0, 0, 1, 1,
0.585751, 1.999579, 1.726007, 1, 0, 0, 1, 1,
0.5889637, -0.2701935, 0.01396614, 1, 0, 0, 1, 1,
0.5921148, -0.5666181, 3.000029, 1, 0, 0, 1, 1,
0.5941372, -0.2591074, 1.373885, 1, 0, 0, 1, 1,
0.5993403, -0.961984, 3.436487, 0, 0, 0, 1, 1,
0.6049452, -0.9656498, 2.547891, 0, 0, 0, 1, 1,
0.6129603, -0.82906, 3.484516, 0, 0, 0, 1, 1,
0.6182961, -1.381262, 2.009272, 0, 0, 0, 1, 1,
0.6210361, 0.9080262, 2.99934, 0, 0, 0, 1, 1,
0.622901, -0.5770392, 1.247216, 0, 0, 0, 1, 1,
0.6308587, -0.2397589, 1.743767, 0, 0, 0, 1, 1,
0.6312954, -0.942038, 0.4394041, 1, 1, 1, 1, 1,
0.6327157, 0.7161021, -0.08765078, 1, 1, 1, 1, 1,
0.6334682, 1.02854, -0.1762843, 1, 1, 1, 1, 1,
0.6350801, -0.8814671, 3.462095, 1, 1, 1, 1, 1,
0.6434923, -0.1900311, 3.578482, 1, 1, 1, 1, 1,
0.6443101, 0.7742491, 0.7316197, 1, 1, 1, 1, 1,
0.6460478, -0.7606095, 2.225584, 1, 1, 1, 1, 1,
0.6467182, -0.3763294, 4.54658, 1, 1, 1, 1, 1,
0.6478157, -1.253554, 4.152735, 1, 1, 1, 1, 1,
0.6502209, 0.5419623, 1.904507, 1, 1, 1, 1, 1,
0.6568347, -1.801254, 2.665775, 1, 1, 1, 1, 1,
0.6571236, -0.2804604, 1.331654, 1, 1, 1, 1, 1,
0.660133, 1.004465, 0.117342, 1, 1, 1, 1, 1,
0.662011, -0.2308357, 1.19555, 1, 1, 1, 1, 1,
0.6625681, -0.5189471, 1.062039, 1, 1, 1, 1, 1,
0.6630418, -0.8039317, 2.063144, 0, 0, 1, 1, 1,
0.6644457, -0.5507994, 2.060266, 1, 0, 0, 1, 1,
0.6674131, 1.949339, -0.8126027, 1, 0, 0, 1, 1,
0.6676157, -1.121755, 2.003415, 1, 0, 0, 1, 1,
0.6678412, -0.4073046, 1.404072, 1, 0, 0, 1, 1,
0.669455, 1.057524, 0.6124159, 1, 0, 0, 1, 1,
0.6765069, -0.3633616, 0.9968883, 0, 0, 0, 1, 1,
0.6772722, -1.660586, 3.825175, 0, 0, 0, 1, 1,
0.6784649, -0.6223772, 1.680446, 0, 0, 0, 1, 1,
0.6793057, -0.8400359, 2.450099, 0, 0, 0, 1, 1,
0.6812099, 1.257147, 0.1514779, 0, 0, 0, 1, 1,
0.6832511, -1.622564, 2.748972, 0, 0, 0, 1, 1,
0.6852558, 0.7237848, 0.3574233, 0, 0, 0, 1, 1,
0.6902502, -0.187542, -1.030426, 1, 1, 1, 1, 1,
0.69485, 0.07935375, -0.1303951, 1, 1, 1, 1, 1,
0.6952186, 1.061974, -0.3053765, 1, 1, 1, 1, 1,
0.6990416, 1.102883, -0.4382548, 1, 1, 1, 1, 1,
0.6996634, 0.3163971, 2.336457, 1, 1, 1, 1, 1,
0.7005337, -0.899112, 1.951157, 1, 1, 1, 1, 1,
0.7028604, 0.2636173, -0.7189934, 1, 1, 1, 1, 1,
0.7050559, -1.591155, 2.506234, 1, 1, 1, 1, 1,
0.7067785, -0.2982119, 3.163127, 1, 1, 1, 1, 1,
0.7125313, 1.309313, -1.800223, 1, 1, 1, 1, 1,
0.7241056, 2.311318, 0.3721125, 1, 1, 1, 1, 1,
0.7261098, -1.295573, 1.937893, 1, 1, 1, 1, 1,
0.7268789, -0.4747474, 1.235057, 1, 1, 1, 1, 1,
0.734482, 1.476222, -0.8261353, 1, 1, 1, 1, 1,
0.7380747, 0.7642415, -0.5148792, 1, 1, 1, 1, 1,
0.7444149, -0.7084824, 3.319295, 0, 0, 1, 1, 1,
0.7457636, -1.268199, 3.827703, 1, 0, 0, 1, 1,
0.7472886, 0.05966514, 2.271114, 1, 0, 0, 1, 1,
0.747763, 0.5800948, 1.558516, 1, 0, 0, 1, 1,
0.749543, 1.10454, -0.6275464, 1, 0, 0, 1, 1,
0.7504579, -0.3110845, 3.612636, 1, 0, 0, 1, 1,
0.7512784, 1.039631, 0.7746431, 0, 0, 0, 1, 1,
0.7583607, 0.6509707, 1.206027, 0, 0, 0, 1, 1,
0.766606, 1.336283, -0.500699, 0, 0, 0, 1, 1,
0.7673001, -0.7870314, 3.077673, 0, 0, 0, 1, 1,
0.7696027, -1.145799, 2.829696, 0, 0, 0, 1, 1,
0.7714685, -0.7138852, 2.736844, 0, 0, 0, 1, 1,
0.7768369, 0.240475, 3.129901, 0, 0, 0, 1, 1,
0.7793437, -1.127758, 3.258492, 1, 1, 1, 1, 1,
0.7824326, -0.4336497, 2.963715, 1, 1, 1, 1, 1,
0.7852294, -1.412691, 4.027787, 1, 1, 1, 1, 1,
0.7880332, 0.2722397, 0.7966916, 1, 1, 1, 1, 1,
0.7899703, -0.2797315, 0.2622026, 1, 1, 1, 1, 1,
0.791272, 1.107434, -0.7826795, 1, 1, 1, 1, 1,
0.7918506, -1.471865, 3.125296, 1, 1, 1, 1, 1,
0.7973903, 0.4332706, 1.3657, 1, 1, 1, 1, 1,
0.8034543, 0.8184811, -0.2955576, 1, 1, 1, 1, 1,
0.8061723, 1.127233, 0.1148573, 1, 1, 1, 1, 1,
0.8104348, 1.172714, 1.010746, 1, 1, 1, 1, 1,
0.810742, -0.2842571, 1.862709, 1, 1, 1, 1, 1,
0.8196312, -0.3074044, -0.5528479, 1, 1, 1, 1, 1,
0.8281266, -0.04852346, 1.362638, 1, 1, 1, 1, 1,
0.8364172, -2.002843, 1.044214, 1, 1, 1, 1, 1,
0.8423184, 1.496111, 2.210877, 0, 0, 1, 1, 1,
0.8466073, 0.2157539, 1.742817, 1, 0, 0, 1, 1,
0.8490901, 0.01633025, 1.627481, 1, 0, 0, 1, 1,
0.8530893, 2.175238, 0.2159983, 1, 0, 0, 1, 1,
0.8531061, -0.8885507, 1.392075, 1, 0, 0, 1, 1,
0.8531328, -0.1995832, 1.503338, 1, 0, 0, 1, 1,
0.8599343, 0.1934436, 0.8640534, 0, 0, 0, 1, 1,
0.861143, 0.5080203, 2.775943, 0, 0, 0, 1, 1,
0.8619544, -0.3409884, 3.01505, 0, 0, 0, 1, 1,
0.8629791, 0.2126388, 2.20699, 0, 0, 0, 1, 1,
0.8635789, 0.8547722, 0.7475808, 0, 0, 0, 1, 1,
0.8668331, 1.344783, 1.365972, 0, 0, 0, 1, 1,
0.87097, 1.076655, 0.1344564, 0, 0, 0, 1, 1,
0.8712528, 1.74518, -0.811382, 1, 1, 1, 1, 1,
0.8729517, -0.225443, 2.840313, 1, 1, 1, 1, 1,
0.8737366, -0.5575803, 2.464102, 1, 1, 1, 1, 1,
0.8873306, 0.05103809, 2.26438, 1, 1, 1, 1, 1,
0.8923569, 1.345087, 2.940757, 1, 1, 1, 1, 1,
0.9028607, 0.8909066, 1.21125, 1, 1, 1, 1, 1,
0.906381, 0.6214658, 2.013631, 1, 1, 1, 1, 1,
0.9070227, -0.5209005, 3.558147, 1, 1, 1, 1, 1,
0.9142029, -0.4104425, 3.829602, 1, 1, 1, 1, 1,
0.91482, -1.31488, 1.614776, 1, 1, 1, 1, 1,
0.9160362, 0.3546316, 1.834137, 1, 1, 1, 1, 1,
0.9173298, -0.02268179, 2.096372, 1, 1, 1, 1, 1,
0.9185482, -0.1375656, 1.801265, 1, 1, 1, 1, 1,
0.9206474, -0.8137466, 1.471365, 1, 1, 1, 1, 1,
0.9220333, 0.03077511, 1.951136, 1, 1, 1, 1, 1,
0.9233763, 0.3184076, 2.004825, 0, 0, 1, 1, 1,
0.9247313, -1.70991, 1.161633, 1, 0, 0, 1, 1,
0.931272, 0.5345008, -0.05591831, 1, 0, 0, 1, 1,
0.9369977, -0.4297584, 2.138452, 1, 0, 0, 1, 1,
0.9406686, 0.9467353, 0.9488937, 1, 0, 0, 1, 1,
0.9416792, 0.8474391, 0.1177276, 1, 0, 0, 1, 1,
0.9433603, 0.5110776, 1.678982, 0, 0, 0, 1, 1,
0.9494129, 0.0975254, 1.727314, 0, 0, 0, 1, 1,
0.9639263, 0.8487085, 0.4466083, 0, 0, 0, 1, 1,
0.9653541, -0.9715549, 1.844737, 0, 0, 0, 1, 1,
0.9659371, -1.379325, 0.4999219, 0, 0, 0, 1, 1,
0.9808986, 1.343047, -0.7822452, 0, 0, 0, 1, 1,
0.9809124, 0.7413331, -0.4612689, 0, 0, 0, 1, 1,
0.9811355, -1.420095, 3.087118, 1, 1, 1, 1, 1,
0.9866522, 1.394883, 0.4537129, 1, 1, 1, 1, 1,
0.9918072, -0.229628, 1.938626, 1, 1, 1, 1, 1,
0.9949104, -0.8903559, 1.36067, 1, 1, 1, 1, 1,
0.997374, 0.6756816, 1.702729, 1, 1, 1, 1, 1,
0.9977205, -1.980239, 4.266215, 1, 1, 1, 1, 1,
1.003787, 1.764474, 0.9778414, 1, 1, 1, 1, 1,
1.006756, 0.1044802, 3.517443, 1, 1, 1, 1, 1,
1.007927, 0.5711049, 1.121445, 1, 1, 1, 1, 1,
1.00943, -1.090533, 1.121711, 1, 1, 1, 1, 1,
1.023231, 2.191842, 0.7063549, 1, 1, 1, 1, 1,
1.042901, -0.3390646, 2.441592, 1, 1, 1, 1, 1,
1.053463, -1.374655, 2.398395, 1, 1, 1, 1, 1,
1.061293, -0.3329105, 0.8465875, 1, 1, 1, 1, 1,
1.064866, -0.6490723, 4.073726, 1, 1, 1, 1, 1,
1.066239, 0.0437741, 1.64177, 0, 0, 1, 1, 1,
1.072064, 1.388106, 1.306834, 1, 0, 0, 1, 1,
1.077236, 0.5704973, -0.1438277, 1, 0, 0, 1, 1,
1.095921, -0.09634033, 1.202873, 1, 0, 0, 1, 1,
1.098032, -1.258888, 0.9572636, 1, 0, 0, 1, 1,
1.100086, -5.876545e-05, 0.5379752, 1, 0, 0, 1, 1,
1.106531, 0.565734, 2.032636, 0, 0, 0, 1, 1,
1.11175, 0.01183228, 1.881054, 0, 0, 0, 1, 1,
1.114935, -0.4065227, 0.9311829, 0, 0, 0, 1, 1,
1.118553, 0.1667206, 0.9575564, 0, 0, 0, 1, 1,
1.119539, 1.761833, 0.3827409, 0, 0, 0, 1, 1,
1.127375, -0.8380913, 3.013689, 0, 0, 0, 1, 1,
1.128396, 0.2974798, 1.693975, 0, 0, 0, 1, 1,
1.139667, 1.988284, -0.2657309, 1, 1, 1, 1, 1,
1.15211, 0.1280153, 0.648374, 1, 1, 1, 1, 1,
1.152523, 2.115681, 0.7782223, 1, 1, 1, 1, 1,
1.152553, 0.8413373, 1.293234, 1, 1, 1, 1, 1,
1.164979, 1.425836, 1.096306, 1, 1, 1, 1, 1,
1.171661, -0.3605112, 2.830216, 1, 1, 1, 1, 1,
1.174137, 0.06759499, 2.404381, 1, 1, 1, 1, 1,
1.177751, 1.521917, 0.9862249, 1, 1, 1, 1, 1,
1.178706, 0.7203178, 3.225222, 1, 1, 1, 1, 1,
1.182706, -0.9587603, 1.668246, 1, 1, 1, 1, 1,
1.191758, 0.2394752, 0.2852329, 1, 1, 1, 1, 1,
1.192072, -0.2162125, 2.175936, 1, 1, 1, 1, 1,
1.198256, 1.262265, 2.689585, 1, 1, 1, 1, 1,
1.19989, -1.144897, 1.356549, 1, 1, 1, 1, 1,
1.202305, -1.016443, 2.732326, 1, 1, 1, 1, 1,
1.203517, 0.06807212, 2.957962, 0, 0, 1, 1, 1,
1.204026, 0.625416, 0.1806742, 1, 0, 0, 1, 1,
1.207101, 0.1634457, 2.02757, 1, 0, 0, 1, 1,
1.20896, 0.76619, 0.1864968, 1, 0, 0, 1, 1,
1.218575, 1.15893, 0.6669952, 1, 0, 0, 1, 1,
1.220788, -2.758221, 2.719684, 1, 0, 0, 1, 1,
1.222313, -1.617006, 2.129434, 0, 0, 0, 1, 1,
1.22723, -0.8338118, 1.46736, 0, 0, 0, 1, 1,
1.231871, 0.2795897, 1.36383, 0, 0, 0, 1, 1,
1.235243, 1.131153, 1.030213, 0, 0, 0, 1, 1,
1.245002, -0.5286939, 2.361069, 0, 0, 0, 1, 1,
1.257676, 0.07168086, 2.970172, 0, 0, 0, 1, 1,
1.260448, -0.5200645, 1.99012, 0, 0, 0, 1, 1,
1.261544, 0.07550121, -0.4155078, 1, 1, 1, 1, 1,
1.263678, 0.3631268, 0.6336484, 1, 1, 1, 1, 1,
1.268035, 0.3053965, 1.025449, 1, 1, 1, 1, 1,
1.274906, -0.2720698, 1.037952, 1, 1, 1, 1, 1,
1.280926, 1.902148, 1.585755, 1, 1, 1, 1, 1,
1.28596, 0.8519217, 1.080584, 1, 1, 1, 1, 1,
1.295411, -1.130996, 4.579708, 1, 1, 1, 1, 1,
1.299205, -0.9415219, 3.347965, 1, 1, 1, 1, 1,
1.303098, 0.9301637, 0.6931251, 1, 1, 1, 1, 1,
1.308879, 0.5954446, 0.07345708, 1, 1, 1, 1, 1,
1.317786, 0.03529441, 2.546076, 1, 1, 1, 1, 1,
1.324944, -0.3101008, 1.749012, 1, 1, 1, 1, 1,
1.337516, 0.2972868, 1.753255, 1, 1, 1, 1, 1,
1.341448, 0.706522, -0.3900492, 1, 1, 1, 1, 1,
1.342023, -0.08331414, 0.09486089, 1, 1, 1, 1, 1,
1.342649, -0.7247127, 2.450852, 0, 0, 1, 1, 1,
1.346156, -1.107283, 1.821203, 1, 0, 0, 1, 1,
1.353654, -0.6167079, 3.643837, 1, 0, 0, 1, 1,
1.353671, 1.15281, 1.162165, 1, 0, 0, 1, 1,
1.354201, 0.583108, 0.01737994, 1, 0, 0, 1, 1,
1.354601, 1.888838, 2.160271, 1, 0, 0, 1, 1,
1.359326, 0.05689067, 1.547068, 0, 0, 0, 1, 1,
1.368034, -0.1632416, 1.671265, 0, 0, 0, 1, 1,
1.368813, -1.234078, 2.172507, 0, 0, 0, 1, 1,
1.370032, 0.5455822, 2.419763, 0, 0, 0, 1, 1,
1.375535, 0.094125, 2.196409, 0, 0, 0, 1, 1,
1.389349, 0.385175, 0.6764405, 0, 0, 0, 1, 1,
1.390259, 0.86761, 3.313397, 0, 0, 0, 1, 1,
1.390785, -1.520953, 2.712541, 1, 1, 1, 1, 1,
1.398585, 1.224288, 1.84487, 1, 1, 1, 1, 1,
1.403344, 2.042367, 0.3912366, 1, 1, 1, 1, 1,
1.414813, -2.074017, 2.723233, 1, 1, 1, 1, 1,
1.418693, 1.579646, 2.253415, 1, 1, 1, 1, 1,
1.424252, 1.262462, 1.023404, 1, 1, 1, 1, 1,
1.42865, 0.6657857, 0.3977594, 1, 1, 1, 1, 1,
1.431643, -0.9428829, 4.063869, 1, 1, 1, 1, 1,
1.431741, 1.72494, 1.947858, 1, 1, 1, 1, 1,
1.436402, 0.2407529, 1.94337, 1, 1, 1, 1, 1,
1.442669, -0.2705543, 3.246006, 1, 1, 1, 1, 1,
1.4461, 0.6091015, -0.2324249, 1, 1, 1, 1, 1,
1.450092, -1.696588, 4.054006, 1, 1, 1, 1, 1,
1.456011, 3.53884, 0.8539624, 1, 1, 1, 1, 1,
1.468128, 1.076645, 2.195081, 1, 1, 1, 1, 1,
1.487052, -1.105831, 3.383719, 0, 0, 1, 1, 1,
1.488363, -0.5318866, 1.284851, 1, 0, 0, 1, 1,
1.495335, 0.6873527, 1.130315, 1, 0, 0, 1, 1,
1.498193, 0.1907116, 1.06465, 1, 0, 0, 1, 1,
1.499871, 1.704021, -0.7959793, 1, 0, 0, 1, 1,
1.502804, -1.276769, 3.007112, 1, 0, 0, 1, 1,
1.513172, 0.9577433, 1.591695, 0, 0, 0, 1, 1,
1.51324, 1.261521, 0.2886595, 0, 0, 0, 1, 1,
1.514287, -0.2405366, 1.568179, 0, 0, 0, 1, 1,
1.525722, 0.4151932, 0.1716653, 0, 0, 0, 1, 1,
1.552596, -1.241435, 2.774243, 0, 0, 0, 1, 1,
1.560197, 2.091317, 2.200549, 0, 0, 0, 1, 1,
1.560659, 1.069401, 0.611818, 0, 0, 0, 1, 1,
1.56172, 0.08933238, 1.020916, 1, 1, 1, 1, 1,
1.566078, -0.213525, 2.547951, 1, 1, 1, 1, 1,
1.57076, 0.901691, 2.641775, 1, 1, 1, 1, 1,
1.572081, -1.350019, 0.9027983, 1, 1, 1, 1, 1,
1.582669, 0.857929, 2.073995, 1, 1, 1, 1, 1,
1.592399, -1.379013, 2.071967, 1, 1, 1, 1, 1,
1.597228, 1.234838, 0.6465068, 1, 1, 1, 1, 1,
1.602866, -0.565349, 2.347435, 1, 1, 1, 1, 1,
1.608814, -0.853835, 1.941915, 1, 1, 1, 1, 1,
1.611568, -0.7928254, 0.5480809, 1, 1, 1, 1, 1,
1.631334, 1.477024, -0.5854947, 1, 1, 1, 1, 1,
1.631634, 0.2352766, 0.2053643, 1, 1, 1, 1, 1,
1.635406, -0.7355221, 0.7761262, 1, 1, 1, 1, 1,
1.652191, 1.426849, 1.518406, 1, 1, 1, 1, 1,
1.657596, 0.8968827, 2.090162, 1, 1, 1, 1, 1,
1.660079, -0.2766432, 1.249408, 0, 0, 1, 1, 1,
1.665224, -0.8272096, 2.621863, 1, 0, 0, 1, 1,
1.677366, -0.1728737, 1.715688, 1, 0, 0, 1, 1,
1.678165, 0.2257541, 1.722918, 1, 0, 0, 1, 1,
1.708944, 0.9593207, 1.877057, 1, 0, 0, 1, 1,
1.712507, -1.161947, 1.087053, 1, 0, 0, 1, 1,
1.719778, 1.121226, 1.628224, 0, 0, 0, 1, 1,
1.753503, -0.3303615, 2.974692, 0, 0, 0, 1, 1,
1.762308, 1.138386, 2.195858, 0, 0, 0, 1, 1,
1.765682, -0.1063277, 1.906473, 0, 0, 0, 1, 1,
1.777684, 0.9223117, 1.392719, 0, 0, 0, 1, 1,
1.797514, 0.2211632, 0.8035876, 0, 0, 0, 1, 1,
1.797632, 0.815636, 0.1463783, 0, 0, 0, 1, 1,
1.798241, 0.8782424, -0.4355289, 1, 1, 1, 1, 1,
1.836146, 1.282898, -0.9658909, 1, 1, 1, 1, 1,
1.84327, -1.154433, 2.990155, 1, 1, 1, 1, 1,
1.845676, 1.233526, 1.1631, 1, 1, 1, 1, 1,
1.868649, -0.9616471, 1.549372, 1, 1, 1, 1, 1,
1.888465, -0.4914517, -0.8438795, 1, 1, 1, 1, 1,
1.898041, -0.5326306, 2.831012, 1, 1, 1, 1, 1,
1.932178, -0.009573191, 2.117894, 1, 1, 1, 1, 1,
1.945881, 0.9900677, 0.4963274, 1, 1, 1, 1, 1,
1.949414, 0.101686, 0.06060706, 1, 1, 1, 1, 1,
1.987575, 0.7841338, 1.669461, 1, 1, 1, 1, 1,
2.014458, -0.2278761, 2.949781, 1, 1, 1, 1, 1,
2.01777, 0.8381757, 2.018131, 1, 1, 1, 1, 1,
2.021141, -0.6041986, 1.910146, 1, 1, 1, 1, 1,
2.03182, 1.226998, 0.8940549, 1, 1, 1, 1, 1,
2.037599, 0.41951, 2.237709, 0, 0, 1, 1, 1,
2.037616, 1.29048, -0.1792006, 1, 0, 0, 1, 1,
2.053318, -0.1603104, 2.411868, 1, 0, 0, 1, 1,
2.069268, 0.8852535, 0.5419998, 1, 0, 0, 1, 1,
2.075763, 0.1201689, 1.349788, 1, 0, 0, 1, 1,
2.090411, 0.3101581, 0.9732968, 1, 0, 0, 1, 1,
2.151968, 0.6898667, 1.245354, 0, 0, 0, 1, 1,
2.184614, -1.064221, 1.638079, 0, 0, 0, 1, 1,
2.20038, 1.560924, -0.2865715, 0, 0, 0, 1, 1,
2.219042, -0.4187312, 3.896473, 0, 0, 0, 1, 1,
2.226586, -0.6720017, 0.9565232, 0, 0, 0, 1, 1,
2.227168, -1.480876, 0.9105682, 0, 0, 0, 1, 1,
2.249141, 0.6156936, 0.9774963, 0, 0, 0, 1, 1,
2.294553, 1.726141, 0.4316312, 1, 1, 1, 1, 1,
2.364196, 0.7026515, 1.753724, 1, 1, 1, 1, 1,
2.377164, -0.3462904, 1.722867, 1, 1, 1, 1, 1,
2.887737, 0.9447039, 2.672178, 1, 1, 1, 1, 1,
3.070479, -0.804475, 1.314493, 1, 1, 1, 1, 1,
3.333419, -0.8904604, 2.87491, 1, 1, 1, 1, 1,
3.41922, 2.016812, 1.56375, 1, 1, 1, 1, 1
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
var radius = 10.07657;
var distance = 35.39351;
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
mvMatrix.translate( 0.512063, -0.2778503, 0.3099945 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.39351);
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