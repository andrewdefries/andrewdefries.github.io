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
-3.840348, 1.040112, -1.133692, 1, 0, 0, 1,
-3.373946, -0.2966796, -0.2031666, 1, 0.007843138, 0, 1,
-3.100071, 0.1231615, -1.856329, 1, 0.01176471, 0, 1,
-2.800497, 0.4154582, -2.454141, 1, 0.01960784, 0, 1,
-2.729928, 1.177807, -1.217466, 1, 0.02352941, 0, 1,
-2.728151, -0.4703366, -2.748632, 1, 0.03137255, 0, 1,
-2.678595, 0.9557513, -2.451178, 1, 0.03529412, 0, 1,
-2.620553, -0.146722, -1.396521, 1, 0.04313726, 0, 1,
-2.583814, -0.1879677, 0.7567124, 1, 0.04705882, 0, 1,
-2.507351, -2.032192, -1.171272, 1, 0.05490196, 0, 1,
-2.465053, -1.286226, -0.6267262, 1, 0.05882353, 0, 1,
-2.407384, 0.02638564, -1.164994, 1, 0.06666667, 0, 1,
-2.381067, 0.001106266, -1.452147, 1, 0.07058824, 0, 1,
-2.365527, 1.53019, -2.880944, 1, 0.07843138, 0, 1,
-2.33859, -2.10108, -0.477111, 1, 0.08235294, 0, 1,
-2.265394, 1.536163, -1.589592, 1, 0.09019608, 0, 1,
-2.252844, 0.7859385, -1.119933, 1, 0.09411765, 0, 1,
-2.250736, 0.6537618, -2.582264, 1, 0.1019608, 0, 1,
-2.250069, -0.1202274, -1.476256, 1, 0.1098039, 0, 1,
-2.216724, 1.751241, -1.382999, 1, 0.1137255, 0, 1,
-2.168185, 0.6674149, -1.046491, 1, 0.1215686, 0, 1,
-2.160043, -0.3201227, -1.750379, 1, 0.1254902, 0, 1,
-2.13867, -0.2779871, -2.24434, 1, 0.1333333, 0, 1,
-2.096319, -1.159135, -1.691954, 1, 0.1372549, 0, 1,
-2.055998, 0.3204149, -0.595576, 1, 0.145098, 0, 1,
-1.957195, 2.061031, 0.07299165, 1, 0.1490196, 0, 1,
-1.925001, 1.375508, 0.1971876, 1, 0.1568628, 0, 1,
-1.895302, -0.02621344, -1.803714, 1, 0.1607843, 0, 1,
-1.8831, 0.08257184, -1.964741, 1, 0.1686275, 0, 1,
-1.879307, -1.539405, -3.649298, 1, 0.172549, 0, 1,
-1.871293, 1.110589, -1.052453, 1, 0.1803922, 0, 1,
-1.857887, 2.352288, -0.273883, 1, 0.1843137, 0, 1,
-1.815188, -0.7906187, -1.078229, 1, 0.1921569, 0, 1,
-1.79105, -1.101593, -2.835739, 1, 0.1960784, 0, 1,
-1.788175, -0.8600479, -1.374282, 1, 0.2039216, 0, 1,
-1.786202, -0.934037, -1.806373, 1, 0.2117647, 0, 1,
-1.776981, -1.390686, -2.507266, 1, 0.2156863, 0, 1,
-1.769402, 0.9195063, 0.04560406, 1, 0.2235294, 0, 1,
-1.768678, 1.180321, -1.93587, 1, 0.227451, 0, 1,
-1.749654, 1.310211, 0.2841674, 1, 0.2352941, 0, 1,
-1.745734, 0.1530401, -2.193201, 1, 0.2392157, 0, 1,
-1.719733, -0.2671271, -2.916833, 1, 0.2470588, 0, 1,
-1.698557, -0.1318917, 0.6792562, 1, 0.2509804, 0, 1,
-1.693745, -0.1399464, -1.624409, 1, 0.2588235, 0, 1,
-1.68721, -0.7440262, -2.523154, 1, 0.2627451, 0, 1,
-1.675808, -0.8864311, -2.60595, 1, 0.2705882, 0, 1,
-1.672912, -1.432438, 0.09975871, 1, 0.2745098, 0, 1,
-1.664883, 1.208798, -1.555184, 1, 0.282353, 0, 1,
-1.65307, 0.3680048, -2.476677, 1, 0.2862745, 0, 1,
-1.647108, 0.4909429, -1.536218, 1, 0.2941177, 0, 1,
-1.642543, -0.4016045, -0.1395164, 1, 0.3019608, 0, 1,
-1.639851, -0.05065186, -0.571198, 1, 0.3058824, 0, 1,
-1.63036, 0.3605286, -2.680341, 1, 0.3137255, 0, 1,
-1.628063, 2.331184, 1.361503, 1, 0.3176471, 0, 1,
-1.618789, -0.7603849, -1.65675, 1, 0.3254902, 0, 1,
-1.606084, 1.350036, 0.3477957, 1, 0.3294118, 0, 1,
-1.603753, 0.752816, -0.9860902, 1, 0.3372549, 0, 1,
-1.602927, 0.5706987, -1.130015, 1, 0.3411765, 0, 1,
-1.59106, 0.4481758, -0.5905614, 1, 0.3490196, 0, 1,
-1.584319, 0.4551154, -4.33665, 1, 0.3529412, 0, 1,
-1.584235, -0.1095413, -0.7751167, 1, 0.3607843, 0, 1,
-1.581813, 1.342469, -1.541401, 1, 0.3647059, 0, 1,
-1.574178, -1.747087, -3.89813, 1, 0.372549, 0, 1,
-1.568907, 1.748715, -1.525865, 1, 0.3764706, 0, 1,
-1.564524, -0.163982, -2.677919, 1, 0.3843137, 0, 1,
-1.562404, -1.291182, -1.79948, 1, 0.3882353, 0, 1,
-1.556428, 0.08564927, -0.6778313, 1, 0.3960784, 0, 1,
-1.555145, -2.482659, -1.358848, 1, 0.4039216, 0, 1,
-1.553167, 1.045455, -1.578118, 1, 0.4078431, 0, 1,
-1.536518, 0.243733, -1.970391, 1, 0.4156863, 0, 1,
-1.528261, -0.1510866, -1.824919, 1, 0.4196078, 0, 1,
-1.520797, -0.6299253, -2.878656, 1, 0.427451, 0, 1,
-1.518186, 0.3627655, -1.952093, 1, 0.4313726, 0, 1,
-1.503394, 0.843384, -0.469044, 1, 0.4392157, 0, 1,
-1.495706, 0.198844, -2.03539, 1, 0.4431373, 0, 1,
-1.494155, 0.9199891, -1.972692, 1, 0.4509804, 0, 1,
-1.492051, -0.8312047, -2.084271, 1, 0.454902, 0, 1,
-1.482503, -0.5982633, -0.8137788, 1, 0.4627451, 0, 1,
-1.482066, 0.9788439, 0.5011075, 1, 0.4666667, 0, 1,
-1.479915, -0.8657764, -0.7532649, 1, 0.4745098, 0, 1,
-1.467132, -0.3125084, -1.853799, 1, 0.4784314, 0, 1,
-1.463305, 1.433318, -0.9392433, 1, 0.4862745, 0, 1,
-1.447545, -0.9530973, -3.320167, 1, 0.4901961, 0, 1,
-1.414177, -0.4429443, -1.697277, 1, 0.4980392, 0, 1,
-1.404792, 1.729501, -1.111197, 1, 0.5058824, 0, 1,
-1.402793, -1.847496, -1.501319, 1, 0.509804, 0, 1,
-1.39894, -1.659412, -1.426141, 1, 0.5176471, 0, 1,
-1.398764, -0.6304979, -2.597382, 1, 0.5215687, 0, 1,
-1.39165, -1.403145, -2.029778, 1, 0.5294118, 0, 1,
-1.388807, 0.0672489, -1.663339, 1, 0.5333334, 0, 1,
-1.388582, -1.287472, -1.932387, 1, 0.5411765, 0, 1,
-1.385449, 1.237742, -1.026736, 1, 0.5450981, 0, 1,
-1.385211, -0.5466122, -1.984158, 1, 0.5529412, 0, 1,
-1.384673, -0.8667002, -1.535994, 1, 0.5568628, 0, 1,
-1.374516, -0.5834568, -2.026302, 1, 0.5647059, 0, 1,
-1.368864, 1.356594, -0.7044999, 1, 0.5686275, 0, 1,
-1.368479, 0.5994748, -1.481351, 1, 0.5764706, 0, 1,
-1.366694, 0.80137, -1.607287, 1, 0.5803922, 0, 1,
-1.358982, -0.1798969, -2.281116, 1, 0.5882353, 0, 1,
-1.357448, -0.1935614, -1.604918, 1, 0.5921569, 0, 1,
-1.357121, -0.960319, -3.713649, 1, 0.6, 0, 1,
-1.352752, -1.315587, -2.718002, 1, 0.6078432, 0, 1,
-1.330401, 0.07482172, -1.241777, 1, 0.6117647, 0, 1,
-1.323732, -1.012082, -3.26341, 1, 0.6196079, 0, 1,
-1.323702, -0.4397098, -1.15442, 1, 0.6235294, 0, 1,
-1.305974, -0.2064501, -0.6276293, 1, 0.6313726, 0, 1,
-1.300251, 0.9298347, 0.2579279, 1, 0.6352941, 0, 1,
-1.261533, 0.2716397, -2.080654, 1, 0.6431373, 0, 1,
-1.256321, 0.2257741, -0.2900355, 1, 0.6470588, 0, 1,
-1.25508, -0.479064, -1.880216, 1, 0.654902, 0, 1,
-1.253191, -1.391511, -3.607455, 1, 0.6588235, 0, 1,
-1.251055, 0.3309103, -2.667907, 1, 0.6666667, 0, 1,
-1.241529, 0.8789925, 0.2849361, 1, 0.6705883, 0, 1,
-1.232389, 0.5500221, -2.292722, 1, 0.6784314, 0, 1,
-1.215169, 1.113367, -1.317595, 1, 0.682353, 0, 1,
-1.208216, -1.602528, -3.539867, 1, 0.6901961, 0, 1,
-1.199162, -0.3023298, -2.150837, 1, 0.6941177, 0, 1,
-1.198023, -1.003051, -1.053682, 1, 0.7019608, 0, 1,
-1.191232, -0.5712953, 0.004674592, 1, 0.7098039, 0, 1,
-1.186097, -1.717425, -1.616742, 1, 0.7137255, 0, 1,
-1.172889, 0.9600328, -1.045908, 1, 0.7215686, 0, 1,
-1.171362, -0.2050388, -1.521784, 1, 0.7254902, 0, 1,
-1.169961, 0.3072522, -0.691759, 1, 0.7333333, 0, 1,
-1.169387, 0.7809815, -1.254477, 1, 0.7372549, 0, 1,
-1.155664, 0.1653424, -1.279415, 1, 0.7450981, 0, 1,
-1.152861, 0.08047891, -2.107492, 1, 0.7490196, 0, 1,
-1.146342, -0.00881715, -0.577186, 1, 0.7568628, 0, 1,
-1.144543, -1.672889, -2.199261, 1, 0.7607843, 0, 1,
-1.144524, -0.3225576, -2.975015, 1, 0.7686275, 0, 1,
-1.140046, 0.07637522, -1.918116, 1, 0.772549, 0, 1,
-1.132249, -1.200813, -2.827893, 1, 0.7803922, 0, 1,
-1.132073, -1.277975, -3.055787, 1, 0.7843137, 0, 1,
-1.128506, -1.437152, -2.827495, 1, 0.7921569, 0, 1,
-1.126129, 0.06572691, -0.5235295, 1, 0.7960784, 0, 1,
-1.119593, -0.7861794, -2.215319, 1, 0.8039216, 0, 1,
-1.118228, -0.1913417, -2.114563, 1, 0.8117647, 0, 1,
-1.110666, -0.9094974, -1.749202, 1, 0.8156863, 0, 1,
-1.097793, -0.797108, -2.812796, 1, 0.8235294, 0, 1,
-1.088842, -0.2950923, -3.150299, 1, 0.827451, 0, 1,
-1.079493, 0.2202894, -2.425436, 1, 0.8352941, 0, 1,
-1.071932, -0.3397663, -1.965111, 1, 0.8392157, 0, 1,
-1.069071, -2.765734, -2.025068, 1, 0.8470588, 0, 1,
-1.068659, 0.1447653, -0.7408131, 1, 0.8509804, 0, 1,
-1.068373, -0.2250789, -2.987442, 1, 0.8588235, 0, 1,
-1.066354, 1.83051, 0.2986364, 1, 0.8627451, 0, 1,
-1.05993, 1.306401, -0.822592, 1, 0.8705882, 0, 1,
-1.055796, -0.09299822, -1.480733, 1, 0.8745098, 0, 1,
-1.047675, 0.4150425, -0.01604744, 1, 0.8823529, 0, 1,
-1.037428, -0.02981452, -0.03151011, 1, 0.8862745, 0, 1,
-1.028036, 1.11992, 0.7015471, 1, 0.8941177, 0, 1,
-1.019461, 0.007421174, -0.02826145, 1, 0.8980392, 0, 1,
-1.018001, 1.420441, -0.6821275, 1, 0.9058824, 0, 1,
-1.016848, -0.8842514, -3.484553, 1, 0.9137255, 0, 1,
-1.015356, 0.1140388, -0.3538388, 1, 0.9176471, 0, 1,
-1.01189, 0.8810346, 1.228458, 1, 0.9254902, 0, 1,
-1.008788, -0.1863602, -2.941084, 1, 0.9294118, 0, 1,
-1.007239, -1.073723, -1.977931, 1, 0.9372549, 0, 1,
-0.9998875, 1.935664, 0.9452772, 1, 0.9411765, 0, 1,
-0.999126, -0.08374901, -1.855763, 1, 0.9490196, 0, 1,
-0.9936011, -0.9512597, -1.917477, 1, 0.9529412, 0, 1,
-0.9854897, -0.008167697, -1.91388, 1, 0.9607843, 0, 1,
-0.9853911, 0.8863974, -0.8501913, 1, 0.9647059, 0, 1,
-0.9830625, -0.1218024, -0.8030587, 1, 0.972549, 0, 1,
-0.9807413, 3.018264, 0.7018742, 1, 0.9764706, 0, 1,
-0.9806578, 0.6987804, -0.7356822, 1, 0.9843137, 0, 1,
-0.978649, -0.9018717, -2.476827, 1, 0.9882353, 0, 1,
-0.977685, -0.9501848, -1.919692, 1, 0.9960784, 0, 1,
-0.9739472, -0.2873701, -2.077466, 0.9960784, 1, 0, 1,
-0.9724651, -0.1735173, -1.092239, 0.9921569, 1, 0, 1,
-0.970533, -0.04177478, -2.261609, 0.9843137, 1, 0, 1,
-0.9666256, 0.166433, 0.6692783, 0.9803922, 1, 0, 1,
-0.959882, -1.440868, -2.377224, 0.972549, 1, 0, 1,
-0.9581795, 1.97357, -0.2764194, 0.9686275, 1, 0, 1,
-0.9569899, 0.4851556, -3.550971, 0.9607843, 1, 0, 1,
-0.9491537, -1.059116, -2.178391, 0.9568627, 1, 0, 1,
-0.9411484, 0.5735462, -1.284703, 0.9490196, 1, 0, 1,
-0.9359061, 0.9068028, -0.9869097, 0.945098, 1, 0, 1,
-0.9355716, -1.670912, -1.58796, 0.9372549, 1, 0, 1,
-0.9330534, -0.2545398, -3.329686, 0.9333333, 1, 0, 1,
-0.9272748, 1.187106, 0.4034668, 0.9254902, 1, 0, 1,
-0.9256256, 0.9404373, -0.7171979, 0.9215686, 1, 0, 1,
-0.9209714, 0.4529373, -0.5772156, 0.9137255, 1, 0, 1,
-0.9167653, 0.1533183, -1.656062, 0.9098039, 1, 0, 1,
-0.9166906, -0.3896321, -1.847915, 0.9019608, 1, 0, 1,
-0.9165431, 0.03407295, -1.116942, 0.8941177, 1, 0, 1,
-0.9126647, -0.3651262, -1.179947, 0.8901961, 1, 0, 1,
-0.9076491, -0.122207, -1.514858, 0.8823529, 1, 0, 1,
-0.9001629, -0.8671594, -2.589291, 0.8784314, 1, 0, 1,
-0.8964326, -0.6198772, -3.340698, 0.8705882, 1, 0, 1,
-0.8922683, 1.730724, -0.2920876, 0.8666667, 1, 0, 1,
-0.8887039, 1.633419, -0.0370889, 0.8588235, 1, 0, 1,
-0.8846804, -0.5360368, -1.575577, 0.854902, 1, 0, 1,
-0.8821438, 0.3830266, -1.621319, 0.8470588, 1, 0, 1,
-0.8817973, -0.4902366, -2.124816, 0.8431373, 1, 0, 1,
-0.8802012, 0.3384929, -1.531749, 0.8352941, 1, 0, 1,
-0.8798649, -0.6814407, -2.220731, 0.8313726, 1, 0, 1,
-0.8723591, -0.614211, -2.216642, 0.8235294, 1, 0, 1,
-0.8578181, -2.714, -2.852831, 0.8196079, 1, 0, 1,
-0.857065, -0.7578324, -1.04792, 0.8117647, 1, 0, 1,
-0.8525409, 0.7715204, -2.202041, 0.8078431, 1, 0, 1,
-0.846731, 0.0381011, -1.513239, 0.8, 1, 0, 1,
-0.8443286, 0.6002495, -0.7040858, 0.7921569, 1, 0, 1,
-0.8438818, 1.901336, -0.5338377, 0.7882353, 1, 0, 1,
-0.8396631, -0.6188124, -2.62872, 0.7803922, 1, 0, 1,
-0.8264641, 3.03415, -0.1599149, 0.7764706, 1, 0, 1,
-0.8236482, -0.884587, -1.532227, 0.7686275, 1, 0, 1,
-0.8226239, 0.1359864, -1.505791, 0.7647059, 1, 0, 1,
-0.8213224, -1.14974, -3.023995, 0.7568628, 1, 0, 1,
-0.8212801, 1.774798, 0.525842, 0.7529412, 1, 0, 1,
-0.8140132, -1.993024, -2.261679, 0.7450981, 1, 0, 1,
-0.8133826, 1.18515, -0.5239294, 0.7411765, 1, 0, 1,
-0.8025266, -0.5842037, -0.6845767, 0.7333333, 1, 0, 1,
-0.796847, 0.3574071, -1.244221, 0.7294118, 1, 0, 1,
-0.7958254, 0.7940942, -2.102009, 0.7215686, 1, 0, 1,
-0.7926349, 0.3673021, -1.711282, 0.7176471, 1, 0, 1,
-0.7924237, -0.7020701, -1.277322, 0.7098039, 1, 0, 1,
-0.7916853, -1.222971, -2.057899, 0.7058824, 1, 0, 1,
-0.7905946, -1.620494, -3.126326, 0.6980392, 1, 0, 1,
-0.7831163, -0.6031137, -1.915053, 0.6901961, 1, 0, 1,
-0.7800275, 1.255207, -1.018909, 0.6862745, 1, 0, 1,
-0.7759304, 1.40269, -1.19049, 0.6784314, 1, 0, 1,
-0.7662237, -1.228542, -1.187927, 0.6745098, 1, 0, 1,
-0.7658468, 0.4139184, -1.233987, 0.6666667, 1, 0, 1,
-0.7633523, -0.687708, -1.332773, 0.6627451, 1, 0, 1,
-0.761332, 0.5469446, -0.5710535, 0.654902, 1, 0, 1,
-0.7437093, 1.058519, 1.387444, 0.6509804, 1, 0, 1,
-0.7417142, -1.478657, -4.280784, 0.6431373, 1, 0, 1,
-0.7331567, 0.8661199, -0.4318613, 0.6392157, 1, 0, 1,
-0.7316086, 0.4536928, 0.05873315, 0.6313726, 1, 0, 1,
-0.7283009, -0.8149512, -1.338069, 0.627451, 1, 0, 1,
-0.7219285, -0.5347173, -1.118369, 0.6196079, 1, 0, 1,
-0.720194, 0.1690505, -1.430548, 0.6156863, 1, 0, 1,
-0.7163284, -0.6127831, -3.028616, 0.6078432, 1, 0, 1,
-0.7125313, -0.3120328, -1.441167, 0.6039216, 1, 0, 1,
-0.7123936, -0.9526464, -3.285118, 0.5960785, 1, 0, 1,
-0.7094318, -0.9885474, -2.056983, 0.5882353, 1, 0, 1,
-0.7077454, -1.574921, -2.42404, 0.5843138, 1, 0, 1,
-0.6970131, 1.802351, -0.7271268, 0.5764706, 1, 0, 1,
-0.6940702, -0.9519038, -3.682965, 0.572549, 1, 0, 1,
-0.6885327, -0.8125038, -0.6089807, 0.5647059, 1, 0, 1,
-0.6866367, -1.468526, -3.280384, 0.5607843, 1, 0, 1,
-0.6830949, -0.460882, -0.3508063, 0.5529412, 1, 0, 1,
-0.676775, 1.136836, -2.143128, 0.5490196, 1, 0, 1,
-0.6751605, -0.1650488, -3.400112, 0.5411765, 1, 0, 1,
-0.6748693, -0.3580753, -1.624751, 0.5372549, 1, 0, 1,
-0.6733783, -0.05818164, -2.277103, 0.5294118, 1, 0, 1,
-0.6721622, -0.2642604, -2.987178, 0.5254902, 1, 0, 1,
-0.6715603, 1.847205, -0.2173541, 0.5176471, 1, 0, 1,
-0.6706057, -1.081344, -4.042409, 0.5137255, 1, 0, 1,
-0.6634583, -0.6302407, -4.136575, 0.5058824, 1, 0, 1,
-0.6624992, 1.029522, -0.2713405, 0.5019608, 1, 0, 1,
-0.661935, 0.2462288, -2.655178, 0.4941176, 1, 0, 1,
-0.6546814, 0.5486844, -3.154235, 0.4862745, 1, 0, 1,
-0.6510155, -0.7870548, -1.67467, 0.4823529, 1, 0, 1,
-0.6508704, 0.450654, 0.2739046, 0.4745098, 1, 0, 1,
-0.6487485, -0.4804305, -1.285061, 0.4705882, 1, 0, 1,
-0.6447743, -1.933905, -2.71475, 0.4627451, 1, 0, 1,
-0.6434852, 0.6156776, 0.8237669, 0.4588235, 1, 0, 1,
-0.632391, 0.6981041, -0.2461523, 0.4509804, 1, 0, 1,
-0.6322725, 1.709843, -0.2702974, 0.4470588, 1, 0, 1,
-0.6274094, 0.7953337, -0.6879137, 0.4392157, 1, 0, 1,
-0.624221, -1.114703, -0.7037453, 0.4352941, 1, 0, 1,
-0.6200283, 1.218878, -2.189245, 0.427451, 1, 0, 1,
-0.6171753, -0.9879656, -2.33089, 0.4235294, 1, 0, 1,
-0.6086748, -1.213689, -3.529188, 0.4156863, 1, 0, 1,
-0.6063657, 0.7789488, -0.6578032, 0.4117647, 1, 0, 1,
-0.6054788, -0.3213555, -2.837991, 0.4039216, 1, 0, 1,
-0.6040567, -1.454236, -2.905521, 0.3960784, 1, 0, 1,
-0.6031091, -1.050874, -3.035535, 0.3921569, 1, 0, 1,
-0.6020349, 0.4059714, -1.803285, 0.3843137, 1, 0, 1,
-0.5986523, 0.4713647, -1.466633, 0.3803922, 1, 0, 1,
-0.5977143, 0.5975788, -0.08689696, 0.372549, 1, 0, 1,
-0.5948004, -0.2994053, -1.422301, 0.3686275, 1, 0, 1,
-0.592801, -2.026415, -2.98134, 0.3607843, 1, 0, 1,
-0.5882867, -0.427416, -3.459969, 0.3568628, 1, 0, 1,
-0.5865381, 0.5090846, 0.210434, 0.3490196, 1, 0, 1,
-0.586178, 1.329445, -1.198994, 0.345098, 1, 0, 1,
-0.5734268, 0.8642245, -0.3556252, 0.3372549, 1, 0, 1,
-0.5561843, 0.5099146, -2.594383, 0.3333333, 1, 0, 1,
-0.5497128, 0.827727, -1.595433, 0.3254902, 1, 0, 1,
-0.5440583, -0.0016855, -3.480849, 0.3215686, 1, 0, 1,
-0.5367234, -0.916228, -1.8572, 0.3137255, 1, 0, 1,
-0.5323041, -0.4240647, -1.640796, 0.3098039, 1, 0, 1,
-0.531915, 1.314024, 0.4189335, 0.3019608, 1, 0, 1,
-0.5291331, -1.545234, -2.437551, 0.2941177, 1, 0, 1,
-0.5270081, -0.1346844, -1.279763, 0.2901961, 1, 0, 1,
-0.5266206, 1.461215, 0.668151, 0.282353, 1, 0, 1,
-0.5251029, 0.7048956, -2.335491, 0.2784314, 1, 0, 1,
-0.5239432, -2.19866, -3.897808, 0.2705882, 1, 0, 1,
-0.5203258, -1.061339, -3.163622, 0.2666667, 1, 0, 1,
-0.518095, 2.21383, -1.066579, 0.2588235, 1, 0, 1,
-0.5179364, -0.5996179, -3.488322, 0.254902, 1, 0, 1,
-0.5151304, -0.9803407, -3.695297, 0.2470588, 1, 0, 1,
-0.5119357, 0.901704, -0.9046206, 0.2431373, 1, 0, 1,
-0.5047173, -0.463081, -2.347571, 0.2352941, 1, 0, 1,
-0.5038261, -0.6390223, -2.521123, 0.2313726, 1, 0, 1,
-0.5033215, 0.17072, -1.053624, 0.2235294, 1, 0, 1,
-0.5028293, -0.2233209, -2.955833, 0.2196078, 1, 0, 1,
-0.4971126, 0.9378837, 0.6366519, 0.2117647, 1, 0, 1,
-0.4941539, 0.8383762, 0.3913625, 0.2078431, 1, 0, 1,
-0.4929573, -0.2650051, -1.095578, 0.2, 1, 0, 1,
-0.4879518, 0.5867489, -1.761528, 0.1921569, 1, 0, 1,
-0.4772474, -0.1166806, -2.608036, 0.1882353, 1, 0, 1,
-0.4691558, -0.137458, -1.621131, 0.1803922, 1, 0, 1,
-0.4667559, 1.249205, -1.102372, 0.1764706, 1, 0, 1,
-0.4644378, 0.2007629, -1.561564, 0.1686275, 1, 0, 1,
-0.4624715, -0.1608608, -2.638449, 0.1647059, 1, 0, 1,
-0.456632, -1.075199, -4.134616, 0.1568628, 1, 0, 1,
-0.4549439, 0.05780133, -1.583108, 0.1529412, 1, 0, 1,
-0.4510513, 0.8845162, -0.416797, 0.145098, 1, 0, 1,
-0.4494029, 0.09354503, 0.104967, 0.1411765, 1, 0, 1,
-0.4478346, 1.067479, -1.026822, 0.1333333, 1, 0, 1,
-0.4469488, 2.532484, -2.195444, 0.1294118, 1, 0, 1,
-0.4448855, -0.228085, -2.210276, 0.1215686, 1, 0, 1,
-0.4368854, -1.609236, -2.502447, 0.1176471, 1, 0, 1,
-0.4361722, -1.234195, -2.357786, 0.1098039, 1, 0, 1,
-0.434035, 0.3592257, -1.57891, 0.1058824, 1, 0, 1,
-0.4334646, 0.2810122, 0.08422504, 0.09803922, 1, 0, 1,
-0.4296471, 0.2304002, -2.091841, 0.09019608, 1, 0, 1,
-0.4289826, -1.290865, -3.972973, 0.08627451, 1, 0, 1,
-0.4212103, -0.02142182, -3.236933, 0.07843138, 1, 0, 1,
-0.4189122, -0.4483304, -3.20941, 0.07450981, 1, 0, 1,
-0.4157282, 0.6902462, -0.9553553, 0.06666667, 1, 0, 1,
-0.4110361, 0.4982447, -1.942443, 0.0627451, 1, 0, 1,
-0.4088259, -0.6511179, -2.880328, 0.05490196, 1, 0, 1,
-0.4011892, 0.493738, -0.1756055, 0.05098039, 1, 0, 1,
-0.4003653, 1.20544, -0.7140585, 0.04313726, 1, 0, 1,
-0.4002886, 1.01865, 0.2862961, 0.03921569, 1, 0, 1,
-0.3981394, 0.6266548, -0.02084409, 0.03137255, 1, 0, 1,
-0.394437, -1.480109, -3.722967, 0.02745098, 1, 0, 1,
-0.3828729, -0.7013171, -2.76917, 0.01960784, 1, 0, 1,
-0.3813966, 0.9832207, -1.590765, 0.01568628, 1, 0, 1,
-0.377023, -0.4261406, -2.788212, 0.007843138, 1, 0, 1,
-0.3764911, 1.65815, 0.04195646, 0.003921569, 1, 0, 1,
-0.3763616, -1.534581, -4.416871, 0, 1, 0.003921569, 1,
-0.3725564, -0.4746084, -3.521062, 0, 1, 0.01176471, 1,
-0.368779, -0.69152, -2.235916, 0, 1, 0.01568628, 1,
-0.3628284, 0.2820199, -0.9955899, 0, 1, 0.02352941, 1,
-0.3520444, 1.656938, 0.200083, 0, 1, 0.02745098, 1,
-0.3517899, -0.2698416, -2.524582, 0, 1, 0.03529412, 1,
-0.3516968, 0.6378484, 1.28736, 0, 1, 0.03921569, 1,
-0.3499484, -0.5239961, -1.880298, 0, 1, 0.04705882, 1,
-0.3457893, -1.491934, -3.870281, 0, 1, 0.05098039, 1,
-0.3403929, -0.427876, -1.849942, 0, 1, 0.05882353, 1,
-0.3276093, 1.838558, 0.9424301, 0, 1, 0.0627451, 1,
-0.3263303, 0.1268004, 1.160763, 0, 1, 0.07058824, 1,
-0.3188489, 0.25942, -2.058465, 0, 1, 0.07450981, 1,
-0.3080171, 1.495119, 0.4391626, 0, 1, 0.08235294, 1,
-0.3067296, -0.09630409, -1.815132, 0, 1, 0.08627451, 1,
-0.3064825, 0.03796243, -1.433256, 0, 1, 0.09411765, 1,
-0.296652, 0.07677557, -1.609593, 0, 1, 0.1019608, 1,
-0.2950939, 0.4307097, -1.075375, 0, 1, 0.1058824, 1,
-0.2908249, -0.2329653, -3.135623, 0, 1, 0.1137255, 1,
-0.2876828, -0.06337475, -1.32235, 0, 1, 0.1176471, 1,
-0.2856009, -1.552138, -1.848757, 0, 1, 0.1254902, 1,
-0.2832474, -0.5394208, -3.545011, 0, 1, 0.1294118, 1,
-0.2793587, 0.05395188, -0.5552887, 0, 1, 0.1372549, 1,
-0.2762303, -1.240862, -3.224342, 0, 1, 0.1411765, 1,
-0.2709, -1.211249, -2.742645, 0, 1, 0.1490196, 1,
-0.2673642, -1.601414, -2.94769, 0, 1, 0.1529412, 1,
-0.2664945, -1.071061, -3.535022, 0, 1, 0.1607843, 1,
-0.2662821, 0.8738548, -1.157965, 0, 1, 0.1647059, 1,
-0.2662724, 1.561206, 0.6191474, 0, 1, 0.172549, 1,
-0.2655949, -0.112565, -1.726886, 0, 1, 0.1764706, 1,
-0.2626871, 1.221068, -1.11012, 0, 1, 0.1843137, 1,
-0.2601348, -0.8273302, -2.09084, 0, 1, 0.1882353, 1,
-0.2586617, -1.309318, -0.9855729, 0, 1, 0.1960784, 1,
-0.2565316, 0.973752, -0.03841908, 0, 1, 0.2039216, 1,
-0.2543306, -1.236355, -2.543294, 0, 1, 0.2078431, 1,
-0.2516823, 2.057398, 1.115792, 0, 1, 0.2156863, 1,
-0.2467043, 1.445098, 0.8084127, 0, 1, 0.2196078, 1,
-0.2417161, 0.350356, 0.4390658, 0, 1, 0.227451, 1,
-0.2414774, 0.8805618, 0.09702142, 0, 1, 0.2313726, 1,
-0.2317381, -0.1985317, -2.654884, 0, 1, 0.2392157, 1,
-0.2313726, -2.632566, -2.346767, 0, 1, 0.2431373, 1,
-0.2301768, -0.04078668, -3.651288, 0, 1, 0.2509804, 1,
-0.2291137, -2.190588, -1.862405, 0, 1, 0.254902, 1,
-0.2283053, -0.7226365, -2.372257, 0, 1, 0.2627451, 1,
-0.226685, -0.8565347, -2.720755, 0, 1, 0.2666667, 1,
-0.2229217, 0.1279245, -0.476664, 0, 1, 0.2745098, 1,
-0.221407, 0.9373084, -1.155716, 0, 1, 0.2784314, 1,
-0.220804, 0.7228751, -0.6018279, 0, 1, 0.2862745, 1,
-0.2183793, -0.1699578, -1.133079, 0, 1, 0.2901961, 1,
-0.2172594, -0.762207, -1.255272, 0, 1, 0.2980392, 1,
-0.2137339, -0.9135479, -2.747424, 0, 1, 0.3058824, 1,
-0.2117315, 0.07820489, 0.1520232, 0, 1, 0.3098039, 1,
-0.2109337, -0.9398401, -1.643946, 0, 1, 0.3176471, 1,
-0.2087132, 0.5941013, -1.091954, 0, 1, 0.3215686, 1,
-0.205696, -0.7013923, -4.918651, 0, 1, 0.3294118, 1,
-0.203853, 0.7058926, -2.062222, 0, 1, 0.3333333, 1,
-0.2011795, -2.066723, -4.109678, 0, 1, 0.3411765, 1,
-0.2011643, -0.3942814, -2.307658, 0, 1, 0.345098, 1,
-0.1984706, -0.6236183, -4.739442, 0, 1, 0.3529412, 1,
-0.1970334, -0.6373221, -2.360687, 0, 1, 0.3568628, 1,
-0.196086, 1.277444, -1.131204, 0, 1, 0.3647059, 1,
-0.1953565, -1.045918, -1.343842, 0, 1, 0.3686275, 1,
-0.1889349, -1.484779, -2.513865, 0, 1, 0.3764706, 1,
-0.1857209, -0.08354207, -2.108995, 0, 1, 0.3803922, 1,
-0.1847636, 2.003536, -1.091296, 0, 1, 0.3882353, 1,
-0.1846567, -0.06819271, -1.218465, 0, 1, 0.3921569, 1,
-0.1835166, 1.051875, -0.9843014, 0, 1, 0.4, 1,
-0.1791844, 0.138831, -2.679126, 0, 1, 0.4078431, 1,
-0.1774948, -0.7816874, -3.587963, 0, 1, 0.4117647, 1,
-0.1750626, -0.7151709, -2.317263, 0, 1, 0.4196078, 1,
-0.1720643, 0.5350246, -0.2457222, 0, 1, 0.4235294, 1,
-0.1708906, -1.610273, -4.51624, 0, 1, 0.4313726, 1,
-0.1689612, -0.7511176, -3.911632, 0, 1, 0.4352941, 1,
-0.167762, -0.9023681, -3.464772, 0, 1, 0.4431373, 1,
-0.1677556, 0.6272935, 1.267011, 0, 1, 0.4470588, 1,
-0.1674047, -0.9911402, -2.01253, 0, 1, 0.454902, 1,
-0.1552745, -0.8051025, -1.596786, 0, 1, 0.4588235, 1,
-0.1537682, 0.327461, -1.079758, 0, 1, 0.4666667, 1,
-0.1512372, -0.627506, -2.310493, 0, 1, 0.4705882, 1,
-0.1498349, 0.03176101, -1.844826, 0, 1, 0.4784314, 1,
-0.1447287, 3.2638, 1.286396, 0, 1, 0.4823529, 1,
-0.1405478, 1.065858, 1.616388, 0, 1, 0.4901961, 1,
-0.1368621, -0.2059692, -1.305053, 0, 1, 0.4941176, 1,
-0.1321936, 0.1585324, 0.275891, 0, 1, 0.5019608, 1,
-0.1295781, -0.02414048, -1.304073, 0, 1, 0.509804, 1,
-0.1283806, -0.5768022, -2.763629, 0, 1, 0.5137255, 1,
-0.125681, -0.3062453, -3.087594, 0, 1, 0.5215687, 1,
-0.1248949, 1.404601, -0.4584983, 0, 1, 0.5254902, 1,
-0.1212697, 0.2635505, -1.03231, 0, 1, 0.5333334, 1,
-0.1185916, -1.001299, -3.190213, 0, 1, 0.5372549, 1,
-0.1183756, -0.8909685, -2.490803, 0, 1, 0.5450981, 1,
-0.1172346, 1.435638, 1.11177, 0, 1, 0.5490196, 1,
-0.1151619, 0.7706968, 0.6655418, 0, 1, 0.5568628, 1,
-0.1143201, 0.9649022, -0.4576021, 0, 1, 0.5607843, 1,
-0.112992, -0.4563078, -2.889346, 0, 1, 0.5686275, 1,
-0.1075066, 0.5437824, -1.153649, 0, 1, 0.572549, 1,
-0.107401, -0.3053566, -2.030621, 0, 1, 0.5803922, 1,
-0.1064528, 0.2711636, 1.239257, 0, 1, 0.5843138, 1,
-0.1052238, -0.1745352, -3.602449, 0, 1, 0.5921569, 1,
-0.1050461, 0.5068197, -0.88379, 0, 1, 0.5960785, 1,
-0.104801, 0.1427135, -0.5108747, 0, 1, 0.6039216, 1,
-0.09834775, -2.534254, -4.575115, 0, 1, 0.6117647, 1,
-0.09783261, 0.1916179, -1.962168, 0, 1, 0.6156863, 1,
-0.09329834, -0.9378988, -3.511909, 0, 1, 0.6235294, 1,
-0.09235613, -1.121203, -3.475689, 0, 1, 0.627451, 1,
-0.09109193, 1.757032, -1.075044, 0, 1, 0.6352941, 1,
-0.09107723, 0.02636429, -2.251309, 0, 1, 0.6392157, 1,
-0.08420623, -0.8603277, -2.47489, 0, 1, 0.6470588, 1,
-0.08111534, -0.3890368, -3.009398, 0, 1, 0.6509804, 1,
-0.07903297, -0.9819955, -2.546363, 0, 1, 0.6588235, 1,
-0.07577564, 0.02160525, -3.389659, 0, 1, 0.6627451, 1,
-0.07136747, 1.822374, -0.5358214, 0, 1, 0.6705883, 1,
-0.07048176, 0.358063, -2.039383, 0, 1, 0.6745098, 1,
-0.06209084, -0.2247322, -4.035386, 0, 1, 0.682353, 1,
-0.05917517, 1.305038, 0.5406141, 0, 1, 0.6862745, 1,
-0.05858593, 0.3704643, 0.6456909, 0, 1, 0.6941177, 1,
-0.05827207, 0.1154861, 0.3338909, 0, 1, 0.7019608, 1,
-0.05446797, 0.05212429, -0.3165766, 0, 1, 0.7058824, 1,
-0.04949946, 0.4474746, 0.3049397, 0, 1, 0.7137255, 1,
-0.04412701, -1.529458, -2.473846, 0, 1, 0.7176471, 1,
-0.04205086, -0.03869325, -2.218863, 0, 1, 0.7254902, 1,
-0.03863116, 0.275003, -0.0222003, 0, 1, 0.7294118, 1,
-0.03425677, -0.7704809, -3.202554, 0, 1, 0.7372549, 1,
-0.03156649, -1.070939, -3.279645, 0, 1, 0.7411765, 1,
-0.02968859, 0.7630754, -1.600848, 0, 1, 0.7490196, 1,
-0.02899983, -1.186537, -2.055626, 0, 1, 0.7529412, 1,
-0.02631168, 0.6196842, 0.2845195, 0, 1, 0.7607843, 1,
-0.02355005, -0.02781597, -2.999358, 0, 1, 0.7647059, 1,
-0.01891159, 0.5167999, -0.7112337, 0, 1, 0.772549, 1,
-0.01507963, 1.178202, 2.323791, 0, 1, 0.7764706, 1,
-0.01406025, 0.5886377, -0.153698, 0, 1, 0.7843137, 1,
-0.0139622, 0.4097401, 1.255342, 0, 1, 0.7882353, 1,
-0.01240971, 0.6036528, 0.3580279, 0, 1, 0.7960784, 1,
-0.01000651, -0.8382972, -2.742045, 0, 1, 0.8039216, 1,
-0.009678258, -0.2850636, -0.5285293, 0, 1, 0.8078431, 1,
-0.009130195, 1.15716, -0.04484675, 0, 1, 0.8156863, 1,
-0.006379943, 0.9749531, 0.7321653, 0, 1, 0.8196079, 1,
-0.005555564, 0.8227827, -1.789123, 0, 1, 0.827451, 1,
-0.002301145, -1.476161, -4.335871, 0, 1, 0.8313726, 1,
-0.0005105925, 1.894799, -0.3014102, 0, 1, 0.8392157, 1,
0.0009486521, 1.142009, -0.5064717, 0, 1, 0.8431373, 1,
0.005782953, 1.729648, -0.3652512, 0, 1, 0.8509804, 1,
0.01138516, -0.3204624, 5.006494, 0, 1, 0.854902, 1,
0.01241491, 0.413738, 0.02299396, 0, 1, 0.8627451, 1,
0.01271135, -0.9612535, 2.324983, 0, 1, 0.8666667, 1,
0.01755173, 0.797263, 1.245041, 0, 1, 0.8745098, 1,
0.01764393, -0.272997, 5.960184, 0, 1, 0.8784314, 1,
0.02003164, -1.450966, 3.143553, 0, 1, 0.8862745, 1,
0.023799, 1.841955, 0.6059757, 0, 1, 0.8901961, 1,
0.02571311, 2.00282, 1.563195, 0, 1, 0.8980392, 1,
0.026594, 0.04212508, 0.02441398, 0, 1, 0.9058824, 1,
0.02764758, -1.28471, 2.161867, 0, 1, 0.9098039, 1,
0.03288288, 1.806054, -0.9149827, 0, 1, 0.9176471, 1,
0.03468874, -0.6384013, 2.928827, 0, 1, 0.9215686, 1,
0.03518919, 0.8300953, -0.4607244, 0, 1, 0.9294118, 1,
0.03686268, -1.03897, 5.69884, 0, 1, 0.9333333, 1,
0.04302828, -0.1645392, 1.619805, 0, 1, 0.9411765, 1,
0.0436629, 0.1869872, 0.4591665, 0, 1, 0.945098, 1,
0.04384074, 0.2007172, 0.8367951, 0, 1, 0.9529412, 1,
0.04507598, -0.4278717, 3.905784, 0, 1, 0.9568627, 1,
0.04639545, -1.590696, 2.836397, 0, 1, 0.9647059, 1,
0.04855837, 0.2776397, -0.1825712, 0, 1, 0.9686275, 1,
0.054586, 0.2600574, -0.6345656, 0, 1, 0.9764706, 1,
0.0590921, 0.1936314, -0.8530088, 0, 1, 0.9803922, 1,
0.06610849, -0.002429968, 1.688384, 0, 1, 0.9882353, 1,
0.06946456, 0.7807693, -1.286698, 0, 1, 0.9921569, 1,
0.07204603, -0.3619598, 2.94549, 0, 1, 1, 1,
0.07311346, 1.290552, 0.4225403, 0, 0.9921569, 1, 1,
0.07393972, -0.7408034, 3.176815, 0, 0.9882353, 1, 1,
0.0821823, 0.8721905, 1.369387, 0, 0.9803922, 1, 1,
0.0902901, -0.5332507, 2.437977, 0, 0.9764706, 1, 1,
0.09071801, 2.421815, -1.152637, 0, 0.9686275, 1, 1,
0.095062, 0.2251814, -0.1731495, 0, 0.9647059, 1, 1,
0.09799823, -1.074894, 3.143067, 0, 0.9568627, 1, 1,
0.1006587, 1.469544, -2.507086, 0, 0.9529412, 1, 1,
0.1044998, -0.4322836, 3.028215, 0, 0.945098, 1, 1,
0.1056194, -0.4383173, 3.789168, 0, 0.9411765, 1, 1,
0.1063275, -0.9624697, 1.700545, 0, 0.9333333, 1, 1,
0.1087963, 0.7325335, 0.717418, 0, 0.9294118, 1, 1,
0.1105618, 0.6461402, -0.1984475, 0, 0.9215686, 1, 1,
0.1126154, -0.2709343, 2.030172, 0, 0.9176471, 1, 1,
0.1141594, -0.5302128, 2.221752, 0, 0.9098039, 1, 1,
0.1157472, 0.4115804, -0.08964749, 0, 0.9058824, 1, 1,
0.1198632, 0.08153563, 0.8631701, 0, 0.8980392, 1, 1,
0.1206738, -0.2700897, 2.219899, 0, 0.8901961, 1, 1,
0.1216086, -1.79667, 3.97128, 0, 0.8862745, 1, 1,
0.1299802, -0.06152491, 2.515722, 0, 0.8784314, 1, 1,
0.1300733, -2.369609, 4.831275, 0, 0.8745098, 1, 1,
0.1331058, -1.213935, 4.557231, 0, 0.8666667, 1, 1,
0.1331126, -0.8656258, 1.877499, 0, 0.8627451, 1, 1,
0.1358344, -0.6117471, 1.789409, 0, 0.854902, 1, 1,
0.1380701, 0.4083637, 1.487331, 0, 0.8509804, 1, 1,
0.1417932, -0.8132949, 2.553611, 0, 0.8431373, 1, 1,
0.1476108, 0.9536971, 0.7309479, 0, 0.8392157, 1, 1,
0.1505887, -2.14891, 2.810922, 0, 0.8313726, 1, 1,
0.1532746, -0.3758162, 4.663193, 0, 0.827451, 1, 1,
0.1587562, -0.703216, 3.936208, 0, 0.8196079, 1, 1,
0.1595763, -0.5282108, 3.554191, 0, 0.8156863, 1, 1,
0.1596011, -0.8997459, 3.539951, 0, 0.8078431, 1, 1,
0.159621, -0.3417328, 2.385819, 0, 0.8039216, 1, 1,
0.1607572, -0.1342724, 2.716697, 0, 0.7960784, 1, 1,
0.1616474, 0.3300629, 0.56475, 0, 0.7882353, 1, 1,
0.163491, -0.2167335, 1.988542, 0, 0.7843137, 1, 1,
0.1645308, -1.314728, 2.027142, 0, 0.7764706, 1, 1,
0.1670149, -1.078301, 3.348025, 0, 0.772549, 1, 1,
0.1690435, -0.9091395, 2.793099, 0, 0.7647059, 1, 1,
0.1713498, -0.4644533, 2.96844, 0, 0.7607843, 1, 1,
0.17271, 0.9129808, -0.5533305, 0, 0.7529412, 1, 1,
0.1730674, 0.1625578, 2.672052, 0, 0.7490196, 1, 1,
0.1752311, 0.2395558, 0.5355501, 0, 0.7411765, 1, 1,
0.1759915, 0.703721, 0.6700569, 0, 0.7372549, 1, 1,
0.1776635, -0.8076054, 3.651569, 0, 0.7294118, 1, 1,
0.1843677, -0.160414, 3.319981, 0, 0.7254902, 1, 1,
0.1844297, -0.8909541, 2.22725, 0, 0.7176471, 1, 1,
0.1889839, 1.02243, -0.5781825, 0, 0.7137255, 1, 1,
0.1908445, 0.5775864, 2.08276, 0, 0.7058824, 1, 1,
0.1943347, -0.5994877, 3.243387, 0, 0.6980392, 1, 1,
0.2019346, 1.396112, -0.3465233, 0, 0.6941177, 1, 1,
0.2032265, 0.1025584, 1.121877, 0, 0.6862745, 1, 1,
0.2096598, 1.359393, 0.8342293, 0, 0.682353, 1, 1,
0.2211432, 0.511444, -0.2794811, 0, 0.6745098, 1, 1,
0.2223946, -0.4912257, 1.741452, 0, 0.6705883, 1, 1,
0.2226266, 1.354067, 2.397477, 0, 0.6627451, 1, 1,
0.2235825, -0.4559577, 3.999563, 0, 0.6588235, 1, 1,
0.2253232, -0.5410234, 3.751366, 0, 0.6509804, 1, 1,
0.2277914, -0.9374211, 1.482571, 0, 0.6470588, 1, 1,
0.2301548, -0.315756, 3.425112, 0, 0.6392157, 1, 1,
0.2334245, -0.4584256, 4.327967, 0, 0.6352941, 1, 1,
0.2338571, 0.06091736, 0.752512, 0, 0.627451, 1, 1,
0.2428127, 0.0317625, 1.729198, 0, 0.6235294, 1, 1,
0.2477466, -1.820754, 2.657749, 0, 0.6156863, 1, 1,
0.2485986, -3.984143, 5.246678, 0, 0.6117647, 1, 1,
0.250812, -0.9866184, 2.381531, 0, 0.6039216, 1, 1,
0.2562695, -0.2940901, 2.825763, 0, 0.5960785, 1, 1,
0.2580227, -0.2357621, 0.2387139, 0, 0.5921569, 1, 1,
0.2584476, 0.5769745, 0.1475982, 0, 0.5843138, 1, 1,
0.261292, -0.007589955, 0.004198933, 0, 0.5803922, 1, 1,
0.2657915, -0.3110375, 2.327875, 0, 0.572549, 1, 1,
0.2684464, -0.3284478, 2.550432, 0, 0.5686275, 1, 1,
0.2690019, -0.3130389, 2.39491, 0, 0.5607843, 1, 1,
0.2713805, 0.8399563, 0.5621204, 0, 0.5568628, 1, 1,
0.2742782, -2.184982, 2.574119, 0, 0.5490196, 1, 1,
0.280184, 1.073826, -1.116873, 0, 0.5450981, 1, 1,
0.2802168, -0.9400712, 4.064263, 0, 0.5372549, 1, 1,
0.2842354, -0.3749122, 2.140139, 0, 0.5333334, 1, 1,
0.2849781, -0.7257191, 2.73754, 0, 0.5254902, 1, 1,
0.2857498, -0.3659281, 1.479483, 0, 0.5215687, 1, 1,
0.2863191, -1.600066, 2.762918, 0, 0.5137255, 1, 1,
0.287385, 1.704199, 0.5007436, 0, 0.509804, 1, 1,
0.289316, -0.5149749, 3.816884, 0, 0.5019608, 1, 1,
0.2896467, -2.822736, 1.867766, 0, 0.4941176, 1, 1,
0.2903647, -0.7441967, 2.196169, 0, 0.4901961, 1, 1,
0.2911539, -0.5523586, 2.782845, 0, 0.4823529, 1, 1,
0.2982838, -2.339947, 1.946845, 0, 0.4784314, 1, 1,
0.3015375, -0.2106972, 3.540305, 0, 0.4705882, 1, 1,
0.3039646, 0.8284725, -1.415575, 0, 0.4666667, 1, 1,
0.3056023, 0.4224075, 0.7021424, 0, 0.4588235, 1, 1,
0.3065403, -1.562916, 2.686398, 0, 0.454902, 1, 1,
0.3087919, 0.1497981, 1.606291, 0, 0.4470588, 1, 1,
0.3107902, 0.6925769, -0.2118557, 0, 0.4431373, 1, 1,
0.3151111, 0.1617826, 2.455222, 0, 0.4352941, 1, 1,
0.3165904, -0.1425783, 1.187723, 0, 0.4313726, 1, 1,
0.3180636, 1.576168, -2.038123, 0, 0.4235294, 1, 1,
0.3191189, -0.03035967, 2.342886, 0, 0.4196078, 1, 1,
0.3191703, 0.1537843, 1.193954, 0, 0.4117647, 1, 1,
0.3216113, -0.701164, 3.786922, 0, 0.4078431, 1, 1,
0.3231953, -0.2250361, 1.833429, 0, 0.4, 1, 1,
0.3243506, 0.1111605, -0.1215399, 0, 0.3921569, 1, 1,
0.3300776, -0.5149654, 2.749745, 0, 0.3882353, 1, 1,
0.3302991, 1.574893, -1.09009, 0, 0.3803922, 1, 1,
0.3322947, -0.2153653, 1.56553, 0, 0.3764706, 1, 1,
0.3370253, 0.2110231, -1.196158, 0, 0.3686275, 1, 1,
0.3376015, -0.2460234, 2.158428, 0, 0.3647059, 1, 1,
0.3382472, 0.4851755, 0.5742903, 0, 0.3568628, 1, 1,
0.3416905, -0.3834208, 1.979648, 0, 0.3529412, 1, 1,
0.3429648, -1.517797, 4.221875, 0, 0.345098, 1, 1,
0.3486063, -0.5765314, 0.7890642, 0, 0.3411765, 1, 1,
0.3553225, -0.5863745, 2.881632, 0, 0.3333333, 1, 1,
0.3582606, 0.4366706, 0.7713951, 0, 0.3294118, 1, 1,
0.3639468, -0.09066502, 2.057614, 0, 0.3215686, 1, 1,
0.3647989, -0.2351177, 0.7349615, 0, 0.3176471, 1, 1,
0.3677357, -0.1536752, 1.363559, 0, 0.3098039, 1, 1,
0.3679209, -0.728159, 4.661166, 0, 0.3058824, 1, 1,
0.3691489, -0.5687187, 2.593764, 0, 0.2980392, 1, 1,
0.3708947, -0.2871233, 0.1623287, 0, 0.2901961, 1, 1,
0.3724987, -0.2128438, 2.977851, 0, 0.2862745, 1, 1,
0.3742993, -1.580468, 3.189566, 0, 0.2784314, 1, 1,
0.3745362, 0.6478648, -0.3560164, 0, 0.2745098, 1, 1,
0.3794093, 1.712276, 0.7722727, 0, 0.2666667, 1, 1,
0.3794143, 0.7866415, 0.7415159, 0, 0.2627451, 1, 1,
0.3825426, 1.128614, 1.275733, 0, 0.254902, 1, 1,
0.3868836, -1.475958, 4.251763, 0, 0.2509804, 1, 1,
0.3912718, -0.09180765, 0.2280772, 0, 0.2431373, 1, 1,
0.3912759, -0.3633364, 0.9950551, 0, 0.2392157, 1, 1,
0.39444, 1.388643, -1.029243, 0, 0.2313726, 1, 1,
0.4033333, 0.4019365, 0.4971873, 0, 0.227451, 1, 1,
0.4034849, -0.743534, 3.498921, 0, 0.2196078, 1, 1,
0.4036686, -0.5787643, 1.959447, 0, 0.2156863, 1, 1,
0.4054097, -0.1591411, 4.805234, 0, 0.2078431, 1, 1,
0.4064009, 0.3901658, 0.2676557, 0, 0.2039216, 1, 1,
0.4080944, -0.3014339, 1.724707, 0, 0.1960784, 1, 1,
0.4129312, -0.8283955, 3.217176, 0, 0.1882353, 1, 1,
0.415934, -1.648737, 3.244037, 0, 0.1843137, 1, 1,
0.4162735, 0.1620906, 2.010347, 0, 0.1764706, 1, 1,
0.4199621, 1.495386, 0.3388759, 0, 0.172549, 1, 1,
0.4199787, -0.8125407, 2.704254, 0, 0.1647059, 1, 1,
0.4247873, 0.2097313, 1.195492, 0, 0.1607843, 1, 1,
0.4273109, 1.601008, -1.772894, 0, 0.1529412, 1, 1,
0.4298345, -1.391612, 1.187496, 0, 0.1490196, 1, 1,
0.432585, 0.01673339, 2.385469, 0, 0.1411765, 1, 1,
0.4367999, -0.8293145, 0.353986, 0, 0.1372549, 1, 1,
0.4374576, -0.6091441, 3.257122, 0, 0.1294118, 1, 1,
0.4418132, 2.203187, 1.936477, 0, 0.1254902, 1, 1,
0.4460877, 0.9227261, 0.4533001, 0, 0.1176471, 1, 1,
0.4469703, -1.323091, 1.10386, 0, 0.1137255, 1, 1,
0.4486583, -1.675877, 0.9650487, 0, 0.1058824, 1, 1,
0.4498859, 0.6764364, 2.336447, 0, 0.09803922, 1, 1,
0.4515857, -1.081766, 3.898474, 0, 0.09411765, 1, 1,
0.4597363, 0.6074648, 1.699746, 0, 0.08627451, 1, 1,
0.4641978, -0.4022015, 0.4869029, 0, 0.08235294, 1, 1,
0.4703679, -0.4251527, 3.255427, 0, 0.07450981, 1, 1,
0.471671, 1.724324, -0.6644922, 0, 0.07058824, 1, 1,
0.4731627, -0.343103, 1.631183, 0, 0.0627451, 1, 1,
0.4819106, 0.7371582, -1.200835, 0, 0.05882353, 1, 1,
0.4902829, -0.5952173, 2.485289, 0, 0.05098039, 1, 1,
0.4909653, 0.4198208, 2.051195, 0, 0.04705882, 1, 1,
0.4972203, 0.5859526, 1.014532, 0, 0.03921569, 1, 1,
0.4989213, 1.475644, 0.9125705, 0, 0.03529412, 1, 1,
0.4996195, 0.5959452, 0.575763, 0, 0.02745098, 1, 1,
0.5021138, -0.6341245, 1.555631, 0, 0.02352941, 1, 1,
0.5025514, 1.328086, 0.3623288, 0, 0.01568628, 1, 1,
0.5025969, -2.065551, 3.071219, 0, 0.01176471, 1, 1,
0.5037919, 0.1732098, 0.9741569, 0, 0.003921569, 1, 1,
0.5047876, 0.9494157, -0.4971771, 0.003921569, 0, 1, 1,
0.515579, -0.4270489, 2.371228, 0.007843138, 0, 1, 1,
0.5215677, -0.5279531, 2.122711, 0.01568628, 0, 1, 1,
0.52193, -0.01297053, 2.259788, 0.01960784, 0, 1, 1,
0.5232882, -0.4328808, 2.99804, 0.02745098, 0, 1, 1,
0.5234961, -0.5167146, 2.582228, 0.03137255, 0, 1, 1,
0.5236667, -0.2459726, 1.618366, 0.03921569, 0, 1, 1,
0.5316308, 1.005131, 0.6150405, 0.04313726, 0, 1, 1,
0.5353519, -2.313035, 4.011192, 0.05098039, 0, 1, 1,
0.5372512, 0.04053601, 1.588797, 0.05490196, 0, 1, 1,
0.5407068, -0.6678641, 0.8879505, 0.0627451, 0, 1, 1,
0.5434744, -0.2597378, 1.269901, 0.06666667, 0, 1, 1,
0.5470793, 1.175551, 1.29156, 0.07450981, 0, 1, 1,
0.5480332, -0.09006491, 2.136857, 0.07843138, 0, 1, 1,
0.5482182, 1.713821, 0.6180379, 0.08627451, 0, 1, 1,
0.5496792, -0.106723, 2.24141, 0.09019608, 0, 1, 1,
0.5540352, -0.6246418, 0.9466078, 0.09803922, 0, 1, 1,
0.5546266, 2.324711, 0.4550956, 0.1058824, 0, 1, 1,
0.55484, -0.6208905, 3.859115, 0.1098039, 0, 1, 1,
0.5579236, -1.702961, 3.561902, 0.1176471, 0, 1, 1,
0.560306, -0.349575, 3.127733, 0.1215686, 0, 1, 1,
0.5640948, 0.01211005, 1.245352, 0.1294118, 0, 1, 1,
0.5658203, -0.2199117, 0.09768225, 0.1333333, 0, 1, 1,
0.5674171, 0.1769547, 1.815252, 0.1411765, 0, 1, 1,
0.5675297, 0.1286261, 0.6872774, 0.145098, 0, 1, 1,
0.5679148, -1.017447, 2.671722, 0.1529412, 0, 1, 1,
0.5773117, 0.02305974, 1.456259, 0.1568628, 0, 1, 1,
0.5786983, 0.9296049, 0.7123947, 0.1647059, 0, 1, 1,
0.5802785, -0.5484928, 2.697683, 0.1686275, 0, 1, 1,
0.5809713, 1.129747, 2.217987, 0.1764706, 0, 1, 1,
0.5822023, -0.9181755, 2.610233, 0.1803922, 0, 1, 1,
0.5853418, -0.8566891, 2.785504, 0.1882353, 0, 1, 1,
0.5862591, -0.2653241, 3.624096, 0.1921569, 0, 1, 1,
0.586378, 0.2905846, 1.409068, 0.2, 0, 1, 1,
0.586718, 2.015625, 0.6677753, 0.2078431, 0, 1, 1,
0.5892171, 0.0924583, 0.7315882, 0.2117647, 0, 1, 1,
0.5963632, 0.01812067, 1.472863, 0.2196078, 0, 1, 1,
0.5987347, 1.477293, -0.3838758, 0.2235294, 0, 1, 1,
0.5993371, 0.6630286, 3.320447, 0.2313726, 0, 1, 1,
0.6003797, -0.07855559, 1.873143, 0.2352941, 0, 1, 1,
0.6032687, -0.02475409, 1.751178, 0.2431373, 0, 1, 1,
0.6036044, 0.4062243, 1.519945, 0.2470588, 0, 1, 1,
0.6062237, -0.2605562, 1.808956, 0.254902, 0, 1, 1,
0.6071252, -0.0869554, 2.980408, 0.2588235, 0, 1, 1,
0.6106312, 0.488947, 0.6665906, 0.2666667, 0, 1, 1,
0.6170362, -0.2697928, 2.019748, 0.2705882, 0, 1, 1,
0.6181888, -0.3082458, 1.064589, 0.2784314, 0, 1, 1,
0.6272526, 0.5633845, 1.375353, 0.282353, 0, 1, 1,
0.6301161, 0.5046001, 1.409266, 0.2901961, 0, 1, 1,
0.6378641, -0.6077387, 3.285303, 0.2941177, 0, 1, 1,
0.6383899, -0.3533805, 1.42219, 0.3019608, 0, 1, 1,
0.6384338, 0.6826558, 0.6576129, 0.3098039, 0, 1, 1,
0.6396939, 0.2034086, 1.844973, 0.3137255, 0, 1, 1,
0.6454905, -0.5823915, 2.215371, 0.3215686, 0, 1, 1,
0.650892, 0.04567108, 1.325936, 0.3254902, 0, 1, 1,
0.6523786, 2.563078, 1.19769, 0.3333333, 0, 1, 1,
0.6527337, 0.8280753, -0.1362232, 0.3372549, 0, 1, 1,
0.6528293, 0.2300049, -0.100078, 0.345098, 0, 1, 1,
0.6531512, -0.2397544, 1.190024, 0.3490196, 0, 1, 1,
0.6560552, -0.498341, 3.44965, 0.3568628, 0, 1, 1,
0.6561803, -0.2185151, 1.366904, 0.3607843, 0, 1, 1,
0.6596032, -1.725699, 3.608162, 0.3686275, 0, 1, 1,
0.6612285, 1.092768, 0.4238789, 0.372549, 0, 1, 1,
0.6634097, 1.852277, -0.8784845, 0.3803922, 0, 1, 1,
0.6654912, 0.2353591, 0.7892034, 0.3843137, 0, 1, 1,
0.6732517, 2.587671, 1.802654, 0.3921569, 0, 1, 1,
0.6762192, -1.514245, 4.292653, 0.3960784, 0, 1, 1,
0.6796243, -1.265917, 2.060888, 0.4039216, 0, 1, 1,
0.6820946, 0.8080778, 1.281685, 0.4117647, 0, 1, 1,
0.6906081, -0.5974558, 2.795873, 0.4156863, 0, 1, 1,
0.6912428, -0.4882976, 3.980468, 0.4235294, 0, 1, 1,
0.6918122, -0.2158985, 0.7958096, 0.427451, 0, 1, 1,
0.6962785, 0.1438125, 1.273488, 0.4352941, 0, 1, 1,
0.6991646, 0.0124195, -0.5611175, 0.4392157, 0, 1, 1,
0.7004318, -0.4717076, 2.379931, 0.4470588, 0, 1, 1,
0.7030643, -0.1642697, 2.412772, 0.4509804, 0, 1, 1,
0.7052188, 0.555833, 1.052671, 0.4588235, 0, 1, 1,
0.7108619, 0.9652707, 0.2663396, 0.4627451, 0, 1, 1,
0.7111346, 0.3742951, 0.709361, 0.4705882, 0, 1, 1,
0.7130553, 3.0245, 0.01021494, 0.4745098, 0, 1, 1,
0.7133068, -0.329151, 2.897722, 0.4823529, 0, 1, 1,
0.7245833, -0.1647693, 3.608201, 0.4862745, 0, 1, 1,
0.7285793, 0.03673543, 0.9078539, 0.4941176, 0, 1, 1,
0.7415236, -0.5145944, 2.07972, 0.5019608, 0, 1, 1,
0.7441916, 0.8340534, 0.9989865, 0.5058824, 0, 1, 1,
0.744234, -3.073887, 3.076146, 0.5137255, 0, 1, 1,
0.7469962, 0.7030423, 2.009881, 0.5176471, 0, 1, 1,
0.7479713, 0.3822234, 1.246165, 0.5254902, 0, 1, 1,
0.7489373, -0.2013987, 2.667167, 0.5294118, 0, 1, 1,
0.753575, 1.099862, 0.0564689, 0.5372549, 0, 1, 1,
0.75789, -2.124605, 3.820962, 0.5411765, 0, 1, 1,
0.758274, -0.5039107, 2.05576, 0.5490196, 0, 1, 1,
0.7592684, -1.172775, 1.277888, 0.5529412, 0, 1, 1,
0.764917, -1.055189, 2.072474, 0.5607843, 0, 1, 1,
0.7717127, 0.8831874, -0.5925041, 0.5647059, 0, 1, 1,
0.7805748, -0.3572171, 3.589582, 0.572549, 0, 1, 1,
0.7871668, 0.9425582, 0.6463767, 0.5764706, 0, 1, 1,
0.787782, 2.225583, -0.5157094, 0.5843138, 0, 1, 1,
0.7959755, 0.5628352, 0.483959, 0.5882353, 0, 1, 1,
0.7962999, -1.519534, 2.81737, 0.5960785, 0, 1, 1,
0.7990717, -0.2034371, 3.59683, 0.6039216, 0, 1, 1,
0.8029086, -1.033299, 2.974351, 0.6078432, 0, 1, 1,
0.8080929, -2.342139, 0.2803217, 0.6156863, 0, 1, 1,
0.8141397, -1.635124, 2.290405, 0.6196079, 0, 1, 1,
0.8191007, 0.5396316, 2.40528, 0.627451, 0, 1, 1,
0.8274915, 0.7990779, -0.4691775, 0.6313726, 0, 1, 1,
0.8337313, 1.07163, 1.75576, 0.6392157, 0, 1, 1,
0.8342234, -0.144285, 1.657597, 0.6431373, 0, 1, 1,
0.8345831, -0.6711827, 2.207886, 0.6509804, 0, 1, 1,
0.8442655, 1.549134, -0.63689, 0.654902, 0, 1, 1,
0.8469697, 1.254803, -0.5873414, 0.6627451, 0, 1, 1,
0.8522509, 0.05919287, 2.288692, 0.6666667, 0, 1, 1,
0.8550003, 0.4784497, 1.815451, 0.6745098, 0, 1, 1,
0.8551379, -0.7744427, 2.113547, 0.6784314, 0, 1, 1,
0.859004, 1.269591, 0.4967371, 0.6862745, 0, 1, 1,
0.8625655, 1.400335, 1.288366, 0.6901961, 0, 1, 1,
0.8650958, 0.3646915, -0.2286325, 0.6980392, 0, 1, 1,
0.8685293, 0.2318061, 2.393431, 0.7058824, 0, 1, 1,
0.8711261, -2.307386, 2.558375, 0.7098039, 0, 1, 1,
0.8856798, -0.1945267, 1.851234, 0.7176471, 0, 1, 1,
0.8866564, -0.172653, 0.142028, 0.7215686, 0, 1, 1,
0.8869846, -1.385977, 4.30478, 0.7294118, 0, 1, 1,
0.9049053, -0.2405263, 2.89823, 0.7333333, 0, 1, 1,
0.9057429, 0.007379485, 3.201699, 0.7411765, 0, 1, 1,
0.909047, -1.025507, 1.961309, 0.7450981, 0, 1, 1,
0.9101401, -0.1966708, 3.223106, 0.7529412, 0, 1, 1,
0.9109074, -0.1546251, 2.296257, 0.7568628, 0, 1, 1,
0.9130918, -1.236317, 1.064526, 0.7647059, 0, 1, 1,
0.917506, -0.5027416, 3.129115, 0.7686275, 0, 1, 1,
0.9182722, 1.472973, 1.190709, 0.7764706, 0, 1, 1,
0.9212027, 0.2600277, 0.9177028, 0.7803922, 0, 1, 1,
0.9229091, 1.04298, -0.01545187, 0.7882353, 0, 1, 1,
0.9244263, 0.6535655, 1.800028, 0.7921569, 0, 1, 1,
0.9250965, 0.1005115, 0.9623791, 0.8, 0, 1, 1,
0.9263448, -0.8319015, 1.691793, 0.8078431, 0, 1, 1,
0.9266637, 2.641914, 0.2618177, 0.8117647, 0, 1, 1,
0.9408208, 0.2267047, 2.217176, 0.8196079, 0, 1, 1,
0.949573, 0.8479738, 1.218542, 0.8235294, 0, 1, 1,
0.9516904, 0.1961945, 1.674869, 0.8313726, 0, 1, 1,
0.9608452, -1.5775, 2.473513, 0.8352941, 0, 1, 1,
0.9617177, -1.251727, 4.915816, 0.8431373, 0, 1, 1,
0.9623471, 0.3177649, 2.217297, 0.8470588, 0, 1, 1,
0.9633524, -0.2707441, 2.903875, 0.854902, 0, 1, 1,
0.9667153, -0.3735329, 2.132722, 0.8588235, 0, 1, 1,
0.9671484, 0.3034883, 1.386024, 0.8666667, 0, 1, 1,
0.9677408, -0.5530042, 1.955261, 0.8705882, 0, 1, 1,
0.9694698, 0.2042423, 1.675386, 0.8784314, 0, 1, 1,
0.9753417, -1.765569, 3.706157, 0.8823529, 0, 1, 1,
0.9762048, -0.313327, 2.734049, 0.8901961, 0, 1, 1,
0.9778191, 0.3693742, -0.6356771, 0.8941177, 0, 1, 1,
0.9783332, -1.464798, 4.32543, 0.9019608, 0, 1, 1,
0.9862944, 1.354279, -0.4396063, 0.9098039, 0, 1, 1,
0.9896992, 0.02742619, 2.851294, 0.9137255, 0, 1, 1,
0.9905687, -1.485197, 1.899071, 0.9215686, 0, 1, 1,
0.9946157, 0.03486976, 1.064484, 0.9254902, 0, 1, 1,
0.9967558, -0.775706, 1.72064, 0.9333333, 0, 1, 1,
1.000443, 1.538127, 1.003274, 0.9372549, 0, 1, 1,
1.004212, -0.9438722, 3.229817, 0.945098, 0, 1, 1,
1.005676, -0.3170719, 3.348439, 0.9490196, 0, 1, 1,
1.00671, -0.5781505, 3.154882, 0.9568627, 0, 1, 1,
1.009186, -0.06847816, -0.01126064, 0.9607843, 0, 1, 1,
1.011032, 0.45107, 1.441242, 0.9686275, 0, 1, 1,
1.012895, -1.056456, 2.136283, 0.972549, 0, 1, 1,
1.014638, -0.265734, -0.6016622, 0.9803922, 0, 1, 1,
1.026213, -0.3213767, 1.909843, 0.9843137, 0, 1, 1,
1.029206, 0.07351986, 2.504039, 0.9921569, 0, 1, 1,
1.035953, -0.09090474, 0.3739079, 0.9960784, 0, 1, 1,
1.037403, -1.537748, 3.884135, 1, 0, 0.9960784, 1,
1.048646, 0.4164245, 1.340466, 1, 0, 0.9882353, 1,
1.049958, 2.313782, -0.03582814, 1, 0, 0.9843137, 1,
1.058997, -1.484576, 2.71133, 1, 0, 0.9764706, 1,
1.064551, 1.186584, -0.4935545, 1, 0, 0.972549, 1,
1.066161, -1.256695, 2.115984, 1, 0, 0.9647059, 1,
1.067328, 2.973505, -0.007366505, 1, 0, 0.9607843, 1,
1.07782, -1.590013, 1.620185, 1, 0, 0.9529412, 1,
1.080352, -0.8128766, 2.567773, 1, 0, 0.9490196, 1,
1.091536, 0.9108094, 1.586048, 1, 0, 0.9411765, 1,
1.094022, 0.9446907, 1.337584, 1, 0, 0.9372549, 1,
1.100454, 2.060121, 1.055535, 1, 0, 0.9294118, 1,
1.104027, 1.14449, -0.8705021, 1, 0, 0.9254902, 1,
1.109789, -0.1818273, 1.546829, 1, 0, 0.9176471, 1,
1.120578, 1.444343, 0.40258, 1, 0, 0.9137255, 1,
1.121193, -0.9861958, 1.529368, 1, 0, 0.9058824, 1,
1.122421, -0.5358922, 2.298315, 1, 0, 0.9019608, 1,
1.125141, 1.164383, 0.3709658, 1, 0, 0.8941177, 1,
1.125656, 0.3529637, 2.105143, 1, 0, 0.8862745, 1,
1.168688, -0.01527942, 2.377187, 1, 0, 0.8823529, 1,
1.169883, -0.1455842, 1.34955, 1, 0, 0.8745098, 1,
1.170308, 0.4470595, -0.486952, 1, 0, 0.8705882, 1,
1.181676, -1.503092, 1.076336, 1, 0, 0.8627451, 1,
1.191167, -0.8006982, 1.968603, 1, 0, 0.8588235, 1,
1.200627, -2.797088, 4.064457, 1, 0, 0.8509804, 1,
1.210782, 1.313227, 0.2281927, 1, 0, 0.8470588, 1,
1.212854, 0.1797114, 0.01277108, 1, 0, 0.8392157, 1,
1.236675, 0.7756788, -0.1354616, 1, 0, 0.8352941, 1,
1.245352, 0.3010614, 1.294768, 1, 0, 0.827451, 1,
1.270956, -1.735212, 2.44623, 1, 0, 0.8235294, 1,
1.274893, -1.052069, 1.790956, 1, 0, 0.8156863, 1,
1.28112, 1.083698, 0.6115059, 1, 0, 0.8117647, 1,
1.29748, 1.497144, -0.1404222, 1, 0, 0.8039216, 1,
1.298368, 0.5907325, -0.02745683, 1, 0, 0.7960784, 1,
1.301859, -0.4337253, 2.374596, 1, 0, 0.7921569, 1,
1.308954, -0.5208908, 1.278485, 1, 0, 0.7843137, 1,
1.310785, 0.5885949, 0.8426536, 1, 0, 0.7803922, 1,
1.321485, 0.2925538, 2.348504, 1, 0, 0.772549, 1,
1.327219, 0.6209308, 1.852254, 1, 0, 0.7686275, 1,
1.327937, -0.6576591, 3.05803, 1, 0, 0.7607843, 1,
1.330349, 2.411891, 0.9998809, 1, 0, 0.7568628, 1,
1.331109, 1.286111, 2.335255, 1, 0, 0.7490196, 1,
1.331265, 0.476191, 2.167887, 1, 0, 0.7450981, 1,
1.334733, -0.01566327, 1.242571, 1, 0, 0.7372549, 1,
1.336017, -0.9319474, 1.550425, 1, 0, 0.7333333, 1,
1.345413, -0.6144186, 0.2513492, 1, 0, 0.7254902, 1,
1.352377, -1.313499, 0.05357613, 1, 0, 0.7215686, 1,
1.358238, -0.2589503, 1.585544, 1, 0, 0.7137255, 1,
1.359796, 0.6426157, 1.563678, 1, 0, 0.7098039, 1,
1.362299, 0.4309022, 1.733851, 1, 0, 0.7019608, 1,
1.36243, -1.933833, 2.833753, 1, 0, 0.6941177, 1,
1.369548, 0.5705547, 0.3558347, 1, 0, 0.6901961, 1,
1.370272, -1.09855, 2.335831, 1, 0, 0.682353, 1,
1.377795, 0.09869443, 0.633025, 1, 0, 0.6784314, 1,
1.383495, -0.4818506, 1.553964, 1, 0, 0.6705883, 1,
1.384205, -0.5378591, -0.1957343, 1, 0, 0.6666667, 1,
1.389908, -1.111481, 2.990832, 1, 0, 0.6588235, 1,
1.398181, 0.1039549, 2.60976, 1, 0, 0.654902, 1,
1.406493, 0.1734955, 0.9828065, 1, 0, 0.6470588, 1,
1.409471, -2.344875, 3.532931, 1, 0, 0.6431373, 1,
1.410152, -1.754908, 2.48189, 1, 0, 0.6352941, 1,
1.410506, -0.4054531, 3.171761, 1, 0, 0.6313726, 1,
1.4266, 0.1985507, 0.2185033, 1, 0, 0.6235294, 1,
1.436851, 0.04738259, 3.508778, 1, 0, 0.6196079, 1,
1.44737, 0.4104694, 1.986235, 1, 0, 0.6117647, 1,
1.447397, 0.4798077, 2.005041, 1, 0, 0.6078432, 1,
1.447711, 0.3601434, 1.77224, 1, 0, 0.6, 1,
1.458192, 0.0333472, 0.8859729, 1, 0, 0.5921569, 1,
1.475705, 0.5510591, 0.2355688, 1, 0, 0.5882353, 1,
1.496631, -0.05616545, 1.372421, 1, 0, 0.5803922, 1,
1.49765, -0.6753663, 1.683458, 1, 0, 0.5764706, 1,
1.513011, 1.070826, 1.349606, 1, 0, 0.5686275, 1,
1.514329, 1.269782, -0.8566646, 1, 0, 0.5647059, 1,
1.517355, -0.5247136, 2.552823, 1, 0, 0.5568628, 1,
1.517536, -0.2192617, 2.33283, 1, 0, 0.5529412, 1,
1.533114, 0.6782547, 0.7580935, 1, 0, 0.5450981, 1,
1.534122, -1.210839, 1.554577, 1, 0, 0.5411765, 1,
1.547893, -1.171344, 1.57536, 1, 0, 0.5333334, 1,
1.559246, 1.614881, 0.3963778, 1, 0, 0.5294118, 1,
1.568454, -1.537462, 3.272511, 1, 0, 0.5215687, 1,
1.574699, 1.9477, 0.2528097, 1, 0, 0.5176471, 1,
1.578258, -1.209659, 0.05266335, 1, 0, 0.509804, 1,
1.579664, -0.03320876, 0.5889501, 1, 0, 0.5058824, 1,
1.581602, 0.3114156, 0.6475021, 1, 0, 0.4980392, 1,
1.582307, -1.219974, 2.188959, 1, 0, 0.4901961, 1,
1.598807, -0.538124, 3.386836, 1, 0, 0.4862745, 1,
1.607636, -1.057586, 0.7807734, 1, 0, 0.4784314, 1,
1.627101, -1.168741, 2.745561, 1, 0, 0.4745098, 1,
1.633186, -3.004781, 3.132103, 1, 0, 0.4666667, 1,
1.636613, -1.725041, 3.882321, 1, 0, 0.4627451, 1,
1.652305, -0.1612635, 4.077569, 1, 0, 0.454902, 1,
1.658399, 0.8841036, 0.2776144, 1, 0, 0.4509804, 1,
1.669031, 0.6545982, 1.199866, 1, 0, 0.4431373, 1,
1.672896, 0.6122081, 2.258169, 1, 0, 0.4392157, 1,
1.673377, -0.1035535, 1.905814, 1, 0, 0.4313726, 1,
1.674991, -0.2453998, 4.061238, 1, 0, 0.427451, 1,
1.680671, -0.5691327, 2.29203, 1, 0, 0.4196078, 1,
1.680908, -0.5303254, 2.818782, 1, 0, 0.4156863, 1,
1.692175, 2.070899, 2.254147, 1, 0, 0.4078431, 1,
1.695665, -0.3622897, 1.726353, 1, 0, 0.4039216, 1,
1.709929, -0.7344185, 2.561234, 1, 0, 0.3960784, 1,
1.714549, 0.7531688, 0.8634331, 1, 0, 0.3882353, 1,
1.734045, 0.9566432, -0.5251215, 1, 0, 0.3843137, 1,
1.736207, -0.1283837, 0.2063089, 1, 0, 0.3764706, 1,
1.753649, 1.968646, 0.7920501, 1, 0, 0.372549, 1,
1.755234, -0.3418131, 1.16754, 1, 0, 0.3647059, 1,
1.758651, -0.4088586, 2.415912, 1, 0, 0.3607843, 1,
1.76005, -1.262213, 1.256148, 1, 0, 0.3529412, 1,
1.765012, 0.753727, 1.31253, 1, 0, 0.3490196, 1,
1.766171, -0.7337952, 2.687993, 1, 0, 0.3411765, 1,
1.773238, 1.152477, -0.2610688, 1, 0, 0.3372549, 1,
1.775163, 1.126713, 0.526555, 1, 0, 0.3294118, 1,
1.77582, 0.9143285, -0.2471161, 1, 0, 0.3254902, 1,
1.78512, 0.4631207, 3.067916, 1, 0, 0.3176471, 1,
1.786413, 0.5023714, 0.6995366, 1, 0, 0.3137255, 1,
1.798259, 1.96608, 0.2158843, 1, 0, 0.3058824, 1,
1.800955, -0.3934329, 2.462193, 1, 0, 0.2980392, 1,
1.812226, -1.464104, 3.313331, 1, 0, 0.2941177, 1,
1.838363, -0.5807567, 1.329546, 1, 0, 0.2862745, 1,
1.845766, -0.1322241, 1.423769, 1, 0, 0.282353, 1,
1.852705, -0.1909676, 1.970276, 1, 0, 0.2745098, 1,
1.856151, -1.736809, 3.266611, 1, 0, 0.2705882, 1,
1.860682, 0.808692, 1.525877, 1, 0, 0.2627451, 1,
1.871015, 1.682487, -0.02889319, 1, 0, 0.2588235, 1,
1.884791, -0.1821106, 2.724689, 1, 0, 0.2509804, 1,
1.8975, 0.5677513, 2.538838, 1, 0, 0.2470588, 1,
1.904121, -1.602033, 0.5478017, 1, 0, 0.2392157, 1,
1.904723, -0.6766093, 2.545322, 1, 0, 0.2352941, 1,
1.912988, 0.7494219, -0.4564728, 1, 0, 0.227451, 1,
1.922075, -0.3688366, 1.273499, 1, 0, 0.2235294, 1,
1.947481, -0.229683, 0.4451012, 1, 0, 0.2156863, 1,
1.949707, 0.5876667, 1.098862, 1, 0, 0.2117647, 1,
1.986287, -1.431867, 2.388937, 1, 0, 0.2039216, 1,
1.996723, -1.561306, 3.195443, 1, 0, 0.1960784, 1,
2.003373, -0.00425526, 2.56225, 1, 0, 0.1921569, 1,
2.014766, 1.077516, 2.180799, 1, 0, 0.1843137, 1,
2.034415, -1.084092, 2.736163, 1, 0, 0.1803922, 1,
2.068624, -0.8909714, 1.164188, 1, 0, 0.172549, 1,
2.070742, 1.288651, -0.1447104, 1, 0, 0.1686275, 1,
2.071974, 0.220777, 0.9033069, 1, 0, 0.1607843, 1,
2.072431, 0.03866217, 2.084323, 1, 0, 0.1568628, 1,
2.072764, 1.348911, 1.139832, 1, 0, 0.1490196, 1,
2.081943, -0.8697479, 1.675543, 1, 0, 0.145098, 1,
2.092996, 0.6882873, 2.359125, 1, 0, 0.1372549, 1,
2.107889, 0.170924, 1.099194, 1, 0, 0.1333333, 1,
2.119957, 1.579567, 0.5255363, 1, 0, 0.1254902, 1,
2.122628, -0.1347293, 0.6544014, 1, 0, 0.1215686, 1,
2.150316, 1.670235, 1.391435, 1, 0, 0.1137255, 1,
2.155537, 0.1418658, 1.648186, 1, 0, 0.1098039, 1,
2.156339, 0.6287711, 1.003769, 1, 0, 0.1019608, 1,
2.200321, -0.09411785, -0.5708711, 1, 0, 0.09411765, 1,
2.259068, 0.8384853, 0.4550225, 1, 0, 0.09019608, 1,
2.290246, 1.548925, -0.08050807, 1, 0, 0.08235294, 1,
2.307457, 0.006735999, 2.484181, 1, 0, 0.07843138, 1,
2.32688, -0.1476041, 1.845137, 1, 0, 0.07058824, 1,
2.337494, 0.2792299, 2.702329, 1, 0, 0.06666667, 1,
2.376765, -1.336067, 3.7158, 1, 0, 0.05882353, 1,
2.523258, -0.8167703, 0.2920543, 1, 0, 0.05490196, 1,
2.590435, -0.2695173, 1.773523, 1, 0, 0.04705882, 1,
2.646017, -0.8112786, 2.33696, 1, 0, 0.04313726, 1,
2.655397, 0.9391284, 0.7815084, 1, 0, 0.03529412, 1,
2.722721, -0.4602191, 1.116273, 1, 0, 0.03137255, 1,
2.794999, -1.867123, 3.60938, 1, 0, 0.02352941, 1,
2.81194, 0.1157716, 2.057544, 1, 0, 0.01960784, 1,
2.987748, -2.063983, 1.602987, 1, 0, 0.01176471, 1,
3.145673, -0.338088, 1.329331, 1, 0, 0.007843138, 1
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
-0.3473371, -5.212669, -6.762614, 0, -0.5, 0.5, 0.5,
-0.3473371, -5.212669, -6.762614, 1, -0.5, 0.5, 0.5,
-0.3473371, -5.212669, -6.762614, 1, 1.5, 0.5, 0.5,
-0.3473371, -5.212669, -6.762614, 0, 1.5, 0.5, 0.5
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
-5.024478, -0.3601712, -6.762614, 0, -0.5, 0.5, 0.5,
-5.024478, -0.3601712, -6.762614, 1, -0.5, 0.5, 0.5,
-5.024478, -0.3601712, -6.762614, 1, 1.5, 0.5, 0.5,
-5.024478, -0.3601712, -6.762614, 0, 1.5, 0.5, 0.5
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
-5.024478, -5.212669, 0.5207663, 0, -0.5, 0.5, 0.5,
-5.024478, -5.212669, 0.5207663, 1, -0.5, 0.5, 0.5,
-5.024478, -5.212669, 0.5207663, 1, 1.5, 0.5, 0.5,
-5.024478, -5.212669, 0.5207663, 0, 1.5, 0.5, 0.5
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
-3, -4.092862, -5.081834,
3, -4.092862, -5.081834,
-3, -4.092862, -5.081834,
-3, -4.279496, -5.361964,
-2, -4.092862, -5.081834,
-2, -4.279496, -5.361964,
-1, -4.092862, -5.081834,
-1, -4.279496, -5.361964,
0, -4.092862, -5.081834,
0, -4.279496, -5.361964,
1, -4.092862, -5.081834,
1, -4.279496, -5.361964,
2, -4.092862, -5.081834,
2, -4.279496, -5.361964,
3, -4.092862, -5.081834,
3, -4.279496, -5.361964
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
-3, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
-3, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
-3, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
-3, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
-2, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
-2, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
-2, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
-2, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
-1, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
-1, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
-1, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
-1, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
0, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
0, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
0, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
0, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
1, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
1, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
1, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
1, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
2, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
2, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
2, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
2, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5,
3, -4.652765, -5.922224, 0, -0.5, 0.5, 0.5,
3, -4.652765, -5.922224, 1, -0.5, 0.5, 0.5,
3, -4.652765, -5.922224, 1, 1.5, 0.5, 0.5,
3, -4.652765, -5.922224, 0, 1.5, 0.5, 0.5
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
-3.945138, -2, -5.081834,
-3.945138, 2, -5.081834,
-3.945138, -2, -5.081834,
-4.125028, -2, -5.361964,
-3.945138, 0, -5.081834,
-4.125028, 0, -5.361964,
-3.945138, 2, -5.081834,
-4.125028, 2, -5.361964
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
-4.484808, -2, -5.922224, 0, -0.5, 0.5, 0.5,
-4.484808, -2, -5.922224, 1, -0.5, 0.5, 0.5,
-4.484808, -2, -5.922224, 1, 1.5, 0.5, 0.5,
-4.484808, -2, -5.922224, 0, 1.5, 0.5, 0.5,
-4.484808, 0, -5.922224, 0, -0.5, 0.5, 0.5,
-4.484808, 0, -5.922224, 1, -0.5, 0.5, 0.5,
-4.484808, 0, -5.922224, 1, 1.5, 0.5, 0.5,
-4.484808, 0, -5.922224, 0, 1.5, 0.5, 0.5,
-4.484808, 2, -5.922224, 0, -0.5, 0.5, 0.5,
-4.484808, 2, -5.922224, 1, -0.5, 0.5, 0.5,
-4.484808, 2, -5.922224, 1, 1.5, 0.5, 0.5,
-4.484808, 2, -5.922224, 0, 1.5, 0.5, 0.5
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
-3.945138, -4.092862, -4,
-3.945138, -4.092862, 4,
-3.945138, -4.092862, -4,
-4.125028, -4.279496, -4,
-3.945138, -4.092862, -2,
-4.125028, -4.279496, -2,
-3.945138, -4.092862, 0,
-4.125028, -4.279496, 0,
-3.945138, -4.092862, 2,
-4.125028, -4.279496, 2,
-3.945138, -4.092862, 4,
-4.125028, -4.279496, 4
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
-4.484808, -4.652765, -4, 0, -0.5, 0.5, 0.5,
-4.484808, -4.652765, -4, 1, -0.5, 0.5, 0.5,
-4.484808, -4.652765, -4, 1, 1.5, 0.5, 0.5,
-4.484808, -4.652765, -4, 0, 1.5, 0.5, 0.5,
-4.484808, -4.652765, -2, 0, -0.5, 0.5, 0.5,
-4.484808, -4.652765, -2, 1, -0.5, 0.5, 0.5,
-4.484808, -4.652765, -2, 1, 1.5, 0.5, 0.5,
-4.484808, -4.652765, -2, 0, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 0, 0, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 0, 1, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 0, 1, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 0, 0, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 2, 0, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 2, 1, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 2, 1, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 2, 0, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 4, 0, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 4, 1, -0.5, 0.5, 0.5,
-4.484808, -4.652765, 4, 1, 1.5, 0.5, 0.5,
-4.484808, -4.652765, 4, 0, 1.5, 0.5, 0.5
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
-3.945138, -4.092862, -5.081834,
-3.945138, 3.372519, -5.081834,
-3.945138, -4.092862, 6.123366,
-3.945138, 3.372519, 6.123366,
-3.945138, -4.092862, -5.081834,
-3.945138, -4.092862, 6.123366,
-3.945138, 3.372519, -5.081834,
-3.945138, 3.372519, 6.123366,
-3.945138, -4.092862, -5.081834,
3.250463, -4.092862, -5.081834,
-3.945138, -4.092862, 6.123366,
3.250463, -4.092862, 6.123366,
-3.945138, 3.372519, -5.081834,
3.250463, 3.372519, -5.081834,
-3.945138, 3.372519, 6.123366,
3.250463, 3.372519, 6.123366,
3.250463, -4.092862, -5.081834,
3.250463, 3.372519, -5.081834,
3.250463, -4.092862, 6.123366,
3.250463, 3.372519, 6.123366,
3.250463, -4.092862, -5.081834,
3.250463, -4.092862, 6.123366,
3.250463, 3.372519, -5.081834,
3.250463, 3.372519, 6.123366
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
var radius = 8.151998;
var distance = 36.26916;
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
mvMatrix.translate( 0.3473371, 0.3601712, -0.5207663 );
mvMatrix.scale( 1.224929, 1.180663, 0.786608 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.26916);
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
methyl_m-hydroxycarb<-read.table("methyl_m-hydroxycarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_m-hydroxycarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
```

```r
y<-methyl_m-hydroxycarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
```

```r
z<-methyl_m-hydroxycarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_m' not found
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
-3.840348, 1.040112, -1.133692, 0, 0, 1, 1, 1,
-3.373946, -0.2966796, -0.2031666, 1, 0, 0, 1, 1,
-3.100071, 0.1231615, -1.856329, 1, 0, 0, 1, 1,
-2.800497, 0.4154582, -2.454141, 1, 0, 0, 1, 1,
-2.729928, 1.177807, -1.217466, 1, 0, 0, 1, 1,
-2.728151, -0.4703366, -2.748632, 1, 0, 0, 1, 1,
-2.678595, 0.9557513, -2.451178, 0, 0, 0, 1, 1,
-2.620553, -0.146722, -1.396521, 0, 0, 0, 1, 1,
-2.583814, -0.1879677, 0.7567124, 0, 0, 0, 1, 1,
-2.507351, -2.032192, -1.171272, 0, 0, 0, 1, 1,
-2.465053, -1.286226, -0.6267262, 0, 0, 0, 1, 1,
-2.407384, 0.02638564, -1.164994, 0, 0, 0, 1, 1,
-2.381067, 0.001106266, -1.452147, 0, 0, 0, 1, 1,
-2.365527, 1.53019, -2.880944, 1, 1, 1, 1, 1,
-2.33859, -2.10108, -0.477111, 1, 1, 1, 1, 1,
-2.265394, 1.536163, -1.589592, 1, 1, 1, 1, 1,
-2.252844, 0.7859385, -1.119933, 1, 1, 1, 1, 1,
-2.250736, 0.6537618, -2.582264, 1, 1, 1, 1, 1,
-2.250069, -0.1202274, -1.476256, 1, 1, 1, 1, 1,
-2.216724, 1.751241, -1.382999, 1, 1, 1, 1, 1,
-2.168185, 0.6674149, -1.046491, 1, 1, 1, 1, 1,
-2.160043, -0.3201227, -1.750379, 1, 1, 1, 1, 1,
-2.13867, -0.2779871, -2.24434, 1, 1, 1, 1, 1,
-2.096319, -1.159135, -1.691954, 1, 1, 1, 1, 1,
-2.055998, 0.3204149, -0.595576, 1, 1, 1, 1, 1,
-1.957195, 2.061031, 0.07299165, 1, 1, 1, 1, 1,
-1.925001, 1.375508, 0.1971876, 1, 1, 1, 1, 1,
-1.895302, -0.02621344, -1.803714, 1, 1, 1, 1, 1,
-1.8831, 0.08257184, -1.964741, 0, 0, 1, 1, 1,
-1.879307, -1.539405, -3.649298, 1, 0, 0, 1, 1,
-1.871293, 1.110589, -1.052453, 1, 0, 0, 1, 1,
-1.857887, 2.352288, -0.273883, 1, 0, 0, 1, 1,
-1.815188, -0.7906187, -1.078229, 1, 0, 0, 1, 1,
-1.79105, -1.101593, -2.835739, 1, 0, 0, 1, 1,
-1.788175, -0.8600479, -1.374282, 0, 0, 0, 1, 1,
-1.786202, -0.934037, -1.806373, 0, 0, 0, 1, 1,
-1.776981, -1.390686, -2.507266, 0, 0, 0, 1, 1,
-1.769402, 0.9195063, 0.04560406, 0, 0, 0, 1, 1,
-1.768678, 1.180321, -1.93587, 0, 0, 0, 1, 1,
-1.749654, 1.310211, 0.2841674, 0, 0, 0, 1, 1,
-1.745734, 0.1530401, -2.193201, 0, 0, 0, 1, 1,
-1.719733, -0.2671271, -2.916833, 1, 1, 1, 1, 1,
-1.698557, -0.1318917, 0.6792562, 1, 1, 1, 1, 1,
-1.693745, -0.1399464, -1.624409, 1, 1, 1, 1, 1,
-1.68721, -0.7440262, -2.523154, 1, 1, 1, 1, 1,
-1.675808, -0.8864311, -2.60595, 1, 1, 1, 1, 1,
-1.672912, -1.432438, 0.09975871, 1, 1, 1, 1, 1,
-1.664883, 1.208798, -1.555184, 1, 1, 1, 1, 1,
-1.65307, 0.3680048, -2.476677, 1, 1, 1, 1, 1,
-1.647108, 0.4909429, -1.536218, 1, 1, 1, 1, 1,
-1.642543, -0.4016045, -0.1395164, 1, 1, 1, 1, 1,
-1.639851, -0.05065186, -0.571198, 1, 1, 1, 1, 1,
-1.63036, 0.3605286, -2.680341, 1, 1, 1, 1, 1,
-1.628063, 2.331184, 1.361503, 1, 1, 1, 1, 1,
-1.618789, -0.7603849, -1.65675, 1, 1, 1, 1, 1,
-1.606084, 1.350036, 0.3477957, 1, 1, 1, 1, 1,
-1.603753, 0.752816, -0.9860902, 0, 0, 1, 1, 1,
-1.602927, 0.5706987, -1.130015, 1, 0, 0, 1, 1,
-1.59106, 0.4481758, -0.5905614, 1, 0, 0, 1, 1,
-1.584319, 0.4551154, -4.33665, 1, 0, 0, 1, 1,
-1.584235, -0.1095413, -0.7751167, 1, 0, 0, 1, 1,
-1.581813, 1.342469, -1.541401, 1, 0, 0, 1, 1,
-1.574178, -1.747087, -3.89813, 0, 0, 0, 1, 1,
-1.568907, 1.748715, -1.525865, 0, 0, 0, 1, 1,
-1.564524, -0.163982, -2.677919, 0, 0, 0, 1, 1,
-1.562404, -1.291182, -1.79948, 0, 0, 0, 1, 1,
-1.556428, 0.08564927, -0.6778313, 0, 0, 0, 1, 1,
-1.555145, -2.482659, -1.358848, 0, 0, 0, 1, 1,
-1.553167, 1.045455, -1.578118, 0, 0, 0, 1, 1,
-1.536518, 0.243733, -1.970391, 1, 1, 1, 1, 1,
-1.528261, -0.1510866, -1.824919, 1, 1, 1, 1, 1,
-1.520797, -0.6299253, -2.878656, 1, 1, 1, 1, 1,
-1.518186, 0.3627655, -1.952093, 1, 1, 1, 1, 1,
-1.503394, 0.843384, -0.469044, 1, 1, 1, 1, 1,
-1.495706, 0.198844, -2.03539, 1, 1, 1, 1, 1,
-1.494155, 0.9199891, -1.972692, 1, 1, 1, 1, 1,
-1.492051, -0.8312047, -2.084271, 1, 1, 1, 1, 1,
-1.482503, -0.5982633, -0.8137788, 1, 1, 1, 1, 1,
-1.482066, 0.9788439, 0.5011075, 1, 1, 1, 1, 1,
-1.479915, -0.8657764, -0.7532649, 1, 1, 1, 1, 1,
-1.467132, -0.3125084, -1.853799, 1, 1, 1, 1, 1,
-1.463305, 1.433318, -0.9392433, 1, 1, 1, 1, 1,
-1.447545, -0.9530973, -3.320167, 1, 1, 1, 1, 1,
-1.414177, -0.4429443, -1.697277, 1, 1, 1, 1, 1,
-1.404792, 1.729501, -1.111197, 0, 0, 1, 1, 1,
-1.402793, -1.847496, -1.501319, 1, 0, 0, 1, 1,
-1.39894, -1.659412, -1.426141, 1, 0, 0, 1, 1,
-1.398764, -0.6304979, -2.597382, 1, 0, 0, 1, 1,
-1.39165, -1.403145, -2.029778, 1, 0, 0, 1, 1,
-1.388807, 0.0672489, -1.663339, 1, 0, 0, 1, 1,
-1.388582, -1.287472, -1.932387, 0, 0, 0, 1, 1,
-1.385449, 1.237742, -1.026736, 0, 0, 0, 1, 1,
-1.385211, -0.5466122, -1.984158, 0, 0, 0, 1, 1,
-1.384673, -0.8667002, -1.535994, 0, 0, 0, 1, 1,
-1.374516, -0.5834568, -2.026302, 0, 0, 0, 1, 1,
-1.368864, 1.356594, -0.7044999, 0, 0, 0, 1, 1,
-1.368479, 0.5994748, -1.481351, 0, 0, 0, 1, 1,
-1.366694, 0.80137, -1.607287, 1, 1, 1, 1, 1,
-1.358982, -0.1798969, -2.281116, 1, 1, 1, 1, 1,
-1.357448, -0.1935614, -1.604918, 1, 1, 1, 1, 1,
-1.357121, -0.960319, -3.713649, 1, 1, 1, 1, 1,
-1.352752, -1.315587, -2.718002, 1, 1, 1, 1, 1,
-1.330401, 0.07482172, -1.241777, 1, 1, 1, 1, 1,
-1.323732, -1.012082, -3.26341, 1, 1, 1, 1, 1,
-1.323702, -0.4397098, -1.15442, 1, 1, 1, 1, 1,
-1.305974, -0.2064501, -0.6276293, 1, 1, 1, 1, 1,
-1.300251, 0.9298347, 0.2579279, 1, 1, 1, 1, 1,
-1.261533, 0.2716397, -2.080654, 1, 1, 1, 1, 1,
-1.256321, 0.2257741, -0.2900355, 1, 1, 1, 1, 1,
-1.25508, -0.479064, -1.880216, 1, 1, 1, 1, 1,
-1.253191, -1.391511, -3.607455, 1, 1, 1, 1, 1,
-1.251055, 0.3309103, -2.667907, 1, 1, 1, 1, 1,
-1.241529, 0.8789925, 0.2849361, 0, 0, 1, 1, 1,
-1.232389, 0.5500221, -2.292722, 1, 0, 0, 1, 1,
-1.215169, 1.113367, -1.317595, 1, 0, 0, 1, 1,
-1.208216, -1.602528, -3.539867, 1, 0, 0, 1, 1,
-1.199162, -0.3023298, -2.150837, 1, 0, 0, 1, 1,
-1.198023, -1.003051, -1.053682, 1, 0, 0, 1, 1,
-1.191232, -0.5712953, 0.004674592, 0, 0, 0, 1, 1,
-1.186097, -1.717425, -1.616742, 0, 0, 0, 1, 1,
-1.172889, 0.9600328, -1.045908, 0, 0, 0, 1, 1,
-1.171362, -0.2050388, -1.521784, 0, 0, 0, 1, 1,
-1.169961, 0.3072522, -0.691759, 0, 0, 0, 1, 1,
-1.169387, 0.7809815, -1.254477, 0, 0, 0, 1, 1,
-1.155664, 0.1653424, -1.279415, 0, 0, 0, 1, 1,
-1.152861, 0.08047891, -2.107492, 1, 1, 1, 1, 1,
-1.146342, -0.00881715, -0.577186, 1, 1, 1, 1, 1,
-1.144543, -1.672889, -2.199261, 1, 1, 1, 1, 1,
-1.144524, -0.3225576, -2.975015, 1, 1, 1, 1, 1,
-1.140046, 0.07637522, -1.918116, 1, 1, 1, 1, 1,
-1.132249, -1.200813, -2.827893, 1, 1, 1, 1, 1,
-1.132073, -1.277975, -3.055787, 1, 1, 1, 1, 1,
-1.128506, -1.437152, -2.827495, 1, 1, 1, 1, 1,
-1.126129, 0.06572691, -0.5235295, 1, 1, 1, 1, 1,
-1.119593, -0.7861794, -2.215319, 1, 1, 1, 1, 1,
-1.118228, -0.1913417, -2.114563, 1, 1, 1, 1, 1,
-1.110666, -0.9094974, -1.749202, 1, 1, 1, 1, 1,
-1.097793, -0.797108, -2.812796, 1, 1, 1, 1, 1,
-1.088842, -0.2950923, -3.150299, 1, 1, 1, 1, 1,
-1.079493, 0.2202894, -2.425436, 1, 1, 1, 1, 1,
-1.071932, -0.3397663, -1.965111, 0, 0, 1, 1, 1,
-1.069071, -2.765734, -2.025068, 1, 0, 0, 1, 1,
-1.068659, 0.1447653, -0.7408131, 1, 0, 0, 1, 1,
-1.068373, -0.2250789, -2.987442, 1, 0, 0, 1, 1,
-1.066354, 1.83051, 0.2986364, 1, 0, 0, 1, 1,
-1.05993, 1.306401, -0.822592, 1, 0, 0, 1, 1,
-1.055796, -0.09299822, -1.480733, 0, 0, 0, 1, 1,
-1.047675, 0.4150425, -0.01604744, 0, 0, 0, 1, 1,
-1.037428, -0.02981452, -0.03151011, 0, 0, 0, 1, 1,
-1.028036, 1.11992, 0.7015471, 0, 0, 0, 1, 1,
-1.019461, 0.007421174, -0.02826145, 0, 0, 0, 1, 1,
-1.018001, 1.420441, -0.6821275, 0, 0, 0, 1, 1,
-1.016848, -0.8842514, -3.484553, 0, 0, 0, 1, 1,
-1.015356, 0.1140388, -0.3538388, 1, 1, 1, 1, 1,
-1.01189, 0.8810346, 1.228458, 1, 1, 1, 1, 1,
-1.008788, -0.1863602, -2.941084, 1, 1, 1, 1, 1,
-1.007239, -1.073723, -1.977931, 1, 1, 1, 1, 1,
-0.9998875, 1.935664, 0.9452772, 1, 1, 1, 1, 1,
-0.999126, -0.08374901, -1.855763, 1, 1, 1, 1, 1,
-0.9936011, -0.9512597, -1.917477, 1, 1, 1, 1, 1,
-0.9854897, -0.008167697, -1.91388, 1, 1, 1, 1, 1,
-0.9853911, 0.8863974, -0.8501913, 1, 1, 1, 1, 1,
-0.9830625, -0.1218024, -0.8030587, 1, 1, 1, 1, 1,
-0.9807413, 3.018264, 0.7018742, 1, 1, 1, 1, 1,
-0.9806578, 0.6987804, -0.7356822, 1, 1, 1, 1, 1,
-0.978649, -0.9018717, -2.476827, 1, 1, 1, 1, 1,
-0.977685, -0.9501848, -1.919692, 1, 1, 1, 1, 1,
-0.9739472, -0.2873701, -2.077466, 1, 1, 1, 1, 1,
-0.9724651, -0.1735173, -1.092239, 0, 0, 1, 1, 1,
-0.970533, -0.04177478, -2.261609, 1, 0, 0, 1, 1,
-0.9666256, 0.166433, 0.6692783, 1, 0, 0, 1, 1,
-0.959882, -1.440868, -2.377224, 1, 0, 0, 1, 1,
-0.9581795, 1.97357, -0.2764194, 1, 0, 0, 1, 1,
-0.9569899, 0.4851556, -3.550971, 1, 0, 0, 1, 1,
-0.9491537, -1.059116, -2.178391, 0, 0, 0, 1, 1,
-0.9411484, 0.5735462, -1.284703, 0, 0, 0, 1, 1,
-0.9359061, 0.9068028, -0.9869097, 0, 0, 0, 1, 1,
-0.9355716, -1.670912, -1.58796, 0, 0, 0, 1, 1,
-0.9330534, -0.2545398, -3.329686, 0, 0, 0, 1, 1,
-0.9272748, 1.187106, 0.4034668, 0, 0, 0, 1, 1,
-0.9256256, 0.9404373, -0.7171979, 0, 0, 0, 1, 1,
-0.9209714, 0.4529373, -0.5772156, 1, 1, 1, 1, 1,
-0.9167653, 0.1533183, -1.656062, 1, 1, 1, 1, 1,
-0.9166906, -0.3896321, -1.847915, 1, 1, 1, 1, 1,
-0.9165431, 0.03407295, -1.116942, 1, 1, 1, 1, 1,
-0.9126647, -0.3651262, -1.179947, 1, 1, 1, 1, 1,
-0.9076491, -0.122207, -1.514858, 1, 1, 1, 1, 1,
-0.9001629, -0.8671594, -2.589291, 1, 1, 1, 1, 1,
-0.8964326, -0.6198772, -3.340698, 1, 1, 1, 1, 1,
-0.8922683, 1.730724, -0.2920876, 1, 1, 1, 1, 1,
-0.8887039, 1.633419, -0.0370889, 1, 1, 1, 1, 1,
-0.8846804, -0.5360368, -1.575577, 1, 1, 1, 1, 1,
-0.8821438, 0.3830266, -1.621319, 1, 1, 1, 1, 1,
-0.8817973, -0.4902366, -2.124816, 1, 1, 1, 1, 1,
-0.8802012, 0.3384929, -1.531749, 1, 1, 1, 1, 1,
-0.8798649, -0.6814407, -2.220731, 1, 1, 1, 1, 1,
-0.8723591, -0.614211, -2.216642, 0, 0, 1, 1, 1,
-0.8578181, -2.714, -2.852831, 1, 0, 0, 1, 1,
-0.857065, -0.7578324, -1.04792, 1, 0, 0, 1, 1,
-0.8525409, 0.7715204, -2.202041, 1, 0, 0, 1, 1,
-0.846731, 0.0381011, -1.513239, 1, 0, 0, 1, 1,
-0.8443286, 0.6002495, -0.7040858, 1, 0, 0, 1, 1,
-0.8438818, 1.901336, -0.5338377, 0, 0, 0, 1, 1,
-0.8396631, -0.6188124, -2.62872, 0, 0, 0, 1, 1,
-0.8264641, 3.03415, -0.1599149, 0, 0, 0, 1, 1,
-0.8236482, -0.884587, -1.532227, 0, 0, 0, 1, 1,
-0.8226239, 0.1359864, -1.505791, 0, 0, 0, 1, 1,
-0.8213224, -1.14974, -3.023995, 0, 0, 0, 1, 1,
-0.8212801, 1.774798, 0.525842, 0, 0, 0, 1, 1,
-0.8140132, -1.993024, -2.261679, 1, 1, 1, 1, 1,
-0.8133826, 1.18515, -0.5239294, 1, 1, 1, 1, 1,
-0.8025266, -0.5842037, -0.6845767, 1, 1, 1, 1, 1,
-0.796847, 0.3574071, -1.244221, 1, 1, 1, 1, 1,
-0.7958254, 0.7940942, -2.102009, 1, 1, 1, 1, 1,
-0.7926349, 0.3673021, -1.711282, 1, 1, 1, 1, 1,
-0.7924237, -0.7020701, -1.277322, 1, 1, 1, 1, 1,
-0.7916853, -1.222971, -2.057899, 1, 1, 1, 1, 1,
-0.7905946, -1.620494, -3.126326, 1, 1, 1, 1, 1,
-0.7831163, -0.6031137, -1.915053, 1, 1, 1, 1, 1,
-0.7800275, 1.255207, -1.018909, 1, 1, 1, 1, 1,
-0.7759304, 1.40269, -1.19049, 1, 1, 1, 1, 1,
-0.7662237, -1.228542, -1.187927, 1, 1, 1, 1, 1,
-0.7658468, 0.4139184, -1.233987, 1, 1, 1, 1, 1,
-0.7633523, -0.687708, -1.332773, 1, 1, 1, 1, 1,
-0.761332, 0.5469446, -0.5710535, 0, 0, 1, 1, 1,
-0.7437093, 1.058519, 1.387444, 1, 0, 0, 1, 1,
-0.7417142, -1.478657, -4.280784, 1, 0, 0, 1, 1,
-0.7331567, 0.8661199, -0.4318613, 1, 0, 0, 1, 1,
-0.7316086, 0.4536928, 0.05873315, 1, 0, 0, 1, 1,
-0.7283009, -0.8149512, -1.338069, 1, 0, 0, 1, 1,
-0.7219285, -0.5347173, -1.118369, 0, 0, 0, 1, 1,
-0.720194, 0.1690505, -1.430548, 0, 0, 0, 1, 1,
-0.7163284, -0.6127831, -3.028616, 0, 0, 0, 1, 1,
-0.7125313, -0.3120328, -1.441167, 0, 0, 0, 1, 1,
-0.7123936, -0.9526464, -3.285118, 0, 0, 0, 1, 1,
-0.7094318, -0.9885474, -2.056983, 0, 0, 0, 1, 1,
-0.7077454, -1.574921, -2.42404, 0, 0, 0, 1, 1,
-0.6970131, 1.802351, -0.7271268, 1, 1, 1, 1, 1,
-0.6940702, -0.9519038, -3.682965, 1, 1, 1, 1, 1,
-0.6885327, -0.8125038, -0.6089807, 1, 1, 1, 1, 1,
-0.6866367, -1.468526, -3.280384, 1, 1, 1, 1, 1,
-0.6830949, -0.460882, -0.3508063, 1, 1, 1, 1, 1,
-0.676775, 1.136836, -2.143128, 1, 1, 1, 1, 1,
-0.6751605, -0.1650488, -3.400112, 1, 1, 1, 1, 1,
-0.6748693, -0.3580753, -1.624751, 1, 1, 1, 1, 1,
-0.6733783, -0.05818164, -2.277103, 1, 1, 1, 1, 1,
-0.6721622, -0.2642604, -2.987178, 1, 1, 1, 1, 1,
-0.6715603, 1.847205, -0.2173541, 1, 1, 1, 1, 1,
-0.6706057, -1.081344, -4.042409, 1, 1, 1, 1, 1,
-0.6634583, -0.6302407, -4.136575, 1, 1, 1, 1, 1,
-0.6624992, 1.029522, -0.2713405, 1, 1, 1, 1, 1,
-0.661935, 0.2462288, -2.655178, 1, 1, 1, 1, 1,
-0.6546814, 0.5486844, -3.154235, 0, 0, 1, 1, 1,
-0.6510155, -0.7870548, -1.67467, 1, 0, 0, 1, 1,
-0.6508704, 0.450654, 0.2739046, 1, 0, 0, 1, 1,
-0.6487485, -0.4804305, -1.285061, 1, 0, 0, 1, 1,
-0.6447743, -1.933905, -2.71475, 1, 0, 0, 1, 1,
-0.6434852, 0.6156776, 0.8237669, 1, 0, 0, 1, 1,
-0.632391, 0.6981041, -0.2461523, 0, 0, 0, 1, 1,
-0.6322725, 1.709843, -0.2702974, 0, 0, 0, 1, 1,
-0.6274094, 0.7953337, -0.6879137, 0, 0, 0, 1, 1,
-0.624221, -1.114703, -0.7037453, 0, 0, 0, 1, 1,
-0.6200283, 1.218878, -2.189245, 0, 0, 0, 1, 1,
-0.6171753, -0.9879656, -2.33089, 0, 0, 0, 1, 1,
-0.6086748, -1.213689, -3.529188, 0, 0, 0, 1, 1,
-0.6063657, 0.7789488, -0.6578032, 1, 1, 1, 1, 1,
-0.6054788, -0.3213555, -2.837991, 1, 1, 1, 1, 1,
-0.6040567, -1.454236, -2.905521, 1, 1, 1, 1, 1,
-0.6031091, -1.050874, -3.035535, 1, 1, 1, 1, 1,
-0.6020349, 0.4059714, -1.803285, 1, 1, 1, 1, 1,
-0.5986523, 0.4713647, -1.466633, 1, 1, 1, 1, 1,
-0.5977143, 0.5975788, -0.08689696, 1, 1, 1, 1, 1,
-0.5948004, -0.2994053, -1.422301, 1, 1, 1, 1, 1,
-0.592801, -2.026415, -2.98134, 1, 1, 1, 1, 1,
-0.5882867, -0.427416, -3.459969, 1, 1, 1, 1, 1,
-0.5865381, 0.5090846, 0.210434, 1, 1, 1, 1, 1,
-0.586178, 1.329445, -1.198994, 1, 1, 1, 1, 1,
-0.5734268, 0.8642245, -0.3556252, 1, 1, 1, 1, 1,
-0.5561843, 0.5099146, -2.594383, 1, 1, 1, 1, 1,
-0.5497128, 0.827727, -1.595433, 1, 1, 1, 1, 1,
-0.5440583, -0.0016855, -3.480849, 0, 0, 1, 1, 1,
-0.5367234, -0.916228, -1.8572, 1, 0, 0, 1, 1,
-0.5323041, -0.4240647, -1.640796, 1, 0, 0, 1, 1,
-0.531915, 1.314024, 0.4189335, 1, 0, 0, 1, 1,
-0.5291331, -1.545234, -2.437551, 1, 0, 0, 1, 1,
-0.5270081, -0.1346844, -1.279763, 1, 0, 0, 1, 1,
-0.5266206, 1.461215, 0.668151, 0, 0, 0, 1, 1,
-0.5251029, 0.7048956, -2.335491, 0, 0, 0, 1, 1,
-0.5239432, -2.19866, -3.897808, 0, 0, 0, 1, 1,
-0.5203258, -1.061339, -3.163622, 0, 0, 0, 1, 1,
-0.518095, 2.21383, -1.066579, 0, 0, 0, 1, 1,
-0.5179364, -0.5996179, -3.488322, 0, 0, 0, 1, 1,
-0.5151304, -0.9803407, -3.695297, 0, 0, 0, 1, 1,
-0.5119357, 0.901704, -0.9046206, 1, 1, 1, 1, 1,
-0.5047173, -0.463081, -2.347571, 1, 1, 1, 1, 1,
-0.5038261, -0.6390223, -2.521123, 1, 1, 1, 1, 1,
-0.5033215, 0.17072, -1.053624, 1, 1, 1, 1, 1,
-0.5028293, -0.2233209, -2.955833, 1, 1, 1, 1, 1,
-0.4971126, 0.9378837, 0.6366519, 1, 1, 1, 1, 1,
-0.4941539, 0.8383762, 0.3913625, 1, 1, 1, 1, 1,
-0.4929573, -0.2650051, -1.095578, 1, 1, 1, 1, 1,
-0.4879518, 0.5867489, -1.761528, 1, 1, 1, 1, 1,
-0.4772474, -0.1166806, -2.608036, 1, 1, 1, 1, 1,
-0.4691558, -0.137458, -1.621131, 1, 1, 1, 1, 1,
-0.4667559, 1.249205, -1.102372, 1, 1, 1, 1, 1,
-0.4644378, 0.2007629, -1.561564, 1, 1, 1, 1, 1,
-0.4624715, -0.1608608, -2.638449, 1, 1, 1, 1, 1,
-0.456632, -1.075199, -4.134616, 1, 1, 1, 1, 1,
-0.4549439, 0.05780133, -1.583108, 0, 0, 1, 1, 1,
-0.4510513, 0.8845162, -0.416797, 1, 0, 0, 1, 1,
-0.4494029, 0.09354503, 0.104967, 1, 0, 0, 1, 1,
-0.4478346, 1.067479, -1.026822, 1, 0, 0, 1, 1,
-0.4469488, 2.532484, -2.195444, 1, 0, 0, 1, 1,
-0.4448855, -0.228085, -2.210276, 1, 0, 0, 1, 1,
-0.4368854, -1.609236, -2.502447, 0, 0, 0, 1, 1,
-0.4361722, -1.234195, -2.357786, 0, 0, 0, 1, 1,
-0.434035, 0.3592257, -1.57891, 0, 0, 0, 1, 1,
-0.4334646, 0.2810122, 0.08422504, 0, 0, 0, 1, 1,
-0.4296471, 0.2304002, -2.091841, 0, 0, 0, 1, 1,
-0.4289826, -1.290865, -3.972973, 0, 0, 0, 1, 1,
-0.4212103, -0.02142182, -3.236933, 0, 0, 0, 1, 1,
-0.4189122, -0.4483304, -3.20941, 1, 1, 1, 1, 1,
-0.4157282, 0.6902462, -0.9553553, 1, 1, 1, 1, 1,
-0.4110361, 0.4982447, -1.942443, 1, 1, 1, 1, 1,
-0.4088259, -0.6511179, -2.880328, 1, 1, 1, 1, 1,
-0.4011892, 0.493738, -0.1756055, 1, 1, 1, 1, 1,
-0.4003653, 1.20544, -0.7140585, 1, 1, 1, 1, 1,
-0.4002886, 1.01865, 0.2862961, 1, 1, 1, 1, 1,
-0.3981394, 0.6266548, -0.02084409, 1, 1, 1, 1, 1,
-0.394437, -1.480109, -3.722967, 1, 1, 1, 1, 1,
-0.3828729, -0.7013171, -2.76917, 1, 1, 1, 1, 1,
-0.3813966, 0.9832207, -1.590765, 1, 1, 1, 1, 1,
-0.377023, -0.4261406, -2.788212, 1, 1, 1, 1, 1,
-0.3764911, 1.65815, 0.04195646, 1, 1, 1, 1, 1,
-0.3763616, -1.534581, -4.416871, 1, 1, 1, 1, 1,
-0.3725564, -0.4746084, -3.521062, 1, 1, 1, 1, 1,
-0.368779, -0.69152, -2.235916, 0, 0, 1, 1, 1,
-0.3628284, 0.2820199, -0.9955899, 1, 0, 0, 1, 1,
-0.3520444, 1.656938, 0.200083, 1, 0, 0, 1, 1,
-0.3517899, -0.2698416, -2.524582, 1, 0, 0, 1, 1,
-0.3516968, 0.6378484, 1.28736, 1, 0, 0, 1, 1,
-0.3499484, -0.5239961, -1.880298, 1, 0, 0, 1, 1,
-0.3457893, -1.491934, -3.870281, 0, 0, 0, 1, 1,
-0.3403929, -0.427876, -1.849942, 0, 0, 0, 1, 1,
-0.3276093, 1.838558, 0.9424301, 0, 0, 0, 1, 1,
-0.3263303, 0.1268004, 1.160763, 0, 0, 0, 1, 1,
-0.3188489, 0.25942, -2.058465, 0, 0, 0, 1, 1,
-0.3080171, 1.495119, 0.4391626, 0, 0, 0, 1, 1,
-0.3067296, -0.09630409, -1.815132, 0, 0, 0, 1, 1,
-0.3064825, 0.03796243, -1.433256, 1, 1, 1, 1, 1,
-0.296652, 0.07677557, -1.609593, 1, 1, 1, 1, 1,
-0.2950939, 0.4307097, -1.075375, 1, 1, 1, 1, 1,
-0.2908249, -0.2329653, -3.135623, 1, 1, 1, 1, 1,
-0.2876828, -0.06337475, -1.32235, 1, 1, 1, 1, 1,
-0.2856009, -1.552138, -1.848757, 1, 1, 1, 1, 1,
-0.2832474, -0.5394208, -3.545011, 1, 1, 1, 1, 1,
-0.2793587, 0.05395188, -0.5552887, 1, 1, 1, 1, 1,
-0.2762303, -1.240862, -3.224342, 1, 1, 1, 1, 1,
-0.2709, -1.211249, -2.742645, 1, 1, 1, 1, 1,
-0.2673642, -1.601414, -2.94769, 1, 1, 1, 1, 1,
-0.2664945, -1.071061, -3.535022, 1, 1, 1, 1, 1,
-0.2662821, 0.8738548, -1.157965, 1, 1, 1, 1, 1,
-0.2662724, 1.561206, 0.6191474, 1, 1, 1, 1, 1,
-0.2655949, -0.112565, -1.726886, 1, 1, 1, 1, 1,
-0.2626871, 1.221068, -1.11012, 0, 0, 1, 1, 1,
-0.2601348, -0.8273302, -2.09084, 1, 0, 0, 1, 1,
-0.2586617, -1.309318, -0.9855729, 1, 0, 0, 1, 1,
-0.2565316, 0.973752, -0.03841908, 1, 0, 0, 1, 1,
-0.2543306, -1.236355, -2.543294, 1, 0, 0, 1, 1,
-0.2516823, 2.057398, 1.115792, 1, 0, 0, 1, 1,
-0.2467043, 1.445098, 0.8084127, 0, 0, 0, 1, 1,
-0.2417161, 0.350356, 0.4390658, 0, 0, 0, 1, 1,
-0.2414774, 0.8805618, 0.09702142, 0, 0, 0, 1, 1,
-0.2317381, -0.1985317, -2.654884, 0, 0, 0, 1, 1,
-0.2313726, -2.632566, -2.346767, 0, 0, 0, 1, 1,
-0.2301768, -0.04078668, -3.651288, 0, 0, 0, 1, 1,
-0.2291137, -2.190588, -1.862405, 0, 0, 0, 1, 1,
-0.2283053, -0.7226365, -2.372257, 1, 1, 1, 1, 1,
-0.226685, -0.8565347, -2.720755, 1, 1, 1, 1, 1,
-0.2229217, 0.1279245, -0.476664, 1, 1, 1, 1, 1,
-0.221407, 0.9373084, -1.155716, 1, 1, 1, 1, 1,
-0.220804, 0.7228751, -0.6018279, 1, 1, 1, 1, 1,
-0.2183793, -0.1699578, -1.133079, 1, 1, 1, 1, 1,
-0.2172594, -0.762207, -1.255272, 1, 1, 1, 1, 1,
-0.2137339, -0.9135479, -2.747424, 1, 1, 1, 1, 1,
-0.2117315, 0.07820489, 0.1520232, 1, 1, 1, 1, 1,
-0.2109337, -0.9398401, -1.643946, 1, 1, 1, 1, 1,
-0.2087132, 0.5941013, -1.091954, 1, 1, 1, 1, 1,
-0.205696, -0.7013923, -4.918651, 1, 1, 1, 1, 1,
-0.203853, 0.7058926, -2.062222, 1, 1, 1, 1, 1,
-0.2011795, -2.066723, -4.109678, 1, 1, 1, 1, 1,
-0.2011643, -0.3942814, -2.307658, 1, 1, 1, 1, 1,
-0.1984706, -0.6236183, -4.739442, 0, 0, 1, 1, 1,
-0.1970334, -0.6373221, -2.360687, 1, 0, 0, 1, 1,
-0.196086, 1.277444, -1.131204, 1, 0, 0, 1, 1,
-0.1953565, -1.045918, -1.343842, 1, 0, 0, 1, 1,
-0.1889349, -1.484779, -2.513865, 1, 0, 0, 1, 1,
-0.1857209, -0.08354207, -2.108995, 1, 0, 0, 1, 1,
-0.1847636, 2.003536, -1.091296, 0, 0, 0, 1, 1,
-0.1846567, -0.06819271, -1.218465, 0, 0, 0, 1, 1,
-0.1835166, 1.051875, -0.9843014, 0, 0, 0, 1, 1,
-0.1791844, 0.138831, -2.679126, 0, 0, 0, 1, 1,
-0.1774948, -0.7816874, -3.587963, 0, 0, 0, 1, 1,
-0.1750626, -0.7151709, -2.317263, 0, 0, 0, 1, 1,
-0.1720643, 0.5350246, -0.2457222, 0, 0, 0, 1, 1,
-0.1708906, -1.610273, -4.51624, 1, 1, 1, 1, 1,
-0.1689612, -0.7511176, -3.911632, 1, 1, 1, 1, 1,
-0.167762, -0.9023681, -3.464772, 1, 1, 1, 1, 1,
-0.1677556, 0.6272935, 1.267011, 1, 1, 1, 1, 1,
-0.1674047, -0.9911402, -2.01253, 1, 1, 1, 1, 1,
-0.1552745, -0.8051025, -1.596786, 1, 1, 1, 1, 1,
-0.1537682, 0.327461, -1.079758, 1, 1, 1, 1, 1,
-0.1512372, -0.627506, -2.310493, 1, 1, 1, 1, 1,
-0.1498349, 0.03176101, -1.844826, 1, 1, 1, 1, 1,
-0.1447287, 3.2638, 1.286396, 1, 1, 1, 1, 1,
-0.1405478, 1.065858, 1.616388, 1, 1, 1, 1, 1,
-0.1368621, -0.2059692, -1.305053, 1, 1, 1, 1, 1,
-0.1321936, 0.1585324, 0.275891, 1, 1, 1, 1, 1,
-0.1295781, -0.02414048, -1.304073, 1, 1, 1, 1, 1,
-0.1283806, -0.5768022, -2.763629, 1, 1, 1, 1, 1,
-0.125681, -0.3062453, -3.087594, 0, 0, 1, 1, 1,
-0.1248949, 1.404601, -0.4584983, 1, 0, 0, 1, 1,
-0.1212697, 0.2635505, -1.03231, 1, 0, 0, 1, 1,
-0.1185916, -1.001299, -3.190213, 1, 0, 0, 1, 1,
-0.1183756, -0.8909685, -2.490803, 1, 0, 0, 1, 1,
-0.1172346, 1.435638, 1.11177, 1, 0, 0, 1, 1,
-0.1151619, 0.7706968, 0.6655418, 0, 0, 0, 1, 1,
-0.1143201, 0.9649022, -0.4576021, 0, 0, 0, 1, 1,
-0.112992, -0.4563078, -2.889346, 0, 0, 0, 1, 1,
-0.1075066, 0.5437824, -1.153649, 0, 0, 0, 1, 1,
-0.107401, -0.3053566, -2.030621, 0, 0, 0, 1, 1,
-0.1064528, 0.2711636, 1.239257, 0, 0, 0, 1, 1,
-0.1052238, -0.1745352, -3.602449, 0, 0, 0, 1, 1,
-0.1050461, 0.5068197, -0.88379, 1, 1, 1, 1, 1,
-0.104801, 0.1427135, -0.5108747, 1, 1, 1, 1, 1,
-0.09834775, -2.534254, -4.575115, 1, 1, 1, 1, 1,
-0.09783261, 0.1916179, -1.962168, 1, 1, 1, 1, 1,
-0.09329834, -0.9378988, -3.511909, 1, 1, 1, 1, 1,
-0.09235613, -1.121203, -3.475689, 1, 1, 1, 1, 1,
-0.09109193, 1.757032, -1.075044, 1, 1, 1, 1, 1,
-0.09107723, 0.02636429, -2.251309, 1, 1, 1, 1, 1,
-0.08420623, -0.8603277, -2.47489, 1, 1, 1, 1, 1,
-0.08111534, -0.3890368, -3.009398, 1, 1, 1, 1, 1,
-0.07903297, -0.9819955, -2.546363, 1, 1, 1, 1, 1,
-0.07577564, 0.02160525, -3.389659, 1, 1, 1, 1, 1,
-0.07136747, 1.822374, -0.5358214, 1, 1, 1, 1, 1,
-0.07048176, 0.358063, -2.039383, 1, 1, 1, 1, 1,
-0.06209084, -0.2247322, -4.035386, 1, 1, 1, 1, 1,
-0.05917517, 1.305038, 0.5406141, 0, 0, 1, 1, 1,
-0.05858593, 0.3704643, 0.6456909, 1, 0, 0, 1, 1,
-0.05827207, 0.1154861, 0.3338909, 1, 0, 0, 1, 1,
-0.05446797, 0.05212429, -0.3165766, 1, 0, 0, 1, 1,
-0.04949946, 0.4474746, 0.3049397, 1, 0, 0, 1, 1,
-0.04412701, -1.529458, -2.473846, 1, 0, 0, 1, 1,
-0.04205086, -0.03869325, -2.218863, 0, 0, 0, 1, 1,
-0.03863116, 0.275003, -0.0222003, 0, 0, 0, 1, 1,
-0.03425677, -0.7704809, -3.202554, 0, 0, 0, 1, 1,
-0.03156649, -1.070939, -3.279645, 0, 0, 0, 1, 1,
-0.02968859, 0.7630754, -1.600848, 0, 0, 0, 1, 1,
-0.02899983, -1.186537, -2.055626, 0, 0, 0, 1, 1,
-0.02631168, 0.6196842, 0.2845195, 0, 0, 0, 1, 1,
-0.02355005, -0.02781597, -2.999358, 1, 1, 1, 1, 1,
-0.01891159, 0.5167999, -0.7112337, 1, 1, 1, 1, 1,
-0.01507963, 1.178202, 2.323791, 1, 1, 1, 1, 1,
-0.01406025, 0.5886377, -0.153698, 1, 1, 1, 1, 1,
-0.0139622, 0.4097401, 1.255342, 1, 1, 1, 1, 1,
-0.01240971, 0.6036528, 0.3580279, 1, 1, 1, 1, 1,
-0.01000651, -0.8382972, -2.742045, 1, 1, 1, 1, 1,
-0.009678258, -0.2850636, -0.5285293, 1, 1, 1, 1, 1,
-0.009130195, 1.15716, -0.04484675, 1, 1, 1, 1, 1,
-0.006379943, 0.9749531, 0.7321653, 1, 1, 1, 1, 1,
-0.005555564, 0.8227827, -1.789123, 1, 1, 1, 1, 1,
-0.002301145, -1.476161, -4.335871, 1, 1, 1, 1, 1,
-0.0005105925, 1.894799, -0.3014102, 1, 1, 1, 1, 1,
0.0009486521, 1.142009, -0.5064717, 1, 1, 1, 1, 1,
0.005782953, 1.729648, -0.3652512, 1, 1, 1, 1, 1,
0.01138516, -0.3204624, 5.006494, 0, 0, 1, 1, 1,
0.01241491, 0.413738, 0.02299396, 1, 0, 0, 1, 1,
0.01271135, -0.9612535, 2.324983, 1, 0, 0, 1, 1,
0.01755173, 0.797263, 1.245041, 1, 0, 0, 1, 1,
0.01764393, -0.272997, 5.960184, 1, 0, 0, 1, 1,
0.02003164, -1.450966, 3.143553, 1, 0, 0, 1, 1,
0.023799, 1.841955, 0.6059757, 0, 0, 0, 1, 1,
0.02571311, 2.00282, 1.563195, 0, 0, 0, 1, 1,
0.026594, 0.04212508, 0.02441398, 0, 0, 0, 1, 1,
0.02764758, -1.28471, 2.161867, 0, 0, 0, 1, 1,
0.03288288, 1.806054, -0.9149827, 0, 0, 0, 1, 1,
0.03468874, -0.6384013, 2.928827, 0, 0, 0, 1, 1,
0.03518919, 0.8300953, -0.4607244, 0, 0, 0, 1, 1,
0.03686268, -1.03897, 5.69884, 1, 1, 1, 1, 1,
0.04302828, -0.1645392, 1.619805, 1, 1, 1, 1, 1,
0.0436629, 0.1869872, 0.4591665, 1, 1, 1, 1, 1,
0.04384074, 0.2007172, 0.8367951, 1, 1, 1, 1, 1,
0.04507598, -0.4278717, 3.905784, 1, 1, 1, 1, 1,
0.04639545, -1.590696, 2.836397, 1, 1, 1, 1, 1,
0.04855837, 0.2776397, -0.1825712, 1, 1, 1, 1, 1,
0.054586, 0.2600574, -0.6345656, 1, 1, 1, 1, 1,
0.0590921, 0.1936314, -0.8530088, 1, 1, 1, 1, 1,
0.06610849, -0.002429968, 1.688384, 1, 1, 1, 1, 1,
0.06946456, 0.7807693, -1.286698, 1, 1, 1, 1, 1,
0.07204603, -0.3619598, 2.94549, 1, 1, 1, 1, 1,
0.07311346, 1.290552, 0.4225403, 1, 1, 1, 1, 1,
0.07393972, -0.7408034, 3.176815, 1, 1, 1, 1, 1,
0.0821823, 0.8721905, 1.369387, 1, 1, 1, 1, 1,
0.0902901, -0.5332507, 2.437977, 0, 0, 1, 1, 1,
0.09071801, 2.421815, -1.152637, 1, 0, 0, 1, 1,
0.095062, 0.2251814, -0.1731495, 1, 0, 0, 1, 1,
0.09799823, -1.074894, 3.143067, 1, 0, 0, 1, 1,
0.1006587, 1.469544, -2.507086, 1, 0, 0, 1, 1,
0.1044998, -0.4322836, 3.028215, 1, 0, 0, 1, 1,
0.1056194, -0.4383173, 3.789168, 0, 0, 0, 1, 1,
0.1063275, -0.9624697, 1.700545, 0, 0, 0, 1, 1,
0.1087963, 0.7325335, 0.717418, 0, 0, 0, 1, 1,
0.1105618, 0.6461402, -0.1984475, 0, 0, 0, 1, 1,
0.1126154, -0.2709343, 2.030172, 0, 0, 0, 1, 1,
0.1141594, -0.5302128, 2.221752, 0, 0, 0, 1, 1,
0.1157472, 0.4115804, -0.08964749, 0, 0, 0, 1, 1,
0.1198632, 0.08153563, 0.8631701, 1, 1, 1, 1, 1,
0.1206738, -0.2700897, 2.219899, 1, 1, 1, 1, 1,
0.1216086, -1.79667, 3.97128, 1, 1, 1, 1, 1,
0.1299802, -0.06152491, 2.515722, 1, 1, 1, 1, 1,
0.1300733, -2.369609, 4.831275, 1, 1, 1, 1, 1,
0.1331058, -1.213935, 4.557231, 1, 1, 1, 1, 1,
0.1331126, -0.8656258, 1.877499, 1, 1, 1, 1, 1,
0.1358344, -0.6117471, 1.789409, 1, 1, 1, 1, 1,
0.1380701, 0.4083637, 1.487331, 1, 1, 1, 1, 1,
0.1417932, -0.8132949, 2.553611, 1, 1, 1, 1, 1,
0.1476108, 0.9536971, 0.7309479, 1, 1, 1, 1, 1,
0.1505887, -2.14891, 2.810922, 1, 1, 1, 1, 1,
0.1532746, -0.3758162, 4.663193, 1, 1, 1, 1, 1,
0.1587562, -0.703216, 3.936208, 1, 1, 1, 1, 1,
0.1595763, -0.5282108, 3.554191, 1, 1, 1, 1, 1,
0.1596011, -0.8997459, 3.539951, 0, 0, 1, 1, 1,
0.159621, -0.3417328, 2.385819, 1, 0, 0, 1, 1,
0.1607572, -0.1342724, 2.716697, 1, 0, 0, 1, 1,
0.1616474, 0.3300629, 0.56475, 1, 0, 0, 1, 1,
0.163491, -0.2167335, 1.988542, 1, 0, 0, 1, 1,
0.1645308, -1.314728, 2.027142, 1, 0, 0, 1, 1,
0.1670149, -1.078301, 3.348025, 0, 0, 0, 1, 1,
0.1690435, -0.9091395, 2.793099, 0, 0, 0, 1, 1,
0.1713498, -0.4644533, 2.96844, 0, 0, 0, 1, 1,
0.17271, 0.9129808, -0.5533305, 0, 0, 0, 1, 1,
0.1730674, 0.1625578, 2.672052, 0, 0, 0, 1, 1,
0.1752311, 0.2395558, 0.5355501, 0, 0, 0, 1, 1,
0.1759915, 0.703721, 0.6700569, 0, 0, 0, 1, 1,
0.1776635, -0.8076054, 3.651569, 1, 1, 1, 1, 1,
0.1843677, -0.160414, 3.319981, 1, 1, 1, 1, 1,
0.1844297, -0.8909541, 2.22725, 1, 1, 1, 1, 1,
0.1889839, 1.02243, -0.5781825, 1, 1, 1, 1, 1,
0.1908445, 0.5775864, 2.08276, 1, 1, 1, 1, 1,
0.1943347, -0.5994877, 3.243387, 1, 1, 1, 1, 1,
0.2019346, 1.396112, -0.3465233, 1, 1, 1, 1, 1,
0.2032265, 0.1025584, 1.121877, 1, 1, 1, 1, 1,
0.2096598, 1.359393, 0.8342293, 1, 1, 1, 1, 1,
0.2211432, 0.511444, -0.2794811, 1, 1, 1, 1, 1,
0.2223946, -0.4912257, 1.741452, 1, 1, 1, 1, 1,
0.2226266, 1.354067, 2.397477, 1, 1, 1, 1, 1,
0.2235825, -0.4559577, 3.999563, 1, 1, 1, 1, 1,
0.2253232, -0.5410234, 3.751366, 1, 1, 1, 1, 1,
0.2277914, -0.9374211, 1.482571, 1, 1, 1, 1, 1,
0.2301548, -0.315756, 3.425112, 0, 0, 1, 1, 1,
0.2334245, -0.4584256, 4.327967, 1, 0, 0, 1, 1,
0.2338571, 0.06091736, 0.752512, 1, 0, 0, 1, 1,
0.2428127, 0.0317625, 1.729198, 1, 0, 0, 1, 1,
0.2477466, -1.820754, 2.657749, 1, 0, 0, 1, 1,
0.2485986, -3.984143, 5.246678, 1, 0, 0, 1, 1,
0.250812, -0.9866184, 2.381531, 0, 0, 0, 1, 1,
0.2562695, -0.2940901, 2.825763, 0, 0, 0, 1, 1,
0.2580227, -0.2357621, 0.2387139, 0, 0, 0, 1, 1,
0.2584476, 0.5769745, 0.1475982, 0, 0, 0, 1, 1,
0.261292, -0.007589955, 0.004198933, 0, 0, 0, 1, 1,
0.2657915, -0.3110375, 2.327875, 0, 0, 0, 1, 1,
0.2684464, -0.3284478, 2.550432, 0, 0, 0, 1, 1,
0.2690019, -0.3130389, 2.39491, 1, 1, 1, 1, 1,
0.2713805, 0.8399563, 0.5621204, 1, 1, 1, 1, 1,
0.2742782, -2.184982, 2.574119, 1, 1, 1, 1, 1,
0.280184, 1.073826, -1.116873, 1, 1, 1, 1, 1,
0.2802168, -0.9400712, 4.064263, 1, 1, 1, 1, 1,
0.2842354, -0.3749122, 2.140139, 1, 1, 1, 1, 1,
0.2849781, -0.7257191, 2.73754, 1, 1, 1, 1, 1,
0.2857498, -0.3659281, 1.479483, 1, 1, 1, 1, 1,
0.2863191, -1.600066, 2.762918, 1, 1, 1, 1, 1,
0.287385, 1.704199, 0.5007436, 1, 1, 1, 1, 1,
0.289316, -0.5149749, 3.816884, 1, 1, 1, 1, 1,
0.2896467, -2.822736, 1.867766, 1, 1, 1, 1, 1,
0.2903647, -0.7441967, 2.196169, 1, 1, 1, 1, 1,
0.2911539, -0.5523586, 2.782845, 1, 1, 1, 1, 1,
0.2982838, -2.339947, 1.946845, 1, 1, 1, 1, 1,
0.3015375, -0.2106972, 3.540305, 0, 0, 1, 1, 1,
0.3039646, 0.8284725, -1.415575, 1, 0, 0, 1, 1,
0.3056023, 0.4224075, 0.7021424, 1, 0, 0, 1, 1,
0.3065403, -1.562916, 2.686398, 1, 0, 0, 1, 1,
0.3087919, 0.1497981, 1.606291, 1, 0, 0, 1, 1,
0.3107902, 0.6925769, -0.2118557, 1, 0, 0, 1, 1,
0.3151111, 0.1617826, 2.455222, 0, 0, 0, 1, 1,
0.3165904, -0.1425783, 1.187723, 0, 0, 0, 1, 1,
0.3180636, 1.576168, -2.038123, 0, 0, 0, 1, 1,
0.3191189, -0.03035967, 2.342886, 0, 0, 0, 1, 1,
0.3191703, 0.1537843, 1.193954, 0, 0, 0, 1, 1,
0.3216113, -0.701164, 3.786922, 0, 0, 0, 1, 1,
0.3231953, -0.2250361, 1.833429, 0, 0, 0, 1, 1,
0.3243506, 0.1111605, -0.1215399, 1, 1, 1, 1, 1,
0.3300776, -0.5149654, 2.749745, 1, 1, 1, 1, 1,
0.3302991, 1.574893, -1.09009, 1, 1, 1, 1, 1,
0.3322947, -0.2153653, 1.56553, 1, 1, 1, 1, 1,
0.3370253, 0.2110231, -1.196158, 1, 1, 1, 1, 1,
0.3376015, -0.2460234, 2.158428, 1, 1, 1, 1, 1,
0.3382472, 0.4851755, 0.5742903, 1, 1, 1, 1, 1,
0.3416905, -0.3834208, 1.979648, 1, 1, 1, 1, 1,
0.3429648, -1.517797, 4.221875, 1, 1, 1, 1, 1,
0.3486063, -0.5765314, 0.7890642, 1, 1, 1, 1, 1,
0.3553225, -0.5863745, 2.881632, 1, 1, 1, 1, 1,
0.3582606, 0.4366706, 0.7713951, 1, 1, 1, 1, 1,
0.3639468, -0.09066502, 2.057614, 1, 1, 1, 1, 1,
0.3647989, -0.2351177, 0.7349615, 1, 1, 1, 1, 1,
0.3677357, -0.1536752, 1.363559, 1, 1, 1, 1, 1,
0.3679209, -0.728159, 4.661166, 0, 0, 1, 1, 1,
0.3691489, -0.5687187, 2.593764, 1, 0, 0, 1, 1,
0.3708947, -0.2871233, 0.1623287, 1, 0, 0, 1, 1,
0.3724987, -0.2128438, 2.977851, 1, 0, 0, 1, 1,
0.3742993, -1.580468, 3.189566, 1, 0, 0, 1, 1,
0.3745362, 0.6478648, -0.3560164, 1, 0, 0, 1, 1,
0.3794093, 1.712276, 0.7722727, 0, 0, 0, 1, 1,
0.3794143, 0.7866415, 0.7415159, 0, 0, 0, 1, 1,
0.3825426, 1.128614, 1.275733, 0, 0, 0, 1, 1,
0.3868836, -1.475958, 4.251763, 0, 0, 0, 1, 1,
0.3912718, -0.09180765, 0.2280772, 0, 0, 0, 1, 1,
0.3912759, -0.3633364, 0.9950551, 0, 0, 0, 1, 1,
0.39444, 1.388643, -1.029243, 0, 0, 0, 1, 1,
0.4033333, 0.4019365, 0.4971873, 1, 1, 1, 1, 1,
0.4034849, -0.743534, 3.498921, 1, 1, 1, 1, 1,
0.4036686, -0.5787643, 1.959447, 1, 1, 1, 1, 1,
0.4054097, -0.1591411, 4.805234, 1, 1, 1, 1, 1,
0.4064009, 0.3901658, 0.2676557, 1, 1, 1, 1, 1,
0.4080944, -0.3014339, 1.724707, 1, 1, 1, 1, 1,
0.4129312, -0.8283955, 3.217176, 1, 1, 1, 1, 1,
0.415934, -1.648737, 3.244037, 1, 1, 1, 1, 1,
0.4162735, 0.1620906, 2.010347, 1, 1, 1, 1, 1,
0.4199621, 1.495386, 0.3388759, 1, 1, 1, 1, 1,
0.4199787, -0.8125407, 2.704254, 1, 1, 1, 1, 1,
0.4247873, 0.2097313, 1.195492, 1, 1, 1, 1, 1,
0.4273109, 1.601008, -1.772894, 1, 1, 1, 1, 1,
0.4298345, -1.391612, 1.187496, 1, 1, 1, 1, 1,
0.432585, 0.01673339, 2.385469, 1, 1, 1, 1, 1,
0.4367999, -0.8293145, 0.353986, 0, 0, 1, 1, 1,
0.4374576, -0.6091441, 3.257122, 1, 0, 0, 1, 1,
0.4418132, 2.203187, 1.936477, 1, 0, 0, 1, 1,
0.4460877, 0.9227261, 0.4533001, 1, 0, 0, 1, 1,
0.4469703, -1.323091, 1.10386, 1, 0, 0, 1, 1,
0.4486583, -1.675877, 0.9650487, 1, 0, 0, 1, 1,
0.4498859, 0.6764364, 2.336447, 0, 0, 0, 1, 1,
0.4515857, -1.081766, 3.898474, 0, 0, 0, 1, 1,
0.4597363, 0.6074648, 1.699746, 0, 0, 0, 1, 1,
0.4641978, -0.4022015, 0.4869029, 0, 0, 0, 1, 1,
0.4703679, -0.4251527, 3.255427, 0, 0, 0, 1, 1,
0.471671, 1.724324, -0.6644922, 0, 0, 0, 1, 1,
0.4731627, -0.343103, 1.631183, 0, 0, 0, 1, 1,
0.4819106, 0.7371582, -1.200835, 1, 1, 1, 1, 1,
0.4902829, -0.5952173, 2.485289, 1, 1, 1, 1, 1,
0.4909653, 0.4198208, 2.051195, 1, 1, 1, 1, 1,
0.4972203, 0.5859526, 1.014532, 1, 1, 1, 1, 1,
0.4989213, 1.475644, 0.9125705, 1, 1, 1, 1, 1,
0.4996195, 0.5959452, 0.575763, 1, 1, 1, 1, 1,
0.5021138, -0.6341245, 1.555631, 1, 1, 1, 1, 1,
0.5025514, 1.328086, 0.3623288, 1, 1, 1, 1, 1,
0.5025969, -2.065551, 3.071219, 1, 1, 1, 1, 1,
0.5037919, 0.1732098, 0.9741569, 1, 1, 1, 1, 1,
0.5047876, 0.9494157, -0.4971771, 1, 1, 1, 1, 1,
0.515579, -0.4270489, 2.371228, 1, 1, 1, 1, 1,
0.5215677, -0.5279531, 2.122711, 1, 1, 1, 1, 1,
0.52193, -0.01297053, 2.259788, 1, 1, 1, 1, 1,
0.5232882, -0.4328808, 2.99804, 1, 1, 1, 1, 1,
0.5234961, -0.5167146, 2.582228, 0, 0, 1, 1, 1,
0.5236667, -0.2459726, 1.618366, 1, 0, 0, 1, 1,
0.5316308, 1.005131, 0.6150405, 1, 0, 0, 1, 1,
0.5353519, -2.313035, 4.011192, 1, 0, 0, 1, 1,
0.5372512, 0.04053601, 1.588797, 1, 0, 0, 1, 1,
0.5407068, -0.6678641, 0.8879505, 1, 0, 0, 1, 1,
0.5434744, -0.2597378, 1.269901, 0, 0, 0, 1, 1,
0.5470793, 1.175551, 1.29156, 0, 0, 0, 1, 1,
0.5480332, -0.09006491, 2.136857, 0, 0, 0, 1, 1,
0.5482182, 1.713821, 0.6180379, 0, 0, 0, 1, 1,
0.5496792, -0.106723, 2.24141, 0, 0, 0, 1, 1,
0.5540352, -0.6246418, 0.9466078, 0, 0, 0, 1, 1,
0.5546266, 2.324711, 0.4550956, 0, 0, 0, 1, 1,
0.55484, -0.6208905, 3.859115, 1, 1, 1, 1, 1,
0.5579236, -1.702961, 3.561902, 1, 1, 1, 1, 1,
0.560306, -0.349575, 3.127733, 1, 1, 1, 1, 1,
0.5640948, 0.01211005, 1.245352, 1, 1, 1, 1, 1,
0.5658203, -0.2199117, 0.09768225, 1, 1, 1, 1, 1,
0.5674171, 0.1769547, 1.815252, 1, 1, 1, 1, 1,
0.5675297, 0.1286261, 0.6872774, 1, 1, 1, 1, 1,
0.5679148, -1.017447, 2.671722, 1, 1, 1, 1, 1,
0.5773117, 0.02305974, 1.456259, 1, 1, 1, 1, 1,
0.5786983, 0.9296049, 0.7123947, 1, 1, 1, 1, 1,
0.5802785, -0.5484928, 2.697683, 1, 1, 1, 1, 1,
0.5809713, 1.129747, 2.217987, 1, 1, 1, 1, 1,
0.5822023, -0.9181755, 2.610233, 1, 1, 1, 1, 1,
0.5853418, -0.8566891, 2.785504, 1, 1, 1, 1, 1,
0.5862591, -0.2653241, 3.624096, 1, 1, 1, 1, 1,
0.586378, 0.2905846, 1.409068, 0, 0, 1, 1, 1,
0.586718, 2.015625, 0.6677753, 1, 0, 0, 1, 1,
0.5892171, 0.0924583, 0.7315882, 1, 0, 0, 1, 1,
0.5963632, 0.01812067, 1.472863, 1, 0, 0, 1, 1,
0.5987347, 1.477293, -0.3838758, 1, 0, 0, 1, 1,
0.5993371, 0.6630286, 3.320447, 1, 0, 0, 1, 1,
0.6003797, -0.07855559, 1.873143, 0, 0, 0, 1, 1,
0.6032687, -0.02475409, 1.751178, 0, 0, 0, 1, 1,
0.6036044, 0.4062243, 1.519945, 0, 0, 0, 1, 1,
0.6062237, -0.2605562, 1.808956, 0, 0, 0, 1, 1,
0.6071252, -0.0869554, 2.980408, 0, 0, 0, 1, 1,
0.6106312, 0.488947, 0.6665906, 0, 0, 0, 1, 1,
0.6170362, -0.2697928, 2.019748, 0, 0, 0, 1, 1,
0.6181888, -0.3082458, 1.064589, 1, 1, 1, 1, 1,
0.6272526, 0.5633845, 1.375353, 1, 1, 1, 1, 1,
0.6301161, 0.5046001, 1.409266, 1, 1, 1, 1, 1,
0.6378641, -0.6077387, 3.285303, 1, 1, 1, 1, 1,
0.6383899, -0.3533805, 1.42219, 1, 1, 1, 1, 1,
0.6384338, 0.6826558, 0.6576129, 1, 1, 1, 1, 1,
0.6396939, 0.2034086, 1.844973, 1, 1, 1, 1, 1,
0.6454905, -0.5823915, 2.215371, 1, 1, 1, 1, 1,
0.650892, 0.04567108, 1.325936, 1, 1, 1, 1, 1,
0.6523786, 2.563078, 1.19769, 1, 1, 1, 1, 1,
0.6527337, 0.8280753, -0.1362232, 1, 1, 1, 1, 1,
0.6528293, 0.2300049, -0.100078, 1, 1, 1, 1, 1,
0.6531512, -0.2397544, 1.190024, 1, 1, 1, 1, 1,
0.6560552, -0.498341, 3.44965, 1, 1, 1, 1, 1,
0.6561803, -0.2185151, 1.366904, 1, 1, 1, 1, 1,
0.6596032, -1.725699, 3.608162, 0, 0, 1, 1, 1,
0.6612285, 1.092768, 0.4238789, 1, 0, 0, 1, 1,
0.6634097, 1.852277, -0.8784845, 1, 0, 0, 1, 1,
0.6654912, 0.2353591, 0.7892034, 1, 0, 0, 1, 1,
0.6732517, 2.587671, 1.802654, 1, 0, 0, 1, 1,
0.6762192, -1.514245, 4.292653, 1, 0, 0, 1, 1,
0.6796243, -1.265917, 2.060888, 0, 0, 0, 1, 1,
0.6820946, 0.8080778, 1.281685, 0, 0, 0, 1, 1,
0.6906081, -0.5974558, 2.795873, 0, 0, 0, 1, 1,
0.6912428, -0.4882976, 3.980468, 0, 0, 0, 1, 1,
0.6918122, -0.2158985, 0.7958096, 0, 0, 0, 1, 1,
0.6962785, 0.1438125, 1.273488, 0, 0, 0, 1, 1,
0.6991646, 0.0124195, -0.5611175, 0, 0, 0, 1, 1,
0.7004318, -0.4717076, 2.379931, 1, 1, 1, 1, 1,
0.7030643, -0.1642697, 2.412772, 1, 1, 1, 1, 1,
0.7052188, 0.555833, 1.052671, 1, 1, 1, 1, 1,
0.7108619, 0.9652707, 0.2663396, 1, 1, 1, 1, 1,
0.7111346, 0.3742951, 0.709361, 1, 1, 1, 1, 1,
0.7130553, 3.0245, 0.01021494, 1, 1, 1, 1, 1,
0.7133068, -0.329151, 2.897722, 1, 1, 1, 1, 1,
0.7245833, -0.1647693, 3.608201, 1, 1, 1, 1, 1,
0.7285793, 0.03673543, 0.9078539, 1, 1, 1, 1, 1,
0.7415236, -0.5145944, 2.07972, 1, 1, 1, 1, 1,
0.7441916, 0.8340534, 0.9989865, 1, 1, 1, 1, 1,
0.744234, -3.073887, 3.076146, 1, 1, 1, 1, 1,
0.7469962, 0.7030423, 2.009881, 1, 1, 1, 1, 1,
0.7479713, 0.3822234, 1.246165, 1, 1, 1, 1, 1,
0.7489373, -0.2013987, 2.667167, 1, 1, 1, 1, 1,
0.753575, 1.099862, 0.0564689, 0, 0, 1, 1, 1,
0.75789, -2.124605, 3.820962, 1, 0, 0, 1, 1,
0.758274, -0.5039107, 2.05576, 1, 0, 0, 1, 1,
0.7592684, -1.172775, 1.277888, 1, 0, 0, 1, 1,
0.764917, -1.055189, 2.072474, 1, 0, 0, 1, 1,
0.7717127, 0.8831874, -0.5925041, 1, 0, 0, 1, 1,
0.7805748, -0.3572171, 3.589582, 0, 0, 0, 1, 1,
0.7871668, 0.9425582, 0.6463767, 0, 0, 0, 1, 1,
0.787782, 2.225583, -0.5157094, 0, 0, 0, 1, 1,
0.7959755, 0.5628352, 0.483959, 0, 0, 0, 1, 1,
0.7962999, -1.519534, 2.81737, 0, 0, 0, 1, 1,
0.7990717, -0.2034371, 3.59683, 0, 0, 0, 1, 1,
0.8029086, -1.033299, 2.974351, 0, 0, 0, 1, 1,
0.8080929, -2.342139, 0.2803217, 1, 1, 1, 1, 1,
0.8141397, -1.635124, 2.290405, 1, 1, 1, 1, 1,
0.8191007, 0.5396316, 2.40528, 1, 1, 1, 1, 1,
0.8274915, 0.7990779, -0.4691775, 1, 1, 1, 1, 1,
0.8337313, 1.07163, 1.75576, 1, 1, 1, 1, 1,
0.8342234, -0.144285, 1.657597, 1, 1, 1, 1, 1,
0.8345831, -0.6711827, 2.207886, 1, 1, 1, 1, 1,
0.8442655, 1.549134, -0.63689, 1, 1, 1, 1, 1,
0.8469697, 1.254803, -0.5873414, 1, 1, 1, 1, 1,
0.8522509, 0.05919287, 2.288692, 1, 1, 1, 1, 1,
0.8550003, 0.4784497, 1.815451, 1, 1, 1, 1, 1,
0.8551379, -0.7744427, 2.113547, 1, 1, 1, 1, 1,
0.859004, 1.269591, 0.4967371, 1, 1, 1, 1, 1,
0.8625655, 1.400335, 1.288366, 1, 1, 1, 1, 1,
0.8650958, 0.3646915, -0.2286325, 1, 1, 1, 1, 1,
0.8685293, 0.2318061, 2.393431, 0, 0, 1, 1, 1,
0.8711261, -2.307386, 2.558375, 1, 0, 0, 1, 1,
0.8856798, -0.1945267, 1.851234, 1, 0, 0, 1, 1,
0.8866564, -0.172653, 0.142028, 1, 0, 0, 1, 1,
0.8869846, -1.385977, 4.30478, 1, 0, 0, 1, 1,
0.9049053, -0.2405263, 2.89823, 1, 0, 0, 1, 1,
0.9057429, 0.007379485, 3.201699, 0, 0, 0, 1, 1,
0.909047, -1.025507, 1.961309, 0, 0, 0, 1, 1,
0.9101401, -0.1966708, 3.223106, 0, 0, 0, 1, 1,
0.9109074, -0.1546251, 2.296257, 0, 0, 0, 1, 1,
0.9130918, -1.236317, 1.064526, 0, 0, 0, 1, 1,
0.917506, -0.5027416, 3.129115, 0, 0, 0, 1, 1,
0.9182722, 1.472973, 1.190709, 0, 0, 0, 1, 1,
0.9212027, 0.2600277, 0.9177028, 1, 1, 1, 1, 1,
0.9229091, 1.04298, -0.01545187, 1, 1, 1, 1, 1,
0.9244263, 0.6535655, 1.800028, 1, 1, 1, 1, 1,
0.9250965, 0.1005115, 0.9623791, 1, 1, 1, 1, 1,
0.9263448, -0.8319015, 1.691793, 1, 1, 1, 1, 1,
0.9266637, 2.641914, 0.2618177, 1, 1, 1, 1, 1,
0.9408208, 0.2267047, 2.217176, 1, 1, 1, 1, 1,
0.949573, 0.8479738, 1.218542, 1, 1, 1, 1, 1,
0.9516904, 0.1961945, 1.674869, 1, 1, 1, 1, 1,
0.9608452, -1.5775, 2.473513, 1, 1, 1, 1, 1,
0.9617177, -1.251727, 4.915816, 1, 1, 1, 1, 1,
0.9623471, 0.3177649, 2.217297, 1, 1, 1, 1, 1,
0.9633524, -0.2707441, 2.903875, 1, 1, 1, 1, 1,
0.9667153, -0.3735329, 2.132722, 1, 1, 1, 1, 1,
0.9671484, 0.3034883, 1.386024, 1, 1, 1, 1, 1,
0.9677408, -0.5530042, 1.955261, 0, 0, 1, 1, 1,
0.9694698, 0.2042423, 1.675386, 1, 0, 0, 1, 1,
0.9753417, -1.765569, 3.706157, 1, 0, 0, 1, 1,
0.9762048, -0.313327, 2.734049, 1, 0, 0, 1, 1,
0.9778191, 0.3693742, -0.6356771, 1, 0, 0, 1, 1,
0.9783332, -1.464798, 4.32543, 1, 0, 0, 1, 1,
0.9862944, 1.354279, -0.4396063, 0, 0, 0, 1, 1,
0.9896992, 0.02742619, 2.851294, 0, 0, 0, 1, 1,
0.9905687, -1.485197, 1.899071, 0, 0, 0, 1, 1,
0.9946157, 0.03486976, 1.064484, 0, 0, 0, 1, 1,
0.9967558, -0.775706, 1.72064, 0, 0, 0, 1, 1,
1.000443, 1.538127, 1.003274, 0, 0, 0, 1, 1,
1.004212, -0.9438722, 3.229817, 0, 0, 0, 1, 1,
1.005676, -0.3170719, 3.348439, 1, 1, 1, 1, 1,
1.00671, -0.5781505, 3.154882, 1, 1, 1, 1, 1,
1.009186, -0.06847816, -0.01126064, 1, 1, 1, 1, 1,
1.011032, 0.45107, 1.441242, 1, 1, 1, 1, 1,
1.012895, -1.056456, 2.136283, 1, 1, 1, 1, 1,
1.014638, -0.265734, -0.6016622, 1, 1, 1, 1, 1,
1.026213, -0.3213767, 1.909843, 1, 1, 1, 1, 1,
1.029206, 0.07351986, 2.504039, 1, 1, 1, 1, 1,
1.035953, -0.09090474, 0.3739079, 1, 1, 1, 1, 1,
1.037403, -1.537748, 3.884135, 1, 1, 1, 1, 1,
1.048646, 0.4164245, 1.340466, 1, 1, 1, 1, 1,
1.049958, 2.313782, -0.03582814, 1, 1, 1, 1, 1,
1.058997, -1.484576, 2.71133, 1, 1, 1, 1, 1,
1.064551, 1.186584, -0.4935545, 1, 1, 1, 1, 1,
1.066161, -1.256695, 2.115984, 1, 1, 1, 1, 1,
1.067328, 2.973505, -0.007366505, 0, 0, 1, 1, 1,
1.07782, -1.590013, 1.620185, 1, 0, 0, 1, 1,
1.080352, -0.8128766, 2.567773, 1, 0, 0, 1, 1,
1.091536, 0.9108094, 1.586048, 1, 0, 0, 1, 1,
1.094022, 0.9446907, 1.337584, 1, 0, 0, 1, 1,
1.100454, 2.060121, 1.055535, 1, 0, 0, 1, 1,
1.104027, 1.14449, -0.8705021, 0, 0, 0, 1, 1,
1.109789, -0.1818273, 1.546829, 0, 0, 0, 1, 1,
1.120578, 1.444343, 0.40258, 0, 0, 0, 1, 1,
1.121193, -0.9861958, 1.529368, 0, 0, 0, 1, 1,
1.122421, -0.5358922, 2.298315, 0, 0, 0, 1, 1,
1.125141, 1.164383, 0.3709658, 0, 0, 0, 1, 1,
1.125656, 0.3529637, 2.105143, 0, 0, 0, 1, 1,
1.168688, -0.01527942, 2.377187, 1, 1, 1, 1, 1,
1.169883, -0.1455842, 1.34955, 1, 1, 1, 1, 1,
1.170308, 0.4470595, -0.486952, 1, 1, 1, 1, 1,
1.181676, -1.503092, 1.076336, 1, 1, 1, 1, 1,
1.191167, -0.8006982, 1.968603, 1, 1, 1, 1, 1,
1.200627, -2.797088, 4.064457, 1, 1, 1, 1, 1,
1.210782, 1.313227, 0.2281927, 1, 1, 1, 1, 1,
1.212854, 0.1797114, 0.01277108, 1, 1, 1, 1, 1,
1.236675, 0.7756788, -0.1354616, 1, 1, 1, 1, 1,
1.245352, 0.3010614, 1.294768, 1, 1, 1, 1, 1,
1.270956, -1.735212, 2.44623, 1, 1, 1, 1, 1,
1.274893, -1.052069, 1.790956, 1, 1, 1, 1, 1,
1.28112, 1.083698, 0.6115059, 1, 1, 1, 1, 1,
1.29748, 1.497144, -0.1404222, 1, 1, 1, 1, 1,
1.298368, 0.5907325, -0.02745683, 1, 1, 1, 1, 1,
1.301859, -0.4337253, 2.374596, 0, 0, 1, 1, 1,
1.308954, -0.5208908, 1.278485, 1, 0, 0, 1, 1,
1.310785, 0.5885949, 0.8426536, 1, 0, 0, 1, 1,
1.321485, 0.2925538, 2.348504, 1, 0, 0, 1, 1,
1.327219, 0.6209308, 1.852254, 1, 0, 0, 1, 1,
1.327937, -0.6576591, 3.05803, 1, 0, 0, 1, 1,
1.330349, 2.411891, 0.9998809, 0, 0, 0, 1, 1,
1.331109, 1.286111, 2.335255, 0, 0, 0, 1, 1,
1.331265, 0.476191, 2.167887, 0, 0, 0, 1, 1,
1.334733, -0.01566327, 1.242571, 0, 0, 0, 1, 1,
1.336017, -0.9319474, 1.550425, 0, 0, 0, 1, 1,
1.345413, -0.6144186, 0.2513492, 0, 0, 0, 1, 1,
1.352377, -1.313499, 0.05357613, 0, 0, 0, 1, 1,
1.358238, -0.2589503, 1.585544, 1, 1, 1, 1, 1,
1.359796, 0.6426157, 1.563678, 1, 1, 1, 1, 1,
1.362299, 0.4309022, 1.733851, 1, 1, 1, 1, 1,
1.36243, -1.933833, 2.833753, 1, 1, 1, 1, 1,
1.369548, 0.5705547, 0.3558347, 1, 1, 1, 1, 1,
1.370272, -1.09855, 2.335831, 1, 1, 1, 1, 1,
1.377795, 0.09869443, 0.633025, 1, 1, 1, 1, 1,
1.383495, -0.4818506, 1.553964, 1, 1, 1, 1, 1,
1.384205, -0.5378591, -0.1957343, 1, 1, 1, 1, 1,
1.389908, -1.111481, 2.990832, 1, 1, 1, 1, 1,
1.398181, 0.1039549, 2.60976, 1, 1, 1, 1, 1,
1.406493, 0.1734955, 0.9828065, 1, 1, 1, 1, 1,
1.409471, -2.344875, 3.532931, 1, 1, 1, 1, 1,
1.410152, -1.754908, 2.48189, 1, 1, 1, 1, 1,
1.410506, -0.4054531, 3.171761, 1, 1, 1, 1, 1,
1.4266, 0.1985507, 0.2185033, 0, 0, 1, 1, 1,
1.436851, 0.04738259, 3.508778, 1, 0, 0, 1, 1,
1.44737, 0.4104694, 1.986235, 1, 0, 0, 1, 1,
1.447397, 0.4798077, 2.005041, 1, 0, 0, 1, 1,
1.447711, 0.3601434, 1.77224, 1, 0, 0, 1, 1,
1.458192, 0.0333472, 0.8859729, 1, 0, 0, 1, 1,
1.475705, 0.5510591, 0.2355688, 0, 0, 0, 1, 1,
1.496631, -0.05616545, 1.372421, 0, 0, 0, 1, 1,
1.49765, -0.6753663, 1.683458, 0, 0, 0, 1, 1,
1.513011, 1.070826, 1.349606, 0, 0, 0, 1, 1,
1.514329, 1.269782, -0.8566646, 0, 0, 0, 1, 1,
1.517355, -0.5247136, 2.552823, 0, 0, 0, 1, 1,
1.517536, -0.2192617, 2.33283, 0, 0, 0, 1, 1,
1.533114, 0.6782547, 0.7580935, 1, 1, 1, 1, 1,
1.534122, -1.210839, 1.554577, 1, 1, 1, 1, 1,
1.547893, -1.171344, 1.57536, 1, 1, 1, 1, 1,
1.559246, 1.614881, 0.3963778, 1, 1, 1, 1, 1,
1.568454, -1.537462, 3.272511, 1, 1, 1, 1, 1,
1.574699, 1.9477, 0.2528097, 1, 1, 1, 1, 1,
1.578258, -1.209659, 0.05266335, 1, 1, 1, 1, 1,
1.579664, -0.03320876, 0.5889501, 1, 1, 1, 1, 1,
1.581602, 0.3114156, 0.6475021, 1, 1, 1, 1, 1,
1.582307, -1.219974, 2.188959, 1, 1, 1, 1, 1,
1.598807, -0.538124, 3.386836, 1, 1, 1, 1, 1,
1.607636, -1.057586, 0.7807734, 1, 1, 1, 1, 1,
1.627101, -1.168741, 2.745561, 1, 1, 1, 1, 1,
1.633186, -3.004781, 3.132103, 1, 1, 1, 1, 1,
1.636613, -1.725041, 3.882321, 1, 1, 1, 1, 1,
1.652305, -0.1612635, 4.077569, 0, 0, 1, 1, 1,
1.658399, 0.8841036, 0.2776144, 1, 0, 0, 1, 1,
1.669031, 0.6545982, 1.199866, 1, 0, 0, 1, 1,
1.672896, 0.6122081, 2.258169, 1, 0, 0, 1, 1,
1.673377, -0.1035535, 1.905814, 1, 0, 0, 1, 1,
1.674991, -0.2453998, 4.061238, 1, 0, 0, 1, 1,
1.680671, -0.5691327, 2.29203, 0, 0, 0, 1, 1,
1.680908, -0.5303254, 2.818782, 0, 0, 0, 1, 1,
1.692175, 2.070899, 2.254147, 0, 0, 0, 1, 1,
1.695665, -0.3622897, 1.726353, 0, 0, 0, 1, 1,
1.709929, -0.7344185, 2.561234, 0, 0, 0, 1, 1,
1.714549, 0.7531688, 0.8634331, 0, 0, 0, 1, 1,
1.734045, 0.9566432, -0.5251215, 0, 0, 0, 1, 1,
1.736207, -0.1283837, 0.2063089, 1, 1, 1, 1, 1,
1.753649, 1.968646, 0.7920501, 1, 1, 1, 1, 1,
1.755234, -0.3418131, 1.16754, 1, 1, 1, 1, 1,
1.758651, -0.4088586, 2.415912, 1, 1, 1, 1, 1,
1.76005, -1.262213, 1.256148, 1, 1, 1, 1, 1,
1.765012, 0.753727, 1.31253, 1, 1, 1, 1, 1,
1.766171, -0.7337952, 2.687993, 1, 1, 1, 1, 1,
1.773238, 1.152477, -0.2610688, 1, 1, 1, 1, 1,
1.775163, 1.126713, 0.526555, 1, 1, 1, 1, 1,
1.77582, 0.9143285, -0.2471161, 1, 1, 1, 1, 1,
1.78512, 0.4631207, 3.067916, 1, 1, 1, 1, 1,
1.786413, 0.5023714, 0.6995366, 1, 1, 1, 1, 1,
1.798259, 1.96608, 0.2158843, 1, 1, 1, 1, 1,
1.800955, -0.3934329, 2.462193, 1, 1, 1, 1, 1,
1.812226, -1.464104, 3.313331, 1, 1, 1, 1, 1,
1.838363, -0.5807567, 1.329546, 0, 0, 1, 1, 1,
1.845766, -0.1322241, 1.423769, 1, 0, 0, 1, 1,
1.852705, -0.1909676, 1.970276, 1, 0, 0, 1, 1,
1.856151, -1.736809, 3.266611, 1, 0, 0, 1, 1,
1.860682, 0.808692, 1.525877, 1, 0, 0, 1, 1,
1.871015, 1.682487, -0.02889319, 1, 0, 0, 1, 1,
1.884791, -0.1821106, 2.724689, 0, 0, 0, 1, 1,
1.8975, 0.5677513, 2.538838, 0, 0, 0, 1, 1,
1.904121, -1.602033, 0.5478017, 0, 0, 0, 1, 1,
1.904723, -0.6766093, 2.545322, 0, 0, 0, 1, 1,
1.912988, 0.7494219, -0.4564728, 0, 0, 0, 1, 1,
1.922075, -0.3688366, 1.273499, 0, 0, 0, 1, 1,
1.947481, -0.229683, 0.4451012, 0, 0, 0, 1, 1,
1.949707, 0.5876667, 1.098862, 1, 1, 1, 1, 1,
1.986287, -1.431867, 2.388937, 1, 1, 1, 1, 1,
1.996723, -1.561306, 3.195443, 1, 1, 1, 1, 1,
2.003373, -0.00425526, 2.56225, 1, 1, 1, 1, 1,
2.014766, 1.077516, 2.180799, 1, 1, 1, 1, 1,
2.034415, -1.084092, 2.736163, 1, 1, 1, 1, 1,
2.068624, -0.8909714, 1.164188, 1, 1, 1, 1, 1,
2.070742, 1.288651, -0.1447104, 1, 1, 1, 1, 1,
2.071974, 0.220777, 0.9033069, 1, 1, 1, 1, 1,
2.072431, 0.03866217, 2.084323, 1, 1, 1, 1, 1,
2.072764, 1.348911, 1.139832, 1, 1, 1, 1, 1,
2.081943, -0.8697479, 1.675543, 1, 1, 1, 1, 1,
2.092996, 0.6882873, 2.359125, 1, 1, 1, 1, 1,
2.107889, 0.170924, 1.099194, 1, 1, 1, 1, 1,
2.119957, 1.579567, 0.5255363, 1, 1, 1, 1, 1,
2.122628, -0.1347293, 0.6544014, 0, 0, 1, 1, 1,
2.150316, 1.670235, 1.391435, 1, 0, 0, 1, 1,
2.155537, 0.1418658, 1.648186, 1, 0, 0, 1, 1,
2.156339, 0.6287711, 1.003769, 1, 0, 0, 1, 1,
2.200321, -0.09411785, -0.5708711, 1, 0, 0, 1, 1,
2.259068, 0.8384853, 0.4550225, 1, 0, 0, 1, 1,
2.290246, 1.548925, -0.08050807, 0, 0, 0, 1, 1,
2.307457, 0.006735999, 2.484181, 0, 0, 0, 1, 1,
2.32688, -0.1476041, 1.845137, 0, 0, 0, 1, 1,
2.337494, 0.2792299, 2.702329, 0, 0, 0, 1, 1,
2.376765, -1.336067, 3.7158, 0, 0, 0, 1, 1,
2.523258, -0.8167703, 0.2920543, 0, 0, 0, 1, 1,
2.590435, -0.2695173, 1.773523, 0, 0, 0, 1, 1,
2.646017, -0.8112786, 2.33696, 1, 1, 1, 1, 1,
2.655397, 0.9391284, 0.7815084, 1, 1, 1, 1, 1,
2.722721, -0.4602191, 1.116273, 1, 1, 1, 1, 1,
2.794999, -1.867123, 3.60938, 1, 1, 1, 1, 1,
2.81194, 0.1157716, 2.057544, 1, 1, 1, 1, 1,
2.987748, -2.063983, 1.602987, 1, 1, 1, 1, 1,
3.145673, -0.338088, 1.329331, 1, 1, 1, 1, 1
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
var radius = 10.02355;
var distance = 35.20729;
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
mvMatrix.translate( 0.347337, 0.3601711, -0.5207663 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.20729);
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
