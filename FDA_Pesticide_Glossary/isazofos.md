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
-3.634485, -0.03806319, -2.615855, 1, 0, 0, 1,
-2.602285, -1.045096, -2.514025, 1, 0.007843138, 0, 1,
-2.513386, -0.01028154, -1.234687, 1, 0.01176471, 0, 1,
-2.364431, 0.160803, -2.837378, 1, 0.01960784, 0, 1,
-2.347148, -1.629308, -2.197798, 1, 0.02352941, 0, 1,
-2.328035, -0.8667021, -1.320223, 1, 0.03137255, 0, 1,
-2.294669, -0.7014696, -1.984393, 1, 0.03529412, 0, 1,
-2.255888, -1.872244, -3.29722, 1, 0.04313726, 0, 1,
-2.229154, -1.838185, -0.3274969, 1, 0.04705882, 0, 1,
-2.21314, 0.3252228, 0.04500033, 1, 0.05490196, 0, 1,
-2.18706, 0.1090291, -1.617358, 1, 0.05882353, 0, 1,
-2.163916, 0.8055353, -0.5913763, 1, 0.06666667, 0, 1,
-2.144396, -1.238817, -4.475237, 1, 0.07058824, 0, 1,
-2.129711, 1.266032, 0.4740644, 1, 0.07843138, 0, 1,
-2.063866, -0.730153, -1.487262, 1, 0.08235294, 0, 1,
-2.054085, -1.031408, -1.757096, 1, 0.09019608, 0, 1,
-2.044983, -0.01178401, -1.960918, 1, 0.09411765, 0, 1,
-2.001337, 0.004793652, -3.907958, 1, 0.1019608, 0, 1,
-1.980893, 0.7295486, -2.29829, 1, 0.1098039, 0, 1,
-1.971426, -0.3621312, -0.9585047, 1, 0.1137255, 0, 1,
-1.962259, -0.4589206, -1.939642, 1, 0.1215686, 0, 1,
-1.954338, 1.118651, 0.01586863, 1, 0.1254902, 0, 1,
-1.942604, 0.7207569, -2.66022, 1, 0.1333333, 0, 1,
-1.874066, 0.9333921, -0.3560404, 1, 0.1372549, 0, 1,
-1.842204, -0.5053901, -2.935977, 1, 0.145098, 0, 1,
-1.832239, -0.3709227, -1.970663, 1, 0.1490196, 0, 1,
-1.821347, 0.5556686, -2.631516, 1, 0.1568628, 0, 1,
-1.790866, 1.602652, -0.8360911, 1, 0.1607843, 0, 1,
-1.770169, -0.3269777, -1.838007, 1, 0.1686275, 0, 1,
-1.744704, 0.5490773, -1.672883, 1, 0.172549, 0, 1,
-1.714872, -0.1708968, -1.521162, 1, 0.1803922, 0, 1,
-1.713533, -0.2268362, -3.016209, 1, 0.1843137, 0, 1,
-1.703058, -0.007212376, -1.491926, 1, 0.1921569, 0, 1,
-1.694619, -0.93348, -2.230516, 1, 0.1960784, 0, 1,
-1.684614, 0.1723548, -0.6707138, 1, 0.2039216, 0, 1,
-1.683384, 1.693698, -0.6612903, 1, 0.2117647, 0, 1,
-1.67971, -0.1726334, -1.588242, 1, 0.2156863, 0, 1,
-1.673901, 0.8533045, -2.506615, 1, 0.2235294, 0, 1,
-1.672235, 0.01826525, -1.055127, 1, 0.227451, 0, 1,
-1.67168, -0.8859854, -3.259123, 1, 0.2352941, 0, 1,
-1.670534, -0.07139537, -1.535776, 1, 0.2392157, 0, 1,
-1.662961, 0.2780571, -1.523769, 1, 0.2470588, 0, 1,
-1.644592, -1.033327, -2.315203, 1, 0.2509804, 0, 1,
-1.637786, 0.3050791, -0.597611, 1, 0.2588235, 0, 1,
-1.625425, -0.2283136, -1.366874, 1, 0.2627451, 0, 1,
-1.622478, -1.343037, -2.815369, 1, 0.2705882, 0, 1,
-1.603109, 0.9442722, -1.240508, 1, 0.2745098, 0, 1,
-1.598271, 1.726243, -0.6304465, 1, 0.282353, 0, 1,
-1.592547, 0.6080541, -2.220574, 1, 0.2862745, 0, 1,
-1.590624, -0.8700405, -2.055401, 1, 0.2941177, 0, 1,
-1.572836, -0.03112799, -0.9807689, 1, 0.3019608, 0, 1,
-1.552038, 0.08529323, -1.883115, 1, 0.3058824, 0, 1,
-1.533289, 0.1444321, 0.3765744, 1, 0.3137255, 0, 1,
-1.533187, -0.0983614, -1.914882, 1, 0.3176471, 0, 1,
-1.532107, 0.2361978, -1.604206, 1, 0.3254902, 0, 1,
-1.529672, 0.5769467, -0.7813382, 1, 0.3294118, 0, 1,
-1.529347, 0.9575922, 0.1709052, 1, 0.3372549, 0, 1,
-1.528269, -0.7403221, -2.216766, 1, 0.3411765, 0, 1,
-1.527317, 1.795589, -0.1872782, 1, 0.3490196, 0, 1,
-1.519715, -1.207615, -2.892752, 1, 0.3529412, 0, 1,
-1.516313, 1.382866, -0.2635512, 1, 0.3607843, 0, 1,
-1.511422, -0.8638917, -3.047402, 1, 0.3647059, 0, 1,
-1.510545, 0.5148497, -1.638891, 1, 0.372549, 0, 1,
-1.489825, 1.150645, -1.105696, 1, 0.3764706, 0, 1,
-1.486303, -1.569469, -1.816669, 1, 0.3843137, 0, 1,
-1.483308, -1.817857, -1.362615, 1, 0.3882353, 0, 1,
-1.482921, -0.6283849, -3.003571, 1, 0.3960784, 0, 1,
-1.475458, 1.033765, -0.1596124, 1, 0.4039216, 0, 1,
-1.467726, 0.7116908, -0.4214868, 1, 0.4078431, 0, 1,
-1.455197, 0.1349721, -1.719182, 1, 0.4156863, 0, 1,
-1.452336, 0.3620621, 1.497224, 1, 0.4196078, 0, 1,
-1.447866, -1.541849, -2.204434, 1, 0.427451, 0, 1,
-1.433413, 1.093675, -1.022578, 1, 0.4313726, 0, 1,
-1.427852, 0.7325853, -3.072451, 1, 0.4392157, 0, 1,
-1.422472, 3.107719, -0.5154248, 1, 0.4431373, 0, 1,
-1.41123, 0.5154, -1.155952, 1, 0.4509804, 0, 1,
-1.402978, -0.1655992, -3.399618, 1, 0.454902, 0, 1,
-1.398539, -1.002108, -1.55809, 1, 0.4627451, 0, 1,
-1.389106, 1.525846, 0.09866691, 1, 0.4666667, 0, 1,
-1.388918, 0.1716247, -1.622356, 1, 0.4745098, 0, 1,
-1.387213, -1.531547, -2.482671, 1, 0.4784314, 0, 1,
-1.371857, 1.678759, -0.4822077, 1, 0.4862745, 0, 1,
-1.357798, 0.7912404, -1.179768, 1, 0.4901961, 0, 1,
-1.355588, -0.825159, -4.353262, 1, 0.4980392, 0, 1,
-1.352196, -1.220838, -4.398767, 1, 0.5058824, 0, 1,
-1.343127, -0.2456874, -1.386182, 1, 0.509804, 0, 1,
-1.334315, 0.6793114, -1.658742, 1, 0.5176471, 0, 1,
-1.333627, 0.04483707, -1.286717, 1, 0.5215687, 0, 1,
-1.333236, -1.539673, -1.714572, 1, 0.5294118, 0, 1,
-1.330986, -0.6204414, -1.409583, 1, 0.5333334, 0, 1,
-1.327442, 0.4952402, -0.9267183, 1, 0.5411765, 0, 1,
-1.326014, -0.5218483, -1.298953, 1, 0.5450981, 0, 1,
-1.3227, 1.457278, 0.7106757, 1, 0.5529412, 0, 1,
-1.316865, 0.6381487, -0.6957571, 1, 0.5568628, 0, 1,
-1.311451, -1.44736, -1.583875, 1, 0.5647059, 0, 1,
-1.303684, 0.7312704, -0.1752476, 1, 0.5686275, 0, 1,
-1.301066, 1.904616, 0.1234253, 1, 0.5764706, 0, 1,
-1.293378, 0.5231783, 0.4470757, 1, 0.5803922, 0, 1,
-1.289252, 1.142804, -0.9804937, 1, 0.5882353, 0, 1,
-1.285755, -1.069653, -3.275549, 1, 0.5921569, 0, 1,
-1.275057, 0.03936182, -3.450672, 1, 0.6, 0, 1,
-1.273849, 0.5365781, -1.697791, 1, 0.6078432, 0, 1,
-1.266052, 2.239507, -0.2651737, 1, 0.6117647, 0, 1,
-1.264871, 1.188555, -0.4241158, 1, 0.6196079, 0, 1,
-1.25996, -0.7176311, -3.03988, 1, 0.6235294, 0, 1,
-1.257902, -0.4619927, -2.278605, 1, 0.6313726, 0, 1,
-1.256788, 0.6063181, -1.328489, 1, 0.6352941, 0, 1,
-1.25434, -0.6060287, -2.674279, 1, 0.6431373, 0, 1,
-1.243744, 1.420255, -0.5205035, 1, 0.6470588, 0, 1,
-1.234375, 0.4726149, -2.702578, 1, 0.654902, 0, 1,
-1.231306, 0.9001474, 0.3359921, 1, 0.6588235, 0, 1,
-1.224969, -0.3890001, -2.605568, 1, 0.6666667, 0, 1,
-1.221618, -1.533978, -1.437544, 1, 0.6705883, 0, 1,
-1.218851, 0.3769951, -1.809048, 1, 0.6784314, 0, 1,
-1.21239, -0.9796278, -1.220745, 1, 0.682353, 0, 1,
-1.206955, -0.1437448, -1.967423, 1, 0.6901961, 0, 1,
-1.206411, -1.033027, -0.2133793, 1, 0.6941177, 0, 1,
-1.201493, 2.573462, -1.571926, 1, 0.7019608, 0, 1,
-1.199577, -0.5997257, -0.5552908, 1, 0.7098039, 0, 1,
-1.199092, -1.834253, -3.195944, 1, 0.7137255, 0, 1,
-1.187943, 1.463825, 1.130232, 1, 0.7215686, 0, 1,
-1.185432, -0.04432819, -0.5546414, 1, 0.7254902, 0, 1,
-1.181204, -0.3268407, -2.289287, 1, 0.7333333, 0, 1,
-1.179953, -1.574992, -2.120066, 1, 0.7372549, 0, 1,
-1.171511, -0.3134262, -1.378208, 1, 0.7450981, 0, 1,
-1.161651, -1.564587, -1.945157, 1, 0.7490196, 0, 1,
-1.154884, -1.836461, -3.637244, 1, 0.7568628, 0, 1,
-1.153885, -2.059514, -3.465029, 1, 0.7607843, 0, 1,
-1.15282, 0.2017548, -1.553518, 1, 0.7686275, 0, 1,
-1.150276, -0.1749478, -0.5844563, 1, 0.772549, 0, 1,
-1.145441, -0.4110381, -2.127224, 1, 0.7803922, 0, 1,
-1.123898, -0.03126297, -2.356663, 1, 0.7843137, 0, 1,
-1.119466, 0.7000581, -1.507783, 1, 0.7921569, 0, 1,
-1.113957, -0.7929338, -1.191838, 1, 0.7960784, 0, 1,
-1.113468, 0.5287798, -1.144123, 1, 0.8039216, 0, 1,
-1.10014, -2.087737, -3.152005, 1, 0.8117647, 0, 1,
-1.099397, -1.587585, -2.102124, 1, 0.8156863, 0, 1,
-1.097025, -0.3837741, -0.3344079, 1, 0.8235294, 0, 1,
-1.094665, -1.379766, -2.553984, 1, 0.827451, 0, 1,
-1.091789, 1.554721, -0.5113968, 1, 0.8352941, 0, 1,
-1.088012, -1.880319, -2.398472, 1, 0.8392157, 0, 1,
-1.081041, -0.8143094, -0.8431048, 1, 0.8470588, 0, 1,
-1.07757, 0.6808166, -1.435923, 1, 0.8509804, 0, 1,
-1.076465, -0.3200942, -1.470421, 1, 0.8588235, 0, 1,
-1.067368, 0.09106257, -1.718664, 1, 0.8627451, 0, 1,
-1.061015, 0.5825166, -0.9574959, 1, 0.8705882, 0, 1,
-1.055365, 1.137278, -1.49007, 1, 0.8745098, 0, 1,
-1.051515, -0.1191634, -4.347149, 1, 0.8823529, 0, 1,
-1.043804, 0.1667615, -1.348213, 1, 0.8862745, 0, 1,
-1.042154, -0.2809488, -2.3826, 1, 0.8941177, 0, 1,
-1.02797, 0.6395057, -2.93766, 1, 0.8980392, 0, 1,
-1.022481, -1.774486, -1.955813, 1, 0.9058824, 0, 1,
-1.016935, 1.021214, 0.6953958, 1, 0.9137255, 0, 1,
-1.01393, -0.7153892, -0.4568399, 1, 0.9176471, 0, 1,
-1.010675, -1.305793, -1.671918, 1, 0.9254902, 0, 1,
-1.000849, -0.4712472, -0.8759367, 1, 0.9294118, 0, 1,
-0.9970596, 1.877854, 0.06185132, 1, 0.9372549, 0, 1,
-0.9948795, -0.790248, -2.71813, 1, 0.9411765, 0, 1,
-0.9928083, -0.5340594, -3.738885, 1, 0.9490196, 0, 1,
-0.9922802, 1.308742, -1.278265, 1, 0.9529412, 0, 1,
-0.9850444, 0.8494006, -0.8247154, 1, 0.9607843, 0, 1,
-0.984571, 0.07885186, -2.658366, 1, 0.9647059, 0, 1,
-0.9832445, 0.03738612, -3.497947, 1, 0.972549, 0, 1,
-0.9814519, -0.5160867, -2.928966, 1, 0.9764706, 0, 1,
-0.9810765, 0.9401802, -0.2735722, 1, 0.9843137, 0, 1,
-0.9717562, -0.5342404, -2.30513, 1, 0.9882353, 0, 1,
-0.9660889, -1.210459, -3.656873, 1, 0.9960784, 0, 1,
-0.960109, -0.7035196, -3.188298, 0.9960784, 1, 0, 1,
-0.9568217, -1.055237, -1.294267, 0.9921569, 1, 0, 1,
-0.9564424, -0.2184852, -1.358742, 0.9843137, 1, 0, 1,
-0.9403369, 0.5429147, -1.862874, 0.9803922, 1, 0, 1,
-0.9347938, 0.2695194, -2.526163, 0.972549, 1, 0, 1,
-0.9332977, -0.6066861, -2.824124, 0.9686275, 1, 0, 1,
-0.9225346, 0.2510745, -0.7069975, 0.9607843, 1, 0, 1,
-0.919322, -0.8575057, -1.717345, 0.9568627, 1, 0, 1,
-0.9171606, 0.147222, -2.309962, 0.9490196, 1, 0, 1,
-0.8921442, -1.199822, -3.76394, 0.945098, 1, 0, 1,
-0.8788378, 0.3079544, -1.05463, 0.9372549, 1, 0, 1,
-0.877386, -0.1507324, -0.2774835, 0.9333333, 1, 0, 1,
-0.8699383, -1.630481, -1.005941, 0.9254902, 1, 0, 1,
-0.8672316, -0.4718954, -0.3079894, 0.9215686, 1, 0, 1,
-0.8663454, 0.5918025, -1.367036, 0.9137255, 1, 0, 1,
-0.8602859, -1.068447, -1.660321, 0.9098039, 1, 0, 1,
-0.8598325, -0.9602928, -2.037314, 0.9019608, 1, 0, 1,
-0.8589295, -0.7663396, -1.235193, 0.8941177, 1, 0, 1,
-0.8575711, -0.6727492, 0.3279362, 0.8901961, 1, 0, 1,
-0.8561558, -0.654647, -2.39872, 0.8823529, 1, 0, 1,
-0.8540198, -0.3628982, -2.334084, 0.8784314, 1, 0, 1,
-0.8529296, 1.431607, -0.679847, 0.8705882, 1, 0, 1,
-0.8455216, -0.02269033, -1.512458, 0.8666667, 1, 0, 1,
-0.8365521, 0.4525968, -0.3706943, 0.8588235, 1, 0, 1,
-0.8330833, -0.6808555, -2.635771, 0.854902, 1, 0, 1,
-0.8304104, 0.5071428, -2.110493, 0.8470588, 1, 0, 1,
-0.8171918, -0.0822023, -2.207559, 0.8431373, 1, 0, 1,
-0.814164, -1.472137, -1.915733, 0.8352941, 1, 0, 1,
-0.8132939, -0.7403715, -2.828145, 0.8313726, 1, 0, 1,
-0.8110106, 0.276816, -0.1834948, 0.8235294, 1, 0, 1,
-0.80838, 0.8173003, -0.202721, 0.8196079, 1, 0, 1,
-0.8083389, -0.10199, -1.92304, 0.8117647, 1, 0, 1,
-0.8081777, -0.5612239, -1.787623, 0.8078431, 1, 0, 1,
-0.8018312, 0.3278097, -0.2980786, 0.8, 1, 0, 1,
-0.7994385, -0.2536189, 1.216013, 0.7921569, 1, 0, 1,
-0.7991806, -0.9906071, -3.839375, 0.7882353, 1, 0, 1,
-0.7959731, 1.544465, -0.8479214, 0.7803922, 1, 0, 1,
-0.7944053, -0.2033504, -1.807684, 0.7764706, 1, 0, 1,
-0.7870024, -0.2191675, -0.6818106, 0.7686275, 1, 0, 1,
-0.785163, -0.4177126, -2.276463, 0.7647059, 1, 0, 1,
-0.7845249, 0.8040536, 1.515206, 0.7568628, 1, 0, 1,
-0.777193, -0.9429953, -1.894931, 0.7529412, 1, 0, 1,
-0.7767297, -0.54145, -1.106314, 0.7450981, 1, 0, 1,
-0.774071, -1.021781, -2.8455, 0.7411765, 1, 0, 1,
-0.7720345, 0.8972615, -0.6747102, 0.7333333, 1, 0, 1,
-0.7652988, -2.205475, -2.27556, 0.7294118, 1, 0, 1,
-0.7626724, -1.798475, -3.674247, 0.7215686, 1, 0, 1,
-0.7612929, -0.6289055, -2.42971, 0.7176471, 1, 0, 1,
-0.7599818, -0.7240301, -3.140695, 0.7098039, 1, 0, 1,
-0.7553528, 0.4157097, -1.380246, 0.7058824, 1, 0, 1,
-0.7532013, -0.9670978, -0.9305392, 0.6980392, 1, 0, 1,
-0.750668, -0.6001897, -0.8613442, 0.6901961, 1, 0, 1,
-0.7417728, 1.375898, -0.7847365, 0.6862745, 1, 0, 1,
-0.7372305, 0.9923812, -0.9254305, 0.6784314, 1, 0, 1,
-0.7302409, 1.633993, 0.08190224, 0.6745098, 1, 0, 1,
-0.7289455, -0.6225775, -1.768167, 0.6666667, 1, 0, 1,
-0.7275735, -0.1050499, -1.809508, 0.6627451, 1, 0, 1,
-0.7237857, -0.7519828, -1.255661, 0.654902, 1, 0, 1,
-0.7203422, 0.5069212, -1.537935, 0.6509804, 1, 0, 1,
-0.7189689, 1.184388, -2.273024, 0.6431373, 1, 0, 1,
-0.7188019, -0.681094, 0.1192942, 0.6392157, 1, 0, 1,
-0.7128732, 0.8262067, -0.1300324, 0.6313726, 1, 0, 1,
-0.7004709, -0.4048597, -2.808423, 0.627451, 1, 0, 1,
-0.6994483, 1.312377, 0.1300872, 0.6196079, 1, 0, 1,
-0.6973543, 0.756111, -1.292484, 0.6156863, 1, 0, 1,
-0.6972827, 0.8475625, 0.01236947, 0.6078432, 1, 0, 1,
-0.6956053, -1.360812, -4.347358, 0.6039216, 1, 0, 1,
-0.6926214, -0.6186879, -2.244314, 0.5960785, 1, 0, 1,
-0.6923271, 2.25368, -0.1449395, 0.5882353, 1, 0, 1,
-0.6834089, 0.4371316, -0.1044559, 0.5843138, 1, 0, 1,
-0.6818071, -2.331084, -3.199031, 0.5764706, 1, 0, 1,
-0.6779323, 0.3890384, -2.247062, 0.572549, 1, 0, 1,
-0.6761253, -0.393438, -2.557344, 0.5647059, 1, 0, 1,
-0.671966, -1.105623, -5.916836, 0.5607843, 1, 0, 1,
-0.6700336, 2.334664, -1.482878, 0.5529412, 1, 0, 1,
-0.6644726, -0.9316739, -1.572677, 0.5490196, 1, 0, 1,
-0.6580529, 0.472322, -1.071293, 0.5411765, 1, 0, 1,
-0.6569698, -1.306756, -0.9620312, 0.5372549, 1, 0, 1,
-0.6564404, -0.2854405, -3.02447, 0.5294118, 1, 0, 1,
-0.6554167, 1.153471, -1.043186, 0.5254902, 1, 0, 1,
-0.6547837, 0.005850933, -0.1927954, 0.5176471, 1, 0, 1,
-0.6546155, 2.007859, -1.654097, 0.5137255, 1, 0, 1,
-0.6546006, 0.1269325, -1.627808, 0.5058824, 1, 0, 1,
-0.6508537, -2.320501, -3.247482, 0.5019608, 1, 0, 1,
-0.6500233, 0.8034099, -0.5606368, 0.4941176, 1, 0, 1,
-0.6494606, -0.7284129, -2.416978, 0.4862745, 1, 0, 1,
-0.6484547, -2.460807, -1.766917, 0.4823529, 1, 0, 1,
-0.6460388, 0.4068756, -2.308849, 0.4745098, 1, 0, 1,
-0.6434705, 0.4919614, 0.0744494, 0.4705882, 1, 0, 1,
-0.641888, -0.3388748, -2.32865, 0.4627451, 1, 0, 1,
-0.6310202, 0.1542052, -1.873433, 0.4588235, 1, 0, 1,
-0.6222219, 0.1521265, -1.983898, 0.4509804, 1, 0, 1,
-0.6199353, 1.249706, -1.196623, 0.4470588, 1, 0, 1,
-0.6138449, -0.5669614, -2.230919, 0.4392157, 1, 0, 1,
-0.5987909, -0.4711322, -1.775472, 0.4352941, 1, 0, 1,
-0.5985017, 0.1995504, 0.4589483, 0.427451, 1, 0, 1,
-0.5946701, -0.3130606, -3.621761, 0.4235294, 1, 0, 1,
-0.5924509, 0.5847718, -1.651443, 0.4156863, 1, 0, 1,
-0.5883603, -1.503889, -2.496956, 0.4117647, 1, 0, 1,
-0.5874366, 0.6752959, 0.1487723, 0.4039216, 1, 0, 1,
-0.5868025, 0.600486, -1.76701, 0.3960784, 1, 0, 1,
-0.5867432, 1.49233, -1.037361, 0.3921569, 1, 0, 1,
-0.5841586, 0.3620968, -0.7793229, 0.3843137, 1, 0, 1,
-0.5840198, -1.530438, -2.284686, 0.3803922, 1, 0, 1,
-0.5808346, -0.6935264, -2.990957, 0.372549, 1, 0, 1,
-0.5769331, -0.2405763, -4.050803, 0.3686275, 1, 0, 1,
-0.5761729, 0.6433523, 0.2736141, 0.3607843, 1, 0, 1,
-0.5735813, 0.4144506, -2.634889, 0.3568628, 1, 0, 1,
-0.5719842, -1.33161, -1.885185, 0.3490196, 1, 0, 1,
-0.5718883, -1.727457, -3.039109, 0.345098, 1, 0, 1,
-0.5686395, -1.974147, -4.452543, 0.3372549, 1, 0, 1,
-0.563782, -0.3149525, -1.523772, 0.3333333, 1, 0, 1,
-0.5589241, 0.3239068, -2.856277, 0.3254902, 1, 0, 1,
-0.5580688, 0.5859309, -2.798741, 0.3215686, 1, 0, 1,
-0.5462446, 0.8681177, 0.1699435, 0.3137255, 1, 0, 1,
-0.5431675, -0.3692803, -1.32778, 0.3098039, 1, 0, 1,
-0.5431064, -0.4843577, -1.465503, 0.3019608, 1, 0, 1,
-0.5408717, 1.146687, 0.9163973, 0.2941177, 1, 0, 1,
-0.5403512, 1.11541, -0.7812994, 0.2901961, 1, 0, 1,
-0.5401917, -0.6993834, -3.569948, 0.282353, 1, 0, 1,
-0.5383816, 0.1110229, 0.9659954, 0.2784314, 1, 0, 1,
-0.5368356, -1.067537, -2.898577, 0.2705882, 1, 0, 1,
-0.5361507, -0.3539772, -3.271024, 0.2666667, 1, 0, 1,
-0.5283223, 0.1129326, -1.061271, 0.2588235, 1, 0, 1,
-0.5232427, -1.141365, -2.296515, 0.254902, 1, 0, 1,
-0.5176547, -1.196495, -4.529028, 0.2470588, 1, 0, 1,
-0.5120424, 0.1751231, -0.8988547, 0.2431373, 1, 0, 1,
-0.5058192, 0.1369636, -1.781898, 0.2352941, 1, 0, 1,
-0.5005572, -0.7116086, -0.311486, 0.2313726, 1, 0, 1,
-0.4957001, 1.177322, -1.351107, 0.2235294, 1, 0, 1,
-0.4955953, 0.4319324, 0.3861323, 0.2196078, 1, 0, 1,
-0.4952398, 1.841302, 1.176647, 0.2117647, 1, 0, 1,
-0.4946117, -0.6902284, -2.079498, 0.2078431, 1, 0, 1,
-0.4936235, -0.1127382, -2.053024, 0.2, 1, 0, 1,
-0.4867436, 1.434954, -0.1880469, 0.1921569, 1, 0, 1,
-0.483627, 1.934809, -2.125818, 0.1882353, 1, 0, 1,
-0.479245, -0.3786243, -1.365589, 0.1803922, 1, 0, 1,
-0.4731316, -0.1481439, -2.299826, 0.1764706, 1, 0, 1,
-0.4726339, -0.4174762, -2.780556, 0.1686275, 1, 0, 1,
-0.4679799, 0.4183907, 1.301315, 0.1647059, 1, 0, 1,
-0.4661344, 1.185867, 0.07332395, 0.1568628, 1, 0, 1,
-0.4625063, -1.279964, -3.615834, 0.1529412, 1, 0, 1,
-0.4586688, -0.637087, -3.68398, 0.145098, 1, 0, 1,
-0.4570486, 0.4720752, 1.05091, 0.1411765, 1, 0, 1,
-0.4484537, 0.1401988, -1.366077, 0.1333333, 1, 0, 1,
-0.4479216, -0.6560401, -2.518863, 0.1294118, 1, 0, 1,
-0.4422464, -0.2898299, -1.700199, 0.1215686, 1, 0, 1,
-0.440651, -0.4792781, -3.469873, 0.1176471, 1, 0, 1,
-0.4342156, 1.512434, -0.6498309, 0.1098039, 1, 0, 1,
-0.4329723, 2.028346, -0.02235418, 0.1058824, 1, 0, 1,
-0.4279903, -1.221528, -3.392961, 0.09803922, 1, 0, 1,
-0.4273275, -1.236901, -0.8595394, 0.09019608, 1, 0, 1,
-0.4255266, 0.4228486, -2.15604, 0.08627451, 1, 0, 1,
-0.4246503, 0.1492325, 0.03818344, 0.07843138, 1, 0, 1,
-0.4245318, -0.5362306, -1.513105, 0.07450981, 1, 0, 1,
-0.423414, 0.4731082, -1.917518, 0.06666667, 1, 0, 1,
-0.4230318, -0.4018582, -3.714902, 0.0627451, 1, 0, 1,
-0.4112079, -0.1462291, -0.5932071, 0.05490196, 1, 0, 1,
-0.4067158, -1.880321, -2.097294, 0.05098039, 1, 0, 1,
-0.4032896, 1.267296, -1.150994, 0.04313726, 1, 0, 1,
-0.4022977, -1.645614, -2.972702, 0.03921569, 1, 0, 1,
-0.4006803, -0.4294995, -2.98982, 0.03137255, 1, 0, 1,
-0.3978914, 0.8477408, -3.279384, 0.02745098, 1, 0, 1,
-0.3976895, -1.178256, -2.43048, 0.01960784, 1, 0, 1,
-0.3897674, 0.4233991, -0.869177, 0.01568628, 1, 0, 1,
-0.3810544, 0.03034217, -1.536968, 0.007843138, 1, 0, 1,
-0.3776453, -1.794804, -2.378707, 0.003921569, 1, 0, 1,
-0.3724896, 0.178994, -0.7986324, 0, 1, 0.003921569, 1,
-0.3722649, 1.201138, 0.4841154, 0, 1, 0.01176471, 1,
-0.3718653, -0.2938413, -2.708845, 0, 1, 0.01568628, 1,
-0.3618248, -0.09585872, -2.629614, 0, 1, 0.02352941, 1,
-0.3616273, 1.726853, -0.1798941, 0, 1, 0.02745098, 1,
-0.3609529, 1.231854, 0.3049154, 0, 1, 0.03529412, 1,
-0.3603533, -1.315868, -1.512238, 0, 1, 0.03921569, 1,
-0.3593605, -1.602895, -5.282658, 0, 1, 0.04705882, 1,
-0.359063, -0.8852928, -3.165974, 0, 1, 0.05098039, 1,
-0.3581016, -0.8250756, -4.145098, 0, 1, 0.05882353, 1,
-0.356836, -1.465921, -3.040396, 0, 1, 0.0627451, 1,
-0.3564665, 1.512346, -0.7724998, 0, 1, 0.07058824, 1,
-0.3543114, 0.3341092, 0.1797002, 0, 1, 0.07450981, 1,
-0.3528534, 0.5910116, -0.4679243, 0, 1, 0.08235294, 1,
-0.3503897, -0.8346626, -2.907648, 0, 1, 0.08627451, 1,
-0.3477736, 1.281789, -1.480618, 0, 1, 0.09411765, 1,
-0.3365046, -0.2659206, -2.443077, 0, 1, 0.1019608, 1,
-0.3341999, 0.6465377, -0.6601023, 0, 1, 0.1058824, 1,
-0.3315941, 0.5709039, -0.1548237, 0, 1, 0.1137255, 1,
-0.331445, 0.3606746, -0.2749255, 0, 1, 0.1176471, 1,
-0.3301873, 0.3598922, 0.6784178, 0, 1, 0.1254902, 1,
-0.3286485, 1.122915, -0.6045774, 0, 1, 0.1294118, 1,
-0.3267395, -0.2452418, -2.438905, 0, 1, 0.1372549, 1,
-0.3204501, 0.5629672, -1.626632, 0, 1, 0.1411765, 1,
-0.3157965, 0.3430085, 0.4326126, 0, 1, 0.1490196, 1,
-0.3122975, 0.5714082, -0.3814786, 0, 1, 0.1529412, 1,
-0.3094991, -0.6670706, -3.999983, 0, 1, 0.1607843, 1,
-0.3067059, -1.738124, -2.376527, 0, 1, 0.1647059, 1,
-0.303555, -0.1787838, -1.054904, 0, 1, 0.172549, 1,
-0.302632, -0.7629344, -2.719913, 0, 1, 0.1764706, 1,
-0.3020589, 0.3549756, -2.333782, 0, 1, 0.1843137, 1,
-0.2948585, -0.4714842, -2.362546, 0, 1, 0.1882353, 1,
-0.2898504, 0.318123, -2.806492, 0, 1, 0.1960784, 1,
-0.2893531, -0.6381176, -4.619633, 0, 1, 0.2039216, 1,
-0.2890906, 0.9257097, -0.1122311, 0, 1, 0.2078431, 1,
-0.2869664, 0.1035479, -2.574553, 0, 1, 0.2156863, 1,
-0.2862893, -0.4116025, -3.469241, 0, 1, 0.2196078, 1,
-0.2828389, 0.898724, -1.638214, 0, 1, 0.227451, 1,
-0.2823213, 1.509354, -0.3612521, 0, 1, 0.2313726, 1,
-0.2794529, -0.3481578, -3.254602, 0, 1, 0.2392157, 1,
-0.2766765, -0.03355337, -1.898941, 0, 1, 0.2431373, 1,
-0.2756508, -1.775565, -4.387746, 0, 1, 0.2509804, 1,
-0.2738806, -1.221058, -4.097369, 0, 1, 0.254902, 1,
-0.271682, -0.9821032, -3.507274, 0, 1, 0.2627451, 1,
-0.2641307, 0.3408804, -1.69261, 0, 1, 0.2666667, 1,
-0.2633906, -0.09265848, -2.462618, 0, 1, 0.2745098, 1,
-0.2613334, 0.547687, -0.6643988, 0, 1, 0.2784314, 1,
-0.2597246, 0.4829246, -3.315447, 0, 1, 0.2862745, 1,
-0.2581684, 0.1240396, -3.083293, 0, 1, 0.2901961, 1,
-0.2572518, 0.02967819, -2.773948, 0, 1, 0.2980392, 1,
-0.2565572, 0.4791109, -0.8189958, 0, 1, 0.3058824, 1,
-0.2519274, -0.2844307, 0.2293241, 0, 1, 0.3098039, 1,
-0.2507684, -0.06363997, -0.9899271, 0, 1, 0.3176471, 1,
-0.248483, -1.175635, -2.361402, 0, 1, 0.3215686, 1,
-0.2446619, 0.7906156, -1.123639, 0, 1, 0.3294118, 1,
-0.2434806, -1.221282, -3.078242, 0, 1, 0.3333333, 1,
-0.2417124, 0.5460766, 0.9432722, 0, 1, 0.3411765, 1,
-0.2372228, -0.1048783, -1.95221, 0, 1, 0.345098, 1,
-0.2347105, -0.5119317, -4.196291, 0, 1, 0.3529412, 1,
-0.2306673, 0.2602589, -0.9156251, 0, 1, 0.3568628, 1,
-0.2298879, 0.2402001, -1.430107, 0, 1, 0.3647059, 1,
-0.2292264, 0.37354, -0.6704902, 0, 1, 0.3686275, 1,
-0.2212565, 2.558822, -2.524228, 0, 1, 0.3764706, 1,
-0.2205003, 0.1788135, -0.3404847, 0, 1, 0.3803922, 1,
-0.2202076, 0.03710022, -1.69638, 0, 1, 0.3882353, 1,
-0.2197442, -0.664911, -1.952804, 0, 1, 0.3921569, 1,
-0.21956, 2.1376, 0.4757735, 0, 1, 0.4, 1,
-0.218577, 0.4152158, 1.313698, 0, 1, 0.4078431, 1,
-0.2146013, 0.3985024, -0.7624659, 0, 1, 0.4117647, 1,
-0.2132666, 0.4381554, 0.4284341, 0, 1, 0.4196078, 1,
-0.2079097, 0.9473079, 0.178093, 0, 1, 0.4235294, 1,
-0.2076974, -0.4570227, -3.383663, 0, 1, 0.4313726, 1,
-0.2064793, -0.3922943, -1.859455, 0, 1, 0.4352941, 1,
-0.2057877, -0.1615285, -0.4839403, 0, 1, 0.4431373, 1,
-0.2049474, -1.123538, -2.555755, 0, 1, 0.4470588, 1,
-0.2026064, -0.82052, -2.116526, 0, 1, 0.454902, 1,
-0.2018535, 0.06127781, 0.4864469, 0, 1, 0.4588235, 1,
-0.1961704, -1.867349, -2.326313, 0, 1, 0.4666667, 1,
-0.1915892, -0.4170392, -2.315471, 0, 1, 0.4705882, 1,
-0.1890778, 0.6242635, 0.1018115, 0, 1, 0.4784314, 1,
-0.1886733, -0.1562855, -1.29492, 0, 1, 0.4823529, 1,
-0.1858006, -0.3342711, -1.366846, 0, 1, 0.4901961, 1,
-0.1852013, -0.2343646, -1.791082, 0, 1, 0.4941176, 1,
-0.1851962, -0.07899749, -0.8385608, 0, 1, 0.5019608, 1,
-0.1810975, 1.189655, -0.8430358, 0, 1, 0.509804, 1,
-0.1806917, -0.2510209, -2.142549, 0, 1, 0.5137255, 1,
-0.1713039, 1.035368, 0.4677144, 0, 1, 0.5215687, 1,
-0.1677974, -0.3133083, -1.738103, 0, 1, 0.5254902, 1,
-0.1620497, -2.309199, -4.557298, 0, 1, 0.5333334, 1,
-0.1567477, 1.579246, -0.2933536, 0, 1, 0.5372549, 1,
-0.1506943, 1.376897, -0.4208433, 0, 1, 0.5450981, 1,
-0.1505759, 0.5133557, -0.5133976, 0, 1, 0.5490196, 1,
-0.1496954, 0.982976, 0.2901162, 0, 1, 0.5568628, 1,
-0.1449018, 0.3179822, -1.332362, 0, 1, 0.5607843, 1,
-0.1421181, -2.612767, -4.157037, 0, 1, 0.5686275, 1,
-0.1398718, -1.388909, -3.18283, 0, 1, 0.572549, 1,
-0.1376082, -0.8986129, -5.961727, 0, 1, 0.5803922, 1,
-0.1317108, -1.518481, -1.607376, 0, 1, 0.5843138, 1,
-0.1276914, -0.08061936, -1.483407, 0, 1, 0.5921569, 1,
-0.125449, -0.8553341, -3.254525, 0, 1, 0.5960785, 1,
-0.1253468, 0.343492, -0.3564427, 0, 1, 0.6039216, 1,
-0.1223549, 0.603943, -1.041904, 0, 1, 0.6117647, 1,
-0.1142261, -0.1739853, -1.254952, 0, 1, 0.6156863, 1,
-0.1108681, 0.2742476, 1.204152, 0, 1, 0.6235294, 1,
-0.1054604, 0.4210741, -0.1558122, 0, 1, 0.627451, 1,
-0.09984834, -0.5900428, -2.443842, 0, 1, 0.6352941, 1,
-0.09233513, -0.5465145, -1.282432, 0, 1, 0.6392157, 1,
-0.08973705, -0.1696194, -3.613852, 0, 1, 0.6470588, 1,
-0.08089755, -0.7721311, -2.234832, 0, 1, 0.6509804, 1,
-0.08000337, 0.512172, 0.8537539, 0, 1, 0.6588235, 1,
-0.07978331, -0.4322243, -2.228133, 0, 1, 0.6627451, 1,
-0.0797328, -0.5174764, -2.780822, 0, 1, 0.6705883, 1,
-0.07907525, -0.01421807, -1.419698, 0, 1, 0.6745098, 1,
-0.0772454, -0.3008527, -4.32792, 0, 1, 0.682353, 1,
-0.07511421, -1.05431, -4.250924, 0, 1, 0.6862745, 1,
-0.07316163, 0.2238208, -1.794371, 0, 1, 0.6941177, 1,
-0.07264072, -0.3954874, -3.727297, 0, 1, 0.7019608, 1,
-0.07188769, -0.672326, -1.792657, 0, 1, 0.7058824, 1,
-0.07068215, 0.1947315, -1.04068, 0, 1, 0.7137255, 1,
-0.06431377, 0.3092021, -1.980363, 0, 1, 0.7176471, 1,
-0.06210401, 1.388044, -0.2604873, 0, 1, 0.7254902, 1,
-0.05848707, 0.3853015, 0.2119441, 0, 1, 0.7294118, 1,
-0.05733002, -1.99263, -4.419573, 0, 1, 0.7372549, 1,
-0.05519465, 0.1220476, -1.680364, 0, 1, 0.7411765, 1,
-0.05152877, -0.01235453, -2.057519, 0, 1, 0.7490196, 1,
-0.04379162, -0.3743012, -3.240006, 0, 1, 0.7529412, 1,
-0.03750385, -1.731833, -3.235956, 0, 1, 0.7607843, 1,
-0.03540346, 0.2159305, -0.5003898, 0, 1, 0.7647059, 1,
-0.03316217, -0.6753737, -2.668777, 0, 1, 0.772549, 1,
-0.02436729, -0.2978288, -4.189536, 0, 1, 0.7764706, 1,
-0.01774199, 0.1441973, -0.8659781, 0, 1, 0.7843137, 1,
-0.01580556, -1.184487, -5.643095, 0, 1, 0.7882353, 1,
-0.01407138, 1.025459, -0.07212918, 0, 1, 0.7960784, 1,
-0.01102647, 0.9916789, -1.327401, 0, 1, 0.8039216, 1,
-0.01090159, -0.465498, -3.338337, 0, 1, 0.8078431, 1,
-0.0107527, -0.5440667, -2.712804, 0, 1, 0.8156863, 1,
-0.009968037, 0.1623875, 0.3041531, 0, 1, 0.8196079, 1,
-0.009920913, 0.3084854, 0.1663524, 0, 1, 0.827451, 1,
-0.00907594, 0.458427, -0.2575808, 0, 1, 0.8313726, 1,
-0.008966953, 0.7125901, -1.68745, 0, 1, 0.8392157, 1,
-0.00567433, 1.450176, 0.8578007, 0, 1, 0.8431373, 1,
-0.001333546, 0.7308182, -0.533433, 0, 1, 0.8509804, 1,
-0.001052545, -0.8470163, -2.616067, 0, 1, 0.854902, 1,
0.006974427, 0.04955483, -1.276125, 0, 1, 0.8627451, 1,
0.0116492, -1.052443, 5.612964, 0, 1, 0.8666667, 1,
0.01829955, -0.8147697, 4.292126, 0, 1, 0.8745098, 1,
0.02001934, -0.3370677, 0.666521, 0, 1, 0.8784314, 1,
0.02250386, 1.182844, 0.2538451, 0, 1, 0.8862745, 1,
0.02565884, 0.3825505, 1.904465, 0, 1, 0.8901961, 1,
0.02600357, 0.2411226, -0.02084923, 0, 1, 0.8980392, 1,
0.02773016, 1.465877, -0.8799133, 0, 1, 0.9058824, 1,
0.03181034, 0.934044, 0.4753964, 0, 1, 0.9098039, 1,
0.03217587, -0.8237843, 3.590522, 0, 1, 0.9176471, 1,
0.03698715, 0.139752, 0.606549, 0, 1, 0.9215686, 1,
0.03955232, 0.5399656, -1.035869, 0, 1, 0.9294118, 1,
0.04259716, 0.4381237, 0.08498684, 0, 1, 0.9333333, 1,
0.04686577, 1.012533, -0.7092351, 0, 1, 0.9411765, 1,
0.05061637, -0.6296206, 4.370053, 0, 1, 0.945098, 1,
0.05180864, 1.448643, 0.4571918, 0, 1, 0.9529412, 1,
0.05423043, -0.03394257, 3.141798, 0, 1, 0.9568627, 1,
0.05885291, 0.7035701, 1.23241, 0, 1, 0.9647059, 1,
0.06520674, -0.3437561, 2.372322, 0, 1, 0.9686275, 1,
0.06724757, -0.3094135, 3.757998, 0, 1, 0.9764706, 1,
0.06780315, -1.894651, 3.130704, 0, 1, 0.9803922, 1,
0.06972871, 0.9972595, -0.5423542, 0, 1, 0.9882353, 1,
0.0698112, -0.4374401, 2.666359, 0, 1, 0.9921569, 1,
0.0717898, 1.594751, 0.8961934, 0, 1, 1, 1,
0.07202127, -0.8693691, 1.19426, 0, 0.9921569, 1, 1,
0.07301768, 0.2538664, -0.04080773, 0, 0.9882353, 1, 1,
0.07387818, 0.2065576, 1.147366, 0, 0.9803922, 1, 1,
0.07690673, -0.1944894, 2.667857, 0, 0.9764706, 1, 1,
0.08015486, -0.5982108, 2.985775, 0, 0.9686275, 1, 1,
0.08502194, -1.038741, 4.132955, 0, 0.9647059, 1, 1,
0.08551087, 1.228568, -0.8118008, 0, 0.9568627, 1, 1,
0.08778144, 0.8423573, -0.005389039, 0, 0.9529412, 1, 1,
0.08780037, 1.283352, -1.73777, 0, 0.945098, 1, 1,
0.0917974, 1.635889, -1.082285, 0, 0.9411765, 1, 1,
0.09260301, -1.205294, 3.686547, 0, 0.9333333, 1, 1,
0.1007641, 0.2921581, -0.6431821, 0, 0.9294118, 1, 1,
0.1035599, 0.605232, 1.116864, 0, 0.9215686, 1, 1,
0.1054885, -0.7916576, 3.623381, 0, 0.9176471, 1, 1,
0.1057095, 1.520824, 1.255489, 0, 0.9098039, 1, 1,
0.1073114, 0.8516893, 0.3072999, 0, 0.9058824, 1, 1,
0.1088179, 0.1535205, 1.144046, 0, 0.8980392, 1, 1,
0.109843, 0.334846, -0.7455677, 0, 0.8901961, 1, 1,
0.1126156, 0.858572, 0.1292854, 0, 0.8862745, 1, 1,
0.1140889, -0.8839867, 4.976091, 0, 0.8784314, 1, 1,
0.1154278, -0.09193609, 1.044494, 0, 0.8745098, 1, 1,
0.1156484, 0.2019363, -0.1040817, 0, 0.8666667, 1, 1,
0.1164444, 0.7950101, -0.8885252, 0, 0.8627451, 1, 1,
0.1212462, 0.4160036, 0.1159266, 0, 0.854902, 1, 1,
0.1234857, 0.08640679, -1.052922, 0, 0.8509804, 1, 1,
0.1282653, -0.2485161, 4.138705, 0, 0.8431373, 1, 1,
0.1312329, 0.6034944, 0.5456628, 0, 0.8392157, 1, 1,
0.1340874, -1.981022, 2.991941, 0, 0.8313726, 1, 1,
0.1352846, 0.001524799, 2.285859, 0, 0.827451, 1, 1,
0.1373135, -0.1207642, 5.08484, 0, 0.8196079, 1, 1,
0.1400841, 0.7323712, -1.16557, 0, 0.8156863, 1, 1,
0.140428, 1.41101, -0.3077207, 0, 0.8078431, 1, 1,
0.1445837, -0.1473656, 0.7457544, 0, 0.8039216, 1, 1,
0.146319, -0.5866697, 2.281834, 0, 0.7960784, 1, 1,
0.1506707, 0.2279328, 2.128777, 0, 0.7882353, 1, 1,
0.1518591, -0.6743329, 4.59178, 0, 0.7843137, 1, 1,
0.1555538, 0.1811547, 0.8438084, 0, 0.7764706, 1, 1,
0.1566395, 0.7464784, -1.455309, 0, 0.772549, 1, 1,
0.1610446, 0.7444118, -0.4577409, 0, 0.7647059, 1, 1,
0.1614069, 1.194895, -1.03063, 0, 0.7607843, 1, 1,
0.1648988, 0.2081846, 1.745319, 0, 0.7529412, 1, 1,
0.1660524, 0.9833847, 0.3216023, 0, 0.7490196, 1, 1,
0.1682878, -0.4077256, 2.908649, 0, 0.7411765, 1, 1,
0.1701394, -0.6887658, 4.025701, 0, 0.7372549, 1, 1,
0.1702409, 1.103056, 0.1369853, 0, 0.7294118, 1, 1,
0.1719383, -0.8335724, 3.090744, 0, 0.7254902, 1, 1,
0.1729303, -2.032265, 0.8918506, 0, 0.7176471, 1, 1,
0.1774949, -0.7705825, 2.47314, 0, 0.7137255, 1, 1,
0.1826076, -0.1814934, 2.65207, 0, 0.7058824, 1, 1,
0.1849533, 1.975164, 1.004912, 0, 0.6980392, 1, 1,
0.1971277, 0.2368836, -0.6913303, 0, 0.6941177, 1, 1,
0.198354, -0.05434307, 2.602925, 0, 0.6862745, 1, 1,
0.2001321, -0.1832242, 2.957636, 0, 0.682353, 1, 1,
0.2020685, 1.279148, -0.07573969, 0, 0.6745098, 1, 1,
0.2040502, -0.1758459, 2.546952, 0, 0.6705883, 1, 1,
0.2089843, -0.6900764, 2.583479, 0, 0.6627451, 1, 1,
0.2132557, -0.03923411, 0.9890078, 0, 0.6588235, 1, 1,
0.2137165, 0.8153488, -0.2202397, 0, 0.6509804, 1, 1,
0.2162529, -0.4722469, 2.409077, 0, 0.6470588, 1, 1,
0.2176939, 0.3364172, -2.603284, 0, 0.6392157, 1, 1,
0.2179205, -0.1865305, 1.794871, 0, 0.6352941, 1, 1,
0.2184002, -0.3864346, 2.518936, 0, 0.627451, 1, 1,
0.2187583, -0.292484, 4.503068, 0, 0.6235294, 1, 1,
0.2205695, -0.8861216, 2.231399, 0, 0.6156863, 1, 1,
0.2235205, -1.089816, 2.64256, 0, 0.6117647, 1, 1,
0.2241827, -0.2570989, 1.659341, 0, 0.6039216, 1, 1,
0.2257165, 0.02554671, 1.561063, 0, 0.5960785, 1, 1,
0.2258749, 0.294163, 0.4638261, 0, 0.5921569, 1, 1,
0.2262634, 0.7542407, 2.701044, 0, 0.5843138, 1, 1,
0.2342748, -0.2857943, 3.942392, 0, 0.5803922, 1, 1,
0.2385332, -0.4266736, 2.778281, 0, 0.572549, 1, 1,
0.2443065, 1.349099, 0.3171377, 0, 0.5686275, 1, 1,
0.244454, 0.9601052, -1.559286, 0, 0.5607843, 1, 1,
0.2528858, 0.211285, 1.82616, 0, 0.5568628, 1, 1,
0.2585101, 0.4046337, 1.426107, 0, 0.5490196, 1, 1,
0.2625203, -0.8707311, 3.538171, 0, 0.5450981, 1, 1,
0.2650485, -0.3236108, 2.836198, 0, 0.5372549, 1, 1,
0.2663065, -1.022296, 3.506777, 0, 0.5333334, 1, 1,
0.2676788, 2.315979, 0.004978533, 0, 0.5254902, 1, 1,
0.280068, 0.8437546, -0.4196918, 0, 0.5215687, 1, 1,
0.2973956, -0.3971734, 1.833818, 0, 0.5137255, 1, 1,
0.3023936, -0.2916894, 2.121899, 0, 0.509804, 1, 1,
0.3031356, -0.9581468, 2.415756, 0, 0.5019608, 1, 1,
0.3059193, -1.165632, 2.906023, 0, 0.4941176, 1, 1,
0.3093532, -0.0315409, 1.759668, 0, 0.4901961, 1, 1,
0.31121, 1.212577, 2.308219, 0, 0.4823529, 1, 1,
0.3134135, 0.7891081, 0.907781, 0, 0.4784314, 1, 1,
0.3161399, 0.03198959, 0.08157171, 0, 0.4705882, 1, 1,
0.3167459, 0.7179977, 0.06638693, 0, 0.4666667, 1, 1,
0.3174138, -0.2233363, 1.872567, 0, 0.4588235, 1, 1,
0.3174683, 0.08294088, 1.075368, 0, 0.454902, 1, 1,
0.3196228, 1.096524, 0.0887759, 0, 0.4470588, 1, 1,
0.3205885, -0.8998559, 2.828965, 0, 0.4431373, 1, 1,
0.3272144, -0.1206764, 1.524299, 0, 0.4352941, 1, 1,
0.3313815, 1.295761, -0.07493162, 0, 0.4313726, 1, 1,
0.3387989, 0.6347565, 0.05539893, 0, 0.4235294, 1, 1,
0.3452795, 0.9249728, 0.4625232, 0, 0.4196078, 1, 1,
0.3516721, -0.2161425, 1.734786, 0, 0.4117647, 1, 1,
0.3517584, -1.22266, 2.698227, 0, 0.4078431, 1, 1,
0.3613811, -0.02899502, 0.977452, 0, 0.4, 1, 1,
0.364159, 0.408515, -1.047627, 0, 0.3921569, 1, 1,
0.3644267, 1.120054, 0.3649795, 0, 0.3882353, 1, 1,
0.3687701, 0.8485502, 1.708272, 0, 0.3803922, 1, 1,
0.37096, 0.5807801, 0.8322209, 0, 0.3764706, 1, 1,
0.3714318, -0.04912588, 1.507555, 0, 0.3686275, 1, 1,
0.379416, -0.7953574, 4.458222, 0, 0.3647059, 1, 1,
0.3814419, -1.802701, 4.002366, 0, 0.3568628, 1, 1,
0.3888375, 0.1991233, 1.406784, 0, 0.3529412, 1, 1,
0.3935602, -0.3341349, 2.511539, 0, 0.345098, 1, 1,
0.3944905, -0.00590009, 1.061808, 0, 0.3411765, 1, 1,
0.3960972, -0.2285748, 1.660424, 0, 0.3333333, 1, 1,
0.3993891, 0.6245033, 1.171937, 0, 0.3294118, 1, 1,
0.4071353, -1.292877, 3.092046, 0, 0.3215686, 1, 1,
0.4082769, 0.2273285, 3.806208, 0, 0.3176471, 1, 1,
0.4121494, -1.752907, 4.172358, 0, 0.3098039, 1, 1,
0.4136707, 0.5618923, 1.175195, 0, 0.3058824, 1, 1,
0.413705, 0.210365, 1.965296, 0, 0.2980392, 1, 1,
0.4141795, -0.01096441, 2.688563, 0, 0.2901961, 1, 1,
0.4153318, -0.1244, 1.456516, 0, 0.2862745, 1, 1,
0.415609, 1.734409, 0.4813927, 0, 0.2784314, 1, 1,
0.4178449, 2.128382, 1.497285, 0, 0.2745098, 1, 1,
0.419374, 0.8387362, 0.5964749, 0, 0.2666667, 1, 1,
0.419845, -2.219755, 5.111347, 0, 0.2627451, 1, 1,
0.4198554, 1.614271, -0.3043253, 0, 0.254902, 1, 1,
0.4212834, 0.9772241, 0.8386537, 0, 0.2509804, 1, 1,
0.4249017, 1.112611, -0.8087109, 0, 0.2431373, 1, 1,
0.4310536, 0.7374363, 0.2587242, 0, 0.2392157, 1, 1,
0.4337746, -0.4089628, 3.116681, 0, 0.2313726, 1, 1,
0.434577, 0.6173577, 0.09405115, 0, 0.227451, 1, 1,
0.4369301, -0.4918517, 2.664108, 0, 0.2196078, 1, 1,
0.4402156, 1.133643, 0.7706546, 0, 0.2156863, 1, 1,
0.4412405, 0.3911689, 0.008592354, 0, 0.2078431, 1, 1,
0.4431675, -0.5875357, 3.029566, 0, 0.2039216, 1, 1,
0.4449993, 0.3568606, 1.318665, 0, 0.1960784, 1, 1,
0.4464165, 0.4596513, 0.2237629, 0, 0.1882353, 1, 1,
0.450573, -0.4653749, 2.982602, 0, 0.1843137, 1, 1,
0.4524161, 0.3521801, 1.186059, 0, 0.1764706, 1, 1,
0.45283, -0.4492043, 2.932476, 0, 0.172549, 1, 1,
0.4589834, 0.696352, 1.408712, 0, 0.1647059, 1, 1,
0.4611176, -0.552272, 3.28795, 0, 0.1607843, 1, 1,
0.4650454, 0.7804875, 0.02748106, 0, 0.1529412, 1, 1,
0.467359, -1.259719, 2.972781, 0, 0.1490196, 1, 1,
0.4685409, -0.2832586, 1.421208, 0, 0.1411765, 1, 1,
0.4728749, -0.6908247, 1.328636, 0, 0.1372549, 1, 1,
0.4767005, 0.4639203, 2.160876, 0, 0.1294118, 1, 1,
0.4797847, 0.6155294, 0.5566926, 0, 0.1254902, 1, 1,
0.480051, -0.7033927, 2.423435, 0, 0.1176471, 1, 1,
0.4808154, 1.126254, 0.5791181, 0, 0.1137255, 1, 1,
0.4808508, -1.297189, 1.86857, 0, 0.1058824, 1, 1,
0.4809374, 0.4232079, 2.182907, 0, 0.09803922, 1, 1,
0.4811641, -0.01460104, 0.3647034, 0, 0.09411765, 1, 1,
0.4866936, 1.934084, 0.7821056, 0, 0.08627451, 1, 1,
0.4897444, -0.385437, 2.898646, 0, 0.08235294, 1, 1,
0.4909844, 0.7909069, 1.018847, 0, 0.07450981, 1, 1,
0.4912962, 0.2842311, 0.1223542, 0, 0.07058824, 1, 1,
0.492477, 1.823676, -1.938762, 0, 0.0627451, 1, 1,
0.4962811, 0.4703132, 0.2060619, 0, 0.05882353, 1, 1,
0.4966419, 0.3096054, 1.739872, 0, 0.05098039, 1, 1,
0.4966546, 0.1622554, 1.457995, 0, 0.04705882, 1, 1,
0.4968601, -0.5628189, 2.916823, 0, 0.03921569, 1, 1,
0.4993727, 1.904955, -0.6611395, 0, 0.03529412, 1, 1,
0.5060962, 0.80812, 1.41399, 0, 0.02745098, 1, 1,
0.5063235, 0.4454335, 0.3428143, 0, 0.02352941, 1, 1,
0.5083669, -1.88652, 1.714868, 0, 0.01568628, 1, 1,
0.5084263, -0.7622743, 2.749748, 0, 0.01176471, 1, 1,
0.5112376, -0.8632597, 4.258433, 0, 0.003921569, 1, 1,
0.5138534, 0.9778773, -0.714489, 0.003921569, 0, 1, 1,
0.5142008, -1.816218, 2.536545, 0.007843138, 0, 1, 1,
0.5251365, -0.06391571, 1.328062, 0.01568628, 0, 1, 1,
0.5258753, -1.175344, 4.707625, 0.01960784, 0, 1, 1,
0.5286184, -1.293284, 1.560138, 0.02745098, 0, 1, 1,
0.5334744, -0.6662499, 2.35588, 0.03137255, 0, 1, 1,
0.5358875, 0.2336004, 2.623604, 0.03921569, 0, 1, 1,
0.5385568, 0.1596872, 1.631451, 0.04313726, 0, 1, 1,
0.5421059, -0.4659041, 2.264062, 0.05098039, 0, 1, 1,
0.5426361, -0.4738113, 1.083327, 0.05490196, 0, 1, 1,
0.5434266, -1.144126, 3.104462, 0.0627451, 0, 1, 1,
0.5440512, -1.432076, 3.041758, 0.06666667, 0, 1, 1,
0.5460761, -0.2493122, 0.3800041, 0.07450981, 0, 1, 1,
0.5463684, -0.1582331, 2.531729, 0.07843138, 0, 1, 1,
0.5499598, -1.861757, 1.600293, 0.08627451, 0, 1, 1,
0.5540949, -0.01525511, -0.03879215, 0.09019608, 0, 1, 1,
0.5574849, -0.3834938, 2.351306, 0.09803922, 0, 1, 1,
0.5579932, 0.9116527, 1.460968, 0.1058824, 0, 1, 1,
0.5612977, 0.8520067, -0.8357926, 0.1098039, 0, 1, 1,
0.5619929, -2.153744, 2.110132, 0.1176471, 0, 1, 1,
0.5625885, 0.1442912, 1.537624, 0.1215686, 0, 1, 1,
0.5626317, 0.5125572, 1.067707, 0.1294118, 0, 1, 1,
0.5665847, 0.2056415, 1.864914, 0.1333333, 0, 1, 1,
0.5691434, 0.8390465, 1.74207, 0.1411765, 0, 1, 1,
0.5703595, -0.8521411, 3.365409, 0.145098, 0, 1, 1,
0.5709826, 0.05799842, 3.383257, 0.1529412, 0, 1, 1,
0.579712, 1.247882, -0.2253531, 0.1568628, 0, 1, 1,
0.5824222, -1.355223, 2.201771, 0.1647059, 0, 1, 1,
0.5836581, -1.231397, 3.291198, 0.1686275, 0, 1, 1,
0.5862999, 1.523087, 2.930417, 0.1764706, 0, 1, 1,
0.5892273, 1.47796, -0.6410323, 0.1803922, 0, 1, 1,
0.5900794, -1.713172, 4.545069, 0.1882353, 0, 1, 1,
0.5900881, 0.4292821, 0.4653471, 0.1921569, 0, 1, 1,
0.5928264, 0.5022227, 1.09312, 0.2, 0, 1, 1,
0.5948936, -0.8810503, 3.032129, 0.2078431, 0, 1, 1,
0.5970665, -0.7800975, 2.967032, 0.2117647, 0, 1, 1,
0.5981786, 0.7884806, 1.036803, 0.2196078, 0, 1, 1,
0.5999099, 1.382531, 1.092564, 0.2235294, 0, 1, 1,
0.602232, 0.7612878, -1.449231, 0.2313726, 0, 1, 1,
0.6078219, -0.218989, 0.6065292, 0.2352941, 0, 1, 1,
0.6109591, -0.1213279, 1.528845, 0.2431373, 0, 1, 1,
0.621344, -0.3532455, 0.7605175, 0.2470588, 0, 1, 1,
0.6295618, -0.002936936, 1.767684, 0.254902, 0, 1, 1,
0.6338203, 1.575093, 0.1717078, 0.2588235, 0, 1, 1,
0.6342993, 1.341118, -0.1217047, 0.2666667, 0, 1, 1,
0.6396387, -0.4351857, 2.046816, 0.2705882, 0, 1, 1,
0.6435825, 0.5524966, -0.2957056, 0.2784314, 0, 1, 1,
0.6441177, -0.09926765, 2.550277, 0.282353, 0, 1, 1,
0.6459396, -1.464539, 2.41429, 0.2901961, 0, 1, 1,
0.6475532, 0.2341776, 2.408593, 0.2941177, 0, 1, 1,
0.6499763, -0.6369627, 1.214863, 0.3019608, 0, 1, 1,
0.6544627, 0.4753698, 0.6013192, 0.3098039, 0, 1, 1,
0.6561427, -0.05407781, 3.717311, 0.3137255, 0, 1, 1,
0.6562722, -0.2013461, 3.166173, 0.3215686, 0, 1, 1,
0.6574859, -0.7513457, 2.227885, 0.3254902, 0, 1, 1,
0.6595421, 0.08369423, 1.824215, 0.3333333, 0, 1, 1,
0.6607444, -2.013044, 1.969811, 0.3372549, 0, 1, 1,
0.6634503, -0.6390171, 2.662855, 0.345098, 0, 1, 1,
0.6638808, -1.249049, 3.637398, 0.3490196, 0, 1, 1,
0.6655711, 0.4512163, 1.394739, 0.3568628, 0, 1, 1,
0.6659878, -1.329258, 3.107457, 0.3607843, 0, 1, 1,
0.6712743, 0.6040298, 0.1751158, 0.3686275, 0, 1, 1,
0.6749483, -0.06529678, 1.281838, 0.372549, 0, 1, 1,
0.6752728, 1.342919, 1.2798, 0.3803922, 0, 1, 1,
0.6781209, 0.5196196, 0.7753087, 0.3843137, 0, 1, 1,
0.6855759, 1.525843, -1.429524, 0.3921569, 0, 1, 1,
0.6858177, 0.006703907, 3.834082, 0.3960784, 0, 1, 1,
0.6870515, 0.3025595, 1.812407, 0.4039216, 0, 1, 1,
0.6876583, -1.374551, 2.352834, 0.4117647, 0, 1, 1,
0.687866, -3.25346, 2.722355, 0.4156863, 0, 1, 1,
0.6895002, -0.7752102, 1.424076, 0.4235294, 0, 1, 1,
0.6916622, 0.4592263, -0.4862019, 0.427451, 0, 1, 1,
0.6950853, -0.6244976, 2.920762, 0.4352941, 0, 1, 1,
0.6956819, -0.9928542, 4.042089, 0.4392157, 0, 1, 1,
0.6999953, 0.9351783, -1.03007, 0.4470588, 0, 1, 1,
0.705894, 0.6872001, 2.181614, 0.4509804, 0, 1, 1,
0.7071464, -0.5152597, 1.972957, 0.4588235, 0, 1, 1,
0.7110071, 0.9368912, 0.6419479, 0.4627451, 0, 1, 1,
0.7127391, -0.3952389, 2.365143, 0.4705882, 0, 1, 1,
0.7144412, -1.221647, 3.959846, 0.4745098, 0, 1, 1,
0.7155146, 0.6751549, 0.7686474, 0.4823529, 0, 1, 1,
0.7180285, -0.6129435, 3.60392, 0.4862745, 0, 1, 1,
0.7269632, -1.684713, 2.331877, 0.4941176, 0, 1, 1,
0.728881, -0.2726661, 2.077415, 0.5019608, 0, 1, 1,
0.7300282, -0.1630503, 2.533488, 0.5058824, 0, 1, 1,
0.7306489, -0.6320716, 1.333195, 0.5137255, 0, 1, 1,
0.7309864, -1.758289, 2.061637, 0.5176471, 0, 1, 1,
0.7318675, -0.5388259, 2.175638, 0.5254902, 0, 1, 1,
0.7346637, 1.815856, 0.309536, 0.5294118, 0, 1, 1,
0.7374818, 0.3297246, 0.9491008, 0.5372549, 0, 1, 1,
0.7378588, 0.6215468, -1.075747, 0.5411765, 0, 1, 1,
0.7399051, 1.522913, 0.8947309, 0.5490196, 0, 1, 1,
0.7442243, 0.6478478, 0.05976509, 0.5529412, 0, 1, 1,
0.7462, 0.8093495, 0.8382596, 0.5607843, 0, 1, 1,
0.7471011, -0.9876896, 1.88255, 0.5647059, 0, 1, 1,
0.7491506, 1.309588, 0.7979159, 0.572549, 0, 1, 1,
0.7503036, 0.03808067, 3.721224, 0.5764706, 0, 1, 1,
0.7504109, -0.8000253, 1.823336, 0.5843138, 0, 1, 1,
0.7532315, -1.4292, 4.277318, 0.5882353, 0, 1, 1,
0.7629884, 0.5652383, 0.9189408, 0.5960785, 0, 1, 1,
0.7660188, 0.928355, 3.246542, 0.6039216, 0, 1, 1,
0.766276, -0.06257086, 2.126402, 0.6078432, 0, 1, 1,
0.772476, 0.717804, 2.110861, 0.6156863, 0, 1, 1,
0.7786804, -0.5765821, 3.269409, 0.6196079, 0, 1, 1,
0.7834765, 0.4014194, 1.146291, 0.627451, 0, 1, 1,
0.7887657, -0.367582, 3.850821, 0.6313726, 0, 1, 1,
0.7922074, 0.2996715, 2.654924, 0.6392157, 0, 1, 1,
0.793577, 0.261169, 1.969019, 0.6431373, 0, 1, 1,
0.794561, -1.934723, 1.174211, 0.6509804, 0, 1, 1,
0.7945685, 0.01457879, 0.278158, 0.654902, 0, 1, 1,
0.7957177, -0.2098953, 1.651085, 0.6627451, 0, 1, 1,
0.7998351, 0.6520492, 1.588707, 0.6666667, 0, 1, 1,
0.8041431, -1.93304, 0.7336816, 0.6745098, 0, 1, 1,
0.8073799, -0.9335263, 2.113089, 0.6784314, 0, 1, 1,
0.8186423, 0.2061919, 0.5882595, 0.6862745, 0, 1, 1,
0.8203192, 0.2459079, -1.46307, 0.6901961, 0, 1, 1,
0.8272227, 1.152907, 2.288048, 0.6980392, 0, 1, 1,
0.827972, -0.2839113, 1.324663, 0.7058824, 0, 1, 1,
0.8333289, 0.05965137, 1.379052, 0.7098039, 0, 1, 1,
0.8405297, 1.20242, 1.53213, 0.7176471, 0, 1, 1,
0.8409024, 2.532858, -0.441276, 0.7215686, 0, 1, 1,
0.8412555, 1.016936, -0.1718152, 0.7294118, 0, 1, 1,
0.8422146, -1.359386, 1.67682, 0.7333333, 0, 1, 1,
0.844321, -0.3378277, 1.729365, 0.7411765, 0, 1, 1,
0.8443686, 0.5082225, 1.678426, 0.7450981, 0, 1, 1,
0.8461257, 0.5793579, 1.733407, 0.7529412, 0, 1, 1,
0.8511609, 0.3454194, 0.8700668, 0.7568628, 0, 1, 1,
0.8574336, -1.271914, 2.756143, 0.7647059, 0, 1, 1,
0.857738, -2.54558, 2.772762, 0.7686275, 0, 1, 1,
0.8632683, 0.00661885, 2.423929, 0.7764706, 0, 1, 1,
0.864107, 0.8356249, -0.4213715, 0.7803922, 0, 1, 1,
0.8743204, 0.6629591, 2.114156, 0.7882353, 0, 1, 1,
0.8908175, -0.6672455, 0.4654325, 0.7921569, 0, 1, 1,
0.8921358, 1.062735, 0.3554745, 0.8, 0, 1, 1,
0.893683, -0.1072716, -0.04607227, 0.8078431, 0, 1, 1,
0.8942607, -0.6050765, 2.585898, 0.8117647, 0, 1, 1,
0.8973126, 0.05766394, 1.846278, 0.8196079, 0, 1, 1,
0.9008921, 2.246949, 0.3200952, 0.8235294, 0, 1, 1,
0.9069754, -0.2553075, 2.730222, 0.8313726, 0, 1, 1,
0.9077113, -0.5273658, 2.924972, 0.8352941, 0, 1, 1,
0.9091572, -0.4051381, 1.736177, 0.8431373, 0, 1, 1,
0.9141501, -0.59068, 1.58994, 0.8470588, 0, 1, 1,
0.9155082, 1.40998, 1.191851, 0.854902, 0, 1, 1,
0.920755, -0.180332, 2.635078, 0.8588235, 0, 1, 1,
0.9245473, 1.350924, 1.973672, 0.8666667, 0, 1, 1,
0.925113, 0.354259, 1.122438, 0.8705882, 0, 1, 1,
0.9283065, -0.4215031, 3.978999, 0.8784314, 0, 1, 1,
0.9474979, -0.225527, 1.510799, 0.8823529, 0, 1, 1,
0.95704, -1.039126, 0.9279465, 0.8901961, 0, 1, 1,
0.9617009, -0.009883875, 1.908716, 0.8941177, 0, 1, 1,
0.962544, 1.108893, 2.29251, 0.9019608, 0, 1, 1,
0.9678075, -0.8208636, 1.733892, 0.9098039, 0, 1, 1,
0.9731003, -0.7689847, 0.3349105, 0.9137255, 0, 1, 1,
0.9745944, 0.405009, 0.4980999, 0.9215686, 0, 1, 1,
0.9807597, 0.4514149, 0.5794001, 0.9254902, 0, 1, 1,
0.9857334, -0.3105874, 1.881988, 0.9333333, 0, 1, 1,
0.9902307, 0.6845825, -0.2844203, 0.9372549, 0, 1, 1,
0.9981253, -0.3629251, 2.392446, 0.945098, 0, 1, 1,
0.9987277, 0.3740138, 1.358005, 0.9490196, 0, 1, 1,
1.002454, 0.1767198, 0.6143876, 0.9568627, 0, 1, 1,
1.007288, 0.1949786, 1.563916, 0.9607843, 0, 1, 1,
1.011025, 2.225242, 0.7403814, 0.9686275, 0, 1, 1,
1.016061, -0.0594901, 2.325017, 0.972549, 0, 1, 1,
1.017196, -0.2388424, 2.187503, 0.9803922, 0, 1, 1,
1.019349, -0.397046, 0.5805617, 0.9843137, 0, 1, 1,
1.027434, -0.8757084, 3.42146, 0.9921569, 0, 1, 1,
1.043056, 0.1736079, 3.622735, 0.9960784, 0, 1, 1,
1.047738, -0.1609274, 1.381316, 1, 0, 0.9960784, 1,
1.054252, 0.2854813, 0.08185222, 1, 0, 0.9882353, 1,
1.055197, -0.297798, 1.245088, 1, 0, 0.9843137, 1,
1.064123, 0.8770516, -0.3875484, 1, 0, 0.9764706, 1,
1.065824, 0.6160972, 1.489157, 1, 0, 0.972549, 1,
1.074981, -0.004391829, 2.670028, 1, 0, 0.9647059, 1,
1.079087, -2.132323, 0.4303803, 1, 0, 0.9607843, 1,
1.092934, 1.430497, 1.122151, 1, 0, 0.9529412, 1,
1.093199, 0.1970921, 1.655612, 1, 0, 0.9490196, 1,
1.093663, -0.7314805, 2.290768, 1, 0, 0.9411765, 1,
1.097736, 1.728986, 1.576345, 1, 0, 0.9372549, 1,
1.104482, 1.15169, 0.7408282, 1, 0, 0.9294118, 1,
1.106537, 1.434665, -0.7110977, 1, 0, 0.9254902, 1,
1.109212, -0.06438234, 2.156198, 1, 0, 0.9176471, 1,
1.110054, 0.04236772, 1.954045, 1, 0, 0.9137255, 1,
1.113391, 0.946438, -0.9164315, 1, 0, 0.9058824, 1,
1.116703, -1.016635, 2.111707, 1, 0, 0.9019608, 1,
1.118051, -2.556667, 2.28586, 1, 0, 0.8941177, 1,
1.119723, -0.5066931, 2.205667, 1, 0, 0.8862745, 1,
1.119935, 1.216094, 1.416985, 1, 0, 0.8823529, 1,
1.125904, -1.167956, 4.442837, 1, 0, 0.8745098, 1,
1.130517, 0.5587749, 2.842646, 1, 0, 0.8705882, 1,
1.132174, 0.5414602, 3.271223, 1, 0, 0.8627451, 1,
1.133747, -1.941259, 2.011555, 1, 0, 0.8588235, 1,
1.134582, 0.3730317, 1.470632, 1, 0, 0.8509804, 1,
1.140083, -0.4566962, 1.928327, 1, 0, 0.8470588, 1,
1.142627, 0.05274429, 1.148913, 1, 0, 0.8392157, 1,
1.142801, -0.6731453, 1.335099, 1, 0, 0.8352941, 1,
1.148147, -0.1727008, 1.482266, 1, 0, 0.827451, 1,
1.156015, -0.03780272, 3.282657, 1, 0, 0.8235294, 1,
1.159649, 0.3577527, 0.02863897, 1, 0, 0.8156863, 1,
1.166526, 0.09660097, 3.456352, 1, 0, 0.8117647, 1,
1.168747, -0.01433792, 2.625647, 1, 0, 0.8039216, 1,
1.171257, 0.5046484, 2.213836, 1, 0, 0.7960784, 1,
1.174954, -0.2559319, 1.109565, 1, 0, 0.7921569, 1,
1.181082, 0.7435467, 0.5913114, 1, 0, 0.7843137, 1,
1.182089, 0.986822, 0.6921608, 1, 0, 0.7803922, 1,
1.18328, -2.264193, 3.226676, 1, 0, 0.772549, 1,
1.189844, -0.712492, 3.399067, 1, 0, 0.7686275, 1,
1.191265, -0.174011, 1.033239, 1, 0, 0.7607843, 1,
1.191849, 1.291692, 0.6010867, 1, 0, 0.7568628, 1,
1.195057, -1.613513, 2.109207, 1, 0, 0.7490196, 1,
1.200493, -0.9160905, 1.915444, 1, 0, 0.7450981, 1,
1.204341, -0.4022072, 1.770033, 1, 0, 0.7372549, 1,
1.213122, 0.1151232, 1.487019, 1, 0, 0.7333333, 1,
1.213545, -1.011746, 1.784471, 1, 0, 0.7254902, 1,
1.223492, -0.2310834, 2.795014, 1, 0, 0.7215686, 1,
1.223686, 0.7749774, 0.01741588, 1, 0, 0.7137255, 1,
1.225395, -1.151468, 1.335027, 1, 0, 0.7098039, 1,
1.231316, 0.2098563, 1.2883, 1, 0, 0.7019608, 1,
1.231923, -0.8263041, 2.320834, 1, 0, 0.6941177, 1,
1.237212, 0.3615291, 2.102155, 1, 0, 0.6901961, 1,
1.245582, 0.7909943, 1.156287, 1, 0, 0.682353, 1,
1.248906, -0.3633817, 4.981299, 1, 0, 0.6784314, 1,
1.254329, -0.1533866, 2.000864, 1, 0, 0.6705883, 1,
1.25446, 0.2623844, 2.52217, 1, 0, 0.6666667, 1,
1.258384, 0.9748112, -0.2482343, 1, 0, 0.6588235, 1,
1.259175, 1.278351, -0.05847729, 1, 0, 0.654902, 1,
1.267141, 0.03049173, 1.620547, 1, 0, 0.6470588, 1,
1.27532, -0.0889992, 4.383861, 1, 0, 0.6431373, 1,
1.299064, 0.3633537, 2.297216, 1, 0, 0.6352941, 1,
1.301763, 1.423619, -1.076844, 1, 0, 0.6313726, 1,
1.306093, -0.6085724, 3.414798, 1, 0, 0.6235294, 1,
1.307181, 1.914512, -0.4802615, 1, 0, 0.6196079, 1,
1.310248, 1.046625, 0.4016409, 1, 0, 0.6117647, 1,
1.315682, -1.495071, 0.7955543, 1, 0, 0.6078432, 1,
1.315756, -0.5072107, 1.879284, 1, 0, 0.6, 1,
1.319601, 0.3604436, 0.4276825, 1, 0, 0.5921569, 1,
1.323073, 0.6051852, 0.04780825, 1, 0, 0.5882353, 1,
1.328352, 0.2384125, 1.318125, 1, 0, 0.5803922, 1,
1.332876, -1.586281, 4.521689, 1, 0, 0.5764706, 1,
1.340066, -0.7836334, 2.482736, 1, 0, 0.5686275, 1,
1.341479, -0.3693526, 1.64445, 1, 0, 0.5647059, 1,
1.348334, 1.062506, 0.5624698, 1, 0, 0.5568628, 1,
1.348581, -0.05747685, 2.072992, 1, 0, 0.5529412, 1,
1.351919, -0.05603192, 0.3440188, 1, 0, 0.5450981, 1,
1.365505, -0.7832721, 3.706872, 1, 0, 0.5411765, 1,
1.377649, -1.025234, 1.746397, 1, 0, 0.5333334, 1,
1.382334, 0.2019925, 1.056036, 1, 0, 0.5294118, 1,
1.391989, -0.3028497, 1.039778, 1, 0, 0.5215687, 1,
1.404198, -0.3697895, 1.479343, 1, 0, 0.5176471, 1,
1.408394, -0.01002026, -1.239536, 1, 0, 0.509804, 1,
1.410084, 0.1704174, 2.978053, 1, 0, 0.5058824, 1,
1.418622, 0.5929448, 1.900948, 1, 0, 0.4980392, 1,
1.434572, 0.6978973, -1.522911, 1, 0, 0.4901961, 1,
1.435376, -0.7999478, 3.962217, 1, 0, 0.4862745, 1,
1.441336, -0.6406446, 3.009861, 1, 0, 0.4784314, 1,
1.447781, -0.2457691, 1.396263, 1, 0, 0.4745098, 1,
1.458725, -1.559193, 3.154461, 1, 0, 0.4666667, 1,
1.462681, -0.5891424, 0.7483582, 1, 0, 0.4627451, 1,
1.468802, 1.025463, 0.8368998, 1, 0, 0.454902, 1,
1.470146, 0.2828755, -0.2127256, 1, 0, 0.4509804, 1,
1.471316, -1.244428, 1.42107, 1, 0, 0.4431373, 1,
1.483413, -0.4070908, 1.310358, 1, 0, 0.4392157, 1,
1.490446, -0.6049104, 3.762998, 1, 0, 0.4313726, 1,
1.49301, 0.9002214, -0.20385, 1, 0, 0.427451, 1,
1.49686, 1.312256, 1.34067, 1, 0, 0.4196078, 1,
1.498208, 0.6736605, 1.796265, 1, 0, 0.4156863, 1,
1.500875, 0.224412, 1.536736, 1, 0, 0.4078431, 1,
1.505693, 0.1373589, 2.19626, 1, 0, 0.4039216, 1,
1.508603, 1.124385, 1.228597, 1, 0, 0.3960784, 1,
1.521029, 0.4924283, 0.8822895, 1, 0, 0.3882353, 1,
1.530157, 1.027309, 0.1150607, 1, 0, 0.3843137, 1,
1.537441, -0.4955895, 1.950811, 1, 0, 0.3764706, 1,
1.539017, 1.766543, 1.854266, 1, 0, 0.372549, 1,
1.540972, 1.731202, 1.441081, 1, 0, 0.3647059, 1,
1.562273, -0.327801, 4.17797, 1, 0, 0.3607843, 1,
1.568655, -0.05886561, 1.188486, 1, 0, 0.3529412, 1,
1.592108, -0.9389534, 4.365683, 1, 0, 0.3490196, 1,
1.593679, -1.089281, 1.167362, 1, 0, 0.3411765, 1,
1.615616, -0.3595348, 3.177863, 1, 0, 0.3372549, 1,
1.615851, -0.723528, 2.583206, 1, 0, 0.3294118, 1,
1.625595, -0.3475776, 2.431717, 1, 0, 0.3254902, 1,
1.649118, 0.07303506, 2.465977, 1, 0, 0.3176471, 1,
1.654283, 0.1807861, 2.177176, 1, 0, 0.3137255, 1,
1.669464, 1.201874, 1.06804, 1, 0, 0.3058824, 1,
1.677037, -0.8130176, 1.750294, 1, 0, 0.2980392, 1,
1.683844, -1.583715, 1.739359, 1, 0, 0.2941177, 1,
1.686586, 1.412809, -0.2253232, 1, 0, 0.2862745, 1,
1.689589, -0.6510623, 1.998825, 1, 0, 0.282353, 1,
1.699257, 2.257397, 1.062011, 1, 0, 0.2745098, 1,
1.711918, 0.323319, 1.736811, 1, 0, 0.2705882, 1,
1.722271, 1.678207, 2.856319, 1, 0, 0.2627451, 1,
1.728955, 0.001031434, 0.3260804, 1, 0, 0.2588235, 1,
1.736567, -0.5895934, 2.169978, 1, 0, 0.2509804, 1,
1.750533, 0.6704127, 2.042209, 1, 0, 0.2470588, 1,
1.752668, -1.079924, 0.8575393, 1, 0, 0.2392157, 1,
1.758919, 0.5479602, 0.453503, 1, 0, 0.2352941, 1,
1.761399, -0.5771375, 2.29081, 1, 0, 0.227451, 1,
1.761653, -0.7107975, 1.327933, 1, 0, 0.2235294, 1,
1.764657, -0.6320456, 1.386736, 1, 0, 0.2156863, 1,
1.785173, 1.593747, -1.339511, 1, 0, 0.2117647, 1,
1.786829, -2.375299, 2.257228, 1, 0, 0.2039216, 1,
1.791191, 0.7981733, 1.667206, 1, 0, 0.1960784, 1,
1.84379, -0.9152108, 0.8936924, 1, 0, 0.1921569, 1,
1.865413, 0.280568, 1.162423, 1, 0, 0.1843137, 1,
1.880794, 0.5865893, 1.560097, 1, 0, 0.1803922, 1,
1.89405, -1.718499, 1.988754, 1, 0, 0.172549, 1,
1.894331, -0.09893682, 0.7052387, 1, 0, 0.1686275, 1,
1.902983, 1.312232, 2.031675, 1, 0, 0.1607843, 1,
1.943265, 0.1915765, 0.9524745, 1, 0, 0.1568628, 1,
1.947827, -1.966545, 3.368247, 1, 0, 0.1490196, 1,
1.956873, 0.4649378, 0.5463024, 1, 0, 0.145098, 1,
1.965751, -0.9583918, 3.292625, 1, 0, 0.1372549, 1,
1.979624, -0.5928437, 3.357778, 1, 0, 0.1333333, 1,
1.986048, 0.8651322, -0.3812834, 1, 0, 0.1254902, 1,
2.004223, -1.10704, 2.546799, 1, 0, 0.1215686, 1,
2.048811, 0.1661442, 0.6327901, 1, 0, 0.1137255, 1,
2.050472, -0.816288, 0.03681453, 1, 0, 0.1098039, 1,
2.061811, -1.981219, 1.031986, 1, 0, 0.1019608, 1,
2.118694, 1.027473, 2.073857, 1, 0, 0.09411765, 1,
2.143236, -0.1542408, 2.171141, 1, 0, 0.09019608, 1,
2.229767, -0.9071016, 1.138271, 1, 0, 0.08235294, 1,
2.291937, 0.4496867, 2.61406, 1, 0, 0.07843138, 1,
2.304214, -0.07417549, 1.684369, 1, 0, 0.07058824, 1,
2.340549, -0.8127697, 0.3047076, 1, 0, 0.06666667, 1,
2.361898, 1.243733, 0.5015816, 1, 0, 0.05882353, 1,
2.408317, -0.16822, 2.097319, 1, 0, 0.05490196, 1,
2.432998, -0.8412484, 3.032784, 1, 0, 0.04705882, 1,
2.435656, -1.882996, 0.7346627, 1, 0, 0.04313726, 1,
2.514283, -2.573949, 2.384636, 1, 0, 0.03529412, 1,
2.574116, -0.8917293, 0.7896974, 1, 0, 0.03137255, 1,
2.584246, 0.1857922, 1.076812, 1, 0, 0.02352941, 1,
2.59748, 0.8571423, 2.415364, 1, 0, 0.01960784, 1,
2.641925, 0.5376853, 2.001509, 1, 0, 0.01176471, 1,
2.67019, -0.7405174, 1.381366, 1, 0, 0.007843138, 1
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
-0.4821472, -4.33168, -7.923637, 0, -0.5, 0.5, 0.5,
-0.4821472, -4.33168, -7.923637, 1, -0.5, 0.5, 0.5,
-0.4821472, -4.33168, -7.923637, 1, 1.5, 0.5, 0.5,
-0.4821472, -4.33168, -7.923637, 0, 1.5, 0.5, 0.5
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
-4.703127, -0.07287049, -7.923637, 0, -0.5, 0.5, 0.5,
-4.703127, -0.07287049, -7.923637, 1, -0.5, 0.5, 0.5,
-4.703127, -0.07287049, -7.923637, 1, 1.5, 0.5, 0.5,
-4.703127, -0.07287049, -7.923637, 0, 1.5, 0.5, 0.5
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
-4.703127, -4.33168, -0.1743815, 0, -0.5, 0.5, 0.5,
-4.703127, -4.33168, -0.1743815, 1, -0.5, 0.5, 0.5,
-4.703127, -4.33168, -0.1743815, 1, 1.5, 0.5, 0.5,
-4.703127, -4.33168, -0.1743815, 0, 1.5, 0.5, 0.5
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
-3, -3.348878, -6.135347,
2, -3.348878, -6.135347,
-3, -3.348878, -6.135347,
-3, -3.512678, -6.433395,
-2, -3.348878, -6.135347,
-2, -3.512678, -6.433395,
-1, -3.348878, -6.135347,
-1, -3.512678, -6.433395,
0, -3.348878, -6.135347,
0, -3.512678, -6.433395,
1, -3.348878, -6.135347,
1, -3.512678, -6.433395,
2, -3.348878, -6.135347,
2, -3.512678, -6.433395
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
-3, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
-3, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
-3, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
-3, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5,
-2, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
-2, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
-2, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
-2, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5,
-1, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
-1, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
-1, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
-1, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5,
0, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
0, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
0, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
0, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5,
1, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
1, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
1, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
1, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5,
2, -3.840279, -7.029492, 0, -0.5, 0.5, 0.5,
2, -3.840279, -7.029492, 1, -0.5, 0.5, 0.5,
2, -3.840279, -7.029492, 1, 1.5, 0.5, 0.5,
2, -3.840279, -7.029492, 0, 1.5, 0.5, 0.5
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
-3.729055, -3, -6.135347,
-3.729055, 3, -6.135347,
-3.729055, -3, -6.135347,
-3.8914, -3, -6.433395,
-3.729055, -2, -6.135347,
-3.8914, -2, -6.433395,
-3.729055, -1, -6.135347,
-3.8914, -1, -6.433395,
-3.729055, 0, -6.135347,
-3.8914, 0, -6.433395,
-3.729055, 1, -6.135347,
-3.8914, 1, -6.433395,
-3.729055, 2, -6.135347,
-3.8914, 2, -6.433395,
-3.729055, 3, -6.135347,
-3.8914, 3, -6.433395
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
-4.216091, -3, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, -3, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, -3, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, -3, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, -2, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, -2, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, -2, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, -2, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, -1, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, -1, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, -1, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, -1, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, 0, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, 0, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, 0, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, 0, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, 1, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, 1, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, 1, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, 1, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, 2, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, 2, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, 2, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, 2, -7.029492, 0, 1.5, 0.5, 0.5,
-4.216091, 3, -7.029492, 0, -0.5, 0.5, 0.5,
-4.216091, 3, -7.029492, 1, -0.5, 0.5, 0.5,
-4.216091, 3, -7.029492, 1, 1.5, 0.5, 0.5,
-4.216091, 3, -7.029492, 0, 1.5, 0.5, 0.5
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
-3.729055, -3.348878, -4,
-3.729055, -3.348878, 4,
-3.729055, -3.348878, -4,
-3.8914, -3.512678, -4,
-3.729055, -3.348878, -2,
-3.8914, -3.512678, -2,
-3.729055, -3.348878, 0,
-3.8914, -3.512678, 0,
-3.729055, -3.348878, 2,
-3.8914, -3.512678, 2,
-3.729055, -3.348878, 4,
-3.8914, -3.512678, 4
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
-4.216091, -3.840279, -4, 0, -0.5, 0.5, 0.5,
-4.216091, -3.840279, -4, 1, -0.5, 0.5, 0.5,
-4.216091, -3.840279, -4, 1, 1.5, 0.5, 0.5,
-4.216091, -3.840279, -4, 0, 1.5, 0.5, 0.5,
-4.216091, -3.840279, -2, 0, -0.5, 0.5, 0.5,
-4.216091, -3.840279, -2, 1, -0.5, 0.5, 0.5,
-4.216091, -3.840279, -2, 1, 1.5, 0.5, 0.5,
-4.216091, -3.840279, -2, 0, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 0, 0, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 0, 1, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 0, 1, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 0, 0, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 2, 0, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 2, 1, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 2, 1, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 2, 0, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 4, 0, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 4, 1, -0.5, 0.5, 0.5,
-4.216091, -3.840279, 4, 1, 1.5, 0.5, 0.5,
-4.216091, -3.840279, 4, 0, 1.5, 0.5, 0.5
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
-3.729055, -3.348878, -6.135347,
-3.729055, 3.203137, -6.135347,
-3.729055, -3.348878, 5.786584,
-3.729055, 3.203137, 5.786584,
-3.729055, -3.348878, -6.135347,
-3.729055, -3.348878, 5.786584,
-3.729055, 3.203137, -6.135347,
-3.729055, 3.203137, 5.786584,
-3.729055, -3.348878, -6.135347,
2.76476, -3.348878, -6.135347,
-3.729055, -3.348878, 5.786584,
2.76476, -3.348878, 5.786584,
-3.729055, 3.203137, -6.135347,
2.76476, 3.203137, -6.135347,
-3.729055, 3.203137, 5.786584,
2.76476, 3.203137, 5.786584,
2.76476, -3.348878, -6.135347,
2.76476, 3.203137, -6.135347,
2.76476, -3.348878, 5.786584,
2.76476, 3.203137, 5.786584,
2.76476, -3.348878, -6.135347,
2.76476, -3.348878, 5.786584,
2.76476, 3.203137, -6.135347,
2.76476, 3.203137, 5.786584
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
var radius = 8.049321;
var distance = 35.81234;
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
mvMatrix.translate( 0.4821472, 0.07287049, 0.1743815 );
mvMatrix.scale( 1.340211, 1.328306, 0.7300062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81234);
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
isazofos<-read.table("isazofos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isazofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
```

```r
y<-isazofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
```

```r
z<-isazofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'isazofos' not found
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
-3.634485, -0.03806319, -2.615855, 0, 0, 1, 1, 1,
-2.602285, -1.045096, -2.514025, 1, 0, 0, 1, 1,
-2.513386, -0.01028154, -1.234687, 1, 0, 0, 1, 1,
-2.364431, 0.160803, -2.837378, 1, 0, 0, 1, 1,
-2.347148, -1.629308, -2.197798, 1, 0, 0, 1, 1,
-2.328035, -0.8667021, -1.320223, 1, 0, 0, 1, 1,
-2.294669, -0.7014696, -1.984393, 0, 0, 0, 1, 1,
-2.255888, -1.872244, -3.29722, 0, 0, 0, 1, 1,
-2.229154, -1.838185, -0.3274969, 0, 0, 0, 1, 1,
-2.21314, 0.3252228, 0.04500033, 0, 0, 0, 1, 1,
-2.18706, 0.1090291, -1.617358, 0, 0, 0, 1, 1,
-2.163916, 0.8055353, -0.5913763, 0, 0, 0, 1, 1,
-2.144396, -1.238817, -4.475237, 0, 0, 0, 1, 1,
-2.129711, 1.266032, 0.4740644, 1, 1, 1, 1, 1,
-2.063866, -0.730153, -1.487262, 1, 1, 1, 1, 1,
-2.054085, -1.031408, -1.757096, 1, 1, 1, 1, 1,
-2.044983, -0.01178401, -1.960918, 1, 1, 1, 1, 1,
-2.001337, 0.004793652, -3.907958, 1, 1, 1, 1, 1,
-1.980893, 0.7295486, -2.29829, 1, 1, 1, 1, 1,
-1.971426, -0.3621312, -0.9585047, 1, 1, 1, 1, 1,
-1.962259, -0.4589206, -1.939642, 1, 1, 1, 1, 1,
-1.954338, 1.118651, 0.01586863, 1, 1, 1, 1, 1,
-1.942604, 0.7207569, -2.66022, 1, 1, 1, 1, 1,
-1.874066, 0.9333921, -0.3560404, 1, 1, 1, 1, 1,
-1.842204, -0.5053901, -2.935977, 1, 1, 1, 1, 1,
-1.832239, -0.3709227, -1.970663, 1, 1, 1, 1, 1,
-1.821347, 0.5556686, -2.631516, 1, 1, 1, 1, 1,
-1.790866, 1.602652, -0.8360911, 1, 1, 1, 1, 1,
-1.770169, -0.3269777, -1.838007, 0, 0, 1, 1, 1,
-1.744704, 0.5490773, -1.672883, 1, 0, 0, 1, 1,
-1.714872, -0.1708968, -1.521162, 1, 0, 0, 1, 1,
-1.713533, -0.2268362, -3.016209, 1, 0, 0, 1, 1,
-1.703058, -0.007212376, -1.491926, 1, 0, 0, 1, 1,
-1.694619, -0.93348, -2.230516, 1, 0, 0, 1, 1,
-1.684614, 0.1723548, -0.6707138, 0, 0, 0, 1, 1,
-1.683384, 1.693698, -0.6612903, 0, 0, 0, 1, 1,
-1.67971, -0.1726334, -1.588242, 0, 0, 0, 1, 1,
-1.673901, 0.8533045, -2.506615, 0, 0, 0, 1, 1,
-1.672235, 0.01826525, -1.055127, 0, 0, 0, 1, 1,
-1.67168, -0.8859854, -3.259123, 0, 0, 0, 1, 1,
-1.670534, -0.07139537, -1.535776, 0, 0, 0, 1, 1,
-1.662961, 0.2780571, -1.523769, 1, 1, 1, 1, 1,
-1.644592, -1.033327, -2.315203, 1, 1, 1, 1, 1,
-1.637786, 0.3050791, -0.597611, 1, 1, 1, 1, 1,
-1.625425, -0.2283136, -1.366874, 1, 1, 1, 1, 1,
-1.622478, -1.343037, -2.815369, 1, 1, 1, 1, 1,
-1.603109, 0.9442722, -1.240508, 1, 1, 1, 1, 1,
-1.598271, 1.726243, -0.6304465, 1, 1, 1, 1, 1,
-1.592547, 0.6080541, -2.220574, 1, 1, 1, 1, 1,
-1.590624, -0.8700405, -2.055401, 1, 1, 1, 1, 1,
-1.572836, -0.03112799, -0.9807689, 1, 1, 1, 1, 1,
-1.552038, 0.08529323, -1.883115, 1, 1, 1, 1, 1,
-1.533289, 0.1444321, 0.3765744, 1, 1, 1, 1, 1,
-1.533187, -0.0983614, -1.914882, 1, 1, 1, 1, 1,
-1.532107, 0.2361978, -1.604206, 1, 1, 1, 1, 1,
-1.529672, 0.5769467, -0.7813382, 1, 1, 1, 1, 1,
-1.529347, 0.9575922, 0.1709052, 0, 0, 1, 1, 1,
-1.528269, -0.7403221, -2.216766, 1, 0, 0, 1, 1,
-1.527317, 1.795589, -0.1872782, 1, 0, 0, 1, 1,
-1.519715, -1.207615, -2.892752, 1, 0, 0, 1, 1,
-1.516313, 1.382866, -0.2635512, 1, 0, 0, 1, 1,
-1.511422, -0.8638917, -3.047402, 1, 0, 0, 1, 1,
-1.510545, 0.5148497, -1.638891, 0, 0, 0, 1, 1,
-1.489825, 1.150645, -1.105696, 0, 0, 0, 1, 1,
-1.486303, -1.569469, -1.816669, 0, 0, 0, 1, 1,
-1.483308, -1.817857, -1.362615, 0, 0, 0, 1, 1,
-1.482921, -0.6283849, -3.003571, 0, 0, 0, 1, 1,
-1.475458, 1.033765, -0.1596124, 0, 0, 0, 1, 1,
-1.467726, 0.7116908, -0.4214868, 0, 0, 0, 1, 1,
-1.455197, 0.1349721, -1.719182, 1, 1, 1, 1, 1,
-1.452336, 0.3620621, 1.497224, 1, 1, 1, 1, 1,
-1.447866, -1.541849, -2.204434, 1, 1, 1, 1, 1,
-1.433413, 1.093675, -1.022578, 1, 1, 1, 1, 1,
-1.427852, 0.7325853, -3.072451, 1, 1, 1, 1, 1,
-1.422472, 3.107719, -0.5154248, 1, 1, 1, 1, 1,
-1.41123, 0.5154, -1.155952, 1, 1, 1, 1, 1,
-1.402978, -0.1655992, -3.399618, 1, 1, 1, 1, 1,
-1.398539, -1.002108, -1.55809, 1, 1, 1, 1, 1,
-1.389106, 1.525846, 0.09866691, 1, 1, 1, 1, 1,
-1.388918, 0.1716247, -1.622356, 1, 1, 1, 1, 1,
-1.387213, -1.531547, -2.482671, 1, 1, 1, 1, 1,
-1.371857, 1.678759, -0.4822077, 1, 1, 1, 1, 1,
-1.357798, 0.7912404, -1.179768, 1, 1, 1, 1, 1,
-1.355588, -0.825159, -4.353262, 1, 1, 1, 1, 1,
-1.352196, -1.220838, -4.398767, 0, 0, 1, 1, 1,
-1.343127, -0.2456874, -1.386182, 1, 0, 0, 1, 1,
-1.334315, 0.6793114, -1.658742, 1, 0, 0, 1, 1,
-1.333627, 0.04483707, -1.286717, 1, 0, 0, 1, 1,
-1.333236, -1.539673, -1.714572, 1, 0, 0, 1, 1,
-1.330986, -0.6204414, -1.409583, 1, 0, 0, 1, 1,
-1.327442, 0.4952402, -0.9267183, 0, 0, 0, 1, 1,
-1.326014, -0.5218483, -1.298953, 0, 0, 0, 1, 1,
-1.3227, 1.457278, 0.7106757, 0, 0, 0, 1, 1,
-1.316865, 0.6381487, -0.6957571, 0, 0, 0, 1, 1,
-1.311451, -1.44736, -1.583875, 0, 0, 0, 1, 1,
-1.303684, 0.7312704, -0.1752476, 0, 0, 0, 1, 1,
-1.301066, 1.904616, 0.1234253, 0, 0, 0, 1, 1,
-1.293378, 0.5231783, 0.4470757, 1, 1, 1, 1, 1,
-1.289252, 1.142804, -0.9804937, 1, 1, 1, 1, 1,
-1.285755, -1.069653, -3.275549, 1, 1, 1, 1, 1,
-1.275057, 0.03936182, -3.450672, 1, 1, 1, 1, 1,
-1.273849, 0.5365781, -1.697791, 1, 1, 1, 1, 1,
-1.266052, 2.239507, -0.2651737, 1, 1, 1, 1, 1,
-1.264871, 1.188555, -0.4241158, 1, 1, 1, 1, 1,
-1.25996, -0.7176311, -3.03988, 1, 1, 1, 1, 1,
-1.257902, -0.4619927, -2.278605, 1, 1, 1, 1, 1,
-1.256788, 0.6063181, -1.328489, 1, 1, 1, 1, 1,
-1.25434, -0.6060287, -2.674279, 1, 1, 1, 1, 1,
-1.243744, 1.420255, -0.5205035, 1, 1, 1, 1, 1,
-1.234375, 0.4726149, -2.702578, 1, 1, 1, 1, 1,
-1.231306, 0.9001474, 0.3359921, 1, 1, 1, 1, 1,
-1.224969, -0.3890001, -2.605568, 1, 1, 1, 1, 1,
-1.221618, -1.533978, -1.437544, 0, 0, 1, 1, 1,
-1.218851, 0.3769951, -1.809048, 1, 0, 0, 1, 1,
-1.21239, -0.9796278, -1.220745, 1, 0, 0, 1, 1,
-1.206955, -0.1437448, -1.967423, 1, 0, 0, 1, 1,
-1.206411, -1.033027, -0.2133793, 1, 0, 0, 1, 1,
-1.201493, 2.573462, -1.571926, 1, 0, 0, 1, 1,
-1.199577, -0.5997257, -0.5552908, 0, 0, 0, 1, 1,
-1.199092, -1.834253, -3.195944, 0, 0, 0, 1, 1,
-1.187943, 1.463825, 1.130232, 0, 0, 0, 1, 1,
-1.185432, -0.04432819, -0.5546414, 0, 0, 0, 1, 1,
-1.181204, -0.3268407, -2.289287, 0, 0, 0, 1, 1,
-1.179953, -1.574992, -2.120066, 0, 0, 0, 1, 1,
-1.171511, -0.3134262, -1.378208, 0, 0, 0, 1, 1,
-1.161651, -1.564587, -1.945157, 1, 1, 1, 1, 1,
-1.154884, -1.836461, -3.637244, 1, 1, 1, 1, 1,
-1.153885, -2.059514, -3.465029, 1, 1, 1, 1, 1,
-1.15282, 0.2017548, -1.553518, 1, 1, 1, 1, 1,
-1.150276, -0.1749478, -0.5844563, 1, 1, 1, 1, 1,
-1.145441, -0.4110381, -2.127224, 1, 1, 1, 1, 1,
-1.123898, -0.03126297, -2.356663, 1, 1, 1, 1, 1,
-1.119466, 0.7000581, -1.507783, 1, 1, 1, 1, 1,
-1.113957, -0.7929338, -1.191838, 1, 1, 1, 1, 1,
-1.113468, 0.5287798, -1.144123, 1, 1, 1, 1, 1,
-1.10014, -2.087737, -3.152005, 1, 1, 1, 1, 1,
-1.099397, -1.587585, -2.102124, 1, 1, 1, 1, 1,
-1.097025, -0.3837741, -0.3344079, 1, 1, 1, 1, 1,
-1.094665, -1.379766, -2.553984, 1, 1, 1, 1, 1,
-1.091789, 1.554721, -0.5113968, 1, 1, 1, 1, 1,
-1.088012, -1.880319, -2.398472, 0, 0, 1, 1, 1,
-1.081041, -0.8143094, -0.8431048, 1, 0, 0, 1, 1,
-1.07757, 0.6808166, -1.435923, 1, 0, 0, 1, 1,
-1.076465, -0.3200942, -1.470421, 1, 0, 0, 1, 1,
-1.067368, 0.09106257, -1.718664, 1, 0, 0, 1, 1,
-1.061015, 0.5825166, -0.9574959, 1, 0, 0, 1, 1,
-1.055365, 1.137278, -1.49007, 0, 0, 0, 1, 1,
-1.051515, -0.1191634, -4.347149, 0, 0, 0, 1, 1,
-1.043804, 0.1667615, -1.348213, 0, 0, 0, 1, 1,
-1.042154, -0.2809488, -2.3826, 0, 0, 0, 1, 1,
-1.02797, 0.6395057, -2.93766, 0, 0, 0, 1, 1,
-1.022481, -1.774486, -1.955813, 0, 0, 0, 1, 1,
-1.016935, 1.021214, 0.6953958, 0, 0, 0, 1, 1,
-1.01393, -0.7153892, -0.4568399, 1, 1, 1, 1, 1,
-1.010675, -1.305793, -1.671918, 1, 1, 1, 1, 1,
-1.000849, -0.4712472, -0.8759367, 1, 1, 1, 1, 1,
-0.9970596, 1.877854, 0.06185132, 1, 1, 1, 1, 1,
-0.9948795, -0.790248, -2.71813, 1, 1, 1, 1, 1,
-0.9928083, -0.5340594, -3.738885, 1, 1, 1, 1, 1,
-0.9922802, 1.308742, -1.278265, 1, 1, 1, 1, 1,
-0.9850444, 0.8494006, -0.8247154, 1, 1, 1, 1, 1,
-0.984571, 0.07885186, -2.658366, 1, 1, 1, 1, 1,
-0.9832445, 0.03738612, -3.497947, 1, 1, 1, 1, 1,
-0.9814519, -0.5160867, -2.928966, 1, 1, 1, 1, 1,
-0.9810765, 0.9401802, -0.2735722, 1, 1, 1, 1, 1,
-0.9717562, -0.5342404, -2.30513, 1, 1, 1, 1, 1,
-0.9660889, -1.210459, -3.656873, 1, 1, 1, 1, 1,
-0.960109, -0.7035196, -3.188298, 1, 1, 1, 1, 1,
-0.9568217, -1.055237, -1.294267, 0, 0, 1, 1, 1,
-0.9564424, -0.2184852, -1.358742, 1, 0, 0, 1, 1,
-0.9403369, 0.5429147, -1.862874, 1, 0, 0, 1, 1,
-0.9347938, 0.2695194, -2.526163, 1, 0, 0, 1, 1,
-0.9332977, -0.6066861, -2.824124, 1, 0, 0, 1, 1,
-0.9225346, 0.2510745, -0.7069975, 1, 0, 0, 1, 1,
-0.919322, -0.8575057, -1.717345, 0, 0, 0, 1, 1,
-0.9171606, 0.147222, -2.309962, 0, 0, 0, 1, 1,
-0.8921442, -1.199822, -3.76394, 0, 0, 0, 1, 1,
-0.8788378, 0.3079544, -1.05463, 0, 0, 0, 1, 1,
-0.877386, -0.1507324, -0.2774835, 0, 0, 0, 1, 1,
-0.8699383, -1.630481, -1.005941, 0, 0, 0, 1, 1,
-0.8672316, -0.4718954, -0.3079894, 0, 0, 0, 1, 1,
-0.8663454, 0.5918025, -1.367036, 1, 1, 1, 1, 1,
-0.8602859, -1.068447, -1.660321, 1, 1, 1, 1, 1,
-0.8598325, -0.9602928, -2.037314, 1, 1, 1, 1, 1,
-0.8589295, -0.7663396, -1.235193, 1, 1, 1, 1, 1,
-0.8575711, -0.6727492, 0.3279362, 1, 1, 1, 1, 1,
-0.8561558, -0.654647, -2.39872, 1, 1, 1, 1, 1,
-0.8540198, -0.3628982, -2.334084, 1, 1, 1, 1, 1,
-0.8529296, 1.431607, -0.679847, 1, 1, 1, 1, 1,
-0.8455216, -0.02269033, -1.512458, 1, 1, 1, 1, 1,
-0.8365521, 0.4525968, -0.3706943, 1, 1, 1, 1, 1,
-0.8330833, -0.6808555, -2.635771, 1, 1, 1, 1, 1,
-0.8304104, 0.5071428, -2.110493, 1, 1, 1, 1, 1,
-0.8171918, -0.0822023, -2.207559, 1, 1, 1, 1, 1,
-0.814164, -1.472137, -1.915733, 1, 1, 1, 1, 1,
-0.8132939, -0.7403715, -2.828145, 1, 1, 1, 1, 1,
-0.8110106, 0.276816, -0.1834948, 0, 0, 1, 1, 1,
-0.80838, 0.8173003, -0.202721, 1, 0, 0, 1, 1,
-0.8083389, -0.10199, -1.92304, 1, 0, 0, 1, 1,
-0.8081777, -0.5612239, -1.787623, 1, 0, 0, 1, 1,
-0.8018312, 0.3278097, -0.2980786, 1, 0, 0, 1, 1,
-0.7994385, -0.2536189, 1.216013, 1, 0, 0, 1, 1,
-0.7991806, -0.9906071, -3.839375, 0, 0, 0, 1, 1,
-0.7959731, 1.544465, -0.8479214, 0, 0, 0, 1, 1,
-0.7944053, -0.2033504, -1.807684, 0, 0, 0, 1, 1,
-0.7870024, -0.2191675, -0.6818106, 0, 0, 0, 1, 1,
-0.785163, -0.4177126, -2.276463, 0, 0, 0, 1, 1,
-0.7845249, 0.8040536, 1.515206, 0, 0, 0, 1, 1,
-0.777193, -0.9429953, -1.894931, 0, 0, 0, 1, 1,
-0.7767297, -0.54145, -1.106314, 1, 1, 1, 1, 1,
-0.774071, -1.021781, -2.8455, 1, 1, 1, 1, 1,
-0.7720345, 0.8972615, -0.6747102, 1, 1, 1, 1, 1,
-0.7652988, -2.205475, -2.27556, 1, 1, 1, 1, 1,
-0.7626724, -1.798475, -3.674247, 1, 1, 1, 1, 1,
-0.7612929, -0.6289055, -2.42971, 1, 1, 1, 1, 1,
-0.7599818, -0.7240301, -3.140695, 1, 1, 1, 1, 1,
-0.7553528, 0.4157097, -1.380246, 1, 1, 1, 1, 1,
-0.7532013, -0.9670978, -0.9305392, 1, 1, 1, 1, 1,
-0.750668, -0.6001897, -0.8613442, 1, 1, 1, 1, 1,
-0.7417728, 1.375898, -0.7847365, 1, 1, 1, 1, 1,
-0.7372305, 0.9923812, -0.9254305, 1, 1, 1, 1, 1,
-0.7302409, 1.633993, 0.08190224, 1, 1, 1, 1, 1,
-0.7289455, -0.6225775, -1.768167, 1, 1, 1, 1, 1,
-0.7275735, -0.1050499, -1.809508, 1, 1, 1, 1, 1,
-0.7237857, -0.7519828, -1.255661, 0, 0, 1, 1, 1,
-0.7203422, 0.5069212, -1.537935, 1, 0, 0, 1, 1,
-0.7189689, 1.184388, -2.273024, 1, 0, 0, 1, 1,
-0.7188019, -0.681094, 0.1192942, 1, 0, 0, 1, 1,
-0.7128732, 0.8262067, -0.1300324, 1, 0, 0, 1, 1,
-0.7004709, -0.4048597, -2.808423, 1, 0, 0, 1, 1,
-0.6994483, 1.312377, 0.1300872, 0, 0, 0, 1, 1,
-0.6973543, 0.756111, -1.292484, 0, 0, 0, 1, 1,
-0.6972827, 0.8475625, 0.01236947, 0, 0, 0, 1, 1,
-0.6956053, -1.360812, -4.347358, 0, 0, 0, 1, 1,
-0.6926214, -0.6186879, -2.244314, 0, 0, 0, 1, 1,
-0.6923271, 2.25368, -0.1449395, 0, 0, 0, 1, 1,
-0.6834089, 0.4371316, -0.1044559, 0, 0, 0, 1, 1,
-0.6818071, -2.331084, -3.199031, 1, 1, 1, 1, 1,
-0.6779323, 0.3890384, -2.247062, 1, 1, 1, 1, 1,
-0.6761253, -0.393438, -2.557344, 1, 1, 1, 1, 1,
-0.671966, -1.105623, -5.916836, 1, 1, 1, 1, 1,
-0.6700336, 2.334664, -1.482878, 1, 1, 1, 1, 1,
-0.6644726, -0.9316739, -1.572677, 1, 1, 1, 1, 1,
-0.6580529, 0.472322, -1.071293, 1, 1, 1, 1, 1,
-0.6569698, -1.306756, -0.9620312, 1, 1, 1, 1, 1,
-0.6564404, -0.2854405, -3.02447, 1, 1, 1, 1, 1,
-0.6554167, 1.153471, -1.043186, 1, 1, 1, 1, 1,
-0.6547837, 0.005850933, -0.1927954, 1, 1, 1, 1, 1,
-0.6546155, 2.007859, -1.654097, 1, 1, 1, 1, 1,
-0.6546006, 0.1269325, -1.627808, 1, 1, 1, 1, 1,
-0.6508537, -2.320501, -3.247482, 1, 1, 1, 1, 1,
-0.6500233, 0.8034099, -0.5606368, 1, 1, 1, 1, 1,
-0.6494606, -0.7284129, -2.416978, 0, 0, 1, 1, 1,
-0.6484547, -2.460807, -1.766917, 1, 0, 0, 1, 1,
-0.6460388, 0.4068756, -2.308849, 1, 0, 0, 1, 1,
-0.6434705, 0.4919614, 0.0744494, 1, 0, 0, 1, 1,
-0.641888, -0.3388748, -2.32865, 1, 0, 0, 1, 1,
-0.6310202, 0.1542052, -1.873433, 1, 0, 0, 1, 1,
-0.6222219, 0.1521265, -1.983898, 0, 0, 0, 1, 1,
-0.6199353, 1.249706, -1.196623, 0, 0, 0, 1, 1,
-0.6138449, -0.5669614, -2.230919, 0, 0, 0, 1, 1,
-0.5987909, -0.4711322, -1.775472, 0, 0, 0, 1, 1,
-0.5985017, 0.1995504, 0.4589483, 0, 0, 0, 1, 1,
-0.5946701, -0.3130606, -3.621761, 0, 0, 0, 1, 1,
-0.5924509, 0.5847718, -1.651443, 0, 0, 0, 1, 1,
-0.5883603, -1.503889, -2.496956, 1, 1, 1, 1, 1,
-0.5874366, 0.6752959, 0.1487723, 1, 1, 1, 1, 1,
-0.5868025, 0.600486, -1.76701, 1, 1, 1, 1, 1,
-0.5867432, 1.49233, -1.037361, 1, 1, 1, 1, 1,
-0.5841586, 0.3620968, -0.7793229, 1, 1, 1, 1, 1,
-0.5840198, -1.530438, -2.284686, 1, 1, 1, 1, 1,
-0.5808346, -0.6935264, -2.990957, 1, 1, 1, 1, 1,
-0.5769331, -0.2405763, -4.050803, 1, 1, 1, 1, 1,
-0.5761729, 0.6433523, 0.2736141, 1, 1, 1, 1, 1,
-0.5735813, 0.4144506, -2.634889, 1, 1, 1, 1, 1,
-0.5719842, -1.33161, -1.885185, 1, 1, 1, 1, 1,
-0.5718883, -1.727457, -3.039109, 1, 1, 1, 1, 1,
-0.5686395, -1.974147, -4.452543, 1, 1, 1, 1, 1,
-0.563782, -0.3149525, -1.523772, 1, 1, 1, 1, 1,
-0.5589241, 0.3239068, -2.856277, 1, 1, 1, 1, 1,
-0.5580688, 0.5859309, -2.798741, 0, 0, 1, 1, 1,
-0.5462446, 0.8681177, 0.1699435, 1, 0, 0, 1, 1,
-0.5431675, -0.3692803, -1.32778, 1, 0, 0, 1, 1,
-0.5431064, -0.4843577, -1.465503, 1, 0, 0, 1, 1,
-0.5408717, 1.146687, 0.9163973, 1, 0, 0, 1, 1,
-0.5403512, 1.11541, -0.7812994, 1, 0, 0, 1, 1,
-0.5401917, -0.6993834, -3.569948, 0, 0, 0, 1, 1,
-0.5383816, 0.1110229, 0.9659954, 0, 0, 0, 1, 1,
-0.5368356, -1.067537, -2.898577, 0, 0, 0, 1, 1,
-0.5361507, -0.3539772, -3.271024, 0, 0, 0, 1, 1,
-0.5283223, 0.1129326, -1.061271, 0, 0, 0, 1, 1,
-0.5232427, -1.141365, -2.296515, 0, 0, 0, 1, 1,
-0.5176547, -1.196495, -4.529028, 0, 0, 0, 1, 1,
-0.5120424, 0.1751231, -0.8988547, 1, 1, 1, 1, 1,
-0.5058192, 0.1369636, -1.781898, 1, 1, 1, 1, 1,
-0.5005572, -0.7116086, -0.311486, 1, 1, 1, 1, 1,
-0.4957001, 1.177322, -1.351107, 1, 1, 1, 1, 1,
-0.4955953, 0.4319324, 0.3861323, 1, 1, 1, 1, 1,
-0.4952398, 1.841302, 1.176647, 1, 1, 1, 1, 1,
-0.4946117, -0.6902284, -2.079498, 1, 1, 1, 1, 1,
-0.4936235, -0.1127382, -2.053024, 1, 1, 1, 1, 1,
-0.4867436, 1.434954, -0.1880469, 1, 1, 1, 1, 1,
-0.483627, 1.934809, -2.125818, 1, 1, 1, 1, 1,
-0.479245, -0.3786243, -1.365589, 1, 1, 1, 1, 1,
-0.4731316, -0.1481439, -2.299826, 1, 1, 1, 1, 1,
-0.4726339, -0.4174762, -2.780556, 1, 1, 1, 1, 1,
-0.4679799, 0.4183907, 1.301315, 1, 1, 1, 1, 1,
-0.4661344, 1.185867, 0.07332395, 1, 1, 1, 1, 1,
-0.4625063, -1.279964, -3.615834, 0, 0, 1, 1, 1,
-0.4586688, -0.637087, -3.68398, 1, 0, 0, 1, 1,
-0.4570486, 0.4720752, 1.05091, 1, 0, 0, 1, 1,
-0.4484537, 0.1401988, -1.366077, 1, 0, 0, 1, 1,
-0.4479216, -0.6560401, -2.518863, 1, 0, 0, 1, 1,
-0.4422464, -0.2898299, -1.700199, 1, 0, 0, 1, 1,
-0.440651, -0.4792781, -3.469873, 0, 0, 0, 1, 1,
-0.4342156, 1.512434, -0.6498309, 0, 0, 0, 1, 1,
-0.4329723, 2.028346, -0.02235418, 0, 0, 0, 1, 1,
-0.4279903, -1.221528, -3.392961, 0, 0, 0, 1, 1,
-0.4273275, -1.236901, -0.8595394, 0, 0, 0, 1, 1,
-0.4255266, 0.4228486, -2.15604, 0, 0, 0, 1, 1,
-0.4246503, 0.1492325, 0.03818344, 0, 0, 0, 1, 1,
-0.4245318, -0.5362306, -1.513105, 1, 1, 1, 1, 1,
-0.423414, 0.4731082, -1.917518, 1, 1, 1, 1, 1,
-0.4230318, -0.4018582, -3.714902, 1, 1, 1, 1, 1,
-0.4112079, -0.1462291, -0.5932071, 1, 1, 1, 1, 1,
-0.4067158, -1.880321, -2.097294, 1, 1, 1, 1, 1,
-0.4032896, 1.267296, -1.150994, 1, 1, 1, 1, 1,
-0.4022977, -1.645614, -2.972702, 1, 1, 1, 1, 1,
-0.4006803, -0.4294995, -2.98982, 1, 1, 1, 1, 1,
-0.3978914, 0.8477408, -3.279384, 1, 1, 1, 1, 1,
-0.3976895, -1.178256, -2.43048, 1, 1, 1, 1, 1,
-0.3897674, 0.4233991, -0.869177, 1, 1, 1, 1, 1,
-0.3810544, 0.03034217, -1.536968, 1, 1, 1, 1, 1,
-0.3776453, -1.794804, -2.378707, 1, 1, 1, 1, 1,
-0.3724896, 0.178994, -0.7986324, 1, 1, 1, 1, 1,
-0.3722649, 1.201138, 0.4841154, 1, 1, 1, 1, 1,
-0.3718653, -0.2938413, -2.708845, 0, 0, 1, 1, 1,
-0.3618248, -0.09585872, -2.629614, 1, 0, 0, 1, 1,
-0.3616273, 1.726853, -0.1798941, 1, 0, 0, 1, 1,
-0.3609529, 1.231854, 0.3049154, 1, 0, 0, 1, 1,
-0.3603533, -1.315868, -1.512238, 1, 0, 0, 1, 1,
-0.3593605, -1.602895, -5.282658, 1, 0, 0, 1, 1,
-0.359063, -0.8852928, -3.165974, 0, 0, 0, 1, 1,
-0.3581016, -0.8250756, -4.145098, 0, 0, 0, 1, 1,
-0.356836, -1.465921, -3.040396, 0, 0, 0, 1, 1,
-0.3564665, 1.512346, -0.7724998, 0, 0, 0, 1, 1,
-0.3543114, 0.3341092, 0.1797002, 0, 0, 0, 1, 1,
-0.3528534, 0.5910116, -0.4679243, 0, 0, 0, 1, 1,
-0.3503897, -0.8346626, -2.907648, 0, 0, 0, 1, 1,
-0.3477736, 1.281789, -1.480618, 1, 1, 1, 1, 1,
-0.3365046, -0.2659206, -2.443077, 1, 1, 1, 1, 1,
-0.3341999, 0.6465377, -0.6601023, 1, 1, 1, 1, 1,
-0.3315941, 0.5709039, -0.1548237, 1, 1, 1, 1, 1,
-0.331445, 0.3606746, -0.2749255, 1, 1, 1, 1, 1,
-0.3301873, 0.3598922, 0.6784178, 1, 1, 1, 1, 1,
-0.3286485, 1.122915, -0.6045774, 1, 1, 1, 1, 1,
-0.3267395, -0.2452418, -2.438905, 1, 1, 1, 1, 1,
-0.3204501, 0.5629672, -1.626632, 1, 1, 1, 1, 1,
-0.3157965, 0.3430085, 0.4326126, 1, 1, 1, 1, 1,
-0.3122975, 0.5714082, -0.3814786, 1, 1, 1, 1, 1,
-0.3094991, -0.6670706, -3.999983, 1, 1, 1, 1, 1,
-0.3067059, -1.738124, -2.376527, 1, 1, 1, 1, 1,
-0.303555, -0.1787838, -1.054904, 1, 1, 1, 1, 1,
-0.302632, -0.7629344, -2.719913, 1, 1, 1, 1, 1,
-0.3020589, 0.3549756, -2.333782, 0, 0, 1, 1, 1,
-0.2948585, -0.4714842, -2.362546, 1, 0, 0, 1, 1,
-0.2898504, 0.318123, -2.806492, 1, 0, 0, 1, 1,
-0.2893531, -0.6381176, -4.619633, 1, 0, 0, 1, 1,
-0.2890906, 0.9257097, -0.1122311, 1, 0, 0, 1, 1,
-0.2869664, 0.1035479, -2.574553, 1, 0, 0, 1, 1,
-0.2862893, -0.4116025, -3.469241, 0, 0, 0, 1, 1,
-0.2828389, 0.898724, -1.638214, 0, 0, 0, 1, 1,
-0.2823213, 1.509354, -0.3612521, 0, 0, 0, 1, 1,
-0.2794529, -0.3481578, -3.254602, 0, 0, 0, 1, 1,
-0.2766765, -0.03355337, -1.898941, 0, 0, 0, 1, 1,
-0.2756508, -1.775565, -4.387746, 0, 0, 0, 1, 1,
-0.2738806, -1.221058, -4.097369, 0, 0, 0, 1, 1,
-0.271682, -0.9821032, -3.507274, 1, 1, 1, 1, 1,
-0.2641307, 0.3408804, -1.69261, 1, 1, 1, 1, 1,
-0.2633906, -0.09265848, -2.462618, 1, 1, 1, 1, 1,
-0.2613334, 0.547687, -0.6643988, 1, 1, 1, 1, 1,
-0.2597246, 0.4829246, -3.315447, 1, 1, 1, 1, 1,
-0.2581684, 0.1240396, -3.083293, 1, 1, 1, 1, 1,
-0.2572518, 0.02967819, -2.773948, 1, 1, 1, 1, 1,
-0.2565572, 0.4791109, -0.8189958, 1, 1, 1, 1, 1,
-0.2519274, -0.2844307, 0.2293241, 1, 1, 1, 1, 1,
-0.2507684, -0.06363997, -0.9899271, 1, 1, 1, 1, 1,
-0.248483, -1.175635, -2.361402, 1, 1, 1, 1, 1,
-0.2446619, 0.7906156, -1.123639, 1, 1, 1, 1, 1,
-0.2434806, -1.221282, -3.078242, 1, 1, 1, 1, 1,
-0.2417124, 0.5460766, 0.9432722, 1, 1, 1, 1, 1,
-0.2372228, -0.1048783, -1.95221, 1, 1, 1, 1, 1,
-0.2347105, -0.5119317, -4.196291, 0, 0, 1, 1, 1,
-0.2306673, 0.2602589, -0.9156251, 1, 0, 0, 1, 1,
-0.2298879, 0.2402001, -1.430107, 1, 0, 0, 1, 1,
-0.2292264, 0.37354, -0.6704902, 1, 0, 0, 1, 1,
-0.2212565, 2.558822, -2.524228, 1, 0, 0, 1, 1,
-0.2205003, 0.1788135, -0.3404847, 1, 0, 0, 1, 1,
-0.2202076, 0.03710022, -1.69638, 0, 0, 0, 1, 1,
-0.2197442, -0.664911, -1.952804, 0, 0, 0, 1, 1,
-0.21956, 2.1376, 0.4757735, 0, 0, 0, 1, 1,
-0.218577, 0.4152158, 1.313698, 0, 0, 0, 1, 1,
-0.2146013, 0.3985024, -0.7624659, 0, 0, 0, 1, 1,
-0.2132666, 0.4381554, 0.4284341, 0, 0, 0, 1, 1,
-0.2079097, 0.9473079, 0.178093, 0, 0, 0, 1, 1,
-0.2076974, -0.4570227, -3.383663, 1, 1, 1, 1, 1,
-0.2064793, -0.3922943, -1.859455, 1, 1, 1, 1, 1,
-0.2057877, -0.1615285, -0.4839403, 1, 1, 1, 1, 1,
-0.2049474, -1.123538, -2.555755, 1, 1, 1, 1, 1,
-0.2026064, -0.82052, -2.116526, 1, 1, 1, 1, 1,
-0.2018535, 0.06127781, 0.4864469, 1, 1, 1, 1, 1,
-0.1961704, -1.867349, -2.326313, 1, 1, 1, 1, 1,
-0.1915892, -0.4170392, -2.315471, 1, 1, 1, 1, 1,
-0.1890778, 0.6242635, 0.1018115, 1, 1, 1, 1, 1,
-0.1886733, -0.1562855, -1.29492, 1, 1, 1, 1, 1,
-0.1858006, -0.3342711, -1.366846, 1, 1, 1, 1, 1,
-0.1852013, -0.2343646, -1.791082, 1, 1, 1, 1, 1,
-0.1851962, -0.07899749, -0.8385608, 1, 1, 1, 1, 1,
-0.1810975, 1.189655, -0.8430358, 1, 1, 1, 1, 1,
-0.1806917, -0.2510209, -2.142549, 1, 1, 1, 1, 1,
-0.1713039, 1.035368, 0.4677144, 0, 0, 1, 1, 1,
-0.1677974, -0.3133083, -1.738103, 1, 0, 0, 1, 1,
-0.1620497, -2.309199, -4.557298, 1, 0, 0, 1, 1,
-0.1567477, 1.579246, -0.2933536, 1, 0, 0, 1, 1,
-0.1506943, 1.376897, -0.4208433, 1, 0, 0, 1, 1,
-0.1505759, 0.5133557, -0.5133976, 1, 0, 0, 1, 1,
-0.1496954, 0.982976, 0.2901162, 0, 0, 0, 1, 1,
-0.1449018, 0.3179822, -1.332362, 0, 0, 0, 1, 1,
-0.1421181, -2.612767, -4.157037, 0, 0, 0, 1, 1,
-0.1398718, -1.388909, -3.18283, 0, 0, 0, 1, 1,
-0.1376082, -0.8986129, -5.961727, 0, 0, 0, 1, 1,
-0.1317108, -1.518481, -1.607376, 0, 0, 0, 1, 1,
-0.1276914, -0.08061936, -1.483407, 0, 0, 0, 1, 1,
-0.125449, -0.8553341, -3.254525, 1, 1, 1, 1, 1,
-0.1253468, 0.343492, -0.3564427, 1, 1, 1, 1, 1,
-0.1223549, 0.603943, -1.041904, 1, 1, 1, 1, 1,
-0.1142261, -0.1739853, -1.254952, 1, 1, 1, 1, 1,
-0.1108681, 0.2742476, 1.204152, 1, 1, 1, 1, 1,
-0.1054604, 0.4210741, -0.1558122, 1, 1, 1, 1, 1,
-0.09984834, -0.5900428, -2.443842, 1, 1, 1, 1, 1,
-0.09233513, -0.5465145, -1.282432, 1, 1, 1, 1, 1,
-0.08973705, -0.1696194, -3.613852, 1, 1, 1, 1, 1,
-0.08089755, -0.7721311, -2.234832, 1, 1, 1, 1, 1,
-0.08000337, 0.512172, 0.8537539, 1, 1, 1, 1, 1,
-0.07978331, -0.4322243, -2.228133, 1, 1, 1, 1, 1,
-0.0797328, -0.5174764, -2.780822, 1, 1, 1, 1, 1,
-0.07907525, -0.01421807, -1.419698, 1, 1, 1, 1, 1,
-0.0772454, -0.3008527, -4.32792, 1, 1, 1, 1, 1,
-0.07511421, -1.05431, -4.250924, 0, 0, 1, 1, 1,
-0.07316163, 0.2238208, -1.794371, 1, 0, 0, 1, 1,
-0.07264072, -0.3954874, -3.727297, 1, 0, 0, 1, 1,
-0.07188769, -0.672326, -1.792657, 1, 0, 0, 1, 1,
-0.07068215, 0.1947315, -1.04068, 1, 0, 0, 1, 1,
-0.06431377, 0.3092021, -1.980363, 1, 0, 0, 1, 1,
-0.06210401, 1.388044, -0.2604873, 0, 0, 0, 1, 1,
-0.05848707, 0.3853015, 0.2119441, 0, 0, 0, 1, 1,
-0.05733002, -1.99263, -4.419573, 0, 0, 0, 1, 1,
-0.05519465, 0.1220476, -1.680364, 0, 0, 0, 1, 1,
-0.05152877, -0.01235453, -2.057519, 0, 0, 0, 1, 1,
-0.04379162, -0.3743012, -3.240006, 0, 0, 0, 1, 1,
-0.03750385, -1.731833, -3.235956, 0, 0, 0, 1, 1,
-0.03540346, 0.2159305, -0.5003898, 1, 1, 1, 1, 1,
-0.03316217, -0.6753737, -2.668777, 1, 1, 1, 1, 1,
-0.02436729, -0.2978288, -4.189536, 1, 1, 1, 1, 1,
-0.01774199, 0.1441973, -0.8659781, 1, 1, 1, 1, 1,
-0.01580556, -1.184487, -5.643095, 1, 1, 1, 1, 1,
-0.01407138, 1.025459, -0.07212918, 1, 1, 1, 1, 1,
-0.01102647, 0.9916789, -1.327401, 1, 1, 1, 1, 1,
-0.01090159, -0.465498, -3.338337, 1, 1, 1, 1, 1,
-0.0107527, -0.5440667, -2.712804, 1, 1, 1, 1, 1,
-0.009968037, 0.1623875, 0.3041531, 1, 1, 1, 1, 1,
-0.009920913, 0.3084854, 0.1663524, 1, 1, 1, 1, 1,
-0.00907594, 0.458427, -0.2575808, 1, 1, 1, 1, 1,
-0.008966953, 0.7125901, -1.68745, 1, 1, 1, 1, 1,
-0.00567433, 1.450176, 0.8578007, 1, 1, 1, 1, 1,
-0.001333546, 0.7308182, -0.533433, 1, 1, 1, 1, 1,
-0.001052545, -0.8470163, -2.616067, 0, 0, 1, 1, 1,
0.006974427, 0.04955483, -1.276125, 1, 0, 0, 1, 1,
0.0116492, -1.052443, 5.612964, 1, 0, 0, 1, 1,
0.01829955, -0.8147697, 4.292126, 1, 0, 0, 1, 1,
0.02001934, -0.3370677, 0.666521, 1, 0, 0, 1, 1,
0.02250386, 1.182844, 0.2538451, 1, 0, 0, 1, 1,
0.02565884, 0.3825505, 1.904465, 0, 0, 0, 1, 1,
0.02600357, 0.2411226, -0.02084923, 0, 0, 0, 1, 1,
0.02773016, 1.465877, -0.8799133, 0, 0, 0, 1, 1,
0.03181034, 0.934044, 0.4753964, 0, 0, 0, 1, 1,
0.03217587, -0.8237843, 3.590522, 0, 0, 0, 1, 1,
0.03698715, 0.139752, 0.606549, 0, 0, 0, 1, 1,
0.03955232, 0.5399656, -1.035869, 0, 0, 0, 1, 1,
0.04259716, 0.4381237, 0.08498684, 1, 1, 1, 1, 1,
0.04686577, 1.012533, -0.7092351, 1, 1, 1, 1, 1,
0.05061637, -0.6296206, 4.370053, 1, 1, 1, 1, 1,
0.05180864, 1.448643, 0.4571918, 1, 1, 1, 1, 1,
0.05423043, -0.03394257, 3.141798, 1, 1, 1, 1, 1,
0.05885291, 0.7035701, 1.23241, 1, 1, 1, 1, 1,
0.06520674, -0.3437561, 2.372322, 1, 1, 1, 1, 1,
0.06724757, -0.3094135, 3.757998, 1, 1, 1, 1, 1,
0.06780315, -1.894651, 3.130704, 1, 1, 1, 1, 1,
0.06972871, 0.9972595, -0.5423542, 1, 1, 1, 1, 1,
0.0698112, -0.4374401, 2.666359, 1, 1, 1, 1, 1,
0.0717898, 1.594751, 0.8961934, 1, 1, 1, 1, 1,
0.07202127, -0.8693691, 1.19426, 1, 1, 1, 1, 1,
0.07301768, 0.2538664, -0.04080773, 1, 1, 1, 1, 1,
0.07387818, 0.2065576, 1.147366, 1, 1, 1, 1, 1,
0.07690673, -0.1944894, 2.667857, 0, 0, 1, 1, 1,
0.08015486, -0.5982108, 2.985775, 1, 0, 0, 1, 1,
0.08502194, -1.038741, 4.132955, 1, 0, 0, 1, 1,
0.08551087, 1.228568, -0.8118008, 1, 0, 0, 1, 1,
0.08778144, 0.8423573, -0.005389039, 1, 0, 0, 1, 1,
0.08780037, 1.283352, -1.73777, 1, 0, 0, 1, 1,
0.0917974, 1.635889, -1.082285, 0, 0, 0, 1, 1,
0.09260301, -1.205294, 3.686547, 0, 0, 0, 1, 1,
0.1007641, 0.2921581, -0.6431821, 0, 0, 0, 1, 1,
0.1035599, 0.605232, 1.116864, 0, 0, 0, 1, 1,
0.1054885, -0.7916576, 3.623381, 0, 0, 0, 1, 1,
0.1057095, 1.520824, 1.255489, 0, 0, 0, 1, 1,
0.1073114, 0.8516893, 0.3072999, 0, 0, 0, 1, 1,
0.1088179, 0.1535205, 1.144046, 1, 1, 1, 1, 1,
0.109843, 0.334846, -0.7455677, 1, 1, 1, 1, 1,
0.1126156, 0.858572, 0.1292854, 1, 1, 1, 1, 1,
0.1140889, -0.8839867, 4.976091, 1, 1, 1, 1, 1,
0.1154278, -0.09193609, 1.044494, 1, 1, 1, 1, 1,
0.1156484, 0.2019363, -0.1040817, 1, 1, 1, 1, 1,
0.1164444, 0.7950101, -0.8885252, 1, 1, 1, 1, 1,
0.1212462, 0.4160036, 0.1159266, 1, 1, 1, 1, 1,
0.1234857, 0.08640679, -1.052922, 1, 1, 1, 1, 1,
0.1282653, -0.2485161, 4.138705, 1, 1, 1, 1, 1,
0.1312329, 0.6034944, 0.5456628, 1, 1, 1, 1, 1,
0.1340874, -1.981022, 2.991941, 1, 1, 1, 1, 1,
0.1352846, 0.001524799, 2.285859, 1, 1, 1, 1, 1,
0.1373135, -0.1207642, 5.08484, 1, 1, 1, 1, 1,
0.1400841, 0.7323712, -1.16557, 1, 1, 1, 1, 1,
0.140428, 1.41101, -0.3077207, 0, 0, 1, 1, 1,
0.1445837, -0.1473656, 0.7457544, 1, 0, 0, 1, 1,
0.146319, -0.5866697, 2.281834, 1, 0, 0, 1, 1,
0.1506707, 0.2279328, 2.128777, 1, 0, 0, 1, 1,
0.1518591, -0.6743329, 4.59178, 1, 0, 0, 1, 1,
0.1555538, 0.1811547, 0.8438084, 1, 0, 0, 1, 1,
0.1566395, 0.7464784, -1.455309, 0, 0, 0, 1, 1,
0.1610446, 0.7444118, -0.4577409, 0, 0, 0, 1, 1,
0.1614069, 1.194895, -1.03063, 0, 0, 0, 1, 1,
0.1648988, 0.2081846, 1.745319, 0, 0, 0, 1, 1,
0.1660524, 0.9833847, 0.3216023, 0, 0, 0, 1, 1,
0.1682878, -0.4077256, 2.908649, 0, 0, 0, 1, 1,
0.1701394, -0.6887658, 4.025701, 0, 0, 0, 1, 1,
0.1702409, 1.103056, 0.1369853, 1, 1, 1, 1, 1,
0.1719383, -0.8335724, 3.090744, 1, 1, 1, 1, 1,
0.1729303, -2.032265, 0.8918506, 1, 1, 1, 1, 1,
0.1774949, -0.7705825, 2.47314, 1, 1, 1, 1, 1,
0.1826076, -0.1814934, 2.65207, 1, 1, 1, 1, 1,
0.1849533, 1.975164, 1.004912, 1, 1, 1, 1, 1,
0.1971277, 0.2368836, -0.6913303, 1, 1, 1, 1, 1,
0.198354, -0.05434307, 2.602925, 1, 1, 1, 1, 1,
0.2001321, -0.1832242, 2.957636, 1, 1, 1, 1, 1,
0.2020685, 1.279148, -0.07573969, 1, 1, 1, 1, 1,
0.2040502, -0.1758459, 2.546952, 1, 1, 1, 1, 1,
0.2089843, -0.6900764, 2.583479, 1, 1, 1, 1, 1,
0.2132557, -0.03923411, 0.9890078, 1, 1, 1, 1, 1,
0.2137165, 0.8153488, -0.2202397, 1, 1, 1, 1, 1,
0.2162529, -0.4722469, 2.409077, 1, 1, 1, 1, 1,
0.2176939, 0.3364172, -2.603284, 0, 0, 1, 1, 1,
0.2179205, -0.1865305, 1.794871, 1, 0, 0, 1, 1,
0.2184002, -0.3864346, 2.518936, 1, 0, 0, 1, 1,
0.2187583, -0.292484, 4.503068, 1, 0, 0, 1, 1,
0.2205695, -0.8861216, 2.231399, 1, 0, 0, 1, 1,
0.2235205, -1.089816, 2.64256, 1, 0, 0, 1, 1,
0.2241827, -0.2570989, 1.659341, 0, 0, 0, 1, 1,
0.2257165, 0.02554671, 1.561063, 0, 0, 0, 1, 1,
0.2258749, 0.294163, 0.4638261, 0, 0, 0, 1, 1,
0.2262634, 0.7542407, 2.701044, 0, 0, 0, 1, 1,
0.2342748, -0.2857943, 3.942392, 0, 0, 0, 1, 1,
0.2385332, -0.4266736, 2.778281, 0, 0, 0, 1, 1,
0.2443065, 1.349099, 0.3171377, 0, 0, 0, 1, 1,
0.244454, 0.9601052, -1.559286, 1, 1, 1, 1, 1,
0.2528858, 0.211285, 1.82616, 1, 1, 1, 1, 1,
0.2585101, 0.4046337, 1.426107, 1, 1, 1, 1, 1,
0.2625203, -0.8707311, 3.538171, 1, 1, 1, 1, 1,
0.2650485, -0.3236108, 2.836198, 1, 1, 1, 1, 1,
0.2663065, -1.022296, 3.506777, 1, 1, 1, 1, 1,
0.2676788, 2.315979, 0.004978533, 1, 1, 1, 1, 1,
0.280068, 0.8437546, -0.4196918, 1, 1, 1, 1, 1,
0.2973956, -0.3971734, 1.833818, 1, 1, 1, 1, 1,
0.3023936, -0.2916894, 2.121899, 1, 1, 1, 1, 1,
0.3031356, -0.9581468, 2.415756, 1, 1, 1, 1, 1,
0.3059193, -1.165632, 2.906023, 1, 1, 1, 1, 1,
0.3093532, -0.0315409, 1.759668, 1, 1, 1, 1, 1,
0.31121, 1.212577, 2.308219, 1, 1, 1, 1, 1,
0.3134135, 0.7891081, 0.907781, 1, 1, 1, 1, 1,
0.3161399, 0.03198959, 0.08157171, 0, 0, 1, 1, 1,
0.3167459, 0.7179977, 0.06638693, 1, 0, 0, 1, 1,
0.3174138, -0.2233363, 1.872567, 1, 0, 0, 1, 1,
0.3174683, 0.08294088, 1.075368, 1, 0, 0, 1, 1,
0.3196228, 1.096524, 0.0887759, 1, 0, 0, 1, 1,
0.3205885, -0.8998559, 2.828965, 1, 0, 0, 1, 1,
0.3272144, -0.1206764, 1.524299, 0, 0, 0, 1, 1,
0.3313815, 1.295761, -0.07493162, 0, 0, 0, 1, 1,
0.3387989, 0.6347565, 0.05539893, 0, 0, 0, 1, 1,
0.3452795, 0.9249728, 0.4625232, 0, 0, 0, 1, 1,
0.3516721, -0.2161425, 1.734786, 0, 0, 0, 1, 1,
0.3517584, -1.22266, 2.698227, 0, 0, 0, 1, 1,
0.3613811, -0.02899502, 0.977452, 0, 0, 0, 1, 1,
0.364159, 0.408515, -1.047627, 1, 1, 1, 1, 1,
0.3644267, 1.120054, 0.3649795, 1, 1, 1, 1, 1,
0.3687701, 0.8485502, 1.708272, 1, 1, 1, 1, 1,
0.37096, 0.5807801, 0.8322209, 1, 1, 1, 1, 1,
0.3714318, -0.04912588, 1.507555, 1, 1, 1, 1, 1,
0.379416, -0.7953574, 4.458222, 1, 1, 1, 1, 1,
0.3814419, -1.802701, 4.002366, 1, 1, 1, 1, 1,
0.3888375, 0.1991233, 1.406784, 1, 1, 1, 1, 1,
0.3935602, -0.3341349, 2.511539, 1, 1, 1, 1, 1,
0.3944905, -0.00590009, 1.061808, 1, 1, 1, 1, 1,
0.3960972, -0.2285748, 1.660424, 1, 1, 1, 1, 1,
0.3993891, 0.6245033, 1.171937, 1, 1, 1, 1, 1,
0.4071353, -1.292877, 3.092046, 1, 1, 1, 1, 1,
0.4082769, 0.2273285, 3.806208, 1, 1, 1, 1, 1,
0.4121494, -1.752907, 4.172358, 1, 1, 1, 1, 1,
0.4136707, 0.5618923, 1.175195, 0, 0, 1, 1, 1,
0.413705, 0.210365, 1.965296, 1, 0, 0, 1, 1,
0.4141795, -0.01096441, 2.688563, 1, 0, 0, 1, 1,
0.4153318, -0.1244, 1.456516, 1, 0, 0, 1, 1,
0.415609, 1.734409, 0.4813927, 1, 0, 0, 1, 1,
0.4178449, 2.128382, 1.497285, 1, 0, 0, 1, 1,
0.419374, 0.8387362, 0.5964749, 0, 0, 0, 1, 1,
0.419845, -2.219755, 5.111347, 0, 0, 0, 1, 1,
0.4198554, 1.614271, -0.3043253, 0, 0, 0, 1, 1,
0.4212834, 0.9772241, 0.8386537, 0, 0, 0, 1, 1,
0.4249017, 1.112611, -0.8087109, 0, 0, 0, 1, 1,
0.4310536, 0.7374363, 0.2587242, 0, 0, 0, 1, 1,
0.4337746, -0.4089628, 3.116681, 0, 0, 0, 1, 1,
0.434577, 0.6173577, 0.09405115, 1, 1, 1, 1, 1,
0.4369301, -0.4918517, 2.664108, 1, 1, 1, 1, 1,
0.4402156, 1.133643, 0.7706546, 1, 1, 1, 1, 1,
0.4412405, 0.3911689, 0.008592354, 1, 1, 1, 1, 1,
0.4431675, -0.5875357, 3.029566, 1, 1, 1, 1, 1,
0.4449993, 0.3568606, 1.318665, 1, 1, 1, 1, 1,
0.4464165, 0.4596513, 0.2237629, 1, 1, 1, 1, 1,
0.450573, -0.4653749, 2.982602, 1, 1, 1, 1, 1,
0.4524161, 0.3521801, 1.186059, 1, 1, 1, 1, 1,
0.45283, -0.4492043, 2.932476, 1, 1, 1, 1, 1,
0.4589834, 0.696352, 1.408712, 1, 1, 1, 1, 1,
0.4611176, -0.552272, 3.28795, 1, 1, 1, 1, 1,
0.4650454, 0.7804875, 0.02748106, 1, 1, 1, 1, 1,
0.467359, -1.259719, 2.972781, 1, 1, 1, 1, 1,
0.4685409, -0.2832586, 1.421208, 1, 1, 1, 1, 1,
0.4728749, -0.6908247, 1.328636, 0, 0, 1, 1, 1,
0.4767005, 0.4639203, 2.160876, 1, 0, 0, 1, 1,
0.4797847, 0.6155294, 0.5566926, 1, 0, 0, 1, 1,
0.480051, -0.7033927, 2.423435, 1, 0, 0, 1, 1,
0.4808154, 1.126254, 0.5791181, 1, 0, 0, 1, 1,
0.4808508, -1.297189, 1.86857, 1, 0, 0, 1, 1,
0.4809374, 0.4232079, 2.182907, 0, 0, 0, 1, 1,
0.4811641, -0.01460104, 0.3647034, 0, 0, 0, 1, 1,
0.4866936, 1.934084, 0.7821056, 0, 0, 0, 1, 1,
0.4897444, -0.385437, 2.898646, 0, 0, 0, 1, 1,
0.4909844, 0.7909069, 1.018847, 0, 0, 0, 1, 1,
0.4912962, 0.2842311, 0.1223542, 0, 0, 0, 1, 1,
0.492477, 1.823676, -1.938762, 0, 0, 0, 1, 1,
0.4962811, 0.4703132, 0.2060619, 1, 1, 1, 1, 1,
0.4966419, 0.3096054, 1.739872, 1, 1, 1, 1, 1,
0.4966546, 0.1622554, 1.457995, 1, 1, 1, 1, 1,
0.4968601, -0.5628189, 2.916823, 1, 1, 1, 1, 1,
0.4993727, 1.904955, -0.6611395, 1, 1, 1, 1, 1,
0.5060962, 0.80812, 1.41399, 1, 1, 1, 1, 1,
0.5063235, 0.4454335, 0.3428143, 1, 1, 1, 1, 1,
0.5083669, -1.88652, 1.714868, 1, 1, 1, 1, 1,
0.5084263, -0.7622743, 2.749748, 1, 1, 1, 1, 1,
0.5112376, -0.8632597, 4.258433, 1, 1, 1, 1, 1,
0.5138534, 0.9778773, -0.714489, 1, 1, 1, 1, 1,
0.5142008, -1.816218, 2.536545, 1, 1, 1, 1, 1,
0.5251365, -0.06391571, 1.328062, 1, 1, 1, 1, 1,
0.5258753, -1.175344, 4.707625, 1, 1, 1, 1, 1,
0.5286184, -1.293284, 1.560138, 1, 1, 1, 1, 1,
0.5334744, -0.6662499, 2.35588, 0, 0, 1, 1, 1,
0.5358875, 0.2336004, 2.623604, 1, 0, 0, 1, 1,
0.5385568, 0.1596872, 1.631451, 1, 0, 0, 1, 1,
0.5421059, -0.4659041, 2.264062, 1, 0, 0, 1, 1,
0.5426361, -0.4738113, 1.083327, 1, 0, 0, 1, 1,
0.5434266, -1.144126, 3.104462, 1, 0, 0, 1, 1,
0.5440512, -1.432076, 3.041758, 0, 0, 0, 1, 1,
0.5460761, -0.2493122, 0.3800041, 0, 0, 0, 1, 1,
0.5463684, -0.1582331, 2.531729, 0, 0, 0, 1, 1,
0.5499598, -1.861757, 1.600293, 0, 0, 0, 1, 1,
0.5540949, -0.01525511, -0.03879215, 0, 0, 0, 1, 1,
0.5574849, -0.3834938, 2.351306, 0, 0, 0, 1, 1,
0.5579932, 0.9116527, 1.460968, 0, 0, 0, 1, 1,
0.5612977, 0.8520067, -0.8357926, 1, 1, 1, 1, 1,
0.5619929, -2.153744, 2.110132, 1, 1, 1, 1, 1,
0.5625885, 0.1442912, 1.537624, 1, 1, 1, 1, 1,
0.5626317, 0.5125572, 1.067707, 1, 1, 1, 1, 1,
0.5665847, 0.2056415, 1.864914, 1, 1, 1, 1, 1,
0.5691434, 0.8390465, 1.74207, 1, 1, 1, 1, 1,
0.5703595, -0.8521411, 3.365409, 1, 1, 1, 1, 1,
0.5709826, 0.05799842, 3.383257, 1, 1, 1, 1, 1,
0.579712, 1.247882, -0.2253531, 1, 1, 1, 1, 1,
0.5824222, -1.355223, 2.201771, 1, 1, 1, 1, 1,
0.5836581, -1.231397, 3.291198, 1, 1, 1, 1, 1,
0.5862999, 1.523087, 2.930417, 1, 1, 1, 1, 1,
0.5892273, 1.47796, -0.6410323, 1, 1, 1, 1, 1,
0.5900794, -1.713172, 4.545069, 1, 1, 1, 1, 1,
0.5900881, 0.4292821, 0.4653471, 1, 1, 1, 1, 1,
0.5928264, 0.5022227, 1.09312, 0, 0, 1, 1, 1,
0.5948936, -0.8810503, 3.032129, 1, 0, 0, 1, 1,
0.5970665, -0.7800975, 2.967032, 1, 0, 0, 1, 1,
0.5981786, 0.7884806, 1.036803, 1, 0, 0, 1, 1,
0.5999099, 1.382531, 1.092564, 1, 0, 0, 1, 1,
0.602232, 0.7612878, -1.449231, 1, 0, 0, 1, 1,
0.6078219, -0.218989, 0.6065292, 0, 0, 0, 1, 1,
0.6109591, -0.1213279, 1.528845, 0, 0, 0, 1, 1,
0.621344, -0.3532455, 0.7605175, 0, 0, 0, 1, 1,
0.6295618, -0.002936936, 1.767684, 0, 0, 0, 1, 1,
0.6338203, 1.575093, 0.1717078, 0, 0, 0, 1, 1,
0.6342993, 1.341118, -0.1217047, 0, 0, 0, 1, 1,
0.6396387, -0.4351857, 2.046816, 0, 0, 0, 1, 1,
0.6435825, 0.5524966, -0.2957056, 1, 1, 1, 1, 1,
0.6441177, -0.09926765, 2.550277, 1, 1, 1, 1, 1,
0.6459396, -1.464539, 2.41429, 1, 1, 1, 1, 1,
0.6475532, 0.2341776, 2.408593, 1, 1, 1, 1, 1,
0.6499763, -0.6369627, 1.214863, 1, 1, 1, 1, 1,
0.6544627, 0.4753698, 0.6013192, 1, 1, 1, 1, 1,
0.6561427, -0.05407781, 3.717311, 1, 1, 1, 1, 1,
0.6562722, -0.2013461, 3.166173, 1, 1, 1, 1, 1,
0.6574859, -0.7513457, 2.227885, 1, 1, 1, 1, 1,
0.6595421, 0.08369423, 1.824215, 1, 1, 1, 1, 1,
0.6607444, -2.013044, 1.969811, 1, 1, 1, 1, 1,
0.6634503, -0.6390171, 2.662855, 1, 1, 1, 1, 1,
0.6638808, -1.249049, 3.637398, 1, 1, 1, 1, 1,
0.6655711, 0.4512163, 1.394739, 1, 1, 1, 1, 1,
0.6659878, -1.329258, 3.107457, 1, 1, 1, 1, 1,
0.6712743, 0.6040298, 0.1751158, 0, 0, 1, 1, 1,
0.6749483, -0.06529678, 1.281838, 1, 0, 0, 1, 1,
0.6752728, 1.342919, 1.2798, 1, 0, 0, 1, 1,
0.6781209, 0.5196196, 0.7753087, 1, 0, 0, 1, 1,
0.6855759, 1.525843, -1.429524, 1, 0, 0, 1, 1,
0.6858177, 0.006703907, 3.834082, 1, 0, 0, 1, 1,
0.6870515, 0.3025595, 1.812407, 0, 0, 0, 1, 1,
0.6876583, -1.374551, 2.352834, 0, 0, 0, 1, 1,
0.687866, -3.25346, 2.722355, 0, 0, 0, 1, 1,
0.6895002, -0.7752102, 1.424076, 0, 0, 0, 1, 1,
0.6916622, 0.4592263, -0.4862019, 0, 0, 0, 1, 1,
0.6950853, -0.6244976, 2.920762, 0, 0, 0, 1, 1,
0.6956819, -0.9928542, 4.042089, 0, 0, 0, 1, 1,
0.6999953, 0.9351783, -1.03007, 1, 1, 1, 1, 1,
0.705894, 0.6872001, 2.181614, 1, 1, 1, 1, 1,
0.7071464, -0.5152597, 1.972957, 1, 1, 1, 1, 1,
0.7110071, 0.9368912, 0.6419479, 1, 1, 1, 1, 1,
0.7127391, -0.3952389, 2.365143, 1, 1, 1, 1, 1,
0.7144412, -1.221647, 3.959846, 1, 1, 1, 1, 1,
0.7155146, 0.6751549, 0.7686474, 1, 1, 1, 1, 1,
0.7180285, -0.6129435, 3.60392, 1, 1, 1, 1, 1,
0.7269632, -1.684713, 2.331877, 1, 1, 1, 1, 1,
0.728881, -0.2726661, 2.077415, 1, 1, 1, 1, 1,
0.7300282, -0.1630503, 2.533488, 1, 1, 1, 1, 1,
0.7306489, -0.6320716, 1.333195, 1, 1, 1, 1, 1,
0.7309864, -1.758289, 2.061637, 1, 1, 1, 1, 1,
0.7318675, -0.5388259, 2.175638, 1, 1, 1, 1, 1,
0.7346637, 1.815856, 0.309536, 1, 1, 1, 1, 1,
0.7374818, 0.3297246, 0.9491008, 0, 0, 1, 1, 1,
0.7378588, 0.6215468, -1.075747, 1, 0, 0, 1, 1,
0.7399051, 1.522913, 0.8947309, 1, 0, 0, 1, 1,
0.7442243, 0.6478478, 0.05976509, 1, 0, 0, 1, 1,
0.7462, 0.8093495, 0.8382596, 1, 0, 0, 1, 1,
0.7471011, -0.9876896, 1.88255, 1, 0, 0, 1, 1,
0.7491506, 1.309588, 0.7979159, 0, 0, 0, 1, 1,
0.7503036, 0.03808067, 3.721224, 0, 0, 0, 1, 1,
0.7504109, -0.8000253, 1.823336, 0, 0, 0, 1, 1,
0.7532315, -1.4292, 4.277318, 0, 0, 0, 1, 1,
0.7629884, 0.5652383, 0.9189408, 0, 0, 0, 1, 1,
0.7660188, 0.928355, 3.246542, 0, 0, 0, 1, 1,
0.766276, -0.06257086, 2.126402, 0, 0, 0, 1, 1,
0.772476, 0.717804, 2.110861, 1, 1, 1, 1, 1,
0.7786804, -0.5765821, 3.269409, 1, 1, 1, 1, 1,
0.7834765, 0.4014194, 1.146291, 1, 1, 1, 1, 1,
0.7887657, -0.367582, 3.850821, 1, 1, 1, 1, 1,
0.7922074, 0.2996715, 2.654924, 1, 1, 1, 1, 1,
0.793577, 0.261169, 1.969019, 1, 1, 1, 1, 1,
0.794561, -1.934723, 1.174211, 1, 1, 1, 1, 1,
0.7945685, 0.01457879, 0.278158, 1, 1, 1, 1, 1,
0.7957177, -0.2098953, 1.651085, 1, 1, 1, 1, 1,
0.7998351, 0.6520492, 1.588707, 1, 1, 1, 1, 1,
0.8041431, -1.93304, 0.7336816, 1, 1, 1, 1, 1,
0.8073799, -0.9335263, 2.113089, 1, 1, 1, 1, 1,
0.8186423, 0.2061919, 0.5882595, 1, 1, 1, 1, 1,
0.8203192, 0.2459079, -1.46307, 1, 1, 1, 1, 1,
0.8272227, 1.152907, 2.288048, 1, 1, 1, 1, 1,
0.827972, -0.2839113, 1.324663, 0, 0, 1, 1, 1,
0.8333289, 0.05965137, 1.379052, 1, 0, 0, 1, 1,
0.8405297, 1.20242, 1.53213, 1, 0, 0, 1, 1,
0.8409024, 2.532858, -0.441276, 1, 0, 0, 1, 1,
0.8412555, 1.016936, -0.1718152, 1, 0, 0, 1, 1,
0.8422146, -1.359386, 1.67682, 1, 0, 0, 1, 1,
0.844321, -0.3378277, 1.729365, 0, 0, 0, 1, 1,
0.8443686, 0.5082225, 1.678426, 0, 0, 0, 1, 1,
0.8461257, 0.5793579, 1.733407, 0, 0, 0, 1, 1,
0.8511609, 0.3454194, 0.8700668, 0, 0, 0, 1, 1,
0.8574336, -1.271914, 2.756143, 0, 0, 0, 1, 1,
0.857738, -2.54558, 2.772762, 0, 0, 0, 1, 1,
0.8632683, 0.00661885, 2.423929, 0, 0, 0, 1, 1,
0.864107, 0.8356249, -0.4213715, 1, 1, 1, 1, 1,
0.8743204, 0.6629591, 2.114156, 1, 1, 1, 1, 1,
0.8908175, -0.6672455, 0.4654325, 1, 1, 1, 1, 1,
0.8921358, 1.062735, 0.3554745, 1, 1, 1, 1, 1,
0.893683, -0.1072716, -0.04607227, 1, 1, 1, 1, 1,
0.8942607, -0.6050765, 2.585898, 1, 1, 1, 1, 1,
0.8973126, 0.05766394, 1.846278, 1, 1, 1, 1, 1,
0.9008921, 2.246949, 0.3200952, 1, 1, 1, 1, 1,
0.9069754, -0.2553075, 2.730222, 1, 1, 1, 1, 1,
0.9077113, -0.5273658, 2.924972, 1, 1, 1, 1, 1,
0.9091572, -0.4051381, 1.736177, 1, 1, 1, 1, 1,
0.9141501, -0.59068, 1.58994, 1, 1, 1, 1, 1,
0.9155082, 1.40998, 1.191851, 1, 1, 1, 1, 1,
0.920755, -0.180332, 2.635078, 1, 1, 1, 1, 1,
0.9245473, 1.350924, 1.973672, 1, 1, 1, 1, 1,
0.925113, 0.354259, 1.122438, 0, 0, 1, 1, 1,
0.9283065, -0.4215031, 3.978999, 1, 0, 0, 1, 1,
0.9474979, -0.225527, 1.510799, 1, 0, 0, 1, 1,
0.95704, -1.039126, 0.9279465, 1, 0, 0, 1, 1,
0.9617009, -0.009883875, 1.908716, 1, 0, 0, 1, 1,
0.962544, 1.108893, 2.29251, 1, 0, 0, 1, 1,
0.9678075, -0.8208636, 1.733892, 0, 0, 0, 1, 1,
0.9731003, -0.7689847, 0.3349105, 0, 0, 0, 1, 1,
0.9745944, 0.405009, 0.4980999, 0, 0, 0, 1, 1,
0.9807597, 0.4514149, 0.5794001, 0, 0, 0, 1, 1,
0.9857334, -0.3105874, 1.881988, 0, 0, 0, 1, 1,
0.9902307, 0.6845825, -0.2844203, 0, 0, 0, 1, 1,
0.9981253, -0.3629251, 2.392446, 0, 0, 0, 1, 1,
0.9987277, 0.3740138, 1.358005, 1, 1, 1, 1, 1,
1.002454, 0.1767198, 0.6143876, 1, 1, 1, 1, 1,
1.007288, 0.1949786, 1.563916, 1, 1, 1, 1, 1,
1.011025, 2.225242, 0.7403814, 1, 1, 1, 1, 1,
1.016061, -0.0594901, 2.325017, 1, 1, 1, 1, 1,
1.017196, -0.2388424, 2.187503, 1, 1, 1, 1, 1,
1.019349, -0.397046, 0.5805617, 1, 1, 1, 1, 1,
1.027434, -0.8757084, 3.42146, 1, 1, 1, 1, 1,
1.043056, 0.1736079, 3.622735, 1, 1, 1, 1, 1,
1.047738, -0.1609274, 1.381316, 1, 1, 1, 1, 1,
1.054252, 0.2854813, 0.08185222, 1, 1, 1, 1, 1,
1.055197, -0.297798, 1.245088, 1, 1, 1, 1, 1,
1.064123, 0.8770516, -0.3875484, 1, 1, 1, 1, 1,
1.065824, 0.6160972, 1.489157, 1, 1, 1, 1, 1,
1.074981, -0.004391829, 2.670028, 1, 1, 1, 1, 1,
1.079087, -2.132323, 0.4303803, 0, 0, 1, 1, 1,
1.092934, 1.430497, 1.122151, 1, 0, 0, 1, 1,
1.093199, 0.1970921, 1.655612, 1, 0, 0, 1, 1,
1.093663, -0.7314805, 2.290768, 1, 0, 0, 1, 1,
1.097736, 1.728986, 1.576345, 1, 0, 0, 1, 1,
1.104482, 1.15169, 0.7408282, 1, 0, 0, 1, 1,
1.106537, 1.434665, -0.7110977, 0, 0, 0, 1, 1,
1.109212, -0.06438234, 2.156198, 0, 0, 0, 1, 1,
1.110054, 0.04236772, 1.954045, 0, 0, 0, 1, 1,
1.113391, 0.946438, -0.9164315, 0, 0, 0, 1, 1,
1.116703, -1.016635, 2.111707, 0, 0, 0, 1, 1,
1.118051, -2.556667, 2.28586, 0, 0, 0, 1, 1,
1.119723, -0.5066931, 2.205667, 0, 0, 0, 1, 1,
1.119935, 1.216094, 1.416985, 1, 1, 1, 1, 1,
1.125904, -1.167956, 4.442837, 1, 1, 1, 1, 1,
1.130517, 0.5587749, 2.842646, 1, 1, 1, 1, 1,
1.132174, 0.5414602, 3.271223, 1, 1, 1, 1, 1,
1.133747, -1.941259, 2.011555, 1, 1, 1, 1, 1,
1.134582, 0.3730317, 1.470632, 1, 1, 1, 1, 1,
1.140083, -0.4566962, 1.928327, 1, 1, 1, 1, 1,
1.142627, 0.05274429, 1.148913, 1, 1, 1, 1, 1,
1.142801, -0.6731453, 1.335099, 1, 1, 1, 1, 1,
1.148147, -0.1727008, 1.482266, 1, 1, 1, 1, 1,
1.156015, -0.03780272, 3.282657, 1, 1, 1, 1, 1,
1.159649, 0.3577527, 0.02863897, 1, 1, 1, 1, 1,
1.166526, 0.09660097, 3.456352, 1, 1, 1, 1, 1,
1.168747, -0.01433792, 2.625647, 1, 1, 1, 1, 1,
1.171257, 0.5046484, 2.213836, 1, 1, 1, 1, 1,
1.174954, -0.2559319, 1.109565, 0, 0, 1, 1, 1,
1.181082, 0.7435467, 0.5913114, 1, 0, 0, 1, 1,
1.182089, 0.986822, 0.6921608, 1, 0, 0, 1, 1,
1.18328, -2.264193, 3.226676, 1, 0, 0, 1, 1,
1.189844, -0.712492, 3.399067, 1, 0, 0, 1, 1,
1.191265, -0.174011, 1.033239, 1, 0, 0, 1, 1,
1.191849, 1.291692, 0.6010867, 0, 0, 0, 1, 1,
1.195057, -1.613513, 2.109207, 0, 0, 0, 1, 1,
1.200493, -0.9160905, 1.915444, 0, 0, 0, 1, 1,
1.204341, -0.4022072, 1.770033, 0, 0, 0, 1, 1,
1.213122, 0.1151232, 1.487019, 0, 0, 0, 1, 1,
1.213545, -1.011746, 1.784471, 0, 0, 0, 1, 1,
1.223492, -0.2310834, 2.795014, 0, 0, 0, 1, 1,
1.223686, 0.7749774, 0.01741588, 1, 1, 1, 1, 1,
1.225395, -1.151468, 1.335027, 1, 1, 1, 1, 1,
1.231316, 0.2098563, 1.2883, 1, 1, 1, 1, 1,
1.231923, -0.8263041, 2.320834, 1, 1, 1, 1, 1,
1.237212, 0.3615291, 2.102155, 1, 1, 1, 1, 1,
1.245582, 0.7909943, 1.156287, 1, 1, 1, 1, 1,
1.248906, -0.3633817, 4.981299, 1, 1, 1, 1, 1,
1.254329, -0.1533866, 2.000864, 1, 1, 1, 1, 1,
1.25446, 0.2623844, 2.52217, 1, 1, 1, 1, 1,
1.258384, 0.9748112, -0.2482343, 1, 1, 1, 1, 1,
1.259175, 1.278351, -0.05847729, 1, 1, 1, 1, 1,
1.267141, 0.03049173, 1.620547, 1, 1, 1, 1, 1,
1.27532, -0.0889992, 4.383861, 1, 1, 1, 1, 1,
1.299064, 0.3633537, 2.297216, 1, 1, 1, 1, 1,
1.301763, 1.423619, -1.076844, 1, 1, 1, 1, 1,
1.306093, -0.6085724, 3.414798, 0, 0, 1, 1, 1,
1.307181, 1.914512, -0.4802615, 1, 0, 0, 1, 1,
1.310248, 1.046625, 0.4016409, 1, 0, 0, 1, 1,
1.315682, -1.495071, 0.7955543, 1, 0, 0, 1, 1,
1.315756, -0.5072107, 1.879284, 1, 0, 0, 1, 1,
1.319601, 0.3604436, 0.4276825, 1, 0, 0, 1, 1,
1.323073, 0.6051852, 0.04780825, 0, 0, 0, 1, 1,
1.328352, 0.2384125, 1.318125, 0, 0, 0, 1, 1,
1.332876, -1.586281, 4.521689, 0, 0, 0, 1, 1,
1.340066, -0.7836334, 2.482736, 0, 0, 0, 1, 1,
1.341479, -0.3693526, 1.64445, 0, 0, 0, 1, 1,
1.348334, 1.062506, 0.5624698, 0, 0, 0, 1, 1,
1.348581, -0.05747685, 2.072992, 0, 0, 0, 1, 1,
1.351919, -0.05603192, 0.3440188, 1, 1, 1, 1, 1,
1.365505, -0.7832721, 3.706872, 1, 1, 1, 1, 1,
1.377649, -1.025234, 1.746397, 1, 1, 1, 1, 1,
1.382334, 0.2019925, 1.056036, 1, 1, 1, 1, 1,
1.391989, -0.3028497, 1.039778, 1, 1, 1, 1, 1,
1.404198, -0.3697895, 1.479343, 1, 1, 1, 1, 1,
1.408394, -0.01002026, -1.239536, 1, 1, 1, 1, 1,
1.410084, 0.1704174, 2.978053, 1, 1, 1, 1, 1,
1.418622, 0.5929448, 1.900948, 1, 1, 1, 1, 1,
1.434572, 0.6978973, -1.522911, 1, 1, 1, 1, 1,
1.435376, -0.7999478, 3.962217, 1, 1, 1, 1, 1,
1.441336, -0.6406446, 3.009861, 1, 1, 1, 1, 1,
1.447781, -0.2457691, 1.396263, 1, 1, 1, 1, 1,
1.458725, -1.559193, 3.154461, 1, 1, 1, 1, 1,
1.462681, -0.5891424, 0.7483582, 1, 1, 1, 1, 1,
1.468802, 1.025463, 0.8368998, 0, 0, 1, 1, 1,
1.470146, 0.2828755, -0.2127256, 1, 0, 0, 1, 1,
1.471316, -1.244428, 1.42107, 1, 0, 0, 1, 1,
1.483413, -0.4070908, 1.310358, 1, 0, 0, 1, 1,
1.490446, -0.6049104, 3.762998, 1, 0, 0, 1, 1,
1.49301, 0.9002214, -0.20385, 1, 0, 0, 1, 1,
1.49686, 1.312256, 1.34067, 0, 0, 0, 1, 1,
1.498208, 0.6736605, 1.796265, 0, 0, 0, 1, 1,
1.500875, 0.224412, 1.536736, 0, 0, 0, 1, 1,
1.505693, 0.1373589, 2.19626, 0, 0, 0, 1, 1,
1.508603, 1.124385, 1.228597, 0, 0, 0, 1, 1,
1.521029, 0.4924283, 0.8822895, 0, 0, 0, 1, 1,
1.530157, 1.027309, 0.1150607, 0, 0, 0, 1, 1,
1.537441, -0.4955895, 1.950811, 1, 1, 1, 1, 1,
1.539017, 1.766543, 1.854266, 1, 1, 1, 1, 1,
1.540972, 1.731202, 1.441081, 1, 1, 1, 1, 1,
1.562273, -0.327801, 4.17797, 1, 1, 1, 1, 1,
1.568655, -0.05886561, 1.188486, 1, 1, 1, 1, 1,
1.592108, -0.9389534, 4.365683, 1, 1, 1, 1, 1,
1.593679, -1.089281, 1.167362, 1, 1, 1, 1, 1,
1.615616, -0.3595348, 3.177863, 1, 1, 1, 1, 1,
1.615851, -0.723528, 2.583206, 1, 1, 1, 1, 1,
1.625595, -0.3475776, 2.431717, 1, 1, 1, 1, 1,
1.649118, 0.07303506, 2.465977, 1, 1, 1, 1, 1,
1.654283, 0.1807861, 2.177176, 1, 1, 1, 1, 1,
1.669464, 1.201874, 1.06804, 1, 1, 1, 1, 1,
1.677037, -0.8130176, 1.750294, 1, 1, 1, 1, 1,
1.683844, -1.583715, 1.739359, 1, 1, 1, 1, 1,
1.686586, 1.412809, -0.2253232, 0, 0, 1, 1, 1,
1.689589, -0.6510623, 1.998825, 1, 0, 0, 1, 1,
1.699257, 2.257397, 1.062011, 1, 0, 0, 1, 1,
1.711918, 0.323319, 1.736811, 1, 0, 0, 1, 1,
1.722271, 1.678207, 2.856319, 1, 0, 0, 1, 1,
1.728955, 0.001031434, 0.3260804, 1, 0, 0, 1, 1,
1.736567, -0.5895934, 2.169978, 0, 0, 0, 1, 1,
1.750533, 0.6704127, 2.042209, 0, 0, 0, 1, 1,
1.752668, -1.079924, 0.8575393, 0, 0, 0, 1, 1,
1.758919, 0.5479602, 0.453503, 0, 0, 0, 1, 1,
1.761399, -0.5771375, 2.29081, 0, 0, 0, 1, 1,
1.761653, -0.7107975, 1.327933, 0, 0, 0, 1, 1,
1.764657, -0.6320456, 1.386736, 0, 0, 0, 1, 1,
1.785173, 1.593747, -1.339511, 1, 1, 1, 1, 1,
1.786829, -2.375299, 2.257228, 1, 1, 1, 1, 1,
1.791191, 0.7981733, 1.667206, 1, 1, 1, 1, 1,
1.84379, -0.9152108, 0.8936924, 1, 1, 1, 1, 1,
1.865413, 0.280568, 1.162423, 1, 1, 1, 1, 1,
1.880794, 0.5865893, 1.560097, 1, 1, 1, 1, 1,
1.89405, -1.718499, 1.988754, 1, 1, 1, 1, 1,
1.894331, -0.09893682, 0.7052387, 1, 1, 1, 1, 1,
1.902983, 1.312232, 2.031675, 1, 1, 1, 1, 1,
1.943265, 0.1915765, 0.9524745, 1, 1, 1, 1, 1,
1.947827, -1.966545, 3.368247, 1, 1, 1, 1, 1,
1.956873, 0.4649378, 0.5463024, 1, 1, 1, 1, 1,
1.965751, -0.9583918, 3.292625, 1, 1, 1, 1, 1,
1.979624, -0.5928437, 3.357778, 1, 1, 1, 1, 1,
1.986048, 0.8651322, -0.3812834, 1, 1, 1, 1, 1,
2.004223, -1.10704, 2.546799, 0, 0, 1, 1, 1,
2.048811, 0.1661442, 0.6327901, 1, 0, 0, 1, 1,
2.050472, -0.816288, 0.03681453, 1, 0, 0, 1, 1,
2.061811, -1.981219, 1.031986, 1, 0, 0, 1, 1,
2.118694, 1.027473, 2.073857, 1, 0, 0, 1, 1,
2.143236, -0.1542408, 2.171141, 1, 0, 0, 1, 1,
2.229767, -0.9071016, 1.138271, 0, 0, 0, 1, 1,
2.291937, 0.4496867, 2.61406, 0, 0, 0, 1, 1,
2.304214, -0.07417549, 1.684369, 0, 0, 0, 1, 1,
2.340549, -0.8127697, 0.3047076, 0, 0, 0, 1, 1,
2.361898, 1.243733, 0.5015816, 0, 0, 0, 1, 1,
2.408317, -0.16822, 2.097319, 0, 0, 0, 1, 1,
2.432998, -0.8412484, 3.032784, 0, 0, 0, 1, 1,
2.435656, -1.882996, 0.7346627, 1, 1, 1, 1, 1,
2.514283, -2.573949, 2.384636, 1, 1, 1, 1, 1,
2.574116, -0.8917293, 0.7896974, 1, 1, 1, 1, 1,
2.584246, 0.1857922, 1.076812, 1, 1, 1, 1, 1,
2.59748, 0.8571423, 2.415364, 1, 1, 1, 1, 1,
2.641925, 0.5376853, 2.001509, 1, 1, 1, 1, 1,
2.67019, -0.7405174, 1.381366, 1, 1, 1, 1, 1
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
var radius = 9.886993;
var distance = 34.72764;
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
mvMatrix.translate( 0.4821472, 0.07287025, 0.1743815 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72764);
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
