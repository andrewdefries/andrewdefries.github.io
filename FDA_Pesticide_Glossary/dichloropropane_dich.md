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
-2.590825, 0.1764758, -2.416054, 1, 0, 0, 1,
-2.440115, -0.04657032, -1.306551, 1, 0.007843138, 0, 1,
-2.436513, -0.5716934, -3.446646, 1, 0.01176471, 0, 1,
-2.35293, 1.884888, 0.5537292, 1, 0.01960784, 0, 1,
-2.268694, -0.9253984, -1.227466, 1, 0.02352941, 0, 1,
-2.245812, -1.412349, -1.708367, 1, 0.03137255, 0, 1,
-2.169513, 0.006389352, -2.460179, 1, 0.03529412, 0, 1,
-2.106701, 1.191082, 0.02156173, 1, 0.04313726, 0, 1,
-2.0771, 1.04061, -0.797694, 1, 0.04705882, 0, 1,
-2.073121, 0.4911963, -2.920214, 1, 0.05490196, 0, 1,
-2.071532, -0.09894641, -2.012211, 1, 0.05882353, 0, 1,
-2.057049, -0.8967618, -2.293429, 1, 0.06666667, 0, 1,
-2.028953, -0.3743278, -1.067659, 1, 0.07058824, 0, 1,
-1.986218, 0.9014718, 0.7770908, 1, 0.07843138, 0, 1,
-1.963078, -0.223407, -3.190509, 1, 0.08235294, 0, 1,
-1.959058, 1.168198, -1.102929, 1, 0.09019608, 0, 1,
-1.944767, -1.072814, -0.6001284, 1, 0.09411765, 0, 1,
-1.911831, 0.9685176, -0.07267044, 1, 0.1019608, 0, 1,
-1.908778, -1.011052, -3.289914, 1, 0.1098039, 0, 1,
-1.862321, -0.1961969, -2.25138, 1, 0.1137255, 0, 1,
-1.85131, -0.7309184, -2.940143, 1, 0.1215686, 0, 1,
-1.84964, 1.525655, 0.2484896, 1, 0.1254902, 0, 1,
-1.813976, -0.1320352, -1.496076, 1, 0.1333333, 0, 1,
-1.811751, 1.02298, -3.666495, 1, 0.1372549, 0, 1,
-1.801408, -1.090127, -3.373109, 1, 0.145098, 0, 1,
-1.792434, -0.9595579, -2.271388, 1, 0.1490196, 0, 1,
-1.733508, -0.2097401, -1.440234, 1, 0.1568628, 0, 1,
-1.732686, 0.6898952, -0.673524, 1, 0.1607843, 0, 1,
-1.730498, -0.1313509, -2.498882, 1, 0.1686275, 0, 1,
-1.729824, -1.750443, -1.956275, 1, 0.172549, 0, 1,
-1.726929, -0.9142245, -2.256749, 1, 0.1803922, 0, 1,
-1.702177, 0.8160601, 0.004677473, 1, 0.1843137, 0, 1,
-1.700479, -0.6067267, -3.476149, 1, 0.1921569, 0, 1,
-1.676387, -0.1964464, -2.341393, 1, 0.1960784, 0, 1,
-1.675144, 0.876773, 0.6635737, 1, 0.2039216, 0, 1,
-1.67028, -0.8983388, -2.770079, 1, 0.2117647, 0, 1,
-1.666742, 1.220951, -1.706118, 1, 0.2156863, 0, 1,
-1.633798, 0.3624465, -1.849311, 1, 0.2235294, 0, 1,
-1.629456, -0.1976945, -2.700449, 1, 0.227451, 0, 1,
-1.626863, -0.8676448, -0.8479266, 1, 0.2352941, 0, 1,
-1.615799, 0.6402563, -0.8564795, 1, 0.2392157, 0, 1,
-1.603859, -0.5440065, -4.167265, 1, 0.2470588, 0, 1,
-1.594153, 0.1804529, -1.15207, 1, 0.2509804, 0, 1,
-1.590124, -0.0005199757, -1.098451, 1, 0.2588235, 0, 1,
-1.574451, 0.2775236, -1.920421, 1, 0.2627451, 0, 1,
-1.571353, 0.6374326, -0.9112966, 1, 0.2705882, 0, 1,
-1.54772, 0.2956892, -2.895727, 1, 0.2745098, 0, 1,
-1.538585, -0.7685345, -1.744914, 1, 0.282353, 0, 1,
-1.538535, -0.1482104, -0.5050779, 1, 0.2862745, 0, 1,
-1.529354, -1.940505, -3.02118, 1, 0.2941177, 0, 1,
-1.517658, 0.8390414, -2.701298, 1, 0.3019608, 0, 1,
-1.516314, -1.586878, -1.63205, 1, 0.3058824, 0, 1,
-1.515177, 0.00901712, -1.800516, 1, 0.3137255, 0, 1,
-1.504485, 0.6536301, 0.5325345, 1, 0.3176471, 0, 1,
-1.500589, 1.723052, -0.9222211, 1, 0.3254902, 0, 1,
-1.495054, 0.2621043, -1.038032, 1, 0.3294118, 0, 1,
-1.488921, -1.648547, -2.50318, 1, 0.3372549, 0, 1,
-1.481501, -1.310601, -2.396008, 1, 0.3411765, 0, 1,
-1.47986, -0.06989613, 0.3635231, 1, 0.3490196, 0, 1,
-1.46554, 1.6329, -0.8400895, 1, 0.3529412, 0, 1,
-1.463055, 0.9683619, 0.1029365, 1, 0.3607843, 0, 1,
-1.46264, 0.2945239, -1.959506, 1, 0.3647059, 0, 1,
-1.462371, 0.9899378, -2.579248, 1, 0.372549, 0, 1,
-1.460791, 1.01164, -1.317601, 1, 0.3764706, 0, 1,
-1.456744, -0.2354109, -3.666398, 1, 0.3843137, 0, 1,
-1.437785, -0.05866995, -1.11439, 1, 0.3882353, 0, 1,
-1.434095, 0.590828, -1.712223, 1, 0.3960784, 0, 1,
-1.43017, -0.2150986, -1.727408, 1, 0.4039216, 0, 1,
-1.429803, -1.133475, -1.779538, 1, 0.4078431, 0, 1,
-1.424002, -0.03810795, -1.193398, 1, 0.4156863, 0, 1,
-1.395429, 0.5972259, -2.266884, 1, 0.4196078, 0, 1,
-1.393654, -1.173194, -3.884223, 1, 0.427451, 0, 1,
-1.392366, 1.679422, 0.3928574, 1, 0.4313726, 0, 1,
-1.38625, -0.1865571, -3.687754, 1, 0.4392157, 0, 1,
-1.381559, 0.7188419, -1.025715, 1, 0.4431373, 0, 1,
-1.374994, 0.2394767, -2.285729, 1, 0.4509804, 0, 1,
-1.361027, -0.2657152, -0.9447248, 1, 0.454902, 0, 1,
-1.358189, 0.2445295, -1.331749, 1, 0.4627451, 0, 1,
-1.348352, 0.5270144, -2.083974, 1, 0.4666667, 0, 1,
-1.339992, -1.961187, -3.572817, 1, 0.4745098, 0, 1,
-1.335514, -2.205267, -2.904933, 1, 0.4784314, 0, 1,
-1.33235, 1.883916, -0.7837244, 1, 0.4862745, 0, 1,
-1.331533, -0.4303338, -0.784478, 1, 0.4901961, 0, 1,
-1.330648, 0.6619446, -0.6640313, 1, 0.4980392, 0, 1,
-1.327777, -0.4146385, -2.547047, 1, 0.5058824, 0, 1,
-1.322019, 1.834238, -1.448179, 1, 0.509804, 0, 1,
-1.304583, -0.9982706, -2.5581, 1, 0.5176471, 0, 1,
-1.293198, 0.01562398, -1.363676, 1, 0.5215687, 0, 1,
-1.28996, -1.136082, -0.471076, 1, 0.5294118, 0, 1,
-1.285982, 2.083931, 0.6100764, 1, 0.5333334, 0, 1,
-1.280167, 1.980315, -0.8164109, 1, 0.5411765, 0, 1,
-1.272945, -1.158343, -4.26586, 1, 0.5450981, 0, 1,
-1.272607, 1.334779, -0.7813211, 1, 0.5529412, 0, 1,
-1.264943, -1.112683, -2.234493, 1, 0.5568628, 0, 1,
-1.262099, 1.331584, -0.5723839, 1, 0.5647059, 0, 1,
-1.255984, 0.1984563, -0.5975491, 1, 0.5686275, 0, 1,
-1.255199, -0.2646719, -2.243326, 1, 0.5764706, 0, 1,
-1.254958, -0.1718176, -2.753067, 1, 0.5803922, 0, 1,
-1.2506, 0.401877, -2.466042, 1, 0.5882353, 0, 1,
-1.248656, 1.193942, -1.26451, 1, 0.5921569, 0, 1,
-1.242353, 0.2555167, -1.450899, 1, 0.6, 0, 1,
-1.236403, 0.5605739, -1.354323, 1, 0.6078432, 0, 1,
-1.235552, -0.530347, -1.640427, 1, 0.6117647, 0, 1,
-1.234182, 1.148757, -1.908488, 1, 0.6196079, 0, 1,
-1.224186, 1.481105, -1.194979, 1, 0.6235294, 0, 1,
-1.222122, -0.3577383, -2.999509, 1, 0.6313726, 0, 1,
-1.218057, -1.363445, -2.260216, 1, 0.6352941, 0, 1,
-1.212463, 0.2257607, -2.623256, 1, 0.6431373, 0, 1,
-1.21118, 0.9831685, -1.769907, 1, 0.6470588, 0, 1,
-1.210195, -1.076968, -3.616554, 1, 0.654902, 0, 1,
-1.208704, -2.959875, -4.216397, 1, 0.6588235, 0, 1,
-1.207162, -1.258845, -3.127362, 1, 0.6666667, 0, 1,
-1.193631, 1.403864, -2.291929, 1, 0.6705883, 0, 1,
-1.193085, -0.2734242, -0.9059274, 1, 0.6784314, 0, 1,
-1.189828, 0.02704027, -2.171341, 1, 0.682353, 0, 1,
-1.185834, 1.14992, -1.288679, 1, 0.6901961, 0, 1,
-1.182667, -1.168781, -3.21508, 1, 0.6941177, 0, 1,
-1.181691, 1.368838, -1.073644, 1, 0.7019608, 0, 1,
-1.172649, -0.3164238, -0.6631336, 1, 0.7098039, 0, 1,
-1.156829, 0.8684734, -1.083318, 1, 0.7137255, 0, 1,
-1.152712, -0.2390241, -3.041336, 1, 0.7215686, 0, 1,
-1.14213, 0.5461823, -2.39996, 1, 0.7254902, 0, 1,
-1.137709, 0.2954224, -0.1875568, 1, 0.7333333, 0, 1,
-1.131777, -0.8203137, -0.859701, 1, 0.7372549, 0, 1,
-1.130949, 0.7729928, -2.325461, 1, 0.7450981, 0, 1,
-1.125432, -1.857076, -2.062047, 1, 0.7490196, 0, 1,
-1.12216, 0.2735074, -0.6315739, 1, 0.7568628, 0, 1,
-1.117997, -0.7198325, -1.83739, 1, 0.7607843, 0, 1,
-1.117742, 0.8025121, -2.297793, 1, 0.7686275, 0, 1,
-1.107608, 0.5745147, -1.575321, 1, 0.772549, 0, 1,
-1.105795, 0.7916827, -1.005631, 1, 0.7803922, 0, 1,
-1.097013, -0.3777123, -1.477425, 1, 0.7843137, 0, 1,
-1.093579, -0.5324599, -1.654104, 1, 0.7921569, 0, 1,
-1.086679, -1.295237, -5.915217, 1, 0.7960784, 0, 1,
-1.076191, 1.129408, -1.34382, 1, 0.8039216, 0, 1,
-1.075182, -1.370007, -3.851096, 1, 0.8117647, 0, 1,
-1.063798, -0.2572351, -3.532573, 1, 0.8156863, 0, 1,
-1.061955, 0.1967754, -1.519535, 1, 0.8235294, 0, 1,
-1.061026, 1.335739, -2.294068, 1, 0.827451, 0, 1,
-1.059188, 1.74803, 1.41386, 1, 0.8352941, 0, 1,
-1.058716, 2.014795, -0.2642824, 1, 0.8392157, 0, 1,
-1.057154, 0.6439858, -0.8622565, 1, 0.8470588, 0, 1,
-1.049674, 0.747368, -0.2587824, 1, 0.8509804, 0, 1,
-1.041409, 0.1735537, -0.9298075, 1, 0.8588235, 0, 1,
-1.032693, -0.2645203, -2.103952, 1, 0.8627451, 0, 1,
-1.021926, 0.4851363, -1.866208, 1, 0.8705882, 0, 1,
-1.012095, -1.684344, -2.536536, 1, 0.8745098, 0, 1,
-1.009869, -0.3731177, -0.7330413, 1, 0.8823529, 0, 1,
-0.9953656, 0.7590778, -0.9704801, 1, 0.8862745, 0, 1,
-0.9938323, 1.216509, -0.2635, 1, 0.8941177, 0, 1,
-0.9890925, 0.2088852, -0.8055629, 1, 0.8980392, 0, 1,
-0.980474, -1.562521, -3.156456, 1, 0.9058824, 0, 1,
-0.9717009, -0.785045, -2.974216, 1, 0.9137255, 0, 1,
-0.9659424, -0.7186587, -0.7286336, 1, 0.9176471, 0, 1,
-0.9656386, 0.2577911, -0.8099842, 1, 0.9254902, 0, 1,
-0.963223, 0.4204772, -2.183375, 1, 0.9294118, 0, 1,
-0.9598409, -2.715728, -2.000062, 1, 0.9372549, 0, 1,
-0.9578362, 0.07670701, -0.07799529, 1, 0.9411765, 0, 1,
-0.9575154, -0.8060663, -2.076108, 1, 0.9490196, 0, 1,
-0.950529, 0.5659314, -0.3045329, 1, 0.9529412, 0, 1,
-0.9486973, 1.242059, -0.9169372, 1, 0.9607843, 0, 1,
-0.9477719, -0.924836, -1.789237, 1, 0.9647059, 0, 1,
-0.9384032, -1.297749, -1.996689, 1, 0.972549, 0, 1,
-0.9288176, -0.9260057, -1.824139, 1, 0.9764706, 0, 1,
-0.9287351, -2.61015, -2.710559, 1, 0.9843137, 0, 1,
-0.9255626, 0.1476952, -0.3266435, 1, 0.9882353, 0, 1,
-0.9186513, -0.35626, -2.278932, 1, 0.9960784, 0, 1,
-0.9186036, -0.109037, -2.515185, 0.9960784, 1, 0, 1,
-0.9163539, 0.2720183, -1.955444, 0.9921569, 1, 0, 1,
-0.9162718, 0.6941951, -1.229277, 0.9843137, 1, 0, 1,
-0.9147978, 0.6744439, -1.407847, 0.9803922, 1, 0, 1,
-0.9106901, -1.245707, -2.53897, 0.972549, 1, 0, 1,
-0.9093339, 0.02796569, -2.445014, 0.9686275, 1, 0, 1,
-0.9055791, -0.7046448, -1.686939, 0.9607843, 1, 0, 1,
-0.9044217, -0.1185897, -1.262304, 0.9568627, 1, 0, 1,
-0.9043848, 0.134576, -1.181164, 0.9490196, 1, 0, 1,
-0.9043838, 0.6893528, -1.120036, 0.945098, 1, 0, 1,
-0.9022129, -1.208051, -3.242768, 0.9372549, 1, 0, 1,
-0.9019084, -0.7346782, -2.646181, 0.9333333, 1, 0, 1,
-0.899924, -0.233917, -2.170998, 0.9254902, 1, 0, 1,
-0.888231, -0.4141965, -0.7681927, 0.9215686, 1, 0, 1,
-0.8871627, -0.2920339, -1.989739, 0.9137255, 1, 0, 1,
-0.8819666, -1.113029, -2.765503, 0.9098039, 1, 0, 1,
-0.880365, 0.8640065, -3.317417, 0.9019608, 1, 0, 1,
-0.8789718, 2.04772, 0.4381147, 0.8941177, 1, 0, 1,
-0.8757405, -0.1803602, -1.491127, 0.8901961, 1, 0, 1,
-0.8744465, 0.6263596, -1.045815, 0.8823529, 1, 0, 1,
-0.8731827, 0.6030139, -0.3786139, 0.8784314, 1, 0, 1,
-0.8701834, -0.2527512, -2.095658, 0.8705882, 1, 0, 1,
-0.8582563, -0.9709231, -0.7108542, 0.8666667, 1, 0, 1,
-0.8572692, 0.01678765, -1.833117, 0.8588235, 1, 0, 1,
-0.852127, 0.3390801, 1.353459, 0.854902, 1, 0, 1,
-0.8515435, 0.9721096, -0.9825061, 0.8470588, 1, 0, 1,
-0.8490103, 0.04087125, -2.021642, 0.8431373, 1, 0, 1,
-0.8473624, 1.461892, 0.4200888, 0.8352941, 1, 0, 1,
-0.8461801, 1.50121, -0.4384572, 0.8313726, 1, 0, 1,
-0.8409786, 0.8543965, -0.3919773, 0.8235294, 1, 0, 1,
-0.8400185, -0.5268373, -1.529079, 0.8196079, 1, 0, 1,
-0.8306152, -0.00180004, -0.5994326, 0.8117647, 1, 0, 1,
-0.8292453, 2.039358, -0.007405603, 0.8078431, 1, 0, 1,
-0.8287719, -2.271377, -3.139177, 0.8, 1, 0, 1,
-0.8281404, 1.636686, -0.6231793, 0.7921569, 1, 0, 1,
-0.8230746, -0.3717437, -1.232245, 0.7882353, 1, 0, 1,
-0.8090124, 0.2038134, -2.665112, 0.7803922, 1, 0, 1,
-0.8087673, -0.1260552, -0.5432305, 0.7764706, 1, 0, 1,
-0.8081208, -0.04456546, -1.530063, 0.7686275, 1, 0, 1,
-0.8060179, 1.93186, -1.121411, 0.7647059, 1, 0, 1,
-0.8047611, 1.42581, -0.6824819, 0.7568628, 1, 0, 1,
-0.8002071, 0.07272033, -0.8539057, 0.7529412, 1, 0, 1,
-0.7990772, -0.3219902, -2.863344, 0.7450981, 1, 0, 1,
-0.7977072, 0.8087409, 0.2178802, 0.7411765, 1, 0, 1,
-0.7914342, 2.553233, 1.658036, 0.7333333, 1, 0, 1,
-0.7826132, 1.03573, -0.1218163, 0.7294118, 1, 0, 1,
-0.7817035, 0.8001792, -0.05310776, 0.7215686, 1, 0, 1,
-0.7810726, -0.04360747, -2.816251, 0.7176471, 1, 0, 1,
-0.7759464, 0.003923308, -0.09997588, 0.7098039, 1, 0, 1,
-0.7746841, -0.09937162, -1.262064, 0.7058824, 1, 0, 1,
-0.773653, -0.06933251, -1.732485, 0.6980392, 1, 0, 1,
-0.7699774, -1.316247, -1.144438, 0.6901961, 1, 0, 1,
-0.7687341, -0.3871761, -1.226448, 0.6862745, 1, 0, 1,
-0.7644496, 1.297719, 0.3063553, 0.6784314, 1, 0, 1,
-0.7562486, -3.002223, -4.399014, 0.6745098, 1, 0, 1,
-0.7501834, -0.03060332, -1.639678, 0.6666667, 1, 0, 1,
-0.7494805, 0.446353, -0.4272449, 0.6627451, 1, 0, 1,
-0.7485625, 0.7527632, -0.3933341, 0.654902, 1, 0, 1,
-0.7461599, -0.9841124, -3.220895, 0.6509804, 1, 0, 1,
-0.7411358, 0.6591949, -0.01401829, 0.6431373, 1, 0, 1,
-0.7391124, -1.39297, -1.550149, 0.6392157, 1, 0, 1,
-0.735978, -0.1072907, -3.30291, 0.6313726, 1, 0, 1,
-0.733892, 1.057001, 0.494896, 0.627451, 1, 0, 1,
-0.7315571, 0.5496045, -1.403197, 0.6196079, 1, 0, 1,
-0.7312496, 0.3172008, -1.705678, 0.6156863, 1, 0, 1,
-0.7283927, 0.6977437, -1.506059, 0.6078432, 1, 0, 1,
-0.7279766, -1.771428, -4.0696, 0.6039216, 1, 0, 1,
-0.7278701, 1.799331, -0.8954453, 0.5960785, 1, 0, 1,
-0.725693, -1.466656, -2.943305, 0.5882353, 1, 0, 1,
-0.7217286, 1.515082, -1.447198, 0.5843138, 1, 0, 1,
-0.7211197, -0.8601053, -0.06713659, 0.5764706, 1, 0, 1,
-0.7099625, 0.7036214, 0.09554352, 0.572549, 1, 0, 1,
-0.7077903, -0.7887492, -3.344685, 0.5647059, 1, 0, 1,
-0.704466, 0.6566513, 0.8808912, 0.5607843, 1, 0, 1,
-0.7028346, 0.2588595, -1.163433, 0.5529412, 1, 0, 1,
-0.7007805, -0.1674199, -0.8385139, 0.5490196, 1, 0, 1,
-0.6967867, 0.2822864, -2.114533, 0.5411765, 1, 0, 1,
-0.6899995, -0.2190487, -1.92398, 0.5372549, 1, 0, 1,
-0.6860645, 1.94073, -1.323369, 0.5294118, 1, 0, 1,
-0.6825753, 1.397552, -0.7843838, 0.5254902, 1, 0, 1,
-0.6783431, -0.872962, -4.050528, 0.5176471, 1, 0, 1,
-0.667087, 1.65735, -0.7132, 0.5137255, 1, 0, 1,
-0.6633473, -0.5881082, -3.578869, 0.5058824, 1, 0, 1,
-0.6612942, -1.238751, -2.584327, 0.5019608, 1, 0, 1,
-0.6554083, -1.092901, -1.761713, 0.4941176, 1, 0, 1,
-0.6547338, 0.4614265, 1.625287, 0.4862745, 1, 0, 1,
-0.6474668, 0.8813465, -0.5167285, 0.4823529, 1, 0, 1,
-0.6468275, 0.5776473, 0.5824288, 0.4745098, 1, 0, 1,
-0.6460377, -0.4430493, -1.900373, 0.4705882, 1, 0, 1,
-0.6442365, -0.5431657, -0.8791834, 0.4627451, 1, 0, 1,
-0.6434205, -0.341885, -2.518243, 0.4588235, 1, 0, 1,
-0.6322392, -0.3317412, -3.533652, 0.4509804, 1, 0, 1,
-0.6306723, -1.359334, -1.995948, 0.4470588, 1, 0, 1,
-0.6296456, 0.1761316, -1.230312, 0.4392157, 1, 0, 1,
-0.6287561, -0.1116883, -2.247613, 0.4352941, 1, 0, 1,
-0.6256084, 0.8387381, -0.7297725, 0.427451, 1, 0, 1,
-0.6227192, 1.330833, -1.937744, 0.4235294, 1, 0, 1,
-0.6224958, 1.179675, -1.565207, 0.4156863, 1, 0, 1,
-0.621365, -0.1152297, -2.16881, 0.4117647, 1, 0, 1,
-0.6142097, -0.2021081, -2.528926, 0.4039216, 1, 0, 1,
-0.6135325, 0.08617362, -2.752677, 0.3960784, 1, 0, 1,
-0.6066363, 1.72176, -1.146835, 0.3921569, 1, 0, 1,
-0.5966849, 1.951259, -1.198282, 0.3843137, 1, 0, 1,
-0.5914202, 1.419772, -0.1452148, 0.3803922, 1, 0, 1,
-0.5903131, -1.499691, -2.816734, 0.372549, 1, 0, 1,
-0.5881569, 0.1929309, -1.503076, 0.3686275, 1, 0, 1,
-0.5850639, 1.862282, -1.137967, 0.3607843, 1, 0, 1,
-0.5847857, -0.5203927, -2.702313, 0.3568628, 1, 0, 1,
-0.5829883, -1.162446, -2.92852, 0.3490196, 1, 0, 1,
-0.580857, 0.2549401, -1.891184, 0.345098, 1, 0, 1,
-0.5802755, 0.4122032, -1.226411, 0.3372549, 1, 0, 1,
-0.5789798, -1.15067, -2.702283, 0.3333333, 1, 0, 1,
-0.5763153, 0.3047428, -1.651507, 0.3254902, 1, 0, 1,
-0.5759921, 0.5707816, -1.116829, 0.3215686, 1, 0, 1,
-0.5678784, 1.579499, -0.1828019, 0.3137255, 1, 0, 1,
-0.5674778, -2.007652, -2.288037, 0.3098039, 1, 0, 1,
-0.5645378, -0.3578882, -2.115835, 0.3019608, 1, 0, 1,
-0.5600797, 0.4431216, -1.057873, 0.2941177, 1, 0, 1,
-0.5599898, 0.0007904699, -2.045129, 0.2901961, 1, 0, 1,
-0.5595332, 0.5004983, -1.182194, 0.282353, 1, 0, 1,
-0.5529466, 0.1720002, -2.001855, 0.2784314, 1, 0, 1,
-0.5505514, 1.31283, 0.5530524, 0.2705882, 1, 0, 1,
-0.550473, -1.373476, -2.117317, 0.2666667, 1, 0, 1,
-0.5487313, 1.269086, -0.5889387, 0.2588235, 1, 0, 1,
-0.5415702, -0.2237203, -2.300091, 0.254902, 1, 0, 1,
-0.5407596, -1.089603, -0.6348386, 0.2470588, 1, 0, 1,
-0.5404623, 0.3903989, -0.562251, 0.2431373, 1, 0, 1,
-0.5375918, 1.766627, -0.6216591, 0.2352941, 1, 0, 1,
-0.5373933, 0.3843058, -2.515752, 0.2313726, 1, 0, 1,
-0.5357672, -0.4190439, -1.210397, 0.2235294, 1, 0, 1,
-0.5345446, -0.1922842, -0.06292388, 0.2196078, 1, 0, 1,
-0.5319122, -0.747408, -1.813965, 0.2117647, 1, 0, 1,
-0.5309656, -0.6908832, -2.240103, 0.2078431, 1, 0, 1,
-0.530021, -0.5174576, -2.8728, 0.2, 1, 0, 1,
-0.5272456, -0.7112837, -1.006158, 0.1921569, 1, 0, 1,
-0.525955, -0.2209919, -2.847299, 0.1882353, 1, 0, 1,
-0.5232179, 0.04875396, -1.197722, 0.1803922, 1, 0, 1,
-0.5227121, 0.576886, 1.220785, 0.1764706, 1, 0, 1,
-0.519788, -0.815334, -2.067764, 0.1686275, 1, 0, 1,
-0.5196378, -1.560284, -3.220202, 0.1647059, 1, 0, 1,
-0.5170125, -0.8886996, -2.238949, 0.1568628, 1, 0, 1,
-0.5131068, -2.503398, -3.808955, 0.1529412, 1, 0, 1,
-0.5040407, -0.150551, -0.9554465, 0.145098, 1, 0, 1,
-0.5019493, -0.545135, -2.895505, 0.1411765, 1, 0, 1,
-0.4990142, -0.6547872, -3.265975, 0.1333333, 1, 0, 1,
-0.4983011, -1.328455, -3.806639, 0.1294118, 1, 0, 1,
-0.4970427, -0.4274844, -2.635923, 0.1215686, 1, 0, 1,
-0.4920886, 0.1035496, -1.438936, 0.1176471, 1, 0, 1,
-0.4892944, 1.219276, 2.271294, 0.1098039, 1, 0, 1,
-0.4890442, -0.05374023, -1.790039, 0.1058824, 1, 0, 1,
-0.4865828, 0.7678092, -1.392544, 0.09803922, 1, 0, 1,
-0.4862702, 0.7990123, 0.3927667, 0.09019608, 1, 0, 1,
-0.4832825, -0.5483853, -2.732035, 0.08627451, 1, 0, 1,
-0.4811448, 0.1039413, 0.3006337, 0.07843138, 1, 0, 1,
-0.4729297, -1.697808, -4.425055, 0.07450981, 1, 0, 1,
-0.4721578, -1.088184, -4.508543, 0.06666667, 1, 0, 1,
-0.4673908, -1.262579, -2.665044, 0.0627451, 1, 0, 1,
-0.4662083, -0.9020349, -1.712891, 0.05490196, 1, 0, 1,
-0.4627046, -1.564821, -2.257894, 0.05098039, 1, 0, 1,
-0.4611121, 1.654906, -0.225724, 0.04313726, 1, 0, 1,
-0.459846, -0.7252952, -3.755272, 0.03921569, 1, 0, 1,
-0.4546636, 0.2962293, 1.341184, 0.03137255, 1, 0, 1,
-0.4530587, 0.05097228, -2.053825, 0.02745098, 1, 0, 1,
-0.4525757, -1.926433, -3.005352, 0.01960784, 1, 0, 1,
-0.4487337, -0.7249966, -2.904811, 0.01568628, 1, 0, 1,
-0.4475042, -0.4862632, -1.354675, 0.007843138, 1, 0, 1,
-0.4465873, -1.974328, -3.619561, 0.003921569, 1, 0, 1,
-0.4419501, 0.5958791, -0.3733593, 0, 1, 0.003921569, 1,
-0.4419014, 1.612278, 1.847212, 0, 1, 0.01176471, 1,
-0.4394372, 1.217021, 1.295905, 0, 1, 0.01568628, 1,
-0.4368175, 0.1761342, -1.228498, 0, 1, 0.02352941, 1,
-0.4362129, -0.9872689, -2.246093, 0, 1, 0.02745098, 1,
-0.4314373, -2.539172, -2.211618, 0, 1, 0.03529412, 1,
-0.4284612, -2.045442, -4.330047, 0, 1, 0.03921569, 1,
-0.4262916, 0.2786289, -1.561915, 0, 1, 0.04705882, 1,
-0.4232236, 0.7088885, -0.009878719, 0, 1, 0.05098039, 1,
-0.4221738, 1.079736, 0.3001558, 0, 1, 0.05882353, 1,
-0.4219188, -0.1500618, -0.02515314, 0, 1, 0.0627451, 1,
-0.4214186, -0.6891266, -2.214387, 0, 1, 0.07058824, 1,
-0.4209784, 0.681976, 0.725338, 0, 1, 0.07450981, 1,
-0.4181395, -2.17141, -2.188783, 0, 1, 0.08235294, 1,
-0.4153478, -0.2527595, -3.564196, 0, 1, 0.08627451, 1,
-0.4144347, -0.9354074, -0.872256, 0, 1, 0.09411765, 1,
-0.4143182, -0.6234972, -3.337878, 0, 1, 0.1019608, 1,
-0.4141345, 1.678303, -1.429213, 0, 1, 0.1058824, 1,
-0.4064615, -0.7895194, -4.074372, 0, 1, 0.1137255, 1,
-0.4039737, -0.332036, -1.879798, 0, 1, 0.1176471, 1,
-0.4032357, -0.7539931, -3.25027, 0, 1, 0.1254902, 1,
-0.3990475, 0.08265495, -1.272467, 0, 1, 0.1294118, 1,
-0.3980683, -0.6699088, -1.847692, 0, 1, 0.1372549, 1,
-0.397514, 1.602924, -1.452524, 0, 1, 0.1411765, 1,
-0.3973992, 0.9673356, 0.7252543, 0, 1, 0.1490196, 1,
-0.3944383, -1.310908, -3.170521, 0, 1, 0.1529412, 1,
-0.3943058, -0.30746, -2.811242, 0, 1, 0.1607843, 1,
-0.3912154, -0.2574646, -2.214476, 0, 1, 0.1647059, 1,
-0.3884585, -0.6737121, -3.050402, 0, 1, 0.172549, 1,
-0.3859064, 0.5987678, -0.9466957, 0, 1, 0.1764706, 1,
-0.3848126, 0.7005348, -0.523221, 0, 1, 0.1843137, 1,
-0.3808609, -0.3957154, -2.593871, 0, 1, 0.1882353, 1,
-0.379721, 1.817414, -0.8456901, 0, 1, 0.1960784, 1,
-0.3745609, -0.5640782, -4.473505, 0, 1, 0.2039216, 1,
-0.370872, 1.901299, 0.489254, 0, 1, 0.2078431, 1,
-0.3680818, 0.3720798, 0.79125, 0, 1, 0.2156863, 1,
-0.3611522, 0.1353454, 0.1959913, 0, 1, 0.2196078, 1,
-0.3596387, 1.051872, -1.732325, 0, 1, 0.227451, 1,
-0.3587942, -0.3718992, -2.6946, 0, 1, 0.2313726, 1,
-0.3549701, 0.7625855, 1.268712, 0, 1, 0.2392157, 1,
-0.3548801, -0.3757415, -2.869504, 0, 1, 0.2431373, 1,
-0.354517, 0.04979432, -0.2590825, 0, 1, 0.2509804, 1,
-0.3518653, 0.564118, -1.27835, 0, 1, 0.254902, 1,
-0.3494337, -3.029704, -1.046057, 0, 1, 0.2627451, 1,
-0.3486269, -0.2012542, -3.896561, 0, 1, 0.2666667, 1,
-0.3472143, -1.943688, -3.796344, 0, 1, 0.2745098, 1,
-0.3420008, 0.1341205, -0.9741439, 0, 1, 0.2784314, 1,
-0.3372132, 0.9126588, 0.1486559, 0, 1, 0.2862745, 1,
-0.3336264, -2.007001, -3.374094, 0, 1, 0.2901961, 1,
-0.3307752, 0.03135541, -2.421697, 0, 1, 0.2980392, 1,
-0.3147823, 0.5411019, -1.014818, 0, 1, 0.3058824, 1,
-0.310552, -0.5071802, -2.34316, 0, 1, 0.3098039, 1,
-0.3105488, -1.362765, -3.877424, 0, 1, 0.3176471, 1,
-0.3067684, 1.104288, -1.108277, 0, 1, 0.3215686, 1,
-0.3065567, 2.003775, 0.08110397, 0, 1, 0.3294118, 1,
-0.3049019, -0.2345497, -2.704008, 0, 1, 0.3333333, 1,
-0.3041503, -0.2288157, -2.78904, 0, 1, 0.3411765, 1,
-0.3005951, 1.637882, -0.8691275, 0, 1, 0.345098, 1,
-0.2986961, -1.631432, -3.486012, 0, 1, 0.3529412, 1,
-0.2980842, 0.002712569, -0.9736839, 0, 1, 0.3568628, 1,
-0.296843, -0.08350506, -3.142337, 0, 1, 0.3647059, 1,
-0.287453, 1.075498, -1.211852, 0, 1, 0.3686275, 1,
-0.2842781, 1.216578, 0.873475, 0, 1, 0.3764706, 1,
-0.2792201, -0.8060051, -2.679441, 0, 1, 0.3803922, 1,
-0.272534, 0.6439683, 1.022486, 0, 1, 0.3882353, 1,
-0.270606, -0.1654192, -0.6383569, 0, 1, 0.3921569, 1,
-0.2671437, 0.4063703, -0.7287319, 0, 1, 0.4, 1,
-0.266714, 1.27515, -1.286974, 0, 1, 0.4078431, 1,
-0.2612171, 0.4545172, 0.5592475, 0, 1, 0.4117647, 1,
-0.2596973, -0.4261724, -2.272007, 0, 1, 0.4196078, 1,
-0.2596428, 0.6399195, 0.8809826, 0, 1, 0.4235294, 1,
-0.2596229, 0.7083251, -0.1633074, 0, 1, 0.4313726, 1,
-0.2593795, 1.165227, -0.6734783, 0, 1, 0.4352941, 1,
-0.253824, 0.9528417, -0.6956667, 0, 1, 0.4431373, 1,
-0.252613, 0.01227947, -0.9594752, 0, 1, 0.4470588, 1,
-0.251691, -0.8047722, -3.570376, 0, 1, 0.454902, 1,
-0.250913, 0.4173595, 0.7520066, 0, 1, 0.4588235, 1,
-0.2455618, 0.3812769, 0.2946623, 0, 1, 0.4666667, 1,
-0.2448079, -2.539108, -2.801861, 0, 1, 0.4705882, 1,
-0.2419108, 0.3710511, -1.655839, 0, 1, 0.4784314, 1,
-0.2324563, -0.4284746, -2.808564, 0, 1, 0.4823529, 1,
-0.2314134, -0.4047478, -3.415181, 0, 1, 0.4901961, 1,
-0.2293826, -1.616945, -3.811377, 0, 1, 0.4941176, 1,
-0.2267718, 0.2822784, 0.3013801, 0, 1, 0.5019608, 1,
-0.2204111, 0.7558894, -0.1212264, 0, 1, 0.509804, 1,
-0.2203114, 0.8394375, 1.597716, 0, 1, 0.5137255, 1,
-0.2197322, -0.04704564, -1.198024, 0, 1, 0.5215687, 1,
-0.2123013, -2.307117, -3.332293, 0, 1, 0.5254902, 1,
-0.2120631, -1.521672, -1.737646, 0, 1, 0.5333334, 1,
-0.2115265, 0.3870903, -1.407797, 0, 1, 0.5372549, 1,
-0.2085157, 1.154852, -1.113043, 0, 1, 0.5450981, 1,
-0.2036369, 0.7907948, 0.8070425, 0, 1, 0.5490196, 1,
-0.2017624, -0.6230288, -2.332392, 0, 1, 0.5568628, 1,
-0.1998914, -0.9469406, -5.036094, 0, 1, 0.5607843, 1,
-0.1993522, 0.4942191, -2.201428, 0, 1, 0.5686275, 1,
-0.1931023, -0.06102078, -1.25525, 0, 1, 0.572549, 1,
-0.18792, -0.05138995, -1.042772, 0, 1, 0.5803922, 1,
-0.1859772, -1.276407, -3.08076, 0, 1, 0.5843138, 1,
-0.1847295, 0.03053871, -1.005897, 0, 1, 0.5921569, 1,
-0.1798523, 0.1155127, -1.406469, 0, 1, 0.5960785, 1,
-0.1728262, 0.4221977, -0.1784932, 0, 1, 0.6039216, 1,
-0.1715339, 0.1734755, -1.832216, 0, 1, 0.6117647, 1,
-0.1714886, 1.312152, 1.094279, 0, 1, 0.6156863, 1,
-0.1699275, 1.272312, -0.539305, 0, 1, 0.6235294, 1,
-0.1652119, -0.6880767, -3.690285, 0, 1, 0.627451, 1,
-0.1650527, -0.9494878, -4.153189, 0, 1, 0.6352941, 1,
-0.1640481, -0.3801996, -2.664268, 0, 1, 0.6392157, 1,
-0.1618903, -0.4940914, -4.185664, 0, 1, 0.6470588, 1,
-0.1614637, 0.6230887, -0.8261817, 0, 1, 0.6509804, 1,
-0.1604719, 0.9995028, 1.011244, 0, 1, 0.6588235, 1,
-0.1593778, -0.3878075, -1.463927, 0, 1, 0.6627451, 1,
-0.1584357, 1.841898, -1.246161, 0, 1, 0.6705883, 1,
-0.1572865, -0.7344301, -1.999794, 0, 1, 0.6745098, 1,
-0.1561389, -0.942544, -4.910867, 0, 1, 0.682353, 1,
-0.156096, 0.5548027, -0.1807795, 0, 1, 0.6862745, 1,
-0.1541912, -0.2956313, -1.358512, 0, 1, 0.6941177, 1,
-0.1523803, -0.7139325, -1.977105, 0, 1, 0.7019608, 1,
-0.1519669, -0.4410179, -3.08947, 0, 1, 0.7058824, 1,
-0.1494577, 0.9756457, -1.38372, 0, 1, 0.7137255, 1,
-0.1466786, -0.5214263, -3.490157, 0, 1, 0.7176471, 1,
-0.1458281, -1.51626, -0.9382294, 0, 1, 0.7254902, 1,
-0.1438052, 0.634483, -0.5089432, 0, 1, 0.7294118, 1,
-0.1429018, -0.1149649, -2.910626, 0, 1, 0.7372549, 1,
-0.1380594, 1.192357, 0.8374708, 0, 1, 0.7411765, 1,
-0.1375722, -0.9444586, -2.263355, 0, 1, 0.7490196, 1,
-0.1351312, 2.03451, -0.9235489, 0, 1, 0.7529412, 1,
-0.1324702, -0.205706, -4.055775, 0, 1, 0.7607843, 1,
-0.1253473, 1.858716, -0.7850897, 0, 1, 0.7647059, 1,
-0.1250461, -1.741483, -2.604947, 0, 1, 0.772549, 1,
-0.122004, 1.853752, -0.4395109, 0, 1, 0.7764706, 1,
-0.1214901, -0.5987708, -3.630286, 0, 1, 0.7843137, 1,
-0.1158125, 1.134295, -1.987236, 0, 1, 0.7882353, 1,
-0.1150477, -0.07843141, -2.240034, 0, 1, 0.7960784, 1,
-0.1146241, -0.6041354, -2.986497, 0, 1, 0.8039216, 1,
-0.1145867, -0.9593382, -2.241164, 0, 1, 0.8078431, 1,
-0.1117378, 0.9587728, 0.8737028, 0, 1, 0.8156863, 1,
-0.1110643, -0.7848598, -3.680411, 0, 1, 0.8196079, 1,
-0.1076724, 1.370792, 0.1725106, 0, 1, 0.827451, 1,
-0.1075392, 0.2001747, 0.7858256, 0, 1, 0.8313726, 1,
-0.1066597, 1.862387, 1.480355, 0, 1, 0.8392157, 1,
-0.09716662, 0.1993338, -0.2979668, 0, 1, 0.8431373, 1,
-0.09600243, -0.8262171, -2.749881, 0, 1, 0.8509804, 1,
-0.09540348, 0.5761009, -1.868489, 0, 1, 0.854902, 1,
-0.09505802, 0.477033, -1.308667, 0, 1, 0.8627451, 1,
-0.09145382, 1.256395, 0.5374891, 0, 1, 0.8666667, 1,
-0.08903955, -0.2092417, -3.179445, 0, 1, 0.8745098, 1,
-0.08873564, 1.026106, -0.9360804, 0, 1, 0.8784314, 1,
-0.08601587, -0.346001, -4.325085, 0, 1, 0.8862745, 1,
-0.08570731, -0.290625, -3.524782, 0, 1, 0.8901961, 1,
-0.08392354, 0.2065684, -0.3687644, 0, 1, 0.8980392, 1,
-0.07667552, -1.526561, -3.303583, 0, 1, 0.9058824, 1,
-0.07072417, 0.05196789, -2.390069, 0, 1, 0.9098039, 1,
-0.06972968, -0.3997992, -0.2903394, 0, 1, 0.9176471, 1,
-0.06854747, 0.7031875, 0.7748378, 0, 1, 0.9215686, 1,
-0.06565265, 0.6209132, -1.656245, 0, 1, 0.9294118, 1,
-0.0653122, -1.822954, -1.945766, 0, 1, 0.9333333, 1,
-0.06250641, 0.9810457, 1.519173, 0, 1, 0.9411765, 1,
-0.0624283, -0.4985979, -3.271971, 0, 1, 0.945098, 1,
-0.06096384, -0.7512779, -0.9794275, 0, 1, 0.9529412, 1,
-0.0572146, 0.9884902, 0.1370576, 0, 1, 0.9568627, 1,
-0.05554528, 0.2256643, -1.14647, 0, 1, 0.9647059, 1,
-0.0542717, -1.055385, -2.044075, 0, 1, 0.9686275, 1,
-0.04830648, -0.04113586, -3.673928, 0, 1, 0.9764706, 1,
-0.04827558, 0.4360562, -0.07800828, 0, 1, 0.9803922, 1,
-0.04374911, -1.018549, -3.452801, 0, 1, 0.9882353, 1,
-0.04368894, -0.3900386, -3.426998, 0, 1, 0.9921569, 1,
-0.04315462, 0.657154, 1.653417, 0, 1, 1, 1,
-0.04161324, 1.722413, -1.293933, 0, 0.9921569, 1, 1,
-0.04119319, -1.288961, -3.12113, 0, 0.9882353, 1, 1,
-0.04094856, -0.4755028, -2.922779, 0, 0.9803922, 1, 1,
-0.03950443, -0.1808439, -0.8680405, 0, 0.9764706, 1, 1,
-0.03476855, 1.65431, -1.980458, 0, 0.9686275, 1, 1,
-0.03148033, 0.09809251, 0.6412292, 0, 0.9647059, 1, 1,
-0.03105868, 0.2498004, 0.5541168, 0, 0.9568627, 1, 1,
-0.02096275, 0.4181067, 0.2873151, 0, 0.9529412, 1, 1,
-0.02034354, -0.3800697, -4.80994, 0, 0.945098, 1, 1,
-0.01958574, -1.184704, -2.273667, 0, 0.9411765, 1, 1,
-0.01871238, -0.4802362, -1.849966, 0, 0.9333333, 1, 1,
-0.01389726, -1.448323, -3.49142, 0, 0.9294118, 1, 1,
-0.01025681, -2.192446, -2.314934, 0, 0.9215686, 1, 1,
-0.009732552, 0.1178817, -0.3445807, 0, 0.9176471, 1, 1,
-0.009577064, -1.783063, -1.589448, 0, 0.9098039, 1, 1,
-0.00895018, -0.6782594, -2.581304, 0, 0.9058824, 1, 1,
-0.004206222, 1.579425, 0.008891297, 0, 0.8980392, 1, 1,
-0.003558306, -1.148397, -4.278293, 0, 0.8901961, 1, 1,
-0.001280449, 0.09358374, 0.4666874, 0, 0.8862745, 1, 1,
0.001718543, -1.39002, 2.008851, 0, 0.8784314, 1, 1,
0.002399432, 0.5491942, 1.201384, 0, 0.8745098, 1, 1,
0.005594703, -1.609115, 4.733174, 0, 0.8666667, 1, 1,
0.007109654, 0.9239273, 0.2203406, 0, 0.8627451, 1, 1,
0.0100022, 1.681073, 0.2444618, 0, 0.854902, 1, 1,
0.01696373, 0.6170597, -2.151214, 0, 0.8509804, 1, 1,
0.02208952, 0.06461992, 1.806438, 0, 0.8431373, 1, 1,
0.03011291, -1.587884, 2.684996, 0, 0.8392157, 1, 1,
0.03454199, -1.543775, 1.494701, 0, 0.8313726, 1, 1,
0.03967803, -1.019279, 2.699992, 0, 0.827451, 1, 1,
0.04465334, -0.3858206, 2.309398, 0, 0.8196079, 1, 1,
0.04682825, 1.116228, -0.7127035, 0, 0.8156863, 1, 1,
0.04960892, -0.7482165, 1.117809, 0, 0.8078431, 1, 1,
0.0587975, -0.1839548, 3.86425, 0, 0.8039216, 1, 1,
0.05978002, -0.3763236, 6.63998, 0, 0.7960784, 1, 1,
0.06537943, 1.223749, -0.3143417, 0, 0.7882353, 1, 1,
0.06575162, 0.8393925, 0.5308111, 0, 0.7843137, 1, 1,
0.06602084, 0.2962479, 0.639345, 0, 0.7764706, 1, 1,
0.06768282, 1.005268, -0.624775, 0, 0.772549, 1, 1,
0.07048961, 1.034745, -0.5003272, 0, 0.7647059, 1, 1,
0.07079741, -0.7625088, 1.253596, 0, 0.7607843, 1, 1,
0.07141128, 1.792986, 1.04338, 0, 0.7529412, 1, 1,
0.0726055, 0.5824823, 1.328688, 0, 0.7490196, 1, 1,
0.08363935, 0.006784389, 1.488315, 0, 0.7411765, 1, 1,
0.08577306, -0.06765077, 2.555855, 0, 0.7372549, 1, 1,
0.08977321, 1.464305, 0.235449, 0, 0.7294118, 1, 1,
0.09416825, -0.2592948, 1.577873, 0, 0.7254902, 1, 1,
0.09421699, -0.3330843, 1.374963, 0, 0.7176471, 1, 1,
0.09459431, -0.4048783, 2.044965, 0, 0.7137255, 1, 1,
0.0991593, -0.6561158, 3.718945, 0, 0.7058824, 1, 1,
0.1023599, 0.123081, 1.682641, 0, 0.6980392, 1, 1,
0.1034092, 1.653696, -0.2015053, 0, 0.6941177, 1, 1,
0.1046898, 0.2768038, 0.6469634, 0, 0.6862745, 1, 1,
0.1064044, 0.5815696, 1.359051, 0, 0.682353, 1, 1,
0.1070973, 0.964707, -0.6593856, 0, 0.6745098, 1, 1,
0.107483, -2.13985, 2.896455, 0, 0.6705883, 1, 1,
0.1094933, 0.6230908, -2.687778, 0, 0.6627451, 1, 1,
0.1098384, 0.4808188, 0.6875962, 0, 0.6588235, 1, 1,
0.1100532, -0.2803849, 4.421856, 0, 0.6509804, 1, 1,
0.1108834, -0.1477607, 1.148448, 0, 0.6470588, 1, 1,
0.1148489, 0.05459668, 0.6670864, 0, 0.6392157, 1, 1,
0.1223473, -2.433712, 3.387136, 0, 0.6352941, 1, 1,
0.1278578, -1.801929, 1.239583, 0, 0.627451, 1, 1,
0.1327786, 1.156399, 2.136613, 0, 0.6235294, 1, 1,
0.1328124, -0.9087902, 4.368085, 0, 0.6156863, 1, 1,
0.1351259, -1.011363, 3.645191, 0, 0.6117647, 1, 1,
0.135169, 1.596377, -1.612863, 0, 0.6039216, 1, 1,
0.1367285, -0.3581146, 0.7939618, 0, 0.5960785, 1, 1,
0.1380885, -0.3364927, 2.753551, 0, 0.5921569, 1, 1,
0.1394781, 0.8614379, 1.361872, 0, 0.5843138, 1, 1,
0.1408113, 0.304554, 0.8639285, 0, 0.5803922, 1, 1,
0.1432712, 0.8164288, 0.5045401, 0, 0.572549, 1, 1,
0.1462801, -0.2261526, 2.26879, 0, 0.5686275, 1, 1,
0.1500018, -0.1551576, 2.59052, 0, 0.5607843, 1, 1,
0.1500481, 1.39879, 0.2011155, 0, 0.5568628, 1, 1,
0.1506777, -0.90365, 0.3327756, 0, 0.5490196, 1, 1,
0.1521529, 0.2777683, 1.650451, 0, 0.5450981, 1, 1,
0.1548426, 0.907155, 0.8834615, 0, 0.5372549, 1, 1,
0.1572356, -0.7279691, 3.680664, 0, 0.5333334, 1, 1,
0.1653393, -0.59527, 3.854509, 0, 0.5254902, 1, 1,
0.1692125, 0.3473415, -0.7485469, 0, 0.5215687, 1, 1,
0.1701096, -1.018488, 3.051356, 0, 0.5137255, 1, 1,
0.1757068, 0.4303047, 1.029247, 0, 0.509804, 1, 1,
0.1767795, 1.867221, 1.023972, 0, 0.5019608, 1, 1,
0.1808507, -0.5796896, 0.6730639, 0, 0.4941176, 1, 1,
0.1886932, -0.3743421, 2.138175, 0, 0.4901961, 1, 1,
0.1963091, -1.219965, 1.89893, 0, 0.4823529, 1, 1,
0.1985282, -0.763855, 2.175303, 0, 0.4784314, 1, 1,
0.1988676, -0.4426104, 2.41222, 0, 0.4705882, 1, 1,
0.2058709, 1.688137, -0.4114979, 0, 0.4666667, 1, 1,
0.207706, -0.4041411, 3.024535, 0, 0.4588235, 1, 1,
0.2084538, 0.2289361, 2.486085, 0, 0.454902, 1, 1,
0.2090321, -0.1820529, 1.65293, 0, 0.4470588, 1, 1,
0.2113034, -0.4630866, 2.714233, 0, 0.4431373, 1, 1,
0.2152884, 0.9529315, -0.7120859, 0, 0.4352941, 1, 1,
0.225564, -0.09879856, 4.229936, 0, 0.4313726, 1, 1,
0.2267054, 0.1483248, 1.119534, 0, 0.4235294, 1, 1,
0.235985, 0.1046357, 0.9206013, 0, 0.4196078, 1, 1,
0.2378109, 1.187515, 2.167575, 0, 0.4117647, 1, 1,
0.2431407, 0.6755347, -0.9265426, 0, 0.4078431, 1, 1,
0.244949, 1.663325, 0.6632112, 0, 0.4, 1, 1,
0.2475109, -0.9199601, 2.954387, 0, 0.3921569, 1, 1,
0.2494752, -0.5059129, 2.736201, 0, 0.3882353, 1, 1,
0.2528986, -0.2031019, 4.236442, 0, 0.3803922, 1, 1,
0.2545501, 0.1695576, -0.9078598, 0, 0.3764706, 1, 1,
0.2567, -0.6010766, 2.066217, 0, 0.3686275, 1, 1,
0.2578142, 1.447737, 0.820252, 0, 0.3647059, 1, 1,
0.2596215, 0.8214844, 1.192925, 0, 0.3568628, 1, 1,
0.2626976, 0.986577, 0.1300971, 0, 0.3529412, 1, 1,
0.2635367, -1.380868, 1.77295, 0, 0.345098, 1, 1,
0.263821, -0.6189535, 2.913318, 0, 0.3411765, 1, 1,
0.2682091, 0.4129207, 0.9292747, 0, 0.3333333, 1, 1,
0.2715517, -0.6801926, 3.743874, 0, 0.3294118, 1, 1,
0.2716581, 2.51875, -0.4960466, 0, 0.3215686, 1, 1,
0.2766439, -1.215458, 1.939443, 0, 0.3176471, 1, 1,
0.2795016, 0.1775005, 1.783258, 0, 0.3098039, 1, 1,
0.2796953, -0.2040275, 1.293152, 0, 0.3058824, 1, 1,
0.2815325, -0.7537815, 2.587348, 0, 0.2980392, 1, 1,
0.2836701, 0.02434412, 1.561382, 0, 0.2901961, 1, 1,
0.2847485, -0.4061457, 1.731939, 0, 0.2862745, 1, 1,
0.288132, 0.6244848, 0.01000785, 0, 0.2784314, 1, 1,
0.289343, -0.9464841, 1.260245, 0, 0.2745098, 1, 1,
0.2953662, -0.4514447, 2.818666, 0, 0.2666667, 1, 1,
0.2961279, 0.1644098, -0.02242373, 0, 0.2627451, 1, 1,
0.297045, -0.5955465, 1.587057, 0, 0.254902, 1, 1,
0.2971638, 0.435418, 1.40978, 0, 0.2509804, 1, 1,
0.297351, -0.8510733, 1.321735, 0, 0.2431373, 1, 1,
0.3002937, 0.5252241, 1.011042, 0, 0.2392157, 1, 1,
0.3017347, 0.1439597, 1.310727, 0, 0.2313726, 1, 1,
0.3033097, 1.407484, 0.2496208, 0, 0.227451, 1, 1,
0.305284, -0.8590885, 3.306601, 0, 0.2196078, 1, 1,
0.3185091, 0.9713264, -0.2712027, 0, 0.2156863, 1, 1,
0.3253512, 0.3711616, -0.9899728, 0, 0.2078431, 1, 1,
0.3286201, -1.018726, 3.066122, 0, 0.2039216, 1, 1,
0.3290667, -0.5837804, 1.737566, 0, 0.1960784, 1, 1,
0.3320497, 0.159064, 1.611707, 0, 0.1882353, 1, 1,
0.3338934, -0.9095393, 2.085677, 0, 0.1843137, 1, 1,
0.3369017, 0.09636915, 0.8743594, 0, 0.1764706, 1, 1,
0.3397862, -0.2503228, 2.131263, 0, 0.172549, 1, 1,
0.3471899, 0.8802181, 0.6888744, 0, 0.1647059, 1, 1,
0.3548226, -2.248538, 2.712239, 0, 0.1607843, 1, 1,
0.3551787, -0.7864243, 4.365602, 0, 0.1529412, 1, 1,
0.3552718, -0.9828716, 3.41905, 0, 0.1490196, 1, 1,
0.3558888, -0.1458795, 2.681456, 0, 0.1411765, 1, 1,
0.3561887, 0.5245142, -0.6691878, 0, 0.1372549, 1, 1,
0.359201, -0.724331, 2.778813, 0, 0.1294118, 1, 1,
0.3690953, 1.0054, -1.226247, 0, 0.1254902, 1, 1,
0.3721041, 1.609037, -0.1976797, 0, 0.1176471, 1, 1,
0.3739327, 1.251759, 1.605132, 0, 0.1137255, 1, 1,
0.3766846, 0.6323448, 1.471442, 0, 0.1058824, 1, 1,
0.3774775, -0.4685651, 0.5833771, 0, 0.09803922, 1, 1,
0.3784325, -0.6480951, 0.8390878, 0, 0.09411765, 1, 1,
0.3793925, -0.1224457, 3.812065, 0, 0.08627451, 1, 1,
0.3807851, -1.264394, 3.105765, 0, 0.08235294, 1, 1,
0.38365, 0.5591757, -0.079446, 0, 0.07450981, 1, 1,
0.3872184, -1.626387, 3.663599, 0, 0.07058824, 1, 1,
0.3874254, -0.4653357, 3.448158, 0, 0.0627451, 1, 1,
0.3879365, -0.6427405, 2.496957, 0, 0.05882353, 1, 1,
0.3879695, 1.252578, 0.1594491, 0, 0.05098039, 1, 1,
0.3894697, -2.327457, 3.240821, 0, 0.04705882, 1, 1,
0.3905583, 0.3988937, 1.953382, 0, 0.03921569, 1, 1,
0.3933839, 0.1325794, -0.8608769, 0, 0.03529412, 1, 1,
0.3939358, -0.274295, 1.413646, 0, 0.02745098, 1, 1,
0.3995966, 0.05664945, 1.608934, 0, 0.02352941, 1, 1,
0.4017117, 1.288439, 1.216465, 0, 0.01568628, 1, 1,
0.4024504, 0.6501255, 1.056126, 0, 0.01176471, 1, 1,
0.4066043, 0.1047103, 2.615082, 0, 0.003921569, 1, 1,
0.4073142, 1.521318, 1.821344, 0.003921569, 0, 1, 1,
0.4078582, -0.7637666, 1.795652, 0.007843138, 0, 1, 1,
0.4094421, 0.57649, 2.218646, 0.01568628, 0, 1, 1,
0.413377, 0.151861, 0.900258, 0.01960784, 0, 1, 1,
0.4154174, 0.1463496, 2.341016, 0.02745098, 0, 1, 1,
0.4163938, -0.4441158, 3.305234, 0.03137255, 0, 1, 1,
0.4184869, -0.1234876, 0.751222, 0.03921569, 0, 1, 1,
0.4192706, -0.5810048, 4.113696, 0.04313726, 0, 1, 1,
0.4202023, 0.3986219, 1.345751, 0.05098039, 0, 1, 1,
0.4218068, 1.119937, 1.751046, 0.05490196, 0, 1, 1,
0.4374664, 1.300016, -0.3567927, 0.0627451, 0, 1, 1,
0.4396363, 0.8965608, 2.62713, 0.06666667, 0, 1, 1,
0.4430498, -0.9519145, 1.421252, 0.07450981, 0, 1, 1,
0.4440815, 0.5667275, 1.176406, 0.07843138, 0, 1, 1,
0.4488695, -1.462238, 3.283256, 0.08627451, 0, 1, 1,
0.450213, -0.5370209, 1.431122, 0.09019608, 0, 1, 1,
0.4525794, -0.05146163, 2.003687, 0.09803922, 0, 1, 1,
0.4544203, -0.1039738, 2.702002, 0.1058824, 0, 1, 1,
0.4549173, 0.9539556, 2.063563, 0.1098039, 0, 1, 1,
0.4557801, -1.366874, 2.643963, 0.1176471, 0, 1, 1,
0.4560976, 0.1284888, 1.267457, 0.1215686, 0, 1, 1,
0.456834, -0.7582404, 3.612477, 0.1294118, 0, 1, 1,
0.4609342, -0.06192669, 0.4716195, 0.1333333, 0, 1, 1,
0.462069, -1.051561, 3.23703, 0.1411765, 0, 1, 1,
0.4621132, -0.3130812, 2.766473, 0.145098, 0, 1, 1,
0.4632222, -0.008931559, 1.618286, 0.1529412, 0, 1, 1,
0.468487, -1.91812, 1.333417, 0.1568628, 0, 1, 1,
0.4685349, 0.8522178, -0.3956653, 0.1647059, 0, 1, 1,
0.4730308, 1.187401, 1.311755, 0.1686275, 0, 1, 1,
0.4789087, 1.744026, 0.1779314, 0.1764706, 0, 1, 1,
0.4817106, -1.839567, 2.770765, 0.1803922, 0, 1, 1,
0.4817736, -0.6370103, 3.32175, 0.1882353, 0, 1, 1,
0.48902, 0.6163328, 0.9129022, 0.1921569, 0, 1, 1,
0.4890893, 0.115747, 1.294364, 0.2, 0, 1, 1,
0.5044852, -0.5124367, 3.487411, 0.2078431, 0, 1, 1,
0.51667, 0.4689451, 1.224927, 0.2117647, 0, 1, 1,
0.5180995, 1.297537, 1.26092, 0.2196078, 0, 1, 1,
0.5259156, 0.4662029, 0.161038, 0.2235294, 0, 1, 1,
0.5274953, 0.6052666, -0.07310427, 0.2313726, 0, 1, 1,
0.5289159, -0.3733985, 2.910271, 0.2352941, 0, 1, 1,
0.5393482, -1.205153, 3.154281, 0.2431373, 0, 1, 1,
0.5399539, -0.2231272, 1.790841, 0.2470588, 0, 1, 1,
0.5482442, -0.3181667, 0.9057755, 0.254902, 0, 1, 1,
0.548302, -0.7952793, 1.254174, 0.2588235, 0, 1, 1,
0.5533761, 1.419834, 0.2082746, 0.2666667, 0, 1, 1,
0.5645569, -0.5217394, 2.923026, 0.2705882, 0, 1, 1,
0.5646712, 0.5243394, -0.2412197, 0.2784314, 0, 1, 1,
0.5720885, -0.3293504, 2.478742, 0.282353, 0, 1, 1,
0.5750182, 0.6908818, 2.054906, 0.2901961, 0, 1, 1,
0.5819269, 1.151987, 0.2999866, 0.2941177, 0, 1, 1,
0.5831409, 0.6766084, 1.170454, 0.3019608, 0, 1, 1,
0.584501, 0.2151762, 0.007309427, 0.3098039, 0, 1, 1,
0.5883252, -0.1988136, 3.140889, 0.3137255, 0, 1, 1,
0.5950641, 0.1730794, 2.132632, 0.3215686, 0, 1, 1,
0.5951692, -0.1333379, 1.327047, 0.3254902, 0, 1, 1,
0.5988443, 0.08883718, 1.871969, 0.3333333, 0, 1, 1,
0.60113, -0.6976375, 2.355728, 0.3372549, 0, 1, 1,
0.6016396, -1.150767, 3.664852, 0.345098, 0, 1, 1,
0.6019469, 0.1402922, 2.090129, 0.3490196, 0, 1, 1,
0.6041346, -0.4965005, 2.981588, 0.3568628, 0, 1, 1,
0.6065757, -1.485353, 2.049413, 0.3607843, 0, 1, 1,
0.607203, -0.9350272, 3.550289, 0.3686275, 0, 1, 1,
0.6075726, 0.2401634, 0.9154129, 0.372549, 0, 1, 1,
0.6076329, -0.2819919, 2.984276, 0.3803922, 0, 1, 1,
0.6092868, -0.252624, 3.005402, 0.3843137, 0, 1, 1,
0.6093727, 0.7042632, 0.2360938, 0.3921569, 0, 1, 1,
0.6094728, 0.4017307, 3.274444, 0.3960784, 0, 1, 1,
0.6107302, -0.6859353, 3.066073, 0.4039216, 0, 1, 1,
0.6142738, 0.3531219, -0.1988505, 0.4117647, 0, 1, 1,
0.6156268, 1.655851, 1.397515, 0.4156863, 0, 1, 1,
0.6189577, -0.3079408, 1.64999, 0.4235294, 0, 1, 1,
0.6207373, -1.022111, 3.577001, 0.427451, 0, 1, 1,
0.622235, -0.2836056, 3.234869, 0.4352941, 0, 1, 1,
0.6261021, -0.2003873, 2.474869, 0.4392157, 0, 1, 1,
0.6310382, 0.2085064, 1.269494, 0.4470588, 0, 1, 1,
0.6328202, -0.1758068, 1.984395, 0.4509804, 0, 1, 1,
0.6360527, 1.481484, 1.236139, 0.4588235, 0, 1, 1,
0.6372682, -0.2466465, 2.016244, 0.4627451, 0, 1, 1,
0.6380851, 1.886455, 0.4532533, 0.4705882, 0, 1, 1,
0.6381385, 1.015746, 0.9130967, 0.4745098, 0, 1, 1,
0.6428331, -0.9150472, -0.7237843, 0.4823529, 0, 1, 1,
0.6442842, -0.2683977, -0.05250263, 0.4862745, 0, 1, 1,
0.6532731, -0.9597851, 1.054501, 0.4941176, 0, 1, 1,
0.6647435, 1.619316, 0.04335026, 0.5019608, 0, 1, 1,
0.6651514, -0.9358096, 2.714317, 0.5058824, 0, 1, 1,
0.6795608, 0.6382225, 0.3323367, 0.5137255, 0, 1, 1,
0.6804671, -0.5261512, 3.195035, 0.5176471, 0, 1, 1,
0.681362, 0.0400307, 3.096267, 0.5254902, 0, 1, 1,
0.6834781, -0.7231479, 2.635694, 0.5294118, 0, 1, 1,
0.6876555, -0.1824902, 0.8365492, 0.5372549, 0, 1, 1,
0.6879678, 0.9917195, 2.169228, 0.5411765, 0, 1, 1,
0.6938047, 1.664978, -0.545867, 0.5490196, 0, 1, 1,
0.6965368, -1.278425, 2.954708, 0.5529412, 0, 1, 1,
0.6975423, 1.172111, 0.8227642, 0.5607843, 0, 1, 1,
0.6985206, 0.4590544, 0.6339185, 0.5647059, 0, 1, 1,
0.7004161, -1.210381, 2.593614, 0.572549, 0, 1, 1,
0.7020036, -1.543929, 1.805233, 0.5764706, 0, 1, 1,
0.7024845, -1.327628, 1.615564, 0.5843138, 0, 1, 1,
0.7051861, 1.596073, -0.9884815, 0.5882353, 0, 1, 1,
0.7066331, -1.092725, 2.597142, 0.5960785, 0, 1, 1,
0.7080448, 0.936198, 0.6684048, 0.6039216, 0, 1, 1,
0.7089548, 1.570112, -0.3233408, 0.6078432, 0, 1, 1,
0.7135872, 0.05466417, 2.52209, 0.6156863, 0, 1, 1,
0.7146823, 1.586146, 0.7701542, 0.6196079, 0, 1, 1,
0.7171531, 0.4907467, 0.4597214, 0.627451, 0, 1, 1,
0.7241864, 1.177262, 0.4741106, 0.6313726, 0, 1, 1,
0.727671, -0.567635, 1.939847, 0.6392157, 0, 1, 1,
0.7337058, 1.472556, 0.1810718, 0.6431373, 0, 1, 1,
0.7361354, -1.208503, 2.796466, 0.6509804, 0, 1, 1,
0.7394916, -1.9975, 2.261409, 0.654902, 0, 1, 1,
0.7441736, 0.7413531, 0.6101242, 0.6627451, 0, 1, 1,
0.7443811, 0.3099948, 3.656798, 0.6666667, 0, 1, 1,
0.7449202, -0.53154, 1.201628, 0.6745098, 0, 1, 1,
0.7474276, -0.5681148, 1.099393, 0.6784314, 0, 1, 1,
0.7478126, -0.09096491, 2.525134, 0.6862745, 0, 1, 1,
0.7495091, -0.9142594, 3.764859, 0.6901961, 0, 1, 1,
0.7528248, -0.3636892, 3.634927, 0.6980392, 0, 1, 1,
0.7547848, 1.021878, 1.124522, 0.7058824, 0, 1, 1,
0.7658922, 0.1072758, 1.214318, 0.7098039, 0, 1, 1,
0.7676399, -0.03826578, 2.27434, 0.7176471, 0, 1, 1,
0.768839, -0.688329, -1.358601, 0.7215686, 0, 1, 1,
0.7790658, 1.092113, 0.2373607, 0.7294118, 0, 1, 1,
0.7810804, 1.704113, -0.007140351, 0.7333333, 0, 1, 1,
0.792618, 1.687458, 1.33286, 0.7411765, 0, 1, 1,
0.7994291, 0.7023814, -0.4628967, 0.7450981, 0, 1, 1,
0.8003353, 0.6747854, 0.7770087, 0.7529412, 0, 1, 1,
0.81223, -0.12726, 1.5414, 0.7568628, 0, 1, 1,
0.8194385, 1.483224, -0.08823832, 0.7647059, 0, 1, 1,
0.8252107, -1.481757, 5.013231, 0.7686275, 0, 1, 1,
0.8253942, 0.5626941, -1.029464, 0.7764706, 0, 1, 1,
0.8259403, 0.404823, 1.505861, 0.7803922, 0, 1, 1,
0.8281165, -1.667358, 1.834747, 0.7882353, 0, 1, 1,
0.831907, 0.1640292, 2.766257, 0.7921569, 0, 1, 1,
0.833863, -0.6503718, 0.964186, 0.8, 0, 1, 1,
0.8354657, 0.6314898, 0.7149721, 0.8078431, 0, 1, 1,
0.837585, 0.9234495, 1.617524, 0.8117647, 0, 1, 1,
0.8467937, -1.26596, 2.365478, 0.8196079, 0, 1, 1,
0.8481687, -0.4610733, 2.55041, 0.8235294, 0, 1, 1,
0.8498136, 0.2629612, 2.48617, 0.8313726, 0, 1, 1,
0.8524313, -0.0512172, 2.200329, 0.8352941, 0, 1, 1,
0.858752, -0.9478567, 2.662452, 0.8431373, 0, 1, 1,
0.860318, 0.6678059, -0.05013886, 0.8470588, 0, 1, 1,
0.860418, 2.17659, 1.341083, 0.854902, 0, 1, 1,
0.8760593, 0.3662286, -0.2798754, 0.8588235, 0, 1, 1,
0.8827357, -1.290043, 2.733382, 0.8666667, 0, 1, 1,
0.8829583, 0.2097023, 1.397244, 0.8705882, 0, 1, 1,
0.8960567, 0.4637979, 0.2142614, 0.8784314, 0, 1, 1,
0.898899, 0.6128702, 2.865775, 0.8823529, 0, 1, 1,
0.9027192, -1.553892, 3.459235, 0.8901961, 0, 1, 1,
0.9040637, 1.786425, 0.6209255, 0.8941177, 0, 1, 1,
0.91036, 0.3904539, -0.5809713, 0.9019608, 0, 1, 1,
0.9135586, 0.3889467, -0.3723439, 0.9098039, 0, 1, 1,
0.9143993, -3.025199, 1.530893, 0.9137255, 0, 1, 1,
0.9153528, 1.434992, -0.1556919, 0.9215686, 0, 1, 1,
0.9197569, 0.7582259, 2.687523, 0.9254902, 0, 1, 1,
0.9249027, 0.6476504, 0.9644836, 0.9333333, 0, 1, 1,
0.9280409, 0.3498803, 2.772046, 0.9372549, 0, 1, 1,
0.9305365, -2.617018, 2.042661, 0.945098, 0, 1, 1,
0.9379815, 0.09281775, 3.278237, 0.9490196, 0, 1, 1,
0.9397955, 0.2753275, 1.717762, 0.9568627, 0, 1, 1,
0.952597, -0.1808567, 0.2762187, 0.9607843, 0, 1, 1,
0.9557895, 0.1850071, 2.725056, 0.9686275, 0, 1, 1,
0.9559283, 1.319387, 2.097065, 0.972549, 0, 1, 1,
0.9582321, -0.3883033, 3.431536, 0.9803922, 0, 1, 1,
0.9613463, -1.082543, 2.151159, 0.9843137, 0, 1, 1,
0.975776, 0.419663, 1.996041, 0.9921569, 0, 1, 1,
0.9772255, -0.7755119, 2.623269, 0.9960784, 0, 1, 1,
0.9777904, 2.340913, 3.02045, 1, 0, 0.9960784, 1,
0.9831255, 0.826974, 0.9726939, 1, 0, 0.9882353, 1,
0.985074, -0.4301579, 1.433493, 1, 0, 0.9843137, 1,
1.00663, 2.000861, -0.6453955, 1, 0, 0.9764706, 1,
1.008601, 0.6131463, 1.613762, 1, 0, 0.972549, 1,
1.012886, 0.01612392, 1.010492, 1, 0, 0.9647059, 1,
1.021104, -1.980501, 0.949405, 1, 0, 0.9607843, 1,
1.033697, -0.8951055, 2.845616, 1, 0, 0.9529412, 1,
1.035441, 0.7589087, 2.367164, 1, 0, 0.9490196, 1,
1.03864, 0.1796693, 3.483382, 1, 0, 0.9411765, 1,
1.038844, 0.907612, 0.3547277, 1, 0, 0.9372549, 1,
1.051459, 0.361816, 1.372546, 1, 0, 0.9294118, 1,
1.053742, 0.6045826, 0.7356588, 1, 0, 0.9254902, 1,
1.061413, 0.8584462, 2.429322, 1, 0, 0.9176471, 1,
1.062089, 0.1589836, -0.3160781, 1, 0, 0.9137255, 1,
1.062864, -0.7759652, 1.334961, 1, 0, 0.9058824, 1,
1.067488, 0.6961021, 1.923893, 1, 0, 0.9019608, 1,
1.070336, 0.5447942, 1.307141, 1, 0, 0.8941177, 1,
1.071267, 0.9727842, 0.8631464, 1, 0, 0.8862745, 1,
1.073912, -0.392333, 0.5371131, 1, 0, 0.8823529, 1,
1.074345, 0.9667849, 1.731215, 1, 0, 0.8745098, 1,
1.079269, 0.2541917, 1.723139, 1, 0, 0.8705882, 1,
1.080688, -0.1423336, 1.512506, 1, 0, 0.8627451, 1,
1.083045, -0.5058417, 1.466059, 1, 0, 0.8588235, 1,
1.083603, -1.280139, 3.257511, 1, 0, 0.8509804, 1,
1.097904, -0.5247778, 2.121608, 1, 0, 0.8470588, 1,
1.09918, -0.1004126, 2.389173, 1, 0, 0.8392157, 1,
1.101576, 1.595187, 2.503821, 1, 0, 0.8352941, 1,
1.104002, 0.3387005, 0.8487365, 1, 0, 0.827451, 1,
1.107412, -1.354967, 0.3229129, 1, 0, 0.8235294, 1,
1.112229, 0.2840429, 1.482285, 1, 0, 0.8156863, 1,
1.113914, -0.2434692, 0.7527341, 1, 0, 0.8117647, 1,
1.116516, 0.1094178, 1.993591, 1, 0, 0.8039216, 1,
1.117439, 0.989709, 0.8807433, 1, 0, 0.7960784, 1,
1.120054, 0.3645964, 1.338362, 1, 0, 0.7921569, 1,
1.121731, -0.1272654, 2.814313, 1, 0, 0.7843137, 1,
1.145694, -0.9258373, 3.078804, 1, 0, 0.7803922, 1,
1.1468, 1.036376, 0.2838858, 1, 0, 0.772549, 1,
1.159546, -0.1291817, 0.4107029, 1, 0, 0.7686275, 1,
1.1649, 1.240282, -0.1624515, 1, 0, 0.7607843, 1,
1.177154, 0.1921995, 1.244248, 1, 0, 0.7568628, 1,
1.186414, -0.1708081, -0.09855193, 1, 0, 0.7490196, 1,
1.217959, 0.8022217, 0.7783932, 1, 0, 0.7450981, 1,
1.220509, -1.246308, 3.6188, 1, 0, 0.7372549, 1,
1.220746, -0.1078912, 1.148929, 1, 0, 0.7333333, 1,
1.224424, -0.3266602, 2.496014, 1, 0, 0.7254902, 1,
1.231101, -1.310966, 0.9016161, 1, 0, 0.7215686, 1,
1.246136, -0.5016008, 1.621463, 1, 0, 0.7137255, 1,
1.252725, -0.1427665, 0.4004509, 1, 0, 0.7098039, 1,
1.253982, -1.222445, 3.394271, 1, 0, 0.7019608, 1,
1.268243, -0.5068153, 2.129632, 1, 0, 0.6941177, 1,
1.268798, -0.6850349, 2.228889, 1, 0, 0.6901961, 1,
1.280462, 1.949091, 1.366638, 1, 0, 0.682353, 1,
1.283285, -0.5625876, 2.742703, 1, 0, 0.6784314, 1,
1.295591, -0.5553686, 1.967662, 1, 0, 0.6705883, 1,
1.302055, 1.090188, 1.574818, 1, 0, 0.6666667, 1,
1.305562, 0.5001895, 1.109653, 1, 0, 0.6588235, 1,
1.307866, 0.6752508, 1.67717, 1, 0, 0.654902, 1,
1.311488, -0.2212404, 2.616344, 1, 0, 0.6470588, 1,
1.311507, -0.3239759, -0.4806121, 1, 0, 0.6431373, 1,
1.322611, -0.7874525, 2.066238, 1, 0, 0.6352941, 1,
1.32669, -0.1802252, 1.058886, 1, 0, 0.6313726, 1,
1.326819, -0.7740011, 1.827071, 1, 0, 0.6235294, 1,
1.331037, -0.5198728, 2.695253, 1, 0, 0.6196079, 1,
1.333437, -0.8681495, 2.111993, 1, 0, 0.6117647, 1,
1.337905, -0.4171507, 2.706039, 1, 0, 0.6078432, 1,
1.340032, -1.198642, 2.994056, 1, 0, 0.6, 1,
1.35683, 0.1404206, 0.785759, 1, 0, 0.5921569, 1,
1.358143, -1.332069, 3.461725, 1, 0, 0.5882353, 1,
1.35922, 1.54013, 2.785188, 1, 0, 0.5803922, 1,
1.360249, -3.514947, 3.774597, 1, 0, 0.5764706, 1,
1.360472, 1.105924, 1.274975, 1, 0, 0.5686275, 1,
1.362806, -2.185657, 3.009813, 1, 0, 0.5647059, 1,
1.384613, 0.04964142, 1.234564, 1, 0, 0.5568628, 1,
1.394988, -1.362367, 0.7456015, 1, 0, 0.5529412, 1,
1.397845, -0.2877761, 2.170644, 1, 0, 0.5450981, 1,
1.400725, -1.174621, 1.663373, 1, 0, 0.5411765, 1,
1.403595, 1.351634, 1.603467, 1, 0, 0.5333334, 1,
1.418667, -1.68426, 1.890668, 1, 0, 0.5294118, 1,
1.436167, -0.667798, 4.399326, 1, 0, 0.5215687, 1,
1.438296, 0.8713235, 0.36734, 1, 0, 0.5176471, 1,
1.438565, 0.1874079, 3.488952, 1, 0, 0.509804, 1,
1.439718, 2.048617, 0.8329384, 1, 0, 0.5058824, 1,
1.441637, 0.1120292, 2.368047, 1, 0, 0.4980392, 1,
1.446379, -1.485666, 1.417608, 1, 0, 0.4901961, 1,
1.450259, -0.3618979, 0.9868403, 1, 0, 0.4862745, 1,
1.450378, 0.9678585, 1.282116, 1, 0, 0.4784314, 1,
1.48118, 0.4099391, 0.4723235, 1, 0, 0.4745098, 1,
1.48252, 1.459508, 1.141068, 1, 0, 0.4666667, 1,
1.497567, 0.5277259, 1.703327, 1, 0, 0.4627451, 1,
1.512966, -0.5425069, 1.365041, 1, 0, 0.454902, 1,
1.521294, 0.04674694, 1.812576, 1, 0, 0.4509804, 1,
1.527419, -1.331243, 3.223358, 1, 0, 0.4431373, 1,
1.528011, 0.1735152, -1.059823, 1, 0, 0.4392157, 1,
1.528442, 0.7983164, 1.597804, 1, 0, 0.4313726, 1,
1.529145, -0.03344094, 2.302337, 1, 0, 0.427451, 1,
1.529805, -2.103785, 0.8283521, 1, 0, 0.4196078, 1,
1.536271, -0.02091177, -0.490227, 1, 0, 0.4156863, 1,
1.539409, -0.4279884, 2.599588, 1, 0, 0.4078431, 1,
1.545285, -1.44335, 1.702544, 1, 0, 0.4039216, 1,
1.564636, -1.235555, 3.150452, 1, 0, 0.3960784, 1,
1.565569, 1.127104, 1.058376, 1, 0, 0.3882353, 1,
1.574804, -1.539443, 1.208498, 1, 0, 0.3843137, 1,
1.581178, 0.474005, 1.155292, 1, 0, 0.3764706, 1,
1.583053, -1.111146, 2.191825, 1, 0, 0.372549, 1,
1.586001, -0.3329041, 2.183091, 1, 0, 0.3647059, 1,
1.620128, 0.1553925, 0.7007464, 1, 0, 0.3607843, 1,
1.62058, -0.4001043, 1.691475, 1, 0, 0.3529412, 1,
1.628357, -0.02058201, 1.141276, 1, 0, 0.3490196, 1,
1.628816, -0.3414242, 0.530037, 1, 0, 0.3411765, 1,
1.632208, 0.8723102, 1.503616, 1, 0, 0.3372549, 1,
1.634496, -0.2374099, 2.55847, 1, 0, 0.3294118, 1,
1.63669, 0.4651587, 0.9283311, 1, 0, 0.3254902, 1,
1.638534, 1.377858, 0.210173, 1, 0, 0.3176471, 1,
1.649325, 0.4857553, 1.682783, 1, 0, 0.3137255, 1,
1.655396, -1.30678, 2.039773, 1, 0, 0.3058824, 1,
1.666366, 0.2185189, 1.59295, 1, 0, 0.2980392, 1,
1.677768, 0.5170096, 0.5068199, 1, 0, 0.2941177, 1,
1.679059, 1.401881, 1.979959, 1, 0, 0.2862745, 1,
1.681552, 0.07544277, 0.5375375, 1, 0, 0.282353, 1,
1.686679, -0.9184215, 2.55955, 1, 0, 0.2745098, 1,
1.691274, -0.7804266, 0.7590109, 1, 0, 0.2705882, 1,
1.693261, -0.1489608, 1.985959, 1, 0, 0.2627451, 1,
1.700332, 1.008503, 2.169948, 1, 0, 0.2588235, 1,
1.702344, -0.8618659, 3.21178, 1, 0, 0.2509804, 1,
1.713178, -0.746498, 1.679535, 1, 0, 0.2470588, 1,
1.721713, -0.5908974, 3.851106, 1, 0, 0.2392157, 1,
1.723845, -0.50392, 0.2698745, 1, 0, 0.2352941, 1,
1.733956, 0.2158268, 1.383709, 1, 0, 0.227451, 1,
1.74025, 0.381982, 0.6617374, 1, 0, 0.2235294, 1,
1.769515, 0.8368346, -0.4723387, 1, 0, 0.2156863, 1,
1.789383, 1.306881, 0.402109, 1, 0, 0.2117647, 1,
1.802911, -0.506807, 2.222491, 1, 0, 0.2039216, 1,
1.808822, 0.3733042, 1.296118, 1, 0, 0.1960784, 1,
1.849548, 1.382389, 1.433427, 1, 0, 0.1921569, 1,
1.86355, -1.523293, 3.543957, 1, 0, 0.1843137, 1,
1.870988, 0.3113002, 1.966087, 1, 0, 0.1803922, 1,
1.874526, 0.9705402, 0.2511128, 1, 0, 0.172549, 1,
1.884998, 0.321718, 3.065562, 1, 0, 0.1686275, 1,
1.927443, -0.8669286, 0.8136374, 1, 0, 0.1607843, 1,
1.939063, 1.134159, 0.7956764, 1, 0, 0.1568628, 1,
1.945137, -0.9856922, 0.1404175, 1, 0, 0.1490196, 1,
1.97023, 1.354422, -0.3364052, 1, 0, 0.145098, 1,
2.000135, 1.989371, -0.6599602, 1, 0, 0.1372549, 1,
2.028423, 0.8989116, 0.5744473, 1, 0, 0.1333333, 1,
2.05253, -0.6612429, 2.620118, 1, 0, 0.1254902, 1,
2.073815, 0.2403589, 0.7378227, 1, 0, 0.1215686, 1,
2.098094, 0.534166, 3.637063, 1, 0, 0.1137255, 1,
2.099415, -1.15111, 1.983642, 1, 0, 0.1098039, 1,
2.177537, 1.134054, 0.1670787, 1, 0, 0.1019608, 1,
2.18371, 1.312634, 2.059095, 1, 0, 0.09411765, 1,
2.204972, -0.4424047, 0.05842695, 1, 0, 0.09019608, 1,
2.20662, 1.076282, 1.380189, 1, 0, 0.08235294, 1,
2.286941, 1.286826, -0.9273607, 1, 0, 0.07843138, 1,
2.298845, 0.8187079, 1.868746, 1, 0, 0.07058824, 1,
2.332771, -0.1330132, 0.5572456, 1, 0, 0.06666667, 1,
2.524172, 1.610339, -0.7901306, 1, 0, 0.05882353, 1,
2.556689, 0.01719826, 1.706776, 1, 0, 0.05490196, 1,
2.648117, 0.197648, 2.112425, 1, 0, 0.04705882, 1,
2.77719, -1.171969, 2.129471, 1, 0, 0.04313726, 1,
2.871934, -1.315749, 1.275445, 1, 0, 0.03529412, 1,
2.896333, -0.1943589, 1.698421, 1, 0, 0.03137255, 1,
2.921473, 0.3529879, 1.436448, 1, 0, 0.02352941, 1,
3.290475, 0.2869642, 1.443462, 1, 0, 0.01960784, 1,
3.407184, 1.402982, 1.033146, 1, 0, 0.01176471, 1,
3.608442, 0.5561169, 2.709198, 1, 0, 0.007843138, 1
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
0.5088085, -4.543503, -8.043324, 0, -0.5, 0.5, 0.5,
0.5088085, -4.543503, -8.043324, 1, -0.5, 0.5, 0.5,
0.5088085, -4.543503, -8.043324, 1, 1.5, 0.5, 0.5,
0.5088085, -4.543503, -8.043324, 0, 1.5, 0.5, 0.5
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
-3.641601, -0.4808567, -8.043324, 0, -0.5, 0.5, 0.5,
-3.641601, -0.4808567, -8.043324, 1, -0.5, 0.5, 0.5,
-3.641601, -0.4808567, -8.043324, 1, 1.5, 0.5, 0.5,
-3.641601, -0.4808567, -8.043324, 0, 1.5, 0.5, 0.5
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
-3.641601, -4.543503, 0.3623815, 0, -0.5, 0.5, 0.5,
-3.641601, -4.543503, 0.3623815, 1, -0.5, 0.5, 0.5,
-3.641601, -4.543503, 0.3623815, 1, 1.5, 0.5, 0.5,
-3.641601, -4.543503, 0.3623815, 0, 1.5, 0.5, 0.5
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
-2, -3.605969, -6.103545,
3, -3.605969, -6.103545,
-2, -3.605969, -6.103545,
-2, -3.762225, -6.426842,
-1, -3.605969, -6.103545,
-1, -3.762225, -6.426842,
0, -3.605969, -6.103545,
0, -3.762225, -6.426842,
1, -3.605969, -6.103545,
1, -3.762225, -6.426842,
2, -3.605969, -6.103545,
2, -3.762225, -6.426842,
3, -3.605969, -6.103545,
3, -3.762225, -6.426842
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
-2, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
-2, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
-2, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
-2, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5,
-1, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
-1, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
-1, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
-1, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5,
0, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
0, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
0, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
0, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5,
1, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
1, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
1, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
1, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5,
2, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
2, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
2, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
2, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5,
3, -4.074736, -7.073434, 0, -0.5, 0.5, 0.5,
3, -4.074736, -7.073434, 1, -0.5, 0.5, 0.5,
3, -4.074736, -7.073434, 1, 1.5, 0.5, 0.5,
3, -4.074736, -7.073434, 0, 1.5, 0.5, 0.5
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
-2.683814, -3, -6.103545,
-2.683814, 2, -6.103545,
-2.683814, -3, -6.103545,
-2.843445, -3, -6.426842,
-2.683814, -2, -6.103545,
-2.843445, -2, -6.426842,
-2.683814, -1, -6.103545,
-2.843445, -1, -6.426842,
-2.683814, 0, -6.103545,
-2.843445, 0, -6.426842,
-2.683814, 1, -6.103545,
-2.843445, 1, -6.426842,
-2.683814, 2, -6.103545,
-2.843445, 2, -6.426842
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
-3.162708, -3, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, -3, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, -3, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, -3, -7.073434, 0, 1.5, 0.5, 0.5,
-3.162708, -2, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, -2, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, -2, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, -2, -7.073434, 0, 1.5, 0.5, 0.5,
-3.162708, -1, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, -1, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, -1, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, -1, -7.073434, 0, 1.5, 0.5, 0.5,
-3.162708, 0, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, 0, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, 0, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, 0, -7.073434, 0, 1.5, 0.5, 0.5,
-3.162708, 1, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, 1, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, 1, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, 1, -7.073434, 0, 1.5, 0.5, 0.5,
-3.162708, 2, -7.073434, 0, -0.5, 0.5, 0.5,
-3.162708, 2, -7.073434, 1, -0.5, 0.5, 0.5,
-3.162708, 2, -7.073434, 1, 1.5, 0.5, 0.5,
-3.162708, 2, -7.073434, 0, 1.5, 0.5, 0.5
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
-2.683814, -3.605969, -4,
-2.683814, -3.605969, 6,
-2.683814, -3.605969, -4,
-2.843445, -3.762225, -4,
-2.683814, -3.605969, -2,
-2.843445, -3.762225, -2,
-2.683814, -3.605969, 0,
-2.843445, -3.762225, 0,
-2.683814, -3.605969, 2,
-2.843445, -3.762225, 2,
-2.683814, -3.605969, 4,
-2.843445, -3.762225, 4,
-2.683814, -3.605969, 6,
-2.843445, -3.762225, 6
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
-3.162708, -4.074736, -4, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, -4, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, -4, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, -4, 0, 1.5, 0.5, 0.5,
-3.162708, -4.074736, -2, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, -2, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, -2, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, -2, 0, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 0, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 0, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 0, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 0, 0, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 2, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 2, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 2, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 2, 0, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 4, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 4, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 4, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 4, 0, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 6, 0, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 6, 1, -0.5, 0.5, 0.5,
-3.162708, -4.074736, 6, 1, 1.5, 0.5, 0.5,
-3.162708, -4.074736, 6, 0, 1.5, 0.5, 0.5
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
-2.683814, -3.605969, -6.103545,
-2.683814, 2.644256, -6.103545,
-2.683814, -3.605969, 6.828308,
-2.683814, 2.644256, 6.828308,
-2.683814, -3.605969, -6.103545,
-2.683814, -3.605969, 6.828308,
-2.683814, 2.644256, -6.103545,
-2.683814, 2.644256, 6.828308,
-2.683814, -3.605969, -6.103545,
3.701431, -3.605969, -6.103545,
-2.683814, -3.605969, 6.828308,
3.701431, -3.605969, 6.828308,
-2.683814, 2.644256, -6.103545,
3.701431, 2.644256, -6.103545,
-2.683814, 2.644256, 6.828308,
3.701431, 2.644256, 6.828308,
3.701431, -3.605969, -6.103545,
3.701431, 2.644256, -6.103545,
3.701431, -3.605969, 6.828308,
3.701431, 2.644256, 6.828308,
3.701431, -3.605969, -6.103545,
3.701431, -3.605969, 6.828308,
3.701431, 2.644256, -6.103545,
3.701431, 2.644256, 6.828308
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
var radius = 8.393344;
var distance = 37.34294;
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
mvMatrix.translate( -0.5088085, 0.4808567, -0.3623815 );
mvMatrix.scale( 1.421253, 1.451955, 0.7017593 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.34294);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
dichloropropane_dich<-read.table("dichloropropane_dich.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dichloropropane_dich$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
```

```r
y<-dichloropropane_dich$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
```

```r
z<-dichloropropane_dich$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
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
-2.590825, 0.1764758, -2.416054, 0, 0, 1, 1, 1,
-2.440115, -0.04657032, -1.306551, 1, 0, 0, 1, 1,
-2.436513, -0.5716934, -3.446646, 1, 0, 0, 1, 1,
-2.35293, 1.884888, 0.5537292, 1, 0, 0, 1, 1,
-2.268694, -0.9253984, -1.227466, 1, 0, 0, 1, 1,
-2.245812, -1.412349, -1.708367, 1, 0, 0, 1, 1,
-2.169513, 0.006389352, -2.460179, 0, 0, 0, 1, 1,
-2.106701, 1.191082, 0.02156173, 0, 0, 0, 1, 1,
-2.0771, 1.04061, -0.797694, 0, 0, 0, 1, 1,
-2.073121, 0.4911963, -2.920214, 0, 0, 0, 1, 1,
-2.071532, -0.09894641, -2.012211, 0, 0, 0, 1, 1,
-2.057049, -0.8967618, -2.293429, 0, 0, 0, 1, 1,
-2.028953, -0.3743278, -1.067659, 0, 0, 0, 1, 1,
-1.986218, 0.9014718, 0.7770908, 1, 1, 1, 1, 1,
-1.963078, -0.223407, -3.190509, 1, 1, 1, 1, 1,
-1.959058, 1.168198, -1.102929, 1, 1, 1, 1, 1,
-1.944767, -1.072814, -0.6001284, 1, 1, 1, 1, 1,
-1.911831, 0.9685176, -0.07267044, 1, 1, 1, 1, 1,
-1.908778, -1.011052, -3.289914, 1, 1, 1, 1, 1,
-1.862321, -0.1961969, -2.25138, 1, 1, 1, 1, 1,
-1.85131, -0.7309184, -2.940143, 1, 1, 1, 1, 1,
-1.84964, 1.525655, 0.2484896, 1, 1, 1, 1, 1,
-1.813976, -0.1320352, -1.496076, 1, 1, 1, 1, 1,
-1.811751, 1.02298, -3.666495, 1, 1, 1, 1, 1,
-1.801408, -1.090127, -3.373109, 1, 1, 1, 1, 1,
-1.792434, -0.9595579, -2.271388, 1, 1, 1, 1, 1,
-1.733508, -0.2097401, -1.440234, 1, 1, 1, 1, 1,
-1.732686, 0.6898952, -0.673524, 1, 1, 1, 1, 1,
-1.730498, -0.1313509, -2.498882, 0, 0, 1, 1, 1,
-1.729824, -1.750443, -1.956275, 1, 0, 0, 1, 1,
-1.726929, -0.9142245, -2.256749, 1, 0, 0, 1, 1,
-1.702177, 0.8160601, 0.004677473, 1, 0, 0, 1, 1,
-1.700479, -0.6067267, -3.476149, 1, 0, 0, 1, 1,
-1.676387, -0.1964464, -2.341393, 1, 0, 0, 1, 1,
-1.675144, 0.876773, 0.6635737, 0, 0, 0, 1, 1,
-1.67028, -0.8983388, -2.770079, 0, 0, 0, 1, 1,
-1.666742, 1.220951, -1.706118, 0, 0, 0, 1, 1,
-1.633798, 0.3624465, -1.849311, 0, 0, 0, 1, 1,
-1.629456, -0.1976945, -2.700449, 0, 0, 0, 1, 1,
-1.626863, -0.8676448, -0.8479266, 0, 0, 0, 1, 1,
-1.615799, 0.6402563, -0.8564795, 0, 0, 0, 1, 1,
-1.603859, -0.5440065, -4.167265, 1, 1, 1, 1, 1,
-1.594153, 0.1804529, -1.15207, 1, 1, 1, 1, 1,
-1.590124, -0.0005199757, -1.098451, 1, 1, 1, 1, 1,
-1.574451, 0.2775236, -1.920421, 1, 1, 1, 1, 1,
-1.571353, 0.6374326, -0.9112966, 1, 1, 1, 1, 1,
-1.54772, 0.2956892, -2.895727, 1, 1, 1, 1, 1,
-1.538585, -0.7685345, -1.744914, 1, 1, 1, 1, 1,
-1.538535, -0.1482104, -0.5050779, 1, 1, 1, 1, 1,
-1.529354, -1.940505, -3.02118, 1, 1, 1, 1, 1,
-1.517658, 0.8390414, -2.701298, 1, 1, 1, 1, 1,
-1.516314, -1.586878, -1.63205, 1, 1, 1, 1, 1,
-1.515177, 0.00901712, -1.800516, 1, 1, 1, 1, 1,
-1.504485, 0.6536301, 0.5325345, 1, 1, 1, 1, 1,
-1.500589, 1.723052, -0.9222211, 1, 1, 1, 1, 1,
-1.495054, 0.2621043, -1.038032, 1, 1, 1, 1, 1,
-1.488921, -1.648547, -2.50318, 0, 0, 1, 1, 1,
-1.481501, -1.310601, -2.396008, 1, 0, 0, 1, 1,
-1.47986, -0.06989613, 0.3635231, 1, 0, 0, 1, 1,
-1.46554, 1.6329, -0.8400895, 1, 0, 0, 1, 1,
-1.463055, 0.9683619, 0.1029365, 1, 0, 0, 1, 1,
-1.46264, 0.2945239, -1.959506, 1, 0, 0, 1, 1,
-1.462371, 0.9899378, -2.579248, 0, 0, 0, 1, 1,
-1.460791, 1.01164, -1.317601, 0, 0, 0, 1, 1,
-1.456744, -0.2354109, -3.666398, 0, 0, 0, 1, 1,
-1.437785, -0.05866995, -1.11439, 0, 0, 0, 1, 1,
-1.434095, 0.590828, -1.712223, 0, 0, 0, 1, 1,
-1.43017, -0.2150986, -1.727408, 0, 0, 0, 1, 1,
-1.429803, -1.133475, -1.779538, 0, 0, 0, 1, 1,
-1.424002, -0.03810795, -1.193398, 1, 1, 1, 1, 1,
-1.395429, 0.5972259, -2.266884, 1, 1, 1, 1, 1,
-1.393654, -1.173194, -3.884223, 1, 1, 1, 1, 1,
-1.392366, 1.679422, 0.3928574, 1, 1, 1, 1, 1,
-1.38625, -0.1865571, -3.687754, 1, 1, 1, 1, 1,
-1.381559, 0.7188419, -1.025715, 1, 1, 1, 1, 1,
-1.374994, 0.2394767, -2.285729, 1, 1, 1, 1, 1,
-1.361027, -0.2657152, -0.9447248, 1, 1, 1, 1, 1,
-1.358189, 0.2445295, -1.331749, 1, 1, 1, 1, 1,
-1.348352, 0.5270144, -2.083974, 1, 1, 1, 1, 1,
-1.339992, -1.961187, -3.572817, 1, 1, 1, 1, 1,
-1.335514, -2.205267, -2.904933, 1, 1, 1, 1, 1,
-1.33235, 1.883916, -0.7837244, 1, 1, 1, 1, 1,
-1.331533, -0.4303338, -0.784478, 1, 1, 1, 1, 1,
-1.330648, 0.6619446, -0.6640313, 1, 1, 1, 1, 1,
-1.327777, -0.4146385, -2.547047, 0, 0, 1, 1, 1,
-1.322019, 1.834238, -1.448179, 1, 0, 0, 1, 1,
-1.304583, -0.9982706, -2.5581, 1, 0, 0, 1, 1,
-1.293198, 0.01562398, -1.363676, 1, 0, 0, 1, 1,
-1.28996, -1.136082, -0.471076, 1, 0, 0, 1, 1,
-1.285982, 2.083931, 0.6100764, 1, 0, 0, 1, 1,
-1.280167, 1.980315, -0.8164109, 0, 0, 0, 1, 1,
-1.272945, -1.158343, -4.26586, 0, 0, 0, 1, 1,
-1.272607, 1.334779, -0.7813211, 0, 0, 0, 1, 1,
-1.264943, -1.112683, -2.234493, 0, 0, 0, 1, 1,
-1.262099, 1.331584, -0.5723839, 0, 0, 0, 1, 1,
-1.255984, 0.1984563, -0.5975491, 0, 0, 0, 1, 1,
-1.255199, -0.2646719, -2.243326, 0, 0, 0, 1, 1,
-1.254958, -0.1718176, -2.753067, 1, 1, 1, 1, 1,
-1.2506, 0.401877, -2.466042, 1, 1, 1, 1, 1,
-1.248656, 1.193942, -1.26451, 1, 1, 1, 1, 1,
-1.242353, 0.2555167, -1.450899, 1, 1, 1, 1, 1,
-1.236403, 0.5605739, -1.354323, 1, 1, 1, 1, 1,
-1.235552, -0.530347, -1.640427, 1, 1, 1, 1, 1,
-1.234182, 1.148757, -1.908488, 1, 1, 1, 1, 1,
-1.224186, 1.481105, -1.194979, 1, 1, 1, 1, 1,
-1.222122, -0.3577383, -2.999509, 1, 1, 1, 1, 1,
-1.218057, -1.363445, -2.260216, 1, 1, 1, 1, 1,
-1.212463, 0.2257607, -2.623256, 1, 1, 1, 1, 1,
-1.21118, 0.9831685, -1.769907, 1, 1, 1, 1, 1,
-1.210195, -1.076968, -3.616554, 1, 1, 1, 1, 1,
-1.208704, -2.959875, -4.216397, 1, 1, 1, 1, 1,
-1.207162, -1.258845, -3.127362, 1, 1, 1, 1, 1,
-1.193631, 1.403864, -2.291929, 0, 0, 1, 1, 1,
-1.193085, -0.2734242, -0.9059274, 1, 0, 0, 1, 1,
-1.189828, 0.02704027, -2.171341, 1, 0, 0, 1, 1,
-1.185834, 1.14992, -1.288679, 1, 0, 0, 1, 1,
-1.182667, -1.168781, -3.21508, 1, 0, 0, 1, 1,
-1.181691, 1.368838, -1.073644, 1, 0, 0, 1, 1,
-1.172649, -0.3164238, -0.6631336, 0, 0, 0, 1, 1,
-1.156829, 0.8684734, -1.083318, 0, 0, 0, 1, 1,
-1.152712, -0.2390241, -3.041336, 0, 0, 0, 1, 1,
-1.14213, 0.5461823, -2.39996, 0, 0, 0, 1, 1,
-1.137709, 0.2954224, -0.1875568, 0, 0, 0, 1, 1,
-1.131777, -0.8203137, -0.859701, 0, 0, 0, 1, 1,
-1.130949, 0.7729928, -2.325461, 0, 0, 0, 1, 1,
-1.125432, -1.857076, -2.062047, 1, 1, 1, 1, 1,
-1.12216, 0.2735074, -0.6315739, 1, 1, 1, 1, 1,
-1.117997, -0.7198325, -1.83739, 1, 1, 1, 1, 1,
-1.117742, 0.8025121, -2.297793, 1, 1, 1, 1, 1,
-1.107608, 0.5745147, -1.575321, 1, 1, 1, 1, 1,
-1.105795, 0.7916827, -1.005631, 1, 1, 1, 1, 1,
-1.097013, -0.3777123, -1.477425, 1, 1, 1, 1, 1,
-1.093579, -0.5324599, -1.654104, 1, 1, 1, 1, 1,
-1.086679, -1.295237, -5.915217, 1, 1, 1, 1, 1,
-1.076191, 1.129408, -1.34382, 1, 1, 1, 1, 1,
-1.075182, -1.370007, -3.851096, 1, 1, 1, 1, 1,
-1.063798, -0.2572351, -3.532573, 1, 1, 1, 1, 1,
-1.061955, 0.1967754, -1.519535, 1, 1, 1, 1, 1,
-1.061026, 1.335739, -2.294068, 1, 1, 1, 1, 1,
-1.059188, 1.74803, 1.41386, 1, 1, 1, 1, 1,
-1.058716, 2.014795, -0.2642824, 0, 0, 1, 1, 1,
-1.057154, 0.6439858, -0.8622565, 1, 0, 0, 1, 1,
-1.049674, 0.747368, -0.2587824, 1, 0, 0, 1, 1,
-1.041409, 0.1735537, -0.9298075, 1, 0, 0, 1, 1,
-1.032693, -0.2645203, -2.103952, 1, 0, 0, 1, 1,
-1.021926, 0.4851363, -1.866208, 1, 0, 0, 1, 1,
-1.012095, -1.684344, -2.536536, 0, 0, 0, 1, 1,
-1.009869, -0.3731177, -0.7330413, 0, 0, 0, 1, 1,
-0.9953656, 0.7590778, -0.9704801, 0, 0, 0, 1, 1,
-0.9938323, 1.216509, -0.2635, 0, 0, 0, 1, 1,
-0.9890925, 0.2088852, -0.8055629, 0, 0, 0, 1, 1,
-0.980474, -1.562521, -3.156456, 0, 0, 0, 1, 1,
-0.9717009, -0.785045, -2.974216, 0, 0, 0, 1, 1,
-0.9659424, -0.7186587, -0.7286336, 1, 1, 1, 1, 1,
-0.9656386, 0.2577911, -0.8099842, 1, 1, 1, 1, 1,
-0.963223, 0.4204772, -2.183375, 1, 1, 1, 1, 1,
-0.9598409, -2.715728, -2.000062, 1, 1, 1, 1, 1,
-0.9578362, 0.07670701, -0.07799529, 1, 1, 1, 1, 1,
-0.9575154, -0.8060663, -2.076108, 1, 1, 1, 1, 1,
-0.950529, 0.5659314, -0.3045329, 1, 1, 1, 1, 1,
-0.9486973, 1.242059, -0.9169372, 1, 1, 1, 1, 1,
-0.9477719, -0.924836, -1.789237, 1, 1, 1, 1, 1,
-0.9384032, -1.297749, -1.996689, 1, 1, 1, 1, 1,
-0.9288176, -0.9260057, -1.824139, 1, 1, 1, 1, 1,
-0.9287351, -2.61015, -2.710559, 1, 1, 1, 1, 1,
-0.9255626, 0.1476952, -0.3266435, 1, 1, 1, 1, 1,
-0.9186513, -0.35626, -2.278932, 1, 1, 1, 1, 1,
-0.9186036, -0.109037, -2.515185, 1, 1, 1, 1, 1,
-0.9163539, 0.2720183, -1.955444, 0, 0, 1, 1, 1,
-0.9162718, 0.6941951, -1.229277, 1, 0, 0, 1, 1,
-0.9147978, 0.6744439, -1.407847, 1, 0, 0, 1, 1,
-0.9106901, -1.245707, -2.53897, 1, 0, 0, 1, 1,
-0.9093339, 0.02796569, -2.445014, 1, 0, 0, 1, 1,
-0.9055791, -0.7046448, -1.686939, 1, 0, 0, 1, 1,
-0.9044217, -0.1185897, -1.262304, 0, 0, 0, 1, 1,
-0.9043848, 0.134576, -1.181164, 0, 0, 0, 1, 1,
-0.9043838, 0.6893528, -1.120036, 0, 0, 0, 1, 1,
-0.9022129, -1.208051, -3.242768, 0, 0, 0, 1, 1,
-0.9019084, -0.7346782, -2.646181, 0, 0, 0, 1, 1,
-0.899924, -0.233917, -2.170998, 0, 0, 0, 1, 1,
-0.888231, -0.4141965, -0.7681927, 0, 0, 0, 1, 1,
-0.8871627, -0.2920339, -1.989739, 1, 1, 1, 1, 1,
-0.8819666, -1.113029, -2.765503, 1, 1, 1, 1, 1,
-0.880365, 0.8640065, -3.317417, 1, 1, 1, 1, 1,
-0.8789718, 2.04772, 0.4381147, 1, 1, 1, 1, 1,
-0.8757405, -0.1803602, -1.491127, 1, 1, 1, 1, 1,
-0.8744465, 0.6263596, -1.045815, 1, 1, 1, 1, 1,
-0.8731827, 0.6030139, -0.3786139, 1, 1, 1, 1, 1,
-0.8701834, -0.2527512, -2.095658, 1, 1, 1, 1, 1,
-0.8582563, -0.9709231, -0.7108542, 1, 1, 1, 1, 1,
-0.8572692, 0.01678765, -1.833117, 1, 1, 1, 1, 1,
-0.852127, 0.3390801, 1.353459, 1, 1, 1, 1, 1,
-0.8515435, 0.9721096, -0.9825061, 1, 1, 1, 1, 1,
-0.8490103, 0.04087125, -2.021642, 1, 1, 1, 1, 1,
-0.8473624, 1.461892, 0.4200888, 1, 1, 1, 1, 1,
-0.8461801, 1.50121, -0.4384572, 1, 1, 1, 1, 1,
-0.8409786, 0.8543965, -0.3919773, 0, 0, 1, 1, 1,
-0.8400185, -0.5268373, -1.529079, 1, 0, 0, 1, 1,
-0.8306152, -0.00180004, -0.5994326, 1, 0, 0, 1, 1,
-0.8292453, 2.039358, -0.007405603, 1, 0, 0, 1, 1,
-0.8287719, -2.271377, -3.139177, 1, 0, 0, 1, 1,
-0.8281404, 1.636686, -0.6231793, 1, 0, 0, 1, 1,
-0.8230746, -0.3717437, -1.232245, 0, 0, 0, 1, 1,
-0.8090124, 0.2038134, -2.665112, 0, 0, 0, 1, 1,
-0.8087673, -0.1260552, -0.5432305, 0, 0, 0, 1, 1,
-0.8081208, -0.04456546, -1.530063, 0, 0, 0, 1, 1,
-0.8060179, 1.93186, -1.121411, 0, 0, 0, 1, 1,
-0.8047611, 1.42581, -0.6824819, 0, 0, 0, 1, 1,
-0.8002071, 0.07272033, -0.8539057, 0, 0, 0, 1, 1,
-0.7990772, -0.3219902, -2.863344, 1, 1, 1, 1, 1,
-0.7977072, 0.8087409, 0.2178802, 1, 1, 1, 1, 1,
-0.7914342, 2.553233, 1.658036, 1, 1, 1, 1, 1,
-0.7826132, 1.03573, -0.1218163, 1, 1, 1, 1, 1,
-0.7817035, 0.8001792, -0.05310776, 1, 1, 1, 1, 1,
-0.7810726, -0.04360747, -2.816251, 1, 1, 1, 1, 1,
-0.7759464, 0.003923308, -0.09997588, 1, 1, 1, 1, 1,
-0.7746841, -0.09937162, -1.262064, 1, 1, 1, 1, 1,
-0.773653, -0.06933251, -1.732485, 1, 1, 1, 1, 1,
-0.7699774, -1.316247, -1.144438, 1, 1, 1, 1, 1,
-0.7687341, -0.3871761, -1.226448, 1, 1, 1, 1, 1,
-0.7644496, 1.297719, 0.3063553, 1, 1, 1, 1, 1,
-0.7562486, -3.002223, -4.399014, 1, 1, 1, 1, 1,
-0.7501834, -0.03060332, -1.639678, 1, 1, 1, 1, 1,
-0.7494805, 0.446353, -0.4272449, 1, 1, 1, 1, 1,
-0.7485625, 0.7527632, -0.3933341, 0, 0, 1, 1, 1,
-0.7461599, -0.9841124, -3.220895, 1, 0, 0, 1, 1,
-0.7411358, 0.6591949, -0.01401829, 1, 0, 0, 1, 1,
-0.7391124, -1.39297, -1.550149, 1, 0, 0, 1, 1,
-0.735978, -0.1072907, -3.30291, 1, 0, 0, 1, 1,
-0.733892, 1.057001, 0.494896, 1, 0, 0, 1, 1,
-0.7315571, 0.5496045, -1.403197, 0, 0, 0, 1, 1,
-0.7312496, 0.3172008, -1.705678, 0, 0, 0, 1, 1,
-0.7283927, 0.6977437, -1.506059, 0, 0, 0, 1, 1,
-0.7279766, -1.771428, -4.0696, 0, 0, 0, 1, 1,
-0.7278701, 1.799331, -0.8954453, 0, 0, 0, 1, 1,
-0.725693, -1.466656, -2.943305, 0, 0, 0, 1, 1,
-0.7217286, 1.515082, -1.447198, 0, 0, 0, 1, 1,
-0.7211197, -0.8601053, -0.06713659, 1, 1, 1, 1, 1,
-0.7099625, 0.7036214, 0.09554352, 1, 1, 1, 1, 1,
-0.7077903, -0.7887492, -3.344685, 1, 1, 1, 1, 1,
-0.704466, 0.6566513, 0.8808912, 1, 1, 1, 1, 1,
-0.7028346, 0.2588595, -1.163433, 1, 1, 1, 1, 1,
-0.7007805, -0.1674199, -0.8385139, 1, 1, 1, 1, 1,
-0.6967867, 0.2822864, -2.114533, 1, 1, 1, 1, 1,
-0.6899995, -0.2190487, -1.92398, 1, 1, 1, 1, 1,
-0.6860645, 1.94073, -1.323369, 1, 1, 1, 1, 1,
-0.6825753, 1.397552, -0.7843838, 1, 1, 1, 1, 1,
-0.6783431, -0.872962, -4.050528, 1, 1, 1, 1, 1,
-0.667087, 1.65735, -0.7132, 1, 1, 1, 1, 1,
-0.6633473, -0.5881082, -3.578869, 1, 1, 1, 1, 1,
-0.6612942, -1.238751, -2.584327, 1, 1, 1, 1, 1,
-0.6554083, -1.092901, -1.761713, 1, 1, 1, 1, 1,
-0.6547338, 0.4614265, 1.625287, 0, 0, 1, 1, 1,
-0.6474668, 0.8813465, -0.5167285, 1, 0, 0, 1, 1,
-0.6468275, 0.5776473, 0.5824288, 1, 0, 0, 1, 1,
-0.6460377, -0.4430493, -1.900373, 1, 0, 0, 1, 1,
-0.6442365, -0.5431657, -0.8791834, 1, 0, 0, 1, 1,
-0.6434205, -0.341885, -2.518243, 1, 0, 0, 1, 1,
-0.6322392, -0.3317412, -3.533652, 0, 0, 0, 1, 1,
-0.6306723, -1.359334, -1.995948, 0, 0, 0, 1, 1,
-0.6296456, 0.1761316, -1.230312, 0, 0, 0, 1, 1,
-0.6287561, -0.1116883, -2.247613, 0, 0, 0, 1, 1,
-0.6256084, 0.8387381, -0.7297725, 0, 0, 0, 1, 1,
-0.6227192, 1.330833, -1.937744, 0, 0, 0, 1, 1,
-0.6224958, 1.179675, -1.565207, 0, 0, 0, 1, 1,
-0.621365, -0.1152297, -2.16881, 1, 1, 1, 1, 1,
-0.6142097, -0.2021081, -2.528926, 1, 1, 1, 1, 1,
-0.6135325, 0.08617362, -2.752677, 1, 1, 1, 1, 1,
-0.6066363, 1.72176, -1.146835, 1, 1, 1, 1, 1,
-0.5966849, 1.951259, -1.198282, 1, 1, 1, 1, 1,
-0.5914202, 1.419772, -0.1452148, 1, 1, 1, 1, 1,
-0.5903131, -1.499691, -2.816734, 1, 1, 1, 1, 1,
-0.5881569, 0.1929309, -1.503076, 1, 1, 1, 1, 1,
-0.5850639, 1.862282, -1.137967, 1, 1, 1, 1, 1,
-0.5847857, -0.5203927, -2.702313, 1, 1, 1, 1, 1,
-0.5829883, -1.162446, -2.92852, 1, 1, 1, 1, 1,
-0.580857, 0.2549401, -1.891184, 1, 1, 1, 1, 1,
-0.5802755, 0.4122032, -1.226411, 1, 1, 1, 1, 1,
-0.5789798, -1.15067, -2.702283, 1, 1, 1, 1, 1,
-0.5763153, 0.3047428, -1.651507, 1, 1, 1, 1, 1,
-0.5759921, 0.5707816, -1.116829, 0, 0, 1, 1, 1,
-0.5678784, 1.579499, -0.1828019, 1, 0, 0, 1, 1,
-0.5674778, -2.007652, -2.288037, 1, 0, 0, 1, 1,
-0.5645378, -0.3578882, -2.115835, 1, 0, 0, 1, 1,
-0.5600797, 0.4431216, -1.057873, 1, 0, 0, 1, 1,
-0.5599898, 0.0007904699, -2.045129, 1, 0, 0, 1, 1,
-0.5595332, 0.5004983, -1.182194, 0, 0, 0, 1, 1,
-0.5529466, 0.1720002, -2.001855, 0, 0, 0, 1, 1,
-0.5505514, 1.31283, 0.5530524, 0, 0, 0, 1, 1,
-0.550473, -1.373476, -2.117317, 0, 0, 0, 1, 1,
-0.5487313, 1.269086, -0.5889387, 0, 0, 0, 1, 1,
-0.5415702, -0.2237203, -2.300091, 0, 0, 0, 1, 1,
-0.5407596, -1.089603, -0.6348386, 0, 0, 0, 1, 1,
-0.5404623, 0.3903989, -0.562251, 1, 1, 1, 1, 1,
-0.5375918, 1.766627, -0.6216591, 1, 1, 1, 1, 1,
-0.5373933, 0.3843058, -2.515752, 1, 1, 1, 1, 1,
-0.5357672, -0.4190439, -1.210397, 1, 1, 1, 1, 1,
-0.5345446, -0.1922842, -0.06292388, 1, 1, 1, 1, 1,
-0.5319122, -0.747408, -1.813965, 1, 1, 1, 1, 1,
-0.5309656, -0.6908832, -2.240103, 1, 1, 1, 1, 1,
-0.530021, -0.5174576, -2.8728, 1, 1, 1, 1, 1,
-0.5272456, -0.7112837, -1.006158, 1, 1, 1, 1, 1,
-0.525955, -0.2209919, -2.847299, 1, 1, 1, 1, 1,
-0.5232179, 0.04875396, -1.197722, 1, 1, 1, 1, 1,
-0.5227121, 0.576886, 1.220785, 1, 1, 1, 1, 1,
-0.519788, -0.815334, -2.067764, 1, 1, 1, 1, 1,
-0.5196378, -1.560284, -3.220202, 1, 1, 1, 1, 1,
-0.5170125, -0.8886996, -2.238949, 1, 1, 1, 1, 1,
-0.5131068, -2.503398, -3.808955, 0, 0, 1, 1, 1,
-0.5040407, -0.150551, -0.9554465, 1, 0, 0, 1, 1,
-0.5019493, -0.545135, -2.895505, 1, 0, 0, 1, 1,
-0.4990142, -0.6547872, -3.265975, 1, 0, 0, 1, 1,
-0.4983011, -1.328455, -3.806639, 1, 0, 0, 1, 1,
-0.4970427, -0.4274844, -2.635923, 1, 0, 0, 1, 1,
-0.4920886, 0.1035496, -1.438936, 0, 0, 0, 1, 1,
-0.4892944, 1.219276, 2.271294, 0, 0, 0, 1, 1,
-0.4890442, -0.05374023, -1.790039, 0, 0, 0, 1, 1,
-0.4865828, 0.7678092, -1.392544, 0, 0, 0, 1, 1,
-0.4862702, 0.7990123, 0.3927667, 0, 0, 0, 1, 1,
-0.4832825, -0.5483853, -2.732035, 0, 0, 0, 1, 1,
-0.4811448, 0.1039413, 0.3006337, 0, 0, 0, 1, 1,
-0.4729297, -1.697808, -4.425055, 1, 1, 1, 1, 1,
-0.4721578, -1.088184, -4.508543, 1, 1, 1, 1, 1,
-0.4673908, -1.262579, -2.665044, 1, 1, 1, 1, 1,
-0.4662083, -0.9020349, -1.712891, 1, 1, 1, 1, 1,
-0.4627046, -1.564821, -2.257894, 1, 1, 1, 1, 1,
-0.4611121, 1.654906, -0.225724, 1, 1, 1, 1, 1,
-0.459846, -0.7252952, -3.755272, 1, 1, 1, 1, 1,
-0.4546636, 0.2962293, 1.341184, 1, 1, 1, 1, 1,
-0.4530587, 0.05097228, -2.053825, 1, 1, 1, 1, 1,
-0.4525757, -1.926433, -3.005352, 1, 1, 1, 1, 1,
-0.4487337, -0.7249966, -2.904811, 1, 1, 1, 1, 1,
-0.4475042, -0.4862632, -1.354675, 1, 1, 1, 1, 1,
-0.4465873, -1.974328, -3.619561, 1, 1, 1, 1, 1,
-0.4419501, 0.5958791, -0.3733593, 1, 1, 1, 1, 1,
-0.4419014, 1.612278, 1.847212, 1, 1, 1, 1, 1,
-0.4394372, 1.217021, 1.295905, 0, 0, 1, 1, 1,
-0.4368175, 0.1761342, -1.228498, 1, 0, 0, 1, 1,
-0.4362129, -0.9872689, -2.246093, 1, 0, 0, 1, 1,
-0.4314373, -2.539172, -2.211618, 1, 0, 0, 1, 1,
-0.4284612, -2.045442, -4.330047, 1, 0, 0, 1, 1,
-0.4262916, 0.2786289, -1.561915, 1, 0, 0, 1, 1,
-0.4232236, 0.7088885, -0.009878719, 0, 0, 0, 1, 1,
-0.4221738, 1.079736, 0.3001558, 0, 0, 0, 1, 1,
-0.4219188, -0.1500618, -0.02515314, 0, 0, 0, 1, 1,
-0.4214186, -0.6891266, -2.214387, 0, 0, 0, 1, 1,
-0.4209784, 0.681976, 0.725338, 0, 0, 0, 1, 1,
-0.4181395, -2.17141, -2.188783, 0, 0, 0, 1, 1,
-0.4153478, -0.2527595, -3.564196, 0, 0, 0, 1, 1,
-0.4144347, -0.9354074, -0.872256, 1, 1, 1, 1, 1,
-0.4143182, -0.6234972, -3.337878, 1, 1, 1, 1, 1,
-0.4141345, 1.678303, -1.429213, 1, 1, 1, 1, 1,
-0.4064615, -0.7895194, -4.074372, 1, 1, 1, 1, 1,
-0.4039737, -0.332036, -1.879798, 1, 1, 1, 1, 1,
-0.4032357, -0.7539931, -3.25027, 1, 1, 1, 1, 1,
-0.3990475, 0.08265495, -1.272467, 1, 1, 1, 1, 1,
-0.3980683, -0.6699088, -1.847692, 1, 1, 1, 1, 1,
-0.397514, 1.602924, -1.452524, 1, 1, 1, 1, 1,
-0.3973992, 0.9673356, 0.7252543, 1, 1, 1, 1, 1,
-0.3944383, -1.310908, -3.170521, 1, 1, 1, 1, 1,
-0.3943058, -0.30746, -2.811242, 1, 1, 1, 1, 1,
-0.3912154, -0.2574646, -2.214476, 1, 1, 1, 1, 1,
-0.3884585, -0.6737121, -3.050402, 1, 1, 1, 1, 1,
-0.3859064, 0.5987678, -0.9466957, 1, 1, 1, 1, 1,
-0.3848126, 0.7005348, -0.523221, 0, 0, 1, 1, 1,
-0.3808609, -0.3957154, -2.593871, 1, 0, 0, 1, 1,
-0.379721, 1.817414, -0.8456901, 1, 0, 0, 1, 1,
-0.3745609, -0.5640782, -4.473505, 1, 0, 0, 1, 1,
-0.370872, 1.901299, 0.489254, 1, 0, 0, 1, 1,
-0.3680818, 0.3720798, 0.79125, 1, 0, 0, 1, 1,
-0.3611522, 0.1353454, 0.1959913, 0, 0, 0, 1, 1,
-0.3596387, 1.051872, -1.732325, 0, 0, 0, 1, 1,
-0.3587942, -0.3718992, -2.6946, 0, 0, 0, 1, 1,
-0.3549701, 0.7625855, 1.268712, 0, 0, 0, 1, 1,
-0.3548801, -0.3757415, -2.869504, 0, 0, 0, 1, 1,
-0.354517, 0.04979432, -0.2590825, 0, 0, 0, 1, 1,
-0.3518653, 0.564118, -1.27835, 0, 0, 0, 1, 1,
-0.3494337, -3.029704, -1.046057, 1, 1, 1, 1, 1,
-0.3486269, -0.2012542, -3.896561, 1, 1, 1, 1, 1,
-0.3472143, -1.943688, -3.796344, 1, 1, 1, 1, 1,
-0.3420008, 0.1341205, -0.9741439, 1, 1, 1, 1, 1,
-0.3372132, 0.9126588, 0.1486559, 1, 1, 1, 1, 1,
-0.3336264, -2.007001, -3.374094, 1, 1, 1, 1, 1,
-0.3307752, 0.03135541, -2.421697, 1, 1, 1, 1, 1,
-0.3147823, 0.5411019, -1.014818, 1, 1, 1, 1, 1,
-0.310552, -0.5071802, -2.34316, 1, 1, 1, 1, 1,
-0.3105488, -1.362765, -3.877424, 1, 1, 1, 1, 1,
-0.3067684, 1.104288, -1.108277, 1, 1, 1, 1, 1,
-0.3065567, 2.003775, 0.08110397, 1, 1, 1, 1, 1,
-0.3049019, -0.2345497, -2.704008, 1, 1, 1, 1, 1,
-0.3041503, -0.2288157, -2.78904, 1, 1, 1, 1, 1,
-0.3005951, 1.637882, -0.8691275, 1, 1, 1, 1, 1,
-0.2986961, -1.631432, -3.486012, 0, 0, 1, 1, 1,
-0.2980842, 0.002712569, -0.9736839, 1, 0, 0, 1, 1,
-0.296843, -0.08350506, -3.142337, 1, 0, 0, 1, 1,
-0.287453, 1.075498, -1.211852, 1, 0, 0, 1, 1,
-0.2842781, 1.216578, 0.873475, 1, 0, 0, 1, 1,
-0.2792201, -0.8060051, -2.679441, 1, 0, 0, 1, 1,
-0.272534, 0.6439683, 1.022486, 0, 0, 0, 1, 1,
-0.270606, -0.1654192, -0.6383569, 0, 0, 0, 1, 1,
-0.2671437, 0.4063703, -0.7287319, 0, 0, 0, 1, 1,
-0.266714, 1.27515, -1.286974, 0, 0, 0, 1, 1,
-0.2612171, 0.4545172, 0.5592475, 0, 0, 0, 1, 1,
-0.2596973, -0.4261724, -2.272007, 0, 0, 0, 1, 1,
-0.2596428, 0.6399195, 0.8809826, 0, 0, 0, 1, 1,
-0.2596229, 0.7083251, -0.1633074, 1, 1, 1, 1, 1,
-0.2593795, 1.165227, -0.6734783, 1, 1, 1, 1, 1,
-0.253824, 0.9528417, -0.6956667, 1, 1, 1, 1, 1,
-0.252613, 0.01227947, -0.9594752, 1, 1, 1, 1, 1,
-0.251691, -0.8047722, -3.570376, 1, 1, 1, 1, 1,
-0.250913, 0.4173595, 0.7520066, 1, 1, 1, 1, 1,
-0.2455618, 0.3812769, 0.2946623, 1, 1, 1, 1, 1,
-0.2448079, -2.539108, -2.801861, 1, 1, 1, 1, 1,
-0.2419108, 0.3710511, -1.655839, 1, 1, 1, 1, 1,
-0.2324563, -0.4284746, -2.808564, 1, 1, 1, 1, 1,
-0.2314134, -0.4047478, -3.415181, 1, 1, 1, 1, 1,
-0.2293826, -1.616945, -3.811377, 1, 1, 1, 1, 1,
-0.2267718, 0.2822784, 0.3013801, 1, 1, 1, 1, 1,
-0.2204111, 0.7558894, -0.1212264, 1, 1, 1, 1, 1,
-0.2203114, 0.8394375, 1.597716, 1, 1, 1, 1, 1,
-0.2197322, -0.04704564, -1.198024, 0, 0, 1, 1, 1,
-0.2123013, -2.307117, -3.332293, 1, 0, 0, 1, 1,
-0.2120631, -1.521672, -1.737646, 1, 0, 0, 1, 1,
-0.2115265, 0.3870903, -1.407797, 1, 0, 0, 1, 1,
-0.2085157, 1.154852, -1.113043, 1, 0, 0, 1, 1,
-0.2036369, 0.7907948, 0.8070425, 1, 0, 0, 1, 1,
-0.2017624, -0.6230288, -2.332392, 0, 0, 0, 1, 1,
-0.1998914, -0.9469406, -5.036094, 0, 0, 0, 1, 1,
-0.1993522, 0.4942191, -2.201428, 0, 0, 0, 1, 1,
-0.1931023, -0.06102078, -1.25525, 0, 0, 0, 1, 1,
-0.18792, -0.05138995, -1.042772, 0, 0, 0, 1, 1,
-0.1859772, -1.276407, -3.08076, 0, 0, 0, 1, 1,
-0.1847295, 0.03053871, -1.005897, 0, 0, 0, 1, 1,
-0.1798523, 0.1155127, -1.406469, 1, 1, 1, 1, 1,
-0.1728262, 0.4221977, -0.1784932, 1, 1, 1, 1, 1,
-0.1715339, 0.1734755, -1.832216, 1, 1, 1, 1, 1,
-0.1714886, 1.312152, 1.094279, 1, 1, 1, 1, 1,
-0.1699275, 1.272312, -0.539305, 1, 1, 1, 1, 1,
-0.1652119, -0.6880767, -3.690285, 1, 1, 1, 1, 1,
-0.1650527, -0.9494878, -4.153189, 1, 1, 1, 1, 1,
-0.1640481, -0.3801996, -2.664268, 1, 1, 1, 1, 1,
-0.1618903, -0.4940914, -4.185664, 1, 1, 1, 1, 1,
-0.1614637, 0.6230887, -0.8261817, 1, 1, 1, 1, 1,
-0.1604719, 0.9995028, 1.011244, 1, 1, 1, 1, 1,
-0.1593778, -0.3878075, -1.463927, 1, 1, 1, 1, 1,
-0.1584357, 1.841898, -1.246161, 1, 1, 1, 1, 1,
-0.1572865, -0.7344301, -1.999794, 1, 1, 1, 1, 1,
-0.1561389, -0.942544, -4.910867, 1, 1, 1, 1, 1,
-0.156096, 0.5548027, -0.1807795, 0, 0, 1, 1, 1,
-0.1541912, -0.2956313, -1.358512, 1, 0, 0, 1, 1,
-0.1523803, -0.7139325, -1.977105, 1, 0, 0, 1, 1,
-0.1519669, -0.4410179, -3.08947, 1, 0, 0, 1, 1,
-0.1494577, 0.9756457, -1.38372, 1, 0, 0, 1, 1,
-0.1466786, -0.5214263, -3.490157, 1, 0, 0, 1, 1,
-0.1458281, -1.51626, -0.9382294, 0, 0, 0, 1, 1,
-0.1438052, 0.634483, -0.5089432, 0, 0, 0, 1, 1,
-0.1429018, -0.1149649, -2.910626, 0, 0, 0, 1, 1,
-0.1380594, 1.192357, 0.8374708, 0, 0, 0, 1, 1,
-0.1375722, -0.9444586, -2.263355, 0, 0, 0, 1, 1,
-0.1351312, 2.03451, -0.9235489, 0, 0, 0, 1, 1,
-0.1324702, -0.205706, -4.055775, 0, 0, 0, 1, 1,
-0.1253473, 1.858716, -0.7850897, 1, 1, 1, 1, 1,
-0.1250461, -1.741483, -2.604947, 1, 1, 1, 1, 1,
-0.122004, 1.853752, -0.4395109, 1, 1, 1, 1, 1,
-0.1214901, -0.5987708, -3.630286, 1, 1, 1, 1, 1,
-0.1158125, 1.134295, -1.987236, 1, 1, 1, 1, 1,
-0.1150477, -0.07843141, -2.240034, 1, 1, 1, 1, 1,
-0.1146241, -0.6041354, -2.986497, 1, 1, 1, 1, 1,
-0.1145867, -0.9593382, -2.241164, 1, 1, 1, 1, 1,
-0.1117378, 0.9587728, 0.8737028, 1, 1, 1, 1, 1,
-0.1110643, -0.7848598, -3.680411, 1, 1, 1, 1, 1,
-0.1076724, 1.370792, 0.1725106, 1, 1, 1, 1, 1,
-0.1075392, 0.2001747, 0.7858256, 1, 1, 1, 1, 1,
-0.1066597, 1.862387, 1.480355, 1, 1, 1, 1, 1,
-0.09716662, 0.1993338, -0.2979668, 1, 1, 1, 1, 1,
-0.09600243, -0.8262171, -2.749881, 1, 1, 1, 1, 1,
-0.09540348, 0.5761009, -1.868489, 0, 0, 1, 1, 1,
-0.09505802, 0.477033, -1.308667, 1, 0, 0, 1, 1,
-0.09145382, 1.256395, 0.5374891, 1, 0, 0, 1, 1,
-0.08903955, -0.2092417, -3.179445, 1, 0, 0, 1, 1,
-0.08873564, 1.026106, -0.9360804, 1, 0, 0, 1, 1,
-0.08601587, -0.346001, -4.325085, 1, 0, 0, 1, 1,
-0.08570731, -0.290625, -3.524782, 0, 0, 0, 1, 1,
-0.08392354, 0.2065684, -0.3687644, 0, 0, 0, 1, 1,
-0.07667552, -1.526561, -3.303583, 0, 0, 0, 1, 1,
-0.07072417, 0.05196789, -2.390069, 0, 0, 0, 1, 1,
-0.06972968, -0.3997992, -0.2903394, 0, 0, 0, 1, 1,
-0.06854747, 0.7031875, 0.7748378, 0, 0, 0, 1, 1,
-0.06565265, 0.6209132, -1.656245, 0, 0, 0, 1, 1,
-0.0653122, -1.822954, -1.945766, 1, 1, 1, 1, 1,
-0.06250641, 0.9810457, 1.519173, 1, 1, 1, 1, 1,
-0.0624283, -0.4985979, -3.271971, 1, 1, 1, 1, 1,
-0.06096384, -0.7512779, -0.9794275, 1, 1, 1, 1, 1,
-0.0572146, 0.9884902, 0.1370576, 1, 1, 1, 1, 1,
-0.05554528, 0.2256643, -1.14647, 1, 1, 1, 1, 1,
-0.0542717, -1.055385, -2.044075, 1, 1, 1, 1, 1,
-0.04830648, -0.04113586, -3.673928, 1, 1, 1, 1, 1,
-0.04827558, 0.4360562, -0.07800828, 1, 1, 1, 1, 1,
-0.04374911, -1.018549, -3.452801, 1, 1, 1, 1, 1,
-0.04368894, -0.3900386, -3.426998, 1, 1, 1, 1, 1,
-0.04315462, 0.657154, 1.653417, 1, 1, 1, 1, 1,
-0.04161324, 1.722413, -1.293933, 1, 1, 1, 1, 1,
-0.04119319, -1.288961, -3.12113, 1, 1, 1, 1, 1,
-0.04094856, -0.4755028, -2.922779, 1, 1, 1, 1, 1,
-0.03950443, -0.1808439, -0.8680405, 0, 0, 1, 1, 1,
-0.03476855, 1.65431, -1.980458, 1, 0, 0, 1, 1,
-0.03148033, 0.09809251, 0.6412292, 1, 0, 0, 1, 1,
-0.03105868, 0.2498004, 0.5541168, 1, 0, 0, 1, 1,
-0.02096275, 0.4181067, 0.2873151, 1, 0, 0, 1, 1,
-0.02034354, -0.3800697, -4.80994, 1, 0, 0, 1, 1,
-0.01958574, -1.184704, -2.273667, 0, 0, 0, 1, 1,
-0.01871238, -0.4802362, -1.849966, 0, 0, 0, 1, 1,
-0.01389726, -1.448323, -3.49142, 0, 0, 0, 1, 1,
-0.01025681, -2.192446, -2.314934, 0, 0, 0, 1, 1,
-0.009732552, 0.1178817, -0.3445807, 0, 0, 0, 1, 1,
-0.009577064, -1.783063, -1.589448, 0, 0, 0, 1, 1,
-0.00895018, -0.6782594, -2.581304, 0, 0, 0, 1, 1,
-0.004206222, 1.579425, 0.008891297, 1, 1, 1, 1, 1,
-0.003558306, -1.148397, -4.278293, 1, 1, 1, 1, 1,
-0.001280449, 0.09358374, 0.4666874, 1, 1, 1, 1, 1,
0.001718543, -1.39002, 2.008851, 1, 1, 1, 1, 1,
0.002399432, 0.5491942, 1.201384, 1, 1, 1, 1, 1,
0.005594703, -1.609115, 4.733174, 1, 1, 1, 1, 1,
0.007109654, 0.9239273, 0.2203406, 1, 1, 1, 1, 1,
0.0100022, 1.681073, 0.2444618, 1, 1, 1, 1, 1,
0.01696373, 0.6170597, -2.151214, 1, 1, 1, 1, 1,
0.02208952, 0.06461992, 1.806438, 1, 1, 1, 1, 1,
0.03011291, -1.587884, 2.684996, 1, 1, 1, 1, 1,
0.03454199, -1.543775, 1.494701, 1, 1, 1, 1, 1,
0.03967803, -1.019279, 2.699992, 1, 1, 1, 1, 1,
0.04465334, -0.3858206, 2.309398, 1, 1, 1, 1, 1,
0.04682825, 1.116228, -0.7127035, 1, 1, 1, 1, 1,
0.04960892, -0.7482165, 1.117809, 0, 0, 1, 1, 1,
0.0587975, -0.1839548, 3.86425, 1, 0, 0, 1, 1,
0.05978002, -0.3763236, 6.63998, 1, 0, 0, 1, 1,
0.06537943, 1.223749, -0.3143417, 1, 0, 0, 1, 1,
0.06575162, 0.8393925, 0.5308111, 1, 0, 0, 1, 1,
0.06602084, 0.2962479, 0.639345, 1, 0, 0, 1, 1,
0.06768282, 1.005268, -0.624775, 0, 0, 0, 1, 1,
0.07048961, 1.034745, -0.5003272, 0, 0, 0, 1, 1,
0.07079741, -0.7625088, 1.253596, 0, 0, 0, 1, 1,
0.07141128, 1.792986, 1.04338, 0, 0, 0, 1, 1,
0.0726055, 0.5824823, 1.328688, 0, 0, 0, 1, 1,
0.08363935, 0.006784389, 1.488315, 0, 0, 0, 1, 1,
0.08577306, -0.06765077, 2.555855, 0, 0, 0, 1, 1,
0.08977321, 1.464305, 0.235449, 1, 1, 1, 1, 1,
0.09416825, -0.2592948, 1.577873, 1, 1, 1, 1, 1,
0.09421699, -0.3330843, 1.374963, 1, 1, 1, 1, 1,
0.09459431, -0.4048783, 2.044965, 1, 1, 1, 1, 1,
0.0991593, -0.6561158, 3.718945, 1, 1, 1, 1, 1,
0.1023599, 0.123081, 1.682641, 1, 1, 1, 1, 1,
0.1034092, 1.653696, -0.2015053, 1, 1, 1, 1, 1,
0.1046898, 0.2768038, 0.6469634, 1, 1, 1, 1, 1,
0.1064044, 0.5815696, 1.359051, 1, 1, 1, 1, 1,
0.1070973, 0.964707, -0.6593856, 1, 1, 1, 1, 1,
0.107483, -2.13985, 2.896455, 1, 1, 1, 1, 1,
0.1094933, 0.6230908, -2.687778, 1, 1, 1, 1, 1,
0.1098384, 0.4808188, 0.6875962, 1, 1, 1, 1, 1,
0.1100532, -0.2803849, 4.421856, 1, 1, 1, 1, 1,
0.1108834, -0.1477607, 1.148448, 1, 1, 1, 1, 1,
0.1148489, 0.05459668, 0.6670864, 0, 0, 1, 1, 1,
0.1223473, -2.433712, 3.387136, 1, 0, 0, 1, 1,
0.1278578, -1.801929, 1.239583, 1, 0, 0, 1, 1,
0.1327786, 1.156399, 2.136613, 1, 0, 0, 1, 1,
0.1328124, -0.9087902, 4.368085, 1, 0, 0, 1, 1,
0.1351259, -1.011363, 3.645191, 1, 0, 0, 1, 1,
0.135169, 1.596377, -1.612863, 0, 0, 0, 1, 1,
0.1367285, -0.3581146, 0.7939618, 0, 0, 0, 1, 1,
0.1380885, -0.3364927, 2.753551, 0, 0, 0, 1, 1,
0.1394781, 0.8614379, 1.361872, 0, 0, 0, 1, 1,
0.1408113, 0.304554, 0.8639285, 0, 0, 0, 1, 1,
0.1432712, 0.8164288, 0.5045401, 0, 0, 0, 1, 1,
0.1462801, -0.2261526, 2.26879, 0, 0, 0, 1, 1,
0.1500018, -0.1551576, 2.59052, 1, 1, 1, 1, 1,
0.1500481, 1.39879, 0.2011155, 1, 1, 1, 1, 1,
0.1506777, -0.90365, 0.3327756, 1, 1, 1, 1, 1,
0.1521529, 0.2777683, 1.650451, 1, 1, 1, 1, 1,
0.1548426, 0.907155, 0.8834615, 1, 1, 1, 1, 1,
0.1572356, -0.7279691, 3.680664, 1, 1, 1, 1, 1,
0.1653393, -0.59527, 3.854509, 1, 1, 1, 1, 1,
0.1692125, 0.3473415, -0.7485469, 1, 1, 1, 1, 1,
0.1701096, -1.018488, 3.051356, 1, 1, 1, 1, 1,
0.1757068, 0.4303047, 1.029247, 1, 1, 1, 1, 1,
0.1767795, 1.867221, 1.023972, 1, 1, 1, 1, 1,
0.1808507, -0.5796896, 0.6730639, 1, 1, 1, 1, 1,
0.1886932, -0.3743421, 2.138175, 1, 1, 1, 1, 1,
0.1963091, -1.219965, 1.89893, 1, 1, 1, 1, 1,
0.1985282, -0.763855, 2.175303, 1, 1, 1, 1, 1,
0.1988676, -0.4426104, 2.41222, 0, 0, 1, 1, 1,
0.2058709, 1.688137, -0.4114979, 1, 0, 0, 1, 1,
0.207706, -0.4041411, 3.024535, 1, 0, 0, 1, 1,
0.2084538, 0.2289361, 2.486085, 1, 0, 0, 1, 1,
0.2090321, -0.1820529, 1.65293, 1, 0, 0, 1, 1,
0.2113034, -0.4630866, 2.714233, 1, 0, 0, 1, 1,
0.2152884, 0.9529315, -0.7120859, 0, 0, 0, 1, 1,
0.225564, -0.09879856, 4.229936, 0, 0, 0, 1, 1,
0.2267054, 0.1483248, 1.119534, 0, 0, 0, 1, 1,
0.235985, 0.1046357, 0.9206013, 0, 0, 0, 1, 1,
0.2378109, 1.187515, 2.167575, 0, 0, 0, 1, 1,
0.2431407, 0.6755347, -0.9265426, 0, 0, 0, 1, 1,
0.244949, 1.663325, 0.6632112, 0, 0, 0, 1, 1,
0.2475109, -0.9199601, 2.954387, 1, 1, 1, 1, 1,
0.2494752, -0.5059129, 2.736201, 1, 1, 1, 1, 1,
0.2528986, -0.2031019, 4.236442, 1, 1, 1, 1, 1,
0.2545501, 0.1695576, -0.9078598, 1, 1, 1, 1, 1,
0.2567, -0.6010766, 2.066217, 1, 1, 1, 1, 1,
0.2578142, 1.447737, 0.820252, 1, 1, 1, 1, 1,
0.2596215, 0.8214844, 1.192925, 1, 1, 1, 1, 1,
0.2626976, 0.986577, 0.1300971, 1, 1, 1, 1, 1,
0.2635367, -1.380868, 1.77295, 1, 1, 1, 1, 1,
0.263821, -0.6189535, 2.913318, 1, 1, 1, 1, 1,
0.2682091, 0.4129207, 0.9292747, 1, 1, 1, 1, 1,
0.2715517, -0.6801926, 3.743874, 1, 1, 1, 1, 1,
0.2716581, 2.51875, -0.4960466, 1, 1, 1, 1, 1,
0.2766439, -1.215458, 1.939443, 1, 1, 1, 1, 1,
0.2795016, 0.1775005, 1.783258, 1, 1, 1, 1, 1,
0.2796953, -0.2040275, 1.293152, 0, 0, 1, 1, 1,
0.2815325, -0.7537815, 2.587348, 1, 0, 0, 1, 1,
0.2836701, 0.02434412, 1.561382, 1, 0, 0, 1, 1,
0.2847485, -0.4061457, 1.731939, 1, 0, 0, 1, 1,
0.288132, 0.6244848, 0.01000785, 1, 0, 0, 1, 1,
0.289343, -0.9464841, 1.260245, 1, 0, 0, 1, 1,
0.2953662, -0.4514447, 2.818666, 0, 0, 0, 1, 1,
0.2961279, 0.1644098, -0.02242373, 0, 0, 0, 1, 1,
0.297045, -0.5955465, 1.587057, 0, 0, 0, 1, 1,
0.2971638, 0.435418, 1.40978, 0, 0, 0, 1, 1,
0.297351, -0.8510733, 1.321735, 0, 0, 0, 1, 1,
0.3002937, 0.5252241, 1.011042, 0, 0, 0, 1, 1,
0.3017347, 0.1439597, 1.310727, 0, 0, 0, 1, 1,
0.3033097, 1.407484, 0.2496208, 1, 1, 1, 1, 1,
0.305284, -0.8590885, 3.306601, 1, 1, 1, 1, 1,
0.3185091, 0.9713264, -0.2712027, 1, 1, 1, 1, 1,
0.3253512, 0.3711616, -0.9899728, 1, 1, 1, 1, 1,
0.3286201, -1.018726, 3.066122, 1, 1, 1, 1, 1,
0.3290667, -0.5837804, 1.737566, 1, 1, 1, 1, 1,
0.3320497, 0.159064, 1.611707, 1, 1, 1, 1, 1,
0.3338934, -0.9095393, 2.085677, 1, 1, 1, 1, 1,
0.3369017, 0.09636915, 0.8743594, 1, 1, 1, 1, 1,
0.3397862, -0.2503228, 2.131263, 1, 1, 1, 1, 1,
0.3471899, 0.8802181, 0.6888744, 1, 1, 1, 1, 1,
0.3548226, -2.248538, 2.712239, 1, 1, 1, 1, 1,
0.3551787, -0.7864243, 4.365602, 1, 1, 1, 1, 1,
0.3552718, -0.9828716, 3.41905, 1, 1, 1, 1, 1,
0.3558888, -0.1458795, 2.681456, 1, 1, 1, 1, 1,
0.3561887, 0.5245142, -0.6691878, 0, 0, 1, 1, 1,
0.359201, -0.724331, 2.778813, 1, 0, 0, 1, 1,
0.3690953, 1.0054, -1.226247, 1, 0, 0, 1, 1,
0.3721041, 1.609037, -0.1976797, 1, 0, 0, 1, 1,
0.3739327, 1.251759, 1.605132, 1, 0, 0, 1, 1,
0.3766846, 0.6323448, 1.471442, 1, 0, 0, 1, 1,
0.3774775, -0.4685651, 0.5833771, 0, 0, 0, 1, 1,
0.3784325, -0.6480951, 0.8390878, 0, 0, 0, 1, 1,
0.3793925, -0.1224457, 3.812065, 0, 0, 0, 1, 1,
0.3807851, -1.264394, 3.105765, 0, 0, 0, 1, 1,
0.38365, 0.5591757, -0.079446, 0, 0, 0, 1, 1,
0.3872184, -1.626387, 3.663599, 0, 0, 0, 1, 1,
0.3874254, -0.4653357, 3.448158, 0, 0, 0, 1, 1,
0.3879365, -0.6427405, 2.496957, 1, 1, 1, 1, 1,
0.3879695, 1.252578, 0.1594491, 1, 1, 1, 1, 1,
0.3894697, -2.327457, 3.240821, 1, 1, 1, 1, 1,
0.3905583, 0.3988937, 1.953382, 1, 1, 1, 1, 1,
0.3933839, 0.1325794, -0.8608769, 1, 1, 1, 1, 1,
0.3939358, -0.274295, 1.413646, 1, 1, 1, 1, 1,
0.3995966, 0.05664945, 1.608934, 1, 1, 1, 1, 1,
0.4017117, 1.288439, 1.216465, 1, 1, 1, 1, 1,
0.4024504, 0.6501255, 1.056126, 1, 1, 1, 1, 1,
0.4066043, 0.1047103, 2.615082, 1, 1, 1, 1, 1,
0.4073142, 1.521318, 1.821344, 1, 1, 1, 1, 1,
0.4078582, -0.7637666, 1.795652, 1, 1, 1, 1, 1,
0.4094421, 0.57649, 2.218646, 1, 1, 1, 1, 1,
0.413377, 0.151861, 0.900258, 1, 1, 1, 1, 1,
0.4154174, 0.1463496, 2.341016, 1, 1, 1, 1, 1,
0.4163938, -0.4441158, 3.305234, 0, 0, 1, 1, 1,
0.4184869, -0.1234876, 0.751222, 1, 0, 0, 1, 1,
0.4192706, -0.5810048, 4.113696, 1, 0, 0, 1, 1,
0.4202023, 0.3986219, 1.345751, 1, 0, 0, 1, 1,
0.4218068, 1.119937, 1.751046, 1, 0, 0, 1, 1,
0.4374664, 1.300016, -0.3567927, 1, 0, 0, 1, 1,
0.4396363, 0.8965608, 2.62713, 0, 0, 0, 1, 1,
0.4430498, -0.9519145, 1.421252, 0, 0, 0, 1, 1,
0.4440815, 0.5667275, 1.176406, 0, 0, 0, 1, 1,
0.4488695, -1.462238, 3.283256, 0, 0, 0, 1, 1,
0.450213, -0.5370209, 1.431122, 0, 0, 0, 1, 1,
0.4525794, -0.05146163, 2.003687, 0, 0, 0, 1, 1,
0.4544203, -0.1039738, 2.702002, 0, 0, 0, 1, 1,
0.4549173, 0.9539556, 2.063563, 1, 1, 1, 1, 1,
0.4557801, -1.366874, 2.643963, 1, 1, 1, 1, 1,
0.4560976, 0.1284888, 1.267457, 1, 1, 1, 1, 1,
0.456834, -0.7582404, 3.612477, 1, 1, 1, 1, 1,
0.4609342, -0.06192669, 0.4716195, 1, 1, 1, 1, 1,
0.462069, -1.051561, 3.23703, 1, 1, 1, 1, 1,
0.4621132, -0.3130812, 2.766473, 1, 1, 1, 1, 1,
0.4632222, -0.008931559, 1.618286, 1, 1, 1, 1, 1,
0.468487, -1.91812, 1.333417, 1, 1, 1, 1, 1,
0.4685349, 0.8522178, -0.3956653, 1, 1, 1, 1, 1,
0.4730308, 1.187401, 1.311755, 1, 1, 1, 1, 1,
0.4789087, 1.744026, 0.1779314, 1, 1, 1, 1, 1,
0.4817106, -1.839567, 2.770765, 1, 1, 1, 1, 1,
0.4817736, -0.6370103, 3.32175, 1, 1, 1, 1, 1,
0.48902, 0.6163328, 0.9129022, 1, 1, 1, 1, 1,
0.4890893, 0.115747, 1.294364, 0, 0, 1, 1, 1,
0.5044852, -0.5124367, 3.487411, 1, 0, 0, 1, 1,
0.51667, 0.4689451, 1.224927, 1, 0, 0, 1, 1,
0.5180995, 1.297537, 1.26092, 1, 0, 0, 1, 1,
0.5259156, 0.4662029, 0.161038, 1, 0, 0, 1, 1,
0.5274953, 0.6052666, -0.07310427, 1, 0, 0, 1, 1,
0.5289159, -0.3733985, 2.910271, 0, 0, 0, 1, 1,
0.5393482, -1.205153, 3.154281, 0, 0, 0, 1, 1,
0.5399539, -0.2231272, 1.790841, 0, 0, 0, 1, 1,
0.5482442, -0.3181667, 0.9057755, 0, 0, 0, 1, 1,
0.548302, -0.7952793, 1.254174, 0, 0, 0, 1, 1,
0.5533761, 1.419834, 0.2082746, 0, 0, 0, 1, 1,
0.5645569, -0.5217394, 2.923026, 0, 0, 0, 1, 1,
0.5646712, 0.5243394, -0.2412197, 1, 1, 1, 1, 1,
0.5720885, -0.3293504, 2.478742, 1, 1, 1, 1, 1,
0.5750182, 0.6908818, 2.054906, 1, 1, 1, 1, 1,
0.5819269, 1.151987, 0.2999866, 1, 1, 1, 1, 1,
0.5831409, 0.6766084, 1.170454, 1, 1, 1, 1, 1,
0.584501, 0.2151762, 0.007309427, 1, 1, 1, 1, 1,
0.5883252, -0.1988136, 3.140889, 1, 1, 1, 1, 1,
0.5950641, 0.1730794, 2.132632, 1, 1, 1, 1, 1,
0.5951692, -0.1333379, 1.327047, 1, 1, 1, 1, 1,
0.5988443, 0.08883718, 1.871969, 1, 1, 1, 1, 1,
0.60113, -0.6976375, 2.355728, 1, 1, 1, 1, 1,
0.6016396, -1.150767, 3.664852, 1, 1, 1, 1, 1,
0.6019469, 0.1402922, 2.090129, 1, 1, 1, 1, 1,
0.6041346, -0.4965005, 2.981588, 1, 1, 1, 1, 1,
0.6065757, -1.485353, 2.049413, 1, 1, 1, 1, 1,
0.607203, -0.9350272, 3.550289, 0, 0, 1, 1, 1,
0.6075726, 0.2401634, 0.9154129, 1, 0, 0, 1, 1,
0.6076329, -0.2819919, 2.984276, 1, 0, 0, 1, 1,
0.6092868, -0.252624, 3.005402, 1, 0, 0, 1, 1,
0.6093727, 0.7042632, 0.2360938, 1, 0, 0, 1, 1,
0.6094728, 0.4017307, 3.274444, 1, 0, 0, 1, 1,
0.6107302, -0.6859353, 3.066073, 0, 0, 0, 1, 1,
0.6142738, 0.3531219, -0.1988505, 0, 0, 0, 1, 1,
0.6156268, 1.655851, 1.397515, 0, 0, 0, 1, 1,
0.6189577, -0.3079408, 1.64999, 0, 0, 0, 1, 1,
0.6207373, -1.022111, 3.577001, 0, 0, 0, 1, 1,
0.622235, -0.2836056, 3.234869, 0, 0, 0, 1, 1,
0.6261021, -0.2003873, 2.474869, 0, 0, 0, 1, 1,
0.6310382, 0.2085064, 1.269494, 1, 1, 1, 1, 1,
0.6328202, -0.1758068, 1.984395, 1, 1, 1, 1, 1,
0.6360527, 1.481484, 1.236139, 1, 1, 1, 1, 1,
0.6372682, -0.2466465, 2.016244, 1, 1, 1, 1, 1,
0.6380851, 1.886455, 0.4532533, 1, 1, 1, 1, 1,
0.6381385, 1.015746, 0.9130967, 1, 1, 1, 1, 1,
0.6428331, -0.9150472, -0.7237843, 1, 1, 1, 1, 1,
0.6442842, -0.2683977, -0.05250263, 1, 1, 1, 1, 1,
0.6532731, -0.9597851, 1.054501, 1, 1, 1, 1, 1,
0.6647435, 1.619316, 0.04335026, 1, 1, 1, 1, 1,
0.6651514, -0.9358096, 2.714317, 1, 1, 1, 1, 1,
0.6795608, 0.6382225, 0.3323367, 1, 1, 1, 1, 1,
0.6804671, -0.5261512, 3.195035, 1, 1, 1, 1, 1,
0.681362, 0.0400307, 3.096267, 1, 1, 1, 1, 1,
0.6834781, -0.7231479, 2.635694, 1, 1, 1, 1, 1,
0.6876555, -0.1824902, 0.8365492, 0, 0, 1, 1, 1,
0.6879678, 0.9917195, 2.169228, 1, 0, 0, 1, 1,
0.6938047, 1.664978, -0.545867, 1, 0, 0, 1, 1,
0.6965368, -1.278425, 2.954708, 1, 0, 0, 1, 1,
0.6975423, 1.172111, 0.8227642, 1, 0, 0, 1, 1,
0.6985206, 0.4590544, 0.6339185, 1, 0, 0, 1, 1,
0.7004161, -1.210381, 2.593614, 0, 0, 0, 1, 1,
0.7020036, -1.543929, 1.805233, 0, 0, 0, 1, 1,
0.7024845, -1.327628, 1.615564, 0, 0, 0, 1, 1,
0.7051861, 1.596073, -0.9884815, 0, 0, 0, 1, 1,
0.7066331, -1.092725, 2.597142, 0, 0, 0, 1, 1,
0.7080448, 0.936198, 0.6684048, 0, 0, 0, 1, 1,
0.7089548, 1.570112, -0.3233408, 0, 0, 0, 1, 1,
0.7135872, 0.05466417, 2.52209, 1, 1, 1, 1, 1,
0.7146823, 1.586146, 0.7701542, 1, 1, 1, 1, 1,
0.7171531, 0.4907467, 0.4597214, 1, 1, 1, 1, 1,
0.7241864, 1.177262, 0.4741106, 1, 1, 1, 1, 1,
0.727671, -0.567635, 1.939847, 1, 1, 1, 1, 1,
0.7337058, 1.472556, 0.1810718, 1, 1, 1, 1, 1,
0.7361354, -1.208503, 2.796466, 1, 1, 1, 1, 1,
0.7394916, -1.9975, 2.261409, 1, 1, 1, 1, 1,
0.7441736, 0.7413531, 0.6101242, 1, 1, 1, 1, 1,
0.7443811, 0.3099948, 3.656798, 1, 1, 1, 1, 1,
0.7449202, -0.53154, 1.201628, 1, 1, 1, 1, 1,
0.7474276, -0.5681148, 1.099393, 1, 1, 1, 1, 1,
0.7478126, -0.09096491, 2.525134, 1, 1, 1, 1, 1,
0.7495091, -0.9142594, 3.764859, 1, 1, 1, 1, 1,
0.7528248, -0.3636892, 3.634927, 1, 1, 1, 1, 1,
0.7547848, 1.021878, 1.124522, 0, 0, 1, 1, 1,
0.7658922, 0.1072758, 1.214318, 1, 0, 0, 1, 1,
0.7676399, -0.03826578, 2.27434, 1, 0, 0, 1, 1,
0.768839, -0.688329, -1.358601, 1, 0, 0, 1, 1,
0.7790658, 1.092113, 0.2373607, 1, 0, 0, 1, 1,
0.7810804, 1.704113, -0.007140351, 1, 0, 0, 1, 1,
0.792618, 1.687458, 1.33286, 0, 0, 0, 1, 1,
0.7994291, 0.7023814, -0.4628967, 0, 0, 0, 1, 1,
0.8003353, 0.6747854, 0.7770087, 0, 0, 0, 1, 1,
0.81223, -0.12726, 1.5414, 0, 0, 0, 1, 1,
0.8194385, 1.483224, -0.08823832, 0, 0, 0, 1, 1,
0.8252107, -1.481757, 5.013231, 0, 0, 0, 1, 1,
0.8253942, 0.5626941, -1.029464, 0, 0, 0, 1, 1,
0.8259403, 0.404823, 1.505861, 1, 1, 1, 1, 1,
0.8281165, -1.667358, 1.834747, 1, 1, 1, 1, 1,
0.831907, 0.1640292, 2.766257, 1, 1, 1, 1, 1,
0.833863, -0.6503718, 0.964186, 1, 1, 1, 1, 1,
0.8354657, 0.6314898, 0.7149721, 1, 1, 1, 1, 1,
0.837585, 0.9234495, 1.617524, 1, 1, 1, 1, 1,
0.8467937, -1.26596, 2.365478, 1, 1, 1, 1, 1,
0.8481687, -0.4610733, 2.55041, 1, 1, 1, 1, 1,
0.8498136, 0.2629612, 2.48617, 1, 1, 1, 1, 1,
0.8524313, -0.0512172, 2.200329, 1, 1, 1, 1, 1,
0.858752, -0.9478567, 2.662452, 1, 1, 1, 1, 1,
0.860318, 0.6678059, -0.05013886, 1, 1, 1, 1, 1,
0.860418, 2.17659, 1.341083, 1, 1, 1, 1, 1,
0.8760593, 0.3662286, -0.2798754, 1, 1, 1, 1, 1,
0.8827357, -1.290043, 2.733382, 1, 1, 1, 1, 1,
0.8829583, 0.2097023, 1.397244, 0, 0, 1, 1, 1,
0.8960567, 0.4637979, 0.2142614, 1, 0, 0, 1, 1,
0.898899, 0.6128702, 2.865775, 1, 0, 0, 1, 1,
0.9027192, -1.553892, 3.459235, 1, 0, 0, 1, 1,
0.9040637, 1.786425, 0.6209255, 1, 0, 0, 1, 1,
0.91036, 0.3904539, -0.5809713, 1, 0, 0, 1, 1,
0.9135586, 0.3889467, -0.3723439, 0, 0, 0, 1, 1,
0.9143993, -3.025199, 1.530893, 0, 0, 0, 1, 1,
0.9153528, 1.434992, -0.1556919, 0, 0, 0, 1, 1,
0.9197569, 0.7582259, 2.687523, 0, 0, 0, 1, 1,
0.9249027, 0.6476504, 0.9644836, 0, 0, 0, 1, 1,
0.9280409, 0.3498803, 2.772046, 0, 0, 0, 1, 1,
0.9305365, -2.617018, 2.042661, 0, 0, 0, 1, 1,
0.9379815, 0.09281775, 3.278237, 1, 1, 1, 1, 1,
0.9397955, 0.2753275, 1.717762, 1, 1, 1, 1, 1,
0.952597, -0.1808567, 0.2762187, 1, 1, 1, 1, 1,
0.9557895, 0.1850071, 2.725056, 1, 1, 1, 1, 1,
0.9559283, 1.319387, 2.097065, 1, 1, 1, 1, 1,
0.9582321, -0.3883033, 3.431536, 1, 1, 1, 1, 1,
0.9613463, -1.082543, 2.151159, 1, 1, 1, 1, 1,
0.975776, 0.419663, 1.996041, 1, 1, 1, 1, 1,
0.9772255, -0.7755119, 2.623269, 1, 1, 1, 1, 1,
0.9777904, 2.340913, 3.02045, 1, 1, 1, 1, 1,
0.9831255, 0.826974, 0.9726939, 1, 1, 1, 1, 1,
0.985074, -0.4301579, 1.433493, 1, 1, 1, 1, 1,
1.00663, 2.000861, -0.6453955, 1, 1, 1, 1, 1,
1.008601, 0.6131463, 1.613762, 1, 1, 1, 1, 1,
1.012886, 0.01612392, 1.010492, 1, 1, 1, 1, 1,
1.021104, -1.980501, 0.949405, 0, 0, 1, 1, 1,
1.033697, -0.8951055, 2.845616, 1, 0, 0, 1, 1,
1.035441, 0.7589087, 2.367164, 1, 0, 0, 1, 1,
1.03864, 0.1796693, 3.483382, 1, 0, 0, 1, 1,
1.038844, 0.907612, 0.3547277, 1, 0, 0, 1, 1,
1.051459, 0.361816, 1.372546, 1, 0, 0, 1, 1,
1.053742, 0.6045826, 0.7356588, 0, 0, 0, 1, 1,
1.061413, 0.8584462, 2.429322, 0, 0, 0, 1, 1,
1.062089, 0.1589836, -0.3160781, 0, 0, 0, 1, 1,
1.062864, -0.7759652, 1.334961, 0, 0, 0, 1, 1,
1.067488, 0.6961021, 1.923893, 0, 0, 0, 1, 1,
1.070336, 0.5447942, 1.307141, 0, 0, 0, 1, 1,
1.071267, 0.9727842, 0.8631464, 0, 0, 0, 1, 1,
1.073912, -0.392333, 0.5371131, 1, 1, 1, 1, 1,
1.074345, 0.9667849, 1.731215, 1, 1, 1, 1, 1,
1.079269, 0.2541917, 1.723139, 1, 1, 1, 1, 1,
1.080688, -0.1423336, 1.512506, 1, 1, 1, 1, 1,
1.083045, -0.5058417, 1.466059, 1, 1, 1, 1, 1,
1.083603, -1.280139, 3.257511, 1, 1, 1, 1, 1,
1.097904, -0.5247778, 2.121608, 1, 1, 1, 1, 1,
1.09918, -0.1004126, 2.389173, 1, 1, 1, 1, 1,
1.101576, 1.595187, 2.503821, 1, 1, 1, 1, 1,
1.104002, 0.3387005, 0.8487365, 1, 1, 1, 1, 1,
1.107412, -1.354967, 0.3229129, 1, 1, 1, 1, 1,
1.112229, 0.2840429, 1.482285, 1, 1, 1, 1, 1,
1.113914, -0.2434692, 0.7527341, 1, 1, 1, 1, 1,
1.116516, 0.1094178, 1.993591, 1, 1, 1, 1, 1,
1.117439, 0.989709, 0.8807433, 1, 1, 1, 1, 1,
1.120054, 0.3645964, 1.338362, 0, 0, 1, 1, 1,
1.121731, -0.1272654, 2.814313, 1, 0, 0, 1, 1,
1.145694, -0.9258373, 3.078804, 1, 0, 0, 1, 1,
1.1468, 1.036376, 0.2838858, 1, 0, 0, 1, 1,
1.159546, -0.1291817, 0.4107029, 1, 0, 0, 1, 1,
1.1649, 1.240282, -0.1624515, 1, 0, 0, 1, 1,
1.177154, 0.1921995, 1.244248, 0, 0, 0, 1, 1,
1.186414, -0.1708081, -0.09855193, 0, 0, 0, 1, 1,
1.217959, 0.8022217, 0.7783932, 0, 0, 0, 1, 1,
1.220509, -1.246308, 3.6188, 0, 0, 0, 1, 1,
1.220746, -0.1078912, 1.148929, 0, 0, 0, 1, 1,
1.224424, -0.3266602, 2.496014, 0, 0, 0, 1, 1,
1.231101, -1.310966, 0.9016161, 0, 0, 0, 1, 1,
1.246136, -0.5016008, 1.621463, 1, 1, 1, 1, 1,
1.252725, -0.1427665, 0.4004509, 1, 1, 1, 1, 1,
1.253982, -1.222445, 3.394271, 1, 1, 1, 1, 1,
1.268243, -0.5068153, 2.129632, 1, 1, 1, 1, 1,
1.268798, -0.6850349, 2.228889, 1, 1, 1, 1, 1,
1.280462, 1.949091, 1.366638, 1, 1, 1, 1, 1,
1.283285, -0.5625876, 2.742703, 1, 1, 1, 1, 1,
1.295591, -0.5553686, 1.967662, 1, 1, 1, 1, 1,
1.302055, 1.090188, 1.574818, 1, 1, 1, 1, 1,
1.305562, 0.5001895, 1.109653, 1, 1, 1, 1, 1,
1.307866, 0.6752508, 1.67717, 1, 1, 1, 1, 1,
1.311488, -0.2212404, 2.616344, 1, 1, 1, 1, 1,
1.311507, -0.3239759, -0.4806121, 1, 1, 1, 1, 1,
1.322611, -0.7874525, 2.066238, 1, 1, 1, 1, 1,
1.32669, -0.1802252, 1.058886, 1, 1, 1, 1, 1,
1.326819, -0.7740011, 1.827071, 0, 0, 1, 1, 1,
1.331037, -0.5198728, 2.695253, 1, 0, 0, 1, 1,
1.333437, -0.8681495, 2.111993, 1, 0, 0, 1, 1,
1.337905, -0.4171507, 2.706039, 1, 0, 0, 1, 1,
1.340032, -1.198642, 2.994056, 1, 0, 0, 1, 1,
1.35683, 0.1404206, 0.785759, 1, 0, 0, 1, 1,
1.358143, -1.332069, 3.461725, 0, 0, 0, 1, 1,
1.35922, 1.54013, 2.785188, 0, 0, 0, 1, 1,
1.360249, -3.514947, 3.774597, 0, 0, 0, 1, 1,
1.360472, 1.105924, 1.274975, 0, 0, 0, 1, 1,
1.362806, -2.185657, 3.009813, 0, 0, 0, 1, 1,
1.384613, 0.04964142, 1.234564, 0, 0, 0, 1, 1,
1.394988, -1.362367, 0.7456015, 0, 0, 0, 1, 1,
1.397845, -0.2877761, 2.170644, 1, 1, 1, 1, 1,
1.400725, -1.174621, 1.663373, 1, 1, 1, 1, 1,
1.403595, 1.351634, 1.603467, 1, 1, 1, 1, 1,
1.418667, -1.68426, 1.890668, 1, 1, 1, 1, 1,
1.436167, -0.667798, 4.399326, 1, 1, 1, 1, 1,
1.438296, 0.8713235, 0.36734, 1, 1, 1, 1, 1,
1.438565, 0.1874079, 3.488952, 1, 1, 1, 1, 1,
1.439718, 2.048617, 0.8329384, 1, 1, 1, 1, 1,
1.441637, 0.1120292, 2.368047, 1, 1, 1, 1, 1,
1.446379, -1.485666, 1.417608, 1, 1, 1, 1, 1,
1.450259, -0.3618979, 0.9868403, 1, 1, 1, 1, 1,
1.450378, 0.9678585, 1.282116, 1, 1, 1, 1, 1,
1.48118, 0.4099391, 0.4723235, 1, 1, 1, 1, 1,
1.48252, 1.459508, 1.141068, 1, 1, 1, 1, 1,
1.497567, 0.5277259, 1.703327, 1, 1, 1, 1, 1,
1.512966, -0.5425069, 1.365041, 0, 0, 1, 1, 1,
1.521294, 0.04674694, 1.812576, 1, 0, 0, 1, 1,
1.527419, -1.331243, 3.223358, 1, 0, 0, 1, 1,
1.528011, 0.1735152, -1.059823, 1, 0, 0, 1, 1,
1.528442, 0.7983164, 1.597804, 1, 0, 0, 1, 1,
1.529145, -0.03344094, 2.302337, 1, 0, 0, 1, 1,
1.529805, -2.103785, 0.8283521, 0, 0, 0, 1, 1,
1.536271, -0.02091177, -0.490227, 0, 0, 0, 1, 1,
1.539409, -0.4279884, 2.599588, 0, 0, 0, 1, 1,
1.545285, -1.44335, 1.702544, 0, 0, 0, 1, 1,
1.564636, -1.235555, 3.150452, 0, 0, 0, 1, 1,
1.565569, 1.127104, 1.058376, 0, 0, 0, 1, 1,
1.574804, -1.539443, 1.208498, 0, 0, 0, 1, 1,
1.581178, 0.474005, 1.155292, 1, 1, 1, 1, 1,
1.583053, -1.111146, 2.191825, 1, 1, 1, 1, 1,
1.586001, -0.3329041, 2.183091, 1, 1, 1, 1, 1,
1.620128, 0.1553925, 0.7007464, 1, 1, 1, 1, 1,
1.62058, -0.4001043, 1.691475, 1, 1, 1, 1, 1,
1.628357, -0.02058201, 1.141276, 1, 1, 1, 1, 1,
1.628816, -0.3414242, 0.530037, 1, 1, 1, 1, 1,
1.632208, 0.8723102, 1.503616, 1, 1, 1, 1, 1,
1.634496, -0.2374099, 2.55847, 1, 1, 1, 1, 1,
1.63669, 0.4651587, 0.9283311, 1, 1, 1, 1, 1,
1.638534, 1.377858, 0.210173, 1, 1, 1, 1, 1,
1.649325, 0.4857553, 1.682783, 1, 1, 1, 1, 1,
1.655396, -1.30678, 2.039773, 1, 1, 1, 1, 1,
1.666366, 0.2185189, 1.59295, 1, 1, 1, 1, 1,
1.677768, 0.5170096, 0.5068199, 1, 1, 1, 1, 1,
1.679059, 1.401881, 1.979959, 0, 0, 1, 1, 1,
1.681552, 0.07544277, 0.5375375, 1, 0, 0, 1, 1,
1.686679, -0.9184215, 2.55955, 1, 0, 0, 1, 1,
1.691274, -0.7804266, 0.7590109, 1, 0, 0, 1, 1,
1.693261, -0.1489608, 1.985959, 1, 0, 0, 1, 1,
1.700332, 1.008503, 2.169948, 1, 0, 0, 1, 1,
1.702344, -0.8618659, 3.21178, 0, 0, 0, 1, 1,
1.713178, -0.746498, 1.679535, 0, 0, 0, 1, 1,
1.721713, -0.5908974, 3.851106, 0, 0, 0, 1, 1,
1.723845, -0.50392, 0.2698745, 0, 0, 0, 1, 1,
1.733956, 0.2158268, 1.383709, 0, 0, 0, 1, 1,
1.74025, 0.381982, 0.6617374, 0, 0, 0, 1, 1,
1.769515, 0.8368346, -0.4723387, 0, 0, 0, 1, 1,
1.789383, 1.306881, 0.402109, 1, 1, 1, 1, 1,
1.802911, -0.506807, 2.222491, 1, 1, 1, 1, 1,
1.808822, 0.3733042, 1.296118, 1, 1, 1, 1, 1,
1.849548, 1.382389, 1.433427, 1, 1, 1, 1, 1,
1.86355, -1.523293, 3.543957, 1, 1, 1, 1, 1,
1.870988, 0.3113002, 1.966087, 1, 1, 1, 1, 1,
1.874526, 0.9705402, 0.2511128, 1, 1, 1, 1, 1,
1.884998, 0.321718, 3.065562, 1, 1, 1, 1, 1,
1.927443, -0.8669286, 0.8136374, 1, 1, 1, 1, 1,
1.939063, 1.134159, 0.7956764, 1, 1, 1, 1, 1,
1.945137, -0.9856922, 0.1404175, 1, 1, 1, 1, 1,
1.97023, 1.354422, -0.3364052, 1, 1, 1, 1, 1,
2.000135, 1.989371, -0.6599602, 1, 1, 1, 1, 1,
2.028423, 0.8989116, 0.5744473, 1, 1, 1, 1, 1,
2.05253, -0.6612429, 2.620118, 1, 1, 1, 1, 1,
2.073815, 0.2403589, 0.7378227, 0, 0, 1, 1, 1,
2.098094, 0.534166, 3.637063, 1, 0, 0, 1, 1,
2.099415, -1.15111, 1.983642, 1, 0, 0, 1, 1,
2.177537, 1.134054, 0.1670787, 1, 0, 0, 1, 1,
2.18371, 1.312634, 2.059095, 1, 0, 0, 1, 1,
2.204972, -0.4424047, 0.05842695, 1, 0, 0, 1, 1,
2.20662, 1.076282, 1.380189, 0, 0, 0, 1, 1,
2.286941, 1.286826, -0.9273607, 0, 0, 0, 1, 1,
2.298845, 0.8187079, 1.868746, 0, 0, 0, 1, 1,
2.332771, -0.1330132, 0.5572456, 0, 0, 0, 1, 1,
2.524172, 1.610339, -0.7901306, 0, 0, 0, 1, 1,
2.556689, 0.01719826, 1.706776, 0, 0, 0, 1, 1,
2.648117, 0.197648, 2.112425, 0, 0, 0, 1, 1,
2.77719, -1.171969, 2.129471, 1, 1, 1, 1, 1,
2.871934, -1.315749, 1.275445, 1, 1, 1, 1, 1,
2.896333, -0.1943589, 1.698421, 1, 1, 1, 1, 1,
2.921473, 0.3529879, 1.436448, 1, 1, 1, 1, 1,
3.290475, 0.2869642, 1.443462, 1, 1, 1, 1, 1,
3.407184, 1.402982, 1.033146, 1, 1, 1, 1, 1,
3.608442, 0.5561169, 2.709198, 1, 1, 1, 1, 1
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
var radius = 10.20361;
var distance = 35.83974;
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
mvMatrix.translate( -0.5088086, 0.4808568, -0.3623815 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.83974);
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
