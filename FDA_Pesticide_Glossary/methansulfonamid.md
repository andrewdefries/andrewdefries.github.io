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
-2.702478, 0.1930762, -1.365664, 1, 0, 0, 1,
-2.597595, -1.422065, -0.7537287, 1, 0.007843138, 0, 1,
-2.497345, 1.228586, 0.1629668, 1, 0.01176471, 0, 1,
-2.444312, 1.128163, -1.077165, 1, 0.01960784, 0, 1,
-2.432804, 0.004929115, -2.537646, 1, 0.02352941, 0, 1,
-2.423822, 1.098983, -1.96866, 1, 0.03137255, 0, 1,
-2.342837, 0.8457328, -0.2047732, 1, 0.03529412, 0, 1,
-2.31467, 0.5415948, -2.858744, 1, 0.04313726, 0, 1,
-2.23511, 0.825373, -0.4107376, 1, 0.04705882, 0, 1,
-2.218054, -0.5410584, -3.044497, 1, 0.05490196, 0, 1,
-2.20622, 1.332635, -3.284712, 1, 0.05882353, 0, 1,
-2.191307, 1.42458, 0.9397691, 1, 0.06666667, 0, 1,
-2.148761, -1.123841, -1.514796, 1, 0.07058824, 0, 1,
-2.102611, -1.563146, -0.5603297, 1, 0.07843138, 0, 1,
-2.074203, 1.127861, -1.883005, 1, 0.08235294, 0, 1,
-2.062374, -0.07387518, -1.363954, 1, 0.09019608, 0, 1,
-2.060841, 0.8715625, -1.375716, 1, 0.09411765, 0, 1,
-2.025171, 0.4793181, -1.624928, 1, 0.1019608, 0, 1,
-1.979059, 0.1153112, -0.08045609, 1, 0.1098039, 0, 1,
-1.951241, -1.370662, -1.537912, 1, 0.1137255, 0, 1,
-1.948474, 0.0894361, -1.232698, 1, 0.1215686, 0, 1,
-1.932313, 0.6639451, -2.81266, 1, 0.1254902, 0, 1,
-1.898214, -1.12076, -1.845431, 1, 0.1333333, 0, 1,
-1.880974, 1.24344, 0.9908612, 1, 0.1372549, 0, 1,
-1.853882, 1.918097, -2.320818, 1, 0.145098, 0, 1,
-1.844702, 0.5463395, -1.198722, 1, 0.1490196, 0, 1,
-1.84276, -0.05109847, -0.935814, 1, 0.1568628, 0, 1,
-1.839261, 1.497389, -0.6691215, 1, 0.1607843, 0, 1,
-1.815526, 0.3939688, -0.4405985, 1, 0.1686275, 0, 1,
-1.814388, 0.9084892, -0.9114876, 1, 0.172549, 0, 1,
-1.796886, 0.5598831, -1.786546, 1, 0.1803922, 0, 1,
-1.760538, -0.8376409, -0.8397523, 1, 0.1843137, 0, 1,
-1.756975, -1.257608, -0.982161, 1, 0.1921569, 0, 1,
-1.752007, -1.12355, -2.43999, 1, 0.1960784, 0, 1,
-1.742641, 0.1259765, -1.241817, 1, 0.2039216, 0, 1,
-1.738972, 1.829986, -1.055383, 1, 0.2117647, 0, 1,
-1.734138, 1.371826, -1.478274, 1, 0.2156863, 0, 1,
-1.715268, 1.910988, -1.618076, 1, 0.2235294, 0, 1,
-1.708284, 0.7188584, -1.043781, 1, 0.227451, 0, 1,
-1.70323, 0.5822893, -1.026511, 1, 0.2352941, 0, 1,
-1.678298, -1.331439, -2.759959, 1, 0.2392157, 0, 1,
-1.667395, 0.08507282, -2.175974, 1, 0.2470588, 0, 1,
-1.665039, -0.1497341, -1.261765, 1, 0.2509804, 0, 1,
-1.657554, 0.9328283, -3.54653, 1, 0.2588235, 0, 1,
-1.65238, -0.9745633, -1.789059, 1, 0.2627451, 0, 1,
-1.646352, -0.8722145, -1.434975, 1, 0.2705882, 0, 1,
-1.644846, 1.961224, -0.9744587, 1, 0.2745098, 0, 1,
-1.62744, 1.669409, -0.5583794, 1, 0.282353, 0, 1,
-1.626428, 0.4127403, -2.356599, 1, 0.2862745, 0, 1,
-1.610323, -0.3703544, -2.482409, 1, 0.2941177, 0, 1,
-1.609272, -0.3728649, -2.586095, 1, 0.3019608, 0, 1,
-1.607602, -0.985234, -1.995314, 1, 0.3058824, 0, 1,
-1.603254, -0.9234899, -1.744701, 1, 0.3137255, 0, 1,
-1.602125, -2.444238, -1.131294, 1, 0.3176471, 0, 1,
-1.60092, -0.01243606, -2.566246, 1, 0.3254902, 0, 1,
-1.59981, 0.2512564, -1.7524, 1, 0.3294118, 0, 1,
-1.592858, -0.602037, -2.107168, 1, 0.3372549, 0, 1,
-1.588056, 0.9165875, -2.026419, 1, 0.3411765, 0, 1,
-1.583404, 0.7946085, -1.161857, 1, 0.3490196, 0, 1,
-1.580577, -0.2426363, 0.0322412, 1, 0.3529412, 0, 1,
-1.577521, -2.05773, -3.345299, 1, 0.3607843, 0, 1,
-1.574491, -0.01782997, -1.795161, 1, 0.3647059, 0, 1,
-1.566284, 0.8283471, -2.088232, 1, 0.372549, 0, 1,
-1.560979, -0.3093474, -1.62483, 1, 0.3764706, 0, 1,
-1.550724, -1.039812, -1.378058, 1, 0.3843137, 0, 1,
-1.541514, 1.246882, -2.291143, 1, 0.3882353, 0, 1,
-1.523648, 0.8886498, -3.757262, 1, 0.3960784, 0, 1,
-1.517533, 1.404223, -0.9932957, 1, 0.4039216, 0, 1,
-1.499503, -0.4168164, -2.597221, 1, 0.4078431, 0, 1,
-1.477948, -1.247415, -1.342404, 1, 0.4156863, 0, 1,
-1.467523, -1.074118, -2.968848, 1, 0.4196078, 0, 1,
-1.463434, 0.1396172, -1.066881, 1, 0.427451, 0, 1,
-1.461129, 1.903036, -1.717561, 1, 0.4313726, 0, 1,
-1.459189, -1.520602, -3.567988, 1, 0.4392157, 0, 1,
-1.458401, -1.156228, -2.938009, 1, 0.4431373, 0, 1,
-1.457346, 0.2683229, -0.3486562, 1, 0.4509804, 0, 1,
-1.451323, -1.501222, -1.501295, 1, 0.454902, 0, 1,
-1.43929, -0.7694635, 0.1336275, 1, 0.4627451, 0, 1,
-1.424335, -0.2515161, -2.860152, 1, 0.4666667, 0, 1,
-1.422472, 0.6568031, -0.4482426, 1, 0.4745098, 0, 1,
-1.407378, 0.4748086, -2.501497, 1, 0.4784314, 0, 1,
-1.404553, 1.886887, 0.3291525, 1, 0.4862745, 0, 1,
-1.393685, 1.946526, -1.605186, 1, 0.4901961, 0, 1,
-1.381073, -0.2627614, -1.204769, 1, 0.4980392, 0, 1,
-1.377483, 0.7381203, -1.070341, 1, 0.5058824, 0, 1,
-1.373395, 0.6031879, -1.512404, 1, 0.509804, 0, 1,
-1.373134, -1.210817, -1.508914, 1, 0.5176471, 0, 1,
-1.37166, 0.3568187, -1.727578, 1, 0.5215687, 0, 1,
-1.367539, 0.207361, -2.439329, 1, 0.5294118, 0, 1,
-1.358805, -2.269002, -1.440226, 1, 0.5333334, 0, 1,
-1.330838, 0.4383473, 0.08280484, 1, 0.5411765, 0, 1,
-1.317265, 0.2392927, -1.586073, 1, 0.5450981, 0, 1,
-1.315664, 2.323482, -0.1608302, 1, 0.5529412, 0, 1,
-1.298977, -1.102736, -0.9688135, 1, 0.5568628, 0, 1,
-1.287604, -0.8344784, -0.7863829, 1, 0.5647059, 0, 1,
-1.284869, 0.3227319, -1.917786, 1, 0.5686275, 0, 1,
-1.275368, -0.4945684, -1.749191, 1, 0.5764706, 0, 1,
-1.273657, -0.007799527, -1.579681, 1, 0.5803922, 0, 1,
-1.27158, -1.119525, -2.909659, 1, 0.5882353, 0, 1,
-1.266688, -0.3205273, -1.815597, 1, 0.5921569, 0, 1,
-1.26588, 0.2973197, -1.701547, 1, 0.6, 0, 1,
-1.251346, 0.271488, -0.7637078, 1, 0.6078432, 0, 1,
-1.243603, -0.8413572, -0.7903757, 1, 0.6117647, 0, 1,
-1.241015, 0.9835435, -1.056852, 1, 0.6196079, 0, 1,
-1.239005, -0.3987879, -0.6235058, 1, 0.6235294, 0, 1,
-1.238336, -0.8144099, -3.5994, 1, 0.6313726, 0, 1,
-1.232718, -0.920795, -2.09256, 1, 0.6352941, 0, 1,
-1.209003, 0.6776244, -1.019395, 1, 0.6431373, 0, 1,
-1.197328, -2.360657, -2.345377, 1, 0.6470588, 0, 1,
-1.195348, 0.1896287, 0.2664203, 1, 0.654902, 0, 1,
-1.19333, 0.4517148, 0.7160378, 1, 0.6588235, 0, 1,
-1.179682, 1.628952, -0.404235, 1, 0.6666667, 0, 1,
-1.175168, -0.4588047, -2.217416, 1, 0.6705883, 0, 1,
-1.172279, 1.281373, -1.064424, 1, 0.6784314, 0, 1,
-1.16987, 0.1644295, -1.060128, 1, 0.682353, 0, 1,
-1.167542, -0.7383247, -1.715198, 1, 0.6901961, 0, 1,
-1.162769, -1.414383, -0.5329976, 1, 0.6941177, 0, 1,
-1.152877, -0.8996609, -2.852782, 1, 0.7019608, 0, 1,
-1.146941, 1.034012, 0.4448056, 1, 0.7098039, 0, 1,
-1.140838, 0.8480219, 0.9530029, 1, 0.7137255, 0, 1,
-1.139481, -0.9264187, -1.848944, 1, 0.7215686, 0, 1,
-1.133777, 0.6574225, -2.675565, 1, 0.7254902, 0, 1,
-1.116877, -0.4791198, -3.04099, 1, 0.7333333, 0, 1,
-1.113426, 1.833476, 0.2288544, 1, 0.7372549, 0, 1,
-1.112426, 0.5576575, -1.658093, 1, 0.7450981, 0, 1,
-1.11133, -0.4368047, -3.756612, 1, 0.7490196, 0, 1,
-1.103711, -0.5025973, -1.315963, 1, 0.7568628, 0, 1,
-1.099695, 0.4693424, -1.177719, 1, 0.7607843, 0, 1,
-1.089191, 1.021078, 0.4460521, 1, 0.7686275, 0, 1,
-1.072979, 0.4820891, -1.331142, 1, 0.772549, 0, 1,
-1.069604, 0.3145503, -1.602076, 1, 0.7803922, 0, 1,
-1.067213, -0.7700077, -1.560242, 1, 0.7843137, 0, 1,
-1.066426, 1.480578, -0.524616, 1, 0.7921569, 0, 1,
-1.060716, 2.061452, -2.262214, 1, 0.7960784, 0, 1,
-1.051693, 0.09303638, -1.606925, 1, 0.8039216, 0, 1,
-1.048963, 0.03324128, -1.253017, 1, 0.8117647, 0, 1,
-1.041379, -1.031364, -2.445584, 1, 0.8156863, 0, 1,
-1.039141, -1.413167, -3.210477, 1, 0.8235294, 0, 1,
-1.03546, 0.04793852, 0.3841211, 1, 0.827451, 0, 1,
-1.035407, -0.6404775, -0.6852352, 1, 0.8352941, 0, 1,
-1.020559, 0.007384748, -2.255745, 1, 0.8392157, 0, 1,
-1.016255, -1.053002, -3.374718, 1, 0.8470588, 0, 1,
-1.01247, -0.579949, -2.531052, 1, 0.8509804, 0, 1,
-1.010633, -0.05785125, -2.862849, 1, 0.8588235, 0, 1,
-1.009563, 0.3696523, -1.405326, 1, 0.8627451, 0, 1,
-1.007815, 0.7423849, 0.5745194, 1, 0.8705882, 0, 1,
-1.002845, 0.1600702, -1.25484, 1, 0.8745098, 0, 1,
-1.00026, -1.37518, -2.399811, 1, 0.8823529, 0, 1,
-0.9939445, -1.324053, -2.979616, 1, 0.8862745, 0, 1,
-0.9844442, 0.1729877, 0.2220503, 1, 0.8941177, 0, 1,
-0.9836685, 3.500732, 0.9898944, 1, 0.8980392, 0, 1,
-0.9813822, 0.7189193, 0.2316364, 1, 0.9058824, 0, 1,
-0.9684847, -0.112247, -0.5217414, 1, 0.9137255, 0, 1,
-0.9643571, 0.8531719, -1.297123, 1, 0.9176471, 0, 1,
-0.9633815, 0.7589226, -1.077929, 1, 0.9254902, 0, 1,
-0.9579617, -0.517503, -2.443069, 1, 0.9294118, 0, 1,
-0.9559271, 0.7848242, 0.418464, 1, 0.9372549, 0, 1,
-0.952194, -0.1998765, -2.331696, 1, 0.9411765, 0, 1,
-0.9468479, 0.8805501, -3.03973, 1, 0.9490196, 0, 1,
-0.9324822, 1.34866, -1.118315, 1, 0.9529412, 0, 1,
-0.929627, 0.7447627, -0.04218799, 1, 0.9607843, 0, 1,
-0.9255981, 0.1308239, -3.465031, 1, 0.9647059, 0, 1,
-0.9247768, 0.1922523, -1.730036, 1, 0.972549, 0, 1,
-0.9053509, 0.2322719, -0.5865648, 1, 0.9764706, 0, 1,
-0.9038616, 1.510856, -0.9517388, 1, 0.9843137, 0, 1,
-0.9009175, -0.6976022, -1.837404, 1, 0.9882353, 0, 1,
-0.896445, -1.835671, -2.77988, 1, 0.9960784, 0, 1,
-0.8945208, 1.345386, 0.2247348, 0.9960784, 1, 0, 1,
-0.8880424, 0.9049504, -2.508363, 0.9921569, 1, 0, 1,
-0.8841995, 0.9329899, -2.110054, 0.9843137, 1, 0, 1,
-0.8840309, 0.7614743, -1.321384, 0.9803922, 1, 0, 1,
-0.8832338, 0.9809262, -0.4433106, 0.972549, 1, 0, 1,
-0.8820273, -0.8612321, -0.8567558, 0.9686275, 1, 0, 1,
-0.8802238, -0.5730277, -3.827489, 0.9607843, 1, 0, 1,
-0.8800754, -0.1086289, -1.354978, 0.9568627, 1, 0, 1,
-0.8763281, 0.9156267, -1.387131, 0.9490196, 1, 0, 1,
-0.8713503, -0.1006668, -1.344505, 0.945098, 1, 0, 1,
-0.8676075, -0.9858536, -2.266132, 0.9372549, 1, 0, 1,
-0.8601748, 1.112784, 0.5142158, 0.9333333, 1, 0, 1,
-0.8581845, -0.1386283, -3.046538, 0.9254902, 1, 0, 1,
-0.857646, -0.2290499, -2.37545, 0.9215686, 1, 0, 1,
-0.8534927, 0.4726504, -0.4300276, 0.9137255, 1, 0, 1,
-0.8510462, -0.789381, -1.452893, 0.9098039, 1, 0, 1,
-0.8485237, -1.0374, -1.709681, 0.9019608, 1, 0, 1,
-0.8483631, 0.4684733, -1.383037, 0.8941177, 1, 0, 1,
-0.8410121, 0.3202048, -1.695639, 0.8901961, 1, 0, 1,
-0.8357701, 0.4717572, -1.487318, 0.8823529, 1, 0, 1,
-0.8354933, -0.5960051, -1.051557, 0.8784314, 1, 0, 1,
-0.8343089, -0.04211602, -0.9337862, 0.8705882, 1, 0, 1,
-0.8296976, -0.4667834, -1.64027, 0.8666667, 1, 0, 1,
-0.8255571, -0.7695968, -1.190638, 0.8588235, 1, 0, 1,
-0.8237913, -0.2223265, -0.8364037, 0.854902, 1, 0, 1,
-0.8237868, 0.281518, -2.526286, 0.8470588, 1, 0, 1,
-0.8209478, -0.9081089, -1.135373, 0.8431373, 1, 0, 1,
-0.8205158, 0.1584913, -2.679771, 0.8352941, 1, 0, 1,
-0.819976, 0.2082871, -1.503227, 0.8313726, 1, 0, 1,
-0.8195022, 0.9367397, -1.431501, 0.8235294, 1, 0, 1,
-0.8165016, 0.4329794, -1.525294, 0.8196079, 1, 0, 1,
-0.8092461, -1.353846, -1.839418, 0.8117647, 1, 0, 1,
-0.8090999, 0.5693972, -1.43199, 0.8078431, 1, 0, 1,
-0.804609, -2.015145, -2.830379, 0.8, 1, 0, 1,
-0.803068, 2.156351, -1.666691, 0.7921569, 1, 0, 1,
-0.801995, -0.1712673, -2.663466, 0.7882353, 1, 0, 1,
-0.8018706, -1.513128, -3.110712, 0.7803922, 1, 0, 1,
-0.8009502, -0.3479228, -2.239296, 0.7764706, 1, 0, 1,
-0.7996407, -1.900943, -1.926671, 0.7686275, 1, 0, 1,
-0.7950038, -0.5869609, -2.578865, 0.7647059, 1, 0, 1,
-0.7934588, -0.9757353, -2.576436, 0.7568628, 1, 0, 1,
-0.793205, 1.637545, -0.7797019, 0.7529412, 1, 0, 1,
-0.7901682, 1.174261, 0.08021715, 0.7450981, 1, 0, 1,
-0.7878179, -0.5674816, -1.220242, 0.7411765, 1, 0, 1,
-0.7790486, -0.02647109, -0.3805738, 0.7333333, 1, 0, 1,
-0.7759335, 0.1043086, -2.332909, 0.7294118, 1, 0, 1,
-0.77397, -0.9183978, -0.9928969, 0.7215686, 1, 0, 1,
-0.7723443, -0.6067884, -2.165724, 0.7176471, 1, 0, 1,
-0.7694581, -0.7213573, -0.5840438, 0.7098039, 1, 0, 1,
-0.7687674, 0.4404932, -0.4173726, 0.7058824, 1, 0, 1,
-0.7671404, 0.6770068, -1.676852, 0.6980392, 1, 0, 1,
-0.7646589, 1.290717, 0.3176152, 0.6901961, 1, 0, 1,
-0.7646518, 0.268434, -1.970242, 0.6862745, 1, 0, 1,
-0.7643401, 0.01655417, -2.846844, 0.6784314, 1, 0, 1,
-0.763926, 0.001795339, -2.87822, 0.6745098, 1, 0, 1,
-0.76265, 0.03689198, -1.668428, 0.6666667, 1, 0, 1,
-0.7625286, 0.01697503, -3.426186, 0.6627451, 1, 0, 1,
-0.761591, 0.7171811, -0.5937968, 0.654902, 1, 0, 1,
-0.7608837, -0.5656108, -1.506467, 0.6509804, 1, 0, 1,
-0.7572419, -0.08899312, -1.361369, 0.6431373, 1, 0, 1,
-0.7572219, 1.408888, -0.3509477, 0.6392157, 1, 0, 1,
-0.7526303, 0.01636248, -1.880511, 0.6313726, 1, 0, 1,
-0.7456107, 2.078643, -1.275878, 0.627451, 1, 0, 1,
-0.7453157, 0.0236846, -1.52464, 0.6196079, 1, 0, 1,
-0.7411693, 1.154855, -2.030702, 0.6156863, 1, 0, 1,
-0.7362454, -0.1201695, -1.565227, 0.6078432, 1, 0, 1,
-0.7346258, -1.44147, -3.516488, 0.6039216, 1, 0, 1,
-0.7321629, 0.01733042, -0.4893111, 0.5960785, 1, 0, 1,
-0.7318125, -0.3948521, -2.695762, 0.5882353, 1, 0, 1,
-0.7307065, 0.5825372, -0.3408225, 0.5843138, 1, 0, 1,
-0.729191, -0.277293, -1.395849, 0.5764706, 1, 0, 1,
-0.7023297, -0.3179356, -1.89241, 0.572549, 1, 0, 1,
-0.6919287, -1.993653, -2.014891, 0.5647059, 1, 0, 1,
-0.6829357, 2.512982, -0.2723904, 0.5607843, 1, 0, 1,
-0.6737428, -2.148269, -3.297638, 0.5529412, 1, 0, 1,
-0.6705184, 2.386919, -0.9981163, 0.5490196, 1, 0, 1,
-0.6679052, -0.7455455, -3.141732, 0.5411765, 1, 0, 1,
-0.6660673, -0.3509972, -1.706734, 0.5372549, 1, 0, 1,
-0.6659443, 2.007664, -1.48323, 0.5294118, 1, 0, 1,
-0.6599917, 1.102956, -0.6101914, 0.5254902, 1, 0, 1,
-0.646085, 1.733727, -2.578409, 0.5176471, 1, 0, 1,
-0.6460056, -2.356319, -1.747316, 0.5137255, 1, 0, 1,
-0.6459065, 1.150133, 0.5498655, 0.5058824, 1, 0, 1,
-0.6453584, -0.2889462, -2.080366, 0.5019608, 1, 0, 1,
-0.643172, 0.1137675, -1.091381, 0.4941176, 1, 0, 1,
-0.638119, -1.656132, -2.563583, 0.4862745, 1, 0, 1,
-0.6379861, 1.347207, 0.08429233, 0.4823529, 1, 0, 1,
-0.6361335, 1.301101, -1.407638, 0.4745098, 1, 0, 1,
-0.6356326, -0.1174791, -1.845378, 0.4705882, 1, 0, 1,
-0.6332283, -1.198987, -2.220915, 0.4627451, 1, 0, 1,
-0.6313379, -1.440788, -2.060877, 0.4588235, 1, 0, 1,
-0.6275544, 1.582505, -1.038196, 0.4509804, 1, 0, 1,
-0.6251642, -1.232944, -2.900231, 0.4470588, 1, 0, 1,
-0.6214825, -1.035356, -0.9967566, 0.4392157, 1, 0, 1,
-0.6161557, 1.027174, -1.096574, 0.4352941, 1, 0, 1,
-0.6131195, -0.7127788, -2.002166, 0.427451, 1, 0, 1,
-0.6106085, 0.05198216, -1.019198, 0.4235294, 1, 0, 1,
-0.603111, 1.482198, 1.11455, 0.4156863, 1, 0, 1,
-0.600898, 0.2003703, -2.31048, 0.4117647, 1, 0, 1,
-0.5977845, 0.3299649, 0.202641, 0.4039216, 1, 0, 1,
-0.5952477, 1.302863, -0.102539, 0.3960784, 1, 0, 1,
-0.5945618, 0.3459847, -0.8364419, 0.3921569, 1, 0, 1,
-0.5933545, 0.1072866, -1.609632, 0.3843137, 1, 0, 1,
-0.592074, 0.3384054, -1.446033, 0.3803922, 1, 0, 1,
-0.5918278, 0.1091812, -1.51789, 0.372549, 1, 0, 1,
-0.5861026, 1.530598, -1.23484, 0.3686275, 1, 0, 1,
-0.5856369, -1.278914, -2.825409, 0.3607843, 1, 0, 1,
-0.585199, -1.495415, -4.270613, 0.3568628, 1, 0, 1,
-0.5834579, -1.300658, -2.146293, 0.3490196, 1, 0, 1,
-0.5789739, -0.6640598, -2.611827, 0.345098, 1, 0, 1,
-0.5729774, 0.6132762, -0.5661203, 0.3372549, 1, 0, 1,
-0.571153, 0.01977679, -1.826504, 0.3333333, 1, 0, 1,
-0.5710632, 1.235466, -0.2917597, 0.3254902, 1, 0, 1,
-0.5695986, 0.8206881, 0.2857579, 0.3215686, 1, 0, 1,
-0.5687972, -0.6606976, -2.790062, 0.3137255, 1, 0, 1,
-0.5654602, -0.3356181, -1.774974, 0.3098039, 1, 0, 1,
-0.5648307, 1.838408, 0.128044, 0.3019608, 1, 0, 1,
-0.563023, 0.9534559, 0.6842834, 0.2941177, 1, 0, 1,
-0.561207, -1.442519, -3.422153, 0.2901961, 1, 0, 1,
-0.5581504, 0.247741, -1.629574, 0.282353, 1, 0, 1,
-0.5544218, -0.4279538, -3.387089, 0.2784314, 1, 0, 1,
-0.5509222, -0.2682694, -1.045961, 0.2705882, 1, 0, 1,
-0.5493893, -0.1621059, -1.001261, 0.2666667, 1, 0, 1,
-0.5477239, -0.1442133, -1.051971, 0.2588235, 1, 0, 1,
-0.5457355, 0.438145, -1.392963, 0.254902, 1, 0, 1,
-0.5354547, -0.3385815, -1.515283, 0.2470588, 1, 0, 1,
-0.5340269, 0.1311402, 0.4910478, 0.2431373, 1, 0, 1,
-0.5291578, -0.427332, -2.28258, 0.2352941, 1, 0, 1,
-0.520737, -0.0673031, -1.239464, 0.2313726, 1, 0, 1,
-0.5193138, 1.596011, -1.678433, 0.2235294, 1, 0, 1,
-0.5152447, -0.7105439, -4.756951, 0.2196078, 1, 0, 1,
-0.5139176, -4.09404, -3.721594, 0.2117647, 1, 0, 1,
-0.5128445, -1.12571, -2.607694, 0.2078431, 1, 0, 1,
-0.5109577, 0.07386239, -2.293481, 0.2, 1, 0, 1,
-0.5078231, 1.732289, 0.7078043, 0.1921569, 1, 0, 1,
-0.5030487, -0.6180595, -1.214508, 0.1882353, 1, 0, 1,
-0.5000373, -1.003155, -3.152658, 0.1803922, 1, 0, 1,
-0.4978253, 2.006134, -2.461447, 0.1764706, 1, 0, 1,
-0.491322, -0.7869585, -2.090409, 0.1686275, 1, 0, 1,
-0.4888767, -0.6882619, -2.822955, 0.1647059, 1, 0, 1,
-0.4881743, 0.3501267, 0.4576079, 0.1568628, 1, 0, 1,
-0.487723, -0.08452484, -3.892705, 0.1529412, 1, 0, 1,
-0.4849628, -0.4076262, -0.6725967, 0.145098, 1, 0, 1,
-0.4828112, -0.3672872, -1.547517, 0.1411765, 1, 0, 1,
-0.482775, -1.457836, -1.591648, 0.1333333, 1, 0, 1,
-0.482042, 0.6727609, -0.5754662, 0.1294118, 1, 0, 1,
-0.4799232, 1.411597, 0.6185824, 0.1215686, 1, 0, 1,
-0.4762769, 0.7818827, -1.025478, 0.1176471, 1, 0, 1,
-0.474511, -1.423519, -4.160885, 0.1098039, 1, 0, 1,
-0.4713345, -0.3179554, -1.386921, 0.1058824, 1, 0, 1,
-0.4705577, -0.7991422, -3.076636, 0.09803922, 1, 0, 1,
-0.4698931, -0.3655164, -2.060536, 0.09019608, 1, 0, 1,
-0.4643868, -1.231521, -2.702265, 0.08627451, 1, 0, 1,
-0.4621294, 1.263839, -0.4428408, 0.07843138, 1, 0, 1,
-0.4618238, 0.07123613, -2.315812, 0.07450981, 1, 0, 1,
-0.4612012, 2.417239, -0.4313858, 0.06666667, 1, 0, 1,
-0.4583567, 0.7299736, -1.251294, 0.0627451, 1, 0, 1,
-0.4547785, 0.2644466, -2.472939, 0.05490196, 1, 0, 1,
-0.4537758, -0.4453294, -2.561789, 0.05098039, 1, 0, 1,
-0.4494196, 0.8680065, 0.07007872, 0.04313726, 1, 0, 1,
-0.4433575, 0.5900603, 0.4160446, 0.03921569, 1, 0, 1,
-0.4403656, 0.7151414, -0.2815401, 0.03137255, 1, 0, 1,
-0.4352646, -0.6623762, -3.333188, 0.02745098, 1, 0, 1,
-0.4296363, -0.03120108, -0.3716552, 0.01960784, 1, 0, 1,
-0.4230205, 1.847396, -0.970247, 0.01568628, 1, 0, 1,
-0.4216563, -1.024949, -4.245855, 0.007843138, 1, 0, 1,
-0.4184319, 0.7262745, -1.371141, 0.003921569, 1, 0, 1,
-0.4154747, 1.094218, -0.9530267, 0, 1, 0.003921569, 1,
-0.4153004, 0.5169558, -1.231187, 0, 1, 0.01176471, 1,
-0.4133129, 0.7359948, -0.9158215, 0, 1, 0.01568628, 1,
-0.4076953, -0.6614679, -2.29266, 0, 1, 0.02352941, 1,
-0.4070962, 1.175607, 1.303548, 0, 1, 0.02745098, 1,
-0.4052931, 0.06330707, -0.1604876, 0, 1, 0.03529412, 1,
-0.4036963, -1.77193, -3.029235, 0, 1, 0.03921569, 1,
-0.4030098, -2.432415, -1.497961, 0, 1, 0.04705882, 1,
-0.3965977, -1.812801, -3.635393, 0, 1, 0.05098039, 1,
-0.3938964, 0.6349468, 0.4157936, 0, 1, 0.05882353, 1,
-0.386939, 0.2357806, -1.822538, 0, 1, 0.0627451, 1,
-0.3794216, 1.89631, -0.5416322, 0, 1, 0.07058824, 1,
-0.3712943, 0.4550393, 0.5748218, 0, 1, 0.07450981, 1,
-0.3705633, 1.895184, -1.222203, 0, 1, 0.08235294, 1,
-0.3632405, -0.4871099, -0.7779549, 0, 1, 0.08627451, 1,
-0.3630036, -0.4774854, -2.535157, 0, 1, 0.09411765, 1,
-0.362764, -0.5966929, -2.38441, 0, 1, 0.1019608, 1,
-0.3505394, 1.21488, -0.8236194, 0, 1, 0.1058824, 1,
-0.3493144, -0.5049814, -2.391136, 0, 1, 0.1137255, 1,
-0.3491244, 2.116262, -0.8238795, 0, 1, 0.1176471, 1,
-0.3482693, 0.2094129, -0.1435218, 0, 1, 0.1254902, 1,
-0.3456864, 1.435738, -0.6738212, 0, 1, 0.1294118, 1,
-0.3446285, -0.9472771, -2.750621, 0, 1, 0.1372549, 1,
-0.342633, 1.178205, 0.09287401, 0, 1, 0.1411765, 1,
-0.3378667, -2.43985, -2.013466, 0, 1, 0.1490196, 1,
-0.3341434, -0.9809344, -2.208067, 0, 1, 0.1529412, 1,
-0.3233325, -1.04582, -3.182504, 0, 1, 0.1607843, 1,
-0.3231496, -0.06648752, -2.52779, 0, 1, 0.1647059, 1,
-0.3208236, -0.5083725, -1.557067, 0, 1, 0.172549, 1,
-0.3195312, -0.6283887, -2.271866, 0, 1, 0.1764706, 1,
-0.3192175, -0.5366326, -3.425089, 0, 1, 0.1843137, 1,
-0.3182513, 1.059237, -0.2517075, 0, 1, 0.1882353, 1,
-0.3179027, -2.005071, -3.298025, 0, 1, 0.1960784, 1,
-0.3107933, -0.5242242, -2.967541, 0, 1, 0.2039216, 1,
-0.3095348, -0.7101733, -3.634841, 0, 1, 0.2078431, 1,
-0.3089908, 0.5457935, -2.372883, 0, 1, 0.2156863, 1,
-0.3027312, 1.03037, -1.520117, 0, 1, 0.2196078, 1,
-0.3002992, -1.070726, -2.796899, 0, 1, 0.227451, 1,
-0.2995588, -2.296748, -3.828615, 0, 1, 0.2313726, 1,
-0.296536, -0.3006812, -3.996487, 0, 1, 0.2392157, 1,
-0.2951908, 1.802061, -0.6328446, 0, 1, 0.2431373, 1,
-0.2889961, 0.7919081, -2.489688, 0, 1, 0.2509804, 1,
-0.2875342, 0.736143, -1.11889, 0, 1, 0.254902, 1,
-0.2847775, 0.7298709, -1.541348, 0, 1, 0.2627451, 1,
-0.282167, 0.8620825, 1.415239, 0, 1, 0.2666667, 1,
-0.2798405, -0.4482757, -3.476373, 0, 1, 0.2745098, 1,
-0.2797478, -1.123424, -2.096288, 0, 1, 0.2784314, 1,
-0.2789407, -0.366426, -2.185857, 0, 1, 0.2862745, 1,
-0.277876, -1.292082, -3.86435, 0, 1, 0.2901961, 1,
-0.2771771, -0.3139741, -2.851792, 0, 1, 0.2980392, 1,
-0.2770984, -0.7505107, -1.249568, 0, 1, 0.3058824, 1,
-0.2741303, 0.4324057, 1.273675, 0, 1, 0.3098039, 1,
-0.2730038, 2.181604, 0.1228965, 0, 1, 0.3176471, 1,
-0.2729369, -0.6564729, -2.991593, 0, 1, 0.3215686, 1,
-0.2711841, 1.002088, -0.1740808, 0, 1, 0.3294118, 1,
-0.2701036, 0.638318, -1.529211, 0, 1, 0.3333333, 1,
-0.2699201, 1.29335, -0.2647454, 0, 1, 0.3411765, 1,
-0.2689202, 0.8105249, 0.0533165, 0, 1, 0.345098, 1,
-0.2656548, -0.2315061, -2.214615, 0, 1, 0.3529412, 1,
-0.2604418, 0.1076576, -2.813021, 0, 1, 0.3568628, 1,
-0.2591907, 1.085542, -1.365025, 0, 1, 0.3647059, 1,
-0.257022, -0.3414374, -2.22055, 0, 1, 0.3686275, 1,
-0.2567238, 1.597665, -2.524688, 0, 1, 0.3764706, 1,
-0.2562208, -1.377571, -2.84331, 0, 1, 0.3803922, 1,
-0.2555076, -1.069082, -2.56504, 0, 1, 0.3882353, 1,
-0.2552505, -1.810856, -3.466315, 0, 1, 0.3921569, 1,
-0.2547503, -0.4895263, -1.606161, 0, 1, 0.4, 1,
-0.254534, -0.9256813, -2.582124, 0, 1, 0.4078431, 1,
-0.2518119, 1.610757, 0.2680101, 0, 1, 0.4117647, 1,
-0.2502276, -1.755803, -2.609859, 0, 1, 0.4196078, 1,
-0.2486208, 0.587763, 1.188847, 0, 1, 0.4235294, 1,
-0.2477275, 0.5231448, -0.2326345, 0, 1, 0.4313726, 1,
-0.2397319, -1.342661, -4.93649, 0, 1, 0.4352941, 1,
-0.2372547, -0.876058, -3.30446, 0, 1, 0.4431373, 1,
-0.2367222, 0.67588, 0.3981838, 0, 1, 0.4470588, 1,
-0.2362227, 0.834694, -0.3772455, 0, 1, 0.454902, 1,
-0.2333333, 0.4287086, 0.09251234, 0, 1, 0.4588235, 1,
-0.2272404, -0.4203767, -2.102283, 0, 1, 0.4666667, 1,
-0.2255476, -0.07512201, -3.047695, 0, 1, 0.4705882, 1,
-0.2253671, 0.7099509, -1.796457, 0, 1, 0.4784314, 1,
-0.2213987, -0.2415821, -3.127239, 0, 1, 0.4823529, 1,
-0.2181955, -1.303391, -3.535472, 0, 1, 0.4901961, 1,
-0.2150131, 2.890225, 0.7638947, 0, 1, 0.4941176, 1,
-0.2137746, -1.257278, -3.939345, 0, 1, 0.5019608, 1,
-0.2132147, -0.6610768, -3.136666, 0, 1, 0.509804, 1,
-0.2043177, 0.9888026, -0.07471605, 0, 1, 0.5137255, 1,
-0.2042716, 0.396146, -0.4947451, 0, 1, 0.5215687, 1,
-0.2016093, -2.213682, -1.6935, 0, 1, 0.5254902, 1,
-0.2013998, -2.403039, -1.887213, 0, 1, 0.5333334, 1,
-0.1947329, -1.433342, -3.825897, 0, 1, 0.5372549, 1,
-0.1938055, 0.4350599, -0.2829593, 0, 1, 0.5450981, 1,
-0.1929859, -1.354819, -3.288688, 0, 1, 0.5490196, 1,
-0.1918213, -0.9869682, -2.490511, 0, 1, 0.5568628, 1,
-0.1869218, 0.9041454, 1.30683, 0, 1, 0.5607843, 1,
-0.1788331, -2.256031, -3.781843, 0, 1, 0.5686275, 1,
-0.1751226, 0.825462, 0.3913987, 0, 1, 0.572549, 1,
-0.1750239, 0.2931335, -1.445977, 0, 1, 0.5803922, 1,
-0.1749097, -1.808583, -3.150463, 0, 1, 0.5843138, 1,
-0.1703571, 0.05743081, -1.346363, 0, 1, 0.5921569, 1,
-0.1700236, 0.2624295, 0.2927317, 0, 1, 0.5960785, 1,
-0.1693247, -2.12717, -3.045949, 0, 1, 0.6039216, 1,
-0.1677728, 0.454948, -0.2782167, 0, 1, 0.6117647, 1,
-0.166616, 0.3244756, 1.340065, 0, 1, 0.6156863, 1,
-0.1651336, -0.4101227, -2.237431, 0, 1, 0.6235294, 1,
-0.1520269, -0.7661516, -3.502047, 0, 1, 0.627451, 1,
-0.1513881, 0.01367321, -1.634386, 0, 1, 0.6352941, 1,
-0.1454344, -0.3743428, -0.9554482, 0, 1, 0.6392157, 1,
-0.1412557, -0.7560564, -2.995085, 0, 1, 0.6470588, 1,
-0.1394823, -0.3288074, -2.281914, 0, 1, 0.6509804, 1,
-0.1390189, 0.4501354, -1.687715, 0, 1, 0.6588235, 1,
-0.1359368, 0.4050407, 1.639297, 0, 1, 0.6627451, 1,
-0.1287997, -1.25234, -4.386481, 0, 1, 0.6705883, 1,
-0.1251913, 1.432367, 1.178043, 0, 1, 0.6745098, 1,
-0.1242745, 0.2488122, -2.722619, 0, 1, 0.682353, 1,
-0.1224001, -1.160539, -3.318466, 0, 1, 0.6862745, 1,
-0.1211711, -0.223755, -3.24572, 0, 1, 0.6941177, 1,
-0.120296, -1.307128, -4.090971, 0, 1, 0.7019608, 1,
-0.1193321, -0.1064121, -2.133786, 0, 1, 0.7058824, 1,
-0.115944, 0.1831649, 0.9286554, 0, 1, 0.7137255, 1,
-0.1147615, 0.4352086, -1.380288, 0, 1, 0.7176471, 1,
-0.1100006, 0.7405908, -1.071192, 0, 1, 0.7254902, 1,
-0.108115, -0.354425, -2.229239, 0, 1, 0.7294118, 1,
-0.1005517, 0.4149933, -0.7130457, 0, 1, 0.7372549, 1,
-0.09991095, 0.3579072, -1.73033, 0, 1, 0.7411765, 1,
-0.09939526, 0.7264189, -0.2340392, 0, 1, 0.7490196, 1,
-0.09589171, -0.1594464, -2.268653, 0, 1, 0.7529412, 1,
-0.09436153, -0.8572124, -5.668809, 0, 1, 0.7607843, 1,
-0.09172004, 0.3652853, -1.351136, 0, 1, 0.7647059, 1,
-0.0916617, 1.052285, 2.010554, 0, 1, 0.772549, 1,
-0.09020366, 0.1286016, -2.054421, 0, 1, 0.7764706, 1,
-0.08671436, 1.217492, -0.5202219, 0, 1, 0.7843137, 1,
-0.08537843, 1.330888, 0.06046538, 0, 1, 0.7882353, 1,
-0.08433943, -0.04425774, -1.366233, 0, 1, 0.7960784, 1,
-0.08189666, 1.118478, -0.07794613, 0, 1, 0.8039216, 1,
-0.07874421, 0.01456186, -0.8302346, 0, 1, 0.8078431, 1,
-0.07588249, 1.263749, -0.3331749, 0, 1, 0.8156863, 1,
-0.07314485, -2.730023, -3.112299, 0, 1, 0.8196079, 1,
-0.07233761, -0.3738423, -2.27132, 0, 1, 0.827451, 1,
-0.06841338, -1.231495, -4.221318, 0, 1, 0.8313726, 1,
-0.05744377, -1.654816, -3.715584, 0, 1, 0.8392157, 1,
-0.05676422, 0.01900458, -2.461855, 0, 1, 0.8431373, 1,
-0.05238669, 1.192672, 0.4934294, 0, 1, 0.8509804, 1,
-0.04678666, -0.4587125, -2.98919, 0, 1, 0.854902, 1,
-0.04464768, 0.0448057, -2.042136, 0, 1, 0.8627451, 1,
-0.04254472, 1.799036, 0.01599804, 0, 1, 0.8666667, 1,
-0.04095507, 1.353763, -0.1036904, 0, 1, 0.8745098, 1,
-0.03616385, 0.2131072, -0.1874025, 0, 1, 0.8784314, 1,
-0.03432245, 1.786274, 0.5692814, 0, 1, 0.8862745, 1,
-0.03343176, 0.2256781, 0.4090564, 0, 1, 0.8901961, 1,
-0.03061194, -0.2443262, -3.723267, 0, 1, 0.8980392, 1,
-0.02860712, -2.00285, -3.310525, 0, 1, 0.9058824, 1,
-0.02820265, -1.333926, -2.341853, 0, 1, 0.9098039, 1,
-0.02665925, -0.5956698, -4.14648, 0, 1, 0.9176471, 1,
-0.02658614, -1.886872, -3.479858, 0, 1, 0.9215686, 1,
-0.02653292, -0.2176863, -3.117068, 0, 1, 0.9294118, 1,
-0.02650743, -0.3323439, -2.304691, 0, 1, 0.9333333, 1,
-0.02153611, 1.233177, -1.802045, 0, 1, 0.9411765, 1,
-0.02150168, -1.285946, -1.316927, 0, 1, 0.945098, 1,
-0.01848653, 0.03284358, -2.098115, 0, 1, 0.9529412, 1,
-0.016372, -0.1234964, -0.9657294, 0, 1, 0.9568627, 1,
-0.0152426, 1.45455, 0.2710904, 0, 1, 0.9647059, 1,
-0.01435776, 1.68652, -0.1930776, 0, 1, 0.9686275, 1,
-0.006630259, -0.0398354, -3.428336, 0, 1, 0.9764706, 1,
-0.005282302, -0.2264696, -3.096133, 0, 1, 0.9803922, 1,
-0.004779523, -0.3474963, -1.765392, 0, 1, 0.9882353, 1,
0.001077061, 0.2864894, -0.3133506, 0, 1, 0.9921569, 1,
0.001629229, 0.4432203, 0.2016728, 0, 1, 1, 1,
0.003646396, 0.5130688, -0.6142427, 0, 0.9921569, 1, 1,
0.006004388, -0.6151484, 3.138463, 0, 0.9882353, 1, 1,
0.007549376, 0.2989929, 0.8733823, 0, 0.9803922, 1, 1,
0.008870442, -0.4973571, 3.600065, 0, 0.9764706, 1, 1,
0.009041083, -0.9213023, 2.83937, 0, 0.9686275, 1, 1,
0.01139192, 0.2225302, 0.02249707, 0, 0.9647059, 1, 1,
0.01753061, -2.041037, 2.593544, 0, 0.9568627, 1, 1,
0.02099415, 0.1090401, -0.1351067, 0, 0.9529412, 1, 1,
0.02404717, -0.7241793, 1.84248, 0, 0.945098, 1, 1,
0.02421255, -0.6276479, 2.487744, 0, 0.9411765, 1, 1,
0.02463521, -0.7098453, 2.021298, 0, 0.9333333, 1, 1,
0.02893537, 0.2435468, 0.8310251, 0, 0.9294118, 1, 1,
0.03372842, -1.165149, 1.361427, 0, 0.9215686, 1, 1,
0.03537539, 0.2960623, -1.874942, 0, 0.9176471, 1, 1,
0.04235005, 0.3308983, 1.414431, 0, 0.9098039, 1, 1,
0.0450712, -1.306103, 5.020685, 0, 0.9058824, 1, 1,
0.04860697, -0.6844576, 4.693779, 0, 0.8980392, 1, 1,
0.04944928, 0.436855, -1.860717, 0, 0.8901961, 1, 1,
0.05315695, -0.8642172, 2.572912, 0, 0.8862745, 1, 1,
0.05560779, -2.233186, 3.1561, 0, 0.8784314, 1, 1,
0.0592681, 0.2037773, 1.212893, 0, 0.8745098, 1, 1,
0.06345588, 0.4008118, -0.04553023, 0, 0.8666667, 1, 1,
0.06419794, 0.1971712, 1.867369, 0, 0.8627451, 1, 1,
0.07120273, -0.1849885, 4.549082, 0, 0.854902, 1, 1,
0.07376956, 0.1837883, -0.2309503, 0, 0.8509804, 1, 1,
0.07880338, -0.2671451, 2.48311, 0, 0.8431373, 1, 1,
0.08076967, -0.4018883, 4.406752, 0, 0.8392157, 1, 1,
0.08277389, -0.2414975, 3.452234, 0, 0.8313726, 1, 1,
0.08355559, 0.3633819, -0.5576414, 0, 0.827451, 1, 1,
0.08488283, -0.2662074, 1.817735, 0, 0.8196079, 1, 1,
0.09002713, -1.536302, 2.145191, 0, 0.8156863, 1, 1,
0.09320603, -0.5297912, 2.175954, 0, 0.8078431, 1, 1,
0.09442222, 0.1259387, 0.1684251, 0, 0.8039216, 1, 1,
0.09635895, -0.6095882, 2.39137, 0, 0.7960784, 1, 1,
0.1021471, 1.254515, -0.413007, 0, 0.7882353, 1, 1,
0.1025089, 0.06305375, 0.7247608, 0, 0.7843137, 1, 1,
0.102669, 0.4257341, -0.2879702, 0, 0.7764706, 1, 1,
0.1033225, -1.563025, 2.779708, 0, 0.772549, 1, 1,
0.1050882, -2.30303, 2.452906, 0, 0.7647059, 1, 1,
0.1057172, 0.6850975, -0.2405611, 0, 0.7607843, 1, 1,
0.1104999, 1.283782, -0.6500054, 0, 0.7529412, 1, 1,
0.1111524, 1.000658, -0.1375328, 0, 0.7490196, 1, 1,
0.1112071, -0.4346307, 3.723119, 0, 0.7411765, 1, 1,
0.1137821, -0.1682307, 1.823512, 0, 0.7372549, 1, 1,
0.1157311, 0.06227136, 0.8008496, 0, 0.7294118, 1, 1,
0.1195786, -2.544931, 2.782735, 0, 0.7254902, 1, 1,
0.1201075, 1.012564, -0.2398661, 0, 0.7176471, 1, 1,
0.1230275, -1.247243, 2.087401, 0, 0.7137255, 1, 1,
0.1232344, -0.118657, 1.572944, 0, 0.7058824, 1, 1,
0.1232385, -1.51298, 2.276584, 0, 0.6980392, 1, 1,
0.1279508, -0.9988387, 1.744384, 0, 0.6941177, 1, 1,
0.1382263, 0.8053365, 1.350618, 0, 0.6862745, 1, 1,
0.1400234, -0.252314, 2.622031, 0, 0.682353, 1, 1,
0.1416904, 0.3481815, -0.9775719, 0, 0.6745098, 1, 1,
0.1424956, 0.04649013, 0.6869846, 0, 0.6705883, 1, 1,
0.1426309, 0.5051103, -0.761905, 0, 0.6627451, 1, 1,
0.1436161, -0.09650467, 2.601204, 0, 0.6588235, 1, 1,
0.1440234, 1.322264, -1.418333, 0, 0.6509804, 1, 1,
0.1460599, -0.6694341, 1.52945, 0, 0.6470588, 1, 1,
0.1479076, -0.4351613, 2.257768, 0, 0.6392157, 1, 1,
0.1500414, 1.012331, -1.800701, 0, 0.6352941, 1, 1,
0.1574007, -0.7669562, 2.95488, 0, 0.627451, 1, 1,
0.1600422, -0.4400528, 3.28489, 0, 0.6235294, 1, 1,
0.1602384, 0.9517044, 0.02288655, 0, 0.6156863, 1, 1,
0.1605418, -0.4912554, 2.655529, 0, 0.6117647, 1, 1,
0.1614338, -0.0510882, 1.554924, 0, 0.6039216, 1, 1,
0.161984, 0.2998085, 0.943467, 0, 0.5960785, 1, 1,
0.1636676, 0.4499018, 0.5272987, 0, 0.5921569, 1, 1,
0.1664946, 1.040619, 1.283928, 0, 0.5843138, 1, 1,
0.1685051, 0.1454501, -0.6052613, 0, 0.5803922, 1, 1,
0.1842637, 0.8823222, 1.036057, 0, 0.572549, 1, 1,
0.1920976, 0.1599498, -0.6826023, 0, 0.5686275, 1, 1,
0.1958246, 2.537591, -0.9690225, 0, 0.5607843, 1, 1,
0.1962859, -0.8332424, 2.353304, 0, 0.5568628, 1, 1,
0.1971022, -0.7020879, 3.853181, 0, 0.5490196, 1, 1,
0.1988854, -0.5081218, 2.522931, 0, 0.5450981, 1, 1,
0.1997025, -1.151587, 2.147414, 0, 0.5372549, 1, 1,
0.2004638, -1.591961, 2.355088, 0, 0.5333334, 1, 1,
0.2069, -0.7908561, 2.051736, 0, 0.5254902, 1, 1,
0.2135154, -1.020418, 3.728141, 0, 0.5215687, 1, 1,
0.2169461, -2.457833, 3.912508, 0, 0.5137255, 1, 1,
0.2207768, 0.3482399, 2.061438, 0, 0.509804, 1, 1,
0.2208632, -1.26173, 5.184524, 0, 0.5019608, 1, 1,
0.2220155, 0.6486559, -0.9714893, 0, 0.4941176, 1, 1,
0.2231154, 1.627726, -0.9396007, 0, 0.4901961, 1, 1,
0.2236135, -0.9837548, 3.457572, 0, 0.4823529, 1, 1,
0.2261138, -0.3211464, 1.37498, 0, 0.4784314, 1, 1,
0.2337462, 0.7656731, 0.09261657, 0, 0.4705882, 1, 1,
0.2389465, 0.9301615, -0.7686405, 0, 0.4666667, 1, 1,
0.2406656, 1.292436, 1.044532, 0, 0.4588235, 1, 1,
0.2407254, -0.7089912, 2.96172, 0, 0.454902, 1, 1,
0.2419217, -0.429395, 2.47354, 0, 0.4470588, 1, 1,
0.2430074, 1.014566, 1.364324, 0, 0.4431373, 1, 1,
0.2496922, 0.423077, 0.2145659, 0, 0.4352941, 1, 1,
0.251445, -0.45948, 3.931134, 0, 0.4313726, 1, 1,
0.2527239, -1.170342, 5.106596, 0, 0.4235294, 1, 1,
0.254215, -0.3146037, -0.07301152, 0, 0.4196078, 1, 1,
0.2548636, -0.9351366, 3.808379, 0, 0.4117647, 1, 1,
0.2589394, -0.3734772, 1.554244, 0, 0.4078431, 1, 1,
0.2624015, 0.1117959, 1.027357, 0, 0.4, 1, 1,
0.2635979, -0.2726134, 3.005366, 0, 0.3921569, 1, 1,
0.2653517, -0.339559, 3.081607, 0, 0.3882353, 1, 1,
0.2654727, -0.7182471, 2.574785, 0, 0.3803922, 1, 1,
0.2700638, 1.614261, 1.004408, 0, 0.3764706, 1, 1,
0.2728318, 0.9975329, -0.4864196, 0, 0.3686275, 1, 1,
0.27577, -0.1049477, 1.394335, 0, 0.3647059, 1, 1,
0.2758666, 0.8052293, -0.7444848, 0, 0.3568628, 1, 1,
0.276994, -1.085556, 3.028932, 0, 0.3529412, 1, 1,
0.2787045, 0.04690453, 1.01145, 0, 0.345098, 1, 1,
0.279821, 1.358572, 0.643881, 0, 0.3411765, 1, 1,
0.2811506, 0.08230568, 1.977267, 0, 0.3333333, 1, 1,
0.2875811, -0.6279303, 2.454957, 0, 0.3294118, 1, 1,
0.2890439, 0.1511025, 1.59795, 0, 0.3215686, 1, 1,
0.2914509, 1.767037, 0.229593, 0, 0.3176471, 1, 1,
0.2928994, 0.4168777, -0.844349, 0, 0.3098039, 1, 1,
0.2936005, -0.3794172, 1.915712, 0, 0.3058824, 1, 1,
0.2955519, -0.6180934, 3.59931, 0, 0.2980392, 1, 1,
0.2968511, 0.4060313, 1.28373, 0, 0.2901961, 1, 1,
0.2969063, 0.8020053, 1.201826, 0, 0.2862745, 1, 1,
0.2980977, 1.463002, 0.1580099, 0, 0.2784314, 1, 1,
0.3003644, 1.387617, 0.2377173, 0, 0.2745098, 1, 1,
0.3018987, 0.3246282, 0.007022959, 0, 0.2666667, 1, 1,
0.304955, 0.6009737, 1.497769, 0, 0.2627451, 1, 1,
0.3089277, 0.9921342, -0.3461476, 0, 0.254902, 1, 1,
0.3117086, -0.5902525, 3.072683, 0, 0.2509804, 1, 1,
0.314465, 0.508747, 1.97592, 0, 0.2431373, 1, 1,
0.3166282, -0.730126, 3.86902, 0, 0.2392157, 1, 1,
0.3197722, 0.5984924, -0.9877253, 0, 0.2313726, 1, 1,
0.3205466, 2.350061, -0.7941339, 0, 0.227451, 1, 1,
0.3229037, 0.480146, 1.928585, 0, 0.2196078, 1, 1,
0.3242187, 0.032, 2.439322, 0, 0.2156863, 1, 1,
0.3244717, -0.2090171, 2.559582, 0, 0.2078431, 1, 1,
0.3303262, -0.9569163, 0.81069, 0, 0.2039216, 1, 1,
0.3364398, -0.7079347, 1.631004, 0, 0.1960784, 1, 1,
0.3390977, -0.4235082, 1.709287, 0, 0.1882353, 1, 1,
0.3426678, -0.9971606, 0.9757685, 0, 0.1843137, 1, 1,
0.3441222, 0.661795, -0.4578941, 0, 0.1764706, 1, 1,
0.3481524, -1.211644, 2.076161, 0, 0.172549, 1, 1,
0.3557955, 0.6438982, -0.4589114, 0, 0.1647059, 1, 1,
0.3590178, -2.784439, 2.93036, 0, 0.1607843, 1, 1,
0.3595812, -0.297424, 1.751951, 0, 0.1529412, 1, 1,
0.3610584, 0.1451961, 0.5864038, 0, 0.1490196, 1, 1,
0.3625994, 1.738208, -0.1971545, 0, 0.1411765, 1, 1,
0.3680151, -0.8803062, 1.98208, 0, 0.1372549, 1, 1,
0.3687258, 0.218794, 0.4602027, 0, 0.1294118, 1, 1,
0.3712655, -2.134372, 3.987207, 0, 0.1254902, 1, 1,
0.371335, -1.250062, 1.536375, 0, 0.1176471, 1, 1,
0.3730074, -1.348851, 3.879168, 0, 0.1137255, 1, 1,
0.3766902, -1.158076, 4.671432, 0, 0.1058824, 1, 1,
0.3768251, -2.034335, 2.755847, 0, 0.09803922, 1, 1,
0.379922, 1.210844, 0.7581425, 0, 0.09411765, 1, 1,
0.3822973, 0.2677054, 1.882215, 0, 0.08627451, 1, 1,
0.3835876, 0.03223407, 2.068066, 0, 0.08235294, 1, 1,
0.3838218, -0.2816505, 1.850682, 0, 0.07450981, 1, 1,
0.388431, 1.884984, -1.137151, 0, 0.07058824, 1, 1,
0.3888908, -1.207423, 2.683382, 0, 0.0627451, 1, 1,
0.389347, 0.5957718, 0.1853007, 0, 0.05882353, 1, 1,
0.3897798, 0.5043851, 0.8447236, 0, 0.05098039, 1, 1,
0.3916374, -1.264875, 3.848522, 0, 0.04705882, 1, 1,
0.3935954, -0.3465092, 2.567754, 0, 0.03921569, 1, 1,
0.3954083, -0.007864634, 2.33325, 0, 0.03529412, 1, 1,
0.3964211, 0.412449, -0.0715888, 0, 0.02745098, 1, 1,
0.3973234, -0.3873708, 1.837006, 0, 0.02352941, 1, 1,
0.3980753, 0.4891602, 0.2177699, 0, 0.01568628, 1, 1,
0.3982828, 0.3856196, 1.265934, 0, 0.01176471, 1, 1,
0.3992876, 0.2076651, -0.1043982, 0, 0.003921569, 1, 1,
0.4001117, 0.1675539, 1.830822, 0.003921569, 0, 1, 1,
0.4006082, 0.6713046, 1.089267, 0.007843138, 0, 1, 1,
0.4049979, -0.8253124, 1.995559, 0.01568628, 0, 1, 1,
0.4097129, -0.5024994, 3.446095, 0.01960784, 0, 1, 1,
0.4156361, -1.597682, 2.960875, 0.02745098, 0, 1, 1,
0.4165448, 0.07885928, 1.555405, 0.03137255, 0, 1, 1,
0.4264514, -0.5995796, 2.502567, 0.03921569, 0, 1, 1,
0.4290906, 0.086707, 1.074923, 0.04313726, 0, 1, 1,
0.4300245, -0.9889033, 3.846522, 0.05098039, 0, 1, 1,
0.4321557, 0.6155423, 0.7500896, 0.05490196, 0, 1, 1,
0.4344266, -1.180712, 2.918931, 0.0627451, 0, 1, 1,
0.4365881, 1.227993, -0.8081776, 0.06666667, 0, 1, 1,
0.4366249, -2.017326, 2.685541, 0.07450981, 0, 1, 1,
0.4366576, 0.3747027, 0.3138723, 0.07843138, 0, 1, 1,
0.4382071, -0.31345, 3.642899, 0.08627451, 0, 1, 1,
0.4386649, -0.3826583, 2.715184, 0.09019608, 0, 1, 1,
0.4514256, -1.928824, 2.139918, 0.09803922, 0, 1, 1,
0.4526308, 0.4547446, -0.1675474, 0.1058824, 0, 1, 1,
0.4555183, 0.7539067, 1.750212, 0.1098039, 0, 1, 1,
0.4617013, -0.01972707, 1.161059, 0.1176471, 0, 1, 1,
0.4643477, -1.172465, 3.799501, 0.1215686, 0, 1, 1,
0.4734306, 0.4260497, 2.21096, 0.1294118, 0, 1, 1,
0.4748948, -1.09093, 2.041293, 0.1333333, 0, 1, 1,
0.4759398, 0.516288, -0.8900383, 0.1411765, 0, 1, 1,
0.4820752, -0.145663, 2.186147, 0.145098, 0, 1, 1,
0.484478, 1.530222, 1.272495, 0.1529412, 0, 1, 1,
0.4873573, -0.09237995, 4.499193, 0.1568628, 0, 1, 1,
0.4916754, 0.3587506, 0.4944597, 0.1647059, 0, 1, 1,
0.4932263, 0.09133459, 1.906991, 0.1686275, 0, 1, 1,
0.4949816, -1.156525, 1.020257, 0.1764706, 0, 1, 1,
0.4962115, 0.9725336, -0.1339062, 0.1803922, 0, 1, 1,
0.4967553, 2.214446, 1.167743, 0.1882353, 0, 1, 1,
0.4986762, 0.4696624, 0.763325, 0.1921569, 0, 1, 1,
0.4990105, -1.017267, 1.223774, 0.2, 0, 1, 1,
0.5021545, -0.1469945, 3.518447, 0.2078431, 0, 1, 1,
0.506605, -1.753453, 3.262951, 0.2117647, 0, 1, 1,
0.5089921, 0.9129975, 0.3101326, 0.2196078, 0, 1, 1,
0.514557, 1.254677, -0.6459012, 0.2235294, 0, 1, 1,
0.5145822, 2.757851, 0.1577899, 0.2313726, 0, 1, 1,
0.5205881, -0.3059751, 3.021098, 0.2352941, 0, 1, 1,
0.520968, 0.8241071, 0.398994, 0.2431373, 0, 1, 1,
0.522238, -0.3595706, 3.995077, 0.2470588, 0, 1, 1,
0.5265129, 0.1205405, 0.1388339, 0.254902, 0, 1, 1,
0.5268376, -0.973897, 2.079077, 0.2588235, 0, 1, 1,
0.5273936, -1.225003, 2.520338, 0.2666667, 0, 1, 1,
0.5279778, -0.2960213, 1.942355, 0.2705882, 0, 1, 1,
0.531278, -1.214437, 2.852736, 0.2784314, 0, 1, 1,
0.5374749, -1.007468, 4.719307, 0.282353, 0, 1, 1,
0.538516, 0.3716885, -0.0229324, 0.2901961, 0, 1, 1,
0.5424013, -2.31043, 3.699364, 0.2941177, 0, 1, 1,
0.5427589, -1.178956, 2.118406, 0.3019608, 0, 1, 1,
0.5464351, -0.6320521, 3.554193, 0.3098039, 0, 1, 1,
0.5503772, 0.699168, -1.171766, 0.3137255, 0, 1, 1,
0.5528024, -1.035492, 3.59848, 0.3215686, 0, 1, 1,
0.5530886, -1.104736, 3.171201, 0.3254902, 0, 1, 1,
0.555108, -1.004401, 2.770588, 0.3333333, 0, 1, 1,
0.5561599, -0.279485, 2.24481, 0.3372549, 0, 1, 1,
0.5568736, 0.3239318, 1.20692, 0.345098, 0, 1, 1,
0.5569777, -0.5398866, 1.955832, 0.3490196, 0, 1, 1,
0.5609782, -0.3775096, 3.68243, 0.3568628, 0, 1, 1,
0.5610732, 0.4959753, 1.215488, 0.3607843, 0, 1, 1,
0.5674475, -0.2593495, 3.307307, 0.3686275, 0, 1, 1,
0.5699942, -0.9426041, 4.177404, 0.372549, 0, 1, 1,
0.5729241, -0.7637919, 2.025533, 0.3803922, 0, 1, 1,
0.5747641, -0.04904422, 1.135416, 0.3843137, 0, 1, 1,
0.5775176, -1.527559, 4.21848, 0.3921569, 0, 1, 1,
0.5788316, 0.3048838, -0.7849897, 0.3960784, 0, 1, 1,
0.5793865, -0.6640227, 4.698444, 0.4039216, 0, 1, 1,
0.5846083, 0.3957635, 0.5610013, 0.4117647, 0, 1, 1,
0.5865312, 1.632754, 0.4355975, 0.4156863, 0, 1, 1,
0.586846, 0.6835641, 1.002613, 0.4235294, 0, 1, 1,
0.5868962, 0.521104, 0.204704, 0.427451, 0, 1, 1,
0.5921312, 0.1703689, 0.4894111, 0.4352941, 0, 1, 1,
0.5953508, -1.13484, 4.625477, 0.4392157, 0, 1, 1,
0.5964286, 0.003481464, 1.306259, 0.4470588, 0, 1, 1,
0.5993412, 1.084509, 1.48183, 0.4509804, 0, 1, 1,
0.6011801, 0.13828, 1.267998, 0.4588235, 0, 1, 1,
0.605436, 1.73821, 0.186445, 0.4627451, 0, 1, 1,
0.6071565, 0.260986, 2.375083, 0.4705882, 0, 1, 1,
0.6095694, -0.1573931, 0.48521, 0.4745098, 0, 1, 1,
0.6099977, 0.04510935, 1.174041, 0.4823529, 0, 1, 1,
0.6114537, 1.550237, 0.6150285, 0.4862745, 0, 1, 1,
0.6136028, 0.003605098, -0.3455369, 0.4941176, 0, 1, 1,
0.623715, -0.5383841, 2.007758, 0.5019608, 0, 1, 1,
0.6261688, -0.08771351, 1.915673, 0.5058824, 0, 1, 1,
0.6267754, 2.560108, -1.56126, 0.5137255, 0, 1, 1,
0.6277088, 1.22061, -0.4569604, 0.5176471, 0, 1, 1,
0.6314948, 0.6857709, 0.9973745, 0.5254902, 0, 1, 1,
0.6371042, 0.6495336, 3.168115, 0.5294118, 0, 1, 1,
0.643394, 2.053363, -0.5501752, 0.5372549, 0, 1, 1,
0.6461871, -0.07653701, 0.7777172, 0.5411765, 0, 1, 1,
0.6468371, 0.702237, 1.259656, 0.5490196, 0, 1, 1,
0.6474808, -0.3963084, 2.741441, 0.5529412, 0, 1, 1,
0.64764, 1.917728, 0.2731634, 0.5607843, 0, 1, 1,
0.6583896, 1.967556, -0.2169391, 0.5647059, 0, 1, 1,
0.6590896, -1.391085, 2.063265, 0.572549, 0, 1, 1,
0.6611063, -1.793257, 3.129344, 0.5764706, 0, 1, 1,
0.6631331, 0.5554614, 1.891521, 0.5843138, 0, 1, 1,
0.6650945, -1.004368, 0.9167569, 0.5882353, 0, 1, 1,
0.6721497, 0.7011436, 0.9156876, 0.5960785, 0, 1, 1,
0.6763192, -1.657362, 2.446352, 0.6039216, 0, 1, 1,
0.676998, -1.897401, 1.527406, 0.6078432, 0, 1, 1,
0.6816369, 1.42058, 0.2563153, 0.6156863, 0, 1, 1,
0.6864501, -2.095639, 3.471502, 0.6196079, 0, 1, 1,
0.6895158, 0.9369102, 1.355976, 0.627451, 0, 1, 1,
0.6896238, -0.4041909, 1.73965, 0.6313726, 0, 1, 1,
0.6905235, -0.1058632, 2.102061, 0.6392157, 0, 1, 1,
0.695936, -0.5616863, 0.5348826, 0.6431373, 0, 1, 1,
0.6960533, -0.01270226, 2.326414, 0.6509804, 0, 1, 1,
0.7004097, -0.8314098, 3.516976, 0.654902, 0, 1, 1,
0.7018031, -0.854777, 1.771743, 0.6627451, 0, 1, 1,
0.7018996, 0.8891562, -0.3814721, 0.6666667, 0, 1, 1,
0.7113125, 1.239784, -1.260689, 0.6745098, 0, 1, 1,
0.7137869, 0.305028, 1.620206, 0.6784314, 0, 1, 1,
0.7173553, -0.9875997, -0.2053037, 0.6862745, 0, 1, 1,
0.7205416, 0.06174392, 1.291193, 0.6901961, 0, 1, 1,
0.7304254, 1.25583, -0.6320718, 0.6980392, 0, 1, 1,
0.7322611, -1.941489, 4.033844, 0.7058824, 0, 1, 1,
0.7344348, 1.860022, 1.38138, 0.7098039, 0, 1, 1,
0.7359937, 1.189785, 0.7899668, 0.7176471, 0, 1, 1,
0.7380741, -1.337064, 2.027455, 0.7215686, 0, 1, 1,
0.7394536, -0.4013229, 2.94073, 0.7294118, 0, 1, 1,
0.7402418, -2.262775, 2.601987, 0.7333333, 0, 1, 1,
0.7512866, 0.8297741, 0.5899588, 0.7411765, 0, 1, 1,
0.7545238, 0.1746334, -0.8261713, 0.7450981, 0, 1, 1,
0.7549807, 0.6237256, 0.5433084, 0.7529412, 0, 1, 1,
0.7593047, 0.3127019, 0.7361106, 0.7568628, 0, 1, 1,
0.7613657, 0.2181838, 1.742239, 0.7647059, 0, 1, 1,
0.7679442, -0.5688938, 1.827148, 0.7686275, 0, 1, 1,
0.770675, 0.4473439, -0.4863831, 0.7764706, 0, 1, 1,
0.771692, -1.458033, 3.898899, 0.7803922, 0, 1, 1,
0.7723334, -0.4483583, 0.5039328, 0.7882353, 0, 1, 1,
0.7853349, 0.6533165, 1.102389, 0.7921569, 0, 1, 1,
0.7869647, -0.1501347, 2.405108, 0.8, 0, 1, 1,
0.7916596, 1.139851, 0.185323, 0.8078431, 0, 1, 1,
0.7943384, 0.879061, -2.085444, 0.8117647, 0, 1, 1,
0.7996714, -0.2939141, 1.533713, 0.8196079, 0, 1, 1,
0.8079786, 0.1040486, 1.608748, 0.8235294, 0, 1, 1,
0.8119296, 0.3306099, 1.950098, 0.8313726, 0, 1, 1,
0.8195335, 1.639987, 0.08817811, 0.8352941, 0, 1, 1,
0.8211841, 1.701999, 0.0415324, 0.8431373, 0, 1, 1,
0.8281189, -0.07819538, 0.7013328, 0.8470588, 0, 1, 1,
0.840511, 1.194881, 1.047499, 0.854902, 0, 1, 1,
0.8431664, -0.1956622, 2.028693, 0.8588235, 0, 1, 1,
0.8511384, 0.1482893, 1.101757, 0.8666667, 0, 1, 1,
0.8511754, 0.3784518, 1.615057, 0.8705882, 0, 1, 1,
0.8520233, -0.7812848, 3.753015, 0.8784314, 0, 1, 1,
0.8521541, -1.967963, 2.347844, 0.8823529, 0, 1, 1,
0.861223, -0.7721624, 0.7800365, 0.8901961, 0, 1, 1,
0.8669642, -1.684866, 1.83704, 0.8941177, 0, 1, 1,
0.8741669, 0.6664195, -0.2889272, 0.9019608, 0, 1, 1,
0.8747776, -0.2405046, 2.651865, 0.9098039, 0, 1, 1,
0.8772328, -0.3298557, 1.747972, 0.9137255, 0, 1, 1,
0.8778383, -1.273273, 0.7019187, 0.9215686, 0, 1, 1,
0.8796756, 0.245603, 0.190258, 0.9254902, 0, 1, 1,
0.8804904, 0.1233073, 2.126491, 0.9333333, 0, 1, 1,
0.8823503, -0.8439484, 3.085753, 0.9372549, 0, 1, 1,
0.88427, -1.127286, 2.670611, 0.945098, 0, 1, 1,
0.8883547, -0.8230042, 2.428052, 0.9490196, 0, 1, 1,
0.8892478, 0.1796635, 2.150341, 0.9568627, 0, 1, 1,
0.8905788, -0.3415385, 3.02656, 0.9607843, 0, 1, 1,
0.897182, 1.568828, 0.2504404, 0.9686275, 0, 1, 1,
0.8984048, -2.248152, 1.043687, 0.972549, 0, 1, 1,
0.898527, 1.488323, 0.6616116, 0.9803922, 0, 1, 1,
0.9011909, 1.925625, 0.2933287, 0.9843137, 0, 1, 1,
0.9094199, 0.09665892, 1.042956, 0.9921569, 0, 1, 1,
0.9115486, -1.403419, 1.323728, 0.9960784, 0, 1, 1,
0.9153544, 1.164821, 1.364601, 1, 0, 0.9960784, 1,
0.9162033, -0.7198836, 2.386763, 1, 0, 0.9882353, 1,
0.91681, -0.07055252, 0.5553045, 1, 0, 0.9843137, 1,
0.9202946, -1.606683, 0.7386048, 1, 0, 0.9764706, 1,
0.9239031, 1.475776, 1.491069, 1, 0, 0.972549, 1,
0.9461234, -0.7168633, 0.8327135, 1, 0, 0.9647059, 1,
0.9465135, 1.042879, -0.4517921, 1, 0, 0.9607843, 1,
0.9470814, -2.127776, 2.876617, 1, 0, 0.9529412, 1,
0.9492646, -1.192625, 0.7929437, 1, 0, 0.9490196, 1,
0.9498518, -0.03048302, 1.034272, 1, 0, 0.9411765, 1,
0.9557155, 0.8228796, 1.61729, 1, 0, 0.9372549, 1,
0.9639065, 0.9919427, 2.185757, 1, 0, 0.9294118, 1,
0.9664722, 0.7706831, -0.0629653, 1, 0, 0.9254902, 1,
0.9699008, -0.2587961, 2.012881, 1, 0, 0.9176471, 1,
0.9805574, 0.6273037, -1.218797, 1, 0, 0.9137255, 1,
0.9825343, 0.2989119, 2.628569, 1, 0, 0.9058824, 1,
0.9905479, 0.291742, -0.01970025, 1, 0, 0.9019608, 1,
0.9944894, -0.4299358, 0.9700732, 1, 0, 0.8941177, 1,
1.000572, 1.777978, 1.589229, 1, 0, 0.8862745, 1,
1.002601, -0.5667402, 2.760584, 1, 0, 0.8823529, 1,
1.017818, -1.457599, 1.300853, 1, 0, 0.8745098, 1,
1.021573, -2.092995, 4.305918, 1, 0, 0.8705882, 1,
1.026788, -2.165577, 2.446205, 1, 0, 0.8627451, 1,
1.028228, 0.381552, -0.06726552, 1, 0, 0.8588235, 1,
1.036068, -0.2745654, 2.642798, 1, 0, 0.8509804, 1,
1.042864, 0.6933954, 2.215906, 1, 0, 0.8470588, 1,
1.051521, 1.402654, 0.1461355, 1, 0, 0.8392157, 1,
1.058136, 0.3659312, 1.360796, 1, 0, 0.8352941, 1,
1.068568, -0.09404961, 1.661045, 1, 0, 0.827451, 1,
1.077095, -2.60813, 2.76106, 1, 0, 0.8235294, 1,
1.078092, -0.03582609, 2.513803, 1, 0, 0.8156863, 1,
1.083292, -0.4315132, 2.024544, 1, 0, 0.8117647, 1,
1.086802, -0.02183746, 0.9604878, 1, 0, 0.8039216, 1,
1.095941, 2.214975, -0.6755359, 1, 0, 0.7960784, 1,
1.100703, -0.6452095, 2.364467, 1, 0, 0.7921569, 1,
1.103889, -2.223591, 3.127361, 1, 0, 0.7843137, 1,
1.104215, 0.7587856, 2.702005, 1, 0, 0.7803922, 1,
1.106742, 0.8574631, 0.3212697, 1, 0, 0.772549, 1,
1.111864, 0.5423723, 2.50823, 1, 0, 0.7686275, 1,
1.114412, 0.9531201, 1.266079, 1, 0, 0.7607843, 1,
1.125288, -0.4936676, 0.2654086, 1, 0, 0.7568628, 1,
1.129931, -0.5021443, 0.9364352, 1, 0, 0.7490196, 1,
1.131374, -1.25805, 3.23327, 1, 0, 0.7450981, 1,
1.13207, 0.1065673, 4.376078, 1, 0, 0.7372549, 1,
1.133484, 0.9941168, 2.35828, 1, 0, 0.7333333, 1,
1.134482, -0.6342219, 0.1819005, 1, 0, 0.7254902, 1,
1.140008, 0.567947, 0.4342475, 1, 0, 0.7215686, 1,
1.140657, 2.039834, 1.211778, 1, 0, 0.7137255, 1,
1.147601, 1.145663, -0.03090866, 1, 0, 0.7098039, 1,
1.169708, 0.04108544, 1.265913, 1, 0, 0.7019608, 1,
1.177518, -1.050177, 2.096929, 1, 0, 0.6941177, 1,
1.185616, 0.7430097, 1.675846, 1, 0, 0.6901961, 1,
1.192526, 0.08422866, 1.81947, 1, 0, 0.682353, 1,
1.206107, 0.2685308, -0.2563362, 1, 0, 0.6784314, 1,
1.206465, -1.57189, 3.517853, 1, 0, 0.6705883, 1,
1.219785, 0.5066904, 0.9914061, 1, 0, 0.6666667, 1,
1.220217, 1.270637, 0.8765973, 1, 0, 0.6588235, 1,
1.221053, -0.788096, 3.098542, 1, 0, 0.654902, 1,
1.221228, -0.4449611, 2.513583, 1, 0, 0.6470588, 1,
1.222669, 0.04353087, 3.278812, 1, 0, 0.6431373, 1,
1.227404, -0.4717742, 1.153393, 1, 0, 0.6352941, 1,
1.248501, -0.7713882, 0.8043993, 1, 0, 0.6313726, 1,
1.262466, -0.08446191, 0.8550313, 1, 0, 0.6235294, 1,
1.263348, -0.125633, 2.053829, 1, 0, 0.6196079, 1,
1.266563, -0.102953, 1.171093, 1, 0, 0.6117647, 1,
1.267828, 0.7761663, 1.011458, 1, 0, 0.6078432, 1,
1.274667, -1.394448, 2.98339, 1, 0, 0.6, 1,
1.277412, 1.233334, 1.955058, 1, 0, 0.5921569, 1,
1.290703, -0.6994911, 1.376912, 1, 0, 0.5882353, 1,
1.299772, 1.843776, -0.1814351, 1, 0, 0.5803922, 1,
1.305627, -0.6203567, 1.985896, 1, 0, 0.5764706, 1,
1.311705, -0.1123338, 1.492819, 1, 0, 0.5686275, 1,
1.313488, -1.124233, 1.026224, 1, 0, 0.5647059, 1,
1.317672, -2.029978, -0.1145332, 1, 0, 0.5568628, 1,
1.320789, 0.879182, 0.8991825, 1, 0, 0.5529412, 1,
1.334032, 1.758669, 1.448423, 1, 0, 0.5450981, 1,
1.336294, -0.4771259, 1.70732, 1, 0, 0.5411765, 1,
1.338559, 0.02626605, 2.418702, 1, 0, 0.5333334, 1,
1.34171, 0.6567403, 0.5695068, 1, 0, 0.5294118, 1,
1.350014, 1.54083, 1.790844, 1, 0, 0.5215687, 1,
1.352551, -0.3417675, 0.3796033, 1, 0, 0.5176471, 1,
1.366342, 0.6007673, -0.1029025, 1, 0, 0.509804, 1,
1.367541, -0.64622, 2.311215, 1, 0, 0.5058824, 1,
1.37792, 0.7544357, 1.94688, 1, 0, 0.4980392, 1,
1.381028, 1.635297, 1.346283, 1, 0, 0.4901961, 1,
1.384645, 0.2594009, -0.1513353, 1, 0, 0.4862745, 1,
1.391392, 0.8616887, 1.146122, 1, 0, 0.4784314, 1,
1.411634, -0.6941479, 2.343078, 1, 0, 0.4745098, 1,
1.417785, -0.5427994, 2.834246, 1, 0, 0.4666667, 1,
1.418476, -0.1958228, 0.5603766, 1, 0, 0.4627451, 1,
1.42169, 1.196461, 0.3704039, 1, 0, 0.454902, 1,
1.428006, -0.5871193, 0.05365543, 1, 0, 0.4509804, 1,
1.43355, 0.1614309, 2.276596, 1, 0, 0.4431373, 1,
1.449724, -0.2206695, -0.01829244, 1, 0, 0.4392157, 1,
1.450069, 0.1389896, 1.267512, 1, 0, 0.4313726, 1,
1.458368, 1.468504, 1.728969, 1, 0, 0.427451, 1,
1.462396, 0.657877, 1.489476, 1, 0, 0.4196078, 1,
1.468836, -1.29929, 0.6644815, 1, 0, 0.4156863, 1,
1.471988, 0.2416001, 1.539267, 1, 0, 0.4078431, 1,
1.482635, -1.578477, 2.478599, 1, 0, 0.4039216, 1,
1.484226, 0.1891557, 1.095248, 1, 0, 0.3960784, 1,
1.48826, -1.210411, 2.240618, 1, 0, 0.3882353, 1,
1.500754, -0.3734012, 2.58649, 1, 0, 0.3843137, 1,
1.502572, -0.08848906, 3.453017, 1, 0, 0.3764706, 1,
1.504419, -0.826585, 2.178382, 1, 0, 0.372549, 1,
1.509094, 0.2147397, 0.9423774, 1, 0, 0.3647059, 1,
1.50924, 0.3220109, 1.298744, 1, 0, 0.3607843, 1,
1.51597, -0.01168852, 1.389428, 1, 0, 0.3529412, 1,
1.518577, 1.625898, 0.8347366, 1, 0, 0.3490196, 1,
1.519197, 0.1630846, 0.927327, 1, 0, 0.3411765, 1,
1.538837, -1.663975, 1.557061, 1, 0, 0.3372549, 1,
1.547969, -0.2041054, 0.6164041, 1, 0, 0.3294118, 1,
1.551386, 1.736556, 1.648958, 1, 0, 0.3254902, 1,
1.552486, 0.1487349, 2.807243, 1, 0, 0.3176471, 1,
1.556232, -2.817168, 1.708595, 1, 0, 0.3137255, 1,
1.556713, -0.2987702, 0.2258843, 1, 0, 0.3058824, 1,
1.566818, -0.865487, 1.638793, 1, 0, 0.2980392, 1,
1.574833, -1.555183, 0.8426217, 1, 0, 0.2941177, 1,
1.604952, 1.564667, 0.8897897, 1, 0, 0.2862745, 1,
1.608676, -1.109601, 1.465909, 1, 0, 0.282353, 1,
1.616215, -0.03892637, 0.1896521, 1, 0, 0.2745098, 1,
1.618657, 0.1476976, 0.3147943, 1, 0, 0.2705882, 1,
1.632061, 1.01876, 2.373061, 1, 0, 0.2627451, 1,
1.632582, -0.4789623, 0.7993346, 1, 0, 0.2588235, 1,
1.637778, -1.242631, 1.886291, 1, 0, 0.2509804, 1,
1.643784, 0.7448288, 1.167108, 1, 0, 0.2470588, 1,
1.670094, 1.071075, 0.8492612, 1, 0, 0.2392157, 1,
1.672772, 0.08530334, 0.015339, 1, 0, 0.2352941, 1,
1.705363, -0.1420382, 2.433618, 1, 0, 0.227451, 1,
1.709514, -1.469259, 2.966298, 1, 0, 0.2235294, 1,
1.715646, 0.9539004, 0.5549013, 1, 0, 0.2156863, 1,
1.752158, 0.69344, 0.3893176, 1, 0, 0.2117647, 1,
1.757121, -0.5438637, 3.052966, 1, 0, 0.2039216, 1,
1.761065, 0.1681867, 2.162354, 1, 0, 0.1960784, 1,
1.770297, -0.9149017, 1.572344, 1, 0, 0.1921569, 1,
1.797852, -1.563409, 1.614156, 1, 0, 0.1843137, 1,
1.807562, -0.2895411, 3.133049, 1, 0, 0.1803922, 1,
1.828197, -0.87485, 1.058192, 1, 0, 0.172549, 1,
1.83987, 0.2049712, 1.114517, 1, 0, 0.1686275, 1,
1.84747, -0.4921013, 2.701301, 1, 0, 0.1607843, 1,
1.943801, 1.033952, 1.353223, 1, 0, 0.1568628, 1,
1.973478, 0.3721109, 2.125417, 1, 0, 0.1490196, 1,
1.977594, -1.053701, 2.563658, 1, 0, 0.145098, 1,
1.980747, -1.200957, 1.628653, 1, 0, 0.1372549, 1,
1.981065, 2.11051, 0.6806186, 1, 0, 0.1333333, 1,
2.016391, 0.05168196, 0.6701019, 1, 0, 0.1254902, 1,
2.03815, -1.402794, 1.874007, 1, 0, 0.1215686, 1,
2.052608, -0.1709587, 1.863853, 1, 0, 0.1137255, 1,
2.13005, 0.2783014, 0.7918646, 1, 0, 0.1098039, 1,
2.1315, -1.053726, 0.6414924, 1, 0, 0.1019608, 1,
2.181454, -1.170803, 3.056064, 1, 0, 0.09411765, 1,
2.298566, -0.865792, -1.698268, 1, 0, 0.09019608, 1,
2.320817, 0.2167607, -0.4220114, 1, 0, 0.08235294, 1,
2.384845, -0.1483661, 1.739181, 1, 0, 0.07843138, 1,
2.391468, 0.4029577, 0.5288469, 1, 0, 0.07058824, 1,
2.440171, 0.2214786, 0.1685698, 1, 0, 0.06666667, 1,
2.441182, -0.2548168, 2.967198, 1, 0, 0.05882353, 1,
2.49184, -0.4260753, -0.7556183, 1, 0, 0.05490196, 1,
2.549595, 1.213711, 0.001587583, 1, 0, 0.04705882, 1,
2.574037, 1.180383, 3.413601, 1, 0, 0.04313726, 1,
2.630142, 0.2499809, 2.382083, 1, 0, 0.03529412, 1,
2.648478, 1.085731, 2.55359, 1, 0, 0.03137255, 1,
2.659193, 0.4104106, 0.6454024, 1, 0, 0.02352941, 1,
2.74133, -0.4126289, 1.984988, 1, 0, 0.01960784, 1,
2.794101, -0.5972618, 4.323875, 1, 0, 0.01176471, 1,
2.965638, -1.997785, 3.994825, 1, 0, 0.007843138, 1
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
0.1315798, -5.381354, -7.50845, 0, -0.5, 0.5, 0.5,
0.1315798, -5.381354, -7.50845, 1, -0.5, 0.5, 0.5,
0.1315798, -5.381354, -7.50845, 1, 1.5, 0.5, 0.5,
0.1315798, -5.381354, -7.50845, 0, 1.5, 0.5, 0.5
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
-3.663224, -0.2966543, -7.50845, 0, -0.5, 0.5, 0.5,
-3.663224, -0.2966543, -7.50845, 1, -0.5, 0.5, 0.5,
-3.663224, -0.2966543, -7.50845, 1, 1.5, 0.5, 0.5,
-3.663224, -0.2966543, -7.50845, 0, 1.5, 0.5, 0.5
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
-3.663224, -5.381354, -0.2421429, 0, -0.5, 0.5, 0.5,
-3.663224, -5.381354, -0.2421429, 1, -0.5, 0.5, 0.5,
-3.663224, -5.381354, -0.2421429, 1, 1.5, 0.5, 0.5,
-3.663224, -5.381354, -0.2421429, 0, 1.5, 0.5, 0.5
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
-2, -4.207962, -5.831609,
2, -4.207962, -5.831609,
-2, -4.207962, -5.831609,
-2, -4.403527, -6.111083,
-1, -4.207962, -5.831609,
-1, -4.403527, -6.111083,
0, -4.207962, -5.831609,
0, -4.403527, -6.111083,
1, -4.207962, -5.831609,
1, -4.403527, -6.111083,
2, -4.207962, -5.831609,
2, -4.403527, -6.111083
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
-2, -4.794658, -6.670029, 0, -0.5, 0.5, 0.5,
-2, -4.794658, -6.670029, 1, -0.5, 0.5, 0.5,
-2, -4.794658, -6.670029, 1, 1.5, 0.5, 0.5,
-2, -4.794658, -6.670029, 0, 1.5, 0.5, 0.5,
-1, -4.794658, -6.670029, 0, -0.5, 0.5, 0.5,
-1, -4.794658, -6.670029, 1, -0.5, 0.5, 0.5,
-1, -4.794658, -6.670029, 1, 1.5, 0.5, 0.5,
-1, -4.794658, -6.670029, 0, 1.5, 0.5, 0.5,
0, -4.794658, -6.670029, 0, -0.5, 0.5, 0.5,
0, -4.794658, -6.670029, 1, -0.5, 0.5, 0.5,
0, -4.794658, -6.670029, 1, 1.5, 0.5, 0.5,
0, -4.794658, -6.670029, 0, 1.5, 0.5, 0.5,
1, -4.794658, -6.670029, 0, -0.5, 0.5, 0.5,
1, -4.794658, -6.670029, 1, -0.5, 0.5, 0.5,
1, -4.794658, -6.670029, 1, 1.5, 0.5, 0.5,
1, -4.794658, -6.670029, 0, 1.5, 0.5, 0.5,
2, -4.794658, -6.670029, 0, -0.5, 0.5, 0.5,
2, -4.794658, -6.670029, 1, -0.5, 0.5, 0.5,
2, -4.794658, -6.670029, 1, 1.5, 0.5, 0.5,
2, -4.794658, -6.670029, 0, 1.5, 0.5, 0.5
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
-2.7875, -4, -5.831609,
-2.7875, 2, -5.831609,
-2.7875, -4, -5.831609,
-2.933454, -4, -6.111083,
-2.7875, -2, -5.831609,
-2.933454, -2, -6.111083,
-2.7875, 0, -5.831609,
-2.933454, 0, -6.111083,
-2.7875, 2, -5.831609,
-2.933454, 2, -6.111083
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
"-4",
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
-3.225362, -4, -6.670029, 0, -0.5, 0.5, 0.5,
-3.225362, -4, -6.670029, 1, -0.5, 0.5, 0.5,
-3.225362, -4, -6.670029, 1, 1.5, 0.5, 0.5,
-3.225362, -4, -6.670029, 0, 1.5, 0.5, 0.5,
-3.225362, -2, -6.670029, 0, -0.5, 0.5, 0.5,
-3.225362, -2, -6.670029, 1, -0.5, 0.5, 0.5,
-3.225362, -2, -6.670029, 1, 1.5, 0.5, 0.5,
-3.225362, -2, -6.670029, 0, 1.5, 0.5, 0.5,
-3.225362, 0, -6.670029, 0, -0.5, 0.5, 0.5,
-3.225362, 0, -6.670029, 1, -0.5, 0.5, 0.5,
-3.225362, 0, -6.670029, 1, 1.5, 0.5, 0.5,
-3.225362, 0, -6.670029, 0, 1.5, 0.5, 0.5,
-3.225362, 2, -6.670029, 0, -0.5, 0.5, 0.5,
-3.225362, 2, -6.670029, 1, -0.5, 0.5, 0.5,
-3.225362, 2, -6.670029, 1, 1.5, 0.5, 0.5,
-3.225362, 2, -6.670029, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.7875, -4.207962, -4,
-2.7875, -4.207962, 4,
-2.7875, -4.207962, -4,
-2.933454, -4.403527, -4,
-2.7875, -4.207962, -2,
-2.933454, -4.403527, -2,
-2.7875, -4.207962, 0,
-2.933454, -4.403527, 0,
-2.7875, -4.207962, 2,
-2.933454, -4.403527, 2,
-2.7875, -4.207962, 4,
-2.933454, -4.403527, 4
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
-3.225362, -4.794658, -4, 0, -0.5, 0.5, 0.5,
-3.225362, -4.794658, -4, 1, -0.5, 0.5, 0.5,
-3.225362, -4.794658, -4, 1, 1.5, 0.5, 0.5,
-3.225362, -4.794658, -4, 0, 1.5, 0.5, 0.5,
-3.225362, -4.794658, -2, 0, -0.5, 0.5, 0.5,
-3.225362, -4.794658, -2, 1, -0.5, 0.5, 0.5,
-3.225362, -4.794658, -2, 1, 1.5, 0.5, 0.5,
-3.225362, -4.794658, -2, 0, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 0, 0, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 0, 1, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 0, 1, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 0, 0, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 2, 0, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 2, 1, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 2, 1, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 2, 0, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 4, 0, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 4, 1, -0.5, 0.5, 0.5,
-3.225362, -4.794658, 4, 1, 1.5, 0.5, 0.5,
-3.225362, -4.794658, 4, 0, 1.5, 0.5, 0.5
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
-2.7875, -4.207962, -5.831609,
-2.7875, 3.614653, -5.831609,
-2.7875, -4.207962, 5.347323,
-2.7875, 3.614653, 5.347323,
-2.7875, -4.207962, -5.831609,
-2.7875, -4.207962, 5.347323,
-2.7875, 3.614653, -5.831609,
-2.7875, 3.614653, 5.347323,
-2.7875, -4.207962, -5.831609,
3.05066, -4.207962, -5.831609,
-2.7875, -4.207962, 5.347323,
3.05066, -4.207962, 5.347323,
-2.7875, 3.614653, -5.831609,
3.05066, 3.614653, -5.831609,
-2.7875, 3.614653, 5.347323,
3.05066, 3.614653, 5.347323,
3.05066, -4.207962, -5.831609,
3.05066, 3.614653, -5.831609,
3.05066, -4.207962, 5.347323,
3.05066, 3.614653, 5.347323,
3.05066, -4.207962, -5.831609,
3.05066, -4.207962, 5.347323,
3.05066, 3.614653, -5.831609,
3.05066, 3.614653, 5.347323
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
var radius = 7.924638;
var distance = 35.25761;
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
mvMatrix.translate( -0.1315798, 0.2966543, 0.2421429 );
mvMatrix.scale( 1.467633, 1.095321, 0.7664662 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.25761);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
methansulfonamid<-read.table("methansulfonamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methansulfonamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
```

```r
y<-methansulfonamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
```

```r
z<-methansulfonamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'methansulfonamid' not found
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
-2.702478, 0.1930762, -1.365664, 0, 0, 1, 1, 1,
-2.597595, -1.422065, -0.7537287, 1, 0, 0, 1, 1,
-2.497345, 1.228586, 0.1629668, 1, 0, 0, 1, 1,
-2.444312, 1.128163, -1.077165, 1, 0, 0, 1, 1,
-2.432804, 0.004929115, -2.537646, 1, 0, 0, 1, 1,
-2.423822, 1.098983, -1.96866, 1, 0, 0, 1, 1,
-2.342837, 0.8457328, -0.2047732, 0, 0, 0, 1, 1,
-2.31467, 0.5415948, -2.858744, 0, 0, 0, 1, 1,
-2.23511, 0.825373, -0.4107376, 0, 0, 0, 1, 1,
-2.218054, -0.5410584, -3.044497, 0, 0, 0, 1, 1,
-2.20622, 1.332635, -3.284712, 0, 0, 0, 1, 1,
-2.191307, 1.42458, 0.9397691, 0, 0, 0, 1, 1,
-2.148761, -1.123841, -1.514796, 0, 0, 0, 1, 1,
-2.102611, -1.563146, -0.5603297, 1, 1, 1, 1, 1,
-2.074203, 1.127861, -1.883005, 1, 1, 1, 1, 1,
-2.062374, -0.07387518, -1.363954, 1, 1, 1, 1, 1,
-2.060841, 0.8715625, -1.375716, 1, 1, 1, 1, 1,
-2.025171, 0.4793181, -1.624928, 1, 1, 1, 1, 1,
-1.979059, 0.1153112, -0.08045609, 1, 1, 1, 1, 1,
-1.951241, -1.370662, -1.537912, 1, 1, 1, 1, 1,
-1.948474, 0.0894361, -1.232698, 1, 1, 1, 1, 1,
-1.932313, 0.6639451, -2.81266, 1, 1, 1, 1, 1,
-1.898214, -1.12076, -1.845431, 1, 1, 1, 1, 1,
-1.880974, 1.24344, 0.9908612, 1, 1, 1, 1, 1,
-1.853882, 1.918097, -2.320818, 1, 1, 1, 1, 1,
-1.844702, 0.5463395, -1.198722, 1, 1, 1, 1, 1,
-1.84276, -0.05109847, -0.935814, 1, 1, 1, 1, 1,
-1.839261, 1.497389, -0.6691215, 1, 1, 1, 1, 1,
-1.815526, 0.3939688, -0.4405985, 0, 0, 1, 1, 1,
-1.814388, 0.9084892, -0.9114876, 1, 0, 0, 1, 1,
-1.796886, 0.5598831, -1.786546, 1, 0, 0, 1, 1,
-1.760538, -0.8376409, -0.8397523, 1, 0, 0, 1, 1,
-1.756975, -1.257608, -0.982161, 1, 0, 0, 1, 1,
-1.752007, -1.12355, -2.43999, 1, 0, 0, 1, 1,
-1.742641, 0.1259765, -1.241817, 0, 0, 0, 1, 1,
-1.738972, 1.829986, -1.055383, 0, 0, 0, 1, 1,
-1.734138, 1.371826, -1.478274, 0, 0, 0, 1, 1,
-1.715268, 1.910988, -1.618076, 0, 0, 0, 1, 1,
-1.708284, 0.7188584, -1.043781, 0, 0, 0, 1, 1,
-1.70323, 0.5822893, -1.026511, 0, 0, 0, 1, 1,
-1.678298, -1.331439, -2.759959, 0, 0, 0, 1, 1,
-1.667395, 0.08507282, -2.175974, 1, 1, 1, 1, 1,
-1.665039, -0.1497341, -1.261765, 1, 1, 1, 1, 1,
-1.657554, 0.9328283, -3.54653, 1, 1, 1, 1, 1,
-1.65238, -0.9745633, -1.789059, 1, 1, 1, 1, 1,
-1.646352, -0.8722145, -1.434975, 1, 1, 1, 1, 1,
-1.644846, 1.961224, -0.9744587, 1, 1, 1, 1, 1,
-1.62744, 1.669409, -0.5583794, 1, 1, 1, 1, 1,
-1.626428, 0.4127403, -2.356599, 1, 1, 1, 1, 1,
-1.610323, -0.3703544, -2.482409, 1, 1, 1, 1, 1,
-1.609272, -0.3728649, -2.586095, 1, 1, 1, 1, 1,
-1.607602, -0.985234, -1.995314, 1, 1, 1, 1, 1,
-1.603254, -0.9234899, -1.744701, 1, 1, 1, 1, 1,
-1.602125, -2.444238, -1.131294, 1, 1, 1, 1, 1,
-1.60092, -0.01243606, -2.566246, 1, 1, 1, 1, 1,
-1.59981, 0.2512564, -1.7524, 1, 1, 1, 1, 1,
-1.592858, -0.602037, -2.107168, 0, 0, 1, 1, 1,
-1.588056, 0.9165875, -2.026419, 1, 0, 0, 1, 1,
-1.583404, 0.7946085, -1.161857, 1, 0, 0, 1, 1,
-1.580577, -0.2426363, 0.0322412, 1, 0, 0, 1, 1,
-1.577521, -2.05773, -3.345299, 1, 0, 0, 1, 1,
-1.574491, -0.01782997, -1.795161, 1, 0, 0, 1, 1,
-1.566284, 0.8283471, -2.088232, 0, 0, 0, 1, 1,
-1.560979, -0.3093474, -1.62483, 0, 0, 0, 1, 1,
-1.550724, -1.039812, -1.378058, 0, 0, 0, 1, 1,
-1.541514, 1.246882, -2.291143, 0, 0, 0, 1, 1,
-1.523648, 0.8886498, -3.757262, 0, 0, 0, 1, 1,
-1.517533, 1.404223, -0.9932957, 0, 0, 0, 1, 1,
-1.499503, -0.4168164, -2.597221, 0, 0, 0, 1, 1,
-1.477948, -1.247415, -1.342404, 1, 1, 1, 1, 1,
-1.467523, -1.074118, -2.968848, 1, 1, 1, 1, 1,
-1.463434, 0.1396172, -1.066881, 1, 1, 1, 1, 1,
-1.461129, 1.903036, -1.717561, 1, 1, 1, 1, 1,
-1.459189, -1.520602, -3.567988, 1, 1, 1, 1, 1,
-1.458401, -1.156228, -2.938009, 1, 1, 1, 1, 1,
-1.457346, 0.2683229, -0.3486562, 1, 1, 1, 1, 1,
-1.451323, -1.501222, -1.501295, 1, 1, 1, 1, 1,
-1.43929, -0.7694635, 0.1336275, 1, 1, 1, 1, 1,
-1.424335, -0.2515161, -2.860152, 1, 1, 1, 1, 1,
-1.422472, 0.6568031, -0.4482426, 1, 1, 1, 1, 1,
-1.407378, 0.4748086, -2.501497, 1, 1, 1, 1, 1,
-1.404553, 1.886887, 0.3291525, 1, 1, 1, 1, 1,
-1.393685, 1.946526, -1.605186, 1, 1, 1, 1, 1,
-1.381073, -0.2627614, -1.204769, 1, 1, 1, 1, 1,
-1.377483, 0.7381203, -1.070341, 0, 0, 1, 1, 1,
-1.373395, 0.6031879, -1.512404, 1, 0, 0, 1, 1,
-1.373134, -1.210817, -1.508914, 1, 0, 0, 1, 1,
-1.37166, 0.3568187, -1.727578, 1, 0, 0, 1, 1,
-1.367539, 0.207361, -2.439329, 1, 0, 0, 1, 1,
-1.358805, -2.269002, -1.440226, 1, 0, 0, 1, 1,
-1.330838, 0.4383473, 0.08280484, 0, 0, 0, 1, 1,
-1.317265, 0.2392927, -1.586073, 0, 0, 0, 1, 1,
-1.315664, 2.323482, -0.1608302, 0, 0, 0, 1, 1,
-1.298977, -1.102736, -0.9688135, 0, 0, 0, 1, 1,
-1.287604, -0.8344784, -0.7863829, 0, 0, 0, 1, 1,
-1.284869, 0.3227319, -1.917786, 0, 0, 0, 1, 1,
-1.275368, -0.4945684, -1.749191, 0, 0, 0, 1, 1,
-1.273657, -0.007799527, -1.579681, 1, 1, 1, 1, 1,
-1.27158, -1.119525, -2.909659, 1, 1, 1, 1, 1,
-1.266688, -0.3205273, -1.815597, 1, 1, 1, 1, 1,
-1.26588, 0.2973197, -1.701547, 1, 1, 1, 1, 1,
-1.251346, 0.271488, -0.7637078, 1, 1, 1, 1, 1,
-1.243603, -0.8413572, -0.7903757, 1, 1, 1, 1, 1,
-1.241015, 0.9835435, -1.056852, 1, 1, 1, 1, 1,
-1.239005, -0.3987879, -0.6235058, 1, 1, 1, 1, 1,
-1.238336, -0.8144099, -3.5994, 1, 1, 1, 1, 1,
-1.232718, -0.920795, -2.09256, 1, 1, 1, 1, 1,
-1.209003, 0.6776244, -1.019395, 1, 1, 1, 1, 1,
-1.197328, -2.360657, -2.345377, 1, 1, 1, 1, 1,
-1.195348, 0.1896287, 0.2664203, 1, 1, 1, 1, 1,
-1.19333, 0.4517148, 0.7160378, 1, 1, 1, 1, 1,
-1.179682, 1.628952, -0.404235, 1, 1, 1, 1, 1,
-1.175168, -0.4588047, -2.217416, 0, 0, 1, 1, 1,
-1.172279, 1.281373, -1.064424, 1, 0, 0, 1, 1,
-1.16987, 0.1644295, -1.060128, 1, 0, 0, 1, 1,
-1.167542, -0.7383247, -1.715198, 1, 0, 0, 1, 1,
-1.162769, -1.414383, -0.5329976, 1, 0, 0, 1, 1,
-1.152877, -0.8996609, -2.852782, 1, 0, 0, 1, 1,
-1.146941, 1.034012, 0.4448056, 0, 0, 0, 1, 1,
-1.140838, 0.8480219, 0.9530029, 0, 0, 0, 1, 1,
-1.139481, -0.9264187, -1.848944, 0, 0, 0, 1, 1,
-1.133777, 0.6574225, -2.675565, 0, 0, 0, 1, 1,
-1.116877, -0.4791198, -3.04099, 0, 0, 0, 1, 1,
-1.113426, 1.833476, 0.2288544, 0, 0, 0, 1, 1,
-1.112426, 0.5576575, -1.658093, 0, 0, 0, 1, 1,
-1.11133, -0.4368047, -3.756612, 1, 1, 1, 1, 1,
-1.103711, -0.5025973, -1.315963, 1, 1, 1, 1, 1,
-1.099695, 0.4693424, -1.177719, 1, 1, 1, 1, 1,
-1.089191, 1.021078, 0.4460521, 1, 1, 1, 1, 1,
-1.072979, 0.4820891, -1.331142, 1, 1, 1, 1, 1,
-1.069604, 0.3145503, -1.602076, 1, 1, 1, 1, 1,
-1.067213, -0.7700077, -1.560242, 1, 1, 1, 1, 1,
-1.066426, 1.480578, -0.524616, 1, 1, 1, 1, 1,
-1.060716, 2.061452, -2.262214, 1, 1, 1, 1, 1,
-1.051693, 0.09303638, -1.606925, 1, 1, 1, 1, 1,
-1.048963, 0.03324128, -1.253017, 1, 1, 1, 1, 1,
-1.041379, -1.031364, -2.445584, 1, 1, 1, 1, 1,
-1.039141, -1.413167, -3.210477, 1, 1, 1, 1, 1,
-1.03546, 0.04793852, 0.3841211, 1, 1, 1, 1, 1,
-1.035407, -0.6404775, -0.6852352, 1, 1, 1, 1, 1,
-1.020559, 0.007384748, -2.255745, 0, 0, 1, 1, 1,
-1.016255, -1.053002, -3.374718, 1, 0, 0, 1, 1,
-1.01247, -0.579949, -2.531052, 1, 0, 0, 1, 1,
-1.010633, -0.05785125, -2.862849, 1, 0, 0, 1, 1,
-1.009563, 0.3696523, -1.405326, 1, 0, 0, 1, 1,
-1.007815, 0.7423849, 0.5745194, 1, 0, 0, 1, 1,
-1.002845, 0.1600702, -1.25484, 0, 0, 0, 1, 1,
-1.00026, -1.37518, -2.399811, 0, 0, 0, 1, 1,
-0.9939445, -1.324053, -2.979616, 0, 0, 0, 1, 1,
-0.9844442, 0.1729877, 0.2220503, 0, 0, 0, 1, 1,
-0.9836685, 3.500732, 0.9898944, 0, 0, 0, 1, 1,
-0.9813822, 0.7189193, 0.2316364, 0, 0, 0, 1, 1,
-0.9684847, -0.112247, -0.5217414, 0, 0, 0, 1, 1,
-0.9643571, 0.8531719, -1.297123, 1, 1, 1, 1, 1,
-0.9633815, 0.7589226, -1.077929, 1, 1, 1, 1, 1,
-0.9579617, -0.517503, -2.443069, 1, 1, 1, 1, 1,
-0.9559271, 0.7848242, 0.418464, 1, 1, 1, 1, 1,
-0.952194, -0.1998765, -2.331696, 1, 1, 1, 1, 1,
-0.9468479, 0.8805501, -3.03973, 1, 1, 1, 1, 1,
-0.9324822, 1.34866, -1.118315, 1, 1, 1, 1, 1,
-0.929627, 0.7447627, -0.04218799, 1, 1, 1, 1, 1,
-0.9255981, 0.1308239, -3.465031, 1, 1, 1, 1, 1,
-0.9247768, 0.1922523, -1.730036, 1, 1, 1, 1, 1,
-0.9053509, 0.2322719, -0.5865648, 1, 1, 1, 1, 1,
-0.9038616, 1.510856, -0.9517388, 1, 1, 1, 1, 1,
-0.9009175, -0.6976022, -1.837404, 1, 1, 1, 1, 1,
-0.896445, -1.835671, -2.77988, 1, 1, 1, 1, 1,
-0.8945208, 1.345386, 0.2247348, 1, 1, 1, 1, 1,
-0.8880424, 0.9049504, -2.508363, 0, 0, 1, 1, 1,
-0.8841995, 0.9329899, -2.110054, 1, 0, 0, 1, 1,
-0.8840309, 0.7614743, -1.321384, 1, 0, 0, 1, 1,
-0.8832338, 0.9809262, -0.4433106, 1, 0, 0, 1, 1,
-0.8820273, -0.8612321, -0.8567558, 1, 0, 0, 1, 1,
-0.8802238, -0.5730277, -3.827489, 1, 0, 0, 1, 1,
-0.8800754, -0.1086289, -1.354978, 0, 0, 0, 1, 1,
-0.8763281, 0.9156267, -1.387131, 0, 0, 0, 1, 1,
-0.8713503, -0.1006668, -1.344505, 0, 0, 0, 1, 1,
-0.8676075, -0.9858536, -2.266132, 0, 0, 0, 1, 1,
-0.8601748, 1.112784, 0.5142158, 0, 0, 0, 1, 1,
-0.8581845, -0.1386283, -3.046538, 0, 0, 0, 1, 1,
-0.857646, -0.2290499, -2.37545, 0, 0, 0, 1, 1,
-0.8534927, 0.4726504, -0.4300276, 1, 1, 1, 1, 1,
-0.8510462, -0.789381, -1.452893, 1, 1, 1, 1, 1,
-0.8485237, -1.0374, -1.709681, 1, 1, 1, 1, 1,
-0.8483631, 0.4684733, -1.383037, 1, 1, 1, 1, 1,
-0.8410121, 0.3202048, -1.695639, 1, 1, 1, 1, 1,
-0.8357701, 0.4717572, -1.487318, 1, 1, 1, 1, 1,
-0.8354933, -0.5960051, -1.051557, 1, 1, 1, 1, 1,
-0.8343089, -0.04211602, -0.9337862, 1, 1, 1, 1, 1,
-0.8296976, -0.4667834, -1.64027, 1, 1, 1, 1, 1,
-0.8255571, -0.7695968, -1.190638, 1, 1, 1, 1, 1,
-0.8237913, -0.2223265, -0.8364037, 1, 1, 1, 1, 1,
-0.8237868, 0.281518, -2.526286, 1, 1, 1, 1, 1,
-0.8209478, -0.9081089, -1.135373, 1, 1, 1, 1, 1,
-0.8205158, 0.1584913, -2.679771, 1, 1, 1, 1, 1,
-0.819976, 0.2082871, -1.503227, 1, 1, 1, 1, 1,
-0.8195022, 0.9367397, -1.431501, 0, 0, 1, 1, 1,
-0.8165016, 0.4329794, -1.525294, 1, 0, 0, 1, 1,
-0.8092461, -1.353846, -1.839418, 1, 0, 0, 1, 1,
-0.8090999, 0.5693972, -1.43199, 1, 0, 0, 1, 1,
-0.804609, -2.015145, -2.830379, 1, 0, 0, 1, 1,
-0.803068, 2.156351, -1.666691, 1, 0, 0, 1, 1,
-0.801995, -0.1712673, -2.663466, 0, 0, 0, 1, 1,
-0.8018706, -1.513128, -3.110712, 0, 0, 0, 1, 1,
-0.8009502, -0.3479228, -2.239296, 0, 0, 0, 1, 1,
-0.7996407, -1.900943, -1.926671, 0, 0, 0, 1, 1,
-0.7950038, -0.5869609, -2.578865, 0, 0, 0, 1, 1,
-0.7934588, -0.9757353, -2.576436, 0, 0, 0, 1, 1,
-0.793205, 1.637545, -0.7797019, 0, 0, 0, 1, 1,
-0.7901682, 1.174261, 0.08021715, 1, 1, 1, 1, 1,
-0.7878179, -0.5674816, -1.220242, 1, 1, 1, 1, 1,
-0.7790486, -0.02647109, -0.3805738, 1, 1, 1, 1, 1,
-0.7759335, 0.1043086, -2.332909, 1, 1, 1, 1, 1,
-0.77397, -0.9183978, -0.9928969, 1, 1, 1, 1, 1,
-0.7723443, -0.6067884, -2.165724, 1, 1, 1, 1, 1,
-0.7694581, -0.7213573, -0.5840438, 1, 1, 1, 1, 1,
-0.7687674, 0.4404932, -0.4173726, 1, 1, 1, 1, 1,
-0.7671404, 0.6770068, -1.676852, 1, 1, 1, 1, 1,
-0.7646589, 1.290717, 0.3176152, 1, 1, 1, 1, 1,
-0.7646518, 0.268434, -1.970242, 1, 1, 1, 1, 1,
-0.7643401, 0.01655417, -2.846844, 1, 1, 1, 1, 1,
-0.763926, 0.001795339, -2.87822, 1, 1, 1, 1, 1,
-0.76265, 0.03689198, -1.668428, 1, 1, 1, 1, 1,
-0.7625286, 0.01697503, -3.426186, 1, 1, 1, 1, 1,
-0.761591, 0.7171811, -0.5937968, 0, 0, 1, 1, 1,
-0.7608837, -0.5656108, -1.506467, 1, 0, 0, 1, 1,
-0.7572419, -0.08899312, -1.361369, 1, 0, 0, 1, 1,
-0.7572219, 1.408888, -0.3509477, 1, 0, 0, 1, 1,
-0.7526303, 0.01636248, -1.880511, 1, 0, 0, 1, 1,
-0.7456107, 2.078643, -1.275878, 1, 0, 0, 1, 1,
-0.7453157, 0.0236846, -1.52464, 0, 0, 0, 1, 1,
-0.7411693, 1.154855, -2.030702, 0, 0, 0, 1, 1,
-0.7362454, -0.1201695, -1.565227, 0, 0, 0, 1, 1,
-0.7346258, -1.44147, -3.516488, 0, 0, 0, 1, 1,
-0.7321629, 0.01733042, -0.4893111, 0, 0, 0, 1, 1,
-0.7318125, -0.3948521, -2.695762, 0, 0, 0, 1, 1,
-0.7307065, 0.5825372, -0.3408225, 0, 0, 0, 1, 1,
-0.729191, -0.277293, -1.395849, 1, 1, 1, 1, 1,
-0.7023297, -0.3179356, -1.89241, 1, 1, 1, 1, 1,
-0.6919287, -1.993653, -2.014891, 1, 1, 1, 1, 1,
-0.6829357, 2.512982, -0.2723904, 1, 1, 1, 1, 1,
-0.6737428, -2.148269, -3.297638, 1, 1, 1, 1, 1,
-0.6705184, 2.386919, -0.9981163, 1, 1, 1, 1, 1,
-0.6679052, -0.7455455, -3.141732, 1, 1, 1, 1, 1,
-0.6660673, -0.3509972, -1.706734, 1, 1, 1, 1, 1,
-0.6659443, 2.007664, -1.48323, 1, 1, 1, 1, 1,
-0.6599917, 1.102956, -0.6101914, 1, 1, 1, 1, 1,
-0.646085, 1.733727, -2.578409, 1, 1, 1, 1, 1,
-0.6460056, -2.356319, -1.747316, 1, 1, 1, 1, 1,
-0.6459065, 1.150133, 0.5498655, 1, 1, 1, 1, 1,
-0.6453584, -0.2889462, -2.080366, 1, 1, 1, 1, 1,
-0.643172, 0.1137675, -1.091381, 1, 1, 1, 1, 1,
-0.638119, -1.656132, -2.563583, 0, 0, 1, 1, 1,
-0.6379861, 1.347207, 0.08429233, 1, 0, 0, 1, 1,
-0.6361335, 1.301101, -1.407638, 1, 0, 0, 1, 1,
-0.6356326, -0.1174791, -1.845378, 1, 0, 0, 1, 1,
-0.6332283, -1.198987, -2.220915, 1, 0, 0, 1, 1,
-0.6313379, -1.440788, -2.060877, 1, 0, 0, 1, 1,
-0.6275544, 1.582505, -1.038196, 0, 0, 0, 1, 1,
-0.6251642, -1.232944, -2.900231, 0, 0, 0, 1, 1,
-0.6214825, -1.035356, -0.9967566, 0, 0, 0, 1, 1,
-0.6161557, 1.027174, -1.096574, 0, 0, 0, 1, 1,
-0.6131195, -0.7127788, -2.002166, 0, 0, 0, 1, 1,
-0.6106085, 0.05198216, -1.019198, 0, 0, 0, 1, 1,
-0.603111, 1.482198, 1.11455, 0, 0, 0, 1, 1,
-0.600898, 0.2003703, -2.31048, 1, 1, 1, 1, 1,
-0.5977845, 0.3299649, 0.202641, 1, 1, 1, 1, 1,
-0.5952477, 1.302863, -0.102539, 1, 1, 1, 1, 1,
-0.5945618, 0.3459847, -0.8364419, 1, 1, 1, 1, 1,
-0.5933545, 0.1072866, -1.609632, 1, 1, 1, 1, 1,
-0.592074, 0.3384054, -1.446033, 1, 1, 1, 1, 1,
-0.5918278, 0.1091812, -1.51789, 1, 1, 1, 1, 1,
-0.5861026, 1.530598, -1.23484, 1, 1, 1, 1, 1,
-0.5856369, -1.278914, -2.825409, 1, 1, 1, 1, 1,
-0.585199, -1.495415, -4.270613, 1, 1, 1, 1, 1,
-0.5834579, -1.300658, -2.146293, 1, 1, 1, 1, 1,
-0.5789739, -0.6640598, -2.611827, 1, 1, 1, 1, 1,
-0.5729774, 0.6132762, -0.5661203, 1, 1, 1, 1, 1,
-0.571153, 0.01977679, -1.826504, 1, 1, 1, 1, 1,
-0.5710632, 1.235466, -0.2917597, 1, 1, 1, 1, 1,
-0.5695986, 0.8206881, 0.2857579, 0, 0, 1, 1, 1,
-0.5687972, -0.6606976, -2.790062, 1, 0, 0, 1, 1,
-0.5654602, -0.3356181, -1.774974, 1, 0, 0, 1, 1,
-0.5648307, 1.838408, 0.128044, 1, 0, 0, 1, 1,
-0.563023, 0.9534559, 0.6842834, 1, 0, 0, 1, 1,
-0.561207, -1.442519, -3.422153, 1, 0, 0, 1, 1,
-0.5581504, 0.247741, -1.629574, 0, 0, 0, 1, 1,
-0.5544218, -0.4279538, -3.387089, 0, 0, 0, 1, 1,
-0.5509222, -0.2682694, -1.045961, 0, 0, 0, 1, 1,
-0.5493893, -0.1621059, -1.001261, 0, 0, 0, 1, 1,
-0.5477239, -0.1442133, -1.051971, 0, 0, 0, 1, 1,
-0.5457355, 0.438145, -1.392963, 0, 0, 0, 1, 1,
-0.5354547, -0.3385815, -1.515283, 0, 0, 0, 1, 1,
-0.5340269, 0.1311402, 0.4910478, 1, 1, 1, 1, 1,
-0.5291578, -0.427332, -2.28258, 1, 1, 1, 1, 1,
-0.520737, -0.0673031, -1.239464, 1, 1, 1, 1, 1,
-0.5193138, 1.596011, -1.678433, 1, 1, 1, 1, 1,
-0.5152447, -0.7105439, -4.756951, 1, 1, 1, 1, 1,
-0.5139176, -4.09404, -3.721594, 1, 1, 1, 1, 1,
-0.5128445, -1.12571, -2.607694, 1, 1, 1, 1, 1,
-0.5109577, 0.07386239, -2.293481, 1, 1, 1, 1, 1,
-0.5078231, 1.732289, 0.7078043, 1, 1, 1, 1, 1,
-0.5030487, -0.6180595, -1.214508, 1, 1, 1, 1, 1,
-0.5000373, -1.003155, -3.152658, 1, 1, 1, 1, 1,
-0.4978253, 2.006134, -2.461447, 1, 1, 1, 1, 1,
-0.491322, -0.7869585, -2.090409, 1, 1, 1, 1, 1,
-0.4888767, -0.6882619, -2.822955, 1, 1, 1, 1, 1,
-0.4881743, 0.3501267, 0.4576079, 1, 1, 1, 1, 1,
-0.487723, -0.08452484, -3.892705, 0, 0, 1, 1, 1,
-0.4849628, -0.4076262, -0.6725967, 1, 0, 0, 1, 1,
-0.4828112, -0.3672872, -1.547517, 1, 0, 0, 1, 1,
-0.482775, -1.457836, -1.591648, 1, 0, 0, 1, 1,
-0.482042, 0.6727609, -0.5754662, 1, 0, 0, 1, 1,
-0.4799232, 1.411597, 0.6185824, 1, 0, 0, 1, 1,
-0.4762769, 0.7818827, -1.025478, 0, 0, 0, 1, 1,
-0.474511, -1.423519, -4.160885, 0, 0, 0, 1, 1,
-0.4713345, -0.3179554, -1.386921, 0, 0, 0, 1, 1,
-0.4705577, -0.7991422, -3.076636, 0, 0, 0, 1, 1,
-0.4698931, -0.3655164, -2.060536, 0, 0, 0, 1, 1,
-0.4643868, -1.231521, -2.702265, 0, 0, 0, 1, 1,
-0.4621294, 1.263839, -0.4428408, 0, 0, 0, 1, 1,
-0.4618238, 0.07123613, -2.315812, 1, 1, 1, 1, 1,
-0.4612012, 2.417239, -0.4313858, 1, 1, 1, 1, 1,
-0.4583567, 0.7299736, -1.251294, 1, 1, 1, 1, 1,
-0.4547785, 0.2644466, -2.472939, 1, 1, 1, 1, 1,
-0.4537758, -0.4453294, -2.561789, 1, 1, 1, 1, 1,
-0.4494196, 0.8680065, 0.07007872, 1, 1, 1, 1, 1,
-0.4433575, 0.5900603, 0.4160446, 1, 1, 1, 1, 1,
-0.4403656, 0.7151414, -0.2815401, 1, 1, 1, 1, 1,
-0.4352646, -0.6623762, -3.333188, 1, 1, 1, 1, 1,
-0.4296363, -0.03120108, -0.3716552, 1, 1, 1, 1, 1,
-0.4230205, 1.847396, -0.970247, 1, 1, 1, 1, 1,
-0.4216563, -1.024949, -4.245855, 1, 1, 1, 1, 1,
-0.4184319, 0.7262745, -1.371141, 1, 1, 1, 1, 1,
-0.4154747, 1.094218, -0.9530267, 1, 1, 1, 1, 1,
-0.4153004, 0.5169558, -1.231187, 1, 1, 1, 1, 1,
-0.4133129, 0.7359948, -0.9158215, 0, 0, 1, 1, 1,
-0.4076953, -0.6614679, -2.29266, 1, 0, 0, 1, 1,
-0.4070962, 1.175607, 1.303548, 1, 0, 0, 1, 1,
-0.4052931, 0.06330707, -0.1604876, 1, 0, 0, 1, 1,
-0.4036963, -1.77193, -3.029235, 1, 0, 0, 1, 1,
-0.4030098, -2.432415, -1.497961, 1, 0, 0, 1, 1,
-0.3965977, -1.812801, -3.635393, 0, 0, 0, 1, 1,
-0.3938964, 0.6349468, 0.4157936, 0, 0, 0, 1, 1,
-0.386939, 0.2357806, -1.822538, 0, 0, 0, 1, 1,
-0.3794216, 1.89631, -0.5416322, 0, 0, 0, 1, 1,
-0.3712943, 0.4550393, 0.5748218, 0, 0, 0, 1, 1,
-0.3705633, 1.895184, -1.222203, 0, 0, 0, 1, 1,
-0.3632405, -0.4871099, -0.7779549, 0, 0, 0, 1, 1,
-0.3630036, -0.4774854, -2.535157, 1, 1, 1, 1, 1,
-0.362764, -0.5966929, -2.38441, 1, 1, 1, 1, 1,
-0.3505394, 1.21488, -0.8236194, 1, 1, 1, 1, 1,
-0.3493144, -0.5049814, -2.391136, 1, 1, 1, 1, 1,
-0.3491244, 2.116262, -0.8238795, 1, 1, 1, 1, 1,
-0.3482693, 0.2094129, -0.1435218, 1, 1, 1, 1, 1,
-0.3456864, 1.435738, -0.6738212, 1, 1, 1, 1, 1,
-0.3446285, -0.9472771, -2.750621, 1, 1, 1, 1, 1,
-0.342633, 1.178205, 0.09287401, 1, 1, 1, 1, 1,
-0.3378667, -2.43985, -2.013466, 1, 1, 1, 1, 1,
-0.3341434, -0.9809344, -2.208067, 1, 1, 1, 1, 1,
-0.3233325, -1.04582, -3.182504, 1, 1, 1, 1, 1,
-0.3231496, -0.06648752, -2.52779, 1, 1, 1, 1, 1,
-0.3208236, -0.5083725, -1.557067, 1, 1, 1, 1, 1,
-0.3195312, -0.6283887, -2.271866, 1, 1, 1, 1, 1,
-0.3192175, -0.5366326, -3.425089, 0, 0, 1, 1, 1,
-0.3182513, 1.059237, -0.2517075, 1, 0, 0, 1, 1,
-0.3179027, -2.005071, -3.298025, 1, 0, 0, 1, 1,
-0.3107933, -0.5242242, -2.967541, 1, 0, 0, 1, 1,
-0.3095348, -0.7101733, -3.634841, 1, 0, 0, 1, 1,
-0.3089908, 0.5457935, -2.372883, 1, 0, 0, 1, 1,
-0.3027312, 1.03037, -1.520117, 0, 0, 0, 1, 1,
-0.3002992, -1.070726, -2.796899, 0, 0, 0, 1, 1,
-0.2995588, -2.296748, -3.828615, 0, 0, 0, 1, 1,
-0.296536, -0.3006812, -3.996487, 0, 0, 0, 1, 1,
-0.2951908, 1.802061, -0.6328446, 0, 0, 0, 1, 1,
-0.2889961, 0.7919081, -2.489688, 0, 0, 0, 1, 1,
-0.2875342, 0.736143, -1.11889, 0, 0, 0, 1, 1,
-0.2847775, 0.7298709, -1.541348, 1, 1, 1, 1, 1,
-0.282167, 0.8620825, 1.415239, 1, 1, 1, 1, 1,
-0.2798405, -0.4482757, -3.476373, 1, 1, 1, 1, 1,
-0.2797478, -1.123424, -2.096288, 1, 1, 1, 1, 1,
-0.2789407, -0.366426, -2.185857, 1, 1, 1, 1, 1,
-0.277876, -1.292082, -3.86435, 1, 1, 1, 1, 1,
-0.2771771, -0.3139741, -2.851792, 1, 1, 1, 1, 1,
-0.2770984, -0.7505107, -1.249568, 1, 1, 1, 1, 1,
-0.2741303, 0.4324057, 1.273675, 1, 1, 1, 1, 1,
-0.2730038, 2.181604, 0.1228965, 1, 1, 1, 1, 1,
-0.2729369, -0.6564729, -2.991593, 1, 1, 1, 1, 1,
-0.2711841, 1.002088, -0.1740808, 1, 1, 1, 1, 1,
-0.2701036, 0.638318, -1.529211, 1, 1, 1, 1, 1,
-0.2699201, 1.29335, -0.2647454, 1, 1, 1, 1, 1,
-0.2689202, 0.8105249, 0.0533165, 1, 1, 1, 1, 1,
-0.2656548, -0.2315061, -2.214615, 0, 0, 1, 1, 1,
-0.2604418, 0.1076576, -2.813021, 1, 0, 0, 1, 1,
-0.2591907, 1.085542, -1.365025, 1, 0, 0, 1, 1,
-0.257022, -0.3414374, -2.22055, 1, 0, 0, 1, 1,
-0.2567238, 1.597665, -2.524688, 1, 0, 0, 1, 1,
-0.2562208, -1.377571, -2.84331, 1, 0, 0, 1, 1,
-0.2555076, -1.069082, -2.56504, 0, 0, 0, 1, 1,
-0.2552505, -1.810856, -3.466315, 0, 0, 0, 1, 1,
-0.2547503, -0.4895263, -1.606161, 0, 0, 0, 1, 1,
-0.254534, -0.9256813, -2.582124, 0, 0, 0, 1, 1,
-0.2518119, 1.610757, 0.2680101, 0, 0, 0, 1, 1,
-0.2502276, -1.755803, -2.609859, 0, 0, 0, 1, 1,
-0.2486208, 0.587763, 1.188847, 0, 0, 0, 1, 1,
-0.2477275, 0.5231448, -0.2326345, 1, 1, 1, 1, 1,
-0.2397319, -1.342661, -4.93649, 1, 1, 1, 1, 1,
-0.2372547, -0.876058, -3.30446, 1, 1, 1, 1, 1,
-0.2367222, 0.67588, 0.3981838, 1, 1, 1, 1, 1,
-0.2362227, 0.834694, -0.3772455, 1, 1, 1, 1, 1,
-0.2333333, 0.4287086, 0.09251234, 1, 1, 1, 1, 1,
-0.2272404, -0.4203767, -2.102283, 1, 1, 1, 1, 1,
-0.2255476, -0.07512201, -3.047695, 1, 1, 1, 1, 1,
-0.2253671, 0.7099509, -1.796457, 1, 1, 1, 1, 1,
-0.2213987, -0.2415821, -3.127239, 1, 1, 1, 1, 1,
-0.2181955, -1.303391, -3.535472, 1, 1, 1, 1, 1,
-0.2150131, 2.890225, 0.7638947, 1, 1, 1, 1, 1,
-0.2137746, -1.257278, -3.939345, 1, 1, 1, 1, 1,
-0.2132147, -0.6610768, -3.136666, 1, 1, 1, 1, 1,
-0.2043177, 0.9888026, -0.07471605, 1, 1, 1, 1, 1,
-0.2042716, 0.396146, -0.4947451, 0, 0, 1, 1, 1,
-0.2016093, -2.213682, -1.6935, 1, 0, 0, 1, 1,
-0.2013998, -2.403039, -1.887213, 1, 0, 0, 1, 1,
-0.1947329, -1.433342, -3.825897, 1, 0, 0, 1, 1,
-0.1938055, 0.4350599, -0.2829593, 1, 0, 0, 1, 1,
-0.1929859, -1.354819, -3.288688, 1, 0, 0, 1, 1,
-0.1918213, -0.9869682, -2.490511, 0, 0, 0, 1, 1,
-0.1869218, 0.9041454, 1.30683, 0, 0, 0, 1, 1,
-0.1788331, -2.256031, -3.781843, 0, 0, 0, 1, 1,
-0.1751226, 0.825462, 0.3913987, 0, 0, 0, 1, 1,
-0.1750239, 0.2931335, -1.445977, 0, 0, 0, 1, 1,
-0.1749097, -1.808583, -3.150463, 0, 0, 0, 1, 1,
-0.1703571, 0.05743081, -1.346363, 0, 0, 0, 1, 1,
-0.1700236, 0.2624295, 0.2927317, 1, 1, 1, 1, 1,
-0.1693247, -2.12717, -3.045949, 1, 1, 1, 1, 1,
-0.1677728, 0.454948, -0.2782167, 1, 1, 1, 1, 1,
-0.166616, 0.3244756, 1.340065, 1, 1, 1, 1, 1,
-0.1651336, -0.4101227, -2.237431, 1, 1, 1, 1, 1,
-0.1520269, -0.7661516, -3.502047, 1, 1, 1, 1, 1,
-0.1513881, 0.01367321, -1.634386, 1, 1, 1, 1, 1,
-0.1454344, -0.3743428, -0.9554482, 1, 1, 1, 1, 1,
-0.1412557, -0.7560564, -2.995085, 1, 1, 1, 1, 1,
-0.1394823, -0.3288074, -2.281914, 1, 1, 1, 1, 1,
-0.1390189, 0.4501354, -1.687715, 1, 1, 1, 1, 1,
-0.1359368, 0.4050407, 1.639297, 1, 1, 1, 1, 1,
-0.1287997, -1.25234, -4.386481, 1, 1, 1, 1, 1,
-0.1251913, 1.432367, 1.178043, 1, 1, 1, 1, 1,
-0.1242745, 0.2488122, -2.722619, 1, 1, 1, 1, 1,
-0.1224001, -1.160539, -3.318466, 0, 0, 1, 1, 1,
-0.1211711, -0.223755, -3.24572, 1, 0, 0, 1, 1,
-0.120296, -1.307128, -4.090971, 1, 0, 0, 1, 1,
-0.1193321, -0.1064121, -2.133786, 1, 0, 0, 1, 1,
-0.115944, 0.1831649, 0.9286554, 1, 0, 0, 1, 1,
-0.1147615, 0.4352086, -1.380288, 1, 0, 0, 1, 1,
-0.1100006, 0.7405908, -1.071192, 0, 0, 0, 1, 1,
-0.108115, -0.354425, -2.229239, 0, 0, 0, 1, 1,
-0.1005517, 0.4149933, -0.7130457, 0, 0, 0, 1, 1,
-0.09991095, 0.3579072, -1.73033, 0, 0, 0, 1, 1,
-0.09939526, 0.7264189, -0.2340392, 0, 0, 0, 1, 1,
-0.09589171, -0.1594464, -2.268653, 0, 0, 0, 1, 1,
-0.09436153, -0.8572124, -5.668809, 0, 0, 0, 1, 1,
-0.09172004, 0.3652853, -1.351136, 1, 1, 1, 1, 1,
-0.0916617, 1.052285, 2.010554, 1, 1, 1, 1, 1,
-0.09020366, 0.1286016, -2.054421, 1, 1, 1, 1, 1,
-0.08671436, 1.217492, -0.5202219, 1, 1, 1, 1, 1,
-0.08537843, 1.330888, 0.06046538, 1, 1, 1, 1, 1,
-0.08433943, -0.04425774, -1.366233, 1, 1, 1, 1, 1,
-0.08189666, 1.118478, -0.07794613, 1, 1, 1, 1, 1,
-0.07874421, 0.01456186, -0.8302346, 1, 1, 1, 1, 1,
-0.07588249, 1.263749, -0.3331749, 1, 1, 1, 1, 1,
-0.07314485, -2.730023, -3.112299, 1, 1, 1, 1, 1,
-0.07233761, -0.3738423, -2.27132, 1, 1, 1, 1, 1,
-0.06841338, -1.231495, -4.221318, 1, 1, 1, 1, 1,
-0.05744377, -1.654816, -3.715584, 1, 1, 1, 1, 1,
-0.05676422, 0.01900458, -2.461855, 1, 1, 1, 1, 1,
-0.05238669, 1.192672, 0.4934294, 1, 1, 1, 1, 1,
-0.04678666, -0.4587125, -2.98919, 0, 0, 1, 1, 1,
-0.04464768, 0.0448057, -2.042136, 1, 0, 0, 1, 1,
-0.04254472, 1.799036, 0.01599804, 1, 0, 0, 1, 1,
-0.04095507, 1.353763, -0.1036904, 1, 0, 0, 1, 1,
-0.03616385, 0.2131072, -0.1874025, 1, 0, 0, 1, 1,
-0.03432245, 1.786274, 0.5692814, 1, 0, 0, 1, 1,
-0.03343176, 0.2256781, 0.4090564, 0, 0, 0, 1, 1,
-0.03061194, -0.2443262, -3.723267, 0, 0, 0, 1, 1,
-0.02860712, -2.00285, -3.310525, 0, 0, 0, 1, 1,
-0.02820265, -1.333926, -2.341853, 0, 0, 0, 1, 1,
-0.02665925, -0.5956698, -4.14648, 0, 0, 0, 1, 1,
-0.02658614, -1.886872, -3.479858, 0, 0, 0, 1, 1,
-0.02653292, -0.2176863, -3.117068, 0, 0, 0, 1, 1,
-0.02650743, -0.3323439, -2.304691, 1, 1, 1, 1, 1,
-0.02153611, 1.233177, -1.802045, 1, 1, 1, 1, 1,
-0.02150168, -1.285946, -1.316927, 1, 1, 1, 1, 1,
-0.01848653, 0.03284358, -2.098115, 1, 1, 1, 1, 1,
-0.016372, -0.1234964, -0.9657294, 1, 1, 1, 1, 1,
-0.0152426, 1.45455, 0.2710904, 1, 1, 1, 1, 1,
-0.01435776, 1.68652, -0.1930776, 1, 1, 1, 1, 1,
-0.006630259, -0.0398354, -3.428336, 1, 1, 1, 1, 1,
-0.005282302, -0.2264696, -3.096133, 1, 1, 1, 1, 1,
-0.004779523, -0.3474963, -1.765392, 1, 1, 1, 1, 1,
0.001077061, 0.2864894, -0.3133506, 1, 1, 1, 1, 1,
0.001629229, 0.4432203, 0.2016728, 1, 1, 1, 1, 1,
0.003646396, 0.5130688, -0.6142427, 1, 1, 1, 1, 1,
0.006004388, -0.6151484, 3.138463, 1, 1, 1, 1, 1,
0.007549376, 0.2989929, 0.8733823, 1, 1, 1, 1, 1,
0.008870442, -0.4973571, 3.600065, 0, 0, 1, 1, 1,
0.009041083, -0.9213023, 2.83937, 1, 0, 0, 1, 1,
0.01139192, 0.2225302, 0.02249707, 1, 0, 0, 1, 1,
0.01753061, -2.041037, 2.593544, 1, 0, 0, 1, 1,
0.02099415, 0.1090401, -0.1351067, 1, 0, 0, 1, 1,
0.02404717, -0.7241793, 1.84248, 1, 0, 0, 1, 1,
0.02421255, -0.6276479, 2.487744, 0, 0, 0, 1, 1,
0.02463521, -0.7098453, 2.021298, 0, 0, 0, 1, 1,
0.02893537, 0.2435468, 0.8310251, 0, 0, 0, 1, 1,
0.03372842, -1.165149, 1.361427, 0, 0, 0, 1, 1,
0.03537539, 0.2960623, -1.874942, 0, 0, 0, 1, 1,
0.04235005, 0.3308983, 1.414431, 0, 0, 0, 1, 1,
0.0450712, -1.306103, 5.020685, 0, 0, 0, 1, 1,
0.04860697, -0.6844576, 4.693779, 1, 1, 1, 1, 1,
0.04944928, 0.436855, -1.860717, 1, 1, 1, 1, 1,
0.05315695, -0.8642172, 2.572912, 1, 1, 1, 1, 1,
0.05560779, -2.233186, 3.1561, 1, 1, 1, 1, 1,
0.0592681, 0.2037773, 1.212893, 1, 1, 1, 1, 1,
0.06345588, 0.4008118, -0.04553023, 1, 1, 1, 1, 1,
0.06419794, 0.1971712, 1.867369, 1, 1, 1, 1, 1,
0.07120273, -0.1849885, 4.549082, 1, 1, 1, 1, 1,
0.07376956, 0.1837883, -0.2309503, 1, 1, 1, 1, 1,
0.07880338, -0.2671451, 2.48311, 1, 1, 1, 1, 1,
0.08076967, -0.4018883, 4.406752, 1, 1, 1, 1, 1,
0.08277389, -0.2414975, 3.452234, 1, 1, 1, 1, 1,
0.08355559, 0.3633819, -0.5576414, 1, 1, 1, 1, 1,
0.08488283, -0.2662074, 1.817735, 1, 1, 1, 1, 1,
0.09002713, -1.536302, 2.145191, 1, 1, 1, 1, 1,
0.09320603, -0.5297912, 2.175954, 0, 0, 1, 1, 1,
0.09442222, 0.1259387, 0.1684251, 1, 0, 0, 1, 1,
0.09635895, -0.6095882, 2.39137, 1, 0, 0, 1, 1,
0.1021471, 1.254515, -0.413007, 1, 0, 0, 1, 1,
0.1025089, 0.06305375, 0.7247608, 1, 0, 0, 1, 1,
0.102669, 0.4257341, -0.2879702, 1, 0, 0, 1, 1,
0.1033225, -1.563025, 2.779708, 0, 0, 0, 1, 1,
0.1050882, -2.30303, 2.452906, 0, 0, 0, 1, 1,
0.1057172, 0.6850975, -0.2405611, 0, 0, 0, 1, 1,
0.1104999, 1.283782, -0.6500054, 0, 0, 0, 1, 1,
0.1111524, 1.000658, -0.1375328, 0, 0, 0, 1, 1,
0.1112071, -0.4346307, 3.723119, 0, 0, 0, 1, 1,
0.1137821, -0.1682307, 1.823512, 0, 0, 0, 1, 1,
0.1157311, 0.06227136, 0.8008496, 1, 1, 1, 1, 1,
0.1195786, -2.544931, 2.782735, 1, 1, 1, 1, 1,
0.1201075, 1.012564, -0.2398661, 1, 1, 1, 1, 1,
0.1230275, -1.247243, 2.087401, 1, 1, 1, 1, 1,
0.1232344, -0.118657, 1.572944, 1, 1, 1, 1, 1,
0.1232385, -1.51298, 2.276584, 1, 1, 1, 1, 1,
0.1279508, -0.9988387, 1.744384, 1, 1, 1, 1, 1,
0.1382263, 0.8053365, 1.350618, 1, 1, 1, 1, 1,
0.1400234, -0.252314, 2.622031, 1, 1, 1, 1, 1,
0.1416904, 0.3481815, -0.9775719, 1, 1, 1, 1, 1,
0.1424956, 0.04649013, 0.6869846, 1, 1, 1, 1, 1,
0.1426309, 0.5051103, -0.761905, 1, 1, 1, 1, 1,
0.1436161, -0.09650467, 2.601204, 1, 1, 1, 1, 1,
0.1440234, 1.322264, -1.418333, 1, 1, 1, 1, 1,
0.1460599, -0.6694341, 1.52945, 1, 1, 1, 1, 1,
0.1479076, -0.4351613, 2.257768, 0, 0, 1, 1, 1,
0.1500414, 1.012331, -1.800701, 1, 0, 0, 1, 1,
0.1574007, -0.7669562, 2.95488, 1, 0, 0, 1, 1,
0.1600422, -0.4400528, 3.28489, 1, 0, 0, 1, 1,
0.1602384, 0.9517044, 0.02288655, 1, 0, 0, 1, 1,
0.1605418, -0.4912554, 2.655529, 1, 0, 0, 1, 1,
0.1614338, -0.0510882, 1.554924, 0, 0, 0, 1, 1,
0.161984, 0.2998085, 0.943467, 0, 0, 0, 1, 1,
0.1636676, 0.4499018, 0.5272987, 0, 0, 0, 1, 1,
0.1664946, 1.040619, 1.283928, 0, 0, 0, 1, 1,
0.1685051, 0.1454501, -0.6052613, 0, 0, 0, 1, 1,
0.1842637, 0.8823222, 1.036057, 0, 0, 0, 1, 1,
0.1920976, 0.1599498, -0.6826023, 0, 0, 0, 1, 1,
0.1958246, 2.537591, -0.9690225, 1, 1, 1, 1, 1,
0.1962859, -0.8332424, 2.353304, 1, 1, 1, 1, 1,
0.1971022, -0.7020879, 3.853181, 1, 1, 1, 1, 1,
0.1988854, -0.5081218, 2.522931, 1, 1, 1, 1, 1,
0.1997025, -1.151587, 2.147414, 1, 1, 1, 1, 1,
0.2004638, -1.591961, 2.355088, 1, 1, 1, 1, 1,
0.2069, -0.7908561, 2.051736, 1, 1, 1, 1, 1,
0.2135154, -1.020418, 3.728141, 1, 1, 1, 1, 1,
0.2169461, -2.457833, 3.912508, 1, 1, 1, 1, 1,
0.2207768, 0.3482399, 2.061438, 1, 1, 1, 1, 1,
0.2208632, -1.26173, 5.184524, 1, 1, 1, 1, 1,
0.2220155, 0.6486559, -0.9714893, 1, 1, 1, 1, 1,
0.2231154, 1.627726, -0.9396007, 1, 1, 1, 1, 1,
0.2236135, -0.9837548, 3.457572, 1, 1, 1, 1, 1,
0.2261138, -0.3211464, 1.37498, 1, 1, 1, 1, 1,
0.2337462, 0.7656731, 0.09261657, 0, 0, 1, 1, 1,
0.2389465, 0.9301615, -0.7686405, 1, 0, 0, 1, 1,
0.2406656, 1.292436, 1.044532, 1, 0, 0, 1, 1,
0.2407254, -0.7089912, 2.96172, 1, 0, 0, 1, 1,
0.2419217, -0.429395, 2.47354, 1, 0, 0, 1, 1,
0.2430074, 1.014566, 1.364324, 1, 0, 0, 1, 1,
0.2496922, 0.423077, 0.2145659, 0, 0, 0, 1, 1,
0.251445, -0.45948, 3.931134, 0, 0, 0, 1, 1,
0.2527239, -1.170342, 5.106596, 0, 0, 0, 1, 1,
0.254215, -0.3146037, -0.07301152, 0, 0, 0, 1, 1,
0.2548636, -0.9351366, 3.808379, 0, 0, 0, 1, 1,
0.2589394, -0.3734772, 1.554244, 0, 0, 0, 1, 1,
0.2624015, 0.1117959, 1.027357, 0, 0, 0, 1, 1,
0.2635979, -0.2726134, 3.005366, 1, 1, 1, 1, 1,
0.2653517, -0.339559, 3.081607, 1, 1, 1, 1, 1,
0.2654727, -0.7182471, 2.574785, 1, 1, 1, 1, 1,
0.2700638, 1.614261, 1.004408, 1, 1, 1, 1, 1,
0.2728318, 0.9975329, -0.4864196, 1, 1, 1, 1, 1,
0.27577, -0.1049477, 1.394335, 1, 1, 1, 1, 1,
0.2758666, 0.8052293, -0.7444848, 1, 1, 1, 1, 1,
0.276994, -1.085556, 3.028932, 1, 1, 1, 1, 1,
0.2787045, 0.04690453, 1.01145, 1, 1, 1, 1, 1,
0.279821, 1.358572, 0.643881, 1, 1, 1, 1, 1,
0.2811506, 0.08230568, 1.977267, 1, 1, 1, 1, 1,
0.2875811, -0.6279303, 2.454957, 1, 1, 1, 1, 1,
0.2890439, 0.1511025, 1.59795, 1, 1, 1, 1, 1,
0.2914509, 1.767037, 0.229593, 1, 1, 1, 1, 1,
0.2928994, 0.4168777, -0.844349, 1, 1, 1, 1, 1,
0.2936005, -0.3794172, 1.915712, 0, 0, 1, 1, 1,
0.2955519, -0.6180934, 3.59931, 1, 0, 0, 1, 1,
0.2968511, 0.4060313, 1.28373, 1, 0, 0, 1, 1,
0.2969063, 0.8020053, 1.201826, 1, 0, 0, 1, 1,
0.2980977, 1.463002, 0.1580099, 1, 0, 0, 1, 1,
0.3003644, 1.387617, 0.2377173, 1, 0, 0, 1, 1,
0.3018987, 0.3246282, 0.007022959, 0, 0, 0, 1, 1,
0.304955, 0.6009737, 1.497769, 0, 0, 0, 1, 1,
0.3089277, 0.9921342, -0.3461476, 0, 0, 0, 1, 1,
0.3117086, -0.5902525, 3.072683, 0, 0, 0, 1, 1,
0.314465, 0.508747, 1.97592, 0, 0, 0, 1, 1,
0.3166282, -0.730126, 3.86902, 0, 0, 0, 1, 1,
0.3197722, 0.5984924, -0.9877253, 0, 0, 0, 1, 1,
0.3205466, 2.350061, -0.7941339, 1, 1, 1, 1, 1,
0.3229037, 0.480146, 1.928585, 1, 1, 1, 1, 1,
0.3242187, 0.032, 2.439322, 1, 1, 1, 1, 1,
0.3244717, -0.2090171, 2.559582, 1, 1, 1, 1, 1,
0.3303262, -0.9569163, 0.81069, 1, 1, 1, 1, 1,
0.3364398, -0.7079347, 1.631004, 1, 1, 1, 1, 1,
0.3390977, -0.4235082, 1.709287, 1, 1, 1, 1, 1,
0.3426678, -0.9971606, 0.9757685, 1, 1, 1, 1, 1,
0.3441222, 0.661795, -0.4578941, 1, 1, 1, 1, 1,
0.3481524, -1.211644, 2.076161, 1, 1, 1, 1, 1,
0.3557955, 0.6438982, -0.4589114, 1, 1, 1, 1, 1,
0.3590178, -2.784439, 2.93036, 1, 1, 1, 1, 1,
0.3595812, -0.297424, 1.751951, 1, 1, 1, 1, 1,
0.3610584, 0.1451961, 0.5864038, 1, 1, 1, 1, 1,
0.3625994, 1.738208, -0.1971545, 1, 1, 1, 1, 1,
0.3680151, -0.8803062, 1.98208, 0, 0, 1, 1, 1,
0.3687258, 0.218794, 0.4602027, 1, 0, 0, 1, 1,
0.3712655, -2.134372, 3.987207, 1, 0, 0, 1, 1,
0.371335, -1.250062, 1.536375, 1, 0, 0, 1, 1,
0.3730074, -1.348851, 3.879168, 1, 0, 0, 1, 1,
0.3766902, -1.158076, 4.671432, 1, 0, 0, 1, 1,
0.3768251, -2.034335, 2.755847, 0, 0, 0, 1, 1,
0.379922, 1.210844, 0.7581425, 0, 0, 0, 1, 1,
0.3822973, 0.2677054, 1.882215, 0, 0, 0, 1, 1,
0.3835876, 0.03223407, 2.068066, 0, 0, 0, 1, 1,
0.3838218, -0.2816505, 1.850682, 0, 0, 0, 1, 1,
0.388431, 1.884984, -1.137151, 0, 0, 0, 1, 1,
0.3888908, -1.207423, 2.683382, 0, 0, 0, 1, 1,
0.389347, 0.5957718, 0.1853007, 1, 1, 1, 1, 1,
0.3897798, 0.5043851, 0.8447236, 1, 1, 1, 1, 1,
0.3916374, -1.264875, 3.848522, 1, 1, 1, 1, 1,
0.3935954, -0.3465092, 2.567754, 1, 1, 1, 1, 1,
0.3954083, -0.007864634, 2.33325, 1, 1, 1, 1, 1,
0.3964211, 0.412449, -0.0715888, 1, 1, 1, 1, 1,
0.3973234, -0.3873708, 1.837006, 1, 1, 1, 1, 1,
0.3980753, 0.4891602, 0.2177699, 1, 1, 1, 1, 1,
0.3982828, 0.3856196, 1.265934, 1, 1, 1, 1, 1,
0.3992876, 0.2076651, -0.1043982, 1, 1, 1, 1, 1,
0.4001117, 0.1675539, 1.830822, 1, 1, 1, 1, 1,
0.4006082, 0.6713046, 1.089267, 1, 1, 1, 1, 1,
0.4049979, -0.8253124, 1.995559, 1, 1, 1, 1, 1,
0.4097129, -0.5024994, 3.446095, 1, 1, 1, 1, 1,
0.4156361, -1.597682, 2.960875, 1, 1, 1, 1, 1,
0.4165448, 0.07885928, 1.555405, 0, 0, 1, 1, 1,
0.4264514, -0.5995796, 2.502567, 1, 0, 0, 1, 1,
0.4290906, 0.086707, 1.074923, 1, 0, 0, 1, 1,
0.4300245, -0.9889033, 3.846522, 1, 0, 0, 1, 1,
0.4321557, 0.6155423, 0.7500896, 1, 0, 0, 1, 1,
0.4344266, -1.180712, 2.918931, 1, 0, 0, 1, 1,
0.4365881, 1.227993, -0.8081776, 0, 0, 0, 1, 1,
0.4366249, -2.017326, 2.685541, 0, 0, 0, 1, 1,
0.4366576, 0.3747027, 0.3138723, 0, 0, 0, 1, 1,
0.4382071, -0.31345, 3.642899, 0, 0, 0, 1, 1,
0.4386649, -0.3826583, 2.715184, 0, 0, 0, 1, 1,
0.4514256, -1.928824, 2.139918, 0, 0, 0, 1, 1,
0.4526308, 0.4547446, -0.1675474, 0, 0, 0, 1, 1,
0.4555183, 0.7539067, 1.750212, 1, 1, 1, 1, 1,
0.4617013, -0.01972707, 1.161059, 1, 1, 1, 1, 1,
0.4643477, -1.172465, 3.799501, 1, 1, 1, 1, 1,
0.4734306, 0.4260497, 2.21096, 1, 1, 1, 1, 1,
0.4748948, -1.09093, 2.041293, 1, 1, 1, 1, 1,
0.4759398, 0.516288, -0.8900383, 1, 1, 1, 1, 1,
0.4820752, -0.145663, 2.186147, 1, 1, 1, 1, 1,
0.484478, 1.530222, 1.272495, 1, 1, 1, 1, 1,
0.4873573, -0.09237995, 4.499193, 1, 1, 1, 1, 1,
0.4916754, 0.3587506, 0.4944597, 1, 1, 1, 1, 1,
0.4932263, 0.09133459, 1.906991, 1, 1, 1, 1, 1,
0.4949816, -1.156525, 1.020257, 1, 1, 1, 1, 1,
0.4962115, 0.9725336, -0.1339062, 1, 1, 1, 1, 1,
0.4967553, 2.214446, 1.167743, 1, 1, 1, 1, 1,
0.4986762, 0.4696624, 0.763325, 1, 1, 1, 1, 1,
0.4990105, -1.017267, 1.223774, 0, 0, 1, 1, 1,
0.5021545, -0.1469945, 3.518447, 1, 0, 0, 1, 1,
0.506605, -1.753453, 3.262951, 1, 0, 0, 1, 1,
0.5089921, 0.9129975, 0.3101326, 1, 0, 0, 1, 1,
0.514557, 1.254677, -0.6459012, 1, 0, 0, 1, 1,
0.5145822, 2.757851, 0.1577899, 1, 0, 0, 1, 1,
0.5205881, -0.3059751, 3.021098, 0, 0, 0, 1, 1,
0.520968, 0.8241071, 0.398994, 0, 0, 0, 1, 1,
0.522238, -0.3595706, 3.995077, 0, 0, 0, 1, 1,
0.5265129, 0.1205405, 0.1388339, 0, 0, 0, 1, 1,
0.5268376, -0.973897, 2.079077, 0, 0, 0, 1, 1,
0.5273936, -1.225003, 2.520338, 0, 0, 0, 1, 1,
0.5279778, -0.2960213, 1.942355, 0, 0, 0, 1, 1,
0.531278, -1.214437, 2.852736, 1, 1, 1, 1, 1,
0.5374749, -1.007468, 4.719307, 1, 1, 1, 1, 1,
0.538516, 0.3716885, -0.0229324, 1, 1, 1, 1, 1,
0.5424013, -2.31043, 3.699364, 1, 1, 1, 1, 1,
0.5427589, -1.178956, 2.118406, 1, 1, 1, 1, 1,
0.5464351, -0.6320521, 3.554193, 1, 1, 1, 1, 1,
0.5503772, 0.699168, -1.171766, 1, 1, 1, 1, 1,
0.5528024, -1.035492, 3.59848, 1, 1, 1, 1, 1,
0.5530886, -1.104736, 3.171201, 1, 1, 1, 1, 1,
0.555108, -1.004401, 2.770588, 1, 1, 1, 1, 1,
0.5561599, -0.279485, 2.24481, 1, 1, 1, 1, 1,
0.5568736, 0.3239318, 1.20692, 1, 1, 1, 1, 1,
0.5569777, -0.5398866, 1.955832, 1, 1, 1, 1, 1,
0.5609782, -0.3775096, 3.68243, 1, 1, 1, 1, 1,
0.5610732, 0.4959753, 1.215488, 1, 1, 1, 1, 1,
0.5674475, -0.2593495, 3.307307, 0, 0, 1, 1, 1,
0.5699942, -0.9426041, 4.177404, 1, 0, 0, 1, 1,
0.5729241, -0.7637919, 2.025533, 1, 0, 0, 1, 1,
0.5747641, -0.04904422, 1.135416, 1, 0, 0, 1, 1,
0.5775176, -1.527559, 4.21848, 1, 0, 0, 1, 1,
0.5788316, 0.3048838, -0.7849897, 1, 0, 0, 1, 1,
0.5793865, -0.6640227, 4.698444, 0, 0, 0, 1, 1,
0.5846083, 0.3957635, 0.5610013, 0, 0, 0, 1, 1,
0.5865312, 1.632754, 0.4355975, 0, 0, 0, 1, 1,
0.586846, 0.6835641, 1.002613, 0, 0, 0, 1, 1,
0.5868962, 0.521104, 0.204704, 0, 0, 0, 1, 1,
0.5921312, 0.1703689, 0.4894111, 0, 0, 0, 1, 1,
0.5953508, -1.13484, 4.625477, 0, 0, 0, 1, 1,
0.5964286, 0.003481464, 1.306259, 1, 1, 1, 1, 1,
0.5993412, 1.084509, 1.48183, 1, 1, 1, 1, 1,
0.6011801, 0.13828, 1.267998, 1, 1, 1, 1, 1,
0.605436, 1.73821, 0.186445, 1, 1, 1, 1, 1,
0.6071565, 0.260986, 2.375083, 1, 1, 1, 1, 1,
0.6095694, -0.1573931, 0.48521, 1, 1, 1, 1, 1,
0.6099977, 0.04510935, 1.174041, 1, 1, 1, 1, 1,
0.6114537, 1.550237, 0.6150285, 1, 1, 1, 1, 1,
0.6136028, 0.003605098, -0.3455369, 1, 1, 1, 1, 1,
0.623715, -0.5383841, 2.007758, 1, 1, 1, 1, 1,
0.6261688, -0.08771351, 1.915673, 1, 1, 1, 1, 1,
0.6267754, 2.560108, -1.56126, 1, 1, 1, 1, 1,
0.6277088, 1.22061, -0.4569604, 1, 1, 1, 1, 1,
0.6314948, 0.6857709, 0.9973745, 1, 1, 1, 1, 1,
0.6371042, 0.6495336, 3.168115, 1, 1, 1, 1, 1,
0.643394, 2.053363, -0.5501752, 0, 0, 1, 1, 1,
0.6461871, -0.07653701, 0.7777172, 1, 0, 0, 1, 1,
0.6468371, 0.702237, 1.259656, 1, 0, 0, 1, 1,
0.6474808, -0.3963084, 2.741441, 1, 0, 0, 1, 1,
0.64764, 1.917728, 0.2731634, 1, 0, 0, 1, 1,
0.6583896, 1.967556, -0.2169391, 1, 0, 0, 1, 1,
0.6590896, -1.391085, 2.063265, 0, 0, 0, 1, 1,
0.6611063, -1.793257, 3.129344, 0, 0, 0, 1, 1,
0.6631331, 0.5554614, 1.891521, 0, 0, 0, 1, 1,
0.6650945, -1.004368, 0.9167569, 0, 0, 0, 1, 1,
0.6721497, 0.7011436, 0.9156876, 0, 0, 0, 1, 1,
0.6763192, -1.657362, 2.446352, 0, 0, 0, 1, 1,
0.676998, -1.897401, 1.527406, 0, 0, 0, 1, 1,
0.6816369, 1.42058, 0.2563153, 1, 1, 1, 1, 1,
0.6864501, -2.095639, 3.471502, 1, 1, 1, 1, 1,
0.6895158, 0.9369102, 1.355976, 1, 1, 1, 1, 1,
0.6896238, -0.4041909, 1.73965, 1, 1, 1, 1, 1,
0.6905235, -0.1058632, 2.102061, 1, 1, 1, 1, 1,
0.695936, -0.5616863, 0.5348826, 1, 1, 1, 1, 1,
0.6960533, -0.01270226, 2.326414, 1, 1, 1, 1, 1,
0.7004097, -0.8314098, 3.516976, 1, 1, 1, 1, 1,
0.7018031, -0.854777, 1.771743, 1, 1, 1, 1, 1,
0.7018996, 0.8891562, -0.3814721, 1, 1, 1, 1, 1,
0.7113125, 1.239784, -1.260689, 1, 1, 1, 1, 1,
0.7137869, 0.305028, 1.620206, 1, 1, 1, 1, 1,
0.7173553, -0.9875997, -0.2053037, 1, 1, 1, 1, 1,
0.7205416, 0.06174392, 1.291193, 1, 1, 1, 1, 1,
0.7304254, 1.25583, -0.6320718, 1, 1, 1, 1, 1,
0.7322611, -1.941489, 4.033844, 0, 0, 1, 1, 1,
0.7344348, 1.860022, 1.38138, 1, 0, 0, 1, 1,
0.7359937, 1.189785, 0.7899668, 1, 0, 0, 1, 1,
0.7380741, -1.337064, 2.027455, 1, 0, 0, 1, 1,
0.7394536, -0.4013229, 2.94073, 1, 0, 0, 1, 1,
0.7402418, -2.262775, 2.601987, 1, 0, 0, 1, 1,
0.7512866, 0.8297741, 0.5899588, 0, 0, 0, 1, 1,
0.7545238, 0.1746334, -0.8261713, 0, 0, 0, 1, 1,
0.7549807, 0.6237256, 0.5433084, 0, 0, 0, 1, 1,
0.7593047, 0.3127019, 0.7361106, 0, 0, 0, 1, 1,
0.7613657, 0.2181838, 1.742239, 0, 0, 0, 1, 1,
0.7679442, -0.5688938, 1.827148, 0, 0, 0, 1, 1,
0.770675, 0.4473439, -0.4863831, 0, 0, 0, 1, 1,
0.771692, -1.458033, 3.898899, 1, 1, 1, 1, 1,
0.7723334, -0.4483583, 0.5039328, 1, 1, 1, 1, 1,
0.7853349, 0.6533165, 1.102389, 1, 1, 1, 1, 1,
0.7869647, -0.1501347, 2.405108, 1, 1, 1, 1, 1,
0.7916596, 1.139851, 0.185323, 1, 1, 1, 1, 1,
0.7943384, 0.879061, -2.085444, 1, 1, 1, 1, 1,
0.7996714, -0.2939141, 1.533713, 1, 1, 1, 1, 1,
0.8079786, 0.1040486, 1.608748, 1, 1, 1, 1, 1,
0.8119296, 0.3306099, 1.950098, 1, 1, 1, 1, 1,
0.8195335, 1.639987, 0.08817811, 1, 1, 1, 1, 1,
0.8211841, 1.701999, 0.0415324, 1, 1, 1, 1, 1,
0.8281189, -0.07819538, 0.7013328, 1, 1, 1, 1, 1,
0.840511, 1.194881, 1.047499, 1, 1, 1, 1, 1,
0.8431664, -0.1956622, 2.028693, 1, 1, 1, 1, 1,
0.8511384, 0.1482893, 1.101757, 1, 1, 1, 1, 1,
0.8511754, 0.3784518, 1.615057, 0, 0, 1, 1, 1,
0.8520233, -0.7812848, 3.753015, 1, 0, 0, 1, 1,
0.8521541, -1.967963, 2.347844, 1, 0, 0, 1, 1,
0.861223, -0.7721624, 0.7800365, 1, 0, 0, 1, 1,
0.8669642, -1.684866, 1.83704, 1, 0, 0, 1, 1,
0.8741669, 0.6664195, -0.2889272, 1, 0, 0, 1, 1,
0.8747776, -0.2405046, 2.651865, 0, 0, 0, 1, 1,
0.8772328, -0.3298557, 1.747972, 0, 0, 0, 1, 1,
0.8778383, -1.273273, 0.7019187, 0, 0, 0, 1, 1,
0.8796756, 0.245603, 0.190258, 0, 0, 0, 1, 1,
0.8804904, 0.1233073, 2.126491, 0, 0, 0, 1, 1,
0.8823503, -0.8439484, 3.085753, 0, 0, 0, 1, 1,
0.88427, -1.127286, 2.670611, 0, 0, 0, 1, 1,
0.8883547, -0.8230042, 2.428052, 1, 1, 1, 1, 1,
0.8892478, 0.1796635, 2.150341, 1, 1, 1, 1, 1,
0.8905788, -0.3415385, 3.02656, 1, 1, 1, 1, 1,
0.897182, 1.568828, 0.2504404, 1, 1, 1, 1, 1,
0.8984048, -2.248152, 1.043687, 1, 1, 1, 1, 1,
0.898527, 1.488323, 0.6616116, 1, 1, 1, 1, 1,
0.9011909, 1.925625, 0.2933287, 1, 1, 1, 1, 1,
0.9094199, 0.09665892, 1.042956, 1, 1, 1, 1, 1,
0.9115486, -1.403419, 1.323728, 1, 1, 1, 1, 1,
0.9153544, 1.164821, 1.364601, 1, 1, 1, 1, 1,
0.9162033, -0.7198836, 2.386763, 1, 1, 1, 1, 1,
0.91681, -0.07055252, 0.5553045, 1, 1, 1, 1, 1,
0.9202946, -1.606683, 0.7386048, 1, 1, 1, 1, 1,
0.9239031, 1.475776, 1.491069, 1, 1, 1, 1, 1,
0.9461234, -0.7168633, 0.8327135, 1, 1, 1, 1, 1,
0.9465135, 1.042879, -0.4517921, 0, 0, 1, 1, 1,
0.9470814, -2.127776, 2.876617, 1, 0, 0, 1, 1,
0.9492646, -1.192625, 0.7929437, 1, 0, 0, 1, 1,
0.9498518, -0.03048302, 1.034272, 1, 0, 0, 1, 1,
0.9557155, 0.8228796, 1.61729, 1, 0, 0, 1, 1,
0.9639065, 0.9919427, 2.185757, 1, 0, 0, 1, 1,
0.9664722, 0.7706831, -0.0629653, 0, 0, 0, 1, 1,
0.9699008, -0.2587961, 2.012881, 0, 0, 0, 1, 1,
0.9805574, 0.6273037, -1.218797, 0, 0, 0, 1, 1,
0.9825343, 0.2989119, 2.628569, 0, 0, 0, 1, 1,
0.9905479, 0.291742, -0.01970025, 0, 0, 0, 1, 1,
0.9944894, -0.4299358, 0.9700732, 0, 0, 0, 1, 1,
1.000572, 1.777978, 1.589229, 0, 0, 0, 1, 1,
1.002601, -0.5667402, 2.760584, 1, 1, 1, 1, 1,
1.017818, -1.457599, 1.300853, 1, 1, 1, 1, 1,
1.021573, -2.092995, 4.305918, 1, 1, 1, 1, 1,
1.026788, -2.165577, 2.446205, 1, 1, 1, 1, 1,
1.028228, 0.381552, -0.06726552, 1, 1, 1, 1, 1,
1.036068, -0.2745654, 2.642798, 1, 1, 1, 1, 1,
1.042864, 0.6933954, 2.215906, 1, 1, 1, 1, 1,
1.051521, 1.402654, 0.1461355, 1, 1, 1, 1, 1,
1.058136, 0.3659312, 1.360796, 1, 1, 1, 1, 1,
1.068568, -0.09404961, 1.661045, 1, 1, 1, 1, 1,
1.077095, -2.60813, 2.76106, 1, 1, 1, 1, 1,
1.078092, -0.03582609, 2.513803, 1, 1, 1, 1, 1,
1.083292, -0.4315132, 2.024544, 1, 1, 1, 1, 1,
1.086802, -0.02183746, 0.9604878, 1, 1, 1, 1, 1,
1.095941, 2.214975, -0.6755359, 1, 1, 1, 1, 1,
1.100703, -0.6452095, 2.364467, 0, 0, 1, 1, 1,
1.103889, -2.223591, 3.127361, 1, 0, 0, 1, 1,
1.104215, 0.7587856, 2.702005, 1, 0, 0, 1, 1,
1.106742, 0.8574631, 0.3212697, 1, 0, 0, 1, 1,
1.111864, 0.5423723, 2.50823, 1, 0, 0, 1, 1,
1.114412, 0.9531201, 1.266079, 1, 0, 0, 1, 1,
1.125288, -0.4936676, 0.2654086, 0, 0, 0, 1, 1,
1.129931, -0.5021443, 0.9364352, 0, 0, 0, 1, 1,
1.131374, -1.25805, 3.23327, 0, 0, 0, 1, 1,
1.13207, 0.1065673, 4.376078, 0, 0, 0, 1, 1,
1.133484, 0.9941168, 2.35828, 0, 0, 0, 1, 1,
1.134482, -0.6342219, 0.1819005, 0, 0, 0, 1, 1,
1.140008, 0.567947, 0.4342475, 0, 0, 0, 1, 1,
1.140657, 2.039834, 1.211778, 1, 1, 1, 1, 1,
1.147601, 1.145663, -0.03090866, 1, 1, 1, 1, 1,
1.169708, 0.04108544, 1.265913, 1, 1, 1, 1, 1,
1.177518, -1.050177, 2.096929, 1, 1, 1, 1, 1,
1.185616, 0.7430097, 1.675846, 1, 1, 1, 1, 1,
1.192526, 0.08422866, 1.81947, 1, 1, 1, 1, 1,
1.206107, 0.2685308, -0.2563362, 1, 1, 1, 1, 1,
1.206465, -1.57189, 3.517853, 1, 1, 1, 1, 1,
1.219785, 0.5066904, 0.9914061, 1, 1, 1, 1, 1,
1.220217, 1.270637, 0.8765973, 1, 1, 1, 1, 1,
1.221053, -0.788096, 3.098542, 1, 1, 1, 1, 1,
1.221228, -0.4449611, 2.513583, 1, 1, 1, 1, 1,
1.222669, 0.04353087, 3.278812, 1, 1, 1, 1, 1,
1.227404, -0.4717742, 1.153393, 1, 1, 1, 1, 1,
1.248501, -0.7713882, 0.8043993, 1, 1, 1, 1, 1,
1.262466, -0.08446191, 0.8550313, 0, 0, 1, 1, 1,
1.263348, -0.125633, 2.053829, 1, 0, 0, 1, 1,
1.266563, -0.102953, 1.171093, 1, 0, 0, 1, 1,
1.267828, 0.7761663, 1.011458, 1, 0, 0, 1, 1,
1.274667, -1.394448, 2.98339, 1, 0, 0, 1, 1,
1.277412, 1.233334, 1.955058, 1, 0, 0, 1, 1,
1.290703, -0.6994911, 1.376912, 0, 0, 0, 1, 1,
1.299772, 1.843776, -0.1814351, 0, 0, 0, 1, 1,
1.305627, -0.6203567, 1.985896, 0, 0, 0, 1, 1,
1.311705, -0.1123338, 1.492819, 0, 0, 0, 1, 1,
1.313488, -1.124233, 1.026224, 0, 0, 0, 1, 1,
1.317672, -2.029978, -0.1145332, 0, 0, 0, 1, 1,
1.320789, 0.879182, 0.8991825, 0, 0, 0, 1, 1,
1.334032, 1.758669, 1.448423, 1, 1, 1, 1, 1,
1.336294, -0.4771259, 1.70732, 1, 1, 1, 1, 1,
1.338559, 0.02626605, 2.418702, 1, 1, 1, 1, 1,
1.34171, 0.6567403, 0.5695068, 1, 1, 1, 1, 1,
1.350014, 1.54083, 1.790844, 1, 1, 1, 1, 1,
1.352551, -0.3417675, 0.3796033, 1, 1, 1, 1, 1,
1.366342, 0.6007673, -0.1029025, 1, 1, 1, 1, 1,
1.367541, -0.64622, 2.311215, 1, 1, 1, 1, 1,
1.37792, 0.7544357, 1.94688, 1, 1, 1, 1, 1,
1.381028, 1.635297, 1.346283, 1, 1, 1, 1, 1,
1.384645, 0.2594009, -0.1513353, 1, 1, 1, 1, 1,
1.391392, 0.8616887, 1.146122, 1, 1, 1, 1, 1,
1.411634, -0.6941479, 2.343078, 1, 1, 1, 1, 1,
1.417785, -0.5427994, 2.834246, 1, 1, 1, 1, 1,
1.418476, -0.1958228, 0.5603766, 1, 1, 1, 1, 1,
1.42169, 1.196461, 0.3704039, 0, 0, 1, 1, 1,
1.428006, -0.5871193, 0.05365543, 1, 0, 0, 1, 1,
1.43355, 0.1614309, 2.276596, 1, 0, 0, 1, 1,
1.449724, -0.2206695, -0.01829244, 1, 0, 0, 1, 1,
1.450069, 0.1389896, 1.267512, 1, 0, 0, 1, 1,
1.458368, 1.468504, 1.728969, 1, 0, 0, 1, 1,
1.462396, 0.657877, 1.489476, 0, 0, 0, 1, 1,
1.468836, -1.29929, 0.6644815, 0, 0, 0, 1, 1,
1.471988, 0.2416001, 1.539267, 0, 0, 0, 1, 1,
1.482635, -1.578477, 2.478599, 0, 0, 0, 1, 1,
1.484226, 0.1891557, 1.095248, 0, 0, 0, 1, 1,
1.48826, -1.210411, 2.240618, 0, 0, 0, 1, 1,
1.500754, -0.3734012, 2.58649, 0, 0, 0, 1, 1,
1.502572, -0.08848906, 3.453017, 1, 1, 1, 1, 1,
1.504419, -0.826585, 2.178382, 1, 1, 1, 1, 1,
1.509094, 0.2147397, 0.9423774, 1, 1, 1, 1, 1,
1.50924, 0.3220109, 1.298744, 1, 1, 1, 1, 1,
1.51597, -0.01168852, 1.389428, 1, 1, 1, 1, 1,
1.518577, 1.625898, 0.8347366, 1, 1, 1, 1, 1,
1.519197, 0.1630846, 0.927327, 1, 1, 1, 1, 1,
1.538837, -1.663975, 1.557061, 1, 1, 1, 1, 1,
1.547969, -0.2041054, 0.6164041, 1, 1, 1, 1, 1,
1.551386, 1.736556, 1.648958, 1, 1, 1, 1, 1,
1.552486, 0.1487349, 2.807243, 1, 1, 1, 1, 1,
1.556232, -2.817168, 1.708595, 1, 1, 1, 1, 1,
1.556713, -0.2987702, 0.2258843, 1, 1, 1, 1, 1,
1.566818, -0.865487, 1.638793, 1, 1, 1, 1, 1,
1.574833, -1.555183, 0.8426217, 1, 1, 1, 1, 1,
1.604952, 1.564667, 0.8897897, 0, 0, 1, 1, 1,
1.608676, -1.109601, 1.465909, 1, 0, 0, 1, 1,
1.616215, -0.03892637, 0.1896521, 1, 0, 0, 1, 1,
1.618657, 0.1476976, 0.3147943, 1, 0, 0, 1, 1,
1.632061, 1.01876, 2.373061, 1, 0, 0, 1, 1,
1.632582, -0.4789623, 0.7993346, 1, 0, 0, 1, 1,
1.637778, -1.242631, 1.886291, 0, 0, 0, 1, 1,
1.643784, 0.7448288, 1.167108, 0, 0, 0, 1, 1,
1.670094, 1.071075, 0.8492612, 0, 0, 0, 1, 1,
1.672772, 0.08530334, 0.015339, 0, 0, 0, 1, 1,
1.705363, -0.1420382, 2.433618, 0, 0, 0, 1, 1,
1.709514, -1.469259, 2.966298, 0, 0, 0, 1, 1,
1.715646, 0.9539004, 0.5549013, 0, 0, 0, 1, 1,
1.752158, 0.69344, 0.3893176, 1, 1, 1, 1, 1,
1.757121, -0.5438637, 3.052966, 1, 1, 1, 1, 1,
1.761065, 0.1681867, 2.162354, 1, 1, 1, 1, 1,
1.770297, -0.9149017, 1.572344, 1, 1, 1, 1, 1,
1.797852, -1.563409, 1.614156, 1, 1, 1, 1, 1,
1.807562, -0.2895411, 3.133049, 1, 1, 1, 1, 1,
1.828197, -0.87485, 1.058192, 1, 1, 1, 1, 1,
1.83987, 0.2049712, 1.114517, 1, 1, 1, 1, 1,
1.84747, -0.4921013, 2.701301, 1, 1, 1, 1, 1,
1.943801, 1.033952, 1.353223, 1, 1, 1, 1, 1,
1.973478, 0.3721109, 2.125417, 1, 1, 1, 1, 1,
1.977594, -1.053701, 2.563658, 1, 1, 1, 1, 1,
1.980747, -1.200957, 1.628653, 1, 1, 1, 1, 1,
1.981065, 2.11051, 0.6806186, 1, 1, 1, 1, 1,
2.016391, 0.05168196, 0.6701019, 1, 1, 1, 1, 1,
2.03815, -1.402794, 1.874007, 0, 0, 1, 1, 1,
2.052608, -0.1709587, 1.863853, 1, 0, 0, 1, 1,
2.13005, 0.2783014, 0.7918646, 1, 0, 0, 1, 1,
2.1315, -1.053726, 0.6414924, 1, 0, 0, 1, 1,
2.181454, -1.170803, 3.056064, 1, 0, 0, 1, 1,
2.298566, -0.865792, -1.698268, 1, 0, 0, 1, 1,
2.320817, 0.2167607, -0.4220114, 0, 0, 0, 1, 1,
2.384845, -0.1483661, 1.739181, 0, 0, 0, 1, 1,
2.391468, 0.4029577, 0.5288469, 0, 0, 0, 1, 1,
2.440171, 0.2214786, 0.1685698, 0, 0, 0, 1, 1,
2.441182, -0.2548168, 2.967198, 0, 0, 0, 1, 1,
2.49184, -0.4260753, -0.7556183, 0, 0, 0, 1, 1,
2.549595, 1.213711, 0.001587583, 0, 0, 0, 1, 1,
2.574037, 1.180383, 3.413601, 1, 1, 1, 1, 1,
2.630142, 0.2499809, 2.382083, 1, 1, 1, 1, 1,
2.648478, 1.085731, 2.55359, 1, 1, 1, 1, 1,
2.659193, 0.4104106, 0.6454024, 1, 1, 1, 1, 1,
2.74133, -0.4126289, 1.984988, 1, 1, 1, 1, 1,
2.794101, -0.5972618, 4.323875, 1, 1, 1, 1, 1,
2.965638, -1.997785, 3.994825, 1, 1, 1, 1, 1
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
var radius = 9.778063;
var distance = 34.34503;
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
mvMatrix.translate( -0.1315798, 0.2966545, 0.2421429 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34503);
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
