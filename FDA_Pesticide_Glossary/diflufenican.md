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
-3.352646, 1.578217, -1.392764, 1, 0, 0, 1,
-3.323808, 1.264136, -1.970996, 1, 0.007843138, 0, 1,
-2.789897, -0.4202699, -1.620858, 1, 0.01176471, 0, 1,
-2.710316, 0.3046847, -2.312803, 1, 0.01960784, 0, 1,
-2.63896, -0.4744509, -3.759661, 1, 0.02352941, 0, 1,
-2.619292, -1.027649, -1.361163, 1, 0.03137255, 0, 1,
-2.601171, 0.1125304, -2.68064, 1, 0.03529412, 0, 1,
-2.538116, 0.08956724, -2.552929, 1, 0.04313726, 0, 1,
-2.535746, 2.172474, -0.7583901, 1, 0.04705882, 0, 1,
-2.352776, 1.00784, -2.327501, 1, 0.05490196, 0, 1,
-2.340356, -1.05165, -1.658807, 1, 0.05882353, 0, 1,
-2.231632, 0.1485792, -0.6412014, 1, 0.06666667, 0, 1,
-2.202361, -0.2722453, -2.930612, 1, 0.07058824, 0, 1,
-2.090956, 1.398384, -1.902152, 1, 0.07843138, 0, 1,
-2.067859, -1.532863, -3.091633, 1, 0.08235294, 0, 1,
-2.052339, -1.614079, -3.566936, 1, 0.09019608, 0, 1,
-2.015254, -0.1356442, -4.102671, 1, 0.09411765, 0, 1,
-1.992127, 0.3334992, -0.05459467, 1, 0.1019608, 0, 1,
-1.971086, -0.234899, -0.5015488, 1, 0.1098039, 0, 1,
-1.924017, 1.522475, -0.6246618, 1, 0.1137255, 0, 1,
-1.904284, 0.1342068, -2.422148, 1, 0.1215686, 0, 1,
-1.863598, -0.04786954, -0.3773601, 1, 0.1254902, 0, 1,
-1.856418, -0.3493705, -1.115239, 1, 0.1333333, 0, 1,
-1.84994, -0.2553033, -3.079061, 1, 0.1372549, 0, 1,
-1.848952, -0.3563018, -2.946821, 1, 0.145098, 0, 1,
-1.837875, 1.733273, -0.04667535, 1, 0.1490196, 0, 1,
-1.815357, 0.1926436, -1.815, 1, 0.1568628, 0, 1,
-1.8084, -0.223634, -2.103272, 1, 0.1607843, 0, 1,
-1.794266, 0.7178482, -1.938176, 1, 0.1686275, 0, 1,
-1.787375, -0.003760359, -0.1825204, 1, 0.172549, 0, 1,
-1.786943, -2.265367, -2.704329, 1, 0.1803922, 0, 1,
-1.786864, 2.204586, -2.455408, 1, 0.1843137, 0, 1,
-1.773107, 0.5139084, -1.135493, 1, 0.1921569, 0, 1,
-1.750501, -0.5083076, -1.420149, 1, 0.1960784, 0, 1,
-1.726568, 1.955276, -0.6983574, 1, 0.2039216, 0, 1,
-1.70594, 0.4923466, -1.859247, 1, 0.2117647, 0, 1,
-1.651885, -0.5626666, -0.1070125, 1, 0.2156863, 0, 1,
-1.649694, 0.20666, -1.115152, 1, 0.2235294, 0, 1,
-1.645365, -0.3389329, -2.72456, 1, 0.227451, 0, 1,
-1.634099, 0.9299514, -1.447939, 1, 0.2352941, 0, 1,
-1.63306, 0.9409982, -0.9766898, 1, 0.2392157, 0, 1,
-1.565386, -2.068163, -1.278513, 1, 0.2470588, 0, 1,
-1.555455, -2.532532, -3.206249, 1, 0.2509804, 0, 1,
-1.548404, 0.1750124, -0.8864356, 1, 0.2588235, 0, 1,
-1.547091, -1.740576, -2.577016, 1, 0.2627451, 0, 1,
-1.543834, -0.6767247, -0.5243063, 1, 0.2705882, 0, 1,
-1.543145, -0.3952511, -1.529194, 1, 0.2745098, 0, 1,
-1.54009, 0.1623781, -1.044615, 1, 0.282353, 0, 1,
-1.521506, -1.83998, -3.801947, 1, 0.2862745, 0, 1,
-1.51552, -1.561503, -2.117605, 1, 0.2941177, 0, 1,
-1.512648, 0.04650003, -0.6932175, 1, 0.3019608, 0, 1,
-1.509797, 1.17005, 0.9956768, 1, 0.3058824, 0, 1,
-1.500893, 1.026259, -0.6306937, 1, 0.3137255, 0, 1,
-1.480983, 1.079133, -0.8695416, 1, 0.3176471, 0, 1,
-1.477696, 0.3799494, -3.236536, 1, 0.3254902, 0, 1,
-1.476536, -0.9852122, -2.462169, 1, 0.3294118, 0, 1,
-1.474417, -0.2302047, -2.859045, 1, 0.3372549, 0, 1,
-1.472518, 0.1025166, -4.222751, 1, 0.3411765, 0, 1,
-1.471484, -0.6677694, -1.663785, 1, 0.3490196, 0, 1,
-1.470763, -0.5780241, -2.251259, 1, 0.3529412, 0, 1,
-1.457121, 0.358935, -0.9301006, 1, 0.3607843, 0, 1,
-1.452762, -1.158548, -2.335691, 1, 0.3647059, 0, 1,
-1.451963, 1.449874, 0.6560658, 1, 0.372549, 0, 1,
-1.449038, -0.5034817, -2.550709, 1, 0.3764706, 0, 1,
-1.439633, 0.3453078, -2.709217, 1, 0.3843137, 0, 1,
-1.437845, -0.6553463, -2.869949, 1, 0.3882353, 0, 1,
-1.434749, -1.1994, -3.314011, 1, 0.3960784, 0, 1,
-1.43461, -0.5857784, -1.341684, 1, 0.4039216, 0, 1,
-1.432579, 0.2805114, -3.273471, 1, 0.4078431, 0, 1,
-1.430512, -0.1244431, -0.237655, 1, 0.4156863, 0, 1,
-1.428879, -0.5247376, 0.2022222, 1, 0.4196078, 0, 1,
-1.413064, -0.06603721, -0.2674632, 1, 0.427451, 0, 1,
-1.404283, -1.445631, -3.415329, 1, 0.4313726, 0, 1,
-1.396805, 0.6168197, -0.03624338, 1, 0.4392157, 0, 1,
-1.394248, -2.374529, -2.570672, 1, 0.4431373, 0, 1,
-1.386825, -1.680457, -1.704781, 1, 0.4509804, 0, 1,
-1.375797, 0.2870454, -1.70931, 1, 0.454902, 0, 1,
-1.37459, -1.606942, -2.673799, 1, 0.4627451, 0, 1,
-1.361072, -1.562261, -2.655266, 1, 0.4666667, 0, 1,
-1.360272, 0.1943097, -1.128232, 1, 0.4745098, 0, 1,
-1.353271, -1.914865, -1.799286, 1, 0.4784314, 0, 1,
-1.351012, -0.5919352, -1.62707, 1, 0.4862745, 0, 1,
-1.346138, 0.7909443, -0.532171, 1, 0.4901961, 0, 1,
-1.345735, 1.682449, -0.3049454, 1, 0.4980392, 0, 1,
-1.344579, -0.3346972, -3.176445, 1, 0.5058824, 0, 1,
-1.343523, 0.3625829, -1.15892, 1, 0.509804, 0, 1,
-1.341893, 0.3444898, -2.216099, 1, 0.5176471, 0, 1,
-1.339448, -0.2078105, -3.497161, 1, 0.5215687, 0, 1,
-1.339408, -0.3321817, -3.455707, 1, 0.5294118, 0, 1,
-1.331739, 0.3760898, -0.8993321, 1, 0.5333334, 0, 1,
-1.32881, 0.4642121, -2.329235, 1, 0.5411765, 0, 1,
-1.325839, -0.1837114, -0.6259868, 1, 0.5450981, 0, 1,
-1.325036, -0.5628794, -0.7207742, 1, 0.5529412, 0, 1,
-1.306802, -1.388163, -2.723533, 1, 0.5568628, 0, 1,
-1.30643, -0.9171811, -0.6274216, 1, 0.5647059, 0, 1,
-1.303175, -1.493222, -2.117305, 1, 0.5686275, 0, 1,
-1.294828, 1.904319, -1.85523, 1, 0.5764706, 0, 1,
-1.290438, -1.604161, -1.81808, 1, 0.5803922, 0, 1,
-1.277743, 1.469502, -1.563431, 1, 0.5882353, 0, 1,
-1.275033, -0.2196608, -2.426252, 1, 0.5921569, 0, 1,
-1.274675, 0.100585, -1.0671, 1, 0.6, 0, 1,
-1.259759, -2.349251, -3.275363, 1, 0.6078432, 0, 1,
-1.25901, 2.053895, -1.575167, 1, 0.6117647, 0, 1,
-1.252738, -0.5410157, -2.850912, 1, 0.6196079, 0, 1,
-1.247344, 0.1223186, -1.152005, 1, 0.6235294, 0, 1,
-1.246324, -0.5226926, -0.7750949, 1, 0.6313726, 0, 1,
-1.238265, 0.3962821, -0.3087768, 1, 0.6352941, 0, 1,
-1.237725, -1.535356, -1.488736, 1, 0.6431373, 0, 1,
-1.237296, -0.4497055, -3.220589, 1, 0.6470588, 0, 1,
-1.229545, -0.4035567, -1.985692, 1, 0.654902, 0, 1,
-1.224653, -1.574802, -2.435785, 1, 0.6588235, 0, 1,
-1.19882, 0.9358568, -0.2598684, 1, 0.6666667, 0, 1,
-1.197163, 2.458573, -1.709084, 1, 0.6705883, 0, 1,
-1.193786, 0.132144, -0.9794939, 1, 0.6784314, 0, 1,
-1.180777, 0.316843, -1.280266, 1, 0.682353, 0, 1,
-1.177588, 0.4648766, 0.2186653, 1, 0.6901961, 0, 1,
-1.167229, 2.158383, -0.4207692, 1, 0.6941177, 0, 1,
-1.163163, 1.211547, -1.765534, 1, 0.7019608, 0, 1,
-1.162558, -0.5631217, -2.832034, 1, 0.7098039, 0, 1,
-1.162108, -2.980828, -2.503161, 1, 0.7137255, 0, 1,
-1.145533, 0.3718453, -1.485178, 1, 0.7215686, 0, 1,
-1.13675, 1.966888, -2.400003, 1, 0.7254902, 0, 1,
-1.130512, -1.872566, -1.4356, 1, 0.7333333, 0, 1,
-1.128525, -0.8516263, -2.875992, 1, 0.7372549, 0, 1,
-1.122348, -1.971027, -1.187112, 1, 0.7450981, 0, 1,
-1.121708, 0.06579755, -1.664741, 1, 0.7490196, 0, 1,
-1.114656, -1.276851, -3.584842, 1, 0.7568628, 0, 1,
-1.114576, 0.1638057, -2.075778, 1, 0.7607843, 0, 1,
-1.112091, 1.919952, -1.393902, 1, 0.7686275, 0, 1,
-1.100781, 0.2065906, -1.208842, 1, 0.772549, 0, 1,
-1.077761, 0.3215577, 0.1751365, 1, 0.7803922, 0, 1,
-1.075601, -1.463934, -1.255254, 1, 0.7843137, 0, 1,
-1.074003, -1.06618, -4.854976, 1, 0.7921569, 0, 1,
-1.071811, 0.7190207, -3.487751, 1, 0.7960784, 0, 1,
-1.071802, -0.9640856, -4.02119, 1, 0.8039216, 0, 1,
-1.064942, 1.12091, -0.3887393, 1, 0.8117647, 0, 1,
-1.063844, 0.5756602, -0.8927277, 1, 0.8156863, 0, 1,
-1.060875, -0.25691, -0.8431917, 1, 0.8235294, 0, 1,
-1.040361, 0.4771132, -1.942953, 1, 0.827451, 0, 1,
-1.021795, 0.4760396, -1.78501, 1, 0.8352941, 0, 1,
-1.017893, 0.4292862, 0.2565028, 1, 0.8392157, 0, 1,
-1.00766, 0.8787709, -2.052127, 1, 0.8470588, 0, 1,
-1.007249, 1.052244, -1.426717, 1, 0.8509804, 0, 1,
-1.002087, -0.4660532, -3.336302, 1, 0.8588235, 0, 1,
-0.9961412, 0.5406511, 0.8324013, 1, 0.8627451, 0, 1,
-0.9944856, 0.126835, -2.240242, 1, 0.8705882, 0, 1,
-0.9915575, -0.7070068, -2.941262, 1, 0.8745098, 0, 1,
-0.9907727, 0.7512931, 0.1062404, 1, 0.8823529, 0, 1,
-0.9895414, 0.4892755, 0.2993196, 1, 0.8862745, 0, 1,
-0.9890952, 0.6410493, 0.9056822, 1, 0.8941177, 0, 1,
-0.9817547, 1.872271, 0.2328012, 1, 0.8980392, 0, 1,
-0.9792529, 0.4373075, -2.603159, 1, 0.9058824, 0, 1,
-0.9758188, -0.6239948, -1.368397, 1, 0.9137255, 0, 1,
-0.9745925, 0.2920662, -0.0184554, 1, 0.9176471, 0, 1,
-0.9649591, -0.09429854, -3.630512, 1, 0.9254902, 0, 1,
-0.9634114, -0.9392388, -3.085958, 1, 0.9294118, 0, 1,
-0.9624978, -1.257064, -1.729334, 1, 0.9372549, 0, 1,
-0.9624118, -0.4884661, -2.976886, 1, 0.9411765, 0, 1,
-0.9587494, -0.1550883, -0.2706416, 1, 0.9490196, 0, 1,
-0.9580543, 0.4767774, 1.246901, 1, 0.9529412, 0, 1,
-0.9516364, 1.171739, 1.164663, 1, 0.9607843, 0, 1,
-0.950203, 0.5293995, -1.545336, 1, 0.9647059, 0, 1,
-0.9473689, -0.1139136, -0.3491006, 1, 0.972549, 0, 1,
-0.9467491, 0.3692832, -1.495612, 1, 0.9764706, 0, 1,
-0.9462482, 0.1114572, -2.220258, 1, 0.9843137, 0, 1,
-0.9455545, -0.03574394, -1.131469, 1, 0.9882353, 0, 1,
-0.9439695, -1.170804, -2.765704, 1, 0.9960784, 0, 1,
-0.9391947, -0.2738814, -2.053435, 0.9960784, 1, 0, 1,
-0.936077, 0.2421921, -1.369921, 0.9921569, 1, 0, 1,
-0.9354421, 1.053129, 0.4209473, 0.9843137, 1, 0, 1,
-0.9353727, 0.7640305, -0.4245524, 0.9803922, 1, 0, 1,
-0.9229023, -0.1848259, -0.8265302, 0.972549, 1, 0, 1,
-0.9179708, 1.192005, 0.3345392, 0.9686275, 1, 0, 1,
-0.9138469, 1.193177, 0.1501552, 0.9607843, 1, 0, 1,
-0.9126883, -1.569093, -1.930361, 0.9568627, 1, 0, 1,
-0.9098059, -0.5454434, -0.2029422, 0.9490196, 1, 0, 1,
-0.9090883, 1.546453, -0.1255165, 0.945098, 1, 0, 1,
-0.8977689, 0.4939897, -2.687325, 0.9372549, 1, 0, 1,
-0.8961262, 0.4689597, -0.02393757, 0.9333333, 1, 0, 1,
-0.8843958, 1.352642, 0.0532129, 0.9254902, 1, 0, 1,
-0.882609, -0.4256305, -1.42878, 0.9215686, 1, 0, 1,
-0.8776636, -2.060285, -3.205653, 0.9137255, 1, 0, 1,
-0.8737175, 1.875653, 0.238728, 0.9098039, 1, 0, 1,
-0.8721728, 1.2964, -1.071444, 0.9019608, 1, 0, 1,
-0.8709776, -0.3758362, -2.008888, 0.8941177, 1, 0, 1,
-0.8652692, -0.4665047, -1.630023, 0.8901961, 1, 0, 1,
-0.8607375, -0.5446582, -2.691095, 0.8823529, 1, 0, 1,
-0.8571561, -0.05976266, -2.609211, 0.8784314, 1, 0, 1,
-0.8544396, -1.44606, -3.86287, 0.8705882, 1, 0, 1,
-0.852017, 0.03197309, -0.3414288, 0.8666667, 1, 0, 1,
-0.8439991, -0.3543245, -2.569724, 0.8588235, 1, 0, 1,
-0.8420156, 0.3337952, -1.897447, 0.854902, 1, 0, 1,
-0.8418019, 1.273786, 0.3025937, 0.8470588, 1, 0, 1,
-0.8406828, 0.7383149, 0.3918839, 0.8431373, 1, 0, 1,
-0.8333166, -0.3717749, -2.0871, 0.8352941, 1, 0, 1,
-0.8315223, -1.433557, -4.170485, 0.8313726, 1, 0, 1,
-0.8275783, 0.07443246, -1.94868, 0.8235294, 1, 0, 1,
-0.822215, 0.5644988, -1.804467, 0.8196079, 1, 0, 1,
-0.8198323, 0.9417614, -2.757693, 0.8117647, 1, 0, 1,
-0.8144195, 0.4148157, -0.2677956, 0.8078431, 1, 0, 1,
-0.8065491, 0.436478, 0.7359316, 0.8, 1, 0, 1,
-0.8062119, 0.6987929, -0.5872186, 0.7921569, 1, 0, 1,
-0.8015911, -0.2807699, -1.691468, 0.7882353, 1, 0, 1,
-0.8005363, 0.2451537, -2.573286, 0.7803922, 1, 0, 1,
-0.7933482, 0.6572495, 0.5305791, 0.7764706, 1, 0, 1,
-0.7909008, -0.8039116, -2.608398, 0.7686275, 1, 0, 1,
-0.7777228, 0.470303, -1.637627, 0.7647059, 1, 0, 1,
-0.7762151, 0.4757891, -1.317426, 0.7568628, 1, 0, 1,
-0.7755472, -0.5306402, -1.256245, 0.7529412, 1, 0, 1,
-0.7740259, -0.3281264, -3.108365, 0.7450981, 1, 0, 1,
-0.7676547, 1.612759, -1.974314, 0.7411765, 1, 0, 1,
-0.762453, -0.3059834, -2.592454, 0.7333333, 1, 0, 1,
-0.7606754, 0.3665714, -0.9977343, 0.7294118, 1, 0, 1,
-0.7568231, 0.6761585, -0.4903944, 0.7215686, 1, 0, 1,
-0.7566305, -0.7654286, -4.298071, 0.7176471, 1, 0, 1,
-0.7476128, -0.4996799, -0.9753062, 0.7098039, 1, 0, 1,
-0.7432404, -0.5899004, -2.803579, 0.7058824, 1, 0, 1,
-0.7373348, 0.3921905, 0.129029, 0.6980392, 1, 0, 1,
-0.7354314, -0.9117388, -2.606023, 0.6901961, 1, 0, 1,
-0.7349492, -2.565989, -4.168779, 0.6862745, 1, 0, 1,
-0.7335358, -0.6413227, -2.440348, 0.6784314, 1, 0, 1,
-0.7261429, -0.4179336, -1.547512, 0.6745098, 1, 0, 1,
-0.723561, 0.5391819, 0.03569443, 0.6666667, 1, 0, 1,
-0.7204753, -0.1594286, -1.589668, 0.6627451, 1, 0, 1,
-0.7203361, -1.397801, -0.7595842, 0.654902, 1, 0, 1,
-0.7166704, 0.08491505, -2.889239, 0.6509804, 1, 0, 1,
-0.7162822, 1.615999, 0.3114561, 0.6431373, 1, 0, 1,
-0.7147285, -0.4495421, -2.082959, 0.6392157, 1, 0, 1,
-0.7067558, 1.464151, 0.01509916, 0.6313726, 1, 0, 1,
-0.7028826, -0.7680563, -2.811965, 0.627451, 1, 0, 1,
-0.7025721, -0.9174742, -1.878862, 0.6196079, 1, 0, 1,
-0.698056, 0.4736724, -2.066514, 0.6156863, 1, 0, 1,
-0.6923455, 0.994258, 1.107624, 0.6078432, 1, 0, 1,
-0.68527, -0.3938727, -1.879341, 0.6039216, 1, 0, 1,
-0.6811868, -0.1620017, -3.471908, 0.5960785, 1, 0, 1,
-0.6778788, -0.1187527, -2.402764, 0.5882353, 1, 0, 1,
-0.6737156, 0.4172858, -2.287772, 0.5843138, 1, 0, 1,
-0.6668169, -0.4702913, -4.224899, 0.5764706, 1, 0, 1,
-0.665011, 1.362681, -0.4513464, 0.572549, 1, 0, 1,
-0.661986, -0.8161436, -1.6025, 0.5647059, 1, 0, 1,
-0.639239, 1.026177, -1.80455, 0.5607843, 1, 0, 1,
-0.6359274, -0.2528497, -0.6552461, 0.5529412, 1, 0, 1,
-0.635609, 0.9499633, -0.9694185, 0.5490196, 1, 0, 1,
-0.6352264, -1.055411, -2.981024, 0.5411765, 1, 0, 1,
-0.6337734, -0.269068, -1.858944, 0.5372549, 1, 0, 1,
-0.6335242, -0.5700817, -2.979316, 0.5294118, 1, 0, 1,
-0.6329589, 0.3658316, -1.416074, 0.5254902, 1, 0, 1,
-0.6285359, 0.8480117, -2.873472, 0.5176471, 1, 0, 1,
-0.625716, 1.588063, -1.460166, 0.5137255, 1, 0, 1,
-0.6251081, 1.625342, -1.61216, 0.5058824, 1, 0, 1,
-0.6208706, -1.298805, -3.244874, 0.5019608, 1, 0, 1,
-0.6208118, 0.915543, -0.1158258, 0.4941176, 1, 0, 1,
-0.6203672, 2.33847, 0.3178089, 0.4862745, 1, 0, 1,
-0.6194624, -1.924381, -4.4759, 0.4823529, 1, 0, 1,
-0.6194407, -0.5330243, -0.3262234, 0.4745098, 1, 0, 1,
-0.6152676, -1.877729, -2.17419, 0.4705882, 1, 0, 1,
-0.6133847, 1.765106, -0.3912507, 0.4627451, 1, 0, 1,
-0.6123291, 1.375259, 1.002046, 0.4588235, 1, 0, 1,
-0.6060412, -0.4920345, -2.350464, 0.4509804, 1, 0, 1,
-0.603087, -0.04144075, -1.322309, 0.4470588, 1, 0, 1,
-0.6004575, -1.818965, -2.241682, 0.4392157, 1, 0, 1,
-0.6004208, -1.579818, -4.834948, 0.4352941, 1, 0, 1,
-0.5976078, 0.4865186, -0.210609, 0.427451, 1, 0, 1,
-0.5969607, -0.7761064, -4.503604, 0.4235294, 1, 0, 1,
-0.5934268, -2.461095, -0.2730083, 0.4156863, 1, 0, 1,
-0.5785169, -0.5635678, -2.227142, 0.4117647, 1, 0, 1,
-0.5767061, 0.3579272, -1.813196, 0.4039216, 1, 0, 1,
-0.5759839, 1.440839, -0.5810488, 0.3960784, 1, 0, 1,
-0.5713269, -0.3283949, -1.638761, 0.3921569, 1, 0, 1,
-0.5625925, -0.6336044, -2.820802, 0.3843137, 1, 0, 1,
-0.5608834, -1.633894, -2.608467, 0.3803922, 1, 0, 1,
-0.5596842, 1.317855, -0.4982565, 0.372549, 1, 0, 1,
-0.5563894, 0.1455388, -1.396547, 0.3686275, 1, 0, 1,
-0.55506, 0.700725, 0.4220612, 0.3607843, 1, 0, 1,
-0.5526741, -0.8022937, -2.708292, 0.3568628, 1, 0, 1,
-0.5525885, -0.2223229, -0.5814698, 0.3490196, 1, 0, 1,
-0.5519273, 0.1142726, -2.235155, 0.345098, 1, 0, 1,
-0.5486174, 1.018719, 1.59612, 0.3372549, 1, 0, 1,
-0.546033, 0.1603489, -0.6672807, 0.3333333, 1, 0, 1,
-0.5418002, 1.588168, -0.2499509, 0.3254902, 1, 0, 1,
-0.5403035, -0.8242633, -2.64115, 0.3215686, 1, 0, 1,
-0.5397632, 1.731833, -1.98016, 0.3137255, 1, 0, 1,
-0.5371554, -1.07971, -1.94573, 0.3098039, 1, 0, 1,
-0.5358349, -0.06616367, -3.302889, 0.3019608, 1, 0, 1,
-0.5296289, -0.8374037, -3.301375, 0.2941177, 1, 0, 1,
-0.5255519, 0.1933009, -0.5947926, 0.2901961, 1, 0, 1,
-0.5223813, -0.1745464, -0.7749302, 0.282353, 1, 0, 1,
-0.5219969, -0.7555167, -0.8750389, 0.2784314, 1, 0, 1,
-0.5196055, 0.1300233, -1.72447, 0.2705882, 1, 0, 1,
-0.5161041, 0.2013832, -2.01087, 0.2666667, 1, 0, 1,
-0.5140132, -0.02758113, -2.209631, 0.2588235, 1, 0, 1,
-0.5134435, -1.681506, -3.06803, 0.254902, 1, 0, 1,
-0.4968754, -0.6873221, -2.187747, 0.2470588, 1, 0, 1,
-0.496382, -1.452933, -1.575104, 0.2431373, 1, 0, 1,
-0.4944403, 0.9913173, 0.1039606, 0.2352941, 1, 0, 1,
-0.4920135, -1.278181, -3.252906, 0.2313726, 1, 0, 1,
-0.4910106, -0.9446664, -1.749043, 0.2235294, 1, 0, 1,
-0.4900648, -0.2301904, 0.24784, 0.2196078, 1, 0, 1,
-0.4890981, 0.9883966, -0.351414, 0.2117647, 1, 0, 1,
-0.4807516, 0.3869033, -0.581731, 0.2078431, 1, 0, 1,
-0.4807343, 1.873149, -1.163359, 0.2, 1, 0, 1,
-0.4788933, 0.3378161, -1.251421, 0.1921569, 1, 0, 1,
-0.4777319, -0.2078287, -2.09917, 0.1882353, 1, 0, 1,
-0.4774767, -0.1798881, -1.630782, 0.1803922, 1, 0, 1,
-0.4768036, 0.4179824, -2.509489, 0.1764706, 1, 0, 1,
-0.4766996, 0.3066177, 0.2239255, 0.1686275, 1, 0, 1,
-0.4733341, -0.6270349, -1.746894, 0.1647059, 1, 0, 1,
-0.466888, -0.1285592, -0.3271837, 0.1568628, 1, 0, 1,
-0.4664941, -1.594068, -3.85711, 0.1529412, 1, 0, 1,
-0.4645793, 0.6425759, -1.389839, 0.145098, 1, 0, 1,
-0.4641639, 0.5792848, -0.8650529, 0.1411765, 1, 0, 1,
-0.4595405, -0.4358135, -1.417593, 0.1333333, 1, 0, 1,
-0.4565495, 0.148777, -1.570225, 0.1294118, 1, 0, 1,
-0.4553586, 1.494982, 0.9748384, 0.1215686, 1, 0, 1,
-0.4541388, 0.5854206, 0.3272209, 0.1176471, 1, 0, 1,
-0.4538454, 0.6138393, -2.9414, 0.1098039, 1, 0, 1,
-0.453154, -0.908747, -1.2671, 0.1058824, 1, 0, 1,
-0.4515261, 0.02292109, -2.30128, 0.09803922, 1, 0, 1,
-0.4508546, 0.6968985, -1.840996, 0.09019608, 1, 0, 1,
-0.4505525, -1.959268, -3.17691, 0.08627451, 1, 0, 1,
-0.4500676, 0.9597359, -1.034194, 0.07843138, 1, 0, 1,
-0.4499759, -0.3024972, -1.659318, 0.07450981, 1, 0, 1,
-0.4450963, -0.9555624, -1.329597, 0.06666667, 1, 0, 1,
-0.4434895, -0.1317157, -2.036629, 0.0627451, 1, 0, 1,
-0.4393356, 0.7871096, -0.8360242, 0.05490196, 1, 0, 1,
-0.4363654, -0.4686705, -2.018394, 0.05098039, 1, 0, 1,
-0.4289469, -0.7048097, -1.157176, 0.04313726, 1, 0, 1,
-0.428076, -0.5321673, -3.602212, 0.03921569, 1, 0, 1,
-0.4269918, 0.05694418, -3.34666, 0.03137255, 1, 0, 1,
-0.4244257, 1.105222, 0.008126159, 0.02745098, 1, 0, 1,
-0.4240436, -0.778389, -4.175673, 0.01960784, 1, 0, 1,
-0.4237278, 0.5958267, -0.5981999, 0.01568628, 1, 0, 1,
-0.4223553, 0.8048477, -0.3090608, 0.007843138, 1, 0, 1,
-0.4214545, -1.180423, -1.206248, 0.003921569, 1, 0, 1,
-0.4200836, -1.203123, -3.626681, 0, 1, 0.003921569, 1,
-0.41883, 1.695275, 1.045945, 0, 1, 0.01176471, 1,
-0.4108629, -0.429911, -3.658989, 0, 1, 0.01568628, 1,
-0.4105741, 0.492973, -0.2205449, 0, 1, 0.02352941, 1,
-0.4085326, 1.320797, -0.9087933, 0, 1, 0.02745098, 1,
-0.4051302, 1.045619, -0.7904162, 0, 1, 0.03529412, 1,
-0.4023716, -0.4852202, -0.6384445, 0, 1, 0.03921569, 1,
-0.4010293, -2.432431, -0.715353, 0, 1, 0.04705882, 1,
-0.3999058, -1.072606, -2.681219, 0, 1, 0.05098039, 1,
-0.3989637, -0.7025264, -3.900215, 0, 1, 0.05882353, 1,
-0.3950001, -0.6341956, -3.902196, 0, 1, 0.0627451, 1,
-0.3842321, -0.5732426, -4.65741, 0, 1, 0.07058824, 1,
-0.3838451, 0.4883081, 0.02359705, 0, 1, 0.07450981, 1,
-0.3766171, 0.5340292, -0.2026007, 0, 1, 0.08235294, 1,
-0.3753875, -1.379396, -3.304928, 0, 1, 0.08627451, 1,
-0.3721992, 1.579463, -0.8389076, 0, 1, 0.09411765, 1,
-0.3705098, 1.555756, -0.8408542, 0, 1, 0.1019608, 1,
-0.3703111, 0.2820335, -1.314617, 0, 1, 0.1058824, 1,
-0.3700707, -0.1582738, -2.895349, 0, 1, 0.1137255, 1,
-0.3675534, -0.8137148, -1.78082, 0, 1, 0.1176471, 1,
-0.3664633, 0.219496, -0.5337216, 0, 1, 0.1254902, 1,
-0.3625336, -0.6808231, -3.107989, 0, 1, 0.1294118, 1,
-0.3609918, 0.2097914, -1.115705, 0, 1, 0.1372549, 1,
-0.3608033, -0.5012873, -3.62284, 0, 1, 0.1411765, 1,
-0.3580418, 0.1526897, -1.099539, 0, 1, 0.1490196, 1,
-0.3538666, 1.064158, 0.4534079, 0, 1, 0.1529412, 1,
-0.3531125, -0.4393685, -2.342249, 0, 1, 0.1607843, 1,
-0.3508233, -2.535524, -3.098301, 0, 1, 0.1647059, 1,
-0.3485585, 0.6326914, 0.04242777, 0, 1, 0.172549, 1,
-0.3450342, -0.5315543, -2.766593, 0, 1, 0.1764706, 1,
-0.3426046, -0.59622, -2.6722, 0, 1, 0.1843137, 1,
-0.337933, 1.349861, -1.132716, 0, 1, 0.1882353, 1,
-0.3365749, -0.6360469, -3.962182, 0, 1, 0.1960784, 1,
-0.335615, 1.429437, 0.3601871, 0, 1, 0.2039216, 1,
-0.3335024, 0.4866869, -1.40345, 0, 1, 0.2078431, 1,
-0.3332258, -1.675072, -2.624215, 0, 1, 0.2156863, 1,
-0.3316733, -0.9125, -4.746588, 0, 1, 0.2196078, 1,
-0.3234876, -0.165073, -2.260403, 0, 1, 0.227451, 1,
-0.3227414, -0.5944347, -0.6989866, 0, 1, 0.2313726, 1,
-0.3227194, 0.436731, -0.5525522, 0, 1, 0.2392157, 1,
-0.3181246, -1.984397, -3.759037, 0, 1, 0.2431373, 1,
-0.3174546, 0.3006926, 0.05911599, 0, 1, 0.2509804, 1,
-0.3166935, 0.8616808, 0.5779833, 0, 1, 0.254902, 1,
-0.3150634, 0.2671774, -2.820857, 0, 1, 0.2627451, 1,
-0.3108152, -0.4115316, -1.481141, 0, 1, 0.2666667, 1,
-0.2996673, 1.453415, 0.8639114, 0, 1, 0.2745098, 1,
-0.2968727, 1.720749, -0.1611393, 0, 1, 0.2784314, 1,
-0.2934153, -0.161556, -2.147158, 0, 1, 0.2862745, 1,
-0.2897713, 1.319388, -0.642144, 0, 1, 0.2901961, 1,
-0.2870073, -0.2993085, -1.625705, 0, 1, 0.2980392, 1,
-0.2853691, 0.9116353, -0.2477103, 0, 1, 0.3058824, 1,
-0.281878, -1.994877, -2.455818, 0, 1, 0.3098039, 1,
-0.2818187, -1.120399, -1.771369, 0, 1, 0.3176471, 1,
-0.2785313, 0.386129, -1.759018, 0, 1, 0.3215686, 1,
-0.2736326, -0.4887537, -1.560614, 0, 1, 0.3294118, 1,
-0.2709447, 0.02305039, -1.215941, 0, 1, 0.3333333, 1,
-0.2706486, -0.627212, -1.798115, 0, 1, 0.3411765, 1,
-0.2703542, -1.012862, -3.938545, 0, 1, 0.345098, 1,
-0.2683846, 0.1926269, -1.704012, 0, 1, 0.3529412, 1,
-0.264311, -0.1193023, -1.902678, 0, 1, 0.3568628, 1,
-0.2638425, 1.240835, -0.3169216, 0, 1, 0.3647059, 1,
-0.2612933, 0.2447485, -1.301743, 0, 1, 0.3686275, 1,
-0.2454136, 0.1300289, -1.341897, 0, 1, 0.3764706, 1,
-0.2398234, -0.2341484, -1.951157, 0, 1, 0.3803922, 1,
-0.2387097, -0.6683766, -2.885608, 0, 1, 0.3882353, 1,
-0.2328079, -0.4076785, -4.362429, 0, 1, 0.3921569, 1,
-0.2314061, -1.420165, -5.786518, 0, 1, 0.4, 1,
-0.2282455, 0.4750669, 0.3495355, 0, 1, 0.4078431, 1,
-0.2272371, 1.079582, -0.8396984, 0, 1, 0.4117647, 1,
-0.2224547, 0.1167437, -1.82726, 0, 1, 0.4196078, 1,
-0.2210864, -0.08656864, -2.707997, 0, 1, 0.4235294, 1,
-0.2202648, -1.713076, -2.642046, 0, 1, 0.4313726, 1,
-0.2176041, 0.7406968, 1.16757, 0, 1, 0.4352941, 1,
-0.2167819, -1.498866, -2.500149, 0, 1, 0.4431373, 1,
-0.2167068, -0.7856411, -3.737868, 0, 1, 0.4470588, 1,
-0.2138577, -1.768861, -3.036024, 0, 1, 0.454902, 1,
-0.2131654, -0.8502885, -1.297738, 0, 1, 0.4588235, 1,
-0.211947, 0.3461154, -0.4210728, 0, 1, 0.4666667, 1,
-0.2113218, -0.08534276, -3.217699, 0, 1, 0.4705882, 1,
-0.207484, 0.4070959, 0.5324004, 0, 1, 0.4784314, 1,
-0.2057864, 1.641922, 0.2095416, 0, 1, 0.4823529, 1,
-0.2036829, -0.3416469, -2.677735, 0, 1, 0.4901961, 1,
-0.2021185, -0.857724, -1.193968, 0, 1, 0.4941176, 1,
-0.1949524, -0.6439387, -2.549606, 0, 1, 0.5019608, 1,
-0.1947038, -1.481532, -1.476876, 0, 1, 0.509804, 1,
-0.1946281, 0.07139576, -0.2137915, 0, 1, 0.5137255, 1,
-0.1931006, 1.170152, -0.702987, 0, 1, 0.5215687, 1,
-0.1929519, -0.2044885, -0.1622502, 0, 1, 0.5254902, 1,
-0.1920419, -0.2433338, -1.811479, 0, 1, 0.5333334, 1,
-0.190899, 2.295959, -0.6812322, 0, 1, 0.5372549, 1,
-0.1900004, -1.451311, -2.200182, 0, 1, 0.5450981, 1,
-0.1802887, 0.6293228, 1.72678, 0, 1, 0.5490196, 1,
-0.1791031, 0.7017403, -0.4004063, 0, 1, 0.5568628, 1,
-0.1713184, -1.796739, -1.916876, 0, 1, 0.5607843, 1,
-0.1669374, 0.917639, 0.8232802, 0, 1, 0.5686275, 1,
-0.16223, -0.6851801, -3.552703, 0, 1, 0.572549, 1,
-0.1569719, 0.8268005, -0.7153575, 0, 1, 0.5803922, 1,
-0.1546441, -1.248564, -1.897458, 0, 1, 0.5843138, 1,
-0.1485336, 1.810421, -1.342062, 0, 1, 0.5921569, 1,
-0.1450994, 1.129908, 1.023084, 0, 1, 0.5960785, 1,
-0.1448485, -1.928211, -3.188262, 0, 1, 0.6039216, 1,
-0.1440874, -1.329651, -2.981735, 0, 1, 0.6117647, 1,
-0.1421776, 1.926536, 1.020217, 0, 1, 0.6156863, 1,
-0.1354473, -0.9166564, -2.762858, 0, 1, 0.6235294, 1,
-0.131699, -1.289096, -4.086357, 0, 1, 0.627451, 1,
-0.1298917, 0.3900658, 0.01657897, 0, 1, 0.6352941, 1,
-0.1246139, 2.485866, 0.007411711, 0, 1, 0.6392157, 1,
-0.1202211, 0.8308641, 1.169531, 0, 1, 0.6470588, 1,
-0.118976, 1.984643, 0.1583944, 0, 1, 0.6509804, 1,
-0.1185887, -2.170369, -3.262147, 0, 1, 0.6588235, 1,
-0.1185197, -1.355505, -3.082545, 0, 1, 0.6627451, 1,
-0.1181451, -1.147382, -2.847714, 0, 1, 0.6705883, 1,
-0.114904, -0.4706077, -3.306751, 0, 1, 0.6745098, 1,
-0.1148462, -2.631877, -2.814727, 0, 1, 0.682353, 1,
-0.1139377, 0.3898348, -0.140241, 0, 1, 0.6862745, 1,
-0.1134926, 0.4232105, 0.8687892, 0, 1, 0.6941177, 1,
-0.1099836, -0.7302679, -4.572048, 0, 1, 0.7019608, 1,
-0.1044887, 1.055694, -1.203808, 0, 1, 0.7058824, 1,
-0.1006451, 1.549283, -2.216875, 0, 1, 0.7137255, 1,
-0.1002324, 0.001986868, -1.818457, 0, 1, 0.7176471, 1,
-0.09955437, 0.03550451, -2.420028, 0, 1, 0.7254902, 1,
-0.09778564, 0.01775, -2.116626, 0, 1, 0.7294118, 1,
-0.08871775, -0.8651175, -4.196066, 0, 1, 0.7372549, 1,
-0.08714581, -0.9490622, -2.639578, 0, 1, 0.7411765, 1,
-0.08601324, 1.203341, -0.7245089, 0, 1, 0.7490196, 1,
-0.08486635, 0.7588686, 0.1753531, 0, 1, 0.7529412, 1,
-0.08481755, -0.4285251, -3.186367, 0, 1, 0.7607843, 1,
-0.08028527, 0.1745558, -0.1489533, 0, 1, 0.7647059, 1,
-0.07776853, -0.3475837, -2.813179, 0, 1, 0.772549, 1,
-0.07289719, -0.06361509, -2.070399, 0, 1, 0.7764706, 1,
-0.07228963, 0.1266321, -0.5850873, 0, 1, 0.7843137, 1,
-0.06913432, -2.933166, -3.676279, 0, 1, 0.7882353, 1,
-0.06614995, -0.495121, -1.831499, 0, 1, 0.7960784, 1,
-0.06469765, 1.702397, 0.5372024, 0, 1, 0.8039216, 1,
-0.06337241, 1.88589, 0.0745223, 0, 1, 0.8078431, 1,
-0.06265086, -0.466783, -3.304229, 0, 1, 0.8156863, 1,
-0.06121363, 0.2707565, -0.3748729, 0, 1, 0.8196079, 1,
-0.06021706, 0.1783589, -0.412755, 0, 1, 0.827451, 1,
-0.05966863, -2.508283, -1.623046, 0, 1, 0.8313726, 1,
-0.05798402, -0.520112, -3.466612, 0, 1, 0.8392157, 1,
-0.05597794, -0.1681805, -4.004298, 0, 1, 0.8431373, 1,
-0.05579013, -0.6140511, -2.731078, 0, 1, 0.8509804, 1,
-0.04946388, 1.720132, 0.1000294, 0, 1, 0.854902, 1,
-0.0428228, 0.05313476, -1.436813, 0, 1, 0.8627451, 1,
-0.04271474, 0.1509326, -0.9244232, 0, 1, 0.8666667, 1,
-0.04271396, 0.07688895, 1.587406, 0, 1, 0.8745098, 1,
-0.0414464, 0.9137999, -0.933846, 0, 1, 0.8784314, 1,
-0.04070387, -2.044678, -2.698313, 0, 1, 0.8862745, 1,
-0.03493259, 0.1581711, 0.3108328, 0, 1, 0.8901961, 1,
-0.03169963, -0.4734268, -3.641085, 0, 1, 0.8980392, 1,
-0.02838883, -0.5256563, -2.9241, 0, 1, 0.9058824, 1,
-0.02294262, -0.4139118, -6.3988, 0, 1, 0.9098039, 1,
-0.02093894, -0.2799176, -2.609583, 0, 1, 0.9176471, 1,
-0.0207577, 1.109643, -0.433554, 0, 1, 0.9215686, 1,
-0.02056169, -0.7506002, -3.524858, 0, 1, 0.9294118, 1,
-0.0175555, 0.6696414, -0.07132828, 0, 1, 0.9333333, 1,
-0.01457401, 0.06496187, -0.9080221, 0, 1, 0.9411765, 1,
-0.01452884, -0.3119504, -2.93219, 0, 1, 0.945098, 1,
-0.008934589, 0.2256375, 0.02314782, 0, 1, 0.9529412, 1,
-0.008156625, 0.5102143, -0.2185944, 0, 1, 0.9568627, 1,
-0.006359047, -0.2948079, -3.491417, 0, 1, 0.9647059, 1,
-0.006191519, 1.417511, 0.9831961, 0, 1, 0.9686275, 1,
-0.005672846, 0.1659237, -1.241584, 0, 1, 0.9764706, 1,
-0.003434327, 0.06292166, 0.7568392, 0, 1, 0.9803922, 1,
-0.002105795, 2.480837, 0.137669, 0, 1, 0.9882353, 1,
0.003372005, -0.5746682, 5.114603, 0, 1, 0.9921569, 1,
0.004642241, 0.06932351, -1.219096, 0, 1, 1, 1,
0.007472471, -0.3860085, 2.080641, 0, 0.9921569, 1, 1,
0.008919409, 0.7645704, 0.7410215, 0, 0.9882353, 1, 1,
0.01006229, 0.02820273, -0.665002, 0, 0.9803922, 1, 1,
0.01362899, 0.08123705, 0.1413378, 0, 0.9764706, 1, 1,
0.01593763, -1.194202, 3.074189, 0, 0.9686275, 1, 1,
0.02295871, -3.302829, 3.988229, 0, 0.9647059, 1, 1,
0.02376489, 0.8159546, 2.258659, 0, 0.9568627, 1, 1,
0.02563426, 1.086414, -3.121595, 0, 0.9529412, 1, 1,
0.02880561, -0.7945968, 3.999814, 0, 0.945098, 1, 1,
0.03020129, 1.803038, -0.1118507, 0, 0.9411765, 1, 1,
0.03174375, 0.25631, -1.205484, 0, 0.9333333, 1, 1,
0.03555803, -0.3630362, 3.88, 0, 0.9294118, 1, 1,
0.03773069, 1.377944, 1.078809, 0, 0.9215686, 1, 1,
0.03970496, 0.3554066, 0.9120555, 0, 0.9176471, 1, 1,
0.04123547, 1.728829, -1.563088, 0, 0.9098039, 1, 1,
0.04530654, 0.4320454, 2.255507, 0, 0.9058824, 1, 1,
0.04665737, 0.002692781, 2.605494, 0, 0.8980392, 1, 1,
0.05271688, -0.6288706, 3.925215, 0, 0.8901961, 1, 1,
0.05995794, 1.056421, 1.24664, 0, 0.8862745, 1, 1,
0.06042174, -1.128693, 2.966353, 0, 0.8784314, 1, 1,
0.06071083, 0.4940381, 1.650831, 0, 0.8745098, 1, 1,
0.06208988, 1.925381, 0.1544099, 0, 0.8666667, 1, 1,
0.06209387, 1.983644, -1.109862, 0, 0.8627451, 1, 1,
0.06367611, -1.194479, 4.1996, 0, 0.854902, 1, 1,
0.07366199, 0.5530585, 0.8923206, 0, 0.8509804, 1, 1,
0.07407302, 0.5118787, -0.6726643, 0, 0.8431373, 1, 1,
0.0744243, -0.3621005, 3.218921, 0, 0.8392157, 1, 1,
0.07512244, 1.09238, -2.20048, 0, 0.8313726, 1, 1,
0.07528221, 0.4343982, 1.418161, 0, 0.827451, 1, 1,
0.07550267, 0.2642109, 0.6819907, 0, 0.8196079, 1, 1,
0.07998669, 2.448885, 0.9692627, 0, 0.8156863, 1, 1,
0.08706897, 0.539357, 1.185112, 0, 0.8078431, 1, 1,
0.08726866, -1.331133, 3.160961, 0, 0.8039216, 1, 1,
0.0953439, 0.4382762, -1.467472, 0, 0.7960784, 1, 1,
0.09838809, -0.22232, 3.660441, 0, 0.7882353, 1, 1,
0.1005863, 0.9109583, 0.4710698, 0, 0.7843137, 1, 1,
0.1016299, -1.214615, 3.239382, 0, 0.7764706, 1, 1,
0.1021312, -0.1097665, 4.101649, 0, 0.772549, 1, 1,
0.1023358, 0.7704975, -1.148664, 0, 0.7647059, 1, 1,
0.1029444, 0.5372694, 0.9180942, 0, 0.7607843, 1, 1,
0.1040702, -2.036464, 4.169841, 0, 0.7529412, 1, 1,
0.1043429, 1.247818, 0.6889144, 0, 0.7490196, 1, 1,
0.1078147, 0.7590882, -1.39327, 0, 0.7411765, 1, 1,
0.1081776, 2.938025, 0.0002814493, 0, 0.7372549, 1, 1,
0.1163305, 1.265527, 2.514365, 0, 0.7294118, 1, 1,
0.1171793, 1.02895, 1.234827, 0, 0.7254902, 1, 1,
0.1184017, 0.06199228, 2.035632, 0, 0.7176471, 1, 1,
0.1191605, -0.4232892, 2.956094, 0, 0.7137255, 1, 1,
0.1202377, 1.187654, -0.5436748, 0, 0.7058824, 1, 1,
0.1259421, 0.9591837, -0.714837, 0, 0.6980392, 1, 1,
0.127727, 0.303478, 0.3755106, 0, 0.6941177, 1, 1,
0.1329225, -0.2678778, 1.594828, 0, 0.6862745, 1, 1,
0.1348957, -1.42625, 5.213373, 0, 0.682353, 1, 1,
0.1360859, -0.7206921, 1.882508, 0, 0.6745098, 1, 1,
0.1384458, 0.4480869, -0.3065516, 0, 0.6705883, 1, 1,
0.1395974, -1.61569, 4.388569, 0, 0.6627451, 1, 1,
0.1408434, 1.796209, 0.1246911, 0, 0.6588235, 1, 1,
0.1413517, 0.8655764, 0.1377642, 0, 0.6509804, 1, 1,
0.1450649, 0.3793964, 0.2880065, 0, 0.6470588, 1, 1,
0.1452234, -0.07831963, 1.603752, 0, 0.6392157, 1, 1,
0.1475259, 0.2374277, 0.1159348, 0, 0.6352941, 1, 1,
0.153134, 0.6955798, -2.260816, 0, 0.627451, 1, 1,
0.1559289, -1.05968, 3.839142, 0, 0.6235294, 1, 1,
0.1563116, 1.044753, -1.606395, 0, 0.6156863, 1, 1,
0.1589036, -0.7164276, 3.091954, 0, 0.6117647, 1, 1,
0.162633, 0.002798369, 1.328197, 0, 0.6039216, 1, 1,
0.1680455, -0.0774508, 1.963185, 0, 0.5960785, 1, 1,
0.172102, 1.265848, -1.128976, 0, 0.5921569, 1, 1,
0.1731543, -1.056886, 3.656017, 0, 0.5843138, 1, 1,
0.1777345, -0.9747374, 2.962591, 0, 0.5803922, 1, 1,
0.1794879, -0.2920424, 3.340005, 0, 0.572549, 1, 1,
0.1795259, -1.99124, 2.543886, 0, 0.5686275, 1, 1,
0.1837814, 2.563248, 0.1802033, 0, 0.5607843, 1, 1,
0.1844481, 0.5101011, 0.1174846, 0, 0.5568628, 1, 1,
0.185565, 1.156337, 1.614709, 0, 0.5490196, 1, 1,
0.1868177, 1.408056, -0.1925699, 0, 0.5450981, 1, 1,
0.1902554, 1.540801, -0.2796454, 0, 0.5372549, 1, 1,
0.1945247, 0.9654468, 1.601676, 0, 0.5333334, 1, 1,
0.1952345, 0.9484944, -0.5330178, 0, 0.5254902, 1, 1,
0.1956725, -1.923319, 2.95593, 0, 0.5215687, 1, 1,
0.1962637, 1.047596, -1.245429, 0, 0.5137255, 1, 1,
0.1996191, 2.286228, -1.000932, 0, 0.509804, 1, 1,
0.2023331, 2.206735, -0.2023831, 0, 0.5019608, 1, 1,
0.2027903, -0.3993877, 3.099192, 0, 0.4941176, 1, 1,
0.2112674, -2.068186, 4.665044, 0, 0.4901961, 1, 1,
0.2114471, -0.4636499, 2.240324, 0, 0.4823529, 1, 1,
0.2118393, -0.869973, 2.999001, 0, 0.4784314, 1, 1,
0.2157022, -0.01201783, 0.655109, 0, 0.4705882, 1, 1,
0.217082, 1.707262, 0.6086169, 0, 0.4666667, 1, 1,
0.2201099, 2.187859, 0.8814318, 0, 0.4588235, 1, 1,
0.2210209, 0.7656984, -0.1730814, 0, 0.454902, 1, 1,
0.226974, -0.3462784, 2.337389, 0, 0.4470588, 1, 1,
0.2282086, 0.5073491, 0.6009348, 0, 0.4431373, 1, 1,
0.2295244, -2.265968, 2.37946, 0, 0.4352941, 1, 1,
0.2315765, 1.242385, -0.3201278, 0, 0.4313726, 1, 1,
0.2330124, -0.3147742, 2.116476, 0, 0.4235294, 1, 1,
0.2429423, -0.4076553, 2.936072, 0, 0.4196078, 1, 1,
0.2512555, -1.193377, 2.65518, 0, 0.4117647, 1, 1,
0.2584808, 1.099248, 0.3066129, 0, 0.4078431, 1, 1,
0.2695083, 1.349456, 0.6874629, 0, 0.4, 1, 1,
0.2701811, -0.7574752, 3.003794, 0, 0.3921569, 1, 1,
0.2738101, 1.134886, 0.1012023, 0, 0.3882353, 1, 1,
0.2754991, 0.7118834, -0.4713568, 0, 0.3803922, 1, 1,
0.2834393, 0.1200233, 2.161038, 0, 0.3764706, 1, 1,
0.2856339, -2.308533, 3.490122, 0, 0.3686275, 1, 1,
0.2898363, 1.574192, 1.678652, 0, 0.3647059, 1, 1,
0.2928939, -0.7663243, 1.478116, 0, 0.3568628, 1, 1,
0.2977504, -1.906714, 3.215923, 0, 0.3529412, 1, 1,
0.3002148, 0.2539124, 0.4766109, 0, 0.345098, 1, 1,
0.3045358, 1.331558, -1.686223, 0, 0.3411765, 1, 1,
0.3065995, -1.297949, 4.014532, 0, 0.3333333, 1, 1,
0.308107, 0.8373708, -0.2714711, 0, 0.3294118, 1, 1,
0.3083561, 0.001210876, 3.187536, 0, 0.3215686, 1, 1,
0.3117267, 0.6890173, 0.5242397, 0, 0.3176471, 1, 1,
0.312839, 0.1936445, 0.9079676, 0, 0.3098039, 1, 1,
0.3146227, 1.58035, -0.972681, 0, 0.3058824, 1, 1,
0.3218397, 0.4333286, 0.9033398, 0, 0.2980392, 1, 1,
0.3232044, 1.928104, -0.1247516, 0, 0.2901961, 1, 1,
0.3240383, 1.613679, 0.1309172, 0, 0.2862745, 1, 1,
0.3260629, 0.6770014, 0.4435957, 0, 0.2784314, 1, 1,
0.326686, -0.7862401, 3.620806, 0, 0.2745098, 1, 1,
0.3274869, -0.7584981, 2.510321, 0, 0.2666667, 1, 1,
0.330162, -0.1919508, 2.242508, 0, 0.2627451, 1, 1,
0.3303932, -0.5563665, 2.700362, 0, 0.254902, 1, 1,
0.3315475, -3.016308, 1.884017, 0, 0.2509804, 1, 1,
0.3332357, -0.3288269, 4.772204, 0, 0.2431373, 1, 1,
0.3336248, 1.138243, 0.3172408, 0, 0.2392157, 1, 1,
0.3401886, 0.4624267, -0.4153118, 0, 0.2313726, 1, 1,
0.3402471, -0.5930771, 2.414046, 0, 0.227451, 1, 1,
0.3416033, 0.6518043, 3.166497, 0, 0.2196078, 1, 1,
0.3424823, 0.1930321, 1.234939, 0, 0.2156863, 1, 1,
0.3436075, 0.1039836, 1.853165, 0, 0.2078431, 1, 1,
0.3442642, 0.775929, 0.6037442, 0, 0.2039216, 1, 1,
0.3457735, 2.967448, 0.1731049, 0, 0.1960784, 1, 1,
0.3491716, -0.3284822, 3.131934, 0, 0.1882353, 1, 1,
0.3536003, -0.3926865, 2.949882, 0, 0.1843137, 1, 1,
0.3537277, 0.03613917, 0.6364735, 0, 0.1764706, 1, 1,
0.3560264, -0.1798407, 0.569388, 0, 0.172549, 1, 1,
0.3579635, -0.9387957, 3.105285, 0, 0.1647059, 1, 1,
0.3597268, -0.6883799, 2.464111, 0, 0.1607843, 1, 1,
0.3621325, -0.6363161, 1.912401, 0, 0.1529412, 1, 1,
0.3628942, 0.4973736, 1.832454, 0, 0.1490196, 1, 1,
0.3667454, -0.4449264, 2.264618, 0, 0.1411765, 1, 1,
0.3689025, -0.9120453, 2.963972, 0, 0.1372549, 1, 1,
0.3690524, -0.2219954, 3.42361, 0, 0.1294118, 1, 1,
0.3732427, 1.716134, 0.3393234, 0, 0.1254902, 1, 1,
0.3771637, -1.052904, 1.397979, 0, 0.1176471, 1, 1,
0.3868217, -0.1236834, 1.515448, 0, 0.1137255, 1, 1,
0.387264, -0.7314647, 3.810053, 0, 0.1058824, 1, 1,
0.390449, 0.486586, 1.523044, 0, 0.09803922, 1, 1,
0.3998398, -1.068203, 1.779849, 0, 0.09411765, 1, 1,
0.4024502, -0.1362044, 1.63148, 0, 0.08627451, 1, 1,
0.4031675, 0.2981317, 1.10618, 0, 0.08235294, 1, 1,
0.4062797, 2.021946, 1.936338, 0, 0.07450981, 1, 1,
0.4110374, 1.075065, 0.01560165, 0, 0.07058824, 1, 1,
0.4155605, -0.3572287, 2.157676, 0, 0.0627451, 1, 1,
0.4185846, -0.1183618, 1.898536, 0, 0.05882353, 1, 1,
0.4225451, -0.2602639, 0.7177663, 0, 0.05098039, 1, 1,
0.4237512, 0.1335864, 0.1216118, 0, 0.04705882, 1, 1,
0.4278124, 0.3417271, 0.7599709, 0, 0.03921569, 1, 1,
0.4286045, 1.037991, -1.099515, 0, 0.03529412, 1, 1,
0.4389648, 0.5857729, -0.3998808, 0, 0.02745098, 1, 1,
0.4427967, 0.7750925, 1.059076, 0, 0.02352941, 1, 1,
0.4429023, -0.9570567, 3.946428, 0, 0.01568628, 1, 1,
0.4475354, -0.5217214, 3.468445, 0, 0.01176471, 1, 1,
0.4490823, 0.2425441, 1.691638, 0, 0.003921569, 1, 1,
0.4490834, -0.1471072, 1.581782, 0.003921569, 0, 1, 1,
0.4517187, -0.4773673, 1.651658, 0.007843138, 0, 1, 1,
0.4524555, -0.8163922, 2.465859, 0.01568628, 0, 1, 1,
0.4569239, 2.376842, -0.4920974, 0.01960784, 0, 1, 1,
0.4589663, 0.760262, 1.760234, 0.02745098, 0, 1, 1,
0.4595793, 0.2812103, 1.412264, 0.03137255, 0, 1, 1,
0.4608944, -2.205948, 2.92171, 0.03921569, 0, 1, 1,
0.4644284, -0.8133488, 1.354926, 0.04313726, 0, 1, 1,
0.4651291, -0.08600008, 1.521184, 0.05098039, 0, 1, 1,
0.4654323, 0.3855487, 2.369139, 0.05490196, 0, 1, 1,
0.4675452, -1.942305, 4.721923, 0.0627451, 0, 1, 1,
0.4676549, 0.5775051, 1.246072, 0.06666667, 0, 1, 1,
0.4723544, -0.5567111, 4.695514, 0.07450981, 0, 1, 1,
0.4756705, -0.2154852, 2.697155, 0.07843138, 0, 1, 1,
0.4762594, 1.177918, -1.266321, 0.08627451, 0, 1, 1,
0.4782753, 1.379575, 0.2598943, 0.09019608, 0, 1, 1,
0.4791433, 0.9409499, -1.42508, 0.09803922, 0, 1, 1,
0.4820732, 0.7445124, -0.9433651, 0.1058824, 0, 1, 1,
0.4824325, -1.390272, 2.008071, 0.1098039, 0, 1, 1,
0.4836423, 0.0164187, 2.771463, 0.1176471, 0, 1, 1,
0.4853012, 0.6445565, 1.269138, 0.1215686, 0, 1, 1,
0.4869809, 0.6158119, 0.7382711, 0.1294118, 0, 1, 1,
0.4875672, 0.2495537, 1.196462, 0.1333333, 0, 1, 1,
0.4937226, -1.590151, 2.910614, 0.1411765, 0, 1, 1,
0.4940938, -1.23217, 3.975686, 0.145098, 0, 1, 1,
0.4956278, -0.4552307, 4.759281, 0.1529412, 0, 1, 1,
0.4994357, -0.02649784, 2.993833, 0.1568628, 0, 1, 1,
0.4999131, -0.375456, 3.704046, 0.1647059, 0, 1, 1,
0.5078713, 1.037237, -1.439702, 0.1686275, 0, 1, 1,
0.5095003, -0.9369121, 2.881073, 0.1764706, 0, 1, 1,
0.5148894, -0.9550948, 1.617797, 0.1803922, 0, 1, 1,
0.5166259, 0.4386877, 0.334003, 0.1882353, 0, 1, 1,
0.5178204, 0.3856508, 1.907346, 0.1921569, 0, 1, 1,
0.5195023, 0.9499785, -0.923103, 0.2, 0, 1, 1,
0.5203243, -0.1608351, 1.084266, 0.2078431, 0, 1, 1,
0.5227396, -0.5309021, 2.162, 0.2117647, 0, 1, 1,
0.5229335, 0.5675566, 0.6930194, 0.2196078, 0, 1, 1,
0.5276982, -0.913328, 4.145597, 0.2235294, 0, 1, 1,
0.5302061, 0.5114558, 0.5307988, 0.2313726, 0, 1, 1,
0.5302401, 0.5592269, -0.3893089, 0.2352941, 0, 1, 1,
0.5375875, -1.930061, 2.729524, 0.2431373, 0, 1, 1,
0.5375887, -0.2710831, -0.1657065, 0.2470588, 0, 1, 1,
0.5422627, 0.5918363, 1.369898, 0.254902, 0, 1, 1,
0.5423423, -0.09444794, 4.671957, 0.2588235, 0, 1, 1,
0.5447131, 0.4421351, 0.9077018, 0.2666667, 0, 1, 1,
0.5489581, 0.3194424, 0.3967927, 0.2705882, 0, 1, 1,
0.5512789, -0.06358743, 2.229277, 0.2784314, 0, 1, 1,
0.5524558, -0.5872164, 0.8592435, 0.282353, 0, 1, 1,
0.552636, -0.7790633, 1.627951, 0.2901961, 0, 1, 1,
0.5531448, 0.5308856, 3.329624, 0.2941177, 0, 1, 1,
0.5536262, 1.474455, -0.01913562, 0.3019608, 0, 1, 1,
0.5568936, -0.4871726, 3.982678, 0.3098039, 0, 1, 1,
0.5642422, -0.3057326, 0.380403, 0.3137255, 0, 1, 1,
0.5649931, -0.1570603, 2.507416, 0.3215686, 0, 1, 1,
0.5713339, -0.7569212, 1.452476, 0.3254902, 0, 1, 1,
0.5727337, 1.303019, -1.527492, 0.3333333, 0, 1, 1,
0.5737037, 0.217843, 1.837463, 0.3372549, 0, 1, 1,
0.5747001, -0.6664379, 1.431844, 0.345098, 0, 1, 1,
0.5754668, -0.294667, 2.43805, 0.3490196, 0, 1, 1,
0.5768834, -0.6804842, 4.048955, 0.3568628, 0, 1, 1,
0.5771338, 0.5598289, -0.1778359, 0.3607843, 0, 1, 1,
0.5798672, 0.9498211, 1.006087, 0.3686275, 0, 1, 1,
0.5818217, 0.4518051, 1.56023, 0.372549, 0, 1, 1,
0.5825914, 0.3789825, 0.9053683, 0.3803922, 0, 1, 1,
0.5830138, 0.07309981, 0.4493396, 0.3843137, 0, 1, 1,
0.5833716, 1.08626, -0.03293757, 0.3921569, 0, 1, 1,
0.583808, -0.6654021, 2.529844, 0.3960784, 0, 1, 1,
0.5905085, -1.672677, 1.058812, 0.4039216, 0, 1, 1,
0.5986966, 0.009072458, 0.7211477, 0.4117647, 0, 1, 1,
0.6182474, -1.708596, 2.153315, 0.4156863, 0, 1, 1,
0.6226526, -0.6238049, 1.754758, 0.4235294, 0, 1, 1,
0.6256244, -0.5648242, 0.9375349, 0.427451, 0, 1, 1,
0.6264074, -0.01546675, 1.494684, 0.4352941, 0, 1, 1,
0.6275681, 0.1537503, 1.095987, 0.4392157, 0, 1, 1,
0.6302471, -0.3448192, 1.733981, 0.4470588, 0, 1, 1,
0.6331043, 1.764104, 0.1917492, 0.4509804, 0, 1, 1,
0.6358322, -0.05890948, 1.277441, 0.4588235, 0, 1, 1,
0.6361576, 0.2082291, 1.219905, 0.4627451, 0, 1, 1,
0.6363178, -0.2874178, 2.064733, 0.4705882, 0, 1, 1,
0.6416203, -0.9246355, 1.656855, 0.4745098, 0, 1, 1,
0.642724, -1.724796, 3.039322, 0.4823529, 0, 1, 1,
0.644353, 0.5177497, -0.9139516, 0.4862745, 0, 1, 1,
0.6446049, 1.220157, 0.8439696, 0.4941176, 0, 1, 1,
0.6450813, -0.5709226, 2.665813, 0.5019608, 0, 1, 1,
0.6520943, 2.133519, 0.9916019, 0.5058824, 0, 1, 1,
0.6531362, 0.5732126, 1.693913, 0.5137255, 0, 1, 1,
0.6539592, -0.8874297, 2.718091, 0.5176471, 0, 1, 1,
0.6547228, 1.425852, -0.08464143, 0.5254902, 0, 1, 1,
0.6657439, -0.2358855, 3.191552, 0.5294118, 0, 1, 1,
0.6665563, 0.7176941, 2.165506, 0.5372549, 0, 1, 1,
0.6721929, 0.1983873, 0.9710377, 0.5411765, 0, 1, 1,
0.6744134, -0.4443765, 2.976896, 0.5490196, 0, 1, 1,
0.675454, -1.549529, 3.449937, 0.5529412, 0, 1, 1,
0.6756566, 0.3604258, -0.4503947, 0.5607843, 0, 1, 1,
0.6789618, -0.2473221, 1.775905, 0.5647059, 0, 1, 1,
0.6818826, -0.05833961, 1.812878, 0.572549, 0, 1, 1,
0.6853594, 0.4962473, 1.555263, 0.5764706, 0, 1, 1,
0.6893911, 0.7251411, -0.7788408, 0.5843138, 0, 1, 1,
0.6901604, -0.443335, 0.8524148, 0.5882353, 0, 1, 1,
0.690831, -1.244318, 3.616605, 0.5960785, 0, 1, 1,
0.695798, -0.3240796, 2.554302, 0.6039216, 0, 1, 1,
0.6968325, -0.5206831, 1.545549, 0.6078432, 0, 1, 1,
0.7044996, -1.38831, 2.961084, 0.6156863, 0, 1, 1,
0.7050294, -0.9434723, 2.124747, 0.6196079, 0, 1, 1,
0.7069159, -0.6188414, 2.860611, 0.627451, 0, 1, 1,
0.7073926, 0.7549285, 0.6376955, 0.6313726, 0, 1, 1,
0.7100265, 0.8631642, 1.230707, 0.6392157, 0, 1, 1,
0.7183783, 0.8437645, -0.4628408, 0.6431373, 0, 1, 1,
0.7190046, -1.053637, 3.158163, 0.6509804, 0, 1, 1,
0.7288756, 0.9057196, 0.3645556, 0.654902, 0, 1, 1,
0.735824, -0.8993138, 0.8997585, 0.6627451, 0, 1, 1,
0.7371773, 0.9648122, 0.4586754, 0.6666667, 0, 1, 1,
0.7414557, -1.421297, 1.660187, 0.6745098, 0, 1, 1,
0.7429318, 1.340493, -0.6403139, 0.6784314, 0, 1, 1,
0.7449948, 1.032105, 0.03428126, 0.6862745, 0, 1, 1,
0.7476391, -0.5422047, 2.826487, 0.6901961, 0, 1, 1,
0.749764, 1.051901, -1.093415, 0.6980392, 0, 1, 1,
0.7639796, -2.190973, 3.105479, 0.7058824, 0, 1, 1,
0.766176, -1.705055, 2.955642, 0.7098039, 0, 1, 1,
0.767844, 0.01481593, 2.024111, 0.7176471, 0, 1, 1,
0.7692454, 1.342812, 1.447041, 0.7215686, 0, 1, 1,
0.7693688, -0.4379758, 3.881898, 0.7294118, 0, 1, 1,
0.770173, 0.2690479, 1.20109, 0.7333333, 0, 1, 1,
0.7732471, -0.3967991, 1.680057, 0.7411765, 0, 1, 1,
0.7782487, -1.702725, 2.505436, 0.7450981, 0, 1, 1,
0.790561, 0.7351745, 0.7760566, 0.7529412, 0, 1, 1,
0.7947561, 0.3458697, 1.219605, 0.7568628, 0, 1, 1,
0.7964996, -0.6773829, 4.125739, 0.7647059, 0, 1, 1,
0.7976606, 0.7985116, 2.103652, 0.7686275, 0, 1, 1,
0.7990146, 1.21508, -0.1091013, 0.7764706, 0, 1, 1,
0.80435, -0.8512288, 4.066982, 0.7803922, 0, 1, 1,
0.8061906, -0.3101973, 0.9120624, 0.7882353, 0, 1, 1,
0.8065383, -0.4009791, 2.367786, 0.7921569, 0, 1, 1,
0.8103992, -0.6762937, 2.325082, 0.8, 0, 1, 1,
0.8288862, -1.870031, 1.932312, 0.8078431, 0, 1, 1,
0.8324129, -0.9826615, 2.670262, 0.8117647, 0, 1, 1,
0.8328571, 0.1732202, 3.09005, 0.8196079, 0, 1, 1,
0.8342875, -0.3151528, 2.28294, 0.8235294, 0, 1, 1,
0.8361398, 0.484302, 1.545373, 0.8313726, 0, 1, 1,
0.8402965, -0.4434879, 1.982664, 0.8352941, 0, 1, 1,
0.8439986, 0.7870052, 0.2470783, 0.8431373, 0, 1, 1,
0.8480479, -0.03010872, 2.51156, 0.8470588, 0, 1, 1,
0.8486497, -0.009333367, 0.2939089, 0.854902, 0, 1, 1,
0.8492859, -2.430622, 3.195423, 0.8588235, 0, 1, 1,
0.850287, 0.3810177, 0.6326535, 0.8666667, 0, 1, 1,
0.8653042, 1.764633, -0.3391732, 0.8705882, 0, 1, 1,
0.8686938, 0.2582622, 1.093313, 0.8784314, 0, 1, 1,
0.8703099, 1.384418, 0.3058584, 0.8823529, 0, 1, 1,
0.8735895, -0.1640635, 1.265211, 0.8901961, 0, 1, 1,
0.8750526, 0.4903846, 2.084094, 0.8941177, 0, 1, 1,
0.8755139, -0.1199264, 0.9746893, 0.9019608, 0, 1, 1,
0.886708, -1.190215, 0.6122526, 0.9098039, 0, 1, 1,
0.8920003, 1.272876, 0.5409147, 0.9137255, 0, 1, 1,
0.89324, -0.5951498, 2.956319, 0.9215686, 0, 1, 1,
0.8942601, 0.5781716, 1.725628, 0.9254902, 0, 1, 1,
0.8979192, 0.08659157, 1.115806, 0.9333333, 0, 1, 1,
0.8981516, -0.1915866, 2.207437, 0.9372549, 0, 1, 1,
0.9062303, -2.240952, 4.281934, 0.945098, 0, 1, 1,
0.9076192, 1.118917, 1.76546, 0.9490196, 0, 1, 1,
0.9117815, -0.03453214, 1.784016, 0.9568627, 0, 1, 1,
0.9206136, 0.9125744, 2.27152, 0.9607843, 0, 1, 1,
0.9278941, 1.146615, 0.1045484, 0.9686275, 0, 1, 1,
0.9299548, 2.011235, 0.9632784, 0.972549, 0, 1, 1,
0.9318773, -0.3009702, 0.5780909, 0.9803922, 0, 1, 1,
0.9341771, -0.5873463, 4.007648, 0.9843137, 0, 1, 1,
0.9393297, -0.8792373, 0.9277731, 0.9921569, 0, 1, 1,
0.9418243, 0.4608256, 3.032871, 0.9960784, 0, 1, 1,
0.9479424, 0.6063405, 1.894936, 1, 0, 0.9960784, 1,
0.9553638, 1.150573, 2.459168, 1, 0, 0.9882353, 1,
0.957383, -1.237521, 2.46656, 1, 0, 0.9843137, 1,
0.9640261, 0.2376107, 1.971557, 1, 0, 0.9764706, 1,
0.9785898, -1.057899, 3.514551, 1, 0, 0.972549, 1,
0.9878669, -0.7217246, 2.158486, 1, 0, 0.9647059, 1,
0.999958, 1.061424, 0.127626, 1, 0, 0.9607843, 1,
1.000595, -0.3927777, 1.033751, 1, 0, 0.9529412, 1,
1.00639, -0.6048341, 3.004826, 1, 0, 0.9490196, 1,
1.009581, -1.325967, 2.659321, 1, 0, 0.9411765, 1,
1.018597, -0.06083749, 2.057275, 1, 0, 0.9372549, 1,
1.029041, 0.7115247, 1.735007, 1, 0, 0.9294118, 1,
1.033787, 0.2785273, 0.8023213, 1, 0, 0.9254902, 1,
1.03729, -1.084812, 3.867513, 1, 0, 0.9176471, 1,
1.044595, -1.237752, 1.710389, 1, 0, 0.9137255, 1,
1.045477, -0.904885, 3.268236, 1, 0, 0.9058824, 1,
1.05292, -0.9183692, 0.5116626, 1, 0, 0.9019608, 1,
1.056798, -0.5967676, 3.582651, 1, 0, 0.8941177, 1,
1.057211, -1.829162, 3.432956, 1, 0, 0.8862745, 1,
1.058477, 1.633865, 0.2684056, 1, 0, 0.8823529, 1,
1.059605, -1.531627, 1.744353, 1, 0, 0.8745098, 1,
1.061306, -0.2836508, 2.919559, 1, 0, 0.8705882, 1,
1.063668, 1.526078, 2.380788, 1, 0, 0.8627451, 1,
1.073694, -2.229209, 2.976653, 1, 0, 0.8588235, 1,
1.075858, -0.2963406, 2.457785, 1, 0, 0.8509804, 1,
1.077791, -0.1042355, 2.182088, 1, 0, 0.8470588, 1,
1.078392, -1.459602, 2.676292, 1, 0, 0.8392157, 1,
1.079241, -0.5770637, 1.839758, 1, 0, 0.8352941, 1,
1.087102, 0.4232861, 3.248191, 1, 0, 0.827451, 1,
1.087861, -0.03892566, 1.950885, 1, 0, 0.8235294, 1,
1.090337, 0.1066669, 1.709692, 1, 0, 0.8156863, 1,
1.09512, 0.09034041, 1.568057, 1, 0, 0.8117647, 1,
1.099417, -1.483348, 2.407324, 1, 0, 0.8039216, 1,
1.1067, 1.603112, 0.3075542, 1, 0, 0.7960784, 1,
1.107269, 0.6245669, 0.008312222, 1, 0, 0.7921569, 1,
1.117555, 0.2867039, 2.345808, 1, 0, 0.7843137, 1,
1.122122, 0.9842896, -1.231916, 1, 0, 0.7803922, 1,
1.125139, 0.8115352, 1.640656, 1, 0, 0.772549, 1,
1.128159, 0.3077148, 1.328502, 1, 0, 0.7686275, 1,
1.135322, -0.7899613, 1.96704, 1, 0, 0.7607843, 1,
1.141187, -1.309898, 2.830111, 1, 0, 0.7568628, 1,
1.166662, -1.19792, 3.037433, 1, 0, 0.7490196, 1,
1.168202, 0.4566586, 0.3713714, 1, 0, 0.7450981, 1,
1.173046, -0.05872837, 2.566194, 1, 0, 0.7372549, 1,
1.192073, 0.4946007, 0.4902264, 1, 0, 0.7333333, 1,
1.193916, 0.02043131, 1.777711, 1, 0, 0.7254902, 1,
1.204144, -1.030058, 1.998534, 1, 0, 0.7215686, 1,
1.205956, 0.6853023, 1.697545, 1, 0, 0.7137255, 1,
1.218192, 1.613595, 1.496752, 1, 0, 0.7098039, 1,
1.224795, -1.411971, 1.777662, 1, 0, 0.7019608, 1,
1.227906, -0.6790504, 2.320809, 1, 0, 0.6941177, 1,
1.233126, 1.177986, 1.824521, 1, 0, 0.6901961, 1,
1.240822, 0.08948928, 1.883412, 1, 0, 0.682353, 1,
1.249851, -0.7780889, 1.052828, 1, 0, 0.6784314, 1,
1.267419, -1.051105, 3.455359, 1, 0, 0.6705883, 1,
1.270447, 0.2054042, 2.133304, 1, 0, 0.6666667, 1,
1.275035, -0.1841072, 3.092073, 1, 0, 0.6588235, 1,
1.275281, -0.4179529, 3.316722, 1, 0, 0.654902, 1,
1.279847, 0.6337864, 1.809009, 1, 0, 0.6470588, 1,
1.291051, 0.6057575, 1.201585, 1, 0, 0.6431373, 1,
1.292565, -0.03059838, 2.277761, 1, 0, 0.6352941, 1,
1.300324, 1.644106, -1.212044, 1, 0, 0.6313726, 1,
1.302864, 0.9963672, 0.8474422, 1, 0, 0.6235294, 1,
1.312022, 1.139938, 1.320545, 1, 0, 0.6196079, 1,
1.321691, 0.8362122, 0.977825, 1, 0, 0.6117647, 1,
1.322026, -1.628124, 3.390227, 1, 0, 0.6078432, 1,
1.329459, -0.750573, 3.064361, 1, 0, 0.6, 1,
1.334995, 0.8064082, -0.01802679, 1, 0, 0.5921569, 1,
1.337787, -1.298778, 2.349311, 1, 0, 0.5882353, 1,
1.338034, -0.8694175, 2.811517, 1, 0, 0.5803922, 1,
1.339848, 0.5773049, 1.479876, 1, 0, 0.5764706, 1,
1.340212, 2.576276, -0.7587985, 1, 0, 0.5686275, 1,
1.35363, -0.1033711, 0.2612846, 1, 0, 0.5647059, 1,
1.359733, 0.4957379, 0.03238826, 1, 0, 0.5568628, 1,
1.364339, -0.9081429, 2.387829, 1, 0, 0.5529412, 1,
1.364893, -0.04703741, 2.805051, 1, 0, 0.5450981, 1,
1.367883, 0.2992472, -0.1016049, 1, 0, 0.5411765, 1,
1.375213, -0.05693751, 1.389552, 1, 0, 0.5333334, 1,
1.377551, 0.1651103, 2.996326, 1, 0, 0.5294118, 1,
1.380437, -0.8918797, 3.024807, 1, 0, 0.5215687, 1,
1.389906, 0.5826765, 1.551314, 1, 0, 0.5176471, 1,
1.398288, -0.6344643, 3.565933, 1, 0, 0.509804, 1,
1.4103, -0.1784922, -0.8075954, 1, 0, 0.5058824, 1,
1.418495, 0.5135957, 1.074183, 1, 0, 0.4980392, 1,
1.428282, -1.130073, 0.9590715, 1, 0, 0.4901961, 1,
1.435857, 0.7185315, 1.345836, 1, 0, 0.4862745, 1,
1.438441, 0.5777722, -0.9901366, 1, 0, 0.4784314, 1,
1.441312, 1.200541, 0.3278229, 1, 0, 0.4745098, 1,
1.441942, -1.278571, 2.882286, 1, 0, 0.4666667, 1,
1.442488, -1.074911, 1.789069, 1, 0, 0.4627451, 1,
1.444189, -1.014239, 2.012959, 1, 0, 0.454902, 1,
1.446884, 0.6152484, -1.243845, 1, 0, 0.4509804, 1,
1.459394, 0.06572853, 2.006191, 1, 0, 0.4431373, 1,
1.461784, 1.192766, 1.619645, 1, 0, 0.4392157, 1,
1.461968, -0.1131719, -0.02713721, 1, 0, 0.4313726, 1,
1.463075, 0.06615616, 2.941448, 1, 0, 0.427451, 1,
1.469118, 0.1385916, 0.4990583, 1, 0, 0.4196078, 1,
1.47557, 0.8026346, 1.011258, 1, 0, 0.4156863, 1,
1.475965, -0.7955241, 1.89442, 1, 0, 0.4078431, 1,
1.477337, 0.3925, -0.132627, 1, 0, 0.4039216, 1,
1.486274, -0.2070808, 0.808297, 1, 0, 0.3960784, 1,
1.502607, 0.3218488, 3.555827, 1, 0, 0.3882353, 1,
1.508893, 1.50478, -0.9648877, 1, 0, 0.3843137, 1,
1.509838, 1.866554, -0.2046624, 1, 0, 0.3764706, 1,
1.512068, -1.660318, 3.916937, 1, 0, 0.372549, 1,
1.525156, 0.7992203, 1.065081, 1, 0, 0.3647059, 1,
1.539982, -0.8469819, 2.250438, 1, 0, 0.3607843, 1,
1.550041, -1.830507, 2.61677, 1, 0, 0.3529412, 1,
1.556472, 1.337312, 1.110846, 1, 0, 0.3490196, 1,
1.563403, -0.7327892, 2.855271, 1, 0, 0.3411765, 1,
1.576864, 0.2681987, 0.8544902, 1, 0, 0.3372549, 1,
1.579663, -0.0007147811, -0.04623636, 1, 0, 0.3294118, 1,
1.584769, -0.6462232, 1.628048, 1, 0, 0.3254902, 1,
1.59562, 1.634689, 0.2388547, 1, 0, 0.3176471, 1,
1.596611, -2.37312, 2.605511, 1, 0, 0.3137255, 1,
1.596797, 1.42636, 0.5266802, 1, 0, 0.3058824, 1,
1.597861, 0.5927674, 3.12904, 1, 0, 0.2980392, 1,
1.603294, -0.5225657, 1.900762, 1, 0, 0.2941177, 1,
1.630083, 0.8881024, 1.324176, 1, 0, 0.2862745, 1,
1.640925, -0.4382302, 1.949416, 1, 0, 0.282353, 1,
1.650278, -0.5490761, 2.186022, 1, 0, 0.2745098, 1,
1.68197, 0.5299404, 0.7800095, 1, 0, 0.2705882, 1,
1.697063, -0.3667903, 0.7399848, 1, 0, 0.2627451, 1,
1.704351, 0.4367145, 1.116091, 1, 0, 0.2588235, 1,
1.710866, 1.025406, 1.855023, 1, 0, 0.2509804, 1,
1.71592, 0.7601431, 2.149594, 1, 0, 0.2470588, 1,
1.753807, -0.3800621, 1.225088, 1, 0, 0.2392157, 1,
1.784104, -0.2403155, 1.841256, 1, 0, 0.2352941, 1,
1.804087, -0.8007538, -0.1550268, 1, 0, 0.227451, 1,
1.812806, -0.9456911, 0.6762499, 1, 0, 0.2235294, 1,
1.834469, 0.9310102, 2.582746, 1, 0, 0.2156863, 1,
1.856224, -1.016289, 3.649423, 1, 0, 0.2117647, 1,
1.863413, 0.9881684, 0.626606, 1, 0, 0.2039216, 1,
1.873459, 0.5330826, -0.1699083, 1, 0, 0.1960784, 1,
1.884727, -1.119747, 0.9471468, 1, 0, 0.1921569, 1,
1.891596, 0.7290322, 1.047662, 1, 0, 0.1843137, 1,
1.906856, -1.063007, 3.377498, 1, 0, 0.1803922, 1,
1.95908, 0.07081591, 1.074724, 1, 0, 0.172549, 1,
1.959572, -0.4188277, 2.218641, 1, 0, 0.1686275, 1,
1.969314, -0.1017963, 2.654429, 1, 0, 0.1607843, 1,
1.980904, -0.8180304, 2.34371, 1, 0, 0.1568628, 1,
2.007287, -1.11283, 0.6952168, 1, 0, 0.1490196, 1,
2.014295, 0.1355528, 1.434925, 1, 0, 0.145098, 1,
2.016163, 1.423584, 1.105774, 1, 0, 0.1372549, 1,
2.018019, -0.7635739, 0.6342866, 1, 0, 0.1333333, 1,
2.021704, 0.0611156, 0.5895585, 1, 0, 0.1254902, 1,
2.070531, -0.5267879, 1.120021, 1, 0, 0.1215686, 1,
2.090494, 2.095893, -0.4276802, 1, 0, 0.1137255, 1,
2.114795, -2.131598, 1.637938, 1, 0, 0.1098039, 1,
2.195223, -0.4969459, 0.07940523, 1, 0, 0.1019608, 1,
2.280671, 1.24602, 0.1520597, 1, 0, 0.09411765, 1,
2.293729, -0.5538496, 1.465032, 1, 0, 0.09019608, 1,
2.372136, -1.186099, 3.297475, 1, 0, 0.08235294, 1,
2.417853, 2.261608, -1.284747, 1, 0, 0.07843138, 1,
2.449906, -0.2394116, -0.5514587, 1, 0, 0.07058824, 1,
2.505936, -1.191461, 2.60914, 1, 0, 0.06666667, 1,
2.572352, 0.1746661, 2.319901, 1, 0, 0.05882353, 1,
2.621988, 0.6818841, -0.5247391, 1, 0, 0.05490196, 1,
2.628537, 0.04674255, 2.17417, 1, 0, 0.04705882, 1,
2.641183, 1.291207, 1.103096, 1, 0, 0.04313726, 1,
2.655257, -1.196231, 3.115012, 1, 0, 0.03529412, 1,
2.734244, 0.3835398, 1.472383, 1, 0, 0.03137255, 1,
2.73622, 0.4053769, 1.458422, 1, 0, 0.02352941, 1,
2.85193, -0.7807945, 1.629722, 1, 0, 0.01960784, 1,
2.965752, 0.4970591, 3.186211, 1, 0, 0.01176471, 1,
3.64706, 1.586028, 1.366462, 1, 0, 0.007843138, 1
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
0.1472067, -4.365641, -8.367064, 0, -0.5, 0.5, 0.5,
0.1472067, -4.365641, -8.367064, 1, -0.5, 0.5, 0.5,
0.1472067, -4.365641, -8.367064, 1, 1.5, 0.5, 0.5,
0.1472067, -4.365641, -8.367064, 0, 1.5, 0.5, 0.5
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
-4.539096, -0.1676906, -8.367064, 0, -0.5, 0.5, 0.5,
-4.539096, -0.1676906, -8.367064, 1, -0.5, 0.5, 0.5,
-4.539096, -0.1676906, -8.367064, 1, 1.5, 0.5, 0.5,
-4.539096, -0.1676906, -8.367064, 0, 1.5, 0.5, 0.5
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
-4.539096, -4.365641, -0.5927134, 0, -0.5, 0.5, 0.5,
-4.539096, -4.365641, -0.5927134, 1, -0.5, 0.5, 0.5,
-4.539096, -4.365641, -0.5927134, 1, 1.5, 0.5, 0.5,
-4.539096, -4.365641, -0.5927134, 0, 1.5, 0.5, 0.5
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
-3, -3.396883, -6.572982,
3, -3.396883, -6.572982,
-3, -3.396883, -6.572982,
-3, -3.558343, -6.871996,
-2, -3.396883, -6.572982,
-2, -3.558343, -6.871996,
-1, -3.396883, -6.572982,
-1, -3.558343, -6.871996,
0, -3.396883, -6.572982,
0, -3.558343, -6.871996,
1, -3.396883, -6.572982,
1, -3.558343, -6.871996,
2, -3.396883, -6.572982,
2, -3.558343, -6.871996,
3, -3.396883, -6.572982,
3, -3.558343, -6.871996
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
-3, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
-3, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
-3, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
-3, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
-2, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
-2, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
-2, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
-2, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
-1, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
-1, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
-1, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
-1, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
0, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
0, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
0, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
0, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
1, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
1, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
1, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
1, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
2, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
2, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
2, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
2, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5,
3, -3.881262, -7.470023, 0, -0.5, 0.5, 0.5,
3, -3.881262, -7.470023, 1, -0.5, 0.5, 0.5,
3, -3.881262, -7.470023, 1, 1.5, 0.5, 0.5,
3, -3.881262, -7.470023, 0, 1.5, 0.5, 0.5
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
-3.457642, -3, -6.572982,
-3.457642, 2, -6.572982,
-3.457642, -3, -6.572982,
-3.637884, -3, -6.871996,
-3.457642, -2, -6.572982,
-3.637884, -2, -6.871996,
-3.457642, -1, -6.572982,
-3.637884, -1, -6.871996,
-3.457642, 0, -6.572982,
-3.637884, 0, -6.871996,
-3.457642, 1, -6.572982,
-3.637884, 1, -6.871996,
-3.457642, 2, -6.572982,
-3.637884, 2, -6.871996
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
-3.998369, -3, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, -3, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, -3, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, -3, -7.470023, 0, 1.5, 0.5, 0.5,
-3.998369, -2, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, -2, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, -2, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, -2, -7.470023, 0, 1.5, 0.5, 0.5,
-3.998369, -1, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, -1, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, -1, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, -1, -7.470023, 0, 1.5, 0.5, 0.5,
-3.998369, 0, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, 0, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, 0, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, 0, -7.470023, 0, 1.5, 0.5, 0.5,
-3.998369, 1, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, 1, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, 1, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, 1, -7.470023, 0, 1.5, 0.5, 0.5,
-3.998369, 2, -7.470023, 0, -0.5, 0.5, 0.5,
-3.998369, 2, -7.470023, 1, -0.5, 0.5, 0.5,
-3.998369, 2, -7.470023, 1, 1.5, 0.5, 0.5,
-3.998369, 2, -7.470023, 0, 1.5, 0.5, 0.5
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
-3.457642, -3.396883, -6,
-3.457642, -3.396883, 4,
-3.457642, -3.396883, -6,
-3.637884, -3.558343, -6,
-3.457642, -3.396883, -4,
-3.637884, -3.558343, -4,
-3.457642, -3.396883, -2,
-3.637884, -3.558343, -2,
-3.457642, -3.396883, 0,
-3.637884, -3.558343, 0,
-3.457642, -3.396883, 2,
-3.637884, -3.558343, 2,
-3.457642, -3.396883, 4,
-3.637884, -3.558343, 4
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
"-6",
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
-3.998369, -3.881262, -6, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -6, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -6, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, -6, 0, 1.5, 0.5, 0.5,
-3.998369, -3.881262, -4, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -4, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -4, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, -4, 0, 1.5, 0.5, 0.5,
-3.998369, -3.881262, -2, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -2, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, -2, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, -2, 0, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 0, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 0, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 0, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 0, 0, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 2, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 2, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 2, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 2, 0, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 4, 0, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 4, 1, -0.5, 0.5, 0.5,
-3.998369, -3.881262, 4, 1, 1.5, 0.5, 0.5,
-3.998369, -3.881262, 4, 0, 1.5, 0.5, 0.5
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
-3.457642, -3.396883, -6.572982,
-3.457642, 3.061502, -6.572982,
-3.457642, -3.396883, 5.387556,
-3.457642, 3.061502, 5.387556,
-3.457642, -3.396883, -6.572982,
-3.457642, -3.396883, 5.387556,
-3.457642, 3.061502, -6.572982,
-3.457642, 3.061502, 5.387556,
-3.457642, -3.396883, -6.572982,
3.752055, -3.396883, -6.572982,
-3.457642, -3.396883, 5.387556,
3.752055, -3.396883, 5.387556,
-3.457642, 3.061502, -6.572982,
3.752055, 3.061502, -6.572982,
-3.457642, 3.061502, 5.387556,
3.752055, 3.061502, 5.387556,
3.752055, -3.396883, -6.572982,
3.752055, 3.061502, -6.572982,
3.752055, -3.396883, 5.387556,
3.752055, 3.061502, 5.387556,
3.752055, -3.396883, -6.572982,
3.752055, -3.396883, 5.387556,
3.752055, 3.061502, -6.572982,
3.752055, 3.061502, 5.387556
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
var radius = 8.216102;
var distance = 36.55437;
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
mvMatrix.translate( -0.1472067, 0.1676906, 0.5927134 );
mvMatrix.scale( 1.232148, 1.375485, 0.7427267 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55437);
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
diflufenican<-read.table("diflufenican.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diflufenican$V2
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
```

```r
y<-diflufenican$V3
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
```

```r
z<-diflufenican$V4
```

```
## Error in eval(expr, envir, enclos): object 'diflufenican' not found
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
-3.352646, 1.578217, -1.392764, 0, 0, 1, 1, 1,
-3.323808, 1.264136, -1.970996, 1, 0, 0, 1, 1,
-2.789897, -0.4202699, -1.620858, 1, 0, 0, 1, 1,
-2.710316, 0.3046847, -2.312803, 1, 0, 0, 1, 1,
-2.63896, -0.4744509, -3.759661, 1, 0, 0, 1, 1,
-2.619292, -1.027649, -1.361163, 1, 0, 0, 1, 1,
-2.601171, 0.1125304, -2.68064, 0, 0, 0, 1, 1,
-2.538116, 0.08956724, -2.552929, 0, 0, 0, 1, 1,
-2.535746, 2.172474, -0.7583901, 0, 0, 0, 1, 1,
-2.352776, 1.00784, -2.327501, 0, 0, 0, 1, 1,
-2.340356, -1.05165, -1.658807, 0, 0, 0, 1, 1,
-2.231632, 0.1485792, -0.6412014, 0, 0, 0, 1, 1,
-2.202361, -0.2722453, -2.930612, 0, 0, 0, 1, 1,
-2.090956, 1.398384, -1.902152, 1, 1, 1, 1, 1,
-2.067859, -1.532863, -3.091633, 1, 1, 1, 1, 1,
-2.052339, -1.614079, -3.566936, 1, 1, 1, 1, 1,
-2.015254, -0.1356442, -4.102671, 1, 1, 1, 1, 1,
-1.992127, 0.3334992, -0.05459467, 1, 1, 1, 1, 1,
-1.971086, -0.234899, -0.5015488, 1, 1, 1, 1, 1,
-1.924017, 1.522475, -0.6246618, 1, 1, 1, 1, 1,
-1.904284, 0.1342068, -2.422148, 1, 1, 1, 1, 1,
-1.863598, -0.04786954, -0.3773601, 1, 1, 1, 1, 1,
-1.856418, -0.3493705, -1.115239, 1, 1, 1, 1, 1,
-1.84994, -0.2553033, -3.079061, 1, 1, 1, 1, 1,
-1.848952, -0.3563018, -2.946821, 1, 1, 1, 1, 1,
-1.837875, 1.733273, -0.04667535, 1, 1, 1, 1, 1,
-1.815357, 0.1926436, -1.815, 1, 1, 1, 1, 1,
-1.8084, -0.223634, -2.103272, 1, 1, 1, 1, 1,
-1.794266, 0.7178482, -1.938176, 0, 0, 1, 1, 1,
-1.787375, -0.003760359, -0.1825204, 1, 0, 0, 1, 1,
-1.786943, -2.265367, -2.704329, 1, 0, 0, 1, 1,
-1.786864, 2.204586, -2.455408, 1, 0, 0, 1, 1,
-1.773107, 0.5139084, -1.135493, 1, 0, 0, 1, 1,
-1.750501, -0.5083076, -1.420149, 1, 0, 0, 1, 1,
-1.726568, 1.955276, -0.6983574, 0, 0, 0, 1, 1,
-1.70594, 0.4923466, -1.859247, 0, 0, 0, 1, 1,
-1.651885, -0.5626666, -0.1070125, 0, 0, 0, 1, 1,
-1.649694, 0.20666, -1.115152, 0, 0, 0, 1, 1,
-1.645365, -0.3389329, -2.72456, 0, 0, 0, 1, 1,
-1.634099, 0.9299514, -1.447939, 0, 0, 0, 1, 1,
-1.63306, 0.9409982, -0.9766898, 0, 0, 0, 1, 1,
-1.565386, -2.068163, -1.278513, 1, 1, 1, 1, 1,
-1.555455, -2.532532, -3.206249, 1, 1, 1, 1, 1,
-1.548404, 0.1750124, -0.8864356, 1, 1, 1, 1, 1,
-1.547091, -1.740576, -2.577016, 1, 1, 1, 1, 1,
-1.543834, -0.6767247, -0.5243063, 1, 1, 1, 1, 1,
-1.543145, -0.3952511, -1.529194, 1, 1, 1, 1, 1,
-1.54009, 0.1623781, -1.044615, 1, 1, 1, 1, 1,
-1.521506, -1.83998, -3.801947, 1, 1, 1, 1, 1,
-1.51552, -1.561503, -2.117605, 1, 1, 1, 1, 1,
-1.512648, 0.04650003, -0.6932175, 1, 1, 1, 1, 1,
-1.509797, 1.17005, 0.9956768, 1, 1, 1, 1, 1,
-1.500893, 1.026259, -0.6306937, 1, 1, 1, 1, 1,
-1.480983, 1.079133, -0.8695416, 1, 1, 1, 1, 1,
-1.477696, 0.3799494, -3.236536, 1, 1, 1, 1, 1,
-1.476536, -0.9852122, -2.462169, 1, 1, 1, 1, 1,
-1.474417, -0.2302047, -2.859045, 0, 0, 1, 1, 1,
-1.472518, 0.1025166, -4.222751, 1, 0, 0, 1, 1,
-1.471484, -0.6677694, -1.663785, 1, 0, 0, 1, 1,
-1.470763, -0.5780241, -2.251259, 1, 0, 0, 1, 1,
-1.457121, 0.358935, -0.9301006, 1, 0, 0, 1, 1,
-1.452762, -1.158548, -2.335691, 1, 0, 0, 1, 1,
-1.451963, 1.449874, 0.6560658, 0, 0, 0, 1, 1,
-1.449038, -0.5034817, -2.550709, 0, 0, 0, 1, 1,
-1.439633, 0.3453078, -2.709217, 0, 0, 0, 1, 1,
-1.437845, -0.6553463, -2.869949, 0, 0, 0, 1, 1,
-1.434749, -1.1994, -3.314011, 0, 0, 0, 1, 1,
-1.43461, -0.5857784, -1.341684, 0, 0, 0, 1, 1,
-1.432579, 0.2805114, -3.273471, 0, 0, 0, 1, 1,
-1.430512, -0.1244431, -0.237655, 1, 1, 1, 1, 1,
-1.428879, -0.5247376, 0.2022222, 1, 1, 1, 1, 1,
-1.413064, -0.06603721, -0.2674632, 1, 1, 1, 1, 1,
-1.404283, -1.445631, -3.415329, 1, 1, 1, 1, 1,
-1.396805, 0.6168197, -0.03624338, 1, 1, 1, 1, 1,
-1.394248, -2.374529, -2.570672, 1, 1, 1, 1, 1,
-1.386825, -1.680457, -1.704781, 1, 1, 1, 1, 1,
-1.375797, 0.2870454, -1.70931, 1, 1, 1, 1, 1,
-1.37459, -1.606942, -2.673799, 1, 1, 1, 1, 1,
-1.361072, -1.562261, -2.655266, 1, 1, 1, 1, 1,
-1.360272, 0.1943097, -1.128232, 1, 1, 1, 1, 1,
-1.353271, -1.914865, -1.799286, 1, 1, 1, 1, 1,
-1.351012, -0.5919352, -1.62707, 1, 1, 1, 1, 1,
-1.346138, 0.7909443, -0.532171, 1, 1, 1, 1, 1,
-1.345735, 1.682449, -0.3049454, 1, 1, 1, 1, 1,
-1.344579, -0.3346972, -3.176445, 0, 0, 1, 1, 1,
-1.343523, 0.3625829, -1.15892, 1, 0, 0, 1, 1,
-1.341893, 0.3444898, -2.216099, 1, 0, 0, 1, 1,
-1.339448, -0.2078105, -3.497161, 1, 0, 0, 1, 1,
-1.339408, -0.3321817, -3.455707, 1, 0, 0, 1, 1,
-1.331739, 0.3760898, -0.8993321, 1, 0, 0, 1, 1,
-1.32881, 0.4642121, -2.329235, 0, 0, 0, 1, 1,
-1.325839, -0.1837114, -0.6259868, 0, 0, 0, 1, 1,
-1.325036, -0.5628794, -0.7207742, 0, 0, 0, 1, 1,
-1.306802, -1.388163, -2.723533, 0, 0, 0, 1, 1,
-1.30643, -0.9171811, -0.6274216, 0, 0, 0, 1, 1,
-1.303175, -1.493222, -2.117305, 0, 0, 0, 1, 1,
-1.294828, 1.904319, -1.85523, 0, 0, 0, 1, 1,
-1.290438, -1.604161, -1.81808, 1, 1, 1, 1, 1,
-1.277743, 1.469502, -1.563431, 1, 1, 1, 1, 1,
-1.275033, -0.2196608, -2.426252, 1, 1, 1, 1, 1,
-1.274675, 0.100585, -1.0671, 1, 1, 1, 1, 1,
-1.259759, -2.349251, -3.275363, 1, 1, 1, 1, 1,
-1.25901, 2.053895, -1.575167, 1, 1, 1, 1, 1,
-1.252738, -0.5410157, -2.850912, 1, 1, 1, 1, 1,
-1.247344, 0.1223186, -1.152005, 1, 1, 1, 1, 1,
-1.246324, -0.5226926, -0.7750949, 1, 1, 1, 1, 1,
-1.238265, 0.3962821, -0.3087768, 1, 1, 1, 1, 1,
-1.237725, -1.535356, -1.488736, 1, 1, 1, 1, 1,
-1.237296, -0.4497055, -3.220589, 1, 1, 1, 1, 1,
-1.229545, -0.4035567, -1.985692, 1, 1, 1, 1, 1,
-1.224653, -1.574802, -2.435785, 1, 1, 1, 1, 1,
-1.19882, 0.9358568, -0.2598684, 1, 1, 1, 1, 1,
-1.197163, 2.458573, -1.709084, 0, 0, 1, 1, 1,
-1.193786, 0.132144, -0.9794939, 1, 0, 0, 1, 1,
-1.180777, 0.316843, -1.280266, 1, 0, 0, 1, 1,
-1.177588, 0.4648766, 0.2186653, 1, 0, 0, 1, 1,
-1.167229, 2.158383, -0.4207692, 1, 0, 0, 1, 1,
-1.163163, 1.211547, -1.765534, 1, 0, 0, 1, 1,
-1.162558, -0.5631217, -2.832034, 0, 0, 0, 1, 1,
-1.162108, -2.980828, -2.503161, 0, 0, 0, 1, 1,
-1.145533, 0.3718453, -1.485178, 0, 0, 0, 1, 1,
-1.13675, 1.966888, -2.400003, 0, 0, 0, 1, 1,
-1.130512, -1.872566, -1.4356, 0, 0, 0, 1, 1,
-1.128525, -0.8516263, -2.875992, 0, 0, 0, 1, 1,
-1.122348, -1.971027, -1.187112, 0, 0, 0, 1, 1,
-1.121708, 0.06579755, -1.664741, 1, 1, 1, 1, 1,
-1.114656, -1.276851, -3.584842, 1, 1, 1, 1, 1,
-1.114576, 0.1638057, -2.075778, 1, 1, 1, 1, 1,
-1.112091, 1.919952, -1.393902, 1, 1, 1, 1, 1,
-1.100781, 0.2065906, -1.208842, 1, 1, 1, 1, 1,
-1.077761, 0.3215577, 0.1751365, 1, 1, 1, 1, 1,
-1.075601, -1.463934, -1.255254, 1, 1, 1, 1, 1,
-1.074003, -1.06618, -4.854976, 1, 1, 1, 1, 1,
-1.071811, 0.7190207, -3.487751, 1, 1, 1, 1, 1,
-1.071802, -0.9640856, -4.02119, 1, 1, 1, 1, 1,
-1.064942, 1.12091, -0.3887393, 1, 1, 1, 1, 1,
-1.063844, 0.5756602, -0.8927277, 1, 1, 1, 1, 1,
-1.060875, -0.25691, -0.8431917, 1, 1, 1, 1, 1,
-1.040361, 0.4771132, -1.942953, 1, 1, 1, 1, 1,
-1.021795, 0.4760396, -1.78501, 1, 1, 1, 1, 1,
-1.017893, 0.4292862, 0.2565028, 0, 0, 1, 1, 1,
-1.00766, 0.8787709, -2.052127, 1, 0, 0, 1, 1,
-1.007249, 1.052244, -1.426717, 1, 0, 0, 1, 1,
-1.002087, -0.4660532, -3.336302, 1, 0, 0, 1, 1,
-0.9961412, 0.5406511, 0.8324013, 1, 0, 0, 1, 1,
-0.9944856, 0.126835, -2.240242, 1, 0, 0, 1, 1,
-0.9915575, -0.7070068, -2.941262, 0, 0, 0, 1, 1,
-0.9907727, 0.7512931, 0.1062404, 0, 0, 0, 1, 1,
-0.9895414, 0.4892755, 0.2993196, 0, 0, 0, 1, 1,
-0.9890952, 0.6410493, 0.9056822, 0, 0, 0, 1, 1,
-0.9817547, 1.872271, 0.2328012, 0, 0, 0, 1, 1,
-0.9792529, 0.4373075, -2.603159, 0, 0, 0, 1, 1,
-0.9758188, -0.6239948, -1.368397, 0, 0, 0, 1, 1,
-0.9745925, 0.2920662, -0.0184554, 1, 1, 1, 1, 1,
-0.9649591, -0.09429854, -3.630512, 1, 1, 1, 1, 1,
-0.9634114, -0.9392388, -3.085958, 1, 1, 1, 1, 1,
-0.9624978, -1.257064, -1.729334, 1, 1, 1, 1, 1,
-0.9624118, -0.4884661, -2.976886, 1, 1, 1, 1, 1,
-0.9587494, -0.1550883, -0.2706416, 1, 1, 1, 1, 1,
-0.9580543, 0.4767774, 1.246901, 1, 1, 1, 1, 1,
-0.9516364, 1.171739, 1.164663, 1, 1, 1, 1, 1,
-0.950203, 0.5293995, -1.545336, 1, 1, 1, 1, 1,
-0.9473689, -0.1139136, -0.3491006, 1, 1, 1, 1, 1,
-0.9467491, 0.3692832, -1.495612, 1, 1, 1, 1, 1,
-0.9462482, 0.1114572, -2.220258, 1, 1, 1, 1, 1,
-0.9455545, -0.03574394, -1.131469, 1, 1, 1, 1, 1,
-0.9439695, -1.170804, -2.765704, 1, 1, 1, 1, 1,
-0.9391947, -0.2738814, -2.053435, 1, 1, 1, 1, 1,
-0.936077, 0.2421921, -1.369921, 0, 0, 1, 1, 1,
-0.9354421, 1.053129, 0.4209473, 1, 0, 0, 1, 1,
-0.9353727, 0.7640305, -0.4245524, 1, 0, 0, 1, 1,
-0.9229023, -0.1848259, -0.8265302, 1, 0, 0, 1, 1,
-0.9179708, 1.192005, 0.3345392, 1, 0, 0, 1, 1,
-0.9138469, 1.193177, 0.1501552, 1, 0, 0, 1, 1,
-0.9126883, -1.569093, -1.930361, 0, 0, 0, 1, 1,
-0.9098059, -0.5454434, -0.2029422, 0, 0, 0, 1, 1,
-0.9090883, 1.546453, -0.1255165, 0, 0, 0, 1, 1,
-0.8977689, 0.4939897, -2.687325, 0, 0, 0, 1, 1,
-0.8961262, 0.4689597, -0.02393757, 0, 0, 0, 1, 1,
-0.8843958, 1.352642, 0.0532129, 0, 0, 0, 1, 1,
-0.882609, -0.4256305, -1.42878, 0, 0, 0, 1, 1,
-0.8776636, -2.060285, -3.205653, 1, 1, 1, 1, 1,
-0.8737175, 1.875653, 0.238728, 1, 1, 1, 1, 1,
-0.8721728, 1.2964, -1.071444, 1, 1, 1, 1, 1,
-0.8709776, -0.3758362, -2.008888, 1, 1, 1, 1, 1,
-0.8652692, -0.4665047, -1.630023, 1, 1, 1, 1, 1,
-0.8607375, -0.5446582, -2.691095, 1, 1, 1, 1, 1,
-0.8571561, -0.05976266, -2.609211, 1, 1, 1, 1, 1,
-0.8544396, -1.44606, -3.86287, 1, 1, 1, 1, 1,
-0.852017, 0.03197309, -0.3414288, 1, 1, 1, 1, 1,
-0.8439991, -0.3543245, -2.569724, 1, 1, 1, 1, 1,
-0.8420156, 0.3337952, -1.897447, 1, 1, 1, 1, 1,
-0.8418019, 1.273786, 0.3025937, 1, 1, 1, 1, 1,
-0.8406828, 0.7383149, 0.3918839, 1, 1, 1, 1, 1,
-0.8333166, -0.3717749, -2.0871, 1, 1, 1, 1, 1,
-0.8315223, -1.433557, -4.170485, 1, 1, 1, 1, 1,
-0.8275783, 0.07443246, -1.94868, 0, 0, 1, 1, 1,
-0.822215, 0.5644988, -1.804467, 1, 0, 0, 1, 1,
-0.8198323, 0.9417614, -2.757693, 1, 0, 0, 1, 1,
-0.8144195, 0.4148157, -0.2677956, 1, 0, 0, 1, 1,
-0.8065491, 0.436478, 0.7359316, 1, 0, 0, 1, 1,
-0.8062119, 0.6987929, -0.5872186, 1, 0, 0, 1, 1,
-0.8015911, -0.2807699, -1.691468, 0, 0, 0, 1, 1,
-0.8005363, 0.2451537, -2.573286, 0, 0, 0, 1, 1,
-0.7933482, 0.6572495, 0.5305791, 0, 0, 0, 1, 1,
-0.7909008, -0.8039116, -2.608398, 0, 0, 0, 1, 1,
-0.7777228, 0.470303, -1.637627, 0, 0, 0, 1, 1,
-0.7762151, 0.4757891, -1.317426, 0, 0, 0, 1, 1,
-0.7755472, -0.5306402, -1.256245, 0, 0, 0, 1, 1,
-0.7740259, -0.3281264, -3.108365, 1, 1, 1, 1, 1,
-0.7676547, 1.612759, -1.974314, 1, 1, 1, 1, 1,
-0.762453, -0.3059834, -2.592454, 1, 1, 1, 1, 1,
-0.7606754, 0.3665714, -0.9977343, 1, 1, 1, 1, 1,
-0.7568231, 0.6761585, -0.4903944, 1, 1, 1, 1, 1,
-0.7566305, -0.7654286, -4.298071, 1, 1, 1, 1, 1,
-0.7476128, -0.4996799, -0.9753062, 1, 1, 1, 1, 1,
-0.7432404, -0.5899004, -2.803579, 1, 1, 1, 1, 1,
-0.7373348, 0.3921905, 0.129029, 1, 1, 1, 1, 1,
-0.7354314, -0.9117388, -2.606023, 1, 1, 1, 1, 1,
-0.7349492, -2.565989, -4.168779, 1, 1, 1, 1, 1,
-0.7335358, -0.6413227, -2.440348, 1, 1, 1, 1, 1,
-0.7261429, -0.4179336, -1.547512, 1, 1, 1, 1, 1,
-0.723561, 0.5391819, 0.03569443, 1, 1, 1, 1, 1,
-0.7204753, -0.1594286, -1.589668, 1, 1, 1, 1, 1,
-0.7203361, -1.397801, -0.7595842, 0, 0, 1, 1, 1,
-0.7166704, 0.08491505, -2.889239, 1, 0, 0, 1, 1,
-0.7162822, 1.615999, 0.3114561, 1, 0, 0, 1, 1,
-0.7147285, -0.4495421, -2.082959, 1, 0, 0, 1, 1,
-0.7067558, 1.464151, 0.01509916, 1, 0, 0, 1, 1,
-0.7028826, -0.7680563, -2.811965, 1, 0, 0, 1, 1,
-0.7025721, -0.9174742, -1.878862, 0, 0, 0, 1, 1,
-0.698056, 0.4736724, -2.066514, 0, 0, 0, 1, 1,
-0.6923455, 0.994258, 1.107624, 0, 0, 0, 1, 1,
-0.68527, -0.3938727, -1.879341, 0, 0, 0, 1, 1,
-0.6811868, -0.1620017, -3.471908, 0, 0, 0, 1, 1,
-0.6778788, -0.1187527, -2.402764, 0, 0, 0, 1, 1,
-0.6737156, 0.4172858, -2.287772, 0, 0, 0, 1, 1,
-0.6668169, -0.4702913, -4.224899, 1, 1, 1, 1, 1,
-0.665011, 1.362681, -0.4513464, 1, 1, 1, 1, 1,
-0.661986, -0.8161436, -1.6025, 1, 1, 1, 1, 1,
-0.639239, 1.026177, -1.80455, 1, 1, 1, 1, 1,
-0.6359274, -0.2528497, -0.6552461, 1, 1, 1, 1, 1,
-0.635609, 0.9499633, -0.9694185, 1, 1, 1, 1, 1,
-0.6352264, -1.055411, -2.981024, 1, 1, 1, 1, 1,
-0.6337734, -0.269068, -1.858944, 1, 1, 1, 1, 1,
-0.6335242, -0.5700817, -2.979316, 1, 1, 1, 1, 1,
-0.6329589, 0.3658316, -1.416074, 1, 1, 1, 1, 1,
-0.6285359, 0.8480117, -2.873472, 1, 1, 1, 1, 1,
-0.625716, 1.588063, -1.460166, 1, 1, 1, 1, 1,
-0.6251081, 1.625342, -1.61216, 1, 1, 1, 1, 1,
-0.6208706, -1.298805, -3.244874, 1, 1, 1, 1, 1,
-0.6208118, 0.915543, -0.1158258, 1, 1, 1, 1, 1,
-0.6203672, 2.33847, 0.3178089, 0, 0, 1, 1, 1,
-0.6194624, -1.924381, -4.4759, 1, 0, 0, 1, 1,
-0.6194407, -0.5330243, -0.3262234, 1, 0, 0, 1, 1,
-0.6152676, -1.877729, -2.17419, 1, 0, 0, 1, 1,
-0.6133847, 1.765106, -0.3912507, 1, 0, 0, 1, 1,
-0.6123291, 1.375259, 1.002046, 1, 0, 0, 1, 1,
-0.6060412, -0.4920345, -2.350464, 0, 0, 0, 1, 1,
-0.603087, -0.04144075, -1.322309, 0, 0, 0, 1, 1,
-0.6004575, -1.818965, -2.241682, 0, 0, 0, 1, 1,
-0.6004208, -1.579818, -4.834948, 0, 0, 0, 1, 1,
-0.5976078, 0.4865186, -0.210609, 0, 0, 0, 1, 1,
-0.5969607, -0.7761064, -4.503604, 0, 0, 0, 1, 1,
-0.5934268, -2.461095, -0.2730083, 0, 0, 0, 1, 1,
-0.5785169, -0.5635678, -2.227142, 1, 1, 1, 1, 1,
-0.5767061, 0.3579272, -1.813196, 1, 1, 1, 1, 1,
-0.5759839, 1.440839, -0.5810488, 1, 1, 1, 1, 1,
-0.5713269, -0.3283949, -1.638761, 1, 1, 1, 1, 1,
-0.5625925, -0.6336044, -2.820802, 1, 1, 1, 1, 1,
-0.5608834, -1.633894, -2.608467, 1, 1, 1, 1, 1,
-0.5596842, 1.317855, -0.4982565, 1, 1, 1, 1, 1,
-0.5563894, 0.1455388, -1.396547, 1, 1, 1, 1, 1,
-0.55506, 0.700725, 0.4220612, 1, 1, 1, 1, 1,
-0.5526741, -0.8022937, -2.708292, 1, 1, 1, 1, 1,
-0.5525885, -0.2223229, -0.5814698, 1, 1, 1, 1, 1,
-0.5519273, 0.1142726, -2.235155, 1, 1, 1, 1, 1,
-0.5486174, 1.018719, 1.59612, 1, 1, 1, 1, 1,
-0.546033, 0.1603489, -0.6672807, 1, 1, 1, 1, 1,
-0.5418002, 1.588168, -0.2499509, 1, 1, 1, 1, 1,
-0.5403035, -0.8242633, -2.64115, 0, 0, 1, 1, 1,
-0.5397632, 1.731833, -1.98016, 1, 0, 0, 1, 1,
-0.5371554, -1.07971, -1.94573, 1, 0, 0, 1, 1,
-0.5358349, -0.06616367, -3.302889, 1, 0, 0, 1, 1,
-0.5296289, -0.8374037, -3.301375, 1, 0, 0, 1, 1,
-0.5255519, 0.1933009, -0.5947926, 1, 0, 0, 1, 1,
-0.5223813, -0.1745464, -0.7749302, 0, 0, 0, 1, 1,
-0.5219969, -0.7555167, -0.8750389, 0, 0, 0, 1, 1,
-0.5196055, 0.1300233, -1.72447, 0, 0, 0, 1, 1,
-0.5161041, 0.2013832, -2.01087, 0, 0, 0, 1, 1,
-0.5140132, -0.02758113, -2.209631, 0, 0, 0, 1, 1,
-0.5134435, -1.681506, -3.06803, 0, 0, 0, 1, 1,
-0.4968754, -0.6873221, -2.187747, 0, 0, 0, 1, 1,
-0.496382, -1.452933, -1.575104, 1, 1, 1, 1, 1,
-0.4944403, 0.9913173, 0.1039606, 1, 1, 1, 1, 1,
-0.4920135, -1.278181, -3.252906, 1, 1, 1, 1, 1,
-0.4910106, -0.9446664, -1.749043, 1, 1, 1, 1, 1,
-0.4900648, -0.2301904, 0.24784, 1, 1, 1, 1, 1,
-0.4890981, 0.9883966, -0.351414, 1, 1, 1, 1, 1,
-0.4807516, 0.3869033, -0.581731, 1, 1, 1, 1, 1,
-0.4807343, 1.873149, -1.163359, 1, 1, 1, 1, 1,
-0.4788933, 0.3378161, -1.251421, 1, 1, 1, 1, 1,
-0.4777319, -0.2078287, -2.09917, 1, 1, 1, 1, 1,
-0.4774767, -0.1798881, -1.630782, 1, 1, 1, 1, 1,
-0.4768036, 0.4179824, -2.509489, 1, 1, 1, 1, 1,
-0.4766996, 0.3066177, 0.2239255, 1, 1, 1, 1, 1,
-0.4733341, -0.6270349, -1.746894, 1, 1, 1, 1, 1,
-0.466888, -0.1285592, -0.3271837, 1, 1, 1, 1, 1,
-0.4664941, -1.594068, -3.85711, 0, 0, 1, 1, 1,
-0.4645793, 0.6425759, -1.389839, 1, 0, 0, 1, 1,
-0.4641639, 0.5792848, -0.8650529, 1, 0, 0, 1, 1,
-0.4595405, -0.4358135, -1.417593, 1, 0, 0, 1, 1,
-0.4565495, 0.148777, -1.570225, 1, 0, 0, 1, 1,
-0.4553586, 1.494982, 0.9748384, 1, 0, 0, 1, 1,
-0.4541388, 0.5854206, 0.3272209, 0, 0, 0, 1, 1,
-0.4538454, 0.6138393, -2.9414, 0, 0, 0, 1, 1,
-0.453154, -0.908747, -1.2671, 0, 0, 0, 1, 1,
-0.4515261, 0.02292109, -2.30128, 0, 0, 0, 1, 1,
-0.4508546, 0.6968985, -1.840996, 0, 0, 0, 1, 1,
-0.4505525, -1.959268, -3.17691, 0, 0, 0, 1, 1,
-0.4500676, 0.9597359, -1.034194, 0, 0, 0, 1, 1,
-0.4499759, -0.3024972, -1.659318, 1, 1, 1, 1, 1,
-0.4450963, -0.9555624, -1.329597, 1, 1, 1, 1, 1,
-0.4434895, -0.1317157, -2.036629, 1, 1, 1, 1, 1,
-0.4393356, 0.7871096, -0.8360242, 1, 1, 1, 1, 1,
-0.4363654, -0.4686705, -2.018394, 1, 1, 1, 1, 1,
-0.4289469, -0.7048097, -1.157176, 1, 1, 1, 1, 1,
-0.428076, -0.5321673, -3.602212, 1, 1, 1, 1, 1,
-0.4269918, 0.05694418, -3.34666, 1, 1, 1, 1, 1,
-0.4244257, 1.105222, 0.008126159, 1, 1, 1, 1, 1,
-0.4240436, -0.778389, -4.175673, 1, 1, 1, 1, 1,
-0.4237278, 0.5958267, -0.5981999, 1, 1, 1, 1, 1,
-0.4223553, 0.8048477, -0.3090608, 1, 1, 1, 1, 1,
-0.4214545, -1.180423, -1.206248, 1, 1, 1, 1, 1,
-0.4200836, -1.203123, -3.626681, 1, 1, 1, 1, 1,
-0.41883, 1.695275, 1.045945, 1, 1, 1, 1, 1,
-0.4108629, -0.429911, -3.658989, 0, 0, 1, 1, 1,
-0.4105741, 0.492973, -0.2205449, 1, 0, 0, 1, 1,
-0.4085326, 1.320797, -0.9087933, 1, 0, 0, 1, 1,
-0.4051302, 1.045619, -0.7904162, 1, 0, 0, 1, 1,
-0.4023716, -0.4852202, -0.6384445, 1, 0, 0, 1, 1,
-0.4010293, -2.432431, -0.715353, 1, 0, 0, 1, 1,
-0.3999058, -1.072606, -2.681219, 0, 0, 0, 1, 1,
-0.3989637, -0.7025264, -3.900215, 0, 0, 0, 1, 1,
-0.3950001, -0.6341956, -3.902196, 0, 0, 0, 1, 1,
-0.3842321, -0.5732426, -4.65741, 0, 0, 0, 1, 1,
-0.3838451, 0.4883081, 0.02359705, 0, 0, 0, 1, 1,
-0.3766171, 0.5340292, -0.2026007, 0, 0, 0, 1, 1,
-0.3753875, -1.379396, -3.304928, 0, 0, 0, 1, 1,
-0.3721992, 1.579463, -0.8389076, 1, 1, 1, 1, 1,
-0.3705098, 1.555756, -0.8408542, 1, 1, 1, 1, 1,
-0.3703111, 0.2820335, -1.314617, 1, 1, 1, 1, 1,
-0.3700707, -0.1582738, -2.895349, 1, 1, 1, 1, 1,
-0.3675534, -0.8137148, -1.78082, 1, 1, 1, 1, 1,
-0.3664633, 0.219496, -0.5337216, 1, 1, 1, 1, 1,
-0.3625336, -0.6808231, -3.107989, 1, 1, 1, 1, 1,
-0.3609918, 0.2097914, -1.115705, 1, 1, 1, 1, 1,
-0.3608033, -0.5012873, -3.62284, 1, 1, 1, 1, 1,
-0.3580418, 0.1526897, -1.099539, 1, 1, 1, 1, 1,
-0.3538666, 1.064158, 0.4534079, 1, 1, 1, 1, 1,
-0.3531125, -0.4393685, -2.342249, 1, 1, 1, 1, 1,
-0.3508233, -2.535524, -3.098301, 1, 1, 1, 1, 1,
-0.3485585, 0.6326914, 0.04242777, 1, 1, 1, 1, 1,
-0.3450342, -0.5315543, -2.766593, 1, 1, 1, 1, 1,
-0.3426046, -0.59622, -2.6722, 0, 0, 1, 1, 1,
-0.337933, 1.349861, -1.132716, 1, 0, 0, 1, 1,
-0.3365749, -0.6360469, -3.962182, 1, 0, 0, 1, 1,
-0.335615, 1.429437, 0.3601871, 1, 0, 0, 1, 1,
-0.3335024, 0.4866869, -1.40345, 1, 0, 0, 1, 1,
-0.3332258, -1.675072, -2.624215, 1, 0, 0, 1, 1,
-0.3316733, -0.9125, -4.746588, 0, 0, 0, 1, 1,
-0.3234876, -0.165073, -2.260403, 0, 0, 0, 1, 1,
-0.3227414, -0.5944347, -0.6989866, 0, 0, 0, 1, 1,
-0.3227194, 0.436731, -0.5525522, 0, 0, 0, 1, 1,
-0.3181246, -1.984397, -3.759037, 0, 0, 0, 1, 1,
-0.3174546, 0.3006926, 0.05911599, 0, 0, 0, 1, 1,
-0.3166935, 0.8616808, 0.5779833, 0, 0, 0, 1, 1,
-0.3150634, 0.2671774, -2.820857, 1, 1, 1, 1, 1,
-0.3108152, -0.4115316, -1.481141, 1, 1, 1, 1, 1,
-0.2996673, 1.453415, 0.8639114, 1, 1, 1, 1, 1,
-0.2968727, 1.720749, -0.1611393, 1, 1, 1, 1, 1,
-0.2934153, -0.161556, -2.147158, 1, 1, 1, 1, 1,
-0.2897713, 1.319388, -0.642144, 1, 1, 1, 1, 1,
-0.2870073, -0.2993085, -1.625705, 1, 1, 1, 1, 1,
-0.2853691, 0.9116353, -0.2477103, 1, 1, 1, 1, 1,
-0.281878, -1.994877, -2.455818, 1, 1, 1, 1, 1,
-0.2818187, -1.120399, -1.771369, 1, 1, 1, 1, 1,
-0.2785313, 0.386129, -1.759018, 1, 1, 1, 1, 1,
-0.2736326, -0.4887537, -1.560614, 1, 1, 1, 1, 1,
-0.2709447, 0.02305039, -1.215941, 1, 1, 1, 1, 1,
-0.2706486, -0.627212, -1.798115, 1, 1, 1, 1, 1,
-0.2703542, -1.012862, -3.938545, 1, 1, 1, 1, 1,
-0.2683846, 0.1926269, -1.704012, 0, 0, 1, 1, 1,
-0.264311, -0.1193023, -1.902678, 1, 0, 0, 1, 1,
-0.2638425, 1.240835, -0.3169216, 1, 0, 0, 1, 1,
-0.2612933, 0.2447485, -1.301743, 1, 0, 0, 1, 1,
-0.2454136, 0.1300289, -1.341897, 1, 0, 0, 1, 1,
-0.2398234, -0.2341484, -1.951157, 1, 0, 0, 1, 1,
-0.2387097, -0.6683766, -2.885608, 0, 0, 0, 1, 1,
-0.2328079, -0.4076785, -4.362429, 0, 0, 0, 1, 1,
-0.2314061, -1.420165, -5.786518, 0, 0, 0, 1, 1,
-0.2282455, 0.4750669, 0.3495355, 0, 0, 0, 1, 1,
-0.2272371, 1.079582, -0.8396984, 0, 0, 0, 1, 1,
-0.2224547, 0.1167437, -1.82726, 0, 0, 0, 1, 1,
-0.2210864, -0.08656864, -2.707997, 0, 0, 0, 1, 1,
-0.2202648, -1.713076, -2.642046, 1, 1, 1, 1, 1,
-0.2176041, 0.7406968, 1.16757, 1, 1, 1, 1, 1,
-0.2167819, -1.498866, -2.500149, 1, 1, 1, 1, 1,
-0.2167068, -0.7856411, -3.737868, 1, 1, 1, 1, 1,
-0.2138577, -1.768861, -3.036024, 1, 1, 1, 1, 1,
-0.2131654, -0.8502885, -1.297738, 1, 1, 1, 1, 1,
-0.211947, 0.3461154, -0.4210728, 1, 1, 1, 1, 1,
-0.2113218, -0.08534276, -3.217699, 1, 1, 1, 1, 1,
-0.207484, 0.4070959, 0.5324004, 1, 1, 1, 1, 1,
-0.2057864, 1.641922, 0.2095416, 1, 1, 1, 1, 1,
-0.2036829, -0.3416469, -2.677735, 1, 1, 1, 1, 1,
-0.2021185, -0.857724, -1.193968, 1, 1, 1, 1, 1,
-0.1949524, -0.6439387, -2.549606, 1, 1, 1, 1, 1,
-0.1947038, -1.481532, -1.476876, 1, 1, 1, 1, 1,
-0.1946281, 0.07139576, -0.2137915, 1, 1, 1, 1, 1,
-0.1931006, 1.170152, -0.702987, 0, 0, 1, 1, 1,
-0.1929519, -0.2044885, -0.1622502, 1, 0, 0, 1, 1,
-0.1920419, -0.2433338, -1.811479, 1, 0, 0, 1, 1,
-0.190899, 2.295959, -0.6812322, 1, 0, 0, 1, 1,
-0.1900004, -1.451311, -2.200182, 1, 0, 0, 1, 1,
-0.1802887, 0.6293228, 1.72678, 1, 0, 0, 1, 1,
-0.1791031, 0.7017403, -0.4004063, 0, 0, 0, 1, 1,
-0.1713184, -1.796739, -1.916876, 0, 0, 0, 1, 1,
-0.1669374, 0.917639, 0.8232802, 0, 0, 0, 1, 1,
-0.16223, -0.6851801, -3.552703, 0, 0, 0, 1, 1,
-0.1569719, 0.8268005, -0.7153575, 0, 0, 0, 1, 1,
-0.1546441, -1.248564, -1.897458, 0, 0, 0, 1, 1,
-0.1485336, 1.810421, -1.342062, 0, 0, 0, 1, 1,
-0.1450994, 1.129908, 1.023084, 1, 1, 1, 1, 1,
-0.1448485, -1.928211, -3.188262, 1, 1, 1, 1, 1,
-0.1440874, -1.329651, -2.981735, 1, 1, 1, 1, 1,
-0.1421776, 1.926536, 1.020217, 1, 1, 1, 1, 1,
-0.1354473, -0.9166564, -2.762858, 1, 1, 1, 1, 1,
-0.131699, -1.289096, -4.086357, 1, 1, 1, 1, 1,
-0.1298917, 0.3900658, 0.01657897, 1, 1, 1, 1, 1,
-0.1246139, 2.485866, 0.007411711, 1, 1, 1, 1, 1,
-0.1202211, 0.8308641, 1.169531, 1, 1, 1, 1, 1,
-0.118976, 1.984643, 0.1583944, 1, 1, 1, 1, 1,
-0.1185887, -2.170369, -3.262147, 1, 1, 1, 1, 1,
-0.1185197, -1.355505, -3.082545, 1, 1, 1, 1, 1,
-0.1181451, -1.147382, -2.847714, 1, 1, 1, 1, 1,
-0.114904, -0.4706077, -3.306751, 1, 1, 1, 1, 1,
-0.1148462, -2.631877, -2.814727, 1, 1, 1, 1, 1,
-0.1139377, 0.3898348, -0.140241, 0, 0, 1, 1, 1,
-0.1134926, 0.4232105, 0.8687892, 1, 0, 0, 1, 1,
-0.1099836, -0.7302679, -4.572048, 1, 0, 0, 1, 1,
-0.1044887, 1.055694, -1.203808, 1, 0, 0, 1, 1,
-0.1006451, 1.549283, -2.216875, 1, 0, 0, 1, 1,
-0.1002324, 0.001986868, -1.818457, 1, 0, 0, 1, 1,
-0.09955437, 0.03550451, -2.420028, 0, 0, 0, 1, 1,
-0.09778564, 0.01775, -2.116626, 0, 0, 0, 1, 1,
-0.08871775, -0.8651175, -4.196066, 0, 0, 0, 1, 1,
-0.08714581, -0.9490622, -2.639578, 0, 0, 0, 1, 1,
-0.08601324, 1.203341, -0.7245089, 0, 0, 0, 1, 1,
-0.08486635, 0.7588686, 0.1753531, 0, 0, 0, 1, 1,
-0.08481755, -0.4285251, -3.186367, 0, 0, 0, 1, 1,
-0.08028527, 0.1745558, -0.1489533, 1, 1, 1, 1, 1,
-0.07776853, -0.3475837, -2.813179, 1, 1, 1, 1, 1,
-0.07289719, -0.06361509, -2.070399, 1, 1, 1, 1, 1,
-0.07228963, 0.1266321, -0.5850873, 1, 1, 1, 1, 1,
-0.06913432, -2.933166, -3.676279, 1, 1, 1, 1, 1,
-0.06614995, -0.495121, -1.831499, 1, 1, 1, 1, 1,
-0.06469765, 1.702397, 0.5372024, 1, 1, 1, 1, 1,
-0.06337241, 1.88589, 0.0745223, 1, 1, 1, 1, 1,
-0.06265086, -0.466783, -3.304229, 1, 1, 1, 1, 1,
-0.06121363, 0.2707565, -0.3748729, 1, 1, 1, 1, 1,
-0.06021706, 0.1783589, -0.412755, 1, 1, 1, 1, 1,
-0.05966863, -2.508283, -1.623046, 1, 1, 1, 1, 1,
-0.05798402, -0.520112, -3.466612, 1, 1, 1, 1, 1,
-0.05597794, -0.1681805, -4.004298, 1, 1, 1, 1, 1,
-0.05579013, -0.6140511, -2.731078, 1, 1, 1, 1, 1,
-0.04946388, 1.720132, 0.1000294, 0, 0, 1, 1, 1,
-0.0428228, 0.05313476, -1.436813, 1, 0, 0, 1, 1,
-0.04271474, 0.1509326, -0.9244232, 1, 0, 0, 1, 1,
-0.04271396, 0.07688895, 1.587406, 1, 0, 0, 1, 1,
-0.0414464, 0.9137999, -0.933846, 1, 0, 0, 1, 1,
-0.04070387, -2.044678, -2.698313, 1, 0, 0, 1, 1,
-0.03493259, 0.1581711, 0.3108328, 0, 0, 0, 1, 1,
-0.03169963, -0.4734268, -3.641085, 0, 0, 0, 1, 1,
-0.02838883, -0.5256563, -2.9241, 0, 0, 0, 1, 1,
-0.02294262, -0.4139118, -6.3988, 0, 0, 0, 1, 1,
-0.02093894, -0.2799176, -2.609583, 0, 0, 0, 1, 1,
-0.0207577, 1.109643, -0.433554, 0, 0, 0, 1, 1,
-0.02056169, -0.7506002, -3.524858, 0, 0, 0, 1, 1,
-0.0175555, 0.6696414, -0.07132828, 1, 1, 1, 1, 1,
-0.01457401, 0.06496187, -0.9080221, 1, 1, 1, 1, 1,
-0.01452884, -0.3119504, -2.93219, 1, 1, 1, 1, 1,
-0.008934589, 0.2256375, 0.02314782, 1, 1, 1, 1, 1,
-0.008156625, 0.5102143, -0.2185944, 1, 1, 1, 1, 1,
-0.006359047, -0.2948079, -3.491417, 1, 1, 1, 1, 1,
-0.006191519, 1.417511, 0.9831961, 1, 1, 1, 1, 1,
-0.005672846, 0.1659237, -1.241584, 1, 1, 1, 1, 1,
-0.003434327, 0.06292166, 0.7568392, 1, 1, 1, 1, 1,
-0.002105795, 2.480837, 0.137669, 1, 1, 1, 1, 1,
0.003372005, -0.5746682, 5.114603, 1, 1, 1, 1, 1,
0.004642241, 0.06932351, -1.219096, 1, 1, 1, 1, 1,
0.007472471, -0.3860085, 2.080641, 1, 1, 1, 1, 1,
0.008919409, 0.7645704, 0.7410215, 1, 1, 1, 1, 1,
0.01006229, 0.02820273, -0.665002, 1, 1, 1, 1, 1,
0.01362899, 0.08123705, 0.1413378, 0, 0, 1, 1, 1,
0.01593763, -1.194202, 3.074189, 1, 0, 0, 1, 1,
0.02295871, -3.302829, 3.988229, 1, 0, 0, 1, 1,
0.02376489, 0.8159546, 2.258659, 1, 0, 0, 1, 1,
0.02563426, 1.086414, -3.121595, 1, 0, 0, 1, 1,
0.02880561, -0.7945968, 3.999814, 1, 0, 0, 1, 1,
0.03020129, 1.803038, -0.1118507, 0, 0, 0, 1, 1,
0.03174375, 0.25631, -1.205484, 0, 0, 0, 1, 1,
0.03555803, -0.3630362, 3.88, 0, 0, 0, 1, 1,
0.03773069, 1.377944, 1.078809, 0, 0, 0, 1, 1,
0.03970496, 0.3554066, 0.9120555, 0, 0, 0, 1, 1,
0.04123547, 1.728829, -1.563088, 0, 0, 0, 1, 1,
0.04530654, 0.4320454, 2.255507, 0, 0, 0, 1, 1,
0.04665737, 0.002692781, 2.605494, 1, 1, 1, 1, 1,
0.05271688, -0.6288706, 3.925215, 1, 1, 1, 1, 1,
0.05995794, 1.056421, 1.24664, 1, 1, 1, 1, 1,
0.06042174, -1.128693, 2.966353, 1, 1, 1, 1, 1,
0.06071083, 0.4940381, 1.650831, 1, 1, 1, 1, 1,
0.06208988, 1.925381, 0.1544099, 1, 1, 1, 1, 1,
0.06209387, 1.983644, -1.109862, 1, 1, 1, 1, 1,
0.06367611, -1.194479, 4.1996, 1, 1, 1, 1, 1,
0.07366199, 0.5530585, 0.8923206, 1, 1, 1, 1, 1,
0.07407302, 0.5118787, -0.6726643, 1, 1, 1, 1, 1,
0.0744243, -0.3621005, 3.218921, 1, 1, 1, 1, 1,
0.07512244, 1.09238, -2.20048, 1, 1, 1, 1, 1,
0.07528221, 0.4343982, 1.418161, 1, 1, 1, 1, 1,
0.07550267, 0.2642109, 0.6819907, 1, 1, 1, 1, 1,
0.07998669, 2.448885, 0.9692627, 1, 1, 1, 1, 1,
0.08706897, 0.539357, 1.185112, 0, 0, 1, 1, 1,
0.08726866, -1.331133, 3.160961, 1, 0, 0, 1, 1,
0.0953439, 0.4382762, -1.467472, 1, 0, 0, 1, 1,
0.09838809, -0.22232, 3.660441, 1, 0, 0, 1, 1,
0.1005863, 0.9109583, 0.4710698, 1, 0, 0, 1, 1,
0.1016299, -1.214615, 3.239382, 1, 0, 0, 1, 1,
0.1021312, -0.1097665, 4.101649, 0, 0, 0, 1, 1,
0.1023358, 0.7704975, -1.148664, 0, 0, 0, 1, 1,
0.1029444, 0.5372694, 0.9180942, 0, 0, 0, 1, 1,
0.1040702, -2.036464, 4.169841, 0, 0, 0, 1, 1,
0.1043429, 1.247818, 0.6889144, 0, 0, 0, 1, 1,
0.1078147, 0.7590882, -1.39327, 0, 0, 0, 1, 1,
0.1081776, 2.938025, 0.0002814493, 0, 0, 0, 1, 1,
0.1163305, 1.265527, 2.514365, 1, 1, 1, 1, 1,
0.1171793, 1.02895, 1.234827, 1, 1, 1, 1, 1,
0.1184017, 0.06199228, 2.035632, 1, 1, 1, 1, 1,
0.1191605, -0.4232892, 2.956094, 1, 1, 1, 1, 1,
0.1202377, 1.187654, -0.5436748, 1, 1, 1, 1, 1,
0.1259421, 0.9591837, -0.714837, 1, 1, 1, 1, 1,
0.127727, 0.303478, 0.3755106, 1, 1, 1, 1, 1,
0.1329225, -0.2678778, 1.594828, 1, 1, 1, 1, 1,
0.1348957, -1.42625, 5.213373, 1, 1, 1, 1, 1,
0.1360859, -0.7206921, 1.882508, 1, 1, 1, 1, 1,
0.1384458, 0.4480869, -0.3065516, 1, 1, 1, 1, 1,
0.1395974, -1.61569, 4.388569, 1, 1, 1, 1, 1,
0.1408434, 1.796209, 0.1246911, 1, 1, 1, 1, 1,
0.1413517, 0.8655764, 0.1377642, 1, 1, 1, 1, 1,
0.1450649, 0.3793964, 0.2880065, 1, 1, 1, 1, 1,
0.1452234, -0.07831963, 1.603752, 0, 0, 1, 1, 1,
0.1475259, 0.2374277, 0.1159348, 1, 0, 0, 1, 1,
0.153134, 0.6955798, -2.260816, 1, 0, 0, 1, 1,
0.1559289, -1.05968, 3.839142, 1, 0, 0, 1, 1,
0.1563116, 1.044753, -1.606395, 1, 0, 0, 1, 1,
0.1589036, -0.7164276, 3.091954, 1, 0, 0, 1, 1,
0.162633, 0.002798369, 1.328197, 0, 0, 0, 1, 1,
0.1680455, -0.0774508, 1.963185, 0, 0, 0, 1, 1,
0.172102, 1.265848, -1.128976, 0, 0, 0, 1, 1,
0.1731543, -1.056886, 3.656017, 0, 0, 0, 1, 1,
0.1777345, -0.9747374, 2.962591, 0, 0, 0, 1, 1,
0.1794879, -0.2920424, 3.340005, 0, 0, 0, 1, 1,
0.1795259, -1.99124, 2.543886, 0, 0, 0, 1, 1,
0.1837814, 2.563248, 0.1802033, 1, 1, 1, 1, 1,
0.1844481, 0.5101011, 0.1174846, 1, 1, 1, 1, 1,
0.185565, 1.156337, 1.614709, 1, 1, 1, 1, 1,
0.1868177, 1.408056, -0.1925699, 1, 1, 1, 1, 1,
0.1902554, 1.540801, -0.2796454, 1, 1, 1, 1, 1,
0.1945247, 0.9654468, 1.601676, 1, 1, 1, 1, 1,
0.1952345, 0.9484944, -0.5330178, 1, 1, 1, 1, 1,
0.1956725, -1.923319, 2.95593, 1, 1, 1, 1, 1,
0.1962637, 1.047596, -1.245429, 1, 1, 1, 1, 1,
0.1996191, 2.286228, -1.000932, 1, 1, 1, 1, 1,
0.2023331, 2.206735, -0.2023831, 1, 1, 1, 1, 1,
0.2027903, -0.3993877, 3.099192, 1, 1, 1, 1, 1,
0.2112674, -2.068186, 4.665044, 1, 1, 1, 1, 1,
0.2114471, -0.4636499, 2.240324, 1, 1, 1, 1, 1,
0.2118393, -0.869973, 2.999001, 1, 1, 1, 1, 1,
0.2157022, -0.01201783, 0.655109, 0, 0, 1, 1, 1,
0.217082, 1.707262, 0.6086169, 1, 0, 0, 1, 1,
0.2201099, 2.187859, 0.8814318, 1, 0, 0, 1, 1,
0.2210209, 0.7656984, -0.1730814, 1, 0, 0, 1, 1,
0.226974, -0.3462784, 2.337389, 1, 0, 0, 1, 1,
0.2282086, 0.5073491, 0.6009348, 1, 0, 0, 1, 1,
0.2295244, -2.265968, 2.37946, 0, 0, 0, 1, 1,
0.2315765, 1.242385, -0.3201278, 0, 0, 0, 1, 1,
0.2330124, -0.3147742, 2.116476, 0, 0, 0, 1, 1,
0.2429423, -0.4076553, 2.936072, 0, 0, 0, 1, 1,
0.2512555, -1.193377, 2.65518, 0, 0, 0, 1, 1,
0.2584808, 1.099248, 0.3066129, 0, 0, 0, 1, 1,
0.2695083, 1.349456, 0.6874629, 0, 0, 0, 1, 1,
0.2701811, -0.7574752, 3.003794, 1, 1, 1, 1, 1,
0.2738101, 1.134886, 0.1012023, 1, 1, 1, 1, 1,
0.2754991, 0.7118834, -0.4713568, 1, 1, 1, 1, 1,
0.2834393, 0.1200233, 2.161038, 1, 1, 1, 1, 1,
0.2856339, -2.308533, 3.490122, 1, 1, 1, 1, 1,
0.2898363, 1.574192, 1.678652, 1, 1, 1, 1, 1,
0.2928939, -0.7663243, 1.478116, 1, 1, 1, 1, 1,
0.2977504, -1.906714, 3.215923, 1, 1, 1, 1, 1,
0.3002148, 0.2539124, 0.4766109, 1, 1, 1, 1, 1,
0.3045358, 1.331558, -1.686223, 1, 1, 1, 1, 1,
0.3065995, -1.297949, 4.014532, 1, 1, 1, 1, 1,
0.308107, 0.8373708, -0.2714711, 1, 1, 1, 1, 1,
0.3083561, 0.001210876, 3.187536, 1, 1, 1, 1, 1,
0.3117267, 0.6890173, 0.5242397, 1, 1, 1, 1, 1,
0.312839, 0.1936445, 0.9079676, 1, 1, 1, 1, 1,
0.3146227, 1.58035, -0.972681, 0, 0, 1, 1, 1,
0.3218397, 0.4333286, 0.9033398, 1, 0, 0, 1, 1,
0.3232044, 1.928104, -0.1247516, 1, 0, 0, 1, 1,
0.3240383, 1.613679, 0.1309172, 1, 0, 0, 1, 1,
0.3260629, 0.6770014, 0.4435957, 1, 0, 0, 1, 1,
0.326686, -0.7862401, 3.620806, 1, 0, 0, 1, 1,
0.3274869, -0.7584981, 2.510321, 0, 0, 0, 1, 1,
0.330162, -0.1919508, 2.242508, 0, 0, 0, 1, 1,
0.3303932, -0.5563665, 2.700362, 0, 0, 0, 1, 1,
0.3315475, -3.016308, 1.884017, 0, 0, 0, 1, 1,
0.3332357, -0.3288269, 4.772204, 0, 0, 0, 1, 1,
0.3336248, 1.138243, 0.3172408, 0, 0, 0, 1, 1,
0.3401886, 0.4624267, -0.4153118, 0, 0, 0, 1, 1,
0.3402471, -0.5930771, 2.414046, 1, 1, 1, 1, 1,
0.3416033, 0.6518043, 3.166497, 1, 1, 1, 1, 1,
0.3424823, 0.1930321, 1.234939, 1, 1, 1, 1, 1,
0.3436075, 0.1039836, 1.853165, 1, 1, 1, 1, 1,
0.3442642, 0.775929, 0.6037442, 1, 1, 1, 1, 1,
0.3457735, 2.967448, 0.1731049, 1, 1, 1, 1, 1,
0.3491716, -0.3284822, 3.131934, 1, 1, 1, 1, 1,
0.3536003, -0.3926865, 2.949882, 1, 1, 1, 1, 1,
0.3537277, 0.03613917, 0.6364735, 1, 1, 1, 1, 1,
0.3560264, -0.1798407, 0.569388, 1, 1, 1, 1, 1,
0.3579635, -0.9387957, 3.105285, 1, 1, 1, 1, 1,
0.3597268, -0.6883799, 2.464111, 1, 1, 1, 1, 1,
0.3621325, -0.6363161, 1.912401, 1, 1, 1, 1, 1,
0.3628942, 0.4973736, 1.832454, 1, 1, 1, 1, 1,
0.3667454, -0.4449264, 2.264618, 1, 1, 1, 1, 1,
0.3689025, -0.9120453, 2.963972, 0, 0, 1, 1, 1,
0.3690524, -0.2219954, 3.42361, 1, 0, 0, 1, 1,
0.3732427, 1.716134, 0.3393234, 1, 0, 0, 1, 1,
0.3771637, -1.052904, 1.397979, 1, 0, 0, 1, 1,
0.3868217, -0.1236834, 1.515448, 1, 0, 0, 1, 1,
0.387264, -0.7314647, 3.810053, 1, 0, 0, 1, 1,
0.390449, 0.486586, 1.523044, 0, 0, 0, 1, 1,
0.3998398, -1.068203, 1.779849, 0, 0, 0, 1, 1,
0.4024502, -0.1362044, 1.63148, 0, 0, 0, 1, 1,
0.4031675, 0.2981317, 1.10618, 0, 0, 0, 1, 1,
0.4062797, 2.021946, 1.936338, 0, 0, 0, 1, 1,
0.4110374, 1.075065, 0.01560165, 0, 0, 0, 1, 1,
0.4155605, -0.3572287, 2.157676, 0, 0, 0, 1, 1,
0.4185846, -0.1183618, 1.898536, 1, 1, 1, 1, 1,
0.4225451, -0.2602639, 0.7177663, 1, 1, 1, 1, 1,
0.4237512, 0.1335864, 0.1216118, 1, 1, 1, 1, 1,
0.4278124, 0.3417271, 0.7599709, 1, 1, 1, 1, 1,
0.4286045, 1.037991, -1.099515, 1, 1, 1, 1, 1,
0.4389648, 0.5857729, -0.3998808, 1, 1, 1, 1, 1,
0.4427967, 0.7750925, 1.059076, 1, 1, 1, 1, 1,
0.4429023, -0.9570567, 3.946428, 1, 1, 1, 1, 1,
0.4475354, -0.5217214, 3.468445, 1, 1, 1, 1, 1,
0.4490823, 0.2425441, 1.691638, 1, 1, 1, 1, 1,
0.4490834, -0.1471072, 1.581782, 1, 1, 1, 1, 1,
0.4517187, -0.4773673, 1.651658, 1, 1, 1, 1, 1,
0.4524555, -0.8163922, 2.465859, 1, 1, 1, 1, 1,
0.4569239, 2.376842, -0.4920974, 1, 1, 1, 1, 1,
0.4589663, 0.760262, 1.760234, 1, 1, 1, 1, 1,
0.4595793, 0.2812103, 1.412264, 0, 0, 1, 1, 1,
0.4608944, -2.205948, 2.92171, 1, 0, 0, 1, 1,
0.4644284, -0.8133488, 1.354926, 1, 0, 0, 1, 1,
0.4651291, -0.08600008, 1.521184, 1, 0, 0, 1, 1,
0.4654323, 0.3855487, 2.369139, 1, 0, 0, 1, 1,
0.4675452, -1.942305, 4.721923, 1, 0, 0, 1, 1,
0.4676549, 0.5775051, 1.246072, 0, 0, 0, 1, 1,
0.4723544, -0.5567111, 4.695514, 0, 0, 0, 1, 1,
0.4756705, -0.2154852, 2.697155, 0, 0, 0, 1, 1,
0.4762594, 1.177918, -1.266321, 0, 0, 0, 1, 1,
0.4782753, 1.379575, 0.2598943, 0, 0, 0, 1, 1,
0.4791433, 0.9409499, -1.42508, 0, 0, 0, 1, 1,
0.4820732, 0.7445124, -0.9433651, 0, 0, 0, 1, 1,
0.4824325, -1.390272, 2.008071, 1, 1, 1, 1, 1,
0.4836423, 0.0164187, 2.771463, 1, 1, 1, 1, 1,
0.4853012, 0.6445565, 1.269138, 1, 1, 1, 1, 1,
0.4869809, 0.6158119, 0.7382711, 1, 1, 1, 1, 1,
0.4875672, 0.2495537, 1.196462, 1, 1, 1, 1, 1,
0.4937226, -1.590151, 2.910614, 1, 1, 1, 1, 1,
0.4940938, -1.23217, 3.975686, 1, 1, 1, 1, 1,
0.4956278, -0.4552307, 4.759281, 1, 1, 1, 1, 1,
0.4994357, -0.02649784, 2.993833, 1, 1, 1, 1, 1,
0.4999131, -0.375456, 3.704046, 1, 1, 1, 1, 1,
0.5078713, 1.037237, -1.439702, 1, 1, 1, 1, 1,
0.5095003, -0.9369121, 2.881073, 1, 1, 1, 1, 1,
0.5148894, -0.9550948, 1.617797, 1, 1, 1, 1, 1,
0.5166259, 0.4386877, 0.334003, 1, 1, 1, 1, 1,
0.5178204, 0.3856508, 1.907346, 1, 1, 1, 1, 1,
0.5195023, 0.9499785, -0.923103, 0, 0, 1, 1, 1,
0.5203243, -0.1608351, 1.084266, 1, 0, 0, 1, 1,
0.5227396, -0.5309021, 2.162, 1, 0, 0, 1, 1,
0.5229335, 0.5675566, 0.6930194, 1, 0, 0, 1, 1,
0.5276982, -0.913328, 4.145597, 1, 0, 0, 1, 1,
0.5302061, 0.5114558, 0.5307988, 1, 0, 0, 1, 1,
0.5302401, 0.5592269, -0.3893089, 0, 0, 0, 1, 1,
0.5375875, -1.930061, 2.729524, 0, 0, 0, 1, 1,
0.5375887, -0.2710831, -0.1657065, 0, 0, 0, 1, 1,
0.5422627, 0.5918363, 1.369898, 0, 0, 0, 1, 1,
0.5423423, -0.09444794, 4.671957, 0, 0, 0, 1, 1,
0.5447131, 0.4421351, 0.9077018, 0, 0, 0, 1, 1,
0.5489581, 0.3194424, 0.3967927, 0, 0, 0, 1, 1,
0.5512789, -0.06358743, 2.229277, 1, 1, 1, 1, 1,
0.5524558, -0.5872164, 0.8592435, 1, 1, 1, 1, 1,
0.552636, -0.7790633, 1.627951, 1, 1, 1, 1, 1,
0.5531448, 0.5308856, 3.329624, 1, 1, 1, 1, 1,
0.5536262, 1.474455, -0.01913562, 1, 1, 1, 1, 1,
0.5568936, -0.4871726, 3.982678, 1, 1, 1, 1, 1,
0.5642422, -0.3057326, 0.380403, 1, 1, 1, 1, 1,
0.5649931, -0.1570603, 2.507416, 1, 1, 1, 1, 1,
0.5713339, -0.7569212, 1.452476, 1, 1, 1, 1, 1,
0.5727337, 1.303019, -1.527492, 1, 1, 1, 1, 1,
0.5737037, 0.217843, 1.837463, 1, 1, 1, 1, 1,
0.5747001, -0.6664379, 1.431844, 1, 1, 1, 1, 1,
0.5754668, -0.294667, 2.43805, 1, 1, 1, 1, 1,
0.5768834, -0.6804842, 4.048955, 1, 1, 1, 1, 1,
0.5771338, 0.5598289, -0.1778359, 1, 1, 1, 1, 1,
0.5798672, 0.9498211, 1.006087, 0, 0, 1, 1, 1,
0.5818217, 0.4518051, 1.56023, 1, 0, 0, 1, 1,
0.5825914, 0.3789825, 0.9053683, 1, 0, 0, 1, 1,
0.5830138, 0.07309981, 0.4493396, 1, 0, 0, 1, 1,
0.5833716, 1.08626, -0.03293757, 1, 0, 0, 1, 1,
0.583808, -0.6654021, 2.529844, 1, 0, 0, 1, 1,
0.5905085, -1.672677, 1.058812, 0, 0, 0, 1, 1,
0.5986966, 0.009072458, 0.7211477, 0, 0, 0, 1, 1,
0.6182474, -1.708596, 2.153315, 0, 0, 0, 1, 1,
0.6226526, -0.6238049, 1.754758, 0, 0, 0, 1, 1,
0.6256244, -0.5648242, 0.9375349, 0, 0, 0, 1, 1,
0.6264074, -0.01546675, 1.494684, 0, 0, 0, 1, 1,
0.6275681, 0.1537503, 1.095987, 0, 0, 0, 1, 1,
0.6302471, -0.3448192, 1.733981, 1, 1, 1, 1, 1,
0.6331043, 1.764104, 0.1917492, 1, 1, 1, 1, 1,
0.6358322, -0.05890948, 1.277441, 1, 1, 1, 1, 1,
0.6361576, 0.2082291, 1.219905, 1, 1, 1, 1, 1,
0.6363178, -0.2874178, 2.064733, 1, 1, 1, 1, 1,
0.6416203, -0.9246355, 1.656855, 1, 1, 1, 1, 1,
0.642724, -1.724796, 3.039322, 1, 1, 1, 1, 1,
0.644353, 0.5177497, -0.9139516, 1, 1, 1, 1, 1,
0.6446049, 1.220157, 0.8439696, 1, 1, 1, 1, 1,
0.6450813, -0.5709226, 2.665813, 1, 1, 1, 1, 1,
0.6520943, 2.133519, 0.9916019, 1, 1, 1, 1, 1,
0.6531362, 0.5732126, 1.693913, 1, 1, 1, 1, 1,
0.6539592, -0.8874297, 2.718091, 1, 1, 1, 1, 1,
0.6547228, 1.425852, -0.08464143, 1, 1, 1, 1, 1,
0.6657439, -0.2358855, 3.191552, 1, 1, 1, 1, 1,
0.6665563, 0.7176941, 2.165506, 0, 0, 1, 1, 1,
0.6721929, 0.1983873, 0.9710377, 1, 0, 0, 1, 1,
0.6744134, -0.4443765, 2.976896, 1, 0, 0, 1, 1,
0.675454, -1.549529, 3.449937, 1, 0, 0, 1, 1,
0.6756566, 0.3604258, -0.4503947, 1, 0, 0, 1, 1,
0.6789618, -0.2473221, 1.775905, 1, 0, 0, 1, 1,
0.6818826, -0.05833961, 1.812878, 0, 0, 0, 1, 1,
0.6853594, 0.4962473, 1.555263, 0, 0, 0, 1, 1,
0.6893911, 0.7251411, -0.7788408, 0, 0, 0, 1, 1,
0.6901604, -0.443335, 0.8524148, 0, 0, 0, 1, 1,
0.690831, -1.244318, 3.616605, 0, 0, 0, 1, 1,
0.695798, -0.3240796, 2.554302, 0, 0, 0, 1, 1,
0.6968325, -0.5206831, 1.545549, 0, 0, 0, 1, 1,
0.7044996, -1.38831, 2.961084, 1, 1, 1, 1, 1,
0.7050294, -0.9434723, 2.124747, 1, 1, 1, 1, 1,
0.7069159, -0.6188414, 2.860611, 1, 1, 1, 1, 1,
0.7073926, 0.7549285, 0.6376955, 1, 1, 1, 1, 1,
0.7100265, 0.8631642, 1.230707, 1, 1, 1, 1, 1,
0.7183783, 0.8437645, -0.4628408, 1, 1, 1, 1, 1,
0.7190046, -1.053637, 3.158163, 1, 1, 1, 1, 1,
0.7288756, 0.9057196, 0.3645556, 1, 1, 1, 1, 1,
0.735824, -0.8993138, 0.8997585, 1, 1, 1, 1, 1,
0.7371773, 0.9648122, 0.4586754, 1, 1, 1, 1, 1,
0.7414557, -1.421297, 1.660187, 1, 1, 1, 1, 1,
0.7429318, 1.340493, -0.6403139, 1, 1, 1, 1, 1,
0.7449948, 1.032105, 0.03428126, 1, 1, 1, 1, 1,
0.7476391, -0.5422047, 2.826487, 1, 1, 1, 1, 1,
0.749764, 1.051901, -1.093415, 1, 1, 1, 1, 1,
0.7639796, -2.190973, 3.105479, 0, 0, 1, 1, 1,
0.766176, -1.705055, 2.955642, 1, 0, 0, 1, 1,
0.767844, 0.01481593, 2.024111, 1, 0, 0, 1, 1,
0.7692454, 1.342812, 1.447041, 1, 0, 0, 1, 1,
0.7693688, -0.4379758, 3.881898, 1, 0, 0, 1, 1,
0.770173, 0.2690479, 1.20109, 1, 0, 0, 1, 1,
0.7732471, -0.3967991, 1.680057, 0, 0, 0, 1, 1,
0.7782487, -1.702725, 2.505436, 0, 0, 0, 1, 1,
0.790561, 0.7351745, 0.7760566, 0, 0, 0, 1, 1,
0.7947561, 0.3458697, 1.219605, 0, 0, 0, 1, 1,
0.7964996, -0.6773829, 4.125739, 0, 0, 0, 1, 1,
0.7976606, 0.7985116, 2.103652, 0, 0, 0, 1, 1,
0.7990146, 1.21508, -0.1091013, 0, 0, 0, 1, 1,
0.80435, -0.8512288, 4.066982, 1, 1, 1, 1, 1,
0.8061906, -0.3101973, 0.9120624, 1, 1, 1, 1, 1,
0.8065383, -0.4009791, 2.367786, 1, 1, 1, 1, 1,
0.8103992, -0.6762937, 2.325082, 1, 1, 1, 1, 1,
0.8288862, -1.870031, 1.932312, 1, 1, 1, 1, 1,
0.8324129, -0.9826615, 2.670262, 1, 1, 1, 1, 1,
0.8328571, 0.1732202, 3.09005, 1, 1, 1, 1, 1,
0.8342875, -0.3151528, 2.28294, 1, 1, 1, 1, 1,
0.8361398, 0.484302, 1.545373, 1, 1, 1, 1, 1,
0.8402965, -0.4434879, 1.982664, 1, 1, 1, 1, 1,
0.8439986, 0.7870052, 0.2470783, 1, 1, 1, 1, 1,
0.8480479, -0.03010872, 2.51156, 1, 1, 1, 1, 1,
0.8486497, -0.009333367, 0.2939089, 1, 1, 1, 1, 1,
0.8492859, -2.430622, 3.195423, 1, 1, 1, 1, 1,
0.850287, 0.3810177, 0.6326535, 1, 1, 1, 1, 1,
0.8653042, 1.764633, -0.3391732, 0, 0, 1, 1, 1,
0.8686938, 0.2582622, 1.093313, 1, 0, 0, 1, 1,
0.8703099, 1.384418, 0.3058584, 1, 0, 0, 1, 1,
0.8735895, -0.1640635, 1.265211, 1, 0, 0, 1, 1,
0.8750526, 0.4903846, 2.084094, 1, 0, 0, 1, 1,
0.8755139, -0.1199264, 0.9746893, 1, 0, 0, 1, 1,
0.886708, -1.190215, 0.6122526, 0, 0, 0, 1, 1,
0.8920003, 1.272876, 0.5409147, 0, 0, 0, 1, 1,
0.89324, -0.5951498, 2.956319, 0, 0, 0, 1, 1,
0.8942601, 0.5781716, 1.725628, 0, 0, 0, 1, 1,
0.8979192, 0.08659157, 1.115806, 0, 0, 0, 1, 1,
0.8981516, -0.1915866, 2.207437, 0, 0, 0, 1, 1,
0.9062303, -2.240952, 4.281934, 0, 0, 0, 1, 1,
0.9076192, 1.118917, 1.76546, 1, 1, 1, 1, 1,
0.9117815, -0.03453214, 1.784016, 1, 1, 1, 1, 1,
0.9206136, 0.9125744, 2.27152, 1, 1, 1, 1, 1,
0.9278941, 1.146615, 0.1045484, 1, 1, 1, 1, 1,
0.9299548, 2.011235, 0.9632784, 1, 1, 1, 1, 1,
0.9318773, -0.3009702, 0.5780909, 1, 1, 1, 1, 1,
0.9341771, -0.5873463, 4.007648, 1, 1, 1, 1, 1,
0.9393297, -0.8792373, 0.9277731, 1, 1, 1, 1, 1,
0.9418243, 0.4608256, 3.032871, 1, 1, 1, 1, 1,
0.9479424, 0.6063405, 1.894936, 1, 1, 1, 1, 1,
0.9553638, 1.150573, 2.459168, 1, 1, 1, 1, 1,
0.957383, -1.237521, 2.46656, 1, 1, 1, 1, 1,
0.9640261, 0.2376107, 1.971557, 1, 1, 1, 1, 1,
0.9785898, -1.057899, 3.514551, 1, 1, 1, 1, 1,
0.9878669, -0.7217246, 2.158486, 1, 1, 1, 1, 1,
0.999958, 1.061424, 0.127626, 0, 0, 1, 1, 1,
1.000595, -0.3927777, 1.033751, 1, 0, 0, 1, 1,
1.00639, -0.6048341, 3.004826, 1, 0, 0, 1, 1,
1.009581, -1.325967, 2.659321, 1, 0, 0, 1, 1,
1.018597, -0.06083749, 2.057275, 1, 0, 0, 1, 1,
1.029041, 0.7115247, 1.735007, 1, 0, 0, 1, 1,
1.033787, 0.2785273, 0.8023213, 0, 0, 0, 1, 1,
1.03729, -1.084812, 3.867513, 0, 0, 0, 1, 1,
1.044595, -1.237752, 1.710389, 0, 0, 0, 1, 1,
1.045477, -0.904885, 3.268236, 0, 0, 0, 1, 1,
1.05292, -0.9183692, 0.5116626, 0, 0, 0, 1, 1,
1.056798, -0.5967676, 3.582651, 0, 0, 0, 1, 1,
1.057211, -1.829162, 3.432956, 0, 0, 0, 1, 1,
1.058477, 1.633865, 0.2684056, 1, 1, 1, 1, 1,
1.059605, -1.531627, 1.744353, 1, 1, 1, 1, 1,
1.061306, -0.2836508, 2.919559, 1, 1, 1, 1, 1,
1.063668, 1.526078, 2.380788, 1, 1, 1, 1, 1,
1.073694, -2.229209, 2.976653, 1, 1, 1, 1, 1,
1.075858, -0.2963406, 2.457785, 1, 1, 1, 1, 1,
1.077791, -0.1042355, 2.182088, 1, 1, 1, 1, 1,
1.078392, -1.459602, 2.676292, 1, 1, 1, 1, 1,
1.079241, -0.5770637, 1.839758, 1, 1, 1, 1, 1,
1.087102, 0.4232861, 3.248191, 1, 1, 1, 1, 1,
1.087861, -0.03892566, 1.950885, 1, 1, 1, 1, 1,
1.090337, 0.1066669, 1.709692, 1, 1, 1, 1, 1,
1.09512, 0.09034041, 1.568057, 1, 1, 1, 1, 1,
1.099417, -1.483348, 2.407324, 1, 1, 1, 1, 1,
1.1067, 1.603112, 0.3075542, 1, 1, 1, 1, 1,
1.107269, 0.6245669, 0.008312222, 0, 0, 1, 1, 1,
1.117555, 0.2867039, 2.345808, 1, 0, 0, 1, 1,
1.122122, 0.9842896, -1.231916, 1, 0, 0, 1, 1,
1.125139, 0.8115352, 1.640656, 1, 0, 0, 1, 1,
1.128159, 0.3077148, 1.328502, 1, 0, 0, 1, 1,
1.135322, -0.7899613, 1.96704, 1, 0, 0, 1, 1,
1.141187, -1.309898, 2.830111, 0, 0, 0, 1, 1,
1.166662, -1.19792, 3.037433, 0, 0, 0, 1, 1,
1.168202, 0.4566586, 0.3713714, 0, 0, 0, 1, 1,
1.173046, -0.05872837, 2.566194, 0, 0, 0, 1, 1,
1.192073, 0.4946007, 0.4902264, 0, 0, 0, 1, 1,
1.193916, 0.02043131, 1.777711, 0, 0, 0, 1, 1,
1.204144, -1.030058, 1.998534, 0, 0, 0, 1, 1,
1.205956, 0.6853023, 1.697545, 1, 1, 1, 1, 1,
1.218192, 1.613595, 1.496752, 1, 1, 1, 1, 1,
1.224795, -1.411971, 1.777662, 1, 1, 1, 1, 1,
1.227906, -0.6790504, 2.320809, 1, 1, 1, 1, 1,
1.233126, 1.177986, 1.824521, 1, 1, 1, 1, 1,
1.240822, 0.08948928, 1.883412, 1, 1, 1, 1, 1,
1.249851, -0.7780889, 1.052828, 1, 1, 1, 1, 1,
1.267419, -1.051105, 3.455359, 1, 1, 1, 1, 1,
1.270447, 0.2054042, 2.133304, 1, 1, 1, 1, 1,
1.275035, -0.1841072, 3.092073, 1, 1, 1, 1, 1,
1.275281, -0.4179529, 3.316722, 1, 1, 1, 1, 1,
1.279847, 0.6337864, 1.809009, 1, 1, 1, 1, 1,
1.291051, 0.6057575, 1.201585, 1, 1, 1, 1, 1,
1.292565, -0.03059838, 2.277761, 1, 1, 1, 1, 1,
1.300324, 1.644106, -1.212044, 1, 1, 1, 1, 1,
1.302864, 0.9963672, 0.8474422, 0, 0, 1, 1, 1,
1.312022, 1.139938, 1.320545, 1, 0, 0, 1, 1,
1.321691, 0.8362122, 0.977825, 1, 0, 0, 1, 1,
1.322026, -1.628124, 3.390227, 1, 0, 0, 1, 1,
1.329459, -0.750573, 3.064361, 1, 0, 0, 1, 1,
1.334995, 0.8064082, -0.01802679, 1, 0, 0, 1, 1,
1.337787, -1.298778, 2.349311, 0, 0, 0, 1, 1,
1.338034, -0.8694175, 2.811517, 0, 0, 0, 1, 1,
1.339848, 0.5773049, 1.479876, 0, 0, 0, 1, 1,
1.340212, 2.576276, -0.7587985, 0, 0, 0, 1, 1,
1.35363, -0.1033711, 0.2612846, 0, 0, 0, 1, 1,
1.359733, 0.4957379, 0.03238826, 0, 0, 0, 1, 1,
1.364339, -0.9081429, 2.387829, 0, 0, 0, 1, 1,
1.364893, -0.04703741, 2.805051, 1, 1, 1, 1, 1,
1.367883, 0.2992472, -0.1016049, 1, 1, 1, 1, 1,
1.375213, -0.05693751, 1.389552, 1, 1, 1, 1, 1,
1.377551, 0.1651103, 2.996326, 1, 1, 1, 1, 1,
1.380437, -0.8918797, 3.024807, 1, 1, 1, 1, 1,
1.389906, 0.5826765, 1.551314, 1, 1, 1, 1, 1,
1.398288, -0.6344643, 3.565933, 1, 1, 1, 1, 1,
1.4103, -0.1784922, -0.8075954, 1, 1, 1, 1, 1,
1.418495, 0.5135957, 1.074183, 1, 1, 1, 1, 1,
1.428282, -1.130073, 0.9590715, 1, 1, 1, 1, 1,
1.435857, 0.7185315, 1.345836, 1, 1, 1, 1, 1,
1.438441, 0.5777722, -0.9901366, 1, 1, 1, 1, 1,
1.441312, 1.200541, 0.3278229, 1, 1, 1, 1, 1,
1.441942, -1.278571, 2.882286, 1, 1, 1, 1, 1,
1.442488, -1.074911, 1.789069, 1, 1, 1, 1, 1,
1.444189, -1.014239, 2.012959, 0, 0, 1, 1, 1,
1.446884, 0.6152484, -1.243845, 1, 0, 0, 1, 1,
1.459394, 0.06572853, 2.006191, 1, 0, 0, 1, 1,
1.461784, 1.192766, 1.619645, 1, 0, 0, 1, 1,
1.461968, -0.1131719, -0.02713721, 1, 0, 0, 1, 1,
1.463075, 0.06615616, 2.941448, 1, 0, 0, 1, 1,
1.469118, 0.1385916, 0.4990583, 0, 0, 0, 1, 1,
1.47557, 0.8026346, 1.011258, 0, 0, 0, 1, 1,
1.475965, -0.7955241, 1.89442, 0, 0, 0, 1, 1,
1.477337, 0.3925, -0.132627, 0, 0, 0, 1, 1,
1.486274, -0.2070808, 0.808297, 0, 0, 0, 1, 1,
1.502607, 0.3218488, 3.555827, 0, 0, 0, 1, 1,
1.508893, 1.50478, -0.9648877, 0, 0, 0, 1, 1,
1.509838, 1.866554, -0.2046624, 1, 1, 1, 1, 1,
1.512068, -1.660318, 3.916937, 1, 1, 1, 1, 1,
1.525156, 0.7992203, 1.065081, 1, 1, 1, 1, 1,
1.539982, -0.8469819, 2.250438, 1, 1, 1, 1, 1,
1.550041, -1.830507, 2.61677, 1, 1, 1, 1, 1,
1.556472, 1.337312, 1.110846, 1, 1, 1, 1, 1,
1.563403, -0.7327892, 2.855271, 1, 1, 1, 1, 1,
1.576864, 0.2681987, 0.8544902, 1, 1, 1, 1, 1,
1.579663, -0.0007147811, -0.04623636, 1, 1, 1, 1, 1,
1.584769, -0.6462232, 1.628048, 1, 1, 1, 1, 1,
1.59562, 1.634689, 0.2388547, 1, 1, 1, 1, 1,
1.596611, -2.37312, 2.605511, 1, 1, 1, 1, 1,
1.596797, 1.42636, 0.5266802, 1, 1, 1, 1, 1,
1.597861, 0.5927674, 3.12904, 1, 1, 1, 1, 1,
1.603294, -0.5225657, 1.900762, 1, 1, 1, 1, 1,
1.630083, 0.8881024, 1.324176, 0, 0, 1, 1, 1,
1.640925, -0.4382302, 1.949416, 1, 0, 0, 1, 1,
1.650278, -0.5490761, 2.186022, 1, 0, 0, 1, 1,
1.68197, 0.5299404, 0.7800095, 1, 0, 0, 1, 1,
1.697063, -0.3667903, 0.7399848, 1, 0, 0, 1, 1,
1.704351, 0.4367145, 1.116091, 1, 0, 0, 1, 1,
1.710866, 1.025406, 1.855023, 0, 0, 0, 1, 1,
1.71592, 0.7601431, 2.149594, 0, 0, 0, 1, 1,
1.753807, -0.3800621, 1.225088, 0, 0, 0, 1, 1,
1.784104, -0.2403155, 1.841256, 0, 0, 0, 1, 1,
1.804087, -0.8007538, -0.1550268, 0, 0, 0, 1, 1,
1.812806, -0.9456911, 0.6762499, 0, 0, 0, 1, 1,
1.834469, 0.9310102, 2.582746, 0, 0, 0, 1, 1,
1.856224, -1.016289, 3.649423, 1, 1, 1, 1, 1,
1.863413, 0.9881684, 0.626606, 1, 1, 1, 1, 1,
1.873459, 0.5330826, -0.1699083, 1, 1, 1, 1, 1,
1.884727, -1.119747, 0.9471468, 1, 1, 1, 1, 1,
1.891596, 0.7290322, 1.047662, 1, 1, 1, 1, 1,
1.906856, -1.063007, 3.377498, 1, 1, 1, 1, 1,
1.95908, 0.07081591, 1.074724, 1, 1, 1, 1, 1,
1.959572, -0.4188277, 2.218641, 1, 1, 1, 1, 1,
1.969314, -0.1017963, 2.654429, 1, 1, 1, 1, 1,
1.980904, -0.8180304, 2.34371, 1, 1, 1, 1, 1,
2.007287, -1.11283, 0.6952168, 1, 1, 1, 1, 1,
2.014295, 0.1355528, 1.434925, 1, 1, 1, 1, 1,
2.016163, 1.423584, 1.105774, 1, 1, 1, 1, 1,
2.018019, -0.7635739, 0.6342866, 1, 1, 1, 1, 1,
2.021704, 0.0611156, 0.5895585, 1, 1, 1, 1, 1,
2.070531, -0.5267879, 1.120021, 0, 0, 1, 1, 1,
2.090494, 2.095893, -0.4276802, 1, 0, 0, 1, 1,
2.114795, -2.131598, 1.637938, 1, 0, 0, 1, 1,
2.195223, -0.4969459, 0.07940523, 1, 0, 0, 1, 1,
2.280671, 1.24602, 0.1520597, 1, 0, 0, 1, 1,
2.293729, -0.5538496, 1.465032, 1, 0, 0, 1, 1,
2.372136, -1.186099, 3.297475, 0, 0, 0, 1, 1,
2.417853, 2.261608, -1.284747, 0, 0, 0, 1, 1,
2.449906, -0.2394116, -0.5514587, 0, 0, 0, 1, 1,
2.505936, -1.191461, 2.60914, 0, 0, 0, 1, 1,
2.572352, 0.1746661, 2.319901, 0, 0, 0, 1, 1,
2.621988, 0.6818841, -0.5247391, 0, 0, 0, 1, 1,
2.628537, 0.04674255, 2.17417, 0, 0, 0, 1, 1,
2.641183, 1.291207, 1.103096, 1, 1, 1, 1, 1,
2.655257, -1.196231, 3.115012, 1, 1, 1, 1, 1,
2.734244, 0.3835398, 1.472383, 1, 1, 1, 1, 1,
2.73622, 0.4053769, 1.458422, 1, 1, 1, 1, 1,
2.85193, -0.7807945, 1.629722, 1, 1, 1, 1, 1,
2.965752, 0.4970591, 3.186211, 1, 1, 1, 1, 1,
3.64706, 1.586028, 1.366462, 1, 1, 1, 1, 1
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
var radius = 10.0619;
var distance = 35.34198;
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
mvMatrix.translate( -0.1472065, 0.1676906, 0.5927134 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.34198);
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