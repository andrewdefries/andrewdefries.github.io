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
-3.455395, 0.9560477, -2.46083, 1, 0, 0, 1,
-3.36818, 0.6240203, -2.592601, 1, 0.007843138, 0, 1,
-3.078001, -1.713769, -1.308773, 1, 0.01176471, 0, 1,
-2.888311, -1.140671, -3.60805, 1, 0.01960784, 0, 1,
-2.774063, -0.6242035, -1.298939, 1, 0.02352941, 0, 1,
-2.693489, -1.568598, -2.388391, 1, 0.03137255, 0, 1,
-2.49675, -0.5003887, -0.6168262, 1, 0.03529412, 0, 1,
-2.494895, -1.309483, -0.2351099, 1, 0.04313726, 0, 1,
-2.458381, 0.2968493, -0.884843, 1, 0.04705882, 0, 1,
-2.416795, -0.410118, -0.4294141, 1, 0.05490196, 0, 1,
-2.289176, 1.428491, 0.6871532, 1, 0.05882353, 0, 1,
-2.282612, 1.006334, -0.633613, 1, 0.06666667, 0, 1,
-2.271508, 0.9306836, -1.253595, 1, 0.07058824, 0, 1,
-2.259284, -1.074581, -1.855124, 1, 0.07843138, 0, 1,
-2.232036, 0.6740048, -2.447472, 1, 0.08235294, 0, 1,
-2.197151, 0.7011144, -3.124259, 1, 0.09019608, 0, 1,
-2.187023, -0.09055886, -2.164834, 1, 0.09411765, 0, 1,
-2.18057, -0.1965327, -1.317443, 1, 0.1019608, 0, 1,
-2.101239, 0.7380971, -0.9108925, 1, 0.1098039, 0, 1,
-2.100417, -0.2728886, -2.525724, 1, 0.1137255, 0, 1,
-2.045549, -1.07529, -0.1866817, 1, 0.1215686, 0, 1,
-1.987343, -1.298916, -2.849082, 1, 0.1254902, 0, 1,
-1.98717, 1.356506, -1.753897, 1, 0.1333333, 0, 1,
-1.955011, -1.07867, -1.834263, 1, 0.1372549, 0, 1,
-1.951583, -0.7477684, -1.273069, 1, 0.145098, 0, 1,
-1.942035, 1.168569, -0.6765461, 1, 0.1490196, 0, 1,
-1.910221, -1.126714, -1.715225, 1, 0.1568628, 0, 1,
-1.907645, -0.1492458, 0.4151604, 1, 0.1607843, 0, 1,
-1.857641, -0.2701833, -0.04882727, 1, 0.1686275, 0, 1,
-1.853251, -0.4369768, -1.521052, 1, 0.172549, 0, 1,
-1.835818, 2.715245, -0.1867153, 1, 0.1803922, 0, 1,
-1.822548, -0.2649738, -0.8288989, 1, 0.1843137, 0, 1,
-1.820614, -0.675093, -3.082999, 1, 0.1921569, 0, 1,
-1.807327, 0.1698475, -2.295194, 1, 0.1960784, 0, 1,
-1.802321, 0.07226369, -0.6515515, 1, 0.2039216, 0, 1,
-1.758857, -1.601597, -4.338167, 1, 0.2117647, 0, 1,
-1.739454, -1.628404, -0.3876359, 1, 0.2156863, 0, 1,
-1.716183, 1.320256, -0.1664172, 1, 0.2235294, 0, 1,
-1.687922, 0.1979662, -1.14102, 1, 0.227451, 0, 1,
-1.681323, -0.5389305, -2.219638, 1, 0.2352941, 0, 1,
-1.67548, 0.8009617, -1.106082, 1, 0.2392157, 0, 1,
-1.662424, -0.3252196, -1.448683, 1, 0.2470588, 0, 1,
-1.661177, -0.07235029, -1.602483, 1, 0.2509804, 0, 1,
-1.659208, -1.619347, -0.7850605, 1, 0.2588235, 0, 1,
-1.653825, -0.855038, -2.68504, 1, 0.2627451, 0, 1,
-1.638865, 1.460273, -2.040403, 1, 0.2705882, 0, 1,
-1.638438, 0.5079137, 0.2946014, 1, 0.2745098, 0, 1,
-1.633347, -0.8422793, -3.572144, 1, 0.282353, 0, 1,
-1.629014, -0.8202617, -1.86946, 1, 0.2862745, 0, 1,
-1.617127, -1.402724, -1.985081, 1, 0.2941177, 0, 1,
-1.616879, -0.2589781, -0.3440124, 1, 0.3019608, 0, 1,
-1.606885, -1.131265, -3.511083, 1, 0.3058824, 0, 1,
-1.600738, -1.230693, -1.547213, 1, 0.3137255, 0, 1,
-1.591978, -0.5923908, -1.765585, 1, 0.3176471, 0, 1,
-1.576601, 0.6052645, -0.6234326, 1, 0.3254902, 0, 1,
-1.567981, -0.1732187, -1.876268, 1, 0.3294118, 0, 1,
-1.565226, 1.193849, -0.9422546, 1, 0.3372549, 0, 1,
-1.56419, -1.835226, -2.044607, 1, 0.3411765, 0, 1,
-1.561986, -0.1361613, -1.310938, 1, 0.3490196, 0, 1,
-1.561912, -2.217012, -3.232065, 1, 0.3529412, 0, 1,
-1.559676, -0.5455934, -1.619422, 1, 0.3607843, 0, 1,
-1.546725, -3.192893, -3.874012, 1, 0.3647059, 0, 1,
-1.544773, -0.06681021, -3.687922, 1, 0.372549, 0, 1,
-1.544743, 2.307934, -1.412458, 1, 0.3764706, 0, 1,
-1.531224, 0.6153644, -2.304141, 1, 0.3843137, 0, 1,
-1.53079, 1.125703, 0.22734, 1, 0.3882353, 0, 1,
-1.518822, -0.2279098, -1.460457, 1, 0.3960784, 0, 1,
-1.507857, -0.8505487, -3.183802, 1, 0.4039216, 0, 1,
-1.503524, -0.9771006, -4.207087, 1, 0.4078431, 0, 1,
-1.503386, 1.019484, -0.7303986, 1, 0.4156863, 0, 1,
-1.502973, 0.08259217, -3.066472, 1, 0.4196078, 0, 1,
-1.485802, 0.307343, -0.3788306, 1, 0.427451, 0, 1,
-1.48007, 0.4203529, -1.379445, 1, 0.4313726, 0, 1,
-1.469702, 0.5473703, -1.083639, 1, 0.4392157, 0, 1,
-1.464094, 1.217988, -0.9916256, 1, 0.4431373, 0, 1,
-1.453814, -0.1842225, -3.044339, 1, 0.4509804, 0, 1,
-1.445197, 0.7020535, -1.725523, 1, 0.454902, 0, 1,
-1.437415, -0.1277328, -1.112874, 1, 0.4627451, 0, 1,
-1.42676, 1.480492, 0.209934, 1, 0.4666667, 0, 1,
-1.404582, -0.3783641, -2.394816, 1, 0.4745098, 0, 1,
-1.370707, -0.1347335, -1.126679, 1, 0.4784314, 0, 1,
-1.3694, 1.274874, -2.065656, 1, 0.4862745, 0, 1,
-1.367312, -0.5146996, -3.031537, 1, 0.4901961, 0, 1,
-1.366766, 0.8068856, 0.5984556, 1, 0.4980392, 0, 1,
-1.36537, 0.4784552, -1.142611, 1, 0.5058824, 0, 1,
-1.346229, -0.978452, -1.632136, 1, 0.509804, 0, 1,
-1.338889, 0.6869693, -0.8521301, 1, 0.5176471, 0, 1,
-1.32793, -2.953255, -2.318038, 1, 0.5215687, 0, 1,
-1.325881, 1.005568, -2.638336, 1, 0.5294118, 0, 1,
-1.315125, -0.4692215, 0.03752974, 1, 0.5333334, 0, 1,
-1.313893, -0.4198692, -1.529909, 1, 0.5411765, 0, 1,
-1.312142, 1.296816, -1.485774, 1, 0.5450981, 0, 1,
-1.299583, 1.475445, -0.8470407, 1, 0.5529412, 0, 1,
-1.289302, -0.6848239, -2.007607, 1, 0.5568628, 0, 1,
-1.28271, 0.0165742, -1.234475, 1, 0.5647059, 0, 1,
-1.281095, -0.8802223, -2.622058, 1, 0.5686275, 0, 1,
-1.278722, -1.243714, -4.626931, 1, 0.5764706, 0, 1,
-1.2769, -1.340272, -3.584337, 1, 0.5803922, 0, 1,
-1.270434, 1.387157, -2.051232, 1, 0.5882353, 0, 1,
-1.270289, -1.09232, -3.51229, 1, 0.5921569, 0, 1,
-1.254822, 1.449669, -0.5754145, 1, 0.6, 0, 1,
-1.252899, -0.06759319, -0.7445437, 1, 0.6078432, 0, 1,
-1.247826, -1.176463, -1.417217, 1, 0.6117647, 0, 1,
-1.246903, -2.084477, -3.640237, 1, 0.6196079, 0, 1,
-1.246271, 0.4372592, 0.3565104, 1, 0.6235294, 0, 1,
-1.241445, -0.3839099, -1.025751, 1, 0.6313726, 0, 1,
-1.237201, 0.5769686, 0.08589288, 1, 0.6352941, 0, 1,
-1.230783, 0.5604916, -0.9276307, 1, 0.6431373, 0, 1,
-1.220297, -0.09911459, -1.480862, 1, 0.6470588, 0, 1,
-1.217219, -0.2713933, -1.934578, 1, 0.654902, 0, 1,
-1.217124, 1.136375, -1.139954, 1, 0.6588235, 0, 1,
-1.216981, -0.0375696, -2.283122, 1, 0.6666667, 0, 1,
-1.216795, 0.4094159, -0.9977801, 1, 0.6705883, 0, 1,
-1.214797, -1.554206, -1.459741, 1, 0.6784314, 0, 1,
-1.213331, 0.05287996, -1.612718, 1, 0.682353, 0, 1,
-1.183204, -0.49117, -1.395968, 1, 0.6901961, 0, 1,
-1.183077, 0.7637268, -0.2058476, 1, 0.6941177, 0, 1,
-1.177585, 0.5548972, -1.175441, 1, 0.7019608, 0, 1,
-1.163152, -1.242121, -3.493722, 1, 0.7098039, 0, 1,
-1.153373, -0.6600225, -2.615663, 1, 0.7137255, 0, 1,
-1.15081, -0.3471305, -2.073856, 1, 0.7215686, 0, 1,
-1.149192, -0.06040002, -4.170857, 1, 0.7254902, 0, 1,
-1.145419, -1.157548, -0.3024867, 1, 0.7333333, 0, 1,
-1.111488, 0.346862, -0.3460259, 1, 0.7372549, 0, 1,
-1.096663, -1.098979, -2.596337, 1, 0.7450981, 0, 1,
-1.092973, 0.5031886, -1.545567, 1, 0.7490196, 0, 1,
-1.091175, 0.5197568, -0.1792567, 1, 0.7568628, 0, 1,
-1.090312, 1.464213, -2.056845, 1, 0.7607843, 0, 1,
-1.089419, -0.3163482, -1.054454, 1, 0.7686275, 0, 1,
-1.086076, 0.3302416, -0.4368045, 1, 0.772549, 0, 1,
-1.085417, 2.056447, -1.386121, 1, 0.7803922, 0, 1,
-1.074954, -0.111825, -1.583797, 1, 0.7843137, 0, 1,
-1.07423, 1.007867, -1.582069, 1, 0.7921569, 0, 1,
-1.073286, -2.144843, -4.28397, 1, 0.7960784, 0, 1,
-1.071982, -1.672269, -2.678829, 1, 0.8039216, 0, 1,
-1.066219, 1.498633, -0.9077718, 1, 0.8117647, 0, 1,
-1.061447, 0.6253825, -1.87021, 1, 0.8156863, 0, 1,
-1.060391, -0.6627054, -3.348343, 1, 0.8235294, 0, 1,
-1.060154, 0.1854947, 0.6049339, 1, 0.827451, 0, 1,
-1.058519, 1.231171, 0.4214996, 1, 0.8352941, 0, 1,
-1.058322, 1.402367, -0.9077145, 1, 0.8392157, 0, 1,
-1.056911, -0.244266, -0.8799077, 1, 0.8470588, 0, 1,
-1.048305, 0.2366071, -1.75071, 1, 0.8509804, 0, 1,
-1.047786, -0.4608935, -2.440261, 1, 0.8588235, 0, 1,
-1.0394, 0.05251076, -2.132931, 1, 0.8627451, 0, 1,
-1.036095, 1.110062, 1.257267, 1, 0.8705882, 0, 1,
-1.03417, -2.723574, -2.248434, 1, 0.8745098, 0, 1,
-1.033379, -0.314582, -2.764894, 1, 0.8823529, 0, 1,
-1.032481, -0.3534818, -2.308683, 1, 0.8862745, 0, 1,
-1.031967, -0.2205878, -2.304434, 1, 0.8941177, 0, 1,
-1.026557, 0.5211603, -0.659486, 1, 0.8980392, 0, 1,
-1.024567, 2.326031, 0.906082, 1, 0.9058824, 0, 1,
-1.021529, -0.02468688, -1.720723, 1, 0.9137255, 0, 1,
-1.015258, -0.2250794, -0.9358946, 1, 0.9176471, 0, 1,
-1.013555, 1.278067, 0.0348326, 1, 0.9254902, 0, 1,
-1.011991, -1.002604, -3.911126, 1, 0.9294118, 0, 1,
-1.008926, -0.1845278, -1.181267, 1, 0.9372549, 0, 1,
-1.006551, 0.778761, -2.503959, 1, 0.9411765, 0, 1,
-1.004455, 0.4481556, 0.5280255, 1, 0.9490196, 0, 1,
-1.002998, -2.592898, -2.125889, 1, 0.9529412, 0, 1,
-0.9958729, -1.334192, -3.417924, 1, 0.9607843, 0, 1,
-0.9954389, 1.736101, -0.1356572, 1, 0.9647059, 0, 1,
-0.9885895, 1.289656, -1.750589, 1, 0.972549, 0, 1,
-0.9883556, -0.8384472, -3.22333, 1, 0.9764706, 0, 1,
-0.9843436, -0.7503611, -1.504856, 1, 0.9843137, 0, 1,
-0.974766, 0.1370891, -0.7549157, 1, 0.9882353, 0, 1,
-0.9740449, 0.03860273, -1.490401, 1, 0.9960784, 0, 1,
-0.967, -0.02872756, -2.710479, 0.9960784, 1, 0, 1,
-0.9649794, 0.02285685, -0.3141297, 0.9921569, 1, 0, 1,
-0.9631575, 0.3677076, -2.705383, 0.9843137, 1, 0, 1,
-0.9556016, -0.5008259, -3.648944, 0.9803922, 1, 0, 1,
-0.9538396, -0.04250376, -1.769796, 0.972549, 1, 0, 1,
-0.9529024, 0.1330813, -2.072376, 0.9686275, 1, 0, 1,
-0.9484385, -0.7903349, -4.005429, 0.9607843, 1, 0, 1,
-0.9475664, 0.8165841, -0.01308701, 0.9568627, 1, 0, 1,
-0.9465017, -0.8586496, -3.177055, 0.9490196, 1, 0, 1,
-0.9454916, 0.4019669, -3.935426, 0.945098, 1, 0, 1,
-0.9452714, -0.08470064, -1.408279, 0.9372549, 1, 0, 1,
-0.9432389, 0.5272672, -1.052235, 0.9333333, 1, 0, 1,
-0.9394753, -1.1284, -3.410859, 0.9254902, 1, 0, 1,
-0.9231619, -0.3717829, -1.651997, 0.9215686, 1, 0, 1,
-0.9227315, 0.3161263, -0.8037655, 0.9137255, 1, 0, 1,
-0.9196579, -0.1945237, -1.191931, 0.9098039, 1, 0, 1,
-0.9147713, 0.5314586, -2.430219, 0.9019608, 1, 0, 1,
-0.9121121, -0.2530256, -0.4631001, 0.8941177, 1, 0, 1,
-0.9049345, -1.096172, -0.7151129, 0.8901961, 1, 0, 1,
-0.8952804, 1.465818, 0.3229007, 0.8823529, 1, 0, 1,
-0.8921303, -0.5460423, -1.959435, 0.8784314, 1, 0, 1,
-0.8877441, -0.9985998, -2.220831, 0.8705882, 1, 0, 1,
-0.8842762, 0.4786455, -0.5668134, 0.8666667, 1, 0, 1,
-0.8747817, -1.563794, -2.981777, 0.8588235, 1, 0, 1,
-0.8732693, 1.085374, -1.716792, 0.854902, 1, 0, 1,
-0.8694191, 0.2649932, -0.5556778, 0.8470588, 1, 0, 1,
-0.8684359, -0.2526781, -3.473159, 0.8431373, 1, 0, 1,
-0.8665065, 1.473947, 0.07101794, 0.8352941, 1, 0, 1,
-0.8626987, -0.1017945, -1.549698, 0.8313726, 1, 0, 1,
-0.8617132, 0.7194709, -0.2012761, 0.8235294, 1, 0, 1,
-0.8609635, 0.7132512, -0.7640131, 0.8196079, 1, 0, 1,
-0.8600678, -0.5553758, -0.9513932, 0.8117647, 1, 0, 1,
-0.8499483, 2.178927, 0.952459, 0.8078431, 1, 0, 1,
-0.849332, 1.847526, -0.4076461, 0.8, 1, 0, 1,
-0.8487555, 0.8090464, 0.3669861, 0.7921569, 1, 0, 1,
-0.8447232, -1.200482, -3.722242, 0.7882353, 1, 0, 1,
-0.8432818, -0.138047, -1.235652, 0.7803922, 1, 0, 1,
-0.8428282, -0.03994074, -0.2007647, 0.7764706, 1, 0, 1,
-0.8395499, -0.7460442, -1.197514, 0.7686275, 1, 0, 1,
-0.8240495, -0.1914184, -1.13909, 0.7647059, 1, 0, 1,
-0.8211007, -0.954538, -0.8047116, 0.7568628, 1, 0, 1,
-0.8163988, -0.2242032, -2.40648, 0.7529412, 1, 0, 1,
-0.8155498, 0.9251588, 0.1891642, 0.7450981, 1, 0, 1,
-0.8102398, 1.52123, -1.953109, 0.7411765, 1, 0, 1,
-0.8054791, -0.6965638, -2.220972, 0.7333333, 1, 0, 1,
-0.8051494, 0.9985402, -1.606746, 0.7294118, 1, 0, 1,
-0.8014988, -0.6547145, -2.297444, 0.7215686, 1, 0, 1,
-0.7959569, 0.0777348, -2.236803, 0.7176471, 1, 0, 1,
-0.7912751, 1.285133, -1.539716, 0.7098039, 1, 0, 1,
-0.7906174, 0.5746583, 0.7500634, 0.7058824, 1, 0, 1,
-0.7879419, 0.4169997, -1.947886, 0.6980392, 1, 0, 1,
-0.7864386, 0.4698874, -0.1232346, 0.6901961, 1, 0, 1,
-0.7841283, 0.5641246, -0.5126634, 0.6862745, 1, 0, 1,
-0.7783874, 0.9193617, -0.4116488, 0.6784314, 1, 0, 1,
-0.7776333, 1.64221, 0.1436042, 0.6745098, 1, 0, 1,
-0.7757363, -0.3543856, 0.3913813, 0.6666667, 1, 0, 1,
-0.7722016, 0.7191347, -1.311093, 0.6627451, 1, 0, 1,
-0.7582842, 1.138142, -1.056726, 0.654902, 1, 0, 1,
-0.7540754, -0.07353243, -0.8524762, 0.6509804, 1, 0, 1,
-0.7480286, 0.9373038, -1.315186, 0.6431373, 1, 0, 1,
-0.7472971, 0.1258018, -3.349921, 0.6392157, 1, 0, 1,
-0.7457024, -0.1692936, -0.8333449, 0.6313726, 1, 0, 1,
-0.7453353, -0.1272299, -2.352011, 0.627451, 1, 0, 1,
-0.7438315, 1.262345, 0.6598755, 0.6196079, 1, 0, 1,
-0.7420262, -0.2459485, -2.201849, 0.6156863, 1, 0, 1,
-0.7414197, 0.3417668, -0.9268096, 0.6078432, 1, 0, 1,
-0.7401623, 0.6411993, -0.8673197, 0.6039216, 1, 0, 1,
-0.7374157, 0.666134, -1.090674, 0.5960785, 1, 0, 1,
-0.7330198, -1.424306, -1.015365, 0.5882353, 1, 0, 1,
-0.7274656, 2.537628, 0.8256293, 0.5843138, 1, 0, 1,
-0.7173454, 0.1375411, -1.075695, 0.5764706, 1, 0, 1,
-0.7097931, 1.425985, -1.602583, 0.572549, 1, 0, 1,
-0.7028338, -0.8058984, -1.878429, 0.5647059, 1, 0, 1,
-0.698901, 0.9368002, -1.279433, 0.5607843, 1, 0, 1,
-0.698284, 1.033976, 0.2267844, 0.5529412, 1, 0, 1,
-0.6863526, -0.3131953, -0.9469675, 0.5490196, 1, 0, 1,
-0.6852772, 0.57664, -0.6351523, 0.5411765, 1, 0, 1,
-0.6841554, 0.6574882, -0.6974787, 0.5372549, 1, 0, 1,
-0.6837197, 0.9817684, -0.3908628, 0.5294118, 1, 0, 1,
-0.6825802, -1.265839, -3.706747, 0.5254902, 1, 0, 1,
-0.677143, 0.403243, -1.489604, 0.5176471, 1, 0, 1,
-0.6757011, -1.45972, -3.474895, 0.5137255, 1, 0, 1,
-0.6738267, 1.588989, 0.1415547, 0.5058824, 1, 0, 1,
-0.6738002, 0.9595731, -1.344967, 0.5019608, 1, 0, 1,
-0.6674661, -0.36815, -3.619287, 0.4941176, 1, 0, 1,
-0.6673043, 0.7115302, 0.1218485, 0.4862745, 1, 0, 1,
-0.6655347, -0.8264385, -0.5641513, 0.4823529, 1, 0, 1,
-0.6605105, -0.9606063, -2.740909, 0.4745098, 1, 0, 1,
-0.6596752, -0.0633477, -1.21048, 0.4705882, 1, 0, 1,
-0.6583369, 0.4126471, -2.424411, 0.4627451, 1, 0, 1,
-0.6552979, 1.808475, -0.4998203, 0.4588235, 1, 0, 1,
-0.6496323, -0.3483844, -2.407836, 0.4509804, 1, 0, 1,
-0.6472282, 0.1117959, -2.961692, 0.4470588, 1, 0, 1,
-0.6448527, 1.434834, -1.338385, 0.4392157, 1, 0, 1,
-0.6448016, -0.4092848, -3.775259, 0.4352941, 1, 0, 1,
-0.6443902, 1.504859, 0.9288618, 0.427451, 1, 0, 1,
-0.6392353, 2.13302, -0.3295937, 0.4235294, 1, 0, 1,
-0.629266, 0.06940249, -1.274838, 0.4156863, 1, 0, 1,
-0.6231495, 1.802893, 0.14579, 0.4117647, 1, 0, 1,
-0.6201469, 0.4683747, -1.617596, 0.4039216, 1, 0, 1,
-0.614849, -0.2545574, -2.48539, 0.3960784, 1, 0, 1,
-0.6086236, 0.302346, -0.5617976, 0.3921569, 1, 0, 1,
-0.6078528, 0.1673965, -0.511444, 0.3843137, 1, 0, 1,
-0.60616, 1.715025, -0.3532055, 0.3803922, 1, 0, 1,
-0.5950948, -0.4256001, -2.023533, 0.372549, 1, 0, 1,
-0.5935315, -0.2889999, -0.4605329, 0.3686275, 1, 0, 1,
-0.5921307, -0.03636934, -0.7488071, 0.3607843, 1, 0, 1,
-0.589076, 2.021898, 1.617478, 0.3568628, 1, 0, 1,
-0.5859416, -0.2199394, -1.377052, 0.3490196, 1, 0, 1,
-0.5856902, -0.9961359, -4.006797, 0.345098, 1, 0, 1,
-0.5843924, 0.9582241, -0.6202092, 0.3372549, 1, 0, 1,
-0.5837097, -1.379509, -0.9062353, 0.3333333, 1, 0, 1,
-0.5807963, -0.5863327, -0.8505418, 0.3254902, 1, 0, 1,
-0.5801745, 0.5727177, -1.10642, 0.3215686, 1, 0, 1,
-0.5776322, 0.3979837, -1.716402, 0.3137255, 1, 0, 1,
-0.5770214, 0.1472956, -2.276865, 0.3098039, 1, 0, 1,
-0.5761892, 0.4072892, -3.053806, 0.3019608, 1, 0, 1,
-0.5744563, 1.262929, -0.5755829, 0.2941177, 1, 0, 1,
-0.5712431, -1.857413, -3.970491, 0.2901961, 1, 0, 1,
-0.5642555, -1.87398, -0.6328182, 0.282353, 1, 0, 1,
-0.5574392, 0.8566483, -1.829513, 0.2784314, 1, 0, 1,
-0.5558047, 0.3619944, -1.351511, 0.2705882, 1, 0, 1,
-0.5470071, -0.9510978, -2.980555, 0.2666667, 1, 0, 1,
-0.5454382, -1.181292, -2.839868, 0.2588235, 1, 0, 1,
-0.542803, -0.9388256, -3.033771, 0.254902, 1, 0, 1,
-0.5378703, -1.156213, -3.070142, 0.2470588, 1, 0, 1,
-0.5364799, -2.842339, -1.362599, 0.2431373, 1, 0, 1,
-0.5361454, -1.840529, -0.664978, 0.2352941, 1, 0, 1,
-0.5304871, -0.5027034, -3.090601, 0.2313726, 1, 0, 1,
-0.529964, 0.585867, -1.406693, 0.2235294, 1, 0, 1,
-0.5275601, 0.435526, -0.8798073, 0.2196078, 1, 0, 1,
-0.5265169, -0.7577299, -1.688357, 0.2117647, 1, 0, 1,
-0.5175372, 0.468896, -3.382958, 0.2078431, 1, 0, 1,
-0.5162978, -1.632489, -1.672898, 0.2, 1, 0, 1,
-0.5111601, -0.03327668, -0.4260164, 0.1921569, 1, 0, 1,
-0.5107848, -0.512577, -3.46862, 0.1882353, 1, 0, 1,
-0.5062266, -1.515569, -4.254772, 0.1803922, 1, 0, 1,
-0.5022984, 1.048105, -0.3799999, 0.1764706, 1, 0, 1,
-0.4944799, -0.7372715, -3.552531, 0.1686275, 1, 0, 1,
-0.4904922, 0.5872435, -0.2012735, 0.1647059, 1, 0, 1,
-0.488391, -0.817291, -1.551663, 0.1568628, 1, 0, 1,
-0.4868478, 0.2439331, 0.05842913, 0.1529412, 1, 0, 1,
-0.485912, 0.04556724, -3.59043, 0.145098, 1, 0, 1,
-0.4852817, 0.3486784, -0.737607, 0.1411765, 1, 0, 1,
-0.4829407, 0.3593111, -0.9682291, 0.1333333, 1, 0, 1,
-0.4826616, 1.382904, -1.301671, 0.1294118, 1, 0, 1,
-0.4765068, -1.029792, -2.747294, 0.1215686, 1, 0, 1,
-0.4709409, -1.245821, -3.604353, 0.1176471, 1, 0, 1,
-0.4704222, 0.5236677, 0.3686022, 0.1098039, 1, 0, 1,
-0.4613065, 1.130889, -2.143216, 0.1058824, 1, 0, 1,
-0.4603813, 1.416698, -0.4673559, 0.09803922, 1, 0, 1,
-0.4587043, -1.367144, -3.889955, 0.09019608, 1, 0, 1,
-0.4586687, -0.3965008, -0.7717789, 0.08627451, 1, 0, 1,
-0.4580949, -0.9126864, -2.162564, 0.07843138, 1, 0, 1,
-0.4576892, 1.436815, 0.3450357, 0.07450981, 1, 0, 1,
-0.4555261, 0.187412, 1.219898, 0.06666667, 1, 0, 1,
-0.4526005, -1.412351, -2.731624, 0.0627451, 1, 0, 1,
-0.4497652, -0.7283362, -3.931963, 0.05490196, 1, 0, 1,
-0.4329067, 0.81432, -0.4153054, 0.05098039, 1, 0, 1,
-0.4312025, 1.255995, 0.1421518, 0.04313726, 1, 0, 1,
-0.4305602, 0.319829, -0.6517659, 0.03921569, 1, 0, 1,
-0.4268957, -0.3094951, -1.214824, 0.03137255, 1, 0, 1,
-0.4265533, 1.564532, -2.086288, 0.02745098, 1, 0, 1,
-0.4206085, -0.5939851, -3.364413, 0.01960784, 1, 0, 1,
-0.4200771, 0.2241487, -2.817712, 0.01568628, 1, 0, 1,
-0.4199612, -0.2986614, -2.667677, 0.007843138, 1, 0, 1,
-0.4196405, -0.5814418, -3.413703, 0.003921569, 1, 0, 1,
-0.4175166, 0.8599414, 0.5626125, 0, 1, 0.003921569, 1,
-0.4160026, 0.6188415, -0.6857069, 0, 1, 0.01176471, 1,
-0.4136882, 0.2678597, -0.02381539, 0, 1, 0.01568628, 1,
-0.4101277, 1.065593, 1.17369, 0, 1, 0.02352941, 1,
-0.4072693, -0.08037728, -1.648879, 0, 1, 0.02745098, 1,
-0.4050104, -1.152696, -2.463946, 0, 1, 0.03529412, 1,
-0.4048821, 0.3005573, -0.9339556, 0, 1, 0.03921569, 1,
-0.4048518, 0.15252, -1.348111, 0, 1, 0.04705882, 1,
-0.3963535, 0.2559207, 2.108851, 0, 1, 0.05098039, 1,
-0.3939283, 0.9264473, 0.275286, 0, 1, 0.05882353, 1,
-0.3913861, 1.760053, -0.5624318, 0, 1, 0.0627451, 1,
-0.3891996, 0.3548354, -1.200701, 0, 1, 0.07058824, 1,
-0.3882374, 0.2904485, 2.337666, 0, 1, 0.07450981, 1,
-0.386208, -0.8978651, -2.883583, 0, 1, 0.08235294, 1,
-0.3826887, 0.04272145, -2.249783, 0, 1, 0.08627451, 1,
-0.3807105, 1.085841, 0.09418116, 0, 1, 0.09411765, 1,
-0.372327, 1.524852, 1.758661, 0, 1, 0.1019608, 1,
-0.3722785, -1.784324, -2.818102, 0, 1, 0.1058824, 1,
-0.3706738, 0.3748769, 0.2786718, 0, 1, 0.1137255, 1,
-0.369325, -1.401311, -2.830591, 0, 1, 0.1176471, 1,
-0.3681444, -0.204201, -2.241773, 0, 1, 0.1254902, 1,
-0.3656102, 0.6516407, -1.246162, 0, 1, 0.1294118, 1,
-0.3599919, -0.3793898, -2.166523, 0, 1, 0.1372549, 1,
-0.3581358, -1.432914, -3.313671, 0, 1, 0.1411765, 1,
-0.3551376, -0.9208337, -2.450169, 0, 1, 0.1490196, 1,
-0.354247, -0.6782929, -3.522838, 0, 1, 0.1529412, 1,
-0.353158, 0.8231928, 0.5131825, 0, 1, 0.1607843, 1,
-0.3461897, -0.6686588, -3.365042, 0, 1, 0.1647059, 1,
-0.3458605, -0.7394103, -1.275041, 0, 1, 0.172549, 1,
-0.3430503, -1.174311, -4.655443, 0, 1, 0.1764706, 1,
-0.3427996, 0.6649783, -2.556705, 0, 1, 0.1843137, 1,
-0.342123, 2.671495, -0.3960128, 0, 1, 0.1882353, 1,
-0.3375761, -0.2189569, -3.31301, 0, 1, 0.1960784, 1,
-0.3340848, 2.101612, 1.034148, 0, 1, 0.2039216, 1,
-0.3283634, -1.80395, -2.916086, 0, 1, 0.2078431, 1,
-0.3260784, 0.2151299, -0.9341866, 0, 1, 0.2156863, 1,
-0.3235838, -0.4684933, -2.505981, 0, 1, 0.2196078, 1,
-0.3211091, -0.374644, -1.34309, 0, 1, 0.227451, 1,
-0.3048989, 1.324916, -0.49742, 0, 1, 0.2313726, 1,
-0.2935253, 0.3247946, -2.170004, 0, 1, 0.2392157, 1,
-0.2929697, -1.136716, -2.742813, 0, 1, 0.2431373, 1,
-0.2861469, -1.885136, -1.580976, 0, 1, 0.2509804, 1,
-0.2828305, -0.006933056, -1.054109, 0, 1, 0.254902, 1,
-0.2825138, -0.17236, -1.811447, 0, 1, 0.2627451, 1,
-0.2808217, 0.7896752, -1.617419, 0, 1, 0.2666667, 1,
-0.2754734, -0.1649344, -1.098989, 0, 1, 0.2745098, 1,
-0.2725795, -0.8949953, -5.541121, 0, 1, 0.2784314, 1,
-0.2724126, -0.05388587, -1.069455, 0, 1, 0.2862745, 1,
-0.2693237, -0.5131694, -3.052809, 0, 1, 0.2901961, 1,
-0.2673527, 1.309977, 0.5625566, 0, 1, 0.2980392, 1,
-0.2666126, -0.43896, -2.734738, 0, 1, 0.3058824, 1,
-0.2632546, 0.2669835, -2.546543, 0, 1, 0.3098039, 1,
-0.2632454, 0.3803137, 1.156322, 0, 1, 0.3176471, 1,
-0.2608667, -0.3711759, -3.121508, 0, 1, 0.3215686, 1,
-0.2580531, -0.1024932, -2.499096, 0, 1, 0.3294118, 1,
-0.256783, 1.067999, 1.000596, 0, 1, 0.3333333, 1,
-0.252882, 0.3888216, -1.946966, 0, 1, 0.3411765, 1,
-0.2508429, 0.07739193, 0.9452786, 0, 1, 0.345098, 1,
-0.2508376, -1.392753, -2.193595, 0, 1, 0.3529412, 1,
-0.2473386, -1.307793, -2.643559, 0, 1, 0.3568628, 1,
-0.2473207, -0.5370312, -3.316916, 0, 1, 0.3647059, 1,
-0.2437937, -0.8348174, -2.274443, 0, 1, 0.3686275, 1,
-0.243078, 0.6080894, -0.9891474, 0, 1, 0.3764706, 1,
-0.2424378, 0.03010431, -1.050222, 0, 1, 0.3803922, 1,
-0.2407897, -0.4143447, -2.934227, 0, 1, 0.3882353, 1,
-0.2404103, -0.5232391, -3.588043, 0, 1, 0.3921569, 1,
-0.239379, -0.7418383, -2.33188, 0, 1, 0.4, 1,
-0.237418, 1.204211, 1.340703, 0, 1, 0.4078431, 1,
-0.2315654, -0.1962906, -1.074459, 0, 1, 0.4117647, 1,
-0.2314407, 0.1587661, -0.3855662, 0, 1, 0.4196078, 1,
-0.2264126, 0.9501169, 0.2195033, 0, 1, 0.4235294, 1,
-0.2228424, 0.7699573, -0.06449529, 0, 1, 0.4313726, 1,
-0.2196711, -0.2815382, -0.03395533, 0, 1, 0.4352941, 1,
-0.2182716, -0.8675952, -3.03286, 0, 1, 0.4431373, 1,
-0.205726, 0.03145413, -2.706719, 0, 1, 0.4470588, 1,
-0.1985074, 0.2463311, -1.073625, 0, 1, 0.454902, 1,
-0.1941181, 2.663269, -2.049165, 0, 1, 0.4588235, 1,
-0.1940182, -0.3901319, -3.711224, 0, 1, 0.4666667, 1,
-0.1922466, 0.560622, -0.9196323, 0, 1, 0.4705882, 1,
-0.1897722, 1.811881, -0.9417036, 0, 1, 0.4784314, 1,
-0.1880404, -0.5001445, -3.477022, 0, 1, 0.4823529, 1,
-0.1862502, 0.4843726, -0.8012609, 0, 1, 0.4901961, 1,
-0.1856852, -0.4426743, -0.8712506, 0, 1, 0.4941176, 1,
-0.1847894, 0.2307018, -2.038316, 0, 1, 0.5019608, 1,
-0.1812741, 0.7097932, -0.6323333, 0, 1, 0.509804, 1,
-0.1805649, -0.1262679, -3.827588, 0, 1, 0.5137255, 1,
-0.178248, 0.2245948, -3.193191, 0, 1, 0.5215687, 1,
-0.1753833, 0.8720861, -1.35514, 0, 1, 0.5254902, 1,
-0.1732032, -2.430261, -4.135569, 0, 1, 0.5333334, 1,
-0.1667388, -1.005752, -2.423084, 0, 1, 0.5372549, 1,
-0.1625737, -1.083617, -1.963579, 0, 1, 0.5450981, 1,
-0.1537076, -0.7878441, -2.146622, 0, 1, 0.5490196, 1,
-0.1534834, -0.867181, -2.856565, 0, 1, 0.5568628, 1,
-0.1525999, 1.031026, -0.133513, 0, 1, 0.5607843, 1,
-0.1503294, 0.6353167, -0.1022874, 0, 1, 0.5686275, 1,
-0.1474683, -1.54701, -3.717374, 0, 1, 0.572549, 1,
-0.146733, 0.3890428, -0.4795789, 0, 1, 0.5803922, 1,
-0.1457956, -0.1175951, -2.110671, 0, 1, 0.5843138, 1,
-0.1453998, 0.7772225, 0.03828726, 0, 1, 0.5921569, 1,
-0.143403, -0.7142179, -2.898116, 0, 1, 0.5960785, 1,
-0.1413727, -0.1186545, -2.730078, 0, 1, 0.6039216, 1,
-0.1392058, -1.338088, -4.629622, 0, 1, 0.6117647, 1,
-0.1344459, -0.2796977, -2.179269, 0, 1, 0.6156863, 1,
-0.133399, -0.7499747, -2.646741, 0, 1, 0.6235294, 1,
-0.1316182, -0.4514786, -3.636994, 0, 1, 0.627451, 1,
-0.1290565, 0.4972835, -0.7702582, 0, 1, 0.6352941, 1,
-0.1252115, 1.018981, -1.983067, 0, 1, 0.6392157, 1,
-0.1249972, 0.0888073, -0.1697195, 0, 1, 0.6470588, 1,
-0.1242526, 1.723002, -1.700949, 0, 1, 0.6509804, 1,
-0.1193739, -0.1256961, -1.439012, 0, 1, 0.6588235, 1,
-0.1170688, -1.134748, -3.803334, 0, 1, 0.6627451, 1,
-0.1168992, 0.1755787, -1.712935, 0, 1, 0.6705883, 1,
-0.1130814, -0.5719393, -0.7456009, 0, 1, 0.6745098, 1,
-0.1066264, 0.4245033, 0.0133177, 0, 1, 0.682353, 1,
-0.1052326, 0.1653493, -0.5341665, 0, 1, 0.6862745, 1,
-0.1049108, -0.6916958, -2.860271, 0, 1, 0.6941177, 1,
-0.1048309, 0.7534221, -0.1826714, 0, 1, 0.7019608, 1,
-0.1026712, -0.2027004, -2.884917, 0, 1, 0.7058824, 1,
-0.1023818, -0.3985627, -4.04705, 0, 1, 0.7137255, 1,
-0.1023101, 0.07148049, -0.2920774, 0, 1, 0.7176471, 1,
-0.1016482, -1.161439, -2.737876, 0, 1, 0.7254902, 1,
-0.08892184, -0.6808895, -3.835616, 0, 1, 0.7294118, 1,
-0.08847228, -2.006954, -3.564765, 0, 1, 0.7372549, 1,
-0.08125439, 0.497382, -0.4059623, 0, 1, 0.7411765, 1,
-0.08101594, 2.402427, 1.118029, 0, 1, 0.7490196, 1,
-0.08076058, 1.043427, -0.1246548, 0, 1, 0.7529412, 1,
-0.08032486, 0.7983644, -0.1766289, 0, 1, 0.7607843, 1,
-0.07933639, -0.5814543, -2.542953, 0, 1, 0.7647059, 1,
-0.06922039, -0.4240431, -0.6418211, 0, 1, 0.772549, 1,
-0.06748628, -0.1176659, -2.14362, 0, 1, 0.7764706, 1,
-0.06457662, -1.858984, -2.813946, 0, 1, 0.7843137, 1,
-0.06409644, -0.7734241, -2.482877, 0, 1, 0.7882353, 1,
-0.06296489, 0.1065538, -0.298064, 0, 1, 0.7960784, 1,
-0.06042419, 0.302406, -0.2380284, 0, 1, 0.8039216, 1,
-0.05926885, 0.3984333, 0.142811, 0, 1, 0.8078431, 1,
-0.056875, 0.1430144, -0.7973835, 0, 1, 0.8156863, 1,
-0.05442257, 0.7877133, 0.9703831, 0, 1, 0.8196079, 1,
-0.05165417, 1.926703, 1.462921, 0, 1, 0.827451, 1,
-0.05056067, -0.8169968, -3.994877, 0, 1, 0.8313726, 1,
-0.05005169, 0.04826331, -0.4321897, 0, 1, 0.8392157, 1,
-0.04669035, -0.3323232, -2.832423, 0, 1, 0.8431373, 1,
-0.04559435, 1.219994, -0.7305315, 0, 1, 0.8509804, 1,
-0.04048841, -1.22463, -2.303076, 0, 1, 0.854902, 1,
-0.03719323, 0.2646274, -1.333326, 0, 1, 0.8627451, 1,
-0.03592392, -0.7146814, -1.890359, 0, 1, 0.8666667, 1,
-0.03424925, 2.105217, 0.291509, 0, 1, 0.8745098, 1,
-0.03172415, 1.62315, -0.4266196, 0, 1, 0.8784314, 1,
-0.03122661, 1.223957, -0.1035303, 0, 1, 0.8862745, 1,
-0.03100251, 0.5503454, -0.2325342, 0, 1, 0.8901961, 1,
-0.02780663, -0.9317731, -1.18845, 0, 1, 0.8980392, 1,
-0.02776671, -0.8583866, -3.105868, 0, 1, 0.9058824, 1,
-0.0198811, 0.962403, 0.1707671, 0, 1, 0.9098039, 1,
-0.01882307, 0.2985985, -2.318374, 0, 1, 0.9176471, 1,
-0.01627641, -1.034307, -3.510055, 0, 1, 0.9215686, 1,
-0.01562349, 1.461917, 2.224675, 0, 1, 0.9294118, 1,
-0.01330839, 0.5688559, -0.5960248, 0, 1, 0.9333333, 1,
-0.01063886, 0.398966, 0.6525483, 0, 1, 0.9411765, 1,
-0.009733917, 0.1378697, -1.0854, 0, 1, 0.945098, 1,
-0.009144944, -0.3049543, -3.879597, 0, 1, 0.9529412, 1,
-0.007770692, 0.1623646, 0.8943585, 0, 1, 0.9568627, 1,
-0.006651374, 0.2745483, 0.1507367, 0, 1, 0.9647059, 1,
-0.003006437, 0.9856885, -1.190276, 0, 1, 0.9686275, 1,
-0.0007254698, 0.4147204, -0.01705163, 0, 1, 0.9764706, 1,
0.0001518904, -0.02086871, 2.754133, 0, 1, 0.9803922, 1,
0.00244257, -1.770492, 1.943041, 0, 1, 0.9882353, 1,
0.003961976, -0.3172417, 4.477338, 0, 1, 0.9921569, 1,
0.004165227, -1.253566, 3.152962, 0, 1, 1, 1,
0.007120038, -1.549614, 1.950737, 0, 0.9921569, 1, 1,
0.01908674, 0.5332754, -1.486584, 0, 0.9882353, 1, 1,
0.02506765, 0.828111, -0.440372, 0, 0.9803922, 1, 1,
0.03340054, -0.2559173, 3.70215, 0, 0.9764706, 1, 1,
0.03709197, 0.1358312, 0.8451592, 0, 0.9686275, 1, 1,
0.04353261, 0.03118349, 0.7478701, 0, 0.9647059, 1, 1,
0.04586707, -0.09861668, 3.610168, 0, 0.9568627, 1, 1,
0.04642386, 1.429614, -0.2035561, 0, 0.9529412, 1, 1,
0.04662915, -1.538581, 3.044774, 0, 0.945098, 1, 1,
0.0519471, 0.2632209, 0.7194118, 0, 0.9411765, 1, 1,
0.05747763, 0.1849773, 0.08455206, 0, 0.9333333, 1, 1,
0.05894053, -0.7818849, 4.159712, 0, 0.9294118, 1, 1,
0.06173057, 0.3160724, 0.6443665, 0, 0.9215686, 1, 1,
0.06193371, 0.8427028, -1.284762, 0, 0.9176471, 1, 1,
0.06270522, -0.07308905, 3.264601, 0, 0.9098039, 1, 1,
0.0654272, -1.458388, 4.232927, 0, 0.9058824, 1, 1,
0.07092053, -0.8986918, 1.892008, 0, 0.8980392, 1, 1,
0.07269822, 0.83847, 1.617098, 0, 0.8901961, 1, 1,
0.07450959, -0.9332967, 3.772454, 0, 0.8862745, 1, 1,
0.07536464, 1.402585, 0.4632329, 0, 0.8784314, 1, 1,
0.07712631, 1.879497, 0.1542615, 0, 0.8745098, 1, 1,
0.08375056, -0.6681635, 6.067781, 0, 0.8666667, 1, 1,
0.08656939, -0.3222184, 2.482983, 0, 0.8627451, 1, 1,
0.0877438, -0.8134902, 3.935966, 0, 0.854902, 1, 1,
0.08950053, -0.2185698, 2.297756, 0, 0.8509804, 1, 1,
0.09183982, 0.345158, 0.8871377, 0, 0.8431373, 1, 1,
0.09438619, -0.8078699, 3.884963, 0, 0.8392157, 1, 1,
0.09929872, -0.02208212, 1.09193, 0, 0.8313726, 1, 1,
0.1035341, -1.321954, 0.7213686, 0, 0.827451, 1, 1,
0.1068616, 0.3453205, 0.2560233, 0, 0.8196079, 1, 1,
0.1078612, -0.4126667, 4.458317, 0, 0.8156863, 1, 1,
0.1082499, -0.2853942, 2.172405, 0, 0.8078431, 1, 1,
0.1088646, 0.1438808, 0.2655261, 0, 0.8039216, 1, 1,
0.1093875, -0.3529243, 3.578913, 0, 0.7960784, 1, 1,
0.1098359, -0.663843, 4.116666, 0, 0.7882353, 1, 1,
0.1106762, -0.7375404, 4.74885, 0, 0.7843137, 1, 1,
0.1144322, 0.2380165, 1.890024, 0, 0.7764706, 1, 1,
0.1159046, 1.027033, 0.0309637, 0, 0.772549, 1, 1,
0.1181452, 0.441324, 1.502078, 0, 0.7647059, 1, 1,
0.1211319, -0.4810704, 2.860715, 0, 0.7607843, 1, 1,
0.1226583, 0.6818643, -0.1085754, 0, 0.7529412, 1, 1,
0.1324968, -0.7510702, 5.387493, 0, 0.7490196, 1, 1,
0.1326055, 0.08182077, -0.2338181, 0, 0.7411765, 1, 1,
0.1334154, 0.9885356, 0.01976307, 0, 0.7372549, 1, 1,
0.1409058, 0.6427575, -1.569532, 0, 0.7294118, 1, 1,
0.14098, 1.838679, 0.5877215, 0, 0.7254902, 1, 1,
0.1430093, -0.3913522, 2.489541, 0, 0.7176471, 1, 1,
0.14429, 0.2697852, 1.389463, 0, 0.7137255, 1, 1,
0.1474349, 0.140442, -0.7864115, 0, 0.7058824, 1, 1,
0.1511612, -0.1234941, 1.318868, 0, 0.6980392, 1, 1,
0.1533078, 1.093467, 1.824762, 0, 0.6941177, 1, 1,
0.1533463, -1.171161, 3.152992, 0, 0.6862745, 1, 1,
0.1593005, 0.07017457, 0.07514691, 0, 0.682353, 1, 1,
0.1621547, -1.140676, 4.03631, 0, 0.6745098, 1, 1,
0.1678891, -0.3770918, 3.299892, 0, 0.6705883, 1, 1,
0.1685013, 1.155015, -1.003494, 0, 0.6627451, 1, 1,
0.1685373, -0.6174506, 3.194582, 0, 0.6588235, 1, 1,
0.1730748, 0.6974828, 1.503266, 0, 0.6509804, 1, 1,
0.1757226, 0.9848648, -1.546939, 0, 0.6470588, 1, 1,
0.1766204, 0.5150045, 0.3219358, 0, 0.6392157, 1, 1,
0.176721, -0.8767815, 1.983148, 0, 0.6352941, 1, 1,
0.1774604, 1.305765, 0.8624402, 0, 0.627451, 1, 1,
0.1778637, -1.450045, 0.9651029, 0, 0.6235294, 1, 1,
0.1803699, 0.5750349, 1.336405, 0, 0.6156863, 1, 1,
0.1804813, 1.025232, 0.3457402, 0, 0.6117647, 1, 1,
0.1812785, 0.1519107, -1.187868, 0, 0.6039216, 1, 1,
0.1883885, 0.7615098, 0.02835615, 0, 0.5960785, 1, 1,
0.1890893, 0.475526, 0.4589339, 0, 0.5921569, 1, 1,
0.1936603, 0.5519207, -1.091734, 0, 0.5843138, 1, 1,
0.1938945, -0.3179709, 1.480018, 0, 0.5803922, 1, 1,
0.1966665, -0.5198205, 2.993531, 0, 0.572549, 1, 1,
0.1978928, 0.6779711, 0.9270678, 0, 0.5686275, 1, 1,
0.1991787, 1.611144, -0.08064014, 0, 0.5607843, 1, 1,
0.2013096, -0.01072858, 1.244852, 0, 0.5568628, 1, 1,
0.2015343, -0.03332832, 0.2048333, 0, 0.5490196, 1, 1,
0.2032442, -0.05178707, 1.363797, 0, 0.5450981, 1, 1,
0.2062642, -0.4246619, 4.554651, 0, 0.5372549, 1, 1,
0.216399, -0.1311392, 2.583052, 0, 0.5333334, 1, 1,
0.218507, -1.751968, 3.487347, 0, 0.5254902, 1, 1,
0.2201057, 0.4237442, -2.718412, 0, 0.5215687, 1, 1,
0.2219058, -0.6898323, 3.996063, 0, 0.5137255, 1, 1,
0.2271881, 0.1423816, 0.8196905, 0, 0.509804, 1, 1,
0.2291578, -1.21701, 2.388393, 0, 0.5019608, 1, 1,
0.23135, 1.410007, 1.520745, 0, 0.4941176, 1, 1,
0.2327574, -1.467344, 4.313372, 0, 0.4901961, 1, 1,
0.234707, -0.01966568, 1.429416, 0, 0.4823529, 1, 1,
0.2369174, -0.6113981, 1.814548, 0, 0.4784314, 1, 1,
0.2410838, -1.08776, 3.730833, 0, 0.4705882, 1, 1,
0.2419072, -1.291565, 2.69124, 0, 0.4666667, 1, 1,
0.2430013, -0.5848861, 0.9999855, 0, 0.4588235, 1, 1,
0.2463108, 0.1691788, 0.1145259, 0, 0.454902, 1, 1,
0.2480253, 0.6605487, -0.3888711, 0, 0.4470588, 1, 1,
0.2490224, 2.3593, -0.005131227, 0, 0.4431373, 1, 1,
0.2502127, -1.028702, 2.20166, 0, 0.4352941, 1, 1,
0.2519133, 0.248013, -0.553753, 0, 0.4313726, 1, 1,
0.2522923, -2.351376, 2.783288, 0, 0.4235294, 1, 1,
0.2545832, -2.092507, 3.490981, 0, 0.4196078, 1, 1,
0.2564742, -0.2782798, 2.181697, 0, 0.4117647, 1, 1,
0.2637, 0.178604, 0.8207458, 0, 0.4078431, 1, 1,
0.2659064, -0.9213249, 2.574535, 0, 0.4, 1, 1,
0.2667803, -0.519718, 3.517227, 0, 0.3921569, 1, 1,
0.2680844, -0.2029929, 0.8010877, 0, 0.3882353, 1, 1,
0.2682487, 1.125005, 1.407001, 0, 0.3803922, 1, 1,
0.2687312, -0.7824602, 3.08886, 0, 0.3764706, 1, 1,
0.2731097, 0.9273688, 1.800084, 0, 0.3686275, 1, 1,
0.2732768, -1.277284, 2.021741, 0, 0.3647059, 1, 1,
0.275334, -0.8637956, 4.077909, 0, 0.3568628, 1, 1,
0.2788371, -0.05373851, 1.294262, 0, 0.3529412, 1, 1,
0.2865295, 1.41816, -0.2239181, 0, 0.345098, 1, 1,
0.2867854, -0.03076918, 2.398854, 0, 0.3411765, 1, 1,
0.2885174, -0.5733345, 3.119989, 0, 0.3333333, 1, 1,
0.2910552, 0.08006761, 3.78931, 0, 0.3294118, 1, 1,
0.2924624, -1.123549, 3.004802, 0, 0.3215686, 1, 1,
0.2947512, 1.701311, -1.487938, 0, 0.3176471, 1, 1,
0.2955077, -0.003309041, 2.131226, 0, 0.3098039, 1, 1,
0.2975563, -0.2755537, 2.2497, 0, 0.3058824, 1, 1,
0.299187, -0.3982104, 2.062908, 0, 0.2980392, 1, 1,
0.3005295, -0.2654915, 2.527342, 0, 0.2901961, 1, 1,
0.3019193, -0.5897025, 3.50583, 0, 0.2862745, 1, 1,
0.3036278, -0.0632457, 0.146084, 0, 0.2784314, 1, 1,
0.3050006, 0.07828175, -0.07847296, 0, 0.2745098, 1, 1,
0.3105352, 2.3235, -1.416436, 0, 0.2666667, 1, 1,
0.3119063, -0.9960939, 3.990286, 0, 0.2627451, 1, 1,
0.3146397, -0.622785, 2.610871, 0, 0.254902, 1, 1,
0.3176309, 0.08995682, 3.912566, 0, 0.2509804, 1, 1,
0.3181261, -1.186834, 4.757846, 0, 0.2431373, 1, 1,
0.3187082, 1.056633, 1.160902, 0, 0.2392157, 1, 1,
0.3313, 0.5391074, 1.083866, 0, 0.2313726, 1, 1,
0.3327685, -0.9319533, 4.452872, 0, 0.227451, 1, 1,
0.3330388, -1.309632, 3.491531, 0, 0.2196078, 1, 1,
0.3357738, 0.9467157, -0.6576815, 0, 0.2156863, 1, 1,
0.3369553, -0.008703629, -0.146208, 0, 0.2078431, 1, 1,
0.3420278, 0.8162876, 2.322275, 0, 0.2039216, 1, 1,
0.3457686, 1.710814, 0.3992084, 0, 0.1960784, 1, 1,
0.3467404, 0.8609706, 0.1770491, 0, 0.1882353, 1, 1,
0.3469528, -0.6539609, 2.855338, 0, 0.1843137, 1, 1,
0.3538092, 1.275614, 0.1704929, 0, 0.1764706, 1, 1,
0.3549837, -1.389859, 2.876033, 0, 0.172549, 1, 1,
0.3602893, 0.7416523, 1.248376, 0, 0.1647059, 1, 1,
0.3617386, 0.2577454, 0.5065975, 0, 0.1607843, 1, 1,
0.3655347, 0.290244, 1.561159, 0, 0.1529412, 1, 1,
0.3690033, -1.292051, 4.202423, 0, 0.1490196, 1, 1,
0.3718588, 0.2362633, 1.217184, 0, 0.1411765, 1, 1,
0.3780495, -0.0781508, 2.321881, 0, 0.1372549, 1, 1,
0.387202, -0.9042318, 4.588489, 0, 0.1294118, 1, 1,
0.3878881, 1.200547, 0.2419728, 0, 0.1254902, 1, 1,
0.3908359, 0.8933016, -0.6349086, 0, 0.1176471, 1, 1,
0.3925191, -1.669567, 3.383921, 0, 0.1137255, 1, 1,
0.3947273, 0.7562247, 0.7510706, 0, 0.1058824, 1, 1,
0.3966573, 1.170263, 1.33296, 0, 0.09803922, 1, 1,
0.3970188, -1.136669, 2.417747, 0, 0.09411765, 1, 1,
0.3970425, -0.02368124, 1.804849, 0, 0.08627451, 1, 1,
0.3991519, -0.5558851, 3.399031, 0, 0.08235294, 1, 1,
0.4010096, -0.2236398, 2.644231, 0, 0.07450981, 1, 1,
0.4039166, 0.0333877, 0.9176742, 0, 0.07058824, 1, 1,
0.4055937, -0.09060258, 1.617597, 0, 0.0627451, 1, 1,
0.4057084, -2.153098, 2.768869, 0, 0.05882353, 1, 1,
0.4085188, 2.439297, 0.333039, 0, 0.05098039, 1, 1,
0.4100043, 0.9616446, 2.071399, 0, 0.04705882, 1, 1,
0.4100347, 0.9662277, 1.568872, 0, 0.03921569, 1, 1,
0.4120876, 0.2124758, 0.8960423, 0, 0.03529412, 1, 1,
0.4144862, -0.4310934, 3.057643, 0, 0.02745098, 1, 1,
0.4156263, -1.212775, 2.385599, 0, 0.02352941, 1, 1,
0.4156317, 0.9422075, 0.4149396, 0, 0.01568628, 1, 1,
0.419231, -0.2105474, 3.361688, 0, 0.01176471, 1, 1,
0.4196951, 0.3294232, 1.893712, 0, 0.003921569, 1, 1,
0.4271011, 1.393712, 1.68575, 0.003921569, 0, 1, 1,
0.4275644, 0.2363207, 2.268933, 0.007843138, 0, 1, 1,
0.4300915, 0.2374427, 1.170732, 0.01568628, 0, 1, 1,
0.4328138, -0.6995519, 3.847406, 0.01960784, 0, 1, 1,
0.4345753, -0.01346668, 2.211959, 0.02745098, 0, 1, 1,
0.4391667, 2.521083, 0.2112305, 0.03137255, 0, 1, 1,
0.4404233, -0.4606648, 1.67174, 0.03921569, 0, 1, 1,
0.4463986, 1.200619, -0.001984263, 0.04313726, 0, 1, 1,
0.4493982, 0.2226539, 0.8866799, 0.05098039, 0, 1, 1,
0.453308, 0.9396896, 0.8178082, 0.05490196, 0, 1, 1,
0.4564258, 2.023683, -0.4049313, 0.0627451, 0, 1, 1,
0.458241, 0.06450918, 2.580081, 0.06666667, 0, 1, 1,
0.4597089, -1.272338, 1.93882, 0.07450981, 0, 1, 1,
0.4652762, 0.7360507, 0.4912856, 0.07843138, 0, 1, 1,
0.4674773, -1.126092, 4.644264, 0.08627451, 0, 1, 1,
0.4699157, 1.210485, 0.2675777, 0.09019608, 0, 1, 1,
0.4729897, 0.8038359, 0.05126834, 0.09803922, 0, 1, 1,
0.4742155, 0.9434718, 0.2090164, 0.1058824, 0, 1, 1,
0.4828797, 0.4566417, 0.6490551, 0.1098039, 0, 1, 1,
0.4885467, -0.8654965, 2.624811, 0.1176471, 0, 1, 1,
0.4902368, -1.061335, 1.813166, 0.1215686, 0, 1, 1,
0.4920206, 0.6284827, -0.4214034, 0.1294118, 0, 1, 1,
0.4920781, -1.304765, 2.792921, 0.1333333, 0, 1, 1,
0.4938037, 0.5840508, 1.256462, 0.1411765, 0, 1, 1,
0.4981788, 0.6059292, 0.6483441, 0.145098, 0, 1, 1,
0.500685, -0.417861, 1.256949, 0.1529412, 0, 1, 1,
0.5007648, 1.238538, 0.0153036, 0.1568628, 0, 1, 1,
0.5034961, -1.318558, 2.14823, 0.1647059, 0, 1, 1,
0.504069, -0.9541596, 3.662212, 0.1686275, 0, 1, 1,
0.5096778, 2.512956, -1.474138, 0.1764706, 0, 1, 1,
0.510212, 0.1565446, 1.328374, 0.1803922, 0, 1, 1,
0.5156021, 0.07874102, 2.253804, 0.1882353, 0, 1, 1,
0.5179976, 0.7102512, 0.7391257, 0.1921569, 0, 1, 1,
0.5210414, 0.2743379, 1.186483, 0.2, 0, 1, 1,
0.5219242, 0.5929607, 0.8742651, 0.2078431, 0, 1, 1,
0.5232976, -0.7104039, 2.192136, 0.2117647, 0, 1, 1,
0.5265886, 0.7859551, -0.3374914, 0.2196078, 0, 1, 1,
0.5304394, 0.3544042, -0.3480413, 0.2235294, 0, 1, 1,
0.5344526, -0.3822891, 2.195968, 0.2313726, 0, 1, 1,
0.5376061, 1.28758, 0.1552797, 0.2352941, 0, 1, 1,
0.5393804, 0.5805009, 1.834778, 0.2431373, 0, 1, 1,
0.5393811, 1.816781, 0.3911889, 0.2470588, 0, 1, 1,
0.5394978, 0.3453403, 1.897939, 0.254902, 0, 1, 1,
0.5541844, -0.1065443, 2.764781, 0.2588235, 0, 1, 1,
0.5545753, 0.9358953, 0.7340392, 0.2666667, 0, 1, 1,
0.5575814, 0.6901672, 1.713188, 0.2705882, 0, 1, 1,
0.5618105, -1.683589, 1.829132, 0.2784314, 0, 1, 1,
0.5674085, 0.4863791, 0.9245036, 0.282353, 0, 1, 1,
0.5679842, -2.238391, 1.102075, 0.2901961, 0, 1, 1,
0.5690282, 0.7666248, 1.306913, 0.2941177, 0, 1, 1,
0.571153, -0.1641637, 1.617475, 0.3019608, 0, 1, 1,
0.573325, 2.372544, -0.3245945, 0.3098039, 0, 1, 1,
0.5790045, -1.097705, 2.168361, 0.3137255, 0, 1, 1,
0.5791996, -1.377689, 1.129465, 0.3215686, 0, 1, 1,
0.5857675, -0.1043958, 2.34175, 0.3254902, 0, 1, 1,
0.5861278, -1.47245, 3.363285, 0.3333333, 0, 1, 1,
0.5937967, -1.762385, 0.9364441, 0.3372549, 0, 1, 1,
0.5971262, -1.474066, 5.438836, 0.345098, 0, 1, 1,
0.6048787, -0.8658395, 2.381219, 0.3490196, 0, 1, 1,
0.607426, 0.8456997, -0.8572934, 0.3568628, 0, 1, 1,
0.6129147, 0.4846391, 0.05871671, 0.3607843, 0, 1, 1,
0.6141353, 0.2781875, 1.603173, 0.3686275, 0, 1, 1,
0.615258, -0.1676753, 1.690991, 0.372549, 0, 1, 1,
0.6261036, 0.5744526, 0.517838, 0.3803922, 0, 1, 1,
0.632526, 1.542026, -0.2421104, 0.3843137, 0, 1, 1,
0.639101, 1.386026, 0.4948185, 0.3921569, 0, 1, 1,
0.6391564, -2.515056, 2.0852, 0.3960784, 0, 1, 1,
0.6504538, 0.4323581, 0.3365197, 0.4039216, 0, 1, 1,
0.6724268, 0.4253971, 1.034229, 0.4117647, 0, 1, 1,
0.6730928, 0.0690919, 2.237338, 0.4156863, 0, 1, 1,
0.6736629, 0.917424, 1.095759, 0.4235294, 0, 1, 1,
0.6773672, -0.1639883, 1.414738, 0.427451, 0, 1, 1,
0.6787613, -1.544486, 1.191334, 0.4352941, 0, 1, 1,
0.6851137, -0.6589956, 3.669903, 0.4392157, 0, 1, 1,
0.6875782, 1.208256, -0.8232517, 0.4470588, 0, 1, 1,
0.6982206, -0.6582095, 3.928926, 0.4509804, 0, 1, 1,
0.7150854, 0.6796034, 0.4667647, 0.4588235, 0, 1, 1,
0.7180613, 0.6276116, 0.6125522, 0.4627451, 0, 1, 1,
0.7226596, 0.4503787, 1.838025, 0.4705882, 0, 1, 1,
0.7279247, 0.8061503, 0.02731405, 0.4745098, 0, 1, 1,
0.7287655, 1.630167, 1.766885, 0.4823529, 0, 1, 1,
0.7298445, 0.3180436, -0.4544044, 0.4862745, 0, 1, 1,
0.7314571, 0.6639494, 2.392135, 0.4941176, 0, 1, 1,
0.7334182, -2.091775, 1.971221, 0.5019608, 0, 1, 1,
0.7340716, -0.0750242, 3.725833, 0.5058824, 0, 1, 1,
0.7346119, -0.9778635, 2.735851, 0.5137255, 0, 1, 1,
0.7394071, 0.9299177, 3.120465, 0.5176471, 0, 1, 1,
0.7433742, 0.8243198, -0.433678, 0.5254902, 0, 1, 1,
0.7450426, 0.5706483, 1.57149, 0.5294118, 0, 1, 1,
0.7519078, -0.806819, 3.248572, 0.5372549, 0, 1, 1,
0.7584501, 0.02814643, 2.006648, 0.5411765, 0, 1, 1,
0.7673206, -0.8312783, 2.175618, 0.5490196, 0, 1, 1,
0.7703435, 1.142726, 1.739124, 0.5529412, 0, 1, 1,
0.7722519, 1.947709, -1.947474, 0.5607843, 0, 1, 1,
0.7743528, 0.2687448, 0.607514, 0.5647059, 0, 1, 1,
0.7766976, -0.05191232, -0.3540767, 0.572549, 0, 1, 1,
0.7782629, -0.5999918, 2.859964, 0.5764706, 0, 1, 1,
0.7823621, -0.5719033, 2.665166, 0.5843138, 0, 1, 1,
0.7845618, 0.1315696, 2.013257, 0.5882353, 0, 1, 1,
0.7893968, 2.465854, 0.2508476, 0.5960785, 0, 1, 1,
0.7905519, -0.9636531, 2.847064, 0.6039216, 0, 1, 1,
0.7925538, 0.9288811, 0.2854491, 0.6078432, 0, 1, 1,
0.7941626, -0.7095139, 2.638218, 0.6156863, 0, 1, 1,
0.801258, -0.7692373, 3.121277, 0.6196079, 0, 1, 1,
0.802417, 0.3329681, -0.03371342, 0.627451, 0, 1, 1,
0.8065854, -1.211862, 1.808275, 0.6313726, 0, 1, 1,
0.8173338, -0.2332352, 0.5635153, 0.6392157, 0, 1, 1,
0.825422, 0.5918872, -0.4311833, 0.6431373, 0, 1, 1,
0.8285868, -1.659577, 3.025068, 0.6509804, 0, 1, 1,
0.8310407, 1.200385, 0.3800036, 0.654902, 0, 1, 1,
0.8350768, -0.4440138, 3.74821, 0.6627451, 0, 1, 1,
0.8396105, 0.512369, 1.996655, 0.6666667, 0, 1, 1,
0.8411796, 1.167746, 0.9297741, 0.6745098, 0, 1, 1,
0.8442938, -0.5127158, 2.122423, 0.6784314, 0, 1, 1,
0.846252, -0.2935614, 2.623989, 0.6862745, 0, 1, 1,
0.8466351, -0.3468866, 1.915398, 0.6901961, 0, 1, 1,
0.8524187, 0.1254884, 2.348906, 0.6980392, 0, 1, 1,
0.8533143, -1.149786, 2.001465, 0.7058824, 0, 1, 1,
0.8567396, 1.096473, 1.234793, 0.7098039, 0, 1, 1,
0.8605884, 0.6526432, 2.090731, 0.7176471, 0, 1, 1,
0.8640725, -0.05641168, 2.701092, 0.7215686, 0, 1, 1,
0.8645524, 0.5022412, 0.5506342, 0.7294118, 0, 1, 1,
0.8667676, -0.3113783, 2.698862, 0.7333333, 0, 1, 1,
0.8670489, 1.830081, 1.160725, 0.7411765, 0, 1, 1,
0.8735065, -0.09677117, 1.132428, 0.7450981, 0, 1, 1,
0.877268, -0.6809257, 1.994779, 0.7529412, 0, 1, 1,
0.8789281, -0.376101, 3.418907, 0.7568628, 0, 1, 1,
0.8795421, -2.090728, 3.192359, 0.7647059, 0, 1, 1,
0.884554, -1.208409, 2.849627, 0.7686275, 0, 1, 1,
0.8919321, -0.5401122, 2.557001, 0.7764706, 0, 1, 1,
0.8935649, -1.027165, 2.782906, 0.7803922, 0, 1, 1,
0.8964026, 0.03159342, 2.317459, 0.7882353, 0, 1, 1,
0.8988544, 1.640461, 0.5742763, 0.7921569, 0, 1, 1,
0.9041631, 0.3276031, 0.5124187, 0.8, 0, 1, 1,
0.9064515, -0.02971033, 1.512558, 0.8078431, 0, 1, 1,
0.9080411, -0.02192798, 2.53952, 0.8117647, 0, 1, 1,
0.9122626, 1.52077, 1.838124, 0.8196079, 0, 1, 1,
0.9144334, -1.18014, 1.094816, 0.8235294, 0, 1, 1,
0.9162707, -0.8392666, 1.011613, 0.8313726, 0, 1, 1,
0.9165384, 1.328236, 1.547982, 0.8352941, 0, 1, 1,
0.9167982, 0.2196417, 0.9951558, 0.8431373, 0, 1, 1,
0.9189323, -0.03674176, 1.543735, 0.8470588, 0, 1, 1,
0.9291272, -0.3768744, 1.955819, 0.854902, 0, 1, 1,
0.9374709, -0.9019622, 1.313911, 0.8588235, 0, 1, 1,
0.9392129, 0.6640677, 0.8820575, 0.8666667, 0, 1, 1,
0.9442279, 0.5282133, 0.6811165, 0.8705882, 0, 1, 1,
0.9507263, 0.9099911, 1.172655, 0.8784314, 0, 1, 1,
0.9523481, 1.641512, 0.4758859, 0.8823529, 0, 1, 1,
0.9577754, 0.9903305, -2.384864, 0.8901961, 0, 1, 1,
0.9586614, -1.030345, 2.388614, 0.8941177, 0, 1, 1,
0.9592438, -0.09077837, 1.124648, 0.9019608, 0, 1, 1,
0.9647828, -0.08534873, 0.6479379, 0.9098039, 0, 1, 1,
0.9683502, -0.4907854, 1.948117, 0.9137255, 0, 1, 1,
0.9776121, 0.8468881, -0.4159489, 0.9215686, 0, 1, 1,
0.9959148, -1.500217, 3.342109, 0.9254902, 0, 1, 1,
0.9964627, -1.169405, 2.988702, 0.9333333, 0, 1, 1,
1.004033, 0.5174482, 1.426194, 0.9372549, 0, 1, 1,
1.007474, -0.1086967, 0.718718, 0.945098, 0, 1, 1,
1.01316, 2.271789, 0.494857, 0.9490196, 0, 1, 1,
1.014519, -2.225246, 2.48047, 0.9568627, 0, 1, 1,
1.020897, 1.222551, 0.8015921, 0.9607843, 0, 1, 1,
1.022395, 0.8219332, -1.406978, 0.9686275, 0, 1, 1,
1.025811, 0.8245569, 3.246554, 0.972549, 0, 1, 1,
1.026234, -0.46807, 3.883974, 0.9803922, 0, 1, 1,
1.026284, -1.680708, 2.893252, 0.9843137, 0, 1, 1,
1.028149, 0.4764223, 2.967879, 0.9921569, 0, 1, 1,
1.036133, 0.411034, 1.952516, 0.9960784, 0, 1, 1,
1.036587, -0.2757317, 0.1083434, 1, 0, 0.9960784, 1,
1.039172, -0.336572, 0.6963484, 1, 0, 0.9882353, 1,
1.041979, -1.475095, 0.7897886, 1, 0, 0.9843137, 1,
1.045938, 0.7750697, 1.818363, 1, 0, 0.9764706, 1,
1.046223, -0.1521863, 0.8705739, 1, 0, 0.972549, 1,
1.047794, -0.6525669, 4.383881, 1, 0, 0.9647059, 1,
1.054645, 0.4523294, -0.07594604, 1, 0, 0.9607843, 1,
1.058392, -0.4056024, 0.3008908, 1, 0, 0.9529412, 1,
1.066001, -0.2406041, 1.745462, 1, 0, 0.9490196, 1,
1.06977, 0.8736025, 0.6307766, 1, 0, 0.9411765, 1,
1.076793, 0.5567757, 2.215262, 1, 0, 0.9372549, 1,
1.08372, 1.098295, 0.9333028, 1, 0, 0.9294118, 1,
1.085005, -0.4929128, 2.17703, 1, 0, 0.9254902, 1,
1.088235, 0.6447459, 3.251962, 1, 0, 0.9176471, 1,
1.089486, 0.5298533, 1.254681, 1, 0, 0.9137255, 1,
1.092895, -1.641534, 1.161456, 1, 0, 0.9058824, 1,
1.095943, -0.2000685, 2.914971, 1, 0, 0.9019608, 1,
1.098784, -0.7870702, 2.45944, 1, 0, 0.8941177, 1,
1.10068, 0.04713853, 2.97628, 1, 0, 0.8862745, 1,
1.109424, -0.5287001, 1.68894, 1, 0, 0.8823529, 1,
1.110173, -0.0331374, 2.147345, 1, 0, 0.8745098, 1,
1.124694, -1.855071, 1.974667, 1, 0, 0.8705882, 1,
1.126081, -1.10208, 2.936122, 1, 0, 0.8627451, 1,
1.126774, -0.9441857, 2.789955, 1, 0, 0.8588235, 1,
1.129306, 1.041836, 0.3664041, 1, 0, 0.8509804, 1,
1.13767, 0.5230767, 1.508752, 1, 0, 0.8470588, 1,
1.140516, -0.1701769, 1.36653, 1, 0, 0.8392157, 1,
1.140793, 0.659179, 2.360692, 1, 0, 0.8352941, 1,
1.141184, 0.8705831, 1.007328, 1, 0, 0.827451, 1,
1.147809, -1.397041, 2.502258, 1, 0, 0.8235294, 1,
1.153331, 0.6077207, 1.713362, 1, 0, 0.8156863, 1,
1.160769, 1.025399, 1.989248, 1, 0, 0.8117647, 1,
1.180159, 0.1639768, -0.1772195, 1, 0, 0.8039216, 1,
1.182337, -1.520415, 3.304989, 1, 0, 0.7960784, 1,
1.208254, 1.528412, 0.3102094, 1, 0, 0.7921569, 1,
1.209486, 1.324425, -0.3956056, 1, 0, 0.7843137, 1,
1.211806, 1.478904, -0.1267958, 1, 0, 0.7803922, 1,
1.213125, -0.3084391, 0.9213248, 1, 0, 0.772549, 1,
1.215916, -1.541475, 2.300356, 1, 0, 0.7686275, 1,
1.219635, 0.6059159, -0.4369371, 1, 0, 0.7607843, 1,
1.235343, -0.6081434, 2.941189, 1, 0, 0.7568628, 1,
1.236158, 0.5401679, 1.438585, 1, 0, 0.7490196, 1,
1.254241, 1.386869, -0.7503563, 1, 0, 0.7450981, 1,
1.254739, -0.3197553, 2.200996, 1, 0, 0.7372549, 1,
1.258756, -2.583338, 2.898572, 1, 0, 0.7333333, 1,
1.260927, 0.7227663, 0.7903025, 1, 0, 0.7254902, 1,
1.269929, -0.5380973, 3.091499, 1, 0, 0.7215686, 1,
1.277223, -1.546731, 2.032936, 1, 0, 0.7137255, 1,
1.280471, -1.698033, 2.787963, 1, 0, 0.7098039, 1,
1.282741, -1.961918, 1.875439, 1, 0, 0.7019608, 1,
1.292371, 0.7470329, 2.191422, 1, 0, 0.6941177, 1,
1.298373, 0.09367082, 2.565134, 1, 0, 0.6901961, 1,
1.298828, -0.1469211, 0.138547, 1, 0, 0.682353, 1,
1.303233, -0.4095831, 1.827429, 1, 0, 0.6784314, 1,
1.314387, 0.7450792, 1.804566, 1, 0, 0.6705883, 1,
1.316224, 0.921334, 0.7951732, 1, 0, 0.6666667, 1,
1.331595, -1.439671, 0.6426666, 1, 0, 0.6588235, 1,
1.332651, 0.2231414, 2.688354, 1, 0, 0.654902, 1,
1.335155, -1.241936, 3.204659, 1, 0, 0.6470588, 1,
1.336977, 0.4027256, 0.8612639, 1, 0, 0.6431373, 1,
1.337567, -0.159973, 3.22654, 1, 0, 0.6352941, 1,
1.362237, 1.872551, -1.029055, 1, 0, 0.6313726, 1,
1.362346, -0.1874176, 2.55225, 1, 0, 0.6235294, 1,
1.366046, 0.4602037, 1.81312, 1, 0, 0.6196079, 1,
1.369999, 0.0522023, 0.4489185, 1, 0, 0.6117647, 1,
1.374832, 1.724319, 2.173498, 1, 0, 0.6078432, 1,
1.377999, 0.7001154, 0.4732047, 1, 0, 0.6, 1,
1.383963, -0.1169108, 1.195861, 1, 0, 0.5921569, 1,
1.398874, 0.3473783, 1.55867, 1, 0, 0.5882353, 1,
1.402237, 0.05088452, 1.974544, 1, 0, 0.5803922, 1,
1.425556, 0.08976321, 1.674061, 1, 0, 0.5764706, 1,
1.426645, 1.835243, 0.5147585, 1, 0, 0.5686275, 1,
1.430129, 1.437995, 0.007709284, 1, 0, 0.5647059, 1,
1.440533, 1.908364, 1.104567, 1, 0, 0.5568628, 1,
1.441674, -0.6751546, 2.257441, 1, 0, 0.5529412, 1,
1.44516, 1.904512, 1.014094, 1, 0, 0.5450981, 1,
1.450966, -0.6800539, 0.8525869, 1, 0, 0.5411765, 1,
1.458556, 0.2816784, 2.828595, 1, 0, 0.5333334, 1,
1.467897, 0.3573558, 0.7365971, 1, 0, 0.5294118, 1,
1.468413, -0.4460493, 2.212359, 1, 0, 0.5215687, 1,
1.477759, -0.8271881, 2.077603, 1, 0, 0.5176471, 1,
1.479625, -0.812869, 3.048056, 1, 0, 0.509804, 1,
1.491345, -0.1051195, 1.601835, 1, 0, 0.5058824, 1,
1.491728, -0.506274, 1.073304, 1, 0, 0.4980392, 1,
1.494073, -0.8254317, 1.456743, 1, 0, 0.4901961, 1,
1.50505, 0.8068777, 0.0118711, 1, 0, 0.4862745, 1,
1.507024, 0.6668675, -0.510437, 1, 0, 0.4784314, 1,
1.514821, -0.2012015, 1.277219, 1, 0, 0.4745098, 1,
1.515157, 0.951052, 2.038769, 1, 0, 0.4666667, 1,
1.516063, -0.92277, 1.604653, 1, 0, 0.4627451, 1,
1.51928, 0.1727972, 0.1987835, 1, 0, 0.454902, 1,
1.519302, -0.7931287, 1.219956, 1, 0, 0.4509804, 1,
1.520194, 0.2054454, 1.146496, 1, 0, 0.4431373, 1,
1.525865, -1.453486, 1.236953, 1, 0, 0.4392157, 1,
1.526279, -0.8467551, 2.456374, 1, 0, 0.4313726, 1,
1.531884, -0.503884, 0.5247521, 1, 0, 0.427451, 1,
1.533232, -1.596367, 1.116825, 1, 0, 0.4196078, 1,
1.539427, -0.3675238, 3.772167, 1, 0, 0.4156863, 1,
1.542556, -1.623013, 2.114312, 1, 0, 0.4078431, 1,
1.545782, 0.1228867, 1.916647, 1, 0, 0.4039216, 1,
1.548483, -1.141543, 2.36899, 1, 0, 0.3960784, 1,
1.570634, 0.6566932, -0.7331995, 1, 0, 0.3882353, 1,
1.576657, 0.2221611, 0.8340861, 1, 0, 0.3843137, 1,
1.579341, -0.5578828, 4.436023, 1, 0, 0.3764706, 1,
1.586386, -2.399293, 3.349541, 1, 0, 0.372549, 1,
1.640394, 1.253714, 1.20494, 1, 0, 0.3647059, 1,
1.640488, -0.007640821, 0.8462663, 1, 0, 0.3607843, 1,
1.653224, -0.2129418, 1.574015, 1, 0, 0.3529412, 1,
1.664239, 1.18064, 1.043214, 1, 0, 0.3490196, 1,
1.671122, 0.9535517, 1.610121, 1, 0, 0.3411765, 1,
1.680466, -0.2623646, 1.282081, 1, 0, 0.3372549, 1,
1.681034, 0.5354298, 1.01168, 1, 0, 0.3294118, 1,
1.690131, -0.3771071, 2.332036, 1, 0, 0.3254902, 1,
1.695366, -1.157287, 1.690418, 1, 0, 0.3176471, 1,
1.695875, 0.3033013, 0.6353765, 1, 0, 0.3137255, 1,
1.69956, -0.4135549, 1.365495, 1, 0, 0.3058824, 1,
1.706864, 0.2676384, 0.3566273, 1, 0, 0.2980392, 1,
1.720188, 1.346453, 1.433708, 1, 0, 0.2941177, 1,
1.746277, 2.214776, 0.983352, 1, 0, 0.2862745, 1,
1.750065, -1.121319, 2.313814, 1, 0, 0.282353, 1,
1.752164, 0.8754311, 2.839834, 1, 0, 0.2745098, 1,
1.752646, 0.2429034, 1.785197, 1, 0, 0.2705882, 1,
1.774075, -0.3502019, 2.082231, 1, 0, 0.2627451, 1,
1.784891, 0.4253394, 0.8799568, 1, 0, 0.2588235, 1,
1.816763, -0.9866604, 3.518199, 1, 0, 0.2509804, 1,
1.830916, 0.8480547, 1.178667, 1, 0, 0.2470588, 1,
1.83669, -0.6764039, 0.2578378, 1, 0, 0.2392157, 1,
1.836928, -1.300545, 2.804799, 1, 0, 0.2352941, 1,
1.857654, 0.568336, 0.121883, 1, 0, 0.227451, 1,
1.858182, -0.2011265, 2.886855, 1, 0, 0.2235294, 1,
1.862227, 0.2697346, 0.6080092, 1, 0, 0.2156863, 1,
1.866257, -1.068451, 4.148074, 1, 0, 0.2117647, 1,
1.866669, 0.2256811, 0.9077883, 1, 0, 0.2039216, 1,
1.873612, 0.3586584, -0.2820852, 1, 0, 0.1960784, 1,
1.88129, 0.004198221, 0.6215686, 1, 0, 0.1921569, 1,
1.899621, -1.073886, 1.031257, 1, 0, 0.1843137, 1,
1.943766, 1.496467, 0.2902624, 1, 0, 0.1803922, 1,
1.952588, -1.590502, 2.522771, 1, 0, 0.172549, 1,
1.959623, -1.528404, 2.493744, 1, 0, 0.1686275, 1,
1.976392, 0.7005516, 0.8740789, 1, 0, 0.1607843, 1,
2.013068, 0.1776762, 1.286809, 1, 0, 0.1568628, 1,
2.051004, 0.3713201, 2.076579, 1, 0, 0.1490196, 1,
2.054811, 1.048287, 0.5905781, 1, 0, 0.145098, 1,
2.054918, 1.704805, -0.2192232, 1, 0, 0.1372549, 1,
2.060996, 0.8065615, -0.318123, 1, 0, 0.1333333, 1,
2.072619, 2.006135, 1.834374, 1, 0, 0.1254902, 1,
2.083605, -0.8150446, 2.75262, 1, 0, 0.1215686, 1,
2.095139, -0.4648812, 0.743539, 1, 0, 0.1137255, 1,
2.11572, 0.2664296, 1.352324, 1, 0, 0.1098039, 1,
2.146655, -0.1418167, 2.155902, 1, 0, 0.1019608, 1,
2.173145, 0.5618262, 2.520324, 1, 0, 0.09411765, 1,
2.17945, -0.2288572, 2.368616, 1, 0, 0.09019608, 1,
2.184446, 0.2379767, 0.2205264, 1, 0, 0.08235294, 1,
2.327175, 1.855862, 1.915865, 1, 0, 0.07843138, 1,
2.358429, 0.5704525, 2.269608, 1, 0, 0.07058824, 1,
2.39693, -0.6132419, 1.907535, 1, 0, 0.06666667, 1,
2.438739, 0.5367417, 2.00363, 1, 0, 0.05882353, 1,
2.464709, -0.5092458, 2.938939, 1, 0, 0.05490196, 1,
2.475402, 0.6458459, 2.96598, 1, 0, 0.04705882, 1,
2.496294, -0.4064937, 2.806683, 1, 0, 0.04313726, 1,
2.544085, -2.110554, 4.309496, 1, 0, 0.03529412, 1,
2.707889, 2.103848, 0.7366212, 1, 0, 0.03137255, 1,
2.769974, 1.521143, -0.06521343, 1, 0, 0.02352941, 1,
2.813167, -0.09257661, 2.269071, 1, 0, 0.01960784, 1,
2.869315, -0.5902367, 0.755964, 1, 0, 0.01176471, 1,
3.535683, -0.7164501, 2.902505, 1, 0, 0.007843138, 1
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
0.04014444, -4.194322, -7.508831, 0, -0.5, 0.5, 0.5,
0.04014444, -4.194322, -7.508831, 1, -0.5, 0.5, 0.5,
0.04014444, -4.194322, -7.508831, 1, 1.5, 0.5, 0.5,
0.04014444, -4.194322, -7.508831, 0, 1.5, 0.5, 0.5
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
-4.640382, -0.238824, -7.508831, 0, -0.5, 0.5, 0.5,
-4.640382, -0.238824, -7.508831, 1, -0.5, 0.5, 0.5,
-4.640382, -0.238824, -7.508831, 1, 1.5, 0.5, 0.5,
-4.640382, -0.238824, -7.508831, 0, 1.5, 0.5, 0.5
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
-4.640382, -4.194322, 0.26333, 0, -0.5, 0.5, 0.5,
-4.640382, -4.194322, 0.26333, 1, -0.5, 0.5, 0.5,
-4.640382, -4.194322, 0.26333, 1, 1.5, 0.5, 0.5,
-4.640382, -4.194322, 0.26333, 0, 1.5, 0.5, 0.5
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
-3, -3.281515, -5.715255,
3, -3.281515, -5.715255,
-3, -3.281515, -5.715255,
-3, -3.433649, -6.014184,
-2, -3.281515, -5.715255,
-2, -3.433649, -6.014184,
-1, -3.281515, -5.715255,
-1, -3.433649, -6.014184,
0, -3.281515, -5.715255,
0, -3.433649, -6.014184,
1, -3.281515, -5.715255,
1, -3.433649, -6.014184,
2, -3.281515, -5.715255,
2, -3.433649, -6.014184,
3, -3.281515, -5.715255,
3, -3.433649, -6.014184
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
-3, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
-3, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
-3, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
-3, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
-2, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
-2, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
-2, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
-2, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
-1, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
-1, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
-1, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
-1, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
0, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
0, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
0, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
0, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
1, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
1, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
1, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
1, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
2, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
2, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
2, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
2, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5,
3, -3.737918, -6.612043, 0, -0.5, 0.5, 0.5,
3, -3.737918, -6.612043, 1, -0.5, 0.5, 0.5,
3, -3.737918, -6.612043, 1, 1.5, 0.5, 0.5,
3, -3.737918, -6.612043, 0, 1.5, 0.5, 0.5
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
-3.560261, -3, -5.715255,
-3.560261, 2, -5.715255,
-3.560261, -3, -5.715255,
-3.740281, -3, -6.014184,
-3.560261, -2, -5.715255,
-3.740281, -2, -6.014184,
-3.560261, -1, -5.715255,
-3.740281, -1, -6.014184,
-3.560261, 0, -5.715255,
-3.740281, 0, -6.014184,
-3.560261, 1, -5.715255,
-3.740281, 1, -6.014184,
-3.560261, 2, -5.715255,
-3.740281, 2, -6.014184
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
-4.100321, -3, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, -3, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, -3, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, -3, -6.612043, 0, 1.5, 0.5, 0.5,
-4.100321, -2, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, -2, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, -2, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, -2, -6.612043, 0, 1.5, 0.5, 0.5,
-4.100321, -1, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, -1, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, -1, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, -1, -6.612043, 0, 1.5, 0.5, 0.5,
-4.100321, 0, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, 0, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, 0, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, 0, -6.612043, 0, 1.5, 0.5, 0.5,
-4.100321, 1, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, 1, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, 1, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, 1, -6.612043, 0, 1.5, 0.5, 0.5,
-4.100321, 2, -6.612043, 0, -0.5, 0.5, 0.5,
-4.100321, 2, -6.612043, 1, -0.5, 0.5, 0.5,
-4.100321, 2, -6.612043, 1, 1.5, 0.5, 0.5,
-4.100321, 2, -6.612043, 0, 1.5, 0.5, 0.5
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
-3.560261, -3.281515, -4,
-3.560261, -3.281515, 6,
-3.560261, -3.281515, -4,
-3.740281, -3.433649, -4,
-3.560261, -3.281515, -2,
-3.740281, -3.433649, -2,
-3.560261, -3.281515, 0,
-3.740281, -3.433649, 0,
-3.560261, -3.281515, 2,
-3.740281, -3.433649, 2,
-3.560261, -3.281515, 4,
-3.740281, -3.433649, 4,
-3.560261, -3.281515, 6,
-3.740281, -3.433649, 6
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
-4.100321, -3.737918, -4, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, -4, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, -4, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, -4, 0, 1.5, 0.5, 0.5,
-4.100321, -3.737918, -2, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, -2, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, -2, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, -2, 0, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 0, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 0, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 0, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 0, 0, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 2, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 2, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 2, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 2, 0, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 4, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 4, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 4, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 4, 0, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 6, 0, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 6, 1, -0.5, 0.5, 0.5,
-4.100321, -3.737918, 6, 1, 1.5, 0.5, 0.5,
-4.100321, -3.737918, 6, 0, 1.5, 0.5, 0.5
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
-3.560261, -3.281515, -5.715255,
-3.560261, 2.803867, -5.715255,
-3.560261, -3.281515, 6.241915,
-3.560261, 2.803867, 6.241915,
-3.560261, -3.281515, -5.715255,
-3.560261, -3.281515, 6.241915,
-3.560261, 2.803867, -5.715255,
-3.560261, 2.803867, 6.241915,
-3.560261, -3.281515, -5.715255,
3.64055, -3.281515, -5.715255,
-3.560261, -3.281515, 6.241915,
3.64055, -3.281515, 6.241915,
-3.560261, 2.803867, -5.715255,
3.64055, 2.803867, -5.715255,
-3.560261, 2.803867, 6.241915,
3.64055, 2.803867, 6.241915,
3.64055, -3.281515, -5.715255,
3.64055, 2.803867, -5.715255,
3.64055, -3.281515, 6.241915,
3.64055, 2.803867, 6.241915,
3.64055, -3.281515, -5.715255,
3.64055, -3.281515, 6.241915,
3.64055, 2.803867, -5.715255,
3.64055, 2.803867, 6.241915
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
var radius = 8.130851;
var distance = 36.17508;
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
mvMatrix.translate( -0.04014444, 0.238824, -0.26333 );
mvMatrix.scale( 1.220868, 1.444648, 0.735227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.17508);
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
edifenphos<-read.table("edifenphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-edifenphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
y<-edifenphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
z<-edifenphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
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
-3.455395, 0.9560477, -2.46083, 0, 0, 1, 1, 1,
-3.36818, 0.6240203, -2.592601, 1, 0, 0, 1, 1,
-3.078001, -1.713769, -1.308773, 1, 0, 0, 1, 1,
-2.888311, -1.140671, -3.60805, 1, 0, 0, 1, 1,
-2.774063, -0.6242035, -1.298939, 1, 0, 0, 1, 1,
-2.693489, -1.568598, -2.388391, 1, 0, 0, 1, 1,
-2.49675, -0.5003887, -0.6168262, 0, 0, 0, 1, 1,
-2.494895, -1.309483, -0.2351099, 0, 0, 0, 1, 1,
-2.458381, 0.2968493, -0.884843, 0, 0, 0, 1, 1,
-2.416795, -0.410118, -0.4294141, 0, 0, 0, 1, 1,
-2.289176, 1.428491, 0.6871532, 0, 0, 0, 1, 1,
-2.282612, 1.006334, -0.633613, 0, 0, 0, 1, 1,
-2.271508, 0.9306836, -1.253595, 0, 0, 0, 1, 1,
-2.259284, -1.074581, -1.855124, 1, 1, 1, 1, 1,
-2.232036, 0.6740048, -2.447472, 1, 1, 1, 1, 1,
-2.197151, 0.7011144, -3.124259, 1, 1, 1, 1, 1,
-2.187023, -0.09055886, -2.164834, 1, 1, 1, 1, 1,
-2.18057, -0.1965327, -1.317443, 1, 1, 1, 1, 1,
-2.101239, 0.7380971, -0.9108925, 1, 1, 1, 1, 1,
-2.100417, -0.2728886, -2.525724, 1, 1, 1, 1, 1,
-2.045549, -1.07529, -0.1866817, 1, 1, 1, 1, 1,
-1.987343, -1.298916, -2.849082, 1, 1, 1, 1, 1,
-1.98717, 1.356506, -1.753897, 1, 1, 1, 1, 1,
-1.955011, -1.07867, -1.834263, 1, 1, 1, 1, 1,
-1.951583, -0.7477684, -1.273069, 1, 1, 1, 1, 1,
-1.942035, 1.168569, -0.6765461, 1, 1, 1, 1, 1,
-1.910221, -1.126714, -1.715225, 1, 1, 1, 1, 1,
-1.907645, -0.1492458, 0.4151604, 1, 1, 1, 1, 1,
-1.857641, -0.2701833, -0.04882727, 0, 0, 1, 1, 1,
-1.853251, -0.4369768, -1.521052, 1, 0, 0, 1, 1,
-1.835818, 2.715245, -0.1867153, 1, 0, 0, 1, 1,
-1.822548, -0.2649738, -0.8288989, 1, 0, 0, 1, 1,
-1.820614, -0.675093, -3.082999, 1, 0, 0, 1, 1,
-1.807327, 0.1698475, -2.295194, 1, 0, 0, 1, 1,
-1.802321, 0.07226369, -0.6515515, 0, 0, 0, 1, 1,
-1.758857, -1.601597, -4.338167, 0, 0, 0, 1, 1,
-1.739454, -1.628404, -0.3876359, 0, 0, 0, 1, 1,
-1.716183, 1.320256, -0.1664172, 0, 0, 0, 1, 1,
-1.687922, 0.1979662, -1.14102, 0, 0, 0, 1, 1,
-1.681323, -0.5389305, -2.219638, 0, 0, 0, 1, 1,
-1.67548, 0.8009617, -1.106082, 0, 0, 0, 1, 1,
-1.662424, -0.3252196, -1.448683, 1, 1, 1, 1, 1,
-1.661177, -0.07235029, -1.602483, 1, 1, 1, 1, 1,
-1.659208, -1.619347, -0.7850605, 1, 1, 1, 1, 1,
-1.653825, -0.855038, -2.68504, 1, 1, 1, 1, 1,
-1.638865, 1.460273, -2.040403, 1, 1, 1, 1, 1,
-1.638438, 0.5079137, 0.2946014, 1, 1, 1, 1, 1,
-1.633347, -0.8422793, -3.572144, 1, 1, 1, 1, 1,
-1.629014, -0.8202617, -1.86946, 1, 1, 1, 1, 1,
-1.617127, -1.402724, -1.985081, 1, 1, 1, 1, 1,
-1.616879, -0.2589781, -0.3440124, 1, 1, 1, 1, 1,
-1.606885, -1.131265, -3.511083, 1, 1, 1, 1, 1,
-1.600738, -1.230693, -1.547213, 1, 1, 1, 1, 1,
-1.591978, -0.5923908, -1.765585, 1, 1, 1, 1, 1,
-1.576601, 0.6052645, -0.6234326, 1, 1, 1, 1, 1,
-1.567981, -0.1732187, -1.876268, 1, 1, 1, 1, 1,
-1.565226, 1.193849, -0.9422546, 0, 0, 1, 1, 1,
-1.56419, -1.835226, -2.044607, 1, 0, 0, 1, 1,
-1.561986, -0.1361613, -1.310938, 1, 0, 0, 1, 1,
-1.561912, -2.217012, -3.232065, 1, 0, 0, 1, 1,
-1.559676, -0.5455934, -1.619422, 1, 0, 0, 1, 1,
-1.546725, -3.192893, -3.874012, 1, 0, 0, 1, 1,
-1.544773, -0.06681021, -3.687922, 0, 0, 0, 1, 1,
-1.544743, 2.307934, -1.412458, 0, 0, 0, 1, 1,
-1.531224, 0.6153644, -2.304141, 0, 0, 0, 1, 1,
-1.53079, 1.125703, 0.22734, 0, 0, 0, 1, 1,
-1.518822, -0.2279098, -1.460457, 0, 0, 0, 1, 1,
-1.507857, -0.8505487, -3.183802, 0, 0, 0, 1, 1,
-1.503524, -0.9771006, -4.207087, 0, 0, 0, 1, 1,
-1.503386, 1.019484, -0.7303986, 1, 1, 1, 1, 1,
-1.502973, 0.08259217, -3.066472, 1, 1, 1, 1, 1,
-1.485802, 0.307343, -0.3788306, 1, 1, 1, 1, 1,
-1.48007, 0.4203529, -1.379445, 1, 1, 1, 1, 1,
-1.469702, 0.5473703, -1.083639, 1, 1, 1, 1, 1,
-1.464094, 1.217988, -0.9916256, 1, 1, 1, 1, 1,
-1.453814, -0.1842225, -3.044339, 1, 1, 1, 1, 1,
-1.445197, 0.7020535, -1.725523, 1, 1, 1, 1, 1,
-1.437415, -0.1277328, -1.112874, 1, 1, 1, 1, 1,
-1.42676, 1.480492, 0.209934, 1, 1, 1, 1, 1,
-1.404582, -0.3783641, -2.394816, 1, 1, 1, 1, 1,
-1.370707, -0.1347335, -1.126679, 1, 1, 1, 1, 1,
-1.3694, 1.274874, -2.065656, 1, 1, 1, 1, 1,
-1.367312, -0.5146996, -3.031537, 1, 1, 1, 1, 1,
-1.366766, 0.8068856, 0.5984556, 1, 1, 1, 1, 1,
-1.36537, 0.4784552, -1.142611, 0, 0, 1, 1, 1,
-1.346229, -0.978452, -1.632136, 1, 0, 0, 1, 1,
-1.338889, 0.6869693, -0.8521301, 1, 0, 0, 1, 1,
-1.32793, -2.953255, -2.318038, 1, 0, 0, 1, 1,
-1.325881, 1.005568, -2.638336, 1, 0, 0, 1, 1,
-1.315125, -0.4692215, 0.03752974, 1, 0, 0, 1, 1,
-1.313893, -0.4198692, -1.529909, 0, 0, 0, 1, 1,
-1.312142, 1.296816, -1.485774, 0, 0, 0, 1, 1,
-1.299583, 1.475445, -0.8470407, 0, 0, 0, 1, 1,
-1.289302, -0.6848239, -2.007607, 0, 0, 0, 1, 1,
-1.28271, 0.0165742, -1.234475, 0, 0, 0, 1, 1,
-1.281095, -0.8802223, -2.622058, 0, 0, 0, 1, 1,
-1.278722, -1.243714, -4.626931, 0, 0, 0, 1, 1,
-1.2769, -1.340272, -3.584337, 1, 1, 1, 1, 1,
-1.270434, 1.387157, -2.051232, 1, 1, 1, 1, 1,
-1.270289, -1.09232, -3.51229, 1, 1, 1, 1, 1,
-1.254822, 1.449669, -0.5754145, 1, 1, 1, 1, 1,
-1.252899, -0.06759319, -0.7445437, 1, 1, 1, 1, 1,
-1.247826, -1.176463, -1.417217, 1, 1, 1, 1, 1,
-1.246903, -2.084477, -3.640237, 1, 1, 1, 1, 1,
-1.246271, 0.4372592, 0.3565104, 1, 1, 1, 1, 1,
-1.241445, -0.3839099, -1.025751, 1, 1, 1, 1, 1,
-1.237201, 0.5769686, 0.08589288, 1, 1, 1, 1, 1,
-1.230783, 0.5604916, -0.9276307, 1, 1, 1, 1, 1,
-1.220297, -0.09911459, -1.480862, 1, 1, 1, 1, 1,
-1.217219, -0.2713933, -1.934578, 1, 1, 1, 1, 1,
-1.217124, 1.136375, -1.139954, 1, 1, 1, 1, 1,
-1.216981, -0.0375696, -2.283122, 1, 1, 1, 1, 1,
-1.216795, 0.4094159, -0.9977801, 0, 0, 1, 1, 1,
-1.214797, -1.554206, -1.459741, 1, 0, 0, 1, 1,
-1.213331, 0.05287996, -1.612718, 1, 0, 0, 1, 1,
-1.183204, -0.49117, -1.395968, 1, 0, 0, 1, 1,
-1.183077, 0.7637268, -0.2058476, 1, 0, 0, 1, 1,
-1.177585, 0.5548972, -1.175441, 1, 0, 0, 1, 1,
-1.163152, -1.242121, -3.493722, 0, 0, 0, 1, 1,
-1.153373, -0.6600225, -2.615663, 0, 0, 0, 1, 1,
-1.15081, -0.3471305, -2.073856, 0, 0, 0, 1, 1,
-1.149192, -0.06040002, -4.170857, 0, 0, 0, 1, 1,
-1.145419, -1.157548, -0.3024867, 0, 0, 0, 1, 1,
-1.111488, 0.346862, -0.3460259, 0, 0, 0, 1, 1,
-1.096663, -1.098979, -2.596337, 0, 0, 0, 1, 1,
-1.092973, 0.5031886, -1.545567, 1, 1, 1, 1, 1,
-1.091175, 0.5197568, -0.1792567, 1, 1, 1, 1, 1,
-1.090312, 1.464213, -2.056845, 1, 1, 1, 1, 1,
-1.089419, -0.3163482, -1.054454, 1, 1, 1, 1, 1,
-1.086076, 0.3302416, -0.4368045, 1, 1, 1, 1, 1,
-1.085417, 2.056447, -1.386121, 1, 1, 1, 1, 1,
-1.074954, -0.111825, -1.583797, 1, 1, 1, 1, 1,
-1.07423, 1.007867, -1.582069, 1, 1, 1, 1, 1,
-1.073286, -2.144843, -4.28397, 1, 1, 1, 1, 1,
-1.071982, -1.672269, -2.678829, 1, 1, 1, 1, 1,
-1.066219, 1.498633, -0.9077718, 1, 1, 1, 1, 1,
-1.061447, 0.6253825, -1.87021, 1, 1, 1, 1, 1,
-1.060391, -0.6627054, -3.348343, 1, 1, 1, 1, 1,
-1.060154, 0.1854947, 0.6049339, 1, 1, 1, 1, 1,
-1.058519, 1.231171, 0.4214996, 1, 1, 1, 1, 1,
-1.058322, 1.402367, -0.9077145, 0, 0, 1, 1, 1,
-1.056911, -0.244266, -0.8799077, 1, 0, 0, 1, 1,
-1.048305, 0.2366071, -1.75071, 1, 0, 0, 1, 1,
-1.047786, -0.4608935, -2.440261, 1, 0, 0, 1, 1,
-1.0394, 0.05251076, -2.132931, 1, 0, 0, 1, 1,
-1.036095, 1.110062, 1.257267, 1, 0, 0, 1, 1,
-1.03417, -2.723574, -2.248434, 0, 0, 0, 1, 1,
-1.033379, -0.314582, -2.764894, 0, 0, 0, 1, 1,
-1.032481, -0.3534818, -2.308683, 0, 0, 0, 1, 1,
-1.031967, -0.2205878, -2.304434, 0, 0, 0, 1, 1,
-1.026557, 0.5211603, -0.659486, 0, 0, 0, 1, 1,
-1.024567, 2.326031, 0.906082, 0, 0, 0, 1, 1,
-1.021529, -0.02468688, -1.720723, 0, 0, 0, 1, 1,
-1.015258, -0.2250794, -0.9358946, 1, 1, 1, 1, 1,
-1.013555, 1.278067, 0.0348326, 1, 1, 1, 1, 1,
-1.011991, -1.002604, -3.911126, 1, 1, 1, 1, 1,
-1.008926, -0.1845278, -1.181267, 1, 1, 1, 1, 1,
-1.006551, 0.778761, -2.503959, 1, 1, 1, 1, 1,
-1.004455, 0.4481556, 0.5280255, 1, 1, 1, 1, 1,
-1.002998, -2.592898, -2.125889, 1, 1, 1, 1, 1,
-0.9958729, -1.334192, -3.417924, 1, 1, 1, 1, 1,
-0.9954389, 1.736101, -0.1356572, 1, 1, 1, 1, 1,
-0.9885895, 1.289656, -1.750589, 1, 1, 1, 1, 1,
-0.9883556, -0.8384472, -3.22333, 1, 1, 1, 1, 1,
-0.9843436, -0.7503611, -1.504856, 1, 1, 1, 1, 1,
-0.974766, 0.1370891, -0.7549157, 1, 1, 1, 1, 1,
-0.9740449, 0.03860273, -1.490401, 1, 1, 1, 1, 1,
-0.967, -0.02872756, -2.710479, 1, 1, 1, 1, 1,
-0.9649794, 0.02285685, -0.3141297, 0, 0, 1, 1, 1,
-0.9631575, 0.3677076, -2.705383, 1, 0, 0, 1, 1,
-0.9556016, -0.5008259, -3.648944, 1, 0, 0, 1, 1,
-0.9538396, -0.04250376, -1.769796, 1, 0, 0, 1, 1,
-0.9529024, 0.1330813, -2.072376, 1, 0, 0, 1, 1,
-0.9484385, -0.7903349, -4.005429, 1, 0, 0, 1, 1,
-0.9475664, 0.8165841, -0.01308701, 0, 0, 0, 1, 1,
-0.9465017, -0.8586496, -3.177055, 0, 0, 0, 1, 1,
-0.9454916, 0.4019669, -3.935426, 0, 0, 0, 1, 1,
-0.9452714, -0.08470064, -1.408279, 0, 0, 0, 1, 1,
-0.9432389, 0.5272672, -1.052235, 0, 0, 0, 1, 1,
-0.9394753, -1.1284, -3.410859, 0, 0, 0, 1, 1,
-0.9231619, -0.3717829, -1.651997, 0, 0, 0, 1, 1,
-0.9227315, 0.3161263, -0.8037655, 1, 1, 1, 1, 1,
-0.9196579, -0.1945237, -1.191931, 1, 1, 1, 1, 1,
-0.9147713, 0.5314586, -2.430219, 1, 1, 1, 1, 1,
-0.9121121, -0.2530256, -0.4631001, 1, 1, 1, 1, 1,
-0.9049345, -1.096172, -0.7151129, 1, 1, 1, 1, 1,
-0.8952804, 1.465818, 0.3229007, 1, 1, 1, 1, 1,
-0.8921303, -0.5460423, -1.959435, 1, 1, 1, 1, 1,
-0.8877441, -0.9985998, -2.220831, 1, 1, 1, 1, 1,
-0.8842762, 0.4786455, -0.5668134, 1, 1, 1, 1, 1,
-0.8747817, -1.563794, -2.981777, 1, 1, 1, 1, 1,
-0.8732693, 1.085374, -1.716792, 1, 1, 1, 1, 1,
-0.8694191, 0.2649932, -0.5556778, 1, 1, 1, 1, 1,
-0.8684359, -0.2526781, -3.473159, 1, 1, 1, 1, 1,
-0.8665065, 1.473947, 0.07101794, 1, 1, 1, 1, 1,
-0.8626987, -0.1017945, -1.549698, 1, 1, 1, 1, 1,
-0.8617132, 0.7194709, -0.2012761, 0, 0, 1, 1, 1,
-0.8609635, 0.7132512, -0.7640131, 1, 0, 0, 1, 1,
-0.8600678, -0.5553758, -0.9513932, 1, 0, 0, 1, 1,
-0.8499483, 2.178927, 0.952459, 1, 0, 0, 1, 1,
-0.849332, 1.847526, -0.4076461, 1, 0, 0, 1, 1,
-0.8487555, 0.8090464, 0.3669861, 1, 0, 0, 1, 1,
-0.8447232, -1.200482, -3.722242, 0, 0, 0, 1, 1,
-0.8432818, -0.138047, -1.235652, 0, 0, 0, 1, 1,
-0.8428282, -0.03994074, -0.2007647, 0, 0, 0, 1, 1,
-0.8395499, -0.7460442, -1.197514, 0, 0, 0, 1, 1,
-0.8240495, -0.1914184, -1.13909, 0, 0, 0, 1, 1,
-0.8211007, -0.954538, -0.8047116, 0, 0, 0, 1, 1,
-0.8163988, -0.2242032, -2.40648, 0, 0, 0, 1, 1,
-0.8155498, 0.9251588, 0.1891642, 1, 1, 1, 1, 1,
-0.8102398, 1.52123, -1.953109, 1, 1, 1, 1, 1,
-0.8054791, -0.6965638, -2.220972, 1, 1, 1, 1, 1,
-0.8051494, 0.9985402, -1.606746, 1, 1, 1, 1, 1,
-0.8014988, -0.6547145, -2.297444, 1, 1, 1, 1, 1,
-0.7959569, 0.0777348, -2.236803, 1, 1, 1, 1, 1,
-0.7912751, 1.285133, -1.539716, 1, 1, 1, 1, 1,
-0.7906174, 0.5746583, 0.7500634, 1, 1, 1, 1, 1,
-0.7879419, 0.4169997, -1.947886, 1, 1, 1, 1, 1,
-0.7864386, 0.4698874, -0.1232346, 1, 1, 1, 1, 1,
-0.7841283, 0.5641246, -0.5126634, 1, 1, 1, 1, 1,
-0.7783874, 0.9193617, -0.4116488, 1, 1, 1, 1, 1,
-0.7776333, 1.64221, 0.1436042, 1, 1, 1, 1, 1,
-0.7757363, -0.3543856, 0.3913813, 1, 1, 1, 1, 1,
-0.7722016, 0.7191347, -1.311093, 1, 1, 1, 1, 1,
-0.7582842, 1.138142, -1.056726, 0, 0, 1, 1, 1,
-0.7540754, -0.07353243, -0.8524762, 1, 0, 0, 1, 1,
-0.7480286, 0.9373038, -1.315186, 1, 0, 0, 1, 1,
-0.7472971, 0.1258018, -3.349921, 1, 0, 0, 1, 1,
-0.7457024, -0.1692936, -0.8333449, 1, 0, 0, 1, 1,
-0.7453353, -0.1272299, -2.352011, 1, 0, 0, 1, 1,
-0.7438315, 1.262345, 0.6598755, 0, 0, 0, 1, 1,
-0.7420262, -0.2459485, -2.201849, 0, 0, 0, 1, 1,
-0.7414197, 0.3417668, -0.9268096, 0, 0, 0, 1, 1,
-0.7401623, 0.6411993, -0.8673197, 0, 0, 0, 1, 1,
-0.7374157, 0.666134, -1.090674, 0, 0, 0, 1, 1,
-0.7330198, -1.424306, -1.015365, 0, 0, 0, 1, 1,
-0.7274656, 2.537628, 0.8256293, 0, 0, 0, 1, 1,
-0.7173454, 0.1375411, -1.075695, 1, 1, 1, 1, 1,
-0.7097931, 1.425985, -1.602583, 1, 1, 1, 1, 1,
-0.7028338, -0.8058984, -1.878429, 1, 1, 1, 1, 1,
-0.698901, 0.9368002, -1.279433, 1, 1, 1, 1, 1,
-0.698284, 1.033976, 0.2267844, 1, 1, 1, 1, 1,
-0.6863526, -0.3131953, -0.9469675, 1, 1, 1, 1, 1,
-0.6852772, 0.57664, -0.6351523, 1, 1, 1, 1, 1,
-0.6841554, 0.6574882, -0.6974787, 1, 1, 1, 1, 1,
-0.6837197, 0.9817684, -0.3908628, 1, 1, 1, 1, 1,
-0.6825802, -1.265839, -3.706747, 1, 1, 1, 1, 1,
-0.677143, 0.403243, -1.489604, 1, 1, 1, 1, 1,
-0.6757011, -1.45972, -3.474895, 1, 1, 1, 1, 1,
-0.6738267, 1.588989, 0.1415547, 1, 1, 1, 1, 1,
-0.6738002, 0.9595731, -1.344967, 1, 1, 1, 1, 1,
-0.6674661, -0.36815, -3.619287, 1, 1, 1, 1, 1,
-0.6673043, 0.7115302, 0.1218485, 0, 0, 1, 1, 1,
-0.6655347, -0.8264385, -0.5641513, 1, 0, 0, 1, 1,
-0.6605105, -0.9606063, -2.740909, 1, 0, 0, 1, 1,
-0.6596752, -0.0633477, -1.21048, 1, 0, 0, 1, 1,
-0.6583369, 0.4126471, -2.424411, 1, 0, 0, 1, 1,
-0.6552979, 1.808475, -0.4998203, 1, 0, 0, 1, 1,
-0.6496323, -0.3483844, -2.407836, 0, 0, 0, 1, 1,
-0.6472282, 0.1117959, -2.961692, 0, 0, 0, 1, 1,
-0.6448527, 1.434834, -1.338385, 0, 0, 0, 1, 1,
-0.6448016, -0.4092848, -3.775259, 0, 0, 0, 1, 1,
-0.6443902, 1.504859, 0.9288618, 0, 0, 0, 1, 1,
-0.6392353, 2.13302, -0.3295937, 0, 0, 0, 1, 1,
-0.629266, 0.06940249, -1.274838, 0, 0, 0, 1, 1,
-0.6231495, 1.802893, 0.14579, 1, 1, 1, 1, 1,
-0.6201469, 0.4683747, -1.617596, 1, 1, 1, 1, 1,
-0.614849, -0.2545574, -2.48539, 1, 1, 1, 1, 1,
-0.6086236, 0.302346, -0.5617976, 1, 1, 1, 1, 1,
-0.6078528, 0.1673965, -0.511444, 1, 1, 1, 1, 1,
-0.60616, 1.715025, -0.3532055, 1, 1, 1, 1, 1,
-0.5950948, -0.4256001, -2.023533, 1, 1, 1, 1, 1,
-0.5935315, -0.2889999, -0.4605329, 1, 1, 1, 1, 1,
-0.5921307, -0.03636934, -0.7488071, 1, 1, 1, 1, 1,
-0.589076, 2.021898, 1.617478, 1, 1, 1, 1, 1,
-0.5859416, -0.2199394, -1.377052, 1, 1, 1, 1, 1,
-0.5856902, -0.9961359, -4.006797, 1, 1, 1, 1, 1,
-0.5843924, 0.9582241, -0.6202092, 1, 1, 1, 1, 1,
-0.5837097, -1.379509, -0.9062353, 1, 1, 1, 1, 1,
-0.5807963, -0.5863327, -0.8505418, 1, 1, 1, 1, 1,
-0.5801745, 0.5727177, -1.10642, 0, 0, 1, 1, 1,
-0.5776322, 0.3979837, -1.716402, 1, 0, 0, 1, 1,
-0.5770214, 0.1472956, -2.276865, 1, 0, 0, 1, 1,
-0.5761892, 0.4072892, -3.053806, 1, 0, 0, 1, 1,
-0.5744563, 1.262929, -0.5755829, 1, 0, 0, 1, 1,
-0.5712431, -1.857413, -3.970491, 1, 0, 0, 1, 1,
-0.5642555, -1.87398, -0.6328182, 0, 0, 0, 1, 1,
-0.5574392, 0.8566483, -1.829513, 0, 0, 0, 1, 1,
-0.5558047, 0.3619944, -1.351511, 0, 0, 0, 1, 1,
-0.5470071, -0.9510978, -2.980555, 0, 0, 0, 1, 1,
-0.5454382, -1.181292, -2.839868, 0, 0, 0, 1, 1,
-0.542803, -0.9388256, -3.033771, 0, 0, 0, 1, 1,
-0.5378703, -1.156213, -3.070142, 0, 0, 0, 1, 1,
-0.5364799, -2.842339, -1.362599, 1, 1, 1, 1, 1,
-0.5361454, -1.840529, -0.664978, 1, 1, 1, 1, 1,
-0.5304871, -0.5027034, -3.090601, 1, 1, 1, 1, 1,
-0.529964, 0.585867, -1.406693, 1, 1, 1, 1, 1,
-0.5275601, 0.435526, -0.8798073, 1, 1, 1, 1, 1,
-0.5265169, -0.7577299, -1.688357, 1, 1, 1, 1, 1,
-0.5175372, 0.468896, -3.382958, 1, 1, 1, 1, 1,
-0.5162978, -1.632489, -1.672898, 1, 1, 1, 1, 1,
-0.5111601, -0.03327668, -0.4260164, 1, 1, 1, 1, 1,
-0.5107848, -0.512577, -3.46862, 1, 1, 1, 1, 1,
-0.5062266, -1.515569, -4.254772, 1, 1, 1, 1, 1,
-0.5022984, 1.048105, -0.3799999, 1, 1, 1, 1, 1,
-0.4944799, -0.7372715, -3.552531, 1, 1, 1, 1, 1,
-0.4904922, 0.5872435, -0.2012735, 1, 1, 1, 1, 1,
-0.488391, -0.817291, -1.551663, 1, 1, 1, 1, 1,
-0.4868478, 0.2439331, 0.05842913, 0, 0, 1, 1, 1,
-0.485912, 0.04556724, -3.59043, 1, 0, 0, 1, 1,
-0.4852817, 0.3486784, -0.737607, 1, 0, 0, 1, 1,
-0.4829407, 0.3593111, -0.9682291, 1, 0, 0, 1, 1,
-0.4826616, 1.382904, -1.301671, 1, 0, 0, 1, 1,
-0.4765068, -1.029792, -2.747294, 1, 0, 0, 1, 1,
-0.4709409, -1.245821, -3.604353, 0, 0, 0, 1, 1,
-0.4704222, 0.5236677, 0.3686022, 0, 0, 0, 1, 1,
-0.4613065, 1.130889, -2.143216, 0, 0, 0, 1, 1,
-0.4603813, 1.416698, -0.4673559, 0, 0, 0, 1, 1,
-0.4587043, -1.367144, -3.889955, 0, 0, 0, 1, 1,
-0.4586687, -0.3965008, -0.7717789, 0, 0, 0, 1, 1,
-0.4580949, -0.9126864, -2.162564, 0, 0, 0, 1, 1,
-0.4576892, 1.436815, 0.3450357, 1, 1, 1, 1, 1,
-0.4555261, 0.187412, 1.219898, 1, 1, 1, 1, 1,
-0.4526005, -1.412351, -2.731624, 1, 1, 1, 1, 1,
-0.4497652, -0.7283362, -3.931963, 1, 1, 1, 1, 1,
-0.4329067, 0.81432, -0.4153054, 1, 1, 1, 1, 1,
-0.4312025, 1.255995, 0.1421518, 1, 1, 1, 1, 1,
-0.4305602, 0.319829, -0.6517659, 1, 1, 1, 1, 1,
-0.4268957, -0.3094951, -1.214824, 1, 1, 1, 1, 1,
-0.4265533, 1.564532, -2.086288, 1, 1, 1, 1, 1,
-0.4206085, -0.5939851, -3.364413, 1, 1, 1, 1, 1,
-0.4200771, 0.2241487, -2.817712, 1, 1, 1, 1, 1,
-0.4199612, -0.2986614, -2.667677, 1, 1, 1, 1, 1,
-0.4196405, -0.5814418, -3.413703, 1, 1, 1, 1, 1,
-0.4175166, 0.8599414, 0.5626125, 1, 1, 1, 1, 1,
-0.4160026, 0.6188415, -0.6857069, 1, 1, 1, 1, 1,
-0.4136882, 0.2678597, -0.02381539, 0, 0, 1, 1, 1,
-0.4101277, 1.065593, 1.17369, 1, 0, 0, 1, 1,
-0.4072693, -0.08037728, -1.648879, 1, 0, 0, 1, 1,
-0.4050104, -1.152696, -2.463946, 1, 0, 0, 1, 1,
-0.4048821, 0.3005573, -0.9339556, 1, 0, 0, 1, 1,
-0.4048518, 0.15252, -1.348111, 1, 0, 0, 1, 1,
-0.3963535, 0.2559207, 2.108851, 0, 0, 0, 1, 1,
-0.3939283, 0.9264473, 0.275286, 0, 0, 0, 1, 1,
-0.3913861, 1.760053, -0.5624318, 0, 0, 0, 1, 1,
-0.3891996, 0.3548354, -1.200701, 0, 0, 0, 1, 1,
-0.3882374, 0.2904485, 2.337666, 0, 0, 0, 1, 1,
-0.386208, -0.8978651, -2.883583, 0, 0, 0, 1, 1,
-0.3826887, 0.04272145, -2.249783, 0, 0, 0, 1, 1,
-0.3807105, 1.085841, 0.09418116, 1, 1, 1, 1, 1,
-0.372327, 1.524852, 1.758661, 1, 1, 1, 1, 1,
-0.3722785, -1.784324, -2.818102, 1, 1, 1, 1, 1,
-0.3706738, 0.3748769, 0.2786718, 1, 1, 1, 1, 1,
-0.369325, -1.401311, -2.830591, 1, 1, 1, 1, 1,
-0.3681444, -0.204201, -2.241773, 1, 1, 1, 1, 1,
-0.3656102, 0.6516407, -1.246162, 1, 1, 1, 1, 1,
-0.3599919, -0.3793898, -2.166523, 1, 1, 1, 1, 1,
-0.3581358, -1.432914, -3.313671, 1, 1, 1, 1, 1,
-0.3551376, -0.9208337, -2.450169, 1, 1, 1, 1, 1,
-0.354247, -0.6782929, -3.522838, 1, 1, 1, 1, 1,
-0.353158, 0.8231928, 0.5131825, 1, 1, 1, 1, 1,
-0.3461897, -0.6686588, -3.365042, 1, 1, 1, 1, 1,
-0.3458605, -0.7394103, -1.275041, 1, 1, 1, 1, 1,
-0.3430503, -1.174311, -4.655443, 1, 1, 1, 1, 1,
-0.3427996, 0.6649783, -2.556705, 0, 0, 1, 1, 1,
-0.342123, 2.671495, -0.3960128, 1, 0, 0, 1, 1,
-0.3375761, -0.2189569, -3.31301, 1, 0, 0, 1, 1,
-0.3340848, 2.101612, 1.034148, 1, 0, 0, 1, 1,
-0.3283634, -1.80395, -2.916086, 1, 0, 0, 1, 1,
-0.3260784, 0.2151299, -0.9341866, 1, 0, 0, 1, 1,
-0.3235838, -0.4684933, -2.505981, 0, 0, 0, 1, 1,
-0.3211091, -0.374644, -1.34309, 0, 0, 0, 1, 1,
-0.3048989, 1.324916, -0.49742, 0, 0, 0, 1, 1,
-0.2935253, 0.3247946, -2.170004, 0, 0, 0, 1, 1,
-0.2929697, -1.136716, -2.742813, 0, 0, 0, 1, 1,
-0.2861469, -1.885136, -1.580976, 0, 0, 0, 1, 1,
-0.2828305, -0.006933056, -1.054109, 0, 0, 0, 1, 1,
-0.2825138, -0.17236, -1.811447, 1, 1, 1, 1, 1,
-0.2808217, 0.7896752, -1.617419, 1, 1, 1, 1, 1,
-0.2754734, -0.1649344, -1.098989, 1, 1, 1, 1, 1,
-0.2725795, -0.8949953, -5.541121, 1, 1, 1, 1, 1,
-0.2724126, -0.05388587, -1.069455, 1, 1, 1, 1, 1,
-0.2693237, -0.5131694, -3.052809, 1, 1, 1, 1, 1,
-0.2673527, 1.309977, 0.5625566, 1, 1, 1, 1, 1,
-0.2666126, -0.43896, -2.734738, 1, 1, 1, 1, 1,
-0.2632546, 0.2669835, -2.546543, 1, 1, 1, 1, 1,
-0.2632454, 0.3803137, 1.156322, 1, 1, 1, 1, 1,
-0.2608667, -0.3711759, -3.121508, 1, 1, 1, 1, 1,
-0.2580531, -0.1024932, -2.499096, 1, 1, 1, 1, 1,
-0.256783, 1.067999, 1.000596, 1, 1, 1, 1, 1,
-0.252882, 0.3888216, -1.946966, 1, 1, 1, 1, 1,
-0.2508429, 0.07739193, 0.9452786, 1, 1, 1, 1, 1,
-0.2508376, -1.392753, -2.193595, 0, 0, 1, 1, 1,
-0.2473386, -1.307793, -2.643559, 1, 0, 0, 1, 1,
-0.2473207, -0.5370312, -3.316916, 1, 0, 0, 1, 1,
-0.2437937, -0.8348174, -2.274443, 1, 0, 0, 1, 1,
-0.243078, 0.6080894, -0.9891474, 1, 0, 0, 1, 1,
-0.2424378, 0.03010431, -1.050222, 1, 0, 0, 1, 1,
-0.2407897, -0.4143447, -2.934227, 0, 0, 0, 1, 1,
-0.2404103, -0.5232391, -3.588043, 0, 0, 0, 1, 1,
-0.239379, -0.7418383, -2.33188, 0, 0, 0, 1, 1,
-0.237418, 1.204211, 1.340703, 0, 0, 0, 1, 1,
-0.2315654, -0.1962906, -1.074459, 0, 0, 0, 1, 1,
-0.2314407, 0.1587661, -0.3855662, 0, 0, 0, 1, 1,
-0.2264126, 0.9501169, 0.2195033, 0, 0, 0, 1, 1,
-0.2228424, 0.7699573, -0.06449529, 1, 1, 1, 1, 1,
-0.2196711, -0.2815382, -0.03395533, 1, 1, 1, 1, 1,
-0.2182716, -0.8675952, -3.03286, 1, 1, 1, 1, 1,
-0.205726, 0.03145413, -2.706719, 1, 1, 1, 1, 1,
-0.1985074, 0.2463311, -1.073625, 1, 1, 1, 1, 1,
-0.1941181, 2.663269, -2.049165, 1, 1, 1, 1, 1,
-0.1940182, -0.3901319, -3.711224, 1, 1, 1, 1, 1,
-0.1922466, 0.560622, -0.9196323, 1, 1, 1, 1, 1,
-0.1897722, 1.811881, -0.9417036, 1, 1, 1, 1, 1,
-0.1880404, -0.5001445, -3.477022, 1, 1, 1, 1, 1,
-0.1862502, 0.4843726, -0.8012609, 1, 1, 1, 1, 1,
-0.1856852, -0.4426743, -0.8712506, 1, 1, 1, 1, 1,
-0.1847894, 0.2307018, -2.038316, 1, 1, 1, 1, 1,
-0.1812741, 0.7097932, -0.6323333, 1, 1, 1, 1, 1,
-0.1805649, -0.1262679, -3.827588, 1, 1, 1, 1, 1,
-0.178248, 0.2245948, -3.193191, 0, 0, 1, 1, 1,
-0.1753833, 0.8720861, -1.35514, 1, 0, 0, 1, 1,
-0.1732032, -2.430261, -4.135569, 1, 0, 0, 1, 1,
-0.1667388, -1.005752, -2.423084, 1, 0, 0, 1, 1,
-0.1625737, -1.083617, -1.963579, 1, 0, 0, 1, 1,
-0.1537076, -0.7878441, -2.146622, 1, 0, 0, 1, 1,
-0.1534834, -0.867181, -2.856565, 0, 0, 0, 1, 1,
-0.1525999, 1.031026, -0.133513, 0, 0, 0, 1, 1,
-0.1503294, 0.6353167, -0.1022874, 0, 0, 0, 1, 1,
-0.1474683, -1.54701, -3.717374, 0, 0, 0, 1, 1,
-0.146733, 0.3890428, -0.4795789, 0, 0, 0, 1, 1,
-0.1457956, -0.1175951, -2.110671, 0, 0, 0, 1, 1,
-0.1453998, 0.7772225, 0.03828726, 0, 0, 0, 1, 1,
-0.143403, -0.7142179, -2.898116, 1, 1, 1, 1, 1,
-0.1413727, -0.1186545, -2.730078, 1, 1, 1, 1, 1,
-0.1392058, -1.338088, -4.629622, 1, 1, 1, 1, 1,
-0.1344459, -0.2796977, -2.179269, 1, 1, 1, 1, 1,
-0.133399, -0.7499747, -2.646741, 1, 1, 1, 1, 1,
-0.1316182, -0.4514786, -3.636994, 1, 1, 1, 1, 1,
-0.1290565, 0.4972835, -0.7702582, 1, 1, 1, 1, 1,
-0.1252115, 1.018981, -1.983067, 1, 1, 1, 1, 1,
-0.1249972, 0.0888073, -0.1697195, 1, 1, 1, 1, 1,
-0.1242526, 1.723002, -1.700949, 1, 1, 1, 1, 1,
-0.1193739, -0.1256961, -1.439012, 1, 1, 1, 1, 1,
-0.1170688, -1.134748, -3.803334, 1, 1, 1, 1, 1,
-0.1168992, 0.1755787, -1.712935, 1, 1, 1, 1, 1,
-0.1130814, -0.5719393, -0.7456009, 1, 1, 1, 1, 1,
-0.1066264, 0.4245033, 0.0133177, 1, 1, 1, 1, 1,
-0.1052326, 0.1653493, -0.5341665, 0, 0, 1, 1, 1,
-0.1049108, -0.6916958, -2.860271, 1, 0, 0, 1, 1,
-0.1048309, 0.7534221, -0.1826714, 1, 0, 0, 1, 1,
-0.1026712, -0.2027004, -2.884917, 1, 0, 0, 1, 1,
-0.1023818, -0.3985627, -4.04705, 1, 0, 0, 1, 1,
-0.1023101, 0.07148049, -0.2920774, 1, 0, 0, 1, 1,
-0.1016482, -1.161439, -2.737876, 0, 0, 0, 1, 1,
-0.08892184, -0.6808895, -3.835616, 0, 0, 0, 1, 1,
-0.08847228, -2.006954, -3.564765, 0, 0, 0, 1, 1,
-0.08125439, 0.497382, -0.4059623, 0, 0, 0, 1, 1,
-0.08101594, 2.402427, 1.118029, 0, 0, 0, 1, 1,
-0.08076058, 1.043427, -0.1246548, 0, 0, 0, 1, 1,
-0.08032486, 0.7983644, -0.1766289, 0, 0, 0, 1, 1,
-0.07933639, -0.5814543, -2.542953, 1, 1, 1, 1, 1,
-0.06922039, -0.4240431, -0.6418211, 1, 1, 1, 1, 1,
-0.06748628, -0.1176659, -2.14362, 1, 1, 1, 1, 1,
-0.06457662, -1.858984, -2.813946, 1, 1, 1, 1, 1,
-0.06409644, -0.7734241, -2.482877, 1, 1, 1, 1, 1,
-0.06296489, 0.1065538, -0.298064, 1, 1, 1, 1, 1,
-0.06042419, 0.302406, -0.2380284, 1, 1, 1, 1, 1,
-0.05926885, 0.3984333, 0.142811, 1, 1, 1, 1, 1,
-0.056875, 0.1430144, -0.7973835, 1, 1, 1, 1, 1,
-0.05442257, 0.7877133, 0.9703831, 1, 1, 1, 1, 1,
-0.05165417, 1.926703, 1.462921, 1, 1, 1, 1, 1,
-0.05056067, -0.8169968, -3.994877, 1, 1, 1, 1, 1,
-0.05005169, 0.04826331, -0.4321897, 1, 1, 1, 1, 1,
-0.04669035, -0.3323232, -2.832423, 1, 1, 1, 1, 1,
-0.04559435, 1.219994, -0.7305315, 1, 1, 1, 1, 1,
-0.04048841, -1.22463, -2.303076, 0, 0, 1, 1, 1,
-0.03719323, 0.2646274, -1.333326, 1, 0, 0, 1, 1,
-0.03592392, -0.7146814, -1.890359, 1, 0, 0, 1, 1,
-0.03424925, 2.105217, 0.291509, 1, 0, 0, 1, 1,
-0.03172415, 1.62315, -0.4266196, 1, 0, 0, 1, 1,
-0.03122661, 1.223957, -0.1035303, 1, 0, 0, 1, 1,
-0.03100251, 0.5503454, -0.2325342, 0, 0, 0, 1, 1,
-0.02780663, -0.9317731, -1.18845, 0, 0, 0, 1, 1,
-0.02776671, -0.8583866, -3.105868, 0, 0, 0, 1, 1,
-0.0198811, 0.962403, 0.1707671, 0, 0, 0, 1, 1,
-0.01882307, 0.2985985, -2.318374, 0, 0, 0, 1, 1,
-0.01627641, -1.034307, -3.510055, 0, 0, 0, 1, 1,
-0.01562349, 1.461917, 2.224675, 0, 0, 0, 1, 1,
-0.01330839, 0.5688559, -0.5960248, 1, 1, 1, 1, 1,
-0.01063886, 0.398966, 0.6525483, 1, 1, 1, 1, 1,
-0.009733917, 0.1378697, -1.0854, 1, 1, 1, 1, 1,
-0.009144944, -0.3049543, -3.879597, 1, 1, 1, 1, 1,
-0.007770692, 0.1623646, 0.8943585, 1, 1, 1, 1, 1,
-0.006651374, 0.2745483, 0.1507367, 1, 1, 1, 1, 1,
-0.003006437, 0.9856885, -1.190276, 1, 1, 1, 1, 1,
-0.0007254698, 0.4147204, -0.01705163, 1, 1, 1, 1, 1,
0.0001518904, -0.02086871, 2.754133, 1, 1, 1, 1, 1,
0.00244257, -1.770492, 1.943041, 1, 1, 1, 1, 1,
0.003961976, -0.3172417, 4.477338, 1, 1, 1, 1, 1,
0.004165227, -1.253566, 3.152962, 1, 1, 1, 1, 1,
0.007120038, -1.549614, 1.950737, 1, 1, 1, 1, 1,
0.01908674, 0.5332754, -1.486584, 1, 1, 1, 1, 1,
0.02506765, 0.828111, -0.440372, 1, 1, 1, 1, 1,
0.03340054, -0.2559173, 3.70215, 0, 0, 1, 1, 1,
0.03709197, 0.1358312, 0.8451592, 1, 0, 0, 1, 1,
0.04353261, 0.03118349, 0.7478701, 1, 0, 0, 1, 1,
0.04586707, -0.09861668, 3.610168, 1, 0, 0, 1, 1,
0.04642386, 1.429614, -0.2035561, 1, 0, 0, 1, 1,
0.04662915, -1.538581, 3.044774, 1, 0, 0, 1, 1,
0.0519471, 0.2632209, 0.7194118, 0, 0, 0, 1, 1,
0.05747763, 0.1849773, 0.08455206, 0, 0, 0, 1, 1,
0.05894053, -0.7818849, 4.159712, 0, 0, 0, 1, 1,
0.06173057, 0.3160724, 0.6443665, 0, 0, 0, 1, 1,
0.06193371, 0.8427028, -1.284762, 0, 0, 0, 1, 1,
0.06270522, -0.07308905, 3.264601, 0, 0, 0, 1, 1,
0.0654272, -1.458388, 4.232927, 0, 0, 0, 1, 1,
0.07092053, -0.8986918, 1.892008, 1, 1, 1, 1, 1,
0.07269822, 0.83847, 1.617098, 1, 1, 1, 1, 1,
0.07450959, -0.9332967, 3.772454, 1, 1, 1, 1, 1,
0.07536464, 1.402585, 0.4632329, 1, 1, 1, 1, 1,
0.07712631, 1.879497, 0.1542615, 1, 1, 1, 1, 1,
0.08375056, -0.6681635, 6.067781, 1, 1, 1, 1, 1,
0.08656939, -0.3222184, 2.482983, 1, 1, 1, 1, 1,
0.0877438, -0.8134902, 3.935966, 1, 1, 1, 1, 1,
0.08950053, -0.2185698, 2.297756, 1, 1, 1, 1, 1,
0.09183982, 0.345158, 0.8871377, 1, 1, 1, 1, 1,
0.09438619, -0.8078699, 3.884963, 1, 1, 1, 1, 1,
0.09929872, -0.02208212, 1.09193, 1, 1, 1, 1, 1,
0.1035341, -1.321954, 0.7213686, 1, 1, 1, 1, 1,
0.1068616, 0.3453205, 0.2560233, 1, 1, 1, 1, 1,
0.1078612, -0.4126667, 4.458317, 1, 1, 1, 1, 1,
0.1082499, -0.2853942, 2.172405, 0, 0, 1, 1, 1,
0.1088646, 0.1438808, 0.2655261, 1, 0, 0, 1, 1,
0.1093875, -0.3529243, 3.578913, 1, 0, 0, 1, 1,
0.1098359, -0.663843, 4.116666, 1, 0, 0, 1, 1,
0.1106762, -0.7375404, 4.74885, 1, 0, 0, 1, 1,
0.1144322, 0.2380165, 1.890024, 1, 0, 0, 1, 1,
0.1159046, 1.027033, 0.0309637, 0, 0, 0, 1, 1,
0.1181452, 0.441324, 1.502078, 0, 0, 0, 1, 1,
0.1211319, -0.4810704, 2.860715, 0, 0, 0, 1, 1,
0.1226583, 0.6818643, -0.1085754, 0, 0, 0, 1, 1,
0.1324968, -0.7510702, 5.387493, 0, 0, 0, 1, 1,
0.1326055, 0.08182077, -0.2338181, 0, 0, 0, 1, 1,
0.1334154, 0.9885356, 0.01976307, 0, 0, 0, 1, 1,
0.1409058, 0.6427575, -1.569532, 1, 1, 1, 1, 1,
0.14098, 1.838679, 0.5877215, 1, 1, 1, 1, 1,
0.1430093, -0.3913522, 2.489541, 1, 1, 1, 1, 1,
0.14429, 0.2697852, 1.389463, 1, 1, 1, 1, 1,
0.1474349, 0.140442, -0.7864115, 1, 1, 1, 1, 1,
0.1511612, -0.1234941, 1.318868, 1, 1, 1, 1, 1,
0.1533078, 1.093467, 1.824762, 1, 1, 1, 1, 1,
0.1533463, -1.171161, 3.152992, 1, 1, 1, 1, 1,
0.1593005, 0.07017457, 0.07514691, 1, 1, 1, 1, 1,
0.1621547, -1.140676, 4.03631, 1, 1, 1, 1, 1,
0.1678891, -0.3770918, 3.299892, 1, 1, 1, 1, 1,
0.1685013, 1.155015, -1.003494, 1, 1, 1, 1, 1,
0.1685373, -0.6174506, 3.194582, 1, 1, 1, 1, 1,
0.1730748, 0.6974828, 1.503266, 1, 1, 1, 1, 1,
0.1757226, 0.9848648, -1.546939, 1, 1, 1, 1, 1,
0.1766204, 0.5150045, 0.3219358, 0, 0, 1, 1, 1,
0.176721, -0.8767815, 1.983148, 1, 0, 0, 1, 1,
0.1774604, 1.305765, 0.8624402, 1, 0, 0, 1, 1,
0.1778637, -1.450045, 0.9651029, 1, 0, 0, 1, 1,
0.1803699, 0.5750349, 1.336405, 1, 0, 0, 1, 1,
0.1804813, 1.025232, 0.3457402, 1, 0, 0, 1, 1,
0.1812785, 0.1519107, -1.187868, 0, 0, 0, 1, 1,
0.1883885, 0.7615098, 0.02835615, 0, 0, 0, 1, 1,
0.1890893, 0.475526, 0.4589339, 0, 0, 0, 1, 1,
0.1936603, 0.5519207, -1.091734, 0, 0, 0, 1, 1,
0.1938945, -0.3179709, 1.480018, 0, 0, 0, 1, 1,
0.1966665, -0.5198205, 2.993531, 0, 0, 0, 1, 1,
0.1978928, 0.6779711, 0.9270678, 0, 0, 0, 1, 1,
0.1991787, 1.611144, -0.08064014, 1, 1, 1, 1, 1,
0.2013096, -0.01072858, 1.244852, 1, 1, 1, 1, 1,
0.2015343, -0.03332832, 0.2048333, 1, 1, 1, 1, 1,
0.2032442, -0.05178707, 1.363797, 1, 1, 1, 1, 1,
0.2062642, -0.4246619, 4.554651, 1, 1, 1, 1, 1,
0.216399, -0.1311392, 2.583052, 1, 1, 1, 1, 1,
0.218507, -1.751968, 3.487347, 1, 1, 1, 1, 1,
0.2201057, 0.4237442, -2.718412, 1, 1, 1, 1, 1,
0.2219058, -0.6898323, 3.996063, 1, 1, 1, 1, 1,
0.2271881, 0.1423816, 0.8196905, 1, 1, 1, 1, 1,
0.2291578, -1.21701, 2.388393, 1, 1, 1, 1, 1,
0.23135, 1.410007, 1.520745, 1, 1, 1, 1, 1,
0.2327574, -1.467344, 4.313372, 1, 1, 1, 1, 1,
0.234707, -0.01966568, 1.429416, 1, 1, 1, 1, 1,
0.2369174, -0.6113981, 1.814548, 1, 1, 1, 1, 1,
0.2410838, -1.08776, 3.730833, 0, 0, 1, 1, 1,
0.2419072, -1.291565, 2.69124, 1, 0, 0, 1, 1,
0.2430013, -0.5848861, 0.9999855, 1, 0, 0, 1, 1,
0.2463108, 0.1691788, 0.1145259, 1, 0, 0, 1, 1,
0.2480253, 0.6605487, -0.3888711, 1, 0, 0, 1, 1,
0.2490224, 2.3593, -0.005131227, 1, 0, 0, 1, 1,
0.2502127, -1.028702, 2.20166, 0, 0, 0, 1, 1,
0.2519133, 0.248013, -0.553753, 0, 0, 0, 1, 1,
0.2522923, -2.351376, 2.783288, 0, 0, 0, 1, 1,
0.2545832, -2.092507, 3.490981, 0, 0, 0, 1, 1,
0.2564742, -0.2782798, 2.181697, 0, 0, 0, 1, 1,
0.2637, 0.178604, 0.8207458, 0, 0, 0, 1, 1,
0.2659064, -0.9213249, 2.574535, 0, 0, 0, 1, 1,
0.2667803, -0.519718, 3.517227, 1, 1, 1, 1, 1,
0.2680844, -0.2029929, 0.8010877, 1, 1, 1, 1, 1,
0.2682487, 1.125005, 1.407001, 1, 1, 1, 1, 1,
0.2687312, -0.7824602, 3.08886, 1, 1, 1, 1, 1,
0.2731097, 0.9273688, 1.800084, 1, 1, 1, 1, 1,
0.2732768, -1.277284, 2.021741, 1, 1, 1, 1, 1,
0.275334, -0.8637956, 4.077909, 1, 1, 1, 1, 1,
0.2788371, -0.05373851, 1.294262, 1, 1, 1, 1, 1,
0.2865295, 1.41816, -0.2239181, 1, 1, 1, 1, 1,
0.2867854, -0.03076918, 2.398854, 1, 1, 1, 1, 1,
0.2885174, -0.5733345, 3.119989, 1, 1, 1, 1, 1,
0.2910552, 0.08006761, 3.78931, 1, 1, 1, 1, 1,
0.2924624, -1.123549, 3.004802, 1, 1, 1, 1, 1,
0.2947512, 1.701311, -1.487938, 1, 1, 1, 1, 1,
0.2955077, -0.003309041, 2.131226, 1, 1, 1, 1, 1,
0.2975563, -0.2755537, 2.2497, 0, 0, 1, 1, 1,
0.299187, -0.3982104, 2.062908, 1, 0, 0, 1, 1,
0.3005295, -0.2654915, 2.527342, 1, 0, 0, 1, 1,
0.3019193, -0.5897025, 3.50583, 1, 0, 0, 1, 1,
0.3036278, -0.0632457, 0.146084, 1, 0, 0, 1, 1,
0.3050006, 0.07828175, -0.07847296, 1, 0, 0, 1, 1,
0.3105352, 2.3235, -1.416436, 0, 0, 0, 1, 1,
0.3119063, -0.9960939, 3.990286, 0, 0, 0, 1, 1,
0.3146397, -0.622785, 2.610871, 0, 0, 0, 1, 1,
0.3176309, 0.08995682, 3.912566, 0, 0, 0, 1, 1,
0.3181261, -1.186834, 4.757846, 0, 0, 0, 1, 1,
0.3187082, 1.056633, 1.160902, 0, 0, 0, 1, 1,
0.3313, 0.5391074, 1.083866, 0, 0, 0, 1, 1,
0.3327685, -0.9319533, 4.452872, 1, 1, 1, 1, 1,
0.3330388, -1.309632, 3.491531, 1, 1, 1, 1, 1,
0.3357738, 0.9467157, -0.6576815, 1, 1, 1, 1, 1,
0.3369553, -0.008703629, -0.146208, 1, 1, 1, 1, 1,
0.3420278, 0.8162876, 2.322275, 1, 1, 1, 1, 1,
0.3457686, 1.710814, 0.3992084, 1, 1, 1, 1, 1,
0.3467404, 0.8609706, 0.1770491, 1, 1, 1, 1, 1,
0.3469528, -0.6539609, 2.855338, 1, 1, 1, 1, 1,
0.3538092, 1.275614, 0.1704929, 1, 1, 1, 1, 1,
0.3549837, -1.389859, 2.876033, 1, 1, 1, 1, 1,
0.3602893, 0.7416523, 1.248376, 1, 1, 1, 1, 1,
0.3617386, 0.2577454, 0.5065975, 1, 1, 1, 1, 1,
0.3655347, 0.290244, 1.561159, 1, 1, 1, 1, 1,
0.3690033, -1.292051, 4.202423, 1, 1, 1, 1, 1,
0.3718588, 0.2362633, 1.217184, 1, 1, 1, 1, 1,
0.3780495, -0.0781508, 2.321881, 0, 0, 1, 1, 1,
0.387202, -0.9042318, 4.588489, 1, 0, 0, 1, 1,
0.3878881, 1.200547, 0.2419728, 1, 0, 0, 1, 1,
0.3908359, 0.8933016, -0.6349086, 1, 0, 0, 1, 1,
0.3925191, -1.669567, 3.383921, 1, 0, 0, 1, 1,
0.3947273, 0.7562247, 0.7510706, 1, 0, 0, 1, 1,
0.3966573, 1.170263, 1.33296, 0, 0, 0, 1, 1,
0.3970188, -1.136669, 2.417747, 0, 0, 0, 1, 1,
0.3970425, -0.02368124, 1.804849, 0, 0, 0, 1, 1,
0.3991519, -0.5558851, 3.399031, 0, 0, 0, 1, 1,
0.4010096, -0.2236398, 2.644231, 0, 0, 0, 1, 1,
0.4039166, 0.0333877, 0.9176742, 0, 0, 0, 1, 1,
0.4055937, -0.09060258, 1.617597, 0, 0, 0, 1, 1,
0.4057084, -2.153098, 2.768869, 1, 1, 1, 1, 1,
0.4085188, 2.439297, 0.333039, 1, 1, 1, 1, 1,
0.4100043, 0.9616446, 2.071399, 1, 1, 1, 1, 1,
0.4100347, 0.9662277, 1.568872, 1, 1, 1, 1, 1,
0.4120876, 0.2124758, 0.8960423, 1, 1, 1, 1, 1,
0.4144862, -0.4310934, 3.057643, 1, 1, 1, 1, 1,
0.4156263, -1.212775, 2.385599, 1, 1, 1, 1, 1,
0.4156317, 0.9422075, 0.4149396, 1, 1, 1, 1, 1,
0.419231, -0.2105474, 3.361688, 1, 1, 1, 1, 1,
0.4196951, 0.3294232, 1.893712, 1, 1, 1, 1, 1,
0.4271011, 1.393712, 1.68575, 1, 1, 1, 1, 1,
0.4275644, 0.2363207, 2.268933, 1, 1, 1, 1, 1,
0.4300915, 0.2374427, 1.170732, 1, 1, 1, 1, 1,
0.4328138, -0.6995519, 3.847406, 1, 1, 1, 1, 1,
0.4345753, -0.01346668, 2.211959, 1, 1, 1, 1, 1,
0.4391667, 2.521083, 0.2112305, 0, 0, 1, 1, 1,
0.4404233, -0.4606648, 1.67174, 1, 0, 0, 1, 1,
0.4463986, 1.200619, -0.001984263, 1, 0, 0, 1, 1,
0.4493982, 0.2226539, 0.8866799, 1, 0, 0, 1, 1,
0.453308, 0.9396896, 0.8178082, 1, 0, 0, 1, 1,
0.4564258, 2.023683, -0.4049313, 1, 0, 0, 1, 1,
0.458241, 0.06450918, 2.580081, 0, 0, 0, 1, 1,
0.4597089, -1.272338, 1.93882, 0, 0, 0, 1, 1,
0.4652762, 0.7360507, 0.4912856, 0, 0, 0, 1, 1,
0.4674773, -1.126092, 4.644264, 0, 0, 0, 1, 1,
0.4699157, 1.210485, 0.2675777, 0, 0, 0, 1, 1,
0.4729897, 0.8038359, 0.05126834, 0, 0, 0, 1, 1,
0.4742155, 0.9434718, 0.2090164, 0, 0, 0, 1, 1,
0.4828797, 0.4566417, 0.6490551, 1, 1, 1, 1, 1,
0.4885467, -0.8654965, 2.624811, 1, 1, 1, 1, 1,
0.4902368, -1.061335, 1.813166, 1, 1, 1, 1, 1,
0.4920206, 0.6284827, -0.4214034, 1, 1, 1, 1, 1,
0.4920781, -1.304765, 2.792921, 1, 1, 1, 1, 1,
0.4938037, 0.5840508, 1.256462, 1, 1, 1, 1, 1,
0.4981788, 0.6059292, 0.6483441, 1, 1, 1, 1, 1,
0.500685, -0.417861, 1.256949, 1, 1, 1, 1, 1,
0.5007648, 1.238538, 0.0153036, 1, 1, 1, 1, 1,
0.5034961, -1.318558, 2.14823, 1, 1, 1, 1, 1,
0.504069, -0.9541596, 3.662212, 1, 1, 1, 1, 1,
0.5096778, 2.512956, -1.474138, 1, 1, 1, 1, 1,
0.510212, 0.1565446, 1.328374, 1, 1, 1, 1, 1,
0.5156021, 0.07874102, 2.253804, 1, 1, 1, 1, 1,
0.5179976, 0.7102512, 0.7391257, 1, 1, 1, 1, 1,
0.5210414, 0.2743379, 1.186483, 0, 0, 1, 1, 1,
0.5219242, 0.5929607, 0.8742651, 1, 0, 0, 1, 1,
0.5232976, -0.7104039, 2.192136, 1, 0, 0, 1, 1,
0.5265886, 0.7859551, -0.3374914, 1, 0, 0, 1, 1,
0.5304394, 0.3544042, -0.3480413, 1, 0, 0, 1, 1,
0.5344526, -0.3822891, 2.195968, 1, 0, 0, 1, 1,
0.5376061, 1.28758, 0.1552797, 0, 0, 0, 1, 1,
0.5393804, 0.5805009, 1.834778, 0, 0, 0, 1, 1,
0.5393811, 1.816781, 0.3911889, 0, 0, 0, 1, 1,
0.5394978, 0.3453403, 1.897939, 0, 0, 0, 1, 1,
0.5541844, -0.1065443, 2.764781, 0, 0, 0, 1, 1,
0.5545753, 0.9358953, 0.7340392, 0, 0, 0, 1, 1,
0.5575814, 0.6901672, 1.713188, 0, 0, 0, 1, 1,
0.5618105, -1.683589, 1.829132, 1, 1, 1, 1, 1,
0.5674085, 0.4863791, 0.9245036, 1, 1, 1, 1, 1,
0.5679842, -2.238391, 1.102075, 1, 1, 1, 1, 1,
0.5690282, 0.7666248, 1.306913, 1, 1, 1, 1, 1,
0.571153, -0.1641637, 1.617475, 1, 1, 1, 1, 1,
0.573325, 2.372544, -0.3245945, 1, 1, 1, 1, 1,
0.5790045, -1.097705, 2.168361, 1, 1, 1, 1, 1,
0.5791996, -1.377689, 1.129465, 1, 1, 1, 1, 1,
0.5857675, -0.1043958, 2.34175, 1, 1, 1, 1, 1,
0.5861278, -1.47245, 3.363285, 1, 1, 1, 1, 1,
0.5937967, -1.762385, 0.9364441, 1, 1, 1, 1, 1,
0.5971262, -1.474066, 5.438836, 1, 1, 1, 1, 1,
0.6048787, -0.8658395, 2.381219, 1, 1, 1, 1, 1,
0.607426, 0.8456997, -0.8572934, 1, 1, 1, 1, 1,
0.6129147, 0.4846391, 0.05871671, 1, 1, 1, 1, 1,
0.6141353, 0.2781875, 1.603173, 0, 0, 1, 1, 1,
0.615258, -0.1676753, 1.690991, 1, 0, 0, 1, 1,
0.6261036, 0.5744526, 0.517838, 1, 0, 0, 1, 1,
0.632526, 1.542026, -0.2421104, 1, 0, 0, 1, 1,
0.639101, 1.386026, 0.4948185, 1, 0, 0, 1, 1,
0.6391564, -2.515056, 2.0852, 1, 0, 0, 1, 1,
0.6504538, 0.4323581, 0.3365197, 0, 0, 0, 1, 1,
0.6724268, 0.4253971, 1.034229, 0, 0, 0, 1, 1,
0.6730928, 0.0690919, 2.237338, 0, 0, 0, 1, 1,
0.6736629, 0.917424, 1.095759, 0, 0, 0, 1, 1,
0.6773672, -0.1639883, 1.414738, 0, 0, 0, 1, 1,
0.6787613, -1.544486, 1.191334, 0, 0, 0, 1, 1,
0.6851137, -0.6589956, 3.669903, 0, 0, 0, 1, 1,
0.6875782, 1.208256, -0.8232517, 1, 1, 1, 1, 1,
0.6982206, -0.6582095, 3.928926, 1, 1, 1, 1, 1,
0.7150854, 0.6796034, 0.4667647, 1, 1, 1, 1, 1,
0.7180613, 0.6276116, 0.6125522, 1, 1, 1, 1, 1,
0.7226596, 0.4503787, 1.838025, 1, 1, 1, 1, 1,
0.7279247, 0.8061503, 0.02731405, 1, 1, 1, 1, 1,
0.7287655, 1.630167, 1.766885, 1, 1, 1, 1, 1,
0.7298445, 0.3180436, -0.4544044, 1, 1, 1, 1, 1,
0.7314571, 0.6639494, 2.392135, 1, 1, 1, 1, 1,
0.7334182, -2.091775, 1.971221, 1, 1, 1, 1, 1,
0.7340716, -0.0750242, 3.725833, 1, 1, 1, 1, 1,
0.7346119, -0.9778635, 2.735851, 1, 1, 1, 1, 1,
0.7394071, 0.9299177, 3.120465, 1, 1, 1, 1, 1,
0.7433742, 0.8243198, -0.433678, 1, 1, 1, 1, 1,
0.7450426, 0.5706483, 1.57149, 1, 1, 1, 1, 1,
0.7519078, -0.806819, 3.248572, 0, 0, 1, 1, 1,
0.7584501, 0.02814643, 2.006648, 1, 0, 0, 1, 1,
0.7673206, -0.8312783, 2.175618, 1, 0, 0, 1, 1,
0.7703435, 1.142726, 1.739124, 1, 0, 0, 1, 1,
0.7722519, 1.947709, -1.947474, 1, 0, 0, 1, 1,
0.7743528, 0.2687448, 0.607514, 1, 0, 0, 1, 1,
0.7766976, -0.05191232, -0.3540767, 0, 0, 0, 1, 1,
0.7782629, -0.5999918, 2.859964, 0, 0, 0, 1, 1,
0.7823621, -0.5719033, 2.665166, 0, 0, 0, 1, 1,
0.7845618, 0.1315696, 2.013257, 0, 0, 0, 1, 1,
0.7893968, 2.465854, 0.2508476, 0, 0, 0, 1, 1,
0.7905519, -0.9636531, 2.847064, 0, 0, 0, 1, 1,
0.7925538, 0.9288811, 0.2854491, 0, 0, 0, 1, 1,
0.7941626, -0.7095139, 2.638218, 1, 1, 1, 1, 1,
0.801258, -0.7692373, 3.121277, 1, 1, 1, 1, 1,
0.802417, 0.3329681, -0.03371342, 1, 1, 1, 1, 1,
0.8065854, -1.211862, 1.808275, 1, 1, 1, 1, 1,
0.8173338, -0.2332352, 0.5635153, 1, 1, 1, 1, 1,
0.825422, 0.5918872, -0.4311833, 1, 1, 1, 1, 1,
0.8285868, -1.659577, 3.025068, 1, 1, 1, 1, 1,
0.8310407, 1.200385, 0.3800036, 1, 1, 1, 1, 1,
0.8350768, -0.4440138, 3.74821, 1, 1, 1, 1, 1,
0.8396105, 0.512369, 1.996655, 1, 1, 1, 1, 1,
0.8411796, 1.167746, 0.9297741, 1, 1, 1, 1, 1,
0.8442938, -0.5127158, 2.122423, 1, 1, 1, 1, 1,
0.846252, -0.2935614, 2.623989, 1, 1, 1, 1, 1,
0.8466351, -0.3468866, 1.915398, 1, 1, 1, 1, 1,
0.8524187, 0.1254884, 2.348906, 1, 1, 1, 1, 1,
0.8533143, -1.149786, 2.001465, 0, 0, 1, 1, 1,
0.8567396, 1.096473, 1.234793, 1, 0, 0, 1, 1,
0.8605884, 0.6526432, 2.090731, 1, 0, 0, 1, 1,
0.8640725, -0.05641168, 2.701092, 1, 0, 0, 1, 1,
0.8645524, 0.5022412, 0.5506342, 1, 0, 0, 1, 1,
0.8667676, -0.3113783, 2.698862, 1, 0, 0, 1, 1,
0.8670489, 1.830081, 1.160725, 0, 0, 0, 1, 1,
0.8735065, -0.09677117, 1.132428, 0, 0, 0, 1, 1,
0.877268, -0.6809257, 1.994779, 0, 0, 0, 1, 1,
0.8789281, -0.376101, 3.418907, 0, 0, 0, 1, 1,
0.8795421, -2.090728, 3.192359, 0, 0, 0, 1, 1,
0.884554, -1.208409, 2.849627, 0, 0, 0, 1, 1,
0.8919321, -0.5401122, 2.557001, 0, 0, 0, 1, 1,
0.8935649, -1.027165, 2.782906, 1, 1, 1, 1, 1,
0.8964026, 0.03159342, 2.317459, 1, 1, 1, 1, 1,
0.8988544, 1.640461, 0.5742763, 1, 1, 1, 1, 1,
0.9041631, 0.3276031, 0.5124187, 1, 1, 1, 1, 1,
0.9064515, -0.02971033, 1.512558, 1, 1, 1, 1, 1,
0.9080411, -0.02192798, 2.53952, 1, 1, 1, 1, 1,
0.9122626, 1.52077, 1.838124, 1, 1, 1, 1, 1,
0.9144334, -1.18014, 1.094816, 1, 1, 1, 1, 1,
0.9162707, -0.8392666, 1.011613, 1, 1, 1, 1, 1,
0.9165384, 1.328236, 1.547982, 1, 1, 1, 1, 1,
0.9167982, 0.2196417, 0.9951558, 1, 1, 1, 1, 1,
0.9189323, -0.03674176, 1.543735, 1, 1, 1, 1, 1,
0.9291272, -0.3768744, 1.955819, 1, 1, 1, 1, 1,
0.9374709, -0.9019622, 1.313911, 1, 1, 1, 1, 1,
0.9392129, 0.6640677, 0.8820575, 1, 1, 1, 1, 1,
0.9442279, 0.5282133, 0.6811165, 0, 0, 1, 1, 1,
0.9507263, 0.9099911, 1.172655, 1, 0, 0, 1, 1,
0.9523481, 1.641512, 0.4758859, 1, 0, 0, 1, 1,
0.9577754, 0.9903305, -2.384864, 1, 0, 0, 1, 1,
0.9586614, -1.030345, 2.388614, 1, 0, 0, 1, 1,
0.9592438, -0.09077837, 1.124648, 1, 0, 0, 1, 1,
0.9647828, -0.08534873, 0.6479379, 0, 0, 0, 1, 1,
0.9683502, -0.4907854, 1.948117, 0, 0, 0, 1, 1,
0.9776121, 0.8468881, -0.4159489, 0, 0, 0, 1, 1,
0.9959148, -1.500217, 3.342109, 0, 0, 0, 1, 1,
0.9964627, -1.169405, 2.988702, 0, 0, 0, 1, 1,
1.004033, 0.5174482, 1.426194, 0, 0, 0, 1, 1,
1.007474, -0.1086967, 0.718718, 0, 0, 0, 1, 1,
1.01316, 2.271789, 0.494857, 1, 1, 1, 1, 1,
1.014519, -2.225246, 2.48047, 1, 1, 1, 1, 1,
1.020897, 1.222551, 0.8015921, 1, 1, 1, 1, 1,
1.022395, 0.8219332, -1.406978, 1, 1, 1, 1, 1,
1.025811, 0.8245569, 3.246554, 1, 1, 1, 1, 1,
1.026234, -0.46807, 3.883974, 1, 1, 1, 1, 1,
1.026284, -1.680708, 2.893252, 1, 1, 1, 1, 1,
1.028149, 0.4764223, 2.967879, 1, 1, 1, 1, 1,
1.036133, 0.411034, 1.952516, 1, 1, 1, 1, 1,
1.036587, -0.2757317, 0.1083434, 1, 1, 1, 1, 1,
1.039172, -0.336572, 0.6963484, 1, 1, 1, 1, 1,
1.041979, -1.475095, 0.7897886, 1, 1, 1, 1, 1,
1.045938, 0.7750697, 1.818363, 1, 1, 1, 1, 1,
1.046223, -0.1521863, 0.8705739, 1, 1, 1, 1, 1,
1.047794, -0.6525669, 4.383881, 1, 1, 1, 1, 1,
1.054645, 0.4523294, -0.07594604, 0, 0, 1, 1, 1,
1.058392, -0.4056024, 0.3008908, 1, 0, 0, 1, 1,
1.066001, -0.2406041, 1.745462, 1, 0, 0, 1, 1,
1.06977, 0.8736025, 0.6307766, 1, 0, 0, 1, 1,
1.076793, 0.5567757, 2.215262, 1, 0, 0, 1, 1,
1.08372, 1.098295, 0.9333028, 1, 0, 0, 1, 1,
1.085005, -0.4929128, 2.17703, 0, 0, 0, 1, 1,
1.088235, 0.6447459, 3.251962, 0, 0, 0, 1, 1,
1.089486, 0.5298533, 1.254681, 0, 0, 0, 1, 1,
1.092895, -1.641534, 1.161456, 0, 0, 0, 1, 1,
1.095943, -0.2000685, 2.914971, 0, 0, 0, 1, 1,
1.098784, -0.7870702, 2.45944, 0, 0, 0, 1, 1,
1.10068, 0.04713853, 2.97628, 0, 0, 0, 1, 1,
1.109424, -0.5287001, 1.68894, 1, 1, 1, 1, 1,
1.110173, -0.0331374, 2.147345, 1, 1, 1, 1, 1,
1.124694, -1.855071, 1.974667, 1, 1, 1, 1, 1,
1.126081, -1.10208, 2.936122, 1, 1, 1, 1, 1,
1.126774, -0.9441857, 2.789955, 1, 1, 1, 1, 1,
1.129306, 1.041836, 0.3664041, 1, 1, 1, 1, 1,
1.13767, 0.5230767, 1.508752, 1, 1, 1, 1, 1,
1.140516, -0.1701769, 1.36653, 1, 1, 1, 1, 1,
1.140793, 0.659179, 2.360692, 1, 1, 1, 1, 1,
1.141184, 0.8705831, 1.007328, 1, 1, 1, 1, 1,
1.147809, -1.397041, 2.502258, 1, 1, 1, 1, 1,
1.153331, 0.6077207, 1.713362, 1, 1, 1, 1, 1,
1.160769, 1.025399, 1.989248, 1, 1, 1, 1, 1,
1.180159, 0.1639768, -0.1772195, 1, 1, 1, 1, 1,
1.182337, -1.520415, 3.304989, 1, 1, 1, 1, 1,
1.208254, 1.528412, 0.3102094, 0, 0, 1, 1, 1,
1.209486, 1.324425, -0.3956056, 1, 0, 0, 1, 1,
1.211806, 1.478904, -0.1267958, 1, 0, 0, 1, 1,
1.213125, -0.3084391, 0.9213248, 1, 0, 0, 1, 1,
1.215916, -1.541475, 2.300356, 1, 0, 0, 1, 1,
1.219635, 0.6059159, -0.4369371, 1, 0, 0, 1, 1,
1.235343, -0.6081434, 2.941189, 0, 0, 0, 1, 1,
1.236158, 0.5401679, 1.438585, 0, 0, 0, 1, 1,
1.254241, 1.386869, -0.7503563, 0, 0, 0, 1, 1,
1.254739, -0.3197553, 2.200996, 0, 0, 0, 1, 1,
1.258756, -2.583338, 2.898572, 0, 0, 0, 1, 1,
1.260927, 0.7227663, 0.7903025, 0, 0, 0, 1, 1,
1.269929, -0.5380973, 3.091499, 0, 0, 0, 1, 1,
1.277223, -1.546731, 2.032936, 1, 1, 1, 1, 1,
1.280471, -1.698033, 2.787963, 1, 1, 1, 1, 1,
1.282741, -1.961918, 1.875439, 1, 1, 1, 1, 1,
1.292371, 0.7470329, 2.191422, 1, 1, 1, 1, 1,
1.298373, 0.09367082, 2.565134, 1, 1, 1, 1, 1,
1.298828, -0.1469211, 0.138547, 1, 1, 1, 1, 1,
1.303233, -0.4095831, 1.827429, 1, 1, 1, 1, 1,
1.314387, 0.7450792, 1.804566, 1, 1, 1, 1, 1,
1.316224, 0.921334, 0.7951732, 1, 1, 1, 1, 1,
1.331595, -1.439671, 0.6426666, 1, 1, 1, 1, 1,
1.332651, 0.2231414, 2.688354, 1, 1, 1, 1, 1,
1.335155, -1.241936, 3.204659, 1, 1, 1, 1, 1,
1.336977, 0.4027256, 0.8612639, 1, 1, 1, 1, 1,
1.337567, -0.159973, 3.22654, 1, 1, 1, 1, 1,
1.362237, 1.872551, -1.029055, 1, 1, 1, 1, 1,
1.362346, -0.1874176, 2.55225, 0, 0, 1, 1, 1,
1.366046, 0.4602037, 1.81312, 1, 0, 0, 1, 1,
1.369999, 0.0522023, 0.4489185, 1, 0, 0, 1, 1,
1.374832, 1.724319, 2.173498, 1, 0, 0, 1, 1,
1.377999, 0.7001154, 0.4732047, 1, 0, 0, 1, 1,
1.383963, -0.1169108, 1.195861, 1, 0, 0, 1, 1,
1.398874, 0.3473783, 1.55867, 0, 0, 0, 1, 1,
1.402237, 0.05088452, 1.974544, 0, 0, 0, 1, 1,
1.425556, 0.08976321, 1.674061, 0, 0, 0, 1, 1,
1.426645, 1.835243, 0.5147585, 0, 0, 0, 1, 1,
1.430129, 1.437995, 0.007709284, 0, 0, 0, 1, 1,
1.440533, 1.908364, 1.104567, 0, 0, 0, 1, 1,
1.441674, -0.6751546, 2.257441, 0, 0, 0, 1, 1,
1.44516, 1.904512, 1.014094, 1, 1, 1, 1, 1,
1.450966, -0.6800539, 0.8525869, 1, 1, 1, 1, 1,
1.458556, 0.2816784, 2.828595, 1, 1, 1, 1, 1,
1.467897, 0.3573558, 0.7365971, 1, 1, 1, 1, 1,
1.468413, -0.4460493, 2.212359, 1, 1, 1, 1, 1,
1.477759, -0.8271881, 2.077603, 1, 1, 1, 1, 1,
1.479625, -0.812869, 3.048056, 1, 1, 1, 1, 1,
1.491345, -0.1051195, 1.601835, 1, 1, 1, 1, 1,
1.491728, -0.506274, 1.073304, 1, 1, 1, 1, 1,
1.494073, -0.8254317, 1.456743, 1, 1, 1, 1, 1,
1.50505, 0.8068777, 0.0118711, 1, 1, 1, 1, 1,
1.507024, 0.6668675, -0.510437, 1, 1, 1, 1, 1,
1.514821, -0.2012015, 1.277219, 1, 1, 1, 1, 1,
1.515157, 0.951052, 2.038769, 1, 1, 1, 1, 1,
1.516063, -0.92277, 1.604653, 1, 1, 1, 1, 1,
1.51928, 0.1727972, 0.1987835, 0, 0, 1, 1, 1,
1.519302, -0.7931287, 1.219956, 1, 0, 0, 1, 1,
1.520194, 0.2054454, 1.146496, 1, 0, 0, 1, 1,
1.525865, -1.453486, 1.236953, 1, 0, 0, 1, 1,
1.526279, -0.8467551, 2.456374, 1, 0, 0, 1, 1,
1.531884, -0.503884, 0.5247521, 1, 0, 0, 1, 1,
1.533232, -1.596367, 1.116825, 0, 0, 0, 1, 1,
1.539427, -0.3675238, 3.772167, 0, 0, 0, 1, 1,
1.542556, -1.623013, 2.114312, 0, 0, 0, 1, 1,
1.545782, 0.1228867, 1.916647, 0, 0, 0, 1, 1,
1.548483, -1.141543, 2.36899, 0, 0, 0, 1, 1,
1.570634, 0.6566932, -0.7331995, 0, 0, 0, 1, 1,
1.576657, 0.2221611, 0.8340861, 0, 0, 0, 1, 1,
1.579341, -0.5578828, 4.436023, 1, 1, 1, 1, 1,
1.586386, -2.399293, 3.349541, 1, 1, 1, 1, 1,
1.640394, 1.253714, 1.20494, 1, 1, 1, 1, 1,
1.640488, -0.007640821, 0.8462663, 1, 1, 1, 1, 1,
1.653224, -0.2129418, 1.574015, 1, 1, 1, 1, 1,
1.664239, 1.18064, 1.043214, 1, 1, 1, 1, 1,
1.671122, 0.9535517, 1.610121, 1, 1, 1, 1, 1,
1.680466, -0.2623646, 1.282081, 1, 1, 1, 1, 1,
1.681034, 0.5354298, 1.01168, 1, 1, 1, 1, 1,
1.690131, -0.3771071, 2.332036, 1, 1, 1, 1, 1,
1.695366, -1.157287, 1.690418, 1, 1, 1, 1, 1,
1.695875, 0.3033013, 0.6353765, 1, 1, 1, 1, 1,
1.69956, -0.4135549, 1.365495, 1, 1, 1, 1, 1,
1.706864, 0.2676384, 0.3566273, 1, 1, 1, 1, 1,
1.720188, 1.346453, 1.433708, 1, 1, 1, 1, 1,
1.746277, 2.214776, 0.983352, 0, 0, 1, 1, 1,
1.750065, -1.121319, 2.313814, 1, 0, 0, 1, 1,
1.752164, 0.8754311, 2.839834, 1, 0, 0, 1, 1,
1.752646, 0.2429034, 1.785197, 1, 0, 0, 1, 1,
1.774075, -0.3502019, 2.082231, 1, 0, 0, 1, 1,
1.784891, 0.4253394, 0.8799568, 1, 0, 0, 1, 1,
1.816763, -0.9866604, 3.518199, 0, 0, 0, 1, 1,
1.830916, 0.8480547, 1.178667, 0, 0, 0, 1, 1,
1.83669, -0.6764039, 0.2578378, 0, 0, 0, 1, 1,
1.836928, -1.300545, 2.804799, 0, 0, 0, 1, 1,
1.857654, 0.568336, 0.121883, 0, 0, 0, 1, 1,
1.858182, -0.2011265, 2.886855, 0, 0, 0, 1, 1,
1.862227, 0.2697346, 0.6080092, 0, 0, 0, 1, 1,
1.866257, -1.068451, 4.148074, 1, 1, 1, 1, 1,
1.866669, 0.2256811, 0.9077883, 1, 1, 1, 1, 1,
1.873612, 0.3586584, -0.2820852, 1, 1, 1, 1, 1,
1.88129, 0.004198221, 0.6215686, 1, 1, 1, 1, 1,
1.899621, -1.073886, 1.031257, 1, 1, 1, 1, 1,
1.943766, 1.496467, 0.2902624, 1, 1, 1, 1, 1,
1.952588, -1.590502, 2.522771, 1, 1, 1, 1, 1,
1.959623, -1.528404, 2.493744, 1, 1, 1, 1, 1,
1.976392, 0.7005516, 0.8740789, 1, 1, 1, 1, 1,
2.013068, 0.1776762, 1.286809, 1, 1, 1, 1, 1,
2.051004, 0.3713201, 2.076579, 1, 1, 1, 1, 1,
2.054811, 1.048287, 0.5905781, 1, 1, 1, 1, 1,
2.054918, 1.704805, -0.2192232, 1, 1, 1, 1, 1,
2.060996, 0.8065615, -0.318123, 1, 1, 1, 1, 1,
2.072619, 2.006135, 1.834374, 1, 1, 1, 1, 1,
2.083605, -0.8150446, 2.75262, 0, 0, 1, 1, 1,
2.095139, -0.4648812, 0.743539, 1, 0, 0, 1, 1,
2.11572, 0.2664296, 1.352324, 1, 0, 0, 1, 1,
2.146655, -0.1418167, 2.155902, 1, 0, 0, 1, 1,
2.173145, 0.5618262, 2.520324, 1, 0, 0, 1, 1,
2.17945, -0.2288572, 2.368616, 1, 0, 0, 1, 1,
2.184446, 0.2379767, 0.2205264, 0, 0, 0, 1, 1,
2.327175, 1.855862, 1.915865, 0, 0, 0, 1, 1,
2.358429, 0.5704525, 2.269608, 0, 0, 0, 1, 1,
2.39693, -0.6132419, 1.907535, 0, 0, 0, 1, 1,
2.438739, 0.5367417, 2.00363, 0, 0, 0, 1, 1,
2.464709, -0.5092458, 2.938939, 0, 0, 0, 1, 1,
2.475402, 0.6458459, 2.96598, 0, 0, 0, 1, 1,
2.496294, -0.4064937, 2.806683, 1, 1, 1, 1, 1,
2.544085, -2.110554, 4.309496, 1, 1, 1, 1, 1,
2.707889, 2.103848, 0.7366212, 1, 1, 1, 1, 1,
2.769974, 1.521143, -0.06521343, 1, 1, 1, 1, 1,
2.813167, -0.09257661, 2.269071, 1, 1, 1, 1, 1,
2.869315, -0.5902367, 0.755964, 1, 1, 1, 1, 1,
3.535683, -0.7164501, 2.902505, 1, 1, 1, 1, 1
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
var radius = 9.969732;
var distance = 35.01826;
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
mvMatrix.translate( -0.04014444, 0.238824, -0.26333 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.01826);
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
