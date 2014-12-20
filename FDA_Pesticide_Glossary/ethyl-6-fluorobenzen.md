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
-3.601254, 0.5219132, 0.5038276, 1, 0, 0, 1,
-3.120479, 0.7516614, -0.8861543, 1, 0.007843138, 0, 1,
-3.048702, 0.3469131, -1.502545, 1, 0.01176471, 0, 1,
-2.950609, -0.6947683, -2.130193, 1, 0.01960784, 0, 1,
-2.760329, 0.9050041, -0.9996992, 1, 0.02352941, 0, 1,
-2.745316, -1.393872, -2.164209, 1, 0.03137255, 0, 1,
-2.687689, -0.2549089, -0.9558882, 1, 0.03529412, 0, 1,
-2.653066, 0.5518411, -0.3878489, 1, 0.04313726, 0, 1,
-2.530856, -1.597082, -2.043675, 1, 0.04705882, 0, 1,
-2.467647, 0.8676525, -1.01494, 1, 0.05490196, 0, 1,
-2.424836, -0.8169081, -1.031214, 1, 0.05882353, 0, 1,
-2.38861, 0.4405607, 0.3437787, 1, 0.06666667, 0, 1,
-2.385305, -0.7662845, -2.674448, 1, 0.07058824, 0, 1,
-2.326497, 0.8869008, -1.379664, 1, 0.07843138, 0, 1,
-2.30051, 0.2117242, -2.223545, 1, 0.08235294, 0, 1,
-2.264859, -0.2557708, -1.917102, 1, 0.09019608, 0, 1,
-2.254186, 1.612352, 0.2630209, 1, 0.09411765, 0, 1,
-2.189393, -0.9399204, -2.001671, 1, 0.1019608, 0, 1,
-2.179283, 0.6976323, -4.022388, 1, 0.1098039, 0, 1,
-2.178055, -2.020068, -3.471614, 1, 0.1137255, 0, 1,
-2.158567, -0.4145351, -1.194403, 1, 0.1215686, 0, 1,
-2.129131, -0.0247049, -1.642278, 1, 0.1254902, 0, 1,
-2.090615, 1.440843, -1.07769, 1, 0.1333333, 0, 1,
-2.059455, -0.1055137, -3.663485, 1, 0.1372549, 0, 1,
-1.993676, 1.045398, -0.1237801, 1, 0.145098, 0, 1,
-1.962875, -0.9565872, -2.090686, 1, 0.1490196, 0, 1,
-1.946597, 0.1617971, -2.260929, 1, 0.1568628, 0, 1,
-1.935483, 1.612853, -0.390097, 1, 0.1607843, 0, 1,
-1.933559, 0.7558123, -0.9502466, 1, 0.1686275, 0, 1,
-1.848466, -0.7366029, -2.757292, 1, 0.172549, 0, 1,
-1.841934, -1.041747, -3.004997, 1, 0.1803922, 0, 1,
-1.836744, -0.4689188, -1.73166, 1, 0.1843137, 0, 1,
-1.827483, -0.6804568, -2.917306, 1, 0.1921569, 0, 1,
-1.812274, -1.970822, -3.011387, 1, 0.1960784, 0, 1,
-1.799943, -0.6482029, -0.1593271, 1, 0.2039216, 0, 1,
-1.79276, 0.638973, -1.080249, 1, 0.2117647, 0, 1,
-1.791471, 1.342779, 0.68029, 1, 0.2156863, 0, 1,
-1.789946, 1.483012, -1.461795, 1, 0.2235294, 0, 1,
-1.788385, -0.9668987, -2.676573, 1, 0.227451, 0, 1,
-1.787373, 0.09969965, -1.214934, 1, 0.2352941, 0, 1,
-1.762051, -0.4293202, -1.487182, 1, 0.2392157, 0, 1,
-1.733857, 0.9243806, -1.93161, 1, 0.2470588, 0, 1,
-1.726996, 0.3482137, -1.141936, 1, 0.2509804, 0, 1,
-1.717099, -1.497146, -0.08608768, 1, 0.2588235, 0, 1,
-1.694231, -1.364531, -1.071855, 1, 0.2627451, 0, 1,
-1.685844, 0.7382571, -0.8551462, 1, 0.2705882, 0, 1,
-1.669349, 0.0112425, -1.597929, 1, 0.2745098, 0, 1,
-1.662738, -0.3983949, -1.368348, 1, 0.282353, 0, 1,
-1.656549, 0.5254241, -1.89292, 1, 0.2862745, 0, 1,
-1.654705, 0.9672883, -1.071454, 1, 0.2941177, 0, 1,
-1.626574, 0.401256, -0.7279064, 1, 0.3019608, 0, 1,
-1.621605, -1.751735, -1.285672, 1, 0.3058824, 0, 1,
-1.616917, -1.157607, -1.385653, 1, 0.3137255, 0, 1,
-1.605782, 0.604845, -0.5525452, 1, 0.3176471, 0, 1,
-1.598953, 0.3266706, -2.318394, 1, 0.3254902, 0, 1,
-1.585094, -1.553688, -2.70684, 1, 0.3294118, 0, 1,
-1.579427, -0.667186, -2.777445, 1, 0.3372549, 0, 1,
-1.575946, -1.688248, -1.315935, 1, 0.3411765, 0, 1,
-1.556414, -1.141293, -2.733142, 1, 0.3490196, 0, 1,
-1.554599, 1.64264, -0.349804, 1, 0.3529412, 0, 1,
-1.553964, 1.562005, -1.368491, 1, 0.3607843, 0, 1,
-1.553393, -1.16682, -2.225644, 1, 0.3647059, 0, 1,
-1.550903, 1.200438, -1.117054, 1, 0.372549, 0, 1,
-1.538965, -1.519654, -3.222567, 1, 0.3764706, 0, 1,
-1.536663, -1.349476, -3.199006, 1, 0.3843137, 0, 1,
-1.532125, 0.8180652, 1.46805, 1, 0.3882353, 0, 1,
-1.503204, 1.009318, -0.746396, 1, 0.3960784, 0, 1,
-1.474821, -1.723072, -4.749987, 1, 0.4039216, 0, 1,
-1.474398, 0.7514746, -0.3124205, 1, 0.4078431, 0, 1,
-1.473129, 1.153857, 0.2506863, 1, 0.4156863, 0, 1,
-1.471361, -0.5432608, -2.543511, 1, 0.4196078, 0, 1,
-1.456606, 0.616668, -1.042896, 1, 0.427451, 0, 1,
-1.451669, 1.0348, -0.0438242, 1, 0.4313726, 0, 1,
-1.41424, 0.1680654, -1.829456, 1, 0.4392157, 0, 1,
-1.406213, -1.363571, -2.296685, 1, 0.4431373, 0, 1,
-1.390118, 1.527643, -1.361975, 1, 0.4509804, 0, 1,
-1.360752, -0.5550302, -1.646692, 1, 0.454902, 0, 1,
-1.343939, 0.8043408, -1.628997, 1, 0.4627451, 0, 1,
-1.334651, 0.3560825, -0.381337, 1, 0.4666667, 0, 1,
-1.332051, 0.6454279, -2.130317, 1, 0.4745098, 0, 1,
-1.330539, 0.8146597, -1.950303, 1, 0.4784314, 0, 1,
-1.322877, -1.579472, -1.7573, 1, 0.4862745, 0, 1,
-1.316905, 0.4659368, -1.457516, 1, 0.4901961, 0, 1,
-1.309146, 0.09146189, -2.489115, 1, 0.4980392, 0, 1,
-1.30232, -0.2188201, -0.8964267, 1, 0.5058824, 0, 1,
-1.298509, -1.888594, -2.214075, 1, 0.509804, 0, 1,
-1.296821, 0.3969224, -1.924195, 1, 0.5176471, 0, 1,
-1.296605, 1.75882, 0.7818722, 1, 0.5215687, 0, 1,
-1.292045, -0.9233757, -2.824853, 1, 0.5294118, 0, 1,
-1.291658, 0.4869392, -0.2838177, 1, 0.5333334, 0, 1,
-1.28905, -0.8085766, 0.9438602, 1, 0.5411765, 0, 1,
-1.274039, 0.06157943, -1.67754, 1, 0.5450981, 0, 1,
-1.271746, 0.6210279, 0.3756159, 1, 0.5529412, 0, 1,
-1.266168, 0.2916581, -1.07409, 1, 0.5568628, 0, 1,
-1.25659, 1.418946, 1.434601, 1, 0.5647059, 0, 1,
-1.242719, 1.155235, -1.610302, 1, 0.5686275, 0, 1,
-1.239124, -0.4603965, -0.3097712, 1, 0.5764706, 0, 1,
-1.236976, -1.851097, -2.069837, 1, 0.5803922, 0, 1,
-1.227446, -1.012284, -0.9782822, 1, 0.5882353, 0, 1,
-1.221552, 0.2069782, -1.269753, 1, 0.5921569, 0, 1,
-1.218273, 1.864655, -0.9563416, 1, 0.6, 0, 1,
-1.217962, -0.5548939, -2.185801, 1, 0.6078432, 0, 1,
-1.206285, 0.04086032, -2.743668, 1, 0.6117647, 0, 1,
-1.205837, -0.6609931, -2.628118, 1, 0.6196079, 0, 1,
-1.199663, 0.5396354, -0.3195456, 1, 0.6235294, 0, 1,
-1.193232, -0.6090729, -0.86264, 1, 0.6313726, 0, 1,
-1.189867, 1.842195, -0.726953, 1, 0.6352941, 0, 1,
-1.183739, 1.587771, -0.1926211, 1, 0.6431373, 0, 1,
-1.182754, -2.519161, -1.910511, 1, 0.6470588, 0, 1,
-1.173694, 2.105626, -0.3677544, 1, 0.654902, 0, 1,
-1.172776, -1.568765, -4.592648, 1, 0.6588235, 0, 1,
-1.171282, -1.303543, -2.420977, 1, 0.6666667, 0, 1,
-1.166775, -0.5725922, -1.090371, 1, 0.6705883, 0, 1,
-1.16572, 0.1483882, -0.511831, 1, 0.6784314, 0, 1,
-1.165074, -1.748469, -0.6283017, 1, 0.682353, 0, 1,
-1.164761, -0.8167769, -2.159879, 1, 0.6901961, 0, 1,
-1.164718, 1.451103, -1.457145, 1, 0.6941177, 0, 1,
-1.161744, -0.1338915, -0.3104374, 1, 0.7019608, 0, 1,
-1.159146, -1.074004, -3.593059, 1, 0.7098039, 0, 1,
-1.156521, 2.447172, 0.3246159, 1, 0.7137255, 0, 1,
-1.153697, 0.3240734, -1.839981, 1, 0.7215686, 0, 1,
-1.151347, 0.7951764, -0.6995062, 1, 0.7254902, 0, 1,
-1.151088, -0.1551968, -1.222588, 1, 0.7333333, 0, 1,
-1.146395, 0.124113, -0.8206858, 1, 0.7372549, 0, 1,
-1.141589, -0.4633107, -0.3390398, 1, 0.7450981, 0, 1,
-1.135879, -1.789631, -2.233998, 1, 0.7490196, 0, 1,
-1.126873, -0.2495025, -3.54118, 1, 0.7568628, 0, 1,
-1.116822, -0.3252918, -1.227504, 1, 0.7607843, 0, 1,
-1.104887, 0.0537922, -1.515286, 1, 0.7686275, 0, 1,
-1.104477, -0.6984997, -2.211088, 1, 0.772549, 0, 1,
-1.098794, 0.2450071, -1.715727, 1, 0.7803922, 0, 1,
-1.097602, 1.767828, -0.7684041, 1, 0.7843137, 0, 1,
-1.097468, -1.791045, -3.016382, 1, 0.7921569, 0, 1,
-1.097359, -1.49306, -1.569716, 1, 0.7960784, 0, 1,
-1.079645, -0.4577705, -1.171652, 1, 0.8039216, 0, 1,
-1.079126, 1.385496, -2.285847, 1, 0.8117647, 0, 1,
-1.053522, 0.6092735, 0.1154898, 1, 0.8156863, 0, 1,
-1.046505, 1.281881, 0.9876716, 1, 0.8235294, 0, 1,
-1.043134, 0.1063095, -1.175362, 1, 0.827451, 0, 1,
-1.03037, -0.8903798, -2.191111, 1, 0.8352941, 0, 1,
-1.02259, 0.1248138, -1.456363, 1, 0.8392157, 0, 1,
-1.017992, 0.3514854, -1.521979, 1, 0.8470588, 0, 1,
-1.015722, -0.4759257, -0.8068653, 1, 0.8509804, 0, 1,
-0.9983467, -0.10962, -0.952597, 1, 0.8588235, 0, 1,
-0.9863832, 0.266476, -1.002224, 1, 0.8627451, 0, 1,
-0.9809198, 1.915071, 0.5696234, 1, 0.8705882, 0, 1,
-0.9801357, 0.6136868, -2.793001, 1, 0.8745098, 0, 1,
-0.9750299, -0.5804403, -1.598618, 1, 0.8823529, 0, 1,
-0.9742331, -1.125509, -1.290379, 1, 0.8862745, 0, 1,
-0.9651524, 1.259701, -0.7014537, 1, 0.8941177, 0, 1,
-0.9538715, 2.232833, -0.5674359, 1, 0.8980392, 0, 1,
-0.9497001, -0.006516069, -0.2473183, 1, 0.9058824, 0, 1,
-0.9472359, -1.470196, -2.60618, 1, 0.9137255, 0, 1,
-0.9465595, 1.344195, -0.6109718, 1, 0.9176471, 0, 1,
-0.9462703, 0.3494929, -0.8604067, 1, 0.9254902, 0, 1,
-0.945776, 0.6420811, -1.220497, 1, 0.9294118, 0, 1,
-0.9446942, 0.2320196, -1.328936, 1, 0.9372549, 0, 1,
-0.9243397, -0.4765624, -3.25542, 1, 0.9411765, 0, 1,
-0.9147427, 1.219359, -0.5904632, 1, 0.9490196, 0, 1,
-0.9094694, 0.1925433, -0.3125966, 1, 0.9529412, 0, 1,
-0.9071164, 0.2046217, -1.777882, 1, 0.9607843, 0, 1,
-0.9054795, 0.5016793, -0.7379673, 1, 0.9647059, 0, 1,
-0.904623, 0.9348114, -0.08668359, 1, 0.972549, 0, 1,
-0.8949136, 1.067777, -0.829842, 1, 0.9764706, 0, 1,
-0.8875729, 0.9506132, -0.6669046, 1, 0.9843137, 0, 1,
-0.8836277, -2.016973, -2.668899, 1, 0.9882353, 0, 1,
-0.8815368, -0.9065518, -3.238415, 1, 0.9960784, 0, 1,
-0.8768282, 0.4133445, -0.8742142, 0.9960784, 1, 0, 1,
-0.8757893, -1.691557, -2.887068, 0.9921569, 1, 0, 1,
-0.8735229, 2.588351, -0.4500346, 0.9843137, 1, 0, 1,
-0.8682271, 0.2224911, 0.9927422, 0.9803922, 1, 0, 1,
-0.8670083, 1.846661, -0.7734646, 0.972549, 1, 0, 1,
-0.8643844, 0.9465095, -0.5003489, 0.9686275, 1, 0, 1,
-0.861322, 0.2910885, -1.135404, 0.9607843, 1, 0, 1,
-0.8532282, -0.5531825, -3.49416, 0.9568627, 1, 0, 1,
-0.8519274, -0.1758593, -2.272094, 0.9490196, 1, 0, 1,
-0.8502878, -0.3949967, -0.9094358, 0.945098, 1, 0, 1,
-0.848623, -0.635357, -2.756449, 0.9372549, 1, 0, 1,
-0.8484396, -2.029513, -3.462437, 0.9333333, 1, 0, 1,
-0.8438865, -0.5932856, -1.083813, 0.9254902, 1, 0, 1,
-0.83675, -1.215601, -2.088896, 0.9215686, 1, 0, 1,
-0.8352852, 0.5315529, -2.579874, 0.9137255, 1, 0, 1,
-0.831521, -0.7830579, -1.116531, 0.9098039, 1, 0, 1,
-0.8262208, -0.7924087, -1.55315, 0.9019608, 1, 0, 1,
-0.8247336, -0.08309802, -3.633401, 0.8941177, 1, 0, 1,
-0.8242562, -0.1663707, -2.05379, 0.8901961, 1, 0, 1,
-0.8182586, -0.4713751, -0.9559321, 0.8823529, 1, 0, 1,
-0.8159668, 0.6912376, 0.3166317, 0.8784314, 1, 0, 1,
-0.8122279, -0.8427509, -3.281714, 0.8705882, 1, 0, 1,
-0.8119648, -1.574744, -1.886858, 0.8666667, 1, 0, 1,
-0.8110768, -1.803614, -1.004107, 0.8588235, 1, 0, 1,
-0.8084058, 0.332462, -0.3697131, 0.854902, 1, 0, 1,
-0.8080861, 0.2916906, -1.82221, 0.8470588, 1, 0, 1,
-0.8076435, -0.2434556, -1.120307, 0.8431373, 1, 0, 1,
-0.8067254, 2.199498, -1.691469, 0.8352941, 1, 0, 1,
-0.7999752, -0.8528308, -3.102607, 0.8313726, 1, 0, 1,
-0.7986878, 0.420584, -0.2847141, 0.8235294, 1, 0, 1,
-0.7984647, 1.153028, -0.9058623, 0.8196079, 1, 0, 1,
-0.796087, -0.149223, -0.7079135, 0.8117647, 1, 0, 1,
-0.7881879, 1.094349, -2.706791, 0.8078431, 1, 0, 1,
-0.7866231, 1.455122, 0.9570283, 0.8, 1, 0, 1,
-0.7855364, 0.6038273, -0.8162537, 0.7921569, 1, 0, 1,
-0.7773975, 0.1894703, -1.635687, 0.7882353, 1, 0, 1,
-0.7762994, -1.205101, -2.412498, 0.7803922, 1, 0, 1,
-0.7760971, 0.4857783, -0.5348327, 0.7764706, 1, 0, 1,
-0.7710516, -1.057143, -3.963148, 0.7686275, 1, 0, 1,
-0.770595, -0.09275222, -1.293543, 0.7647059, 1, 0, 1,
-0.7677371, -0.04010883, -1.161161, 0.7568628, 1, 0, 1,
-0.7669702, 0.1321755, -1.95952, 0.7529412, 1, 0, 1,
-0.7656631, -1.282168, -4.077124, 0.7450981, 1, 0, 1,
-0.7650939, 1.061951, 1.688629, 0.7411765, 1, 0, 1,
-0.7595045, -0.189882, -2.102427, 0.7333333, 1, 0, 1,
-0.7547393, -0.5874242, -1.718141, 0.7294118, 1, 0, 1,
-0.7481331, 0.7075769, 1.74779, 0.7215686, 1, 0, 1,
-0.7477727, 0.4359557, -1.083087, 0.7176471, 1, 0, 1,
-0.7455339, -0.522831, -1.204389, 0.7098039, 1, 0, 1,
-0.7448413, 2.076411, 0.6137828, 0.7058824, 1, 0, 1,
-0.7386222, 1.705993, -0.2942817, 0.6980392, 1, 0, 1,
-0.7369202, 0.2692115, -1.660297, 0.6901961, 1, 0, 1,
-0.7361134, 0.1047528, -1.311124, 0.6862745, 1, 0, 1,
-0.7277204, 0.477769, -1.01975, 0.6784314, 1, 0, 1,
-0.7199121, 0.3415271, -1.943636, 0.6745098, 1, 0, 1,
-0.7157276, 0.6960338, -1.737913, 0.6666667, 1, 0, 1,
-0.7114903, 0.2753607, -2.718469, 0.6627451, 1, 0, 1,
-0.7001771, -1.04301, -1.753278, 0.654902, 1, 0, 1,
-0.6998814, -1.049621, -4.052356, 0.6509804, 1, 0, 1,
-0.6933431, 1.576418, -0.7959549, 0.6431373, 1, 0, 1,
-0.6916977, 0.4543, -1.113505, 0.6392157, 1, 0, 1,
-0.691626, -1.064695, -2.965601, 0.6313726, 1, 0, 1,
-0.6904346, -1.16916, -3.93224, 0.627451, 1, 0, 1,
-0.6876021, -1.03478, -4.122766, 0.6196079, 1, 0, 1,
-0.6862831, -0.4024915, -2.291377, 0.6156863, 1, 0, 1,
-0.6844834, -0.3901906, -1.361312, 0.6078432, 1, 0, 1,
-0.6835782, 0.8036463, 0.6188865, 0.6039216, 1, 0, 1,
-0.6795174, 0.002911441, -1.916694, 0.5960785, 1, 0, 1,
-0.6767938, 0.6998681, -1.71627, 0.5882353, 1, 0, 1,
-0.6687837, 0.2666751, -1.87847, 0.5843138, 1, 0, 1,
-0.6628357, 0.439918, -0.511203, 0.5764706, 1, 0, 1,
-0.6618937, 0.08038361, -2.649376, 0.572549, 1, 0, 1,
-0.6615991, 0.1777391, -2.993315, 0.5647059, 1, 0, 1,
-0.6609977, -1.329617, -3.833996, 0.5607843, 1, 0, 1,
-0.6567909, -0.375457, -2.896758, 0.5529412, 1, 0, 1,
-0.6549118, 1.828159, 1.200275, 0.5490196, 1, 0, 1,
-0.6547789, 0.4412375, -0.2566984, 0.5411765, 1, 0, 1,
-0.6534883, -0.2267255, -2.406985, 0.5372549, 1, 0, 1,
-0.6513859, -0.1405161, -5.560514, 0.5294118, 1, 0, 1,
-0.6458192, -0.1880383, -0.9126438, 0.5254902, 1, 0, 1,
-0.6311427, 0.7089035, -0.8134471, 0.5176471, 1, 0, 1,
-0.6259187, -0.1730861, -3.511042, 0.5137255, 1, 0, 1,
-0.6175134, -0.8199816, -1.410609, 0.5058824, 1, 0, 1,
-0.6156182, -0.04992057, -3.499978, 0.5019608, 1, 0, 1,
-0.6150706, -0.5553479, -3.760529, 0.4941176, 1, 0, 1,
-0.6145486, 1.710877, -1.50317, 0.4862745, 1, 0, 1,
-0.6144813, 0.3492442, -0.2052622, 0.4823529, 1, 0, 1,
-0.612518, 0.5975259, -1.757247, 0.4745098, 1, 0, 1,
-0.611706, -0.3483053, -2.46491, 0.4705882, 1, 0, 1,
-0.6088295, 0.1904634, -1.479393, 0.4627451, 1, 0, 1,
-0.6086031, -1.830123, -3.753076, 0.4588235, 1, 0, 1,
-0.6062235, -1.637571, -4.425662, 0.4509804, 1, 0, 1,
-0.6039872, -0.04532673, -1.791433, 0.4470588, 1, 0, 1,
-0.6036842, -0.425052, -0.7744286, 0.4392157, 1, 0, 1,
-0.6022348, -1.986917, -3.861813, 0.4352941, 1, 0, 1,
-0.6015027, 1.958428, 0.8775672, 0.427451, 1, 0, 1,
-0.5994399, -1.894838, -1.778082, 0.4235294, 1, 0, 1,
-0.5910452, 0.1626575, 0.4665199, 0.4156863, 1, 0, 1,
-0.5908921, 0.952934, -0.3709545, 0.4117647, 1, 0, 1,
-0.5905778, -0.3101231, -3.493062, 0.4039216, 1, 0, 1,
-0.5889967, 2.264901, 1.376629, 0.3960784, 1, 0, 1,
-0.5846029, -0.3415733, -0.6518961, 0.3921569, 1, 0, 1,
-0.575485, 0.108501, -1.319861, 0.3843137, 1, 0, 1,
-0.5735967, -0.2620872, -2.686731, 0.3803922, 1, 0, 1,
-0.5701381, 0.6238219, -1.182496, 0.372549, 1, 0, 1,
-0.570072, 0.8101226, 0.3239034, 0.3686275, 1, 0, 1,
-0.5700526, -0.2195716, -1.138235, 0.3607843, 1, 0, 1,
-0.5667384, -0.8774222, -3.427652, 0.3568628, 1, 0, 1,
-0.5633441, 0.7800326, 0.1238694, 0.3490196, 1, 0, 1,
-0.5624136, -1.186781, -1.436036, 0.345098, 1, 0, 1,
-0.5575673, 0.06637736, -2.902347, 0.3372549, 1, 0, 1,
-0.5560513, -0.4574213, -2.814676, 0.3333333, 1, 0, 1,
-0.5516094, 1.140211, -1.962048, 0.3254902, 1, 0, 1,
-0.5505074, -1.321205, -1.9347, 0.3215686, 1, 0, 1,
-0.5489105, -0.1430232, -2.582664, 0.3137255, 1, 0, 1,
-0.5483761, -0.7623964, -1.556437, 0.3098039, 1, 0, 1,
-0.5475543, -1.054962, -3.08211, 0.3019608, 1, 0, 1,
-0.5464013, -1.691557, -3.045929, 0.2941177, 1, 0, 1,
-0.5405964, 0.8943254, -0.2288827, 0.2901961, 1, 0, 1,
-0.5390237, 0.7480531, 0.3680993, 0.282353, 1, 0, 1,
-0.5340077, 1.395721, -0.7418207, 0.2784314, 1, 0, 1,
-0.5326934, -3.212339, -2.74981, 0.2705882, 1, 0, 1,
-0.5325086, 1.784049, -2.622779, 0.2666667, 1, 0, 1,
-0.5292705, -2.074204, -2.351782, 0.2588235, 1, 0, 1,
-0.5270984, 1.904717, -0.6532356, 0.254902, 1, 0, 1,
-0.5269504, 0.2131708, -2.093676, 0.2470588, 1, 0, 1,
-0.5245014, 0.5894295, -0.2352865, 0.2431373, 1, 0, 1,
-0.521006, -1.053367, -1.634245, 0.2352941, 1, 0, 1,
-0.5194626, 0.8005009, -3.189089, 0.2313726, 1, 0, 1,
-0.519446, -0.7881284, -2.944846, 0.2235294, 1, 0, 1,
-0.5149657, 0.6856226, -0.02529485, 0.2196078, 1, 0, 1,
-0.510359, -0.9728876, -3.639699, 0.2117647, 1, 0, 1,
-0.5083909, 1.143986, -1.627104, 0.2078431, 1, 0, 1,
-0.5078356, -1.031224, -2.076824, 0.2, 1, 0, 1,
-0.5077726, 0.3373697, -0.6727304, 0.1921569, 1, 0, 1,
-0.5040703, 1.242627, 1.318889, 0.1882353, 1, 0, 1,
-0.5007603, 0.4619198, -1.380864, 0.1803922, 1, 0, 1,
-0.4973944, 0.4285515, -1.967119, 0.1764706, 1, 0, 1,
-0.497133, 1.169566, 0.1229323, 0.1686275, 1, 0, 1,
-0.49314, -1.204421, -2.891705, 0.1647059, 1, 0, 1,
-0.491116, -1.588281, -1.383378, 0.1568628, 1, 0, 1,
-0.4905015, 0.6820377, -1.776792, 0.1529412, 1, 0, 1,
-0.4877087, -0.5963445, -2.19899, 0.145098, 1, 0, 1,
-0.487159, 2.846689, -0.02863431, 0.1411765, 1, 0, 1,
-0.4870689, 0.7574477, 0.03819599, 0.1333333, 1, 0, 1,
-0.4849722, 0.2318846, -1.726415, 0.1294118, 1, 0, 1,
-0.4846564, 0.1986867, -0.8134233, 0.1215686, 1, 0, 1,
-0.4779636, 0.4289802, -1.116558, 0.1176471, 1, 0, 1,
-0.4678764, -0.3912024, -2.694494, 0.1098039, 1, 0, 1,
-0.4635915, -0.1530432, -2.420779, 0.1058824, 1, 0, 1,
-0.4613931, -1.895257, -3.785989, 0.09803922, 1, 0, 1,
-0.4599845, -0.4345258, -2.594417, 0.09019608, 1, 0, 1,
-0.455368, 0.09533098, -1.812201, 0.08627451, 1, 0, 1,
-0.4495086, -1.647202, -2.954527, 0.07843138, 1, 0, 1,
-0.4441925, 1.197991, 0.7814693, 0.07450981, 1, 0, 1,
-0.4421822, -1.927176, -2.536033, 0.06666667, 1, 0, 1,
-0.4419632, -1.929833, -4.945424, 0.0627451, 1, 0, 1,
-0.4415448, 0.8538837, 0.1292706, 0.05490196, 1, 0, 1,
-0.4390978, 1.470025, -1.355009, 0.05098039, 1, 0, 1,
-0.4384392, 1.70597, -0.1805358, 0.04313726, 1, 0, 1,
-0.4370975, -0.905945, -2.308296, 0.03921569, 1, 0, 1,
-0.4369927, 0.04319883, -1.020633, 0.03137255, 1, 0, 1,
-0.4341332, 1.746905, -0.2099286, 0.02745098, 1, 0, 1,
-0.4332296, 0.8396581, -0.8862565, 0.01960784, 1, 0, 1,
-0.4306162, 0.1690302, -2.113954, 0.01568628, 1, 0, 1,
-0.4275642, -0.5395848, -2.86788, 0.007843138, 1, 0, 1,
-0.4272814, -2.954514, -4.251722, 0.003921569, 1, 0, 1,
-0.426223, -0.2110285, -2.944789, 0, 1, 0.003921569, 1,
-0.4254973, 1.180817, 0.1273459, 0, 1, 0.01176471, 1,
-0.422597, -0.5622844, -2.554111, 0, 1, 0.01568628, 1,
-0.4170557, -0.6122566, -4.412985, 0, 1, 0.02352941, 1,
-0.4120997, 1.226579, -1.125431, 0, 1, 0.02745098, 1,
-0.4116713, -0.3135363, -2.40452, 0, 1, 0.03529412, 1,
-0.404368, 0.7423043, 0.9027221, 0, 1, 0.03921569, 1,
-0.3953178, -0.4485451, -2.14357, 0, 1, 0.04705882, 1,
-0.3935317, 1.554198, -0.4760401, 0, 1, 0.05098039, 1,
-0.3934858, -0.7770692, -4.536104, 0, 1, 0.05882353, 1,
-0.38658, -1.899531, -2.906731, 0, 1, 0.0627451, 1,
-0.3813913, 0.4782397, -1.091147, 0, 1, 0.07058824, 1,
-0.3744734, -0.2212678, -1.360791, 0, 1, 0.07450981, 1,
-0.3743168, -0.263018, -2.250518, 0, 1, 0.08235294, 1,
-0.366928, 1.103117, -1.516262, 0, 1, 0.08627451, 1,
-0.3653768, -0.3253599, -2.040838, 0, 1, 0.09411765, 1,
-0.3577429, 0.1121062, -0.7398299, 0, 1, 0.1019608, 1,
-0.3576108, -0.9326963, -2.597878, 0, 1, 0.1058824, 1,
-0.3573012, 0.2481053, -0.2723719, 0, 1, 0.1137255, 1,
-0.3540025, -0.8382446, -2.857824, 0, 1, 0.1176471, 1,
-0.3484172, 1.001266, -0.4196251, 0, 1, 0.1254902, 1,
-0.342189, 0.5473136, 0.273694, 0, 1, 0.1294118, 1,
-0.3357942, 0.3654113, 0.2281515, 0, 1, 0.1372549, 1,
-0.3334146, -3.065281, -2.33419, 0, 1, 0.1411765, 1,
-0.3234979, 0.9971545, -0.0617126, 0, 1, 0.1490196, 1,
-0.3227094, -0.9912357, -1.881673, 0, 1, 0.1529412, 1,
-0.320125, 0.9012781, -0.8867291, 0, 1, 0.1607843, 1,
-0.3169533, -0.7293515, -2.01377, 0, 1, 0.1647059, 1,
-0.3166007, 0.8995384, -0.4391437, 0, 1, 0.172549, 1,
-0.3155749, -0.02727438, -2.648019, 0, 1, 0.1764706, 1,
-0.3103015, 1.149493, -0.7922478, 0, 1, 0.1843137, 1,
-0.3096387, 0.5161541, -1.132834, 0, 1, 0.1882353, 1,
-0.3065334, 1.807127, -1.001567, 0, 1, 0.1960784, 1,
-0.3054422, -0.06520979, -2.121199, 0, 1, 0.2039216, 1,
-0.3019271, -0.9368945, -3.036038, 0, 1, 0.2078431, 1,
-0.299771, -1.980057, -3.079756, 0, 1, 0.2156863, 1,
-0.2987722, -0.1174036, -1.921513, 0, 1, 0.2196078, 1,
-0.2987649, 0.6251639, -1.203595, 0, 1, 0.227451, 1,
-0.2983417, 0.6241946, -0.3900923, 0, 1, 0.2313726, 1,
-0.2970278, 0.7665694, -0.4350986, 0, 1, 0.2392157, 1,
-0.2945879, -0.6318254, -1.100389, 0, 1, 0.2431373, 1,
-0.2938842, -1.039475, -3.575032, 0, 1, 0.2509804, 1,
-0.2919539, 0.2793157, -0.5603737, 0, 1, 0.254902, 1,
-0.2860978, -1.097777, -2.654068, 0, 1, 0.2627451, 1,
-0.2804731, 0.6637733, -0.7823612, 0, 1, 0.2666667, 1,
-0.2794255, -0.8908445, -5.646587, 0, 1, 0.2745098, 1,
-0.2768673, 0.6991622, 0.3437849, 0, 1, 0.2784314, 1,
-0.2762372, -1.764387, -0.7174791, 0, 1, 0.2862745, 1,
-0.2753443, -0.03714918, -2.842325, 0, 1, 0.2901961, 1,
-0.2724802, -1.207054, 0.3038455, 0, 1, 0.2980392, 1,
-0.2699385, 0.2591116, -1.604523, 0, 1, 0.3058824, 1,
-0.2629769, -1.272363, -2.64876, 0, 1, 0.3098039, 1,
-0.2552557, 0.0902879, 0.2068052, 0, 1, 0.3176471, 1,
-0.2524899, 0.9387208, 0.149431, 0, 1, 0.3215686, 1,
-0.2506708, -0.2138958, -2.552084, 0, 1, 0.3294118, 1,
-0.2484962, -0.6754054, -2.278687, 0, 1, 0.3333333, 1,
-0.248096, -0.09033426, -0.2800906, 0, 1, 0.3411765, 1,
-0.2480172, 0.1324894, -0.2851006, 0, 1, 0.345098, 1,
-0.2476619, 0.1671857, -0.4415016, 0, 1, 0.3529412, 1,
-0.2414635, 0.2531015, -2.418392, 0, 1, 0.3568628, 1,
-0.2317231, 0.485809, -0.1490176, 0, 1, 0.3647059, 1,
-0.2313308, 0.353446, -1.27982, 0, 1, 0.3686275, 1,
-0.2294412, 1.282392, -0.6157918, 0, 1, 0.3764706, 1,
-0.2214756, -0.6878384, -2.659813, 0, 1, 0.3803922, 1,
-0.2199664, -0.4207169, -3.080012, 0, 1, 0.3882353, 1,
-0.2195494, -0.2809114, -1.130225, 0, 1, 0.3921569, 1,
-0.2150981, -0.3696443, -1.985489, 0, 1, 0.4, 1,
-0.212751, -0.2820458, -1.162375, 0, 1, 0.4078431, 1,
-0.2105511, -1.106216, -2.50954, 0, 1, 0.4117647, 1,
-0.2084503, 0.2869652, -1.705714, 0, 1, 0.4196078, 1,
-0.2063518, -0.2335792, -1.9605, 0, 1, 0.4235294, 1,
-0.2062339, 0.3694993, -0.5535064, 0, 1, 0.4313726, 1,
-0.2060311, 0.900179, -0.9411623, 0, 1, 0.4352941, 1,
-0.2055627, 1.625345, -0.2900285, 0, 1, 0.4431373, 1,
-0.2044739, -0.4895775, -4.211193, 0, 1, 0.4470588, 1,
-0.2002804, -0.6127843, -2.204669, 0, 1, 0.454902, 1,
-0.1942669, -0.1790514, -3.585119, 0, 1, 0.4588235, 1,
-0.1814726, -0.3203833, -1.021818, 0, 1, 0.4666667, 1,
-0.179152, -0.427812, -3.803878, 0, 1, 0.4705882, 1,
-0.1741247, 1.912879, -0.9190719, 0, 1, 0.4784314, 1,
-0.1737845, 0.5509725, 0.1727262, 0, 1, 0.4823529, 1,
-0.1732832, 0.525322, -0.4096541, 0, 1, 0.4901961, 1,
-0.1708318, -1.27127, -1.845408, 0, 1, 0.4941176, 1,
-0.1700888, -0.5959637, -1.827277, 0, 1, 0.5019608, 1,
-0.1635594, 0.3433283, -0.641697, 0, 1, 0.509804, 1,
-0.1600597, 0.47922, -0.8829467, 0, 1, 0.5137255, 1,
-0.1563568, 0.2205692, 0.2201978, 0, 1, 0.5215687, 1,
-0.1530725, -2.221306, -2.848564, 0, 1, 0.5254902, 1,
-0.1513451, 1.814711, -0.5550855, 0, 1, 0.5333334, 1,
-0.151151, -0.3495114, -1.052831, 0, 1, 0.5372549, 1,
-0.1448412, 2.328159, -0.04864567, 0, 1, 0.5450981, 1,
-0.1445731, -1.377981, -4.026398, 0, 1, 0.5490196, 1,
-0.1400434, 0.1460057, -0.2761904, 0, 1, 0.5568628, 1,
-0.1399287, 2.456702, -0.6092564, 0, 1, 0.5607843, 1,
-0.1381581, 0.1216746, -1.291043, 0, 1, 0.5686275, 1,
-0.1378739, 0.7097128, -1.159027, 0, 1, 0.572549, 1,
-0.1354126, 1.275841, -0.5787126, 0, 1, 0.5803922, 1,
-0.1340963, -0.2671877, -2.530362, 0, 1, 0.5843138, 1,
-0.1340779, -0.03417385, -1.061514, 0, 1, 0.5921569, 1,
-0.1320881, 2.393497, 0.6304892, 0, 1, 0.5960785, 1,
-0.1319748, 1.253725, 1.01502, 0, 1, 0.6039216, 1,
-0.1311336, -0.06183739, -3.540669, 0, 1, 0.6117647, 1,
-0.1245853, 1.031509, -0.8876415, 0, 1, 0.6156863, 1,
-0.1239376, -0.1043543, -2.610431, 0, 1, 0.6235294, 1,
-0.1218887, -1.512498, -3.347456, 0, 1, 0.627451, 1,
-0.1212054, 0.7546085, 1.004601, 0, 1, 0.6352941, 1,
-0.1203063, -2.676794, -4.61451, 0, 1, 0.6392157, 1,
-0.1153618, 0.02778738, -0.4774604, 0, 1, 0.6470588, 1,
-0.1136145, 2.320303, 0.8570337, 0, 1, 0.6509804, 1,
-0.1123369, 0.5204016, -0.4558054, 0, 1, 0.6588235, 1,
-0.1111144, 0.04541266, -1.602988, 0, 1, 0.6627451, 1,
-0.1072891, -1.373979, -1.840215, 0, 1, 0.6705883, 1,
-0.1019463, -0.3138742, -2.170155, 0, 1, 0.6745098, 1,
-0.1000506, -1.808098, -3.179423, 0, 1, 0.682353, 1,
-0.09846752, 0.627664, -1.399252, 0, 1, 0.6862745, 1,
-0.09734705, 2.730437, -0.7479869, 0, 1, 0.6941177, 1,
-0.09101272, 0.2213308, -0.2981945, 0, 1, 0.7019608, 1,
-0.08666527, 1.750196, 1.193006, 0, 1, 0.7058824, 1,
-0.08059917, 0.4200597, -0.3035109, 0, 1, 0.7137255, 1,
-0.07944189, -0.8051792, -2.336084, 0, 1, 0.7176471, 1,
-0.07658108, -1.047463, -3.723071, 0, 1, 0.7254902, 1,
-0.07583637, 1.820765, -1.269162, 0, 1, 0.7294118, 1,
-0.06920209, -1.232059, -3.22008, 0, 1, 0.7372549, 1,
-0.069073, -0.9727122, -2.108167, 0, 1, 0.7411765, 1,
-0.06661853, 0.9005802, -0.996197, 0, 1, 0.7490196, 1,
-0.06335537, 0.9326221, 0.5639743, 0, 1, 0.7529412, 1,
-0.0610013, 0.3197156, -0.8835301, 0, 1, 0.7607843, 1,
-0.0585029, -1.195146, -1.233863, 0, 1, 0.7647059, 1,
-0.05512797, -1.668261, -2.95768, 0, 1, 0.772549, 1,
-0.05269155, -0.2866751, -5.011431, 0, 1, 0.7764706, 1,
-0.05158519, -0.4394487, -4.055091, 0, 1, 0.7843137, 1,
-0.05156004, -1.07279, -3.912191, 0, 1, 0.7882353, 1,
-0.05025182, 0.2329553, 0.2860209, 0, 1, 0.7960784, 1,
-0.04245988, -0.8123787, -2.021155, 0, 1, 0.8039216, 1,
-0.03737316, -0.5625825, -3.235341, 0, 1, 0.8078431, 1,
-0.03600021, 0.6521182, 1.210782, 0, 1, 0.8156863, 1,
-0.03539663, -0.4521325, -2.136528, 0, 1, 0.8196079, 1,
-0.03169803, 1.670747, -0.5428544, 0, 1, 0.827451, 1,
-0.02936346, 0.1627227, 0.9977602, 0, 1, 0.8313726, 1,
-0.02815721, 0.07878237, -0.1194032, 0, 1, 0.8392157, 1,
-0.02771906, 0.8760815, 0.6555054, 0, 1, 0.8431373, 1,
-0.02579404, -1.166303, -0.5703924, 0, 1, 0.8509804, 1,
-0.02347966, -1.549106, -3.465253, 0, 1, 0.854902, 1,
-0.02180487, -0.05682492, -2.916258, 0, 1, 0.8627451, 1,
-0.02116404, -0.005852314, -1.428668, 0, 1, 0.8666667, 1,
-0.01863452, 0.4707528, 1.623474, 0, 1, 0.8745098, 1,
-0.01817837, 0.4016354, -0.08130051, 0, 1, 0.8784314, 1,
-0.01601749, -0.04735097, -4.252075, 0, 1, 0.8862745, 1,
-0.01489212, -1.941017, -2.31129, 0, 1, 0.8901961, 1,
-0.01377768, -1.030292, -0.3447146, 0, 1, 0.8980392, 1,
-0.009968608, 1.122565, -1.341809, 0, 1, 0.9058824, 1,
-0.008453232, -0.01356258, -4.578809, 0, 1, 0.9098039, 1,
-0.008376728, -0.2903541, -2.731146, 0, 1, 0.9176471, 1,
-0.006349288, 1.345242, -0.6733013, 0, 1, 0.9215686, 1,
-0.003778414, 0.1215549, 2.680258, 0, 1, 0.9294118, 1,
-0.002028636, -0.9255096, -2.086132, 0, 1, 0.9333333, 1,
-0.0003355318, 0.6930236, 1.06554, 0, 1, 0.9411765, 1,
0.0006506802, -0.03747454, 1.779739, 0, 1, 0.945098, 1,
0.002334715, 0.3396877, -0.6130742, 0, 1, 0.9529412, 1,
0.006279085, -0.009302759, 1.651542, 0, 1, 0.9568627, 1,
0.00687504, 0.1769718, -1.328304, 0, 1, 0.9647059, 1,
0.01062866, 0.1827105, 2.901087, 0, 1, 0.9686275, 1,
0.01266871, -0.7174655, 4.257163, 0, 1, 0.9764706, 1,
0.01411418, -0.2293163, 2.842647, 0, 1, 0.9803922, 1,
0.01599336, -0.8720181, 2.143183, 0, 1, 0.9882353, 1,
0.02453921, 0.1293055, 0.5578747, 0, 1, 0.9921569, 1,
0.02471203, 0.7969782, 0.6407976, 0, 1, 1, 1,
0.02651306, 0.464756, 0.7120333, 0, 0.9921569, 1, 1,
0.02659974, -0.09313137, 1.155596, 0, 0.9882353, 1, 1,
0.02827043, -1.050741, 4.230029, 0, 0.9803922, 1, 1,
0.02923786, 1.268556, -0.7743464, 0, 0.9764706, 1, 1,
0.0304697, -1.574188, 4.78762, 0, 0.9686275, 1, 1,
0.03474537, 1.950326, -0.4590651, 0, 0.9647059, 1, 1,
0.03789424, -0.05450441, 1.989454, 0, 0.9568627, 1, 1,
0.03937065, 0.3982364, 0.2401255, 0, 0.9529412, 1, 1,
0.04137404, 0.9915793, 1.579449, 0, 0.945098, 1, 1,
0.04139034, -1.215236, 1.858203, 0, 0.9411765, 1, 1,
0.04291598, -1.302114, 2.356401, 0, 0.9333333, 1, 1,
0.04345575, -0.4750359, 2.043532, 0, 0.9294118, 1, 1,
0.04351525, 1.18931, -1.390172, 0, 0.9215686, 1, 1,
0.04409317, 1.349178, -0.7071547, 0, 0.9176471, 1, 1,
0.04860904, 0.7447031, 0.3476911, 0, 0.9098039, 1, 1,
0.05421577, 2.772371, 1.128845, 0, 0.9058824, 1, 1,
0.05747687, -2.802502, 3.861414, 0, 0.8980392, 1, 1,
0.05761002, 0.314541, 0.06561038, 0, 0.8901961, 1, 1,
0.06207102, 0.1307829, 1.064381, 0, 0.8862745, 1, 1,
0.06476353, 0.9572858, -0.3038553, 0, 0.8784314, 1, 1,
0.06995855, -0.7128513, 5.164165, 0, 0.8745098, 1, 1,
0.07187934, 0.1090786, 0.3847313, 0, 0.8666667, 1, 1,
0.08725698, 0.254439, 0.2130105, 0, 0.8627451, 1, 1,
0.08780868, 0.2722181, -0.9528023, 0, 0.854902, 1, 1,
0.09227586, -0.1650834, 2.059844, 0, 0.8509804, 1, 1,
0.0944928, -0.5898141, 2.407978, 0, 0.8431373, 1, 1,
0.09473988, -0.6207736, 2.727275, 0, 0.8392157, 1, 1,
0.09607875, 0.5144359, 0.3457476, 0, 0.8313726, 1, 1,
0.09635171, 0.412879, 1.052969, 0, 0.827451, 1, 1,
0.09692252, 1.187373, -1.141436, 0, 0.8196079, 1, 1,
0.09914982, -0.6580412, 0.7216491, 0, 0.8156863, 1, 1,
0.1045072, -0.2090794, 1.768257, 0, 0.8078431, 1, 1,
0.1051928, 1.724932, 0.1839706, 0, 0.8039216, 1, 1,
0.1059775, -1.291143, 3.940247, 0, 0.7960784, 1, 1,
0.1078816, 0.1453243, -0.9462454, 0, 0.7882353, 1, 1,
0.1089862, -0.0227775, 2.469879, 0, 0.7843137, 1, 1,
0.1158465, -1.185741, 2.715449, 0, 0.7764706, 1, 1,
0.1175797, -1.272223, 2.540632, 0, 0.772549, 1, 1,
0.1206329, -0.8711938, 3.166667, 0, 0.7647059, 1, 1,
0.1214066, -0.3249388, 1.914818, 0, 0.7607843, 1, 1,
0.126748, -0.3910305, 3.127217, 0, 0.7529412, 1, 1,
0.1269855, -0.01896522, 1.868104, 0, 0.7490196, 1, 1,
0.128692, -0.8081886, 2.704578, 0, 0.7411765, 1, 1,
0.1340708, 1.585285, 0.6201365, 0, 0.7372549, 1, 1,
0.1372898, 0.7040939, 0.0959227, 0, 0.7294118, 1, 1,
0.1401828, -1.193574, 2.13764, 0, 0.7254902, 1, 1,
0.1411511, 1.360595, -0.0398323, 0, 0.7176471, 1, 1,
0.1416488, -1.04685, 4.624812, 0, 0.7137255, 1, 1,
0.144241, 0.5809084, -2.754683, 0, 0.7058824, 1, 1,
0.1470395, -0.2105493, 3.446276, 0, 0.6980392, 1, 1,
0.1478862, 1.08539, -0.2730893, 0, 0.6941177, 1, 1,
0.1553065, 0.3252145, -0.9198248, 0, 0.6862745, 1, 1,
0.1567215, -0.3913288, 1.957667, 0, 0.682353, 1, 1,
0.1596503, -0.3581508, 3.756441, 0, 0.6745098, 1, 1,
0.1643747, -1.051753, 3.306866, 0, 0.6705883, 1, 1,
0.1650339, -0.5939904, 2.986042, 0, 0.6627451, 1, 1,
0.1677957, -0.8152503, 3.678877, 0, 0.6588235, 1, 1,
0.1689964, -0.4807481, 2.890082, 0, 0.6509804, 1, 1,
0.1719072, 1.228444, 1.811876, 0, 0.6470588, 1, 1,
0.1722999, 0.1013665, 0.709444, 0, 0.6392157, 1, 1,
0.1779839, 0.5297789, 0.3442335, 0, 0.6352941, 1, 1,
0.1787618, 0.6429778, -1.07207, 0, 0.627451, 1, 1,
0.1852244, 0.9798252, 0.314821, 0, 0.6235294, 1, 1,
0.1890502, 0.9846708, -0.4559914, 0, 0.6156863, 1, 1,
0.1894701, 0.6110523, -0.5465676, 0, 0.6117647, 1, 1,
0.1910765, -0.9688567, 0.1459722, 0, 0.6039216, 1, 1,
0.1946521, 0.04085821, 1.483078, 0, 0.5960785, 1, 1,
0.1978968, -0.4443192, 2.656163, 0, 0.5921569, 1, 1,
0.2027838, 0.1209745, 0.6243803, 0, 0.5843138, 1, 1,
0.2038195, 0.9487571, 1.482265, 0, 0.5803922, 1, 1,
0.2054264, -1.643946, 1.863229, 0, 0.572549, 1, 1,
0.2067201, 0.1718281, 2.059711, 0, 0.5686275, 1, 1,
0.2070255, 1.77728, -0.3580533, 0, 0.5607843, 1, 1,
0.2086357, -1.039849, 1.882092, 0, 0.5568628, 1, 1,
0.2114744, 0.6428908, 0.6274474, 0, 0.5490196, 1, 1,
0.2126129, 1.724811, -0.5764939, 0, 0.5450981, 1, 1,
0.2194338, 1.56923, 0.9905798, 0, 0.5372549, 1, 1,
0.2200348, -0.1380042, 2.178301, 0, 0.5333334, 1, 1,
0.2204674, -0.7177677, 2.610299, 0, 0.5254902, 1, 1,
0.2215171, -1.978685, 1.209356, 0, 0.5215687, 1, 1,
0.2226619, 1.512383, 0.09941474, 0, 0.5137255, 1, 1,
0.2232799, 1.601967, 0.2086893, 0, 0.509804, 1, 1,
0.2242028, -0.5825574, 2.341221, 0, 0.5019608, 1, 1,
0.2282673, 0.2474029, 0.6567339, 0, 0.4941176, 1, 1,
0.2293718, 1.025406, 0.03604724, 0, 0.4901961, 1, 1,
0.2334315, 0.1110266, 1.72511, 0, 0.4823529, 1, 1,
0.2347268, 0.130898, 1.054274, 0, 0.4784314, 1, 1,
0.2356991, -0.4783956, 2.640064, 0, 0.4705882, 1, 1,
0.2405756, 0.8923717, 0.873085, 0, 0.4666667, 1, 1,
0.2414602, -0.6261969, 2.496876, 0, 0.4588235, 1, 1,
0.2436832, -0.3960391, 3.981044, 0, 0.454902, 1, 1,
0.2488559, -0.3372625, 2.605026, 0, 0.4470588, 1, 1,
0.2514239, 0.9692159, 0.598272, 0, 0.4431373, 1, 1,
0.252362, 0.6418816, 0.6886564, 0, 0.4352941, 1, 1,
0.2559423, -0.4127687, 4.093296, 0, 0.4313726, 1, 1,
0.2625749, 0.8502493, 1.217284, 0, 0.4235294, 1, 1,
0.2634616, 1.204972, 1.07222, 0, 0.4196078, 1, 1,
0.2654874, 1.69669, -0.7798236, 0, 0.4117647, 1, 1,
0.2679405, -0.497646, 3.446989, 0, 0.4078431, 1, 1,
0.2700119, 0.3827682, 1.235592, 0, 0.4, 1, 1,
0.2764738, 0.4791299, 2.99056, 0, 0.3921569, 1, 1,
0.2790363, 1.020794, 0.8537552, 0, 0.3882353, 1, 1,
0.2795491, -0.7044749, 4.104048, 0, 0.3803922, 1, 1,
0.2895588, 2.08734, 0.3170106, 0, 0.3764706, 1, 1,
0.2910745, -0.7431357, 2.159138, 0, 0.3686275, 1, 1,
0.2915458, 0.28552, 1.104531, 0, 0.3647059, 1, 1,
0.2966539, 0.1088144, 0.5559384, 0, 0.3568628, 1, 1,
0.2976464, -1.648484, 2.417039, 0, 0.3529412, 1, 1,
0.2984554, 0.4730613, -0.1851517, 0, 0.345098, 1, 1,
0.3018221, 0.6773993, -0.8611598, 0, 0.3411765, 1, 1,
0.3020707, 1.605165, 0.1384121, 0, 0.3333333, 1, 1,
0.3028144, -0.9654076, 3.51334, 0, 0.3294118, 1, 1,
0.3028612, -0.1392921, -0.1677175, 0, 0.3215686, 1, 1,
0.303503, -0.007332186, 2.08007, 0, 0.3176471, 1, 1,
0.3054475, 1.874879, 1.273068, 0, 0.3098039, 1, 1,
0.307007, 1.819276, -0.983925, 0, 0.3058824, 1, 1,
0.3080422, 1.629288, -0.08746481, 0, 0.2980392, 1, 1,
0.3115875, 1.622793, 0.9165919, 0, 0.2901961, 1, 1,
0.3166651, -1.125149, 4.840845, 0, 0.2862745, 1, 1,
0.319189, 0.4762487, 1.300308, 0, 0.2784314, 1, 1,
0.3199231, -1.516474, 2.475093, 0, 0.2745098, 1, 1,
0.3203887, -0.7430041, 6.578981, 0, 0.2666667, 1, 1,
0.3208177, 0.7104077, -0.1733339, 0, 0.2627451, 1, 1,
0.3212869, 0.8481537, -0.7446846, 0, 0.254902, 1, 1,
0.3232287, -1.743078, 3.472178, 0, 0.2509804, 1, 1,
0.3257682, -0.4158733, 5.79637, 0, 0.2431373, 1, 1,
0.3276382, -0.6998617, 2.622639, 0, 0.2392157, 1, 1,
0.335347, -0.8189198, 2.440862, 0, 0.2313726, 1, 1,
0.3407824, -1.256078, 1.992296, 0, 0.227451, 1, 1,
0.3409347, 0.8594468, 1.492894, 0, 0.2196078, 1, 1,
0.3432307, 1.560116, 0.0286396, 0, 0.2156863, 1, 1,
0.3442762, -2.315324, 1.98204, 0, 0.2078431, 1, 1,
0.3445713, 0.152669, 1.832766, 0, 0.2039216, 1, 1,
0.3467235, -1.369366, 5.128406, 0, 0.1960784, 1, 1,
0.3474736, 0.2733796, 1.673239, 0, 0.1882353, 1, 1,
0.3487689, -0.6729584, 3.33716, 0, 0.1843137, 1, 1,
0.3531196, 0.6323638, 3.166613, 0, 0.1764706, 1, 1,
0.3650158, -0.8208351, 5.06851, 0, 0.172549, 1, 1,
0.3663314, 1.107817, -0.5973213, 0, 0.1647059, 1, 1,
0.3675552, 0.6397477, -0.3502663, 0, 0.1607843, 1, 1,
0.3681524, 0.9624138, 2.296579, 0, 0.1529412, 1, 1,
0.3693047, 0.03100274, 1.411609, 0, 0.1490196, 1, 1,
0.3800416, -0.7377762, 1.07113, 0, 0.1411765, 1, 1,
0.3845021, 0.5263578, 0.6125807, 0, 0.1372549, 1, 1,
0.3872124, -2.099181, 3.924853, 0, 0.1294118, 1, 1,
0.388112, 0.6663033, 1.11365, 0, 0.1254902, 1, 1,
0.3908288, 1.145974, 0.2767106, 0, 0.1176471, 1, 1,
0.391564, -1.529779, 5.591703, 0, 0.1137255, 1, 1,
0.3938797, 0.4588563, 0.2975808, 0, 0.1058824, 1, 1,
0.3944656, 1.014035, 0.5472537, 0, 0.09803922, 1, 1,
0.3956388, -0.9806844, 2.155794, 0, 0.09411765, 1, 1,
0.3967826, 1.59544, -0.4619524, 0, 0.08627451, 1, 1,
0.3971623, 0.1429792, 0.6467662, 0, 0.08235294, 1, 1,
0.4027265, 0.3144264, 0.5850171, 0, 0.07450981, 1, 1,
0.4074504, -0.3853925, 1.521363, 0, 0.07058824, 1, 1,
0.4090424, -1.100708, 2.702447, 0, 0.0627451, 1, 1,
0.4146463, 0.8142532, 0.6519119, 0, 0.05882353, 1, 1,
0.416083, -0.482529, 1.963475, 0, 0.05098039, 1, 1,
0.41609, -1.110623, 4.927372, 0, 0.04705882, 1, 1,
0.4163606, 2.493533, -0.6540319, 0, 0.03921569, 1, 1,
0.4177599, -0.06311554, 2.300863, 0, 0.03529412, 1, 1,
0.4188946, -0.1029251, 0.5684786, 0, 0.02745098, 1, 1,
0.4287586, -0.2714199, 2.64793, 0, 0.02352941, 1, 1,
0.4292273, -3.339598, 3.186789, 0, 0.01568628, 1, 1,
0.4331869, 1.921126, 0.1506645, 0, 0.01176471, 1, 1,
0.4350599, -1.40264, 2.720933, 0, 0.003921569, 1, 1,
0.4354641, 1.404998, -1.291116, 0.003921569, 0, 1, 1,
0.4371461, -0.04005026, 2.651845, 0.007843138, 0, 1, 1,
0.4382365, -0.4629873, 2.950579, 0.01568628, 0, 1, 1,
0.4405764, 1.196229, 0.2958863, 0.01960784, 0, 1, 1,
0.4444547, -1.082811, 2.616658, 0.02745098, 0, 1, 1,
0.4480292, -0.8018174, 2.168099, 0.03137255, 0, 1, 1,
0.4493657, -0.4221509, 2.588852, 0.03921569, 0, 1, 1,
0.4503449, 0.9888757, -0.2538573, 0.04313726, 0, 1, 1,
0.4567693, 0.620332, 0.4863207, 0.05098039, 0, 1, 1,
0.4573892, -0.9232126, 2.743935, 0.05490196, 0, 1, 1,
0.4601929, 0.1183674, 1.448774, 0.0627451, 0, 1, 1,
0.465982, -0.3925908, 2.470055, 0.06666667, 0, 1, 1,
0.4693303, 1.146374, 0.8273795, 0.07450981, 0, 1, 1,
0.4694036, 0.6246132, 1.789675, 0.07843138, 0, 1, 1,
0.4716801, 0.3931266, -0.09405937, 0.08627451, 0, 1, 1,
0.4731261, 1.096973, 0.7918075, 0.09019608, 0, 1, 1,
0.4738627, -0.03837654, 3.79056, 0.09803922, 0, 1, 1,
0.4799996, 0.6090908, 0.9044852, 0.1058824, 0, 1, 1,
0.4817677, 0.009573538, 0.8643309, 0.1098039, 0, 1, 1,
0.4836453, -0.7707359, 3.636001, 0.1176471, 0, 1, 1,
0.4859258, 0.0219225, 2.059913, 0.1215686, 0, 1, 1,
0.4890463, 0.2223602, 3.354962, 0.1294118, 0, 1, 1,
0.4899495, -0.005209235, 1.014681, 0.1333333, 0, 1, 1,
0.4931636, 0.5986899, 0.5569794, 0.1411765, 0, 1, 1,
0.4932957, 1.000696, -0.9144037, 0.145098, 0, 1, 1,
0.4945118, 0.06333055, 1.794544, 0.1529412, 0, 1, 1,
0.5022494, 0.1528061, 2.967359, 0.1568628, 0, 1, 1,
0.5026149, -0.5468534, 0.6161347, 0.1647059, 0, 1, 1,
0.5088757, -0.6024601, 1.857396, 0.1686275, 0, 1, 1,
0.5130557, 2.237211, -0.09420246, 0.1764706, 0, 1, 1,
0.5167137, -0.1141526, 1.440384, 0.1803922, 0, 1, 1,
0.5235714, -1.356747, 2.185632, 0.1882353, 0, 1, 1,
0.5240788, 1.479843, 0.1749086, 0.1921569, 0, 1, 1,
0.5264813, 1.930863, -1.108433, 0.2, 0, 1, 1,
0.5317487, 0.01217913, 1.547774, 0.2078431, 0, 1, 1,
0.5379338, 1.486381, 0.3981628, 0.2117647, 0, 1, 1,
0.5423023, -0.09109291, 3.394636, 0.2196078, 0, 1, 1,
0.5424348, 0.04548948, 0.526811, 0.2235294, 0, 1, 1,
0.543165, -0.5637124, 3.222384, 0.2313726, 0, 1, 1,
0.5444314, 0.04414115, 0.07380491, 0.2352941, 0, 1, 1,
0.5531141, 0.5082294, 0.5914035, 0.2431373, 0, 1, 1,
0.5567416, -1.736677, 3.840901, 0.2470588, 0, 1, 1,
0.5567749, -1.140506, 3.055157, 0.254902, 0, 1, 1,
0.559391, -0.4793022, 1.131486, 0.2588235, 0, 1, 1,
0.5617129, 0.2813663, -0.03546764, 0.2666667, 0, 1, 1,
0.5690502, 0.3809341, 0.7969677, 0.2705882, 0, 1, 1,
0.5716141, -0.2003732, 1.370522, 0.2784314, 0, 1, 1,
0.5721368, 1.020372, 0.8673221, 0.282353, 0, 1, 1,
0.5732011, -1.194838, 1.074492, 0.2901961, 0, 1, 1,
0.5783679, 0.1933292, 2.005715, 0.2941177, 0, 1, 1,
0.583401, 1.187167, -0.1694216, 0.3019608, 0, 1, 1,
0.5852729, 1.724657, -0.4321332, 0.3098039, 0, 1, 1,
0.585555, -0.9902475, 2.724691, 0.3137255, 0, 1, 1,
0.5867383, -0.7429984, 3.632984, 0.3215686, 0, 1, 1,
0.5922287, -1.0857, 2.637951, 0.3254902, 0, 1, 1,
0.5957171, -0.2887713, 0.1892163, 0.3333333, 0, 1, 1,
0.5970903, -1.648438, 3.873459, 0.3372549, 0, 1, 1,
0.6017933, 0.8661948, -0.2615297, 0.345098, 0, 1, 1,
0.6102796, 0.4503907, 0.9828921, 0.3490196, 0, 1, 1,
0.6128895, -0.6060541, 0.09363503, 0.3568628, 0, 1, 1,
0.6138146, -0.6812646, 1.968782, 0.3607843, 0, 1, 1,
0.6150517, 0.5147309, 0.3762195, 0.3686275, 0, 1, 1,
0.6181725, 1.907876, 2.095783, 0.372549, 0, 1, 1,
0.6240671, 1.568837, -1.343415, 0.3803922, 0, 1, 1,
0.6249135, 1.070244, 1.031777, 0.3843137, 0, 1, 1,
0.631036, 0.9742423, 0.8771561, 0.3921569, 0, 1, 1,
0.6315043, -0.9768851, 1.932161, 0.3960784, 0, 1, 1,
0.6333629, 1.577727, 1.159679, 0.4039216, 0, 1, 1,
0.6345976, 2.075665, 0.3247535, 0.4117647, 0, 1, 1,
0.6353421, 0.8083341, 1.13845, 0.4156863, 0, 1, 1,
0.6375086, 0.7215263, 0.633993, 0.4235294, 0, 1, 1,
0.6440729, 0.7629298, 0.4738143, 0.427451, 0, 1, 1,
0.6447657, 1.380432, 0.6152151, 0.4352941, 0, 1, 1,
0.6492594, 0.1565254, 3.181284, 0.4392157, 0, 1, 1,
0.6499264, 0.4162342, 1.181682, 0.4470588, 0, 1, 1,
0.6521062, -0.2201759, 3.237413, 0.4509804, 0, 1, 1,
0.6548565, 1.259403, 1.23424, 0.4588235, 0, 1, 1,
0.6566777, -1.692866, 2.302819, 0.4627451, 0, 1, 1,
0.6567845, -0.6582116, 3.300459, 0.4705882, 0, 1, 1,
0.6614405, 0.3448027, 0.574351, 0.4745098, 0, 1, 1,
0.6650537, 0.5223547, 2.710488, 0.4823529, 0, 1, 1,
0.6679426, -2.469387, 4.596861, 0.4862745, 0, 1, 1,
0.6696976, -0.2713403, 2.302206, 0.4941176, 0, 1, 1,
0.6736575, 0.03069384, 0.9991345, 0.5019608, 0, 1, 1,
0.6750733, -1.181873, 0.184653, 0.5058824, 0, 1, 1,
0.6854721, 1.130385, 0.9283649, 0.5137255, 0, 1, 1,
0.6889051, 0.4065444, 0.121416, 0.5176471, 0, 1, 1,
0.6964527, 1.107683, -1.101069, 0.5254902, 0, 1, 1,
0.6986554, -0.8665043, 1.322935, 0.5294118, 0, 1, 1,
0.7007949, 1.042496, 1.158888, 0.5372549, 0, 1, 1,
0.7008805, -0.7738956, 1.947018, 0.5411765, 0, 1, 1,
0.7092319, 2.07029, 0.4430355, 0.5490196, 0, 1, 1,
0.7117411, -1.023541, 3.695121, 0.5529412, 0, 1, 1,
0.7198439, -1.034892, 1.41859, 0.5607843, 0, 1, 1,
0.7226503, -0.6638016, 1.993172, 0.5647059, 0, 1, 1,
0.7232853, 0.2673889, 0.7126479, 0.572549, 0, 1, 1,
0.7296462, 1.801662, 0.007690165, 0.5764706, 0, 1, 1,
0.7368944, -1.27575, 2.740416, 0.5843138, 0, 1, 1,
0.7404097, -1.321251, 3.747349, 0.5882353, 0, 1, 1,
0.7418537, -1.150145, 1.033698, 0.5960785, 0, 1, 1,
0.7431575, 0.4249877, 1.733034, 0.6039216, 0, 1, 1,
0.7481603, -0.04420637, 2.247757, 0.6078432, 0, 1, 1,
0.7488767, 0.3336073, -0.620649, 0.6156863, 0, 1, 1,
0.7506658, 1.575505, 1.48904, 0.6196079, 0, 1, 1,
0.7516507, 0.4742963, 0.841218, 0.627451, 0, 1, 1,
0.7531016, -1.193803, 3.693002, 0.6313726, 0, 1, 1,
0.7541921, -0.172438, 3.178859, 0.6392157, 0, 1, 1,
0.7564293, 0.6824579, 0.7857907, 0.6431373, 0, 1, 1,
0.7576863, -0.2406367, 1.649345, 0.6509804, 0, 1, 1,
0.7586155, 0.9003984, 0.422251, 0.654902, 0, 1, 1,
0.7661793, -0.6591479, 2.282851, 0.6627451, 0, 1, 1,
0.7671833, 0.1091571, 2.353203, 0.6666667, 0, 1, 1,
0.7675833, -0.1347608, 3.90734, 0.6745098, 0, 1, 1,
0.7703687, 0.6720192, 1.704582, 0.6784314, 0, 1, 1,
0.7718073, -1.828751, 2.545109, 0.6862745, 0, 1, 1,
0.7803873, -1.754858, 5.115906, 0.6901961, 0, 1, 1,
0.782991, 0.2691096, 1.754855, 0.6980392, 0, 1, 1,
0.7846656, 1.192433, -1.440502, 0.7058824, 0, 1, 1,
0.7904962, -1.385339, 4.074998, 0.7098039, 0, 1, 1,
0.7994169, -0.3999245, 2.581524, 0.7176471, 0, 1, 1,
0.7999556, -0.51162, 2.953004, 0.7215686, 0, 1, 1,
0.8009673, 0.7233291, 0.7325643, 0.7294118, 0, 1, 1,
0.8023233, 0.5406081, 0.6924229, 0.7333333, 0, 1, 1,
0.8042458, -0.3510749, 0.9257435, 0.7411765, 0, 1, 1,
0.8047324, -0.1650596, 1.41234, 0.7450981, 0, 1, 1,
0.8063902, 1.0438, 2.407815, 0.7529412, 0, 1, 1,
0.806699, 0.4930176, 1.163915, 0.7568628, 0, 1, 1,
0.81157, 2.521485, 0.2360182, 0.7647059, 0, 1, 1,
0.8118694, -0.4276603, 1.813969, 0.7686275, 0, 1, 1,
0.8127638, -0.4694797, 2.210902, 0.7764706, 0, 1, 1,
0.813908, -0.8908971, 3.999142, 0.7803922, 0, 1, 1,
0.8203921, 0.7084691, -0.3922562, 0.7882353, 0, 1, 1,
0.8288853, -0.9576564, 3.509514, 0.7921569, 0, 1, 1,
0.8303047, 0.598155, 1.76396, 0.8, 0, 1, 1,
0.8384797, 1.003868, 0.0349552, 0.8078431, 0, 1, 1,
0.8474934, -0.3313687, 1.919225, 0.8117647, 0, 1, 1,
0.8523257, -0.3408975, 2.902362, 0.8196079, 0, 1, 1,
0.8736003, -0.7858931, 3.379441, 0.8235294, 0, 1, 1,
0.876784, 0.784179, 1.913452, 0.8313726, 0, 1, 1,
0.8787344, -0.9565174, 1.298838, 0.8352941, 0, 1, 1,
0.8821967, -0.8115257, 2.08671, 0.8431373, 0, 1, 1,
0.8857979, 0.6080704, 0.4345508, 0.8470588, 0, 1, 1,
0.8897518, -1.256383, 0.732378, 0.854902, 0, 1, 1,
0.8916361, 0.7323868, 1.518114, 0.8588235, 0, 1, 1,
0.8924791, 1.282125, -1.209629, 0.8666667, 0, 1, 1,
0.899006, -0.4046499, 0.7303249, 0.8705882, 0, 1, 1,
0.9032578, -0.6184998, 2.347757, 0.8784314, 0, 1, 1,
0.9034907, -0.429113, 1.578871, 0.8823529, 0, 1, 1,
0.9053684, -0.2668061, 1.191902, 0.8901961, 0, 1, 1,
0.9116812, -0.003963819, 1.493495, 0.8941177, 0, 1, 1,
0.9146709, 0.4528543, 0.7821906, 0.9019608, 0, 1, 1,
0.9183552, 0.8468175, 1.619717, 0.9098039, 0, 1, 1,
0.9215148, 0.7001218, 0.3393265, 0.9137255, 0, 1, 1,
0.925163, 0.5877241, -0.8460541, 0.9215686, 0, 1, 1,
0.9303009, -0.4215121, 3.360173, 0.9254902, 0, 1, 1,
0.9342577, -0.4931487, 1.509755, 0.9333333, 0, 1, 1,
0.9425337, 1.487645, 0.2947809, 0.9372549, 0, 1, 1,
0.9440229, -0.6338062, 1.113803, 0.945098, 0, 1, 1,
0.9440394, -0.2276418, 1.851958, 0.9490196, 0, 1, 1,
0.9482329, -0.02015148, 0.7926909, 0.9568627, 0, 1, 1,
0.9536824, 2.44604, 1.254034, 0.9607843, 0, 1, 1,
0.9548993, -0.4941231, 1.162693, 0.9686275, 0, 1, 1,
0.9568394, -2.217369, 2.260882, 0.972549, 0, 1, 1,
0.9623637, -0.3374758, 3.340652, 0.9803922, 0, 1, 1,
0.9705589, -1.503335, 3.402931, 0.9843137, 0, 1, 1,
0.9713545, 0.1504744, 2.006058, 0.9921569, 0, 1, 1,
0.9750901, -0.8519917, 2.913259, 0.9960784, 0, 1, 1,
0.9798558, 0.7415295, 1.199868, 1, 0, 0.9960784, 1,
0.9803165, -0.5620606, 1.451884, 1, 0, 0.9882353, 1,
0.9880247, -0.1959931, 2.798505, 1, 0, 0.9843137, 1,
0.9883222, -1.374641, 2.444635, 1, 0, 0.9764706, 1,
0.9999006, -1.245113, 1.584671, 1, 0, 0.972549, 1,
1.003115, 0.3080327, 1.021407, 1, 0, 0.9647059, 1,
1.013827, 0.04807024, 1.426258, 1, 0, 0.9607843, 1,
1.014822, 0.9936995, 1.534786, 1, 0, 0.9529412, 1,
1.016544, -0.07011228, 2.724149, 1, 0, 0.9490196, 1,
1.018398, 0.5560432, 0.9244613, 1, 0, 0.9411765, 1,
1.022007, -0.6323826, 2.497058, 1, 0, 0.9372549, 1,
1.03169, 1.208824, 0.7807305, 1, 0, 0.9294118, 1,
1.037894, -1.865669, 2.158319, 1, 0, 0.9254902, 1,
1.04501, -0.640302, 2.809956, 1, 0, 0.9176471, 1,
1.047195, 1.257021, 0.6709613, 1, 0, 0.9137255, 1,
1.050096, 1.287666, 2.552414, 1, 0, 0.9058824, 1,
1.052574, 0.7448936, 0.07794364, 1, 0, 0.9019608, 1,
1.055379, 0.6305242, 2.037225, 1, 0, 0.8941177, 1,
1.07391, 2.155011, 1.758198, 1, 0, 0.8862745, 1,
1.074555, 0.3762354, 0.513157, 1, 0, 0.8823529, 1,
1.076151, -0.09516308, 3.721349, 1, 0, 0.8745098, 1,
1.088955, 0.6705838, 0.5914228, 1, 0, 0.8705882, 1,
1.090312, -0.5286855, 1.630486, 1, 0, 0.8627451, 1,
1.097317, -0.9630411, 0.5100222, 1, 0, 0.8588235, 1,
1.101636, 0.6419097, 2.037782, 1, 0, 0.8509804, 1,
1.10688, -0.809392, 2.580469, 1, 0, 0.8470588, 1,
1.108037, -0.6574271, 2.41668, 1, 0, 0.8392157, 1,
1.108407, 0.1403891, 0.3851227, 1, 0, 0.8352941, 1,
1.109029, -0.4153918, 3.44463, 1, 0, 0.827451, 1,
1.109902, -0.6388019, 1.632542, 1, 0, 0.8235294, 1,
1.112659, 0.3990275, 2.916969, 1, 0, 0.8156863, 1,
1.114848, 0.8595911, 0.3035706, 1, 0, 0.8117647, 1,
1.116847, -1.46675, 2.839667, 1, 0, 0.8039216, 1,
1.120926, -1.205369, 3.048651, 1, 0, 0.7960784, 1,
1.123991, 0.2679641, 1.403682, 1, 0, 0.7921569, 1,
1.139572, 0.5192444, 0.3279609, 1, 0, 0.7843137, 1,
1.140481, -0.8653722, 3.938215, 1, 0, 0.7803922, 1,
1.151782, -0.4450461, 2.92659, 1, 0, 0.772549, 1,
1.15293, 1.167326, 2.164386, 1, 0, 0.7686275, 1,
1.153468, 1.247327, 3.119429, 1, 0, 0.7607843, 1,
1.1595, -0.8712859, 3.102581, 1, 0, 0.7568628, 1,
1.160819, -1.553146, 2.153379, 1, 0, 0.7490196, 1,
1.165991, 0.145932, 1.159468, 1, 0, 0.7450981, 1,
1.170069, 2.471074, 1.457327, 1, 0, 0.7372549, 1,
1.174574, 1.282062, 1.412665, 1, 0, 0.7333333, 1,
1.17518, -1.366385, 4.077742, 1, 0, 0.7254902, 1,
1.177589, 0.7985404, 0.6962826, 1, 0, 0.7215686, 1,
1.17832, 1.514524, -0.4950002, 1, 0, 0.7137255, 1,
1.183908, 0.02414444, 2.559372, 1, 0, 0.7098039, 1,
1.188502, 0.1281558, 1.153844, 1, 0, 0.7019608, 1,
1.210617, -0.5578905, 1.519225, 1, 0, 0.6941177, 1,
1.221931, -0.7700613, 1.783656, 1, 0, 0.6901961, 1,
1.231466, 0.1973143, 1.780731, 1, 0, 0.682353, 1,
1.235399, -1.842013, 1.530516, 1, 0, 0.6784314, 1,
1.243316, -1.020707, 2.62907, 1, 0, 0.6705883, 1,
1.250262, -0.6786408, 2.779134, 1, 0, 0.6666667, 1,
1.256203, -1.483319, 1.792807, 1, 0, 0.6588235, 1,
1.257278, 0.3285066, 1.475136, 1, 0, 0.654902, 1,
1.257657, -0.4047397, 0.458566, 1, 0, 0.6470588, 1,
1.286378, -1.128155, 3.386472, 1, 0, 0.6431373, 1,
1.287701, -1.897012, 2.82582, 1, 0, 0.6352941, 1,
1.29442, -1.214249, 1.854016, 1, 0, 0.6313726, 1,
1.303627, 0.2796547, 3.238029, 1, 0, 0.6235294, 1,
1.310158, -1.015929, 1.891011, 1, 0, 0.6196079, 1,
1.311563, 0.9008573, 0.8891062, 1, 0, 0.6117647, 1,
1.311596, 1.743282, 0.8142408, 1, 0, 0.6078432, 1,
1.315328, -0.2836774, 2.754935, 1, 0, 0.6, 1,
1.331715, -0.01421017, 1.724607, 1, 0, 0.5921569, 1,
1.340959, 1.308799, -0.2772615, 1, 0, 0.5882353, 1,
1.347665, 0.03784383, 1.252975, 1, 0, 0.5803922, 1,
1.349651, -0.488907, 2.016809, 1, 0, 0.5764706, 1,
1.349758, -0.6722604, 2.880935, 1, 0, 0.5686275, 1,
1.360292, 0.1395344, 3.072546, 1, 0, 0.5647059, 1,
1.375835, -2.814733, 3.602851, 1, 0, 0.5568628, 1,
1.381735, -1.708373, 2.556812, 1, 0, 0.5529412, 1,
1.382871, -0.1014234, 0.4379299, 1, 0, 0.5450981, 1,
1.417256, -0.915903, 0.8403829, 1, 0, 0.5411765, 1,
1.441529, -0.0002888908, 4.713802, 1, 0, 0.5333334, 1,
1.449119, -0.4314337, 1.503168, 1, 0, 0.5294118, 1,
1.459618, -0.3546903, 0.5467046, 1, 0, 0.5215687, 1,
1.461477, -0.8474417, 2.80653, 1, 0, 0.5176471, 1,
1.462035, -0.4152699, 2.257301, 1, 0, 0.509804, 1,
1.466588, -1.018619, 1.620673, 1, 0, 0.5058824, 1,
1.480045, -0.03235806, 1.747394, 1, 0, 0.4980392, 1,
1.482111, 0.01392065, 1.098882, 1, 0, 0.4901961, 1,
1.485161, 0.597681, -0.5912595, 1, 0, 0.4862745, 1,
1.493322, -0.09491329, 1.351081, 1, 0, 0.4784314, 1,
1.496849, -0.1632223, 3.451069, 1, 0, 0.4745098, 1,
1.517723, 0.3362371, 2.036933, 1, 0, 0.4666667, 1,
1.520408, 1.017619, 1.80772, 1, 0, 0.4627451, 1,
1.524818, -0.3681543, -0.2088209, 1, 0, 0.454902, 1,
1.533315, 0.9814791, 3.131169, 1, 0, 0.4509804, 1,
1.537829, 1.698954, 0.5114528, 1, 0, 0.4431373, 1,
1.539389, 0.631884, 1.121472, 1, 0, 0.4392157, 1,
1.544605, -0.5974191, 1.248369, 1, 0, 0.4313726, 1,
1.550671, 0.4069699, 2.24459, 1, 0, 0.427451, 1,
1.551315, 0.3310588, 0.6284044, 1, 0, 0.4196078, 1,
1.567013, 0.9784842, 0.477171, 1, 0, 0.4156863, 1,
1.573475, -1.734157, 3.128378, 1, 0, 0.4078431, 1,
1.580113, 1.590337, -0.1158283, 1, 0, 0.4039216, 1,
1.583033, 0.5667714, 0.4769925, 1, 0, 0.3960784, 1,
1.586589, 0.7270092, 0.0889369, 1, 0, 0.3882353, 1,
1.593034, 0.6258947, 1.441069, 1, 0, 0.3843137, 1,
1.596262, -1.387818, 2.598793, 1, 0, 0.3764706, 1,
1.598606, -0.905884, 1.223923, 1, 0, 0.372549, 1,
1.600278, 0.6780246, 0.5857466, 1, 0, 0.3647059, 1,
1.600861, -0.4545969, 0.6961731, 1, 0, 0.3607843, 1,
1.609629, 1.26979, -0.4860405, 1, 0, 0.3529412, 1,
1.610163, 0.8757111, -1.219981, 1, 0, 0.3490196, 1,
1.616994, -0.1779432, 2.989385, 1, 0, 0.3411765, 1,
1.627931, 0.9295846, 2.722788, 1, 0, 0.3372549, 1,
1.633698, 1.377917, 0.5721384, 1, 0, 0.3294118, 1,
1.651246, -0.1615604, 2.162238, 1, 0, 0.3254902, 1,
1.673012, 0.6202723, 0.03377944, 1, 0, 0.3176471, 1,
1.692833, 0.1734134, 2.954913, 1, 0, 0.3137255, 1,
1.713153, -1.885647, 2.14886, 1, 0, 0.3058824, 1,
1.719811, 0.1743941, 0.6069402, 1, 0, 0.2980392, 1,
1.753351, 0.443763, 2.392389, 1, 0, 0.2941177, 1,
1.754102, -1.037702, 0.6250252, 1, 0, 0.2862745, 1,
1.762553, 0.2461473, 1.961195, 1, 0, 0.282353, 1,
1.76346, 0.08329046, 0.9380022, 1, 0, 0.2745098, 1,
1.767122, 1.455807, 0.9152995, 1, 0, 0.2705882, 1,
1.775752, -0.5822114, 3.43764, 1, 0, 0.2627451, 1,
1.793046, 0.8964365, 1.838711, 1, 0, 0.2588235, 1,
1.81237, -0.1513634, 1.227852, 1, 0, 0.2509804, 1,
1.833637, -0.2798052, 4.808069, 1, 0, 0.2470588, 1,
1.874431, 0.1699729, 0.1743346, 1, 0, 0.2392157, 1,
1.891688, -1.683109, 3.110148, 1, 0, 0.2352941, 1,
1.9061, -0.08690072, 2.76761, 1, 0, 0.227451, 1,
1.91934, 0.5629135, 0.8475204, 1, 0, 0.2235294, 1,
1.944994, 1.047028, 1.107281, 1, 0, 0.2156863, 1,
1.952972, -1.46164, 1.747491, 1, 0, 0.2117647, 1,
1.973296, 0.4491832, 1.865922, 1, 0, 0.2039216, 1,
1.98149, -1.456558, 1.980582, 1, 0, 0.1960784, 1,
1.983214, -0.7607991, 3.342103, 1, 0, 0.1921569, 1,
1.988645, -0.1817535, 3.101865, 1, 0, 0.1843137, 1,
1.995034, -0.8623304, 3.049551, 1, 0, 0.1803922, 1,
2.000796, 0.1785033, 0.7847214, 1, 0, 0.172549, 1,
2.002921, 0.1488912, 3.237252, 1, 0, 0.1686275, 1,
2.036589, -0.4150707, 1.510733, 1, 0, 0.1607843, 1,
2.045848, -0.1183571, 1.194768, 1, 0, 0.1568628, 1,
2.128236, 0.6959624, 2.215364, 1, 0, 0.1490196, 1,
2.131392, -0.18341, 1.184399, 1, 0, 0.145098, 1,
2.165832, 0.2443898, 1.937145, 1, 0, 0.1372549, 1,
2.169692, 0.09331098, 1.430177, 1, 0, 0.1333333, 1,
2.173844, -0.1061094, 1.782944, 1, 0, 0.1254902, 1,
2.246644, 0.6941153, 0.5504525, 1, 0, 0.1215686, 1,
2.262363, 1.616386, 1.663874, 1, 0, 0.1137255, 1,
2.283534, -1.435178, 2.522877, 1, 0, 0.1098039, 1,
2.34123, -0.2699008, 2.23556, 1, 0, 0.1019608, 1,
2.353697, 0.6058233, 1.420216, 1, 0, 0.09411765, 1,
2.357675, 0.06675418, 1.470024, 1, 0, 0.09019608, 1,
2.361204, 0.5020945, 0.642787, 1, 0, 0.08235294, 1,
2.405699, -0.1968172, 1.431068, 1, 0, 0.07843138, 1,
2.458504, 0.154471, 0.07638151, 1, 0, 0.07058824, 1,
2.460304, -0.1489057, 2.652144, 1, 0, 0.06666667, 1,
2.488428, -0.2150439, 1.427377, 1, 0, 0.05882353, 1,
2.502312, 0.6972473, 1.406265, 1, 0, 0.05490196, 1,
2.530023, 0.6262982, -0.8079789, 1, 0, 0.04705882, 1,
2.616969, 1.366497, 1.448474, 1, 0, 0.04313726, 1,
2.624822, -0.4445386, 2.283476, 1, 0, 0.03529412, 1,
2.709275, 2.766698, -0.6419283, 1, 0, 0.03137255, 1,
2.73215, -0.2464735, 1.633615, 1, 0, 0.02352941, 1,
2.732894, -0.2038444, 0.2300509, 1, 0, 0.01960784, 1,
2.785329, -0.2392886, 3.338116, 1, 0, 0.01176471, 1,
3.472749, -0.3165815, 0.9437272, 1, 0, 0.007843138, 1
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
-0.06425261, -4.388174, -7.718821, 0, -0.5, 0.5, 0.5,
-0.06425261, -4.388174, -7.718821, 1, -0.5, 0.5, 0.5,
-0.06425261, -4.388174, -7.718821, 1, 1.5, 0.5, 0.5,
-0.06425261, -4.388174, -7.718821, 0, 1.5, 0.5, 0.5
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
-4.800297, -0.2464546, -7.718821, 0, -0.5, 0.5, 0.5,
-4.800297, -0.2464546, -7.718821, 1, -0.5, 0.5, 0.5,
-4.800297, -0.2464546, -7.718821, 1, 1.5, 0.5, 0.5,
-4.800297, -0.2464546, -7.718821, 0, 1.5, 0.5, 0.5
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
-4.800297, -4.388174, 0.4661968, 0, -0.5, 0.5, 0.5,
-4.800297, -4.388174, 0.4661968, 1, -0.5, 0.5, 0.5,
-4.800297, -4.388174, 0.4661968, 1, 1.5, 0.5, 0.5,
-4.800297, -4.388174, 0.4661968, 0, 1.5, 0.5, 0.5
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
-2, -3.432392, -5.829971,
2, -3.432392, -5.829971,
-2, -3.432392, -5.829971,
-2, -3.591689, -6.144779,
0, -3.432392, -5.829971,
0, -3.591689, -6.144779,
2, -3.432392, -5.829971,
2, -3.591689, -6.144779
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
-2, -3.910283, -6.774396, 0, -0.5, 0.5, 0.5,
-2, -3.910283, -6.774396, 1, -0.5, 0.5, 0.5,
-2, -3.910283, -6.774396, 1, 1.5, 0.5, 0.5,
-2, -3.910283, -6.774396, 0, 1.5, 0.5, 0.5,
0, -3.910283, -6.774396, 0, -0.5, 0.5, 0.5,
0, -3.910283, -6.774396, 1, -0.5, 0.5, 0.5,
0, -3.910283, -6.774396, 1, 1.5, 0.5, 0.5,
0, -3.910283, -6.774396, 0, 1.5, 0.5, 0.5,
2, -3.910283, -6.774396, 0, -0.5, 0.5, 0.5,
2, -3.910283, -6.774396, 1, -0.5, 0.5, 0.5,
2, -3.910283, -6.774396, 1, 1.5, 0.5, 0.5,
2, -3.910283, -6.774396, 0, 1.5, 0.5, 0.5
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
-3.707364, -3, -5.829971,
-3.707364, 2, -5.829971,
-3.707364, -3, -5.829971,
-3.889519, -3, -6.144779,
-3.707364, -2, -5.829971,
-3.889519, -2, -6.144779,
-3.707364, -1, -5.829971,
-3.889519, -1, -6.144779,
-3.707364, 0, -5.829971,
-3.889519, 0, -6.144779,
-3.707364, 1, -5.829971,
-3.889519, 1, -6.144779,
-3.707364, 2, -5.829971,
-3.889519, 2, -6.144779
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
-4.25383, -3, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, -3, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, -3, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, -3, -6.774396, 0, 1.5, 0.5, 0.5,
-4.25383, -2, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, -2, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, -2, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, -2, -6.774396, 0, 1.5, 0.5, 0.5,
-4.25383, -1, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, -1, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, -1, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, -1, -6.774396, 0, 1.5, 0.5, 0.5,
-4.25383, 0, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, 0, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, 0, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, 0, -6.774396, 0, 1.5, 0.5, 0.5,
-4.25383, 1, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, 1, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, 1, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, 1, -6.774396, 0, 1.5, 0.5, 0.5,
-4.25383, 2, -6.774396, 0, -0.5, 0.5, 0.5,
-4.25383, 2, -6.774396, 1, -0.5, 0.5, 0.5,
-4.25383, 2, -6.774396, 1, 1.5, 0.5, 0.5,
-4.25383, 2, -6.774396, 0, 1.5, 0.5, 0.5
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
-3.707364, -3.432392, -4,
-3.707364, -3.432392, 6,
-3.707364, -3.432392, -4,
-3.889519, -3.591689, -4,
-3.707364, -3.432392, -2,
-3.889519, -3.591689, -2,
-3.707364, -3.432392, 0,
-3.889519, -3.591689, 0,
-3.707364, -3.432392, 2,
-3.889519, -3.591689, 2,
-3.707364, -3.432392, 4,
-3.889519, -3.591689, 4,
-3.707364, -3.432392, 6,
-3.889519, -3.591689, 6
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
-4.25383, -3.910283, -4, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, -4, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, -4, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, -4, 0, 1.5, 0.5, 0.5,
-4.25383, -3.910283, -2, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, -2, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, -2, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, -2, 0, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 0, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 0, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 0, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 0, 0, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 2, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 2, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 2, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 2, 0, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 4, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 4, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 4, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 4, 0, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 6, 0, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 6, 1, -0.5, 0.5, 0.5,
-4.25383, -3.910283, 6, 1, 1.5, 0.5, 0.5,
-4.25383, -3.910283, 6, 0, 1.5, 0.5, 0.5
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
-3.707364, -3.432392, -5.829971,
-3.707364, 2.939483, -5.829971,
-3.707364, -3.432392, 6.762364,
-3.707364, 2.939483, 6.762364,
-3.707364, -3.432392, -5.829971,
-3.707364, -3.432392, 6.762364,
-3.707364, 2.939483, -5.829971,
-3.707364, 2.939483, 6.762364,
-3.707364, -3.432392, -5.829971,
3.578859, -3.432392, -5.829971,
-3.707364, -3.432392, 6.762364,
3.578859, -3.432392, 6.762364,
-3.707364, 2.939483, -5.829971,
3.578859, 2.939483, -5.829971,
-3.707364, 2.939483, 6.762364,
3.578859, 2.939483, 6.762364,
3.578859, -3.432392, -5.829971,
3.578859, 2.939483, -5.829971,
3.578859, -3.432392, 6.762364,
3.578859, 2.939483, 6.762364,
3.578859, -3.432392, -5.829971,
3.578859, -3.432392, 6.762364,
3.578859, 2.939483, -5.829971,
3.578859, 2.939483, 6.762364
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
var radius = 8.480996;
var distance = 37.73291;
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
mvMatrix.translate( 0.06425261, 0.2464546, -0.4661968 );
mvMatrix.scale( 1.258515, 1.439108, 0.7282064 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.73291);
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
ethyl-6-fluorobenzen<-read.table("ethyl-6-fluorobenzen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl-6-fluorobenzen$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
y<-ethyl-6-fluorobenzen$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
z<-ethyl-6-fluorobenzen$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
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
-3.601254, 0.5219132, 0.5038276, 0, 0, 1, 1, 1,
-3.120479, 0.7516614, -0.8861543, 1, 0, 0, 1, 1,
-3.048702, 0.3469131, -1.502545, 1, 0, 0, 1, 1,
-2.950609, -0.6947683, -2.130193, 1, 0, 0, 1, 1,
-2.760329, 0.9050041, -0.9996992, 1, 0, 0, 1, 1,
-2.745316, -1.393872, -2.164209, 1, 0, 0, 1, 1,
-2.687689, -0.2549089, -0.9558882, 0, 0, 0, 1, 1,
-2.653066, 0.5518411, -0.3878489, 0, 0, 0, 1, 1,
-2.530856, -1.597082, -2.043675, 0, 0, 0, 1, 1,
-2.467647, 0.8676525, -1.01494, 0, 0, 0, 1, 1,
-2.424836, -0.8169081, -1.031214, 0, 0, 0, 1, 1,
-2.38861, 0.4405607, 0.3437787, 0, 0, 0, 1, 1,
-2.385305, -0.7662845, -2.674448, 0, 0, 0, 1, 1,
-2.326497, 0.8869008, -1.379664, 1, 1, 1, 1, 1,
-2.30051, 0.2117242, -2.223545, 1, 1, 1, 1, 1,
-2.264859, -0.2557708, -1.917102, 1, 1, 1, 1, 1,
-2.254186, 1.612352, 0.2630209, 1, 1, 1, 1, 1,
-2.189393, -0.9399204, -2.001671, 1, 1, 1, 1, 1,
-2.179283, 0.6976323, -4.022388, 1, 1, 1, 1, 1,
-2.178055, -2.020068, -3.471614, 1, 1, 1, 1, 1,
-2.158567, -0.4145351, -1.194403, 1, 1, 1, 1, 1,
-2.129131, -0.0247049, -1.642278, 1, 1, 1, 1, 1,
-2.090615, 1.440843, -1.07769, 1, 1, 1, 1, 1,
-2.059455, -0.1055137, -3.663485, 1, 1, 1, 1, 1,
-1.993676, 1.045398, -0.1237801, 1, 1, 1, 1, 1,
-1.962875, -0.9565872, -2.090686, 1, 1, 1, 1, 1,
-1.946597, 0.1617971, -2.260929, 1, 1, 1, 1, 1,
-1.935483, 1.612853, -0.390097, 1, 1, 1, 1, 1,
-1.933559, 0.7558123, -0.9502466, 0, 0, 1, 1, 1,
-1.848466, -0.7366029, -2.757292, 1, 0, 0, 1, 1,
-1.841934, -1.041747, -3.004997, 1, 0, 0, 1, 1,
-1.836744, -0.4689188, -1.73166, 1, 0, 0, 1, 1,
-1.827483, -0.6804568, -2.917306, 1, 0, 0, 1, 1,
-1.812274, -1.970822, -3.011387, 1, 0, 0, 1, 1,
-1.799943, -0.6482029, -0.1593271, 0, 0, 0, 1, 1,
-1.79276, 0.638973, -1.080249, 0, 0, 0, 1, 1,
-1.791471, 1.342779, 0.68029, 0, 0, 0, 1, 1,
-1.789946, 1.483012, -1.461795, 0, 0, 0, 1, 1,
-1.788385, -0.9668987, -2.676573, 0, 0, 0, 1, 1,
-1.787373, 0.09969965, -1.214934, 0, 0, 0, 1, 1,
-1.762051, -0.4293202, -1.487182, 0, 0, 0, 1, 1,
-1.733857, 0.9243806, -1.93161, 1, 1, 1, 1, 1,
-1.726996, 0.3482137, -1.141936, 1, 1, 1, 1, 1,
-1.717099, -1.497146, -0.08608768, 1, 1, 1, 1, 1,
-1.694231, -1.364531, -1.071855, 1, 1, 1, 1, 1,
-1.685844, 0.7382571, -0.8551462, 1, 1, 1, 1, 1,
-1.669349, 0.0112425, -1.597929, 1, 1, 1, 1, 1,
-1.662738, -0.3983949, -1.368348, 1, 1, 1, 1, 1,
-1.656549, 0.5254241, -1.89292, 1, 1, 1, 1, 1,
-1.654705, 0.9672883, -1.071454, 1, 1, 1, 1, 1,
-1.626574, 0.401256, -0.7279064, 1, 1, 1, 1, 1,
-1.621605, -1.751735, -1.285672, 1, 1, 1, 1, 1,
-1.616917, -1.157607, -1.385653, 1, 1, 1, 1, 1,
-1.605782, 0.604845, -0.5525452, 1, 1, 1, 1, 1,
-1.598953, 0.3266706, -2.318394, 1, 1, 1, 1, 1,
-1.585094, -1.553688, -2.70684, 1, 1, 1, 1, 1,
-1.579427, -0.667186, -2.777445, 0, 0, 1, 1, 1,
-1.575946, -1.688248, -1.315935, 1, 0, 0, 1, 1,
-1.556414, -1.141293, -2.733142, 1, 0, 0, 1, 1,
-1.554599, 1.64264, -0.349804, 1, 0, 0, 1, 1,
-1.553964, 1.562005, -1.368491, 1, 0, 0, 1, 1,
-1.553393, -1.16682, -2.225644, 1, 0, 0, 1, 1,
-1.550903, 1.200438, -1.117054, 0, 0, 0, 1, 1,
-1.538965, -1.519654, -3.222567, 0, 0, 0, 1, 1,
-1.536663, -1.349476, -3.199006, 0, 0, 0, 1, 1,
-1.532125, 0.8180652, 1.46805, 0, 0, 0, 1, 1,
-1.503204, 1.009318, -0.746396, 0, 0, 0, 1, 1,
-1.474821, -1.723072, -4.749987, 0, 0, 0, 1, 1,
-1.474398, 0.7514746, -0.3124205, 0, 0, 0, 1, 1,
-1.473129, 1.153857, 0.2506863, 1, 1, 1, 1, 1,
-1.471361, -0.5432608, -2.543511, 1, 1, 1, 1, 1,
-1.456606, 0.616668, -1.042896, 1, 1, 1, 1, 1,
-1.451669, 1.0348, -0.0438242, 1, 1, 1, 1, 1,
-1.41424, 0.1680654, -1.829456, 1, 1, 1, 1, 1,
-1.406213, -1.363571, -2.296685, 1, 1, 1, 1, 1,
-1.390118, 1.527643, -1.361975, 1, 1, 1, 1, 1,
-1.360752, -0.5550302, -1.646692, 1, 1, 1, 1, 1,
-1.343939, 0.8043408, -1.628997, 1, 1, 1, 1, 1,
-1.334651, 0.3560825, -0.381337, 1, 1, 1, 1, 1,
-1.332051, 0.6454279, -2.130317, 1, 1, 1, 1, 1,
-1.330539, 0.8146597, -1.950303, 1, 1, 1, 1, 1,
-1.322877, -1.579472, -1.7573, 1, 1, 1, 1, 1,
-1.316905, 0.4659368, -1.457516, 1, 1, 1, 1, 1,
-1.309146, 0.09146189, -2.489115, 1, 1, 1, 1, 1,
-1.30232, -0.2188201, -0.8964267, 0, 0, 1, 1, 1,
-1.298509, -1.888594, -2.214075, 1, 0, 0, 1, 1,
-1.296821, 0.3969224, -1.924195, 1, 0, 0, 1, 1,
-1.296605, 1.75882, 0.7818722, 1, 0, 0, 1, 1,
-1.292045, -0.9233757, -2.824853, 1, 0, 0, 1, 1,
-1.291658, 0.4869392, -0.2838177, 1, 0, 0, 1, 1,
-1.28905, -0.8085766, 0.9438602, 0, 0, 0, 1, 1,
-1.274039, 0.06157943, -1.67754, 0, 0, 0, 1, 1,
-1.271746, 0.6210279, 0.3756159, 0, 0, 0, 1, 1,
-1.266168, 0.2916581, -1.07409, 0, 0, 0, 1, 1,
-1.25659, 1.418946, 1.434601, 0, 0, 0, 1, 1,
-1.242719, 1.155235, -1.610302, 0, 0, 0, 1, 1,
-1.239124, -0.4603965, -0.3097712, 0, 0, 0, 1, 1,
-1.236976, -1.851097, -2.069837, 1, 1, 1, 1, 1,
-1.227446, -1.012284, -0.9782822, 1, 1, 1, 1, 1,
-1.221552, 0.2069782, -1.269753, 1, 1, 1, 1, 1,
-1.218273, 1.864655, -0.9563416, 1, 1, 1, 1, 1,
-1.217962, -0.5548939, -2.185801, 1, 1, 1, 1, 1,
-1.206285, 0.04086032, -2.743668, 1, 1, 1, 1, 1,
-1.205837, -0.6609931, -2.628118, 1, 1, 1, 1, 1,
-1.199663, 0.5396354, -0.3195456, 1, 1, 1, 1, 1,
-1.193232, -0.6090729, -0.86264, 1, 1, 1, 1, 1,
-1.189867, 1.842195, -0.726953, 1, 1, 1, 1, 1,
-1.183739, 1.587771, -0.1926211, 1, 1, 1, 1, 1,
-1.182754, -2.519161, -1.910511, 1, 1, 1, 1, 1,
-1.173694, 2.105626, -0.3677544, 1, 1, 1, 1, 1,
-1.172776, -1.568765, -4.592648, 1, 1, 1, 1, 1,
-1.171282, -1.303543, -2.420977, 1, 1, 1, 1, 1,
-1.166775, -0.5725922, -1.090371, 0, 0, 1, 1, 1,
-1.16572, 0.1483882, -0.511831, 1, 0, 0, 1, 1,
-1.165074, -1.748469, -0.6283017, 1, 0, 0, 1, 1,
-1.164761, -0.8167769, -2.159879, 1, 0, 0, 1, 1,
-1.164718, 1.451103, -1.457145, 1, 0, 0, 1, 1,
-1.161744, -0.1338915, -0.3104374, 1, 0, 0, 1, 1,
-1.159146, -1.074004, -3.593059, 0, 0, 0, 1, 1,
-1.156521, 2.447172, 0.3246159, 0, 0, 0, 1, 1,
-1.153697, 0.3240734, -1.839981, 0, 0, 0, 1, 1,
-1.151347, 0.7951764, -0.6995062, 0, 0, 0, 1, 1,
-1.151088, -0.1551968, -1.222588, 0, 0, 0, 1, 1,
-1.146395, 0.124113, -0.8206858, 0, 0, 0, 1, 1,
-1.141589, -0.4633107, -0.3390398, 0, 0, 0, 1, 1,
-1.135879, -1.789631, -2.233998, 1, 1, 1, 1, 1,
-1.126873, -0.2495025, -3.54118, 1, 1, 1, 1, 1,
-1.116822, -0.3252918, -1.227504, 1, 1, 1, 1, 1,
-1.104887, 0.0537922, -1.515286, 1, 1, 1, 1, 1,
-1.104477, -0.6984997, -2.211088, 1, 1, 1, 1, 1,
-1.098794, 0.2450071, -1.715727, 1, 1, 1, 1, 1,
-1.097602, 1.767828, -0.7684041, 1, 1, 1, 1, 1,
-1.097468, -1.791045, -3.016382, 1, 1, 1, 1, 1,
-1.097359, -1.49306, -1.569716, 1, 1, 1, 1, 1,
-1.079645, -0.4577705, -1.171652, 1, 1, 1, 1, 1,
-1.079126, 1.385496, -2.285847, 1, 1, 1, 1, 1,
-1.053522, 0.6092735, 0.1154898, 1, 1, 1, 1, 1,
-1.046505, 1.281881, 0.9876716, 1, 1, 1, 1, 1,
-1.043134, 0.1063095, -1.175362, 1, 1, 1, 1, 1,
-1.03037, -0.8903798, -2.191111, 1, 1, 1, 1, 1,
-1.02259, 0.1248138, -1.456363, 0, 0, 1, 1, 1,
-1.017992, 0.3514854, -1.521979, 1, 0, 0, 1, 1,
-1.015722, -0.4759257, -0.8068653, 1, 0, 0, 1, 1,
-0.9983467, -0.10962, -0.952597, 1, 0, 0, 1, 1,
-0.9863832, 0.266476, -1.002224, 1, 0, 0, 1, 1,
-0.9809198, 1.915071, 0.5696234, 1, 0, 0, 1, 1,
-0.9801357, 0.6136868, -2.793001, 0, 0, 0, 1, 1,
-0.9750299, -0.5804403, -1.598618, 0, 0, 0, 1, 1,
-0.9742331, -1.125509, -1.290379, 0, 0, 0, 1, 1,
-0.9651524, 1.259701, -0.7014537, 0, 0, 0, 1, 1,
-0.9538715, 2.232833, -0.5674359, 0, 0, 0, 1, 1,
-0.9497001, -0.006516069, -0.2473183, 0, 0, 0, 1, 1,
-0.9472359, -1.470196, -2.60618, 0, 0, 0, 1, 1,
-0.9465595, 1.344195, -0.6109718, 1, 1, 1, 1, 1,
-0.9462703, 0.3494929, -0.8604067, 1, 1, 1, 1, 1,
-0.945776, 0.6420811, -1.220497, 1, 1, 1, 1, 1,
-0.9446942, 0.2320196, -1.328936, 1, 1, 1, 1, 1,
-0.9243397, -0.4765624, -3.25542, 1, 1, 1, 1, 1,
-0.9147427, 1.219359, -0.5904632, 1, 1, 1, 1, 1,
-0.9094694, 0.1925433, -0.3125966, 1, 1, 1, 1, 1,
-0.9071164, 0.2046217, -1.777882, 1, 1, 1, 1, 1,
-0.9054795, 0.5016793, -0.7379673, 1, 1, 1, 1, 1,
-0.904623, 0.9348114, -0.08668359, 1, 1, 1, 1, 1,
-0.8949136, 1.067777, -0.829842, 1, 1, 1, 1, 1,
-0.8875729, 0.9506132, -0.6669046, 1, 1, 1, 1, 1,
-0.8836277, -2.016973, -2.668899, 1, 1, 1, 1, 1,
-0.8815368, -0.9065518, -3.238415, 1, 1, 1, 1, 1,
-0.8768282, 0.4133445, -0.8742142, 1, 1, 1, 1, 1,
-0.8757893, -1.691557, -2.887068, 0, 0, 1, 1, 1,
-0.8735229, 2.588351, -0.4500346, 1, 0, 0, 1, 1,
-0.8682271, 0.2224911, 0.9927422, 1, 0, 0, 1, 1,
-0.8670083, 1.846661, -0.7734646, 1, 0, 0, 1, 1,
-0.8643844, 0.9465095, -0.5003489, 1, 0, 0, 1, 1,
-0.861322, 0.2910885, -1.135404, 1, 0, 0, 1, 1,
-0.8532282, -0.5531825, -3.49416, 0, 0, 0, 1, 1,
-0.8519274, -0.1758593, -2.272094, 0, 0, 0, 1, 1,
-0.8502878, -0.3949967, -0.9094358, 0, 0, 0, 1, 1,
-0.848623, -0.635357, -2.756449, 0, 0, 0, 1, 1,
-0.8484396, -2.029513, -3.462437, 0, 0, 0, 1, 1,
-0.8438865, -0.5932856, -1.083813, 0, 0, 0, 1, 1,
-0.83675, -1.215601, -2.088896, 0, 0, 0, 1, 1,
-0.8352852, 0.5315529, -2.579874, 1, 1, 1, 1, 1,
-0.831521, -0.7830579, -1.116531, 1, 1, 1, 1, 1,
-0.8262208, -0.7924087, -1.55315, 1, 1, 1, 1, 1,
-0.8247336, -0.08309802, -3.633401, 1, 1, 1, 1, 1,
-0.8242562, -0.1663707, -2.05379, 1, 1, 1, 1, 1,
-0.8182586, -0.4713751, -0.9559321, 1, 1, 1, 1, 1,
-0.8159668, 0.6912376, 0.3166317, 1, 1, 1, 1, 1,
-0.8122279, -0.8427509, -3.281714, 1, 1, 1, 1, 1,
-0.8119648, -1.574744, -1.886858, 1, 1, 1, 1, 1,
-0.8110768, -1.803614, -1.004107, 1, 1, 1, 1, 1,
-0.8084058, 0.332462, -0.3697131, 1, 1, 1, 1, 1,
-0.8080861, 0.2916906, -1.82221, 1, 1, 1, 1, 1,
-0.8076435, -0.2434556, -1.120307, 1, 1, 1, 1, 1,
-0.8067254, 2.199498, -1.691469, 1, 1, 1, 1, 1,
-0.7999752, -0.8528308, -3.102607, 1, 1, 1, 1, 1,
-0.7986878, 0.420584, -0.2847141, 0, 0, 1, 1, 1,
-0.7984647, 1.153028, -0.9058623, 1, 0, 0, 1, 1,
-0.796087, -0.149223, -0.7079135, 1, 0, 0, 1, 1,
-0.7881879, 1.094349, -2.706791, 1, 0, 0, 1, 1,
-0.7866231, 1.455122, 0.9570283, 1, 0, 0, 1, 1,
-0.7855364, 0.6038273, -0.8162537, 1, 0, 0, 1, 1,
-0.7773975, 0.1894703, -1.635687, 0, 0, 0, 1, 1,
-0.7762994, -1.205101, -2.412498, 0, 0, 0, 1, 1,
-0.7760971, 0.4857783, -0.5348327, 0, 0, 0, 1, 1,
-0.7710516, -1.057143, -3.963148, 0, 0, 0, 1, 1,
-0.770595, -0.09275222, -1.293543, 0, 0, 0, 1, 1,
-0.7677371, -0.04010883, -1.161161, 0, 0, 0, 1, 1,
-0.7669702, 0.1321755, -1.95952, 0, 0, 0, 1, 1,
-0.7656631, -1.282168, -4.077124, 1, 1, 1, 1, 1,
-0.7650939, 1.061951, 1.688629, 1, 1, 1, 1, 1,
-0.7595045, -0.189882, -2.102427, 1, 1, 1, 1, 1,
-0.7547393, -0.5874242, -1.718141, 1, 1, 1, 1, 1,
-0.7481331, 0.7075769, 1.74779, 1, 1, 1, 1, 1,
-0.7477727, 0.4359557, -1.083087, 1, 1, 1, 1, 1,
-0.7455339, -0.522831, -1.204389, 1, 1, 1, 1, 1,
-0.7448413, 2.076411, 0.6137828, 1, 1, 1, 1, 1,
-0.7386222, 1.705993, -0.2942817, 1, 1, 1, 1, 1,
-0.7369202, 0.2692115, -1.660297, 1, 1, 1, 1, 1,
-0.7361134, 0.1047528, -1.311124, 1, 1, 1, 1, 1,
-0.7277204, 0.477769, -1.01975, 1, 1, 1, 1, 1,
-0.7199121, 0.3415271, -1.943636, 1, 1, 1, 1, 1,
-0.7157276, 0.6960338, -1.737913, 1, 1, 1, 1, 1,
-0.7114903, 0.2753607, -2.718469, 1, 1, 1, 1, 1,
-0.7001771, -1.04301, -1.753278, 0, 0, 1, 1, 1,
-0.6998814, -1.049621, -4.052356, 1, 0, 0, 1, 1,
-0.6933431, 1.576418, -0.7959549, 1, 0, 0, 1, 1,
-0.6916977, 0.4543, -1.113505, 1, 0, 0, 1, 1,
-0.691626, -1.064695, -2.965601, 1, 0, 0, 1, 1,
-0.6904346, -1.16916, -3.93224, 1, 0, 0, 1, 1,
-0.6876021, -1.03478, -4.122766, 0, 0, 0, 1, 1,
-0.6862831, -0.4024915, -2.291377, 0, 0, 0, 1, 1,
-0.6844834, -0.3901906, -1.361312, 0, 0, 0, 1, 1,
-0.6835782, 0.8036463, 0.6188865, 0, 0, 0, 1, 1,
-0.6795174, 0.002911441, -1.916694, 0, 0, 0, 1, 1,
-0.6767938, 0.6998681, -1.71627, 0, 0, 0, 1, 1,
-0.6687837, 0.2666751, -1.87847, 0, 0, 0, 1, 1,
-0.6628357, 0.439918, -0.511203, 1, 1, 1, 1, 1,
-0.6618937, 0.08038361, -2.649376, 1, 1, 1, 1, 1,
-0.6615991, 0.1777391, -2.993315, 1, 1, 1, 1, 1,
-0.6609977, -1.329617, -3.833996, 1, 1, 1, 1, 1,
-0.6567909, -0.375457, -2.896758, 1, 1, 1, 1, 1,
-0.6549118, 1.828159, 1.200275, 1, 1, 1, 1, 1,
-0.6547789, 0.4412375, -0.2566984, 1, 1, 1, 1, 1,
-0.6534883, -0.2267255, -2.406985, 1, 1, 1, 1, 1,
-0.6513859, -0.1405161, -5.560514, 1, 1, 1, 1, 1,
-0.6458192, -0.1880383, -0.9126438, 1, 1, 1, 1, 1,
-0.6311427, 0.7089035, -0.8134471, 1, 1, 1, 1, 1,
-0.6259187, -0.1730861, -3.511042, 1, 1, 1, 1, 1,
-0.6175134, -0.8199816, -1.410609, 1, 1, 1, 1, 1,
-0.6156182, -0.04992057, -3.499978, 1, 1, 1, 1, 1,
-0.6150706, -0.5553479, -3.760529, 1, 1, 1, 1, 1,
-0.6145486, 1.710877, -1.50317, 0, 0, 1, 1, 1,
-0.6144813, 0.3492442, -0.2052622, 1, 0, 0, 1, 1,
-0.612518, 0.5975259, -1.757247, 1, 0, 0, 1, 1,
-0.611706, -0.3483053, -2.46491, 1, 0, 0, 1, 1,
-0.6088295, 0.1904634, -1.479393, 1, 0, 0, 1, 1,
-0.6086031, -1.830123, -3.753076, 1, 0, 0, 1, 1,
-0.6062235, -1.637571, -4.425662, 0, 0, 0, 1, 1,
-0.6039872, -0.04532673, -1.791433, 0, 0, 0, 1, 1,
-0.6036842, -0.425052, -0.7744286, 0, 0, 0, 1, 1,
-0.6022348, -1.986917, -3.861813, 0, 0, 0, 1, 1,
-0.6015027, 1.958428, 0.8775672, 0, 0, 0, 1, 1,
-0.5994399, -1.894838, -1.778082, 0, 0, 0, 1, 1,
-0.5910452, 0.1626575, 0.4665199, 0, 0, 0, 1, 1,
-0.5908921, 0.952934, -0.3709545, 1, 1, 1, 1, 1,
-0.5905778, -0.3101231, -3.493062, 1, 1, 1, 1, 1,
-0.5889967, 2.264901, 1.376629, 1, 1, 1, 1, 1,
-0.5846029, -0.3415733, -0.6518961, 1, 1, 1, 1, 1,
-0.575485, 0.108501, -1.319861, 1, 1, 1, 1, 1,
-0.5735967, -0.2620872, -2.686731, 1, 1, 1, 1, 1,
-0.5701381, 0.6238219, -1.182496, 1, 1, 1, 1, 1,
-0.570072, 0.8101226, 0.3239034, 1, 1, 1, 1, 1,
-0.5700526, -0.2195716, -1.138235, 1, 1, 1, 1, 1,
-0.5667384, -0.8774222, -3.427652, 1, 1, 1, 1, 1,
-0.5633441, 0.7800326, 0.1238694, 1, 1, 1, 1, 1,
-0.5624136, -1.186781, -1.436036, 1, 1, 1, 1, 1,
-0.5575673, 0.06637736, -2.902347, 1, 1, 1, 1, 1,
-0.5560513, -0.4574213, -2.814676, 1, 1, 1, 1, 1,
-0.5516094, 1.140211, -1.962048, 1, 1, 1, 1, 1,
-0.5505074, -1.321205, -1.9347, 0, 0, 1, 1, 1,
-0.5489105, -0.1430232, -2.582664, 1, 0, 0, 1, 1,
-0.5483761, -0.7623964, -1.556437, 1, 0, 0, 1, 1,
-0.5475543, -1.054962, -3.08211, 1, 0, 0, 1, 1,
-0.5464013, -1.691557, -3.045929, 1, 0, 0, 1, 1,
-0.5405964, 0.8943254, -0.2288827, 1, 0, 0, 1, 1,
-0.5390237, 0.7480531, 0.3680993, 0, 0, 0, 1, 1,
-0.5340077, 1.395721, -0.7418207, 0, 0, 0, 1, 1,
-0.5326934, -3.212339, -2.74981, 0, 0, 0, 1, 1,
-0.5325086, 1.784049, -2.622779, 0, 0, 0, 1, 1,
-0.5292705, -2.074204, -2.351782, 0, 0, 0, 1, 1,
-0.5270984, 1.904717, -0.6532356, 0, 0, 0, 1, 1,
-0.5269504, 0.2131708, -2.093676, 0, 0, 0, 1, 1,
-0.5245014, 0.5894295, -0.2352865, 1, 1, 1, 1, 1,
-0.521006, -1.053367, -1.634245, 1, 1, 1, 1, 1,
-0.5194626, 0.8005009, -3.189089, 1, 1, 1, 1, 1,
-0.519446, -0.7881284, -2.944846, 1, 1, 1, 1, 1,
-0.5149657, 0.6856226, -0.02529485, 1, 1, 1, 1, 1,
-0.510359, -0.9728876, -3.639699, 1, 1, 1, 1, 1,
-0.5083909, 1.143986, -1.627104, 1, 1, 1, 1, 1,
-0.5078356, -1.031224, -2.076824, 1, 1, 1, 1, 1,
-0.5077726, 0.3373697, -0.6727304, 1, 1, 1, 1, 1,
-0.5040703, 1.242627, 1.318889, 1, 1, 1, 1, 1,
-0.5007603, 0.4619198, -1.380864, 1, 1, 1, 1, 1,
-0.4973944, 0.4285515, -1.967119, 1, 1, 1, 1, 1,
-0.497133, 1.169566, 0.1229323, 1, 1, 1, 1, 1,
-0.49314, -1.204421, -2.891705, 1, 1, 1, 1, 1,
-0.491116, -1.588281, -1.383378, 1, 1, 1, 1, 1,
-0.4905015, 0.6820377, -1.776792, 0, 0, 1, 1, 1,
-0.4877087, -0.5963445, -2.19899, 1, 0, 0, 1, 1,
-0.487159, 2.846689, -0.02863431, 1, 0, 0, 1, 1,
-0.4870689, 0.7574477, 0.03819599, 1, 0, 0, 1, 1,
-0.4849722, 0.2318846, -1.726415, 1, 0, 0, 1, 1,
-0.4846564, 0.1986867, -0.8134233, 1, 0, 0, 1, 1,
-0.4779636, 0.4289802, -1.116558, 0, 0, 0, 1, 1,
-0.4678764, -0.3912024, -2.694494, 0, 0, 0, 1, 1,
-0.4635915, -0.1530432, -2.420779, 0, 0, 0, 1, 1,
-0.4613931, -1.895257, -3.785989, 0, 0, 0, 1, 1,
-0.4599845, -0.4345258, -2.594417, 0, 0, 0, 1, 1,
-0.455368, 0.09533098, -1.812201, 0, 0, 0, 1, 1,
-0.4495086, -1.647202, -2.954527, 0, 0, 0, 1, 1,
-0.4441925, 1.197991, 0.7814693, 1, 1, 1, 1, 1,
-0.4421822, -1.927176, -2.536033, 1, 1, 1, 1, 1,
-0.4419632, -1.929833, -4.945424, 1, 1, 1, 1, 1,
-0.4415448, 0.8538837, 0.1292706, 1, 1, 1, 1, 1,
-0.4390978, 1.470025, -1.355009, 1, 1, 1, 1, 1,
-0.4384392, 1.70597, -0.1805358, 1, 1, 1, 1, 1,
-0.4370975, -0.905945, -2.308296, 1, 1, 1, 1, 1,
-0.4369927, 0.04319883, -1.020633, 1, 1, 1, 1, 1,
-0.4341332, 1.746905, -0.2099286, 1, 1, 1, 1, 1,
-0.4332296, 0.8396581, -0.8862565, 1, 1, 1, 1, 1,
-0.4306162, 0.1690302, -2.113954, 1, 1, 1, 1, 1,
-0.4275642, -0.5395848, -2.86788, 1, 1, 1, 1, 1,
-0.4272814, -2.954514, -4.251722, 1, 1, 1, 1, 1,
-0.426223, -0.2110285, -2.944789, 1, 1, 1, 1, 1,
-0.4254973, 1.180817, 0.1273459, 1, 1, 1, 1, 1,
-0.422597, -0.5622844, -2.554111, 0, 0, 1, 1, 1,
-0.4170557, -0.6122566, -4.412985, 1, 0, 0, 1, 1,
-0.4120997, 1.226579, -1.125431, 1, 0, 0, 1, 1,
-0.4116713, -0.3135363, -2.40452, 1, 0, 0, 1, 1,
-0.404368, 0.7423043, 0.9027221, 1, 0, 0, 1, 1,
-0.3953178, -0.4485451, -2.14357, 1, 0, 0, 1, 1,
-0.3935317, 1.554198, -0.4760401, 0, 0, 0, 1, 1,
-0.3934858, -0.7770692, -4.536104, 0, 0, 0, 1, 1,
-0.38658, -1.899531, -2.906731, 0, 0, 0, 1, 1,
-0.3813913, 0.4782397, -1.091147, 0, 0, 0, 1, 1,
-0.3744734, -0.2212678, -1.360791, 0, 0, 0, 1, 1,
-0.3743168, -0.263018, -2.250518, 0, 0, 0, 1, 1,
-0.366928, 1.103117, -1.516262, 0, 0, 0, 1, 1,
-0.3653768, -0.3253599, -2.040838, 1, 1, 1, 1, 1,
-0.3577429, 0.1121062, -0.7398299, 1, 1, 1, 1, 1,
-0.3576108, -0.9326963, -2.597878, 1, 1, 1, 1, 1,
-0.3573012, 0.2481053, -0.2723719, 1, 1, 1, 1, 1,
-0.3540025, -0.8382446, -2.857824, 1, 1, 1, 1, 1,
-0.3484172, 1.001266, -0.4196251, 1, 1, 1, 1, 1,
-0.342189, 0.5473136, 0.273694, 1, 1, 1, 1, 1,
-0.3357942, 0.3654113, 0.2281515, 1, 1, 1, 1, 1,
-0.3334146, -3.065281, -2.33419, 1, 1, 1, 1, 1,
-0.3234979, 0.9971545, -0.0617126, 1, 1, 1, 1, 1,
-0.3227094, -0.9912357, -1.881673, 1, 1, 1, 1, 1,
-0.320125, 0.9012781, -0.8867291, 1, 1, 1, 1, 1,
-0.3169533, -0.7293515, -2.01377, 1, 1, 1, 1, 1,
-0.3166007, 0.8995384, -0.4391437, 1, 1, 1, 1, 1,
-0.3155749, -0.02727438, -2.648019, 1, 1, 1, 1, 1,
-0.3103015, 1.149493, -0.7922478, 0, 0, 1, 1, 1,
-0.3096387, 0.5161541, -1.132834, 1, 0, 0, 1, 1,
-0.3065334, 1.807127, -1.001567, 1, 0, 0, 1, 1,
-0.3054422, -0.06520979, -2.121199, 1, 0, 0, 1, 1,
-0.3019271, -0.9368945, -3.036038, 1, 0, 0, 1, 1,
-0.299771, -1.980057, -3.079756, 1, 0, 0, 1, 1,
-0.2987722, -0.1174036, -1.921513, 0, 0, 0, 1, 1,
-0.2987649, 0.6251639, -1.203595, 0, 0, 0, 1, 1,
-0.2983417, 0.6241946, -0.3900923, 0, 0, 0, 1, 1,
-0.2970278, 0.7665694, -0.4350986, 0, 0, 0, 1, 1,
-0.2945879, -0.6318254, -1.100389, 0, 0, 0, 1, 1,
-0.2938842, -1.039475, -3.575032, 0, 0, 0, 1, 1,
-0.2919539, 0.2793157, -0.5603737, 0, 0, 0, 1, 1,
-0.2860978, -1.097777, -2.654068, 1, 1, 1, 1, 1,
-0.2804731, 0.6637733, -0.7823612, 1, 1, 1, 1, 1,
-0.2794255, -0.8908445, -5.646587, 1, 1, 1, 1, 1,
-0.2768673, 0.6991622, 0.3437849, 1, 1, 1, 1, 1,
-0.2762372, -1.764387, -0.7174791, 1, 1, 1, 1, 1,
-0.2753443, -0.03714918, -2.842325, 1, 1, 1, 1, 1,
-0.2724802, -1.207054, 0.3038455, 1, 1, 1, 1, 1,
-0.2699385, 0.2591116, -1.604523, 1, 1, 1, 1, 1,
-0.2629769, -1.272363, -2.64876, 1, 1, 1, 1, 1,
-0.2552557, 0.0902879, 0.2068052, 1, 1, 1, 1, 1,
-0.2524899, 0.9387208, 0.149431, 1, 1, 1, 1, 1,
-0.2506708, -0.2138958, -2.552084, 1, 1, 1, 1, 1,
-0.2484962, -0.6754054, -2.278687, 1, 1, 1, 1, 1,
-0.248096, -0.09033426, -0.2800906, 1, 1, 1, 1, 1,
-0.2480172, 0.1324894, -0.2851006, 1, 1, 1, 1, 1,
-0.2476619, 0.1671857, -0.4415016, 0, 0, 1, 1, 1,
-0.2414635, 0.2531015, -2.418392, 1, 0, 0, 1, 1,
-0.2317231, 0.485809, -0.1490176, 1, 0, 0, 1, 1,
-0.2313308, 0.353446, -1.27982, 1, 0, 0, 1, 1,
-0.2294412, 1.282392, -0.6157918, 1, 0, 0, 1, 1,
-0.2214756, -0.6878384, -2.659813, 1, 0, 0, 1, 1,
-0.2199664, -0.4207169, -3.080012, 0, 0, 0, 1, 1,
-0.2195494, -0.2809114, -1.130225, 0, 0, 0, 1, 1,
-0.2150981, -0.3696443, -1.985489, 0, 0, 0, 1, 1,
-0.212751, -0.2820458, -1.162375, 0, 0, 0, 1, 1,
-0.2105511, -1.106216, -2.50954, 0, 0, 0, 1, 1,
-0.2084503, 0.2869652, -1.705714, 0, 0, 0, 1, 1,
-0.2063518, -0.2335792, -1.9605, 0, 0, 0, 1, 1,
-0.2062339, 0.3694993, -0.5535064, 1, 1, 1, 1, 1,
-0.2060311, 0.900179, -0.9411623, 1, 1, 1, 1, 1,
-0.2055627, 1.625345, -0.2900285, 1, 1, 1, 1, 1,
-0.2044739, -0.4895775, -4.211193, 1, 1, 1, 1, 1,
-0.2002804, -0.6127843, -2.204669, 1, 1, 1, 1, 1,
-0.1942669, -0.1790514, -3.585119, 1, 1, 1, 1, 1,
-0.1814726, -0.3203833, -1.021818, 1, 1, 1, 1, 1,
-0.179152, -0.427812, -3.803878, 1, 1, 1, 1, 1,
-0.1741247, 1.912879, -0.9190719, 1, 1, 1, 1, 1,
-0.1737845, 0.5509725, 0.1727262, 1, 1, 1, 1, 1,
-0.1732832, 0.525322, -0.4096541, 1, 1, 1, 1, 1,
-0.1708318, -1.27127, -1.845408, 1, 1, 1, 1, 1,
-0.1700888, -0.5959637, -1.827277, 1, 1, 1, 1, 1,
-0.1635594, 0.3433283, -0.641697, 1, 1, 1, 1, 1,
-0.1600597, 0.47922, -0.8829467, 1, 1, 1, 1, 1,
-0.1563568, 0.2205692, 0.2201978, 0, 0, 1, 1, 1,
-0.1530725, -2.221306, -2.848564, 1, 0, 0, 1, 1,
-0.1513451, 1.814711, -0.5550855, 1, 0, 0, 1, 1,
-0.151151, -0.3495114, -1.052831, 1, 0, 0, 1, 1,
-0.1448412, 2.328159, -0.04864567, 1, 0, 0, 1, 1,
-0.1445731, -1.377981, -4.026398, 1, 0, 0, 1, 1,
-0.1400434, 0.1460057, -0.2761904, 0, 0, 0, 1, 1,
-0.1399287, 2.456702, -0.6092564, 0, 0, 0, 1, 1,
-0.1381581, 0.1216746, -1.291043, 0, 0, 0, 1, 1,
-0.1378739, 0.7097128, -1.159027, 0, 0, 0, 1, 1,
-0.1354126, 1.275841, -0.5787126, 0, 0, 0, 1, 1,
-0.1340963, -0.2671877, -2.530362, 0, 0, 0, 1, 1,
-0.1340779, -0.03417385, -1.061514, 0, 0, 0, 1, 1,
-0.1320881, 2.393497, 0.6304892, 1, 1, 1, 1, 1,
-0.1319748, 1.253725, 1.01502, 1, 1, 1, 1, 1,
-0.1311336, -0.06183739, -3.540669, 1, 1, 1, 1, 1,
-0.1245853, 1.031509, -0.8876415, 1, 1, 1, 1, 1,
-0.1239376, -0.1043543, -2.610431, 1, 1, 1, 1, 1,
-0.1218887, -1.512498, -3.347456, 1, 1, 1, 1, 1,
-0.1212054, 0.7546085, 1.004601, 1, 1, 1, 1, 1,
-0.1203063, -2.676794, -4.61451, 1, 1, 1, 1, 1,
-0.1153618, 0.02778738, -0.4774604, 1, 1, 1, 1, 1,
-0.1136145, 2.320303, 0.8570337, 1, 1, 1, 1, 1,
-0.1123369, 0.5204016, -0.4558054, 1, 1, 1, 1, 1,
-0.1111144, 0.04541266, -1.602988, 1, 1, 1, 1, 1,
-0.1072891, -1.373979, -1.840215, 1, 1, 1, 1, 1,
-0.1019463, -0.3138742, -2.170155, 1, 1, 1, 1, 1,
-0.1000506, -1.808098, -3.179423, 1, 1, 1, 1, 1,
-0.09846752, 0.627664, -1.399252, 0, 0, 1, 1, 1,
-0.09734705, 2.730437, -0.7479869, 1, 0, 0, 1, 1,
-0.09101272, 0.2213308, -0.2981945, 1, 0, 0, 1, 1,
-0.08666527, 1.750196, 1.193006, 1, 0, 0, 1, 1,
-0.08059917, 0.4200597, -0.3035109, 1, 0, 0, 1, 1,
-0.07944189, -0.8051792, -2.336084, 1, 0, 0, 1, 1,
-0.07658108, -1.047463, -3.723071, 0, 0, 0, 1, 1,
-0.07583637, 1.820765, -1.269162, 0, 0, 0, 1, 1,
-0.06920209, -1.232059, -3.22008, 0, 0, 0, 1, 1,
-0.069073, -0.9727122, -2.108167, 0, 0, 0, 1, 1,
-0.06661853, 0.9005802, -0.996197, 0, 0, 0, 1, 1,
-0.06335537, 0.9326221, 0.5639743, 0, 0, 0, 1, 1,
-0.0610013, 0.3197156, -0.8835301, 0, 0, 0, 1, 1,
-0.0585029, -1.195146, -1.233863, 1, 1, 1, 1, 1,
-0.05512797, -1.668261, -2.95768, 1, 1, 1, 1, 1,
-0.05269155, -0.2866751, -5.011431, 1, 1, 1, 1, 1,
-0.05158519, -0.4394487, -4.055091, 1, 1, 1, 1, 1,
-0.05156004, -1.07279, -3.912191, 1, 1, 1, 1, 1,
-0.05025182, 0.2329553, 0.2860209, 1, 1, 1, 1, 1,
-0.04245988, -0.8123787, -2.021155, 1, 1, 1, 1, 1,
-0.03737316, -0.5625825, -3.235341, 1, 1, 1, 1, 1,
-0.03600021, 0.6521182, 1.210782, 1, 1, 1, 1, 1,
-0.03539663, -0.4521325, -2.136528, 1, 1, 1, 1, 1,
-0.03169803, 1.670747, -0.5428544, 1, 1, 1, 1, 1,
-0.02936346, 0.1627227, 0.9977602, 1, 1, 1, 1, 1,
-0.02815721, 0.07878237, -0.1194032, 1, 1, 1, 1, 1,
-0.02771906, 0.8760815, 0.6555054, 1, 1, 1, 1, 1,
-0.02579404, -1.166303, -0.5703924, 1, 1, 1, 1, 1,
-0.02347966, -1.549106, -3.465253, 0, 0, 1, 1, 1,
-0.02180487, -0.05682492, -2.916258, 1, 0, 0, 1, 1,
-0.02116404, -0.005852314, -1.428668, 1, 0, 0, 1, 1,
-0.01863452, 0.4707528, 1.623474, 1, 0, 0, 1, 1,
-0.01817837, 0.4016354, -0.08130051, 1, 0, 0, 1, 1,
-0.01601749, -0.04735097, -4.252075, 1, 0, 0, 1, 1,
-0.01489212, -1.941017, -2.31129, 0, 0, 0, 1, 1,
-0.01377768, -1.030292, -0.3447146, 0, 0, 0, 1, 1,
-0.009968608, 1.122565, -1.341809, 0, 0, 0, 1, 1,
-0.008453232, -0.01356258, -4.578809, 0, 0, 0, 1, 1,
-0.008376728, -0.2903541, -2.731146, 0, 0, 0, 1, 1,
-0.006349288, 1.345242, -0.6733013, 0, 0, 0, 1, 1,
-0.003778414, 0.1215549, 2.680258, 0, 0, 0, 1, 1,
-0.002028636, -0.9255096, -2.086132, 1, 1, 1, 1, 1,
-0.0003355318, 0.6930236, 1.06554, 1, 1, 1, 1, 1,
0.0006506802, -0.03747454, 1.779739, 1, 1, 1, 1, 1,
0.002334715, 0.3396877, -0.6130742, 1, 1, 1, 1, 1,
0.006279085, -0.009302759, 1.651542, 1, 1, 1, 1, 1,
0.00687504, 0.1769718, -1.328304, 1, 1, 1, 1, 1,
0.01062866, 0.1827105, 2.901087, 1, 1, 1, 1, 1,
0.01266871, -0.7174655, 4.257163, 1, 1, 1, 1, 1,
0.01411418, -0.2293163, 2.842647, 1, 1, 1, 1, 1,
0.01599336, -0.8720181, 2.143183, 1, 1, 1, 1, 1,
0.02453921, 0.1293055, 0.5578747, 1, 1, 1, 1, 1,
0.02471203, 0.7969782, 0.6407976, 1, 1, 1, 1, 1,
0.02651306, 0.464756, 0.7120333, 1, 1, 1, 1, 1,
0.02659974, -0.09313137, 1.155596, 1, 1, 1, 1, 1,
0.02827043, -1.050741, 4.230029, 1, 1, 1, 1, 1,
0.02923786, 1.268556, -0.7743464, 0, 0, 1, 1, 1,
0.0304697, -1.574188, 4.78762, 1, 0, 0, 1, 1,
0.03474537, 1.950326, -0.4590651, 1, 0, 0, 1, 1,
0.03789424, -0.05450441, 1.989454, 1, 0, 0, 1, 1,
0.03937065, 0.3982364, 0.2401255, 1, 0, 0, 1, 1,
0.04137404, 0.9915793, 1.579449, 1, 0, 0, 1, 1,
0.04139034, -1.215236, 1.858203, 0, 0, 0, 1, 1,
0.04291598, -1.302114, 2.356401, 0, 0, 0, 1, 1,
0.04345575, -0.4750359, 2.043532, 0, 0, 0, 1, 1,
0.04351525, 1.18931, -1.390172, 0, 0, 0, 1, 1,
0.04409317, 1.349178, -0.7071547, 0, 0, 0, 1, 1,
0.04860904, 0.7447031, 0.3476911, 0, 0, 0, 1, 1,
0.05421577, 2.772371, 1.128845, 0, 0, 0, 1, 1,
0.05747687, -2.802502, 3.861414, 1, 1, 1, 1, 1,
0.05761002, 0.314541, 0.06561038, 1, 1, 1, 1, 1,
0.06207102, 0.1307829, 1.064381, 1, 1, 1, 1, 1,
0.06476353, 0.9572858, -0.3038553, 1, 1, 1, 1, 1,
0.06995855, -0.7128513, 5.164165, 1, 1, 1, 1, 1,
0.07187934, 0.1090786, 0.3847313, 1, 1, 1, 1, 1,
0.08725698, 0.254439, 0.2130105, 1, 1, 1, 1, 1,
0.08780868, 0.2722181, -0.9528023, 1, 1, 1, 1, 1,
0.09227586, -0.1650834, 2.059844, 1, 1, 1, 1, 1,
0.0944928, -0.5898141, 2.407978, 1, 1, 1, 1, 1,
0.09473988, -0.6207736, 2.727275, 1, 1, 1, 1, 1,
0.09607875, 0.5144359, 0.3457476, 1, 1, 1, 1, 1,
0.09635171, 0.412879, 1.052969, 1, 1, 1, 1, 1,
0.09692252, 1.187373, -1.141436, 1, 1, 1, 1, 1,
0.09914982, -0.6580412, 0.7216491, 1, 1, 1, 1, 1,
0.1045072, -0.2090794, 1.768257, 0, 0, 1, 1, 1,
0.1051928, 1.724932, 0.1839706, 1, 0, 0, 1, 1,
0.1059775, -1.291143, 3.940247, 1, 0, 0, 1, 1,
0.1078816, 0.1453243, -0.9462454, 1, 0, 0, 1, 1,
0.1089862, -0.0227775, 2.469879, 1, 0, 0, 1, 1,
0.1158465, -1.185741, 2.715449, 1, 0, 0, 1, 1,
0.1175797, -1.272223, 2.540632, 0, 0, 0, 1, 1,
0.1206329, -0.8711938, 3.166667, 0, 0, 0, 1, 1,
0.1214066, -0.3249388, 1.914818, 0, 0, 0, 1, 1,
0.126748, -0.3910305, 3.127217, 0, 0, 0, 1, 1,
0.1269855, -0.01896522, 1.868104, 0, 0, 0, 1, 1,
0.128692, -0.8081886, 2.704578, 0, 0, 0, 1, 1,
0.1340708, 1.585285, 0.6201365, 0, 0, 0, 1, 1,
0.1372898, 0.7040939, 0.0959227, 1, 1, 1, 1, 1,
0.1401828, -1.193574, 2.13764, 1, 1, 1, 1, 1,
0.1411511, 1.360595, -0.0398323, 1, 1, 1, 1, 1,
0.1416488, -1.04685, 4.624812, 1, 1, 1, 1, 1,
0.144241, 0.5809084, -2.754683, 1, 1, 1, 1, 1,
0.1470395, -0.2105493, 3.446276, 1, 1, 1, 1, 1,
0.1478862, 1.08539, -0.2730893, 1, 1, 1, 1, 1,
0.1553065, 0.3252145, -0.9198248, 1, 1, 1, 1, 1,
0.1567215, -0.3913288, 1.957667, 1, 1, 1, 1, 1,
0.1596503, -0.3581508, 3.756441, 1, 1, 1, 1, 1,
0.1643747, -1.051753, 3.306866, 1, 1, 1, 1, 1,
0.1650339, -0.5939904, 2.986042, 1, 1, 1, 1, 1,
0.1677957, -0.8152503, 3.678877, 1, 1, 1, 1, 1,
0.1689964, -0.4807481, 2.890082, 1, 1, 1, 1, 1,
0.1719072, 1.228444, 1.811876, 1, 1, 1, 1, 1,
0.1722999, 0.1013665, 0.709444, 0, 0, 1, 1, 1,
0.1779839, 0.5297789, 0.3442335, 1, 0, 0, 1, 1,
0.1787618, 0.6429778, -1.07207, 1, 0, 0, 1, 1,
0.1852244, 0.9798252, 0.314821, 1, 0, 0, 1, 1,
0.1890502, 0.9846708, -0.4559914, 1, 0, 0, 1, 1,
0.1894701, 0.6110523, -0.5465676, 1, 0, 0, 1, 1,
0.1910765, -0.9688567, 0.1459722, 0, 0, 0, 1, 1,
0.1946521, 0.04085821, 1.483078, 0, 0, 0, 1, 1,
0.1978968, -0.4443192, 2.656163, 0, 0, 0, 1, 1,
0.2027838, 0.1209745, 0.6243803, 0, 0, 0, 1, 1,
0.2038195, 0.9487571, 1.482265, 0, 0, 0, 1, 1,
0.2054264, -1.643946, 1.863229, 0, 0, 0, 1, 1,
0.2067201, 0.1718281, 2.059711, 0, 0, 0, 1, 1,
0.2070255, 1.77728, -0.3580533, 1, 1, 1, 1, 1,
0.2086357, -1.039849, 1.882092, 1, 1, 1, 1, 1,
0.2114744, 0.6428908, 0.6274474, 1, 1, 1, 1, 1,
0.2126129, 1.724811, -0.5764939, 1, 1, 1, 1, 1,
0.2194338, 1.56923, 0.9905798, 1, 1, 1, 1, 1,
0.2200348, -0.1380042, 2.178301, 1, 1, 1, 1, 1,
0.2204674, -0.7177677, 2.610299, 1, 1, 1, 1, 1,
0.2215171, -1.978685, 1.209356, 1, 1, 1, 1, 1,
0.2226619, 1.512383, 0.09941474, 1, 1, 1, 1, 1,
0.2232799, 1.601967, 0.2086893, 1, 1, 1, 1, 1,
0.2242028, -0.5825574, 2.341221, 1, 1, 1, 1, 1,
0.2282673, 0.2474029, 0.6567339, 1, 1, 1, 1, 1,
0.2293718, 1.025406, 0.03604724, 1, 1, 1, 1, 1,
0.2334315, 0.1110266, 1.72511, 1, 1, 1, 1, 1,
0.2347268, 0.130898, 1.054274, 1, 1, 1, 1, 1,
0.2356991, -0.4783956, 2.640064, 0, 0, 1, 1, 1,
0.2405756, 0.8923717, 0.873085, 1, 0, 0, 1, 1,
0.2414602, -0.6261969, 2.496876, 1, 0, 0, 1, 1,
0.2436832, -0.3960391, 3.981044, 1, 0, 0, 1, 1,
0.2488559, -0.3372625, 2.605026, 1, 0, 0, 1, 1,
0.2514239, 0.9692159, 0.598272, 1, 0, 0, 1, 1,
0.252362, 0.6418816, 0.6886564, 0, 0, 0, 1, 1,
0.2559423, -0.4127687, 4.093296, 0, 0, 0, 1, 1,
0.2625749, 0.8502493, 1.217284, 0, 0, 0, 1, 1,
0.2634616, 1.204972, 1.07222, 0, 0, 0, 1, 1,
0.2654874, 1.69669, -0.7798236, 0, 0, 0, 1, 1,
0.2679405, -0.497646, 3.446989, 0, 0, 0, 1, 1,
0.2700119, 0.3827682, 1.235592, 0, 0, 0, 1, 1,
0.2764738, 0.4791299, 2.99056, 1, 1, 1, 1, 1,
0.2790363, 1.020794, 0.8537552, 1, 1, 1, 1, 1,
0.2795491, -0.7044749, 4.104048, 1, 1, 1, 1, 1,
0.2895588, 2.08734, 0.3170106, 1, 1, 1, 1, 1,
0.2910745, -0.7431357, 2.159138, 1, 1, 1, 1, 1,
0.2915458, 0.28552, 1.104531, 1, 1, 1, 1, 1,
0.2966539, 0.1088144, 0.5559384, 1, 1, 1, 1, 1,
0.2976464, -1.648484, 2.417039, 1, 1, 1, 1, 1,
0.2984554, 0.4730613, -0.1851517, 1, 1, 1, 1, 1,
0.3018221, 0.6773993, -0.8611598, 1, 1, 1, 1, 1,
0.3020707, 1.605165, 0.1384121, 1, 1, 1, 1, 1,
0.3028144, -0.9654076, 3.51334, 1, 1, 1, 1, 1,
0.3028612, -0.1392921, -0.1677175, 1, 1, 1, 1, 1,
0.303503, -0.007332186, 2.08007, 1, 1, 1, 1, 1,
0.3054475, 1.874879, 1.273068, 1, 1, 1, 1, 1,
0.307007, 1.819276, -0.983925, 0, 0, 1, 1, 1,
0.3080422, 1.629288, -0.08746481, 1, 0, 0, 1, 1,
0.3115875, 1.622793, 0.9165919, 1, 0, 0, 1, 1,
0.3166651, -1.125149, 4.840845, 1, 0, 0, 1, 1,
0.319189, 0.4762487, 1.300308, 1, 0, 0, 1, 1,
0.3199231, -1.516474, 2.475093, 1, 0, 0, 1, 1,
0.3203887, -0.7430041, 6.578981, 0, 0, 0, 1, 1,
0.3208177, 0.7104077, -0.1733339, 0, 0, 0, 1, 1,
0.3212869, 0.8481537, -0.7446846, 0, 0, 0, 1, 1,
0.3232287, -1.743078, 3.472178, 0, 0, 0, 1, 1,
0.3257682, -0.4158733, 5.79637, 0, 0, 0, 1, 1,
0.3276382, -0.6998617, 2.622639, 0, 0, 0, 1, 1,
0.335347, -0.8189198, 2.440862, 0, 0, 0, 1, 1,
0.3407824, -1.256078, 1.992296, 1, 1, 1, 1, 1,
0.3409347, 0.8594468, 1.492894, 1, 1, 1, 1, 1,
0.3432307, 1.560116, 0.0286396, 1, 1, 1, 1, 1,
0.3442762, -2.315324, 1.98204, 1, 1, 1, 1, 1,
0.3445713, 0.152669, 1.832766, 1, 1, 1, 1, 1,
0.3467235, -1.369366, 5.128406, 1, 1, 1, 1, 1,
0.3474736, 0.2733796, 1.673239, 1, 1, 1, 1, 1,
0.3487689, -0.6729584, 3.33716, 1, 1, 1, 1, 1,
0.3531196, 0.6323638, 3.166613, 1, 1, 1, 1, 1,
0.3650158, -0.8208351, 5.06851, 1, 1, 1, 1, 1,
0.3663314, 1.107817, -0.5973213, 1, 1, 1, 1, 1,
0.3675552, 0.6397477, -0.3502663, 1, 1, 1, 1, 1,
0.3681524, 0.9624138, 2.296579, 1, 1, 1, 1, 1,
0.3693047, 0.03100274, 1.411609, 1, 1, 1, 1, 1,
0.3800416, -0.7377762, 1.07113, 1, 1, 1, 1, 1,
0.3845021, 0.5263578, 0.6125807, 0, 0, 1, 1, 1,
0.3872124, -2.099181, 3.924853, 1, 0, 0, 1, 1,
0.388112, 0.6663033, 1.11365, 1, 0, 0, 1, 1,
0.3908288, 1.145974, 0.2767106, 1, 0, 0, 1, 1,
0.391564, -1.529779, 5.591703, 1, 0, 0, 1, 1,
0.3938797, 0.4588563, 0.2975808, 1, 0, 0, 1, 1,
0.3944656, 1.014035, 0.5472537, 0, 0, 0, 1, 1,
0.3956388, -0.9806844, 2.155794, 0, 0, 0, 1, 1,
0.3967826, 1.59544, -0.4619524, 0, 0, 0, 1, 1,
0.3971623, 0.1429792, 0.6467662, 0, 0, 0, 1, 1,
0.4027265, 0.3144264, 0.5850171, 0, 0, 0, 1, 1,
0.4074504, -0.3853925, 1.521363, 0, 0, 0, 1, 1,
0.4090424, -1.100708, 2.702447, 0, 0, 0, 1, 1,
0.4146463, 0.8142532, 0.6519119, 1, 1, 1, 1, 1,
0.416083, -0.482529, 1.963475, 1, 1, 1, 1, 1,
0.41609, -1.110623, 4.927372, 1, 1, 1, 1, 1,
0.4163606, 2.493533, -0.6540319, 1, 1, 1, 1, 1,
0.4177599, -0.06311554, 2.300863, 1, 1, 1, 1, 1,
0.4188946, -0.1029251, 0.5684786, 1, 1, 1, 1, 1,
0.4287586, -0.2714199, 2.64793, 1, 1, 1, 1, 1,
0.4292273, -3.339598, 3.186789, 1, 1, 1, 1, 1,
0.4331869, 1.921126, 0.1506645, 1, 1, 1, 1, 1,
0.4350599, -1.40264, 2.720933, 1, 1, 1, 1, 1,
0.4354641, 1.404998, -1.291116, 1, 1, 1, 1, 1,
0.4371461, -0.04005026, 2.651845, 1, 1, 1, 1, 1,
0.4382365, -0.4629873, 2.950579, 1, 1, 1, 1, 1,
0.4405764, 1.196229, 0.2958863, 1, 1, 1, 1, 1,
0.4444547, -1.082811, 2.616658, 1, 1, 1, 1, 1,
0.4480292, -0.8018174, 2.168099, 0, 0, 1, 1, 1,
0.4493657, -0.4221509, 2.588852, 1, 0, 0, 1, 1,
0.4503449, 0.9888757, -0.2538573, 1, 0, 0, 1, 1,
0.4567693, 0.620332, 0.4863207, 1, 0, 0, 1, 1,
0.4573892, -0.9232126, 2.743935, 1, 0, 0, 1, 1,
0.4601929, 0.1183674, 1.448774, 1, 0, 0, 1, 1,
0.465982, -0.3925908, 2.470055, 0, 0, 0, 1, 1,
0.4693303, 1.146374, 0.8273795, 0, 0, 0, 1, 1,
0.4694036, 0.6246132, 1.789675, 0, 0, 0, 1, 1,
0.4716801, 0.3931266, -0.09405937, 0, 0, 0, 1, 1,
0.4731261, 1.096973, 0.7918075, 0, 0, 0, 1, 1,
0.4738627, -0.03837654, 3.79056, 0, 0, 0, 1, 1,
0.4799996, 0.6090908, 0.9044852, 0, 0, 0, 1, 1,
0.4817677, 0.009573538, 0.8643309, 1, 1, 1, 1, 1,
0.4836453, -0.7707359, 3.636001, 1, 1, 1, 1, 1,
0.4859258, 0.0219225, 2.059913, 1, 1, 1, 1, 1,
0.4890463, 0.2223602, 3.354962, 1, 1, 1, 1, 1,
0.4899495, -0.005209235, 1.014681, 1, 1, 1, 1, 1,
0.4931636, 0.5986899, 0.5569794, 1, 1, 1, 1, 1,
0.4932957, 1.000696, -0.9144037, 1, 1, 1, 1, 1,
0.4945118, 0.06333055, 1.794544, 1, 1, 1, 1, 1,
0.5022494, 0.1528061, 2.967359, 1, 1, 1, 1, 1,
0.5026149, -0.5468534, 0.6161347, 1, 1, 1, 1, 1,
0.5088757, -0.6024601, 1.857396, 1, 1, 1, 1, 1,
0.5130557, 2.237211, -0.09420246, 1, 1, 1, 1, 1,
0.5167137, -0.1141526, 1.440384, 1, 1, 1, 1, 1,
0.5235714, -1.356747, 2.185632, 1, 1, 1, 1, 1,
0.5240788, 1.479843, 0.1749086, 1, 1, 1, 1, 1,
0.5264813, 1.930863, -1.108433, 0, 0, 1, 1, 1,
0.5317487, 0.01217913, 1.547774, 1, 0, 0, 1, 1,
0.5379338, 1.486381, 0.3981628, 1, 0, 0, 1, 1,
0.5423023, -0.09109291, 3.394636, 1, 0, 0, 1, 1,
0.5424348, 0.04548948, 0.526811, 1, 0, 0, 1, 1,
0.543165, -0.5637124, 3.222384, 1, 0, 0, 1, 1,
0.5444314, 0.04414115, 0.07380491, 0, 0, 0, 1, 1,
0.5531141, 0.5082294, 0.5914035, 0, 0, 0, 1, 1,
0.5567416, -1.736677, 3.840901, 0, 0, 0, 1, 1,
0.5567749, -1.140506, 3.055157, 0, 0, 0, 1, 1,
0.559391, -0.4793022, 1.131486, 0, 0, 0, 1, 1,
0.5617129, 0.2813663, -0.03546764, 0, 0, 0, 1, 1,
0.5690502, 0.3809341, 0.7969677, 0, 0, 0, 1, 1,
0.5716141, -0.2003732, 1.370522, 1, 1, 1, 1, 1,
0.5721368, 1.020372, 0.8673221, 1, 1, 1, 1, 1,
0.5732011, -1.194838, 1.074492, 1, 1, 1, 1, 1,
0.5783679, 0.1933292, 2.005715, 1, 1, 1, 1, 1,
0.583401, 1.187167, -0.1694216, 1, 1, 1, 1, 1,
0.5852729, 1.724657, -0.4321332, 1, 1, 1, 1, 1,
0.585555, -0.9902475, 2.724691, 1, 1, 1, 1, 1,
0.5867383, -0.7429984, 3.632984, 1, 1, 1, 1, 1,
0.5922287, -1.0857, 2.637951, 1, 1, 1, 1, 1,
0.5957171, -0.2887713, 0.1892163, 1, 1, 1, 1, 1,
0.5970903, -1.648438, 3.873459, 1, 1, 1, 1, 1,
0.6017933, 0.8661948, -0.2615297, 1, 1, 1, 1, 1,
0.6102796, 0.4503907, 0.9828921, 1, 1, 1, 1, 1,
0.6128895, -0.6060541, 0.09363503, 1, 1, 1, 1, 1,
0.6138146, -0.6812646, 1.968782, 1, 1, 1, 1, 1,
0.6150517, 0.5147309, 0.3762195, 0, 0, 1, 1, 1,
0.6181725, 1.907876, 2.095783, 1, 0, 0, 1, 1,
0.6240671, 1.568837, -1.343415, 1, 0, 0, 1, 1,
0.6249135, 1.070244, 1.031777, 1, 0, 0, 1, 1,
0.631036, 0.9742423, 0.8771561, 1, 0, 0, 1, 1,
0.6315043, -0.9768851, 1.932161, 1, 0, 0, 1, 1,
0.6333629, 1.577727, 1.159679, 0, 0, 0, 1, 1,
0.6345976, 2.075665, 0.3247535, 0, 0, 0, 1, 1,
0.6353421, 0.8083341, 1.13845, 0, 0, 0, 1, 1,
0.6375086, 0.7215263, 0.633993, 0, 0, 0, 1, 1,
0.6440729, 0.7629298, 0.4738143, 0, 0, 0, 1, 1,
0.6447657, 1.380432, 0.6152151, 0, 0, 0, 1, 1,
0.6492594, 0.1565254, 3.181284, 0, 0, 0, 1, 1,
0.6499264, 0.4162342, 1.181682, 1, 1, 1, 1, 1,
0.6521062, -0.2201759, 3.237413, 1, 1, 1, 1, 1,
0.6548565, 1.259403, 1.23424, 1, 1, 1, 1, 1,
0.6566777, -1.692866, 2.302819, 1, 1, 1, 1, 1,
0.6567845, -0.6582116, 3.300459, 1, 1, 1, 1, 1,
0.6614405, 0.3448027, 0.574351, 1, 1, 1, 1, 1,
0.6650537, 0.5223547, 2.710488, 1, 1, 1, 1, 1,
0.6679426, -2.469387, 4.596861, 1, 1, 1, 1, 1,
0.6696976, -0.2713403, 2.302206, 1, 1, 1, 1, 1,
0.6736575, 0.03069384, 0.9991345, 1, 1, 1, 1, 1,
0.6750733, -1.181873, 0.184653, 1, 1, 1, 1, 1,
0.6854721, 1.130385, 0.9283649, 1, 1, 1, 1, 1,
0.6889051, 0.4065444, 0.121416, 1, 1, 1, 1, 1,
0.6964527, 1.107683, -1.101069, 1, 1, 1, 1, 1,
0.6986554, -0.8665043, 1.322935, 1, 1, 1, 1, 1,
0.7007949, 1.042496, 1.158888, 0, 0, 1, 1, 1,
0.7008805, -0.7738956, 1.947018, 1, 0, 0, 1, 1,
0.7092319, 2.07029, 0.4430355, 1, 0, 0, 1, 1,
0.7117411, -1.023541, 3.695121, 1, 0, 0, 1, 1,
0.7198439, -1.034892, 1.41859, 1, 0, 0, 1, 1,
0.7226503, -0.6638016, 1.993172, 1, 0, 0, 1, 1,
0.7232853, 0.2673889, 0.7126479, 0, 0, 0, 1, 1,
0.7296462, 1.801662, 0.007690165, 0, 0, 0, 1, 1,
0.7368944, -1.27575, 2.740416, 0, 0, 0, 1, 1,
0.7404097, -1.321251, 3.747349, 0, 0, 0, 1, 1,
0.7418537, -1.150145, 1.033698, 0, 0, 0, 1, 1,
0.7431575, 0.4249877, 1.733034, 0, 0, 0, 1, 1,
0.7481603, -0.04420637, 2.247757, 0, 0, 0, 1, 1,
0.7488767, 0.3336073, -0.620649, 1, 1, 1, 1, 1,
0.7506658, 1.575505, 1.48904, 1, 1, 1, 1, 1,
0.7516507, 0.4742963, 0.841218, 1, 1, 1, 1, 1,
0.7531016, -1.193803, 3.693002, 1, 1, 1, 1, 1,
0.7541921, -0.172438, 3.178859, 1, 1, 1, 1, 1,
0.7564293, 0.6824579, 0.7857907, 1, 1, 1, 1, 1,
0.7576863, -0.2406367, 1.649345, 1, 1, 1, 1, 1,
0.7586155, 0.9003984, 0.422251, 1, 1, 1, 1, 1,
0.7661793, -0.6591479, 2.282851, 1, 1, 1, 1, 1,
0.7671833, 0.1091571, 2.353203, 1, 1, 1, 1, 1,
0.7675833, -0.1347608, 3.90734, 1, 1, 1, 1, 1,
0.7703687, 0.6720192, 1.704582, 1, 1, 1, 1, 1,
0.7718073, -1.828751, 2.545109, 1, 1, 1, 1, 1,
0.7803873, -1.754858, 5.115906, 1, 1, 1, 1, 1,
0.782991, 0.2691096, 1.754855, 1, 1, 1, 1, 1,
0.7846656, 1.192433, -1.440502, 0, 0, 1, 1, 1,
0.7904962, -1.385339, 4.074998, 1, 0, 0, 1, 1,
0.7994169, -0.3999245, 2.581524, 1, 0, 0, 1, 1,
0.7999556, -0.51162, 2.953004, 1, 0, 0, 1, 1,
0.8009673, 0.7233291, 0.7325643, 1, 0, 0, 1, 1,
0.8023233, 0.5406081, 0.6924229, 1, 0, 0, 1, 1,
0.8042458, -0.3510749, 0.9257435, 0, 0, 0, 1, 1,
0.8047324, -0.1650596, 1.41234, 0, 0, 0, 1, 1,
0.8063902, 1.0438, 2.407815, 0, 0, 0, 1, 1,
0.806699, 0.4930176, 1.163915, 0, 0, 0, 1, 1,
0.81157, 2.521485, 0.2360182, 0, 0, 0, 1, 1,
0.8118694, -0.4276603, 1.813969, 0, 0, 0, 1, 1,
0.8127638, -0.4694797, 2.210902, 0, 0, 0, 1, 1,
0.813908, -0.8908971, 3.999142, 1, 1, 1, 1, 1,
0.8203921, 0.7084691, -0.3922562, 1, 1, 1, 1, 1,
0.8288853, -0.9576564, 3.509514, 1, 1, 1, 1, 1,
0.8303047, 0.598155, 1.76396, 1, 1, 1, 1, 1,
0.8384797, 1.003868, 0.0349552, 1, 1, 1, 1, 1,
0.8474934, -0.3313687, 1.919225, 1, 1, 1, 1, 1,
0.8523257, -0.3408975, 2.902362, 1, 1, 1, 1, 1,
0.8736003, -0.7858931, 3.379441, 1, 1, 1, 1, 1,
0.876784, 0.784179, 1.913452, 1, 1, 1, 1, 1,
0.8787344, -0.9565174, 1.298838, 1, 1, 1, 1, 1,
0.8821967, -0.8115257, 2.08671, 1, 1, 1, 1, 1,
0.8857979, 0.6080704, 0.4345508, 1, 1, 1, 1, 1,
0.8897518, -1.256383, 0.732378, 1, 1, 1, 1, 1,
0.8916361, 0.7323868, 1.518114, 1, 1, 1, 1, 1,
0.8924791, 1.282125, -1.209629, 1, 1, 1, 1, 1,
0.899006, -0.4046499, 0.7303249, 0, 0, 1, 1, 1,
0.9032578, -0.6184998, 2.347757, 1, 0, 0, 1, 1,
0.9034907, -0.429113, 1.578871, 1, 0, 0, 1, 1,
0.9053684, -0.2668061, 1.191902, 1, 0, 0, 1, 1,
0.9116812, -0.003963819, 1.493495, 1, 0, 0, 1, 1,
0.9146709, 0.4528543, 0.7821906, 1, 0, 0, 1, 1,
0.9183552, 0.8468175, 1.619717, 0, 0, 0, 1, 1,
0.9215148, 0.7001218, 0.3393265, 0, 0, 0, 1, 1,
0.925163, 0.5877241, -0.8460541, 0, 0, 0, 1, 1,
0.9303009, -0.4215121, 3.360173, 0, 0, 0, 1, 1,
0.9342577, -0.4931487, 1.509755, 0, 0, 0, 1, 1,
0.9425337, 1.487645, 0.2947809, 0, 0, 0, 1, 1,
0.9440229, -0.6338062, 1.113803, 0, 0, 0, 1, 1,
0.9440394, -0.2276418, 1.851958, 1, 1, 1, 1, 1,
0.9482329, -0.02015148, 0.7926909, 1, 1, 1, 1, 1,
0.9536824, 2.44604, 1.254034, 1, 1, 1, 1, 1,
0.9548993, -0.4941231, 1.162693, 1, 1, 1, 1, 1,
0.9568394, -2.217369, 2.260882, 1, 1, 1, 1, 1,
0.9623637, -0.3374758, 3.340652, 1, 1, 1, 1, 1,
0.9705589, -1.503335, 3.402931, 1, 1, 1, 1, 1,
0.9713545, 0.1504744, 2.006058, 1, 1, 1, 1, 1,
0.9750901, -0.8519917, 2.913259, 1, 1, 1, 1, 1,
0.9798558, 0.7415295, 1.199868, 1, 1, 1, 1, 1,
0.9803165, -0.5620606, 1.451884, 1, 1, 1, 1, 1,
0.9880247, -0.1959931, 2.798505, 1, 1, 1, 1, 1,
0.9883222, -1.374641, 2.444635, 1, 1, 1, 1, 1,
0.9999006, -1.245113, 1.584671, 1, 1, 1, 1, 1,
1.003115, 0.3080327, 1.021407, 1, 1, 1, 1, 1,
1.013827, 0.04807024, 1.426258, 0, 0, 1, 1, 1,
1.014822, 0.9936995, 1.534786, 1, 0, 0, 1, 1,
1.016544, -0.07011228, 2.724149, 1, 0, 0, 1, 1,
1.018398, 0.5560432, 0.9244613, 1, 0, 0, 1, 1,
1.022007, -0.6323826, 2.497058, 1, 0, 0, 1, 1,
1.03169, 1.208824, 0.7807305, 1, 0, 0, 1, 1,
1.037894, -1.865669, 2.158319, 0, 0, 0, 1, 1,
1.04501, -0.640302, 2.809956, 0, 0, 0, 1, 1,
1.047195, 1.257021, 0.6709613, 0, 0, 0, 1, 1,
1.050096, 1.287666, 2.552414, 0, 0, 0, 1, 1,
1.052574, 0.7448936, 0.07794364, 0, 0, 0, 1, 1,
1.055379, 0.6305242, 2.037225, 0, 0, 0, 1, 1,
1.07391, 2.155011, 1.758198, 0, 0, 0, 1, 1,
1.074555, 0.3762354, 0.513157, 1, 1, 1, 1, 1,
1.076151, -0.09516308, 3.721349, 1, 1, 1, 1, 1,
1.088955, 0.6705838, 0.5914228, 1, 1, 1, 1, 1,
1.090312, -0.5286855, 1.630486, 1, 1, 1, 1, 1,
1.097317, -0.9630411, 0.5100222, 1, 1, 1, 1, 1,
1.101636, 0.6419097, 2.037782, 1, 1, 1, 1, 1,
1.10688, -0.809392, 2.580469, 1, 1, 1, 1, 1,
1.108037, -0.6574271, 2.41668, 1, 1, 1, 1, 1,
1.108407, 0.1403891, 0.3851227, 1, 1, 1, 1, 1,
1.109029, -0.4153918, 3.44463, 1, 1, 1, 1, 1,
1.109902, -0.6388019, 1.632542, 1, 1, 1, 1, 1,
1.112659, 0.3990275, 2.916969, 1, 1, 1, 1, 1,
1.114848, 0.8595911, 0.3035706, 1, 1, 1, 1, 1,
1.116847, -1.46675, 2.839667, 1, 1, 1, 1, 1,
1.120926, -1.205369, 3.048651, 1, 1, 1, 1, 1,
1.123991, 0.2679641, 1.403682, 0, 0, 1, 1, 1,
1.139572, 0.5192444, 0.3279609, 1, 0, 0, 1, 1,
1.140481, -0.8653722, 3.938215, 1, 0, 0, 1, 1,
1.151782, -0.4450461, 2.92659, 1, 0, 0, 1, 1,
1.15293, 1.167326, 2.164386, 1, 0, 0, 1, 1,
1.153468, 1.247327, 3.119429, 1, 0, 0, 1, 1,
1.1595, -0.8712859, 3.102581, 0, 0, 0, 1, 1,
1.160819, -1.553146, 2.153379, 0, 0, 0, 1, 1,
1.165991, 0.145932, 1.159468, 0, 0, 0, 1, 1,
1.170069, 2.471074, 1.457327, 0, 0, 0, 1, 1,
1.174574, 1.282062, 1.412665, 0, 0, 0, 1, 1,
1.17518, -1.366385, 4.077742, 0, 0, 0, 1, 1,
1.177589, 0.7985404, 0.6962826, 0, 0, 0, 1, 1,
1.17832, 1.514524, -0.4950002, 1, 1, 1, 1, 1,
1.183908, 0.02414444, 2.559372, 1, 1, 1, 1, 1,
1.188502, 0.1281558, 1.153844, 1, 1, 1, 1, 1,
1.210617, -0.5578905, 1.519225, 1, 1, 1, 1, 1,
1.221931, -0.7700613, 1.783656, 1, 1, 1, 1, 1,
1.231466, 0.1973143, 1.780731, 1, 1, 1, 1, 1,
1.235399, -1.842013, 1.530516, 1, 1, 1, 1, 1,
1.243316, -1.020707, 2.62907, 1, 1, 1, 1, 1,
1.250262, -0.6786408, 2.779134, 1, 1, 1, 1, 1,
1.256203, -1.483319, 1.792807, 1, 1, 1, 1, 1,
1.257278, 0.3285066, 1.475136, 1, 1, 1, 1, 1,
1.257657, -0.4047397, 0.458566, 1, 1, 1, 1, 1,
1.286378, -1.128155, 3.386472, 1, 1, 1, 1, 1,
1.287701, -1.897012, 2.82582, 1, 1, 1, 1, 1,
1.29442, -1.214249, 1.854016, 1, 1, 1, 1, 1,
1.303627, 0.2796547, 3.238029, 0, 0, 1, 1, 1,
1.310158, -1.015929, 1.891011, 1, 0, 0, 1, 1,
1.311563, 0.9008573, 0.8891062, 1, 0, 0, 1, 1,
1.311596, 1.743282, 0.8142408, 1, 0, 0, 1, 1,
1.315328, -0.2836774, 2.754935, 1, 0, 0, 1, 1,
1.331715, -0.01421017, 1.724607, 1, 0, 0, 1, 1,
1.340959, 1.308799, -0.2772615, 0, 0, 0, 1, 1,
1.347665, 0.03784383, 1.252975, 0, 0, 0, 1, 1,
1.349651, -0.488907, 2.016809, 0, 0, 0, 1, 1,
1.349758, -0.6722604, 2.880935, 0, 0, 0, 1, 1,
1.360292, 0.1395344, 3.072546, 0, 0, 0, 1, 1,
1.375835, -2.814733, 3.602851, 0, 0, 0, 1, 1,
1.381735, -1.708373, 2.556812, 0, 0, 0, 1, 1,
1.382871, -0.1014234, 0.4379299, 1, 1, 1, 1, 1,
1.417256, -0.915903, 0.8403829, 1, 1, 1, 1, 1,
1.441529, -0.0002888908, 4.713802, 1, 1, 1, 1, 1,
1.449119, -0.4314337, 1.503168, 1, 1, 1, 1, 1,
1.459618, -0.3546903, 0.5467046, 1, 1, 1, 1, 1,
1.461477, -0.8474417, 2.80653, 1, 1, 1, 1, 1,
1.462035, -0.4152699, 2.257301, 1, 1, 1, 1, 1,
1.466588, -1.018619, 1.620673, 1, 1, 1, 1, 1,
1.480045, -0.03235806, 1.747394, 1, 1, 1, 1, 1,
1.482111, 0.01392065, 1.098882, 1, 1, 1, 1, 1,
1.485161, 0.597681, -0.5912595, 1, 1, 1, 1, 1,
1.493322, -0.09491329, 1.351081, 1, 1, 1, 1, 1,
1.496849, -0.1632223, 3.451069, 1, 1, 1, 1, 1,
1.517723, 0.3362371, 2.036933, 1, 1, 1, 1, 1,
1.520408, 1.017619, 1.80772, 1, 1, 1, 1, 1,
1.524818, -0.3681543, -0.2088209, 0, 0, 1, 1, 1,
1.533315, 0.9814791, 3.131169, 1, 0, 0, 1, 1,
1.537829, 1.698954, 0.5114528, 1, 0, 0, 1, 1,
1.539389, 0.631884, 1.121472, 1, 0, 0, 1, 1,
1.544605, -0.5974191, 1.248369, 1, 0, 0, 1, 1,
1.550671, 0.4069699, 2.24459, 1, 0, 0, 1, 1,
1.551315, 0.3310588, 0.6284044, 0, 0, 0, 1, 1,
1.567013, 0.9784842, 0.477171, 0, 0, 0, 1, 1,
1.573475, -1.734157, 3.128378, 0, 0, 0, 1, 1,
1.580113, 1.590337, -0.1158283, 0, 0, 0, 1, 1,
1.583033, 0.5667714, 0.4769925, 0, 0, 0, 1, 1,
1.586589, 0.7270092, 0.0889369, 0, 0, 0, 1, 1,
1.593034, 0.6258947, 1.441069, 0, 0, 0, 1, 1,
1.596262, -1.387818, 2.598793, 1, 1, 1, 1, 1,
1.598606, -0.905884, 1.223923, 1, 1, 1, 1, 1,
1.600278, 0.6780246, 0.5857466, 1, 1, 1, 1, 1,
1.600861, -0.4545969, 0.6961731, 1, 1, 1, 1, 1,
1.609629, 1.26979, -0.4860405, 1, 1, 1, 1, 1,
1.610163, 0.8757111, -1.219981, 1, 1, 1, 1, 1,
1.616994, -0.1779432, 2.989385, 1, 1, 1, 1, 1,
1.627931, 0.9295846, 2.722788, 1, 1, 1, 1, 1,
1.633698, 1.377917, 0.5721384, 1, 1, 1, 1, 1,
1.651246, -0.1615604, 2.162238, 1, 1, 1, 1, 1,
1.673012, 0.6202723, 0.03377944, 1, 1, 1, 1, 1,
1.692833, 0.1734134, 2.954913, 1, 1, 1, 1, 1,
1.713153, -1.885647, 2.14886, 1, 1, 1, 1, 1,
1.719811, 0.1743941, 0.6069402, 1, 1, 1, 1, 1,
1.753351, 0.443763, 2.392389, 1, 1, 1, 1, 1,
1.754102, -1.037702, 0.6250252, 0, 0, 1, 1, 1,
1.762553, 0.2461473, 1.961195, 1, 0, 0, 1, 1,
1.76346, 0.08329046, 0.9380022, 1, 0, 0, 1, 1,
1.767122, 1.455807, 0.9152995, 1, 0, 0, 1, 1,
1.775752, -0.5822114, 3.43764, 1, 0, 0, 1, 1,
1.793046, 0.8964365, 1.838711, 1, 0, 0, 1, 1,
1.81237, -0.1513634, 1.227852, 0, 0, 0, 1, 1,
1.833637, -0.2798052, 4.808069, 0, 0, 0, 1, 1,
1.874431, 0.1699729, 0.1743346, 0, 0, 0, 1, 1,
1.891688, -1.683109, 3.110148, 0, 0, 0, 1, 1,
1.9061, -0.08690072, 2.76761, 0, 0, 0, 1, 1,
1.91934, 0.5629135, 0.8475204, 0, 0, 0, 1, 1,
1.944994, 1.047028, 1.107281, 0, 0, 0, 1, 1,
1.952972, -1.46164, 1.747491, 1, 1, 1, 1, 1,
1.973296, 0.4491832, 1.865922, 1, 1, 1, 1, 1,
1.98149, -1.456558, 1.980582, 1, 1, 1, 1, 1,
1.983214, -0.7607991, 3.342103, 1, 1, 1, 1, 1,
1.988645, -0.1817535, 3.101865, 1, 1, 1, 1, 1,
1.995034, -0.8623304, 3.049551, 1, 1, 1, 1, 1,
2.000796, 0.1785033, 0.7847214, 1, 1, 1, 1, 1,
2.002921, 0.1488912, 3.237252, 1, 1, 1, 1, 1,
2.036589, -0.4150707, 1.510733, 1, 1, 1, 1, 1,
2.045848, -0.1183571, 1.194768, 1, 1, 1, 1, 1,
2.128236, 0.6959624, 2.215364, 1, 1, 1, 1, 1,
2.131392, -0.18341, 1.184399, 1, 1, 1, 1, 1,
2.165832, 0.2443898, 1.937145, 1, 1, 1, 1, 1,
2.169692, 0.09331098, 1.430177, 1, 1, 1, 1, 1,
2.173844, -0.1061094, 1.782944, 1, 1, 1, 1, 1,
2.246644, 0.6941153, 0.5504525, 0, 0, 1, 1, 1,
2.262363, 1.616386, 1.663874, 1, 0, 0, 1, 1,
2.283534, -1.435178, 2.522877, 1, 0, 0, 1, 1,
2.34123, -0.2699008, 2.23556, 1, 0, 0, 1, 1,
2.353697, 0.6058233, 1.420216, 1, 0, 0, 1, 1,
2.357675, 0.06675418, 1.470024, 1, 0, 0, 1, 1,
2.361204, 0.5020945, 0.642787, 0, 0, 0, 1, 1,
2.405699, -0.1968172, 1.431068, 0, 0, 0, 1, 1,
2.458504, 0.154471, 0.07638151, 0, 0, 0, 1, 1,
2.460304, -0.1489057, 2.652144, 0, 0, 0, 1, 1,
2.488428, -0.2150439, 1.427377, 0, 0, 0, 1, 1,
2.502312, 0.6972473, 1.406265, 0, 0, 0, 1, 1,
2.530023, 0.6262982, -0.8079789, 0, 0, 0, 1, 1,
2.616969, 1.366497, 1.448474, 1, 1, 1, 1, 1,
2.624822, -0.4445386, 2.283476, 1, 1, 1, 1, 1,
2.709275, 2.766698, -0.6419283, 1, 1, 1, 1, 1,
2.73215, -0.2464735, 1.633615, 1, 1, 1, 1, 1,
2.732894, -0.2038444, 0.2300509, 1, 1, 1, 1, 1,
2.785329, -0.2392886, 3.338116, 1, 1, 1, 1, 1,
3.472749, -0.3165815, 0.9437272, 1, 1, 1, 1, 1
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
var radius = 10.3148;
var distance = 36.23031;
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
mvMatrix.translate( 0.06425238, 0.2464545, -0.4661968 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.23031);
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
