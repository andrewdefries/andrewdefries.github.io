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
-2.881428, -1.138997, -1.520885, 1, 0, 0, 1,
-2.698052, 0.07372267, -2.184669, 1, 0.007843138, 0, 1,
-2.60078, -0.1311622, -0.4212981, 1, 0.01176471, 0, 1,
-2.587667, 1.202103, -1.139852, 1, 0.01960784, 0, 1,
-2.383166, -1.51403, -2.815948, 1, 0.02352941, 0, 1,
-2.356356, 0.3932138, 0.2796372, 1, 0.03137255, 0, 1,
-2.352821, 0.4660605, -2.42429, 1, 0.03529412, 0, 1,
-2.336381, -0.673382, -0.7542866, 1, 0.04313726, 0, 1,
-2.322284, 0.2068209, -3.228319, 1, 0.04705882, 0, 1,
-2.266905, 1.107074, -0.6349438, 1, 0.05490196, 0, 1,
-2.185356, -0.3091114, -2.521297, 1, 0.05882353, 0, 1,
-2.086324, -1.202665, -2.390255, 1, 0.06666667, 0, 1,
-2.075604, 1.957003, -2.357215, 1, 0.07058824, 0, 1,
-2.061126, -0.268606, -2.037368, 1, 0.07843138, 0, 1,
-2.052996, 0.6157615, -1.794795, 1, 0.08235294, 0, 1,
-2.042202, -0.2696115, -0.02144332, 1, 0.09019608, 0, 1,
-2.034543, 0.4244862, -1.556636, 1, 0.09411765, 0, 1,
-2.00465, 0.3499525, -0.2476529, 1, 0.1019608, 0, 1,
-1.99618, 0.3397006, -1.69479, 1, 0.1098039, 0, 1,
-1.971354, 0.5260101, -0.5702187, 1, 0.1137255, 0, 1,
-1.947338, 0.8482953, -0.7032716, 1, 0.1215686, 0, 1,
-1.940227, 1.686434, -1.634119, 1, 0.1254902, 0, 1,
-1.913937, 0.1992564, 0.1608977, 1, 0.1333333, 0, 1,
-1.91134, -0.1123153, -1.698668, 1, 0.1372549, 0, 1,
-1.910993, -0.7125275, -1.708977, 1, 0.145098, 0, 1,
-1.903011, -1.700016, -2.166561, 1, 0.1490196, 0, 1,
-1.900608, -2.122832, -2.851693, 1, 0.1568628, 0, 1,
-1.863673, -0.7654262, -1.481477, 1, 0.1607843, 0, 1,
-1.848094, -1.15047, -0.2151622, 1, 0.1686275, 0, 1,
-1.845516, -0.340648, -1.734275, 1, 0.172549, 0, 1,
-1.841955, -2.948012, -3.09665, 1, 0.1803922, 0, 1,
-1.827822, 0.4424585, 1.02388, 1, 0.1843137, 0, 1,
-1.817189, 1.484889, -0.9926517, 1, 0.1921569, 0, 1,
-1.813054, 0.9821006, -1.051167, 1, 0.1960784, 0, 1,
-1.804051, -1.510427, -1.477974, 1, 0.2039216, 0, 1,
-1.802632, 0.7462937, -0.7556093, 1, 0.2117647, 0, 1,
-1.782256, -1.170578, -0.5000948, 1, 0.2156863, 0, 1,
-1.778635, -2.280167, -2.049047, 1, 0.2235294, 0, 1,
-1.732686, 1.35838, -2.195035, 1, 0.227451, 0, 1,
-1.71133, -0.3665925, -2.587757, 1, 0.2352941, 0, 1,
-1.706192, -0.3376547, -1.429057, 1, 0.2392157, 0, 1,
-1.688858, 0.9124117, 0.0226054, 1, 0.2470588, 0, 1,
-1.683013, 1.332625, -0.793749, 1, 0.2509804, 0, 1,
-1.682447, -1.164552, -1.19536, 1, 0.2588235, 0, 1,
-1.671462, 1.477105, -1.592553, 1, 0.2627451, 0, 1,
-1.657651, 1.207231, -1.19931, 1, 0.2705882, 0, 1,
-1.651974, -0.1971375, -1.398354, 1, 0.2745098, 0, 1,
-1.645273, -1.437884, -2.911261, 1, 0.282353, 0, 1,
-1.634805, -0.360631, 0.0471937, 1, 0.2862745, 0, 1,
-1.617444, 0.4492012, -0.9078779, 1, 0.2941177, 0, 1,
-1.60716, 2.103918, -0.6117727, 1, 0.3019608, 0, 1,
-1.599703, 1.350368, -1.03531, 1, 0.3058824, 0, 1,
-1.586969, 1.427361, -0.7191864, 1, 0.3137255, 0, 1,
-1.534063, -1.366961, -3.420945, 1, 0.3176471, 0, 1,
-1.526151, -1.667341, -3.731087, 1, 0.3254902, 0, 1,
-1.521305, -0.07218024, -2.2868, 1, 0.3294118, 0, 1,
-1.496691, -0.175199, -2.115137, 1, 0.3372549, 0, 1,
-1.488111, 0.1359785, -2.643442, 1, 0.3411765, 0, 1,
-1.476823, 0.7685676, -0.01660297, 1, 0.3490196, 0, 1,
-1.466813, -1.21389, -2.395469, 1, 0.3529412, 0, 1,
-1.449106, 2.186575, 1.665075, 1, 0.3607843, 0, 1,
-1.448154, 0.2205138, -1.124594, 1, 0.3647059, 0, 1,
-1.4452, 0.9831616, -2.025134, 1, 0.372549, 0, 1,
-1.443463, 0.04363842, -2.065795, 1, 0.3764706, 0, 1,
-1.442817, 0.2421209, -1.798282, 1, 0.3843137, 0, 1,
-1.439383, -0.6190989, -2.345598, 1, 0.3882353, 0, 1,
-1.437122, 0.3449792, -0.7024261, 1, 0.3960784, 0, 1,
-1.430071, 0.7657477, -2.257609, 1, 0.4039216, 0, 1,
-1.417318, -1.791289, -2.085886, 1, 0.4078431, 0, 1,
-1.409685, 0.609451, 0.8394743, 1, 0.4156863, 0, 1,
-1.407225, -0.1765547, -1.70713, 1, 0.4196078, 0, 1,
-1.406459, 1.081777, -0.8218367, 1, 0.427451, 0, 1,
-1.394083, -0.4876716, -3.989749, 1, 0.4313726, 0, 1,
-1.393302, -0.988353, -1.757716, 1, 0.4392157, 0, 1,
-1.388623, 0.1468859, -1.264225, 1, 0.4431373, 0, 1,
-1.377083, -0.6637224, -4.206296, 1, 0.4509804, 0, 1,
-1.375624, -0.5820835, -0.3351686, 1, 0.454902, 0, 1,
-1.373204, 1.44226, -0.8273581, 1, 0.4627451, 0, 1,
-1.36385, -0.02714735, -1.337717, 1, 0.4666667, 0, 1,
-1.361826, -0.06349073, -2.440544, 1, 0.4745098, 0, 1,
-1.3479, -2.851736, -2.758791, 1, 0.4784314, 0, 1,
-1.344441, 0.4431206, -0.2955927, 1, 0.4862745, 0, 1,
-1.344341, 1.041601, -1.61288, 1, 0.4901961, 0, 1,
-1.342633, 1.700689, 1.674779, 1, 0.4980392, 0, 1,
-1.341487, -1.447335, -1.814955, 1, 0.5058824, 0, 1,
-1.32571, -1.140514, -2.120138, 1, 0.509804, 0, 1,
-1.324508, 0.1474717, -1.744324, 1, 0.5176471, 0, 1,
-1.315328, -1.05448, -4.612051, 1, 0.5215687, 0, 1,
-1.301607, -0.354352, -0.3942219, 1, 0.5294118, 0, 1,
-1.29265, -0.5033382, -1.723485, 1, 0.5333334, 0, 1,
-1.286094, 0.5036566, -0.8148246, 1, 0.5411765, 0, 1,
-1.280717, -1.348817, -3.410988, 1, 0.5450981, 0, 1,
-1.269171, -0.6590703, -0.408137, 1, 0.5529412, 0, 1,
-1.265837, -1.20308, -2.40305, 1, 0.5568628, 0, 1,
-1.265118, 1.920552, -1.186529, 1, 0.5647059, 0, 1,
-1.258071, 0.3008923, -0.5093089, 1, 0.5686275, 0, 1,
-1.255993, -1.52358, -2.301188, 1, 0.5764706, 0, 1,
-1.255529, 1.101309, -0.5630697, 1, 0.5803922, 0, 1,
-1.249536, -0.896315, -2.386905, 1, 0.5882353, 0, 1,
-1.243659, -0.3908081, -3.045869, 1, 0.5921569, 0, 1,
-1.239339, -0.8757495, -1.784006, 1, 0.6, 0, 1,
-1.233112, 0.1637286, -1.251687, 1, 0.6078432, 0, 1,
-1.229718, 1.4329, -2.016473, 1, 0.6117647, 0, 1,
-1.224717, -0.1465157, -2.231801, 1, 0.6196079, 0, 1,
-1.215615, 2.389615, 0.01995639, 1, 0.6235294, 0, 1,
-1.187059, 0.8444735, -1.805522, 1, 0.6313726, 0, 1,
-1.184835, -1.338228, -3.155905, 1, 0.6352941, 0, 1,
-1.183966, -1.594284, -2.447451, 1, 0.6431373, 0, 1,
-1.18358, 0.7611897, -0.6712518, 1, 0.6470588, 0, 1,
-1.182997, -0.02621861, -1.863234, 1, 0.654902, 0, 1,
-1.17992, 2.095613, -2.239513, 1, 0.6588235, 0, 1,
-1.174898, -0.01015717, -1.291775, 1, 0.6666667, 0, 1,
-1.169146, 0.3386096, -0.5225554, 1, 0.6705883, 0, 1,
-1.168085, 1.329373, -1.322877, 1, 0.6784314, 0, 1,
-1.15727, 0.002808173, -2.990272, 1, 0.682353, 0, 1,
-1.154633, 0.4238857, -1.293937, 1, 0.6901961, 0, 1,
-1.150562, -0.9752164, -0.629721, 1, 0.6941177, 0, 1,
-1.145349, 1.114129, -0.9109704, 1, 0.7019608, 0, 1,
-1.144231, 0.2150197, -0.6441947, 1, 0.7098039, 0, 1,
-1.138347, 1.242087, -1.305419, 1, 0.7137255, 0, 1,
-1.136182, -1.214068, -0.5976394, 1, 0.7215686, 0, 1,
-1.133737, 2.751181, 0.2422013, 1, 0.7254902, 0, 1,
-1.133642, -1.467756, -2.477913, 1, 0.7333333, 0, 1,
-1.126774, 0.05818157, -1.767754, 1, 0.7372549, 0, 1,
-1.117439, 0.6701424, -2.258595, 1, 0.7450981, 0, 1,
-1.116241, 0.7033705, -1.523726, 1, 0.7490196, 0, 1,
-1.115741, 0.1884685, -1.391054, 1, 0.7568628, 0, 1,
-1.111406, -0.6482136, -3.090474, 1, 0.7607843, 0, 1,
-1.109327, -0.02226801, -0.7016445, 1, 0.7686275, 0, 1,
-1.107275, 0.9927489, 0.25709, 1, 0.772549, 0, 1,
-1.105147, 2.414137, -0.2300559, 1, 0.7803922, 0, 1,
-1.100904, 0.4328155, -2.224211, 1, 0.7843137, 0, 1,
-1.0996, 1.264766, 0.8029937, 1, 0.7921569, 0, 1,
-1.087918, -0.7087808, -1.828622, 1, 0.7960784, 0, 1,
-1.08657, 0.07721239, -2.195001, 1, 0.8039216, 0, 1,
-1.085537, 1.019386, -3.099204, 1, 0.8117647, 0, 1,
-1.082116, 1.691853, -0.01269799, 1, 0.8156863, 0, 1,
-1.079099, 0.5270222, 2.032975, 1, 0.8235294, 0, 1,
-1.075441, 2.935513, 0.166977, 1, 0.827451, 0, 1,
-1.07454, 0.3052917, 0.184717, 1, 0.8352941, 0, 1,
-1.071398, -0.9889681, -3.504451, 1, 0.8392157, 0, 1,
-1.068423, 2.274634, -1.414829, 1, 0.8470588, 0, 1,
-1.059217, -0.1920993, -2.722624, 1, 0.8509804, 0, 1,
-1.055944, 1.435898, 0.1305622, 1, 0.8588235, 0, 1,
-1.055936, -1.753971, -1.993933, 1, 0.8627451, 0, 1,
-1.048795, 0.9362529, 0.3591624, 1, 0.8705882, 0, 1,
-1.042846, 0.1304163, -1.327314, 1, 0.8745098, 0, 1,
-1.042506, 0.2150958, -1.518131, 1, 0.8823529, 0, 1,
-1.041417, -0.1108674, -1.732258, 1, 0.8862745, 0, 1,
-1.04033, 0.8617892, -1.203536, 1, 0.8941177, 0, 1,
-1.037936, -0.239973, -1.177132, 1, 0.8980392, 0, 1,
-1.037241, 1.244521, -0.2258846, 1, 0.9058824, 0, 1,
-1.032212, 0.7334314, -2.67477, 1, 0.9137255, 0, 1,
-1.024686, -0.4715185, -1.171946, 1, 0.9176471, 0, 1,
-1.023265, -0.9897594, -3.361161, 1, 0.9254902, 0, 1,
-1.02138, 0.531743, -0.7780393, 1, 0.9294118, 0, 1,
-1.018932, 0.7261568, -0.938913, 1, 0.9372549, 0, 1,
-1.011058, -0.6978171, -2.022829, 1, 0.9411765, 0, 1,
-1.001054, 0.36373, 1.029072, 1, 0.9490196, 0, 1,
-0.9974281, -0.0827852, -0.347799, 1, 0.9529412, 0, 1,
-0.9872151, -0.4810543, -2.69638, 1, 0.9607843, 0, 1,
-0.982425, 0.3346581, -1.660158, 1, 0.9647059, 0, 1,
-0.981794, 2.643348, -0.9874122, 1, 0.972549, 0, 1,
-0.9692222, 0.3608729, -1.674597, 1, 0.9764706, 0, 1,
-0.9674015, 0.5211672, -1.247179, 1, 0.9843137, 0, 1,
-0.9631469, -1.850894, -3.523811, 1, 0.9882353, 0, 1,
-0.9595841, 0.2925627, -0.1623266, 1, 0.9960784, 0, 1,
-0.9586391, -0.7451563, -1.826482, 0.9960784, 1, 0, 1,
-0.9534575, -0.3564748, 0.2744357, 0.9921569, 1, 0, 1,
-0.9471338, -0.6783355, -2.093397, 0.9843137, 1, 0, 1,
-0.9467429, 0.1233417, -0.6504492, 0.9803922, 1, 0, 1,
-0.9333583, 0.7023374, -0.93871, 0.972549, 1, 0, 1,
-0.9326162, -0.5045242, -1.469871, 0.9686275, 1, 0, 1,
-0.9310551, 1.585914, -1.062918, 0.9607843, 1, 0, 1,
-0.9310347, 0.9099591, -0.7110821, 0.9568627, 1, 0, 1,
-0.9248086, 0.6117513, -1.343101, 0.9490196, 1, 0, 1,
-0.91926, 1.034918, -0.2839793, 0.945098, 1, 0, 1,
-0.9080301, 0.5355726, -1.915832, 0.9372549, 1, 0, 1,
-0.9078932, 0.01271583, -2.378036, 0.9333333, 1, 0, 1,
-0.9073814, 0.4888105, -2.501387, 0.9254902, 1, 0, 1,
-0.9053629, -0.8703596, -2.026074, 0.9215686, 1, 0, 1,
-0.8867872, -1.115662, -1.791084, 0.9137255, 1, 0, 1,
-0.8835243, -1.485615, -1.504749, 0.9098039, 1, 0, 1,
-0.8833315, 2.027834, -0.1930643, 0.9019608, 1, 0, 1,
-0.8826681, 0.2526443, -3.27903, 0.8941177, 1, 0, 1,
-0.8822701, 0.3130307, -0.2187491, 0.8901961, 1, 0, 1,
-0.8818053, -2.135998, -3.159379, 0.8823529, 1, 0, 1,
-0.8788568, -0.06046913, -2.608978, 0.8784314, 1, 0, 1,
-0.8769825, 2.438605, 0.8439917, 0.8705882, 1, 0, 1,
-0.8613072, -0.5121323, -1.831063, 0.8666667, 1, 0, 1,
-0.8579282, 1.531769, -0.6457447, 0.8588235, 1, 0, 1,
-0.8553851, 0.7908047, -0.5644419, 0.854902, 1, 0, 1,
-0.8552674, 0.9117678, -1.866524, 0.8470588, 1, 0, 1,
-0.8339754, -2.100211, -2.849634, 0.8431373, 1, 0, 1,
-0.8328373, -0.6796879, -3.764243, 0.8352941, 1, 0, 1,
-0.8306634, -0.368161, -2.345673, 0.8313726, 1, 0, 1,
-0.8285005, 0.4507613, -0.4415125, 0.8235294, 1, 0, 1,
-0.8267605, 0.2402834, -2.277993, 0.8196079, 1, 0, 1,
-0.8192727, -1.023849, -1.947661, 0.8117647, 1, 0, 1,
-0.8189154, 0.1169035, 0.5710404, 0.8078431, 1, 0, 1,
-0.8162338, -1.402402, -3.404579, 0.8, 1, 0, 1,
-0.8123194, -1.542494, -1.728636, 0.7921569, 1, 0, 1,
-0.8087407, -0.4819958, -2.811188, 0.7882353, 1, 0, 1,
-0.802417, -0.6776158, -3.498579, 0.7803922, 1, 0, 1,
-0.8019038, -1.293523, -2.434703, 0.7764706, 1, 0, 1,
-0.8009232, -1.358066, -1.790125, 0.7686275, 1, 0, 1,
-0.8007853, -0.7229701, -1.233405, 0.7647059, 1, 0, 1,
-0.792124, 0.7542102, -0.629849, 0.7568628, 1, 0, 1,
-0.7906938, 0.862484, -0.5196117, 0.7529412, 1, 0, 1,
-0.7888122, 1.34524, 0.07566153, 0.7450981, 1, 0, 1,
-0.7886795, -0.8310869, -3.293264, 0.7411765, 1, 0, 1,
-0.7866302, 1.322469, 0.48282, 0.7333333, 1, 0, 1,
-0.7812434, 1.714141, 0.8613107, 0.7294118, 1, 0, 1,
-0.7726033, -0.1232567, -3.082311, 0.7215686, 1, 0, 1,
-0.7721198, -0.1128524, -2.934496, 0.7176471, 1, 0, 1,
-0.7719524, 2.060189, -1.380169, 0.7098039, 1, 0, 1,
-0.7700995, 1.469816, -0.1800469, 0.7058824, 1, 0, 1,
-0.7669058, 0.6336895, -0.6236295, 0.6980392, 1, 0, 1,
-0.7620811, -0.4214106, -2.489149, 0.6901961, 1, 0, 1,
-0.7591247, -1.745028, -2.941165, 0.6862745, 1, 0, 1,
-0.7526322, 0.8347077, 0.07124578, 0.6784314, 1, 0, 1,
-0.7481648, 0.5150897, -0.2694745, 0.6745098, 1, 0, 1,
-0.7478378, 1.611937, -0.9496647, 0.6666667, 1, 0, 1,
-0.7465418, 0.3713748, -1.49946, 0.6627451, 1, 0, 1,
-0.745262, -2.760681, -1.71824, 0.654902, 1, 0, 1,
-0.741217, -0.4608559, -1.898668, 0.6509804, 1, 0, 1,
-0.7368625, -0.9669555, -3.751749, 0.6431373, 1, 0, 1,
-0.7355754, -0.8044338, -3.617588, 0.6392157, 1, 0, 1,
-0.7308568, -1.193292, -3.070044, 0.6313726, 1, 0, 1,
-0.7254283, -2.138693, -5.273716, 0.627451, 1, 0, 1,
-0.7218722, 1.075286, -1.39792, 0.6196079, 1, 0, 1,
-0.7187706, 0.4641678, -1.131212, 0.6156863, 1, 0, 1,
-0.7131807, 0.6291347, -0.03206602, 0.6078432, 1, 0, 1,
-0.7107534, -1.097219, -2.467276, 0.6039216, 1, 0, 1,
-0.7064202, -0.9176154, -3.030409, 0.5960785, 1, 0, 1,
-0.7050776, 2.72999, 0.6258059, 0.5882353, 1, 0, 1,
-0.7038213, -0.7466384, -2.554781, 0.5843138, 1, 0, 1,
-0.703297, -0.2510514, -2.116194, 0.5764706, 1, 0, 1,
-0.7016196, -0.8958147, -2.385756, 0.572549, 1, 0, 1,
-0.7008349, -0.6778582, -2.175802, 0.5647059, 1, 0, 1,
-0.7001054, 0.329608, -0.739399, 0.5607843, 1, 0, 1,
-0.688612, -0.2895165, -3.704463, 0.5529412, 1, 0, 1,
-0.6886004, 0.2454553, -1.839498, 0.5490196, 1, 0, 1,
-0.6876358, -0.860518, -1.02144, 0.5411765, 1, 0, 1,
-0.6873459, -0.03690553, -1.343215, 0.5372549, 1, 0, 1,
-0.6747516, -0.5845194, -2.203961, 0.5294118, 1, 0, 1,
-0.6694025, -0.7967509, -3.532253, 0.5254902, 1, 0, 1,
-0.668166, 0.7842758, 0.6350754, 0.5176471, 1, 0, 1,
-0.661325, 0.5523964, -1.248706, 0.5137255, 1, 0, 1,
-0.6603736, -0.3379836, -2.694836, 0.5058824, 1, 0, 1,
-0.6558358, 0.3780883, 0.1755216, 0.5019608, 1, 0, 1,
-0.6528852, 1.090118, -0.2966711, 0.4941176, 1, 0, 1,
-0.6476799, 0.5983967, -0.1071473, 0.4862745, 1, 0, 1,
-0.6472098, -1.205763, -4.463901, 0.4823529, 1, 0, 1,
-0.6449021, -1.37715, -2.823108, 0.4745098, 1, 0, 1,
-0.64342, -1.016966, -2.433962, 0.4705882, 1, 0, 1,
-0.6405441, 0.1456201, -1.745756, 0.4627451, 1, 0, 1,
-0.6404056, 0.4322841, -1.689292, 0.4588235, 1, 0, 1,
-0.6394569, -1.290465, -3.875492, 0.4509804, 1, 0, 1,
-0.633944, 0.4296715, -1.016138, 0.4470588, 1, 0, 1,
-0.6318069, 2.581576, 0.4138317, 0.4392157, 1, 0, 1,
-0.6303734, 0.7955101, -3.142893, 0.4352941, 1, 0, 1,
-0.6298785, 0.1632056, -0.8697864, 0.427451, 1, 0, 1,
-0.6297747, -0.6268281, -3.213453, 0.4235294, 1, 0, 1,
-0.6255521, 0.2730139, -1.509499, 0.4156863, 1, 0, 1,
-0.6236563, 0.3714828, -1.111468, 0.4117647, 1, 0, 1,
-0.6230695, -0.1466218, -1.824253, 0.4039216, 1, 0, 1,
-0.621784, 0.2034331, -1.20119, 0.3960784, 1, 0, 1,
-0.620999, 0.5676757, -0.7487742, 0.3921569, 1, 0, 1,
-0.6187438, -0.853797, -2.960882, 0.3843137, 1, 0, 1,
-0.6053404, 0.3311173, -0.7295194, 0.3803922, 1, 0, 1,
-0.6039886, 0.5426186, -0.09936535, 0.372549, 1, 0, 1,
-0.6022039, -0.1158844, -0.6948043, 0.3686275, 1, 0, 1,
-0.6017404, 0.02745089, -2.225697, 0.3607843, 1, 0, 1,
-0.5996068, -0.0135225, -2.154808, 0.3568628, 1, 0, 1,
-0.5993327, -0.5000793, -1.612813, 0.3490196, 1, 0, 1,
-0.59702, -1.601693, -2.822001, 0.345098, 1, 0, 1,
-0.5968865, 0.1643134, -0.6065369, 0.3372549, 1, 0, 1,
-0.5898934, 1.06641, -0.4805148, 0.3333333, 1, 0, 1,
-0.5848892, 0.8432308, -1.611377, 0.3254902, 1, 0, 1,
-0.5819775, 0.1214309, -0.7916558, 0.3215686, 1, 0, 1,
-0.5802846, 0.8896576, -1.56831, 0.3137255, 1, 0, 1,
-0.5792407, -0.7979054, -3.539393, 0.3098039, 1, 0, 1,
-0.5723887, -1.009683, -3.114245, 0.3019608, 1, 0, 1,
-0.5713989, 0.5813705, -0.007475097, 0.2941177, 1, 0, 1,
-0.5688358, 0.7193429, -2.096428, 0.2901961, 1, 0, 1,
-0.5679619, -1.425268, -1.607645, 0.282353, 1, 0, 1,
-0.5660477, 0.1869548, -2.836886, 0.2784314, 1, 0, 1,
-0.5631117, 0.3879703, -2.088098, 0.2705882, 1, 0, 1,
-0.5626763, 0.8276187, -2.682777, 0.2666667, 1, 0, 1,
-0.56079, 0.1682761, -0.4123082, 0.2588235, 1, 0, 1,
-0.5582952, -1.033582, -2.785266, 0.254902, 1, 0, 1,
-0.5566457, 0.06946816, -1.481304, 0.2470588, 1, 0, 1,
-0.5560745, -0.3579183, -3.147638, 0.2431373, 1, 0, 1,
-0.5553758, -0.6480068, -1.797907, 0.2352941, 1, 0, 1,
-0.5546912, -1.906876, -3.825431, 0.2313726, 1, 0, 1,
-0.5529928, -1.695006, -1.635557, 0.2235294, 1, 0, 1,
-0.552658, -0.3038121, -3.219597, 0.2196078, 1, 0, 1,
-0.5514498, 1.559824, -1.094802, 0.2117647, 1, 0, 1,
-0.549637, -0.2277751, -3.749518, 0.2078431, 1, 0, 1,
-0.5477007, 0.04726923, -0.1006378, 0.2, 1, 0, 1,
-0.5453758, -0.8693764, -2.378062, 0.1921569, 1, 0, 1,
-0.5419663, -0.09814005, -0.8603379, 0.1882353, 1, 0, 1,
-0.5399008, -0.7457669, -1.495007, 0.1803922, 1, 0, 1,
-0.538265, -0.3747829, -3.570235, 0.1764706, 1, 0, 1,
-0.5327812, 0.4754969, -0.5297632, 0.1686275, 1, 0, 1,
-0.5190569, -0.554346, -1.161785, 0.1647059, 1, 0, 1,
-0.5063073, 0.01725354, -0.6590399, 0.1568628, 1, 0, 1,
-0.5032787, -0.9330561, -2.713052, 0.1529412, 1, 0, 1,
-0.5018718, 0.7400633, -0.4669589, 0.145098, 1, 0, 1,
-0.5017821, 0.9823436, 0.4336987, 0.1411765, 1, 0, 1,
-0.4975864, -1.079417, -2.429898, 0.1333333, 1, 0, 1,
-0.4966827, -0.4879399, -2.290843, 0.1294118, 1, 0, 1,
-0.4895123, -1.125093, -2.466636, 0.1215686, 1, 0, 1,
-0.4894998, -1.239952, -2.694068, 0.1176471, 1, 0, 1,
-0.4882596, -0.6850969, -2.935192, 0.1098039, 1, 0, 1,
-0.4860525, 1.497051, -1.687616, 0.1058824, 1, 0, 1,
-0.482038, -1.268982, -2.827678, 0.09803922, 1, 0, 1,
-0.478487, 0.590549, -1.661047, 0.09019608, 1, 0, 1,
-0.4779686, -0.5490341, -2.488487, 0.08627451, 1, 0, 1,
-0.4738738, -1.098751, -2.854717, 0.07843138, 1, 0, 1,
-0.4704929, -0.694016, -2.359699, 0.07450981, 1, 0, 1,
-0.4696816, -0.2711407, -2.62611, 0.06666667, 1, 0, 1,
-0.4656771, -0.6771123, -1.262249, 0.0627451, 1, 0, 1,
-0.4644091, 0.4790683, -0.5762434, 0.05490196, 1, 0, 1,
-0.4639961, -1.697778, -3.170256, 0.05098039, 1, 0, 1,
-0.4628671, 0.5876871, -2.598976, 0.04313726, 1, 0, 1,
-0.4614078, 0.2423011, -0.8935053, 0.03921569, 1, 0, 1,
-0.4572761, 0.3849528, -2.795797, 0.03137255, 1, 0, 1,
-0.4526849, 2.328121, 0.3601787, 0.02745098, 1, 0, 1,
-0.4493476, -0.7734652, -3.479811, 0.01960784, 1, 0, 1,
-0.448942, 2.031295, 0.208404, 0.01568628, 1, 0, 1,
-0.4450096, 0.01448243, -2.033201, 0.007843138, 1, 0, 1,
-0.4445913, 1.208102, -1.244794, 0.003921569, 1, 0, 1,
-0.4422454, 0.2925495, -2.800949, 0, 1, 0.003921569, 1,
-0.4415736, 1.169403, -0.02492293, 0, 1, 0.01176471, 1,
-0.4373325, 0.3204325, 0.02373562, 0, 1, 0.01568628, 1,
-0.4342826, -0.433805, -1.787918, 0, 1, 0.02352941, 1,
-0.4328328, -0.5141434, -2.264585, 0, 1, 0.02745098, 1,
-0.4265276, 0.5836393, -1.986509, 0, 1, 0.03529412, 1,
-0.4253659, 0.07123701, -2.739531, 0, 1, 0.03921569, 1,
-0.4246718, -1.091895, -3.679556, 0, 1, 0.04705882, 1,
-0.4221292, -2.520072, -3.509876, 0, 1, 0.05098039, 1,
-0.4213356, 0.327402, -1.42914, 0, 1, 0.05882353, 1,
-0.4144277, 0.2628832, -1.019765, 0, 1, 0.0627451, 1,
-0.4129517, -0.3734711, -2.803279, 0, 1, 0.07058824, 1,
-0.4106469, 0.4029222, -0.8692105, 0, 1, 0.07450981, 1,
-0.4093172, 0.34726, -1.14278, 0, 1, 0.08235294, 1,
-0.4086406, 0.4805296, -1.940095, 0, 1, 0.08627451, 1,
-0.4084307, -0.06569707, -0.7847517, 0, 1, 0.09411765, 1,
-0.407164, -1.002024, -3.554216, 0, 1, 0.1019608, 1,
-0.4035808, 0.294557, -2.179904, 0, 1, 0.1058824, 1,
-0.3999116, -0.3081294, -1.173358, 0, 1, 0.1137255, 1,
-0.3953402, 0.6366588, -2.194548, 0, 1, 0.1176471, 1,
-0.3937331, -1.249525, -1.765395, 0, 1, 0.1254902, 1,
-0.389662, 2.040615, -0.4843913, 0, 1, 0.1294118, 1,
-0.3871574, -1.102897, -4.116314, 0, 1, 0.1372549, 1,
-0.387067, -1.172782, -2.050714, 0, 1, 0.1411765, 1,
-0.3867781, 0.1618287, 1.175277, 0, 1, 0.1490196, 1,
-0.3862239, -0.3660807, -3.774866, 0, 1, 0.1529412, 1,
-0.3805133, -1.029694, -1.719296, 0, 1, 0.1607843, 1,
-0.3781195, -0.5696408, -2.783008, 0, 1, 0.1647059, 1,
-0.3778812, -0.1416867, -2.234449, 0, 1, 0.172549, 1,
-0.371756, -0.4095641, -3.689618, 0, 1, 0.1764706, 1,
-0.3714852, -0.9827111, -0.833928, 0, 1, 0.1843137, 1,
-0.3710944, -1.474724, -1.005991, 0, 1, 0.1882353, 1,
-0.3708983, 1.151192, 0.8817196, 0, 1, 0.1960784, 1,
-0.3665543, -1.156047, -4.143756, 0, 1, 0.2039216, 1,
-0.3630949, -1.940325, -2.170714, 0, 1, 0.2078431, 1,
-0.3629444, 0.3144796, -2.492727, 0, 1, 0.2156863, 1,
-0.3585855, 1.216409, -1.691653, 0, 1, 0.2196078, 1,
-0.3583512, 1.948877, -0.8677657, 0, 1, 0.227451, 1,
-0.3542505, 0.02217545, -2.315291, 0, 1, 0.2313726, 1,
-0.3526375, 0.9001307, -0.8891372, 0, 1, 0.2392157, 1,
-0.3524962, 0.8967174, -1.941463, 0, 1, 0.2431373, 1,
-0.3512912, -1.393439, -2.604767, 0, 1, 0.2509804, 1,
-0.3487888, 0.1672997, 0.1433071, 0, 1, 0.254902, 1,
-0.3485167, 0.01181795, -1.601889, 0, 1, 0.2627451, 1,
-0.3483289, -0.4202133, -3.543219, 0, 1, 0.2666667, 1,
-0.3476842, 0.156111, -2.476681, 0, 1, 0.2745098, 1,
-0.3452753, -1.318787, -2.713427, 0, 1, 0.2784314, 1,
-0.3444497, 1.028667, 0.404735, 0, 1, 0.2862745, 1,
-0.3438587, -0.2969421, -1.691363, 0, 1, 0.2901961, 1,
-0.3406622, 0.9294076, -0.9870329, 0, 1, 0.2980392, 1,
-0.3362865, 1.906598, -0.5004964, 0, 1, 0.3058824, 1,
-0.3316531, -1.408919, -2.54761, 0, 1, 0.3098039, 1,
-0.3312953, 0.02131511, -1.79381, 0, 1, 0.3176471, 1,
-0.3280717, 1.200218, -0.4076794, 0, 1, 0.3215686, 1,
-0.3274982, 1.080787, -1.534323, 0, 1, 0.3294118, 1,
-0.3239699, -0.3077278, -2.401052, 0, 1, 0.3333333, 1,
-0.3228802, 1.13919, 0.1076446, 0, 1, 0.3411765, 1,
-0.3222898, -1.020535, -4.112871, 0, 1, 0.345098, 1,
-0.3218581, -0.6028765, -3.121636, 0, 1, 0.3529412, 1,
-0.3198963, -1.50661, -2.769488, 0, 1, 0.3568628, 1,
-0.3188693, 0.189317, -3.522243, 0, 1, 0.3647059, 1,
-0.3098354, -0.9192948, -2.65368, 0, 1, 0.3686275, 1,
-0.3057801, 1.043229, 0.9381932, 0, 1, 0.3764706, 1,
-0.3056505, -0.2299927, -0.2679565, 0, 1, 0.3803922, 1,
-0.2994148, 1.698439, 0.5251109, 0, 1, 0.3882353, 1,
-0.2972899, 0.5867579, -2.388614, 0, 1, 0.3921569, 1,
-0.2880089, 0.4604478, -1.611423, 0, 1, 0.4, 1,
-0.282955, 0.2639302, -0.2108923, 0, 1, 0.4078431, 1,
-0.278573, 0.05604207, -1.500284, 0, 1, 0.4117647, 1,
-0.2771673, 0.2620237, -0.4808081, 0, 1, 0.4196078, 1,
-0.2755694, -0.7951114, -2.322722, 0, 1, 0.4235294, 1,
-0.269518, 0.0435809, -1.368975, 0, 1, 0.4313726, 1,
-0.2689433, -2.532121, -3.260895, 0, 1, 0.4352941, 1,
-0.2640825, 1.428334, 0.8025993, 0, 1, 0.4431373, 1,
-0.2632954, -0.5377336, -3.806628, 0, 1, 0.4470588, 1,
-0.2627078, -2.164139, -3.761988, 0, 1, 0.454902, 1,
-0.2620575, 0.4998839, -0.1312809, 0, 1, 0.4588235, 1,
-0.2566147, -1.323344, -3.161168, 0, 1, 0.4666667, 1,
-0.2561709, 0.2808457, -2.479369, 0, 1, 0.4705882, 1,
-0.2549644, -0.06145367, -2.498428, 0, 1, 0.4784314, 1,
-0.2528883, -0.2385179, -2.234138, 0, 1, 0.4823529, 1,
-0.2468601, 1.562147, -0.2135225, 0, 1, 0.4901961, 1,
-0.2424443, 1.82724, -0.1796364, 0, 1, 0.4941176, 1,
-0.2390765, -0.9452626, -2.293432, 0, 1, 0.5019608, 1,
-0.2317564, 0.7186009, 0.6940175, 0, 1, 0.509804, 1,
-0.2279349, -0.7155412, -3.713034, 0, 1, 0.5137255, 1,
-0.2276492, -0.4075578, -3.071254, 0, 1, 0.5215687, 1,
-0.2253962, 0.9165282, 1.749946, 0, 1, 0.5254902, 1,
-0.217044, 0.06955469, -0.3500881, 0, 1, 0.5333334, 1,
-0.2162839, -0.2039559, -2.884084, 0, 1, 0.5372549, 1,
-0.2152738, -1.174978, -4.701621, 0, 1, 0.5450981, 1,
-0.2137462, 0.9536402, 0.3359437, 0, 1, 0.5490196, 1,
-0.2062943, 0.1083584, -1.803147, 0, 1, 0.5568628, 1,
-0.2044153, 0.6334009, -0.2051315, 0, 1, 0.5607843, 1,
-0.2043556, -0.5535, -3.453863, 0, 1, 0.5686275, 1,
-0.20344, -0.5006435, -3.265166, 0, 1, 0.572549, 1,
-0.198375, -0.1474625, -1.303925, 0, 1, 0.5803922, 1,
-0.1947379, -0.1964104, -3.624589, 0, 1, 0.5843138, 1,
-0.1937774, -0.8553593, -3.957103, 0, 1, 0.5921569, 1,
-0.1923302, -1.135532, -3.704828, 0, 1, 0.5960785, 1,
-0.1908574, 0.9694933, 0.5801138, 0, 1, 0.6039216, 1,
-0.1891279, 0.143606, -1.003248, 0, 1, 0.6117647, 1,
-0.1882015, 1.895108, 0.7435058, 0, 1, 0.6156863, 1,
-0.1874448, 1.420485, -0.7958239, 0, 1, 0.6235294, 1,
-0.1845894, -0.642722, -2.153157, 0, 1, 0.627451, 1,
-0.1802816, -1.212961, -1.11796, 0, 1, 0.6352941, 1,
-0.1781905, 0.02892688, -2.852603, 0, 1, 0.6392157, 1,
-0.1779635, -0.9413403, -2.492162, 0, 1, 0.6470588, 1,
-0.1754145, 0.246632, -1.893206, 0, 1, 0.6509804, 1,
-0.1749503, 0.4849984, -0.8660515, 0, 1, 0.6588235, 1,
-0.1749075, 1.357149, -1.340262, 0, 1, 0.6627451, 1,
-0.1715142, -0.2308916, -3.440232, 0, 1, 0.6705883, 1,
-0.1713113, -0.676847, -1.392903, 0, 1, 0.6745098, 1,
-0.1649048, -0.3220132, -3.157352, 0, 1, 0.682353, 1,
-0.1642984, -2.663286, -4.420887, 0, 1, 0.6862745, 1,
-0.1641881, -0.9496271, -2.844369, 0, 1, 0.6941177, 1,
-0.1609048, -1.277431, -5.422717, 0, 1, 0.7019608, 1,
-0.1609035, -1.582368, -1.650497, 0, 1, 0.7058824, 1,
-0.1596698, -0.6116576, -2.177266, 0, 1, 0.7137255, 1,
-0.1572769, 1.278305, 0.9925149, 0, 1, 0.7176471, 1,
-0.1539211, -0.8425669, -3.161095, 0, 1, 0.7254902, 1,
-0.1502125, -0.5687956, -1.658017, 0, 1, 0.7294118, 1,
-0.1498493, 1.429706, -0.07664587, 0, 1, 0.7372549, 1,
-0.147515, -0.690551, -1.924168, 0, 1, 0.7411765, 1,
-0.1471974, 0.1956305, 0.8660761, 0, 1, 0.7490196, 1,
-0.1450156, -0.02323469, -0.8173645, 0, 1, 0.7529412, 1,
-0.1432979, -0.3193945, -2.878092, 0, 1, 0.7607843, 1,
-0.1416792, -1.172937, -3.89531, 0, 1, 0.7647059, 1,
-0.1412169, -2.287814, -3.085919, 0, 1, 0.772549, 1,
-0.1406692, 0.4426331, -1.734368, 0, 1, 0.7764706, 1,
-0.1376737, -0.8399494, -3.333167, 0, 1, 0.7843137, 1,
-0.1370936, -0.8243866, -4.02703, 0, 1, 0.7882353, 1,
-0.1367543, 0.7741426, 0.07573183, 0, 1, 0.7960784, 1,
-0.1325967, -0.5548495, -3.020079, 0, 1, 0.8039216, 1,
-0.129457, 0.4386364, -2.023412, 0, 1, 0.8078431, 1,
-0.1275766, 0.8185185, 0.8051129, 0, 1, 0.8156863, 1,
-0.1217495, 0.1897935, -0.9152863, 0, 1, 0.8196079, 1,
-0.1215399, 1.168132, -1.381895, 0, 1, 0.827451, 1,
-0.1195573, 0.227904, -0.5154697, 0, 1, 0.8313726, 1,
-0.1176458, 0.5972208, -1.743736, 0, 1, 0.8392157, 1,
-0.1169876, -0.9659775, -2.75721, 0, 1, 0.8431373, 1,
-0.1168577, -0.5534223, -4.655689, 0, 1, 0.8509804, 1,
-0.1156342, -1.2242, -4.263377, 0, 1, 0.854902, 1,
-0.114013, 0.6102027, -0.9700939, 0, 1, 0.8627451, 1,
-0.1139843, 0.1116075, -1.684249, 0, 1, 0.8666667, 1,
-0.113005, -0.3867097, -2.921532, 0, 1, 0.8745098, 1,
-0.1071613, -0.06747025, -1.751316, 0, 1, 0.8784314, 1,
-0.1065886, 0.4349618, -0.3996864, 0, 1, 0.8862745, 1,
-0.1006155, -0.7394018, -2.201865, 0, 1, 0.8901961, 1,
-0.1002775, 1.151318, 1.631517, 0, 1, 0.8980392, 1,
-0.09966335, 0.9750541, 1.030016, 0, 1, 0.9058824, 1,
-0.09937486, 1.737486, 1.180745, 0, 1, 0.9098039, 1,
-0.09887323, 0.4849963, -0.5492616, 0, 1, 0.9176471, 1,
-0.0969137, -0.7893947, -4.100823, 0, 1, 0.9215686, 1,
-0.08966825, -1.093527, -2.533845, 0, 1, 0.9294118, 1,
-0.08423068, 1.643469, -2.781315, 0, 1, 0.9333333, 1,
-0.08236287, -0.9304437, -2.704622, 0, 1, 0.9411765, 1,
-0.08010899, 0.5930837, 0.1629356, 0, 1, 0.945098, 1,
-0.07125451, 0.3951862, -0.5761545, 0, 1, 0.9529412, 1,
-0.06964404, -0.6769732, -2.873329, 0, 1, 0.9568627, 1,
-0.06960148, 2.485557, 0.01775895, 0, 1, 0.9647059, 1,
-0.06581826, -0.2108981, -2.993185, 0, 1, 0.9686275, 1,
-0.06005644, 0.5059237, -0.4204769, 0, 1, 0.9764706, 1,
-0.05985397, -0.2952438, -5.338556, 0, 1, 0.9803922, 1,
-0.05930182, 0.4433094, 0.3723097, 0, 1, 0.9882353, 1,
-0.04898733, -1.140739, -4.752236, 0, 1, 0.9921569, 1,
-0.04789323, -0.5087976, -4.394992, 0, 1, 1, 1,
-0.0422681, -1.727905, -2.372906, 0, 0.9921569, 1, 1,
-0.04096844, 2.305377, 0.9975759, 0, 0.9882353, 1, 1,
-0.04051396, -1.212788, -1.212453, 0, 0.9803922, 1, 1,
-0.03483908, 2.931683, -0.109633, 0, 0.9764706, 1, 1,
-0.03438743, -0.599256, -4.057786, 0, 0.9686275, 1, 1,
-0.03107579, 0.2457817, -1.196252, 0, 0.9647059, 1, 1,
-0.0281538, 1.174802, -1.18824, 0, 0.9568627, 1, 1,
-0.02809348, 1.659796, 0.8094002, 0, 0.9529412, 1, 1,
-0.02401865, 0.1472507, 0.4699968, 0, 0.945098, 1, 1,
-0.02323345, -0.4412966, -4.91758, 0, 0.9411765, 1, 1,
-0.0227734, 1.959289, 0.382813, 0, 0.9333333, 1, 1,
-0.01986745, 1.040322, -0.8944423, 0, 0.9294118, 1, 1,
-0.01589319, 2.31788, 0.3902164, 0, 0.9215686, 1, 1,
-0.01391721, 1.024006, 2.19509, 0, 0.9176471, 1, 1,
-0.01366113, 1.856136, -0.8581691, 0, 0.9098039, 1, 1,
-0.01254298, -1.444221, -3.633739, 0, 0.9058824, 1, 1,
-0.009404919, -1.242607, -2.273699, 0, 0.8980392, 1, 1,
-0.005373847, -0.0562092, -1.734238, 0, 0.8901961, 1, 1,
-0.002160034, -1.911319, -3.436779, 0, 0.8862745, 1, 1,
-0.001844416, -0.9764877, -4.273181, 0, 0.8784314, 1, 1,
0.0009104469, 0.01811374, 0.04155472, 0, 0.8745098, 1, 1,
0.005890548, 0.04262605, 0.1621237, 0, 0.8666667, 1, 1,
0.009060159, 1.482559, -0.04017976, 0, 0.8627451, 1, 1,
0.01161577, 0.3810123, 0.6077461, 0, 0.854902, 1, 1,
0.01280695, 0.6065298, -0.02606514, 0, 0.8509804, 1, 1,
0.01364275, -1.09054, 1.725236, 0, 0.8431373, 1, 1,
0.01487903, -0.7596173, 2.742973, 0, 0.8392157, 1, 1,
0.01653426, -0.68749, 3.647143, 0, 0.8313726, 1, 1,
0.01882425, -0.6158779, 2.061913, 0, 0.827451, 1, 1,
0.01891364, -0.4154878, 3.783528, 0, 0.8196079, 1, 1,
0.02664241, 0.2668833, -1.222004, 0, 0.8156863, 1, 1,
0.02702929, -0.3953951, 1.953928, 0, 0.8078431, 1, 1,
0.04526095, 2.040488, 0.2337129, 0, 0.8039216, 1, 1,
0.04578184, -0.8923994, 3.297229, 0, 0.7960784, 1, 1,
0.04628799, -1.879497, 2.585545, 0, 0.7882353, 1, 1,
0.05097147, -0.03127405, 3.406279, 0, 0.7843137, 1, 1,
0.05541125, 1.027205, 0.509136, 0, 0.7764706, 1, 1,
0.05810685, 0.6658165, -1.310226, 0, 0.772549, 1, 1,
0.06251566, 0.2274244, 0.06344847, 0, 0.7647059, 1, 1,
0.06603365, 1.021711, 0.5818546, 0, 0.7607843, 1, 1,
0.06625631, 1.051154, -0.8598178, 0, 0.7529412, 1, 1,
0.06656938, 0.06750297, -0.4508421, 0, 0.7490196, 1, 1,
0.06663513, -0.3779755, 3.477375, 0, 0.7411765, 1, 1,
0.06704724, -0.2327916, 3.991542, 0, 0.7372549, 1, 1,
0.07320116, -0.01634545, 2.797829, 0, 0.7294118, 1, 1,
0.07519192, -0.2827168, 2.775841, 0, 0.7254902, 1, 1,
0.07556368, 0.5425158, 0.387898, 0, 0.7176471, 1, 1,
0.07567022, -0.9551966, 4.099776, 0, 0.7137255, 1, 1,
0.0801919, 0.2658249, -0.3403302, 0, 0.7058824, 1, 1,
0.08043677, 1.005463, 0.1347479, 0, 0.6980392, 1, 1,
0.080843, 0.1842233, 0.5554843, 0, 0.6941177, 1, 1,
0.0836738, -0.9435409, 4.148748, 0, 0.6862745, 1, 1,
0.08537898, 0.3294831, -1.132325, 0, 0.682353, 1, 1,
0.08571591, -0.0105826, 0.4986877, 0, 0.6745098, 1, 1,
0.0863651, 0.5912925, -0.4136165, 0, 0.6705883, 1, 1,
0.0900166, -0.3118774, 3.170372, 0, 0.6627451, 1, 1,
0.09712665, -0.5716501, 2.166131, 0, 0.6588235, 1, 1,
0.09836819, 0.6711858, 0.2264865, 0, 0.6509804, 1, 1,
0.101835, 0.7937261, -0.1971661, 0, 0.6470588, 1, 1,
0.105916, 0.42432, 0.2539894, 0, 0.6392157, 1, 1,
0.1079215, 0.282814, 0.3922766, 0, 0.6352941, 1, 1,
0.1099298, 1.852904, 1.454703, 0, 0.627451, 1, 1,
0.1127275, -0.08001864, 2.154951, 0, 0.6235294, 1, 1,
0.1192183, 0.9857984, -0.9168036, 0, 0.6156863, 1, 1,
0.1209884, 0.5127861, -0.009174216, 0, 0.6117647, 1, 1,
0.1228818, 1.318155, -1.429398, 0, 0.6039216, 1, 1,
0.1261195, 0.04421004, 1.560209, 0, 0.5960785, 1, 1,
0.1280971, 1.495206, -0.8057306, 0, 0.5921569, 1, 1,
0.1293439, -0.9545941, 1.356954, 0, 0.5843138, 1, 1,
0.1294929, -0.04168225, 1.943243, 0, 0.5803922, 1, 1,
0.1301166, 0.3560595, 1.254276, 0, 0.572549, 1, 1,
0.1331118, -1.880256, 2.447976, 0, 0.5686275, 1, 1,
0.1333147, -0.6922024, 2.880407, 0, 0.5607843, 1, 1,
0.1361009, -0.8059439, 2.735944, 0, 0.5568628, 1, 1,
0.1385516, -1.347659, 1.890253, 0, 0.5490196, 1, 1,
0.1409188, 2.271168, 0.3441803, 0, 0.5450981, 1, 1,
0.1438068, -0.530845, 1.421461, 0, 0.5372549, 1, 1,
0.1454206, 1.626537, 0.5939304, 0, 0.5333334, 1, 1,
0.1458177, -1.282625, 4.233615, 0, 0.5254902, 1, 1,
0.1464286, -0.2742373, 1.57243, 0, 0.5215687, 1, 1,
0.147411, 1.922691, -0.3630764, 0, 0.5137255, 1, 1,
0.1477585, 0.8380821, -0.3885618, 0, 0.509804, 1, 1,
0.1508418, 0.06163723, 0.3877295, 0, 0.5019608, 1, 1,
0.152098, -0.8656831, 3.983542, 0, 0.4941176, 1, 1,
0.1532707, 0.9759135, -0.4233896, 0, 0.4901961, 1, 1,
0.1544143, -0.3425039, 4.186838, 0, 0.4823529, 1, 1,
0.1606218, -0.4658218, 2.091747, 0, 0.4784314, 1, 1,
0.1616209, -1.328152, 2.303473, 0, 0.4705882, 1, 1,
0.1701824, 2.271223, 0.4175076, 0, 0.4666667, 1, 1,
0.1723864, 0.1281617, 1.168417, 0, 0.4588235, 1, 1,
0.1731888, 1.6317, -0.0756111, 0, 0.454902, 1, 1,
0.1734502, 0.7535331, -0.7955242, 0, 0.4470588, 1, 1,
0.1746345, -0.7951337, 4.996488, 0, 0.4431373, 1, 1,
0.1779086, 1.329028, -1.198105, 0, 0.4352941, 1, 1,
0.1784763, -0.2923664, 2.954107, 0, 0.4313726, 1, 1,
0.1822954, -2.015567, 2.41204, 0, 0.4235294, 1, 1,
0.1830848, -1.037761, 2.922967, 0, 0.4196078, 1, 1,
0.1850598, -0.1890968, 3.925004, 0, 0.4117647, 1, 1,
0.1937693, 0.7585178, 0.5926591, 0, 0.4078431, 1, 1,
0.2010277, -0.06385639, 0.3717915, 0, 0.4, 1, 1,
0.2029604, -0.4408709, 2.728721, 0, 0.3921569, 1, 1,
0.203119, 0.1490698, 1.634955, 0, 0.3882353, 1, 1,
0.205027, -1.10903, 3.440293, 0, 0.3803922, 1, 1,
0.2075678, -0.3471711, 2.019144, 0, 0.3764706, 1, 1,
0.2082345, 0.07010867, 0.7150985, 0, 0.3686275, 1, 1,
0.2083006, -0.6153978, 2.212859, 0, 0.3647059, 1, 1,
0.2091005, 0.4349818, -0.3498861, 0, 0.3568628, 1, 1,
0.212075, 0.4608161, 0.9880943, 0, 0.3529412, 1, 1,
0.2133532, -0.6132272, 0.4419191, 0, 0.345098, 1, 1,
0.2135076, 0.5984812, 0.615439, 0, 0.3411765, 1, 1,
0.2147263, 0.931017, -2.130782, 0, 0.3333333, 1, 1,
0.2212184, -0.2897637, 3.238441, 0, 0.3294118, 1, 1,
0.2219994, 0.2728656, 1.789813, 0, 0.3215686, 1, 1,
0.2228929, 2.509734, -1.058077, 0, 0.3176471, 1, 1,
0.2248935, 0.1833069, 1.556175, 0, 0.3098039, 1, 1,
0.2289762, -2.048939, 3.099892, 0, 0.3058824, 1, 1,
0.2299284, -1.03795, 1.95293, 0, 0.2980392, 1, 1,
0.2327994, 0.250865, 1.129563, 0, 0.2901961, 1, 1,
0.2361336, 0.6130884, 2.888767, 0, 0.2862745, 1, 1,
0.2402519, -1.200366, 2.605959, 0, 0.2784314, 1, 1,
0.2439469, -1.274037, 1.785586, 0, 0.2745098, 1, 1,
0.2449902, 0.8089588, 0.5296809, 0, 0.2666667, 1, 1,
0.248147, 0.1923735, -0.2790994, 0, 0.2627451, 1, 1,
0.2582892, 0.1827088, 0.4539858, 0, 0.254902, 1, 1,
0.2603611, -1.095344, 2.140175, 0, 0.2509804, 1, 1,
0.2650015, 1.235304, -0.2351919, 0, 0.2431373, 1, 1,
0.266472, 1.143929, 0.9684001, 0, 0.2392157, 1, 1,
0.2684992, -0.4085973, 5.147051, 0, 0.2313726, 1, 1,
0.2698177, -0.0579584, 1.971046, 0, 0.227451, 1, 1,
0.2706151, 0.9268118, -0.2084818, 0, 0.2196078, 1, 1,
0.2712016, -0.07854854, 4.354021, 0, 0.2156863, 1, 1,
0.2723751, 0.1338819, 2.638446, 0, 0.2078431, 1, 1,
0.2748471, -0.05521552, 2.463394, 0, 0.2039216, 1, 1,
0.2821872, -1.143873, 2.988957, 0, 0.1960784, 1, 1,
0.2882886, -1.388437, 1.998505, 0, 0.1882353, 1, 1,
0.288621, 0.4668428, -0.5346924, 0, 0.1843137, 1, 1,
0.2988892, -0.346496, 3.01601, 0, 0.1764706, 1, 1,
0.2994392, -2.099313, 1.956347, 0, 0.172549, 1, 1,
0.3013149, -0.8653132, 3.294148, 0, 0.1647059, 1, 1,
0.3019192, 0.03635924, 0.4050182, 0, 0.1607843, 1, 1,
0.3066189, -1.662048, 4.105203, 0, 0.1529412, 1, 1,
0.3071559, -0.4777488, 2.390024, 0, 0.1490196, 1, 1,
0.3104577, 0.7319768, 0.779755, 0, 0.1411765, 1, 1,
0.3129537, 0.3937493, 1.350486, 0, 0.1372549, 1, 1,
0.3179785, 1.038086, 0.7984071, 0, 0.1294118, 1, 1,
0.3181575, 0.04006865, 1.098949, 0, 0.1254902, 1, 1,
0.3185967, 1.183021, 0.7884013, 0, 0.1176471, 1, 1,
0.3205431, -0.436001, 3.416071, 0, 0.1137255, 1, 1,
0.3218945, -0.8924435, 4.18729, 0, 0.1058824, 1, 1,
0.3222922, -0.7937049, 4.464378, 0, 0.09803922, 1, 1,
0.3300646, 1.114465, 3.004479, 0, 0.09411765, 1, 1,
0.3304088, 0.8973075, -0.5639364, 0, 0.08627451, 1, 1,
0.3305441, -1.272477, 3.999368, 0, 0.08235294, 1, 1,
0.3343631, 0.4657631, 0.8911733, 0, 0.07450981, 1, 1,
0.3358359, 0.6204549, 1.341587, 0, 0.07058824, 1, 1,
0.3365532, -0.3493721, 1.903512, 0, 0.0627451, 1, 1,
0.3403183, 0.1828722, -0.4056404, 0, 0.05882353, 1, 1,
0.3523753, 0.5931087, -0.8868187, 0, 0.05098039, 1, 1,
0.3553314, -0.07327047, 1.671777, 0, 0.04705882, 1, 1,
0.3591861, 0.4829851, 0.3279398, 0, 0.03921569, 1, 1,
0.3624811, -1.217099, 3.67776, 0, 0.03529412, 1, 1,
0.3630445, 0.165014, -0.4294962, 0, 0.02745098, 1, 1,
0.3680562, -0.8078025, 2.881188, 0, 0.02352941, 1, 1,
0.3714333, 0.7106538, 0.2966949, 0, 0.01568628, 1, 1,
0.3732428, 1.666371, 1.033056, 0, 0.01176471, 1, 1,
0.375341, -1.436948, 2.5754, 0, 0.003921569, 1, 1,
0.3829823, 0.7107079, 0.3432334, 0.003921569, 0, 1, 1,
0.3919148, -0.452389, 1.311717, 0.007843138, 0, 1, 1,
0.394909, -0.5753543, 0.4645391, 0.01568628, 0, 1, 1,
0.3949579, -1.357556, 4.59284, 0.01960784, 0, 1, 1,
0.4028997, -0.4923988, 1.311404, 0.02745098, 0, 1, 1,
0.4042867, -0.9110345, 4.495457, 0.03137255, 0, 1, 1,
0.4047753, 0.3510382, 0.6482035, 0.03921569, 0, 1, 1,
0.4078014, -0.9075863, 1.797992, 0.04313726, 0, 1, 1,
0.4135086, -0.4882942, 2.638896, 0.05098039, 0, 1, 1,
0.4150909, -0.4987436, 1.36295, 0.05490196, 0, 1, 1,
0.4176385, 0.6831003, -0.2866526, 0.0627451, 0, 1, 1,
0.4215868, -0.1310387, 0.690459, 0.06666667, 0, 1, 1,
0.4242673, 0.9337105, -0.2796851, 0.07450981, 0, 1, 1,
0.426669, -0.2421278, 4.135581, 0.07843138, 0, 1, 1,
0.428033, -0.4001798, 2.043755, 0.08627451, 0, 1, 1,
0.4305826, -0.1387664, 3.465944, 0.09019608, 0, 1, 1,
0.4334843, 0.8606017, 0.09168192, 0.09803922, 0, 1, 1,
0.4370921, 0.494355, 0.06274839, 0.1058824, 0, 1, 1,
0.4380869, -0.7950939, 1.79905, 0.1098039, 0, 1, 1,
0.438197, 0.3817981, 0.8928468, 0.1176471, 0, 1, 1,
0.4388632, 2.729214, -0.8950282, 0.1215686, 0, 1, 1,
0.4425033, -0.6886368, 2.690091, 0.1294118, 0, 1, 1,
0.4482146, -0.5752289, 3.226896, 0.1333333, 0, 1, 1,
0.4517214, 1.796307, 1.01952, 0.1411765, 0, 1, 1,
0.4550678, 0.04138725, 1.484501, 0.145098, 0, 1, 1,
0.4565211, -1.008309, 2.669825, 0.1529412, 0, 1, 1,
0.4605286, 1.30207, 0.9398366, 0.1568628, 0, 1, 1,
0.4611748, 0.09400822, 0.02751095, 0.1647059, 0, 1, 1,
0.4616913, 0.4578967, 0.2897157, 0.1686275, 0, 1, 1,
0.4629289, -0.3946416, 2.257865, 0.1764706, 0, 1, 1,
0.4638083, -0.3864125, 4.052504, 0.1803922, 0, 1, 1,
0.4657742, 0.3251204, 1.043057, 0.1882353, 0, 1, 1,
0.4682732, -0.7563242, 1.250238, 0.1921569, 0, 1, 1,
0.4748533, -0.08937272, -0.5342329, 0.2, 0, 1, 1,
0.4761465, 0.08302221, -0.6117818, 0.2078431, 0, 1, 1,
0.4763199, 0.9290417, 0.266596, 0.2117647, 0, 1, 1,
0.4818107, -0.738386, 1.481671, 0.2196078, 0, 1, 1,
0.4859378, -0.1002222, 3.011482, 0.2235294, 0, 1, 1,
0.4926139, -0.4789178, 1.425259, 0.2313726, 0, 1, 1,
0.4942806, 0.3113131, 3.043629, 0.2352941, 0, 1, 1,
0.4981444, -0.282152, 2.259234, 0.2431373, 0, 1, 1,
0.4983096, 0.02232762, 3.374268, 0.2470588, 0, 1, 1,
0.500827, -0.6388975, 2.385849, 0.254902, 0, 1, 1,
0.5083957, -1.059081, 1.608039, 0.2588235, 0, 1, 1,
0.5160421, 2.304875, -0.5947208, 0.2666667, 0, 1, 1,
0.5211918, 0.4426222, 0.321568, 0.2705882, 0, 1, 1,
0.5239886, -1.157839, 3.291994, 0.2784314, 0, 1, 1,
0.5249401, 0.6140141, 1.230492, 0.282353, 0, 1, 1,
0.5259103, -0.3310602, 2.963102, 0.2901961, 0, 1, 1,
0.5261373, -0.0355528, 0.2159095, 0.2941177, 0, 1, 1,
0.5307766, 0.07997261, 0.6917097, 0.3019608, 0, 1, 1,
0.5322212, 1.019581, 1.870834, 0.3098039, 0, 1, 1,
0.5387583, 0.3752864, 0.8491413, 0.3137255, 0, 1, 1,
0.5440049, -0.8549806, 4.718581, 0.3215686, 0, 1, 1,
0.5444376, 0.129355, 3.675999, 0.3254902, 0, 1, 1,
0.5444782, 0.1614746, -0.4075565, 0.3333333, 0, 1, 1,
0.544605, 0.5997307, 2.072874, 0.3372549, 0, 1, 1,
0.5459299, 0.584574, 1.470253, 0.345098, 0, 1, 1,
0.5462708, 0.004428673, 2.13016, 0.3490196, 0, 1, 1,
0.5531863, -1.078115, 4.209908, 0.3568628, 0, 1, 1,
0.5550844, 0.4846598, 0.8077335, 0.3607843, 0, 1, 1,
0.558886, 0.5457894, -0.3260608, 0.3686275, 0, 1, 1,
0.5625924, 1.741983, 0.08414023, 0.372549, 0, 1, 1,
0.5627556, -1.235686, 2.167444, 0.3803922, 0, 1, 1,
0.5639846, 0.4194776, 0.6432043, 0.3843137, 0, 1, 1,
0.5686584, -0.2907726, 2.361614, 0.3921569, 0, 1, 1,
0.5705616, -0.410315, 1.236971, 0.3960784, 0, 1, 1,
0.5707431, 0.3636444, 2.600036, 0.4039216, 0, 1, 1,
0.5710563, 0.157421, 0.609602, 0.4117647, 0, 1, 1,
0.5763204, 0.8994384, 0.3116474, 0.4156863, 0, 1, 1,
0.579128, 1.853892, -0.1200355, 0.4235294, 0, 1, 1,
0.5795344, 1.12756, -0.8441176, 0.427451, 0, 1, 1,
0.5802611, 0.5772727, 1.444056, 0.4352941, 0, 1, 1,
0.5870574, 0.007151945, 0.9779063, 0.4392157, 0, 1, 1,
0.5899262, -1.246019, 1.713774, 0.4470588, 0, 1, 1,
0.5932002, -1.26664, 2.220571, 0.4509804, 0, 1, 1,
0.5976381, -0.550647, 1.396336, 0.4588235, 0, 1, 1,
0.5989581, 1.100821, -1.004265, 0.4627451, 0, 1, 1,
0.5989611, -0.2410177, 2.114302, 0.4705882, 0, 1, 1,
0.6002908, 1.757655, 0.02706054, 0.4745098, 0, 1, 1,
0.60711, -2.715922, 3.979041, 0.4823529, 0, 1, 1,
0.6083598, 1.167053, 0.02606785, 0.4862745, 0, 1, 1,
0.6138042, -0.3403406, 2.578709, 0.4941176, 0, 1, 1,
0.6155595, 0.6326678, 1.85133, 0.5019608, 0, 1, 1,
0.6185834, -1.927273, 4.182987, 0.5058824, 0, 1, 1,
0.6224603, -0.4977583, 3.000374, 0.5137255, 0, 1, 1,
0.6256557, -0.464744, 2.011306, 0.5176471, 0, 1, 1,
0.6266301, 0.443482, 1.215176, 0.5254902, 0, 1, 1,
0.6314362, -0.7080913, 2.895372, 0.5294118, 0, 1, 1,
0.6357754, -0.3279282, 1.921742, 0.5372549, 0, 1, 1,
0.642729, -0.0700661, 1.240795, 0.5411765, 0, 1, 1,
0.647015, -1.275353, 1.208392, 0.5490196, 0, 1, 1,
0.6482216, 1.54008, 0.2419339, 0.5529412, 0, 1, 1,
0.6502665, -0.7338513, 3.232535, 0.5607843, 0, 1, 1,
0.6508256, 1.58489, 0.6520856, 0.5647059, 0, 1, 1,
0.654154, 0.3876019, 1.641051, 0.572549, 0, 1, 1,
0.6553043, 0.5280119, -1.351592, 0.5764706, 0, 1, 1,
0.6553471, -0.8282229, 2.737039, 0.5843138, 0, 1, 1,
0.662885, 2.539792, -0.5638031, 0.5882353, 0, 1, 1,
0.6690816, -0.07067938, 1.491015, 0.5960785, 0, 1, 1,
0.6704795, 1.232498, 0.7975223, 0.6039216, 0, 1, 1,
0.6715335, -1.494644, 0.3835661, 0.6078432, 0, 1, 1,
0.6721432, -1.393533, 2.54815, 0.6156863, 0, 1, 1,
0.6805664, -1.261406, 3.042471, 0.6196079, 0, 1, 1,
0.6810877, -0.9969718, 4.014019, 0.627451, 0, 1, 1,
0.6815825, 0.01771924, 1.614609, 0.6313726, 0, 1, 1,
0.6883563, 0.2270424, 1.903347, 0.6392157, 0, 1, 1,
0.690281, 0.5512683, 0.1980895, 0.6431373, 0, 1, 1,
0.6975877, 0.6180142, -0.2684815, 0.6509804, 0, 1, 1,
0.6997335, -1.105939, 3.036898, 0.654902, 0, 1, 1,
0.7027125, 1.444963, 1.078308, 0.6627451, 0, 1, 1,
0.7059336, 1.034465, 0.9346705, 0.6666667, 0, 1, 1,
0.7139304, 1.422836, 0.9852762, 0.6745098, 0, 1, 1,
0.7316501, 2.767678, 0.01337034, 0.6784314, 0, 1, 1,
0.7317578, -0.2631683, 2.569458, 0.6862745, 0, 1, 1,
0.7418365, 0.598791, -0.1638553, 0.6901961, 0, 1, 1,
0.7425039, -1.142656, 1.593873, 0.6980392, 0, 1, 1,
0.745644, 0.3280264, 2.395982, 0.7058824, 0, 1, 1,
0.7489353, 0.2191572, 0.1837176, 0.7098039, 0, 1, 1,
0.7560374, 1.451976, -0.4471524, 0.7176471, 0, 1, 1,
0.7571592, -0.9972756, 1.790671, 0.7215686, 0, 1, 1,
0.7618693, 1.058428, 1.15658, 0.7294118, 0, 1, 1,
0.767574, -1.695194, 2.806029, 0.7333333, 0, 1, 1,
0.7695404, 1.124442, -0.3286622, 0.7411765, 0, 1, 1,
0.7705588, -0.01441599, 0.7406278, 0.7450981, 0, 1, 1,
0.7734813, -1.283213, 4.1417, 0.7529412, 0, 1, 1,
0.7745247, -0.935047, 2.057261, 0.7568628, 0, 1, 1,
0.7799067, 0.3216367, 1.129704, 0.7647059, 0, 1, 1,
0.7833329, -1.061959, 2.845112, 0.7686275, 0, 1, 1,
0.7936629, -1.248251, 0.6880157, 0.7764706, 0, 1, 1,
0.8123595, -0.8726838, 2.047533, 0.7803922, 0, 1, 1,
0.8124232, 2.704226, -0.1788209, 0.7882353, 0, 1, 1,
0.8252004, 2.381686, 0.813252, 0.7921569, 0, 1, 1,
0.8397018, -1.596373, 2.788248, 0.8, 0, 1, 1,
0.8407441, -1.41305, 2.567364, 0.8078431, 0, 1, 1,
0.8452919, 2.288783, 1.919988, 0.8117647, 0, 1, 1,
0.8490326, 1.114673, 0.6719482, 0.8196079, 0, 1, 1,
0.8507026, -1.198905, 1.558354, 0.8235294, 0, 1, 1,
0.8520542, 1.548917, -0.6014538, 0.8313726, 0, 1, 1,
0.8573784, 1.230985, 0.6108295, 0.8352941, 0, 1, 1,
0.8618886, 1.263914, 0.1445347, 0.8431373, 0, 1, 1,
0.8678603, -0.7271432, 1.040307, 0.8470588, 0, 1, 1,
0.8708675, 1.612825, -0.9931619, 0.854902, 0, 1, 1,
0.8712915, -0.08824262, 3.162974, 0.8588235, 0, 1, 1,
0.875734, -0.02624044, 0.233088, 0.8666667, 0, 1, 1,
0.8825476, 0.9423373, -1.653461, 0.8705882, 0, 1, 1,
0.8827514, 1.176219, 1.227894, 0.8784314, 0, 1, 1,
0.8880609, -1.018242, 3.935789, 0.8823529, 0, 1, 1,
0.8889327, -1.293721, 2.851967, 0.8901961, 0, 1, 1,
0.8907598, -0.2425909, 1.981138, 0.8941177, 0, 1, 1,
0.8919675, -0.2289624, 3.174338, 0.9019608, 0, 1, 1,
0.8936729, -0.6908518, 3.746525, 0.9098039, 0, 1, 1,
0.9000856, -1.039313, 4.217914, 0.9137255, 0, 1, 1,
0.9007298, 0.6283271, 2.650473, 0.9215686, 0, 1, 1,
0.9028395, -0.3088598, 2.075702, 0.9254902, 0, 1, 1,
0.9035262, -0.2247441, 1.441679, 0.9333333, 0, 1, 1,
0.9084489, 1.247125, -0.9402058, 0.9372549, 0, 1, 1,
0.9106352, -0.1018481, 0.2600735, 0.945098, 0, 1, 1,
0.9108511, -1.664221, 2.22818, 0.9490196, 0, 1, 1,
0.9114736, 0.8103184, 0.5371435, 0.9568627, 0, 1, 1,
0.9143448, -1.132851, 3.0488, 0.9607843, 0, 1, 1,
0.9215016, 0.7187477, -0.06769586, 0.9686275, 0, 1, 1,
0.9238769, -0.009048586, 2.287642, 0.972549, 0, 1, 1,
0.9261249, -0.02397398, 2.185951, 0.9803922, 0, 1, 1,
0.9271551, -0.7348454, 2.236439, 0.9843137, 0, 1, 1,
0.9342282, 1.331059, 1.134841, 0.9921569, 0, 1, 1,
0.9365006, -1.039945, 1.970104, 0.9960784, 0, 1, 1,
0.9378288, 0.990252, 0.0524524, 1, 0, 0.9960784, 1,
0.9387699, 0.3036644, 0.6697186, 1, 0, 0.9882353, 1,
0.9440402, 0.135978, 1.077999, 1, 0, 0.9843137, 1,
0.9472626, 0.05652956, 1.397752, 1, 0, 0.9764706, 1,
0.9488563, 0.8981645, 0.3697284, 1, 0, 0.972549, 1,
0.9652766, 0.9509088, 1.294402, 1, 0, 0.9647059, 1,
0.965499, 1.085995, -1.634964, 1, 0, 0.9607843, 1,
0.965903, 0.318395, 2.055972, 1, 0, 0.9529412, 1,
0.9681382, 0.5248605, 0.9719526, 1, 0, 0.9490196, 1,
0.9734836, 0.2481467, 2.781843, 1, 0, 0.9411765, 1,
0.976931, 0.7052972, 1.845683, 1, 0, 0.9372549, 1,
0.9784707, 2.181347, 1.268897, 1, 0, 0.9294118, 1,
0.9804797, 0.5590757, -0.2447035, 1, 0, 0.9254902, 1,
1.002177, 0.489376, 2.087946, 1, 0, 0.9176471, 1,
1.005049, 0.8563892, 0.8420364, 1, 0, 0.9137255, 1,
1.007377, -1.182023, 4.289388, 1, 0, 0.9058824, 1,
1.009617, -1.218721, 2.767305, 1, 0, 0.9019608, 1,
1.01852, 2.199805, 1.251108, 1, 0, 0.8941177, 1,
1.019008, -0.8718015, 3.104551, 1, 0, 0.8862745, 1,
1.019825, 1.652047, 1.001636, 1, 0, 0.8823529, 1,
1.022911, -0.6903594, 1.44346, 1, 0, 0.8745098, 1,
1.026987, 2.046703, -0.134601, 1, 0, 0.8705882, 1,
1.031429, 1.556892, -1.358112, 1, 0, 0.8627451, 1,
1.034358, -0.9996284, 1.046978, 1, 0, 0.8588235, 1,
1.039473, 0.8059775, 0.3826612, 1, 0, 0.8509804, 1,
1.052096, -0.329394, 0.9600891, 1, 0, 0.8470588, 1,
1.05278, 0.9230987, 1.555309, 1, 0, 0.8392157, 1,
1.056449, -0.7824969, 3.134615, 1, 0, 0.8352941, 1,
1.059116, 0.5976884, 2.970891, 1, 0, 0.827451, 1,
1.069811, -0.1740296, 1.966428, 1, 0, 0.8235294, 1,
1.079686, -0.1284244, 4.391375, 1, 0, 0.8156863, 1,
1.080055, -1.637059, 1.39131, 1, 0, 0.8117647, 1,
1.084021, -1.964586, 4.193531, 1, 0, 0.8039216, 1,
1.08861, 0.9762618, 1.407021, 1, 0, 0.7960784, 1,
1.088667, 0.3811803, 2.603745, 1, 0, 0.7921569, 1,
1.098769, 1.037133, -0.8316715, 1, 0, 0.7843137, 1,
1.101196, -0.07552357, 0.8977136, 1, 0, 0.7803922, 1,
1.105344, -0.2252294, 0.7306399, 1, 0, 0.772549, 1,
1.119149, -1.797584, 3.549887, 1, 0, 0.7686275, 1,
1.119917, 1.223196, 1.792331, 1, 0, 0.7607843, 1,
1.120732, -0.1489852, -0.424099, 1, 0, 0.7568628, 1,
1.133087, -0.04468078, 1.668452, 1, 0, 0.7490196, 1,
1.140691, 0.1803344, 0.4206456, 1, 0, 0.7450981, 1,
1.140987, -0.692802, 2.894853, 1, 0, 0.7372549, 1,
1.149351, -1.12501, 2.669195, 1, 0, 0.7333333, 1,
1.155109, 0.5869882, -0.3790255, 1, 0, 0.7254902, 1,
1.15839, 0.08408409, 0.3972383, 1, 0, 0.7215686, 1,
1.161702, 1.899575, -0.09025831, 1, 0, 0.7137255, 1,
1.161935, 0.5735475, 1.050332, 1, 0, 0.7098039, 1,
1.162172, -1.133775, 1.419418, 1, 0, 0.7019608, 1,
1.169474, 2.596265, 1.963096, 1, 0, 0.6941177, 1,
1.187878, 0.112617, -0.2510493, 1, 0, 0.6901961, 1,
1.190869, -0.5341464, 2.866623, 1, 0, 0.682353, 1,
1.195559, 0.3723252, 3.631853, 1, 0, 0.6784314, 1,
1.197697, -0.1203803, 1.809127, 1, 0, 0.6705883, 1,
1.197917, 1.733467, 0.7998222, 1, 0, 0.6666667, 1,
1.213244, -0.2443885, 3.993901, 1, 0, 0.6588235, 1,
1.215347, 1.474259, 0.4734959, 1, 0, 0.654902, 1,
1.217938, -1.11106, 4.992221, 1, 0, 0.6470588, 1,
1.222255, -1.516436, 2.851836, 1, 0, 0.6431373, 1,
1.239416, 1.372894, 0.3934608, 1, 0, 0.6352941, 1,
1.241812, 0.9867932, -0.7176245, 1, 0, 0.6313726, 1,
1.247386, 0.8896484, -1.015993, 1, 0, 0.6235294, 1,
1.248389, -0.9531543, 1.335145, 1, 0, 0.6196079, 1,
1.256865, 2.776001, -0.2351817, 1, 0, 0.6117647, 1,
1.261213, 1.00628, 0.8687764, 1, 0, 0.6078432, 1,
1.2643, 0.03232512, -0.2579521, 1, 0, 0.6, 1,
1.268117, -0.6455358, 2.830244, 1, 0, 0.5921569, 1,
1.275401, -0.4072644, 2.690349, 1, 0, 0.5882353, 1,
1.275453, -0.3630587, 1.651673, 1, 0, 0.5803922, 1,
1.27885, -1.715027, 2.439989, 1, 0, 0.5764706, 1,
1.281056, -0.1891611, 0.5721154, 1, 0, 0.5686275, 1,
1.285453, 0.1070393, 0.08428145, 1, 0, 0.5647059, 1,
1.286219, -1.972541, 2.913886, 1, 0, 0.5568628, 1,
1.289399, 1.512757, 1.513338, 1, 0, 0.5529412, 1,
1.290087, 1.864741, 2.809958, 1, 0, 0.5450981, 1,
1.313551, -0.7563583, 2.015723, 1, 0, 0.5411765, 1,
1.317334, -0.09578198, 1.587773, 1, 0, 0.5333334, 1,
1.318968, -0.4940308, 1.395542, 1, 0, 0.5294118, 1,
1.324744, 0.4793871, -0.2585894, 1, 0, 0.5215687, 1,
1.325991, 1.4244, 1.091896, 1, 0, 0.5176471, 1,
1.360573, 0.1000721, 1.615753, 1, 0, 0.509804, 1,
1.361526, -1.331817, 3.153835, 1, 0, 0.5058824, 1,
1.366513, -0.2641024, 0.04625796, 1, 0, 0.4980392, 1,
1.378337, 0.05857013, 1.873201, 1, 0, 0.4901961, 1,
1.383613, 0.3542269, -0.2411509, 1, 0, 0.4862745, 1,
1.388122, 0.7661613, 1.399596, 1, 0, 0.4784314, 1,
1.416419, -0.29983, 1.361399, 1, 0, 0.4745098, 1,
1.42114, 1.29576, 3.336706, 1, 0, 0.4666667, 1,
1.421256, 0.1026215, 1.542327, 1, 0, 0.4627451, 1,
1.475969, -1.002934, 3.0433, 1, 0, 0.454902, 1,
1.487337, -0.8069, 2.166978, 1, 0, 0.4509804, 1,
1.490712, -0.1911146, 1.902663, 1, 0, 0.4431373, 1,
1.495625, 0.9532496, 1.118654, 1, 0, 0.4392157, 1,
1.538947, 0.8259758, 0.2508458, 1, 0, 0.4313726, 1,
1.544064, -0.1792906, 2.889915, 1, 0, 0.427451, 1,
1.544229, 0.9692396, -0.2222408, 1, 0, 0.4196078, 1,
1.544756, -0.6387398, 1.347621, 1, 0, 0.4156863, 1,
1.54525, 0.8866823, 0.3751598, 1, 0, 0.4078431, 1,
1.558503, -0.9897233, 2.419826, 1, 0, 0.4039216, 1,
1.561574, 0.2844115, 1.382541, 1, 0, 0.3960784, 1,
1.567006, 0.4640644, 0.4604421, 1, 0, 0.3882353, 1,
1.569724, -0.05452202, 1.363086, 1, 0, 0.3843137, 1,
1.578557, -0.5314687, 2.844758, 1, 0, 0.3764706, 1,
1.589389, -1.212336, 2.000081, 1, 0, 0.372549, 1,
1.589735, -0.6166123, 2.607019, 1, 0, 0.3647059, 1,
1.601169, 2.692491, -0.07332708, 1, 0, 0.3607843, 1,
1.606569, 0.6128641, 0.3354306, 1, 0, 0.3529412, 1,
1.614252, 0.9793404, 2.112575, 1, 0, 0.3490196, 1,
1.632278, -0.05829292, 3.755826, 1, 0, 0.3411765, 1,
1.661007, 0.2987694, 2.306323, 1, 0, 0.3372549, 1,
1.673581, 0.4242221, 1.971808, 1, 0, 0.3294118, 1,
1.686406, -0.3459158, 1.864735, 1, 0, 0.3254902, 1,
1.697879, 0.07368926, 1.705411, 1, 0, 0.3176471, 1,
1.70295, -0.910105, 0.6485888, 1, 0, 0.3137255, 1,
1.712916, -1.426057, 3.514918, 1, 0, 0.3058824, 1,
1.714462, -0.4877009, 0.3798323, 1, 0, 0.2980392, 1,
1.725559, -0.2728857, 1.4908, 1, 0, 0.2941177, 1,
1.725641, -0.7310168, 1.465661, 1, 0, 0.2862745, 1,
1.74262, 0.926825, 0.08693924, 1, 0, 0.282353, 1,
1.744217, -0.02098586, -0.6770349, 1, 0, 0.2745098, 1,
1.750037, -1.80139, 0.2933232, 1, 0, 0.2705882, 1,
1.763826, -0.8629171, 2.667777, 1, 0, 0.2627451, 1,
1.767459, 0.8420731, 0.4869401, 1, 0, 0.2588235, 1,
1.78141, 1.016749, 1.556184, 1, 0, 0.2509804, 1,
1.793803, 0.04792513, 1.058395, 1, 0, 0.2470588, 1,
1.806354, 0.3574533, 1.479825, 1, 0, 0.2392157, 1,
1.809074, -0.4937533, 1.555578, 1, 0, 0.2352941, 1,
1.821151, -0.6943465, 2.390822, 1, 0, 0.227451, 1,
1.826085, 1.5531, -0.7308751, 1, 0, 0.2235294, 1,
1.830063, -1.024135, 3.134257, 1, 0, 0.2156863, 1,
1.847741, -1.74808, 3.266707, 1, 0, 0.2117647, 1,
1.851923, 0.04187557, 3.841375, 1, 0, 0.2039216, 1,
1.854675, 2.340556, 0.721604, 1, 0, 0.1960784, 1,
1.85896, 0.5224597, 1.173987, 1, 0, 0.1921569, 1,
1.864781, 0.9187318, 0.5996649, 1, 0, 0.1843137, 1,
1.869371, -1.069146, 0.8074783, 1, 0, 0.1803922, 1,
1.882668, 0.05097662, -0.5805101, 1, 0, 0.172549, 1,
1.925279, 0.2630958, 1.067409, 1, 0, 0.1686275, 1,
1.937024, 0.4687258, 1.001813, 1, 0, 0.1607843, 1,
1.938873, -0.4210036, 2.812417, 1, 0, 0.1568628, 1,
1.940877, 0.5906029, 1.986344, 1, 0, 0.1490196, 1,
1.951429, 2.278688, -0.3862309, 1, 0, 0.145098, 1,
1.974405, 1.069254, 2.142438, 1, 0, 0.1372549, 1,
1.999848, 0.73367, 2.362192, 1, 0, 0.1333333, 1,
2.041705, -0.1928517, 0.6753995, 1, 0, 0.1254902, 1,
2.064379, -0.2079017, 0.5287933, 1, 0, 0.1215686, 1,
2.0646, 0.6166322, 1.797764, 1, 0, 0.1137255, 1,
2.093501, 0.5659662, 0.6903488, 1, 0, 0.1098039, 1,
2.128768, -0.7517936, 2.28556, 1, 0, 0.1019608, 1,
2.135193, 0.4856272, 2.935373, 1, 0, 0.09411765, 1,
2.160837, -0.3864856, 2.530167, 1, 0, 0.09019608, 1,
2.187912, -0.4985475, 0.7405334, 1, 0, 0.08235294, 1,
2.200562, -1.887639, 2.832676, 1, 0, 0.07843138, 1,
2.210456, 1.040864, 0.6231603, 1, 0, 0.07058824, 1,
2.21793, -1.961595, 1.440987, 1, 0, 0.06666667, 1,
2.263164, -0.927953, 1.304437, 1, 0, 0.05882353, 1,
2.267967, -1.107671, 2.049725, 1, 0, 0.05490196, 1,
2.311792, -0.8989404, 1.172388, 1, 0, 0.04705882, 1,
2.316396, 0.02106009, 2.241519, 1, 0, 0.04313726, 1,
2.469694, 0.2640698, 0.4328674, 1, 0, 0.03529412, 1,
2.482552, -0.8672609, 2.258488, 1, 0, 0.03137255, 1,
2.581314, -1.023905, 2.746924, 1, 0, 0.02352941, 1,
2.655322, -0.3441059, 3.270922, 1, 0, 0.01960784, 1,
2.723559, -0.9088472, -0.9783565, 1, 0, 0.01176471, 1,
2.771097, -0.7639206, 3.086419, 1, 0, 0.007843138, 1
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
-0.05516541, -3.94527, -7.214292, 0, -0.5, 0.5, 0.5,
-0.05516541, -3.94527, -7.214292, 1, -0.5, 0.5, 0.5,
-0.05516541, -3.94527, -7.214292, 1, 1.5, 0.5, 0.5,
-0.05516541, -3.94527, -7.214292, 0, 1.5, 0.5, 0.5
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
-3.839531, -0.006249905, -7.214292, 0, -0.5, 0.5, 0.5,
-3.839531, -0.006249905, -7.214292, 1, -0.5, 0.5, 0.5,
-3.839531, -0.006249905, -7.214292, 1, 1.5, 0.5, 0.5,
-3.839531, -0.006249905, -7.214292, 0, 1.5, 0.5, 0.5
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
-3.839531, -3.94527, -0.1378326, 0, -0.5, 0.5, 0.5,
-3.839531, -3.94527, -0.1378326, 1, -0.5, 0.5, 0.5,
-3.839531, -3.94527, -0.1378326, 1, 1.5, 0.5, 0.5,
-3.839531, -3.94527, -0.1378326, 0, 1.5, 0.5, 0.5
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
-2, -3.036265, -5.581263,
2, -3.036265, -5.581263,
-2, -3.036265, -5.581263,
-2, -3.187766, -5.853435,
-1, -3.036265, -5.581263,
-1, -3.187766, -5.853435,
0, -3.036265, -5.581263,
0, -3.187766, -5.853435,
1, -3.036265, -5.581263,
1, -3.187766, -5.853435,
2, -3.036265, -5.581263,
2, -3.187766, -5.853435
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
"-1",
"0",
"1",
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
-2, -3.490767, -6.397778, 0, -0.5, 0.5, 0.5,
-2, -3.490767, -6.397778, 1, -0.5, 0.5, 0.5,
-2, -3.490767, -6.397778, 1, 1.5, 0.5, 0.5,
-2, -3.490767, -6.397778, 0, 1.5, 0.5, 0.5,
-1, -3.490767, -6.397778, 0, -0.5, 0.5, 0.5,
-1, -3.490767, -6.397778, 1, -0.5, 0.5, 0.5,
-1, -3.490767, -6.397778, 1, 1.5, 0.5, 0.5,
-1, -3.490767, -6.397778, 0, 1.5, 0.5, 0.5,
0, -3.490767, -6.397778, 0, -0.5, 0.5, 0.5,
0, -3.490767, -6.397778, 1, -0.5, 0.5, 0.5,
0, -3.490767, -6.397778, 1, 1.5, 0.5, 0.5,
0, -3.490767, -6.397778, 0, 1.5, 0.5, 0.5,
1, -3.490767, -6.397778, 0, -0.5, 0.5, 0.5,
1, -3.490767, -6.397778, 1, -0.5, 0.5, 0.5,
1, -3.490767, -6.397778, 1, 1.5, 0.5, 0.5,
1, -3.490767, -6.397778, 0, 1.5, 0.5, 0.5,
2, -3.490767, -6.397778, 0, -0.5, 0.5, 0.5,
2, -3.490767, -6.397778, 1, -0.5, 0.5, 0.5,
2, -3.490767, -6.397778, 1, 1.5, 0.5, 0.5,
2, -3.490767, -6.397778, 0, 1.5, 0.5, 0.5
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
-2.966216, -2, -5.581263,
-2.966216, 2, -5.581263,
-2.966216, -2, -5.581263,
-3.111769, -2, -5.853435,
-2.966216, -1, -5.581263,
-3.111769, -1, -5.853435,
-2.966216, 0, -5.581263,
-3.111769, 0, -5.853435,
-2.966216, 1, -5.581263,
-3.111769, 1, -5.853435,
-2.966216, 2, -5.581263,
-3.111769, 2, -5.853435
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
-3.402874, -2, -6.397778, 0, -0.5, 0.5, 0.5,
-3.402874, -2, -6.397778, 1, -0.5, 0.5, 0.5,
-3.402874, -2, -6.397778, 1, 1.5, 0.5, 0.5,
-3.402874, -2, -6.397778, 0, 1.5, 0.5, 0.5,
-3.402874, -1, -6.397778, 0, -0.5, 0.5, 0.5,
-3.402874, -1, -6.397778, 1, -0.5, 0.5, 0.5,
-3.402874, -1, -6.397778, 1, 1.5, 0.5, 0.5,
-3.402874, -1, -6.397778, 0, 1.5, 0.5, 0.5,
-3.402874, 0, -6.397778, 0, -0.5, 0.5, 0.5,
-3.402874, 0, -6.397778, 1, -0.5, 0.5, 0.5,
-3.402874, 0, -6.397778, 1, 1.5, 0.5, 0.5,
-3.402874, 0, -6.397778, 0, 1.5, 0.5, 0.5,
-3.402874, 1, -6.397778, 0, -0.5, 0.5, 0.5,
-3.402874, 1, -6.397778, 1, -0.5, 0.5, 0.5,
-3.402874, 1, -6.397778, 1, 1.5, 0.5, 0.5,
-3.402874, 1, -6.397778, 0, 1.5, 0.5, 0.5,
-3.402874, 2, -6.397778, 0, -0.5, 0.5, 0.5,
-3.402874, 2, -6.397778, 1, -0.5, 0.5, 0.5,
-3.402874, 2, -6.397778, 1, 1.5, 0.5, 0.5,
-3.402874, 2, -6.397778, 0, 1.5, 0.5, 0.5
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
-2.966216, -3.036265, -4,
-2.966216, -3.036265, 4,
-2.966216, -3.036265, -4,
-3.111769, -3.187766, -4,
-2.966216, -3.036265, -2,
-3.111769, -3.187766, -2,
-2.966216, -3.036265, 0,
-3.111769, -3.187766, 0,
-2.966216, -3.036265, 2,
-3.111769, -3.187766, 2,
-2.966216, -3.036265, 4,
-3.111769, -3.187766, 4
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
-3.402874, -3.490767, -4, 0, -0.5, 0.5, 0.5,
-3.402874, -3.490767, -4, 1, -0.5, 0.5, 0.5,
-3.402874, -3.490767, -4, 1, 1.5, 0.5, 0.5,
-3.402874, -3.490767, -4, 0, 1.5, 0.5, 0.5,
-3.402874, -3.490767, -2, 0, -0.5, 0.5, 0.5,
-3.402874, -3.490767, -2, 1, -0.5, 0.5, 0.5,
-3.402874, -3.490767, -2, 1, 1.5, 0.5, 0.5,
-3.402874, -3.490767, -2, 0, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 0, 0, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 0, 1, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 0, 1, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 0, 0, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 2, 0, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 2, 1, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 2, 1, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 2, 0, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 4, 0, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 4, 1, -0.5, 0.5, 0.5,
-3.402874, -3.490767, 4, 1, 1.5, 0.5, 0.5,
-3.402874, -3.490767, 4, 0, 1.5, 0.5, 0.5
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
-2.966216, -3.036265, -5.581263,
-2.966216, 3.023765, -5.581263,
-2.966216, -3.036265, 5.305598,
-2.966216, 3.023765, 5.305598,
-2.966216, -3.036265, -5.581263,
-2.966216, -3.036265, 5.305598,
-2.966216, 3.023765, -5.581263,
-2.966216, 3.023765, 5.305598,
-2.966216, -3.036265, -5.581263,
2.855885, -3.036265, -5.581263,
-2.966216, -3.036265, 5.305598,
2.855885, -3.036265, 5.305598,
-2.966216, 3.023765, -5.581263,
2.855885, 3.023765, -5.581263,
-2.966216, 3.023765, 5.305598,
2.855885, 3.023765, 5.305598,
2.855885, -3.036265, -5.581263,
2.855885, 3.023765, -5.581263,
2.855885, -3.036265, 5.305598,
2.855885, 3.023765, 5.305598,
2.855885, -3.036265, -5.581263,
2.855885, -3.036265, 5.305598,
2.855885, 3.023765, -5.581263,
2.855885, 3.023765, 5.305598
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
var radius = 7.343826;
var distance = 32.67352;
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
mvMatrix.translate( 0.05516541, 0.006249905, 0.1378326 );
mvMatrix.scale( 1.363818, 1.310272, 0.729346 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.67352);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
cyromazine<-read.table("cyromazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyromazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
```

```r
y<-cyromazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
```

```r
z<-cyromazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
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
-2.881428, -1.138997, -1.520885, 0, 0, 1, 1, 1,
-2.698052, 0.07372267, -2.184669, 1, 0, 0, 1, 1,
-2.60078, -0.1311622, -0.4212981, 1, 0, 0, 1, 1,
-2.587667, 1.202103, -1.139852, 1, 0, 0, 1, 1,
-2.383166, -1.51403, -2.815948, 1, 0, 0, 1, 1,
-2.356356, 0.3932138, 0.2796372, 1, 0, 0, 1, 1,
-2.352821, 0.4660605, -2.42429, 0, 0, 0, 1, 1,
-2.336381, -0.673382, -0.7542866, 0, 0, 0, 1, 1,
-2.322284, 0.2068209, -3.228319, 0, 0, 0, 1, 1,
-2.266905, 1.107074, -0.6349438, 0, 0, 0, 1, 1,
-2.185356, -0.3091114, -2.521297, 0, 0, 0, 1, 1,
-2.086324, -1.202665, -2.390255, 0, 0, 0, 1, 1,
-2.075604, 1.957003, -2.357215, 0, 0, 0, 1, 1,
-2.061126, -0.268606, -2.037368, 1, 1, 1, 1, 1,
-2.052996, 0.6157615, -1.794795, 1, 1, 1, 1, 1,
-2.042202, -0.2696115, -0.02144332, 1, 1, 1, 1, 1,
-2.034543, 0.4244862, -1.556636, 1, 1, 1, 1, 1,
-2.00465, 0.3499525, -0.2476529, 1, 1, 1, 1, 1,
-1.99618, 0.3397006, -1.69479, 1, 1, 1, 1, 1,
-1.971354, 0.5260101, -0.5702187, 1, 1, 1, 1, 1,
-1.947338, 0.8482953, -0.7032716, 1, 1, 1, 1, 1,
-1.940227, 1.686434, -1.634119, 1, 1, 1, 1, 1,
-1.913937, 0.1992564, 0.1608977, 1, 1, 1, 1, 1,
-1.91134, -0.1123153, -1.698668, 1, 1, 1, 1, 1,
-1.910993, -0.7125275, -1.708977, 1, 1, 1, 1, 1,
-1.903011, -1.700016, -2.166561, 1, 1, 1, 1, 1,
-1.900608, -2.122832, -2.851693, 1, 1, 1, 1, 1,
-1.863673, -0.7654262, -1.481477, 1, 1, 1, 1, 1,
-1.848094, -1.15047, -0.2151622, 0, 0, 1, 1, 1,
-1.845516, -0.340648, -1.734275, 1, 0, 0, 1, 1,
-1.841955, -2.948012, -3.09665, 1, 0, 0, 1, 1,
-1.827822, 0.4424585, 1.02388, 1, 0, 0, 1, 1,
-1.817189, 1.484889, -0.9926517, 1, 0, 0, 1, 1,
-1.813054, 0.9821006, -1.051167, 1, 0, 0, 1, 1,
-1.804051, -1.510427, -1.477974, 0, 0, 0, 1, 1,
-1.802632, 0.7462937, -0.7556093, 0, 0, 0, 1, 1,
-1.782256, -1.170578, -0.5000948, 0, 0, 0, 1, 1,
-1.778635, -2.280167, -2.049047, 0, 0, 0, 1, 1,
-1.732686, 1.35838, -2.195035, 0, 0, 0, 1, 1,
-1.71133, -0.3665925, -2.587757, 0, 0, 0, 1, 1,
-1.706192, -0.3376547, -1.429057, 0, 0, 0, 1, 1,
-1.688858, 0.9124117, 0.0226054, 1, 1, 1, 1, 1,
-1.683013, 1.332625, -0.793749, 1, 1, 1, 1, 1,
-1.682447, -1.164552, -1.19536, 1, 1, 1, 1, 1,
-1.671462, 1.477105, -1.592553, 1, 1, 1, 1, 1,
-1.657651, 1.207231, -1.19931, 1, 1, 1, 1, 1,
-1.651974, -0.1971375, -1.398354, 1, 1, 1, 1, 1,
-1.645273, -1.437884, -2.911261, 1, 1, 1, 1, 1,
-1.634805, -0.360631, 0.0471937, 1, 1, 1, 1, 1,
-1.617444, 0.4492012, -0.9078779, 1, 1, 1, 1, 1,
-1.60716, 2.103918, -0.6117727, 1, 1, 1, 1, 1,
-1.599703, 1.350368, -1.03531, 1, 1, 1, 1, 1,
-1.586969, 1.427361, -0.7191864, 1, 1, 1, 1, 1,
-1.534063, -1.366961, -3.420945, 1, 1, 1, 1, 1,
-1.526151, -1.667341, -3.731087, 1, 1, 1, 1, 1,
-1.521305, -0.07218024, -2.2868, 1, 1, 1, 1, 1,
-1.496691, -0.175199, -2.115137, 0, 0, 1, 1, 1,
-1.488111, 0.1359785, -2.643442, 1, 0, 0, 1, 1,
-1.476823, 0.7685676, -0.01660297, 1, 0, 0, 1, 1,
-1.466813, -1.21389, -2.395469, 1, 0, 0, 1, 1,
-1.449106, 2.186575, 1.665075, 1, 0, 0, 1, 1,
-1.448154, 0.2205138, -1.124594, 1, 0, 0, 1, 1,
-1.4452, 0.9831616, -2.025134, 0, 0, 0, 1, 1,
-1.443463, 0.04363842, -2.065795, 0, 0, 0, 1, 1,
-1.442817, 0.2421209, -1.798282, 0, 0, 0, 1, 1,
-1.439383, -0.6190989, -2.345598, 0, 0, 0, 1, 1,
-1.437122, 0.3449792, -0.7024261, 0, 0, 0, 1, 1,
-1.430071, 0.7657477, -2.257609, 0, 0, 0, 1, 1,
-1.417318, -1.791289, -2.085886, 0, 0, 0, 1, 1,
-1.409685, 0.609451, 0.8394743, 1, 1, 1, 1, 1,
-1.407225, -0.1765547, -1.70713, 1, 1, 1, 1, 1,
-1.406459, 1.081777, -0.8218367, 1, 1, 1, 1, 1,
-1.394083, -0.4876716, -3.989749, 1, 1, 1, 1, 1,
-1.393302, -0.988353, -1.757716, 1, 1, 1, 1, 1,
-1.388623, 0.1468859, -1.264225, 1, 1, 1, 1, 1,
-1.377083, -0.6637224, -4.206296, 1, 1, 1, 1, 1,
-1.375624, -0.5820835, -0.3351686, 1, 1, 1, 1, 1,
-1.373204, 1.44226, -0.8273581, 1, 1, 1, 1, 1,
-1.36385, -0.02714735, -1.337717, 1, 1, 1, 1, 1,
-1.361826, -0.06349073, -2.440544, 1, 1, 1, 1, 1,
-1.3479, -2.851736, -2.758791, 1, 1, 1, 1, 1,
-1.344441, 0.4431206, -0.2955927, 1, 1, 1, 1, 1,
-1.344341, 1.041601, -1.61288, 1, 1, 1, 1, 1,
-1.342633, 1.700689, 1.674779, 1, 1, 1, 1, 1,
-1.341487, -1.447335, -1.814955, 0, 0, 1, 1, 1,
-1.32571, -1.140514, -2.120138, 1, 0, 0, 1, 1,
-1.324508, 0.1474717, -1.744324, 1, 0, 0, 1, 1,
-1.315328, -1.05448, -4.612051, 1, 0, 0, 1, 1,
-1.301607, -0.354352, -0.3942219, 1, 0, 0, 1, 1,
-1.29265, -0.5033382, -1.723485, 1, 0, 0, 1, 1,
-1.286094, 0.5036566, -0.8148246, 0, 0, 0, 1, 1,
-1.280717, -1.348817, -3.410988, 0, 0, 0, 1, 1,
-1.269171, -0.6590703, -0.408137, 0, 0, 0, 1, 1,
-1.265837, -1.20308, -2.40305, 0, 0, 0, 1, 1,
-1.265118, 1.920552, -1.186529, 0, 0, 0, 1, 1,
-1.258071, 0.3008923, -0.5093089, 0, 0, 0, 1, 1,
-1.255993, -1.52358, -2.301188, 0, 0, 0, 1, 1,
-1.255529, 1.101309, -0.5630697, 1, 1, 1, 1, 1,
-1.249536, -0.896315, -2.386905, 1, 1, 1, 1, 1,
-1.243659, -0.3908081, -3.045869, 1, 1, 1, 1, 1,
-1.239339, -0.8757495, -1.784006, 1, 1, 1, 1, 1,
-1.233112, 0.1637286, -1.251687, 1, 1, 1, 1, 1,
-1.229718, 1.4329, -2.016473, 1, 1, 1, 1, 1,
-1.224717, -0.1465157, -2.231801, 1, 1, 1, 1, 1,
-1.215615, 2.389615, 0.01995639, 1, 1, 1, 1, 1,
-1.187059, 0.8444735, -1.805522, 1, 1, 1, 1, 1,
-1.184835, -1.338228, -3.155905, 1, 1, 1, 1, 1,
-1.183966, -1.594284, -2.447451, 1, 1, 1, 1, 1,
-1.18358, 0.7611897, -0.6712518, 1, 1, 1, 1, 1,
-1.182997, -0.02621861, -1.863234, 1, 1, 1, 1, 1,
-1.17992, 2.095613, -2.239513, 1, 1, 1, 1, 1,
-1.174898, -0.01015717, -1.291775, 1, 1, 1, 1, 1,
-1.169146, 0.3386096, -0.5225554, 0, 0, 1, 1, 1,
-1.168085, 1.329373, -1.322877, 1, 0, 0, 1, 1,
-1.15727, 0.002808173, -2.990272, 1, 0, 0, 1, 1,
-1.154633, 0.4238857, -1.293937, 1, 0, 0, 1, 1,
-1.150562, -0.9752164, -0.629721, 1, 0, 0, 1, 1,
-1.145349, 1.114129, -0.9109704, 1, 0, 0, 1, 1,
-1.144231, 0.2150197, -0.6441947, 0, 0, 0, 1, 1,
-1.138347, 1.242087, -1.305419, 0, 0, 0, 1, 1,
-1.136182, -1.214068, -0.5976394, 0, 0, 0, 1, 1,
-1.133737, 2.751181, 0.2422013, 0, 0, 0, 1, 1,
-1.133642, -1.467756, -2.477913, 0, 0, 0, 1, 1,
-1.126774, 0.05818157, -1.767754, 0, 0, 0, 1, 1,
-1.117439, 0.6701424, -2.258595, 0, 0, 0, 1, 1,
-1.116241, 0.7033705, -1.523726, 1, 1, 1, 1, 1,
-1.115741, 0.1884685, -1.391054, 1, 1, 1, 1, 1,
-1.111406, -0.6482136, -3.090474, 1, 1, 1, 1, 1,
-1.109327, -0.02226801, -0.7016445, 1, 1, 1, 1, 1,
-1.107275, 0.9927489, 0.25709, 1, 1, 1, 1, 1,
-1.105147, 2.414137, -0.2300559, 1, 1, 1, 1, 1,
-1.100904, 0.4328155, -2.224211, 1, 1, 1, 1, 1,
-1.0996, 1.264766, 0.8029937, 1, 1, 1, 1, 1,
-1.087918, -0.7087808, -1.828622, 1, 1, 1, 1, 1,
-1.08657, 0.07721239, -2.195001, 1, 1, 1, 1, 1,
-1.085537, 1.019386, -3.099204, 1, 1, 1, 1, 1,
-1.082116, 1.691853, -0.01269799, 1, 1, 1, 1, 1,
-1.079099, 0.5270222, 2.032975, 1, 1, 1, 1, 1,
-1.075441, 2.935513, 0.166977, 1, 1, 1, 1, 1,
-1.07454, 0.3052917, 0.184717, 1, 1, 1, 1, 1,
-1.071398, -0.9889681, -3.504451, 0, 0, 1, 1, 1,
-1.068423, 2.274634, -1.414829, 1, 0, 0, 1, 1,
-1.059217, -0.1920993, -2.722624, 1, 0, 0, 1, 1,
-1.055944, 1.435898, 0.1305622, 1, 0, 0, 1, 1,
-1.055936, -1.753971, -1.993933, 1, 0, 0, 1, 1,
-1.048795, 0.9362529, 0.3591624, 1, 0, 0, 1, 1,
-1.042846, 0.1304163, -1.327314, 0, 0, 0, 1, 1,
-1.042506, 0.2150958, -1.518131, 0, 0, 0, 1, 1,
-1.041417, -0.1108674, -1.732258, 0, 0, 0, 1, 1,
-1.04033, 0.8617892, -1.203536, 0, 0, 0, 1, 1,
-1.037936, -0.239973, -1.177132, 0, 0, 0, 1, 1,
-1.037241, 1.244521, -0.2258846, 0, 0, 0, 1, 1,
-1.032212, 0.7334314, -2.67477, 0, 0, 0, 1, 1,
-1.024686, -0.4715185, -1.171946, 1, 1, 1, 1, 1,
-1.023265, -0.9897594, -3.361161, 1, 1, 1, 1, 1,
-1.02138, 0.531743, -0.7780393, 1, 1, 1, 1, 1,
-1.018932, 0.7261568, -0.938913, 1, 1, 1, 1, 1,
-1.011058, -0.6978171, -2.022829, 1, 1, 1, 1, 1,
-1.001054, 0.36373, 1.029072, 1, 1, 1, 1, 1,
-0.9974281, -0.0827852, -0.347799, 1, 1, 1, 1, 1,
-0.9872151, -0.4810543, -2.69638, 1, 1, 1, 1, 1,
-0.982425, 0.3346581, -1.660158, 1, 1, 1, 1, 1,
-0.981794, 2.643348, -0.9874122, 1, 1, 1, 1, 1,
-0.9692222, 0.3608729, -1.674597, 1, 1, 1, 1, 1,
-0.9674015, 0.5211672, -1.247179, 1, 1, 1, 1, 1,
-0.9631469, -1.850894, -3.523811, 1, 1, 1, 1, 1,
-0.9595841, 0.2925627, -0.1623266, 1, 1, 1, 1, 1,
-0.9586391, -0.7451563, -1.826482, 1, 1, 1, 1, 1,
-0.9534575, -0.3564748, 0.2744357, 0, 0, 1, 1, 1,
-0.9471338, -0.6783355, -2.093397, 1, 0, 0, 1, 1,
-0.9467429, 0.1233417, -0.6504492, 1, 0, 0, 1, 1,
-0.9333583, 0.7023374, -0.93871, 1, 0, 0, 1, 1,
-0.9326162, -0.5045242, -1.469871, 1, 0, 0, 1, 1,
-0.9310551, 1.585914, -1.062918, 1, 0, 0, 1, 1,
-0.9310347, 0.9099591, -0.7110821, 0, 0, 0, 1, 1,
-0.9248086, 0.6117513, -1.343101, 0, 0, 0, 1, 1,
-0.91926, 1.034918, -0.2839793, 0, 0, 0, 1, 1,
-0.9080301, 0.5355726, -1.915832, 0, 0, 0, 1, 1,
-0.9078932, 0.01271583, -2.378036, 0, 0, 0, 1, 1,
-0.9073814, 0.4888105, -2.501387, 0, 0, 0, 1, 1,
-0.9053629, -0.8703596, -2.026074, 0, 0, 0, 1, 1,
-0.8867872, -1.115662, -1.791084, 1, 1, 1, 1, 1,
-0.8835243, -1.485615, -1.504749, 1, 1, 1, 1, 1,
-0.8833315, 2.027834, -0.1930643, 1, 1, 1, 1, 1,
-0.8826681, 0.2526443, -3.27903, 1, 1, 1, 1, 1,
-0.8822701, 0.3130307, -0.2187491, 1, 1, 1, 1, 1,
-0.8818053, -2.135998, -3.159379, 1, 1, 1, 1, 1,
-0.8788568, -0.06046913, -2.608978, 1, 1, 1, 1, 1,
-0.8769825, 2.438605, 0.8439917, 1, 1, 1, 1, 1,
-0.8613072, -0.5121323, -1.831063, 1, 1, 1, 1, 1,
-0.8579282, 1.531769, -0.6457447, 1, 1, 1, 1, 1,
-0.8553851, 0.7908047, -0.5644419, 1, 1, 1, 1, 1,
-0.8552674, 0.9117678, -1.866524, 1, 1, 1, 1, 1,
-0.8339754, -2.100211, -2.849634, 1, 1, 1, 1, 1,
-0.8328373, -0.6796879, -3.764243, 1, 1, 1, 1, 1,
-0.8306634, -0.368161, -2.345673, 1, 1, 1, 1, 1,
-0.8285005, 0.4507613, -0.4415125, 0, 0, 1, 1, 1,
-0.8267605, 0.2402834, -2.277993, 1, 0, 0, 1, 1,
-0.8192727, -1.023849, -1.947661, 1, 0, 0, 1, 1,
-0.8189154, 0.1169035, 0.5710404, 1, 0, 0, 1, 1,
-0.8162338, -1.402402, -3.404579, 1, 0, 0, 1, 1,
-0.8123194, -1.542494, -1.728636, 1, 0, 0, 1, 1,
-0.8087407, -0.4819958, -2.811188, 0, 0, 0, 1, 1,
-0.802417, -0.6776158, -3.498579, 0, 0, 0, 1, 1,
-0.8019038, -1.293523, -2.434703, 0, 0, 0, 1, 1,
-0.8009232, -1.358066, -1.790125, 0, 0, 0, 1, 1,
-0.8007853, -0.7229701, -1.233405, 0, 0, 0, 1, 1,
-0.792124, 0.7542102, -0.629849, 0, 0, 0, 1, 1,
-0.7906938, 0.862484, -0.5196117, 0, 0, 0, 1, 1,
-0.7888122, 1.34524, 0.07566153, 1, 1, 1, 1, 1,
-0.7886795, -0.8310869, -3.293264, 1, 1, 1, 1, 1,
-0.7866302, 1.322469, 0.48282, 1, 1, 1, 1, 1,
-0.7812434, 1.714141, 0.8613107, 1, 1, 1, 1, 1,
-0.7726033, -0.1232567, -3.082311, 1, 1, 1, 1, 1,
-0.7721198, -0.1128524, -2.934496, 1, 1, 1, 1, 1,
-0.7719524, 2.060189, -1.380169, 1, 1, 1, 1, 1,
-0.7700995, 1.469816, -0.1800469, 1, 1, 1, 1, 1,
-0.7669058, 0.6336895, -0.6236295, 1, 1, 1, 1, 1,
-0.7620811, -0.4214106, -2.489149, 1, 1, 1, 1, 1,
-0.7591247, -1.745028, -2.941165, 1, 1, 1, 1, 1,
-0.7526322, 0.8347077, 0.07124578, 1, 1, 1, 1, 1,
-0.7481648, 0.5150897, -0.2694745, 1, 1, 1, 1, 1,
-0.7478378, 1.611937, -0.9496647, 1, 1, 1, 1, 1,
-0.7465418, 0.3713748, -1.49946, 1, 1, 1, 1, 1,
-0.745262, -2.760681, -1.71824, 0, 0, 1, 1, 1,
-0.741217, -0.4608559, -1.898668, 1, 0, 0, 1, 1,
-0.7368625, -0.9669555, -3.751749, 1, 0, 0, 1, 1,
-0.7355754, -0.8044338, -3.617588, 1, 0, 0, 1, 1,
-0.7308568, -1.193292, -3.070044, 1, 0, 0, 1, 1,
-0.7254283, -2.138693, -5.273716, 1, 0, 0, 1, 1,
-0.7218722, 1.075286, -1.39792, 0, 0, 0, 1, 1,
-0.7187706, 0.4641678, -1.131212, 0, 0, 0, 1, 1,
-0.7131807, 0.6291347, -0.03206602, 0, 0, 0, 1, 1,
-0.7107534, -1.097219, -2.467276, 0, 0, 0, 1, 1,
-0.7064202, -0.9176154, -3.030409, 0, 0, 0, 1, 1,
-0.7050776, 2.72999, 0.6258059, 0, 0, 0, 1, 1,
-0.7038213, -0.7466384, -2.554781, 0, 0, 0, 1, 1,
-0.703297, -0.2510514, -2.116194, 1, 1, 1, 1, 1,
-0.7016196, -0.8958147, -2.385756, 1, 1, 1, 1, 1,
-0.7008349, -0.6778582, -2.175802, 1, 1, 1, 1, 1,
-0.7001054, 0.329608, -0.739399, 1, 1, 1, 1, 1,
-0.688612, -0.2895165, -3.704463, 1, 1, 1, 1, 1,
-0.6886004, 0.2454553, -1.839498, 1, 1, 1, 1, 1,
-0.6876358, -0.860518, -1.02144, 1, 1, 1, 1, 1,
-0.6873459, -0.03690553, -1.343215, 1, 1, 1, 1, 1,
-0.6747516, -0.5845194, -2.203961, 1, 1, 1, 1, 1,
-0.6694025, -0.7967509, -3.532253, 1, 1, 1, 1, 1,
-0.668166, 0.7842758, 0.6350754, 1, 1, 1, 1, 1,
-0.661325, 0.5523964, -1.248706, 1, 1, 1, 1, 1,
-0.6603736, -0.3379836, -2.694836, 1, 1, 1, 1, 1,
-0.6558358, 0.3780883, 0.1755216, 1, 1, 1, 1, 1,
-0.6528852, 1.090118, -0.2966711, 1, 1, 1, 1, 1,
-0.6476799, 0.5983967, -0.1071473, 0, 0, 1, 1, 1,
-0.6472098, -1.205763, -4.463901, 1, 0, 0, 1, 1,
-0.6449021, -1.37715, -2.823108, 1, 0, 0, 1, 1,
-0.64342, -1.016966, -2.433962, 1, 0, 0, 1, 1,
-0.6405441, 0.1456201, -1.745756, 1, 0, 0, 1, 1,
-0.6404056, 0.4322841, -1.689292, 1, 0, 0, 1, 1,
-0.6394569, -1.290465, -3.875492, 0, 0, 0, 1, 1,
-0.633944, 0.4296715, -1.016138, 0, 0, 0, 1, 1,
-0.6318069, 2.581576, 0.4138317, 0, 0, 0, 1, 1,
-0.6303734, 0.7955101, -3.142893, 0, 0, 0, 1, 1,
-0.6298785, 0.1632056, -0.8697864, 0, 0, 0, 1, 1,
-0.6297747, -0.6268281, -3.213453, 0, 0, 0, 1, 1,
-0.6255521, 0.2730139, -1.509499, 0, 0, 0, 1, 1,
-0.6236563, 0.3714828, -1.111468, 1, 1, 1, 1, 1,
-0.6230695, -0.1466218, -1.824253, 1, 1, 1, 1, 1,
-0.621784, 0.2034331, -1.20119, 1, 1, 1, 1, 1,
-0.620999, 0.5676757, -0.7487742, 1, 1, 1, 1, 1,
-0.6187438, -0.853797, -2.960882, 1, 1, 1, 1, 1,
-0.6053404, 0.3311173, -0.7295194, 1, 1, 1, 1, 1,
-0.6039886, 0.5426186, -0.09936535, 1, 1, 1, 1, 1,
-0.6022039, -0.1158844, -0.6948043, 1, 1, 1, 1, 1,
-0.6017404, 0.02745089, -2.225697, 1, 1, 1, 1, 1,
-0.5996068, -0.0135225, -2.154808, 1, 1, 1, 1, 1,
-0.5993327, -0.5000793, -1.612813, 1, 1, 1, 1, 1,
-0.59702, -1.601693, -2.822001, 1, 1, 1, 1, 1,
-0.5968865, 0.1643134, -0.6065369, 1, 1, 1, 1, 1,
-0.5898934, 1.06641, -0.4805148, 1, 1, 1, 1, 1,
-0.5848892, 0.8432308, -1.611377, 1, 1, 1, 1, 1,
-0.5819775, 0.1214309, -0.7916558, 0, 0, 1, 1, 1,
-0.5802846, 0.8896576, -1.56831, 1, 0, 0, 1, 1,
-0.5792407, -0.7979054, -3.539393, 1, 0, 0, 1, 1,
-0.5723887, -1.009683, -3.114245, 1, 0, 0, 1, 1,
-0.5713989, 0.5813705, -0.007475097, 1, 0, 0, 1, 1,
-0.5688358, 0.7193429, -2.096428, 1, 0, 0, 1, 1,
-0.5679619, -1.425268, -1.607645, 0, 0, 0, 1, 1,
-0.5660477, 0.1869548, -2.836886, 0, 0, 0, 1, 1,
-0.5631117, 0.3879703, -2.088098, 0, 0, 0, 1, 1,
-0.5626763, 0.8276187, -2.682777, 0, 0, 0, 1, 1,
-0.56079, 0.1682761, -0.4123082, 0, 0, 0, 1, 1,
-0.5582952, -1.033582, -2.785266, 0, 0, 0, 1, 1,
-0.5566457, 0.06946816, -1.481304, 0, 0, 0, 1, 1,
-0.5560745, -0.3579183, -3.147638, 1, 1, 1, 1, 1,
-0.5553758, -0.6480068, -1.797907, 1, 1, 1, 1, 1,
-0.5546912, -1.906876, -3.825431, 1, 1, 1, 1, 1,
-0.5529928, -1.695006, -1.635557, 1, 1, 1, 1, 1,
-0.552658, -0.3038121, -3.219597, 1, 1, 1, 1, 1,
-0.5514498, 1.559824, -1.094802, 1, 1, 1, 1, 1,
-0.549637, -0.2277751, -3.749518, 1, 1, 1, 1, 1,
-0.5477007, 0.04726923, -0.1006378, 1, 1, 1, 1, 1,
-0.5453758, -0.8693764, -2.378062, 1, 1, 1, 1, 1,
-0.5419663, -0.09814005, -0.8603379, 1, 1, 1, 1, 1,
-0.5399008, -0.7457669, -1.495007, 1, 1, 1, 1, 1,
-0.538265, -0.3747829, -3.570235, 1, 1, 1, 1, 1,
-0.5327812, 0.4754969, -0.5297632, 1, 1, 1, 1, 1,
-0.5190569, -0.554346, -1.161785, 1, 1, 1, 1, 1,
-0.5063073, 0.01725354, -0.6590399, 1, 1, 1, 1, 1,
-0.5032787, -0.9330561, -2.713052, 0, 0, 1, 1, 1,
-0.5018718, 0.7400633, -0.4669589, 1, 0, 0, 1, 1,
-0.5017821, 0.9823436, 0.4336987, 1, 0, 0, 1, 1,
-0.4975864, -1.079417, -2.429898, 1, 0, 0, 1, 1,
-0.4966827, -0.4879399, -2.290843, 1, 0, 0, 1, 1,
-0.4895123, -1.125093, -2.466636, 1, 0, 0, 1, 1,
-0.4894998, -1.239952, -2.694068, 0, 0, 0, 1, 1,
-0.4882596, -0.6850969, -2.935192, 0, 0, 0, 1, 1,
-0.4860525, 1.497051, -1.687616, 0, 0, 0, 1, 1,
-0.482038, -1.268982, -2.827678, 0, 0, 0, 1, 1,
-0.478487, 0.590549, -1.661047, 0, 0, 0, 1, 1,
-0.4779686, -0.5490341, -2.488487, 0, 0, 0, 1, 1,
-0.4738738, -1.098751, -2.854717, 0, 0, 0, 1, 1,
-0.4704929, -0.694016, -2.359699, 1, 1, 1, 1, 1,
-0.4696816, -0.2711407, -2.62611, 1, 1, 1, 1, 1,
-0.4656771, -0.6771123, -1.262249, 1, 1, 1, 1, 1,
-0.4644091, 0.4790683, -0.5762434, 1, 1, 1, 1, 1,
-0.4639961, -1.697778, -3.170256, 1, 1, 1, 1, 1,
-0.4628671, 0.5876871, -2.598976, 1, 1, 1, 1, 1,
-0.4614078, 0.2423011, -0.8935053, 1, 1, 1, 1, 1,
-0.4572761, 0.3849528, -2.795797, 1, 1, 1, 1, 1,
-0.4526849, 2.328121, 0.3601787, 1, 1, 1, 1, 1,
-0.4493476, -0.7734652, -3.479811, 1, 1, 1, 1, 1,
-0.448942, 2.031295, 0.208404, 1, 1, 1, 1, 1,
-0.4450096, 0.01448243, -2.033201, 1, 1, 1, 1, 1,
-0.4445913, 1.208102, -1.244794, 1, 1, 1, 1, 1,
-0.4422454, 0.2925495, -2.800949, 1, 1, 1, 1, 1,
-0.4415736, 1.169403, -0.02492293, 1, 1, 1, 1, 1,
-0.4373325, 0.3204325, 0.02373562, 0, 0, 1, 1, 1,
-0.4342826, -0.433805, -1.787918, 1, 0, 0, 1, 1,
-0.4328328, -0.5141434, -2.264585, 1, 0, 0, 1, 1,
-0.4265276, 0.5836393, -1.986509, 1, 0, 0, 1, 1,
-0.4253659, 0.07123701, -2.739531, 1, 0, 0, 1, 1,
-0.4246718, -1.091895, -3.679556, 1, 0, 0, 1, 1,
-0.4221292, -2.520072, -3.509876, 0, 0, 0, 1, 1,
-0.4213356, 0.327402, -1.42914, 0, 0, 0, 1, 1,
-0.4144277, 0.2628832, -1.019765, 0, 0, 0, 1, 1,
-0.4129517, -0.3734711, -2.803279, 0, 0, 0, 1, 1,
-0.4106469, 0.4029222, -0.8692105, 0, 0, 0, 1, 1,
-0.4093172, 0.34726, -1.14278, 0, 0, 0, 1, 1,
-0.4086406, 0.4805296, -1.940095, 0, 0, 0, 1, 1,
-0.4084307, -0.06569707, -0.7847517, 1, 1, 1, 1, 1,
-0.407164, -1.002024, -3.554216, 1, 1, 1, 1, 1,
-0.4035808, 0.294557, -2.179904, 1, 1, 1, 1, 1,
-0.3999116, -0.3081294, -1.173358, 1, 1, 1, 1, 1,
-0.3953402, 0.6366588, -2.194548, 1, 1, 1, 1, 1,
-0.3937331, -1.249525, -1.765395, 1, 1, 1, 1, 1,
-0.389662, 2.040615, -0.4843913, 1, 1, 1, 1, 1,
-0.3871574, -1.102897, -4.116314, 1, 1, 1, 1, 1,
-0.387067, -1.172782, -2.050714, 1, 1, 1, 1, 1,
-0.3867781, 0.1618287, 1.175277, 1, 1, 1, 1, 1,
-0.3862239, -0.3660807, -3.774866, 1, 1, 1, 1, 1,
-0.3805133, -1.029694, -1.719296, 1, 1, 1, 1, 1,
-0.3781195, -0.5696408, -2.783008, 1, 1, 1, 1, 1,
-0.3778812, -0.1416867, -2.234449, 1, 1, 1, 1, 1,
-0.371756, -0.4095641, -3.689618, 1, 1, 1, 1, 1,
-0.3714852, -0.9827111, -0.833928, 0, 0, 1, 1, 1,
-0.3710944, -1.474724, -1.005991, 1, 0, 0, 1, 1,
-0.3708983, 1.151192, 0.8817196, 1, 0, 0, 1, 1,
-0.3665543, -1.156047, -4.143756, 1, 0, 0, 1, 1,
-0.3630949, -1.940325, -2.170714, 1, 0, 0, 1, 1,
-0.3629444, 0.3144796, -2.492727, 1, 0, 0, 1, 1,
-0.3585855, 1.216409, -1.691653, 0, 0, 0, 1, 1,
-0.3583512, 1.948877, -0.8677657, 0, 0, 0, 1, 1,
-0.3542505, 0.02217545, -2.315291, 0, 0, 0, 1, 1,
-0.3526375, 0.9001307, -0.8891372, 0, 0, 0, 1, 1,
-0.3524962, 0.8967174, -1.941463, 0, 0, 0, 1, 1,
-0.3512912, -1.393439, -2.604767, 0, 0, 0, 1, 1,
-0.3487888, 0.1672997, 0.1433071, 0, 0, 0, 1, 1,
-0.3485167, 0.01181795, -1.601889, 1, 1, 1, 1, 1,
-0.3483289, -0.4202133, -3.543219, 1, 1, 1, 1, 1,
-0.3476842, 0.156111, -2.476681, 1, 1, 1, 1, 1,
-0.3452753, -1.318787, -2.713427, 1, 1, 1, 1, 1,
-0.3444497, 1.028667, 0.404735, 1, 1, 1, 1, 1,
-0.3438587, -0.2969421, -1.691363, 1, 1, 1, 1, 1,
-0.3406622, 0.9294076, -0.9870329, 1, 1, 1, 1, 1,
-0.3362865, 1.906598, -0.5004964, 1, 1, 1, 1, 1,
-0.3316531, -1.408919, -2.54761, 1, 1, 1, 1, 1,
-0.3312953, 0.02131511, -1.79381, 1, 1, 1, 1, 1,
-0.3280717, 1.200218, -0.4076794, 1, 1, 1, 1, 1,
-0.3274982, 1.080787, -1.534323, 1, 1, 1, 1, 1,
-0.3239699, -0.3077278, -2.401052, 1, 1, 1, 1, 1,
-0.3228802, 1.13919, 0.1076446, 1, 1, 1, 1, 1,
-0.3222898, -1.020535, -4.112871, 1, 1, 1, 1, 1,
-0.3218581, -0.6028765, -3.121636, 0, 0, 1, 1, 1,
-0.3198963, -1.50661, -2.769488, 1, 0, 0, 1, 1,
-0.3188693, 0.189317, -3.522243, 1, 0, 0, 1, 1,
-0.3098354, -0.9192948, -2.65368, 1, 0, 0, 1, 1,
-0.3057801, 1.043229, 0.9381932, 1, 0, 0, 1, 1,
-0.3056505, -0.2299927, -0.2679565, 1, 0, 0, 1, 1,
-0.2994148, 1.698439, 0.5251109, 0, 0, 0, 1, 1,
-0.2972899, 0.5867579, -2.388614, 0, 0, 0, 1, 1,
-0.2880089, 0.4604478, -1.611423, 0, 0, 0, 1, 1,
-0.282955, 0.2639302, -0.2108923, 0, 0, 0, 1, 1,
-0.278573, 0.05604207, -1.500284, 0, 0, 0, 1, 1,
-0.2771673, 0.2620237, -0.4808081, 0, 0, 0, 1, 1,
-0.2755694, -0.7951114, -2.322722, 0, 0, 0, 1, 1,
-0.269518, 0.0435809, -1.368975, 1, 1, 1, 1, 1,
-0.2689433, -2.532121, -3.260895, 1, 1, 1, 1, 1,
-0.2640825, 1.428334, 0.8025993, 1, 1, 1, 1, 1,
-0.2632954, -0.5377336, -3.806628, 1, 1, 1, 1, 1,
-0.2627078, -2.164139, -3.761988, 1, 1, 1, 1, 1,
-0.2620575, 0.4998839, -0.1312809, 1, 1, 1, 1, 1,
-0.2566147, -1.323344, -3.161168, 1, 1, 1, 1, 1,
-0.2561709, 0.2808457, -2.479369, 1, 1, 1, 1, 1,
-0.2549644, -0.06145367, -2.498428, 1, 1, 1, 1, 1,
-0.2528883, -0.2385179, -2.234138, 1, 1, 1, 1, 1,
-0.2468601, 1.562147, -0.2135225, 1, 1, 1, 1, 1,
-0.2424443, 1.82724, -0.1796364, 1, 1, 1, 1, 1,
-0.2390765, -0.9452626, -2.293432, 1, 1, 1, 1, 1,
-0.2317564, 0.7186009, 0.6940175, 1, 1, 1, 1, 1,
-0.2279349, -0.7155412, -3.713034, 1, 1, 1, 1, 1,
-0.2276492, -0.4075578, -3.071254, 0, 0, 1, 1, 1,
-0.2253962, 0.9165282, 1.749946, 1, 0, 0, 1, 1,
-0.217044, 0.06955469, -0.3500881, 1, 0, 0, 1, 1,
-0.2162839, -0.2039559, -2.884084, 1, 0, 0, 1, 1,
-0.2152738, -1.174978, -4.701621, 1, 0, 0, 1, 1,
-0.2137462, 0.9536402, 0.3359437, 1, 0, 0, 1, 1,
-0.2062943, 0.1083584, -1.803147, 0, 0, 0, 1, 1,
-0.2044153, 0.6334009, -0.2051315, 0, 0, 0, 1, 1,
-0.2043556, -0.5535, -3.453863, 0, 0, 0, 1, 1,
-0.20344, -0.5006435, -3.265166, 0, 0, 0, 1, 1,
-0.198375, -0.1474625, -1.303925, 0, 0, 0, 1, 1,
-0.1947379, -0.1964104, -3.624589, 0, 0, 0, 1, 1,
-0.1937774, -0.8553593, -3.957103, 0, 0, 0, 1, 1,
-0.1923302, -1.135532, -3.704828, 1, 1, 1, 1, 1,
-0.1908574, 0.9694933, 0.5801138, 1, 1, 1, 1, 1,
-0.1891279, 0.143606, -1.003248, 1, 1, 1, 1, 1,
-0.1882015, 1.895108, 0.7435058, 1, 1, 1, 1, 1,
-0.1874448, 1.420485, -0.7958239, 1, 1, 1, 1, 1,
-0.1845894, -0.642722, -2.153157, 1, 1, 1, 1, 1,
-0.1802816, -1.212961, -1.11796, 1, 1, 1, 1, 1,
-0.1781905, 0.02892688, -2.852603, 1, 1, 1, 1, 1,
-0.1779635, -0.9413403, -2.492162, 1, 1, 1, 1, 1,
-0.1754145, 0.246632, -1.893206, 1, 1, 1, 1, 1,
-0.1749503, 0.4849984, -0.8660515, 1, 1, 1, 1, 1,
-0.1749075, 1.357149, -1.340262, 1, 1, 1, 1, 1,
-0.1715142, -0.2308916, -3.440232, 1, 1, 1, 1, 1,
-0.1713113, -0.676847, -1.392903, 1, 1, 1, 1, 1,
-0.1649048, -0.3220132, -3.157352, 1, 1, 1, 1, 1,
-0.1642984, -2.663286, -4.420887, 0, 0, 1, 1, 1,
-0.1641881, -0.9496271, -2.844369, 1, 0, 0, 1, 1,
-0.1609048, -1.277431, -5.422717, 1, 0, 0, 1, 1,
-0.1609035, -1.582368, -1.650497, 1, 0, 0, 1, 1,
-0.1596698, -0.6116576, -2.177266, 1, 0, 0, 1, 1,
-0.1572769, 1.278305, 0.9925149, 1, 0, 0, 1, 1,
-0.1539211, -0.8425669, -3.161095, 0, 0, 0, 1, 1,
-0.1502125, -0.5687956, -1.658017, 0, 0, 0, 1, 1,
-0.1498493, 1.429706, -0.07664587, 0, 0, 0, 1, 1,
-0.147515, -0.690551, -1.924168, 0, 0, 0, 1, 1,
-0.1471974, 0.1956305, 0.8660761, 0, 0, 0, 1, 1,
-0.1450156, -0.02323469, -0.8173645, 0, 0, 0, 1, 1,
-0.1432979, -0.3193945, -2.878092, 0, 0, 0, 1, 1,
-0.1416792, -1.172937, -3.89531, 1, 1, 1, 1, 1,
-0.1412169, -2.287814, -3.085919, 1, 1, 1, 1, 1,
-0.1406692, 0.4426331, -1.734368, 1, 1, 1, 1, 1,
-0.1376737, -0.8399494, -3.333167, 1, 1, 1, 1, 1,
-0.1370936, -0.8243866, -4.02703, 1, 1, 1, 1, 1,
-0.1367543, 0.7741426, 0.07573183, 1, 1, 1, 1, 1,
-0.1325967, -0.5548495, -3.020079, 1, 1, 1, 1, 1,
-0.129457, 0.4386364, -2.023412, 1, 1, 1, 1, 1,
-0.1275766, 0.8185185, 0.8051129, 1, 1, 1, 1, 1,
-0.1217495, 0.1897935, -0.9152863, 1, 1, 1, 1, 1,
-0.1215399, 1.168132, -1.381895, 1, 1, 1, 1, 1,
-0.1195573, 0.227904, -0.5154697, 1, 1, 1, 1, 1,
-0.1176458, 0.5972208, -1.743736, 1, 1, 1, 1, 1,
-0.1169876, -0.9659775, -2.75721, 1, 1, 1, 1, 1,
-0.1168577, -0.5534223, -4.655689, 1, 1, 1, 1, 1,
-0.1156342, -1.2242, -4.263377, 0, 0, 1, 1, 1,
-0.114013, 0.6102027, -0.9700939, 1, 0, 0, 1, 1,
-0.1139843, 0.1116075, -1.684249, 1, 0, 0, 1, 1,
-0.113005, -0.3867097, -2.921532, 1, 0, 0, 1, 1,
-0.1071613, -0.06747025, -1.751316, 1, 0, 0, 1, 1,
-0.1065886, 0.4349618, -0.3996864, 1, 0, 0, 1, 1,
-0.1006155, -0.7394018, -2.201865, 0, 0, 0, 1, 1,
-0.1002775, 1.151318, 1.631517, 0, 0, 0, 1, 1,
-0.09966335, 0.9750541, 1.030016, 0, 0, 0, 1, 1,
-0.09937486, 1.737486, 1.180745, 0, 0, 0, 1, 1,
-0.09887323, 0.4849963, -0.5492616, 0, 0, 0, 1, 1,
-0.0969137, -0.7893947, -4.100823, 0, 0, 0, 1, 1,
-0.08966825, -1.093527, -2.533845, 0, 0, 0, 1, 1,
-0.08423068, 1.643469, -2.781315, 1, 1, 1, 1, 1,
-0.08236287, -0.9304437, -2.704622, 1, 1, 1, 1, 1,
-0.08010899, 0.5930837, 0.1629356, 1, 1, 1, 1, 1,
-0.07125451, 0.3951862, -0.5761545, 1, 1, 1, 1, 1,
-0.06964404, -0.6769732, -2.873329, 1, 1, 1, 1, 1,
-0.06960148, 2.485557, 0.01775895, 1, 1, 1, 1, 1,
-0.06581826, -0.2108981, -2.993185, 1, 1, 1, 1, 1,
-0.06005644, 0.5059237, -0.4204769, 1, 1, 1, 1, 1,
-0.05985397, -0.2952438, -5.338556, 1, 1, 1, 1, 1,
-0.05930182, 0.4433094, 0.3723097, 1, 1, 1, 1, 1,
-0.04898733, -1.140739, -4.752236, 1, 1, 1, 1, 1,
-0.04789323, -0.5087976, -4.394992, 1, 1, 1, 1, 1,
-0.0422681, -1.727905, -2.372906, 1, 1, 1, 1, 1,
-0.04096844, 2.305377, 0.9975759, 1, 1, 1, 1, 1,
-0.04051396, -1.212788, -1.212453, 1, 1, 1, 1, 1,
-0.03483908, 2.931683, -0.109633, 0, 0, 1, 1, 1,
-0.03438743, -0.599256, -4.057786, 1, 0, 0, 1, 1,
-0.03107579, 0.2457817, -1.196252, 1, 0, 0, 1, 1,
-0.0281538, 1.174802, -1.18824, 1, 0, 0, 1, 1,
-0.02809348, 1.659796, 0.8094002, 1, 0, 0, 1, 1,
-0.02401865, 0.1472507, 0.4699968, 1, 0, 0, 1, 1,
-0.02323345, -0.4412966, -4.91758, 0, 0, 0, 1, 1,
-0.0227734, 1.959289, 0.382813, 0, 0, 0, 1, 1,
-0.01986745, 1.040322, -0.8944423, 0, 0, 0, 1, 1,
-0.01589319, 2.31788, 0.3902164, 0, 0, 0, 1, 1,
-0.01391721, 1.024006, 2.19509, 0, 0, 0, 1, 1,
-0.01366113, 1.856136, -0.8581691, 0, 0, 0, 1, 1,
-0.01254298, -1.444221, -3.633739, 0, 0, 0, 1, 1,
-0.009404919, -1.242607, -2.273699, 1, 1, 1, 1, 1,
-0.005373847, -0.0562092, -1.734238, 1, 1, 1, 1, 1,
-0.002160034, -1.911319, -3.436779, 1, 1, 1, 1, 1,
-0.001844416, -0.9764877, -4.273181, 1, 1, 1, 1, 1,
0.0009104469, 0.01811374, 0.04155472, 1, 1, 1, 1, 1,
0.005890548, 0.04262605, 0.1621237, 1, 1, 1, 1, 1,
0.009060159, 1.482559, -0.04017976, 1, 1, 1, 1, 1,
0.01161577, 0.3810123, 0.6077461, 1, 1, 1, 1, 1,
0.01280695, 0.6065298, -0.02606514, 1, 1, 1, 1, 1,
0.01364275, -1.09054, 1.725236, 1, 1, 1, 1, 1,
0.01487903, -0.7596173, 2.742973, 1, 1, 1, 1, 1,
0.01653426, -0.68749, 3.647143, 1, 1, 1, 1, 1,
0.01882425, -0.6158779, 2.061913, 1, 1, 1, 1, 1,
0.01891364, -0.4154878, 3.783528, 1, 1, 1, 1, 1,
0.02664241, 0.2668833, -1.222004, 1, 1, 1, 1, 1,
0.02702929, -0.3953951, 1.953928, 0, 0, 1, 1, 1,
0.04526095, 2.040488, 0.2337129, 1, 0, 0, 1, 1,
0.04578184, -0.8923994, 3.297229, 1, 0, 0, 1, 1,
0.04628799, -1.879497, 2.585545, 1, 0, 0, 1, 1,
0.05097147, -0.03127405, 3.406279, 1, 0, 0, 1, 1,
0.05541125, 1.027205, 0.509136, 1, 0, 0, 1, 1,
0.05810685, 0.6658165, -1.310226, 0, 0, 0, 1, 1,
0.06251566, 0.2274244, 0.06344847, 0, 0, 0, 1, 1,
0.06603365, 1.021711, 0.5818546, 0, 0, 0, 1, 1,
0.06625631, 1.051154, -0.8598178, 0, 0, 0, 1, 1,
0.06656938, 0.06750297, -0.4508421, 0, 0, 0, 1, 1,
0.06663513, -0.3779755, 3.477375, 0, 0, 0, 1, 1,
0.06704724, -0.2327916, 3.991542, 0, 0, 0, 1, 1,
0.07320116, -0.01634545, 2.797829, 1, 1, 1, 1, 1,
0.07519192, -0.2827168, 2.775841, 1, 1, 1, 1, 1,
0.07556368, 0.5425158, 0.387898, 1, 1, 1, 1, 1,
0.07567022, -0.9551966, 4.099776, 1, 1, 1, 1, 1,
0.0801919, 0.2658249, -0.3403302, 1, 1, 1, 1, 1,
0.08043677, 1.005463, 0.1347479, 1, 1, 1, 1, 1,
0.080843, 0.1842233, 0.5554843, 1, 1, 1, 1, 1,
0.0836738, -0.9435409, 4.148748, 1, 1, 1, 1, 1,
0.08537898, 0.3294831, -1.132325, 1, 1, 1, 1, 1,
0.08571591, -0.0105826, 0.4986877, 1, 1, 1, 1, 1,
0.0863651, 0.5912925, -0.4136165, 1, 1, 1, 1, 1,
0.0900166, -0.3118774, 3.170372, 1, 1, 1, 1, 1,
0.09712665, -0.5716501, 2.166131, 1, 1, 1, 1, 1,
0.09836819, 0.6711858, 0.2264865, 1, 1, 1, 1, 1,
0.101835, 0.7937261, -0.1971661, 1, 1, 1, 1, 1,
0.105916, 0.42432, 0.2539894, 0, 0, 1, 1, 1,
0.1079215, 0.282814, 0.3922766, 1, 0, 0, 1, 1,
0.1099298, 1.852904, 1.454703, 1, 0, 0, 1, 1,
0.1127275, -0.08001864, 2.154951, 1, 0, 0, 1, 1,
0.1192183, 0.9857984, -0.9168036, 1, 0, 0, 1, 1,
0.1209884, 0.5127861, -0.009174216, 1, 0, 0, 1, 1,
0.1228818, 1.318155, -1.429398, 0, 0, 0, 1, 1,
0.1261195, 0.04421004, 1.560209, 0, 0, 0, 1, 1,
0.1280971, 1.495206, -0.8057306, 0, 0, 0, 1, 1,
0.1293439, -0.9545941, 1.356954, 0, 0, 0, 1, 1,
0.1294929, -0.04168225, 1.943243, 0, 0, 0, 1, 1,
0.1301166, 0.3560595, 1.254276, 0, 0, 0, 1, 1,
0.1331118, -1.880256, 2.447976, 0, 0, 0, 1, 1,
0.1333147, -0.6922024, 2.880407, 1, 1, 1, 1, 1,
0.1361009, -0.8059439, 2.735944, 1, 1, 1, 1, 1,
0.1385516, -1.347659, 1.890253, 1, 1, 1, 1, 1,
0.1409188, 2.271168, 0.3441803, 1, 1, 1, 1, 1,
0.1438068, -0.530845, 1.421461, 1, 1, 1, 1, 1,
0.1454206, 1.626537, 0.5939304, 1, 1, 1, 1, 1,
0.1458177, -1.282625, 4.233615, 1, 1, 1, 1, 1,
0.1464286, -0.2742373, 1.57243, 1, 1, 1, 1, 1,
0.147411, 1.922691, -0.3630764, 1, 1, 1, 1, 1,
0.1477585, 0.8380821, -0.3885618, 1, 1, 1, 1, 1,
0.1508418, 0.06163723, 0.3877295, 1, 1, 1, 1, 1,
0.152098, -0.8656831, 3.983542, 1, 1, 1, 1, 1,
0.1532707, 0.9759135, -0.4233896, 1, 1, 1, 1, 1,
0.1544143, -0.3425039, 4.186838, 1, 1, 1, 1, 1,
0.1606218, -0.4658218, 2.091747, 1, 1, 1, 1, 1,
0.1616209, -1.328152, 2.303473, 0, 0, 1, 1, 1,
0.1701824, 2.271223, 0.4175076, 1, 0, 0, 1, 1,
0.1723864, 0.1281617, 1.168417, 1, 0, 0, 1, 1,
0.1731888, 1.6317, -0.0756111, 1, 0, 0, 1, 1,
0.1734502, 0.7535331, -0.7955242, 1, 0, 0, 1, 1,
0.1746345, -0.7951337, 4.996488, 1, 0, 0, 1, 1,
0.1779086, 1.329028, -1.198105, 0, 0, 0, 1, 1,
0.1784763, -0.2923664, 2.954107, 0, 0, 0, 1, 1,
0.1822954, -2.015567, 2.41204, 0, 0, 0, 1, 1,
0.1830848, -1.037761, 2.922967, 0, 0, 0, 1, 1,
0.1850598, -0.1890968, 3.925004, 0, 0, 0, 1, 1,
0.1937693, 0.7585178, 0.5926591, 0, 0, 0, 1, 1,
0.2010277, -0.06385639, 0.3717915, 0, 0, 0, 1, 1,
0.2029604, -0.4408709, 2.728721, 1, 1, 1, 1, 1,
0.203119, 0.1490698, 1.634955, 1, 1, 1, 1, 1,
0.205027, -1.10903, 3.440293, 1, 1, 1, 1, 1,
0.2075678, -0.3471711, 2.019144, 1, 1, 1, 1, 1,
0.2082345, 0.07010867, 0.7150985, 1, 1, 1, 1, 1,
0.2083006, -0.6153978, 2.212859, 1, 1, 1, 1, 1,
0.2091005, 0.4349818, -0.3498861, 1, 1, 1, 1, 1,
0.212075, 0.4608161, 0.9880943, 1, 1, 1, 1, 1,
0.2133532, -0.6132272, 0.4419191, 1, 1, 1, 1, 1,
0.2135076, 0.5984812, 0.615439, 1, 1, 1, 1, 1,
0.2147263, 0.931017, -2.130782, 1, 1, 1, 1, 1,
0.2212184, -0.2897637, 3.238441, 1, 1, 1, 1, 1,
0.2219994, 0.2728656, 1.789813, 1, 1, 1, 1, 1,
0.2228929, 2.509734, -1.058077, 1, 1, 1, 1, 1,
0.2248935, 0.1833069, 1.556175, 1, 1, 1, 1, 1,
0.2289762, -2.048939, 3.099892, 0, 0, 1, 1, 1,
0.2299284, -1.03795, 1.95293, 1, 0, 0, 1, 1,
0.2327994, 0.250865, 1.129563, 1, 0, 0, 1, 1,
0.2361336, 0.6130884, 2.888767, 1, 0, 0, 1, 1,
0.2402519, -1.200366, 2.605959, 1, 0, 0, 1, 1,
0.2439469, -1.274037, 1.785586, 1, 0, 0, 1, 1,
0.2449902, 0.8089588, 0.5296809, 0, 0, 0, 1, 1,
0.248147, 0.1923735, -0.2790994, 0, 0, 0, 1, 1,
0.2582892, 0.1827088, 0.4539858, 0, 0, 0, 1, 1,
0.2603611, -1.095344, 2.140175, 0, 0, 0, 1, 1,
0.2650015, 1.235304, -0.2351919, 0, 0, 0, 1, 1,
0.266472, 1.143929, 0.9684001, 0, 0, 0, 1, 1,
0.2684992, -0.4085973, 5.147051, 0, 0, 0, 1, 1,
0.2698177, -0.0579584, 1.971046, 1, 1, 1, 1, 1,
0.2706151, 0.9268118, -0.2084818, 1, 1, 1, 1, 1,
0.2712016, -0.07854854, 4.354021, 1, 1, 1, 1, 1,
0.2723751, 0.1338819, 2.638446, 1, 1, 1, 1, 1,
0.2748471, -0.05521552, 2.463394, 1, 1, 1, 1, 1,
0.2821872, -1.143873, 2.988957, 1, 1, 1, 1, 1,
0.2882886, -1.388437, 1.998505, 1, 1, 1, 1, 1,
0.288621, 0.4668428, -0.5346924, 1, 1, 1, 1, 1,
0.2988892, -0.346496, 3.01601, 1, 1, 1, 1, 1,
0.2994392, -2.099313, 1.956347, 1, 1, 1, 1, 1,
0.3013149, -0.8653132, 3.294148, 1, 1, 1, 1, 1,
0.3019192, 0.03635924, 0.4050182, 1, 1, 1, 1, 1,
0.3066189, -1.662048, 4.105203, 1, 1, 1, 1, 1,
0.3071559, -0.4777488, 2.390024, 1, 1, 1, 1, 1,
0.3104577, 0.7319768, 0.779755, 1, 1, 1, 1, 1,
0.3129537, 0.3937493, 1.350486, 0, 0, 1, 1, 1,
0.3179785, 1.038086, 0.7984071, 1, 0, 0, 1, 1,
0.3181575, 0.04006865, 1.098949, 1, 0, 0, 1, 1,
0.3185967, 1.183021, 0.7884013, 1, 0, 0, 1, 1,
0.3205431, -0.436001, 3.416071, 1, 0, 0, 1, 1,
0.3218945, -0.8924435, 4.18729, 1, 0, 0, 1, 1,
0.3222922, -0.7937049, 4.464378, 0, 0, 0, 1, 1,
0.3300646, 1.114465, 3.004479, 0, 0, 0, 1, 1,
0.3304088, 0.8973075, -0.5639364, 0, 0, 0, 1, 1,
0.3305441, -1.272477, 3.999368, 0, 0, 0, 1, 1,
0.3343631, 0.4657631, 0.8911733, 0, 0, 0, 1, 1,
0.3358359, 0.6204549, 1.341587, 0, 0, 0, 1, 1,
0.3365532, -0.3493721, 1.903512, 0, 0, 0, 1, 1,
0.3403183, 0.1828722, -0.4056404, 1, 1, 1, 1, 1,
0.3523753, 0.5931087, -0.8868187, 1, 1, 1, 1, 1,
0.3553314, -0.07327047, 1.671777, 1, 1, 1, 1, 1,
0.3591861, 0.4829851, 0.3279398, 1, 1, 1, 1, 1,
0.3624811, -1.217099, 3.67776, 1, 1, 1, 1, 1,
0.3630445, 0.165014, -0.4294962, 1, 1, 1, 1, 1,
0.3680562, -0.8078025, 2.881188, 1, 1, 1, 1, 1,
0.3714333, 0.7106538, 0.2966949, 1, 1, 1, 1, 1,
0.3732428, 1.666371, 1.033056, 1, 1, 1, 1, 1,
0.375341, -1.436948, 2.5754, 1, 1, 1, 1, 1,
0.3829823, 0.7107079, 0.3432334, 1, 1, 1, 1, 1,
0.3919148, -0.452389, 1.311717, 1, 1, 1, 1, 1,
0.394909, -0.5753543, 0.4645391, 1, 1, 1, 1, 1,
0.3949579, -1.357556, 4.59284, 1, 1, 1, 1, 1,
0.4028997, -0.4923988, 1.311404, 1, 1, 1, 1, 1,
0.4042867, -0.9110345, 4.495457, 0, 0, 1, 1, 1,
0.4047753, 0.3510382, 0.6482035, 1, 0, 0, 1, 1,
0.4078014, -0.9075863, 1.797992, 1, 0, 0, 1, 1,
0.4135086, -0.4882942, 2.638896, 1, 0, 0, 1, 1,
0.4150909, -0.4987436, 1.36295, 1, 0, 0, 1, 1,
0.4176385, 0.6831003, -0.2866526, 1, 0, 0, 1, 1,
0.4215868, -0.1310387, 0.690459, 0, 0, 0, 1, 1,
0.4242673, 0.9337105, -0.2796851, 0, 0, 0, 1, 1,
0.426669, -0.2421278, 4.135581, 0, 0, 0, 1, 1,
0.428033, -0.4001798, 2.043755, 0, 0, 0, 1, 1,
0.4305826, -0.1387664, 3.465944, 0, 0, 0, 1, 1,
0.4334843, 0.8606017, 0.09168192, 0, 0, 0, 1, 1,
0.4370921, 0.494355, 0.06274839, 0, 0, 0, 1, 1,
0.4380869, -0.7950939, 1.79905, 1, 1, 1, 1, 1,
0.438197, 0.3817981, 0.8928468, 1, 1, 1, 1, 1,
0.4388632, 2.729214, -0.8950282, 1, 1, 1, 1, 1,
0.4425033, -0.6886368, 2.690091, 1, 1, 1, 1, 1,
0.4482146, -0.5752289, 3.226896, 1, 1, 1, 1, 1,
0.4517214, 1.796307, 1.01952, 1, 1, 1, 1, 1,
0.4550678, 0.04138725, 1.484501, 1, 1, 1, 1, 1,
0.4565211, -1.008309, 2.669825, 1, 1, 1, 1, 1,
0.4605286, 1.30207, 0.9398366, 1, 1, 1, 1, 1,
0.4611748, 0.09400822, 0.02751095, 1, 1, 1, 1, 1,
0.4616913, 0.4578967, 0.2897157, 1, 1, 1, 1, 1,
0.4629289, -0.3946416, 2.257865, 1, 1, 1, 1, 1,
0.4638083, -0.3864125, 4.052504, 1, 1, 1, 1, 1,
0.4657742, 0.3251204, 1.043057, 1, 1, 1, 1, 1,
0.4682732, -0.7563242, 1.250238, 1, 1, 1, 1, 1,
0.4748533, -0.08937272, -0.5342329, 0, 0, 1, 1, 1,
0.4761465, 0.08302221, -0.6117818, 1, 0, 0, 1, 1,
0.4763199, 0.9290417, 0.266596, 1, 0, 0, 1, 1,
0.4818107, -0.738386, 1.481671, 1, 0, 0, 1, 1,
0.4859378, -0.1002222, 3.011482, 1, 0, 0, 1, 1,
0.4926139, -0.4789178, 1.425259, 1, 0, 0, 1, 1,
0.4942806, 0.3113131, 3.043629, 0, 0, 0, 1, 1,
0.4981444, -0.282152, 2.259234, 0, 0, 0, 1, 1,
0.4983096, 0.02232762, 3.374268, 0, 0, 0, 1, 1,
0.500827, -0.6388975, 2.385849, 0, 0, 0, 1, 1,
0.5083957, -1.059081, 1.608039, 0, 0, 0, 1, 1,
0.5160421, 2.304875, -0.5947208, 0, 0, 0, 1, 1,
0.5211918, 0.4426222, 0.321568, 0, 0, 0, 1, 1,
0.5239886, -1.157839, 3.291994, 1, 1, 1, 1, 1,
0.5249401, 0.6140141, 1.230492, 1, 1, 1, 1, 1,
0.5259103, -0.3310602, 2.963102, 1, 1, 1, 1, 1,
0.5261373, -0.0355528, 0.2159095, 1, 1, 1, 1, 1,
0.5307766, 0.07997261, 0.6917097, 1, 1, 1, 1, 1,
0.5322212, 1.019581, 1.870834, 1, 1, 1, 1, 1,
0.5387583, 0.3752864, 0.8491413, 1, 1, 1, 1, 1,
0.5440049, -0.8549806, 4.718581, 1, 1, 1, 1, 1,
0.5444376, 0.129355, 3.675999, 1, 1, 1, 1, 1,
0.5444782, 0.1614746, -0.4075565, 1, 1, 1, 1, 1,
0.544605, 0.5997307, 2.072874, 1, 1, 1, 1, 1,
0.5459299, 0.584574, 1.470253, 1, 1, 1, 1, 1,
0.5462708, 0.004428673, 2.13016, 1, 1, 1, 1, 1,
0.5531863, -1.078115, 4.209908, 1, 1, 1, 1, 1,
0.5550844, 0.4846598, 0.8077335, 1, 1, 1, 1, 1,
0.558886, 0.5457894, -0.3260608, 0, 0, 1, 1, 1,
0.5625924, 1.741983, 0.08414023, 1, 0, 0, 1, 1,
0.5627556, -1.235686, 2.167444, 1, 0, 0, 1, 1,
0.5639846, 0.4194776, 0.6432043, 1, 0, 0, 1, 1,
0.5686584, -0.2907726, 2.361614, 1, 0, 0, 1, 1,
0.5705616, -0.410315, 1.236971, 1, 0, 0, 1, 1,
0.5707431, 0.3636444, 2.600036, 0, 0, 0, 1, 1,
0.5710563, 0.157421, 0.609602, 0, 0, 0, 1, 1,
0.5763204, 0.8994384, 0.3116474, 0, 0, 0, 1, 1,
0.579128, 1.853892, -0.1200355, 0, 0, 0, 1, 1,
0.5795344, 1.12756, -0.8441176, 0, 0, 0, 1, 1,
0.5802611, 0.5772727, 1.444056, 0, 0, 0, 1, 1,
0.5870574, 0.007151945, 0.9779063, 0, 0, 0, 1, 1,
0.5899262, -1.246019, 1.713774, 1, 1, 1, 1, 1,
0.5932002, -1.26664, 2.220571, 1, 1, 1, 1, 1,
0.5976381, -0.550647, 1.396336, 1, 1, 1, 1, 1,
0.5989581, 1.100821, -1.004265, 1, 1, 1, 1, 1,
0.5989611, -0.2410177, 2.114302, 1, 1, 1, 1, 1,
0.6002908, 1.757655, 0.02706054, 1, 1, 1, 1, 1,
0.60711, -2.715922, 3.979041, 1, 1, 1, 1, 1,
0.6083598, 1.167053, 0.02606785, 1, 1, 1, 1, 1,
0.6138042, -0.3403406, 2.578709, 1, 1, 1, 1, 1,
0.6155595, 0.6326678, 1.85133, 1, 1, 1, 1, 1,
0.6185834, -1.927273, 4.182987, 1, 1, 1, 1, 1,
0.6224603, -0.4977583, 3.000374, 1, 1, 1, 1, 1,
0.6256557, -0.464744, 2.011306, 1, 1, 1, 1, 1,
0.6266301, 0.443482, 1.215176, 1, 1, 1, 1, 1,
0.6314362, -0.7080913, 2.895372, 1, 1, 1, 1, 1,
0.6357754, -0.3279282, 1.921742, 0, 0, 1, 1, 1,
0.642729, -0.0700661, 1.240795, 1, 0, 0, 1, 1,
0.647015, -1.275353, 1.208392, 1, 0, 0, 1, 1,
0.6482216, 1.54008, 0.2419339, 1, 0, 0, 1, 1,
0.6502665, -0.7338513, 3.232535, 1, 0, 0, 1, 1,
0.6508256, 1.58489, 0.6520856, 1, 0, 0, 1, 1,
0.654154, 0.3876019, 1.641051, 0, 0, 0, 1, 1,
0.6553043, 0.5280119, -1.351592, 0, 0, 0, 1, 1,
0.6553471, -0.8282229, 2.737039, 0, 0, 0, 1, 1,
0.662885, 2.539792, -0.5638031, 0, 0, 0, 1, 1,
0.6690816, -0.07067938, 1.491015, 0, 0, 0, 1, 1,
0.6704795, 1.232498, 0.7975223, 0, 0, 0, 1, 1,
0.6715335, -1.494644, 0.3835661, 0, 0, 0, 1, 1,
0.6721432, -1.393533, 2.54815, 1, 1, 1, 1, 1,
0.6805664, -1.261406, 3.042471, 1, 1, 1, 1, 1,
0.6810877, -0.9969718, 4.014019, 1, 1, 1, 1, 1,
0.6815825, 0.01771924, 1.614609, 1, 1, 1, 1, 1,
0.6883563, 0.2270424, 1.903347, 1, 1, 1, 1, 1,
0.690281, 0.5512683, 0.1980895, 1, 1, 1, 1, 1,
0.6975877, 0.6180142, -0.2684815, 1, 1, 1, 1, 1,
0.6997335, -1.105939, 3.036898, 1, 1, 1, 1, 1,
0.7027125, 1.444963, 1.078308, 1, 1, 1, 1, 1,
0.7059336, 1.034465, 0.9346705, 1, 1, 1, 1, 1,
0.7139304, 1.422836, 0.9852762, 1, 1, 1, 1, 1,
0.7316501, 2.767678, 0.01337034, 1, 1, 1, 1, 1,
0.7317578, -0.2631683, 2.569458, 1, 1, 1, 1, 1,
0.7418365, 0.598791, -0.1638553, 1, 1, 1, 1, 1,
0.7425039, -1.142656, 1.593873, 1, 1, 1, 1, 1,
0.745644, 0.3280264, 2.395982, 0, 0, 1, 1, 1,
0.7489353, 0.2191572, 0.1837176, 1, 0, 0, 1, 1,
0.7560374, 1.451976, -0.4471524, 1, 0, 0, 1, 1,
0.7571592, -0.9972756, 1.790671, 1, 0, 0, 1, 1,
0.7618693, 1.058428, 1.15658, 1, 0, 0, 1, 1,
0.767574, -1.695194, 2.806029, 1, 0, 0, 1, 1,
0.7695404, 1.124442, -0.3286622, 0, 0, 0, 1, 1,
0.7705588, -0.01441599, 0.7406278, 0, 0, 0, 1, 1,
0.7734813, -1.283213, 4.1417, 0, 0, 0, 1, 1,
0.7745247, -0.935047, 2.057261, 0, 0, 0, 1, 1,
0.7799067, 0.3216367, 1.129704, 0, 0, 0, 1, 1,
0.7833329, -1.061959, 2.845112, 0, 0, 0, 1, 1,
0.7936629, -1.248251, 0.6880157, 0, 0, 0, 1, 1,
0.8123595, -0.8726838, 2.047533, 1, 1, 1, 1, 1,
0.8124232, 2.704226, -0.1788209, 1, 1, 1, 1, 1,
0.8252004, 2.381686, 0.813252, 1, 1, 1, 1, 1,
0.8397018, -1.596373, 2.788248, 1, 1, 1, 1, 1,
0.8407441, -1.41305, 2.567364, 1, 1, 1, 1, 1,
0.8452919, 2.288783, 1.919988, 1, 1, 1, 1, 1,
0.8490326, 1.114673, 0.6719482, 1, 1, 1, 1, 1,
0.8507026, -1.198905, 1.558354, 1, 1, 1, 1, 1,
0.8520542, 1.548917, -0.6014538, 1, 1, 1, 1, 1,
0.8573784, 1.230985, 0.6108295, 1, 1, 1, 1, 1,
0.8618886, 1.263914, 0.1445347, 1, 1, 1, 1, 1,
0.8678603, -0.7271432, 1.040307, 1, 1, 1, 1, 1,
0.8708675, 1.612825, -0.9931619, 1, 1, 1, 1, 1,
0.8712915, -0.08824262, 3.162974, 1, 1, 1, 1, 1,
0.875734, -0.02624044, 0.233088, 1, 1, 1, 1, 1,
0.8825476, 0.9423373, -1.653461, 0, 0, 1, 1, 1,
0.8827514, 1.176219, 1.227894, 1, 0, 0, 1, 1,
0.8880609, -1.018242, 3.935789, 1, 0, 0, 1, 1,
0.8889327, -1.293721, 2.851967, 1, 0, 0, 1, 1,
0.8907598, -0.2425909, 1.981138, 1, 0, 0, 1, 1,
0.8919675, -0.2289624, 3.174338, 1, 0, 0, 1, 1,
0.8936729, -0.6908518, 3.746525, 0, 0, 0, 1, 1,
0.9000856, -1.039313, 4.217914, 0, 0, 0, 1, 1,
0.9007298, 0.6283271, 2.650473, 0, 0, 0, 1, 1,
0.9028395, -0.3088598, 2.075702, 0, 0, 0, 1, 1,
0.9035262, -0.2247441, 1.441679, 0, 0, 0, 1, 1,
0.9084489, 1.247125, -0.9402058, 0, 0, 0, 1, 1,
0.9106352, -0.1018481, 0.2600735, 0, 0, 0, 1, 1,
0.9108511, -1.664221, 2.22818, 1, 1, 1, 1, 1,
0.9114736, 0.8103184, 0.5371435, 1, 1, 1, 1, 1,
0.9143448, -1.132851, 3.0488, 1, 1, 1, 1, 1,
0.9215016, 0.7187477, -0.06769586, 1, 1, 1, 1, 1,
0.9238769, -0.009048586, 2.287642, 1, 1, 1, 1, 1,
0.9261249, -0.02397398, 2.185951, 1, 1, 1, 1, 1,
0.9271551, -0.7348454, 2.236439, 1, 1, 1, 1, 1,
0.9342282, 1.331059, 1.134841, 1, 1, 1, 1, 1,
0.9365006, -1.039945, 1.970104, 1, 1, 1, 1, 1,
0.9378288, 0.990252, 0.0524524, 1, 1, 1, 1, 1,
0.9387699, 0.3036644, 0.6697186, 1, 1, 1, 1, 1,
0.9440402, 0.135978, 1.077999, 1, 1, 1, 1, 1,
0.9472626, 0.05652956, 1.397752, 1, 1, 1, 1, 1,
0.9488563, 0.8981645, 0.3697284, 1, 1, 1, 1, 1,
0.9652766, 0.9509088, 1.294402, 1, 1, 1, 1, 1,
0.965499, 1.085995, -1.634964, 0, 0, 1, 1, 1,
0.965903, 0.318395, 2.055972, 1, 0, 0, 1, 1,
0.9681382, 0.5248605, 0.9719526, 1, 0, 0, 1, 1,
0.9734836, 0.2481467, 2.781843, 1, 0, 0, 1, 1,
0.976931, 0.7052972, 1.845683, 1, 0, 0, 1, 1,
0.9784707, 2.181347, 1.268897, 1, 0, 0, 1, 1,
0.9804797, 0.5590757, -0.2447035, 0, 0, 0, 1, 1,
1.002177, 0.489376, 2.087946, 0, 0, 0, 1, 1,
1.005049, 0.8563892, 0.8420364, 0, 0, 0, 1, 1,
1.007377, -1.182023, 4.289388, 0, 0, 0, 1, 1,
1.009617, -1.218721, 2.767305, 0, 0, 0, 1, 1,
1.01852, 2.199805, 1.251108, 0, 0, 0, 1, 1,
1.019008, -0.8718015, 3.104551, 0, 0, 0, 1, 1,
1.019825, 1.652047, 1.001636, 1, 1, 1, 1, 1,
1.022911, -0.6903594, 1.44346, 1, 1, 1, 1, 1,
1.026987, 2.046703, -0.134601, 1, 1, 1, 1, 1,
1.031429, 1.556892, -1.358112, 1, 1, 1, 1, 1,
1.034358, -0.9996284, 1.046978, 1, 1, 1, 1, 1,
1.039473, 0.8059775, 0.3826612, 1, 1, 1, 1, 1,
1.052096, -0.329394, 0.9600891, 1, 1, 1, 1, 1,
1.05278, 0.9230987, 1.555309, 1, 1, 1, 1, 1,
1.056449, -0.7824969, 3.134615, 1, 1, 1, 1, 1,
1.059116, 0.5976884, 2.970891, 1, 1, 1, 1, 1,
1.069811, -0.1740296, 1.966428, 1, 1, 1, 1, 1,
1.079686, -0.1284244, 4.391375, 1, 1, 1, 1, 1,
1.080055, -1.637059, 1.39131, 1, 1, 1, 1, 1,
1.084021, -1.964586, 4.193531, 1, 1, 1, 1, 1,
1.08861, 0.9762618, 1.407021, 1, 1, 1, 1, 1,
1.088667, 0.3811803, 2.603745, 0, 0, 1, 1, 1,
1.098769, 1.037133, -0.8316715, 1, 0, 0, 1, 1,
1.101196, -0.07552357, 0.8977136, 1, 0, 0, 1, 1,
1.105344, -0.2252294, 0.7306399, 1, 0, 0, 1, 1,
1.119149, -1.797584, 3.549887, 1, 0, 0, 1, 1,
1.119917, 1.223196, 1.792331, 1, 0, 0, 1, 1,
1.120732, -0.1489852, -0.424099, 0, 0, 0, 1, 1,
1.133087, -0.04468078, 1.668452, 0, 0, 0, 1, 1,
1.140691, 0.1803344, 0.4206456, 0, 0, 0, 1, 1,
1.140987, -0.692802, 2.894853, 0, 0, 0, 1, 1,
1.149351, -1.12501, 2.669195, 0, 0, 0, 1, 1,
1.155109, 0.5869882, -0.3790255, 0, 0, 0, 1, 1,
1.15839, 0.08408409, 0.3972383, 0, 0, 0, 1, 1,
1.161702, 1.899575, -0.09025831, 1, 1, 1, 1, 1,
1.161935, 0.5735475, 1.050332, 1, 1, 1, 1, 1,
1.162172, -1.133775, 1.419418, 1, 1, 1, 1, 1,
1.169474, 2.596265, 1.963096, 1, 1, 1, 1, 1,
1.187878, 0.112617, -0.2510493, 1, 1, 1, 1, 1,
1.190869, -0.5341464, 2.866623, 1, 1, 1, 1, 1,
1.195559, 0.3723252, 3.631853, 1, 1, 1, 1, 1,
1.197697, -0.1203803, 1.809127, 1, 1, 1, 1, 1,
1.197917, 1.733467, 0.7998222, 1, 1, 1, 1, 1,
1.213244, -0.2443885, 3.993901, 1, 1, 1, 1, 1,
1.215347, 1.474259, 0.4734959, 1, 1, 1, 1, 1,
1.217938, -1.11106, 4.992221, 1, 1, 1, 1, 1,
1.222255, -1.516436, 2.851836, 1, 1, 1, 1, 1,
1.239416, 1.372894, 0.3934608, 1, 1, 1, 1, 1,
1.241812, 0.9867932, -0.7176245, 1, 1, 1, 1, 1,
1.247386, 0.8896484, -1.015993, 0, 0, 1, 1, 1,
1.248389, -0.9531543, 1.335145, 1, 0, 0, 1, 1,
1.256865, 2.776001, -0.2351817, 1, 0, 0, 1, 1,
1.261213, 1.00628, 0.8687764, 1, 0, 0, 1, 1,
1.2643, 0.03232512, -0.2579521, 1, 0, 0, 1, 1,
1.268117, -0.6455358, 2.830244, 1, 0, 0, 1, 1,
1.275401, -0.4072644, 2.690349, 0, 0, 0, 1, 1,
1.275453, -0.3630587, 1.651673, 0, 0, 0, 1, 1,
1.27885, -1.715027, 2.439989, 0, 0, 0, 1, 1,
1.281056, -0.1891611, 0.5721154, 0, 0, 0, 1, 1,
1.285453, 0.1070393, 0.08428145, 0, 0, 0, 1, 1,
1.286219, -1.972541, 2.913886, 0, 0, 0, 1, 1,
1.289399, 1.512757, 1.513338, 0, 0, 0, 1, 1,
1.290087, 1.864741, 2.809958, 1, 1, 1, 1, 1,
1.313551, -0.7563583, 2.015723, 1, 1, 1, 1, 1,
1.317334, -0.09578198, 1.587773, 1, 1, 1, 1, 1,
1.318968, -0.4940308, 1.395542, 1, 1, 1, 1, 1,
1.324744, 0.4793871, -0.2585894, 1, 1, 1, 1, 1,
1.325991, 1.4244, 1.091896, 1, 1, 1, 1, 1,
1.360573, 0.1000721, 1.615753, 1, 1, 1, 1, 1,
1.361526, -1.331817, 3.153835, 1, 1, 1, 1, 1,
1.366513, -0.2641024, 0.04625796, 1, 1, 1, 1, 1,
1.378337, 0.05857013, 1.873201, 1, 1, 1, 1, 1,
1.383613, 0.3542269, -0.2411509, 1, 1, 1, 1, 1,
1.388122, 0.7661613, 1.399596, 1, 1, 1, 1, 1,
1.416419, -0.29983, 1.361399, 1, 1, 1, 1, 1,
1.42114, 1.29576, 3.336706, 1, 1, 1, 1, 1,
1.421256, 0.1026215, 1.542327, 1, 1, 1, 1, 1,
1.475969, -1.002934, 3.0433, 0, 0, 1, 1, 1,
1.487337, -0.8069, 2.166978, 1, 0, 0, 1, 1,
1.490712, -0.1911146, 1.902663, 1, 0, 0, 1, 1,
1.495625, 0.9532496, 1.118654, 1, 0, 0, 1, 1,
1.538947, 0.8259758, 0.2508458, 1, 0, 0, 1, 1,
1.544064, -0.1792906, 2.889915, 1, 0, 0, 1, 1,
1.544229, 0.9692396, -0.2222408, 0, 0, 0, 1, 1,
1.544756, -0.6387398, 1.347621, 0, 0, 0, 1, 1,
1.54525, 0.8866823, 0.3751598, 0, 0, 0, 1, 1,
1.558503, -0.9897233, 2.419826, 0, 0, 0, 1, 1,
1.561574, 0.2844115, 1.382541, 0, 0, 0, 1, 1,
1.567006, 0.4640644, 0.4604421, 0, 0, 0, 1, 1,
1.569724, -0.05452202, 1.363086, 0, 0, 0, 1, 1,
1.578557, -0.5314687, 2.844758, 1, 1, 1, 1, 1,
1.589389, -1.212336, 2.000081, 1, 1, 1, 1, 1,
1.589735, -0.6166123, 2.607019, 1, 1, 1, 1, 1,
1.601169, 2.692491, -0.07332708, 1, 1, 1, 1, 1,
1.606569, 0.6128641, 0.3354306, 1, 1, 1, 1, 1,
1.614252, 0.9793404, 2.112575, 1, 1, 1, 1, 1,
1.632278, -0.05829292, 3.755826, 1, 1, 1, 1, 1,
1.661007, 0.2987694, 2.306323, 1, 1, 1, 1, 1,
1.673581, 0.4242221, 1.971808, 1, 1, 1, 1, 1,
1.686406, -0.3459158, 1.864735, 1, 1, 1, 1, 1,
1.697879, 0.07368926, 1.705411, 1, 1, 1, 1, 1,
1.70295, -0.910105, 0.6485888, 1, 1, 1, 1, 1,
1.712916, -1.426057, 3.514918, 1, 1, 1, 1, 1,
1.714462, -0.4877009, 0.3798323, 1, 1, 1, 1, 1,
1.725559, -0.2728857, 1.4908, 1, 1, 1, 1, 1,
1.725641, -0.7310168, 1.465661, 0, 0, 1, 1, 1,
1.74262, 0.926825, 0.08693924, 1, 0, 0, 1, 1,
1.744217, -0.02098586, -0.6770349, 1, 0, 0, 1, 1,
1.750037, -1.80139, 0.2933232, 1, 0, 0, 1, 1,
1.763826, -0.8629171, 2.667777, 1, 0, 0, 1, 1,
1.767459, 0.8420731, 0.4869401, 1, 0, 0, 1, 1,
1.78141, 1.016749, 1.556184, 0, 0, 0, 1, 1,
1.793803, 0.04792513, 1.058395, 0, 0, 0, 1, 1,
1.806354, 0.3574533, 1.479825, 0, 0, 0, 1, 1,
1.809074, -0.4937533, 1.555578, 0, 0, 0, 1, 1,
1.821151, -0.6943465, 2.390822, 0, 0, 0, 1, 1,
1.826085, 1.5531, -0.7308751, 0, 0, 0, 1, 1,
1.830063, -1.024135, 3.134257, 0, 0, 0, 1, 1,
1.847741, -1.74808, 3.266707, 1, 1, 1, 1, 1,
1.851923, 0.04187557, 3.841375, 1, 1, 1, 1, 1,
1.854675, 2.340556, 0.721604, 1, 1, 1, 1, 1,
1.85896, 0.5224597, 1.173987, 1, 1, 1, 1, 1,
1.864781, 0.9187318, 0.5996649, 1, 1, 1, 1, 1,
1.869371, -1.069146, 0.8074783, 1, 1, 1, 1, 1,
1.882668, 0.05097662, -0.5805101, 1, 1, 1, 1, 1,
1.925279, 0.2630958, 1.067409, 1, 1, 1, 1, 1,
1.937024, 0.4687258, 1.001813, 1, 1, 1, 1, 1,
1.938873, -0.4210036, 2.812417, 1, 1, 1, 1, 1,
1.940877, 0.5906029, 1.986344, 1, 1, 1, 1, 1,
1.951429, 2.278688, -0.3862309, 1, 1, 1, 1, 1,
1.974405, 1.069254, 2.142438, 1, 1, 1, 1, 1,
1.999848, 0.73367, 2.362192, 1, 1, 1, 1, 1,
2.041705, -0.1928517, 0.6753995, 1, 1, 1, 1, 1,
2.064379, -0.2079017, 0.5287933, 0, 0, 1, 1, 1,
2.0646, 0.6166322, 1.797764, 1, 0, 0, 1, 1,
2.093501, 0.5659662, 0.6903488, 1, 0, 0, 1, 1,
2.128768, -0.7517936, 2.28556, 1, 0, 0, 1, 1,
2.135193, 0.4856272, 2.935373, 1, 0, 0, 1, 1,
2.160837, -0.3864856, 2.530167, 1, 0, 0, 1, 1,
2.187912, -0.4985475, 0.7405334, 0, 0, 0, 1, 1,
2.200562, -1.887639, 2.832676, 0, 0, 0, 1, 1,
2.210456, 1.040864, 0.6231603, 0, 0, 0, 1, 1,
2.21793, -1.961595, 1.440987, 0, 0, 0, 1, 1,
2.263164, -0.927953, 1.304437, 0, 0, 0, 1, 1,
2.267967, -1.107671, 2.049725, 0, 0, 0, 1, 1,
2.311792, -0.8989404, 1.172388, 0, 0, 0, 1, 1,
2.316396, 0.02106009, 2.241519, 1, 1, 1, 1, 1,
2.469694, 0.2640698, 0.4328674, 1, 1, 1, 1, 1,
2.482552, -0.8672609, 2.258488, 1, 1, 1, 1, 1,
2.581314, -1.023905, 2.746924, 1, 1, 1, 1, 1,
2.655322, -0.3441059, 3.270922, 1, 1, 1, 1, 1,
2.723559, -0.9088472, -0.9783565, 1, 1, 1, 1, 1,
2.771097, -0.7639206, 3.086419, 1, 1, 1, 1, 1
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
var radius = 9.182038;
var distance = 32.25152;
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
mvMatrix.translate( 0.05516541, 0.006249905, 0.1378326 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.25152);
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
