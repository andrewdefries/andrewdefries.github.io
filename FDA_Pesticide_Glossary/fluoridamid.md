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
-2.895385, -1.120655, -1.277144, 1, 0, 0, 1,
-2.809191, -0.7149346, -1.309533, 1, 0.007843138, 0, 1,
-2.784821, 0.3325375, -0.9727087, 1, 0.01176471, 0, 1,
-2.658363, 0.5954571, -0.6106855, 1, 0.01960784, 0, 1,
-2.474151, -1.069943, -2.800222, 1, 0.02352941, 0, 1,
-2.368236, -0.04321857, -1.992625, 1, 0.03137255, 0, 1,
-2.367335, 0.6607956, 0.1558361, 1, 0.03529412, 0, 1,
-2.339097, -0.07202926, -1.709048, 1, 0.04313726, 0, 1,
-2.305604, 0.6125482, -0.5977883, 1, 0.04705882, 0, 1,
-2.240618, -0.2068889, -1.910324, 1, 0.05490196, 0, 1,
-2.22652, -0.3662174, -1.146357, 1, 0.05882353, 0, 1,
-2.154067, 0.02026371, -2.246031, 1, 0.06666667, 0, 1,
-2.153086, 0.3654712, -0.8799465, 1, 0.07058824, 0, 1,
-2.111417, -1.875184, -1.206938, 1, 0.07843138, 0, 1,
-2.107061, 0.9561219, -1.99351, 1, 0.08235294, 0, 1,
-2.029357, 0.3439929, -2.434884, 1, 0.09019608, 0, 1,
-2.025044, 1.597747, 0.5196133, 1, 0.09411765, 0, 1,
-2.022359, 0.1079341, 0.3268078, 1, 0.1019608, 0, 1,
-2.006115, -0.001451973, -2.258613, 1, 0.1098039, 0, 1,
-1.967837, 1.188619, -2.2688, 1, 0.1137255, 0, 1,
-1.958111, -0.3658252, -0.5788097, 1, 0.1215686, 0, 1,
-1.920677, -2.059775, -1.679632, 1, 0.1254902, 0, 1,
-1.914031, -1.013377, -1.503871, 1, 0.1333333, 0, 1,
-1.913417, 1.700842, -0.300499, 1, 0.1372549, 0, 1,
-1.901015, 1.480808, -0.3824333, 1, 0.145098, 0, 1,
-1.880674, -1.113845, -1.613074, 1, 0.1490196, 0, 1,
-1.839201, -0.1243776, -2.722, 1, 0.1568628, 0, 1,
-1.836152, -0.5537127, -2.712915, 1, 0.1607843, 0, 1,
-1.813544, -2.094099, -3.039266, 1, 0.1686275, 0, 1,
-1.796057, -0.8964629, -0.6692976, 1, 0.172549, 0, 1,
-1.790091, 1.126627, 0.03724474, 1, 0.1803922, 0, 1,
-1.78884, -1.100406, -2.32515, 1, 0.1843137, 0, 1,
-1.77554, 0.4317861, -2.328397, 1, 0.1921569, 0, 1,
-1.774769, -0.2984082, -1.376306, 1, 0.1960784, 0, 1,
-1.771212, 1.471941, -1.279448, 1, 0.2039216, 0, 1,
-1.75645, 1.81372, -0.4931936, 1, 0.2117647, 0, 1,
-1.75231, -0.8394151, -2.198073, 1, 0.2156863, 0, 1,
-1.751884, -0.7505335, -0.6998848, 1, 0.2235294, 0, 1,
-1.746369, -1.686762, -1.984782, 1, 0.227451, 0, 1,
-1.71141, 1.172953, -0.252986, 1, 0.2352941, 0, 1,
-1.703472, -0.1326621, 0.4328165, 1, 0.2392157, 0, 1,
-1.699436, -1.547202, -0.9210411, 1, 0.2470588, 0, 1,
-1.68387, 0.9362404, -0.8810105, 1, 0.2509804, 0, 1,
-1.678459, -0.628132, -4.188797, 1, 0.2588235, 0, 1,
-1.645555, 0.9816061, -2.254169, 1, 0.2627451, 0, 1,
-1.639588, -0.5006799, -0.8851302, 1, 0.2705882, 0, 1,
-1.62571, -0.951426, -3.033143, 1, 0.2745098, 0, 1,
-1.620298, 0.9652793, -2.242753, 1, 0.282353, 0, 1,
-1.615737, -0.0481351, -0.2832689, 1, 0.2862745, 0, 1,
-1.589986, 0.1949171, -1.566663, 1, 0.2941177, 0, 1,
-1.589429, -0.303411, -1.617431, 1, 0.3019608, 0, 1,
-1.581569, -1.548357, -1.011488, 1, 0.3058824, 0, 1,
-1.575467, 0.5398723, -2.510246, 1, 0.3137255, 0, 1,
-1.562165, -1.25053, -2.521452, 1, 0.3176471, 0, 1,
-1.544731, -0.5587193, -3.427354, 1, 0.3254902, 0, 1,
-1.541744, 0.8415071, -1.747125, 1, 0.3294118, 0, 1,
-1.510467, 1.522206, -2.010313, 1, 0.3372549, 0, 1,
-1.502845, -1.572312, -1.350481, 1, 0.3411765, 0, 1,
-1.502755, 0.8592905, -1.428046, 1, 0.3490196, 0, 1,
-1.489355, -0.3148581, -1.942475, 1, 0.3529412, 0, 1,
-1.488405, 0.7868977, 0.5634746, 1, 0.3607843, 0, 1,
-1.472221, 1.018465, -1.3459, 1, 0.3647059, 0, 1,
-1.47067, 0.854917, -1.020082, 1, 0.372549, 0, 1,
-1.456311, -0.5144802, -2.880277, 1, 0.3764706, 0, 1,
-1.453663, 1.38413, -1.422105, 1, 0.3843137, 0, 1,
-1.452739, 0.7480331, 0.1387746, 1, 0.3882353, 0, 1,
-1.451664, -1.306519, -2.063132, 1, 0.3960784, 0, 1,
-1.447884, -0.6597504, -2.884886, 1, 0.4039216, 0, 1,
-1.436899, -0.05808358, -0.7769031, 1, 0.4078431, 0, 1,
-1.43191, -0.6423469, -2.174512, 1, 0.4156863, 0, 1,
-1.421298, -0.7196873, -1.747164, 1, 0.4196078, 0, 1,
-1.414569, 1.514399, -2.793285, 1, 0.427451, 0, 1,
-1.405993, 0.5762201, -0.9120821, 1, 0.4313726, 0, 1,
-1.403142, 1.468211, -0.7070946, 1, 0.4392157, 0, 1,
-1.402395, 1.930229, -0.2218152, 1, 0.4431373, 0, 1,
-1.362556, 0.3467236, -2.01482, 1, 0.4509804, 0, 1,
-1.359368, 0.5277487, -1.830276, 1, 0.454902, 0, 1,
-1.356472, -0.7293738, -2.040339, 1, 0.4627451, 0, 1,
-1.356355, -0.4647421, -1.235914, 1, 0.4666667, 0, 1,
-1.34298, -1.476376, -1.959642, 1, 0.4745098, 0, 1,
-1.329955, 0.5238431, -1.049738, 1, 0.4784314, 0, 1,
-1.325617, -1.085562, -2.456547, 1, 0.4862745, 0, 1,
-1.32275, -0.02432538, -0.3817145, 1, 0.4901961, 0, 1,
-1.316909, 0.9766811, -1.021142, 1, 0.4980392, 0, 1,
-1.307338, 0.01943464, -1.122415, 1, 0.5058824, 0, 1,
-1.30594, -0.8181298, 0.2211381, 1, 0.509804, 0, 1,
-1.292602, 2.134659, -1.764677, 1, 0.5176471, 0, 1,
-1.280893, 1.158821, 0.2493519, 1, 0.5215687, 0, 1,
-1.273598, -1.180858, -2.958925, 1, 0.5294118, 0, 1,
-1.273421, 1.500085, 0.1286863, 1, 0.5333334, 0, 1,
-1.269555, -1.999614, -0.8456988, 1, 0.5411765, 0, 1,
-1.267386, -1.16746, -1.533826, 1, 0.5450981, 0, 1,
-1.265745, -0.9249941, -2.938968, 1, 0.5529412, 0, 1,
-1.265501, 0.9877862, -1.339052, 1, 0.5568628, 0, 1,
-1.264313, -0.6303335, -0.6086579, 1, 0.5647059, 0, 1,
-1.258101, -1.627335, -3.364883, 1, 0.5686275, 0, 1,
-1.252895, -1.819536, -1.19145, 1, 0.5764706, 0, 1,
-1.240263, -1.273089, -1.370597, 1, 0.5803922, 0, 1,
-1.238816, 0.2082544, 0.4929924, 1, 0.5882353, 0, 1,
-1.232048, -0.5862679, -2.510428, 1, 0.5921569, 0, 1,
-1.22459, -2.670665, -2.779705, 1, 0.6, 0, 1,
-1.222923, -0.3932156, -2.316157, 1, 0.6078432, 0, 1,
-1.213561, 2.32713, -0.8201233, 1, 0.6117647, 0, 1,
-1.21248, 0.1348605, -1.406636, 1, 0.6196079, 0, 1,
-1.206717, -0.03591492, -2.014342, 1, 0.6235294, 0, 1,
-1.2038, -1.053983, -1.61649, 1, 0.6313726, 0, 1,
-1.196502, 0.547012, -0.647485, 1, 0.6352941, 0, 1,
-1.177706, -0.3775668, -2.151917, 1, 0.6431373, 0, 1,
-1.170168, -0.4252057, -3.155842, 1, 0.6470588, 0, 1,
-1.163808, -0.1735386, -3.052357, 1, 0.654902, 0, 1,
-1.160715, 0.685935, -1.748001, 1, 0.6588235, 0, 1,
-1.160013, -1.005123, -1.444843, 1, 0.6666667, 0, 1,
-1.14718, -1.558674, -2.667269, 1, 0.6705883, 0, 1,
-1.145963, 0.3030972, -0.4226703, 1, 0.6784314, 0, 1,
-1.133037, -0.5285268, -1.467607, 1, 0.682353, 0, 1,
-1.114807, 0.5937982, -1.446535, 1, 0.6901961, 0, 1,
-1.112731, -1.006528, -2.599291, 1, 0.6941177, 0, 1,
-1.111765, 0.9797845, -0.9425693, 1, 0.7019608, 0, 1,
-1.094628, 0.1125704, -2.708277, 1, 0.7098039, 0, 1,
-1.091207, -0.1901926, -1.26167, 1, 0.7137255, 0, 1,
-1.088265, -0.3540477, -2.753019, 1, 0.7215686, 0, 1,
-1.083662, 1.582167, -0.05099658, 1, 0.7254902, 0, 1,
-1.082253, -0.01334808, -0.3817664, 1, 0.7333333, 0, 1,
-1.071332, -0.179831, -2.207688, 1, 0.7372549, 0, 1,
-1.068176, 1.433449, -1.563461, 1, 0.7450981, 0, 1,
-1.058818, -0.1407153, -3.35452, 1, 0.7490196, 0, 1,
-1.057212, -0.2886619, -2.630392, 1, 0.7568628, 0, 1,
-1.054765, -1.840832, -1.288944, 1, 0.7607843, 0, 1,
-1.049546, -0.09273188, -0.948216, 1, 0.7686275, 0, 1,
-1.041051, -1.12026, -3.361924, 1, 0.772549, 0, 1,
-1.040856, -0.07764182, -2.439482, 1, 0.7803922, 0, 1,
-1.038619, 0.5701187, -2.171184, 1, 0.7843137, 0, 1,
-1.036348, 2.100832, 1.44529, 1, 0.7921569, 0, 1,
-1.033462, -1.029366, -1.851475, 1, 0.7960784, 0, 1,
-1.018275, -1.194859, -2.942371, 1, 0.8039216, 0, 1,
-1.017063, -1.426268, -4.897405, 1, 0.8117647, 0, 1,
-1.016763, -0.143888, -2.778501, 1, 0.8156863, 0, 1,
-1.016289, 0.08109894, -2.244483, 1, 0.8235294, 0, 1,
-1.013981, 0.969427, -1.024105, 1, 0.827451, 0, 1,
-1.00583, -1.715544, -4.068158, 1, 0.8352941, 0, 1,
-1.005663, -2.066868, -4.036896, 1, 0.8392157, 0, 1,
-1.005479, -0.8852693, -4.298397, 1, 0.8470588, 0, 1,
-0.9964378, -2.670101, -3.398391, 1, 0.8509804, 0, 1,
-0.9893265, 1.184705, -2.488973, 1, 0.8588235, 0, 1,
-0.9826264, -1.004078, -3.114192, 1, 0.8627451, 0, 1,
-0.9731368, 0.6419115, -2.793761, 1, 0.8705882, 0, 1,
-0.9725739, -1.230769, -3.159803, 1, 0.8745098, 0, 1,
-0.9703208, -1.470627, -2.137362, 1, 0.8823529, 0, 1,
-0.9667044, -0.3454953, -1.77241, 1, 0.8862745, 0, 1,
-0.962508, 1.428229, 0.478451, 1, 0.8941177, 0, 1,
-0.9557629, -1.441336, -3.340341, 1, 0.8980392, 0, 1,
-0.9444707, 0.7933129, -0.1379134, 1, 0.9058824, 0, 1,
-0.941995, -0.3310325, -2.48855, 1, 0.9137255, 0, 1,
-0.9378214, -1.423813, -3.805602, 1, 0.9176471, 0, 1,
-0.9311339, -0.5640858, -3.559996, 1, 0.9254902, 0, 1,
-0.9306691, -0.2545258, 0.2973706, 1, 0.9294118, 0, 1,
-0.9224761, -0.8264011, -2.271237, 1, 0.9372549, 0, 1,
-0.9176703, 1.545351, -0.766981, 1, 0.9411765, 0, 1,
-0.9138004, -0.6991844, -2.015414, 1, 0.9490196, 0, 1,
-0.9090342, -1.63283, -2.69691, 1, 0.9529412, 0, 1,
-0.905046, -0.2673198, -1.525709, 1, 0.9607843, 0, 1,
-0.9039066, 0.1115285, -2.033658, 1, 0.9647059, 0, 1,
-0.9002836, -0.6317093, -2.759856, 1, 0.972549, 0, 1,
-0.9002523, -0.7670805, -1.30092, 1, 0.9764706, 0, 1,
-0.8944815, 0.6740687, -2.275384, 1, 0.9843137, 0, 1,
-0.8884447, 0.6909969, -1.568871, 1, 0.9882353, 0, 1,
-0.8878661, -1.349704, -1.913785, 1, 0.9960784, 0, 1,
-0.8849789, -0.5854044, -2.578399, 0.9960784, 1, 0, 1,
-0.8829512, -0.373596, -1.648996, 0.9921569, 1, 0, 1,
-0.8825179, -0.2552077, -3.778424, 0.9843137, 1, 0, 1,
-0.8809931, -0.3920784, -3.092668, 0.9803922, 1, 0, 1,
-0.8807068, 0.2218809, -1.404814, 0.972549, 1, 0, 1,
-0.8772413, -1.169692, -2.081603, 0.9686275, 1, 0, 1,
-0.8753911, 1.104631, 0.06957944, 0.9607843, 1, 0, 1,
-0.874191, 2.366269, -1.755356, 0.9568627, 1, 0, 1,
-0.8728297, 0.677054, -1.683778, 0.9490196, 1, 0, 1,
-0.871368, 1.332676, -1.693336, 0.945098, 1, 0, 1,
-0.8695782, 0.3403796, -0.916778, 0.9372549, 1, 0, 1,
-0.8586224, -1.476538, -2.05295, 0.9333333, 1, 0, 1,
-0.8398362, 0.4674361, -1.286925, 0.9254902, 1, 0, 1,
-0.8363465, 0.433307, -3.79768, 0.9215686, 1, 0, 1,
-0.8362492, 0.9295252, 0.436017, 0.9137255, 1, 0, 1,
-0.8353264, -2.21017, -2.73254, 0.9098039, 1, 0, 1,
-0.8287027, -0.2498174, 1.055476, 0.9019608, 1, 0, 1,
-0.8251805, -0.3782962, -2.646897, 0.8941177, 1, 0, 1,
-0.8210034, -1.262297, -2.378734, 0.8901961, 1, 0, 1,
-0.8198146, 1.049541, 0.05044275, 0.8823529, 1, 0, 1,
-0.8184534, -0.4301215, -1.858353, 0.8784314, 1, 0, 1,
-0.8143747, -0.03136422, -1.389528, 0.8705882, 1, 0, 1,
-0.8128086, 0.3213231, -0.7366946, 0.8666667, 1, 0, 1,
-0.80385, 1.985811, -0.3985649, 0.8588235, 1, 0, 1,
-0.7975808, 1.478153, 0.1258549, 0.854902, 1, 0, 1,
-0.7947467, 0.9533303, -0.7677581, 0.8470588, 1, 0, 1,
-0.7943345, -0.424031, -2.60325, 0.8431373, 1, 0, 1,
-0.7931679, -0.6785495, -3.863631, 0.8352941, 1, 0, 1,
-0.7912025, 0.1052481, -2.465851, 0.8313726, 1, 0, 1,
-0.784138, -1.223776, -2.755697, 0.8235294, 1, 0, 1,
-0.78333, -0.1614385, -0.9285194, 0.8196079, 1, 0, 1,
-0.7809884, 0.86082, 0.4212471, 0.8117647, 1, 0, 1,
-0.772282, -1.189985, -3.419229, 0.8078431, 1, 0, 1,
-0.768889, 0.3948445, -2.7954, 0.8, 1, 0, 1,
-0.7677024, -1.443557, -2.541407, 0.7921569, 1, 0, 1,
-0.7663448, 0.2026471, -2.877984, 0.7882353, 1, 0, 1,
-0.765907, 1.247311, -1.69935, 0.7803922, 1, 0, 1,
-0.7524653, 0.8897365, -2.278161, 0.7764706, 1, 0, 1,
-0.7463446, -0.2165334, -2.831097, 0.7686275, 1, 0, 1,
-0.738861, 0.7131087, -2.215124, 0.7647059, 1, 0, 1,
-0.7361788, -0.4477219, -1.869849, 0.7568628, 1, 0, 1,
-0.7341751, -0.2661856, 0.9901579, 0.7529412, 1, 0, 1,
-0.7319877, -0.6382411, -1.941314, 0.7450981, 1, 0, 1,
-0.7306, 0.9678018, 0.5609044, 0.7411765, 1, 0, 1,
-0.7297801, -1.941532, -2.127134, 0.7333333, 1, 0, 1,
-0.7254846, 0.0966424, -1.635451, 0.7294118, 1, 0, 1,
-0.7253582, -0.2441569, -1.535087, 0.7215686, 1, 0, 1,
-0.7118664, -0.7851878, -1.324847, 0.7176471, 1, 0, 1,
-0.7094871, 0.3576426, -1.388514, 0.7098039, 1, 0, 1,
-0.7091781, 1.622555, 1.61153, 0.7058824, 1, 0, 1,
-0.7066874, -0.4478303, -0.7679225, 0.6980392, 1, 0, 1,
-0.7066233, 0.8915133, 1.018157, 0.6901961, 1, 0, 1,
-0.7061402, 0.2413012, 1.258529, 0.6862745, 1, 0, 1,
-0.7031491, 0.4095138, -0.2876319, 0.6784314, 1, 0, 1,
-0.7028257, -0.1598385, -2.31244, 0.6745098, 1, 0, 1,
-0.7025159, 0.1633538, -1.900516, 0.6666667, 1, 0, 1,
-0.7007198, 2.232512, 0.3159318, 0.6627451, 1, 0, 1,
-0.6983517, -1.743394, -4.075374, 0.654902, 1, 0, 1,
-0.6894056, 1.766246, -0.6078198, 0.6509804, 1, 0, 1,
-0.6849102, -1.079427, -0.8308302, 0.6431373, 1, 0, 1,
-0.6803065, 0.1717848, -1.900212, 0.6392157, 1, 0, 1,
-0.6756332, -0.05406221, -0.9613818, 0.6313726, 1, 0, 1,
-0.673692, 1.437603, 0.6877217, 0.627451, 1, 0, 1,
-0.6717101, -1.252974, -3.180419, 0.6196079, 1, 0, 1,
-0.6686437, -1.091891, -3.346109, 0.6156863, 1, 0, 1,
-0.6685681, -0.491215, -2.184709, 0.6078432, 1, 0, 1,
-0.6674982, -1.267762, -3.064589, 0.6039216, 1, 0, 1,
-0.6657366, -0.1592379, -2.795558, 0.5960785, 1, 0, 1,
-0.6563995, -0.3068903, -2.430613, 0.5882353, 1, 0, 1,
-0.6536844, 1.158092, 0.5040202, 0.5843138, 1, 0, 1,
-0.6416929, 1.790489, 0.7456011, 0.5764706, 1, 0, 1,
-0.6379809, -0.00435246, -2.2954, 0.572549, 1, 0, 1,
-0.63771, -2.014197, -1.667891, 0.5647059, 1, 0, 1,
-0.6351867, 0.8973838, -1.132807, 0.5607843, 1, 0, 1,
-0.6342744, 0.5518672, -0.6152554, 0.5529412, 1, 0, 1,
-0.6267223, 2.486926, 0.6547939, 0.5490196, 1, 0, 1,
-0.6229531, -0.9272988, -2.959598, 0.5411765, 1, 0, 1,
-0.6191232, 0.2381919, -1.096531, 0.5372549, 1, 0, 1,
-0.6121357, -1.002522, -4.326527, 0.5294118, 1, 0, 1,
-0.6117561, -0.8556696, -0.984917, 0.5254902, 1, 0, 1,
-0.6086534, 1.181848, 0.03186692, 0.5176471, 1, 0, 1,
-0.6059296, -0.01425538, -2.414322, 0.5137255, 1, 0, 1,
-0.6020207, -0.8190994, -1.13806, 0.5058824, 1, 0, 1,
-0.5964366, 0.9402952, -1.678545, 0.5019608, 1, 0, 1,
-0.5963776, -0.03071336, -3.15001, 0.4941176, 1, 0, 1,
-0.5941734, -1.03592, -3.108498, 0.4862745, 1, 0, 1,
-0.592175, -0.2905878, -2.312828, 0.4823529, 1, 0, 1,
-0.5918605, -1.239042, -1.251108, 0.4745098, 1, 0, 1,
-0.5903727, -1.242704, -1.489892, 0.4705882, 1, 0, 1,
-0.5890113, -0.5841454, -3.101938, 0.4627451, 1, 0, 1,
-0.5880073, 0.3858017, -1.773954, 0.4588235, 1, 0, 1,
-0.581368, -0.2579269, -3.108583, 0.4509804, 1, 0, 1,
-0.57928, -1.246266, -2.714371, 0.4470588, 1, 0, 1,
-0.5790344, 1.876536, -0.08363216, 0.4392157, 1, 0, 1,
-0.5785874, -0.576251, -2.971288, 0.4352941, 1, 0, 1,
-0.5721667, 1.115559, -0.379279, 0.427451, 1, 0, 1,
-0.5685892, -0.4139334, -1.119726, 0.4235294, 1, 0, 1,
-0.5610576, -0.008938674, -0.7691275, 0.4156863, 1, 0, 1,
-0.5594765, 0.1057262, -2.151515, 0.4117647, 1, 0, 1,
-0.5583428, -0.07612093, -2.599285, 0.4039216, 1, 0, 1,
-0.5560291, -0.7164069, -1.435531, 0.3960784, 1, 0, 1,
-0.5544792, 1.565872, 1.533669, 0.3921569, 1, 0, 1,
-0.5515645, 0.3397981, -0.161601, 0.3843137, 1, 0, 1,
-0.5485481, -0.7464949, -2.093329, 0.3803922, 1, 0, 1,
-0.5391579, 1.633288, -0.8970011, 0.372549, 1, 0, 1,
-0.5378119, -0.1470487, -1.422537, 0.3686275, 1, 0, 1,
-0.5377164, -0.1889351, -1.436514, 0.3607843, 1, 0, 1,
-0.5368668, -0.1110875, -2.202932, 0.3568628, 1, 0, 1,
-0.5279209, 0.649269, -0.4975873, 0.3490196, 1, 0, 1,
-0.5216782, -0.01605288, -0.7242129, 0.345098, 1, 0, 1,
-0.5213106, -1.819439, -3.058112, 0.3372549, 1, 0, 1,
-0.5157222, 1.302101, -1.60418, 0.3333333, 1, 0, 1,
-0.5114842, -0.3448252, -3.832814, 0.3254902, 1, 0, 1,
-0.5088178, 0.1683577, -0.9773106, 0.3215686, 1, 0, 1,
-0.5046988, -1.303461, -2.223276, 0.3137255, 1, 0, 1,
-0.503974, 0.1361649, 0.4618527, 0.3098039, 1, 0, 1,
-0.5011501, 1.039137, 2.154782, 0.3019608, 1, 0, 1,
-0.5008008, 0.3322061, -2.430628, 0.2941177, 1, 0, 1,
-0.4991561, -0.2491864, -1.53507, 0.2901961, 1, 0, 1,
-0.4879034, -0.07622825, -1.330861, 0.282353, 1, 0, 1,
-0.4869761, -0.4197308, -2.674912, 0.2784314, 1, 0, 1,
-0.485259, -1.384341, -3.221067, 0.2705882, 1, 0, 1,
-0.4780979, -2.406453, -5.189271, 0.2666667, 1, 0, 1,
-0.476119, 2.245605, -0.2525505, 0.2588235, 1, 0, 1,
-0.4638458, -0.218233, -1.641573, 0.254902, 1, 0, 1,
-0.4600663, 0.2075986, 0.8596449, 0.2470588, 1, 0, 1,
-0.4569055, -0.4165422, -1.827185, 0.2431373, 1, 0, 1,
-0.455743, -0.7164804, -2.831788, 0.2352941, 1, 0, 1,
-0.4536518, -1.160018, -3.749942, 0.2313726, 1, 0, 1,
-0.4489201, -0.05523311, -0.7020746, 0.2235294, 1, 0, 1,
-0.4421025, 0.6416469, -0.5971908, 0.2196078, 1, 0, 1,
-0.4393999, 0.1304087, -1.218624, 0.2117647, 1, 0, 1,
-0.4381031, 0.6050072, -0.001702741, 0.2078431, 1, 0, 1,
-0.4336534, 0.7306277, -1.231569, 0.2, 1, 0, 1,
-0.4236746, 0.6804555, -1.083948, 0.1921569, 1, 0, 1,
-0.4194563, 1.695126, 0.05701852, 0.1882353, 1, 0, 1,
-0.4184994, 1.20336, -2.15292, 0.1803922, 1, 0, 1,
-0.4143803, -0.1019295, -1.113984, 0.1764706, 1, 0, 1,
-0.4138687, -0.8321351, -2.706614, 0.1686275, 1, 0, 1,
-0.4120402, 1.34637, -0.5756478, 0.1647059, 1, 0, 1,
-0.4092961, 0.4760003, -1.849536, 0.1568628, 1, 0, 1,
-0.4045318, 0.07769077, -0.894788, 0.1529412, 1, 0, 1,
-0.4012174, -0.536594, -3.196113, 0.145098, 1, 0, 1,
-0.3877985, -0.231209, -1.383453, 0.1411765, 1, 0, 1,
-0.3859928, -1.249362, -3.583263, 0.1333333, 1, 0, 1,
-0.3809776, -0.4666542, -2.121307, 0.1294118, 1, 0, 1,
-0.377994, 0.7169203, -2.051819, 0.1215686, 1, 0, 1,
-0.3639012, 0.4703737, -0.2529425, 0.1176471, 1, 0, 1,
-0.3607236, -0.1642508, -2.447716, 0.1098039, 1, 0, 1,
-0.357282, -0.7912072, -2.949566, 0.1058824, 1, 0, 1,
-0.3509469, -1.682281, -2.559012, 0.09803922, 1, 0, 1,
-0.3475079, -0.2939376, 0.2109396, 0.09019608, 1, 0, 1,
-0.3449549, 0.003836209, -0.8453889, 0.08627451, 1, 0, 1,
-0.3434635, 2.953567, -1.750087, 0.07843138, 1, 0, 1,
-0.343363, -0.7633578, -2.793434, 0.07450981, 1, 0, 1,
-0.3432286, -1.773867, -4.45593, 0.06666667, 1, 0, 1,
-0.3430972, -0.9079552, -2.998482, 0.0627451, 1, 0, 1,
-0.3425467, 0.6163551, 0.771686, 0.05490196, 1, 0, 1,
-0.3384526, -1.488948, -1.596803, 0.05098039, 1, 0, 1,
-0.3202288, -0.361315, -1.882917, 0.04313726, 1, 0, 1,
-0.3168095, -0.212156, -2.462191, 0.03921569, 1, 0, 1,
-0.3147311, 0.866339, -1.696305, 0.03137255, 1, 0, 1,
-0.3137851, -0.1725742, -2.928284, 0.02745098, 1, 0, 1,
-0.3075278, -0.6165218, -2.930034, 0.01960784, 1, 0, 1,
-0.3070061, -0.4804079, -2.945704, 0.01568628, 1, 0, 1,
-0.298558, -1.515916, -3.169243, 0.007843138, 1, 0, 1,
-0.2975013, -0.36433, -1.80645, 0.003921569, 1, 0, 1,
-0.2968271, 0.8266771, 0.5404192, 0, 1, 0.003921569, 1,
-0.2966314, 0.1361611, -2.27212, 0, 1, 0.01176471, 1,
-0.2924147, -0.4057561, -2.481307, 0, 1, 0.01568628, 1,
-0.2895764, 0.2689298, -0.6909134, 0, 1, 0.02352941, 1,
-0.2886511, -0.47322, -2.080327, 0, 1, 0.02745098, 1,
-0.2870917, 2.697075, 1.014152, 0, 1, 0.03529412, 1,
-0.28414, 0.1237896, 0.9732597, 0, 1, 0.03921569, 1,
-0.2804939, 1.01687, -0.04225902, 0, 1, 0.04705882, 1,
-0.2795279, -0.5381922, -3.250512, 0, 1, 0.05098039, 1,
-0.2757821, 0.5748162, -1.612425, 0, 1, 0.05882353, 1,
-0.2742854, -0.0109877, -1.457533, 0, 1, 0.0627451, 1,
-0.2738042, -0.3525583, -2.841718, 0, 1, 0.07058824, 1,
-0.2733232, 0.9259644, 0.6098236, 0, 1, 0.07450981, 1,
-0.2718408, -0.2258589, -3.426188, 0, 1, 0.08235294, 1,
-0.26908, 0.2128108, -1.517842, 0, 1, 0.08627451, 1,
-0.2660568, 0.7679598, -0.06669864, 0, 1, 0.09411765, 1,
-0.2653986, -1.511039, -3.487481, 0, 1, 0.1019608, 1,
-0.2648069, 0.04380265, -1.444609, 0, 1, 0.1058824, 1,
-0.2637451, 0.1213489, -0.8084151, 0, 1, 0.1137255, 1,
-0.2637106, -0.4861151, -1.744326, 0, 1, 0.1176471, 1,
-0.2633516, -0.256007, -1.783261, 0, 1, 0.1254902, 1,
-0.2610899, 1.888363, 1.054174, 0, 1, 0.1294118, 1,
-0.2597704, -0.4294006, -2.484912, 0, 1, 0.1372549, 1,
-0.2576912, -1.955336, -4.332203, 0, 1, 0.1411765, 1,
-0.2571647, 0.9396951, -1.067133, 0, 1, 0.1490196, 1,
-0.2569306, -1.988775, -1.923539, 0, 1, 0.1529412, 1,
-0.2556754, 1.756122, 0.1552898, 0, 1, 0.1607843, 1,
-0.2545792, 1.284231, -0.9524379, 0, 1, 0.1647059, 1,
-0.2535047, -0.7647938, -3.882134, 0, 1, 0.172549, 1,
-0.2472534, -0.2450443, -2.664102, 0, 1, 0.1764706, 1,
-0.2460805, -0.5707846, -3.00984, 0, 1, 0.1843137, 1,
-0.2423571, 0.2160136, -0.8350651, 0, 1, 0.1882353, 1,
-0.242052, 0.08675167, -2.590811, 0, 1, 0.1960784, 1,
-0.241666, 0.05011745, -1.447553, 0, 1, 0.2039216, 1,
-0.2402061, -0.07535087, -1.22299, 0, 1, 0.2078431, 1,
-0.238182, 0.1530938, 1.051303, 0, 1, 0.2156863, 1,
-0.2378095, -0.7369053, -2.700736, 0, 1, 0.2196078, 1,
-0.2369953, -0.8143051, -1.302835, 0, 1, 0.227451, 1,
-0.2351881, -0.02670366, -1.245576, 0, 1, 0.2313726, 1,
-0.2344204, 0.4822287, -0.4764496, 0, 1, 0.2392157, 1,
-0.2342569, 0.8115456, -0.7680214, 0, 1, 0.2431373, 1,
-0.2291646, 0.1935403, -0.3371894, 0, 1, 0.2509804, 1,
-0.2267527, 0.4998707, -1.706423, 0, 1, 0.254902, 1,
-0.2241942, -0.3734457, -4.081432, 0, 1, 0.2627451, 1,
-0.2205887, 2.8372, 1.158801, 0, 1, 0.2666667, 1,
-0.2202396, -0.9534774, -3.60958, 0, 1, 0.2745098, 1,
-0.2177854, -0.2482358, -3.530864, 0, 1, 0.2784314, 1,
-0.2169904, -0.1581861, -1.126196, 0, 1, 0.2862745, 1,
-0.2167228, 2.033252, -0.6342812, 0, 1, 0.2901961, 1,
-0.212928, -0.4504095, -4.452674, 0, 1, 0.2980392, 1,
-0.2070336, 0.1484813, -1.410195, 0, 1, 0.3058824, 1,
-0.2017169, 1.101114, -1.084639, 0, 1, 0.3098039, 1,
-0.1990731, -0.4964133, -3.015257, 0, 1, 0.3176471, 1,
-0.1990468, -0.5750337, -5.071648, 0, 1, 0.3215686, 1,
-0.1981236, 0.7761387, -1.243541, 0, 1, 0.3294118, 1,
-0.196809, 1.199476, -0.2161908, 0, 1, 0.3333333, 1,
-0.1961988, 0.07548059, 0.2729158, 0, 1, 0.3411765, 1,
-0.1937603, 1.525642, -0.103096, 0, 1, 0.345098, 1,
-0.1873332, -0.2246667, -3.08902, 0, 1, 0.3529412, 1,
-0.1861744, 0.8870809, 0.9336786, 0, 1, 0.3568628, 1,
-0.1858957, 0.7060344, 0.2061984, 0, 1, 0.3647059, 1,
-0.1847322, -0.8094891, -1.386369, 0, 1, 0.3686275, 1,
-0.1818691, 1.639361, -1.047352, 0, 1, 0.3764706, 1,
-0.1801136, 2.634038, 0.95428, 0, 1, 0.3803922, 1,
-0.1796049, 0.4973661, -1.279317, 0, 1, 0.3882353, 1,
-0.1782619, 1.101942, 0.08889537, 0, 1, 0.3921569, 1,
-0.1769755, 0.6353115, 1.058383, 0, 1, 0.4, 1,
-0.174597, 0.5092676, -1.184921, 0, 1, 0.4078431, 1,
-0.171942, 0.6643466, -0.6235508, 0, 1, 0.4117647, 1,
-0.1713477, -0.04307025, -0.6267126, 0, 1, 0.4196078, 1,
-0.1709136, 0.3447207, -2.154927, 0, 1, 0.4235294, 1,
-0.1700262, -1.697227, -3.048535, 0, 1, 0.4313726, 1,
-0.169445, -0.04965508, -1.364822, 0, 1, 0.4352941, 1,
-0.1640603, 2.045212, -0.09700557, 0, 1, 0.4431373, 1,
-0.1581873, 0.75631, -0.4424221, 0, 1, 0.4470588, 1,
-0.1579955, -0.03893428, -2.374856, 0, 1, 0.454902, 1,
-0.1503918, 1.608429, -0.2580099, 0, 1, 0.4588235, 1,
-0.1497809, -0.6058469, -2.322755, 0, 1, 0.4666667, 1,
-0.1482345, -0.6054407, -3.968954, 0, 1, 0.4705882, 1,
-0.1452506, -0.6681374, -3.398307, 0, 1, 0.4784314, 1,
-0.1428564, -0.2988901, -1.910412, 0, 1, 0.4823529, 1,
-0.1421951, -0.3410142, -1.575618, 0, 1, 0.4901961, 1,
-0.1414792, 0.4483575, -0.4167112, 0, 1, 0.4941176, 1,
-0.1365889, 0.8570624, -0.1192928, 0, 1, 0.5019608, 1,
-0.1331143, -1.121745, -3.959241, 0, 1, 0.509804, 1,
-0.1305595, -0.3289286, -2.296519, 0, 1, 0.5137255, 1,
-0.1283465, -1.256734, -2.597948, 0, 1, 0.5215687, 1,
-0.1281848, -0.4179146, -4.441694, 0, 1, 0.5254902, 1,
-0.1232247, 0.51971, 0.8409067, 0, 1, 0.5333334, 1,
-0.1208053, 0.5630779, -0.6195847, 0, 1, 0.5372549, 1,
-0.1186448, 0.7711532, -1.536116, 0, 1, 0.5450981, 1,
-0.1165911, -1.352773, -2.253187, 0, 1, 0.5490196, 1,
-0.1154299, -2.602053, -3.485676, 0, 1, 0.5568628, 1,
-0.111855, -1.255802, -1.725479, 0, 1, 0.5607843, 1,
-0.1097026, 0.1361779, 0.4033796, 0, 1, 0.5686275, 1,
-0.1049673, 0.6002212, 0.02047788, 0, 1, 0.572549, 1,
-0.104278, -1.402336, -1.484099, 0, 1, 0.5803922, 1,
-0.1014833, -0.9851018, -5.202273, 0, 1, 0.5843138, 1,
-0.1006169, -0.03341351, -1.879019, 0, 1, 0.5921569, 1,
-0.09788812, 0.66304, -0.6773247, 0, 1, 0.5960785, 1,
-0.09320208, -2.324601, -4.605698, 0, 1, 0.6039216, 1,
-0.09228361, 0.532816, -0.483456, 0, 1, 0.6117647, 1,
-0.09031409, 0.6999239, -1.247247, 0, 1, 0.6156863, 1,
-0.08917522, 0.3173927, -0.1543608, 0, 1, 0.6235294, 1,
-0.08893912, 1.468141, 0.2762841, 0, 1, 0.627451, 1,
-0.08869511, 0.7097279, 0.9317573, 0, 1, 0.6352941, 1,
-0.08701511, -0.8259506, -3.710144, 0, 1, 0.6392157, 1,
-0.08423489, 0.1391757, -1.050427, 0, 1, 0.6470588, 1,
-0.07892987, 0.08851526, -2.307548, 0, 1, 0.6509804, 1,
-0.07352384, -2.755773, -3.084234, 0, 1, 0.6588235, 1,
-0.07067112, -0.334305, -3.095767, 0, 1, 0.6627451, 1,
-0.06600918, -0.5731608, -2.511137, 0, 1, 0.6705883, 1,
-0.06488275, -0.6775678, -4.081647, 0, 1, 0.6745098, 1,
-0.06368434, -0.8819191, -3.776452, 0, 1, 0.682353, 1,
-0.06226945, 0.4690109, 0.08771713, 0, 1, 0.6862745, 1,
-0.06206325, 0.02599729, -0.4000148, 0, 1, 0.6941177, 1,
-0.05843462, 0.0985621, 0.2375812, 0, 1, 0.7019608, 1,
-0.05600188, -0.7147228, -2.099883, 0, 1, 0.7058824, 1,
-0.05497204, 1.967989, -0.5991763, 0, 1, 0.7137255, 1,
-0.05486032, 1.764538, -0.5169122, 0, 1, 0.7176471, 1,
-0.05376887, -0.8559234, -2.683863, 0, 1, 0.7254902, 1,
-0.05256873, -0.1410403, -2.708124, 0, 1, 0.7294118, 1,
-0.05111558, 0.5114477, 0.537128, 0, 1, 0.7372549, 1,
-0.04454261, -0.4258764, -3.631026, 0, 1, 0.7411765, 1,
-0.0431527, 0.1050847, -1.204173, 0, 1, 0.7490196, 1,
-0.04276637, 0.8467423, 0.1930434, 0, 1, 0.7529412, 1,
-0.042202, -0.2566875, -1.913599, 0, 1, 0.7607843, 1,
-0.04162802, 0.4057332, -0.1028902, 0, 1, 0.7647059, 1,
-0.03807151, -2.348051, -2.888636, 0, 1, 0.772549, 1,
-0.03671486, 0.8788127, -1.904545, 0, 1, 0.7764706, 1,
-0.03627524, 0.4556199, -0.1403223, 0, 1, 0.7843137, 1,
-0.03502819, -1.151361, -1.222746, 0, 1, 0.7882353, 1,
-0.03250289, 1.277654, 0.2007614, 0, 1, 0.7960784, 1,
-0.0295224, 0.4148245, -0.757846, 0, 1, 0.8039216, 1,
-0.0283842, 0.6833697, -0.6927311, 0, 1, 0.8078431, 1,
-0.0232328, -0.4418367, -3.520065, 0, 1, 0.8156863, 1,
-0.02212335, -0.7210288, -4.006214, 0, 1, 0.8196079, 1,
-0.01912503, -1.138507, -1.649871, 0, 1, 0.827451, 1,
-0.01366726, 0.2520568, 1.58553, 0, 1, 0.8313726, 1,
-0.01351279, -0.4259646, -2.089363, 0, 1, 0.8392157, 1,
-0.01296734, -1.38171, -1.899835, 0, 1, 0.8431373, 1,
-0.01123968, 0.08491934, -0.008771124, 0, 1, 0.8509804, 1,
-0.01076432, -0.2770935, -4.44577, 0, 1, 0.854902, 1,
-0.01033629, 1.513455, -0.4253731, 0, 1, 0.8627451, 1,
-0.009876211, -1.49769, -2.176763, 0, 1, 0.8666667, 1,
-0.00904963, -2.578982, -3.237458, 0, 1, 0.8745098, 1,
-0.008264194, -0.8541422, -2.174739, 0, 1, 0.8784314, 1,
-0.002839618, 0.5312328, 0.0413155, 0, 1, 0.8862745, 1,
0.0003988471, -1.671406, 3.319573, 0, 1, 0.8901961, 1,
0.007119589, 0.4353808, -0.8453397, 0, 1, 0.8980392, 1,
0.009431029, 1.177392, -0.4845364, 0, 1, 0.9058824, 1,
0.00968408, 0.2514581, 0.3782323, 0, 1, 0.9098039, 1,
0.01002634, 1.105746, -1.191715, 0, 1, 0.9176471, 1,
0.01226386, -1.060736, 1.68074, 0, 1, 0.9215686, 1,
0.01415054, 0.5224084, 0.4945148, 0, 1, 0.9294118, 1,
0.01525798, -0.4596492, 3.332349, 0, 1, 0.9333333, 1,
0.01866597, -0.7743813, 2.395562, 0, 1, 0.9411765, 1,
0.0223495, -0.4673395, 5.182195, 0, 1, 0.945098, 1,
0.0250806, -1.630069, 1.748533, 0, 1, 0.9529412, 1,
0.0258748, 0.2061663, -1.264681, 0, 1, 0.9568627, 1,
0.02780124, 0.73116, -0.6063859, 0, 1, 0.9647059, 1,
0.028299, -0.2268798, 3.989683, 0, 1, 0.9686275, 1,
0.03585992, -0.1354278, 2.536071, 0, 1, 0.9764706, 1,
0.03761764, -0.7530753, 3.363642, 0, 1, 0.9803922, 1,
0.03852195, 0.2330005, -1.175976, 0, 1, 0.9882353, 1,
0.03860556, -0.9075921, 2.775631, 0, 1, 0.9921569, 1,
0.0422336, -0.253181, 1.780558, 0, 1, 1, 1,
0.04291529, 0.7104701, -1.118149, 0, 0.9921569, 1, 1,
0.04371393, 0.7262558, 0.6881474, 0, 0.9882353, 1, 1,
0.0464379, -1.18111, 1.268848, 0, 0.9803922, 1, 1,
0.04654317, -1.144986, 4.160538, 0, 0.9764706, 1, 1,
0.04740724, 1.143029, -1.173316, 0, 0.9686275, 1, 1,
0.04875282, 0.8425347, 0.3716176, 0, 0.9647059, 1, 1,
0.05578077, -0.5147175, 2.189482, 0, 0.9568627, 1, 1,
0.057217, 0.7594662, -0.9181249, 0, 0.9529412, 1, 1,
0.06106422, -1.063512, 2.663406, 0, 0.945098, 1, 1,
0.06172866, -0.2811386, 3.124677, 0, 0.9411765, 1, 1,
0.06927354, 0.9209617, 2.154187, 0, 0.9333333, 1, 1,
0.06986874, 0.7209122, -0.4878642, 0, 0.9294118, 1, 1,
0.07108733, 0.3258077, 0.2289934, 0, 0.9215686, 1, 1,
0.07108992, 0.3402825, -0.9576492, 0, 0.9176471, 1, 1,
0.07366372, 0.1375265, 0.8321905, 0, 0.9098039, 1, 1,
0.07572309, -0.9476734, 2.513796, 0, 0.9058824, 1, 1,
0.07896788, 0.3576769, -0.7355533, 0, 0.8980392, 1, 1,
0.08029447, -0.6192948, 2.32752, 0, 0.8901961, 1, 1,
0.0805022, 0.6959803, -0.638496, 0, 0.8862745, 1, 1,
0.0815346, -1.467755, 4.152912, 0, 0.8784314, 1, 1,
0.08592164, -1.415381, 4.127723, 0, 0.8745098, 1, 1,
0.0869601, 0.4769154, -0.1294262, 0, 0.8666667, 1, 1,
0.09074894, 1.290783, -1.526677, 0, 0.8627451, 1, 1,
0.09232653, 0.9501414, 1.604995, 0, 0.854902, 1, 1,
0.09623102, -0.1091293, 1.514988, 0, 0.8509804, 1, 1,
0.0982589, -1.15046, 2.767102, 0, 0.8431373, 1, 1,
0.09855755, -1.009888, 3.095283, 0, 0.8392157, 1, 1,
0.09933294, -1.527704, 2.377983, 0, 0.8313726, 1, 1,
0.101418, 1.645957, 0.8922294, 0, 0.827451, 1, 1,
0.1016155, -2.409124, 1.922169, 0, 0.8196079, 1, 1,
0.1073846, 0.7541393, 0.2230967, 0, 0.8156863, 1, 1,
0.1144449, 0.7757506, -0.0449755, 0, 0.8078431, 1, 1,
0.1162769, 1.512316, -0.02598079, 0, 0.8039216, 1, 1,
0.1193365, -1.88666, 2.302649, 0, 0.7960784, 1, 1,
0.1317684, 1.478569, -0.6058473, 0, 0.7882353, 1, 1,
0.1335801, 0.9555305, -0.2253705, 0, 0.7843137, 1, 1,
0.1343471, -0.567552, 3.905247, 0, 0.7764706, 1, 1,
0.1410171, -0.08414643, 2.093958, 0, 0.772549, 1, 1,
0.1429296, 0.9592274, -0.1637267, 0, 0.7647059, 1, 1,
0.1442229, 1.07356, 1.728513, 0, 0.7607843, 1, 1,
0.1500866, -2.175325, 5.421, 0, 0.7529412, 1, 1,
0.1508666, 1.625808, 0.8834199, 0, 0.7490196, 1, 1,
0.1584384, -0.6207185, 2.367473, 0, 0.7411765, 1, 1,
0.1586647, 0.2258015, -0.9535338, 0, 0.7372549, 1, 1,
0.1600061, -0.9728532, 1.5816, 0, 0.7294118, 1, 1,
0.16636, 0.4565192, 0.4404902, 0, 0.7254902, 1, 1,
0.1696001, -0.6767355, 3.244816, 0, 0.7176471, 1, 1,
0.1742643, -0.3864562, 1.891787, 0, 0.7137255, 1, 1,
0.1756557, 1.647095, -0.9035382, 0, 0.7058824, 1, 1,
0.1768351, 2.007831, -0.7615752, 0, 0.6980392, 1, 1,
0.1783651, -2.445326, 4.545908, 0, 0.6941177, 1, 1,
0.1791606, -0.08387522, 1.786993, 0, 0.6862745, 1, 1,
0.1812882, 0.1978337, -0.4542632, 0, 0.682353, 1, 1,
0.182745, -0.4970947, 3.79013, 0, 0.6745098, 1, 1,
0.1838545, 2.240422, -0.02769647, 0, 0.6705883, 1, 1,
0.1924984, -2.467866, 2.230253, 0, 0.6627451, 1, 1,
0.1964181, 1.885515, 1.20698, 0, 0.6588235, 1, 1,
0.2028051, 0.0379452, 0.2660398, 0, 0.6509804, 1, 1,
0.2059515, -1.742784, 3.834676, 0, 0.6470588, 1, 1,
0.2077251, 0.1330845, 0.6823331, 0, 0.6392157, 1, 1,
0.2077513, 0.745109, 0.8429835, 0, 0.6352941, 1, 1,
0.2105363, 0.6769816, -0.072229, 0, 0.627451, 1, 1,
0.2108135, -0.7583961, 1.082949, 0, 0.6235294, 1, 1,
0.2183888, -2.067082, 2.875783, 0, 0.6156863, 1, 1,
0.2196797, 0.04100912, 2.932042, 0, 0.6117647, 1, 1,
0.2247422, -0.723589, 1.477027, 0, 0.6039216, 1, 1,
0.2259242, -1.323312, 2.263135, 0, 0.5960785, 1, 1,
0.2276002, -0.7010331, 3.677874, 0, 0.5921569, 1, 1,
0.2282136, -1.105144, 4.611063, 0, 0.5843138, 1, 1,
0.2284326, 0.6362628, -0.05234132, 0, 0.5803922, 1, 1,
0.2286387, 1.138493, 0.8631927, 0, 0.572549, 1, 1,
0.2313177, 0.7539416, -0.7052993, 0, 0.5686275, 1, 1,
0.234367, -1.232613, 3.778646, 0, 0.5607843, 1, 1,
0.2347904, 2.089054, -0.2748471, 0, 0.5568628, 1, 1,
0.2361369, -0.03381404, 2.440237, 0, 0.5490196, 1, 1,
0.2379957, 0.3927936, 0.921613, 0, 0.5450981, 1, 1,
0.2434467, -1.134587, 3.940588, 0, 0.5372549, 1, 1,
0.2451373, -2.226751, 1.66138, 0, 0.5333334, 1, 1,
0.2456597, 0.5144998, 0.5990719, 0, 0.5254902, 1, 1,
0.2522445, 1.742629, 0.09671409, 0, 0.5215687, 1, 1,
0.2544617, -0.07765932, 0.4618295, 0, 0.5137255, 1, 1,
0.2548565, 0.4658562, 1.753108, 0, 0.509804, 1, 1,
0.2554455, 0.01460983, 1.159291, 0, 0.5019608, 1, 1,
0.2561112, 0.2983873, 0.6200058, 0, 0.4941176, 1, 1,
0.2574118, 0.5226331, 1.098523, 0, 0.4901961, 1, 1,
0.2622623, 1.231433, 2.032094, 0, 0.4823529, 1, 1,
0.2629335, -0.1099386, 1.316537, 0, 0.4784314, 1, 1,
0.2656959, 0.08686104, -0.703996, 0, 0.4705882, 1, 1,
0.2696799, 0.2392889, 0.7007538, 0, 0.4666667, 1, 1,
0.2709112, -0.8354726, 3.292579, 0, 0.4588235, 1, 1,
0.2720138, 0.238626, 0.5303656, 0, 0.454902, 1, 1,
0.2720277, 0.3147545, 0.9205211, 0, 0.4470588, 1, 1,
0.2742561, -0.2038516, 3.29218, 0, 0.4431373, 1, 1,
0.2755078, 0.1591937, 2.014852, 0, 0.4352941, 1, 1,
0.2755406, -0.07673059, 3.063554, 0, 0.4313726, 1, 1,
0.2839909, -0.24863, 2.505528, 0, 0.4235294, 1, 1,
0.2842506, -2.05729, 1.741012, 0, 0.4196078, 1, 1,
0.2868433, -0.173952, 2.747892, 0, 0.4117647, 1, 1,
0.2914545, -1.37444, 3.536594, 0, 0.4078431, 1, 1,
0.2984029, -0.5218055, 0.7340006, 0, 0.4, 1, 1,
0.2993879, -1.330234, 3.079164, 0, 0.3921569, 1, 1,
0.3073498, 1.097034, -0.3012105, 0, 0.3882353, 1, 1,
0.3076987, 0.2494446, 1.304932, 0, 0.3803922, 1, 1,
0.3097976, -0.9048979, 2.501557, 0, 0.3764706, 1, 1,
0.3099514, 0.9636155, -0.8127789, 0, 0.3686275, 1, 1,
0.3101641, 1.701598, 0.03598025, 0, 0.3647059, 1, 1,
0.3104889, 1.152628, 1.025209, 0, 0.3568628, 1, 1,
0.311269, -0.5573522, 2.716148, 0, 0.3529412, 1, 1,
0.3138728, 1.60064, 0.1979093, 0, 0.345098, 1, 1,
0.3152493, 3.176467, -0.2091861, 0, 0.3411765, 1, 1,
0.3178495, -0.4097419, -0.09181406, 0, 0.3333333, 1, 1,
0.3185597, 0.05254526, 1.187415, 0, 0.3294118, 1, 1,
0.3195265, 1.837813, 2.90398, 0, 0.3215686, 1, 1,
0.320534, 0.6955519, 0.6203174, 0, 0.3176471, 1, 1,
0.3209667, -0.6467716, 4.140403, 0, 0.3098039, 1, 1,
0.332912, -0.7738535, 3.106502, 0, 0.3058824, 1, 1,
0.3401688, -1.27955, 1.8414, 0, 0.2980392, 1, 1,
0.3410783, -1.119954, 2.020073, 0, 0.2901961, 1, 1,
0.3424429, -0.7256734, 2.303763, 0, 0.2862745, 1, 1,
0.3441971, 0.8897565, 1.744998, 0, 0.2784314, 1, 1,
0.3551022, 0.482662, -1.485992, 0, 0.2745098, 1, 1,
0.3558394, 1.185784, -0.3075678, 0, 0.2666667, 1, 1,
0.3574815, 0.04137497, 1.378318, 0, 0.2627451, 1, 1,
0.3590723, 1.912361, 1.001569, 0, 0.254902, 1, 1,
0.3606687, 0.6701121, -0.01875938, 0, 0.2509804, 1, 1,
0.3652728, 2.478883, -2.7129, 0, 0.2431373, 1, 1,
0.3685786, 0.6284224, -2.040192, 0, 0.2392157, 1, 1,
0.3709709, -0.9111447, 1.21516, 0, 0.2313726, 1, 1,
0.3726627, 0.07109726, 0.3876805, 0, 0.227451, 1, 1,
0.3737359, -0.2854586, 2.569918, 0, 0.2196078, 1, 1,
0.3773653, -0.6011911, 2.953795, 0, 0.2156863, 1, 1,
0.379428, -0.5301483, 1.408205, 0, 0.2078431, 1, 1,
0.3832526, 1.046299, 0.919045, 0, 0.2039216, 1, 1,
0.3849992, -1.419037, 3.890392, 0, 0.1960784, 1, 1,
0.3854075, 0.8212864, 1.475769, 0, 0.1882353, 1, 1,
0.3865168, 0.7641485, 2.42706, 0, 0.1843137, 1, 1,
0.3877107, 0.677025, 0.4700015, 0, 0.1764706, 1, 1,
0.3929667, 0.5379394, 1.596507, 0, 0.172549, 1, 1,
0.3932596, 1.468264, -1.252097, 0, 0.1647059, 1, 1,
0.3949864, -1.758548, 4.792042, 0, 0.1607843, 1, 1,
0.3973987, 0.330983, 0.5266019, 0, 0.1529412, 1, 1,
0.3984295, -0.1329927, 2.61845, 0, 0.1490196, 1, 1,
0.3988468, -0.3660343, 0.3990642, 0, 0.1411765, 1, 1,
0.4031114, -1.033405, 2.366017, 0, 0.1372549, 1, 1,
0.4031324, 0.8138765, 0.7558641, 0, 0.1294118, 1, 1,
0.4035385, -0.01732602, 1.663132, 0, 0.1254902, 1, 1,
0.4117188, -0.3086218, 2.081071, 0, 0.1176471, 1, 1,
0.416064, -1.077737, 3.020529, 0, 0.1137255, 1, 1,
0.4170687, 0.2512515, 0.3671, 0, 0.1058824, 1, 1,
0.4175507, -1.066659, 2.745431, 0, 0.09803922, 1, 1,
0.4188274, -0.3245915, 2.419473, 0, 0.09411765, 1, 1,
0.4216373, -0.9698094, 0.964488, 0, 0.08627451, 1, 1,
0.431205, 0.4652965, 0.06086452, 0, 0.08235294, 1, 1,
0.4334693, 1.462163, 0.7590247, 0, 0.07450981, 1, 1,
0.4534914, -1.211354, 3.588532, 0, 0.07058824, 1, 1,
0.453577, -1.458762, 0.9547718, 0, 0.0627451, 1, 1,
0.456265, 0.8870339, 0.6481478, 0, 0.05882353, 1, 1,
0.4572915, 2.365216, 0.5041649, 0, 0.05098039, 1, 1,
0.4599617, -0.2268319, 2.057738, 0, 0.04705882, 1, 1,
0.4674503, 1.41153, -1.31108, 0, 0.03921569, 1, 1,
0.4683973, -0.9521298, 2.394238, 0, 0.03529412, 1, 1,
0.4697099, -0.1810074, 2.578031, 0, 0.02745098, 1, 1,
0.4721121, -0.7221624, 2.686946, 0, 0.02352941, 1, 1,
0.4736233, -0.0072757, 3.606218, 0, 0.01568628, 1, 1,
0.484498, 1.034714, 0.4373221, 0, 0.01176471, 1, 1,
0.4889801, -1.104535, 1.872902, 0, 0.003921569, 1, 1,
0.4920145, -0.3322184, 0.586169, 0.003921569, 0, 1, 1,
0.4922694, -0.9752017, 4.201718, 0.007843138, 0, 1, 1,
0.4942822, -1.217909, 4.220567, 0.01568628, 0, 1, 1,
0.4966932, -0.6320738, 2.340548, 0.01960784, 0, 1, 1,
0.497649, 1.385333, -0.01872233, 0.02745098, 0, 1, 1,
0.4987151, 0.6972374, 0.8379334, 0.03137255, 0, 1, 1,
0.5001549, -1.852756, 2.611156, 0.03921569, 0, 1, 1,
0.5007843, 0.1449936, 4.499302, 0.04313726, 0, 1, 1,
0.5141145, -0.8399823, 1.867353, 0.05098039, 0, 1, 1,
0.5157698, -0.280193, 2.203254, 0.05490196, 0, 1, 1,
0.5206326, 1.820933, -1.481946, 0.0627451, 0, 1, 1,
0.5209785, 0.3258033, 2.623513, 0.06666667, 0, 1, 1,
0.523217, 3.135432, 0.3142917, 0.07450981, 0, 1, 1,
0.5242232, -0.09634493, 0.9294305, 0.07843138, 0, 1, 1,
0.524918, -0.615262, 3.147937, 0.08627451, 0, 1, 1,
0.5263152, 0.632257, -0.3463823, 0.09019608, 0, 1, 1,
0.5326816, 0.3917789, 2.271807, 0.09803922, 0, 1, 1,
0.5366887, 0.3449852, 0.3634294, 0.1058824, 0, 1, 1,
0.5369933, -1.329601, 2.530343, 0.1098039, 0, 1, 1,
0.539957, 0.2320463, 0.7255332, 0.1176471, 0, 1, 1,
0.5411249, 1.459011, 0.06416576, 0.1215686, 0, 1, 1,
0.5425103, -0.002612934, 1.370475, 0.1294118, 0, 1, 1,
0.5452673, -0.6061964, 2.310589, 0.1333333, 0, 1, 1,
0.5478272, 0.4936507, 1.104737, 0.1411765, 0, 1, 1,
0.5483178, -1.402884, 2.534375, 0.145098, 0, 1, 1,
0.5495398, -0.002490114, 1.9114, 0.1529412, 0, 1, 1,
0.5504897, 0.132109, 0.4557689, 0.1568628, 0, 1, 1,
0.5534598, 0.5623873, 1.202945, 0.1647059, 0, 1, 1,
0.5545053, 1.004643, 0.4042614, 0.1686275, 0, 1, 1,
0.5574281, -1.42463, 2.886391, 0.1764706, 0, 1, 1,
0.5605072, 0.2237347, 0.5265986, 0.1803922, 0, 1, 1,
0.5606747, -1.38244, 3.224181, 0.1882353, 0, 1, 1,
0.5611705, -0.3197127, 2.055678, 0.1921569, 0, 1, 1,
0.5626318, 1.596243, -1.88855, 0.2, 0, 1, 1,
0.5637861, 0.1189405, 2.000924, 0.2078431, 0, 1, 1,
0.5641353, 0.6598252, 1.114506, 0.2117647, 0, 1, 1,
0.5716934, 1.323978, -0.4621821, 0.2196078, 0, 1, 1,
0.5735465, 1.478011, -0.9649838, 0.2235294, 0, 1, 1,
0.5736089, 0.3400961, 2.988061, 0.2313726, 0, 1, 1,
0.5757422, -0.4217604, 3.09765, 0.2352941, 0, 1, 1,
0.577247, 1.053117, -0.6118077, 0.2431373, 0, 1, 1,
0.5835122, 0.5456886, 0.09988795, 0.2470588, 0, 1, 1,
0.5858366, -1.899059, 3.227321, 0.254902, 0, 1, 1,
0.5948045, -0.9695011, 2.929457, 0.2588235, 0, 1, 1,
0.5955428, -0.5494086, 0.2990418, 0.2666667, 0, 1, 1,
0.5971599, 0.841963, -0.8170887, 0.2705882, 0, 1, 1,
0.598478, -0.927857, 2.981239, 0.2784314, 0, 1, 1,
0.6047857, -0.08336332, 3.178752, 0.282353, 0, 1, 1,
0.6061836, -1.33885, 0.4362887, 0.2901961, 0, 1, 1,
0.6094044, 1.371185, -1.234317, 0.2941177, 0, 1, 1,
0.6094978, -1.131766, 3.556448, 0.3019608, 0, 1, 1,
0.6129793, -0.7413365, 1.819271, 0.3098039, 0, 1, 1,
0.6150156, 0.2098916, 0.43657, 0.3137255, 0, 1, 1,
0.6151205, -0.9076902, 1.342439, 0.3215686, 0, 1, 1,
0.615257, 0.7589571, -0.6396811, 0.3254902, 0, 1, 1,
0.6164666, 1.600587, -0.8705744, 0.3333333, 0, 1, 1,
0.620753, 0.7494525, 1.584973, 0.3372549, 0, 1, 1,
0.6243667, -1.595803, 1.877986, 0.345098, 0, 1, 1,
0.6264302, 0.5862121, -0.3625607, 0.3490196, 0, 1, 1,
0.6329556, -0.5242476, 3.158582, 0.3568628, 0, 1, 1,
0.6434098, 0.03764266, 0.410233, 0.3607843, 0, 1, 1,
0.647449, 0.3197798, 1.026486, 0.3686275, 0, 1, 1,
0.6481113, 0.4925798, 0.05055658, 0.372549, 0, 1, 1,
0.6521655, -0.506732, 2.298972, 0.3803922, 0, 1, 1,
0.6534342, -0.6776707, 3.734073, 0.3843137, 0, 1, 1,
0.6608024, 0.4320545, 1.361317, 0.3921569, 0, 1, 1,
0.6676933, 0.5307362, 0.7842609, 0.3960784, 0, 1, 1,
0.6691131, -0.77327, 3.09747, 0.4039216, 0, 1, 1,
0.6697155, 0.004639107, 1.901233, 0.4117647, 0, 1, 1,
0.6711725, -0.01731499, 1.587529, 0.4156863, 0, 1, 1,
0.6719064, 1.50613, -1.405158, 0.4235294, 0, 1, 1,
0.6775845, -0.6846541, 1.628064, 0.427451, 0, 1, 1,
0.6824203, 0.7813162, 0.1578317, 0.4352941, 0, 1, 1,
0.6880912, 0.9798656, 0.7468448, 0.4392157, 0, 1, 1,
0.6882355, 1.102476, -2.199654, 0.4470588, 0, 1, 1,
0.6913503, -0.6269037, 2.795979, 0.4509804, 0, 1, 1,
0.7022178, -1.365076, 2.52862, 0.4588235, 0, 1, 1,
0.7069688, -0.5775057, 1.896213, 0.4627451, 0, 1, 1,
0.7168097, 0.08163345, 1.721081, 0.4705882, 0, 1, 1,
0.7210958, -1.734298, 4.461801, 0.4745098, 0, 1, 1,
0.7253395, 0.05556576, 1.319287, 0.4823529, 0, 1, 1,
0.7255545, -1.420416, 2.218045, 0.4862745, 0, 1, 1,
0.7308837, 0.1074651, 1.716044, 0.4941176, 0, 1, 1,
0.7315681, 1.48783, 2.207204, 0.5019608, 0, 1, 1,
0.7340676, -0.7011958, 2.683982, 0.5058824, 0, 1, 1,
0.735868, 1.305885, -0.8890544, 0.5137255, 0, 1, 1,
0.7472089, 0.2844831, 1.254856, 0.5176471, 0, 1, 1,
0.7476261, -1.602629, 2.624539, 0.5254902, 0, 1, 1,
0.7484402, 1.040995, 0.5669367, 0.5294118, 0, 1, 1,
0.7595875, -0.6838613, 2.65541, 0.5372549, 0, 1, 1,
0.7601714, -0.3108813, 1.477594, 0.5411765, 0, 1, 1,
0.765471, 0.8024876, 0.4598576, 0.5490196, 0, 1, 1,
0.7670088, 1.447294, 0.8813816, 0.5529412, 0, 1, 1,
0.7734398, -0.2994061, 2.232049, 0.5607843, 0, 1, 1,
0.773725, -0.03039956, 0.6893467, 0.5647059, 0, 1, 1,
0.776044, -0.9575388, 2.536695, 0.572549, 0, 1, 1,
0.7779148, -1.612646, 1.38436, 0.5764706, 0, 1, 1,
0.7793732, 0.6406626, 0.07659679, 0.5843138, 0, 1, 1,
0.7833773, -2.259371, 4.422359, 0.5882353, 0, 1, 1,
0.7851719, -1.488782, 2.380163, 0.5960785, 0, 1, 1,
0.7880666, -0.2954579, 2.697738, 0.6039216, 0, 1, 1,
0.7894294, -1.039061, 2.293491, 0.6078432, 0, 1, 1,
0.7941433, 0.9996807, 0.02224613, 0.6156863, 0, 1, 1,
0.7958562, 0.5048057, 1.018714, 0.6196079, 0, 1, 1,
0.7969408, -1.603343, 1.566264, 0.627451, 0, 1, 1,
0.7980101, 0.1550398, 0.4358681, 0.6313726, 0, 1, 1,
0.7989919, -0.02795816, 0.1990077, 0.6392157, 0, 1, 1,
0.8042382, -0.2407564, 1.475166, 0.6431373, 0, 1, 1,
0.8055514, 1.83641, 0.3559047, 0.6509804, 0, 1, 1,
0.8063432, 0.2239314, 2.439186, 0.654902, 0, 1, 1,
0.8101621, -0.2743356, 1.526393, 0.6627451, 0, 1, 1,
0.8111105, 0.6239436, 0.5141543, 0.6666667, 0, 1, 1,
0.8139702, -0.4906027, 0.5645711, 0.6745098, 0, 1, 1,
0.8230616, -0.2903027, 0.3954257, 0.6784314, 0, 1, 1,
0.823324, 1.89445, 0.5937269, 0.6862745, 0, 1, 1,
0.8331457, 0.5400259, 1.016876, 0.6901961, 0, 1, 1,
0.8354787, 0.9259894, 1.459767, 0.6980392, 0, 1, 1,
0.8356693, 1.010166, 0.4414367, 0.7058824, 0, 1, 1,
0.8372185, -0.1643586, 2.85515, 0.7098039, 0, 1, 1,
0.8375254, 0.5367993, 1.320658, 0.7176471, 0, 1, 1,
0.8391142, -0.2048194, 2.198054, 0.7215686, 0, 1, 1,
0.8399353, -0.9691989, 1.319271, 0.7294118, 0, 1, 1,
0.8403441, -0.2141119, 2.807748, 0.7333333, 0, 1, 1,
0.8404482, 0.2594244, 0.06686373, 0.7411765, 0, 1, 1,
0.8459099, 2.07447, 0.5440097, 0.7450981, 0, 1, 1,
0.8479906, -0.1315394, 1.32426, 0.7529412, 0, 1, 1,
0.8485661, 1.717521, -0.301648, 0.7568628, 0, 1, 1,
0.8500932, 0.577767, 0.1002472, 0.7647059, 0, 1, 1,
0.8565834, 1.22504, 1.62745, 0.7686275, 0, 1, 1,
0.8578432, -0.2373245, 2.332619, 0.7764706, 0, 1, 1,
0.8596725, -1.99744, 2.681917, 0.7803922, 0, 1, 1,
0.8686197, 0.2393424, 2.182415, 0.7882353, 0, 1, 1,
0.8696584, -0.6175597, 2.155942, 0.7921569, 0, 1, 1,
0.8839592, -0.5314466, 2.613694, 0.8, 0, 1, 1,
0.8941655, 2.376463, 2.034983, 0.8078431, 0, 1, 1,
0.896202, 0.7535112, 1.187131, 0.8117647, 0, 1, 1,
0.9151704, -0.6021654, 2.128715, 0.8196079, 0, 1, 1,
0.9154879, -0.5884285, 3.526938, 0.8235294, 0, 1, 1,
0.9178219, -1.859764, 4.046419, 0.8313726, 0, 1, 1,
0.9191386, -1.123987, 2.474527, 0.8352941, 0, 1, 1,
0.9288306, -0.4294496, 2.851063, 0.8431373, 0, 1, 1,
0.9335837, -0.4693814, 2.860852, 0.8470588, 0, 1, 1,
0.9388242, -1.645441, 2.298213, 0.854902, 0, 1, 1,
0.9512695, 0.3622354, 1.21388, 0.8588235, 0, 1, 1,
0.9513993, 0.2915022, 0.4133711, 0.8666667, 0, 1, 1,
0.9518111, -0.2752895, 2.346575, 0.8705882, 0, 1, 1,
0.9521408, -1.078971, 1.615657, 0.8784314, 0, 1, 1,
0.9531246, -1.134852, 2.817588, 0.8823529, 0, 1, 1,
0.9601325, 0.4841016, 1.16462, 0.8901961, 0, 1, 1,
0.9646201, -0.5363262, 1.460837, 0.8941177, 0, 1, 1,
0.9722281, -0.1117392, 0.458958, 0.9019608, 0, 1, 1,
0.9781958, 0.9632723, 0.9306071, 0.9098039, 0, 1, 1,
0.9857483, -0.501699, 1.417275, 0.9137255, 0, 1, 1,
0.9869943, 0.7949525, 0.4225684, 0.9215686, 0, 1, 1,
0.9890832, -0.9177951, 3.106299, 0.9254902, 0, 1, 1,
0.9891236, 0.9953161, 1.17169, 0.9333333, 0, 1, 1,
0.9955211, -0.5961348, 1.41618, 0.9372549, 0, 1, 1,
1.003371, -0.2768407, 2.101317, 0.945098, 0, 1, 1,
1.005649, -0.376468, 1.998161, 0.9490196, 0, 1, 1,
1.008248, 0.6705002, 1.365582, 0.9568627, 0, 1, 1,
1.008309, -0.9235874, 2.022224, 0.9607843, 0, 1, 1,
1.009554, 0.8490183, 0.840095, 0.9686275, 0, 1, 1,
1.014555, 0.04062859, 2.158896, 0.972549, 0, 1, 1,
1.020268, 0.130907, 2.683584, 0.9803922, 0, 1, 1,
1.020868, 1.371703, 0.07340373, 0.9843137, 0, 1, 1,
1.025865, 0.0733178, 2.723361, 0.9921569, 0, 1, 1,
1.031338, -0.3029668, 3.281135, 0.9960784, 0, 1, 1,
1.033913, 1.082962, 0.3734784, 1, 0, 0.9960784, 1,
1.03521, -0.6012347, 2.420977, 1, 0, 0.9882353, 1,
1.038368, 1.256596, 0.5945821, 1, 0, 0.9843137, 1,
1.039854, -1.228473, 3.473607, 1, 0, 0.9764706, 1,
1.048297, -0.2375856, 0.9750691, 1, 0, 0.972549, 1,
1.048565, 0.747522, 1.329883, 1, 0, 0.9647059, 1,
1.054648, 1.309784, 0.204184, 1, 0, 0.9607843, 1,
1.061858, -0.730893, 3.418532, 1, 0, 0.9529412, 1,
1.064046, 0.4800438, 2.069485, 1, 0, 0.9490196, 1,
1.067828, 1.242373, -0.3477556, 1, 0, 0.9411765, 1,
1.070179, -1.099889, 2.09112, 1, 0, 0.9372549, 1,
1.088569, 0.1432388, 2.028408, 1, 0, 0.9294118, 1,
1.092305, 1.396437, 0.2120233, 1, 0, 0.9254902, 1,
1.094424, -0.6827123, 2.142638, 1, 0, 0.9176471, 1,
1.102484, 0.6877262, 1.514312, 1, 0, 0.9137255, 1,
1.109148, 0.1399317, 0.4376752, 1, 0, 0.9058824, 1,
1.111238, 0.5304086, 0.1708216, 1, 0, 0.9019608, 1,
1.1143, -0.6898807, 2.466309, 1, 0, 0.8941177, 1,
1.122855, -0.146849, 0.6371964, 1, 0, 0.8862745, 1,
1.123498, -0.5339904, 3.128923, 1, 0, 0.8823529, 1,
1.126593, -0.4068781, 1.66984, 1, 0, 0.8745098, 1,
1.126624, -1.687468, 2.182987, 1, 0, 0.8705882, 1,
1.131076, -0.5922065, 2.547577, 1, 0, 0.8627451, 1,
1.131846, 2.603009, 0.3426299, 1, 0, 0.8588235, 1,
1.138551, -1.353611, 1.398417, 1, 0, 0.8509804, 1,
1.140172, -0.4408284, 2.232383, 1, 0, 0.8470588, 1,
1.147084, -0.1123462, 1.139982, 1, 0, 0.8392157, 1,
1.147361, 1.051102, 1.00995, 1, 0, 0.8352941, 1,
1.149507, 0.3735414, 0.3713004, 1, 0, 0.827451, 1,
1.159033, 1.914751, 2.017482, 1, 0, 0.8235294, 1,
1.164206, -0.5353389, 0.7906741, 1, 0, 0.8156863, 1,
1.169592, -1.069434, 2.269887, 1, 0, 0.8117647, 1,
1.175476, -0.1082689, 2.330522, 1, 0, 0.8039216, 1,
1.175968, -0.8544084, 1.197908, 1, 0, 0.7960784, 1,
1.179269, 0.04564695, 2.955166, 1, 0, 0.7921569, 1,
1.179548, -0.1187826, 2.736776, 1, 0, 0.7843137, 1,
1.186494, 0.6303992, 1.050327, 1, 0, 0.7803922, 1,
1.186739, 0.2210626, 1.815115, 1, 0, 0.772549, 1,
1.189267, -1.951267, 2.3746, 1, 0, 0.7686275, 1,
1.196461, -1.436771, 3.157151, 1, 0, 0.7607843, 1,
1.20505, -0.3786775, 1.803076, 1, 0, 0.7568628, 1,
1.209771, 1.150994, 0.6407009, 1, 0, 0.7490196, 1,
1.216133, -0.06889528, 0.1677776, 1, 0, 0.7450981, 1,
1.218656, 1.64996, 0.6221783, 1, 0, 0.7372549, 1,
1.21966, -0.6538411, 1.076901, 1, 0, 0.7333333, 1,
1.220668, -0.3115644, 2.921545, 1, 0, 0.7254902, 1,
1.223888, -0.8001373, 1.906942, 1, 0, 0.7215686, 1,
1.225184, 1.15402, 1.335819, 1, 0, 0.7137255, 1,
1.239909, -0.1694888, 0.5461262, 1, 0, 0.7098039, 1,
1.240095, 0.8225347, 1.56106, 1, 0, 0.7019608, 1,
1.244938, 0.4733043, 1.939589, 1, 0, 0.6941177, 1,
1.247492, 0.018418, 1.410342, 1, 0, 0.6901961, 1,
1.249336, 0.1490861, 1.637558, 1, 0, 0.682353, 1,
1.259795, -0.767292, 3.686775, 1, 0, 0.6784314, 1,
1.262083, -1.297112, 2.218194, 1, 0, 0.6705883, 1,
1.263267, 1.039969, 0.8664822, 1, 0, 0.6666667, 1,
1.26378, -0.674696, 3.7611, 1, 0, 0.6588235, 1,
1.264452, -1.874079, 1.945157, 1, 0, 0.654902, 1,
1.267835, -0.7449076, 2.987305, 1, 0, 0.6470588, 1,
1.26793, -0.3721705, 2.298217, 1, 0, 0.6431373, 1,
1.271992, 0.5607284, 2.019503, 1, 0, 0.6352941, 1,
1.277209, 0.1163053, 3.644442, 1, 0, 0.6313726, 1,
1.278639, -0.06799585, -0.248363, 1, 0, 0.6235294, 1,
1.283113, 1.606733, 1.741934, 1, 0, 0.6196079, 1,
1.28423, -0.1323969, 1.246918, 1, 0, 0.6117647, 1,
1.285481, 0.1898843, 1.640644, 1, 0, 0.6078432, 1,
1.294868, -0.2118514, 1.093488, 1, 0, 0.6, 1,
1.29501, -0.1638525, 1.479497, 1, 0, 0.5921569, 1,
1.295113, -0.04396046, 1.915428, 1, 0, 0.5882353, 1,
1.301705, 0.7972811, 1.20595, 1, 0, 0.5803922, 1,
1.302491, -0.4742945, 3.19345, 1, 0, 0.5764706, 1,
1.305804, -1.063088, -0.1469407, 1, 0, 0.5686275, 1,
1.322688, 0.2818066, 2.506392, 1, 0, 0.5647059, 1,
1.322994, -0.4878953, 1.086663, 1, 0, 0.5568628, 1,
1.328271, 0.245074, 1.012139, 1, 0, 0.5529412, 1,
1.355077, -0.7453954, 4.232133, 1, 0, 0.5450981, 1,
1.356147, 0.1296614, 1.929948, 1, 0, 0.5411765, 1,
1.362134, 0.07137861, 1.588728, 1, 0, 0.5333334, 1,
1.363203, 1.469605, 0.06079205, 1, 0, 0.5294118, 1,
1.367574, 0.706246, 0.6510959, 1, 0, 0.5215687, 1,
1.370044, -0.57122, 0.5580785, 1, 0, 0.5176471, 1,
1.375095, 0.846158, 1.35156, 1, 0, 0.509804, 1,
1.394463, -1.420056, 2.777894, 1, 0, 0.5058824, 1,
1.39575, -0.3972365, 1.281171, 1, 0, 0.4980392, 1,
1.404742, -0.02553689, 0.03041101, 1, 0, 0.4901961, 1,
1.408569, 3.003917, -0.8637629, 1, 0, 0.4862745, 1,
1.417464, -0.05841089, 0.9806567, 1, 0, 0.4784314, 1,
1.419192, 0.02495631, 1.4987, 1, 0, 0.4745098, 1,
1.428651, 0.98374, 1.479955, 1, 0, 0.4666667, 1,
1.434719, -0.406689, 0.8611996, 1, 0, 0.4627451, 1,
1.44593, 1.061772, 0.8279353, 1, 0, 0.454902, 1,
1.452566, 1.046794, 0.9919116, 1, 0, 0.4509804, 1,
1.508035, -0.8987686, 3.269702, 1, 0, 0.4431373, 1,
1.518081, 0.4122303, 0.9040425, 1, 0, 0.4392157, 1,
1.525467, 1.375881, 1.403878, 1, 0, 0.4313726, 1,
1.525859, -0.4164261, 0.3003443, 1, 0, 0.427451, 1,
1.53377, -0.7689521, 2.084949, 1, 0, 0.4196078, 1,
1.538275, -0.6415259, 1.325981, 1, 0, 0.4156863, 1,
1.54724, -1.578839, 1.868059, 1, 0, 0.4078431, 1,
1.549125, -0.4020431, 3.117277, 1, 0, 0.4039216, 1,
1.554568, -0.6903446, 1.881081, 1, 0, 0.3960784, 1,
1.561155, -0.9538623, 1.213627, 1, 0, 0.3882353, 1,
1.571951, -1.342214, 2.756943, 1, 0, 0.3843137, 1,
1.574642, -0.8851524, 3.054625, 1, 0, 0.3764706, 1,
1.576236, -1.463796, 3.569857, 1, 0, 0.372549, 1,
1.576258, -1.104155, 1.148251, 1, 0, 0.3647059, 1,
1.587959, -0.3576714, 1.088822, 1, 0, 0.3607843, 1,
1.590473, -2.248062, 2.373515, 1, 0, 0.3529412, 1,
1.592397, 1.143996, 0.07370273, 1, 0, 0.3490196, 1,
1.598799, 0.109295, 1.474342, 1, 0, 0.3411765, 1,
1.606991, -1.048868, 2.95387, 1, 0, 0.3372549, 1,
1.614513, -1.221419, 4.061932, 1, 0, 0.3294118, 1,
1.618001, 1.414785, -0.4108002, 1, 0, 0.3254902, 1,
1.626129, 0.01904553, 2.570419, 1, 0, 0.3176471, 1,
1.630225, 0.8827651, 1.658638, 1, 0, 0.3137255, 1,
1.6335, -0.3161262, 3.551326, 1, 0, 0.3058824, 1,
1.636894, -1.752795, 3.046599, 1, 0, 0.2980392, 1,
1.65088, 1.435654, 0.7639869, 1, 0, 0.2941177, 1,
1.659619, 0.948364, 2.292614, 1, 0, 0.2862745, 1,
1.670056, -0.5755041, 2.014032, 1, 0, 0.282353, 1,
1.672052, -0.04114006, 0.8945699, 1, 0, 0.2745098, 1,
1.672457, -0.5967333, -0.2829033, 1, 0, 0.2705882, 1,
1.681992, -0.5206605, 2.636933, 1, 0, 0.2627451, 1,
1.684374, 0.09946604, 1.554774, 1, 0, 0.2588235, 1,
1.709338, -1.643274, 1.353031, 1, 0, 0.2509804, 1,
1.715539, 0.8172022, 1.606197, 1, 0, 0.2470588, 1,
1.73141, -0.1900304, 3.941694, 1, 0, 0.2392157, 1,
1.803159, 0.6032038, 2.884053, 1, 0, 0.2352941, 1,
1.82148, 0.4777378, 1.091627, 1, 0, 0.227451, 1,
1.826591, 0.2534803, 0.9014149, 1, 0, 0.2235294, 1,
1.853613, 0.984193, 0.6367892, 1, 0, 0.2156863, 1,
1.855201, 0.7608128, 1.697648, 1, 0, 0.2117647, 1,
1.858479, -1.42941, 2.643555, 1, 0, 0.2039216, 1,
1.858545, 0.9281285, 1.453582, 1, 0, 0.1960784, 1,
1.868205, -0.2830262, 2.971708, 1, 0, 0.1921569, 1,
1.876302, -0.7246745, 3.57702, 1, 0, 0.1843137, 1,
1.917993, -0.5601414, 1.092185, 1, 0, 0.1803922, 1,
1.929312, 0.8414299, 1.221961, 1, 0, 0.172549, 1,
1.930857, -2.020401, 0.7931831, 1, 0, 0.1686275, 1,
1.959394, 1.28223, 0.7627203, 1, 0, 0.1607843, 1,
1.965611, 0.4035359, 0.7346467, 1, 0, 0.1568628, 1,
1.990825, 0.05529277, 1.39438, 1, 0, 0.1490196, 1,
2.005746, 2.218395, 0.140128, 1, 0, 0.145098, 1,
2.025727, -0.9234406, 3.178668, 1, 0, 0.1372549, 1,
2.09058, -0.653695, 0.3020721, 1, 0, 0.1333333, 1,
2.101976, 0.555472, 2.451696, 1, 0, 0.1254902, 1,
2.105925, 0.6219956, 1.742254, 1, 0, 0.1215686, 1,
2.135242, 1.919149, 0.5590925, 1, 0, 0.1137255, 1,
2.137267, -1.424433, 2.044922, 1, 0, 0.1098039, 1,
2.148926, -2.635273, 3.845442, 1, 0, 0.1019608, 1,
2.208929, -0.1490535, 0.7085451, 1, 0, 0.09411765, 1,
2.25122, 1.339062, 0.6049382, 1, 0, 0.09019608, 1,
2.338718, 0.849933, 1.429744, 1, 0, 0.08235294, 1,
2.353663, 0.3048337, 4.020913, 1, 0, 0.07843138, 1,
2.35884, -0.2244807, 3.106561, 1, 0, 0.07058824, 1,
2.363932, 0.5384724, 1.121768, 1, 0, 0.06666667, 1,
2.371836, -0.07840347, 0.9190876, 1, 0, 0.05882353, 1,
2.372538, -0.5317333, 2.560286, 1, 0, 0.05490196, 1,
2.403237, 0.8331549, 1.752089, 1, 0, 0.04705882, 1,
2.410108, 1.365049, 0.238766, 1, 0, 0.04313726, 1,
2.417469, 0.08087164, 1.736492, 1, 0, 0.03529412, 1,
2.472548, -1.858042, 0.9013395, 1, 0, 0.03137255, 1,
2.531678, 1.15291, 1.615388, 1, 0, 0.02352941, 1,
2.563209, 1.678585, 1.375805, 1, 0, 0.01960784, 1,
2.795566, -0.2333116, 1.62068, 1, 0, 0.01176471, 1,
3.057676, -1.027934, 0.7979007, 1, 0, 0.007843138, 1
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
0.08114541, -3.761287, -7.002918, 0, -0.5, 0.5, 0.5,
0.08114541, -3.761287, -7.002918, 1, -0.5, 0.5, 0.5,
0.08114541, -3.761287, -7.002918, 1, 1.5, 0.5, 0.5,
0.08114541, -3.761287, -7.002918, 0, 1.5, 0.5, 0.5
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
-3.904428, 0.2103473, -7.002918, 0, -0.5, 0.5, 0.5,
-3.904428, 0.2103473, -7.002918, 1, -0.5, 0.5, 0.5,
-3.904428, 0.2103473, -7.002918, 1, 1.5, 0.5, 0.5,
-3.904428, 0.2103473, -7.002918, 0, 1.5, 0.5, 0.5
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
-3.904428, -3.761287, 0.1093636, 0, -0.5, 0.5, 0.5,
-3.904428, -3.761287, 0.1093636, 1, -0.5, 0.5, 0.5,
-3.904428, -3.761287, 0.1093636, 1, 1.5, 0.5, 0.5,
-3.904428, -3.761287, 0.1093636, 0, 1.5, 0.5, 0.5
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
-2, -2.844756, -5.361622,
3, -2.844756, -5.361622,
-2, -2.844756, -5.361622,
-2, -2.997511, -5.635172,
-1, -2.844756, -5.361622,
-1, -2.997511, -5.635172,
0, -2.844756, -5.361622,
0, -2.997511, -5.635172,
1, -2.844756, -5.361622,
1, -2.997511, -5.635172,
2, -2.844756, -5.361622,
2, -2.997511, -5.635172,
3, -2.844756, -5.361622,
3, -2.997511, -5.635172
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
-2, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
-2, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
-2, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
-2, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5,
-1, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
-1, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
-1, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
-1, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5,
0, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
0, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
0, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
0, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5,
1, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
1, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
1, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
1, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5,
2, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
2, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
2, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
2, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5,
3, -3.303022, -6.182271, 0, -0.5, 0.5, 0.5,
3, -3.303022, -6.182271, 1, -0.5, 0.5, 0.5,
3, -3.303022, -6.182271, 1, 1.5, 0.5, 0.5,
3, -3.303022, -6.182271, 0, 1.5, 0.5, 0.5
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
-2.984681, -2, -5.361622,
-2.984681, 3, -5.361622,
-2.984681, -2, -5.361622,
-3.137972, -2, -5.635172,
-2.984681, -1, -5.361622,
-3.137972, -1, -5.635172,
-2.984681, 0, -5.361622,
-3.137972, 0, -5.635172,
-2.984681, 1, -5.361622,
-3.137972, 1, -5.635172,
-2.984681, 2, -5.361622,
-3.137972, 2, -5.635172,
-2.984681, 3, -5.361622,
-3.137972, 3, -5.635172
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
-3.444555, -2, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, -2, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, -2, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, -2, -6.182271, 0, 1.5, 0.5, 0.5,
-3.444555, -1, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, -1, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, -1, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, -1, -6.182271, 0, 1.5, 0.5, 0.5,
-3.444555, 0, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, 0, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, 0, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, 0, -6.182271, 0, 1.5, 0.5, 0.5,
-3.444555, 1, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, 1, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, 1, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, 1, -6.182271, 0, 1.5, 0.5, 0.5,
-3.444555, 2, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, 2, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, 2, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, 2, -6.182271, 0, 1.5, 0.5, 0.5,
-3.444555, 3, -6.182271, 0, -0.5, 0.5, 0.5,
-3.444555, 3, -6.182271, 1, -0.5, 0.5, 0.5,
-3.444555, 3, -6.182271, 1, 1.5, 0.5, 0.5,
-3.444555, 3, -6.182271, 0, 1.5, 0.5, 0.5
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
-2.984681, -2.844756, -4,
-2.984681, -2.844756, 4,
-2.984681, -2.844756, -4,
-3.137972, -2.997511, -4,
-2.984681, -2.844756, -2,
-3.137972, -2.997511, -2,
-2.984681, -2.844756, 0,
-3.137972, -2.997511, 0,
-2.984681, -2.844756, 2,
-3.137972, -2.997511, 2,
-2.984681, -2.844756, 4,
-3.137972, -2.997511, 4
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
-3.444555, -3.303022, -4, 0, -0.5, 0.5, 0.5,
-3.444555, -3.303022, -4, 1, -0.5, 0.5, 0.5,
-3.444555, -3.303022, -4, 1, 1.5, 0.5, 0.5,
-3.444555, -3.303022, -4, 0, 1.5, 0.5, 0.5,
-3.444555, -3.303022, -2, 0, -0.5, 0.5, 0.5,
-3.444555, -3.303022, -2, 1, -0.5, 0.5, 0.5,
-3.444555, -3.303022, -2, 1, 1.5, 0.5, 0.5,
-3.444555, -3.303022, -2, 0, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 0, 0, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 0, 1, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 0, 1, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 0, 0, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 2, 0, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 2, 1, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 2, 1, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 2, 0, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 4, 0, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 4, 1, -0.5, 0.5, 0.5,
-3.444555, -3.303022, 4, 1, 1.5, 0.5, 0.5,
-3.444555, -3.303022, 4, 0, 1.5, 0.5, 0.5
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
-2.984681, -2.844756, -5.361622,
-2.984681, 3.265451, -5.361622,
-2.984681, -2.844756, 5.580349,
-2.984681, 3.265451, 5.580349,
-2.984681, -2.844756, -5.361622,
-2.984681, -2.844756, 5.580349,
-2.984681, 3.265451, -5.361622,
-2.984681, 3.265451, 5.580349,
-2.984681, -2.844756, -5.361622,
3.146971, -2.844756, -5.361622,
-2.984681, -2.844756, 5.580349,
3.146971, -2.844756, 5.580349,
-2.984681, 3.265451, -5.361622,
3.146971, 3.265451, -5.361622,
-2.984681, 3.265451, 5.580349,
3.146971, 3.265451, 5.580349,
3.146971, -2.844756, -5.361622,
3.146971, 3.265451, -5.361622,
3.146971, -2.844756, 5.580349,
3.146971, 3.265451, 5.580349,
3.146971, -2.844756, -5.361622,
3.146971, -2.844756, 5.580349,
3.146971, 3.265451, -5.361622,
3.146971, 3.265451, 5.580349
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
var radius = 7.450102;
var distance = 33.14634;
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
mvMatrix.translate( -0.08114541, -0.2103473, -0.1093636 );
mvMatrix.scale( 1.313707, 1.318318, 0.736174 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14634);
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
fluoridamid<-read.table("fluoridamid.xyz")
```

```
## Error in read.table("fluoridamid.xyz"): no lines available in input
```

```r
x<-fluoridamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
y<-fluoridamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
z<-fluoridamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
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
-2.895385, -1.120655, -1.277144, 0, 0, 1, 1, 1,
-2.809191, -0.7149346, -1.309533, 1, 0, 0, 1, 1,
-2.784821, 0.3325375, -0.9727087, 1, 0, 0, 1, 1,
-2.658363, 0.5954571, -0.6106855, 1, 0, 0, 1, 1,
-2.474151, -1.069943, -2.800222, 1, 0, 0, 1, 1,
-2.368236, -0.04321857, -1.992625, 1, 0, 0, 1, 1,
-2.367335, 0.6607956, 0.1558361, 0, 0, 0, 1, 1,
-2.339097, -0.07202926, -1.709048, 0, 0, 0, 1, 1,
-2.305604, 0.6125482, -0.5977883, 0, 0, 0, 1, 1,
-2.240618, -0.2068889, -1.910324, 0, 0, 0, 1, 1,
-2.22652, -0.3662174, -1.146357, 0, 0, 0, 1, 1,
-2.154067, 0.02026371, -2.246031, 0, 0, 0, 1, 1,
-2.153086, 0.3654712, -0.8799465, 0, 0, 0, 1, 1,
-2.111417, -1.875184, -1.206938, 1, 1, 1, 1, 1,
-2.107061, 0.9561219, -1.99351, 1, 1, 1, 1, 1,
-2.029357, 0.3439929, -2.434884, 1, 1, 1, 1, 1,
-2.025044, 1.597747, 0.5196133, 1, 1, 1, 1, 1,
-2.022359, 0.1079341, 0.3268078, 1, 1, 1, 1, 1,
-2.006115, -0.001451973, -2.258613, 1, 1, 1, 1, 1,
-1.967837, 1.188619, -2.2688, 1, 1, 1, 1, 1,
-1.958111, -0.3658252, -0.5788097, 1, 1, 1, 1, 1,
-1.920677, -2.059775, -1.679632, 1, 1, 1, 1, 1,
-1.914031, -1.013377, -1.503871, 1, 1, 1, 1, 1,
-1.913417, 1.700842, -0.300499, 1, 1, 1, 1, 1,
-1.901015, 1.480808, -0.3824333, 1, 1, 1, 1, 1,
-1.880674, -1.113845, -1.613074, 1, 1, 1, 1, 1,
-1.839201, -0.1243776, -2.722, 1, 1, 1, 1, 1,
-1.836152, -0.5537127, -2.712915, 1, 1, 1, 1, 1,
-1.813544, -2.094099, -3.039266, 0, 0, 1, 1, 1,
-1.796057, -0.8964629, -0.6692976, 1, 0, 0, 1, 1,
-1.790091, 1.126627, 0.03724474, 1, 0, 0, 1, 1,
-1.78884, -1.100406, -2.32515, 1, 0, 0, 1, 1,
-1.77554, 0.4317861, -2.328397, 1, 0, 0, 1, 1,
-1.774769, -0.2984082, -1.376306, 1, 0, 0, 1, 1,
-1.771212, 1.471941, -1.279448, 0, 0, 0, 1, 1,
-1.75645, 1.81372, -0.4931936, 0, 0, 0, 1, 1,
-1.75231, -0.8394151, -2.198073, 0, 0, 0, 1, 1,
-1.751884, -0.7505335, -0.6998848, 0, 0, 0, 1, 1,
-1.746369, -1.686762, -1.984782, 0, 0, 0, 1, 1,
-1.71141, 1.172953, -0.252986, 0, 0, 0, 1, 1,
-1.703472, -0.1326621, 0.4328165, 0, 0, 0, 1, 1,
-1.699436, -1.547202, -0.9210411, 1, 1, 1, 1, 1,
-1.68387, 0.9362404, -0.8810105, 1, 1, 1, 1, 1,
-1.678459, -0.628132, -4.188797, 1, 1, 1, 1, 1,
-1.645555, 0.9816061, -2.254169, 1, 1, 1, 1, 1,
-1.639588, -0.5006799, -0.8851302, 1, 1, 1, 1, 1,
-1.62571, -0.951426, -3.033143, 1, 1, 1, 1, 1,
-1.620298, 0.9652793, -2.242753, 1, 1, 1, 1, 1,
-1.615737, -0.0481351, -0.2832689, 1, 1, 1, 1, 1,
-1.589986, 0.1949171, -1.566663, 1, 1, 1, 1, 1,
-1.589429, -0.303411, -1.617431, 1, 1, 1, 1, 1,
-1.581569, -1.548357, -1.011488, 1, 1, 1, 1, 1,
-1.575467, 0.5398723, -2.510246, 1, 1, 1, 1, 1,
-1.562165, -1.25053, -2.521452, 1, 1, 1, 1, 1,
-1.544731, -0.5587193, -3.427354, 1, 1, 1, 1, 1,
-1.541744, 0.8415071, -1.747125, 1, 1, 1, 1, 1,
-1.510467, 1.522206, -2.010313, 0, 0, 1, 1, 1,
-1.502845, -1.572312, -1.350481, 1, 0, 0, 1, 1,
-1.502755, 0.8592905, -1.428046, 1, 0, 0, 1, 1,
-1.489355, -0.3148581, -1.942475, 1, 0, 0, 1, 1,
-1.488405, 0.7868977, 0.5634746, 1, 0, 0, 1, 1,
-1.472221, 1.018465, -1.3459, 1, 0, 0, 1, 1,
-1.47067, 0.854917, -1.020082, 0, 0, 0, 1, 1,
-1.456311, -0.5144802, -2.880277, 0, 0, 0, 1, 1,
-1.453663, 1.38413, -1.422105, 0, 0, 0, 1, 1,
-1.452739, 0.7480331, 0.1387746, 0, 0, 0, 1, 1,
-1.451664, -1.306519, -2.063132, 0, 0, 0, 1, 1,
-1.447884, -0.6597504, -2.884886, 0, 0, 0, 1, 1,
-1.436899, -0.05808358, -0.7769031, 0, 0, 0, 1, 1,
-1.43191, -0.6423469, -2.174512, 1, 1, 1, 1, 1,
-1.421298, -0.7196873, -1.747164, 1, 1, 1, 1, 1,
-1.414569, 1.514399, -2.793285, 1, 1, 1, 1, 1,
-1.405993, 0.5762201, -0.9120821, 1, 1, 1, 1, 1,
-1.403142, 1.468211, -0.7070946, 1, 1, 1, 1, 1,
-1.402395, 1.930229, -0.2218152, 1, 1, 1, 1, 1,
-1.362556, 0.3467236, -2.01482, 1, 1, 1, 1, 1,
-1.359368, 0.5277487, -1.830276, 1, 1, 1, 1, 1,
-1.356472, -0.7293738, -2.040339, 1, 1, 1, 1, 1,
-1.356355, -0.4647421, -1.235914, 1, 1, 1, 1, 1,
-1.34298, -1.476376, -1.959642, 1, 1, 1, 1, 1,
-1.329955, 0.5238431, -1.049738, 1, 1, 1, 1, 1,
-1.325617, -1.085562, -2.456547, 1, 1, 1, 1, 1,
-1.32275, -0.02432538, -0.3817145, 1, 1, 1, 1, 1,
-1.316909, 0.9766811, -1.021142, 1, 1, 1, 1, 1,
-1.307338, 0.01943464, -1.122415, 0, 0, 1, 1, 1,
-1.30594, -0.8181298, 0.2211381, 1, 0, 0, 1, 1,
-1.292602, 2.134659, -1.764677, 1, 0, 0, 1, 1,
-1.280893, 1.158821, 0.2493519, 1, 0, 0, 1, 1,
-1.273598, -1.180858, -2.958925, 1, 0, 0, 1, 1,
-1.273421, 1.500085, 0.1286863, 1, 0, 0, 1, 1,
-1.269555, -1.999614, -0.8456988, 0, 0, 0, 1, 1,
-1.267386, -1.16746, -1.533826, 0, 0, 0, 1, 1,
-1.265745, -0.9249941, -2.938968, 0, 0, 0, 1, 1,
-1.265501, 0.9877862, -1.339052, 0, 0, 0, 1, 1,
-1.264313, -0.6303335, -0.6086579, 0, 0, 0, 1, 1,
-1.258101, -1.627335, -3.364883, 0, 0, 0, 1, 1,
-1.252895, -1.819536, -1.19145, 0, 0, 0, 1, 1,
-1.240263, -1.273089, -1.370597, 1, 1, 1, 1, 1,
-1.238816, 0.2082544, 0.4929924, 1, 1, 1, 1, 1,
-1.232048, -0.5862679, -2.510428, 1, 1, 1, 1, 1,
-1.22459, -2.670665, -2.779705, 1, 1, 1, 1, 1,
-1.222923, -0.3932156, -2.316157, 1, 1, 1, 1, 1,
-1.213561, 2.32713, -0.8201233, 1, 1, 1, 1, 1,
-1.21248, 0.1348605, -1.406636, 1, 1, 1, 1, 1,
-1.206717, -0.03591492, -2.014342, 1, 1, 1, 1, 1,
-1.2038, -1.053983, -1.61649, 1, 1, 1, 1, 1,
-1.196502, 0.547012, -0.647485, 1, 1, 1, 1, 1,
-1.177706, -0.3775668, -2.151917, 1, 1, 1, 1, 1,
-1.170168, -0.4252057, -3.155842, 1, 1, 1, 1, 1,
-1.163808, -0.1735386, -3.052357, 1, 1, 1, 1, 1,
-1.160715, 0.685935, -1.748001, 1, 1, 1, 1, 1,
-1.160013, -1.005123, -1.444843, 1, 1, 1, 1, 1,
-1.14718, -1.558674, -2.667269, 0, 0, 1, 1, 1,
-1.145963, 0.3030972, -0.4226703, 1, 0, 0, 1, 1,
-1.133037, -0.5285268, -1.467607, 1, 0, 0, 1, 1,
-1.114807, 0.5937982, -1.446535, 1, 0, 0, 1, 1,
-1.112731, -1.006528, -2.599291, 1, 0, 0, 1, 1,
-1.111765, 0.9797845, -0.9425693, 1, 0, 0, 1, 1,
-1.094628, 0.1125704, -2.708277, 0, 0, 0, 1, 1,
-1.091207, -0.1901926, -1.26167, 0, 0, 0, 1, 1,
-1.088265, -0.3540477, -2.753019, 0, 0, 0, 1, 1,
-1.083662, 1.582167, -0.05099658, 0, 0, 0, 1, 1,
-1.082253, -0.01334808, -0.3817664, 0, 0, 0, 1, 1,
-1.071332, -0.179831, -2.207688, 0, 0, 0, 1, 1,
-1.068176, 1.433449, -1.563461, 0, 0, 0, 1, 1,
-1.058818, -0.1407153, -3.35452, 1, 1, 1, 1, 1,
-1.057212, -0.2886619, -2.630392, 1, 1, 1, 1, 1,
-1.054765, -1.840832, -1.288944, 1, 1, 1, 1, 1,
-1.049546, -0.09273188, -0.948216, 1, 1, 1, 1, 1,
-1.041051, -1.12026, -3.361924, 1, 1, 1, 1, 1,
-1.040856, -0.07764182, -2.439482, 1, 1, 1, 1, 1,
-1.038619, 0.5701187, -2.171184, 1, 1, 1, 1, 1,
-1.036348, 2.100832, 1.44529, 1, 1, 1, 1, 1,
-1.033462, -1.029366, -1.851475, 1, 1, 1, 1, 1,
-1.018275, -1.194859, -2.942371, 1, 1, 1, 1, 1,
-1.017063, -1.426268, -4.897405, 1, 1, 1, 1, 1,
-1.016763, -0.143888, -2.778501, 1, 1, 1, 1, 1,
-1.016289, 0.08109894, -2.244483, 1, 1, 1, 1, 1,
-1.013981, 0.969427, -1.024105, 1, 1, 1, 1, 1,
-1.00583, -1.715544, -4.068158, 1, 1, 1, 1, 1,
-1.005663, -2.066868, -4.036896, 0, 0, 1, 1, 1,
-1.005479, -0.8852693, -4.298397, 1, 0, 0, 1, 1,
-0.9964378, -2.670101, -3.398391, 1, 0, 0, 1, 1,
-0.9893265, 1.184705, -2.488973, 1, 0, 0, 1, 1,
-0.9826264, -1.004078, -3.114192, 1, 0, 0, 1, 1,
-0.9731368, 0.6419115, -2.793761, 1, 0, 0, 1, 1,
-0.9725739, -1.230769, -3.159803, 0, 0, 0, 1, 1,
-0.9703208, -1.470627, -2.137362, 0, 0, 0, 1, 1,
-0.9667044, -0.3454953, -1.77241, 0, 0, 0, 1, 1,
-0.962508, 1.428229, 0.478451, 0, 0, 0, 1, 1,
-0.9557629, -1.441336, -3.340341, 0, 0, 0, 1, 1,
-0.9444707, 0.7933129, -0.1379134, 0, 0, 0, 1, 1,
-0.941995, -0.3310325, -2.48855, 0, 0, 0, 1, 1,
-0.9378214, -1.423813, -3.805602, 1, 1, 1, 1, 1,
-0.9311339, -0.5640858, -3.559996, 1, 1, 1, 1, 1,
-0.9306691, -0.2545258, 0.2973706, 1, 1, 1, 1, 1,
-0.9224761, -0.8264011, -2.271237, 1, 1, 1, 1, 1,
-0.9176703, 1.545351, -0.766981, 1, 1, 1, 1, 1,
-0.9138004, -0.6991844, -2.015414, 1, 1, 1, 1, 1,
-0.9090342, -1.63283, -2.69691, 1, 1, 1, 1, 1,
-0.905046, -0.2673198, -1.525709, 1, 1, 1, 1, 1,
-0.9039066, 0.1115285, -2.033658, 1, 1, 1, 1, 1,
-0.9002836, -0.6317093, -2.759856, 1, 1, 1, 1, 1,
-0.9002523, -0.7670805, -1.30092, 1, 1, 1, 1, 1,
-0.8944815, 0.6740687, -2.275384, 1, 1, 1, 1, 1,
-0.8884447, 0.6909969, -1.568871, 1, 1, 1, 1, 1,
-0.8878661, -1.349704, -1.913785, 1, 1, 1, 1, 1,
-0.8849789, -0.5854044, -2.578399, 1, 1, 1, 1, 1,
-0.8829512, -0.373596, -1.648996, 0, 0, 1, 1, 1,
-0.8825179, -0.2552077, -3.778424, 1, 0, 0, 1, 1,
-0.8809931, -0.3920784, -3.092668, 1, 0, 0, 1, 1,
-0.8807068, 0.2218809, -1.404814, 1, 0, 0, 1, 1,
-0.8772413, -1.169692, -2.081603, 1, 0, 0, 1, 1,
-0.8753911, 1.104631, 0.06957944, 1, 0, 0, 1, 1,
-0.874191, 2.366269, -1.755356, 0, 0, 0, 1, 1,
-0.8728297, 0.677054, -1.683778, 0, 0, 0, 1, 1,
-0.871368, 1.332676, -1.693336, 0, 0, 0, 1, 1,
-0.8695782, 0.3403796, -0.916778, 0, 0, 0, 1, 1,
-0.8586224, -1.476538, -2.05295, 0, 0, 0, 1, 1,
-0.8398362, 0.4674361, -1.286925, 0, 0, 0, 1, 1,
-0.8363465, 0.433307, -3.79768, 0, 0, 0, 1, 1,
-0.8362492, 0.9295252, 0.436017, 1, 1, 1, 1, 1,
-0.8353264, -2.21017, -2.73254, 1, 1, 1, 1, 1,
-0.8287027, -0.2498174, 1.055476, 1, 1, 1, 1, 1,
-0.8251805, -0.3782962, -2.646897, 1, 1, 1, 1, 1,
-0.8210034, -1.262297, -2.378734, 1, 1, 1, 1, 1,
-0.8198146, 1.049541, 0.05044275, 1, 1, 1, 1, 1,
-0.8184534, -0.4301215, -1.858353, 1, 1, 1, 1, 1,
-0.8143747, -0.03136422, -1.389528, 1, 1, 1, 1, 1,
-0.8128086, 0.3213231, -0.7366946, 1, 1, 1, 1, 1,
-0.80385, 1.985811, -0.3985649, 1, 1, 1, 1, 1,
-0.7975808, 1.478153, 0.1258549, 1, 1, 1, 1, 1,
-0.7947467, 0.9533303, -0.7677581, 1, 1, 1, 1, 1,
-0.7943345, -0.424031, -2.60325, 1, 1, 1, 1, 1,
-0.7931679, -0.6785495, -3.863631, 1, 1, 1, 1, 1,
-0.7912025, 0.1052481, -2.465851, 1, 1, 1, 1, 1,
-0.784138, -1.223776, -2.755697, 0, 0, 1, 1, 1,
-0.78333, -0.1614385, -0.9285194, 1, 0, 0, 1, 1,
-0.7809884, 0.86082, 0.4212471, 1, 0, 0, 1, 1,
-0.772282, -1.189985, -3.419229, 1, 0, 0, 1, 1,
-0.768889, 0.3948445, -2.7954, 1, 0, 0, 1, 1,
-0.7677024, -1.443557, -2.541407, 1, 0, 0, 1, 1,
-0.7663448, 0.2026471, -2.877984, 0, 0, 0, 1, 1,
-0.765907, 1.247311, -1.69935, 0, 0, 0, 1, 1,
-0.7524653, 0.8897365, -2.278161, 0, 0, 0, 1, 1,
-0.7463446, -0.2165334, -2.831097, 0, 0, 0, 1, 1,
-0.738861, 0.7131087, -2.215124, 0, 0, 0, 1, 1,
-0.7361788, -0.4477219, -1.869849, 0, 0, 0, 1, 1,
-0.7341751, -0.2661856, 0.9901579, 0, 0, 0, 1, 1,
-0.7319877, -0.6382411, -1.941314, 1, 1, 1, 1, 1,
-0.7306, 0.9678018, 0.5609044, 1, 1, 1, 1, 1,
-0.7297801, -1.941532, -2.127134, 1, 1, 1, 1, 1,
-0.7254846, 0.0966424, -1.635451, 1, 1, 1, 1, 1,
-0.7253582, -0.2441569, -1.535087, 1, 1, 1, 1, 1,
-0.7118664, -0.7851878, -1.324847, 1, 1, 1, 1, 1,
-0.7094871, 0.3576426, -1.388514, 1, 1, 1, 1, 1,
-0.7091781, 1.622555, 1.61153, 1, 1, 1, 1, 1,
-0.7066874, -0.4478303, -0.7679225, 1, 1, 1, 1, 1,
-0.7066233, 0.8915133, 1.018157, 1, 1, 1, 1, 1,
-0.7061402, 0.2413012, 1.258529, 1, 1, 1, 1, 1,
-0.7031491, 0.4095138, -0.2876319, 1, 1, 1, 1, 1,
-0.7028257, -0.1598385, -2.31244, 1, 1, 1, 1, 1,
-0.7025159, 0.1633538, -1.900516, 1, 1, 1, 1, 1,
-0.7007198, 2.232512, 0.3159318, 1, 1, 1, 1, 1,
-0.6983517, -1.743394, -4.075374, 0, 0, 1, 1, 1,
-0.6894056, 1.766246, -0.6078198, 1, 0, 0, 1, 1,
-0.6849102, -1.079427, -0.8308302, 1, 0, 0, 1, 1,
-0.6803065, 0.1717848, -1.900212, 1, 0, 0, 1, 1,
-0.6756332, -0.05406221, -0.9613818, 1, 0, 0, 1, 1,
-0.673692, 1.437603, 0.6877217, 1, 0, 0, 1, 1,
-0.6717101, -1.252974, -3.180419, 0, 0, 0, 1, 1,
-0.6686437, -1.091891, -3.346109, 0, 0, 0, 1, 1,
-0.6685681, -0.491215, -2.184709, 0, 0, 0, 1, 1,
-0.6674982, -1.267762, -3.064589, 0, 0, 0, 1, 1,
-0.6657366, -0.1592379, -2.795558, 0, 0, 0, 1, 1,
-0.6563995, -0.3068903, -2.430613, 0, 0, 0, 1, 1,
-0.6536844, 1.158092, 0.5040202, 0, 0, 0, 1, 1,
-0.6416929, 1.790489, 0.7456011, 1, 1, 1, 1, 1,
-0.6379809, -0.00435246, -2.2954, 1, 1, 1, 1, 1,
-0.63771, -2.014197, -1.667891, 1, 1, 1, 1, 1,
-0.6351867, 0.8973838, -1.132807, 1, 1, 1, 1, 1,
-0.6342744, 0.5518672, -0.6152554, 1, 1, 1, 1, 1,
-0.6267223, 2.486926, 0.6547939, 1, 1, 1, 1, 1,
-0.6229531, -0.9272988, -2.959598, 1, 1, 1, 1, 1,
-0.6191232, 0.2381919, -1.096531, 1, 1, 1, 1, 1,
-0.6121357, -1.002522, -4.326527, 1, 1, 1, 1, 1,
-0.6117561, -0.8556696, -0.984917, 1, 1, 1, 1, 1,
-0.6086534, 1.181848, 0.03186692, 1, 1, 1, 1, 1,
-0.6059296, -0.01425538, -2.414322, 1, 1, 1, 1, 1,
-0.6020207, -0.8190994, -1.13806, 1, 1, 1, 1, 1,
-0.5964366, 0.9402952, -1.678545, 1, 1, 1, 1, 1,
-0.5963776, -0.03071336, -3.15001, 1, 1, 1, 1, 1,
-0.5941734, -1.03592, -3.108498, 0, 0, 1, 1, 1,
-0.592175, -0.2905878, -2.312828, 1, 0, 0, 1, 1,
-0.5918605, -1.239042, -1.251108, 1, 0, 0, 1, 1,
-0.5903727, -1.242704, -1.489892, 1, 0, 0, 1, 1,
-0.5890113, -0.5841454, -3.101938, 1, 0, 0, 1, 1,
-0.5880073, 0.3858017, -1.773954, 1, 0, 0, 1, 1,
-0.581368, -0.2579269, -3.108583, 0, 0, 0, 1, 1,
-0.57928, -1.246266, -2.714371, 0, 0, 0, 1, 1,
-0.5790344, 1.876536, -0.08363216, 0, 0, 0, 1, 1,
-0.5785874, -0.576251, -2.971288, 0, 0, 0, 1, 1,
-0.5721667, 1.115559, -0.379279, 0, 0, 0, 1, 1,
-0.5685892, -0.4139334, -1.119726, 0, 0, 0, 1, 1,
-0.5610576, -0.008938674, -0.7691275, 0, 0, 0, 1, 1,
-0.5594765, 0.1057262, -2.151515, 1, 1, 1, 1, 1,
-0.5583428, -0.07612093, -2.599285, 1, 1, 1, 1, 1,
-0.5560291, -0.7164069, -1.435531, 1, 1, 1, 1, 1,
-0.5544792, 1.565872, 1.533669, 1, 1, 1, 1, 1,
-0.5515645, 0.3397981, -0.161601, 1, 1, 1, 1, 1,
-0.5485481, -0.7464949, -2.093329, 1, 1, 1, 1, 1,
-0.5391579, 1.633288, -0.8970011, 1, 1, 1, 1, 1,
-0.5378119, -0.1470487, -1.422537, 1, 1, 1, 1, 1,
-0.5377164, -0.1889351, -1.436514, 1, 1, 1, 1, 1,
-0.5368668, -0.1110875, -2.202932, 1, 1, 1, 1, 1,
-0.5279209, 0.649269, -0.4975873, 1, 1, 1, 1, 1,
-0.5216782, -0.01605288, -0.7242129, 1, 1, 1, 1, 1,
-0.5213106, -1.819439, -3.058112, 1, 1, 1, 1, 1,
-0.5157222, 1.302101, -1.60418, 1, 1, 1, 1, 1,
-0.5114842, -0.3448252, -3.832814, 1, 1, 1, 1, 1,
-0.5088178, 0.1683577, -0.9773106, 0, 0, 1, 1, 1,
-0.5046988, -1.303461, -2.223276, 1, 0, 0, 1, 1,
-0.503974, 0.1361649, 0.4618527, 1, 0, 0, 1, 1,
-0.5011501, 1.039137, 2.154782, 1, 0, 0, 1, 1,
-0.5008008, 0.3322061, -2.430628, 1, 0, 0, 1, 1,
-0.4991561, -0.2491864, -1.53507, 1, 0, 0, 1, 1,
-0.4879034, -0.07622825, -1.330861, 0, 0, 0, 1, 1,
-0.4869761, -0.4197308, -2.674912, 0, 0, 0, 1, 1,
-0.485259, -1.384341, -3.221067, 0, 0, 0, 1, 1,
-0.4780979, -2.406453, -5.189271, 0, 0, 0, 1, 1,
-0.476119, 2.245605, -0.2525505, 0, 0, 0, 1, 1,
-0.4638458, -0.218233, -1.641573, 0, 0, 0, 1, 1,
-0.4600663, 0.2075986, 0.8596449, 0, 0, 0, 1, 1,
-0.4569055, -0.4165422, -1.827185, 1, 1, 1, 1, 1,
-0.455743, -0.7164804, -2.831788, 1, 1, 1, 1, 1,
-0.4536518, -1.160018, -3.749942, 1, 1, 1, 1, 1,
-0.4489201, -0.05523311, -0.7020746, 1, 1, 1, 1, 1,
-0.4421025, 0.6416469, -0.5971908, 1, 1, 1, 1, 1,
-0.4393999, 0.1304087, -1.218624, 1, 1, 1, 1, 1,
-0.4381031, 0.6050072, -0.001702741, 1, 1, 1, 1, 1,
-0.4336534, 0.7306277, -1.231569, 1, 1, 1, 1, 1,
-0.4236746, 0.6804555, -1.083948, 1, 1, 1, 1, 1,
-0.4194563, 1.695126, 0.05701852, 1, 1, 1, 1, 1,
-0.4184994, 1.20336, -2.15292, 1, 1, 1, 1, 1,
-0.4143803, -0.1019295, -1.113984, 1, 1, 1, 1, 1,
-0.4138687, -0.8321351, -2.706614, 1, 1, 1, 1, 1,
-0.4120402, 1.34637, -0.5756478, 1, 1, 1, 1, 1,
-0.4092961, 0.4760003, -1.849536, 1, 1, 1, 1, 1,
-0.4045318, 0.07769077, -0.894788, 0, 0, 1, 1, 1,
-0.4012174, -0.536594, -3.196113, 1, 0, 0, 1, 1,
-0.3877985, -0.231209, -1.383453, 1, 0, 0, 1, 1,
-0.3859928, -1.249362, -3.583263, 1, 0, 0, 1, 1,
-0.3809776, -0.4666542, -2.121307, 1, 0, 0, 1, 1,
-0.377994, 0.7169203, -2.051819, 1, 0, 0, 1, 1,
-0.3639012, 0.4703737, -0.2529425, 0, 0, 0, 1, 1,
-0.3607236, -0.1642508, -2.447716, 0, 0, 0, 1, 1,
-0.357282, -0.7912072, -2.949566, 0, 0, 0, 1, 1,
-0.3509469, -1.682281, -2.559012, 0, 0, 0, 1, 1,
-0.3475079, -0.2939376, 0.2109396, 0, 0, 0, 1, 1,
-0.3449549, 0.003836209, -0.8453889, 0, 0, 0, 1, 1,
-0.3434635, 2.953567, -1.750087, 0, 0, 0, 1, 1,
-0.343363, -0.7633578, -2.793434, 1, 1, 1, 1, 1,
-0.3432286, -1.773867, -4.45593, 1, 1, 1, 1, 1,
-0.3430972, -0.9079552, -2.998482, 1, 1, 1, 1, 1,
-0.3425467, 0.6163551, 0.771686, 1, 1, 1, 1, 1,
-0.3384526, -1.488948, -1.596803, 1, 1, 1, 1, 1,
-0.3202288, -0.361315, -1.882917, 1, 1, 1, 1, 1,
-0.3168095, -0.212156, -2.462191, 1, 1, 1, 1, 1,
-0.3147311, 0.866339, -1.696305, 1, 1, 1, 1, 1,
-0.3137851, -0.1725742, -2.928284, 1, 1, 1, 1, 1,
-0.3075278, -0.6165218, -2.930034, 1, 1, 1, 1, 1,
-0.3070061, -0.4804079, -2.945704, 1, 1, 1, 1, 1,
-0.298558, -1.515916, -3.169243, 1, 1, 1, 1, 1,
-0.2975013, -0.36433, -1.80645, 1, 1, 1, 1, 1,
-0.2968271, 0.8266771, 0.5404192, 1, 1, 1, 1, 1,
-0.2966314, 0.1361611, -2.27212, 1, 1, 1, 1, 1,
-0.2924147, -0.4057561, -2.481307, 0, 0, 1, 1, 1,
-0.2895764, 0.2689298, -0.6909134, 1, 0, 0, 1, 1,
-0.2886511, -0.47322, -2.080327, 1, 0, 0, 1, 1,
-0.2870917, 2.697075, 1.014152, 1, 0, 0, 1, 1,
-0.28414, 0.1237896, 0.9732597, 1, 0, 0, 1, 1,
-0.2804939, 1.01687, -0.04225902, 1, 0, 0, 1, 1,
-0.2795279, -0.5381922, -3.250512, 0, 0, 0, 1, 1,
-0.2757821, 0.5748162, -1.612425, 0, 0, 0, 1, 1,
-0.2742854, -0.0109877, -1.457533, 0, 0, 0, 1, 1,
-0.2738042, -0.3525583, -2.841718, 0, 0, 0, 1, 1,
-0.2733232, 0.9259644, 0.6098236, 0, 0, 0, 1, 1,
-0.2718408, -0.2258589, -3.426188, 0, 0, 0, 1, 1,
-0.26908, 0.2128108, -1.517842, 0, 0, 0, 1, 1,
-0.2660568, 0.7679598, -0.06669864, 1, 1, 1, 1, 1,
-0.2653986, -1.511039, -3.487481, 1, 1, 1, 1, 1,
-0.2648069, 0.04380265, -1.444609, 1, 1, 1, 1, 1,
-0.2637451, 0.1213489, -0.8084151, 1, 1, 1, 1, 1,
-0.2637106, -0.4861151, -1.744326, 1, 1, 1, 1, 1,
-0.2633516, -0.256007, -1.783261, 1, 1, 1, 1, 1,
-0.2610899, 1.888363, 1.054174, 1, 1, 1, 1, 1,
-0.2597704, -0.4294006, -2.484912, 1, 1, 1, 1, 1,
-0.2576912, -1.955336, -4.332203, 1, 1, 1, 1, 1,
-0.2571647, 0.9396951, -1.067133, 1, 1, 1, 1, 1,
-0.2569306, -1.988775, -1.923539, 1, 1, 1, 1, 1,
-0.2556754, 1.756122, 0.1552898, 1, 1, 1, 1, 1,
-0.2545792, 1.284231, -0.9524379, 1, 1, 1, 1, 1,
-0.2535047, -0.7647938, -3.882134, 1, 1, 1, 1, 1,
-0.2472534, -0.2450443, -2.664102, 1, 1, 1, 1, 1,
-0.2460805, -0.5707846, -3.00984, 0, 0, 1, 1, 1,
-0.2423571, 0.2160136, -0.8350651, 1, 0, 0, 1, 1,
-0.242052, 0.08675167, -2.590811, 1, 0, 0, 1, 1,
-0.241666, 0.05011745, -1.447553, 1, 0, 0, 1, 1,
-0.2402061, -0.07535087, -1.22299, 1, 0, 0, 1, 1,
-0.238182, 0.1530938, 1.051303, 1, 0, 0, 1, 1,
-0.2378095, -0.7369053, -2.700736, 0, 0, 0, 1, 1,
-0.2369953, -0.8143051, -1.302835, 0, 0, 0, 1, 1,
-0.2351881, -0.02670366, -1.245576, 0, 0, 0, 1, 1,
-0.2344204, 0.4822287, -0.4764496, 0, 0, 0, 1, 1,
-0.2342569, 0.8115456, -0.7680214, 0, 0, 0, 1, 1,
-0.2291646, 0.1935403, -0.3371894, 0, 0, 0, 1, 1,
-0.2267527, 0.4998707, -1.706423, 0, 0, 0, 1, 1,
-0.2241942, -0.3734457, -4.081432, 1, 1, 1, 1, 1,
-0.2205887, 2.8372, 1.158801, 1, 1, 1, 1, 1,
-0.2202396, -0.9534774, -3.60958, 1, 1, 1, 1, 1,
-0.2177854, -0.2482358, -3.530864, 1, 1, 1, 1, 1,
-0.2169904, -0.1581861, -1.126196, 1, 1, 1, 1, 1,
-0.2167228, 2.033252, -0.6342812, 1, 1, 1, 1, 1,
-0.212928, -0.4504095, -4.452674, 1, 1, 1, 1, 1,
-0.2070336, 0.1484813, -1.410195, 1, 1, 1, 1, 1,
-0.2017169, 1.101114, -1.084639, 1, 1, 1, 1, 1,
-0.1990731, -0.4964133, -3.015257, 1, 1, 1, 1, 1,
-0.1990468, -0.5750337, -5.071648, 1, 1, 1, 1, 1,
-0.1981236, 0.7761387, -1.243541, 1, 1, 1, 1, 1,
-0.196809, 1.199476, -0.2161908, 1, 1, 1, 1, 1,
-0.1961988, 0.07548059, 0.2729158, 1, 1, 1, 1, 1,
-0.1937603, 1.525642, -0.103096, 1, 1, 1, 1, 1,
-0.1873332, -0.2246667, -3.08902, 0, 0, 1, 1, 1,
-0.1861744, 0.8870809, 0.9336786, 1, 0, 0, 1, 1,
-0.1858957, 0.7060344, 0.2061984, 1, 0, 0, 1, 1,
-0.1847322, -0.8094891, -1.386369, 1, 0, 0, 1, 1,
-0.1818691, 1.639361, -1.047352, 1, 0, 0, 1, 1,
-0.1801136, 2.634038, 0.95428, 1, 0, 0, 1, 1,
-0.1796049, 0.4973661, -1.279317, 0, 0, 0, 1, 1,
-0.1782619, 1.101942, 0.08889537, 0, 0, 0, 1, 1,
-0.1769755, 0.6353115, 1.058383, 0, 0, 0, 1, 1,
-0.174597, 0.5092676, -1.184921, 0, 0, 0, 1, 1,
-0.171942, 0.6643466, -0.6235508, 0, 0, 0, 1, 1,
-0.1713477, -0.04307025, -0.6267126, 0, 0, 0, 1, 1,
-0.1709136, 0.3447207, -2.154927, 0, 0, 0, 1, 1,
-0.1700262, -1.697227, -3.048535, 1, 1, 1, 1, 1,
-0.169445, -0.04965508, -1.364822, 1, 1, 1, 1, 1,
-0.1640603, 2.045212, -0.09700557, 1, 1, 1, 1, 1,
-0.1581873, 0.75631, -0.4424221, 1, 1, 1, 1, 1,
-0.1579955, -0.03893428, -2.374856, 1, 1, 1, 1, 1,
-0.1503918, 1.608429, -0.2580099, 1, 1, 1, 1, 1,
-0.1497809, -0.6058469, -2.322755, 1, 1, 1, 1, 1,
-0.1482345, -0.6054407, -3.968954, 1, 1, 1, 1, 1,
-0.1452506, -0.6681374, -3.398307, 1, 1, 1, 1, 1,
-0.1428564, -0.2988901, -1.910412, 1, 1, 1, 1, 1,
-0.1421951, -0.3410142, -1.575618, 1, 1, 1, 1, 1,
-0.1414792, 0.4483575, -0.4167112, 1, 1, 1, 1, 1,
-0.1365889, 0.8570624, -0.1192928, 1, 1, 1, 1, 1,
-0.1331143, -1.121745, -3.959241, 1, 1, 1, 1, 1,
-0.1305595, -0.3289286, -2.296519, 1, 1, 1, 1, 1,
-0.1283465, -1.256734, -2.597948, 0, 0, 1, 1, 1,
-0.1281848, -0.4179146, -4.441694, 1, 0, 0, 1, 1,
-0.1232247, 0.51971, 0.8409067, 1, 0, 0, 1, 1,
-0.1208053, 0.5630779, -0.6195847, 1, 0, 0, 1, 1,
-0.1186448, 0.7711532, -1.536116, 1, 0, 0, 1, 1,
-0.1165911, -1.352773, -2.253187, 1, 0, 0, 1, 1,
-0.1154299, -2.602053, -3.485676, 0, 0, 0, 1, 1,
-0.111855, -1.255802, -1.725479, 0, 0, 0, 1, 1,
-0.1097026, 0.1361779, 0.4033796, 0, 0, 0, 1, 1,
-0.1049673, 0.6002212, 0.02047788, 0, 0, 0, 1, 1,
-0.104278, -1.402336, -1.484099, 0, 0, 0, 1, 1,
-0.1014833, -0.9851018, -5.202273, 0, 0, 0, 1, 1,
-0.1006169, -0.03341351, -1.879019, 0, 0, 0, 1, 1,
-0.09788812, 0.66304, -0.6773247, 1, 1, 1, 1, 1,
-0.09320208, -2.324601, -4.605698, 1, 1, 1, 1, 1,
-0.09228361, 0.532816, -0.483456, 1, 1, 1, 1, 1,
-0.09031409, 0.6999239, -1.247247, 1, 1, 1, 1, 1,
-0.08917522, 0.3173927, -0.1543608, 1, 1, 1, 1, 1,
-0.08893912, 1.468141, 0.2762841, 1, 1, 1, 1, 1,
-0.08869511, 0.7097279, 0.9317573, 1, 1, 1, 1, 1,
-0.08701511, -0.8259506, -3.710144, 1, 1, 1, 1, 1,
-0.08423489, 0.1391757, -1.050427, 1, 1, 1, 1, 1,
-0.07892987, 0.08851526, -2.307548, 1, 1, 1, 1, 1,
-0.07352384, -2.755773, -3.084234, 1, 1, 1, 1, 1,
-0.07067112, -0.334305, -3.095767, 1, 1, 1, 1, 1,
-0.06600918, -0.5731608, -2.511137, 1, 1, 1, 1, 1,
-0.06488275, -0.6775678, -4.081647, 1, 1, 1, 1, 1,
-0.06368434, -0.8819191, -3.776452, 1, 1, 1, 1, 1,
-0.06226945, 0.4690109, 0.08771713, 0, 0, 1, 1, 1,
-0.06206325, 0.02599729, -0.4000148, 1, 0, 0, 1, 1,
-0.05843462, 0.0985621, 0.2375812, 1, 0, 0, 1, 1,
-0.05600188, -0.7147228, -2.099883, 1, 0, 0, 1, 1,
-0.05497204, 1.967989, -0.5991763, 1, 0, 0, 1, 1,
-0.05486032, 1.764538, -0.5169122, 1, 0, 0, 1, 1,
-0.05376887, -0.8559234, -2.683863, 0, 0, 0, 1, 1,
-0.05256873, -0.1410403, -2.708124, 0, 0, 0, 1, 1,
-0.05111558, 0.5114477, 0.537128, 0, 0, 0, 1, 1,
-0.04454261, -0.4258764, -3.631026, 0, 0, 0, 1, 1,
-0.0431527, 0.1050847, -1.204173, 0, 0, 0, 1, 1,
-0.04276637, 0.8467423, 0.1930434, 0, 0, 0, 1, 1,
-0.042202, -0.2566875, -1.913599, 0, 0, 0, 1, 1,
-0.04162802, 0.4057332, -0.1028902, 1, 1, 1, 1, 1,
-0.03807151, -2.348051, -2.888636, 1, 1, 1, 1, 1,
-0.03671486, 0.8788127, -1.904545, 1, 1, 1, 1, 1,
-0.03627524, 0.4556199, -0.1403223, 1, 1, 1, 1, 1,
-0.03502819, -1.151361, -1.222746, 1, 1, 1, 1, 1,
-0.03250289, 1.277654, 0.2007614, 1, 1, 1, 1, 1,
-0.0295224, 0.4148245, -0.757846, 1, 1, 1, 1, 1,
-0.0283842, 0.6833697, -0.6927311, 1, 1, 1, 1, 1,
-0.0232328, -0.4418367, -3.520065, 1, 1, 1, 1, 1,
-0.02212335, -0.7210288, -4.006214, 1, 1, 1, 1, 1,
-0.01912503, -1.138507, -1.649871, 1, 1, 1, 1, 1,
-0.01366726, 0.2520568, 1.58553, 1, 1, 1, 1, 1,
-0.01351279, -0.4259646, -2.089363, 1, 1, 1, 1, 1,
-0.01296734, -1.38171, -1.899835, 1, 1, 1, 1, 1,
-0.01123968, 0.08491934, -0.008771124, 1, 1, 1, 1, 1,
-0.01076432, -0.2770935, -4.44577, 0, 0, 1, 1, 1,
-0.01033629, 1.513455, -0.4253731, 1, 0, 0, 1, 1,
-0.009876211, -1.49769, -2.176763, 1, 0, 0, 1, 1,
-0.00904963, -2.578982, -3.237458, 1, 0, 0, 1, 1,
-0.008264194, -0.8541422, -2.174739, 1, 0, 0, 1, 1,
-0.002839618, 0.5312328, 0.0413155, 1, 0, 0, 1, 1,
0.0003988471, -1.671406, 3.319573, 0, 0, 0, 1, 1,
0.007119589, 0.4353808, -0.8453397, 0, 0, 0, 1, 1,
0.009431029, 1.177392, -0.4845364, 0, 0, 0, 1, 1,
0.00968408, 0.2514581, 0.3782323, 0, 0, 0, 1, 1,
0.01002634, 1.105746, -1.191715, 0, 0, 0, 1, 1,
0.01226386, -1.060736, 1.68074, 0, 0, 0, 1, 1,
0.01415054, 0.5224084, 0.4945148, 0, 0, 0, 1, 1,
0.01525798, -0.4596492, 3.332349, 1, 1, 1, 1, 1,
0.01866597, -0.7743813, 2.395562, 1, 1, 1, 1, 1,
0.0223495, -0.4673395, 5.182195, 1, 1, 1, 1, 1,
0.0250806, -1.630069, 1.748533, 1, 1, 1, 1, 1,
0.0258748, 0.2061663, -1.264681, 1, 1, 1, 1, 1,
0.02780124, 0.73116, -0.6063859, 1, 1, 1, 1, 1,
0.028299, -0.2268798, 3.989683, 1, 1, 1, 1, 1,
0.03585992, -0.1354278, 2.536071, 1, 1, 1, 1, 1,
0.03761764, -0.7530753, 3.363642, 1, 1, 1, 1, 1,
0.03852195, 0.2330005, -1.175976, 1, 1, 1, 1, 1,
0.03860556, -0.9075921, 2.775631, 1, 1, 1, 1, 1,
0.0422336, -0.253181, 1.780558, 1, 1, 1, 1, 1,
0.04291529, 0.7104701, -1.118149, 1, 1, 1, 1, 1,
0.04371393, 0.7262558, 0.6881474, 1, 1, 1, 1, 1,
0.0464379, -1.18111, 1.268848, 1, 1, 1, 1, 1,
0.04654317, -1.144986, 4.160538, 0, 0, 1, 1, 1,
0.04740724, 1.143029, -1.173316, 1, 0, 0, 1, 1,
0.04875282, 0.8425347, 0.3716176, 1, 0, 0, 1, 1,
0.05578077, -0.5147175, 2.189482, 1, 0, 0, 1, 1,
0.057217, 0.7594662, -0.9181249, 1, 0, 0, 1, 1,
0.06106422, -1.063512, 2.663406, 1, 0, 0, 1, 1,
0.06172866, -0.2811386, 3.124677, 0, 0, 0, 1, 1,
0.06927354, 0.9209617, 2.154187, 0, 0, 0, 1, 1,
0.06986874, 0.7209122, -0.4878642, 0, 0, 0, 1, 1,
0.07108733, 0.3258077, 0.2289934, 0, 0, 0, 1, 1,
0.07108992, 0.3402825, -0.9576492, 0, 0, 0, 1, 1,
0.07366372, 0.1375265, 0.8321905, 0, 0, 0, 1, 1,
0.07572309, -0.9476734, 2.513796, 0, 0, 0, 1, 1,
0.07896788, 0.3576769, -0.7355533, 1, 1, 1, 1, 1,
0.08029447, -0.6192948, 2.32752, 1, 1, 1, 1, 1,
0.0805022, 0.6959803, -0.638496, 1, 1, 1, 1, 1,
0.0815346, -1.467755, 4.152912, 1, 1, 1, 1, 1,
0.08592164, -1.415381, 4.127723, 1, 1, 1, 1, 1,
0.0869601, 0.4769154, -0.1294262, 1, 1, 1, 1, 1,
0.09074894, 1.290783, -1.526677, 1, 1, 1, 1, 1,
0.09232653, 0.9501414, 1.604995, 1, 1, 1, 1, 1,
0.09623102, -0.1091293, 1.514988, 1, 1, 1, 1, 1,
0.0982589, -1.15046, 2.767102, 1, 1, 1, 1, 1,
0.09855755, -1.009888, 3.095283, 1, 1, 1, 1, 1,
0.09933294, -1.527704, 2.377983, 1, 1, 1, 1, 1,
0.101418, 1.645957, 0.8922294, 1, 1, 1, 1, 1,
0.1016155, -2.409124, 1.922169, 1, 1, 1, 1, 1,
0.1073846, 0.7541393, 0.2230967, 1, 1, 1, 1, 1,
0.1144449, 0.7757506, -0.0449755, 0, 0, 1, 1, 1,
0.1162769, 1.512316, -0.02598079, 1, 0, 0, 1, 1,
0.1193365, -1.88666, 2.302649, 1, 0, 0, 1, 1,
0.1317684, 1.478569, -0.6058473, 1, 0, 0, 1, 1,
0.1335801, 0.9555305, -0.2253705, 1, 0, 0, 1, 1,
0.1343471, -0.567552, 3.905247, 1, 0, 0, 1, 1,
0.1410171, -0.08414643, 2.093958, 0, 0, 0, 1, 1,
0.1429296, 0.9592274, -0.1637267, 0, 0, 0, 1, 1,
0.1442229, 1.07356, 1.728513, 0, 0, 0, 1, 1,
0.1500866, -2.175325, 5.421, 0, 0, 0, 1, 1,
0.1508666, 1.625808, 0.8834199, 0, 0, 0, 1, 1,
0.1584384, -0.6207185, 2.367473, 0, 0, 0, 1, 1,
0.1586647, 0.2258015, -0.9535338, 0, 0, 0, 1, 1,
0.1600061, -0.9728532, 1.5816, 1, 1, 1, 1, 1,
0.16636, 0.4565192, 0.4404902, 1, 1, 1, 1, 1,
0.1696001, -0.6767355, 3.244816, 1, 1, 1, 1, 1,
0.1742643, -0.3864562, 1.891787, 1, 1, 1, 1, 1,
0.1756557, 1.647095, -0.9035382, 1, 1, 1, 1, 1,
0.1768351, 2.007831, -0.7615752, 1, 1, 1, 1, 1,
0.1783651, -2.445326, 4.545908, 1, 1, 1, 1, 1,
0.1791606, -0.08387522, 1.786993, 1, 1, 1, 1, 1,
0.1812882, 0.1978337, -0.4542632, 1, 1, 1, 1, 1,
0.182745, -0.4970947, 3.79013, 1, 1, 1, 1, 1,
0.1838545, 2.240422, -0.02769647, 1, 1, 1, 1, 1,
0.1924984, -2.467866, 2.230253, 1, 1, 1, 1, 1,
0.1964181, 1.885515, 1.20698, 1, 1, 1, 1, 1,
0.2028051, 0.0379452, 0.2660398, 1, 1, 1, 1, 1,
0.2059515, -1.742784, 3.834676, 1, 1, 1, 1, 1,
0.2077251, 0.1330845, 0.6823331, 0, 0, 1, 1, 1,
0.2077513, 0.745109, 0.8429835, 1, 0, 0, 1, 1,
0.2105363, 0.6769816, -0.072229, 1, 0, 0, 1, 1,
0.2108135, -0.7583961, 1.082949, 1, 0, 0, 1, 1,
0.2183888, -2.067082, 2.875783, 1, 0, 0, 1, 1,
0.2196797, 0.04100912, 2.932042, 1, 0, 0, 1, 1,
0.2247422, -0.723589, 1.477027, 0, 0, 0, 1, 1,
0.2259242, -1.323312, 2.263135, 0, 0, 0, 1, 1,
0.2276002, -0.7010331, 3.677874, 0, 0, 0, 1, 1,
0.2282136, -1.105144, 4.611063, 0, 0, 0, 1, 1,
0.2284326, 0.6362628, -0.05234132, 0, 0, 0, 1, 1,
0.2286387, 1.138493, 0.8631927, 0, 0, 0, 1, 1,
0.2313177, 0.7539416, -0.7052993, 0, 0, 0, 1, 1,
0.234367, -1.232613, 3.778646, 1, 1, 1, 1, 1,
0.2347904, 2.089054, -0.2748471, 1, 1, 1, 1, 1,
0.2361369, -0.03381404, 2.440237, 1, 1, 1, 1, 1,
0.2379957, 0.3927936, 0.921613, 1, 1, 1, 1, 1,
0.2434467, -1.134587, 3.940588, 1, 1, 1, 1, 1,
0.2451373, -2.226751, 1.66138, 1, 1, 1, 1, 1,
0.2456597, 0.5144998, 0.5990719, 1, 1, 1, 1, 1,
0.2522445, 1.742629, 0.09671409, 1, 1, 1, 1, 1,
0.2544617, -0.07765932, 0.4618295, 1, 1, 1, 1, 1,
0.2548565, 0.4658562, 1.753108, 1, 1, 1, 1, 1,
0.2554455, 0.01460983, 1.159291, 1, 1, 1, 1, 1,
0.2561112, 0.2983873, 0.6200058, 1, 1, 1, 1, 1,
0.2574118, 0.5226331, 1.098523, 1, 1, 1, 1, 1,
0.2622623, 1.231433, 2.032094, 1, 1, 1, 1, 1,
0.2629335, -0.1099386, 1.316537, 1, 1, 1, 1, 1,
0.2656959, 0.08686104, -0.703996, 0, 0, 1, 1, 1,
0.2696799, 0.2392889, 0.7007538, 1, 0, 0, 1, 1,
0.2709112, -0.8354726, 3.292579, 1, 0, 0, 1, 1,
0.2720138, 0.238626, 0.5303656, 1, 0, 0, 1, 1,
0.2720277, 0.3147545, 0.9205211, 1, 0, 0, 1, 1,
0.2742561, -0.2038516, 3.29218, 1, 0, 0, 1, 1,
0.2755078, 0.1591937, 2.014852, 0, 0, 0, 1, 1,
0.2755406, -0.07673059, 3.063554, 0, 0, 0, 1, 1,
0.2839909, -0.24863, 2.505528, 0, 0, 0, 1, 1,
0.2842506, -2.05729, 1.741012, 0, 0, 0, 1, 1,
0.2868433, -0.173952, 2.747892, 0, 0, 0, 1, 1,
0.2914545, -1.37444, 3.536594, 0, 0, 0, 1, 1,
0.2984029, -0.5218055, 0.7340006, 0, 0, 0, 1, 1,
0.2993879, -1.330234, 3.079164, 1, 1, 1, 1, 1,
0.3073498, 1.097034, -0.3012105, 1, 1, 1, 1, 1,
0.3076987, 0.2494446, 1.304932, 1, 1, 1, 1, 1,
0.3097976, -0.9048979, 2.501557, 1, 1, 1, 1, 1,
0.3099514, 0.9636155, -0.8127789, 1, 1, 1, 1, 1,
0.3101641, 1.701598, 0.03598025, 1, 1, 1, 1, 1,
0.3104889, 1.152628, 1.025209, 1, 1, 1, 1, 1,
0.311269, -0.5573522, 2.716148, 1, 1, 1, 1, 1,
0.3138728, 1.60064, 0.1979093, 1, 1, 1, 1, 1,
0.3152493, 3.176467, -0.2091861, 1, 1, 1, 1, 1,
0.3178495, -0.4097419, -0.09181406, 1, 1, 1, 1, 1,
0.3185597, 0.05254526, 1.187415, 1, 1, 1, 1, 1,
0.3195265, 1.837813, 2.90398, 1, 1, 1, 1, 1,
0.320534, 0.6955519, 0.6203174, 1, 1, 1, 1, 1,
0.3209667, -0.6467716, 4.140403, 1, 1, 1, 1, 1,
0.332912, -0.7738535, 3.106502, 0, 0, 1, 1, 1,
0.3401688, -1.27955, 1.8414, 1, 0, 0, 1, 1,
0.3410783, -1.119954, 2.020073, 1, 0, 0, 1, 1,
0.3424429, -0.7256734, 2.303763, 1, 0, 0, 1, 1,
0.3441971, 0.8897565, 1.744998, 1, 0, 0, 1, 1,
0.3551022, 0.482662, -1.485992, 1, 0, 0, 1, 1,
0.3558394, 1.185784, -0.3075678, 0, 0, 0, 1, 1,
0.3574815, 0.04137497, 1.378318, 0, 0, 0, 1, 1,
0.3590723, 1.912361, 1.001569, 0, 0, 0, 1, 1,
0.3606687, 0.6701121, -0.01875938, 0, 0, 0, 1, 1,
0.3652728, 2.478883, -2.7129, 0, 0, 0, 1, 1,
0.3685786, 0.6284224, -2.040192, 0, 0, 0, 1, 1,
0.3709709, -0.9111447, 1.21516, 0, 0, 0, 1, 1,
0.3726627, 0.07109726, 0.3876805, 1, 1, 1, 1, 1,
0.3737359, -0.2854586, 2.569918, 1, 1, 1, 1, 1,
0.3773653, -0.6011911, 2.953795, 1, 1, 1, 1, 1,
0.379428, -0.5301483, 1.408205, 1, 1, 1, 1, 1,
0.3832526, 1.046299, 0.919045, 1, 1, 1, 1, 1,
0.3849992, -1.419037, 3.890392, 1, 1, 1, 1, 1,
0.3854075, 0.8212864, 1.475769, 1, 1, 1, 1, 1,
0.3865168, 0.7641485, 2.42706, 1, 1, 1, 1, 1,
0.3877107, 0.677025, 0.4700015, 1, 1, 1, 1, 1,
0.3929667, 0.5379394, 1.596507, 1, 1, 1, 1, 1,
0.3932596, 1.468264, -1.252097, 1, 1, 1, 1, 1,
0.3949864, -1.758548, 4.792042, 1, 1, 1, 1, 1,
0.3973987, 0.330983, 0.5266019, 1, 1, 1, 1, 1,
0.3984295, -0.1329927, 2.61845, 1, 1, 1, 1, 1,
0.3988468, -0.3660343, 0.3990642, 1, 1, 1, 1, 1,
0.4031114, -1.033405, 2.366017, 0, 0, 1, 1, 1,
0.4031324, 0.8138765, 0.7558641, 1, 0, 0, 1, 1,
0.4035385, -0.01732602, 1.663132, 1, 0, 0, 1, 1,
0.4117188, -0.3086218, 2.081071, 1, 0, 0, 1, 1,
0.416064, -1.077737, 3.020529, 1, 0, 0, 1, 1,
0.4170687, 0.2512515, 0.3671, 1, 0, 0, 1, 1,
0.4175507, -1.066659, 2.745431, 0, 0, 0, 1, 1,
0.4188274, -0.3245915, 2.419473, 0, 0, 0, 1, 1,
0.4216373, -0.9698094, 0.964488, 0, 0, 0, 1, 1,
0.431205, 0.4652965, 0.06086452, 0, 0, 0, 1, 1,
0.4334693, 1.462163, 0.7590247, 0, 0, 0, 1, 1,
0.4534914, -1.211354, 3.588532, 0, 0, 0, 1, 1,
0.453577, -1.458762, 0.9547718, 0, 0, 0, 1, 1,
0.456265, 0.8870339, 0.6481478, 1, 1, 1, 1, 1,
0.4572915, 2.365216, 0.5041649, 1, 1, 1, 1, 1,
0.4599617, -0.2268319, 2.057738, 1, 1, 1, 1, 1,
0.4674503, 1.41153, -1.31108, 1, 1, 1, 1, 1,
0.4683973, -0.9521298, 2.394238, 1, 1, 1, 1, 1,
0.4697099, -0.1810074, 2.578031, 1, 1, 1, 1, 1,
0.4721121, -0.7221624, 2.686946, 1, 1, 1, 1, 1,
0.4736233, -0.0072757, 3.606218, 1, 1, 1, 1, 1,
0.484498, 1.034714, 0.4373221, 1, 1, 1, 1, 1,
0.4889801, -1.104535, 1.872902, 1, 1, 1, 1, 1,
0.4920145, -0.3322184, 0.586169, 1, 1, 1, 1, 1,
0.4922694, -0.9752017, 4.201718, 1, 1, 1, 1, 1,
0.4942822, -1.217909, 4.220567, 1, 1, 1, 1, 1,
0.4966932, -0.6320738, 2.340548, 1, 1, 1, 1, 1,
0.497649, 1.385333, -0.01872233, 1, 1, 1, 1, 1,
0.4987151, 0.6972374, 0.8379334, 0, 0, 1, 1, 1,
0.5001549, -1.852756, 2.611156, 1, 0, 0, 1, 1,
0.5007843, 0.1449936, 4.499302, 1, 0, 0, 1, 1,
0.5141145, -0.8399823, 1.867353, 1, 0, 0, 1, 1,
0.5157698, -0.280193, 2.203254, 1, 0, 0, 1, 1,
0.5206326, 1.820933, -1.481946, 1, 0, 0, 1, 1,
0.5209785, 0.3258033, 2.623513, 0, 0, 0, 1, 1,
0.523217, 3.135432, 0.3142917, 0, 0, 0, 1, 1,
0.5242232, -0.09634493, 0.9294305, 0, 0, 0, 1, 1,
0.524918, -0.615262, 3.147937, 0, 0, 0, 1, 1,
0.5263152, 0.632257, -0.3463823, 0, 0, 0, 1, 1,
0.5326816, 0.3917789, 2.271807, 0, 0, 0, 1, 1,
0.5366887, 0.3449852, 0.3634294, 0, 0, 0, 1, 1,
0.5369933, -1.329601, 2.530343, 1, 1, 1, 1, 1,
0.539957, 0.2320463, 0.7255332, 1, 1, 1, 1, 1,
0.5411249, 1.459011, 0.06416576, 1, 1, 1, 1, 1,
0.5425103, -0.002612934, 1.370475, 1, 1, 1, 1, 1,
0.5452673, -0.6061964, 2.310589, 1, 1, 1, 1, 1,
0.5478272, 0.4936507, 1.104737, 1, 1, 1, 1, 1,
0.5483178, -1.402884, 2.534375, 1, 1, 1, 1, 1,
0.5495398, -0.002490114, 1.9114, 1, 1, 1, 1, 1,
0.5504897, 0.132109, 0.4557689, 1, 1, 1, 1, 1,
0.5534598, 0.5623873, 1.202945, 1, 1, 1, 1, 1,
0.5545053, 1.004643, 0.4042614, 1, 1, 1, 1, 1,
0.5574281, -1.42463, 2.886391, 1, 1, 1, 1, 1,
0.5605072, 0.2237347, 0.5265986, 1, 1, 1, 1, 1,
0.5606747, -1.38244, 3.224181, 1, 1, 1, 1, 1,
0.5611705, -0.3197127, 2.055678, 1, 1, 1, 1, 1,
0.5626318, 1.596243, -1.88855, 0, 0, 1, 1, 1,
0.5637861, 0.1189405, 2.000924, 1, 0, 0, 1, 1,
0.5641353, 0.6598252, 1.114506, 1, 0, 0, 1, 1,
0.5716934, 1.323978, -0.4621821, 1, 0, 0, 1, 1,
0.5735465, 1.478011, -0.9649838, 1, 0, 0, 1, 1,
0.5736089, 0.3400961, 2.988061, 1, 0, 0, 1, 1,
0.5757422, -0.4217604, 3.09765, 0, 0, 0, 1, 1,
0.577247, 1.053117, -0.6118077, 0, 0, 0, 1, 1,
0.5835122, 0.5456886, 0.09988795, 0, 0, 0, 1, 1,
0.5858366, -1.899059, 3.227321, 0, 0, 0, 1, 1,
0.5948045, -0.9695011, 2.929457, 0, 0, 0, 1, 1,
0.5955428, -0.5494086, 0.2990418, 0, 0, 0, 1, 1,
0.5971599, 0.841963, -0.8170887, 0, 0, 0, 1, 1,
0.598478, -0.927857, 2.981239, 1, 1, 1, 1, 1,
0.6047857, -0.08336332, 3.178752, 1, 1, 1, 1, 1,
0.6061836, -1.33885, 0.4362887, 1, 1, 1, 1, 1,
0.6094044, 1.371185, -1.234317, 1, 1, 1, 1, 1,
0.6094978, -1.131766, 3.556448, 1, 1, 1, 1, 1,
0.6129793, -0.7413365, 1.819271, 1, 1, 1, 1, 1,
0.6150156, 0.2098916, 0.43657, 1, 1, 1, 1, 1,
0.6151205, -0.9076902, 1.342439, 1, 1, 1, 1, 1,
0.615257, 0.7589571, -0.6396811, 1, 1, 1, 1, 1,
0.6164666, 1.600587, -0.8705744, 1, 1, 1, 1, 1,
0.620753, 0.7494525, 1.584973, 1, 1, 1, 1, 1,
0.6243667, -1.595803, 1.877986, 1, 1, 1, 1, 1,
0.6264302, 0.5862121, -0.3625607, 1, 1, 1, 1, 1,
0.6329556, -0.5242476, 3.158582, 1, 1, 1, 1, 1,
0.6434098, 0.03764266, 0.410233, 1, 1, 1, 1, 1,
0.647449, 0.3197798, 1.026486, 0, 0, 1, 1, 1,
0.6481113, 0.4925798, 0.05055658, 1, 0, 0, 1, 1,
0.6521655, -0.506732, 2.298972, 1, 0, 0, 1, 1,
0.6534342, -0.6776707, 3.734073, 1, 0, 0, 1, 1,
0.6608024, 0.4320545, 1.361317, 1, 0, 0, 1, 1,
0.6676933, 0.5307362, 0.7842609, 1, 0, 0, 1, 1,
0.6691131, -0.77327, 3.09747, 0, 0, 0, 1, 1,
0.6697155, 0.004639107, 1.901233, 0, 0, 0, 1, 1,
0.6711725, -0.01731499, 1.587529, 0, 0, 0, 1, 1,
0.6719064, 1.50613, -1.405158, 0, 0, 0, 1, 1,
0.6775845, -0.6846541, 1.628064, 0, 0, 0, 1, 1,
0.6824203, 0.7813162, 0.1578317, 0, 0, 0, 1, 1,
0.6880912, 0.9798656, 0.7468448, 0, 0, 0, 1, 1,
0.6882355, 1.102476, -2.199654, 1, 1, 1, 1, 1,
0.6913503, -0.6269037, 2.795979, 1, 1, 1, 1, 1,
0.7022178, -1.365076, 2.52862, 1, 1, 1, 1, 1,
0.7069688, -0.5775057, 1.896213, 1, 1, 1, 1, 1,
0.7168097, 0.08163345, 1.721081, 1, 1, 1, 1, 1,
0.7210958, -1.734298, 4.461801, 1, 1, 1, 1, 1,
0.7253395, 0.05556576, 1.319287, 1, 1, 1, 1, 1,
0.7255545, -1.420416, 2.218045, 1, 1, 1, 1, 1,
0.7308837, 0.1074651, 1.716044, 1, 1, 1, 1, 1,
0.7315681, 1.48783, 2.207204, 1, 1, 1, 1, 1,
0.7340676, -0.7011958, 2.683982, 1, 1, 1, 1, 1,
0.735868, 1.305885, -0.8890544, 1, 1, 1, 1, 1,
0.7472089, 0.2844831, 1.254856, 1, 1, 1, 1, 1,
0.7476261, -1.602629, 2.624539, 1, 1, 1, 1, 1,
0.7484402, 1.040995, 0.5669367, 1, 1, 1, 1, 1,
0.7595875, -0.6838613, 2.65541, 0, 0, 1, 1, 1,
0.7601714, -0.3108813, 1.477594, 1, 0, 0, 1, 1,
0.765471, 0.8024876, 0.4598576, 1, 0, 0, 1, 1,
0.7670088, 1.447294, 0.8813816, 1, 0, 0, 1, 1,
0.7734398, -0.2994061, 2.232049, 1, 0, 0, 1, 1,
0.773725, -0.03039956, 0.6893467, 1, 0, 0, 1, 1,
0.776044, -0.9575388, 2.536695, 0, 0, 0, 1, 1,
0.7779148, -1.612646, 1.38436, 0, 0, 0, 1, 1,
0.7793732, 0.6406626, 0.07659679, 0, 0, 0, 1, 1,
0.7833773, -2.259371, 4.422359, 0, 0, 0, 1, 1,
0.7851719, -1.488782, 2.380163, 0, 0, 0, 1, 1,
0.7880666, -0.2954579, 2.697738, 0, 0, 0, 1, 1,
0.7894294, -1.039061, 2.293491, 0, 0, 0, 1, 1,
0.7941433, 0.9996807, 0.02224613, 1, 1, 1, 1, 1,
0.7958562, 0.5048057, 1.018714, 1, 1, 1, 1, 1,
0.7969408, -1.603343, 1.566264, 1, 1, 1, 1, 1,
0.7980101, 0.1550398, 0.4358681, 1, 1, 1, 1, 1,
0.7989919, -0.02795816, 0.1990077, 1, 1, 1, 1, 1,
0.8042382, -0.2407564, 1.475166, 1, 1, 1, 1, 1,
0.8055514, 1.83641, 0.3559047, 1, 1, 1, 1, 1,
0.8063432, 0.2239314, 2.439186, 1, 1, 1, 1, 1,
0.8101621, -0.2743356, 1.526393, 1, 1, 1, 1, 1,
0.8111105, 0.6239436, 0.5141543, 1, 1, 1, 1, 1,
0.8139702, -0.4906027, 0.5645711, 1, 1, 1, 1, 1,
0.8230616, -0.2903027, 0.3954257, 1, 1, 1, 1, 1,
0.823324, 1.89445, 0.5937269, 1, 1, 1, 1, 1,
0.8331457, 0.5400259, 1.016876, 1, 1, 1, 1, 1,
0.8354787, 0.9259894, 1.459767, 1, 1, 1, 1, 1,
0.8356693, 1.010166, 0.4414367, 0, 0, 1, 1, 1,
0.8372185, -0.1643586, 2.85515, 1, 0, 0, 1, 1,
0.8375254, 0.5367993, 1.320658, 1, 0, 0, 1, 1,
0.8391142, -0.2048194, 2.198054, 1, 0, 0, 1, 1,
0.8399353, -0.9691989, 1.319271, 1, 0, 0, 1, 1,
0.8403441, -0.2141119, 2.807748, 1, 0, 0, 1, 1,
0.8404482, 0.2594244, 0.06686373, 0, 0, 0, 1, 1,
0.8459099, 2.07447, 0.5440097, 0, 0, 0, 1, 1,
0.8479906, -0.1315394, 1.32426, 0, 0, 0, 1, 1,
0.8485661, 1.717521, -0.301648, 0, 0, 0, 1, 1,
0.8500932, 0.577767, 0.1002472, 0, 0, 0, 1, 1,
0.8565834, 1.22504, 1.62745, 0, 0, 0, 1, 1,
0.8578432, -0.2373245, 2.332619, 0, 0, 0, 1, 1,
0.8596725, -1.99744, 2.681917, 1, 1, 1, 1, 1,
0.8686197, 0.2393424, 2.182415, 1, 1, 1, 1, 1,
0.8696584, -0.6175597, 2.155942, 1, 1, 1, 1, 1,
0.8839592, -0.5314466, 2.613694, 1, 1, 1, 1, 1,
0.8941655, 2.376463, 2.034983, 1, 1, 1, 1, 1,
0.896202, 0.7535112, 1.187131, 1, 1, 1, 1, 1,
0.9151704, -0.6021654, 2.128715, 1, 1, 1, 1, 1,
0.9154879, -0.5884285, 3.526938, 1, 1, 1, 1, 1,
0.9178219, -1.859764, 4.046419, 1, 1, 1, 1, 1,
0.9191386, -1.123987, 2.474527, 1, 1, 1, 1, 1,
0.9288306, -0.4294496, 2.851063, 1, 1, 1, 1, 1,
0.9335837, -0.4693814, 2.860852, 1, 1, 1, 1, 1,
0.9388242, -1.645441, 2.298213, 1, 1, 1, 1, 1,
0.9512695, 0.3622354, 1.21388, 1, 1, 1, 1, 1,
0.9513993, 0.2915022, 0.4133711, 1, 1, 1, 1, 1,
0.9518111, -0.2752895, 2.346575, 0, 0, 1, 1, 1,
0.9521408, -1.078971, 1.615657, 1, 0, 0, 1, 1,
0.9531246, -1.134852, 2.817588, 1, 0, 0, 1, 1,
0.9601325, 0.4841016, 1.16462, 1, 0, 0, 1, 1,
0.9646201, -0.5363262, 1.460837, 1, 0, 0, 1, 1,
0.9722281, -0.1117392, 0.458958, 1, 0, 0, 1, 1,
0.9781958, 0.9632723, 0.9306071, 0, 0, 0, 1, 1,
0.9857483, -0.501699, 1.417275, 0, 0, 0, 1, 1,
0.9869943, 0.7949525, 0.4225684, 0, 0, 0, 1, 1,
0.9890832, -0.9177951, 3.106299, 0, 0, 0, 1, 1,
0.9891236, 0.9953161, 1.17169, 0, 0, 0, 1, 1,
0.9955211, -0.5961348, 1.41618, 0, 0, 0, 1, 1,
1.003371, -0.2768407, 2.101317, 0, 0, 0, 1, 1,
1.005649, -0.376468, 1.998161, 1, 1, 1, 1, 1,
1.008248, 0.6705002, 1.365582, 1, 1, 1, 1, 1,
1.008309, -0.9235874, 2.022224, 1, 1, 1, 1, 1,
1.009554, 0.8490183, 0.840095, 1, 1, 1, 1, 1,
1.014555, 0.04062859, 2.158896, 1, 1, 1, 1, 1,
1.020268, 0.130907, 2.683584, 1, 1, 1, 1, 1,
1.020868, 1.371703, 0.07340373, 1, 1, 1, 1, 1,
1.025865, 0.0733178, 2.723361, 1, 1, 1, 1, 1,
1.031338, -0.3029668, 3.281135, 1, 1, 1, 1, 1,
1.033913, 1.082962, 0.3734784, 1, 1, 1, 1, 1,
1.03521, -0.6012347, 2.420977, 1, 1, 1, 1, 1,
1.038368, 1.256596, 0.5945821, 1, 1, 1, 1, 1,
1.039854, -1.228473, 3.473607, 1, 1, 1, 1, 1,
1.048297, -0.2375856, 0.9750691, 1, 1, 1, 1, 1,
1.048565, 0.747522, 1.329883, 1, 1, 1, 1, 1,
1.054648, 1.309784, 0.204184, 0, 0, 1, 1, 1,
1.061858, -0.730893, 3.418532, 1, 0, 0, 1, 1,
1.064046, 0.4800438, 2.069485, 1, 0, 0, 1, 1,
1.067828, 1.242373, -0.3477556, 1, 0, 0, 1, 1,
1.070179, -1.099889, 2.09112, 1, 0, 0, 1, 1,
1.088569, 0.1432388, 2.028408, 1, 0, 0, 1, 1,
1.092305, 1.396437, 0.2120233, 0, 0, 0, 1, 1,
1.094424, -0.6827123, 2.142638, 0, 0, 0, 1, 1,
1.102484, 0.6877262, 1.514312, 0, 0, 0, 1, 1,
1.109148, 0.1399317, 0.4376752, 0, 0, 0, 1, 1,
1.111238, 0.5304086, 0.1708216, 0, 0, 0, 1, 1,
1.1143, -0.6898807, 2.466309, 0, 0, 0, 1, 1,
1.122855, -0.146849, 0.6371964, 0, 0, 0, 1, 1,
1.123498, -0.5339904, 3.128923, 1, 1, 1, 1, 1,
1.126593, -0.4068781, 1.66984, 1, 1, 1, 1, 1,
1.126624, -1.687468, 2.182987, 1, 1, 1, 1, 1,
1.131076, -0.5922065, 2.547577, 1, 1, 1, 1, 1,
1.131846, 2.603009, 0.3426299, 1, 1, 1, 1, 1,
1.138551, -1.353611, 1.398417, 1, 1, 1, 1, 1,
1.140172, -0.4408284, 2.232383, 1, 1, 1, 1, 1,
1.147084, -0.1123462, 1.139982, 1, 1, 1, 1, 1,
1.147361, 1.051102, 1.00995, 1, 1, 1, 1, 1,
1.149507, 0.3735414, 0.3713004, 1, 1, 1, 1, 1,
1.159033, 1.914751, 2.017482, 1, 1, 1, 1, 1,
1.164206, -0.5353389, 0.7906741, 1, 1, 1, 1, 1,
1.169592, -1.069434, 2.269887, 1, 1, 1, 1, 1,
1.175476, -0.1082689, 2.330522, 1, 1, 1, 1, 1,
1.175968, -0.8544084, 1.197908, 1, 1, 1, 1, 1,
1.179269, 0.04564695, 2.955166, 0, 0, 1, 1, 1,
1.179548, -0.1187826, 2.736776, 1, 0, 0, 1, 1,
1.186494, 0.6303992, 1.050327, 1, 0, 0, 1, 1,
1.186739, 0.2210626, 1.815115, 1, 0, 0, 1, 1,
1.189267, -1.951267, 2.3746, 1, 0, 0, 1, 1,
1.196461, -1.436771, 3.157151, 1, 0, 0, 1, 1,
1.20505, -0.3786775, 1.803076, 0, 0, 0, 1, 1,
1.209771, 1.150994, 0.6407009, 0, 0, 0, 1, 1,
1.216133, -0.06889528, 0.1677776, 0, 0, 0, 1, 1,
1.218656, 1.64996, 0.6221783, 0, 0, 0, 1, 1,
1.21966, -0.6538411, 1.076901, 0, 0, 0, 1, 1,
1.220668, -0.3115644, 2.921545, 0, 0, 0, 1, 1,
1.223888, -0.8001373, 1.906942, 0, 0, 0, 1, 1,
1.225184, 1.15402, 1.335819, 1, 1, 1, 1, 1,
1.239909, -0.1694888, 0.5461262, 1, 1, 1, 1, 1,
1.240095, 0.8225347, 1.56106, 1, 1, 1, 1, 1,
1.244938, 0.4733043, 1.939589, 1, 1, 1, 1, 1,
1.247492, 0.018418, 1.410342, 1, 1, 1, 1, 1,
1.249336, 0.1490861, 1.637558, 1, 1, 1, 1, 1,
1.259795, -0.767292, 3.686775, 1, 1, 1, 1, 1,
1.262083, -1.297112, 2.218194, 1, 1, 1, 1, 1,
1.263267, 1.039969, 0.8664822, 1, 1, 1, 1, 1,
1.26378, -0.674696, 3.7611, 1, 1, 1, 1, 1,
1.264452, -1.874079, 1.945157, 1, 1, 1, 1, 1,
1.267835, -0.7449076, 2.987305, 1, 1, 1, 1, 1,
1.26793, -0.3721705, 2.298217, 1, 1, 1, 1, 1,
1.271992, 0.5607284, 2.019503, 1, 1, 1, 1, 1,
1.277209, 0.1163053, 3.644442, 1, 1, 1, 1, 1,
1.278639, -0.06799585, -0.248363, 0, 0, 1, 1, 1,
1.283113, 1.606733, 1.741934, 1, 0, 0, 1, 1,
1.28423, -0.1323969, 1.246918, 1, 0, 0, 1, 1,
1.285481, 0.1898843, 1.640644, 1, 0, 0, 1, 1,
1.294868, -0.2118514, 1.093488, 1, 0, 0, 1, 1,
1.29501, -0.1638525, 1.479497, 1, 0, 0, 1, 1,
1.295113, -0.04396046, 1.915428, 0, 0, 0, 1, 1,
1.301705, 0.7972811, 1.20595, 0, 0, 0, 1, 1,
1.302491, -0.4742945, 3.19345, 0, 0, 0, 1, 1,
1.305804, -1.063088, -0.1469407, 0, 0, 0, 1, 1,
1.322688, 0.2818066, 2.506392, 0, 0, 0, 1, 1,
1.322994, -0.4878953, 1.086663, 0, 0, 0, 1, 1,
1.328271, 0.245074, 1.012139, 0, 0, 0, 1, 1,
1.355077, -0.7453954, 4.232133, 1, 1, 1, 1, 1,
1.356147, 0.1296614, 1.929948, 1, 1, 1, 1, 1,
1.362134, 0.07137861, 1.588728, 1, 1, 1, 1, 1,
1.363203, 1.469605, 0.06079205, 1, 1, 1, 1, 1,
1.367574, 0.706246, 0.6510959, 1, 1, 1, 1, 1,
1.370044, -0.57122, 0.5580785, 1, 1, 1, 1, 1,
1.375095, 0.846158, 1.35156, 1, 1, 1, 1, 1,
1.394463, -1.420056, 2.777894, 1, 1, 1, 1, 1,
1.39575, -0.3972365, 1.281171, 1, 1, 1, 1, 1,
1.404742, -0.02553689, 0.03041101, 1, 1, 1, 1, 1,
1.408569, 3.003917, -0.8637629, 1, 1, 1, 1, 1,
1.417464, -0.05841089, 0.9806567, 1, 1, 1, 1, 1,
1.419192, 0.02495631, 1.4987, 1, 1, 1, 1, 1,
1.428651, 0.98374, 1.479955, 1, 1, 1, 1, 1,
1.434719, -0.406689, 0.8611996, 1, 1, 1, 1, 1,
1.44593, 1.061772, 0.8279353, 0, 0, 1, 1, 1,
1.452566, 1.046794, 0.9919116, 1, 0, 0, 1, 1,
1.508035, -0.8987686, 3.269702, 1, 0, 0, 1, 1,
1.518081, 0.4122303, 0.9040425, 1, 0, 0, 1, 1,
1.525467, 1.375881, 1.403878, 1, 0, 0, 1, 1,
1.525859, -0.4164261, 0.3003443, 1, 0, 0, 1, 1,
1.53377, -0.7689521, 2.084949, 0, 0, 0, 1, 1,
1.538275, -0.6415259, 1.325981, 0, 0, 0, 1, 1,
1.54724, -1.578839, 1.868059, 0, 0, 0, 1, 1,
1.549125, -0.4020431, 3.117277, 0, 0, 0, 1, 1,
1.554568, -0.6903446, 1.881081, 0, 0, 0, 1, 1,
1.561155, -0.9538623, 1.213627, 0, 0, 0, 1, 1,
1.571951, -1.342214, 2.756943, 0, 0, 0, 1, 1,
1.574642, -0.8851524, 3.054625, 1, 1, 1, 1, 1,
1.576236, -1.463796, 3.569857, 1, 1, 1, 1, 1,
1.576258, -1.104155, 1.148251, 1, 1, 1, 1, 1,
1.587959, -0.3576714, 1.088822, 1, 1, 1, 1, 1,
1.590473, -2.248062, 2.373515, 1, 1, 1, 1, 1,
1.592397, 1.143996, 0.07370273, 1, 1, 1, 1, 1,
1.598799, 0.109295, 1.474342, 1, 1, 1, 1, 1,
1.606991, -1.048868, 2.95387, 1, 1, 1, 1, 1,
1.614513, -1.221419, 4.061932, 1, 1, 1, 1, 1,
1.618001, 1.414785, -0.4108002, 1, 1, 1, 1, 1,
1.626129, 0.01904553, 2.570419, 1, 1, 1, 1, 1,
1.630225, 0.8827651, 1.658638, 1, 1, 1, 1, 1,
1.6335, -0.3161262, 3.551326, 1, 1, 1, 1, 1,
1.636894, -1.752795, 3.046599, 1, 1, 1, 1, 1,
1.65088, 1.435654, 0.7639869, 1, 1, 1, 1, 1,
1.659619, 0.948364, 2.292614, 0, 0, 1, 1, 1,
1.670056, -0.5755041, 2.014032, 1, 0, 0, 1, 1,
1.672052, -0.04114006, 0.8945699, 1, 0, 0, 1, 1,
1.672457, -0.5967333, -0.2829033, 1, 0, 0, 1, 1,
1.681992, -0.5206605, 2.636933, 1, 0, 0, 1, 1,
1.684374, 0.09946604, 1.554774, 1, 0, 0, 1, 1,
1.709338, -1.643274, 1.353031, 0, 0, 0, 1, 1,
1.715539, 0.8172022, 1.606197, 0, 0, 0, 1, 1,
1.73141, -0.1900304, 3.941694, 0, 0, 0, 1, 1,
1.803159, 0.6032038, 2.884053, 0, 0, 0, 1, 1,
1.82148, 0.4777378, 1.091627, 0, 0, 0, 1, 1,
1.826591, 0.2534803, 0.9014149, 0, 0, 0, 1, 1,
1.853613, 0.984193, 0.6367892, 0, 0, 0, 1, 1,
1.855201, 0.7608128, 1.697648, 1, 1, 1, 1, 1,
1.858479, -1.42941, 2.643555, 1, 1, 1, 1, 1,
1.858545, 0.9281285, 1.453582, 1, 1, 1, 1, 1,
1.868205, -0.2830262, 2.971708, 1, 1, 1, 1, 1,
1.876302, -0.7246745, 3.57702, 1, 1, 1, 1, 1,
1.917993, -0.5601414, 1.092185, 1, 1, 1, 1, 1,
1.929312, 0.8414299, 1.221961, 1, 1, 1, 1, 1,
1.930857, -2.020401, 0.7931831, 1, 1, 1, 1, 1,
1.959394, 1.28223, 0.7627203, 1, 1, 1, 1, 1,
1.965611, 0.4035359, 0.7346467, 1, 1, 1, 1, 1,
1.990825, 0.05529277, 1.39438, 1, 1, 1, 1, 1,
2.005746, 2.218395, 0.140128, 1, 1, 1, 1, 1,
2.025727, -0.9234406, 3.178668, 1, 1, 1, 1, 1,
2.09058, -0.653695, 0.3020721, 1, 1, 1, 1, 1,
2.101976, 0.555472, 2.451696, 1, 1, 1, 1, 1,
2.105925, 0.6219956, 1.742254, 0, 0, 1, 1, 1,
2.135242, 1.919149, 0.5590925, 1, 0, 0, 1, 1,
2.137267, -1.424433, 2.044922, 1, 0, 0, 1, 1,
2.148926, -2.635273, 3.845442, 1, 0, 0, 1, 1,
2.208929, -0.1490535, 0.7085451, 1, 0, 0, 1, 1,
2.25122, 1.339062, 0.6049382, 1, 0, 0, 1, 1,
2.338718, 0.849933, 1.429744, 0, 0, 0, 1, 1,
2.353663, 0.3048337, 4.020913, 0, 0, 0, 1, 1,
2.35884, -0.2244807, 3.106561, 0, 0, 0, 1, 1,
2.363932, 0.5384724, 1.121768, 0, 0, 0, 1, 1,
2.371836, -0.07840347, 0.9190876, 0, 0, 0, 1, 1,
2.372538, -0.5317333, 2.560286, 0, 0, 0, 1, 1,
2.403237, 0.8331549, 1.752089, 0, 0, 0, 1, 1,
2.410108, 1.365049, 0.238766, 1, 1, 1, 1, 1,
2.417469, 0.08087164, 1.736492, 1, 1, 1, 1, 1,
2.472548, -1.858042, 0.9013395, 1, 1, 1, 1, 1,
2.531678, 1.15291, 1.615388, 1, 1, 1, 1, 1,
2.563209, 1.678585, 1.375805, 1, 1, 1, 1, 1,
2.795566, -0.2333116, 1.62068, 1, 1, 1, 1, 1,
3.057676, -1.027934, 0.7979007, 1, 1, 1, 1, 1
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
var radius = 9.293513;
var distance = 32.64307;
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
mvMatrix.translate( -0.08114529, -0.2103472, -0.1093636 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64307);
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
