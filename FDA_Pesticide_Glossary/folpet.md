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
-3.43104, -0.09818113, -1.412026, 1, 0, 0, 1,
-3.324388, -1.266021, -2.563708, 1, 0.007843138, 0, 1,
-2.859338, -1.215014, -2.134578, 1, 0.01176471, 0, 1,
-2.813409, 0.7189912, -0.6414073, 1, 0.01960784, 0, 1,
-2.803633, 1.003919, 0.0723479, 1, 0.02352941, 0, 1,
-2.768224, -0.494253, -1.396714, 1, 0.03137255, 0, 1,
-2.494858, 0.7705504, -2.152665, 1, 0.03529412, 0, 1,
-2.465776, -0.9486872, -0.7947072, 1, 0.04313726, 0, 1,
-2.465114, 0.08319119, -1.60983, 1, 0.04705882, 0, 1,
-2.452003, 0.6734591, -1.52864, 1, 0.05490196, 0, 1,
-2.403284, -0.05249719, -0.555723, 1, 0.05882353, 0, 1,
-2.366802, -1.193528, -2.728041, 1, 0.06666667, 0, 1,
-2.336043, 0.8964208, -0.588663, 1, 0.07058824, 0, 1,
-2.322633, 1.009069, -2.458909, 1, 0.07843138, 0, 1,
-2.2293, -0.3537891, -2.700389, 1, 0.08235294, 0, 1,
-2.203467, -0.9764602, -1.771765, 1, 0.09019608, 0, 1,
-2.160463, 0.1015827, -0.4723832, 1, 0.09411765, 0, 1,
-2.118857, -0.689274, -1.251464, 1, 0.1019608, 0, 1,
-2.094391, -0.4858729, -0.5924768, 1, 0.1098039, 0, 1,
-2.091671, 1.437086, -1.605756, 1, 0.1137255, 0, 1,
-2.087518, 0.8237861, -2.039565, 1, 0.1215686, 0, 1,
-2.057496, 0.5879467, -0.8233643, 1, 0.1254902, 0, 1,
-2.056817, 0.3215478, -2.451501, 1, 0.1333333, 0, 1,
-2.035475, 0.5857677, -0.4994694, 1, 0.1372549, 0, 1,
-1.991295, 0.6311488, -2.056275, 1, 0.145098, 0, 1,
-1.991013, -0.594839, -2.002731, 1, 0.1490196, 0, 1,
-1.990363, -1.233027, -3.844457, 1, 0.1568628, 0, 1,
-1.989995, -0.4005854, -1.542863, 1, 0.1607843, 0, 1,
-1.973563, 0.7078583, -2.704804, 1, 0.1686275, 0, 1,
-1.940194, 0.2436267, -1.151228, 1, 0.172549, 0, 1,
-1.936277, -1.738688, -3.834941, 1, 0.1803922, 0, 1,
-1.923697, 0.9273992, -1.852302, 1, 0.1843137, 0, 1,
-1.882083, -1.013992, -1.807317, 1, 0.1921569, 0, 1,
-1.878516, -0.4329527, -0.8176288, 1, 0.1960784, 0, 1,
-1.873876, -0.7999994, -1.399059, 1, 0.2039216, 0, 1,
-1.823492, -1.015303, -0.5076777, 1, 0.2117647, 0, 1,
-1.822307, 0.6585367, -1.980264, 1, 0.2156863, 0, 1,
-1.821757, -1.138368, -3.693096, 1, 0.2235294, 0, 1,
-1.812881, 0.1587676, -0.3113819, 1, 0.227451, 0, 1,
-1.809338, 0.6403284, -1.775625, 1, 0.2352941, 0, 1,
-1.808754, 0.8860899, -0.002917765, 1, 0.2392157, 0, 1,
-1.80122, 1.305156, -2.265561, 1, 0.2470588, 0, 1,
-1.799947, -0.1140116, -0.1974229, 1, 0.2509804, 0, 1,
-1.796427, -0.3851716, -0.3323911, 1, 0.2588235, 0, 1,
-1.791086, 0.8432631, -0.7018981, 1, 0.2627451, 0, 1,
-1.780295, -1.310724, -2.826135, 1, 0.2705882, 0, 1,
-1.776475, -1.717325, -1.120899, 1, 0.2745098, 0, 1,
-1.775934, -0.6212921, -1.338665, 1, 0.282353, 0, 1,
-1.769696, 1.295072, -1.079042, 1, 0.2862745, 0, 1,
-1.759402, 0.6334201, -1.027765, 1, 0.2941177, 0, 1,
-1.75414, 1.712328, -1.385535, 1, 0.3019608, 0, 1,
-1.749475, -1.46062, -1.838344, 1, 0.3058824, 0, 1,
-1.738606, -0.6525811, -0.6984547, 1, 0.3137255, 0, 1,
-1.733075, -0.3720658, 0.3469162, 1, 0.3176471, 0, 1,
-1.718506, -0.5006388, -2.114992, 1, 0.3254902, 0, 1,
-1.708335, 0.5104801, -1.786138, 1, 0.3294118, 0, 1,
-1.703081, 0.6419749, -0.4510392, 1, 0.3372549, 0, 1,
-1.687879, -0.4173741, -2.117504, 1, 0.3411765, 0, 1,
-1.677233, -0.4258829, -1.84081, 1, 0.3490196, 0, 1,
-1.67718, 1.959081, -0.9660998, 1, 0.3529412, 0, 1,
-1.676004, -0.6168236, -1.357973, 1, 0.3607843, 0, 1,
-1.670721, 2.513358, -2.122525, 1, 0.3647059, 0, 1,
-1.666335, -0.699324, -3.405961, 1, 0.372549, 0, 1,
-1.63205, -0.7215351, -0.9031788, 1, 0.3764706, 0, 1,
-1.624536, 1.189755, -2.097458, 1, 0.3843137, 0, 1,
-1.61921, -2.583776, -1.7815, 1, 0.3882353, 0, 1,
-1.614239, -0.7830271, -0.9352819, 1, 0.3960784, 0, 1,
-1.60553, 0.6029209, -0.2957059, 1, 0.4039216, 0, 1,
-1.583076, -0.7740593, -2.465381, 1, 0.4078431, 0, 1,
-1.581183, 1.805754, -0.7035853, 1, 0.4156863, 0, 1,
-1.577722, 0.9410005, -1.187426, 1, 0.4196078, 0, 1,
-1.568025, -0.1224501, -0.8963996, 1, 0.427451, 0, 1,
-1.566928, -0.2689615, -0.6796653, 1, 0.4313726, 0, 1,
-1.563862, 1.305181, 0.6016161, 1, 0.4392157, 0, 1,
-1.548997, 1.31536, -0.06938007, 1, 0.4431373, 0, 1,
-1.547966, 0.08159183, -0.6196674, 1, 0.4509804, 0, 1,
-1.542444, -1.595555, -4.458812, 1, 0.454902, 0, 1,
-1.539978, 0.868607, -0.003407845, 1, 0.4627451, 0, 1,
-1.538157, 0.6527979, -1.227471, 1, 0.4666667, 0, 1,
-1.531715, 0.9511772, -1.550534, 1, 0.4745098, 0, 1,
-1.529144, 0.5501725, -1.28708, 1, 0.4784314, 0, 1,
-1.50927, -1.172174, -1.590015, 1, 0.4862745, 0, 1,
-1.504756, -0.1241306, -3.338135, 1, 0.4901961, 0, 1,
-1.494546, 1.444276, -1.031122, 1, 0.4980392, 0, 1,
-1.458925, -0.5801609, -1.904891, 1, 0.5058824, 0, 1,
-1.453943, -0.9087476, -1.490112, 1, 0.509804, 0, 1,
-1.449089, 0.4535754, -0.4355766, 1, 0.5176471, 0, 1,
-1.43556, 0.6394687, -0.4478709, 1, 0.5215687, 0, 1,
-1.428757, -0.6743683, -2.168223, 1, 0.5294118, 0, 1,
-1.423854, 0.7452802, -1.710596, 1, 0.5333334, 0, 1,
-1.416428, -0.2734948, -0.03093044, 1, 0.5411765, 0, 1,
-1.41121, -0.370887, -1.723138, 1, 0.5450981, 0, 1,
-1.408595, -0.377335, -0.9302206, 1, 0.5529412, 0, 1,
-1.407947, -0.03052122, -3.554199, 1, 0.5568628, 0, 1,
-1.400828, 1.322124, -1.217459, 1, 0.5647059, 0, 1,
-1.393962, 0.7209869, -1.429194, 1, 0.5686275, 0, 1,
-1.393315, -1.395061, -2.639444, 1, 0.5764706, 0, 1,
-1.387589, 0.5674985, -1.545525, 1, 0.5803922, 0, 1,
-1.38578, 0.1525292, -1.255317, 1, 0.5882353, 0, 1,
-1.369686, 0.4394641, -1.232206, 1, 0.5921569, 0, 1,
-1.365678, -1.325624, -1.956381, 1, 0.6, 0, 1,
-1.344168, 0.3442407, -0.05969987, 1, 0.6078432, 0, 1,
-1.343182, -0.5103963, -1.517258, 1, 0.6117647, 0, 1,
-1.34251, -0.7611049, -2.507927, 1, 0.6196079, 0, 1,
-1.342178, -0.4978852, -0.6346814, 1, 0.6235294, 0, 1,
-1.336297, 1.258318, 0.4078315, 1, 0.6313726, 0, 1,
-1.331815, -0.9504647, -3.472144, 1, 0.6352941, 0, 1,
-1.320722, 0.05927533, 0.5627689, 1, 0.6431373, 0, 1,
-1.313407, -2.165819, -3.830534, 1, 0.6470588, 0, 1,
-1.31272, 0.6908182, -2.307191, 1, 0.654902, 0, 1,
-1.312346, -1.319164, -2.078315, 1, 0.6588235, 0, 1,
-1.306043, -0.3862895, 0.3087979, 1, 0.6666667, 0, 1,
-1.298794, -0.7358465, -1.260487, 1, 0.6705883, 0, 1,
-1.294589, 1.793505, -0.08541384, 1, 0.6784314, 0, 1,
-1.290053, 0.4820142, -2.079726, 1, 0.682353, 0, 1,
-1.289517, 0.511999, -0.3749848, 1, 0.6901961, 0, 1,
-1.286578, 1.39661, -0.9238536, 1, 0.6941177, 0, 1,
-1.280114, -0.7284504, -3.320646, 1, 0.7019608, 0, 1,
-1.276123, -1.166744, -0.4710673, 1, 0.7098039, 0, 1,
-1.274126, -1.196099, -3.852268, 1, 0.7137255, 0, 1,
-1.271554, 1.905525, -0.1822718, 1, 0.7215686, 0, 1,
-1.262242, -1.227234, -1.94541, 1, 0.7254902, 0, 1,
-1.261437, -1.07835, -1.808556, 1, 0.7333333, 0, 1,
-1.242877, -1.09887, -2.896927, 1, 0.7372549, 0, 1,
-1.240066, 0.3877485, 0.6596465, 1, 0.7450981, 0, 1,
-1.238642, -0.3360263, -1.492435, 1, 0.7490196, 0, 1,
-1.236238, 0.933709, -0.7418008, 1, 0.7568628, 0, 1,
-1.221988, 0.8476987, -0.4964211, 1, 0.7607843, 0, 1,
-1.221184, 0.2535026, -0.9951743, 1, 0.7686275, 0, 1,
-1.215037, 0.620118, -1.613976, 1, 0.772549, 0, 1,
-1.21205, 2.117501, -2.123474, 1, 0.7803922, 0, 1,
-1.210378, -0.2816006, 0.5112445, 1, 0.7843137, 0, 1,
-1.201438, -0.3279901, -2.25233, 1, 0.7921569, 0, 1,
-1.192734, -1.134878, -2.204612, 1, 0.7960784, 0, 1,
-1.18987, -1.598995, -1.4122, 1, 0.8039216, 0, 1,
-1.185894, 0.5357954, -0.1932907, 1, 0.8117647, 0, 1,
-1.185708, -0.8135412, -2.212174, 1, 0.8156863, 0, 1,
-1.182596, 0.5039613, -2.791813, 1, 0.8235294, 0, 1,
-1.181826, 0.5620702, -1.281195, 1, 0.827451, 0, 1,
-1.170042, -0.006166221, -1.411613, 1, 0.8352941, 0, 1,
-1.154862, -1.002109, -3.051061, 1, 0.8392157, 0, 1,
-1.149096, -1.230606, -2.922688, 1, 0.8470588, 0, 1,
-1.148844, 1.24923, 0.6952338, 1, 0.8509804, 0, 1,
-1.139619, 0.2275025, -1.463206, 1, 0.8588235, 0, 1,
-1.134874, -0.4987504, -1.20441, 1, 0.8627451, 0, 1,
-1.128653, 1.012792, -1.191862, 1, 0.8705882, 0, 1,
-1.125616, 0.9125847, -0.8410411, 1, 0.8745098, 0, 1,
-1.118988, 1.398574, -0.6134591, 1, 0.8823529, 0, 1,
-1.106801, 0.5902548, 1.319804, 1, 0.8862745, 0, 1,
-1.102945, -0.2521367, -2.796793, 1, 0.8941177, 0, 1,
-1.099471, -0.366002, -0.4114415, 1, 0.8980392, 0, 1,
-1.096562, 1.058592, -1.584988, 1, 0.9058824, 0, 1,
-1.091587, 0.09437849, -0.7016765, 1, 0.9137255, 0, 1,
-1.081414, -1.107296, -1.863003, 1, 0.9176471, 0, 1,
-1.076277, 0.02652911, -1.884141, 1, 0.9254902, 0, 1,
-1.075512, -0.8249786, -3.499215, 1, 0.9294118, 0, 1,
-1.075319, -1.486762, -2.538131, 1, 0.9372549, 0, 1,
-1.074801, -0.2845387, -3.005552, 1, 0.9411765, 0, 1,
-1.066013, 1.600084, 0.06259091, 1, 0.9490196, 0, 1,
-1.065296, -1.906311, -3.298609, 1, 0.9529412, 0, 1,
-1.060176, 0.7316018, -2.558869, 1, 0.9607843, 0, 1,
-1.058291, -1.28378, -2.471467, 1, 0.9647059, 0, 1,
-1.058277, -0.5955888, -2.83462, 1, 0.972549, 0, 1,
-1.055236, 1.956411, 0.7636753, 1, 0.9764706, 0, 1,
-1.050252, -0.7276717, -2.735441, 1, 0.9843137, 0, 1,
-1.044677, -0.3415938, -1.565777, 1, 0.9882353, 0, 1,
-1.043149, -0.3956489, -2.405598, 1, 0.9960784, 0, 1,
-1.042272, 0.2269637, -2.91572, 0.9960784, 1, 0, 1,
-1.041522, 0.07612668, -2.462833, 0.9921569, 1, 0, 1,
-1.033442, 0.3917829, -2.090227, 0.9843137, 1, 0, 1,
-1.027733, 1.487597, -0.4430645, 0.9803922, 1, 0, 1,
-1.026957, -0.1830036, -2.079891, 0.972549, 1, 0, 1,
-1.007475, -1.408622, -2.266095, 0.9686275, 1, 0, 1,
-1.007325, 0.1176998, -1.67025, 0.9607843, 1, 0, 1,
-1.004348, 0.0659429, -0.08998842, 0.9568627, 1, 0, 1,
-1.003994, 2.406569, -2.515511, 0.9490196, 1, 0, 1,
-1.003717, 0.4659547, -0.8782733, 0.945098, 1, 0, 1,
-1.003307, -0.1486611, -1.546999, 0.9372549, 1, 0, 1,
-1.001082, 0.1442232, -1.23415, 0.9333333, 1, 0, 1,
-0.9945713, 0.7447903, -0.6765485, 0.9254902, 1, 0, 1,
-0.9873371, -0.2612472, -1.669999, 0.9215686, 1, 0, 1,
-0.9872916, 0.6911366, -3.33392, 0.9137255, 1, 0, 1,
-0.9849458, -0.7510458, -2.939143, 0.9098039, 1, 0, 1,
-0.9837519, 1.99681, 0.4183143, 0.9019608, 1, 0, 1,
-0.9679723, -0.6422126, -2.498765, 0.8941177, 1, 0, 1,
-0.9676079, 1.342449, -1.039415, 0.8901961, 1, 0, 1,
-0.9634329, -1.348603, -2.181594, 0.8823529, 1, 0, 1,
-0.9575443, 0.04406133, -2.208954, 0.8784314, 1, 0, 1,
-0.9460964, -0.4763581, -3.11818, 0.8705882, 1, 0, 1,
-0.941068, -1.208524, -3.660168, 0.8666667, 1, 0, 1,
-0.9405884, 1.300392, -1.497552, 0.8588235, 1, 0, 1,
-0.9401662, -0.8045071, -3.470647, 0.854902, 1, 0, 1,
-0.9383634, 1.758497, -0.6024333, 0.8470588, 1, 0, 1,
-0.9321696, 0.3263434, -1.334426, 0.8431373, 1, 0, 1,
-0.9250628, 0.4709675, -1.441933, 0.8352941, 1, 0, 1,
-0.9246166, -2.411304, -3.870984, 0.8313726, 1, 0, 1,
-0.914622, 0.986773, -1.175937, 0.8235294, 1, 0, 1,
-0.9125051, 0.6143938, 0.44351, 0.8196079, 1, 0, 1,
-0.911552, 1.078499, -0.06195966, 0.8117647, 1, 0, 1,
-0.9060743, -0.7548504, -3.539565, 0.8078431, 1, 0, 1,
-0.9056811, 1.207341, -1.784706, 0.8, 1, 0, 1,
-0.904217, 0.8648171, 0.2490833, 0.7921569, 1, 0, 1,
-0.9036239, 1.252155, -1.146778, 0.7882353, 1, 0, 1,
-0.9023682, 1.277067, 1.054939, 0.7803922, 1, 0, 1,
-0.9016359, 0.9053472, -1.177144, 0.7764706, 1, 0, 1,
-0.9015578, -0.1436189, -0.9642726, 0.7686275, 1, 0, 1,
-0.8974847, -0.5177214, -3.437603, 0.7647059, 1, 0, 1,
-0.8944598, -1.137336, -1.833689, 0.7568628, 1, 0, 1,
-0.8934762, -1.52737, -2.541345, 0.7529412, 1, 0, 1,
-0.8920051, 2.273626, -0.8572447, 0.7450981, 1, 0, 1,
-0.8883021, 0.6288943, -1.753662, 0.7411765, 1, 0, 1,
-0.8873634, 0.3367521, -0.9822503, 0.7333333, 1, 0, 1,
-0.8862718, 0.7851767, -2.19481, 0.7294118, 1, 0, 1,
-0.8711072, 0.03231825, -0.4126157, 0.7215686, 1, 0, 1,
-0.8689128, -0.01205933, -1.817013, 0.7176471, 1, 0, 1,
-0.868378, -0.6166524, -1.756239, 0.7098039, 1, 0, 1,
-0.8658133, -0.08601047, -1.515063, 0.7058824, 1, 0, 1,
-0.8642624, -1.698245, -3.503462, 0.6980392, 1, 0, 1,
-0.8569316, 0.9707018, -1.437094, 0.6901961, 1, 0, 1,
-0.8526478, -0.09497397, -2.024175, 0.6862745, 1, 0, 1,
-0.8512195, 2.287211, -0.5568066, 0.6784314, 1, 0, 1,
-0.8486305, 0.7210855, -0.3788037, 0.6745098, 1, 0, 1,
-0.8468696, 0.2343272, -1.601619, 0.6666667, 1, 0, 1,
-0.8462509, 1.070128, -1.462547, 0.6627451, 1, 0, 1,
-0.8380398, -0.04595853, -1.909391, 0.654902, 1, 0, 1,
-0.8338861, 0.4808739, -0.8123701, 0.6509804, 1, 0, 1,
-0.8257828, 1.048186, -2.031701, 0.6431373, 1, 0, 1,
-0.8227322, 1.044407, 0.3044946, 0.6392157, 1, 0, 1,
-0.8125212, -0.004005352, -1.908368, 0.6313726, 1, 0, 1,
-0.806026, 1.175185, 1.299155, 0.627451, 1, 0, 1,
-0.8041159, -1.162011, -4.338719, 0.6196079, 1, 0, 1,
-0.8015861, -0.7964642, -0.9707236, 0.6156863, 1, 0, 1,
-0.7985187, 1.68199, -0.899084, 0.6078432, 1, 0, 1,
-0.7897319, 1.220719, -2.116299, 0.6039216, 1, 0, 1,
-0.7892855, -1.431409, -2.11083, 0.5960785, 1, 0, 1,
-0.7887766, -0.2250891, -2.145844, 0.5882353, 1, 0, 1,
-0.7876285, 0.222311, -1.400997, 0.5843138, 1, 0, 1,
-0.7852848, -0.8308471, -2.208879, 0.5764706, 1, 0, 1,
-0.7810252, -1.210437, -2.986312, 0.572549, 1, 0, 1,
-0.7758608, -0.9101347, -3.37277, 0.5647059, 1, 0, 1,
-0.7758425, 0.7206305, -2.154281, 0.5607843, 1, 0, 1,
-0.7707853, -0.5058228, -1.482258, 0.5529412, 1, 0, 1,
-0.7666053, -1.615128, -1.484547, 0.5490196, 1, 0, 1,
-0.7609946, -1.10484, -1.920151, 0.5411765, 1, 0, 1,
-0.753701, 0.3548687, -0.2683896, 0.5372549, 1, 0, 1,
-0.7483067, -1.293709, -2.915672, 0.5294118, 1, 0, 1,
-0.7450302, 0.1553657, -0.9634232, 0.5254902, 1, 0, 1,
-0.7411779, -0.8209663, -2.700824, 0.5176471, 1, 0, 1,
-0.7361834, -0.4465011, -3.495536, 0.5137255, 1, 0, 1,
-0.734792, 1.547, 0.6913062, 0.5058824, 1, 0, 1,
-0.7276736, 0.01228703, -1.419058, 0.5019608, 1, 0, 1,
-0.7256801, 1.847011, 0.07756306, 0.4941176, 1, 0, 1,
-0.7192993, -1.447852, -2.064899, 0.4862745, 1, 0, 1,
-0.7135193, -0.1212104, -1.415936, 0.4823529, 1, 0, 1,
-0.7083053, -0.4907307, -1.338451, 0.4745098, 1, 0, 1,
-0.7033179, -1.133919, -3.361947, 0.4705882, 1, 0, 1,
-0.7016973, 1.087668, -0.8617049, 0.4627451, 1, 0, 1,
-0.6928691, 2.159396, -2.201505, 0.4588235, 1, 0, 1,
-0.6919654, 0.1889586, -0.6977432, 0.4509804, 1, 0, 1,
-0.6810756, -0.6644293, -1.637052, 0.4470588, 1, 0, 1,
-0.6786543, -0.7938157, -1.577823, 0.4392157, 1, 0, 1,
-0.6714364, -0.2001526, -2.51334, 0.4352941, 1, 0, 1,
-0.6699108, -1.358653, -2.51182, 0.427451, 1, 0, 1,
-0.6687937, -1.372859, -3.433728, 0.4235294, 1, 0, 1,
-0.6667126, -0.04598157, -2.042655, 0.4156863, 1, 0, 1,
-0.6654353, 0.3782901, -0.5924537, 0.4117647, 1, 0, 1,
-0.6622202, -1.082175, -1.769096, 0.4039216, 1, 0, 1,
-0.6607442, 0.1495116, -1.347146, 0.3960784, 1, 0, 1,
-0.6560022, 0.937622, 0.001254465, 0.3921569, 1, 0, 1,
-0.6529875, 0.1608204, -1.26129, 0.3843137, 1, 0, 1,
-0.6487498, -1.346414, -2.893194, 0.3803922, 1, 0, 1,
-0.6446075, 2.404176, 0.8031297, 0.372549, 1, 0, 1,
-0.6419161, -2.416928, -3.618988, 0.3686275, 1, 0, 1,
-0.63839, -0.78754, -2.490548, 0.3607843, 1, 0, 1,
-0.6381137, -0.4414558, -4.295774, 0.3568628, 1, 0, 1,
-0.6337516, 1.874985, -0.09927275, 0.3490196, 1, 0, 1,
-0.6304586, -0.08887151, -0.9370716, 0.345098, 1, 0, 1,
-0.6288899, 0.5098963, 1.283131, 0.3372549, 1, 0, 1,
-0.6228169, 0.6195997, -0.8316469, 0.3333333, 1, 0, 1,
-0.6170568, 0.2181208, -1.068895, 0.3254902, 1, 0, 1,
-0.6158049, 0.6462126, -0.9223632, 0.3215686, 1, 0, 1,
-0.615123, 0.9217501, -2.121637, 0.3137255, 1, 0, 1,
-0.6112431, -0.0632927, -2.730443, 0.3098039, 1, 0, 1,
-0.6111609, -0.903783, -2.241889, 0.3019608, 1, 0, 1,
-0.6104223, -1.432428, -2.475816, 0.2941177, 1, 0, 1,
-0.6064611, -0.6248568, -0.9856811, 0.2901961, 1, 0, 1,
-0.606418, -0.3301707, -2.793946, 0.282353, 1, 0, 1,
-0.6055335, -0.9932635, -1.654333, 0.2784314, 1, 0, 1,
-0.603291, 0.6508213, -0.2130787, 0.2705882, 1, 0, 1,
-0.6026447, -0.3379383, -1.218562, 0.2666667, 1, 0, 1,
-0.6003938, 1.505866, -2.875934, 0.2588235, 1, 0, 1,
-0.5994052, -1.505473, -3.353844, 0.254902, 1, 0, 1,
-0.5993957, 0.1172151, -2.449519, 0.2470588, 1, 0, 1,
-0.5984543, 1.069196, 0.5290684, 0.2431373, 1, 0, 1,
-0.5948083, 0.5766, -2.092426, 0.2352941, 1, 0, 1,
-0.5906708, -1.744163, -2.259386, 0.2313726, 1, 0, 1,
-0.5880222, -1.758521, -1.959206, 0.2235294, 1, 0, 1,
-0.5867834, -2.568397, -3.94744, 0.2196078, 1, 0, 1,
-0.5867583, 0.8192059, -0.668151, 0.2117647, 1, 0, 1,
-0.5813958, -0.6010538, -1.089656, 0.2078431, 1, 0, 1,
-0.5787323, 1.343786, 0.08576723, 0.2, 1, 0, 1,
-0.5718012, -0.5251626, -4.047388, 0.1921569, 1, 0, 1,
-0.5701763, 1.630264, -0.4494657, 0.1882353, 1, 0, 1,
-0.5699938, -0.6522051, -1.525776, 0.1803922, 1, 0, 1,
-0.5665228, 0.2011916, 0.050566, 0.1764706, 1, 0, 1,
-0.5609524, 1.119138, 0.2047186, 0.1686275, 1, 0, 1,
-0.5562572, 0.3368591, -2.340029, 0.1647059, 1, 0, 1,
-0.5548869, -0.4234959, -4.297458, 0.1568628, 1, 0, 1,
-0.5541215, -1.583903, -1.982067, 0.1529412, 1, 0, 1,
-0.5497925, -0.6294984, -2.254061, 0.145098, 1, 0, 1,
-0.5496203, 0.1027812, -0.4940209, 0.1411765, 1, 0, 1,
-0.5493943, -0.05267667, -0.7839374, 0.1333333, 1, 0, 1,
-0.548148, -1.284393, -3.461818, 0.1294118, 1, 0, 1,
-0.5460242, 0.4653819, -0.09460389, 0.1215686, 1, 0, 1,
-0.5412557, 1.313563, -2.302305, 0.1176471, 1, 0, 1,
-0.5407148, -0.9441964, -2.087083, 0.1098039, 1, 0, 1,
-0.5342948, -1.053614, -2.87748, 0.1058824, 1, 0, 1,
-0.5332513, 0.3311915, -0.9244533, 0.09803922, 1, 0, 1,
-0.525156, 0.876744, -0.439484, 0.09019608, 1, 0, 1,
-0.5249743, 0.2809808, -0.4905302, 0.08627451, 1, 0, 1,
-0.5181176, 2.0017, -0.5128409, 0.07843138, 1, 0, 1,
-0.5116803, 0.9676181, 0.64715, 0.07450981, 1, 0, 1,
-0.5112792, 1.019538, -0.5232246, 0.06666667, 1, 0, 1,
-0.511194, -0.03358553, -1.600228, 0.0627451, 1, 0, 1,
-0.507825, 0.3010434, -0.272032, 0.05490196, 1, 0, 1,
-0.5073307, -1.121983, -2.606657, 0.05098039, 1, 0, 1,
-0.5052555, 1.527539, 0.153766, 0.04313726, 1, 0, 1,
-0.495046, 0.8526538, 0.3729622, 0.03921569, 1, 0, 1,
-0.4948575, -0.7872715, -3.676461, 0.03137255, 1, 0, 1,
-0.4931851, -0.5066851, -1.158687, 0.02745098, 1, 0, 1,
-0.4929564, -0.2016449, -3.398135, 0.01960784, 1, 0, 1,
-0.4921217, -1.794484, -1.329129, 0.01568628, 1, 0, 1,
-0.4858719, 0.727499, -0.1014085, 0.007843138, 1, 0, 1,
-0.4853464, 1.593999, 0.1845552, 0.003921569, 1, 0, 1,
-0.4847489, -0.401038, -1.397568, 0, 1, 0.003921569, 1,
-0.4837842, 0.408095, 0.1650279, 0, 1, 0.01176471, 1,
-0.4823661, -1.039749, -2.825923, 0, 1, 0.01568628, 1,
-0.4806472, -2.193931, -2.67843, 0, 1, 0.02352941, 1,
-0.4795877, 1.828685, -0.09363396, 0, 1, 0.02745098, 1,
-0.4745014, -0.8105884, -0.9084277, 0, 1, 0.03529412, 1,
-0.4712882, -0.4920514, -0.9584215, 0, 1, 0.03921569, 1,
-0.4701561, -0.03286199, -0.2626611, 0, 1, 0.04705882, 1,
-0.4701273, 1.401087, -1.991519, 0, 1, 0.05098039, 1,
-0.4648736, -0.317982, -2.230992, 0, 1, 0.05882353, 1,
-0.4618687, 1.768064, 0.3058525, 0, 1, 0.0627451, 1,
-0.4571597, 0.9814395, -1.747297, 0, 1, 0.07058824, 1,
-0.4562556, -1.401877, -2.177171, 0, 1, 0.07450981, 1,
-0.4549345, -0.4198994, -3.58853, 0, 1, 0.08235294, 1,
-0.4530098, 0.4289, -1.274889, 0, 1, 0.08627451, 1,
-0.4505356, -0.4205346, -2.548653, 0, 1, 0.09411765, 1,
-0.4494142, -0.4817643, -1.941213, 0, 1, 0.1019608, 1,
-0.4483277, -0.253271, -0.7546549, 0, 1, 0.1058824, 1,
-0.4469306, 1.607746, 0.2540639, 0, 1, 0.1137255, 1,
-0.4468511, -0.4614544, -2.101052, 0, 1, 0.1176471, 1,
-0.4462459, 1.554354, 1.996739, 0, 1, 0.1254902, 1,
-0.444775, -0.9219121, -3.469373, 0, 1, 0.1294118, 1,
-0.4335554, -0.5203896, -0.9881251, 0, 1, 0.1372549, 1,
-0.4325655, -2.514805, -3.62975, 0, 1, 0.1411765, 1,
-0.4302948, -0.2630184, -0.485072, 0, 1, 0.1490196, 1,
-0.4247321, -0.3512271, -1.714513, 0, 1, 0.1529412, 1,
-0.4232328, -1.062532, -3.922205, 0, 1, 0.1607843, 1,
-0.4230973, 1.58839, -0.8034618, 0, 1, 0.1647059, 1,
-0.4211363, 0.8784822, -0.9028687, 0, 1, 0.172549, 1,
-0.412376, 0.3580733, -0.197714, 0, 1, 0.1764706, 1,
-0.4106996, -1.416367, -3.766473, 0, 1, 0.1843137, 1,
-0.4083812, 0.9115652, -1.7457, 0, 1, 0.1882353, 1,
-0.4079864, -1.387009, -5.242932, 0, 1, 0.1960784, 1,
-0.4013039, -0.3490529, -1.983464, 0, 1, 0.2039216, 1,
-0.4010292, 0.8619468, -1.009054, 0, 1, 0.2078431, 1,
-0.4007508, 0.3186081, -1.683397, 0, 1, 0.2156863, 1,
-0.3939364, 2.426429, -1.516023, 0, 1, 0.2196078, 1,
-0.3894333, -1.351456, -4.278681, 0, 1, 0.227451, 1,
-0.3880965, -1.480091, -3.214936, 0, 1, 0.2313726, 1,
-0.3869066, -1.210019, -5.393893, 0, 1, 0.2392157, 1,
-0.3858474, 0.404144, -1.295316, 0, 1, 0.2431373, 1,
-0.3834757, -1.144666, -3.403235, 0, 1, 0.2509804, 1,
-0.3828471, 0.9173868, 2.782508, 0, 1, 0.254902, 1,
-0.3813486, -0.6795877, -2.88763, 0, 1, 0.2627451, 1,
-0.3807907, 0.8166543, 0.2571542, 0, 1, 0.2666667, 1,
-0.3747678, -1.734378, -5.487452, 0, 1, 0.2745098, 1,
-0.3744751, 0.4680797, -2.241452, 0, 1, 0.2784314, 1,
-0.3701091, 0.3279041, -0.1551467, 0, 1, 0.2862745, 1,
-0.3689571, -0.7605646, -1.19683, 0, 1, 0.2901961, 1,
-0.3675884, -0.9476651, -2.426764, 0, 1, 0.2980392, 1,
-0.3568033, 0.2382102, -1.60842, 0, 1, 0.3058824, 1,
-0.3563123, 1.782858, -2.74446, 0, 1, 0.3098039, 1,
-0.3496005, 1.813094, -2.122305, 0, 1, 0.3176471, 1,
-0.3447582, 0.3381183, -0.8120208, 0, 1, 0.3215686, 1,
-0.3433836, 0.608739, -0.1529478, 0, 1, 0.3294118, 1,
-0.3433684, -0.1173173, -1.496746, 0, 1, 0.3333333, 1,
-0.3413254, -0.7877077, -4.658766, 0, 1, 0.3411765, 1,
-0.3392262, -1.084155, -3.933221, 0, 1, 0.345098, 1,
-0.3303806, 0.1791073, -1.099665, 0, 1, 0.3529412, 1,
-0.3294987, 0.6148499, -1.632593, 0, 1, 0.3568628, 1,
-0.3289077, 0.7909715, -0.5610822, 0, 1, 0.3647059, 1,
-0.3277788, 0.856157, -0.5287696, 0, 1, 0.3686275, 1,
-0.3268681, -1.111203, -1.070712, 0, 1, 0.3764706, 1,
-0.3222078, 1.657989, -0.7669259, 0, 1, 0.3803922, 1,
-0.3212985, -0.748955, -0.3955625, 0, 1, 0.3882353, 1,
-0.3162737, -0.855901, -2.813122, 0, 1, 0.3921569, 1,
-0.3158576, -1.183257, -4.404408, 0, 1, 0.4, 1,
-0.3096456, -0.1532239, -3.328274, 0, 1, 0.4078431, 1,
-0.3002702, 0.7324711, 0.1059116, 0, 1, 0.4117647, 1,
-0.2972201, 1.169109, 1.841776, 0, 1, 0.4196078, 1,
-0.2959269, 0.2851556, -2.327052, 0, 1, 0.4235294, 1,
-0.2957755, 0.1502912, -2.708229, 0, 1, 0.4313726, 1,
-0.2884086, -0.1520145, -2.358916, 0, 1, 0.4352941, 1,
-0.2880031, -0.7864224, -2.403892, 0, 1, 0.4431373, 1,
-0.2847865, 1.253619, -0.6272424, 0, 1, 0.4470588, 1,
-0.2819074, -0.8620855, -1.714429, 0, 1, 0.454902, 1,
-0.280639, 1.182622, 2.351284, 0, 1, 0.4588235, 1,
-0.2786232, -0.2800936, -1.275764, 0, 1, 0.4666667, 1,
-0.2767656, 1.868183, -0.7636119, 0, 1, 0.4705882, 1,
-0.2766979, 1.167079, -1.654114, 0, 1, 0.4784314, 1,
-0.2763659, 0.3410655, 0.1839949, 0, 1, 0.4823529, 1,
-0.2753508, -0.3737856, -2.221235, 0, 1, 0.4901961, 1,
-0.2753048, 0.388449, -0.4545069, 0, 1, 0.4941176, 1,
-0.2726656, 0.3128033, 0.165219, 0, 1, 0.5019608, 1,
-0.2702849, 0.639805, 0.1541915, 0, 1, 0.509804, 1,
-0.2638817, -0.2672486, -4.159218, 0, 1, 0.5137255, 1,
-0.2634648, 2.480912, 0.1502796, 0, 1, 0.5215687, 1,
-0.2633407, 1.451534, -1.250211, 0, 1, 0.5254902, 1,
-0.2531831, -0.3190526, -2.607346, 0, 1, 0.5333334, 1,
-0.2479395, 1.054071, -0.9523169, 0, 1, 0.5372549, 1,
-0.2461096, 0.8012428, 0.614949, 0, 1, 0.5450981, 1,
-0.2445679, 0.2469427, -0.3733608, 0, 1, 0.5490196, 1,
-0.2416001, 3.077537, 1.00375, 0, 1, 0.5568628, 1,
-0.241445, -0.0772149, -2.035204, 0, 1, 0.5607843, 1,
-0.2400566, 0.9701723, -1.179607, 0, 1, 0.5686275, 1,
-0.2386408, 1.520933, -0.1503636, 0, 1, 0.572549, 1,
-0.2376247, 0.4503051, -0.3054, 0, 1, 0.5803922, 1,
-0.2367653, -2.109253, -2.572704, 0, 1, 0.5843138, 1,
-0.233988, 1.088018, -1.294066, 0, 1, 0.5921569, 1,
-0.2280881, -0.07204, -1.272157, 0, 1, 0.5960785, 1,
-0.2249627, -0.7794151, -2.253189, 0, 1, 0.6039216, 1,
-0.2236257, 1.513892, 0.2796184, 0, 1, 0.6117647, 1,
-0.2212529, 0.03643466, -1.823637, 0, 1, 0.6156863, 1,
-0.2170352, 1.408782, -3.169312, 0, 1, 0.6235294, 1,
-0.2157235, -0.5276193, -3.020518, 0, 1, 0.627451, 1,
-0.2140892, 0.4422215, 1.591184, 0, 1, 0.6352941, 1,
-0.2122766, -1.090761, -3.107571, 0, 1, 0.6392157, 1,
-0.209956, -0.1606104, -4.652148, 0, 1, 0.6470588, 1,
-0.2088134, -0.9008219, -1.605651, 0, 1, 0.6509804, 1,
-0.2066998, 0.914121, -0.9561442, 0, 1, 0.6588235, 1,
-0.206447, -0.3583605, -1.815683, 0, 1, 0.6627451, 1,
-0.2025001, -0.4172856, -2.828603, 0, 1, 0.6705883, 1,
-0.2001788, -1.378158, -1.871783, 0, 1, 0.6745098, 1,
-0.1997988, 0.4999196, 0.1401035, 0, 1, 0.682353, 1,
-0.1996455, 0.4629579, 0.09422325, 0, 1, 0.6862745, 1,
-0.1985585, -0.9251289, -3.971159, 0, 1, 0.6941177, 1,
-0.1968304, 0.7687093, -1.328143, 0, 1, 0.7019608, 1,
-0.1941772, -0.5143985, -1.064425, 0, 1, 0.7058824, 1,
-0.1934598, -1.741079, -2.767901, 0, 1, 0.7137255, 1,
-0.193155, -0.4881092, -1.430799, 0, 1, 0.7176471, 1,
-0.1924303, 3.016679, 2.177228, 0, 1, 0.7254902, 1,
-0.1902072, 1.24849, -0.5209346, 0, 1, 0.7294118, 1,
-0.1893831, 0.6671141, -0.9104176, 0, 1, 0.7372549, 1,
-0.1849618, -1.369595, -2.382677, 0, 1, 0.7411765, 1,
-0.1764721, 0.3333337, -0.6085348, 0, 1, 0.7490196, 1,
-0.1643674, -2.742287, -3.755264, 0, 1, 0.7529412, 1,
-0.1640722, 0.9385206, -0.910863, 0, 1, 0.7607843, 1,
-0.1602329, -0.6383451, -4.151153, 0, 1, 0.7647059, 1,
-0.1525647, 0.3404451, 0.0592976, 0, 1, 0.772549, 1,
-0.1479798, -1.911212, -5.183927, 0, 1, 0.7764706, 1,
-0.1466305, -0.07303585, -3.143322, 0, 1, 0.7843137, 1,
-0.141874, 1.060792, -0.508999, 0, 1, 0.7882353, 1,
-0.1417059, 0.4700744, -0.1603331, 0, 1, 0.7960784, 1,
-0.1413314, -0.07734222, -2.856439, 0, 1, 0.8039216, 1,
-0.1399748, 1.689682, 1.305155, 0, 1, 0.8078431, 1,
-0.1374965, 1.347255, -1.568377, 0, 1, 0.8156863, 1,
-0.1360664, 0.01163068, -0.5790011, 0, 1, 0.8196079, 1,
-0.1351701, 0.3463059, -0.3093964, 0, 1, 0.827451, 1,
-0.1343795, -1.288133, -3.262302, 0, 1, 0.8313726, 1,
-0.1331967, 2.072144, 0.4331906, 0, 1, 0.8392157, 1,
-0.1304038, 0.09599119, -0.376058, 0, 1, 0.8431373, 1,
-0.1258166, -0.3543088, -1.990296, 0, 1, 0.8509804, 1,
-0.1217474, 0.9410729, -1.176265, 0, 1, 0.854902, 1,
-0.1190569, 0.8097612, -0.6202147, 0, 1, 0.8627451, 1,
-0.1184861, -1.631371, -3.637958, 0, 1, 0.8666667, 1,
-0.1156214, -1.410849, -3.563102, 0, 1, 0.8745098, 1,
-0.1155561, -1.321694, -4.61991, 0, 1, 0.8784314, 1,
-0.1135836, 0.821035, -0.4764544, 0, 1, 0.8862745, 1,
-0.1115226, -0.8051656, -3.700404, 0, 1, 0.8901961, 1,
-0.1100308, -1.626876, -4.120542, 0, 1, 0.8980392, 1,
-0.1095798, 0.008635857, -0.5763454, 0, 1, 0.9058824, 1,
-0.1062388, 2.120954, 0.4037389, 0, 1, 0.9098039, 1,
-0.1024927, -0.4237512, -2.199268, 0, 1, 0.9176471, 1,
-0.09995309, 0.09717806, -1.032863, 0, 1, 0.9215686, 1,
-0.09312551, 0.4627986, -0.93589, 0, 1, 0.9294118, 1,
-0.08371881, -0.09243198, 0.4369063, 0, 1, 0.9333333, 1,
-0.07899996, -1.734962, -3.602103, 0, 1, 0.9411765, 1,
-0.07828677, 1.271216, 0.6819841, 0, 1, 0.945098, 1,
-0.07406702, 1.309503, -2.0566, 0, 1, 0.9529412, 1,
-0.07387125, 1.393191, -1.20312, 0, 1, 0.9568627, 1,
-0.07329185, -0.299115, -4.812923, 0, 1, 0.9647059, 1,
-0.0652867, -0.864595, -2.228914, 0, 1, 0.9686275, 1,
-0.06223707, -0.7444234, -3.298425, 0, 1, 0.9764706, 1,
-0.06010078, 0.2094843, 1.082801, 0, 1, 0.9803922, 1,
-0.04441421, 2.031177, 0.5991039, 0, 1, 0.9882353, 1,
-0.04243585, 0.3315226, 1.144428, 0, 1, 0.9921569, 1,
-0.03547424, 0.5397329, -1.107939, 0, 1, 1, 1,
-0.03354326, 1.283699, 1.224374, 0, 0.9921569, 1, 1,
-0.03321546, -0.09309752, -4.934773, 0, 0.9882353, 1, 1,
-0.03053871, 0.8842851, -0.0837412, 0, 0.9803922, 1, 1,
-0.025256, 1.113325, 0.3776653, 0, 0.9764706, 1, 1,
-0.01956682, -0.2166606, -2.448606, 0, 0.9686275, 1, 1,
-0.01858012, 0.1254791, 1.504819, 0, 0.9647059, 1, 1,
-0.01731019, 0.4196104, -2.088791, 0, 0.9568627, 1, 1,
-0.01666812, 0.2690356, -0.4841661, 0, 0.9529412, 1, 1,
-0.01647564, -1.263345, -3.226564, 0, 0.945098, 1, 1,
-0.01643232, 0.5509858, 0.1130548, 0, 0.9411765, 1, 1,
-0.00837148, 0.04754938, 1.503672, 0, 0.9333333, 1, 1,
-0.005805768, 0.4731094, 0.1882741, 0, 0.9294118, 1, 1,
-0.0001275049, 0.8856279, 0.1664145, 0, 0.9215686, 1, 1,
0.001115478, -1.221154, 3.415631, 0, 0.9176471, 1, 1,
0.00140748, -0.003592082, 2.921377, 0, 0.9098039, 1, 1,
0.001468948, -0.3725777, 3.120605, 0, 0.9058824, 1, 1,
0.001521065, -0.3424617, 4.195637, 0, 0.8980392, 1, 1,
0.006824333, -0.6553361, 2.96138, 0, 0.8901961, 1, 1,
0.009530784, 0.7912374, 0.2502592, 0, 0.8862745, 1, 1,
0.009642565, 0.009554854, 0.1935895, 0, 0.8784314, 1, 1,
0.01011734, 0.4167117, -0.2379165, 0, 0.8745098, 1, 1,
0.01546572, -0.5099488, 5.381821, 0, 0.8666667, 1, 1,
0.0172872, -0.2530783, 2.122513, 0, 0.8627451, 1, 1,
0.023536, -1.088769, 2.256826, 0, 0.854902, 1, 1,
0.03713272, 0.06386399, -0.4988539, 0, 0.8509804, 1, 1,
0.03802986, -0.3117115, 4.778622, 0, 0.8431373, 1, 1,
0.03808776, 1.005362, -0.6054765, 0, 0.8392157, 1, 1,
0.0400362, -0.08182649, 3.843524, 0, 0.8313726, 1, 1,
0.04037326, 0.3645387, 1.665199, 0, 0.827451, 1, 1,
0.04101671, -1.820992, 2.712913, 0, 0.8196079, 1, 1,
0.04935822, 1.614905, 1.485821, 0, 0.8156863, 1, 1,
0.05580476, -0.9830731, 3.688447, 0, 0.8078431, 1, 1,
0.06175784, 2.04152, 0.3504414, 0, 0.8039216, 1, 1,
0.064734, -0.549728, 2.586456, 0, 0.7960784, 1, 1,
0.06476448, 1.773913, -3.219525, 0, 0.7882353, 1, 1,
0.06691936, -1.262407, 3.437063, 0, 0.7843137, 1, 1,
0.07414663, 0.8256904, 0.4116018, 0, 0.7764706, 1, 1,
0.07535544, 2.165066, 1.274275, 0, 0.772549, 1, 1,
0.07902086, 0.6427484, 0.8383445, 0, 0.7647059, 1, 1,
0.08025154, -0.5870562, 2.26117, 0, 0.7607843, 1, 1,
0.09034266, 0.08012503, 2.648318, 0, 0.7529412, 1, 1,
0.09175431, 0.7450338, -1.452467, 0, 0.7490196, 1, 1,
0.09332516, 0.26369, 1.806165, 0, 0.7411765, 1, 1,
0.09359492, 1.455614, -2.007723, 0, 0.7372549, 1, 1,
0.09755726, 2.657401, 0.1511005, 0, 0.7294118, 1, 1,
0.1003161, 0.3022103, 0.1655261, 0, 0.7254902, 1, 1,
0.1101103, 0.3463625, 1.083878, 0, 0.7176471, 1, 1,
0.1106783, 0.1377184, 1.151668, 0, 0.7137255, 1, 1,
0.1110903, -1.469706, 4.38341, 0, 0.7058824, 1, 1,
0.1112065, 0.2557179, -0.2896786, 0, 0.6980392, 1, 1,
0.116029, 0.9958191, 0.02508426, 0, 0.6941177, 1, 1,
0.1166877, -2.119683, 5.428539, 0, 0.6862745, 1, 1,
0.1170364, 0.3013451, 2.124157, 0, 0.682353, 1, 1,
0.1223858, -0.9627292, 3.725946, 0, 0.6745098, 1, 1,
0.1227804, 0.3832117, -0.2434775, 0, 0.6705883, 1, 1,
0.1260513, -1.117709, 3.858311, 0, 0.6627451, 1, 1,
0.1274869, 0.6806238, -0.1017771, 0, 0.6588235, 1, 1,
0.1282856, 0.1567318, 0.3351813, 0, 0.6509804, 1, 1,
0.1332436, 0.2392759, -0.5436842, 0, 0.6470588, 1, 1,
0.134652, 1.119027, -0.0728977, 0, 0.6392157, 1, 1,
0.1377264, -0.7958047, 2.842385, 0, 0.6352941, 1, 1,
0.1426418, 1.594866, 0.3865187, 0, 0.627451, 1, 1,
0.1490747, 0.3012944, 0.9931722, 0, 0.6235294, 1, 1,
0.1544746, 0.541505, 0.763787, 0, 0.6156863, 1, 1,
0.1594606, 0.1852751, -0.8151124, 0, 0.6117647, 1, 1,
0.1604315, -0.2399536, 2.430238, 0, 0.6039216, 1, 1,
0.1637029, 0.4527362, -1.027219, 0, 0.5960785, 1, 1,
0.1641144, -2.080809, 4.233059, 0, 0.5921569, 1, 1,
0.1722702, 1.476669, -0.2384498, 0, 0.5843138, 1, 1,
0.1762393, -1.258001, 3.303787, 0, 0.5803922, 1, 1,
0.1805608, -0.06150523, 3.415476, 0, 0.572549, 1, 1,
0.1825346, 0.169012, -1.725215, 0, 0.5686275, 1, 1,
0.1858326, 1.535276, 1.326277, 0, 0.5607843, 1, 1,
0.1884704, -0.8693196, 3.053372, 0, 0.5568628, 1, 1,
0.1908052, -0.3800749, 1.788636, 0, 0.5490196, 1, 1,
0.1914332, 2.490686, -0.3847691, 0, 0.5450981, 1, 1,
0.1923169, 1.13056, -0.2168167, 0, 0.5372549, 1, 1,
0.1933704, 0.9852049, 1.598857, 0, 0.5333334, 1, 1,
0.1937699, 0.2044883, 1.135235, 0, 0.5254902, 1, 1,
0.1978349, 0.5899795, -0.5666319, 0, 0.5215687, 1, 1,
0.1980657, 0.7842032, -0.7275968, 0, 0.5137255, 1, 1,
0.2008059, 1.484244, -1.435578, 0, 0.509804, 1, 1,
0.2045686, -0.6925731, 3.419371, 0, 0.5019608, 1, 1,
0.2063977, -1.571967, 2.860739, 0, 0.4941176, 1, 1,
0.2068119, -1.33639, 4.321963, 0, 0.4901961, 1, 1,
0.2072351, 0.6384206, 0.6159185, 0, 0.4823529, 1, 1,
0.2113499, 0.5186732, -0.6912194, 0, 0.4784314, 1, 1,
0.2118589, -0.6888734, 1.891862, 0, 0.4705882, 1, 1,
0.2214396, -1.152399, 0.8386987, 0, 0.4666667, 1, 1,
0.2219729, -0.553589, 1.882368, 0, 0.4588235, 1, 1,
0.2241397, 1.840397, -1.453693, 0, 0.454902, 1, 1,
0.2281462, -0.8765671, 2.527215, 0, 0.4470588, 1, 1,
0.2307217, 0.4326286, -0.7972897, 0, 0.4431373, 1, 1,
0.230904, 0.8660268, -0.3707224, 0, 0.4352941, 1, 1,
0.2326319, -0.04712613, 1.662351, 0, 0.4313726, 1, 1,
0.2335895, 0.3327056, -0.4695008, 0, 0.4235294, 1, 1,
0.2377655, -0.03284078, 2.166491, 0, 0.4196078, 1, 1,
0.2384351, -1.291102, 2.674901, 0, 0.4117647, 1, 1,
0.2459465, -1.374928, 4.092811, 0, 0.4078431, 1, 1,
0.2474356, -0.4111854, 2.639688, 0, 0.4, 1, 1,
0.2489275, 0.7951064, -0.7960665, 0, 0.3921569, 1, 1,
0.2497679, -1.717682, 4.605433, 0, 0.3882353, 1, 1,
0.2517344, -0.3369555, 0.6913137, 0, 0.3803922, 1, 1,
0.2533344, 0.6158006, 0.8841394, 0, 0.3764706, 1, 1,
0.2535619, 1.632239, -0.2163737, 0, 0.3686275, 1, 1,
0.255474, 0.9125768, 1.338968, 0, 0.3647059, 1, 1,
0.2569363, -0.7631979, 1.597317, 0, 0.3568628, 1, 1,
0.2586372, 0.2127233, 0.8421844, 0, 0.3529412, 1, 1,
0.2603782, -0.9852796, 2.279092, 0, 0.345098, 1, 1,
0.2608593, 0.6089039, -1.831938, 0, 0.3411765, 1, 1,
0.2655486, 0.5055279, 1.886932, 0, 0.3333333, 1, 1,
0.2679765, 0.4675917, -2.114693, 0, 0.3294118, 1, 1,
0.2740342, 0.9672165, -0.6139775, 0, 0.3215686, 1, 1,
0.2760763, 0.2357813, 2.015759, 0, 0.3176471, 1, 1,
0.2769332, -0.55051, 3.611849, 0, 0.3098039, 1, 1,
0.2806701, 0.7945629, -0.4617147, 0, 0.3058824, 1, 1,
0.2813391, -2.111637, 2.750201, 0, 0.2980392, 1, 1,
0.2900935, -0.4462122, 2.195737, 0, 0.2901961, 1, 1,
0.293926, -1.066357, 2.545463, 0, 0.2862745, 1, 1,
0.2949215, 0.07201444, 2.453193, 0, 0.2784314, 1, 1,
0.2957036, -0.5245304, 2.268047, 0, 0.2745098, 1, 1,
0.29935, 0.7192785, -0.2522889, 0, 0.2666667, 1, 1,
0.3016598, -0.536585, 3.405296, 0, 0.2627451, 1, 1,
0.3021005, 1.042604, -0.09162305, 0, 0.254902, 1, 1,
0.3021442, -0.6906374, 3.7869, 0, 0.2509804, 1, 1,
0.3092727, 0.7735467, 0.7126906, 0, 0.2431373, 1, 1,
0.315736, -0.3730179, 2.179444, 0, 0.2392157, 1, 1,
0.3193658, 2.043048, 1.160024, 0, 0.2313726, 1, 1,
0.3222075, 1.481593, -0.1563938, 0, 0.227451, 1, 1,
0.3234911, 0.9860807, -0.8252562, 0, 0.2196078, 1, 1,
0.3258845, 0.8319561, 0.2960762, 0, 0.2156863, 1, 1,
0.3262433, 1.202248, 0.2050875, 0, 0.2078431, 1, 1,
0.328954, -0.7921661, 0.2099117, 0, 0.2039216, 1, 1,
0.330977, -0.4119673, 2.891297, 0, 0.1960784, 1, 1,
0.3330022, 1.456794, -0.1424658, 0, 0.1882353, 1, 1,
0.3358062, 0.115445, 1.936837, 0, 0.1843137, 1, 1,
0.3398301, 0.5649964, -0.9058128, 0, 0.1764706, 1, 1,
0.3412986, 1.016845, 2.166602, 0, 0.172549, 1, 1,
0.3443247, 2.43261, -0.9319107, 0, 0.1647059, 1, 1,
0.346171, 1.909968, 1.88145, 0, 0.1607843, 1, 1,
0.3497707, 0.2391109, 0.7246699, 0, 0.1529412, 1, 1,
0.3578565, -1.127261, 2.295803, 0, 0.1490196, 1, 1,
0.3602504, 0.1476797, 0.8586347, 0, 0.1411765, 1, 1,
0.3646909, 1.657348, 0.3980443, 0, 0.1372549, 1, 1,
0.3672997, -1.719201, 3.427719, 0, 0.1294118, 1, 1,
0.3875568, 0.4102534, 0.3251503, 0, 0.1254902, 1, 1,
0.3881987, -1.939346, 4.451252, 0, 0.1176471, 1, 1,
0.3897035, 1.251284, 1.445953, 0, 0.1137255, 1, 1,
0.3903213, -0.6180117, 2.021053, 0, 0.1058824, 1, 1,
0.3921243, -1.915262, 2.068428, 0, 0.09803922, 1, 1,
0.3930106, -0.4408237, 0.3524162, 0, 0.09411765, 1, 1,
0.403247, -1.440965, 2.269652, 0, 0.08627451, 1, 1,
0.4066597, 1.138039, 1.514787, 0, 0.08235294, 1, 1,
0.4083917, -0.3996409, 2.588388, 0, 0.07450981, 1, 1,
0.4088546, 0.694494, -0.8440551, 0, 0.07058824, 1, 1,
0.4095728, 0.1137727, 2.440571, 0, 0.0627451, 1, 1,
0.4103642, -1.452194, 4.223537, 0, 0.05882353, 1, 1,
0.412314, -0.3303944, 1.668752, 0, 0.05098039, 1, 1,
0.4127382, 0.4116876, -0.1438432, 0, 0.04705882, 1, 1,
0.4161463, -1.417767, 2.264761, 0, 0.03921569, 1, 1,
0.418237, -0.9686468, 4.882295, 0, 0.03529412, 1, 1,
0.4251922, -0.8993824, 2.79581, 0, 0.02745098, 1, 1,
0.4310002, 0.8153591, 1.450315, 0, 0.02352941, 1, 1,
0.4350204, 1.56797, 1.002338, 0, 0.01568628, 1, 1,
0.4386741, -1.108186, 3.398899, 0, 0.01176471, 1, 1,
0.442827, 0.2940626, 1.248826, 0, 0.003921569, 1, 1,
0.443036, -0.293158, 1.900495, 0.003921569, 0, 1, 1,
0.4462909, 0.8413947, 0.8086681, 0.007843138, 0, 1, 1,
0.4477522, 1.123944, 1.107211, 0.01568628, 0, 1, 1,
0.4496996, -0.4864076, 2.791293, 0.01960784, 0, 1, 1,
0.4507686, -1.268376, 3.426085, 0.02745098, 0, 1, 1,
0.4510468, -1.272879, 1.703547, 0.03137255, 0, 1, 1,
0.4603, 2.198726, 0.7266439, 0.03921569, 0, 1, 1,
0.4643554, -1.810769, 3.554196, 0.04313726, 0, 1, 1,
0.4670289, 0.7818815, 0.9217452, 0.05098039, 0, 1, 1,
0.4685615, -1.330988, 3.094941, 0.05490196, 0, 1, 1,
0.4693129, -0.2750513, 2.335511, 0.0627451, 0, 1, 1,
0.4748551, 0.7615179, 0.820363, 0.06666667, 0, 1, 1,
0.4753383, -1.066798, 4.449321, 0.07450981, 0, 1, 1,
0.4764605, 0.8865575, 1.154901, 0.07843138, 0, 1, 1,
0.4769951, -0.4242203, 1.03848, 0.08627451, 0, 1, 1,
0.478012, -1.218357, 3.366016, 0.09019608, 0, 1, 1,
0.4797821, 1.754117, -0.6277232, 0.09803922, 0, 1, 1,
0.4812294, 0.6454576, 0.268044, 0.1058824, 0, 1, 1,
0.4812577, -0.8171592, 2.596004, 0.1098039, 0, 1, 1,
0.4897614, -1.506924, 3.852317, 0.1176471, 0, 1, 1,
0.4932733, 0.4624098, 0.3973722, 0.1215686, 0, 1, 1,
0.4985831, -0.224014, 0.2550105, 0.1294118, 0, 1, 1,
0.5036706, -1.62526, 1.946703, 0.1333333, 0, 1, 1,
0.5062087, -0.5024806, 3.394288, 0.1411765, 0, 1, 1,
0.5106634, -0.03602644, -0.2484351, 0.145098, 0, 1, 1,
0.5119182, 0.9132087, 0.9802212, 0.1529412, 0, 1, 1,
0.5175475, -0.09073853, 1.769841, 0.1568628, 0, 1, 1,
0.5185043, 0.8765509, 1.952956, 0.1647059, 0, 1, 1,
0.5194798, 0.4931608, 2.283189, 0.1686275, 0, 1, 1,
0.5205216, 0.8037211, -1.530204, 0.1764706, 0, 1, 1,
0.5209253, -0.1547141, 2.63965, 0.1803922, 0, 1, 1,
0.5298365, -0.3646552, 0.9186713, 0.1882353, 0, 1, 1,
0.5385553, -0.1206288, 0.6714959, 0.1921569, 0, 1, 1,
0.5401325, 0.4773481, 0.1804503, 0.2, 0, 1, 1,
0.5475245, -0.3581609, 1.262856, 0.2078431, 0, 1, 1,
0.5494675, -1.438441, 1.685054, 0.2117647, 0, 1, 1,
0.5511696, 0.5459734, 1.035824, 0.2196078, 0, 1, 1,
0.5512704, 0.5964502, 2.458395, 0.2235294, 0, 1, 1,
0.5536548, -0.8372118, 2.797528, 0.2313726, 0, 1, 1,
0.5627034, 0.3560437, 0.5247363, 0.2352941, 0, 1, 1,
0.5633103, 1.118565, 1.109679, 0.2431373, 0, 1, 1,
0.5669329, 0.01515635, 1.14307, 0.2470588, 0, 1, 1,
0.5676694, 1.224778, 1.110558, 0.254902, 0, 1, 1,
0.5690098, -1.532602, 3.053503, 0.2588235, 0, 1, 1,
0.5746677, 0.7141454, -0.3285756, 0.2666667, 0, 1, 1,
0.5846781, 0.1302685, 0.9036031, 0.2705882, 0, 1, 1,
0.5850454, -0.900206, 1.761189, 0.2784314, 0, 1, 1,
0.5855522, 0.6892116, 0.5422304, 0.282353, 0, 1, 1,
0.5882372, 0.5095479, 0.380903, 0.2901961, 0, 1, 1,
0.588356, 0.4135958, 1.372707, 0.2941177, 0, 1, 1,
0.5896314, 0.7158496, -0.8435949, 0.3019608, 0, 1, 1,
0.5915911, -1.383528, 1.004827, 0.3098039, 0, 1, 1,
0.5922241, 0.6747379, 0.1355741, 0.3137255, 0, 1, 1,
0.5935079, -0.2765595, 2.987084, 0.3215686, 0, 1, 1,
0.5964049, -0.7109487, 2.047436, 0.3254902, 0, 1, 1,
0.5970622, -0.6601509, 3.077437, 0.3333333, 0, 1, 1,
0.6027374, 0.6305657, -0.2503535, 0.3372549, 0, 1, 1,
0.6062455, 0.571126, 0.5897107, 0.345098, 0, 1, 1,
0.6065162, -0.2350439, 1.387706, 0.3490196, 0, 1, 1,
0.6086913, 2.685469, -0.3483535, 0.3568628, 0, 1, 1,
0.6109909, 0.575246, 2.120838, 0.3607843, 0, 1, 1,
0.6139677, -0.2187262, 1.347651, 0.3686275, 0, 1, 1,
0.6164594, 0.19054, 2.202608, 0.372549, 0, 1, 1,
0.6179321, 0.379729, -1.343249, 0.3803922, 0, 1, 1,
0.6211464, -1.470271, 1.914182, 0.3843137, 0, 1, 1,
0.6226919, -1.484429, 2.772004, 0.3921569, 0, 1, 1,
0.6250154, 1.815302, 1.883048, 0.3960784, 0, 1, 1,
0.6260188, 1.285522, 0.5050026, 0.4039216, 0, 1, 1,
0.6310064, 0.9073259, 0.4513353, 0.4117647, 0, 1, 1,
0.635157, 0.4597357, 1.624835, 0.4156863, 0, 1, 1,
0.6402395, -1.488563, 2.765144, 0.4235294, 0, 1, 1,
0.6436709, 0.3435487, 1.994108, 0.427451, 0, 1, 1,
0.6446379, -2.239285, 2.597733, 0.4352941, 0, 1, 1,
0.6476273, 0.2098309, 0.6553958, 0.4392157, 0, 1, 1,
0.653006, -0.2206502, 1.753655, 0.4470588, 0, 1, 1,
0.6545265, -0.9730558, 2.735672, 0.4509804, 0, 1, 1,
0.6569391, -0.9061106, 3.56974, 0.4588235, 0, 1, 1,
0.6582751, -1.610365, 1.960517, 0.4627451, 0, 1, 1,
0.6587523, -0.5252118, 1.202498, 0.4705882, 0, 1, 1,
0.6648738, 0.3809496, 1.816064, 0.4745098, 0, 1, 1,
0.6650521, -0.1747621, 0.4296274, 0.4823529, 0, 1, 1,
0.6671895, 1.623977, -0.2334586, 0.4862745, 0, 1, 1,
0.6728289, 0.4580343, 0.2343149, 0.4941176, 0, 1, 1,
0.6729571, 0.04414535, 1.583366, 0.5019608, 0, 1, 1,
0.6752166, 0.4660274, 2.288469, 0.5058824, 0, 1, 1,
0.6789756, -0.08003808, 2.547964, 0.5137255, 0, 1, 1,
0.6793005, -1.591075, 3.776686, 0.5176471, 0, 1, 1,
0.6794304, 0.3238258, 0.9710953, 0.5254902, 0, 1, 1,
0.6824954, -1.051067, 2.469955, 0.5294118, 0, 1, 1,
0.6825342, 0.6217805, -0.40663, 0.5372549, 0, 1, 1,
0.6870428, 0.4006017, 0.7834446, 0.5411765, 0, 1, 1,
0.6897457, -0.7543775, 1.599987, 0.5490196, 0, 1, 1,
0.6921443, 0.9530215, 1.130427, 0.5529412, 0, 1, 1,
0.6970342, -0.9554873, 3.076475, 0.5607843, 0, 1, 1,
0.6987141, -1.368543, 0.9330409, 0.5647059, 0, 1, 1,
0.6993421, -0.06328363, 2.559319, 0.572549, 0, 1, 1,
0.6998027, 1.165963, -0.7069099, 0.5764706, 0, 1, 1,
0.7006405, -0.5599332, 2.385571, 0.5843138, 0, 1, 1,
0.7075938, 0.3634205, 0.373329, 0.5882353, 0, 1, 1,
0.7119284, 0.3361816, -0.9093216, 0.5960785, 0, 1, 1,
0.7134831, 1.758853, 1.959455, 0.6039216, 0, 1, 1,
0.7156887, -0.09006393, 3.839486, 0.6078432, 0, 1, 1,
0.7170823, 0.2426324, 3.009565, 0.6156863, 0, 1, 1,
0.7201358, -2.320217, 3.73177, 0.6196079, 0, 1, 1,
0.7204226, -0.2495376, 1.57674, 0.627451, 0, 1, 1,
0.7259279, 1.203338, 0.03160849, 0.6313726, 0, 1, 1,
0.7291275, 0.0998396, 1.64058, 0.6392157, 0, 1, 1,
0.7355189, 0.2480285, 1.577583, 0.6431373, 0, 1, 1,
0.7437358, -0.5095459, 1.541376, 0.6509804, 0, 1, 1,
0.7460139, 1.402643, -0.2800862, 0.654902, 0, 1, 1,
0.752472, 0.1873759, 0.757587, 0.6627451, 0, 1, 1,
0.7540874, 1.741297, -0.6183039, 0.6666667, 0, 1, 1,
0.7543784, 2.354596, -0.08594305, 0.6745098, 0, 1, 1,
0.7568057, -0.6821401, 4.321564, 0.6784314, 0, 1, 1,
0.7572386, 0.07710034, 2.914455, 0.6862745, 0, 1, 1,
0.7586047, -1.518868, 2.172728, 0.6901961, 0, 1, 1,
0.7617584, 0.590323, -0.3575658, 0.6980392, 0, 1, 1,
0.7627804, 2.528327, 2.143018, 0.7058824, 0, 1, 1,
0.7629121, 0.6408589, 2.025343, 0.7098039, 0, 1, 1,
0.7640001, -0.0709638, 2.449553, 0.7176471, 0, 1, 1,
0.764247, -0.2867236, 0.5289185, 0.7215686, 0, 1, 1,
0.7672981, -1.347541, 1.416482, 0.7294118, 0, 1, 1,
0.7687176, 1.288012, 0.3686387, 0.7333333, 0, 1, 1,
0.7795686, 1.248217, -0.8170063, 0.7411765, 0, 1, 1,
0.7811996, -1.193982, 1.137419, 0.7450981, 0, 1, 1,
0.7870609, 1.995618, 2.649327, 0.7529412, 0, 1, 1,
0.7876838, -0.2409798, -0.2863954, 0.7568628, 0, 1, 1,
0.8017058, -1.948629, 3.100192, 0.7647059, 0, 1, 1,
0.8090352, -1.883739, 1.899031, 0.7686275, 0, 1, 1,
0.8104663, -0.01501932, 0.5404496, 0.7764706, 0, 1, 1,
0.8113118, 0.1106423, -0.1010854, 0.7803922, 0, 1, 1,
0.812252, -1.213426, 1.130158, 0.7882353, 0, 1, 1,
0.8143141, 0.1499102, 3.647788, 0.7921569, 0, 1, 1,
0.8145517, 1.654806, 0.350191, 0.8, 0, 1, 1,
0.8186131, -0.1919807, 0.6664649, 0.8078431, 0, 1, 1,
0.8198225, -0.7477148, 2.3705, 0.8117647, 0, 1, 1,
0.8202044, 0.8449785, -0.8116219, 0.8196079, 0, 1, 1,
0.822172, -0.3539782, 3.663395, 0.8235294, 0, 1, 1,
0.8268303, 0.03309616, 1.858815, 0.8313726, 0, 1, 1,
0.8348407, 0.6479412, 1.952344, 0.8352941, 0, 1, 1,
0.8413709, 0.3453549, 1.621063, 0.8431373, 0, 1, 1,
0.8421835, 0.4833935, 1.29229, 0.8470588, 0, 1, 1,
0.8444513, -1.575975, 2.056624, 0.854902, 0, 1, 1,
0.8454431, 0.3638114, 0.6409532, 0.8588235, 0, 1, 1,
0.8472587, -1.349424, 2.891541, 0.8666667, 0, 1, 1,
0.8472779, -0.5544801, 1.038376, 0.8705882, 0, 1, 1,
0.8480651, -1.538263, 2.112524, 0.8784314, 0, 1, 1,
0.851546, -1.243315, 2.457191, 0.8823529, 0, 1, 1,
0.8526828, 0.5824723, 1.662793, 0.8901961, 0, 1, 1,
0.8591242, 1.698623, 1.5547, 0.8941177, 0, 1, 1,
0.8600391, -2.067048, 2.072176, 0.9019608, 0, 1, 1,
0.8635823, 1.771484, 0.6558816, 0.9098039, 0, 1, 1,
0.8734086, -2.284303, 1.820586, 0.9137255, 0, 1, 1,
0.8786543, -0.1155879, 1.120734, 0.9215686, 0, 1, 1,
0.8883328, -0.5732354, 2.313791, 0.9254902, 0, 1, 1,
0.8899223, -0.04998502, -0.08456574, 0.9333333, 0, 1, 1,
0.9007317, -0.1187194, 2.580537, 0.9372549, 0, 1, 1,
0.9162959, -0.5762362, 4.059847, 0.945098, 0, 1, 1,
0.9199805, 0.3654374, 1.556551, 0.9490196, 0, 1, 1,
0.9214883, -0.2204281, 0.9520642, 0.9568627, 0, 1, 1,
0.9271838, -0.9169857, 1.749528, 0.9607843, 0, 1, 1,
0.9316195, 2.48849, 1.754748, 0.9686275, 0, 1, 1,
0.9370847, 0.004911002, 0.2961395, 0.972549, 0, 1, 1,
0.9416366, -0.5244117, 2.478669, 0.9803922, 0, 1, 1,
0.9544177, 0.09834203, 1.744585, 0.9843137, 0, 1, 1,
0.9609169, -0.01878997, 1.027293, 0.9921569, 0, 1, 1,
0.9647225, 1.035908, 1.350022, 0.9960784, 0, 1, 1,
0.9714715, 0.6842375, 0.5744434, 1, 0, 0.9960784, 1,
0.9829124, -0.6642316, 2.714804, 1, 0, 0.9882353, 1,
0.9956134, 1.522382, 1.964605, 1, 0, 0.9843137, 1,
0.9989609, 0.3190443, 1.502104, 1, 0, 0.9764706, 1,
1.001405, -0.810824, 2.927237, 1, 0, 0.972549, 1,
1.002354, 1.043285, 2.269394, 1, 0, 0.9647059, 1,
1.008835, -1.050129, 0.6130246, 1, 0, 0.9607843, 1,
1.014148, -0.06610657, 2.073983, 1, 0, 0.9529412, 1,
1.01744, 0.9161299, -0.4210873, 1, 0, 0.9490196, 1,
1.018309, 0.5643678, 2.69124, 1, 0, 0.9411765, 1,
1.021914, 1.292147, -0.8898961, 1, 0, 0.9372549, 1,
1.025723, -0.3881005, 2.227046, 1, 0, 0.9294118, 1,
1.029345, -0.505929, 1.230317, 1, 0, 0.9254902, 1,
1.035983, -0.02730302, 0.5640112, 1, 0, 0.9176471, 1,
1.04104, -0.6903937, 1.329838, 1, 0, 0.9137255, 1,
1.042454, -0.8393059, 2.185671, 1, 0, 0.9058824, 1,
1.045194, -0.232278, 0.4711299, 1, 0, 0.9019608, 1,
1.047596, 0.1551754, 0.985773, 1, 0, 0.8941177, 1,
1.054541, 0.8550874, 0.4869972, 1, 0, 0.8862745, 1,
1.067786, -1.410951, 1.411699, 1, 0, 0.8823529, 1,
1.071558, -0.9399374, 2.996052, 1, 0, 0.8745098, 1,
1.080448, -0.5744374, 3.892767, 1, 0, 0.8705882, 1,
1.08257, 0.2431803, -0.0080194, 1, 0, 0.8627451, 1,
1.090882, 1.190107, 2.4861, 1, 0, 0.8588235, 1,
1.09879, 0.2894516, 1.307265, 1, 0, 0.8509804, 1,
1.104805, -1.786336, 2.228385, 1, 0, 0.8470588, 1,
1.105719, -1.212476, 3.234281, 1, 0, 0.8392157, 1,
1.11311, -0.1716107, 0.186039, 1, 0, 0.8352941, 1,
1.116093, 1.273483, -0.9349073, 1, 0, 0.827451, 1,
1.121575, 0.9991269, -0.3137175, 1, 0, 0.8235294, 1,
1.121821, -0.1137453, 1.785048, 1, 0, 0.8156863, 1,
1.133059, 1.134083, 0.7399049, 1, 0, 0.8117647, 1,
1.133109, -1.987927, 2.915271, 1, 0, 0.8039216, 1,
1.143405, -1.216123, 4.380975, 1, 0, 0.7960784, 1,
1.149695, -0.6826335, 2.943789, 1, 0, 0.7921569, 1,
1.163439, -0.5403121, 2.628477, 1, 0, 0.7843137, 1,
1.167614, -1.187853, 1.056414, 1, 0, 0.7803922, 1,
1.167768, -0.05680842, 1.189234, 1, 0, 0.772549, 1,
1.169369, 1.585928, 0.9377736, 1, 0, 0.7686275, 1,
1.173173, -0.446465, 0.6841789, 1, 0, 0.7607843, 1,
1.173257, 0.3814978, 0.7859951, 1, 0, 0.7568628, 1,
1.173274, 2.938545, 1.926757, 1, 0, 0.7490196, 1,
1.183051, 0.1658892, 1.188058, 1, 0, 0.7450981, 1,
1.193442, -0.03133309, 1.680539, 1, 0, 0.7372549, 1,
1.196451, 0.02299894, 2.375428, 1, 0, 0.7333333, 1,
1.202126, 0.6081561, 2.835295, 1, 0, 0.7254902, 1,
1.204667, 0.796652, -0.3108089, 1, 0, 0.7215686, 1,
1.209764, 0.1625042, 1.797071, 1, 0, 0.7137255, 1,
1.213579, -0.5333446, 2.713655, 1, 0, 0.7098039, 1,
1.216353, 1.318934, -2.050266, 1, 0, 0.7019608, 1,
1.216555, -0.7861301, 1.924923, 1, 0, 0.6941177, 1,
1.218562, 0.4867533, 0.3063537, 1, 0, 0.6901961, 1,
1.218908, -0.04102588, 2.227729, 1, 0, 0.682353, 1,
1.222639, -0.6173282, 2.401769, 1, 0, 0.6784314, 1,
1.227743, 0.3950592, 1.725126, 1, 0, 0.6705883, 1,
1.23488, -1.192324, 3.043508, 1, 0, 0.6666667, 1,
1.240085, 0.8345078, 0.4610525, 1, 0, 0.6588235, 1,
1.249844, -1.237741, 1.679972, 1, 0, 0.654902, 1,
1.250242, -1.07429, 2.919393, 1, 0, 0.6470588, 1,
1.263076, 0.6409045, 1.414504, 1, 0, 0.6431373, 1,
1.266399, 0.8629706, 1.68653, 1, 0, 0.6352941, 1,
1.2668, 1.327629, 1.178469, 1, 0, 0.6313726, 1,
1.266887, 0.5513196, -1.07938, 1, 0, 0.6235294, 1,
1.27139, -0.7743994, 1.652961, 1, 0, 0.6196079, 1,
1.280191, -0.2303804, 2.911424, 1, 0, 0.6117647, 1,
1.281833, -1.930127, 1.414442, 1, 0, 0.6078432, 1,
1.283724, 0.9173309, -0.05389448, 1, 0, 0.6, 1,
1.30078, 0.807027, 2.113743, 1, 0, 0.5921569, 1,
1.305467, 0.9053491, 1.554004, 1, 0, 0.5882353, 1,
1.314045, 0.5213034, 1.268313, 1, 0, 0.5803922, 1,
1.344756, 0.6681734, 0.9503288, 1, 0, 0.5764706, 1,
1.349578, 0.4989202, 1.925598, 1, 0, 0.5686275, 1,
1.350662, 1.338567, 2.305654, 1, 0, 0.5647059, 1,
1.360595, 1.494211, 0.9968759, 1, 0, 0.5568628, 1,
1.363424, -0.1869033, 0.1449647, 1, 0, 0.5529412, 1,
1.389005, 0.2833258, 1.954409, 1, 0, 0.5450981, 1,
1.405173, 0.6615943, 0.5184976, 1, 0, 0.5411765, 1,
1.409239, -0.05456123, 2.596125, 1, 0, 0.5333334, 1,
1.411583, -1.424802, 2.199985, 1, 0, 0.5294118, 1,
1.414582, 0.5354778, -0.3059389, 1, 0, 0.5215687, 1,
1.431157, -0.5450345, 1.996022, 1, 0, 0.5176471, 1,
1.438458, 0.684996, 1.253945, 1, 0, 0.509804, 1,
1.446155, -0.2185442, 1.103059, 1, 0, 0.5058824, 1,
1.463377, 0.4679375, 2.81004, 1, 0, 0.4980392, 1,
1.471543, 1.672705, 0.284303, 1, 0, 0.4901961, 1,
1.479282, -2.433437, 3.263279, 1, 0, 0.4862745, 1,
1.492654, 0.8238546, 2.575779, 1, 0, 0.4784314, 1,
1.496763, 0.01059811, 2.687293, 1, 0, 0.4745098, 1,
1.504073, 1.263003, 0.1143979, 1, 0, 0.4666667, 1,
1.510138, 0.6377556, 0.4195047, 1, 0, 0.4627451, 1,
1.511747, 0.6003063, 0.1171112, 1, 0, 0.454902, 1,
1.512914, 0.1205917, -1.486293, 1, 0, 0.4509804, 1,
1.517439, -1.557696, 1.969534, 1, 0, 0.4431373, 1,
1.518131, -0.3132392, 2.826107, 1, 0, 0.4392157, 1,
1.518396, -0.7300161, 1.07224, 1, 0, 0.4313726, 1,
1.534224, -0.8599453, 2.662837, 1, 0, 0.427451, 1,
1.536004, 2.0282, -0.3907136, 1, 0, 0.4196078, 1,
1.538396, 0.8773859, 1.409318, 1, 0, 0.4156863, 1,
1.544367, 0.5505378, -0.08863776, 1, 0, 0.4078431, 1,
1.565089, 1.144257, 0.6539666, 1, 0, 0.4039216, 1,
1.56669, -1.836714, 1.303036, 1, 0, 0.3960784, 1,
1.575298, -0.6680731, 3.041222, 1, 0, 0.3882353, 1,
1.57551, 0.1020204, 1.693319, 1, 0, 0.3843137, 1,
1.587934, -1.645218, 1.647706, 1, 0, 0.3764706, 1,
1.594479, 0.8202379, 1.756722, 1, 0, 0.372549, 1,
1.599332, -1.249177, 2.38979, 1, 0, 0.3647059, 1,
1.599778, -0.4029067, 2.18817, 1, 0, 0.3607843, 1,
1.609761, 0.5615992, 0.4267559, 1, 0, 0.3529412, 1,
1.615202, 0.02177612, 2.210683, 1, 0, 0.3490196, 1,
1.623545, 0.3740198, 1.635954, 1, 0, 0.3411765, 1,
1.627872, 1.3182, 0.2478638, 1, 0, 0.3372549, 1,
1.628941, -0.500083, 1.781671, 1, 0, 0.3294118, 1,
1.640656, 1.255532, -0.4516874, 1, 0, 0.3254902, 1,
1.661317, -0.5529328, 2.459774, 1, 0, 0.3176471, 1,
1.665123, 1.020743, 0.6247222, 1, 0, 0.3137255, 1,
1.668376, -0.1541101, 1.280539, 1, 0, 0.3058824, 1,
1.670427, -0.8890806, 2.345878, 1, 0, 0.2980392, 1,
1.680379, -0.516502, 1.571092, 1, 0, 0.2941177, 1,
1.686856, -0.3894553, 1.428052, 1, 0, 0.2862745, 1,
1.689753, -1.779261, 3.109179, 1, 0, 0.282353, 1,
1.701359, 1.601143, 1.960236, 1, 0, 0.2745098, 1,
1.716246, 0.8339711, -0.006407128, 1, 0, 0.2705882, 1,
1.724862, 1.61088, 1.321745, 1, 0, 0.2627451, 1,
1.736458, 0.4765867, 2.542462, 1, 0, 0.2588235, 1,
1.751644, 0.6585181, 0.5790113, 1, 0, 0.2509804, 1,
1.764763, 1.158446, 1.345273, 1, 0, 0.2470588, 1,
1.768034, -1.380223, 1.229504, 1, 0, 0.2392157, 1,
1.790361, -0.2136155, 0.9193279, 1, 0, 0.2352941, 1,
1.795913, -0.2218332, 2.436411, 1, 0, 0.227451, 1,
1.809895, 0.08809532, 0.2351284, 1, 0, 0.2235294, 1,
1.81296, 0.2558376, -0.1221722, 1, 0, 0.2156863, 1,
1.814148, -0.7285654, 3.162261, 1, 0, 0.2117647, 1,
1.838527, -0.4270111, 1.359133, 1, 0, 0.2039216, 1,
1.84047, -0.04758368, 0.9521708, 1, 0, 0.1960784, 1,
1.871117, 0.7982823, 2.368715, 1, 0, 0.1921569, 1,
1.916467, -2.065465, 3.298521, 1, 0, 0.1843137, 1,
1.937888, 0.1385781, 1.368344, 1, 0, 0.1803922, 1,
1.975142, -0.7206904, 0.5547624, 1, 0, 0.172549, 1,
1.977389, 1.479795, 3.107478, 1, 0, 0.1686275, 1,
1.979835, 0.8308108, 2.061763, 1, 0, 0.1607843, 1,
1.984106, 2.716102, -0.02483114, 1, 0, 0.1568628, 1,
1.99406, 0.4089697, 1.52859, 1, 0, 0.1490196, 1,
1.994596, -1.070227, 2.320752, 1, 0, 0.145098, 1,
2.00566, -0.3401194, 2.227537, 1, 0, 0.1372549, 1,
2.058845, 0.4553417, 2.174921, 1, 0, 0.1333333, 1,
2.060939, 0.471162, 1.360267, 1, 0, 0.1254902, 1,
2.06684, -1.435881, 1.730386, 1, 0, 0.1215686, 1,
2.067482, -1.277606, 4.730654, 1, 0, 0.1137255, 1,
2.09497, -0.1823414, 2.151929, 1, 0, 0.1098039, 1,
2.147702, -0.7634282, 3.293551, 1, 0, 0.1019608, 1,
2.170142, 0.1001183, 1.064968, 1, 0, 0.09411765, 1,
2.178512, 1.175761, 2.24801, 1, 0, 0.09019608, 1,
2.236573, -1.972716, 3.406339, 1, 0, 0.08235294, 1,
2.243781, -0.3125641, 1.013677, 1, 0, 0.07843138, 1,
2.332561, 0.4571019, 1.914433, 1, 0, 0.07058824, 1,
2.346056, 0.626431, 1.34945, 1, 0, 0.06666667, 1,
2.37795, 0.8103703, 2.892174, 1, 0, 0.05882353, 1,
2.449749, -0.3376331, 1.505892, 1, 0, 0.05490196, 1,
2.459804, 1.579211, 1.855569, 1, 0, 0.04705882, 1,
2.513979, 0.2809501, 1.561884, 1, 0, 0.04313726, 1,
2.552792, -0.9071286, 1.492597, 1, 0, 0.03529412, 1,
2.565158, -1.565219, 1.062681, 1, 0, 0.03137255, 1,
2.569868, -1.531698, 2.975972, 1, 0, 0.02352941, 1,
2.667472, 0.1623558, 0.541311, 1, 0, 0.01960784, 1,
2.798907, 0.5543136, 2.119852, 1, 0, 0.01176471, 1,
2.802228, -0.9502895, 3.327138, 1, 0, 0.007843138, 1
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
-0.3144062, -3.728747, -7.337712, 0, -0.5, 0.5, 0.5,
-0.3144062, -3.728747, -7.337712, 1, -0.5, 0.5, 0.5,
-0.3144062, -3.728747, -7.337712, 1, 1.5, 0.5, 0.5,
-0.3144062, -3.728747, -7.337712, 0, 1.5, 0.5, 0.5
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
-4.487579, 0.1676248, -7.337712, 0, -0.5, 0.5, 0.5,
-4.487579, 0.1676248, -7.337712, 1, -0.5, 0.5, 0.5,
-4.487579, 0.1676248, -7.337712, 1, 1.5, 0.5, 0.5,
-4.487579, 0.1676248, -7.337712, 0, 1.5, 0.5, 0.5
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
-4.487579, -3.728747, -0.02945662, 0, -0.5, 0.5, 0.5,
-4.487579, -3.728747, -0.02945662, 1, -0.5, 0.5, 0.5,
-4.487579, -3.728747, -0.02945662, 1, 1.5, 0.5, 0.5,
-4.487579, -3.728747, -0.02945662, 0, 1.5, 0.5, 0.5
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
-3, -2.829585, -5.651192,
2, -2.829585, -5.651192,
-3, -2.829585, -5.651192,
-3, -2.979445, -5.932279,
-2, -2.829585, -5.651192,
-2, -2.979445, -5.932279,
-1, -2.829585, -5.651192,
-1, -2.979445, -5.932279,
0, -2.829585, -5.651192,
0, -2.979445, -5.932279,
1, -2.829585, -5.651192,
1, -2.979445, -5.932279,
2, -2.829585, -5.651192,
2, -2.979445, -5.932279
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
-3, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
-3, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
-3, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
-3, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5,
-2, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
-2, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
-2, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
-2, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5,
-1, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
-1, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
-1, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
-1, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5,
0, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
0, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
0, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
0, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5,
1, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
1, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
1, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
1, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5,
2, -3.279166, -6.494452, 0, -0.5, 0.5, 0.5,
2, -3.279166, -6.494452, 1, -0.5, 0.5, 0.5,
2, -3.279166, -6.494452, 1, 1.5, 0.5, 0.5,
2, -3.279166, -6.494452, 0, 1.5, 0.5, 0.5
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
-3.524539, -2, -5.651192,
-3.524539, 3, -5.651192,
-3.524539, -2, -5.651192,
-3.685046, -2, -5.932279,
-3.524539, -1, -5.651192,
-3.685046, -1, -5.932279,
-3.524539, 0, -5.651192,
-3.685046, 0, -5.932279,
-3.524539, 1, -5.651192,
-3.685046, 1, -5.932279,
-3.524539, 2, -5.651192,
-3.685046, 2, -5.932279,
-3.524539, 3, -5.651192,
-3.685046, 3, -5.932279
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
-4.006059, -2, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, -2, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, -2, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, -2, -6.494452, 0, 1.5, 0.5, 0.5,
-4.006059, -1, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, -1, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, -1, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, -1, -6.494452, 0, 1.5, 0.5, 0.5,
-4.006059, 0, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, 0, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, 0, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, 0, -6.494452, 0, 1.5, 0.5, 0.5,
-4.006059, 1, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, 1, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, 1, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, 1, -6.494452, 0, 1.5, 0.5, 0.5,
-4.006059, 2, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, 2, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, 2, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, 2, -6.494452, 0, 1.5, 0.5, 0.5,
-4.006059, 3, -6.494452, 0, -0.5, 0.5, 0.5,
-4.006059, 3, -6.494452, 1, -0.5, 0.5, 0.5,
-4.006059, 3, -6.494452, 1, 1.5, 0.5, 0.5,
-4.006059, 3, -6.494452, 0, 1.5, 0.5, 0.5
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
-3.524539, -2.829585, -4,
-3.524539, -2.829585, 4,
-3.524539, -2.829585, -4,
-3.685046, -2.979445, -4,
-3.524539, -2.829585, -2,
-3.685046, -2.979445, -2,
-3.524539, -2.829585, 0,
-3.685046, -2.979445, 0,
-3.524539, -2.829585, 2,
-3.685046, -2.979445, 2,
-3.524539, -2.829585, 4,
-3.685046, -2.979445, 4
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
-4.006059, -3.279166, -4, 0, -0.5, 0.5, 0.5,
-4.006059, -3.279166, -4, 1, -0.5, 0.5, 0.5,
-4.006059, -3.279166, -4, 1, 1.5, 0.5, 0.5,
-4.006059, -3.279166, -4, 0, 1.5, 0.5, 0.5,
-4.006059, -3.279166, -2, 0, -0.5, 0.5, 0.5,
-4.006059, -3.279166, -2, 1, -0.5, 0.5, 0.5,
-4.006059, -3.279166, -2, 1, 1.5, 0.5, 0.5,
-4.006059, -3.279166, -2, 0, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 0, 0, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 0, 1, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 0, 1, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 0, 0, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 2, 0, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 2, 1, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 2, 1, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 2, 0, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 4, 0, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 4, 1, -0.5, 0.5, 0.5,
-4.006059, -3.279166, 4, 1, 1.5, 0.5, 0.5,
-4.006059, -3.279166, 4, 0, 1.5, 0.5, 0.5
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
-3.524539, -2.829585, -5.651192,
-3.524539, 3.164834, -5.651192,
-3.524539, -2.829585, 5.592278,
-3.524539, 3.164834, 5.592278,
-3.524539, -2.829585, -5.651192,
-3.524539, -2.829585, 5.592278,
-3.524539, 3.164834, -5.651192,
-3.524539, 3.164834, 5.592278,
-3.524539, -2.829585, -5.651192,
2.895727, -2.829585, -5.651192,
-3.524539, -2.829585, 5.592278,
2.895727, -2.829585, 5.592278,
-3.524539, 3.164834, -5.651192,
2.895727, 3.164834, -5.651192,
-3.524539, 3.164834, 5.592278,
2.895727, 3.164834, 5.592278,
2.895727, -2.829585, -5.651192,
2.895727, 3.164834, -5.651192,
2.895727, -2.829585, 5.592278,
2.895727, 3.164834, 5.592278,
2.895727, -2.829585, -5.651192,
2.895727, -2.829585, 5.592278,
2.895727, 3.164834, -5.651192,
2.895727, 3.164834, 5.592278
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
var radius = 7.618698;
var distance = 33.89645;
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
mvMatrix.translate( 0.3144062, -0.1676248, 0.02945662 );
mvMatrix.scale( 1.283044, 1.374192, 0.7326462 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89645);
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
folpet<-read.table("folpet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-folpet$V2
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
```

```r
y<-folpet$V3
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
```

```r
z<-folpet$V4
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
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
-3.43104, -0.09818113, -1.412026, 0, 0, 1, 1, 1,
-3.324388, -1.266021, -2.563708, 1, 0, 0, 1, 1,
-2.859338, -1.215014, -2.134578, 1, 0, 0, 1, 1,
-2.813409, 0.7189912, -0.6414073, 1, 0, 0, 1, 1,
-2.803633, 1.003919, 0.0723479, 1, 0, 0, 1, 1,
-2.768224, -0.494253, -1.396714, 1, 0, 0, 1, 1,
-2.494858, 0.7705504, -2.152665, 0, 0, 0, 1, 1,
-2.465776, -0.9486872, -0.7947072, 0, 0, 0, 1, 1,
-2.465114, 0.08319119, -1.60983, 0, 0, 0, 1, 1,
-2.452003, 0.6734591, -1.52864, 0, 0, 0, 1, 1,
-2.403284, -0.05249719, -0.555723, 0, 0, 0, 1, 1,
-2.366802, -1.193528, -2.728041, 0, 0, 0, 1, 1,
-2.336043, 0.8964208, -0.588663, 0, 0, 0, 1, 1,
-2.322633, 1.009069, -2.458909, 1, 1, 1, 1, 1,
-2.2293, -0.3537891, -2.700389, 1, 1, 1, 1, 1,
-2.203467, -0.9764602, -1.771765, 1, 1, 1, 1, 1,
-2.160463, 0.1015827, -0.4723832, 1, 1, 1, 1, 1,
-2.118857, -0.689274, -1.251464, 1, 1, 1, 1, 1,
-2.094391, -0.4858729, -0.5924768, 1, 1, 1, 1, 1,
-2.091671, 1.437086, -1.605756, 1, 1, 1, 1, 1,
-2.087518, 0.8237861, -2.039565, 1, 1, 1, 1, 1,
-2.057496, 0.5879467, -0.8233643, 1, 1, 1, 1, 1,
-2.056817, 0.3215478, -2.451501, 1, 1, 1, 1, 1,
-2.035475, 0.5857677, -0.4994694, 1, 1, 1, 1, 1,
-1.991295, 0.6311488, -2.056275, 1, 1, 1, 1, 1,
-1.991013, -0.594839, -2.002731, 1, 1, 1, 1, 1,
-1.990363, -1.233027, -3.844457, 1, 1, 1, 1, 1,
-1.989995, -0.4005854, -1.542863, 1, 1, 1, 1, 1,
-1.973563, 0.7078583, -2.704804, 0, 0, 1, 1, 1,
-1.940194, 0.2436267, -1.151228, 1, 0, 0, 1, 1,
-1.936277, -1.738688, -3.834941, 1, 0, 0, 1, 1,
-1.923697, 0.9273992, -1.852302, 1, 0, 0, 1, 1,
-1.882083, -1.013992, -1.807317, 1, 0, 0, 1, 1,
-1.878516, -0.4329527, -0.8176288, 1, 0, 0, 1, 1,
-1.873876, -0.7999994, -1.399059, 0, 0, 0, 1, 1,
-1.823492, -1.015303, -0.5076777, 0, 0, 0, 1, 1,
-1.822307, 0.6585367, -1.980264, 0, 0, 0, 1, 1,
-1.821757, -1.138368, -3.693096, 0, 0, 0, 1, 1,
-1.812881, 0.1587676, -0.3113819, 0, 0, 0, 1, 1,
-1.809338, 0.6403284, -1.775625, 0, 0, 0, 1, 1,
-1.808754, 0.8860899, -0.002917765, 0, 0, 0, 1, 1,
-1.80122, 1.305156, -2.265561, 1, 1, 1, 1, 1,
-1.799947, -0.1140116, -0.1974229, 1, 1, 1, 1, 1,
-1.796427, -0.3851716, -0.3323911, 1, 1, 1, 1, 1,
-1.791086, 0.8432631, -0.7018981, 1, 1, 1, 1, 1,
-1.780295, -1.310724, -2.826135, 1, 1, 1, 1, 1,
-1.776475, -1.717325, -1.120899, 1, 1, 1, 1, 1,
-1.775934, -0.6212921, -1.338665, 1, 1, 1, 1, 1,
-1.769696, 1.295072, -1.079042, 1, 1, 1, 1, 1,
-1.759402, 0.6334201, -1.027765, 1, 1, 1, 1, 1,
-1.75414, 1.712328, -1.385535, 1, 1, 1, 1, 1,
-1.749475, -1.46062, -1.838344, 1, 1, 1, 1, 1,
-1.738606, -0.6525811, -0.6984547, 1, 1, 1, 1, 1,
-1.733075, -0.3720658, 0.3469162, 1, 1, 1, 1, 1,
-1.718506, -0.5006388, -2.114992, 1, 1, 1, 1, 1,
-1.708335, 0.5104801, -1.786138, 1, 1, 1, 1, 1,
-1.703081, 0.6419749, -0.4510392, 0, 0, 1, 1, 1,
-1.687879, -0.4173741, -2.117504, 1, 0, 0, 1, 1,
-1.677233, -0.4258829, -1.84081, 1, 0, 0, 1, 1,
-1.67718, 1.959081, -0.9660998, 1, 0, 0, 1, 1,
-1.676004, -0.6168236, -1.357973, 1, 0, 0, 1, 1,
-1.670721, 2.513358, -2.122525, 1, 0, 0, 1, 1,
-1.666335, -0.699324, -3.405961, 0, 0, 0, 1, 1,
-1.63205, -0.7215351, -0.9031788, 0, 0, 0, 1, 1,
-1.624536, 1.189755, -2.097458, 0, 0, 0, 1, 1,
-1.61921, -2.583776, -1.7815, 0, 0, 0, 1, 1,
-1.614239, -0.7830271, -0.9352819, 0, 0, 0, 1, 1,
-1.60553, 0.6029209, -0.2957059, 0, 0, 0, 1, 1,
-1.583076, -0.7740593, -2.465381, 0, 0, 0, 1, 1,
-1.581183, 1.805754, -0.7035853, 1, 1, 1, 1, 1,
-1.577722, 0.9410005, -1.187426, 1, 1, 1, 1, 1,
-1.568025, -0.1224501, -0.8963996, 1, 1, 1, 1, 1,
-1.566928, -0.2689615, -0.6796653, 1, 1, 1, 1, 1,
-1.563862, 1.305181, 0.6016161, 1, 1, 1, 1, 1,
-1.548997, 1.31536, -0.06938007, 1, 1, 1, 1, 1,
-1.547966, 0.08159183, -0.6196674, 1, 1, 1, 1, 1,
-1.542444, -1.595555, -4.458812, 1, 1, 1, 1, 1,
-1.539978, 0.868607, -0.003407845, 1, 1, 1, 1, 1,
-1.538157, 0.6527979, -1.227471, 1, 1, 1, 1, 1,
-1.531715, 0.9511772, -1.550534, 1, 1, 1, 1, 1,
-1.529144, 0.5501725, -1.28708, 1, 1, 1, 1, 1,
-1.50927, -1.172174, -1.590015, 1, 1, 1, 1, 1,
-1.504756, -0.1241306, -3.338135, 1, 1, 1, 1, 1,
-1.494546, 1.444276, -1.031122, 1, 1, 1, 1, 1,
-1.458925, -0.5801609, -1.904891, 0, 0, 1, 1, 1,
-1.453943, -0.9087476, -1.490112, 1, 0, 0, 1, 1,
-1.449089, 0.4535754, -0.4355766, 1, 0, 0, 1, 1,
-1.43556, 0.6394687, -0.4478709, 1, 0, 0, 1, 1,
-1.428757, -0.6743683, -2.168223, 1, 0, 0, 1, 1,
-1.423854, 0.7452802, -1.710596, 1, 0, 0, 1, 1,
-1.416428, -0.2734948, -0.03093044, 0, 0, 0, 1, 1,
-1.41121, -0.370887, -1.723138, 0, 0, 0, 1, 1,
-1.408595, -0.377335, -0.9302206, 0, 0, 0, 1, 1,
-1.407947, -0.03052122, -3.554199, 0, 0, 0, 1, 1,
-1.400828, 1.322124, -1.217459, 0, 0, 0, 1, 1,
-1.393962, 0.7209869, -1.429194, 0, 0, 0, 1, 1,
-1.393315, -1.395061, -2.639444, 0, 0, 0, 1, 1,
-1.387589, 0.5674985, -1.545525, 1, 1, 1, 1, 1,
-1.38578, 0.1525292, -1.255317, 1, 1, 1, 1, 1,
-1.369686, 0.4394641, -1.232206, 1, 1, 1, 1, 1,
-1.365678, -1.325624, -1.956381, 1, 1, 1, 1, 1,
-1.344168, 0.3442407, -0.05969987, 1, 1, 1, 1, 1,
-1.343182, -0.5103963, -1.517258, 1, 1, 1, 1, 1,
-1.34251, -0.7611049, -2.507927, 1, 1, 1, 1, 1,
-1.342178, -0.4978852, -0.6346814, 1, 1, 1, 1, 1,
-1.336297, 1.258318, 0.4078315, 1, 1, 1, 1, 1,
-1.331815, -0.9504647, -3.472144, 1, 1, 1, 1, 1,
-1.320722, 0.05927533, 0.5627689, 1, 1, 1, 1, 1,
-1.313407, -2.165819, -3.830534, 1, 1, 1, 1, 1,
-1.31272, 0.6908182, -2.307191, 1, 1, 1, 1, 1,
-1.312346, -1.319164, -2.078315, 1, 1, 1, 1, 1,
-1.306043, -0.3862895, 0.3087979, 1, 1, 1, 1, 1,
-1.298794, -0.7358465, -1.260487, 0, 0, 1, 1, 1,
-1.294589, 1.793505, -0.08541384, 1, 0, 0, 1, 1,
-1.290053, 0.4820142, -2.079726, 1, 0, 0, 1, 1,
-1.289517, 0.511999, -0.3749848, 1, 0, 0, 1, 1,
-1.286578, 1.39661, -0.9238536, 1, 0, 0, 1, 1,
-1.280114, -0.7284504, -3.320646, 1, 0, 0, 1, 1,
-1.276123, -1.166744, -0.4710673, 0, 0, 0, 1, 1,
-1.274126, -1.196099, -3.852268, 0, 0, 0, 1, 1,
-1.271554, 1.905525, -0.1822718, 0, 0, 0, 1, 1,
-1.262242, -1.227234, -1.94541, 0, 0, 0, 1, 1,
-1.261437, -1.07835, -1.808556, 0, 0, 0, 1, 1,
-1.242877, -1.09887, -2.896927, 0, 0, 0, 1, 1,
-1.240066, 0.3877485, 0.6596465, 0, 0, 0, 1, 1,
-1.238642, -0.3360263, -1.492435, 1, 1, 1, 1, 1,
-1.236238, 0.933709, -0.7418008, 1, 1, 1, 1, 1,
-1.221988, 0.8476987, -0.4964211, 1, 1, 1, 1, 1,
-1.221184, 0.2535026, -0.9951743, 1, 1, 1, 1, 1,
-1.215037, 0.620118, -1.613976, 1, 1, 1, 1, 1,
-1.21205, 2.117501, -2.123474, 1, 1, 1, 1, 1,
-1.210378, -0.2816006, 0.5112445, 1, 1, 1, 1, 1,
-1.201438, -0.3279901, -2.25233, 1, 1, 1, 1, 1,
-1.192734, -1.134878, -2.204612, 1, 1, 1, 1, 1,
-1.18987, -1.598995, -1.4122, 1, 1, 1, 1, 1,
-1.185894, 0.5357954, -0.1932907, 1, 1, 1, 1, 1,
-1.185708, -0.8135412, -2.212174, 1, 1, 1, 1, 1,
-1.182596, 0.5039613, -2.791813, 1, 1, 1, 1, 1,
-1.181826, 0.5620702, -1.281195, 1, 1, 1, 1, 1,
-1.170042, -0.006166221, -1.411613, 1, 1, 1, 1, 1,
-1.154862, -1.002109, -3.051061, 0, 0, 1, 1, 1,
-1.149096, -1.230606, -2.922688, 1, 0, 0, 1, 1,
-1.148844, 1.24923, 0.6952338, 1, 0, 0, 1, 1,
-1.139619, 0.2275025, -1.463206, 1, 0, 0, 1, 1,
-1.134874, -0.4987504, -1.20441, 1, 0, 0, 1, 1,
-1.128653, 1.012792, -1.191862, 1, 0, 0, 1, 1,
-1.125616, 0.9125847, -0.8410411, 0, 0, 0, 1, 1,
-1.118988, 1.398574, -0.6134591, 0, 0, 0, 1, 1,
-1.106801, 0.5902548, 1.319804, 0, 0, 0, 1, 1,
-1.102945, -0.2521367, -2.796793, 0, 0, 0, 1, 1,
-1.099471, -0.366002, -0.4114415, 0, 0, 0, 1, 1,
-1.096562, 1.058592, -1.584988, 0, 0, 0, 1, 1,
-1.091587, 0.09437849, -0.7016765, 0, 0, 0, 1, 1,
-1.081414, -1.107296, -1.863003, 1, 1, 1, 1, 1,
-1.076277, 0.02652911, -1.884141, 1, 1, 1, 1, 1,
-1.075512, -0.8249786, -3.499215, 1, 1, 1, 1, 1,
-1.075319, -1.486762, -2.538131, 1, 1, 1, 1, 1,
-1.074801, -0.2845387, -3.005552, 1, 1, 1, 1, 1,
-1.066013, 1.600084, 0.06259091, 1, 1, 1, 1, 1,
-1.065296, -1.906311, -3.298609, 1, 1, 1, 1, 1,
-1.060176, 0.7316018, -2.558869, 1, 1, 1, 1, 1,
-1.058291, -1.28378, -2.471467, 1, 1, 1, 1, 1,
-1.058277, -0.5955888, -2.83462, 1, 1, 1, 1, 1,
-1.055236, 1.956411, 0.7636753, 1, 1, 1, 1, 1,
-1.050252, -0.7276717, -2.735441, 1, 1, 1, 1, 1,
-1.044677, -0.3415938, -1.565777, 1, 1, 1, 1, 1,
-1.043149, -0.3956489, -2.405598, 1, 1, 1, 1, 1,
-1.042272, 0.2269637, -2.91572, 1, 1, 1, 1, 1,
-1.041522, 0.07612668, -2.462833, 0, 0, 1, 1, 1,
-1.033442, 0.3917829, -2.090227, 1, 0, 0, 1, 1,
-1.027733, 1.487597, -0.4430645, 1, 0, 0, 1, 1,
-1.026957, -0.1830036, -2.079891, 1, 0, 0, 1, 1,
-1.007475, -1.408622, -2.266095, 1, 0, 0, 1, 1,
-1.007325, 0.1176998, -1.67025, 1, 0, 0, 1, 1,
-1.004348, 0.0659429, -0.08998842, 0, 0, 0, 1, 1,
-1.003994, 2.406569, -2.515511, 0, 0, 0, 1, 1,
-1.003717, 0.4659547, -0.8782733, 0, 0, 0, 1, 1,
-1.003307, -0.1486611, -1.546999, 0, 0, 0, 1, 1,
-1.001082, 0.1442232, -1.23415, 0, 0, 0, 1, 1,
-0.9945713, 0.7447903, -0.6765485, 0, 0, 0, 1, 1,
-0.9873371, -0.2612472, -1.669999, 0, 0, 0, 1, 1,
-0.9872916, 0.6911366, -3.33392, 1, 1, 1, 1, 1,
-0.9849458, -0.7510458, -2.939143, 1, 1, 1, 1, 1,
-0.9837519, 1.99681, 0.4183143, 1, 1, 1, 1, 1,
-0.9679723, -0.6422126, -2.498765, 1, 1, 1, 1, 1,
-0.9676079, 1.342449, -1.039415, 1, 1, 1, 1, 1,
-0.9634329, -1.348603, -2.181594, 1, 1, 1, 1, 1,
-0.9575443, 0.04406133, -2.208954, 1, 1, 1, 1, 1,
-0.9460964, -0.4763581, -3.11818, 1, 1, 1, 1, 1,
-0.941068, -1.208524, -3.660168, 1, 1, 1, 1, 1,
-0.9405884, 1.300392, -1.497552, 1, 1, 1, 1, 1,
-0.9401662, -0.8045071, -3.470647, 1, 1, 1, 1, 1,
-0.9383634, 1.758497, -0.6024333, 1, 1, 1, 1, 1,
-0.9321696, 0.3263434, -1.334426, 1, 1, 1, 1, 1,
-0.9250628, 0.4709675, -1.441933, 1, 1, 1, 1, 1,
-0.9246166, -2.411304, -3.870984, 1, 1, 1, 1, 1,
-0.914622, 0.986773, -1.175937, 0, 0, 1, 1, 1,
-0.9125051, 0.6143938, 0.44351, 1, 0, 0, 1, 1,
-0.911552, 1.078499, -0.06195966, 1, 0, 0, 1, 1,
-0.9060743, -0.7548504, -3.539565, 1, 0, 0, 1, 1,
-0.9056811, 1.207341, -1.784706, 1, 0, 0, 1, 1,
-0.904217, 0.8648171, 0.2490833, 1, 0, 0, 1, 1,
-0.9036239, 1.252155, -1.146778, 0, 0, 0, 1, 1,
-0.9023682, 1.277067, 1.054939, 0, 0, 0, 1, 1,
-0.9016359, 0.9053472, -1.177144, 0, 0, 0, 1, 1,
-0.9015578, -0.1436189, -0.9642726, 0, 0, 0, 1, 1,
-0.8974847, -0.5177214, -3.437603, 0, 0, 0, 1, 1,
-0.8944598, -1.137336, -1.833689, 0, 0, 0, 1, 1,
-0.8934762, -1.52737, -2.541345, 0, 0, 0, 1, 1,
-0.8920051, 2.273626, -0.8572447, 1, 1, 1, 1, 1,
-0.8883021, 0.6288943, -1.753662, 1, 1, 1, 1, 1,
-0.8873634, 0.3367521, -0.9822503, 1, 1, 1, 1, 1,
-0.8862718, 0.7851767, -2.19481, 1, 1, 1, 1, 1,
-0.8711072, 0.03231825, -0.4126157, 1, 1, 1, 1, 1,
-0.8689128, -0.01205933, -1.817013, 1, 1, 1, 1, 1,
-0.868378, -0.6166524, -1.756239, 1, 1, 1, 1, 1,
-0.8658133, -0.08601047, -1.515063, 1, 1, 1, 1, 1,
-0.8642624, -1.698245, -3.503462, 1, 1, 1, 1, 1,
-0.8569316, 0.9707018, -1.437094, 1, 1, 1, 1, 1,
-0.8526478, -0.09497397, -2.024175, 1, 1, 1, 1, 1,
-0.8512195, 2.287211, -0.5568066, 1, 1, 1, 1, 1,
-0.8486305, 0.7210855, -0.3788037, 1, 1, 1, 1, 1,
-0.8468696, 0.2343272, -1.601619, 1, 1, 1, 1, 1,
-0.8462509, 1.070128, -1.462547, 1, 1, 1, 1, 1,
-0.8380398, -0.04595853, -1.909391, 0, 0, 1, 1, 1,
-0.8338861, 0.4808739, -0.8123701, 1, 0, 0, 1, 1,
-0.8257828, 1.048186, -2.031701, 1, 0, 0, 1, 1,
-0.8227322, 1.044407, 0.3044946, 1, 0, 0, 1, 1,
-0.8125212, -0.004005352, -1.908368, 1, 0, 0, 1, 1,
-0.806026, 1.175185, 1.299155, 1, 0, 0, 1, 1,
-0.8041159, -1.162011, -4.338719, 0, 0, 0, 1, 1,
-0.8015861, -0.7964642, -0.9707236, 0, 0, 0, 1, 1,
-0.7985187, 1.68199, -0.899084, 0, 0, 0, 1, 1,
-0.7897319, 1.220719, -2.116299, 0, 0, 0, 1, 1,
-0.7892855, -1.431409, -2.11083, 0, 0, 0, 1, 1,
-0.7887766, -0.2250891, -2.145844, 0, 0, 0, 1, 1,
-0.7876285, 0.222311, -1.400997, 0, 0, 0, 1, 1,
-0.7852848, -0.8308471, -2.208879, 1, 1, 1, 1, 1,
-0.7810252, -1.210437, -2.986312, 1, 1, 1, 1, 1,
-0.7758608, -0.9101347, -3.37277, 1, 1, 1, 1, 1,
-0.7758425, 0.7206305, -2.154281, 1, 1, 1, 1, 1,
-0.7707853, -0.5058228, -1.482258, 1, 1, 1, 1, 1,
-0.7666053, -1.615128, -1.484547, 1, 1, 1, 1, 1,
-0.7609946, -1.10484, -1.920151, 1, 1, 1, 1, 1,
-0.753701, 0.3548687, -0.2683896, 1, 1, 1, 1, 1,
-0.7483067, -1.293709, -2.915672, 1, 1, 1, 1, 1,
-0.7450302, 0.1553657, -0.9634232, 1, 1, 1, 1, 1,
-0.7411779, -0.8209663, -2.700824, 1, 1, 1, 1, 1,
-0.7361834, -0.4465011, -3.495536, 1, 1, 1, 1, 1,
-0.734792, 1.547, 0.6913062, 1, 1, 1, 1, 1,
-0.7276736, 0.01228703, -1.419058, 1, 1, 1, 1, 1,
-0.7256801, 1.847011, 0.07756306, 1, 1, 1, 1, 1,
-0.7192993, -1.447852, -2.064899, 0, 0, 1, 1, 1,
-0.7135193, -0.1212104, -1.415936, 1, 0, 0, 1, 1,
-0.7083053, -0.4907307, -1.338451, 1, 0, 0, 1, 1,
-0.7033179, -1.133919, -3.361947, 1, 0, 0, 1, 1,
-0.7016973, 1.087668, -0.8617049, 1, 0, 0, 1, 1,
-0.6928691, 2.159396, -2.201505, 1, 0, 0, 1, 1,
-0.6919654, 0.1889586, -0.6977432, 0, 0, 0, 1, 1,
-0.6810756, -0.6644293, -1.637052, 0, 0, 0, 1, 1,
-0.6786543, -0.7938157, -1.577823, 0, 0, 0, 1, 1,
-0.6714364, -0.2001526, -2.51334, 0, 0, 0, 1, 1,
-0.6699108, -1.358653, -2.51182, 0, 0, 0, 1, 1,
-0.6687937, -1.372859, -3.433728, 0, 0, 0, 1, 1,
-0.6667126, -0.04598157, -2.042655, 0, 0, 0, 1, 1,
-0.6654353, 0.3782901, -0.5924537, 1, 1, 1, 1, 1,
-0.6622202, -1.082175, -1.769096, 1, 1, 1, 1, 1,
-0.6607442, 0.1495116, -1.347146, 1, 1, 1, 1, 1,
-0.6560022, 0.937622, 0.001254465, 1, 1, 1, 1, 1,
-0.6529875, 0.1608204, -1.26129, 1, 1, 1, 1, 1,
-0.6487498, -1.346414, -2.893194, 1, 1, 1, 1, 1,
-0.6446075, 2.404176, 0.8031297, 1, 1, 1, 1, 1,
-0.6419161, -2.416928, -3.618988, 1, 1, 1, 1, 1,
-0.63839, -0.78754, -2.490548, 1, 1, 1, 1, 1,
-0.6381137, -0.4414558, -4.295774, 1, 1, 1, 1, 1,
-0.6337516, 1.874985, -0.09927275, 1, 1, 1, 1, 1,
-0.6304586, -0.08887151, -0.9370716, 1, 1, 1, 1, 1,
-0.6288899, 0.5098963, 1.283131, 1, 1, 1, 1, 1,
-0.6228169, 0.6195997, -0.8316469, 1, 1, 1, 1, 1,
-0.6170568, 0.2181208, -1.068895, 1, 1, 1, 1, 1,
-0.6158049, 0.6462126, -0.9223632, 0, 0, 1, 1, 1,
-0.615123, 0.9217501, -2.121637, 1, 0, 0, 1, 1,
-0.6112431, -0.0632927, -2.730443, 1, 0, 0, 1, 1,
-0.6111609, -0.903783, -2.241889, 1, 0, 0, 1, 1,
-0.6104223, -1.432428, -2.475816, 1, 0, 0, 1, 1,
-0.6064611, -0.6248568, -0.9856811, 1, 0, 0, 1, 1,
-0.606418, -0.3301707, -2.793946, 0, 0, 0, 1, 1,
-0.6055335, -0.9932635, -1.654333, 0, 0, 0, 1, 1,
-0.603291, 0.6508213, -0.2130787, 0, 0, 0, 1, 1,
-0.6026447, -0.3379383, -1.218562, 0, 0, 0, 1, 1,
-0.6003938, 1.505866, -2.875934, 0, 0, 0, 1, 1,
-0.5994052, -1.505473, -3.353844, 0, 0, 0, 1, 1,
-0.5993957, 0.1172151, -2.449519, 0, 0, 0, 1, 1,
-0.5984543, 1.069196, 0.5290684, 1, 1, 1, 1, 1,
-0.5948083, 0.5766, -2.092426, 1, 1, 1, 1, 1,
-0.5906708, -1.744163, -2.259386, 1, 1, 1, 1, 1,
-0.5880222, -1.758521, -1.959206, 1, 1, 1, 1, 1,
-0.5867834, -2.568397, -3.94744, 1, 1, 1, 1, 1,
-0.5867583, 0.8192059, -0.668151, 1, 1, 1, 1, 1,
-0.5813958, -0.6010538, -1.089656, 1, 1, 1, 1, 1,
-0.5787323, 1.343786, 0.08576723, 1, 1, 1, 1, 1,
-0.5718012, -0.5251626, -4.047388, 1, 1, 1, 1, 1,
-0.5701763, 1.630264, -0.4494657, 1, 1, 1, 1, 1,
-0.5699938, -0.6522051, -1.525776, 1, 1, 1, 1, 1,
-0.5665228, 0.2011916, 0.050566, 1, 1, 1, 1, 1,
-0.5609524, 1.119138, 0.2047186, 1, 1, 1, 1, 1,
-0.5562572, 0.3368591, -2.340029, 1, 1, 1, 1, 1,
-0.5548869, -0.4234959, -4.297458, 1, 1, 1, 1, 1,
-0.5541215, -1.583903, -1.982067, 0, 0, 1, 1, 1,
-0.5497925, -0.6294984, -2.254061, 1, 0, 0, 1, 1,
-0.5496203, 0.1027812, -0.4940209, 1, 0, 0, 1, 1,
-0.5493943, -0.05267667, -0.7839374, 1, 0, 0, 1, 1,
-0.548148, -1.284393, -3.461818, 1, 0, 0, 1, 1,
-0.5460242, 0.4653819, -0.09460389, 1, 0, 0, 1, 1,
-0.5412557, 1.313563, -2.302305, 0, 0, 0, 1, 1,
-0.5407148, -0.9441964, -2.087083, 0, 0, 0, 1, 1,
-0.5342948, -1.053614, -2.87748, 0, 0, 0, 1, 1,
-0.5332513, 0.3311915, -0.9244533, 0, 0, 0, 1, 1,
-0.525156, 0.876744, -0.439484, 0, 0, 0, 1, 1,
-0.5249743, 0.2809808, -0.4905302, 0, 0, 0, 1, 1,
-0.5181176, 2.0017, -0.5128409, 0, 0, 0, 1, 1,
-0.5116803, 0.9676181, 0.64715, 1, 1, 1, 1, 1,
-0.5112792, 1.019538, -0.5232246, 1, 1, 1, 1, 1,
-0.511194, -0.03358553, -1.600228, 1, 1, 1, 1, 1,
-0.507825, 0.3010434, -0.272032, 1, 1, 1, 1, 1,
-0.5073307, -1.121983, -2.606657, 1, 1, 1, 1, 1,
-0.5052555, 1.527539, 0.153766, 1, 1, 1, 1, 1,
-0.495046, 0.8526538, 0.3729622, 1, 1, 1, 1, 1,
-0.4948575, -0.7872715, -3.676461, 1, 1, 1, 1, 1,
-0.4931851, -0.5066851, -1.158687, 1, 1, 1, 1, 1,
-0.4929564, -0.2016449, -3.398135, 1, 1, 1, 1, 1,
-0.4921217, -1.794484, -1.329129, 1, 1, 1, 1, 1,
-0.4858719, 0.727499, -0.1014085, 1, 1, 1, 1, 1,
-0.4853464, 1.593999, 0.1845552, 1, 1, 1, 1, 1,
-0.4847489, -0.401038, -1.397568, 1, 1, 1, 1, 1,
-0.4837842, 0.408095, 0.1650279, 1, 1, 1, 1, 1,
-0.4823661, -1.039749, -2.825923, 0, 0, 1, 1, 1,
-0.4806472, -2.193931, -2.67843, 1, 0, 0, 1, 1,
-0.4795877, 1.828685, -0.09363396, 1, 0, 0, 1, 1,
-0.4745014, -0.8105884, -0.9084277, 1, 0, 0, 1, 1,
-0.4712882, -0.4920514, -0.9584215, 1, 0, 0, 1, 1,
-0.4701561, -0.03286199, -0.2626611, 1, 0, 0, 1, 1,
-0.4701273, 1.401087, -1.991519, 0, 0, 0, 1, 1,
-0.4648736, -0.317982, -2.230992, 0, 0, 0, 1, 1,
-0.4618687, 1.768064, 0.3058525, 0, 0, 0, 1, 1,
-0.4571597, 0.9814395, -1.747297, 0, 0, 0, 1, 1,
-0.4562556, -1.401877, -2.177171, 0, 0, 0, 1, 1,
-0.4549345, -0.4198994, -3.58853, 0, 0, 0, 1, 1,
-0.4530098, 0.4289, -1.274889, 0, 0, 0, 1, 1,
-0.4505356, -0.4205346, -2.548653, 1, 1, 1, 1, 1,
-0.4494142, -0.4817643, -1.941213, 1, 1, 1, 1, 1,
-0.4483277, -0.253271, -0.7546549, 1, 1, 1, 1, 1,
-0.4469306, 1.607746, 0.2540639, 1, 1, 1, 1, 1,
-0.4468511, -0.4614544, -2.101052, 1, 1, 1, 1, 1,
-0.4462459, 1.554354, 1.996739, 1, 1, 1, 1, 1,
-0.444775, -0.9219121, -3.469373, 1, 1, 1, 1, 1,
-0.4335554, -0.5203896, -0.9881251, 1, 1, 1, 1, 1,
-0.4325655, -2.514805, -3.62975, 1, 1, 1, 1, 1,
-0.4302948, -0.2630184, -0.485072, 1, 1, 1, 1, 1,
-0.4247321, -0.3512271, -1.714513, 1, 1, 1, 1, 1,
-0.4232328, -1.062532, -3.922205, 1, 1, 1, 1, 1,
-0.4230973, 1.58839, -0.8034618, 1, 1, 1, 1, 1,
-0.4211363, 0.8784822, -0.9028687, 1, 1, 1, 1, 1,
-0.412376, 0.3580733, -0.197714, 1, 1, 1, 1, 1,
-0.4106996, -1.416367, -3.766473, 0, 0, 1, 1, 1,
-0.4083812, 0.9115652, -1.7457, 1, 0, 0, 1, 1,
-0.4079864, -1.387009, -5.242932, 1, 0, 0, 1, 1,
-0.4013039, -0.3490529, -1.983464, 1, 0, 0, 1, 1,
-0.4010292, 0.8619468, -1.009054, 1, 0, 0, 1, 1,
-0.4007508, 0.3186081, -1.683397, 1, 0, 0, 1, 1,
-0.3939364, 2.426429, -1.516023, 0, 0, 0, 1, 1,
-0.3894333, -1.351456, -4.278681, 0, 0, 0, 1, 1,
-0.3880965, -1.480091, -3.214936, 0, 0, 0, 1, 1,
-0.3869066, -1.210019, -5.393893, 0, 0, 0, 1, 1,
-0.3858474, 0.404144, -1.295316, 0, 0, 0, 1, 1,
-0.3834757, -1.144666, -3.403235, 0, 0, 0, 1, 1,
-0.3828471, 0.9173868, 2.782508, 0, 0, 0, 1, 1,
-0.3813486, -0.6795877, -2.88763, 1, 1, 1, 1, 1,
-0.3807907, 0.8166543, 0.2571542, 1, 1, 1, 1, 1,
-0.3747678, -1.734378, -5.487452, 1, 1, 1, 1, 1,
-0.3744751, 0.4680797, -2.241452, 1, 1, 1, 1, 1,
-0.3701091, 0.3279041, -0.1551467, 1, 1, 1, 1, 1,
-0.3689571, -0.7605646, -1.19683, 1, 1, 1, 1, 1,
-0.3675884, -0.9476651, -2.426764, 1, 1, 1, 1, 1,
-0.3568033, 0.2382102, -1.60842, 1, 1, 1, 1, 1,
-0.3563123, 1.782858, -2.74446, 1, 1, 1, 1, 1,
-0.3496005, 1.813094, -2.122305, 1, 1, 1, 1, 1,
-0.3447582, 0.3381183, -0.8120208, 1, 1, 1, 1, 1,
-0.3433836, 0.608739, -0.1529478, 1, 1, 1, 1, 1,
-0.3433684, -0.1173173, -1.496746, 1, 1, 1, 1, 1,
-0.3413254, -0.7877077, -4.658766, 1, 1, 1, 1, 1,
-0.3392262, -1.084155, -3.933221, 1, 1, 1, 1, 1,
-0.3303806, 0.1791073, -1.099665, 0, 0, 1, 1, 1,
-0.3294987, 0.6148499, -1.632593, 1, 0, 0, 1, 1,
-0.3289077, 0.7909715, -0.5610822, 1, 0, 0, 1, 1,
-0.3277788, 0.856157, -0.5287696, 1, 0, 0, 1, 1,
-0.3268681, -1.111203, -1.070712, 1, 0, 0, 1, 1,
-0.3222078, 1.657989, -0.7669259, 1, 0, 0, 1, 1,
-0.3212985, -0.748955, -0.3955625, 0, 0, 0, 1, 1,
-0.3162737, -0.855901, -2.813122, 0, 0, 0, 1, 1,
-0.3158576, -1.183257, -4.404408, 0, 0, 0, 1, 1,
-0.3096456, -0.1532239, -3.328274, 0, 0, 0, 1, 1,
-0.3002702, 0.7324711, 0.1059116, 0, 0, 0, 1, 1,
-0.2972201, 1.169109, 1.841776, 0, 0, 0, 1, 1,
-0.2959269, 0.2851556, -2.327052, 0, 0, 0, 1, 1,
-0.2957755, 0.1502912, -2.708229, 1, 1, 1, 1, 1,
-0.2884086, -0.1520145, -2.358916, 1, 1, 1, 1, 1,
-0.2880031, -0.7864224, -2.403892, 1, 1, 1, 1, 1,
-0.2847865, 1.253619, -0.6272424, 1, 1, 1, 1, 1,
-0.2819074, -0.8620855, -1.714429, 1, 1, 1, 1, 1,
-0.280639, 1.182622, 2.351284, 1, 1, 1, 1, 1,
-0.2786232, -0.2800936, -1.275764, 1, 1, 1, 1, 1,
-0.2767656, 1.868183, -0.7636119, 1, 1, 1, 1, 1,
-0.2766979, 1.167079, -1.654114, 1, 1, 1, 1, 1,
-0.2763659, 0.3410655, 0.1839949, 1, 1, 1, 1, 1,
-0.2753508, -0.3737856, -2.221235, 1, 1, 1, 1, 1,
-0.2753048, 0.388449, -0.4545069, 1, 1, 1, 1, 1,
-0.2726656, 0.3128033, 0.165219, 1, 1, 1, 1, 1,
-0.2702849, 0.639805, 0.1541915, 1, 1, 1, 1, 1,
-0.2638817, -0.2672486, -4.159218, 1, 1, 1, 1, 1,
-0.2634648, 2.480912, 0.1502796, 0, 0, 1, 1, 1,
-0.2633407, 1.451534, -1.250211, 1, 0, 0, 1, 1,
-0.2531831, -0.3190526, -2.607346, 1, 0, 0, 1, 1,
-0.2479395, 1.054071, -0.9523169, 1, 0, 0, 1, 1,
-0.2461096, 0.8012428, 0.614949, 1, 0, 0, 1, 1,
-0.2445679, 0.2469427, -0.3733608, 1, 0, 0, 1, 1,
-0.2416001, 3.077537, 1.00375, 0, 0, 0, 1, 1,
-0.241445, -0.0772149, -2.035204, 0, 0, 0, 1, 1,
-0.2400566, 0.9701723, -1.179607, 0, 0, 0, 1, 1,
-0.2386408, 1.520933, -0.1503636, 0, 0, 0, 1, 1,
-0.2376247, 0.4503051, -0.3054, 0, 0, 0, 1, 1,
-0.2367653, -2.109253, -2.572704, 0, 0, 0, 1, 1,
-0.233988, 1.088018, -1.294066, 0, 0, 0, 1, 1,
-0.2280881, -0.07204, -1.272157, 1, 1, 1, 1, 1,
-0.2249627, -0.7794151, -2.253189, 1, 1, 1, 1, 1,
-0.2236257, 1.513892, 0.2796184, 1, 1, 1, 1, 1,
-0.2212529, 0.03643466, -1.823637, 1, 1, 1, 1, 1,
-0.2170352, 1.408782, -3.169312, 1, 1, 1, 1, 1,
-0.2157235, -0.5276193, -3.020518, 1, 1, 1, 1, 1,
-0.2140892, 0.4422215, 1.591184, 1, 1, 1, 1, 1,
-0.2122766, -1.090761, -3.107571, 1, 1, 1, 1, 1,
-0.209956, -0.1606104, -4.652148, 1, 1, 1, 1, 1,
-0.2088134, -0.9008219, -1.605651, 1, 1, 1, 1, 1,
-0.2066998, 0.914121, -0.9561442, 1, 1, 1, 1, 1,
-0.206447, -0.3583605, -1.815683, 1, 1, 1, 1, 1,
-0.2025001, -0.4172856, -2.828603, 1, 1, 1, 1, 1,
-0.2001788, -1.378158, -1.871783, 1, 1, 1, 1, 1,
-0.1997988, 0.4999196, 0.1401035, 1, 1, 1, 1, 1,
-0.1996455, 0.4629579, 0.09422325, 0, 0, 1, 1, 1,
-0.1985585, -0.9251289, -3.971159, 1, 0, 0, 1, 1,
-0.1968304, 0.7687093, -1.328143, 1, 0, 0, 1, 1,
-0.1941772, -0.5143985, -1.064425, 1, 0, 0, 1, 1,
-0.1934598, -1.741079, -2.767901, 1, 0, 0, 1, 1,
-0.193155, -0.4881092, -1.430799, 1, 0, 0, 1, 1,
-0.1924303, 3.016679, 2.177228, 0, 0, 0, 1, 1,
-0.1902072, 1.24849, -0.5209346, 0, 0, 0, 1, 1,
-0.1893831, 0.6671141, -0.9104176, 0, 0, 0, 1, 1,
-0.1849618, -1.369595, -2.382677, 0, 0, 0, 1, 1,
-0.1764721, 0.3333337, -0.6085348, 0, 0, 0, 1, 1,
-0.1643674, -2.742287, -3.755264, 0, 0, 0, 1, 1,
-0.1640722, 0.9385206, -0.910863, 0, 0, 0, 1, 1,
-0.1602329, -0.6383451, -4.151153, 1, 1, 1, 1, 1,
-0.1525647, 0.3404451, 0.0592976, 1, 1, 1, 1, 1,
-0.1479798, -1.911212, -5.183927, 1, 1, 1, 1, 1,
-0.1466305, -0.07303585, -3.143322, 1, 1, 1, 1, 1,
-0.141874, 1.060792, -0.508999, 1, 1, 1, 1, 1,
-0.1417059, 0.4700744, -0.1603331, 1, 1, 1, 1, 1,
-0.1413314, -0.07734222, -2.856439, 1, 1, 1, 1, 1,
-0.1399748, 1.689682, 1.305155, 1, 1, 1, 1, 1,
-0.1374965, 1.347255, -1.568377, 1, 1, 1, 1, 1,
-0.1360664, 0.01163068, -0.5790011, 1, 1, 1, 1, 1,
-0.1351701, 0.3463059, -0.3093964, 1, 1, 1, 1, 1,
-0.1343795, -1.288133, -3.262302, 1, 1, 1, 1, 1,
-0.1331967, 2.072144, 0.4331906, 1, 1, 1, 1, 1,
-0.1304038, 0.09599119, -0.376058, 1, 1, 1, 1, 1,
-0.1258166, -0.3543088, -1.990296, 1, 1, 1, 1, 1,
-0.1217474, 0.9410729, -1.176265, 0, 0, 1, 1, 1,
-0.1190569, 0.8097612, -0.6202147, 1, 0, 0, 1, 1,
-0.1184861, -1.631371, -3.637958, 1, 0, 0, 1, 1,
-0.1156214, -1.410849, -3.563102, 1, 0, 0, 1, 1,
-0.1155561, -1.321694, -4.61991, 1, 0, 0, 1, 1,
-0.1135836, 0.821035, -0.4764544, 1, 0, 0, 1, 1,
-0.1115226, -0.8051656, -3.700404, 0, 0, 0, 1, 1,
-0.1100308, -1.626876, -4.120542, 0, 0, 0, 1, 1,
-0.1095798, 0.008635857, -0.5763454, 0, 0, 0, 1, 1,
-0.1062388, 2.120954, 0.4037389, 0, 0, 0, 1, 1,
-0.1024927, -0.4237512, -2.199268, 0, 0, 0, 1, 1,
-0.09995309, 0.09717806, -1.032863, 0, 0, 0, 1, 1,
-0.09312551, 0.4627986, -0.93589, 0, 0, 0, 1, 1,
-0.08371881, -0.09243198, 0.4369063, 1, 1, 1, 1, 1,
-0.07899996, -1.734962, -3.602103, 1, 1, 1, 1, 1,
-0.07828677, 1.271216, 0.6819841, 1, 1, 1, 1, 1,
-0.07406702, 1.309503, -2.0566, 1, 1, 1, 1, 1,
-0.07387125, 1.393191, -1.20312, 1, 1, 1, 1, 1,
-0.07329185, -0.299115, -4.812923, 1, 1, 1, 1, 1,
-0.0652867, -0.864595, -2.228914, 1, 1, 1, 1, 1,
-0.06223707, -0.7444234, -3.298425, 1, 1, 1, 1, 1,
-0.06010078, 0.2094843, 1.082801, 1, 1, 1, 1, 1,
-0.04441421, 2.031177, 0.5991039, 1, 1, 1, 1, 1,
-0.04243585, 0.3315226, 1.144428, 1, 1, 1, 1, 1,
-0.03547424, 0.5397329, -1.107939, 1, 1, 1, 1, 1,
-0.03354326, 1.283699, 1.224374, 1, 1, 1, 1, 1,
-0.03321546, -0.09309752, -4.934773, 1, 1, 1, 1, 1,
-0.03053871, 0.8842851, -0.0837412, 1, 1, 1, 1, 1,
-0.025256, 1.113325, 0.3776653, 0, 0, 1, 1, 1,
-0.01956682, -0.2166606, -2.448606, 1, 0, 0, 1, 1,
-0.01858012, 0.1254791, 1.504819, 1, 0, 0, 1, 1,
-0.01731019, 0.4196104, -2.088791, 1, 0, 0, 1, 1,
-0.01666812, 0.2690356, -0.4841661, 1, 0, 0, 1, 1,
-0.01647564, -1.263345, -3.226564, 1, 0, 0, 1, 1,
-0.01643232, 0.5509858, 0.1130548, 0, 0, 0, 1, 1,
-0.00837148, 0.04754938, 1.503672, 0, 0, 0, 1, 1,
-0.005805768, 0.4731094, 0.1882741, 0, 0, 0, 1, 1,
-0.0001275049, 0.8856279, 0.1664145, 0, 0, 0, 1, 1,
0.001115478, -1.221154, 3.415631, 0, 0, 0, 1, 1,
0.00140748, -0.003592082, 2.921377, 0, 0, 0, 1, 1,
0.001468948, -0.3725777, 3.120605, 0, 0, 0, 1, 1,
0.001521065, -0.3424617, 4.195637, 1, 1, 1, 1, 1,
0.006824333, -0.6553361, 2.96138, 1, 1, 1, 1, 1,
0.009530784, 0.7912374, 0.2502592, 1, 1, 1, 1, 1,
0.009642565, 0.009554854, 0.1935895, 1, 1, 1, 1, 1,
0.01011734, 0.4167117, -0.2379165, 1, 1, 1, 1, 1,
0.01546572, -0.5099488, 5.381821, 1, 1, 1, 1, 1,
0.0172872, -0.2530783, 2.122513, 1, 1, 1, 1, 1,
0.023536, -1.088769, 2.256826, 1, 1, 1, 1, 1,
0.03713272, 0.06386399, -0.4988539, 1, 1, 1, 1, 1,
0.03802986, -0.3117115, 4.778622, 1, 1, 1, 1, 1,
0.03808776, 1.005362, -0.6054765, 1, 1, 1, 1, 1,
0.0400362, -0.08182649, 3.843524, 1, 1, 1, 1, 1,
0.04037326, 0.3645387, 1.665199, 1, 1, 1, 1, 1,
0.04101671, -1.820992, 2.712913, 1, 1, 1, 1, 1,
0.04935822, 1.614905, 1.485821, 1, 1, 1, 1, 1,
0.05580476, -0.9830731, 3.688447, 0, 0, 1, 1, 1,
0.06175784, 2.04152, 0.3504414, 1, 0, 0, 1, 1,
0.064734, -0.549728, 2.586456, 1, 0, 0, 1, 1,
0.06476448, 1.773913, -3.219525, 1, 0, 0, 1, 1,
0.06691936, -1.262407, 3.437063, 1, 0, 0, 1, 1,
0.07414663, 0.8256904, 0.4116018, 1, 0, 0, 1, 1,
0.07535544, 2.165066, 1.274275, 0, 0, 0, 1, 1,
0.07902086, 0.6427484, 0.8383445, 0, 0, 0, 1, 1,
0.08025154, -0.5870562, 2.26117, 0, 0, 0, 1, 1,
0.09034266, 0.08012503, 2.648318, 0, 0, 0, 1, 1,
0.09175431, 0.7450338, -1.452467, 0, 0, 0, 1, 1,
0.09332516, 0.26369, 1.806165, 0, 0, 0, 1, 1,
0.09359492, 1.455614, -2.007723, 0, 0, 0, 1, 1,
0.09755726, 2.657401, 0.1511005, 1, 1, 1, 1, 1,
0.1003161, 0.3022103, 0.1655261, 1, 1, 1, 1, 1,
0.1101103, 0.3463625, 1.083878, 1, 1, 1, 1, 1,
0.1106783, 0.1377184, 1.151668, 1, 1, 1, 1, 1,
0.1110903, -1.469706, 4.38341, 1, 1, 1, 1, 1,
0.1112065, 0.2557179, -0.2896786, 1, 1, 1, 1, 1,
0.116029, 0.9958191, 0.02508426, 1, 1, 1, 1, 1,
0.1166877, -2.119683, 5.428539, 1, 1, 1, 1, 1,
0.1170364, 0.3013451, 2.124157, 1, 1, 1, 1, 1,
0.1223858, -0.9627292, 3.725946, 1, 1, 1, 1, 1,
0.1227804, 0.3832117, -0.2434775, 1, 1, 1, 1, 1,
0.1260513, -1.117709, 3.858311, 1, 1, 1, 1, 1,
0.1274869, 0.6806238, -0.1017771, 1, 1, 1, 1, 1,
0.1282856, 0.1567318, 0.3351813, 1, 1, 1, 1, 1,
0.1332436, 0.2392759, -0.5436842, 1, 1, 1, 1, 1,
0.134652, 1.119027, -0.0728977, 0, 0, 1, 1, 1,
0.1377264, -0.7958047, 2.842385, 1, 0, 0, 1, 1,
0.1426418, 1.594866, 0.3865187, 1, 0, 0, 1, 1,
0.1490747, 0.3012944, 0.9931722, 1, 0, 0, 1, 1,
0.1544746, 0.541505, 0.763787, 1, 0, 0, 1, 1,
0.1594606, 0.1852751, -0.8151124, 1, 0, 0, 1, 1,
0.1604315, -0.2399536, 2.430238, 0, 0, 0, 1, 1,
0.1637029, 0.4527362, -1.027219, 0, 0, 0, 1, 1,
0.1641144, -2.080809, 4.233059, 0, 0, 0, 1, 1,
0.1722702, 1.476669, -0.2384498, 0, 0, 0, 1, 1,
0.1762393, -1.258001, 3.303787, 0, 0, 0, 1, 1,
0.1805608, -0.06150523, 3.415476, 0, 0, 0, 1, 1,
0.1825346, 0.169012, -1.725215, 0, 0, 0, 1, 1,
0.1858326, 1.535276, 1.326277, 1, 1, 1, 1, 1,
0.1884704, -0.8693196, 3.053372, 1, 1, 1, 1, 1,
0.1908052, -0.3800749, 1.788636, 1, 1, 1, 1, 1,
0.1914332, 2.490686, -0.3847691, 1, 1, 1, 1, 1,
0.1923169, 1.13056, -0.2168167, 1, 1, 1, 1, 1,
0.1933704, 0.9852049, 1.598857, 1, 1, 1, 1, 1,
0.1937699, 0.2044883, 1.135235, 1, 1, 1, 1, 1,
0.1978349, 0.5899795, -0.5666319, 1, 1, 1, 1, 1,
0.1980657, 0.7842032, -0.7275968, 1, 1, 1, 1, 1,
0.2008059, 1.484244, -1.435578, 1, 1, 1, 1, 1,
0.2045686, -0.6925731, 3.419371, 1, 1, 1, 1, 1,
0.2063977, -1.571967, 2.860739, 1, 1, 1, 1, 1,
0.2068119, -1.33639, 4.321963, 1, 1, 1, 1, 1,
0.2072351, 0.6384206, 0.6159185, 1, 1, 1, 1, 1,
0.2113499, 0.5186732, -0.6912194, 1, 1, 1, 1, 1,
0.2118589, -0.6888734, 1.891862, 0, 0, 1, 1, 1,
0.2214396, -1.152399, 0.8386987, 1, 0, 0, 1, 1,
0.2219729, -0.553589, 1.882368, 1, 0, 0, 1, 1,
0.2241397, 1.840397, -1.453693, 1, 0, 0, 1, 1,
0.2281462, -0.8765671, 2.527215, 1, 0, 0, 1, 1,
0.2307217, 0.4326286, -0.7972897, 1, 0, 0, 1, 1,
0.230904, 0.8660268, -0.3707224, 0, 0, 0, 1, 1,
0.2326319, -0.04712613, 1.662351, 0, 0, 0, 1, 1,
0.2335895, 0.3327056, -0.4695008, 0, 0, 0, 1, 1,
0.2377655, -0.03284078, 2.166491, 0, 0, 0, 1, 1,
0.2384351, -1.291102, 2.674901, 0, 0, 0, 1, 1,
0.2459465, -1.374928, 4.092811, 0, 0, 0, 1, 1,
0.2474356, -0.4111854, 2.639688, 0, 0, 0, 1, 1,
0.2489275, 0.7951064, -0.7960665, 1, 1, 1, 1, 1,
0.2497679, -1.717682, 4.605433, 1, 1, 1, 1, 1,
0.2517344, -0.3369555, 0.6913137, 1, 1, 1, 1, 1,
0.2533344, 0.6158006, 0.8841394, 1, 1, 1, 1, 1,
0.2535619, 1.632239, -0.2163737, 1, 1, 1, 1, 1,
0.255474, 0.9125768, 1.338968, 1, 1, 1, 1, 1,
0.2569363, -0.7631979, 1.597317, 1, 1, 1, 1, 1,
0.2586372, 0.2127233, 0.8421844, 1, 1, 1, 1, 1,
0.2603782, -0.9852796, 2.279092, 1, 1, 1, 1, 1,
0.2608593, 0.6089039, -1.831938, 1, 1, 1, 1, 1,
0.2655486, 0.5055279, 1.886932, 1, 1, 1, 1, 1,
0.2679765, 0.4675917, -2.114693, 1, 1, 1, 1, 1,
0.2740342, 0.9672165, -0.6139775, 1, 1, 1, 1, 1,
0.2760763, 0.2357813, 2.015759, 1, 1, 1, 1, 1,
0.2769332, -0.55051, 3.611849, 1, 1, 1, 1, 1,
0.2806701, 0.7945629, -0.4617147, 0, 0, 1, 1, 1,
0.2813391, -2.111637, 2.750201, 1, 0, 0, 1, 1,
0.2900935, -0.4462122, 2.195737, 1, 0, 0, 1, 1,
0.293926, -1.066357, 2.545463, 1, 0, 0, 1, 1,
0.2949215, 0.07201444, 2.453193, 1, 0, 0, 1, 1,
0.2957036, -0.5245304, 2.268047, 1, 0, 0, 1, 1,
0.29935, 0.7192785, -0.2522889, 0, 0, 0, 1, 1,
0.3016598, -0.536585, 3.405296, 0, 0, 0, 1, 1,
0.3021005, 1.042604, -0.09162305, 0, 0, 0, 1, 1,
0.3021442, -0.6906374, 3.7869, 0, 0, 0, 1, 1,
0.3092727, 0.7735467, 0.7126906, 0, 0, 0, 1, 1,
0.315736, -0.3730179, 2.179444, 0, 0, 0, 1, 1,
0.3193658, 2.043048, 1.160024, 0, 0, 0, 1, 1,
0.3222075, 1.481593, -0.1563938, 1, 1, 1, 1, 1,
0.3234911, 0.9860807, -0.8252562, 1, 1, 1, 1, 1,
0.3258845, 0.8319561, 0.2960762, 1, 1, 1, 1, 1,
0.3262433, 1.202248, 0.2050875, 1, 1, 1, 1, 1,
0.328954, -0.7921661, 0.2099117, 1, 1, 1, 1, 1,
0.330977, -0.4119673, 2.891297, 1, 1, 1, 1, 1,
0.3330022, 1.456794, -0.1424658, 1, 1, 1, 1, 1,
0.3358062, 0.115445, 1.936837, 1, 1, 1, 1, 1,
0.3398301, 0.5649964, -0.9058128, 1, 1, 1, 1, 1,
0.3412986, 1.016845, 2.166602, 1, 1, 1, 1, 1,
0.3443247, 2.43261, -0.9319107, 1, 1, 1, 1, 1,
0.346171, 1.909968, 1.88145, 1, 1, 1, 1, 1,
0.3497707, 0.2391109, 0.7246699, 1, 1, 1, 1, 1,
0.3578565, -1.127261, 2.295803, 1, 1, 1, 1, 1,
0.3602504, 0.1476797, 0.8586347, 1, 1, 1, 1, 1,
0.3646909, 1.657348, 0.3980443, 0, 0, 1, 1, 1,
0.3672997, -1.719201, 3.427719, 1, 0, 0, 1, 1,
0.3875568, 0.4102534, 0.3251503, 1, 0, 0, 1, 1,
0.3881987, -1.939346, 4.451252, 1, 0, 0, 1, 1,
0.3897035, 1.251284, 1.445953, 1, 0, 0, 1, 1,
0.3903213, -0.6180117, 2.021053, 1, 0, 0, 1, 1,
0.3921243, -1.915262, 2.068428, 0, 0, 0, 1, 1,
0.3930106, -0.4408237, 0.3524162, 0, 0, 0, 1, 1,
0.403247, -1.440965, 2.269652, 0, 0, 0, 1, 1,
0.4066597, 1.138039, 1.514787, 0, 0, 0, 1, 1,
0.4083917, -0.3996409, 2.588388, 0, 0, 0, 1, 1,
0.4088546, 0.694494, -0.8440551, 0, 0, 0, 1, 1,
0.4095728, 0.1137727, 2.440571, 0, 0, 0, 1, 1,
0.4103642, -1.452194, 4.223537, 1, 1, 1, 1, 1,
0.412314, -0.3303944, 1.668752, 1, 1, 1, 1, 1,
0.4127382, 0.4116876, -0.1438432, 1, 1, 1, 1, 1,
0.4161463, -1.417767, 2.264761, 1, 1, 1, 1, 1,
0.418237, -0.9686468, 4.882295, 1, 1, 1, 1, 1,
0.4251922, -0.8993824, 2.79581, 1, 1, 1, 1, 1,
0.4310002, 0.8153591, 1.450315, 1, 1, 1, 1, 1,
0.4350204, 1.56797, 1.002338, 1, 1, 1, 1, 1,
0.4386741, -1.108186, 3.398899, 1, 1, 1, 1, 1,
0.442827, 0.2940626, 1.248826, 1, 1, 1, 1, 1,
0.443036, -0.293158, 1.900495, 1, 1, 1, 1, 1,
0.4462909, 0.8413947, 0.8086681, 1, 1, 1, 1, 1,
0.4477522, 1.123944, 1.107211, 1, 1, 1, 1, 1,
0.4496996, -0.4864076, 2.791293, 1, 1, 1, 1, 1,
0.4507686, -1.268376, 3.426085, 1, 1, 1, 1, 1,
0.4510468, -1.272879, 1.703547, 0, 0, 1, 1, 1,
0.4603, 2.198726, 0.7266439, 1, 0, 0, 1, 1,
0.4643554, -1.810769, 3.554196, 1, 0, 0, 1, 1,
0.4670289, 0.7818815, 0.9217452, 1, 0, 0, 1, 1,
0.4685615, -1.330988, 3.094941, 1, 0, 0, 1, 1,
0.4693129, -0.2750513, 2.335511, 1, 0, 0, 1, 1,
0.4748551, 0.7615179, 0.820363, 0, 0, 0, 1, 1,
0.4753383, -1.066798, 4.449321, 0, 0, 0, 1, 1,
0.4764605, 0.8865575, 1.154901, 0, 0, 0, 1, 1,
0.4769951, -0.4242203, 1.03848, 0, 0, 0, 1, 1,
0.478012, -1.218357, 3.366016, 0, 0, 0, 1, 1,
0.4797821, 1.754117, -0.6277232, 0, 0, 0, 1, 1,
0.4812294, 0.6454576, 0.268044, 0, 0, 0, 1, 1,
0.4812577, -0.8171592, 2.596004, 1, 1, 1, 1, 1,
0.4897614, -1.506924, 3.852317, 1, 1, 1, 1, 1,
0.4932733, 0.4624098, 0.3973722, 1, 1, 1, 1, 1,
0.4985831, -0.224014, 0.2550105, 1, 1, 1, 1, 1,
0.5036706, -1.62526, 1.946703, 1, 1, 1, 1, 1,
0.5062087, -0.5024806, 3.394288, 1, 1, 1, 1, 1,
0.5106634, -0.03602644, -0.2484351, 1, 1, 1, 1, 1,
0.5119182, 0.9132087, 0.9802212, 1, 1, 1, 1, 1,
0.5175475, -0.09073853, 1.769841, 1, 1, 1, 1, 1,
0.5185043, 0.8765509, 1.952956, 1, 1, 1, 1, 1,
0.5194798, 0.4931608, 2.283189, 1, 1, 1, 1, 1,
0.5205216, 0.8037211, -1.530204, 1, 1, 1, 1, 1,
0.5209253, -0.1547141, 2.63965, 1, 1, 1, 1, 1,
0.5298365, -0.3646552, 0.9186713, 1, 1, 1, 1, 1,
0.5385553, -0.1206288, 0.6714959, 1, 1, 1, 1, 1,
0.5401325, 0.4773481, 0.1804503, 0, 0, 1, 1, 1,
0.5475245, -0.3581609, 1.262856, 1, 0, 0, 1, 1,
0.5494675, -1.438441, 1.685054, 1, 0, 0, 1, 1,
0.5511696, 0.5459734, 1.035824, 1, 0, 0, 1, 1,
0.5512704, 0.5964502, 2.458395, 1, 0, 0, 1, 1,
0.5536548, -0.8372118, 2.797528, 1, 0, 0, 1, 1,
0.5627034, 0.3560437, 0.5247363, 0, 0, 0, 1, 1,
0.5633103, 1.118565, 1.109679, 0, 0, 0, 1, 1,
0.5669329, 0.01515635, 1.14307, 0, 0, 0, 1, 1,
0.5676694, 1.224778, 1.110558, 0, 0, 0, 1, 1,
0.5690098, -1.532602, 3.053503, 0, 0, 0, 1, 1,
0.5746677, 0.7141454, -0.3285756, 0, 0, 0, 1, 1,
0.5846781, 0.1302685, 0.9036031, 0, 0, 0, 1, 1,
0.5850454, -0.900206, 1.761189, 1, 1, 1, 1, 1,
0.5855522, 0.6892116, 0.5422304, 1, 1, 1, 1, 1,
0.5882372, 0.5095479, 0.380903, 1, 1, 1, 1, 1,
0.588356, 0.4135958, 1.372707, 1, 1, 1, 1, 1,
0.5896314, 0.7158496, -0.8435949, 1, 1, 1, 1, 1,
0.5915911, -1.383528, 1.004827, 1, 1, 1, 1, 1,
0.5922241, 0.6747379, 0.1355741, 1, 1, 1, 1, 1,
0.5935079, -0.2765595, 2.987084, 1, 1, 1, 1, 1,
0.5964049, -0.7109487, 2.047436, 1, 1, 1, 1, 1,
0.5970622, -0.6601509, 3.077437, 1, 1, 1, 1, 1,
0.6027374, 0.6305657, -0.2503535, 1, 1, 1, 1, 1,
0.6062455, 0.571126, 0.5897107, 1, 1, 1, 1, 1,
0.6065162, -0.2350439, 1.387706, 1, 1, 1, 1, 1,
0.6086913, 2.685469, -0.3483535, 1, 1, 1, 1, 1,
0.6109909, 0.575246, 2.120838, 1, 1, 1, 1, 1,
0.6139677, -0.2187262, 1.347651, 0, 0, 1, 1, 1,
0.6164594, 0.19054, 2.202608, 1, 0, 0, 1, 1,
0.6179321, 0.379729, -1.343249, 1, 0, 0, 1, 1,
0.6211464, -1.470271, 1.914182, 1, 0, 0, 1, 1,
0.6226919, -1.484429, 2.772004, 1, 0, 0, 1, 1,
0.6250154, 1.815302, 1.883048, 1, 0, 0, 1, 1,
0.6260188, 1.285522, 0.5050026, 0, 0, 0, 1, 1,
0.6310064, 0.9073259, 0.4513353, 0, 0, 0, 1, 1,
0.635157, 0.4597357, 1.624835, 0, 0, 0, 1, 1,
0.6402395, -1.488563, 2.765144, 0, 0, 0, 1, 1,
0.6436709, 0.3435487, 1.994108, 0, 0, 0, 1, 1,
0.6446379, -2.239285, 2.597733, 0, 0, 0, 1, 1,
0.6476273, 0.2098309, 0.6553958, 0, 0, 0, 1, 1,
0.653006, -0.2206502, 1.753655, 1, 1, 1, 1, 1,
0.6545265, -0.9730558, 2.735672, 1, 1, 1, 1, 1,
0.6569391, -0.9061106, 3.56974, 1, 1, 1, 1, 1,
0.6582751, -1.610365, 1.960517, 1, 1, 1, 1, 1,
0.6587523, -0.5252118, 1.202498, 1, 1, 1, 1, 1,
0.6648738, 0.3809496, 1.816064, 1, 1, 1, 1, 1,
0.6650521, -0.1747621, 0.4296274, 1, 1, 1, 1, 1,
0.6671895, 1.623977, -0.2334586, 1, 1, 1, 1, 1,
0.6728289, 0.4580343, 0.2343149, 1, 1, 1, 1, 1,
0.6729571, 0.04414535, 1.583366, 1, 1, 1, 1, 1,
0.6752166, 0.4660274, 2.288469, 1, 1, 1, 1, 1,
0.6789756, -0.08003808, 2.547964, 1, 1, 1, 1, 1,
0.6793005, -1.591075, 3.776686, 1, 1, 1, 1, 1,
0.6794304, 0.3238258, 0.9710953, 1, 1, 1, 1, 1,
0.6824954, -1.051067, 2.469955, 1, 1, 1, 1, 1,
0.6825342, 0.6217805, -0.40663, 0, 0, 1, 1, 1,
0.6870428, 0.4006017, 0.7834446, 1, 0, 0, 1, 1,
0.6897457, -0.7543775, 1.599987, 1, 0, 0, 1, 1,
0.6921443, 0.9530215, 1.130427, 1, 0, 0, 1, 1,
0.6970342, -0.9554873, 3.076475, 1, 0, 0, 1, 1,
0.6987141, -1.368543, 0.9330409, 1, 0, 0, 1, 1,
0.6993421, -0.06328363, 2.559319, 0, 0, 0, 1, 1,
0.6998027, 1.165963, -0.7069099, 0, 0, 0, 1, 1,
0.7006405, -0.5599332, 2.385571, 0, 0, 0, 1, 1,
0.7075938, 0.3634205, 0.373329, 0, 0, 0, 1, 1,
0.7119284, 0.3361816, -0.9093216, 0, 0, 0, 1, 1,
0.7134831, 1.758853, 1.959455, 0, 0, 0, 1, 1,
0.7156887, -0.09006393, 3.839486, 0, 0, 0, 1, 1,
0.7170823, 0.2426324, 3.009565, 1, 1, 1, 1, 1,
0.7201358, -2.320217, 3.73177, 1, 1, 1, 1, 1,
0.7204226, -0.2495376, 1.57674, 1, 1, 1, 1, 1,
0.7259279, 1.203338, 0.03160849, 1, 1, 1, 1, 1,
0.7291275, 0.0998396, 1.64058, 1, 1, 1, 1, 1,
0.7355189, 0.2480285, 1.577583, 1, 1, 1, 1, 1,
0.7437358, -0.5095459, 1.541376, 1, 1, 1, 1, 1,
0.7460139, 1.402643, -0.2800862, 1, 1, 1, 1, 1,
0.752472, 0.1873759, 0.757587, 1, 1, 1, 1, 1,
0.7540874, 1.741297, -0.6183039, 1, 1, 1, 1, 1,
0.7543784, 2.354596, -0.08594305, 1, 1, 1, 1, 1,
0.7568057, -0.6821401, 4.321564, 1, 1, 1, 1, 1,
0.7572386, 0.07710034, 2.914455, 1, 1, 1, 1, 1,
0.7586047, -1.518868, 2.172728, 1, 1, 1, 1, 1,
0.7617584, 0.590323, -0.3575658, 1, 1, 1, 1, 1,
0.7627804, 2.528327, 2.143018, 0, 0, 1, 1, 1,
0.7629121, 0.6408589, 2.025343, 1, 0, 0, 1, 1,
0.7640001, -0.0709638, 2.449553, 1, 0, 0, 1, 1,
0.764247, -0.2867236, 0.5289185, 1, 0, 0, 1, 1,
0.7672981, -1.347541, 1.416482, 1, 0, 0, 1, 1,
0.7687176, 1.288012, 0.3686387, 1, 0, 0, 1, 1,
0.7795686, 1.248217, -0.8170063, 0, 0, 0, 1, 1,
0.7811996, -1.193982, 1.137419, 0, 0, 0, 1, 1,
0.7870609, 1.995618, 2.649327, 0, 0, 0, 1, 1,
0.7876838, -0.2409798, -0.2863954, 0, 0, 0, 1, 1,
0.8017058, -1.948629, 3.100192, 0, 0, 0, 1, 1,
0.8090352, -1.883739, 1.899031, 0, 0, 0, 1, 1,
0.8104663, -0.01501932, 0.5404496, 0, 0, 0, 1, 1,
0.8113118, 0.1106423, -0.1010854, 1, 1, 1, 1, 1,
0.812252, -1.213426, 1.130158, 1, 1, 1, 1, 1,
0.8143141, 0.1499102, 3.647788, 1, 1, 1, 1, 1,
0.8145517, 1.654806, 0.350191, 1, 1, 1, 1, 1,
0.8186131, -0.1919807, 0.6664649, 1, 1, 1, 1, 1,
0.8198225, -0.7477148, 2.3705, 1, 1, 1, 1, 1,
0.8202044, 0.8449785, -0.8116219, 1, 1, 1, 1, 1,
0.822172, -0.3539782, 3.663395, 1, 1, 1, 1, 1,
0.8268303, 0.03309616, 1.858815, 1, 1, 1, 1, 1,
0.8348407, 0.6479412, 1.952344, 1, 1, 1, 1, 1,
0.8413709, 0.3453549, 1.621063, 1, 1, 1, 1, 1,
0.8421835, 0.4833935, 1.29229, 1, 1, 1, 1, 1,
0.8444513, -1.575975, 2.056624, 1, 1, 1, 1, 1,
0.8454431, 0.3638114, 0.6409532, 1, 1, 1, 1, 1,
0.8472587, -1.349424, 2.891541, 1, 1, 1, 1, 1,
0.8472779, -0.5544801, 1.038376, 0, 0, 1, 1, 1,
0.8480651, -1.538263, 2.112524, 1, 0, 0, 1, 1,
0.851546, -1.243315, 2.457191, 1, 0, 0, 1, 1,
0.8526828, 0.5824723, 1.662793, 1, 0, 0, 1, 1,
0.8591242, 1.698623, 1.5547, 1, 0, 0, 1, 1,
0.8600391, -2.067048, 2.072176, 1, 0, 0, 1, 1,
0.8635823, 1.771484, 0.6558816, 0, 0, 0, 1, 1,
0.8734086, -2.284303, 1.820586, 0, 0, 0, 1, 1,
0.8786543, -0.1155879, 1.120734, 0, 0, 0, 1, 1,
0.8883328, -0.5732354, 2.313791, 0, 0, 0, 1, 1,
0.8899223, -0.04998502, -0.08456574, 0, 0, 0, 1, 1,
0.9007317, -0.1187194, 2.580537, 0, 0, 0, 1, 1,
0.9162959, -0.5762362, 4.059847, 0, 0, 0, 1, 1,
0.9199805, 0.3654374, 1.556551, 1, 1, 1, 1, 1,
0.9214883, -0.2204281, 0.9520642, 1, 1, 1, 1, 1,
0.9271838, -0.9169857, 1.749528, 1, 1, 1, 1, 1,
0.9316195, 2.48849, 1.754748, 1, 1, 1, 1, 1,
0.9370847, 0.004911002, 0.2961395, 1, 1, 1, 1, 1,
0.9416366, -0.5244117, 2.478669, 1, 1, 1, 1, 1,
0.9544177, 0.09834203, 1.744585, 1, 1, 1, 1, 1,
0.9609169, -0.01878997, 1.027293, 1, 1, 1, 1, 1,
0.9647225, 1.035908, 1.350022, 1, 1, 1, 1, 1,
0.9714715, 0.6842375, 0.5744434, 1, 1, 1, 1, 1,
0.9829124, -0.6642316, 2.714804, 1, 1, 1, 1, 1,
0.9956134, 1.522382, 1.964605, 1, 1, 1, 1, 1,
0.9989609, 0.3190443, 1.502104, 1, 1, 1, 1, 1,
1.001405, -0.810824, 2.927237, 1, 1, 1, 1, 1,
1.002354, 1.043285, 2.269394, 1, 1, 1, 1, 1,
1.008835, -1.050129, 0.6130246, 0, 0, 1, 1, 1,
1.014148, -0.06610657, 2.073983, 1, 0, 0, 1, 1,
1.01744, 0.9161299, -0.4210873, 1, 0, 0, 1, 1,
1.018309, 0.5643678, 2.69124, 1, 0, 0, 1, 1,
1.021914, 1.292147, -0.8898961, 1, 0, 0, 1, 1,
1.025723, -0.3881005, 2.227046, 1, 0, 0, 1, 1,
1.029345, -0.505929, 1.230317, 0, 0, 0, 1, 1,
1.035983, -0.02730302, 0.5640112, 0, 0, 0, 1, 1,
1.04104, -0.6903937, 1.329838, 0, 0, 0, 1, 1,
1.042454, -0.8393059, 2.185671, 0, 0, 0, 1, 1,
1.045194, -0.232278, 0.4711299, 0, 0, 0, 1, 1,
1.047596, 0.1551754, 0.985773, 0, 0, 0, 1, 1,
1.054541, 0.8550874, 0.4869972, 0, 0, 0, 1, 1,
1.067786, -1.410951, 1.411699, 1, 1, 1, 1, 1,
1.071558, -0.9399374, 2.996052, 1, 1, 1, 1, 1,
1.080448, -0.5744374, 3.892767, 1, 1, 1, 1, 1,
1.08257, 0.2431803, -0.0080194, 1, 1, 1, 1, 1,
1.090882, 1.190107, 2.4861, 1, 1, 1, 1, 1,
1.09879, 0.2894516, 1.307265, 1, 1, 1, 1, 1,
1.104805, -1.786336, 2.228385, 1, 1, 1, 1, 1,
1.105719, -1.212476, 3.234281, 1, 1, 1, 1, 1,
1.11311, -0.1716107, 0.186039, 1, 1, 1, 1, 1,
1.116093, 1.273483, -0.9349073, 1, 1, 1, 1, 1,
1.121575, 0.9991269, -0.3137175, 1, 1, 1, 1, 1,
1.121821, -0.1137453, 1.785048, 1, 1, 1, 1, 1,
1.133059, 1.134083, 0.7399049, 1, 1, 1, 1, 1,
1.133109, -1.987927, 2.915271, 1, 1, 1, 1, 1,
1.143405, -1.216123, 4.380975, 1, 1, 1, 1, 1,
1.149695, -0.6826335, 2.943789, 0, 0, 1, 1, 1,
1.163439, -0.5403121, 2.628477, 1, 0, 0, 1, 1,
1.167614, -1.187853, 1.056414, 1, 0, 0, 1, 1,
1.167768, -0.05680842, 1.189234, 1, 0, 0, 1, 1,
1.169369, 1.585928, 0.9377736, 1, 0, 0, 1, 1,
1.173173, -0.446465, 0.6841789, 1, 0, 0, 1, 1,
1.173257, 0.3814978, 0.7859951, 0, 0, 0, 1, 1,
1.173274, 2.938545, 1.926757, 0, 0, 0, 1, 1,
1.183051, 0.1658892, 1.188058, 0, 0, 0, 1, 1,
1.193442, -0.03133309, 1.680539, 0, 0, 0, 1, 1,
1.196451, 0.02299894, 2.375428, 0, 0, 0, 1, 1,
1.202126, 0.6081561, 2.835295, 0, 0, 0, 1, 1,
1.204667, 0.796652, -0.3108089, 0, 0, 0, 1, 1,
1.209764, 0.1625042, 1.797071, 1, 1, 1, 1, 1,
1.213579, -0.5333446, 2.713655, 1, 1, 1, 1, 1,
1.216353, 1.318934, -2.050266, 1, 1, 1, 1, 1,
1.216555, -0.7861301, 1.924923, 1, 1, 1, 1, 1,
1.218562, 0.4867533, 0.3063537, 1, 1, 1, 1, 1,
1.218908, -0.04102588, 2.227729, 1, 1, 1, 1, 1,
1.222639, -0.6173282, 2.401769, 1, 1, 1, 1, 1,
1.227743, 0.3950592, 1.725126, 1, 1, 1, 1, 1,
1.23488, -1.192324, 3.043508, 1, 1, 1, 1, 1,
1.240085, 0.8345078, 0.4610525, 1, 1, 1, 1, 1,
1.249844, -1.237741, 1.679972, 1, 1, 1, 1, 1,
1.250242, -1.07429, 2.919393, 1, 1, 1, 1, 1,
1.263076, 0.6409045, 1.414504, 1, 1, 1, 1, 1,
1.266399, 0.8629706, 1.68653, 1, 1, 1, 1, 1,
1.2668, 1.327629, 1.178469, 1, 1, 1, 1, 1,
1.266887, 0.5513196, -1.07938, 0, 0, 1, 1, 1,
1.27139, -0.7743994, 1.652961, 1, 0, 0, 1, 1,
1.280191, -0.2303804, 2.911424, 1, 0, 0, 1, 1,
1.281833, -1.930127, 1.414442, 1, 0, 0, 1, 1,
1.283724, 0.9173309, -0.05389448, 1, 0, 0, 1, 1,
1.30078, 0.807027, 2.113743, 1, 0, 0, 1, 1,
1.305467, 0.9053491, 1.554004, 0, 0, 0, 1, 1,
1.314045, 0.5213034, 1.268313, 0, 0, 0, 1, 1,
1.344756, 0.6681734, 0.9503288, 0, 0, 0, 1, 1,
1.349578, 0.4989202, 1.925598, 0, 0, 0, 1, 1,
1.350662, 1.338567, 2.305654, 0, 0, 0, 1, 1,
1.360595, 1.494211, 0.9968759, 0, 0, 0, 1, 1,
1.363424, -0.1869033, 0.1449647, 0, 0, 0, 1, 1,
1.389005, 0.2833258, 1.954409, 1, 1, 1, 1, 1,
1.405173, 0.6615943, 0.5184976, 1, 1, 1, 1, 1,
1.409239, -0.05456123, 2.596125, 1, 1, 1, 1, 1,
1.411583, -1.424802, 2.199985, 1, 1, 1, 1, 1,
1.414582, 0.5354778, -0.3059389, 1, 1, 1, 1, 1,
1.431157, -0.5450345, 1.996022, 1, 1, 1, 1, 1,
1.438458, 0.684996, 1.253945, 1, 1, 1, 1, 1,
1.446155, -0.2185442, 1.103059, 1, 1, 1, 1, 1,
1.463377, 0.4679375, 2.81004, 1, 1, 1, 1, 1,
1.471543, 1.672705, 0.284303, 1, 1, 1, 1, 1,
1.479282, -2.433437, 3.263279, 1, 1, 1, 1, 1,
1.492654, 0.8238546, 2.575779, 1, 1, 1, 1, 1,
1.496763, 0.01059811, 2.687293, 1, 1, 1, 1, 1,
1.504073, 1.263003, 0.1143979, 1, 1, 1, 1, 1,
1.510138, 0.6377556, 0.4195047, 1, 1, 1, 1, 1,
1.511747, 0.6003063, 0.1171112, 0, 0, 1, 1, 1,
1.512914, 0.1205917, -1.486293, 1, 0, 0, 1, 1,
1.517439, -1.557696, 1.969534, 1, 0, 0, 1, 1,
1.518131, -0.3132392, 2.826107, 1, 0, 0, 1, 1,
1.518396, -0.7300161, 1.07224, 1, 0, 0, 1, 1,
1.534224, -0.8599453, 2.662837, 1, 0, 0, 1, 1,
1.536004, 2.0282, -0.3907136, 0, 0, 0, 1, 1,
1.538396, 0.8773859, 1.409318, 0, 0, 0, 1, 1,
1.544367, 0.5505378, -0.08863776, 0, 0, 0, 1, 1,
1.565089, 1.144257, 0.6539666, 0, 0, 0, 1, 1,
1.56669, -1.836714, 1.303036, 0, 0, 0, 1, 1,
1.575298, -0.6680731, 3.041222, 0, 0, 0, 1, 1,
1.57551, 0.1020204, 1.693319, 0, 0, 0, 1, 1,
1.587934, -1.645218, 1.647706, 1, 1, 1, 1, 1,
1.594479, 0.8202379, 1.756722, 1, 1, 1, 1, 1,
1.599332, -1.249177, 2.38979, 1, 1, 1, 1, 1,
1.599778, -0.4029067, 2.18817, 1, 1, 1, 1, 1,
1.609761, 0.5615992, 0.4267559, 1, 1, 1, 1, 1,
1.615202, 0.02177612, 2.210683, 1, 1, 1, 1, 1,
1.623545, 0.3740198, 1.635954, 1, 1, 1, 1, 1,
1.627872, 1.3182, 0.2478638, 1, 1, 1, 1, 1,
1.628941, -0.500083, 1.781671, 1, 1, 1, 1, 1,
1.640656, 1.255532, -0.4516874, 1, 1, 1, 1, 1,
1.661317, -0.5529328, 2.459774, 1, 1, 1, 1, 1,
1.665123, 1.020743, 0.6247222, 1, 1, 1, 1, 1,
1.668376, -0.1541101, 1.280539, 1, 1, 1, 1, 1,
1.670427, -0.8890806, 2.345878, 1, 1, 1, 1, 1,
1.680379, -0.516502, 1.571092, 1, 1, 1, 1, 1,
1.686856, -0.3894553, 1.428052, 0, 0, 1, 1, 1,
1.689753, -1.779261, 3.109179, 1, 0, 0, 1, 1,
1.701359, 1.601143, 1.960236, 1, 0, 0, 1, 1,
1.716246, 0.8339711, -0.006407128, 1, 0, 0, 1, 1,
1.724862, 1.61088, 1.321745, 1, 0, 0, 1, 1,
1.736458, 0.4765867, 2.542462, 1, 0, 0, 1, 1,
1.751644, 0.6585181, 0.5790113, 0, 0, 0, 1, 1,
1.764763, 1.158446, 1.345273, 0, 0, 0, 1, 1,
1.768034, -1.380223, 1.229504, 0, 0, 0, 1, 1,
1.790361, -0.2136155, 0.9193279, 0, 0, 0, 1, 1,
1.795913, -0.2218332, 2.436411, 0, 0, 0, 1, 1,
1.809895, 0.08809532, 0.2351284, 0, 0, 0, 1, 1,
1.81296, 0.2558376, -0.1221722, 0, 0, 0, 1, 1,
1.814148, -0.7285654, 3.162261, 1, 1, 1, 1, 1,
1.838527, -0.4270111, 1.359133, 1, 1, 1, 1, 1,
1.84047, -0.04758368, 0.9521708, 1, 1, 1, 1, 1,
1.871117, 0.7982823, 2.368715, 1, 1, 1, 1, 1,
1.916467, -2.065465, 3.298521, 1, 1, 1, 1, 1,
1.937888, 0.1385781, 1.368344, 1, 1, 1, 1, 1,
1.975142, -0.7206904, 0.5547624, 1, 1, 1, 1, 1,
1.977389, 1.479795, 3.107478, 1, 1, 1, 1, 1,
1.979835, 0.8308108, 2.061763, 1, 1, 1, 1, 1,
1.984106, 2.716102, -0.02483114, 1, 1, 1, 1, 1,
1.99406, 0.4089697, 1.52859, 1, 1, 1, 1, 1,
1.994596, -1.070227, 2.320752, 1, 1, 1, 1, 1,
2.00566, -0.3401194, 2.227537, 1, 1, 1, 1, 1,
2.058845, 0.4553417, 2.174921, 1, 1, 1, 1, 1,
2.060939, 0.471162, 1.360267, 1, 1, 1, 1, 1,
2.06684, -1.435881, 1.730386, 0, 0, 1, 1, 1,
2.067482, -1.277606, 4.730654, 1, 0, 0, 1, 1,
2.09497, -0.1823414, 2.151929, 1, 0, 0, 1, 1,
2.147702, -0.7634282, 3.293551, 1, 0, 0, 1, 1,
2.170142, 0.1001183, 1.064968, 1, 0, 0, 1, 1,
2.178512, 1.175761, 2.24801, 1, 0, 0, 1, 1,
2.236573, -1.972716, 3.406339, 0, 0, 0, 1, 1,
2.243781, -0.3125641, 1.013677, 0, 0, 0, 1, 1,
2.332561, 0.4571019, 1.914433, 0, 0, 0, 1, 1,
2.346056, 0.626431, 1.34945, 0, 0, 0, 1, 1,
2.37795, 0.8103703, 2.892174, 0, 0, 0, 1, 1,
2.449749, -0.3376331, 1.505892, 0, 0, 0, 1, 1,
2.459804, 1.579211, 1.855569, 0, 0, 0, 1, 1,
2.513979, 0.2809501, 1.561884, 1, 1, 1, 1, 1,
2.552792, -0.9071286, 1.492597, 1, 1, 1, 1, 1,
2.565158, -1.565219, 1.062681, 1, 1, 1, 1, 1,
2.569868, -1.531698, 2.975972, 1, 1, 1, 1, 1,
2.667472, 0.1623558, 0.541311, 1, 1, 1, 1, 1,
2.798907, 0.5543136, 2.119852, 1, 1, 1, 1, 1,
2.802228, -0.9502895, 3.327138, 1, 1, 1, 1, 1
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
var radius = 9.458707;
var distance = 33.22331;
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
mvMatrix.translate( 0.314406, -0.1676247, 0.02945662 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22331);
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