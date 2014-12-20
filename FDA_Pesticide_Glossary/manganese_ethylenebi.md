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
-2.84685, -0.4782066, -1.484818, 1, 0, 0, 1,
-2.648576, -0.09440476, -2.200159, 1, 0.007843138, 0, 1,
-2.600814, -0.7819496, -1.21414, 1, 0.01176471, 0, 1,
-2.555869, -0.3417792, -2.819235, 1, 0.01960784, 0, 1,
-2.546967, -0.4099069, -1.477063, 1, 0.02352941, 0, 1,
-2.487869, 1.12855, -2.498353, 1, 0.03137255, 0, 1,
-2.441996, 0.3282147, -0.1360279, 1, 0.03529412, 0, 1,
-2.430888, 0.3411416, -3.113138, 1, 0.04313726, 0, 1,
-2.385224, -0.3828624, -0.9545432, 1, 0.04705882, 0, 1,
-2.368664, 0.3254323, -1.089737, 1, 0.05490196, 0, 1,
-2.322769, -0.5039428, -1.008531, 1, 0.05882353, 0, 1,
-2.30429, 0.7607288, -1.499907, 1, 0.06666667, 0, 1,
-2.279386, -0.9280343, -0.6397817, 1, 0.07058824, 0, 1,
-2.266195, 0.3786717, -1.832218, 1, 0.07843138, 0, 1,
-2.23033, -1.047253, -2.974424, 1, 0.08235294, 0, 1,
-2.215356, -0.1456068, -1.728231, 1, 0.09019608, 0, 1,
-2.204583, 0.02565059, -3.375241, 1, 0.09411765, 0, 1,
-2.202389, 0.03096941, -2.809895, 1, 0.1019608, 0, 1,
-2.197377, -0.263321, -1.721429, 1, 0.1098039, 0, 1,
-2.157057, -0.6575866, -2.082202, 1, 0.1137255, 0, 1,
-2.150337, 0.5975976, -2.907319, 1, 0.1215686, 0, 1,
-2.147429, 0.194401, -0.9363527, 1, 0.1254902, 0, 1,
-2.139884, -0.1507632, -0.6864414, 1, 0.1333333, 0, 1,
-2.06911, 1.033168, -2.152305, 1, 0.1372549, 0, 1,
-2.055977, 0.8500299, -0.2392509, 1, 0.145098, 0, 1,
-2.034119, 0.9602299, -0.2665207, 1, 0.1490196, 0, 1,
-2.014949, 1.016153, -2.784142, 1, 0.1568628, 0, 1,
-2.014608, 1.163499, -2.390897, 1, 0.1607843, 0, 1,
-2.010394, 1.906853, -2.297246, 1, 0.1686275, 0, 1,
-1.983928, -0.4147588, -0.1259281, 1, 0.172549, 0, 1,
-1.932932, 1.298361, -0.8035766, 1, 0.1803922, 0, 1,
-1.932342, -1.90803, -1.829654, 1, 0.1843137, 0, 1,
-1.926024, -0.0455003, -1.087341, 1, 0.1921569, 0, 1,
-1.913853, -0.6810484, -4.241013, 1, 0.1960784, 0, 1,
-1.901729, 1.354325, -1.5192, 1, 0.2039216, 0, 1,
-1.860546, -0.8548743, -1.829714, 1, 0.2117647, 0, 1,
-1.840242, -1.668731, -2.011515, 1, 0.2156863, 0, 1,
-1.831802, -0.07446203, -2.067599, 1, 0.2235294, 0, 1,
-1.818075, 0.7069016, -0.3981207, 1, 0.227451, 0, 1,
-1.802245, 0.01073779, -1.852128, 1, 0.2352941, 0, 1,
-1.776639, 1.694273, -0.3664857, 1, 0.2392157, 0, 1,
-1.766027, -1.20369, -2.909181, 1, 0.2470588, 0, 1,
-1.761126, -1.110383, -2.419652, 1, 0.2509804, 0, 1,
-1.756111, 0.7210745, -0.9382195, 1, 0.2588235, 0, 1,
-1.742352, 0.3756478, -4.337985, 1, 0.2627451, 0, 1,
-1.727407, -1.148771, -2.890097, 1, 0.2705882, 0, 1,
-1.722485, -1.469308, -2.748304, 1, 0.2745098, 0, 1,
-1.716212, -0.5243509, -2.099698, 1, 0.282353, 0, 1,
-1.714178, -0.3056284, -2.465548, 1, 0.2862745, 0, 1,
-1.697681, -1.325252, -2.111326, 1, 0.2941177, 0, 1,
-1.69282, -2.293974, -2.719479, 1, 0.3019608, 0, 1,
-1.662572, -0.1930245, -1.143468, 1, 0.3058824, 0, 1,
-1.649546, 1.334602, -0.05280781, 1, 0.3137255, 0, 1,
-1.642718, -2.358503, -1.476787, 1, 0.3176471, 0, 1,
-1.622266, -0.159009, -1.574769, 1, 0.3254902, 0, 1,
-1.618101, 0.509192, -2.380139, 1, 0.3294118, 0, 1,
-1.594492, 2.226497, -0.3368481, 1, 0.3372549, 0, 1,
-1.593582, -1.136307, -2.187402, 1, 0.3411765, 0, 1,
-1.588898, -0.2755345, -3.294881, 1, 0.3490196, 0, 1,
-1.557961, 0.7531387, -1.264368, 1, 0.3529412, 0, 1,
-1.554285, -0.1697167, -2.527439, 1, 0.3607843, 0, 1,
-1.539304, 0.9366044, -2.947162, 1, 0.3647059, 0, 1,
-1.529513, 0.6352211, -2.356425, 1, 0.372549, 0, 1,
-1.517381, 1.371474, -0.8684272, 1, 0.3764706, 0, 1,
-1.513058, -1.939941, -2.001584, 1, 0.3843137, 0, 1,
-1.498922, 0.2173356, -1.906992, 1, 0.3882353, 0, 1,
-1.496716, -0.3481069, -1.004631, 1, 0.3960784, 0, 1,
-1.481373, -0.3330516, -2.01188, 1, 0.4039216, 0, 1,
-1.477768, 0.1667781, -2.501612, 1, 0.4078431, 0, 1,
-1.474804, 3.045465, 0.5200841, 1, 0.4156863, 0, 1,
-1.473228, 0.01289408, -1.803694, 1, 0.4196078, 0, 1,
-1.472265, -0.7007851, -1.544649, 1, 0.427451, 0, 1,
-1.463579, -1.309234, -4.043401, 1, 0.4313726, 0, 1,
-1.462326, -0.4781539, -2.554344, 1, 0.4392157, 0, 1,
-1.456309, 0.6193826, -0.7091684, 1, 0.4431373, 0, 1,
-1.438781, -0.03479449, -0.8817247, 1, 0.4509804, 0, 1,
-1.437761, 2.71781, 0.4586466, 1, 0.454902, 0, 1,
-1.434989, -0.8520227, -1.281399, 1, 0.4627451, 0, 1,
-1.42487, -1.049997, -1.336141, 1, 0.4666667, 0, 1,
-1.406452, 0.2106647, -0.7415545, 1, 0.4745098, 0, 1,
-1.402553, -0.9660634, -2.550413, 1, 0.4784314, 0, 1,
-1.401371, 0.8311082, -2.212454, 1, 0.4862745, 0, 1,
-1.393823, 1.047773, 1.129582, 1, 0.4901961, 0, 1,
-1.392154, -0.4424003, -3.286678, 1, 0.4980392, 0, 1,
-1.387528, 0.5151405, -2.686435, 1, 0.5058824, 0, 1,
-1.374808, 0.5213313, -2.660119, 1, 0.509804, 0, 1,
-1.373386, 0.6443167, -1.779005, 1, 0.5176471, 0, 1,
-1.366532, 0.2847463, -1.592725, 1, 0.5215687, 0, 1,
-1.358865, 0.3173293, -1.802811, 1, 0.5294118, 0, 1,
-1.354445, -1.02594, -2.686718, 1, 0.5333334, 0, 1,
-1.352917, -0.7465344, -1.42516, 1, 0.5411765, 0, 1,
-1.350655, -0.3025716, -2.455096, 1, 0.5450981, 0, 1,
-1.345575, -0.448499, -3.269279, 1, 0.5529412, 0, 1,
-1.343424, -0.3027152, -2.053536, 1, 0.5568628, 0, 1,
-1.336687, 1.838449, 0.4303609, 1, 0.5647059, 0, 1,
-1.327119, 0.378303, -1.632889, 1, 0.5686275, 0, 1,
-1.321331, -0.3779572, -2.420616, 1, 0.5764706, 0, 1,
-1.320278, 1.076093, -1.946843, 1, 0.5803922, 0, 1,
-1.319807, 0.821753, -0.3280042, 1, 0.5882353, 0, 1,
-1.318811, 2.116676, -1.112958, 1, 0.5921569, 0, 1,
-1.318596, 0.6376351, -0.6214187, 1, 0.6, 0, 1,
-1.318197, -0.0036961, -2.817102, 1, 0.6078432, 0, 1,
-1.317263, 0.4114722, -3.054171, 1, 0.6117647, 0, 1,
-1.315777, 0.6676592, -1.975279, 1, 0.6196079, 0, 1,
-1.312828, -0.00685554, -0.5797787, 1, 0.6235294, 0, 1,
-1.30359, 1.13303, -1.482006, 1, 0.6313726, 0, 1,
-1.300909, 0.2168935, -2.468478, 1, 0.6352941, 0, 1,
-1.292465, 0.974933, -1.223921, 1, 0.6431373, 0, 1,
-1.28494, -1.842528, -2.141689, 1, 0.6470588, 0, 1,
-1.275519, 0.1131472, -1.945856, 1, 0.654902, 0, 1,
-1.262384, -0.8086885, -3.078477, 1, 0.6588235, 0, 1,
-1.25553, 0.7361728, -0.4025735, 1, 0.6666667, 0, 1,
-1.250306, -0.1490836, -2.496194, 1, 0.6705883, 0, 1,
-1.249728, 0.223828, -2.410712, 1, 0.6784314, 0, 1,
-1.232918, 0.1276711, -0.8422129, 1, 0.682353, 0, 1,
-1.232232, 1.107429, -0.2956486, 1, 0.6901961, 0, 1,
-1.224039, -1.620512, -3.467554, 1, 0.6941177, 0, 1,
-1.221411, 0.9694199, -1.784493, 1, 0.7019608, 0, 1,
-1.212151, 0.4534212, -2.065261, 1, 0.7098039, 0, 1,
-1.204939, 1.299068, 0.1412406, 1, 0.7137255, 0, 1,
-1.204749, -1.066249, -1.868801, 1, 0.7215686, 0, 1,
-1.191416, 0.4374441, -1.26703, 1, 0.7254902, 0, 1,
-1.184158, -0.4346441, -3.082317, 1, 0.7333333, 0, 1,
-1.183015, -1.000926, -3.167224, 1, 0.7372549, 0, 1,
-1.182888, 0.3206895, -1.120315, 1, 0.7450981, 0, 1,
-1.174619, -0.307267, -3.507441, 1, 0.7490196, 0, 1,
-1.170732, 0.5124494, -2.079283, 1, 0.7568628, 0, 1,
-1.167382, -0.7968856, -3.299598, 1, 0.7607843, 0, 1,
-1.16451, -0.3205529, -0.1111295, 1, 0.7686275, 0, 1,
-1.144502, 0.835479, -1.341212, 1, 0.772549, 0, 1,
-1.133968, -0.2148403, -2.756961, 1, 0.7803922, 0, 1,
-1.129695, -0.1947891, -1.808254, 1, 0.7843137, 0, 1,
-1.129076, 0.7564871, 0.1722245, 1, 0.7921569, 0, 1,
-1.12403, 1.422828, -2.300039, 1, 0.7960784, 0, 1,
-1.123258, -0.440059, -2.327905, 1, 0.8039216, 0, 1,
-1.122348, -0.3260587, -3.189579, 1, 0.8117647, 0, 1,
-1.119997, -0.009259203, -2.002445, 1, 0.8156863, 0, 1,
-1.119959, -0.889309, -2.287085, 1, 0.8235294, 0, 1,
-1.113839, 1.24102, -1.092612, 1, 0.827451, 0, 1,
-1.103086, 0.01636999, -0.9675679, 1, 0.8352941, 0, 1,
-1.09544, -0.5073503, -2.617297, 1, 0.8392157, 0, 1,
-1.074808, -0.4814987, -1.332047, 1, 0.8470588, 0, 1,
-1.065644, 1.464884, 2.491277, 1, 0.8509804, 0, 1,
-1.06533, 0.3807324, -1.668631, 1, 0.8588235, 0, 1,
-1.056752, 0.6610406, -0.3919291, 1, 0.8627451, 0, 1,
-1.055645, -1.215667, -4.931877, 1, 0.8705882, 0, 1,
-1.052269, -1.134308, -0.1108706, 1, 0.8745098, 0, 1,
-1.042426, -1.748772, -1.225732, 1, 0.8823529, 0, 1,
-1.034206, 1.378239, -0.2521923, 1, 0.8862745, 0, 1,
-1.030997, 0.0209001, -1.494429, 1, 0.8941177, 0, 1,
-1.029771, -1.213874, -1.878628, 1, 0.8980392, 0, 1,
-1.01858, 2.012961, -1.406477, 1, 0.9058824, 0, 1,
-1.017866, -0.6590578, -3.489858, 1, 0.9137255, 0, 1,
-1.016966, 0.3425113, -1.242159, 1, 0.9176471, 0, 1,
-1.012048, 0.1964047, 0.06344483, 1, 0.9254902, 0, 1,
-1.010008, -0.2107602, -0.7795688, 1, 0.9294118, 0, 1,
-1.007642, -0.401787, -1.744749, 1, 0.9372549, 0, 1,
-1.006316, -0.06487258, -1.613768, 1, 0.9411765, 0, 1,
-1.005598, -1.447512, -1.56688, 1, 0.9490196, 0, 1,
-1.003344, 0.4842576, -1.087377, 1, 0.9529412, 0, 1,
-1.00253, -1.570187, -3.788872, 1, 0.9607843, 0, 1,
-1.001562, 0.336918, -0.04168943, 1, 0.9647059, 0, 1,
-0.9984511, 1.814783, -0.5041576, 1, 0.972549, 0, 1,
-0.9911705, -2.369133, -1.344055, 1, 0.9764706, 0, 1,
-0.9827406, 0.2915344, -1.031493, 1, 0.9843137, 0, 1,
-0.9719935, -0.03829192, -3.167169, 1, 0.9882353, 0, 1,
-0.971936, 1.635176, -0.5622957, 1, 0.9960784, 0, 1,
-0.9643433, -1.27877, -3.24753, 0.9960784, 1, 0, 1,
-0.9532786, -0.3757518, -1.67995, 0.9921569, 1, 0, 1,
-0.9514309, -1.138369, -1.855343, 0.9843137, 1, 0, 1,
-0.9452409, 2.878536, 0.09071726, 0.9803922, 1, 0, 1,
-0.9405893, 1.827664, 0.2147371, 0.972549, 1, 0, 1,
-0.9398064, 1.314687, 0.5827038, 0.9686275, 1, 0, 1,
-0.9282961, -0.3001297, -1.517602, 0.9607843, 1, 0, 1,
-0.9270979, -0.8990176, -1.588108, 0.9568627, 1, 0, 1,
-0.9264997, 1.210654, 1.089091, 0.9490196, 1, 0, 1,
-0.9198976, 0.7719727, 0.05402816, 0.945098, 1, 0, 1,
-0.9197943, 1.08399, -1.185334, 0.9372549, 1, 0, 1,
-0.9191942, 0.4820666, 1.704956, 0.9333333, 1, 0, 1,
-0.9168281, -0.6661369, -2.883473, 0.9254902, 1, 0, 1,
-0.9115666, 1.82916, -1.61738, 0.9215686, 1, 0, 1,
-0.909433, -1.078614, -2.272991, 0.9137255, 1, 0, 1,
-0.9076915, -1.237557, -2.033704, 0.9098039, 1, 0, 1,
-0.9029654, 0.2783791, -2.662464, 0.9019608, 1, 0, 1,
-0.8992614, 1.773408, -0.5818636, 0.8941177, 1, 0, 1,
-0.884352, 0.9091619, 0.2790096, 0.8901961, 1, 0, 1,
-0.8815219, -0.7856189, -3.525713, 0.8823529, 1, 0, 1,
-0.8804033, -0.844757, -2.057104, 0.8784314, 1, 0, 1,
-0.8792964, 0.2119289, -0.9988127, 0.8705882, 1, 0, 1,
-0.8792537, 0.5026699, -2.131559, 0.8666667, 1, 0, 1,
-0.8779225, -0.4701339, -1.238415, 0.8588235, 1, 0, 1,
-0.8768319, -0.6349597, -2.336877, 0.854902, 1, 0, 1,
-0.8753172, 0.1954277, -1.018362, 0.8470588, 1, 0, 1,
-0.87271, -0.8042593, -2.370047, 0.8431373, 1, 0, 1,
-0.8706207, -0.6717204, -0.9507045, 0.8352941, 1, 0, 1,
-0.8668181, -0.5171719, -0.7859408, 0.8313726, 1, 0, 1,
-0.8662692, 1.05136, -1.068152, 0.8235294, 1, 0, 1,
-0.8624832, -2.176622, -1.10555, 0.8196079, 1, 0, 1,
-0.8606976, 1.950559, 0.9422728, 0.8117647, 1, 0, 1,
-0.8520628, -0.9763674, -2.938857, 0.8078431, 1, 0, 1,
-0.8497794, -0.2960337, -0.4917426, 0.8, 1, 0, 1,
-0.8474747, -0.861405, -2.36596, 0.7921569, 1, 0, 1,
-0.8393486, 1.125466, 0.3246846, 0.7882353, 1, 0, 1,
-0.8392843, 2.611481, -1.123157, 0.7803922, 1, 0, 1,
-0.8204345, 1.848843, -0.7348748, 0.7764706, 1, 0, 1,
-0.8171493, 1.648497, -0.1602145, 0.7686275, 1, 0, 1,
-0.8137823, 0.544511, -1.488148, 0.7647059, 1, 0, 1,
-0.8133526, 1.163228, -0.1674242, 0.7568628, 1, 0, 1,
-0.8125948, 0.3264529, -0.4058352, 0.7529412, 1, 0, 1,
-0.8125038, -0.3839348, -1.645429, 0.7450981, 1, 0, 1,
-0.8108885, -1.375534, -3.666977, 0.7411765, 1, 0, 1,
-0.8083609, -0.7068976, -1.839586, 0.7333333, 1, 0, 1,
-0.8049436, 1.550719, -0.3888724, 0.7294118, 1, 0, 1,
-0.7983372, 0.863005, -0.2070516, 0.7215686, 1, 0, 1,
-0.7956332, 0.1967491, -1.628972, 0.7176471, 1, 0, 1,
-0.7955933, -0.9658754, -3.03687, 0.7098039, 1, 0, 1,
-0.7954463, -0.3105742, -1.196935, 0.7058824, 1, 0, 1,
-0.7945499, 0.6777105, -2.320607, 0.6980392, 1, 0, 1,
-0.7907805, -1.006079, -2.546062, 0.6901961, 1, 0, 1,
-0.7896075, 1.012123, -1.228013, 0.6862745, 1, 0, 1,
-0.7882732, -0.3869874, -3.276668, 0.6784314, 1, 0, 1,
-0.7877341, -0.6090391, -2.870331, 0.6745098, 1, 0, 1,
-0.7828341, 0.8149205, -3.311168, 0.6666667, 1, 0, 1,
-0.779215, 0.9288348, -1.494627, 0.6627451, 1, 0, 1,
-0.7761582, -0.7481141, -3.433499, 0.654902, 1, 0, 1,
-0.7734056, -0.5652983, -2.238858, 0.6509804, 1, 0, 1,
-0.7677704, 0.3149558, 0.478108, 0.6431373, 1, 0, 1,
-0.7671376, -1.001834, -3.06019, 0.6392157, 1, 0, 1,
-0.763368, 0.006871635, -2.054574, 0.6313726, 1, 0, 1,
-0.7615713, 0.0638497, 0.05911022, 0.627451, 1, 0, 1,
-0.7583415, 0.3575202, -1.603887, 0.6196079, 1, 0, 1,
-0.7542296, -0.7102384, -1.278742, 0.6156863, 1, 0, 1,
-0.7535431, -1.005846, -2.284792, 0.6078432, 1, 0, 1,
-0.751923, -0.8618719, -2.295459, 0.6039216, 1, 0, 1,
-0.7516837, -0.2926085, -1.049181, 0.5960785, 1, 0, 1,
-0.7450877, -0.303539, -1.649511, 0.5882353, 1, 0, 1,
-0.74494, -0.9673868, -1.7206, 0.5843138, 1, 0, 1,
-0.7418396, -0.9897141, -1.622007, 0.5764706, 1, 0, 1,
-0.7414023, -1.770521, -1.504329, 0.572549, 1, 0, 1,
-0.7315896, -0.1679135, -1.715927, 0.5647059, 1, 0, 1,
-0.7300601, 1.153042, -0.6438656, 0.5607843, 1, 0, 1,
-0.7247409, -0.8299304, -2.043486, 0.5529412, 1, 0, 1,
-0.7230026, 1.087839, -0.272763, 0.5490196, 1, 0, 1,
-0.7224681, 1.015824, 0.4941024, 0.5411765, 1, 0, 1,
-0.7149949, 0.2606388, 0.451103, 0.5372549, 1, 0, 1,
-0.7054214, 0.1413269, -0.8187624, 0.5294118, 1, 0, 1,
-0.7028939, -0.09669377, -1.124422, 0.5254902, 1, 0, 1,
-0.7013019, -0.07575451, 0.03816906, 0.5176471, 1, 0, 1,
-0.6988199, 0.07103556, -0.08517853, 0.5137255, 1, 0, 1,
-0.6972874, 1.815586, 1.455545, 0.5058824, 1, 0, 1,
-0.6965464, 0.6743154, -0.4544886, 0.5019608, 1, 0, 1,
-0.6954529, 1.339012, 1.800173, 0.4941176, 1, 0, 1,
-0.6908116, 3.028447, -1.502104, 0.4862745, 1, 0, 1,
-0.6866229, 0.748913, -0.4007067, 0.4823529, 1, 0, 1,
-0.6782717, 1.44081, 0.9438622, 0.4745098, 1, 0, 1,
-0.6654515, 0.9033535, -1.859094, 0.4705882, 1, 0, 1,
-0.6640058, 0.6239862, -0.2592619, 0.4627451, 1, 0, 1,
-0.6624177, -1.829566, -4.18664, 0.4588235, 1, 0, 1,
-0.6623964, 1.244401, 1.040591, 0.4509804, 1, 0, 1,
-0.6563265, -1.510442, -2.615581, 0.4470588, 1, 0, 1,
-0.6561128, 1.403706, 0.07967223, 0.4392157, 1, 0, 1,
-0.6523362, 1.301392, -0.6340644, 0.4352941, 1, 0, 1,
-0.6498185, 0.3127239, -2.199591, 0.427451, 1, 0, 1,
-0.6441648, 0.5204684, -3.614026, 0.4235294, 1, 0, 1,
-0.6354776, 0.1690485, -1.903147, 0.4156863, 1, 0, 1,
-0.6329896, -0.07249858, -0.4477814, 0.4117647, 1, 0, 1,
-0.6270673, 2.752726, 0.3568178, 0.4039216, 1, 0, 1,
-0.6228573, -0.2327766, -3.007034, 0.3960784, 1, 0, 1,
-0.6198434, -1.08163, -2.907073, 0.3921569, 1, 0, 1,
-0.6163267, -0.02815452, -1.628898, 0.3843137, 1, 0, 1,
-0.6122364, 0.5412414, -0.1426633, 0.3803922, 1, 0, 1,
-0.6083163, 0.8508527, -3.21378, 0.372549, 1, 0, 1,
-0.5997791, 0.02348416, -1.498235, 0.3686275, 1, 0, 1,
-0.5982234, 0.6757857, -0.1887494, 0.3607843, 1, 0, 1,
-0.5938709, 0.1489378, -0.8775452, 0.3568628, 1, 0, 1,
-0.5920023, -0.4645072, -2.841903, 0.3490196, 1, 0, 1,
-0.5853097, -0.6324112, -2.784189, 0.345098, 1, 0, 1,
-0.5808534, 0.2832514, -2.225482, 0.3372549, 1, 0, 1,
-0.578209, -0.1933636, -1.189127, 0.3333333, 1, 0, 1,
-0.5738996, -1.102594, -2.324193, 0.3254902, 1, 0, 1,
-0.5737637, -0.03188699, 0.1671029, 0.3215686, 1, 0, 1,
-0.5699492, -0.4300019, -2.432984, 0.3137255, 1, 0, 1,
-0.5668972, 1.30754, -0.6078377, 0.3098039, 1, 0, 1,
-0.5619497, 1.50806, -0.4919779, 0.3019608, 1, 0, 1,
-0.5595179, -1.345335, -1.949941, 0.2941177, 1, 0, 1,
-0.5575593, 1.708355, -0.1767492, 0.2901961, 1, 0, 1,
-0.5547692, 0.6474715, -1.367978, 0.282353, 1, 0, 1,
-0.5544029, -0.1025928, -3.09211, 0.2784314, 1, 0, 1,
-0.5540939, 0.2527649, 0.1768171, 0.2705882, 1, 0, 1,
-0.553286, -0.2687861, -3.191266, 0.2666667, 1, 0, 1,
-0.5516204, -1.117084, -0.8399825, 0.2588235, 1, 0, 1,
-0.5370442, -1.003482, -3.290132, 0.254902, 1, 0, 1,
-0.5348379, -2.392077, -2.702914, 0.2470588, 1, 0, 1,
-0.5269949, 1.177765, 1.050189, 0.2431373, 1, 0, 1,
-0.526035, -0.5061663, -1.823417, 0.2352941, 1, 0, 1,
-0.5240818, -0.09490593, -1.143448, 0.2313726, 1, 0, 1,
-0.5173331, -0.06608924, -2.754743, 0.2235294, 1, 0, 1,
-0.5157034, 0.4867465, -0.5458793, 0.2196078, 1, 0, 1,
-0.5141881, -1.807204, -2.564781, 0.2117647, 1, 0, 1,
-0.5101408, 1.065507, 0.6938828, 0.2078431, 1, 0, 1,
-0.5093451, -0.8562411, -3.996681, 0.2, 1, 0, 1,
-0.5091668, 0.4304888, -0.5312374, 0.1921569, 1, 0, 1,
-0.5065604, 0.5091699, -1.183876, 0.1882353, 1, 0, 1,
-0.5029954, -0.2874126, -1.654053, 0.1803922, 1, 0, 1,
-0.4983769, 0.7510687, -0.03883009, 0.1764706, 1, 0, 1,
-0.4870826, -1.849262, -3.354814, 0.1686275, 1, 0, 1,
-0.4868265, 0.4698394, -3.067041, 0.1647059, 1, 0, 1,
-0.4865426, 0.5177346, -3.527785, 0.1568628, 1, 0, 1,
-0.4846064, 1.477799, -0.8359507, 0.1529412, 1, 0, 1,
-0.4694117, -0.1583916, -2.455438, 0.145098, 1, 0, 1,
-0.4674971, -0.3993756, -2.887377, 0.1411765, 1, 0, 1,
-0.4671706, 0.1709459, -0.8183091, 0.1333333, 1, 0, 1,
-0.4650646, -0.4578708, -1.426506, 0.1294118, 1, 0, 1,
-0.4622013, -0.8051936, -2.770207, 0.1215686, 1, 0, 1,
-0.4609597, -0.5932496, -1.831339, 0.1176471, 1, 0, 1,
-0.4586267, -0.6928617, -3.204773, 0.1098039, 1, 0, 1,
-0.4533268, -0.4733072, -2.208654, 0.1058824, 1, 0, 1,
-0.4490758, 0.6221346, -1.530109, 0.09803922, 1, 0, 1,
-0.447034, -0.2343808, -1.296471, 0.09019608, 1, 0, 1,
-0.4456667, 0.6978067, -1.487071, 0.08627451, 1, 0, 1,
-0.4430129, 0.2086478, -1.618512, 0.07843138, 1, 0, 1,
-0.4377467, 0.3213625, -2.651294, 0.07450981, 1, 0, 1,
-0.4368141, -0.4188976, -3.551507, 0.06666667, 1, 0, 1,
-0.4367813, 0.01418111, -1.945528, 0.0627451, 1, 0, 1,
-0.4367095, -0.0239423, -1.678587, 0.05490196, 1, 0, 1,
-0.4339592, 0.982424, -0.8333168, 0.05098039, 1, 0, 1,
-0.4297829, 0.5172088, -1.735408, 0.04313726, 1, 0, 1,
-0.4288234, -1.15676, -5.448056, 0.03921569, 1, 0, 1,
-0.4286034, 0.4358138, -1.796844, 0.03137255, 1, 0, 1,
-0.4252983, -0.2250765, -2.929305, 0.02745098, 1, 0, 1,
-0.4247463, 0.8154896, -0.7421837, 0.01960784, 1, 0, 1,
-0.4244259, -0.2383896, -2.079912, 0.01568628, 1, 0, 1,
-0.4236214, -0.7041723, -3.965894, 0.007843138, 1, 0, 1,
-0.4207718, 0.6580812, -0.2013648, 0.003921569, 1, 0, 1,
-0.4204135, -1.151913, -1.723368, 0, 1, 0.003921569, 1,
-0.4181569, 0.289851, -2.135466, 0, 1, 0.01176471, 1,
-0.4163144, -0.1783085, -2.454179, 0, 1, 0.01568628, 1,
-0.4161407, -0.4206838, -1.342896, 0, 1, 0.02352941, 1,
-0.4134817, 0.728333, -0.5456101, 0, 1, 0.02745098, 1,
-0.4096535, -0.7449785, -3.391682, 0, 1, 0.03529412, 1,
-0.4095217, 0.9379501, -0.8272817, 0, 1, 0.03921569, 1,
-0.4053712, -0.4515063, -5.369784, 0, 1, 0.04705882, 1,
-0.4013542, -1.16112, -4.089465, 0, 1, 0.05098039, 1,
-0.3981458, -0.664005, -0.9859397, 0, 1, 0.05882353, 1,
-0.3974229, 1.121837, -0.3296665, 0, 1, 0.0627451, 1,
-0.392101, 0.4400685, -0.09972598, 0, 1, 0.07058824, 1,
-0.3912551, 0.818653, -0.6230049, 0, 1, 0.07450981, 1,
-0.3892192, -1.033296, -3.413297, 0, 1, 0.08235294, 1,
-0.3891704, 1.678049, -0.5224473, 0, 1, 0.08627451, 1,
-0.3870917, 0.5940397, -2.096456, 0, 1, 0.09411765, 1,
-0.3866647, 0.1296646, -1.385705, 0, 1, 0.1019608, 1,
-0.3865252, -1.415844, -3.174325, 0, 1, 0.1058824, 1,
-0.384833, -0.7231048, -1.812793, 0, 1, 0.1137255, 1,
-0.3797566, 0.1384832, -0.4827719, 0, 1, 0.1176471, 1,
-0.3605907, 0.6438919, 0.3901482, 0, 1, 0.1254902, 1,
-0.3585911, -1.255845, -0.7652598, 0, 1, 0.1294118, 1,
-0.3583647, -0.5483853, -3.213405, 0, 1, 0.1372549, 1,
-0.355424, 2.068708, 0.3875684, 0, 1, 0.1411765, 1,
-0.3547367, -0.1616747, -3.052102, 0, 1, 0.1490196, 1,
-0.3547218, -0.521183, -1.208514, 0, 1, 0.1529412, 1,
-0.351992, 0.5117128, 0.1060238, 0, 1, 0.1607843, 1,
-0.3413395, 0.5343236, -1.998062, 0, 1, 0.1647059, 1,
-0.33541, -0.7902869, -3.269468, 0, 1, 0.172549, 1,
-0.3349023, 1.206639, 0.4960019, 0, 1, 0.1764706, 1,
-0.3326526, -0.08769626, -0.5961071, 0, 1, 0.1843137, 1,
-0.3326125, -1.662706, -3.49526, 0, 1, 0.1882353, 1,
-0.3320931, -0.401784, -3.391403, 0, 1, 0.1960784, 1,
-0.328618, -0.8503812, -4.08141, 0, 1, 0.2039216, 1,
-0.3280058, 1.59293, -1.823306, 0, 1, 0.2078431, 1,
-0.3278063, -1.289988, -0.983694, 0, 1, 0.2156863, 1,
-0.3250179, -0.4597523, -1.754946, 0, 1, 0.2196078, 1,
-0.3247509, 1.84288, -0.9014641, 0, 1, 0.227451, 1,
-0.3236375, -0.4028876, -1.956635, 0, 1, 0.2313726, 1,
-0.3201214, 0.5871817, -2.402449, 0, 1, 0.2392157, 1,
-0.319037, -0.6979699, -2.839613, 0, 1, 0.2431373, 1,
-0.3186421, -1.308641, -2.246031, 0, 1, 0.2509804, 1,
-0.3042871, 1.088548, -0.2123636, 0, 1, 0.254902, 1,
-0.3004767, 0.4458012, -0.8353598, 0, 1, 0.2627451, 1,
-0.2986655, -0.781654, -3.657544, 0, 1, 0.2666667, 1,
-0.2964431, 0.9628511, -0.7105505, 0, 1, 0.2745098, 1,
-0.2962994, -0.1735681, -1.05914, 0, 1, 0.2784314, 1,
-0.2954158, -1.759936, -3.566696, 0, 1, 0.2862745, 1,
-0.2947434, -1.183019, -3.59314, 0, 1, 0.2901961, 1,
-0.2929523, 0.1972927, -0.8564829, 0, 1, 0.2980392, 1,
-0.2925834, -0.1152583, -3.762521, 0, 1, 0.3058824, 1,
-0.2922107, 0.6101661, 0.5233032, 0, 1, 0.3098039, 1,
-0.2848222, 0.4029102, -2.009675, 0, 1, 0.3176471, 1,
-0.2821538, 0.01048322, -1.781189, 0, 1, 0.3215686, 1,
-0.2796465, -1.462814, -2.706114, 0, 1, 0.3294118, 1,
-0.2779253, 0.5170873, -0.2093432, 0, 1, 0.3333333, 1,
-0.2767141, 0.2756349, -0.9017791, 0, 1, 0.3411765, 1,
-0.2765854, -0.7646874, -3.090561, 0, 1, 0.345098, 1,
-0.2762362, 0.5483004, -0.4124487, 0, 1, 0.3529412, 1,
-0.2754345, 1.401111, -1.701305, 0, 1, 0.3568628, 1,
-0.2752148, -0.2669737, -2.704896, 0, 1, 0.3647059, 1,
-0.2730095, -0.9818976, -3.832818, 0, 1, 0.3686275, 1,
-0.2718141, -0.98657, -5.086847, 0, 1, 0.3764706, 1,
-0.2706935, -0.2320066, -0.6601023, 0, 1, 0.3803922, 1,
-0.26853, 0.1212434, -1.816072, 0, 1, 0.3882353, 1,
-0.2660674, 1.796369, -2.00179, 0, 1, 0.3921569, 1,
-0.2644224, -0.7990795, -1.649265, 0, 1, 0.4, 1,
-0.2586337, -0.01551936, 0.6852765, 0, 1, 0.4078431, 1,
-0.2512282, -0.01236935, -2.265691, 0, 1, 0.4117647, 1,
-0.2493366, -1.527555, -2.354938, 0, 1, 0.4196078, 1,
-0.2492625, -0.3087063, -2.475836, 0, 1, 0.4235294, 1,
-0.2488441, -0.1278804, -2.060864, 0, 1, 0.4313726, 1,
-0.2435776, 0.9305632, -1.964008, 0, 1, 0.4352941, 1,
-0.2428588, -0.6303639, -3.534832, 0, 1, 0.4431373, 1,
-0.2334232, -1.658608, -1.915763, 0, 1, 0.4470588, 1,
-0.228393, -0.5586901, -1.085303, 0, 1, 0.454902, 1,
-0.2262458, -1.149, -2.615193, 0, 1, 0.4588235, 1,
-0.2240915, -0.03967588, -3.242337, 0, 1, 0.4666667, 1,
-0.2238791, 0.02010769, 0.6576603, 0, 1, 0.4705882, 1,
-0.2180535, 0.1386351, -0.5891286, 0, 1, 0.4784314, 1,
-0.2129133, 0.3006177, 0.05885126, 0, 1, 0.4823529, 1,
-0.2118744, -1.117095, -2.822856, 0, 1, 0.4901961, 1,
-0.2111413, 0.9300907, -0.258151, 0, 1, 0.4941176, 1,
-0.2109731, 0.2906234, -0.2432932, 0, 1, 0.5019608, 1,
-0.2096347, 0.7874554, -0.8664843, 0, 1, 0.509804, 1,
-0.2086571, -0.4862754, -3.938687, 0, 1, 0.5137255, 1,
-0.2085239, -0.6216829, -2.049218, 0, 1, 0.5215687, 1,
-0.2071653, -0.2964455, -1.851865, 0, 1, 0.5254902, 1,
-0.2000872, 0.4605368, -1.101341, 0, 1, 0.5333334, 1,
-0.1992213, -2.105067, -4.452818, 0, 1, 0.5372549, 1,
-0.198376, 0.5942922, -1.088289, 0, 1, 0.5450981, 1,
-0.1979855, 0.308105, -0.1171884, 0, 1, 0.5490196, 1,
-0.1974702, -1.274431, -3.243986, 0, 1, 0.5568628, 1,
-0.1972301, 1.662941, -1.237313, 0, 1, 0.5607843, 1,
-0.1970559, 0.09654851, -2.869013, 0, 1, 0.5686275, 1,
-0.1935644, -1.612704, -3.796011, 0, 1, 0.572549, 1,
-0.1931581, 0.4988187, 0.2523901, 0, 1, 0.5803922, 1,
-0.1924103, -0.7356704, -2.681169, 0, 1, 0.5843138, 1,
-0.1883848, 1.564045, -0.1694758, 0, 1, 0.5921569, 1,
-0.1866239, 0.06501825, -1.970955, 0, 1, 0.5960785, 1,
-0.1832207, 0.9549029, 1.182084, 0, 1, 0.6039216, 1,
-0.182953, -0.1175632, -2.74936, 0, 1, 0.6117647, 1,
-0.1811695, 0.6084583, -1.806477, 0, 1, 0.6156863, 1,
-0.1808633, -0.5741113, -2.467076, 0, 1, 0.6235294, 1,
-0.1798843, 0.4667389, -1.099489, 0, 1, 0.627451, 1,
-0.1772119, 1.453853, -0.2475917, 0, 1, 0.6352941, 1,
-0.1765585, -1.528678, -2.910858, 0, 1, 0.6392157, 1,
-0.1764819, -0.5699787, -4.875445, 0, 1, 0.6470588, 1,
-0.1762326, 0.2413961, -0.8130059, 0, 1, 0.6509804, 1,
-0.1756623, -0.7006598, -2.794177, 0, 1, 0.6588235, 1,
-0.1750882, -1.348033, -2.914528, 0, 1, 0.6627451, 1,
-0.1740402, 2.320217, -0.4852436, 0, 1, 0.6705883, 1,
-0.1707711, -0.9393319, -2.805593, 0, 1, 0.6745098, 1,
-0.1682873, 0.9140514, -0.1955572, 0, 1, 0.682353, 1,
-0.1654173, -1.283788, -3.155693, 0, 1, 0.6862745, 1,
-0.1608211, 1.026631, 1.06038, 0, 1, 0.6941177, 1,
-0.1600906, -1.564727, -4.24421, 0, 1, 0.7019608, 1,
-0.157619, 0.385071, 0.1479646, 0, 1, 0.7058824, 1,
-0.1569713, -0.3514674, -3.104025, 0, 1, 0.7137255, 1,
-0.1566939, 0.4099421, -0.7337848, 0, 1, 0.7176471, 1,
-0.1555981, 0.5252074, -0.7865538, 0, 1, 0.7254902, 1,
-0.1544589, -1.108388, -3.212995, 0, 1, 0.7294118, 1,
-0.1509819, -0.4242446, -3.647028, 0, 1, 0.7372549, 1,
-0.1509804, -0.5055798, 0.3093482, 0, 1, 0.7411765, 1,
-0.1503238, 1.977923, 1.067585, 0, 1, 0.7490196, 1,
-0.1400516, -0.8027352, -1.686842, 0, 1, 0.7529412, 1,
-0.1394914, -0.2853282, -1.480437, 0, 1, 0.7607843, 1,
-0.1360577, 0.6749173, -0.3737521, 0, 1, 0.7647059, 1,
-0.1324313, 1.130161, 0.5034125, 0, 1, 0.772549, 1,
-0.1318216, 1.885877, -1.137346, 0, 1, 0.7764706, 1,
-0.1307277, 0.6109899, -0.3573554, 0, 1, 0.7843137, 1,
-0.1298952, 1.453218, 1.171291, 0, 1, 0.7882353, 1,
-0.1273243, 1.045597, -1.187668, 0, 1, 0.7960784, 1,
-0.1262936, 1.705393, 0.1788571, 0, 1, 0.8039216, 1,
-0.123573, 0.1819595, -2.027949, 0, 1, 0.8078431, 1,
-0.1233646, 0.8786765, -1.568591, 0, 1, 0.8156863, 1,
-0.1225032, -0.4860817, -3.354837, 0, 1, 0.8196079, 1,
-0.1221687, 1.298293, -1.721585, 0, 1, 0.827451, 1,
-0.117521, -0.7227385, -3.477846, 0, 1, 0.8313726, 1,
-0.1107495, -0.6355296, -3.130331, 0, 1, 0.8392157, 1,
-0.1081531, 0.001619052, 0.6250957, 0, 1, 0.8431373, 1,
-0.1074989, 1.785782, 1.818509, 0, 1, 0.8509804, 1,
-0.1039907, 1.253657, 1.650253, 0, 1, 0.854902, 1,
-0.09973062, -1.904926, -2.348496, 0, 1, 0.8627451, 1,
-0.09784003, -1.793762, -1.427609, 0, 1, 0.8666667, 1,
-0.08746961, 0.327325, 0.1349783, 0, 1, 0.8745098, 1,
-0.08570309, -0.8936872, -2.511016, 0, 1, 0.8784314, 1,
-0.08499192, 0.9268836, -1.489045, 0, 1, 0.8862745, 1,
-0.08393849, -1.084516, -3.479718, 0, 1, 0.8901961, 1,
-0.0818047, 0.05544646, -0.2074635, 0, 1, 0.8980392, 1,
-0.08018491, -0.7796556, -2.90915, 0, 1, 0.9058824, 1,
-0.07975119, 0.3965015, -1.227282, 0, 1, 0.9098039, 1,
-0.0728977, 0.6107045, -0.3777655, 0, 1, 0.9176471, 1,
-0.07060167, -0.9230605, -3.24606, 0, 1, 0.9215686, 1,
-0.06246097, 1.148627, -0.8680783, 0, 1, 0.9294118, 1,
-0.05662851, -0.816215, -2.700051, 0, 1, 0.9333333, 1,
-0.05528138, 0.2121996, 0.5064718, 0, 1, 0.9411765, 1,
-0.05148158, -1.098099, -1.464294, 0, 1, 0.945098, 1,
-0.0511917, -2.611055, -0.7059793, 0, 1, 0.9529412, 1,
-0.04905787, -0.1091331, -4.113583, 0, 1, 0.9568627, 1,
-0.04905457, -0.259745, -2.472293, 0, 1, 0.9647059, 1,
-0.04704043, -0.5920177, -4.247621, 0, 1, 0.9686275, 1,
-0.04136853, -0.3660731, -3.840736, 0, 1, 0.9764706, 1,
-0.03948437, -1.614354, -4.222534, 0, 1, 0.9803922, 1,
-0.03273106, -0.2903492, -4.012775, 0, 1, 0.9882353, 1,
-0.03243047, -0.2591287, -3.010554, 0, 1, 0.9921569, 1,
-0.02976307, 0.203086, -1.631303, 0, 1, 1, 1,
-0.02647585, -2.219047, -2.755229, 0, 0.9921569, 1, 1,
-0.02399899, -1.117917, -3.134503, 0, 0.9882353, 1, 1,
-0.02329564, 1.40519, 0.006181056, 0, 0.9803922, 1, 1,
-0.02242961, -0.9860148, -2.179172, 0, 0.9764706, 1, 1,
-0.01842257, -0.8044585, -2.690874, 0, 0.9686275, 1, 1,
-0.01830669, 0.9309838, 0.4929624, 0, 0.9647059, 1, 1,
-0.01757305, 1.587385, 0.3875145, 0, 0.9568627, 1, 1,
-0.0165457, -0.4157057, -2.814317, 0, 0.9529412, 1, 1,
-0.01567662, -0.1034013, -2.114043, 0, 0.945098, 1, 1,
-0.006997196, -0.7491446, -3.812513, 0, 0.9411765, 1, 1,
0.0002746577, -1.694602, 3.58231, 0, 0.9333333, 1, 1,
0.001576409, 1.734535, 0.88587, 0, 0.9294118, 1, 1,
0.003037115, -0.7049547, 4.674232, 0, 0.9215686, 1, 1,
0.004068266, -0.5627642, 2.189483, 0, 0.9176471, 1, 1,
0.007016821, 0.6052878, -0.3311518, 0, 0.9098039, 1, 1,
0.01552766, -0.1636391, 4.632164, 0, 0.9058824, 1, 1,
0.01571139, 0.5834986, -3.097302, 0, 0.8980392, 1, 1,
0.01850127, 0.1973046, -2.456741, 0, 0.8901961, 1, 1,
0.01870465, -0.8361549, 2.412794, 0, 0.8862745, 1, 1,
0.02322735, -1.139869, 3.764524, 0, 0.8784314, 1, 1,
0.03041679, 0.6656347, 0.05182703, 0, 0.8745098, 1, 1,
0.03156827, 0.983131, 0.6299669, 0, 0.8666667, 1, 1,
0.03463947, 0.1850655, 1.566169, 0, 0.8627451, 1, 1,
0.03662075, -1.646882, 5.18921, 0, 0.854902, 1, 1,
0.03715784, -0.9585138, 4.416211, 0, 0.8509804, 1, 1,
0.03790165, -1.662124, 3.428255, 0, 0.8431373, 1, 1,
0.03966903, -0.3865735, 3.624831, 0, 0.8392157, 1, 1,
0.0414546, 0.4784654, 0.194525, 0, 0.8313726, 1, 1,
0.04667756, -0.6427794, 2.917935, 0, 0.827451, 1, 1,
0.04683448, -1.028137, 2.701422, 0, 0.8196079, 1, 1,
0.04720787, -1.08924, 1.715453, 0, 0.8156863, 1, 1,
0.05296258, 0.7712933, 0.918568, 0, 0.8078431, 1, 1,
0.05307453, -0.5132763, 3.728384, 0, 0.8039216, 1, 1,
0.05953937, -0.272737, 2.328348, 0, 0.7960784, 1, 1,
0.06230387, 0.9303586, 0.7952254, 0, 0.7882353, 1, 1,
0.0660713, -1.424944, 0.4766118, 0, 0.7843137, 1, 1,
0.06625414, 1.966791, -0.3614797, 0, 0.7764706, 1, 1,
0.06975313, 0.7337444, 0.6686236, 0, 0.772549, 1, 1,
0.07387517, 1.362531, -0.9607593, 0, 0.7647059, 1, 1,
0.08078346, 0.1740758, 1.26437, 0, 0.7607843, 1, 1,
0.08384018, 0.7131711, -1.793752, 0, 0.7529412, 1, 1,
0.08450912, 0.2036824, 1.990194, 0, 0.7490196, 1, 1,
0.08938003, 0.2953743, 1.844119, 0, 0.7411765, 1, 1,
0.08938771, -1.977751, 5.559484, 0, 0.7372549, 1, 1,
0.09075329, -0.7576954, 3.381398, 0, 0.7294118, 1, 1,
0.09510233, 0.6003215, 0.9008324, 0, 0.7254902, 1, 1,
0.09798326, -1.318164, 2.698441, 0, 0.7176471, 1, 1,
0.1074051, 0.9458841, 2.683012, 0, 0.7137255, 1, 1,
0.1083399, -1.137303, 2.286537, 0, 0.7058824, 1, 1,
0.1101549, -0.669738, 1.899428, 0, 0.6980392, 1, 1,
0.1125724, 1.009943, -0.2546032, 0, 0.6941177, 1, 1,
0.1181656, -0.2288643, 3.162542, 0, 0.6862745, 1, 1,
0.1208754, 0.0831883, 2.505393, 0, 0.682353, 1, 1,
0.1223958, 0.1122115, 1.831268, 0, 0.6745098, 1, 1,
0.1237892, 2.174642, 1.61549, 0, 0.6705883, 1, 1,
0.1243188, -0.5615546, 3.300267, 0, 0.6627451, 1, 1,
0.1247371, 0.5746101, 0.6113776, 0, 0.6588235, 1, 1,
0.1256259, 1.122897, 0.2867156, 0, 0.6509804, 1, 1,
0.1263333, 0.1213685, 2.235593, 0, 0.6470588, 1, 1,
0.1281114, 0.7657961, 0.7945721, 0, 0.6392157, 1, 1,
0.1291046, -0.1333167, 1.312649, 0, 0.6352941, 1, 1,
0.1303499, 1.014447, 1.531537, 0, 0.627451, 1, 1,
0.131282, 0.06672318, 2.502221, 0, 0.6235294, 1, 1,
0.1370727, 0.8488051, 1.026623, 0, 0.6156863, 1, 1,
0.1428128, -1.122746, 5.454478, 0, 0.6117647, 1, 1,
0.1478047, 1.07489, 1.211971, 0, 0.6039216, 1, 1,
0.1484733, -0.3368244, 3.217315, 0, 0.5960785, 1, 1,
0.1490936, -1.013537, 2.244009, 0, 0.5921569, 1, 1,
0.1512844, 0.2173812, -0.06017076, 0, 0.5843138, 1, 1,
0.1529876, 1.769117, -0.01504639, 0, 0.5803922, 1, 1,
0.1629271, -0.3321836, 1.169982, 0, 0.572549, 1, 1,
0.1639248, -0.772551, 3.254492, 0, 0.5686275, 1, 1,
0.1666821, 0.5856345, -0.01898846, 0, 0.5607843, 1, 1,
0.1757086, 0.3413087, -0.9141142, 0, 0.5568628, 1, 1,
0.1757375, -1.581788, 2.390033, 0, 0.5490196, 1, 1,
0.1822142, 0.2785463, 1.133804, 0, 0.5450981, 1, 1,
0.1840935, -2.129261, 3.016608, 0, 0.5372549, 1, 1,
0.1854983, 0.4140973, -0.3893773, 0, 0.5333334, 1, 1,
0.1867781, -0.5602087, 1.626176, 0, 0.5254902, 1, 1,
0.1908818, -0.8783828, 2.392417, 0, 0.5215687, 1, 1,
0.1937536, 0.2524344, 0.8875113, 0, 0.5137255, 1, 1,
0.1947777, -0.2348356, 2.699723, 0, 0.509804, 1, 1,
0.1954157, -0.4013048, 2.95589, 0, 0.5019608, 1, 1,
0.1996921, 0.4137186, -0.9102679, 0, 0.4941176, 1, 1,
0.2038749, 1.071938, 0.08366697, 0, 0.4901961, 1, 1,
0.2042362, -0.6659881, 2.893835, 0, 0.4823529, 1, 1,
0.2073995, 0.03641877, 0.2902061, 0, 0.4784314, 1, 1,
0.2082358, 0.9000861, 0.4802098, 0, 0.4705882, 1, 1,
0.2122022, 1.329999, 0.02675308, 0, 0.4666667, 1, 1,
0.2133247, -0.113645, 2.221095, 0, 0.4588235, 1, 1,
0.2141742, -0.8889735, 0.6037672, 0, 0.454902, 1, 1,
0.2182753, -0.3913507, 3.08526, 0, 0.4470588, 1, 1,
0.2183217, 0.7949349, 0.9564672, 0, 0.4431373, 1, 1,
0.2265822, -0.08586191, 2.626681, 0, 0.4352941, 1, 1,
0.2268242, -0.442626, 1.921656, 0, 0.4313726, 1, 1,
0.2276971, -0.8266189, 3.874104, 0, 0.4235294, 1, 1,
0.2281406, 2.413094, 1.122637, 0, 0.4196078, 1, 1,
0.2415368, -1.299972, 3.520995, 0, 0.4117647, 1, 1,
0.2474822, -0.1452127, 0.6618754, 0, 0.4078431, 1, 1,
0.2478204, -0.9364697, 3.263638, 0, 0.4, 1, 1,
0.2528327, -0.5789732, 2.860944, 0, 0.3921569, 1, 1,
0.2530427, 1.572402, 0.3292522, 0, 0.3882353, 1, 1,
0.2544208, -0.3519573, 3.123638, 0, 0.3803922, 1, 1,
0.26138, -1.049996, 3.843813, 0, 0.3764706, 1, 1,
0.2628426, -0.4558693, 2.655321, 0, 0.3686275, 1, 1,
0.2654844, 1.281772, 0.2369451, 0, 0.3647059, 1, 1,
0.2667734, 1.404766, 2.390612, 0, 0.3568628, 1, 1,
0.2675605, 0.3584278, 1.247643, 0, 0.3529412, 1, 1,
0.2702217, -0.3232969, 1.860252, 0, 0.345098, 1, 1,
0.2849945, 0.6844236, 0.5277517, 0, 0.3411765, 1, 1,
0.2863218, 0.07344481, 3.193297, 0, 0.3333333, 1, 1,
0.2924507, 0.1282989, 1.156569, 0, 0.3294118, 1, 1,
0.2956084, -0.2776369, 1.202185, 0, 0.3215686, 1, 1,
0.2991621, 0.694544, 1.072641, 0, 0.3176471, 1, 1,
0.2999322, 1.131087, -1.032268, 0, 0.3098039, 1, 1,
0.3002822, -0.0004803746, 1.694864, 0, 0.3058824, 1, 1,
0.3009316, 0.1221567, 0.983933, 0, 0.2980392, 1, 1,
0.3055, -1.201298, 2.718046, 0, 0.2901961, 1, 1,
0.308994, 0.3583635, 1.33373, 0, 0.2862745, 1, 1,
0.3090792, 0.6589196, 1.478122, 0, 0.2784314, 1, 1,
0.3092527, 0.6281356, 2.172961, 0, 0.2745098, 1, 1,
0.3126867, -1.694954, 3.784005, 0, 0.2666667, 1, 1,
0.3151006, 1.298647, 2.09402, 0, 0.2627451, 1, 1,
0.3151987, -0.914801, 2.99957, 0, 0.254902, 1, 1,
0.3167885, 0.6355376, 1.031241, 0, 0.2509804, 1, 1,
0.322822, 0.6204978, 1.565402, 0, 0.2431373, 1, 1,
0.3313716, 0.7488428, -0.1411596, 0, 0.2392157, 1, 1,
0.33188, 0.1133669, -0.3657441, 0, 0.2313726, 1, 1,
0.3348158, 0.4370563, 0.08115885, 0, 0.227451, 1, 1,
0.3385651, 0.8332196, 0.009023109, 0, 0.2196078, 1, 1,
0.3397262, 0.174569, -1.252789, 0, 0.2156863, 1, 1,
0.3400094, -0.5676804, 1.016742, 0, 0.2078431, 1, 1,
0.3407571, -1.155465, 1.986319, 0, 0.2039216, 1, 1,
0.3426569, 0.2419823, 0.470192, 0, 0.1960784, 1, 1,
0.3435241, 2.675051, -1.358295, 0, 0.1882353, 1, 1,
0.344162, -0.509639, 4.072574, 0, 0.1843137, 1, 1,
0.3581808, -1.440924, 3.958641, 0, 0.1764706, 1, 1,
0.3640409, 0.2103654, 1.786158, 0, 0.172549, 1, 1,
0.3646238, -0.0893546, 2.250322, 0, 0.1647059, 1, 1,
0.3710474, 1.011799, -0.4644921, 0, 0.1607843, 1, 1,
0.374396, 0.186695, 0.2841738, 0, 0.1529412, 1, 1,
0.3776182, -0.5099767, 2.512726, 0, 0.1490196, 1, 1,
0.3782131, 0.4054483, 1.177176, 0, 0.1411765, 1, 1,
0.3785279, -1.813933, 2.037491, 0, 0.1372549, 1, 1,
0.3800966, 0.7272978, -0.628304, 0, 0.1294118, 1, 1,
0.3835846, 1.041944, 0.4771886, 0, 0.1254902, 1, 1,
0.3861024, -1.255802, 3.452707, 0, 0.1176471, 1, 1,
0.3888012, -0.3814905, 2.960884, 0, 0.1137255, 1, 1,
0.3893404, 0.6261041, 0.7126128, 0, 0.1058824, 1, 1,
0.3897303, 0.03519734, 0.4241023, 0, 0.09803922, 1, 1,
0.3903326, -1.696283, 1.576622, 0, 0.09411765, 1, 1,
0.3937222, 0.5439568, 1.019072, 0, 0.08627451, 1, 1,
0.3940546, 0.2914851, 0.7325248, 0, 0.08235294, 1, 1,
0.3942757, 0.84211, -0.8122238, 0, 0.07450981, 1, 1,
0.3953274, 1.573042, 1.016164, 0, 0.07058824, 1, 1,
0.3954441, -0.4638686, 2.19772, 0, 0.0627451, 1, 1,
0.3993706, -0.1644148, 3.306256, 0, 0.05882353, 1, 1,
0.4001231, 0.02940689, 0.6622862, 0, 0.05098039, 1, 1,
0.4040757, 1.7237, -0.7905802, 0, 0.04705882, 1, 1,
0.4057596, -0.4913681, 3.843904, 0, 0.03921569, 1, 1,
0.4065015, -0.4261709, 2.843749, 0, 0.03529412, 1, 1,
0.408023, 0.3437752, 1.915297, 0, 0.02745098, 1, 1,
0.4101703, -0.5123935, 1.149554, 0, 0.02352941, 1, 1,
0.4110533, 0.01223058, 1.61077, 0, 0.01568628, 1, 1,
0.411573, 0.4305132, 0.9933112, 0, 0.01176471, 1, 1,
0.4139689, 1.204816, 1.445565, 0, 0.003921569, 1, 1,
0.4275076, -0.2961607, 0.9473554, 0.003921569, 0, 1, 1,
0.4342646, -0.9243631, 3.241898, 0.007843138, 0, 1, 1,
0.436162, -2.258052, 0.92928, 0.01568628, 0, 1, 1,
0.4414499, -0.9949989, 3.514804, 0.01960784, 0, 1, 1,
0.4460562, 0.3368678, -1.10455, 0.02745098, 0, 1, 1,
0.4494467, -0.8261529, 3.180699, 0.03137255, 0, 1, 1,
0.4497217, 0.7156637, 0.8118324, 0.03921569, 0, 1, 1,
0.4505802, 0.05311667, 0.05423104, 0.04313726, 0, 1, 1,
0.4524849, 1.205796, 0.3108023, 0.05098039, 0, 1, 1,
0.4527234, -0.2204115, 1.401566, 0.05490196, 0, 1, 1,
0.453052, -1.614507, 3.458246, 0.0627451, 0, 1, 1,
0.4658731, -0.1944113, 1.706865, 0.06666667, 0, 1, 1,
0.4768105, 1.463749, 1.376777, 0.07450981, 0, 1, 1,
0.4772124, 1.871383, 0.06538333, 0.07843138, 0, 1, 1,
0.4835249, -1.0223, 4.99526, 0.08627451, 0, 1, 1,
0.4843108, -0.8971012, 2.580939, 0.09019608, 0, 1, 1,
0.4875707, -0.8946014, 2.70703, 0.09803922, 0, 1, 1,
0.4882281, 2.810449, 0.01267111, 0.1058824, 0, 1, 1,
0.4886661, 2.108626, 2.049744, 0.1098039, 0, 1, 1,
0.4895742, 0.5529848, -0.2470742, 0.1176471, 0, 1, 1,
0.4935127, -0.8356949, 2.870426, 0.1215686, 0, 1, 1,
0.498217, -0.6052387, 4.192341, 0.1294118, 0, 1, 1,
0.4985093, -0.1523623, 2.466354, 0.1333333, 0, 1, 1,
0.5004343, 0.7465595, 0.2532023, 0.1411765, 0, 1, 1,
0.5033145, -0.3538529, -0.2498813, 0.145098, 0, 1, 1,
0.5060738, 0.3500057, 1.929649, 0.1529412, 0, 1, 1,
0.5087724, 1.23687, -0.2423529, 0.1568628, 0, 1, 1,
0.5096219, -0.6761559, 2.15109, 0.1647059, 0, 1, 1,
0.5099245, 1.263706, 1.172174, 0.1686275, 0, 1, 1,
0.5149685, 0.3912771, 0.3416842, 0.1764706, 0, 1, 1,
0.5151473, 1.227417, -0.6263633, 0.1803922, 0, 1, 1,
0.5183045, 1.489248, 1.316567, 0.1882353, 0, 1, 1,
0.5220975, 1.849815, 1.141873, 0.1921569, 0, 1, 1,
0.5222692, 1.58547, -0.00488729, 0.2, 0, 1, 1,
0.5238636, -0.5716699, 1.712045, 0.2078431, 0, 1, 1,
0.5274492, -0.7910635, 3.050339, 0.2117647, 0, 1, 1,
0.5283312, -1.240495, 3.333329, 0.2196078, 0, 1, 1,
0.5332432, -0.1098911, 1.61672, 0.2235294, 0, 1, 1,
0.5344142, -1.400734, 3.438876, 0.2313726, 0, 1, 1,
0.534937, -0.7935838, 2.849057, 0.2352941, 0, 1, 1,
0.5351616, 0.2252075, 1.790808, 0.2431373, 0, 1, 1,
0.5405663, -1.202558, 3.044626, 0.2470588, 0, 1, 1,
0.5416058, 1.484232, 0.4424452, 0.254902, 0, 1, 1,
0.5490954, 0.1535254, 1.604679, 0.2588235, 0, 1, 1,
0.5539538, 1.341341, 1.83608, 0.2666667, 0, 1, 1,
0.5547069, 0.4448796, 0.9542927, 0.2705882, 0, 1, 1,
0.5562587, -0.3874055, 1.611349, 0.2784314, 0, 1, 1,
0.5580649, -1.02703, 3.276042, 0.282353, 0, 1, 1,
0.5584224, -0.969443, 3.877614, 0.2901961, 0, 1, 1,
0.5613093, -0.5177119, 3.38071, 0.2941177, 0, 1, 1,
0.5631617, -1.841127, 5.322616, 0.3019608, 0, 1, 1,
0.563264, -1.436833, 4.784124, 0.3098039, 0, 1, 1,
0.56731, 0.1300762, 0.2145344, 0.3137255, 0, 1, 1,
0.5722267, 0.7428948, -1.074411, 0.3215686, 0, 1, 1,
0.5818785, 1.230402, -0.6686109, 0.3254902, 0, 1, 1,
0.5857171, 0.5159191, 3.339648, 0.3333333, 0, 1, 1,
0.5901274, 1.034268, 1.14755, 0.3372549, 0, 1, 1,
0.5918216, 0.6572131, 1.938305, 0.345098, 0, 1, 1,
0.5934101, -0.04647056, 1.585678, 0.3490196, 0, 1, 1,
0.5963151, -0.325324, 1.849941, 0.3568628, 0, 1, 1,
0.5967894, 2.071798, -0.5923064, 0.3607843, 0, 1, 1,
0.6050305, 0.6107569, 0.1087053, 0.3686275, 0, 1, 1,
0.6106208, -0.4647336, 2.627367, 0.372549, 0, 1, 1,
0.6125569, 0.6059566, 0.9623667, 0.3803922, 0, 1, 1,
0.6147505, -0.2338259, 1.355088, 0.3843137, 0, 1, 1,
0.6163048, 1.867571, -1.387045, 0.3921569, 0, 1, 1,
0.6175168, 0.3242926, 2.143312, 0.3960784, 0, 1, 1,
0.6181655, 0.4116634, 0.9979028, 0.4039216, 0, 1, 1,
0.6189061, 0.01876679, 1.539739, 0.4117647, 0, 1, 1,
0.6218005, -0.01094015, -0.425096, 0.4156863, 0, 1, 1,
0.6316527, 0.8704827, 0.2971567, 0.4235294, 0, 1, 1,
0.6320619, 0.2831219, 1.528987, 0.427451, 0, 1, 1,
0.6363429, 1.163222, 0.6735912, 0.4352941, 0, 1, 1,
0.6504799, -1.395217, 3.316435, 0.4392157, 0, 1, 1,
0.6518767, -2.234489, 2.817856, 0.4470588, 0, 1, 1,
0.6582682, -0.02414615, 2.638751, 0.4509804, 0, 1, 1,
0.6583919, -1.176691, 2.822179, 0.4588235, 0, 1, 1,
0.6649579, 1.115417, 0.4436967, 0.4627451, 0, 1, 1,
0.6675019, 1.558429, -2.342582, 0.4705882, 0, 1, 1,
0.6695544, -2.540883, 3.533934, 0.4745098, 0, 1, 1,
0.6785508, -0.6134112, 1.387478, 0.4823529, 0, 1, 1,
0.6812959, 1.619018, -0.05354219, 0.4862745, 0, 1, 1,
0.6868604, -0.1052918, 1.843247, 0.4941176, 0, 1, 1,
0.6882016, -0.2460938, 2.027468, 0.5019608, 0, 1, 1,
0.691538, -0.2658725, 1.86223, 0.5058824, 0, 1, 1,
0.6938986, -1.615951, 3.051839, 0.5137255, 0, 1, 1,
0.6960927, 0.5995468, 0.06950682, 0.5176471, 0, 1, 1,
0.696411, 1.236986, 1.356804, 0.5254902, 0, 1, 1,
0.6993548, 0.8355781, 0.5606564, 0.5294118, 0, 1, 1,
0.6994331, 1.24957, 0.3182505, 0.5372549, 0, 1, 1,
0.7023958, -0.2886201, 1.808352, 0.5411765, 0, 1, 1,
0.7029225, 0.2613297, 2.182097, 0.5490196, 0, 1, 1,
0.705579, 0.1249442, -0.1084722, 0.5529412, 0, 1, 1,
0.7076544, -1.67793, 3.519931, 0.5607843, 0, 1, 1,
0.7093001, 0.09870795, -0.07609014, 0.5647059, 0, 1, 1,
0.7222767, -1.740574, 2.746305, 0.572549, 0, 1, 1,
0.7291184, -0.2716078, 1.671295, 0.5764706, 0, 1, 1,
0.730366, 1.551954, 0.8294422, 0.5843138, 0, 1, 1,
0.742645, 0.5683028, 2.713489, 0.5882353, 0, 1, 1,
0.7440681, -0.05746366, 3.121937, 0.5960785, 0, 1, 1,
0.7590026, -0.3788825, 2.28499, 0.6039216, 0, 1, 1,
0.7618179, 2.036664, -0.4025716, 0.6078432, 0, 1, 1,
0.7679035, -0.8482038, 1.858393, 0.6156863, 0, 1, 1,
0.7692564, -0.006222815, 1.451092, 0.6196079, 0, 1, 1,
0.7695638, -0.2907913, -0.986195, 0.627451, 0, 1, 1,
0.7734798, -0.3179419, 2.00243, 0.6313726, 0, 1, 1,
0.7757948, -2.614316, 1.791244, 0.6392157, 0, 1, 1,
0.7764776, 2.230965, -0.6418428, 0.6431373, 0, 1, 1,
0.7767295, 0.1540698, 2.319989, 0.6509804, 0, 1, 1,
0.7779208, 0.9958761, 0.2008441, 0.654902, 0, 1, 1,
0.7816597, -3.239106, 3.376303, 0.6627451, 0, 1, 1,
0.7821721, -0.2938796, 1.427471, 0.6666667, 0, 1, 1,
0.7830143, 0.09435924, 1.623393, 0.6745098, 0, 1, 1,
0.7852826, -0.2116144, 0.7137871, 0.6784314, 0, 1, 1,
0.7866761, -0.5313395, 2.110475, 0.6862745, 0, 1, 1,
0.7872769, -0.9691067, 1.601309, 0.6901961, 0, 1, 1,
0.7874249, -0.330236, 2.657442, 0.6980392, 0, 1, 1,
0.7944815, 0.02961242, -0.3562643, 0.7058824, 0, 1, 1,
0.7951427, -0.03190025, 3.156525, 0.7098039, 0, 1, 1,
0.7959995, 1.57219, 1.005625, 0.7176471, 0, 1, 1,
0.7968354, -1.88031, 2.232065, 0.7215686, 0, 1, 1,
0.7968931, 0.5356833, 2.05584, 0.7294118, 0, 1, 1,
0.7991878, 0.6900999, 0.7829556, 0.7333333, 0, 1, 1,
0.7997488, 0.4690565, 0.6993373, 0.7411765, 0, 1, 1,
0.8005905, -0.552453, 3.421078, 0.7450981, 0, 1, 1,
0.8029473, -1.458552, 3.160076, 0.7529412, 0, 1, 1,
0.8048739, -0.3561451, 0.7152603, 0.7568628, 0, 1, 1,
0.8123819, -0.3586767, 2.62064, 0.7647059, 0, 1, 1,
0.8137271, 1.870882, -0.7619312, 0.7686275, 0, 1, 1,
0.8273545, 0.6490914, 0.6416869, 0.7764706, 0, 1, 1,
0.8311803, 1.477502, -0.9716079, 0.7803922, 0, 1, 1,
0.8329003, -0.9126196, 1.28961, 0.7882353, 0, 1, 1,
0.8427451, -0.2959332, 2.552745, 0.7921569, 0, 1, 1,
0.8433815, -0.9795905, 3.387687, 0.8, 0, 1, 1,
0.8474793, -0.3333429, 2.357972, 0.8078431, 0, 1, 1,
0.8497248, -0.1921006, 2.562524, 0.8117647, 0, 1, 1,
0.8500459, -0.9580902, 1.940605, 0.8196079, 0, 1, 1,
0.8557904, 0.7096753, 1.419978, 0.8235294, 0, 1, 1,
0.8578342, -0.7331949, 3.462677, 0.8313726, 0, 1, 1,
0.8603789, 1.224015, 2.349461, 0.8352941, 0, 1, 1,
0.8617808, -0.6065625, 2.216919, 0.8431373, 0, 1, 1,
0.867202, -2.132224, 3.223891, 0.8470588, 0, 1, 1,
0.8723035, -1.18645, 1.706453, 0.854902, 0, 1, 1,
0.8782117, -0.8661575, 2.218467, 0.8588235, 0, 1, 1,
0.879869, -0.8181459, 0.9684988, 0.8666667, 0, 1, 1,
0.8828062, -0.2113699, 0.4742686, 0.8705882, 0, 1, 1,
0.8838424, -1.779166, 2.620611, 0.8784314, 0, 1, 1,
0.8845578, -0.07669488, 0.04723607, 0.8823529, 0, 1, 1,
0.8888835, 1.509751, 0.9431182, 0.8901961, 0, 1, 1,
0.8917403, -0.9192218, -0.09012893, 0.8941177, 0, 1, 1,
0.8936304, 0.5550401, 0.2515841, 0.9019608, 0, 1, 1,
0.8952051, 0.3593695, 2.523885, 0.9098039, 0, 1, 1,
0.8984869, 0.1355399, 2.857467, 0.9137255, 0, 1, 1,
0.8992316, 1.208, 1.919859, 0.9215686, 0, 1, 1,
0.9000505, 2.150679, -0.5139611, 0.9254902, 0, 1, 1,
0.9011301, -1.259305, 3.105548, 0.9333333, 0, 1, 1,
0.9019243, 0.307359, 1.673976, 0.9372549, 0, 1, 1,
0.9029946, 0.839831, 1.973405, 0.945098, 0, 1, 1,
0.9273346, -0.03736252, 1.91058, 0.9490196, 0, 1, 1,
0.9279941, 0.6514499, 1.257566, 0.9568627, 0, 1, 1,
0.9375599, -0.1847082, 1.613537, 0.9607843, 0, 1, 1,
0.9468557, 2.150879, -0.1782714, 0.9686275, 0, 1, 1,
0.9515267, 0.2403028, 2.280821, 0.972549, 0, 1, 1,
0.9627401, 0.8724006, 1.699054, 0.9803922, 0, 1, 1,
0.9642611, 0.0087252, 2.055874, 0.9843137, 0, 1, 1,
0.967822, 0.6556385, 1.721706, 0.9921569, 0, 1, 1,
0.9678336, 0.1225291, 1.147036, 0.9960784, 0, 1, 1,
0.9681737, 1.24683, 0.4647849, 1, 0, 0.9960784, 1,
0.9716305, 0.9605703, 1.67775, 1, 0, 0.9882353, 1,
0.9755499, 0.2032198, 0.9761382, 1, 0, 0.9843137, 1,
0.9765983, 1.6056, -0.04426004, 1, 0, 0.9764706, 1,
0.9772959, -0.5030388, 1.600047, 1, 0, 0.972549, 1,
0.9832518, 0.1728986, 1.777545, 1, 0, 0.9647059, 1,
0.99052, -1.22488, 2.173158, 1, 0, 0.9607843, 1,
0.9925519, 0.272525, -0.5281439, 1, 0, 0.9529412, 1,
1.001797, -0.1860838, 0.7710038, 1, 0, 0.9490196, 1,
1.002702, 0.2496733, 0.6994836, 1, 0, 0.9411765, 1,
1.003734, 1.212098, -1.300221, 1, 0, 0.9372549, 1,
1.009364, 1.822142, 1.0895, 1, 0, 0.9294118, 1,
1.011092, 0.7803348, 0.9105698, 1, 0, 0.9254902, 1,
1.0113, -0.1094685, 2.356589, 1, 0, 0.9176471, 1,
1.01608, -0.277013, 3.096787, 1, 0, 0.9137255, 1,
1.016586, -0.761616, 1.222421, 1, 0, 0.9058824, 1,
1.02012, 1.125087, 0.4846506, 1, 0, 0.9019608, 1,
1.021567, 1.00682, 1.546324, 1, 0, 0.8941177, 1,
1.024098, 0.5791765, 0.7837796, 1, 0, 0.8862745, 1,
1.028519, -1.259271, 2.464421, 1, 0, 0.8823529, 1,
1.033493, 0.03298816, 1.959181, 1, 0, 0.8745098, 1,
1.034016, -0.2810262, 2.132468, 1, 0, 0.8705882, 1,
1.037364, 2.248226, 1.306075, 1, 0, 0.8627451, 1,
1.038063, -0.2782865, 0.4690429, 1, 0, 0.8588235, 1,
1.040902, 0.7107743, 0.944537, 1, 0, 0.8509804, 1,
1.041548, 2.624194, -0.7721397, 1, 0, 0.8470588, 1,
1.042294, 0.0057726, 2.016455, 1, 0, 0.8392157, 1,
1.043573, 0.4011996, 2.271175, 1, 0, 0.8352941, 1,
1.045533, 2.041212, 0.3127994, 1, 0, 0.827451, 1,
1.052179, 0.3994036, 1.870945, 1, 0, 0.8235294, 1,
1.063164, 1.604741, 1.852614, 1, 0, 0.8156863, 1,
1.063953, 0.107124, 1.680367, 1, 0, 0.8117647, 1,
1.079459, -0.3294942, 2.735551, 1, 0, 0.8039216, 1,
1.080671, -0.3461856, 1.959738, 1, 0, 0.7960784, 1,
1.08125, -1.324155, 3.897851, 1, 0, 0.7921569, 1,
1.08389, -0.04715497, 1.522394, 1, 0, 0.7843137, 1,
1.084989, -0.0964984, 0.4338693, 1, 0, 0.7803922, 1,
1.09294, 0.5774153, 0.6092115, 1, 0, 0.772549, 1,
1.094075, 0.5578704, 1.626741, 1, 0, 0.7686275, 1,
1.094131, 0.4380445, 1.237983, 1, 0, 0.7607843, 1,
1.102435, 0.9116346, 0.5709614, 1, 0, 0.7568628, 1,
1.107129, 0.9310509, 2.367053, 1, 0, 0.7490196, 1,
1.113153, -1.159049, 1.91945, 1, 0, 0.7450981, 1,
1.113647, -1.359347, 0.9452932, 1, 0, 0.7372549, 1,
1.11451, 1.94445, 2.663295, 1, 0, 0.7333333, 1,
1.114675, 1.100313, 0.7242503, 1, 0, 0.7254902, 1,
1.119128, -0.05938514, 4.508179, 1, 0, 0.7215686, 1,
1.130198, -0.5302767, 1.218706, 1, 0, 0.7137255, 1,
1.134758, -0.8901339, 2.296123, 1, 0, 0.7098039, 1,
1.135489, -0.902751, 1.369775, 1, 0, 0.7019608, 1,
1.138579, 0.7167376, 1.823655, 1, 0, 0.6941177, 1,
1.150675, -0.9056149, 1.336584, 1, 0, 0.6901961, 1,
1.157597, -1.127789, 1.959887, 1, 0, 0.682353, 1,
1.161208, -2.405225, 1.481079, 1, 0, 0.6784314, 1,
1.161817, -0.6595083, 2.296365, 1, 0, 0.6705883, 1,
1.16385, 0.2439268, 1.38976, 1, 0, 0.6666667, 1,
1.165032, 0.1117929, 2.473805, 1, 0, 0.6588235, 1,
1.165399, -3.773474, 3.818796, 1, 0, 0.654902, 1,
1.173832, -1.059927, 2.016398, 1, 0, 0.6470588, 1,
1.180202, -1.431913, 2.342404, 1, 0, 0.6431373, 1,
1.18381, -0.3058018, 2.317216, 1, 0, 0.6352941, 1,
1.190337, 1.29914, 0.9454541, 1, 0, 0.6313726, 1,
1.190629, 0.6717319, 2.606702, 1, 0, 0.6235294, 1,
1.191943, -0.3599332, 1.342532, 1, 0, 0.6196079, 1,
1.192362, 0.3606557, 0.2913895, 1, 0, 0.6117647, 1,
1.19362, 0.7854123, -0.7421222, 1, 0, 0.6078432, 1,
1.201802, -0.7681918, 1.833651, 1, 0, 0.6, 1,
1.204217, -0.5398253, 1.405347, 1, 0, 0.5921569, 1,
1.206303, 1.251707, 0.7109637, 1, 0, 0.5882353, 1,
1.207668, -1.40291, 4.124161, 1, 0, 0.5803922, 1,
1.208035, -2.060018, 1.974493, 1, 0, 0.5764706, 1,
1.209391, -0.3255418, 2.112492, 1, 0, 0.5686275, 1,
1.220074, 0.6408667, 0.258106, 1, 0, 0.5647059, 1,
1.244122, 0.4159171, 1.638167, 1, 0, 0.5568628, 1,
1.251569, 0.2482059, 1.062155, 1, 0, 0.5529412, 1,
1.256012, 0.4660075, 0.5151163, 1, 0, 0.5450981, 1,
1.269386, -0.3174551, 0.9953797, 1, 0, 0.5411765, 1,
1.273993, -0.3217305, 2.917572, 1, 0, 0.5333334, 1,
1.286649, 1.486407, 0.6116323, 1, 0, 0.5294118, 1,
1.292006, 0.3108353, 3.537383, 1, 0, 0.5215687, 1,
1.293367, -1.034948, 1.644823, 1, 0, 0.5176471, 1,
1.293779, -0.1851868, 2.578265, 1, 0, 0.509804, 1,
1.295332, 0.1591201, 1.481315, 1, 0, 0.5058824, 1,
1.335814, -1.396215, 2.831978, 1, 0, 0.4980392, 1,
1.363848, 0.1745713, 0.2791552, 1, 0, 0.4901961, 1,
1.369643, -0.3389366, 1.965703, 1, 0, 0.4862745, 1,
1.373081, 2.963503, -0.08074261, 1, 0, 0.4784314, 1,
1.391736, 1.450641, 0.5000921, 1, 0, 0.4745098, 1,
1.396904, -0.6193237, 2.596561, 1, 0, 0.4666667, 1,
1.411063, 0.3918297, 1.268363, 1, 0, 0.4627451, 1,
1.417209, -2.1989, 0.8097024, 1, 0, 0.454902, 1,
1.440211, -0.4193762, 3.018113, 1, 0, 0.4509804, 1,
1.452549, 1.937297, 0.7319494, 1, 0, 0.4431373, 1,
1.454909, 0.01145486, 1.094397, 1, 0, 0.4392157, 1,
1.467881, 1.030624, 1.11228, 1, 0, 0.4313726, 1,
1.468138, 0.5642789, 0.6695963, 1, 0, 0.427451, 1,
1.473971, 0.9051883, 0.2605248, 1, 0, 0.4196078, 1,
1.475514, -0.1254597, 0.3324548, 1, 0, 0.4156863, 1,
1.481598, -1.922258, 3.640188, 1, 0, 0.4078431, 1,
1.487092, -1.35526, 1.77474, 1, 0, 0.4039216, 1,
1.495341, 1.276241, 1.248, 1, 0, 0.3960784, 1,
1.499209, -0.5579818, 1.508, 1, 0, 0.3882353, 1,
1.504632, 0.2892129, 2.572472, 1, 0, 0.3843137, 1,
1.514609, 2.93997, -0.1685154, 1, 0, 0.3764706, 1,
1.517475, -1.750068, 2.231359, 1, 0, 0.372549, 1,
1.520378, 2.042407, 0.7312092, 1, 0, 0.3647059, 1,
1.520713, -0.89477, 2.865881, 1, 0, 0.3607843, 1,
1.524365, -0.7088692, 0.4986371, 1, 0, 0.3529412, 1,
1.527214, 1.770455, 0.5340651, 1, 0, 0.3490196, 1,
1.530709, -0.9936121, 2.442538, 1, 0, 0.3411765, 1,
1.532811, 0.8133502, 1.037771, 1, 0, 0.3372549, 1,
1.538854, -0.9283106, 1.346084, 1, 0, 0.3294118, 1,
1.54093, 0.628681, 0.2883767, 1, 0, 0.3254902, 1,
1.545474, 0.6768776, 1.897606, 1, 0, 0.3176471, 1,
1.556782, 0.682517, 2.083602, 1, 0, 0.3137255, 1,
1.566361, -1.525226, 2.966672, 1, 0, 0.3058824, 1,
1.57672, 0.2862989, 1.796027, 1, 0, 0.2980392, 1,
1.620295, -0.2931972, 3.168867, 1, 0, 0.2941177, 1,
1.621752, 0.6729379, 1.358559, 1, 0, 0.2862745, 1,
1.621975, 0.9283183, -0.1168589, 1, 0, 0.282353, 1,
1.626008, -1.035046, 1.600195, 1, 0, 0.2745098, 1,
1.635173, 1.166221, 1.242003, 1, 0, 0.2705882, 1,
1.657888, 0.08525068, 0.06660479, 1, 0, 0.2627451, 1,
1.663881, 0.440112, 1.445517, 1, 0, 0.2588235, 1,
1.664932, -0.2408911, 1.017173, 1, 0, 0.2509804, 1,
1.665224, 2.321304, 0.8941914, 1, 0, 0.2470588, 1,
1.680066, 1.243114, 0.5004795, 1, 0, 0.2392157, 1,
1.722087, 0.7436402, 3.964547, 1, 0, 0.2352941, 1,
1.736292, 0.5966131, 0.3909945, 1, 0, 0.227451, 1,
1.758715, -0.2104336, 1.719671, 1, 0, 0.2235294, 1,
1.776535, -2.126723, 0.8304524, 1, 0, 0.2156863, 1,
1.796438, -1.721963, 3.555958, 1, 0, 0.2117647, 1,
1.841958, -0.126002, 1.065605, 1, 0, 0.2039216, 1,
1.844365, 0.6157902, 0.406395, 1, 0, 0.1960784, 1,
1.875033, 0.2281799, 2.701724, 1, 0, 0.1921569, 1,
1.895274, 1.186311, -0.8121885, 1, 0, 0.1843137, 1,
1.905545, -0.03699405, 2.992993, 1, 0, 0.1803922, 1,
1.912671, 1.252463, 1.276525, 1, 0, 0.172549, 1,
1.949599, -1.099967, 1.219645, 1, 0, 0.1686275, 1,
1.956797, -1.273045, 1.47191, 1, 0, 0.1607843, 1,
1.958803, 1.582255, -0.8962692, 1, 0, 0.1568628, 1,
1.9595, -0.4794918, 0.9828547, 1, 0, 0.1490196, 1,
1.974712, 1.983885, -0.7532488, 1, 0, 0.145098, 1,
2.024502, -0.0306129, 0.6883038, 1, 0, 0.1372549, 1,
2.074207, -1.019632, 2.491225, 1, 0, 0.1333333, 1,
2.09489, 0.7107223, 0.7142894, 1, 0, 0.1254902, 1,
2.09749, -0.5306863, 1.545146, 1, 0, 0.1215686, 1,
2.10236, -1.371359, 2.421577, 1, 0, 0.1137255, 1,
2.132072, 1.112499, 0.3096714, 1, 0, 0.1098039, 1,
2.163674, -0.4437551, 2.39079, 1, 0, 0.1019608, 1,
2.199496, 0.4211688, 1.251614, 1, 0, 0.09411765, 1,
2.208605, -0.7739357, 2.80875, 1, 0, 0.09019608, 1,
2.214716, 0.8697927, 1.709713, 1, 0, 0.08235294, 1,
2.284754, 0.13875, 2.468256, 1, 0, 0.07843138, 1,
2.287486, 0.2272188, 1.688846, 1, 0, 0.07058824, 1,
2.341001, -1.647119, 2.789194, 1, 0, 0.06666667, 1,
2.361481, 1.371867, 0.8843815, 1, 0, 0.05882353, 1,
2.362717, 1.082587, -1.951967, 1, 0, 0.05490196, 1,
2.369523, -0.4262346, 1.820433, 1, 0, 0.04705882, 1,
2.402156, -0.5531048, 1.817849, 1, 0, 0.04313726, 1,
2.442539, 0.5899667, 0.6716695, 1, 0, 0.03529412, 1,
2.470388, 0.1691299, 3.343651, 1, 0, 0.03137255, 1,
2.565904, 1.243171, -0.2197731, 1, 0, 0.02352941, 1,
2.755707, 0.2894469, -1.049991, 1, 0, 0.01960784, 1,
2.763915, -0.6478002, 3.018931, 1, 0, 0.01176471, 1,
2.87523, -1.590417, 3.516291, 1, 0, 0.007843138, 1
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
0.01418996, -4.929284, -7.313834, 0, -0.5, 0.5, 0.5,
0.01418996, -4.929284, -7.313834, 1, -0.5, 0.5, 0.5,
0.01418996, -4.929284, -7.313834, 1, 1.5, 0.5, 0.5,
0.01418996, -4.929284, -7.313834, 0, 1.5, 0.5, 0.5
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
-3.816743, -0.3640046, -7.313834, 0, -0.5, 0.5, 0.5,
-3.816743, -0.3640046, -7.313834, 1, -0.5, 0.5, 0.5,
-3.816743, -0.3640046, -7.313834, 1, 1.5, 0.5, 0.5,
-3.816743, -0.3640046, -7.313834, 0, 1.5, 0.5, 0.5
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
-3.816743, -4.929284, 0.05571389, 0, -0.5, 0.5, 0.5,
-3.816743, -4.929284, 0.05571389, 1, -0.5, 0.5, 0.5,
-3.816743, -4.929284, 0.05571389, 1, 1.5, 0.5, 0.5,
-3.816743, -4.929284, 0.05571389, 0, 1.5, 0.5, 0.5
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
-2, -3.875758, -5.613169,
2, -3.875758, -5.613169,
-2, -3.875758, -5.613169,
-2, -4.051345, -5.896613,
-1, -3.875758, -5.613169,
-1, -4.051345, -5.896613,
0, -3.875758, -5.613169,
0, -4.051345, -5.896613,
1, -3.875758, -5.613169,
1, -4.051345, -5.896613,
2, -3.875758, -5.613169,
2, -4.051345, -5.896613
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
-2, -4.402521, -6.463501, 0, -0.5, 0.5, 0.5,
-2, -4.402521, -6.463501, 1, -0.5, 0.5, 0.5,
-2, -4.402521, -6.463501, 1, 1.5, 0.5, 0.5,
-2, -4.402521, -6.463501, 0, 1.5, 0.5, 0.5,
-1, -4.402521, -6.463501, 0, -0.5, 0.5, 0.5,
-1, -4.402521, -6.463501, 1, -0.5, 0.5, 0.5,
-1, -4.402521, -6.463501, 1, 1.5, 0.5, 0.5,
-1, -4.402521, -6.463501, 0, 1.5, 0.5, 0.5,
0, -4.402521, -6.463501, 0, -0.5, 0.5, 0.5,
0, -4.402521, -6.463501, 1, -0.5, 0.5, 0.5,
0, -4.402521, -6.463501, 1, 1.5, 0.5, 0.5,
0, -4.402521, -6.463501, 0, 1.5, 0.5, 0.5,
1, -4.402521, -6.463501, 0, -0.5, 0.5, 0.5,
1, -4.402521, -6.463501, 1, -0.5, 0.5, 0.5,
1, -4.402521, -6.463501, 1, 1.5, 0.5, 0.5,
1, -4.402521, -6.463501, 0, 1.5, 0.5, 0.5,
2, -4.402521, -6.463501, 0, -0.5, 0.5, 0.5,
2, -4.402521, -6.463501, 1, -0.5, 0.5, 0.5,
2, -4.402521, -6.463501, 1, 1.5, 0.5, 0.5,
2, -4.402521, -6.463501, 0, 1.5, 0.5, 0.5
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
-2.932682, -3, -5.613169,
-2.932682, 3, -5.613169,
-2.932682, -3, -5.613169,
-3.080025, -3, -5.896613,
-2.932682, -2, -5.613169,
-3.080025, -2, -5.896613,
-2.932682, -1, -5.613169,
-3.080025, -1, -5.896613,
-2.932682, 0, -5.613169,
-3.080025, 0, -5.896613,
-2.932682, 1, -5.613169,
-3.080025, 1, -5.896613,
-2.932682, 2, -5.613169,
-3.080025, 2, -5.896613,
-2.932682, 3, -5.613169,
-3.080025, 3, -5.896613
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
-3.374712, -3, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, -3, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, -3, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, -3, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, -2, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, -2, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, -2, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, -2, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, -1, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, -1, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, -1, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, -1, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, 0, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, 0, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, 0, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, 0, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, 1, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, 1, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, 1, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, 1, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, 2, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, 2, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, 2, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, 2, -6.463501, 0, 1.5, 0.5, 0.5,
-3.374712, 3, -6.463501, 0, -0.5, 0.5, 0.5,
-3.374712, 3, -6.463501, 1, -0.5, 0.5, 0.5,
-3.374712, 3, -6.463501, 1, 1.5, 0.5, 0.5,
-3.374712, 3, -6.463501, 0, 1.5, 0.5, 0.5
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
-2.932682, -3.875758, -4,
-2.932682, -3.875758, 4,
-2.932682, -3.875758, -4,
-3.080025, -4.051345, -4,
-2.932682, -3.875758, -2,
-3.080025, -4.051345, -2,
-2.932682, -3.875758, 0,
-3.080025, -4.051345, 0,
-2.932682, -3.875758, 2,
-3.080025, -4.051345, 2,
-2.932682, -3.875758, 4,
-3.080025, -4.051345, 4
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
-3.374712, -4.402521, -4, 0, -0.5, 0.5, 0.5,
-3.374712, -4.402521, -4, 1, -0.5, 0.5, 0.5,
-3.374712, -4.402521, -4, 1, 1.5, 0.5, 0.5,
-3.374712, -4.402521, -4, 0, 1.5, 0.5, 0.5,
-3.374712, -4.402521, -2, 0, -0.5, 0.5, 0.5,
-3.374712, -4.402521, -2, 1, -0.5, 0.5, 0.5,
-3.374712, -4.402521, -2, 1, 1.5, 0.5, 0.5,
-3.374712, -4.402521, -2, 0, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 0, 0, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 0, 1, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 0, 1, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 0, 0, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 2, 0, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 2, 1, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 2, 1, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 2, 0, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 4, 0, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 4, 1, -0.5, 0.5, 0.5,
-3.374712, -4.402521, 4, 1, 1.5, 0.5, 0.5,
-3.374712, -4.402521, 4, 0, 1.5, 0.5, 0.5
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
-2.932682, -3.875758, -5.613169,
-2.932682, 3.147748, -5.613169,
-2.932682, -3.875758, 5.724597,
-2.932682, 3.147748, 5.724597,
-2.932682, -3.875758, -5.613169,
-2.932682, -3.875758, 5.724597,
-2.932682, 3.147748, -5.613169,
-2.932682, 3.147748, 5.724597,
-2.932682, -3.875758, -5.613169,
2.961061, -3.875758, -5.613169,
-2.932682, -3.875758, 5.724597,
2.961061, -3.875758, 5.724597,
-2.932682, 3.147748, -5.613169,
2.961061, 3.147748, -5.613169,
-2.932682, 3.147748, 5.724597,
2.961061, 3.147748, 5.724597,
2.961061, -3.875758, -5.613169,
2.961061, 3.147748, -5.613169,
2.961061, -3.875758, 5.724597,
2.961061, 3.147748, 5.724597,
2.961061, -3.875758, -5.613169,
2.961061, -3.875758, 5.724597,
2.961061, 3.147748, -5.613169,
2.961061, 3.147748, 5.724597
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
var radius = 7.786066;
var distance = 34.64109;
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
mvMatrix.translate( -0.01418996, 0.3640046, -0.05571389 );
mvMatrix.scale( 1.42837, 1.19861, 0.7425138 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.64109);
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
manganese_ethylenebi<-read.table("manganese_ethylenebi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-manganese_ethylenebi$V2
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
y<-manganese_ethylenebi$V3
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
z<-manganese_ethylenebi$V4
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
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
-2.84685, -0.4782066, -1.484818, 0, 0, 1, 1, 1,
-2.648576, -0.09440476, -2.200159, 1, 0, 0, 1, 1,
-2.600814, -0.7819496, -1.21414, 1, 0, 0, 1, 1,
-2.555869, -0.3417792, -2.819235, 1, 0, 0, 1, 1,
-2.546967, -0.4099069, -1.477063, 1, 0, 0, 1, 1,
-2.487869, 1.12855, -2.498353, 1, 0, 0, 1, 1,
-2.441996, 0.3282147, -0.1360279, 0, 0, 0, 1, 1,
-2.430888, 0.3411416, -3.113138, 0, 0, 0, 1, 1,
-2.385224, -0.3828624, -0.9545432, 0, 0, 0, 1, 1,
-2.368664, 0.3254323, -1.089737, 0, 0, 0, 1, 1,
-2.322769, -0.5039428, -1.008531, 0, 0, 0, 1, 1,
-2.30429, 0.7607288, -1.499907, 0, 0, 0, 1, 1,
-2.279386, -0.9280343, -0.6397817, 0, 0, 0, 1, 1,
-2.266195, 0.3786717, -1.832218, 1, 1, 1, 1, 1,
-2.23033, -1.047253, -2.974424, 1, 1, 1, 1, 1,
-2.215356, -0.1456068, -1.728231, 1, 1, 1, 1, 1,
-2.204583, 0.02565059, -3.375241, 1, 1, 1, 1, 1,
-2.202389, 0.03096941, -2.809895, 1, 1, 1, 1, 1,
-2.197377, -0.263321, -1.721429, 1, 1, 1, 1, 1,
-2.157057, -0.6575866, -2.082202, 1, 1, 1, 1, 1,
-2.150337, 0.5975976, -2.907319, 1, 1, 1, 1, 1,
-2.147429, 0.194401, -0.9363527, 1, 1, 1, 1, 1,
-2.139884, -0.1507632, -0.6864414, 1, 1, 1, 1, 1,
-2.06911, 1.033168, -2.152305, 1, 1, 1, 1, 1,
-2.055977, 0.8500299, -0.2392509, 1, 1, 1, 1, 1,
-2.034119, 0.9602299, -0.2665207, 1, 1, 1, 1, 1,
-2.014949, 1.016153, -2.784142, 1, 1, 1, 1, 1,
-2.014608, 1.163499, -2.390897, 1, 1, 1, 1, 1,
-2.010394, 1.906853, -2.297246, 0, 0, 1, 1, 1,
-1.983928, -0.4147588, -0.1259281, 1, 0, 0, 1, 1,
-1.932932, 1.298361, -0.8035766, 1, 0, 0, 1, 1,
-1.932342, -1.90803, -1.829654, 1, 0, 0, 1, 1,
-1.926024, -0.0455003, -1.087341, 1, 0, 0, 1, 1,
-1.913853, -0.6810484, -4.241013, 1, 0, 0, 1, 1,
-1.901729, 1.354325, -1.5192, 0, 0, 0, 1, 1,
-1.860546, -0.8548743, -1.829714, 0, 0, 0, 1, 1,
-1.840242, -1.668731, -2.011515, 0, 0, 0, 1, 1,
-1.831802, -0.07446203, -2.067599, 0, 0, 0, 1, 1,
-1.818075, 0.7069016, -0.3981207, 0, 0, 0, 1, 1,
-1.802245, 0.01073779, -1.852128, 0, 0, 0, 1, 1,
-1.776639, 1.694273, -0.3664857, 0, 0, 0, 1, 1,
-1.766027, -1.20369, -2.909181, 1, 1, 1, 1, 1,
-1.761126, -1.110383, -2.419652, 1, 1, 1, 1, 1,
-1.756111, 0.7210745, -0.9382195, 1, 1, 1, 1, 1,
-1.742352, 0.3756478, -4.337985, 1, 1, 1, 1, 1,
-1.727407, -1.148771, -2.890097, 1, 1, 1, 1, 1,
-1.722485, -1.469308, -2.748304, 1, 1, 1, 1, 1,
-1.716212, -0.5243509, -2.099698, 1, 1, 1, 1, 1,
-1.714178, -0.3056284, -2.465548, 1, 1, 1, 1, 1,
-1.697681, -1.325252, -2.111326, 1, 1, 1, 1, 1,
-1.69282, -2.293974, -2.719479, 1, 1, 1, 1, 1,
-1.662572, -0.1930245, -1.143468, 1, 1, 1, 1, 1,
-1.649546, 1.334602, -0.05280781, 1, 1, 1, 1, 1,
-1.642718, -2.358503, -1.476787, 1, 1, 1, 1, 1,
-1.622266, -0.159009, -1.574769, 1, 1, 1, 1, 1,
-1.618101, 0.509192, -2.380139, 1, 1, 1, 1, 1,
-1.594492, 2.226497, -0.3368481, 0, 0, 1, 1, 1,
-1.593582, -1.136307, -2.187402, 1, 0, 0, 1, 1,
-1.588898, -0.2755345, -3.294881, 1, 0, 0, 1, 1,
-1.557961, 0.7531387, -1.264368, 1, 0, 0, 1, 1,
-1.554285, -0.1697167, -2.527439, 1, 0, 0, 1, 1,
-1.539304, 0.9366044, -2.947162, 1, 0, 0, 1, 1,
-1.529513, 0.6352211, -2.356425, 0, 0, 0, 1, 1,
-1.517381, 1.371474, -0.8684272, 0, 0, 0, 1, 1,
-1.513058, -1.939941, -2.001584, 0, 0, 0, 1, 1,
-1.498922, 0.2173356, -1.906992, 0, 0, 0, 1, 1,
-1.496716, -0.3481069, -1.004631, 0, 0, 0, 1, 1,
-1.481373, -0.3330516, -2.01188, 0, 0, 0, 1, 1,
-1.477768, 0.1667781, -2.501612, 0, 0, 0, 1, 1,
-1.474804, 3.045465, 0.5200841, 1, 1, 1, 1, 1,
-1.473228, 0.01289408, -1.803694, 1, 1, 1, 1, 1,
-1.472265, -0.7007851, -1.544649, 1, 1, 1, 1, 1,
-1.463579, -1.309234, -4.043401, 1, 1, 1, 1, 1,
-1.462326, -0.4781539, -2.554344, 1, 1, 1, 1, 1,
-1.456309, 0.6193826, -0.7091684, 1, 1, 1, 1, 1,
-1.438781, -0.03479449, -0.8817247, 1, 1, 1, 1, 1,
-1.437761, 2.71781, 0.4586466, 1, 1, 1, 1, 1,
-1.434989, -0.8520227, -1.281399, 1, 1, 1, 1, 1,
-1.42487, -1.049997, -1.336141, 1, 1, 1, 1, 1,
-1.406452, 0.2106647, -0.7415545, 1, 1, 1, 1, 1,
-1.402553, -0.9660634, -2.550413, 1, 1, 1, 1, 1,
-1.401371, 0.8311082, -2.212454, 1, 1, 1, 1, 1,
-1.393823, 1.047773, 1.129582, 1, 1, 1, 1, 1,
-1.392154, -0.4424003, -3.286678, 1, 1, 1, 1, 1,
-1.387528, 0.5151405, -2.686435, 0, 0, 1, 1, 1,
-1.374808, 0.5213313, -2.660119, 1, 0, 0, 1, 1,
-1.373386, 0.6443167, -1.779005, 1, 0, 0, 1, 1,
-1.366532, 0.2847463, -1.592725, 1, 0, 0, 1, 1,
-1.358865, 0.3173293, -1.802811, 1, 0, 0, 1, 1,
-1.354445, -1.02594, -2.686718, 1, 0, 0, 1, 1,
-1.352917, -0.7465344, -1.42516, 0, 0, 0, 1, 1,
-1.350655, -0.3025716, -2.455096, 0, 0, 0, 1, 1,
-1.345575, -0.448499, -3.269279, 0, 0, 0, 1, 1,
-1.343424, -0.3027152, -2.053536, 0, 0, 0, 1, 1,
-1.336687, 1.838449, 0.4303609, 0, 0, 0, 1, 1,
-1.327119, 0.378303, -1.632889, 0, 0, 0, 1, 1,
-1.321331, -0.3779572, -2.420616, 0, 0, 0, 1, 1,
-1.320278, 1.076093, -1.946843, 1, 1, 1, 1, 1,
-1.319807, 0.821753, -0.3280042, 1, 1, 1, 1, 1,
-1.318811, 2.116676, -1.112958, 1, 1, 1, 1, 1,
-1.318596, 0.6376351, -0.6214187, 1, 1, 1, 1, 1,
-1.318197, -0.0036961, -2.817102, 1, 1, 1, 1, 1,
-1.317263, 0.4114722, -3.054171, 1, 1, 1, 1, 1,
-1.315777, 0.6676592, -1.975279, 1, 1, 1, 1, 1,
-1.312828, -0.00685554, -0.5797787, 1, 1, 1, 1, 1,
-1.30359, 1.13303, -1.482006, 1, 1, 1, 1, 1,
-1.300909, 0.2168935, -2.468478, 1, 1, 1, 1, 1,
-1.292465, 0.974933, -1.223921, 1, 1, 1, 1, 1,
-1.28494, -1.842528, -2.141689, 1, 1, 1, 1, 1,
-1.275519, 0.1131472, -1.945856, 1, 1, 1, 1, 1,
-1.262384, -0.8086885, -3.078477, 1, 1, 1, 1, 1,
-1.25553, 0.7361728, -0.4025735, 1, 1, 1, 1, 1,
-1.250306, -0.1490836, -2.496194, 0, 0, 1, 1, 1,
-1.249728, 0.223828, -2.410712, 1, 0, 0, 1, 1,
-1.232918, 0.1276711, -0.8422129, 1, 0, 0, 1, 1,
-1.232232, 1.107429, -0.2956486, 1, 0, 0, 1, 1,
-1.224039, -1.620512, -3.467554, 1, 0, 0, 1, 1,
-1.221411, 0.9694199, -1.784493, 1, 0, 0, 1, 1,
-1.212151, 0.4534212, -2.065261, 0, 0, 0, 1, 1,
-1.204939, 1.299068, 0.1412406, 0, 0, 0, 1, 1,
-1.204749, -1.066249, -1.868801, 0, 0, 0, 1, 1,
-1.191416, 0.4374441, -1.26703, 0, 0, 0, 1, 1,
-1.184158, -0.4346441, -3.082317, 0, 0, 0, 1, 1,
-1.183015, -1.000926, -3.167224, 0, 0, 0, 1, 1,
-1.182888, 0.3206895, -1.120315, 0, 0, 0, 1, 1,
-1.174619, -0.307267, -3.507441, 1, 1, 1, 1, 1,
-1.170732, 0.5124494, -2.079283, 1, 1, 1, 1, 1,
-1.167382, -0.7968856, -3.299598, 1, 1, 1, 1, 1,
-1.16451, -0.3205529, -0.1111295, 1, 1, 1, 1, 1,
-1.144502, 0.835479, -1.341212, 1, 1, 1, 1, 1,
-1.133968, -0.2148403, -2.756961, 1, 1, 1, 1, 1,
-1.129695, -0.1947891, -1.808254, 1, 1, 1, 1, 1,
-1.129076, 0.7564871, 0.1722245, 1, 1, 1, 1, 1,
-1.12403, 1.422828, -2.300039, 1, 1, 1, 1, 1,
-1.123258, -0.440059, -2.327905, 1, 1, 1, 1, 1,
-1.122348, -0.3260587, -3.189579, 1, 1, 1, 1, 1,
-1.119997, -0.009259203, -2.002445, 1, 1, 1, 1, 1,
-1.119959, -0.889309, -2.287085, 1, 1, 1, 1, 1,
-1.113839, 1.24102, -1.092612, 1, 1, 1, 1, 1,
-1.103086, 0.01636999, -0.9675679, 1, 1, 1, 1, 1,
-1.09544, -0.5073503, -2.617297, 0, 0, 1, 1, 1,
-1.074808, -0.4814987, -1.332047, 1, 0, 0, 1, 1,
-1.065644, 1.464884, 2.491277, 1, 0, 0, 1, 1,
-1.06533, 0.3807324, -1.668631, 1, 0, 0, 1, 1,
-1.056752, 0.6610406, -0.3919291, 1, 0, 0, 1, 1,
-1.055645, -1.215667, -4.931877, 1, 0, 0, 1, 1,
-1.052269, -1.134308, -0.1108706, 0, 0, 0, 1, 1,
-1.042426, -1.748772, -1.225732, 0, 0, 0, 1, 1,
-1.034206, 1.378239, -0.2521923, 0, 0, 0, 1, 1,
-1.030997, 0.0209001, -1.494429, 0, 0, 0, 1, 1,
-1.029771, -1.213874, -1.878628, 0, 0, 0, 1, 1,
-1.01858, 2.012961, -1.406477, 0, 0, 0, 1, 1,
-1.017866, -0.6590578, -3.489858, 0, 0, 0, 1, 1,
-1.016966, 0.3425113, -1.242159, 1, 1, 1, 1, 1,
-1.012048, 0.1964047, 0.06344483, 1, 1, 1, 1, 1,
-1.010008, -0.2107602, -0.7795688, 1, 1, 1, 1, 1,
-1.007642, -0.401787, -1.744749, 1, 1, 1, 1, 1,
-1.006316, -0.06487258, -1.613768, 1, 1, 1, 1, 1,
-1.005598, -1.447512, -1.56688, 1, 1, 1, 1, 1,
-1.003344, 0.4842576, -1.087377, 1, 1, 1, 1, 1,
-1.00253, -1.570187, -3.788872, 1, 1, 1, 1, 1,
-1.001562, 0.336918, -0.04168943, 1, 1, 1, 1, 1,
-0.9984511, 1.814783, -0.5041576, 1, 1, 1, 1, 1,
-0.9911705, -2.369133, -1.344055, 1, 1, 1, 1, 1,
-0.9827406, 0.2915344, -1.031493, 1, 1, 1, 1, 1,
-0.9719935, -0.03829192, -3.167169, 1, 1, 1, 1, 1,
-0.971936, 1.635176, -0.5622957, 1, 1, 1, 1, 1,
-0.9643433, -1.27877, -3.24753, 1, 1, 1, 1, 1,
-0.9532786, -0.3757518, -1.67995, 0, 0, 1, 1, 1,
-0.9514309, -1.138369, -1.855343, 1, 0, 0, 1, 1,
-0.9452409, 2.878536, 0.09071726, 1, 0, 0, 1, 1,
-0.9405893, 1.827664, 0.2147371, 1, 0, 0, 1, 1,
-0.9398064, 1.314687, 0.5827038, 1, 0, 0, 1, 1,
-0.9282961, -0.3001297, -1.517602, 1, 0, 0, 1, 1,
-0.9270979, -0.8990176, -1.588108, 0, 0, 0, 1, 1,
-0.9264997, 1.210654, 1.089091, 0, 0, 0, 1, 1,
-0.9198976, 0.7719727, 0.05402816, 0, 0, 0, 1, 1,
-0.9197943, 1.08399, -1.185334, 0, 0, 0, 1, 1,
-0.9191942, 0.4820666, 1.704956, 0, 0, 0, 1, 1,
-0.9168281, -0.6661369, -2.883473, 0, 0, 0, 1, 1,
-0.9115666, 1.82916, -1.61738, 0, 0, 0, 1, 1,
-0.909433, -1.078614, -2.272991, 1, 1, 1, 1, 1,
-0.9076915, -1.237557, -2.033704, 1, 1, 1, 1, 1,
-0.9029654, 0.2783791, -2.662464, 1, 1, 1, 1, 1,
-0.8992614, 1.773408, -0.5818636, 1, 1, 1, 1, 1,
-0.884352, 0.9091619, 0.2790096, 1, 1, 1, 1, 1,
-0.8815219, -0.7856189, -3.525713, 1, 1, 1, 1, 1,
-0.8804033, -0.844757, -2.057104, 1, 1, 1, 1, 1,
-0.8792964, 0.2119289, -0.9988127, 1, 1, 1, 1, 1,
-0.8792537, 0.5026699, -2.131559, 1, 1, 1, 1, 1,
-0.8779225, -0.4701339, -1.238415, 1, 1, 1, 1, 1,
-0.8768319, -0.6349597, -2.336877, 1, 1, 1, 1, 1,
-0.8753172, 0.1954277, -1.018362, 1, 1, 1, 1, 1,
-0.87271, -0.8042593, -2.370047, 1, 1, 1, 1, 1,
-0.8706207, -0.6717204, -0.9507045, 1, 1, 1, 1, 1,
-0.8668181, -0.5171719, -0.7859408, 1, 1, 1, 1, 1,
-0.8662692, 1.05136, -1.068152, 0, 0, 1, 1, 1,
-0.8624832, -2.176622, -1.10555, 1, 0, 0, 1, 1,
-0.8606976, 1.950559, 0.9422728, 1, 0, 0, 1, 1,
-0.8520628, -0.9763674, -2.938857, 1, 0, 0, 1, 1,
-0.8497794, -0.2960337, -0.4917426, 1, 0, 0, 1, 1,
-0.8474747, -0.861405, -2.36596, 1, 0, 0, 1, 1,
-0.8393486, 1.125466, 0.3246846, 0, 0, 0, 1, 1,
-0.8392843, 2.611481, -1.123157, 0, 0, 0, 1, 1,
-0.8204345, 1.848843, -0.7348748, 0, 0, 0, 1, 1,
-0.8171493, 1.648497, -0.1602145, 0, 0, 0, 1, 1,
-0.8137823, 0.544511, -1.488148, 0, 0, 0, 1, 1,
-0.8133526, 1.163228, -0.1674242, 0, 0, 0, 1, 1,
-0.8125948, 0.3264529, -0.4058352, 0, 0, 0, 1, 1,
-0.8125038, -0.3839348, -1.645429, 1, 1, 1, 1, 1,
-0.8108885, -1.375534, -3.666977, 1, 1, 1, 1, 1,
-0.8083609, -0.7068976, -1.839586, 1, 1, 1, 1, 1,
-0.8049436, 1.550719, -0.3888724, 1, 1, 1, 1, 1,
-0.7983372, 0.863005, -0.2070516, 1, 1, 1, 1, 1,
-0.7956332, 0.1967491, -1.628972, 1, 1, 1, 1, 1,
-0.7955933, -0.9658754, -3.03687, 1, 1, 1, 1, 1,
-0.7954463, -0.3105742, -1.196935, 1, 1, 1, 1, 1,
-0.7945499, 0.6777105, -2.320607, 1, 1, 1, 1, 1,
-0.7907805, -1.006079, -2.546062, 1, 1, 1, 1, 1,
-0.7896075, 1.012123, -1.228013, 1, 1, 1, 1, 1,
-0.7882732, -0.3869874, -3.276668, 1, 1, 1, 1, 1,
-0.7877341, -0.6090391, -2.870331, 1, 1, 1, 1, 1,
-0.7828341, 0.8149205, -3.311168, 1, 1, 1, 1, 1,
-0.779215, 0.9288348, -1.494627, 1, 1, 1, 1, 1,
-0.7761582, -0.7481141, -3.433499, 0, 0, 1, 1, 1,
-0.7734056, -0.5652983, -2.238858, 1, 0, 0, 1, 1,
-0.7677704, 0.3149558, 0.478108, 1, 0, 0, 1, 1,
-0.7671376, -1.001834, -3.06019, 1, 0, 0, 1, 1,
-0.763368, 0.006871635, -2.054574, 1, 0, 0, 1, 1,
-0.7615713, 0.0638497, 0.05911022, 1, 0, 0, 1, 1,
-0.7583415, 0.3575202, -1.603887, 0, 0, 0, 1, 1,
-0.7542296, -0.7102384, -1.278742, 0, 0, 0, 1, 1,
-0.7535431, -1.005846, -2.284792, 0, 0, 0, 1, 1,
-0.751923, -0.8618719, -2.295459, 0, 0, 0, 1, 1,
-0.7516837, -0.2926085, -1.049181, 0, 0, 0, 1, 1,
-0.7450877, -0.303539, -1.649511, 0, 0, 0, 1, 1,
-0.74494, -0.9673868, -1.7206, 0, 0, 0, 1, 1,
-0.7418396, -0.9897141, -1.622007, 1, 1, 1, 1, 1,
-0.7414023, -1.770521, -1.504329, 1, 1, 1, 1, 1,
-0.7315896, -0.1679135, -1.715927, 1, 1, 1, 1, 1,
-0.7300601, 1.153042, -0.6438656, 1, 1, 1, 1, 1,
-0.7247409, -0.8299304, -2.043486, 1, 1, 1, 1, 1,
-0.7230026, 1.087839, -0.272763, 1, 1, 1, 1, 1,
-0.7224681, 1.015824, 0.4941024, 1, 1, 1, 1, 1,
-0.7149949, 0.2606388, 0.451103, 1, 1, 1, 1, 1,
-0.7054214, 0.1413269, -0.8187624, 1, 1, 1, 1, 1,
-0.7028939, -0.09669377, -1.124422, 1, 1, 1, 1, 1,
-0.7013019, -0.07575451, 0.03816906, 1, 1, 1, 1, 1,
-0.6988199, 0.07103556, -0.08517853, 1, 1, 1, 1, 1,
-0.6972874, 1.815586, 1.455545, 1, 1, 1, 1, 1,
-0.6965464, 0.6743154, -0.4544886, 1, 1, 1, 1, 1,
-0.6954529, 1.339012, 1.800173, 1, 1, 1, 1, 1,
-0.6908116, 3.028447, -1.502104, 0, 0, 1, 1, 1,
-0.6866229, 0.748913, -0.4007067, 1, 0, 0, 1, 1,
-0.6782717, 1.44081, 0.9438622, 1, 0, 0, 1, 1,
-0.6654515, 0.9033535, -1.859094, 1, 0, 0, 1, 1,
-0.6640058, 0.6239862, -0.2592619, 1, 0, 0, 1, 1,
-0.6624177, -1.829566, -4.18664, 1, 0, 0, 1, 1,
-0.6623964, 1.244401, 1.040591, 0, 0, 0, 1, 1,
-0.6563265, -1.510442, -2.615581, 0, 0, 0, 1, 1,
-0.6561128, 1.403706, 0.07967223, 0, 0, 0, 1, 1,
-0.6523362, 1.301392, -0.6340644, 0, 0, 0, 1, 1,
-0.6498185, 0.3127239, -2.199591, 0, 0, 0, 1, 1,
-0.6441648, 0.5204684, -3.614026, 0, 0, 0, 1, 1,
-0.6354776, 0.1690485, -1.903147, 0, 0, 0, 1, 1,
-0.6329896, -0.07249858, -0.4477814, 1, 1, 1, 1, 1,
-0.6270673, 2.752726, 0.3568178, 1, 1, 1, 1, 1,
-0.6228573, -0.2327766, -3.007034, 1, 1, 1, 1, 1,
-0.6198434, -1.08163, -2.907073, 1, 1, 1, 1, 1,
-0.6163267, -0.02815452, -1.628898, 1, 1, 1, 1, 1,
-0.6122364, 0.5412414, -0.1426633, 1, 1, 1, 1, 1,
-0.6083163, 0.8508527, -3.21378, 1, 1, 1, 1, 1,
-0.5997791, 0.02348416, -1.498235, 1, 1, 1, 1, 1,
-0.5982234, 0.6757857, -0.1887494, 1, 1, 1, 1, 1,
-0.5938709, 0.1489378, -0.8775452, 1, 1, 1, 1, 1,
-0.5920023, -0.4645072, -2.841903, 1, 1, 1, 1, 1,
-0.5853097, -0.6324112, -2.784189, 1, 1, 1, 1, 1,
-0.5808534, 0.2832514, -2.225482, 1, 1, 1, 1, 1,
-0.578209, -0.1933636, -1.189127, 1, 1, 1, 1, 1,
-0.5738996, -1.102594, -2.324193, 1, 1, 1, 1, 1,
-0.5737637, -0.03188699, 0.1671029, 0, 0, 1, 1, 1,
-0.5699492, -0.4300019, -2.432984, 1, 0, 0, 1, 1,
-0.5668972, 1.30754, -0.6078377, 1, 0, 0, 1, 1,
-0.5619497, 1.50806, -0.4919779, 1, 0, 0, 1, 1,
-0.5595179, -1.345335, -1.949941, 1, 0, 0, 1, 1,
-0.5575593, 1.708355, -0.1767492, 1, 0, 0, 1, 1,
-0.5547692, 0.6474715, -1.367978, 0, 0, 0, 1, 1,
-0.5544029, -0.1025928, -3.09211, 0, 0, 0, 1, 1,
-0.5540939, 0.2527649, 0.1768171, 0, 0, 0, 1, 1,
-0.553286, -0.2687861, -3.191266, 0, 0, 0, 1, 1,
-0.5516204, -1.117084, -0.8399825, 0, 0, 0, 1, 1,
-0.5370442, -1.003482, -3.290132, 0, 0, 0, 1, 1,
-0.5348379, -2.392077, -2.702914, 0, 0, 0, 1, 1,
-0.5269949, 1.177765, 1.050189, 1, 1, 1, 1, 1,
-0.526035, -0.5061663, -1.823417, 1, 1, 1, 1, 1,
-0.5240818, -0.09490593, -1.143448, 1, 1, 1, 1, 1,
-0.5173331, -0.06608924, -2.754743, 1, 1, 1, 1, 1,
-0.5157034, 0.4867465, -0.5458793, 1, 1, 1, 1, 1,
-0.5141881, -1.807204, -2.564781, 1, 1, 1, 1, 1,
-0.5101408, 1.065507, 0.6938828, 1, 1, 1, 1, 1,
-0.5093451, -0.8562411, -3.996681, 1, 1, 1, 1, 1,
-0.5091668, 0.4304888, -0.5312374, 1, 1, 1, 1, 1,
-0.5065604, 0.5091699, -1.183876, 1, 1, 1, 1, 1,
-0.5029954, -0.2874126, -1.654053, 1, 1, 1, 1, 1,
-0.4983769, 0.7510687, -0.03883009, 1, 1, 1, 1, 1,
-0.4870826, -1.849262, -3.354814, 1, 1, 1, 1, 1,
-0.4868265, 0.4698394, -3.067041, 1, 1, 1, 1, 1,
-0.4865426, 0.5177346, -3.527785, 1, 1, 1, 1, 1,
-0.4846064, 1.477799, -0.8359507, 0, 0, 1, 1, 1,
-0.4694117, -0.1583916, -2.455438, 1, 0, 0, 1, 1,
-0.4674971, -0.3993756, -2.887377, 1, 0, 0, 1, 1,
-0.4671706, 0.1709459, -0.8183091, 1, 0, 0, 1, 1,
-0.4650646, -0.4578708, -1.426506, 1, 0, 0, 1, 1,
-0.4622013, -0.8051936, -2.770207, 1, 0, 0, 1, 1,
-0.4609597, -0.5932496, -1.831339, 0, 0, 0, 1, 1,
-0.4586267, -0.6928617, -3.204773, 0, 0, 0, 1, 1,
-0.4533268, -0.4733072, -2.208654, 0, 0, 0, 1, 1,
-0.4490758, 0.6221346, -1.530109, 0, 0, 0, 1, 1,
-0.447034, -0.2343808, -1.296471, 0, 0, 0, 1, 1,
-0.4456667, 0.6978067, -1.487071, 0, 0, 0, 1, 1,
-0.4430129, 0.2086478, -1.618512, 0, 0, 0, 1, 1,
-0.4377467, 0.3213625, -2.651294, 1, 1, 1, 1, 1,
-0.4368141, -0.4188976, -3.551507, 1, 1, 1, 1, 1,
-0.4367813, 0.01418111, -1.945528, 1, 1, 1, 1, 1,
-0.4367095, -0.0239423, -1.678587, 1, 1, 1, 1, 1,
-0.4339592, 0.982424, -0.8333168, 1, 1, 1, 1, 1,
-0.4297829, 0.5172088, -1.735408, 1, 1, 1, 1, 1,
-0.4288234, -1.15676, -5.448056, 1, 1, 1, 1, 1,
-0.4286034, 0.4358138, -1.796844, 1, 1, 1, 1, 1,
-0.4252983, -0.2250765, -2.929305, 1, 1, 1, 1, 1,
-0.4247463, 0.8154896, -0.7421837, 1, 1, 1, 1, 1,
-0.4244259, -0.2383896, -2.079912, 1, 1, 1, 1, 1,
-0.4236214, -0.7041723, -3.965894, 1, 1, 1, 1, 1,
-0.4207718, 0.6580812, -0.2013648, 1, 1, 1, 1, 1,
-0.4204135, -1.151913, -1.723368, 1, 1, 1, 1, 1,
-0.4181569, 0.289851, -2.135466, 1, 1, 1, 1, 1,
-0.4163144, -0.1783085, -2.454179, 0, 0, 1, 1, 1,
-0.4161407, -0.4206838, -1.342896, 1, 0, 0, 1, 1,
-0.4134817, 0.728333, -0.5456101, 1, 0, 0, 1, 1,
-0.4096535, -0.7449785, -3.391682, 1, 0, 0, 1, 1,
-0.4095217, 0.9379501, -0.8272817, 1, 0, 0, 1, 1,
-0.4053712, -0.4515063, -5.369784, 1, 0, 0, 1, 1,
-0.4013542, -1.16112, -4.089465, 0, 0, 0, 1, 1,
-0.3981458, -0.664005, -0.9859397, 0, 0, 0, 1, 1,
-0.3974229, 1.121837, -0.3296665, 0, 0, 0, 1, 1,
-0.392101, 0.4400685, -0.09972598, 0, 0, 0, 1, 1,
-0.3912551, 0.818653, -0.6230049, 0, 0, 0, 1, 1,
-0.3892192, -1.033296, -3.413297, 0, 0, 0, 1, 1,
-0.3891704, 1.678049, -0.5224473, 0, 0, 0, 1, 1,
-0.3870917, 0.5940397, -2.096456, 1, 1, 1, 1, 1,
-0.3866647, 0.1296646, -1.385705, 1, 1, 1, 1, 1,
-0.3865252, -1.415844, -3.174325, 1, 1, 1, 1, 1,
-0.384833, -0.7231048, -1.812793, 1, 1, 1, 1, 1,
-0.3797566, 0.1384832, -0.4827719, 1, 1, 1, 1, 1,
-0.3605907, 0.6438919, 0.3901482, 1, 1, 1, 1, 1,
-0.3585911, -1.255845, -0.7652598, 1, 1, 1, 1, 1,
-0.3583647, -0.5483853, -3.213405, 1, 1, 1, 1, 1,
-0.355424, 2.068708, 0.3875684, 1, 1, 1, 1, 1,
-0.3547367, -0.1616747, -3.052102, 1, 1, 1, 1, 1,
-0.3547218, -0.521183, -1.208514, 1, 1, 1, 1, 1,
-0.351992, 0.5117128, 0.1060238, 1, 1, 1, 1, 1,
-0.3413395, 0.5343236, -1.998062, 1, 1, 1, 1, 1,
-0.33541, -0.7902869, -3.269468, 1, 1, 1, 1, 1,
-0.3349023, 1.206639, 0.4960019, 1, 1, 1, 1, 1,
-0.3326526, -0.08769626, -0.5961071, 0, 0, 1, 1, 1,
-0.3326125, -1.662706, -3.49526, 1, 0, 0, 1, 1,
-0.3320931, -0.401784, -3.391403, 1, 0, 0, 1, 1,
-0.328618, -0.8503812, -4.08141, 1, 0, 0, 1, 1,
-0.3280058, 1.59293, -1.823306, 1, 0, 0, 1, 1,
-0.3278063, -1.289988, -0.983694, 1, 0, 0, 1, 1,
-0.3250179, -0.4597523, -1.754946, 0, 0, 0, 1, 1,
-0.3247509, 1.84288, -0.9014641, 0, 0, 0, 1, 1,
-0.3236375, -0.4028876, -1.956635, 0, 0, 0, 1, 1,
-0.3201214, 0.5871817, -2.402449, 0, 0, 0, 1, 1,
-0.319037, -0.6979699, -2.839613, 0, 0, 0, 1, 1,
-0.3186421, -1.308641, -2.246031, 0, 0, 0, 1, 1,
-0.3042871, 1.088548, -0.2123636, 0, 0, 0, 1, 1,
-0.3004767, 0.4458012, -0.8353598, 1, 1, 1, 1, 1,
-0.2986655, -0.781654, -3.657544, 1, 1, 1, 1, 1,
-0.2964431, 0.9628511, -0.7105505, 1, 1, 1, 1, 1,
-0.2962994, -0.1735681, -1.05914, 1, 1, 1, 1, 1,
-0.2954158, -1.759936, -3.566696, 1, 1, 1, 1, 1,
-0.2947434, -1.183019, -3.59314, 1, 1, 1, 1, 1,
-0.2929523, 0.1972927, -0.8564829, 1, 1, 1, 1, 1,
-0.2925834, -0.1152583, -3.762521, 1, 1, 1, 1, 1,
-0.2922107, 0.6101661, 0.5233032, 1, 1, 1, 1, 1,
-0.2848222, 0.4029102, -2.009675, 1, 1, 1, 1, 1,
-0.2821538, 0.01048322, -1.781189, 1, 1, 1, 1, 1,
-0.2796465, -1.462814, -2.706114, 1, 1, 1, 1, 1,
-0.2779253, 0.5170873, -0.2093432, 1, 1, 1, 1, 1,
-0.2767141, 0.2756349, -0.9017791, 1, 1, 1, 1, 1,
-0.2765854, -0.7646874, -3.090561, 1, 1, 1, 1, 1,
-0.2762362, 0.5483004, -0.4124487, 0, 0, 1, 1, 1,
-0.2754345, 1.401111, -1.701305, 1, 0, 0, 1, 1,
-0.2752148, -0.2669737, -2.704896, 1, 0, 0, 1, 1,
-0.2730095, -0.9818976, -3.832818, 1, 0, 0, 1, 1,
-0.2718141, -0.98657, -5.086847, 1, 0, 0, 1, 1,
-0.2706935, -0.2320066, -0.6601023, 1, 0, 0, 1, 1,
-0.26853, 0.1212434, -1.816072, 0, 0, 0, 1, 1,
-0.2660674, 1.796369, -2.00179, 0, 0, 0, 1, 1,
-0.2644224, -0.7990795, -1.649265, 0, 0, 0, 1, 1,
-0.2586337, -0.01551936, 0.6852765, 0, 0, 0, 1, 1,
-0.2512282, -0.01236935, -2.265691, 0, 0, 0, 1, 1,
-0.2493366, -1.527555, -2.354938, 0, 0, 0, 1, 1,
-0.2492625, -0.3087063, -2.475836, 0, 0, 0, 1, 1,
-0.2488441, -0.1278804, -2.060864, 1, 1, 1, 1, 1,
-0.2435776, 0.9305632, -1.964008, 1, 1, 1, 1, 1,
-0.2428588, -0.6303639, -3.534832, 1, 1, 1, 1, 1,
-0.2334232, -1.658608, -1.915763, 1, 1, 1, 1, 1,
-0.228393, -0.5586901, -1.085303, 1, 1, 1, 1, 1,
-0.2262458, -1.149, -2.615193, 1, 1, 1, 1, 1,
-0.2240915, -0.03967588, -3.242337, 1, 1, 1, 1, 1,
-0.2238791, 0.02010769, 0.6576603, 1, 1, 1, 1, 1,
-0.2180535, 0.1386351, -0.5891286, 1, 1, 1, 1, 1,
-0.2129133, 0.3006177, 0.05885126, 1, 1, 1, 1, 1,
-0.2118744, -1.117095, -2.822856, 1, 1, 1, 1, 1,
-0.2111413, 0.9300907, -0.258151, 1, 1, 1, 1, 1,
-0.2109731, 0.2906234, -0.2432932, 1, 1, 1, 1, 1,
-0.2096347, 0.7874554, -0.8664843, 1, 1, 1, 1, 1,
-0.2086571, -0.4862754, -3.938687, 1, 1, 1, 1, 1,
-0.2085239, -0.6216829, -2.049218, 0, 0, 1, 1, 1,
-0.2071653, -0.2964455, -1.851865, 1, 0, 0, 1, 1,
-0.2000872, 0.4605368, -1.101341, 1, 0, 0, 1, 1,
-0.1992213, -2.105067, -4.452818, 1, 0, 0, 1, 1,
-0.198376, 0.5942922, -1.088289, 1, 0, 0, 1, 1,
-0.1979855, 0.308105, -0.1171884, 1, 0, 0, 1, 1,
-0.1974702, -1.274431, -3.243986, 0, 0, 0, 1, 1,
-0.1972301, 1.662941, -1.237313, 0, 0, 0, 1, 1,
-0.1970559, 0.09654851, -2.869013, 0, 0, 0, 1, 1,
-0.1935644, -1.612704, -3.796011, 0, 0, 0, 1, 1,
-0.1931581, 0.4988187, 0.2523901, 0, 0, 0, 1, 1,
-0.1924103, -0.7356704, -2.681169, 0, 0, 0, 1, 1,
-0.1883848, 1.564045, -0.1694758, 0, 0, 0, 1, 1,
-0.1866239, 0.06501825, -1.970955, 1, 1, 1, 1, 1,
-0.1832207, 0.9549029, 1.182084, 1, 1, 1, 1, 1,
-0.182953, -0.1175632, -2.74936, 1, 1, 1, 1, 1,
-0.1811695, 0.6084583, -1.806477, 1, 1, 1, 1, 1,
-0.1808633, -0.5741113, -2.467076, 1, 1, 1, 1, 1,
-0.1798843, 0.4667389, -1.099489, 1, 1, 1, 1, 1,
-0.1772119, 1.453853, -0.2475917, 1, 1, 1, 1, 1,
-0.1765585, -1.528678, -2.910858, 1, 1, 1, 1, 1,
-0.1764819, -0.5699787, -4.875445, 1, 1, 1, 1, 1,
-0.1762326, 0.2413961, -0.8130059, 1, 1, 1, 1, 1,
-0.1756623, -0.7006598, -2.794177, 1, 1, 1, 1, 1,
-0.1750882, -1.348033, -2.914528, 1, 1, 1, 1, 1,
-0.1740402, 2.320217, -0.4852436, 1, 1, 1, 1, 1,
-0.1707711, -0.9393319, -2.805593, 1, 1, 1, 1, 1,
-0.1682873, 0.9140514, -0.1955572, 1, 1, 1, 1, 1,
-0.1654173, -1.283788, -3.155693, 0, 0, 1, 1, 1,
-0.1608211, 1.026631, 1.06038, 1, 0, 0, 1, 1,
-0.1600906, -1.564727, -4.24421, 1, 0, 0, 1, 1,
-0.157619, 0.385071, 0.1479646, 1, 0, 0, 1, 1,
-0.1569713, -0.3514674, -3.104025, 1, 0, 0, 1, 1,
-0.1566939, 0.4099421, -0.7337848, 1, 0, 0, 1, 1,
-0.1555981, 0.5252074, -0.7865538, 0, 0, 0, 1, 1,
-0.1544589, -1.108388, -3.212995, 0, 0, 0, 1, 1,
-0.1509819, -0.4242446, -3.647028, 0, 0, 0, 1, 1,
-0.1509804, -0.5055798, 0.3093482, 0, 0, 0, 1, 1,
-0.1503238, 1.977923, 1.067585, 0, 0, 0, 1, 1,
-0.1400516, -0.8027352, -1.686842, 0, 0, 0, 1, 1,
-0.1394914, -0.2853282, -1.480437, 0, 0, 0, 1, 1,
-0.1360577, 0.6749173, -0.3737521, 1, 1, 1, 1, 1,
-0.1324313, 1.130161, 0.5034125, 1, 1, 1, 1, 1,
-0.1318216, 1.885877, -1.137346, 1, 1, 1, 1, 1,
-0.1307277, 0.6109899, -0.3573554, 1, 1, 1, 1, 1,
-0.1298952, 1.453218, 1.171291, 1, 1, 1, 1, 1,
-0.1273243, 1.045597, -1.187668, 1, 1, 1, 1, 1,
-0.1262936, 1.705393, 0.1788571, 1, 1, 1, 1, 1,
-0.123573, 0.1819595, -2.027949, 1, 1, 1, 1, 1,
-0.1233646, 0.8786765, -1.568591, 1, 1, 1, 1, 1,
-0.1225032, -0.4860817, -3.354837, 1, 1, 1, 1, 1,
-0.1221687, 1.298293, -1.721585, 1, 1, 1, 1, 1,
-0.117521, -0.7227385, -3.477846, 1, 1, 1, 1, 1,
-0.1107495, -0.6355296, -3.130331, 1, 1, 1, 1, 1,
-0.1081531, 0.001619052, 0.6250957, 1, 1, 1, 1, 1,
-0.1074989, 1.785782, 1.818509, 1, 1, 1, 1, 1,
-0.1039907, 1.253657, 1.650253, 0, 0, 1, 1, 1,
-0.09973062, -1.904926, -2.348496, 1, 0, 0, 1, 1,
-0.09784003, -1.793762, -1.427609, 1, 0, 0, 1, 1,
-0.08746961, 0.327325, 0.1349783, 1, 0, 0, 1, 1,
-0.08570309, -0.8936872, -2.511016, 1, 0, 0, 1, 1,
-0.08499192, 0.9268836, -1.489045, 1, 0, 0, 1, 1,
-0.08393849, -1.084516, -3.479718, 0, 0, 0, 1, 1,
-0.0818047, 0.05544646, -0.2074635, 0, 0, 0, 1, 1,
-0.08018491, -0.7796556, -2.90915, 0, 0, 0, 1, 1,
-0.07975119, 0.3965015, -1.227282, 0, 0, 0, 1, 1,
-0.0728977, 0.6107045, -0.3777655, 0, 0, 0, 1, 1,
-0.07060167, -0.9230605, -3.24606, 0, 0, 0, 1, 1,
-0.06246097, 1.148627, -0.8680783, 0, 0, 0, 1, 1,
-0.05662851, -0.816215, -2.700051, 1, 1, 1, 1, 1,
-0.05528138, 0.2121996, 0.5064718, 1, 1, 1, 1, 1,
-0.05148158, -1.098099, -1.464294, 1, 1, 1, 1, 1,
-0.0511917, -2.611055, -0.7059793, 1, 1, 1, 1, 1,
-0.04905787, -0.1091331, -4.113583, 1, 1, 1, 1, 1,
-0.04905457, -0.259745, -2.472293, 1, 1, 1, 1, 1,
-0.04704043, -0.5920177, -4.247621, 1, 1, 1, 1, 1,
-0.04136853, -0.3660731, -3.840736, 1, 1, 1, 1, 1,
-0.03948437, -1.614354, -4.222534, 1, 1, 1, 1, 1,
-0.03273106, -0.2903492, -4.012775, 1, 1, 1, 1, 1,
-0.03243047, -0.2591287, -3.010554, 1, 1, 1, 1, 1,
-0.02976307, 0.203086, -1.631303, 1, 1, 1, 1, 1,
-0.02647585, -2.219047, -2.755229, 1, 1, 1, 1, 1,
-0.02399899, -1.117917, -3.134503, 1, 1, 1, 1, 1,
-0.02329564, 1.40519, 0.006181056, 1, 1, 1, 1, 1,
-0.02242961, -0.9860148, -2.179172, 0, 0, 1, 1, 1,
-0.01842257, -0.8044585, -2.690874, 1, 0, 0, 1, 1,
-0.01830669, 0.9309838, 0.4929624, 1, 0, 0, 1, 1,
-0.01757305, 1.587385, 0.3875145, 1, 0, 0, 1, 1,
-0.0165457, -0.4157057, -2.814317, 1, 0, 0, 1, 1,
-0.01567662, -0.1034013, -2.114043, 1, 0, 0, 1, 1,
-0.006997196, -0.7491446, -3.812513, 0, 0, 0, 1, 1,
0.0002746577, -1.694602, 3.58231, 0, 0, 0, 1, 1,
0.001576409, 1.734535, 0.88587, 0, 0, 0, 1, 1,
0.003037115, -0.7049547, 4.674232, 0, 0, 0, 1, 1,
0.004068266, -0.5627642, 2.189483, 0, 0, 0, 1, 1,
0.007016821, 0.6052878, -0.3311518, 0, 0, 0, 1, 1,
0.01552766, -0.1636391, 4.632164, 0, 0, 0, 1, 1,
0.01571139, 0.5834986, -3.097302, 1, 1, 1, 1, 1,
0.01850127, 0.1973046, -2.456741, 1, 1, 1, 1, 1,
0.01870465, -0.8361549, 2.412794, 1, 1, 1, 1, 1,
0.02322735, -1.139869, 3.764524, 1, 1, 1, 1, 1,
0.03041679, 0.6656347, 0.05182703, 1, 1, 1, 1, 1,
0.03156827, 0.983131, 0.6299669, 1, 1, 1, 1, 1,
0.03463947, 0.1850655, 1.566169, 1, 1, 1, 1, 1,
0.03662075, -1.646882, 5.18921, 1, 1, 1, 1, 1,
0.03715784, -0.9585138, 4.416211, 1, 1, 1, 1, 1,
0.03790165, -1.662124, 3.428255, 1, 1, 1, 1, 1,
0.03966903, -0.3865735, 3.624831, 1, 1, 1, 1, 1,
0.0414546, 0.4784654, 0.194525, 1, 1, 1, 1, 1,
0.04667756, -0.6427794, 2.917935, 1, 1, 1, 1, 1,
0.04683448, -1.028137, 2.701422, 1, 1, 1, 1, 1,
0.04720787, -1.08924, 1.715453, 1, 1, 1, 1, 1,
0.05296258, 0.7712933, 0.918568, 0, 0, 1, 1, 1,
0.05307453, -0.5132763, 3.728384, 1, 0, 0, 1, 1,
0.05953937, -0.272737, 2.328348, 1, 0, 0, 1, 1,
0.06230387, 0.9303586, 0.7952254, 1, 0, 0, 1, 1,
0.0660713, -1.424944, 0.4766118, 1, 0, 0, 1, 1,
0.06625414, 1.966791, -0.3614797, 1, 0, 0, 1, 1,
0.06975313, 0.7337444, 0.6686236, 0, 0, 0, 1, 1,
0.07387517, 1.362531, -0.9607593, 0, 0, 0, 1, 1,
0.08078346, 0.1740758, 1.26437, 0, 0, 0, 1, 1,
0.08384018, 0.7131711, -1.793752, 0, 0, 0, 1, 1,
0.08450912, 0.2036824, 1.990194, 0, 0, 0, 1, 1,
0.08938003, 0.2953743, 1.844119, 0, 0, 0, 1, 1,
0.08938771, -1.977751, 5.559484, 0, 0, 0, 1, 1,
0.09075329, -0.7576954, 3.381398, 1, 1, 1, 1, 1,
0.09510233, 0.6003215, 0.9008324, 1, 1, 1, 1, 1,
0.09798326, -1.318164, 2.698441, 1, 1, 1, 1, 1,
0.1074051, 0.9458841, 2.683012, 1, 1, 1, 1, 1,
0.1083399, -1.137303, 2.286537, 1, 1, 1, 1, 1,
0.1101549, -0.669738, 1.899428, 1, 1, 1, 1, 1,
0.1125724, 1.009943, -0.2546032, 1, 1, 1, 1, 1,
0.1181656, -0.2288643, 3.162542, 1, 1, 1, 1, 1,
0.1208754, 0.0831883, 2.505393, 1, 1, 1, 1, 1,
0.1223958, 0.1122115, 1.831268, 1, 1, 1, 1, 1,
0.1237892, 2.174642, 1.61549, 1, 1, 1, 1, 1,
0.1243188, -0.5615546, 3.300267, 1, 1, 1, 1, 1,
0.1247371, 0.5746101, 0.6113776, 1, 1, 1, 1, 1,
0.1256259, 1.122897, 0.2867156, 1, 1, 1, 1, 1,
0.1263333, 0.1213685, 2.235593, 1, 1, 1, 1, 1,
0.1281114, 0.7657961, 0.7945721, 0, 0, 1, 1, 1,
0.1291046, -0.1333167, 1.312649, 1, 0, 0, 1, 1,
0.1303499, 1.014447, 1.531537, 1, 0, 0, 1, 1,
0.131282, 0.06672318, 2.502221, 1, 0, 0, 1, 1,
0.1370727, 0.8488051, 1.026623, 1, 0, 0, 1, 1,
0.1428128, -1.122746, 5.454478, 1, 0, 0, 1, 1,
0.1478047, 1.07489, 1.211971, 0, 0, 0, 1, 1,
0.1484733, -0.3368244, 3.217315, 0, 0, 0, 1, 1,
0.1490936, -1.013537, 2.244009, 0, 0, 0, 1, 1,
0.1512844, 0.2173812, -0.06017076, 0, 0, 0, 1, 1,
0.1529876, 1.769117, -0.01504639, 0, 0, 0, 1, 1,
0.1629271, -0.3321836, 1.169982, 0, 0, 0, 1, 1,
0.1639248, -0.772551, 3.254492, 0, 0, 0, 1, 1,
0.1666821, 0.5856345, -0.01898846, 1, 1, 1, 1, 1,
0.1757086, 0.3413087, -0.9141142, 1, 1, 1, 1, 1,
0.1757375, -1.581788, 2.390033, 1, 1, 1, 1, 1,
0.1822142, 0.2785463, 1.133804, 1, 1, 1, 1, 1,
0.1840935, -2.129261, 3.016608, 1, 1, 1, 1, 1,
0.1854983, 0.4140973, -0.3893773, 1, 1, 1, 1, 1,
0.1867781, -0.5602087, 1.626176, 1, 1, 1, 1, 1,
0.1908818, -0.8783828, 2.392417, 1, 1, 1, 1, 1,
0.1937536, 0.2524344, 0.8875113, 1, 1, 1, 1, 1,
0.1947777, -0.2348356, 2.699723, 1, 1, 1, 1, 1,
0.1954157, -0.4013048, 2.95589, 1, 1, 1, 1, 1,
0.1996921, 0.4137186, -0.9102679, 1, 1, 1, 1, 1,
0.2038749, 1.071938, 0.08366697, 1, 1, 1, 1, 1,
0.2042362, -0.6659881, 2.893835, 1, 1, 1, 1, 1,
0.2073995, 0.03641877, 0.2902061, 1, 1, 1, 1, 1,
0.2082358, 0.9000861, 0.4802098, 0, 0, 1, 1, 1,
0.2122022, 1.329999, 0.02675308, 1, 0, 0, 1, 1,
0.2133247, -0.113645, 2.221095, 1, 0, 0, 1, 1,
0.2141742, -0.8889735, 0.6037672, 1, 0, 0, 1, 1,
0.2182753, -0.3913507, 3.08526, 1, 0, 0, 1, 1,
0.2183217, 0.7949349, 0.9564672, 1, 0, 0, 1, 1,
0.2265822, -0.08586191, 2.626681, 0, 0, 0, 1, 1,
0.2268242, -0.442626, 1.921656, 0, 0, 0, 1, 1,
0.2276971, -0.8266189, 3.874104, 0, 0, 0, 1, 1,
0.2281406, 2.413094, 1.122637, 0, 0, 0, 1, 1,
0.2415368, -1.299972, 3.520995, 0, 0, 0, 1, 1,
0.2474822, -0.1452127, 0.6618754, 0, 0, 0, 1, 1,
0.2478204, -0.9364697, 3.263638, 0, 0, 0, 1, 1,
0.2528327, -0.5789732, 2.860944, 1, 1, 1, 1, 1,
0.2530427, 1.572402, 0.3292522, 1, 1, 1, 1, 1,
0.2544208, -0.3519573, 3.123638, 1, 1, 1, 1, 1,
0.26138, -1.049996, 3.843813, 1, 1, 1, 1, 1,
0.2628426, -0.4558693, 2.655321, 1, 1, 1, 1, 1,
0.2654844, 1.281772, 0.2369451, 1, 1, 1, 1, 1,
0.2667734, 1.404766, 2.390612, 1, 1, 1, 1, 1,
0.2675605, 0.3584278, 1.247643, 1, 1, 1, 1, 1,
0.2702217, -0.3232969, 1.860252, 1, 1, 1, 1, 1,
0.2849945, 0.6844236, 0.5277517, 1, 1, 1, 1, 1,
0.2863218, 0.07344481, 3.193297, 1, 1, 1, 1, 1,
0.2924507, 0.1282989, 1.156569, 1, 1, 1, 1, 1,
0.2956084, -0.2776369, 1.202185, 1, 1, 1, 1, 1,
0.2991621, 0.694544, 1.072641, 1, 1, 1, 1, 1,
0.2999322, 1.131087, -1.032268, 1, 1, 1, 1, 1,
0.3002822, -0.0004803746, 1.694864, 0, 0, 1, 1, 1,
0.3009316, 0.1221567, 0.983933, 1, 0, 0, 1, 1,
0.3055, -1.201298, 2.718046, 1, 0, 0, 1, 1,
0.308994, 0.3583635, 1.33373, 1, 0, 0, 1, 1,
0.3090792, 0.6589196, 1.478122, 1, 0, 0, 1, 1,
0.3092527, 0.6281356, 2.172961, 1, 0, 0, 1, 1,
0.3126867, -1.694954, 3.784005, 0, 0, 0, 1, 1,
0.3151006, 1.298647, 2.09402, 0, 0, 0, 1, 1,
0.3151987, -0.914801, 2.99957, 0, 0, 0, 1, 1,
0.3167885, 0.6355376, 1.031241, 0, 0, 0, 1, 1,
0.322822, 0.6204978, 1.565402, 0, 0, 0, 1, 1,
0.3313716, 0.7488428, -0.1411596, 0, 0, 0, 1, 1,
0.33188, 0.1133669, -0.3657441, 0, 0, 0, 1, 1,
0.3348158, 0.4370563, 0.08115885, 1, 1, 1, 1, 1,
0.3385651, 0.8332196, 0.009023109, 1, 1, 1, 1, 1,
0.3397262, 0.174569, -1.252789, 1, 1, 1, 1, 1,
0.3400094, -0.5676804, 1.016742, 1, 1, 1, 1, 1,
0.3407571, -1.155465, 1.986319, 1, 1, 1, 1, 1,
0.3426569, 0.2419823, 0.470192, 1, 1, 1, 1, 1,
0.3435241, 2.675051, -1.358295, 1, 1, 1, 1, 1,
0.344162, -0.509639, 4.072574, 1, 1, 1, 1, 1,
0.3581808, -1.440924, 3.958641, 1, 1, 1, 1, 1,
0.3640409, 0.2103654, 1.786158, 1, 1, 1, 1, 1,
0.3646238, -0.0893546, 2.250322, 1, 1, 1, 1, 1,
0.3710474, 1.011799, -0.4644921, 1, 1, 1, 1, 1,
0.374396, 0.186695, 0.2841738, 1, 1, 1, 1, 1,
0.3776182, -0.5099767, 2.512726, 1, 1, 1, 1, 1,
0.3782131, 0.4054483, 1.177176, 1, 1, 1, 1, 1,
0.3785279, -1.813933, 2.037491, 0, 0, 1, 1, 1,
0.3800966, 0.7272978, -0.628304, 1, 0, 0, 1, 1,
0.3835846, 1.041944, 0.4771886, 1, 0, 0, 1, 1,
0.3861024, -1.255802, 3.452707, 1, 0, 0, 1, 1,
0.3888012, -0.3814905, 2.960884, 1, 0, 0, 1, 1,
0.3893404, 0.6261041, 0.7126128, 1, 0, 0, 1, 1,
0.3897303, 0.03519734, 0.4241023, 0, 0, 0, 1, 1,
0.3903326, -1.696283, 1.576622, 0, 0, 0, 1, 1,
0.3937222, 0.5439568, 1.019072, 0, 0, 0, 1, 1,
0.3940546, 0.2914851, 0.7325248, 0, 0, 0, 1, 1,
0.3942757, 0.84211, -0.8122238, 0, 0, 0, 1, 1,
0.3953274, 1.573042, 1.016164, 0, 0, 0, 1, 1,
0.3954441, -0.4638686, 2.19772, 0, 0, 0, 1, 1,
0.3993706, -0.1644148, 3.306256, 1, 1, 1, 1, 1,
0.4001231, 0.02940689, 0.6622862, 1, 1, 1, 1, 1,
0.4040757, 1.7237, -0.7905802, 1, 1, 1, 1, 1,
0.4057596, -0.4913681, 3.843904, 1, 1, 1, 1, 1,
0.4065015, -0.4261709, 2.843749, 1, 1, 1, 1, 1,
0.408023, 0.3437752, 1.915297, 1, 1, 1, 1, 1,
0.4101703, -0.5123935, 1.149554, 1, 1, 1, 1, 1,
0.4110533, 0.01223058, 1.61077, 1, 1, 1, 1, 1,
0.411573, 0.4305132, 0.9933112, 1, 1, 1, 1, 1,
0.4139689, 1.204816, 1.445565, 1, 1, 1, 1, 1,
0.4275076, -0.2961607, 0.9473554, 1, 1, 1, 1, 1,
0.4342646, -0.9243631, 3.241898, 1, 1, 1, 1, 1,
0.436162, -2.258052, 0.92928, 1, 1, 1, 1, 1,
0.4414499, -0.9949989, 3.514804, 1, 1, 1, 1, 1,
0.4460562, 0.3368678, -1.10455, 1, 1, 1, 1, 1,
0.4494467, -0.8261529, 3.180699, 0, 0, 1, 1, 1,
0.4497217, 0.7156637, 0.8118324, 1, 0, 0, 1, 1,
0.4505802, 0.05311667, 0.05423104, 1, 0, 0, 1, 1,
0.4524849, 1.205796, 0.3108023, 1, 0, 0, 1, 1,
0.4527234, -0.2204115, 1.401566, 1, 0, 0, 1, 1,
0.453052, -1.614507, 3.458246, 1, 0, 0, 1, 1,
0.4658731, -0.1944113, 1.706865, 0, 0, 0, 1, 1,
0.4768105, 1.463749, 1.376777, 0, 0, 0, 1, 1,
0.4772124, 1.871383, 0.06538333, 0, 0, 0, 1, 1,
0.4835249, -1.0223, 4.99526, 0, 0, 0, 1, 1,
0.4843108, -0.8971012, 2.580939, 0, 0, 0, 1, 1,
0.4875707, -0.8946014, 2.70703, 0, 0, 0, 1, 1,
0.4882281, 2.810449, 0.01267111, 0, 0, 0, 1, 1,
0.4886661, 2.108626, 2.049744, 1, 1, 1, 1, 1,
0.4895742, 0.5529848, -0.2470742, 1, 1, 1, 1, 1,
0.4935127, -0.8356949, 2.870426, 1, 1, 1, 1, 1,
0.498217, -0.6052387, 4.192341, 1, 1, 1, 1, 1,
0.4985093, -0.1523623, 2.466354, 1, 1, 1, 1, 1,
0.5004343, 0.7465595, 0.2532023, 1, 1, 1, 1, 1,
0.5033145, -0.3538529, -0.2498813, 1, 1, 1, 1, 1,
0.5060738, 0.3500057, 1.929649, 1, 1, 1, 1, 1,
0.5087724, 1.23687, -0.2423529, 1, 1, 1, 1, 1,
0.5096219, -0.6761559, 2.15109, 1, 1, 1, 1, 1,
0.5099245, 1.263706, 1.172174, 1, 1, 1, 1, 1,
0.5149685, 0.3912771, 0.3416842, 1, 1, 1, 1, 1,
0.5151473, 1.227417, -0.6263633, 1, 1, 1, 1, 1,
0.5183045, 1.489248, 1.316567, 1, 1, 1, 1, 1,
0.5220975, 1.849815, 1.141873, 1, 1, 1, 1, 1,
0.5222692, 1.58547, -0.00488729, 0, 0, 1, 1, 1,
0.5238636, -0.5716699, 1.712045, 1, 0, 0, 1, 1,
0.5274492, -0.7910635, 3.050339, 1, 0, 0, 1, 1,
0.5283312, -1.240495, 3.333329, 1, 0, 0, 1, 1,
0.5332432, -0.1098911, 1.61672, 1, 0, 0, 1, 1,
0.5344142, -1.400734, 3.438876, 1, 0, 0, 1, 1,
0.534937, -0.7935838, 2.849057, 0, 0, 0, 1, 1,
0.5351616, 0.2252075, 1.790808, 0, 0, 0, 1, 1,
0.5405663, -1.202558, 3.044626, 0, 0, 0, 1, 1,
0.5416058, 1.484232, 0.4424452, 0, 0, 0, 1, 1,
0.5490954, 0.1535254, 1.604679, 0, 0, 0, 1, 1,
0.5539538, 1.341341, 1.83608, 0, 0, 0, 1, 1,
0.5547069, 0.4448796, 0.9542927, 0, 0, 0, 1, 1,
0.5562587, -0.3874055, 1.611349, 1, 1, 1, 1, 1,
0.5580649, -1.02703, 3.276042, 1, 1, 1, 1, 1,
0.5584224, -0.969443, 3.877614, 1, 1, 1, 1, 1,
0.5613093, -0.5177119, 3.38071, 1, 1, 1, 1, 1,
0.5631617, -1.841127, 5.322616, 1, 1, 1, 1, 1,
0.563264, -1.436833, 4.784124, 1, 1, 1, 1, 1,
0.56731, 0.1300762, 0.2145344, 1, 1, 1, 1, 1,
0.5722267, 0.7428948, -1.074411, 1, 1, 1, 1, 1,
0.5818785, 1.230402, -0.6686109, 1, 1, 1, 1, 1,
0.5857171, 0.5159191, 3.339648, 1, 1, 1, 1, 1,
0.5901274, 1.034268, 1.14755, 1, 1, 1, 1, 1,
0.5918216, 0.6572131, 1.938305, 1, 1, 1, 1, 1,
0.5934101, -0.04647056, 1.585678, 1, 1, 1, 1, 1,
0.5963151, -0.325324, 1.849941, 1, 1, 1, 1, 1,
0.5967894, 2.071798, -0.5923064, 1, 1, 1, 1, 1,
0.6050305, 0.6107569, 0.1087053, 0, 0, 1, 1, 1,
0.6106208, -0.4647336, 2.627367, 1, 0, 0, 1, 1,
0.6125569, 0.6059566, 0.9623667, 1, 0, 0, 1, 1,
0.6147505, -0.2338259, 1.355088, 1, 0, 0, 1, 1,
0.6163048, 1.867571, -1.387045, 1, 0, 0, 1, 1,
0.6175168, 0.3242926, 2.143312, 1, 0, 0, 1, 1,
0.6181655, 0.4116634, 0.9979028, 0, 0, 0, 1, 1,
0.6189061, 0.01876679, 1.539739, 0, 0, 0, 1, 1,
0.6218005, -0.01094015, -0.425096, 0, 0, 0, 1, 1,
0.6316527, 0.8704827, 0.2971567, 0, 0, 0, 1, 1,
0.6320619, 0.2831219, 1.528987, 0, 0, 0, 1, 1,
0.6363429, 1.163222, 0.6735912, 0, 0, 0, 1, 1,
0.6504799, -1.395217, 3.316435, 0, 0, 0, 1, 1,
0.6518767, -2.234489, 2.817856, 1, 1, 1, 1, 1,
0.6582682, -0.02414615, 2.638751, 1, 1, 1, 1, 1,
0.6583919, -1.176691, 2.822179, 1, 1, 1, 1, 1,
0.6649579, 1.115417, 0.4436967, 1, 1, 1, 1, 1,
0.6675019, 1.558429, -2.342582, 1, 1, 1, 1, 1,
0.6695544, -2.540883, 3.533934, 1, 1, 1, 1, 1,
0.6785508, -0.6134112, 1.387478, 1, 1, 1, 1, 1,
0.6812959, 1.619018, -0.05354219, 1, 1, 1, 1, 1,
0.6868604, -0.1052918, 1.843247, 1, 1, 1, 1, 1,
0.6882016, -0.2460938, 2.027468, 1, 1, 1, 1, 1,
0.691538, -0.2658725, 1.86223, 1, 1, 1, 1, 1,
0.6938986, -1.615951, 3.051839, 1, 1, 1, 1, 1,
0.6960927, 0.5995468, 0.06950682, 1, 1, 1, 1, 1,
0.696411, 1.236986, 1.356804, 1, 1, 1, 1, 1,
0.6993548, 0.8355781, 0.5606564, 1, 1, 1, 1, 1,
0.6994331, 1.24957, 0.3182505, 0, 0, 1, 1, 1,
0.7023958, -0.2886201, 1.808352, 1, 0, 0, 1, 1,
0.7029225, 0.2613297, 2.182097, 1, 0, 0, 1, 1,
0.705579, 0.1249442, -0.1084722, 1, 0, 0, 1, 1,
0.7076544, -1.67793, 3.519931, 1, 0, 0, 1, 1,
0.7093001, 0.09870795, -0.07609014, 1, 0, 0, 1, 1,
0.7222767, -1.740574, 2.746305, 0, 0, 0, 1, 1,
0.7291184, -0.2716078, 1.671295, 0, 0, 0, 1, 1,
0.730366, 1.551954, 0.8294422, 0, 0, 0, 1, 1,
0.742645, 0.5683028, 2.713489, 0, 0, 0, 1, 1,
0.7440681, -0.05746366, 3.121937, 0, 0, 0, 1, 1,
0.7590026, -0.3788825, 2.28499, 0, 0, 0, 1, 1,
0.7618179, 2.036664, -0.4025716, 0, 0, 0, 1, 1,
0.7679035, -0.8482038, 1.858393, 1, 1, 1, 1, 1,
0.7692564, -0.006222815, 1.451092, 1, 1, 1, 1, 1,
0.7695638, -0.2907913, -0.986195, 1, 1, 1, 1, 1,
0.7734798, -0.3179419, 2.00243, 1, 1, 1, 1, 1,
0.7757948, -2.614316, 1.791244, 1, 1, 1, 1, 1,
0.7764776, 2.230965, -0.6418428, 1, 1, 1, 1, 1,
0.7767295, 0.1540698, 2.319989, 1, 1, 1, 1, 1,
0.7779208, 0.9958761, 0.2008441, 1, 1, 1, 1, 1,
0.7816597, -3.239106, 3.376303, 1, 1, 1, 1, 1,
0.7821721, -0.2938796, 1.427471, 1, 1, 1, 1, 1,
0.7830143, 0.09435924, 1.623393, 1, 1, 1, 1, 1,
0.7852826, -0.2116144, 0.7137871, 1, 1, 1, 1, 1,
0.7866761, -0.5313395, 2.110475, 1, 1, 1, 1, 1,
0.7872769, -0.9691067, 1.601309, 1, 1, 1, 1, 1,
0.7874249, -0.330236, 2.657442, 1, 1, 1, 1, 1,
0.7944815, 0.02961242, -0.3562643, 0, 0, 1, 1, 1,
0.7951427, -0.03190025, 3.156525, 1, 0, 0, 1, 1,
0.7959995, 1.57219, 1.005625, 1, 0, 0, 1, 1,
0.7968354, -1.88031, 2.232065, 1, 0, 0, 1, 1,
0.7968931, 0.5356833, 2.05584, 1, 0, 0, 1, 1,
0.7991878, 0.6900999, 0.7829556, 1, 0, 0, 1, 1,
0.7997488, 0.4690565, 0.6993373, 0, 0, 0, 1, 1,
0.8005905, -0.552453, 3.421078, 0, 0, 0, 1, 1,
0.8029473, -1.458552, 3.160076, 0, 0, 0, 1, 1,
0.8048739, -0.3561451, 0.7152603, 0, 0, 0, 1, 1,
0.8123819, -0.3586767, 2.62064, 0, 0, 0, 1, 1,
0.8137271, 1.870882, -0.7619312, 0, 0, 0, 1, 1,
0.8273545, 0.6490914, 0.6416869, 0, 0, 0, 1, 1,
0.8311803, 1.477502, -0.9716079, 1, 1, 1, 1, 1,
0.8329003, -0.9126196, 1.28961, 1, 1, 1, 1, 1,
0.8427451, -0.2959332, 2.552745, 1, 1, 1, 1, 1,
0.8433815, -0.9795905, 3.387687, 1, 1, 1, 1, 1,
0.8474793, -0.3333429, 2.357972, 1, 1, 1, 1, 1,
0.8497248, -0.1921006, 2.562524, 1, 1, 1, 1, 1,
0.8500459, -0.9580902, 1.940605, 1, 1, 1, 1, 1,
0.8557904, 0.7096753, 1.419978, 1, 1, 1, 1, 1,
0.8578342, -0.7331949, 3.462677, 1, 1, 1, 1, 1,
0.8603789, 1.224015, 2.349461, 1, 1, 1, 1, 1,
0.8617808, -0.6065625, 2.216919, 1, 1, 1, 1, 1,
0.867202, -2.132224, 3.223891, 1, 1, 1, 1, 1,
0.8723035, -1.18645, 1.706453, 1, 1, 1, 1, 1,
0.8782117, -0.8661575, 2.218467, 1, 1, 1, 1, 1,
0.879869, -0.8181459, 0.9684988, 1, 1, 1, 1, 1,
0.8828062, -0.2113699, 0.4742686, 0, 0, 1, 1, 1,
0.8838424, -1.779166, 2.620611, 1, 0, 0, 1, 1,
0.8845578, -0.07669488, 0.04723607, 1, 0, 0, 1, 1,
0.8888835, 1.509751, 0.9431182, 1, 0, 0, 1, 1,
0.8917403, -0.9192218, -0.09012893, 1, 0, 0, 1, 1,
0.8936304, 0.5550401, 0.2515841, 1, 0, 0, 1, 1,
0.8952051, 0.3593695, 2.523885, 0, 0, 0, 1, 1,
0.8984869, 0.1355399, 2.857467, 0, 0, 0, 1, 1,
0.8992316, 1.208, 1.919859, 0, 0, 0, 1, 1,
0.9000505, 2.150679, -0.5139611, 0, 0, 0, 1, 1,
0.9011301, -1.259305, 3.105548, 0, 0, 0, 1, 1,
0.9019243, 0.307359, 1.673976, 0, 0, 0, 1, 1,
0.9029946, 0.839831, 1.973405, 0, 0, 0, 1, 1,
0.9273346, -0.03736252, 1.91058, 1, 1, 1, 1, 1,
0.9279941, 0.6514499, 1.257566, 1, 1, 1, 1, 1,
0.9375599, -0.1847082, 1.613537, 1, 1, 1, 1, 1,
0.9468557, 2.150879, -0.1782714, 1, 1, 1, 1, 1,
0.9515267, 0.2403028, 2.280821, 1, 1, 1, 1, 1,
0.9627401, 0.8724006, 1.699054, 1, 1, 1, 1, 1,
0.9642611, 0.0087252, 2.055874, 1, 1, 1, 1, 1,
0.967822, 0.6556385, 1.721706, 1, 1, 1, 1, 1,
0.9678336, 0.1225291, 1.147036, 1, 1, 1, 1, 1,
0.9681737, 1.24683, 0.4647849, 1, 1, 1, 1, 1,
0.9716305, 0.9605703, 1.67775, 1, 1, 1, 1, 1,
0.9755499, 0.2032198, 0.9761382, 1, 1, 1, 1, 1,
0.9765983, 1.6056, -0.04426004, 1, 1, 1, 1, 1,
0.9772959, -0.5030388, 1.600047, 1, 1, 1, 1, 1,
0.9832518, 0.1728986, 1.777545, 1, 1, 1, 1, 1,
0.99052, -1.22488, 2.173158, 0, 0, 1, 1, 1,
0.9925519, 0.272525, -0.5281439, 1, 0, 0, 1, 1,
1.001797, -0.1860838, 0.7710038, 1, 0, 0, 1, 1,
1.002702, 0.2496733, 0.6994836, 1, 0, 0, 1, 1,
1.003734, 1.212098, -1.300221, 1, 0, 0, 1, 1,
1.009364, 1.822142, 1.0895, 1, 0, 0, 1, 1,
1.011092, 0.7803348, 0.9105698, 0, 0, 0, 1, 1,
1.0113, -0.1094685, 2.356589, 0, 0, 0, 1, 1,
1.01608, -0.277013, 3.096787, 0, 0, 0, 1, 1,
1.016586, -0.761616, 1.222421, 0, 0, 0, 1, 1,
1.02012, 1.125087, 0.4846506, 0, 0, 0, 1, 1,
1.021567, 1.00682, 1.546324, 0, 0, 0, 1, 1,
1.024098, 0.5791765, 0.7837796, 0, 0, 0, 1, 1,
1.028519, -1.259271, 2.464421, 1, 1, 1, 1, 1,
1.033493, 0.03298816, 1.959181, 1, 1, 1, 1, 1,
1.034016, -0.2810262, 2.132468, 1, 1, 1, 1, 1,
1.037364, 2.248226, 1.306075, 1, 1, 1, 1, 1,
1.038063, -0.2782865, 0.4690429, 1, 1, 1, 1, 1,
1.040902, 0.7107743, 0.944537, 1, 1, 1, 1, 1,
1.041548, 2.624194, -0.7721397, 1, 1, 1, 1, 1,
1.042294, 0.0057726, 2.016455, 1, 1, 1, 1, 1,
1.043573, 0.4011996, 2.271175, 1, 1, 1, 1, 1,
1.045533, 2.041212, 0.3127994, 1, 1, 1, 1, 1,
1.052179, 0.3994036, 1.870945, 1, 1, 1, 1, 1,
1.063164, 1.604741, 1.852614, 1, 1, 1, 1, 1,
1.063953, 0.107124, 1.680367, 1, 1, 1, 1, 1,
1.079459, -0.3294942, 2.735551, 1, 1, 1, 1, 1,
1.080671, -0.3461856, 1.959738, 1, 1, 1, 1, 1,
1.08125, -1.324155, 3.897851, 0, 0, 1, 1, 1,
1.08389, -0.04715497, 1.522394, 1, 0, 0, 1, 1,
1.084989, -0.0964984, 0.4338693, 1, 0, 0, 1, 1,
1.09294, 0.5774153, 0.6092115, 1, 0, 0, 1, 1,
1.094075, 0.5578704, 1.626741, 1, 0, 0, 1, 1,
1.094131, 0.4380445, 1.237983, 1, 0, 0, 1, 1,
1.102435, 0.9116346, 0.5709614, 0, 0, 0, 1, 1,
1.107129, 0.9310509, 2.367053, 0, 0, 0, 1, 1,
1.113153, -1.159049, 1.91945, 0, 0, 0, 1, 1,
1.113647, -1.359347, 0.9452932, 0, 0, 0, 1, 1,
1.11451, 1.94445, 2.663295, 0, 0, 0, 1, 1,
1.114675, 1.100313, 0.7242503, 0, 0, 0, 1, 1,
1.119128, -0.05938514, 4.508179, 0, 0, 0, 1, 1,
1.130198, -0.5302767, 1.218706, 1, 1, 1, 1, 1,
1.134758, -0.8901339, 2.296123, 1, 1, 1, 1, 1,
1.135489, -0.902751, 1.369775, 1, 1, 1, 1, 1,
1.138579, 0.7167376, 1.823655, 1, 1, 1, 1, 1,
1.150675, -0.9056149, 1.336584, 1, 1, 1, 1, 1,
1.157597, -1.127789, 1.959887, 1, 1, 1, 1, 1,
1.161208, -2.405225, 1.481079, 1, 1, 1, 1, 1,
1.161817, -0.6595083, 2.296365, 1, 1, 1, 1, 1,
1.16385, 0.2439268, 1.38976, 1, 1, 1, 1, 1,
1.165032, 0.1117929, 2.473805, 1, 1, 1, 1, 1,
1.165399, -3.773474, 3.818796, 1, 1, 1, 1, 1,
1.173832, -1.059927, 2.016398, 1, 1, 1, 1, 1,
1.180202, -1.431913, 2.342404, 1, 1, 1, 1, 1,
1.18381, -0.3058018, 2.317216, 1, 1, 1, 1, 1,
1.190337, 1.29914, 0.9454541, 1, 1, 1, 1, 1,
1.190629, 0.6717319, 2.606702, 0, 0, 1, 1, 1,
1.191943, -0.3599332, 1.342532, 1, 0, 0, 1, 1,
1.192362, 0.3606557, 0.2913895, 1, 0, 0, 1, 1,
1.19362, 0.7854123, -0.7421222, 1, 0, 0, 1, 1,
1.201802, -0.7681918, 1.833651, 1, 0, 0, 1, 1,
1.204217, -0.5398253, 1.405347, 1, 0, 0, 1, 1,
1.206303, 1.251707, 0.7109637, 0, 0, 0, 1, 1,
1.207668, -1.40291, 4.124161, 0, 0, 0, 1, 1,
1.208035, -2.060018, 1.974493, 0, 0, 0, 1, 1,
1.209391, -0.3255418, 2.112492, 0, 0, 0, 1, 1,
1.220074, 0.6408667, 0.258106, 0, 0, 0, 1, 1,
1.244122, 0.4159171, 1.638167, 0, 0, 0, 1, 1,
1.251569, 0.2482059, 1.062155, 0, 0, 0, 1, 1,
1.256012, 0.4660075, 0.5151163, 1, 1, 1, 1, 1,
1.269386, -0.3174551, 0.9953797, 1, 1, 1, 1, 1,
1.273993, -0.3217305, 2.917572, 1, 1, 1, 1, 1,
1.286649, 1.486407, 0.6116323, 1, 1, 1, 1, 1,
1.292006, 0.3108353, 3.537383, 1, 1, 1, 1, 1,
1.293367, -1.034948, 1.644823, 1, 1, 1, 1, 1,
1.293779, -0.1851868, 2.578265, 1, 1, 1, 1, 1,
1.295332, 0.1591201, 1.481315, 1, 1, 1, 1, 1,
1.335814, -1.396215, 2.831978, 1, 1, 1, 1, 1,
1.363848, 0.1745713, 0.2791552, 1, 1, 1, 1, 1,
1.369643, -0.3389366, 1.965703, 1, 1, 1, 1, 1,
1.373081, 2.963503, -0.08074261, 1, 1, 1, 1, 1,
1.391736, 1.450641, 0.5000921, 1, 1, 1, 1, 1,
1.396904, -0.6193237, 2.596561, 1, 1, 1, 1, 1,
1.411063, 0.3918297, 1.268363, 1, 1, 1, 1, 1,
1.417209, -2.1989, 0.8097024, 0, 0, 1, 1, 1,
1.440211, -0.4193762, 3.018113, 1, 0, 0, 1, 1,
1.452549, 1.937297, 0.7319494, 1, 0, 0, 1, 1,
1.454909, 0.01145486, 1.094397, 1, 0, 0, 1, 1,
1.467881, 1.030624, 1.11228, 1, 0, 0, 1, 1,
1.468138, 0.5642789, 0.6695963, 1, 0, 0, 1, 1,
1.473971, 0.9051883, 0.2605248, 0, 0, 0, 1, 1,
1.475514, -0.1254597, 0.3324548, 0, 0, 0, 1, 1,
1.481598, -1.922258, 3.640188, 0, 0, 0, 1, 1,
1.487092, -1.35526, 1.77474, 0, 0, 0, 1, 1,
1.495341, 1.276241, 1.248, 0, 0, 0, 1, 1,
1.499209, -0.5579818, 1.508, 0, 0, 0, 1, 1,
1.504632, 0.2892129, 2.572472, 0, 0, 0, 1, 1,
1.514609, 2.93997, -0.1685154, 1, 1, 1, 1, 1,
1.517475, -1.750068, 2.231359, 1, 1, 1, 1, 1,
1.520378, 2.042407, 0.7312092, 1, 1, 1, 1, 1,
1.520713, -0.89477, 2.865881, 1, 1, 1, 1, 1,
1.524365, -0.7088692, 0.4986371, 1, 1, 1, 1, 1,
1.527214, 1.770455, 0.5340651, 1, 1, 1, 1, 1,
1.530709, -0.9936121, 2.442538, 1, 1, 1, 1, 1,
1.532811, 0.8133502, 1.037771, 1, 1, 1, 1, 1,
1.538854, -0.9283106, 1.346084, 1, 1, 1, 1, 1,
1.54093, 0.628681, 0.2883767, 1, 1, 1, 1, 1,
1.545474, 0.6768776, 1.897606, 1, 1, 1, 1, 1,
1.556782, 0.682517, 2.083602, 1, 1, 1, 1, 1,
1.566361, -1.525226, 2.966672, 1, 1, 1, 1, 1,
1.57672, 0.2862989, 1.796027, 1, 1, 1, 1, 1,
1.620295, -0.2931972, 3.168867, 1, 1, 1, 1, 1,
1.621752, 0.6729379, 1.358559, 0, 0, 1, 1, 1,
1.621975, 0.9283183, -0.1168589, 1, 0, 0, 1, 1,
1.626008, -1.035046, 1.600195, 1, 0, 0, 1, 1,
1.635173, 1.166221, 1.242003, 1, 0, 0, 1, 1,
1.657888, 0.08525068, 0.06660479, 1, 0, 0, 1, 1,
1.663881, 0.440112, 1.445517, 1, 0, 0, 1, 1,
1.664932, -0.2408911, 1.017173, 0, 0, 0, 1, 1,
1.665224, 2.321304, 0.8941914, 0, 0, 0, 1, 1,
1.680066, 1.243114, 0.5004795, 0, 0, 0, 1, 1,
1.722087, 0.7436402, 3.964547, 0, 0, 0, 1, 1,
1.736292, 0.5966131, 0.3909945, 0, 0, 0, 1, 1,
1.758715, -0.2104336, 1.719671, 0, 0, 0, 1, 1,
1.776535, -2.126723, 0.8304524, 0, 0, 0, 1, 1,
1.796438, -1.721963, 3.555958, 1, 1, 1, 1, 1,
1.841958, -0.126002, 1.065605, 1, 1, 1, 1, 1,
1.844365, 0.6157902, 0.406395, 1, 1, 1, 1, 1,
1.875033, 0.2281799, 2.701724, 1, 1, 1, 1, 1,
1.895274, 1.186311, -0.8121885, 1, 1, 1, 1, 1,
1.905545, -0.03699405, 2.992993, 1, 1, 1, 1, 1,
1.912671, 1.252463, 1.276525, 1, 1, 1, 1, 1,
1.949599, -1.099967, 1.219645, 1, 1, 1, 1, 1,
1.956797, -1.273045, 1.47191, 1, 1, 1, 1, 1,
1.958803, 1.582255, -0.8962692, 1, 1, 1, 1, 1,
1.9595, -0.4794918, 0.9828547, 1, 1, 1, 1, 1,
1.974712, 1.983885, -0.7532488, 1, 1, 1, 1, 1,
2.024502, -0.0306129, 0.6883038, 1, 1, 1, 1, 1,
2.074207, -1.019632, 2.491225, 1, 1, 1, 1, 1,
2.09489, 0.7107223, 0.7142894, 1, 1, 1, 1, 1,
2.09749, -0.5306863, 1.545146, 0, 0, 1, 1, 1,
2.10236, -1.371359, 2.421577, 1, 0, 0, 1, 1,
2.132072, 1.112499, 0.3096714, 1, 0, 0, 1, 1,
2.163674, -0.4437551, 2.39079, 1, 0, 0, 1, 1,
2.199496, 0.4211688, 1.251614, 1, 0, 0, 1, 1,
2.208605, -0.7739357, 2.80875, 1, 0, 0, 1, 1,
2.214716, 0.8697927, 1.709713, 0, 0, 0, 1, 1,
2.284754, 0.13875, 2.468256, 0, 0, 0, 1, 1,
2.287486, 0.2272188, 1.688846, 0, 0, 0, 1, 1,
2.341001, -1.647119, 2.789194, 0, 0, 0, 1, 1,
2.361481, 1.371867, 0.8843815, 0, 0, 0, 1, 1,
2.362717, 1.082587, -1.951967, 0, 0, 0, 1, 1,
2.369523, -0.4262346, 1.820433, 0, 0, 0, 1, 1,
2.402156, -0.5531048, 1.817849, 1, 1, 1, 1, 1,
2.442539, 0.5899667, 0.6716695, 1, 1, 1, 1, 1,
2.470388, 0.1691299, 3.343651, 1, 1, 1, 1, 1,
2.565904, 1.243171, -0.2197731, 1, 1, 1, 1, 1,
2.755707, 0.2894469, -1.049991, 1, 1, 1, 1, 1,
2.763915, -0.6478002, 3.018931, 1, 1, 1, 1, 1,
2.87523, -1.590417, 3.516291, 1, 1, 1, 1, 1
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
var radius = 9.630503;
var distance = 33.82673;
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
mvMatrix.translate( -0.01418996, 0.3640046, -0.05571389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82673);
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
