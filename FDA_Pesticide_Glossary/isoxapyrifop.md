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
-3.468489, -0.4211378, -1.681307, 1, 0, 0, 1,
-3.289894, -0.1413954, -0.09508041, 1, 0.007843138, 0, 1,
-3.103042, -0.6093982, -2.649469, 1, 0.01176471, 0, 1,
-3.039527, -1.705718, -2.126442, 1, 0.01960784, 0, 1,
-2.883541, -1.296586, -3.242525, 1, 0.02352941, 0, 1,
-2.74478, 0.1669101, 0.04966784, 1, 0.03137255, 0, 1,
-2.658753, -0.2871287, -1.104235, 1, 0.03529412, 0, 1,
-2.642735, -1.284411, -0.4098941, 1, 0.04313726, 0, 1,
-2.635984, 0.4014484, -1.671469, 1, 0.04705882, 0, 1,
-2.559365, -0.9755651, -2.432549, 1, 0.05490196, 0, 1,
-2.457124, 0.3505608, -2.020295, 1, 0.05882353, 0, 1,
-2.397057, -0.1794887, -1.373187, 1, 0.06666667, 0, 1,
-2.375856, -1.154396, -2.21127, 1, 0.07058824, 0, 1,
-2.375524, -0.5173149, -1.282217, 1, 0.07843138, 0, 1,
-2.362627, 0.3784531, -2.077398, 1, 0.08235294, 0, 1,
-2.32195, 0.4977827, -2.658751, 1, 0.09019608, 0, 1,
-2.231476, 1.511041, -0.2033497, 1, 0.09411765, 0, 1,
-2.217244, 0.7244533, -1.408671, 1, 0.1019608, 0, 1,
-2.209878, -2.179524, -2.173468, 1, 0.1098039, 0, 1,
-2.17475, 0.7009973, -1.599123, 1, 0.1137255, 0, 1,
-2.151766, 1.248938, -0.9784511, 1, 0.1215686, 0, 1,
-2.13947, 0.3643129, -1.651687, 1, 0.1254902, 0, 1,
-2.026388, 0.5234322, -1.72841, 1, 0.1333333, 0, 1,
-2.014194, -0.4227909, -0.8484797, 1, 0.1372549, 0, 1,
-2.005839, -0.08454998, -3.378327, 1, 0.145098, 0, 1,
-1.999896, -1.341461, -2.42253, 1, 0.1490196, 0, 1,
-1.995701, 1.062818, -0.3197356, 1, 0.1568628, 0, 1,
-1.995363, -1.600173, -2.259067, 1, 0.1607843, 0, 1,
-1.989156, -1.858424, -1.78429, 1, 0.1686275, 0, 1,
-1.983593, 0.445391, -3.096998, 1, 0.172549, 0, 1,
-1.95519, 0.7301264, -3.162247, 1, 0.1803922, 0, 1,
-1.947194, -1.033341, -2.067145, 1, 0.1843137, 0, 1,
-1.900945, 1.279131, -0.3193574, 1, 0.1921569, 0, 1,
-1.884243, -0.185559, -2.953593, 1, 0.1960784, 0, 1,
-1.844988, -1.635466, -3.042944, 1, 0.2039216, 0, 1,
-1.83172, 0.8916871, -0.746843, 1, 0.2117647, 0, 1,
-1.816252, 0.8092089, -2.742169, 1, 0.2156863, 0, 1,
-1.811111, 0.04247853, -1.029924, 1, 0.2235294, 0, 1,
-1.77111, 1.192853, -1.774199, 1, 0.227451, 0, 1,
-1.768146, 0.798516, -1.353622, 1, 0.2352941, 0, 1,
-1.74033, -0.7395856, -0.767761, 1, 0.2392157, 0, 1,
-1.736901, 1.05896, 0.2879478, 1, 0.2470588, 0, 1,
-1.716112, 1.113824, -0.6444585, 1, 0.2509804, 0, 1,
-1.713305, 1.301874, -1.132824, 1, 0.2588235, 0, 1,
-1.696564, -0.9742734, -3.351259, 1, 0.2627451, 0, 1,
-1.686744, -0.1850277, -2.203149, 1, 0.2705882, 0, 1,
-1.681391, 0.3143799, -1.433943, 1, 0.2745098, 0, 1,
-1.667413, -1.965202, -3.429536, 1, 0.282353, 0, 1,
-1.659755, 0.2998649, -2.329691, 1, 0.2862745, 0, 1,
-1.657046, -0.8201316, -2.492447, 1, 0.2941177, 0, 1,
-1.641178, 0.1843265, -2.208019, 1, 0.3019608, 0, 1,
-1.617042, 1.501376, 0.7184988, 1, 0.3058824, 0, 1,
-1.608028, 0.3182641, -1.769226, 1, 0.3137255, 0, 1,
-1.603463, -0.2787926, -1.973425, 1, 0.3176471, 0, 1,
-1.60252, 0.4521496, -0.937872, 1, 0.3254902, 0, 1,
-1.593688, -2.080281, -1.5407, 1, 0.3294118, 0, 1,
-1.587897, 1.5123, -1.016966, 1, 0.3372549, 0, 1,
-1.580795, 0.07471959, -3.449139, 1, 0.3411765, 0, 1,
-1.579741, 1.267776, -1.088696, 1, 0.3490196, 0, 1,
-1.552461, -1.549104, -4.166197, 1, 0.3529412, 0, 1,
-1.539942, -1.223499, -3.279872, 1, 0.3607843, 0, 1,
-1.520882, 0.498446, -2.199912, 1, 0.3647059, 0, 1,
-1.515707, -0.1006057, -3.121587, 1, 0.372549, 0, 1,
-1.51334, -0.1885764, -1.113415, 1, 0.3764706, 0, 1,
-1.480369, 0.143932, -2.89797, 1, 0.3843137, 0, 1,
-1.47754, 0.591602, 0.05962336, 1, 0.3882353, 0, 1,
-1.468694, -0.1436752, -2.409467, 1, 0.3960784, 0, 1,
-1.468102, -1.365239, -2.219033, 1, 0.4039216, 0, 1,
-1.447952, -0.485522, -1.232177, 1, 0.4078431, 0, 1,
-1.440179, -0.00730853, -1.770774, 1, 0.4156863, 0, 1,
-1.436979, 0.1077693, -1.756197, 1, 0.4196078, 0, 1,
-1.42667, -0.4541587, -1.830089, 1, 0.427451, 0, 1,
-1.423643, 0.5240753, -4.756628, 1, 0.4313726, 0, 1,
-1.413972, 1.178581, 0.7922868, 1, 0.4392157, 0, 1,
-1.403557, 0.2873152, -0.5524618, 1, 0.4431373, 0, 1,
-1.403002, -0.3990045, -1.322759, 1, 0.4509804, 0, 1,
-1.402138, -1.640671, -2.506021, 1, 0.454902, 0, 1,
-1.399816, -0.9157998, -2.675538, 1, 0.4627451, 0, 1,
-1.396551, 1.324499, -0.3533096, 1, 0.4666667, 0, 1,
-1.390068, 0.15644, -1.81858, 1, 0.4745098, 0, 1,
-1.386041, -2.257571, -3.391946, 1, 0.4784314, 0, 1,
-1.374576, 0.09563936, -1.939573, 1, 0.4862745, 0, 1,
-1.371336, -0.3692488, -2.677157, 1, 0.4901961, 0, 1,
-1.366138, -0.05643862, -4.111989, 1, 0.4980392, 0, 1,
-1.362062, 0.6842991, -1.318412, 1, 0.5058824, 0, 1,
-1.354654, -0.8981253, -1.358247, 1, 0.509804, 0, 1,
-1.354477, 0.7619411, -1.81594, 1, 0.5176471, 0, 1,
-1.35403, -0.9311768, -1.552928, 1, 0.5215687, 0, 1,
-1.342647, 0.207654, -1.156778, 1, 0.5294118, 0, 1,
-1.341027, -0.3215299, -1.089987, 1, 0.5333334, 0, 1,
-1.340685, 0.3603943, -0.4932389, 1, 0.5411765, 0, 1,
-1.331349, 0.597249, -0.4331573, 1, 0.5450981, 0, 1,
-1.325007, -0.6744497, -1.048968, 1, 0.5529412, 0, 1,
-1.321926, -1.028315, -4.301976, 1, 0.5568628, 0, 1,
-1.312749, -0.3643904, -4.22009, 1, 0.5647059, 0, 1,
-1.311613, -0.1855779, -2.309779, 1, 0.5686275, 0, 1,
-1.304866, 1.304596, 0.4680614, 1, 0.5764706, 0, 1,
-1.289542, -0.6031196, -0.5030378, 1, 0.5803922, 0, 1,
-1.284694, 0.2585239, -0.5668328, 1, 0.5882353, 0, 1,
-1.281639, -0.8815287, -1.571315, 1, 0.5921569, 0, 1,
-1.278225, 0.2901288, 0.3319091, 1, 0.6, 0, 1,
-1.268512, -0.213936, -2.224526, 1, 0.6078432, 0, 1,
-1.268169, -1.096401, -2.437111, 1, 0.6117647, 0, 1,
-1.263797, -1.36132, -2.347447, 1, 0.6196079, 0, 1,
-1.260148, 0.5822669, -0.5847641, 1, 0.6235294, 0, 1,
-1.245575, -0.8853925, -2.123427, 1, 0.6313726, 0, 1,
-1.239339, -1.471539, -3.072732, 1, 0.6352941, 0, 1,
-1.233637, 0.05494754, -2.808032, 1, 0.6431373, 0, 1,
-1.232238, 0.5018469, -3.184285, 1, 0.6470588, 0, 1,
-1.218828, -1.237197, -3.1982, 1, 0.654902, 0, 1,
-1.213738, -0.5165411, -2.990253, 1, 0.6588235, 0, 1,
-1.211895, -1.378685, -2.502213, 1, 0.6666667, 0, 1,
-1.206614, -0.05108949, -3.33536, 1, 0.6705883, 0, 1,
-1.2031, -2.081464, -2.077277, 1, 0.6784314, 0, 1,
-1.198607, -1.886602, -1.479129, 1, 0.682353, 0, 1,
-1.197191, -0.2465524, -1.149328, 1, 0.6901961, 0, 1,
-1.191556, 1.559623, -2.093458, 1, 0.6941177, 0, 1,
-1.177911, 0.4020845, -1.997918, 1, 0.7019608, 0, 1,
-1.173261, -0.9063296, -1.517977, 1, 0.7098039, 0, 1,
-1.172326, -1.757655, -0.6746491, 1, 0.7137255, 0, 1,
-1.169549, -0.0182567, -2.253519, 1, 0.7215686, 0, 1,
-1.169132, 0.3425995, 0.610774, 1, 0.7254902, 0, 1,
-1.16724, -0.1400112, -1.219536, 1, 0.7333333, 0, 1,
-1.144545, 2.229841, -0.515023, 1, 0.7372549, 0, 1,
-1.137651, -0.1743079, -3.060826, 1, 0.7450981, 0, 1,
-1.135146, 0.450225, -2.153055, 1, 0.7490196, 0, 1,
-1.134187, -0.8723522, -2.387034, 1, 0.7568628, 0, 1,
-1.126046, 0.494045, -2.093223, 1, 0.7607843, 0, 1,
-1.125193, 0.5182294, 0.1107803, 1, 0.7686275, 0, 1,
-1.122438, 1.058133, -2.030312, 1, 0.772549, 0, 1,
-1.113412, 0.6889519, -1.127199, 1, 0.7803922, 0, 1,
-1.112333, 0.009479415, -0.8784276, 1, 0.7843137, 0, 1,
-1.111469, -0.0129229, -2.630277, 1, 0.7921569, 0, 1,
-1.10718, 1.559553, -0.3585013, 1, 0.7960784, 0, 1,
-1.105334, -0.6113699, -1.598985, 1, 0.8039216, 0, 1,
-1.105157, 0.4575396, -1.439251, 1, 0.8117647, 0, 1,
-1.094568, -0.3285278, -2.23585, 1, 0.8156863, 0, 1,
-1.086793, 0.9082974, -2.943701, 1, 0.8235294, 0, 1,
-1.086662, -1.125615, -1.39067, 1, 0.827451, 0, 1,
-1.085771, 0.7695615, -1.601778, 1, 0.8352941, 0, 1,
-1.083206, 0.8740321, -1.121341, 1, 0.8392157, 0, 1,
-1.080459, 0.6400783, -0.4143282, 1, 0.8470588, 0, 1,
-1.075463, -0.3204905, 0.2571674, 1, 0.8509804, 0, 1,
-1.061897, 0.4410863, -0.7808511, 1, 0.8588235, 0, 1,
-1.060859, 1.32974, -1.74139, 1, 0.8627451, 0, 1,
-1.053595, -0.8617892, -1.658111, 1, 0.8705882, 0, 1,
-1.04658, 0.6703617, -0.7013719, 1, 0.8745098, 0, 1,
-1.042879, -1.251734, -2.077372, 1, 0.8823529, 0, 1,
-1.041594, 1.087826, -2.927866, 1, 0.8862745, 0, 1,
-1.041448, -0.4348488, -1.69098, 1, 0.8941177, 0, 1,
-1.040006, 1.583287, -0.1809512, 1, 0.8980392, 0, 1,
-1.039812, 0.4378038, 0.01893186, 1, 0.9058824, 0, 1,
-1.039033, 1.003456, 0.7449794, 1, 0.9137255, 0, 1,
-1.030998, 0.5375592, -0.1670878, 1, 0.9176471, 0, 1,
-1.030797, -2.215337, -1.909992, 1, 0.9254902, 0, 1,
-1.029639, -1.559936, -3.538355, 1, 0.9294118, 0, 1,
-1.023745, -1.01896, -2.801867, 1, 0.9372549, 0, 1,
-1.013193, 0.4104938, -0.8279939, 1, 0.9411765, 0, 1,
-1.010498, -2.515901, -1.810369, 1, 0.9490196, 0, 1,
-1.008243, -1.058446, -1.146965, 1, 0.9529412, 0, 1,
-1.005737, 1.713273, -1.454036, 1, 0.9607843, 0, 1,
-1.001661, 0.7077477, -1.000566, 1, 0.9647059, 0, 1,
-1.000226, 0.4529343, -0.687319, 1, 0.972549, 0, 1,
-1.000044, 1.309122, -1.467276, 1, 0.9764706, 0, 1,
-0.9981704, 0.02424304, -0.7668273, 1, 0.9843137, 0, 1,
-0.9942325, -0.05057786, 0.3862432, 1, 0.9882353, 0, 1,
-0.9934701, -1.03057, -3.817827, 1, 0.9960784, 0, 1,
-0.9898125, -0.02301896, -2.128224, 0.9960784, 1, 0, 1,
-0.9808984, 1.587968, 0.3852733, 0.9921569, 1, 0, 1,
-0.9625596, -1.374186, -2.324698, 0.9843137, 1, 0, 1,
-0.9600031, 1.831999, 0.0861899, 0.9803922, 1, 0, 1,
-0.9535356, -0.629099, -1.635428, 0.972549, 1, 0, 1,
-0.9313011, -2.218535, -2.907929, 0.9686275, 1, 0, 1,
-0.9255937, 2.976501, 1.035376, 0.9607843, 1, 0, 1,
-0.9181602, 0.2151614, -0.7870669, 0.9568627, 1, 0, 1,
-0.9139406, -0.1053759, -1.346637, 0.9490196, 1, 0, 1,
-0.9039364, -1.782837, -0.2463547, 0.945098, 1, 0, 1,
-0.9034321, -0.6734512, -2.052372, 0.9372549, 1, 0, 1,
-0.8970166, 0.2595428, -1.906932, 0.9333333, 1, 0, 1,
-0.8932758, -0.1320544, -0.3754457, 0.9254902, 1, 0, 1,
-0.8899994, 1.784747, -1.147926, 0.9215686, 1, 0, 1,
-0.877023, 0.4734383, -0.6715716, 0.9137255, 1, 0, 1,
-0.8623112, -0.6339863, -2.510684, 0.9098039, 1, 0, 1,
-0.8578796, -2.394011, -2.471804, 0.9019608, 1, 0, 1,
-0.8575398, 1.689931, -1.398923, 0.8941177, 1, 0, 1,
-0.8537301, -1.916549, -4.053407, 0.8901961, 1, 0, 1,
-0.8525895, 1.17903, -1.092611, 0.8823529, 1, 0, 1,
-0.8498214, 1.190408, -1.683483, 0.8784314, 1, 0, 1,
-0.8490842, -1.027261, -2.467601, 0.8705882, 1, 0, 1,
-0.8390074, 1.030262, -0.469722, 0.8666667, 1, 0, 1,
-0.836333, -0.9752955, -1.446322, 0.8588235, 1, 0, 1,
-0.8277661, 0.2438016, -1.42698, 0.854902, 1, 0, 1,
-0.8277074, -0.4513664, -2.204069, 0.8470588, 1, 0, 1,
-0.8258644, 0.04702679, -0.6193007, 0.8431373, 1, 0, 1,
-0.8254938, -0.9397805, -2.548938, 0.8352941, 1, 0, 1,
-0.8246658, -1.280528, -1.179277, 0.8313726, 1, 0, 1,
-0.8237267, -0.943205, -3.577276, 0.8235294, 1, 0, 1,
-0.8214781, -1.677051, -4.339109, 0.8196079, 1, 0, 1,
-0.8209478, -0.03080144, -2.85079, 0.8117647, 1, 0, 1,
-0.8051909, -0.7007756, -2.626006, 0.8078431, 1, 0, 1,
-0.8046672, -0.6847756, -3.806242, 0.8, 1, 0, 1,
-0.7987819, 0.8131818, 0.8846739, 0.7921569, 1, 0, 1,
-0.7945583, -0.7875448, -1.624877, 0.7882353, 1, 0, 1,
-0.7907295, -0.8114291, -1.743304, 0.7803922, 1, 0, 1,
-0.7902139, 0.8041642, 0.119394, 0.7764706, 1, 0, 1,
-0.7868183, -0.692232, -1.827055, 0.7686275, 1, 0, 1,
-0.7865811, -0.5488344, -3.598063, 0.7647059, 1, 0, 1,
-0.7862262, -0.3014536, -0.9944288, 0.7568628, 1, 0, 1,
-0.7813756, 1.313504, -2.085971, 0.7529412, 1, 0, 1,
-0.7780904, -1.141297, -1.79358, 0.7450981, 1, 0, 1,
-0.7745317, -0.2657961, -3.88121, 0.7411765, 1, 0, 1,
-0.7740136, 0.5454, -1.536554, 0.7333333, 1, 0, 1,
-0.7718204, -0.4335158, -1.258243, 0.7294118, 1, 0, 1,
-0.7715, 0.3159113, -1.806794, 0.7215686, 1, 0, 1,
-0.7698097, -0.5370035, -0.2612607, 0.7176471, 1, 0, 1,
-0.7664559, -0.43241, -2.448614, 0.7098039, 1, 0, 1,
-0.7661625, 2.038141, -0.511766, 0.7058824, 1, 0, 1,
-0.7629182, 1.197004, -0.5702486, 0.6980392, 1, 0, 1,
-0.762722, 0.1987085, -0.2050138, 0.6901961, 1, 0, 1,
-0.7613749, 0.9804217, -1.884208, 0.6862745, 1, 0, 1,
-0.7537922, 0.05892062, -0.7442887, 0.6784314, 1, 0, 1,
-0.7459561, -0.4767889, -2.18511, 0.6745098, 1, 0, 1,
-0.7443085, 0.489538, -0.6455041, 0.6666667, 1, 0, 1,
-0.7422045, -1.603822, -2.432811, 0.6627451, 1, 0, 1,
-0.7403688, -1.658857, -3.487557, 0.654902, 1, 0, 1,
-0.7403263, 0.135467, -2.177585, 0.6509804, 1, 0, 1,
-0.7394411, -1.214815, -2.505882, 0.6431373, 1, 0, 1,
-0.7294843, 0.2139113, -2.316454, 0.6392157, 1, 0, 1,
-0.7249736, -0.60678, -1.105682, 0.6313726, 1, 0, 1,
-0.7233247, 0.1405271, -0.6218787, 0.627451, 1, 0, 1,
-0.7229817, -0.8082086, -1.144671, 0.6196079, 1, 0, 1,
-0.7195369, -0.5671592, -2.735079, 0.6156863, 1, 0, 1,
-0.7167648, -0.2717206, -1.495271, 0.6078432, 1, 0, 1,
-0.7126402, -1.245046, -2.606468, 0.6039216, 1, 0, 1,
-0.7068924, 0.2322544, 0.3289512, 0.5960785, 1, 0, 1,
-0.7060098, 0.6891611, -1.059739, 0.5882353, 1, 0, 1,
-0.7053279, 2.158659, -1.922461, 0.5843138, 1, 0, 1,
-0.7050999, -1.183795, -2.807351, 0.5764706, 1, 0, 1,
-0.6936989, -0.4137487, -2.224569, 0.572549, 1, 0, 1,
-0.6918747, 2.551821, -1.104343, 0.5647059, 1, 0, 1,
-0.6905199, 0.9504935, -0.4245378, 0.5607843, 1, 0, 1,
-0.6895449, 0.837042, -0.9774289, 0.5529412, 1, 0, 1,
-0.6861129, -1.378596, -2.627762, 0.5490196, 1, 0, 1,
-0.682959, 0.8216719, 0.2814739, 0.5411765, 1, 0, 1,
-0.6822202, 0.170227, -0.6047484, 0.5372549, 1, 0, 1,
-0.6817061, -1.496268, -1.946898, 0.5294118, 1, 0, 1,
-0.6782974, 1.197398, 0.09397445, 0.5254902, 1, 0, 1,
-0.6740106, 1.442721, -1.397456, 0.5176471, 1, 0, 1,
-0.665211, -2.145576, -4.405622, 0.5137255, 1, 0, 1,
-0.663069, 0.7794597, -0.2821634, 0.5058824, 1, 0, 1,
-0.6625468, 0.8346063, -0.5588837, 0.5019608, 1, 0, 1,
-0.6615239, -0.74542, -3.379018, 0.4941176, 1, 0, 1,
-0.6553423, 0.1079519, -1.560866, 0.4862745, 1, 0, 1,
-0.6517086, 1.322054, -2.287847, 0.4823529, 1, 0, 1,
-0.6494622, -1.24569, -1.961305, 0.4745098, 1, 0, 1,
-0.6465597, -1.140204, 0.5229561, 0.4705882, 1, 0, 1,
-0.6451643, 1.399472, -0.1754989, 0.4627451, 1, 0, 1,
-0.6405873, -0.6600022, -2.863079, 0.4588235, 1, 0, 1,
-0.6382533, 0.1011037, 0.01195416, 0.4509804, 1, 0, 1,
-0.6370099, 0.6214422, -1.45188, 0.4470588, 1, 0, 1,
-0.6338148, 0.5894014, -0.4397306, 0.4392157, 1, 0, 1,
-0.6311504, 2.02625, -0.1772999, 0.4352941, 1, 0, 1,
-0.6287399, -0.07523811, -1.463561, 0.427451, 1, 0, 1,
-0.6195918, 0.6086501, -0.6163562, 0.4235294, 1, 0, 1,
-0.6176012, -0.2756739, -2.570993, 0.4156863, 1, 0, 1,
-0.6160729, 1.906626, 0.3739533, 0.4117647, 1, 0, 1,
-0.6125151, -0.1168123, -1.571391, 0.4039216, 1, 0, 1,
-0.6111377, 1.534825, -0.7450799, 0.3960784, 1, 0, 1,
-0.6096593, -1.044001, -3.139098, 0.3921569, 1, 0, 1,
-0.6051192, 0.9724379, -0.447034, 0.3843137, 1, 0, 1,
-0.604282, 1.75695, -1.120678, 0.3803922, 1, 0, 1,
-0.597573, -0.3003151, -1.028871, 0.372549, 1, 0, 1,
-0.5941646, -0.174718, -1.354738, 0.3686275, 1, 0, 1,
-0.5936485, 0.5305923, -1.158819, 0.3607843, 1, 0, 1,
-0.5921526, 0.2366692, -1.383128, 0.3568628, 1, 0, 1,
-0.592043, -2.441579, -1.886412, 0.3490196, 1, 0, 1,
-0.5891392, -0.5046132, -2.311541, 0.345098, 1, 0, 1,
-0.5887404, -0.2966906, -2.21749, 0.3372549, 1, 0, 1,
-0.58748, -1.146291, -2.969898, 0.3333333, 1, 0, 1,
-0.5860955, -0.6291081, 0.02227377, 0.3254902, 1, 0, 1,
-0.5841818, -0.7754156, -1.137972, 0.3215686, 1, 0, 1,
-0.5836502, -0.3699507, -2.372191, 0.3137255, 1, 0, 1,
-0.583142, 0.639235, -1.33253, 0.3098039, 1, 0, 1,
-0.5823683, 0.5255386, -1.90644, 0.3019608, 1, 0, 1,
-0.5805965, 0.2279366, -0.996907, 0.2941177, 1, 0, 1,
-0.5763108, -0.7292838, -2.267705, 0.2901961, 1, 0, 1,
-0.5683699, -0.5414721, -1.717157, 0.282353, 1, 0, 1,
-0.5677115, 0.1716174, -1.980645, 0.2784314, 1, 0, 1,
-0.5546553, -0.4687987, -2.200214, 0.2705882, 1, 0, 1,
-0.5541705, 0.1931042, -0.176972, 0.2666667, 1, 0, 1,
-0.5508094, -0.9777541, -2.299995, 0.2588235, 1, 0, 1,
-0.5498235, -0.5305616, 0.952564, 0.254902, 1, 0, 1,
-0.5442896, 0.3264973, -1.57014, 0.2470588, 1, 0, 1,
-0.5421969, 1.246006, -1.034723, 0.2431373, 1, 0, 1,
-0.5409249, 0.518418, 1.251488, 0.2352941, 1, 0, 1,
-0.5377802, 0.02824746, -0.4606013, 0.2313726, 1, 0, 1,
-0.5370245, 0.1913952, -1.58009, 0.2235294, 1, 0, 1,
-0.5356529, -0.3492058, -0.2233037, 0.2196078, 1, 0, 1,
-0.5312217, -0.2417252, -2.013508, 0.2117647, 1, 0, 1,
-0.5288755, 0.7815447, 0.1357964, 0.2078431, 1, 0, 1,
-0.5283728, -0.1182606, -2.107574, 0.2, 1, 0, 1,
-0.5272961, -0.3860613, -0.8449612, 0.1921569, 1, 0, 1,
-0.5219973, -0.1070967, -0.1599013, 0.1882353, 1, 0, 1,
-0.5150728, 1.126784, 0.520269, 0.1803922, 1, 0, 1,
-0.5141261, 1.043305, -0.4071827, 0.1764706, 1, 0, 1,
-0.5128276, 1.475454, -0.7711446, 0.1686275, 1, 0, 1,
-0.5116079, 0.6025337, 0.1207356, 0.1647059, 1, 0, 1,
-0.5097159, 1.119967, -0.315209, 0.1568628, 1, 0, 1,
-0.5087079, -0.04585424, -1.442116, 0.1529412, 1, 0, 1,
-0.5067973, -0.897182, -1.294788, 0.145098, 1, 0, 1,
-0.5051786, 1.388259, -1.028909, 0.1411765, 1, 0, 1,
-0.5049595, -0.8972586, -2.290116, 0.1333333, 1, 0, 1,
-0.4976197, 0.8782113, -0.6821984, 0.1294118, 1, 0, 1,
-0.4961042, 0.7059368, -0.7213076, 0.1215686, 1, 0, 1,
-0.4931904, -0.5385265, -2.978, 0.1176471, 1, 0, 1,
-0.4930516, -0.4286996, -3.850148, 0.1098039, 1, 0, 1,
-0.4870214, -1.521343, -2.558142, 0.1058824, 1, 0, 1,
-0.4866464, -0.384124, -2.458357, 0.09803922, 1, 0, 1,
-0.4798352, -0.1245385, -2.208241, 0.09019608, 1, 0, 1,
-0.4756283, 0.7131686, -1.155873, 0.08627451, 1, 0, 1,
-0.4743516, -0.1269365, -1.365037, 0.07843138, 1, 0, 1,
-0.4737068, -0.8342651, -2.879351, 0.07450981, 1, 0, 1,
-0.4732887, -0.4869035, -3.213744, 0.06666667, 1, 0, 1,
-0.4715953, 0.1979283, -2.480945, 0.0627451, 1, 0, 1,
-0.4711854, -1.480049, -1.982052, 0.05490196, 1, 0, 1,
-0.4706541, 1.808289, 0.1557091, 0.05098039, 1, 0, 1,
-0.4682347, -1.320132, -1.7119, 0.04313726, 1, 0, 1,
-0.4681405, -2.114348, -2.887808, 0.03921569, 1, 0, 1,
-0.4666529, 1.685658, -0.9088315, 0.03137255, 1, 0, 1,
-0.4639558, 0.2300297, -0.342333, 0.02745098, 1, 0, 1,
-0.4633125, 1.075615, 0.5141293, 0.01960784, 1, 0, 1,
-0.4630221, -1.011829, -4.537044, 0.01568628, 1, 0, 1,
-0.4593145, 1.420663, 1.352541, 0.007843138, 1, 0, 1,
-0.4561343, -1.360721, -2.493121, 0.003921569, 1, 0, 1,
-0.4556323, 1.222705, -0.4565863, 0, 1, 0.003921569, 1,
-0.4546237, 0.6547237, -1.744737, 0, 1, 0.01176471, 1,
-0.4509834, 0.3722876, -0.05322544, 0, 1, 0.01568628, 1,
-0.4509814, -0.01628896, 0.8455276, 0, 1, 0.02352941, 1,
-0.4499837, -1.129665, -3.286024, 0, 1, 0.02745098, 1,
-0.4498961, 0.08594089, -2.628784, 0, 1, 0.03529412, 1,
-0.4482975, -0.3786569, -0.6285206, 0, 1, 0.03921569, 1,
-0.4424326, -0.6703696, -2.179033, 0, 1, 0.04705882, 1,
-0.440304, 0.4770235, -1.159391, 0, 1, 0.05098039, 1,
-0.4398603, -0.8360727, -3.1941, 0, 1, 0.05882353, 1,
-0.4360973, 0.7720699, -1.382102, 0, 1, 0.0627451, 1,
-0.431649, -0.1768759, -2.775719, 0, 1, 0.07058824, 1,
-0.4302385, 0.2765777, -2.560205, 0, 1, 0.07450981, 1,
-0.425709, 0.1387008, -1.094237, 0, 1, 0.08235294, 1,
-0.4254906, -0.0743844, -1.304332, 0, 1, 0.08627451, 1,
-0.423378, -0.3368601, -3.193509, 0, 1, 0.09411765, 1,
-0.4228585, 1.281596, -2.689165, 0, 1, 0.1019608, 1,
-0.41963, -0.7541098, -3.079255, 0, 1, 0.1058824, 1,
-0.4163829, -0.3363937, -2.723392, 0, 1, 0.1137255, 1,
-0.4141592, 0.2012142, -1.435394, 0, 1, 0.1176471, 1,
-0.4120525, 0.6959401, -0.8996403, 0, 1, 0.1254902, 1,
-0.407334, 1.77307, -0.5743457, 0, 1, 0.1294118, 1,
-0.4049194, -1.501365, -2.745847, 0, 1, 0.1372549, 1,
-0.4019507, 0.6493362, -1.04699, 0, 1, 0.1411765, 1,
-0.4009234, -0.526778, -1.48319, 0, 1, 0.1490196, 1,
-0.4007733, -1.823931, -3.405121, 0, 1, 0.1529412, 1,
-0.3973804, -1.76463, -3.029367, 0, 1, 0.1607843, 1,
-0.3956264, 0.1381425, -1.317335, 0, 1, 0.1647059, 1,
-0.3952115, 0.9009676, 0.3754449, 0, 1, 0.172549, 1,
-0.3841996, 0.1995039, 0.7043018, 0, 1, 0.1764706, 1,
-0.382803, -1.190396, -2.471624, 0, 1, 0.1843137, 1,
-0.3824804, 0.7623088, -0.8346989, 0, 1, 0.1882353, 1,
-0.3824505, 0.864308, 0.4035721, 0, 1, 0.1960784, 1,
-0.3784544, 0.4798428, -1.520981, 0, 1, 0.2039216, 1,
-0.3776424, -1.646259, -2.38726, 0, 1, 0.2078431, 1,
-0.3773219, 0.4028394, -1.718763, 0, 1, 0.2156863, 1,
-0.3715859, 0.4112959, -3.497844, 0, 1, 0.2196078, 1,
-0.3710675, -0.02591688, -2.873271, 0, 1, 0.227451, 1,
-0.3652127, -0.8812098, -4.441389, 0, 1, 0.2313726, 1,
-0.364434, -2.056839, -2.976838, 0, 1, 0.2392157, 1,
-0.364055, 0.4676555, 0.6191368, 0, 1, 0.2431373, 1,
-0.3617262, -0.6829604, 0.1829119, 0, 1, 0.2509804, 1,
-0.355525, 0.2278875, -2.067927, 0, 1, 0.254902, 1,
-0.3525122, 0.01004697, -2.690764, 0, 1, 0.2627451, 1,
-0.3515689, -0.2151562, -2.472469, 0, 1, 0.2666667, 1,
-0.3430508, -1.064725, -3.255494, 0, 1, 0.2745098, 1,
-0.3403634, -1.290933, -1.957709, 0, 1, 0.2784314, 1,
-0.3402931, 0.5494439, 1.997721, 0, 1, 0.2862745, 1,
-0.3385381, 1.62019, 0.7739534, 0, 1, 0.2901961, 1,
-0.3368229, 0.9512056, 0.0811439, 0, 1, 0.2980392, 1,
-0.333756, -1.327365, -3.905099, 0, 1, 0.3058824, 1,
-0.3299438, 0.9273324, 0.3686364, 0, 1, 0.3098039, 1,
-0.3240527, 0.4202678, -1.269753, 0, 1, 0.3176471, 1,
-0.3138394, -0.6696439, -4.154023, 0, 1, 0.3215686, 1,
-0.3125995, -3.053534, -2.633898, 0, 1, 0.3294118, 1,
-0.3117546, 0.5503296, 0.3521339, 0, 1, 0.3333333, 1,
-0.3080486, 0.9713519, 1.21825, 0, 1, 0.3411765, 1,
-0.3045116, -0.8571841, -3.507776, 0, 1, 0.345098, 1,
-0.3025416, 0.3717956, -2.915765, 0, 1, 0.3529412, 1,
-0.3019453, 0.1862212, -2.824654, 0, 1, 0.3568628, 1,
-0.3013182, -1.380564, -3.940236, 0, 1, 0.3647059, 1,
-0.3012221, 0.9972668, 0.07138785, 0, 1, 0.3686275, 1,
-0.3011109, 0.5757214, -0.4009821, 0, 1, 0.3764706, 1,
-0.2990288, 0.4037866, 0.1470539, 0, 1, 0.3803922, 1,
-0.2986421, -0.8804792, -0.9979162, 0, 1, 0.3882353, 1,
-0.2953941, -0.7848982, -0.9953788, 0, 1, 0.3921569, 1,
-0.2944947, 0.1136913, -1.526163, 0, 1, 0.4, 1,
-0.2895889, -0.8062908, -2.990992, 0, 1, 0.4078431, 1,
-0.2834425, -0.6758976, -3.13343, 0, 1, 0.4117647, 1,
-0.2819383, -0.113567, -1.592494, 0, 1, 0.4196078, 1,
-0.2815482, -2.062947, -3.613583, 0, 1, 0.4235294, 1,
-0.2812931, -0.8735141, -3.493228, 0, 1, 0.4313726, 1,
-0.2713545, -0.4301088, -3.744782, 0, 1, 0.4352941, 1,
-0.2711983, 0.1147005, -2.794723, 0, 1, 0.4431373, 1,
-0.2683193, -0.7548771, -3.13499, 0, 1, 0.4470588, 1,
-0.2668568, -0.4765082, -4.071798, 0, 1, 0.454902, 1,
-0.2664886, -0.2418731, -2.538809, 0, 1, 0.4588235, 1,
-0.2647063, -0.7361106, -3.744248, 0, 1, 0.4666667, 1,
-0.2640566, 0.07609103, -2.063035, 0, 1, 0.4705882, 1,
-0.2635382, 0.8318655, -0.06229649, 0, 1, 0.4784314, 1,
-0.2628068, -0.7991372, -3.187139, 0, 1, 0.4823529, 1,
-0.260646, 0.4207447, -0.5237992, 0, 1, 0.4901961, 1,
-0.2580649, 0.4131569, 0.151265, 0, 1, 0.4941176, 1,
-0.2576048, -0.8042736, -1.399173, 0, 1, 0.5019608, 1,
-0.2545596, 0.5849422, 0.9719191, 0, 1, 0.509804, 1,
-0.2530467, -0.232395, -1.273654, 0, 1, 0.5137255, 1,
-0.2505682, -1.012935, -3.880353, 0, 1, 0.5215687, 1,
-0.2437294, 1.104356, 0.08009824, 0, 1, 0.5254902, 1,
-0.2430184, -0.3853187, -2.138288, 0, 1, 0.5333334, 1,
-0.2392346, -0.7183871, -3.129843, 0, 1, 0.5372549, 1,
-0.2323271, 0.3766354, -1.94492, 0, 1, 0.5450981, 1,
-0.2315016, 0.1630776, -0.6355237, 0, 1, 0.5490196, 1,
-0.2280258, 1.75445, -1.263872, 0, 1, 0.5568628, 1,
-0.2274372, 1.10535, 0.07676923, 0, 1, 0.5607843, 1,
-0.2235294, 1.234887, -0.1632798, 0, 1, 0.5686275, 1,
-0.2230413, 0.6619886, -2.450477, 0, 1, 0.572549, 1,
-0.2228596, 0.9871651, -1.43575, 0, 1, 0.5803922, 1,
-0.2187987, -0.01047632, -1.298682, 0, 1, 0.5843138, 1,
-0.2173404, -0.5192318, -4.329926, 0, 1, 0.5921569, 1,
-0.2161435, 0.606095, -2.288358, 0, 1, 0.5960785, 1,
-0.2129513, 0.03289372, -1.88134, 0, 1, 0.6039216, 1,
-0.211947, -0.1688, -3.872807, 0, 1, 0.6117647, 1,
-0.2093226, -1.727336, -2.929763, 0, 1, 0.6156863, 1,
-0.2054285, 1.137854, -0.1427058, 0, 1, 0.6235294, 1,
-0.2044095, -1.75133, -3.994367, 0, 1, 0.627451, 1,
-0.2043742, 0.02150033, -1.795765, 0, 1, 0.6352941, 1,
-0.2020256, -0.005373983, -2.853108, 0, 1, 0.6392157, 1,
-0.200943, 0.1845178, -0.4373453, 0, 1, 0.6470588, 1,
-0.1988273, 2.013964, -0.2322641, 0, 1, 0.6509804, 1,
-0.1965756, -1.004179, -2.247063, 0, 1, 0.6588235, 1,
-0.1958813, 0.7036125, 0.1000246, 0, 1, 0.6627451, 1,
-0.1893625, -0.6346706, -2.2893, 0, 1, 0.6705883, 1,
-0.1892099, -0.1658526, -1.177158, 0, 1, 0.6745098, 1,
-0.185771, 2.30179, 0.9622393, 0, 1, 0.682353, 1,
-0.1827407, -0.5774881, -3.155954, 0, 1, 0.6862745, 1,
-0.1807116, 0.05081542, -2.332321, 0, 1, 0.6941177, 1,
-0.1781724, -0.156459, -2.80299, 0, 1, 0.7019608, 1,
-0.1777758, 0.3683443, 0.2352266, 0, 1, 0.7058824, 1,
-0.1692443, 0.8244695, 1.428166, 0, 1, 0.7137255, 1,
-0.15975, 0.8600038, 0.61702, 0, 1, 0.7176471, 1,
-0.1596022, 0.6471096, 1.836466, 0, 1, 0.7254902, 1,
-0.1585554, -0.4870013, -2.779182, 0, 1, 0.7294118, 1,
-0.1583902, 0.6962204, -0.5371025, 0, 1, 0.7372549, 1,
-0.1577407, -0.4511729, -4.314759, 0, 1, 0.7411765, 1,
-0.1539836, 0.7717315, 0.907754, 0, 1, 0.7490196, 1,
-0.1536216, -0.4045155, -4.318422, 0, 1, 0.7529412, 1,
-0.1515057, 0.428066, 0.180776, 0, 1, 0.7607843, 1,
-0.1497642, -0.9349683, -2.971999, 0, 1, 0.7647059, 1,
-0.1455003, -0.008732783, -3.571486, 0, 1, 0.772549, 1,
-0.1424163, 0.1152263, -1.5893, 0, 1, 0.7764706, 1,
-0.1416973, 0.04861492, -1.986714, 0, 1, 0.7843137, 1,
-0.1378015, -0.09880932, -1.004195, 0, 1, 0.7882353, 1,
-0.1309146, -0.7373185, -3.18013, 0, 1, 0.7960784, 1,
-0.1308127, 2.933817, 1.057294, 0, 1, 0.8039216, 1,
-0.1297726, 0.8031075, -0.4101564, 0, 1, 0.8078431, 1,
-0.1250807, 0.6209934, -0.1117171, 0, 1, 0.8156863, 1,
-0.1208433, 0.6152698, 0.9360229, 0, 1, 0.8196079, 1,
-0.1199375, -0.2354299, -1.286159, 0, 1, 0.827451, 1,
-0.1170654, 0.6178249, 0.5762189, 0, 1, 0.8313726, 1,
-0.1146154, 0.2855431, -0.9392033, 0, 1, 0.8392157, 1,
-0.1059722, 0.5431882, 0.0248512, 0, 1, 0.8431373, 1,
-0.1055989, 0.2038079, -1.515255, 0, 1, 0.8509804, 1,
-0.103944, -0.5322013, -4.320255, 0, 1, 0.854902, 1,
-0.1025135, -0.143735, -2.46336, 0, 1, 0.8627451, 1,
-0.1024965, -0.4135565, -3.416736, 0, 1, 0.8666667, 1,
-0.1001201, -0.9892855, -4.107971, 0, 1, 0.8745098, 1,
-0.09576436, 0.381705, 0.2030163, 0, 1, 0.8784314, 1,
-0.08727225, 0.5462649, 0.2428916, 0, 1, 0.8862745, 1,
-0.08540352, 0.03533996, -1.799043, 0, 1, 0.8901961, 1,
-0.08156814, -0.3368669, -2.730774, 0, 1, 0.8980392, 1,
-0.08088005, -0.1175555, -1.853248, 0, 1, 0.9058824, 1,
-0.08018788, 0.9198235, -0.4722151, 0, 1, 0.9098039, 1,
-0.07828294, 0.2906191, -1.101927, 0, 1, 0.9176471, 1,
-0.07786462, 1.655061, -1.572301, 0, 1, 0.9215686, 1,
-0.07723529, -0.5775793, -2.468131, 0, 1, 0.9294118, 1,
-0.07714721, 0.5364743, -0.6533877, 0, 1, 0.9333333, 1,
-0.07627521, -0.9260496, -3.745926, 0, 1, 0.9411765, 1,
-0.07370933, -1.39018, -1.373337, 0, 1, 0.945098, 1,
-0.06907262, -0.7486581, -3.260908, 0, 1, 0.9529412, 1,
-0.06528762, -0.230386, -2.569232, 0, 1, 0.9568627, 1,
-0.06445564, -2.204019, -3.947677, 0, 1, 0.9647059, 1,
-0.06200648, -0.2560236, -3.403951, 0, 1, 0.9686275, 1,
-0.06141432, 0.4762215, -1.331217, 0, 1, 0.9764706, 1,
-0.05800107, -0.4829433, -1.146283, 0, 1, 0.9803922, 1,
-0.05722047, -1.254118, -3.21339, 0, 1, 0.9882353, 1,
-0.05552896, 0.4856155, 0.8806282, 0, 1, 0.9921569, 1,
-0.05059752, -0.0587774, -1.810721, 0, 1, 1, 1,
-0.04963892, -1.220541, -3.187239, 0, 0.9921569, 1, 1,
-0.04606276, -0.5787784, -1.532001, 0, 0.9882353, 1, 1,
-0.03990044, -0.5184218, -3.471846, 0, 0.9803922, 1, 1,
-0.03896677, 0.08928241, -0.731393, 0, 0.9764706, 1, 1,
-0.03512884, -0.5474076, -1.805884, 0, 0.9686275, 1, 1,
-0.03419059, 1.956277, 0.1328903, 0, 0.9647059, 1, 1,
-0.03390931, -0.3322942, -3.051114, 0, 0.9568627, 1, 1,
-0.03236777, -0.4257761, -2.762348, 0, 0.9529412, 1, 1,
-0.02737239, -0.4305243, -3.692751, 0, 0.945098, 1, 1,
-0.02158217, -1.711331, -3.449048, 0, 0.9411765, 1, 1,
-0.02150201, 2.536318, 0.6070728, 0, 0.9333333, 1, 1,
-0.01586858, 2.198591, 0.3501349, 0, 0.9294118, 1, 1,
-0.01577582, -1.760485, -2.636902, 0, 0.9215686, 1, 1,
-0.015063, 0.2859728, -0.7918333, 0, 0.9176471, 1, 1,
-0.01503223, -0.1377544, -3.122228, 0, 0.9098039, 1, 1,
-0.01044852, -0.4313031, -4.230132, 0, 0.9058824, 1, 1,
-0.008759562, 1.231508, -0.8835421, 0, 0.8980392, 1, 1,
-0.007410747, -0.5470141, -3.189641, 0, 0.8901961, 1, 1,
-0.007080375, 1.262159, -1.628944, 0, 0.8862745, 1, 1,
-0.001917268, -2.088525, -3.327356, 0, 0.8784314, 1, 1,
0.001422865, -0.1079574, 3.100399, 0, 0.8745098, 1, 1,
0.00238612, -1.253079, 3.248612, 0, 0.8666667, 1, 1,
0.008736397, 0.7766935, -1.0502, 0, 0.8627451, 1, 1,
0.0175971, -0.6662601, 3.248444, 0, 0.854902, 1, 1,
0.02024451, 0.4554862, 0.8189769, 0, 0.8509804, 1, 1,
0.02383362, -1.406631, 3.890342, 0, 0.8431373, 1, 1,
0.02745843, -0.4060591, 2.63626, 0, 0.8392157, 1, 1,
0.02886883, -0.9257305, 1.285454, 0, 0.8313726, 1, 1,
0.0375161, -0.4639312, 5.202739, 0, 0.827451, 1, 1,
0.03794946, -0.1879613, 1.907386, 0, 0.8196079, 1, 1,
0.04083762, 0.1644558, 0.1484786, 0, 0.8156863, 1, 1,
0.04206684, 2.350598, 0.01270096, 0, 0.8078431, 1, 1,
0.04806596, 0.9247139, -1.567583, 0, 0.8039216, 1, 1,
0.05456545, 0.1661739, -0.3293925, 0, 0.7960784, 1, 1,
0.05553655, -0.5390909, 2.592057, 0, 0.7882353, 1, 1,
0.06116234, -0.84113, 4.824938, 0, 0.7843137, 1, 1,
0.06162512, -1.338192, 1.540583, 0, 0.7764706, 1, 1,
0.06361435, 1.10786, -0.3015057, 0, 0.772549, 1, 1,
0.06601536, -1.018653, 2.559292, 0, 0.7647059, 1, 1,
0.06727071, -0.2942255, 3.926989, 0, 0.7607843, 1, 1,
0.06738447, -0.7400502, 2.321307, 0, 0.7529412, 1, 1,
0.06849667, -0.7352084, 1.042547, 0, 0.7490196, 1, 1,
0.07456044, 0.9136982, 0.1998789, 0, 0.7411765, 1, 1,
0.07566433, -0.01011377, 0.0751225, 0, 0.7372549, 1, 1,
0.07596806, -0.3744321, 2.770386, 0, 0.7294118, 1, 1,
0.07733963, 0.4093691, -0.4025814, 0, 0.7254902, 1, 1,
0.07742321, -0.119051, 4.606678, 0, 0.7176471, 1, 1,
0.079355, 0.33517, 0.2807857, 0, 0.7137255, 1, 1,
0.07977343, 0.3995715, -2.088528, 0, 0.7058824, 1, 1,
0.08823819, -3.13481, 4.631725, 0, 0.6980392, 1, 1,
0.08891345, -0.1406002, 1.018684, 0, 0.6941177, 1, 1,
0.08896301, 0.8949245, 1.508197, 0, 0.6862745, 1, 1,
0.09189565, 0.2159444, 0.1518611, 0, 0.682353, 1, 1,
0.09251256, -1.192087, 2.447473, 0, 0.6745098, 1, 1,
0.0942663, 1.799178, -0.264434, 0, 0.6705883, 1, 1,
0.09457066, -2.14968, 3.69096, 0, 0.6627451, 1, 1,
0.09484143, -0.4269773, 4.38654, 0, 0.6588235, 1, 1,
0.0978688, 0.2678716, 0.455938, 0, 0.6509804, 1, 1,
0.09966341, -0.8799291, 0.4713098, 0, 0.6470588, 1, 1,
0.1002906, 0.6633699, 0.8234103, 0, 0.6392157, 1, 1,
0.107753, 0.01642647, 0.7240235, 0, 0.6352941, 1, 1,
0.1092745, -0.1658845, 4.370743, 0, 0.627451, 1, 1,
0.1104139, -0.5242119, 3.035257, 0, 0.6235294, 1, 1,
0.1120827, -2.127947, 3.480373, 0, 0.6156863, 1, 1,
0.115653, -0.8880373, 4.424783, 0, 0.6117647, 1, 1,
0.1167002, -1.049383, 1.931329, 0, 0.6039216, 1, 1,
0.1168352, -1.111265, 4.24765, 0, 0.5960785, 1, 1,
0.1169131, -1.343542, 3.763783, 0, 0.5921569, 1, 1,
0.1206817, 3.054573, 0.04176978, 0, 0.5843138, 1, 1,
0.1219421, -0.9040546, 1.389849, 0, 0.5803922, 1, 1,
0.1232954, -0.264621, 3.130837, 0, 0.572549, 1, 1,
0.1241685, 0.9753984, 1.76272, 0, 0.5686275, 1, 1,
0.1252707, 0.4832198, 1.274551, 0, 0.5607843, 1, 1,
0.1304004, 1.339299, -0.2734064, 0, 0.5568628, 1, 1,
0.1315392, -0.3469827, 3.859948, 0, 0.5490196, 1, 1,
0.1395947, 0.5465798, -1.602175, 0, 0.5450981, 1, 1,
0.1456334, -0.01794828, 2.451126, 0, 0.5372549, 1, 1,
0.145955, -0.5043637, 2.461418, 0, 0.5333334, 1, 1,
0.1530572, -0.4104754, 4.343421, 0, 0.5254902, 1, 1,
0.1632664, 0.1539562, 1.296253, 0, 0.5215687, 1, 1,
0.1638858, -0.8948068, 3.105694, 0, 0.5137255, 1, 1,
0.164917, -0.5917205, 2.809748, 0, 0.509804, 1, 1,
0.1690575, -0.869654, 4.266717, 0, 0.5019608, 1, 1,
0.1711442, 0.08452848, 0.3718268, 0, 0.4941176, 1, 1,
0.1752033, 0.5349518, -0.01852081, 0, 0.4901961, 1, 1,
0.1786098, 0.5115944, -0.2487781, 0, 0.4823529, 1, 1,
0.1832834, -1.995757, 3.214551, 0, 0.4784314, 1, 1,
0.1867513, 0.2276486, -0.3127057, 0, 0.4705882, 1, 1,
0.1876961, 1.191728, -1.554222, 0, 0.4666667, 1, 1,
0.194944, 1.954398, -2.288865, 0, 0.4588235, 1, 1,
0.1975579, 0.7782221, 0.006758636, 0, 0.454902, 1, 1,
0.1977055, 0.5736146, 0.9638758, 0, 0.4470588, 1, 1,
0.1980212, -1.706958, 2.753344, 0, 0.4431373, 1, 1,
0.1980995, -0.5882255, 2.043876, 0, 0.4352941, 1, 1,
0.2045898, 2.083591, 1.240377, 0, 0.4313726, 1, 1,
0.2057602, 1.097812, -0.4714684, 0, 0.4235294, 1, 1,
0.2092672, 0.119741, 0.6935635, 0, 0.4196078, 1, 1,
0.2136864, -1.834182, 3.684997, 0, 0.4117647, 1, 1,
0.2225649, 1.377661, -0.4934158, 0, 0.4078431, 1, 1,
0.2252901, -0.8660462, 2.129605, 0, 0.4, 1, 1,
0.225703, 0.8154637, -1.295494, 0, 0.3921569, 1, 1,
0.2257998, 1.678716, 0.1895736, 0, 0.3882353, 1, 1,
0.226706, -0.9201944, 3.368917, 0, 0.3803922, 1, 1,
0.2375587, 1.416019, 0.5645024, 0, 0.3764706, 1, 1,
0.2543541, -0.5131106, 1.154858, 0, 0.3686275, 1, 1,
0.2597041, -1.384447, 1.925884, 0, 0.3647059, 1, 1,
0.2621259, 1.61859, -0.09664924, 0, 0.3568628, 1, 1,
0.2621642, -0.7023394, 0.6947995, 0, 0.3529412, 1, 1,
0.2662738, 0.3101136, 1.229545, 0, 0.345098, 1, 1,
0.2687141, 0.3476704, -0.05823231, 0, 0.3411765, 1, 1,
0.2770192, 0.126429, 1.723307, 0, 0.3333333, 1, 1,
0.2773272, 0.7876862, 0.4990919, 0, 0.3294118, 1, 1,
0.2774825, 0.2851759, 1.064074, 0, 0.3215686, 1, 1,
0.2839883, -2.137538, 2.679299, 0, 0.3176471, 1, 1,
0.2871268, 0.09249666, 2.465936, 0, 0.3098039, 1, 1,
0.2883539, 0.2964292, 1.532108, 0, 0.3058824, 1, 1,
0.291231, 0.8188153, 0.1507524, 0, 0.2980392, 1, 1,
0.2916252, 0.01906778, 0.8786953, 0, 0.2901961, 1, 1,
0.2918978, -1.554183, 5.063733, 0, 0.2862745, 1, 1,
0.2954138, 0.498439, -0.6521026, 0, 0.2784314, 1, 1,
0.3045172, -0.04437799, 1.90004, 0, 0.2745098, 1, 1,
0.3196259, -0.9683101, 3.844016, 0, 0.2666667, 1, 1,
0.3197539, 0.4492954, 0.2245017, 0, 0.2627451, 1, 1,
0.3252019, -1.542238, 2.561151, 0, 0.254902, 1, 1,
0.3253275, 1.166922, -1.710311, 0, 0.2509804, 1, 1,
0.3263724, 1.036975, 1.862325, 0, 0.2431373, 1, 1,
0.3312671, 0.2505832, 0.6697599, 0, 0.2392157, 1, 1,
0.3381636, -1.413475, 3.142034, 0, 0.2313726, 1, 1,
0.3413278, 0.06268059, 1.685942, 0, 0.227451, 1, 1,
0.3414287, 0.01352724, 2.499329, 0, 0.2196078, 1, 1,
0.3449474, 0.1681351, 1.76791, 0, 0.2156863, 1, 1,
0.3527734, -0.1358907, 2.727924, 0, 0.2078431, 1, 1,
0.3572202, 1.369342, 1.82564, 0, 0.2039216, 1, 1,
0.3587852, -0.04740082, 2.361228, 0, 0.1960784, 1, 1,
0.3596327, 0.1316745, 0.3692552, 0, 0.1882353, 1, 1,
0.361921, -1.332806, 1.500154, 0, 0.1843137, 1, 1,
0.3650427, 1.250166, -0.1894842, 0, 0.1764706, 1, 1,
0.3652685, -0.04893881, 2.31243, 0, 0.172549, 1, 1,
0.3686472, -0.6222111, 2.409857, 0, 0.1647059, 1, 1,
0.3690883, -0.6019199, 3.605759, 0, 0.1607843, 1, 1,
0.3708041, -0.7875647, 3.639432, 0, 0.1529412, 1, 1,
0.3736761, 1.381117, -2.032322, 0, 0.1490196, 1, 1,
0.3747284, 0.2213867, 0.2999668, 0, 0.1411765, 1, 1,
0.3798176, 1.519915, 0.3088767, 0, 0.1372549, 1, 1,
0.3804338, -1.487745, 1.845158, 0, 0.1294118, 1, 1,
0.3867293, 0.7672138, -0.06947362, 0, 0.1254902, 1, 1,
0.3872188, 1.942281, -1.689468, 0, 0.1176471, 1, 1,
0.3898769, -0.03527191, 3.01083, 0, 0.1137255, 1, 1,
0.3903572, -0.5510878, 2.242588, 0, 0.1058824, 1, 1,
0.3909646, -0.7732478, 2.711643, 0, 0.09803922, 1, 1,
0.391526, 1.2451, 0.3573718, 0, 0.09411765, 1, 1,
0.3958836, -0.4987638, 1.461804, 0, 0.08627451, 1, 1,
0.4002871, -0.8799981, 2.793352, 0, 0.08235294, 1, 1,
0.4067766, -1.266984, 5.038065, 0, 0.07450981, 1, 1,
0.4085515, -0.9380457, 3.030137, 0, 0.07058824, 1, 1,
0.4090291, 0.4306175, 0.6934901, 0, 0.0627451, 1, 1,
0.4170773, -0.3623601, 1.332641, 0, 0.05882353, 1, 1,
0.4195161, -1.171648, 3.427211, 0, 0.05098039, 1, 1,
0.4227945, 0.1744162, 0.1953541, 0, 0.04705882, 1, 1,
0.4279, -0.1005474, 1.900467, 0, 0.03921569, 1, 1,
0.4284943, 0.05524371, 2.47984, 0, 0.03529412, 1, 1,
0.431934, -0.1946159, 2.395729, 0, 0.02745098, 1, 1,
0.4319908, -0.8042833, 2.323485, 0, 0.02352941, 1, 1,
0.4337543, -1.196731, 1.613217, 0, 0.01568628, 1, 1,
0.4430244, 0.8386856, 0.366592, 0, 0.01176471, 1, 1,
0.4480012, 0.1825189, 1.618156, 0, 0.003921569, 1, 1,
0.4483002, -0.8294264, 2.48033, 0.003921569, 0, 1, 1,
0.450893, -1.618982, 1.706994, 0.007843138, 0, 1, 1,
0.4513167, 0.2137513, 1.531739, 0.01568628, 0, 1, 1,
0.4552746, 0.2251551, 0.3403945, 0.01960784, 0, 1, 1,
0.4561426, -1.834592, 3.123957, 0.02745098, 0, 1, 1,
0.4602812, -1.285306, 3.447428, 0.03137255, 0, 1, 1,
0.4646766, -0.2829884, 1.905582, 0.03921569, 0, 1, 1,
0.4676618, -2.137662, 4.064954, 0.04313726, 0, 1, 1,
0.4707148, -1.195653, 1.857501, 0.05098039, 0, 1, 1,
0.4712939, -0.7540359, 2.381544, 0.05490196, 0, 1, 1,
0.4714743, -0.0892614, 1.420426, 0.0627451, 0, 1, 1,
0.4743977, -0.7843323, 1.986304, 0.06666667, 0, 1, 1,
0.4750464, -0.2568121, 3.081565, 0.07450981, 0, 1, 1,
0.4788796, -0.4484996, 1.570943, 0.07843138, 0, 1, 1,
0.4790209, -0.3935516, 2.469745, 0.08627451, 0, 1, 1,
0.480655, 0.2310393, 1.276543, 0.09019608, 0, 1, 1,
0.4853438, -0.1509222, -0.2366444, 0.09803922, 0, 1, 1,
0.4874946, -0.03305702, -0.3331473, 0.1058824, 0, 1, 1,
0.4879095, 0.7048025, 1.020154, 0.1098039, 0, 1, 1,
0.4885044, -0.7920623, 0.551473, 0.1176471, 0, 1, 1,
0.4898956, 0.9541389, 1.357645, 0.1215686, 0, 1, 1,
0.491608, 0.07251111, 0.72652, 0.1294118, 0, 1, 1,
0.4991752, 0.5756084, 0.4979289, 0.1333333, 0, 1, 1,
0.5016816, -1.085359, 4.691394, 0.1411765, 0, 1, 1,
0.5067464, 1.863855, 0.6716173, 0.145098, 0, 1, 1,
0.5110438, 0.3011552, 0.4306038, 0.1529412, 0, 1, 1,
0.5119656, 0.4219595, 1.622707, 0.1568628, 0, 1, 1,
0.5154656, -0.02695513, 1.951013, 0.1647059, 0, 1, 1,
0.5157888, -1.205708, 3.246431, 0.1686275, 0, 1, 1,
0.519106, 0.3035645, 1.326409, 0.1764706, 0, 1, 1,
0.5225291, 1.24108, 0.01126769, 0.1803922, 0, 1, 1,
0.5227402, -0.5403989, 2.189793, 0.1882353, 0, 1, 1,
0.5293792, 0.7447094, 0.3959636, 0.1921569, 0, 1, 1,
0.5313857, 0.6663014, 0.3198532, 0.2, 0, 1, 1,
0.5317654, -1.232615, 2.865954, 0.2078431, 0, 1, 1,
0.5320144, -0.3356712, 2.482804, 0.2117647, 0, 1, 1,
0.5351314, -0.2431034, 2.434581, 0.2196078, 0, 1, 1,
0.5353107, -0.1455481, 3.019588, 0.2235294, 0, 1, 1,
0.5359483, 0.8987272, -1.048416, 0.2313726, 0, 1, 1,
0.5362259, 0.1699887, 0.5447485, 0.2352941, 0, 1, 1,
0.5364653, -0.6136153, 2.836245, 0.2431373, 0, 1, 1,
0.5366099, 0.6730984, 1.158855, 0.2470588, 0, 1, 1,
0.5415572, -1.114138, 1.80003, 0.254902, 0, 1, 1,
0.5492462, 0.1009882, 1.523818, 0.2588235, 0, 1, 1,
0.5508749, -0.8301268, 2.466528, 0.2666667, 0, 1, 1,
0.5523741, 1.263137, 0.5495632, 0.2705882, 0, 1, 1,
0.5534238, 0.3185752, -0.05485791, 0.2784314, 0, 1, 1,
0.5582594, -1.498038, 2.315775, 0.282353, 0, 1, 1,
0.5591931, -1.033476, 2.180796, 0.2901961, 0, 1, 1,
0.5601108, 0.5529052, 0.6488082, 0.2941177, 0, 1, 1,
0.5607947, -0.750667, 2.198788, 0.3019608, 0, 1, 1,
0.5611149, 1.436234, -0.6009523, 0.3098039, 0, 1, 1,
0.5629809, 0.9951608, 0.4487212, 0.3137255, 0, 1, 1,
0.56462, 0.1058808, 1.707865, 0.3215686, 0, 1, 1,
0.5685607, 1.135694, 1.263269, 0.3254902, 0, 1, 1,
0.5693567, 1.060954, 0.9821778, 0.3333333, 0, 1, 1,
0.5704325, -0.5709134, 2.707867, 0.3372549, 0, 1, 1,
0.5713742, 1.442842, 0.7403409, 0.345098, 0, 1, 1,
0.5752041, -1.2582, 1.541634, 0.3490196, 0, 1, 1,
0.5758334, -1.362689, 3.077381, 0.3568628, 0, 1, 1,
0.5774956, -0.6455052, 2.787491, 0.3607843, 0, 1, 1,
0.5775486, -0.9106818, 1.86511, 0.3686275, 0, 1, 1,
0.5796951, -0.02902199, 0.8902174, 0.372549, 0, 1, 1,
0.5835192, -0.9261992, 0.7546746, 0.3803922, 0, 1, 1,
0.5841675, 0.4334273, 0.3044313, 0.3843137, 0, 1, 1,
0.5909259, 1.376545, -1.686949, 0.3921569, 0, 1, 1,
0.5940461, -0.6068876, 1.090247, 0.3960784, 0, 1, 1,
0.5946209, 0.9444781, 1.252683, 0.4039216, 0, 1, 1,
0.5947106, -0.132879, 0.5487711, 0.4117647, 0, 1, 1,
0.6063583, -0.3872349, 4.532595, 0.4156863, 0, 1, 1,
0.606611, -0.591254, 3.486619, 0.4235294, 0, 1, 1,
0.6066977, 0.7761139, 0.1952315, 0.427451, 0, 1, 1,
0.6067634, -0.1884933, 1.287853, 0.4352941, 0, 1, 1,
0.6104464, 2.434946, -0.9423175, 0.4392157, 0, 1, 1,
0.6119347, 0.01548036, 1.119581, 0.4470588, 0, 1, 1,
0.6146064, -0.2511571, 2.19425, 0.4509804, 0, 1, 1,
0.6239925, 0.3942706, 0.2611776, 0.4588235, 0, 1, 1,
0.6268569, 0.6122411, 3.18886, 0.4627451, 0, 1, 1,
0.6338184, -0.6632805, 0.8586624, 0.4705882, 0, 1, 1,
0.6376405, -0.6845956, 1.874631, 0.4745098, 0, 1, 1,
0.6388969, -0.7603609, 3.76213, 0.4823529, 0, 1, 1,
0.6394251, -1.359678, 2.555127, 0.4862745, 0, 1, 1,
0.6431805, -0.984294, 3.211732, 0.4941176, 0, 1, 1,
0.6466988, 0.7748503, -0.8195591, 0.5019608, 0, 1, 1,
0.6490403, -0.3010708, 3.000419, 0.5058824, 0, 1, 1,
0.6493704, 1.331663, 0.0231147, 0.5137255, 0, 1, 1,
0.64954, -0.4260027, 2.933207, 0.5176471, 0, 1, 1,
0.6550008, -0.06628256, 0.1250184, 0.5254902, 0, 1, 1,
0.6568929, -0.03710848, 1.333721, 0.5294118, 0, 1, 1,
0.6683579, -0.5683495, 1.723672, 0.5372549, 0, 1, 1,
0.6699673, -0.5898042, 3.152766, 0.5411765, 0, 1, 1,
0.6712263, 1.262983, 0.153918, 0.5490196, 0, 1, 1,
0.6724024, -0.4667682, 2.291202, 0.5529412, 0, 1, 1,
0.6772634, -1.961554, 3.057494, 0.5607843, 0, 1, 1,
0.6785535, -1.047695, 2.400785, 0.5647059, 0, 1, 1,
0.6903355, 0.2800775, 1.377411, 0.572549, 0, 1, 1,
0.6907713, -1.129374, 2.312166, 0.5764706, 0, 1, 1,
0.6910802, -0.8051393, 3.286149, 0.5843138, 0, 1, 1,
0.6934097, -1.121955, 2.778761, 0.5882353, 0, 1, 1,
0.6936175, -0.7876171, 2.356578, 0.5960785, 0, 1, 1,
0.6937623, -1.378888, 2.700045, 0.6039216, 0, 1, 1,
0.6972648, 1.085229, -0.1581857, 0.6078432, 0, 1, 1,
0.6990645, -1.038002, 1.886557, 0.6156863, 0, 1, 1,
0.6999519, 1.215252, 0.4183121, 0.6196079, 0, 1, 1,
0.7013257, 1.249337, 1.040845, 0.627451, 0, 1, 1,
0.7023057, 0.2414355, 0.6871371, 0.6313726, 0, 1, 1,
0.7048865, -0.29287, 2.071944, 0.6392157, 0, 1, 1,
0.709587, 2.439867, -0.3317992, 0.6431373, 0, 1, 1,
0.7166385, 1.100716, 0.4527474, 0.6509804, 0, 1, 1,
0.7174097, -0.4675526, 2.671846, 0.654902, 0, 1, 1,
0.7176058, -1.077594, 2.241025, 0.6627451, 0, 1, 1,
0.7189043, 0.335208, 1.87157, 0.6666667, 0, 1, 1,
0.7226954, 0.1696293, 2.917481, 0.6745098, 0, 1, 1,
0.7261887, 0.8396224, 0.931352, 0.6784314, 0, 1, 1,
0.7262362, 0.6933413, 0.7653726, 0.6862745, 0, 1, 1,
0.7271636, 0.5486811, 1.497524, 0.6901961, 0, 1, 1,
0.7274479, 0.9051857, -0.8729789, 0.6980392, 0, 1, 1,
0.7277994, -0.555034, 1.94735, 0.7058824, 0, 1, 1,
0.7280404, -1.262337, 2.93292, 0.7098039, 0, 1, 1,
0.7305436, -0.7198725, 1.07295, 0.7176471, 0, 1, 1,
0.7325523, 0.8012303, 2.804503, 0.7215686, 0, 1, 1,
0.734189, 0.09836844, 1.906949, 0.7294118, 0, 1, 1,
0.7362182, 0.2968179, 1.561061, 0.7333333, 0, 1, 1,
0.7373355, 0.8465882, 1.697216, 0.7411765, 0, 1, 1,
0.7378496, -1.361333, 2.363054, 0.7450981, 0, 1, 1,
0.7436988, -0.26691, 2.725994, 0.7529412, 0, 1, 1,
0.7479574, -0.9009603, 2.948287, 0.7568628, 0, 1, 1,
0.7506052, 1.290846, 2.339377, 0.7647059, 0, 1, 1,
0.7529682, -0.3579534, 3.589498, 0.7686275, 0, 1, 1,
0.7629258, -0.1908312, 2.271746, 0.7764706, 0, 1, 1,
0.7739656, 1.60666, 2.336673, 0.7803922, 0, 1, 1,
0.7779982, -2.361548, 4.667381, 0.7882353, 0, 1, 1,
0.7833377, 0.1328744, 0.9765493, 0.7921569, 0, 1, 1,
0.784248, -0.8008705, 3.286713, 0.8, 0, 1, 1,
0.7868932, 1.617618, 1.292644, 0.8078431, 0, 1, 1,
0.7894046, -0.132351, 1.795049, 0.8117647, 0, 1, 1,
0.7898584, -1.654347, 3.456133, 0.8196079, 0, 1, 1,
0.7911361, -0.9430071, 0.2433665, 0.8235294, 0, 1, 1,
0.7938537, -0.6515884, 4.017881, 0.8313726, 0, 1, 1,
0.7943367, -0.6521991, 3.942055, 0.8352941, 0, 1, 1,
0.8006809, 2.004224, 0.05162789, 0.8431373, 0, 1, 1,
0.8022448, 1.670983, 0.5940515, 0.8470588, 0, 1, 1,
0.8076788, 0.06557178, 1.977178, 0.854902, 0, 1, 1,
0.8150519, -1.175494, 2.410167, 0.8588235, 0, 1, 1,
0.8156722, 0.6282275, 1.469202, 0.8666667, 0, 1, 1,
0.83096, -0.2327653, 1.887856, 0.8705882, 0, 1, 1,
0.8344682, -1.744377, 2.02924, 0.8784314, 0, 1, 1,
0.8347209, 1.278395, 0.6177195, 0.8823529, 0, 1, 1,
0.8377526, 1.490335, 1.750877, 0.8901961, 0, 1, 1,
0.846243, -0.3523896, 2.819114, 0.8941177, 0, 1, 1,
0.8472444, 0.05519978, 1.9664, 0.9019608, 0, 1, 1,
0.8537639, -1.715701, 1.68497, 0.9098039, 0, 1, 1,
0.8542993, -1.122657, 3.408559, 0.9137255, 0, 1, 1,
0.8552919, -0.3290738, 2.104984, 0.9215686, 0, 1, 1,
0.8600947, -0.2865255, 1.116111, 0.9254902, 0, 1, 1,
0.8622591, 0.03160096, 2.838135, 0.9333333, 0, 1, 1,
0.862696, -1.347608, 1.769961, 0.9372549, 0, 1, 1,
0.8628785, -0.2137211, 4.857207, 0.945098, 0, 1, 1,
0.8660188, 1.403921, 1.42777, 0.9490196, 0, 1, 1,
0.8705692, -0.691161, 1.300073, 0.9568627, 0, 1, 1,
0.8742741, -0.7308183, -0.2721635, 0.9607843, 0, 1, 1,
0.8761626, 0.1147853, 2.332207, 0.9686275, 0, 1, 1,
0.8805805, 1.25863, 2.72068, 0.972549, 0, 1, 1,
0.8824079, -0.5959456, 0.8082128, 0.9803922, 0, 1, 1,
0.895187, 0.08772644, 1.76428, 0.9843137, 0, 1, 1,
0.8956772, -0.6494199, 0.8032917, 0.9921569, 0, 1, 1,
0.897201, 0.8309357, 0.7309529, 0.9960784, 0, 1, 1,
0.9050209, 1.20024, 0.7027067, 1, 0, 0.9960784, 1,
0.909047, -0.3557644, 1.731757, 1, 0, 0.9882353, 1,
0.9134554, 1.060591, 0.8253108, 1, 0, 0.9843137, 1,
0.9177859, 0.7443748, 0.5771963, 1, 0, 0.9764706, 1,
0.9230596, 0.1059408, 0.8613742, 1, 0, 0.972549, 1,
0.9273511, -0.7335572, 0.9754376, 1, 0, 0.9647059, 1,
0.9277469, -0.7430983, 2.715606, 1, 0, 0.9607843, 1,
0.9303381, -2.943767, 3.287671, 1, 0, 0.9529412, 1,
0.9303487, 0.6267545, 1.128534, 1, 0, 0.9490196, 1,
0.9315009, -0.5278404, 2.153843, 1, 0, 0.9411765, 1,
0.9334561, 0.7116417, -0.6466951, 1, 0, 0.9372549, 1,
0.9335765, -0.5624818, 1.736941, 1, 0, 0.9294118, 1,
0.9360967, 0.5079113, 1.194498, 1, 0, 0.9254902, 1,
0.9370856, 0.1681226, -0.6850384, 1, 0, 0.9176471, 1,
0.9372352, -1.94243, 4.628631, 1, 0, 0.9137255, 1,
0.9415566, 0.8944628, 0.2449093, 1, 0, 0.9058824, 1,
0.947611, 0.4980561, -0.8238416, 1, 0, 0.9019608, 1,
0.9479109, -0.4010237, 2.455307, 1, 0, 0.8941177, 1,
0.9484946, -1.906103, 0.09023288, 1, 0, 0.8862745, 1,
0.950032, -0.9470152, 0.6620541, 1, 0, 0.8823529, 1,
0.9519382, -2.004938, 3.618671, 1, 0, 0.8745098, 1,
0.9687738, -0.7452214, 1.071795, 1, 0, 0.8705882, 1,
0.9780139, -0.03314688, 2.883524, 1, 0, 0.8627451, 1,
0.982329, -1.391481, 1.934171, 1, 0, 0.8588235, 1,
0.9852686, 0.8083205, 0.9781069, 1, 0, 0.8509804, 1,
0.9986389, -1.202962, 3.026439, 1, 0, 0.8470588, 1,
1.006019, 0.7434788, 1.294959, 1, 0, 0.8392157, 1,
1.007996, 1.019192, 1.478925, 1, 0, 0.8352941, 1,
1.016029, 0.4904831, 3.626432, 1, 0, 0.827451, 1,
1.022249, -1.411245, 2.325227, 1, 0, 0.8235294, 1,
1.026371, 1.360905, 1.079419, 1, 0, 0.8156863, 1,
1.032556, 0.9234101, 1.025471, 1, 0, 0.8117647, 1,
1.033027, -1.136556, 0.8210378, 1, 0, 0.8039216, 1,
1.037187, 0.8232245, 0.3258111, 1, 0, 0.7960784, 1,
1.039089, 0.5211809, -0.7896912, 1, 0, 0.7921569, 1,
1.040687, -0.1808133, 0.701678, 1, 0, 0.7843137, 1,
1.049624, 2.764069, 1.170851, 1, 0, 0.7803922, 1,
1.050284, 2.288817, 1.356316, 1, 0, 0.772549, 1,
1.05714, 0.5768836, 1.448666, 1, 0, 0.7686275, 1,
1.061234, -0.5017232, 1.753792, 1, 0, 0.7607843, 1,
1.06183, 0.8499207, 0.7793185, 1, 0, 0.7568628, 1,
1.063386, -0.7019151, 3.728028, 1, 0, 0.7490196, 1,
1.065853, -0.1981862, 2.946354, 1, 0, 0.7450981, 1,
1.073072, -0.212613, 2.355425, 1, 0, 0.7372549, 1,
1.074444, -0.9209117, 2.073923, 1, 0, 0.7333333, 1,
1.075849, -0.8190308, 2.020396, 1, 0, 0.7254902, 1,
1.078398, -0.8919255, 2.833382, 1, 0, 0.7215686, 1,
1.080807, -0.8501737, 2.633139, 1, 0, 0.7137255, 1,
1.081912, 1.523642, 1.084151, 1, 0, 0.7098039, 1,
1.094086, 0.5931799, 1.968247, 1, 0, 0.7019608, 1,
1.100399, -0.1125864, 2.472209, 1, 0, 0.6941177, 1,
1.102578, 1.490293, 2.281486, 1, 0, 0.6901961, 1,
1.107605, -0.09914733, 1.441093, 1, 0, 0.682353, 1,
1.109379, 0.4075149, 2.263856, 1, 0, 0.6784314, 1,
1.115497, 0.0704677, 0.9004638, 1, 0, 0.6705883, 1,
1.116509, -0.1466686, 0.5549181, 1, 0, 0.6666667, 1,
1.139123, -1.00335, 0.2007871, 1, 0, 0.6588235, 1,
1.144714, -0.1132947, 3.496655, 1, 0, 0.654902, 1,
1.146024, -0.3640526, 1.44531, 1, 0, 0.6470588, 1,
1.158047, 1.245381, 1.369801, 1, 0, 0.6431373, 1,
1.160829, -0.6227407, 3.9698, 1, 0, 0.6352941, 1,
1.166145, -1.345407, 1.163883, 1, 0, 0.6313726, 1,
1.17194, -0.2663807, 1.086015, 1, 0, 0.6235294, 1,
1.175398, -0.1986531, 0.7097456, 1, 0, 0.6196079, 1,
1.196204, -0.4630696, 2.857388, 1, 0, 0.6117647, 1,
1.199097, -1.342926, 2.835214, 1, 0, 0.6078432, 1,
1.202688, -1.047053, 3.534439, 1, 0, 0.6, 1,
1.203455, -0.06567678, 1.540946, 1, 0, 0.5921569, 1,
1.228577, -1.415722, 3.846723, 1, 0, 0.5882353, 1,
1.234574, 0.4089569, 2.787495, 1, 0, 0.5803922, 1,
1.237684, -0.1050723, 2.604236, 1, 0, 0.5764706, 1,
1.2608, 0.5286247, 1.589713, 1, 0, 0.5686275, 1,
1.263209, -0.4438421, 1.000286, 1, 0, 0.5647059, 1,
1.263391, -1.01579, 0.9904332, 1, 0, 0.5568628, 1,
1.266954, -0.737237, 1.694567, 1, 0, 0.5529412, 1,
1.266985, 0.1664866, 1.832043, 1, 0, 0.5450981, 1,
1.267023, 0.05298727, 3.144477, 1, 0, 0.5411765, 1,
1.267164, 1.270315, -0.3502619, 1, 0, 0.5333334, 1,
1.277595, 0.5415805, 2.100553, 1, 0, 0.5294118, 1,
1.280813, 0.04164362, 1.356097, 1, 0, 0.5215687, 1,
1.293179, 0.3637566, 0.2804495, 1, 0, 0.5176471, 1,
1.300372, 0.5202042, 1.547806, 1, 0, 0.509804, 1,
1.301843, -1.723157, 2.970967, 1, 0, 0.5058824, 1,
1.308467, 1.382993, -0.9298812, 1, 0, 0.4980392, 1,
1.320863, 1.084629, -0.2702005, 1, 0, 0.4901961, 1,
1.330515, -1.10049, 2.138179, 1, 0, 0.4862745, 1,
1.334831, 0.3181074, 2.246938, 1, 0, 0.4784314, 1,
1.337411, -0.8750024, 2.425642, 1, 0, 0.4745098, 1,
1.344556, -1.077844, 2.995012, 1, 0, 0.4666667, 1,
1.362486, 1.483495, -0.3050524, 1, 0, 0.4627451, 1,
1.377821, 1.157751, 0.7850602, 1, 0, 0.454902, 1,
1.38572, -0.2674269, 2.406305, 1, 0, 0.4509804, 1,
1.398665, 0.8330174, -0.4226978, 1, 0, 0.4431373, 1,
1.403248, -1.920533, 2.107769, 1, 0, 0.4392157, 1,
1.404581, -0.3272018, 2.647825, 1, 0, 0.4313726, 1,
1.405529, -1.669238, 2.200553, 1, 0, 0.427451, 1,
1.412986, 0.5114393, 1.53753, 1, 0, 0.4196078, 1,
1.416795, 0.1024476, 2.116052, 1, 0, 0.4156863, 1,
1.429185, 1.860319, -0.8666859, 1, 0, 0.4078431, 1,
1.453345, 0.02929562, 2.656475, 1, 0, 0.4039216, 1,
1.454508, 0.6493008, 0.3052882, 1, 0, 0.3960784, 1,
1.455174, -1.129764, 3.995541, 1, 0, 0.3882353, 1,
1.46818, 0.7006018, -0.7136984, 1, 0, 0.3843137, 1,
1.469889, -0.5585623, 3.051464, 1, 0, 0.3764706, 1,
1.470347, -0.4476744, 1.572472, 1, 0, 0.372549, 1,
1.475489, -0.3296658, 0.8220141, 1, 0, 0.3647059, 1,
1.503389, 0.3826019, 1.594646, 1, 0, 0.3607843, 1,
1.514129, -0.5218636, 1.926557, 1, 0, 0.3529412, 1,
1.523545, -0.4832859, 2.701162, 1, 0, 0.3490196, 1,
1.525104, -0.638912, 1.346433, 1, 0, 0.3411765, 1,
1.532766, -0.2424512, 0.08985952, 1, 0, 0.3372549, 1,
1.537319, 2.086057, 2.147755, 1, 0, 0.3294118, 1,
1.557444, -0.1331883, 0.6583318, 1, 0, 0.3254902, 1,
1.561119, -0.6897466, 2.816439, 1, 0, 0.3176471, 1,
1.564146, -0.4170465, 1.377598, 1, 0, 0.3137255, 1,
1.587018, -1.125772, 1.647782, 1, 0, 0.3058824, 1,
1.602625, -0.4152161, -0.4404787, 1, 0, 0.2980392, 1,
1.604763, -0.2609067, 3.347811, 1, 0, 0.2941177, 1,
1.616646, -0.7398509, 1.165305, 1, 0, 0.2862745, 1,
1.629615, -0.4888236, 2.513535, 1, 0, 0.282353, 1,
1.640001, -1.109545, 3.166553, 1, 0, 0.2745098, 1,
1.676273, 1.472176, 0.4490523, 1, 0, 0.2705882, 1,
1.678247, -1.311251, 2.961996, 1, 0, 0.2627451, 1,
1.717278, -1.239396, 2.713707, 1, 0, 0.2588235, 1,
1.728528, -0.4124877, 1.913993, 1, 0, 0.2509804, 1,
1.728619, -1.215472, 0.1422034, 1, 0, 0.2470588, 1,
1.729169, 0.329249, 0.4593139, 1, 0, 0.2392157, 1,
1.738641, 1.079235, -0.08441661, 1, 0, 0.2352941, 1,
1.756167, 0.7531666, 1.850875, 1, 0, 0.227451, 1,
1.765116, -0.1882133, 2.159401, 1, 0, 0.2235294, 1,
1.793813, -0.3927075, 1.354281, 1, 0, 0.2156863, 1,
1.793821, 0.7315381, 0.8915125, 1, 0, 0.2117647, 1,
1.814827, 0.2918199, 3.2835, 1, 0, 0.2039216, 1,
1.821296, -0.2013735, 3.794857, 1, 0, 0.1960784, 1,
1.845759, 0.7327579, -0.2885768, 1, 0, 0.1921569, 1,
1.850484, -2.227106, 4.318271, 1, 0, 0.1843137, 1,
1.851937, -0.1880969, 0.1617589, 1, 0, 0.1803922, 1,
1.868487, 2.286866, -0.4512264, 1, 0, 0.172549, 1,
1.89094, -0.8908156, 1.667261, 1, 0, 0.1686275, 1,
1.895399, -0.3448109, 3.313714, 1, 0, 0.1607843, 1,
1.900534, -0.6501573, 3.390047, 1, 0, 0.1568628, 1,
1.916941, 1.192373, 0.4210474, 1, 0, 0.1490196, 1,
1.940566, 1.381073, 0.292155, 1, 0, 0.145098, 1,
1.95692, -0.1861147, 2.766248, 1, 0, 0.1372549, 1,
1.987152, -1.366037, 2.420758, 1, 0, 0.1333333, 1,
1.990726, 0.8982714, 0.7767733, 1, 0, 0.1254902, 1,
1.993262, -1.016804, 2.184036, 1, 0, 0.1215686, 1,
2.011002, 1.490881, 0.752903, 1, 0, 0.1137255, 1,
2.101149, 0.5813538, 1.271864, 1, 0, 0.1098039, 1,
2.11938, -0.3778356, 2.995796, 1, 0, 0.1019608, 1,
2.198362, -0.4589987, 1.213961, 1, 0, 0.09411765, 1,
2.238463, -0.3654147, 1.459329, 1, 0, 0.09019608, 1,
2.244668, 1.580243, 0.3946995, 1, 0, 0.08235294, 1,
2.314426, 0.002923538, 1.047678, 1, 0, 0.07843138, 1,
2.331106, -0.4424216, 1.947117, 1, 0, 0.07058824, 1,
2.366908, -0.002592582, 0.8273153, 1, 0, 0.06666667, 1,
2.369763, -2.609729, 2.966869, 1, 0, 0.05882353, 1,
2.442261, -0.1070363, 0.60087, 1, 0, 0.05490196, 1,
2.482656, 0.9816328, 0.07475459, 1, 0, 0.04705882, 1,
2.515394, -0.9012781, 0.4347096, 1, 0, 0.04313726, 1,
2.59896, 0.203873, 2.31881, 1, 0, 0.03529412, 1,
2.603535, 0.5834968, 2.426349, 1, 0, 0.03137255, 1,
2.621597, -0.08168118, 0.9938596, 1, 0, 0.02352941, 1,
2.630528, -2.108052, 3.519589, 1, 0, 0.01960784, 1,
2.6851, 1.737445, 1.714339, 1, 0, 0.01176471, 1,
3.180663, 0.07571717, 2.520643, 1, 0, 0.007843138, 1
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
-0.1439134, -4.183911, -6.444741, 0, -0.5, 0.5, 0.5,
-0.1439134, -4.183911, -6.444741, 1, -0.5, 0.5, 0.5,
-0.1439134, -4.183911, -6.444741, 1, 1.5, 0.5, 0.5,
-0.1439134, -4.183911, -6.444741, 0, 1.5, 0.5, 0.5
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
-4.59552, -0.04011846, -6.444741, 0, -0.5, 0.5, 0.5,
-4.59552, -0.04011846, -6.444741, 1, -0.5, 0.5, 0.5,
-4.59552, -0.04011846, -6.444741, 1, 1.5, 0.5, 0.5,
-4.59552, -0.04011846, -6.444741, 0, 1.5, 0.5, 0.5
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
-4.59552, -4.183911, 0.2230556, 0, -0.5, 0.5, 0.5,
-4.59552, -4.183911, 0.2230556, 1, -0.5, 0.5, 0.5,
-4.59552, -4.183911, 0.2230556, 1, 1.5, 0.5, 0.5,
-4.59552, -4.183911, 0.2230556, 0, 1.5, 0.5, 0.5
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
-3, -3.227651, -4.906019,
3, -3.227651, -4.906019,
-3, -3.227651, -4.906019,
-3, -3.387028, -5.162472,
-2, -3.227651, -4.906019,
-2, -3.387028, -5.162472,
-1, -3.227651, -4.906019,
-1, -3.387028, -5.162472,
0, -3.227651, -4.906019,
0, -3.387028, -5.162472,
1, -3.227651, -4.906019,
1, -3.387028, -5.162472,
2, -3.227651, -4.906019,
2, -3.387028, -5.162472,
3, -3.227651, -4.906019,
3, -3.387028, -5.162472
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
-3, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
-3, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
-3, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
-3, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
-2, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
-2, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
-2, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
-2, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
-1, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
-1, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
-1, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
-1, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
0, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
0, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
0, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
0, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
1, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
1, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
1, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
1, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
2, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
2, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
2, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
2, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5,
3, -3.705781, -5.67538, 0, -0.5, 0.5, 0.5,
3, -3.705781, -5.67538, 1, -0.5, 0.5, 0.5,
3, -3.705781, -5.67538, 1, 1.5, 0.5, 0.5,
3, -3.705781, -5.67538, 0, 1.5, 0.5, 0.5
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
-3.568227, -3, -4.906019,
-3.568227, 3, -4.906019,
-3.568227, -3, -4.906019,
-3.739442, -3, -5.162472,
-3.568227, -2, -4.906019,
-3.739442, -2, -5.162472,
-3.568227, -1, -4.906019,
-3.739442, -1, -5.162472,
-3.568227, 0, -4.906019,
-3.739442, 0, -5.162472,
-3.568227, 1, -4.906019,
-3.739442, 1, -5.162472,
-3.568227, 2, -4.906019,
-3.739442, 2, -5.162472,
-3.568227, 3, -4.906019,
-3.739442, 3, -5.162472
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
-4.081874, -3, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, -3, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, -3, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, -3, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, -2, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, -2, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, -2, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, -2, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, -1, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, -1, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, -1, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, -1, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, 0, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, 0, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, 0, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, 0, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, 1, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, 1, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, 1, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, 1, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, 2, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, 2, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, 2, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, 2, -5.67538, 0, 1.5, 0.5, 0.5,
-4.081874, 3, -5.67538, 0, -0.5, 0.5, 0.5,
-4.081874, 3, -5.67538, 1, -0.5, 0.5, 0.5,
-4.081874, 3, -5.67538, 1, 1.5, 0.5, 0.5,
-4.081874, 3, -5.67538, 0, 1.5, 0.5, 0.5
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
-3.568227, -3.227651, -4,
-3.568227, -3.227651, 4,
-3.568227, -3.227651, -4,
-3.739442, -3.387028, -4,
-3.568227, -3.227651, -2,
-3.739442, -3.387028, -2,
-3.568227, -3.227651, 0,
-3.739442, -3.387028, 0,
-3.568227, -3.227651, 2,
-3.739442, -3.387028, 2,
-3.568227, -3.227651, 4,
-3.739442, -3.387028, 4
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
-4.081874, -3.705781, -4, 0, -0.5, 0.5, 0.5,
-4.081874, -3.705781, -4, 1, -0.5, 0.5, 0.5,
-4.081874, -3.705781, -4, 1, 1.5, 0.5, 0.5,
-4.081874, -3.705781, -4, 0, 1.5, 0.5, 0.5,
-4.081874, -3.705781, -2, 0, -0.5, 0.5, 0.5,
-4.081874, -3.705781, -2, 1, -0.5, 0.5, 0.5,
-4.081874, -3.705781, -2, 1, 1.5, 0.5, 0.5,
-4.081874, -3.705781, -2, 0, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 0, 0, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 0, 1, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 0, 1, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 0, 0, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 2, 0, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 2, 1, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 2, 1, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 2, 0, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 4, 0, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 4, 1, -0.5, 0.5, 0.5,
-4.081874, -3.705781, 4, 1, 1.5, 0.5, 0.5,
-4.081874, -3.705781, 4, 0, 1.5, 0.5, 0.5
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
-3.568227, -3.227651, -4.906019,
-3.568227, 3.147414, -4.906019,
-3.568227, -3.227651, 5.35213,
-3.568227, 3.147414, 5.35213,
-3.568227, -3.227651, -4.906019,
-3.568227, -3.227651, 5.35213,
-3.568227, 3.147414, -4.906019,
-3.568227, 3.147414, 5.35213,
-3.568227, -3.227651, -4.906019,
3.2804, -3.227651, -4.906019,
-3.568227, -3.227651, 5.35213,
3.2804, -3.227651, 5.35213,
-3.568227, 3.147414, -4.906019,
3.2804, 3.147414, -4.906019,
-3.568227, 3.147414, 5.35213,
3.2804, 3.147414, 5.35213,
3.2804, -3.227651, -4.906019,
3.2804, 3.147414, -4.906019,
3.2804, -3.227651, 5.35213,
3.2804, 3.147414, 5.35213,
3.2804, -3.227651, -4.906019,
3.2804, -3.227651, 5.35213,
3.2804, 3.147414, -4.906019,
3.2804, 3.147414, 5.35213
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
var radius = 7.413965;
var distance = 32.98557;
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
mvMatrix.translate( 0.1439134, 0.04011846, -0.2230556 );
mvMatrix.scale( 1.170472, 1.257418, 0.7814397 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.98557);
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
isoxapyrifop<-read.table("isoxapyrifop.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxapyrifop$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
```

```r
y<-isoxapyrifop$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
```

```r
z<-isoxapyrifop$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
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
-3.468489, -0.4211378, -1.681307, 0, 0, 1, 1, 1,
-3.289894, -0.1413954, -0.09508041, 1, 0, 0, 1, 1,
-3.103042, -0.6093982, -2.649469, 1, 0, 0, 1, 1,
-3.039527, -1.705718, -2.126442, 1, 0, 0, 1, 1,
-2.883541, -1.296586, -3.242525, 1, 0, 0, 1, 1,
-2.74478, 0.1669101, 0.04966784, 1, 0, 0, 1, 1,
-2.658753, -0.2871287, -1.104235, 0, 0, 0, 1, 1,
-2.642735, -1.284411, -0.4098941, 0, 0, 0, 1, 1,
-2.635984, 0.4014484, -1.671469, 0, 0, 0, 1, 1,
-2.559365, -0.9755651, -2.432549, 0, 0, 0, 1, 1,
-2.457124, 0.3505608, -2.020295, 0, 0, 0, 1, 1,
-2.397057, -0.1794887, -1.373187, 0, 0, 0, 1, 1,
-2.375856, -1.154396, -2.21127, 0, 0, 0, 1, 1,
-2.375524, -0.5173149, -1.282217, 1, 1, 1, 1, 1,
-2.362627, 0.3784531, -2.077398, 1, 1, 1, 1, 1,
-2.32195, 0.4977827, -2.658751, 1, 1, 1, 1, 1,
-2.231476, 1.511041, -0.2033497, 1, 1, 1, 1, 1,
-2.217244, 0.7244533, -1.408671, 1, 1, 1, 1, 1,
-2.209878, -2.179524, -2.173468, 1, 1, 1, 1, 1,
-2.17475, 0.7009973, -1.599123, 1, 1, 1, 1, 1,
-2.151766, 1.248938, -0.9784511, 1, 1, 1, 1, 1,
-2.13947, 0.3643129, -1.651687, 1, 1, 1, 1, 1,
-2.026388, 0.5234322, -1.72841, 1, 1, 1, 1, 1,
-2.014194, -0.4227909, -0.8484797, 1, 1, 1, 1, 1,
-2.005839, -0.08454998, -3.378327, 1, 1, 1, 1, 1,
-1.999896, -1.341461, -2.42253, 1, 1, 1, 1, 1,
-1.995701, 1.062818, -0.3197356, 1, 1, 1, 1, 1,
-1.995363, -1.600173, -2.259067, 1, 1, 1, 1, 1,
-1.989156, -1.858424, -1.78429, 0, 0, 1, 1, 1,
-1.983593, 0.445391, -3.096998, 1, 0, 0, 1, 1,
-1.95519, 0.7301264, -3.162247, 1, 0, 0, 1, 1,
-1.947194, -1.033341, -2.067145, 1, 0, 0, 1, 1,
-1.900945, 1.279131, -0.3193574, 1, 0, 0, 1, 1,
-1.884243, -0.185559, -2.953593, 1, 0, 0, 1, 1,
-1.844988, -1.635466, -3.042944, 0, 0, 0, 1, 1,
-1.83172, 0.8916871, -0.746843, 0, 0, 0, 1, 1,
-1.816252, 0.8092089, -2.742169, 0, 0, 0, 1, 1,
-1.811111, 0.04247853, -1.029924, 0, 0, 0, 1, 1,
-1.77111, 1.192853, -1.774199, 0, 0, 0, 1, 1,
-1.768146, 0.798516, -1.353622, 0, 0, 0, 1, 1,
-1.74033, -0.7395856, -0.767761, 0, 0, 0, 1, 1,
-1.736901, 1.05896, 0.2879478, 1, 1, 1, 1, 1,
-1.716112, 1.113824, -0.6444585, 1, 1, 1, 1, 1,
-1.713305, 1.301874, -1.132824, 1, 1, 1, 1, 1,
-1.696564, -0.9742734, -3.351259, 1, 1, 1, 1, 1,
-1.686744, -0.1850277, -2.203149, 1, 1, 1, 1, 1,
-1.681391, 0.3143799, -1.433943, 1, 1, 1, 1, 1,
-1.667413, -1.965202, -3.429536, 1, 1, 1, 1, 1,
-1.659755, 0.2998649, -2.329691, 1, 1, 1, 1, 1,
-1.657046, -0.8201316, -2.492447, 1, 1, 1, 1, 1,
-1.641178, 0.1843265, -2.208019, 1, 1, 1, 1, 1,
-1.617042, 1.501376, 0.7184988, 1, 1, 1, 1, 1,
-1.608028, 0.3182641, -1.769226, 1, 1, 1, 1, 1,
-1.603463, -0.2787926, -1.973425, 1, 1, 1, 1, 1,
-1.60252, 0.4521496, -0.937872, 1, 1, 1, 1, 1,
-1.593688, -2.080281, -1.5407, 1, 1, 1, 1, 1,
-1.587897, 1.5123, -1.016966, 0, 0, 1, 1, 1,
-1.580795, 0.07471959, -3.449139, 1, 0, 0, 1, 1,
-1.579741, 1.267776, -1.088696, 1, 0, 0, 1, 1,
-1.552461, -1.549104, -4.166197, 1, 0, 0, 1, 1,
-1.539942, -1.223499, -3.279872, 1, 0, 0, 1, 1,
-1.520882, 0.498446, -2.199912, 1, 0, 0, 1, 1,
-1.515707, -0.1006057, -3.121587, 0, 0, 0, 1, 1,
-1.51334, -0.1885764, -1.113415, 0, 0, 0, 1, 1,
-1.480369, 0.143932, -2.89797, 0, 0, 0, 1, 1,
-1.47754, 0.591602, 0.05962336, 0, 0, 0, 1, 1,
-1.468694, -0.1436752, -2.409467, 0, 0, 0, 1, 1,
-1.468102, -1.365239, -2.219033, 0, 0, 0, 1, 1,
-1.447952, -0.485522, -1.232177, 0, 0, 0, 1, 1,
-1.440179, -0.00730853, -1.770774, 1, 1, 1, 1, 1,
-1.436979, 0.1077693, -1.756197, 1, 1, 1, 1, 1,
-1.42667, -0.4541587, -1.830089, 1, 1, 1, 1, 1,
-1.423643, 0.5240753, -4.756628, 1, 1, 1, 1, 1,
-1.413972, 1.178581, 0.7922868, 1, 1, 1, 1, 1,
-1.403557, 0.2873152, -0.5524618, 1, 1, 1, 1, 1,
-1.403002, -0.3990045, -1.322759, 1, 1, 1, 1, 1,
-1.402138, -1.640671, -2.506021, 1, 1, 1, 1, 1,
-1.399816, -0.9157998, -2.675538, 1, 1, 1, 1, 1,
-1.396551, 1.324499, -0.3533096, 1, 1, 1, 1, 1,
-1.390068, 0.15644, -1.81858, 1, 1, 1, 1, 1,
-1.386041, -2.257571, -3.391946, 1, 1, 1, 1, 1,
-1.374576, 0.09563936, -1.939573, 1, 1, 1, 1, 1,
-1.371336, -0.3692488, -2.677157, 1, 1, 1, 1, 1,
-1.366138, -0.05643862, -4.111989, 1, 1, 1, 1, 1,
-1.362062, 0.6842991, -1.318412, 0, 0, 1, 1, 1,
-1.354654, -0.8981253, -1.358247, 1, 0, 0, 1, 1,
-1.354477, 0.7619411, -1.81594, 1, 0, 0, 1, 1,
-1.35403, -0.9311768, -1.552928, 1, 0, 0, 1, 1,
-1.342647, 0.207654, -1.156778, 1, 0, 0, 1, 1,
-1.341027, -0.3215299, -1.089987, 1, 0, 0, 1, 1,
-1.340685, 0.3603943, -0.4932389, 0, 0, 0, 1, 1,
-1.331349, 0.597249, -0.4331573, 0, 0, 0, 1, 1,
-1.325007, -0.6744497, -1.048968, 0, 0, 0, 1, 1,
-1.321926, -1.028315, -4.301976, 0, 0, 0, 1, 1,
-1.312749, -0.3643904, -4.22009, 0, 0, 0, 1, 1,
-1.311613, -0.1855779, -2.309779, 0, 0, 0, 1, 1,
-1.304866, 1.304596, 0.4680614, 0, 0, 0, 1, 1,
-1.289542, -0.6031196, -0.5030378, 1, 1, 1, 1, 1,
-1.284694, 0.2585239, -0.5668328, 1, 1, 1, 1, 1,
-1.281639, -0.8815287, -1.571315, 1, 1, 1, 1, 1,
-1.278225, 0.2901288, 0.3319091, 1, 1, 1, 1, 1,
-1.268512, -0.213936, -2.224526, 1, 1, 1, 1, 1,
-1.268169, -1.096401, -2.437111, 1, 1, 1, 1, 1,
-1.263797, -1.36132, -2.347447, 1, 1, 1, 1, 1,
-1.260148, 0.5822669, -0.5847641, 1, 1, 1, 1, 1,
-1.245575, -0.8853925, -2.123427, 1, 1, 1, 1, 1,
-1.239339, -1.471539, -3.072732, 1, 1, 1, 1, 1,
-1.233637, 0.05494754, -2.808032, 1, 1, 1, 1, 1,
-1.232238, 0.5018469, -3.184285, 1, 1, 1, 1, 1,
-1.218828, -1.237197, -3.1982, 1, 1, 1, 1, 1,
-1.213738, -0.5165411, -2.990253, 1, 1, 1, 1, 1,
-1.211895, -1.378685, -2.502213, 1, 1, 1, 1, 1,
-1.206614, -0.05108949, -3.33536, 0, 0, 1, 1, 1,
-1.2031, -2.081464, -2.077277, 1, 0, 0, 1, 1,
-1.198607, -1.886602, -1.479129, 1, 0, 0, 1, 1,
-1.197191, -0.2465524, -1.149328, 1, 0, 0, 1, 1,
-1.191556, 1.559623, -2.093458, 1, 0, 0, 1, 1,
-1.177911, 0.4020845, -1.997918, 1, 0, 0, 1, 1,
-1.173261, -0.9063296, -1.517977, 0, 0, 0, 1, 1,
-1.172326, -1.757655, -0.6746491, 0, 0, 0, 1, 1,
-1.169549, -0.0182567, -2.253519, 0, 0, 0, 1, 1,
-1.169132, 0.3425995, 0.610774, 0, 0, 0, 1, 1,
-1.16724, -0.1400112, -1.219536, 0, 0, 0, 1, 1,
-1.144545, 2.229841, -0.515023, 0, 0, 0, 1, 1,
-1.137651, -0.1743079, -3.060826, 0, 0, 0, 1, 1,
-1.135146, 0.450225, -2.153055, 1, 1, 1, 1, 1,
-1.134187, -0.8723522, -2.387034, 1, 1, 1, 1, 1,
-1.126046, 0.494045, -2.093223, 1, 1, 1, 1, 1,
-1.125193, 0.5182294, 0.1107803, 1, 1, 1, 1, 1,
-1.122438, 1.058133, -2.030312, 1, 1, 1, 1, 1,
-1.113412, 0.6889519, -1.127199, 1, 1, 1, 1, 1,
-1.112333, 0.009479415, -0.8784276, 1, 1, 1, 1, 1,
-1.111469, -0.0129229, -2.630277, 1, 1, 1, 1, 1,
-1.10718, 1.559553, -0.3585013, 1, 1, 1, 1, 1,
-1.105334, -0.6113699, -1.598985, 1, 1, 1, 1, 1,
-1.105157, 0.4575396, -1.439251, 1, 1, 1, 1, 1,
-1.094568, -0.3285278, -2.23585, 1, 1, 1, 1, 1,
-1.086793, 0.9082974, -2.943701, 1, 1, 1, 1, 1,
-1.086662, -1.125615, -1.39067, 1, 1, 1, 1, 1,
-1.085771, 0.7695615, -1.601778, 1, 1, 1, 1, 1,
-1.083206, 0.8740321, -1.121341, 0, 0, 1, 1, 1,
-1.080459, 0.6400783, -0.4143282, 1, 0, 0, 1, 1,
-1.075463, -0.3204905, 0.2571674, 1, 0, 0, 1, 1,
-1.061897, 0.4410863, -0.7808511, 1, 0, 0, 1, 1,
-1.060859, 1.32974, -1.74139, 1, 0, 0, 1, 1,
-1.053595, -0.8617892, -1.658111, 1, 0, 0, 1, 1,
-1.04658, 0.6703617, -0.7013719, 0, 0, 0, 1, 1,
-1.042879, -1.251734, -2.077372, 0, 0, 0, 1, 1,
-1.041594, 1.087826, -2.927866, 0, 0, 0, 1, 1,
-1.041448, -0.4348488, -1.69098, 0, 0, 0, 1, 1,
-1.040006, 1.583287, -0.1809512, 0, 0, 0, 1, 1,
-1.039812, 0.4378038, 0.01893186, 0, 0, 0, 1, 1,
-1.039033, 1.003456, 0.7449794, 0, 0, 0, 1, 1,
-1.030998, 0.5375592, -0.1670878, 1, 1, 1, 1, 1,
-1.030797, -2.215337, -1.909992, 1, 1, 1, 1, 1,
-1.029639, -1.559936, -3.538355, 1, 1, 1, 1, 1,
-1.023745, -1.01896, -2.801867, 1, 1, 1, 1, 1,
-1.013193, 0.4104938, -0.8279939, 1, 1, 1, 1, 1,
-1.010498, -2.515901, -1.810369, 1, 1, 1, 1, 1,
-1.008243, -1.058446, -1.146965, 1, 1, 1, 1, 1,
-1.005737, 1.713273, -1.454036, 1, 1, 1, 1, 1,
-1.001661, 0.7077477, -1.000566, 1, 1, 1, 1, 1,
-1.000226, 0.4529343, -0.687319, 1, 1, 1, 1, 1,
-1.000044, 1.309122, -1.467276, 1, 1, 1, 1, 1,
-0.9981704, 0.02424304, -0.7668273, 1, 1, 1, 1, 1,
-0.9942325, -0.05057786, 0.3862432, 1, 1, 1, 1, 1,
-0.9934701, -1.03057, -3.817827, 1, 1, 1, 1, 1,
-0.9898125, -0.02301896, -2.128224, 1, 1, 1, 1, 1,
-0.9808984, 1.587968, 0.3852733, 0, 0, 1, 1, 1,
-0.9625596, -1.374186, -2.324698, 1, 0, 0, 1, 1,
-0.9600031, 1.831999, 0.0861899, 1, 0, 0, 1, 1,
-0.9535356, -0.629099, -1.635428, 1, 0, 0, 1, 1,
-0.9313011, -2.218535, -2.907929, 1, 0, 0, 1, 1,
-0.9255937, 2.976501, 1.035376, 1, 0, 0, 1, 1,
-0.9181602, 0.2151614, -0.7870669, 0, 0, 0, 1, 1,
-0.9139406, -0.1053759, -1.346637, 0, 0, 0, 1, 1,
-0.9039364, -1.782837, -0.2463547, 0, 0, 0, 1, 1,
-0.9034321, -0.6734512, -2.052372, 0, 0, 0, 1, 1,
-0.8970166, 0.2595428, -1.906932, 0, 0, 0, 1, 1,
-0.8932758, -0.1320544, -0.3754457, 0, 0, 0, 1, 1,
-0.8899994, 1.784747, -1.147926, 0, 0, 0, 1, 1,
-0.877023, 0.4734383, -0.6715716, 1, 1, 1, 1, 1,
-0.8623112, -0.6339863, -2.510684, 1, 1, 1, 1, 1,
-0.8578796, -2.394011, -2.471804, 1, 1, 1, 1, 1,
-0.8575398, 1.689931, -1.398923, 1, 1, 1, 1, 1,
-0.8537301, -1.916549, -4.053407, 1, 1, 1, 1, 1,
-0.8525895, 1.17903, -1.092611, 1, 1, 1, 1, 1,
-0.8498214, 1.190408, -1.683483, 1, 1, 1, 1, 1,
-0.8490842, -1.027261, -2.467601, 1, 1, 1, 1, 1,
-0.8390074, 1.030262, -0.469722, 1, 1, 1, 1, 1,
-0.836333, -0.9752955, -1.446322, 1, 1, 1, 1, 1,
-0.8277661, 0.2438016, -1.42698, 1, 1, 1, 1, 1,
-0.8277074, -0.4513664, -2.204069, 1, 1, 1, 1, 1,
-0.8258644, 0.04702679, -0.6193007, 1, 1, 1, 1, 1,
-0.8254938, -0.9397805, -2.548938, 1, 1, 1, 1, 1,
-0.8246658, -1.280528, -1.179277, 1, 1, 1, 1, 1,
-0.8237267, -0.943205, -3.577276, 0, 0, 1, 1, 1,
-0.8214781, -1.677051, -4.339109, 1, 0, 0, 1, 1,
-0.8209478, -0.03080144, -2.85079, 1, 0, 0, 1, 1,
-0.8051909, -0.7007756, -2.626006, 1, 0, 0, 1, 1,
-0.8046672, -0.6847756, -3.806242, 1, 0, 0, 1, 1,
-0.7987819, 0.8131818, 0.8846739, 1, 0, 0, 1, 1,
-0.7945583, -0.7875448, -1.624877, 0, 0, 0, 1, 1,
-0.7907295, -0.8114291, -1.743304, 0, 0, 0, 1, 1,
-0.7902139, 0.8041642, 0.119394, 0, 0, 0, 1, 1,
-0.7868183, -0.692232, -1.827055, 0, 0, 0, 1, 1,
-0.7865811, -0.5488344, -3.598063, 0, 0, 0, 1, 1,
-0.7862262, -0.3014536, -0.9944288, 0, 0, 0, 1, 1,
-0.7813756, 1.313504, -2.085971, 0, 0, 0, 1, 1,
-0.7780904, -1.141297, -1.79358, 1, 1, 1, 1, 1,
-0.7745317, -0.2657961, -3.88121, 1, 1, 1, 1, 1,
-0.7740136, 0.5454, -1.536554, 1, 1, 1, 1, 1,
-0.7718204, -0.4335158, -1.258243, 1, 1, 1, 1, 1,
-0.7715, 0.3159113, -1.806794, 1, 1, 1, 1, 1,
-0.7698097, -0.5370035, -0.2612607, 1, 1, 1, 1, 1,
-0.7664559, -0.43241, -2.448614, 1, 1, 1, 1, 1,
-0.7661625, 2.038141, -0.511766, 1, 1, 1, 1, 1,
-0.7629182, 1.197004, -0.5702486, 1, 1, 1, 1, 1,
-0.762722, 0.1987085, -0.2050138, 1, 1, 1, 1, 1,
-0.7613749, 0.9804217, -1.884208, 1, 1, 1, 1, 1,
-0.7537922, 0.05892062, -0.7442887, 1, 1, 1, 1, 1,
-0.7459561, -0.4767889, -2.18511, 1, 1, 1, 1, 1,
-0.7443085, 0.489538, -0.6455041, 1, 1, 1, 1, 1,
-0.7422045, -1.603822, -2.432811, 1, 1, 1, 1, 1,
-0.7403688, -1.658857, -3.487557, 0, 0, 1, 1, 1,
-0.7403263, 0.135467, -2.177585, 1, 0, 0, 1, 1,
-0.7394411, -1.214815, -2.505882, 1, 0, 0, 1, 1,
-0.7294843, 0.2139113, -2.316454, 1, 0, 0, 1, 1,
-0.7249736, -0.60678, -1.105682, 1, 0, 0, 1, 1,
-0.7233247, 0.1405271, -0.6218787, 1, 0, 0, 1, 1,
-0.7229817, -0.8082086, -1.144671, 0, 0, 0, 1, 1,
-0.7195369, -0.5671592, -2.735079, 0, 0, 0, 1, 1,
-0.7167648, -0.2717206, -1.495271, 0, 0, 0, 1, 1,
-0.7126402, -1.245046, -2.606468, 0, 0, 0, 1, 1,
-0.7068924, 0.2322544, 0.3289512, 0, 0, 0, 1, 1,
-0.7060098, 0.6891611, -1.059739, 0, 0, 0, 1, 1,
-0.7053279, 2.158659, -1.922461, 0, 0, 0, 1, 1,
-0.7050999, -1.183795, -2.807351, 1, 1, 1, 1, 1,
-0.6936989, -0.4137487, -2.224569, 1, 1, 1, 1, 1,
-0.6918747, 2.551821, -1.104343, 1, 1, 1, 1, 1,
-0.6905199, 0.9504935, -0.4245378, 1, 1, 1, 1, 1,
-0.6895449, 0.837042, -0.9774289, 1, 1, 1, 1, 1,
-0.6861129, -1.378596, -2.627762, 1, 1, 1, 1, 1,
-0.682959, 0.8216719, 0.2814739, 1, 1, 1, 1, 1,
-0.6822202, 0.170227, -0.6047484, 1, 1, 1, 1, 1,
-0.6817061, -1.496268, -1.946898, 1, 1, 1, 1, 1,
-0.6782974, 1.197398, 0.09397445, 1, 1, 1, 1, 1,
-0.6740106, 1.442721, -1.397456, 1, 1, 1, 1, 1,
-0.665211, -2.145576, -4.405622, 1, 1, 1, 1, 1,
-0.663069, 0.7794597, -0.2821634, 1, 1, 1, 1, 1,
-0.6625468, 0.8346063, -0.5588837, 1, 1, 1, 1, 1,
-0.6615239, -0.74542, -3.379018, 1, 1, 1, 1, 1,
-0.6553423, 0.1079519, -1.560866, 0, 0, 1, 1, 1,
-0.6517086, 1.322054, -2.287847, 1, 0, 0, 1, 1,
-0.6494622, -1.24569, -1.961305, 1, 0, 0, 1, 1,
-0.6465597, -1.140204, 0.5229561, 1, 0, 0, 1, 1,
-0.6451643, 1.399472, -0.1754989, 1, 0, 0, 1, 1,
-0.6405873, -0.6600022, -2.863079, 1, 0, 0, 1, 1,
-0.6382533, 0.1011037, 0.01195416, 0, 0, 0, 1, 1,
-0.6370099, 0.6214422, -1.45188, 0, 0, 0, 1, 1,
-0.6338148, 0.5894014, -0.4397306, 0, 0, 0, 1, 1,
-0.6311504, 2.02625, -0.1772999, 0, 0, 0, 1, 1,
-0.6287399, -0.07523811, -1.463561, 0, 0, 0, 1, 1,
-0.6195918, 0.6086501, -0.6163562, 0, 0, 0, 1, 1,
-0.6176012, -0.2756739, -2.570993, 0, 0, 0, 1, 1,
-0.6160729, 1.906626, 0.3739533, 1, 1, 1, 1, 1,
-0.6125151, -0.1168123, -1.571391, 1, 1, 1, 1, 1,
-0.6111377, 1.534825, -0.7450799, 1, 1, 1, 1, 1,
-0.6096593, -1.044001, -3.139098, 1, 1, 1, 1, 1,
-0.6051192, 0.9724379, -0.447034, 1, 1, 1, 1, 1,
-0.604282, 1.75695, -1.120678, 1, 1, 1, 1, 1,
-0.597573, -0.3003151, -1.028871, 1, 1, 1, 1, 1,
-0.5941646, -0.174718, -1.354738, 1, 1, 1, 1, 1,
-0.5936485, 0.5305923, -1.158819, 1, 1, 1, 1, 1,
-0.5921526, 0.2366692, -1.383128, 1, 1, 1, 1, 1,
-0.592043, -2.441579, -1.886412, 1, 1, 1, 1, 1,
-0.5891392, -0.5046132, -2.311541, 1, 1, 1, 1, 1,
-0.5887404, -0.2966906, -2.21749, 1, 1, 1, 1, 1,
-0.58748, -1.146291, -2.969898, 1, 1, 1, 1, 1,
-0.5860955, -0.6291081, 0.02227377, 1, 1, 1, 1, 1,
-0.5841818, -0.7754156, -1.137972, 0, 0, 1, 1, 1,
-0.5836502, -0.3699507, -2.372191, 1, 0, 0, 1, 1,
-0.583142, 0.639235, -1.33253, 1, 0, 0, 1, 1,
-0.5823683, 0.5255386, -1.90644, 1, 0, 0, 1, 1,
-0.5805965, 0.2279366, -0.996907, 1, 0, 0, 1, 1,
-0.5763108, -0.7292838, -2.267705, 1, 0, 0, 1, 1,
-0.5683699, -0.5414721, -1.717157, 0, 0, 0, 1, 1,
-0.5677115, 0.1716174, -1.980645, 0, 0, 0, 1, 1,
-0.5546553, -0.4687987, -2.200214, 0, 0, 0, 1, 1,
-0.5541705, 0.1931042, -0.176972, 0, 0, 0, 1, 1,
-0.5508094, -0.9777541, -2.299995, 0, 0, 0, 1, 1,
-0.5498235, -0.5305616, 0.952564, 0, 0, 0, 1, 1,
-0.5442896, 0.3264973, -1.57014, 0, 0, 0, 1, 1,
-0.5421969, 1.246006, -1.034723, 1, 1, 1, 1, 1,
-0.5409249, 0.518418, 1.251488, 1, 1, 1, 1, 1,
-0.5377802, 0.02824746, -0.4606013, 1, 1, 1, 1, 1,
-0.5370245, 0.1913952, -1.58009, 1, 1, 1, 1, 1,
-0.5356529, -0.3492058, -0.2233037, 1, 1, 1, 1, 1,
-0.5312217, -0.2417252, -2.013508, 1, 1, 1, 1, 1,
-0.5288755, 0.7815447, 0.1357964, 1, 1, 1, 1, 1,
-0.5283728, -0.1182606, -2.107574, 1, 1, 1, 1, 1,
-0.5272961, -0.3860613, -0.8449612, 1, 1, 1, 1, 1,
-0.5219973, -0.1070967, -0.1599013, 1, 1, 1, 1, 1,
-0.5150728, 1.126784, 0.520269, 1, 1, 1, 1, 1,
-0.5141261, 1.043305, -0.4071827, 1, 1, 1, 1, 1,
-0.5128276, 1.475454, -0.7711446, 1, 1, 1, 1, 1,
-0.5116079, 0.6025337, 0.1207356, 1, 1, 1, 1, 1,
-0.5097159, 1.119967, -0.315209, 1, 1, 1, 1, 1,
-0.5087079, -0.04585424, -1.442116, 0, 0, 1, 1, 1,
-0.5067973, -0.897182, -1.294788, 1, 0, 0, 1, 1,
-0.5051786, 1.388259, -1.028909, 1, 0, 0, 1, 1,
-0.5049595, -0.8972586, -2.290116, 1, 0, 0, 1, 1,
-0.4976197, 0.8782113, -0.6821984, 1, 0, 0, 1, 1,
-0.4961042, 0.7059368, -0.7213076, 1, 0, 0, 1, 1,
-0.4931904, -0.5385265, -2.978, 0, 0, 0, 1, 1,
-0.4930516, -0.4286996, -3.850148, 0, 0, 0, 1, 1,
-0.4870214, -1.521343, -2.558142, 0, 0, 0, 1, 1,
-0.4866464, -0.384124, -2.458357, 0, 0, 0, 1, 1,
-0.4798352, -0.1245385, -2.208241, 0, 0, 0, 1, 1,
-0.4756283, 0.7131686, -1.155873, 0, 0, 0, 1, 1,
-0.4743516, -0.1269365, -1.365037, 0, 0, 0, 1, 1,
-0.4737068, -0.8342651, -2.879351, 1, 1, 1, 1, 1,
-0.4732887, -0.4869035, -3.213744, 1, 1, 1, 1, 1,
-0.4715953, 0.1979283, -2.480945, 1, 1, 1, 1, 1,
-0.4711854, -1.480049, -1.982052, 1, 1, 1, 1, 1,
-0.4706541, 1.808289, 0.1557091, 1, 1, 1, 1, 1,
-0.4682347, -1.320132, -1.7119, 1, 1, 1, 1, 1,
-0.4681405, -2.114348, -2.887808, 1, 1, 1, 1, 1,
-0.4666529, 1.685658, -0.9088315, 1, 1, 1, 1, 1,
-0.4639558, 0.2300297, -0.342333, 1, 1, 1, 1, 1,
-0.4633125, 1.075615, 0.5141293, 1, 1, 1, 1, 1,
-0.4630221, -1.011829, -4.537044, 1, 1, 1, 1, 1,
-0.4593145, 1.420663, 1.352541, 1, 1, 1, 1, 1,
-0.4561343, -1.360721, -2.493121, 1, 1, 1, 1, 1,
-0.4556323, 1.222705, -0.4565863, 1, 1, 1, 1, 1,
-0.4546237, 0.6547237, -1.744737, 1, 1, 1, 1, 1,
-0.4509834, 0.3722876, -0.05322544, 0, 0, 1, 1, 1,
-0.4509814, -0.01628896, 0.8455276, 1, 0, 0, 1, 1,
-0.4499837, -1.129665, -3.286024, 1, 0, 0, 1, 1,
-0.4498961, 0.08594089, -2.628784, 1, 0, 0, 1, 1,
-0.4482975, -0.3786569, -0.6285206, 1, 0, 0, 1, 1,
-0.4424326, -0.6703696, -2.179033, 1, 0, 0, 1, 1,
-0.440304, 0.4770235, -1.159391, 0, 0, 0, 1, 1,
-0.4398603, -0.8360727, -3.1941, 0, 0, 0, 1, 1,
-0.4360973, 0.7720699, -1.382102, 0, 0, 0, 1, 1,
-0.431649, -0.1768759, -2.775719, 0, 0, 0, 1, 1,
-0.4302385, 0.2765777, -2.560205, 0, 0, 0, 1, 1,
-0.425709, 0.1387008, -1.094237, 0, 0, 0, 1, 1,
-0.4254906, -0.0743844, -1.304332, 0, 0, 0, 1, 1,
-0.423378, -0.3368601, -3.193509, 1, 1, 1, 1, 1,
-0.4228585, 1.281596, -2.689165, 1, 1, 1, 1, 1,
-0.41963, -0.7541098, -3.079255, 1, 1, 1, 1, 1,
-0.4163829, -0.3363937, -2.723392, 1, 1, 1, 1, 1,
-0.4141592, 0.2012142, -1.435394, 1, 1, 1, 1, 1,
-0.4120525, 0.6959401, -0.8996403, 1, 1, 1, 1, 1,
-0.407334, 1.77307, -0.5743457, 1, 1, 1, 1, 1,
-0.4049194, -1.501365, -2.745847, 1, 1, 1, 1, 1,
-0.4019507, 0.6493362, -1.04699, 1, 1, 1, 1, 1,
-0.4009234, -0.526778, -1.48319, 1, 1, 1, 1, 1,
-0.4007733, -1.823931, -3.405121, 1, 1, 1, 1, 1,
-0.3973804, -1.76463, -3.029367, 1, 1, 1, 1, 1,
-0.3956264, 0.1381425, -1.317335, 1, 1, 1, 1, 1,
-0.3952115, 0.9009676, 0.3754449, 1, 1, 1, 1, 1,
-0.3841996, 0.1995039, 0.7043018, 1, 1, 1, 1, 1,
-0.382803, -1.190396, -2.471624, 0, 0, 1, 1, 1,
-0.3824804, 0.7623088, -0.8346989, 1, 0, 0, 1, 1,
-0.3824505, 0.864308, 0.4035721, 1, 0, 0, 1, 1,
-0.3784544, 0.4798428, -1.520981, 1, 0, 0, 1, 1,
-0.3776424, -1.646259, -2.38726, 1, 0, 0, 1, 1,
-0.3773219, 0.4028394, -1.718763, 1, 0, 0, 1, 1,
-0.3715859, 0.4112959, -3.497844, 0, 0, 0, 1, 1,
-0.3710675, -0.02591688, -2.873271, 0, 0, 0, 1, 1,
-0.3652127, -0.8812098, -4.441389, 0, 0, 0, 1, 1,
-0.364434, -2.056839, -2.976838, 0, 0, 0, 1, 1,
-0.364055, 0.4676555, 0.6191368, 0, 0, 0, 1, 1,
-0.3617262, -0.6829604, 0.1829119, 0, 0, 0, 1, 1,
-0.355525, 0.2278875, -2.067927, 0, 0, 0, 1, 1,
-0.3525122, 0.01004697, -2.690764, 1, 1, 1, 1, 1,
-0.3515689, -0.2151562, -2.472469, 1, 1, 1, 1, 1,
-0.3430508, -1.064725, -3.255494, 1, 1, 1, 1, 1,
-0.3403634, -1.290933, -1.957709, 1, 1, 1, 1, 1,
-0.3402931, 0.5494439, 1.997721, 1, 1, 1, 1, 1,
-0.3385381, 1.62019, 0.7739534, 1, 1, 1, 1, 1,
-0.3368229, 0.9512056, 0.0811439, 1, 1, 1, 1, 1,
-0.333756, -1.327365, -3.905099, 1, 1, 1, 1, 1,
-0.3299438, 0.9273324, 0.3686364, 1, 1, 1, 1, 1,
-0.3240527, 0.4202678, -1.269753, 1, 1, 1, 1, 1,
-0.3138394, -0.6696439, -4.154023, 1, 1, 1, 1, 1,
-0.3125995, -3.053534, -2.633898, 1, 1, 1, 1, 1,
-0.3117546, 0.5503296, 0.3521339, 1, 1, 1, 1, 1,
-0.3080486, 0.9713519, 1.21825, 1, 1, 1, 1, 1,
-0.3045116, -0.8571841, -3.507776, 1, 1, 1, 1, 1,
-0.3025416, 0.3717956, -2.915765, 0, 0, 1, 1, 1,
-0.3019453, 0.1862212, -2.824654, 1, 0, 0, 1, 1,
-0.3013182, -1.380564, -3.940236, 1, 0, 0, 1, 1,
-0.3012221, 0.9972668, 0.07138785, 1, 0, 0, 1, 1,
-0.3011109, 0.5757214, -0.4009821, 1, 0, 0, 1, 1,
-0.2990288, 0.4037866, 0.1470539, 1, 0, 0, 1, 1,
-0.2986421, -0.8804792, -0.9979162, 0, 0, 0, 1, 1,
-0.2953941, -0.7848982, -0.9953788, 0, 0, 0, 1, 1,
-0.2944947, 0.1136913, -1.526163, 0, 0, 0, 1, 1,
-0.2895889, -0.8062908, -2.990992, 0, 0, 0, 1, 1,
-0.2834425, -0.6758976, -3.13343, 0, 0, 0, 1, 1,
-0.2819383, -0.113567, -1.592494, 0, 0, 0, 1, 1,
-0.2815482, -2.062947, -3.613583, 0, 0, 0, 1, 1,
-0.2812931, -0.8735141, -3.493228, 1, 1, 1, 1, 1,
-0.2713545, -0.4301088, -3.744782, 1, 1, 1, 1, 1,
-0.2711983, 0.1147005, -2.794723, 1, 1, 1, 1, 1,
-0.2683193, -0.7548771, -3.13499, 1, 1, 1, 1, 1,
-0.2668568, -0.4765082, -4.071798, 1, 1, 1, 1, 1,
-0.2664886, -0.2418731, -2.538809, 1, 1, 1, 1, 1,
-0.2647063, -0.7361106, -3.744248, 1, 1, 1, 1, 1,
-0.2640566, 0.07609103, -2.063035, 1, 1, 1, 1, 1,
-0.2635382, 0.8318655, -0.06229649, 1, 1, 1, 1, 1,
-0.2628068, -0.7991372, -3.187139, 1, 1, 1, 1, 1,
-0.260646, 0.4207447, -0.5237992, 1, 1, 1, 1, 1,
-0.2580649, 0.4131569, 0.151265, 1, 1, 1, 1, 1,
-0.2576048, -0.8042736, -1.399173, 1, 1, 1, 1, 1,
-0.2545596, 0.5849422, 0.9719191, 1, 1, 1, 1, 1,
-0.2530467, -0.232395, -1.273654, 1, 1, 1, 1, 1,
-0.2505682, -1.012935, -3.880353, 0, 0, 1, 1, 1,
-0.2437294, 1.104356, 0.08009824, 1, 0, 0, 1, 1,
-0.2430184, -0.3853187, -2.138288, 1, 0, 0, 1, 1,
-0.2392346, -0.7183871, -3.129843, 1, 0, 0, 1, 1,
-0.2323271, 0.3766354, -1.94492, 1, 0, 0, 1, 1,
-0.2315016, 0.1630776, -0.6355237, 1, 0, 0, 1, 1,
-0.2280258, 1.75445, -1.263872, 0, 0, 0, 1, 1,
-0.2274372, 1.10535, 0.07676923, 0, 0, 0, 1, 1,
-0.2235294, 1.234887, -0.1632798, 0, 0, 0, 1, 1,
-0.2230413, 0.6619886, -2.450477, 0, 0, 0, 1, 1,
-0.2228596, 0.9871651, -1.43575, 0, 0, 0, 1, 1,
-0.2187987, -0.01047632, -1.298682, 0, 0, 0, 1, 1,
-0.2173404, -0.5192318, -4.329926, 0, 0, 0, 1, 1,
-0.2161435, 0.606095, -2.288358, 1, 1, 1, 1, 1,
-0.2129513, 0.03289372, -1.88134, 1, 1, 1, 1, 1,
-0.211947, -0.1688, -3.872807, 1, 1, 1, 1, 1,
-0.2093226, -1.727336, -2.929763, 1, 1, 1, 1, 1,
-0.2054285, 1.137854, -0.1427058, 1, 1, 1, 1, 1,
-0.2044095, -1.75133, -3.994367, 1, 1, 1, 1, 1,
-0.2043742, 0.02150033, -1.795765, 1, 1, 1, 1, 1,
-0.2020256, -0.005373983, -2.853108, 1, 1, 1, 1, 1,
-0.200943, 0.1845178, -0.4373453, 1, 1, 1, 1, 1,
-0.1988273, 2.013964, -0.2322641, 1, 1, 1, 1, 1,
-0.1965756, -1.004179, -2.247063, 1, 1, 1, 1, 1,
-0.1958813, 0.7036125, 0.1000246, 1, 1, 1, 1, 1,
-0.1893625, -0.6346706, -2.2893, 1, 1, 1, 1, 1,
-0.1892099, -0.1658526, -1.177158, 1, 1, 1, 1, 1,
-0.185771, 2.30179, 0.9622393, 1, 1, 1, 1, 1,
-0.1827407, -0.5774881, -3.155954, 0, 0, 1, 1, 1,
-0.1807116, 0.05081542, -2.332321, 1, 0, 0, 1, 1,
-0.1781724, -0.156459, -2.80299, 1, 0, 0, 1, 1,
-0.1777758, 0.3683443, 0.2352266, 1, 0, 0, 1, 1,
-0.1692443, 0.8244695, 1.428166, 1, 0, 0, 1, 1,
-0.15975, 0.8600038, 0.61702, 1, 0, 0, 1, 1,
-0.1596022, 0.6471096, 1.836466, 0, 0, 0, 1, 1,
-0.1585554, -0.4870013, -2.779182, 0, 0, 0, 1, 1,
-0.1583902, 0.6962204, -0.5371025, 0, 0, 0, 1, 1,
-0.1577407, -0.4511729, -4.314759, 0, 0, 0, 1, 1,
-0.1539836, 0.7717315, 0.907754, 0, 0, 0, 1, 1,
-0.1536216, -0.4045155, -4.318422, 0, 0, 0, 1, 1,
-0.1515057, 0.428066, 0.180776, 0, 0, 0, 1, 1,
-0.1497642, -0.9349683, -2.971999, 1, 1, 1, 1, 1,
-0.1455003, -0.008732783, -3.571486, 1, 1, 1, 1, 1,
-0.1424163, 0.1152263, -1.5893, 1, 1, 1, 1, 1,
-0.1416973, 0.04861492, -1.986714, 1, 1, 1, 1, 1,
-0.1378015, -0.09880932, -1.004195, 1, 1, 1, 1, 1,
-0.1309146, -0.7373185, -3.18013, 1, 1, 1, 1, 1,
-0.1308127, 2.933817, 1.057294, 1, 1, 1, 1, 1,
-0.1297726, 0.8031075, -0.4101564, 1, 1, 1, 1, 1,
-0.1250807, 0.6209934, -0.1117171, 1, 1, 1, 1, 1,
-0.1208433, 0.6152698, 0.9360229, 1, 1, 1, 1, 1,
-0.1199375, -0.2354299, -1.286159, 1, 1, 1, 1, 1,
-0.1170654, 0.6178249, 0.5762189, 1, 1, 1, 1, 1,
-0.1146154, 0.2855431, -0.9392033, 1, 1, 1, 1, 1,
-0.1059722, 0.5431882, 0.0248512, 1, 1, 1, 1, 1,
-0.1055989, 0.2038079, -1.515255, 1, 1, 1, 1, 1,
-0.103944, -0.5322013, -4.320255, 0, 0, 1, 1, 1,
-0.1025135, -0.143735, -2.46336, 1, 0, 0, 1, 1,
-0.1024965, -0.4135565, -3.416736, 1, 0, 0, 1, 1,
-0.1001201, -0.9892855, -4.107971, 1, 0, 0, 1, 1,
-0.09576436, 0.381705, 0.2030163, 1, 0, 0, 1, 1,
-0.08727225, 0.5462649, 0.2428916, 1, 0, 0, 1, 1,
-0.08540352, 0.03533996, -1.799043, 0, 0, 0, 1, 1,
-0.08156814, -0.3368669, -2.730774, 0, 0, 0, 1, 1,
-0.08088005, -0.1175555, -1.853248, 0, 0, 0, 1, 1,
-0.08018788, 0.9198235, -0.4722151, 0, 0, 0, 1, 1,
-0.07828294, 0.2906191, -1.101927, 0, 0, 0, 1, 1,
-0.07786462, 1.655061, -1.572301, 0, 0, 0, 1, 1,
-0.07723529, -0.5775793, -2.468131, 0, 0, 0, 1, 1,
-0.07714721, 0.5364743, -0.6533877, 1, 1, 1, 1, 1,
-0.07627521, -0.9260496, -3.745926, 1, 1, 1, 1, 1,
-0.07370933, -1.39018, -1.373337, 1, 1, 1, 1, 1,
-0.06907262, -0.7486581, -3.260908, 1, 1, 1, 1, 1,
-0.06528762, -0.230386, -2.569232, 1, 1, 1, 1, 1,
-0.06445564, -2.204019, -3.947677, 1, 1, 1, 1, 1,
-0.06200648, -0.2560236, -3.403951, 1, 1, 1, 1, 1,
-0.06141432, 0.4762215, -1.331217, 1, 1, 1, 1, 1,
-0.05800107, -0.4829433, -1.146283, 1, 1, 1, 1, 1,
-0.05722047, -1.254118, -3.21339, 1, 1, 1, 1, 1,
-0.05552896, 0.4856155, 0.8806282, 1, 1, 1, 1, 1,
-0.05059752, -0.0587774, -1.810721, 1, 1, 1, 1, 1,
-0.04963892, -1.220541, -3.187239, 1, 1, 1, 1, 1,
-0.04606276, -0.5787784, -1.532001, 1, 1, 1, 1, 1,
-0.03990044, -0.5184218, -3.471846, 1, 1, 1, 1, 1,
-0.03896677, 0.08928241, -0.731393, 0, 0, 1, 1, 1,
-0.03512884, -0.5474076, -1.805884, 1, 0, 0, 1, 1,
-0.03419059, 1.956277, 0.1328903, 1, 0, 0, 1, 1,
-0.03390931, -0.3322942, -3.051114, 1, 0, 0, 1, 1,
-0.03236777, -0.4257761, -2.762348, 1, 0, 0, 1, 1,
-0.02737239, -0.4305243, -3.692751, 1, 0, 0, 1, 1,
-0.02158217, -1.711331, -3.449048, 0, 0, 0, 1, 1,
-0.02150201, 2.536318, 0.6070728, 0, 0, 0, 1, 1,
-0.01586858, 2.198591, 0.3501349, 0, 0, 0, 1, 1,
-0.01577582, -1.760485, -2.636902, 0, 0, 0, 1, 1,
-0.015063, 0.2859728, -0.7918333, 0, 0, 0, 1, 1,
-0.01503223, -0.1377544, -3.122228, 0, 0, 0, 1, 1,
-0.01044852, -0.4313031, -4.230132, 0, 0, 0, 1, 1,
-0.008759562, 1.231508, -0.8835421, 1, 1, 1, 1, 1,
-0.007410747, -0.5470141, -3.189641, 1, 1, 1, 1, 1,
-0.007080375, 1.262159, -1.628944, 1, 1, 1, 1, 1,
-0.001917268, -2.088525, -3.327356, 1, 1, 1, 1, 1,
0.001422865, -0.1079574, 3.100399, 1, 1, 1, 1, 1,
0.00238612, -1.253079, 3.248612, 1, 1, 1, 1, 1,
0.008736397, 0.7766935, -1.0502, 1, 1, 1, 1, 1,
0.0175971, -0.6662601, 3.248444, 1, 1, 1, 1, 1,
0.02024451, 0.4554862, 0.8189769, 1, 1, 1, 1, 1,
0.02383362, -1.406631, 3.890342, 1, 1, 1, 1, 1,
0.02745843, -0.4060591, 2.63626, 1, 1, 1, 1, 1,
0.02886883, -0.9257305, 1.285454, 1, 1, 1, 1, 1,
0.0375161, -0.4639312, 5.202739, 1, 1, 1, 1, 1,
0.03794946, -0.1879613, 1.907386, 1, 1, 1, 1, 1,
0.04083762, 0.1644558, 0.1484786, 1, 1, 1, 1, 1,
0.04206684, 2.350598, 0.01270096, 0, 0, 1, 1, 1,
0.04806596, 0.9247139, -1.567583, 1, 0, 0, 1, 1,
0.05456545, 0.1661739, -0.3293925, 1, 0, 0, 1, 1,
0.05553655, -0.5390909, 2.592057, 1, 0, 0, 1, 1,
0.06116234, -0.84113, 4.824938, 1, 0, 0, 1, 1,
0.06162512, -1.338192, 1.540583, 1, 0, 0, 1, 1,
0.06361435, 1.10786, -0.3015057, 0, 0, 0, 1, 1,
0.06601536, -1.018653, 2.559292, 0, 0, 0, 1, 1,
0.06727071, -0.2942255, 3.926989, 0, 0, 0, 1, 1,
0.06738447, -0.7400502, 2.321307, 0, 0, 0, 1, 1,
0.06849667, -0.7352084, 1.042547, 0, 0, 0, 1, 1,
0.07456044, 0.9136982, 0.1998789, 0, 0, 0, 1, 1,
0.07566433, -0.01011377, 0.0751225, 0, 0, 0, 1, 1,
0.07596806, -0.3744321, 2.770386, 1, 1, 1, 1, 1,
0.07733963, 0.4093691, -0.4025814, 1, 1, 1, 1, 1,
0.07742321, -0.119051, 4.606678, 1, 1, 1, 1, 1,
0.079355, 0.33517, 0.2807857, 1, 1, 1, 1, 1,
0.07977343, 0.3995715, -2.088528, 1, 1, 1, 1, 1,
0.08823819, -3.13481, 4.631725, 1, 1, 1, 1, 1,
0.08891345, -0.1406002, 1.018684, 1, 1, 1, 1, 1,
0.08896301, 0.8949245, 1.508197, 1, 1, 1, 1, 1,
0.09189565, 0.2159444, 0.1518611, 1, 1, 1, 1, 1,
0.09251256, -1.192087, 2.447473, 1, 1, 1, 1, 1,
0.0942663, 1.799178, -0.264434, 1, 1, 1, 1, 1,
0.09457066, -2.14968, 3.69096, 1, 1, 1, 1, 1,
0.09484143, -0.4269773, 4.38654, 1, 1, 1, 1, 1,
0.0978688, 0.2678716, 0.455938, 1, 1, 1, 1, 1,
0.09966341, -0.8799291, 0.4713098, 1, 1, 1, 1, 1,
0.1002906, 0.6633699, 0.8234103, 0, 0, 1, 1, 1,
0.107753, 0.01642647, 0.7240235, 1, 0, 0, 1, 1,
0.1092745, -0.1658845, 4.370743, 1, 0, 0, 1, 1,
0.1104139, -0.5242119, 3.035257, 1, 0, 0, 1, 1,
0.1120827, -2.127947, 3.480373, 1, 0, 0, 1, 1,
0.115653, -0.8880373, 4.424783, 1, 0, 0, 1, 1,
0.1167002, -1.049383, 1.931329, 0, 0, 0, 1, 1,
0.1168352, -1.111265, 4.24765, 0, 0, 0, 1, 1,
0.1169131, -1.343542, 3.763783, 0, 0, 0, 1, 1,
0.1206817, 3.054573, 0.04176978, 0, 0, 0, 1, 1,
0.1219421, -0.9040546, 1.389849, 0, 0, 0, 1, 1,
0.1232954, -0.264621, 3.130837, 0, 0, 0, 1, 1,
0.1241685, 0.9753984, 1.76272, 0, 0, 0, 1, 1,
0.1252707, 0.4832198, 1.274551, 1, 1, 1, 1, 1,
0.1304004, 1.339299, -0.2734064, 1, 1, 1, 1, 1,
0.1315392, -0.3469827, 3.859948, 1, 1, 1, 1, 1,
0.1395947, 0.5465798, -1.602175, 1, 1, 1, 1, 1,
0.1456334, -0.01794828, 2.451126, 1, 1, 1, 1, 1,
0.145955, -0.5043637, 2.461418, 1, 1, 1, 1, 1,
0.1530572, -0.4104754, 4.343421, 1, 1, 1, 1, 1,
0.1632664, 0.1539562, 1.296253, 1, 1, 1, 1, 1,
0.1638858, -0.8948068, 3.105694, 1, 1, 1, 1, 1,
0.164917, -0.5917205, 2.809748, 1, 1, 1, 1, 1,
0.1690575, -0.869654, 4.266717, 1, 1, 1, 1, 1,
0.1711442, 0.08452848, 0.3718268, 1, 1, 1, 1, 1,
0.1752033, 0.5349518, -0.01852081, 1, 1, 1, 1, 1,
0.1786098, 0.5115944, -0.2487781, 1, 1, 1, 1, 1,
0.1832834, -1.995757, 3.214551, 1, 1, 1, 1, 1,
0.1867513, 0.2276486, -0.3127057, 0, 0, 1, 1, 1,
0.1876961, 1.191728, -1.554222, 1, 0, 0, 1, 1,
0.194944, 1.954398, -2.288865, 1, 0, 0, 1, 1,
0.1975579, 0.7782221, 0.006758636, 1, 0, 0, 1, 1,
0.1977055, 0.5736146, 0.9638758, 1, 0, 0, 1, 1,
0.1980212, -1.706958, 2.753344, 1, 0, 0, 1, 1,
0.1980995, -0.5882255, 2.043876, 0, 0, 0, 1, 1,
0.2045898, 2.083591, 1.240377, 0, 0, 0, 1, 1,
0.2057602, 1.097812, -0.4714684, 0, 0, 0, 1, 1,
0.2092672, 0.119741, 0.6935635, 0, 0, 0, 1, 1,
0.2136864, -1.834182, 3.684997, 0, 0, 0, 1, 1,
0.2225649, 1.377661, -0.4934158, 0, 0, 0, 1, 1,
0.2252901, -0.8660462, 2.129605, 0, 0, 0, 1, 1,
0.225703, 0.8154637, -1.295494, 1, 1, 1, 1, 1,
0.2257998, 1.678716, 0.1895736, 1, 1, 1, 1, 1,
0.226706, -0.9201944, 3.368917, 1, 1, 1, 1, 1,
0.2375587, 1.416019, 0.5645024, 1, 1, 1, 1, 1,
0.2543541, -0.5131106, 1.154858, 1, 1, 1, 1, 1,
0.2597041, -1.384447, 1.925884, 1, 1, 1, 1, 1,
0.2621259, 1.61859, -0.09664924, 1, 1, 1, 1, 1,
0.2621642, -0.7023394, 0.6947995, 1, 1, 1, 1, 1,
0.2662738, 0.3101136, 1.229545, 1, 1, 1, 1, 1,
0.2687141, 0.3476704, -0.05823231, 1, 1, 1, 1, 1,
0.2770192, 0.126429, 1.723307, 1, 1, 1, 1, 1,
0.2773272, 0.7876862, 0.4990919, 1, 1, 1, 1, 1,
0.2774825, 0.2851759, 1.064074, 1, 1, 1, 1, 1,
0.2839883, -2.137538, 2.679299, 1, 1, 1, 1, 1,
0.2871268, 0.09249666, 2.465936, 1, 1, 1, 1, 1,
0.2883539, 0.2964292, 1.532108, 0, 0, 1, 1, 1,
0.291231, 0.8188153, 0.1507524, 1, 0, 0, 1, 1,
0.2916252, 0.01906778, 0.8786953, 1, 0, 0, 1, 1,
0.2918978, -1.554183, 5.063733, 1, 0, 0, 1, 1,
0.2954138, 0.498439, -0.6521026, 1, 0, 0, 1, 1,
0.3045172, -0.04437799, 1.90004, 1, 0, 0, 1, 1,
0.3196259, -0.9683101, 3.844016, 0, 0, 0, 1, 1,
0.3197539, 0.4492954, 0.2245017, 0, 0, 0, 1, 1,
0.3252019, -1.542238, 2.561151, 0, 0, 0, 1, 1,
0.3253275, 1.166922, -1.710311, 0, 0, 0, 1, 1,
0.3263724, 1.036975, 1.862325, 0, 0, 0, 1, 1,
0.3312671, 0.2505832, 0.6697599, 0, 0, 0, 1, 1,
0.3381636, -1.413475, 3.142034, 0, 0, 0, 1, 1,
0.3413278, 0.06268059, 1.685942, 1, 1, 1, 1, 1,
0.3414287, 0.01352724, 2.499329, 1, 1, 1, 1, 1,
0.3449474, 0.1681351, 1.76791, 1, 1, 1, 1, 1,
0.3527734, -0.1358907, 2.727924, 1, 1, 1, 1, 1,
0.3572202, 1.369342, 1.82564, 1, 1, 1, 1, 1,
0.3587852, -0.04740082, 2.361228, 1, 1, 1, 1, 1,
0.3596327, 0.1316745, 0.3692552, 1, 1, 1, 1, 1,
0.361921, -1.332806, 1.500154, 1, 1, 1, 1, 1,
0.3650427, 1.250166, -0.1894842, 1, 1, 1, 1, 1,
0.3652685, -0.04893881, 2.31243, 1, 1, 1, 1, 1,
0.3686472, -0.6222111, 2.409857, 1, 1, 1, 1, 1,
0.3690883, -0.6019199, 3.605759, 1, 1, 1, 1, 1,
0.3708041, -0.7875647, 3.639432, 1, 1, 1, 1, 1,
0.3736761, 1.381117, -2.032322, 1, 1, 1, 1, 1,
0.3747284, 0.2213867, 0.2999668, 1, 1, 1, 1, 1,
0.3798176, 1.519915, 0.3088767, 0, 0, 1, 1, 1,
0.3804338, -1.487745, 1.845158, 1, 0, 0, 1, 1,
0.3867293, 0.7672138, -0.06947362, 1, 0, 0, 1, 1,
0.3872188, 1.942281, -1.689468, 1, 0, 0, 1, 1,
0.3898769, -0.03527191, 3.01083, 1, 0, 0, 1, 1,
0.3903572, -0.5510878, 2.242588, 1, 0, 0, 1, 1,
0.3909646, -0.7732478, 2.711643, 0, 0, 0, 1, 1,
0.391526, 1.2451, 0.3573718, 0, 0, 0, 1, 1,
0.3958836, -0.4987638, 1.461804, 0, 0, 0, 1, 1,
0.4002871, -0.8799981, 2.793352, 0, 0, 0, 1, 1,
0.4067766, -1.266984, 5.038065, 0, 0, 0, 1, 1,
0.4085515, -0.9380457, 3.030137, 0, 0, 0, 1, 1,
0.4090291, 0.4306175, 0.6934901, 0, 0, 0, 1, 1,
0.4170773, -0.3623601, 1.332641, 1, 1, 1, 1, 1,
0.4195161, -1.171648, 3.427211, 1, 1, 1, 1, 1,
0.4227945, 0.1744162, 0.1953541, 1, 1, 1, 1, 1,
0.4279, -0.1005474, 1.900467, 1, 1, 1, 1, 1,
0.4284943, 0.05524371, 2.47984, 1, 1, 1, 1, 1,
0.431934, -0.1946159, 2.395729, 1, 1, 1, 1, 1,
0.4319908, -0.8042833, 2.323485, 1, 1, 1, 1, 1,
0.4337543, -1.196731, 1.613217, 1, 1, 1, 1, 1,
0.4430244, 0.8386856, 0.366592, 1, 1, 1, 1, 1,
0.4480012, 0.1825189, 1.618156, 1, 1, 1, 1, 1,
0.4483002, -0.8294264, 2.48033, 1, 1, 1, 1, 1,
0.450893, -1.618982, 1.706994, 1, 1, 1, 1, 1,
0.4513167, 0.2137513, 1.531739, 1, 1, 1, 1, 1,
0.4552746, 0.2251551, 0.3403945, 1, 1, 1, 1, 1,
0.4561426, -1.834592, 3.123957, 1, 1, 1, 1, 1,
0.4602812, -1.285306, 3.447428, 0, 0, 1, 1, 1,
0.4646766, -0.2829884, 1.905582, 1, 0, 0, 1, 1,
0.4676618, -2.137662, 4.064954, 1, 0, 0, 1, 1,
0.4707148, -1.195653, 1.857501, 1, 0, 0, 1, 1,
0.4712939, -0.7540359, 2.381544, 1, 0, 0, 1, 1,
0.4714743, -0.0892614, 1.420426, 1, 0, 0, 1, 1,
0.4743977, -0.7843323, 1.986304, 0, 0, 0, 1, 1,
0.4750464, -0.2568121, 3.081565, 0, 0, 0, 1, 1,
0.4788796, -0.4484996, 1.570943, 0, 0, 0, 1, 1,
0.4790209, -0.3935516, 2.469745, 0, 0, 0, 1, 1,
0.480655, 0.2310393, 1.276543, 0, 0, 0, 1, 1,
0.4853438, -0.1509222, -0.2366444, 0, 0, 0, 1, 1,
0.4874946, -0.03305702, -0.3331473, 0, 0, 0, 1, 1,
0.4879095, 0.7048025, 1.020154, 1, 1, 1, 1, 1,
0.4885044, -0.7920623, 0.551473, 1, 1, 1, 1, 1,
0.4898956, 0.9541389, 1.357645, 1, 1, 1, 1, 1,
0.491608, 0.07251111, 0.72652, 1, 1, 1, 1, 1,
0.4991752, 0.5756084, 0.4979289, 1, 1, 1, 1, 1,
0.5016816, -1.085359, 4.691394, 1, 1, 1, 1, 1,
0.5067464, 1.863855, 0.6716173, 1, 1, 1, 1, 1,
0.5110438, 0.3011552, 0.4306038, 1, 1, 1, 1, 1,
0.5119656, 0.4219595, 1.622707, 1, 1, 1, 1, 1,
0.5154656, -0.02695513, 1.951013, 1, 1, 1, 1, 1,
0.5157888, -1.205708, 3.246431, 1, 1, 1, 1, 1,
0.519106, 0.3035645, 1.326409, 1, 1, 1, 1, 1,
0.5225291, 1.24108, 0.01126769, 1, 1, 1, 1, 1,
0.5227402, -0.5403989, 2.189793, 1, 1, 1, 1, 1,
0.5293792, 0.7447094, 0.3959636, 1, 1, 1, 1, 1,
0.5313857, 0.6663014, 0.3198532, 0, 0, 1, 1, 1,
0.5317654, -1.232615, 2.865954, 1, 0, 0, 1, 1,
0.5320144, -0.3356712, 2.482804, 1, 0, 0, 1, 1,
0.5351314, -0.2431034, 2.434581, 1, 0, 0, 1, 1,
0.5353107, -0.1455481, 3.019588, 1, 0, 0, 1, 1,
0.5359483, 0.8987272, -1.048416, 1, 0, 0, 1, 1,
0.5362259, 0.1699887, 0.5447485, 0, 0, 0, 1, 1,
0.5364653, -0.6136153, 2.836245, 0, 0, 0, 1, 1,
0.5366099, 0.6730984, 1.158855, 0, 0, 0, 1, 1,
0.5415572, -1.114138, 1.80003, 0, 0, 0, 1, 1,
0.5492462, 0.1009882, 1.523818, 0, 0, 0, 1, 1,
0.5508749, -0.8301268, 2.466528, 0, 0, 0, 1, 1,
0.5523741, 1.263137, 0.5495632, 0, 0, 0, 1, 1,
0.5534238, 0.3185752, -0.05485791, 1, 1, 1, 1, 1,
0.5582594, -1.498038, 2.315775, 1, 1, 1, 1, 1,
0.5591931, -1.033476, 2.180796, 1, 1, 1, 1, 1,
0.5601108, 0.5529052, 0.6488082, 1, 1, 1, 1, 1,
0.5607947, -0.750667, 2.198788, 1, 1, 1, 1, 1,
0.5611149, 1.436234, -0.6009523, 1, 1, 1, 1, 1,
0.5629809, 0.9951608, 0.4487212, 1, 1, 1, 1, 1,
0.56462, 0.1058808, 1.707865, 1, 1, 1, 1, 1,
0.5685607, 1.135694, 1.263269, 1, 1, 1, 1, 1,
0.5693567, 1.060954, 0.9821778, 1, 1, 1, 1, 1,
0.5704325, -0.5709134, 2.707867, 1, 1, 1, 1, 1,
0.5713742, 1.442842, 0.7403409, 1, 1, 1, 1, 1,
0.5752041, -1.2582, 1.541634, 1, 1, 1, 1, 1,
0.5758334, -1.362689, 3.077381, 1, 1, 1, 1, 1,
0.5774956, -0.6455052, 2.787491, 1, 1, 1, 1, 1,
0.5775486, -0.9106818, 1.86511, 0, 0, 1, 1, 1,
0.5796951, -0.02902199, 0.8902174, 1, 0, 0, 1, 1,
0.5835192, -0.9261992, 0.7546746, 1, 0, 0, 1, 1,
0.5841675, 0.4334273, 0.3044313, 1, 0, 0, 1, 1,
0.5909259, 1.376545, -1.686949, 1, 0, 0, 1, 1,
0.5940461, -0.6068876, 1.090247, 1, 0, 0, 1, 1,
0.5946209, 0.9444781, 1.252683, 0, 0, 0, 1, 1,
0.5947106, -0.132879, 0.5487711, 0, 0, 0, 1, 1,
0.6063583, -0.3872349, 4.532595, 0, 0, 0, 1, 1,
0.606611, -0.591254, 3.486619, 0, 0, 0, 1, 1,
0.6066977, 0.7761139, 0.1952315, 0, 0, 0, 1, 1,
0.6067634, -0.1884933, 1.287853, 0, 0, 0, 1, 1,
0.6104464, 2.434946, -0.9423175, 0, 0, 0, 1, 1,
0.6119347, 0.01548036, 1.119581, 1, 1, 1, 1, 1,
0.6146064, -0.2511571, 2.19425, 1, 1, 1, 1, 1,
0.6239925, 0.3942706, 0.2611776, 1, 1, 1, 1, 1,
0.6268569, 0.6122411, 3.18886, 1, 1, 1, 1, 1,
0.6338184, -0.6632805, 0.8586624, 1, 1, 1, 1, 1,
0.6376405, -0.6845956, 1.874631, 1, 1, 1, 1, 1,
0.6388969, -0.7603609, 3.76213, 1, 1, 1, 1, 1,
0.6394251, -1.359678, 2.555127, 1, 1, 1, 1, 1,
0.6431805, -0.984294, 3.211732, 1, 1, 1, 1, 1,
0.6466988, 0.7748503, -0.8195591, 1, 1, 1, 1, 1,
0.6490403, -0.3010708, 3.000419, 1, 1, 1, 1, 1,
0.6493704, 1.331663, 0.0231147, 1, 1, 1, 1, 1,
0.64954, -0.4260027, 2.933207, 1, 1, 1, 1, 1,
0.6550008, -0.06628256, 0.1250184, 1, 1, 1, 1, 1,
0.6568929, -0.03710848, 1.333721, 1, 1, 1, 1, 1,
0.6683579, -0.5683495, 1.723672, 0, 0, 1, 1, 1,
0.6699673, -0.5898042, 3.152766, 1, 0, 0, 1, 1,
0.6712263, 1.262983, 0.153918, 1, 0, 0, 1, 1,
0.6724024, -0.4667682, 2.291202, 1, 0, 0, 1, 1,
0.6772634, -1.961554, 3.057494, 1, 0, 0, 1, 1,
0.6785535, -1.047695, 2.400785, 1, 0, 0, 1, 1,
0.6903355, 0.2800775, 1.377411, 0, 0, 0, 1, 1,
0.6907713, -1.129374, 2.312166, 0, 0, 0, 1, 1,
0.6910802, -0.8051393, 3.286149, 0, 0, 0, 1, 1,
0.6934097, -1.121955, 2.778761, 0, 0, 0, 1, 1,
0.6936175, -0.7876171, 2.356578, 0, 0, 0, 1, 1,
0.6937623, -1.378888, 2.700045, 0, 0, 0, 1, 1,
0.6972648, 1.085229, -0.1581857, 0, 0, 0, 1, 1,
0.6990645, -1.038002, 1.886557, 1, 1, 1, 1, 1,
0.6999519, 1.215252, 0.4183121, 1, 1, 1, 1, 1,
0.7013257, 1.249337, 1.040845, 1, 1, 1, 1, 1,
0.7023057, 0.2414355, 0.6871371, 1, 1, 1, 1, 1,
0.7048865, -0.29287, 2.071944, 1, 1, 1, 1, 1,
0.709587, 2.439867, -0.3317992, 1, 1, 1, 1, 1,
0.7166385, 1.100716, 0.4527474, 1, 1, 1, 1, 1,
0.7174097, -0.4675526, 2.671846, 1, 1, 1, 1, 1,
0.7176058, -1.077594, 2.241025, 1, 1, 1, 1, 1,
0.7189043, 0.335208, 1.87157, 1, 1, 1, 1, 1,
0.7226954, 0.1696293, 2.917481, 1, 1, 1, 1, 1,
0.7261887, 0.8396224, 0.931352, 1, 1, 1, 1, 1,
0.7262362, 0.6933413, 0.7653726, 1, 1, 1, 1, 1,
0.7271636, 0.5486811, 1.497524, 1, 1, 1, 1, 1,
0.7274479, 0.9051857, -0.8729789, 1, 1, 1, 1, 1,
0.7277994, -0.555034, 1.94735, 0, 0, 1, 1, 1,
0.7280404, -1.262337, 2.93292, 1, 0, 0, 1, 1,
0.7305436, -0.7198725, 1.07295, 1, 0, 0, 1, 1,
0.7325523, 0.8012303, 2.804503, 1, 0, 0, 1, 1,
0.734189, 0.09836844, 1.906949, 1, 0, 0, 1, 1,
0.7362182, 0.2968179, 1.561061, 1, 0, 0, 1, 1,
0.7373355, 0.8465882, 1.697216, 0, 0, 0, 1, 1,
0.7378496, -1.361333, 2.363054, 0, 0, 0, 1, 1,
0.7436988, -0.26691, 2.725994, 0, 0, 0, 1, 1,
0.7479574, -0.9009603, 2.948287, 0, 0, 0, 1, 1,
0.7506052, 1.290846, 2.339377, 0, 0, 0, 1, 1,
0.7529682, -0.3579534, 3.589498, 0, 0, 0, 1, 1,
0.7629258, -0.1908312, 2.271746, 0, 0, 0, 1, 1,
0.7739656, 1.60666, 2.336673, 1, 1, 1, 1, 1,
0.7779982, -2.361548, 4.667381, 1, 1, 1, 1, 1,
0.7833377, 0.1328744, 0.9765493, 1, 1, 1, 1, 1,
0.784248, -0.8008705, 3.286713, 1, 1, 1, 1, 1,
0.7868932, 1.617618, 1.292644, 1, 1, 1, 1, 1,
0.7894046, -0.132351, 1.795049, 1, 1, 1, 1, 1,
0.7898584, -1.654347, 3.456133, 1, 1, 1, 1, 1,
0.7911361, -0.9430071, 0.2433665, 1, 1, 1, 1, 1,
0.7938537, -0.6515884, 4.017881, 1, 1, 1, 1, 1,
0.7943367, -0.6521991, 3.942055, 1, 1, 1, 1, 1,
0.8006809, 2.004224, 0.05162789, 1, 1, 1, 1, 1,
0.8022448, 1.670983, 0.5940515, 1, 1, 1, 1, 1,
0.8076788, 0.06557178, 1.977178, 1, 1, 1, 1, 1,
0.8150519, -1.175494, 2.410167, 1, 1, 1, 1, 1,
0.8156722, 0.6282275, 1.469202, 1, 1, 1, 1, 1,
0.83096, -0.2327653, 1.887856, 0, 0, 1, 1, 1,
0.8344682, -1.744377, 2.02924, 1, 0, 0, 1, 1,
0.8347209, 1.278395, 0.6177195, 1, 0, 0, 1, 1,
0.8377526, 1.490335, 1.750877, 1, 0, 0, 1, 1,
0.846243, -0.3523896, 2.819114, 1, 0, 0, 1, 1,
0.8472444, 0.05519978, 1.9664, 1, 0, 0, 1, 1,
0.8537639, -1.715701, 1.68497, 0, 0, 0, 1, 1,
0.8542993, -1.122657, 3.408559, 0, 0, 0, 1, 1,
0.8552919, -0.3290738, 2.104984, 0, 0, 0, 1, 1,
0.8600947, -0.2865255, 1.116111, 0, 0, 0, 1, 1,
0.8622591, 0.03160096, 2.838135, 0, 0, 0, 1, 1,
0.862696, -1.347608, 1.769961, 0, 0, 0, 1, 1,
0.8628785, -0.2137211, 4.857207, 0, 0, 0, 1, 1,
0.8660188, 1.403921, 1.42777, 1, 1, 1, 1, 1,
0.8705692, -0.691161, 1.300073, 1, 1, 1, 1, 1,
0.8742741, -0.7308183, -0.2721635, 1, 1, 1, 1, 1,
0.8761626, 0.1147853, 2.332207, 1, 1, 1, 1, 1,
0.8805805, 1.25863, 2.72068, 1, 1, 1, 1, 1,
0.8824079, -0.5959456, 0.8082128, 1, 1, 1, 1, 1,
0.895187, 0.08772644, 1.76428, 1, 1, 1, 1, 1,
0.8956772, -0.6494199, 0.8032917, 1, 1, 1, 1, 1,
0.897201, 0.8309357, 0.7309529, 1, 1, 1, 1, 1,
0.9050209, 1.20024, 0.7027067, 1, 1, 1, 1, 1,
0.909047, -0.3557644, 1.731757, 1, 1, 1, 1, 1,
0.9134554, 1.060591, 0.8253108, 1, 1, 1, 1, 1,
0.9177859, 0.7443748, 0.5771963, 1, 1, 1, 1, 1,
0.9230596, 0.1059408, 0.8613742, 1, 1, 1, 1, 1,
0.9273511, -0.7335572, 0.9754376, 1, 1, 1, 1, 1,
0.9277469, -0.7430983, 2.715606, 0, 0, 1, 1, 1,
0.9303381, -2.943767, 3.287671, 1, 0, 0, 1, 1,
0.9303487, 0.6267545, 1.128534, 1, 0, 0, 1, 1,
0.9315009, -0.5278404, 2.153843, 1, 0, 0, 1, 1,
0.9334561, 0.7116417, -0.6466951, 1, 0, 0, 1, 1,
0.9335765, -0.5624818, 1.736941, 1, 0, 0, 1, 1,
0.9360967, 0.5079113, 1.194498, 0, 0, 0, 1, 1,
0.9370856, 0.1681226, -0.6850384, 0, 0, 0, 1, 1,
0.9372352, -1.94243, 4.628631, 0, 0, 0, 1, 1,
0.9415566, 0.8944628, 0.2449093, 0, 0, 0, 1, 1,
0.947611, 0.4980561, -0.8238416, 0, 0, 0, 1, 1,
0.9479109, -0.4010237, 2.455307, 0, 0, 0, 1, 1,
0.9484946, -1.906103, 0.09023288, 0, 0, 0, 1, 1,
0.950032, -0.9470152, 0.6620541, 1, 1, 1, 1, 1,
0.9519382, -2.004938, 3.618671, 1, 1, 1, 1, 1,
0.9687738, -0.7452214, 1.071795, 1, 1, 1, 1, 1,
0.9780139, -0.03314688, 2.883524, 1, 1, 1, 1, 1,
0.982329, -1.391481, 1.934171, 1, 1, 1, 1, 1,
0.9852686, 0.8083205, 0.9781069, 1, 1, 1, 1, 1,
0.9986389, -1.202962, 3.026439, 1, 1, 1, 1, 1,
1.006019, 0.7434788, 1.294959, 1, 1, 1, 1, 1,
1.007996, 1.019192, 1.478925, 1, 1, 1, 1, 1,
1.016029, 0.4904831, 3.626432, 1, 1, 1, 1, 1,
1.022249, -1.411245, 2.325227, 1, 1, 1, 1, 1,
1.026371, 1.360905, 1.079419, 1, 1, 1, 1, 1,
1.032556, 0.9234101, 1.025471, 1, 1, 1, 1, 1,
1.033027, -1.136556, 0.8210378, 1, 1, 1, 1, 1,
1.037187, 0.8232245, 0.3258111, 1, 1, 1, 1, 1,
1.039089, 0.5211809, -0.7896912, 0, 0, 1, 1, 1,
1.040687, -0.1808133, 0.701678, 1, 0, 0, 1, 1,
1.049624, 2.764069, 1.170851, 1, 0, 0, 1, 1,
1.050284, 2.288817, 1.356316, 1, 0, 0, 1, 1,
1.05714, 0.5768836, 1.448666, 1, 0, 0, 1, 1,
1.061234, -0.5017232, 1.753792, 1, 0, 0, 1, 1,
1.06183, 0.8499207, 0.7793185, 0, 0, 0, 1, 1,
1.063386, -0.7019151, 3.728028, 0, 0, 0, 1, 1,
1.065853, -0.1981862, 2.946354, 0, 0, 0, 1, 1,
1.073072, -0.212613, 2.355425, 0, 0, 0, 1, 1,
1.074444, -0.9209117, 2.073923, 0, 0, 0, 1, 1,
1.075849, -0.8190308, 2.020396, 0, 0, 0, 1, 1,
1.078398, -0.8919255, 2.833382, 0, 0, 0, 1, 1,
1.080807, -0.8501737, 2.633139, 1, 1, 1, 1, 1,
1.081912, 1.523642, 1.084151, 1, 1, 1, 1, 1,
1.094086, 0.5931799, 1.968247, 1, 1, 1, 1, 1,
1.100399, -0.1125864, 2.472209, 1, 1, 1, 1, 1,
1.102578, 1.490293, 2.281486, 1, 1, 1, 1, 1,
1.107605, -0.09914733, 1.441093, 1, 1, 1, 1, 1,
1.109379, 0.4075149, 2.263856, 1, 1, 1, 1, 1,
1.115497, 0.0704677, 0.9004638, 1, 1, 1, 1, 1,
1.116509, -0.1466686, 0.5549181, 1, 1, 1, 1, 1,
1.139123, -1.00335, 0.2007871, 1, 1, 1, 1, 1,
1.144714, -0.1132947, 3.496655, 1, 1, 1, 1, 1,
1.146024, -0.3640526, 1.44531, 1, 1, 1, 1, 1,
1.158047, 1.245381, 1.369801, 1, 1, 1, 1, 1,
1.160829, -0.6227407, 3.9698, 1, 1, 1, 1, 1,
1.166145, -1.345407, 1.163883, 1, 1, 1, 1, 1,
1.17194, -0.2663807, 1.086015, 0, 0, 1, 1, 1,
1.175398, -0.1986531, 0.7097456, 1, 0, 0, 1, 1,
1.196204, -0.4630696, 2.857388, 1, 0, 0, 1, 1,
1.199097, -1.342926, 2.835214, 1, 0, 0, 1, 1,
1.202688, -1.047053, 3.534439, 1, 0, 0, 1, 1,
1.203455, -0.06567678, 1.540946, 1, 0, 0, 1, 1,
1.228577, -1.415722, 3.846723, 0, 0, 0, 1, 1,
1.234574, 0.4089569, 2.787495, 0, 0, 0, 1, 1,
1.237684, -0.1050723, 2.604236, 0, 0, 0, 1, 1,
1.2608, 0.5286247, 1.589713, 0, 0, 0, 1, 1,
1.263209, -0.4438421, 1.000286, 0, 0, 0, 1, 1,
1.263391, -1.01579, 0.9904332, 0, 0, 0, 1, 1,
1.266954, -0.737237, 1.694567, 0, 0, 0, 1, 1,
1.266985, 0.1664866, 1.832043, 1, 1, 1, 1, 1,
1.267023, 0.05298727, 3.144477, 1, 1, 1, 1, 1,
1.267164, 1.270315, -0.3502619, 1, 1, 1, 1, 1,
1.277595, 0.5415805, 2.100553, 1, 1, 1, 1, 1,
1.280813, 0.04164362, 1.356097, 1, 1, 1, 1, 1,
1.293179, 0.3637566, 0.2804495, 1, 1, 1, 1, 1,
1.300372, 0.5202042, 1.547806, 1, 1, 1, 1, 1,
1.301843, -1.723157, 2.970967, 1, 1, 1, 1, 1,
1.308467, 1.382993, -0.9298812, 1, 1, 1, 1, 1,
1.320863, 1.084629, -0.2702005, 1, 1, 1, 1, 1,
1.330515, -1.10049, 2.138179, 1, 1, 1, 1, 1,
1.334831, 0.3181074, 2.246938, 1, 1, 1, 1, 1,
1.337411, -0.8750024, 2.425642, 1, 1, 1, 1, 1,
1.344556, -1.077844, 2.995012, 1, 1, 1, 1, 1,
1.362486, 1.483495, -0.3050524, 1, 1, 1, 1, 1,
1.377821, 1.157751, 0.7850602, 0, 0, 1, 1, 1,
1.38572, -0.2674269, 2.406305, 1, 0, 0, 1, 1,
1.398665, 0.8330174, -0.4226978, 1, 0, 0, 1, 1,
1.403248, -1.920533, 2.107769, 1, 0, 0, 1, 1,
1.404581, -0.3272018, 2.647825, 1, 0, 0, 1, 1,
1.405529, -1.669238, 2.200553, 1, 0, 0, 1, 1,
1.412986, 0.5114393, 1.53753, 0, 0, 0, 1, 1,
1.416795, 0.1024476, 2.116052, 0, 0, 0, 1, 1,
1.429185, 1.860319, -0.8666859, 0, 0, 0, 1, 1,
1.453345, 0.02929562, 2.656475, 0, 0, 0, 1, 1,
1.454508, 0.6493008, 0.3052882, 0, 0, 0, 1, 1,
1.455174, -1.129764, 3.995541, 0, 0, 0, 1, 1,
1.46818, 0.7006018, -0.7136984, 0, 0, 0, 1, 1,
1.469889, -0.5585623, 3.051464, 1, 1, 1, 1, 1,
1.470347, -0.4476744, 1.572472, 1, 1, 1, 1, 1,
1.475489, -0.3296658, 0.8220141, 1, 1, 1, 1, 1,
1.503389, 0.3826019, 1.594646, 1, 1, 1, 1, 1,
1.514129, -0.5218636, 1.926557, 1, 1, 1, 1, 1,
1.523545, -0.4832859, 2.701162, 1, 1, 1, 1, 1,
1.525104, -0.638912, 1.346433, 1, 1, 1, 1, 1,
1.532766, -0.2424512, 0.08985952, 1, 1, 1, 1, 1,
1.537319, 2.086057, 2.147755, 1, 1, 1, 1, 1,
1.557444, -0.1331883, 0.6583318, 1, 1, 1, 1, 1,
1.561119, -0.6897466, 2.816439, 1, 1, 1, 1, 1,
1.564146, -0.4170465, 1.377598, 1, 1, 1, 1, 1,
1.587018, -1.125772, 1.647782, 1, 1, 1, 1, 1,
1.602625, -0.4152161, -0.4404787, 1, 1, 1, 1, 1,
1.604763, -0.2609067, 3.347811, 1, 1, 1, 1, 1,
1.616646, -0.7398509, 1.165305, 0, 0, 1, 1, 1,
1.629615, -0.4888236, 2.513535, 1, 0, 0, 1, 1,
1.640001, -1.109545, 3.166553, 1, 0, 0, 1, 1,
1.676273, 1.472176, 0.4490523, 1, 0, 0, 1, 1,
1.678247, -1.311251, 2.961996, 1, 0, 0, 1, 1,
1.717278, -1.239396, 2.713707, 1, 0, 0, 1, 1,
1.728528, -0.4124877, 1.913993, 0, 0, 0, 1, 1,
1.728619, -1.215472, 0.1422034, 0, 0, 0, 1, 1,
1.729169, 0.329249, 0.4593139, 0, 0, 0, 1, 1,
1.738641, 1.079235, -0.08441661, 0, 0, 0, 1, 1,
1.756167, 0.7531666, 1.850875, 0, 0, 0, 1, 1,
1.765116, -0.1882133, 2.159401, 0, 0, 0, 1, 1,
1.793813, -0.3927075, 1.354281, 0, 0, 0, 1, 1,
1.793821, 0.7315381, 0.8915125, 1, 1, 1, 1, 1,
1.814827, 0.2918199, 3.2835, 1, 1, 1, 1, 1,
1.821296, -0.2013735, 3.794857, 1, 1, 1, 1, 1,
1.845759, 0.7327579, -0.2885768, 1, 1, 1, 1, 1,
1.850484, -2.227106, 4.318271, 1, 1, 1, 1, 1,
1.851937, -0.1880969, 0.1617589, 1, 1, 1, 1, 1,
1.868487, 2.286866, -0.4512264, 1, 1, 1, 1, 1,
1.89094, -0.8908156, 1.667261, 1, 1, 1, 1, 1,
1.895399, -0.3448109, 3.313714, 1, 1, 1, 1, 1,
1.900534, -0.6501573, 3.390047, 1, 1, 1, 1, 1,
1.916941, 1.192373, 0.4210474, 1, 1, 1, 1, 1,
1.940566, 1.381073, 0.292155, 1, 1, 1, 1, 1,
1.95692, -0.1861147, 2.766248, 1, 1, 1, 1, 1,
1.987152, -1.366037, 2.420758, 1, 1, 1, 1, 1,
1.990726, 0.8982714, 0.7767733, 1, 1, 1, 1, 1,
1.993262, -1.016804, 2.184036, 0, 0, 1, 1, 1,
2.011002, 1.490881, 0.752903, 1, 0, 0, 1, 1,
2.101149, 0.5813538, 1.271864, 1, 0, 0, 1, 1,
2.11938, -0.3778356, 2.995796, 1, 0, 0, 1, 1,
2.198362, -0.4589987, 1.213961, 1, 0, 0, 1, 1,
2.238463, -0.3654147, 1.459329, 1, 0, 0, 1, 1,
2.244668, 1.580243, 0.3946995, 0, 0, 0, 1, 1,
2.314426, 0.002923538, 1.047678, 0, 0, 0, 1, 1,
2.331106, -0.4424216, 1.947117, 0, 0, 0, 1, 1,
2.366908, -0.002592582, 0.8273153, 0, 0, 0, 1, 1,
2.369763, -2.609729, 2.966869, 0, 0, 0, 1, 1,
2.442261, -0.1070363, 0.60087, 0, 0, 0, 1, 1,
2.482656, 0.9816328, 0.07475459, 0, 0, 0, 1, 1,
2.515394, -0.9012781, 0.4347096, 1, 1, 1, 1, 1,
2.59896, 0.203873, 2.31881, 1, 1, 1, 1, 1,
2.603535, 0.5834968, 2.426349, 1, 1, 1, 1, 1,
2.621597, -0.08168118, 0.9938596, 1, 1, 1, 1, 1,
2.630528, -2.108052, 3.519589, 1, 1, 1, 1, 1,
2.6851, 1.737445, 1.714339, 1, 1, 1, 1, 1,
3.180663, 0.07571717, 2.520643, 1, 1, 1, 1, 1
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
var radius = 9.283444;
var distance = 32.6077;
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
mvMatrix.translate( 0.1439135, 0.04011869, -0.2230556 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6077);
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
