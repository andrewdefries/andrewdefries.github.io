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
-3.077558, 1.09765, -1.727642, 1, 0, 0, 1,
-3.067556, -0.7022475, -2.520042, 1, 0.007843138, 0, 1,
-3.016902, -0.1347903, -2.232167, 1, 0.01176471, 0, 1,
-2.916927, -0.7772089, -2.574558, 1, 0.01960784, 0, 1,
-2.862586, 0.8470171, -1.884583, 1, 0.02352941, 0, 1,
-2.724725, 0.6129703, -0.5843453, 1, 0.03137255, 0, 1,
-2.695396, 0.4661815, -3.338814, 1, 0.03529412, 0, 1,
-2.639455, -0.5576085, -0.7662153, 1, 0.04313726, 0, 1,
-2.615935, 1.399521, -2.573298, 1, 0.04705882, 0, 1,
-2.611731, -0.6044024, -1.181528, 1, 0.05490196, 0, 1,
-2.498458, -0.5025011, -2.2412, 1, 0.05882353, 0, 1,
-2.476933, 0.5431541, -0.002938741, 1, 0.06666667, 0, 1,
-2.446909, -0.1325479, -0.9266743, 1, 0.07058824, 0, 1,
-2.396821, -0.6734638, -1.768682, 1, 0.07843138, 0, 1,
-2.380486, 0.0185911, 0.2607456, 1, 0.08235294, 0, 1,
-2.333196, -0.6755461, -0.4389996, 1, 0.09019608, 0, 1,
-2.321124, 2.12758, -0.6622103, 1, 0.09411765, 0, 1,
-2.287417, -0.1638936, -0.7208654, 1, 0.1019608, 0, 1,
-2.281336, 1.886022, -0.6718743, 1, 0.1098039, 0, 1,
-2.272382, 0.1149838, -2.8668, 1, 0.1137255, 0, 1,
-2.27158, 0.6894998, -1.24507, 1, 0.1215686, 0, 1,
-2.241374, 1.541319, -1.806165, 1, 0.1254902, 0, 1,
-2.206797, 2.281127, 0.09288154, 1, 0.1333333, 0, 1,
-2.161471, 0.5988637, -1.283595, 1, 0.1372549, 0, 1,
-2.160743, 0.6477981, -0.4151848, 1, 0.145098, 0, 1,
-2.100989, -0.2836768, -1.35466, 1, 0.1490196, 0, 1,
-2.071363, -0.09633204, -1.320251, 1, 0.1568628, 0, 1,
-2.055721, 1.854057, -0.4395532, 1, 0.1607843, 0, 1,
-2.055435, 1.274325, -1.695903, 1, 0.1686275, 0, 1,
-2.047403, -1.030286, -2.90032, 1, 0.172549, 0, 1,
-2.015982, -0.3635857, 0.50378, 1, 0.1803922, 0, 1,
-2.004016, 2.589733, -0.5937016, 1, 0.1843137, 0, 1,
-1.999745, 0.6990842, -1.600164, 1, 0.1921569, 0, 1,
-1.995757, 0.2543965, -1.140905, 1, 0.1960784, 0, 1,
-1.995, -2.046586, -1.797617, 1, 0.2039216, 0, 1,
-1.985754, -1.645522, -1.816844, 1, 0.2117647, 0, 1,
-1.949396, 0.5054616, -1.235286, 1, 0.2156863, 0, 1,
-1.920783, 1.748668, -0.994929, 1, 0.2235294, 0, 1,
-1.860413, 1.356378, 1.83616, 1, 0.227451, 0, 1,
-1.834276, -0.4674198, -2.719585, 1, 0.2352941, 0, 1,
-1.822683, -1.552562, -2.609167, 1, 0.2392157, 0, 1,
-1.822553, 0.3868123, -1.475344, 1, 0.2470588, 0, 1,
-1.81076, -0.03048348, -0.8368835, 1, 0.2509804, 0, 1,
-1.793904, -1.713177, -2.896845, 1, 0.2588235, 0, 1,
-1.786159, -0.2825384, -2.237028, 1, 0.2627451, 0, 1,
-1.744203, -1.122386, -2.09921, 1, 0.2705882, 0, 1,
-1.73736, 0.8535423, -0.074703, 1, 0.2745098, 0, 1,
-1.718734, 0.895821, 0.2490735, 1, 0.282353, 0, 1,
-1.708168, 0.1564499, -2.441327, 1, 0.2862745, 0, 1,
-1.705112, -1.297293, -4.240152, 1, 0.2941177, 0, 1,
-1.704786, -1.925202, -0.4447703, 1, 0.3019608, 0, 1,
-1.669805, -0.01430642, 0.2344174, 1, 0.3058824, 0, 1,
-1.661838, 0.9176913, -0.2311216, 1, 0.3137255, 0, 1,
-1.659663, -0.04068153, -2.123453, 1, 0.3176471, 0, 1,
-1.658375, 0.3384723, -1.517277, 1, 0.3254902, 0, 1,
-1.639815, -1.103075, -0.7206377, 1, 0.3294118, 0, 1,
-1.638122, -1.123973, -2.556142, 1, 0.3372549, 0, 1,
-1.63551, 1.070106, -1.051987, 1, 0.3411765, 0, 1,
-1.63258, -0.854684, -2.209677, 1, 0.3490196, 0, 1,
-1.61404, -2.278857, -2.139359, 1, 0.3529412, 0, 1,
-1.591134, -0.6124272, -2.26914, 1, 0.3607843, 0, 1,
-1.589705, 0.7661224, -1.981722, 1, 0.3647059, 0, 1,
-1.545789, -1.859477, -0.9122441, 1, 0.372549, 0, 1,
-1.544544, -0.9625742, -1.219555, 1, 0.3764706, 0, 1,
-1.542206, 2.007649, -1.288647, 1, 0.3843137, 0, 1,
-1.53676, 0.1537907, -1.4107, 1, 0.3882353, 0, 1,
-1.530076, 0.1771244, -1.61129, 1, 0.3960784, 0, 1,
-1.521678, 0.2397299, -1.651173, 1, 0.4039216, 0, 1,
-1.516261, 0.4885069, -0.3183796, 1, 0.4078431, 0, 1,
-1.499691, -0.1199693, -1.294152, 1, 0.4156863, 0, 1,
-1.474332, 0.9281242, -0.1200631, 1, 0.4196078, 0, 1,
-1.469125, -1.615807, -3.413198, 1, 0.427451, 0, 1,
-1.461788, 0.648488, -1.020572, 1, 0.4313726, 0, 1,
-1.460914, -0.2441, -1.106092, 1, 0.4392157, 0, 1,
-1.455894, 1.191067, -1.679125, 1, 0.4431373, 0, 1,
-1.427429, 1.484224, 0.7729263, 1, 0.4509804, 0, 1,
-1.420397, 0.7825256, -2.161246, 1, 0.454902, 0, 1,
-1.420008, -1.484957, -0.9461263, 1, 0.4627451, 0, 1,
-1.412295, -1.540729, -4.263306, 1, 0.4666667, 0, 1,
-1.412008, 2.208932, 0.02465052, 1, 0.4745098, 0, 1,
-1.411481, 0.5073971, -0.824346, 1, 0.4784314, 0, 1,
-1.406707, 2.007495, -1.797708, 1, 0.4862745, 0, 1,
-1.404205, -1.260849, -2.585226, 1, 0.4901961, 0, 1,
-1.397471, -1.119986, -0.5741094, 1, 0.4980392, 0, 1,
-1.394534, 0.01105828, -0.4251349, 1, 0.5058824, 0, 1,
-1.390014, -0.164721, -3.257196, 1, 0.509804, 0, 1,
-1.381845, 0.1444237, -1.767408, 1, 0.5176471, 0, 1,
-1.380168, 1.211493, -0.06318572, 1, 0.5215687, 0, 1,
-1.378427, -0.6495229, -1.716334, 1, 0.5294118, 0, 1,
-1.372417, -1.705912, -3.707529, 1, 0.5333334, 0, 1,
-1.369299, -1.33958, -2.228987, 1, 0.5411765, 0, 1,
-1.361683, 0.7732453, -0.3859058, 1, 0.5450981, 0, 1,
-1.360393, -1.457798, -2.080337, 1, 0.5529412, 0, 1,
-1.35939, 1.093087, -0.3833361, 1, 0.5568628, 0, 1,
-1.356208, -0.8008763, -1.761695, 1, 0.5647059, 0, 1,
-1.351894, 0.8660853, 0.4797103, 1, 0.5686275, 0, 1,
-1.351629, 0.1446146, -1.085073, 1, 0.5764706, 0, 1,
-1.351474, -1.357579, -1.90376, 1, 0.5803922, 0, 1,
-1.318982, -1.029017, -3.704508, 1, 0.5882353, 0, 1,
-1.318427, 0.07878023, -0.4835207, 1, 0.5921569, 0, 1,
-1.313362, -1.183337, -4.04984, 1, 0.6, 0, 1,
-1.309304, 0.03948736, -2.18745, 1, 0.6078432, 0, 1,
-1.305893, 0.1367617, -3.728625, 1, 0.6117647, 0, 1,
-1.305042, 0.193379, -0.7985037, 1, 0.6196079, 0, 1,
-1.30032, 0.2774045, -1.446681, 1, 0.6235294, 0, 1,
-1.297684, -1.071471, -1.217959, 1, 0.6313726, 0, 1,
-1.283884, 0.5574582, -1.717042, 1, 0.6352941, 0, 1,
-1.279684, 0.212973, -1.697284, 1, 0.6431373, 0, 1,
-1.275286, 0.8031209, -1.596752, 1, 0.6470588, 0, 1,
-1.269075, -0.8062416, -1.802657, 1, 0.654902, 0, 1,
-1.260691, -1.531717, -2.208728, 1, 0.6588235, 0, 1,
-1.254521, 0.8790002, -2.502667, 1, 0.6666667, 0, 1,
-1.252745, -0.1381249, -1.501269, 1, 0.6705883, 0, 1,
-1.247083, -0.6506422, -0.5990783, 1, 0.6784314, 0, 1,
-1.242585, 0.3725327, -2.451669, 1, 0.682353, 0, 1,
-1.219155, -0.4809693, 0.4682944, 1, 0.6901961, 0, 1,
-1.217431, 0.4530978, -2.267272, 1, 0.6941177, 0, 1,
-1.210794, 1.563675, 1.44795, 1, 0.7019608, 0, 1,
-1.206653, 0.1003781, -0.531288, 1, 0.7098039, 0, 1,
-1.202553, 0.2365099, -3.027685, 1, 0.7137255, 0, 1,
-1.198061, 0.5844903, -0.3850028, 1, 0.7215686, 0, 1,
-1.197657, 0.1770374, -1.018806, 1, 0.7254902, 0, 1,
-1.192806, 0.2692986, -0.8571525, 1, 0.7333333, 0, 1,
-1.18536, -0.3239107, -3.013007, 1, 0.7372549, 0, 1,
-1.183014, -1.156407, -2.759969, 1, 0.7450981, 0, 1,
-1.174542, -1.533686, -1.236502, 1, 0.7490196, 0, 1,
-1.173481, -0.3925816, -1.804321, 1, 0.7568628, 0, 1,
-1.172021, 0.6271181, 0.6780131, 1, 0.7607843, 0, 1,
-1.169355, -0.1461279, -1.936281, 1, 0.7686275, 0, 1,
-1.168969, -0.8764124, -1.929042, 1, 0.772549, 0, 1,
-1.164241, 0.3660545, -1.928972, 1, 0.7803922, 0, 1,
-1.160254, 0.6236841, -0.659377, 1, 0.7843137, 0, 1,
-1.154544, -1.141306, -2.135672, 1, 0.7921569, 0, 1,
-1.153528, 1.504458, -0.7577441, 1, 0.7960784, 0, 1,
-1.149258, -0.390012, -0.476126, 1, 0.8039216, 0, 1,
-1.147153, 1.217105, -0.7351412, 1, 0.8117647, 0, 1,
-1.144542, -0.3797278, -1.770262, 1, 0.8156863, 0, 1,
-1.138985, -1.074951, -1.779233, 1, 0.8235294, 0, 1,
-1.123518, -1.97218, -2.580144, 1, 0.827451, 0, 1,
-1.120012, -2.685493, -4.475111, 1, 0.8352941, 0, 1,
-1.112257, -0.8968929, -2.395811, 1, 0.8392157, 0, 1,
-1.111689, -2.349076, -3.283659, 1, 0.8470588, 0, 1,
-1.107586, 0.6396676, -0.3018679, 1, 0.8509804, 0, 1,
-1.092219, -1.465349, -1.926589, 1, 0.8588235, 0, 1,
-1.078148, 1.302501, 0.6898927, 1, 0.8627451, 0, 1,
-1.078033, -0.2430451, -2.616681, 1, 0.8705882, 0, 1,
-1.074918, 0.1454252, 0.2198259, 1, 0.8745098, 0, 1,
-1.069522, -0.5690166, -0.05859167, 1, 0.8823529, 0, 1,
-1.065581, 0.1435251, 0.3768186, 1, 0.8862745, 0, 1,
-1.065037, 0.002621698, -1.425388, 1, 0.8941177, 0, 1,
-1.062781, 1.43878, -2.259094, 1, 0.8980392, 0, 1,
-1.061469, -0.3344795, -2.912039, 1, 0.9058824, 0, 1,
-1.052212, 0.1498224, -1.654185, 1, 0.9137255, 0, 1,
-1.050835, -0.3062541, -1.028507, 1, 0.9176471, 0, 1,
-1.049796, -0.3215363, -2.66822, 1, 0.9254902, 0, 1,
-1.048504, -1.410812, -4.093518, 1, 0.9294118, 0, 1,
-1.042839, 0.7640996, -1.037724, 1, 0.9372549, 0, 1,
-1.04047, -0.3223416, -2.173517, 1, 0.9411765, 0, 1,
-1.034037, -0.142699, -1.535669, 1, 0.9490196, 0, 1,
-1.027056, -0.3368354, -1.701688, 1, 0.9529412, 0, 1,
-1.023276, -1.503255, -2.03608, 1, 0.9607843, 0, 1,
-1.021704, 0.3637388, 1.027119, 1, 0.9647059, 0, 1,
-1.020598, 0.01700147, -0.8672098, 1, 0.972549, 0, 1,
-1.01934, 1.260083, -1.332304, 1, 0.9764706, 0, 1,
-1.015865, -0.1766622, -0.7514412, 1, 0.9843137, 0, 1,
-1.013873, 0.7360128, -1.349965, 1, 0.9882353, 0, 1,
-1.013759, -0.4309946, -3.777848, 1, 0.9960784, 0, 1,
-1.010976, -0.07820131, -2.911298, 0.9960784, 1, 0, 1,
-1.004786, 0.02306595, -1.793304, 0.9921569, 1, 0, 1,
-1.002701, -0.6908194, -0.7077914, 0.9843137, 1, 0, 1,
-1.000705, -1.167587, -2.782729, 0.9803922, 1, 0, 1,
-0.9971751, 2.012207, 0.3455887, 0.972549, 1, 0, 1,
-0.9952323, 0.8223255, -0.7697762, 0.9686275, 1, 0, 1,
-0.9926472, -1.317093, -2.295123, 0.9607843, 1, 0, 1,
-0.9924326, -0.6075988, -1.424147, 0.9568627, 1, 0, 1,
-0.9908754, 0.6015671, -1.941001, 0.9490196, 1, 0, 1,
-0.9860425, 1.392425, 0.08797502, 0.945098, 1, 0, 1,
-0.9794682, -0.009370566, -0.3809854, 0.9372549, 1, 0, 1,
-0.9751355, -1.451568, -3.08096, 0.9333333, 1, 0, 1,
-0.9683391, 0.3413365, -0.5563723, 0.9254902, 1, 0, 1,
-0.9678476, -0.4996901, -2.329417, 0.9215686, 1, 0, 1,
-0.9677083, -1.427956, -1.560486, 0.9137255, 1, 0, 1,
-0.9655997, 0.3629131, -0.9143031, 0.9098039, 1, 0, 1,
-0.9570251, 0.8950342, -0.5397278, 0.9019608, 1, 0, 1,
-0.9509109, -2.147251, -3.859731, 0.8941177, 1, 0, 1,
-0.9506573, -0.1704877, -0.9714578, 0.8901961, 1, 0, 1,
-0.9472687, 0.305155, 0.09430041, 0.8823529, 1, 0, 1,
-0.9322832, 0.790769, 0.3284011, 0.8784314, 1, 0, 1,
-0.931909, 0.1746666, -0.6891138, 0.8705882, 1, 0, 1,
-0.9283183, 1.137387, 0.0543059, 0.8666667, 1, 0, 1,
-0.9276563, -0.05376592, -1.665313, 0.8588235, 1, 0, 1,
-0.9081014, -0.2273224, -1.467722, 0.854902, 1, 0, 1,
-0.9055853, 0.1298555, -0.3057827, 0.8470588, 1, 0, 1,
-0.900024, 0.2459886, -1.172052, 0.8431373, 1, 0, 1,
-0.8996925, -1.365361, -1.102961, 0.8352941, 1, 0, 1,
-0.8965198, 0.01802588, -1.172014, 0.8313726, 1, 0, 1,
-0.8932115, -0.8394806, -4.539824, 0.8235294, 1, 0, 1,
-0.8899494, 2.004212, 1.208902, 0.8196079, 1, 0, 1,
-0.8847016, -0.2452333, -0.6902895, 0.8117647, 1, 0, 1,
-0.8832233, -0.4084462, -3.791406, 0.8078431, 1, 0, 1,
-0.878105, 0.1488864, -0.218629, 0.8, 1, 0, 1,
-0.8774909, 0.6574466, -0.8472602, 0.7921569, 1, 0, 1,
-0.874514, -0.4049062, -2.765786, 0.7882353, 1, 0, 1,
-0.8724788, 1.022146, 0.7623188, 0.7803922, 1, 0, 1,
-0.8646965, 0.9353036, -0.9626943, 0.7764706, 1, 0, 1,
-0.8623621, -1.016483, -2.866445, 0.7686275, 1, 0, 1,
-0.8574147, 0.4033658, -0.9355589, 0.7647059, 1, 0, 1,
-0.8530419, -0.3791376, -2.00435, 0.7568628, 1, 0, 1,
-0.8513469, 0.08276416, -1.65409, 0.7529412, 1, 0, 1,
-0.8378853, 1.779352, -0.4266963, 0.7450981, 1, 0, 1,
-0.8370373, 1.638548, 0.3542581, 0.7411765, 1, 0, 1,
-0.8359267, -0.3901075, -1.319895, 0.7333333, 1, 0, 1,
-0.8308984, 0.1530803, -1.94927, 0.7294118, 1, 0, 1,
-0.8302569, -1.582814, -5.283748, 0.7215686, 1, 0, 1,
-0.8227726, 0.4862456, -0.8585823, 0.7176471, 1, 0, 1,
-0.8225277, 1.761865, -3.080053, 0.7098039, 1, 0, 1,
-0.8134829, 2.838238, 0.9972268, 0.7058824, 1, 0, 1,
-0.8115213, -0.05070025, 0.4529554, 0.6980392, 1, 0, 1,
-0.8094448, 1.125557, -1.820155, 0.6901961, 1, 0, 1,
-0.805061, -0.1549834, -0.5978274, 0.6862745, 1, 0, 1,
-0.8000357, 0.525723, -0.192042, 0.6784314, 1, 0, 1,
-0.7975527, 0.05406899, -1.36116, 0.6745098, 1, 0, 1,
-0.7907541, -1.318807, -1.673043, 0.6666667, 1, 0, 1,
-0.7888875, -1.987144, -4.63284, 0.6627451, 1, 0, 1,
-0.7837301, -0.2712599, -1.10939, 0.654902, 1, 0, 1,
-0.7821234, -0.3386478, -2.445696, 0.6509804, 1, 0, 1,
-0.7752966, 0.5543579, -0.7068293, 0.6431373, 1, 0, 1,
-0.7697999, 0.7259357, -1.631747, 0.6392157, 1, 0, 1,
-0.769764, 1.252113, -0.7046505, 0.6313726, 1, 0, 1,
-0.766748, 0.3612251, -0.1629334, 0.627451, 1, 0, 1,
-0.7657782, -0.3432057, -2.060757, 0.6196079, 1, 0, 1,
-0.7653954, 0.2253409, 0.4499981, 0.6156863, 1, 0, 1,
-0.7650673, -0.6773742, -2.53212, 0.6078432, 1, 0, 1,
-0.7483889, 0.1109033, -1.74919, 0.6039216, 1, 0, 1,
-0.7388975, 1.723465, -0.6966511, 0.5960785, 1, 0, 1,
-0.7362255, -1.071835, -0.2823839, 0.5882353, 1, 0, 1,
-0.7324887, 0.1043473, -2.198697, 0.5843138, 1, 0, 1,
-0.7260641, 0.5144149, -0.9940348, 0.5764706, 1, 0, 1,
-0.7240152, 0.1945242, -1.053881, 0.572549, 1, 0, 1,
-0.7238919, -0.08633071, -2.773743, 0.5647059, 1, 0, 1,
-0.7164354, -0.5399582, -1.940674, 0.5607843, 1, 0, 1,
-0.7111534, 0.1178346, -1.812896, 0.5529412, 1, 0, 1,
-0.707698, -1.251701, -3.54067, 0.5490196, 1, 0, 1,
-0.7070812, -1.158664, -2.875082, 0.5411765, 1, 0, 1,
-0.706595, -0.6429112, -2.287297, 0.5372549, 1, 0, 1,
-0.7064622, -0.9515775, -2.690692, 0.5294118, 1, 0, 1,
-0.7035351, 0.2360051, -2.340752, 0.5254902, 1, 0, 1,
-0.699939, 0.8538998, -0.7263057, 0.5176471, 1, 0, 1,
-0.6988586, 1.285048, -1.277196, 0.5137255, 1, 0, 1,
-0.6972113, 0.2212507, -4.354233, 0.5058824, 1, 0, 1,
-0.6960035, 1.388674, -0.2020301, 0.5019608, 1, 0, 1,
-0.6949544, -0.5106802, -1.238058, 0.4941176, 1, 0, 1,
-0.6925619, 1.415565, -2.394185, 0.4862745, 1, 0, 1,
-0.691449, -1.242354, -2.037795, 0.4823529, 1, 0, 1,
-0.6875893, 0.01076949, -0.4451793, 0.4745098, 1, 0, 1,
-0.6829418, 1.627121, 0.9322197, 0.4705882, 1, 0, 1,
-0.6826692, 1.269317, -1.779054, 0.4627451, 1, 0, 1,
-0.6803839, 0.7118407, -0.1491124, 0.4588235, 1, 0, 1,
-0.6762421, 1.321145, -0.3256106, 0.4509804, 1, 0, 1,
-0.6709211, 1.215641, -2.926953, 0.4470588, 1, 0, 1,
-0.6693051, -1.174421, -3.008846, 0.4392157, 1, 0, 1,
-0.6687483, -0.8675042, -1.8275, 0.4352941, 1, 0, 1,
-0.6681716, -1.628838, -4.409309, 0.427451, 1, 0, 1,
-0.6655089, 0.9415771, -2.258248, 0.4235294, 1, 0, 1,
-0.6624944, -1.030741, -2.252591, 0.4156863, 1, 0, 1,
-0.6578597, 0.08847101, -0.3822472, 0.4117647, 1, 0, 1,
-0.6544665, -0.6634934, -3.899912, 0.4039216, 1, 0, 1,
-0.6530858, 0.1060899, -0.1013372, 0.3960784, 1, 0, 1,
-0.6529613, 0.8632622, -2.238814, 0.3921569, 1, 0, 1,
-0.6500806, 0.4544539, -1.542158, 0.3843137, 1, 0, 1,
-0.6414015, -1.562788, -1.960467, 0.3803922, 1, 0, 1,
-0.6374253, 0.7337775, 0.6124542, 0.372549, 1, 0, 1,
-0.6319925, -1.969623, -5.059176, 0.3686275, 1, 0, 1,
-0.6281208, 1.588103, 1.444716, 0.3607843, 1, 0, 1,
-0.625276, -0.4189357, -0.7355407, 0.3568628, 1, 0, 1,
-0.6244164, 0.6336973, -1.805366, 0.3490196, 1, 0, 1,
-0.6236787, 0.6488133, -2.050865, 0.345098, 1, 0, 1,
-0.6200043, -0.009445546, -0.7506992, 0.3372549, 1, 0, 1,
-0.6132721, -1.546025, -3.447798, 0.3333333, 1, 0, 1,
-0.6111888, 0.779681, -1.911357, 0.3254902, 1, 0, 1,
-0.6100967, 0.1900269, -1.113017, 0.3215686, 1, 0, 1,
-0.6076892, 0.0463317, -3.127295, 0.3137255, 1, 0, 1,
-0.60399, -0.4346981, -2.62948, 0.3098039, 1, 0, 1,
-0.5993065, -0.2449887, -1.978933, 0.3019608, 1, 0, 1,
-0.5959245, -0.6268072, -1.439612, 0.2941177, 1, 0, 1,
-0.5894762, 0.7349391, -0.9346116, 0.2901961, 1, 0, 1,
-0.5887758, 0.6754017, -0.07377365, 0.282353, 1, 0, 1,
-0.5884252, -0.07952322, -0.2984392, 0.2784314, 1, 0, 1,
-0.5784891, 0.393852, -0.8917593, 0.2705882, 1, 0, 1,
-0.578178, 0.5685508, -0.5631731, 0.2666667, 1, 0, 1,
-0.5771729, 0.09812833, -1.020006, 0.2588235, 1, 0, 1,
-0.5743208, 0.03329645, -0.6710705, 0.254902, 1, 0, 1,
-0.571457, 0.06795006, 0.2339946, 0.2470588, 1, 0, 1,
-0.5614284, -1.260174, -0.7008342, 0.2431373, 1, 0, 1,
-0.5606652, 0.8132262, -0.5813403, 0.2352941, 1, 0, 1,
-0.5569727, -1.134273, -2.568883, 0.2313726, 1, 0, 1,
-0.5535702, 0.1711842, -1.949056, 0.2235294, 1, 0, 1,
-0.5497314, 0.9867218, -0.7022142, 0.2196078, 1, 0, 1,
-0.5494996, -0.09908713, -1.14238, 0.2117647, 1, 0, 1,
-0.5400349, 0.4551261, -0.7736613, 0.2078431, 1, 0, 1,
-0.5351921, -1.017439, -2.951845, 0.2, 1, 0, 1,
-0.5301885, 0.09005243, -1.095472, 0.1921569, 1, 0, 1,
-0.5301487, 0.9306126, 0.5451761, 0.1882353, 1, 0, 1,
-0.5297031, 0.7524763, -0.2087636, 0.1803922, 1, 0, 1,
-0.527262, 0.1582679, -0.4595642, 0.1764706, 1, 0, 1,
-0.5262838, -0.644064, -2.404846, 0.1686275, 1, 0, 1,
-0.5249681, 0.9751297, -1.043555, 0.1647059, 1, 0, 1,
-0.5246991, 0.007783549, -2.838351, 0.1568628, 1, 0, 1,
-0.5245282, 0.1868525, 0.5424457, 0.1529412, 1, 0, 1,
-0.5227119, 0.3955307, -2.716695, 0.145098, 1, 0, 1,
-0.5225618, -0.07143253, -2.143631, 0.1411765, 1, 0, 1,
-0.51976, 0.9652306, -0.6377812, 0.1333333, 1, 0, 1,
-0.5154285, -0.7746031, -2.692899, 0.1294118, 1, 0, 1,
-0.5153543, 0.9687638, 0.4960077, 0.1215686, 1, 0, 1,
-0.5150741, 0.1791785, -2.530485, 0.1176471, 1, 0, 1,
-0.5104558, -0.6789724, -4.465977, 0.1098039, 1, 0, 1,
-0.5101629, -0.827801, -0.9284449, 0.1058824, 1, 0, 1,
-0.5096307, 0.5106179, -0.2803278, 0.09803922, 1, 0, 1,
-0.5094299, 1.11117, 0.5017985, 0.09019608, 1, 0, 1,
-0.5080423, 1.841357, -0.527491, 0.08627451, 1, 0, 1,
-0.5045424, 0.1868343, -1.846125, 0.07843138, 1, 0, 1,
-0.4969917, -0.4831605, -1.532076, 0.07450981, 1, 0, 1,
-0.4943744, -0.9973189, -2.875388, 0.06666667, 1, 0, 1,
-0.4935091, 1.094809, 1.179783, 0.0627451, 1, 0, 1,
-0.4930235, 0.7917669, -0.3134958, 0.05490196, 1, 0, 1,
-0.490719, -0.6861502, -2.289099, 0.05098039, 1, 0, 1,
-0.4902605, -1.358663, -0.1292329, 0.04313726, 1, 0, 1,
-0.4892109, -0.05646512, -1.711896, 0.03921569, 1, 0, 1,
-0.4802626, 1.984926, 0.8240116, 0.03137255, 1, 0, 1,
-0.4790724, -0.8408943, -4.533924, 0.02745098, 1, 0, 1,
-0.4696094, 0.4350826, 0.5349377, 0.01960784, 1, 0, 1,
-0.46554, -0.5471781, -2.16487, 0.01568628, 1, 0, 1,
-0.4629742, 1.301579, -1.128563, 0.007843138, 1, 0, 1,
-0.4616999, -0.3920506, -0.6185234, 0.003921569, 1, 0, 1,
-0.4608637, 0.202894, -1.895082, 0, 1, 0.003921569, 1,
-0.4586754, 0.565528, -0.5931205, 0, 1, 0.01176471, 1,
-0.4580765, -1.279492, -0.4185568, 0, 1, 0.01568628, 1,
-0.4570621, 0.8401136, -0.5216147, 0, 1, 0.02352941, 1,
-0.457033, 0.8493409, -2.179046, 0, 1, 0.02745098, 1,
-0.4512461, 0.4003372, -0.2027164, 0, 1, 0.03529412, 1,
-0.4497367, 0.5122821, -0.2948429, 0, 1, 0.03921569, 1,
-0.4454684, 0.3750796, 0.3660267, 0, 1, 0.04705882, 1,
-0.4450229, -0.8027025, -3.54425, 0, 1, 0.05098039, 1,
-0.4437063, -0.8559393, -1.455829, 0, 1, 0.05882353, 1,
-0.4383457, -0.1997517, -1.4396, 0, 1, 0.0627451, 1,
-0.4209346, -0.3292585, -1.465067, 0, 1, 0.07058824, 1,
-0.4195297, 0.5736562, -0.9474008, 0, 1, 0.07450981, 1,
-0.4182543, -2.49904, -2.665273, 0, 1, 0.08235294, 1,
-0.4178818, 0.3803254, -2.83883, 0, 1, 0.08627451, 1,
-0.4157508, 0.1210084, 0.1149952, 0, 1, 0.09411765, 1,
-0.4116159, 1.949205, 0.4725403, 0, 1, 0.1019608, 1,
-0.4102085, -0.8533291, -2.994007, 0, 1, 0.1058824, 1,
-0.4090502, -0.1344823, -1.890425, 0, 1, 0.1137255, 1,
-0.4074267, -0.4181694, -2.279649, 0, 1, 0.1176471, 1,
-0.406844, -0.3861177, -2.829108, 0, 1, 0.1254902, 1,
-0.4061639, -0.8848191, -1.226943, 0, 1, 0.1294118, 1,
-0.4059317, -0.5892855, -3.237289, 0, 1, 0.1372549, 1,
-0.4056684, 1.115309, -0.6763303, 0, 1, 0.1411765, 1,
-0.4034404, 0.4657485, 1.902683, 0, 1, 0.1490196, 1,
-0.4030322, 0.5943142, 0.4387686, 0, 1, 0.1529412, 1,
-0.4029721, -1.251336, -4.204705, 0, 1, 0.1607843, 1,
-0.4012795, -1.382862, -3.055127, 0, 1, 0.1647059, 1,
-0.4008677, 0.3637563, -1.652468, 0, 1, 0.172549, 1,
-0.3951196, -0.08165645, -2.402407, 0, 1, 0.1764706, 1,
-0.3943796, -0.5416242, -3.496173, 0, 1, 0.1843137, 1,
-0.3849173, -0.3539899, -4.280459, 0, 1, 0.1882353, 1,
-0.3825709, 0.5125084, -2.506156, 0, 1, 0.1960784, 1,
-0.3795278, 0.2926712, -0.0003745427, 0, 1, 0.2039216, 1,
-0.378654, 2.219785, -1.096701, 0, 1, 0.2078431, 1,
-0.3779817, 0.7928644, -1.940941, 0, 1, 0.2156863, 1,
-0.374234, -1.515135, -2.841884, 0, 1, 0.2196078, 1,
-0.3711517, -1.766135, -3.67309, 0, 1, 0.227451, 1,
-0.3708882, 0.5924144, -0.6561207, 0, 1, 0.2313726, 1,
-0.3708068, 0.3572265, -0.6034877, 0, 1, 0.2392157, 1,
-0.3696443, 1.058161, -0.7162939, 0, 1, 0.2431373, 1,
-0.3685777, 1.75342, -0.8242682, 0, 1, 0.2509804, 1,
-0.3683232, 1.432515, -0.01217704, 0, 1, 0.254902, 1,
-0.366116, -0.9971454, -1.465091, 0, 1, 0.2627451, 1,
-0.3653803, -1.556846, -3.185016, 0, 1, 0.2666667, 1,
-0.3643695, -1.267184, -2.638613, 0, 1, 0.2745098, 1,
-0.3638643, 0.3758123, -0.271932, 0, 1, 0.2784314, 1,
-0.3632513, -1.775903, -2.045028, 0, 1, 0.2862745, 1,
-0.3601411, -0.4017139, -2.801523, 0, 1, 0.2901961, 1,
-0.3595659, 0.073738, 0.8516166, 0, 1, 0.2980392, 1,
-0.3545831, -0.9151666, -4.275918, 0, 1, 0.3058824, 1,
-0.3544126, 0.3773609, -2.342581, 0, 1, 0.3098039, 1,
-0.3540848, 0.1824606, -0.3353508, 0, 1, 0.3176471, 1,
-0.3521199, 1.915784, -0.4891303, 0, 1, 0.3215686, 1,
-0.3466864, -0.5191334, -2.508072, 0, 1, 0.3294118, 1,
-0.345152, 0.3920319, -3.234372, 0, 1, 0.3333333, 1,
-0.3435332, 0.4711356, -0.01511534, 0, 1, 0.3411765, 1,
-0.3419267, 0.0743477, -1.288605, 0, 1, 0.345098, 1,
-0.3403325, -0.9496677, -2.156803, 0, 1, 0.3529412, 1,
-0.3332575, 0.1392583, -1.824172, 0, 1, 0.3568628, 1,
-0.3320674, 0.2638457, -0.5889517, 0, 1, 0.3647059, 1,
-0.33019, 0.6705613, 0.06405293, 0, 1, 0.3686275, 1,
-0.327881, 0.441319, 1.274249, 0, 1, 0.3764706, 1,
-0.3252268, 1.36228, -0.9935777, 0, 1, 0.3803922, 1,
-0.3231899, 1.513121, -0.5259972, 0, 1, 0.3882353, 1,
-0.3225521, -0.6911876, -3.275595, 0, 1, 0.3921569, 1,
-0.320889, -0.3808126, -2.539828, 0, 1, 0.4, 1,
-0.3201744, 1.150675, 0.2214001, 0, 1, 0.4078431, 1,
-0.3189283, -0.8475786, -5.014158, 0, 1, 0.4117647, 1,
-0.3174242, -1.624855, -2.386992, 0, 1, 0.4196078, 1,
-0.3121494, 0.7256755, -0.6382716, 0, 1, 0.4235294, 1,
-0.3032148, 0.2637964, 0.3397077, 0, 1, 0.4313726, 1,
-0.296023, 1.076489, 0.2213202, 0, 1, 0.4352941, 1,
-0.2909965, -0.9811876, -3.472943, 0, 1, 0.4431373, 1,
-0.290783, -1.275961, -1.062831, 0, 1, 0.4470588, 1,
-0.2907656, 2.47602, -1.039035, 0, 1, 0.454902, 1,
-0.2867502, 0.3552204, -0.2071669, 0, 1, 0.4588235, 1,
-0.2862697, 1.441886, 1.708643, 0, 1, 0.4666667, 1,
-0.280321, 0.5422317, 1.340827, 0, 1, 0.4705882, 1,
-0.2792059, 2.394497, -0.7788678, 0, 1, 0.4784314, 1,
-0.2784846, 0.6681929, 0.0003045401, 0, 1, 0.4823529, 1,
-0.2777301, 1.014896, 0.3874938, 0, 1, 0.4901961, 1,
-0.2704691, 0.7034228, -0.4674999, 0, 1, 0.4941176, 1,
-0.2676864, -2.041768, -2.491823, 0, 1, 0.5019608, 1,
-0.2674376, 0.4590753, -1.723125, 0, 1, 0.509804, 1,
-0.2612984, 0.2483081, -0.3835241, 0, 1, 0.5137255, 1,
-0.2604848, -0.6098444, -3.272475, 0, 1, 0.5215687, 1,
-0.2567134, -0.1711931, -3.162295, 0, 1, 0.5254902, 1,
-0.25268, -0.1595805, -2.573247, 0, 1, 0.5333334, 1,
-0.2457293, -1.655881, -2.856495, 0, 1, 0.5372549, 1,
-0.2425056, 0.7095304, 0.637114, 0, 1, 0.5450981, 1,
-0.2328126, 0.1242526, -1.004519, 0, 1, 0.5490196, 1,
-0.2326027, -0.697539, -3.463325, 0, 1, 0.5568628, 1,
-0.2325279, 2.002304, -1.019774, 0, 1, 0.5607843, 1,
-0.2309509, -0.03952216, -1.861589, 0, 1, 0.5686275, 1,
-0.22589, -0.897747, -3.568882, 0, 1, 0.572549, 1,
-0.2228706, -0.354655, -2.407112, 0, 1, 0.5803922, 1,
-0.2183509, 0.2292839, 0.3630979, 0, 1, 0.5843138, 1,
-0.2164724, -0.4546921, -1.622591, 0, 1, 0.5921569, 1,
-0.2151418, -0.6238871, -3.776742, 0, 1, 0.5960785, 1,
-0.2139796, -1.23716, -2.377355, 0, 1, 0.6039216, 1,
-0.2101928, -0.5997467, -4.222867, 0, 1, 0.6117647, 1,
-0.206492, 1.297632, -0.366806, 0, 1, 0.6156863, 1,
-0.2041862, 0.2259236, -0.771816, 0, 1, 0.6235294, 1,
-0.2025755, -0.4550906, -2.654927, 0, 1, 0.627451, 1,
-0.2025144, 0.943446, 0.7356266, 0, 1, 0.6352941, 1,
-0.1937707, -0.3280099, -0.6368207, 0, 1, 0.6392157, 1,
-0.1935634, -0.9983563, -4.336328, 0, 1, 0.6470588, 1,
-0.1914785, 0.1236409, -0.3555515, 0, 1, 0.6509804, 1,
-0.1912223, 0.3877593, 0.08402678, 0, 1, 0.6588235, 1,
-0.1903788, -0.1217262, -1.351828, 0, 1, 0.6627451, 1,
-0.1865928, 1.058219, -0.92461, 0, 1, 0.6705883, 1,
-0.1854659, 0.4634112, -0.1408131, 0, 1, 0.6745098, 1,
-0.1794621, -0.2574798, -3.69333, 0, 1, 0.682353, 1,
-0.1789793, -0.8916485, -5.040814, 0, 1, 0.6862745, 1,
-0.1757041, -1.246183, -3.057461, 0, 1, 0.6941177, 1,
-0.1616236, 0.2977171, 0.487952, 0, 1, 0.7019608, 1,
-0.1544636, 0.5507789, 0.05117027, 0, 1, 0.7058824, 1,
-0.1490432, 1.496675, -0.1199581, 0, 1, 0.7137255, 1,
-0.1480308, 0.9672482, -2.688802, 0, 1, 0.7176471, 1,
-0.1458025, 0.7350497, 0.6485114, 0, 1, 0.7254902, 1,
-0.1432477, -0.07252328, -1.898242, 0, 1, 0.7294118, 1,
-0.1382818, 0.1654061, -0.3492399, 0, 1, 0.7372549, 1,
-0.1342036, -1.310333, -1.042587, 0, 1, 0.7411765, 1,
-0.134162, -2.977936, -2.911552, 0, 1, 0.7490196, 1,
-0.1322292, -1.482434, -2.196822, 0, 1, 0.7529412, 1,
-0.1294313, -0.09940182, 0.1056411, 0, 1, 0.7607843, 1,
-0.1279203, 0.3485206, 0.3222253, 0, 1, 0.7647059, 1,
-0.1275274, 1.628493, -0.3816226, 0, 1, 0.772549, 1,
-0.1228706, 0.2824517, 0.8996156, 0, 1, 0.7764706, 1,
-0.1174941, 0.7397489, -0.1078249, 0, 1, 0.7843137, 1,
-0.1135986, -0.2482071, -3.343533, 0, 1, 0.7882353, 1,
-0.1125499, 0.7648509, 0.4200789, 0, 1, 0.7960784, 1,
-0.1117033, 3.301614, 1.841636, 0, 1, 0.8039216, 1,
-0.1108023, 1.158046, 2.061338, 0, 1, 0.8078431, 1,
-0.1084337, 0.9625483, -0.9959706, 0, 1, 0.8156863, 1,
-0.1081579, -0.2617514, -2.540414, 0, 1, 0.8196079, 1,
-0.1078487, -0.8232377, -1.467367, 0, 1, 0.827451, 1,
-0.1038914, 0.030887, -0.8874738, 0, 1, 0.8313726, 1,
-0.1028571, -1.467223, -3.554773, 0, 1, 0.8392157, 1,
-0.09411956, -3.129142, -3.149131, 0, 1, 0.8431373, 1,
-0.09342586, -0.3114847, -2.370328, 0, 1, 0.8509804, 1,
-0.09043959, -0.4699428, -3.267462, 0, 1, 0.854902, 1,
-0.08975017, -1.217854, -3.027704, 0, 1, 0.8627451, 1,
-0.08704051, 0.06430244, -1.387069, 0, 1, 0.8666667, 1,
-0.08643404, -0.3674392, -2.347423, 0, 1, 0.8745098, 1,
-0.07853139, 0.4112604, -1.085109, 0, 1, 0.8784314, 1,
-0.07742381, 0.4578946, 0.6155818, 0, 1, 0.8862745, 1,
-0.07624866, 1.274676, -0.1469181, 0, 1, 0.8901961, 1,
-0.07118256, 0.689955, 2.211069, 0, 1, 0.8980392, 1,
-0.07065389, -1.057987, -2.860997, 0, 1, 0.9058824, 1,
-0.06833842, 1.164903, -0.3641081, 0, 1, 0.9098039, 1,
-0.06817345, -1.631759, -3.837166, 0, 1, 0.9176471, 1,
-0.06754097, 1.94685, -1.009178, 0, 1, 0.9215686, 1,
-0.06632748, -0.4335267, -4.494303, 0, 1, 0.9294118, 1,
-0.0645119, -1.544688, -3.80366, 0, 1, 0.9333333, 1,
-0.06340903, -0.1976762, -2.539557, 0, 1, 0.9411765, 1,
-0.05861737, -1.854575, -3.492099, 0, 1, 0.945098, 1,
-0.05509847, 1.01801, 0.04645903, 0, 1, 0.9529412, 1,
-0.05440622, 1.768356, -0.6782951, 0, 1, 0.9568627, 1,
-0.05383788, 0.8392581, 0.9113092, 0, 1, 0.9647059, 1,
-0.05157476, 0.4772718, -1.708796, 0, 1, 0.9686275, 1,
-0.04855584, 0.7381303, -0.1219403, 0, 1, 0.9764706, 1,
-0.04655544, -0.003493612, -1.396693, 0, 1, 0.9803922, 1,
-0.04558132, -1.314456, -4.305787, 0, 1, 0.9882353, 1,
-0.04363535, 1.629069, 0.8193315, 0, 1, 0.9921569, 1,
-0.04197272, 1.431216, -1.355386, 0, 1, 1, 1,
-0.04100796, 0.1395883, 1.774703, 0, 0.9921569, 1, 1,
-0.04062348, -1.408564, -3.535113, 0, 0.9882353, 1, 1,
-0.03632939, -1.414357, -4.851268, 0, 0.9803922, 1, 1,
-0.03598278, -1.693715, -3.893214, 0, 0.9764706, 1, 1,
-0.03157565, 2.893818, -2.420876, 0, 0.9686275, 1, 1,
-0.02459064, 0.2307395, 0.01400974, 0, 0.9647059, 1, 1,
-0.02447071, 0.0553654, -1.63817, 0, 0.9568627, 1, 1,
-0.02328657, 1.930412, -0.2905383, 0, 0.9529412, 1, 1,
-0.02268915, -0.07705664, -1.562101, 0, 0.945098, 1, 1,
-0.02241478, 2.450159, 1.119221, 0, 0.9411765, 1, 1,
-0.02095594, 0.6934873, -0.6293613, 0, 0.9333333, 1, 1,
-0.01585256, 0.3993171, -0.732316, 0, 0.9294118, 1, 1,
-0.0144586, 0.1120969, 2.534606, 0, 0.9215686, 1, 1,
-0.01247433, -2.009348, -3.493744, 0, 0.9176471, 1, 1,
-0.00531589, 0.9499071, -0.6379552, 0, 0.9098039, 1, 1,
-0.003774717, -0.5503739, -2.900213, 0, 0.9058824, 1, 1,
-0.002856416, -0.9889556, -1.268906, 0, 0.8980392, 1, 1,
-0.001755509, -0.9755586, -3.319905, 0, 0.8901961, 1, 1,
0.0002631273, 1.519536, 1.258507, 0, 0.8862745, 1, 1,
0.006068416, 0.3655534, -0.8983701, 0, 0.8784314, 1, 1,
0.006963403, -0.6572294, 3.051487, 0, 0.8745098, 1, 1,
0.008092439, 0.7149174, -2.293095, 0, 0.8666667, 1, 1,
0.008289251, 0.1093857, -1.82851, 0, 0.8627451, 1, 1,
0.008582493, -0.8775321, 3.694735, 0, 0.854902, 1, 1,
0.01250951, -0.129526, 3.350479, 0, 0.8509804, 1, 1,
0.0199667, 1.200557, 1.184826, 0, 0.8431373, 1, 1,
0.02097706, 1.576753, -0.1789952, 0, 0.8392157, 1, 1,
0.03072366, 1.146116, -0.9710561, 0, 0.8313726, 1, 1,
0.03392971, -0.2149657, 5.714884, 0, 0.827451, 1, 1,
0.03452023, -0.7604219, 4.370432, 0, 0.8196079, 1, 1,
0.03863137, 0.1243881, 0.5892293, 0, 0.8156863, 1, 1,
0.0447894, -2.064588, 3.018427, 0, 0.8078431, 1, 1,
0.04581964, -1.670961, 4.661217, 0, 0.8039216, 1, 1,
0.04595573, -0.06326056, 2.534616, 0, 0.7960784, 1, 1,
0.04723018, -0.9265438, 4.54028, 0, 0.7882353, 1, 1,
0.05039491, 0.1370137, 1.027146, 0, 0.7843137, 1, 1,
0.05451849, -1.282543, 3.069438, 0, 0.7764706, 1, 1,
0.05993231, 2.19071, -0.9411463, 0, 0.772549, 1, 1,
0.06145729, 2.338063, -0.3516369, 0, 0.7647059, 1, 1,
0.06190153, 0.2416376, -1.940454, 0, 0.7607843, 1, 1,
0.06378672, 0.8610438, 0.4434102, 0, 0.7529412, 1, 1,
0.06525541, 0.5231347, -0.6455264, 0, 0.7490196, 1, 1,
0.06947619, -0.2805169, 2.092235, 0, 0.7411765, 1, 1,
0.07691567, 0.4277683, 1.99535, 0, 0.7372549, 1, 1,
0.07939995, 1.260767, -0.3272699, 0, 0.7294118, 1, 1,
0.08013074, -0.8105751, 3.48211, 0, 0.7254902, 1, 1,
0.08063545, 1.86016, 0.06453859, 0, 0.7176471, 1, 1,
0.08227201, 0.1137669, 2.053557, 0, 0.7137255, 1, 1,
0.08305006, 0.5416354, 0.8218434, 0, 0.7058824, 1, 1,
0.08495723, -0.7065615, 3.388017, 0, 0.6980392, 1, 1,
0.08656745, -0.2570486, 2.988036, 0, 0.6941177, 1, 1,
0.08680218, 0.697222, -0.123894, 0, 0.6862745, 1, 1,
0.08805288, 1.076615, -2.158562, 0, 0.682353, 1, 1,
0.09125523, 0.04934607, 2.346179, 0, 0.6745098, 1, 1,
0.09132305, 1.057938, 0.9911572, 0, 0.6705883, 1, 1,
0.09278262, -0.9836753, 4.093666, 0, 0.6627451, 1, 1,
0.09422942, -1.364966, 2.663174, 0, 0.6588235, 1, 1,
0.09781489, -0.9016263, 2.156834, 0, 0.6509804, 1, 1,
0.09931327, 1.417044, 0.7795994, 0, 0.6470588, 1, 1,
0.1077402, -0.1133405, 3.080847, 0, 0.6392157, 1, 1,
0.1093769, 1.348076, 1.396783, 0, 0.6352941, 1, 1,
0.1122619, -0.7631142, 3.547853, 0, 0.627451, 1, 1,
0.1123429, 0.6889846, 1.038695, 0, 0.6235294, 1, 1,
0.1130646, -0.4087514, 3.283667, 0, 0.6156863, 1, 1,
0.119677, 0.1261179, 2.9099, 0, 0.6117647, 1, 1,
0.1221806, 0.0631481, -0.2274028, 0, 0.6039216, 1, 1,
0.1257826, -0.1917186, 1.683531, 0, 0.5960785, 1, 1,
0.1262606, -0.3297876, 2.5099, 0, 0.5921569, 1, 1,
0.1304933, -2.066129, 2.813648, 0, 0.5843138, 1, 1,
0.1305832, 0.2517401, 1.608118, 0, 0.5803922, 1, 1,
0.1327875, -0.507339, 2.068432, 0, 0.572549, 1, 1,
0.1417895, -0.1332033, 2.335369, 0, 0.5686275, 1, 1,
0.1438484, 0.2002553, -0.1021284, 0, 0.5607843, 1, 1,
0.1452849, 0.3543685, -0.3663986, 0, 0.5568628, 1, 1,
0.1495456, -1.1638, 2.408691, 0, 0.5490196, 1, 1,
0.1502759, -0.6826364, 2.395441, 0, 0.5450981, 1, 1,
0.1506968, 0.4683445, 0.6990227, 0, 0.5372549, 1, 1,
0.1510621, -0.2364989, 3.277267, 0, 0.5333334, 1, 1,
0.154975, -1.351545, 3.777456, 0, 0.5254902, 1, 1,
0.1579601, -0.1863852, 2.470903, 0, 0.5215687, 1, 1,
0.1607539, -0.15684, 3.276392, 0, 0.5137255, 1, 1,
0.1669985, 0.273023, 0.4440454, 0, 0.509804, 1, 1,
0.1686369, 0.00466646, 0.04533368, 0, 0.5019608, 1, 1,
0.1712883, -0.9694158, 1.892302, 0, 0.4941176, 1, 1,
0.1714051, -0.5757002, 2.924566, 0, 0.4901961, 1, 1,
0.1721506, -0.3616961, 2.437922, 0, 0.4823529, 1, 1,
0.1746484, -0.3079306, 3.312152, 0, 0.4784314, 1, 1,
0.1809873, 1.032099, 0.1153583, 0, 0.4705882, 1, 1,
0.1816339, 1.316428, 1.030247, 0, 0.4666667, 1, 1,
0.1831267, -0.08034964, 1.097677, 0, 0.4588235, 1, 1,
0.1834068, 0.2729591, -0.4336878, 0, 0.454902, 1, 1,
0.1894767, -0.9491014, 2.275043, 0, 0.4470588, 1, 1,
0.1991882, 0.6362591, 1.674357, 0, 0.4431373, 1, 1,
0.2005344, -1.209409, 1.752075, 0, 0.4352941, 1, 1,
0.201493, 0.6827298, 0.1604727, 0, 0.4313726, 1, 1,
0.202473, 0.4681146, 0.5570083, 0, 0.4235294, 1, 1,
0.2033065, -0.7102171, 2.430826, 0, 0.4196078, 1, 1,
0.2062775, -0.6876804, 2.033503, 0, 0.4117647, 1, 1,
0.2069912, -0.1261871, 0.2888663, 0, 0.4078431, 1, 1,
0.2095442, 0.1629924, -0.03888978, 0, 0.4, 1, 1,
0.2152123, -0.06631782, 2.1626, 0, 0.3921569, 1, 1,
0.2185151, -1.37324, 3.078932, 0, 0.3882353, 1, 1,
0.2217984, 0.2024484, 0.08991241, 0, 0.3803922, 1, 1,
0.226266, 0.2537853, -0.02690151, 0, 0.3764706, 1, 1,
0.2268531, -0.1869653, 1.123112, 0, 0.3686275, 1, 1,
0.2298158, -0.9381641, 2.221824, 0, 0.3647059, 1, 1,
0.2326269, 0.4667401, -0.05576665, 0, 0.3568628, 1, 1,
0.2337339, -0.9510252, 4.269526, 0, 0.3529412, 1, 1,
0.2411267, 0.4254117, -0.3239225, 0, 0.345098, 1, 1,
0.2416571, 1.388895, 0.6716739, 0, 0.3411765, 1, 1,
0.2526196, -0.7274494, 3.072666, 0, 0.3333333, 1, 1,
0.2547472, -0.9571533, 1.910616, 0, 0.3294118, 1, 1,
0.2560285, 2.55353, -0.2645367, 0, 0.3215686, 1, 1,
0.2578972, 0.2116889, 0.05344925, 0, 0.3176471, 1, 1,
0.2620972, -0.06032183, 1.006731, 0, 0.3098039, 1, 1,
0.2627502, -0.9290335, 5.000521, 0, 0.3058824, 1, 1,
0.2720465, -0.4366644, 2.489955, 0, 0.2980392, 1, 1,
0.2756351, 2.220955, 0.4764691, 0, 0.2901961, 1, 1,
0.2762522, 0.294907, 0.319898, 0, 0.2862745, 1, 1,
0.2778394, -0.2348707, 0.4781234, 0, 0.2784314, 1, 1,
0.2820878, 0.008443083, 2.713499, 0, 0.2745098, 1, 1,
0.2836535, 0.440446, -1.13829, 0, 0.2666667, 1, 1,
0.2875951, 2.670018, 1.056351, 0, 0.2627451, 1, 1,
0.2896649, 0.9292831, -0.9828161, 0, 0.254902, 1, 1,
0.2905413, 1.916453, -0.3949469, 0, 0.2509804, 1, 1,
0.2908523, 1.02015, -0.1326113, 0, 0.2431373, 1, 1,
0.2948008, -0.4343443, 2.166105, 0, 0.2392157, 1, 1,
0.2969516, -0.1107266, 1.172961, 0, 0.2313726, 1, 1,
0.3002219, -1.082173, 3.943134, 0, 0.227451, 1, 1,
0.3061856, -0.8755517, 2.929575, 0, 0.2196078, 1, 1,
0.3104801, 0.09879275, 0.4903475, 0, 0.2156863, 1, 1,
0.3108846, -1.001087, 1.751443, 0, 0.2078431, 1, 1,
0.3155628, 0.4694225, -1.337437, 0, 0.2039216, 1, 1,
0.3240213, 1.723725, 1.527617, 0, 0.1960784, 1, 1,
0.3260304, -0.592354, 2.243376, 0, 0.1882353, 1, 1,
0.3277047, 0.4833409, 1.621078, 0, 0.1843137, 1, 1,
0.328349, 0.06278756, 1.512332, 0, 0.1764706, 1, 1,
0.330295, 1.758214, 0.4012236, 0, 0.172549, 1, 1,
0.3327835, 0.1264527, 1.896333, 0, 0.1647059, 1, 1,
0.3329735, -1.391704, 3.276868, 0, 0.1607843, 1, 1,
0.3362019, -0.004437875, 0.5591624, 0, 0.1529412, 1, 1,
0.3366831, -0.1465985, 1.497492, 0, 0.1490196, 1, 1,
0.3374489, 0.8018114, -0.2653176, 0, 0.1411765, 1, 1,
0.3395124, 1.136679, 0.739648, 0, 0.1372549, 1, 1,
0.3406768, 0.4596366, -0.1570115, 0, 0.1294118, 1, 1,
0.3422338, 0.7870397, -0.8418125, 0, 0.1254902, 1, 1,
0.342343, 1.210387, 0.361569, 0, 0.1176471, 1, 1,
0.3492635, -0.5986992, 3.783416, 0, 0.1137255, 1, 1,
0.3506818, 0.9941779, -0.009908914, 0, 0.1058824, 1, 1,
0.3511572, 1.06133, 0.4715658, 0, 0.09803922, 1, 1,
0.3533931, -0.5210759, 2.102988, 0, 0.09411765, 1, 1,
0.3536522, 0.2302241, 0.2277913, 0, 0.08627451, 1, 1,
0.3558113, -0.6607502, 2.000501, 0, 0.08235294, 1, 1,
0.357633, -0.8922844, 3.086824, 0, 0.07450981, 1, 1,
0.3588677, 0.6515453, -0.3200324, 0, 0.07058824, 1, 1,
0.3594913, 0.786521, -0.006426981, 0, 0.0627451, 1, 1,
0.3624851, -1.196631, 2.774819, 0, 0.05882353, 1, 1,
0.3667954, 0.2752587, 2.155862, 0, 0.05098039, 1, 1,
0.3675377, -0.5138817, 3.09743, 0, 0.04705882, 1, 1,
0.3697946, -0.5091649, 3.590551, 0, 0.03921569, 1, 1,
0.3698412, -0.4378939, 2.407525, 0, 0.03529412, 1, 1,
0.3753122, 1.877135, 0.1022935, 0, 0.02745098, 1, 1,
0.376389, -1.239191, 0.504929, 0, 0.02352941, 1, 1,
0.3804311, -0.8935445, 3.299429, 0, 0.01568628, 1, 1,
0.3805982, 1.691426, -0.9164974, 0, 0.01176471, 1, 1,
0.3884888, 0.6526648, 0.1031909, 0, 0.003921569, 1, 1,
0.3885042, -1.641734, 2.966775, 0.003921569, 0, 1, 1,
0.3889551, -0.1044395, 1.664683, 0.007843138, 0, 1, 1,
0.3910533, -1.662156, 2.749289, 0.01568628, 0, 1, 1,
0.3953082, -1.656744, 2.771009, 0.01960784, 0, 1, 1,
0.3991932, 0.5216537, -0.6654129, 0.02745098, 0, 1, 1,
0.3994933, 0.3283391, -1.338248, 0.03137255, 0, 1, 1,
0.4021169, -1.869853, 2.524891, 0.03921569, 0, 1, 1,
0.4035791, -1.079251, 2.660621, 0.04313726, 0, 1, 1,
0.4047489, 0.6423296, -0.4692015, 0.05098039, 0, 1, 1,
0.407043, -1.157101, 1.624576, 0.05490196, 0, 1, 1,
0.4093934, -0.8765688, 3.380887, 0.0627451, 0, 1, 1,
0.409456, 1.478415, -0.6125031, 0.06666667, 0, 1, 1,
0.4106557, 0.5695773, 0.08166762, 0.07450981, 0, 1, 1,
0.41234, -0.963361, 3.261758, 0.07843138, 0, 1, 1,
0.4126335, 0.559283, 2.36736, 0.08627451, 0, 1, 1,
0.4129404, -0.7811824, 2.671016, 0.09019608, 0, 1, 1,
0.4161301, 1.023021, -0.5241937, 0.09803922, 0, 1, 1,
0.4186332, 1.47194, -1.005183, 0.1058824, 0, 1, 1,
0.4253042, 0.749844, 0.2938534, 0.1098039, 0, 1, 1,
0.4265364, 1.11071, -2.344656, 0.1176471, 0, 1, 1,
0.4274515, -0.6512483, 3.679851, 0.1215686, 0, 1, 1,
0.4292903, -0.898583, 3.007816, 0.1294118, 0, 1, 1,
0.4318764, 0.1024316, 2.33828, 0.1333333, 0, 1, 1,
0.4330587, 0.9318283, -0.5464324, 0.1411765, 0, 1, 1,
0.4343307, 0.9918193, 0.7636029, 0.145098, 0, 1, 1,
0.4410484, -1.044098, 4.63866, 0.1529412, 0, 1, 1,
0.4546341, 0.5836214, 1.799492, 0.1568628, 0, 1, 1,
0.4552266, -0.5746348, 2.604811, 0.1647059, 0, 1, 1,
0.4575386, 0.6702175, 0.2756001, 0.1686275, 0, 1, 1,
0.4580758, -2.131068, 3.489539, 0.1764706, 0, 1, 1,
0.4615156, 0.2798491, 0.2687757, 0.1803922, 0, 1, 1,
0.4661576, 1.16208, 1.65288, 0.1882353, 0, 1, 1,
0.4674135, -0.2491814, 2.926494, 0.1921569, 0, 1, 1,
0.4707534, 1.00115, -0.2308204, 0.2, 0, 1, 1,
0.4708228, -0.1791266, 2.282579, 0.2078431, 0, 1, 1,
0.4725707, -1.751064, 1.550117, 0.2117647, 0, 1, 1,
0.4741748, -0.8129809, 2.457487, 0.2196078, 0, 1, 1,
0.4764847, 0.1170221, 2.166235, 0.2235294, 0, 1, 1,
0.478091, -1.544423, 3.497913, 0.2313726, 0, 1, 1,
0.4797334, 0.8867317, -0.5766135, 0.2352941, 0, 1, 1,
0.480101, 0.62715, 2.07996, 0.2431373, 0, 1, 1,
0.4814114, -2.863245, 3.129006, 0.2470588, 0, 1, 1,
0.4826369, -0.3085587, 3.161862, 0.254902, 0, 1, 1,
0.4864896, -1.900802, 3.426072, 0.2588235, 0, 1, 1,
0.4865625, -1.184433, 1.853554, 0.2666667, 0, 1, 1,
0.4885599, -1.292967, 2.961674, 0.2705882, 0, 1, 1,
0.4927321, -0.5613377, 2.785892, 0.2784314, 0, 1, 1,
0.493024, 0.3086148, 0.8144255, 0.282353, 0, 1, 1,
0.493866, 0.4252148, 1.135692, 0.2901961, 0, 1, 1,
0.4980231, 0.4895314, 1.644794, 0.2941177, 0, 1, 1,
0.4986523, -0.1145023, 2.63761, 0.3019608, 0, 1, 1,
0.5059386, -0.1404027, 1.69429, 0.3098039, 0, 1, 1,
0.5107517, 1.775469, -1.252017, 0.3137255, 0, 1, 1,
0.5136755, 0.9867028, 0.1570782, 0.3215686, 0, 1, 1,
0.514881, 0.9763248, 1.970503, 0.3254902, 0, 1, 1,
0.5149247, 1.220481, -0.7047555, 0.3333333, 0, 1, 1,
0.5164797, -0.8170847, 1.687874, 0.3372549, 0, 1, 1,
0.5179359, -0.1905333, 2.877301, 0.345098, 0, 1, 1,
0.5206281, -0.6578249, 1.415799, 0.3490196, 0, 1, 1,
0.5229667, 0.5158374, 1.921978, 0.3568628, 0, 1, 1,
0.5242854, -0.5619512, 3.082073, 0.3607843, 0, 1, 1,
0.5458287, 0.1463416, -0.1738919, 0.3686275, 0, 1, 1,
0.5486124, 1.769568, 0.6331826, 0.372549, 0, 1, 1,
0.5512425, -0.2481788, 1.809441, 0.3803922, 0, 1, 1,
0.5532206, -0.4630073, 2.911972, 0.3843137, 0, 1, 1,
0.5534537, 1.554938, 1.642527, 0.3921569, 0, 1, 1,
0.5539618, 1.915475, 1.641491, 0.3960784, 0, 1, 1,
0.5576627, -0.4087899, -0.2213452, 0.4039216, 0, 1, 1,
0.5580239, -0.3772647, 1.543692, 0.4117647, 0, 1, 1,
0.5605359, -0.5217509, 3.193495, 0.4156863, 0, 1, 1,
0.5618765, 0.05542329, 2.1582, 0.4235294, 0, 1, 1,
0.562406, -1.081491, 3.251701, 0.427451, 0, 1, 1,
0.5630098, 0.1759842, 2.059144, 0.4352941, 0, 1, 1,
0.5634198, -0.02978229, 1.623565, 0.4392157, 0, 1, 1,
0.5655271, -0.3900317, 2.241641, 0.4470588, 0, 1, 1,
0.5673574, 2.222464, 1.762122, 0.4509804, 0, 1, 1,
0.5718296, 0.3423383, 1.123369, 0.4588235, 0, 1, 1,
0.5740803, 0.6538039, 0.6053486, 0.4627451, 0, 1, 1,
0.5779944, 0.9083173, -0.7195359, 0.4705882, 0, 1, 1,
0.5889233, -1.280273, 3.456801, 0.4745098, 0, 1, 1,
0.5889547, -0.9222288, 2.593266, 0.4823529, 0, 1, 1,
0.5895019, -0.1639958, 1.73854, 0.4862745, 0, 1, 1,
0.593322, 1.981393, 1.642166, 0.4941176, 0, 1, 1,
0.602023, 0.09278081, -0.08625348, 0.5019608, 0, 1, 1,
0.6028517, 0.7333921, 0.07992782, 0.5058824, 0, 1, 1,
0.6035364, 1.938801, -2.15495, 0.5137255, 0, 1, 1,
0.6048627, 0.6619938, 0.2202967, 0.5176471, 0, 1, 1,
0.6060949, 0.2242321, 0.3401074, 0.5254902, 0, 1, 1,
0.6069288, -0.6745195, 2.180015, 0.5294118, 0, 1, 1,
0.6076156, -0.03372652, 2.299255, 0.5372549, 0, 1, 1,
0.6176758, -1.029723, 4.401429, 0.5411765, 0, 1, 1,
0.6196094, 2.060349, 0.02162612, 0.5490196, 0, 1, 1,
0.6225997, 2.253997, -0.6494709, 0.5529412, 0, 1, 1,
0.6229535, -0.3894994, 0.1664575, 0.5607843, 0, 1, 1,
0.6248255, 0.1094671, 2.329393, 0.5647059, 0, 1, 1,
0.6263782, -1.875969, 1.571459, 0.572549, 0, 1, 1,
0.6293583, 0.333874, 1.865272, 0.5764706, 0, 1, 1,
0.6323692, 0.8499431, -0.8255072, 0.5843138, 0, 1, 1,
0.6339654, -2.025964, 1.812749, 0.5882353, 0, 1, 1,
0.6360963, 0.9758093, 0.7615945, 0.5960785, 0, 1, 1,
0.637004, 0.1217759, 2.255358, 0.6039216, 0, 1, 1,
0.6373616, -0.5072001, 2.477088, 0.6078432, 0, 1, 1,
0.6482038, -0.584964, 3.497464, 0.6156863, 0, 1, 1,
0.6496025, -0.0009298529, 0.651292, 0.6196079, 0, 1, 1,
0.6506429, -0.963782, 3.264349, 0.627451, 0, 1, 1,
0.6645753, 1.675908, -0.01748416, 0.6313726, 0, 1, 1,
0.6657375, -0.8529479, 2.127608, 0.6392157, 0, 1, 1,
0.6663359, 1.229294, 0.7285816, 0.6431373, 0, 1, 1,
0.6713638, -0.05528249, 2.13957, 0.6509804, 0, 1, 1,
0.6798278, -1.077016, 3.270632, 0.654902, 0, 1, 1,
0.6806767, -1.784877, 3.039248, 0.6627451, 0, 1, 1,
0.681328, -0.62738, 2.641377, 0.6666667, 0, 1, 1,
0.6814001, 0.4552504, 0.4988253, 0.6745098, 0, 1, 1,
0.6827964, 0.4890587, 0.4040335, 0.6784314, 0, 1, 1,
0.6827968, 1.450293, 0.71092, 0.6862745, 0, 1, 1,
0.683444, -1.312775, 2.655551, 0.6901961, 0, 1, 1,
0.6857467, 0.9085958, -0.7968654, 0.6980392, 0, 1, 1,
0.6876548, -0.2132429, 2.070366, 0.7058824, 0, 1, 1,
0.6882411, -0.6582308, 1.220292, 0.7098039, 0, 1, 1,
0.6952319, 0.1206045, 0.9021532, 0.7176471, 0, 1, 1,
0.6978289, 0.3711074, 1.666387, 0.7215686, 0, 1, 1,
0.7020916, -0.2576519, 2.561565, 0.7294118, 0, 1, 1,
0.7079661, -0.1842552, 1.422296, 0.7333333, 0, 1, 1,
0.7139593, 1.218437, 0.1154997, 0.7411765, 0, 1, 1,
0.7148725, -1.78077, 2.163529, 0.7450981, 0, 1, 1,
0.7275122, 0.7206472, -0.5707841, 0.7529412, 0, 1, 1,
0.7312025, -0.3135461, 2.719111, 0.7568628, 0, 1, 1,
0.7316625, 1.551352, -0.7619612, 0.7647059, 0, 1, 1,
0.7340186, 0.8394754, 1.030537, 0.7686275, 0, 1, 1,
0.7363243, -0.7798782, 0.8979821, 0.7764706, 0, 1, 1,
0.7466015, 0.1485371, 1.591219, 0.7803922, 0, 1, 1,
0.7524058, -1.210953, 1.764494, 0.7882353, 0, 1, 1,
0.7569335, 0.0008667913, 1.574576, 0.7921569, 0, 1, 1,
0.7571248, 0.5782049, 0.557583, 0.8, 0, 1, 1,
0.7601877, -0.1461856, 2.711568, 0.8078431, 0, 1, 1,
0.762261, 0.2596054, 1.243019, 0.8117647, 0, 1, 1,
0.7635688, 0.188728, 1.897095, 0.8196079, 0, 1, 1,
0.7645733, 0.3916281, 3.234002, 0.8235294, 0, 1, 1,
0.7652206, -2.920865, 3.497626, 0.8313726, 0, 1, 1,
0.7684352, -0.2998494, 2.412863, 0.8352941, 0, 1, 1,
0.7751948, 2.200284, 0.4949765, 0.8431373, 0, 1, 1,
0.7844657, 3.174801, -1.074469, 0.8470588, 0, 1, 1,
0.7852023, -0.3364683, 1.28635, 0.854902, 0, 1, 1,
0.7878168, -0.607547, 1.607077, 0.8588235, 0, 1, 1,
0.7911122, -1.064688, 1.373402, 0.8666667, 0, 1, 1,
0.8087926, -1.016971, 2.256287, 0.8705882, 0, 1, 1,
0.809831, -0.4212008, 2.535674, 0.8784314, 0, 1, 1,
0.811592, 0.3075522, 1.031065, 0.8823529, 0, 1, 1,
0.8135373, 1.09707, 0.15176, 0.8901961, 0, 1, 1,
0.817677, 0.1700679, 2.043542, 0.8941177, 0, 1, 1,
0.8195028, 0.2471814, 1.567149, 0.9019608, 0, 1, 1,
0.8198599, -0.8788401, 2.219461, 0.9098039, 0, 1, 1,
0.8222538, -0.5440833, 3.40905, 0.9137255, 0, 1, 1,
0.8298952, -1.796539, 3.046558, 0.9215686, 0, 1, 1,
0.8332511, -0.2438202, 2.435006, 0.9254902, 0, 1, 1,
0.8350777, 0.3268728, 0.2906336, 0.9333333, 0, 1, 1,
0.8373501, -0.8161992, 3.166765, 0.9372549, 0, 1, 1,
0.8422787, -0.3631013, 3.046778, 0.945098, 0, 1, 1,
0.8424717, 0.5527256, 1.493734, 0.9490196, 0, 1, 1,
0.8449458, -0.1975597, 2.390262, 0.9568627, 0, 1, 1,
0.85236, -0.1829506, 1.319794, 0.9607843, 0, 1, 1,
0.8536101, 1.223752, 1.182585, 0.9686275, 0, 1, 1,
0.8552528, -0.881682, 3.393445, 0.972549, 0, 1, 1,
0.8578062, -0.5635936, 2.204392, 0.9803922, 0, 1, 1,
0.8578755, -0.1605227, 1.258236, 0.9843137, 0, 1, 1,
0.8645635, 0.909731, 1.37149, 0.9921569, 0, 1, 1,
0.869902, -2.184482, 3.476828, 0.9960784, 0, 1, 1,
0.8730633, -0.01736254, 2.06016, 1, 0, 0.9960784, 1,
0.8777587, -1.793055, 3.472686, 1, 0, 0.9882353, 1,
0.879936, 1.102482, 1.743392, 1, 0, 0.9843137, 1,
0.8827908, -1.326144, 4.153185, 1, 0, 0.9764706, 1,
0.8829582, -0.4882447, 1.541577, 1, 0, 0.972549, 1,
0.8972727, -0.526105, 1.90835, 1, 0, 0.9647059, 1,
0.8988556, -0.07613078, 2.188173, 1, 0, 0.9607843, 1,
0.9015689, 1.5085, -0.1954191, 1, 0, 0.9529412, 1,
0.9037309, 2.193446, 1.50833, 1, 0, 0.9490196, 1,
0.9045061, -0.1598113, 1.852919, 1, 0, 0.9411765, 1,
0.9067783, 0.1103248, 1.628924, 1, 0, 0.9372549, 1,
0.908388, -0.6687571, 2.025767, 1, 0, 0.9294118, 1,
0.9132273, -1.068658, 2.05441, 1, 0, 0.9254902, 1,
0.9139013, 1.699824, 2.579452, 1, 0, 0.9176471, 1,
0.920587, 1.162226, 0.8399668, 1, 0, 0.9137255, 1,
0.9269646, -1.250685, 4.603128, 1, 0, 0.9058824, 1,
0.9297951, -1.031245, 0.6172485, 1, 0, 0.9019608, 1,
0.9320166, -0.9225304, 2.178207, 1, 0, 0.8941177, 1,
0.934488, -2.153107, 2.482598, 1, 0, 0.8862745, 1,
0.9414799, 0.2147487, 0.5300831, 1, 0, 0.8823529, 1,
0.9441569, 0.6835466, -0.636893, 1, 0, 0.8745098, 1,
0.946474, 0.7683288, 1.300094, 1, 0, 0.8705882, 1,
0.947561, -0.5852174, 3.841985, 1, 0, 0.8627451, 1,
0.9486377, 0.241547, 0.7565662, 1, 0, 0.8588235, 1,
0.9504349, 0.5303011, 1.201639, 1, 0, 0.8509804, 1,
0.9582419, 0.4968447, 1.816178, 1, 0, 0.8470588, 1,
0.9588943, 2.18094, 0.3932698, 1, 0, 0.8392157, 1,
0.9788875, -1.39321, 2.448117, 1, 0, 0.8352941, 1,
0.9877743, 0.3256329, 0.3817554, 1, 0, 0.827451, 1,
0.9913027, 0.6089987, 0.9081826, 1, 0, 0.8235294, 1,
0.9937464, 0.02975056, 3.336335, 1, 0, 0.8156863, 1,
1.001543, -0.8126339, 3.773149, 1, 0, 0.8117647, 1,
1.001877, 0.3207445, 1.732548, 1, 0, 0.8039216, 1,
1.006845, -1.258895, 2.410887, 1, 0, 0.7960784, 1,
1.011175, -1.920753, 1.41335, 1, 0, 0.7921569, 1,
1.012542, 0.2104368, 0.04873084, 1, 0, 0.7843137, 1,
1.014948, -1.19595, 1.668334, 1, 0, 0.7803922, 1,
1.019951, -0.342373, 4.193302, 1, 0, 0.772549, 1,
1.035924, 0.6035629, 0.2735085, 1, 0, 0.7686275, 1,
1.046146, 1.779641, 1.291594, 1, 0, 0.7607843, 1,
1.051271, 1.149927, 1.240281, 1, 0, 0.7568628, 1,
1.068238, -1.207913, 3.284681, 1, 0, 0.7490196, 1,
1.075667, -1.554658, 3.690242, 1, 0, 0.7450981, 1,
1.077534, 1.638356, 0.9294785, 1, 0, 0.7372549, 1,
1.077979, -0.08249018, 1.861048, 1, 0, 0.7333333, 1,
1.0841, -0.4923606, 4.034921, 1, 0, 0.7254902, 1,
1.084363, 0.6113577, 1.482186, 1, 0, 0.7215686, 1,
1.088271, 1.952353, -0.9932097, 1, 0, 0.7137255, 1,
1.093582, -0.4334549, 2.415837, 1, 0, 0.7098039, 1,
1.094376, -1.181115, 1.527629, 1, 0, 0.7019608, 1,
1.100009, -0.8876439, 2.530205, 1, 0, 0.6941177, 1,
1.10314, 1.203072, 1.082669, 1, 0, 0.6901961, 1,
1.103312, -1.099103, 1.131124, 1, 0, 0.682353, 1,
1.108625, -1.262237, 2.467587, 1, 0, 0.6784314, 1,
1.110311, -0.6463827, 1.636101, 1, 0, 0.6705883, 1,
1.114619, -0.8434538, 1.915558, 1, 0, 0.6666667, 1,
1.114994, 0.2243311, 1.858982, 1, 0, 0.6588235, 1,
1.118946, -0.86763, 2.837489, 1, 0, 0.654902, 1,
1.120471, -0.3887987, 2.787416, 1, 0, 0.6470588, 1,
1.129563, 0.2072208, 0.4874617, 1, 0, 0.6431373, 1,
1.137961, 0.7096705, 0.7165178, 1, 0, 0.6352941, 1,
1.142128, 0.2833761, 0.8255023, 1, 0, 0.6313726, 1,
1.161015, 1.369832, 1.363913, 1, 0, 0.6235294, 1,
1.161629, 0.1394196, 1.857382, 1, 0, 0.6196079, 1,
1.197971, -0.3435138, 1.877443, 1, 0, 0.6117647, 1,
1.199975, 0.5964428, 0.9544985, 1, 0, 0.6078432, 1,
1.214489, 0.8471062, -0.05746092, 1, 0, 0.6, 1,
1.229277, -0.9433438, 2.127838, 1, 0, 0.5921569, 1,
1.229573, -0.4110539, 0.8411047, 1, 0, 0.5882353, 1,
1.24099, 2.08838, 0.6554296, 1, 0, 0.5803922, 1,
1.25876, 2.428512, 0.1409428, 1, 0, 0.5764706, 1,
1.260162, 0.3431917, 0.0210389, 1, 0, 0.5686275, 1,
1.261207, 0.5149645, 0.01835624, 1, 0, 0.5647059, 1,
1.269597, 1.507706, -1.163799, 1, 0, 0.5568628, 1,
1.276235, 2.192615, 1.419863, 1, 0, 0.5529412, 1,
1.287979, 1.083465, -0.04742846, 1, 0, 0.5450981, 1,
1.290167, -0.3380329, 1.702287, 1, 0, 0.5411765, 1,
1.291581, 1.300425, 1.446576, 1, 0, 0.5333334, 1,
1.313588, 0.0005896146, 1.44586, 1, 0, 0.5294118, 1,
1.328396, -1.816807, 2.873001, 1, 0, 0.5215687, 1,
1.34463, 0.939573, 1.357093, 1, 0, 0.5176471, 1,
1.358187, -0.8407153, 1.678178, 1, 0, 0.509804, 1,
1.362293, 1.633866, -0.005668033, 1, 0, 0.5058824, 1,
1.36403, 0.403319, 1.878537, 1, 0, 0.4980392, 1,
1.36523, -0.2894017, 1.595512, 1, 0, 0.4901961, 1,
1.376443, 0.442882, 1.45392, 1, 0, 0.4862745, 1,
1.382831, -0.3374323, 1.890126, 1, 0, 0.4784314, 1,
1.394634, 0.1002743, 0.2783462, 1, 0, 0.4745098, 1,
1.403078, 0.5578687, 1.521982, 1, 0, 0.4666667, 1,
1.406077, -1.340651, 2.187354, 1, 0, 0.4627451, 1,
1.416246, -0.6392999, 2.11611, 1, 0, 0.454902, 1,
1.420319, -0.69546, 3.035498, 1, 0, 0.4509804, 1,
1.448003, 2.277703, -0.06532191, 1, 0, 0.4431373, 1,
1.452896, -1.48569, 3.837417, 1, 0, 0.4392157, 1,
1.453816, 0.3098713, 2.003867, 1, 0, 0.4313726, 1,
1.475487, -1.634756, 3.035681, 1, 0, 0.427451, 1,
1.479228, -0.4785143, 2.962108, 1, 0, 0.4196078, 1,
1.480495, -1.318167, 2.857841, 1, 0, 0.4156863, 1,
1.483613, 1.409958, 1.411016, 1, 0, 0.4078431, 1,
1.521737, -0.9291466, 2.003696, 1, 0, 0.4039216, 1,
1.521979, -0.8916683, 1.295515, 1, 0, 0.3960784, 1,
1.526875, -2.111808, 1.81911, 1, 0, 0.3882353, 1,
1.531942, 0.9676059, -0.1048792, 1, 0, 0.3843137, 1,
1.53692, -0.1680685, 2.018065, 1, 0, 0.3764706, 1,
1.541206, -0.5913192, 3.102068, 1, 0, 0.372549, 1,
1.549452, -0.7986516, 2.827197, 1, 0, 0.3647059, 1,
1.554499, 0.2384226, 1.464736, 1, 0, 0.3607843, 1,
1.555218, -0.1306436, 0.9950896, 1, 0, 0.3529412, 1,
1.556415, 0.6619562, 3.514246, 1, 0, 0.3490196, 1,
1.569768, -1.029089, 1.646419, 1, 0, 0.3411765, 1,
1.570726, 0.6833616, 1.968799, 1, 0, 0.3372549, 1,
1.573163, 0.5975281, 2.017989, 1, 0, 0.3294118, 1,
1.573399, 0.4046145, 1.114188, 1, 0, 0.3254902, 1,
1.597731, 2.931104, -0.9386094, 1, 0, 0.3176471, 1,
1.616413, 0.1527496, 1.603558, 1, 0, 0.3137255, 1,
1.640177, -0.686039, 2.03624, 1, 0, 0.3058824, 1,
1.645274, -0.3541464, 2.518874, 1, 0, 0.2980392, 1,
1.664886, -2.246069, 2.690354, 1, 0, 0.2941177, 1,
1.666419, -0.139818, 3.40325, 1, 0, 0.2862745, 1,
1.673161, 0.5632675, 0.9022406, 1, 0, 0.282353, 1,
1.674371, -0.549603, 0.5491694, 1, 0, 0.2745098, 1,
1.678254, -1.567044, 1.741305, 1, 0, 0.2705882, 1,
1.680022, -1.751237, 0.7963936, 1, 0, 0.2627451, 1,
1.690219, 0.5082796, 1.562335, 1, 0, 0.2588235, 1,
1.69789, -0.6947827, 0.8028294, 1, 0, 0.2509804, 1,
1.698725, 0.7858523, 2.469256, 1, 0, 0.2470588, 1,
1.700618, 0.3885531, 2.178688, 1, 0, 0.2392157, 1,
1.728903, 0.5536508, 1.401477, 1, 0, 0.2352941, 1,
1.754919, -1.901786, 2.940703, 1, 0, 0.227451, 1,
1.760493, 0.2723882, 0.8391966, 1, 0, 0.2235294, 1,
1.81673, 1.499634, 1.60818, 1, 0, 0.2156863, 1,
1.83395, 1.621669, 1.706415, 1, 0, 0.2117647, 1,
1.839739, 0.6671005, 0.647096, 1, 0, 0.2039216, 1,
1.865373, -0.1742424, 1.968907, 1, 0, 0.1960784, 1,
1.869984, -0.2552721, 2.327116, 1, 0, 0.1921569, 1,
1.909585, 0.2310765, 2.975447, 1, 0, 0.1843137, 1,
1.914131, 1.353609, 1.163583, 1, 0, 0.1803922, 1,
1.946753, -0.3774943, 3.2795, 1, 0, 0.172549, 1,
1.989161, 0.9271849, 0.7555281, 1, 0, 0.1686275, 1,
2.014682, -1.199489, 2.740458, 1, 0, 0.1607843, 1,
2.039006, -0.07967478, 1.935991, 1, 0, 0.1568628, 1,
2.040162, 1.720265, 2.274055, 1, 0, 0.1490196, 1,
2.059817, -0.4051234, 1.26022, 1, 0, 0.145098, 1,
2.060086, -1.387324, 1.976666, 1, 0, 0.1372549, 1,
2.077464, 0.01393193, 1.307792, 1, 0, 0.1333333, 1,
2.112786, 0.9444801, 1.094164, 1, 0, 0.1254902, 1,
2.115093, 0.07492265, 0.9928088, 1, 0, 0.1215686, 1,
2.142892, 0.1896353, 2.441473, 1, 0, 0.1137255, 1,
2.163004, -0.4267483, 1.347662, 1, 0, 0.1098039, 1,
2.23829, 0.5971913, 1.446934, 1, 0, 0.1019608, 1,
2.238526, 1.083746, 1.244098, 1, 0, 0.09411765, 1,
2.244619, -1.722157, 2.690375, 1, 0, 0.09019608, 1,
2.26172, 0.6169421, 1.594901, 1, 0, 0.08235294, 1,
2.287494, 0.5920737, 2.955495, 1, 0, 0.07843138, 1,
2.347407, 0.9345324, 2.34334, 1, 0, 0.07058824, 1,
2.357378, 0.6754755, 1.752344, 1, 0, 0.06666667, 1,
2.418197, -0.7143078, 3.595177, 1, 0, 0.05882353, 1,
2.421343, 1.556208, 1.636317, 1, 0, 0.05490196, 1,
2.42812, 0.9854776, 0.8506643, 1, 0, 0.04705882, 1,
2.437204, 0.602991, 2.559115, 1, 0, 0.04313726, 1,
2.457505, 0.261406, 1.024137, 1, 0, 0.03529412, 1,
2.478921, -1.608513, 0.1244818, 1, 0, 0.03137255, 1,
2.524624, 0.02847268, 1.694184, 1, 0, 0.02352941, 1,
2.574325, -2.338545, 2.659832, 1, 0, 0.01960784, 1,
2.709589, -0.5438134, 1.993275, 1, 0, 0.01176471, 1,
3.007125, 0.2924101, 0.07582828, 1, 0, 0.007843138, 1
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
-0.03521645, -4.219155, -7.148015, 0, -0.5, 0.5, 0.5,
-0.03521645, -4.219155, -7.148015, 1, -0.5, 0.5, 0.5,
-0.03521645, -4.219155, -7.148015, 1, 1.5, 0.5, 0.5,
-0.03521645, -4.219155, -7.148015, 0, 1.5, 0.5, 0.5
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
-4.108912, 0.08623624, -7.148015, 0, -0.5, 0.5, 0.5,
-4.108912, 0.08623624, -7.148015, 1, -0.5, 0.5, 0.5,
-4.108912, 0.08623624, -7.148015, 1, 1.5, 0.5, 0.5,
-4.108912, 0.08623624, -7.148015, 0, 1.5, 0.5, 0.5
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
-4.108912, -4.219155, 0.2155681, 0, -0.5, 0.5, 0.5,
-4.108912, -4.219155, 0.2155681, 1, -0.5, 0.5, 0.5,
-4.108912, -4.219155, 0.2155681, 1, 1.5, 0.5, 0.5,
-4.108912, -4.219155, 0.2155681, 0, 1.5, 0.5, 0.5
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
-3, -3.225603, -5.448727,
3, -3.225603, -5.448727,
-3, -3.225603, -5.448727,
-3, -3.391195, -5.731942,
-2, -3.225603, -5.448727,
-2, -3.391195, -5.731942,
-1, -3.225603, -5.448727,
-1, -3.391195, -5.731942,
0, -3.225603, -5.448727,
0, -3.391195, -5.731942,
1, -3.225603, -5.448727,
1, -3.391195, -5.731942,
2, -3.225603, -5.448727,
2, -3.391195, -5.731942,
3, -3.225603, -5.448727,
3, -3.391195, -5.731942
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
-3, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
-3, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
-3, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
-3, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
-2, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
-2, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
-2, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
-2, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
-1, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
-1, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
-1, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
-1, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
0, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
0, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
0, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
0, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
1, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
1, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
1, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
1, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
2, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
2, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
2, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
2, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5,
3, -3.722379, -6.298371, 0, -0.5, 0.5, 0.5,
3, -3.722379, -6.298371, 1, -0.5, 0.5, 0.5,
3, -3.722379, -6.298371, 1, 1.5, 0.5, 0.5,
3, -3.722379, -6.298371, 0, 1.5, 0.5, 0.5
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
-3.168828, -3, -5.448727,
-3.168828, 3, -5.448727,
-3.168828, -3, -5.448727,
-3.325509, -3, -5.731942,
-3.168828, -2, -5.448727,
-3.325509, -2, -5.731942,
-3.168828, -1, -5.448727,
-3.325509, -1, -5.731942,
-3.168828, 0, -5.448727,
-3.325509, 0, -5.731942,
-3.168828, 1, -5.448727,
-3.325509, 1, -5.731942,
-3.168828, 2, -5.448727,
-3.325509, 2, -5.731942,
-3.168828, 3, -5.448727,
-3.325509, 3, -5.731942
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
-3.63887, -3, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, -3, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, -3, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, -3, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, -2, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, -2, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, -2, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, -2, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, -1, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, -1, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, -1, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, -1, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, 0, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, 0, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, 0, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, 0, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, 1, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, 1, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, 1, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, 1, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, 2, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, 2, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, 2, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, 2, -6.298371, 0, 1.5, 0.5, 0.5,
-3.63887, 3, -6.298371, 0, -0.5, 0.5, 0.5,
-3.63887, 3, -6.298371, 1, -0.5, 0.5, 0.5,
-3.63887, 3, -6.298371, 1, 1.5, 0.5, 0.5,
-3.63887, 3, -6.298371, 0, 1.5, 0.5, 0.5
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
-3.168828, -3.225603, -4,
-3.168828, -3.225603, 4,
-3.168828, -3.225603, -4,
-3.325509, -3.391195, -4,
-3.168828, -3.225603, -2,
-3.325509, -3.391195, -2,
-3.168828, -3.225603, 0,
-3.325509, -3.391195, 0,
-3.168828, -3.225603, 2,
-3.325509, -3.391195, 2,
-3.168828, -3.225603, 4,
-3.325509, -3.391195, 4
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
-3.63887, -3.722379, -4, 0, -0.5, 0.5, 0.5,
-3.63887, -3.722379, -4, 1, -0.5, 0.5, 0.5,
-3.63887, -3.722379, -4, 1, 1.5, 0.5, 0.5,
-3.63887, -3.722379, -4, 0, 1.5, 0.5, 0.5,
-3.63887, -3.722379, -2, 0, -0.5, 0.5, 0.5,
-3.63887, -3.722379, -2, 1, -0.5, 0.5, 0.5,
-3.63887, -3.722379, -2, 1, 1.5, 0.5, 0.5,
-3.63887, -3.722379, -2, 0, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 0, 0, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 0, 1, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 0, 1, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 0, 0, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 2, 0, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 2, 1, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 2, 1, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 2, 0, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 4, 0, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 4, 1, -0.5, 0.5, 0.5,
-3.63887, -3.722379, 4, 1, 1.5, 0.5, 0.5,
-3.63887, -3.722379, 4, 0, 1.5, 0.5, 0.5
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
-3.168828, -3.225603, -5.448727,
-3.168828, 3.398075, -5.448727,
-3.168828, -3.225603, 5.879863,
-3.168828, 3.398075, 5.879863,
-3.168828, -3.225603, -5.448727,
-3.168828, -3.225603, 5.879863,
-3.168828, 3.398075, -5.448727,
-3.168828, 3.398075, 5.879863,
-3.168828, -3.225603, -5.448727,
3.098396, -3.225603, -5.448727,
-3.168828, -3.225603, 5.879863,
3.098396, -3.225603, 5.879863,
-3.168828, 3.398075, -5.448727,
3.098396, 3.398075, -5.448727,
-3.168828, 3.398075, 5.879863,
3.098396, 3.398075, 5.879863,
3.098396, -3.225603, -5.448727,
3.098396, 3.398075, -5.448727,
3.098396, -3.225603, 5.879863,
3.098396, 3.398075, 5.879863,
3.098396, -3.225603, -5.448727,
3.098396, -3.225603, 5.879863,
3.098396, 3.398075, -5.448727,
3.098396, 3.398075, 5.879863
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
var radius = 7.765484;
var distance = 34.54951;
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
mvMatrix.translate( 0.03521645, -0.08623624, -0.2155681 );
mvMatrix.scale( 1.339699, 1.267603, 0.7411507 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54951);
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
etiolate<-read.table("etiolate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etiolate$V2
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
y<-etiolate$V3
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
z<-etiolate$V4
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
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
-3.077558, 1.09765, -1.727642, 0, 0, 1, 1, 1,
-3.067556, -0.7022475, -2.520042, 1, 0, 0, 1, 1,
-3.016902, -0.1347903, -2.232167, 1, 0, 0, 1, 1,
-2.916927, -0.7772089, -2.574558, 1, 0, 0, 1, 1,
-2.862586, 0.8470171, -1.884583, 1, 0, 0, 1, 1,
-2.724725, 0.6129703, -0.5843453, 1, 0, 0, 1, 1,
-2.695396, 0.4661815, -3.338814, 0, 0, 0, 1, 1,
-2.639455, -0.5576085, -0.7662153, 0, 0, 0, 1, 1,
-2.615935, 1.399521, -2.573298, 0, 0, 0, 1, 1,
-2.611731, -0.6044024, -1.181528, 0, 0, 0, 1, 1,
-2.498458, -0.5025011, -2.2412, 0, 0, 0, 1, 1,
-2.476933, 0.5431541, -0.002938741, 0, 0, 0, 1, 1,
-2.446909, -0.1325479, -0.9266743, 0, 0, 0, 1, 1,
-2.396821, -0.6734638, -1.768682, 1, 1, 1, 1, 1,
-2.380486, 0.0185911, 0.2607456, 1, 1, 1, 1, 1,
-2.333196, -0.6755461, -0.4389996, 1, 1, 1, 1, 1,
-2.321124, 2.12758, -0.6622103, 1, 1, 1, 1, 1,
-2.287417, -0.1638936, -0.7208654, 1, 1, 1, 1, 1,
-2.281336, 1.886022, -0.6718743, 1, 1, 1, 1, 1,
-2.272382, 0.1149838, -2.8668, 1, 1, 1, 1, 1,
-2.27158, 0.6894998, -1.24507, 1, 1, 1, 1, 1,
-2.241374, 1.541319, -1.806165, 1, 1, 1, 1, 1,
-2.206797, 2.281127, 0.09288154, 1, 1, 1, 1, 1,
-2.161471, 0.5988637, -1.283595, 1, 1, 1, 1, 1,
-2.160743, 0.6477981, -0.4151848, 1, 1, 1, 1, 1,
-2.100989, -0.2836768, -1.35466, 1, 1, 1, 1, 1,
-2.071363, -0.09633204, -1.320251, 1, 1, 1, 1, 1,
-2.055721, 1.854057, -0.4395532, 1, 1, 1, 1, 1,
-2.055435, 1.274325, -1.695903, 0, 0, 1, 1, 1,
-2.047403, -1.030286, -2.90032, 1, 0, 0, 1, 1,
-2.015982, -0.3635857, 0.50378, 1, 0, 0, 1, 1,
-2.004016, 2.589733, -0.5937016, 1, 0, 0, 1, 1,
-1.999745, 0.6990842, -1.600164, 1, 0, 0, 1, 1,
-1.995757, 0.2543965, -1.140905, 1, 0, 0, 1, 1,
-1.995, -2.046586, -1.797617, 0, 0, 0, 1, 1,
-1.985754, -1.645522, -1.816844, 0, 0, 0, 1, 1,
-1.949396, 0.5054616, -1.235286, 0, 0, 0, 1, 1,
-1.920783, 1.748668, -0.994929, 0, 0, 0, 1, 1,
-1.860413, 1.356378, 1.83616, 0, 0, 0, 1, 1,
-1.834276, -0.4674198, -2.719585, 0, 0, 0, 1, 1,
-1.822683, -1.552562, -2.609167, 0, 0, 0, 1, 1,
-1.822553, 0.3868123, -1.475344, 1, 1, 1, 1, 1,
-1.81076, -0.03048348, -0.8368835, 1, 1, 1, 1, 1,
-1.793904, -1.713177, -2.896845, 1, 1, 1, 1, 1,
-1.786159, -0.2825384, -2.237028, 1, 1, 1, 1, 1,
-1.744203, -1.122386, -2.09921, 1, 1, 1, 1, 1,
-1.73736, 0.8535423, -0.074703, 1, 1, 1, 1, 1,
-1.718734, 0.895821, 0.2490735, 1, 1, 1, 1, 1,
-1.708168, 0.1564499, -2.441327, 1, 1, 1, 1, 1,
-1.705112, -1.297293, -4.240152, 1, 1, 1, 1, 1,
-1.704786, -1.925202, -0.4447703, 1, 1, 1, 1, 1,
-1.669805, -0.01430642, 0.2344174, 1, 1, 1, 1, 1,
-1.661838, 0.9176913, -0.2311216, 1, 1, 1, 1, 1,
-1.659663, -0.04068153, -2.123453, 1, 1, 1, 1, 1,
-1.658375, 0.3384723, -1.517277, 1, 1, 1, 1, 1,
-1.639815, -1.103075, -0.7206377, 1, 1, 1, 1, 1,
-1.638122, -1.123973, -2.556142, 0, 0, 1, 1, 1,
-1.63551, 1.070106, -1.051987, 1, 0, 0, 1, 1,
-1.63258, -0.854684, -2.209677, 1, 0, 0, 1, 1,
-1.61404, -2.278857, -2.139359, 1, 0, 0, 1, 1,
-1.591134, -0.6124272, -2.26914, 1, 0, 0, 1, 1,
-1.589705, 0.7661224, -1.981722, 1, 0, 0, 1, 1,
-1.545789, -1.859477, -0.9122441, 0, 0, 0, 1, 1,
-1.544544, -0.9625742, -1.219555, 0, 0, 0, 1, 1,
-1.542206, 2.007649, -1.288647, 0, 0, 0, 1, 1,
-1.53676, 0.1537907, -1.4107, 0, 0, 0, 1, 1,
-1.530076, 0.1771244, -1.61129, 0, 0, 0, 1, 1,
-1.521678, 0.2397299, -1.651173, 0, 0, 0, 1, 1,
-1.516261, 0.4885069, -0.3183796, 0, 0, 0, 1, 1,
-1.499691, -0.1199693, -1.294152, 1, 1, 1, 1, 1,
-1.474332, 0.9281242, -0.1200631, 1, 1, 1, 1, 1,
-1.469125, -1.615807, -3.413198, 1, 1, 1, 1, 1,
-1.461788, 0.648488, -1.020572, 1, 1, 1, 1, 1,
-1.460914, -0.2441, -1.106092, 1, 1, 1, 1, 1,
-1.455894, 1.191067, -1.679125, 1, 1, 1, 1, 1,
-1.427429, 1.484224, 0.7729263, 1, 1, 1, 1, 1,
-1.420397, 0.7825256, -2.161246, 1, 1, 1, 1, 1,
-1.420008, -1.484957, -0.9461263, 1, 1, 1, 1, 1,
-1.412295, -1.540729, -4.263306, 1, 1, 1, 1, 1,
-1.412008, 2.208932, 0.02465052, 1, 1, 1, 1, 1,
-1.411481, 0.5073971, -0.824346, 1, 1, 1, 1, 1,
-1.406707, 2.007495, -1.797708, 1, 1, 1, 1, 1,
-1.404205, -1.260849, -2.585226, 1, 1, 1, 1, 1,
-1.397471, -1.119986, -0.5741094, 1, 1, 1, 1, 1,
-1.394534, 0.01105828, -0.4251349, 0, 0, 1, 1, 1,
-1.390014, -0.164721, -3.257196, 1, 0, 0, 1, 1,
-1.381845, 0.1444237, -1.767408, 1, 0, 0, 1, 1,
-1.380168, 1.211493, -0.06318572, 1, 0, 0, 1, 1,
-1.378427, -0.6495229, -1.716334, 1, 0, 0, 1, 1,
-1.372417, -1.705912, -3.707529, 1, 0, 0, 1, 1,
-1.369299, -1.33958, -2.228987, 0, 0, 0, 1, 1,
-1.361683, 0.7732453, -0.3859058, 0, 0, 0, 1, 1,
-1.360393, -1.457798, -2.080337, 0, 0, 0, 1, 1,
-1.35939, 1.093087, -0.3833361, 0, 0, 0, 1, 1,
-1.356208, -0.8008763, -1.761695, 0, 0, 0, 1, 1,
-1.351894, 0.8660853, 0.4797103, 0, 0, 0, 1, 1,
-1.351629, 0.1446146, -1.085073, 0, 0, 0, 1, 1,
-1.351474, -1.357579, -1.90376, 1, 1, 1, 1, 1,
-1.318982, -1.029017, -3.704508, 1, 1, 1, 1, 1,
-1.318427, 0.07878023, -0.4835207, 1, 1, 1, 1, 1,
-1.313362, -1.183337, -4.04984, 1, 1, 1, 1, 1,
-1.309304, 0.03948736, -2.18745, 1, 1, 1, 1, 1,
-1.305893, 0.1367617, -3.728625, 1, 1, 1, 1, 1,
-1.305042, 0.193379, -0.7985037, 1, 1, 1, 1, 1,
-1.30032, 0.2774045, -1.446681, 1, 1, 1, 1, 1,
-1.297684, -1.071471, -1.217959, 1, 1, 1, 1, 1,
-1.283884, 0.5574582, -1.717042, 1, 1, 1, 1, 1,
-1.279684, 0.212973, -1.697284, 1, 1, 1, 1, 1,
-1.275286, 0.8031209, -1.596752, 1, 1, 1, 1, 1,
-1.269075, -0.8062416, -1.802657, 1, 1, 1, 1, 1,
-1.260691, -1.531717, -2.208728, 1, 1, 1, 1, 1,
-1.254521, 0.8790002, -2.502667, 1, 1, 1, 1, 1,
-1.252745, -0.1381249, -1.501269, 0, 0, 1, 1, 1,
-1.247083, -0.6506422, -0.5990783, 1, 0, 0, 1, 1,
-1.242585, 0.3725327, -2.451669, 1, 0, 0, 1, 1,
-1.219155, -0.4809693, 0.4682944, 1, 0, 0, 1, 1,
-1.217431, 0.4530978, -2.267272, 1, 0, 0, 1, 1,
-1.210794, 1.563675, 1.44795, 1, 0, 0, 1, 1,
-1.206653, 0.1003781, -0.531288, 0, 0, 0, 1, 1,
-1.202553, 0.2365099, -3.027685, 0, 0, 0, 1, 1,
-1.198061, 0.5844903, -0.3850028, 0, 0, 0, 1, 1,
-1.197657, 0.1770374, -1.018806, 0, 0, 0, 1, 1,
-1.192806, 0.2692986, -0.8571525, 0, 0, 0, 1, 1,
-1.18536, -0.3239107, -3.013007, 0, 0, 0, 1, 1,
-1.183014, -1.156407, -2.759969, 0, 0, 0, 1, 1,
-1.174542, -1.533686, -1.236502, 1, 1, 1, 1, 1,
-1.173481, -0.3925816, -1.804321, 1, 1, 1, 1, 1,
-1.172021, 0.6271181, 0.6780131, 1, 1, 1, 1, 1,
-1.169355, -0.1461279, -1.936281, 1, 1, 1, 1, 1,
-1.168969, -0.8764124, -1.929042, 1, 1, 1, 1, 1,
-1.164241, 0.3660545, -1.928972, 1, 1, 1, 1, 1,
-1.160254, 0.6236841, -0.659377, 1, 1, 1, 1, 1,
-1.154544, -1.141306, -2.135672, 1, 1, 1, 1, 1,
-1.153528, 1.504458, -0.7577441, 1, 1, 1, 1, 1,
-1.149258, -0.390012, -0.476126, 1, 1, 1, 1, 1,
-1.147153, 1.217105, -0.7351412, 1, 1, 1, 1, 1,
-1.144542, -0.3797278, -1.770262, 1, 1, 1, 1, 1,
-1.138985, -1.074951, -1.779233, 1, 1, 1, 1, 1,
-1.123518, -1.97218, -2.580144, 1, 1, 1, 1, 1,
-1.120012, -2.685493, -4.475111, 1, 1, 1, 1, 1,
-1.112257, -0.8968929, -2.395811, 0, 0, 1, 1, 1,
-1.111689, -2.349076, -3.283659, 1, 0, 0, 1, 1,
-1.107586, 0.6396676, -0.3018679, 1, 0, 0, 1, 1,
-1.092219, -1.465349, -1.926589, 1, 0, 0, 1, 1,
-1.078148, 1.302501, 0.6898927, 1, 0, 0, 1, 1,
-1.078033, -0.2430451, -2.616681, 1, 0, 0, 1, 1,
-1.074918, 0.1454252, 0.2198259, 0, 0, 0, 1, 1,
-1.069522, -0.5690166, -0.05859167, 0, 0, 0, 1, 1,
-1.065581, 0.1435251, 0.3768186, 0, 0, 0, 1, 1,
-1.065037, 0.002621698, -1.425388, 0, 0, 0, 1, 1,
-1.062781, 1.43878, -2.259094, 0, 0, 0, 1, 1,
-1.061469, -0.3344795, -2.912039, 0, 0, 0, 1, 1,
-1.052212, 0.1498224, -1.654185, 0, 0, 0, 1, 1,
-1.050835, -0.3062541, -1.028507, 1, 1, 1, 1, 1,
-1.049796, -0.3215363, -2.66822, 1, 1, 1, 1, 1,
-1.048504, -1.410812, -4.093518, 1, 1, 1, 1, 1,
-1.042839, 0.7640996, -1.037724, 1, 1, 1, 1, 1,
-1.04047, -0.3223416, -2.173517, 1, 1, 1, 1, 1,
-1.034037, -0.142699, -1.535669, 1, 1, 1, 1, 1,
-1.027056, -0.3368354, -1.701688, 1, 1, 1, 1, 1,
-1.023276, -1.503255, -2.03608, 1, 1, 1, 1, 1,
-1.021704, 0.3637388, 1.027119, 1, 1, 1, 1, 1,
-1.020598, 0.01700147, -0.8672098, 1, 1, 1, 1, 1,
-1.01934, 1.260083, -1.332304, 1, 1, 1, 1, 1,
-1.015865, -0.1766622, -0.7514412, 1, 1, 1, 1, 1,
-1.013873, 0.7360128, -1.349965, 1, 1, 1, 1, 1,
-1.013759, -0.4309946, -3.777848, 1, 1, 1, 1, 1,
-1.010976, -0.07820131, -2.911298, 1, 1, 1, 1, 1,
-1.004786, 0.02306595, -1.793304, 0, 0, 1, 1, 1,
-1.002701, -0.6908194, -0.7077914, 1, 0, 0, 1, 1,
-1.000705, -1.167587, -2.782729, 1, 0, 0, 1, 1,
-0.9971751, 2.012207, 0.3455887, 1, 0, 0, 1, 1,
-0.9952323, 0.8223255, -0.7697762, 1, 0, 0, 1, 1,
-0.9926472, -1.317093, -2.295123, 1, 0, 0, 1, 1,
-0.9924326, -0.6075988, -1.424147, 0, 0, 0, 1, 1,
-0.9908754, 0.6015671, -1.941001, 0, 0, 0, 1, 1,
-0.9860425, 1.392425, 0.08797502, 0, 0, 0, 1, 1,
-0.9794682, -0.009370566, -0.3809854, 0, 0, 0, 1, 1,
-0.9751355, -1.451568, -3.08096, 0, 0, 0, 1, 1,
-0.9683391, 0.3413365, -0.5563723, 0, 0, 0, 1, 1,
-0.9678476, -0.4996901, -2.329417, 0, 0, 0, 1, 1,
-0.9677083, -1.427956, -1.560486, 1, 1, 1, 1, 1,
-0.9655997, 0.3629131, -0.9143031, 1, 1, 1, 1, 1,
-0.9570251, 0.8950342, -0.5397278, 1, 1, 1, 1, 1,
-0.9509109, -2.147251, -3.859731, 1, 1, 1, 1, 1,
-0.9506573, -0.1704877, -0.9714578, 1, 1, 1, 1, 1,
-0.9472687, 0.305155, 0.09430041, 1, 1, 1, 1, 1,
-0.9322832, 0.790769, 0.3284011, 1, 1, 1, 1, 1,
-0.931909, 0.1746666, -0.6891138, 1, 1, 1, 1, 1,
-0.9283183, 1.137387, 0.0543059, 1, 1, 1, 1, 1,
-0.9276563, -0.05376592, -1.665313, 1, 1, 1, 1, 1,
-0.9081014, -0.2273224, -1.467722, 1, 1, 1, 1, 1,
-0.9055853, 0.1298555, -0.3057827, 1, 1, 1, 1, 1,
-0.900024, 0.2459886, -1.172052, 1, 1, 1, 1, 1,
-0.8996925, -1.365361, -1.102961, 1, 1, 1, 1, 1,
-0.8965198, 0.01802588, -1.172014, 1, 1, 1, 1, 1,
-0.8932115, -0.8394806, -4.539824, 0, 0, 1, 1, 1,
-0.8899494, 2.004212, 1.208902, 1, 0, 0, 1, 1,
-0.8847016, -0.2452333, -0.6902895, 1, 0, 0, 1, 1,
-0.8832233, -0.4084462, -3.791406, 1, 0, 0, 1, 1,
-0.878105, 0.1488864, -0.218629, 1, 0, 0, 1, 1,
-0.8774909, 0.6574466, -0.8472602, 1, 0, 0, 1, 1,
-0.874514, -0.4049062, -2.765786, 0, 0, 0, 1, 1,
-0.8724788, 1.022146, 0.7623188, 0, 0, 0, 1, 1,
-0.8646965, 0.9353036, -0.9626943, 0, 0, 0, 1, 1,
-0.8623621, -1.016483, -2.866445, 0, 0, 0, 1, 1,
-0.8574147, 0.4033658, -0.9355589, 0, 0, 0, 1, 1,
-0.8530419, -0.3791376, -2.00435, 0, 0, 0, 1, 1,
-0.8513469, 0.08276416, -1.65409, 0, 0, 0, 1, 1,
-0.8378853, 1.779352, -0.4266963, 1, 1, 1, 1, 1,
-0.8370373, 1.638548, 0.3542581, 1, 1, 1, 1, 1,
-0.8359267, -0.3901075, -1.319895, 1, 1, 1, 1, 1,
-0.8308984, 0.1530803, -1.94927, 1, 1, 1, 1, 1,
-0.8302569, -1.582814, -5.283748, 1, 1, 1, 1, 1,
-0.8227726, 0.4862456, -0.8585823, 1, 1, 1, 1, 1,
-0.8225277, 1.761865, -3.080053, 1, 1, 1, 1, 1,
-0.8134829, 2.838238, 0.9972268, 1, 1, 1, 1, 1,
-0.8115213, -0.05070025, 0.4529554, 1, 1, 1, 1, 1,
-0.8094448, 1.125557, -1.820155, 1, 1, 1, 1, 1,
-0.805061, -0.1549834, -0.5978274, 1, 1, 1, 1, 1,
-0.8000357, 0.525723, -0.192042, 1, 1, 1, 1, 1,
-0.7975527, 0.05406899, -1.36116, 1, 1, 1, 1, 1,
-0.7907541, -1.318807, -1.673043, 1, 1, 1, 1, 1,
-0.7888875, -1.987144, -4.63284, 1, 1, 1, 1, 1,
-0.7837301, -0.2712599, -1.10939, 0, 0, 1, 1, 1,
-0.7821234, -0.3386478, -2.445696, 1, 0, 0, 1, 1,
-0.7752966, 0.5543579, -0.7068293, 1, 0, 0, 1, 1,
-0.7697999, 0.7259357, -1.631747, 1, 0, 0, 1, 1,
-0.769764, 1.252113, -0.7046505, 1, 0, 0, 1, 1,
-0.766748, 0.3612251, -0.1629334, 1, 0, 0, 1, 1,
-0.7657782, -0.3432057, -2.060757, 0, 0, 0, 1, 1,
-0.7653954, 0.2253409, 0.4499981, 0, 0, 0, 1, 1,
-0.7650673, -0.6773742, -2.53212, 0, 0, 0, 1, 1,
-0.7483889, 0.1109033, -1.74919, 0, 0, 0, 1, 1,
-0.7388975, 1.723465, -0.6966511, 0, 0, 0, 1, 1,
-0.7362255, -1.071835, -0.2823839, 0, 0, 0, 1, 1,
-0.7324887, 0.1043473, -2.198697, 0, 0, 0, 1, 1,
-0.7260641, 0.5144149, -0.9940348, 1, 1, 1, 1, 1,
-0.7240152, 0.1945242, -1.053881, 1, 1, 1, 1, 1,
-0.7238919, -0.08633071, -2.773743, 1, 1, 1, 1, 1,
-0.7164354, -0.5399582, -1.940674, 1, 1, 1, 1, 1,
-0.7111534, 0.1178346, -1.812896, 1, 1, 1, 1, 1,
-0.707698, -1.251701, -3.54067, 1, 1, 1, 1, 1,
-0.7070812, -1.158664, -2.875082, 1, 1, 1, 1, 1,
-0.706595, -0.6429112, -2.287297, 1, 1, 1, 1, 1,
-0.7064622, -0.9515775, -2.690692, 1, 1, 1, 1, 1,
-0.7035351, 0.2360051, -2.340752, 1, 1, 1, 1, 1,
-0.699939, 0.8538998, -0.7263057, 1, 1, 1, 1, 1,
-0.6988586, 1.285048, -1.277196, 1, 1, 1, 1, 1,
-0.6972113, 0.2212507, -4.354233, 1, 1, 1, 1, 1,
-0.6960035, 1.388674, -0.2020301, 1, 1, 1, 1, 1,
-0.6949544, -0.5106802, -1.238058, 1, 1, 1, 1, 1,
-0.6925619, 1.415565, -2.394185, 0, 0, 1, 1, 1,
-0.691449, -1.242354, -2.037795, 1, 0, 0, 1, 1,
-0.6875893, 0.01076949, -0.4451793, 1, 0, 0, 1, 1,
-0.6829418, 1.627121, 0.9322197, 1, 0, 0, 1, 1,
-0.6826692, 1.269317, -1.779054, 1, 0, 0, 1, 1,
-0.6803839, 0.7118407, -0.1491124, 1, 0, 0, 1, 1,
-0.6762421, 1.321145, -0.3256106, 0, 0, 0, 1, 1,
-0.6709211, 1.215641, -2.926953, 0, 0, 0, 1, 1,
-0.6693051, -1.174421, -3.008846, 0, 0, 0, 1, 1,
-0.6687483, -0.8675042, -1.8275, 0, 0, 0, 1, 1,
-0.6681716, -1.628838, -4.409309, 0, 0, 0, 1, 1,
-0.6655089, 0.9415771, -2.258248, 0, 0, 0, 1, 1,
-0.6624944, -1.030741, -2.252591, 0, 0, 0, 1, 1,
-0.6578597, 0.08847101, -0.3822472, 1, 1, 1, 1, 1,
-0.6544665, -0.6634934, -3.899912, 1, 1, 1, 1, 1,
-0.6530858, 0.1060899, -0.1013372, 1, 1, 1, 1, 1,
-0.6529613, 0.8632622, -2.238814, 1, 1, 1, 1, 1,
-0.6500806, 0.4544539, -1.542158, 1, 1, 1, 1, 1,
-0.6414015, -1.562788, -1.960467, 1, 1, 1, 1, 1,
-0.6374253, 0.7337775, 0.6124542, 1, 1, 1, 1, 1,
-0.6319925, -1.969623, -5.059176, 1, 1, 1, 1, 1,
-0.6281208, 1.588103, 1.444716, 1, 1, 1, 1, 1,
-0.625276, -0.4189357, -0.7355407, 1, 1, 1, 1, 1,
-0.6244164, 0.6336973, -1.805366, 1, 1, 1, 1, 1,
-0.6236787, 0.6488133, -2.050865, 1, 1, 1, 1, 1,
-0.6200043, -0.009445546, -0.7506992, 1, 1, 1, 1, 1,
-0.6132721, -1.546025, -3.447798, 1, 1, 1, 1, 1,
-0.6111888, 0.779681, -1.911357, 1, 1, 1, 1, 1,
-0.6100967, 0.1900269, -1.113017, 0, 0, 1, 1, 1,
-0.6076892, 0.0463317, -3.127295, 1, 0, 0, 1, 1,
-0.60399, -0.4346981, -2.62948, 1, 0, 0, 1, 1,
-0.5993065, -0.2449887, -1.978933, 1, 0, 0, 1, 1,
-0.5959245, -0.6268072, -1.439612, 1, 0, 0, 1, 1,
-0.5894762, 0.7349391, -0.9346116, 1, 0, 0, 1, 1,
-0.5887758, 0.6754017, -0.07377365, 0, 0, 0, 1, 1,
-0.5884252, -0.07952322, -0.2984392, 0, 0, 0, 1, 1,
-0.5784891, 0.393852, -0.8917593, 0, 0, 0, 1, 1,
-0.578178, 0.5685508, -0.5631731, 0, 0, 0, 1, 1,
-0.5771729, 0.09812833, -1.020006, 0, 0, 0, 1, 1,
-0.5743208, 0.03329645, -0.6710705, 0, 0, 0, 1, 1,
-0.571457, 0.06795006, 0.2339946, 0, 0, 0, 1, 1,
-0.5614284, -1.260174, -0.7008342, 1, 1, 1, 1, 1,
-0.5606652, 0.8132262, -0.5813403, 1, 1, 1, 1, 1,
-0.5569727, -1.134273, -2.568883, 1, 1, 1, 1, 1,
-0.5535702, 0.1711842, -1.949056, 1, 1, 1, 1, 1,
-0.5497314, 0.9867218, -0.7022142, 1, 1, 1, 1, 1,
-0.5494996, -0.09908713, -1.14238, 1, 1, 1, 1, 1,
-0.5400349, 0.4551261, -0.7736613, 1, 1, 1, 1, 1,
-0.5351921, -1.017439, -2.951845, 1, 1, 1, 1, 1,
-0.5301885, 0.09005243, -1.095472, 1, 1, 1, 1, 1,
-0.5301487, 0.9306126, 0.5451761, 1, 1, 1, 1, 1,
-0.5297031, 0.7524763, -0.2087636, 1, 1, 1, 1, 1,
-0.527262, 0.1582679, -0.4595642, 1, 1, 1, 1, 1,
-0.5262838, -0.644064, -2.404846, 1, 1, 1, 1, 1,
-0.5249681, 0.9751297, -1.043555, 1, 1, 1, 1, 1,
-0.5246991, 0.007783549, -2.838351, 1, 1, 1, 1, 1,
-0.5245282, 0.1868525, 0.5424457, 0, 0, 1, 1, 1,
-0.5227119, 0.3955307, -2.716695, 1, 0, 0, 1, 1,
-0.5225618, -0.07143253, -2.143631, 1, 0, 0, 1, 1,
-0.51976, 0.9652306, -0.6377812, 1, 0, 0, 1, 1,
-0.5154285, -0.7746031, -2.692899, 1, 0, 0, 1, 1,
-0.5153543, 0.9687638, 0.4960077, 1, 0, 0, 1, 1,
-0.5150741, 0.1791785, -2.530485, 0, 0, 0, 1, 1,
-0.5104558, -0.6789724, -4.465977, 0, 0, 0, 1, 1,
-0.5101629, -0.827801, -0.9284449, 0, 0, 0, 1, 1,
-0.5096307, 0.5106179, -0.2803278, 0, 0, 0, 1, 1,
-0.5094299, 1.11117, 0.5017985, 0, 0, 0, 1, 1,
-0.5080423, 1.841357, -0.527491, 0, 0, 0, 1, 1,
-0.5045424, 0.1868343, -1.846125, 0, 0, 0, 1, 1,
-0.4969917, -0.4831605, -1.532076, 1, 1, 1, 1, 1,
-0.4943744, -0.9973189, -2.875388, 1, 1, 1, 1, 1,
-0.4935091, 1.094809, 1.179783, 1, 1, 1, 1, 1,
-0.4930235, 0.7917669, -0.3134958, 1, 1, 1, 1, 1,
-0.490719, -0.6861502, -2.289099, 1, 1, 1, 1, 1,
-0.4902605, -1.358663, -0.1292329, 1, 1, 1, 1, 1,
-0.4892109, -0.05646512, -1.711896, 1, 1, 1, 1, 1,
-0.4802626, 1.984926, 0.8240116, 1, 1, 1, 1, 1,
-0.4790724, -0.8408943, -4.533924, 1, 1, 1, 1, 1,
-0.4696094, 0.4350826, 0.5349377, 1, 1, 1, 1, 1,
-0.46554, -0.5471781, -2.16487, 1, 1, 1, 1, 1,
-0.4629742, 1.301579, -1.128563, 1, 1, 1, 1, 1,
-0.4616999, -0.3920506, -0.6185234, 1, 1, 1, 1, 1,
-0.4608637, 0.202894, -1.895082, 1, 1, 1, 1, 1,
-0.4586754, 0.565528, -0.5931205, 1, 1, 1, 1, 1,
-0.4580765, -1.279492, -0.4185568, 0, 0, 1, 1, 1,
-0.4570621, 0.8401136, -0.5216147, 1, 0, 0, 1, 1,
-0.457033, 0.8493409, -2.179046, 1, 0, 0, 1, 1,
-0.4512461, 0.4003372, -0.2027164, 1, 0, 0, 1, 1,
-0.4497367, 0.5122821, -0.2948429, 1, 0, 0, 1, 1,
-0.4454684, 0.3750796, 0.3660267, 1, 0, 0, 1, 1,
-0.4450229, -0.8027025, -3.54425, 0, 0, 0, 1, 1,
-0.4437063, -0.8559393, -1.455829, 0, 0, 0, 1, 1,
-0.4383457, -0.1997517, -1.4396, 0, 0, 0, 1, 1,
-0.4209346, -0.3292585, -1.465067, 0, 0, 0, 1, 1,
-0.4195297, 0.5736562, -0.9474008, 0, 0, 0, 1, 1,
-0.4182543, -2.49904, -2.665273, 0, 0, 0, 1, 1,
-0.4178818, 0.3803254, -2.83883, 0, 0, 0, 1, 1,
-0.4157508, 0.1210084, 0.1149952, 1, 1, 1, 1, 1,
-0.4116159, 1.949205, 0.4725403, 1, 1, 1, 1, 1,
-0.4102085, -0.8533291, -2.994007, 1, 1, 1, 1, 1,
-0.4090502, -0.1344823, -1.890425, 1, 1, 1, 1, 1,
-0.4074267, -0.4181694, -2.279649, 1, 1, 1, 1, 1,
-0.406844, -0.3861177, -2.829108, 1, 1, 1, 1, 1,
-0.4061639, -0.8848191, -1.226943, 1, 1, 1, 1, 1,
-0.4059317, -0.5892855, -3.237289, 1, 1, 1, 1, 1,
-0.4056684, 1.115309, -0.6763303, 1, 1, 1, 1, 1,
-0.4034404, 0.4657485, 1.902683, 1, 1, 1, 1, 1,
-0.4030322, 0.5943142, 0.4387686, 1, 1, 1, 1, 1,
-0.4029721, -1.251336, -4.204705, 1, 1, 1, 1, 1,
-0.4012795, -1.382862, -3.055127, 1, 1, 1, 1, 1,
-0.4008677, 0.3637563, -1.652468, 1, 1, 1, 1, 1,
-0.3951196, -0.08165645, -2.402407, 1, 1, 1, 1, 1,
-0.3943796, -0.5416242, -3.496173, 0, 0, 1, 1, 1,
-0.3849173, -0.3539899, -4.280459, 1, 0, 0, 1, 1,
-0.3825709, 0.5125084, -2.506156, 1, 0, 0, 1, 1,
-0.3795278, 0.2926712, -0.0003745427, 1, 0, 0, 1, 1,
-0.378654, 2.219785, -1.096701, 1, 0, 0, 1, 1,
-0.3779817, 0.7928644, -1.940941, 1, 0, 0, 1, 1,
-0.374234, -1.515135, -2.841884, 0, 0, 0, 1, 1,
-0.3711517, -1.766135, -3.67309, 0, 0, 0, 1, 1,
-0.3708882, 0.5924144, -0.6561207, 0, 0, 0, 1, 1,
-0.3708068, 0.3572265, -0.6034877, 0, 0, 0, 1, 1,
-0.3696443, 1.058161, -0.7162939, 0, 0, 0, 1, 1,
-0.3685777, 1.75342, -0.8242682, 0, 0, 0, 1, 1,
-0.3683232, 1.432515, -0.01217704, 0, 0, 0, 1, 1,
-0.366116, -0.9971454, -1.465091, 1, 1, 1, 1, 1,
-0.3653803, -1.556846, -3.185016, 1, 1, 1, 1, 1,
-0.3643695, -1.267184, -2.638613, 1, 1, 1, 1, 1,
-0.3638643, 0.3758123, -0.271932, 1, 1, 1, 1, 1,
-0.3632513, -1.775903, -2.045028, 1, 1, 1, 1, 1,
-0.3601411, -0.4017139, -2.801523, 1, 1, 1, 1, 1,
-0.3595659, 0.073738, 0.8516166, 1, 1, 1, 1, 1,
-0.3545831, -0.9151666, -4.275918, 1, 1, 1, 1, 1,
-0.3544126, 0.3773609, -2.342581, 1, 1, 1, 1, 1,
-0.3540848, 0.1824606, -0.3353508, 1, 1, 1, 1, 1,
-0.3521199, 1.915784, -0.4891303, 1, 1, 1, 1, 1,
-0.3466864, -0.5191334, -2.508072, 1, 1, 1, 1, 1,
-0.345152, 0.3920319, -3.234372, 1, 1, 1, 1, 1,
-0.3435332, 0.4711356, -0.01511534, 1, 1, 1, 1, 1,
-0.3419267, 0.0743477, -1.288605, 1, 1, 1, 1, 1,
-0.3403325, -0.9496677, -2.156803, 0, 0, 1, 1, 1,
-0.3332575, 0.1392583, -1.824172, 1, 0, 0, 1, 1,
-0.3320674, 0.2638457, -0.5889517, 1, 0, 0, 1, 1,
-0.33019, 0.6705613, 0.06405293, 1, 0, 0, 1, 1,
-0.327881, 0.441319, 1.274249, 1, 0, 0, 1, 1,
-0.3252268, 1.36228, -0.9935777, 1, 0, 0, 1, 1,
-0.3231899, 1.513121, -0.5259972, 0, 0, 0, 1, 1,
-0.3225521, -0.6911876, -3.275595, 0, 0, 0, 1, 1,
-0.320889, -0.3808126, -2.539828, 0, 0, 0, 1, 1,
-0.3201744, 1.150675, 0.2214001, 0, 0, 0, 1, 1,
-0.3189283, -0.8475786, -5.014158, 0, 0, 0, 1, 1,
-0.3174242, -1.624855, -2.386992, 0, 0, 0, 1, 1,
-0.3121494, 0.7256755, -0.6382716, 0, 0, 0, 1, 1,
-0.3032148, 0.2637964, 0.3397077, 1, 1, 1, 1, 1,
-0.296023, 1.076489, 0.2213202, 1, 1, 1, 1, 1,
-0.2909965, -0.9811876, -3.472943, 1, 1, 1, 1, 1,
-0.290783, -1.275961, -1.062831, 1, 1, 1, 1, 1,
-0.2907656, 2.47602, -1.039035, 1, 1, 1, 1, 1,
-0.2867502, 0.3552204, -0.2071669, 1, 1, 1, 1, 1,
-0.2862697, 1.441886, 1.708643, 1, 1, 1, 1, 1,
-0.280321, 0.5422317, 1.340827, 1, 1, 1, 1, 1,
-0.2792059, 2.394497, -0.7788678, 1, 1, 1, 1, 1,
-0.2784846, 0.6681929, 0.0003045401, 1, 1, 1, 1, 1,
-0.2777301, 1.014896, 0.3874938, 1, 1, 1, 1, 1,
-0.2704691, 0.7034228, -0.4674999, 1, 1, 1, 1, 1,
-0.2676864, -2.041768, -2.491823, 1, 1, 1, 1, 1,
-0.2674376, 0.4590753, -1.723125, 1, 1, 1, 1, 1,
-0.2612984, 0.2483081, -0.3835241, 1, 1, 1, 1, 1,
-0.2604848, -0.6098444, -3.272475, 0, 0, 1, 1, 1,
-0.2567134, -0.1711931, -3.162295, 1, 0, 0, 1, 1,
-0.25268, -0.1595805, -2.573247, 1, 0, 0, 1, 1,
-0.2457293, -1.655881, -2.856495, 1, 0, 0, 1, 1,
-0.2425056, 0.7095304, 0.637114, 1, 0, 0, 1, 1,
-0.2328126, 0.1242526, -1.004519, 1, 0, 0, 1, 1,
-0.2326027, -0.697539, -3.463325, 0, 0, 0, 1, 1,
-0.2325279, 2.002304, -1.019774, 0, 0, 0, 1, 1,
-0.2309509, -0.03952216, -1.861589, 0, 0, 0, 1, 1,
-0.22589, -0.897747, -3.568882, 0, 0, 0, 1, 1,
-0.2228706, -0.354655, -2.407112, 0, 0, 0, 1, 1,
-0.2183509, 0.2292839, 0.3630979, 0, 0, 0, 1, 1,
-0.2164724, -0.4546921, -1.622591, 0, 0, 0, 1, 1,
-0.2151418, -0.6238871, -3.776742, 1, 1, 1, 1, 1,
-0.2139796, -1.23716, -2.377355, 1, 1, 1, 1, 1,
-0.2101928, -0.5997467, -4.222867, 1, 1, 1, 1, 1,
-0.206492, 1.297632, -0.366806, 1, 1, 1, 1, 1,
-0.2041862, 0.2259236, -0.771816, 1, 1, 1, 1, 1,
-0.2025755, -0.4550906, -2.654927, 1, 1, 1, 1, 1,
-0.2025144, 0.943446, 0.7356266, 1, 1, 1, 1, 1,
-0.1937707, -0.3280099, -0.6368207, 1, 1, 1, 1, 1,
-0.1935634, -0.9983563, -4.336328, 1, 1, 1, 1, 1,
-0.1914785, 0.1236409, -0.3555515, 1, 1, 1, 1, 1,
-0.1912223, 0.3877593, 0.08402678, 1, 1, 1, 1, 1,
-0.1903788, -0.1217262, -1.351828, 1, 1, 1, 1, 1,
-0.1865928, 1.058219, -0.92461, 1, 1, 1, 1, 1,
-0.1854659, 0.4634112, -0.1408131, 1, 1, 1, 1, 1,
-0.1794621, -0.2574798, -3.69333, 1, 1, 1, 1, 1,
-0.1789793, -0.8916485, -5.040814, 0, 0, 1, 1, 1,
-0.1757041, -1.246183, -3.057461, 1, 0, 0, 1, 1,
-0.1616236, 0.2977171, 0.487952, 1, 0, 0, 1, 1,
-0.1544636, 0.5507789, 0.05117027, 1, 0, 0, 1, 1,
-0.1490432, 1.496675, -0.1199581, 1, 0, 0, 1, 1,
-0.1480308, 0.9672482, -2.688802, 1, 0, 0, 1, 1,
-0.1458025, 0.7350497, 0.6485114, 0, 0, 0, 1, 1,
-0.1432477, -0.07252328, -1.898242, 0, 0, 0, 1, 1,
-0.1382818, 0.1654061, -0.3492399, 0, 0, 0, 1, 1,
-0.1342036, -1.310333, -1.042587, 0, 0, 0, 1, 1,
-0.134162, -2.977936, -2.911552, 0, 0, 0, 1, 1,
-0.1322292, -1.482434, -2.196822, 0, 0, 0, 1, 1,
-0.1294313, -0.09940182, 0.1056411, 0, 0, 0, 1, 1,
-0.1279203, 0.3485206, 0.3222253, 1, 1, 1, 1, 1,
-0.1275274, 1.628493, -0.3816226, 1, 1, 1, 1, 1,
-0.1228706, 0.2824517, 0.8996156, 1, 1, 1, 1, 1,
-0.1174941, 0.7397489, -0.1078249, 1, 1, 1, 1, 1,
-0.1135986, -0.2482071, -3.343533, 1, 1, 1, 1, 1,
-0.1125499, 0.7648509, 0.4200789, 1, 1, 1, 1, 1,
-0.1117033, 3.301614, 1.841636, 1, 1, 1, 1, 1,
-0.1108023, 1.158046, 2.061338, 1, 1, 1, 1, 1,
-0.1084337, 0.9625483, -0.9959706, 1, 1, 1, 1, 1,
-0.1081579, -0.2617514, -2.540414, 1, 1, 1, 1, 1,
-0.1078487, -0.8232377, -1.467367, 1, 1, 1, 1, 1,
-0.1038914, 0.030887, -0.8874738, 1, 1, 1, 1, 1,
-0.1028571, -1.467223, -3.554773, 1, 1, 1, 1, 1,
-0.09411956, -3.129142, -3.149131, 1, 1, 1, 1, 1,
-0.09342586, -0.3114847, -2.370328, 1, 1, 1, 1, 1,
-0.09043959, -0.4699428, -3.267462, 0, 0, 1, 1, 1,
-0.08975017, -1.217854, -3.027704, 1, 0, 0, 1, 1,
-0.08704051, 0.06430244, -1.387069, 1, 0, 0, 1, 1,
-0.08643404, -0.3674392, -2.347423, 1, 0, 0, 1, 1,
-0.07853139, 0.4112604, -1.085109, 1, 0, 0, 1, 1,
-0.07742381, 0.4578946, 0.6155818, 1, 0, 0, 1, 1,
-0.07624866, 1.274676, -0.1469181, 0, 0, 0, 1, 1,
-0.07118256, 0.689955, 2.211069, 0, 0, 0, 1, 1,
-0.07065389, -1.057987, -2.860997, 0, 0, 0, 1, 1,
-0.06833842, 1.164903, -0.3641081, 0, 0, 0, 1, 1,
-0.06817345, -1.631759, -3.837166, 0, 0, 0, 1, 1,
-0.06754097, 1.94685, -1.009178, 0, 0, 0, 1, 1,
-0.06632748, -0.4335267, -4.494303, 0, 0, 0, 1, 1,
-0.0645119, -1.544688, -3.80366, 1, 1, 1, 1, 1,
-0.06340903, -0.1976762, -2.539557, 1, 1, 1, 1, 1,
-0.05861737, -1.854575, -3.492099, 1, 1, 1, 1, 1,
-0.05509847, 1.01801, 0.04645903, 1, 1, 1, 1, 1,
-0.05440622, 1.768356, -0.6782951, 1, 1, 1, 1, 1,
-0.05383788, 0.8392581, 0.9113092, 1, 1, 1, 1, 1,
-0.05157476, 0.4772718, -1.708796, 1, 1, 1, 1, 1,
-0.04855584, 0.7381303, -0.1219403, 1, 1, 1, 1, 1,
-0.04655544, -0.003493612, -1.396693, 1, 1, 1, 1, 1,
-0.04558132, -1.314456, -4.305787, 1, 1, 1, 1, 1,
-0.04363535, 1.629069, 0.8193315, 1, 1, 1, 1, 1,
-0.04197272, 1.431216, -1.355386, 1, 1, 1, 1, 1,
-0.04100796, 0.1395883, 1.774703, 1, 1, 1, 1, 1,
-0.04062348, -1.408564, -3.535113, 1, 1, 1, 1, 1,
-0.03632939, -1.414357, -4.851268, 1, 1, 1, 1, 1,
-0.03598278, -1.693715, -3.893214, 0, 0, 1, 1, 1,
-0.03157565, 2.893818, -2.420876, 1, 0, 0, 1, 1,
-0.02459064, 0.2307395, 0.01400974, 1, 0, 0, 1, 1,
-0.02447071, 0.0553654, -1.63817, 1, 0, 0, 1, 1,
-0.02328657, 1.930412, -0.2905383, 1, 0, 0, 1, 1,
-0.02268915, -0.07705664, -1.562101, 1, 0, 0, 1, 1,
-0.02241478, 2.450159, 1.119221, 0, 0, 0, 1, 1,
-0.02095594, 0.6934873, -0.6293613, 0, 0, 0, 1, 1,
-0.01585256, 0.3993171, -0.732316, 0, 0, 0, 1, 1,
-0.0144586, 0.1120969, 2.534606, 0, 0, 0, 1, 1,
-0.01247433, -2.009348, -3.493744, 0, 0, 0, 1, 1,
-0.00531589, 0.9499071, -0.6379552, 0, 0, 0, 1, 1,
-0.003774717, -0.5503739, -2.900213, 0, 0, 0, 1, 1,
-0.002856416, -0.9889556, -1.268906, 1, 1, 1, 1, 1,
-0.001755509, -0.9755586, -3.319905, 1, 1, 1, 1, 1,
0.0002631273, 1.519536, 1.258507, 1, 1, 1, 1, 1,
0.006068416, 0.3655534, -0.8983701, 1, 1, 1, 1, 1,
0.006963403, -0.6572294, 3.051487, 1, 1, 1, 1, 1,
0.008092439, 0.7149174, -2.293095, 1, 1, 1, 1, 1,
0.008289251, 0.1093857, -1.82851, 1, 1, 1, 1, 1,
0.008582493, -0.8775321, 3.694735, 1, 1, 1, 1, 1,
0.01250951, -0.129526, 3.350479, 1, 1, 1, 1, 1,
0.0199667, 1.200557, 1.184826, 1, 1, 1, 1, 1,
0.02097706, 1.576753, -0.1789952, 1, 1, 1, 1, 1,
0.03072366, 1.146116, -0.9710561, 1, 1, 1, 1, 1,
0.03392971, -0.2149657, 5.714884, 1, 1, 1, 1, 1,
0.03452023, -0.7604219, 4.370432, 1, 1, 1, 1, 1,
0.03863137, 0.1243881, 0.5892293, 1, 1, 1, 1, 1,
0.0447894, -2.064588, 3.018427, 0, 0, 1, 1, 1,
0.04581964, -1.670961, 4.661217, 1, 0, 0, 1, 1,
0.04595573, -0.06326056, 2.534616, 1, 0, 0, 1, 1,
0.04723018, -0.9265438, 4.54028, 1, 0, 0, 1, 1,
0.05039491, 0.1370137, 1.027146, 1, 0, 0, 1, 1,
0.05451849, -1.282543, 3.069438, 1, 0, 0, 1, 1,
0.05993231, 2.19071, -0.9411463, 0, 0, 0, 1, 1,
0.06145729, 2.338063, -0.3516369, 0, 0, 0, 1, 1,
0.06190153, 0.2416376, -1.940454, 0, 0, 0, 1, 1,
0.06378672, 0.8610438, 0.4434102, 0, 0, 0, 1, 1,
0.06525541, 0.5231347, -0.6455264, 0, 0, 0, 1, 1,
0.06947619, -0.2805169, 2.092235, 0, 0, 0, 1, 1,
0.07691567, 0.4277683, 1.99535, 0, 0, 0, 1, 1,
0.07939995, 1.260767, -0.3272699, 1, 1, 1, 1, 1,
0.08013074, -0.8105751, 3.48211, 1, 1, 1, 1, 1,
0.08063545, 1.86016, 0.06453859, 1, 1, 1, 1, 1,
0.08227201, 0.1137669, 2.053557, 1, 1, 1, 1, 1,
0.08305006, 0.5416354, 0.8218434, 1, 1, 1, 1, 1,
0.08495723, -0.7065615, 3.388017, 1, 1, 1, 1, 1,
0.08656745, -0.2570486, 2.988036, 1, 1, 1, 1, 1,
0.08680218, 0.697222, -0.123894, 1, 1, 1, 1, 1,
0.08805288, 1.076615, -2.158562, 1, 1, 1, 1, 1,
0.09125523, 0.04934607, 2.346179, 1, 1, 1, 1, 1,
0.09132305, 1.057938, 0.9911572, 1, 1, 1, 1, 1,
0.09278262, -0.9836753, 4.093666, 1, 1, 1, 1, 1,
0.09422942, -1.364966, 2.663174, 1, 1, 1, 1, 1,
0.09781489, -0.9016263, 2.156834, 1, 1, 1, 1, 1,
0.09931327, 1.417044, 0.7795994, 1, 1, 1, 1, 1,
0.1077402, -0.1133405, 3.080847, 0, 0, 1, 1, 1,
0.1093769, 1.348076, 1.396783, 1, 0, 0, 1, 1,
0.1122619, -0.7631142, 3.547853, 1, 0, 0, 1, 1,
0.1123429, 0.6889846, 1.038695, 1, 0, 0, 1, 1,
0.1130646, -0.4087514, 3.283667, 1, 0, 0, 1, 1,
0.119677, 0.1261179, 2.9099, 1, 0, 0, 1, 1,
0.1221806, 0.0631481, -0.2274028, 0, 0, 0, 1, 1,
0.1257826, -0.1917186, 1.683531, 0, 0, 0, 1, 1,
0.1262606, -0.3297876, 2.5099, 0, 0, 0, 1, 1,
0.1304933, -2.066129, 2.813648, 0, 0, 0, 1, 1,
0.1305832, 0.2517401, 1.608118, 0, 0, 0, 1, 1,
0.1327875, -0.507339, 2.068432, 0, 0, 0, 1, 1,
0.1417895, -0.1332033, 2.335369, 0, 0, 0, 1, 1,
0.1438484, 0.2002553, -0.1021284, 1, 1, 1, 1, 1,
0.1452849, 0.3543685, -0.3663986, 1, 1, 1, 1, 1,
0.1495456, -1.1638, 2.408691, 1, 1, 1, 1, 1,
0.1502759, -0.6826364, 2.395441, 1, 1, 1, 1, 1,
0.1506968, 0.4683445, 0.6990227, 1, 1, 1, 1, 1,
0.1510621, -0.2364989, 3.277267, 1, 1, 1, 1, 1,
0.154975, -1.351545, 3.777456, 1, 1, 1, 1, 1,
0.1579601, -0.1863852, 2.470903, 1, 1, 1, 1, 1,
0.1607539, -0.15684, 3.276392, 1, 1, 1, 1, 1,
0.1669985, 0.273023, 0.4440454, 1, 1, 1, 1, 1,
0.1686369, 0.00466646, 0.04533368, 1, 1, 1, 1, 1,
0.1712883, -0.9694158, 1.892302, 1, 1, 1, 1, 1,
0.1714051, -0.5757002, 2.924566, 1, 1, 1, 1, 1,
0.1721506, -0.3616961, 2.437922, 1, 1, 1, 1, 1,
0.1746484, -0.3079306, 3.312152, 1, 1, 1, 1, 1,
0.1809873, 1.032099, 0.1153583, 0, 0, 1, 1, 1,
0.1816339, 1.316428, 1.030247, 1, 0, 0, 1, 1,
0.1831267, -0.08034964, 1.097677, 1, 0, 0, 1, 1,
0.1834068, 0.2729591, -0.4336878, 1, 0, 0, 1, 1,
0.1894767, -0.9491014, 2.275043, 1, 0, 0, 1, 1,
0.1991882, 0.6362591, 1.674357, 1, 0, 0, 1, 1,
0.2005344, -1.209409, 1.752075, 0, 0, 0, 1, 1,
0.201493, 0.6827298, 0.1604727, 0, 0, 0, 1, 1,
0.202473, 0.4681146, 0.5570083, 0, 0, 0, 1, 1,
0.2033065, -0.7102171, 2.430826, 0, 0, 0, 1, 1,
0.2062775, -0.6876804, 2.033503, 0, 0, 0, 1, 1,
0.2069912, -0.1261871, 0.2888663, 0, 0, 0, 1, 1,
0.2095442, 0.1629924, -0.03888978, 0, 0, 0, 1, 1,
0.2152123, -0.06631782, 2.1626, 1, 1, 1, 1, 1,
0.2185151, -1.37324, 3.078932, 1, 1, 1, 1, 1,
0.2217984, 0.2024484, 0.08991241, 1, 1, 1, 1, 1,
0.226266, 0.2537853, -0.02690151, 1, 1, 1, 1, 1,
0.2268531, -0.1869653, 1.123112, 1, 1, 1, 1, 1,
0.2298158, -0.9381641, 2.221824, 1, 1, 1, 1, 1,
0.2326269, 0.4667401, -0.05576665, 1, 1, 1, 1, 1,
0.2337339, -0.9510252, 4.269526, 1, 1, 1, 1, 1,
0.2411267, 0.4254117, -0.3239225, 1, 1, 1, 1, 1,
0.2416571, 1.388895, 0.6716739, 1, 1, 1, 1, 1,
0.2526196, -0.7274494, 3.072666, 1, 1, 1, 1, 1,
0.2547472, -0.9571533, 1.910616, 1, 1, 1, 1, 1,
0.2560285, 2.55353, -0.2645367, 1, 1, 1, 1, 1,
0.2578972, 0.2116889, 0.05344925, 1, 1, 1, 1, 1,
0.2620972, -0.06032183, 1.006731, 1, 1, 1, 1, 1,
0.2627502, -0.9290335, 5.000521, 0, 0, 1, 1, 1,
0.2720465, -0.4366644, 2.489955, 1, 0, 0, 1, 1,
0.2756351, 2.220955, 0.4764691, 1, 0, 0, 1, 1,
0.2762522, 0.294907, 0.319898, 1, 0, 0, 1, 1,
0.2778394, -0.2348707, 0.4781234, 1, 0, 0, 1, 1,
0.2820878, 0.008443083, 2.713499, 1, 0, 0, 1, 1,
0.2836535, 0.440446, -1.13829, 0, 0, 0, 1, 1,
0.2875951, 2.670018, 1.056351, 0, 0, 0, 1, 1,
0.2896649, 0.9292831, -0.9828161, 0, 0, 0, 1, 1,
0.2905413, 1.916453, -0.3949469, 0, 0, 0, 1, 1,
0.2908523, 1.02015, -0.1326113, 0, 0, 0, 1, 1,
0.2948008, -0.4343443, 2.166105, 0, 0, 0, 1, 1,
0.2969516, -0.1107266, 1.172961, 0, 0, 0, 1, 1,
0.3002219, -1.082173, 3.943134, 1, 1, 1, 1, 1,
0.3061856, -0.8755517, 2.929575, 1, 1, 1, 1, 1,
0.3104801, 0.09879275, 0.4903475, 1, 1, 1, 1, 1,
0.3108846, -1.001087, 1.751443, 1, 1, 1, 1, 1,
0.3155628, 0.4694225, -1.337437, 1, 1, 1, 1, 1,
0.3240213, 1.723725, 1.527617, 1, 1, 1, 1, 1,
0.3260304, -0.592354, 2.243376, 1, 1, 1, 1, 1,
0.3277047, 0.4833409, 1.621078, 1, 1, 1, 1, 1,
0.328349, 0.06278756, 1.512332, 1, 1, 1, 1, 1,
0.330295, 1.758214, 0.4012236, 1, 1, 1, 1, 1,
0.3327835, 0.1264527, 1.896333, 1, 1, 1, 1, 1,
0.3329735, -1.391704, 3.276868, 1, 1, 1, 1, 1,
0.3362019, -0.004437875, 0.5591624, 1, 1, 1, 1, 1,
0.3366831, -0.1465985, 1.497492, 1, 1, 1, 1, 1,
0.3374489, 0.8018114, -0.2653176, 1, 1, 1, 1, 1,
0.3395124, 1.136679, 0.739648, 0, 0, 1, 1, 1,
0.3406768, 0.4596366, -0.1570115, 1, 0, 0, 1, 1,
0.3422338, 0.7870397, -0.8418125, 1, 0, 0, 1, 1,
0.342343, 1.210387, 0.361569, 1, 0, 0, 1, 1,
0.3492635, -0.5986992, 3.783416, 1, 0, 0, 1, 1,
0.3506818, 0.9941779, -0.009908914, 1, 0, 0, 1, 1,
0.3511572, 1.06133, 0.4715658, 0, 0, 0, 1, 1,
0.3533931, -0.5210759, 2.102988, 0, 0, 0, 1, 1,
0.3536522, 0.2302241, 0.2277913, 0, 0, 0, 1, 1,
0.3558113, -0.6607502, 2.000501, 0, 0, 0, 1, 1,
0.357633, -0.8922844, 3.086824, 0, 0, 0, 1, 1,
0.3588677, 0.6515453, -0.3200324, 0, 0, 0, 1, 1,
0.3594913, 0.786521, -0.006426981, 0, 0, 0, 1, 1,
0.3624851, -1.196631, 2.774819, 1, 1, 1, 1, 1,
0.3667954, 0.2752587, 2.155862, 1, 1, 1, 1, 1,
0.3675377, -0.5138817, 3.09743, 1, 1, 1, 1, 1,
0.3697946, -0.5091649, 3.590551, 1, 1, 1, 1, 1,
0.3698412, -0.4378939, 2.407525, 1, 1, 1, 1, 1,
0.3753122, 1.877135, 0.1022935, 1, 1, 1, 1, 1,
0.376389, -1.239191, 0.504929, 1, 1, 1, 1, 1,
0.3804311, -0.8935445, 3.299429, 1, 1, 1, 1, 1,
0.3805982, 1.691426, -0.9164974, 1, 1, 1, 1, 1,
0.3884888, 0.6526648, 0.1031909, 1, 1, 1, 1, 1,
0.3885042, -1.641734, 2.966775, 1, 1, 1, 1, 1,
0.3889551, -0.1044395, 1.664683, 1, 1, 1, 1, 1,
0.3910533, -1.662156, 2.749289, 1, 1, 1, 1, 1,
0.3953082, -1.656744, 2.771009, 1, 1, 1, 1, 1,
0.3991932, 0.5216537, -0.6654129, 1, 1, 1, 1, 1,
0.3994933, 0.3283391, -1.338248, 0, 0, 1, 1, 1,
0.4021169, -1.869853, 2.524891, 1, 0, 0, 1, 1,
0.4035791, -1.079251, 2.660621, 1, 0, 0, 1, 1,
0.4047489, 0.6423296, -0.4692015, 1, 0, 0, 1, 1,
0.407043, -1.157101, 1.624576, 1, 0, 0, 1, 1,
0.4093934, -0.8765688, 3.380887, 1, 0, 0, 1, 1,
0.409456, 1.478415, -0.6125031, 0, 0, 0, 1, 1,
0.4106557, 0.5695773, 0.08166762, 0, 0, 0, 1, 1,
0.41234, -0.963361, 3.261758, 0, 0, 0, 1, 1,
0.4126335, 0.559283, 2.36736, 0, 0, 0, 1, 1,
0.4129404, -0.7811824, 2.671016, 0, 0, 0, 1, 1,
0.4161301, 1.023021, -0.5241937, 0, 0, 0, 1, 1,
0.4186332, 1.47194, -1.005183, 0, 0, 0, 1, 1,
0.4253042, 0.749844, 0.2938534, 1, 1, 1, 1, 1,
0.4265364, 1.11071, -2.344656, 1, 1, 1, 1, 1,
0.4274515, -0.6512483, 3.679851, 1, 1, 1, 1, 1,
0.4292903, -0.898583, 3.007816, 1, 1, 1, 1, 1,
0.4318764, 0.1024316, 2.33828, 1, 1, 1, 1, 1,
0.4330587, 0.9318283, -0.5464324, 1, 1, 1, 1, 1,
0.4343307, 0.9918193, 0.7636029, 1, 1, 1, 1, 1,
0.4410484, -1.044098, 4.63866, 1, 1, 1, 1, 1,
0.4546341, 0.5836214, 1.799492, 1, 1, 1, 1, 1,
0.4552266, -0.5746348, 2.604811, 1, 1, 1, 1, 1,
0.4575386, 0.6702175, 0.2756001, 1, 1, 1, 1, 1,
0.4580758, -2.131068, 3.489539, 1, 1, 1, 1, 1,
0.4615156, 0.2798491, 0.2687757, 1, 1, 1, 1, 1,
0.4661576, 1.16208, 1.65288, 1, 1, 1, 1, 1,
0.4674135, -0.2491814, 2.926494, 1, 1, 1, 1, 1,
0.4707534, 1.00115, -0.2308204, 0, 0, 1, 1, 1,
0.4708228, -0.1791266, 2.282579, 1, 0, 0, 1, 1,
0.4725707, -1.751064, 1.550117, 1, 0, 0, 1, 1,
0.4741748, -0.8129809, 2.457487, 1, 0, 0, 1, 1,
0.4764847, 0.1170221, 2.166235, 1, 0, 0, 1, 1,
0.478091, -1.544423, 3.497913, 1, 0, 0, 1, 1,
0.4797334, 0.8867317, -0.5766135, 0, 0, 0, 1, 1,
0.480101, 0.62715, 2.07996, 0, 0, 0, 1, 1,
0.4814114, -2.863245, 3.129006, 0, 0, 0, 1, 1,
0.4826369, -0.3085587, 3.161862, 0, 0, 0, 1, 1,
0.4864896, -1.900802, 3.426072, 0, 0, 0, 1, 1,
0.4865625, -1.184433, 1.853554, 0, 0, 0, 1, 1,
0.4885599, -1.292967, 2.961674, 0, 0, 0, 1, 1,
0.4927321, -0.5613377, 2.785892, 1, 1, 1, 1, 1,
0.493024, 0.3086148, 0.8144255, 1, 1, 1, 1, 1,
0.493866, 0.4252148, 1.135692, 1, 1, 1, 1, 1,
0.4980231, 0.4895314, 1.644794, 1, 1, 1, 1, 1,
0.4986523, -0.1145023, 2.63761, 1, 1, 1, 1, 1,
0.5059386, -0.1404027, 1.69429, 1, 1, 1, 1, 1,
0.5107517, 1.775469, -1.252017, 1, 1, 1, 1, 1,
0.5136755, 0.9867028, 0.1570782, 1, 1, 1, 1, 1,
0.514881, 0.9763248, 1.970503, 1, 1, 1, 1, 1,
0.5149247, 1.220481, -0.7047555, 1, 1, 1, 1, 1,
0.5164797, -0.8170847, 1.687874, 1, 1, 1, 1, 1,
0.5179359, -0.1905333, 2.877301, 1, 1, 1, 1, 1,
0.5206281, -0.6578249, 1.415799, 1, 1, 1, 1, 1,
0.5229667, 0.5158374, 1.921978, 1, 1, 1, 1, 1,
0.5242854, -0.5619512, 3.082073, 1, 1, 1, 1, 1,
0.5458287, 0.1463416, -0.1738919, 0, 0, 1, 1, 1,
0.5486124, 1.769568, 0.6331826, 1, 0, 0, 1, 1,
0.5512425, -0.2481788, 1.809441, 1, 0, 0, 1, 1,
0.5532206, -0.4630073, 2.911972, 1, 0, 0, 1, 1,
0.5534537, 1.554938, 1.642527, 1, 0, 0, 1, 1,
0.5539618, 1.915475, 1.641491, 1, 0, 0, 1, 1,
0.5576627, -0.4087899, -0.2213452, 0, 0, 0, 1, 1,
0.5580239, -0.3772647, 1.543692, 0, 0, 0, 1, 1,
0.5605359, -0.5217509, 3.193495, 0, 0, 0, 1, 1,
0.5618765, 0.05542329, 2.1582, 0, 0, 0, 1, 1,
0.562406, -1.081491, 3.251701, 0, 0, 0, 1, 1,
0.5630098, 0.1759842, 2.059144, 0, 0, 0, 1, 1,
0.5634198, -0.02978229, 1.623565, 0, 0, 0, 1, 1,
0.5655271, -0.3900317, 2.241641, 1, 1, 1, 1, 1,
0.5673574, 2.222464, 1.762122, 1, 1, 1, 1, 1,
0.5718296, 0.3423383, 1.123369, 1, 1, 1, 1, 1,
0.5740803, 0.6538039, 0.6053486, 1, 1, 1, 1, 1,
0.5779944, 0.9083173, -0.7195359, 1, 1, 1, 1, 1,
0.5889233, -1.280273, 3.456801, 1, 1, 1, 1, 1,
0.5889547, -0.9222288, 2.593266, 1, 1, 1, 1, 1,
0.5895019, -0.1639958, 1.73854, 1, 1, 1, 1, 1,
0.593322, 1.981393, 1.642166, 1, 1, 1, 1, 1,
0.602023, 0.09278081, -0.08625348, 1, 1, 1, 1, 1,
0.6028517, 0.7333921, 0.07992782, 1, 1, 1, 1, 1,
0.6035364, 1.938801, -2.15495, 1, 1, 1, 1, 1,
0.6048627, 0.6619938, 0.2202967, 1, 1, 1, 1, 1,
0.6060949, 0.2242321, 0.3401074, 1, 1, 1, 1, 1,
0.6069288, -0.6745195, 2.180015, 1, 1, 1, 1, 1,
0.6076156, -0.03372652, 2.299255, 0, 0, 1, 1, 1,
0.6176758, -1.029723, 4.401429, 1, 0, 0, 1, 1,
0.6196094, 2.060349, 0.02162612, 1, 0, 0, 1, 1,
0.6225997, 2.253997, -0.6494709, 1, 0, 0, 1, 1,
0.6229535, -0.3894994, 0.1664575, 1, 0, 0, 1, 1,
0.6248255, 0.1094671, 2.329393, 1, 0, 0, 1, 1,
0.6263782, -1.875969, 1.571459, 0, 0, 0, 1, 1,
0.6293583, 0.333874, 1.865272, 0, 0, 0, 1, 1,
0.6323692, 0.8499431, -0.8255072, 0, 0, 0, 1, 1,
0.6339654, -2.025964, 1.812749, 0, 0, 0, 1, 1,
0.6360963, 0.9758093, 0.7615945, 0, 0, 0, 1, 1,
0.637004, 0.1217759, 2.255358, 0, 0, 0, 1, 1,
0.6373616, -0.5072001, 2.477088, 0, 0, 0, 1, 1,
0.6482038, -0.584964, 3.497464, 1, 1, 1, 1, 1,
0.6496025, -0.0009298529, 0.651292, 1, 1, 1, 1, 1,
0.6506429, -0.963782, 3.264349, 1, 1, 1, 1, 1,
0.6645753, 1.675908, -0.01748416, 1, 1, 1, 1, 1,
0.6657375, -0.8529479, 2.127608, 1, 1, 1, 1, 1,
0.6663359, 1.229294, 0.7285816, 1, 1, 1, 1, 1,
0.6713638, -0.05528249, 2.13957, 1, 1, 1, 1, 1,
0.6798278, -1.077016, 3.270632, 1, 1, 1, 1, 1,
0.6806767, -1.784877, 3.039248, 1, 1, 1, 1, 1,
0.681328, -0.62738, 2.641377, 1, 1, 1, 1, 1,
0.6814001, 0.4552504, 0.4988253, 1, 1, 1, 1, 1,
0.6827964, 0.4890587, 0.4040335, 1, 1, 1, 1, 1,
0.6827968, 1.450293, 0.71092, 1, 1, 1, 1, 1,
0.683444, -1.312775, 2.655551, 1, 1, 1, 1, 1,
0.6857467, 0.9085958, -0.7968654, 1, 1, 1, 1, 1,
0.6876548, -0.2132429, 2.070366, 0, 0, 1, 1, 1,
0.6882411, -0.6582308, 1.220292, 1, 0, 0, 1, 1,
0.6952319, 0.1206045, 0.9021532, 1, 0, 0, 1, 1,
0.6978289, 0.3711074, 1.666387, 1, 0, 0, 1, 1,
0.7020916, -0.2576519, 2.561565, 1, 0, 0, 1, 1,
0.7079661, -0.1842552, 1.422296, 1, 0, 0, 1, 1,
0.7139593, 1.218437, 0.1154997, 0, 0, 0, 1, 1,
0.7148725, -1.78077, 2.163529, 0, 0, 0, 1, 1,
0.7275122, 0.7206472, -0.5707841, 0, 0, 0, 1, 1,
0.7312025, -0.3135461, 2.719111, 0, 0, 0, 1, 1,
0.7316625, 1.551352, -0.7619612, 0, 0, 0, 1, 1,
0.7340186, 0.8394754, 1.030537, 0, 0, 0, 1, 1,
0.7363243, -0.7798782, 0.8979821, 0, 0, 0, 1, 1,
0.7466015, 0.1485371, 1.591219, 1, 1, 1, 1, 1,
0.7524058, -1.210953, 1.764494, 1, 1, 1, 1, 1,
0.7569335, 0.0008667913, 1.574576, 1, 1, 1, 1, 1,
0.7571248, 0.5782049, 0.557583, 1, 1, 1, 1, 1,
0.7601877, -0.1461856, 2.711568, 1, 1, 1, 1, 1,
0.762261, 0.2596054, 1.243019, 1, 1, 1, 1, 1,
0.7635688, 0.188728, 1.897095, 1, 1, 1, 1, 1,
0.7645733, 0.3916281, 3.234002, 1, 1, 1, 1, 1,
0.7652206, -2.920865, 3.497626, 1, 1, 1, 1, 1,
0.7684352, -0.2998494, 2.412863, 1, 1, 1, 1, 1,
0.7751948, 2.200284, 0.4949765, 1, 1, 1, 1, 1,
0.7844657, 3.174801, -1.074469, 1, 1, 1, 1, 1,
0.7852023, -0.3364683, 1.28635, 1, 1, 1, 1, 1,
0.7878168, -0.607547, 1.607077, 1, 1, 1, 1, 1,
0.7911122, -1.064688, 1.373402, 1, 1, 1, 1, 1,
0.8087926, -1.016971, 2.256287, 0, 0, 1, 1, 1,
0.809831, -0.4212008, 2.535674, 1, 0, 0, 1, 1,
0.811592, 0.3075522, 1.031065, 1, 0, 0, 1, 1,
0.8135373, 1.09707, 0.15176, 1, 0, 0, 1, 1,
0.817677, 0.1700679, 2.043542, 1, 0, 0, 1, 1,
0.8195028, 0.2471814, 1.567149, 1, 0, 0, 1, 1,
0.8198599, -0.8788401, 2.219461, 0, 0, 0, 1, 1,
0.8222538, -0.5440833, 3.40905, 0, 0, 0, 1, 1,
0.8298952, -1.796539, 3.046558, 0, 0, 0, 1, 1,
0.8332511, -0.2438202, 2.435006, 0, 0, 0, 1, 1,
0.8350777, 0.3268728, 0.2906336, 0, 0, 0, 1, 1,
0.8373501, -0.8161992, 3.166765, 0, 0, 0, 1, 1,
0.8422787, -0.3631013, 3.046778, 0, 0, 0, 1, 1,
0.8424717, 0.5527256, 1.493734, 1, 1, 1, 1, 1,
0.8449458, -0.1975597, 2.390262, 1, 1, 1, 1, 1,
0.85236, -0.1829506, 1.319794, 1, 1, 1, 1, 1,
0.8536101, 1.223752, 1.182585, 1, 1, 1, 1, 1,
0.8552528, -0.881682, 3.393445, 1, 1, 1, 1, 1,
0.8578062, -0.5635936, 2.204392, 1, 1, 1, 1, 1,
0.8578755, -0.1605227, 1.258236, 1, 1, 1, 1, 1,
0.8645635, 0.909731, 1.37149, 1, 1, 1, 1, 1,
0.869902, -2.184482, 3.476828, 1, 1, 1, 1, 1,
0.8730633, -0.01736254, 2.06016, 1, 1, 1, 1, 1,
0.8777587, -1.793055, 3.472686, 1, 1, 1, 1, 1,
0.879936, 1.102482, 1.743392, 1, 1, 1, 1, 1,
0.8827908, -1.326144, 4.153185, 1, 1, 1, 1, 1,
0.8829582, -0.4882447, 1.541577, 1, 1, 1, 1, 1,
0.8972727, -0.526105, 1.90835, 1, 1, 1, 1, 1,
0.8988556, -0.07613078, 2.188173, 0, 0, 1, 1, 1,
0.9015689, 1.5085, -0.1954191, 1, 0, 0, 1, 1,
0.9037309, 2.193446, 1.50833, 1, 0, 0, 1, 1,
0.9045061, -0.1598113, 1.852919, 1, 0, 0, 1, 1,
0.9067783, 0.1103248, 1.628924, 1, 0, 0, 1, 1,
0.908388, -0.6687571, 2.025767, 1, 0, 0, 1, 1,
0.9132273, -1.068658, 2.05441, 0, 0, 0, 1, 1,
0.9139013, 1.699824, 2.579452, 0, 0, 0, 1, 1,
0.920587, 1.162226, 0.8399668, 0, 0, 0, 1, 1,
0.9269646, -1.250685, 4.603128, 0, 0, 0, 1, 1,
0.9297951, -1.031245, 0.6172485, 0, 0, 0, 1, 1,
0.9320166, -0.9225304, 2.178207, 0, 0, 0, 1, 1,
0.934488, -2.153107, 2.482598, 0, 0, 0, 1, 1,
0.9414799, 0.2147487, 0.5300831, 1, 1, 1, 1, 1,
0.9441569, 0.6835466, -0.636893, 1, 1, 1, 1, 1,
0.946474, 0.7683288, 1.300094, 1, 1, 1, 1, 1,
0.947561, -0.5852174, 3.841985, 1, 1, 1, 1, 1,
0.9486377, 0.241547, 0.7565662, 1, 1, 1, 1, 1,
0.9504349, 0.5303011, 1.201639, 1, 1, 1, 1, 1,
0.9582419, 0.4968447, 1.816178, 1, 1, 1, 1, 1,
0.9588943, 2.18094, 0.3932698, 1, 1, 1, 1, 1,
0.9788875, -1.39321, 2.448117, 1, 1, 1, 1, 1,
0.9877743, 0.3256329, 0.3817554, 1, 1, 1, 1, 1,
0.9913027, 0.6089987, 0.9081826, 1, 1, 1, 1, 1,
0.9937464, 0.02975056, 3.336335, 1, 1, 1, 1, 1,
1.001543, -0.8126339, 3.773149, 1, 1, 1, 1, 1,
1.001877, 0.3207445, 1.732548, 1, 1, 1, 1, 1,
1.006845, -1.258895, 2.410887, 1, 1, 1, 1, 1,
1.011175, -1.920753, 1.41335, 0, 0, 1, 1, 1,
1.012542, 0.2104368, 0.04873084, 1, 0, 0, 1, 1,
1.014948, -1.19595, 1.668334, 1, 0, 0, 1, 1,
1.019951, -0.342373, 4.193302, 1, 0, 0, 1, 1,
1.035924, 0.6035629, 0.2735085, 1, 0, 0, 1, 1,
1.046146, 1.779641, 1.291594, 1, 0, 0, 1, 1,
1.051271, 1.149927, 1.240281, 0, 0, 0, 1, 1,
1.068238, -1.207913, 3.284681, 0, 0, 0, 1, 1,
1.075667, -1.554658, 3.690242, 0, 0, 0, 1, 1,
1.077534, 1.638356, 0.9294785, 0, 0, 0, 1, 1,
1.077979, -0.08249018, 1.861048, 0, 0, 0, 1, 1,
1.0841, -0.4923606, 4.034921, 0, 0, 0, 1, 1,
1.084363, 0.6113577, 1.482186, 0, 0, 0, 1, 1,
1.088271, 1.952353, -0.9932097, 1, 1, 1, 1, 1,
1.093582, -0.4334549, 2.415837, 1, 1, 1, 1, 1,
1.094376, -1.181115, 1.527629, 1, 1, 1, 1, 1,
1.100009, -0.8876439, 2.530205, 1, 1, 1, 1, 1,
1.10314, 1.203072, 1.082669, 1, 1, 1, 1, 1,
1.103312, -1.099103, 1.131124, 1, 1, 1, 1, 1,
1.108625, -1.262237, 2.467587, 1, 1, 1, 1, 1,
1.110311, -0.6463827, 1.636101, 1, 1, 1, 1, 1,
1.114619, -0.8434538, 1.915558, 1, 1, 1, 1, 1,
1.114994, 0.2243311, 1.858982, 1, 1, 1, 1, 1,
1.118946, -0.86763, 2.837489, 1, 1, 1, 1, 1,
1.120471, -0.3887987, 2.787416, 1, 1, 1, 1, 1,
1.129563, 0.2072208, 0.4874617, 1, 1, 1, 1, 1,
1.137961, 0.7096705, 0.7165178, 1, 1, 1, 1, 1,
1.142128, 0.2833761, 0.8255023, 1, 1, 1, 1, 1,
1.161015, 1.369832, 1.363913, 0, 0, 1, 1, 1,
1.161629, 0.1394196, 1.857382, 1, 0, 0, 1, 1,
1.197971, -0.3435138, 1.877443, 1, 0, 0, 1, 1,
1.199975, 0.5964428, 0.9544985, 1, 0, 0, 1, 1,
1.214489, 0.8471062, -0.05746092, 1, 0, 0, 1, 1,
1.229277, -0.9433438, 2.127838, 1, 0, 0, 1, 1,
1.229573, -0.4110539, 0.8411047, 0, 0, 0, 1, 1,
1.24099, 2.08838, 0.6554296, 0, 0, 0, 1, 1,
1.25876, 2.428512, 0.1409428, 0, 0, 0, 1, 1,
1.260162, 0.3431917, 0.0210389, 0, 0, 0, 1, 1,
1.261207, 0.5149645, 0.01835624, 0, 0, 0, 1, 1,
1.269597, 1.507706, -1.163799, 0, 0, 0, 1, 1,
1.276235, 2.192615, 1.419863, 0, 0, 0, 1, 1,
1.287979, 1.083465, -0.04742846, 1, 1, 1, 1, 1,
1.290167, -0.3380329, 1.702287, 1, 1, 1, 1, 1,
1.291581, 1.300425, 1.446576, 1, 1, 1, 1, 1,
1.313588, 0.0005896146, 1.44586, 1, 1, 1, 1, 1,
1.328396, -1.816807, 2.873001, 1, 1, 1, 1, 1,
1.34463, 0.939573, 1.357093, 1, 1, 1, 1, 1,
1.358187, -0.8407153, 1.678178, 1, 1, 1, 1, 1,
1.362293, 1.633866, -0.005668033, 1, 1, 1, 1, 1,
1.36403, 0.403319, 1.878537, 1, 1, 1, 1, 1,
1.36523, -0.2894017, 1.595512, 1, 1, 1, 1, 1,
1.376443, 0.442882, 1.45392, 1, 1, 1, 1, 1,
1.382831, -0.3374323, 1.890126, 1, 1, 1, 1, 1,
1.394634, 0.1002743, 0.2783462, 1, 1, 1, 1, 1,
1.403078, 0.5578687, 1.521982, 1, 1, 1, 1, 1,
1.406077, -1.340651, 2.187354, 1, 1, 1, 1, 1,
1.416246, -0.6392999, 2.11611, 0, 0, 1, 1, 1,
1.420319, -0.69546, 3.035498, 1, 0, 0, 1, 1,
1.448003, 2.277703, -0.06532191, 1, 0, 0, 1, 1,
1.452896, -1.48569, 3.837417, 1, 0, 0, 1, 1,
1.453816, 0.3098713, 2.003867, 1, 0, 0, 1, 1,
1.475487, -1.634756, 3.035681, 1, 0, 0, 1, 1,
1.479228, -0.4785143, 2.962108, 0, 0, 0, 1, 1,
1.480495, -1.318167, 2.857841, 0, 0, 0, 1, 1,
1.483613, 1.409958, 1.411016, 0, 0, 0, 1, 1,
1.521737, -0.9291466, 2.003696, 0, 0, 0, 1, 1,
1.521979, -0.8916683, 1.295515, 0, 0, 0, 1, 1,
1.526875, -2.111808, 1.81911, 0, 0, 0, 1, 1,
1.531942, 0.9676059, -0.1048792, 0, 0, 0, 1, 1,
1.53692, -0.1680685, 2.018065, 1, 1, 1, 1, 1,
1.541206, -0.5913192, 3.102068, 1, 1, 1, 1, 1,
1.549452, -0.7986516, 2.827197, 1, 1, 1, 1, 1,
1.554499, 0.2384226, 1.464736, 1, 1, 1, 1, 1,
1.555218, -0.1306436, 0.9950896, 1, 1, 1, 1, 1,
1.556415, 0.6619562, 3.514246, 1, 1, 1, 1, 1,
1.569768, -1.029089, 1.646419, 1, 1, 1, 1, 1,
1.570726, 0.6833616, 1.968799, 1, 1, 1, 1, 1,
1.573163, 0.5975281, 2.017989, 1, 1, 1, 1, 1,
1.573399, 0.4046145, 1.114188, 1, 1, 1, 1, 1,
1.597731, 2.931104, -0.9386094, 1, 1, 1, 1, 1,
1.616413, 0.1527496, 1.603558, 1, 1, 1, 1, 1,
1.640177, -0.686039, 2.03624, 1, 1, 1, 1, 1,
1.645274, -0.3541464, 2.518874, 1, 1, 1, 1, 1,
1.664886, -2.246069, 2.690354, 1, 1, 1, 1, 1,
1.666419, -0.139818, 3.40325, 0, 0, 1, 1, 1,
1.673161, 0.5632675, 0.9022406, 1, 0, 0, 1, 1,
1.674371, -0.549603, 0.5491694, 1, 0, 0, 1, 1,
1.678254, -1.567044, 1.741305, 1, 0, 0, 1, 1,
1.680022, -1.751237, 0.7963936, 1, 0, 0, 1, 1,
1.690219, 0.5082796, 1.562335, 1, 0, 0, 1, 1,
1.69789, -0.6947827, 0.8028294, 0, 0, 0, 1, 1,
1.698725, 0.7858523, 2.469256, 0, 0, 0, 1, 1,
1.700618, 0.3885531, 2.178688, 0, 0, 0, 1, 1,
1.728903, 0.5536508, 1.401477, 0, 0, 0, 1, 1,
1.754919, -1.901786, 2.940703, 0, 0, 0, 1, 1,
1.760493, 0.2723882, 0.8391966, 0, 0, 0, 1, 1,
1.81673, 1.499634, 1.60818, 0, 0, 0, 1, 1,
1.83395, 1.621669, 1.706415, 1, 1, 1, 1, 1,
1.839739, 0.6671005, 0.647096, 1, 1, 1, 1, 1,
1.865373, -0.1742424, 1.968907, 1, 1, 1, 1, 1,
1.869984, -0.2552721, 2.327116, 1, 1, 1, 1, 1,
1.909585, 0.2310765, 2.975447, 1, 1, 1, 1, 1,
1.914131, 1.353609, 1.163583, 1, 1, 1, 1, 1,
1.946753, -0.3774943, 3.2795, 1, 1, 1, 1, 1,
1.989161, 0.9271849, 0.7555281, 1, 1, 1, 1, 1,
2.014682, -1.199489, 2.740458, 1, 1, 1, 1, 1,
2.039006, -0.07967478, 1.935991, 1, 1, 1, 1, 1,
2.040162, 1.720265, 2.274055, 1, 1, 1, 1, 1,
2.059817, -0.4051234, 1.26022, 1, 1, 1, 1, 1,
2.060086, -1.387324, 1.976666, 1, 1, 1, 1, 1,
2.077464, 0.01393193, 1.307792, 1, 1, 1, 1, 1,
2.112786, 0.9444801, 1.094164, 1, 1, 1, 1, 1,
2.115093, 0.07492265, 0.9928088, 0, 0, 1, 1, 1,
2.142892, 0.1896353, 2.441473, 1, 0, 0, 1, 1,
2.163004, -0.4267483, 1.347662, 1, 0, 0, 1, 1,
2.23829, 0.5971913, 1.446934, 1, 0, 0, 1, 1,
2.238526, 1.083746, 1.244098, 1, 0, 0, 1, 1,
2.244619, -1.722157, 2.690375, 1, 0, 0, 1, 1,
2.26172, 0.6169421, 1.594901, 0, 0, 0, 1, 1,
2.287494, 0.5920737, 2.955495, 0, 0, 0, 1, 1,
2.347407, 0.9345324, 2.34334, 0, 0, 0, 1, 1,
2.357378, 0.6754755, 1.752344, 0, 0, 0, 1, 1,
2.418197, -0.7143078, 3.595177, 0, 0, 0, 1, 1,
2.421343, 1.556208, 1.636317, 0, 0, 0, 1, 1,
2.42812, 0.9854776, 0.8506643, 0, 0, 0, 1, 1,
2.437204, 0.602991, 2.559115, 1, 1, 1, 1, 1,
2.457505, 0.261406, 1.024137, 1, 1, 1, 1, 1,
2.478921, -1.608513, 0.1244818, 1, 1, 1, 1, 1,
2.524624, 0.02847268, 1.694184, 1, 1, 1, 1, 1,
2.574325, -2.338545, 2.659832, 1, 1, 1, 1, 1,
2.709589, -0.5438134, 1.993275, 1, 1, 1, 1, 1,
3.007125, 0.2924101, 0.07582828, 1, 1, 1, 1, 1
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
var radius = 9.611699;
var distance = 33.76068;
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
mvMatrix.translate( 0.03521657, -0.086236, -0.2155681 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76068);
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
