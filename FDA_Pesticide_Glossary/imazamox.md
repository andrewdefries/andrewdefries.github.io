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
-3.116888, 0.1034252, -1.422552, 1, 0, 0, 1,
-3.052831, 1.678299, -0.6964187, 1, 0.007843138, 0, 1,
-3.041708, -1.051439, -0.6692737, 1, 0.01176471, 0, 1,
-2.99972, -0.5438128, -0.9407293, 1, 0.01960784, 0, 1,
-2.820778, 0.4301691, -0.7618281, 1, 0.02352941, 0, 1,
-2.817358, -0.6043966, -1.334362, 1, 0.03137255, 0, 1,
-2.749537, 1.266195, -3.948041, 1, 0.03529412, 0, 1,
-2.708, -1.044982, -1.861494, 1, 0.04313726, 0, 1,
-2.646166, -0.9489447, -1.872007, 1, 0.04705882, 0, 1,
-2.552718, 0.05322477, -1.053206, 1, 0.05490196, 0, 1,
-2.361546, -0.8254641, -1.844475, 1, 0.05882353, 0, 1,
-2.335168, -1.34413, -3.450256, 1, 0.06666667, 0, 1,
-2.268033, 0.783365, -1.350187, 1, 0.07058824, 0, 1,
-2.248316, 1.465506, -0.9937947, 1, 0.07843138, 0, 1,
-2.172012, 0.6321684, -0.4829988, 1, 0.08235294, 0, 1,
-2.169885, -2.995249, -2.250651, 1, 0.09019608, 0, 1,
-2.140445, 0.208475, -0.7391101, 1, 0.09411765, 0, 1,
-2.079705, -0.9788809, -2.244728, 1, 0.1019608, 0, 1,
-2.072499, -1.297074, 0.291693, 1, 0.1098039, 0, 1,
-2.028631, -1.656192, -2.262236, 1, 0.1137255, 0, 1,
-2.023158, 0.3804408, 0.6010524, 1, 0.1215686, 0, 1,
-2.019765, -0.3622563, -1.746548, 1, 0.1254902, 0, 1,
-2.007742, 1.545096, -1.214851, 1, 0.1333333, 0, 1,
-1.970875, -0.4047994, -3.095048, 1, 0.1372549, 0, 1,
-1.965993, 0.2163729, -2.670394, 1, 0.145098, 0, 1,
-1.959404, -0.441322, -3.130891, 1, 0.1490196, 0, 1,
-1.866747, 0.1638568, -1.012219, 1, 0.1568628, 0, 1,
-1.843652, -0.1455489, -1.400947, 1, 0.1607843, 0, 1,
-1.842518, 1.513013, -0.8485013, 1, 0.1686275, 0, 1,
-1.837586, -1.360515, -1.881305, 1, 0.172549, 0, 1,
-1.811045, -1.022981, -2.041045, 1, 0.1803922, 0, 1,
-1.789363, -2.81219, -2.917496, 1, 0.1843137, 0, 1,
-1.757408, 0.7675044, -0.5657341, 1, 0.1921569, 0, 1,
-1.738576, -1.336912, -2.015242, 1, 0.1960784, 0, 1,
-1.720303, -0.860184, -0.9197684, 1, 0.2039216, 0, 1,
-1.714378, 0.499777, 0.3502942, 1, 0.2117647, 0, 1,
-1.685136, -0.6700442, -4.246174, 1, 0.2156863, 0, 1,
-1.679842, -0.08092231, 0.2408274, 1, 0.2235294, 0, 1,
-1.677698, -1.405101, -2.837579, 1, 0.227451, 0, 1,
-1.668344, -0.6011487, -2.405737, 1, 0.2352941, 0, 1,
-1.661913, -0.2531279, -2.09495, 1, 0.2392157, 0, 1,
-1.658424, 0.1544314, -2.364373, 1, 0.2470588, 0, 1,
-1.649429, -0.4860635, -2.615674, 1, 0.2509804, 0, 1,
-1.612151, -1.817123, -3.3361, 1, 0.2588235, 0, 1,
-1.604526, -0.7429739, -4.027822, 1, 0.2627451, 0, 1,
-1.60018, -0.2584617, -1.540871, 1, 0.2705882, 0, 1,
-1.598885, 0.2999296, -0.4075772, 1, 0.2745098, 0, 1,
-1.597645, -1.369388, -3.585922, 1, 0.282353, 0, 1,
-1.587212, -0.9869491, -2.085248, 1, 0.2862745, 0, 1,
-1.586058, 0.06261156, -2.942821, 1, 0.2941177, 0, 1,
-1.585042, 0.1962861, -2.488388, 1, 0.3019608, 0, 1,
-1.577577, 0.7446046, -1.355053, 1, 0.3058824, 0, 1,
-1.576461, 0.2780749, -2.751076, 1, 0.3137255, 0, 1,
-1.574017, 0.02669637, -0.7740121, 1, 0.3176471, 0, 1,
-1.56477, 1.042133, 0.128916, 1, 0.3254902, 0, 1,
-1.531603, 1.217515, -1.394087, 1, 0.3294118, 0, 1,
-1.515613, -1.371064, -1.059363, 1, 0.3372549, 0, 1,
-1.514164, -1.042395, -2.449472, 1, 0.3411765, 0, 1,
-1.508351, -2.163678, -3.319605, 1, 0.3490196, 0, 1,
-1.506661, 0.2236979, -1.720411, 1, 0.3529412, 0, 1,
-1.503234, -1.348785, -3.247, 1, 0.3607843, 0, 1,
-1.502519, -0.4366032, -2.209769, 1, 0.3647059, 0, 1,
-1.502332, 0.6998406, -0.8351948, 1, 0.372549, 0, 1,
-1.49299, 1.607934, -0.2361865, 1, 0.3764706, 0, 1,
-1.488027, 0.3441841, -2.518626, 1, 0.3843137, 0, 1,
-1.481293, -0.05611498, -3.289345, 1, 0.3882353, 0, 1,
-1.477815, -0.618713, -2.572926, 1, 0.3960784, 0, 1,
-1.467823, 0.963438, -2.11753, 1, 0.4039216, 0, 1,
-1.432686, 1.101815, 0.6358033, 1, 0.4078431, 0, 1,
-1.431195, -0.4031719, -1.233046, 1, 0.4156863, 0, 1,
-1.4221, 0.0426431, 0.8160431, 1, 0.4196078, 0, 1,
-1.416711, -0.2980398, -3.050598, 1, 0.427451, 0, 1,
-1.405815, -0.1092633, -2.658164, 1, 0.4313726, 0, 1,
-1.404506, -0.495621, -2.41484, 1, 0.4392157, 0, 1,
-1.400967, 0.5383675, -1.227748, 1, 0.4431373, 0, 1,
-1.400587, 0.02996551, 0.3339939, 1, 0.4509804, 0, 1,
-1.398164, 0.2383594, -1.508758, 1, 0.454902, 0, 1,
-1.387547, 0.2368437, -0.6383387, 1, 0.4627451, 0, 1,
-1.384806, 0.2822104, 0.4166154, 1, 0.4666667, 0, 1,
-1.38399, 0.6054292, -1.621233, 1, 0.4745098, 0, 1,
-1.381884, -1.156621, -2.352598, 1, 0.4784314, 0, 1,
-1.381231, 0.3081462, -1.477065, 1, 0.4862745, 0, 1,
-1.373441, -0.06078201, -1.177146, 1, 0.4901961, 0, 1,
-1.359892, 0.2508251, -0.7926638, 1, 0.4980392, 0, 1,
-1.353696, -0.001418972, -0.05343208, 1, 0.5058824, 0, 1,
-1.35158, 0.7345277, 0.3228531, 1, 0.509804, 0, 1,
-1.351265, -0.1326696, -0.8722557, 1, 0.5176471, 0, 1,
-1.348706, 2.594321, -0.288291, 1, 0.5215687, 0, 1,
-1.347546, -0.1844032, -0.8656785, 1, 0.5294118, 0, 1,
-1.346129, 0.1660612, -0.6475549, 1, 0.5333334, 0, 1,
-1.329378, 0.2831155, -0.8592793, 1, 0.5411765, 0, 1,
-1.328487, 0.3608108, -1.772887, 1, 0.5450981, 0, 1,
-1.322486, -1.615611, -2.965124, 1, 0.5529412, 0, 1,
-1.321134, -0.663973, -3.478099, 1, 0.5568628, 0, 1,
-1.319384, 0.6172069, -0.3203579, 1, 0.5647059, 0, 1,
-1.307004, 1.092428, 0.8456653, 1, 0.5686275, 0, 1,
-1.301724, -1.252525, -1.446277, 1, 0.5764706, 0, 1,
-1.296065, 2.524475, -0.3449542, 1, 0.5803922, 0, 1,
-1.273215, -1.747301, -2.387569, 1, 0.5882353, 0, 1,
-1.271557, -1.659513, -3.568505, 1, 0.5921569, 0, 1,
-1.26828, 0.5854004, -1.427088, 1, 0.6, 0, 1,
-1.267187, -0.7443707, -1.205632, 1, 0.6078432, 0, 1,
-1.250652, 0.1177471, -2.422192, 1, 0.6117647, 0, 1,
-1.244621, -0.4413939, -1.783855, 1, 0.6196079, 0, 1,
-1.244115, -0.7293954, -0.5253587, 1, 0.6235294, 0, 1,
-1.233225, 0.0306592, -2.214556, 1, 0.6313726, 0, 1,
-1.229184, -0.1188858, -1.245509, 1, 0.6352941, 0, 1,
-1.228118, -0.07967889, 0.1398407, 1, 0.6431373, 0, 1,
-1.225058, -0.2048237, -1.44671, 1, 0.6470588, 0, 1,
-1.215113, 0.02387662, -3.507638, 1, 0.654902, 0, 1,
-1.214915, 0.2272893, -2.536472, 1, 0.6588235, 0, 1,
-1.212143, 0.1398972, 0.04490418, 1, 0.6666667, 0, 1,
-1.211388, -1.667512, -2.435672, 1, 0.6705883, 0, 1,
-1.206837, -0.5758758, -2.105285, 1, 0.6784314, 0, 1,
-1.202908, 0.1113158, -1.206901, 1, 0.682353, 0, 1,
-1.199913, -1.321197, 0.1363202, 1, 0.6901961, 0, 1,
-1.193313, 1.068717, 0.02064964, 1, 0.6941177, 0, 1,
-1.189366, -1.429017, -2.966218, 1, 0.7019608, 0, 1,
-1.188991, 1.037435, -1.181907, 1, 0.7098039, 0, 1,
-1.188971, 0.2018064, -3.000963, 1, 0.7137255, 0, 1,
-1.188331, 0.8968821, -0.7958121, 1, 0.7215686, 0, 1,
-1.182231, -0.5368517, -2.554835, 1, 0.7254902, 0, 1,
-1.175893, -0.9506026, -2.473848, 1, 0.7333333, 0, 1,
-1.155097, 0.9385597, 0.176249, 1, 0.7372549, 0, 1,
-1.14669, -0.7244805, -3.958968, 1, 0.7450981, 0, 1,
-1.140575, -1.542327, -1.363901, 1, 0.7490196, 0, 1,
-1.133461, -0.2577679, -1.786252, 1, 0.7568628, 0, 1,
-1.129406, -0.4887172, -2.223895, 1, 0.7607843, 0, 1,
-1.119843, 1.02938, -1.5624, 1, 0.7686275, 0, 1,
-1.112453, -0.1278513, -0.2006603, 1, 0.772549, 0, 1,
-1.111395, -1.281963, -1.386983, 1, 0.7803922, 0, 1,
-1.105704, 0.9007291, -0.6108618, 1, 0.7843137, 0, 1,
-1.102665, 2.373038, -1.880344, 1, 0.7921569, 0, 1,
-1.10145, -2.338947, -2.368015, 1, 0.7960784, 0, 1,
-1.098033, 1.786647, 0.05463267, 1, 0.8039216, 0, 1,
-1.092013, -0.6657273, -2.292045, 1, 0.8117647, 0, 1,
-1.091911, 1.673626, -1.749162, 1, 0.8156863, 0, 1,
-1.088742, -0.6346003, -2.307433, 1, 0.8235294, 0, 1,
-1.088556, 1.779472, -0.8271601, 1, 0.827451, 0, 1,
-1.081688, 0.1578911, -2.013494, 1, 0.8352941, 0, 1,
-1.081114, 1.627396, -0.02227987, 1, 0.8392157, 0, 1,
-1.069819, 0.3532313, 0.5279415, 1, 0.8470588, 0, 1,
-1.067142, 0.06408855, -0.8586619, 1, 0.8509804, 0, 1,
-1.063092, 0.7052782, -0.5845002, 1, 0.8588235, 0, 1,
-1.061139, 0.7165094, -0.5059032, 1, 0.8627451, 0, 1,
-1.059238, -0.851148, -1.953774, 1, 0.8705882, 0, 1,
-1.055086, 0.8653099, -0.9242699, 1, 0.8745098, 0, 1,
-1.044266, -1.092613, -0.8661657, 1, 0.8823529, 0, 1,
-1.043293, 0.7761583, -2.32259, 1, 0.8862745, 0, 1,
-1.041324, -1.798828, -2.081959, 1, 0.8941177, 0, 1,
-1.038583, -2.681023, -3.226116, 1, 0.8980392, 0, 1,
-1.036626, -1.273708, -1.642313, 1, 0.9058824, 0, 1,
-1.028988, -0.7528551, -1.921011, 1, 0.9137255, 0, 1,
-1.026788, -1.820207, -1.419267, 1, 0.9176471, 0, 1,
-1.025048, 2.554166, -2.299499, 1, 0.9254902, 0, 1,
-1.020093, -0.8469966, -0.774587, 1, 0.9294118, 0, 1,
-1.015796, -0.4241861, -2.417041, 1, 0.9372549, 0, 1,
-1.014602, -0.5969, -1.29495, 1, 0.9411765, 0, 1,
-1.008339, -0.9605206, -1.846346, 1, 0.9490196, 0, 1,
-0.9987515, 0.4446903, -2.017593, 1, 0.9529412, 0, 1,
-0.9802591, 1.872258, -0.05504067, 1, 0.9607843, 0, 1,
-0.9797024, 1.348173, -1.69516, 1, 0.9647059, 0, 1,
-0.9705545, 2.33214, 1.459428, 1, 0.972549, 0, 1,
-0.969666, -0.9540775, -2.832654, 1, 0.9764706, 0, 1,
-0.9619098, -1.577966, -3.148381, 1, 0.9843137, 0, 1,
-0.958833, 0.719842, -0.5247619, 1, 0.9882353, 0, 1,
-0.9545443, -1.293205, -1.214186, 1, 0.9960784, 0, 1,
-0.9528696, 2.180692, 0.6353212, 0.9960784, 1, 0, 1,
-0.952547, 0.2403057, -0.9368351, 0.9921569, 1, 0, 1,
-0.9481391, 1.305359, -0.129701, 0.9843137, 1, 0, 1,
-0.9465175, -0.2198267, -1.737871, 0.9803922, 1, 0, 1,
-0.9427758, -1.285848, -2.51916, 0.972549, 1, 0, 1,
-0.9422915, 0.2459338, -2.107983, 0.9686275, 1, 0, 1,
-0.9404129, 0.8464984, -2.768858, 0.9607843, 1, 0, 1,
-0.9403772, 0.31871, -1.687086, 0.9568627, 1, 0, 1,
-0.9378687, -0.5352662, -2.862952, 0.9490196, 1, 0, 1,
-0.9326893, -2.493152, -2.206806, 0.945098, 1, 0, 1,
-0.9296585, 0.2730441, -2.823259, 0.9372549, 1, 0, 1,
-0.9243943, 0.6900104, 0.4878887, 0.9333333, 1, 0, 1,
-0.9236513, -1.435768, -1.323358, 0.9254902, 1, 0, 1,
-0.9229257, 0.5631766, -1.861985, 0.9215686, 1, 0, 1,
-0.9197608, -0.1510826, -2.005321, 0.9137255, 1, 0, 1,
-0.9173926, 0.7116789, 0.2259326, 0.9098039, 1, 0, 1,
-0.9147416, 0.9213927, -1.133558, 0.9019608, 1, 0, 1,
-0.9139995, -0.3894023, -2.357186, 0.8941177, 1, 0, 1,
-0.9131029, 1.543331, -2.094651, 0.8901961, 1, 0, 1,
-0.9113116, 1.442809, -0.06519777, 0.8823529, 1, 0, 1,
-0.910017, -0.4844899, -2.955227, 0.8784314, 1, 0, 1,
-0.9040609, 0.7745439, -0.6210502, 0.8705882, 1, 0, 1,
-0.9034505, 0.8658436, -0.4419095, 0.8666667, 1, 0, 1,
-0.899111, -0.7682621, -2.221501, 0.8588235, 1, 0, 1,
-0.8926446, 0.9964634, -0.2678976, 0.854902, 1, 0, 1,
-0.8911708, 1.594787, -0.1980916, 0.8470588, 1, 0, 1,
-0.8884648, -0.5546064, -1.314993, 0.8431373, 1, 0, 1,
-0.8879062, -0.3663168, -1.541879, 0.8352941, 1, 0, 1,
-0.8832361, -0.7868965, -2.970056, 0.8313726, 1, 0, 1,
-0.8748766, -0.9217967, -2.877088, 0.8235294, 1, 0, 1,
-0.8636267, 0.4803737, -1.892443, 0.8196079, 1, 0, 1,
-0.8631025, -1.460304, -1.845359, 0.8117647, 1, 0, 1,
-0.8616749, 0.6518956, 1.146491, 0.8078431, 1, 0, 1,
-0.8598469, 0.1696337, -1.408303, 0.8, 1, 0, 1,
-0.8583572, 1.207968, -1.753928, 0.7921569, 1, 0, 1,
-0.8582993, 0.4342623, -1.549537, 0.7882353, 1, 0, 1,
-0.8548549, 0.2587459, -0.678524, 0.7803922, 1, 0, 1,
-0.8536178, 0.6146772, -0.9383774, 0.7764706, 1, 0, 1,
-0.8531012, -0.5918178, 0.5622652, 0.7686275, 1, 0, 1,
-0.8529034, 0.1509621, -1.390005, 0.7647059, 1, 0, 1,
-0.8517718, -0.4098206, -1.254988, 0.7568628, 1, 0, 1,
-0.8502453, 0.9873808, 0.4039475, 0.7529412, 1, 0, 1,
-0.8366649, -0.8256309, -2.187249, 0.7450981, 1, 0, 1,
-0.8353554, 2.490436, -0.8395588, 0.7411765, 1, 0, 1,
-0.8324838, -0.5091609, -0.6233366, 0.7333333, 1, 0, 1,
-0.8271051, 1.827587, 0.01750649, 0.7294118, 1, 0, 1,
-0.8173781, 0.5772665, -0.9421258, 0.7215686, 1, 0, 1,
-0.8163349, -0.1193188, -3.628657, 0.7176471, 1, 0, 1,
-0.8005797, 0.3833596, -1.448215, 0.7098039, 1, 0, 1,
-0.7981214, -0.7787226, -0.5065107, 0.7058824, 1, 0, 1,
-0.7965418, -1.585098, -3.047414, 0.6980392, 1, 0, 1,
-0.7932046, 0.6314627, -0.609848, 0.6901961, 1, 0, 1,
-0.7815487, 1.379706, -0.2521379, 0.6862745, 1, 0, 1,
-0.7678845, -0.1978467, -2.515357, 0.6784314, 1, 0, 1,
-0.7672395, 1.762905, 0.6626816, 0.6745098, 1, 0, 1,
-0.7587457, -0.05228578, -2.011191, 0.6666667, 1, 0, 1,
-0.7579106, 0.331751, -0.3784312, 0.6627451, 1, 0, 1,
-0.7575836, -1.395742, -2.461058, 0.654902, 1, 0, 1,
-0.7503204, 0.8048679, -1.124376, 0.6509804, 1, 0, 1,
-0.74657, -0.3996193, -3.34294, 0.6431373, 1, 0, 1,
-0.7455279, 0.7810145, -0.9658049, 0.6392157, 1, 0, 1,
-0.7445219, -1.59405, -2.052039, 0.6313726, 1, 0, 1,
-0.7385803, -0.5382721, -2.792971, 0.627451, 1, 0, 1,
-0.7375458, 0.6881213, -0.2609133, 0.6196079, 1, 0, 1,
-0.7323226, 2.160465, 0.0806946, 0.6156863, 1, 0, 1,
-0.7312022, -0.5115774, -2.72499, 0.6078432, 1, 0, 1,
-0.7308489, -1.211265, -2.171277, 0.6039216, 1, 0, 1,
-0.725795, 1.150127, 0.6147164, 0.5960785, 1, 0, 1,
-0.7254851, -2.307138, -1.717414, 0.5882353, 1, 0, 1,
-0.7232154, 0.5781394, 0.04192227, 0.5843138, 1, 0, 1,
-0.7218754, -0.2933734, -1.792245, 0.5764706, 1, 0, 1,
-0.7174861, -0.8627163, -1.948589, 0.572549, 1, 0, 1,
-0.7143655, -0.8237784, -1.799831, 0.5647059, 1, 0, 1,
-0.7125612, 1.34621, -1.447757, 0.5607843, 1, 0, 1,
-0.7080146, 0.2158476, -2.091226, 0.5529412, 1, 0, 1,
-0.7018299, 1.044443, -1.633111, 0.5490196, 1, 0, 1,
-0.7004414, 1.43942, -0.2381229, 0.5411765, 1, 0, 1,
-0.6951717, 0.4894137, -0.1901919, 0.5372549, 1, 0, 1,
-0.6935546, -0.1331122, -2.883185, 0.5294118, 1, 0, 1,
-0.6897479, 1.016988, -0.3151043, 0.5254902, 1, 0, 1,
-0.6860943, -1.834172, -1.641408, 0.5176471, 1, 0, 1,
-0.6830922, -1.496116, -3.79991, 0.5137255, 1, 0, 1,
-0.6754165, -0.2551569, -1.790999, 0.5058824, 1, 0, 1,
-0.6750829, 0.8675197, -1.139748, 0.5019608, 1, 0, 1,
-0.6750415, -1.145073, -2.924845, 0.4941176, 1, 0, 1,
-0.6738358, -0.5433909, -3.798266, 0.4862745, 1, 0, 1,
-0.6726651, 0.05572545, -3.207971, 0.4823529, 1, 0, 1,
-0.6715117, -0.8751848, -3.635776, 0.4745098, 1, 0, 1,
-0.6705274, 1.848267, -1.070701, 0.4705882, 1, 0, 1,
-0.6701262, -1.474107, -3.773854, 0.4627451, 1, 0, 1,
-0.665772, -1.447544, -2.12149, 0.4588235, 1, 0, 1,
-0.6657066, 0.004071097, 0.3112519, 0.4509804, 1, 0, 1,
-0.6648042, 1.031192, -1.415273, 0.4470588, 1, 0, 1,
-0.6627181, -1.431111, -3.16265, 0.4392157, 1, 0, 1,
-0.6573598, 0.7242949, -0.7119028, 0.4352941, 1, 0, 1,
-0.655818, 0.02605759, -2.107214, 0.427451, 1, 0, 1,
-0.6556908, 0.7842687, -1.63181, 0.4235294, 1, 0, 1,
-0.6520824, 2.232125, 0.2060637, 0.4156863, 1, 0, 1,
-0.6493635, 0.3615923, -0.9412547, 0.4117647, 1, 0, 1,
-0.6447585, -0.2541406, -2.144025, 0.4039216, 1, 0, 1,
-0.6409816, 0.7627872, 0.5668206, 0.3960784, 1, 0, 1,
-0.6386058, 0.2850199, -1.436842, 0.3921569, 1, 0, 1,
-0.638209, -1.977398, -1.512874, 0.3843137, 1, 0, 1,
-0.6359005, 0.7415665, -0.8095031, 0.3803922, 1, 0, 1,
-0.6321259, -0.2950212, -0.8832546, 0.372549, 1, 0, 1,
-0.6300268, -1.520497, -4.731252, 0.3686275, 1, 0, 1,
-0.6299424, 1.421984, -0.8608345, 0.3607843, 1, 0, 1,
-0.62907, 0.9237313, 1.078396, 0.3568628, 1, 0, 1,
-0.6281552, 1.042559, 0.5471834, 0.3490196, 1, 0, 1,
-0.6280221, -0.6129352, -3.596849, 0.345098, 1, 0, 1,
-0.6220546, 0.05918273, -3.850016, 0.3372549, 1, 0, 1,
-0.6216214, -2.066028, -2.742608, 0.3333333, 1, 0, 1,
-0.6090397, 0.07137883, -0.5607092, 0.3254902, 1, 0, 1,
-0.6084734, 1.078139, -1.013829, 0.3215686, 1, 0, 1,
-0.6084409, -1.092644, -3.351774, 0.3137255, 1, 0, 1,
-0.6072651, -2.229889, -2.704148, 0.3098039, 1, 0, 1,
-0.606762, 0.259713, -2.107009, 0.3019608, 1, 0, 1,
-0.6063903, 0.7413151, -1.596418, 0.2941177, 1, 0, 1,
-0.5992416, 0.1136158, -1.619672, 0.2901961, 1, 0, 1,
-0.5960528, 0.3608233, 0.009504048, 0.282353, 1, 0, 1,
-0.5937417, -1.006004, -1.37796, 0.2784314, 1, 0, 1,
-0.5937053, -1.038886, -2.281206, 0.2705882, 1, 0, 1,
-0.5904949, -0.02834913, -1.00501, 0.2666667, 1, 0, 1,
-0.5898264, -0.03598781, -2.902753, 0.2588235, 1, 0, 1,
-0.5884972, 1.086892, -2.265384, 0.254902, 1, 0, 1,
-0.5864395, 1.895104, 0.1692111, 0.2470588, 1, 0, 1,
-0.5839759, -0.8272426, -3.851371, 0.2431373, 1, 0, 1,
-0.5838882, -0.15291, -2.060934, 0.2352941, 1, 0, 1,
-0.5833536, 0.2102293, 1.478472, 0.2313726, 1, 0, 1,
-0.5814595, -1.364835, -2.601498, 0.2235294, 1, 0, 1,
-0.5791578, 0.430637, -0.6320507, 0.2196078, 1, 0, 1,
-0.5781191, 0.8078634, -1.53524, 0.2117647, 1, 0, 1,
-0.5724962, 1.234064, 0.4855266, 0.2078431, 1, 0, 1,
-0.5723482, -0.2598144, -1.813341, 0.2, 1, 0, 1,
-0.5697768, -1.657268, -3.23464, 0.1921569, 1, 0, 1,
-0.5696073, -1.707013, -4.200504, 0.1882353, 1, 0, 1,
-0.5670817, 0.9882567, -0.07065517, 0.1803922, 1, 0, 1,
-0.5609174, 1.078918, 0.2841074, 0.1764706, 1, 0, 1,
-0.5608597, 0.175574, -1.120834, 0.1686275, 1, 0, 1,
-0.5502926, 0.534663, 0.2100982, 0.1647059, 1, 0, 1,
-0.5467917, 2.38057, 0.4351263, 0.1568628, 1, 0, 1,
-0.5375673, 0.9374043, -1.120348, 0.1529412, 1, 0, 1,
-0.5301446, 1.36367, -0.6796573, 0.145098, 1, 0, 1,
-0.5236229, 0.3058467, -0.497939, 0.1411765, 1, 0, 1,
-0.5205185, 0.3867355, 1.280148, 0.1333333, 1, 0, 1,
-0.5204279, 1.416976, 0.4491836, 0.1294118, 1, 0, 1,
-0.5149639, -0.5693698, -2.120512, 0.1215686, 1, 0, 1,
-0.5110663, 1.20412, -1.177178, 0.1176471, 1, 0, 1,
-0.5053628, -0.4107786, -3.181847, 0.1098039, 1, 0, 1,
-0.4988733, -1.19591, -1.037574, 0.1058824, 1, 0, 1,
-0.4959561, 0.2869906, -0.5652558, 0.09803922, 1, 0, 1,
-0.495626, -1.160405, -4.332362, 0.09019608, 1, 0, 1,
-0.4873601, 1.93565, -0.7579431, 0.08627451, 1, 0, 1,
-0.4849631, -1.246032, -3.279508, 0.07843138, 1, 0, 1,
-0.4791941, 1.390519, 0.5758603, 0.07450981, 1, 0, 1,
-0.4790558, 0.1637407, -1.482881, 0.06666667, 1, 0, 1,
-0.4743392, 1.12396, -0.1078893, 0.0627451, 1, 0, 1,
-0.474153, -2.426502, -4.547196, 0.05490196, 1, 0, 1,
-0.4722502, 1.184655, -0.2616189, 0.05098039, 1, 0, 1,
-0.4690205, -0.6352552, -1.271736, 0.04313726, 1, 0, 1,
-0.4687085, -2.255616, -2.680583, 0.03921569, 1, 0, 1,
-0.4680227, 0.7993182, 0.7767142, 0.03137255, 1, 0, 1,
-0.4679206, -0.2227293, -2.644393, 0.02745098, 1, 0, 1,
-0.4638777, 0.6975343, 0.5096996, 0.01960784, 1, 0, 1,
-0.46131, -2.104755, -1.786635, 0.01568628, 1, 0, 1,
-0.4582084, 0.8888816, 0.1966553, 0.007843138, 1, 0, 1,
-0.454009, 0.9221724, -0.3755265, 0.003921569, 1, 0, 1,
-0.4520912, 1.08139, 0.5155335, 0, 1, 0.003921569, 1,
-0.4480969, 0.5302403, -0.8480023, 0, 1, 0.01176471, 1,
-0.4438567, -0.1582086, -4.689889, 0, 1, 0.01568628, 1,
-0.4409745, 0.07651516, -0.9184161, 0, 1, 0.02352941, 1,
-0.4335771, -0.09234177, -1.878004, 0, 1, 0.02745098, 1,
-0.4309826, 0.5567127, -0.06892293, 0, 1, 0.03529412, 1,
-0.4298988, 0.7369001, -0.6970709, 0, 1, 0.03921569, 1,
-0.4240863, -1.046245, -3.42439, 0, 1, 0.04705882, 1,
-0.4240014, 0.2501805, -3.362027, 0, 1, 0.05098039, 1,
-0.4180253, 0.6028992, -0.326597, 0, 1, 0.05882353, 1,
-0.4061274, 1.166501, -0.3858181, 0, 1, 0.0627451, 1,
-0.4043787, 1.202962, 0.6093742, 0, 1, 0.07058824, 1,
-0.3991243, 1.393208, -1.740737, 0, 1, 0.07450981, 1,
-0.3988268, 0.6648945, 0.2973448, 0, 1, 0.08235294, 1,
-0.3985744, -1.4301, -2.992552, 0, 1, 0.08627451, 1,
-0.396586, -2.307256, -2.674132, 0, 1, 0.09411765, 1,
-0.3952947, 0.5254244, -0.6084965, 0, 1, 0.1019608, 1,
-0.392137, -1.230189, -2.459412, 0, 1, 0.1058824, 1,
-0.3911518, 0.4909585, -0.1232852, 0, 1, 0.1137255, 1,
-0.3895354, 0.7085556, 1.250888, 0, 1, 0.1176471, 1,
-0.3892583, 0.5254006, -1.301719, 0, 1, 0.1254902, 1,
-0.3880311, -0.9851818, -1.976871, 0, 1, 0.1294118, 1,
-0.3845427, 0.7023037, 0.9328366, 0, 1, 0.1372549, 1,
-0.3819977, 1.320398, -1.201393, 0, 1, 0.1411765, 1,
-0.3801668, 0.4385223, -0.5116531, 0, 1, 0.1490196, 1,
-0.3789598, 0.5816821, -1.248598, 0, 1, 0.1529412, 1,
-0.3767969, 0.7936461, 0.0166599, 0, 1, 0.1607843, 1,
-0.3714679, 0.9182862, 0.3672144, 0, 1, 0.1647059, 1,
-0.3704617, -1.809215, -3.579691, 0, 1, 0.172549, 1,
-0.3649768, -1.219815, -1.827678, 0, 1, 0.1764706, 1,
-0.3636156, -0.8248041, -2.981704, 0, 1, 0.1843137, 1,
-0.3583285, 0.2799993, 0.5302978, 0, 1, 0.1882353, 1,
-0.3573581, -0.1928039, -1.934918, 0, 1, 0.1960784, 1,
-0.3504838, -1.450145, -4.801489, 0, 1, 0.2039216, 1,
-0.3480556, 0.03131093, -0.5636127, 0, 1, 0.2078431, 1,
-0.3455266, 1.594629, 1.446743, 0, 1, 0.2156863, 1,
-0.3453915, -0.8608996, -2.758322, 0, 1, 0.2196078, 1,
-0.3448642, -0.8594444, -3.285146, 0, 1, 0.227451, 1,
-0.3436192, -0.7368497, -2.529099, 0, 1, 0.2313726, 1,
-0.3424927, 1.488801, -0.2677344, 0, 1, 0.2392157, 1,
-0.3368255, -0.8452025, -3.697503, 0, 1, 0.2431373, 1,
-0.333898, -1.056246, -5.829509, 0, 1, 0.2509804, 1,
-0.3250513, -0.6055393, -2.545979, 0, 1, 0.254902, 1,
-0.3212718, 1.086484, -1.870867, 0, 1, 0.2627451, 1,
-0.3194142, -0.854152, -2.442317, 0, 1, 0.2666667, 1,
-0.3177347, 0.2150022, 0.2230217, 0, 1, 0.2745098, 1,
-0.317076, 1.191528, 2.461524, 0, 1, 0.2784314, 1,
-0.3106906, -0.4330264, -3.749177, 0, 1, 0.2862745, 1,
-0.3095884, -0.8066422, -2.443594, 0, 1, 0.2901961, 1,
-0.306526, -1.329918, -3.922773, 0, 1, 0.2980392, 1,
-0.3063863, 0.3951746, 0.5599591, 0, 1, 0.3058824, 1,
-0.3005104, -0.2352474, -1.574635, 0, 1, 0.3098039, 1,
-0.2944876, -0.9660244, -3.26175, 0, 1, 0.3176471, 1,
-0.2930177, -0.5078164, -2.043988, 0, 1, 0.3215686, 1,
-0.2919088, 0.8025451, -0.1481692, 0, 1, 0.3294118, 1,
-0.291247, 0.9677344, -1.727541, 0, 1, 0.3333333, 1,
-0.2869582, 0.477363, -0.2433295, 0, 1, 0.3411765, 1,
-0.2861646, 2.317134, 1.347368, 0, 1, 0.345098, 1,
-0.2815028, 0.07793512, -2.678051, 0, 1, 0.3529412, 1,
-0.2795417, -0.7078325, -0.9090979, 0, 1, 0.3568628, 1,
-0.2778933, -0.6144099, -3.894507, 0, 1, 0.3647059, 1,
-0.2737171, -0.1260981, -1.951007, 0, 1, 0.3686275, 1,
-0.2707576, -0.7287545, -3.153006, 0, 1, 0.3764706, 1,
-0.2701926, -0.6345603, -1.334042, 0, 1, 0.3803922, 1,
-0.2663937, -0.6046987, -2.023777, 0, 1, 0.3882353, 1,
-0.2593682, 2.095078, 0.112661, 0, 1, 0.3921569, 1,
-0.2571267, -0.3627862, -2.931119, 0, 1, 0.4, 1,
-0.2506123, 0.0422266, -1.664418, 0, 1, 0.4078431, 1,
-0.2497861, 0.9707047, 0.4035784, 0, 1, 0.4117647, 1,
-0.248888, -0.315667, -3.710553, 0, 1, 0.4196078, 1,
-0.2417844, 0.4256172, -1.425897, 0, 1, 0.4235294, 1,
-0.2400966, -0.5269588, -1.459974, 0, 1, 0.4313726, 1,
-0.2361052, -1.409916, -2.476329, 0, 1, 0.4352941, 1,
-0.2360252, -1.622995, -2.069932, 0, 1, 0.4431373, 1,
-0.2322213, 0.9304094, -1.174299, 0, 1, 0.4470588, 1,
-0.2270405, -2.036907, -3.145312, 0, 1, 0.454902, 1,
-0.2261338, -0.2235402, -2.476751, 0, 1, 0.4588235, 1,
-0.2236934, -1.036446, -2.585601, 0, 1, 0.4666667, 1,
-0.2228806, 0.2704965, -2.255977, 0, 1, 0.4705882, 1,
-0.2176248, 1.31007, 0.8820378, 0, 1, 0.4784314, 1,
-0.2138717, 0.8224881, -1.221786, 0, 1, 0.4823529, 1,
-0.2123899, 0.347828, 0.07438985, 0, 1, 0.4901961, 1,
-0.2092615, 0.1541172, -0.6363472, 0, 1, 0.4941176, 1,
-0.2018607, 0.1727068, -0.4343435, 0, 1, 0.5019608, 1,
-0.198692, 1.377479, 0.7320952, 0, 1, 0.509804, 1,
-0.1979414, -1.176063, -3.294256, 0, 1, 0.5137255, 1,
-0.1958494, 0.7840632, 0.995715, 0, 1, 0.5215687, 1,
-0.1929963, -1.516925, -1.615151, 0, 1, 0.5254902, 1,
-0.1910231, 1.726261, -0.4979842, 0, 1, 0.5333334, 1,
-0.1902914, 0.9599381, 0.4832231, 0, 1, 0.5372549, 1,
-0.1886656, 0.3934065, 1.685714, 0, 1, 0.5450981, 1,
-0.1820655, 1.077774, -1.101987, 0, 1, 0.5490196, 1,
-0.1819621, -1.545225, -4.343855, 0, 1, 0.5568628, 1,
-0.1793577, 0.2928777, -0.2938792, 0, 1, 0.5607843, 1,
-0.1778292, -1.300206, -2.887048, 0, 1, 0.5686275, 1,
-0.1776552, -0.6616451, -4.382722, 0, 1, 0.572549, 1,
-0.1697505, -0.94471, -3.295885, 0, 1, 0.5803922, 1,
-0.1581047, 1.745009, 1.429498, 0, 1, 0.5843138, 1,
-0.1525014, -0.8565452, -2.99263, 0, 1, 0.5921569, 1,
-0.1520213, -0.2891837, -2.593314, 0, 1, 0.5960785, 1,
-0.1503075, -1.590014, -1.132357, 0, 1, 0.6039216, 1,
-0.1496308, -0.1022724, -3.159582, 0, 1, 0.6117647, 1,
-0.1424472, 0.1972944, -1.803515, 0, 1, 0.6156863, 1,
-0.141854, -0.7918614, -2.006429, 0, 1, 0.6235294, 1,
-0.1397711, -0.1264587, -1.566843, 0, 1, 0.627451, 1,
-0.1330423, -0.07052518, -2.49335, 0, 1, 0.6352941, 1,
-0.1232093, 0.7132671, -0.02396094, 0, 1, 0.6392157, 1,
-0.1159632, 0.4080179, -1.624175, 0, 1, 0.6470588, 1,
-0.1157672, 0.2065219, -1.016147, 0, 1, 0.6509804, 1,
-0.1147977, 0.3293809, -0.3144307, 0, 1, 0.6588235, 1,
-0.1145685, -0.1383502, -3.023791, 0, 1, 0.6627451, 1,
-0.1144008, 0.1801335, 0.1548576, 0, 1, 0.6705883, 1,
-0.112874, 0.3868691, -1.23278, 0, 1, 0.6745098, 1,
-0.104824, 0.1104823, -1.504823, 0, 1, 0.682353, 1,
-0.09272514, 0.7082607, 0.9816197, 0, 1, 0.6862745, 1,
-0.09110919, -0.07853504, -1.660597, 0, 1, 0.6941177, 1,
-0.0872129, -0.3074462, -2.32442, 0, 1, 0.7019608, 1,
-0.08259258, 0.768576, 1.109468, 0, 1, 0.7058824, 1,
-0.07904772, -0.264336, -3.797597, 0, 1, 0.7137255, 1,
-0.07618196, 0.4969208, 0.7568472, 0, 1, 0.7176471, 1,
-0.07357619, 0.4899981, -1.327274, 0, 1, 0.7254902, 1,
-0.06360999, 1.251835, 0.8951559, 0, 1, 0.7294118, 1,
-0.06142246, -0.4432942, -3.621182, 0, 1, 0.7372549, 1,
-0.05755664, 1.304251, 0.9174218, 0, 1, 0.7411765, 1,
-0.05650188, 1.220682, 1.594583, 0, 1, 0.7490196, 1,
-0.05403725, 0.2026732, -0.6661325, 0, 1, 0.7529412, 1,
-0.05122953, 0.2444808, -0.1740844, 0, 1, 0.7607843, 1,
-0.05076193, -0.08079844, -3.646518, 0, 1, 0.7647059, 1,
-0.04889416, -0.4702382, -3.504507, 0, 1, 0.772549, 1,
-0.04887123, -0.706136, -3.060101, 0, 1, 0.7764706, 1,
-0.04769935, -1.316753, -0.657098, 0, 1, 0.7843137, 1,
-0.03928329, -0.09467011, -3.050802, 0, 1, 0.7882353, 1,
-0.03559404, -1.246447, -2.092942, 0, 1, 0.7960784, 1,
-0.03169183, -0.7922167, -2.361272, 0, 1, 0.8039216, 1,
-0.0268886, -0.4519337, -3.13859, 0, 1, 0.8078431, 1,
-0.02338163, 1.488968, 2.311955, 0, 1, 0.8156863, 1,
-0.02224561, 0.04309209, -1.011778, 0, 1, 0.8196079, 1,
-0.02137853, 0.04950482, 0.379205, 0, 1, 0.827451, 1,
-0.02113829, 1.987528, 1.183872, 0, 1, 0.8313726, 1,
-0.01854082, 0.8256698, 0.5823781, 0, 1, 0.8392157, 1,
-0.01694148, -0.9586014, -4.93023, 0, 1, 0.8431373, 1,
-0.01693789, 0.6632333, -1.130698, 0, 1, 0.8509804, 1,
-0.01653823, 1.176201, -1.271299, 0, 1, 0.854902, 1,
-0.01403756, -0.1380246, -4.732457, 0, 1, 0.8627451, 1,
-0.009764097, -0.1753911, -2.570609, 0, 1, 0.8666667, 1,
-0.007558795, -0.436891, -1.784832, 0, 1, 0.8745098, 1,
0.0003013581, 0.7143641, -0.2459892, 0, 1, 0.8784314, 1,
0.00301394, 0.5438023, -0.6736627, 0, 1, 0.8862745, 1,
0.004316861, -0.01773182, 1.279514, 0, 1, 0.8901961, 1,
0.004571773, 1.865322, 0.04499253, 0, 1, 0.8980392, 1,
0.008176472, 0.2627695, -2.069889, 0, 1, 0.9058824, 1,
0.009055041, 0.3462433, -0.6972747, 0, 1, 0.9098039, 1,
0.009490711, -1.713811, 1.713188, 0, 1, 0.9176471, 1,
0.0104642, 0.8572162, 0.04806631, 0, 1, 0.9215686, 1,
0.01164368, 0.387959, -0.4939134, 0, 1, 0.9294118, 1,
0.01790488, -0.2090846, 3.441536, 0, 1, 0.9333333, 1,
0.02012752, 0.9695625, 0.8305977, 0, 1, 0.9411765, 1,
0.02235315, 0.9368986, -1.23914, 0, 1, 0.945098, 1,
0.02309569, -0.2621548, 3.923007, 0, 1, 0.9529412, 1,
0.02557038, -0.03794962, 4.340316, 0, 1, 0.9568627, 1,
0.02822554, 0.0335166, 0.08096324, 0, 1, 0.9647059, 1,
0.0296288, 0.1527861, -1.111222, 0, 1, 0.9686275, 1,
0.03108419, -0.317842, 2.130832, 0, 1, 0.9764706, 1,
0.03330756, 1.178894, 1.423336, 0, 1, 0.9803922, 1,
0.03404757, -1.050702, 3.51087, 0, 1, 0.9882353, 1,
0.03440501, 1.485687, -3.113535, 0, 1, 0.9921569, 1,
0.03502586, -0.7935538, 2.941402, 0, 1, 1, 1,
0.03957028, -1.621647, 3.148374, 0, 0.9921569, 1, 1,
0.04003309, 0.2696558, 0.04005298, 0, 0.9882353, 1, 1,
0.04148577, 1.225607, 1.094436, 0, 0.9803922, 1, 1,
0.04470023, -2.837926, 3.081328, 0, 0.9764706, 1, 1,
0.04748505, -2.544219, 3.682361, 0, 0.9686275, 1, 1,
0.05115812, 0.8998736, 0.561453, 0, 0.9647059, 1, 1,
0.05530637, 0.3617567, 0.05012446, 0, 0.9568627, 1, 1,
0.05895161, -0.6411952, 2.542124, 0, 0.9529412, 1, 1,
0.05982345, -1.57443, 1.767312, 0, 0.945098, 1, 1,
0.0610728, -0.2379712, 2.48728, 0, 0.9411765, 1, 1,
0.06554534, -0.09080069, 3.890628, 0, 0.9333333, 1, 1,
0.07313471, 1.275602, -0.4064403, 0, 0.9294118, 1, 1,
0.0765837, 0.7552963, 0.3417747, 0, 0.9215686, 1, 1,
0.08007969, -0.2279418, 2.264141, 0, 0.9176471, 1, 1,
0.08046523, 0.1667705, 0.3639275, 0, 0.9098039, 1, 1,
0.08164253, 0.4727553, -0.4194271, 0, 0.9058824, 1, 1,
0.08611358, -0.06161689, 1.697519, 0, 0.8980392, 1, 1,
0.08849752, 0.5987421, 0.4006532, 0, 0.8901961, 1, 1,
0.08890596, 0.6130636, -0.9554264, 0, 0.8862745, 1, 1,
0.08899762, -1.124268, 3.226391, 0, 0.8784314, 1, 1,
0.08944399, 0.01739806, 0.3932525, 0, 0.8745098, 1, 1,
0.09223936, -1.025167, 3.141958, 0, 0.8666667, 1, 1,
0.09434862, 0.7546673, 0.6337033, 0, 0.8627451, 1, 1,
0.09450584, 0.5087472, 0.5859752, 0, 0.854902, 1, 1,
0.09601074, 1.079511, -0.5724654, 0, 0.8509804, 1, 1,
0.1081518, 0.3995734, 0.762751, 0, 0.8431373, 1, 1,
0.1097993, -0.5436611, 3.07302, 0, 0.8392157, 1, 1,
0.1114091, -0.1807153, 1.707289, 0, 0.8313726, 1, 1,
0.1134443, 0.02254275, 3.094052, 0, 0.827451, 1, 1,
0.1135687, -0.6053109, 1.153608, 0, 0.8196079, 1, 1,
0.1165696, 1.173549, -1.049063, 0, 0.8156863, 1, 1,
0.1172911, 0.3186711, -1.26797, 0, 0.8078431, 1, 1,
0.118224, 0.5577316, 0.3514677, 0, 0.8039216, 1, 1,
0.1201815, -2.252628, 3.317621, 0, 0.7960784, 1, 1,
0.1209752, 0.6120339, -0.6662125, 0, 0.7882353, 1, 1,
0.1229799, 0.05059755, 1.485775, 0, 0.7843137, 1, 1,
0.1254989, -1.311497, 2.148987, 0, 0.7764706, 1, 1,
0.1297228, -0.4828863, 2.399823, 0, 0.772549, 1, 1,
0.1312831, 0.2036168, 0.4495688, 0, 0.7647059, 1, 1,
0.1318569, -0.9311585, 3.175239, 0, 0.7607843, 1, 1,
0.1334979, 1.140486, -0.7428285, 0, 0.7529412, 1, 1,
0.1386477, -0.3093709, 2.993929, 0, 0.7490196, 1, 1,
0.1394395, -0.2961199, 2.135553, 0, 0.7411765, 1, 1,
0.1399106, 0.289093, 2.308039, 0, 0.7372549, 1, 1,
0.1417827, -0.3673311, 3.515484, 0, 0.7294118, 1, 1,
0.1418562, -1.09512, 3.259673, 0, 0.7254902, 1, 1,
0.1505617, -0.4123261, 3.798078, 0, 0.7176471, 1, 1,
0.1536144, 2.040287, -1.914801, 0, 0.7137255, 1, 1,
0.1605812, -0.3046588, 3.262599, 0, 0.7058824, 1, 1,
0.1612331, -0.01341811, 2.750306, 0, 0.6980392, 1, 1,
0.163496, -0.6842344, 2.493055, 0, 0.6941177, 1, 1,
0.166756, -0.09779768, 0.926097, 0, 0.6862745, 1, 1,
0.1698337, 0.630918, -0.6459339, 0, 0.682353, 1, 1,
0.1710008, 0.1509537, 1.237363, 0, 0.6745098, 1, 1,
0.1730517, -0.5806612, 2.524002, 0, 0.6705883, 1, 1,
0.1731042, 0.5231597, -0.2096965, 0, 0.6627451, 1, 1,
0.1756539, 2.136146, -2.729545, 0, 0.6588235, 1, 1,
0.1758738, 0.553345, -1.11248, 0, 0.6509804, 1, 1,
0.1820327, 0.8662744, 1.108499, 0, 0.6470588, 1, 1,
0.1823172, -1.591798, 1.800231, 0, 0.6392157, 1, 1,
0.1827667, 0.1117914, 1.987594, 0, 0.6352941, 1, 1,
0.1834089, 0.4494001, -1.583649, 0, 0.627451, 1, 1,
0.1839031, -1.392611, 3.853069, 0, 0.6235294, 1, 1,
0.1917152, -0.3001432, 0.03462123, 0, 0.6156863, 1, 1,
0.1922262, 0.7017029, 0.05096176, 0, 0.6117647, 1, 1,
0.1925519, -0.7179604, 3.447464, 0, 0.6039216, 1, 1,
0.1943953, -0.304157, 0.9799764, 0, 0.5960785, 1, 1,
0.1951617, -0.01635183, 2.540217, 0, 0.5921569, 1, 1,
0.1965433, -1.435123, 0.9480972, 0, 0.5843138, 1, 1,
0.2007929, -1.585427, 2.967254, 0, 0.5803922, 1, 1,
0.2019392, -0.3619662, 2.980647, 0, 0.572549, 1, 1,
0.2026692, -0.03601562, 4.328724, 0, 0.5686275, 1, 1,
0.2045637, 0.02599471, 3.175, 0, 0.5607843, 1, 1,
0.2081107, 1.718096, -0.1223248, 0, 0.5568628, 1, 1,
0.2095156, -0.4545023, 3.058738, 0, 0.5490196, 1, 1,
0.2112789, -1.437486, 3.188002, 0, 0.5450981, 1, 1,
0.2137574, 0.2936757, 1.005983, 0, 0.5372549, 1, 1,
0.2166568, 1.237949, -1.352386, 0, 0.5333334, 1, 1,
0.223665, 1.4751, -0.2549728, 0, 0.5254902, 1, 1,
0.2257607, 0.5683998, 0.7418462, 0, 0.5215687, 1, 1,
0.2275976, 1.901037, 2.07589, 0, 0.5137255, 1, 1,
0.2318951, 1.207965, 1.304772, 0, 0.509804, 1, 1,
0.2332567, -1.186318, 2.593626, 0, 0.5019608, 1, 1,
0.236418, -0.2004507, 1.858022, 0, 0.4941176, 1, 1,
0.2364453, 1.383721, 0.6975818, 0, 0.4901961, 1, 1,
0.2370569, -0.02215312, 2.304049, 0, 0.4823529, 1, 1,
0.2389023, 1.366262, 0.5530656, 0, 0.4784314, 1, 1,
0.2391185, -1.473227, 2.217041, 0, 0.4705882, 1, 1,
0.2411007, -0.490063, 0.897424, 0, 0.4666667, 1, 1,
0.2440254, 0.4164307, -0.4926021, 0, 0.4588235, 1, 1,
0.2573233, -0.842452, 3.094197, 0, 0.454902, 1, 1,
0.2586894, 0.1349349, 1.601628, 0, 0.4470588, 1, 1,
0.2590846, 1.69148, 0.2056636, 0, 0.4431373, 1, 1,
0.2620395, -1.983672, 2.450573, 0, 0.4352941, 1, 1,
0.2633848, 0.8197418, 0.7197983, 0, 0.4313726, 1, 1,
0.265494, -0.1926094, 1.995437, 0, 0.4235294, 1, 1,
0.2680734, 0.995649, 0.008692505, 0, 0.4196078, 1, 1,
0.2681526, -0.07124995, 1.366438, 0, 0.4117647, 1, 1,
0.2705882, -0.9528623, 2.722304, 0, 0.4078431, 1, 1,
0.2707796, -2.189373, 2.415261, 0, 0.4, 1, 1,
0.2758311, -0.5260888, 2.992459, 0, 0.3921569, 1, 1,
0.2787397, 1.049594, 0.4226604, 0, 0.3882353, 1, 1,
0.2812402, -0.3572807, 2.727538, 0, 0.3803922, 1, 1,
0.2829812, 0.9826911, 0.6470655, 0, 0.3764706, 1, 1,
0.2829844, 1.451663, 1.135381, 0, 0.3686275, 1, 1,
0.2846757, 0.1925816, 0.2070682, 0, 0.3647059, 1, 1,
0.2866643, 0.1555533, 0.188349, 0, 0.3568628, 1, 1,
0.2890829, 0.0767056, 1.103467, 0, 0.3529412, 1, 1,
0.2902994, 0.736009, -0.4100874, 0, 0.345098, 1, 1,
0.2912275, -1.575794, 2.448698, 0, 0.3411765, 1, 1,
0.2919244, -0.5552312, 2.964072, 0, 0.3333333, 1, 1,
0.2926878, -0.5788508, 2.65136, 0, 0.3294118, 1, 1,
0.2974033, -0.3798629, 3.538301, 0, 0.3215686, 1, 1,
0.2983708, -0.7323908, 4.058821, 0, 0.3176471, 1, 1,
0.3030179, -0.6511191, 1.419456, 0, 0.3098039, 1, 1,
0.3045396, 1.983819, -0.2749983, 0, 0.3058824, 1, 1,
0.3063693, 1.564016, 0.5948918, 0, 0.2980392, 1, 1,
0.3107744, -0.6291274, 1.996801, 0, 0.2901961, 1, 1,
0.3109087, -0.4076081, 3.84121, 0, 0.2862745, 1, 1,
0.3142127, 0.2952147, -0.04317513, 0, 0.2784314, 1, 1,
0.3156177, -1.54012, 1.447395, 0, 0.2745098, 1, 1,
0.3157815, -0.3813944, 2.118446, 0, 0.2666667, 1, 1,
0.316577, -1.302621, 4.28446, 0, 0.2627451, 1, 1,
0.3175428, -1.345784, 3.189498, 0, 0.254902, 1, 1,
0.3241122, -0.1305909, 3.358409, 0, 0.2509804, 1, 1,
0.3267851, -0.9918466, 2.498731, 0, 0.2431373, 1, 1,
0.3297742, 0.01075005, 0.1357078, 0, 0.2392157, 1, 1,
0.3340753, -0.914775, 0.4045238, 0, 0.2313726, 1, 1,
0.3356771, 1.352005, 0.3672107, 0, 0.227451, 1, 1,
0.337417, 2.763735, 0.5104582, 0, 0.2196078, 1, 1,
0.3393061, -2.775044, 1.828102, 0, 0.2156863, 1, 1,
0.3454218, 1.441014, 0.1928818, 0, 0.2078431, 1, 1,
0.3512782, -0.1525417, 2.596637, 0, 0.2039216, 1, 1,
0.3526276, -0.9405037, 3.818021, 0, 0.1960784, 1, 1,
0.3539817, -1.038053, 3.269096, 0, 0.1882353, 1, 1,
0.3621867, 0.317119, 1.854609, 0, 0.1843137, 1, 1,
0.3667801, 0.4212943, 0.9922496, 0, 0.1764706, 1, 1,
0.367806, -1.440837, 1.702119, 0, 0.172549, 1, 1,
0.3700465, 1.288921, 0.0995734, 0, 0.1647059, 1, 1,
0.3720893, 0.9776465, 0.1606897, 0, 0.1607843, 1, 1,
0.373053, 0.6644297, 0.8134011, 0, 0.1529412, 1, 1,
0.3731357, 0.855755, 1.907324, 0, 0.1490196, 1, 1,
0.376124, 2.612972, 0.9272482, 0, 0.1411765, 1, 1,
0.3778579, -0.8615943, 2.899598, 0, 0.1372549, 1, 1,
0.3788895, -0.9791785, 2.585897, 0, 0.1294118, 1, 1,
0.3865202, -0.9090834, 1.365742, 0, 0.1254902, 1, 1,
0.3901837, 0.1638415, 0.08701995, 0, 0.1176471, 1, 1,
0.3913079, 0.006143376, 0.7009174, 0, 0.1137255, 1, 1,
0.3959999, 0.5898446, 1.207268, 0, 0.1058824, 1, 1,
0.3964618, -1.157853, 3.968451, 0, 0.09803922, 1, 1,
0.3969952, 0.2780548, 1.3934, 0, 0.09411765, 1, 1,
0.3970932, -0.7546787, 1.465407, 0, 0.08627451, 1, 1,
0.4000985, 0.2771614, -0.4761084, 0, 0.08235294, 1, 1,
0.4047789, -0.6664671, 0.07656364, 0, 0.07450981, 1, 1,
0.4132133, 1.523728, 0.7088423, 0, 0.07058824, 1, 1,
0.4161966, -1.086208, 2.765127, 0, 0.0627451, 1, 1,
0.4162599, 0.5044758, 2.601513, 0, 0.05882353, 1, 1,
0.418265, -0.4993079, 2.740879, 0, 0.05098039, 1, 1,
0.4218736, -1.413918, 2.016612, 0, 0.04705882, 1, 1,
0.4224913, 1.165649, 1.496033, 0, 0.03921569, 1, 1,
0.4299545, -2.023868, 1.965015, 0, 0.03529412, 1, 1,
0.4320778, -1.056739, 3.471543, 0, 0.02745098, 1, 1,
0.4361805, -0.2550392, 3.036413, 0, 0.02352941, 1, 1,
0.4402693, -0.6548473, 3.055164, 0, 0.01568628, 1, 1,
0.4464334, -0.8154349, 1.276435, 0, 0.01176471, 1, 1,
0.4496243, 0.5404038, -1.048007, 0, 0.003921569, 1, 1,
0.4505292, 2.686593, -0.5702654, 0.003921569, 0, 1, 1,
0.4653449, 0.01133138, 0.7556205, 0.007843138, 0, 1, 1,
0.468657, 1.342408, -0.8780972, 0.01568628, 0, 1, 1,
0.4721312, -0.3932722, 3.531143, 0.01960784, 0, 1, 1,
0.4725502, -0.03255942, 0.9819629, 0.02745098, 0, 1, 1,
0.4735822, 0.09310516, 0.7797466, 0.03137255, 0, 1, 1,
0.4754485, 0.05514315, 1.608167, 0.03921569, 0, 1, 1,
0.4757229, -1.087167, 3.51121, 0.04313726, 0, 1, 1,
0.4817623, 0.7579693, 0.4196823, 0.05098039, 0, 1, 1,
0.483463, -1.335822, 3.311003, 0.05490196, 0, 1, 1,
0.4834983, 1.695507, 0.3431702, 0.0627451, 0, 1, 1,
0.4912839, 1.590935, -0.8933952, 0.06666667, 0, 1, 1,
0.4958428, -0.4267243, 1.809515, 0.07450981, 0, 1, 1,
0.4980653, -0.0588593, -0.3944902, 0.07843138, 0, 1, 1,
0.501403, -1.797345, 3.000526, 0.08627451, 0, 1, 1,
0.5161644, -0.1590444, 2.360172, 0.09019608, 0, 1, 1,
0.5201447, 1.003927, 1.729966, 0.09803922, 0, 1, 1,
0.5216339, -1.461477, 4.235099, 0.1058824, 0, 1, 1,
0.5221827, -2.058693, 2.856704, 0.1098039, 0, 1, 1,
0.5273868, -0.2191493, 1.93426, 0.1176471, 0, 1, 1,
0.5283819, 1.07542, 0.7650508, 0.1215686, 0, 1, 1,
0.5298508, -0.2730077, 2.788706, 0.1294118, 0, 1, 1,
0.5419672, 0.5898514, -1.674419, 0.1333333, 0, 1, 1,
0.546668, -0.2852525, 1.932579, 0.1411765, 0, 1, 1,
0.5506374, -0.3100545, 2.97001, 0.145098, 0, 1, 1,
0.5532195, 0.3712945, 0.6757805, 0.1529412, 0, 1, 1,
0.5545296, 1.774889, 0.4343294, 0.1568628, 0, 1, 1,
0.5651086, 0.6738242, 0.05342168, 0.1647059, 0, 1, 1,
0.5695263, -0.4732546, 2.770333, 0.1686275, 0, 1, 1,
0.5715749, -0.8414996, 2.595511, 0.1764706, 0, 1, 1,
0.5716953, -0.2241327, 3.649766, 0.1803922, 0, 1, 1,
0.5721072, -1.272987, 3.533526, 0.1882353, 0, 1, 1,
0.5746553, 0.2807232, 2.141544, 0.1921569, 0, 1, 1,
0.5782745, -0.2308077, 1.196573, 0.2, 0, 1, 1,
0.5827734, -0.7249103, 2.991854, 0.2078431, 0, 1, 1,
0.5880873, 1.503698, 0.2706542, 0.2117647, 0, 1, 1,
0.5909125, 0.0513598, 1.83368, 0.2196078, 0, 1, 1,
0.5918041, 1.94858, 0.1252389, 0.2235294, 0, 1, 1,
0.592474, 1.262034, 0.9736956, 0.2313726, 0, 1, 1,
0.5929927, -0.2975289, 2.737452, 0.2352941, 0, 1, 1,
0.5934156, -0.2888995, 3.010045, 0.2431373, 0, 1, 1,
0.603963, 0.3566813, 1.082581, 0.2470588, 0, 1, 1,
0.6056344, 2.170543, -1.561276, 0.254902, 0, 1, 1,
0.6056663, 0.9704729, 0.853623, 0.2588235, 0, 1, 1,
0.6071585, 0.26339, 2.193358, 0.2666667, 0, 1, 1,
0.6086564, 0.1784347, 0.9928428, 0.2705882, 0, 1, 1,
0.6122448, 0.005000911, 2.527848, 0.2784314, 0, 1, 1,
0.6142933, 1.487687, 0.8080369, 0.282353, 0, 1, 1,
0.6152449, 0.7460265, -0.4162157, 0.2901961, 0, 1, 1,
0.6176333, -1.063123, 3.782824, 0.2941177, 0, 1, 1,
0.6256883, 0.8296794, 0.7450296, 0.3019608, 0, 1, 1,
0.6349968, 0.3622203, 1.538678, 0.3098039, 0, 1, 1,
0.6357702, 0.5711619, -0.8453886, 0.3137255, 0, 1, 1,
0.6404133, -0.8780797, 3.716058, 0.3215686, 0, 1, 1,
0.6409839, -0.09876537, 0.415734, 0.3254902, 0, 1, 1,
0.6465585, 1.415835, 0.9125945, 0.3333333, 0, 1, 1,
0.646854, -0.3686004, 3.629179, 0.3372549, 0, 1, 1,
0.6468915, -0.2013283, 3.365662, 0.345098, 0, 1, 1,
0.6469918, -0.7124854, 2.514626, 0.3490196, 0, 1, 1,
0.6537712, 0.7418565, 0.2798701, 0.3568628, 0, 1, 1,
0.6547806, 0.02837163, 2.379973, 0.3607843, 0, 1, 1,
0.6550841, 0.6880711, 1.829204, 0.3686275, 0, 1, 1,
0.6595542, -0.009284781, 0.2634479, 0.372549, 0, 1, 1,
0.6646639, 0.2029357, 1.933341, 0.3803922, 0, 1, 1,
0.6665706, -0.1373648, 3.531027, 0.3843137, 0, 1, 1,
0.6703932, 0.3529496, 3.636788, 0.3921569, 0, 1, 1,
0.6712881, 0.6476269, 1.24916, 0.3960784, 0, 1, 1,
0.6733572, 0.5691391, 0.8762047, 0.4039216, 0, 1, 1,
0.6735841, -2.299721, 4.475518, 0.4117647, 0, 1, 1,
0.6768432, -0.8504236, 3.459326, 0.4156863, 0, 1, 1,
0.680857, -1.986482, 2.643693, 0.4235294, 0, 1, 1,
0.682963, 0.1605726, 2.629005, 0.427451, 0, 1, 1,
0.6861357, -0.2288941, 0.6381842, 0.4352941, 0, 1, 1,
0.6869353, -0.5887609, 2.429141, 0.4392157, 0, 1, 1,
0.6895833, -0.04476334, 2.113242, 0.4470588, 0, 1, 1,
0.6930995, 0.3402714, 1.540113, 0.4509804, 0, 1, 1,
0.6960616, 1.545467, -0.4734364, 0.4588235, 0, 1, 1,
0.7018889, -0.6871469, 2.83124, 0.4627451, 0, 1, 1,
0.7048925, -0.6092656, 2.373976, 0.4705882, 0, 1, 1,
0.7054506, 1.0094, 0.7092484, 0.4745098, 0, 1, 1,
0.7057543, -1.098531, 4.733612, 0.4823529, 0, 1, 1,
0.7065895, 0.6606564, 0.2631011, 0.4862745, 0, 1, 1,
0.7144654, -1.876749, 2.925948, 0.4941176, 0, 1, 1,
0.7246904, -2.384745, 3.93274, 0.5019608, 0, 1, 1,
0.7283248, 1.150703, -0.3809889, 0.5058824, 0, 1, 1,
0.7318507, -1.068867, 2.759608, 0.5137255, 0, 1, 1,
0.7330492, -1.700078, 2.243221, 0.5176471, 0, 1, 1,
0.7384853, 1.452038, 1.07661, 0.5254902, 0, 1, 1,
0.7430845, 1.264853, -0.7185571, 0.5294118, 0, 1, 1,
0.7479483, -0.8633149, 3.087101, 0.5372549, 0, 1, 1,
0.7522978, 0.2401486, -0.2887338, 0.5411765, 0, 1, 1,
0.7539468, 0.7211676, 1.33695, 0.5490196, 0, 1, 1,
0.754472, 0.1819727, 1.584575, 0.5529412, 0, 1, 1,
0.7624999, -0.5566526, 2.384842, 0.5607843, 0, 1, 1,
0.7650932, -1.021446, 2.228681, 0.5647059, 0, 1, 1,
0.765256, -0.638972, 2.281734, 0.572549, 0, 1, 1,
0.7663657, -1.772042, 0.1493485, 0.5764706, 0, 1, 1,
0.7703507, 0.6273217, 2.070304, 0.5843138, 0, 1, 1,
0.7716079, 0.2797145, 0.269935, 0.5882353, 0, 1, 1,
0.7765725, -0.3302545, 1.692869, 0.5960785, 0, 1, 1,
0.7883042, 0.2465885, 0.5884665, 0.6039216, 0, 1, 1,
0.7934704, 0.8312794, 0.6254237, 0.6078432, 0, 1, 1,
0.7937437, 0.3866132, 0.6071236, 0.6156863, 0, 1, 1,
0.7961916, 1.468058, 0.7052977, 0.6196079, 0, 1, 1,
0.7971795, 0.157508, 0.1404508, 0.627451, 0, 1, 1,
0.7980629, -0.507811, 1.00513, 0.6313726, 0, 1, 1,
0.8005088, -1.663272, 2.381104, 0.6392157, 0, 1, 1,
0.8068346, -0.5750536, 2.701296, 0.6431373, 0, 1, 1,
0.8137203, -0.5472006, 2.938678, 0.6509804, 0, 1, 1,
0.8150524, 0.4644717, 1.006238, 0.654902, 0, 1, 1,
0.8208973, 0.4933723, 1.346585, 0.6627451, 0, 1, 1,
0.8225896, 0.2107039, 2.112124, 0.6666667, 0, 1, 1,
0.8226357, 0.9592538, -0.3508048, 0.6745098, 0, 1, 1,
0.8245779, 0.5757717, 1.165587, 0.6784314, 0, 1, 1,
0.8314833, -0.3561448, 2.08794, 0.6862745, 0, 1, 1,
0.832077, 0.1090736, 0.7275419, 0.6901961, 0, 1, 1,
0.8349624, 0.4663602, 1.001932, 0.6980392, 0, 1, 1,
0.8352609, -0.8836583, 3.764386, 0.7058824, 0, 1, 1,
0.8370048, 2.911353, -0.2373441, 0.7098039, 0, 1, 1,
0.8400738, -0.7638977, 3.371547, 0.7176471, 0, 1, 1,
0.8438607, -0.1056514, 1.971725, 0.7215686, 0, 1, 1,
0.8462572, 0.3470445, 0.9141915, 0.7294118, 0, 1, 1,
0.8476948, 1.016282, 1.053138, 0.7333333, 0, 1, 1,
0.8492011, -0.8304863, 3.001359, 0.7411765, 0, 1, 1,
0.8525288, -0.08185215, 0.882683, 0.7450981, 0, 1, 1,
0.8560085, 0.5211307, 3.786973, 0.7529412, 0, 1, 1,
0.8573668, 0.814943, 0.3687959, 0.7568628, 0, 1, 1,
0.8577866, 0.2700083, 0.366223, 0.7647059, 0, 1, 1,
0.859851, 0.4884935, -0.05410223, 0.7686275, 0, 1, 1,
0.8635691, 1.139324, 0.003925809, 0.7764706, 0, 1, 1,
0.8708351, 0.6262667, 1.088221, 0.7803922, 0, 1, 1,
0.8745881, -0.01391666, 2.124504, 0.7882353, 0, 1, 1,
0.8756683, -1.040401, 3.205174, 0.7921569, 0, 1, 1,
0.877126, -0.9154577, 2.566486, 0.8, 0, 1, 1,
0.8788836, 0.2698795, 2.48579, 0.8078431, 0, 1, 1,
0.8941493, -0.02718913, 2.482416, 0.8117647, 0, 1, 1,
0.8990195, 0.9794517, 0.5569593, 0.8196079, 0, 1, 1,
0.9068102, -1.649556, 3.715787, 0.8235294, 0, 1, 1,
0.90934, -1.197359, 3.253854, 0.8313726, 0, 1, 1,
0.9291196, -0.8089819, 2.429719, 0.8352941, 0, 1, 1,
0.9358217, -0.1503544, 1.00563, 0.8431373, 0, 1, 1,
0.9363323, 0.9438731, 1.135808, 0.8470588, 0, 1, 1,
0.938728, 0.07968636, 1.407698, 0.854902, 0, 1, 1,
0.9427009, -1.146566, 1.648522, 0.8588235, 0, 1, 1,
0.9443414, 0.7711118, 1.955256, 0.8666667, 0, 1, 1,
0.9444189, -1.068082, 0.9792013, 0.8705882, 0, 1, 1,
0.9454525, 1.693837, 0.4957614, 0.8784314, 0, 1, 1,
0.9467332, -1.226935, 1.999131, 0.8823529, 0, 1, 1,
0.9501898, 0.6402383, 0.2275127, 0.8901961, 0, 1, 1,
0.95027, 1.305314, -0.4429607, 0.8941177, 0, 1, 1,
0.9511651, -0.4558511, 1.869384, 0.9019608, 0, 1, 1,
0.9558135, -0.4076711, 0.4811704, 0.9098039, 0, 1, 1,
0.9570956, 1.872401, 0.4462738, 0.9137255, 0, 1, 1,
0.9581936, 0.7931536, -0.3336193, 0.9215686, 0, 1, 1,
0.9619032, 0.4150908, 2.3079, 0.9254902, 0, 1, 1,
0.9635906, 2.170022, 0.3700725, 0.9333333, 0, 1, 1,
0.9681194, 0.2611763, 2.077814, 0.9372549, 0, 1, 1,
0.9685064, 1.448406, -0.8432235, 0.945098, 0, 1, 1,
0.9685629, -0.3979273, 3.258903, 0.9490196, 0, 1, 1,
0.9695086, -0.8216874, 3.885932, 0.9568627, 0, 1, 1,
0.9722518, -0.29978, 2.386797, 0.9607843, 0, 1, 1,
0.9765934, 0.7228772, 1.118697, 0.9686275, 0, 1, 1,
0.9803792, 0.06476942, 0.8233801, 0.972549, 0, 1, 1,
0.9838101, -2.590823, 1.860641, 0.9803922, 0, 1, 1,
0.9846994, 1.911981, 0.7443703, 0.9843137, 0, 1, 1,
0.9904246, 0.5360972, 1.291354, 0.9921569, 0, 1, 1,
0.9910433, 0.07443, 2.5181, 0.9960784, 0, 1, 1,
0.9952981, 0.5320987, 1.24814, 1, 0, 0.9960784, 1,
0.9970851, -0.2311642, 1.494232, 1, 0, 0.9882353, 1,
1.000068, -1.655923, 3.702213, 1, 0, 0.9843137, 1,
1.004957, 2.118303, -0.9508358, 1, 0, 0.9764706, 1,
1.005528, 0.08460059, 2.121299, 1, 0, 0.972549, 1,
1.009873, 0.8048623, 1.732675, 1, 0, 0.9647059, 1,
1.032118, 1.881762, 0.4945388, 1, 0, 0.9607843, 1,
1.035164, 0.1382841, 2.63016, 1, 0, 0.9529412, 1,
1.035475, -1.253002, 0.6950503, 1, 0, 0.9490196, 1,
1.039836, 0.8621618, 0.4678928, 1, 0, 0.9411765, 1,
1.056434, -0.819095, 3.765403, 1, 0, 0.9372549, 1,
1.064725, -0.3673, 1.611839, 1, 0, 0.9294118, 1,
1.06904, -0.1494174, 1.73604, 1, 0, 0.9254902, 1,
1.078478, 0.2632319, 1.999621, 1, 0, 0.9176471, 1,
1.078829, -1.123227, 2.78534, 1, 0, 0.9137255, 1,
1.082807, 1.391246, 0.01158814, 1, 0, 0.9058824, 1,
1.084551, 1.463103, 1.084652, 1, 0, 0.9019608, 1,
1.089656, -0.6384962, 2.635506, 1, 0, 0.8941177, 1,
1.091168, 0.05846181, 1.79773, 1, 0, 0.8862745, 1,
1.09343, 0.1210824, 2.423401, 1, 0, 0.8823529, 1,
1.096811, 0.649536, 1.744901, 1, 0, 0.8745098, 1,
1.098844, -1.265609, 2.894426, 1, 0, 0.8705882, 1,
1.103561, -1.885969, 3.237278, 1, 0, 0.8627451, 1,
1.103734, -0.07227413, 0.4464304, 1, 0, 0.8588235, 1,
1.11193, 0.4466728, 1.656819, 1, 0, 0.8509804, 1,
1.114637, 1.106648, -0.2895694, 1, 0, 0.8470588, 1,
1.117717, -0.4529902, 1.105969, 1, 0, 0.8392157, 1,
1.123799, -0.3670017, 1.489418, 1, 0, 0.8352941, 1,
1.13178, -1.308951, 2.124283, 1, 0, 0.827451, 1,
1.139838, 0.7592601, -0.4240683, 1, 0, 0.8235294, 1,
1.144341, 1.655386, 0.9071938, 1, 0, 0.8156863, 1,
1.148386, 1.128599, 0.005328562, 1, 0, 0.8117647, 1,
1.15861, 1.36839, 1.130923, 1, 0, 0.8039216, 1,
1.161049, -0.6209105, 2.959368, 1, 0, 0.7960784, 1,
1.167024, -0.4323818, 0.01824781, 1, 0, 0.7921569, 1,
1.167751, 1.748731, -0.4382875, 1, 0, 0.7843137, 1,
1.170099, -0.1259823, 0.8783786, 1, 0, 0.7803922, 1,
1.173005, 1.757352, 0.261451, 1, 0, 0.772549, 1,
1.173724, -1.668139, 3.391585, 1, 0, 0.7686275, 1,
1.184512, 0.7222215, 0.6290275, 1, 0, 0.7607843, 1,
1.186024, -0.3650147, 1.853512, 1, 0, 0.7568628, 1,
1.1881, -0.8816242, 2.483984, 1, 0, 0.7490196, 1,
1.192301, 0.1695444, 2.073669, 1, 0, 0.7450981, 1,
1.195039, 0.7272657, 0.7928061, 1, 0, 0.7372549, 1,
1.195712, -0.4526644, 2.329704, 1, 0, 0.7333333, 1,
1.197001, -0.7367715, 3.335997, 1, 0, 0.7254902, 1,
1.198362, 0.1921246, 1.41088, 1, 0, 0.7215686, 1,
1.203639, 0.7912253, 0.5344638, 1, 0, 0.7137255, 1,
1.20992, 1.237356, 2.624923, 1, 0, 0.7098039, 1,
1.210511, -1.267657, 3.003963, 1, 0, 0.7019608, 1,
1.211117, 0.2852665, 0.1970584, 1, 0, 0.6941177, 1,
1.213749, 1.296904, 0.3117305, 1, 0, 0.6901961, 1,
1.217893, -0.7135825, 2.998206, 1, 0, 0.682353, 1,
1.220369, 1.553289, 2.234259, 1, 0, 0.6784314, 1,
1.22107, 0.3454623, 1.181771, 1, 0, 0.6705883, 1,
1.222688, -0.5722759, 2.474905, 1, 0, 0.6666667, 1,
1.223321, 0.7663919, 1.975498, 1, 0, 0.6588235, 1,
1.226972, -1.732245, 2.247056, 1, 0, 0.654902, 1,
1.23579, -1.680039, 0.9683139, 1, 0, 0.6470588, 1,
1.237149, 0.2616359, 2.278975, 1, 0, 0.6431373, 1,
1.245746, 1.122877, 2.371492, 1, 0, 0.6352941, 1,
1.247498, 0.3943611, 3.720601, 1, 0, 0.6313726, 1,
1.261847, -2.755062, 3.035784, 1, 0, 0.6235294, 1,
1.267419, 0.5547442, -0.9162468, 1, 0, 0.6196079, 1,
1.27146, -0.3140739, 1.32463, 1, 0, 0.6117647, 1,
1.271893, -0.4694345, 0.3204064, 1, 0, 0.6078432, 1,
1.274621, 1.35952, 0.4038674, 1, 0, 0.6, 1,
1.280703, 1.186039, -0.3528199, 1, 0, 0.5921569, 1,
1.283134, 0.9970478, 2.256389, 1, 0, 0.5882353, 1,
1.283677, -0.511993, 0.4877738, 1, 0, 0.5803922, 1,
1.283735, -0.3082357, 2.308743, 1, 0, 0.5764706, 1,
1.284523, 0.7854832, 1.176067, 1, 0, 0.5686275, 1,
1.28592, 0.7902923, 1.640459, 1, 0, 0.5647059, 1,
1.28817, 1.352865, 0.6170657, 1, 0, 0.5568628, 1,
1.288192, 0.5629597, -0.6323451, 1, 0, 0.5529412, 1,
1.300682, 1.485655, 0.6286007, 1, 0, 0.5450981, 1,
1.316496, 0.9119231, 3.602494, 1, 0, 0.5411765, 1,
1.322647, 0.6789773, 2.490986, 1, 0, 0.5333334, 1,
1.327205, 1.386578, 1.47124, 1, 0, 0.5294118, 1,
1.333363, 1.257263, -0.3884745, 1, 0, 0.5215687, 1,
1.333714, -0.6442178, 2.783948, 1, 0, 0.5176471, 1,
1.334121, 0.08034718, 1.640839, 1, 0, 0.509804, 1,
1.335927, 0.3515977, 2.914748, 1, 0, 0.5058824, 1,
1.345011, 0.2727115, 1.429983, 1, 0, 0.4980392, 1,
1.347507, 0.7593096, 0.369636, 1, 0, 0.4901961, 1,
1.359247, 0.2524281, 0.3492104, 1, 0, 0.4862745, 1,
1.367779, -0.985717, 0.9174917, 1, 0, 0.4784314, 1,
1.370196, -0.1060989, 1.19504, 1, 0, 0.4745098, 1,
1.374206, -0.855395, 3.522598, 1, 0, 0.4666667, 1,
1.388724, -1.375171, 3.14403, 1, 0, 0.4627451, 1,
1.389128, -1.056874, 2.932454, 1, 0, 0.454902, 1,
1.399114, -0.9360673, 2.318267, 1, 0, 0.4509804, 1,
1.40688, -0.5474548, 4.220747, 1, 0, 0.4431373, 1,
1.407232, -1.72534, 2.228984, 1, 0, 0.4392157, 1,
1.421715, 0.09764296, 2.43675, 1, 0, 0.4313726, 1,
1.422827, -2.050688, 3.099576, 1, 0, 0.427451, 1,
1.424471, 1.135907, 0.4813216, 1, 0, 0.4196078, 1,
1.435829, 0.6927758, 0.8329532, 1, 0, 0.4156863, 1,
1.447801, -0.3007824, 0.8822042, 1, 0, 0.4078431, 1,
1.455938, 0.4246602, 1.547343, 1, 0, 0.4039216, 1,
1.456033, 0.2919054, 2.035446, 1, 0, 0.3960784, 1,
1.469708, -0.02058621, 3.338848, 1, 0, 0.3882353, 1,
1.472567, 0.3582248, 2.377524, 1, 0, 0.3843137, 1,
1.474442, -1.474478, 2.817315, 1, 0, 0.3764706, 1,
1.491054, -0.3014587, 2.24539, 1, 0, 0.372549, 1,
1.521256, 1.119634, -0.5275102, 1, 0, 0.3647059, 1,
1.523351, 0.171329, 0.5955113, 1, 0, 0.3607843, 1,
1.5307, 1.601856, 1.222144, 1, 0, 0.3529412, 1,
1.539648, 0.6104207, 1.476116, 1, 0, 0.3490196, 1,
1.554938, 0.5880569, 2.161923, 1, 0, 0.3411765, 1,
1.559175, -0.4107127, 2.542415, 1, 0, 0.3372549, 1,
1.565072, 0.3505392, 1.132813, 1, 0, 0.3294118, 1,
1.584789, 0.7264606, -0.4372164, 1, 0, 0.3254902, 1,
1.609349, 0.06989796, 2.414904, 1, 0, 0.3176471, 1,
1.61027, -0.2828275, 3.11464, 1, 0, 0.3137255, 1,
1.611718, -1.372727, 2.553023, 1, 0, 0.3058824, 1,
1.618065, 0.8982471, 0.7161261, 1, 0, 0.2980392, 1,
1.618774, 1.034175, 2.715404, 1, 0, 0.2941177, 1,
1.640898, -1.176744, 2.196828, 1, 0, 0.2862745, 1,
1.643706, 2.15555, 1.912961, 1, 0, 0.282353, 1,
1.65086, -0.3988924, 1.063432, 1, 0, 0.2745098, 1,
1.655779, 0.1655984, 1.994062, 1, 0, 0.2705882, 1,
1.672194, -0.2305264, 1.767434, 1, 0, 0.2627451, 1,
1.687501, -1.411917, 1.687533, 1, 0, 0.2588235, 1,
1.689512, 0.739978, -0.1902283, 1, 0, 0.2509804, 1,
1.693484, -0.3237013, 0.7250999, 1, 0, 0.2470588, 1,
1.696978, 0.06732681, 3.03828, 1, 0, 0.2392157, 1,
1.719876, 0.2332305, 2.123548, 1, 0, 0.2352941, 1,
1.74885, 0.1535248, 2.274553, 1, 0, 0.227451, 1,
1.749118, -1.071862, 0.03480603, 1, 0, 0.2235294, 1,
1.757946, -1.300692, 2.104086, 1, 0, 0.2156863, 1,
1.776168, 2.587969, 1.526749, 1, 0, 0.2117647, 1,
1.782036, -0.6879948, 2.791746, 1, 0, 0.2039216, 1,
1.786758, -0.3942972, 3.017208, 1, 0, 0.1960784, 1,
1.809459, 0.1468121, 0.5208433, 1, 0, 0.1921569, 1,
1.811106, 0.8826358, 1.449225, 1, 0, 0.1843137, 1,
1.822989, -0.5802685, -0.1604854, 1, 0, 0.1803922, 1,
1.823768, 0.7380295, 0.9132504, 1, 0, 0.172549, 1,
1.831278, 0.4719746, -0.3434994, 1, 0, 0.1686275, 1,
1.871322, -1.488103, 0.6784132, 1, 0, 0.1607843, 1,
1.871707, -0.5759498, 2.785069, 1, 0, 0.1568628, 1,
1.875136, -1.481432, 2.394993, 1, 0, 0.1490196, 1,
1.890504, 0.4302392, 1.602093, 1, 0, 0.145098, 1,
1.916854, 1.49028, 2.59691, 1, 0, 0.1372549, 1,
1.951711, 0.8323783, 0.6959445, 1, 0, 0.1333333, 1,
1.954793, -0.4255472, 2.782534, 1, 0, 0.1254902, 1,
1.966195, -0.3185797, 4.481605, 1, 0, 0.1215686, 1,
1.969953, -1.11797, 3.733638, 1, 0, 0.1137255, 1,
1.987204, 1.095884, 0.8850639, 1, 0, 0.1098039, 1,
1.991471, 1.458903, 1.575931, 1, 0, 0.1019608, 1,
2.008753, 1.583539, 1.041817, 1, 0, 0.09411765, 1,
2.04917, 2.325874, 1.239254, 1, 0, 0.09019608, 1,
2.051172, -0.1671854, 1.435946, 1, 0, 0.08235294, 1,
2.05859, -0.3137739, 2.689926, 1, 0, 0.07843138, 1,
2.080484, 0.4203163, 1.686303, 1, 0, 0.07058824, 1,
2.080568, 0.8551227, 1.968579, 1, 0, 0.06666667, 1,
2.096295, -1.701028, 4.131721, 1, 0, 0.05882353, 1,
2.142528, 1.761761, -1.059288, 1, 0, 0.05490196, 1,
2.151641, 0.218338, 1.041464, 1, 0, 0.04705882, 1,
2.195384, -1.096112, 2.565869, 1, 0, 0.04313726, 1,
2.243319, -1.657251, 2.789974, 1, 0, 0.03529412, 1,
2.25427, -0.6765071, 1.682688, 1, 0, 0.03137255, 1,
2.378297, 1.402767, -0.1244493, 1, 0, 0.02352941, 1,
2.647175, 0.08341977, 0.524205, 1, 0, 0.01960784, 1,
2.931706, 0.5755914, -0.9170884, 1, 0, 0.01176471, 1,
3.000334, -1.198264, 1.623191, 1, 0, 0.007843138, 1
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
-0.05827689, -3.996418, -7.619958, 0, -0.5, 0.5, 0.5,
-0.05827689, -3.996418, -7.619958, 1, -0.5, 0.5, 0.5,
-0.05827689, -3.996418, -7.619958, 1, 1.5, 0.5, 0.5,
-0.05827689, -3.996418, -7.619958, 0, 1.5, 0.5, 0.5
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
-4.153757, -0.04194784, -7.619958, 0, -0.5, 0.5, 0.5,
-4.153757, -0.04194784, -7.619958, 1, -0.5, 0.5, 0.5,
-4.153757, -0.04194784, -7.619958, 1, 1.5, 0.5, 0.5,
-4.153757, -0.04194784, -7.619958, 0, 1.5, 0.5, 0.5
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
-4.153757, -3.996418, -0.5479486, 0, -0.5, 0.5, 0.5,
-4.153757, -3.996418, -0.5479486, 1, -0.5, 0.5, 0.5,
-4.153757, -3.996418, -0.5479486, 1, 1.5, 0.5, 0.5,
-4.153757, -3.996418, -0.5479486, 0, 1.5, 0.5, 0.5
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
-3, -3.083848, -5.987956,
3, -3.083848, -5.987956,
-3, -3.083848, -5.987956,
-3, -3.235943, -6.259956,
-2, -3.083848, -5.987956,
-2, -3.235943, -6.259956,
-1, -3.083848, -5.987956,
-1, -3.235943, -6.259956,
0, -3.083848, -5.987956,
0, -3.235943, -6.259956,
1, -3.083848, -5.987956,
1, -3.235943, -6.259956,
2, -3.083848, -5.987956,
2, -3.235943, -6.259956,
3, -3.083848, -5.987956,
3, -3.235943, -6.259956
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
-3, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
-3, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
-3, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
-3, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
-2, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
-2, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
-2, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
-2, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
-1, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
-1, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
-1, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
-1, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
0, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
0, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
0, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
0, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
1, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
1, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
1, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
1, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
2, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
2, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
2, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
2, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5,
3, -3.540133, -6.803957, 0, -0.5, 0.5, 0.5,
3, -3.540133, -6.803957, 1, -0.5, 0.5, 0.5,
3, -3.540133, -6.803957, 1, 1.5, 0.5, 0.5,
3, -3.540133, -6.803957, 0, 1.5, 0.5, 0.5
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
-3.208646, -2, -5.987956,
-3.208646, 2, -5.987956,
-3.208646, -2, -5.987956,
-3.366164, -2, -6.259956,
-3.208646, -1, -5.987956,
-3.366164, -1, -6.259956,
-3.208646, 0, -5.987956,
-3.366164, 0, -6.259956,
-3.208646, 1, -5.987956,
-3.366164, 1, -6.259956,
-3.208646, 2, -5.987956,
-3.366164, 2, -6.259956
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
-3.681201, -2, -6.803957, 0, -0.5, 0.5, 0.5,
-3.681201, -2, -6.803957, 1, -0.5, 0.5, 0.5,
-3.681201, -2, -6.803957, 1, 1.5, 0.5, 0.5,
-3.681201, -2, -6.803957, 0, 1.5, 0.5, 0.5,
-3.681201, -1, -6.803957, 0, -0.5, 0.5, 0.5,
-3.681201, -1, -6.803957, 1, -0.5, 0.5, 0.5,
-3.681201, -1, -6.803957, 1, 1.5, 0.5, 0.5,
-3.681201, -1, -6.803957, 0, 1.5, 0.5, 0.5,
-3.681201, 0, -6.803957, 0, -0.5, 0.5, 0.5,
-3.681201, 0, -6.803957, 1, -0.5, 0.5, 0.5,
-3.681201, 0, -6.803957, 1, 1.5, 0.5, 0.5,
-3.681201, 0, -6.803957, 0, 1.5, 0.5, 0.5,
-3.681201, 1, -6.803957, 0, -0.5, 0.5, 0.5,
-3.681201, 1, -6.803957, 1, -0.5, 0.5, 0.5,
-3.681201, 1, -6.803957, 1, 1.5, 0.5, 0.5,
-3.681201, 1, -6.803957, 0, 1.5, 0.5, 0.5,
-3.681201, 2, -6.803957, 0, -0.5, 0.5, 0.5,
-3.681201, 2, -6.803957, 1, -0.5, 0.5, 0.5,
-3.681201, 2, -6.803957, 1, 1.5, 0.5, 0.5,
-3.681201, 2, -6.803957, 0, 1.5, 0.5, 0.5
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
-3.208646, -3.083848, -4,
-3.208646, -3.083848, 4,
-3.208646, -3.083848, -4,
-3.366164, -3.235943, -4,
-3.208646, -3.083848, -2,
-3.366164, -3.235943, -2,
-3.208646, -3.083848, 0,
-3.366164, -3.235943, 0,
-3.208646, -3.083848, 2,
-3.366164, -3.235943, 2,
-3.208646, -3.083848, 4,
-3.366164, -3.235943, 4
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
-3.681201, -3.540133, -4, 0, -0.5, 0.5, 0.5,
-3.681201, -3.540133, -4, 1, -0.5, 0.5, 0.5,
-3.681201, -3.540133, -4, 1, 1.5, 0.5, 0.5,
-3.681201, -3.540133, -4, 0, 1.5, 0.5, 0.5,
-3.681201, -3.540133, -2, 0, -0.5, 0.5, 0.5,
-3.681201, -3.540133, -2, 1, -0.5, 0.5, 0.5,
-3.681201, -3.540133, -2, 1, 1.5, 0.5, 0.5,
-3.681201, -3.540133, -2, 0, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 0, 0, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 0, 1, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 0, 1, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 0, 0, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 2, 0, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 2, 1, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 2, 1, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 2, 0, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 4, 0, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 4, 1, -0.5, 0.5, 0.5,
-3.681201, -3.540133, 4, 1, 1.5, 0.5, 0.5,
-3.681201, -3.540133, 4, 0, 1.5, 0.5, 0.5
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
-3.208646, -3.083848, -5.987956,
-3.208646, 2.999952, -5.987956,
-3.208646, -3.083848, 4.892059,
-3.208646, 2.999952, 4.892059,
-3.208646, -3.083848, -5.987956,
-3.208646, -3.083848, 4.892059,
-3.208646, 2.999952, -5.987956,
-3.208646, 2.999952, 4.892059,
-3.208646, -3.083848, -5.987956,
3.092092, -3.083848, -5.987956,
-3.208646, -3.083848, 4.892059,
3.092092, -3.083848, 4.892059,
-3.208646, 2.999952, -5.987956,
3.092092, 2.999952, -5.987956,
-3.208646, 2.999952, 4.892059,
3.092092, 2.999952, 4.892059,
3.092092, -3.083848, -5.987956,
3.092092, 2.999952, -5.987956,
3.092092, -3.083848, 4.892059,
3.092092, 2.999952, 4.892059,
3.092092, -3.083848, -5.987956,
3.092092, -3.083848, 4.892059,
3.092092, 2.999952, -5.987956,
3.092092, 2.999952, 4.892059
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
var radius = 7.45829;
var distance = 33.18277;
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
mvMatrix.translate( 0.05827689, 0.04194784, 0.5479486 );
mvMatrix.scale( 1.279858, 1.325495, 0.7411799 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.18277);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
imazamox<-read.table("imazamox.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazamox$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
```

```r
y<-imazamox$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
```

```r
z<-imazamox$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazamox' not found
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
-3.116888, 0.1034252, -1.422552, 0, 0, 1, 1, 1,
-3.052831, 1.678299, -0.6964187, 1, 0, 0, 1, 1,
-3.041708, -1.051439, -0.6692737, 1, 0, 0, 1, 1,
-2.99972, -0.5438128, -0.9407293, 1, 0, 0, 1, 1,
-2.820778, 0.4301691, -0.7618281, 1, 0, 0, 1, 1,
-2.817358, -0.6043966, -1.334362, 1, 0, 0, 1, 1,
-2.749537, 1.266195, -3.948041, 0, 0, 0, 1, 1,
-2.708, -1.044982, -1.861494, 0, 0, 0, 1, 1,
-2.646166, -0.9489447, -1.872007, 0, 0, 0, 1, 1,
-2.552718, 0.05322477, -1.053206, 0, 0, 0, 1, 1,
-2.361546, -0.8254641, -1.844475, 0, 0, 0, 1, 1,
-2.335168, -1.34413, -3.450256, 0, 0, 0, 1, 1,
-2.268033, 0.783365, -1.350187, 0, 0, 0, 1, 1,
-2.248316, 1.465506, -0.9937947, 1, 1, 1, 1, 1,
-2.172012, 0.6321684, -0.4829988, 1, 1, 1, 1, 1,
-2.169885, -2.995249, -2.250651, 1, 1, 1, 1, 1,
-2.140445, 0.208475, -0.7391101, 1, 1, 1, 1, 1,
-2.079705, -0.9788809, -2.244728, 1, 1, 1, 1, 1,
-2.072499, -1.297074, 0.291693, 1, 1, 1, 1, 1,
-2.028631, -1.656192, -2.262236, 1, 1, 1, 1, 1,
-2.023158, 0.3804408, 0.6010524, 1, 1, 1, 1, 1,
-2.019765, -0.3622563, -1.746548, 1, 1, 1, 1, 1,
-2.007742, 1.545096, -1.214851, 1, 1, 1, 1, 1,
-1.970875, -0.4047994, -3.095048, 1, 1, 1, 1, 1,
-1.965993, 0.2163729, -2.670394, 1, 1, 1, 1, 1,
-1.959404, -0.441322, -3.130891, 1, 1, 1, 1, 1,
-1.866747, 0.1638568, -1.012219, 1, 1, 1, 1, 1,
-1.843652, -0.1455489, -1.400947, 1, 1, 1, 1, 1,
-1.842518, 1.513013, -0.8485013, 0, 0, 1, 1, 1,
-1.837586, -1.360515, -1.881305, 1, 0, 0, 1, 1,
-1.811045, -1.022981, -2.041045, 1, 0, 0, 1, 1,
-1.789363, -2.81219, -2.917496, 1, 0, 0, 1, 1,
-1.757408, 0.7675044, -0.5657341, 1, 0, 0, 1, 1,
-1.738576, -1.336912, -2.015242, 1, 0, 0, 1, 1,
-1.720303, -0.860184, -0.9197684, 0, 0, 0, 1, 1,
-1.714378, 0.499777, 0.3502942, 0, 0, 0, 1, 1,
-1.685136, -0.6700442, -4.246174, 0, 0, 0, 1, 1,
-1.679842, -0.08092231, 0.2408274, 0, 0, 0, 1, 1,
-1.677698, -1.405101, -2.837579, 0, 0, 0, 1, 1,
-1.668344, -0.6011487, -2.405737, 0, 0, 0, 1, 1,
-1.661913, -0.2531279, -2.09495, 0, 0, 0, 1, 1,
-1.658424, 0.1544314, -2.364373, 1, 1, 1, 1, 1,
-1.649429, -0.4860635, -2.615674, 1, 1, 1, 1, 1,
-1.612151, -1.817123, -3.3361, 1, 1, 1, 1, 1,
-1.604526, -0.7429739, -4.027822, 1, 1, 1, 1, 1,
-1.60018, -0.2584617, -1.540871, 1, 1, 1, 1, 1,
-1.598885, 0.2999296, -0.4075772, 1, 1, 1, 1, 1,
-1.597645, -1.369388, -3.585922, 1, 1, 1, 1, 1,
-1.587212, -0.9869491, -2.085248, 1, 1, 1, 1, 1,
-1.586058, 0.06261156, -2.942821, 1, 1, 1, 1, 1,
-1.585042, 0.1962861, -2.488388, 1, 1, 1, 1, 1,
-1.577577, 0.7446046, -1.355053, 1, 1, 1, 1, 1,
-1.576461, 0.2780749, -2.751076, 1, 1, 1, 1, 1,
-1.574017, 0.02669637, -0.7740121, 1, 1, 1, 1, 1,
-1.56477, 1.042133, 0.128916, 1, 1, 1, 1, 1,
-1.531603, 1.217515, -1.394087, 1, 1, 1, 1, 1,
-1.515613, -1.371064, -1.059363, 0, 0, 1, 1, 1,
-1.514164, -1.042395, -2.449472, 1, 0, 0, 1, 1,
-1.508351, -2.163678, -3.319605, 1, 0, 0, 1, 1,
-1.506661, 0.2236979, -1.720411, 1, 0, 0, 1, 1,
-1.503234, -1.348785, -3.247, 1, 0, 0, 1, 1,
-1.502519, -0.4366032, -2.209769, 1, 0, 0, 1, 1,
-1.502332, 0.6998406, -0.8351948, 0, 0, 0, 1, 1,
-1.49299, 1.607934, -0.2361865, 0, 0, 0, 1, 1,
-1.488027, 0.3441841, -2.518626, 0, 0, 0, 1, 1,
-1.481293, -0.05611498, -3.289345, 0, 0, 0, 1, 1,
-1.477815, -0.618713, -2.572926, 0, 0, 0, 1, 1,
-1.467823, 0.963438, -2.11753, 0, 0, 0, 1, 1,
-1.432686, 1.101815, 0.6358033, 0, 0, 0, 1, 1,
-1.431195, -0.4031719, -1.233046, 1, 1, 1, 1, 1,
-1.4221, 0.0426431, 0.8160431, 1, 1, 1, 1, 1,
-1.416711, -0.2980398, -3.050598, 1, 1, 1, 1, 1,
-1.405815, -0.1092633, -2.658164, 1, 1, 1, 1, 1,
-1.404506, -0.495621, -2.41484, 1, 1, 1, 1, 1,
-1.400967, 0.5383675, -1.227748, 1, 1, 1, 1, 1,
-1.400587, 0.02996551, 0.3339939, 1, 1, 1, 1, 1,
-1.398164, 0.2383594, -1.508758, 1, 1, 1, 1, 1,
-1.387547, 0.2368437, -0.6383387, 1, 1, 1, 1, 1,
-1.384806, 0.2822104, 0.4166154, 1, 1, 1, 1, 1,
-1.38399, 0.6054292, -1.621233, 1, 1, 1, 1, 1,
-1.381884, -1.156621, -2.352598, 1, 1, 1, 1, 1,
-1.381231, 0.3081462, -1.477065, 1, 1, 1, 1, 1,
-1.373441, -0.06078201, -1.177146, 1, 1, 1, 1, 1,
-1.359892, 0.2508251, -0.7926638, 1, 1, 1, 1, 1,
-1.353696, -0.001418972, -0.05343208, 0, 0, 1, 1, 1,
-1.35158, 0.7345277, 0.3228531, 1, 0, 0, 1, 1,
-1.351265, -0.1326696, -0.8722557, 1, 0, 0, 1, 1,
-1.348706, 2.594321, -0.288291, 1, 0, 0, 1, 1,
-1.347546, -0.1844032, -0.8656785, 1, 0, 0, 1, 1,
-1.346129, 0.1660612, -0.6475549, 1, 0, 0, 1, 1,
-1.329378, 0.2831155, -0.8592793, 0, 0, 0, 1, 1,
-1.328487, 0.3608108, -1.772887, 0, 0, 0, 1, 1,
-1.322486, -1.615611, -2.965124, 0, 0, 0, 1, 1,
-1.321134, -0.663973, -3.478099, 0, 0, 0, 1, 1,
-1.319384, 0.6172069, -0.3203579, 0, 0, 0, 1, 1,
-1.307004, 1.092428, 0.8456653, 0, 0, 0, 1, 1,
-1.301724, -1.252525, -1.446277, 0, 0, 0, 1, 1,
-1.296065, 2.524475, -0.3449542, 1, 1, 1, 1, 1,
-1.273215, -1.747301, -2.387569, 1, 1, 1, 1, 1,
-1.271557, -1.659513, -3.568505, 1, 1, 1, 1, 1,
-1.26828, 0.5854004, -1.427088, 1, 1, 1, 1, 1,
-1.267187, -0.7443707, -1.205632, 1, 1, 1, 1, 1,
-1.250652, 0.1177471, -2.422192, 1, 1, 1, 1, 1,
-1.244621, -0.4413939, -1.783855, 1, 1, 1, 1, 1,
-1.244115, -0.7293954, -0.5253587, 1, 1, 1, 1, 1,
-1.233225, 0.0306592, -2.214556, 1, 1, 1, 1, 1,
-1.229184, -0.1188858, -1.245509, 1, 1, 1, 1, 1,
-1.228118, -0.07967889, 0.1398407, 1, 1, 1, 1, 1,
-1.225058, -0.2048237, -1.44671, 1, 1, 1, 1, 1,
-1.215113, 0.02387662, -3.507638, 1, 1, 1, 1, 1,
-1.214915, 0.2272893, -2.536472, 1, 1, 1, 1, 1,
-1.212143, 0.1398972, 0.04490418, 1, 1, 1, 1, 1,
-1.211388, -1.667512, -2.435672, 0, 0, 1, 1, 1,
-1.206837, -0.5758758, -2.105285, 1, 0, 0, 1, 1,
-1.202908, 0.1113158, -1.206901, 1, 0, 0, 1, 1,
-1.199913, -1.321197, 0.1363202, 1, 0, 0, 1, 1,
-1.193313, 1.068717, 0.02064964, 1, 0, 0, 1, 1,
-1.189366, -1.429017, -2.966218, 1, 0, 0, 1, 1,
-1.188991, 1.037435, -1.181907, 0, 0, 0, 1, 1,
-1.188971, 0.2018064, -3.000963, 0, 0, 0, 1, 1,
-1.188331, 0.8968821, -0.7958121, 0, 0, 0, 1, 1,
-1.182231, -0.5368517, -2.554835, 0, 0, 0, 1, 1,
-1.175893, -0.9506026, -2.473848, 0, 0, 0, 1, 1,
-1.155097, 0.9385597, 0.176249, 0, 0, 0, 1, 1,
-1.14669, -0.7244805, -3.958968, 0, 0, 0, 1, 1,
-1.140575, -1.542327, -1.363901, 1, 1, 1, 1, 1,
-1.133461, -0.2577679, -1.786252, 1, 1, 1, 1, 1,
-1.129406, -0.4887172, -2.223895, 1, 1, 1, 1, 1,
-1.119843, 1.02938, -1.5624, 1, 1, 1, 1, 1,
-1.112453, -0.1278513, -0.2006603, 1, 1, 1, 1, 1,
-1.111395, -1.281963, -1.386983, 1, 1, 1, 1, 1,
-1.105704, 0.9007291, -0.6108618, 1, 1, 1, 1, 1,
-1.102665, 2.373038, -1.880344, 1, 1, 1, 1, 1,
-1.10145, -2.338947, -2.368015, 1, 1, 1, 1, 1,
-1.098033, 1.786647, 0.05463267, 1, 1, 1, 1, 1,
-1.092013, -0.6657273, -2.292045, 1, 1, 1, 1, 1,
-1.091911, 1.673626, -1.749162, 1, 1, 1, 1, 1,
-1.088742, -0.6346003, -2.307433, 1, 1, 1, 1, 1,
-1.088556, 1.779472, -0.8271601, 1, 1, 1, 1, 1,
-1.081688, 0.1578911, -2.013494, 1, 1, 1, 1, 1,
-1.081114, 1.627396, -0.02227987, 0, 0, 1, 1, 1,
-1.069819, 0.3532313, 0.5279415, 1, 0, 0, 1, 1,
-1.067142, 0.06408855, -0.8586619, 1, 0, 0, 1, 1,
-1.063092, 0.7052782, -0.5845002, 1, 0, 0, 1, 1,
-1.061139, 0.7165094, -0.5059032, 1, 0, 0, 1, 1,
-1.059238, -0.851148, -1.953774, 1, 0, 0, 1, 1,
-1.055086, 0.8653099, -0.9242699, 0, 0, 0, 1, 1,
-1.044266, -1.092613, -0.8661657, 0, 0, 0, 1, 1,
-1.043293, 0.7761583, -2.32259, 0, 0, 0, 1, 1,
-1.041324, -1.798828, -2.081959, 0, 0, 0, 1, 1,
-1.038583, -2.681023, -3.226116, 0, 0, 0, 1, 1,
-1.036626, -1.273708, -1.642313, 0, 0, 0, 1, 1,
-1.028988, -0.7528551, -1.921011, 0, 0, 0, 1, 1,
-1.026788, -1.820207, -1.419267, 1, 1, 1, 1, 1,
-1.025048, 2.554166, -2.299499, 1, 1, 1, 1, 1,
-1.020093, -0.8469966, -0.774587, 1, 1, 1, 1, 1,
-1.015796, -0.4241861, -2.417041, 1, 1, 1, 1, 1,
-1.014602, -0.5969, -1.29495, 1, 1, 1, 1, 1,
-1.008339, -0.9605206, -1.846346, 1, 1, 1, 1, 1,
-0.9987515, 0.4446903, -2.017593, 1, 1, 1, 1, 1,
-0.9802591, 1.872258, -0.05504067, 1, 1, 1, 1, 1,
-0.9797024, 1.348173, -1.69516, 1, 1, 1, 1, 1,
-0.9705545, 2.33214, 1.459428, 1, 1, 1, 1, 1,
-0.969666, -0.9540775, -2.832654, 1, 1, 1, 1, 1,
-0.9619098, -1.577966, -3.148381, 1, 1, 1, 1, 1,
-0.958833, 0.719842, -0.5247619, 1, 1, 1, 1, 1,
-0.9545443, -1.293205, -1.214186, 1, 1, 1, 1, 1,
-0.9528696, 2.180692, 0.6353212, 1, 1, 1, 1, 1,
-0.952547, 0.2403057, -0.9368351, 0, 0, 1, 1, 1,
-0.9481391, 1.305359, -0.129701, 1, 0, 0, 1, 1,
-0.9465175, -0.2198267, -1.737871, 1, 0, 0, 1, 1,
-0.9427758, -1.285848, -2.51916, 1, 0, 0, 1, 1,
-0.9422915, 0.2459338, -2.107983, 1, 0, 0, 1, 1,
-0.9404129, 0.8464984, -2.768858, 1, 0, 0, 1, 1,
-0.9403772, 0.31871, -1.687086, 0, 0, 0, 1, 1,
-0.9378687, -0.5352662, -2.862952, 0, 0, 0, 1, 1,
-0.9326893, -2.493152, -2.206806, 0, 0, 0, 1, 1,
-0.9296585, 0.2730441, -2.823259, 0, 0, 0, 1, 1,
-0.9243943, 0.6900104, 0.4878887, 0, 0, 0, 1, 1,
-0.9236513, -1.435768, -1.323358, 0, 0, 0, 1, 1,
-0.9229257, 0.5631766, -1.861985, 0, 0, 0, 1, 1,
-0.9197608, -0.1510826, -2.005321, 1, 1, 1, 1, 1,
-0.9173926, 0.7116789, 0.2259326, 1, 1, 1, 1, 1,
-0.9147416, 0.9213927, -1.133558, 1, 1, 1, 1, 1,
-0.9139995, -0.3894023, -2.357186, 1, 1, 1, 1, 1,
-0.9131029, 1.543331, -2.094651, 1, 1, 1, 1, 1,
-0.9113116, 1.442809, -0.06519777, 1, 1, 1, 1, 1,
-0.910017, -0.4844899, -2.955227, 1, 1, 1, 1, 1,
-0.9040609, 0.7745439, -0.6210502, 1, 1, 1, 1, 1,
-0.9034505, 0.8658436, -0.4419095, 1, 1, 1, 1, 1,
-0.899111, -0.7682621, -2.221501, 1, 1, 1, 1, 1,
-0.8926446, 0.9964634, -0.2678976, 1, 1, 1, 1, 1,
-0.8911708, 1.594787, -0.1980916, 1, 1, 1, 1, 1,
-0.8884648, -0.5546064, -1.314993, 1, 1, 1, 1, 1,
-0.8879062, -0.3663168, -1.541879, 1, 1, 1, 1, 1,
-0.8832361, -0.7868965, -2.970056, 1, 1, 1, 1, 1,
-0.8748766, -0.9217967, -2.877088, 0, 0, 1, 1, 1,
-0.8636267, 0.4803737, -1.892443, 1, 0, 0, 1, 1,
-0.8631025, -1.460304, -1.845359, 1, 0, 0, 1, 1,
-0.8616749, 0.6518956, 1.146491, 1, 0, 0, 1, 1,
-0.8598469, 0.1696337, -1.408303, 1, 0, 0, 1, 1,
-0.8583572, 1.207968, -1.753928, 1, 0, 0, 1, 1,
-0.8582993, 0.4342623, -1.549537, 0, 0, 0, 1, 1,
-0.8548549, 0.2587459, -0.678524, 0, 0, 0, 1, 1,
-0.8536178, 0.6146772, -0.9383774, 0, 0, 0, 1, 1,
-0.8531012, -0.5918178, 0.5622652, 0, 0, 0, 1, 1,
-0.8529034, 0.1509621, -1.390005, 0, 0, 0, 1, 1,
-0.8517718, -0.4098206, -1.254988, 0, 0, 0, 1, 1,
-0.8502453, 0.9873808, 0.4039475, 0, 0, 0, 1, 1,
-0.8366649, -0.8256309, -2.187249, 1, 1, 1, 1, 1,
-0.8353554, 2.490436, -0.8395588, 1, 1, 1, 1, 1,
-0.8324838, -0.5091609, -0.6233366, 1, 1, 1, 1, 1,
-0.8271051, 1.827587, 0.01750649, 1, 1, 1, 1, 1,
-0.8173781, 0.5772665, -0.9421258, 1, 1, 1, 1, 1,
-0.8163349, -0.1193188, -3.628657, 1, 1, 1, 1, 1,
-0.8005797, 0.3833596, -1.448215, 1, 1, 1, 1, 1,
-0.7981214, -0.7787226, -0.5065107, 1, 1, 1, 1, 1,
-0.7965418, -1.585098, -3.047414, 1, 1, 1, 1, 1,
-0.7932046, 0.6314627, -0.609848, 1, 1, 1, 1, 1,
-0.7815487, 1.379706, -0.2521379, 1, 1, 1, 1, 1,
-0.7678845, -0.1978467, -2.515357, 1, 1, 1, 1, 1,
-0.7672395, 1.762905, 0.6626816, 1, 1, 1, 1, 1,
-0.7587457, -0.05228578, -2.011191, 1, 1, 1, 1, 1,
-0.7579106, 0.331751, -0.3784312, 1, 1, 1, 1, 1,
-0.7575836, -1.395742, -2.461058, 0, 0, 1, 1, 1,
-0.7503204, 0.8048679, -1.124376, 1, 0, 0, 1, 1,
-0.74657, -0.3996193, -3.34294, 1, 0, 0, 1, 1,
-0.7455279, 0.7810145, -0.9658049, 1, 0, 0, 1, 1,
-0.7445219, -1.59405, -2.052039, 1, 0, 0, 1, 1,
-0.7385803, -0.5382721, -2.792971, 1, 0, 0, 1, 1,
-0.7375458, 0.6881213, -0.2609133, 0, 0, 0, 1, 1,
-0.7323226, 2.160465, 0.0806946, 0, 0, 0, 1, 1,
-0.7312022, -0.5115774, -2.72499, 0, 0, 0, 1, 1,
-0.7308489, -1.211265, -2.171277, 0, 0, 0, 1, 1,
-0.725795, 1.150127, 0.6147164, 0, 0, 0, 1, 1,
-0.7254851, -2.307138, -1.717414, 0, 0, 0, 1, 1,
-0.7232154, 0.5781394, 0.04192227, 0, 0, 0, 1, 1,
-0.7218754, -0.2933734, -1.792245, 1, 1, 1, 1, 1,
-0.7174861, -0.8627163, -1.948589, 1, 1, 1, 1, 1,
-0.7143655, -0.8237784, -1.799831, 1, 1, 1, 1, 1,
-0.7125612, 1.34621, -1.447757, 1, 1, 1, 1, 1,
-0.7080146, 0.2158476, -2.091226, 1, 1, 1, 1, 1,
-0.7018299, 1.044443, -1.633111, 1, 1, 1, 1, 1,
-0.7004414, 1.43942, -0.2381229, 1, 1, 1, 1, 1,
-0.6951717, 0.4894137, -0.1901919, 1, 1, 1, 1, 1,
-0.6935546, -0.1331122, -2.883185, 1, 1, 1, 1, 1,
-0.6897479, 1.016988, -0.3151043, 1, 1, 1, 1, 1,
-0.6860943, -1.834172, -1.641408, 1, 1, 1, 1, 1,
-0.6830922, -1.496116, -3.79991, 1, 1, 1, 1, 1,
-0.6754165, -0.2551569, -1.790999, 1, 1, 1, 1, 1,
-0.6750829, 0.8675197, -1.139748, 1, 1, 1, 1, 1,
-0.6750415, -1.145073, -2.924845, 1, 1, 1, 1, 1,
-0.6738358, -0.5433909, -3.798266, 0, 0, 1, 1, 1,
-0.6726651, 0.05572545, -3.207971, 1, 0, 0, 1, 1,
-0.6715117, -0.8751848, -3.635776, 1, 0, 0, 1, 1,
-0.6705274, 1.848267, -1.070701, 1, 0, 0, 1, 1,
-0.6701262, -1.474107, -3.773854, 1, 0, 0, 1, 1,
-0.665772, -1.447544, -2.12149, 1, 0, 0, 1, 1,
-0.6657066, 0.004071097, 0.3112519, 0, 0, 0, 1, 1,
-0.6648042, 1.031192, -1.415273, 0, 0, 0, 1, 1,
-0.6627181, -1.431111, -3.16265, 0, 0, 0, 1, 1,
-0.6573598, 0.7242949, -0.7119028, 0, 0, 0, 1, 1,
-0.655818, 0.02605759, -2.107214, 0, 0, 0, 1, 1,
-0.6556908, 0.7842687, -1.63181, 0, 0, 0, 1, 1,
-0.6520824, 2.232125, 0.2060637, 0, 0, 0, 1, 1,
-0.6493635, 0.3615923, -0.9412547, 1, 1, 1, 1, 1,
-0.6447585, -0.2541406, -2.144025, 1, 1, 1, 1, 1,
-0.6409816, 0.7627872, 0.5668206, 1, 1, 1, 1, 1,
-0.6386058, 0.2850199, -1.436842, 1, 1, 1, 1, 1,
-0.638209, -1.977398, -1.512874, 1, 1, 1, 1, 1,
-0.6359005, 0.7415665, -0.8095031, 1, 1, 1, 1, 1,
-0.6321259, -0.2950212, -0.8832546, 1, 1, 1, 1, 1,
-0.6300268, -1.520497, -4.731252, 1, 1, 1, 1, 1,
-0.6299424, 1.421984, -0.8608345, 1, 1, 1, 1, 1,
-0.62907, 0.9237313, 1.078396, 1, 1, 1, 1, 1,
-0.6281552, 1.042559, 0.5471834, 1, 1, 1, 1, 1,
-0.6280221, -0.6129352, -3.596849, 1, 1, 1, 1, 1,
-0.6220546, 0.05918273, -3.850016, 1, 1, 1, 1, 1,
-0.6216214, -2.066028, -2.742608, 1, 1, 1, 1, 1,
-0.6090397, 0.07137883, -0.5607092, 1, 1, 1, 1, 1,
-0.6084734, 1.078139, -1.013829, 0, 0, 1, 1, 1,
-0.6084409, -1.092644, -3.351774, 1, 0, 0, 1, 1,
-0.6072651, -2.229889, -2.704148, 1, 0, 0, 1, 1,
-0.606762, 0.259713, -2.107009, 1, 0, 0, 1, 1,
-0.6063903, 0.7413151, -1.596418, 1, 0, 0, 1, 1,
-0.5992416, 0.1136158, -1.619672, 1, 0, 0, 1, 1,
-0.5960528, 0.3608233, 0.009504048, 0, 0, 0, 1, 1,
-0.5937417, -1.006004, -1.37796, 0, 0, 0, 1, 1,
-0.5937053, -1.038886, -2.281206, 0, 0, 0, 1, 1,
-0.5904949, -0.02834913, -1.00501, 0, 0, 0, 1, 1,
-0.5898264, -0.03598781, -2.902753, 0, 0, 0, 1, 1,
-0.5884972, 1.086892, -2.265384, 0, 0, 0, 1, 1,
-0.5864395, 1.895104, 0.1692111, 0, 0, 0, 1, 1,
-0.5839759, -0.8272426, -3.851371, 1, 1, 1, 1, 1,
-0.5838882, -0.15291, -2.060934, 1, 1, 1, 1, 1,
-0.5833536, 0.2102293, 1.478472, 1, 1, 1, 1, 1,
-0.5814595, -1.364835, -2.601498, 1, 1, 1, 1, 1,
-0.5791578, 0.430637, -0.6320507, 1, 1, 1, 1, 1,
-0.5781191, 0.8078634, -1.53524, 1, 1, 1, 1, 1,
-0.5724962, 1.234064, 0.4855266, 1, 1, 1, 1, 1,
-0.5723482, -0.2598144, -1.813341, 1, 1, 1, 1, 1,
-0.5697768, -1.657268, -3.23464, 1, 1, 1, 1, 1,
-0.5696073, -1.707013, -4.200504, 1, 1, 1, 1, 1,
-0.5670817, 0.9882567, -0.07065517, 1, 1, 1, 1, 1,
-0.5609174, 1.078918, 0.2841074, 1, 1, 1, 1, 1,
-0.5608597, 0.175574, -1.120834, 1, 1, 1, 1, 1,
-0.5502926, 0.534663, 0.2100982, 1, 1, 1, 1, 1,
-0.5467917, 2.38057, 0.4351263, 1, 1, 1, 1, 1,
-0.5375673, 0.9374043, -1.120348, 0, 0, 1, 1, 1,
-0.5301446, 1.36367, -0.6796573, 1, 0, 0, 1, 1,
-0.5236229, 0.3058467, -0.497939, 1, 0, 0, 1, 1,
-0.5205185, 0.3867355, 1.280148, 1, 0, 0, 1, 1,
-0.5204279, 1.416976, 0.4491836, 1, 0, 0, 1, 1,
-0.5149639, -0.5693698, -2.120512, 1, 0, 0, 1, 1,
-0.5110663, 1.20412, -1.177178, 0, 0, 0, 1, 1,
-0.5053628, -0.4107786, -3.181847, 0, 0, 0, 1, 1,
-0.4988733, -1.19591, -1.037574, 0, 0, 0, 1, 1,
-0.4959561, 0.2869906, -0.5652558, 0, 0, 0, 1, 1,
-0.495626, -1.160405, -4.332362, 0, 0, 0, 1, 1,
-0.4873601, 1.93565, -0.7579431, 0, 0, 0, 1, 1,
-0.4849631, -1.246032, -3.279508, 0, 0, 0, 1, 1,
-0.4791941, 1.390519, 0.5758603, 1, 1, 1, 1, 1,
-0.4790558, 0.1637407, -1.482881, 1, 1, 1, 1, 1,
-0.4743392, 1.12396, -0.1078893, 1, 1, 1, 1, 1,
-0.474153, -2.426502, -4.547196, 1, 1, 1, 1, 1,
-0.4722502, 1.184655, -0.2616189, 1, 1, 1, 1, 1,
-0.4690205, -0.6352552, -1.271736, 1, 1, 1, 1, 1,
-0.4687085, -2.255616, -2.680583, 1, 1, 1, 1, 1,
-0.4680227, 0.7993182, 0.7767142, 1, 1, 1, 1, 1,
-0.4679206, -0.2227293, -2.644393, 1, 1, 1, 1, 1,
-0.4638777, 0.6975343, 0.5096996, 1, 1, 1, 1, 1,
-0.46131, -2.104755, -1.786635, 1, 1, 1, 1, 1,
-0.4582084, 0.8888816, 0.1966553, 1, 1, 1, 1, 1,
-0.454009, 0.9221724, -0.3755265, 1, 1, 1, 1, 1,
-0.4520912, 1.08139, 0.5155335, 1, 1, 1, 1, 1,
-0.4480969, 0.5302403, -0.8480023, 1, 1, 1, 1, 1,
-0.4438567, -0.1582086, -4.689889, 0, 0, 1, 1, 1,
-0.4409745, 0.07651516, -0.9184161, 1, 0, 0, 1, 1,
-0.4335771, -0.09234177, -1.878004, 1, 0, 0, 1, 1,
-0.4309826, 0.5567127, -0.06892293, 1, 0, 0, 1, 1,
-0.4298988, 0.7369001, -0.6970709, 1, 0, 0, 1, 1,
-0.4240863, -1.046245, -3.42439, 1, 0, 0, 1, 1,
-0.4240014, 0.2501805, -3.362027, 0, 0, 0, 1, 1,
-0.4180253, 0.6028992, -0.326597, 0, 0, 0, 1, 1,
-0.4061274, 1.166501, -0.3858181, 0, 0, 0, 1, 1,
-0.4043787, 1.202962, 0.6093742, 0, 0, 0, 1, 1,
-0.3991243, 1.393208, -1.740737, 0, 0, 0, 1, 1,
-0.3988268, 0.6648945, 0.2973448, 0, 0, 0, 1, 1,
-0.3985744, -1.4301, -2.992552, 0, 0, 0, 1, 1,
-0.396586, -2.307256, -2.674132, 1, 1, 1, 1, 1,
-0.3952947, 0.5254244, -0.6084965, 1, 1, 1, 1, 1,
-0.392137, -1.230189, -2.459412, 1, 1, 1, 1, 1,
-0.3911518, 0.4909585, -0.1232852, 1, 1, 1, 1, 1,
-0.3895354, 0.7085556, 1.250888, 1, 1, 1, 1, 1,
-0.3892583, 0.5254006, -1.301719, 1, 1, 1, 1, 1,
-0.3880311, -0.9851818, -1.976871, 1, 1, 1, 1, 1,
-0.3845427, 0.7023037, 0.9328366, 1, 1, 1, 1, 1,
-0.3819977, 1.320398, -1.201393, 1, 1, 1, 1, 1,
-0.3801668, 0.4385223, -0.5116531, 1, 1, 1, 1, 1,
-0.3789598, 0.5816821, -1.248598, 1, 1, 1, 1, 1,
-0.3767969, 0.7936461, 0.0166599, 1, 1, 1, 1, 1,
-0.3714679, 0.9182862, 0.3672144, 1, 1, 1, 1, 1,
-0.3704617, -1.809215, -3.579691, 1, 1, 1, 1, 1,
-0.3649768, -1.219815, -1.827678, 1, 1, 1, 1, 1,
-0.3636156, -0.8248041, -2.981704, 0, 0, 1, 1, 1,
-0.3583285, 0.2799993, 0.5302978, 1, 0, 0, 1, 1,
-0.3573581, -0.1928039, -1.934918, 1, 0, 0, 1, 1,
-0.3504838, -1.450145, -4.801489, 1, 0, 0, 1, 1,
-0.3480556, 0.03131093, -0.5636127, 1, 0, 0, 1, 1,
-0.3455266, 1.594629, 1.446743, 1, 0, 0, 1, 1,
-0.3453915, -0.8608996, -2.758322, 0, 0, 0, 1, 1,
-0.3448642, -0.8594444, -3.285146, 0, 0, 0, 1, 1,
-0.3436192, -0.7368497, -2.529099, 0, 0, 0, 1, 1,
-0.3424927, 1.488801, -0.2677344, 0, 0, 0, 1, 1,
-0.3368255, -0.8452025, -3.697503, 0, 0, 0, 1, 1,
-0.333898, -1.056246, -5.829509, 0, 0, 0, 1, 1,
-0.3250513, -0.6055393, -2.545979, 0, 0, 0, 1, 1,
-0.3212718, 1.086484, -1.870867, 1, 1, 1, 1, 1,
-0.3194142, -0.854152, -2.442317, 1, 1, 1, 1, 1,
-0.3177347, 0.2150022, 0.2230217, 1, 1, 1, 1, 1,
-0.317076, 1.191528, 2.461524, 1, 1, 1, 1, 1,
-0.3106906, -0.4330264, -3.749177, 1, 1, 1, 1, 1,
-0.3095884, -0.8066422, -2.443594, 1, 1, 1, 1, 1,
-0.306526, -1.329918, -3.922773, 1, 1, 1, 1, 1,
-0.3063863, 0.3951746, 0.5599591, 1, 1, 1, 1, 1,
-0.3005104, -0.2352474, -1.574635, 1, 1, 1, 1, 1,
-0.2944876, -0.9660244, -3.26175, 1, 1, 1, 1, 1,
-0.2930177, -0.5078164, -2.043988, 1, 1, 1, 1, 1,
-0.2919088, 0.8025451, -0.1481692, 1, 1, 1, 1, 1,
-0.291247, 0.9677344, -1.727541, 1, 1, 1, 1, 1,
-0.2869582, 0.477363, -0.2433295, 1, 1, 1, 1, 1,
-0.2861646, 2.317134, 1.347368, 1, 1, 1, 1, 1,
-0.2815028, 0.07793512, -2.678051, 0, 0, 1, 1, 1,
-0.2795417, -0.7078325, -0.9090979, 1, 0, 0, 1, 1,
-0.2778933, -0.6144099, -3.894507, 1, 0, 0, 1, 1,
-0.2737171, -0.1260981, -1.951007, 1, 0, 0, 1, 1,
-0.2707576, -0.7287545, -3.153006, 1, 0, 0, 1, 1,
-0.2701926, -0.6345603, -1.334042, 1, 0, 0, 1, 1,
-0.2663937, -0.6046987, -2.023777, 0, 0, 0, 1, 1,
-0.2593682, 2.095078, 0.112661, 0, 0, 0, 1, 1,
-0.2571267, -0.3627862, -2.931119, 0, 0, 0, 1, 1,
-0.2506123, 0.0422266, -1.664418, 0, 0, 0, 1, 1,
-0.2497861, 0.9707047, 0.4035784, 0, 0, 0, 1, 1,
-0.248888, -0.315667, -3.710553, 0, 0, 0, 1, 1,
-0.2417844, 0.4256172, -1.425897, 0, 0, 0, 1, 1,
-0.2400966, -0.5269588, -1.459974, 1, 1, 1, 1, 1,
-0.2361052, -1.409916, -2.476329, 1, 1, 1, 1, 1,
-0.2360252, -1.622995, -2.069932, 1, 1, 1, 1, 1,
-0.2322213, 0.9304094, -1.174299, 1, 1, 1, 1, 1,
-0.2270405, -2.036907, -3.145312, 1, 1, 1, 1, 1,
-0.2261338, -0.2235402, -2.476751, 1, 1, 1, 1, 1,
-0.2236934, -1.036446, -2.585601, 1, 1, 1, 1, 1,
-0.2228806, 0.2704965, -2.255977, 1, 1, 1, 1, 1,
-0.2176248, 1.31007, 0.8820378, 1, 1, 1, 1, 1,
-0.2138717, 0.8224881, -1.221786, 1, 1, 1, 1, 1,
-0.2123899, 0.347828, 0.07438985, 1, 1, 1, 1, 1,
-0.2092615, 0.1541172, -0.6363472, 1, 1, 1, 1, 1,
-0.2018607, 0.1727068, -0.4343435, 1, 1, 1, 1, 1,
-0.198692, 1.377479, 0.7320952, 1, 1, 1, 1, 1,
-0.1979414, -1.176063, -3.294256, 1, 1, 1, 1, 1,
-0.1958494, 0.7840632, 0.995715, 0, 0, 1, 1, 1,
-0.1929963, -1.516925, -1.615151, 1, 0, 0, 1, 1,
-0.1910231, 1.726261, -0.4979842, 1, 0, 0, 1, 1,
-0.1902914, 0.9599381, 0.4832231, 1, 0, 0, 1, 1,
-0.1886656, 0.3934065, 1.685714, 1, 0, 0, 1, 1,
-0.1820655, 1.077774, -1.101987, 1, 0, 0, 1, 1,
-0.1819621, -1.545225, -4.343855, 0, 0, 0, 1, 1,
-0.1793577, 0.2928777, -0.2938792, 0, 0, 0, 1, 1,
-0.1778292, -1.300206, -2.887048, 0, 0, 0, 1, 1,
-0.1776552, -0.6616451, -4.382722, 0, 0, 0, 1, 1,
-0.1697505, -0.94471, -3.295885, 0, 0, 0, 1, 1,
-0.1581047, 1.745009, 1.429498, 0, 0, 0, 1, 1,
-0.1525014, -0.8565452, -2.99263, 0, 0, 0, 1, 1,
-0.1520213, -0.2891837, -2.593314, 1, 1, 1, 1, 1,
-0.1503075, -1.590014, -1.132357, 1, 1, 1, 1, 1,
-0.1496308, -0.1022724, -3.159582, 1, 1, 1, 1, 1,
-0.1424472, 0.1972944, -1.803515, 1, 1, 1, 1, 1,
-0.141854, -0.7918614, -2.006429, 1, 1, 1, 1, 1,
-0.1397711, -0.1264587, -1.566843, 1, 1, 1, 1, 1,
-0.1330423, -0.07052518, -2.49335, 1, 1, 1, 1, 1,
-0.1232093, 0.7132671, -0.02396094, 1, 1, 1, 1, 1,
-0.1159632, 0.4080179, -1.624175, 1, 1, 1, 1, 1,
-0.1157672, 0.2065219, -1.016147, 1, 1, 1, 1, 1,
-0.1147977, 0.3293809, -0.3144307, 1, 1, 1, 1, 1,
-0.1145685, -0.1383502, -3.023791, 1, 1, 1, 1, 1,
-0.1144008, 0.1801335, 0.1548576, 1, 1, 1, 1, 1,
-0.112874, 0.3868691, -1.23278, 1, 1, 1, 1, 1,
-0.104824, 0.1104823, -1.504823, 1, 1, 1, 1, 1,
-0.09272514, 0.7082607, 0.9816197, 0, 0, 1, 1, 1,
-0.09110919, -0.07853504, -1.660597, 1, 0, 0, 1, 1,
-0.0872129, -0.3074462, -2.32442, 1, 0, 0, 1, 1,
-0.08259258, 0.768576, 1.109468, 1, 0, 0, 1, 1,
-0.07904772, -0.264336, -3.797597, 1, 0, 0, 1, 1,
-0.07618196, 0.4969208, 0.7568472, 1, 0, 0, 1, 1,
-0.07357619, 0.4899981, -1.327274, 0, 0, 0, 1, 1,
-0.06360999, 1.251835, 0.8951559, 0, 0, 0, 1, 1,
-0.06142246, -0.4432942, -3.621182, 0, 0, 0, 1, 1,
-0.05755664, 1.304251, 0.9174218, 0, 0, 0, 1, 1,
-0.05650188, 1.220682, 1.594583, 0, 0, 0, 1, 1,
-0.05403725, 0.2026732, -0.6661325, 0, 0, 0, 1, 1,
-0.05122953, 0.2444808, -0.1740844, 0, 0, 0, 1, 1,
-0.05076193, -0.08079844, -3.646518, 1, 1, 1, 1, 1,
-0.04889416, -0.4702382, -3.504507, 1, 1, 1, 1, 1,
-0.04887123, -0.706136, -3.060101, 1, 1, 1, 1, 1,
-0.04769935, -1.316753, -0.657098, 1, 1, 1, 1, 1,
-0.03928329, -0.09467011, -3.050802, 1, 1, 1, 1, 1,
-0.03559404, -1.246447, -2.092942, 1, 1, 1, 1, 1,
-0.03169183, -0.7922167, -2.361272, 1, 1, 1, 1, 1,
-0.0268886, -0.4519337, -3.13859, 1, 1, 1, 1, 1,
-0.02338163, 1.488968, 2.311955, 1, 1, 1, 1, 1,
-0.02224561, 0.04309209, -1.011778, 1, 1, 1, 1, 1,
-0.02137853, 0.04950482, 0.379205, 1, 1, 1, 1, 1,
-0.02113829, 1.987528, 1.183872, 1, 1, 1, 1, 1,
-0.01854082, 0.8256698, 0.5823781, 1, 1, 1, 1, 1,
-0.01694148, -0.9586014, -4.93023, 1, 1, 1, 1, 1,
-0.01693789, 0.6632333, -1.130698, 1, 1, 1, 1, 1,
-0.01653823, 1.176201, -1.271299, 0, 0, 1, 1, 1,
-0.01403756, -0.1380246, -4.732457, 1, 0, 0, 1, 1,
-0.009764097, -0.1753911, -2.570609, 1, 0, 0, 1, 1,
-0.007558795, -0.436891, -1.784832, 1, 0, 0, 1, 1,
0.0003013581, 0.7143641, -0.2459892, 1, 0, 0, 1, 1,
0.00301394, 0.5438023, -0.6736627, 1, 0, 0, 1, 1,
0.004316861, -0.01773182, 1.279514, 0, 0, 0, 1, 1,
0.004571773, 1.865322, 0.04499253, 0, 0, 0, 1, 1,
0.008176472, 0.2627695, -2.069889, 0, 0, 0, 1, 1,
0.009055041, 0.3462433, -0.6972747, 0, 0, 0, 1, 1,
0.009490711, -1.713811, 1.713188, 0, 0, 0, 1, 1,
0.0104642, 0.8572162, 0.04806631, 0, 0, 0, 1, 1,
0.01164368, 0.387959, -0.4939134, 0, 0, 0, 1, 1,
0.01790488, -0.2090846, 3.441536, 1, 1, 1, 1, 1,
0.02012752, 0.9695625, 0.8305977, 1, 1, 1, 1, 1,
0.02235315, 0.9368986, -1.23914, 1, 1, 1, 1, 1,
0.02309569, -0.2621548, 3.923007, 1, 1, 1, 1, 1,
0.02557038, -0.03794962, 4.340316, 1, 1, 1, 1, 1,
0.02822554, 0.0335166, 0.08096324, 1, 1, 1, 1, 1,
0.0296288, 0.1527861, -1.111222, 1, 1, 1, 1, 1,
0.03108419, -0.317842, 2.130832, 1, 1, 1, 1, 1,
0.03330756, 1.178894, 1.423336, 1, 1, 1, 1, 1,
0.03404757, -1.050702, 3.51087, 1, 1, 1, 1, 1,
0.03440501, 1.485687, -3.113535, 1, 1, 1, 1, 1,
0.03502586, -0.7935538, 2.941402, 1, 1, 1, 1, 1,
0.03957028, -1.621647, 3.148374, 1, 1, 1, 1, 1,
0.04003309, 0.2696558, 0.04005298, 1, 1, 1, 1, 1,
0.04148577, 1.225607, 1.094436, 1, 1, 1, 1, 1,
0.04470023, -2.837926, 3.081328, 0, 0, 1, 1, 1,
0.04748505, -2.544219, 3.682361, 1, 0, 0, 1, 1,
0.05115812, 0.8998736, 0.561453, 1, 0, 0, 1, 1,
0.05530637, 0.3617567, 0.05012446, 1, 0, 0, 1, 1,
0.05895161, -0.6411952, 2.542124, 1, 0, 0, 1, 1,
0.05982345, -1.57443, 1.767312, 1, 0, 0, 1, 1,
0.0610728, -0.2379712, 2.48728, 0, 0, 0, 1, 1,
0.06554534, -0.09080069, 3.890628, 0, 0, 0, 1, 1,
0.07313471, 1.275602, -0.4064403, 0, 0, 0, 1, 1,
0.0765837, 0.7552963, 0.3417747, 0, 0, 0, 1, 1,
0.08007969, -0.2279418, 2.264141, 0, 0, 0, 1, 1,
0.08046523, 0.1667705, 0.3639275, 0, 0, 0, 1, 1,
0.08164253, 0.4727553, -0.4194271, 0, 0, 0, 1, 1,
0.08611358, -0.06161689, 1.697519, 1, 1, 1, 1, 1,
0.08849752, 0.5987421, 0.4006532, 1, 1, 1, 1, 1,
0.08890596, 0.6130636, -0.9554264, 1, 1, 1, 1, 1,
0.08899762, -1.124268, 3.226391, 1, 1, 1, 1, 1,
0.08944399, 0.01739806, 0.3932525, 1, 1, 1, 1, 1,
0.09223936, -1.025167, 3.141958, 1, 1, 1, 1, 1,
0.09434862, 0.7546673, 0.6337033, 1, 1, 1, 1, 1,
0.09450584, 0.5087472, 0.5859752, 1, 1, 1, 1, 1,
0.09601074, 1.079511, -0.5724654, 1, 1, 1, 1, 1,
0.1081518, 0.3995734, 0.762751, 1, 1, 1, 1, 1,
0.1097993, -0.5436611, 3.07302, 1, 1, 1, 1, 1,
0.1114091, -0.1807153, 1.707289, 1, 1, 1, 1, 1,
0.1134443, 0.02254275, 3.094052, 1, 1, 1, 1, 1,
0.1135687, -0.6053109, 1.153608, 1, 1, 1, 1, 1,
0.1165696, 1.173549, -1.049063, 1, 1, 1, 1, 1,
0.1172911, 0.3186711, -1.26797, 0, 0, 1, 1, 1,
0.118224, 0.5577316, 0.3514677, 1, 0, 0, 1, 1,
0.1201815, -2.252628, 3.317621, 1, 0, 0, 1, 1,
0.1209752, 0.6120339, -0.6662125, 1, 0, 0, 1, 1,
0.1229799, 0.05059755, 1.485775, 1, 0, 0, 1, 1,
0.1254989, -1.311497, 2.148987, 1, 0, 0, 1, 1,
0.1297228, -0.4828863, 2.399823, 0, 0, 0, 1, 1,
0.1312831, 0.2036168, 0.4495688, 0, 0, 0, 1, 1,
0.1318569, -0.9311585, 3.175239, 0, 0, 0, 1, 1,
0.1334979, 1.140486, -0.7428285, 0, 0, 0, 1, 1,
0.1386477, -0.3093709, 2.993929, 0, 0, 0, 1, 1,
0.1394395, -0.2961199, 2.135553, 0, 0, 0, 1, 1,
0.1399106, 0.289093, 2.308039, 0, 0, 0, 1, 1,
0.1417827, -0.3673311, 3.515484, 1, 1, 1, 1, 1,
0.1418562, -1.09512, 3.259673, 1, 1, 1, 1, 1,
0.1505617, -0.4123261, 3.798078, 1, 1, 1, 1, 1,
0.1536144, 2.040287, -1.914801, 1, 1, 1, 1, 1,
0.1605812, -0.3046588, 3.262599, 1, 1, 1, 1, 1,
0.1612331, -0.01341811, 2.750306, 1, 1, 1, 1, 1,
0.163496, -0.6842344, 2.493055, 1, 1, 1, 1, 1,
0.166756, -0.09779768, 0.926097, 1, 1, 1, 1, 1,
0.1698337, 0.630918, -0.6459339, 1, 1, 1, 1, 1,
0.1710008, 0.1509537, 1.237363, 1, 1, 1, 1, 1,
0.1730517, -0.5806612, 2.524002, 1, 1, 1, 1, 1,
0.1731042, 0.5231597, -0.2096965, 1, 1, 1, 1, 1,
0.1756539, 2.136146, -2.729545, 1, 1, 1, 1, 1,
0.1758738, 0.553345, -1.11248, 1, 1, 1, 1, 1,
0.1820327, 0.8662744, 1.108499, 1, 1, 1, 1, 1,
0.1823172, -1.591798, 1.800231, 0, 0, 1, 1, 1,
0.1827667, 0.1117914, 1.987594, 1, 0, 0, 1, 1,
0.1834089, 0.4494001, -1.583649, 1, 0, 0, 1, 1,
0.1839031, -1.392611, 3.853069, 1, 0, 0, 1, 1,
0.1917152, -0.3001432, 0.03462123, 1, 0, 0, 1, 1,
0.1922262, 0.7017029, 0.05096176, 1, 0, 0, 1, 1,
0.1925519, -0.7179604, 3.447464, 0, 0, 0, 1, 1,
0.1943953, -0.304157, 0.9799764, 0, 0, 0, 1, 1,
0.1951617, -0.01635183, 2.540217, 0, 0, 0, 1, 1,
0.1965433, -1.435123, 0.9480972, 0, 0, 0, 1, 1,
0.2007929, -1.585427, 2.967254, 0, 0, 0, 1, 1,
0.2019392, -0.3619662, 2.980647, 0, 0, 0, 1, 1,
0.2026692, -0.03601562, 4.328724, 0, 0, 0, 1, 1,
0.2045637, 0.02599471, 3.175, 1, 1, 1, 1, 1,
0.2081107, 1.718096, -0.1223248, 1, 1, 1, 1, 1,
0.2095156, -0.4545023, 3.058738, 1, 1, 1, 1, 1,
0.2112789, -1.437486, 3.188002, 1, 1, 1, 1, 1,
0.2137574, 0.2936757, 1.005983, 1, 1, 1, 1, 1,
0.2166568, 1.237949, -1.352386, 1, 1, 1, 1, 1,
0.223665, 1.4751, -0.2549728, 1, 1, 1, 1, 1,
0.2257607, 0.5683998, 0.7418462, 1, 1, 1, 1, 1,
0.2275976, 1.901037, 2.07589, 1, 1, 1, 1, 1,
0.2318951, 1.207965, 1.304772, 1, 1, 1, 1, 1,
0.2332567, -1.186318, 2.593626, 1, 1, 1, 1, 1,
0.236418, -0.2004507, 1.858022, 1, 1, 1, 1, 1,
0.2364453, 1.383721, 0.6975818, 1, 1, 1, 1, 1,
0.2370569, -0.02215312, 2.304049, 1, 1, 1, 1, 1,
0.2389023, 1.366262, 0.5530656, 1, 1, 1, 1, 1,
0.2391185, -1.473227, 2.217041, 0, 0, 1, 1, 1,
0.2411007, -0.490063, 0.897424, 1, 0, 0, 1, 1,
0.2440254, 0.4164307, -0.4926021, 1, 0, 0, 1, 1,
0.2573233, -0.842452, 3.094197, 1, 0, 0, 1, 1,
0.2586894, 0.1349349, 1.601628, 1, 0, 0, 1, 1,
0.2590846, 1.69148, 0.2056636, 1, 0, 0, 1, 1,
0.2620395, -1.983672, 2.450573, 0, 0, 0, 1, 1,
0.2633848, 0.8197418, 0.7197983, 0, 0, 0, 1, 1,
0.265494, -0.1926094, 1.995437, 0, 0, 0, 1, 1,
0.2680734, 0.995649, 0.008692505, 0, 0, 0, 1, 1,
0.2681526, -0.07124995, 1.366438, 0, 0, 0, 1, 1,
0.2705882, -0.9528623, 2.722304, 0, 0, 0, 1, 1,
0.2707796, -2.189373, 2.415261, 0, 0, 0, 1, 1,
0.2758311, -0.5260888, 2.992459, 1, 1, 1, 1, 1,
0.2787397, 1.049594, 0.4226604, 1, 1, 1, 1, 1,
0.2812402, -0.3572807, 2.727538, 1, 1, 1, 1, 1,
0.2829812, 0.9826911, 0.6470655, 1, 1, 1, 1, 1,
0.2829844, 1.451663, 1.135381, 1, 1, 1, 1, 1,
0.2846757, 0.1925816, 0.2070682, 1, 1, 1, 1, 1,
0.2866643, 0.1555533, 0.188349, 1, 1, 1, 1, 1,
0.2890829, 0.0767056, 1.103467, 1, 1, 1, 1, 1,
0.2902994, 0.736009, -0.4100874, 1, 1, 1, 1, 1,
0.2912275, -1.575794, 2.448698, 1, 1, 1, 1, 1,
0.2919244, -0.5552312, 2.964072, 1, 1, 1, 1, 1,
0.2926878, -0.5788508, 2.65136, 1, 1, 1, 1, 1,
0.2974033, -0.3798629, 3.538301, 1, 1, 1, 1, 1,
0.2983708, -0.7323908, 4.058821, 1, 1, 1, 1, 1,
0.3030179, -0.6511191, 1.419456, 1, 1, 1, 1, 1,
0.3045396, 1.983819, -0.2749983, 0, 0, 1, 1, 1,
0.3063693, 1.564016, 0.5948918, 1, 0, 0, 1, 1,
0.3107744, -0.6291274, 1.996801, 1, 0, 0, 1, 1,
0.3109087, -0.4076081, 3.84121, 1, 0, 0, 1, 1,
0.3142127, 0.2952147, -0.04317513, 1, 0, 0, 1, 1,
0.3156177, -1.54012, 1.447395, 1, 0, 0, 1, 1,
0.3157815, -0.3813944, 2.118446, 0, 0, 0, 1, 1,
0.316577, -1.302621, 4.28446, 0, 0, 0, 1, 1,
0.3175428, -1.345784, 3.189498, 0, 0, 0, 1, 1,
0.3241122, -0.1305909, 3.358409, 0, 0, 0, 1, 1,
0.3267851, -0.9918466, 2.498731, 0, 0, 0, 1, 1,
0.3297742, 0.01075005, 0.1357078, 0, 0, 0, 1, 1,
0.3340753, -0.914775, 0.4045238, 0, 0, 0, 1, 1,
0.3356771, 1.352005, 0.3672107, 1, 1, 1, 1, 1,
0.337417, 2.763735, 0.5104582, 1, 1, 1, 1, 1,
0.3393061, -2.775044, 1.828102, 1, 1, 1, 1, 1,
0.3454218, 1.441014, 0.1928818, 1, 1, 1, 1, 1,
0.3512782, -0.1525417, 2.596637, 1, 1, 1, 1, 1,
0.3526276, -0.9405037, 3.818021, 1, 1, 1, 1, 1,
0.3539817, -1.038053, 3.269096, 1, 1, 1, 1, 1,
0.3621867, 0.317119, 1.854609, 1, 1, 1, 1, 1,
0.3667801, 0.4212943, 0.9922496, 1, 1, 1, 1, 1,
0.367806, -1.440837, 1.702119, 1, 1, 1, 1, 1,
0.3700465, 1.288921, 0.0995734, 1, 1, 1, 1, 1,
0.3720893, 0.9776465, 0.1606897, 1, 1, 1, 1, 1,
0.373053, 0.6644297, 0.8134011, 1, 1, 1, 1, 1,
0.3731357, 0.855755, 1.907324, 1, 1, 1, 1, 1,
0.376124, 2.612972, 0.9272482, 1, 1, 1, 1, 1,
0.3778579, -0.8615943, 2.899598, 0, 0, 1, 1, 1,
0.3788895, -0.9791785, 2.585897, 1, 0, 0, 1, 1,
0.3865202, -0.9090834, 1.365742, 1, 0, 0, 1, 1,
0.3901837, 0.1638415, 0.08701995, 1, 0, 0, 1, 1,
0.3913079, 0.006143376, 0.7009174, 1, 0, 0, 1, 1,
0.3959999, 0.5898446, 1.207268, 1, 0, 0, 1, 1,
0.3964618, -1.157853, 3.968451, 0, 0, 0, 1, 1,
0.3969952, 0.2780548, 1.3934, 0, 0, 0, 1, 1,
0.3970932, -0.7546787, 1.465407, 0, 0, 0, 1, 1,
0.4000985, 0.2771614, -0.4761084, 0, 0, 0, 1, 1,
0.4047789, -0.6664671, 0.07656364, 0, 0, 0, 1, 1,
0.4132133, 1.523728, 0.7088423, 0, 0, 0, 1, 1,
0.4161966, -1.086208, 2.765127, 0, 0, 0, 1, 1,
0.4162599, 0.5044758, 2.601513, 1, 1, 1, 1, 1,
0.418265, -0.4993079, 2.740879, 1, 1, 1, 1, 1,
0.4218736, -1.413918, 2.016612, 1, 1, 1, 1, 1,
0.4224913, 1.165649, 1.496033, 1, 1, 1, 1, 1,
0.4299545, -2.023868, 1.965015, 1, 1, 1, 1, 1,
0.4320778, -1.056739, 3.471543, 1, 1, 1, 1, 1,
0.4361805, -0.2550392, 3.036413, 1, 1, 1, 1, 1,
0.4402693, -0.6548473, 3.055164, 1, 1, 1, 1, 1,
0.4464334, -0.8154349, 1.276435, 1, 1, 1, 1, 1,
0.4496243, 0.5404038, -1.048007, 1, 1, 1, 1, 1,
0.4505292, 2.686593, -0.5702654, 1, 1, 1, 1, 1,
0.4653449, 0.01133138, 0.7556205, 1, 1, 1, 1, 1,
0.468657, 1.342408, -0.8780972, 1, 1, 1, 1, 1,
0.4721312, -0.3932722, 3.531143, 1, 1, 1, 1, 1,
0.4725502, -0.03255942, 0.9819629, 1, 1, 1, 1, 1,
0.4735822, 0.09310516, 0.7797466, 0, 0, 1, 1, 1,
0.4754485, 0.05514315, 1.608167, 1, 0, 0, 1, 1,
0.4757229, -1.087167, 3.51121, 1, 0, 0, 1, 1,
0.4817623, 0.7579693, 0.4196823, 1, 0, 0, 1, 1,
0.483463, -1.335822, 3.311003, 1, 0, 0, 1, 1,
0.4834983, 1.695507, 0.3431702, 1, 0, 0, 1, 1,
0.4912839, 1.590935, -0.8933952, 0, 0, 0, 1, 1,
0.4958428, -0.4267243, 1.809515, 0, 0, 0, 1, 1,
0.4980653, -0.0588593, -0.3944902, 0, 0, 0, 1, 1,
0.501403, -1.797345, 3.000526, 0, 0, 0, 1, 1,
0.5161644, -0.1590444, 2.360172, 0, 0, 0, 1, 1,
0.5201447, 1.003927, 1.729966, 0, 0, 0, 1, 1,
0.5216339, -1.461477, 4.235099, 0, 0, 0, 1, 1,
0.5221827, -2.058693, 2.856704, 1, 1, 1, 1, 1,
0.5273868, -0.2191493, 1.93426, 1, 1, 1, 1, 1,
0.5283819, 1.07542, 0.7650508, 1, 1, 1, 1, 1,
0.5298508, -0.2730077, 2.788706, 1, 1, 1, 1, 1,
0.5419672, 0.5898514, -1.674419, 1, 1, 1, 1, 1,
0.546668, -0.2852525, 1.932579, 1, 1, 1, 1, 1,
0.5506374, -0.3100545, 2.97001, 1, 1, 1, 1, 1,
0.5532195, 0.3712945, 0.6757805, 1, 1, 1, 1, 1,
0.5545296, 1.774889, 0.4343294, 1, 1, 1, 1, 1,
0.5651086, 0.6738242, 0.05342168, 1, 1, 1, 1, 1,
0.5695263, -0.4732546, 2.770333, 1, 1, 1, 1, 1,
0.5715749, -0.8414996, 2.595511, 1, 1, 1, 1, 1,
0.5716953, -0.2241327, 3.649766, 1, 1, 1, 1, 1,
0.5721072, -1.272987, 3.533526, 1, 1, 1, 1, 1,
0.5746553, 0.2807232, 2.141544, 1, 1, 1, 1, 1,
0.5782745, -0.2308077, 1.196573, 0, 0, 1, 1, 1,
0.5827734, -0.7249103, 2.991854, 1, 0, 0, 1, 1,
0.5880873, 1.503698, 0.2706542, 1, 0, 0, 1, 1,
0.5909125, 0.0513598, 1.83368, 1, 0, 0, 1, 1,
0.5918041, 1.94858, 0.1252389, 1, 0, 0, 1, 1,
0.592474, 1.262034, 0.9736956, 1, 0, 0, 1, 1,
0.5929927, -0.2975289, 2.737452, 0, 0, 0, 1, 1,
0.5934156, -0.2888995, 3.010045, 0, 0, 0, 1, 1,
0.603963, 0.3566813, 1.082581, 0, 0, 0, 1, 1,
0.6056344, 2.170543, -1.561276, 0, 0, 0, 1, 1,
0.6056663, 0.9704729, 0.853623, 0, 0, 0, 1, 1,
0.6071585, 0.26339, 2.193358, 0, 0, 0, 1, 1,
0.6086564, 0.1784347, 0.9928428, 0, 0, 0, 1, 1,
0.6122448, 0.005000911, 2.527848, 1, 1, 1, 1, 1,
0.6142933, 1.487687, 0.8080369, 1, 1, 1, 1, 1,
0.6152449, 0.7460265, -0.4162157, 1, 1, 1, 1, 1,
0.6176333, -1.063123, 3.782824, 1, 1, 1, 1, 1,
0.6256883, 0.8296794, 0.7450296, 1, 1, 1, 1, 1,
0.6349968, 0.3622203, 1.538678, 1, 1, 1, 1, 1,
0.6357702, 0.5711619, -0.8453886, 1, 1, 1, 1, 1,
0.6404133, -0.8780797, 3.716058, 1, 1, 1, 1, 1,
0.6409839, -0.09876537, 0.415734, 1, 1, 1, 1, 1,
0.6465585, 1.415835, 0.9125945, 1, 1, 1, 1, 1,
0.646854, -0.3686004, 3.629179, 1, 1, 1, 1, 1,
0.6468915, -0.2013283, 3.365662, 1, 1, 1, 1, 1,
0.6469918, -0.7124854, 2.514626, 1, 1, 1, 1, 1,
0.6537712, 0.7418565, 0.2798701, 1, 1, 1, 1, 1,
0.6547806, 0.02837163, 2.379973, 1, 1, 1, 1, 1,
0.6550841, 0.6880711, 1.829204, 0, 0, 1, 1, 1,
0.6595542, -0.009284781, 0.2634479, 1, 0, 0, 1, 1,
0.6646639, 0.2029357, 1.933341, 1, 0, 0, 1, 1,
0.6665706, -0.1373648, 3.531027, 1, 0, 0, 1, 1,
0.6703932, 0.3529496, 3.636788, 1, 0, 0, 1, 1,
0.6712881, 0.6476269, 1.24916, 1, 0, 0, 1, 1,
0.6733572, 0.5691391, 0.8762047, 0, 0, 0, 1, 1,
0.6735841, -2.299721, 4.475518, 0, 0, 0, 1, 1,
0.6768432, -0.8504236, 3.459326, 0, 0, 0, 1, 1,
0.680857, -1.986482, 2.643693, 0, 0, 0, 1, 1,
0.682963, 0.1605726, 2.629005, 0, 0, 0, 1, 1,
0.6861357, -0.2288941, 0.6381842, 0, 0, 0, 1, 1,
0.6869353, -0.5887609, 2.429141, 0, 0, 0, 1, 1,
0.6895833, -0.04476334, 2.113242, 1, 1, 1, 1, 1,
0.6930995, 0.3402714, 1.540113, 1, 1, 1, 1, 1,
0.6960616, 1.545467, -0.4734364, 1, 1, 1, 1, 1,
0.7018889, -0.6871469, 2.83124, 1, 1, 1, 1, 1,
0.7048925, -0.6092656, 2.373976, 1, 1, 1, 1, 1,
0.7054506, 1.0094, 0.7092484, 1, 1, 1, 1, 1,
0.7057543, -1.098531, 4.733612, 1, 1, 1, 1, 1,
0.7065895, 0.6606564, 0.2631011, 1, 1, 1, 1, 1,
0.7144654, -1.876749, 2.925948, 1, 1, 1, 1, 1,
0.7246904, -2.384745, 3.93274, 1, 1, 1, 1, 1,
0.7283248, 1.150703, -0.3809889, 1, 1, 1, 1, 1,
0.7318507, -1.068867, 2.759608, 1, 1, 1, 1, 1,
0.7330492, -1.700078, 2.243221, 1, 1, 1, 1, 1,
0.7384853, 1.452038, 1.07661, 1, 1, 1, 1, 1,
0.7430845, 1.264853, -0.7185571, 1, 1, 1, 1, 1,
0.7479483, -0.8633149, 3.087101, 0, 0, 1, 1, 1,
0.7522978, 0.2401486, -0.2887338, 1, 0, 0, 1, 1,
0.7539468, 0.7211676, 1.33695, 1, 0, 0, 1, 1,
0.754472, 0.1819727, 1.584575, 1, 0, 0, 1, 1,
0.7624999, -0.5566526, 2.384842, 1, 0, 0, 1, 1,
0.7650932, -1.021446, 2.228681, 1, 0, 0, 1, 1,
0.765256, -0.638972, 2.281734, 0, 0, 0, 1, 1,
0.7663657, -1.772042, 0.1493485, 0, 0, 0, 1, 1,
0.7703507, 0.6273217, 2.070304, 0, 0, 0, 1, 1,
0.7716079, 0.2797145, 0.269935, 0, 0, 0, 1, 1,
0.7765725, -0.3302545, 1.692869, 0, 0, 0, 1, 1,
0.7883042, 0.2465885, 0.5884665, 0, 0, 0, 1, 1,
0.7934704, 0.8312794, 0.6254237, 0, 0, 0, 1, 1,
0.7937437, 0.3866132, 0.6071236, 1, 1, 1, 1, 1,
0.7961916, 1.468058, 0.7052977, 1, 1, 1, 1, 1,
0.7971795, 0.157508, 0.1404508, 1, 1, 1, 1, 1,
0.7980629, -0.507811, 1.00513, 1, 1, 1, 1, 1,
0.8005088, -1.663272, 2.381104, 1, 1, 1, 1, 1,
0.8068346, -0.5750536, 2.701296, 1, 1, 1, 1, 1,
0.8137203, -0.5472006, 2.938678, 1, 1, 1, 1, 1,
0.8150524, 0.4644717, 1.006238, 1, 1, 1, 1, 1,
0.8208973, 0.4933723, 1.346585, 1, 1, 1, 1, 1,
0.8225896, 0.2107039, 2.112124, 1, 1, 1, 1, 1,
0.8226357, 0.9592538, -0.3508048, 1, 1, 1, 1, 1,
0.8245779, 0.5757717, 1.165587, 1, 1, 1, 1, 1,
0.8314833, -0.3561448, 2.08794, 1, 1, 1, 1, 1,
0.832077, 0.1090736, 0.7275419, 1, 1, 1, 1, 1,
0.8349624, 0.4663602, 1.001932, 1, 1, 1, 1, 1,
0.8352609, -0.8836583, 3.764386, 0, 0, 1, 1, 1,
0.8370048, 2.911353, -0.2373441, 1, 0, 0, 1, 1,
0.8400738, -0.7638977, 3.371547, 1, 0, 0, 1, 1,
0.8438607, -0.1056514, 1.971725, 1, 0, 0, 1, 1,
0.8462572, 0.3470445, 0.9141915, 1, 0, 0, 1, 1,
0.8476948, 1.016282, 1.053138, 1, 0, 0, 1, 1,
0.8492011, -0.8304863, 3.001359, 0, 0, 0, 1, 1,
0.8525288, -0.08185215, 0.882683, 0, 0, 0, 1, 1,
0.8560085, 0.5211307, 3.786973, 0, 0, 0, 1, 1,
0.8573668, 0.814943, 0.3687959, 0, 0, 0, 1, 1,
0.8577866, 0.2700083, 0.366223, 0, 0, 0, 1, 1,
0.859851, 0.4884935, -0.05410223, 0, 0, 0, 1, 1,
0.8635691, 1.139324, 0.003925809, 0, 0, 0, 1, 1,
0.8708351, 0.6262667, 1.088221, 1, 1, 1, 1, 1,
0.8745881, -0.01391666, 2.124504, 1, 1, 1, 1, 1,
0.8756683, -1.040401, 3.205174, 1, 1, 1, 1, 1,
0.877126, -0.9154577, 2.566486, 1, 1, 1, 1, 1,
0.8788836, 0.2698795, 2.48579, 1, 1, 1, 1, 1,
0.8941493, -0.02718913, 2.482416, 1, 1, 1, 1, 1,
0.8990195, 0.9794517, 0.5569593, 1, 1, 1, 1, 1,
0.9068102, -1.649556, 3.715787, 1, 1, 1, 1, 1,
0.90934, -1.197359, 3.253854, 1, 1, 1, 1, 1,
0.9291196, -0.8089819, 2.429719, 1, 1, 1, 1, 1,
0.9358217, -0.1503544, 1.00563, 1, 1, 1, 1, 1,
0.9363323, 0.9438731, 1.135808, 1, 1, 1, 1, 1,
0.938728, 0.07968636, 1.407698, 1, 1, 1, 1, 1,
0.9427009, -1.146566, 1.648522, 1, 1, 1, 1, 1,
0.9443414, 0.7711118, 1.955256, 1, 1, 1, 1, 1,
0.9444189, -1.068082, 0.9792013, 0, 0, 1, 1, 1,
0.9454525, 1.693837, 0.4957614, 1, 0, 0, 1, 1,
0.9467332, -1.226935, 1.999131, 1, 0, 0, 1, 1,
0.9501898, 0.6402383, 0.2275127, 1, 0, 0, 1, 1,
0.95027, 1.305314, -0.4429607, 1, 0, 0, 1, 1,
0.9511651, -0.4558511, 1.869384, 1, 0, 0, 1, 1,
0.9558135, -0.4076711, 0.4811704, 0, 0, 0, 1, 1,
0.9570956, 1.872401, 0.4462738, 0, 0, 0, 1, 1,
0.9581936, 0.7931536, -0.3336193, 0, 0, 0, 1, 1,
0.9619032, 0.4150908, 2.3079, 0, 0, 0, 1, 1,
0.9635906, 2.170022, 0.3700725, 0, 0, 0, 1, 1,
0.9681194, 0.2611763, 2.077814, 0, 0, 0, 1, 1,
0.9685064, 1.448406, -0.8432235, 0, 0, 0, 1, 1,
0.9685629, -0.3979273, 3.258903, 1, 1, 1, 1, 1,
0.9695086, -0.8216874, 3.885932, 1, 1, 1, 1, 1,
0.9722518, -0.29978, 2.386797, 1, 1, 1, 1, 1,
0.9765934, 0.7228772, 1.118697, 1, 1, 1, 1, 1,
0.9803792, 0.06476942, 0.8233801, 1, 1, 1, 1, 1,
0.9838101, -2.590823, 1.860641, 1, 1, 1, 1, 1,
0.9846994, 1.911981, 0.7443703, 1, 1, 1, 1, 1,
0.9904246, 0.5360972, 1.291354, 1, 1, 1, 1, 1,
0.9910433, 0.07443, 2.5181, 1, 1, 1, 1, 1,
0.9952981, 0.5320987, 1.24814, 1, 1, 1, 1, 1,
0.9970851, -0.2311642, 1.494232, 1, 1, 1, 1, 1,
1.000068, -1.655923, 3.702213, 1, 1, 1, 1, 1,
1.004957, 2.118303, -0.9508358, 1, 1, 1, 1, 1,
1.005528, 0.08460059, 2.121299, 1, 1, 1, 1, 1,
1.009873, 0.8048623, 1.732675, 1, 1, 1, 1, 1,
1.032118, 1.881762, 0.4945388, 0, 0, 1, 1, 1,
1.035164, 0.1382841, 2.63016, 1, 0, 0, 1, 1,
1.035475, -1.253002, 0.6950503, 1, 0, 0, 1, 1,
1.039836, 0.8621618, 0.4678928, 1, 0, 0, 1, 1,
1.056434, -0.819095, 3.765403, 1, 0, 0, 1, 1,
1.064725, -0.3673, 1.611839, 1, 0, 0, 1, 1,
1.06904, -0.1494174, 1.73604, 0, 0, 0, 1, 1,
1.078478, 0.2632319, 1.999621, 0, 0, 0, 1, 1,
1.078829, -1.123227, 2.78534, 0, 0, 0, 1, 1,
1.082807, 1.391246, 0.01158814, 0, 0, 0, 1, 1,
1.084551, 1.463103, 1.084652, 0, 0, 0, 1, 1,
1.089656, -0.6384962, 2.635506, 0, 0, 0, 1, 1,
1.091168, 0.05846181, 1.79773, 0, 0, 0, 1, 1,
1.09343, 0.1210824, 2.423401, 1, 1, 1, 1, 1,
1.096811, 0.649536, 1.744901, 1, 1, 1, 1, 1,
1.098844, -1.265609, 2.894426, 1, 1, 1, 1, 1,
1.103561, -1.885969, 3.237278, 1, 1, 1, 1, 1,
1.103734, -0.07227413, 0.4464304, 1, 1, 1, 1, 1,
1.11193, 0.4466728, 1.656819, 1, 1, 1, 1, 1,
1.114637, 1.106648, -0.2895694, 1, 1, 1, 1, 1,
1.117717, -0.4529902, 1.105969, 1, 1, 1, 1, 1,
1.123799, -0.3670017, 1.489418, 1, 1, 1, 1, 1,
1.13178, -1.308951, 2.124283, 1, 1, 1, 1, 1,
1.139838, 0.7592601, -0.4240683, 1, 1, 1, 1, 1,
1.144341, 1.655386, 0.9071938, 1, 1, 1, 1, 1,
1.148386, 1.128599, 0.005328562, 1, 1, 1, 1, 1,
1.15861, 1.36839, 1.130923, 1, 1, 1, 1, 1,
1.161049, -0.6209105, 2.959368, 1, 1, 1, 1, 1,
1.167024, -0.4323818, 0.01824781, 0, 0, 1, 1, 1,
1.167751, 1.748731, -0.4382875, 1, 0, 0, 1, 1,
1.170099, -0.1259823, 0.8783786, 1, 0, 0, 1, 1,
1.173005, 1.757352, 0.261451, 1, 0, 0, 1, 1,
1.173724, -1.668139, 3.391585, 1, 0, 0, 1, 1,
1.184512, 0.7222215, 0.6290275, 1, 0, 0, 1, 1,
1.186024, -0.3650147, 1.853512, 0, 0, 0, 1, 1,
1.1881, -0.8816242, 2.483984, 0, 0, 0, 1, 1,
1.192301, 0.1695444, 2.073669, 0, 0, 0, 1, 1,
1.195039, 0.7272657, 0.7928061, 0, 0, 0, 1, 1,
1.195712, -0.4526644, 2.329704, 0, 0, 0, 1, 1,
1.197001, -0.7367715, 3.335997, 0, 0, 0, 1, 1,
1.198362, 0.1921246, 1.41088, 0, 0, 0, 1, 1,
1.203639, 0.7912253, 0.5344638, 1, 1, 1, 1, 1,
1.20992, 1.237356, 2.624923, 1, 1, 1, 1, 1,
1.210511, -1.267657, 3.003963, 1, 1, 1, 1, 1,
1.211117, 0.2852665, 0.1970584, 1, 1, 1, 1, 1,
1.213749, 1.296904, 0.3117305, 1, 1, 1, 1, 1,
1.217893, -0.7135825, 2.998206, 1, 1, 1, 1, 1,
1.220369, 1.553289, 2.234259, 1, 1, 1, 1, 1,
1.22107, 0.3454623, 1.181771, 1, 1, 1, 1, 1,
1.222688, -0.5722759, 2.474905, 1, 1, 1, 1, 1,
1.223321, 0.7663919, 1.975498, 1, 1, 1, 1, 1,
1.226972, -1.732245, 2.247056, 1, 1, 1, 1, 1,
1.23579, -1.680039, 0.9683139, 1, 1, 1, 1, 1,
1.237149, 0.2616359, 2.278975, 1, 1, 1, 1, 1,
1.245746, 1.122877, 2.371492, 1, 1, 1, 1, 1,
1.247498, 0.3943611, 3.720601, 1, 1, 1, 1, 1,
1.261847, -2.755062, 3.035784, 0, 0, 1, 1, 1,
1.267419, 0.5547442, -0.9162468, 1, 0, 0, 1, 1,
1.27146, -0.3140739, 1.32463, 1, 0, 0, 1, 1,
1.271893, -0.4694345, 0.3204064, 1, 0, 0, 1, 1,
1.274621, 1.35952, 0.4038674, 1, 0, 0, 1, 1,
1.280703, 1.186039, -0.3528199, 1, 0, 0, 1, 1,
1.283134, 0.9970478, 2.256389, 0, 0, 0, 1, 1,
1.283677, -0.511993, 0.4877738, 0, 0, 0, 1, 1,
1.283735, -0.3082357, 2.308743, 0, 0, 0, 1, 1,
1.284523, 0.7854832, 1.176067, 0, 0, 0, 1, 1,
1.28592, 0.7902923, 1.640459, 0, 0, 0, 1, 1,
1.28817, 1.352865, 0.6170657, 0, 0, 0, 1, 1,
1.288192, 0.5629597, -0.6323451, 0, 0, 0, 1, 1,
1.300682, 1.485655, 0.6286007, 1, 1, 1, 1, 1,
1.316496, 0.9119231, 3.602494, 1, 1, 1, 1, 1,
1.322647, 0.6789773, 2.490986, 1, 1, 1, 1, 1,
1.327205, 1.386578, 1.47124, 1, 1, 1, 1, 1,
1.333363, 1.257263, -0.3884745, 1, 1, 1, 1, 1,
1.333714, -0.6442178, 2.783948, 1, 1, 1, 1, 1,
1.334121, 0.08034718, 1.640839, 1, 1, 1, 1, 1,
1.335927, 0.3515977, 2.914748, 1, 1, 1, 1, 1,
1.345011, 0.2727115, 1.429983, 1, 1, 1, 1, 1,
1.347507, 0.7593096, 0.369636, 1, 1, 1, 1, 1,
1.359247, 0.2524281, 0.3492104, 1, 1, 1, 1, 1,
1.367779, -0.985717, 0.9174917, 1, 1, 1, 1, 1,
1.370196, -0.1060989, 1.19504, 1, 1, 1, 1, 1,
1.374206, -0.855395, 3.522598, 1, 1, 1, 1, 1,
1.388724, -1.375171, 3.14403, 1, 1, 1, 1, 1,
1.389128, -1.056874, 2.932454, 0, 0, 1, 1, 1,
1.399114, -0.9360673, 2.318267, 1, 0, 0, 1, 1,
1.40688, -0.5474548, 4.220747, 1, 0, 0, 1, 1,
1.407232, -1.72534, 2.228984, 1, 0, 0, 1, 1,
1.421715, 0.09764296, 2.43675, 1, 0, 0, 1, 1,
1.422827, -2.050688, 3.099576, 1, 0, 0, 1, 1,
1.424471, 1.135907, 0.4813216, 0, 0, 0, 1, 1,
1.435829, 0.6927758, 0.8329532, 0, 0, 0, 1, 1,
1.447801, -0.3007824, 0.8822042, 0, 0, 0, 1, 1,
1.455938, 0.4246602, 1.547343, 0, 0, 0, 1, 1,
1.456033, 0.2919054, 2.035446, 0, 0, 0, 1, 1,
1.469708, -0.02058621, 3.338848, 0, 0, 0, 1, 1,
1.472567, 0.3582248, 2.377524, 0, 0, 0, 1, 1,
1.474442, -1.474478, 2.817315, 1, 1, 1, 1, 1,
1.491054, -0.3014587, 2.24539, 1, 1, 1, 1, 1,
1.521256, 1.119634, -0.5275102, 1, 1, 1, 1, 1,
1.523351, 0.171329, 0.5955113, 1, 1, 1, 1, 1,
1.5307, 1.601856, 1.222144, 1, 1, 1, 1, 1,
1.539648, 0.6104207, 1.476116, 1, 1, 1, 1, 1,
1.554938, 0.5880569, 2.161923, 1, 1, 1, 1, 1,
1.559175, -0.4107127, 2.542415, 1, 1, 1, 1, 1,
1.565072, 0.3505392, 1.132813, 1, 1, 1, 1, 1,
1.584789, 0.7264606, -0.4372164, 1, 1, 1, 1, 1,
1.609349, 0.06989796, 2.414904, 1, 1, 1, 1, 1,
1.61027, -0.2828275, 3.11464, 1, 1, 1, 1, 1,
1.611718, -1.372727, 2.553023, 1, 1, 1, 1, 1,
1.618065, 0.8982471, 0.7161261, 1, 1, 1, 1, 1,
1.618774, 1.034175, 2.715404, 1, 1, 1, 1, 1,
1.640898, -1.176744, 2.196828, 0, 0, 1, 1, 1,
1.643706, 2.15555, 1.912961, 1, 0, 0, 1, 1,
1.65086, -0.3988924, 1.063432, 1, 0, 0, 1, 1,
1.655779, 0.1655984, 1.994062, 1, 0, 0, 1, 1,
1.672194, -0.2305264, 1.767434, 1, 0, 0, 1, 1,
1.687501, -1.411917, 1.687533, 1, 0, 0, 1, 1,
1.689512, 0.739978, -0.1902283, 0, 0, 0, 1, 1,
1.693484, -0.3237013, 0.7250999, 0, 0, 0, 1, 1,
1.696978, 0.06732681, 3.03828, 0, 0, 0, 1, 1,
1.719876, 0.2332305, 2.123548, 0, 0, 0, 1, 1,
1.74885, 0.1535248, 2.274553, 0, 0, 0, 1, 1,
1.749118, -1.071862, 0.03480603, 0, 0, 0, 1, 1,
1.757946, -1.300692, 2.104086, 0, 0, 0, 1, 1,
1.776168, 2.587969, 1.526749, 1, 1, 1, 1, 1,
1.782036, -0.6879948, 2.791746, 1, 1, 1, 1, 1,
1.786758, -0.3942972, 3.017208, 1, 1, 1, 1, 1,
1.809459, 0.1468121, 0.5208433, 1, 1, 1, 1, 1,
1.811106, 0.8826358, 1.449225, 1, 1, 1, 1, 1,
1.822989, -0.5802685, -0.1604854, 1, 1, 1, 1, 1,
1.823768, 0.7380295, 0.9132504, 1, 1, 1, 1, 1,
1.831278, 0.4719746, -0.3434994, 1, 1, 1, 1, 1,
1.871322, -1.488103, 0.6784132, 1, 1, 1, 1, 1,
1.871707, -0.5759498, 2.785069, 1, 1, 1, 1, 1,
1.875136, -1.481432, 2.394993, 1, 1, 1, 1, 1,
1.890504, 0.4302392, 1.602093, 1, 1, 1, 1, 1,
1.916854, 1.49028, 2.59691, 1, 1, 1, 1, 1,
1.951711, 0.8323783, 0.6959445, 1, 1, 1, 1, 1,
1.954793, -0.4255472, 2.782534, 1, 1, 1, 1, 1,
1.966195, -0.3185797, 4.481605, 0, 0, 1, 1, 1,
1.969953, -1.11797, 3.733638, 1, 0, 0, 1, 1,
1.987204, 1.095884, 0.8850639, 1, 0, 0, 1, 1,
1.991471, 1.458903, 1.575931, 1, 0, 0, 1, 1,
2.008753, 1.583539, 1.041817, 1, 0, 0, 1, 1,
2.04917, 2.325874, 1.239254, 1, 0, 0, 1, 1,
2.051172, -0.1671854, 1.435946, 0, 0, 0, 1, 1,
2.05859, -0.3137739, 2.689926, 0, 0, 0, 1, 1,
2.080484, 0.4203163, 1.686303, 0, 0, 0, 1, 1,
2.080568, 0.8551227, 1.968579, 0, 0, 0, 1, 1,
2.096295, -1.701028, 4.131721, 0, 0, 0, 1, 1,
2.142528, 1.761761, -1.059288, 0, 0, 0, 1, 1,
2.151641, 0.218338, 1.041464, 0, 0, 0, 1, 1,
2.195384, -1.096112, 2.565869, 1, 1, 1, 1, 1,
2.243319, -1.657251, 2.789974, 1, 1, 1, 1, 1,
2.25427, -0.6765071, 1.682688, 1, 1, 1, 1, 1,
2.378297, 1.402767, -0.1244493, 1, 1, 1, 1, 1,
2.647175, 0.08341977, 0.524205, 1, 1, 1, 1, 1,
2.931706, 0.5755914, -0.9170884, 1, 1, 1, 1, 1,
3.000334, -1.198264, 1.623191, 1, 1, 1, 1, 1
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
var radius = 9.305175;
var distance = 32.68403;
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
mvMatrix.translate( 0.05827689, 0.04194784, 0.5479486 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.68403);
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
