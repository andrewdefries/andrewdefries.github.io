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
-3.353423, 1.173908, -0.02514398, 1, 0, 0, 1,
-3.132215, 1.16672, 1.081907, 1, 0.007843138, 0, 1,
-2.694316, -0.8350842, -1.638166, 1, 0.01176471, 0, 1,
-2.551706, -0.4996955, -2.481571, 1, 0.01960784, 0, 1,
-2.497198, 0.04513377, -1.425756, 1, 0.02352941, 0, 1,
-2.411941, -1.035167, -2.017353, 1, 0.03137255, 0, 1,
-2.35835, 0.9774169, -0.4228318, 1, 0.03529412, 0, 1,
-2.356772, 0.6382249, -1.846512, 1, 0.04313726, 0, 1,
-2.321167, 1.281943, -0.712514, 1, 0.04705882, 0, 1,
-2.296842, -0.6339952, -1.234963, 1, 0.05490196, 0, 1,
-2.279044, 2.569516, -1.783512, 1, 0.05882353, 0, 1,
-2.226659, -0.305797, -1.176563, 1, 0.06666667, 0, 1,
-2.217112, 0.3653516, -1.480626, 1, 0.07058824, 0, 1,
-2.21616, 0.7433774, -1.627576, 1, 0.07843138, 0, 1,
-2.185578, 2.125055, 0.8036451, 1, 0.08235294, 0, 1,
-2.176009, -0.4349338, -2.246694, 1, 0.09019608, 0, 1,
-2.131727, -0.7185028, -0.7608539, 1, 0.09411765, 0, 1,
-2.127627, 1.221641, -0.13097, 1, 0.1019608, 0, 1,
-2.100436, 0.2671495, -2.478075, 1, 0.1098039, 0, 1,
-2.082252, 0.8874151, -0.3894125, 1, 0.1137255, 0, 1,
-2.079031, -2.49223, -4.043193, 1, 0.1215686, 0, 1,
-2.05125, -0.755106, -1.005383, 1, 0.1254902, 0, 1,
-2.029126, -0.5936712, -0.2927535, 1, 0.1333333, 0, 1,
-2.00275, -0.2007692, -1.784589, 1, 0.1372549, 0, 1,
-1.958049, 0.1630148, -0.677609, 1, 0.145098, 0, 1,
-1.945882, -1.416621, -0.8503641, 1, 0.1490196, 0, 1,
-1.941361, -0.8797513, -1.134713, 1, 0.1568628, 0, 1,
-1.938401, 0.1887674, -0.5235792, 1, 0.1607843, 0, 1,
-1.93375, 0.3217561, -0.1633108, 1, 0.1686275, 0, 1,
-1.920083, -0.1149178, -1.237586, 1, 0.172549, 0, 1,
-1.909528, 0.26391, -1.498785, 1, 0.1803922, 0, 1,
-1.907797, -1.371979, -2.52996, 1, 0.1843137, 0, 1,
-1.890077, 0.6504377, -2.435458, 1, 0.1921569, 0, 1,
-1.876979, 0.09930211, -1.413814, 1, 0.1960784, 0, 1,
-1.862147, 0.4452556, -1.356893, 1, 0.2039216, 0, 1,
-1.835619, -0.4367618, -2.537715, 1, 0.2117647, 0, 1,
-1.819197, 2.042198, -1.679066, 1, 0.2156863, 0, 1,
-1.8134, -1.156702, -2.385242, 1, 0.2235294, 0, 1,
-1.805674, -0.6648493, -1.440773, 1, 0.227451, 0, 1,
-1.799897, 1.144424, -0.7725075, 1, 0.2352941, 0, 1,
-1.796869, -1.447722, -2.875495, 1, 0.2392157, 0, 1,
-1.771296, -0.3016409, -1.296929, 1, 0.2470588, 0, 1,
-1.768926, -1.552343, -1.47487, 1, 0.2509804, 0, 1,
-1.762344, -0.102589, -1.91478, 1, 0.2588235, 0, 1,
-1.761133, -0.5188367, -2.260077, 1, 0.2627451, 0, 1,
-1.710454, 1.84805, -1.60592, 1, 0.2705882, 0, 1,
-1.705987, 0.1402064, -1.043067, 1, 0.2745098, 0, 1,
-1.697792, 0.972584, -1.194322, 1, 0.282353, 0, 1,
-1.690587, 1.652846, -0.2277778, 1, 0.2862745, 0, 1,
-1.685022, 0.2919295, -0.9054301, 1, 0.2941177, 0, 1,
-1.681818, 0.4811541, -1.275745, 1, 0.3019608, 0, 1,
-1.670072, -1.50861, -1.940899, 1, 0.3058824, 0, 1,
-1.669597, 1.014964, -0.1902757, 1, 0.3137255, 0, 1,
-1.64682, 0.9669389, -0.2953953, 1, 0.3176471, 0, 1,
-1.637578, 1.268131, -1.106595, 1, 0.3254902, 0, 1,
-1.632251, 0.344068, -2.195706, 1, 0.3294118, 0, 1,
-1.631636, 0.6791596, -2.714252, 1, 0.3372549, 0, 1,
-1.609137, 0.7106534, -1.978842, 1, 0.3411765, 0, 1,
-1.602592, -2.111088, -2.564689, 1, 0.3490196, 0, 1,
-1.591739, -1.587388, -4.329259, 1, 0.3529412, 0, 1,
-1.576831, 0.3262974, -0.3046177, 1, 0.3607843, 0, 1,
-1.567336, 0.4960622, -0.7357985, 1, 0.3647059, 0, 1,
-1.565458, -0.6337049, -1.87968, 1, 0.372549, 0, 1,
-1.5647, -0.6224492, -2.857347, 1, 0.3764706, 0, 1,
-1.562912, -0.7902063, -1.737712, 1, 0.3843137, 0, 1,
-1.558038, 0.7357969, 2.203089, 1, 0.3882353, 0, 1,
-1.54931, -0.8925727, -0.853981, 1, 0.3960784, 0, 1,
-1.538568, 1.337678, -0.1291825, 1, 0.4039216, 0, 1,
-1.53758, 0.01999538, -1.638551, 1, 0.4078431, 0, 1,
-1.519936, 1.140427, -0.892727, 1, 0.4156863, 0, 1,
-1.51887, -0.9371246, -1.32123, 1, 0.4196078, 0, 1,
-1.51881, 1.251805, -0.3736688, 1, 0.427451, 0, 1,
-1.511323, -0.8808327, -2.785501, 1, 0.4313726, 0, 1,
-1.499542, -0.5379242, -0.9871283, 1, 0.4392157, 0, 1,
-1.482415, 0.08683103, -0.6599725, 1, 0.4431373, 0, 1,
-1.481909, 1.264955, -1.15307, 1, 0.4509804, 0, 1,
-1.479382, -0.2375296, -2.294469, 1, 0.454902, 0, 1,
-1.478664, 0.5113963, -0.8362305, 1, 0.4627451, 0, 1,
-1.465598, -0.7317834, -1.636283, 1, 0.4666667, 0, 1,
-1.463746, 0.7992004, -0.1098209, 1, 0.4745098, 0, 1,
-1.46315, 0.9038162, 1.997469, 1, 0.4784314, 0, 1,
-1.456961, -0.02321458, -2.120669, 1, 0.4862745, 0, 1,
-1.454936, -0.7381453, -1.456257, 1, 0.4901961, 0, 1,
-1.454258, -0.09125082, -3.240236, 1, 0.4980392, 0, 1,
-1.452937, 0.09647169, -0.4806589, 1, 0.5058824, 0, 1,
-1.440013, 0.4690664, -1.446618, 1, 0.509804, 0, 1,
-1.439275, -1.596395, -2.592092, 1, 0.5176471, 0, 1,
-1.433252, -0.658571, -0.9724479, 1, 0.5215687, 0, 1,
-1.424408, -2.502692, -3.523232, 1, 0.5294118, 0, 1,
-1.419637, -0.3143517, -1.390594, 1, 0.5333334, 0, 1,
-1.414957, -0.3619618, -2.343696, 1, 0.5411765, 0, 1,
-1.413884, 0.8517142, -0.6846792, 1, 0.5450981, 0, 1,
-1.412879, -1.576744, -1.866481, 1, 0.5529412, 0, 1,
-1.408402, 0.03228969, -0.7555265, 1, 0.5568628, 0, 1,
-1.396649, 0.04022078, -1.462482, 1, 0.5647059, 0, 1,
-1.393736, 0.5286002, -1.682985, 1, 0.5686275, 0, 1,
-1.392175, 0.6961673, -0.4588695, 1, 0.5764706, 0, 1,
-1.386263, 0.562295, -0.5845097, 1, 0.5803922, 0, 1,
-1.379319, 0.3823786, -2.348303, 1, 0.5882353, 0, 1,
-1.361516, 1.007615, -2.310553, 1, 0.5921569, 0, 1,
-1.357363, -0.370724, -2.261714, 1, 0.6, 0, 1,
-1.348897, -1.757627, -0.669759, 1, 0.6078432, 0, 1,
-1.346123, -1.02782, -1.883743, 1, 0.6117647, 0, 1,
-1.339309, -0.9420804, -1.390458, 1, 0.6196079, 0, 1,
-1.337433, 1.821364, 0.8267356, 1, 0.6235294, 0, 1,
-1.320276, -1.261809, -1.100278, 1, 0.6313726, 0, 1,
-1.315388, 1.872199, -0.9449469, 1, 0.6352941, 0, 1,
-1.305905, 1.086962, -0.8293311, 1, 0.6431373, 0, 1,
-1.295338, -0.5660336, -3.626538, 1, 0.6470588, 0, 1,
-1.293856, -0.126555, -0.8606049, 1, 0.654902, 0, 1,
-1.279742, 0.1078941, -0.1299247, 1, 0.6588235, 0, 1,
-1.278008, 0.5337135, -0.8857712, 1, 0.6666667, 0, 1,
-1.275951, -0.1776868, -0.4491738, 1, 0.6705883, 0, 1,
-1.265586, -0.74988, -3.614994, 1, 0.6784314, 0, 1,
-1.263305, -0.8299454, -3.458225, 1, 0.682353, 0, 1,
-1.258926, -0.8784746, -3.364197, 1, 0.6901961, 0, 1,
-1.252094, 0.4391442, 1.323156, 1, 0.6941177, 0, 1,
-1.242257, -1.000531, -2.049285, 1, 0.7019608, 0, 1,
-1.240712, -1.365384, -1.880216, 1, 0.7098039, 0, 1,
-1.21973, 0.05165548, -2.757738, 1, 0.7137255, 0, 1,
-1.21262, 0.7543445, -1.403188, 1, 0.7215686, 0, 1,
-1.210503, -1.891665, -3.204813, 1, 0.7254902, 0, 1,
-1.194189, 1.241639, -1.307817, 1, 0.7333333, 0, 1,
-1.184213, -0.6402928, -1.518028, 1, 0.7372549, 0, 1,
-1.183718, 0.335094, -0.0793428, 1, 0.7450981, 0, 1,
-1.180758, 0.6908623, -1.673874, 1, 0.7490196, 0, 1,
-1.176485, -0.3039369, -1.830823, 1, 0.7568628, 0, 1,
-1.170987, 0.05147647, -2.079888, 1, 0.7607843, 0, 1,
-1.167381, -0.1860716, -3.660638, 1, 0.7686275, 0, 1,
-1.167252, -1.282844, -1.70117, 1, 0.772549, 0, 1,
-1.164963, -0.7999408, -4.404742, 1, 0.7803922, 0, 1,
-1.163229, 1.361371, 0.2848841, 1, 0.7843137, 0, 1,
-1.159832, 0.2231015, -1.591877, 1, 0.7921569, 0, 1,
-1.154401, 0.5007051, -2.067973, 1, 0.7960784, 0, 1,
-1.146019, -0.1540588, -3.64716, 1, 0.8039216, 0, 1,
-1.134115, -0.4840668, -2.570178, 1, 0.8117647, 0, 1,
-1.127416, -0.7300292, -3.413845, 1, 0.8156863, 0, 1,
-1.12466, -1.045006, 0.2450344, 1, 0.8235294, 0, 1,
-1.115741, 0.6198552, -1.528525, 1, 0.827451, 0, 1,
-1.104217, -0.346181, -1.551594, 1, 0.8352941, 0, 1,
-1.094321, 1.535864, 0.007204928, 1, 0.8392157, 0, 1,
-1.093434, 0.3640833, -0.3651589, 1, 0.8470588, 0, 1,
-1.090886, -1.008279, -1.676107, 1, 0.8509804, 0, 1,
-1.085796, 0.9993933, -1.541571, 1, 0.8588235, 0, 1,
-1.077492, -0.2784212, -1.377876, 1, 0.8627451, 0, 1,
-1.075057, -0.09026973, -1.376904, 1, 0.8705882, 0, 1,
-1.06839, 2.290542, 0.7368063, 1, 0.8745098, 0, 1,
-1.066156, 0.3890465, -1.004547, 1, 0.8823529, 0, 1,
-1.049204, -0.7270929, -4.178539, 1, 0.8862745, 0, 1,
-1.040732, 1.048772, -0.9388806, 1, 0.8941177, 0, 1,
-1.034524, 1.171443, -0.4926248, 1, 0.8980392, 0, 1,
-1.034412, -0.3465053, -3.625909, 1, 0.9058824, 0, 1,
-1.031809, 0.6692171, -1.550125, 1, 0.9137255, 0, 1,
-1.0273, -0.1251809, -3.431849, 1, 0.9176471, 0, 1,
-1.019657, -0.5297632, -2.668927, 1, 0.9254902, 0, 1,
-1.019319, -0.6308275, -3.424912, 1, 0.9294118, 0, 1,
-1.018042, -0.4417278, -1.803604, 1, 0.9372549, 0, 1,
-1.012542, 0.3147722, -2.592273, 1, 0.9411765, 0, 1,
-1.009644, 0.6802432, -0.617899, 1, 0.9490196, 0, 1,
-1.008081, -1.690679, -1.708592, 1, 0.9529412, 0, 1,
-1.006602, -0.427195, -0.8766662, 1, 0.9607843, 0, 1,
-1.00474, 0.7957323, -2.349538, 1, 0.9647059, 0, 1,
-0.9989917, 0.1175542, 0.41824, 1, 0.972549, 0, 1,
-0.9989593, -0.792253, -3.495591, 1, 0.9764706, 0, 1,
-0.9954505, 0.2696287, -1.872593, 1, 0.9843137, 0, 1,
-0.994422, 1.095886, -1.29106, 1, 0.9882353, 0, 1,
-0.9922745, -0.496251, -3.5649, 1, 0.9960784, 0, 1,
-0.986607, -0.3301456, -1.772576, 0.9960784, 1, 0, 1,
-0.9841435, -0.1650862, -2.259481, 0.9921569, 1, 0, 1,
-0.9832115, -1.388849, -1.947035, 0.9843137, 1, 0, 1,
-0.9782961, -2.23554, -3.396214, 0.9803922, 1, 0, 1,
-0.9782887, -0.3702421, -1.287992, 0.972549, 1, 0, 1,
-0.9782215, -1.72875, -1.8506, 0.9686275, 1, 0, 1,
-0.9765891, 0.9874642, -1.011695, 0.9607843, 1, 0, 1,
-0.9748511, 2.253765, -0.7644226, 0.9568627, 1, 0, 1,
-0.9612034, 0.3292348, -0.4698925, 0.9490196, 1, 0, 1,
-0.95807, 0.8463185, -1.895262, 0.945098, 1, 0, 1,
-0.9578279, 1.374445, -1.413616, 0.9372549, 1, 0, 1,
-0.9484305, -1.046017, -2.66023, 0.9333333, 1, 0, 1,
-0.9475155, 0.1101411, -1.447925, 0.9254902, 1, 0, 1,
-0.9474967, -0.6227173, -1.932413, 0.9215686, 1, 0, 1,
-0.9434979, -1.449805, -2.932368, 0.9137255, 1, 0, 1,
-0.9426251, 1.111459, 0.7530252, 0.9098039, 1, 0, 1,
-0.9392152, -0.3875167, -1.397005, 0.9019608, 1, 0, 1,
-0.9310451, 0.09275334, -1.488569, 0.8941177, 1, 0, 1,
-0.9278856, -1.30247, -2.820548, 0.8901961, 1, 0, 1,
-0.9181833, -0.257796, -2.143016, 0.8823529, 1, 0, 1,
-0.9130879, -1.523968, -3.346772, 0.8784314, 1, 0, 1,
-0.9093102, -0.5261219, -1.050964, 0.8705882, 1, 0, 1,
-0.9015324, -0.07823682, -3.685369, 0.8666667, 1, 0, 1,
-0.9003732, -0.01358937, -0.337435, 0.8588235, 1, 0, 1,
-0.9002267, 0.1562296, -2.900672, 0.854902, 1, 0, 1,
-0.8928254, -1.116835, -2.281148, 0.8470588, 1, 0, 1,
-0.8776978, 0.06781463, -2.491982, 0.8431373, 1, 0, 1,
-0.8753486, -0.1517729, 0.2785887, 0.8352941, 1, 0, 1,
-0.8722375, 0.8001723, 0.3493489, 0.8313726, 1, 0, 1,
-0.8691756, -0.9145973, -1.77448, 0.8235294, 1, 0, 1,
-0.8656141, 0.2169254, -1.203069, 0.8196079, 1, 0, 1,
-0.8616734, 0.2108674, -1.27346, 0.8117647, 1, 0, 1,
-0.8568196, -0.7451493, -1.544138, 0.8078431, 1, 0, 1,
-0.8505878, -1.419747, -2.455927, 0.8, 1, 0, 1,
-0.848111, -1.221211, -2.64183, 0.7921569, 1, 0, 1,
-0.8433688, -0.110551, -1.566223, 0.7882353, 1, 0, 1,
-0.8429845, -0.243925, -1.280135, 0.7803922, 1, 0, 1,
-0.8378494, 1.459121, 0.5570751, 0.7764706, 1, 0, 1,
-0.8375169, -0.6329911, -0.1898476, 0.7686275, 1, 0, 1,
-0.8351328, -1.044468, -1.706332, 0.7647059, 1, 0, 1,
-0.8292617, -0.1255076, -2.387885, 0.7568628, 1, 0, 1,
-0.828925, -0.3952927, -1.614314, 0.7529412, 1, 0, 1,
-0.8155207, 0.4453819, -0.3700222, 0.7450981, 1, 0, 1,
-0.8126892, 0.002162578, -2.087569, 0.7411765, 1, 0, 1,
-0.8040592, -0.3857879, -2.138413, 0.7333333, 1, 0, 1,
-0.7992494, -0.03904086, -0.1192949, 0.7294118, 1, 0, 1,
-0.7834675, 0.3538121, -2.248733, 0.7215686, 1, 0, 1,
-0.7655784, 1.159509, -0.1828161, 0.7176471, 1, 0, 1,
-0.7636612, 0.3324205, 0.07874957, 0.7098039, 1, 0, 1,
-0.7592471, -0.3738413, -2.178326, 0.7058824, 1, 0, 1,
-0.7585531, 0.3224207, 0.8713246, 0.6980392, 1, 0, 1,
-0.7554092, -0.6993082, -2.930853, 0.6901961, 1, 0, 1,
-0.7549742, 0.9848498, 1.109267, 0.6862745, 1, 0, 1,
-0.7485251, -1.059039, -2.292524, 0.6784314, 1, 0, 1,
-0.7443455, -0.3337753, -2.7146, 0.6745098, 1, 0, 1,
-0.7402326, 0.6350041, -1.180179, 0.6666667, 1, 0, 1,
-0.7377865, 0.5709887, -0.3031521, 0.6627451, 1, 0, 1,
-0.7349657, 0.6745505, 0.6703011, 0.654902, 1, 0, 1,
-0.7348411, -0.04843982, -1.651798, 0.6509804, 1, 0, 1,
-0.728806, 1.260776, -0.6959299, 0.6431373, 1, 0, 1,
-0.7286574, -2.162041, -1.967621, 0.6392157, 1, 0, 1,
-0.7214954, -0.4009428, -0.4345489, 0.6313726, 1, 0, 1,
-0.7209669, 0.2804911, 0.3106072, 0.627451, 1, 0, 1,
-0.716904, 0.002809558, -0.7412299, 0.6196079, 1, 0, 1,
-0.7166949, -1.048955, -2.895128, 0.6156863, 1, 0, 1,
-0.7154835, -1.480611, -2.636989, 0.6078432, 1, 0, 1,
-0.7141969, 0.168677, -1.847348, 0.6039216, 1, 0, 1,
-0.7105101, 0.8454242, 0.0736661, 0.5960785, 1, 0, 1,
-0.709987, -0.5721528, -1.28393, 0.5882353, 1, 0, 1,
-0.7078366, 1.364988, -1.235901, 0.5843138, 1, 0, 1,
-0.7055941, -0.7148671, -2.715274, 0.5764706, 1, 0, 1,
-0.6972513, -0.9535066, -2.864893, 0.572549, 1, 0, 1,
-0.6967235, -0.4980047, -1.347959, 0.5647059, 1, 0, 1,
-0.6930225, -0.7120891, -3.522694, 0.5607843, 1, 0, 1,
-0.6912346, 0.5335972, -0.7610778, 0.5529412, 1, 0, 1,
-0.6894253, 1.117107, 0.2303297, 0.5490196, 1, 0, 1,
-0.6877849, 0.4206654, -0.2470064, 0.5411765, 1, 0, 1,
-0.6870617, 0.09615671, -3.097132, 0.5372549, 1, 0, 1,
-0.6856747, -0.7337832, -1.632274, 0.5294118, 1, 0, 1,
-0.6847871, 1.32447, -1.432508, 0.5254902, 1, 0, 1,
-0.6805023, 0.8097152, -0.7243844, 0.5176471, 1, 0, 1,
-0.679985, -0.1987331, -1.400548, 0.5137255, 1, 0, 1,
-0.6784121, -1.859989, -2.876743, 0.5058824, 1, 0, 1,
-0.6741657, 0.2740976, -2.940175, 0.5019608, 1, 0, 1,
-0.6740583, 1.938572, -0.6848085, 0.4941176, 1, 0, 1,
-0.6657482, -0.4997261, -3.071514, 0.4862745, 1, 0, 1,
-0.6640111, -0.1139641, -2.025191, 0.4823529, 1, 0, 1,
-0.6640073, -0.1400261, -2.925904, 0.4745098, 1, 0, 1,
-0.6629691, 0.02777936, -0.2375892, 0.4705882, 1, 0, 1,
-0.6583303, -0.9553856, -2.142592, 0.4627451, 1, 0, 1,
-0.6574039, -1.071812, -1.545769, 0.4588235, 1, 0, 1,
-0.6542851, 0.4275282, -0.955094, 0.4509804, 1, 0, 1,
-0.6533329, -1.620795, -4.945647, 0.4470588, 1, 0, 1,
-0.6528666, 0.2943271, 0.5205237, 0.4392157, 1, 0, 1,
-0.6501998, -0.4698551, -2.5814, 0.4352941, 1, 0, 1,
-0.650148, 0.6683572, 1.076428, 0.427451, 1, 0, 1,
-0.6490747, 0.302672, -0.9086285, 0.4235294, 1, 0, 1,
-0.6472011, 0.8626492, -0.4962476, 0.4156863, 1, 0, 1,
-0.6469305, -0.241322, -1.305772, 0.4117647, 1, 0, 1,
-0.6459138, -0.3364038, -3.46759, 0.4039216, 1, 0, 1,
-0.6434144, 1.340904, -0.4444788, 0.3960784, 1, 0, 1,
-0.6429207, -0.4044021, -2.978031, 0.3921569, 1, 0, 1,
-0.6383814, -0.280678, -3.053669, 0.3843137, 1, 0, 1,
-0.6344971, 0.9569168, -1.955818, 0.3803922, 1, 0, 1,
-0.6321348, 1.40809, -0.8337265, 0.372549, 1, 0, 1,
-0.6256791, -0.07228326, -1.014337, 0.3686275, 1, 0, 1,
-0.6255619, -0.3813495, -3.344688, 0.3607843, 1, 0, 1,
-0.6241451, 1.032983, -1.022881, 0.3568628, 1, 0, 1,
-0.6223393, 0.226224, -2.487468, 0.3490196, 1, 0, 1,
-0.6218036, 2.404029, 0.2328071, 0.345098, 1, 0, 1,
-0.612578, 2.551089, -1.811202, 0.3372549, 1, 0, 1,
-0.6116648, -0.8394488, -0.08047771, 0.3333333, 1, 0, 1,
-0.6057696, -1.019796, -2.229305, 0.3254902, 1, 0, 1,
-0.603222, -1.349702, -3.025616, 0.3215686, 1, 0, 1,
-0.5871705, -2.288508, -2.678679, 0.3137255, 1, 0, 1,
-0.5860177, 1.776431, -2.101709, 0.3098039, 1, 0, 1,
-0.582455, -0.1567424, -2.443291, 0.3019608, 1, 0, 1,
-0.5821117, -2.090086, -3.282794, 0.2941177, 1, 0, 1,
-0.5797703, -0.1246816, -0.5331195, 0.2901961, 1, 0, 1,
-0.5700313, -0.2914716, -1.189574, 0.282353, 1, 0, 1,
-0.5680636, -0.6714675, -2.113195, 0.2784314, 1, 0, 1,
-0.5666071, -0.2648923, -3.001781, 0.2705882, 1, 0, 1,
-0.5552526, -0.7148986, -3.035662, 0.2666667, 1, 0, 1,
-0.5509211, -2.655748, -2.925392, 0.2588235, 1, 0, 1,
-0.5472789, 2.483825, 1.732769, 0.254902, 1, 0, 1,
-0.5436119, 0.4170192, -0.5372143, 0.2470588, 1, 0, 1,
-0.5434619, -0.1734776, -0.5529921, 0.2431373, 1, 0, 1,
-0.5388784, -1.210681, -2.966558, 0.2352941, 1, 0, 1,
-0.5362338, 1.725668, -1.410352, 0.2313726, 1, 0, 1,
-0.5345247, -0.413388, -1.493715, 0.2235294, 1, 0, 1,
-0.5324696, -0.43917, -2.778167, 0.2196078, 1, 0, 1,
-0.5321336, -1.383186, -3.480587, 0.2117647, 1, 0, 1,
-0.5290955, 0.2751953, -1.329628, 0.2078431, 1, 0, 1,
-0.5282117, -0.7008935, -3.031767, 0.2, 1, 0, 1,
-0.5252845, -0.1000271, -2.266034, 0.1921569, 1, 0, 1,
-0.5238068, 0.4260983, -0.3264998, 0.1882353, 1, 0, 1,
-0.5210262, 0.8691778, -0.06063499, 0.1803922, 1, 0, 1,
-0.5188452, -1.042742, -3.028578, 0.1764706, 1, 0, 1,
-0.515139, 0.02025844, -1.522449, 0.1686275, 1, 0, 1,
-0.5128202, -0.1403647, -2.387217, 0.1647059, 1, 0, 1,
-0.5115952, 0.4427852, -0.9161818, 0.1568628, 1, 0, 1,
-0.5104064, -0.8861492, -1.839476, 0.1529412, 1, 0, 1,
-0.5102957, 1.117604, -2.006188, 0.145098, 1, 0, 1,
-0.5091079, 0.3591163, 0.9629856, 0.1411765, 1, 0, 1,
-0.4964502, 0.0230719, -3.506371, 0.1333333, 1, 0, 1,
-0.4940048, 0.3474613, -1.615208, 0.1294118, 1, 0, 1,
-0.4914955, 1.162593, -1.047665, 0.1215686, 1, 0, 1,
-0.4895876, 1.000444, -1.334322, 0.1176471, 1, 0, 1,
-0.4875254, 1.464451, 0.4507051, 0.1098039, 1, 0, 1,
-0.4826819, 0.4585125, -2.287146, 0.1058824, 1, 0, 1,
-0.4817163, 0.4067655, -0.5459766, 0.09803922, 1, 0, 1,
-0.4788327, 0.04063665, 0.3420806, 0.09019608, 1, 0, 1,
-0.4665062, 1.067682, -0.3017162, 0.08627451, 1, 0, 1,
-0.4665028, 1.103873, -0.1045946, 0.07843138, 1, 0, 1,
-0.4647641, -0.1919465, -1.85511, 0.07450981, 1, 0, 1,
-0.4638183, -1.630013, -1.742027, 0.06666667, 1, 0, 1,
-0.4581159, -1.615034, -3.131356, 0.0627451, 1, 0, 1,
-0.4552924, 0.9258872, 0.5188342, 0.05490196, 1, 0, 1,
-0.4548152, -2.433547, -3.85738, 0.05098039, 1, 0, 1,
-0.4501617, -0.1115653, -2.557029, 0.04313726, 1, 0, 1,
-0.4483971, 0.2158336, -1.39941, 0.03921569, 1, 0, 1,
-0.4459713, -1.290706, -2.538895, 0.03137255, 1, 0, 1,
-0.4456747, -1.230962, -3.972204, 0.02745098, 1, 0, 1,
-0.4441175, -0.488316, -2.525871, 0.01960784, 1, 0, 1,
-0.4375505, 1.238987, -0.5074442, 0.01568628, 1, 0, 1,
-0.4308081, 0.2783827, 0.6480913, 0.007843138, 1, 0, 1,
-0.4303601, -1.826992, -2.906093, 0.003921569, 1, 0, 1,
-0.4297587, 0.226008, -1.198466, 0, 1, 0.003921569, 1,
-0.4290088, -0.7095167, -2.287904, 0, 1, 0.01176471, 1,
-0.4230198, 0.9148809, 0.3461133, 0, 1, 0.01568628, 1,
-0.422802, 0.6149682, -1.147084, 0, 1, 0.02352941, 1,
-0.4217753, -0.009698004, -4.539665, 0, 1, 0.02745098, 1,
-0.4213655, 1.41944, -1.158621, 0, 1, 0.03529412, 1,
-0.4199023, -2.06335, -2.389347, 0, 1, 0.03921569, 1,
-0.4194742, 2.18193, 0.2187425, 0, 1, 0.04705882, 1,
-0.4163089, 1.311467, -1.211772, 0, 1, 0.05098039, 1,
-0.4154154, 1.089943, 0.9322191, 0, 1, 0.05882353, 1,
-0.412008, -0.6561827, -3.020446, 0, 1, 0.0627451, 1,
-0.411964, -1.512259, -3.233353, 0, 1, 0.07058824, 1,
-0.4091492, 0.4690651, -0.8814408, 0, 1, 0.07450981, 1,
-0.4056618, -0.9336315, -3.27715, 0, 1, 0.08235294, 1,
-0.402183, 1.038399, -2.269954, 0, 1, 0.08627451, 1,
-0.4011862, -0.1181921, -2.610644, 0, 1, 0.09411765, 1,
-0.3992883, 0.08836024, -0.9373099, 0, 1, 0.1019608, 1,
-0.3946266, -0.5129319, -1.748569, 0, 1, 0.1058824, 1,
-0.3919103, 1.396015, -2.018612, 0, 1, 0.1137255, 1,
-0.3911581, -0.4729799, -1.990055, 0, 1, 0.1176471, 1,
-0.387768, -0.8693644, -4.472905, 0, 1, 0.1254902, 1,
-0.3837782, 0.2180714, -0.6100541, 0, 1, 0.1294118, 1,
-0.38309, -2.435614, -3.563144, 0, 1, 0.1372549, 1,
-0.3815791, 0.635432, -0.7857256, 0, 1, 0.1411765, 1,
-0.3772475, -0.5171808, -2.304291, 0, 1, 0.1490196, 1,
-0.3738948, -0.7643835, -1.351864, 0, 1, 0.1529412, 1,
-0.3737194, 0.1681957, -1.402331, 0, 1, 0.1607843, 1,
-0.3719646, 0.2943862, 1.893407, 0, 1, 0.1647059, 1,
-0.3718537, -0.1783947, -2.333231, 0, 1, 0.172549, 1,
-0.3705521, -0.5489852, -3.731653, 0, 1, 0.1764706, 1,
-0.3679692, 1.100759, -1.303781, 0, 1, 0.1843137, 1,
-0.3678085, 0.5293179, -1.451549, 0, 1, 0.1882353, 1,
-0.3664243, -1.492428, -3.612233, 0, 1, 0.1960784, 1,
-0.3657202, 2.564521, -1.199275, 0, 1, 0.2039216, 1,
-0.3624913, 0.3218282, -1.760201, 0, 1, 0.2078431, 1,
-0.3604195, 0.902176, 0.03396937, 0, 1, 0.2156863, 1,
-0.3569045, 0.2191547, -1.332481, 0, 1, 0.2196078, 1,
-0.35594, 0.9130125, 0.2164852, 0, 1, 0.227451, 1,
-0.353292, 0.9681487, 1.029051, 0, 1, 0.2313726, 1,
-0.3520658, 1.252745, -0.4782885, 0, 1, 0.2392157, 1,
-0.3475571, 0.1271565, -2.944206, 0, 1, 0.2431373, 1,
-0.3473012, 1.005304, 0.06826881, 0, 1, 0.2509804, 1,
-0.3440562, -0.7961605, -3.413936, 0, 1, 0.254902, 1,
-0.3434469, -1.077357, -0.0393579, 0, 1, 0.2627451, 1,
-0.343037, 0.5395432, -2.372141, 0, 1, 0.2666667, 1,
-0.3409478, -1.647031, -3.050965, 0, 1, 0.2745098, 1,
-0.3301958, 0.949833, 0.07836419, 0, 1, 0.2784314, 1,
-0.3295445, 2.738271, -1.199468, 0, 1, 0.2862745, 1,
-0.3267649, 0.3138671, -1.841183, 0, 1, 0.2901961, 1,
-0.3264729, -0.5826858, -3.598984, 0, 1, 0.2980392, 1,
-0.3243908, -0.9186256, -1.056524, 0, 1, 0.3058824, 1,
-0.3233188, -0.3826081, -2.422164, 0, 1, 0.3098039, 1,
-0.3205911, -1.356485, -2.9351, 0, 1, 0.3176471, 1,
-0.319634, 0.5850685, 0.5356508, 0, 1, 0.3215686, 1,
-0.3184784, -1.700411, -3.204235, 0, 1, 0.3294118, 1,
-0.3173954, -1.068842, -4.640355, 0, 1, 0.3333333, 1,
-0.3150006, 0.2672359, -1.723475, 0, 1, 0.3411765, 1,
-0.3096175, 0.5226443, 1.233945, 0, 1, 0.345098, 1,
-0.2972535, 1.028397, 0.3538836, 0, 1, 0.3529412, 1,
-0.2964554, 0.4904715, -2.064125, 0, 1, 0.3568628, 1,
-0.2963518, 0.3777188, -0.1224906, 0, 1, 0.3647059, 1,
-0.2932244, 0.8835553, 0.3669439, 0, 1, 0.3686275, 1,
-0.2912711, 0.6701065, -1.510664, 0, 1, 0.3764706, 1,
-0.2878297, 0.3592985, -1.604386, 0, 1, 0.3803922, 1,
-0.2857445, 0.3686759, -1.680754, 0, 1, 0.3882353, 1,
-0.2813994, -0.4669266, -3.507087, 0, 1, 0.3921569, 1,
-0.2779212, -0.01153923, -3.943996, 0, 1, 0.4, 1,
-0.2742203, 1.334022, -0.7003368, 0, 1, 0.4078431, 1,
-0.2727843, 1.153314, 0.09969338, 0, 1, 0.4117647, 1,
-0.2709835, 1.458392, -1.566446, 0, 1, 0.4196078, 1,
-0.2658414, 0.652099, 0.2221253, 0, 1, 0.4235294, 1,
-0.260511, -1.198752, -5.369779, 0, 1, 0.4313726, 1,
-0.2602998, 0.9553053, -0.6039128, 0, 1, 0.4352941, 1,
-0.2591237, -0.4412315, -2.43729, 0, 1, 0.4431373, 1,
-0.2586531, 0.1355877, -0.6414607, 0, 1, 0.4470588, 1,
-0.257154, -0.7329355, -3.60434, 0, 1, 0.454902, 1,
-0.2541736, -0.5010234, -3.460546, 0, 1, 0.4588235, 1,
-0.2530855, -0.3792481, -0.6609556, 0, 1, 0.4666667, 1,
-0.2485466, 0.8595237, -0.03884998, 0, 1, 0.4705882, 1,
-0.2474331, 0.4768951, 0.4540447, 0, 1, 0.4784314, 1,
-0.2467824, -1.263973, -2.205799, 0, 1, 0.4823529, 1,
-0.2437407, -0.8757507, -2.864746, 0, 1, 0.4901961, 1,
-0.2437353, 0.7009096, -1.993022, 0, 1, 0.4941176, 1,
-0.2391438, 0.3069026, -0.05125555, 0, 1, 0.5019608, 1,
-0.2376721, 0.2026369, 1.195467, 0, 1, 0.509804, 1,
-0.23767, 0.3052599, -1.71241, 0, 1, 0.5137255, 1,
-0.2345843, 0.2092626, -2.371834, 0, 1, 0.5215687, 1,
-0.2330526, -0.2804303, -1.688281, 0, 1, 0.5254902, 1,
-0.2303426, 0.2315722, -0.7301785, 0, 1, 0.5333334, 1,
-0.2296154, 1.413003, 0.9551547, 0, 1, 0.5372549, 1,
-0.2286006, -0.3400107, -0.9883308, 0, 1, 0.5450981, 1,
-0.2280004, -0.8710381, -3.984831, 0, 1, 0.5490196, 1,
-0.2251421, 0.4014338, -0.4706592, 0, 1, 0.5568628, 1,
-0.2067293, 0.2385556, 1.509117, 0, 1, 0.5607843, 1,
-0.2047211, -0.4032593, -3.895474, 0, 1, 0.5686275, 1,
-0.2026055, 0.05372343, -0.7810788, 0, 1, 0.572549, 1,
-0.197135, -1.389936, -4.11691, 0, 1, 0.5803922, 1,
-0.1966599, 1.353113, 0.5191716, 0, 1, 0.5843138, 1,
-0.1878319, 0.08922672, -0.8609879, 0, 1, 0.5921569, 1,
-0.1847641, -0.6232007, -3.53143, 0, 1, 0.5960785, 1,
-0.1820736, -2.903219, -3.544424, 0, 1, 0.6039216, 1,
-0.176432, 0.9877144, 0.1410638, 0, 1, 0.6117647, 1,
-0.1756754, 1.417479, 1.007169, 0, 1, 0.6156863, 1,
-0.1648328, 1.339432, 0.5712916, 0, 1, 0.6235294, 1,
-0.163882, 0.4111373, -0.4662189, 0, 1, 0.627451, 1,
-0.1607468, 0.1307611, -0.9609478, 0, 1, 0.6352941, 1,
-0.1582245, -0.7093893, -3.397514, 0, 1, 0.6392157, 1,
-0.1574895, 0.1737109, -0.8394485, 0, 1, 0.6470588, 1,
-0.1558643, 0.2892333, -1.168632, 0, 1, 0.6509804, 1,
-0.1528077, 1.623997, -2.564278, 0, 1, 0.6588235, 1,
-0.1521116, -0.320236, -1.496558, 0, 1, 0.6627451, 1,
-0.1512655, 0.01097303, -0.9878786, 0, 1, 0.6705883, 1,
-0.1477679, 0.8503634, 0.1053271, 0, 1, 0.6745098, 1,
-0.1474756, -3.466166, -3.751033, 0, 1, 0.682353, 1,
-0.1433551, 0.8195723, 0.02303144, 0, 1, 0.6862745, 1,
-0.130557, 0.4836924, 0.9782967, 0, 1, 0.6941177, 1,
-0.1291523, 1.676601, 1.391248, 0, 1, 0.7019608, 1,
-0.1287054, 0.6873177, -0.9052465, 0, 1, 0.7058824, 1,
-0.1240876, -0.7081265, -3.744054, 0, 1, 0.7137255, 1,
-0.1227383, 0.6067329, 1.257589, 0, 1, 0.7176471, 1,
-0.1227321, 0.6369045, -0.4141778, 0, 1, 0.7254902, 1,
-0.1215383, -0.2845885, -3.022005, 0, 1, 0.7294118, 1,
-0.1200932, 1.029488, 0.9527697, 0, 1, 0.7372549, 1,
-0.1159732, -0.474174, -2.904965, 0, 1, 0.7411765, 1,
-0.1144033, 1.295377, -0.4796423, 0, 1, 0.7490196, 1,
-0.1125949, -0.690657, -3.006239, 0, 1, 0.7529412, 1,
-0.1116463, -1.523993, -1.15797, 0, 1, 0.7607843, 1,
-0.1105252, -0.09264174, -1.598633, 0, 1, 0.7647059, 1,
-0.1037036, 1.686293, 1.117243, 0, 1, 0.772549, 1,
-0.1025996, 0.4872092, -0.793595, 0, 1, 0.7764706, 1,
-0.1012286, -0.1353401, -2.146605, 0, 1, 0.7843137, 1,
-0.09774037, -2.397698, -3.445672, 0, 1, 0.7882353, 1,
-0.09708919, 0.4669501, -0.6176407, 0, 1, 0.7960784, 1,
-0.09697384, -0.9158148, -1.535198, 0, 1, 0.8039216, 1,
-0.09555788, -1.196625, -2.944649, 0, 1, 0.8078431, 1,
-0.0948453, 0.7748086, -1.203668, 0, 1, 0.8156863, 1,
-0.0928439, -1.279432, -3.126802, 0, 1, 0.8196079, 1,
-0.08818968, 0.8630529, 0.1246886, 0, 1, 0.827451, 1,
-0.08168251, -0.4377044, -1.783156, 0, 1, 0.8313726, 1,
-0.07915986, -0.2765603, -2.840982, 0, 1, 0.8392157, 1,
-0.07791897, -0.5373018, -3.770199, 0, 1, 0.8431373, 1,
-0.07420483, -0.2530904, -0.9292586, 0, 1, 0.8509804, 1,
-0.07123487, -0.1104844, -2.702841, 0, 1, 0.854902, 1,
-0.06865087, 2.342525, 0.4312454, 0, 1, 0.8627451, 1,
-0.06284865, 0.1429266, 1.016626, 0, 1, 0.8666667, 1,
-0.0624916, 0.7895237, -0.07189533, 0, 1, 0.8745098, 1,
-0.0618771, -1.638513, -2.765228, 0, 1, 0.8784314, 1,
-0.06041302, 0.2289033, 0.548873, 0, 1, 0.8862745, 1,
-0.05457425, -1.588293, -3.423731, 0, 1, 0.8901961, 1,
-0.05427608, 1.050477, -0.4061372, 0, 1, 0.8980392, 1,
-0.05100237, 0.2253197, 0.5793025, 0, 1, 0.9058824, 1,
-0.05096241, 0.8732927, -0.5977209, 0, 1, 0.9098039, 1,
-0.04610295, -0.1788305, -1.33838, 0, 1, 0.9176471, 1,
-0.04081359, -0.1315575, -1.415775, 0, 1, 0.9215686, 1,
-0.03877895, -0.4385803, -2.451991, 0, 1, 0.9294118, 1,
-0.03673154, 1.222461, -0.5380396, 0, 1, 0.9333333, 1,
-0.03583918, -0.8933692, -1.952955, 0, 1, 0.9411765, 1,
-0.03330314, -0.6675982, -2.944345, 0, 1, 0.945098, 1,
-0.03271164, -0.7200823, -3.518448, 0, 1, 0.9529412, 1,
-0.03192966, 0.2972121, -0.1993582, 0, 1, 0.9568627, 1,
-0.03163559, 1.134993, 2.206153, 0, 1, 0.9647059, 1,
-0.02291996, 1.112589, -1.204822, 0, 1, 0.9686275, 1,
-0.02211602, 1.071351, 0.4312675, 0, 1, 0.9764706, 1,
-0.02076727, -0.3407874, -3.526477, 0, 1, 0.9803922, 1,
-0.02028704, -0.3240489, -3.974197, 0, 1, 0.9882353, 1,
-0.01509727, -1.559903, -2.610908, 0, 1, 0.9921569, 1,
-0.01395695, -3.640266, -2.730298, 0, 1, 1, 1,
-0.01354012, 0.6755055, -0.9506691, 0, 0.9921569, 1, 1,
-0.004446347, -1.696323, -3.483037, 0, 0.9882353, 1, 1,
0.002406861, -0.9508411, 3.407725, 0, 0.9803922, 1, 1,
0.005069659, 0.06150518, 1.131582, 0, 0.9764706, 1, 1,
0.005768897, -0.08780385, 3.165066, 0, 0.9686275, 1, 1,
0.0106032, 0.7956471, -0.1971889, 0, 0.9647059, 1, 1,
0.01089224, -0.8152864, 3.821687, 0, 0.9568627, 1, 1,
0.01395274, -0.8980058, 2.450445, 0, 0.9529412, 1, 1,
0.01502134, 0.8519681, 0.5818366, 0, 0.945098, 1, 1,
0.01638837, 0.4901609, -0.6351191, 0, 0.9411765, 1, 1,
0.01691853, 0.7825308, -1.065207, 0, 0.9333333, 1, 1,
0.01734672, -0.5272372, 4.364648, 0, 0.9294118, 1, 1,
0.02163013, -1.301375, 1.609982, 0, 0.9215686, 1, 1,
0.0246735, 0.3871571, 0.7614, 0, 0.9176471, 1, 1,
0.02552546, 1.455085, -0.08236626, 0, 0.9098039, 1, 1,
0.02687874, -0.1165593, 2.447232, 0, 0.9058824, 1, 1,
0.02997573, -0.08416863, 1.902155, 0, 0.8980392, 1, 1,
0.03150049, 0.2062597, 0.9633033, 0, 0.8901961, 1, 1,
0.03276758, 1.194952, 0.3037067, 0, 0.8862745, 1, 1,
0.04313983, -0.6978812, 4.039412, 0, 0.8784314, 1, 1,
0.04495935, 1.18811, -0.5825903, 0, 0.8745098, 1, 1,
0.04501924, 1.138453, 0.3812611, 0, 0.8666667, 1, 1,
0.04816394, 0.2761278, 1.176871, 0, 0.8627451, 1, 1,
0.04883441, -0.6052063, 1.052487, 0, 0.854902, 1, 1,
0.05798014, -2.464926, 3.198373, 0, 0.8509804, 1, 1,
0.060179, -0.3946432, 5.052845, 0, 0.8431373, 1, 1,
0.06125738, -1.154761, 5.427643, 0, 0.8392157, 1, 1,
0.06783862, 0.003772306, 0.08353173, 0, 0.8313726, 1, 1,
0.07608632, 0.8179333, -0.2319084, 0, 0.827451, 1, 1,
0.07767213, -0.8694082, 2.696882, 0, 0.8196079, 1, 1,
0.07875669, -0.3472658, 2.556059, 0, 0.8156863, 1, 1,
0.0797383, -0.8946453, 2.04312, 0, 0.8078431, 1, 1,
0.08228464, 0.04183299, 1.982852, 0, 0.8039216, 1, 1,
0.08276599, -1.225515, 3.656529, 0, 0.7960784, 1, 1,
0.08361699, 1.043607, 1.231829, 0, 0.7882353, 1, 1,
0.08619136, 0.9484593, -0.2505646, 0, 0.7843137, 1, 1,
0.08784464, -0.2227432, 2.050307, 0, 0.7764706, 1, 1,
0.08894159, -1.035763, 2.645477, 0, 0.772549, 1, 1,
0.0972266, -0.05086543, 2.579507, 0, 0.7647059, 1, 1,
0.1020248, -0.7067968, 1.930418, 0, 0.7607843, 1, 1,
0.1023371, 1.60725, -1.225568, 0, 0.7529412, 1, 1,
0.1035789, 0.5696167, -1.102682, 0, 0.7490196, 1, 1,
0.1074921, -0.6597298, 2.543503, 0, 0.7411765, 1, 1,
0.1091518, -0.3183788, 2.52932, 0, 0.7372549, 1, 1,
0.1115241, -0.07381441, 1.436077, 0, 0.7294118, 1, 1,
0.1179603, -1.557387, 4.00852, 0, 0.7254902, 1, 1,
0.1199506, -0.9387415, 1.286276, 0, 0.7176471, 1, 1,
0.1265348, -0.5239804, 2.789205, 0, 0.7137255, 1, 1,
0.1270613, 0.2572206, 2.880432, 0, 0.7058824, 1, 1,
0.1277068, 0.5892248, 0.1367669, 0, 0.6980392, 1, 1,
0.1311056, 2.524187, -0.4127486, 0, 0.6941177, 1, 1,
0.1318899, -0.08866194, 1.672469, 0, 0.6862745, 1, 1,
0.1329804, -1.262142, 2.9635, 0, 0.682353, 1, 1,
0.1357658, -2.274799, 2.010556, 0, 0.6745098, 1, 1,
0.1357716, 1.217928, -0.3509499, 0, 0.6705883, 1, 1,
0.1361157, 0.889999, -1.335437, 0, 0.6627451, 1, 1,
0.1390062, -0.9452678, 4.595442, 0, 0.6588235, 1, 1,
0.1390679, 0.5890036, 0.1736663, 0, 0.6509804, 1, 1,
0.1401794, 0.7158917, 0.5212641, 0, 0.6470588, 1, 1,
0.1444569, 1.164472, 0.8684366, 0, 0.6392157, 1, 1,
0.1445341, 0.5284556, -0.2737852, 0, 0.6352941, 1, 1,
0.1474311, -0.3156917, 2.335544, 0, 0.627451, 1, 1,
0.1481848, -0.5703632, 3.866786, 0, 0.6235294, 1, 1,
0.1485379, 0.8821237, 0.2759115, 0, 0.6156863, 1, 1,
0.1504586, -1.002703, 2.354354, 0, 0.6117647, 1, 1,
0.1510018, 0.9029714, 1.532326, 0, 0.6039216, 1, 1,
0.1522531, 0.2083471, 0.7362789, 0, 0.5960785, 1, 1,
0.1570212, 0.2459929, 0.3195029, 0, 0.5921569, 1, 1,
0.1611644, 0.2441012, 1.048284, 0, 0.5843138, 1, 1,
0.1644011, 0.09116976, 2.850749, 0, 0.5803922, 1, 1,
0.1669378, 0.4504659, 1.544626, 0, 0.572549, 1, 1,
0.1690822, 0.4939209, 0.1228356, 0, 0.5686275, 1, 1,
0.1727905, -1.531107, 3.998275, 0, 0.5607843, 1, 1,
0.1735963, 0.237845, 1.612616, 0, 0.5568628, 1, 1,
0.1772246, 1.823491, 1.864732, 0, 0.5490196, 1, 1,
0.1785131, -0.6666696, 3.947616, 0, 0.5450981, 1, 1,
0.1786451, -1.441559, 3.012975, 0, 0.5372549, 1, 1,
0.1791126, 0.8577076, -1.319469, 0, 0.5333334, 1, 1,
0.1801555, 0.674778, -0.3794558, 0, 0.5254902, 1, 1,
0.181372, 2.076394, -0.06970906, 0, 0.5215687, 1, 1,
0.1858067, 0.1403193, 1.36743, 0, 0.5137255, 1, 1,
0.1858223, -2.310247, 2.219547, 0, 0.509804, 1, 1,
0.189699, -0.4356942, 2.157195, 0, 0.5019608, 1, 1,
0.1909509, -0.7815236, 1.628679, 0, 0.4941176, 1, 1,
0.1931924, -1.713997, 1.852515, 0, 0.4901961, 1, 1,
0.2030275, -0.7535434, 2.132044, 0, 0.4823529, 1, 1,
0.2043902, 0.591246, 0.7232509, 0, 0.4784314, 1, 1,
0.2077269, 0.4134857, -0.6537924, 0, 0.4705882, 1, 1,
0.2080566, -1.268729, 3.804792, 0, 0.4666667, 1, 1,
0.2128425, 0.8239819, 1.730947, 0, 0.4588235, 1, 1,
0.2141351, 0.8604128, 1.151015, 0, 0.454902, 1, 1,
0.2146521, 0.1379081, -0.9209514, 0, 0.4470588, 1, 1,
0.2156982, -1.646031, 3.207027, 0, 0.4431373, 1, 1,
0.2168155, 1.320705, 0.9271144, 0, 0.4352941, 1, 1,
0.2211866, 0.3831046, 0.2857861, 0, 0.4313726, 1, 1,
0.2219694, 0.8793843, 0.3507907, 0, 0.4235294, 1, 1,
0.2221912, 0.5100074, 0.2433697, 0, 0.4196078, 1, 1,
0.2225506, -0.01020209, 0.9436532, 0, 0.4117647, 1, 1,
0.2236984, -0.1554032, 1.710396, 0, 0.4078431, 1, 1,
0.2246057, -0.3003754, 0.8400106, 0, 0.4, 1, 1,
0.2247215, -0.5454705, 2.147256, 0, 0.3921569, 1, 1,
0.2276954, -0.8561575, 1.426523, 0, 0.3882353, 1, 1,
0.2298878, -1.919529, 1.267585, 0, 0.3803922, 1, 1,
0.2299307, 0.4675435, 0.4126253, 0, 0.3764706, 1, 1,
0.2330845, -0.604762, 2.498415, 0, 0.3686275, 1, 1,
0.2384261, 2.154825, 2.166402, 0, 0.3647059, 1, 1,
0.2401244, 0.2629174, 0.118006, 0, 0.3568628, 1, 1,
0.2424349, 1.575227, 0.6810874, 0, 0.3529412, 1, 1,
0.2434908, 0.4786256, 0.3437708, 0, 0.345098, 1, 1,
0.2476809, -0.06875584, 2.094618, 0, 0.3411765, 1, 1,
0.2480809, 1.116634, 0.5756243, 0, 0.3333333, 1, 1,
0.2481852, 0.3500364, 0.3896971, 0, 0.3294118, 1, 1,
0.2498849, -1.555755, 3.756651, 0, 0.3215686, 1, 1,
0.2500677, -1.97386, 1.348776, 0, 0.3176471, 1, 1,
0.2535973, 0.5481, -0.8518781, 0, 0.3098039, 1, 1,
0.2588195, -1.545397, 1.813357, 0, 0.3058824, 1, 1,
0.2672417, -0.4028105, 2.17696, 0, 0.2980392, 1, 1,
0.2679029, 0.03807544, -0.4443589, 0, 0.2901961, 1, 1,
0.2701827, -0.007873287, 3.291057, 0, 0.2862745, 1, 1,
0.2704852, 2.153802, 0.02417596, 0, 0.2784314, 1, 1,
0.2725537, -0.3091497, 3.267625, 0, 0.2745098, 1, 1,
0.2768461, 2.450021, 1.333846, 0, 0.2666667, 1, 1,
0.2771624, 0.6194328, 0.76663, 0, 0.2627451, 1, 1,
0.278457, -0.3140624, 3.390835, 0, 0.254902, 1, 1,
0.2831801, 0.8426564, -1.687823, 0, 0.2509804, 1, 1,
0.285726, -0.07341367, 1.794699, 0, 0.2431373, 1, 1,
0.2893717, 1.33503, 0.5594889, 0, 0.2392157, 1, 1,
0.2912911, -0.193793, 1.569485, 0, 0.2313726, 1, 1,
0.2922507, 1.498964, 0.5045246, 0, 0.227451, 1, 1,
0.2926015, 0.585595, 0.2198016, 0, 0.2196078, 1, 1,
0.2933094, -0.6981977, 3.247476, 0, 0.2156863, 1, 1,
0.2989644, 0.2715358, 2.21068, 0, 0.2078431, 1, 1,
0.2992899, 1.033656, 0.9829293, 0, 0.2039216, 1, 1,
0.300342, 0.5239458, 0.02473114, 0, 0.1960784, 1, 1,
0.3027801, 0.8041204, -1.039545, 0, 0.1882353, 1, 1,
0.3034424, 0.6034076, 1.484925, 0, 0.1843137, 1, 1,
0.307128, -0.4732499, 3.992528, 0, 0.1764706, 1, 1,
0.3090257, -0.3806243, 2.242565, 0, 0.172549, 1, 1,
0.3100437, -2.306575, 3.590542, 0, 0.1647059, 1, 1,
0.3113705, -0.7027151, 3.232542, 0, 0.1607843, 1, 1,
0.3128259, 0.1565806, 2.446996, 0, 0.1529412, 1, 1,
0.3146189, -0.03795232, 0.8014824, 0, 0.1490196, 1, 1,
0.3152619, 2.487095, 1.690654, 0, 0.1411765, 1, 1,
0.3203704, 0.5202453, 0.3128064, 0, 0.1372549, 1, 1,
0.3219374, -0.1852096, 1.178941, 0, 0.1294118, 1, 1,
0.3234963, -0.3310052, 1.435106, 0, 0.1254902, 1, 1,
0.327969, -0.6400645, 2.770968, 0, 0.1176471, 1, 1,
0.3307954, -0.3534536, 3.508947, 0, 0.1137255, 1, 1,
0.3348927, -0.4168036, 2.926608, 0, 0.1058824, 1, 1,
0.3351381, -1.331807, 3.705512, 0, 0.09803922, 1, 1,
0.3423308, 0.2404534, 2.035204, 0, 0.09411765, 1, 1,
0.3439559, 1.315127, 1.197979, 0, 0.08627451, 1, 1,
0.347325, -0.7327686, 2.801087, 0, 0.08235294, 1, 1,
0.3505747, -0.5104343, 4.73666, 0, 0.07450981, 1, 1,
0.3515024, 0.1528012, 2.820768, 0, 0.07058824, 1, 1,
0.3564746, -0.8657855, 2.313916, 0, 0.0627451, 1, 1,
0.3643602, 0.6799214, -1.834067, 0, 0.05882353, 1, 1,
0.3677929, -0.03222014, 1.907025, 0, 0.05098039, 1, 1,
0.3897054, -0.3507054, 1.485674, 0, 0.04705882, 1, 1,
0.3955931, 0.5485892, 1.0851, 0, 0.03921569, 1, 1,
0.3991219, -0.763108, 2.724887, 0, 0.03529412, 1, 1,
0.3995854, 0.1428243, 1.950184, 0, 0.02745098, 1, 1,
0.3997782, 1.818269, 2.144075, 0, 0.02352941, 1, 1,
0.4008192, 0.4513816, 0.4725062, 0, 0.01568628, 1, 1,
0.4017103, -0.313, 3.555539, 0, 0.01176471, 1, 1,
0.4035149, 0.1278391, 3.051147, 0, 0.003921569, 1, 1,
0.4039783, -0.7358419, 1.891701, 0.003921569, 0, 1, 1,
0.4074788, -0.1254737, 2.568054, 0.007843138, 0, 1, 1,
0.4096198, -1.59648, 3.449179, 0.01568628, 0, 1, 1,
0.4156271, 1.209456, 1.215782, 0.01960784, 0, 1, 1,
0.4160874, 0.1882977, 2.456463, 0.02745098, 0, 1, 1,
0.4166559, 0.401742, 0.7728968, 0.03137255, 0, 1, 1,
0.4182731, -0.1772142, 1.829242, 0.03921569, 0, 1, 1,
0.4218071, 0.370233, -0.2007852, 0.04313726, 0, 1, 1,
0.4258318, -0.2890559, 2.757569, 0.05098039, 0, 1, 1,
0.4273804, 0.01293642, 2.537819, 0.05490196, 0, 1, 1,
0.4281652, 1.181483, -0.02764188, 0.0627451, 0, 1, 1,
0.4293232, 0.948545, 1.042523, 0.06666667, 0, 1, 1,
0.4294282, 0.6461142, -1.247769, 0.07450981, 0, 1, 1,
0.4305763, 0.01481017, 1.382063, 0.07843138, 0, 1, 1,
0.4311843, -1.064867, 1.984186, 0.08627451, 0, 1, 1,
0.4357126, -1.650158, 1.349411, 0.09019608, 0, 1, 1,
0.4403519, 0.9860936, 1.556745, 0.09803922, 0, 1, 1,
0.4464877, 1.644343, 3.000665, 0.1058824, 0, 1, 1,
0.4475329, 0.8808414, 1.673624, 0.1098039, 0, 1, 1,
0.4489666, 0.7773367, 0.959839, 0.1176471, 0, 1, 1,
0.4527534, 1.057124, 0.9317095, 0.1215686, 0, 1, 1,
0.454406, -0.1752092, 0.636676, 0.1294118, 0, 1, 1,
0.4601419, 0.3315032, -0.3023186, 0.1333333, 0, 1, 1,
0.4636302, -1.395662, 1.572186, 0.1411765, 0, 1, 1,
0.4644809, -1.106476, 3.280026, 0.145098, 0, 1, 1,
0.4645074, 0.3810424, 1.355456, 0.1529412, 0, 1, 1,
0.4651514, -0.9720216, 3.275172, 0.1568628, 0, 1, 1,
0.4653313, 0.5534584, 0.7506876, 0.1647059, 0, 1, 1,
0.4792924, 0.1761485, -0.5895627, 0.1686275, 0, 1, 1,
0.4817336, -0.0841205, 0.4871641, 0.1764706, 0, 1, 1,
0.488025, 0.1961306, -0.0009627958, 0.1803922, 0, 1, 1,
0.4892834, 0.2574394, 2.031684, 0.1882353, 0, 1, 1,
0.4897972, -0.09573075, 2.07484, 0.1921569, 0, 1, 1,
0.4966089, 0.7556049, 0.02784669, 0.2, 0, 1, 1,
0.4980004, 0.5533103, 0.8282484, 0.2078431, 0, 1, 1,
0.4993231, 0.5763061, -0.4935158, 0.2117647, 0, 1, 1,
0.4999923, 0.1155627, 1.394429, 0.2196078, 0, 1, 1,
0.5071153, -1.322569, 1.506277, 0.2235294, 0, 1, 1,
0.5113856, -1.387587, 1.098353, 0.2313726, 0, 1, 1,
0.5123346, 0.5700601, 3.503122, 0.2352941, 0, 1, 1,
0.513779, 0.4719005, 0.8561673, 0.2431373, 0, 1, 1,
0.5159027, -1.314075, 2.331141, 0.2470588, 0, 1, 1,
0.5204747, -0.2989674, 1.967174, 0.254902, 0, 1, 1,
0.521094, -0.1633544, 1.192812, 0.2588235, 0, 1, 1,
0.5218006, -0.46729, 3.307881, 0.2666667, 0, 1, 1,
0.5224254, -0.1569416, 4.288864, 0.2705882, 0, 1, 1,
0.5237085, 0.7455857, 0.3259521, 0.2784314, 0, 1, 1,
0.5259863, 1.088784, -1.312516, 0.282353, 0, 1, 1,
0.5269984, -0.1157786, 2.234317, 0.2901961, 0, 1, 1,
0.5359564, -1.15612, 2.58697, 0.2941177, 0, 1, 1,
0.5382304, 0.5494606, 3.24136, 0.3019608, 0, 1, 1,
0.5453975, 1.311117, 0.981467, 0.3098039, 0, 1, 1,
0.5484549, 1.571035, 0.435038, 0.3137255, 0, 1, 1,
0.5499488, 0.4843765, 0.9488905, 0.3215686, 0, 1, 1,
0.5525973, -0.7056754, 2.105564, 0.3254902, 0, 1, 1,
0.5536987, -1.184335, 3.132626, 0.3333333, 0, 1, 1,
0.5537972, -0.4302884, 3.168226, 0.3372549, 0, 1, 1,
0.5601519, -1.662421, 2.864609, 0.345098, 0, 1, 1,
0.5649151, 1.069852, -0.5836382, 0.3490196, 0, 1, 1,
0.5661244, -0.7126485, 1.582563, 0.3568628, 0, 1, 1,
0.5709391, 0.7933058, 1.200986, 0.3607843, 0, 1, 1,
0.5719559, 1.979103, -0.6696236, 0.3686275, 0, 1, 1,
0.5731689, -0.141805, 1.798945, 0.372549, 0, 1, 1,
0.5744175, -0.5509894, 1.403189, 0.3803922, 0, 1, 1,
0.5780218, -0.2273088, 1.462792, 0.3843137, 0, 1, 1,
0.5810007, -0.541683, 2.223386, 0.3921569, 0, 1, 1,
0.5813665, 1.057488, -0.7257017, 0.3960784, 0, 1, 1,
0.5849171, 1.362366, -0.2943306, 0.4039216, 0, 1, 1,
0.5861346, -1.454098, 2.298859, 0.4117647, 0, 1, 1,
0.5965065, -1.241014, 2.598578, 0.4156863, 0, 1, 1,
0.6029033, -0.07462651, 1.09088, 0.4235294, 0, 1, 1,
0.6046187, 0.203054, 1.150684, 0.427451, 0, 1, 1,
0.6050339, -0.8439586, 0.8470691, 0.4352941, 0, 1, 1,
0.6076254, -0.9558505, 3.143838, 0.4392157, 0, 1, 1,
0.6089215, 0.2450265, 1.274447, 0.4470588, 0, 1, 1,
0.6097842, 0.7568612, -0.6127714, 0.4509804, 0, 1, 1,
0.6103996, -1.08659, 3.19494, 0.4588235, 0, 1, 1,
0.6112266, -0.3041797, 0.7795603, 0.4627451, 0, 1, 1,
0.6193247, -0.9790744, 1.561221, 0.4705882, 0, 1, 1,
0.6205729, -0.526851, 1.958267, 0.4745098, 0, 1, 1,
0.6229225, -0.6593878, 3.013672, 0.4823529, 0, 1, 1,
0.6337692, -0.1905223, 1.457339, 0.4862745, 0, 1, 1,
0.6406344, 0.6398833, 1.133089, 0.4941176, 0, 1, 1,
0.6450724, -0.4204355, -0.1010215, 0.5019608, 0, 1, 1,
0.6460477, 0.1042344, 0.03105905, 0.5058824, 0, 1, 1,
0.6562411, -0.7185861, 0.8765395, 0.5137255, 0, 1, 1,
0.6570154, -0.8484153, 1.756377, 0.5176471, 0, 1, 1,
0.6573449, 4.086235, -0.1017284, 0.5254902, 0, 1, 1,
0.6614688, 2.051953, -1.405552, 0.5294118, 0, 1, 1,
0.6638714, -0.3258766, 4.121154, 0.5372549, 0, 1, 1,
0.6667921, -0.2559226, 0.4180916, 0.5411765, 0, 1, 1,
0.6703527, -0.8423329, 3.849455, 0.5490196, 0, 1, 1,
0.6757056, 0.3111149, 2.325891, 0.5529412, 0, 1, 1,
0.6779055, -0.1009009, 0.2815197, 0.5607843, 0, 1, 1,
0.6849185, 0.2356164, 0.0307925, 0.5647059, 0, 1, 1,
0.6925673, 0.2358232, 1.793327, 0.572549, 0, 1, 1,
0.6998444, -0.9336131, 0.4129516, 0.5764706, 0, 1, 1,
0.7045374, 1.018411, 1.645508, 0.5843138, 0, 1, 1,
0.7057893, -1.241052, 2.678706, 0.5882353, 0, 1, 1,
0.7080142, -1.062574, 1.628372, 0.5960785, 0, 1, 1,
0.7108259, 0.232212, 2.744821, 0.6039216, 0, 1, 1,
0.7140386, 0.9364001, -1.009035, 0.6078432, 0, 1, 1,
0.7146471, -0.5229662, 3.102731, 0.6156863, 0, 1, 1,
0.7158694, -0.2416757, 1.75936, 0.6196079, 0, 1, 1,
0.7169133, 0.6101027, -0.1890307, 0.627451, 0, 1, 1,
0.7197673, -1.768214, 0.9754184, 0.6313726, 0, 1, 1,
0.7240128, 0.9434862, -0.2096044, 0.6392157, 0, 1, 1,
0.7258109, 0.0585572, 0.5676408, 0.6431373, 0, 1, 1,
0.7324982, -0.9440066, 2.804008, 0.6509804, 0, 1, 1,
0.7333516, 2.209686, 0.1828895, 0.654902, 0, 1, 1,
0.7357162, 1.429716, 0.5274143, 0.6627451, 0, 1, 1,
0.7528817, -0.9579313, 2.36262, 0.6666667, 0, 1, 1,
0.7548125, -0.9541547, 2.467077, 0.6745098, 0, 1, 1,
0.7633926, 0.8808524, -0.2813964, 0.6784314, 0, 1, 1,
0.7670172, 1.812402, 0.4471468, 0.6862745, 0, 1, 1,
0.7675238, 1.035874, -1.067557, 0.6901961, 0, 1, 1,
0.7701582, 0.3098852, 0.4393156, 0.6980392, 0, 1, 1,
0.7715977, 1.768996, -0.4690963, 0.7058824, 0, 1, 1,
0.7716489, -1.162918, 1.685515, 0.7098039, 0, 1, 1,
0.7762052, -3.627985, 3.690865, 0.7176471, 0, 1, 1,
0.7765818, 0.4319193, 0.5821308, 0.7215686, 0, 1, 1,
0.7881476, -2.431482, 1.945321, 0.7294118, 0, 1, 1,
0.7892981, 1.378167, -1.433772, 0.7333333, 0, 1, 1,
0.7920032, 1.035482, 0.6517878, 0.7411765, 0, 1, 1,
0.7953982, 0.9414656, 2.142868, 0.7450981, 0, 1, 1,
0.7963829, 0.942978, 0.5727159, 0.7529412, 0, 1, 1,
0.797996, 1.171613, 1.059875, 0.7568628, 0, 1, 1,
0.804295, -0.6283802, 2.883093, 0.7647059, 0, 1, 1,
0.8060541, 1.087792, 0.4851663, 0.7686275, 0, 1, 1,
0.8230546, 0.7800139, 0.2657053, 0.7764706, 0, 1, 1,
0.829089, -0.5032732, 0.3054341, 0.7803922, 0, 1, 1,
0.8320909, -1.054753, 4.514039, 0.7882353, 0, 1, 1,
0.8344344, -0.772332, 1.96335, 0.7921569, 0, 1, 1,
0.8490235, -2.580259, 2.278883, 0.8, 0, 1, 1,
0.8516995, 1.196519, 1.026755, 0.8078431, 0, 1, 1,
0.8530052, -0.1522558, 1.30838, 0.8117647, 0, 1, 1,
0.8567146, -0.6606056, 1.920421, 0.8196079, 0, 1, 1,
0.8586171, 0.3420461, 0.08106568, 0.8235294, 0, 1, 1,
0.8623646, 0.9490039, 1.337674, 0.8313726, 0, 1, 1,
0.8669435, 1.487672, 2.06574, 0.8352941, 0, 1, 1,
0.8721012, 1.955654, -0.4986554, 0.8431373, 0, 1, 1,
0.8730503, 1.252791, 1.393757, 0.8470588, 0, 1, 1,
0.8748078, 1.010491, 1.687942, 0.854902, 0, 1, 1,
0.875829, -1.846601, 2.594024, 0.8588235, 0, 1, 1,
0.8760998, -1.351356, 1.549079, 0.8666667, 0, 1, 1,
0.8786162, 2.374954, 0.8989919, 0.8705882, 0, 1, 1,
0.881052, -0.4102735, 2.534883, 0.8784314, 0, 1, 1,
0.8839964, 0.6973016, 2.792821, 0.8823529, 0, 1, 1,
0.8861651, -0.01766819, 1.200212, 0.8901961, 0, 1, 1,
0.8963526, 0.2589079, -0.5841579, 0.8941177, 0, 1, 1,
0.9023632, 0.2150226, 2.070053, 0.9019608, 0, 1, 1,
0.9056824, 1.884136, 1.154276, 0.9098039, 0, 1, 1,
0.9067256, 0.1775887, 0.9060332, 0.9137255, 0, 1, 1,
0.9074971, -0.5432763, 2.533098, 0.9215686, 0, 1, 1,
0.9076755, 1.546684, 0.4270898, 0.9254902, 0, 1, 1,
0.9100355, -0.4761443, 2.628368, 0.9333333, 0, 1, 1,
0.9111094, -0.3396097, 2.845257, 0.9372549, 0, 1, 1,
0.9167746, 0.4845975, -0.2266027, 0.945098, 0, 1, 1,
0.9244527, 0.6040562, 2.514094, 0.9490196, 0, 1, 1,
0.9247907, -1.048558, 2.94093, 0.9568627, 0, 1, 1,
0.9269488, -1.08927, 2.191616, 0.9607843, 0, 1, 1,
0.9281294, -1.354936, 2.429132, 0.9686275, 0, 1, 1,
0.9288305, 2.087256, 2.267853, 0.972549, 0, 1, 1,
0.9308574, 0.2070007, 0.40174, 0.9803922, 0, 1, 1,
0.9328037, -2.440187, 1.69012, 0.9843137, 0, 1, 1,
0.9389613, -0.5258434, 2.382318, 0.9921569, 0, 1, 1,
0.9393978, 0.5048424, -0.1008992, 0.9960784, 0, 1, 1,
0.9395285, 0.8381146, 0.5761272, 1, 0, 0.9960784, 1,
0.9401133, 0.46845, -0.2685731, 1, 0, 0.9882353, 1,
0.9412488, 0.969566, 0.4077161, 1, 0, 0.9843137, 1,
0.9444616, -0.4170924, 3.263791, 1, 0, 0.9764706, 1,
0.9568068, -0.9889182, 2.30377, 1, 0, 0.972549, 1,
0.9791889, -0.4194498, 2.95416, 1, 0, 0.9647059, 1,
0.9792389, 0.05720529, 1.638832, 1, 0, 0.9607843, 1,
0.9830325, 0.1873594, 2.642519, 1, 0, 0.9529412, 1,
0.9863237, 0.6740478, -0.7971937, 1, 0, 0.9490196, 1,
0.9887862, -0.02370144, 1.256542, 1, 0, 0.9411765, 1,
0.9931901, 1.522493, -2.12672, 1, 0, 0.9372549, 1,
0.9932753, -1.582962, 3.607774, 1, 0, 0.9294118, 1,
1.003739, 1.201582, 2.537798, 1, 0, 0.9254902, 1,
1.005361, 0.09795748, 1.832504, 1, 0, 0.9176471, 1,
1.008233, -1.356956, 2.087513, 1, 0, 0.9137255, 1,
1.020432, -0.4582238, 1.968276, 1, 0, 0.9058824, 1,
1.029926, -1.057515, 1.238368, 1, 0, 0.9019608, 1,
1.049577, -1.884496, 2.299917, 1, 0, 0.8941177, 1,
1.049689, 0.3890868, 1.647928, 1, 0, 0.8862745, 1,
1.050006, 1.091614, 0.6040522, 1, 0, 0.8823529, 1,
1.051158, 1.078544, 1.181025, 1, 0, 0.8745098, 1,
1.05547, 0.02875385, -0.1673517, 1, 0, 0.8705882, 1,
1.080065, 0.9320292, 0.08506986, 1, 0, 0.8627451, 1,
1.08014, -0.9657289, 2.358767, 1, 0, 0.8588235, 1,
1.081491, 1.236341, 3.56542, 1, 0, 0.8509804, 1,
1.083359, -0.4920456, 2.047039, 1, 0, 0.8470588, 1,
1.091712, 0.4082385, 1.035548, 1, 0, 0.8392157, 1,
1.092261, -0.6159692, 2.999832, 1, 0, 0.8352941, 1,
1.103214, -0.6559106, 1.530434, 1, 0, 0.827451, 1,
1.117464, -0.3274684, 3.257822, 1, 0, 0.8235294, 1,
1.123168, -0.2666062, 0.466358, 1, 0, 0.8156863, 1,
1.125839, -1.645042, 2.17872, 1, 0, 0.8117647, 1,
1.128107, 0.9764801, 1.54819, 1, 0, 0.8039216, 1,
1.135498, -1.260415, 0.6990015, 1, 0, 0.7960784, 1,
1.138272, -0.07268412, 0.07958384, 1, 0, 0.7921569, 1,
1.13948, 0.05950911, 1.010713, 1, 0, 0.7843137, 1,
1.149722, -0.7300217, 2.451766, 1, 0, 0.7803922, 1,
1.152192, 0.7653754, 2.28125, 1, 0, 0.772549, 1,
1.154021, 0.7779586, 1.337878, 1, 0, 0.7686275, 1,
1.154353, 0.3952943, 0.9972586, 1, 0, 0.7607843, 1,
1.16968, 0.1689958, 2.585173, 1, 0, 0.7568628, 1,
1.177352, -0.8956894, 3.040189, 1, 0, 0.7490196, 1,
1.179131, 1.282963, 0.332153, 1, 0, 0.7450981, 1,
1.183403, 0.4851076, 1.492573, 1, 0, 0.7372549, 1,
1.189585, 0.3160254, 1.302855, 1, 0, 0.7333333, 1,
1.190707, 0.516547, 1.422077, 1, 0, 0.7254902, 1,
1.202403, 0.8396214, 2.762067, 1, 0, 0.7215686, 1,
1.20488, 1.145473, 0.63776, 1, 0, 0.7137255, 1,
1.206993, 0.2502495, 3.182191, 1, 0, 0.7098039, 1,
1.207302, 1.215923, 1.291574, 1, 0, 0.7019608, 1,
1.209451, -1.870752, 3.808307, 1, 0, 0.6941177, 1,
1.211346, 0.1524732, 1.386731, 1, 0, 0.6901961, 1,
1.213012, 1.016971, 2.223827, 1, 0, 0.682353, 1,
1.219746, -0.04468875, 0.7851436, 1, 0, 0.6784314, 1,
1.221961, -0.2649414, 2.695227, 1, 0, 0.6705883, 1,
1.239254, -0.1767171, 1.186675, 1, 0, 0.6666667, 1,
1.242672, -1.450009, 2.283171, 1, 0, 0.6588235, 1,
1.243361, 0.5180607, -0.8349918, 1, 0, 0.654902, 1,
1.249201, -1.569768, 2.171244, 1, 0, 0.6470588, 1,
1.252894, 2.141618, -1.720572, 1, 0, 0.6431373, 1,
1.253312, 0.01426704, 1.281561, 1, 0, 0.6352941, 1,
1.25783, 1.273675, 1.221307, 1, 0, 0.6313726, 1,
1.258556, 1.321009, 0.3241419, 1, 0, 0.6235294, 1,
1.26052, 0.5711357, 0.8019193, 1, 0, 0.6196079, 1,
1.26117, 0.2164995, -0.5258304, 1, 0, 0.6117647, 1,
1.267954, 0.8030275, 0.2756105, 1, 0, 0.6078432, 1,
1.271393, -0.8997976, 3.034549, 1, 0, 0.6, 1,
1.283571, -0.5396046, 2.163266, 1, 0, 0.5921569, 1,
1.287434, 0.03899875, 0.6850685, 1, 0, 0.5882353, 1,
1.287734, 0.1693107, 3.566584, 1, 0, 0.5803922, 1,
1.301211, 0.6975071, 2.042657, 1, 0, 0.5764706, 1,
1.318759, -0.8934904, 2.17588, 1, 0, 0.5686275, 1,
1.329122, 1.104127, -0.6834576, 1, 0, 0.5647059, 1,
1.335758, 0.8269992, 1.86741, 1, 0, 0.5568628, 1,
1.335997, 0.4933961, 1.262747, 1, 0, 0.5529412, 1,
1.336814, 1.984643, 0.1508845, 1, 0, 0.5450981, 1,
1.342746, 1.375041, 2.611923, 1, 0, 0.5411765, 1,
1.344681, -0.2879754, 3.88935, 1, 0, 0.5333334, 1,
1.345485, -1.075398, 1.907241, 1, 0, 0.5294118, 1,
1.35172, -0.753919, 1.22417, 1, 0, 0.5215687, 1,
1.355065, -1.930789, 2.658866, 1, 0, 0.5176471, 1,
1.357215, -1.755122, 2.809987, 1, 0, 0.509804, 1,
1.365334, 0.01988481, 0.7528645, 1, 0, 0.5058824, 1,
1.367874, 0.4602456, 0.5833059, 1, 0, 0.4980392, 1,
1.371146, 0.4514665, 1.961918, 1, 0, 0.4901961, 1,
1.37293, 3.154042, 0.5717487, 1, 0, 0.4862745, 1,
1.373161, -1.343256, 2.111706, 1, 0, 0.4784314, 1,
1.377042, 0.1433514, 0.9506388, 1, 0, 0.4745098, 1,
1.392295, -0.3295194, 2.161086, 1, 0, 0.4666667, 1,
1.395691, -0.2856485, 0.425436, 1, 0, 0.4627451, 1,
1.411749, -0.3731567, 0.6299377, 1, 0, 0.454902, 1,
1.412609, 0.4180678, 1.79946, 1, 0, 0.4509804, 1,
1.417567, -1.651441, 0.9554266, 1, 0, 0.4431373, 1,
1.431333, -0.7950254, 1.988911, 1, 0, 0.4392157, 1,
1.433303, 0.01744509, 0.7808552, 1, 0, 0.4313726, 1,
1.434983, -1.418412, 2.258587, 1, 0, 0.427451, 1,
1.43578, -1.347028, 2.211195, 1, 0, 0.4196078, 1,
1.44052, -0.0998266, 1.418079, 1, 0, 0.4156863, 1,
1.452626, -0.9533454, 1.044754, 1, 0, 0.4078431, 1,
1.456104, -0.3526392, 1.74939, 1, 0, 0.4039216, 1,
1.505083, -0.1395328, 0.4813183, 1, 0, 0.3960784, 1,
1.508727, -1.615307, 3.784292, 1, 0, 0.3882353, 1,
1.516674, -0.858926, 2.933309, 1, 0, 0.3843137, 1,
1.527377, -0.3074822, 2.098884, 1, 0, 0.3764706, 1,
1.537019, -0.7923946, 1.824126, 1, 0, 0.372549, 1,
1.543876, -1.305966, 2.012552, 1, 0, 0.3647059, 1,
1.557461, 1.826787, -0.9453465, 1, 0, 0.3607843, 1,
1.561794, -0.5316088, 1.992259, 1, 0, 0.3529412, 1,
1.566493, -0.1882448, 2.577251, 1, 0, 0.3490196, 1,
1.587157, -0.3121996, 3.747396, 1, 0, 0.3411765, 1,
1.588295, -0.2816064, 3.154856, 1, 0, 0.3372549, 1,
1.588459, -0.1742508, 2.301059, 1, 0, 0.3294118, 1,
1.59536, -0.7056441, 1.04829, 1, 0, 0.3254902, 1,
1.599563, -0.5060224, 2.161168, 1, 0, 0.3176471, 1,
1.621347, 0.1090591, 0.8781357, 1, 0, 0.3137255, 1,
1.625554, -1.031533, 2.817989, 1, 0, 0.3058824, 1,
1.62579, 0.08223969, -0.0003098354, 1, 0, 0.2980392, 1,
1.647827, -0.8689007, 3.152524, 1, 0, 0.2941177, 1,
1.666194, 0.3686722, 2.286391, 1, 0, 0.2862745, 1,
1.676996, -0.5148025, 1.847136, 1, 0, 0.282353, 1,
1.692973, -1.029837, 2.842494, 1, 0, 0.2745098, 1,
1.706897, -0.8275337, 2.532543, 1, 0, 0.2705882, 1,
1.729336, 0.1454472, 1.81524, 1, 0, 0.2627451, 1,
1.74641, -0.2722392, -0.253268, 1, 0, 0.2588235, 1,
1.780998, -1.906654, 4.393395, 1, 0, 0.2509804, 1,
1.794842, 0.8995727, 0.01375379, 1, 0, 0.2470588, 1,
1.798232, -0.2400218, 0.6049073, 1, 0, 0.2392157, 1,
1.81033, 2.183346, -0.1657314, 1, 0, 0.2352941, 1,
1.83179, 0.4480832, 2.698299, 1, 0, 0.227451, 1,
1.832121, 1.881108, 2.046175, 1, 0, 0.2235294, 1,
1.841674, -0.48927, 1.759163, 1, 0, 0.2156863, 1,
1.846312, -1.359829, 3.952446, 1, 0, 0.2117647, 1,
1.868294, -3.594312, 2.431612, 1, 0, 0.2039216, 1,
1.871337, -1.932036, 2.117063, 1, 0, 0.1960784, 1,
1.885525, -1.790881, 2.595954, 1, 0, 0.1921569, 1,
1.8906, 0.1683707, 1.186442, 1, 0, 0.1843137, 1,
1.890962, -1.934703, 3.026126, 1, 0, 0.1803922, 1,
1.929429, 1.212982, -0.8456529, 1, 0, 0.172549, 1,
1.951545, -0.7391913, 1.266567, 1, 0, 0.1686275, 1,
1.980427, -0.7150018, 1.704806, 1, 0, 0.1607843, 1,
2.064164, -0.3076442, 1.113916, 1, 0, 0.1568628, 1,
2.072042, 1.83839, 2.604233, 1, 0, 0.1490196, 1,
2.079162, -0.6821206, 1.105819, 1, 0, 0.145098, 1,
2.082491, -0.6699929, 2.066891, 1, 0, 0.1372549, 1,
2.142878, 0.2767023, 2.73583, 1, 0, 0.1333333, 1,
2.212384, -0.8874168, 0.1357696, 1, 0, 0.1254902, 1,
2.247433, -1.263079, 3.156969, 1, 0, 0.1215686, 1,
2.255581, 0.8304696, 1.04969, 1, 0, 0.1137255, 1,
2.304417, -0.06094657, 2.609923, 1, 0, 0.1098039, 1,
2.322904, -0.7837222, 1.496849, 1, 0, 0.1019608, 1,
2.367636, -1.338205, 3.683918, 1, 0, 0.09411765, 1,
2.423821, 0.1932536, 1.469017, 1, 0, 0.09019608, 1,
2.460786, -1.250017, 2.267501, 1, 0, 0.08235294, 1,
2.467847, 0.8121688, 1.030936, 1, 0, 0.07843138, 1,
2.480895, -0.9074658, 2.13535, 1, 0, 0.07058824, 1,
2.486181, 0.06936159, 0.9684305, 1, 0, 0.06666667, 1,
2.499011, 0.7349304, 2.802139, 1, 0, 0.05882353, 1,
2.528699, -0.7590626, 1.387321, 1, 0, 0.05490196, 1,
2.617438, -0.4532088, 0.7149508, 1, 0, 0.04705882, 1,
2.635184, -1.4048, 2.206265, 1, 0, 0.04313726, 1,
2.70049, -1.4986, 3.187534, 1, 0, 0.03529412, 1,
2.865491, -2.466385, 3.021046, 1, 0, 0.03137255, 1,
2.901066, -0.01743802, 2.822335, 1, 0, 0.02352941, 1,
3.00233, 2.885325, 0.07253496, 1, 0, 0.01960784, 1,
3.528872, -0.5715327, 3.725551, 1, 0, 0.01176471, 1,
3.967038, -0.2437199, 1.895901, 1, 0, 0.007843138, 1
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
0.3068075, -4.949908, -7.199942, 0, -0.5, 0.5, 0.5,
0.3068075, -4.949908, -7.199942, 1, -0.5, 0.5, 0.5,
0.3068075, -4.949908, -7.199942, 1, 1.5, 0.5, 0.5,
0.3068075, -4.949908, -7.199942, 0, 1.5, 0.5, 0.5
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
-4.594241, 0.2229846, -7.199942, 0, -0.5, 0.5, 0.5,
-4.594241, 0.2229846, -7.199942, 1, -0.5, 0.5, 0.5,
-4.594241, 0.2229846, -7.199942, 1, 1.5, 0.5, 0.5,
-4.594241, 0.2229846, -7.199942, 0, 1.5, 0.5, 0.5
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
-4.594241, -4.949908, 0.02893209, 0, -0.5, 0.5, 0.5,
-4.594241, -4.949908, 0.02893209, 1, -0.5, 0.5, 0.5,
-4.594241, -4.949908, 0.02893209, 1, 1.5, 0.5, 0.5,
-4.594241, -4.949908, 0.02893209, 0, 1.5, 0.5, 0.5
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
-2, -3.756163, -5.53174,
2, -3.756163, -5.53174,
-2, -3.756163, -5.53174,
-2, -3.955121, -5.809773,
0, -3.756163, -5.53174,
0, -3.955121, -5.809773,
2, -3.756163, -5.53174,
2, -3.955121, -5.809773
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
-2, -4.353035, -6.365841, 0, -0.5, 0.5, 0.5,
-2, -4.353035, -6.365841, 1, -0.5, 0.5, 0.5,
-2, -4.353035, -6.365841, 1, 1.5, 0.5, 0.5,
-2, -4.353035, -6.365841, 0, 1.5, 0.5, 0.5,
0, -4.353035, -6.365841, 0, -0.5, 0.5, 0.5,
0, -4.353035, -6.365841, 1, -0.5, 0.5, 0.5,
0, -4.353035, -6.365841, 1, 1.5, 0.5, 0.5,
0, -4.353035, -6.365841, 0, 1.5, 0.5, 0.5,
2, -4.353035, -6.365841, 0, -0.5, 0.5, 0.5,
2, -4.353035, -6.365841, 1, -0.5, 0.5, 0.5,
2, -4.353035, -6.365841, 1, 1.5, 0.5, 0.5,
2, -4.353035, -6.365841, 0, 1.5, 0.5, 0.5
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
-3.46323, -2, -5.53174,
-3.46323, 4, -5.53174,
-3.46323, -2, -5.53174,
-3.651732, -2, -5.809773,
-3.46323, 0, -5.53174,
-3.651732, 0, -5.809773,
-3.46323, 2, -5.53174,
-3.651732, 2, -5.809773,
-3.46323, 4, -5.53174,
-3.651732, 4, -5.809773
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
"2",
"4"
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
-4.028735, -2, -6.365841, 0, -0.5, 0.5, 0.5,
-4.028735, -2, -6.365841, 1, -0.5, 0.5, 0.5,
-4.028735, -2, -6.365841, 1, 1.5, 0.5, 0.5,
-4.028735, -2, -6.365841, 0, 1.5, 0.5, 0.5,
-4.028735, 0, -6.365841, 0, -0.5, 0.5, 0.5,
-4.028735, 0, -6.365841, 1, -0.5, 0.5, 0.5,
-4.028735, 0, -6.365841, 1, 1.5, 0.5, 0.5,
-4.028735, 0, -6.365841, 0, 1.5, 0.5, 0.5,
-4.028735, 2, -6.365841, 0, -0.5, 0.5, 0.5,
-4.028735, 2, -6.365841, 1, -0.5, 0.5, 0.5,
-4.028735, 2, -6.365841, 1, 1.5, 0.5, 0.5,
-4.028735, 2, -6.365841, 0, 1.5, 0.5, 0.5,
-4.028735, 4, -6.365841, 0, -0.5, 0.5, 0.5,
-4.028735, 4, -6.365841, 1, -0.5, 0.5, 0.5,
-4.028735, 4, -6.365841, 1, 1.5, 0.5, 0.5,
-4.028735, 4, -6.365841, 0, 1.5, 0.5, 0.5
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
-3.46323, -3.756163, -4,
-3.46323, -3.756163, 4,
-3.46323, -3.756163, -4,
-3.651732, -3.955121, -4,
-3.46323, -3.756163, -2,
-3.651732, -3.955121, -2,
-3.46323, -3.756163, 0,
-3.651732, -3.955121, 0,
-3.46323, -3.756163, 2,
-3.651732, -3.955121, 2,
-3.46323, -3.756163, 4,
-3.651732, -3.955121, 4
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
-4.028735, -4.353035, -4, 0, -0.5, 0.5, 0.5,
-4.028735, -4.353035, -4, 1, -0.5, 0.5, 0.5,
-4.028735, -4.353035, -4, 1, 1.5, 0.5, 0.5,
-4.028735, -4.353035, -4, 0, 1.5, 0.5, 0.5,
-4.028735, -4.353035, -2, 0, -0.5, 0.5, 0.5,
-4.028735, -4.353035, -2, 1, -0.5, 0.5, 0.5,
-4.028735, -4.353035, -2, 1, 1.5, 0.5, 0.5,
-4.028735, -4.353035, -2, 0, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 0, 0, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 0, 1, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 0, 1, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 0, 0, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 2, 0, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 2, 1, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 2, 1, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 2, 0, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 4, 0, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 4, 1, -0.5, 0.5, 0.5,
-4.028735, -4.353035, 4, 1, 1.5, 0.5, 0.5,
-4.028735, -4.353035, 4, 0, 1.5, 0.5, 0.5
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
-3.46323, -3.756163, -5.53174,
-3.46323, 4.202133, -5.53174,
-3.46323, -3.756163, 5.589604,
-3.46323, 4.202133, 5.589604,
-3.46323, -3.756163, -5.53174,
-3.46323, -3.756163, 5.589604,
-3.46323, 4.202133, -5.53174,
-3.46323, 4.202133, 5.589604,
-3.46323, -3.756163, -5.53174,
4.076845, -3.756163, -5.53174,
-3.46323, -3.756163, 5.589604,
4.076845, -3.756163, 5.589604,
-3.46323, 4.202133, -5.53174,
4.076845, 4.202133, -5.53174,
-3.46323, 4.202133, 5.589604,
4.076845, 4.202133, 5.589604,
4.076845, -3.756163, -5.53174,
4.076845, 4.202133, -5.53174,
4.076845, -3.756163, 5.589604,
4.076845, 4.202133, 5.589604,
4.076845, -3.756163, -5.53174,
4.076845, -3.756163, 5.589604,
4.076845, 4.202133, -5.53174,
4.076845, 4.202133, 5.589604
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
var radius = 8.338846;
var distance = 37.10047;
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
mvMatrix.translate( -0.3068075, -0.2229846, -0.02893209 );
mvMatrix.scale( 1.195761, 1.132921, 0.8107045 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.10047);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
dinobuton<-read.table("dinobuton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinobuton$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
y<-dinobuton$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
z<-dinobuton$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
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
-3.353423, 1.173908, -0.02514398, 0, 0, 1, 1, 1,
-3.132215, 1.16672, 1.081907, 1, 0, 0, 1, 1,
-2.694316, -0.8350842, -1.638166, 1, 0, 0, 1, 1,
-2.551706, -0.4996955, -2.481571, 1, 0, 0, 1, 1,
-2.497198, 0.04513377, -1.425756, 1, 0, 0, 1, 1,
-2.411941, -1.035167, -2.017353, 1, 0, 0, 1, 1,
-2.35835, 0.9774169, -0.4228318, 0, 0, 0, 1, 1,
-2.356772, 0.6382249, -1.846512, 0, 0, 0, 1, 1,
-2.321167, 1.281943, -0.712514, 0, 0, 0, 1, 1,
-2.296842, -0.6339952, -1.234963, 0, 0, 0, 1, 1,
-2.279044, 2.569516, -1.783512, 0, 0, 0, 1, 1,
-2.226659, -0.305797, -1.176563, 0, 0, 0, 1, 1,
-2.217112, 0.3653516, -1.480626, 0, 0, 0, 1, 1,
-2.21616, 0.7433774, -1.627576, 1, 1, 1, 1, 1,
-2.185578, 2.125055, 0.8036451, 1, 1, 1, 1, 1,
-2.176009, -0.4349338, -2.246694, 1, 1, 1, 1, 1,
-2.131727, -0.7185028, -0.7608539, 1, 1, 1, 1, 1,
-2.127627, 1.221641, -0.13097, 1, 1, 1, 1, 1,
-2.100436, 0.2671495, -2.478075, 1, 1, 1, 1, 1,
-2.082252, 0.8874151, -0.3894125, 1, 1, 1, 1, 1,
-2.079031, -2.49223, -4.043193, 1, 1, 1, 1, 1,
-2.05125, -0.755106, -1.005383, 1, 1, 1, 1, 1,
-2.029126, -0.5936712, -0.2927535, 1, 1, 1, 1, 1,
-2.00275, -0.2007692, -1.784589, 1, 1, 1, 1, 1,
-1.958049, 0.1630148, -0.677609, 1, 1, 1, 1, 1,
-1.945882, -1.416621, -0.8503641, 1, 1, 1, 1, 1,
-1.941361, -0.8797513, -1.134713, 1, 1, 1, 1, 1,
-1.938401, 0.1887674, -0.5235792, 1, 1, 1, 1, 1,
-1.93375, 0.3217561, -0.1633108, 0, 0, 1, 1, 1,
-1.920083, -0.1149178, -1.237586, 1, 0, 0, 1, 1,
-1.909528, 0.26391, -1.498785, 1, 0, 0, 1, 1,
-1.907797, -1.371979, -2.52996, 1, 0, 0, 1, 1,
-1.890077, 0.6504377, -2.435458, 1, 0, 0, 1, 1,
-1.876979, 0.09930211, -1.413814, 1, 0, 0, 1, 1,
-1.862147, 0.4452556, -1.356893, 0, 0, 0, 1, 1,
-1.835619, -0.4367618, -2.537715, 0, 0, 0, 1, 1,
-1.819197, 2.042198, -1.679066, 0, 0, 0, 1, 1,
-1.8134, -1.156702, -2.385242, 0, 0, 0, 1, 1,
-1.805674, -0.6648493, -1.440773, 0, 0, 0, 1, 1,
-1.799897, 1.144424, -0.7725075, 0, 0, 0, 1, 1,
-1.796869, -1.447722, -2.875495, 0, 0, 0, 1, 1,
-1.771296, -0.3016409, -1.296929, 1, 1, 1, 1, 1,
-1.768926, -1.552343, -1.47487, 1, 1, 1, 1, 1,
-1.762344, -0.102589, -1.91478, 1, 1, 1, 1, 1,
-1.761133, -0.5188367, -2.260077, 1, 1, 1, 1, 1,
-1.710454, 1.84805, -1.60592, 1, 1, 1, 1, 1,
-1.705987, 0.1402064, -1.043067, 1, 1, 1, 1, 1,
-1.697792, 0.972584, -1.194322, 1, 1, 1, 1, 1,
-1.690587, 1.652846, -0.2277778, 1, 1, 1, 1, 1,
-1.685022, 0.2919295, -0.9054301, 1, 1, 1, 1, 1,
-1.681818, 0.4811541, -1.275745, 1, 1, 1, 1, 1,
-1.670072, -1.50861, -1.940899, 1, 1, 1, 1, 1,
-1.669597, 1.014964, -0.1902757, 1, 1, 1, 1, 1,
-1.64682, 0.9669389, -0.2953953, 1, 1, 1, 1, 1,
-1.637578, 1.268131, -1.106595, 1, 1, 1, 1, 1,
-1.632251, 0.344068, -2.195706, 1, 1, 1, 1, 1,
-1.631636, 0.6791596, -2.714252, 0, 0, 1, 1, 1,
-1.609137, 0.7106534, -1.978842, 1, 0, 0, 1, 1,
-1.602592, -2.111088, -2.564689, 1, 0, 0, 1, 1,
-1.591739, -1.587388, -4.329259, 1, 0, 0, 1, 1,
-1.576831, 0.3262974, -0.3046177, 1, 0, 0, 1, 1,
-1.567336, 0.4960622, -0.7357985, 1, 0, 0, 1, 1,
-1.565458, -0.6337049, -1.87968, 0, 0, 0, 1, 1,
-1.5647, -0.6224492, -2.857347, 0, 0, 0, 1, 1,
-1.562912, -0.7902063, -1.737712, 0, 0, 0, 1, 1,
-1.558038, 0.7357969, 2.203089, 0, 0, 0, 1, 1,
-1.54931, -0.8925727, -0.853981, 0, 0, 0, 1, 1,
-1.538568, 1.337678, -0.1291825, 0, 0, 0, 1, 1,
-1.53758, 0.01999538, -1.638551, 0, 0, 0, 1, 1,
-1.519936, 1.140427, -0.892727, 1, 1, 1, 1, 1,
-1.51887, -0.9371246, -1.32123, 1, 1, 1, 1, 1,
-1.51881, 1.251805, -0.3736688, 1, 1, 1, 1, 1,
-1.511323, -0.8808327, -2.785501, 1, 1, 1, 1, 1,
-1.499542, -0.5379242, -0.9871283, 1, 1, 1, 1, 1,
-1.482415, 0.08683103, -0.6599725, 1, 1, 1, 1, 1,
-1.481909, 1.264955, -1.15307, 1, 1, 1, 1, 1,
-1.479382, -0.2375296, -2.294469, 1, 1, 1, 1, 1,
-1.478664, 0.5113963, -0.8362305, 1, 1, 1, 1, 1,
-1.465598, -0.7317834, -1.636283, 1, 1, 1, 1, 1,
-1.463746, 0.7992004, -0.1098209, 1, 1, 1, 1, 1,
-1.46315, 0.9038162, 1.997469, 1, 1, 1, 1, 1,
-1.456961, -0.02321458, -2.120669, 1, 1, 1, 1, 1,
-1.454936, -0.7381453, -1.456257, 1, 1, 1, 1, 1,
-1.454258, -0.09125082, -3.240236, 1, 1, 1, 1, 1,
-1.452937, 0.09647169, -0.4806589, 0, 0, 1, 1, 1,
-1.440013, 0.4690664, -1.446618, 1, 0, 0, 1, 1,
-1.439275, -1.596395, -2.592092, 1, 0, 0, 1, 1,
-1.433252, -0.658571, -0.9724479, 1, 0, 0, 1, 1,
-1.424408, -2.502692, -3.523232, 1, 0, 0, 1, 1,
-1.419637, -0.3143517, -1.390594, 1, 0, 0, 1, 1,
-1.414957, -0.3619618, -2.343696, 0, 0, 0, 1, 1,
-1.413884, 0.8517142, -0.6846792, 0, 0, 0, 1, 1,
-1.412879, -1.576744, -1.866481, 0, 0, 0, 1, 1,
-1.408402, 0.03228969, -0.7555265, 0, 0, 0, 1, 1,
-1.396649, 0.04022078, -1.462482, 0, 0, 0, 1, 1,
-1.393736, 0.5286002, -1.682985, 0, 0, 0, 1, 1,
-1.392175, 0.6961673, -0.4588695, 0, 0, 0, 1, 1,
-1.386263, 0.562295, -0.5845097, 1, 1, 1, 1, 1,
-1.379319, 0.3823786, -2.348303, 1, 1, 1, 1, 1,
-1.361516, 1.007615, -2.310553, 1, 1, 1, 1, 1,
-1.357363, -0.370724, -2.261714, 1, 1, 1, 1, 1,
-1.348897, -1.757627, -0.669759, 1, 1, 1, 1, 1,
-1.346123, -1.02782, -1.883743, 1, 1, 1, 1, 1,
-1.339309, -0.9420804, -1.390458, 1, 1, 1, 1, 1,
-1.337433, 1.821364, 0.8267356, 1, 1, 1, 1, 1,
-1.320276, -1.261809, -1.100278, 1, 1, 1, 1, 1,
-1.315388, 1.872199, -0.9449469, 1, 1, 1, 1, 1,
-1.305905, 1.086962, -0.8293311, 1, 1, 1, 1, 1,
-1.295338, -0.5660336, -3.626538, 1, 1, 1, 1, 1,
-1.293856, -0.126555, -0.8606049, 1, 1, 1, 1, 1,
-1.279742, 0.1078941, -0.1299247, 1, 1, 1, 1, 1,
-1.278008, 0.5337135, -0.8857712, 1, 1, 1, 1, 1,
-1.275951, -0.1776868, -0.4491738, 0, 0, 1, 1, 1,
-1.265586, -0.74988, -3.614994, 1, 0, 0, 1, 1,
-1.263305, -0.8299454, -3.458225, 1, 0, 0, 1, 1,
-1.258926, -0.8784746, -3.364197, 1, 0, 0, 1, 1,
-1.252094, 0.4391442, 1.323156, 1, 0, 0, 1, 1,
-1.242257, -1.000531, -2.049285, 1, 0, 0, 1, 1,
-1.240712, -1.365384, -1.880216, 0, 0, 0, 1, 1,
-1.21973, 0.05165548, -2.757738, 0, 0, 0, 1, 1,
-1.21262, 0.7543445, -1.403188, 0, 0, 0, 1, 1,
-1.210503, -1.891665, -3.204813, 0, 0, 0, 1, 1,
-1.194189, 1.241639, -1.307817, 0, 0, 0, 1, 1,
-1.184213, -0.6402928, -1.518028, 0, 0, 0, 1, 1,
-1.183718, 0.335094, -0.0793428, 0, 0, 0, 1, 1,
-1.180758, 0.6908623, -1.673874, 1, 1, 1, 1, 1,
-1.176485, -0.3039369, -1.830823, 1, 1, 1, 1, 1,
-1.170987, 0.05147647, -2.079888, 1, 1, 1, 1, 1,
-1.167381, -0.1860716, -3.660638, 1, 1, 1, 1, 1,
-1.167252, -1.282844, -1.70117, 1, 1, 1, 1, 1,
-1.164963, -0.7999408, -4.404742, 1, 1, 1, 1, 1,
-1.163229, 1.361371, 0.2848841, 1, 1, 1, 1, 1,
-1.159832, 0.2231015, -1.591877, 1, 1, 1, 1, 1,
-1.154401, 0.5007051, -2.067973, 1, 1, 1, 1, 1,
-1.146019, -0.1540588, -3.64716, 1, 1, 1, 1, 1,
-1.134115, -0.4840668, -2.570178, 1, 1, 1, 1, 1,
-1.127416, -0.7300292, -3.413845, 1, 1, 1, 1, 1,
-1.12466, -1.045006, 0.2450344, 1, 1, 1, 1, 1,
-1.115741, 0.6198552, -1.528525, 1, 1, 1, 1, 1,
-1.104217, -0.346181, -1.551594, 1, 1, 1, 1, 1,
-1.094321, 1.535864, 0.007204928, 0, 0, 1, 1, 1,
-1.093434, 0.3640833, -0.3651589, 1, 0, 0, 1, 1,
-1.090886, -1.008279, -1.676107, 1, 0, 0, 1, 1,
-1.085796, 0.9993933, -1.541571, 1, 0, 0, 1, 1,
-1.077492, -0.2784212, -1.377876, 1, 0, 0, 1, 1,
-1.075057, -0.09026973, -1.376904, 1, 0, 0, 1, 1,
-1.06839, 2.290542, 0.7368063, 0, 0, 0, 1, 1,
-1.066156, 0.3890465, -1.004547, 0, 0, 0, 1, 1,
-1.049204, -0.7270929, -4.178539, 0, 0, 0, 1, 1,
-1.040732, 1.048772, -0.9388806, 0, 0, 0, 1, 1,
-1.034524, 1.171443, -0.4926248, 0, 0, 0, 1, 1,
-1.034412, -0.3465053, -3.625909, 0, 0, 0, 1, 1,
-1.031809, 0.6692171, -1.550125, 0, 0, 0, 1, 1,
-1.0273, -0.1251809, -3.431849, 1, 1, 1, 1, 1,
-1.019657, -0.5297632, -2.668927, 1, 1, 1, 1, 1,
-1.019319, -0.6308275, -3.424912, 1, 1, 1, 1, 1,
-1.018042, -0.4417278, -1.803604, 1, 1, 1, 1, 1,
-1.012542, 0.3147722, -2.592273, 1, 1, 1, 1, 1,
-1.009644, 0.6802432, -0.617899, 1, 1, 1, 1, 1,
-1.008081, -1.690679, -1.708592, 1, 1, 1, 1, 1,
-1.006602, -0.427195, -0.8766662, 1, 1, 1, 1, 1,
-1.00474, 0.7957323, -2.349538, 1, 1, 1, 1, 1,
-0.9989917, 0.1175542, 0.41824, 1, 1, 1, 1, 1,
-0.9989593, -0.792253, -3.495591, 1, 1, 1, 1, 1,
-0.9954505, 0.2696287, -1.872593, 1, 1, 1, 1, 1,
-0.994422, 1.095886, -1.29106, 1, 1, 1, 1, 1,
-0.9922745, -0.496251, -3.5649, 1, 1, 1, 1, 1,
-0.986607, -0.3301456, -1.772576, 1, 1, 1, 1, 1,
-0.9841435, -0.1650862, -2.259481, 0, 0, 1, 1, 1,
-0.9832115, -1.388849, -1.947035, 1, 0, 0, 1, 1,
-0.9782961, -2.23554, -3.396214, 1, 0, 0, 1, 1,
-0.9782887, -0.3702421, -1.287992, 1, 0, 0, 1, 1,
-0.9782215, -1.72875, -1.8506, 1, 0, 0, 1, 1,
-0.9765891, 0.9874642, -1.011695, 1, 0, 0, 1, 1,
-0.9748511, 2.253765, -0.7644226, 0, 0, 0, 1, 1,
-0.9612034, 0.3292348, -0.4698925, 0, 0, 0, 1, 1,
-0.95807, 0.8463185, -1.895262, 0, 0, 0, 1, 1,
-0.9578279, 1.374445, -1.413616, 0, 0, 0, 1, 1,
-0.9484305, -1.046017, -2.66023, 0, 0, 0, 1, 1,
-0.9475155, 0.1101411, -1.447925, 0, 0, 0, 1, 1,
-0.9474967, -0.6227173, -1.932413, 0, 0, 0, 1, 1,
-0.9434979, -1.449805, -2.932368, 1, 1, 1, 1, 1,
-0.9426251, 1.111459, 0.7530252, 1, 1, 1, 1, 1,
-0.9392152, -0.3875167, -1.397005, 1, 1, 1, 1, 1,
-0.9310451, 0.09275334, -1.488569, 1, 1, 1, 1, 1,
-0.9278856, -1.30247, -2.820548, 1, 1, 1, 1, 1,
-0.9181833, -0.257796, -2.143016, 1, 1, 1, 1, 1,
-0.9130879, -1.523968, -3.346772, 1, 1, 1, 1, 1,
-0.9093102, -0.5261219, -1.050964, 1, 1, 1, 1, 1,
-0.9015324, -0.07823682, -3.685369, 1, 1, 1, 1, 1,
-0.9003732, -0.01358937, -0.337435, 1, 1, 1, 1, 1,
-0.9002267, 0.1562296, -2.900672, 1, 1, 1, 1, 1,
-0.8928254, -1.116835, -2.281148, 1, 1, 1, 1, 1,
-0.8776978, 0.06781463, -2.491982, 1, 1, 1, 1, 1,
-0.8753486, -0.1517729, 0.2785887, 1, 1, 1, 1, 1,
-0.8722375, 0.8001723, 0.3493489, 1, 1, 1, 1, 1,
-0.8691756, -0.9145973, -1.77448, 0, 0, 1, 1, 1,
-0.8656141, 0.2169254, -1.203069, 1, 0, 0, 1, 1,
-0.8616734, 0.2108674, -1.27346, 1, 0, 0, 1, 1,
-0.8568196, -0.7451493, -1.544138, 1, 0, 0, 1, 1,
-0.8505878, -1.419747, -2.455927, 1, 0, 0, 1, 1,
-0.848111, -1.221211, -2.64183, 1, 0, 0, 1, 1,
-0.8433688, -0.110551, -1.566223, 0, 0, 0, 1, 1,
-0.8429845, -0.243925, -1.280135, 0, 0, 0, 1, 1,
-0.8378494, 1.459121, 0.5570751, 0, 0, 0, 1, 1,
-0.8375169, -0.6329911, -0.1898476, 0, 0, 0, 1, 1,
-0.8351328, -1.044468, -1.706332, 0, 0, 0, 1, 1,
-0.8292617, -0.1255076, -2.387885, 0, 0, 0, 1, 1,
-0.828925, -0.3952927, -1.614314, 0, 0, 0, 1, 1,
-0.8155207, 0.4453819, -0.3700222, 1, 1, 1, 1, 1,
-0.8126892, 0.002162578, -2.087569, 1, 1, 1, 1, 1,
-0.8040592, -0.3857879, -2.138413, 1, 1, 1, 1, 1,
-0.7992494, -0.03904086, -0.1192949, 1, 1, 1, 1, 1,
-0.7834675, 0.3538121, -2.248733, 1, 1, 1, 1, 1,
-0.7655784, 1.159509, -0.1828161, 1, 1, 1, 1, 1,
-0.7636612, 0.3324205, 0.07874957, 1, 1, 1, 1, 1,
-0.7592471, -0.3738413, -2.178326, 1, 1, 1, 1, 1,
-0.7585531, 0.3224207, 0.8713246, 1, 1, 1, 1, 1,
-0.7554092, -0.6993082, -2.930853, 1, 1, 1, 1, 1,
-0.7549742, 0.9848498, 1.109267, 1, 1, 1, 1, 1,
-0.7485251, -1.059039, -2.292524, 1, 1, 1, 1, 1,
-0.7443455, -0.3337753, -2.7146, 1, 1, 1, 1, 1,
-0.7402326, 0.6350041, -1.180179, 1, 1, 1, 1, 1,
-0.7377865, 0.5709887, -0.3031521, 1, 1, 1, 1, 1,
-0.7349657, 0.6745505, 0.6703011, 0, 0, 1, 1, 1,
-0.7348411, -0.04843982, -1.651798, 1, 0, 0, 1, 1,
-0.728806, 1.260776, -0.6959299, 1, 0, 0, 1, 1,
-0.7286574, -2.162041, -1.967621, 1, 0, 0, 1, 1,
-0.7214954, -0.4009428, -0.4345489, 1, 0, 0, 1, 1,
-0.7209669, 0.2804911, 0.3106072, 1, 0, 0, 1, 1,
-0.716904, 0.002809558, -0.7412299, 0, 0, 0, 1, 1,
-0.7166949, -1.048955, -2.895128, 0, 0, 0, 1, 1,
-0.7154835, -1.480611, -2.636989, 0, 0, 0, 1, 1,
-0.7141969, 0.168677, -1.847348, 0, 0, 0, 1, 1,
-0.7105101, 0.8454242, 0.0736661, 0, 0, 0, 1, 1,
-0.709987, -0.5721528, -1.28393, 0, 0, 0, 1, 1,
-0.7078366, 1.364988, -1.235901, 0, 0, 0, 1, 1,
-0.7055941, -0.7148671, -2.715274, 1, 1, 1, 1, 1,
-0.6972513, -0.9535066, -2.864893, 1, 1, 1, 1, 1,
-0.6967235, -0.4980047, -1.347959, 1, 1, 1, 1, 1,
-0.6930225, -0.7120891, -3.522694, 1, 1, 1, 1, 1,
-0.6912346, 0.5335972, -0.7610778, 1, 1, 1, 1, 1,
-0.6894253, 1.117107, 0.2303297, 1, 1, 1, 1, 1,
-0.6877849, 0.4206654, -0.2470064, 1, 1, 1, 1, 1,
-0.6870617, 0.09615671, -3.097132, 1, 1, 1, 1, 1,
-0.6856747, -0.7337832, -1.632274, 1, 1, 1, 1, 1,
-0.6847871, 1.32447, -1.432508, 1, 1, 1, 1, 1,
-0.6805023, 0.8097152, -0.7243844, 1, 1, 1, 1, 1,
-0.679985, -0.1987331, -1.400548, 1, 1, 1, 1, 1,
-0.6784121, -1.859989, -2.876743, 1, 1, 1, 1, 1,
-0.6741657, 0.2740976, -2.940175, 1, 1, 1, 1, 1,
-0.6740583, 1.938572, -0.6848085, 1, 1, 1, 1, 1,
-0.6657482, -0.4997261, -3.071514, 0, 0, 1, 1, 1,
-0.6640111, -0.1139641, -2.025191, 1, 0, 0, 1, 1,
-0.6640073, -0.1400261, -2.925904, 1, 0, 0, 1, 1,
-0.6629691, 0.02777936, -0.2375892, 1, 0, 0, 1, 1,
-0.6583303, -0.9553856, -2.142592, 1, 0, 0, 1, 1,
-0.6574039, -1.071812, -1.545769, 1, 0, 0, 1, 1,
-0.6542851, 0.4275282, -0.955094, 0, 0, 0, 1, 1,
-0.6533329, -1.620795, -4.945647, 0, 0, 0, 1, 1,
-0.6528666, 0.2943271, 0.5205237, 0, 0, 0, 1, 1,
-0.6501998, -0.4698551, -2.5814, 0, 0, 0, 1, 1,
-0.650148, 0.6683572, 1.076428, 0, 0, 0, 1, 1,
-0.6490747, 0.302672, -0.9086285, 0, 0, 0, 1, 1,
-0.6472011, 0.8626492, -0.4962476, 0, 0, 0, 1, 1,
-0.6469305, -0.241322, -1.305772, 1, 1, 1, 1, 1,
-0.6459138, -0.3364038, -3.46759, 1, 1, 1, 1, 1,
-0.6434144, 1.340904, -0.4444788, 1, 1, 1, 1, 1,
-0.6429207, -0.4044021, -2.978031, 1, 1, 1, 1, 1,
-0.6383814, -0.280678, -3.053669, 1, 1, 1, 1, 1,
-0.6344971, 0.9569168, -1.955818, 1, 1, 1, 1, 1,
-0.6321348, 1.40809, -0.8337265, 1, 1, 1, 1, 1,
-0.6256791, -0.07228326, -1.014337, 1, 1, 1, 1, 1,
-0.6255619, -0.3813495, -3.344688, 1, 1, 1, 1, 1,
-0.6241451, 1.032983, -1.022881, 1, 1, 1, 1, 1,
-0.6223393, 0.226224, -2.487468, 1, 1, 1, 1, 1,
-0.6218036, 2.404029, 0.2328071, 1, 1, 1, 1, 1,
-0.612578, 2.551089, -1.811202, 1, 1, 1, 1, 1,
-0.6116648, -0.8394488, -0.08047771, 1, 1, 1, 1, 1,
-0.6057696, -1.019796, -2.229305, 1, 1, 1, 1, 1,
-0.603222, -1.349702, -3.025616, 0, 0, 1, 1, 1,
-0.5871705, -2.288508, -2.678679, 1, 0, 0, 1, 1,
-0.5860177, 1.776431, -2.101709, 1, 0, 0, 1, 1,
-0.582455, -0.1567424, -2.443291, 1, 0, 0, 1, 1,
-0.5821117, -2.090086, -3.282794, 1, 0, 0, 1, 1,
-0.5797703, -0.1246816, -0.5331195, 1, 0, 0, 1, 1,
-0.5700313, -0.2914716, -1.189574, 0, 0, 0, 1, 1,
-0.5680636, -0.6714675, -2.113195, 0, 0, 0, 1, 1,
-0.5666071, -0.2648923, -3.001781, 0, 0, 0, 1, 1,
-0.5552526, -0.7148986, -3.035662, 0, 0, 0, 1, 1,
-0.5509211, -2.655748, -2.925392, 0, 0, 0, 1, 1,
-0.5472789, 2.483825, 1.732769, 0, 0, 0, 1, 1,
-0.5436119, 0.4170192, -0.5372143, 0, 0, 0, 1, 1,
-0.5434619, -0.1734776, -0.5529921, 1, 1, 1, 1, 1,
-0.5388784, -1.210681, -2.966558, 1, 1, 1, 1, 1,
-0.5362338, 1.725668, -1.410352, 1, 1, 1, 1, 1,
-0.5345247, -0.413388, -1.493715, 1, 1, 1, 1, 1,
-0.5324696, -0.43917, -2.778167, 1, 1, 1, 1, 1,
-0.5321336, -1.383186, -3.480587, 1, 1, 1, 1, 1,
-0.5290955, 0.2751953, -1.329628, 1, 1, 1, 1, 1,
-0.5282117, -0.7008935, -3.031767, 1, 1, 1, 1, 1,
-0.5252845, -0.1000271, -2.266034, 1, 1, 1, 1, 1,
-0.5238068, 0.4260983, -0.3264998, 1, 1, 1, 1, 1,
-0.5210262, 0.8691778, -0.06063499, 1, 1, 1, 1, 1,
-0.5188452, -1.042742, -3.028578, 1, 1, 1, 1, 1,
-0.515139, 0.02025844, -1.522449, 1, 1, 1, 1, 1,
-0.5128202, -0.1403647, -2.387217, 1, 1, 1, 1, 1,
-0.5115952, 0.4427852, -0.9161818, 1, 1, 1, 1, 1,
-0.5104064, -0.8861492, -1.839476, 0, 0, 1, 1, 1,
-0.5102957, 1.117604, -2.006188, 1, 0, 0, 1, 1,
-0.5091079, 0.3591163, 0.9629856, 1, 0, 0, 1, 1,
-0.4964502, 0.0230719, -3.506371, 1, 0, 0, 1, 1,
-0.4940048, 0.3474613, -1.615208, 1, 0, 0, 1, 1,
-0.4914955, 1.162593, -1.047665, 1, 0, 0, 1, 1,
-0.4895876, 1.000444, -1.334322, 0, 0, 0, 1, 1,
-0.4875254, 1.464451, 0.4507051, 0, 0, 0, 1, 1,
-0.4826819, 0.4585125, -2.287146, 0, 0, 0, 1, 1,
-0.4817163, 0.4067655, -0.5459766, 0, 0, 0, 1, 1,
-0.4788327, 0.04063665, 0.3420806, 0, 0, 0, 1, 1,
-0.4665062, 1.067682, -0.3017162, 0, 0, 0, 1, 1,
-0.4665028, 1.103873, -0.1045946, 0, 0, 0, 1, 1,
-0.4647641, -0.1919465, -1.85511, 1, 1, 1, 1, 1,
-0.4638183, -1.630013, -1.742027, 1, 1, 1, 1, 1,
-0.4581159, -1.615034, -3.131356, 1, 1, 1, 1, 1,
-0.4552924, 0.9258872, 0.5188342, 1, 1, 1, 1, 1,
-0.4548152, -2.433547, -3.85738, 1, 1, 1, 1, 1,
-0.4501617, -0.1115653, -2.557029, 1, 1, 1, 1, 1,
-0.4483971, 0.2158336, -1.39941, 1, 1, 1, 1, 1,
-0.4459713, -1.290706, -2.538895, 1, 1, 1, 1, 1,
-0.4456747, -1.230962, -3.972204, 1, 1, 1, 1, 1,
-0.4441175, -0.488316, -2.525871, 1, 1, 1, 1, 1,
-0.4375505, 1.238987, -0.5074442, 1, 1, 1, 1, 1,
-0.4308081, 0.2783827, 0.6480913, 1, 1, 1, 1, 1,
-0.4303601, -1.826992, -2.906093, 1, 1, 1, 1, 1,
-0.4297587, 0.226008, -1.198466, 1, 1, 1, 1, 1,
-0.4290088, -0.7095167, -2.287904, 1, 1, 1, 1, 1,
-0.4230198, 0.9148809, 0.3461133, 0, 0, 1, 1, 1,
-0.422802, 0.6149682, -1.147084, 1, 0, 0, 1, 1,
-0.4217753, -0.009698004, -4.539665, 1, 0, 0, 1, 1,
-0.4213655, 1.41944, -1.158621, 1, 0, 0, 1, 1,
-0.4199023, -2.06335, -2.389347, 1, 0, 0, 1, 1,
-0.4194742, 2.18193, 0.2187425, 1, 0, 0, 1, 1,
-0.4163089, 1.311467, -1.211772, 0, 0, 0, 1, 1,
-0.4154154, 1.089943, 0.9322191, 0, 0, 0, 1, 1,
-0.412008, -0.6561827, -3.020446, 0, 0, 0, 1, 1,
-0.411964, -1.512259, -3.233353, 0, 0, 0, 1, 1,
-0.4091492, 0.4690651, -0.8814408, 0, 0, 0, 1, 1,
-0.4056618, -0.9336315, -3.27715, 0, 0, 0, 1, 1,
-0.402183, 1.038399, -2.269954, 0, 0, 0, 1, 1,
-0.4011862, -0.1181921, -2.610644, 1, 1, 1, 1, 1,
-0.3992883, 0.08836024, -0.9373099, 1, 1, 1, 1, 1,
-0.3946266, -0.5129319, -1.748569, 1, 1, 1, 1, 1,
-0.3919103, 1.396015, -2.018612, 1, 1, 1, 1, 1,
-0.3911581, -0.4729799, -1.990055, 1, 1, 1, 1, 1,
-0.387768, -0.8693644, -4.472905, 1, 1, 1, 1, 1,
-0.3837782, 0.2180714, -0.6100541, 1, 1, 1, 1, 1,
-0.38309, -2.435614, -3.563144, 1, 1, 1, 1, 1,
-0.3815791, 0.635432, -0.7857256, 1, 1, 1, 1, 1,
-0.3772475, -0.5171808, -2.304291, 1, 1, 1, 1, 1,
-0.3738948, -0.7643835, -1.351864, 1, 1, 1, 1, 1,
-0.3737194, 0.1681957, -1.402331, 1, 1, 1, 1, 1,
-0.3719646, 0.2943862, 1.893407, 1, 1, 1, 1, 1,
-0.3718537, -0.1783947, -2.333231, 1, 1, 1, 1, 1,
-0.3705521, -0.5489852, -3.731653, 1, 1, 1, 1, 1,
-0.3679692, 1.100759, -1.303781, 0, 0, 1, 1, 1,
-0.3678085, 0.5293179, -1.451549, 1, 0, 0, 1, 1,
-0.3664243, -1.492428, -3.612233, 1, 0, 0, 1, 1,
-0.3657202, 2.564521, -1.199275, 1, 0, 0, 1, 1,
-0.3624913, 0.3218282, -1.760201, 1, 0, 0, 1, 1,
-0.3604195, 0.902176, 0.03396937, 1, 0, 0, 1, 1,
-0.3569045, 0.2191547, -1.332481, 0, 0, 0, 1, 1,
-0.35594, 0.9130125, 0.2164852, 0, 0, 0, 1, 1,
-0.353292, 0.9681487, 1.029051, 0, 0, 0, 1, 1,
-0.3520658, 1.252745, -0.4782885, 0, 0, 0, 1, 1,
-0.3475571, 0.1271565, -2.944206, 0, 0, 0, 1, 1,
-0.3473012, 1.005304, 0.06826881, 0, 0, 0, 1, 1,
-0.3440562, -0.7961605, -3.413936, 0, 0, 0, 1, 1,
-0.3434469, -1.077357, -0.0393579, 1, 1, 1, 1, 1,
-0.343037, 0.5395432, -2.372141, 1, 1, 1, 1, 1,
-0.3409478, -1.647031, -3.050965, 1, 1, 1, 1, 1,
-0.3301958, 0.949833, 0.07836419, 1, 1, 1, 1, 1,
-0.3295445, 2.738271, -1.199468, 1, 1, 1, 1, 1,
-0.3267649, 0.3138671, -1.841183, 1, 1, 1, 1, 1,
-0.3264729, -0.5826858, -3.598984, 1, 1, 1, 1, 1,
-0.3243908, -0.9186256, -1.056524, 1, 1, 1, 1, 1,
-0.3233188, -0.3826081, -2.422164, 1, 1, 1, 1, 1,
-0.3205911, -1.356485, -2.9351, 1, 1, 1, 1, 1,
-0.319634, 0.5850685, 0.5356508, 1, 1, 1, 1, 1,
-0.3184784, -1.700411, -3.204235, 1, 1, 1, 1, 1,
-0.3173954, -1.068842, -4.640355, 1, 1, 1, 1, 1,
-0.3150006, 0.2672359, -1.723475, 1, 1, 1, 1, 1,
-0.3096175, 0.5226443, 1.233945, 1, 1, 1, 1, 1,
-0.2972535, 1.028397, 0.3538836, 0, 0, 1, 1, 1,
-0.2964554, 0.4904715, -2.064125, 1, 0, 0, 1, 1,
-0.2963518, 0.3777188, -0.1224906, 1, 0, 0, 1, 1,
-0.2932244, 0.8835553, 0.3669439, 1, 0, 0, 1, 1,
-0.2912711, 0.6701065, -1.510664, 1, 0, 0, 1, 1,
-0.2878297, 0.3592985, -1.604386, 1, 0, 0, 1, 1,
-0.2857445, 0.3686759, -1.680754, 0, 0, 0, 1, 1,
-0.2813994, -0.4669266, -3.507087, 0, 0, 0, 1, 1,
-0.2779212, -0.01153923, -3.943996, 0, 0, 0, 1, 1,
-0.2742203, 1.334022, -0.7003368, 0, 0, 0, 1, 1,
-0.2727843, 1.153314, 0.09969338, 0, 0, 0, 1, 1,
-0.2709835, 1.458392, -1.566446, 0, 0, 0, 1, 1,
-0.2658414, 0.652099, 0.2221253, 0, 0, 0, 1, 1,
-0.260511, -1.198752, -5.369779, 1, 1, 1, 1, 1,
-0.2602998, 0.9553053, -0.6039128, 1, 1, 1, 1, 1,
-0.2591237, -0.4412315, -2.43729, 1, 1, 1, 1, 1,
-0.2586531, 0.1355877, -0.6414607, 1, 1, 1, 1, 1,
-0.257154, -0.7329355, -3.60434, 1, 1, 1, 1, 1,
-0.2541736, -0.5010234, -3.460546, 1, 1, 1, 1, 1,
-0.2530855, -0.3792481, -0.6609556, 1, 1, 1, 1, 1,
-0.2485466, 0.8595237, -0.03884998, 1, 1, 1, 1, 1,
-0.2474331, 0.4768951, 0.4540447, 1, 1, 1, 1, 1,
-0.2467824, -1.263973, -2.205799, 1, 1, 1, 1, 1,
-0.2437407, -0.8757507, -2.864746, 1, 1, 1, 1, 1,
-0.2437353, 0.7009096, -1.993022, 1, 1, 1, 1, 1,
-0.2391438, 0.3069026, -0.05125555, 1, 1, 1, 1, 1,
-0.2376721, 0.2026369, 1.195467, 1, 1, 1, 1, 1,
-0.23767, 0.3052599, -1.71241, 1, 1, 1, 1, 1,
-0.2345843, 0.2092626, -2.371834, 0, 0, 1, 1, 1,
-0.2330526, -0.2804303, -1.688281, 1, 0, 0, 1, 1,
-0.2303426, 0.2315722, -0.7301785, 1, 0, 0, 1, 1,
-0.2296154, 1.413003, 0.9551547, 1, 0, 0, 1, 1,
-0.2286006, -0.3400107, -0.9883308, 1, 0, 0, 1, 1,
-0.2280004, -0.8710381, -3.984831, 1, 0, 0, 1, 1,
-0.2251421, 0.4014338, -0.4706592, 0, 0, 0, 1, 1,
-0.2067293, 0.2385556, 1.509117, 0, 0, 0, 1, 1,
-0.2047211, -0.4032593, -3.895474, 0, 0, 0, 1, 1,
-0.2026055, 0.05372343, -0.7810788, 0, 0, 0, 1, 1,
-0.197135, -1.389936, -4.11691, 0, 0, 0, 1, 1,
-0.1966599, 1.353113, 0.5191716, 0, 0, 0, 1, 1,
-0.1878319, 0.08922672, -0.8609879, 0, 0, 0, 1, 1,
-0.1847641, -0.6232007, -3.53143, 1, 1, 1, 1, 1,
-0.1820736, -2.903219, -3.544424, 1, 1, 1, 1, 1,
-0.176432, 0.9877144, 0.1410638, 1, 1, 1, 1, 1,
-0.1756754, 1.417479, 1.007169, 1, 1, 1, 1, 1,
-0.1648328, 1.339432, 0.5712916, 1, 1, 1, 1, 1,
-0.163882, 0.4111373, -0.4662189, 1, 1, 1, 1, 1,
-0.1607468, 0.1307611, -0.9609478, 1, 1, 1, 1, 1,
-0.1582245, -0.7093893, -3.397514, 1, 1, 1, 1, 1,
-0.1574895, 0.1737109, -0.8394485, 1, 1, 1, 1, 1,
-0.1558643, 0.2892333, -1.168632, 1, 1, 1, 1, 1,
-0.1528077, 1.623997, -2.564278, 1, 1, 1, 1, 1,
-0.1521116, -0.320236, -1.496558, 1, 1, 1, 1, 1,
-0.1512655, 0.01097303, -0.9878786, 1, 1, 1, 1, 1,
-0.1477679, 0.8503634, 0.1053271, 1, 1, 1, 1, 1,
-0.1474756, -3.466166, -3.751033, 1, 1, 1, 1, 1,
-0.1433551, 0.8195723, 0.02303144, 0, 0, 1, 1, 1,
-0.130557, 0.4836924, 0.9782967, 1, 0, 0, 1, 1,
-0.1291523, 1.676601, 1.391248, 1, 0, 0, 1, 1,
-0.1287054, 0.6873177, -0.9052465, 1, 0, 0, 1, 1,
-0.1240876, -0.7081265, -3.744054, 1, 0, 0, 1, 1,
-0.1227383, 0.6067329, 1.257589, 1, 0, 0, 1, 1,
-0.1227321, 0.6369045, -0.4141778, 0, 0, 0, 1, 1,
-0.1215383, -0.2845885, -3.022005, 0, 0, 0, 1, 1,
-0.1200932, 1.029488, 0.9527697, 0, 0, 0, 1, 1,
-0.1159732, -0.474174, -2.904965, 0, 0, 0, 1, 1,
-0.1144033, 1.295377, -0.4796423, 0, 0, 0, 1, 1,
-0.1125949, -0.690657, -3.006239, 0, 0, 0, 1, 1,
-0.1116463, -1.523993, -1.15797, 0, 0, 0, 1, 1,
-0.1105252, -0.09264174, -1.598633, 1, 1, 1, 1, 1,
-0.1037036, 1.686293, 1.117243, 1, 1, 1, 1, 1,
-0.1025996, 0.4872092, -0.793595, 1, 1, 1, 1, 1,
-0.1012286, -0.1353401, -2.146605, 1, 1, 1, 1, 1,
-0.09774037, -2.397698, -3.445672, 1, 1, 1, 1, 1,
-0.09708919, 0.4669501, -0.6176407, 1, 1, 1, 1, 1,
-0.09697384, -0.9158148, -1.535198, 1, 1, 1, 1, 1,
-0.09555788, -1.196625, -2.944649, 1, 1, 1, 1, 1,
-0.0948453, 0.7748086, -1.203668, 1, 1, 1, 1, 1,
-0.0928439, -1.279432, -3.126802, 1, 1, 1, 1, 1,
-0.08818968, 0.8630529, 0.1246886, 1, 1, 1, 1, 1,
-0.08168251, -0.4377044, -1.783156, 1, 1, 1, 1, 1,
-0.07915986, -0.2765603, -2.840982, 1, 1, 1, 1, 1,
-0.07791897, -0.5373018, -3.770199, 1, 1, 1, 1, 1,
-0.07420483, -0.2530904, -0.9292586, 1, 1, 1, 1, 1,
-0.07123487, -0.1104844, -2.702841, 0, 0, 1, 1, 1,
-0.06865087, 2.342525, 0.4312454, 1, 0, 0, 1, 1,
-0.06284865, 0.1429266, 1.016626, 1, 0, 0, 1, 1,
-0.0624916, 0.7895237, -0.07189533, 1, 0, 0, 1, 1,
-0.0618771, -1.638513, -2.765228, 1, 0, 0, 1, 1,
-0.06041302, 0.2289033, 0.548873, 1, 0, 0, 1, 1,
-0.05457425, -1.588293, -3.423731, 0, 0, 0, 1, 1,
-0.05427608, 1.050477, -0.4061372, 0, 0, 0, 1, 1,
-0.05100237, 0.2253197, 0.5793025, 0, 0, 0, 1, 1,
-0.05096241, 0.8732927, -0.5977209, 0, 0, 0, 1, 1,
-0.04610295, -0.1788305, -1.33838, 0, 0, 0, 1, 1,
-0.04081359, -0.1315575, -1.415775, 0, 0, 0, 1, 1,
-0.03877895, -0.4385803, -2.451991, 0, 0, 0, 1, 1,
-0.03673154, 1.222461, -0.5380396, 1, 1, 1, 1, 1,
-0.03583918, -0.8933692, -1.952955, 1, 1, 1, 1, 1,
-0.03330314, -0.6675982, -2.944345, 1, 1, 1, 1, 1,
-0.03271164, -0.7200823, -3.518448, 1, 1, 1, 1, 1,
-0.03192966, 0.2972121, -0.1993582, 1, 1, 1, 1, 1,
-0.03163559, 1.134993, 2.206153, 1, 1, 1, 1, 1,
-0.02291996, 1.112589, -1.204822, 1, 1, 1, 1, 1,
-0.02211602, 1.071351, 0.4312675, 1, 1, 1, 1, 1,
-0.02076727, -0.3407874, -3.526477, 1, 1, 1, 1, 1,
-0.02028704, -0.3240489, -3.974197, 1, 1, 1, 1, 1,
-0.01509727, -1.559903, -2.610908, 1, 1, 1, 1, 1,
-0.01395695, -3.640266, -2.730298, 1, 1, 1, 1, 1,
-0.01354012, 0.6755055, -0.9506691, 1, 1, 1, 1, 1,
-0.004446347, -1.696323, -3.483037, 1, 1, 1, 1, 1,
0.002406861, -0.9508411, 3.407725, 1, 1, 1, 1, 1,
0.005069659, 0.06150518, 1.131582, 0, 0, 1, 1, 1,
0.005768897, -0.08780385, 3.165066, 1, 0, 0, 1, 1,
0.0106032, 0.7956471, -0.1971889, 1, 0, 0, 1, 1,
0.01089224, -0.8152864, 3.821687, 1, 0, 0, 1, 1,
0.01395274, -0.8980058, 2.450445, 1, 0, 0, 1, 1,
0.01502134, 0.8519681, 0.5818366, 1, 0, 0, 1, 1,
0.01638837, 0.4901609, -0.6351191, 0, 0, 0, 1, 1,
0.01691853, 0.7825308, -1.065207, 0, 0, 0, 1, 1,
0.01734672, -0.5272372, 4.364648, 0, 0, 0, 1, 1,
0.02163013, -1.301375, 1.609982, 0, 0, 0, 1, 1,
0.0246735, 0.3871571, 0.7614, 0, 0, 0, 1, 1,
0.02552546, 1.455085, -0.08236626, 0, 0, 0, 1, 1,
0.02687874, -0.1165593, 2.447232, 0, 0, 0, 1, 1,
0.02997573, -0.08416863, 1.902155, 1, 1, 1, 1, 1,
0.03150049, 0.2062597, 0.9633033, 1, 1, 1, 1, 1,
0.03276758, 1.194952, 0.3037067, 1, 1, 1, 1, 1,
0.04313983, -0.6978812, 4.039412, 1, 1, 1, 1, 1,
0.04495935, 1.18811, -0.5825903, 1, 1, 1, 1, 1,
0.04501924, 1.138453, 0.3812611, 1, 1, 1, 1, 1,
0.04816394, 0.2761278, 1.176871, 1, 1, 1, 1, 1,
0.04883441, -0.6052063, 1.052487, 1, 1, 1, 1, 1,
0.05798014, -2.464926, 3.198373, 1, 1, 1, 1, 1,
0.060179, -0.3946432, 5.052845, 1, 1, 1, 1, 1,
0.06125738, -1.154761, 5.427643, 1, 1, 1, 1, 1,
0.06783862, 0.003772306, 0.08353173, 1, 1, 1, 1, 1,
0.07608632, 0.8179333, -0.2319084, 1, 1, 1, 1, 1,
0.07767213, -0.8694082, 2.696882, 1, 1, 1, 1, 1,
0.07875669, -0.3472658, 2.556059, 1, 1, 1, 1, 1,
0.0797383, -0.8946453, 2.04312, 0, 0, 1, 1, 1,
0.08228464, 0.04183299, 1.982852, 1, 0, 0, 1, 1,
0.08276599, -1.225515, 3.656529, 1, 0, 0, 1, 1,
0.08361699, 1.043607, 1.231829, 1, 0, 0, 1, 1,
0.08619136, 0.9484593, -0.2505646, 1, 0, 0, 1, 1,
0.08784464, -0.2227432, 2.050307, 1, 0, 0, 1, 1,
0.08894159, -1.035763, 2.645477, 0, 0, 0, 1, 1,
0.0972266, -0.05086543, 2.579507, 0, 0, 0, 1, 1,
0.1020248, -0.7067968, 1.930418, 0, 0, 0, 1, 1,
0.1023371, 1.60725, -1.225568, 0, 0, 0, 1, 1,
0.1035789, 0.5696167, -1.102682, 0, 0, 0, 1, 1,
0.1074921, -0.6597298, 2.543503, 0, 0, 0, 1, 1,
0.1091518, -0.3183788, 2.52932, 0, 0, 0, 1, 1,
0.1115241, -0.07381441, 1.436077, 1, 1, 1, 1, 1,
0.1179603, -1.557387, 4.00852, 1, 1, 1, 1, 1,
0.1199506, -0.9387415, 1.286276, 1, 1, 1, 1, 1,
0.1265348, -0.5239804, 2.789205, 1, 1, 1, 1, 1,
0.1270613, 0.2572206, 2.880432, 1, 1, 1, 1, 1,
0.1277068, 0.5892248, 0.1367669, 1, 1, 1, 1, 1,
0.1311056, 2.524187, -0.4127486, 1, 1, 1, 1, 1,
0.1318899, -0.08866194, 1.672469, 1, 1, 1, 1, 1,
0.1329804, -1.262142, 2.9635, 1, 1, 1, 1, 1,
0.1357658, -2.274799, 2.010556, 1, 1, 1, 1, 1,
0.1357716, 1.217928, -0.3509499, 1, 1, 1, 1, 1,
0.1361157, 0.889999, -1.335437, 1, 1, 1, 1, 1,
0.1390062, -0.9452678, 4.595442, 1, 1, 1, 1, 1,
0.1390679, 0.5890036, 0.1736663, 1, 1, 1, 1, 1,
0.1401794, 0.7158917, 0.5212641, 1, 1, 1, 1, 1,
0.1444569, 1.164472, 0.8684366, 0, 0, 1, 1, 1,
0.1445341, 0.5284556, -0.2737852, 1, 0, 0, 1, 1,
0.1474311, -0.3156917, 2.335544, 1, 0, 0, 1, 1,
0.1481848, -0.5703632, 3.866786, 1, 0, 0, 1, 1,
0.1485379, 0.8821237, 0.2759115, 1, 0, 0, 1, 1,
0.1504586, -1.002703, 2.354354, 1, 0, 0, 1, 1,
0.1510018, 0.9029714, 1.532326, 0, 0, 0, 1, 1,
0.1522531, 0.2083471, 0.7362789, 0, 0, 0, 1, 1,
0.1570212, 0.2459929, 0.3195029, 0, 0, 0, 1, 1,
0.1611644, 0.2441012, 1.048284, 0, 0, 0, 1, 1,
0.1644011, 0.09116976, 2.850749, 0, 0, 0, 1, 1,
0.1669378, 0.4504659, 1.544626, 0, 0, 0, 1, 1,
0.1690822, 0.4939209, 0.1228356, 0, 0, 0, 1, 1,
0.1727905, -1.531107, 3.998275, 1, 1, 1, 1, 1,
0.1735963, 0.237845, 1.612616, 1, 1, 1, 1, 1,
0.1772246, 1.823491, 1.864732, 1, 1, 1, 1, 1,
0.1785131, -0.6666696, 3.947616, 1, 1, 1, 1, 1,
0.1786451, -1.441559, 3.012975, 1, 1, 1, 1, 1,
0.1791126, 0.8577076, -1.319469, 1, 1, 1, 1, 1,
0.1801555, 0.674778, -0.3794558, 1, 1, 1, 1, 1,
0.181372, 2.076394, -0.06970906, 1, 1, 1, 1, 1,
0.1858067, 0.1403193, 1.36743, 1, 1, 1, 1, 1,
0.1858223, -2.310247, 2.219547, 1, 1, 1, 1, 1,
0.189699, -0.4356942, 2.157195, 1, 1, 1, 1, 1,
0.1909509, -0.7815236, 1.628679, 1, 1, 1, 1, 1,
0.1931924, -1.713997, 1.852515, 1, 1, 1, 1, 1,
0.2030275, -0.7535434, 2.132044, 1, 1, 1, 1, 1,
0.2043902, 0.591246, 0.7232509, 1, 1, 1, 1, 1,
0.2077269, 0.4134857, -0.6537924, 0, 0, 1, 1, 1,
0.2080566, -1.268729, 3.804792, 1, 0, 0, 1, 1,
0.2128425, 0.8239819, 1.730947, 1, 0, 0, 1, 1,
0.2141351, 0.8604128, 1.151015, 1, 0, 0, 1, 1,
0.2146521, 0.1379081, -0.9209514, 1, 0, 0, 1, 1,
0.2156982, -1.646031, 3.207027, 1, 0, 0, 1, 1,
0.2168155, 1.320705, 0.9271144, 0, 0, 0, 1, 1,
0.2211866, 0.3831046, 0.2857861, 0, 0, 0, 1, 1,
0.2219694, 0.8793843, 0.3507907, 0, 0, 0, 1, 1,
0.2221912, 0.5100074, 0.2433697, 0, 0, 0, 1, 1,
0.2225506, -0.01020209, 0.9436532, 0, 0, 0, 1, 1,
0.2236984, -0.1554032, 1.710396, 0, 0, 0, 1, 1,
0.2246057, -0.3003754, 0.8400106, 0, 0, 0, 1, 1,
0.2247215, -0.5454705, 2.147256, 1, 1, 1, 1, 1,
0.2276954, -0.8561575, 1.426523, 1, 1, 1, 1, 1,
0.2298878, -1.919529, 1.267585, 1, 1, 1, 1, 1,
0.2299307, 0.4675435, 0.4126253, 1, 1, 1, 1, 1,
0.2330845, -0.604762, 2.498415, 1, 1, 1, 1, 1,
0.2384261, 2.154825, 2.166402, 1, 1, 1, 1, 1,
0.2401244, 0.2629174, 0.118006, 1, 1, 1, 1, 1,
0.2424349, 1.575227, 0.6810874, 1, 1, 1, 1, 1,
0.2434908, 0.4786256, 0.3437708, 1, 1, 1, 1, 1,
0.2476809, -0.06875584, 2.094618, 1, 1, 1, 1, 1,
0.2480809, 1.116634, 0.5756243, 1, 1, 1, 1, 1,
0.2481852, 0.3500364, 0.3896971, 1, 1, 1, 1, 1,
0.2498849, -1.555755, 3.756651, 1, 1, 1, 1, 1,
0.2500677, -1.97386, 1.348776, 1, 1, 1, 1, 1,
0.2535973, 0.5481, -0.8518781, 1, 1, 1, 1, 1,
0.2588195, -1.545397, 1.813357, 0, 0, 1, 1, 1,
0.2672417, -0.4028105, 2.17696, 1, 0, 0, 1, 1,
0.2679029, 0.03807544, -0.4443589, 1, 0, 0, 1, 1,
0.2701827, -0.007873287, 3.291057, 1, 0, 0, 1, 1,
0.2704852, 2.153802, 0.02417596, 1, 0, 0, 1, 1,
0.2725537, -0.3091497, 3.267625, 1, 0, 0, 1, 1,
0.2768461, 2.450021, 1.333846, 0, 0, 0, 1, 1,
0.2771624, 0.6194328, 0.76663, 0, 0, 0, 1, 1,
0.278457, -0.3140624, 3.390835, 0, 0, 0, 1, 1,
0.2831801, 0.8426564, -1.687823, 0, 0, 0, 1, 1,
0.285726, -0.07341367, 1.794699, 0, 0, 0, 1, 1,
0.2893717, 1.33503, 0.5594889, 0, 0, 0, 1, 1,
0.2912911, -0.193793, 1.569485, 0, 0, 0, 1, 1,
0.2922507, 1.498964, 0.5045246, 1, 1, 1, 1, 1,
0.2926015, 0.585595, 0.2198016, 1, 1, 1, 1, 1,
0.2933094, -0.6981977, 3.247476, 1, 1, 1, 1, 1,
0.2989644, 0.2715358, 2.21068, 1, 1, 1, 1, 1,
0.2992899, 1.033656, 0.9829293, 1, 1, 1, 1, 1,
0.300342, 0.5239458, 0.02473114, 1, 1, 1, 1, 1,
0.3027801, 0.8041204, -1.039545, 1, 1, 1, 1, 1,
0.3034424, 0.6034076, 1.484925, 1, 1, 1, 1, 1,
0.307128, -0.4732499, 3.992528, 1, 1, 1, 1, 1,
0.3090257, -0.3806243, 2.242565, 1, 1, 1, 1, 1,
0.3100437, -2.306575, 3.590542, 1, 1, 1, 1, 1,
0.3113705, -0.7027151, 3.232542, 1, 1, 1, 1, 1,
0.3128259, 0.1565806, 2.446996, 1, 1, 1, 1, 1,
0.3146189, -0.03795232, 0.8014824, 1, 1, 1, 1, 1,
0.3152619, 2.487095, 1.690654, 1, 1, 1, 1, 1,
0.3203704, 0.5202453, 0.3128064, 0, 0, 1, 1, 1,
0.3219374, -0.1852096, 1.178941, 1, 0, 0, 1, 1,
0.3234963, -0.3310052, 1.435106, 1, 0, 0, 1, 1,
0.327969, -0.6400645, 2.770968, 1, 0, 0, 1, 1,
0.3307954, -0.3534536, 3.508947, 1, 0, 0, 1, 1,
0.3348927, -0.4168036, 2.926608, 1, 0, 0, 1, 1,
0.3351381, -1.331807, 3.705512, 0, 0, 0, 1, 1,
0.3423308, 0.2404534, 2.035204, 0, 0, 0, 1, 1,
0.3439559, 1.315127, 1.197979, 0, 0, 0, 1, 1,
0.347325, -0.7327686, 2.801087, 0, 0, 0, 1, 1,
0.3505747, -0.5104343, 4.73666, 0, 0, 0, 1, 1,
0.3515024, 0.1528012, 2.820768, 0, 0, 0, 1, 1,
0.3564746, -0.8657855, 2.313916, 0, 0, 0, 1, 1,
0.3643602, 0.6799214, -1.834067, 1, 1, 1, 1, 1,
0.3677929, -0.03222014, 1.907025, 1, 1, 1, 1, 1,
0.3897054, -0.3507054, 1.485674, 1, 1, 1, 1, 1,
0.3955931, 0.5485892, 1.0851, 1, 1, 1, 1, 1,
0.3991219, -0.763108, 2.724887, 1, 1, 1, 1, 1,
0.3995854, 0.1428243, 1.950184, 1, 1, 1, 1, 1,
0.3997782, 1.818269, 2.144075, 1, 1, 1, 1, 1,
0.4008192, 0.4513816, 0.4725062, 1, 1, 1, 1, 1,
0.4017103, -0.313, 3.555539, 1, 1, 1, 1, 1,
0.4035149, 0.1278391, 3.051147, 1, 1, 1, 1, 1,
0.4039783, -0.7358419, 1.891701, 1, 1, 1, 1, 1,
0.4074788, -0.1254737, 2.568054, 1, 1, 1, 1, 1,
0.4096198, -1.59648, 3.449179, 1, 1, 1, 1, 1,
0.4156271, 1.209456, 1.215782, 1, 1, 1, 1, 1,
0.4160874, 0.1882977, 2.456463, 1, 1, 1, 1, 1,
0.4166559, 0.401742, 0.7728968, 0, 0, 1, 1, 1,
0.4182731, -0.1772142, 1.829242, 1, 0, 0, 1, 1,
0.4218071, 0.370233, -0.2007852, 1, 0, 0, 1, 1,
0.4258318, -0.2890559, 2.757569, 1, 0, 0, 1, 1,
0.4273804, 0.01293642, 2.537819, 1, 0, 0, 1, 1,
0.4281652, 1.181483, -0.02764188, 1, 0, 0, 1, 1,
0.4293232, 0.948545, 1.042523, 0, 0, 0, 1, 1,
0.4294282, 0.6461142, -1.247769, 0, 0, 0, 1, 1,
0.4305763, 0.01481017, 1.382063, 0, 0, 0, 1, 1,
0.4311843, -1.064867, 1.984186, 0, 0, 0, 1, 1,
0.4357126, -1.650158, 1.349411, 0, 0, 0, 1, 1,
0.4403519, 0.9860936, 1.556745, 0, 0, 0, 1, 1,
0.4464877, 1.644343, 3.000665, 0, 0, 0, 1, 1,
0.4475329, 0.8808414, 1.673624, 1, 1, 1, 1, 1,
0.4489666, 0.7773367, 0.959839, 1, 1, 1, 1, 1,
0.4527534, 1.057124, 0.9317095, 1, 1, 1, 1, 1,
0.454406, -0.1752092, 0.636676, 1, 1, 1, 1, 1,
0.4601419, 0.3315032, -0.3023186, 1, 1, 1, 1, 1,
0.4636302, -1.395662, 1.572186, 1, 1, 1, 1, 1,
0.4644809, -1.106476, 3.280026, 1, 1, 1, 1, 1,
0.4645074, 0.3810424, 1.355456, 1, 1, 1, 1, 1,
0.4651514, -0.9720216, 3.275172, 1, 1, 1, 1, 1,
0.4653313, 0.5534584, 0.7506876, 1, 1, 1, 1, 1,
0.4792924, 0.1761485, -0.5895627, 1, 1, 1, 1, 1,
0.4817336, -0.0841205, 0.4871641, 1, 1, 1, 1, 1,
0.488025, 0.1961306, -0.0009627958, 1, 1, 1, 1, 1,
0.4892834, 0.2574394, 2.031684, 1, 1, 1, 1, 1,
0.4897972, -0.09573075, 2.07484, 1, 1, 1, 1, 1,
0.4966089, 0.7556049, 0.02784669, 0, 0, 1, 1, 1,
0.4980004, 0.5533103, 0.8282484, 1, 0, 0, 1, 1,
0.4993231, 0.5763061, -0.4935158, 1, 0, 0, 1, 1,
0.4999923, 0.1155627, 1.394429, 1, 0, 0, 1, 1,
0.5071153, -1.322569, 1.506277, 1, 0, 0, 1, 1,
0.5113856, -1.387587, 1.098353, 1, 0, 0, 1, 1,
0.5123346, 0.5700601, 3.503122, 0, 0, 0, 1, 1,
0.513779, 0.4719005, 0.8561673, 0, 0, 0, 1, 1,
0.5159027, -1.314075, 2.331141, 0, 0, 0, 1, 1,
0.5204747, -0.2989674, 1.967174, 0, 0, 0, 1, 1,
0.521094, -0.1633544, 1.192812, 0, 0, 0, 1, 1,
0.5218006, -0.46729, 3.307881, 0, 0, 0, 1, 1,
0.5224254, -0.1569416, 4.288864, 0, 0, 0, 1, 1,
0.5237085, 0.7455857, 0.3259521, 1, 1, 1, 1, 1,
0.5259863, 1.088784, -1.312516, 1, 1, 1, 1, 1,
0.5269984, -0.1157786, 2.234317, 1, 1, 1, 1, 1,
0.5359564, -1.15612, 2.58697, 1, 1, 1, 1, 1,
0.5382304, 0.5494606, 3.24136, 1, 1, 1, 1, 1,
0.5453975, 1.311117, 0.981467, 1, 1, 1, 1, 1,
0.5484549, 1.571035, 0.435038, 1, 1, 1, 1, 1,
0.5499488, 0.4843765, 0.9488905, 1, 1, 1, 1, 1,
0.5525973, -0.7056754, 2.105564, 1, 1, 1, 1, 1,
0.5536987, -1.184335, 3.132626, 1, 1, 1, 1, 1,
0.5537972, -0.4302884, 3.168226, 1, 1, 1, 1, 1,
0.5601519, -1.662421, 2.864609, 1, 1, 1, 1, 1,
0.5649151, 1.069852, -0.5836382, 1, 1, 1, 1, 1,
0.5661244, -0.7126485, 1.582563, 1, 1, 1, 1, 1,
0.5709391, 0.7933058, 1.200986, 1, 1, 1, 1, 1,
0.5719559, 1.979103, -0.6696236, 0, 0, 1, 1, 1,
0.5731689, -0.141805, 1.798945, 1, 0, 0, 1, 1,
0.5744175, -0.5509894, 1.403189, 1, 0, 0, 1, 1,
0.5780218, -0.2273088, 1.462792, 1, 0, 0, 1, 1,
0.5810007, -0.541683, 2.223386, 1, 0, 0, 1, 1,
0.5813665, 1.057488, -0.7257017, 1, 0, 0, 1, 1,
0.5849171, 1.362366, -0.2943306, 0, 0, 0, 1, 1,
0.5861346, -1.454098, 2.298859, 0, 0, 0, 1, 1,
0.5965065, -1.241014, 2.598578, 0, 0, 0, 1, 1,
0.6029033, -0.07462651, 1.09088, 0, 0, 0, 1, 1,
0.6046187, 0.203054, 1.150684, 0, 0, 0, 1, 1,
0.6050339, -0.8439586, 0.8470691, 0, 0, 0, 1, 1,
0.6076254, -0.9558505, 3.143838, 0, 0, 0, 1, 1,
0.6089215, 0.2450265, 1.274447, 1, 1, 1, 1, 1,
0.6097842, 0.7568612, -0.6127714, 1, 1, 1, 1, 1,
0.6103996, -1.08659, 3.19494, 1, 1, 1, 1, 1,
0.6112266, -0.3041797, 0.7795603, 1, 1, 1, 1, 1,
0.6193247, -0.9790744, 1.561221, 1, 1, 1, 1, 1,
0.6205729, -0.526851, 1.958267, 1, 1, 1, 1, 1,
0.6229225, -0.6593878, 3.013672, 1, 1, 1, 1, 1,
0.6337692, -0.1905223, 1.457339, 1, 1, 1, 1, 1,
0.6406344, 0.6398833, 1.133089, 1, 1, 1, 1, 1,
0.6450724, -0.4204355, -0.1010215, 1, 1, 1, 1, 1,
0.6460477, 0.1042344, 0.03105905, 1, 1, 1, 1, 1,
0.6562411, -0.7185861, 0.8765395, 1, 1, 1, 1, 1,
0.6570154, -0.8484153, 1.756377, 1, 1, 1, 1, 1,
0.6573449, 4.086235, -0.1017284, 1, 1, 1, 1, 1,
0.6614688, 2.051953, -1.405552, 1, 1, 1, 1, 1,
0.6638714, -0.3258766, 4.121154, 0, 0, 1, 1, 1,
0.6667921, -0.2559226, 0.4180916, 1, 0, 0, 1, 1,
0.6703527, -0.8423329, 3.849455, 1, 0, 0, 1, 1,
0.6757056, 0.3111149, 2.325891, 1, 0, 0, 1, 1,
0.6779055, -0.1009009, 0.2815197, 1, 0, 0, 1, 1,
0.6849185, 0.2356164, 0.0307925, 1, 0, 0, 1, 1,
0.6925673, 0.2358232, 1.793327, 0, 0, 0, 1, 1,
0.6998444, -0.9336131, 0.4129516, 0, 0, 0, 1, 1,
0.7045374, 1.018411, 1.645508, 0, 0, 0, 1, 1,
0.7057893, -1.241052, 2.678706, 0, 0, 0, 1, 1,
0.7080142, -1.062574, 1.628372, 0, 0, 0, 1, 1,
0.7108259, 0.232212, 2.744821, 0, 0, 0, 1, 1,
0.7140386, 0.9364001, -1.009035, 0, 0, 0, 1, 1,
0.7146471, -0.5229662, 3.102731, 1, 1, 1, 1, 1,
0.7158694, -0.2416757, 1.75936, 1, 1, 1, 1, 1,
0.7169133, 0.6101027, -0.1890307, 1, 1, 1, 1, 1,
0.7197673, -1.768214, 0.9754184, 1, 1, 1, 1, 1,
0.7240128, 0.9434862, -0.2096044, 1, 1, 1, 1, 1,
0.7258109, 0.0585572, 0.5676408, 1, 1, 1, 1, 1,
0.7324982, -0.9440066, 2.804008, 1, 1, 1, 1, 1,
0.7333516, 2.209686, 0.1828895, 1, 1, 1, 1, 1,
0.7357162, 1.429716, 0.5274143, 1, 1, 1, 1, 1,
0.7528817, -0.9579313, 2.36262, 1, 1, 1, 1, 1,
0.7548125, -0.9541547, 2.467077, 1, 1, 1, 1, 1,
0.7633926, 0.8808524, -0.2813964, 1, 1, 1, 1, 1,
0.7670172, 1.812402, 0.4471468, 1, 1, 1, 1, 1,
0.7675238, 1.035874, -1.067557, 1, 1, 1, 1, 1,
0.7701582, 0.3098852, 0.4393156, 1, 1, 1, 1, 1,
0.7715977, 1.768996, -0.4690963, 0, 0, 1, 1, 1,
0.7716489, -1.162918, 1.685515, 1, 0, 0, 1, 1,
0.7762052, -3.627985, 3.690865, 1, 0, 0, 1, 1,
0.7765818, 0.4319193, 0.5821308, 1, 0, 0, 1, 1,
0.7881476, -2.431482, 1.945321, 1, 0, 0, 1, 1,
0.7892981, 1.378167, -1.433772, 1, 0, 0, 1, 1,
0.7920032, 1.035482, 0.6517878, 0, 0, 0, 1, 1,
0.7953982, 0.9414656, 2.142868, 0, 0, 0, 1, 1,
0.7963829, 0.942978, 0.5727159, 0, 0, 0, 1, 1,
0.797996, 1.171613, 1.059875, 0, 0, 0, 1, 1,
0.804295, -0.6283802, 2.883093, 0, 0, 0, 1, 1,
0.8060541, 1.087792, 0.4851663, 0, 0, 0, 1, 1,
0.8230546, 0.7800139, 0.2657053, 0, 0, 0, 1, 1,
0.829089, -0.5032732, 0.3054341, 1, 1, 1, 1, 1,
0.8320909, -1.054753, 4.514039, 1, 1, 1, 1, 1,
0.8344344, -0.772332, 1.96335, 1, 1, 1, 1, 1,
0.8490235, -2.580259, 2.278883, 1, 1, 1, 1, 1,
0.8516995, 1.196519, 1.026755, 1, 1, 1, 1, 1,
0.8530052, -0.1522558, 1.30838, 1, 1, 1, 1, 1,
0.8567146, -0.6606056, 1.920421, 1, 1, 1, 1, 1,
0.8586171, 0.3420461, 0.08106568, 1, 1, 1, 1, 1,
0.8623646, 0.9490039, 1.337674, 1, 1, 1, 1, 1,
0.8669435, 1.487672, 2.06574, 1, 1, 1, 1, 1,
0.8721012, 1.955654, -0.4986554, 1, 1, 1, 1, 1,
0.8730503, 1.252791, 1.393757, 1, 1, 1, 1, 1,
0.8748078, 1.010491, 1.687942, 1, 1, 1, 1, 1,
0.875829, -1.846601, 2.594024, 1, 1, 1, 1, 1,
0.8760998, -1.351356, 1.549079, 1, 1, 1, 1, 1,
0.8786162, 2.374954, 0.8989919, 0, 0, 1, 1, 1,
0.881052, -0.4102735, 2.534883, 1, 0, 0, 1, 1,
0.8839964, 0.6973016, 2.792821, 1, 0, 0, 1, 1,
0.8861651, -0.01766819, 1.200212, 1, 0, 0, 1, 1,
0.8963526, 0.2589079, -0.5841579, 1, 0, 0, 1, 1,
0.9023632, 0.2150226, 2.070053, 1, 0, 0, 1, 1,
0.9056824, 1.884136, 1.154276, 0, 0, 0, 1, 1,
0.9067256, 0.1775887, 0.9060332, 0, 0, 0, 1, 1,
0.9074971, -0.5432763, 2.533098, 0, 0, 0, 1, 1,
0.9076755, 1.546684, 0.4270898, 0, 0, 0, 1, 1,
0.9100355, -0.4761443, 2.628368, 0, 0, 0, 1, 1,
0.9111094, -0.3396097, 2.845257, 0, 0, 0, 1, 1,
0.9167746, 0.4845975, -0.2266027, 0, 0, 0, 1, 1,
0.9244527, 0.6040562, 2.514094, 1, 1, 1, 1, 1,
0.9247907, -1.048558, 2.94093, 1, 1, 1, 1, 1,
0.9269488, -1.08927, 2.191616, 1, 1, 1, 1, 1,
0.9281294, -1.354936, 2.429132, 1, 1, 1, 1, 1,
0.9288305, 2.087256, 2.267853, 1, 1, 1, 1, 1,
0.9308574, 0.2070007, 0.40174, 1, 1, 1, 1, 1,
0.9328037, -2.440187, 1.69012, 1, 1, 1, 1, 1,
0.9389613, -0.5258434, 2.382318, 1, 1, 1, 1, 1,
0.9393978, 0.5048424, -0.1008992, 1, 1, 1, 1, 1,
0.9395285, 0.8381146, 0.5761272, 1, 1, 1, 1, 1,
0.9401133, 0.46845, -0.2685731, 1, 1, 1, 1, 1,
0.9412488, 0.969566, 0.4077161, 1, 1, 1, 1, 1,
0.9444616, -0.4170924, 3.263791, 1, 1, 1, 1, 1,
0.9568068, -0.9889182, 2.30377, 1, 1, 1, 1, 1,
0.9791889, -0.4194498, 2.95416, 1, 1, 1, 1, 1,
0.9792389, 0.05720529, 1.638832, 0, 0, 1, 1, 1,
0.9830325, 0.1873594, 2.642519, 1, 0, 0, 1, 1,
0.9863237, 0.6740478, -0.7971937, 1, 0, 0, 1, 1,
0.9887862, -0.02370144, 1.256542, 1, 0, 0, 1, 1,
0.9931901, 1.522493, -2.12672, 1, 0, 0, 1, 1,
0.9932753, -1.582962, 3.607774, 1, 0, 0, 1, 1,
1.003739, 1.201582, 2.537798, 0, 0, 0, 1, 1,
1.005361, 0.09795748, 1.832504, 0, 0, 0, 1, 1,
1.008233, -1.356956, 2.087513, 0, 0, 0, 1, 1,
1.020432, -0.4582238, 1.968276, 0, 0, 0, 1, 1,
1.029926, -1.057515, 1.238368, 0, 0, 0, 1, 1,
1.049577, -1.884496, 2.299917, 0, 0, 0, 1, 1,
1.049689, 0.3890868, 1.647928, 0, 0, 0, 1, 1,
1.050006, 1.091614, 0.6040522, 1, 1, 1, 1, 1,
1.051158, 1.078544, 1.181025, 1, 1, 1, 1, 1,
1.05547, 0.02875385, -0.1673517, 1, 1, 1, 1, 1,
1.080065, 0.9320292, 0.08506986, 1, 1, 1, 1, 1,
1.08014, -0.9657289, 2.358767, 1, 1, 1, 1, 1,
1.081491, 1.236341, 3.56542, 1, 1, 1, 1, 1,
1.083359, -0.4920456, 2.047039, 1, 1, 1, 1, 1,
1.091712, 0.4082385, 1.035548, 1, 1, 1, 1, 1,
1.092261, -0.6159692, 2.999832, 1, 1, 1, 1, 1,
1.103214, -0.6559106, 1.530434, 1, 1, 1, 1, 1,
1.117464, -0.3274684, 3.257822, 1, 1, 1, 1, 1,
1.123168, -0.2666062, 0.466358, 1, 1, 1, 1, 1,
1.125839, -1.645042, 2.17872, 1, 1, 1, 1, 1,
1.128107, 0.9764801, 1.54819, 1, 1, 1, 1, 1,
1.135498, -1.260415, 0.6990015, 1, 1, 1, 1, 1,
1.138272, -0.07268412, 0.07958384, 0, 0, 1, 1, 1,
1.13948, 0.05950911, 1.010713, 1, 0, 0, 1, 1,
1.149722, -0.7300217, 2.451766, 1, 0, 0, 1, 1,
1.152192, 0.7653754, 2.28125, 1, 0, 0, 1, 1,
1.154021, 0.7779586, 1.337878, 1, 0, 0, 1, 1,
1.154353, 0.3952943, 0.9972586, 1, 0, 0, 1, 1,
1.16968, 0.1689958, 2.585173, 0, 0, 0, 1, 1,
1.177352, -0.8956894, 3.040189, 0, 0, 0, 1, 1,
1.179131, 1.282963, 0.332153, 0, 0, 0, 1, 1,
1.183403, 0.4851076, 1.492573, 0, 0, 0, 1, 1,
1.189585, 0.3160254, 1.302855, 0, 0, 0, 1, 1,
1.190707, 0.516547, 1.422077, 0, 0, 0, 1, 1,
1.202403, 0.8396214, 2.762067, 0, 0, 0, 1, 1,
1.20488, 1.145473, 0.63776, 1, 1, 1, 1, 1,
1.206993, 0.2502495, 3.182191, 1, 1, 1, 1, 1,
1.207302, 1.215923, 1.291574, 1, 1, 1, 1, 1,
1.209451, -1.870752, 3.808307, 1, 1, 1, 1, 1,
1.211346, 0.1524732, 1.386731, 1, 1, 1, 1, 1,
1.213012, 1.016971, 2.223827, 1, 1, 1, 1, 1,
1.219746, -0.04468875, 0.7851436, 1, 1, 1, 1, 1,
1.221961, -0.2649414, 2.695227, 1, 1, 1, 1, 1,
1.239254, -0.1767171, 1.186675, 1, 1, 1, 1, 1,
1.242672, -1.450009, 2.283171, 1, 1, 1, 1, 1,
1.243361, 0.5180607, -0.8349918, 1, 1, 1, 1, 1,
1.249201, -1.569768, 2.171244, 1, 1, 1, 1, 1,
1.252894, 2.141618, -1.720572, 1, 1, 1, 1, 1,
1.253312, 0.01426704, 1.281561, 1, 1, 1, 1, 1,
1.25783, 1.273675, 1.221307, 1, 1, 1, 1, 1,
1.258556, 1.321009, 0.3241419, 0, 0, 1, 1, 1,
1.26052, 0.5711357, 0.8019193, 1, 0, 0, 1, 1,
1.26117, 0.2164995, -0.5258304, 1, 0, 0, 1, 1,
1.267954, 0.8030275, 0.2756105, 1, 0, 0, 1, 1,
1.271393, -0.8997976, 3.034549, 1, 0, 0, 1, 1,
1.283571, -0.5396046, 2.163266, 1, 0, 0, 1, 1,
1.287434, 0.03899875, 0.6850685, 0, 0, 0, 1, 1,
1.287734, 0.1693107, 3.566584, 0, 0, 0, 1, 1,
1.301211, 0.6975071, 2.042657, 0, 0, 0, 1, 1,
1.318759, -0.8934904, 2.17588, 0, 0, 0, 1, 1,
1.329122, 1.104127, -0.6834576, 0, 0, 0, 1, 1,
1.335758, 0.8269992, 1.86741, 0, 0, 0, 1, 1,
1.335997, 0.4933961, 1.262747, 0, 0, 0, 1, 1,
1.336814, 1.984643, 0.1508845, 1, 1, 1, 1, 1,
1.342746, 1.375041, 2.611923, 1, 1, 1, 1, 1,
1.344681, -0.2879754, 3.88935, 1, 1, 1, 1, 1,
1.345485, -1.075398, 1.907241, 1, 1, 1, 1, 1,
1.35172, -0.753919, 1.22417, 1, 1, 1, 1, 1,
1.355065, -1.930789, 2.658866, 1, 1, 1, 1, 1,
1.357215, -1.755122, 2.809987, 1, 1, 1, 1, 1,
1.365334, 0.01988481, 0.7528645, 1, 1, 1, 1, 1,
1.367874, 0.4602456, 0.5833059, 1, 1, 1, 1, 1,
1.371146, 0.4514665, 1.961918, 1, 1, 1, 1, 1,
1.37293, 3.154042, 0.5717487, 1, 1, 1, 1, 1,
1.373161, -1.343256, 2.111706, 1, 1, 1, 1, 1,
1.377042, 0.1433514, 0.9506388, 1, 1, 1, 1, 1,
1.392295, -0.3295194, 2.161086, 1, 1, 1, 1, 1,
1.395691, -0.2856485, 0.425436, 1, 1, 1, 1, 1,
1.411749, -0.3731567, 0.6299377, 0, 0, 1, 1, 1,
1.412609, 0.4180678, 1.79946, 1, 0, 0, 1, 1,
1.417567, -1.651441, 0.9554266, 1, 0, 0, 1, 1,
1.431333, -0.7950254, 1.988911, 1, 0, 0, 1, 1,
1.433303, 0.01744509, 0.7808552, 1, 0, 0, 1, 1,
1.434983, -1.418412, 2.258587, 1, 0, 0, 1, 1,
1.43578, -1.347028, 2.211195, 0, 0, 0, 1, 1,
1.44052, -0.0998266, 1.418079, 0, 0, 0, 1, 1,
1.452626, -0.9533454, 1.044754, 0, 0, 0, 1, 1,
1.456104, -0.3526392, 1.74939, 0, 0, 0, 1, 1,
1.505083, -0.1395328, 0.4813183, 0, 0, 0, 1, 1,
1.508727, -1.615307, 3.784292, 0, 0, 0, 1, 1,
1.516674, -0.858926, 2.933309, 0, 0, 0, 1, 1,
1.527377, -0.3074822, 2.098884, 1, 1, 1, 1, 1,
1.537019, -0.7923946, 1.824126, 1, 1, 1, 1, 1,
1.543876, -1.305966, 2.012552, 1, 1, 1, 1, 1,
1.557461, 1.826787, -0.9453465, 1, 1, 1, 1, 1,
1.561794, -0.5316088, 1.992259, 1, 1, 1, 1, 1,
1.566493, -0.1882448, 2.577251, 1, 1, 1, 1, 1,
1.587157, -0.3121996, 3.747396, 1, 1, 1, 1, 1,
1.588295, -0.2816064, 3.154856, 1, 1, 1, 1, 1,
1.588459, -0.1742508, 2.301059, 1, 1, 1, 1, 1,
1.59536, -0.7056441, 1.04829, 1, 1, 1, 1, 1,
1.599563, -0.5060224, 2.161168, 1, 1, 1, 1, 1,
1.621347, 0.1090591, 0.8781357, 1, 1, 1, 1, 1,
1.625554, -1.031533, 2.817989, 1, 1, 1, 1, 1,
1.62579, 0.08223969, -0.0003098354, 1, 1, 1, 1, 1,
1.647827, -0.8689007, 3.152524, 1, 1, 1, 1, 1,
1.666194, 0.3686722, 2.286391, 0, 0, 1, 1, 1,
1.676996, -0.5148025, 1.847136, 1, 0, 0, 1, 1,
1.692973, -1.029837, 2.842494, 1, 0, 0, 1, 1,
1.706897, -0.8275337, 2.532543, 1, 0, 0, 1, 1,
1.729336, 0.1454472, 1.81524, 1, 0, 0, 1, 1,
1.74641, -0.2722392, -0.253268, 1, 0, 0, 1, 1,
1.780998, -1.906654, 4.393395, 0, 0, 0, 1, 1,
1.794842, 0.8995727, 0.01375379, 0, 0, 0, 1, 1,
1.798232, -0.2400218, 0.6049073, 0, 0, 0, 1, 1,
1.81033, 2.183346, -0.1657314, 0, 0, 0, 1, 1,
1.83179, 0.4480832, 2.698299, 0, 0, 0, 1, 1,
1.832121, 1.881108, 2.046175, 0, 0, 0, 1, 1,
1.841674, -0.48927, 1.759163, 0, 0, 0, 1, 1,
1.846312, -1.359829, 3.952446, 1, 1, 1, 1, 1,
1.868294, -3.594312, 2.431612, 1, 1, 1, 1, 1,
1.871337, -1.932036, 2.117063, 1, 1, 1, 1, 1,
1.885525, -1.790881, 2.595954, 1, 1, 1, 1, 1,
1.8906, 0.1683707, 1.186442, 1, 1, 1, 1, 1,
1.890962, -1.934703, 3.026126, 1, 1, 1, 1, 1,
1.929429, 1.212982, -0.8456529, 1, 1, 1, 1, 1,
1.951545, -0.7391913, 1.266567, 1, 1, 1, 1, 1,
1.980427, -0.7150018, 1.704806, 1, 1, 1, 1, 1,
2.064164, -0.3076442, 1.113916, 1, 1, 1, 1, 1,
2.072042, 1.83839, 2.604233, 1, 1, 1, 1, 1,
2.079162, -0.6821206, 1.105819, 1, 1, 1, 1, 1,
2.082491, -0.6699929, 2.066891, 1, 1, 1, 1, 1,
2.142878, 0.2767023, 2.73583, 1, 1, 1, 1, 1,
2.212384, -0.8874168, 0.1357696, 1, 1, 1, 1, 1,
2.247433, -1.263079, 3.156969, 0, 0, 1, 1, 1,
2.255581, 0.8304696, 1.04969, 1, 0, 0, 1, 1,
2.304417, -0.06094657, 2.609923, 1, 0, 0, 1, 1,
2.322904, -0.7837222, 1.496849, 1, 0, 0, 1, 1,
2.367636, -1.338205, 3.683918, 1, 0, 0, 1, 1,
2.423821, 0.1932536, 1.469017, 1, 0, 0, 1, 1,
2.460786, -1.250017, 2.267501, 0, 0, 0, 1, 1,
2.467847, 0.8121688, 1.030936, 0, 0, 0, 1, 1,
2.480895, -0.9074658, 2.13535, 0, 0, 0, 1, 1,
2.486181, 0.06936159, 0.9684305, 0, 0, 0, 1, 1,
2.499011, 0.7349304, 2.802139, 0, 0, 0, 1, 1,
2.528699, -0.7590626, 1.387321, 0, 0, 0, 1, 1,
2.617438, -0.4532088, 0.7149508, 0, 0, 0, 1, 1,
2.635184, -1.4048, 2.206265, 1, 1, 1, 1, 1,
2.70049, -1.4986, 3.187534, 1, 1, 1, 1, 1,
2.865491, -2.466385, 3.021046, 1, 1, 1, 1, 1,
2.901066, -0.01743802, 2.822335, 1, 1, 1, 1, 1,
3.00233, 2.885325, 0.07253496, 1, 1, 1, 1, 1,
3.528872, -0.5715327, 3.725551, 1, 1, 1, 1, 1,
3.967038, -0.2437199, 1.895901, 1, 1, 1, 1, 1
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
var radius = 10.21949;
var distance = 35.89554;
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
mvMatrix.translate( -0.3068075, -0.2229846, -0.02893209 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.89554);
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
