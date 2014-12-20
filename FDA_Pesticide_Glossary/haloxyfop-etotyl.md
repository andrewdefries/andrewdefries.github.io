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
-3.129034, -1.591007, -3.231339, 1, 0, 0, 1,
-3.095966, 0.5428114, -1.094274, 1, 0.007843138, 0, 1,
-2.874777, 0.4228152, -2.118905, 1, 0.01176471, 0, 1,
-2.700347, 1.344465, -3.433402, 1, 0.01960784, 0, 1,
-2.682777, 0.8644921, -2.026277, 1, 0.02352941, 0, 1,
-2.567097, -0.6745539, -1.742915, 1, 0.03137255, 0, 1,
-2.471235, 1.347812, -2.355799, 1, 0.03529412, 0, 1,
-2.417597, 1.102803, -0.9809191, 1, 0.04313726, 0, 1,
-2.407199, -1.931518, -2.839063, 1, 0.04705882, 0, 1,
-2.397992, -1.102908, -4.622602, 1, 0.05490196, 0, 1,
-2.262151, 0.5923076, -1.937186, 1, 0.05882353, 0, 1,
-2.240163, 0.254461, -2.717322, 1, 0.06666667, 0, 1,
-2.223204, 1.825772, -1.234983, 1, 0.07058824, 0, 1,
-2.196597, 1.078035, 0.1596385, 1, 0.07843138, 0, 1,
-2.164255, -0.9872849, -3.033953, 1, 0.08235294, 0, 1,
-2.143751, -0.773079, -3.76819, 1, 0.09019608, 0, 1,
-2.130653, 0.3854769, -1.989884, 1, 0.09411765, 0, 1,
-2.121663, 0.9470718, -0.4263346, 1, 0.1019608, 0, 1,
-2.090798, -1.489059, -3.013627, 1, 0.1098039, 0, 1,
-2.085711, 1.368147, -1.422194, 1, 0.1137255, 0, 1,
-2.057359, 0.905109, -1.49101, 1, 0.1215686, 0, 1,
-2.044443, -0.8896181, -1.312419, 1, 0.1254902, 0, 1,
-2.025562, -1.324752, -1.367996, 1, 0.1333333, 0, 1,
-2.02163, 0.2466369, -0.8700065, 1, 0.1372549, 0, 1,
-2.021204, 0.2096421, -0.3448763, 1, 0.145098, 0, 1,
-1.976998, -0.2177695, -1.171284, 1, 0.1490196, 0, 1,
-1.970647, -0.6502628, -2.648779, 1, 0.1568628, 0, 1,
-1.966104, -0.2499426, -1.097865, 1, 0.1607843, 0, 1,
-1.916438, -1.896691, -2.550236, 1, 0.1686275, 0, 1,
-1.897331, 0.380041, -1.700559, 1, 0.172549, 0, 1,
-1.886208, -1.439972, -1.868465, 1, 0.1803922, 0, 1,
-1.879653, -1.621442, -3.49927, 1, 0.1843137, 0, 1,
-1.867926, -1.271675, -0.4303686, 1, 0.1921569, 0, 1,
-1.84236, 0.7940735, -1.411332, 1, 0.1960784, 0, 1,
-1.826764, -1.304328, -2.614366, 1, 0.2039216, 0, 1,
-1.787258, 1.075522, -2.219766, 1, 0.2117647, 0, 1,
-1.77502, -0.142814, -1.22417, 1, 0.2156863, 0, 1,
-1.770634, 0.5903212, 0.4814853, 1, 0.2235294, 0, 1,
-1.753026, -0.4083818, -2.581336, 1, 0.227451, 0, 1,
-1.751761, -0.2130814, -1.254688, 1, 0.2352941, 0, 1,
-1.74755, 0.598182, -0.5840862, 1, 0.2392157, 0, 1,
-1.740373, 1.329874, 1.24047, 1, 0.2470588, 0, 1,
-1.736472, 1.074543, -0.03921647, 1, 0.2509804, 0, 1,
-1.72438, 0.339517, -1.187242, 1, 0.2588235, 0, 1,
-1.682951, -0.3129059, -1.835866, 1, 0.2627451, 0, 1,
-1.672898, 0.5634081, -2.75631, 1, 0.2705882, 0, 1,
-1.664501, 0.3796386, 0.6734337, 1, 0.2745098, 0, 1,
-1.65637, 0.7057262, -1.269789, 1, 0.282353, 0, 1,
-1.633069, 1.248983, -0.8056275, 1, 0.2862745, 0, 1,
-1.631107, -2.334087, -1.853049, 1, 0.2941177, 0, 1,
-1.626396, 2.312344, -1.581162, 1, 0.3019608, 0, 1,
-1.576742, 1.357537, -0.9785823, 1, 0.3058824, 0, 1,
-1.553621, -1.130013, -1.424505, 1, 0.3137255, 0, 1,
-1.553016, -1.120592, -3.957675, 1, 0.3176471, 0, 1,
-1.551076, -0.006391023, -2.586175, 1, 0.3254902, 0, 1,
-1.550222, -0.03610315, -1.583653, 1, 0.3294118, 0, 1,
-1.521463, -0.1593011, 0.2490051, 1, 0.3372549, 0, 1,
-1.509682, -0.2861315, -1.694924, 1, 0.3411765, 0, 1,
-1.5006, -1.613135, -3.533434, 1, 0.3490196, 0, 1,
-1.487956, -0.3284692, -2.938017, 1, 0.3529412, 0, 1,
-1.484567, -0.7765216, -2.598588, 1, 0.3607843, 0, 1,
-1.47684, 1.850928, -0.8154009, 1, 0.3647059, 0, 1,
-1.468989, 0.3733324, -1.239427, 1, 0.372549, 0, 1,
-1.458176, -0.893304, -1.381352, 1, 0.3764706, 0, 1,
-1.452446, 0.02625457, -0.06627133, 1, 0.3843137, 0, 1,
-1.45001, 0.9468929, -2.17763, 1, 0.3882353, 0, 1,
-1.431204, 0.194584, -0.9762631, 1, 0.3960784, 0, 1,
-1.425137, 0.6206577, -1.464617, 1, 0.4039216, 0, 1,
-1.422008, -0.3677631, -0.9811242, 1, 0.4078431, 0, 1,
-1.419529, 0.3144403, -0.09854088, 1, 0.4156863, 0, 1,
-1.405298, 0.1045712, -0.6671609, 1, 0.4196078, 0, 1,
-1.399538, -0.4724021, -1.29676, 1, 0.427451, 0, 1,
-1.399396, 0.5330445, -1.194814, 1, 0.4313726, 0, 1,
-1.396978, 0.9363724, -0.4075324, 1, 0.4392157, 0, 1,
-1.381408, 0.8381584, -1.807624, 1, 0.4431373, 0, 1,
-1.371424, -0.2910849, -1.693438, 1, 0.4509804, 0, 1,
-1.370636, -1.272745, -3.117852, 1, 0.454902, 0, 1,
-1.370528, 0.820694, -0.3319983, 1, 0.4627451, 0, 1,
-1.366423, 1.041872, -1.329476, 1, 0.4666667, 0, 1,
-1.355234, 0.2775254, -1.977792, 1, 0.4745098, 0, 1,
-1.348782, -2.113928, -2.941377, 1, 0.4784314, 0, 1,
-1.344687, -0.1941836, -2.803109, 1, 0.4862745, 0, 1,
-1.344381, -0.8856801, -1.601803, 1, 0.4901961, 0, 1,
-1.338131, -0.0231546, -3.672388, 1, 0.4980392, 0, 1,
-1.327365, 1.665982, 0.2309082, 1, 0.5058824, 0, 1,
-1.311056, -1.243575, -2.278329, 1, 0.509804, 0, 1,
-1.311048, 1.001226, -2.237936, 1, 0.5176471, 0, 1,
-1.297203, 0.7984776, -1.895264, 1, 0.5215687, 0, 1,
-1.292426, 2.395597, 0.1843386, 1, 0.5294118, 0, 1,
-1.291408, 1.191083, -1.341719, 1, 0.5333334, 0, 1,
-1.286702, 0.7526971, 0.1454235, 1, 0.5411765, 0, 1,
-1.285771, -0.7432735, -3.82205, 1, 0.5450981, 0, 1,
-1.282108, -2.490151, -2.991469, 1, 0.5529412, 0, 1,
-1.27937, -0.6416132, -0.9853693, 1, 0.5568628, 0, 1,
-1.272764, -0.390517, -1.529977, 1, 0.5647059, 0, 1,
-1.257585, -0.6083586, -2.257842, 1, 0.5686275, 0, 1,
-1.252675, 0.6953276, -0.8047275, 1, 0.5764706, 0, 1,
-1.251987, 0.2248983, -2.16861, 1, 0.5803922, 0, 1,
-1.247853, 1.42022, -2.784737, 1, 0.5882353, 0, 1,
-1.241126, 1.025167, -1.479163, 1, 0.5921569, 0, 1,
-1.224016, 0.4654918, -1.628321, 1, 0.6, 0, 1,
-1.222405, -1.166995, -3.007811, 1, 0.6078432, 0, 1,
-1.209368, -0.4736711, -2.558139, 1, 0.6117647, 0, 1,
-1.202176, -1.06626, -2.494081, 1, 0.6196079, 0, 1,
-1.199972, 0.4607236, -2.452382, 1, 0.6235294, 0, 1,
-1.192429, 0.454556, -2.626284, 1, 0.6313726, 0, 1,
-1.188583, 1.286116, -1.332364, 1, 0.6352941, 0, 1,
-1.179716, -0.9597231, -2.455901, 1, 0.6431373, 0, 1,
-1.162762, -0.1470314, -1.234725, 1, 0.6470588, 0, 1,
-1.139513, 0.1318062, -1.238546, 1, 0.654902, 0, 1,
-1.136568, 1.437233, 1.259492, 1, 0.6588235, 0, 1,
-1.126046, -1.877906, -2.931451, 1, 0.6666667, 0, 1,
-1.12541, 2.223856, 0.3878621, 1, 0.6705883, 0, 1,
-1.118242, 0.7165062, -0.3349724, 1, 0.6784314, 0, 1,
-1.116826, -0.2412598, -1.824901, 1, 0.682353, 0, 1,
-1.103804, -0.5491522, -0.7388989, 1, 0.6901961, 0, 1,
-1.098032, -1.556723, -2.386488, 1, 0.6941177, 0, 1,
-1.08556, -0.4168027, -3.618738, 1, 0.7019608, 0, 1,
-1.083836, 0.2882742, -1.113677, 1, 0.7098039, 0, 1,
-1.079561, 0.538306, -1.74693, 1, 0.7137255, 0, 1,
-1.076304, -0.5732071, -2.441935, 1, 0.7215686, 0, 1,
-1.067652, -0.004571134, -1.161731, 1, 0.7254902, 0, 1,
-1.066555, -1.877008, -2.66545, 1, 0.7333333, 0, 1,
-1.063971, 1.53883, 0.09813975, 1, 0.7372549, 0, 1,
-1.061188, -0.7692412, -2.236738, 1, 0.7450981, 0, 1,
-1.054178, -1.571777, -0.6041176, 1, 0.7490196, 0, 1,
-1.053442, -0.8029332, -0.3920687, 1, 0.7568628, 0, 1,
-1.053157, -0.8217962, -1.525339, 1, 0.7607843, 0, 1,
-1.033741, -0.7462697, -1.970123, 1, 0.7686275, 0, 1,
-1.033002, 0.2571112, -1.867542, 1, 0.772549, 0, 1,
-1.032865, -0.9398521, -2.36132, 1, 0.7803922, 0, 1,
-1.027495, 0.6785499, -1.480583, 1, 0.7843137, 0, 1,
-1.011688, -0.2288525, 0.5287042, 1, 0.7921569, 0, 1,
-1.010042, -0.8029404, -3.15785, 1, 0.7960784, 0, 1,
-1.009299, -0.9899481, -1.760348, 1, 0.8039216, 0, 1,
-1.005957, -0.6546041, -2.165116, 1, 0.8117647, 0, 1,
-1.00574, 1.097394, 0.6007128, 1, 0.8156863, 0, 1,
-1.00341, 0.3986357, -1.572736, 1, 0.8235294, 0, 1,
-0.9925007, -0.8734375, -3.213526, 1, 0.827451, 0, 1,
-0.9904351, 0.08612766, -1.026797, 1, 0.8352941, 0, 1,
-0.9864959, 1.449982, -1.210937, 1, 0.8392157, 0, 1,
-0.9794405, 0.1412643, -1.501698, 1, 0.8470588, 0, 1,
-0.9773231, 1.808892, -1.247393, 1, 0.8509804, 0, 1,
-0.9740162, 0.4307126, -2.272932, 1, 0.8588235, 0, 1,
-0.9707786, 0.2698856, -0.8133947, 1, 0.8627451, 0, 1,
-0.9683416, -0.3114169, -0.4737597, 1, 0.8705882, 0, 1,
-0.9594138, -1.776336, -2.200667, 1, 0.8745098, 0, 1,
-0.9547948, -0.2135054, -1.47983, 1, 0.8823529, 0, 1,
-0.9502242, 0.9032336, -0.5492963, 1, 0.8862745, 0, 1,
-0.9455959, 0.6371852, -0.9028895, 1, 0.8941177, 0, 1,
-0.9317685, 0.3953906, -1.892446, 1, 0.8980392, 0, 1,
-0.9270664, -1.269184, -3.471421, 1, 0.9058824, 0, 1,
-0.917989, 1.927358, -2.278257, 1, 0.9137255, 0, 1,
-0.916433, -0.09851066, -3.188984, 1, 0.9176471, 0, 1,
-0.916303, -1.690782, -2.677097, 1, 0.9254902, 0, 1,
-0.9148949, -0.2124133, -1.960455, 1, 0.9294118, 0, 1,
-0.9128274, -0.2236936, 0.008173035, 1, 0.9372549, 0, 1,
-0.9125025, -0.7711943, -2.039343, 1, 0.9411765, 0, 1,
-0.9052512, -0.8659244, -4.360872, 1, 0.9490196, 0, 1,
-0.9000494, 0.5683395, -2.050821, 1, 0.9529412, 0, 1,
-0.8858536, 0.7400526, -1.14269, 1, 0.9607843, 0, 1,
-0.883874, 2.000069, -2.17387, 1, 0.9647059, 0, 1,
-0.8812929, -0.1899718, -2.214527, 1, 0.972549, 0, 1,
-0.8802912, 1.495571, 0.7479185, 1, 0.9764706, 0, 1,
-0.8774495, 0.528281, -1.103864, 1, 0.9843137, 0, 1,
-0.8737518, 2.446514, -0.009334345, 1, 0.9882353, 0, 1,
-0.8667411, -0.1570876, -0.7606208, 1, 0.9960784, 0, 1,
-0.8666328, -0.9569428, -2.423197, 0.9960784, 1, 0, 1,
-0.8588087, 0.02484019, -1.179602, 0.9921569, 1, 0, 1,
-0.8542854, 1.052088, -1.402495, 0.9843137, 1, 0, 1,
-0.8522499, -0.2096693, -0.4475555, 0.9803922, 1, 0, 1,
-0.8404669, 1.865029, 0.01547091, 0.972549, 1, 0, 1,
-0.8358234, 0.2724632, -1.211991, 0.9686275, 1, 0, 1,
-0.831425, -0.03247766, -1.445878, 0.9607843, 1, 0, 1,
-0.8260061, -0.9494997, -2.342502, 0.9568627, 1, 0, 1,
-0.8239253, -1.813718, -4.445256, 0.9490196, 1, 0, 1,
-0.8175597, 1.079371, -0.8267508, 0.945098, 1, 0, 1,
-0.810926, 1.462637, -0.559995, 0.9372549, 1, 0, 1,
-0.8045766, -0.4410413, -2.877888, 0.9333333, 1, 0, 1,
-0.8027031, 0.530997, 0.05101316, 0.9254902, 1, 0, 1,
-0.8008777, 0.08207861, -0.9953563, 0.9215686, 1, 0, 1,
-0.8000609, 0.448293, -0.9837285, 0.9137255, 1, 0, 1,
-0.7999443, -1.072451, -3.890597, 0.9098039, 1, 0, 1,
-0.7968026, 0.2967527, -2.571917, 0.9019608, 1, 0, 1,
-0.7927171, 1.552848, -1.223837, 0.8941177, 1, 0, 1,
-0.7893047, -0.8244351, -1.890039, 0.8901961, 1, 0, 1,
-0.7871032, 0.8384849, -0.9852696, 0.8823529, 1, 0, 1,
-0.7847764, 0.2015108, 0.3097729, 0.8784314, 1, 0, 1,
-0.7820342, 1.829444, 0.1312449, 0.8705882, 1, 0, 1,
-0.7742001, -0.8654343, -3.243635, 0.8666667, 1, 0, 1,
-0.7582488, -0.948461, -1.749974, 0.8588235, 1, 0, 1,
-0.755824, 1.907947, -0.1226269, 0.854902, 1, 0, 1,
-0.7488324, 2.30973, -2.024448, 0.8470588, 1, 0, 1,
-0.7460377, 0.4215534, -1.223762, 0.8431373, 1, 0, 1,
-0.7457225, -0.2550672, -1.939368, 0.8352941, 1, 0, 1,
-0.7441753, -1.113802, -4.264536, 0.8313726, 1, 0, 1,
-0.7437997, -0.3323009, -1.598242, 0.8235294, 1, 0, 1,
-0.7401906, -0.5409896, -2.653672, 0.8196079, 1, 0, 1,
-0.7372986, -0.2217698, -1.533527, 0.8117647, 1, 0, 1,
-0.7358832, 0.9773911, -2.212597, 0.8078431, 1, 0, 1,
-0.7342766, 1.330209, 2.296035, 0.8, 1, 0, 1,
-0.7305991, 1.216689, -0.8262359, 0.7921569, 1, 0, 1,
-0.7302839, 0.06964444, -1.92742, 0.7882353, 1, 0, 1,
-0.7290506, -1.315788, -2.485198, 0.7803922, 1, 0, 1,
-0.7276581, 0.7516229, -0.1071601, 0.7764706, 1, 0, 1,
-0.7235903, -0.6788337, -3.272971, 0.7686275, 1, 0, 1,
-0.7188455, 0.8326094, -0.9273164, 0.7647059, 1, 0, 1,
-0.7172039, 0.9497804, -1.038416, 0.7568628, 1, 0, 1,
-0.7132143, 0.03356816, -3.28914, 0.7529412, 1, 0, 1,
-0.7098671, -2.701921, -2.069427, 0.7450981, 1, 0, 1,
-0.7083777, -0.4747413, -0.6080989, 0.7411765, 1, 0, 1,
-0.705782, 0.7142865, -2.204523, 0.7333333, 1, 0, 1,
-0.7043454, 0.05722982, -1.908422, 0.7294118, 1, 0, 1,
-0.7040331, 2.818472, 1.149904, 0.7215686, 1, 0, 1,
-0.702119, 0.623041, -1.477555, 0.7176471, 1, 0, 1,
-0.7010309, -0.4057116, -3.404616, 0.7098039, 1, 0, 1,
-0.6999353, 0.1063032, -1.428849, 0.7058824, 1, 0, 1,
-0.6994556, 0.8217325, 0.9324768, 0.6980392, 1, 0, 1,
-0.6975676, -0.5190035, -2.610769, 0.6901961, 1, 0, 1,
-0.696192, -0.0383138, -1.125507, 0.6862745, 1, 0, 1,
-0.6961809, 0.2184359, -0.8185049, 0.6784314, 1, 0, 1,
-0.6901057, -0.9027037, -2.204309, 0.6745098, 1, 0, 1,
-0.6878981, -0.3545103, -2.476237, 0.6666667, 1, 0, 1,
-0.6869403, -0.4571191, -2.119258, 0.6627451, 1, 0, 1,
-0.6853662, -1.703839, -1.963682, 0.654902, 1, 0, 1,
-0.6803766, 0.5884684, -0.713599, 0.6509804, 1, 0, 1,
-0.6791456, 0.8504888, -0.753837, 0.6431373, 1, 0, 1,
-0.6746319, 0.9589477, -0.6511209, 0.6392157, 1, 0, 1,
-0.6727989, -0.5509083, -1.339371, 0.6313726, 1, 0, 1,
-0.6646145, 2.22365, -1.803403, 0.627451, 1, 0, 1,
-0.6639982, 0.8828637, -1.256683, 0.6196079, 1, 0, 1,
-0.659915, 0.1164117, -0.991019, 0.6156863, 1, 0, 1,
-0.6575788, 1.061307, 0.4485119, 0.6078432, 1, 0, 1,
-0.6513236, -1.461539, -3.109163, 0.6039216, 1, 0, 1,
-0.6434934, 0.3196771, -1.681439, 0.5960785, 1, 0, 1,
-0.6365265, 0.7814764, -2.029602, 0.5882353, 1, 0, 1,
-0.6322923, -0.4554099, -2.50341, 0.5843138, 1, 0, 1,
-0.6301251, -0.5411165, -2.262096, 0.5764706, 1, 0, 1,
-0.6290498, -0.1372346, -2.063421, 0.572549, 1, 0, 1,
-0.6264207, 1.718942, -0.3757714, 0.5647059, 1, 0, 1,
-0.6255883, -1.281883, -1.74466, 0.5607843, 1, 0, 1,
-0.6227843, -1.921538, -1.989062, 0.5529412, 1, 0, 1,
-0.6225839, -0.3063858, 0.04434345, 0.5490196, 1, 0, 1,
-0.6205585, 0.3887168, -2.131157, 0.5411765, 1, 0, 1,
-0.6198894, 0.05127558, 0.08405153, 0.5372549, 1, 0, 1,
-0.6039516, 0.6303127, -3.11183, 0.5294118, 1, 0, 1,
-0.6019318, 0.8918204, -2.127438, 0.5254902, 1, 0, 1,
-0.600901, -0.5230151, -3.749188, 0.5176471, 1, 0, 1,
-0.6001316, 1.778342, -0.559515, 0.5137255, 1, 0, 1,
-0.5984881, -1.576548, -2.842449, 0.5058824, 1, 0, 1,
-0.5968071, -1.028179, -2.903667, 0.5019608, 1, 0, 1,
-0.5963166, 0.904716, -0.2267838, 0.4941176, 1, 0, 1,
-0.5947101, -1.235105, -3.572567, 0.4862745, 1, 0, 1,
-0.5939, 0.59329, 0.3250202, 0.4823529, 1, 0, 1,
-0.5898515, -1.630256, -1.006584, 0.4745098, 1, 0, 1,
-0.5873285, -0.5087071, -2.401334, 0.4705882, 1, 0, 1,
-0.5858881, 0.5755371, -0.8264587, 0.4627451, 1, 0, 1,
-0.5840253, -2.716655, -3.093291, 0.4588235, 1, 0, 1,
-0.5835792, 0.05665366, -0.9405808, 0.4509804, 1, 0, 1,
-0.5796276, 0.3516407, -1.21542, 0.4470588, 1, 0, 1,
-0.5776472, -0.945183, -2.551317, 0.4392157, 1, 0, 1,
-0.5772027, 1.448927, 0.4901875, 0.4352941, 1, 0, 1,
-0.5758902, -0.9723029, -3.225727, 0.427451, 1, 0, 1,
-0.5665705, 0.1556555, -0.9112082, 0.4235294, 1, 0, 1,
-0.5662252, 1.140511, 0.902904, 0.4156863, 1, 0, 1,
-0.5638587, -0.09155138, -2.257678, 0.4117647, 1, 0, 1,
-0.5615156, -1.995486, -4.354226, 0.4039216, 1, 0, 1,
-0.5611809, 0.8631393, -1.062527, 0.3960784, 1, 0, 1,
-0.555556, -0.6496132, -3.453092, 0.3921569, 1, 0, 1,
-0.5541345, -0.3863783, -0.6622626, 0.3843137, 1, 0, 1,
-0.5529686, 2.107666, -0.05980843, 0.3803922, 1, 0, 1,
-0.5510854, -0.2390975, -2.365677, 0.372549, 1, 0, 1,
-0.5500687, -1.090151, -3.006952, 0.3686275, 1, 0, 1,
-0.5499468, -1.156974, -2.632375, 0.3607843, 1, 0, 1,
-0.5492303, 2.259781, -1.237651, 0.3568628, 1, 0, 1,
-0.5448456, 1.594857, -0.5814828, 0.3490196, 1, 0, 1,
-0.5396391, 1.800084, -1.166957, 0.345098, 1, 0, 1,
-0.5392281, 0.1764586, -2.508066, 0.3372549, 1, 0, 1,
-0.5371186, -2.355862, -1.863506, 0.3333333, 1, 0, 1,
-0.5360045, -0.2223766, -1.931168, 0.3254902, 1, 0, 1,
-0.5328936, 0.8401201, -0.4563382, 0.3215686, 1, 0, 1,
-0.5301963, 0.1080167, 1.050708, 0.3137255, 1, 0, 1,
-0.5299038, -0.5472793, -1.816558, 0.3098039, 1, 0, 1,
-0.5265692, -1.289698, -1.675563, 0.3019608, 1, 0, 1,
-0.5260044, -0.4590207, -1.704939, 0.2941177, 1, 0, 1,
-0.5256135, -0.115582, -0.2841993, 0.2901961, 1, 0, 1,
-0.5212476, -1.318745, -4.259415, 0.282353, 1, 0, 1,
-0.5174929, 0.5498937, 0.09248021, 0.2784314, 1, 0, 1,
-0.515283, 0.5603354, -1.849111, 0.2705882, 1, 0, 1,
-0.5093228, -0.9543222, 0.5912492, 0.2666667, 1, 0, 1,
-0.5056525, -0.1900449, -2.303084, 0.2588235, 1, 0, 1,
-0.5056357, -0.5155195, -1.129527, 0.254902, 1, 0, 1,
-0.4944443, -0.05225765, -3.105981, 0.2470588, 1, 0, 1,
-0.4910434, -0.07500654, -1.799129, 0.2431373, 1, 0, 1,
-0.4907082, 0.4930575, -0.559821, 0.2352941, 1, 0, 1,
-0.4893419, -0.6673134, -2.130237, 0.2313726, 1, 0, 1,
-0.4890205, -0.1604919, -0.4224431, 0.2235294, 1, 0, 1,
-0.4886487, 1.131035, 0.4278083, 0.2196078, 1, 0, 1,
-0.4866921, -1.073779, -2.572754, 0.2117647, 1, 0, 1,
-0.4862569, -0.102267, -3.025476, 0.2078431, 1, 0, 1,
-0.4845639, 0.4468352, 0.6899375, 0.2, 1, 0, 1,
-0.4823628, -0.2283793, -2.555185, 0.1921569, 1, 0, 1,
-0.4807687, -0.30615, -1.879587, 0.1882353, 1, 0, 1,
-0.4806157, -1.142049, -3.247079, 0.1803922, 1, 0, 1,
-0.4777718, 0.7895555, -0.878839, 0.1764706, 1, 0, 1,
-0.4751195, -1.211683, -2.436966, 0.1686275, 1, 0, 1,
-0.4721577, -1.449887, -2.831652, 0.1647059, 1, 0, 1,
-0.4717239, 1.48904, -0.8614762, 0.1568628, 1, 0, 1,
-0.464642, 0.1237782, -0.9839376, 0.1529412, 1, 0, 1,
-0.4627793, 0.9544641, -0.3683679, 0.145098, 1, 0, 1,
-0.4618124, -0.5556397, -3.866217, 0.1411765, 1, 0, 1,
-0.4594177, -0.09659708, -1.533188, 0.1333333, 1, 0, 1,
-0.4590888, -1.578532, -3.950843, 0.1294118, 1, 0, 1,
-0.4561402, 0.1387199, 0.2378798, 0.1215686, 1, 0, 1,
-0.4465398, -0.4978452, -0.7459946, 0.1176471, 1, 0, 1,
-0.4401567, -1.277616, -2.181404, 0.1098039, 1, 0, 1,
-0.4325026, -1.282592, -4.026999, 0.1058824, 1, 0, 1,
-0.4324413, 0.06614272, 0.241724, 0.09803922, 1, 0, 1,
-0.4282792, -0.02050986, -1.044673, 0.09019608, 1, 0, 1,
-0.4276851, -1.620289, -2.412322, 0.08627451, 1, 0, 1,
-0.4262961, 0.7002599, -0.981692, 0.07843138, 1, 0, 1,
-0.423929, 0.5939775, 0.3679499, 0.07450981, 1, 0, 1,
-0.4209509, 0.4421103, -1.128493, 0.06666667, 1, 0, 1,
-0.4186517, 0.3244742, -1.355972, 0.0627451, 1, 0, 1,
-0.4108012, -1.083386, -3.709387, 0.05490196, 1, 0, 1,
-0.4088933, 0.4340337, -1.43931, 0.05098039, 1, 0, 1,
-0.4044876, 1.307591, -0.3713896, 0.04313726, 1, 0, 1,
-0.3991773, 1.183055, -0.1989519, 0.03921569, 1, 0, 1,
-0.3964039, 0.2910682, 0.07649971, 0.03137255, 1, 0, 1,
-0.3888932, 2.182473, -1.642209, 0.02745098, 1, 0, 1,
-0.3768837, 0.08234366, -0.8176892, 0.01960784, 1, 0, 1,
-0.37473, 1.07621, -0.5718042, 0.01568628, 1, 0, 1,
-0.371892, -0.5047511, -3.564589, 0.007843138, 1, 0, 1,
-0.3634534, 1.310402, 0.5857197, 0.003921569, 1, 0, 1,
-0.3627179, -0.3782023, -1.698752, 0, 1, 0.003921569, 1,
-0.3622318, -0.3189724, -1.438189, 0, 1, 0.01176471, 1,
-0.3521696, -1.191547, -3.2993, 0, 1, 0.01568628, 1,
-0.349565, 1.068069, 1.1538, 0, 1, 0.02352941, 1,
-0.3475319, 0.5848038, 0.8629475, 0, 1, 0.02745098, 1,
-0.347412, -0.08584795, -0.5458364, 0, 1, 0.03529412, 1,
-0.3459865, 0.7792842, -0.5686347, 0, 1, 0.03921569, 1,
-0.345615, -1.21693, -2.789168, 0, 1, 0.04705882, 1,
-0.3407086, 0.9687814, -1.247708, 0, 1, 0.05098039, 1,
-0.3401412, 0.6042799, 0.7542117, 0, 1, 0.05882353, 1,
-0.3377465, 0.285264, -0.2918866, 0, 1, 0.0627451, 1,
-0.336726, 0.05642758, -0.8266633, 0, 1, 0.07058824, 1,
-0.3328121, -1.65158, -6.389646, 0, 1, 0.07450981, 1,
-0.3315864, 0.3418387, -2.652929, 0, 1, 0.08235294, 1,
-0.3302727, 0.2171205, -0.3268529, 0, 1, 0.08627451, 1,
-0.3249617, -1.275013, -3.138257, 0, 1, 0.09411765, 1,
-0.3241982, 1.138163, -1.424382, 0, 1, 0.1019608, 1,
-0.3221345, -0.4677018, -2.702693, 0, 1, 0.1058824, 1,
-0.321247, -1.0616, -3.685372, 0, 1, 0.1137255, 1,
-0.3210015, 0.03378698, -0.863067, 0, 1, 0.1176471, 1,
-0.3182566, -1.344286, -1.010544, 0, 1, 0.1254902, 1,
-0.3135194, -0.9860737, -1.193149, 0, 1, 0.1294118, 1,
-0.3133075, 0.8084349, -0.9772094, 0, 1, 0.1372549, 1,
-0.3100075, 1.020073, -0.7784913, 0, 1, 0.1411765, 1,
-0.3079175, 0.6285592, -0.4765875, 0, 1, 0.1490196, 1,
-0.3075421, -1.056439, -2.806189, 0, 1, 0.1529412, 1,
-0.3052582, -0.8565445, -2.922793, 0, 1, 0.1607843, 1,
-0.3005733, -1.216548, -1.462462, 0, 1, 0.1647059, 1,
-0.2998555, -2.018968, -3.165298, 0, 1, 0.172549, 1,
-0.2970313, 0.3651519, -1.326923, 0, 1, 0.1764706, 1,
-0.2937773, -0.6834765, -1.291417, 0, 1, 0.1843137, 1,
-0.2849528, 0.7070137, -1.726377, 0, 1, 0.1882353, 1,
-0.2843151, -1.268618, -1.142728, 0, 1, 0.1960784, 1,
-0.2727081, 0.0005959334, -1.468961, 0, 1, 0.2039216, 1,
-0.2719756, 1.584475, 1.469488, 0, 1, 0.2078431, 1,
-0.2714344, 0.2547119, -1.182754, 0, 1, 0.2156863, 1,
-0.2679768, 1.458662, -2.011729, 0, 1, 0.2196078, 1,
-0.2674058, 0.0875198, -0.9657712, 0, 1, 0.227451, 1,
-0.2658603, -0.7778239, -3.474624, 0, 1, 0.2313726, 1,
-0.2657247, 0.28425, -1.275572, 0, 1, 0.2392157, 1,
-0.2638909, 0.1767451, -0.02609998, 0, 1, 0.2431373, 1,
-0.2627887, 0.8117698, 0.9069687, 0, 1, 0.2509804, 1,
-0.2619407, -0.2544689, -2.073889, 0, 1, 0.254902, 1,
-0.2571786, 1.124533, -0.0109711, 0, 1, 0.2627451, 1,
-0.2526214, -1.270975, -5.121385, 0, 1, 0.2666667, 1,
-0.2518315, 1.159332, 0.5410577, 0, 1, 0.2745098, 1,
-0.2508385, -1.554906, -2.148659, 0, 1, 0.2784314, 1,
-0.2501832, -1.898035, -2.079852, 0, 1, 0.2862745, 1,
-0.2424662, -0.8297822, -4.507622, 0, 1, 0.2901961, 1,
-0.2412844, -0.4036171, -3.658164, 0, 1, 0.2980392, 1,
-0.2391304, -0.7803666, -1.650062, 0, 1, 0.3058824, 1,
-0.2313227, 0.1049352, -0.9503936, 0, 1, 0.3098039, 1,
-0.2277295, -0.1018328, -0.2084139, 0, 1, 0.3176471, 1,
-0.2264678, -1.055794, -4.048352, 0, 1, 0.3215686, 1,
-0.2255835, 1.55253, -1.396583, 0, 1, 0.3294118, 1,
-0.2248213, -0.400437, -1.811533, 0, 1, 0.3333333, 1,
-0.2233398, -1.267056, -2.533017, 0, 1, 0.3411765, 1,
-0.2225074, -1.082779, -4.292113, 0, 1, 0.345098, 1,
-0.2185456, -0.8188193, -2.280758, 0, 1, 0.3529412, 1,
-0.2149075, -0.5321843, -4.395642, 0, 1, 0.3568628, 1,
-0.2143607, -0.6053064, -1.900077, 0, 1, 0.3647059, 1,
-0.2126516, 0.2353726, -1.640205, 0, 1, 0.3686275, 1,
-0.211969, 1.72738, -1.346973, 0, 1, 0.3764706, 1,
-0.2092863, 0.2440877, 0.7608106, 0, 1, 0.3803922, 1,
-0.2000992, 0.3322066, -3.209114, 0, 1, 0.3882353, 1,
-0.1997572, 0.872631, 1.477797, 0, 1, 0.3921569, 1,
-0.1995263, -1.620511, -3.310428, 0, 1, 0.4, 1,
-0.1993723, -0.8601816, -1.46072, 0, 1, 0.4078431, 1,
-0.198295, -0.07180836, -1.969437, 0, 1, 0.4117647, 1,
-0.1957232, -1.005655, -1.570888, 0, 1, 0.4196078, 1,
-0.1943006, 1.343181, 0.4640119, 0, 1, 0.4235294, 1,
-0.1921809, -0.9530609, -3.224451, 0, 1, 0.4313726, 1,
-0.1917121, -0.5654244, -2.579615, 0, 1, 0.4352941, 1,
-0.1908073, 0.3707855, -0.4265862, 0, 1, 0.4431373, 1,
-0.1898689, -0.2542188, -1.448351, 0, 1, 0.4470588, 1,
-0.1897919, 0.5801771, 0.7085707, 0, 1, 0.454902, 1,
-0.1893791, -0.3719534, -1.448746, 0, 1, 0.4588235, 1,
-0.1888758, -0.1562625, -0.2021332, 0, 1, 0.4666667, 1,
-0.1879441, -0.4716262, -3.034149, 0, 1, 0.4705882, 1,
-0.1860308, 1.373171, -0.5348963, 0, 1, 0.4784314, 1,
-0.1848309, 0.4020646, 0.2651226, 0, 1, 0.4823529, 1,
-0.1844254, -0.1576463, -0.8143341, 0, 1, 0.4901961, 1,
-0.1827518, -1.269844, -3.538906, 0, 1, 0.4941176, 1,
-0.1823228, -1.343543, -3.670258, 0, 1, 0.5019608, 1,
-0.1782158, 0.585528, 0.1746041, 0, 1, 0.509804, 1,
-0.1776206, 0.5251562, -0.4151164, 0, 1, 0.5137255, 1,
-0.1771693, -0.1545616, -2.072784, 0, 1, 0.5215687, 1,
-0.1768985, 0.7880219, -0.6110682, 0, 1, 0.5254902, 1,
-0.1766245, -0.04758032, -3.247196, 0, 1, 0.5333334, 1,
-0.1759663, -0.6335126, -3.323488, 0, 1, 0.5372549, 1,
-0.1753248, 1.89521, -0.3499156, 0, 1, 0.5450981, 1,
-0.1729274, 0.3813873, -0.3877465, 0, 1, 0.5490196, 1,
-0.1710998, -0.5209003, -3.198511, 0, 1, 0.5568628, 1,
-0.1708891, 0.03420058, -0.996112, 0, 1, 0.5607843, 1,
-0.1666806, 0.9745746, 0.01214824, 0, 1, 0.5686275, 1,
-0.1629425, 0.1613147, -0.4123251, 0, 1, 0.572549, 1,
-0.1615915, 0.9391961, -0.5548694, 0, 1, 0.5803922, 1,
-0.1598186, 0.06633703, -1.805718, 0, 1, 0.5843138, 1,
-0.1528896, 0.09380854, -2.612895, 0, 1, 0.5921569, 1,
-0.1523893, 1.575318, 0.6612017, 0, 1, 0.5960785, 1,
-0.1514186, 1.02314, 0.37745, 0, 1, 0.6039216, 1,
-0.1470021, -0.8717999, -4.471981, 0, 1, 0.6117647, 1,
-0.1453889, 1.450297, -0.6816834, 0, 1, 0.6156863, 1,
-0.1443278, -0.2618442, -3.355156, 0, 1, 0.6235294, 1,
-0.1409679, 0.3020389, -0.210792, 0, 1, 0.627451, 1,
-0.1399497, 0.5186287, -0.1976261, 0, 1, 0.6352941, 1,
-0.1385538, -0.6004952, -3.377479, 0, 1, 0.6392157, 1,
-0.1381404, -0.4114724, -2.285982, 0, 1, 0.6470588, 1,
-0.1380884, -0.1911855, -0.87422, 0, 1, 0.6509804, 1,
-0.13805, 1.877963, 0.6716918, 0, 1, 0.6588235, 1,
-0.136086, -0.1451515, -1.395944, 0, 1, 0.6627451, 1,
-0.1329019, 0.7866656, 0.04516597, 0, 1, 0.6705883, 1,
-0.128866, -0.78635, -2.151956, 0, 1, 0.6745098, 1,
-0.128781, 0.265573, -0.8122924, 0, 1, 0.682353, 1,
-0.1248725, 0.5388938, 0.3737567, 0, 1, 0.6862745, 1,
-0.1241486, 0.99594, -0.02383883, 0, 1, 0.6941177, 1,
-0.1233983, 0.1551157, -1.088872, 0, 1, 0.7019608, 1,
-0.1225241, -0.5795282, -4.297415, 0, 1, 0.7058824, 1,
-0.1208398, 0.6300881, 1.703105, 0, 1, 0.7137255, 1,
-0.1192492, -1.931663, -3.516748, 0, 1, 0.7176471, 1,
-0.1153706, -0.6433321, -2.67099, 0, 1, 0.7254902, 1,
-0.1151228, 0.09286646, -1.689594, 0, 1, 0.7294118, 1,
-0.1120715, -0.5163983, -4.481814, 0, 1, 0.7372549, 1,
-0.1101345, -1.375321, -1.866977, 0, 1, 0.7411765, 1,
-0.1094746, -1.055483, -1.967167, 0, 1, 0.7490196, 1,
-0.1075863, -1.711838, -2.785173, 0, 1, 0.7529412, 1,
-0.1073983, 0.2331985, -0.4145299, 0, 1, 0.7607843, 1,
-0.1069155, 1.124201, 1.96326, 0, 1, 0.7647059, 1,
-0.1056466, 1.254048, 0.9556313, 0, 1, 0.772549, 1,
-0.1053678, 1.091478, 0.653678, 0, 1, 0.7764706, 1,
-0.1050462, 0.3424458, -0.8595913, 0, 1, 0.7843137, 1,
-0.1040006, 0.7986192, 1.572349, 0, 1, 0.7882353, 1,
-0.09919225, 0.246705, -1.805121, 0, 1, 0.7960784, 1,
-0.09757105, -0.418103, -3.140289, 0, 1, 0.8039216, 1,
-0.09739038, -2.093887, -3.192268, 0, 1, 0.8078431, 1,
-0.09410883, -0.781319, -2.155839, 0, 1, 0.8156863, 1,
-0.09400491, 0.3764934, -0.6931803, 0, 1, 0.8196079, 1,
-0.09177806, -0.07721074, -2.165241, 0, 1, 0.827451, 1,
-0.0906902, -1.917883, -3.226978, 0, 1, 0.8313726, 1,
-0.08727577, 1.538315, -0.2941035, 0, 1, 0.8392157, 1,
-0.08282206, 1.558274, -0.6979169, 0, 1, 0.8431373, 1,
-0.08187235, -0.1693808, -1.804474, 0, 1, 0.8509804, 1,
-0.08110384, -0.599835, -1.878227, 0, 1, 0.854902, 1,
-0.08000682, -0.4278308, -4.272839, 0, 1, 0.8627451, 1,
-0.07834437, 0.9566575, 1.115326, 0, 1, 0.8666667, 1,
-0.07712237, -0.2911546, -1.650873, 0, 1, 0.8745098, 1,
-0.06901157, 1.206072, -1.152946, 0, 1, 0.8784314, 1,
-0.0684619, 0.8239786, 0.8718382, 0, 1, 0.8862745, 1,
-0.06181465, 1.121952, -0.01743237, 0, 1, 0.8901961, 1,
-0.05436283, 0.004127069, -0.4605837, 0, 1, 0.8980392, 1,
-0.05353295, -0.565518, -4.124034, 0, 1, 0.9058824, 1,
-0.0527635, 0.01358304, -0.2785101, 0, 1, 0.9098039, 1,
-0.05090206, -0.3396032, -4.115384, 0, 1, 0.9176471, 1,
-0.05085135, 1.782292, -0.1942272, 0, 1, 0.9215686, 1,
-0.05052339, -1.74571, -2.140693, 0, 1, 0.9294118, 1,
-0.04397722, -0.1330255, -0.3820042, 0, 1, 0.9333333, 1,
-0.04116127, -1.456617, -2.218416, 0, 1, 0.9411765, 1,
-0.03846345, 0.9040881, 1.168681, 0, 1, 0.945098, 1,
-0.03433354, -2.08256, -2.47459, 0, 1, 0.9529412, 1,
-0.03051813, -0.4161974, -3.45124, 0, 1, 0.9568627, 1,
-0.02638274, 1.140494, -2.194605, 0, 1, 0.9647059, 1,
-0.02408081, -0.1376218, -2.998335, 0, 1, 0.9686275, 1,
-0.02392892, -0.4540721, -1.115164, 0, 1, 0.9764706, 1,
-0.0225625, 0.5003964, -1.936975, 0, 1, 0.9803922, 1,
-0.01969735, 1.73756, 0.1698357, 0, 1, 0.9882353, 1,
-0.01792435, 1.0834, -0.1471046, 0, 1, 0.9921569, 1,
-0.01139589, 1.320663, -0.2871483, 0, 1, 1, 1,
-0.01107086, 1.667922, -1.796335, 0, 0.9921569, 1, 1,
-0.009060996, -0.5051595, -2.573099, 0, 0.9882353, 1, 1,
-0.008774505, 0.8341948, -1.119063, 0, 0.9803922, 1, 1,
-0.007983874, 0.2600044, 1.374067, 0, 0.9764706, 1, 1,
-0.007810736, 0.8134897, -0.193753, 0, 0.9686275, 1, 1,
-0.007183069, -0.01115239, -2.685923, 0, 0.9647059, 1, 1,
-0.004854407, 1.11517, -0.06060463, 0, 0.9568627, 1, 1,
-0.002591811, -1.349961, -2.87416, 0, 0.9529412, 1, 1,
0.0008106513, -0.8893936, 4.330631, 0, 0.945098, 1, 1,
0.005570392, 0.3860285, -1.699194, 0, 0.9411765, 1, 1,
0.007725176, 0.09183583, -1.419935, 0, 0.9333333, 1, 1,
0.01392236, -0.23275, 4.298628, 0, 0.9294118, 1, 1,
0.01788954, 1.824043, -0.11355, 0, 0.9215686, 1, 1,
0.0183874, -0.8606055, 0.9253528, 0, 0.9176471, 1, 1,
0.01850803, 0.7090531, -0.2728004, 0, 0.9098039, 1, 1,
0.01855542, 0.2039239, 0.264081, 0, 0.9058824, 1, 1,
0.02112968, 0.6053324, 0.3601602, 0, 0.8980392, 1, 1,
0.02506474, 0.1205795, -0.3211008, 0, 0.8901961, 1, 1,
0.02814276, 2.576023, 1.579657, 0, 0.8862745, 1, 1,
0.02982515, 0.8090366, 1.619571, 0, 0.8784314, 1, 1,
0.03269294, -0.491201, 3.282259, 0, 0.8745098, 1, 1,
0.03321863, 0.3717921, 2.028274, 0, 0.8666667, 1, 1,
0.0411113, 1.607185, -0.8406084, 0, 0.8627451, 1, 1,
0.04318291, -0.1105252, 3.090513, 0, 0.854902, 1, 1,
0.0451094, -0.4000966, 2.186869, 0, 0.8509804, 1, 1,
0.04556429, 0.05479942, 0.4901216, 0, 0.8431373, 1, 1,
0.04647365, 1.204276, -2.001657, 0, 0.8392157, 1, 1,
0.04772448, -0.8030887, 2.466674, 0, 0.8313726, 1, 1,
0.05191481, 0.6587914, 1.383422, 0, 0.827451, 1, 1,
0.05339349, 0.9487361, -0.5472914, 0, 0.8196079, 1, 1,
0.05585834, -1.699547, 3.118452, 0, 0.8156863, 1, 1,
0.05900368, -1.07466, 3.602555, 0, 0.8078431, 1, 1,
0.06846803, 2.777677, 2.048621, 0, 0.8039216, 1, 1,
0.07279634, -1.12608, 2.321677, 0, 0.7960784, 1, 1,
0.0747779, 1.526289, -0.7701851, 0, 0.7882353, 1, 1,
0.07888549, -1.164598, 3.10059, 0, 0.7843137, 1, 1,
0.0808177, -2.205097, 2.588238, 0, 0.7764706, 1, 1,
0.08194415, 0.513504, -0.1487402, 0, 0.772549, 1, 1,
0.08394358, -0.1180368, 3.809983, 0, 0.7647059, 1, 1,
0.08475862, 1.482802, 1.115514, 0, 0.7607843, 1, 1,
0.08531336, -1.432273, 2.186326, 0, 0.7529412, 1, 1,
0.09350519, -0.7024357, 2.50492, 0, 0.7490196, 1, 1,
0.09375914, 0.05163879, 1.454515, 0, 0.7411765, 1, 1,
0.09769793, -2.362158, 2.935012, 0, 0.7372549, 1, 1,
0.09784043, 0.1715913, -0.5422474, 0, 0.7294118, 1, 1,
0.09923017, -0.3884715, 2.879028, 0, 0.7254902, 1, 1,
0.100139, -0.4961252, 3.235918, 0, 0.7176471, 1, 1,
0.1027555, 1.291753, -2.305568, 0, 0.7137255, 1, 1,
0.1063593, 0.1016541, -0.602973, 0, 0.7058824, 1, 1,
0.1084261, 0.3552176, -1.58191, 0, 0.6980392, 1, 1,
0.1085194, -1.233882, 3.505861, 0, 0.6941177, 1, 1,
0.1097352, -1.263673, 1.935424, 0, 0.6862745, 1, 1,
0.1105241, -1.346169, 2.60082, 0, 0.682353, 1, 1,
0.1201649, 0.4081651, 0.9457851, 0, 0.6745098, 1, 1,
0.1216584, 0.4979825, -0.4290757, 0, 0.6705883, 1, 1,
0.1226913, -0.9974301, 3.934836, 0, 0.6627451, 1, 1,
0.1255857, 1.227715, -0.04299592, 0, 0.6588235, 1, 1,
0.131424, -0.3159341, 0.6367474, 0, 0.6509804, 1, 1,
0.1355778, -1.805247, 3.727327, 0, 0.6470588, 1, 1,
0.14257, -2.222459, 3.810196, 0, 0.6392157, 1, 1,
0.1462203, 0.3919795, -0.03233251, 0, 0.6352941, 1, 1,
0.1503664, -0.7752421, 3.356915, 0, 0.627451, 1, 1,
0.1527571, -0.161806, 3.011864, 0, 0.6235294, 1, 1,
0.1589601, -0.1720499, 0.6512903, 0, 0.6156863, 1, 1,
0.1595419, -0.7344922, 3.42275, 0, 0.6117647, 1, 1,
0.1597182, 0.06704056, 2.309844, 0, 0.6039216, 1, 1,
0.1617986, -1.180892, 1.70901, 0, 0.5960785, 1, 1,
0.1618092, 0.2986227, 1.866055, 0, 0.5921569, 1, 1,
0.1675413, 0.4379967, -0.5221926, 0, 0.5843138, 1, 1,
0.1699541, 1.263262, 1.072971, 0, 0.5803922, 1, 1,
0.1705007, -0.9452781, 1.895633, 0, 0.572549, 1, 1,
0.1739088, 1.261945, -0.1575767, 0, 0.5686275, 1, 1,
0.1753319, -0.6255262, 2.273815, 0, 0.5607843, 1, 1,
0.1770727, 0.6389054, 0.06303718, 0, 0.5568628, 1, 1,
0.1799582, 2.229381, 1.863452, 0, 0.5490196, 1, 1,
0.1803973, 0.3947711, 1.188387, 0, 0.5450981, 1, 1,
0.1805425, -0.1581816, 3.833363, 0, 0.5372549, 1, 1,
0.1823695, 1.541011, 1.101762, 0, 0.5333334, 1, 1,
0.1829451, 0.9778171, 0.2179994, 0, 0.5254902, 1, 1,
0.1885349, 0.3615609, 0.6300323, 0, 0.5215687, 1, 1,
0.1907545, -0.6780457, 2.767235, 0, 0.5137255, 1, 1,
0.1972091, -1.568092, 3.283515, 0, 0.509804, 1, 1,
0.2020123, 0.08615895, 0.06801362, 0, 0.5019608, 1, 1,
0.2078169, -0.8412017, 1.770857, 0, 0.4941176, 1, 1,
0.2086031, 0.718629, 1.731023, 0, 0.4901961, 1, 1,
0.2092093, -0.1811585, 2.819891, 0, 0.4823529, 1, 1,
0.2108385, -0.1802845, 1.66893, 0, 0.4784314, 1, 1,
0.2139319, 0.1364607, 0.02602826, 0, 0.4705882, 1, 1,
0.2161451, -0.383298, 1.552966, 0, 0.4666667, 1, 1,
0.2183726, -0.7443264, 2.753569, 0, 0.4588235, 1, 1,
0.2184579, -0.5212237, 3.599679, 0, 0.454902, 1, 1,
0.2187962, -0.5363706, 1.025625, 0, 0.4470588, 1, 1,
0.2279038, 0.4000179, -0.51687, 0, 0.4431373, 1, 1,
0.2352277, -2.038923, 3.948055, 0, 0.4352941, 1, 1,
0.2364047, 0.9109801, -2.104754, 0, 0.4313726, 1, 1,
0.2400721, 0.2538899, -0.6686649, 0, 0.4235294, 1, 1,
0.2455712, -1.244563, 3.113116, 0, 0.4196078, 1, 1,
0.2523912, -0.7540654, 1.519843, 0, 0.4117647, 1, 1,
0.2563907, 0.05782003, 0.3843568, 0, 0.4078431, 1, 1,
0.2568518, -1.030149, 3.028999, 0, 0.4, 1, 1,
0.2577394, -0.5479879, 3.919177, 0, 0.3921569, 1, 1,
0.2598138, -1.189804, 0.9061345, 0, 0.3882353, 1, 1,
0.2609763, -0.4375511, 1.186957, 0, 0.3803922, 1, 1,
0.2663545, -0.4221978, 4.133899, 0, 0.3764706, 1, 1,
0.2699071, 1.507338, -0.007440509, 0, 0.3686275, 1, 1,
0.2772046, -1.11523, 3.641128, 0, 0.3647059, 1, 1,
0.2931651, -0.6258412, 2.87421, 0, 0.3568628, 1, 1,
0.2938987, -0.715268, 2.175344, 0, 0.3529412, 1, 1,
0.2940003, -1.796968, 2.43433, 0, 0.345098, 1, 1,
0.2949685, -1.421787, 3.443501, 0, 0.3411765, 1, 1,
0.2950397, 0.9366949, 1.263161, 0, 0.3333333, 1, 1,
0.2982516, -0.7949424, 0.8546731, 0, 0.3294118, 1, 1,
0.2992271, -1.663286, 1.377949, 0, 0.3215686, 1, 1,
0.300293, -0.7981946, 3.755863, 0, 0.3176471, 1, 1,
0.3041065, 1.881563, 0.4412992, 0, 0.3098039, 1, 1,
0.3043312, -0.2764948, 1.969562, 0, 0.3058824, 1, 1,
0.3056911, -0.560389, 2.996629, 0, 0.2980392, 1, 1,
0.3058982, -1.127747, 2.871797, 0, 0.2901961, 1, 1,
0.3096193, -2.044125, 2.486576, 0, 0.2862745, 1, 1,
0.3159558, -0.9678648, 2.905213, 0, 0.2784314, 1, 1,
0.3239321, 0.1752413, 0.8596553, 0, 0.2745098, 1, 1,
0.3250465, -0.7951664, 4.398224, 0, 0.2666667, 1, 1,
0.3266271, -0.02152152, 0.6501577, 0, 0.2627451, 1, 1,
0.3301783, 0.03184168, 0.5991748, 0, 0.254902, 1, 1,
0.3306009, -0.9457198, 2.371476, 0, 0.2509804, 1, 1,
0.3330176, -1.429547, 2.22204, 0, 0.2431373, 1, 1,
0.3353311, -1.867163, 2.863086, 0, 0.2392157, 1, 1,
0.3354884, 0.8516141, 1.016392, 0, 0.2313726, 1, 1,
0.3367001, -0.8812174, 3.464434, 0, 0.227451, 1, 1,
0.3435562, 0.2879508, 0.1658662, 0, 0.2196078, 1, 1,
0.3491387, 0.9231154, -0.2036283, 0, 0.2156863, 1, 1,
0.3508156, 0.8087427, -1.17821, 0, 0.2078431, 1, 1,
0.35404, 1.932238, -1.868647, 0, 0.2039216, 1, 1,
0.3574084, 0.268667, 2.054126, 0, 0.1960784, 1, 1,
0.3576733, 1.611411, 0.5635768, 0, 0.1882353, 1, 1,
0.3598262, -0.9898908, 1.52457, 0, 0.1843137, 1, 1,
0.3686385, 0.5403299, 0.9304678, 0, 0.1764706, 1, 1,
0.3711033, -0.9135807, 2.775649, 0, 0.172549, 1, 1,
0.3714426, -0.4095274, 2.98191, 0, 0.1647059, 1, 1,
0.3773031, -0.5894375, 4.401777, 0, 0.1607843, 1, 1,
0.3791695, -0.8991109, 3.929689, 0, 0.1529412, 1, 1,
0.3806835, 0.9757937, 0.5194736, 0, 0.1490196, 1, 1,
0.3807317, -0.8536372, 4.138102, 0, 0.1411765, 1, 1,
0.3839504, -0.5092755, 3.585093, 0, 0.1372549, 1, 1,
0.3849387, 0.1391626, 2.08771, 0, 0.1294118, 1, 1,
0.3855723, -0.9860494, 0.4632608, 0, 0.1254902, 1, 1,
0.3909611, 0.1136096, 2.325552, 0, 0.1176471, 1, 1,
0.3911934, 0.6247859, 1.372542, 0, 0.1137255, 1, 1,
0.3928013, -0.7400895, 1.750966, 0, 0.1058824, 1, 1,
0.3949465, 0.1059735, -0.05762233, 0, 0.09803922, 1, 1,
0.4015688, 0.3053514, 1.650476, 0, 0.09411765, 1, 1,
0.40211, -1.327724, 1.641419, 0, 0.08627451, 1, 1,
0.4041103, -1.063632, 3.043022, 0, 0.08235294, 1, 1,
0.4132533, -0.08744285, 0.2037324, 0, 0.07450981, 1, 1,
0.4142803, 0.5565575, -1.463447, 0, 0.07058824, 1, 1,
0.414639, 0.43912, 1.360363, 0, 0.0627451, 1, 1,
0.4174858, -0.6738092, 2.872797, 0, 0.05882353, 1, 1,
0.4202493, 1.8497, -1.207673, 0, 0.05098039, 1, 1,
0.4256194, 0.703315, 1.313512, 0, 0.04705882, 1, 1,
0.427649, 0.8325151, 0.7179673, 0, 0.03921569, 1, 1,
0.4286721, 0.5716534, 1.512548, 0, 0.03529412, 1, 1,
0.4309919, -0.07033376, 1.562486, 0, 0.02745098, 1, 1,
0.4322654, -1.419507, 2.672957, 0, 0.02352941, 1, 1,
0.4363504, -1.123312, 0.831884, 0, 0.01568628, 1, 1,
0.437069, -0.5698809, 1.899099, 0, 0.01176471, 1, 1,
0.4382817, 0.4740968, 1.074675, 0, 0.003921569, 1, 1,
0.4393375, 2.142524, 1.401152, 0.003921569, 0, 1, 1,
0.4400383, 0.7646514, -1.108994, 0.007843138, 0, 1, 1,
0.4400792, 0.6851528, 0.1678769, 0.01568628, 0, 1, 1,
0.4421531, -1.078163, 3.468111, 0.01960784, 0, 1, 1,
0.443336, 0.9667642, -0.3642344, 0.02745098, 0, 1, 1,
0.4475166, -0.1318661, 1.885644, 0.03137255, 0, 1, 1,
0.4479336, -0.5299358, 1.068016, 0.03921569, 0, 1, 1,
0.4490601, -0.770021, 2.822265, 0.04313726, 0, 1, 1,
0.449081, -0.8829317, 3.139814, 0.05098039, 0, 1, 1,
0.4497532, 0.6960793, -1.370166, 0.05490196, 0, 1, 1,
0.450633, 0.09753954, 1.294436, 0.0627451, 0, 1, 1,
0.4531766, 1.450783, 0.05143749, 0.06666667, 0, 1, 1,
0.4603615, -0.5674526, 1.650886, 0.07450981, 0, 1, 1,
0.4605975, -0.6512398, 1.397094, 0.07843138, 0, 1, 1,
0.4620678, -0.1124521, 1.489466, 0.08627451, 0, 1, 1,
0.4654009, 1.487546, 1.982863, 0.09019608, 0, 1, 1,
0.4858774, 0.7394117, -0.1393526, 0.09803922, 0, 1, 1,
0.4873367, -1.43203, 3.704071, 0.1058824, 0, 1, 1,
0.4892829, 1.658997, 0.4058537, 0.1098039, 0, 1, 1,
0.4898772, 1.668276, 0.5183563, 0.1176471, 0, 1, 1,
0.4910626, -0.2615233, 1.609752, 0.1215686, 0, 1, 1,
0.4970104, -0.2839209, 3.030819, 0.1294118, 0, 1, 1,
0.497637, -2.814548, 3.752783, 0.1333333, 0, 1, 1,
0.4979954, 0.3550589, 1.227551, 0.1411765, 0, 1, 1,
0.4997342, -0.9610714, 3.051593, 0.145098, 0, 1, 1,
0.5008833, 1.699334, 0.2364749, 0.1529412, 0, 1, 1,
0.5016589, 0.2383848, 3.580711, 0.1568628, 0, 1, 1,
0.5016919, -0.816261, 3.031116, 0.1647059, 0, 1, 1,
0.502257, -0.04864148, 1.720865, 0.1686275, 0, 1, 1,
0.5040617, 1.241006, 2.104154, 0.1764706, 0, 1, 1,
0.5093883, -0.5296786, 2.841514, 0.1803922, 0, 1, 1,
0.5098159, -0.5684602, 2.326052, 0.1882353, 0, 1, 1,
0.5110952, 0.4958673, 1.972992, 0.1921569, 0, 1, 1,
0.5186039, 0.752572, 2.245181, 0.2, 0, 1, 1,
0.518709, 0.3136381, 0.09434724, 0.2078431, 0, 1, 1,
0.5189674, 0.01068452, 0.1782245, 0.2117647, 0, 1, 1,
0.5203412, 1.333739, 0.1557923, 0.2196078, 0, 1, 1,
0.5271446, -1.160144, 2.734511, 0.2235294, 0, 1, 1,
0.5290271, 0.1033397, 2.122714, 0.2313726, 0, 1, 1,
0.5303004, -0.6116447, 0.6446281, 0.2352941, 0, 1, 1,
0.533594, 1.498614, -0.4108917, 0.2431373, 0, 1, 1,
0.5344366, 0.9831365, 1.544261, 0.2470588, 0, 1, 1,
0.5378402, -2.793548, 2.732237, 0.254902, 0, 1, 1,
0.5387225, 1.124263, -0.7073063, 0.2588235, 0, 1, 1,
0.5410867, -0.8862683, 1.627065, 0.2666667, 0, 1, 1,
0.5426607, -0.1833298, 0.9121367, 0.2705882, 0, 1, 1,
0.5428316, -0.7639475, -0.3578318, 0.2784314, 0, 1, 1,
0.544336, -1.103221, 2.973692, 0.282353, 0, 1, 1,
0.5457635, 0.102773, 1.003957, 0.2901961, 0, 1, 1,
0.5510253, 1.173252, 0.2332342, 0.2941177, 0, 1, 1,
0.5522086, -0.2828015, 1.258913, 0.3019608, 0, 1, 1,
0.5609339, 0.2762901, 0.683241, 0.3098039, 0, 1, 1,
0.5621861, 0.1989675, 1.070146, 0.3137255, 0, 1, 1,
0.5644081, -0.06603093, 0.3392983, 0.3215686, 0, 1, 1,
0.566812, -0.001931601, 1.590844, 0.3254902, 0, 1, 1,
0.5739128, -3.024263, 2.465434, 0.3333333, 0, 1, 1,
0.577315, -1.162215, 4.850192, 0.3372549, 0, 1, 1,
0.5823171, -0.1847985, 2.854548, 0.345098, 0, 1, 1,
0.5864627, -1.51263, 1.348299, 0.3490196, 0, 1, 1,
0.5901213, -0.8106486, 4.977424, 0.3568628, 0, 1, 1,
0.5905073, -0.4729283, 1.749704, 0.3607843, 0, 1, 1,
0.5946233, -1.327494, 2.186255, 0.3686275, 0, 1, 1,
0.5963193, 0.9491292, 1.036924, 0.372549, 0, 1, 1,
0.5966379, 0.3619476, 0.9901057, 0.3803922, 0, 1, 1,
0.598995, -0.04458983, 2.129626, 0.3843137, 0, 1, 1,
0.6003551, -0.0796433, 1.243441, 0.3921569, 0, 1, 1,
0.6035575, 1.272405, -2.02957, 0.3960784, 0, 1, 1,
0.6108416, 0.8908885, 0.7614597, 0.4039216, 0, 1, 1,
0.6164294, 1.139638, 1.457519, 0.4117647, 0, 1, 1,
0.6192499, 1.064138, 0.472069, 0.4156863, 0, 1, 1,
0.6207916, -0.4934359, 3.011595, 0.4235294, 0, 1, 1,
0.6208125, 0.2022628, 1.548501, 0.427451, 0, 1, 1,
0.6221744, 0.7314258, 0.5536789, 0.4352941, 0, 1, 1,
0.625053, 1.410294, -3.097396, 0.4392157, 0, 1, 1,
0.6281782, 0.1882919, -0.6139866, 0.4470588, 0, 1, 1,
0.6284045, -0.4952505, 1.871087, 0.4509804, 0, 1, 1,
0.6351677, -0.1701593, 1.659613, 0.4588235, 0, 1, 1,
0.6363668, 0.6070072, 1.673459, 0.4627451, 0, 1, 1,
0.636907, 0.613465, -0.4053409, 0.4705882, 0, 1, 1,
0.6395649, -1.871835, 2.71317, 0.4745098, 0, 1, 1,
0.6401238, 0.3971465, 0.9502252, 0.4823529, 0, 1, 1,
0.6418762, 0.4398315, -0.2412393, 0.4862745, 0, 1, 1,
0.6425221, -0.5736249, 1.211654, 0.4941176, 0, 1, 1,
0.6468701, 1.382702, 0.3622211, 0.5019608, 0, 1, 1,
0.6504986, 0.5980057, 1.459458, 0.5058824, 0, 1, 1,
0.658577, -0.7839926, 2.820181, 0.5137255, 0, 1, 1,
0.6621702, 1.290707, 0.243622, 0.5176471, 0, 1, 1,
0.6655083, -0.4858828, 2.120851, 0.5254902, 0, 1, 1,
0.6662947, 0.1632165, 1.856845, 0.5294118, 0, 1, 1,
0.6676903, -0.4478657, 2.02247, 0.5372549, 0, 1, 1,
0.6704739, 1.028795, 1.541099, 0.5411765, 0, 1, 1,
0.6841474, -0.9069155, 4.275203, 0.5490196, 0, 1, 1,
0.6857609, 1.751047, 1.265628, 0.5529412, 0, 1, 1,
0.6868399, 1.103151, 1.100607, 0.5607843, 0, 1, 1,
0.6884142, -0.3101035, 2.559884, 0.5647059, 0, 1, 1,
0.6906601, 0.07304654, 0.693702, 0.572549, 0, 1, 1,
0.6906679, 0.264621, 1.247259, 0.5764706, 0, 1, 1,
0.6990599, 0.2506312, 1.0934, 0.5843138, 0, 1, 1,
0.7006267, 0.8058983, 2.969718, 0.5882353, 0, 1, 1,
0.707435, -0.808047, 2.082605, 0.5960785, 0, 1, 1,
0.7145284, -0.9548218, 3.360974, 0.6039216, 0, 1, 1,
0.7191487, 0.2635126, 1.030677, 0.6078432, 0, 1, 1,
0.7207372, 0.1311193, 1.956415, 0.6156863, 0, 1, 1,
0.7234545, -0.9257391, 1.549404, 0.6196079, 0, 1, 1,
0.7263234, 0.3982629, 1.131863, 0.627451, 0, 1, 1,
0.7276861, -0.8269562, 2.725893, 0.6313726, 0, 1, 1,
0.7360633, 0.2975056, 2.244749, 0.6392157, 0, 1, 1,
0.7381377, 1.855902, 1.479637, 0.6431373, 0, 1, 1,
0.7381607, 0.8893638, 1.758429, 0.6509804, 0, 1, 1,
0.7388819, 1.865131, -0.1341025, 0.654902, 0, 1, 1,
0.7446558, 1.023764, -0.3867672, 0.6627451, 0, 1, 1,
0.7459799, -0.3006453, 3.488349, 0.6666667, 0, 1, 1,
0.7498129, 0.5625548, 0.437323, 0.6745098, 0, 1, 1,
0.7510318, 0.3005392, 2.817666, 0.6784314, 0, 1, 1,
0.752955, 0.603636, 1.347556, 0.6862745, 0, 1, 1,
0.7530708, 0.1987654, 1.492463, 0.6901961, 0, 1, 1,
0.7563296, 0.4016678, 0.8446165, 0.6980392, 0, 1, 1,
0.7603605, 0.5856208, 0.594999, 0.7058824, 0, 1, 1,
0.7606583, -1.075745, 2.715606, 0.7098039, 0, 1, 1,
0.7613479, -1.388778, 1.683775, 0.7176471, 0, 1, 1,
0.7632693, 0.03096408, 2.684191, 0.7215686, 0, 1, 1,
0.7700335, -0.6803964, 2.523956, 0.7294118, 0, 1, 1,
0.7717913, -2.556804, 4.495184, 0.7333333, 0, 1, 1,
0.7728485, 0.7752774, -0.8515422, 0.7411765, 0, 1, 1,
0.7728525, 1.51855, -1.598967, 0.7450981, 0, 1, 1,
0.7787888, 1.667019, 2.978843, 0.7529412, 0, 1, 1,
0.7837875, -0.1115204, 0.7032506, 0.7568628, 0, 1, 1,
0.7891864, 0.3130484, -0.803995, 0.7647059, 0, 1, 1,
0.8032547, -0.01066414, 0.5385636, 0.7686275, 0, 1, 1,
0.807065, 0.3844528, -6.165168e-05, 0.7764706, 0, 1, 1,
0.8079492, -0.8491861, 2.899365, 0.7803922, 0, 1, 1,
0.8082549, -1.526072, 3.444249, 0.7882353, 0, 1, 1,
0.8098983, -1.37227, 2.882951, 0.7921569, 0, 1, 1,
0.8234259, 0.5539997, 1.275843, 0.8, 0, 1, 1,
0.8262805, 0.5936275, 0.00302596, 0.8078431, 0, 1, 1,
0.8296447, 0.6583792, 1.258333, 0.8117647, 0, 1, 1,
0.8350884, 0.4341458, 4.663503, 0.8196079, 0, 1, 1,
0.8388504, 0.05550142, 1.619654, 0.8235294, 0, 1, 1,
0.8437374, -0.6419593, 4.569502, 0.8313726, 0, 1, 1,
0.8454862, -0.2006765, 3.484667, 0.8352941, 0, 1, 1,
0.8485988, -0.4603068, 1.71864, 0.8431373, 0, 1, 1,
0.8507372, 0.1092089, 2.794, 0.8470588, 0, 1, 1,
0.8574789, -1.063501, 2.87496, 0.854902, 0, 1, 1,
0.8600155, 0.3887302, -0.3397461, 0.8588235, 0, 1, 1,
0.8609397, -1.270442, 2.181961, 0.8666667, 0, 1, 1,
0.8610677, 0.3110073, 0.9080593, 0.8705882, 0, 1, 1,
0.8614851, 0.3956001, 1.148981, 0.8784314, 0, 1, 1,
0.8746109, -0.05644848, 1.197173, 0.8823529, 0, 1, 1,
0.8757751, 0.8655792, -1.286585, 0.8901961, 0, 1, 1,
0.8758423, -1.243394, 4.155039, 0.8941177, 0, 1, 1,
0.8802106, 0.1155707, 1.274639, 0.9019608, 0, 1, 1,
0.883316, -1.924646, 2.026218, 0.9098039, 0, 1, 1,
0.8913512, 0.07492636, 2.066363, 0.9137255, 0, 1, 1,
0.8937699, 0.3852211, 1.133007, 0.9215686, 0, 1, 1,
0.9032995, 0.9067128, 1.366897, 0.9254902, 0, 1, 1,
0.9074798, -0.05119909, 1.877341, 0.9333333, 0, 1, 1,
0.9077308, -1.139844, 3.497066, 0.9372549, 0, 1, 1,
0.9123031, -1.61071, 3.142549, 0.945098, 0, 1, 1,
0.9314156, -0.6111515, 0.2390689, 0.9490196, 0, 1, 1,
0.9349806, 0.3203423, 0.6680827, 0.9568627, 0, 1, 1,
0.9372846, -0.6984633, 3.37656, 0.9607843, 0, 1, 1,
0.9385913, 0.8806418, 1.204704, 0.9686275, 0, 1, 1,
0.9428315, -0.5433495, 1.509438, 0.972549, 0, 1, 1,
0.9450234, -0.8501691, 1.308882, 0.9803922, 0, 1, 1,
0.9467993, -0.07930582, 1.120771, 0.9843137, 0, 1, 1,
0.9494442, -0.2371474, -0.172145, 0.9921569, 0, 1, 1,
0.949913, 0.5479703, 1.361028, 0.9960784, 0, 1, 1,
0.9514289, 1.177227, 0.865546, 1, 0, 0.9960784, 1,
0.9581141, -0.5255072, 0.7768164, 1, 0, 0.9882353, 1,
0.9583734, -0.01610812, 0.8406991, 1, 0, 0.9843137, 1,
0.9611705, -0.9300624, 2.277781, 1, 0, 0.9764706, 1,
0.9621146, 0.8137399, 1.359914, 1, 0, 0.972549, 1,
0.9660982, 1.098374, 0.6307145, 1, 0, 0.9647059, 1,
0.9667215, -1.756524, 4.243439, 1, 0, 0.9607843, 1,
0.9730034, -0.1343077, 1.133978, 1, 0, 0.9529412, 1,
0.9764177, -0.8656204, 1.842534, 1, 0, 0.9490196, 1,
0.9909109, 0.8501425, 0.2701473, 1, 0, 0.9411765, 1,
0.9933602, -1.359108, 4.508106, 1, 0, 0.9372549, 1,
1.002195, 1.500179, -0.1279108, 1, 0, 0.9294118, 1,
1.023601, -0.01444757, 1.070669, 1, 0, 0.9254902, 1,
1.03113, -1.386078, 3.694307, 1, 0, 0.9176471, 1,
1.033386, 0.8784747, 1.328267, 1, 0, 0.9137255, 1,
1.040879, 1.325179, 1.172803, 1, 0, 0.9058824, 1,
1.049485, 1.392972, 1.6386, 1, 0, 0.9019608, 1,
1.065783, 1.372317, 0.2168216, 1, 0, 0.8941177, 1,
1.066256, -0.6382226, 3.220611, 1, 0, 0.8862745, 1,
1.070586, -1.127488, 2.700933, 1, 0, 0.8823529, 1,
1.07608, -0.04692427, 0.5879824, 1, 0, 0.8745098, 1,
1.079967, 0.3608536, -0.297272, 1, 0, 0.8705882, 1,
1.08747, 1.717755, 0.3203993, 1, 0, 0.8627451, 1,
1.089381, -0.5143468, 1.227477, 1, 0, 0.8588235, 1,
1.098903, 0.2883166, 0.7237771, 1, 0, 0.8509804, 1,
1.105103, 0.7645935, 1.788926, 1, 0, 0.8470588, 1,
1.107719, 0.01563933, 1.269176, 1, 0, 0.8392157, 1,
1.113734, 0.5908511, 0.7739612, 1, 0, 0.8352941, 1,
1.117036, 0.7336456, 1.47648, 1, 0, 0.827451, 1,
1.121554, -0.805712, 2.397404, 1, 0, 0.8235294, 1,
1.121837, 0.368944, 2.438242, 1, 0, 0.8156863, 1,
1.126152, 0.005766496, 1.05773, 1, 0, 0.8117647, 1,
1.128645, 2.460883, -1.631123, 1, 0, 0.8039216, 1,
1.131637, -0.1979551, 1.038845, 1, 0, 0.7960784, 1,
1.131885, -1.180401, 2.836592, 1, 0, 0.7921569, 1,
1.133229, -1.477427, 2.299373, 1, 0, 0.7843137, 1,
1.133693, -0.3428239, 1.964056, 1, 0, 0.7803922, 1,
1.135297, -1.736074, 0.9871601, 1, 0, 0.772549, 1,
1.149516, 0.4565467, 2.358245, 1, 0, 0.7686275, 1,
1.152208, -0.1732123, 0.412328, 1, 0, 0.7607843, 1,
1.154746, -0.5705068, 3.302485, 1, 0, 0.7568628, 1,
1.157775, -1.15646, 1.092333, 1, 0, 0.7490196, 1,
1.163013, -1.951359, 2.563087, 1, 0, 0.7450981, 1,
1.163814, -0.3555714, 2.827963, 1, 0, 0.7372549, 1,
1.177098, -1.768739, 1.943889, 1, 0, 0.7333333, 1,
1.185374, 0.2339486, 1.087083, 1, 0, 0.7254902, 1,
1.191057, 0.09061407, 2.360505, 1, 0, 0.7215686, 1,
1.191726, -0.6100112, 1.509722, 1, 0, 0.7137255, 1,
1.194087, -0.6114742, 1.181391, 1, 0, 0.7098039, 1,
1.198242, -0.1527868, 1.374776, 1, 0, 0.7019608, 1,
1.210951, -0.7757267, 1.482542, 1, 0, 0.6941177, 1,
1.211245, 0.005823744, 0.6993318, 1, 0, 0.6901961, 1,
1.211861, -0.8771214, 0.1129969, 1, 0, 0.682353, 1,
1.222001, -0.2489508, 1.368077, 1, 0, 0.6784314, 1,
1.232335, -0.04411117, 1.206466, 1, 0, 0.6705883, 1,
1.236369, -0.1971166, 0.4063115, 1, 0, 0.6666667, 1,
1.244321, 0.01959733, 2.967208, 1, 0, 0.6588235, 1,
1.252727, -1.012501, 2.201534, 1, 0, 0.654902, 1,
1.272647, -1.388475, 0.6371086, 1, 0, 0.6470588, 1,
1.273061, -0.01003678, 1.655531, 1, 0, 0.6431373, 1,
1.283292, -0.8027256, 1.276379, 1, 0, 0.6352941, 1,
1.285039, 0.5067874, 1.733505, 1, 0, 0.6313726, 1,
1.29329, -1.915009, 3.109526, 1, 0, 0.6235294, 1,
1.295792, 0.9136667, 1.720935, 1, 0, 0.6196079, 1,
1.296236, 1.392722, 1.435865, 1, 0, 0.6117647, 1,
1.300516, 1.217953, 0.01659185, 1, 0, 0.6078432, 1,
1.301369, 1.963361, -0.8092509, 1, 0, 0.6, 1,
1.305965, -1.366042, 3.028456, 1, 0, 0.5921569, 1,
1.314692, 1.024807, 1.90245, 1, 0, 0.5882353, 1,
1.318269, 1.269932, 2.324886, 1, 0, 0.5803922, 1,
1.321207, 0.6407676, 0.6622065, 1, 0, 0.5764706, 1,
1.334931, 0.7358739, 2.407645, 1, 0, 0.5686275, 1,
1.336353, -1.214262, 1.160917, 1, 0, 0.5647059, 1,
1.342426, 0.5447592, 0.9251227, 1, 0, 0.5568628, 1,
1.365893, 1.865452, 0.7573027, 1, 0, 0.5529412, 1,
1.366365, 0.3498539, 1.41635, 1, 0, 0.5450981, 1,
1.367516, 0.5973164, 1.429189, 1, 0, 0.5411765, 1,
1.373254, 0.4719414, 0.7412882, 1, 0, 0.5333334, 1,
1.37746, -0.7056161, 1.079825, 1, 0, 0.5294118, 1,
1.384016, -0.1282521, 2.800719, 1, 0, 0.5215687, 1,
1.391534, -0.7905387, 0.9057513, 1, 0, 0.5176471, 1,
1.39952, 1.540332, 1.124934, 1, 0, 0.509804, 1,
1.406391, 0.4383969, 0.6702297, 1, 0, 0.5058824, 1,
1.410691, 0.4427011, 1.703659, 1, 0, 0.4980392, 1,
1.411368, 1.08148, -1.987448, 1, 0, 0.4901961, 1,
1.414028, -2.353041, 2.249247, 1, 0, 0.4862745, 1,
1.420259, -0.3371339, 0.3008528, 1, 0, 0.4784314, 1,
1.434546, 0.4222878, 0.855696, 1, 0, 0.4745098, 1,
1.434786, -1.004735, 3.094098, 1, 0, 0.4666667, 1,
1.43864, 0.3969185, 1.847202, 1, 0, 0.4627451, 1,
1.461111, -0.3457453, 1.977588, 1, 0, 0.454902, 1,
1.472865, 0.93773, 1.810267, 1, 0, 0.4509804, 1,
1.475444, 0.5793511, 1.566149, 1, 0, 0.4431373, 1,
1.484659, -0.7056347, 0.592181, 1, 0, 0.4392157, 1,
1.486183, 1.277997, 0.9472154, 1, 0, 0.4313726, 1,
1.487446, 1.203887, 0.4201325, 1, 0, 0.427451, 1,
1.488135, -0.2434442, 3.317998, 1, 0, 0.4196078, 1,
1.490371, 0.8742015, -0.4319732, 1, 0, 0.4156863, 1,
1.491069, 1.402617, 1.005284, 1, 0, 0.4078431, 1,
1.512575, -1.095273, 1.991768, 1, 0, 0.4039216, 1,
1.513878, -0.8941827, 3.025554, 1, 0, 0.3960784, 1,
1.515526, -1.908299, 2.872678, 1, 0, 0.3882353, 1,
1.523494, -1.693109, 2.331519, 1, 0, 0.3843137, 1,
1.544877, 1.072594, 0.5261757, 1, 0, 0.3764706, 1,
1.546987, -0.9222599, 1.754862, 1, 0, 0.372549, 1,
1.547123, -0.6703302, 2.450017, 1, 0, 0.3647059, 1,
1.549591, -2.072472, 1.278552, 1, 0, 0.3607843, 1,
1.553581, 0.7446804, -0.1284432, 1, 0, 0.3529412, 1,
1.557029, 0.28376, 2.30166, 1, 0, 0.3490196, 1,
1.571784, 0.7065216, 0.3656694, 1, 0, 0.3411765, 1,
1.584603, -0.5129076, 2.062945, 1, 0, 0.3372549, 1,
1.594801, -0.4564765, 2.197192, 1, 0, 0.3294118, 1,
1.604955, -1.557953, 1.692734, 1, 0, 0.3254902, 1,
1.607269, -0.1566993, 1.717524, 1, 0, 0.3176471, 1,
1.618489, -0.6666616, 3.231806, 1, 0, 0.3137255, 1,
1.627783, 0.6424292, -1.789337, 1, 0, 0.3058824, 1,
1.631986, -1.090025, 0.3762809, 1, 0, 0.2980392, 1,
1.635729, 1.031652, -0.3535585, 1, 0, 0.2941177, 1,
1.638688, -0.5748823, 0.6316734, 1, 0, 0.2862745, 1,
1.650038, 0.2102764, 1.202641, 1, 0, 0.282353, 1,
1.66097, -1.530913, 3.670175, 1, 0, 0.2745098, 1,
1.662523, 1.573207, 0.135068, 1, 0, 0.2705882, 1,
1.666009, -0.4333234, 2.706741, 1, 0, 0.2627451, 1,
1.668672, 0.6284491, 1.114813, 1, 0, 0.2588235, 1,
1.677025, 0.8775097, 1.659292, 1, 0, 0.2509804, 1,
1.723287, 2.494615, 1.763327, 1, 0, 0.2470588, 1,
1.726137, -0.8414013, 2.140804, 1, 0, 0.2392157, 1,
1.741996, -1.064552, 1.675887, 1, 0, 0.2352941, 1,
1.751126, -0.5535651, 1.92002, 1, 0, 0.227451, 1,
1.760975, 0.3239182, 3.632426, 1, 0, 0.2235294, 1,
1.766111, 0.9706925, -0.2267375, 1, 0, 0.2156863, 1,
1.781148, -0.1448101, 2.446752, 1, 0, 0.2117647, 1,
1.794101, 0.0814268, 1.11441, 1, 0, 0.2039216, 1,
1.794756, -1.38718, 1.810035, 1, 0, 0.1960784, 1,
1.825513, 1.265903, 1.250872, 1, 0, 0.1921569, 1,
1.848926, -0.6088966, 0.7668615, 1, 0, 0.1843137, 1,
1.85509, -0.3175314, 0.9282466, 1, 0, 0.1803922, 1,
1.857542, -1.544763, 2.048254, 1, 0, 0.172549, 1,
1.859014, -0.7117307, 0.49821, 1, 0, 0.1686275, 1,
1.864486, -0.05942364, 2.253016, 1, 0, 0.1607843, 1,
1.892296, 0.006446335, 2.7884, 1, 0, 0.1568628, 1,
1.948229, -1.313023, 3.25812, 1, 0, 0.1490196, 1,
1.988362, -0.7807766, 1.784213, 1, 0, 0.145098, 1,
2.025509, -1.062871, 2.352976, 1, 0, 0.1372549, 1,
2.084249, -0.6473887, 2.277254, 1, 0, 0.1333333, 1,
2.130846, 0.1422898, 0.9812797, 1, 0, 0.1254902, 1,
2.134934, 0.4029282, 2.763751, 1, 0, 0.1215686, 1,
2.177659, -1.755331, 2.834228, 1, 0, 0.1137255, 1,
2.20393, -0.2189625, 1.882975, 1, 0, 0.1098039, 1,
2.211841, 0.8830356, 0.362297, 1, 0, 0.1019608, 1,
2.217859, 0.2280584, 0.8279444, 1, 0, 0.09411765, 1,
2.440152, 2.426353, 0.3788534, 1, 0, 0.09019608, 1,
2.481346, -0.845201, 2.594489, 1, 0, 0.08235294, 1,
2.487075, -0.2703691, 1.060032, 1, 0, 0.07843138, 1,
2.505346, -0.3179946, 2.72997, 1, 0, 0.07058824, 1,
2.584941, -0.04379693, 1.196258, 1, 0, 0.06666667, 1,
2.652811, -0.7591297, -0.1318716, 1, 0, 0.05882353, 1,
2.691682, 0.5106311, 0.7928875, 1, 0, 0.05490196, 1,
2.718141, -2.092709, 2.149013, 1, 0, 0.04705882, 1,
2.729761, 0.2515301, 2.856888, 1, 0, 0.04313726, 1,
2.741611, -1.05587, 2.534992, 1, 0, 0.03529412, 1,
2.751534, 0.7989351, 0.7906806, 1, 0, 0.03137255, 1,
3.064319, 0.4149907, 0.5894431, 1, 0, 0.02352941, 1,
3.078381, 0.1621047, 0.9993006, 1, 0, 0.01960784, 1,
3.118476, -1.674857, 2.700413, 1, 0, 0.01176471, 1,
3.220004, 0.5089478, 1.171779, 1, 0, 0.007843138, 1
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
0.04548478, -4.014607, -8.316364, 0, -0.5, 0.5, 0.5,
0.04548478, -4.014607, -8.316364, 1, -0.5, 0.5, 0.5,
0.04548478, -4.014607, -8.316364, 1, 1.5, 0.5, 0.5,
0.04548478, -4.014607, -8.316364, 0, 1.5, 0.5, 0.5
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
-4.205196, -0.1028955, -8.316364, 0, -0.5, 0.5, 0.5,
-4.205196, -0.1028955, -8.316364, 1, -0.5, 0.5, 0.5,
-4.205196, -0.1028955, -8.316364, 1, 1.5, 0.5, 0.5,
-4.205196, -0.1028955, -8.316364, 0, 1.5, 0.5, 0.5
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
-4.205196, -4.014607, -0.7061107, 0, -0.5, 0.5, 0.5,
-4.205196, -4.014607, -0.7061107, 1, -0.5, 0.5, 0.5,
-4.205196, -4.014607, -0.7061107, 1, 1.5, 0.5, 0.5,
-4.205196, -4.014607, -0.7061107, 0, 1.5, 0.5, 0.5
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
-3, -3.111904, -6.560152,
3, -3.111904, -6.560152,
-3, -3.111904, -6.560152,
-3, -3.262355, -6.852854,
-2, -3.111904, -6.560152,
-2, -3.262355, -6.852854,
-1, -3.111904, -6.560152,
-1, -3.262355, -6.852854,
0, -3.111904, -6.560152,
0, -3.262355, -6.852854,
1, -3.111904, -6.560152,
1, -3.262355, -6.852854,
2, -3.111904, -6.560152,
2, -3.262355, -6.852854,
3, -3.111904, -6.560152,
3, -3.262355, -6.852854
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
-3, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
-3, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
-3, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
-3, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
-2, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
-2, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
-2, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
-2, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
-1, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
-1, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
-1, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
-1, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
0, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
0, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
0, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
0, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
1, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
1, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
1, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
1, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
2, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
2, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
2, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
2, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5,
3, -3.563256, -7.438258, 0, -0.5, 0.5, 0.5,
3, -3.563256, -7.438258, 1, -0.5, 0.5, 0.5,
3, -3.563256, -7.438258, 1, 1.5, 0.5, 0.5,
3, -3.563256, -7.438258, 0, 1.5, 0.5, 0.5
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
-3.22427, -3, -6.560152,
-3.22427, 2, -6.560152,
-3.22427, -3, -6.560152,
-3.387757, -3, -6.852854,
-3.22427, -2, -6.560152,
-3.387757, -2, -6.852854,
-3.22427, -1, -6.560152,
-3.387757, -1, -6.852854,
-3.22427, 0, -6.560152,
-3.387757, 0, -6.852854,
-3.22427, 1, -6.560152,
-3.387757, 1, -6.852854,
-3.22427, 2, -6.560152,
-3.387757, 2, -6.852854
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
-3.714733, -3, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, -3, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, -3, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, -3, -7.438258, 0, 1.5, 0.5, 0.5,
-3.714733, -2, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, -2, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, -2, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, -2, -7.438258, 0, 1.5, 0.5, 0.5,
-3.714733, -1, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, -1, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, -1, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, -1, -7.438258, 0, 1.5, 0.5, 0.5,
-3.714733, 0, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, 0, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, 0, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, 0, -7.438258, 0, 1.5, 0.5, 0.5,
-3.714733, 1, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, 1, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, 1, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, 1, -7.438258, 0, 1.5, 0.5, 0.5,
-3.714733, 2, -7.438258, 0, -0.5, 0.5, 0.5,
-3.714733, 2, -7.438258, 1, -0.5, 0.5, 0.5,
-3.714733, 2, -7.438258, 1, 1.5, 0.5, 0.5,
-3.714733, 2, -7.438258, 0, 1.5, 0.5, 0.5
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
-3.22427, -3.111904, -6,
-3.22427, -3.111904, 4,
-3.22427, -3.111904, -6,
-3.387757, -3.262355, -6,
-3.22427, -3.111904, -4,
-3.387757, -3.262355, -4,
-3.22427, -3.111904, -2,
-3.387757, -3.262355, -2,
-3.22427, -3.111904, 0,
-3.387757, -3.262355, 0,
-3.22427, -3.111904, 2,
-3.387757, -3.262355, 2,
-3.22427, -3.111904, 4,
-3.387757, -3.262355, 4
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
-3.714733, -3.563256, -6, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -6, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -6, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, -6, 0, 1.5, 0.5, 0.5,
-3.714733, -3.563256, -4, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -4, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -4, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, -4, 0, 1.5, 0.5, 0.5,
-3.714733, -3.563256, -2, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -2, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, -2, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, -2, 0, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 0, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 0, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 0, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 0, 0, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 2, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 2, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 2, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 2, 0, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 4, 0, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 4, 1, -0.5, 0.5, 0.5,
-3.714733, -3.563256, 4, 1, 1.5, 0.5, 0.5,
-3.714733, -3.563256, 4, 0, 1.5, 0.5, 0.5
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
-3.22427, -3.111904, -6.560152,
-3.22427, 2.906113, -6.560152,
-3.22427, -3.111904, 5.14793,
-3.22427, 2.906113, 5.14793,
-3.22427, -3.111904, -6.560152,
-3.22427, -3.111904, 5.14793,
-3.22427, 2.906113, -6.560152,
-3.22427, 2.906113, 5.14793,
-3.22427, -3.111904, -6.560152,
3.315239, -3.111904, -6.560152,
-3.22427, -3.111904, 5.14793,
3.315239, -3.111904, 5.14793,
-3.22427, 2.906113, -6.560152,
3.315239, 2.906113, -6.560152,
-3.22427, 2.906113, 5.14793,
3.315239, 2.906113, 5.14793,
3.315239, -3.111904, -6.560152,
3.315239, 2.906113, -6.560152,
3.315239, -3.111904, 5.14793,
3.315239, 2.906113, 5.14793,
3.315239, -3.111904, -6.560152,
3.315239, -3.111904, 5.14793,
3.315239, 2.906113, -6.560152,
3.315239, 2.906113, 5.14793
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
var radius = 7.848986;
var distance = 34.92102;
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
mvMatrix.translate( -0.04548478, 0.1028955, 0.7061107 );
mvMatrix.scale( 1.297724, 1.410178, 0.7248393 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92102);
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
haloxyfop-etotyl<-read.table("haloxyfop-etotyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-haloxyfop-etotyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop-etotyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop-etotyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
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
-3.129034, -1.591007, -3.231339, 0, 0, 1, 1, 1,
-3.095966, 0.5428114, -1.094274, 1, 0, 0, 1, 1,
-2.874777, 0.4228152, -2.118905, 1, 0, 0, 1, 1,
-2.700347, 1.344465, -3.433402, 1, 0, 0, 1, 1,
-2.682777, 0.8644921, -2.026277, 1, 0, 0, 1, 1,
-2.567097, -0.6745539, -1.742915, 1, 0, 0, 1, 1,
-2.471235, 1.347812, -2.355799, 0, 0, 0, 1, 1,
-2.417597, 1.102803, -0.9809191, 0, 0, 0, 1, 1,
-2.407199, -1.931518, -2.839063, 0, 0, 0, 1, 1,
-2.397992, -1.102908, -4.622602, 0, 0, 0, 1, 1,
-2.262151, 0.5923076, -1.937186, 0, 0, 0, 1, 1,
-2.240163, 0.254461, -2.717322, 0, 0, 0, 1, 1,
-2.223204, 1.825772, -1.234983, 0, 0, 0, 1, 1,
-2.196597, 1.078035, 0.1596385, 1, 1, 1, 1, 1,
-2.164255, -0.9872849, -3.033953, 1, 1, 1, 1, 1,
-2.143751, -0.773079, -3.76819, 1, 1, 1, 1, 1,
-2.130653, 0.3854769, -1.989884, 1, 1, 1, 1, 1,
-2.121663, 0.9470718, -0.4263346, 1, 1, 1, 1, 1,
-2.090798, -1.489059, -3.013627, 1, 1, 1, 1, 1,
-2.085711, 1.368147, -1.422194, 1, 1, 1, 1, 1,
-2.057359, 0.905109, -1.49101, 1, 1, 1, 1, 1,
-2.044443, -0.8896181, -1.312419, 1, 1, 1, 1, 1,
-2.025562, -1.324752, -1.367996, 1, 1, 1, 1, 1,
-2.02163, 0.2466369, -0.8700065, 1, 1, 1, 1, 1,
-2.021204, 0.2096421, -0.3448763, 1, 1, 1, 1, 1,
-1.976998, -0.2177695, -1.171284, 1, 1, 1, 1, 1,
-1.970647, -0.6502628, -2.648779, 1, 1, 1, 1, 1,
-1.966104, -0.2499426, -1.097865, 1, 1, 1, 1, 1,
-1.916438, -1.896691, -2.550236, 0, 0, 1, 1, 1,
-1.897331, 0.380041, -1.700559, 1, 0, 0, 1, 1,
-1.886208, -1.439972, -1.868465, 1, 0, 0, 1, 1,
-1.879653, -1.621442, -3.49927, 1, 0, 0, 1, 1,
-1.867926, -1.271675, -0.4303686, 1, 0, 0, 1, 1,
-1.84236, 0.7940735, -1.411332, 1, 0, 0, 1, 1,
-1.826764, -1.304328, -2.614366, 0, 0, 0, 1, 1,
-1.787258, 1.075522, -2.219766, 0, 0, 0, 1, 1,
-1.77502, -0.142814, -1.22417, 0, 0, 0, 1, 1,
-1.770634, 0.5903212, 0.4814853, 0, 0, 0, 1, 1,
-1.753026, -0.4083818, -2.581336, 0, 0, 0, 1, 1,
-1.751761, -0.2130814, -1.254688, 0, 0, 0, 1, 1,
-1.74755, 0.598182, -0.5840862, 0, 0, 0, 1, 1,
-1.740373, 1.329874, 1.24047, 1, 1, 1, 1, 1,
-1.736472, 1.074543, -0.03921647, 1, 1, 1, 1, 1,
-1.72438, 0.339517, -1.187242, 1, 1, 1, 1, 1,
-1.682951, -0.3129059, -1.835866, 1, 1, 1, 1, 1,
-1.672898, 0.5634081, -2.75631, 1, 1, 1, 1, 1,
-1.664501, 0.3796386, 0.6734337, 1, 1, 1, 1, 1,
-1.65637, 0.7057262, -1.269789, 1, 1, 1, 1, 1,
-1.633069, 1.248983, -0.8056275, 1, 1, 1, 1, 1,
-1.631107, -2.334087, -1.853049, 1, 1, 1, 1, 1,
-1.626396, 2.312344, -1.581162, 1, 1, 1, 1, 1,
-1.576742, 1.357537, -0.9785823, 1, 1, 1, 1, 1,
-1.553621, -1.130013, -1.424505, 1, 1, 1, 1, 1,
-1.553016, -1.120592, -3.957675, 1, 1, 1, 1, 1,
-1.551076, -0.006391023, -2.586175, 1, 1, 1, 1, 1,
-1.550222, -0.03610315, -1.583653, 1, 1, 1, 1, 1,
-1.521463, -0.1593011, 0.2490051, 0, 0, 1, 1, 1,
-1.509682, -0.2861315, -1.694924, 1, 0, 0, 1, 1,
-1.5006, -1.613135, -3.533434, 1, 0, 0, 1, 1,
-1.487956, -0.3284692, -2.938017, 1, 0, 0, 1, 1,
-1.484567, -0.7765216, -2.598588, 1, 0, 0, 1, 1,
-1.47684, 1.850928, -0.8154009, 1, 0, 0, 1, 1,
-1.468989, 0.3733324, -1.239427, 0, 0, 0, 1, 1,
-1.458176, -0.893304, -1.381352, 0, 0, 0, 1, 1,
-1.452446, 0.02625457, -0.06627133, 0, 0, 0, 1, 1,
-1.45001, 0.9468929, -2.17763, 0, 0, 0, 1, 1,
-1.431204, 0.194584, -0.9762631, 0, 0, 0, 1, 1,
-1.425137, 0.6206577, -1.464617, 0, 0, 0, 1, 1,
-1.422008, -0.3677631, -0.9811242, 0, 0, 0, 1, 1,
-1.419529, 0.3144403, -0.09854088, 1, 1, 1, 1, 1,
-1.405298, 0.1045712, -0.6671609, 1, 1, 1, 1, 1,
-1.399538, -0.4724021, -1.29676, 1, 1, 1, 1, 1,
-1.399396, 0.5330445, -1.194814, 1, 1, 1, 1, 1,
-1.396978, 0.9363724, -0.4075324, 1, 1, 1, 1, 1,
-1.381408, 0.8381584, -1.807624, 1, 1, 1, 1, 1,
-1.371424, -0.2910849, -1.693438, 1, 1, 1, 1, 1,
-1.370636, -1.272745, -3.117852, 1, 1, 1, 1, 1,
-1.370528, 0.820694, -0.3319983, 1, 1, 1, 1, 1,
-1.366423, 1.041872, -1.329476, 1, 1, 1, 1, 1,
-1.355234, 0.2775254, -1.977792, 1, 1, 1, 1, 1,
-1.348782, -2.113928, -2.941377, 1, 1, 1, 1, 1,
-1.344687, -0.1941836, -2.803109, 1, 1, 1, 1, 1,
-1.344381, -0.8856801, -1.601803, 1, 1, 1, 1, 1,
-1.338131, -0.0231546, -3.672388, 1, 1, 1, 1, 1,
-1.327365, 1.665982, 0.2309082, 0, 0, 1, 1, 1,
-1.311056, -1.243575, -2.278329, 1, 0, 0, 1, 1,
-1.311048, 1.001226, -2.237936, 1, 0, 0, 1, 1,
-1.297203, 0.7984776, -1.895264, 1, 0, 0, 1, 1,
-1.292426, 2.395597, 0.1843386, 1, 0, 0, 1, 1,
-1.291408, 1.191083, -1.341719, 1, 0, 0, 1, 1,
-1.286702, 0.7526971, 0.1454235, 0, 0, 0, 1, 1,
-1.285771, -0.7432735, -3.82205, 0, 0, 0, 1, 1,
-1.282108, -2.490151, -2.991469, 0, 0, 0, 1, 1,
-1.27937, -0.6416132, -0.9853693, 0, 0, 0, 1, 1,
-1.272764, -0.390517, -1.529977, 0, 0, 0, 1, 1,
-1.257585, -0.6083586, -2.257842, 0, 0, 0, 1, 1,
-1.252675, 0.6953276, -0.8047275, 0, 0, 0, 1, 1,
-1.251987, 0.2248983, -2.16861, 1, 1, 1, 1, 1,
-1.247853, 1.42022, -2.784737, 1, 1, 1, 1, 1,
-1.241126, 1.025167, -1.479163, 1, 1, 1, 1, 1,
-1.224016, 0.4654918, -1.628321, 1, 1, 1, 1, 1,
-1.222405, -1.166995, -3.007811, 1, 1, 1, 1, 1,
-1.209368, -0.4736711, -2.558139, 1, 1, 1, 1, 1,
-1.202176, -1.06626, -2.494081, 1, 1, 1, 1, 1,
-1.199972, 0.4607236, -2.452382, 1, 1, 1, 1, 1,
-1.192429, 0.454556, -2.626284, 1, 1, 1, 1, 1,
-1.188583, 1.286116, -1.332364, 1, 1, 1, 1, 1,
-1.179716, -0.9597231, -2.455901, 1, 1, 1, 1, 1,
-1.162762, -0.1470314, -1.234725, 1, 1, 1, 1, 1,
-1.139513, 0.1318062, -1.238546, 1, 1, 1, 1, 1,
-1.136568, 1.437233, 1.259492, 1, 1, 1, 1, 1,
-1.126046, -1.877906, -2.931451, 1, 1, 1, 1, 1,
-1.12541, 2.223856, 0.3878621, 0, 0, 1, 1, 1,
-1.118242, 0.7165062, -0.3349724, 1, 0, 0, 1, 1,
-1.116826, -0.2412598, -1.824901, 1, 0, 0, 1, 1,
-1.103804, -0.5491522, -0.7388989, 1, 0, 0, 1, 1,
-1.098032, -1.556723, -2.386488, 1, 0, 0, 1, 1,
-1.08556, -0.4168027, -3.618738, 1, 0, 0, 1, 1,
-1.083836, 0.2882742, -1.113677, 0, 0, 0, 1, 1,
-1.079561, 0.538306, -1.74693, 0, 0, 0, 1, 1,
-1.076304, -0.5732071, -2.441935, 0, 0, 0, 1, 1,
-1.067652, -0.004571134, -1.161731, 0, 0, 0, 1, 1,
-1.066555, -1.877008, -2.66545, 0, 0, 0, 1, 1,
-1.063971, 1.53883, 0.09813975, 0, 0, 0, 1, 1,
-1.061188, -0.7692412, -2.236738, 0, 0, 0, 1, 1,
-1.054178, -1.571777, -0.6041176, 1, 1, 1, 1, 1,
-1.053442, -0.8029332, -0.3920687, 1, 1, 1, 1, 1,
-1.053157, -0.8217962, -1.525339, 1, 1, 1, 1, 1,
-1.033741, -0.7462697, -1.970123, 1, 1, 1, 1, 1,
-1.033002, 0.2571112, -1.867542, 1, 1, 1, 1, 1,
-1.032865, -0.9398521, -2.36132, 1, 1, 1, 1, 1,
-1.027495, 0.6785499, -1.480583, 1, 1, 1, 1, 1,
-1.011688, -0.2288525, 0.5287042, 1, 1, 1, 1, 1,
-1.010042, -0.8029404, -3.15785, 1, 1, 1, 1, 1,
-1.009299, -0.9899481, -1.760348, 1, 1, 1, 1, 1,
-1.005957, -0.6546041, -2.165116, 1, 1, 1, 1, 1,
-1.00574, 1.097394, 0.6007128, 1, 1, 1, 1, 1,
-1.00341, 0.3986357, -1.572736, 1, 1, 1, 1, 1,
-0.9925007, -0.8734375, -3.213526, 1, 1, 1, 1, 1,
-0.9904351, 0.08612766, -1.026797, 1, 1, 1, 1, 1,
-0.9864959, 1.449982, -1.210937, 0, 0, 1, 1, 1,
-0.9794405, 0.1412643, -1.501698, 1, 0, 0, 1, 1,
-0.9773231, 1.808892, -1.247393, 1, 0, 0, 1, 1,
-0.9740162, 0.4307126, -2.272932, 1, 0, 0, 1, 1,
-0.9707786, 0.2698856, -0.8133947, 1, 0, 0, 1, 1,
-0.9683416, -0.3114169, -0.4737597, 1, 0, 0, 1, 1,
-0.9594138, -1.776336, -2.200667, 0, 0, 0, 1, 1,
-0.9547948, -0.2135054, -1.47983, 0, 0, 0, 1, 1,
-0.9502242, 0.9032336, -0.5492963, 0, 0, 0, 1, 1,
-0.9455959, 0.6371852, -0.9028895, 0, 0, 0, 1, 1,
-0.9317685, 0.3953906, -1.892446, 0, 0, 0, 1, 1,
-0.9270664, -1.269184, -3.471421, 0, 0, 0, 1, 1,
-0.917989, 1.927358, -2.278257, 0, 0, 0, 1, 1,
-0.916433, -0.09851066, -3.188984, 1, 1, 1, 1, 1,
-0.916303, -1.690782, -2.677097, 1, 1, 1, 1, 1,
-0.9148949, -0.2124133, -1.960455, 1, 1, 1, 1, 1,
-0.9128274, -0.2236936, 0.008173035, 1, 1, 1, 1, 1,
-0.9125025, -0.7711943, -2.039343, 1, 1, 1, 1, 1,
-0.9052512, -0.8659244, -4.360872, 1, 1, 1, 1, 1,
-0.9000494, 0.5683395, -2.050821, 1, 1, 1, 1, 1,
-0.8858536, 0.7400526, -1.14269, 1, 1, 1, 1, 1,
-0.883874, 2.000069, -2.17387, 1, 1, 1, 1, 1,
-0.8812929, -0.1899718, -2.214527, 1, 1, 1, 1, 1,
-0.8802912, 1.495571, 0.7479185, 1, 1, 1, 1, 1,
-0.8774495, 0.528281, -1.103864, 1, 1, 1, 1, 1,
-0.8737518, 2.446514, -0.009334345, 1, 1, 1, 1, 1,
-0.8667411, -0.1570876, -0.7606208, 1, 1, 1, 1, 1,
-0.8666328, -0.9569428, -2.423197, 1, 1, 1, 1, 1,
-0.8588087, 0.02484019, -1.179602, 0, 0, 1, 1, 1,
-0.8542854, 1.052088, -1.402495, 1, 0, 0, 1, 1,
-0.8522499, -0.2096693, -0.4475555, 1, 0, 0, 1, 1,
-0.8404669, 1.865029, 0.01547091, 1, 0, 0, 1, 1,
-0.8358234, 0.2724632, -1.211991, 1, 0, 0, 1, 1,
-0.831425, -0.03247766, -1.445878, 1, 0, 0, 1, 1,
-0.8260061, -0.9494997, -2.342502, 0, 0, 0, 1, 1,
-0.8239253, -1.813718, -4.445256, 0, 0, 0, 1, 1,
-0.8175597, 1.079371, -0.8267508, 0, 0, 0, 1, 1,
-0.810926, 1.462637, -0.559995, 0, 0, 0, 1, 1,
-0.8045766, -0.4410413, -2.877888, 0, 0, 0, 1, 1,
-0.8027031, 0.530997, 0.05101316, 0, 0, 0, 1, 1,
-0.8008777, 0.08207861, -0.9953563, 0, 0, 0, 1, 1,
-0.8000609, 0.448293, -0.9837285, 1, 1, 1, 1, 1,
-0.7999443, -1.072451, -3.890597, 1, 1, 1, 1, 1,
-0.7968026, 0.2967527, -2.571917, 1, 1, 1, 1, 1,
-0.7927171, 1.552848, -1.223837, 1, 1, 1, 1, 1,
-0.7893047, -0.8244351, -1.890039, 1, 1, 1, 1, 1,
-0.7871032, 0.8384849, -0.9852696, 1, 1, 1, 1, 1,
-0.7847764, 0.2015108, 0.3097729, 1, 1, 1, 1, 1,
-0.7820342, 1.829444, 0.1312449, 1, 1, 1, 1, 1,
-0.7742001, -0.8654343, -3.243635, 1, 1, 1, 1, 1,
-0.7582488, -0.948461, -1.749974, 1, 1, 1, 1, 1,
-0.755824, 1.907947, -0.1226269, 1, 1, 1, 1, 1,
-0.7488324, 2.30973, -2.024448, 1, 1, 1, 1, 1,
-0.7460377, 0.4215534, -1.223762, 1, 1, 1, 1, 1,
-0.7457225, -0.2550672, -1.939368, 1, 1, 1, 1, 1,
-0.7441753, -1.113802, -4.264536, 1, 1, 1, 1, 1,
-0.7437997, -0.3323009, -1.598242, 0, 0, 1, 1, 1,
-0.7401906, -0.5409896, -2.653672, 1, 0, 0, 1, 1,
-0.7372986, -0.2217698, -1.533527, 1, 0, 0, 1, 1,
-0.7358832, 0.9773911, -2.212597, 1, 0, 0, 1, 1,
-0.7342766, 1.330209, 2.296035, 1, 0, 0, 1, 1,
-0.7305991, 1.216689, -0.8262359, 1, 0, 0, 1, 1,
-0.7302839, 0.06964444, -1.92742, 0, 0, 0, 1, 1,
-0.7290506, -1.315788, -2.485198, 0, 0, 0, 1, 1,
-0.7276581, 0.7516229, -0.1071601, 0, 0, 0, 1, 1,
-0.7235903, -0.6788337, -3.272971, 0, 0, 0, 1, 1,
-0.7188455, 0.8326094, -0.9273164, 0, 0, 0, 1, 1,
-0.7172039, 0.9497804, -1.038416, 0, 0, 0, 1, 1,
-0.7132143, 0.03356816, -3.28914, 0, 0, 0, 1, 1,
-0.7098671, -2.701921, -2.069427, 1, 1, 1, 1, 1,
-0.7083777, -0.4747413, -0.6080989, 1, 1, 1, 1, 1,
-0.705782, 0.7142865, -2.204523, 1, 1, 1, 1, 1,
-0.7043454, 0.05722982, -1.908422, 1, 1, 1, 1, 1,
-0.7040331, 2.818472, 1.149904, 1, 1, 1, 1, 1,
-0.702119, 0.623041, -1.477555, 1, 1, 1, 1, 1,
-0.7010309, -0.4057116, -3.404616, 1, 1, 1, 1, 1,
-0.6999353, 0.1063032, -1.428849, 1, 1, 1, 1, 1,
-0.6994556, 0.8217325, 0.9324768, 1, 1, 1, 1, 1,
-0.6975676, -0.5190035, -2.610769, 1, 1, 1, 1, 1,
-0.696192, -0.0383138, -1.125507, 1, 1, 1, 1, 1,
-0.6961809, 0.2184359, -0.8185049, 1, 1, 1, 1, 1,
-0.6901057, -0.9027037, -2.204309, 1, 1, 1, 1, 1,
-0.6878981, -0.3545103, -2.476237, 1, 1, 1, 1, 1,
-0.6869403, -0.4571191, -2.119258, 1, 1, 1, 1, 1,
-0.6853662, -1.703839, -1.963682, 0, 0, 1, 1, 1,
-0.6803766, 0.5884684, -0.713599, 1, 0, 0, 1, 1,
-0.6791456, 0.8504888, -0.753837, 1, 0, 0, 1, 1,
-0.6746319, 0.9589477, -0.6511209, 1, 0, 0, 1, 1,
-0.6727989, -0.5509083, -1.339371, 1, 0, 0, 1, 1,
-0.6646145, 2.22365, -1.803403, 1, 0, 0, 1, 1,
-0.6639982, 0.8828637, -1.256683, 0, 0, 0, 1, 1,
-0.659915, 0.1164117, -0.991019, 0, 0, 0, 1, 1,
-0.6575788, 1.061307, 0.4485119, 0, 0, 0, 1, 1,
-0.6513236, -1.461539, -3.109163, 0, 0, 0, 1, 1,
-0.6434934, 0.3196771, -1.681439, 0, 0, 0, 1, 1,
-0.6365265, 0.7814764, -2.029602, 0, 0, 0, 1, 1,
-0.6322923, -0.4554099, -2.50341, 0, 0, 0, 1, 1,
-0.6301251, -0.5411165, -2.262096, 1, 1, 1, 1, 1,
-0.6290498, -0.1372346, -2.063421, 1, 1, 1, 1, 1,
-0.6264207, 1.718942, -0.3757714, 1, 1, 1, 1, 1,
-0.6255883, -1.281883, -1.74466, 1, 1, 1, 1, 1,
-0.6227843, -1.921538, -1.989062, 1, 1, 1, 1, 1,
-0.6225839, -0.3063858, 0.04434345, 1, 1, 1, 1, 1,
-0.6205585, 0.3887168, -2.131157, 1, 1, 1, 1, 1,
-0.6198894, 0.05127558, 0.08405153, 1, 1, 1, 1, 1,
-0.6039516, 0.6303127, -3.11183, 1, 1, 1, 1, 1,
-0.6019318, 0.8918204, -2.127438, 1, 1, 1, 1, 1,
-0.600901, -0.5230151, -3.749188, 1, 1, 1, 1, 1,
-0.6001316, 1.778342, -0.559515, 1, 1, 1, 1, 1,
-0.5984881, -1.576548, -2.842449, 1, 1, 1, 1, 1,
-0.5968071, -1.028179, -2.903667, 1, 1, 1, 1, 1,
-0.5963166, 0.904716, -0.2267838, 1, 1, 1, 1, 1,
-0.5947101, -1.235105, -3.572567, 0, 0, 1, 1, 1,
-0.5939, 0.59329, 0.3250202, 1, 0, 0, 1, 1,
-0.5898515, -1.630256, -1.006584, 1, 0, 0, 1, 1,
-0.5873285, -0.5087071, -2.401334, 1, 0, 0, 1, 1,
-0.5858881, 0.5755371, -0.8264587, 1, 0, 0, 1, 1,
-0.5840253, -2.716655, -3.093291, 1, 0, 0, 1, 1,
-0.5835792, 0.05665366, -0.9405808, 0, 0, 0, 1, 1,
-0.5796276, 0.3516407, -1.21542, 0, 0, 0, 1, 1,
-0.5776472, -0.945183, -2.551317, 0, 0, 0, 1, 1,
-0.5772027, 1.448927, 0.4901875, 0, 0, 0, 1, 1,
-0.5758902, -0.9723029, -3.225727, 0, 0, 0, 1, 1,
-0.5665705, 0.1556555, -0.9112082, 0, 0, 0, 1, 1,
-0.5662252, 1.140511, 0.902904, 0, 0, 0, 1, 1,
-0.5638587, -0.09155138, -2.257678, 1, 1, 1, 1, 1,
-0.5615156, -1.995486, -4.354226, 1, 1, 1, 1, 1,
-0.5611809, 0.8631393, -1.062527, 1, 1, 1, 1, 1,
-0.555556, -0.6496132, -3.453092, 1, 1, 1, 1, 1,
-0.5541345, -0.3863783, -0.6622626, 1, 1, 1, 1, 1,
-0.5529686, 2.107666, -0.05980843, 1, 1, 1, 1, 1,
-0.5510854, -0.2390975, -2.365677, 1, 1, 1, 1, 1,
-0.5500687, -1.090151, -3.006952, 1, 1, 1, 1, 1,
-0.5499468, -1.156974, -2.632375, 1, 1, 1, 1, 1,
-0.5492303, 2.259781, -1.237651, 1, 1, 1, 1, 1,
-0.5448456, 1.594857, -0.5814828, 1, 1, 1, 1, 1,
-0.5396391, 1.800084, -1.166957, 1, 1, 1, 1, 1,
-0.5392281, 0.1764586, -2.508066, 1, 1, 1, 1, 1,
-0.5371186, -2.355862, -1.863506, 1, 1, 1, 1, 1,
-0.5360045, -0.2223766, -1.931168, 1, 1, 1, 1, 1,
-0.5328936, 0.8401201, -0.4563382, 0, 0, 1, 1, 1,
-0.5301963, 0.1080167, 1.050708, 1, 0, 0, 1, 1,
-0.5299038, -0.5472793, -1.816558, 1, 0, 0, 1, 1,
-0.5265692, -1.289698, -1.675563, 1, 0, 0, 1, 1,
-0.5260044, -0.4590207, -1.704939, 1, 0, 0, 1, 1,
-0.5256135, -0.115582, -0.2841993, 1, 0, 0, 1, 1,
-0.5212476, -1.318745, -4.259415, 0, 0, 0, 1, 1,
-0.5174929, 0.5498937, 0.09248021, 0, 0, 0, 1, 1,
-0.515283, 0.5603354, -1.849111, 0, 0, 0, 1, 1,
-0.5093228, -0.9543222, 0.5912492, 0, 0, 0, 1, 1,
-0.5056525, -0.1900449, -2.303084, 0, 0, 0, 1, 1,
-0.5056357, -0.5155195, -1.129527, 0, 0, 0, 1, 1,
-0.4944443, -0.05225765, -3.105981, 0, 0, 0, 1, 1,
-0.4910434, -0.07500654, -1.799129, 1, 1, 1, 1, 1,
-0.4907082, 0.4930575, -0.559821, 1, 1, 1, 1, 1,
-0.4893419, -0.6673134, -2.130237, 1, 1, 1, 1, 1,
-0.4890205, -0.1604919, -0.4224431, 1, 1, 1, 1, 1,
-0.4886487, 1.131035, 0.4278083, 1, 1, 1, 1, 1,
-0.4866921, -1.073779, -2.572754, 1, 1, 1, 1, 1,
-0.4862569, -0.102267, -3.025476, 1, 1, 1, 1, 1,
-0.4845639, 0.4468352, 0.6899375, 1, 1, 1, 1, 1,
-0.4823628, -0.2283793, -2.555185, 1, 1, 1, 1, 1,
-0.4807687, -0.30615, -1.879587, 1, 1, 1, 1, 1,
-0.4806157, -1.142049, -3.247079, 1, 1, 1, 1, 1,
-0.4777718, 0.7895555, -0.878839, 1, 1, 1, 1, 1,
-0.4751195, -1.211683, -2.436966, 1, 1, 1, 1, 1,
-0.4721577, -1.449887, -2.831652, 1, 1, 1, 1, 1,
-0.4717239, 1.48904, -0.8614762, 1, 1, 1, 1, 1,
-0.464642, 0.1237782, -0.9839376, 0, 0, 1, 1, 1,
-0.4627793, 0.9544641, -0.3683679, 1, 0, 0, 1, 1,
-0.4618124, -0.5556397, -3.866217, 1, 0, 0, 1, 1,
-0.4594177, -0.09659708, -1.533188, 1, 0, 0, 1, 1,
-0.4590888, -1.578532, -3.950843, 1, 0, 0, 1, 1,
-0.4561402, 0.1387199, 0.2378798, 1, 0, 0, 1, 1,
-0.4465398, -0.4978452, -0.7459946, 0, 0, 0, 1, 1,
-0.4401567, -1.277616, -2.181404, 0, 0, 0, 1, 1,
-0.4325026, -1.282592, -4.026999, 0, 0, 0, 1, 1,
-0.4324413, 0.06614272, 0.241724, 0, 0, 0, 1, 1,
-0.4282792, -0.02050986, -1.044673, 0, 0, 0, 1, 1,
-0.4276851, -1.620289, -2.412322, 0, 0, 0, 1, 1,
-0.4262961, 0.7002599, -0.981692, 0, 0, 0, 1, 1,
-0.423929, 0.5939775, 0.3679499, 1, 1, 1, 1, 1,
-0.4209509, 0.4421103, -1.128493, 1, 1, 1, 1, 1,
-0.4186517, 0.3244742, -1.355972, 1, 1, 1, 1, 1,
-0.4108012, -1.083386, -3.709387, 1, 1, 1, 1, 1,
-0.4088933, 0.4340337, -1.43931, 1, 1, 1, 1, 1,
-0.4044876, 1.307591, -0.3713896, 1, 1, 1, 1, 1,
-0.3991773, 1.183055, -0.1989519, 1, 1, 1, 1, 1,
-0.3964039, 0.2910682, 0.07649971, 1, 1, 1, 1, 1,
-0.3888932, 2.182473, -1.642209, 1, 1, 1, 1, 1,
-0.3768837, 0.08234366, -0.8176892, 1, 1, 1, 1, 1,
-0.37473, 1.07621, -0.5718042, 1, 1, 1, 1, 1,
-0.371892, -0.5047511, -3.564589, 1, 1, 1, 1, 1,
-0.3634534, 1.310402, 0.5857197, 1, 1, 1, 1, 1,
-0.3627179, -0.3782023, -1.698752, 1, 1, 1, 1, 1,
-0.3622318, -0.3189724, -1.438189, 1, 1, 1, 1, 1,
-0.3521696, -1.191547, -3.2993, 0, 0, 1, 1, 1,
-0.349565, 1.068069, 1.1538, 1, 0, 0, 1, 1,
-0.3475319, 0.5848038, 0.8629475, 1, 0, 0, 1, 1,
-0.347412, -0.08584795, -0.5458364, 1, 0, 0, 1, 1,
-0.3459865, 0.7792842, -0.5686347, 1, 0, 0, 1, 1,
-0.345615, -1.21693, -2.789168, 1, 0, 0, 1, 1,
-0.3407086, 0.9687814, -1.247708, 0, 0, 0, 1, 1,
-0.3401412, 0.6042799, 0.7542117, 0, 0, 0, 1, 1,
-0.3377465, 0.285264, -0.2918866, 0, 0, 0, 1, 1,
-0.336726, 0.05642758, -0.8266633, 0, 0, 0, 1, 1,
-0.3328121, -1.65158, -6.389646, 0, 0, 0, 1, 1,
-0.3315864, 0.3418387, -2.652929, 0, 0, 0, 1, 1,
-0.3302727, 0.2171205, -0.3268529, 0, 0, 0, 1, 1,
-0.3249617, -1.275013, -3.138257, 1, 1, 1, 1, 1,
-0.3241982, 1.138163, -1.424382, 1, 1, 1, 1, 1,
-0.3221345, -0.4677018, -2.702693, 1, 1, 1, 1, 1,
-0.321247, -1.0616, -3.685372, 1, 1, 1, 1, 1,
-0.3210015, 0.03378698, -0.863067, 1, 1, 1, 1, 1,
-0.3182566, -1.344286, -1.010544, 1, 1, 1, 1, 1,
-0.3135194, -0.9860737, -1.193149, 1, 1, 1, 1, 1,
-0.3133075, 0.8084349, -0.9772094, 1, 1, 1, 1, 1,
-0.3100075, 1.020073, -0.7784913, 1, 1, 1, 1, 1,
-0.3079175, 0.6285592, -0.4765875, 1, 1, 1, 1, 1,
-0.3075421, -1.056439, -2.806189, 1, 1, 1, 1, 1,
-0.3052582, -0.8565445, -2.922793, 1, 1, 1, 1, 1,
-0.3005733, -1.216548, -1.462462, 1, 1, 1, 1, 1,
-0.2998555, -2.018968, -3.165298, 1, 1, 1, 1, 1,
-0.2970313, 0.3651519, -1.326923, 1, 1, 1, 1, 1,
-0.2937773, -0.6834765, -1.291417, 0, 0, 1, 1, 1,
-0.2849528, 0.7070137, -1.726377, 1, 0, 0, 1, 1,
-0.2843151, -1.268618, -1.142728, 1, 0, 0, 1, 1,
-0.2727081, 0.0005959334, -1.468961, 1, 0, 0, 1, 1,
-0.2719756, 1.584475, 1.469488, 1, 0, 0, 1, 1,
-0.2714344, 0.2547119, -1.182754, 1, 0, 0, 1, 1,
-0.2679768, 1.458662, -2.011729, 0, 0, 0, 1, 1,
-0.2674058, 0.0875198, -0.9657712, 0, 0, 0, 1, 1,
-0.2658603, -0.7778239, -3.474624, 0, 0, 0, 1, 1,
-0.2657247, 0.28425, -1.275572, 0, 0, 0, 1, 1,
-0.2638909, 0.1767451, -0.02609998, 0, 0, 0, 1, 1,
-0.2627887, 0.8117698, 0.9069687, 0, 0, 0, 1, 1,
-0.2619407, -0.2544689, -2.073889, 0, 0, 0, 1, 1,
-0.2571786, 1.124533, -0.0109711, 1, 1, 1, 1, 1,
-0.2526214, -1.270975, -5.121385, 1, 1, 1, 1, 1,
-0.2518315, 1.159332, 0.5410577, 1, 1, 1, 1, 1,
-0.2508385, -1.554906, -2.148659, 1, 1, 1, 1, 1,
-0.2501832, -1.898035, -2.079852, 1, 1, 1, 1, 1,
-0.2424662, -0.8297822, -4.507622, 1, 1, 1, 1, 1,
-0.2412844, -0.4036171, -3.658164, 1, 1, 1, 1, 1,
-0.2391304, -0.7803666, -1.650062, 1, 1, 1, 1, 1,
-0.2313227, 0.1049352, -0.9503936, 1, 1, 1, 1, 1,
-0.2277295, -0.1018328, -0.2084139, 1, 1, 1, 1, 1,
-0.2264678, -1.055794, -4.048352, 1, 1, 1, 1, 1,
-0.2255835, 1.55253, -1.396583, 1, 1, 1, 1, 1,
-0.2248213, -0.400437, -1.811533, 1, 1, 1, 1, 1,
-0.2233398, -1.267056, -2.533017, 1, 1, 1, 1, 1,
-0.2225074, -1.082779, -4.292113, 1, 1, 1, 1, 1,
-0.2185456, -0.8188193, -2.280758, 0, 0, 1, 1, 1,
-0.2149075, -0.5321843, -4.395642, 1, 0, 0, 1, 1,
-0.2143607, -0.6053064, -1.900077, 1, 0, 0, 1, 1,
-0.2126516, 0.2353726, -1.640205, 1, 0, 0, 1, 1,
-0.211969, 1.72738, -1.346973, 1, 0, 0, 1, 1,
-0.2092863, 0.2440877, 0.7608106, 1, 0, 0, 1, 1,
-0.2000992, 0.3322066, -3.209114, 0, 0, 0, 1, 1,
-0.1997572, 0.872631, 1.477797, 0, 0, 0, 1, 1,
-0.1995263, -1.620511, -3.310428, 0, 0, 0, 1, 1,
-0.1993723, -0.8601816, -1.46072, 0, 0, 0, 1, 1,
-0.198295, -0.07180836, -1.969437, 0, 0, 0, 1, 1,
-0.1957232, -1.005655, -1.570888, 0, 0, 0, 1, 1,
-0.1943006, 1.343181, 0.4640119, 0, 0, 0, 1, 1,
-0.1921809, -0.9530609, -3.224451, 1, 1, 1, 1, 1,
-0.1917121, -0.5654244, -2.579615, 1, 1, 1, 1, 1,
-0.1908073, 0.3707855, -0.4265862, 1, 1, 1, 1, 1,
-0.1898689, -0.2542188, -1.448351, 1, 1, 1, 1, 1,
-0.1897919, 0.5801771, 0.7085707, 1, 1, 1, 1, 1,
-0.1893791, -0.3719534, -1.448746, 1, 1, 1, 1, 1,
-0.1888758, -0.1562625, -0.2021332, 1, 1, 1, 1, 1,
-0.1879441, -0.4716262, -3.034149, 1, 1, 1, 1, 1,
-0.1860308, 1.373171, -0.5348963, 1, 1, 1, 1, 1,
-0.1848309, 0.4020646, 0.2651226, 1, 1, 1, 1, 1,
-0.1844254, -0.1576463, -0.8143341, 1, 1, 1, 1, 1,
-0.1827518, -1.269844, -3.538906, 1, 1, 1, 1, 1,
-0.1823228, -1.343543, -3.670258, 1, 1, 1, 1, 1,
-0.1782158, 0.585528, 0.1746041, 1, 1, 1, 1, 1,
-0.1776206, 0.5251562, -0.4151164, 1, 1, 1, 1, 1,
-0.1771693, -0.1545616, -2.072784, 0, 0, 1, 1, 1,
-0.1768985, 0.7880219, -0.6110682, 1, 0, 0, 1, 1,
-0.1766245, -0.04758032, -3.247196, 1, 0, 0, 1, 1,
-0.1759663, -0.6335126, -3.323488, 1, 0, 0, 1, 1,
-0.1753248, 1.89521, -0.3499156, 1, 0, 0, 1, 1,
-0.1729274, 0.3813873, -0.3877465, 1, 0, 0, 1, 1,
-0.1710998, -0.5209003, -3.198511, 0, 0, 0, 1, 1,
-0.1708891, 0.03420058, -0.996112, 0, 0, 0, 1, 1,
-0.1666806, 0.9745746, 0.01214824, 0, 0, 0, 1, 1,
-0.1629425, 0.1613147, -0.4123251, 0, 0, 0, 1, 1,
-0.1615915, 0.9391961, -0.5548694, 0, 0, 0, 1, 1,
-0.1598186, 0.06633703, -1.805718, 0, 0, 0, 1, 1,
-0.1528896, 0.09380854, -2.612895, 0, 0, 0, 1, 1,
-0.1523893, 1.575318, 0.6612017, 1, 1, 1, 1, 1,
-0.1514186, 1.02314, 0.37745, 1, 1, 1, 1, 1,
-0.1470021, -0.8717999, -4.471981, 1, 1, 1, 1, 1,
-0.1453889, 1.450297, -0.6816834, 1, 1, 1, 1, 1,
-0.1443278, -0.2618442, -3.355156, 1, 1, 1, 1, 1,
-0.1409679, 0.3020389, -0.210792, 1, 1, 1, 1, 1,
-0.1399497, 0.5186287, -0.1976261, 1, 1, 1, 1, 1,
-0.1385538, -0.6004952, -3.377479, 1, 1, 1, 1, 1,
-0.1381404, -0.4114724, -2.285982, 1, 1, 1, 1, 1,
-0.1380884, -0.1911855, -0.87422, 1, 1, 1, 1, 1,
-0.13805, 1.877963, 0.6716918, 1, 1, 1, 1, 1,
-0.136086, -0.1451515, -1.395944, 1, 1, 1, 1, 1,
-0.1329019, 0.7866656, 0.04516597, 1, 1, 1, 1, 1,
-0.128866, -0.78635, -2.151956, 1, 1, 1, 1, 1,
-0.128781, 0.265573, -0.8122924, 1, 1, 1, 1, 1,
-0.1248725, 0.5388938, 0.3737567, 0, 0, 1, 1, 1,
-0.1241486, 0.99594, -0.02383883, 1, 0, 0, 1, 1,
-0.1233983, 0.1551157, -1.088872, 1, 0, 0, 1, 1,
-0.1225241, -0.5795282, -4.297415, 1, 0, 0, 1, 1,
-0.1208398, 0.6300881, 1.703105, 1, 0, 0, 1, 1,
-0.1192492, -1.931663, -3.516748, 1, 0, 0, 1, 1,
-0.1153706, -0.6433321, -2.67099, 0, 0, 0, 1, 1,
-0.1151228, 0.09286646, -1.689594, 0, 0, 0, 1, 1,
-0.1120715, -0.5163983, -4.481814, 0, 0, 0, 1, 1,
-0.1101345, -1.375321, -1.866977, 0, 0, 0, 1, 1,
-0.1094746, -1.055483, -1.967167, 0, 0, 0, 1, 1,
-0.1075863, -1.711838, -2.785173, 0, 0, 0, 1, 1,
-0.1073983, 0.2331985, -0.4145299, 0, 0, 0, 1, 1,
-0.1069155, 1.124201, 1.96326, 1, 1, 1, 1, 1,
-0.1056466, 1.254048, 0.9556313, 1, 1, 1, 1, 1,
-0.1053678, 1.091478, 0.653678, 1, 1, 1, 1, 1,
-0.1050462, 0.3424458, -0.8595913, 1, 1, 1, 1, 1,
-0.1040006, 0.7986192, 1.572349, 1, 1, 1, 1, 1,
-0.09919225, 0.246705, -1.805121, 1, 1, 1, 1, 1,
-0.09757105, -0.418103, -3.140289, 1, 1, 1, 1, 1,
-0.09739038, -2.093887, -3.192268, 1, 1, 1, 1, 1,
-0.09410883, -0.781319, -2.155839, 1, 1, 1, 1, 1,
-0.09400491, 0.3764934, -0.6931803, 1, 1, 1, 1, 1,
-0.09177806, -0.07721074, -2.165241, 1, 1, 1, 1, 1,
-0.0906902, -1.917883, -3.226978, 1, 1, 1, 1, 1,
-0.08727577, 1.538315, -0.2941035, 1, 1, 1, 1, 1,
-0.08282206, 1.558274, -0.6979169, 1, 1, 1, 1, 1,
-0.08187235, -0.1693808, -1.804474, 1, 1, 1, 1, 1,
-0.08110384, -0.599835, -1.878227, 0, 0, 1, 1, 1,
-0.08000682, -0.4278308, -4.272839, 1, 0, 0, 1, 1,
-0.07834437, 0.9566575, 1.115326, 1, 0, 0, 1, 1,
-0.07712237, -0.2911546, -1.650873, 1, 0, 0, 1, 1,
-0.06901157, 1.206072, -1.152946, 1, 0, 0, 1, 1,
-0.0684619, 0.8239786, 0.8718382, 1, 0, 0, 1, 1,
-0.06181465, 1.121952, -0.01743237, 0, 0, 0, 1, 1,
-0.05436283, 0.004127069, -0.4605837, 0, 0, 0, 1, 1,
-0.05353295, -0.565518, -4.124034, 0, 0, 0, 1, 1,
-0.0527635, 0.01358304, -0.2785101, 0, 0, 0, 1, 1,
-0.05090206, -0.3396032, -4.115384, 0, 0, 0, 1, 1,
-0.05085135, 1.782292, -0.1942272, 0, 0, 0, 1, 1,
-0.05052339, -1.74571, -2.140693, 0, 0, 0, 1, 1,
-0.04397722, -0.1330255, -0.3820042, 1, 1, 1, 1, 1,
-0.04116127, -1.456617, -2.218416, 1, 1, 1, 1, 1,
-0.03846345, 0.9040881, 1.168681, 1, 1, 1, 1, 1,
-0.03433354, -2.08256, -2.47459, 1, 1, 1, 1, 1,
-0.03051813, -0.4161974, -3.45124, 1, 1, 1, 1, 1,
-0.02638274, 1.140494, -2.194605, 1, 1, 1, 1, 1,
-0.02408081, -0.1376218, -2.998335, 1, 1, 1, 1, 1,
-0.02392892, -0.4540721, -1.115164, 1, 1, 1, 1, 1,
-0.0225625, 0.5003964, -1.936975, 1, 1, 1, 1, 1,
-0.01969735, 1.73756, 0.1698357, 1, 1, 1, 1, 1,
-0.01792435, 1.0834, -0.1471046, 1, 1, 1, 1, 1,
-0.01139589, 1.320663, -0.2871483, 1, 1, 1, 1, 1,
-0.01107086, 1.667922, -1.796335, 1, 1, 1, 1, 1,
-0.009060996, -0.5051595, -2.573099, 1, 1, 1, 1, 1,
-0.008774505, 0.8341948, -1.119063, 1, 1, 1, 1, 1,
-0.007983874, 0.2600044, 1.374067, 0, 0, 1, 1, 1,
-0.007810736, 0.8134897, -0.193753, 1, 0, 0, 1, 1,
-0.007183069, -0.01115239, -2.685923, 1, 0, 0, 1, 1,
-0.004854407, 1.11517, -0.06060463, 1, 0, 0, 1, 1,
-0.002591811, -1.349961, -2.87416, 1, 0, 0, 1, 1,
0.0008106513, -0.8893936, 4.330631, 1, 0, 0, 1, 1,
0.005570392, 0.3860285, -1.699194, 0, 0, 0, 1, 1,
0.007725176, 0.09183583, -1.419935, 0, 0, 0, 1, 1,
0.01392236, -0.23275, 4.298628, 0, 0, 0, 1, 1,
0.01788954, 1.824043, -0.11355, 0, 0, 0, 1, 1,
0.0183874, -0.8606055, 0.9253528, 0, 0, 0, 1, 1,
0.01850803, 0.7090531, -0.2728004, 0, 0, 0, 1, 1,
0.01855542, 0.2039239, 0.264081, 0, 0, 0, 1, 1,
0.02112968, 0.6053324, 0.3601602, 1, 1, 1, 1, 1,
0.02506474, 0.1205795, -0.3211008, 1, 1, 1, 1, 1,
0.02814276, 2.576023, 1.579657, 1, 1, 1, 1, 1,
0.02982515, 0.8090366, 1.619571, 1, 1, 1, 1, 1,
0.03269294, -0.491201, 3.282259, 1, 1, 1, 1, 1,
0.03321863, 0.3717921, 2.028274, 1, 1, 1, 1, 1,
0.0411113, 1.607185, -0.8406084, 1, 1, 1, 1, 1,
0.04318291, -0.1105252, 3.090513, 1, 1, 1, 1, 1,
0.0451094, -0.4000966, 2.186869, 1, 1, 1, 1, 1,
0.04556429, 0.05479942, 0.4901216, 1, 1, 1, 1, 1,
0.04647365, 1.204276, -2.001657, 1, 1, 1, 1, 1,
0.04772448, -0.8030887, 2.466674, 1, 1, 1, 1, 1,
0.05191481, 0.6587914, 1.383422, 1, 1, 1, 1, 1,
0.05339349, 0.9487361, -0.5472914, 1, 1, 1, 1, 1,
0.05585834, -1.699547, 3.118452, 1, 1, 1, 1, 1,
0.05900368, -1.07466, 3.602555, 0, 0, 1, 1, 1,
0.06846803, 2.777677, 2.048621, 1, 0, 0, 1, 1,
0.07279634, -1.12608, 2.321677, 1, 0, 0, 1, 1,
0.0747779, 1.526289, -0.7701851, 1, 0, 0, 1, 1,
0.07888549, -1.164598, 3.10059, 1, 0, 0, 1, 1,
0.0808177, -2.205097, 2.588238, 1, 0, 0, 1, 1,
0.08194415, 0.513504, -0.1487402, 0, 0, 0, 1, 1,
0.08394358, -0.1180368, 3.809983, 0, 0, 0, 1, 1,
0.08475862, 1.482802, 1.115514, 0, 0, 0, 1, 1,
0.08531336, -1.432273, 2.186326, 0, 0, 0, 1, 1,
0.09350519, -0.7024357, 2.50492, 0, 0, 0, 1, 1,
0.09375914, 0.05163879, 1.454515, 0, 0, 0, 1, 1,
0.09769793, -2.362158, 2.935012, 0, 0, 0, 1, 1,
0.09784043, 0.1715913, -0.5422474, 1, 1, 1, 1, 1,
0.09923017, -0.3884715, 2.879028, 1, 1, 1, 1, 1,
0.100139, -0.4961252, 3.235918, 1, 1, 1, 1, 1,
0.1027555, 1.291753, -2.305568, 1, 1, 1, 1, 1,
0.1063593, 0.1016541, -0.602973, 1, 1, 1, 1, 1,
0.1084261, 0.3552176, -1.58191, 1, 1, 1, 1, 1,
0.1085194, -1.233882, 3.505861, 1, 1, 1, 1, 1,
0.1097352, -1.263673, 1.935424, 1, 1, 1, 1, 1,
0.1105241, -1.346169, 2.60082, 1, 1, 1, 1, 1,
0.1201649, 0.4081651, 0.9457851, 1, 1, 1, 1, 1,
0.1216584, 0.4979825, -0.4290757, 1, 1, 1, 1, 1,
0.1226913, -0.9974301, 3.934836, 1, 1, 1, 1, 1,
0.1255857, 1.227715, -0.04299592, 1, 1, 1, 1, 1,
0.131424, -0.3159341, 0.6367474, 1, 1, 1, 1, 1,
0.1355778, -1.805247, 3.727327, 1, 1, 1, 1, 1,
0.14257, -2.222459, 3.810196, 0, 0, 1, 1, 1,
0.1462203, 0.3919795, -0.03233251, 1, 0, 0, 1, 1,
0.1503664, -0.7752421, 3.356915, 1, 0, 0, 1, 1,
0.1527571, -0.161806, 3.011864, 1, 0, 0, 1, 1,
0.1589601, -0.1720499, 0.6512903, 1, 0, 0, 1, 1,
0.1595419, -0.7344922, 3.42275, 1, 0, 0, 1, 1,
0.1597182, 0.06704056, 2.309844, 0, 0, 0, 1, 1,
0.1617986, -1.180892, 1.70901, 0, 0, 0, 1, 1,
0.1618092, 0.2986227, 1.866055, 0, 0, 0, 1, 1,
0.1675413, 0.4379967, -0.5221926, 0, 0, 0, 1, 1,
0.1699541, 1.263262, 1.072971, 0, 0, 0, 1, 1,
0.1705007, -0.9452781, 1.895633, 0, 0, 0, 1, 1,
0.1739088, 1.261945, -0.1575767, 0, 0, 0, 1, 1,
0.1753319, -0.6255262, 2.273815, 1, 1, 1, 1, 1,
0.1770727, 0.6389054, 0.06303718, 1, 1, 1, 1, 1,
0.1799582, 2.229381, 1.863452, 1, 1, 1, 1, 1,
0.1803973, 0.3947711, 1.188387, 1, 1, 1, 1, 1,
0.1805425, -0.1581816, 3.833363, 1, 1, 1, 1, 1,
0.1823695, 1.541011, 1.101762, 1, 1, 1, 1, 1,
0.1829451, 0.9778171, 0.2179994, 1, 1, 1, 1, 1,
0.1885349, 0.3615609, 0.6300323, 1, 1, 1, 1, 1,
0.1907545, -0.6780457, 2.767235, 1, 1, 1, 1, 1,
0.1972091, -1.568092, 3.283515, 1, 1, 1, 1, 1,
0.2020123, 0.08615895, 0.06801362, 1, 1, 1, 1, 1,
0.2078169, -0.8412017, 1.770857, 1, 1, 1, 1, 1,
0.2086031, 0.718629, 1.731023, 1, 1, 1, 1, 1,
0.2092093, -0.1811585, 2.819891, 1, 1, 1, 1, 1,
0.2108385, -0.1802845, 1.66893, 1, 1, 1, 1, 1,
0.2139319, 0.1364607, 0.02602826, 0, 0, 1, 1, 1,
0.2161451, -0.383298, 1.552966, 1, 0, 0, 1, 1,
0.2183726, -0.7443264, 2.753569, 1, 0, 0, 1, 1,
0.2184579, -0.5212237, 3.599679, 1, 0, 0, 1, 1,
0.2187962, -0.5363706, 1.025625, 1, 0, 0, 1, 1,
0.2279038, 0.4000179, -0.51687, 1, 0, 0, 1, 1,
0.2352277, -2.038923, 3.948055, 0, 0, 0, 1, 1,
0.2364047, 0.9109801, -2.104754, 0, 0, 0, 1, 1,
0.2400721, 0.2538899, -0.6686649, 0, 0, 0, 1, 1,
0.2455712, -1.244563, 3.113116, 0, 0, 0, 1, 1,
0.2523912, -0.7540654, 1.519843, 0, 0, 0, 1, 1,
0.2563907, 0.05782003, 0.3843568, 0, 0, 0, 1, 1,
0.2568518, -1.030149, 3.028999, 0, 0, 0, 1, 1,
0.2577394, -0.5479879, 3.919177, 1, 1, 1, 1, 1,
0.2598138, -1.189804, 0.9061345, 1, 1, 1, 1, 1,
0.2609763, -0.4375511, 1.186957, 1, 1, 1, 1, 1,
0.2663545, -0.4221978, 4.133899, 1, 1, 1, 1, 1,
0.2699071, 1.507338, -0.007440509, 1, 1, 1, 1, 1,
0.2772046, -1.11523, 3.641128, 1, 1, 1, 1, 1,
0.2931651, -0.6258412, 2.87421, 1, 1, 1, 1, 1,
0.2938987, -0.715268, 2.175344, 1, 1, 1, 1, 1,
0.2940003, -1.796968, 2.43433, 1, 1, 1, 1, 1,
0.2949685, -1.421787, 3.443501, 1, 1, 1, 1, 1,
0.2950397, 0.9366949, 1.263161, 1, 1, 1, 1, 1,
0.2982516, -0.7949424, 0.8546731, 1, 1, 1, 1, 1,
0.2992271, -1.663286, 1.377949, 1, 1, 1, 1, 1,
0.300293, -0.7981946, 3.755863, 1, 1, 1, 1, 1,
0.3041065, 1.881563, 0.4412992, 1, 1, 1, 1, 1,
0.3043312, -0.2764948, 1.969562, 0, 0, 1, 1, 1,
0.3056911, -0.560389, 2.996629, 1, 0, 0, 1, 1,
0.3058982, -1.127747, 2.871797, 1, 0, 0, 1, 1,
0.3096193, -2.044125, 2.486576, 1, 0, 0, 1, 1,
0.3159558, -0.9678648, 2.905213, 1, 0, 0, 1, 1,
0.3239321, 0.1752413, 0.8596553, 1, 0, 0, 1, 1,
0.3250465, -0.7951664, 4.398224, 0, 0, 0, 1, 1,
0.3266271, -0.02152152, 0.6501577, 0, 0, 0, 1, 1,
0.3301783, 0.03184168, 0.5991748, 0, 0, 0, 1, 1,
0.3306009, -0.9457198, 2.371476, 0, 0, 0, 1, 1,
0.3330176, -1.429547, 2.22204, 0, 0, 0, 1, 1,
0.3353311, -1.867163, 2.863086, 0, 0, 0, 1, 1,
0.3354884, 0.8516141, 1.016392, 0, 0, 0, 1, 1,
0.3367001, -0.8812174, 3.464434, 1, 1, 1, 1, 1,
0.3435562, 0.2879508, 0.1658662, 1, 1, 1, 1, 1,
0.3491387, 0.9231154, -0.2036283, 1, 1, 1, 1, 1,
0.3508156, 0.8087427, -1.17821, 1, 1, 1, 1, 1,
0.35404, 1.932238, -1.868647, 1, 1, 1, 1, 1,
0.3574084, 0.268667, 2.054126, 1, 1, 1, 1, 1,
0.3576733, 1.611411, 0.5635768, 1, 1, 1, 1, 1,
0.3598262, -0.9898908, 1.52457, 1, 1, 1, 1, 1,
0.3686385, 0.5403299, 0.9304678, 1, 1, 1, 1, 1,
0.3711033, -0.9135807, 2.775649, 1, 1, 1, 1, 1,
0.3714426, -0.4095274, 2.98191, 1, 1, 1, 1, 1,
0.3773031, -0.5894375, 4.401777, 1, 1, 1, 1, 1,
0.3791695, -0.8991109, 3.929689, 1, 1, 1, 1, 1,
0.3806835, 0.9757937, 0.5194736, 1, 1, 1, 1, 1,
0.3807317, -0.8536372, 4.138102, 1, 1, 1, 1, 1,
0.3839504, -0.5092755, 3.585093, 0, 0, 1, 1, 1,
0.3849387, 0.1391626, 2.08771, 1, 0, 0, 1, 1,
0.3855723, -0.9860494, 0.4632608, 1, 0, 0, 1, 1,
0.3909611, 0.1136096, 2.325552, 1, 0, 0, 1, 1,
0.3911934, 0.6247859, 1.372542, 1, 0, 0, 1, 1,
0.3928013, -0.7400895, 1.750966, 1, 0, 0, 1, 1,
0.3949465, 0.1059735, -0.05762233, 0, 0, 0, 1, 1,
0.4015688, 0.3053514, 1.650476, 0, 0, 0, 1, 1,
0.40211, -1.327724, 1.641419, 0, 0, 0, 1, 1,
0.4041103, -1.063632, 3.043022, 0, 0, 0, 1, 1,
0.4132533, -0.08744285, 0.2037324, 0, 0, 0, 1, 1,
0.4142803, 0.5565575, -1.463447, 0, 0, 0, 1, 1,
0.414639, 0.43912, 1.360363, 0, 0, 0, 1, 1,
0.4174858, -0.6738092, 2.872797, 1, 1, 1, 1, 1,
0.4202493, 1.8497, -1.207673, 1, 1, 1, 1, 1,
0.4256194, 0.703315, 1.313512, 1, 1, 1, 1, 1,
0.427649, 0.8325151, 0.7179673, 1, 1, 1, 1, 1,
0.4286721, 0.5716534, 1.512548, 1, 1, 1, 1, 1,
0.4309919, -0.07033376, 1.562486, 1, 1, 1, 1, 1,
0.4322654, -1.419507, 2.672957, 1, 1, 1, 1, 1,
0.4363504, -1.123312, 0.831884, 1, 1, 1, 1, 1,
0.437069, -0.5698809, 1.899099, 1, 1, 1, 1, 1,
0.4382817, 0.4740968, 1.074675, 1, 1, 1, 1, 1,
0.4393375, 2.142524, 1.401152, 1, 1, 1, 1, 1,
0.4400383, 0.7646514, -1.108994, 1, 1, 1, 1, 1,
0.4400792, 0.6851528, 0.1678769, 1, 1, 1, 1, 1,
0.4421531, -1.078163, 3.468111, 1, 1, 1, 1, 1,
0.443336, 0.9667642, -0.3642344, 1, 1, 1, 1, 1,
0.4475166, -0.1318661, 1.885644, 0, 0, 1, 1, 1,
0.4479336, -0.5299358, 1.068016, 1, 0, 0, 1, 1,
0.4490601, -0.770021, 2.822265, 1, 0, 0, 1, 1,
0.449081, -0.8829317, 3.139814, 1, 0, 0, 1, 1,
0.4497532, 0.6960793, -1.370166, 1, 0, 0, 1, 1,
0.450633, 0.09753954, 1.294436, 1, 0, 0, 1, 1,
0.4531766, 1.450783, 0.05143749, 0, 0, 0, 1, 1,
0.4603615, -0.5674526, 1.650886, 0, 0, 0, 1, 1,
0.4605975, -0.6512398, 1.397094, 0, 0, 0, 1, 1,
0.4620678, -0.1124521, 1.489466, 0, 0, 0, 1, 1,
0.4654009, 1.487546, 1.982863, 0, 0, 0, 1, 1,
0.4858774, 0.7394117, -0.1393526, 0, 0, 0, 1, 1,
0.4873367, -1.43203, 3.704071, 0, 0, 0, 1, 1,
0.4892829, 1.658997, 0.4058537, 1, 1, 1, 1, 1,
0.4898772, 1.668276, 0.5183563, 1, 1, 1, 1, 1,
0.4910626, -0.2615233, 1.609752, 1, 1, 1, 1, 1,
0.4970104, -0.2839209, 3.030819, 1, 1, 1, 1, 1,
0.497637, -2.814548, 3.752783, 1, 1, 1, 1, 1,
0.4979954, 0.3550589, 1.227551, 1, 1, 1, 1, 1,
0.4997342, -0.9610714, 3.051593, 1, 1, 1, 1, 1,
0.5008833, 1.699334, 0.2364749, 1, 1, 1, 1, 1,
0.5016589, 0.2383848, 3.580711, 1, 1, 1, 1, 1,
0.5016919, -0.816261, 3.031116, 1, 1, 1, 1, 1,
0.502257, -0.04864148, 1.720865, 1, 1, 1, 1, 1,
0.5040617, 1.241006, 2.104154, 1, 1, 1, 1, 1,
0.5093883, -0.5296786, 2.841514, 1, 1, 1, 1, 1,
0.5098159, -0.5684602, 2.326052, 1, 1, 1, 1, 1,
0.5110952, 0.4958673, 1.972992, 1, 1, 1, 1, 1,
0.5186039, 0.752572, 2.245181, 0, 0, 1, 1, 1,
0.518709, 0.3136381, 0.09434724, 1, 0, 0, 1, 1,
0.5189674, 0.01068452, 0.1782245, 1, 0, 0, 1, 1,
0.5203412, 1.333739, 0.1557923, 1, 0, 0, 1, 1,
0.5271446, -1.160144, 2.734511, 1, 0, 0, 1, 1,
0.5290271, 0.1033397, 2.122714, 1, 0, 0, 1, 1,
0.5303004, -0.6116447, 0.6446281, 0, 0, 0, 1, 1,
0.533594, 1.498614, -0.4108917, 0, 0, 0, 1, 1,
0.5344366, 0.9831365, 1.544261, 0, 0, 0, 1, 1,
0.5378402, -2.793548, 2.732237, 0, 0, 0, 1, 1,
0.5387225, 1.124263, -0.7073063, 0, 0, 0, 1, 1,
0.5410867, -0.8862683, 1.627065, 0, 0, 0, 1, 1,
0.5426607, -0.1833298, 0.9121367, 0, 0, 0, 1, 1,
0.5428316, -0.7639475, -0.3578318, 1, 1, 1, 1, 1,
0.544336, -1.103221, 2.973692, 1, 1, 1, 1, 1,
0.5457635, 0.102773, 1.003957, 1, 1, 1, 1, 1,
0.5510253, 1.173252, 0.2332342, 1, 1, 1, 1, 1,
0.5522086, -0.2828015, 1.258913, 1, 1, 1, 1, 1,
0.5609339, 0.2762901, 0.683241, 1, 1, 1, 1, 1,
0.5621861, 0.1989675, 1.070146, 1, 1, 1, 1, 1,
0.5644081, -0.06603093, 0.3392983, 1, 1, 1, 1, 1,
0.566812, -0.001931601, 1.590844, 1, 1, 1, 1, 1,
0.5739128, -3.024263, 2.465434, 1, 1, 1, 1, 1,
0.577315, -1.162215, 4.850192, 1, 1, 1, 1, 1,
0.5823171, -0.1847985, 2.854548, 1, 1, 1, 1, 1,
0.5864627, -1.51263, 1.348299, 1, 1, 1, 1, 1,
0.5901213, -0.8106486, 4.977424, 1, 1, 1, 1, 1,
0.5905073, -0.4729283, 1.749704, 1, 1, 1, 1, 1,
0.5946233, -1.327494, 2.186255, 0, 0, 1, 1, 1,
0.5963193, 0.9491292, 1.036924, 1, 0, 0, 1, 1,
0.5966379, 0.3619476, 0.9901057, 1, 0, 0, 1, 1,
0.598995, -0.04458983, 2.129626, 1, 0, 0, 1, 1,
0.6003551, -0.0796433, 1.243441, 1, 0, 0, 1, 1,
0.6035575, 1.272405, -2.02957, 1, 0, 0, 1, 1,
0.6108416, 0.8908885, 0.7614597, 0, 0, 0, 1, 1,
0.6164294, 1.139638, 1.457519, 0, 0, 0, 1, 1,
0.6192499, 1.064138, 0.472069, 0, 0, 0, 1, 1,
0.6207916, -0.4934359, 3.011595, 0, 0, 0, 1, 1,
0.6208125, 0.2022628, 1.548501, 0, 0, 0, 1, 1,
0.6221744, 0.7314258, 0.5536789, 0, 0, 0, 1, 1,
0.625053, 1.410294, -3.097396, 0, 0, 0, 1, 1,
0.6281782, 0.1882919, -0.6139866, 1, 1, 1, 1, 1,
0.6284045, -0.4952505, 1.871087, 1, 1, 1, 1, 1,
0.6351677, -0.1701593, 1.659613, 1, 1, 1, 1, 1,
0.6363668, 0.6070072, 1.673459, 1, 1, 1, 1, 1,
0.636907, 0.613465, -0.4053409, 1, 1, 1, 1, 1,
0.6395649, -1.871835, 2.71317, 1, 1, 1, 1, 1,
0.6401238, 0.3971465, 0.9502252, 1, 1, 1, 1, 1,
0.6418762, 0.4398315, -0.2412393, 1, 1, 1, 1, 1,
0.6425221, -0.5736249, 1.211654, 1, 1, 1, 1, 1,
0.6468701, 1.382702, 0.3622211, 1, 1, 1, 1, 1,
0.6504986, 0.5980057, 1.459458, 1, 1, 1, 1, 1,
0.658577, -0.7839926, 2.820181, 1, 1, 1, 1, 1,
0.6621702, 1.290707, 0.243622, 1, 1, 1, 1, 1,
0.6655083, -0.4858828, 2.120851, 1, 1, 1, 1, 1,
0.6662947, 0.1632165, 1.856845, 1, 1, 1, 1, 1,
0.6676903, -0.4478657, 2.02247, 0, 0, 1, 1, 1,
0.6704739, 1.028795, 1.541099, 1, 0, 0, 1, 1,
0.6841474, -0.9069155, 4.275203, 1, 0, 0, 1, 1,
0.6857609, 1.751047, 1.265628, 1, 0, 0, 1, 1,
0.6868399, 1.103151, 1.100607, 1, 0, 0, 1, 1,
0.6884142, -0.3101035, 2.559884, 1, 0, 0, 1, 1,
0.6906601, 0.07304654, 0.693702, 0, 0, 0, 1, 1,
0.6906679, 0.264621, 1.247259, 0, 0, 0, 1, 1,
0.6990599, 0.2506312, 1.0934, 0, 0, 0, 1, 1,
0.7006267, 0.8058983, 2.969718, 0, 0, 0, 1, 1,
0.707435, -0.808047, 2.082605, 0, 0, 0, 1, 1,
0.7145284, -0.9548218, 3.360974, 0, 0, 0, 1, 1,
0.7191487, 0.2635126, 1.030677, 0, 0, 0, 1, 1,
0.7207372, 0.1311193, 1.956415, 1, 1, 1, 1, 1,
0.7234545, -0.9257391, 1.549404, 1, 1, 1, 1, 1,
0.7263234, 0.3982629, 1.131863, 1, 1, 1, 1, 1,
0.7276861, -0.8269562, 2.725893, 1, 1, 1, 1, 1,
0.7360633, 0.2975056, 2.244749, 1, 1, 1, 1, 1,
0.7381377, 1.855902, 1.479637, 1, 1, 1, 1, 1,
0.7381607, 0.8893638, 1.758429, 1, 1, 1, 1, 1,
0.7388819, 1.865131, -0.1341025, 1, 1, 1, 1, 1,
0.7446558, 1.023764, -0.3867672, 1, 1, 1, 1, 1,
0.7459799, -0.3006453, 3.488349, 1, 1, 1, 1, 1,
0.7498129, 0.5625548, 0.437323, 1, 1, 1, 1, 1,
0.7510318, 0.3005392, 2.817666, 1, 1, 1, 1, 1,
0.752955, 0.603636, 1.347556, 1, 1, 1, 1, 1,
0.7530708, 0.1987654, 1.492463, 1, 1, 1, 1, 1,
0.7563296, 0.4016678, 0.8446165, 1, 1, 1, 1, 1,
0.7603605, 0.5856208, 0.594999, 0, 0, 1, 1, 1,
0.7606583, -1.075745, 2.715606, 1, 0, 0, 1, 1,
0.7613479, -1.388778, 1.683775, 1, 0, 0, 1, 1,
0.7632693, 0.03096408, 2.684191, 1, 0, 0, 1, 1,
0.7700335, -0.6803964, 2.523956, 1, 0, 0, 1, 1,
0.7717913, -2.556804, 4.495184, 1, 0, 0, 1, 1,
0.7728485, 0.7752774, -0.8515422, 0, 0, 0, 1, 1,
0.7728525, 1.51855, -1.598967, 0, 0, 0, 1, 1,
0.7787888, 1.667019, 2.978843, 0, 0, 0, 1, 1,
0.7837875, -0.1115204, 0.7032506, 0, 0, 0, 1, 1,
0.7891864, 0.3130484, -0.803995, 0, 0, 0, 1, 1,
0.8032547, -0.01066414, 0.5385636, 0, 0, 0, 1, 1,
0.807065, 0.3844528, -6.165168e-05, 0, 0, 0, 1, 1,
0.8079492, -0.8491861, 2.899365, 1, 1, 1, 1, 1,
0.8082549, -1.526072, 3.444249, 1, 1, 1, 1, 1,
0.8098983, -1.37227, 2.882951, 1, 1, 1, 1, 1,
0.8234259, 0.5539997, 1.275843, 1, 1, 1, 1, 1,
0.8262805, 0.5936275, 0.00302596, 1, 1, 1, 1, 1,
0.8296447, 0.6583792, 1.258333, 1, 1, 1, 1, 1,
0.8350884, 0.4341458, 4.663503, 1, 1, 1, 1, 1,
0.8388504, 0.05550142, 1.619654, 1, 1, 1, 1, 1,
0.8437374, -0.6419593, 4.569502, 1, 1, 1, 1, 1,
0.8454862, -0.2006765, 3.484667, 1, 1, 1, 1, 1,
0.8485988, -0.4603068, 1.71864, 1, 1, 1, 1, 1,
0.8507372, 0.1092089, 2.794, 1, 1, 1, 1, 1,
0.8574789, -1.063501, 2.87496, 1, 1, 1, 1, 1,
0.8600155, 0.3887302, -0.3397461, 1, 1, 1, 1, 1,
0.8609397, -1.270442, 2.181961, 1, 1, 1, 1, 1,
0.8610677, 0.3110073, 0.9080593, 0, 0, 1, 1, 1,
0.8614851, 0.3956001, 1.148981, 1, 0, 0, 1, 1,
0.8746109, -0.05644848, 1.197173, 1, 0, 0, 1, 1,
0.8757751, 0.8655792, -1.286585, 1, 0, 0, 1, 1,
0.8758423, -1.243394, 4.155039, 1, 0, 0, 1, 1,
0.8802106, 0.1155707, 1.274639, 1, 0, 0, 1, 1,
0.883316, -1.924646, 2.026218, 0, 0, 0, 1, 1,
0.8913512, 0.07492636, 2.066363, 0, 0, 0, 1, 1,
0.8937699, 0.3852211, 1.133007, 0, 0, 0, 1, 1,
0.9032995, 0.9067128, 1.366897, 0, 0, 0, 1, 1,
0.9074798, -0.05119909, 1.877341, 0, 0, 0, 1, 1,
0.9077308, -1.139844, 3.497066, 0, 0, 0, 1, 1,
0.9123031, -1.61071, 3.142549, 0, 0, 0, 1, 1,
0.9314156, -0.6111515, 0.2390689, 1, 1, 1, 1, 1,
0.9349806, 0.3203423, 0.6680827, 1, 1, 1, 1, 1,
0.9372846, -0.6984633, 3.37656, 1, 1, 1, 1, 1,
0.9385913, 0.8806418, 1.204704, 1, 1, 1, 1, 1,
0.9428315, -0.5433495, 1.509438, 1, 1, 1, 1, 1,
0.9450234, -0.8501691, 1.308882, 1, 1, 1, 1, 1,
0.9467993, -0.07930582, 1.120771, 1, 1, 1, 1, 1,
0.9494442, -0.2371474, -0.172145, 1, 1, 1, 1, 1,
0.949913, 0.5479703, 1.361028, 1, 1, 1, 1, 1,
0.9514289, 1.177227, 0.865546, 1, 1, 1, 1, 1,
0.9581141, -0.5255072, 0.7768164, 1, 1, 1, 1, 1,
0.9583734, -0.01610812, 0.8406991, 1, 1, 1, 1, 1,
0.9611705, -0.9300624, 2.277781, 1, 1, 1, 1, 1,
0.9621146, 0.8137399, 1.359914, 1, 1, 1, 1, 1,
0.9660982, 1.098374, 0.6307145, 1, 1, 1, 1, 1,
0.9667215, -1.756524, 4.243439, 0, 0, 1, 1, 1,
0.9730034, -0.1343077, 1.133978, 1, 0, 0, 1, 1,
0.9764177, -0.8656204, 1.842534, 1, 0, 0, 1, 1,
0.9909109, 0.8501425, 0.2701473, 1, 0, 0, 1, 1,
0.9933602, -1.359108, 4.508106, 1, 0, 0, 1, 1,
1.002195, 1.500179, -0.1279108, 1, 0, 0, 1, 1,
1.023601, -0.01444757, 1.070669, 0, 0, 0, 1, 1,
1.03113, -1.386078, 3.694307, 0, 0, 0, 1, 1,
1.033386, 0.8784747, 1.328267, 0, 0, 0, 1, 1,
1.040879, 1.325179, 1.172803, 0, 0, 0, 1, 1,
1.049485, 1.392972, 1.6386, 0, 0, 0, 1, 1,
1.065783, 1.372317, 0.2168216, 0, 0, 0, 1, 1,
1.066256, -0.6382226, 3.220611, 0, 0, 0, 1, 1,
1.070586, -1.127488, 2.700933, 1, 1, 1, 1, 1,
1.07608, -0.04692427, 0.5879824, 1, 1, 1, 1, 1,
1.079967, 0.3608536, -0.297272, 1, 1, 1, 1, 1,
1.08747, 1.717755, 0.3203993, 1, 1, 1, 1, 1,
1.089381, -0.5143468, 1.227477, 1, 1, 1, 1, 1,
1.098903, 0.2883166, 0.7237771, 1, 1, 1, 1, 1,
1.105103, 0.7645935, 1.788926, 1, 1, 1, 1, 1,
1.107719, 0.01563933, 1.269176, 1, 1, 1, 1, 1,
1.113734, 0.5908511, 0.7739612, 1, 1, 1, 1, 1,
1.117036, 0.7336456, 1.47648, 1, 1, 1, 1, 1,
1.121554, -0.805712, 2.397404, 1, 1, 1, 1, 1,
1.121837, 0.368944, 2.438242, 1, 1, 1, 1, 1,
1.126152, 0.005766496, 1.05773, 1, 1, 1, 1, 1,
1.128645, 2.460883, -1.631123, 1, 1, 1, 1, 1,
1.131637, -0.1979551, 1.038845, 1, 1, 1, 1, 1,
1.131885, -1.180401, 2.836592, 0, 0, 1, 1, 1,
1.133229, -1.477427, 2.299373, 1, 0, 0, 1, 1,
1.133693, -0.3428239, 1.964056, 1, 0, 0, 1, 1,
1.135297, -1.736074, 0.9871601, 1, 0, 0, 1, 1,
1.149516, 0.4565467, 2.358245, 1, 0, 0, 1, 1,
1.152208, -0.1732123, 0.412328, 1, 0, 0, 1, 1,
1.154746, -0.5705068, 3.302485, 0, 0, 0, 1, 1,
1.157775, -1.15646, 1.092333, 0, 0, 0, 1, 1,
1.163013, -1.951359, 2.563087, 0, 0, 0, 1, 1,
1.163814, -0.3555714, 2.827963, 0, 0, 0, 1, 1,
1.177098, -1.768739, 1.943889, 0, 0, 0, 1, 1,
1.185374, 0.2339486, 1.087083, 0, 0, 0, 1, 1,
1.191057, 0.09061407, 2.360505, 0, 0, 0, 1, 1,
1.191726, -0.6100112, 1.509722, 1, 1, 1, 1, 1,
1.194087, -0.6114742, 1.181391, 1, 1, 1, 1, 1,
1.198242, -0.1527868, 1.374776, 1, 1, 1, 1, 1,
1.210951, -0.7757267, 1.482542, 1, 1, 1, 1, 1,
1.211245, 0.005823744, 0.6993318, 1, 1, 1, 1, 1,
1.211861, -0.8771214, 0.1129969, 1, 1, 1, 1, 1,
1.222001, -0.2489508, 1.368077, 1, 1, 1, 1, 1,
1.232335, -0.04411117, 1.206466, 1, 1, 1, 1, 1,
1.236369, -0.1971166, 0.4063115, 1, 1, 1, 1, 1,
1.244321, 0.01959733, 2.967208, 1, 1, 1, 1, 1,
1.252727, -1.012501, 2.201534, 1, 1, 1, 1, 1,
1.272647, -1.388475, 0.6371086, 1, 1, 1, 1, 1,
1.273061, -0.01003678, 1.655531, 1, 1, 1, 1, 1,
1.283292, -0.8027256, 1.276379, 1, 1, 1, 1, 1,
1.285039, 0.5067874, 1.733505, 1, 1, 1, 1, 1,
1.29329, -1.915009, 3.109526, 0, 0, 1, 1, 1,
1.295792, 0.9136667, 1.720935, 1, 0, 0, 1, 1,
1.296236, 1.392722, 1.435865, 1, 0, 0, 1, 1,
1.300516, 1.217953, 0.01659185, 1, 0, 0, 1, 1,
1.301369, 1.963361, -0.8092509, 1, 0, 0, 1, 1,
1.305965, -1.366042, 3.028456, 1, 0, 0, 1, 1,
1.314692, 1.024807, 1.90245, 0, 0, 0, 1, 1,
1.318269, 1.269932, 2.324886, 0, 0, 0, 1, 1,
1.321207, 0.6407676, 0.6622065, 0, 0, 0, 1, 1,
1.334931, 0.7358739, 2.407645, 0, 0, 0, 1, 1,
1.336353, -1.214262, 1.160917, 0, 0, 0, 1, 1,
1.342426, 0.5447592, 0.9251227, 0, 0, 0, 1, 1,
1.365893, 1.865452, 0.7573027, 0, 0, 0, 1, 1,
1.366365, 0.3498539, 1.41635, 1, 1, 1, 1, 1,
1.367516, 0.5973164, 1.429189, 1, 1, 1, 1, 1,
1.373254, 0.4719414, 0.7412882, 1, 1, 1, 1, 1,
1.37746, -0.7056161, 1.079825, 1, 1, 1, 1, 1,
1.384016, -0.1282521, 2.800719, 1, 1, 1, 1, 1,
1.391534, -0.7905387, 0.9057513, 1, 1, 1, 1, 1,
1.39952, 1.540332, 1.124934, 1, 1, 1, 1, 1,
1.406391, 0.4383969, 0.6702297, 1, 1, 1, 1, 1,
1.410691, 0.4427011, 1.703659, 1, 1, 1, 1, 1,
1.411368, 1.08148, -1.987448, 1, 1, 1, 1, 1,
1.414028, -2.353041, 2.249247, 1, 1, 1, 1, 1,
1.420259, -0.3371339, 0.3008528, 1, 1, 1, 1, 1,
1.434546, 0.4222878, 0.855696, 1, 1, 1, 1, 1,
1.434786, -1.004735, 3.094098, 1, 1, 1, 1, 1,
1.43864, 0.3969185, 1.847202, 1, 1, 1, 1, 1,
1.461111, -0.3457453, 1.977588, 0, 0, 1, 1, 1,
1.472865, 0.93773, 1.810267, 1, 0, 0, 1, 1,
1.475444, 0.5793511, 1.566149, 1, 0, 0, 1, 1,
1.484659, -0.7056347, 0.592181, 1, 0, 0, 1, 1,
1.486183, 1.277997, 0.9472154, 1, 0, 0, 1, 1,
1.487446, 1.203887, 0.4201325, 1, 0, 0, 1, 1,
1.488135, -0.2434442, 3.317998, 0, 0, 0, 1, 1,
1.490371, 0.8742015, -0.4319732, 0, 0, 0, 1, 1,
1.491069, 1.402617, 1.005284, 0, 0, 0, 1, 1,
1.512575, -1.095273, 1.991768, 0, 0, 0, 1, 1,
1.513878, -0.8941827, 3.025554, 0, 0, 0, 1, 1,
1.515526, -1.908299, 2.872678, 0, 0, 0, 1, 1,
1.523494, -1.693109, 2.331519, 0, 0, 0, 1, 1,
1.544877, 1.072594, 0.5261757, 1, 1, 1, 1, 1,
1.546987, -0.9222599, 1.754862, 1, 1, 1, 1, 1,
1.547123, -0.6703302, 2.450017, 1, 1, 1, 1, 1,
1.549591, -2.072472, 1.278552, 1, 1, 1, 1, 1,
1.553581, 0.7446804, -0.1284432, 1, 1, 1, 1, 1,
1.557029, 0.28376, 2.30166, 1, 1, 1, 1, 1,
1.571784, 0.7065216, 0.3656694, 1, 1, 1, 1, 1,
1.584603, -0.5129076, 2.062945, 1, 1, 1, 1, 1,
1.594801, -0.4564765, 2.197192, 1, 1, 1, 1, 1,
1.604955, -1.557953, 1.692734, 1, 1, 1, 1, 1,
1.607269, -0.1566993, 1.717524, 1, 1, 1, 1, 1,
1.618489, -0.6666616, 3.231806, 1, 1, 1, 1, 1,
1.627783, 0.6424292, -1.789337, 1, 1, 1, 1, 1,
1.631986, -1.090025, 0.3762809, 1, 1, 1, 1, 1,
1.635729, 1.031652, -0.3535585, 1, 1, 1, 1, 1,
1.638688, -0.5748823, 0.6316734, 0, 0, 1, 1, 1,
1.650038, 0.2102764, 1.202641, 1, 0, 0, 1, 1,
1.66097, -1.530913, 3.670175, 1, 0, 0, 1, 1,
1.662523, 1.573207, 0.135068, 1, 0, 0, 1, 1,
1.666009, -0.4333234, 2.706741, 1, 0, 0, 1, 1,
1.668672, 0.6284491, 1.114813, 1, 0, 0, 1, 1,
1.677025, 0.8775097, 1.659292, 0, 0, 0, 1, 1,
1.723287, 2.494615, 1.763327, 0, 0, 0, 1, 1,
1.726137, -0.8414013, 2.140804, 0, 0, 0, 1, 1,
1.741996, -1.064552, 1.675887, 0, 0, 0, 1, 1,
1.751126, -0.5535651, 1.92002, 0, 0, 0, 1, 1,
1.760975, 0.3239182, 3.632426, 0, 0, 0, 1, 1,
1.766111, 0.9706925, -0.2267375, 0, 0, 0, 1, 1,
1.781148, -0.1448101, 2.446752, 1, 1, 1, 1, 1,
1.794101, 0.0814268, 1.11441, 1, 1, 1, 1, 1,
1.794756, -1.38718, 1.810035, 1, 1, 1, 1, 1,
1.825513, 1.265903, 1.250872, 1, 1, 1, 1, 1,
1.848926, -0.6088966, 0.7668615, 1, 1, 1, 1, 1,
1.85509, -0.3175314, 0.9282466, 1, 1, 1, 1, 1,
1.857542, -1.544763, 2.048254, 1, 1, 1, 1, 1,
1.859014, -0.7117307, 0.49821, 1, 1, 1, 1, 1,
1.864486, -0.05942364, 2.253016, 1, 1, 1, 1, 1,
1.892296, 0.006446335, 2.7884, 1, 1, 1, 1, 1,
1.948229, -1.313023, 3.25812, 1, 1, 1, 1, 1,
1.988362, -0.7807766, 1.784213, 1, 1, 1, 1, 1,
2.025509, -1.062871, 2.352976, 1, 1, 1, 1, 1,
2.084249, -0.6473887, 2.277254, 1, 1, 1, 1, 1,
2.130846, 0.1422898, 0.9812797, 1, 1, 1, 1, 1,
2.134934, 0.4029282, 2.763751, 0, 0, 1, 1, 1,
2.177659, -1.755331, 2.834228, 1, 0, 0, 1, 1,
2.20393, -0.2189625, 1.882975, 1, 0, 0, 1, 1,
2.211841, 0.8830356, 0.362297, 1, 0, 0, 1, 1,
2.217859, 0.2280584, 0.8279444, 1, 0, 0, 1, 1,
2.440152, 2.426353, 0.3788534, 1, 0, 0, 1, 1,
2.481346, -0.845201, 2.594489, 0, 0, 0, 1, 1,
2.487075, -0.2703691, 1.060032, 0, 0, 0, 1, 1,
2.505346, -0.3179946, 2.72997, 0, 0, 0, 1, 1,
2.584941, -0.04379693, 1.196258, 0, 0, 0, 1, 1,
2.652811, -0.7591297, -0.1318716, 0, 0, 0, 1, 1,
2.691682, 0.5106311, 0.7928875, 0, 0, 0, 1, 1,
2.718141, -2.092709, 2.149013, 0, 0, 0, 1, 1,
2.729761, 0.2515301, 2.856888, 1, 1, 1, 1, 1,
2.741611, -1.05587, 2.534992, 1, 1, 1, 1, 1,
2.751534, 0.7989351, 0.7906806, 1, 1, 1, 1, 1,
3.064319, 0.4149907, 0.5894431, 1, 1, 1, 1, 1,
3.078381, 0.1621047, 0.9993006, 1, 1, 1, 1, 1,
3.118476, -1.674857, 2.700413, 1, 1, 1, 1, 1,
3.220004, 0.5089478, 1.171779, 1, 1, 1, 1, 1
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
var radius = 9.682085;
var distance = 34.00791;
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
mvMatrix.translate( -0.04548478, 0.1028956, 0.7061107 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00791);
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
