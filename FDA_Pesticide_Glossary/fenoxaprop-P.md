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
-2.882072, 0.0629502, -0.7970486, 1, 0, 0, 1,
-2.859885, -0.4123888, -4.123443, 1, 0.007843138, 0, 1,
-2.772191, 0.5403531, -1.777775, 1, 0.01176471, 0, 1,
-2.591087, 0.06146123, -2.971708, 1, 0.01960784, 0, 1,
-2.37437, -0.5249199, -1.160054, 1, 0.02352941, 0, 1,
-2.336553, 0.4820103, 0.6434847, 1, 0.03137255, 0, 1,
-2.249088, 0.2048418, -3.533606, 1, 0.03529412, 0, 1,
-2.243296, 0.6971616, -0.1697026, 1, 0.04313726, 0, 1,
-2.227113, -0.8862684, -0.1736949, 1, 0.04705882, 0, 1,
-2.204149, 1.383483, -1.00441, 1, 0.05490196, 0, 1,
-2.169428, 0.635144, -1.284032, 1, 0.05882353, 0, 1,
-2.116172, 0.8984469, 0.4058226, 1, 0.06666667, 0, 1,
-2.114529, 1.215904, -2.56358, 1, 0.07058824, 0, 1,
-2.084372, 0.2573074, -1.85659, 1, 0.07843138, 0, 1,
-2.084346, 0.4010513, -1.529709, 1, 0.08235294, 0, 1,
-2.022723, -1.299372, -1.332612, 1, 0.09019608, 0, 1,
-2.022604, 1.588277, -1.157589, 1, 0.09411765, 0, 1,
-2.016841, -0.367489, -1.418956, 1, 0.1019608, 0, 1,
-2.006693, 0.4258156, -1.311579, 1, 0.1098039, 0, 1,
-1.948676, -0.2346338, -2.565048, 1, 0.1137255, 0, 1,
-1.936864, 0.6526288, 0.5012633, 1, 0.1215686, 0, 1,
-1.924478, -0.7536643, -2.497456, 1, 0.1254902, 0, 1,
-1.906885, -0.8063024, 0.4604487, 1, 0.1333333, 0, 1,
-1.90482, 1.446568, -2.016975, 1, 0.1372549, 0, 1,
-1.890892, 0.406969, -1.622898, 1, 0.145098, 0, 1,
-1.887942, 1.256156, -0.8473132, 1, 0.1490196, 0, 1,
-1.872822, 1.146395, -0.03297029, 1, 0.1568628, 0, 1,
-1.870492, -0.5488153, -3.040627, 1, 0.1607843, 0, 1,
-1.868785, 0.04465882, -2.10522, 1, 0.1686275, 0, 1,
-1.860642, 1.956824, -0.9665926, 1, 0.172549, 0, 1,
-1.828052, -0.1760097, -1.584308, 1, 0.1803922, 0, 1,
-1.815812, 1.5362, -1.585192, 1, 0.1843137, 0, 1,
-1.809525, -1.334996, -2.431719, 1, 0.1921569, 0, 1,
-1.801465, 1.320662, -0.7428864, 1, 0.1960784, 0, 1,
-1.79126, -0.957048, -0.8755853, 1, 0.2039216, 0, 1,
-1.762407, 0.3268014, 0.5051174, 1, 0.2117647, 0, 1,
-1.740806, 0.3819211, 0.2258921, 1, 0.2156863, 0, 1,
-1.70495, 0.3261114, 0.6960856, 1, 0.2235294, 0, 1,
-1.688523, -0.06140132, -2.186609, 1, 0.227451, 0, 1,
-1.687481, -0.8663892, -1.617216, 1, 0.2352941, 0, 1,
-1.686743, 1.258476, -2.880785, 1, 0.2392157, 0, 1,
-1.679821, 1.25043, 0.3420518, 1, 0.2470588, 0, 1,
-1.67946, 1.061543, -2.588072, 1, 0.2509804, 0, 1,
-1.66351, -0.1967091, -1.320779, 1, 0.2588235, 0, 1,
-1.658978, -0.2465473, -1.340741, 1, 0.2627451, 0, 1,
-1.658692, -0.61468, -1.753599, 1, 0.2705882, 0, 1,
-1.658269, -0.2596676, -1.659071, 1, 0.2745098, 0, 1,
-1.656721, 0.8215535, -2.754299, 1, 0.282353, 0, 1,
-1.645034, -1.478398, -1.614121, 1, 0.2862745, 0, 1,
-1.630956, 0.2598503, -1.416143, 1, 0.2941177, 0, 1,
-1.611696, 1.511844, -0.871992, 1, 0.3019608, 0, 1,
-1.594535, 0.9948859, -0.7177948, 1, 0.3058824, 0, 1,
-1.592013, 1.155432, -0.4052925, 1, 0.3137255, 0, 1,
-1.58961, -2.153933, -2.974266, 1, 0.3176471, 0, 1,
-1.584993, 0.5526709, 0.2114452, 1, 0.3254902, 0, 1,
-1.579226, 1.227787, -0.9729164, 1, 0.3294118, 0, 1,
-1.573115, 1.668351, -1.266686, 1, 0.3372549, 0, 1,
-1.570747, 0.8232441, -1.013781, 1, 0.3411765, 0, 1,
-1.566634, -0.2148009, -1.067554, 1, 0.3490196, 0, 1,
-1.564725, -0.0454637, -1.584095, 1, 0.3529412, 0, 1,
-1.556726, 1.824544, -0.1746429, 1, 0.3607843, 0, 1,
-1.55619, -0.04517629, -1.710678, 1, 0.3647059, 0, 1,
-1.553954, 1.310035, -2.364193, 1, 0.372549, 0, 1,
-1.53393, -0.01701666, -2.231334, 1, 0.3764706, 0, 1,
-1.527515, -0.6895926, -0.5892125, 1, 0.3843137, 0, 1,
-1.52263, -0.9873988, -3.497319, 1, 0.3882353, 0, 1,
-1.51912, 0.7121223, -0.6431938, 1, 0.3960784, 0, 1,
-1.517709, 1.09158, -1.372711, 1, 0.4039216, 0, 1,
-1.515676, -1.326392, -3.287823, 1, 0.4078431, 0, 1,
-1.500517, -0.7206316, -3.865372, 1, 0.4156863, 0, 1,
-1.491392, -0.9507983, -3.65583, 1, 0.4196078, 0, 1,
-1.48902, -1.056154, -2.224052, 1, 0.427451, 0, 1,
-1.482925, 0.0793643, -3.400266, 1, 0.4313726, 0, 1,
-1.479351, -0.1997084, -2.667722, 1, 0.4392157, 0, 1,
-1.474164, 0.3103115, 0.6968215, 1, 0.4431373, 0, 1,
-1.470672, 0.4998638, -1.51265, 1, 0.4509804, 0, 1,
-1.466223, 3.185822, 0.4628861, 1, 0.454902, 0, 1,
-1.462818, 0.6789649, -0.5601043, 1, 0.4627451, 0, 1,
-1.453545, 0.03716467, -1.220984, 1, 0.4666667, 0, 1,
-1.453358, -1.002118, -0.8922946, 1, 0.4745098, 0, 1,
-1.452538, -0.3781404, -1.831046, 1, 0.4784314, 0, 1,
-1.44891, 0.02417587, -2.664355, 1, 0.4862745, 0, 1,
-1.444751, 0.3754812, -0.2901373, 1, 0.4901961, 0, 1,
-1.44451, 0.9926298, -1.151322, 1, 0.4980392, 0, 1,
-1.441208, 1.160372, -1.44231, 1, 0.5058824, 0, 1,
-1.439213, -0.2043693, -0.8363845, 1, 0.509804, 0, 1,
-1.438639, -0.6302708, -2.774487, 1, 0.5176471, 0, 1,
-1.436935, 0.5566704, -2.160833, 1, 0.5215687, 0, 1,
-1.434788, 1.750208, -0.7326023, 1, 0.5294118, 0, 1,
-1.429191, -0.8805459, -0.3123601, 1, 0.5333334, 0, 1,
-1.429031, -0.8448291, -1.913529, 1, 0.5411765, 0, 1,
-1.424208, -0.7297795, -2.777999, 1, 0.5450981, 0, 1,
-1.413164, -1.174115, -3.109935, 1, 0.5529412, 0, 1,
-1.413114, -0.4341102, -0.4858171, 1, 0.5568628, 0, 1,
-1.412137, -0.0006099717, -2.119081, 1, 0.5647059, 0, 1,
-1.411761, 0.7010819, -1.612337, 1, 0.5686275, 0, 1,
-1.409217, -0.9862393, -3.778302, 1, 0.5764706, 0, 1,
-1.381149, -1.315903, -2.952842, 1, 0.5803922, 0, 1,
-1.379646, -1.136081, -2.424161, 1, 0.5882353, 0, 1,
-1.377939, -0.5520045, -1.086333, 1, 0.5921569, 0, 1,
-1.375388, -0.138924, -0.5069546, 1, 0.6, 0, 1,
-1.349132, -0.1963146, -2.922206, 1, 0.6078432, 0, 1,
-1.348915, 1.216153, -1.624074, 1, 0.6117647, 0, 1,
-1.348793, 0.3694123, -0.1043745, 1, 0.6196079, 0, 1,
-1.33108, -0.4364855, -1.956557, 1, 0.6235294, 0, 1,
-1.328911, 0.8039006, -0.3008783, 1, 0.6313726, 0, 1,
-1.324049, -1.302361, -1.452373, 1, 0.6352941, 0, 1,
-1.318831, -0.7567362, -2.905216, 1, 0.6431373, 0, 1,
-1.315672, -0.964702, -0.6184946, 1, 0.6470588, 0, 1,
-1.292775, 0.1194788, -0.9076494, 1, 0.654902, 0, 1,
-1.290494, 0.07240076, -0.8422967, 1, 0.6588235, 0, 1,
-1.266083, 1.11243, -2.241445, 1, 0.6666667, 0, 1,
-1.259795, -0.3682243, -2.327755, 1, 0.6705883, 0, 1,
-1.252659, -0.470257, -2.733984, 1, 0.6784314, 0, 1,
-1.247466, 0.562043, -2.29033, 1, 0.682353, 0, 1,
-1.228861, 1.267534, 0.2252324, 1, 0.6901961, 0, 1,
-1.224383, 0.4678286, -1.115469, 1, 0.6941177, 0, 1,
-1.222892, 1.014365, -0.9304444, 1, 0.7019608, 0, 1,
-1.222012, 0.8073273, -1.796711, 1, 0.7098039, 0, 1,
-1.210004, -0.8494265, -2.366436, 1, 0.7137255, 0, 1,
-1.202899, 1.170281, -0.1615456, 1, 0.7215686, 0, 1,
-1.184143, -1.198284, -2.436197, 1, 0.7254902, 0, 1,
-1.183529, -0.09152201, -1.587148, 1, 0.7333333, 0, 1,
-1.180651, 0.4007227, -1.766166, 1, 0.7372549, 0, 1,
-1.174942, 1.261658, -1.035564, 1, 0.7450981, 0, 1,
-1.17249, -0.7131104, -3.65112, 1, 0.7490196, 0, 1,
-1.170824, 1.76772, -0.8369808, 1, 0.7568628, 0, 1,
-1.167905, 0.532506, -2.504729, 1, 0.7607843, 0, 1,
-1.164145, 0.6961527, -0.9060908, 1, 0.7686275, 0, 1,
-1.154792, 0.3384909, -1.326185, 1, 0.772549, 0, 1,
-1.149154, 1.408794, -0.9626752, 1, 0.7803922, 0, 1,
-1.145999, 1.600552, 3.131568, 1, 0.7843137, 0, 1,
-1.143976, 0.2841053, -1.581913, 1, 0.7921569, 0, 1,
-1.141863, -0.2541938, -2.004583, 1, 0.7960784, 0, 1,
-1.130211, -0.1966402, -0.1905337, 1, 0.8039216, 0, 1,
-1.128463, -2.303743, -2.31693, 1, 0.8117647, 0, 1,
-1.127005, -0.4223276, -2.008452, 1, 0.8156863, 0, 1,
-1.12469, 0.476066, -1.727565, 1, 0.8235294, 0, 1,
-1.123606, -0.1540096, -1.984034, 1, 0.827451, 0, 1,
-1.120919, 0.69864, -1.284528, 1, 0.8352941, 0, 1,
-1.117952, -0.2207625, -3.253757, 1, 0.8392157, 0, 1,
-1.11538, -0.5465925, -1.512719, 1, 0.8470588, 0, 1,
-1.113924, 0.9179494, -2.146442, 1, 0.8509804, 0, 1,
-1.105942, 0.8336241, -2.781579, 1, 0.8588235, 0, 1,
-1.100548, -0.2359521, -1.677929, 1, 0.8627451, 0, 1,
-1.099525, 0.1784845, -3.115176, 1, 0.8705882, 0, 1,
-1.099265, 0.2292303, -0.6371869, 1, 0.8745098, 0, 1,
-1.086539, -1.186073, -1.740442, 1, 0.8823529, 0, 1,
-1.083593, -0.587171, -3.318806, 1, 0.8862745, 0, 1,
-1.072631, 0.4172024, -0.5834636, 1, 0.8941177, 0, 1,
-1.071192, -2.19443, -4.251186, 1, 0.8980392, 0, 1,
-1.065552, -0.4227261, -2.85551, 1, 0.9058824, 0, 1,
-1.062917, -0.4448747, -1.003394, 1, 0.9137255, 0, 1,
-1.052317, 0.740847, -0.4032429, 1, 0.9176471, 0, 1,
-1.052014, 0.021708, -0.03019041, 1, 0.9254902, 0, 1,
-1.050947, -0.6461256, -2.103002, 1, 0.9294118, 0, 1,
-1.04991, -0.8914921, -2.261514, 1, 0.9372549, 0, 1,
-1.046253, -1.669529, -3.981586, 1, 0.9411765, 0, 1,
-1.041107, -0.402784, -0.8086887, 1, 0.9490196, 0, 1,
-1.040634, 0.08153319, -1.597314, 1, 0.9529412, 0, 1,
-1.039155, 1.029058, 0.1356727, 1, 0.9607843, 0, 1,
-1.037814, -0.8694662, -0.6270071, 1, 0.9647059, 0, 1,
-1.036645, -1.945129, -2.404762, 1, 0.972549, 0, 1,
-1.034894, 0.03254995, -1.197115, 1, 0.9764706, 0, 1,
-1.03442, -0.6255078, -2.263693, 1, 0.9843137, 0, 1,
-1.021209, -0.3671522, -2.071591, 1, 0.9882353, 0, 1,
-1.01671, -0.05220984, -3.985553, 1, 0.9960784, 0, 1,
-1.012671, 2.160351, -0.6011031, 0.9960784, 1, 0, 1,
-1.012143, 1.00483, -0.9107845, 0.9921569, 1, 0, 1,
-1.010673, -0.8293613, -3.949548, 0.9843137, 1, 0, 1,
-1.010585, -0.4344573, -0.9674454, 0.9803922, 1, 0, 1,
-1.009658, 1.742389, 0.04029636, 0.972549, 1, 0, 1,
-0.9942687, -0.6913837, -1.576306, 0.9686275, 1, 0, 1,
-0.9818089, 0.7873443, -1.620971, 0.9607843, 1, 0, 1,
-0.9710551, 1.307366, 0.862255, 0.9568627, 1, 0, 1,
-0.9640949, 0.3770737, -2.110713, 0.9490196, 1, 0, 1,
-0.9629837, 1.303255, -1.951036, 0.945098, 1, 0, 1,
-0.9573972, -1.441124, -1.372078, 0.9372549, 1, 0, 1,
-0.9520513, 1.229911, -1.502287, 0.9333333, 1, 0, 1,
-0.9470092, 0.770269, 0.1181003, 0.9254902, 1, 0, 1,
-0.9394189, 1.467824, -1.254521, 0.9215686, 1, 0, 1,
-0.9392527, 0.514367, -2.539588, 0.9137255, 1, 0, 1,
-0.9349165, -0.4850353, -2.959277, 0.9098039, 1, 0, 1,
-0.9314135, 0.4092729, 0.1343255, 0.9019608, 1, 0, 1,
-0.9309675, -0.5287415, -1.736034, 0.8941177, 1, 0, 1,
-0.9300362, 1.79711, 1.081439, 0.8901961, 1, 0, 1,
-0.9283486, 1.399988, -1.361414, 0.8823529, 1, 0, 1,
-0.9244263, -0.8914295, -3.155118, 0.8784314, 1, 0, 1,
-0.9242328, 1.559381, -0.01196118, 0.8705882, 1, 0, 1,
-0.9240897, 1.633026, -0.7439593, 0.8666667, 1, 0, 1,
-0.9131681, 0.3040598, -1.715903, 0.8588235, 1, 0, 1,
-0.909526, 0.1975454, -0.688908, 0.854902, 1, 0, 1,
-0.9041747, 1.151104, 0.2718109, 0.8470588, 1, 0, 1,
-0.9039496, 0.09252132, 1.827012, 0.8431373, 1, 0, 1,
-0.9024317, 0.6325762, -0.7134597, 0.8352941, 1, 0, 1,
-0.8982807, -0.2952851, -1.874218, 0.8313726, 1, 0, 1,
-0.8938869, 0.3485439, -2.208027, 0.8235294, 1, 0, 1,
-0.8905447, 1.185016, -0.4463653, 0.8196079, 1, 0, 1,
-0.884758, 0.2690569, -0.168003, 0.8117647, 1, 0, 1,
-0.8822209, -0.7351892, -1.720202, 0.8078431, 1, 0, 1,
-0.880586, 0.4614709, -1.742264, 0.8, 1, 0, 1,
-0.8783964, -2.20879, -3.908048, 0.7921569, 1, 0, 1,
-0.8771481, 0.5712119, 0.4180583, 0.7882353, 1, 0, 1,
-0.8755324, 2.147761, 1.385196, 0.7803922, 1, 0, 1,
-0.8754399, -0.7088429, -2.816067, 0.7764706, 1, 0, 1,
-0.8750939, -0.1696125, -1.89791, 0.7686275, 1, 0, 1,
-0.8704365, -1.095157, -2.62282, 0.7647059, 1, 0, 1,
-0.8607441, -1.229861, -1.815729, 0.7568628, 1, 0, 1,
-0.8501459, 1.820929, -2.164989, 0.7529412, 1, 0, 1,
-0.8460611, 1.26261, -0.6470572, 0.7450981, 1, 0, 1,
-0.8407375, 0.1268724, -2.658939, 0.7411765, 1, 0, 1,
-0.8403785, 0.6446523, -2.250372, 0.7333333, 1, 0, 1,
-0.8401847, 0.2792431, -0.7071502, 0.7294118, 1, 0, 1,
-0.8388708, -0.1828749, -0.3749256, 0.7215686, 1, 0, 1,
-0.8273704, 1.536913, -1.141574, 0.7176471, 1, 0, 1,
-0.8263122, -1.932377, -2.173869, 0.7098039, 1, 0, 1,
-0.8210784, 0.3065789, -1.151502, 0.7058824, 1, 0, 1,
-0.8071413, 0.5836603, -1.241671, 0.6980392, 1, 0, 1,
-0.802072, 0.2951696, -2.16598, 0.6901961, 1, 0, 1,
-0.7936834, -0.4605979, -0.5633082, 0.6862745, 1, 0, 1,
-0.7917101, -1.363409, -3.059341, 0.6784314, 1, 0, 1,
-0.7900516, 0.7440513, -1.146048, 0.6745098, 1, 0, 1,
-0.7871125, -0.1526263, -2.747471, 0.6666667, 1, 0, 1,
-0.7859505, -0.6727289, -3.075201, 0.6627451, 1, 0, 1,
-0.7857406, 0.3724806, -1.0217, 0.654902, 1, 0, 1,
-0.7845388, -0.5121706, -2.820251, 0.6509804, 1, 0, 1,
-0.7798187, 0.7503638, -2.493797, 0.6431373, 1, 0, 1,
-0.773005, -0.9346572, -2.352682, 0.6392157, 1, 0, 1,
-0.7720469, 0.3805628, -0.3805653, 0.6313726, 1, 0, 1,
-0.7703544, 0.9477518, -1.147955, 0.627451, 1, 0, 1,
-0.7640233, -0.8503017, -2.241023, 0.6196079, 1, 0, 1,
-0.7585855, -0.08761715, -2.93453, 0.6156863, 1, 0, 1,
-0.7579775, -1.638112, -1.497752, 0.6078432, 1, 0, 1,
-0.7556691, -2.357045, -1.237967, 0.6039216, 1, 0, 1,
-0.754973, 0.4991983, -0.8311071, 0.5960785, 1, 0, 1,
-0.7497665, 0.2899635, -1.267388, 0.5882353, 1, 0, 1,
-0.7452011, -1.099116, -3.861121, 0.5843138, 1, 0, 1,
-0.7416565, -0.286589, -2.977667, 0.5764706, 1, 0, 1,
-0.7401034, 0.5725291, 0.5382798, 0.572549, 1, 0, 1,
-0.7365986, -0.1057539, -1.733367, 0.5647059, 1, 0, 1,
-0.7338172, -1.762139, -1.067978, 0.5607843, 1, 0, 1,
-0.7328349, -1.558321, -2.298631, 0.5529412, 1, 0, 1,
-0.7293488, 0.6516005, -2.22763, 0.5490196, 1, 0, 1,
-0.7276456, 0.6955906, 0.3572597, 0.5411765, 1, 0, 1,
-0.7248937, -1.092575, -3.502399, 0.5372549, 1, 0, 1,
-0.7213382, -0.03557283, -1.454821, 0.5294118, 1, 0, 1,
-0.7173627, 1.175552, 1.099139, 0.5254902, 1, 0, 1,
-0.7166904, -0.2407988, -1.818627, 0.5176471, 1, 0, 1,
-0.7154367, -0.7825649, -0.915688, 0.5137255, 1, 0, 1,
-0.7090355, -1.020521, -0.6257147, 0.5058824, 1, 0, 1,
-0.7089508, 0.8959734, 0.4910306, 0.5019608, 1, 0, 1,
-0.7042158, -0.5537186, -4.147657, 0.4941176, 1, 0, 1,
-0.701747, 0.2795923, 0.2843527, 0.4862745, 1, 0, 1,
-0.6983849, -0.03399212, -0.600915, 0.4823529, 1, 0, 1,
-0.6951523, -1.410792, -3.506279, 0.4745098, 1, 0, 1,
-0.6947749, -1.026469, -3.272735, 0.4705882, 1, 0, 1,
-0.6911083, 1.071255, -0.3718399, 0.4627451, 1, 0, 1,
-0.6860884, 0.5130795, -3.033007, 0.4588235, 1, 0, 1,
-0.6848429, -1.162957, -1.23011, 0.4509804, 1, 0, 1,
-0.6801051, 0.9663209, -2.057806, 0.4470588, 1, 0, 1,
-0.6754001, -1.61072, -1.97956, 0.4392157, 1, 0, 1,
-0.6751613, 2.407627, -2.525876, 0.4352941, 1, 0, 1,
-0.6744961, 0.2022891, -1.53448, 0.427451, 1, 0, 1,
-0.669055, -0.4416004, -3.420991, 0.4235294, 1, 0, 1,
-0.669046, 0.6484779, -0.7428294, 0.4156863, 1, 0, 1,
-0.6647301, 0.3617878, -0.7915554, 0.4117647, 1, 0, 1,
-0.6612849, -0.02332478, -2.090374, 0.4039216, 1, 0, 1,
-0.6553649, -1.143449, -3.741328, 0.3960784, 1, 0, 1,
-0.6519575, -0.6237145, -1.736125, 0.3921569, 1, 0, 1,
-0.644685, 0.8207131, -0.9936489, 0.3843137, 1, 0, 1,
-0.6374314, -0.9263565, -1.283227, 0.3803922, 1, 0, 1,
-0.6373698, 0.433538, -0.007953862, 0.372549, 1, 0, 1,
-0.6367303, -0.5591888, -1.275177, 0.3686275, 1, 0, 1,
-0.6353899, 0.9072664, -0.5482138, 0.3607843, 1, 0, 1,
-0.6316773, -0.9924769, -4.178906, 0.3568628, 1, 0, 1,
-0.6289578, 0.9877747, 0.474202, 0.3490196, 1, 0, 1,
-0.6287909, 0.8378212, -0.2377261, 0.345098, 1, 0, 1,
-0.6282503, -1.229789, -1.582594, 0.3372549, 1, 0, 1,
-0.6252899, 1.002451, -0.2569829, 0.3333333, 1, 0, 1,
-0.6182863, 0.6377546, -0.09655965, 0.3254902, 1, 0, 1,
-0.6080821, 0.9115566, -0.7043389, 0.3215686, 1, 0, 1,
-0.602168, 0.8283416, 1.006399, 0.3137255, 1, 0, 1,
-0.5961818, -0.3697682, -4.248048, 0.3098039, 1, 0, 1,
-0.5901334, -0.345124, -1.562121, 0.3019608, 1, 0, 1,
-0.5894932, -0.234142, -1.753192, 0.2941177, 1, 0, 1,
-0.5878196, 0.3300605, -0.6104471, 0.2901961, 1, 0, 1,
-0.585581, 0.343875, 0.3703856, 0.282353, 1, 0, 1,
-0.574873, 1.509768, -0.682918, 0.2784314, 1, 0, 1,
-0.5713367, -0.4283486, -1.086552, 0.2705882, 1, 0, 1,
-0.5700433, -0.01710857, -1.755232, 0.2666667, 1, 0, 1,
-0.5700063, -0.4435011, -1.603171, 0.2588235, 1, 0, 1,
-0.5616699, 0.1865068, 0.01276851, 0.254902, 1, 0, 1,
-0.5588865, -0.528576, -0.05553078, 0.2470588, 1, 0, 1,
-0.5562249, -0.2121141, -3.912307, 0.2431373, 1, 0, 1,
-0.5550529, -1.382807, -2.764626, 0.2352941, 1, 0, 1,
-0.5537322, -0.4511174, -0.3570753, 0.2313726, 1, 0, 1,
-0.5488269, 0.504686, -0.8819312, 0.2235294, 1, 0, 1,
-0.5488219, 0.1633537, -1.766817, 0.2196078, 1, 0, 1,
-0.5477552, -0.1922175, -3.106883, 0.2117647, 1, 0, 1,
-0.5471255, 2.003028, -0.1918642, 0.2078431, 1, 0, 1,
-0.5457036, -0.8478669, -2.539341, 0.2, 1, 0, 1,
-0.545384, 0.5590045, -0.8609764, 0.1921569, 1, 0, 1,
-0.5452307, 0.3482188, -1.103059, 0.1882353, 1, 0, 1,
-0.5431311, 0.9765388, -0.4040594, 0.1803922, 1, 0, 1,
-0.5397255, 0.6310062, -0.5646394, 0.1764706, 1, 0, 1,
-0.5380703, -0.9982983, -2.330327, 0.1686275, 1, 0, 1,
-0.5315782, 0.3721286, -1.085905, 0.1647059, 1, 0, 1,
-0.5314339, 0.7600607, -0.6402048, 0.1568628, 1, 0, 1,
-0.5235229, -0.5831642, -3.708858, 0.1529412, 1, 0, 1,
-0.5221687, -2.357115, -4.24938, 0.145098, 1, 0, 1,
-0.5216059, 0.596963, -2.46891, 0.1411765, 1, 0, 1,
-0.5196723, -1.240923, -2.764432, 0.1333333, 1, 0, 1,
-0.5185166, 0.9083955, -1.16587, 0.1294118, 1, 0, 1,
-0.5177323, 0.5718114, 1.670611, 0.1215686, 1, 0, 1,
-0.5118096, 0.9222258, -0.961154, 0.1176471, 1, 0, 1,
-0.5112307, 0.2821991, -1.154119, 0.1098039, 1, 0, 1,
-0.5096412, -0.5144523, -1.574663, 0.1058824, 1, 0, 1,
-0.5039592, 0.6072719, -1.278123, 0.09803922, 1, 0, 1,
-0.5015874, -1.175072, -5.319932, 0.09019608, 1, 0, 1,
-0.5013953, 0.7155523, 0.421795, 0.08627451, 1, 0, 1,
-0.5005488, -0.5799276, -4.123921, 0.07843138, 1, 0, 1,
-0.4998706, 1.128847, -0.2067001, 0.07450981, 1, 0, 1,
-0.4992967, 0.223244, -1.34488, 0.06666667, 1, 0, 1,
-0.4975226, 1.734814, 0.5675394, 0.0627451, 1, 0, 1,
-0.4945811, -0.3253302, -2.787143, 0.05490196, 1, 0, 1,
-0.4924044, -0.2985505, -1.437587, 0.05098039, 1, 0, 1,
-0.4872442, 1.432245, -0.2959859, 0.04313726, 1, 0, 1,
-0.4829628, -0.4566563, -2.033119, 0.03921569, 1, 0, 1,
-0.4813322, -0.2081305, -2.628256, 0.03137255, 1, 0, 1,
-0.475662, 0.7332831, 0.3269448, 0.02745098, 1, 0, 1,
-0.4738121, -0.3171817, -3.846646, 0.01960784, 1, 0, 1,
-0.4719423, -1.020352, -3.511515, 0.01568628, 1, 0, 1,
-0.470842, 0.8018139, -0.864177, 0.007843138, 1, 0, 1,
-0.4593576, 0.7462274, 1.133465, 0.003921569, 1, 0, 1,
-0.4552271, 1.317419, -0.8770266, 0, 1, 0.003921569, 1,
-0.4511015, -1.485199, -2.696918, 0, 1, 0.01176471, 1,
-0.4399576, 1.240364, -0.6326788, 0, 1, 0.01568628, 1,
-0.4393599, 1.812468, 1.422061, 0, 1, 0.02352941, 1,
-0.4361277, -0.4391336, -0.958013, 0, 1, 0.02745098, 1,
-0.4281955, -0.1475298, -1.10499, 0, 1, 0.03529412, 1,
-0.4249247, -0.8654363, -4.141961, 0, 1, 0.03921569, 1,
-0.4234819, -1.133357, -4.68027, 0, 1, 0.04705882, 1,
-0.419111, 0.3771927, -1.588489, 0, 1, 0.05098039, 1,
-0.4149272, 0.5845476, -1.141008, 0, 1, 0.05882353, 1,
-0.4131296, 0.5194247, -0.07864243, 0, 1, 0.0627451, 1,
-0.4122245, -2.203745, -3.100114, 0, 1, 0.07058824, 1,
-0.4080665, 0.6467826, -0.4386418, 0, 1, 0.07450981, 1,
-0.4076196, -1.577145, -2.567568, 0, 1, 0.08235294, 1,
-0.4065458, -0.1639509, -2.181181, 0, 1, 0.08627451, 1,
-0.4060492, 0.4328735, -0.8092546, 0, 1, 0.09411765, 1,
-0.4034905, -3.037825, -1.135151, 0, 1, 0.1019608, 1,
-0.3967514, -0.5201972, -2.506475, 0, 1, 0.1058824, 1,
-0.3957205, 0.2895584, -0.5645677, 0, 1, 0.1137255, 1,
-0.3951882, 0.748731, -1.492203, 0, 1, 0.1176471, 1,
-0.3910323, 0.1097909, -1.750827, 0, 1, 0.1254902, 1,
-0.3854094, -0.221504, -2.356964, 0, 1, 0.1294118, 1,
-0.3826547, 0.6482848, -1.13525, 0, 1, 0.1372549, 1,
-0.3789033, -0.5827668, -1.471572, 0, 1, 0.1411765, 1,
-0.3780774, -0.4116087, -1.477766, 0, 1, 0.1490196, 1,
-0.3716856, 1.017492, -1.314085, 0, 1, 0.1529412, 1,
-0.3696916, -0.1329177, 0.810627, 0, 1, 0.1607843, 1,
-0.3671087, -0.149946, -2.323963, 0, 1, 0.1647059, 1,
-0.3664224, -0.8128184, -4.451765, 0, 1, 0.172549, 1,
-0.3653065, 1.430663, -0.585989, 0, 1, 0.1764706, 1,
-0.3642445, -0.8696316, -0.7722396, 0, 1, 0.1843137, 1,
-0.3567677, 1.676465, -1.143233, 0, 1, 0.1882353, 1,
-0.3520225, 0.845745, -0.4830396, 0, 1, 0.1960784, 1,
-0.3490639, -0.1182254, -1.6494, 0, 1, 0.2039216, 1,
-0.3451444, -0.0454249, -2.409244, 0, 1, 0.2078431, 1,
-0.34228, -2.025086, -2.459944, 0, 1, 0.2156863, 1,
-0.3399279, -2.344242, -3.699779, 0, 1, 0.2196078, 1,
-0.3374116, -0.7972406, -1.309345, 0, 1, 0.227451, 1,
-0.3313365, -0.2617176, 0.1797637, 0, 1, 0.2313726, 1,
-0.3277588, 1.972717, -0.514805, 0, 1, 0.2392157, 1,
-0.3255899, 1.353356, 0.259242, 0, 1, 0.2431373, 1,
-0.3252649, -0.8718835, -2.151847, 0, 1, 0.2509804, 1,
-0.321431, -1.12942, -1.315932, 0, 1, 0.254902, 1,
-0.3169909, 0.7582418, -0.4611964, 0, 1, 0.2627451, 1,
-0.3094546, 1.016136, -0.6536499, 0, 1, 0.2666667, 1,
-0.3036936, 0.9283808, 0.1382977, 0, 1, 0.2745098, 1,
-0.3021452, -1.538982, -3.585358, 0, 1, 0.2784314, 1,
-0.3013477, 1.183535, -0.4527397, 0, 1, 0.2862745, 1,
-0.3008976, 0.3966908, 0.07670055, 0, 1, 0.2901961, 1,
-0.2953326, 0.8954437, -0.3757518, 0, 1, 0.2980392, 1,
-0.2811907, 0.23245, 0.1342812, 0, 1, 0.3058824, 1,
-0.2809021, 0.4047932, 0.6787643, 0, 1, 0.3098039, 1,
-0.2802931, -1.182481, -3.448676, 0, 1, 0.3176471, 1,
-0.278491, 0.1375122, -0.2956448, 0, 1, 0.3215686, 1,
-0.2783006, -0.03121083, -1.208443, 0, 1, 0.3294118, 1,
-0.2771296, -0.004908913, -1.159947, 0, 1, 0.3333333, 1,
-0.2769041, 0.786175, -0.5269516, 0, 1, 0.3411765, 1,
-0.275938, 1.512392, 0.362949, 0, 1, 0.345098, 1,
-0.2752855, -0.9124862, -3.942744, 0, 1, 0.3529412, 1,
-0.2729803, -0.2596163, -2.148718, 0, 1, 0.3568628, 1,
-0.2683692, 1.364918, -0.7910701, 0, 1, 0.3647059, 1,
-0.265154, 0.6461952, -1.059031, 0, 1, 0.3686275, 1,
-0.2636456, -2.008324, -2.379388, 0, 1, 0.3764706, 1,
-0.2605089, -0.4432555, -2.533408, 0, 1, 0.3803922, 1,
-0.2572048, -1.100268, -3.411518, 0, 1, 0.3882353, 1,
-0.2547388, -1.435274, -4.591645, 0, 1, 0.3921569, 1,
-0.2523001, 2.524281, 0.3232049, 0, 1, 0.4, 1,
-0.2463714, -0.9883908, -2.857868, 0, 1, 0.4078431, 1,
-0.2461508, -0.3553208, -2.529771, 0, 1, 0.4117647, 1,
-0.2419733, -0.2661394, -1.843324, 0, 1, 0.4196078, 1,
-0.2412923, 0.7095709, -1.416701, 0, 1, 0.4235294, 1,
-0.2391517, 1.456647, 0.2613129, 0, 1, 0.4313726, 1,
-0.238683, 0.2640939, -0.1274156, 0, 1, 0.4352941, 1,
-0.2342447, -0.1820599, -2.201686, 0, 1, 0.4431373, 1,
-0.2307099, 0.8589444, 1.61335, 0, 1, 0.4470588, 1,
-0.2306378, -0.08665778, -3.531742, 0, 1, 0.454902, 1,
-0.2274224, 1.178988, 1.232756, 0, 1, 0.4588235, 1,
-0.2261638, -1.174688, -3.020968, 0, 1, 0.4666667, 1,
-0.224406, -0.1215782, -0.3013257, 0, 1, 0.4705882, 1,
-0.2218945, 0.2510158, -0.3359908, 0, 1, 0.4784314, 1,
-0.2213411, -0.5709425, -3.092468, 0, 1, 0.4823529, 1,
-0.2212999, -2.19099, -2.947315, 0, 1, 0.4901961, 1,
-0.2186074, 1.96535, 1.981641, 0, 1, 0.4941176, 1,
-0.215458, 0.4953474, 0.2610773, 0, 1, 0.5019608, 1,
-0.2135293, 1.708127, -1.252381, 0, 1, 0.509804, 1,
-0.2115301, -0.1584567, -3.826794, 0, 1, 0.5137255, 1,
-0.210911, 1.623881, -1.977375, 0, 1, 0.5215687, 1,
-0.2093042, -1.526932, -3.679309, 0, 1, 0.5254902, 1,
-0.20556, 0.3098074, 0.1578024, 0, 1, 0.5333334, 1,
-0.2035991, -1.256372, -0.8970428, 0, 1, 0.5372549, 1,
-0.2024133, 0.816547, -1.47715, 0, 1, 0.5450981, 1,
-0.2022984, 1.860935, 1.798313, 0, 1, 0.5490196, 1,
-0.199502, -1.163028, -3.390769, 0, 1, 0.5568628, 1,
-0.1981155, -0.5449244, -2.995373, 0, 1, 0.5607843, 1,
-0.1977032, 0.603451, -1.154099, 0, 1, 0.5686275, 1,
-0.1936672, 0.96828, -0.02235419, 0, 1, 0.572549, 1,
-0.1934824, -1.937529, -2.373745, 0, 1, 0.5803922, 1,
-0.1908052, 0.3301992, -0.8802729, 0, 1, 0.5843138, 1,
-0.1887897, 0.3921529, -0.6072303, 0, 1, 0.5921569, 1,
-0.1883164, 0.5021639, -0.2051215, 0, 1, 0.5960785, 1,
-0.1848389, -2.297734, -2.660866, 0, 1, 0.6039216, 1,
-0.1830158, 0.9856133, 0.05906883, 0, 1, 0.6117647, 1,
-0.1823196, 0.0685886, -0.2110841, 0, 1, 0.6156863, 1,
-0.1806377, -0.3185459, -4.180506, 0, 1, 0.6235294, 1,
-0.1806117, -1.148049, -1.558012, 0, 1, 0.627451, 1,
-0.1805732, -1.220284, -3.214541, 0, 1, 0.6352941, 1,
-0.1773734, -0.05197594, -1.329495, 0, 1, 0.6392157, 1,
-0.1722907, -0.2062671, -1.282328, 0, 1, 0.6470588, 1,
-0.1714426, -0.8021278, -2.089298, 0, 1, 0.6509804, 1,
-0.1697091, 0.560657, 0.4075868, 0, 1, 0.6588235, 1,
-0.1683935, -0.9726027, -3.433596, 0, 1, 0.6627451, 1,
-0.1682789, 0.5244313, 0.643386, 0, 1, 0.6705883, 1,
-0.1669976, 1.266038, 0.9199657, 0, 1, 0.6745098, 1,
-0.1663187, 0.111542, 0.5521245, 0, 1, 0.682353, 1,
-0.1640957, 0.6429059, 0.3213509, 0, 1, 0.6862745, 1,
-0.155057, 0.978844, -0.268898, 0, 1, 0.6941177, 1,
-0.1536715, -0.4336496, -1.664971, 0, 1, 0.7019608, 1,
-0.1519557, 0.8464593, 0.4352101, 0, 1, 0.7058824, 1,
-0.1504611, 0.4224031, 0.1370137, 0, 1, 0.7137255, 1,
-0.1441022, 1.296904, -2.283143, 0, 1, 0.7176471, 1,
-0.140375, 0.5316306, 1.28642, 0, 1, 0.7254902, 1,
-0.1360286, -0.1359122, -3.002777, 0, 1, 0.7294118, 1,
-0.1282379, 0.9180123, -0.334868, 0, 1, 0.7372549, 1,
-0.122873, -0.8195427, -2.837349, 0, 1, 0.7411765, 1,
-0.1222343, 0.04309807, -0.5992808, 0, 1, 0.7490196, 1,
-0.1221295, 0.5356987, -1.339867, 0, 1, 0.7529412, 1,
-0.1205309, 1.04801, -0.5352215, 0, 1, 0.7607843, 1,
-0.1188392, -0.09665278, -2.277294, 0, 1, 0.7647059, 1,
-0.116405, -0.602957, -2.803661, 0, 1, 0.772549, 1,
-0.1154714, 1.722187, 0.01291518, 0, 1, 0.7764706, 1,
-0.1133298, 0.05397605, -0.9351293, 0, 1, 0.7843137, 1,
-0.1115973, 0.5530341, 1.301619, 0, 1, 0.7882353, 1,
-0.111131, 1.450933, -0.5105789, 0, 1, 0.7960784, 1,
-0.107292, -0.4730039, -2.652284, 0, 1, 0.8039216, 1,
-0.1052329, 0.3214026, 0.9758889, 0, 1, 0.8078431, 1,
-0.1035889, -0.3169208, -2.04019, 0, 1, 0.8156863, 1,
-0.1018284, 0.3501715, -0.003064419, 0, 1, 0.8196079, 1,
-0.09744457, 1.906713, 1.275847, 0, 1, 0.827451, 1,
-0.09462695, 1.31771, -1.298766, 0, 1, 0.8313726, 1,
-0.09384871, 0.2943602, 0.6198699, 0, 1, 0.8392157, 1,
-0.09358913, 0.6764804, -0.6950539, 0, 1, 0.8431373, 1,
-0.09309956, 0.899202, -0.937645, 0, 1, 0.8509804, 1,
-0.09258204, 0.2021888, 0.7854506, 0, 1, 0.854902, 1,
-0.08752906, 0.6646937, -0.04772903, 0, 1, 0.8627451, 1,
-0.08210433, -0.8161132, -4.241938, 0, 1, 0.8666667, 1,
-0.08056032, 0.4954673, -0.9916275, 0, 1, 0.8745098, 1,
-0.08042773, 0.511199, -0.4824548, 0, 1, 0.8784314, 1,
-0.07878339, 0.3080502, 0.1738988, 0, 1, 0.8862745, 1,
-0.07853458, -3.052429, -2.584501, 0, 1, 0.8901961, 1,
-0.07833286, 1.300578, -1.197362, 0, 1, 0.8980392, 1,
-0.07734682, 0.3294365, -0.2871744, 0, 1, 0.9058824, 1,
-0.07694088, 1.952042, -1.465255, 0, 1, 0.9098039, 1,
-0.07049921, 0.166918, -0.003648304, 0, 1, 0.9176471, 1,
-0.07002707, 0.5219756, -0.1673485, 0, 1, 0.9215686, 1,
-0.06826925, 0.3454902, -2.250466, 0, 1, 0.9294118, 1,
-0.0668902, -0.2477521, -3.407356, 0, 1, 0.9333333, 1,
-0.06634532, -0.2950851, -3.85886, 0, 1, 0.9411765, 1,
-0.0638819, -0.1623581, -3.108868, 0, 1, 0.945098, 1,
-0.06122348, 0.4471989, 0.1623608, 0, 1, 0.9529412, 1,
-0.0578428, 1.475706, -1.131056, 0, 1, 0.9568627, 1,
-0.05348734, -1.600723, -2.280315, 0, 1, 0.9647059, 1,
-0.04478158, 1.811387, -1.848844, 0, 1, 0.9686275, 1,
-0.04380214, -0.8886964, -4.5415, 0, 1, 0.9764706, 1,
-0.04320594, -0.6677538, -2.495679, 0, 1, 0.9803922, 1,
-0.04011359, 0.06402132, 1.044297, 0, 1, 0.9882353, 1,
-0.03481782, 0.4957299, 0.8814633, 0, 1, 0.9921569, 1,
-0.03432646, 0.8174524, -0.8436443, 0, 1, 1, 1,
-0.02890308, -1.492219, -2.415096, 0, 0.9921569, 1, 1,
-0.02788963, -1.906788, -4.99367, 0, 0.9882353, 1, 1,
-0.0271503, -0.2727616, -2.512893, 0, 0.9803922, 1, 1,
-0.02561594, -1.198496, -3.503922, 0, 0.9764706, 1, 1,
-0.02008109, -0.2339244, -3.28672, 0, 0.9686275, 1, 1,
-0.01579187, 0.6360509, 0.3225282, 0, 0.9647059, 1, 1,
-0.01125119, 0.6944035, -0.8269008, 0, 0.9568627, 1, 1,
-0.01091579, 1.732031, 0.1929243, 0, 0.9529412, 1, 1,
-0.007488697, -0.6470655, -4.064843, 0, 0.945098, 1, 1,
-0.00697186, -0.4045576, -3.527105, 0, 0.9411765, 1, 1,
-0.00415732, -0.1459753, -1.787195, 0, 0.9333333, 1, 1,
-0.003763902, 0.2921574, -1.20591, 0, 0.9294118, 1, 1,
-0.003277422, 0.8519614, -1.008935, 0, 0.9215686, 1, 1,
0.0002868299, -0.4850471, 2.495866, 0, 0.9176471, 1, 1,
0.0004974602, -0.4072926, 3.932405, 0, 0.9098039, 1, 1,
0.003954186, 0.7477394, 0.6230916, 0, 0.9058824, 1, 1,
0.006749711, -0.52672, 3.214562, 0, 0.8980392, 1, 1,
0.009937305, -0.9927351, 5.322961, 0, 0.8901961, 1, 1,
0.01182314, 0.6741306, 0.591606, 0, 0.8862745, 1, 1,
0.01301297, 1.031802, -0.7766452, 0, 0.8784314, 1, 1,
0.01361327, -0.100895, 2.701926, 0, 0.8745098, 1, 1,
0.01667182, 0.6143544, 1.45563, 0, 0.8666667, 1, 1,
0.01796765, 1.410624, -0.3915442, 0, 0.8627451, 1, 1,
0.01969481, -1.771367, 4.57656, 0, 0.854902, 1, 1,
0.02061013, 0.9782131, -0.1358441, 0, 0.8509804, 1, 1,
0.02137155, -0.4040167, 4.586353, 0, 0.8431373, 1, 1,
0.02325758, -1.214481, 3.313207, 0, 0.8392157, 1, 1,
0.02759972, -0.3732404, 2.95966, 0, 0.8313726, 1, 1,
0.03005385, 0.7167103, -0.1340894, 0, 0.827451, 1, 1,
0.03350112, 0.4757633, -0.5069233, 0, 0.8196079, 1, 1,
0.04163481, -0.9729419, 3.777484, 0, 0.8156863, 1, 1,
0.04178407, 0.2168224, -0.5307399, 0, 0.8078431, 1, 1,
0.04339913, -0.5986152, 2.411767, 0, 0.8039216, 1, 1,
0.04366538, 1.025277, -1.009313, 0, 0.7960784, 1, 1,
0.04445224, -0.3817743, 2.556663, 0, 0.7882353, 1, 1,
0.04522914, -1.496444, 2.857576, 0, 0.7843137, 1, 1,
0.04540947, -0.4645098, 5.290822, 0, 0.7764706, 1, 1,
0.04541477, 0.7084205, 1.128039, 0, 0.772549, 1, 1,
0.0503049, 0.3562978, -0.2795375, 0, 0.7647059, 1, 1,
0.05516645, -0.1606804, 2.613603, 0, 0.7607843, 1, 1,
0.06322707, 0.4428314, -1.380221, 0, 0.7529412, 1, 1,
0.06383735, -0.9180763, 3.00643, 0, 0.7490196, 1, 1,
0.06387323, 0.7547359, -0.647878, 0, 0.7411765, 1, 1,
0.06460408, -0.7656138, 2.47075, 0, 0.7372549, 1, 1,
0.06505074, -0.6809017, 3.648422, 0, 0.7294118, 1, 1,
0.06829652, -1.044959, 0.9082811, 0, 0.7254902, 1, 1,
0.07471339, 0.0259688, 2.140721, 0, 0.7176471, 1, 1,
0.07512318, -0.3349222, 2.584141, 0, 0.7137255, 1, 1,
0.08042206, -0.4646602, 4.015, 0, 0.7058824, 1, 1,
0.09226117, 1.936664, 0.5048949, 0, 0.6980392, 1, 1,
0.0925216, 0.4292518, -0.7219122, 0, 0.6941177, 1, 1,
0.09540019, 0.2836291, -0.1288895, 0, 0.6862745, 1, 1,
0.09730518, 0.857242, 0.05952863, 0, 0.682353, 1, 1,
0.09886678, -0.7815604, 2.156203, 0, 0.6745098, 1, 1,
0.1033146, -0.4767814, 2.294456, 0, 0.6705883, 1, 1,
0.1074496, 0.4778678, -0.05183652, 0, 0.6627451, 1, 1,
0.1085417, 0.5633017, 2.547709, 0, 0.6588235, 1, 1,
0.1110931, -1.195098, 1.91598, 0, 0.6509804, 1, 1,
0.1112003, 1.707018, -2.989209, 0, 0.6470588, 1, 1,
0.1137461, -0.6649345, 3.576018, 0, 0.6392157, 1, 1,
0.1148924, -0.813694, 1.872706, 0, 0.6352941, 1, 1,
0.1166453, 0.695489, 1.096993, 0, 0.627451, 1, 1,
0.1172653, -0.566358, 4.101222, 0, 0.6235294, 1, 1,
0.1206634, 0.2311582, -1.313658, 0, 0.6156863, 1, 1,
0.1214807, -0.5150398, 3.361827, 0, 0.6117647, 1, 1,
0.1217515, -1.271259, 3.272982, 0, 0.6039216, 1, 1,
0.1257146, -0.7454999, 2.812438, 0, 0.5960785, 1, 1,
0.1259219, -0.4159254, 2.422255, 0, 0.5921569, 1, 1,
0.1295428, -0.5737782, 2.778292, 0, 0.5843138, 1, 1,
0.1303266, 1.645362, 0.05907638, 0, 0.5803922, 1, 1,
0.1325681, -0.5873758, 2.480581, 0, 0.572549, 1, 1,
0.1343583, -1.22478, 3.263688, 0, 0.5686275, 1, 1,
0.1361687, -0.0005832524, 2.165189, 0, 0.5607843, 1, 1,
0.1372357, -1.216407, 4.79058, 0, 0.5568628, 1, 1,
0.1380774, -1.055741, 5.096263, 0, 0.5490196, 1, 1,
0.1399236, -0.6172209, 3.357638, 0, 0.5450981, 1, 1,
0.1463177, -0.732551, 1.730815, 0, 0.5372549, 1, 1,
0.1465215, -0.2139513, 2.638017, 0, 0.5333334, 1, 1,
0.1480122, -0.8189842, 4.220262, 0, 0.5254902, 1, 1,
0.1536387, 0.6191697, 0.2934602, 0, 0.5215687, 1, 1,
0.1543679, -1.590867, 3.13728, 0, 0.5137255, 1, 1,
0.1545533, 0.0108592, 0.5281178, 0, 0.509804, 1, 1,
0.1553585, 0.397473, -1.677936, 0, 0.5019608, 1, 1,
0.1665086, 1.055342, 0.2899146, 0, 0.4941176, 1, 1,
0.1687183, 0.4371454, -0.4993218, 0, 0.4901961, 1, 1,
0.1700772, -2.303884, 2.290172, 0, 0.4823529, 1, 1,
0.1714303, 0.04620005, 1.147672, 0, 0.4784314, 1, 1,
0.172867, 0.4074753, 0.4483964, 0, 0.4705882, 1, 1,
0.182221, -1.368605, 4.162272, 0, 0.4666667, 1, 1,
0.1823099, 0.8100964, 0.03047243, 0, 0.4588235, 1, 1,
0.1826739, -1.643746, 1.603539, 0, 0.454902, 1, 1,
0.1871979, -0.1089476, 5.050601, 0, 0.4470588, 1, 1,
0.1884492, -0.4412399, 2.682614, 0, 0.4431373, 1, 1,
0.188984, 0.2641902, 1.754678, 0, 0.4352941, 1, 1,
0.1904574, 0.5724909, -1.433306, 0, 0.4313726, 1, 1,
0.1950544, 1.312492, 1.511331, 0, 0.4235294, 1, 1,
0.1966765, -0.7936419, 0.6378527, 0, 0.4196078, 1, 1,
0.1994653, 0.4913776, 0.9597203, 0, 0.4117647, 1, 1,
0.2009672, 1.528868, -0.1768412, 0, 0.4078431, 1, 1,
0.2029514, 1.820044, 1.414846, 0, 0.4, 1, 1,
0.208279, -3.207401, 1.430227, 0, 0.3921569, 1, 1,
0.2105571, -0.7835026, 4.15856, 0, 0.3882353, 1, 1,
0.2169711, 1.459882, -0.3110246, 0, 0.3803922, 1, 1,
0.219542, -1.428576, 2.675088, 0, 0.3764706, 1, 1,
0.2199457, 0.408558, 0.5560768, 0, 0.3686275, 1, 1,
0.2261401, 0.5269881, 1.583452, 0, 0.3647059, 1, 1,
0.2316703, -1.121145, 2.628572, 0, 0.3568628, 1, 1,
0.2325815, -1.059268, 3.482513, 0, 0.3529412, 1, 1,
0.2406173, 0.03344189, 0.6539931, 0, 0.345098, 1, 1,
0.2413289, 1.91645, 0.782561, 0, 0.3411765, 1, 1,
0.2557361, -1.004211, 3.439675, 0, 0.3333333, 1, 1,
0.2571171, -0.1254986, 2.250229, 0, 0.3294118, 1, 1,
0.2591887, -0.8714615, 4.058703, 0, 0.3215686, 1, 1,
0.2607477, 1.482434, -1.222084, 0, 0.3176471, 1, 1,
0.2624326, 0.3116505, -0.530096, 0, 0.3098039, 1, 1,
0.2629365, -0.2070961, 1.244494, 0, 0.3058824, 1, 1,
0.2635579, -0.911273, 1.270305, 0, 0.2980392, 1, 1,
0.2656744, 0.5987793, -0.3017528, 0, 0.2901961, 1, 1,
0.2686375, 0.4620613, 0.9155426, 0, 0.2862745, 1, 1,
0.2715406, -0.9994101, 3.042606, 0, 0.2784314, 1, 1,
0.2716498, 0.3231664, 1.180949, 0, 0.2745098, 1, 1,
0.2732865, 0.6003034, 1.748091, 0, 0.2666667, 1, 1,
0.2746277, -2.037765, 3.600856, 0, 0.2627451, 1, 1,
0.2755303, -0.4689225, 2.704865, 0, 0.254902, 1, 1,
0.2763739, -1.02333, 2.888573, 0, 0.2509804, 1, 1,
0.2802006, 1.395614, 1.301445, 0, 0.2431373, 1, 1,
0.280728, 0.3233093, 2.456518, 0, 0.2392157, 1, 1,
0.2817237, 0.6520211, -1.277202, 0, 0.2313726, 1, 1,
0.282206, -0.2618566, 3.532747, 0, 0.227451, 1, 1,
0.2852059, 0.4707551, -0.0349741, 0, 0.2196078, 1, 1,
0.2858668, 0.6034294, 1.937751, 0, 0.2156863, 1, 1,
0.2983322, -0.1064971, 2.215937, 0, 0.2078431, 1, 1,
0.2996161, -2.509615, 1.538112, 0, 0.2039216, 1, 1,
0.3000626, 1.52008, 2.533932, 0, 0.1960784, 1, 1,
0.3056405, 0.072833, 1.374079, 0, 0.1882353, 1, 1,
0.306249, -0.135792, 1.302565, 0, 0.1843137, 1, 1,
0.3063986, 0.4032611, 3.072842, 0, 0.1764706, 1, 1,
0.3112628, -1.204241, 3.066575, 0, 0.172549, 1, 1,
0.3157649, 0.2223173, 1.093554, 0, 0.1647059, 1, 1,
0.3169629, 1.634615, 0.01313777, 0, 0.1607843, 1, 1,
0.3294668, 0.8728169, 1.21981, 0, 0.1529412, 1, 1,
0.3355782, -1.512356, 4.370983, 0, 0.1490196, 1, 1,
0.3385007, -0.7281037, 3.984144, 0, 0.1411765, 1, 1,
0.3393325, -1.121205, 3.364476, 0, 0.1372549, 1, 1,
0.3397966, -1.242744, 3.141712, 0, 0.1294118, 1, 1,
0.3402879, 1.087789, -0.5266319, 0, 0.1254902, 1, 1,
0.3432468, -0.3261564, 3.828267, 0, 0.1176471, 1, 1,
0.3468014, 1.475713, -0.4779204, 0, 0.1137255, 1, 1,
0.3555692, -0.3442203, 2.559563, 0, 0.1058824, 1, 1,
0.3556207, 0.3357407, 3.332443, 0, 0.09803922, 1, 1,
0.3579221, -0.9741841, 2.584198, 0, 0.09411765, 1, 1,
0.3588884, 0.6434602, 2.612332, 0, 0.08627451, 1, 1,
0.3632869, 1.188383, -0.5472207, 0, 0.08235294, 1, 1,
0.3639497, 0.7290454, 0.04728644, 0, 0.07450981, 1, 1,
0.3641011, 1.542515, -0.07491758, 0, 0.07058824, 1, 1,
0.3692436, 1.338757, -1.974586, 0, 0.0627451, 1, 1,
0.3695054, -0.2822254, 1.434211, 0, 0.05882353, 1, 1,
0.3838738, -1.079106, 2.464865, 0, 0.05098039, 1, 1,
0.3874305, 0.5809624, 0.7677162, 0, 0.04705882, 1, 1,
0.3879289, -1.094415, 2.666263, 0, 0.03921569, 1, 1,
0.3911372, 0.3020475, 1.327966, 0, 0.03529412, 1, 1,
0.3925773, 0.1347616, 1.132498, 0, 0.02745098, 1, 1,
0.3964845, -0.06506137, 1.662045, 0, 0.02352941, 1, 1,
0.4010559, -0.119327, 2.210531, 0, 0.01568628, 1, 1,
0.4105886, 0.9916713, 0.009833095, 0, 0.01176471, 1, 1,
0.4120528, -0.5273249, 1.988546, 0, 0.003921569, 1, 1,
0.4143419, -1.234489, 3.366973, 0.003921569, 0, 1, 1,
0.414507, 0.32313, 1.753058, 0.007843138, 0, 1, 1,
0.4196616, -1.187285, 2.572312, 0.01568628, 0, 1, 1,
0.4206962, -0.6509075, 1.19311, 0.01960784, 0, 1, 1,
0.4208446, -0.3215817, 1.86416, 0.02745098, 0, 1, 1,
0.4228437, -0.4173174, 2.742733, 0.03137255, 0, 1, 1,
0.4238703, 0.1772071, 2.431068, 0.03921569, 0, 1, 1,
0.4240479, 1.230138, -0.8213052, 0.04313726, 0, 1, 1,
0.4246186, 1.021382, 1.723462, 0.05098039, 0, 1, 1,
0.4259751, 0.1909662, 0.165911, 0.05490196, 0, 1, 1,
0.4275059, 1.302644, 1.199427, 0.0627451, 0, 1, 1,
0.4349226, 0.2047526, 0.6808227, 0.06666667, 0, 1, 1,
0.4414071, 1.335122, 1.131305, 0.07450981, 0, 1, 1,
0.4419636, -0.5528203, 2.457484, 0.07843138, 0, 1, 1,
0.4478919, -1.271135, 3.317219, 0.08627451, 0, 1, 1,
0.4487847, -0.3405749, 2.046165, 0.09019608, 0, 1, 1,
0.450013, 0.7861211, -0.3621048, 0.09803922, 0, 1, 1,
0.4525435, -1.646747, 1.215324, 0.1058824, 0, 1, 1,
0.4554916, 0.205477, 1.525105, 0.1098039, 0, 1, 1,
0.4578576, 0.1784489, 1.023386, 0.1176471, 0, 1, 1,
0.4592917, -1.4167, 4.373931, 0.1215686, 0, 1, 1,
0.461614, -0.2846009, -0.2040428, 0.1294118, 0, 1, 1,
0.462021, -0.2603362, 1.160662, 0.1333333, 0, 1, 1,
0.4687794, -1.418271, 1.595486, 0.1411765, 0, 1, 1,
0.4693173, 0.5834655, 0.7049917, 0.145098, 0, 1, 1,
0.4732865, 0.4694659, 0.3867175, 0.1529412, 0, 1, 1,
0.4747802, 0.2795758, 1.209752, 0.1568628, 0, 1, 1,
0.475282, 0.6475756, 0.330961, 0.1647059, 0, 1, 1,
0.4753682, 1.187347, -0.876692, 0.1686275, 0, 1, 1,
0.475537, -1.099954, 3.733429, 0.1764706, 0, 1, 1,
0.4767933, 0.1811587, 2.312689, 0.1803922, 0, 1, 1,
0.4851693, -0.6151362, 2.987725, 0.1882353, 0, 1, 1,
0.4870831, 0.9840258, -2.517076, 0.1921569, 0, 1, 1,
0.4897191, 1.478135, 0.9358084, 0.2, 0, 1, 1,
0.49277, -0.01858913, 3.434524, 0.2078431, 0, 1, 1,
0.5032008, -0.196311, 1.91091, 0.2117647, 0, 1, 1,
0.5074394, 0.3155522, -0.9500347, 0.2196078, 0, 1, 1,
0.5081238, 1.525444, -0.7430107, 0.2235294, 0, 1, 1,
0.5092524, -0.30589, 1.78458, 0.2313726, 0, 1, 1,
0.5118584, 0.6163293, -0.7119936, 0.2352941, 0, 1, 1,
0.514528, 0.3164914, 1.118112, 0.2431373, 0, 1, 1,
0.5151334, -0.4280485, 1.995813, 0.2470588, 0, 1, 1,
0.5196657, 1.535614, -1.723998, 0.254902, 0, 1, 1,
0.5214372, 1.110822, 2.036933, 0.2588235, 0, 1, 1,
0.5242468, -0.5290897, 1.720543, 0.2666667, 0, 1, 1,
0.5272307, 0.2130412, 1.324046, 0.2705882, 0, 1, 1,
0.5385478, -0.883354, 2.534006, 0.2784314, 0, 1, 1,
0.5392556, 0.4444267, -0.2263923, 0.282353, 0, 1, 1,
0.5534624, 0.3992535, 0.4371689, 0.2901961, 0, 1, 1,
0.5550967, 1.512269, -1.449538, 0.2941177, 0, 1, 1,
0.5576015, 0.4877331, 0.6618719, 0.3019608, 0, 1, 1,
0.5627755, -1.346855, 4.04988, 0.3098039, 0, 1, 1,
0.5635434, -0.04131187, 3.840461, 0.3137255, 0, 1, 1,
0.5666149, 0.1091355, 1.277849, 0.3215686, 0, 1, 1,
0.574217, 1.220476, -0.04484193, 0.3254902, 0, 1, 1,
0.5749437, 1.112612, 1.029066, 0.3333333, 0, 1, 1,
0.5764191, 2.001213, 0.8369264, 0.3372549, 0, 1, 1,
0.5815692, -0.9367992, 2.475501, 0.345098, 0, 1, 1,
0.5822853, -0.0586451, 0.8978034, 0.3490196, 0, 1, 1,
0.5833686, 0.7353241, 1.471671, 0.3568628, 0, 1, 1,
0.58372, -0.3601243, 3.187556, 0.3607843, 0, 1, 1,
0.5841687, 0.3686384, 0.7445927, 0.3686275, 0, 1, 1,
0.5843092, 1.784811, 0.4927292, 0.372549, 0, 1, 1,
0.5848547, 0.9884096, 0.4817566, 0.3803922, 0, 1, 1,
0.5875633, -1.04299, 4.512305, 0.3843137, 0, 1, 1,
0.592606, -0.7634264, 2.55896, 0.3921569, 0, 1, 1,
0.5975704, 0.02111304, 3.758324, 0.3960784, 0, 1, 1,
0.5993558, 1.778935, 0.99055, 0.4039216, 0, 1, 1,
0.6010814, 0.08460109, 0.7685317, 0.4117647, 0, 1, 1,
0.60483, -0.1300288, 0.7163754, 0.4156863, 0, 1, 1,
0.6048978, 0.5092905, 1.808916, 0.4235294, 0, 1, 1,
0.6074288, -1.010945, 5.8852, 0.427451, 0, 1, 1,
0.6117319, -1.057706, 3.641986, 0.4352941, 0, 1, 1,
0.6128772, 0.9215897, 0.6522669, 0.4392157, 0, 1, 1,
0.6170675, -0.4588142, 1.574819, 0.4470588, 0, 1, 1,
0.6176502, 1.983012, -0.858125, 0.4509804, 0, 1, 1,
0.6253627, 0.5215592, 0.7777383, 0.4588235, 0, 1, 1,
0.6294174, 0.9866564, 0.9482636, 0.4627451, 0, 1, 1,
0.6297686, 0.6425934, 0.677687, 0.4705882, 0, 1, 1,
0.6317199, -1.885884, 3.358024, 0.4745098, 0, 1, 1,
0.6348221, 0.4428191, 0.1242555, 0.4823529, 0, 1, 1,
0.6353553, -0.9358141, 3.091629, 0.4862745, 0, 1, 1,
0.63783, -1.780942, 1.908181, 0.4941176, 0, 1, 1,
0.6464256, 1.095209, 0.259676, 0.5019608, 0, 1, 1,
0.6508511, 0.2933544, 2.511511, 0.5058824, 0, 1, 1,
0.6648529, -1.030797, 3.714644, 0.5137255, 0, 1, 1,
0.6655043, -0.436794, 1.848228, 0.5176471, 0, 1, 1,
0.6672319, -1.74412, 1.317088, 0.5254902, 0, 1, 1,
0.6703492, 0.44174, -0.5508152, 0.5294118, 0, 1, 1,
0.6741155, -0.9140812, 3.472121, 0.5372549, 0, 1, 1,
0.6774767, 1.308627, 0.04885068, 0.5411765, 0, 1, 1,
0.6818792, -0.7737117, 2.642867, 0.5490196, 0, 1, 1,
0.6850209, 0.7306104, -0.5593288, 0.5529412, 0, 1, 1,
0.6863831, -2.460656, 3.441987, 0.5607843, 0, 1, 1,
0.6901906, 1.313511, -0.1140937, 0.5647059, 0, 1, 1,
0.6936501, -0.09612947, 1.661055, 0.572549, 0, 1, 1,
0.6952172, -1.734802, 0.7439163, 0.5764706, 0, 1, 1,
0.6992689, 1.084334, -0.06563555, 0.5843138, 0, 1, 1,
0.7000706, -0.3338174, 2.111346, 0.5882353, 0, 1, 1,
0.7018856, -0.424661, 1.912989, 0.5960785, 0, 1, 1,
0.7063531, -0.693294, 1.903775, 0.6039216, 0, 1, 1,
0.7202259, 1.291776, 0.6596455, 0.6078432, 0, 1, 1,
0.7223973, 0.7053174, 0.1560373, 0.6156863, 0, 1, 1,
0.7255731, 1.803179, 1.163683, 0.6196079, 0, 1, 1,
0.7262428, -0.8098028, 1.246729, 0.627451, 0, 1, 1,
0.7263676, 0.5824127, 0.796372, 0.6313726, 0, 1, 1,
0.7265529, 0.2262026, 2.045898, 0.6392157, 0, 1, 1,
0.7270838, 0.9926207, 3.34739, 0.6431373, 0, 1, 1,
0.7296297, 0.1844326, 1.154117, 0.6509804, 0, 1, 1,
0.7324397, 0.05837622, 3.060988, 0.654902, 0, 1, 1,
0.7345696, 0.937892, 1.737903, 0.6627451, 0, 1, 1,
0.7383161, 1.20872, -0.1193525, 0.6666667, 0, 1, 1,
0.7385061, -0.4875725, 1.825949, 0.6745098, 0, 1, 1,
0.7420309, -1.561817, 2.04485, 0.6784314, 0, 1, 1,
0.7446728, -1.641165, 2.219573, 0.6862745, 0, 1, 1,
0.745914, 1.328264, 1.694066, 0.6901961, 0, 1, 1,
0.747978, -0.3162715, 0.8317851, 0.6980392, 0, 1, 1,
0.7524408, 1.553989, -0.1468609, 0.7058824, 0, 1, 1,
0.7530527, -0.566566, 2.043283, 0.7098039, 0, 1, 1,
0.7606443, -1.724186, 2.368712, 0.7176471, 0, 1, 1,
0.7632071, 0.6514105, 1.282855, 0.7215686, 0, 1, 1,
0.7632376, -1.062546, 3.697018, 0.7294118, 0, 1, 1,
0.7690726, -0.055579, 1.328965, 0.7333333, 0, 1, 1,
0.7705192, -0.9237257, 2.708577, 0.7411765, 0, 1, 1,
0.7707927, -0.4827578, 1.632807, 0.7450981, 0, 1, 1,
0.7730593, -0.3685176, -0.02902848, 0.7529412, 0, 1, 1,
0.774389, -0.5666184, 1.463843, 0.7568628, 0, 1, 1,
0.7875944, 0.01569558, 2.206813, 0.7647059, 0, 1, 1,
0.7886095, -0.2847281, 0.691365, 0.7686275, 0, 1, 1,
0.7917751, 1.304741, 0.2262123, 0.7764706, 0, 1, 1,
0.7920685, -0.7855791, 1.868275, 0.7803922, 0, 1, 1,
0.7992302, 0.7592623, 1.198225, 0.7882353, 0, 1, 1,
0.8003973, 0.2616971, 2.716577, 0.7921569, 0, 1, 1,
0.8082587, -0.2987897, 0.8748089, 0.8, 0, 1, 1,
0.8089613, -1.283884, 2.364385, 0.8078431, 0, 1, 1,
0.8119047, 0.5209439, 0.9058872, 0.8117647, 0, 1, 1,
0.8124388, -1.546654, 1.939581, 0.8196079, 0, 1, 1,
0.8178834, 0.6787347, 2.007865, 0.8235294, 0, 1, 1,
0.823042, -0.9924879, 1.618764, 0.8313726, 0, 1, 1,
0.8253372, -0.1727628, 3.071672, 0.8352941, 0, 1, 1,
0.8326697, -1.026558, 1.206784, 0.8431373, 0, 1, 1,
0.8360083, -0.3091489, -0.5897989, 0.8470588, 0, 1, 1,
0.8436477, -1.43769, 1.289682, 0.854902, 0, 1, 1,
0.8459017, -0.4263495, 3.172643, 0.8588235, 0, 1, 1,
0.8484671, -0.2233001, 2.37833, 0.8666667, 0, 1, 1,
0.8547216, 0.4258759, 0.8365052, 0.8705882, 0, 1, 1,
0.85958, 0.07876512, 2.303959, 0.8784314, 0, 1, 1,
0.8605469, -1.424753, 3.145708, 0.8823529, 0, 1, 1,
0.8681145, -0.1400457, 3.30921, 0.8901961, 0, 1, 1,
0.8709428, 0.5705488, -0.601164, 0.8941177, 0, 1, 1,
0.874093, -0.1383521, 0.888929, 0.9019608, 0, 1, 1,
0.8782354, -0.9711581, 2.641286, 0.9098039, 0, 1, 1,
0.8803943, 2.086812, 0.601245, 0.9137255, 0, 1, 1,
0.8817459, -0.2123936, 0.3057667, 0.9215686, 0, 1, 1,
0.887824, -0.2576078, 3.011316, 0.9254902, 0, 1, 1,
0.8880545, -0.423981, 1.735304, 0.9333333, 0, 1, 1,
0.8884355, 1.085111, 0.01446038, 0.9372549, 0, 1, 1,
0.8953001, -0.7177764, 2.264662, 0.945098, 0, 1, 1,
0.8971638, -0.7551822, 2.5667, 0.9490196, 0, 1, 1,
0.9075232, 0.7069314, 1.227487, 0.9568627, 0, 1, 1,
0.9128274, 0.3656509, -0.05059598, 0.9607843, 0, 1, 1,
0.922142, 1.236867, 0.4157148, 0.9686275, 0, 1, 1,
0.9272993, 1.639568, 0.76512, 0.972549, 0, 1, 1,
0.9313122, -1.459751, 3.241639, 0.9803922, 0, 1, 1,
0.9406403, -0.9546948, 3.285206, 0.9843137, 0, 1, 1,
0.9410995, 0.5822831, 1.417724, 0.9921569, 0, 1, 1,
0.9535685, -0.3895141, 2.366698, 0.9960784, 0, 1, 1,
0.9546722, 0.5871843, 1.032982, 1, 0, 0.9960784, 1,
0.9592258, 0.5901534, 0.5703121, 1, 0, 0.9882353, 1,
0.9687083, 0.4107544, 0.1675533, 1, 0, 0.9843137, 1,
0.9784512, -1.762522, 2.243129, 1, 0, 0.9764706, 1,
0.9801035, 0.2911971, 2.148843, 1, 0, 0.972549, 1,
0.9865347, -0.7367004, 1.543679, 1, 0, 0.9647059, 1,
0.9909285, 0.4432, -0.1204964, 1, 0, 0.9607843, 1,
0.9953569, -0.5314518, 2.587903, 1, 0, 0.9529412, 1,
0.995729, 0.354928, 2.91847, 1, 0, 0.9490196, 1,
1.003816, -1.185157, 3.054645, 1, 0, 0.9411765, 1,
1.006344, -0.2339005, 1.974463, 1, 0, 0.9372549, 1,
1.01101, -1.254149, 2.309808, 1, 0, 0.9294118, 1,
1.018087, 0.03071214, 2.012319, 1, 0, 0.9254902, 1,
1.019286, -0.512937, 0.9686094, 1, 0, 0.9176471, 1,
1.024124, 0.2070724, 0.6083654, 1, 0, 0.9137255, 1,
1.042977, 0.6334494, 1.263311, 1, 0, 0.9058824, 1,
1.050558, 0.279799, 0.5110219, 1, 0, 0.9019608, 1,
1.051045, 1.050386, 0.6273928, 1, 0, 0.8941177, 1,
1.052448, 0.702489, 0.800529, 1, 0, 0.8862745, 1,
1.057048, 0.4032217, 1.905683, 1, 0, 0.8823529, 1,
1.057502, 0.7325669, 0.6673988, 1, 0, 0.8745098, 1,
1.059566, 0.4210246, 0.685282, 1, 0, 0.8705882, 1,
1.059806, -1.994291, 3.37822, 1, 0, 0.8627451, 1,
1.061715, 1.485186, 0.1875138, 1, 0, 0.8588235, 1,
1.077463, -0.1250842, 1.615703, 1, 0, 0.8509804, 1,
1.087704, 2.403689, -0.8472476, 1, 0, 0.8470588, 1,
1.096162, 0.3400474, 2.040424, 1, 0, 0.8392157, 1,
1.099544, -0.5029072, 4.312922, 1, 0, 0.8352941, 1,
1.100122, -1.47413, 4.370234, 1, 0, 0.827451, 1,
1.115758, 0.08655416, 0.7242108, 1, 0, 0.8235294, 1,
1.121818, -0.04796113, 2.224463, 1, 0, 0.8156863, 1,
1.122457, -0.348272, 3.809512, 1, 0, 0.8117647, 1,
1.131897, -0.1574634, 1.836806, 1, 0, 0.8039216, 1,
1.137656, -0.5053082, 2.570669, 1, 0, 0.7960784, 1,
1.140571, 0.5480184, 1.374338, 1, 0, 0.7921569, 1,
1.141639, -1.528244, 2.035602, 1, 0, 0.7843137, 1,
1.147779, 0.9331233, 1.352779, 1, 0, 0.7803922, 1,
1.163949, 0.9773853, 1.986102, 1, 0, 0.772549, 1,
1.168662, 0.1519034, 2.044266, 1, 0, 0.7686275, 1,
1.170204, 1.217645, 2.054595, 1, 0, 0.7607843, 1,
1.171864, -0.3441763, 1.721485, 1, 0, 0.7568628, 1,
1.176073, 1.11677, -1.68686, 1, 0, 0.7490196, 1,
1.176822, -2.874949, 2.94503, 1, 0, 0.7450981, 1,
1.185922, -0.1212316, 3.783712, 1, 0, 0.7372549, 1,
1.189704, 1.541501, 0.5568061, 1, 0, 0.7333333, 1,
1.191236, 1.876758, -1.090911, 1, 0, 0.7254902, 1,
1.200425, 0.98481, 3.166135, 1, 0, 0.7215686, 1,
1.200645, 0.07867961, 2.153912, 1, 0, 0.7137255, 1,
1.201579, -0.459423, -0.3387849, 1, 0, 0.7098039, 1,
1.204315, -0.2858958, 1.960569, 1, 0, 0.7019608, 1,
1.205382, 0.3634121, 1.595769, 1, 0, 0.6941177, 1,
1.206681, -0.2313875, 3.366515, 1, 0, 0.6901961, 1,
1.20777, 0.09227465, 1.196419, 1, 0, 0.682353, 1,
1.208759, 0.3717752, 1.861248, 1, 0, 0.6784314, 1,
1.209388, 2.003733, 0.266346, 1, 0, 0.6705883, 1,
1.212523, 0.4751778, 1.227053, 1, 0, 0.6666667, 1,
1.224965, -0.1133525, 1.853759, 1, 0, 0.6588235, 1,
1.226183, -0.3598318, 2.434179, 1, 0, 0.654902, 1,
1.229732, -0.4590693, 3.36807, 1, 0, 0.6470588, 1,
1.230961, -0.8633078, 3.422946, 1, 0, 0.6431373, 1,
1.237473, -0.9584339, 1.520666, 1, 0, 0.6352941, 1,
1.237749, -0.6154145, 0.4508997, 1, 0, 0.6313726, 1,
1.238559, -0.9454097, 2.548844, 1, 0, 0.6235294, 1,
1.26592, -1.931806, 1.649835, 1, 0, 0.6196079, 1,
1.271935, -0.8944277, 2.621884, 1, 0, 0.6117647, 1,
1.272889, -0.7901076, 1.508419, 1, 0, 0.6078432, 1,
1.275519, 0.5266215, 1.281561, 1, 0, 0.6, 1,
1.276163, 0.3183069, 1.441616, 1, 0, 0.5921569, 1,
1.297555, -0.1220074, 0.5394477, 1, 0, 0.5882353, 1,
1.30359, 0.01891875, 0.5501208, 1, 0, 0.5803922, 1,
1.304506, -0.61637, 0.6862069, 1, 0, 0.5764706, 1,
1.308902, 0.4736527, 0.4002222, 1, 0, 0.5686275, 1,
1.310846, -1.061605, 1.085916, 1, 0, 0.5647059, 1,
1.312924, 0.0465748, 0.7420452, 1, 0, 0.5568628, 1,
1.320929, 0.1879074, 1.868337, 1, 0, 0.5529412, 1,
1.327196, -1.013581, 1.682754, 1, 0, 0.5450981, 1,
1.339409, 0.8189029, 3.21492, 1, 0, 0.5411765, 1,
1.340083, -0.5148018, 2.584004, 1, 0, 0.5333334, 1,
1.343549, -1.440394, 3.122286, 1, 0, 0.5294118, 1,
1.346121, 0.4919081, 0.3834337, 1, 0, 0.5215687, 1,
1.347425, 0.9511588, 2.282024, 1, 0, 0.5176471, 1,
1.352782, 0.5025956, -0.4172722, 1, 0, 0.509804, 1,
1.35676, 0.2393968, 1.021813, 1, 0, 0.5058824, 1,
1.365544, 0.9711505, 1.072454, 1, 0, 0.4980392, 1,
1.365746, 0.1162395, 1.530246, 1, 0, 0.4901961, 1,
1.365982, 1.528136, 2.332517, 1, 0, 0.4862745, 1,
1.383855, -0.2665502, 1.412582, 1, 0, 0.4784314, 1,
1.390734, -1.207311, 1.968171, 1, 0, 0.4745098, 1,
1.394074, -1.813684, 1.348812, 1, 0, 0.4666667, 1,
1.394837, -2.261464, 2.920603, 1, 0, 0.4627451, 1,
1.409817, -0.2413722, 1.751896, 1, 0, 0.454902, 1,
1.412945, 0.9660853, 1.646514, 1, 0, 0.4509804, 1,
1.415266, 0.3671028, 0.9675475, 1, 0, 0.4431373, 1,
1.421383, -0.1202266, 3.881193, 1, 0, 0.4392157, 1,
1.421794, -0.6295233, 2.735444, 1, 0, 0.4313726, 1,
1.422276, -0.2500312, 3.241751, 1, 0, 0.427451, 1,
1.423765, -0.2235934, 2.183505, 1, 0, 0.4196078, 1,
1.446561, -1.497617, 2.795979, 1, 0, 0.4156863, 1,
1.469715, -1.520088, 3.303679, 1, 0, 0.4078431, 1,
1.480776, -0.2771513, 1.87297, 1, 0, 0.4039216, 1,
1.481577, 0.04520004, 0.7262138, 1, 0, 0.3960784, 1,
1.489844, -0.5851511, 2.727872, 1, 0, 0.3882353, 1,
1.498463, -1.608517, 1.069975, 1, 0, 0.3843137, 1,
1.503689, -0.117222, 2.050154, 1, 0, 0.3764706, 1,
1.507106, -0.2640016, 1.764292, 1, 0, 0.372549, 1,
1.512603, 0.46548, 1.680995, 1, 0, 0.3647059, 1,
1.517591, 0.2499662, 1.870973, 1, 0, 0.3607843, 1,
1.518634, 0.9689291, 2.158214, 1, 0, 0.3529412, 1,
1.519048, 0.7658873, 1.857659, 1, 0, 0.3490196, 1,
1.520749, 0.4783596, 0.3738009, 1, 0, 0.3411765, 1,
1.522193, 0.08952666, 2.06521, 1, 0, 0.3372549, 1,
1.524114, -0.7359166, 3.196625, 1, 0, 0.3294118, 1,
1.528919, -0.7342826, 2.353515, 1, 0, 0.3254902, 1,
1.534806, 0.8772418, 1.474631, 1, 0, 0.3176471, 1,
1.544164, 0.2591351, 2.402872, 1, 0, 0.3137255, 1,
1.557786, -0.4456949, 1.256026, 1, 0, 0.3058824, 1,
1.558794, 0.5945991, 2.274282, 1, 0, 0.2980392, 1,
1.560489, 0.6918753, 0.7703217, 1, 0, 0.2941177, 1,
1.583736, 0.2677073, 0.2866114, 1, 0, 0.2862745, 1,
1.604784, 0.2348162, 2.315323, 1, 0, 0.282353, 1,
1.606221, -0.7856479, 3.780587, 1, 0, 0.2745098, 1,
1.612053, -0.9325462, 3.4582, 1, 0, 0.2705882, 1,
1.628138, 1.336665, 1.74802, 1, 0, 0.2627451, 1,
1.640949, -1.314915, 3.638372, 1, 0, 0.2588235, 1,
1.643287, -1.338383, 2.559555, 1, 0, 0.2509804, 1,
1.65261, -1.96583, 2.440197, 1, 0, 0.2470588, 1,
1.657663, 0.7126412, 1.679042, 1, 0, 0.2392157, 1,
1.665584, -0.966104, 1.773803, 1, 0, 0.2352941, 1,
1.691374, -0.1777519, 1.146351, 1, 0, 0.227451, 1,
1.716309, -0.05741921, 2.480157, 1, 0, 0.2235294, 1,
1.728469, -0.8948178, 2.262063, 1, 0, 0.2156863, 1,
1.738252, 0.4960226, 1.998149, 1, 0, 0.2117647, 1,
1.746193, 0.87832, 1.330233, 1, 0, 0.2039216, 1,
1.756565, -0.3551724, 3.787495, 1, 0, 0.1960784, 1,
1.770401, 2.343592, 2.286029, 1, 0, 0.1921569, 1,
1.778403, -0.6082883, 3.464027, 1, 0, 0.1843137, 1,
1.783882, -0.08369333, 2.828452, 1, 0, 0.1803922, 1,
1.805488, -1.418913, 2.706766, 1, 0, 0.172549, 1,
1.807927, 2.506103, -0.7388309, 1, 0, 0.1686275, 1,
1.832333, 0.3219156, 0.2227158, 1, 0, 0.1607843, 1,
1.832551, -0.1035382, 2.544577, 1, 0, 0.1568628, 1,
1.839296, -1.259265, 2.840254, 1, 0, 0.1490196, 1,
1.842362, 0.2558553, 1.935208, 1, 0, 0.145098, 1,
1.858109, 0.2983439, 0.9226046, 1, 0, 0.1372549, 1,
1.868919, 0.8453997, 1.109006, 1, 0, 0.1333333, 1,
1.890163, 0.5028384, 1.09771, 1, 0, 0.1254902, 1,
1.919978, 0.5950479, 1.60249, 1, 0, 0.1215686, 1,
1.937075, -0.2487242, 2.135042, 1, 0, 0.1137255, 1,
1.948756, 0.6229122, 2.539379, 1, 0, 0.1098039, 1,
1.954134, 0.5298482, 1.19734, 1, 0, 0.1019608, 1,
2.007638, 0.8512467, 1.619889, 1, 0, 0.09411765, 1,
2.014251, 1.947249, -0.1619885, 1, 0, 0.09019608, 1,
2.01876, 0.1507988, 1.392534, 1, 0, 0.08235294, 1,
2.048083, -0.07174049, 2.127616, 1, 0, 0.07843138, 1,
2.121832, -1.219169, 1.643035, 1, 0, 0.07058824, 1,
2.136243, -1.154226, 1.270382, 1, 0, 0.06666667, 1,
2.157757, -1.349047, 1.584864, 1, 0, 0.05882353, 1,
2.179562, -0.2593711, 2.538892, 1, 0, 0.05490196, 1,
2.2108, 1.545359, 1.056557, 1, 0, 0.04705882, 1,
2.234265, -0.8417964, 1.826966, 1, 0, 0.04313726, 1,
2.301974, 1.35409, 2.366779, 1, 0, 0.03529412, 1,
2.402139, -0.6901829, 1.159861, 1, 0, 0.03137255, 1,
2.441974, 1.601686, 0.8020403, 1, 0, 0.02352941, 1,
2.869999, -2.386785, 4.50009, 1, 0, 0.01960784, 1,
2.918411, 1.129507, -0.3664613, 1, 0, 0.01176471, 1,
3.826196, 0.005033943, 2.196446, 1, 0, 0.007843138, 1
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
0.4720622, -4.291053, -7.219201, 0, -0.5, 0.5, 0.5,
0.4720622, -4.291053, -7.219201, 1, -0.5, 0.5, 0.5,
0.4720622, -4.291053, -7.219201, 1, 1.5, 0.5, 0.5,
0.4720622, -4.291053, -7.219201, 0, 1.5, 0.5, 0.5
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
-4.019124, -0.01078963, -7.219201, 0, -0.5, 0.5, 0.5,
-4.019124, -0.01078963, -7.219201, 1, -0.5, 0.5, 0.5,
-4.019124, -0.01078963, -7.219201, 1, 1.5, 0.5, 0.5,
-4.019124, -0.01078963, -7.219201, 0, 1.5, 0.5, 0.5
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
-4.019124, -4.291053, 0.2826343, 0, -0.5, 0.5, 0.5,
-4.019124, -4.291053, 0.2826343, 1, -0.5, 0.5, 0.5,
-4.019124, -4.291053, 0.2826343, 1, 1.5, 0.5, 0.5,
-4.019124, -4.291053, 0.2826343, 0, 1.5, 0.5, 0.5
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
-2, -3.3033, -5.488008,
3, -3.3033, -5.488008,
-2, -3.3033, -5.488008,
-2, -3.467925, -5.776541,
-1, -3.3033, -5.488008,
-1, -3.467925, -5.776541,
0, -3.3033, -5.488008,
0, -3.467925, -5.776541,
1, -3.3033, -5.488008,
1, -3.467925, -5.776541,
2, -3.3033, -5.488008,
2, -3.467925, -5.776541,
3, -3.3033, -5.488008,
3, -3.467925, -5.776541
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
-2, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
-2, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
-2, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
-2, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5,
-1, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
-1, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
-1, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
-1, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5,
0, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
0, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
0, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
0, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5,
1, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
1, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
1, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
1, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5,
2, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
2, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
2, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
2, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5,
3, -3.797176, -6.353605, 0, -0.5, 0.5, 0.5,
3, -3.797176, -6.353605, 1, -0.5, 0.5, 0.5,
3, -3.797176, -6.353605, 1, 1.5, 0.5, 0.5,
3, -3.797176, -6.353605, 0, 1.5, 0.5, 0.5
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
-2.982696, -3, -5.488008,
-2.982696, 3, -5.488008,
-2.982696, -3, -5.488008,
-3.155434, -3, -5.776541,
-2.982696, -2, -5.488008,
-3.155434, -2, -5.776541,
-2.982696, -1, -5.488008,
-3.155434, -1, -5.776541,
-2.982696, 0, -5.488008,
-3.155434, 0, -5.776541,
-2.982696, 1, -5.488008,
-3.155434, 1, -5.776541,
-2.982696, 2, -5.488008,
-3.155434, 2, -5.776541,
-2.982696, 3, -5.488008,
-3.155434, 3, -5.776541
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
-3.50091, -3, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, -3, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, -3, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, -3, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, -2, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, -2, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, -2, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, -2, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, -1, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, -1, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, -1, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, -1, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, 0, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, 0, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, 0, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, 0, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, 1, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, 1, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, 1, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, 1, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, 2, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, 2, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, 2, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, 2, -6.353605, 0, 1.5, 0.5, 0.5,
-3.50091, 3, -6.353605, 0, -0.5, 0.5, 0.5,
-3.50091, 3, -6.353605, 1, -0.5, 0.5, 0.5,
-3.50091, 3, -6.353605, 1, 1.5, 0.5, 0.5,
-3.50091, 3, -6.353605, 0, 1.5, 0.5, 0.5
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
-2.982696, -3.3033, -4,
-2.982696, -3.3033, 4,
-2.982696, -3.3033, -4,
-3.155434, -3.467925, -4,
-2.982696, -3.3033, -2,
-3.155434, -3.467925, -2,
-2.982696, -3.3033, 0,
-3.155434, -3.467925, 0,
-2.982696, -3.3033, 2,
-3.155434, -3.467925, 2,
-2.982696, -3.3033, 4,
-3.155434, -3.467925, 4
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
-3.50091, -3.797176, -4, 0, -0.5, 0.5, 0.5,
-3.50091, -3.797176, -4, 1, -0.5, 0.5, 0.5,
-3.50091, -3.797176, -4, 1, 1.5, 0.5, 0.5,
-3.50091, -3.797176, -4, 0, 1.5, 0.5, 0.5,
-3.50091, -3.797176, -2, 0, -0.5, 0.5, 0.5,
-3.50091, -3.797176, -2, 1, -0.5, 0.5, 0.5,
-3.50091, -3.797176, -2, 1, 1.5, 0.5, 0.5,
-3.50091, -3.797176, -2, 0, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 0, 0, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 0, 1, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 0, 1, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 0, 0, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 2, 0, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 2, 1, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 2, 1, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 2, 0, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 4, 0, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 4, 1, -0.5, 0.5, 0.5,
-3.50091, -3.797176, 4, 1, 1.5, 0.5, 0.5,
-3.50091, -3.797176, 4, 0, 1.5, 0.5, 0.5
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
-2.982696, -3.3033, -5.488008,
-2.982696, 3.28172, -5.488008,
-2.982696, -3.3033, 6.053277,
-2.982696, 3.28172, 6.053277,
-2.982696, -3.3033, -5.488008,
-2.982696, -3.3033, 6.053277,
-2.982696, 3.28172, -5.488008,
-2.982696, 3.28172, 6.053277,
-2.982696, -3.3033, -5.488008,
3.926821, -3.3033, -5.488008,
-2.982696, -3.3033, 6.053277,
3.926821, -3.3033, 6.053277,
-2.982696, 3.28172, -5.488008,
3.926821, 3.28172, -5.488008,
-2.982696, 3.28172, 6.053277,
3.926821, 3.28172, 6.053277,
3.926821, -3.3033, -5.488008,
3.926821, 3.28172, -5.488008,
3.926821, -3.3033, 6.053277,
3.926821, 3.28172, 6.053277,
3.926821, -3.3033, -5.488008,
3.926821, -3.3033, 6.053277,
3.926821, 3.28172, -5.488008,
3.926821, 3.28172, 6.053277
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
var radius = 7.997332;
var distance = 35.58104;
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
mvMatrix.translate( -0.4720622, 0.01078963, -0.2826343 );
mvMatrix.scale( 1.251444, 1.313112, 0.7492122 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58104);
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
fenoxaprop-P<-read.table("fenoxaprop-P.xyz")
```

```
## Error in read.table("fenoxaprop-P.xyz"): no lines available in input
```

```r
x<-fenoxaprop-P$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
y<-fenoxaprop-P$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
z<-fenoxaprop-P$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
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
-2.882072, 0.0629502, -0.7970486, 0, 0, 1, 1, 1,
-2.859885, -0.4123888, -4.123443, 1, 0, 0, 1, 1,
-2.772191, 0.5403531, -1.777775, 1, 0, 0, 1, 1,
-2.591087, 0.06146123, -2.971708, 1, 0, 0, 1, 1,
-2.37437, -0.5249199, -1.160054, 1, 0, 0, 1, 1,
-2.336553, 0.4820103, 0.6434847, 1, 0, 0, 1, 1,
-2.249088, 0.2048418, -3.533606, 0, 0, 0, 1, 1,
-2.243296, 0.6971616, -0.1697026, 0, 0, 0, 1, 1,
-2.227113, -0.8862684, -0.1736949, 0, 0, 0, 1, 1,
-2.204149, 1.383483, -1.00441, 0, 0, 0, 1, 1,
-2.169428, 0.635144, -1.284032, 0, 0, 0, 1, 1,
-2.116172, 0.8984469, 0.4058226, 0, 0, 0, 1, 1,
-2.114529, 1.215904, -2.56358, 0, 0, 0, 1, 1,
-2.084372, 0.2573074, -1.85659, 1, 1, 1, 1, 1,
-2.084346, 0.4010513, -1.529709, 1, 1, 1, 1, 1,
-2.022723, -1.299372, -1.332612, 1, 1, 1, 1, 1,
-2.022604, 1.588277, -1.157589, 1, 1, 1, 1, 1,
-2.016841, -0.367489, -1.418956, 1, 1, 1, 1, 1,
-2.006693, 0.4258156, -1.311579, 1, 1, 1, 1, 1,
-1.948676, -0.2346338, -2.565048, 1, 1, 1, 1, 1,
-1.936864, 0.6526288, 0.5012633, 1, 1, 1, 1, 1,
-1.924478, -0.7536643, -2.497456, 1, 1, 1, 1, 1,
-1.906885, -0.8063024, 0.4604487, 1, 1, 1, 1, 1,
-1.90482, 1.446568, -2.016975, 1, 1, 1, 1, 1,
-1.890892, 0.406969, -1.622898, 1, 1, 1, 1, 1,
-1.887942, 1.256156, -0.8473132, 1, 1, 1, 1, 1,
-1.872822, 1.146395, -0.03297029, 1, 1, 1, 1, 1,
-1.870492, -0.5488153, -3.040627, 1, 1, 1, 1, 1,
-1.868785, 0.04465882, -2.10522, 0, 0, 1, 1, 1,
-1.860642, 1.956824, -0.9665926, 1, 0, 0, 1, 1,
-1.828052, -0.1760097, -1.584308, 1, 0, 0, 1, 1,
-1.815812, 1.5362, -1.585192, 1, 0, 0, 1, 1,
-1.809525, -1.334996, -2.431719, 1, 0, 0, 1, 1,
-1.801465, 1.320662, -0.7428864, 1, 0, 0, 1, 1,
-1.79126, -0.957048, -0.8755853, 0, 0, 0, 1, 1,
-1.762407, 0.3268014, 0.5051174, 0, 0, 0, 1, 1,
-1.740806, 0.3819211, 0.2258921, 0, 0, 0, 1, 1,
-1.70495, 0.3261114, 0.6960856, 0, 0, 0, 1, 1,
-1.688523, -0.06140132, -2.186609, 0, 0, 0, 1, 1,
-1.687481, -0.8663892, -1.617216, 0, 0, 0, 1, 1,
-1.686743, 1.258476, -2.880785, 0, 0, 0, 1, 1,
-1.679821, 1.25043, 0.3420518, 1, 1, 1, 1, 1,
-1.67946, 1.061543, -2.588072, 1, 1, 1, 1, 1,
-1.66351, -0.1967091, -1.320779, 1, 1, 1, 1, 1,
-1.658978, -0.2465473, -1.340741, 1, 1, 1, 1, 1,
-1.658692, -0.61468, -1.753599, 1, 1, 1, 1, 1,
-1.658269, -0.2596676, -1.659071, 1, 1, 1, 1, 1,
-1.656721, 0.8215535, -2.754299, 1, 1, 1, 1, 1,
-1.645034, -1.478398, -1.614121, 1, 1, 1, 1, 1,
-1.630956, 0.2598503, -1.416143, 1, 1, 1, 1, 1,
-1.611696, 1.511844, -0.871992, 1, 1, 1, 1, 1,
-1.594535, 0.9948859, -0.7177948, 1, 1, 1, 1, 1,
-1.592013, 1.155432, -0.4052925, 1, 1, 1, 1, 1,
-1.58961, -2.153933, -2.974266, 1, 1, 1, 1, 1,
-1.584993, 0.5526709, 0.2114452, 1, 1, 1, 1, 1,
-1.579226, 1.227787, -0.9729164, 1, 1, 1, 1, 1,
-1.573115, 1.668351, -1.266686, 0, 0, 1, 1, 1,
-1.570747, 0.8232441, -1.013781, 1, 0, 0, 1, 1,
-1.566634, -0.2148009, -1.067554, 1, 0, 0, 1, 1,
-1.564725, -0.0454637, -1.584095, 1, 0, 0, 1, 1,
-1.556726, 1.824544, -0.1746429, 1, 0, 0, 1, 1,
-1.55619, -0.04517629, -1.710678, 1, 0, 0, 1, 1,
-1.553954, 1.310035, -2.364193, 0, 0, 0, 1, 1,
-1.53393, -0.01701666, -2.231334, 0, 0, 0, 1, 1,
-1.527515, -0.6895926, -0.5892125, 0, 0, 0, 1, 1,
-1.52263, -0.9873988, -3.497319, 0, 0, 0, 1, 1,
-1.51912, 0.7121223, -0.6431938, 0, 0, 0, 1, 1,
-1.517709, 1.09158, -1.372711, 0, 0, 0, 1, 1,
-1.515676, -1.326392, -3.287823, 0, 0, 0, 1, 1,
-1.500517, -0.7206316, -3.865372, 1, 1, 1, 1, 1,
-1.491392, -0.9507983, -3.65583, 1, 1, 1, 1, 1,
-1.48902, -1.056154, -2.224052, 1, 1, 1, 1, 1,
-1.482925, 0.0793643, -3.400266, 1, 1, 1, 1, 1,
-1.479351, -0.1997084, -2.667722, 1, 1, 1, 1, 1,
-1.474164, 0.3103115, 0.6968215, 1, 1, 1, 1, 1,
-1.470672, 0.4998638, -1.51265, 1, 1, 1, 1, 1,
-1.466223, 3.185822, 0.4628861, 1, 1, 1, 1, 1,
-1.462818, 0.6789649, -0.5601043, 1, 1, 1, 1, 1,
-1.453545, 0.03716467, -1.220984, 1, 1, 1, 1, 1,
-1.453358, -1.002118, -0.8922946, 1, 1, 1, 1, 1,
-1.452538, -0.3781404, -1.831046, 1, 1, 1, 1, 1,
-1.44891, 0.02417587, -2.664355, 1, 1, 1, 1, 1,
-1.444751, 0.3754812, -0.2901373, 1, 1, 1, 1, 1,
-1.44451, 0.9926298, -1.151322, 1, 1, 1, 1, 1,
-1.441208, 1.160372, -1.44231, 0, 0, 1, 1, 1,
-1.439213, -0.2043693, -0.8363845, 1, 0, 0, 1, 1,
-1.438639, -0.6302708, -2.774487, 1, 0, 0, 1, 1,
-1.436935, 0.5566704, -2.160833, 1, 0, 0, 1, 1,
-1.434788, 1.750208, -0.7326023, 1, 0, 0, 1, 1,
-1.429191, -0.8805459, -0.3123601, 1, 0, 0, 1, 1,
-1.429031, -0.8448291, -1.913529, 0, 0, 0, 1, 1,
-1.424208, -0.7297795, -2.777999, 0, 0, 0, 1, 1,
-1.413164, -1.174115, -3.109935, 0, 0, 0, 1, 1,
-1.413114, -0.4341102, -0.4858171, 0, 0, 0, 1, 1,
-1.412137, -0.0006099717, -2.119081, 0, 0, 0, 1, 1,
-1.411761, 0.7010819, -1.612337, 0, 0, 0, 1, 1,
-1.409217, -0.9862393, -3.778302, 0, 0, 0, 1, 1,
-1.381149, -1.315903, -2.952842, 1, 1, 1, 1, 1,
-1.379646, -1.136081, -2.424161, 1, 1, 1, 1, 1,
-1.377939, -0.5520045, -1.086333, 1, 1, 1, 1, 1,
-1.375388, -0.138924, -0.5069546, 1, 1, 1, 1, 1,
-1.349132, -0.1963146, -2.922206, 1, 1, 1, 1, 1,
-1.348915, 1.216153, -1.624074, 1, 1, 1, 1, 1,
-1.348793, 0.3694123, -0.1043745, 1, 1, 1, 1, 1,
-1.33108, -0.4364855, -1.956557, 1, 1, 1, 1, 1,
-1.328911, 0.8039006, -0.3008783, 1, 1, 1, 1, 1,
-1.324049, -1.302361, -1.452373, 1, 1, 1, 1, 1,
-1.318831, -0.7567362, -2.905216, 1, 1, 1, 1, 1,
-1.315672, -0.964702, -0.6184946, 1, 1, 1, 1, 1,
-1.292775, 0.1194788, -0.9076494, 1, 1, 1, 1, 1,
-1.290494, 0.07240076, -0.8422967, 1, 1, 1, 1, 1,
-1.266083, 1.11243, -2.241445, 1, 1, 1, 1, 1,
-1.259795, -0.3682243, -2.327755, 0, 0, 1, 1, 1,
-1.252659, -0.470257, -2.733984, 1, 0, 0, 1, 1,
-1.247466, 0.562043, -2.29033, 1, 0, 0, 1, 1,
-1.228861, 1.267534, 0.2252324, 1, 0, 0, 1, 1,
-1.224383, 0.4678286, -1.115469, 1, 0, 0, 1, 1,
-1.222892, 1.014365, -0.9304444, 1, 0, 0, 1, 1,
-1.222012, 0.8073273, -1.796711, 0, 0, 0, 1, 1,
-1.210004, -0.8494265, -2.366436, 0, 0, 0, 1, 1,
-1.202899, 1.170281, -0.1615456, 0, 0, 0, 1, 1,
-1.184143, -1.198284, -2.436197, 0, 0, 0, 1, 1,
-1.183529, -0.09152201, -1.587148, 0, 0, 0, 1, 1,
-1.180651, 0.4007227, -1.766166, 0, 0, 0, 1, 1,
-1.174942, 1.261658, -1.035564, 0, 0, 0, 1, 1,
-1.17249, -0.7131104, -3.65112, 1, 1, 1, 1, 1,
-1.170824, 1.76772, -0.8369808, 1, 1, 1, 1, 1,
-1.167905, 0.532506, -2.504729, 1, 1, 1, 1, 1,
-1.164145, 0.6961527, -0.9060908, 1, 1, 1, 1, 1,
-1.154792, 0.3384909, -1.326185, 1, 1, 1, 1, 1,
-1.149154, 1.408794, -0.9626752, 1, 1, 1, 1, 1,
-1.145999, 1.600552, 3.131568, 1, 1, 1, 1, 1,
-1.143976, 0.2841053, -1.581913, 1, 1, 1, 1, 1,
-1.141863, -0.2541938, -2.004583, 1, 1, 1, 1, 1,
-1.130211, -0.1966402, -0.1905337, 1, 1, 1, 1, 1,
-1.128463, -2.303743, -2.31693, 1, 1, 1, 1, 1,
-1.127005, -0.4223276, -2.008452, 1, 1, 1, 1, 1,
-1.12469, 0.476066, -1.727565, 1, 1, 1, 1, 1,
-1.123606, -0.1540096, -1.984034, 1, 1, 1, 1, 1,
-1.120919, 0.69864, -1.284528, 1, 1, 1, 1, 1,
-1.117952, -0.2207625, -3.253757, 0, 0, 1, 1, 1,
-1.11538, -0.5465925, -1.512719, 1, 0, 0, 1, 1,
-1.113924, 0.9179494, -2.146442, 1, 0, 0, 1, 1,
-1.105942, 0.8336241, -2.781579, 1, 0, 0, 1, 1,
-1.100548, -0.2359521, -1.677929, 1, 0, 0, 1, 1,
-1.099525, 0.1784845, -3.115176, 1, 0, 0, 1, 1,
-1.099265, 0.2292303, -0.6371869, 0, 0, 0, 1, 1,
-1.086539, -1.186073, -1.740442, 0, 0, 0, 1, 1,
-1.083593, -0.587171, -3.318806, 0, 0, 0, 1, 1,
-1.072631, 0.4172024, -0.5834636, 0, 0, 0, 1, 1,
-1.071192, -2.19443, -4.251186, 0, 0, 0, 1, 1,
-1.065552, -0.4227261, -2.85551, 0, 0, 0, 1, 1,
-1.062917, -0.4448747, -1.003394, 0, 0, 0, 1, 1,
-1.052317, 0.740847, -0.4032429, 1, 1, 1, 1, 1,
-1.052014, 0.021708, -0.03019041, 1, 1, 1, 1, 1,
-1.050947, -0.6461256, -2.103002, 1, 1, 1, 1, 1,
-1.04991, -0.8914921, -2.261514, 1, 1, 1, 1, 1,
-1.046253, -1.669529, -3.981586, 1, 1, 1, 1, 1,
-1.041107, -0.402784, -0.8086887, 1, 1, 1, 1, 1,
-1.040634, 0.08153319, -1.597314, 1, 1, 1, 1, 1,
-1.039155, 1.029058, 0.1356727, 1, 1, 1, 1, 1,
-1.037814, -0.8694662, -0.6270071, 1, 1, 1, 1, 1,
-1.036645, -1.945129, -2.404762, 1, 1, 1, 1, 1,
-1.034894, 0.03254995, -1.197115, 1, 1, 1, 1, 1,
-1.03442, -0.6255078, -2.263693, 1, 1, 1, 1, 1,
-1.021209, -0.3671522, -2.071591, 1, 1, 1, 1, 1,
-1.01671, -0.05220984, -3.985553, 1, 1, 1, 1, 1,
-1.012671, 2.160351, -0.6011031, 1, 1, 1, 1, 1,
-1.012143, 1.00483, -0.9107845, 0, 0, 1, 1, 1,
-1.010673, -0.8293613, -3.949548, 1, 0, 0, 1, 1,
-1.010585, -0.4344573, -0.9674454, 1, 0, 0, 1, 1,
-1.009658, 1.742389, 0.04029636, 1, 0, 0, 1, 1,
-0.9942687, -0.6913837, -1.576306, 1, 0, 0, 1, 1,
-0.9818089, 0.7873443, -1.620971, 1, 0, 0, 1, 1,
-0.9710551, 1.307366, 0.862255, 0, 0, 0, 1, 1,
-0.9640949, 0.3770737, -2.110713, 0, 0, 0, 1, 1,
-0.9629837, 1.303255, -1.951036, 0, 0, 0, 1, 1,
-0.9573972, -1.441124, -1.372078, 0, 0, 0, 1, 1,
-0.9520513, 1.229911, -1.502287, 0, 0, 0, 1, 1,
-0.9470092, 0.770269, 0.1181003, 0, 0, 0, 1, 1,
-0.9394189, 1.467824, -1.254521, 0, 0, 0, 1, 1,
-0.9392527, 0.514367, -2.539588, 1, 1, 1, 1, 1,
-0.9349165, -0.4850353, -2.959277, 1, 1, 1, 1, 1,
-0.9314135, 0.4092729, 0.1343255, 1, 1, 1, 1, 1,
-0.9309675, -0.5287415, -1.736034, 1, 1, 1, 1, 1,
-0.9300362, 1.79711, 1.081439, 1, 1, 1, 1, 1,
-0.9283486, 1.399988, -1.361414, 1, 1, 1, 1, 1,
-0.9244263, -0.8914295, -3.155118, 1, 1, 1, 1, 1,
-0.9242328, 1.559381, -0.01196118, 1, 1, 1, 1, 1,
-0.9240897, 1.633026, -0.7439593, 1, 1, 1, 1, 1,
-0.9131681, 0.3040598, -1.715903, 1, 1, 1, 1, 1,
-0.909526, 0.1975454, -0.688908, 1, 1, 1, 1, 1,
-0.9041747, 1.151104, 0.2718109, 1, 1, 1, 1, 1,
-0.9039496, 0.09252132, 1.827012, 1, 1, 1, 1, 1,
-0.9024317, 0.6325762, -0.7134597, 1, 1, 1, 1, 1,
-0.8982807, -0.2952851, -1.874218, 1, 1, 1, 1, 1,
-0.8938869, 0.3485439, -2.208027, 0, 0, 1, 1, 1,
-0.8905447, 1.185016, -0.4463653, 1, 0, 0, 1, 1,
-0.884758, 0.2690569, -0.168003, 1, 0, 0, 1, 1,
-0.8822209, -0.7351892, -1.720202, 1, 0, 0, 1, 1,
-0.880586, 0.4614709, -1.742264, 1, 0, 0, 1, 1,
-0.8783964, -2.20879, -3.908048, 1, 0, 0, 1, 1,
-0.8771481, 0.5712119, 0.4180583, 0, 0, 0, 1, 1,
-0.8755324, 2.147761, 1.385196, 0, 0, 0, 1, 1,
-0.8754399, -0.7088429, -2.816067, 0, 0, 0, 1, 1,
-0.8750939, -0.1696125, -1.89791, 0, 0, 0, 1, 1,
-0.8704365, -1.095157, -2.62282, 0, 0, 0, 1, 1,
-0.8607441, -1.229861, -1.815729, 0, 0, 0, 1, 1,
-0.8501459, 1.820929, -2.164989, 0, 0, 0, 1, 1,
-0.8460611, 1.26261, -0.6470572, 1, 1, 1, 1, 1,
-0.8407375, 0.1268724, -2.658939, 1, 1, 1, 1, 1,
-0.8403785, 0.6446523, -2.250372, 1, 1, 1, 1, 1,
-0.8401847, 0.2792431, -0.7071502, 1, 1, 1, 1, 1,
-0.8388708, -0.1828749, -0.3749256, 1, 1, 1, 1, 1,
-0.8273704, 1.536913, -1.141574, 1, 1, 1, 1, 1,
-0.8263122, -1.932377, -2.173869, 1, 1, 1, 1, 1,
-0.8210784, 0.3065789, -1.151502, 1, 1, 1, 1, 1,
-0.8071413, 0.5836603, -1.241671, 1, 1, 1, 1, 1,
-0.802072, 0.2951696, -2.16598, 1, 1, 1, 1, 1,
-0.7936834, -0.4605979, -0.5633082, 1, 1, 1, 1, 1,
-0.7917101, -1.363409, -3.059341, 1, 1, 1, 1, 1,
-0.7900516, 0.7440513, -1.146048, 1, 1, 1, 1, 1,
-0.7871125, -0.1526263, -2.747471, 1, 1, 1, 1, 1,
-0.7859505, -0.6727289, -3.075201, 1, 1, 1, 1, 1,
-0.7857406, 0.3724806, -1.0217, 0, 0, 1, 1, 1,
-0.7845388, -0.5121706, -2.820251, 1, 0, 0, 1, 1,
-0.7798187, 0.7503638, -2.493797, 1, 0, 0, 1, 1,
-0.773005, -0.9346572, -2.352682, 1, 0, 0, 1, 1,
-0.7720469, 0.3805628, -0.3805653, 1, 0, 0, 1, 1,
-0.7703544, 0.9477518, -1.147955, 1, 0, 0, 1, 1,
-0.7640233, -0.8503017, -2.241023, 0, 0, 0, 1, 1,
-0.7585855, -0.08761715, -2.93453, 0, 0, 0, 1, 1,
-0.7579775, -1.638112, -1.497752, 0, 0, 0, 1, 1,
-0.7556691, -2.357045, -1.237967, 0, 0, 0, 1, 1,
-0.754973, 0.4991983, -0.8311071, 0, 0, 0, 1, 1,
-0.7497665, 0.2899635, -1.267388, 0, 0, 0, 1, 1,
-0.7452011, -1.099116, -3.861121, 0, 0, 0, 1, 1,
-0.7416565, -0.286589, -2.977667, 1, 1, 1, 1, 1,
-0.7401034, 0.5725291, 0.5382798, 1, 1, 1, 1, 1,
-0.7365986, -0.1057539, -1.733367, 1, 1, 1, 1, 1,
-0.7338172, -1.762139, -1.067978, 1, 1, 1, 1, 1,
-0.7328349, -1.558321, -2.298631, 1, 1, 1, 1, 1,
-0.7293488, 0.6516005, -2.22763, 1, 1, 1, 1, 1,
-0.7276456, 0.6955906, 0.3572597, 1, 1, 1, 1, 1,
-0.7248937, -1.092575, -3.502399, 1, 1, 1, 1, 1,
-0.7213382, -0.03557283, -1.454821, 1, 1, 1, 1, 1,
-0.7173627, 1.175552, 1.099139, 1, 1, 1, 1, 1,
-0.7166904, -0.2407988, -1.818627, 1, 1, 1, 1, 1,
-0.7154367, -0.7825649, -0.915688, 1, 1, 1, 1, 1,
-0.7090355, -1.020521, -0.6257147, 1, 1, 1, 1, 1,
-0.7089508, 0.8959734, 0.4910306, 1, 1, 1, 1, 1,
-0.7042158, -0.5537186, -4.147657, 1, 1, 1, 1, 1,
-0.701747, 0.2795923, 0.2843527, 0, 0, 1, 1, 1,
-0.6983849, -0.03399212, -0.600915, 1, 0, 0, 1, 1,
-0.6951523, -1.410792, -3.506279, 1, 0, 0, 1, 1,
-0.6947749, -1.026469, -3.272735, 1, 0, 0, 1, 1,
-0.6911083, 1.071255, -0.3718399, 1, 0, 0, 1, 1,
-0.6860884, 0.5130795, -3.033007, 1, 0, 0, 1, 1,
-0.6848429, -1.162957, -1.23011, 0, 0, 0, 1, 1,
-0.6801051, 0.9663209, -2.057806, 0, 0, 0, 1, 1,
-0.6754001, -1.61072, -1.97956, 0, 0, 0, 1, 1,
-0.6751613, 2.407627, -2.525876, 0, 0, 0, 1, 1,
-0.6744961, 0.2022891, -1.53448, 0, 0, 0, 1, 1,
-0.669055, -0.4416004, -3.420991, 0, 0, 0, 1, 1,
-0.669046, 0.6484779, -0.7428294, 0, 0, 0, 1, 1,
-0.6647301, 0.3617878, -0.7915554, 1, 1, 1, 1, 1,
-0.6612849, -0.02332478, -2.090374, 1, 1, 1, 1, 1,
-0.6553649, -1.143449, -3.741328, 1, 1, 1, 1, 1,
-0.6519575, -0.6237145, -1.736125, 1, 1, 1, 1, 1,
-0.644685, 0.8207131, -0.9936489, 1, 1, 1, 1, 1,
-0.6374314, -0.9263565, -1.283227, 1, 1, 1, 1, 1,
-0.6373698, 0.433538, -0.007953862, 1, 1, 1, 1, 1,
-0.6367303, -0.5591888, -1.275177, 1, 1, 1, 1, 1,
-0.6353899, 0.9072664, -0.5482138, 1, 1, 1, 1, 1,
-0.6316773, -0.9924769, -4.178906, 1, 1, 1, 1, 1,
-0.6289578, 0.9877747, 0.474202, 1, 1, 1, 1, 1,
-0.6287909, 0.8378212, -0.2377261, 1, 1, 1, 1, 1,
-0.6282503, -1.229789, -1.582594, 1, 1, 1, 1, 1,
-0.6252899, 1.002451, -0.2569829, 1, 1, 1, 1, 1,
-0.6182863, 0.6377546, -0.09655965, 1, 1, 1, 1, 1,
-0.6080821, 0.9115566, -0.7043389, 0, 0, 1, 1, 1,
-0.602168, 0.8283416, 1.006399, 1, 0, 0, 1, 1,
-0.5961818, -0.3697682, -4.248048, 1, 0, 0, 1, 1,
-0.5901334, -0.345124, -1.562121, 1, 0, 0, 1, 1,
-0.5894932, -0.234142, -1.753192, 1, 0, 0, 1, 1,
-0.5878196, 0.3300605, -0.6104471, 1, 0, 0, 1, 1,
-0.585581, 0.343875, 0.3703856, 0, 0, 0, 1, 1,
-0.574873, 1.509768, -0.682918, 0, 0, 0, 1, 1,
-0.5713367, -0.4283486, -1.086552, 0, 0, 0, 1, 1,
-0.5700433, -0.01710857, -1.755232, 0, 0, 0, 1, 1,
-0.5700063, -0.4435011, -1.603171, 0, 0, 0, 1, 1,
-0.5616699, 0.1865068, 0.01276851, 0, 0, 0, 1, 1,
-0.5588865, -0.528576, -0.05553078, 0, 0, 0, 1, 1,
-0.5562249, -0.2121141, -3.912307, 1, 1, 1, 1, 1,
-0.5550529, -1.382807, -2.764626, 1, 1, 1, 1, 1,
-0.5537322, -0.4511174, -0.3570753, 1, 1, 1, 1, 1,
-0.5488269, 0.504686, -0.8819312, 1, 1, 1, 1, 1,
-0.5488219, 0.1633537, -1.766817, 1, 1, 1, 1, 1,
-0.5477552, -0.1922175, -3.106883, 1, 1, 1, 1, 1,
-0.5471255, 2.003028, -0.1918642, 1, 1, 1, 1, 1,
-0.5457036, -0.8478669, -2.539341, 1, 1, 1, 1, 1,
-0.545384, 0.5590045, -0.8609764, 1, 1, 1, 1, 1,
-0.5452307, 0.3482188, -1.103059, 1, 1, 1, 1, 1,
-0.5431311, 0.9765388, -0.4040594, 1, 1, 1, 1, 1,
-0.5397255, 0.6310062, -0.5646394, 1, 1, 1, 1, 1,
-0.5380703, -0.9982983, -2.330327, 1, 1, 1, 1, 1,
-0.5315782, 0.3721286, -1.085905, 1, 1, 1, 1, 1,
-0.5314339, 0.7600607, -0.6402048, 1, 1, 1, 1, 1,
-0.5235229, -0.5831642, -3.708858, 0, 0, 1, 1, 1,
-0.5221687, -2.357115, -4.24938, 1, 0, 0, 1, 1,
-0.5216059, 0.596963, -2.46891, 1, 0, 0, 1, 1,
-0.5196723, -1.240923, -2.764432, 1, 0, 0, 1, 1,
-0.5185166, 0.9083955, -1.16587, 1, 0, 0, 1, 1,
-0.5177323, 0.5718114, 1.670611, 1, 0, 0, 1, 1,
-0.5118096, 0.9222258, -0.961154, 0, 0, 0, 1, 1,
-0.5112307, 0.2821991, -1.154119, 0, 0, 0, 1, 1,
-0.5096412, -0.5144523, -1.574663, 0, 0, 0, 1, 1,
-0.5039592, 0.6072719, -1.278123, 0, 0, 0, 1, 1,
-0.5015874, -1.175072, -5.319932, 0, 0, 0, 1, 1,
-0.5013953, 0.7155523, 0.421795, 0, 0, 0, 1, 1,
-0.5005488, -0.5799276, -4.123921, 0, 0, 0, 1, 1,
-0.4998706, 1.128847, -0.2067001, 1, 1, 1, 1, 1,
-0.4992967, 0.223244, -1.34488, 1, 1, 1, 1, 1,
-0.4975226, 1.734814, 0.5675394, 1, 1, 1, 1, 1,
-0.4945811, -0.3253302, -2.787143, 1, 1, 1, 1, 1,
-0.4924044, -0.2985505, -1.437587, 1, 1, 1, 1, 1,
-0.4872442, 1.432245, -0.2959859, 1, 1, 1, 1, 1,
-0.4829628, -0.4566563, -2.033119, 1, 1, 1, 1, 1,
-0.4813322, -0.2081305, -2.628256, 1, 1, 1, 1, 1,
-0.475662, 0.7332831, 0.3269448, 1, 1, 1, 1, 1,
-0.4738121, -0.3171817, -3.846646, 1, 1, 1, 1, 1,
-0.4719423, -1.020352, -3.511515, 1, 1, 1, 1, 1,
-0.470842, 0.8018139, -0.864177, 1, 1, 1, 1, 1,
-0.4593576, 0.7462274, 1.133465, 1, 1, 1, 1, 1,
-0.4552271, 1.317419, -0.8770266, 1, 1, 1, 1, 1,
-0.4511015, -1.485199, -2.696918, 1, 1, 1, 1, 1,
-0.4399576, 1.240364, -0.6326788, 0, 0, 1, 1, 1,
-0.4393599, 1.812468, 1.422061, 1, 0, 0, 1, 1,
-0.4361277, -0.4391336, -0.958013, 1, 0, 0, 1, 1,
-0.4281955, -0.1475298, -1.10499, 1, 0, 0, 1, 1,
-0.4249247, -0.8654363, -4.141961, 1, 0, 0, 1, 1,
-0.4234819, -1.133357, -4.68027, 1, 0, 0, 1, 1,
-0.419111, 0.3771927, -1.588489, 0, 0, 0, 1, 1,
-0.4149272, 0.5845476, -1.141008, 0, 0, 0, 1, 1,
-0.4131296, 0.5194247, -0.07864243, 0, 0, 0, 1, 1,
-0.4122245, -2.203745, -3.100114, 0, 0, 0, 1, 1,
-0.4080665, 0.6467826, -0.4386418, 0, 0, 0, 1, 1,
-0.4076196, -1.577145, -2.567568, 0, 0, 0, 1, 1,
-0.4065458, -0.1639509, -2.181181, 0, 0, 0, 1, 1,
-0.4060492, 0.4328735, -0.8092546, 1, 1, 1, 1, 1,
-0.4034905, -3.037825, -1.135151, 1, 1, 1, 1, 1,
-0.3967514, -0.5201972, -2.506475, 1, 1, 1, 1, 1,
-0.3957205, 0.2895584, -0.5645677, 1, 1, 1, 1, 1,
-0.3951882, 0.748731, -1.492203, 1, 1, 1, 1, 1,
-0.3910323, 0.1097909, -1.750827, 1, 1, 1, 1, 1,
-0.3854094, -0.221504, -2.356964, 1, 1, 1, 1, 1,
-0.3826547, 0.6482848, -1.13525, 1, 1, 1, 1, 1,
-0.3789033, -0.5827668, -1.471572, 1, 1, 1, 1, 1,
-0.3780774, -0.4116087, -1.477766, 1, 1, 1, 1, 1,
-0.3716856, 1.017492, -1.314085, 1, 1, 1, 1, 1,
-0.3696916, -0.1329177, 0.810627, 1, 1, 1, 1, 1,
-0.3671087, -0.149946, -2.323963, 1, 1, 1, 1, 1,
-0.3664224, -0.8128184, -4.451765, 1, 1, 1, 1, 1,
-0.3653065, 1.430663, -0.585989, 1, 1, 1, 1, 1,
-0.3642445, -0.8696316, -0.7722396, 0, 0, 1, 1, 1,
-0.3567677, 1.676465, -1.143233, 1, 0, 0, 1, 1,
-0.3520225, 0.845745, -0.4830396, 1, 0, 0, 1, 1,
-0.3490639, -0.1182254, -1.6494, 1, 0, 0, 1, 1,
-0.3451444, -0.0454249, -2.409244, 1, 0, 0, 1, 1,
-0.34228, -2.025086, -2.459944, 1, 0, 0, 1, 1,
-0.3399279, -2.344242, -3.699779, 0, 0, 0, 1, 1,
-0.3374116, -0.7972406, -1.309345, 0, 0, 0, 1, 1,
-0.3313365, -0.2617176, 0.1797637, 0, 0, 0, 1, 1,
-0.3277588, 1.972717, -0.514805, 0, 0, 0, 1, 1,
-0.3255899, 1.353356, 0.259242, 0, 0, 0, 1, 1,
-0.3252649, -0.8718835, -2.151847, 0, 0, 0, 1, 1,
-0.321431, -1.12942, -1.315932, 0, 0, 0, 1, 1,
-0.3169909, 0.7582418, -0.4611964, 1, 1, 1, 1, 1,
-0.3094546, 1.016136, -0.6536499, 1, 1, 1, 1, 1,
-0.3036936, 0.9283808, 0.1382977, 1, 1, 1, 1, 1,
-0.3021452, -1.538982, -3.585358, 1, 1, 1, 1, 1,
-0.3013477, 1.183535, -0.4527397, 1, 1, 1, 1, 1,
-0.3008976, 0.3966908, 0.07670055, 1, 1, 1, 1, 1,
-0.2953326, 0.8954437, -0.3757518, 1, 1, 1, 1, 1,
-0.2811907, 0.23245, 0.1342812, 1, 1, 1, 1, 1,
-0.2809021, 0.4047932, 0.6787643, 1, 1, 1, 1, 1,
-0.2802931, -1.182481, -3.448676, 1, 1, 1, 1, 1,
-0.278491, 0.1375122, -0.2956448, 1, 1, 1, 1, 1,
-0.2783006, -0.03121083, -1.208443, 1, 1, 1, 1, 1,
-0.2771296, -0.004908913, -1.159947, 1, 1, 1, 1, 1,
-0.2769041, 0.786175, -0.5269516, 1, 1, 1, 1, 1,
-0.275938, 1.512392, 0.362949, 1, 1, 1, 1, 1,
-0.2752855, -0.9124862, -3.942744, 0, 0, 1, 1, 1,
-0.2729803, -0.2596163, -2.148718, 1, 0, 0, 1, 1,
-0.2683692, 1.364918, -0.7910701, 1, 0, 0, 1, 1,
-0.265154, 0.6461952, -1.059031, 1, 0, 0, 1, 1,
-0.2636456, -2.008324, -2.379388, 1, 0, 0, 1, 1,
-0.2605089, -0.4432555, -2.533408, 1, 0, 0, 1, 1,
-0.2572048, -1.100268, -3.411518, 0, 0, 0, 1, 1,
-0.2547388, -1.435274, -4.591645, 0, 0, 0, 1, 1,
-0.2523001, 2.524281, 0.3232049, 0, 0, 0, 1, 1,
-0.2463714, -0.9883908, -2.857868, 0, 0, 0, 1, 1,
-0.2461508, -0.3553208, -2.529771, 0, 0, 0, 1, 1,
-0.2419733, -0.2661394, -1.843324, 0, 0, 0, 1, 1,
-0.2412923, 0.7095709, -1.416701, 0, 0, 0, 1, 1,
-0.2391517, 1.456647, 0.2613129, 1, 1, 1, 1, 1,
-0.238683, 0.2640939, -0.1274156, 1, 1, 1, 1, 1,
-0.2342447, -0.1820599, -2.201686, 1, 1, 1, 1, 1,
-0.2307099, 0.8589444, 1.61335, 1, 1, 1, 1, 1,
-0.2306378, -0.08665778, -3.531742, 1, 1, 1, 1, 1,
-0.2274224, 1.178988, 1.232756, 1, 1, 1, 1, 1,
-0.2261638, -1.174688, -3.020968, 1, 1, 1, 1, 1,
-0.224406, -0.1215782, -0.3013257, 1, 1, 1, 1, 1,
-0.2218945, 0.2510158, -0.3359908, 1, 1, 1, 1, 1,
-0.2213411, -0.5709425, -3.092468, 1, 1, 1, 1, 1,
-0.2212999, -2.19099, -2.947315, 1, 1, 1, 1, 1,
-0.2186074, 1.96535, 1.981641, 1, 1, 1, 1, 1,
-0.215458, 0.4953474, 0.2610773, 1, 1, 1, 1, 1,
-0.2135293, 1.708127, -1.252381, 1, 1, 1, 1, 1,
-0.2115301, -0.1584567, -3.826794, 1, 1, 1, 1, 1,
-0.210911, 1.623881, -1.977375, 0, 0, 1, 1, 1,
-0.2093042, -1.526932, -3.679309, 1, 0, 0, 1, 1,
-0.20556, 0.3098074, 0.1578024, 1, 0, 0, 1, 1,
-0.2035991, -1.256372, -0.8970428, 1, 0, 0, 1, 1,
-0.2024133, 0.816547, -1.47715, 1, 0, 0, 1, 1,
-0.2022984, 1.860935, 1.798313, 1, 0, 0, 1, 1,
-0.199502, -1.163028, -3.390769, 0, 0, 0, 1, 1,
-0.1981155, -0.5449244, -2.995373, 0, 0, 0, 1, 1,
-0.1977032, 0.603451, -1.154099, 0, 0, 0, 1, 1,
-0.1936672, 0.96828, -0.02235419, 0, 0, 0, 1, 1,
-0.1934824, -1.937529, -2.373745, 0, 0, 0, 1, 1,
-0.1908052, 0.3301992, -0.8802729, 0, 0, 0, 1, 1,
-0.1887897, 0.3921529, -0.6072303, 0, 0, 0, 1, 1,
-0.1883164, 0.5021639, -0.2051215, 1, 1, 1, 1, 1,
-0.1848389, -2.297734, -2.660866, 1, 1, 1, 1, 1,
-0.1830158, 0.9856133, 0.05906883, 1, 1, 1, 1, 1,
-0.1823196, 0.0685886, -0.2110841, 1, 1, 1, 1, 1,
-0.1806377, -0.3185459, -4.180506, 1, 1, 1, 1, 1,
-0.1806117, -1.148049, -1.558012, 1, 1, 1, 1, 1,
-0.1805732, -1.220284, -3.214541, 1, 1, 1, 1, 1,
-0.1773734, -0.05197594, -1.329495, 1, 1, 1, 1, 1,
-0.1722907, -0.2062671, -1.282328, 1, 1, 1, 1, 1,
-0.1714426, -0.8021278, -2.089298, 1, 1, 1, 1, 1,
-0.1697091, 0.560657, 0.4075868, 1, 1, 1, 1, 1,
-0.1683935, -0.9726027, -3.433596, 1, 1, 1, 1, 1,
-0.1682789, 0.5244313, 0.643386, 1, 1, 1, 1, 1,
-0.1669976, 1.266038, 0.9199657, 1, 1, 1, 1, 1,
-0.1663187, 0.111542, 0.5521245, 1, 1, 1, 1, 1,
-0.1640957, 0.6429059, 0.3213509, 0, 0, 1, 1, 1,
-0.155057, 0.978844, -0.268898, 1, 0, 0, 1, 1,
-0.1536715, -0.4336496, -1.664971, 1, 0, 0, 1, 1,
-0.1519557, 0.8464593, 0.4352101, 1, 0, 0, 1, 1,
-0.1504611, 0.4224031, 0.1370137, 1, 0, 0, 1, 1,
-0.1441022, 1.296904, -2.283143, 1, 0, 0, 1, 1,
-0.140375, 0.5316306, 1.28642, 0, 0, 0, 1, 1,
-0.1360286, -0.1359122, -3.002777, 0, 0, 0, 1, 1,
-0.1282379, 0.9180123, -0.334868, 0, 0, 0, 1, 1,
-0.122873, -0.8195427, -2.837349, 0, 0, 0, 1, 1,
-0.1222343, 0.04309807, -0.5992808, 0, 0, 0, 1, 1,
-0.1221295, 0.5356987, -1.339867, 0, 0, 0, 1, 1,
-0.1205309, 1.04801, -0.5352215, 0, 0, 0, 1, 1,
-0.1188392, -0.09665278, -2.277294, 1, 1, 1, 1, 1,
-0.116405, -0.602957, -2.803661, 1, 1, 1, 1, 1,
-0.1154714, 1.722187, 0.01291518, 1, 1, 1, 1, 1,
-0.1133298, 0.05397605, -0.9351293, 1, 1, 1, 1, 1,
-0.1115973, 0.5530341, 1.301619, 1, 1, 1, 1, 1,
-0.111131, 1.450933, -0.5105789, 1, 1, 1, 1, 1,
-0.107292, -0.4730039, -2.652284, 1, 1, 1, 1, 1,
-0.1052329, 0.3214026, 0.9758889, 1, 1, 1, 1, 1,
-0.1035889, -0.3169208, -2.04019, 1, 1, 1, 1, 1,
-0.1018284, 0.3501715, -0.003064419, 1, 1, 1, 1, 1,
-0.09744457, 1.906713, 1.275847, 1, 1, 1, 1, 1,
-0.09462695, 1.31771, -1.298766, 1, 1, 1, 1, 1,
-0.09384871, 0.2943602, 0.6198699, 1, 1, 1, 1, 1,
-0.09358913, 0.6764804, -0.6950539, 1, 1, 1, 1, 1,
-0.09309956, 0.899202, -0.937645, 1, 1, 1, 1, 1,
-0.09258204, 0.2021888, 0.7854506, 0, 0, 1, 1, 1,
-0.08752906, 0.6646937, -0.04772903, 1, 0, 0, 1, 1,
-0.08210433, -0.8161132, -4.241938, 1, 0, 0, 1, 1,
-0.08056032, 0.4954673, -0.9916275, 1, 0, 0, 1, 1,
-0.08042773, 0.511199, -0.4824548, 1, 0, 0, 1, 1,
-0.07878339, 0.3080502, 0.1738988, 1, 0, 0, 1, 1,
-0.07853458, -3.052429, -2.584501, 0, 0, 0, 1, 1,
-0.07833286, 1.300578, -1.197362, 0, 0, 0, 1, 1,
-0.07734682, 0.3294365, -0.2871744, 0, 0, 0, 1, 1,
-0.07694088, 1.952042, -1.465255, 0, 0, 0, 1, 1,
-0.07049921, 0.166918, -0.003648304, 0, 0, 0, 1, 1,
-0.07002707, 0.5219756, -0.1673485, 0, 0, 0, 1, 1,
-0.06826925, 0.3454902, -2.250466, 0, 0, 0, 1, 1,
-0.0668902, -0.2477521, -3.407356, 1, 1, 1, 1, 1,
-0.06634532, -0.2950851, -3.85886, 1, 1, 1, 1, 1,
-0.0638819, -0.1623581, -3.108868, 1, 1, 1, 1, 1,
-0.06122348, 0.4471989, 0.1623608, 1, 1, 1, 1, 1,
-0.0578428, 1.475706, -1.131056, 1, 1, 1, 1, 1,
-0.05348734, -1.600723, -2.280315, 1, 1, 1, 1, 1,
-0.04478158, 1.811387, -1.848844, 1, 1, 1, 1, 1,
-0.04380214, -0.8886964, -4.5415, 1, 1, 1, 1, 1,
-0.04320594, -0.6677538, -2.495679, 1, 1, 1, 1, 1,
-0.04011359, 0.06402132, 1.044297, 1, 1, 1, 1, 1,
-0.03481782, 0.4957299, 0.8814633, 1, 1, 1, 1, 1,
-0.03432646, 0.8174524, -0.8436443, 1, 1, 1, 1, 1,
-0.02890308, -1.492219, -2.415096, 1, 1, 1, 1, 1,
-0.02788963, -1.906788, -4.99367, 1, 1, 1, 1, 1,
-0.0271503, -0.2727616, -2.512893, 1, 1, 1, 1, 1,
-0.02561594, -1.198496, -3.503922, 0, 0, 1, 1, 1,
-0.02008109, -0.2339244, -3.28672, 1, 0, 0, 1, 1,
-0.01579187, 0.6360509, 0.3225282, 1, 0, 0, 1, 1,
-0.01125119, 0.6944035, -0.8269008, 1, 0, 0, 1, 1,
-0.01091579, 1.732031, 0.1929243, 1, 0, 0, 1, 1,
-0.007488697, -0.6470655, -4.064843, 1, 0, 0, 1, 1,
-0.00697186, -0.4045576, -3.527105, 0, 0, 0, 1, 1,
-0.00415732, -0.1459753, -1.787195, 0, 0, 0, 1, 1,
-0.003763902, 0.2921574, -1.20591, 0, 0, 0, 1, 1,
-0.003277422, 0.8519614, -1.008935, 0, 0, 0, 1, 1,
0.0002868299, -0.4850471, 2.495866, 0, 0, 0, 1, 1,
0.0004974602, -0.4072926, 3.932405, 0, 0, 0, 1, 1,
0.003954186, 0.7477394, 0.6230916, 0, 0, 0, 1, 1,
0.006749711, -0.52672, 3.214562, 1, 1, 1, 1, 1,
0.009937305, -0.9927351, 5.322961, 1, 1, 1, 1, 1,
0.01182314, 0.6741306, 0.591606, 1, 1, 1, 1, 1,
0.01301297, 1.031802, -0.7766452, 1, 1, 1, 1, 1,
0.01361327, -0.100895, 2.701926, 1, 1, 1, 1, 1,
0.01667182, 0.6143544, 1.45563, 1, 1, 1, 1, 1,
0.01796765, 1.410624, -0.3915442, 1, 1, 1, 1, 1,
0.01969481, -1.771367, 4.57656, 1, 1, 1, 1, 1,
0.02061013, 0.9782131, -0.1358441, 1, 1, 1, 1, 1,
0.02137155, -0.4040167, 4.586353, 1, 1, 1, 1, 1,
0.02325758, -1.214481, 3.313207, 1, 1, 1, 1, 1,
0.02759972, -0.3732404, 2.95966, 1, 1, 1, 1, 1,
0.03005385, 0.7167103, -0.1340894, 1, 1, 1, 1, 1,
0.03350112, 0.4757633, -0.5069233, 1, 1, 1, 1, 1,
0.04163481, -0.9729419, 3.777484, 1, 1, 1, 1, 1,
0.04178407, 0.2168224, -0.5307399, 0, 0, 1, 1, 1,
0.04339913, -0.5986152, 2.411767, 1, 0, 0, 1, 1,
0.04366538, 1.025277, -1.009313, 1, 0, 0, 1, 1,
0.04445224, -0.3817743, 2.556663, 1, 0, 0, 1, 1,
0.04522914, -1.496444, 2.857576, 1, 0, 0, 1, 1,
0.04540947, -0.4645098, 5.290822, 1, 0, 0, 1, 1,
0.04541477, 0.7084205, 1.128039, 0, 0, 0, 1, 1,
0.0503049, 0.3562978, -0.2795375, 0, 0, 0, 1, 1,
0.05516645, -0.1606804, 2.613603, 0, 0, 0, 1, 1,
0.06322707, 0.4428314, -1.380221, 0, 0, 0, 1, 1,
0.06383735, -0.9180763, 3.00643, 0, 0, 0, 1, 1,
0.06387323, 0.7547359, -0.647878, 0, 0, 0, 1, 1,
0.06460408, -0.7656138, 2.47075, 0, 0, 0, 1, 1,
0.06505074, -0.6809017, 3.648422, 1, 1, 1, 1, 1,
0.06829652, -1.044959, 0.9082811, 1, 1, 1, 1, 1,
0.07471339, 0.0259688, 2.140721, 1, 1, 1, 1, 1,
0.07512318, -0.3349222, 2.584141, 1, 1, 1, 1, 1,
0.08042206, -0.4646602, 4.015, 1, 1, 1, 1, 1,
0.09226117, 1.936664, 0.5048949, 1, 1, 1, 1, 1,
0.0925216, 0.4292518, -0.7219122, 1, 1, 1, 1, 1,
0.09540019, 0.2836291, -0.1288895, 1, 1, 1, 1, 1,
0.09730518, 0.857242, 0.05952863, 1, 1, 1, 1, 1,
0.09886678, -0.7815604, 2.156203, 1, 1, 1, 1, 1,
0.1033146, -0.4767814, 2.294456, 1, 1, 1, 1, 1,
0.1074496, 0.4778678, -0.05183652, 1, 1, 1, 1, 1,
0.1085417, 0.5633017, 2.547709, 1, 1, 1, 1, 1,
0.1110931, -1.195098, 1.91598, 1, 1, 1, 1, 1,
0.1112003, 1.707018, -2.989209, 1, 1, 1, 1, 1,
0.1137461, -0.6649345, 3.576018, 0, 0, 1, 1, 1,
0.1148924, -0.813694, 1.872706, 1, 0, 0, 1, 1,
0.1166453, 0.695489, 1.096993, 1, 0, 0, 1, 1,
0.1172653, -0.566358, 4.101222, 1, 0, 0, 1, 1,
0.1206634, 0.2311582, -1.313658, 1, 0, 0, 1, 1,
0.1214807, -0.5150398, 3.361827, 1, 0, 0, 1, 1,
0.1217515, -1.271259, 3.272982, 0, 0, 0, 1, 1,
0.1257146, -0.7454999, 2.812438, 0, 0, 0, 1, 1,
0.1259219, -0.4159254, 2.422255, 0, 0, 0, 1, 1,
0.1295428, -0.5737782, 2.778292, 0, 0, 0, 1, 1,
0.1303266, 1.645362, 0.05907638, 0, 0, 0, 1, 1,
0.1325681, -0.5873758, 2.480581, 0, 0, 0, 1, 1,
0.1343583, -1.22478, 3.263688, 0, 0, 0, 1, 1,
0.1361687, -0.0005832524, 2.165189, 1, 1, 1, 1, 1,
0.1372357, -1.216407, 4.79058, 1, 1, 1, 1, 1,
0.1380774, -1.055741, 5.096263, 1, 1, 1, 1, 1,
0.1399236, -0.6172209, 3.357638, 1, 1, 1, 1, 1,
0.1463177, -0.732551, 1.730815, 1, 1, 1, 1, 1,
0.1465215, -0.2139513, 2.638017, 1, 1, 1, 1, 1,
0.1480122, -0.8189842, 4.220262, 1, 1, 1, 1, 1,
0.1536387, 0.6191697, 0.2934602, 1, 1, 1, 1, 1,
0.1543679, -1.590867, 3.13728, 1, 1, 1, 1, 1,
0.1545533, 0.0108592, 0.5281178, 1, 1, 1, 1, 1,
0.1553585, 0.397473, -1.677936, 1, 1, 1, 1, 1,
0.1665086, 1.055342, 0.2899146, 1, 1, 1, 1, 1,
0.1687183, 0.4371454, -0.4993218, 1, 1, 1, 1, 1,
0.1700772, -2.303884, 2.290172, 1, 1, 1, 1, 1,
0.1714303, 0.04620005, 1.147672, 1, 1, 1, 1, 1,
0.172867, 0.4074753, 0.4483964, 0, 0, 1, 1, 1,
0.182221, -1.368605, 4.162272, 1, 0, 0, 1, 1,
0.1823099, 0.8100964, 0.03047243, 1, 0, 0, 1, 1,
0.1826739, -1.643746, 1.603539, 1, 0, 0, 1, 1,
0.1871979, -0.1089476, 5.050601, 1, 0, 0, 1, 1,
0.1884492, -0.4412399, 2.682614, 1, 0, 0, 1, 1,
0.188984, 0.2641902, 1.754678, 0, 0, 0, 1, 1,
0.1904574, 0.5724909, -1.433306, 0, 0, 0, 1, 1,
0.1950544, 1.312492, 1.511331, 0, 0, 0, 1, 1,
0.1966765, -0.7936419, 0.6378527, 0, 0, 0, 1, 1,
0.1994653, 0.4913776, 0.9597203, 0, 0, 0, 1, 1,
0.2009672, 1.528868, -0.1768412, 0, 0, 0, 1, 1,
0.2029514, 1.820044, 1.414846, 0, 0, 0, 1, 1,
0.208279, -3.207401, 1.430227, 1, 1, 1, 1, 1,
0.2105571, -0.7835026, 4.15856, 1, 1, 1, 1, 1,
0.2169711, 1.459882, -0.3110246, 1, 1, 1, 1, 1,
0.219542, -1.428576, 2.675088, 1, 1, 1, 1, 1,
0.2199457, 0.408558, 0.5560768, 1, 1, 1, 1, 1,
0.2261401, 0.5269881, 1.583452, 1, 1, 1, 1, 1,
0.2316703, -1.121145, 2.628572, 1, 1, 1, 1, 1,
0.2325815, -1.059268, 3.482513, 1, 1, 1, 1, 1,
0.2406173, 0.03344189, 0.6539931, 1, 1, 1, 1, 1,
0.2413289, 1.91645, 0.782561, 1, 1, 1, 1, 1,
0.2557361, -1.004211, 3.439675, 1, 1, 1, 1, 1,
0.2571171, -0.1254986, 2.250229, 1, 1, 1, 1, 1,
0.2591887, -0.8714615, 4.058703, 1, 1, 1, 1, 1,
0.2607477, 1.482434, -1.222084, 1, 1, 1, 1, 1,
0.2624326, 0.3116505, -0.530096, 1, 1, 1, 1, 1,
0.2629365, -0.2070961, 1.244494, 0, 0, 1, 1, 1,
0.2635579, -0.911273, 1.270305, 1, 0, 0, 1, 1,
0.2656744, 0.5987793, -0.3017528, 1, 0, 0, 1, 1,
0.2686375, 0.4620613, 0.9155426, 1, 0, 0, 1, 1,
0.2715406, -0.9994101, 3.042606, 1, 0, 0, 1, 1,
0.2716498, 0.3231664, 1.180949, 1, 0, 0, 1, 1,
0.2732865, 0.6003034, 1.748091, 0, 0, 0, 1, 1,
0.2746277, -2.037765, 3.600856, 0, 0, 0, 1, 1,
0.2755303, -0.4689225, 2.704865, 0, 0, 0, 1, 1,
0.2763739, -1.02333, 2.888573, 0, 0, 0, 1, 1,
0.2802006, 1.395614, 1.301445, 0, 0, 0, 1, 1,
0.280728, 0.3233093, 2.456518, 0, 0, 0, 1, 1,
0.2817237, 0.6520211, -1.277202, 0, 0, 0, 1, 1,
0.282206, -0.2618566, 3.532747, 1, 1, 1, 1, 1,
0.2852059, 0.4707551, -0.0349741, 1, 1, 1, 1, 1,
0.2858668, 0.6034294, 1.937751, 1, 1, 1, 1, 1,
0.2983322, -0.1064971, 2.215937, 1, 1, 1, 1, 1,
0.2996161, -2.509615, 1.538112, 1, 1, 1, 1, 1,
0.3000626, 1.52008, 2.533932, 1, 1, 1, 1, 1,
0.3056405, 0.072833, 1.374079, 1, 1, 1, 1, 1,
0.306249, -0.135792, 1.302565, 1, 1, 1, 1, 1,
0.3063986, 0.4032611, 3.072842, 1, 1, 1, 1, 1,
0.3112628, -1.204241, 3.066575, 1, 1, 1, 1, 1,
0.3157649, 0.2223173, 1.093554, 1, 1, 1, 1, 1,
0.3169629, 1.634615, 0.01313777, 1, 1, 1, 1, 1,
0.3294668, 0.8728169, 1.21981, 1, 1, 1, 1, 1,
0.3355782, -1.512356, 4.370983, 1, 1, 1, 1, 1,
0.3385007, -0.7281037, 3.984144, 1, 1, 1, 1, 1,
0.3393325, -1.121205, 3.364476, 0, 0, 1, 1, 1,
0.3397966, -1.242744, 3.141712, 1, 0, 0, 1, 1,
0.3402879, 1.087789, -0.5266319, 1, 0, 0, 1, 1,
0.3432468, -0.3261564, 3.828267, 1, 0, 0, 1, 1,
0.3468014, 1.475713, -0.4779204, 1, 0, 0, 1, 1,
0.3555692, -0.3442203, 2.559563, 1, 0, 0, 1, 1,
0.3556207, 0.3357407, 3.332443, 0, 0, 0, 1, 1,
0.3579221, -0.9741841, 2.584198, 0, 0, 0, 1, 1,
0.3588884, 0.6434602, 2.612332, 0, 0, 0, 1, 1,
0.3632869, 1.188383, -0.5472207, 0, 0, 0, 1, 1,
0.3639497, 0.7290454, 0.04728644, 0, 0, 0, 1, 1,
0.3641011, 1.542515, -0.07491758, 0, 0, 0, 1, 1,
0.3692436, 1.338757, -1.974586, 0, 0, 0, 1, 1,
0.3695054, -0.2822254, 1.434211, 1, 1, 1, 1, 1,
0.3838738, -1.079106, 2.464865, 1, 1, 1, 1, 1,
0.3874305, 0.5809624, 0.7677162, 1, 1, 1, 1, 1,
0.3879289, -1.094415, 2.666263, 1, 1, 1, 1, 1,
0.3911372, 0.3020475, 1.327966, 1, 1, 1, 1, 1,
0.3925773, 0.1347616, 1.132498, 1, 1, 1, 1, 1,
0.3964845, -0.06506137, 1.662045, 1, 1, 1, 1, 1,
0.4010559, -0.119327, 2.210531, 1, 1, 1, 1, 1,
0.4105886, 0.9916713, 0.009833095, 1, 1, 1, 1, 1,
0.4120528, -0.5273249, 1.988546, 1, 1, 1, 1, 1,
0.4143419, -1.234489, 3.366973, 1, 1, 1, 1, 1,
0.414507, 0.32313, 1.753058, 1, 1, 1, 1, 1,
0.4196616, -1.187285, 2.572312, 1, 1, 1, 1, 1,
0.4206962, -0.6509075, 1.19311, 1, 1, 1, 1, 1,
0.4208446, -0.3215817, 1.86416, 1, 1, 1, 1, 1,
0.4228437, -0.4173174, 2.742733, 0, 0, 1, 1, 1,
0.4238703, 0.1772071, 2.431068, 1, 0, 0, 1, 1,
0.4240479, 1.230138, -0.8213052, 1, 0, 0, 1, 1,
0.4246186, 1.021382, 1.723462, 1, 0, 0, 1, 1,
0.4259751, 0.1909662, 0.165911, 1, 0, 0, 1, 1,
0.4275059, 1.302644, 1.199427, 1, 0, 0, 1, 1,
0.4349226, 0.2047526, 0.6808227, 0, 0, 0, 1, 1,
0.4414071, 1.335122, 1.131305, 0, 0, 0, 1, 1,
0.4419636, -0.5528203, 2.457484, 0, 0, 0, 1, 1,
0.4478919, -1.271135, 3.317219, 0, 0, 0, 1, 1,
0.4487847, -0.3405749, 2.046165, 0, 0, 0, 1, 1,
0.450013, 0.7861211, -0.3621048, 0, 0, 0, 1, 1,
0.4525435, -1.646747, 1.215324, 0, 0, 0, 1, 1,
0.4554916, 0.205477, 1.525105, 1, 1, 1, 1, 1,
0.4578576, 0.1784489, 1.023386, 1, 1, 1, 1, 1,
0.4592917, -1.4167, 4.373931, 1, 1, 1, 1, 1,
0.461614, -0.2846009, -0.2040428, 1, 1, 1, 1, 1,
0.462021, -0.2603362, 1.160662, 1, 1, 1, 1, 1,
0.4687794, -1.418271, 1.595486, 1, 1, 1, 1, 1,
0.4693173, 0.5834655, 0.7049917, 1, 1, 1, 1, 1,
0.4732865, 0.4694659, 0.3867175, 1, 1, 1, 1, 1,
0.4747802, 0.2795758, 1.209752, 1, 1, 1, 1, 1,
0.475282, 0.6475756, 0.330961, 1, 1, 1, 1, 1,
0.4753682, 1.187347, -0.876692, 1, 1, 1, 1, 1,
0.475537, -1.099954, 3.733429, 1, 1, 1, 1, 1,
0.4767933, 0.1811587, 2.312689, 1, 1, 1, 1, 1,
0.4851693, -0.6151362, 2.987725, 1, 1, 1, 1, 1,
0.4870831, 0.9840258, -2.517076, 1, 1, 1, 1, 1,
0.4897191, 1.478135, 0.9358084, 0, 0, 1, 1, 1,
0.49277, -0.01858913, 3.434524, 1, 0, 0, 1, 1,
0.5032008, -0.196311, 1.91091, 1, 0, 0, 1, 1,
0.5074394, 0.3155522, -0.9500347, 1, 0, 0, 1, 1,
0.5081238, 1.525444, -0.7430107, 1, 0, 0, 1, 1,
0.5092524, -0.30589, 1.78458, 1, 0, 0, 1, 1,
0.5118584, 0.6163293, -0.7119936, 0, 0, 0, 1, 1,
0.514528, 0.3164914, 1.118112, 0, 0, 0, 1, 1,
0.5151334, -0.4280485, 1.995813, 0, 0, 0, 1, 1,
0.5196657, 1.535614, -1.723998, 0, 0, 0, 1, 1,
0.5214372, 1.110822, 2.036933, 0, 0, 0, 1, 1,
0.5242468, -0.5290897, 1.720543, 0, 0, 0, 1, 1,
0.5272307, 0.2130412, 1.324046, 0, 0, 0, 1, 1,
0.5385478, -0.883354, 2.534006, 1, 1, 1, 1, 1,
0.5392556, 0.4444267, -0.2263923, 1, 1, 1, 1, 1,
0.5534624, 0.3992535, 0.4371689, 1, 1, 1, 1, 1,
0.5550967, 1.512269, -1.449538, 1, 1, 1, 1, 1,
0.5576015, 0.4877331, 0.6618719, 1, 1, 1, 1, 1,
0.5627755, -1.346855, 4.04988, 1, 1, 1, 1, 1,
0.5635434, -0.04131187, 3.840461, 1, 1, 1, 1, 1,
0.5666149, 0.1091355, 1.277849, 1, 1, 1, 1, 1,
0.574217, 1.220476, -0.04484193, 1, 1, 1, 1, 1,
0.5749437, 1.112612, 1.029066, 1, 1, 1, 1, 1,
0.5764191, 2.001213, 0.8369264, 1, 1, 1, 1, 1,
0.5815692, -0.9367992, 2.475501, 1, 1, 1, 1, 1,
0.5822853, -0.0586451, 0.8978034, 1, 1, 1, 1, 1,
0.5833686, 0.7353241, 1.471671, 1, 1, 1, 1, 1,
0.58372, -0.3601243, 3.187556, 1, 1, 1, 1, 1,
0.5841687, 0.3686384, 0.7445927, 0, 0, 1, 1, 1,
0.5843092, 1.784811, 0.4927292, 1, 0, 0, 1, 1,
0.5848547, 0.9884096, 0.4817566, 1, 0, 0, 1, 1,
0.5875633, -1.04299, 4.512305, 1, 0, 0, 1, 1,
0.592606, -0.7634264, 2.55896, 1, 0, 0, 1, 1,
0.5975704, 0.02111304, 3.758324, 1, 0, 0, 1, 1,
0.5993558, 1.778935, 0.99055, 0, 0, 0, 1, 1,
0.6010814, 0.08460109, 0.7685317, 0, 0, 0, 1, 1,
0.60483, -0.1300288, 0.7163754, 0, 0, 0, 1, 1,
0.6048978, 0.5092905, 1.808916, 0, 0, 0, 1, 1,
0.6074288, -1.010945, 5.8852, 0, 0, 0, 1, 1,
0.6117319, -1.057706, 3.641986, 0, 0, 0, 1, 1,
0.6128772, 0.9215897, 0.6522669, 0, 0, 0, 1, 1,
0.6170675, -0.4588142, 1.574819, 1, 1, 1, 1, 1,
0.6176502, 1.983012, -0.858125, 1, 1, 1, 1, 1,
0.6253627, 0.5215592, 0.7777383, 1, 1, 1, 1, 1,
0.6294174, 0.9866564, 0.9482636, 1, 1, 1, 1, 1,
0.6297686, 0.6425934, 0.677687, 1, 1, 1, 1, 1,
0.6317199, -1.885884, 3.358024, 1, 1, 1, 1, 1,
0.6348221, 0.4428191, 0.1242555, 1, 1, 1, 1, 1,
0.6353553, -0.9358141, 3.091629, 1, 1, 1, 1, 1,
0.63783, -1.780942, 1.908181, 1, 1, 1, 1, 1,
0.6464256, 1.095209, 0.259676, 1, 1, 1, 1, 1,
0.6508511, 0.2933544, 2.511511, 1, 1, 1, 1, 1,
0.6648529, -1.030797, 3.714644, 1, 1, 1, 1, 1,
0.6655043, -0.436794, 1.848228, 1, 1, 1, 1, 1,
0.6672319, -1.74412, 1.317088, 1, 1, 1, 1, 1,
0.6703492, 0.44174, -0.5508152, 1, 1, 1, 1, 1,
0.6741155, -0.9140812, 3.472121, 0, 0, 1, 1, 1,
0.6774767, 1.308627, 0.04885068, 1, 0, 0, 1, 1,
0.6818792, -0.7737117, 2.642867, 1, 0, 0, 1, 1,
0.6850209, 0.7306104, -0.5593288, 1, 0, 0, 1, 1,
0.6863831, -2.460656, 3.441987, 1, 0, 0, 1, 1,
0.6901906, 1.313511, -0.1140937, 1, 0, 0, 1, 1,
0.6936501, -0.09612947, 1.661055, 0, 0, 0, 1, 1,
0.6952172, -1.734802, 0.7439163, 0, 0, 0, 1, 1,
0.6992689, 1.084334, -0.06563555, 0, 0, 0, 1, 1,
0.7000706, -0.3338174, 2.111346, 0, 0, 0, 1, 1,
0.7018856, -0.424661, 1.912989, 0, 0, 0, 1, 1,
0.7063531, -0.693294, 1.903775, 0, 0, 0, 1, 1,
0.7202259, 1.291776, 0.6596455, 0, 0, 0, 1, 1,
0.7223973, 0.7053174, 0.1560373, 1, 1, 1, 1, 1,
0.7255731, 1.803179, 1.163683, 1, 1, 1, 1, 1,
0.7262428, -0.8098028, 1.246729, 1, 1, 1, 1, 1,
0.7263676, 0.5824127, 0.796372, 1, 1, 1, 1, 1,
0.7265529, 0.2262026, 2.045898, 1, 1, 1, 1, 1,
0.7270838, 0.9926207, 3.34739, 1, 1, 1, 1, 1,
0.7296297, 0.1844326, 1.154117, 1, 1, 1, 1, 1,
0.7324397, 0.05837622, 3.060988, 1, 1, 1, 1, 1,
0.7345696, 0.937892, 1.737903, 1, 1, 1, 1, 1,
0.7383161, 1.20872, -0.1193525, 1, 1, 1, 1, 1,
0.7385061, -0.4875725, 1.825949, 1, 1, 1, 1, 1,
0.7420309, -1.561817, 2.04485, 1, 1, 1, 1, 1,
0.7446728, -1.641165, 2.219573, 1, 1, 1, 1, 1,
0.745914, 1.328264, 1.694066, 1, 1, 1, 1, 1,
0.747978, -0.3162715, 0.8317851, 1, 1, 1, 1, 1,
0.7524408, 1.553989, -0.1468609, 0, 0, 1, 1, 1,
0.7530527, -0.566566, 2.043283, 1, 0, 0, 1, 1,
0.7606443, -1.724186, 2.368712, 1, 0, 0, 1, 1,
0.7632071, 0.6514105, 1.282855, 1, 0, 0, 1, 1,
0.7632376, -1.062546, 3.697018, 1, 0, 0, 1, 1,
0.7690726, -0.055579, 1.328965, 1, 0, 0, 1, 1,
0.7705192, -0.9237257, 2.708577, 0, 0, 0, 1, 1,
0.7707927, -0.4827578, 1.632807, 0, 0, 0, 1, 1,
0.7730593, -0.3685176, -0.02902848, 0, 0, 0, 1, 1,
0.774389, -0.5666184, 1.463843, 0, 0, 0, 1, 1,
0.7875944, 0.01569558, 2.206813, 0, 0, 0, 1, 1,
0.7886095, -0.2847281, 0.691365, 0, 0, 0, 1, 1,
0.7917751, 1.304741, 0.2262123, 0, 0, 0, 1, 1,
0.7920685, -0.7855791, 1.868275, 1, 1, 1, 1, 1,
0.7992302, 0.7592623, 1.198225, 1, 1, 1, 1, 1,
0.8003973, 0.2616971, 2.716577, 1, 1, 1, 1, 1,
0.8082587, -0.2987897, 0.8748089, 1, 1, 1, 1, 1,
0.8089613, -1.283884, 2.364385, 1, 1, 1, 1, 1,
0.8119047, 0.5209439, 0.9058872, 1, 1, 1, 1, 1,
0.8124388, -1.546654, 1.939581, 1, 1, 1, 1, 1,
0.8178834, 0.6787347, 2.007865, 1, 1, 1, 1, 1,
0.823042, -0.9924879, 1.618764, 1, 1, 1, 1, 1,
0.8253372, -0.1727628, 3.071672, 1, 1, 1, 1, 1,
0.8326697, -1.026558, 1.206784, 1, 1, 1, 1, 1,
0.8360083, -0.3091489, -0.5897989, 1, 1, 1, 1, 1,
0.8436477, -1.43769, 1.289682, 1, 1, 1, 1, 1,
0.8459017, -0.4263495, 3.172643, 1, 1, 1, 1, 1,
0.8484671, -0.2233001, 2.37833, 1, 1, 1, 1, 1,
0.8547216, 0.4258759, 0.8365052, 0, 0, 1, 1, 1,
0.85958, 0.07876512, 2.303959, 1, 0, 0, 1, 1,
0.8605469, -1.424753, 3.145708, 1, 0, 0, 1, 1,
0.8681145, -0.1400457, 3.30921, 1, 0, 0, 1, 1,
0.8709428, 0.5705488, -0.601164, 1, 0, 0, 1, 1,
0.874093, -0.1383521, 0.888929, 1, 0, 0, 1, 1,
0.8782354, -0.9711581, 2.641286, 0, 0, 0, 1, 1,
0.8803943, 2.086812, 0.601245, 0, 0, 0, 1, 1,
0.8817459, -0.2123936, 0.3057667, 0, 0, 0, 1, 1,
0.887824, -0.2576078, 3.011316, 0, 0, 0, 1, 1,
0.8880545, -0.423981, 1.735304, 0, 0, 0, 1, 1,
0.8884355, 1.085111, 0.01446038, 0, 0, 0, 1, 1,
0.8953001, -0.7177764, 2.264662, 0, 0, 0, 1, 1,
0.8971638, -0.7551822, 2.5667, 1, 1, 1, 1, 1,
0.9075232, 0.7069314, 1.227487, 1, 1, 1, 1, 1,
0.9128274, 0.3656509, -0.05059598, 1, 1, 1, 1, 1,
0.922142, 1.236867, 0.4157148, 1, 1, 1, 1, 1,
0.9272993, 1.639568, 0.76512, 1, 1, 1, 1, 1,
0.9313122, -1.459751, 3.241639, 1, 1, 1, 1, 1,
0.9406403, -0.9546948, 3.285206, 1, 1, 1, 1, 1,
0.9410995, 0.5822831, 1.417724, 1, 1, 1, 1, 1,
0.9535685, -0.3895141, 2.366698, 1, 1, 1, 1, 1,
0.9546722, 0.5871843, 1.032982, 1, 1, 1, 1, 1,
0.9592258, 0.5901534, 0.5703121, 1, 1, 1, 1, 1,
0.9687083, 0.4107544, 0.1675533, 1, 1, 1, 1, 1,
0.9784512, -1.762522, 2.243129, 1, 1, 1, 1, 1,
0.9801035, 0.2911971, 2.148843, 1, 1, 1, 1, 1,
0.9865347, -0.7367004, 1.543679, 1, 1, 1, 1, 1,
0.9909285, 0.4432, -0.1204964, 0, 0, 1, 1, 1,
0.9953569, -0.5314518, 2.587903, 1, 0, 0, 1, 1,
0.995729, 0.354928, 2.91847, 1, 0, 0, 1, 1,
1.003816, -1.185157, 3.054645, 1, 0, 0, 1, 1,
1.006344, -0.2339005, 1.974463, 1, 0, 0, 1, 1,
1.01101, -1.254149, 2.309808, 1, 0, 0, 1, 1,
1.018087, 0.03071214, 2.012319, 0, 0, 0, 1, 1,
1.019286, -0.512937, 0.9686094, 0, 0, 0, 1, 1,
1.024124, 0.2070724, 0.6083654, 0, 0, 0, 1, 1,
1.042977, 0.6334494, 1.263311, 0, 0, 0, 1, 1,
1.050558, 0.279799, 0.5110219, 0, 0, 0, 1, 1,
1.051045, 1.050386, 0.6273928, 0, 0, 0, 1, 1,
1.052448, 0.702489, 0.800529, 0, 0, 0, 1, 1,
1.057048, 0.4032217, 1.905683, 1, 1, 1, 1, 1,
1.057502, 0.7325669, 0.6673988, 1, 1, 1, 1, 1,
1.059566, 0.4210246, 0.685282, 1, 1, 1, 1, 1,
1.059806, -1.994291, 3.37822, 1, 1, 1, 1, 1,
1.061715, 1.485186, 0.1875138, 1, 1, 1, 1, 1,
1.077463, -0.1250842, 1.615703, 1, 1, 1, 1, 1,
1.087704, 2.403689, -0.8472476, 1, 1, 1, 1, 1,
1.096162, 0.3400474, 2.040424, 1, 1, 1, 1, 1,
1.099544, -0.5029072, 4.312922, 1, 1, 1, 1, 1,
1.100122, -1.47413, 4.370234, 1, 1, 1, 1, 1,
1.115758, 0.08655416, 0.7242108, 1, 1, 1, 1, 1,
1.121818, -0.04796113, 2.224463, 1, 1, 1, 1, 1,
1.122457, -0.348272, 3.809512, 1, 1, 1, 1, 1,
1.131897, -0.1574634, 1.836806, 1, 1, 1, 1, 1,
1.137656, -0.5053082, 2.570669, 1, 1, 1, 1, 1,
1.140571, 0.5480184, 1.374338, 0, 0, 1, 1, 1,
1.141639, -1.528244, 2.035602, 1, 0, 0, 1, 1,
1.147779, 0.9331233, 1.352779, 1, 0, 0, 1, 1,
1.163949, 0.9773853, 1.986102, 1, 0, 0, 1, 1,
1.168662, 0.1519034, 2.044266, 1, 0, 0, 1, 1,
1.170204, 1.217645, 2.054595, 1, 0, 0, 1, 1,
1.171864, -0.3441763, 1.721485, 0, 0, 0, 1, 1,
1.176073, 1.11677, -1.68686, 0, 0, 0, 1, 1,
1.176822, -2.874949, 2.94503, 0, 0, 0, 1, 1,
1.185922, -0.1212316, 3.783712, 0, 0, 0, 1, 1,
1.189704, 1.541501, 0.5568061, 0, 0, 0, 1, 1,
1.191236, 1.876758, -1.090911, 0, 0, 0, 1, 1,
1.200425, 0.98481, 3.166135, 0, 0, 0, 1, 1,
1.200645, 0.07867961, 2.153912, 1, 1, 1, 1, 1,
1.201579, -0.459423, -0.3387849, 1, 1, 1, 1, 1,
1.204315, -0.2858958, 1.960569, 1, 1, 1, 1, 1,
1.205382, 0.3634121, 1.595769, 1, 1, 1, 1, 1,
1.206681, -0.2313875, 3.366515, 1, 1, 1, 1, 1,
1.20777, 0.09227465, 1.196419, 1, 1, 1, 1, 1,
1.208759, 0.3717752, 1.861248, 1, 1, 1, 1, 1,
1.209388, 2.003733, 0.266346, 1, 1, 1, 1, 1,
1.212523, 0.4751778, 1.227053, 1, 1, 1, 1, 1,
1.224965, -0.1133525, 1.853759, 1, 1, 1, 1, 1,
1.226183, -0.3598318, 2.434179, 1, 1, 1, 1, 1,
1.229732, -0.4590693, 3.36807, 1, 1, 1, 1, 1,
1.230961, -0.8633078, 3.422946, 1, 1, 1, 1, 1,
1.237473, -0.9584339, 1.520666, 1, 1, 1, 1, 1,
1.237749, -0.6154145, 0.4508997, 1, 1, 1, 1, 1,
1.238559, -0.9454097, 2.548844, 0, 0, 1, 1, 1,
1.26592, -1.931806, 1.649835, 1, 0, 0, 1, 1,
1.271935, -0.8944277, 2.621884, 1, 0, 0, 1, 1,
1.272889, -0.7901076, 1.508419, 1, 0, 0, 1, 1,
1.275519, 0.5266215, 1.281561, 1, 0, 0, 1, 1,
1.276163, 0.3183069, 1.441616, 1, 0, 0, 1, 1,
1.297555, -0.1220074, 0.5394477, 0, 0, 0, 1, 1,
1.30359, 0.01891875, 0.5501208, 0, 0, 0, 1, 1,
1.304506, -0.61637, 0.6862069, 0, 0, 0, 1, 1,
1.308902, 0.4736527, 0.4002222, 0, 0, 0, 1, 1,
1.310846, -1.061605, 1.085916, 0, 0, 0, 1, 1,
1.312924, 0.0465748, 0.7420452, 0, 0, 0, 1, 1,
1.320929, 0.1879074, 1.868337, 0, 0, 0, 1, 1,
1.327196, -1.013581, 1.682754, 1, 1, 1, 1, 1,
1.339409, 0.8189029, 3.21492, 1, 1, 1, 1, 1,
1.340083, -0.5148018, 2.584004, 1, 1, 1, 1, 1,
1.343549, -1.440394, 3.122286, 1, 1, 1, 1, 1,
1.346121, 0.4919081, 0.3834337, 1, 1, 1, 1, 1,
1.347425, 0.9511588, 2.282024, 1, 1, 1, 1, 1,
1.352782, 0.5025956, -0.4172722, 1, 1, 1, 1, 1,
1.35676, 0.2393968, 1.021813, 1, 1, 1, 1, 1,
1.365544, 0.9711505, 1.072454, 1, 1, 1, 1, 1,
1.365746, 0.1162395, 1.530246, 1, 1, 1, 1, 1,
1.365982, 1.528136, 2.332517, 1, 1, 1, 1, 1,
1.383855, -0.2665502, 1.412582, 1, 1, 1, 1, 1,
1.390734, -1.207311, 1.968171, 1, 1, 1, 1, 1,
1.394074, -1.813684, 1.348812, 1, 1, 1, 1, 1,
1.394837, -2.261464, 2.920603, 1, 1, 1, 1, 1,
1.409817, -0.2413722, 1.751896, 0, 0, 1, 1, 1,
1.412945, 0.9660853, 1.646514, 1, 0, 0, 1, 1,
1.415266, 0.3671028, 0.9675475, 1, 0, 0, 1, 1,
1.421383, -0.1202266, 3.881193, 1, 0, 0, 1, 1,
1.421794, -0.6295233, 2.735444, 1, 0, 0, 1, 1,
1.422276, -0.2500312, 3.241751, 1, 0, 0, 1, 1,
1.423765, -0.2235934, 2.183505, 0, 0, 0, 1, 1,
1.446561, -1.497617, 2.795979, 0, 0, 0, 1, 1,
1.469715, -1.520088, 3.303679, 0, 0, 0, 1, 1,
1.480776, -0.2771513, 1.87297, 0, 0, 0, 1, 1,
1.481577, 0.04520004, 0.7262138, 0, 0, 0, 1, 1,
1.489844, -0.5851511, 2.727872, 0, 0, 0, 1, 1,
1.498463, -1.608517, 1.069975, 0, 0, 0, 1, 1,
1.503689, -0.117222, 2.050154, 1, 1, 1, 1, 1,
1.507106, -0.2640016, 1.764292, 1, 1, 1, 1, 1,
1.512603, 0.46548, 1.680995, 1, 1, 1, 1, 1,
1.517591, 0.2499662, 1.870973, 1, 1, 1, 1, 1,
1.518634, 0.9689291, 2.158214, 1, 1, 1, 1, 1,
1.519048, 0.7658873, 1.857659, 1, 1, 1, 1, 1,
1.520749, 0.4783596, 0.3738009, 1, 1, 1, 1, 1,
1.522193, 0.08952666, 2.06521, 1, 1, 1, 1, 1,
1.524114, -0.7359166, 3.196625, 1, 1, 1, 1, 1,
1.528919, -0.7342826, 2.353515, 1, 1, 1, 1, 1,
1.534806, 0.8772418, 1.474631, 1, 1, 1, 1, 1,
1.544164, 0.2591351, 2.402872, 1, 1, 1, 1, 1,
1.557786, -0.4456949, 1.256026, 1, 1, 1, 1, 1,
1.558794, 0.5945991, 2.274282, 1, 1, 1, 1, 1,
1.560489, 0.6918753, 0.7703217, 1, 1, 1, 1, 1,
1.583736, 0.2677073, 0.2866114, 0, 0, 1, 1, 1,
1.604784, 0.2348162, 2.315323, 1, 0, 0, 1, 1,
1.606221, -0.7856479, 3.780587, 1, 0, 0, 1, 1,
1.612053, -0.9325462, 3.4582, 1, 0, 0, 1, 1,
1.628138, 1.336665, 1.74802, 1, 0, 0, 1, 1,
1.640949, -1.314915, 3.638372, 1, 0, 0, 1, 1,
1.643287, -1.338383, 2.559555, 0, 0, 0, 1, 1,
1.65261, -1.96583, 2.440197, 0, 0, 0, 1, 1,
1.657663, 0.7126412, 1.679042, 0, 0, 0, 1, 1,
1.665584, -0.966104, 1.773803, 0, 0, 0, 1, 1,
1.691374, -0.1777519, 1.146351, 0, 0, 0, 1, 1,
1.716309, -0.05741921, 2.480157, 0, 0, 0, 1, 1,
1.728469, -0.8948178, 2.262063, 0, 0, 0, 1, 1,
1.738252, 0.4960226, 1.998149, 1, 1, 1, 1, 1,
1.746193, 0.87832, 1.330233, 1, 1, 1, 1, 1,
1.756565, -0.3551724, 3.787495, 1, 1, 1, 1, 1,
1.770401, 2.343592, 2.286029, 1, 1, 1, 1, 1,
1.778403, -0.6082883, 3.464027, 1, 1, 1, 1, 1,
1.783882, -0.08369333, 2.828452, 1, 1, 1, 1, 1,
1.805488, -1.418913, 2.706766, 1, 1, 1, 1, 1,
1.807927, 2.506103, -0.7388309, 1, 1, 1, 1, 1,
1.832333, 0.3219156, 0.2227158, 1, 1, 1, 1, 1,
1.832551, -0.1035382, 2.544577, 1, 1, 1, 1, 1,
1.839296, -1.259265, 2.840254, 1, 1, 1, 1, 1,
1.842362, 0.2558553, 1.935208, 1, 1, 1, 1, 1,
1.858109, 0.2983439, 0.9226046, 1, 1, 1, 1, 1,
1.868919, 0.8453997, 1.109006, 1, 1, 1, 1, 1,
1.890163, 0.5028384, 1.09771, 1, 1, 1, 1, 1,
1.919978, 0.5950479, 1.60249, 0, 0, 1, 1, 1,
1.937075, -0.2487242, 2.135042, 1, 0, 0, 1, 1,
1.948756, 0.6229122, 2.539379, 1, 0, 0, 1, 1,
1.954134, 0.5298482, 1.19734, 1, 0, 0, 1, 1,
2.007638, 0.8512467, 1.619889, 1, 0, 0, 1, 1,
2.014251, 1.947249, -0.1619885, 1, 0, 0, 1, 1,
2.01876, 0.1507988, 1.392534, 0, 0, 0, 1, 1,
2.048083, -0.07174049, 2.127616, 0, 0, 0, 1, 1,
2.121832, -1.219169, 1.643035, 0, 0, 0, 1, 1,
2.136243, -1.154226, 1.270382, 0, 0, 0, 1, 1,
2.157757, -1.349047, 1.584864, 0, 0, 0, 1, 1,
2.179562, -0.2593711, 2.538892, 0, 0, 0, 1, 1,
2.2108, 1.545359, 1.056557, 0, 0, 0, 1, 1,
2.234265, -0.8417964, 1.826966, 1, 1, 1, 1, 1,
2.301974, 1.35409, 2.366779, 1, 1, 1, 1, 1,
2.402139, -0.6901829, 1.159861, 1, 1, 1, 1, 1,
2.441974, 1.601686, 0.8020403, 1, 1, 1, 1, 1,
2.869999, -2.386785, 4.50009, 1, 1, 1, 1, 1,
2.918411, 1.129507, -0.3664613, 1, 1, 1, 1, 1,
3.826196, 0.005033943, 2.196446, 1, 1, 1, 1, 1
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
var radius = 9.848773;
var distance = 34.5934;
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
mvMatrix.translate( -0.4720623, 0.01078963, -0.2826343 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5934);
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
