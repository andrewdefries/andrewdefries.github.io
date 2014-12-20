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
-2.927557, 0.5724689, -1.067018, 1, 0, 0, 1,
-2.751429, -0.3381704, -1.855205, 1, 0.007843138, 0, 1,
-2.504841, 0.06872535, -0.835103, 1, 0.01176471, 0, 1,
-2.450145, -2.373258, -3.852525, 1, 0.01960784, 0, 1,
-2.381253, -0.160393, -3.923182, 1, 0.02352941, 0, 1,
-2.370953, -1.211488, -1.637647, 1, 0.03137255, 0, 1,
-2.370847, -0.6660168, -2.427977, 1, 0.03529412, 0, 1,
-2.345078, 0.7196674, -2.34587, 1, 0.04313726, 0, 1,
-2.340427, 2.4064, -0.1294059, 1, 0.04705882, 0, 1,
-2.325175, -0.1215198, -0.6310501, 1, 0.05490196, 0, 1,
-2.305253, 0.3311555, -2.125729, 1, 0.05882353, 0, 1,
-2.301079, -1.722538, -1.749546, 1, 0.06666667, 0, 1,
-2.246907, 0.1384378, 1.055936, 1, 0.07058824, 0, 1,
-2.228967, 0.3106625, 0.3641438, 1, 0.07843138, 0, 1,
-2.226085, -0.664978, -1.152597, 1, 0.08235294, 0, 1,
-2.185242, 1.194067, -0.4171336, 1, 0.09019608, 0, 1,
-2.13975, 0.1942985, -1.111531, 1, 0.09411765, 0, 1,
-2.120778, -1.082131, -4.282705, 1, 0.1019608, 0, 1,
-2.115224, 0.6104667, -1.860161, 1, 0.1098039, 0, 1,
-2.088972, -0.4504557, -1.889961, 1, 0.1137255, 0, 1,
-2.08714, 0.4642445, -1.790745, 1, 0.1215686, 0, 1,
-2.070771, 0.333647, -1.203611, 1, 0.1254902, 0, 1,
-2.068662, -0.7370282, -2.651449, 1, 0.1333333, 0, 1,
-2.052775, 0.3254513, -1.227711, 1, 0.1372549, 0, 1,
-2.012691, -0.06744731, -0.005879063, 1, 0.145098, 0, 1,
-2.001437, -0.05043111, -2.442084, 1, 0.1490196, 0, 1,
-1.979654, -0.480355, -1.974684, 1, 0.1568628, 0, 1,
-1.903074, -1.036359, -4.183994, 1, 0.1607843, 0, 1,
-1.900723, 0.2261703, -2.216571, 1, 0.1686275, 0, 1,
-1.900331, -0.6102759, -2.146718, 1, 0.172549, 0, 1,
-1.897519, 0.9817041, -0.981071, 1, 0.1803922, 0, 1,
-1.883825, -1.591753, -2.991233, 1, 0.1843137, 0, 1,
-1.88368, 0.2426836, -2.231438, 1, 0.1921569, 0, 1,
-1.849291, 1.00826, -1.020906, 1, 0.1960784, 0, 1,
-1.83233, 0.3160026, -2.419181, 1, 0.2039216, 0, 1,
-1.830492, -0.3026922, -1.668458, 1, 0.2117647, 0, 1,
-1.804184, 0.6513447, -2.375829, 1, 0.2156863, 0, 1,
-1.781645, 0.6195227, -0.5701727, 1, 0.2235294, 0, 1,
-1.768575, 0.5511153, -1.13852, 1, 0.227451, 0, 1,
-1.767881, -0.1033277, -1.114819, 1, 0.2352941, 0, 1,
-1.765558, 0.003753023, -1.577557, 1, 0.2392157, 0, 1,
-1.76408, -0.9001912, 1.046631, 1, 0.2470588, 0, 1,
-1.752872, 0.2959746, -2.803198, 1, 0.2509804, 0, 1,
-1.742491, 0.8121017, -0.949403, 1, 0.2588235, 0, 1,
-1.741155, -0.2467852, -2.258516, 1, 0.2627451, 0, 1,
-1.739895, 0.6056399, -1.571976, 1, 0.2705882, 0, 1,
-1.732448, 0.01095492, -0.4663342, 1, 0.2745098, 0, 1,
-1.718688, -0.4540338, -2.312535, 1, 0.282353, 0, 1,
-1.713531, -0.4566013, -3.118898, 1, 0.2862745, 0, 1,
-1.707745, 1.964384, -2.152975, 1, 0.2941177, 0, 1,
-1.703691, 0.2435729, -1.1331, 1, 0.3019608, 0, 1,
-1.702535, 0.7757412, -0.8897142, 1, 0.3058824, 0, 1,
-1.69789, -1.537986, -0.8893587, 1, 0.3137255, 0, 1,
-1.697378, -1.680247, -2.826561, 1, 0.3176471, 0, 1,
-1.694526, -2.028835, -1.71093, 1, 0.3254902, 0, 1,
-1.690669, -0.6032678, -1.633241, 1, 0.3294118, 0, 1,
-1.687952, -0.2517187, -1.279597, 1, 0.3372549, 0, 1,
-1.681662, 1.541675, -1.239069, 1, 0.3411765, 0, 1,
-1.681631, 0.2089911, -2.151229, 1, 0.3490196, 0, 1,
-1.664493, 1.24228, -0.9410101, 1, 0.3529412, 0, 1,
-1.661918, -0.5937422, -2.476029, 1, 0.3607843, 0, 1,
-1.658617, 0.0964687, -2.043234, 1, 0.3647059, 0, 1,
-1.650308, 0.351576, -0.3603826, 1, 0.372549, 0, 1,
-1.643251, 1.020434, -2.837855, 1, 0.3764706, 0, 1,
-1.640206, 0.6379246, -0.06365964, 1, 0.3843137, 0, 1,
-1.638727, 0.6882494, -0.4644552, 1, 0.3882353, 0, 1,
-1.592828, -1.147888, -2.430891, 1, 0.3960784, 0, 1,
-1.574873, -1.674921, -2.128711, 1, 0.4039216, 0, 1,
-1.565224, 0.9720647, 0.2178373, 1, 0.4078431, 0, 1,
-1.546709, 1.495847, -3.011462, 1, 0.4156863, 0, 1,
-1.531542, 0.3171337, -0.9249732, 1, 0.4196078, 0, 1,
-1.531429, 0.6016191, -0.5546026, 1, 0.427451, 0, 1,
-1.527022, 1.590268, -0.04297072, 1, 0.4313726, 0, 1,
-1.525867, 1.263026, 0.1108486, 1, 0.4392157, 0, 1,
-1.524268, -0.2952572, -2.824084, 1, 0.4431373, 0, 1,
-1.521288, 0.02646269, -0.1044836, 1, 0.4509804, 0, 1,
-1.518105, -1.938681, -3.652149, 1, 0.454902, 0, 1,
-1.513191, 0.2939828, -1.703974, 1, 0.4627451, 0, 1,
-1.504031, -0.0178601, -2.227221, 1, 0.4666667, 0, 1,
-1.491417, 0.505244, -0.3325183, 1, 0.4745098, 0, 1,
-1.484428, 0.177767, -2.991832, 1, 0.4784314, 0, 1,
-1.46226, -0.9650161, -2.293313, 1, 0.4862745, 0, 1,
-1.447717, -2.26797, -3.410924, 1, 0.4901961, 0, 1,
-1.432982, 0.5783985, -0.3697895, 1, 0.4980392, 0, 1,
-1.43031, -0.7443483, -1.576772, 1, 0.5058824, 0, 1,
-1.41718, -0.3674452, -2.899362, 1, 0.509804, 0, 1,
-1.409825, 0.89749, 0.2655349, 1, 0.5176471, 0, 1,
-1.409793, 0.2206799, -2.738992, 1, 0.5215687, 0, 1,
-1.399219, -0.08828633, -2.097209, 1, 0.5294118, 0, 1,
-1.396031, -0.8639346, -3.239903, 1, 0.5333334, 0, 1,
-1.380575, -0.9016785, -1.489385, 1, 0.5411765, 0, 1,
-1.377931, 1.696975, -0.8237947, 1, 0.5450981, 0, 1,
-1.375255, 1.259961, 0.1265044, 1, 0.5529412, 0, 1,
-1.373722, 0.09251437, -2.735701, 1, 0.5568628, 0, 1,
-1.366774, 2.467366, 1.035686, 1, 0.5647059, 0, 1,
-1.35666, -1.195148, -2.405663, 1, 0.5686275, 0, 1,
-1.350451, 0.7928107, -0.2448958, 1, 0.5764706, 0, 1,
-1.348739, 1.005167, -0.6136009, 1, 0.5803922, 0, 1,
-1.345279, 0.3893682, 1.081194, 1, 0.5882353, 0, 1,
-1.335619, -0.01634748, -1.747777, 1, 0.5921569, 0, 1,
-1.329136, -0.4148451, -1.602924, 1, 0.6, 0, 1,
-1.326267, 0.3751028, 0.3730175, 1, 0.6078432, 0, 1,
-1.324504, -0.8047049, -3.850143, 1, 0.6117647, 0, 1,
-1.317395, 0.4065984, -1.97507, 1, 0.6196079, 0, 1,
-1.31483, 1.2995, 0.5232906, 1, 0.6235294, 0, 1,
-1.313527, 0.2719281, -0.780824, 1, 0.6313726, 0, 1,
-1.312474, 0.3824042, 0.3009534, 1, 0.6352941, 0, 1,
-1.306865, 0.1551861, -2.738937, 1, 0.6431373, 0, 1,
-1.299893, 1.05716, 0.5426916, 1, 0.6470588, 0, 1,
-1.295738, -0.9148625, -2.133948, 1, 0.654902, 0, 1,
-1.293249, 1.181049, -1.469486, 1, 0.6588235, 0, 1,
-1.286368, 0.3862596, -2.396886, 1, 0.6666667, 0, 1,
-1.283687, -1.299819, -3.461573, 1, 0.6705883, 0, 1,
-1.266186, 0.2384304, -0.1319228, 1, 0.6784314, 0, 1,
-1.264206, -0.7046264, -2.314918, 1, 0.682353, 0, 1,
-1.254975, -0.7728547, -1.960536, 1, 0.6901961, 0, 1,
-1.251114, 0.4105005, -0.3465167, 1, 0.6941177, 0, 1,
-1.239567, -1.263514, -1.015256, 1, 0.7019608, 0, 1,
-1.2374, -1.219854, -1.951979, 1, 0.7098039, 0, 1,
-1.231004, 1.654009, -2.781684, 1, 0.7137255, 0, 1,
-1.227759, 0.09833831, -2.45994, 1, 0.7215686, 0, 1,
-1.21242, -0.2386289, -1.16497, 1, 0.7254902, 0, 1,
-1.209336, -0.9941953, -1.291546, 1, 0.7333333, 0, 1,
-1.209056, 0.002227995, -1.574662, 1, 0.7372549, 0, 1,
-1.205377, 0.9900194, -2.129938, 1, 0.7450981, 0, 1,
-1.205352, 1.000342, -0.3278958, 1, 0.7490196, 0, 1,
-1.205234, 0.5238837, -2.96639, 1, 0.7568628, 0, 1,
-1.20432, -0.553122, -3.887299, 1, 0.7607843, 0, 1,
-1.195011, -0.8479744, -2.095564, 1, 0.7686275, 0, 1,
-1.191408, -0.2693711, -2.422672, 1, 0.772549, 0, 1,
-1.181146, -0.1654627, -3.819021, 1, 0.7803922, 0, 1,
-1.174234, 0.5727136, -3.173624, 1, 0.7843137, 0, 1,
-1.164411, -1.050348, -2.122434, 1, 0.7921569, 0, 1,
-1.158998, 0.9157795, -1.980887, 1, 0.7960784, 0, 1,
-1.152272, 1.501641, -1.610571, 1, 0.8039216, 0, 1,
-1.148318, -1.13919, -3.39544, 1, 0.8117647, 0, 1,
-1.144993, 0.5542562, -1.97689, 1, 0.8156863, 0, 1,
-1.139159, -0.3217044, -2.362712, 1, 0.8235294, 0, 1,
-1.128867, 0.4273108, -2.110328, 1, 0.827451, 0, 1,
-1.128368, -0.4787154, -1.176024, 1, 0.8352941, 0, 1,
-1.122962, 2.376831, -0.5118086, 1, 0.8392157, 0, 1,
-1.121469, 0.9069272, -0.8086935, 1, 0.8470588, 0, 1,
-1.11727, -0.2252049, -1.682039, 1, 0.8509804, 0, 1,
-1.099616, -0.9236724, -2.506646, 1, 0.8588235, 0, 1,
-1.089563, -0.3384404, -1.938342, 1, 0.8627451, 0, 1,
-1.086924, -0.04516255, -3.263307, 1, 0.8705882, 0, 1,
-1.080176, -0.4002885, -2.99632, 1, 0.8745098, 0, 1,
-1.077855, 0.3840899, -2.763407, 1, 0.8823529, 0, 1,
-1.077088, 0.2646144, -2.244167, 1, 0.8862745, 0, 1,
-1.075527, -0.6251102, -1.54908, 1, 0.8941177, 0, 1,
-1.072358, 0.1971329, -1.618552, 1, 0.8980392, 0, 1,
-1.065072, 0.7952725, -0.9512638, 1, 0.9058824, 0, 1,
-1.061905, -0.222817, -2.884847, 1, 0.9137255, 0, 1,
-1.056278, 0.3317903, -0.1840841, 1, 0.9176471, 0, 1,
-1.053892, -0.4582214, -2.920395, 1, 0.9254902, 0, 1,
-1.052858, -0.2958313, -2.699998, 1, 0.9294118, 0, 1,
-1.048913, -0.1431721, -1.113011, 1, 0.9372549, 0, 1,
-1.037994, -0.5268623, -0.9377809, 1, 0.9411765, 0, 1,
-1.036869, -1.579599, -2.812855, 1, 0.9490196, 0, 1,
-1.035117, -0.1150698, -2.243454, 1, 0.9529412, 0, 1,
-1.031693, 0.8765005, -1.381924, 1, 0.9607843, 0, 1,
-1.028212, -0.7200454, -1.785954, 1, 0.9647059, 0, 1,
-1.023184, -1.079573, -1.308347, 1, 0.972549, 0, 1,
-1.019761, 1.260198, 0.221539, 1, 0.9764706, 0, 1,
-1.01445, -0.06616478, -2.540251, 1, 0.9843137, 0, 1,
-1.011635, 0.0780347, -0.5696562, 1, 0.9882353, 0, 1,
-1.008916, 1.410181, -0.2315859, 1, 0.9960784, 0, 1,
-1.007167, -0.8702592, -0.1205704, 0.9960784, 1, 0, 1,
-1.006517, -0.4021258, -2.392445, 0.9921569, 1, 0, 1,
-1.004417, 0.3394559, -0.4210909, 0.9843137, 1, 0, 1,
-1.004026, 3.166274, -1.884479, 0.9803922, 1, 0, 1,
-0.9929597, -0.166185, -2.042078, 0.972549, 1, 0, 1,
-0.9892434, 2.715593, -1.165403, 0.9686275, 1, 0, 1,
-0.9832197, 0.4927394, -1.740718, 0.9607843, 1, 0, 1,
-0.9814857, 1.291211, -1.035515, 0.9568627, 1, 0, 1,
-0.9798995, -1.420986, -3.265005, 0.9490196, 1, 0, 1,
-0.9759636, -1.678201, -1.422081, 0.945098, 1, 0, 1,
-0.9750806, 1.116559, -0.03794511, 0.9372549, 1, 0, 1,
-0.968949, 1.080058, -0.300005, 0.9333333, 1, 0, 1,
-0.9667466, 1.193042, -0.9777935, 0.9254902, 1, 0, 1,
-0.9666891, 0.4090484, -1.119409, 0.9215686, 1, 0, 1,
-0.9644399, 1.300626, -0.9251595, 0.9137255, 1, 0, 1,
-0.9617576, -0.959914, -2.713383, 0.9098039, 1, 0, 1,
-0.9603715, -0.6704017, -0.9938193, 0.9019608, 1, 0, 1,
-0.9592422, 0.9756795, 0.3861738, 0.8941177, 1, 0, 1,
-0.9576895, 0.6653232, 0.08639951, 0.8901961, 1, 0, 1,
-0.9542571, 1.822588, -1.329854, 0.8823529, 1, 0, 1,
-0.953801, 0.4662575, -1.030673, 0.8784314, 1, 0, 1,
-0.9511727, 0.8825379, -1.059984, 0.8705882, 1, 0, 1,
-0.9484033, 0.166181, -1.532696, 0.8666667, 1, 0, 1,
-0.933944, 1.396128, -0.412831, 0.8588235, 1, 0, 1,
-0.932007, -0.3868999, -0.7251459, 0.854902, 1, 0, 1,
-0.9288951, 0.08666212, -0.03751503, 0.8470588, 1, 0, 1,
-0.9281529, -0.9330776, -1.7408, 0.8431373, 1, 0, 1,
-0.92509, 1.433925, -1.343295, 0.8352941, 1, 0, 1,
-0.919736, -0.0926227, -0.1718728, 0.8313726, 1, 0, 1,
-0.9078572, -1.393608, -3.047989, 0.8235294, 1, 0, 1,
-0.893293, 1.524222, -0.7105549, 0.8196079, 1, 0, 1,
-0.8929561, 0.1807285, -2.178644, 0.8117647, 1, 0, 1,
-0.8912935, 0.2129863, -2.590239, 0.8078431, 1, 0, 1,
-0.8856418, -1.376038, -2.642049, 0.8, 1, 0, 1,
-0.8842175, 0.04323127, -1.631072, 0.7921569, 1, 0, 1,
-0.8840006, -1.068058, 0.6330569, 0.7882353, 1, 0, 1,
-0.881011, -0.4366636, -2.171272, 0.7803922, 1, 0, 1,
-0.8805735, -0.6724865, -3.552476, 0.7764706, 1, 0, 1,
-0.8702946, -2.536316, -1.18613, 0.7686275, 1, 0, 1,
-0.8697929, -0.7306619, -1.022137, 0.7647059, 1, 0, 1,
-0.86852, 1.636129, -0.8182859, 0.7568628, 1, 0, 1,
-0.866161, -1.823524, -4.529175, 0.7529412, 1, 0, 1,
-0.8628365, -1.035171, -4.14244, 0.7450981, 1, 0, 1,
-0.858586, 0.4523001, -0.5569953, 0.7411765, 1, 0, 1,
-0.8455704, 1.520269, -0.6748688, 0.7333333, 1, 0, 1,
-0.8450878, 0.06247125, -0.2508433, 0.7294118, 1, 0, 1,
-0.8429508, -0.8185974, -3.05026, 0.7215686, 1, 0, 1,
-0.8354911, 0.2374785, -0.9983503, 0.7176471, 1, 0, 1,
-0.8350896, -0.3901975, -3.217907, 0.7098039, 1, 0, 1,
-0.8304977, 0.1578617, -1.141627, 0.7058824, 1, 0, 1,
-0.81706, -0.6609932, -2.800194, 0.6980392, 1, 0, 1,
-0.808862, -0.612009, -3.039834, 0.6901961, 1, 0, 1,
-0.8082346, 0.1666006, -2.039299, 0.6862745, 1, 0, 1,
-0.8080123, 0.6470525, -1.983068, 0.6784314, 1, 0, 1,
-0.8079945, -0.02718925, -2.913824, 0.6745098, 1, 0, 1,
-0.8070055, -1.205693, -5.856735, 0.6666667, 1, 0, 1,
-0.799461, 0.06237548, -4.120884, 0.6627451, 1, 0, 1,
-0.7982438, 0.8693981, 0.08960697, 0.654902, 1, 0, 1,
-0.7952482, 1.237758, -1.191056, 0.6509804, 1, 0, 1,
-0.7893952, 0.9220061, 0.3856843, 0.6431373, 1, 0, 1,
-0.7743624, 1.909265, 1.117452, 0.6392157, 1, 0, 1,
-0.7694034, 0.416222, -1.137169, 0.6313726, 1, 0, 1,
-0.7641489, -0.5123315, -3.637384, 0.627451, 1, 0, 1,
-0.7571567, 0.1234685, -1.351588, 0.6196079, 1, 0, 1,
-0.7551709, 1.470873, -0.4221278, 0.6156863, 1, 0, 1,
-0.7411985, -0.2963701, -0.4492655, 0.6078432, 1, 0, 1,
-0.7373396, 0.08379252, -0.688372, 0.6039216, 1, 0, 1,
-0.7350336, -1.085731, -1.270165, 0.5960785, 1, 0, 1,
-0.7347739, -0.02329237, -1.145545, 0.5882353, 1, 0, 1,
-0.7260062, -2.236404, -3.262038, 0.5843138, 1, 0, 1,
-0.7237483, 0.1535413, -1.650167, 0.5764706, 1, 0, 1,
-0.720878, 0.9295372, -1.07916, 0.572549, 1, 0, 1,
-0.7177381, 1.946335, -0.0794065, 0.5647059, 1, 0, 1,
-0.7123328, 0.02537166, -0.4377332, 0.5607843, 1, 0, 1,
-0.7093151, 1.574143, -0.6822693, 0.5529412, 1, 0, 1,
-0.7033154, 0.9586627, -1.80579, 0.5490196, 1, 0, 1,
-0.7029455, 1.089366, -0.134722, 0.5411765, 1, 0, 1,
-0.7006065, -0.7503519, -1.980853, 0.5372549, 1, 0, 1,
-0.6986559, 0.5211766, -0.1854859, 0.5294118, 1, 0, 1,
-0.6956491, -1.295169, -1.24548, 0.5254902, 1, 0, 1,
-0.6952018, 0.5223641, -1.899708, 0.5176471, 1, 0, 1,
-0.6775815, 1.315974, 1.352854, 0.5137255, 1, 0, 1,
-0.6708227, 1.215942, 0.06711827, 0.5058824, 1, 0, 1,
-0.6654267, -1.35063, -2.254486, 0.5019608, 1, 0, 1,
-0.6624061, -1.005541, -3.36674, 0.4941176, 1, 0, 1,
-0.661634, 0.6573352, -1.49757, 0.4862745, 1, 0, 1,
-0.6601844, -0.7761314, -2.303693, 0.4823529, 1, 0, 1,
-0.6597924, -0.5682673, -3.653567, 0.4745098, 1, 0, 1,
-0.6557555, 0.1881712, -0.1546567, 0.4705882, 1, 0, 1,
-0.6550519, 1.067214, -0.3803699, 0.4627451, 1, 0, 1,
-0.6487235, 0.1566513, -2.714364, 0.4588235, 1, 0, 1,
-0.6473591, 2.098279, -0.4312694, 0.4509804, 1, 0, 1,
-0.6463463, 1.688738, -0.3298616, 0.4470588, 1, 0, 1,
-0.6461261, 0.69998, 0.01019243, 0.4392157, 1, 0, 1,
-0.6368055, 0.5330716, -1.013332, 0.4352941, 1, 0, 1,
-0.6359013, 0.08424764, -3.332563, 0.427451, 1, 0, 1,
-0.629454, -0.6819252, -1.881108, 0.4235294, 1, 0, 1,
-0.6284171, 0.6090897, -1.004154, 0.4156863, 1, 0, 1,
-0.6267381, -0.9872368, -2.618264, 0.4117647, 1, 0, 1,
-0.623477, 0.3780546, -0.6794989, 0.4039216, 1, 0, 1,
-0.6234615, 1.552049, -0.6688761, 0.3960784, 1, 0, 1,
-0.6219484, -1.82406, -4.338075, 0.3921569, 1, 0, 1,
-0.6215324, 0.2680297, -1.771316, 0.3843137, 1, 0, 1,
-0.6187582, -0.658344, -2.071381, 0.3803922, 1, 0, 1,
-0.611473, 0.2055761, -1.673143, 0.372549, 1, 0, 1,
-0.6114683, -0.4001612, -2.589957, 0.3686275, 1, 0, 1,
-0.6074647, -1.037364, -2.774117, 0.3607843, 1, 0, 1,
-0.6062067, -1.377027, -3.275299, 0.3568628, 1, 0, 1,
-0.6049284, 1.016299, 1.15431, 0.3490196, 1, 0, 1,
-0.6039506, 0.6415132, -1.390403, 0.345098, 1, 0, 1,
-0.6036761, 1.149766, -0.3620089, 0.3372549, 1, 0, 1,
-0.6031057, -1.091558, -1.554889, 0.3333333, 1, 0, 1,
-0.6026123, 1.381102, -0.8166164, 0.3254902, 1, 0, 1,
-0.5970979, 0.4484569, -2.116313, 0.3215686, 1, 0, 1,
-0.5958835, 0.007348763, -1.537142, 0.3137255, 1, 0, 1,
-0.5911561, -1.523544, -3.183119, 0.3098039, 1, 0, 1,
-0.5874476, -0.4351824, -3.154662, 0.3019608, 1, 0, 1,
-0.5854079, -0.2383887, -1.194481, 0.2941177, 1, 0, 1,
-0.5851008, 0.8337557, -3.725936, 0.2901961, 1, 0, 1,
-0.5794258, 0.1624037, -0.5638229, 0.282353, 1, 0, 1,
-0.5764784, 1.679053, -0.1442746, 0.2784314, 1, 0, 1,
-0.5750151, -1.681408, -5.728199, 0.2705882, 1, 0, 1,
-0.5666291, 0.03461902, -2.025643, 0.2666667, 1, 0, 1,
-0.5624559, 1.445908, -1.892993, 0.2588235, 1, 0, 1,
-0.5620838, 0.4328082, 0.7483621, 0.254902, 1, 0, 1,
-0.5583673, 0.6303069, -0.7431235, 0.2470588, 1, 0, 1,
-0.5547103, -0.336175, -2.188114, 0.2431373, 1, 0, 1,
-0.550514, -0.2511784, -1.100553, 0.2352941, 1, 0, 1,
-0.5497948, 0.3931854, -1.745044, 0.2313726, 1, 0, 1,
-0.5432509, 0.09262052, -0.4314913, 0.2235294, 1, 0, 1,
-0.542552, 0.8674024, 0.4532499, 0.2196078, 1, 0, 1,
-0.5397165, -0.3929817, -1.484142, 0.2117647, 1, 0, 1,
-0.5363657, -2.357294, -4.404094, 0.2078431, 1, 0, 1,
-0.5346653, -0.503019, -2.616945, 0.2, 1, 0, 1,
-0.5345646, -1.836927, -5.190925, 0.1921569, 1, 0, 1,
-0.53356, 2.095741, -0.899156, 0.1882353, 1, 0, 1,
-0.5280942, -1.96405, -2.076531, 0.1803922, 1, 0, 1,
-0.5260253, -2.312569, -3.848994, 0.1764706, 1, 0, 1,
-0.5254745, 1.582635, 0.5382979, 0.1686275, 1, 0, 1,
-0.523813, -2.224368, -1.735155, 0.1647059, 1, 0, 1,
-0.5223153, -0.2588825, -1.927491, 0.1568628, 1, 0, 1,
-0.5218555, -2.337549, -2.49904, 0.1529412, 1, 0, 1,
-0.52184, -0.2239992, -1.895526, 0.145098, 1, 0, 1,
-0.5212966, 1.956625, -0.3421542, 0.1411765, 1, 0, 1,
-0.5200931, -1.168946, -2.250149, 0.1333333, 1, 0, 1,
-0.5165135, 1.806456, 0.4630963, 0.1294118, 1, 0, 1,
-0.5144871, 1.61112, -1.153565, 0.1215686, 1, 0, 1,
-0.5124487, -0.3020207, -0.9320009, 0.1176471, 1, 0, 1,
-0.5118705, 0.3654068, -1.48686, 0.1098039, 1, 0, 1,
-0.5112321, 0.7837826, -1.697191, 0.1058824, 1, 0, 1,
-0.5096544, 2.062547, -0.8766552, 0.09803922, 1, 0, 1,
-0.5072556, -1.914814, -4.212401, 0.09019608, 1, 0, 1,
-0.5070281, -0.2569914, -1.880815, 0.08627451, 1, 0, 1,
-0.5047583, 0.456062, -0.9894518, 0.07843138, 1, 0, 1,
-0.504557, 1.438492, 1.568789, 0.07450981, 1, 0, 1,
-0.4982971, -0.9574755, -2.102008, 0.06666667, 1, 0, 1,
-0.4953239, 0.10857, -2.089464, 0.0627451, 1, 0, 1,
-0.4937965, -0.7718737, -2.96112, 0.05490196, 1, 0, 1,
-0.4911425, -0.6867123, -1.792254, 0.05098039, 1, 0, 1,
-0.4887155, 1.073393, 0.1812321, 0.04313726, 1, 0, 1,
-0.4870811, -0.01572369, -2.052249, 0.03921569, 1, 0, 1,
-0.4843595, -1.659206, -2.990922, 0.03137255, 1, 0, 1,
-0.4794609, -0.1961521, -2.115916, 0.02745098, 1, 0, 1,
-0.4747225, 0.2033607, 0.6436642, 0.01960784, 1, 0, 1,
-0.4708626, 0.5096291, -0.3452669, 0.01568628, 1, 0, 1,
-0.4702465, 0.6839595, -0.4303835, 0.007843138, 1, 0, 1,
-0.4695559, -0.4721916, -1.569457, 0.003921569, 1, 0, 1,
-0.4632168, 1.385957, -1.489887, 0, 1, 0.003921569, 1,
-0.4570653, -0.1703193, -2.906887, 0, 1, 0.01176471, 1,
-0.4540007, 0.0224332, 0.1001069, 0, 1, 0.01568628, 1,
-0.4524221, -0.9218681, -2.993424, 0, 1, 0.02352941, 1,
-0.4515807, -1.072935, -3.151798, 0, 1, 0.02745098, 1,
-0.4498848, -1.253286, -2.487201, 0, 1, 0.03529412, 1,
-0.443923, -0.1392526, -0.4686249, 0, 1, 0.03921569, 1,
-0.4333661, -0.320415, -1.612158, 0, 1, 0.04705882, 1,
-0.4266994, -1.401406, -3.641615, 0, 1, 0.05098039, 1,
-0.4232575, -1.336217, -3.471809, 0, 1, 0.05882353, 1,
-0.4217385, 0.3763016, 0.2587653, 0, 1, 0.0627451, 1,
-0.4161362, -1.217655, -3.268649, 0, 1, 0.07058824, 1,
-0.4157911, 1.526973, -0.7410655, 0, 1, 0.07450981, 1,
-0.4075974, 2.737919, 0.01101893, 0, 1, 0.08235294, 1,
-0.4067799, -0.2827415, -2.503049, 0, 1, 0.08627451, 1,
-0.4013603, -0.7370649, -2.094751, 0, 1, 0.09411765, 1,
-0.3921164, 0.5174636, 0.01986977, 0, 1, 0.1019608, 1,
-0.3908084, -0.943855, -3.096779, 0, 1, 0.1058824, 1,
-0.389194, -1.3041, -1.975913, 0, 1, 0.1137255, 1,
-0.3885741, -1.082402, -1.017299, 0, 1, 0.1176471, 1,
-0.3809401, -1.177355, -2.836637, 0, 1, 0.1254902, 1,
-0.3796184, 0.2417366, -2.136843, 0, 1, 0.1294118, 1,
-0.3778862, -0.2048894, -2.934838, 0, 1, 0.1372549, 1,
-0.3776405, -0.3321757, -1.525831, 0, 1, 0.1411765, 1,
-0.3735387, -1.042644, -2.94187, 0, 1, 0.1490196, 1,
-0.3699028, -1.470047, -1.609439, 0, 1, 0.1529412, 1,
-0.368872, -1.005547, -2.272777, 0, 1, 0.1607843, 1,
-0.3646473, 0.1387293, -2.353063, 0, 1, 0.1647059, 1,
-0.3641746, 0.7705838, 1.083158, 0, 1, 0.172549, 1,
-0.3623218, -0.3623809, -1.362001, 0, 1, 0.1764706, 1,
-0.3579887, -0.3855395, -3.681109, 0, 1, 0.1843137, 1,
-0.3568832, 0.7774158, -0.2342549, 0, 1, 0.1882353, 1,
-0.3510742, -0.8516108, -3.998648, 0, 1, 0.1960784, 1,
-0.3509693, 0.1023745, -1.362255, 0, 1, 0.2039216, 1,
-0.3457546, -1.506034, -1.568847, 0, 1, 0.2078431, 1,
-0.3435425, -0.1587155, -1.536427, 0, 1, 0.2156863, 1,
-0.3407904, 2.158772, -1.265576, 0, 1, 0.2196078, 1,
-0.340077, -0.232586, -2.79845, 0, 1, 0.227451, 1,
-0.3392726, -0.3244947, -2.434645, 0, 1, 0.2313726, 1,
-0.3360183, 0.3459905, -2.053847, 0, 1, 0.2392157, 1,
-0.3350439, -0.129377, -1.487578, 0, 1, 0.2431373, 1,
-0.3325651, 0.1654139, -1.281634, 0, 1, 0.2509804, 1,
-0.331053, 0.8869483, 1.730875, 0, 1, 0.254902, 1,
-0.3298964, -0.1402054, -3.610778, 0, 1, 0.2627451, 1,
-0.3291287, 1.102623, -0.7300218, 0, 1, 0.2666667, 1,
-0.328198, 1.95053, 0.6690213, 0, 1, 0.2745098, 1,
-0.3277517, -1.41891, -3.323101, 0, 1, 0.2784314, 1,
-0.3220177, 0.8558689, -0.01918475, 0, 1, 0.2862745, 1,
-0.320338, -0.788923, -3.093583, 0, 1, 0.2901961, 1,
-0.3184578, -1.18609, -2.273431, 0, 1, 0.2980392, 1,
-0.3111548, -0.7047459, -2.959327, 0, 1, 0.3058824, 1,
-0.3045365, 0.1773109, -2.053543, 0, 1, 0.3098039, 1,
-0.2965801, -0.1129058, -1.953416, 0, 1, 0.3176471, 1,
-0.2947342, -1.387212, -1.967035, 0, 1, 0.3215686, 1,
-0.2936424, 1.246524, 2.213087, 0, 1, 0.3294118, 1,
-0.2914947, -1.750455, -4.190246, 0, 1, 0.3333333, 1,
-0.2866299, 0.8129444, 0.6903728, 0, 1, 0.3411765, 1,
-0.2856199, -0.07513285, -2.869259, 0, 1, 0.345098, 1,
-0.2804155, 0.141171, -2.26219, 0, 1, 0.3529412, 1,
-0.2787802, -1.117349, -4.210433, 0, 1, 0.3568628, 1,
-0.2744341, 0.8257366, 0.937263, 0, 1, 0.3647059, 1,
-0.2734351, 0.6940917, -1.958148, 0, 1, 0.3686275, 1,
-0.2733818, -0.2423638, -1.975404, 0, 1, 0.3764706, 1,
-0.272619, -1.265833, -3.608029, 0, 1, 0.3803922, 1,
-0.2621558, 0.9313408, 0.09475324, 0, 1, 0.3882353, 1,
-0.2601685, -0.1581416, -1.556928, 0, 1, 0.3921569, 1,
-0.2571963, 1.092519, 0.3949018, 0, 1, 0.4, 1,
-0.249338, -0.6168132, -1.338169, 0, 1, 0.4078431, 1,
-0.2434215, -0.7680705, -4.12698, 0, 1, 0.4117647, 1,
-0.2413392, 0.04767656, -1.368472, 0, 1, 0.4196078, 1,
-0.2389039, -3.677764, -3.039315, 0, 1, 0.4235294, 1,
-0.2366292, 1.302003, 0.735139, 0, 1, 0.4313726, 1,
-0.2345901, -0.6436743, -3.028212, 0, 1, 0.4352941, 1,
-0.229923, -0.4541375, -2.268067, 0, 1, 0.4431373, 1,
-0.2292002, 0.8594124, -0.1432784, 0, 1, 0.4470588, 1,
-0.2279429, -0.6436533, -4.028979, 0, 1, 0.454902, 1,
-0.2261732, 0.9812525, -1.643457, 0, 1, 0.4588235, 1,
-0.2204546, -0.4149042, -3.362227, 0, 1, 0.4666667, 1,
-0.2197076, -0.451369, -0.5869559, 0, 1, 0.4705882, 1,
-0.2171407, 1.650677, 0.4441261, 0, 1, 0.4784314, 1,
-0.2140616, 1.27371, -1.658586, 0, 1, 0.4823529, 1,
-0.2126716, 0.5716161, -1.110334, 0, 1, 0.4901961, 1,
-0.2108896, -0.1218916, -1.708718, 0, 1, 0.4941176, 1,
-0.2100219, -0.3088934, -0.5278934, 0, 1, 0.5019608, 1,
-0.2089478, -0.9487999, -1.379513, 0, 1, 0.509804, 1,
-0.2050436, 0.6183366, -0.3280025, 0, 1, 0.5137255, 1,
-0.2020897, -1.550524, -2.242993, 0, 1, 0.5215687, 1,
-0.1964834, 1.104635, 1.612139, 0, 1, 0.5254902, 1,
-0.1939542, 0.08549726, -4.193393, 0, 1, 0.5333334, 1,
-0.1929784, -0.008393308, -0.4196979, 0, 1, 0.5372549, 1,
-0.1928488, 0.2264345, 0.707823, 0, 1, 0.5450981, 1,
-0.1884285, -0.5774587, -2.412896, 0, 1, 0.5490196, 1,
-0.1855055, 0.8616704, -0.3886403, 0, 1, 0.5568628, 1,
-0.1823885, 0.327616, 0.9569415, 0, 1, 0.5607843, 1,
-0.1813414, 1.233091, -1.209765, 0, 1, 0.5686275, 1,
-0.1813366, -1.164547, -1.012788, 0, 1, 0.572549, 1,
-0.1811042, -1.11534, -2.223895, 0, 1, 0.5803922, 1,
-0.180558, 0.6426743, 1.590009, 0, 1, 0.5843138, 1,
-0.1723843, -0.9978893, -2.022524, 0, 1, 0.5921569, 1,
-0.1687229, 0.1239329, -0.5411566, 0, 1, 0.5960785, 1,
-0.1664879, 0.9425436, 1.014285, 0, 1, 0.6039216, 1,
-0.1655366, 1.266958, 0.1364354, 0, 1, 0.6117647, 1,
-0.1651648, -0.7820258, -2.770783, 0, 1, 0.6156863, 1,
-0.161038, -0.7632105, -2.893168, 0, 1, 0.6235294, 1,
-0.1581644, -0.254965, -3.69847, 0, 1, 0.627451, 1,
-0.1567574, 2.275118, 0.2707021, 0, 1, 0.6352941, 1,
-0.1551084, -2.745335, -2.257, 0, 1, 0.6392157, 1,
-0.1487975, 0.855979, -1.13093, 0, 1, 0.6470588, 1,
-0.1388754, -0.1091582, -3.602299, 0, 1, 0.6509804, 1,
-0.1385175, 1.529417, 0.1554663, 0, 1, 0.6588235, 1,
-0.1384328, -0.2285445, -1.492637, 0, 1, 0.6627451, 1,
-0.1379731, -0.9504303, -3.409666, 0, 1, 0.6705883, 1,
-0.1351604, 1.044683, -1.337814, 0, 1, 0.6745098, 1,
-0.1314395, 0.4558559, -0.2627746, 0, 1, 0.682353, 1,
-0.1171127, -0.1523999, -3.545365, 0, 1, 0.6862745, 1,
-0.1123925, 1.110774, -0.2795899, 0, 1, 0.6941177, 1,
-0.1111351, 0.8941913, -1.303049, 0, 1, 0.7019608, 1,
-0.1090836, 0.8808283, -0.3310896, 0, 1, 0.7058824, 1,
-0.1080396, 0.7719978, 0.921149, 0, 1, 0.7137255, 1,
-0.1076283, 0.4443949, 0.4596744, 0, 1, 0.7176471, 1,
-0.1075434, -0.3533475, -2.184939, 0, 1, 0.7254902, 1,
-0.1071743, 0.2030029, 0.7851561, 0, 1, 0.7294118, 1,
-0.09876866, 0.4995717, -1.033909, 0, 1, 0.7372549, 1,
-0.09503113, 0.9178664, -1.752692, 0, 1, 0.7411765, 1,
-0.09382579, 1.208013, -2.164138, 0, 1, 0.7490196, 1,
-0.0936789, -1.666025, -2.281504, 0, 1, 0.7529412, 1,
-0.09190782, 0.09278253, -2.712204, 0, 1, 0.7607843, 1,
-0.08570392, 1.815324, -0.9274288, 0, 1, 0.7647059, 1,
-0.0834642, 0.9260497, -1.030261, 0, 1, 0.772549, 1,
-0.07989056, -1.569987, -4.574031, 0, 1, 0.7764706, 1,
-0.07694922, 0.6733177, -0.5226101, 0, 1, 0.7843137, 1,
-0.07645655, 0.5310036, 1.062238, 0, 1, 0.7882353, 1,
-0.07304956, 2.00012, -1.825143, 0, 1, 0.7960784, 1,
-0.07246648, 0.9245886, -0.7319477, 0, 1, 0.8039216, 1,
-0.07080407, 1.734239, 0.3347642, 0, 1, 0.8078431, 1,
-0.07073342, -2.006468, -2.13894, 0, 1, 0.8156863, 1,
-0.07057636, 1.394101, 0.5064956, 0, 1, 0.8196079, 1,
-0.07055998, 0.2341249, -1.883308, 0, 1, 0.827451, 1,
-0.06628044, -0.4746755, -2.548019, 0, 1, 0.8313726, 1,
-0.0658019, 0.9220884, -0.02573565, 0, 1, 0.8392157, 1,
-0.06507423, -0.1539384, -2.669259, 0, 1, 0.8431373, 1,
-0.06277399, -0.09409937, -2.760114, 0, 1, 0.8509804, 1,
-0.05961204, -0.7230511, -3.319406, 0, 1, 0.854902, 1,
-0.05940111, 0.9329654, -1.302908, 0, 1, 0.8627451, 1,
-0.05925066, -0.3968207, -0.7909257, 0, 1, 0.8666667, 1,
-0.05815462, 0.1100162, -0.7570633, 0, 1, 0.8745098, 1,
-0.0557341, -1.695331, -0.8391772, 0, 1, 0.8784314, 1,
-0.05376241, 0.3705232, 0.8060734, 0, 1, 0.8862745, 1,
-0.05084534, -1.41011, -3.625836, 0, 1, 0.8901961, 1,
-0.05062147, 0.5406128, 0.3093311, 0, 1, 0.8980392, 1,
-0.05052524, -0.2062453, -2.23437, 0, 1, 0.9058824, 1,
-0.04828278, -0.3823788, -3.505889, 0, 1, 0.9098039, 1,
-0.04576322, -1.093874, -2.956226, 0, 1, 0.9176471, 1,
-0.04109132, -1.399997, -4.571164, 0, 1, 0.9215686, 1,
-0.03835168, 0.1484022, 1.177745, 0, 1, 0.9294118, 1,
-0.0334918, 1.023777, 0.3073512, 0, 1, 0.9333333, 1,
-0.03335593, 0.3788218, 0.08233821, 0, 1, 0.9411765, 1,
-0.02989333, -0.9679394, -2.908954, 0, 1, 0.945098, 1,
-0.02981415, 0.7324891, 1.363954, 0, 1, 0.9529412, 1,
-0.02919401, 0.006471031, -0.565019, 0, 1, 0.9568627, 1,
-0.02907706, -1.77923, -2.406078, 0, 1, 0.9647059, 1,
-0.02857824, 0.03458481, 0.7290128, 0, 1, 0.9686275, 1,
-0.02767291, -3.102829, -3.955828, 0, 1, 0.9764706, 1,
-0.02598641, 1.207818, 3.294625, 0, 1, 0.9803922, 1,
-0.007669382, 0.09689892, -3.153797, 0, 1, 0.9882353, 1,
-0.007302469, 0.09295643, 1.161681, 0, 1, 0.9921569, 1,
-0.006105737, -0.8227621, -1.883217, 0, 1, 1, 1,
-0.005171272, -1.210354, -4.584121, 0, 0.9921569, 1, 1,
-0.003389082, 2.589205, -0.5171542, 0, 0.9882353, 1, 1,
-0.003372858, -0.2510836, -3.741321, 0, 0.9803922, 1, 1,
0.0002342001, -0.04478012, 1.259905, 0, 0.9764706, 1, 1,
0.002609441, -0.5717704, 3.256125, 0, 0.9686275, 1, 1,
0.004001659, -0.7139072, 3.18335, 0, 0.9647059, 1, 1,
0.00595396, 0.04909543, -0.5503892, 0, 0.9568627, 1, 1,
0.01011287, -1.866182, 3.5221, 0, 0.9529412, 1, 1,
0.01022814, 0.9072349, 0.07567717, 0, 0.945098, 1, 1,
0.01313764, -0.8746153, 3.422112, 0, 0.9411765, 1, 1,
0.016322, 0.899917, -1.995729, 0, 0.9333333, 1, 1,
0.02396679, -1.285851, 4.100737, 0, 0.9294118, 1, 1,
0.02417796, -0.7907531, 3.034187, 0, 0.9215686, 1, 1,
0.02741751, -1.246011, 3.56445, 0, 0.9176471, 1, 1,
0.02786584, -0.617955, 3.976976, 0, 0.9098039, 1, 1,
0.03077421, -3.380893, 3.425442, 0, 0.9058824, 1, 1,
0.03285583, -0.4750225, 2.901613, 0, 0.8980392, 1, 1,
0.03488553, 1.025378, -0.7829843, 0, 0.8901961, 1, 1,
0.03495367, -0.606755, 3.793634, 0, 0.8862745, 1, 1,
0.0350589, -1.496244, 2.435097, 0, 0.8784314, 1, 1,
0.03518033, 0.811242, -0.446006, 0, 0.8745098, 1, 1,
0.03561957, -0.7599365, 2.741155, 0, 0.8666667, 1, 1,
0.03595212, -0.7362368, 2.537591, 0, 0.8627451, 1, 1,
0.03609679, -0.2713819, 5.508041, 0, 0.854902, 1, 1,
0.04143964, 0.2691804, -1.190947, 0, 0.8509804, 1, 1,
0.0432279, -0.9674112, 3.852275, 0, 0.8431373, 1, 1,
0.04356356, -0.2401853, 5.118237, 0, 0.8392157, 1, 1,
0.04448601, -1.347914, 3.505041, 0, 0.8313726, 1, 1,
0.04532364, -0.00535915, 2.633348, 0, 0.827451, 1, 1,
0.04801195, -0.115675, 2.736922, 0, 0.8196079, 1, 1,
0.05235879, 0.4920441, -0.2010032, 0, 0.8156863, 1, 1,
0.0542183, -0.3481415, 1.101677, 0, 0.8078431, 1, 1,
0.05550582, 0.3672345, -0.4127915, 0, 0.8039216, 1, 1,
0.05730869, -0.6200395, 4.663276, 0, 0.7960784, 1, 1,
0.06008896, 0.2107196, -0.779161, 0, 0.7882353, 1, 1,
0.06054577, 0.930424, 1.774269, 0, 0.7843137, 1, 1,
0.06769097, 0.2971511, -1.120626, 0, 0.7764706, 1, 1,
0.06954942, 0.9172689, -0.1359008, 0, 0.772549, 1, 1,
0.07486608, 0.02415512, 0.393517, 0, 0.7647059, 1, 1,
0.07686231, 2.00189, 0.842028, 0, 0.7607843, 1, 1,
0.07887936, -0.7015464, 1.960324, 0, 0.7529412, 1, 1,
0.08199868, -0.5098848, 2.091241, 0, 0.7490196, 1, 1,
0.08433781, 0.831434, 1.166988, 0, 0.7411765, 1, 1,
0.08904468, -0.1003736, 1.569884, 0, 0.7372549, 1, 1,
0.09341837, -2.210184, 3.422074, 0, 0.7294118, 1, 1,
0.1021491, 0.3322228, 1.341647, 0, 0.7254902, 1, 1,
0.1027619, -1.679985, 1.474995, 0, 0.7176471, 1, 1,
0.104435, -1.247762, 3.739436, 0, 0.7137255, 1, 1,
0.1048403, -0.3385774, 2.300373, 0, 0.7058824, 1, 1,
0.105248, 1.80256, 0.3648115, 0, 0.6980392, 1, 1,
0.1052742, -0.2947883, 1.848263, 0, 0.6941177, 1, 1,
0.1055316, -1.591421, 3.688235, 0, 0.6862745, 1, 1,
0.1116529, -0.2857163, 0.3938773, 0, 0.682353, 1, 1,
0.1138667, 0.3383162, 1.00449, 0, 0.6745098, 1, 1,
0.1200755, 1.322482, 0.868919, 0, 0.6705883, 1, 1,
0.1219694, -0.9873445, 3.206754, 0, 0.6627451, 1, 1,
0.1246352, -0.3878477, 2.811411, 0, 0.6588235, 1, 1,
0.1271185, 0.3773378, 0.898649, 0, 0.6509804, 1, 1,
0.1284148, -0.3320133, 3.650337, 0, 0.6470588, 1, 1,
0.1330174, -0.04630287, 0.8436011, 0, 0.6392157, 1, 1,
0.1342394, 1.045531, -1.016424, 0, 0.6352941, 1, 1,
0.1393994, -0.705447, 3.105199, 0, 0.627451, 1, 1,
0.1397968, -0.4651446, 3.130849, 0, 0.6235294, 1, 1,
0.1402154, -0.5686526, 3.308141, 0, 0.6156863, 1, 1,
0.1414898, 1.653934, 0.04269523, 0, 0.6117647, 1, 1,
0.1431397, -0.4434119, 3.843901, 0, 0.6039216, 1, 1,
0.1489266, 1.175937, 0.2614176, 0, 0.5960785, 1, 1,
0.1510427, 0.5230116, 0.5906555, 0, 0.5921569, 1, 1,
0.1526799, -1.267433, 4.24241, 0, 0.5843138, 1, 1,
0.1535552, -0.6071602, 2.982157, 0, 0.5803922, 1, 1,
0.1537929, 0.5502761, 1.863188, 0, 0.572549, 1, 1,
0.1549148, -0.3990609, 2.573095, 0, 0.5686275, 1, 1,
0.1579493, -0.31174, 2.516, 0, 0.5607843, 1, 1,
0.1582069, 2.020406, 1.153792, 0, 0.5568628, 1, 1,
0.1591672, -2.740045, 4.522558, 0, 0.5490196, 1, 1,
0.1598299, -0.1208111, 2.25504, 0, 0.5450981, 1, 1,
0.1614567, -0.8519685, 1.23964, 0, 0.5372549, 1, 1,
0.1704575, -0.6515161, 2.572674, 0, 0.5333334, 1, 1,
0.1736306, 0.7540678, -0.9980674, 0, 0.5254902, 1, 1,
0.1814726, 0.06470299, 1.955145, 0, 0.5215687, 1, 1,
0.1843532, 0.678465, -0.5366058, 0, 0.5137255, 1, 1,
0.1856737, -1.896597, 3.825678, 0, 0.509804, 1, 1,
0.1867312, -1.224394, 1.919561, 0, 0.5019608, 1, 1,
0.1884597, -0.6651329, 3.830591, 0, 0.4941176, 1, 1,
0.1891701, -1.043665, 4.440182, 0, 0.4901961, 1, 1,
0.1921345, 1.315371, 0.4968965, 0, 0.4823529, 1, 1,
0.1931316, -0.6533336, 3.932497, 0, 0.4784314, 1, 1,
0.1950333, -0.6441082, 2.489311, 0, 0.4705882, 1, 1,
0.1959507, -0.07929417, 2.045645, 0, 0.4666667, 1, 1,
0.1975739, -1.22832, 2.828105, 0, 0.4588235, 1, 1,
0.2013387, 0.1901677, 1.341719, 0, 0.454902, 1, 1,
0.2023792, -0.0552796, 1.453872, 0, 0.4470588, 1, 1,
0.20346, -0.04784955, 1.518105, 0, 0.4431373, 1, 1,
0.2077973, -0.2260548, 2.818256, 0, 0.4352941, 1, 1,
0.208437, -0.08662767, 3.073227, 0, 0.4313726, 1, 1,
0.2100605, 1.661495, -0.4604865, 0, 0.4235294, 1, 1,
0.2160981, 1.66043, 1.080572, 0, 0.4196078, 1, 1,
0.2162866, 1.680298, 1.395489, 0, 0.4117647, 1, 1,
0.2190083, -1.227837, 4.71678, 0, 0.4078431, 1, 1,
0.2192438, 0.2177399, 2.761235, 0, 0.4, 1, 1,
0.2193447, -0.04051511, 2.188846, 0, 0.3921569, 1, 1,
0.2220227, -1.345644, 3.056451, 0, 0.3882353, 1, 1,
0.2243256, -1.673217, 1.002327, 0, 0.3803922, 1, 1,
0.2290122, -0.4738097, 0.9533184, 0, 0.3764706, 1, 1,
0.2292454, 0.9487087, 0.591368, 0, 0.3686275, 1, 1,
0.234693, -0.05771278, 2.785831, 0, 0.3647059, 1, 1,
0.2361996, 0.4451871, 1.193192, 0, 0.3568628, 1, 1,
0.2441648, 0.7164037, 1.793615, 0, 0.3529412, 1, 1,
0.2448775, 1.5075, 1.848637, 0, 0.345098, 1, 1,
0.246387, -1.032561, 2.888056, 0, 0.3411765, 1, 1,
0.2466316, -1.443164, 4.160504, 0, 0.3333333, 1, 1,
0.2527971, 0.00403976, -0.006830298, 0, 0.3294118, 1, 1,
0.2531075, 0.411752, 2.415392, 0, 0.3215686, 1, 1,
0.2537975, 0.3111657, -1.451422, 0, 0.3176471, 1, 1,
0.2545292, -0.4331086, 1.219104, 0, 0.3098039, 1, 1,
0.2545624, -1.550112, 2.783873, 0, 0.3058824, 1, 1,
0.257495, -0.5564274, 2.794077, 0, 0.2980392, 1, 1,
0.2632571, -0.6578053, 3.002263, 0, 0.2901961, 1, 1,
0.2633949, 1.282162, 1.284352, 0, 0.2862745, 1, 1,
0.2651102, -0.1523039, 1.519501, 0, 0.2784314, 1, 1,
0.2652045, -0.01746307, 0.5216896, 0, 0.2745098, 1, 1,
0.2670041, 0.5588667, 0.07450284, 0, 0.2666667, 1, 1,
0.2710612, -0.9436085, 3.16261, 0, 0.2627451, 1, 1,
0.2735533, 0.7846169, 2.117276, 0, 0.254902, 1, 1,
0.2749121, 0.3483566, 1.84243, 0, 0.2509804, 1, 1,
0.2785889, -0.502099, 2.366966, 0, 0.2431373, 1, 1,
0.2803678, 0.1808969, 0.5643919, 0, 0.2392157, 1, 1,
0.2834135, -1.331398, 2.178224, 0, 0.2313726, 1, 1,
0.2846466, 1.051653, 0.3245906, 0, 0.227451, 1, 1,
0.2882096, -0.405425, 1.043494, 0, 0.2196078, 1, 1,
0.2885455, -0.4018179, 2.450109, 0, 0.2156863, 1, 1,
0.2899052, 0.145151, -0.8377913, 0, 0.2078431, 1, 1,
0.2909378, 1.175633, 0.9035753, 0, 0.2039216, 1, 1,
0.2964028, 0.951385, -0.08430631, 0, 0.1960784, 1, 1,
0.2982594, 0.8827289, 1.174102, 0, 0.1882353, 1, 1,
0.3077352, 2.367779, 0.1049197, 0, 0.1843137, 1, 1,
0.310814, 0.7286189, 0.4206165, 0, 0.1764706, 1, 1,
0.3109702, 0.5597617, -0.4223437, 0, 0.172549, 1, 1,
0.3160597, -1.128559, 2.03282, 0, 0.1647059, 1, 1,
0.317012, 1.251279, -0.9774939, 0, 0.1607843, 1, 1,
0.3172067, 0.7674996, 0.623917, 0, 0.1529412, 1, 1,
0.3195567, -1.226804, 3.068534, 0, 0.1490196, 1, 1,
0.3207734, -0.3320253, 3.026862, 0, 0.1411765, 1, 1,
0.3231411, -0.06861195, 2.934606, 0, 0.1372549, 1, 1,
0.3279808, 0.05820423, 0.2962153, 0, 0.1294118, 1, 1,
0.3346513, -1.664496, 3.746063, 0, 0.1254902, 1, 1,
0.3379024, -1.141348, 1.308702, 0, 0.1176471, 1, 1,
0.3391433, 1.035912, 2.181868, 0, 0.1137255, 1, 1,
0.3398505, -0.08939575, 1.355569, 0, 0.1058824, 1, 1,
0.3401963, -0.7538087, 2.562889, 0, 0.09803922, 1, 1,
0.3434028, 0.9825138, 0.4642414, 0, 0.09411765, 1, 1,
0.3466115, 0.2447836, 0.9382294, 0, 0.08627451, 1, 1,
0.3484292, 1.168207, 2.343727, 0, 0.08235294, 1, 1,
0.3485444, -1.85331, 2.870966, 0, 0.07450981, 1, 1,
0.3503138, -0.9709966, 3.026981, 0, 0.07058824, 1, 1,
0.3520654, 1.213506, 2.065178, 0, 0.0627451, 1, 1,
0.3558336, -0.9886833, 4.001625, 0, 0.05882353, 1, 1,
0.3562514, -0.6153894, 0.7690224, 0, 0.05098039, 1, 1,
0.359483, -1.411638, 0.99292, 0, 0.04705882, 1, 1,
0.3599303, -0.7546683, 3.121575, 0, 0.03921569, 1, 1,
0.3616827, -0.540684, 2.896356, 0, 0.03529412, 1, 1,
0.3742222, -0.6885855, 3.03196, 0, 0.02745098, 1, 1,
0.3857903, -0.1118298, 1.340848, 0, 0.02352941, 1, 1,
0.3888764, -1.304074, 1.874418, 0, 0.01568628, 1, 1,
0.3904006, 0.2095046, 3.779218, 0, 0.01176471, 1, 1,
0.392203, 0.4894421, 1.098932, 0, 0.003921569, 1, 1,
0.3947104, -1.377165, 3.090133, 0.003921569, 0, 1, 1,
0.3995201, 0.2933687, 0.2938651, 0.007843138, 0, 1, 1,
0.4014897, 0.5797812, 1.391281, 0.01568628, 0, 1, 1,
0.4026459, 0.5579834, 1.717257, 0.01960784, 0, 1, 1,
0.4045475, -0.5980494, 2.827703, 0.02745098, 0, 1, 1,
0.4061714, 1.162747, 0.3548998, 0.03137255, 0, 1, 1,
0.4087207, -0.723652, 3.222982, 0.03921569, 0, 1, 1,
0.4102419, -0.6242902, 1.157945, 0.04313726, 0, 1, 1,
0.4107363, 0.4964748, 0.5588911, 0.05098039, 0, 1, 1,
0.4163455, 0.8436335, -0.04021056, 0.05490196, 0, 1, 1,
0.4176186, 0.8244307, -1.343097, 0.0627451, 0, 1, 1,
0.4215147, -2.123898, 2.983487, 0.06666667, 0, 1, 1,
0.4242165, 2.026822, -0.4616354, 0.07450981, 0, 1, 1,
0.4271701, 1.104075, 0.1523893, 0.07843138, 0, 1, 1,
0.4292258, 0.009588752, 1.647583, 0.08627451, 0, 1, 1,
0.4296192, 0.763885, 1.184165, 0.09019608, 0, 1, 1,
0.4314102, 0.977162, 0.795669, 0.09803922, 0, 1, 1,
0.4341272, 0.7545543, 0.7087378, 0.1058824, 0, 1, 1,
0.434826, -2.414435, 3.71487, 0.1098039, 0, 1, 1,
0.4361469, 1.721136, 1.779424, 0.1176471, 0, 1, 1,
0.4392798, -0.0460394, 1.928852, 0.1215686, 0, 1, 1,
0.4395325, -0.5300038, 2.154865, 0.1294118, 0, 1, 1,
0.4423846, -0.9817825, 2.789459, 0.1333333, 0, 1, 1,
0.4440918, 0.01576965, 1.223397, 0.1411765, 0, 1, 1,
0.446795, -0.06610451, 2.813907, 0.145098, 0, 1, 1,
0.4481728, 0.8156424, -0.458642, 0.1529412, 0, 1, 1,
0.4486378, 0.7115023, -0.5960054, 0.1568628, 0, 1, 1,
0.4488126, 0.2195358, -0.7207634, 0.1647059, 0, 1, 1,
0.4499626, 0.004323349, 1.575767, 0.1686275, 0, 1, 1,
0.4503603, -0.9649259, 2.4348, 0.1764706, 0, 1, 1,
0.4550957, -0.713207, 1.919719, 0.1803922, 0, 1, 1,
0.4566159, 0.0572217, 1.17413, 0.1882353, 0, 1, 1,
0.4587849, -0.287404, 0.4664092, 0.1921569, 0, 1, 1,
0.4607823, -0.2279081, 2.403367, 0.2, 0, 1, 1,
0.4619384, 0.5250682, 2.67241, 0.2078431, 0, 1, 1,
0.4632241, -0.4574602, 2.835015, 0.2117647, 0, 1, 1,
0.4680005, -0.4708716, 4.096657, 0.2196078, 0, 1, 1,
0.4682499, -0.6169341, 0.6344976, 0.2235294, 0, 1, 1,
0.4727916, 0.8172106, -0.5760313, 0.2313726, 0, 1, 1,
0.4743527, -0.1316438, 1.977687, 0.2352941, 0, 1, 1,
0.4752088, 0.7540462, 2.314486, 0.2431373, 0, 1, 1,
0.4756821, 0.2142713, 1.364866, 0.2470588, 0, 1, 1,
0.4760913, 0.6539801, 2.147291, 0.254902, 0, 1, 1,
0.4782049, 1.042632, 0.7809819, 0.2588235, 0, 1, 1,
0.4790934, -0.2974113, 0.2655194, 0.2666667, 0, 1, 1,
0.4791891, -0.2000851, 3.234823, 0.2705882, 0, 1, 1,
0.4835944, -1.126906, 2.562154, 0.2784314, 0, 1, 1,
0.4913858, 0.4969473, 1.320043, 0.282353, 0, 1, 1,
0.4932387, -1.045333, 3.312853, 0.2901961, 0, 1, 1,
0.4959186, -0.9669229, 2.972567, 0.2941177, 0, 1, 1,
0.4985514, 1.03483, 0.5880647, 0.3019608, 0, 1, 1,
0.5006087, -1.308613, 2.215196, 0.3098039, 0, 1, 1,
0.5035819, 0.6898416, -0.5019065, 0.3137255, 0, 1, 1,
0.5075892, -0.3789033, 2.619461, 0.3215686, 0, 1, 1,
0.5082512, 0.2849405, 1.484433, 0.3254902, 0, 1, 1,
0.5093063, 0.4560158, 2.631478, 0.3333333, 0, 1, 1,
0.5099574, 0.8035898, 2.246689, 0.3372549, 0, 1, 1,
0.5188714, 0.4519271, 2.147207, 0.345098, 0, 1, 1,
0.5193827, 0.6968228, 0.2776042, 0.3490196, 0, 1, 1,
0.5204028, -0.04986296, 1.062569, 0.3568628, 0, 1, 1,
0.5217549, -0.2090588, 2.691175, 0.3607843, 0, 1, 1,
0.523378, -1.270257, 1.042974, 0.3686275, 0, 1, 1,
0.5259386, -0.0027592, 0.9408668, 0.372549, 0, 1, 1,
0.5261794, 0.3098621, 0.9998305, 0.3803922, 0, 1, 1,
0.5263025, -0.6475784, 3.197351, 0.3843137, 0, 1, 1,
0.531134, 2.127407, -0.7309506, 0.3921569, 0, 1, 1,
0.5329618, -1.023237, 2.326127, 0.3960784, 0, 1, 1,
0.5347386, -1.416026, 2.011413, 0.4039216, 0, 1, 1,
0.5382411, 0.7937797, -0.1160387, 0.4117647, 0, 1, 1,
0.5407896, 1.761399, 0.2741893, 0.4156863, 0, 1, 1,
0.5514573, 1.062051, 0.3593951, 0.4235294, 0, 1, 1,
0.5535995, -1.768387, 1.295285, 0.427451, 0, 1, 1,
0.5545359, -0.2223591, 2.258572, 0.4352941, 0, 1, 1,
0.5591805, -0.2335732, 1.932025, 0.4392157, 0, 1, 1,
0.5700892, -1.671854, 2.258367, 0.4470588, 0, 1, 1,
0.5745735, -0.7033872, 1.707036, 0.4509804, 0, 1, 1,
0.5809785, 0.4092779, 0.7986521, 0.4588235, 0, 1, 1,
0.5814421, 0.7814577, 1.202049, 0.4627451, 0, 1, 1,
0.586201, 0.07529765, 2.265452, 0.4705882, 0, 1, 1,
0.589539, 0.5887518, 2.051752, 0.4745098, 0, 1, 1,
0.5902815, 0.8924147, 1.194447, 0.4823529, 0, 1, 1,
0.5928068, 0.4207844, 1.451764, 0.4862745, 0, 1, 1,
0.5959285, 0.2519455, 2.479059, 0.4941176, 0, 1, 1,
0.5963817, -0.8043582, 1.992142, 0.5019608, 0, 1, 1,
0.601399, -0.3419385, 1.531975, 0.5058824, 0, 1, 1,
0.6079155, 0.6108661, -0.5423685, 0.5137255, 0, 1, 1,
0.6095911, 1.620403, 0.05438324, 0.5176471, 0, 1, 1,
0.6099537, 3.630903, 0.3360931, 0.5254902, 0, 1, 1,
0.6125567, -0.5207986, 1.887977, 0.5294118, 0, 1, 1,
0.6252581, -1.420434, 3.378492, 0.5372549, 0, 1, 1,
0.6255838, 1.490871, 0.6314759, 0.5411765, 0, 1, 1,
0.6306369, -1.475269, 4.049007, 0.5490196, 0, 1, 1,
0.6334201, -0.4418165, 1.672532, 0.5529412, 0, 1, 1,
0.634204, -0.8833651, 1.543073, 0.5607843, 0, 1, 1,
0.6387545, 1.669488, -0.792307, 0.5647059, 0, 1, 1,
0.6413196, -0.8103839, 2.542885, 0.572549, 0, 1, 1,
0.6471198, 0.6896349, -0.7010594, 0.5764706, 0, 1, 1,
0.6482784, -0.7726835, 2.98607, 0.5843138, 0, 1, 1,
0.6522498, -0.7271965, 2.36155, 0.5882353, 0, 1, 1,
0.6537122, 0.3667995, 1.90982, 0.5960785, 0, 1, 1,
0.6592892, -0.6873078, 1.054448, 0.6039216, 0, 1, 1,
0.6642345, 1.885752, 0.6309543, 0.6078432, 0, 1, 1,
0.6674072, 0.1238838, 0.3560086, 0.6156863, 0, 1, 1,
0.6714291, -0.3902004, 2.727387, 0.6196079, 0, 1, 1,
0.6752611, 0.4818772, 1.553853, 0.627451, 0, 1, 1,
0.6827521, -1.275127, 2.325237, 0.6313726, 0, 1, 1,
0.68442, -2.563172, 2.742426, 0.6392157, 0, 1, 1,
0.6855394, 1.08875, 0.1216691, 0.6431373, 0, 1, 1,
0.6888226, -0.7698892, 3.745007, 0.6509804, 0, 1, 1,
0.7076621, -0.222845, 1.849849, 0.654902, 0, 1, 1,
0.7083932, -0.166937, 2.133703, 0.6627451, 0, 1, 1,
0.7100898, -0.1988415, 2.099675, 0.6666667, 0, 1, 1,
0.711161, -0.2897964, 3.163187, 0.6745098, 0, 1, 1,
0.7126705, -0.2881316, 2.865364, 0.6784314, 0, 1, 1,
0.7168193, 0.1542297, 2.874372, 0.6862745, 0, 1, 1,
0.7242855, -0.5475402, 3.173609, 0.6901961, 0, 1, 1,
0.726412, -1.973693, 2.25721, 0.6980392, 0, 1, 1,
0.734135, -0.8824472, 1.818927, 0.7058824, 0, 1, 1,
0.7351074, 0.3835901, 0.7959738, 0.7098039, 0, 1, 1,
0.735997, 0.09126943, -0.3228942, 0.7176471, 0, 1, 1,
0.7378175, -0.1627614, 1.565013, 0.7215686, 0, 1, 1,
0.7404696, -2.076967, 2.201886, 0.7294118, 0, 1, 1,
0.7405464, 0.5649254, 0.7420095, 0.7333333, 0, 1, 1,
0.7424741, -0.6297354, 1.661235, 0.7411765, 0, 1, 1,
0.7496473, 0.3559588, 1.860343, 0.7450981, 0, 1, 1,
0.7547625, -1.059171, 2.740639, 0.7529412, 0, 1, 1,
0.7557554, -1.666027, 2.878925, 0.7568628, 0, 1, 1,
0.7580317, 0.6842486, 0.7848471, 0.7647059, 0, 1, 1,
0.7586234, -0.6697575, 1.856495, 0.7686275, 0, 1, 1,
0.759228, 0.873381, 1.386951, 0.7764706, 0, 1, 1,
0.7680488, -1.285152, 1.829851, 0.7803922, 0, 1, 1,
0.7716195, -0.4561104, 3.648017, 0.7882353, 0, 1, 1,
0.7723203, 0.1753203, 0.5840206, 0.7921569, 0, 1, 1,
0.7779095, 1.605784, -0.1828894, 0.8, 0, 1, 1,
0.7844095, 2.266005, -0.1806558, 0.8078431, 0, 1, 1,
0.7887694, -0.785372, 3.344, 0.8117647, 0, 1, 1,
0.7898473, -1.033915, 3.126637, 0.8196079, 0, 1, 1,
0.8058044, -0.4500994, 3.455677, 0.8235294, 0, 1, 1,
0.8062975, -1.595598, 1.052853, 0.8313726, 0, 1, 1,
0.8066147, 1.427129, 0.5660972, 0.8352941, 0, 1, 1,
0.8085564, -0.8255467, 2.162066, 0.8431373, 0, 1, 1,
0.8106555, 0.3537045, 0.6363921, 0.8470588, 0, 1, 1,
0.8167943, 2.19288, 1.167359, 0.854902, 0, 1, 1,
0.8236315, -0.3121609, -0.1364635, 0.8588235, 0, 1, 1,
0.8274657, -0.1862759, 0.8540142, 0.8666667, 0, 1, 1,
0.8286715, 0.4525215, 0.3602901, 0.8705882, 0, 1, 1,
0.8379093, -0.910602, 2.515715, 0.8784314, 0, 1, 1,
0.8387982, 0.3622564, 0.7317256, 0.8823529, 0, 1, 1,
0.8422667, -0.5839415, 1.322221, 0.8901961, 0, 1, 1,
0.8484309, 0.2987222, 1.438935, 0.8941177, 0, 1, 1,
0.8519014, -2.196066, 1.781325, 0.9019608, 0, 1, 1,
0.8547158, 0.1205382, 0.5333379, 0.9098039, 0, 1, 1,
0.8618317, -0.6630239, 1.586962, 0.9137255, 0, 1, 1,
0.8660991, 1.193142, 0.0918811, 0.9215686, 0, 1, 1,
0.8681021, -0.8474178, 2.873662, 0.9254902, 0, 1, 1,
0.8738, -1.271024, 1.077431, 0.9333333, 0, 1, 1,
0.8744152, 1.083418, 0.5981686, 0.9372549, 0, 1, 1,
0.8769741, -0.9312122, 2.04061, 0.945098, 0, 1, 1,
0.8806949, 0.6603253, -0.5363205, 0.9490196, 0, 1, 1,
0.8856445, -0.1611066, -0.8070128, 0.9568627, 0, 1, 1,
0.8874073, -0.07467397, 2.229234, 0.9607843, 0, 1, 1,
0.88806, -0.4260827, 2.68053, 0.9686275, 0, 1, 1,
0.895235, 1.905472, -0.250799, 0.972549, 0, 1, 1,
0.8973384, -0.324461, 1.044265, 0.9803922, 0, 1, 1,
0.900353, -0.1057439, 2.239383, 0.9843137, 0, 1, 1,
0.9031506, -0.01587818, 4.140158, 0.9921569, 0, 1, 1,
0.9045202, -0.6564851, 2.955692, 0.9960784, 0, 1, 1,
0.9115457, 1.254525, 1.338956, 1, 0, 0.9960784, 1,
0.9162542, 0.06950033, 0.9162464, 1, 0, 0.9882353, 1,
0.9180109, -0.2087298, 1.683579, 1, 0, 0.9843137, 1,
0.9222575, 0.6826164, -0.2501907, 1, 0, 0.9764706, 1,
0.9251111, -0.160997, 1.265219, 1, 0, 0.972549, 1,
0.9420093, 0.4030399, 1.180637, 1, 0, 0.9647059, 1,
0.943992, -0.2667353, 2.383182, 1, 0, 0.9607843, 1,
0.9450835, 2.085924, -0.03210051, 1, 0, 0.9529412, 1,
0.9455835, -1.98236, 3.479035, 1, 0, 0.9490196, 1,
0.9528121, -0.6245793, 3.010147, 1, 0, 0.9411765, 1,
0.9532182, 0.7847771, -0.6292365, 1, 0, 0.9372549, 1,
0.9547681, 0.02057913, 1.192196, 1, 0, 0.9294118, 1,
0.9552947, 1.7232, -0.8531823, 1, 0, 0.9254902, 1,
0.9579352, 1.572051, 0.4511348, 1, 0, 0.9176471, 1,
0.9703659, -0.9832962, 1.998382, 1, 0, 0.9137255, 1,
0.9708861, -1.043772, 1.725608, 1, 0, 0.9058824, 1,
0.9808171, 0.3097718, 0.5075837, 1, 0, 0.9019608, 1,
0.984785, -1.091038, 1.8251, 1, 0, 0.8941177, 1,
0.9867145, 0.013399, 3.36644, 1, 0, 0.8862745, 1,
0.988041, -1.743582, 3.751156, 1, 0, 0.8823529, 1,
0.9900972, -0.5930956, 2.200422, 1, 0, 0.8745098, 1,
0.9949482, -2.025587, 1.75788, 1, 0, 0.8705882, 1,
0.9958965, -1.385897, 2.657121, 1, 0, 0.8627451, 1,
1.019222, 1.008402, 0.7553298, 1, 0, 0.8588235, 1,
1.019448, -0.178676, 1.431914, 1, 0, 0.8509804, 1,
1.026966, 0.8036662, -0.2495087, 1, 0, 0.8470588, 1,
1.031024, -0.3127101, 1.090037, 1, 0, 0.8392157, 1,
1.032176, -0.1652098, 1.497707, 1, 0, 0.8352941, 1,
1.045526, -0.2616071, 2.272363, 1, 0, 0.827451, 1,
1.048405, 0.3145217, 1.443744, 1, 0, 0.8235294, 1,
1.064182, -0.6393838, 2.294754, 1, 0, 0.8156863, 1,
1.071389, -1.283593, 1.890012, 1, 0, 0.8117647, 1,
1.075165, -2.510367, 1.658324, 1, 0, 0.8039216, 1,
1.07523, 1.748773, 1.962865, 1, 0, 0.7960784, 1,
1.076466, -0.5963, 1.093204, 1, 0, 0.7921569, 1,
1.079469, -1.380334, 4.303669, 1, 0, 0.7843137, 1,
1.080033, 0.1487432, 2.519994, 1, 0, 0.7803922, 1,
1.08417, 0.9795664, 2.338474, 1, 0, 0.772549, 1,
1.086132, -1.233024, 1.290002, 1, 0, 0.7686275, 1,
1.090356, -0.3755133, 1.688272, 1, 0, 0.7607843, 1,
1.10995, 1.730523, -0.1089788, 1, 0, 0.7568628, 1,
1.113174, 1.27799, -0.8586544, 1, 0, 0.7490196, 1,
1.12313, 0.5233654, 1.463324, 1, 0, 0.7450981, 1,
1.124018, 0.5030041, 1.075114, 1, 0, 0.7372549, 1,
1.131867, -2.002129, 2.293521, 1, 0, 0.7333333, 1,
1.133157, 1.009755, 0.8924957, 1, 0, 0.7254902, 1,
1.137001, 0.7341459, 2.070964, 1, 0, 0.7215686, 1,
1.143718, -0.6853276, 2.306621, 1, 0, 0.7137255, 1,
1.149695, -0.3558325, 0.4044952, 1, 0, 0.7098039, 1,
1.152896, -0.4159548, 0.7312196, 1, 0, 0.7019608, 1,
1.155049, 1.039158, 1.421633, 1, 0, 0.6941177, 1,
1.156662, -0.2993048, 0.8868442, 1, 0, 0.6901961, 1,
1.163989, 1.019734, -0.9161276, 1, 0, 0.682353, 1,
1.164728, -1.045077, 3.265168, 1, 0, 0.6784314, 1,
1.172704, 1.755143, 0.6310523, 1, 0, 0.6705883, 1,
1.174555, 0.1045792, 0.5411758, 1, 0, 0.6666667, 1,
1.18938, 0.2699685, 0.9900341, 1, 0, 0.6588235, 1,
1.202843, 0.850803, -0.3119349, 1, 0, 0.654902, 1,
1.205241, 1.035073, -1.263348, 1, 0, 0.6470588, 1,
1.210546, 1.497962, 1.47932, 1, 0, 0.6431373, 1,
1.210799, -0.1060429, 2.770865, 1, 0, 0.6352941, 1,
1.211607, 1.736606, 3.216828, 1, 0, 0.6313726, 1,
1.216437, 0.2618546, 2.515836, 1, 0, 0.6235294, 1,
1.216723, -0.7939337, 1.693154, 1, 0, 0.6196079, 1,
1.223047, 0.9062053, -1.399461, 1, 0, 0.6117647, 1,
1.244115, -0.5660177, 2.215034, 1, 0, 0.6078432, 1,
1.251469, -0.5604388, 4.652547, 1, 0, 0.6, 1,
1.272511, -0.5805812, 0.9269332, 1, 0, 0.5921569, 1,
1.298692, 0.3239248, 2.55893, 1, 0, 0.5882353, 1,
1.306973, 0.3399642, 0.5219146, 1, 0, 0.5803922, 1,
1.312501, -0.2103986, 1.738903, 1, 0, 0.5764706, 1,
1.323142, -0.1864736, 2.094175, 1, 0, 0.5686275, 1,
1.32558, -0.9615985, 1.775945, 1, 0, 0.5647059, 1,
1.327363, -0.6075814, 2.001145, 1, 0, 0.5568628, 1,
1.328624, -0.3083599, 2.383486, 1, 0, 0.5529412, 1,
1.332272, 0.06389004, 0.4788582, 1, 0, 0.5450981, 1,
1.337516, 1.285085, 0.3241461, 1, 0, 0.5411765, 1,
1.35217, -1.753421, 2.095983, 1, 0, 0.5333334, 1,
1.363883, -1.842979, 2.177183, 1, 0, 0.5294118, 1,
1.367379, 2.04142, -0.8811978, 1, 0, 0.5215687, 1,
1.369043, -1.781192, 2.985344, 1, 0, 0.5176471, 1,
1.37268, 0.02860217, 2.381912, 1, 0, 0.509804, 1,
1.37721, 0.4688211, 1.161389, 1, 0, 0.5058824, 1,
1.380979, -0.6331432, 2.963194, 1, 0, 0.4980392, 1,
1.384767, -0.6652886, 1.443647, 1, 0, 0.4901961, 1,
1.386164, 0.5432096, 1.190921, 1, 0, 0.4862745, 1,
1.387156, -2.773801, 1.308996, 1, 0, 0.4784314, 1,
1.390833, 1.045631, 0.8247508, 1, 0, 0.4745098, 1,
1.399074, 1.839762, 0.8817803, 1, 0, 0.4666667, 1,
1.406266, -0.2506208, 2.846152, 1, 0, 0.4627451, 1,
1.415526, -1.519141, 2.452821, 1, 0, 0.454902, 1,
1.417025, -0.7846744, 0.6889008, 1, 0, 0.4509804, 1,
1.41752, -0.2149823, 2.587039, 1, 0, 0.4431373, 1,
1.418046, 0.9313447, -0.2186143, 1, 0, 0.4392157, 1,
1.425145, 0.02304041, 3.704228, 1, 0, 0.4313726, 1,
1.43849, 0.5271646, 1.807276, 1, 0, 0.427451, 1,
1.448506, -1.213885, 2.318384, 1, 0, 0.4196078, 1,
1.461856, 1.868769, -1.466275, 1, 0, 0.4156863, 1,
1.468134, 0.3484012, 2.248665, 1, 0, 0.4078431, 1,
1.471601, 0.3841323, 0.19464, 1, 0, 0.4039216, 1,
1.48064, 0.8126938, 1.414497, 1, 0, 0.3960784, 1,
1.491757, -0.6809988, 3.117973, 1, 0, 0.3882353, 1,
1.496781, 0.6608096, 1.9499, 1, 0, 0.3843137, 1,
1.497878, -0.5812595, 0.3027599, 1, 0, 0.3764706, 1,
1.501655, 1.443596, 1.083309, 1, 0, 0.372549, 1,
1.506967, -0.2875009, 1.220877, 1, 0, 0.3647059, 1,
1.540277, -0.8645739, 2.004078, 1, 0, 0.3607843, 1,
1.55514, -1.457287, 2.837205, 1, 0, 0.3529412, 1,
1.563447, -0.7586036, 3.499107, 1, 0, 0.3490196, 1,
1.583683, 0.717493, 0.002172044, 1, 0, 0.3411765, 1,
1.589955, -0.5538417, 0.2340878, 1, 0, 0.3372549, 1,
1.606193, 2.582757, 2.038799, 1, 0, 0.3294118, 1,
1.636208, -0.2815732, 1.90609, 1, 0, 0.3254902, 1,
1.640731, 0.9813409, 0.9626665, 1, 0, 0.3176471, 1,
1.652336, -0.3007369, 1.295009, 1, 0, 0.3137255, 1,
1.65753, -1.608147, 3.496585, 1, 0, 0.3058824, 1,
1.67328, -0.3788261, 2.096583, 1, 0, 0.2980392, 1,
1.678521, -0.8961976, 0.949594, 1, 0, 0.2941177, 1,
1.696264, -2.185367, 2.621915, 1, 0, 0.2862745, 1,
1.70001, -0.5811791, 1.138736, 1, 0, 0.282353, 1,
1.715612, -0.9572882, 2.803821, 1, 0, 0.2745098, 1,
1.783868, -1.615994, 3.909913, 1, 0, 0.2705882, 1,
1.82347, -0.3144462, 2.378776, 1, 0, 0.2627451, 1,
1.830045, 0.8406848, 1.97803, 1, 0, 0.2588235, 1,
1.831665, 0.04186958, 1.019587, 1, 0, 0.2509804, 1,
1.838494, 2.250063, 0.8628486, 1, 0, 0.2470588, 1,
1.852531, 0.1345747, 1.102536, 1, 0, 0.2392157, 1,
1.854573, -0.9847708, 2.292027, 1, 0, 0.2352941, 1,
1.85591, 0.2994968, 1.455189, 1, 0, 0.227451, 1,
1.873561, 0.7438207, 0.1129194, 1, 0, 0.2235294, 1,
1.876984, 0.402943, -0.04741561, 1, 0, 0.2156863, 1,
1.878168, -1.919732, 1.538062, 1, 0, 0.2117647, 1,
1.894886, -1.325638, 0.8447299, 1, 0, 0.2039216, 1,
1.900844, 0.5909874, 3.622255, 1, 0, 0.1960784, 1,
1.926523, -0.5493109, 1.577072, 1, 0, 0.1921569, 1,
1.935547, 1.602475, 1.021753, 1, 0, 0.1843137, 1,
1.947233, 0.5060434, -1.104772, 1, 0, 0.1803922, 1,
1.951922, 0.5026884, 0.9453498, 1, 0, 0.172549, 1,
1.953727, 0.9270653, -0.6424626, 1, 0, 0.1686275, 1,
1.959285, 1.827765, 0.3786089, 1, 0, 0.1607843, 1,
1.961883, -0.8683729, 1.560892, 1, 0, 0.1568628, 1,
1.966845, 0.5017093, 1.539187, 1, 0, 0.1490196, 1,
1.986383, -0.740338, 1.075076, 1, 0, 0.145098, 1,
2.017081, -1.842352, 1.327811, 1, 0, 0.1372549, 1,
2.03082, 1.006135, -0.3086808, 1, 0, 0.1333333, 1,
2.063067, -1.06329, 1.349511, 1, 0, 0.1254902, 1,
2.075813, -1.567946, 1.92986, 1, 0, 0.1215686, 1,
2.10302, -0.2256524, 1.414375, 1, 0, 0.1137255, 1,
2.126767, -0.6314759, 2.702087, 1, 0, 0.1098039, 1,
2.191619, -0.6238602, 3.580028, 1, 0, 0.1019608, 1,
2.195592, 0.4010981, -0.8023705, 1, 0, 0.09411765, 1,
2.213855, -1.548811, 2.360148, 1, 0, 0.09019608, 1,
2.235337, -1.051099, 0.6750922, 1, 0, 0.08235294, 1,
2.276905, -0.4903356, 0.8690246, 1, 0, 0.07843138, 1,
2.280817, 0.6083552, 0.1429776, 1, 0, 0.07058824, 1,
2.28957, 0.1884116, 1.459534, 1, 0, 0.06666667, 1,
2.30074, 0.5573158, 1.14506, 1, 0, 0.05882353, 1,
2.334593, -0.9026781, 1.351289, 1, 0, 0.05490196, 1,
2.462756, -0.07910693, 0.9468497, 1, 0, 0.04705882, 1,
2.505971, -1.086671, 2.139848, 1, 0, 0.04313726, 1,
2.520519, 0.7914656, 0.2365578, 1, 0, 0.03529412, 1,
2.535258, -0.5386679, 1.123153, 1, 0, 0.03137255, 1,
2.639132, -1.477281, 2.760094, 1, 0, 0.02352941, 1,
2.67567, -1.008852, 3.791067, 1, 0, 0.01960784, 1,
2.751016, -1.030111, 1.525748, 1, 0, 0.01176471, 1,
2.833879, -0.1465968, 1.870447, 1, 0, 0.007843138, 1
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
-0.04683912, -4.916583, -7.783064, 0, -0.5, 0.5, 0.5,
-0.04683912, -4.916583, -7.783064, 1, -0.5, 0.5, 0.5,
-0.04683912, -4.916583, -7.783064, 1, 1.5, 0.5, 0.5,
-0.04683912, -4.916583, -7.783064, 0, 1.5, 0.5, 0.5
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
-3.904121, -0.02343071, -7.783064, 0, -0.5, 0.5, 0.5,
-3.904121, -0.02343071, -7.783064, 1, -0.5, 0.5, 0.5,
-3.904121, -0.02343071, -7.783064, 1, 1.5, 0.5, 0.5,
-3.904121, -0.02343071, -7.783064, 0, 1.5, 0.5, 0.5
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
-3.904121, -4.916583, -0.1743467, 0, -0.5, 0.5, 0.5,
-3.904121, -4.916583, -0.1743467, 1, -0.5, 0.5, 0.5,
-3.904121, -4.916583, -0.1743467, 1, 1.5, 0.5, 0.5,
-3.904121, -4.916583, -0.1743467, 0, 1.5, 0.5, 0.5
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
-2, -3.787394, -6.027206,
2, -3.787394, -6.027206,
-2, -3.787394, -6.027206,
-2, -3.975592, -6.319849,
-1, -3.787394, -6.027206,
-1, -3.975592, -6.319849,
0, -3.787394, -6.027206,
0, -3.975592, -6.319849,
1, -3.787394, -6.027206,
1, -3.975592, -6.319849,
2, -3.787394, -6.027206,
2, -3.975592, -6.319849
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
-2, -4.351988, -6.905135, 0, -0.5, 0.5, 0.5,
-2, -4.351988, -6.905135, 1, -0.5, 0.5, 0.5,
-2, -4.351988, -6.905135, 1, 1.5, 0.5, 0.5,
-2, -4.351988, -6.905135, 0, 1.5, 0.5, 0.5,
-1, -4.351988, -6.905135, 0, -0.5, 0.5, 0.5,
-1, -4.351988, -6.905135, 1, -0.5, 0.5, 0.5,
-1, -4.351988, -6.905135, 1, 1.5, 0.5, 0.5,
-1, -4.351988, -6.905135, 0, 1.5, 0.5, 0.5,
0, -4.351988, -6.905135, 0, -0.5, 0.5, 0.5,
0, -4.351988, -6.905135, 1, -0.5, 0.5, 0.5,
0, -4.351988, -6.905135, 1, 1.5, 0.5, 0.5,
0, -4.351988, -6.905135, 0, 1.5, 0.5, 0.5,
1, -4.351988, -6.905135, 0, -0.5, 0.5, 0.5,
1, -4.351988, -6.905135, 1, -0.5, 0.5, 0.5,
1, -4.351988, -6.905135, 1, 1.5, 0.5, 0.5,
1, -4.351988, -6.905135, 0, 1.5, 0.5, 0.5,
2, -4.351988, -6.905135, 0, -0.5, 0.5, 0.5,
2, -4.351988, -6.905135, 1, -0.5, 0.5, 0.5,
2, -4.351988, -6.905135, 1, 1.5, 0.5, 0.5,
2, -4.351988, -6.905135, 0, 1.5, 0.5, 0.5
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
-3.013979, -2, -6.027206,
-3.013979, 2, -6.027206,
-3.013979, -2, -6.027206,
-3.162336, -2, -6.319849,
-3.013979, 0, -6.027206,
-3.162336, 0, -6.319849,
-3.013979, 2, -6.027206,
-3.162336, 2, -6.319849
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
-3.45905, -2, -6.905135, 0, -0.5, 0.5, 0.5,
-3.45905, -2, -6.905135, 1, -0.5, 0.5, 0.5,
-3.45905, -2, -6.905135, 1, 1.5, 0.5, 0.5,
-3.45905, -2, -6.905135, 0, 1.5, 0.5, 0.5,
-3.45905, 0, -6.905135, 0, -0.5, 0.5, 0.5,
-3.45905, 0, -6.905135, 1, -0.5, 0.5, 0.5,
-3.45905, 0, -6.905135, 1, 1.5, 0.5, 0.5,
-3.45905, 0, -6.905135, 0, 1.5, 0.5, 0.5,
-3.45905, 2, -6.905135, 0, -0.5, 0.5, 0.5,
-3.45905, 2, -6.905135, 1, -0.5, 0.5, 0.5,
-3.45905, 2, -6.905135, 1, 1.5, 0.5, 0.5,
-3.45905, 2, -6.905135, 0, 1.5, 0.5, 0.5
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
-3.013979, -3.787394, -4,
-3.013979, -3.787394, 4,
-3.013979, -3.787394, -4,
-3.162336, -3.975592, -4,
-3.013979, -3.787394, -2,
-3.162336, -3.975592, -2,
-3.013979, -3.787394, 0,
-3.162336, -3.975592, 0,
-3.013979, -3.787394, 2,
-3.162336, -3.975592, 2,
-3.013979, -3.787394, 4,
-3.162336, -3.975592, 4
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
-3.45905, -4.351988, -4, 0, -0.5, 0.5, 0.5,
-3.45905, -4.351988, -4, 1, -0.5, 0.5, 0.5,
-3.45905, -4.351988, -4, 1, 1.5, 0.5, 0.5,
-3.45905, -4.351988, -4, 0, 1.5, 0.5, 0.5,
-3.45905, -4.351988, -2, 0, -0.5, 0.5, 0.5,
-3.45905, -4.351988, -2, 1, -0.5, 0.5, 0.5,
-3.45905, -4.351988, -2, 1, 1.5, 0.5, 0.5,
-3.45905, -4.351988, -2, 0, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 0, 0, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 0, 1, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 0, 1, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 0, 0, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 2, 0, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 2, 1, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 2, 1, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 2, 0, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 4, 0, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 4, 1, -0.5, 0.5, 0.5,
-3.45905, -4.351988, 4, 1, 1.5, 0.5, 0.5,
-3.45905, -4.351988, 4, 0, 1.5, 0.5, 0.5
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
-3.013979, -3.787394, -6.027206,
-3.013979, 3.740533, -6.027206,
-3.013979, -3.787394, 5.678513,
-3.013979, 3.740533, 5.678513,
-3.013979, -3.787394, -6.027206,
-3.013979, -3.787394, 5.678513,
-3.013979, 3.740533, -6.027206,
-3.013979, 3.740533, 5.678513,
-3.013979, -3.787394, -6.027206,
2.9203, -3.787394, -6.027206,
-3.013979, -3.787394, 5.678513,
2.9203, -3.787394, 5.678513,
-3.013979, 3.740533, -6.027206,
2.9203, 3.740533, -6.027206,
-3.013979, 3.740533, 5.678513,
2.9203, 3.740533, 5.678513,
2.9203, -3.787394, -6.027206,
2.9203, 3.740533, -6.027206,
2.9203, -3.787394, 5.678513,
2.9203, 3.740533, 5.678513,
2.9203, -3.787394, -6.027206,
2.9203, -3.787394, 5.678513,
2.9203, 3.740533, -6.027206,
2.9203, 3.740533, 5.678513
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
var radius = 8.078991;
var distance = 35.94434;
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
mvMatrix.translate( 0.04683912, 0.02343071, 0.1743467 );
mvMatrix.scale( 1.471984, 1.160368, 0.7462304 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94434);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flamprop-isopropyl<-read.table("flamprop-isopropyl.xyz")
```

```
## Error in read.table("flamprop-isopropyl.xyz"): no lines available in input
```

```r
x<-flamprop-isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
y<-flamprop-isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
z<-flamprop-isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
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
-2.927557, 0.5724689, -1.067018, 0, 0, 1, 1, 1,
-2.751429, -0.3381704, -1.855205, 1, 0, 0, 1, 1,
-2.504841, 0.06872535, -0.835103, 1, 0, 0, 1, 1,
-2.450145, -2.373258, -3.852525, 1, 0, 0, 1, 1,
-2.381253, -0.160393, -3.923182, 1, 0, 0, 1, 1,
-2.370953, -1.211488, -1.637647, 1, 0, 0, 1, 1,
-2.370847, -0.6660168, -2.427977, 0, 0, 0, 1, 1,
-2.345078, 0.7196674, -2.34587, 0, 0, 0, 1, 1,
-2.340427, 2.4064, -0.1294059, 0, 0, 0, 1, 1,
-2.325175, -0.1215198, -0.6310501, 0, 0, 0, 1, 1,
-2.305253, 0.3311555, -2.125729, 0, 0, 0, 1, 1,
-2.301079, -1.722538, -1.749546, 0, 0, 0, 1, 1,
-2.246907, 0.1384378, 1.055936, 0, 0, 0, 1, 1,
-2.228967, 0.3106625, 0.3641438, 1, 1, 1, 1, 1,
-2.226085, -0.664978, -1.152597, 1, 1, 1, 1, 1,
-2.185242, 1.194067, -0.4171336, 1, 1, 1, 1, 1,
-2.13975, 0.1942985, -1.111531, 1, 1, 1, 1, 1,
-2.120778, -1.082131, -4.282705, 1, 1, 1, 1, 1,
-2.115224, 0.6104667, -1.860161, 1, 1, 1, 1, 1,
-2.088972, -0.4504557, -1.889961, 1, 1, 1, 1, 1,
-2.08714, 0.4642445, -1.790745, 1, 1, 1, 1, 1,
-2.070771, 0.333647, -1.203611, 1, 1, 1, 1, 1,
-2.068662, -0.7370282, -2.651449, 1, 1, 1, 1, 1,
-2.052775, 0.3254513, -1.227711, 1, 1, 1, 1, 1,
-2.012691, -0.06744731, -0.005879063, 1, 1, 1, 1, 1,
-2.001437, -0.05043111, -2.442084, 1, 1, 1, 1, 1,
-1.979654, -0.480355, -1.974684, 1, 1, 1, 1, 1,
-1.903074, -1.036359, -4.183994, 1, 1, 1, 1, 1,
-1.900723, 0.2261703, -2.216571, 0, 0, 1, 1, 1,
-1.900331, -0.6102759, -2.146718, 1, 0, 0, 1, 1,
-1.897519, 0.9817041, -0.981071, 1, 0, 0, 1, 1,
-1.883825, -1.591753, -2.991233, 1, 0, 0, 1, 1,
-1.88368, 0.2426836, -2.231438, 1, 0, 0, 1, 1,
-1.849291, 1.00826, -1.020906, 1, 0, 0, 1, 1,
-1.83233, 0.3160026, -2.419181, 0, 0, 0, 1, 1,
-1.830492, -0.3026922, -1.668458, 0, 0, 0, 1, 1,
-1.804184, 0.6513447, -2.375829, 0, 0, 0, 1, 1,
-1.781645, 0.6195227, -0.5701727, 0, 0, 0, 1, 1,
-1.768575, 0.5511153, -1.13852, 0, 0, 0, 1, 1,
-1.767881, -0.1033277, -1.114819, 0, 0, 0, 1, 1,
-1.765558, 0.003753023, -1.577557, 0, 0, 0, 1, 1,
-1.76408, -0.9001912, 1.046631, 1, 1, 1, 1, 1,
-1.752872, 0.2959746, -2.803198, 1, 1, 1, 1, 1,
-1.742491, 0.8121017, -0.949403, 1, 1, 1, 1, 1,
-1.741155, -0.2467852, -2.258516, 1, 1, 1, 1, 1,
-1.739895, 0.6056399, -1.571976, 1, 1, 1, 1, 1,
-1.732448, 0.01095492, -0.4663342, 1, 1, 1, 1, 1,
-1.718688, -0.4540338, -2.312535, 1, 1, 1, 1, 1,
-1.713531, -0.4566013, -3.118898, 1, 1, 1, 1, 1,
-1.707745, 1.964384, -2.152975, 1, 1, 1, 1, 1,
-1.703691, 0.2435729, -1.1331, 1, 1, 1, 1, 1,
-1.702535, 0.7757412, -0.8897142, 1, 1, 1, 1, 1,
-1.69789, -1.537986, -0.8893587, 1, 1, 1, 1, 1,
-1.697378, -1.680247, -2.826561, 1, 1, 1, 1, 1,
-1.694526, -2.028835, -1.71093, 1, 1, 1, 1, 1,
-1.690669, -0.6032678, -1.633241, 1, 1, 1, 1, 1,
-1.687952, -0.2517187, -1.279597, 0, 0, 1, 1, 1,
-1.681662, 1.541675, -1.239069, 1, 0, 0, 1, 1,
-1.681631, 0.2089911, -2.151229, 1, 0, 0, 1, 1,
-1.664493, 1.24228, -0.9410101, 1, 0, 0, 1, 1,
-1.661918, -0.5937422, -2.476029, 1, 0, 0, 1, 1,
-1.658617, 0.0964687, -2.043234, 1, 0, 0, 1, 1,
-1.650308, 0.351576, -0.3603826, 0, 0, 0, 1, 1,
-1.643251, 1.020434, -2.837855, 0, 0, 0, 1, 1,
-1.640206, 0.6379246, -0.06365964, 0, 0, 0, 1, 1,
-1.638727, 0.6882494, -0.4644552, 0, 0, 0, 1, 1,
-1.592828, -1.147888, -2.430891, 0, 0, 0, 1, 1,
-1.574873, -1.674921, -2.128711, 0, 0, 0, 1, 1,
-1.565224, 0.9720647, 0.2178373, 0, 0, 0, 1, 1,
-1.546709, 1.495847, -3.011462, 1, 1, 1, 1, 1,
-1.531542, 0.3171337, -0.9249732, 1, 1, 1, 1, 1,
-1.531429, 0.6016191, -0.5546026, 1, 1, 1, 1, 1,
-1.527022, 1.590268, -0.04297072, 1, 1, 1, 1, 1,
-1.525867, 1.263026, 0.1108486, 1, 1, 1, 1, 1,
-1.524268, -0.2952572, -2.824084, 1, 1, 1, 1, 1,
-1.521288, 0.02646269, -0.1044836, 1, 1, 1, 1, 1,
-1.518105, -1.938681, -3.652149, 1, 1, 1, 1, 1,
-1.513191, 0.2939828, -1.703974, 1, 1, 1, 1, 1,
-1.504031, -0.0178601, -2.227221, 1, 1, 1, 1, 1,
-1.491417, 0.505244, -0.3325183, 1, 1, 1, 1, 1,
-1.484428, 0.177767, -2.991832, 1, 1, 1, 1, 1,
-1.46226, -0.9650161, -2.293313, 1, 1, 1, 1, 1,
-1.447717, -2.26797, -3.410924, 1, 1, 1, 1, 1,
-1.432982, 0.5783985, -0.3697895, 1, 1, 1, 1, 1,
-1.43031, -0.7443483, -1.576772, 0, 0, 1, 1, 1,
-1.41718, -0.3674452, -2.899362, 1, 0, 0, 1, 1,
-1.409825, 0.89749, 0.2655349, 1, 0, 0, 1, 1,
-1.409793, 0.2206799, -2.738992, 1, 0, 0, 1, 1,
-1.399219, -0.08828633, -2.097209, 1, 0, 0, 1, 1,
-1.396031, -0.8639346, -3.239903, 1, 0, 0, 1, 1,
-1.380575, -0.9016785, -1.489385, 0, 0, 0, 1, 1,
-1.377931, 1.696975, -0.8237947, 0, 0, 0, 1, 1,
-1.375255, 1.259961, 0.1265044, 0, 0, 0, 1, 1,
-1.373722, 0.09251437, -2.735701, 0, 0, 0, 1, 1,
-1.366774, 2.467366, 1.035686, 0, 0, 0, 1, 1,
-1.35666, -1.195148, -2.405663, 0, 0, 0, 1, 1,
-1.350451, 0.7928107, -0.2448958, 0, 0, 0, 1, 1,
-1.348739, 1.005167, -0.6136009, 1, 1, 1, 1, 1,
-1.345279, 0.3893682, 1.081194, 1, 1, 1, 1, 1,
-1.335619, -0.01634748, -1.747777, 1, 1, 1, 1, 1,
-1.329136, -0.4148451, -1.602924, 1, 1, 1, 1, 1,
-1.326267, 0.3751028, 0.3730175, 1, 1, 1, 1, 1,
-1.324504, -0.8047049, -3.850143, 1, 1, 1, 1, 1,
-1.317395, 0.4065984, -1.97507, 1, 1, 1, 1, 1,
-1.31483, 1.2995, 0.5232906, 1, 1, 1, 1, 1,
-1.313527, 0.2719281, -0.780824, 1, 1, 1, 1, 1,
-1.312474, 0.3824042, 0.3009534, 1, 1, 1, 1, 1,
-1.306865, 0.1551861, -2.738937, 1, 1, 1, 1, 1,
-1.299893, 1.05716, 0.5426916, 1, 1, 1, 1, 1,
-1.295738, -0.9148625, -2.133948, 1, 1, 1, 1, 1,
-1.293249, 1.181049, -1.469486, 1, 1, 1, 1, 1,
-1.286368, 0.3862596, -2.396886, 1, 1, 1, 1, 1,
-1.283687, -1.299819, -3.461573, 0, 0, 1, 1, 1,
-1.266186, 0.2384304, -0.1319228, 1, 0, 0, 1, 1,
-1.264206, -0.7046264, -2.314918, 1, 0, 0, 1, 1,
-1.254975, -0.7728547, -1.960536, 1, 0, 0, 1, 1,
-1.251114, 0.4105005, -0.3465167, 1, 0, 0, 1, 1,
-1.239567, -1.263514, -1.015256, 1, 0, 0, 1, 1,
-1.2374, -1.219854, -1.951979, 0, 0, 0, 1, 1,
-1.231004, 1.654009, -2.781684, 0, 0, 0, 1, 1,
-1.227759, 0.09833831, -2.45994, 0, 0, 0, 1, 1,
-1.21242, -0.2386289, -1.16497, 0, 0, 0, 1, 1,
-1.209336, -0.9941953, -1.291546, 0, 0, 0, 1, 1,
-1.209056, 0.002227995, -1.574662, 0, 0, 0, 1, 1,
-1.205377, 0.9900194, -2.129938, 0, 0, 0, 1, 1,
-1.205352, 1.000342, -0.3278958, 1, 1, 1, 1, 1,
-1.205234, 0.5238837, -2.96639, 1, 1, 1, 1, 1,
-1.20432, -0.553122, -3.887299, 1, 1, 1, 1, 1,
-1.195011, -0.8479744, -2.095564, 1, 1, 1, 1, 1,
-1.191408, -0.2693711, -2.422672, 1, 1, 1, 1, 1,
-1.181146, -0.1654627, -3.819021, 1, 1, 1, 1, 1,
-1.174234, 0.5727136, -3.173624, 1, 1, 1, 1, 1,
-1.164411, -1.050348, -2.122434, 1, 1, 1, 1, 1,
-1.158998, 0.9157795, -1.980887, 1, 1, 1, 1, 1,
-1.152272, 1.501641, -1.610571, 1, 1, 1, 1, 1,
-1.148318, -1.13919, -3.39544, 1, 1, 1, 1, 1,
-1.144993, 0.5542562, -1.97689, 1, 1, 1, 1, 1,
-1.139159, -0.3217044, -2.362712, 1, 1, 1, 1, 1,
-1.128867, 0.4273108, -2.110328, 1, 1, 1, 1, 1,
-1.128368, -0.4787154, -1.176024, 1, 1, 1, 1, 1,
-1.122962, 2.376831, -0.5118086, 0, 0, 1, 1, 1,
-1.121469, 0.9069272, -0.8086935, 1, 0, 0, 1, 1,
-1.11727, -0.2252049, -1.682039, 1, 0, 0, 1, 1,
-1.099616, -0.9236724, -2.506646, 1, 0, 0, 1, 1,
-1.089563, -0.3384404, -1.938342, 1, 0, 0, 1, 1,
-1.086924, -0.04516255, -3.263307, 1, 0, 0, 1, 1,
-1.080176, -0.4002885, -2.99632, 0, 0, 0, 1, 1,
-1.077855, 0.3840899, -2.763407, 0, 0, 0, 1, 1,
-1.077088, 0.2646144, -2.244167, 0, 0, 0, 1, 1,
-1.075527, -0.6251102, -1.54908, 0, 0, 0, 1, 1,
-1.072358, 0.1971329, -1.618552, 0, 0, 0, 1, 1,
-1.065072, 0.7952725, -0.9512638, 0, 0, 0, 1, 1,
-1.061905, -0.222817, -2.884847, 0, 0, 0, 1, 1,
-1.056278, 0.3317903, -0.1840841, 1, 1, 1, 1, 1,
-1.053892, -0.4582214, -2.920395, 1, 1, 1, 1, 1,
-1.052858, -0.2958313, -2.699998, 1, 1, 1, 1, 1,
-1.048913, -0.1431721, -1.113011, 1, 1, 1, 1, 1,
-1.037994, -0.5268623, -0.9377809, 1, 1, 1, 1, 1,
-1.036869, -1.579599, -2.812855, 1, 1, 1, 1, 1,
-1.035117, -0.1150698, -2.243454, 1, 1, 1, 1, 1,
-1.031693, 0.8765005, -1.381924, 1, 1, 1, 1, 1,
-1.028212, -0.7200454, -1.785954, 1, 1, 1, 1, 1,
-1.023184, -1.079573, -1.308347, 1, 1, 1, 1, 1,
-1.019761, 1.260198, 0.221539, 1, 1, 1, 1, 1,
-1.01445, -0.06616478, -2.540251, 1, 1, 1, 1, 1,
-1.011635, 0.0780347, -0.5696562, 1, 1, 1, 1, 1,
-1.008916, 1.410181, -0.2315859, 1, 1, 1, 1, 1,
-1.007167, -0.8702592, -0.1205704, 1, 1, 1, 1, 1,
-1.006517, -0.4021258, -2.392445, 0, 0, 1, 1, 1,
-1.004417, 0.3394559, -0.4210909, 1, 0, 0, 1, 1,
-1.004026, 3.166274, -1.884479, 1, 0, 0, 1, 1,
-0.9929597, -0.166185, -2.042078, 1, 0, 0, 1, 1,
-0.9892434, 2.715593, -1.165403, 1, 0, 0, 1, 1,
-0.9832197, 0.4927394, -1.740718, 1, 0, 0, 1, 1,
-0.9814857, 1.291211, -1.035515, 0, 0, 0, 1, 1,
-0.9798995, -1.420986, -3.265005, 0, 0, 0, 1, 1,
-0.9759636, -1.678201, -1.422081, 0, 0, 0, 1, 1,
-0.9750806, 1.116559, -0.03794511, 0, 0, 0, 1, 1,
-0.968949, 1.080058, -0.300005, 0, 0, 0, 1, 1,
-0.9667466, 1.193042, -0.9777935, 0, 0, 0, 1, 1,
-0.9666891, 0.4090484, -1.119409, 0, 0, 0, 1, 1,
-0.9644399, 1.300626, -0.9251595, 1, 1, 1, 1, 1,
-0.9617576, -0.959914, -2.713383, 1, 1, 1, 1, 1,
-0.9603715, -0.6704017, -0.9938193, 1, 1, 1, 1, 1,
-0.9592422, 0.9756795, 0.3861738, 1, 1, 1, 1, 1,
-0.9576895, 0.6653232, 0.08639951, 1, 1, 1, 1, 1,
-0.9542571, 1.822588, -1.329854, 1, 1, 1, 1, 1,
-0.953801, 0.4662575, -1.030673, 1, 1, 1, 1, 1,
-0.9511727, 0.8825379, -1.059984, 1, 1, 1, 1, 1,
-0.9484033, 0.166181, -1.532696, 1, 1, 1, 1, 1,
-0.933944, 1.396128, -0.412831, 1, 1, 1, 1, 1,
-0.932007, -0.3868999, -0.7251459, 1, 1, 1, 1, 1,
-0.9288951, 0.08666212, -0.03751503, 1, 1, 1, 1, 1,
-0.9281529, -0.9330776, -1.7408, 1, 1, 1, 1, 1,
-0.92509, 1.433925, -1.343295, 1, 1, 1, 1, 1,
-0.919736, -0.0926227, -0.1718728, 1, 1, 1, 1, 1,
-0.9078572, -1.393608, -3.047989, 0, 0, 1, 1, 1,
-0.893293, 1.524222, -0.7105549, 1, 0, 0, 1, 1,
-0.8929561, 0.1807285, -2.178644, 1, 0, 0, 1, 1,
-0.8912935, 0.2129863, -2.590239, 1, 0, 0, 1, 1,
-0.8856418, -1.376038, -2.642049, 1, 0, 0, 1, 1,
-0.8842175, 0.04323127, -1.631072, 1, 0, 0, 1, 1,
-0.8840006, -1.068058, 0.6330569, 0, 0, 0, 1, 1,
-0.881011, -0.4366636, -2.171272, 0, 0, 0, 1, 1,
-0.8805735, -0.6724865, -3.552476, 0, 0, 0, 1, 1,
-0.8702946, -2.536316, -1.18613, 0, 0, 0, 1, 1,
-0.8697929, -0.7306619, -1.022137, 0, 0, 0, 1, 1,
-0.86852, 1.636129, -0.8182859, 0, 0, 0, 1, 1,
-0.866161, -1.823524, -4.529175, 0, 0, 0, 1, 1,
-0.8628365, -1.035171, -4.14244, 1, 1, 1, 1, 1,
-0.858586, 0.4523001, -0.5569953, 1, 1, 1, 1, 1,
-0.8455704, 1.520269, -0.6748688, 1, 1, 1, 1, 1,
-0.8450878, 0.06247125, -0.2508433, 1, 1, 1, 1, 1,
-0.8429508, -0.8185974, -3.05026, 1, 1, 1, 1, 1,
-0.8354911, 0.2374785, -0.9983503, 1, 1, 1, 1, 1,
-0.8350896, -0.3901975, -3.217907, 1, 1, 1, 1, 1,
-0.8304977, 0.1578617, -1.141627, 1, 1, 1, 1, 1,
-0.81706, -0.6609932, -2.800194, 1, 1, 1, 1, 1,
-0.808862, -0.612009, -3.039834, 1, 1, 1, 1, 1,
-0.8082346, 0.1666006, -2.039299, 1, 1, 1, 1, 1,
-0.8080123, 0.6470525, -1.983068, 1, 1, 1, 1, 1,
-0.8079945, -0.02718925, -2.913824, 1, 1, 1, 1, 1,
-0.8070055, -1.205693, -5.856735, 1, 1, 1, 1, 1,
-0.799461, 0.06237548, -4.120884, 1, 1, 1, 1, 1,
-0.7982438, 0.8693981, 0.08960697, 0, 0, 1, 1, 1,
-0.7952482, 1.237758, -1.191056, 1, 0, 0, 1, 1,
-0.7893952, 0.9220061, 0.3856843, 1, 0, 0, 1, 1,
-0.7743624, 1.909265, 1.117452, 1, 0, 0, 1, 1,
-0.7694034, 0.416222, -1.137169, 1, 0, 0, 1, 1,
-0.7641489, -0.5123315, -3.637384, 1, 0, 0, 1, 1,
-0.7571567, 0.1234685, -1.351588, 0, 0, 0, 1, 1,
-0.7551709, 1.470873, -0.4221278, 0, 0, 0, 1, 1,
-0.7411985, -0.2963701, -0.4492655, 0, 0, 0, 1, 1,
-0.7373396, 0.08379252, -0.688372, 0, 0, 0, 1, 1,
-0.7350336, -1.085731, -1.270165, 0, 0, 0, 1, 1,
-0.7347739, -0.02329237, -1.145545, 0, 0, 0, 1, 1,
-0.7260062, -2.236404, -3.262038, 0, 0, 0, 1, 1,
-0.7237483, 0.1535413, -1.650167, 1, 1, 1, 1, 1,
-0.720878, 0.9295372, -1.07916, 1, 1, 1, 1, 1,
-0.7177381, 1.946335, -0.0794065, 1, 1, 1, 1, 1,
-0.7123328, 0.02537166, -0.4377332, 1, 1, 1, 1, 1,
-0.7093151, 1.574143, -0.6822693, 1, 1, 1, 1, 1,
-0.7033154, 0.9586627, -1.80579, 1, 1, 1, 1, 1,
-0.7029455, 1.089366, -0.134722, 1, 1, 1, 1, 1,
-0.7006065, -0.7503519, -1.980853, 1, 1, 1, 1, 1,
-0.6986559, 0.5211766, -0.1854859, 1, 1, 1, 1, 1,
-0.6956491, -1.295169, -1.24548, 1, 1, 1, 1, 1,
-0.6952018, 0.5223641, -1.899708, 1, 1, 1, 1, 1,
-0.6775815, 1.315974, 1.352854, 1, 1, 1, 1, 1,
-0.6708227, 1.215942, 0.06711827, 1, 1, 1, 1, 1,
-0.6654267, -1.35063, -2.254486, 1, 1, 1, 1, 1,
-0.6624061, -1.005541, -3.36674, 1, 1, 1, 1, 1,
-0.661634, 0.6573352, -1.49757, 0, 0, 1, 1, 1,
-0.6601844, -0.7761314, -2.303693, 1, 0, 0, 1, 1,
-0.6597924, -0.5682673, -3.653567, 1, 0, 0, 1, 1,
-0.6557555, 0.1881712, -0.1546567, 1, 0, 0, 1, 1,
-0.6550519, 1.067214, -0.3803699, 1, 0, 0, 1, 1,
-0.6487235, 0.1566513, -2.714364, 1, 0, 0, 1, 1,
-0.6473591, 2.098279, -0.4312694, 0, 0, 0, 1, 1,
-0.6463463, 1.688738, -0.3298616, 0, 0, 0, 1, 1,
-0.6461261, 0.69998, 0.01019243, 0, 0, 0, 1, 1,
-0.6368055, 0.5330716, -1.013332, 0, 0, 0, 1, 1,
-0.6359013, 0.08424764, -3.332563, 0, 0, 0, 1, 1,
-0.629454, -0.6819252, -1.881108, 0, 0, 0, 1, 1,
-0.6284171, 0.6090897, -1.004154, 0, 0, 0, 1, 1,
-0.6267381, -0.9872368, -2.618264, 1, 1, 1, 1, 1,
-0.623477, 0.3780546, -0.6794989, 1, 1, 1, 1, 1,
-0.6234615, 1.552049, -0.6688761, 1, 1, 1, 1, 1,
-0.6219484, -1.82406, -4.338075, 1, 1, 1, 1, 1,
-0.6215324, 0.2680297, -1.771316, 1, 1, 1, 1, 1,
-0.6187582, -0.658344, -2.071381, 1, 1, 1, 1, 1,
-0.611473, 0.2055761, -1.673143, 1, 1, 1, 1, 1,
-0.6114683, -0.4001612, -2.589957, 1, 1, 1, 1, 1,
-0.6074647, -1.037364, -2.774117, 1, 1, 1, 1, 1,
-0.6062067, -1.377027, -3.275299, 1, 1, 1, 1, 1,
-0.6049284, 1.016299, 1.15431, 1, 1, 1, 1, 1,
-0.6039506, 0.6415132, -1.390403, 1, 1, 1, 1, 1,
-0.6036761, 1.149766, -0.3620089, 1, 1, 1, 1, 1,
-0.6031057, -1.091558, -1.554889, 1, 1, 1, 1, 1,
-0.6026123, 1.381102, -0.8166164, 1, 1, 1, 1, 1,
-0.5970979, 0.4484569, -2.116313, 0, 0, 1, 1, 1,
-0.5958835, 0.007348763, -1.537142, 1, 0, 0, 1, 1,
-0.5911561, -1.523544, -3.183119, 1, 0, 0, 1, 1,
-0.5874476, -0.4351824, -3.154662, 1, 0, 0, 1, 1,
-0.5854079, -0.2383887, -1.194481, 1, 0, 0, 1, 1,
-0.5851008, 0.8337557, -3.725936, 1, 0, 0, 1, 1,
-0.5794258, 0.1624037, -0.5638229, 0, 0, 0, 1, 1,
-0.5764784, 1.679053, -0.1442746, 0, 0, 0, 1, 1,
-0.5750151, -1.681408, -5.728199, 0, 0, 0, 1, 1,
-0.5666291, 0.03461902, -2.025643, 0, 0, 0, 1, 1,
-0.5624559, 1.445908, -1.892993, 0, 0, 0, 1, 1,
-0.5620838, 0.4328082, 0.7483621, 0, 0, 0, 1, 1,
-0.5583673, 0.6303069, -0.7431235, 0, 0, 0, 1, 1,
-0.5547103, -0.336175, -2.188114, 1, 1, 1, 1, 1,
-0.550514, -0.2511784, -1.100553, 1, 1, 1, 1, 1,
-0.5497948, 0.3931854, -1.745044, 1, 1, 1, 1, 1,
-0.5432509, 0.09262052, -0.4314913, 1, 1, 1, 1, 1,
-0.542552, 0.8674024, 0.4532499, 1, 1, 1, 1, 1,
-0.5397165, -0.3929817, -1.484142, 1, 1, 1, 1, 1,
-0.5363657, -2.357294, -4.404094, 1, 1, 1, 1, 1,
-0.5346653, -0.503019, -2.616945, 1, 1, 1, 1, 1,
-0.5345646, -1.836927, -5.190925, 1, 1, 1, 1, 1,
-0.53356, 2.095741, -0.899156, 1, 1, 1, 1, 1,
-0.5280942, -1.96405, -2.076531, 1, 1, 1, 1, 1,
-0.5260253, -2.312569, -3.848994, 1, 1, 1, 1, 1,
-0.5254745, 1.582635, 0.5382979, 1, 1, 1, 1, 1,
-0.523813, -2.224368, -1.735155, 1, 1, 1, 1, 1,
-0.5223153, -0.2588825, -1.927491, 1, 1, 1, 1, 1,
-0.5218555, -2.337549, -2.49904, 0, 0, 1, 1, 1,
-0.52184, -0.2239992, -1.895526, 1, 0, 0, 1, 1,
-0.5212966, 1.956625, -0.3421542, 1, 0, 0, 1, 1,
-0.5200931, -1.168946, -2.250149, 1, 0, 0, 1, 1,
-0.5165135, 1.806456, 0.4630963, 1, 0, 0, 1, 1,
-0.5144871, 1.61112, -1.153565, 1, 0, 0, 1, 1,
-0.5124487, -0.3020207, -0.9320009, 0, 0, 0, 1, 1,
-0.5118705, 0.3654068, -1.48686, 0, 0, 0, 1, 1,
-0.5112321, 0.7837826, -1.697191, 0, 0, 0, 1, 1,
-0.5096544, 2.062547, -0.8766552, 0, 0, 0, 1, 1,
-0.5072556, -1.914814, -4.212401, 0, 0, 0, 1, 1,
-0.5070281, -0.2569914, -1.880815, 0, 0, 0, 1, 1,
-0.5047583, 0.456062, -0.9894518, 0, 0, 0, 1, 1,
-0.504557, 1.438492, 1.568789, 1, 1, 1, 1, 1,
-0.4982971, -0.9574755, -2.102008, 1, 1, 1, 1, 1,
-0.4953239, 0.10857, -2.089464, 1, 1, 1, 1, 1,
-0.4937965, -0.7718737, -2.96112, 1, 1, 1, 1, 1,
-0.4911425, -0.6867123, -1.792254, 1, 1, 1, 1, 1,
-0.4887155, 1.073393, 0.1812321, 1, 1, 1, 1, 1,
-0.4870811, -0.01572369, -2.052249, 1, 1, 1, 1, 1,
-0.4843595, -1.659206, -2.990922, 1, 1, 1, 1, 1,
-0.4794609, -0.1961521, -2.115916, 1, 1, 1, 1, 1,
-0.4747225, 0.2033607, 0.6436642, 1, 1, 1, 1, 1,
-0.4708626, 0.5096291, -0.3452669, 1, 1, 1, 1, 1,
-0.4702465, 0.6839595, -0.4303835, 1, 1, 1, 1, 1,
-0.4695559, -0.4721916, -1.569457, 1, 1, 1, 1, 1,
-0.4632168, 1.385957, -1.489887, 1, 1, 1, 1, 1,
-0.4570653, -0.1703193, -2.906887, 1, 1, 1, 1, 1,
-0.4540007, 0.0224332, 0.1001069, 0, 0, 1, 1, 1,
-0.4524221, -0.9218681, -2.993424, 1, 0, 0, 1, 1,
-0.4515807, -1.072935, -3.151798, 1, 0, 0, 1, 1,
-0.4498848, -1.253286, -2.487201, 1, 0, 0, 1, 1,
-0.443923, -0.1392526, -0.4686249, 1, 0, 0, 1, 1,
-0.4333661, -0.320415, -1.612158, 1, 0, 0, 1, 1,
-0.4266994, -1.401406, -3.641615, 0, 0, 0, 1, 1,
-0.4232575, -1.336217, -3.471809, 0, 0, 0, 1, 1,
-0.4217385, 0.3763016, 0.2587653, 0, 0, 0, 1, 1,
-0.4161362, -1.217655, -3.268649, 0, 0, 0, 1, 1,
-0.4157911, 1.526973, -0.7410655, 0, 0, 0, 1, 1,
-0.4075974, 2.737919, 0.01101893, 0, 0, 0, 1, 1,
-0.4067799, -0.2827415, -2.503049, 0, 0, 0, 1, 1,
-0.4013603, -0.7370649, -2.094751, 1, 1, 1, 1, 1,
-0.3921164, 0.5174636, 0.01986977, 1, 1, 1, 1, 1,
-0.3908084, -0.943855, -3.096779, 1, 1, 1, 1, 1,
-0.389194, -1.3041, -1.975913, 1, 1, 1, 1, 1,
-0.3885741, -1.082402, -1.017299, 1, 1, 1, 1, 1,
-0.3809401, -1.177355, -2.836637, 1, 1, 1, 1, 1,
-0.3796184, 0.2417366, -2.136843, 1, 1, 1, 1, 1,
-0.3778862, -0.2048894, -2.934838, 1, 1, 1, 1, 1,
-0.3776405, -0.3321757, -1.525831, 1, 1, 1, 1, 1,
-0.3735387, -1.042644, -2.94187, 1, 1, 1, 1, 1,
-0.3699028, -1.470047, -1.609439, 1, 1, 1, 1, 1,
-0.368872, -1.005547, -2.272777, 1, 1, 1, 1, 1,
-0.3646473, 0.1387293, -2.353063, 1, 1, 1, 1, 1,
-0.3641746, 0.7705838, 1.083158, 1, 1, 1, 1, 1,
-0.3623218, -0.3623809, -1.362001, 1, 1, 1, 1, 1,
-0.3579887, -0.3855395, -3.681109, 0, 0, 1, 1, 1,
-0.3568832, 0.7774158, -0.2342549, 1, 0, 0, 1, 1,
-0.3510742, -0.8516108, -3.998648, 1, 0, 0, 1, 1,
-0.3509693, 0.1023745, -1.362255, 1, 0, 0, 1, 1,
-0.3457546, -1.506034, -1.568847, 1, 0, 0, 1, 1,
-0.3435425, -0.1587155, -1.536427, 1, 0, 0, 1, 1,
-0.3407904, 2.158772, -1.265576, 0, 0, 0, 1, 1,
-0.340077, -0.232586, -2.79845, 0, 0, 0, 1, 1,
-0.3392726, -0.3244947, -2.434645, 0, 0, 0, 1, 1,
-0.3360183, 0.3459905, -2.053847, 0, 0, 0, 1, 1,
-0.3350439, -0.129377, -1.487578, 0, 0, 0, 1, 1,
-0.3325651, 0.1654139, -1.281634, 0, 0, 0, 1, 1,
-0.331053, 0.8869483, 1.730875, 0, 0, 0, 1, 1,
-0.3298964, -0.1402054, -3.610778, 1, 1, 1, 1, 1,
-0.3291287, 1.102623, -0.7300218, 1, 1, 1, 1, 1,
-0.328198, 1.95053, 0.6690213, 1, 1, 1, 1, 1,
-0.3277517, -1.41891, -3.323101, 1, 1, 1, 1, 1,
-0.3220177, 0.8558689, -0.01918475, 1, 1, 1, 1, 1,
-0.320338, -0.788923, -3.093583, 1, 1, 1, 1, 1,
-0.3184578, -1.18609, -2.273431, 1, 1, 1, 1, 1,
-0.3111548, -0.7047459, -2.959327, 1, 1, 1, 1, 1,
-0.3045365, 0.1773109, -2.053543, 1, 1, 1, 1, 1,
-0.2965801, -0.1129058, -1.953416, 1, 1, 1, 1, 1,
-0.2947342, -1.387212, -1.967035, 1, 1, 1, 1, 1,
-0.2936424, 1.246524, 2.213087, 1, 1, 1, 1, 1,
-0.2914947, -1.750455, -4.190246, 1, 1, 1, 1, 1,
-0.2866299, 0.8129444, 0.6903728, 1, 1, 1, 1, 1,
-0.2856199, -0.07513285, -2.869259, 1, 1, 1, 1, 1,
-0.2804155, 0.141171, -2.26219, 0, 0, 1, 1, 1,
-0.2787802, -1.117349, -4.210433, 1, 0, 0, 1, 1,
-0.2744341, 0.8257366, 0.937263, 1, 0, 0, 1, 1,
-0.2734351, 0.6940917, -1.958148, 1, 0, 0, 1, 1,
-0.2733818, -0.2423638, -1.975404, 1, 0, 0, 1, 1,
-0.272619, -1.265833, -3.608029, 1, 0, 0, 1, 1,
-0.2621558, 0.9313408, 0.09475324, 0, 0, 0, 1, 1,
-0.2601685, -0.1581416, -1.556928, 0, 0, 0, 1, 1,
-0.2571963, 1.092519, 0.3949018, 0, 0, 0, 1, 1,
-0.249338, -0.6168132, -1.338169, 0, 0, 0, 1, 1,
-0.2434215, -0.7680705, -4.12698, 0, 0, 0, 1, 1,
-0.2413392, 0.04767656, -1.368472, 0, 0, 0, 1, 1,
-0.2389039, -3.677764, -3.039315, 0, 0, 0, 1, 1,
-0.2366292, 1.302003, 0.735139, 1, 1, 1, 1, 1,
-0.2345901, -0.6436743, -3.028212, 1, 1, 1, 1, 1,
-0.229923, -0.4541375, -2.268067, 1, 1, 1, 1, 1,
-0.2292002, 0.8594124, -0.1432784, 1, 1, 1, 1, 1,
-0.2279429, -0.6436533, -4.028979, 1, 1, 1, 1, 1,
-0.2261732, 0.9812525, -1.643457, 1, 1, 1, 1, 1,
-0.2204546, -0.4149042, -3.362227, 1, 1, 1, 1, 1,
-0.2197076, -0.451369, -0.5869559, 1, 1, 1, 1, 1,
-0.2171407, 1.650677, 0.4441261, 1, 1, 1, 1, 1,
-0.2140616, 1.27371, -1.658586, 1, 1, 1, 1, 1,
-0.2126716, 0.5716161, -1.110334, 1, 1, 1, 1, 1,
-0.2108896, -0.1218916, -1.708718, 1, 1, 1, 1, 1,
-0.2100219, -0.3088934, -0.5278934, 1, 1, 1, 1, 1,
-0.2089478, -0.9487999, -1.379513, 1, 1, 1, 1, 1,
-0.2050436, 0.6183366, -0.3280025, 1, 1, 1, 1, 1,
-0.2020897, -1.550524, -2.242993, 0, 0, 1, 1, 1,
-0.1964834, 1.104635, 1.612139, 1, 0, 0, 1, 1,
-0.1939542, 0.08549726, -4.193393, 1, 0, 0, 1, 1,
-0.1929784, -0.008393308, -0.4196979, 1, 0, 0, 1, 1,
-0.1928488, 0.2264345, 0.707823, 1, 0, 0, 1, 1,
-0.1884285, -0.5774587, -2.412896, 1, 0, 0, 1, 1,
-0.1855055, 0.8616704, -0.3886403, 0, 0, 0, 1, 1,
-0.1823885, 0.327616, 0.9569415, 0, 0, 0, 1, 1,
-0.1813414, 1.233091, -1.209765, 0, 0, 0, 1, 1,
-0.1813366, -1.164547, -1.012788, 0, 0, 0, 1, 1,
-0.1811042, -1.11534, -2.223895, 0, 0, 0, 1, 1,
-0.180558, 0.6426743, 1.590009, 0, 0, 0, 1, 1,
-0.1723843, -0.9978893, -2.022524, 0, 0, 0, 1, 1,
-0.1687229, 0.1239329, -0.5411566, 1, 1, 1, 1, 1,
-0.1664879, 0.9425436, 1.014285, 1, 1, 1, 1, 1,
-0.1655366, 1.266958, 0.1364354, 1, 1, 1, 1, 1,
-0.1651648, -0.7820258, -2.770783, 1, 1, 1, 1, 1,
-0.161038, -0.7632105, -2.893168, 1, 1, 1, 1, 1,
-0.1581644, -0.254965, -3.69847, 1, 1, 1, 1, 1,
-0.1567574, 2.275118, 0.2707021, 1, 1, 1, 1, 1,
-0.1551084, -2.745335, -2.257, 1, 1, 1, 1, 1,
-0.1487975, 0.855979, -1.13093, 1, 1, 1, 1, 1,
-0.1388754, -0.1091582, -3.602299, 1, 1, 1, 1, 1,
-0.1385175, 1.529417, 0.1554663, 1, 1, 1, 1, 1,
-0.1384328, -0.2285445, -1.492637, 1, 1, 1, 1, 1,
-0.1379731, -0.9504303, -3.409666, 1, 1, 1, 1, 1,
-0.1351604, 1.044683, -1.337814, 1, 1, 1, 1, 1,
-0.1314395, 0.4558559, -0.2627746, 1, 1, 1, 1, 1,
-0.1171127, -0.1523999, -3.545365, 0, 0, 1, 1, 1,
-0.1123925, 1.110774, -0.2795899, 1, 0, 0, 1, 1,
-0.1111351, 0.8941913, -1.303049, 1, 0, 0, 1, 1,
-0.1090836, 0.8808283, -0.3310896, 1, 0, 0, 1, 1,
-0.1080396, 0.7719978, 0.921149, 1, 0, 0, 1, 1,
-0.1076283, 0.4443949, 0.4596744, 1, 0, 0, 1, 1,
-0.1075434, -0.3533475, -2.184939, 0, 0, 0, 1, 1,
-0.1071743, 0.2030029, 0.7851561, 0, 0, 0, 1, 1,
-0.09876866, 0.4995717, -1.033909, 0, 0, 0, 1, 1,
-0.09503113, 0.9178664, -1.752692, 0, 0, 0, 1, 1,
-0.09382579, 1.208013, -2.164138, 0, 0, 0, 1, 1,
-0.0936789, -1.666025, -2.281504, 0, 0, 0, 1, 1,
-0.09190782, 0.09278253, -2.712204, 0, 0, 0, 1, 1,
-0.08570392, 1.815324, -0.9274288, 1, 1, 1, 1, 1,
-0.0834642, 0.9260497, -1.030261, 1, 1, 1, 1, 1,
-0.07989056, -1.569987, -4.574031, 1, 1, 1, 1, 1,
-0.07694922, 0.6733177, -0.5226101, 1, 1, 1, 1, 1,
-0.07645655, 0.5310036, 1.062238, 1, 1, 1, 1, 1,
-0.07304956, 2.00012, -1.825143, 1, 1, 1, 1, 1,
-0.07246648, 0.9245886, -0.7319477, 1, 1, 1, 1, 1,
-0.07080407, 1.734239, 0.3347642, 1, 1, 1, 1, 1,
-0.07073342, -2.006468, -2.13894, 1, 1, 1, 1, 1,
-0.07057636, 1.394101, 0.5064956, 1, 1, 1, 1, 1,
-0.07055998, 0.2341249, -1.883308, 1, 1, 1, 1, 1,
-0.06628044, -0.4746755, -2.548019, 1, 1, 1, 1, 1,
-0.0658019, 0.9220884, -0.02573565, 1, 1, 1, 1, 1,
-0.06507423, -0.1539384, -2.669259, 1, 1, 1, 1, 1,
-0.06277399, -0.09409937, -2.760114, 1, 1, 1, 1, 1,
-0.05961204, -0.7230511, -3.319406, 0, 0, 1, 1, 1,
-0.05940111, 0.9329654, -1.302908, 1, 0, 0, 1, 1,
-0.05925066, -0.3968207, -0.7909257, 1, 0, 0, 1, 1,
-0.05815462, 0.1100162, -0.7570633, 1, 0, 0, 1, 1,
-0.0557341, -1.695331, -0.8391772, 1, 0, 0, 1, 1,
-0.05376241, 0.3705232, 0.8060734, 1, 0, 0, 1, 1,
-0.05084534, -1.41011, -3.625836, 0, 0, 0, 1, 1,
-0.05062147, 0.5406128, 0.3093311, 0, 0, 0, 1, 1,
-0.05052524, -0.2062453, -2.23437, 0, 0, 0, 1, 1,
-0.04828278, -0.3823788, -3.505889, 0, 0, 0, 1, 1,
-0.04576322, -1.093874, -2.956226, 0, 0, 0, 1, 1,
-0.04109132, -1.399997, -4.571164, 0, 0, 0, 1, 1,
-0.03835168, 0.1484022, 1.177745, 0, 0, 0, 1, 1,
-0.0334918, 1.023777, 0.3073512, 1, 1, 1, 1, 1,
-0.03335593, 0.3788218, 0.08233821, 1, 1, 1, 1, 1,
-0.02989333, -0.9679394, -2.908954, 1, 1, 1, 1, 1,
-0.02981415, 0.7324891, 1.363954, 1, 1, 1, 1, 1,
-0.02919401, 0.006471031, -0.565019, 1, 1, 1, 1, 1,
-0.02907706, -1.77923, -2.406078, 1, 1, 1, 1, 1,
-0.02857824, 0.03458481, 0.7290128, 1, 1, 1, 1, 1,
-0.02767291, -3.102829, -3.955828, 1, 1, 1, 1, 1,
-0.02598641, 1.207818, 3.294625, 1, 1, 1, 1, 1,
-0.007669382, 0.09689892, -3.153797, 1, 1, 1, 1, 1,
-0.007302469, 0.09295643, 1.161681, 1, 1, 1, 1, 1,
-0.006105737, -0.8227621, -1.883217, 1, 1, 1, 1, 1,
-0.005171272, -1.210354, -4.584121, 1, 1, 1, 1, 1,
-0.003389082, 2.589205, -0.5171542, 1, 1, 1, 1, 1,
-0.003372858, -0.2510836, -3.741321, 1, 1, 1, 1, 1,
0.0002342001, -0.04478012, 1.259905, 0, 0, 1, 1, 1,
0.002609441, -0.5717704, 3.256125, 1, 0, 0, 1, 1,
0.004001659, -0.7139072, 3.18335, 1, 0, 0, 1, 1,
0.00595396, 0.04909543, -0.5503892, 1, 0, 0, 1, 1,
0.01011287, -1.866182, 3.5221, 1, 0, 0, 1, 1,
0.01022814, 0.9072349, 0.07567717, 1, 0, 0, 1, 1,
0.01313764, -0.8746153, 3.422112, 0, 0, 0, 1, 1,
0.016322, 0.899917, -1.995729, 0, 0, 0, 1, 1,
0.02396679, -1.285851, 4.100737, 0, 0, 0, 1, 1,
0.02417796, -0.7907531, 3.034187, 0, 0, 0, 1, 1,
0.02741751, -1.246011, 3.56445, 0, 0, 0, 1, 1,
0.02786584, -0.617955, 3.976976, 0, 0, 0, 1, 1,
0.03077421, -3.380893, 3.425442, 0, 0, 0, 1, 1,
0.03285583, -0.4750225, 2.901613, 1, 1, 1, 1, 1,
0.03488553, 1.025378, -0.7829843, 1, 1, 1, 1, 1,
0.03495367, -0.606755, 3.793634, 1, 1, 1, 1, 1,
0.0350589, -1.496244, 2.435097, 1, 1, 1, 1, 1,
0.03518033, 0.811242, -0.446006, 1, 1, 1, 1, 1,
0.03561957, -0.7599365, 2.741155, 1, 1, 1, 1, 1,
0.03595212, -0.7362368, 2.537591, 1, 1, 1, 1, 1,
0.03609679, -0.2713819, 5.508041, 1, 1, 1, 1, 1,
0.04143964, 0.2691804, -1.190947, 1, 1, 1, 1, 1,
0.0432279, -0.9674112, 3.852275, 1, 1, 1, 1, 1,
0.04356356, -0.2401853, 5.118237, 1, 1, 1, 1, 1,
0.04448601, -1.347914, 3.505041, 1, 1, 1, 1, 1,
0.04532364, -0.00535915, 2.633348, 1, 1, 1, 1, 1,
0.04801195, -0.115675, 2.736922, 1, 1, 1, 1, 1,
0.05235879, 0.4920441, -0.2010032, 1, 1, 1, 1, 1,
0.0542183, -0.3481415, 1.101677, 0, 0, 1, 1, 1,
0.05550582, 0.3672345, -0.4127915, 1, 0, 0, 1, 1,
0.05730869, -0.6200395, 4.663276, 1, 0, 0, 1, 1,
0.06008896, 0.2107196, -0.779161, 1, 0, 0, 1, 1,
0.06054577, 0.930424, 1.774269, 1, 0, 0, 1, 1,
0.06769097, 0.2971511, -1.120626, 1, 0, 0, 1, 1,
0.06954942, 0.9172689, -0.1359008, 0, 0, 0, 1, 1,
0.07486608, 0.02415512, 0.393517, 0, 0, 0, 1, 1,
0.07686231, 2.00189, 0.842028, 0, 0, 0, 1, 1,
0.07887936, -0.7015464, 1.960324, 0, 0, 0, 1, 1,
0.08199868, -0.5098848, 2.091241, 0, 0, 0, 1, 1,
0.08433781, 0.831434, 1.166988, 0, 0, 0, 1, 1,
0.08904468, -0.1003736, 1.569884, 0, 0, 0, 1, 1,
0.09341837, -2.210184, 3.422074, 1, 1, 1, 1, 1,
0.1021491, 0.3322228, 1.341647, 1, 1, 1, 1, 1,
0.1027619, -1.679985, 1.474995, 1, 1, 1, 1, 1,
0.104435, -1.247762, 3.739436, 1, 1, 1, 1, 1,
0.1048403, -0.3385774, 2.300373, 1, 1, 1, 1, 1,
0.105248, 1.80256, 0.3648115, 1, 1, 1, 1, 1,
0.1052742, -0.2947883, 1.848263, 1, 1, 1, 1, 1,
0.1055316, -1.591421, 3.688235, 1, 1, 1, 1, 1,
0.1116529, -0.2857163, 0.3938773, 1, 1, 1, 1, 1,
0.1138667, 0.3383162, 1.00449, 1, 1, 1, 1, 1,
0.1200755, 1.322482, 0.868919, 1, 1, 1, 1, 1,
0.1219694, -0.9873445, 3.206754, 1, 1, 1, 1, 1,
0.1246352, -0.3878477, 2.811411, 1, 1, 1, 1, 1,
0.1271185, 0.3773378, 0.898649, 1, 1, 1, 1, 1,
0.1284148, -0.3320133, 3.650337, 1, 1, 1, 1, 1,
0.1330174, -0.04630287, 0.8436011, 0, 0, 1, 1, 1,
0.1342394, 1.045531, -1.016424, 1, 0, 0, 1, 1,
0.1393994, -0.705447, 3.105199, 1, 0, 0, 1, 1,
0.1397968, -0.4651446, 3.130849, 1, 0, 0, 1, 1,
0.1402154, -0.5686526, 3.308141, 1, 0, 0, 1, 1,
0.1414898, 1.653934, 0.04269523, 1, 0, 0, 1, 1,
0.1431397, -0.4434119, 3.843901, 0, 0, 0, 1, 1,
0.1489266, 1.175937, 0.2614176, 0, 0, 0, 1, 1,
0.1510427, 0.5230116, 0.5906555, 0, 0, 0, 1, 1,
0.1526799, -1.267433, 4.24241, 0, 0, 0, 1, 1,
0.1535552, -0.6071602, 2.982157, 0, 0, 0, 1, 1,
0.1537929, 0.5502761, 1.863188, 0, 0, 0, 1, 1,
0.1549148, -0.3990609, 2.573095, 0, 0, 0, 1, 1,
0.1579493, -0.31174, 2.516, 1, 1, 1, 1, 1,
0.1582069, 2.020406, 1.153792, 1, 1, 1, 1, 1,
0.1591672, -2.740045, 4.522558, 1, 1, 1, 1, 1,
0.1598299, -0.1208111, 2.25504, 1, 1, 1, 1, 1,
0.1614567, -0.8519685, 1.23964, 1, 1, 1, 1, 1,
0.1704575, -0.6515161, 2.572674, 1, 1, 1, 1, 1,
0.1736306, 0.7540678, -0.9980674, 1, 1, 1, 1, 1,
0.1814726, 0.06470299, 1.955145, 1, 1, 1, 1, 1,
0.1843532, 0.678465, -0.5366058, 1, 1, 1, 1, 1,
0.1856737, -1.896597, 3.825678, 1, 1, 1, 1, 1,
0.1867312, -1.224394, 1.919561, 1, 1, 1, 1, 1,
0.1884597, -0.6651329, 3.830591, 1, 1, 1, 1, 1,
0.1891701, -1.043665, 4.440182, 1, 1, 1, 1, 1,
0.1921345, 1.315371, 0.4968965, 1, 1, 1, 1, 1,
0.1931316, -0.6533336, 3.932497, 1, 1, 1, 1, 1,
0.1950333, -0.6441082, 2.489311, 0, 0, 1, 1, 1,
0.1959507, -0.07929417, 2.045645, 1, 0, 0, 1, 1,
0.1975739, -1.22832, 2.828105, 1, 0, 0, 1, 1,
0.2013387, 0.1901677, 1.341719, 1, 0, 0, 1, 1,
0.2023792, -0.0552796, 1.453872, 1, 0, 0, 1, 1,
0.20346, -0.04784955, 1.518105, 1, 0, 0, 1, 1,
0.2077973, -0.2260548, 2.818256, 0, 0, 0, 1, 1,
0.208437, -0.08662767, 3.073227, 0, 0, 0, 1, 1,
0.2100605, 1.661495, -0.4604865, 0, 0, 0, 1, 1,
0.2160981, 1.66043, 1.080572, 0, 0, 0, 1, 1,
0.2162866, 1.680298, 1.395489, 0, 0, 0, 1, 1,
0.2190083, -1.227837, 4.71678, 0, 0, 0, 1, 1,
0.2192438, 0.2177399, 2.761235, 0, 0, 0, 1, 1,
0.2193447, -0.04051511, 2.188846, 1, 1, 1, 1, 1,
0.2220227, -1.345644, 3.056451, 1, 1, 1, 1, 1,
0.2243256, -1.673217, 1.002327, 1, 1, 1, 1, 1,
0.2290122, -0.4738097, 0.9533184, 1, 1, 1, 1, 1,
0.2292454, 0.9487087, 0.591368, 1, 1, 1, 1, 1,
0.234693, -0.05771278, 2.785831, 1, 1, 1, 1, 1,
0.2361996, 0.4451871, 1.193192, 1, 1, 1, 1, 1,
0.2441648, 0.7164037, 1.793615, 1, 1, 1, 1, 1,
0.2448775, 1.5075, 1.848637, 1, 1, 1, 1, 1,
0.246387, -1.032561, 2.888056, 1, 1, 1, 1, 1,
0.2466316, -1.443164, 4.160504, 1, 1, 1, 1, 1,
0.2527971, 0.00403976, -0.006830298, 1, 1, 1, 1, 1,
0.2531075, 0.411752, 2.415392, 1, 1, 1, 1, 1,
0.2537975, 0.3111657, -1.451422, 1, 1, 1, 1, 1,
0.2545292, -0.4331086, 1.219104, 1, 1, 1, 1, 1,
0.2545624, -1.550112, 2.783873, 0, 0, 1, 1, 1,
0.257495, -0.5564274, 2.794077, 1, 0, 0, 1, 1,
0.2632571, -0.6578053, 3.002263, 1, 0, 0, 1, 1,
0.2633949, 1.282162, 1.284352, 1, 0, 0, 1, 1,
0.2651102, -0.1523039, 1.519501, 1, 0, 0, 1, 1,
0.2652045, -0.01746307, 0.5216896, 1, 0, 0, 1, 1,
0.2670041, 0.5588667, 0.07450284, 0, 0, 0, 1, 1,
0.2710612, -0.9436085, 3.16261, 0, 0, 0, 1, 1,
0.2735533, 0.7846169, 2.117276, 0, 0, 0, 1, 1,
0.2749121, 0.3483566, 1.84243, 0, 0, 0, 1, 1,
0.2785889, -0.502099, 2.366966, 0, 0, 0, 1, 1,
0.2803678, 0.1808969, 0.5643919, 0, 0, 0, 1, 1,
0.2834135, -1.331398, 2.178224, 0, 0, 0, 1, 1,
0.2846466, 1.051653, 0.3245906, 1, 1, 1, 1, 1,
0.2882096, -0.405425, 1.043494, 1, 1, 1, 1, 1,
0.2885455, -0.4018179, 2.450109, 1, 1, 1, 1, 1,
0.2899052, 0.145151, -0.8377913, 1, 1, 1, 1, 1,
0.2909378, 1.175633, 0.9035753, 1, 1, 1, 1, 1,
0.2964028, 0.951385, -0.08430631, 1, 1, 1, 1, 1,
0.2982594, 0.8827289, 1.174102, 1, 1, 1, 1, 1,
0.3077352, 2.367779, 0.1049197, 1, 1, 1, 1, 1,
0.310814, 0.7286189, 0.4206165, 1, 1, 1, 1, 1,
0.3109702, 0.5597617, -0.4223437, 1, 1, 1, 1, 1,
0.3160597, -1.128559, 2.03282, 1, 1, 1, 1, 1,
0.317012, 1.251279, -0.9774939, 1, 1, 1, 1, 1,
0.3172067, 0.7674996, 0.623917, 1, 1, 1, 1, 1,
0.3195567, -1.226804, 3.068534, 1, 1, 1, 1, 1,
0.3207734, -0.3320253, 3.026862, 1, 1, 1, 1, 1,
0.3231411, -0.06861195, 2.934606, 0, 0, 1, 1, 1,
0.3279808, 0.05820423, 0.2962153, 1, 0, 0, 1, 1,
0.3346513, -1.664496, 3.746063, 1, 0, 0, 1, 1,
0.3379024, -1.141348, 1.308702, 1, 0, 0, 1, 1,
0.3391433, 1.035912, 2.181868, 1, 0, 0, 1, 1,
0.3398505, -0.08939575, 1.355569, 1, 0, 0, 1, 1,
0.3401963, -0.7538087, 2.562889, 0, 0, 0, 1, 1,
0.3434028, 0.9825138, 0.4642414, 0, 0, 0, 1, 1,
0.3466115, 0.2447836, 0.9382294, 0, 0, 0, 1, 1,
0.3484292, 1.168207, 2.343727, 0, 0, 0, 1, 1,
0.3485444, -1.85331, 2.870966, 0, 0, 0, 1, 1,
0.3503138, -0.9709966, 3.026981, 0, 0, 0, 1, 1,
0.3520654, 1.213506, 2.065178, 0, 0, 0, 1, 1,
0.3558336, -0.9886833, 4.001625, 1, 1, 1, 1, 1,
0.3562514, -0.6153894, 0.7690224, 1, 1, 1, 1, 1,
0.359483, -1.411638, 0.99292, 1, 1, 1, 1, 1,
0.3599303, -0.7546683, 3.121575, 1, 1, 1, 1, 1,
0.3616827, -0.540684, 2.896356, 1, 1, 1, 1, 1,
0.3742222, -0.6885855, 3.03196, 1, 1, 1, 1, 1,
0.3857903, -0.1118298, 1.340848, 1, 1, 1, 1, 1,
0.3888764, -1.304074, 1.874418, 1, 1, 1, 1, 1,
0.3904006, 0.2095046, 3.779218, 1, 1, 1, 1, 1,
0.392203, 0.4894421, 1.098932, 1, 1, 1, 1, 1,
0.3947104, -1.377165, 3.090133, 1, 1, 1, 1, 1,
0.3995201, 0.2933687, 0.2938651, 1, 1, 1, 1, 1,
0.4014897, 0.5797812, 1.391281, 1, 1, 1, 1, 1,
0.4026459, 0.5579834, 1.717257, 1, 1, 1, 1, 1,
0.4045475, -0.5980494, 2.827703, 1, 1, 1, 1, 1,
0.4061714, 1.162747, 0.3548998, 0, 0, 1, 1, 1,
0.4087207, -0.723652, 3.222982, 1, 0, 0, 1, 1,
0.4102419, -0.6242902, 1.157945, 1, 0, 0, 1, 1,
0.4107363, 0.4964748, 0.5588911, 1, 0, 0, 1, 1,
0.4163455, 0.8436335, -0.04021056, 1, 0, 0, 1, 1,
0.4176186, 0.8244307, -1.343097, 1, 0, 0, 1, 1,
0.4215147, -2.123898, 2.983487, 0, 0, 0, 1, 1,
0.4242165, 2.026822, -0.4616354, 0, 0, 0, 1, 1,
0.4271701, 1.104075, 0.1523893, 0, 0, 0, 1, 1,
0.4292258, 0.009588752, 1.647583, 0, 0, 0, 1, 1,
0.4296192, 0.763885, 1.184165, 0, 0, 0, 1, 1,
0.4314102, 0.977162, 0.795669, 0, 0, 0, 1, 1,
0.4341272, 0.7545543, 0.7087378, 0, 0, 0, 1, 1,
0.434826, -2.414435, 3.71487, 1, 1, 1, 1, 1,
0.4361469, 1.721136, 1.779424, 1, 1, 1, 1, 1,
0.4392798, -0.0460394, 1.928852, 1, 1, 1, 1, 1,
0.4395325, -0.5300038, 2.154865, 1, 1, 1, 1, 1,
0.4423846, -0.9817825, 2.789459, 1, 1, 1, 1, 1,
0.4440918, 0.01576965, 1.223397, 1, 1, 1, 1, 1,
0.446795, -0.06610451, 2.813907, 1, 1, 1, 1, 1,
0.4481728, 0.8156424, -0.458642, 1, 1, 1, 1, 1,
0.4486378, 0.7115023, -0.5960054, 1, 1, 1, 1, 1,
0.4488126, 0.2195358, -0.7207634, 1, 1, 1, 1, 1,
0.4499626, 0.004323349, 1.575767, 1, 1, 1, 1, 1,
0.4503603, -0.9649259, 2.4348, 1, 1, 1, 1, 1,
0.4550957, -0.713207, 1.919719, 1, 1, 1, 1, 1,
0.4566159, 0.0572217, 1.17413, 1, 1, 1, 1, 1,
0.4587849, -0.287404, 0.4664092, 1, 1, 1, 1, 1,
0.4607823, -0.2279081, 2.403367, 0, 0, 1, 1, 1,
0.4619384, 0.5250682, 2.67241, 1, 0, 0, 1, 1,
0.4632241, -0.4574602, 2.835015, 1, 0, 0, 1, 1,
0.4680005, -0.4708716, 4.096657, 1, 0, 0, 1, 1,
0.4682499, -0.6169341, 0.6344976, 1, 0, 0, 1, 1,
0.4727916, 0.8172106, -0.5760313, 1, 0, 0, 1, 1,
0.4743527, -0.1316438, 1.977687, 0, 0, 0, 1, 1,
0.4752088, 0.7540462, 2.314486, 0, 0, 0, 1, 1,
0.4756821, 0.2142713, 1.364866, 0, 0, 0, 1, 1,
0.4760913, 0.6539801, 2.147291, 0, 0, 0, 1, 1,
0.4782049, 1.042632, 0.7809819, 0, 0, 0, 1, 1,
0.4790934, -0.2974113, 0.2655194, 0, 0, 0, 1, 1,
0.4791891, -0.2000851, 3.234823, 0, 0, 0, 1, 1,
0.4835944, -1.126906, 2.562154, 1, 1, 1, 1, 1,
0.4913858, 0.4969473, 1.320043, 1, 1, 1, 1, 1,
0.4932387, -1.045333, 3.312853, 1, 1, 1, 1, 1,
0.4959186, -0.9669229, 2.972567, 1, 1, 1, 1, 1,
0.4985514, 1.03483, 0.5880647, 1, 1, 1, 1, 1,
0.5006087, -1.308613, 2.215196, 1, 1, 1, 1, 1,
0.5035819, 0.6898416, -0.5019065, 1, 1, 1, 1, 1,
0.5075892, -0.3789033, 2.619461, 1, 1, 1, 1, 1,
0.5082512, 0.2849405, 1.484433, 1, 1, 1, 1, 1,
0.5093063, 0.4560158, 2.631478, 1, 1, 1, 1, 1,
0.5099574, 0.8035898, 2.246689, 1, 1, 1, 1, 1,
0.5188714, 0.4519271, 2.147207, 1, 1, 1, 1, 1,
0.5193827, 0.6968228, 0.2776042, 1, 1, 1, 1, 1,
0.5204028, -0.04986296, 1.062569, 1, 1, 1, 1, 1,
0.5217549, -0.2090588, 2.691175, 1, 1, 1, 1, 1,
0.523378, -1.270257, 1.042974, 0, 0, 1, 1, 1,
0.5259386, -0.0027592, 0.9408668, 1, 0, 0, 1, 1,
0.5261794, 0.3098621, 0.9998305, 1, 0, 0, 1, 1,
0.5263025, -0.6475784, 3.197351, 1, 0, 0, 1, 1,
0.531134, 2.127407, -0.7309506, 1, 0, 0, 1, 1,
0.5329618, -1.023237, 2.326127, 1, 0, 0, 1, 1,
0.5347386, -1.416026, 2.011413, 0, 0, 0, 1, 1,
0.5382411, 0.7937797, -0.1160387, 0, 0, 0, 1, 1,
0.5407896, 1.761399, 0.2741893, 0, 0, 0, 1, 1,
0.5514573, 1.062051, 0.3593951, 0, 0, 0, 1, 1,
0.5535995, -1.768387, 1.295285, 0, 0, 0, 1, 1,
0.5545359, -0.2223591, 2.258572, 0, 0, 0, 1, 1,
0.5591805, -0.2335732, 1.932025, 0, 0, 0, 1, 1,
0.5700892, -1.671854, 2.258367, 1, 1, 1, 1, 1,
0.5745735, -0.7033872, 1.707036, 1, 1, 1, 1, 1,
0.5809785, 0.4092779, 0.7986521, 1, 1, 1, 1, 1,
0.5814421, 0.7814577, 1.202049, 1, 1, 1, 1, 1,
0.586201, 0.07529765, 2.265452, 1, 1, 1, 1, 1,
0.589539, 0.5887518, 2.051752, 1, 1, 1, 1, 1,
0.5902815, 0.8924147, 1.194447, 1, 1, 1, 1, 1,
0.5928068, 0.4207844, 1.451764, 1, 1, 1, 1, 1,
0.5959285, 0.2519455, 2.479059, 1, 1, 1, 1, 1,
0.5963817, -0.8043582, 1.992142, 1, 1, 1, 1, 1,
0.601399, -0.3419385, 1.531975, 1, 1, 1, 1, 1,
0.6079155, 0.6108661, -0.5423685, 1, 1, 1, 1, 1,
0.6095911, 1.620403, 0.05438324, 1, 1, 1, 1, 1,
0.6099537, 3.630903, 0.3360931, 1, 1, 1, 1, 1,
0.6125567, -0.5207986, 1.887977, 1, 1, 1, 1, 1,
0.6252581, -1.420434, 3.378492, 0, 0, 1, 1, 1,
0.6255838, 1.490871, 0.6314759, 1, 0, 0, 1, 1,
0.6306369, -1.475269, 4.049007, 1, 0, 0, 1, 1,
0.6334201, -0.4418165, 1.672532, 1, 0, 0, 1, 1,
0.634204, -0.8833651, 1.543073, 1, 0, 0, 1, 1,
0.6387545, 1.669488, -0.792307, 1, 0, 0, 1, 1,
0.6413196, -0.8103839, 2.542885, 0, 0, 0, 1, 1,
0.6471198, 0.6896349, -0.7010594, 0, 0, 0, 1, 1,
0.6482784, -0.7726835, 2.98607, 0, 0, 0, 1, 1,
0.6522498, -0.7271965, 2.36155, 0, 0, 0, 1, 1,
0.6537122, 0.3667995, 1.90982, 0, 0, 0, 1, 1,
0.6592892, -0.6873078, 1.054448, 0, 0, 0, 1, 1,
0.6642345, 1.885752, 0.6309543, 0, 0, 0, 1, 1,
0.6674072, 0.1238838, 0.3560086, 1, 1, 1, 1, 1,
0.6714291, -0.3902004, 2.727387, 1, 1, 1, 1, 1,
0.6752611, 0.4818772, 1.553853, 1, 1, 1, 1, 1,
0.6827521, -1.275127, 2.325237, 1, 1, 1, 1, 1,
0.68442, -2.563172, 2.742426, 1, 1, 1, 1, 1,
0.6855394, 1.08875, 0.1216691, 1, 1, 1, 1, 1,
0.6888226, -0.7698892, 3.745007, 1, 1, 1, 1, 1,
0.7076621, -0.222845, 1.849849, 1, 1, 1, 1, 1,
0.7083932, -0.166937, 2.133703, 1, 1, 1, 1, 1,
0.7100898, -0.1988415, 2.099675, 1, 1, 1, 1, 1,
0.711161, -0.2897964, 3.163187, 1, 1, 1, 1, 1,
0.7126705, -0.2881316, 2.865364, 1, 1, 1, 1, 1,
0.7168193, 0.1542297, 2.874372, 1, 1, 1, 1, 1,
0.7242855, -0.5475402, 3.173609, 1, 1, 1, 1, 1,
0.726412, -1.973693, 2.25721, 1, 1, 1, 1, 1,
0.734135, -0.8824472, 1.818927, 0, 0, 1, 1, 1,
0.7351074, 0.3835901, 0.7959738, 1, 0, 0, 1, 1,
0.735997, 0.09126943, -0.3228942, 1, 0, 0, 1, 1,
0.7378175, -0.1627614, 1.565013, 1, 0, 0, 1, 1,
0.7404696, -2.076967, 2.201886, 1, 0, 0, 1, 1,
0.7405464, 0.5649254, 0.7420095, 1, 0, 0, 1, 1,
0.7424741, -0.6297354, 1.661235, 0, 0, 0, 1, 1,
0.7496473, 0.3559588, 1.860343, 0, 0, 0, 1, 1,
0.7547625, -1.059171, 2.740639, 0, 0, 0, 1, 1,
0.7557554, -1.666027, 2.878925, 0, 0, 0, 1, 1,
0.7580317, 0.6842486, 0.7848471, 0, 0, 0, 1, 1,
0.7586234, -0.6697575, 1.856495, 0, 0, 0, 1, 1,
0.759228, 0.873381, 1.386951, 0, 0, 0, 1, 1,
0.7680488, -1.285152, 1.829851, 1, 1, 1, 1, 1,
0.7716195, -0.4561104, 3.648017, 1, 1, 1, 1, 1,
0.7723203, 0.1753203, 0.5840206, 1, 1, 1, 1, 1,
0.7779095, 1.605784, -0.1828894, 1, 1, 1, 1, 1,
0.7844095, 2.266005, -0.1806558, 1, 1, 1, 1, 1,
0.7887694, -0.785372, 3.344, 1, 1, 1, 1, 1,
0.7898473, -1.033915, 3.126637, 1, 1, 1, 1, 1,
0.8058044, -0.4500994, 3.455677, 1, 1, 1, 1, 1,
0.8062975, -1.595598, 1.052853, 1, 1, 1, 1, 1,
0.8066147, 1.427129, 0.5660972, 1, 1, 1, 1, 1,
0.8085564, -0.8255467, 2.162066, 1, 1, 1, 1, 1,
0.8106555, 0.3537045, 0.6363921, 1, 1, 1, 1, 1,
0.8167943, 2.19288, 1.167359, 1, 1, 1, 1, 1,
0.8236315, -0.3121609, -0.1364635, 1, 1, 1, 1, 1,
0.8274657, -0.1862759, 0.8540142, 1, 1, 1, 1, 1,
0.8286715, 0.4525215, 0.3602901, 0, 0, 1, 1, 1,
0.8379093, -0.910602, 2.515715, 1, 0, 0, 1, 1,
0.8387982, 0.3622564, 0.7317256, 1, 0, 0, 1, 1,
0.8422667, -0.5839415, 1.322221, 1, 0, 0, 1, 1,
0.8484309, 0.2987222, 1.438935, 1, 0, 0, 1, 1,
0.8519014, -2.196066, 1.781325, 1, 0, 0, 1, 1,
0.8547158, 0.1205382, 0.5333379, 0, 0, 0, 1, 1,
0.8618317, -0.6630239, 1.586962, 0, 0, 0, 1, 1,
0.8660991, 1.193142, 0.0918811, 0, 0, 0, 1, 1,
0.8681021, -0.8474178, 2.873662, 0, 0, 0, 1, 1,
0.8738, -1.271024, 1.077431, 0, 0, 0, 1, 1,
0.8744152, 1.083418, 0.5981686, 0, 0, 0, 1, 1,
0.8769741, -0.9312122, 2.04061, 0, 0, 0, 1, 1,
0.8806949, 0.6603253, -0.5363205, 1, 1, 1, 1, 1,
0.8856445, -0.1611066, -0.8070128, 1, 1, 1, 1, 1,
0.8874073, -0.07467397, 2.229234, 1, 1, 1, 1, 1,
0.88806, -0.4260827, 2.68053, 1, 1, 1, 1, 1,
0.895235, 1.905472, -0.250799, 1, 1, 1, 1, 1,
0.8973384, -0.324461, 1.044265, 1, 1, 1, 1, 1,
0.900353, -0.1057439, 2.239383, 1, 1, 1, 1, 1,
0.9031506, -0.01587818, 4.140158, 1, 1, 1, 1, 1,
0.9045202, -0.6564851, 2.955692, 1, 1, 1, 1, 1,
0.9115457, 1.254525, 1.338956, 1, 1, 1, 1, 1,
0.9162542, 0.06950033, 0.9162464, 1, 1, 1, 1, 1,
0.9180109, -0.2087298, 1.683579, 1, 1, 1, 1, 1,
0.9222575, 0.6826164, -0.2501907, 1, 1, 1, 1, 1,
0.9251111, -0.160997, 1.265219, 1, 1, 1, 1, 1,
0.9420093, 0.4030399, 1.180637, 1, 1, 1, 1, 1,
0.943992, -0.2667353, 2.383182, 0, 0, 1, 1, 1,
0.9450835, 2.085924, -0.03210051, 1, 0, 0, 1, 1,
0.9455835, -1.98236, 3.479035, 1, 0, 0, 1, 1,
0.9528121, -0.6245793, 3.010147, 1, 0, 0, 1, 1,
0.9532182, 0.7847771, -0.6292365, 1, 0, 0, 1, 1,
0.9547681, 0.02057913, 1.192196, 1, 0, 0, 1, 1,
0.9552947, 1.7232, -0.8531823, 0, 0, 0, 1, 1,
0.9579352, 1.572051, 0.4511348, 0, 0, 0, 1, 1,
0.9703659, -0.9832962, 1.998382, 0, 0, 0, 1, 1,
0.9708861, -1.043772, 1.725608, 0, 0, 0, 1, 1,
0.9808171, 0.3097718, 0.5075837, 0, 0, 0, 1, 1,
0.984785, -1.091038, 1.8251, 0, 0, 0, 1, 1,
0.9867145, 0.013399, 3.36644, 0, 0, 0, 1, 1,
0.988041, -1.743582, 3.751156, 1, 1, 1, 1, 1,
0.9900972, -0.5930956, 2.200422, 1, 1, 1, 1, 1,
0.9949482, -2.025587, 1.75788, 1, 1, 1, 1, 1,
0.9958965, -1.385897, 2.657121, 1, 1, 1, 1, 1,
1.019222, 1.008402, 0.7553298, 1, 1, 1, 1, 1,
1.019448, -0.178676, 1.431914, 1, 1, 1, 1, 1,
1.026966, 0.8036662, -0.2495087, 1, 1, 1, 1, 1,
1.031024, -0.3127101, 1.090037, 1, 1, 1, 1, 1,
1.032176, -0.1652098, 1.497707, 1, 1, 1, 1, 1,
1.045526, -0.2616071, 2.272363, 1, 1, 1, 1, 1,
1.048405, 0.3145217, 1.443744, 1, 1, 1, 1, 1,
1.064182, -0.6393838, 2.294754, 1, 1, 1, 1, 1,
1.071389, -1.283593, 1.890012, 1, 1, 1, 1, 1,
1.075165, -2.510367, 1.658324, 1, 1, 1, 1, 1,
1.07523, 1.748773, 1.962865, 1, 1, 1, 1, 1,
1.076466, -0.5963, 1.093204, 0, 0, 1, 1, 1,
1.079469, -1.380334, 4.303669, 1, 0, 0, 1, 1,
1.080033, 0.1487432, 2.519994, 1, 0, 0, 1, 1,
1.08417, 0.9795664, 2.338474, 1, 0, 0, 1, 1,
1.086132, -1.233024, 1.290002, 1, 0, 0, 1, 1,
1.090356, -0.3755133, 1.688272, 1, 0, 0, 1, 1,
1.10995, 1.730523, -0.1089788, 0, 0, 0, 1, 1,
1.113174, 1.27799, -0.8586544, 0, 0, 0, 1, 1,
1.12313, 0.5233654, 1.463324, 0, 0, 0, 1, 1,
1.124018, 0.5030041, 1.075114, 0, 0, 0, 1, 1,
1.131867, -2.002129, 2.293521, 0, 0, 0, 1, 1,
1.133157, 1.009755, 0.8924957, 0, 0, 0, 1, 1,
1.137001, 0.7341459, 2.070964, 0, 0, 0, 1, 1,
1.143718, -0.6853276, 2.306621, 1, 1, 1, 1, 1,
1.149695, -0.3558325, 0.4044952, 1, 1, 1, 1, 1,
1.152896, -0.4159548, 0.7312196, 1, 1, 1, 1, 1,
1.155049, 1.039158, 1.421633, 1, 1, 1, 1, 1,
1.156662, -0.2993048, 0.8868442, 1, 1, 1, 1, 1,
1.163989, 1.019734, -0.9161276, 1, 1, 1, 1, 1,
1.164728, -1.045077, 3.265168, 1, 1, 1, 1, 1,
1.172704, 1.755143, 0.6310523, 1, 1, 1, 1, 1,
1.174555, 0.1045792, 0.5411758, 1, 1, 1, 1, 1,
1.18938, 0.2699685, 0.9900341, 1, 1, 1, 1, 1,
1.202843, 0.850803, -0.3119349, 1, 1, 1, 1, 1,
1.205241, 1.035073, -1.263348, 1, 1, 1, 1, 1,
1.210546, 1.497962, 1.47932, 1, 1, 1, 1, 1,
1.210799, -0.1060429, 2.770865, 1, 1, 1, 1, 1,
1.211607, 1.736606, 3.216828, 1, 1, 1, 1, 1,
1.216437, 0.2618546, 2.515836, 0, 0, 1, 1, 1,
1.216723, -0.7939337, 1.693154, 1, 0, 0, 1, 1,
1.223047, 0.9062053, -1.399461, 1, 0, 0, 1, 1,
1.244115, -0.5660177, 2.215034, 1, 0, 0, 1, 1,
1.251469, -0.5604388, 4.652547, 1, 0, 0, 1, 1,
1.272511, -0.5805812, 0.9269332, 1, 0, 0, 1, 1,
1.298692, 0.3239248, 2.55893, 0, 0, 0, 1, 1,
1.306973, 0.3399642, 0.5219146, 0, 0, 0, 1, 1,
1.312501, -0.2103986, 1.738903, 0, 0, 0, 1, 1,
1.323142, -0.1864736, 2.094175, 0, 0, 0, 1, 1,
1.32558, -0.9615985, 1.775945, 0, 0, 0, 1, 1,
1.327363, -0.6075814, 2.001145, 0, 0, 0, 1, 1,
1.328624, -0.3083599, 2.383486, 0, 0, 0, 1, 1,
1.332272, 0.06389004, 0.4788582, 1, 1, 1, 1, 1,
1.337516, 1.285085, 0.3241461, 1, 1, 1, 1, 1,
1.35217, -1.753421, 2.095983, 1, 1, 1, 1, 1,
1.363883, -1.842979, 2.177183, 1, 1, 1, 1, 1,
1.367379, 2.04142, -0.8811978, 1, 1, 1, 1, 1,
1.369043, -1.781192, 2.985344, 1, 1, 1, 1, 1,
1.37268, 0.02860217, 2.381912, 1, 1, 1, 1, 1,
1.37721, 0.4688211, 1.161389, 1, 1, 1, 1, 1,
1.380979, -0.6331432, 2.963194, 1, 1, 1, 1, 1,
1.384767, -0.6652886, 1.443647, 1, 1, 1, 1, 1,
1.386164, 0.5432096, 1.190921, 1, 1, 1, 1, 1,
1.387156, -2.773801, 1.308996, 1, 1, 1, 1, 1,
1.390833, 1.045631, 0.8247508, 1, 1, 1, 1, 1,
1.399074, 1.839762, 0.8817803, 1, 1, 1, 1, 1,
1.406266, -0.2506208, 2.846152, 1, 1, 1, 1, 1,
1.415526, -1.519141, 2.452821, 0, 0, 1, 1, 1,
1.417025, -0.7846744, 0.6889008, 1, 0, 0, 1, 1,
1.41752, -0.2149823, 2.587039, 1, 0, 0, 1, 1,
1.418046, 0.9313447, -0.2186143, 1, 0, 0, 1, 1,
1.425145, 0.02304041, 3.704228, 1, 0, 0, 1, 1,
1.43849, 0.5271646, 1.807276, 1, 0, 0, 1, 1,
1.448506, -1.213885, 2.318384, 0, 0, 0, 1, 1,
1.461856, 1.868769, -1.466275, 0, 0, 0, 1, 1,
1.468134, 0.3484012, 2.248665, 0, 0, 0, 1, 1,
1.471601, 0.3841323, 0.19464, 0, 0, 0, 1, 1,
1.48064, 0.8126938, 1.414497, 0, 0, 0, 1, 1,
1.491757, -0.6809988, 3.117973, 0, 0, 0, 1, 1,
1.496781, 0.6608096, 1.9499, 0, 0, 0, 1, 1,
1.497878, -0.5812595, 0.3027599, 1, 1, 1, 1, 1,
1.501655, 1.443596, 1.083309, 1, 1, 1, 1, 1,
1.506967, -0.2875009, 1.220877, 1, 1, 1, 1, 1,
1.540277, -0.8645739, 2.004078, 1, 1, 1, 1, 1,
1.55514, -1.457287, 2.837205, 1, 1, 1, 1, 1,
1.563447, -0.7586036, 3.499107, 1, 1, 1, 1, 1,
1.583683, 0.717493, 0.002172044, 1, 1, 1, 1, 1,
1.589955, -0.5538417, 0.2340878, 1, 1, 1, 1, 1,
1.606193, 2.582757, 2.038799, 1, 1, 1, 1, 1,
1.636208, -0.2815732, 1.90609, 1, 1, 1, 1, 1,
1.640731, 0.9813409, 0.9626665, 1, 1, 1, 1, 1,
1.652336, -0.3007369, 1.295009, 1, 1, 1, 1, 1,
1.65753, -1.608147, 3.496585, 1, 1, 1, 1, 1,
1.67328, -0.3788261, 2.096583, 1, 1, 1, 1, 1,
1.678521, -0.8961976, 0.949594, 1, 1, 1, 1, 1,
1.696264, -2.185367, 2.621915, 0, 0, 1, 1, 1,
1.70001, -0.5811791, 1.138736, 1, 0, 0, 1, 1,
1.715612, -0.9572882, 2.803821, 1, 0, 0, 1, 1,
1.783868, -1.615994, 3.909913, 1, 0, 0, 1, 1,
1.82347, -0.3144462, 2.378776, 1, 0, 0, 1, 1,
1.830045, 0.8406848, 1.97803, 1, 0, 0, 1, 1,
1.831665, 0.04186958, 1.019587, 0, 0, 0, 1, 1,
1.838494, 2.250063, 0.8628486, 0, 0, 0, 1, 1,
1.852531, 0.1345747, 1.102536, 0, 0, 0, 1, 1,
1.854573, -0.9847708, 2.292027, 0, 0, 0, 1, 1,
1.85591, 0.2994968, 1.455189, 0, 0, 0, 1, 1,
1.873561, 0.7438207, 0.1129194, 0, 0, 0, 1, 1,
1.876984, 0.402943, -0.04741561, 0, 0, 0, 1, 1,
1.878168, -1.919732, 1.538062, 1, 1, 1, 1, 1,
1.894886, -1.325638, 0.8447299, 1, 1, 1, 1, 1,
1.900844, 0.5909874, 3.622255, 1, 1, 1, 1, 1,
1.926523, -0.5493109, 1.577072, 1, 1, 1, 1, 1,
1.935547, 1.602475, 1.021753, 1, 1, 1, 1, 1,
1.947233, 0.5060434, -1.104772, 1, 1, 1, 1, 1,
1.951922, 0.5026884, 0.9453498, 1, 1, 1, 1, 1,
1.953727, 0.9270653, -0.6424626, 1, 1, 1, 1, 1,
1.959285, 1.827765, 0.3786089, 1, 1, 1, 1, 1,
1.961883, -0.8683729, 1.560892, 1, 1, 1, 1, 1,
1.966845, 0.5017093, 1.539187, 1, 1, 1, 1, 1,
1.986383, -0.740338, 1.075076, 1, 1, 1, 1, 1,
2.017081, -1.842352, 1.327811, 1, 1, 1, 1, 1,
2.03082, 1.006135, -0.3086808, 1, 1, 1, 1, 1,
2.063067, -1.06329, 1.349511, 1, 1, 1, 1, 1,
2.075813, -1.567946, 1.92986, 0, 0, 1, 1, 1,
2.10302, -0.2256524, 1.414375, 1, 0, 0, 1, 1,
2.126767, -0.6314759, 2.702087, 1, 0, 0, 1, 1,
2.191619, -0.6238602, 3.580028, 1, 0, 0, 1, 1,
2.195592, 0.4010981, -0.8023705, 1, 0, 0, 1, 1,
2.213855, -1.548811, 2.360148, 1, 0, 0, 1, 1,
2.235337, -1.051099, 0.6750922, 0, 0, 0, 1, 1,
2.276905, -0.4903356, 0.8690246, 0, 0, 0, 1, 1,
2.280817, 0.6083552, 0.1429776, 0, 0, 0, 1, 1,
2.28957, 0.1884116, 1.459534, 0, 0, 0, 1, 1,
2.30074, 0.5573158, 1.14506, 0, 0, 0, 1, 1,
2.334593, -0.9026781, 1.351289, 0, 0, 0, 1, 1,
2.462756, -0.07910693, 0.9468497, 0, 0, 0, 1, 1,
2.505971, -1.086671, 2.139848, 1, 1, 1, 1, 1,
2.520519, 0.7914656, 0.2365578, 1, 1, 1, 1, 1,
2.535258, -0.5386679, 1.123153, 1, 1, 1, 1, 1,
2.639132, -1.477281, 2.760094, 1, 1, 1, 1, 1,
2.67567, -1.008852, 3.791067, 1, 1, 1, 1, 1,
2.751016, -1.030111, 1.525748, 1, 1, 1, 1, 1,
2.833879, -0.1465968, 1.870447, 1, 1, 1, 1, 1
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
var radius = 9.923018;
var distance = 34.85418;
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
mvMatrix.translate( 0.04683912, 0.02343082, 0.1743467 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85418);
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
