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
-3.472789, 0.339908, -3.033147, 1, 0, 0, 1,
-3.076164, 0.7693993, -3.396776, 1, 0.007843138, 0, 1,
-3.002888, 2.366757, 0.5367009, 1, 0.01176471, 0, 1,
-2.939253, -0.2876029, -3.172959, 1, 0.01960784, 0, 1,
-2.755713, -0.1716898, -2.050818, 1, 0.02352941, 0, 1,
-2.510003, 0.3260532, 0.6322361, 1, 0.03137255, 0, 1,
-2.495455, 0.8192236, -1.541305, 1, 0.03529412, 0, 1,
-2.483851, -0.5435377, -1.554333, 1, 0.04313726, 0, 1,
-2.471696, -1.936362, -1.990222, 1, 0.04705882, 0, 1,
-2.443113, 0.1488692, -1.093202, 1, 0.05490196, 0, 1,
-2.421265, -1.751985, -2.320597, 1, 0.05882353, 0, 1,
-2.412103, -0.9365815, -1.350165, 1, 0.06666667, 0, 1,
-2.372907, -1.284006, -2.162054, 1, 0.07058824, 0, 1,
-2.366974, 0.4514935, -1.33656, 1, 0.07843138, 0, 1,
-2.364096, 0.1410362, -1.165276, 1, 0.08235294, 0, 1,
-2.352075, 0.6550463, -1.276759, 1, 0.09019608, 0, 1,
-2.351781, 0.2362304, -0.3473937, 1, 0.09411765, 0, 1,
-2.337912, 0.924406, 0.05401391, 1, 0.1019608, 0, 1,
-2.327375, 0.09541719, -2.119499, 1, 0.1098039, 0, 1,
-2.306206, 0.6049337, 0.2357218, 1, 0.1137255, 0, 1,
-2.283885, 0.9397511, -0.6210643, 1, 0.1215686, 0, 1,
-2.243794, -0.06704509, -1.889472, 1, 0.1254902, 0, 1,
-2.241333, -0.5829335, -2.601719, 1, 0.1333333, 0, 1,
-2.23131, -2.071741, -3.081078, 1, 0.1372549, 0, 1,
-2.168414, -0.2207503, -0.1166966, 1, 0.145098, 0, 1,
-2.132048, -0.2252005, -1.000891, 1, 0.1490196, 0, 1,
-2.115292, -0.655661, -1.541959, 1, 0.1568628, 0, 1,
-2.094528, 0.2455561, -1.525918, 1, 0.1607843, 0, 1,
-2.092459, 0.7294247, -0.8539136, 1, 0.1686275, 0, 1,
-2.088754, -0.5249389, -0.1192165, 1, 0.172549, 0, 1,
-2.069403, -1.157826, -1.965141, 1, 0.1803922, 0, 1,
-2.053557, 0.4049883, -0.9526865, 1, 0.1843137, 0, 1,
-1.97293, -1.264966, -2.702503, 1, 0.1921569, 0, 1,
-1.969928, 0.006993677, 0.3161289, 1, 0.1960784, 0, 1,
-1.95498, -0.4427844, -1.378018, 1, 0.2039216, 0, 1,
-1.932269, -0.1723396, -0.6726232, 1, 0.2117647, 0, 1,
-1.911439, -0.9539071, -2.343137, 1, 0.2156863, 0, 1,
-1.898908, -0.5080665, -0.9330725, 1, 0.2235294, 0, 1,
-1.896171, 0.3385027, 0.3706747, 1, 0.227451, 0, 1,
-1.894115, -1.522117, -3.363925, 1, 0.2352941, 0, 1,
-1.893397, 1.891077, -1.171341, 1, 0.2392157, 0, 1,
-1.871146, 1.030679, -1.400558, 1, 0.2470588, 0, 1,
-1.85588, 0.9207091, -0.7607834, 1, 0.2509804, 0, 1,
-1.855408, -1.287445, -2.261253, 1, 0.2588235, 0, 1,
-1.854684, 0.08191284, -2.709568, 1, 0.2627451, 0, 1,
-1.849825, 0.4528895, 0.3247026, 1, 0.2705882, 0, 1,
-1.842873, -1.031448, -0.9686778, 1, 0.2745098, 0, 1,
-1.824993, -0.3836056, -1.862024, 1, 0.282353, 0, 1,
-1.81777, 0.2468243, -1.381001, 1, 0.2862745, 0, 1,
-1.813576, -1.203701, -1.270018, 1, 0.2941177, 0, 1,
-1.813535, -0.4247138, -1.654263, 1, 0.3019608, 0, 1,
-1.80978, 0.8593034, -1.148781, 1, 0.3058824, 0, 1,
-1.785631, 0.3815713, -2.205533, 1, 0.3137255, 0, 1,
-1.78309, -0.9512683, -1.424544, 1, 0.3176471, 0, 1,
-1.78188, -0.0483265, -3.152735, 1, 0.3254902, 0, 1,
-1.780762, 0.08697461, -0.9171021, 1, 0.3294118, 0, 1,
-1.779362, 0.7851847, 0.2583283, 1, 0.3372549, 0, 1,
-1.765157, 0.3256507, -2.008973, 1, 0.3411765, 0, 1,
-1.733183, -0.9978389, -3.075474, 1, 0.3490196, 0, 1,
-1.711113, 1.055873, -1.034895, 1, 0.3529412, 0, 1,
-1.705212, 0.8271564, -1.535585, 1, 0.3607843, 0, 1,
-1.704973, -1.366121, -2.818482, 1, 0.3647059, 0, 1,
-1.699525, 1.825475, 0.2519203, 1, 0.372549, 0, 1,
-1.698672, -0.4978654, -0.7593188, 1, 0.3764706, 0, 1,
-1.696845, 0.08259621, -2.733656, 1, 0.3843137, 0, 1,
-1.674022, -0.8513567, 0.0587073, 1, 0.3882353, 0, 1,
-1.666558, 0.1893134, -2.425526, 1, 0.3960784, 0, 1,
-1.645941, -2.342675, -2.295991, 1, 0.4039216, 0, 1,
-1.63599, -0.6534796, -2.425068, 1, 0.4078431, 0, 1,
-1.627077, -1.016152, -2.441983, 1, 0.4156863, 0, 1,
-1.625932, 1.159715, -0.9563749, 1, 0.4196078, 0, 1,
-1.612513, -0.6653646, -2.922974, 1, 0.427451, 0, 1,
-1.597835, 0.7056689, -2.027989, 1, 0.4313726, 0, 1,
-1.594056, -0.6425431, -0.6183308, 1, 0.4392157, 0, 1,
-1.590712, -0.8031816, -2.970318, 1, 0.4431373, 0, 1,
-1.578025, -0.6685247, 0.07206547, 1, 0.4509804, 0, 1,
-1.577975, 0.3881669, -2.321315, 1, 0.454902, 0, 1,
-1.573445, 0.2904458, -2.740904, 1, 0.4627451, 0, 1,
-1.563526, 2.072492, -2.51528, 1, 0.4666667, 0, 1,
-1.532134, -1.334383, -3.498326, 1, 0.4745098, 0, 1,
-1.53168, 1.037819, -1.820604, 1, 0.4784314, 0, 1,
-1.530391, -1.093624, -3.423071, 1, 0.4862745, 0, 1,
-1.524028, 0.1324653, -0.8859442, 1, 0.4901961, 0, 1,
-1.507639, 1.870985, -1.768864, 1, 0.4980392, 0, 1,
-1.506695, 0.7393054, -1.392946, 1, 0.5058824, 0, 1,
-1.49829, -0.7877175, -2.128867, 1, 0.509804, 0, 1,
-1.495363, 0.9669502, -0.988583, 1, 0.5176471, 0, 1,
-1.486606, -0.8282347, -0.08837839, 1, 0.5215687, 0, 1,
-1.484765, 0.06157134, -2.28233, 1, 0.5294118, 0, 1,
-1.467825, -1.052616, -2.40213, 1, 0.5333334, 0, 1,
-1.455531, 0.2125505, -0.4875145, 1, 0.5411765, 0, 1,
-1.425884, -1.00456, -1.240816, 1, 0.5450981, 0, 1,
-1.412219, -0.8172535, -1.317663, 1, 0.5529412, 0, 1,
-1.409303, 0.06235972, -0.5207727, 1, 0.5568628, 0, 1,
-1.40435, -1.522681, -3.093767, 1, 0.5647059, 0, 1,
-1.385298, 0.1774651, -2.250118, 1, 0.5686275, 0, 1,
-1.382527, 1.475748, 0.2734877, 1, 0.5764706, 0, 1,
-1.379909, 0.3812922, -2.237262, 1, 0.5803922, 0, 1,
-1.372173, 0.7004757, -1.716999, 1, 0.5882353, 0, 1,
-1.36595, -0.6752211, -2.033535, 1, 0.5921569, 0, 1,
-1.342682, -0.4930326, -2.95094, 1, 0.6, 0, 1,
-1.339707, -1.382392, -3.446399, 1, 0.6078432, 0, 1,
-1.339663, -0.328884, -2.790958, 1, 0.6117647, 0, 1,
-1.33852, 1.040063, -0.2747796, 1, 0.6196079, 0, 1,
-1.331128, 2.329734, 0.2142061, 1, 0.6235294, 0, 1,
-1.328994, 0.4040706, -0.996674, 1, 0.6313726, 0, 1,
-1.327087, 0.03678451, -0.8686748, 1, 0.6352941, 0, 1,
-1.314019, 0.8037838, -1.05729, 1, 0.6431373, 0, 1,
-1.312806, 1.666107, 1.650387, 1, 0.6470588, 0, 1,
-1.296241, -0.8502045, -1.312587, 1, 0.654902, 0, 1,
-1.285992, 1.992818, 0.3062095, 1, 0.6588235, 0, 1,
-1.272169, 0.3524275, -2.468116, 1, 0.6666667, 0, 1,
-1.268059, 1.520716, -1.649932, 1, 0.6705883, 0, 1,
-1.253251, 1.130862, -1.051864, 1, 0.6784314, 0, 1,
-1.238832, -0.3704909, -2.59015, 1, 0.682353, 0, 1,
-1.238651, -0.5972863, 0.01493695, 1, 0.6901961, 0, 1,
-1.23528, -0.3101875, 0.1908049, 1, 0.6941177, 0, 1,
-1.231812, 0.5425741, 0.1747886, 1, 0.7019608, 0, 1,
-1.222459, -0.1538609, -1.18966, 1, 0.7098039, 0, 1,
-1.221861, -0.3886692, -1.171901, 1, 0.7137255, 0, 1,
-1.22103, -0.838268, -2.584037, 1, 0.7215686, 0, 1,
-1.220787, 0.1339441, -2.190827, 1, 0.7254902, 0, 1,
-1.211395, -0.6518313, -1.410242, 1, 0.7333333, 0, 1,
-1.210388, 0.640802, -2.027704, 1, 0.7372549, 0, 1,
-1.20453, 1.966383, -1.055801, 1, 0.7450981, 0, 1,
-1.203823, -1.253376, -2.761122, 1, 0.7490196, 0, 1,
-1.20319, 0.2392696, -2.687091, 1, 0.7568628, 0, 1,
-1.197787, -1.724438, -0.8682294, 1, 0.7607843, 0, 1,
-1.194348, 1.127202, -0.6314343, 1, 0.7686275, 0, 1,
-1.192375, 0.4082845, 0.3303134, 1, 0.772549, 0, 1,
-1.188836, 0.5013236, -0.6182869, 1, 0.7803922, 0, 1,
-1.183807, 0.4218542, -2.688952, 1, 0.7843137, 0, 1,
-1.165132, -1.324986, -3.664867, 1, 0.7921569, 0, 1,
-1.161522, -0.1665179, -2.86374, 1, 0.7960784, 0, 1,
-1.156386, -0.4291047, -0.8816577, 1, 0.8039216, 0, 1,
-1.154689, -0.3226907, -0.3628893, 1, 0.8117647, 0, 1,
-1.154213, 1.11627, 0.292888, 1, 0.8156863, 0, 1,
-1.151238, 0.9488772, -1.119433, 1, 0.8235294, 0, 1,
-1.1443, -0.08996778, -3.567372, 1, 0.827451, 0, 1,
-1.139341, 1.51432, -1.184577, 1, 0.8352941, 0, 1,
-1.139042, 0.2837296, -1.766547, 1, 0.8392157, 0, 1,
-1.134786, -0.404907, -2.672306, 1, 0.8470588, 0, 1,
-1.132265, -1.26258, -3.52638, 1, 0.8509804, 0, 1,
-1.128999, -0.4380721, -2.454431, 1, 0.8588235, 0, 1,
-1.125665, 0.2708591, 0.01989008, 1, 0.8627451, 0, 1,
-1.120442, -0.8818805, -2.605946, 1, 0.8705882, 0, 1,
-1.119304, 0.8871631, -0.2305846, 1, 0.8745098, 0, 1,
-1.119048, -1.59353, -1.992128, 1, 0.8823529, 0, 1,
-1.114976, -0.117319, -2.504491, 1, 0.8862745, 0, 1,
-1.109099, 1.309874, 0.8693475, 1, 0.8941177, 0, 1,
-1.095988, 1.129798, -0.004944452, 1, 0.8980392, 0, 1,
-1.094806, -0.2872626, -2.28356, 1, 0.9058824, 0, 1,
-1.092787, 1.05889, 0.2448214, 1, 0.9137255, 0, 1,
-1.091187, 0.2519207, -1.656752, 1, 0.9176471, 0, 1,
-1.089426, 0.09100996, -1.063948, 1, 0.9254902, 0, 1,
-1.083006, -0.5496225, -2.962526, 1, 0.9294118, 0, 1,
-1.080571, -0.5785611, -2.503678, 1, 0.9372549, 0, 1,
-1.07777, -0.6023346, -2.883627, 1, 0.9411765, 0, 1,
-1.066635, -0.9902121, -1.668648, 1, 0.9490196, 0, 1,
-1.066133, 0.2284956, -2.119407, 1, 0.9529412, 0, 1,
-1.06334, 0.2511212, -3.300339, 1, 0.9607843, 0, 1,
-1.060658, -0.02306531, -1.426067, 1, 0.9647059, 0, 1,
-1.041356, 1.66572, -0.5828854, 1, 0.972549, 0, 1,
-1.039662, 0.2699451, -0.7164396, 1, 0.9764706, 0, 1,
-1.037151, 1.684575, -0.4511869, 1, 0.9843137, 0, 1,
-1.035964, 0.2144893, 0.5259257, 1, 0.9882353, 0, 1,
-1.028718, -0.7905842, -1.189053, 1, 0.9960784, 0, 1,
-1.028601, 1.392738, 0.4057117, 0.9960784, 1, 0, 1,
-1.020764, 0.4774754, -1.12672, 0.9921569, 1, 0, 1,
-1.016064, 1.185167, 1.301184, 0.9843137, 1, 0, 1,
-1.011839, 1.151639, -2.826313, 0.9803922, 1, 0, 1,
-1.010517, 0.6752989, -2.574996, 0.972549, 1, 0, 1,
-1.008198, 0.7960732, -1.432263, 0.9686275, 1, 0, 1,
-1.003228, -0.2993111, -3.364017, 0.9607843, 1, 0, 1,
-1.000783, -0.9686787, -3.420053, 0.9568627, 1, 0, 1,
-0.9999605, 0.9300557, -1.833177, 0.9490196, 1, 0, 1,
-0.99612, -1.124385, -2.586376, 0.945098, 1, 0, 1,
-0.9827466, -0.9999931, -3.668356, 0.9372549, 1, 0, 1,
-0.9791139, -0.8447765, -2.480162, 0.9333333, 1, 0, 1,
-0.9765166, -0.4610857, -1.234393, 0.9254902, 1, 0, 1,
-0.9654176, 1.821009, -0.1118474, 0.9215686, 1, 0, 1,
-0.9620187, 0.2125978, 0.2664024, 0.9137255, 1, 0, 1,
-0.9553626, 0.1614681, -2.467338, 0.9098039, 1, 0, 1,
-0.9524298, -1.223479, -2.947018, 0.9019608, 1, 0, 1,
-0.9521406, 0.03403724, -1.358086, 0.8941177, 1, 0, 1,
-0.9447361, 0.431895, -0.7061595, 0.8901961, 1, 0, 1,
-0.934172, -0.2392861, -1.82214, 0.8823529, 1, 0, 1,
-0.9329559, -0.7130402, -2.75287, 0.8784314, 1, 0, 1,
-0.9276106, -0.7656572, -0.6681707, 0.8705882, 1, 0, 1,
-0.9265948, 0.6121605, -0.8461076, 0.8666667, 1, 0, 1,
-0.9210304, -0.02063082, -1.78237, 0.8588235, 1, 0, 1,
-0.9208804, 0.1790208, -2.328008, 0.854902, 1, 0, 1,
-0.9152536, -0.921517, -2.920457, 0.8470588, 1, 0, 1,
-0.9092779, -0.9100214, -2.339059, 0.8431373, 1, 0, 1,
-0.9063497, 0.418779, -2.309037, 0.8352941, 1, 0, 1,
-0.9039468, -1.109255, -1.861047, 0.8313726, 1, 0, 1,
-0.9023165, -0.008588398, -0.4791597, 0.8235294, 1, 0, 1,
-0.9015051, -0.9957097, -2.759017, 0.8196079, 1, 0, 1,
-0.8998129, 1.327185, 1.288229, 0.8117647, 1, 0, 1,
-0.8978984, -0.585141, -2.73963, 0.8078431, 1, 0, 1,
-0.8964245, -0.5736786, -3.584884, 0.8, 1, 0, 1,
-0.8913398, 0.9122701, -0.8460096, 0.7921569, 1, 0, 1,
-0.8879026, -1.999917, -3.840206, 0.7882353, 1, 0, 1,
-0.885425, 0.2790001, -0.5103765, 0.7803922, 1, 0, 1,
-0.8854039, -1.265789, -3.783828, 0.7764706, 1, 0, 1,
-0.8839675, 1.170283, 0.3490711, 0.7686275, 1, 0, 1,
-0.8790319, 0.4661386, -0.5914158, 0.7647059, 1, 0, 1,
-0.8618455, -0.502672, -3.47596, 0.7568628, 1, 0, 1,
-0.8611537, -0.7042652, -2.995677, 0.7529412, 1, 0, 1,
-0.8600163, -1.310013, -4.028426, 0.7450981, 1, 0, 1,
-0.8492763, -0.3829679, -0.9462438, 0.7411765, 1, 0, 1,
-0.8487251, 1.778446, -0.7618815, 0.7333333, 1, 0, 1,
-0.8482131, -1.784652, -0.2975326, 0.7294118, 1, 0, 1,
-0.846557, -1.315524, -1.529003, 0.7215686, 1, 0, 1,
-0.8448369, 1.514647, 0.3286963, 0.7176471, 1, 0, 1,
-0.8427217, -0.2192036, -2.736106, 0.7098039, 1, 0, 1,
-0.8424587, 0.2571126, -0.4986763, 0.7058824, 1, 0, 1,
-0.8409823, 2.944618, -2.581433, 0.6980392, 1, 0, 1,
-0.8396765, 0.1418856, 0.1514107, 0.6901961, 1, 0, 1,
-0.8349522, -0.8336834, -3.479842, 0.6862745, 1, 0, 1,
-0.8341399, -1.636439, -1.324666, 0.6784314, 1, 0, 1,
-0.8332158, -0.3654199, -3.468183, 0.6745098, 1, 0, 1,
-0.8301248, -0.2551457, -1.980598, 0.6666667, 1, 0, 1,
-0.8276257, -0.1354961, -3.764493, 0.6627451, 1, 0, 1,
-0.8266473, 0.5288268, 0.2056469, 0.654902, 1, 0, 1,
-0.8246606, 0.105917, -2.083908, 0.6509804, 1, 0, 1,
-0.8227193, -0.590777, -0.7344216, 0.6431373, 1, 0, 1,
-0.8131819, 1.076017, -2.401947, 0.6392157, 1, 0, 1,
-0.8057086, 0.4511213, -1.998213, 0.6313726, 1, 0, 1,
-0.8053768, -1.432857, -3.88381, 0.627451, 1, 0, 1,
-0.802183, 0.1892608, 0.1958107, 0.6196079, 1, 0, 1,
-0.8018044, -0.4294085, -2.567601, 0.6156863, 1, 0, 1,
-0.8004856, -1.282122, -2.960832, 0.6078432, 1, 0, 1,
-0.7987246, 0.3978086, -0.1063945, 0.6039216, 1, 0, 1,
-0.7977684, -0.3526895, -3.488379, 0.5960785, 1, 0, 1,
-0.7949334, -0.2179658, -3.043015, 0.5882353, 1, 0, 1,
-0.7895152, -0.5054609, -3.442587, 0.5843138, 1, 0, 1,
-0.7846399, 0.5518911, -1.327205, 0.5764706, 1, 0, 1,
-0.7796738, 0.7206097, -0.1566032, 0.572549, 1, 0, 1,
-0.77833, -0.5915959, -1.867293, 0.5647059, 1, 0, 1,
-0.7725888, -1.681886, -1.298189, 0.5607843, 1, 0, 1,
-0.7709105, 0.5645471, -1.166765, 0.5529412, 1, 0, 1,
-0.7669265, -1.33822, -3.037423, 0.5490196, 1, 0, 1,
-0.7642012, 0.7438674, -0.7044222, 0.5411765, 1, 0, 1,
-0.7628941, -0.1031902, -1.585616, 0.5372549, 1, 0, 1,
-0.7543645, 1.728333, -1.357471, 0.5294118, 1, 0, 1,
-0.7500451, 0.1628217, -0.4589334, 0.5254902, 1, 0, 1,
-0.7475579, -1.803375, -1.820452, 0.5176471, 1, 0, 1,
-0.744453, 1.360553, -0.1516645, 0.5137255, 1, 0, 1,
-0.7388768, 0.6947507, -1.546857, 0.5058824, 1, 0, 1,
-0.7366774, 1.998423, 1.555969, 0.5019608, 1, 0, 1,
-0.735507, -0.7646565, -2.193025, 0.4941176, 1, 0, 1,
-0.7287291, -0.07155699, -2.062691, 0.4862745, 1, 0, 1,
-0.7281473, -1.455792, -0.820556, 0.4823529, 1, 0, 1,
-0.7247614, -0.1088025, -1.362119, 0.4745098, 1, 0, 1,
-0.7246284, -0.5814132, -3.341844, 0.4705882, 1, 0, 1,
-0.7217021, 0.9204735, -0.4370506, 0.4627451, 1, 0, 1,
-0.7179262, -1.166421, -2.366648, 0.4588235, 1, 0, 1,
-0.717598, 0.3125833, -2.29601, 0.4509804, 1, 0, 1,
-0.7121632, 0.7969952, -0.4998453, 0.4470588, 1, 0, 1,
-0.7049128, 0.3810758, 0.325891, 0.4392157, 1, 0, 1,
-0.7011809, 0.5584643, -1.945064, 0.4352941, 1, 0, 1,
-0.7005237, -1.135759, -3.375304, 0.427451, 1, 0, 1,
-0.6936787, -2.262624, -2.146478, 0.4235294, 1, 0, 1,
-0.691873, 0.8547638, -0.5346358, 0.4156863, 1, 0, 1,
-0.685908, -1.070218, -2.223992, 0.4117647, 1, 0, 1,
-0.6843379, -0.9141101, -1.821203, 0.4039216, 1, 0, 1,
-0.6840601, 0.3750704, -0.9217969, 0.3960784, 1, 0, 1,
-0.6835929, -0.3398882, -1.196025, 0.3921569, 1, 0, 1,
-0.6835179, 0.4597115, -0.8991548, 0.3843137, 1, 0, 1,
-0.680088, -1.412468, -2.214371, 0.3803922, 1, 0, 1,
-0.6800496, 5.466424e-05, -3.126972, 0.372549, 1, 0, 1,
-0.6756019, 0.8775582, 0.7279594, 0.3686275, 1, 0, 1,
-0.6740185, 1.696255, 0.6564493, 0.3607843, 1, 0, 1,
-0.6707991, 0.6804613, -0.5547397, 0.3568628, 1, 0, 1,
-0.6666088, -2.181826, -3.224447, 0.3490196, 1, 0, 1,
-0.6639871, 0.1303817, -0.2541348, 0.345098, 1, 0, 1,
-0.6577436, -0.1447131, -0.409088, 0.3372549, 1, 0, 1,
-0.6557501, -1.893388, -2.2221, 0.3333333, 1, 0, 1,
-0.6552263, 1.024857, -0.07241607, 0.3254902, 1, 0, 1,
-0.6540846, 0.6817566, 1.91816, 0.3215686, 1, 0, 1,
-0.6537451, -1.039373, -3.717851, 0.3137255, 1, 0, 1,
-0.6533622, -0.4187916, -0.3511502, 0.3098039, 1, 0, 1,
-0.6524131, 1.014673, 0.6501863, 0.3019608, 1, 0, 1,
-0.6509777, -0.9806567, -0.8324658, 0.2941177, 1, 0, 1,
-0.6487068, -0.6844697, -4.214021, 0.2901961, 1, 0, 1,
-0.637787, 0.2281068, -1.307951, 0.282353, 1, 0, 1,
-0.6320773, -1.343533, -3.36448, 0.2784314, 1, 0, 1,
-0.6320328, -0.8896646, -2.233587, 0.2705882, 1, 0, 1,
-0.6308421, 0.5160969, -1.101176, 0.2666667, 1, 0, 1,
-0.6267822, -0.3691601, -1.155836, 0.2588235, 1, 0, 1,
-0.6259007, -0.4978374, -2.586586, 0.254902, 1, 0, 1,
-0.6215959, 0.2425712, -1.878024, 0.2470588, 1, 0, 1,
-0.6139599, -0.6694347, -3.479458, 0.2431373, 1, 0, 1,
-0.6119659, 0.779422, -0.8220391, 0.2352941, 1, 0, 1,
-0.606703, -0.2045743, -2.27363, 0.2313726, 1, 0, 1,
-0.6066935, 0.009591605, -0.362366, 0.2235294, 1, 0, 1,
-0.5945541, 0.6236346, -0.1345537, 0.2196078, 1, 0, 1,
-0.588309, -0.2322692, -2.002193, 0.2117647, 1, 0, 1,
-0.5845445, 1.912206, 1.739093, 0.2078431, 1, 0, 1,
-0.5820967, -2.131772, -3.980542, 0.2, 1, 0, 1,
-0.5805734, 1.469569, 0.1948016, 0.1921569, 1, 0, 1,
-0.5768499, -1.394435, -1.741729, 0.1882353, 1, 0, 1,
-0.5750582, -1.021081, -4.398304, 0.1803922, 1, 0, 1,
-0.5749471, 0.1349359, -0.5510501, 0.1764706, 1, 0, 1,
-0.5716525, -0.4617215, 0.3877693, 0.1686275, 1, 0, 1,
-0.568902, -0.8078064, -2.760185, 0.1647059, 1, 0, 1,
-0.5592125, -1.281025, -3.174211, 0.1568628, 1, 0, 1,
-0.5579741, -0.04956587, -1.42977, 0.1529412, 1, 0, 1,
-0.55229, 0.7064067, -1.017175, 0.145098, 1, 0, 1,
-0.5518242, 0.00201994, -1.76173, 0.1411765, 1, 0, 1,
-0.5468389, -0.1004541, -3.176027, 0.1333333, 1, 0, 1,
-0.5466796, 0.7479438, -1.967112, 0.1294118, 1, 0, 1,
-0.5444931, -0.6175071, -3.248729, 0.1215686, 1, 0, 1,
-0.5444305, -0.8489827, -1.980179, 0.1176471, 1, 0, 1,
-0.5429672, -1.411184, -3.267115, 0.1098039, 1, 0, 1,
-0.5418713, 0.1139917, -0.9219445, 0.1058824, 1, 0, 1,
-0.5356944, 0.5009656, -1.39317, 0.09803922, 1, 0, 1,
-0.5354608, -0.01053192, -1.690799, 0.09019608, 1, 0, 1,
-0.5301014, -0.5261472, -2.910512, 0.08627451, 1, 0, 1,
-0.5296417, 0.5442293, -0.4066136, 0.07843138, 1, 0, 1,
-0.5290349, -0.2501384, -1.481673, 0.07450981, 1, 0, 1,
-0.5243908, -0.51498, -2.232576, 0.06666667, 1, 0, 1,
-0.5231373, 0.6107149, -0.8030999, 0.0627451, 1, 0, 1,
-0.5212046, -0.2335614, -0.1673352, 0.05490196, 1, 0, 1,
-0.5202826, -2.322829, -1.388902, 0.05098039, 1, 0, 1,
-0.5163476, -0.7595717, -2.695377, 0.04313726, 1, 0, 1,
-0.5117669, -0.6414711, -3.409252, 0.03921569, 1, 0, 1,
-0.5107666, 1.697923, -1.163449, 0.03137255, 1, 0, 1,
-0.4856649, -0.05375728, -0.4476297, 0.02745098, 1, 0, 1,
-0.4853085, 0.8167201, -2.070755, 0.01960784, 1, 0, 1,
-0.4850544, 0.3240755, -1.285622, 0.01568628, 1, 0, 1,
-0.4800657, -0.5497483, -2.775187, 0.007843138, 1, 0, 1,
-0.4791765, -1.240142, -3.118387, 0.003921569, 1, 0, 1,
-0.4789172, 0.995351, -2.279182, 0, 1, 0.003921569, 1,
-0.4770006, 0.5789061, 1.541106, 0, 1, 0.01176471, 1,
-0.47579, 1.464725, -0.03528998, 0, 1, 0.01568628, 1,
-0.4712679, -0.3960224, -2.058833, 0, 1, 0.02352941, 1,
-0.4616464, 1.011178, 0.04758573, 0, 1, 0.02745098, 1,
-0.4604104, -1.738526, -4.070985, 0, 1, 0.03529412, 1,
-0.45796, 0.1546106, -0.930788, 0, 1, 0.03921569, 1,
-0.4538788, 0.02593006, -1.65714, 0, 1, 0.04705882, 1,
-0.4534295, -1.645005, -2.556955, 0, 1, 0.05098039, 1,
-0.451694, -1.968638, -2.936909, 0, 1, 0.05882353, 1,
-0.4488937, 0.09443001, -1.566002, 0, 1, 0.0627451, 1,
-0.4447376, -1.560659, -2.253119, 0, 1, 0.07058824, 1,
-0.4397939, 0.4754556, -1.260122, 0, 1, 0.07450981, 1,
-0.4389963, 0.7871997, -1.946921, 0, 1, 0.08235294, 1,
-0.4337573, -0.1092561, -1.87817, 0, 1, 0.08627451, 1,
-0.4311479, -0.3331271, -1.936127, 0, 1, 0.09411765, 1,
-0.4295539, 1.82603, 0.1415528, 0, 1, 0.1019608, 1,
-0.4270872, -0.7530654, -2.760349, 0, 1, 0.1058824, 1,
-0.4176621, 0.5844736, -0.01458322, 0, 1, 0.1137255, 1,
-0.4121723, -0.6855794, -2.923136, 0, 1, 0.1176471, 1,
-0.411651, -0.8860307, -3.259177, 0, 1, 0.1254902, 1,
-0.4034682, 0.527301, -0.1250859, 0, 1, 0.1294118, 1,
-0.400683, 0.6329597, -1.505092, 0, 1, 0.1372549, 1,
-0.3950522, -0.1108351, -1.500444, 0, 1, 0.1411765, 1,
-0.3945296, -1.538358, -1.874077, 0, 1, 0.1490196, 1,
-0.3942653, -0.4199648, -2.146171, 0, 1, 0.1529412, 1,
-0.3898515, -0.05781363, -2.15526, 0, 1, 0.1607843, 1,
-0.3894801, 0.8994845, -2.008832, 0, 1, 0.1647059, 1,
-0.3893854, -0.2190293, -2.943955, 0, 1, 0.172549, 1,
-0.3890407, 1.739514, -1.337435, 0, 1, 0.1764706, 1,
-0.3877135, -1.642378, -2.010325, 0, 1, 0.1843137, 1,
-0.3875006, 0.5428671, 2.435918, 0, 1, 0.1882353, 1,
-0.3797618, -0.3360085, -3.618449, 0, 1, 0.1960784, 1,
-0.3753158, 0.2842333, -2.827532, 0, 1, 0.2039216, 1,
-0.3749605, 0.9900692, 0.7896137, 0, 1, 0.2078431, 1,
-0.3747317, -1.512821, -1.530259, 0, 1, 0.2156863, 1,
-0.3725753, -1.122789, -3.010698, 0, 1, 0.2196078, 1,
-0.3707923, 0.2080158, -1.678266, 0, 1, 0.227451, 1,
-0.3641401, 0.3514372, -1.737168, 0, 1, 0.2313726, 1,
-0.3597795, -1.414972, -4.413336, 0, 1, 0.2392157, 1,
-0.3595408, -1.153157, -2.929592, 0, 1, 0.2431373, 1,
-0.3589984, 0.02469279, -1.636649, 0, 1, 0.2509804, 1,
-0.3585843, -1.567249, -3.676451, 0, 1, 0.254902, 1,
-0.3576498, 1.24279, -0.008366304, 0, 1, 0.2627451, 1,
-0.3571507, -1.752779, -2.95948, 0, 1, 0.2666667, 1,
-0.3551375, -0.08871569, -1.362425, 0, 1, 0.2745098, 1,
-0.3506884, -0.004624205, -0.5975509, 0, 1, 0.2784314, 1,
-0.3429413, 0.01722434, -2.925935, 0, 1, 0.2862745, 1,
-0.3425183, 0.9207203, -0.7558998, 0, 1, 0.2901961, 1,
-0.3418423, -0.7097779, -2.469303, 0, 1, 0.2980392, 1,
-0.3416327, -1.513097, -1.621341, 0, 1, 0.3058824, 1,
-0.3413543, -0.08949617, -1.290661, 0, 1, 0.3098039, 1,
-0.337281, 1.216903, -2.144373, 0, 1, 0.3176471, 1,
-0.3354295, -0.9292787, -3.4321, 0, 1, 0.3215686, 1,
-0.3353659, 0.05717608, -2.782248, 0, 1, 0.3294118, 1,
-0.3347119, 0.4905281, -0.8966262, 0, 1, 0.3333333, 1,
-0.3335958, 0.0378856, -1.541581, 0, 1, 0.3411765, 1,
-0.3283563, -0.7457245, -2.246993, 0, 1, 0.345098, 1,
-0.3281325, -0.3441674, -0.3205549, 0, 1, 0.3529412, 1,
-0.3278909, 0.4266714, -0.5552986, 0, 1, 0.3568628, 1,
-0.3274724, 1.523727, -0.005821977, 0, 1, 0.3647059, 1,
-0.3258734, -1.07572, -2.031785, 0, 1, 0.3686275, 1,
-0.3251672, 0.7127799, 0.001933928, 0, 1, 0.3764706, 1,
-0.3248486, -1.284597, -2.36887, 0, 1, 0.3803922, 1,
-0.3244966, 2.681688, -0.7607558, 0, 1, 0.3882353, 1,
-0.3244028, -0.6391301, -2.692259, 0, 1, 0.3921569, 1,
-0.3208372, -1.189604, -1.638183, 0, 1, 0.4, 1,
-0.3181548, 1.064489, 0.2516707, 0, 1, 0.4078431, 1,
-0.3181265, 1.861071, 0.7553739, 0, 1, 0.4117647, 1,
-0.3170263, 0.06381811, -1.793983, 0, 1, 0.4196078, 1,
-0.3150414, 0.8434793, -2.038254, 0, 1, 0.4235294, 1,
-0.3140339, -0.2919307, -3.020297, 0, 1, 0.4313726, 1,
-0.3118782, -2.587909, -1.940625, 0, 1, 0.4352941, 1,
-0.3113109, 0.7026119, 0.3486272, 0, 1, 0.4431373, 1,
-0.3076842, -0.008916326, -1.055422, 0, 1, 0.4470588, 1,
-0.3057977, 1.236918, 0.1161525, 0, 1, 0.454902, 1,
-0.3057229, -0.207122, -2.801422, 0, 1, 0.4588235, 1,
-0.2982821, 0.4516244, 0.1788092, 0, 1, 0.4666667, 1,
-0.2940782, -0.1264613, 0.2819511, 0, 1, 0.4705882, 1,
-0.2920259, -0.8870724, -4.269325, 0, 1, 0.4784314, 1,
-0.2868389, -1.050866, -2.013152, 0, 1, 0.4823529, 1,
-0.2846169, -1.553954, -3.001023, 0, 1, 0.4901961, 1,
-0.2825387, -1.768602, -2.733382, 0, 1, 0.4941176, 1,
-0.2808714, -1.827675, -3.241012, 0, 1, 0.5019608, 1,
-0.2786123, -2.194591, -3.117632, 0, 1, 0.509804, 1,
-0.2731407, 1.207931, 0.1912281, 0, 1, 0.5137255, 1,
-0.2725418, -1.272439, -2.840621, 0, 1, 0.5215687, 1,
-0.2723092, -0.4481645, -1.482462, 0, 1, 0.5254902, 1,
-0.2711592, -0.883612, -3.001011, 0, 1, 0.5333334, 1,
-0.2697624, -1.547153, -2.886596, 0, 1, 0.5372549, 1,
-0.2681313, -0.3436498, -1.976071, 0, 1, 0.5450981, 1,
-0.2642916, -0.7829373, -4.697178, 0, 1, 0.5490196, 1,
-0.2584334, -0.3645838, 0.2085278, 0, 1, 0.5568628, 1,
-0.2567343, -1.24193, -1.171718, 0, 1, 0.5607843, 1,
-0.2556595, 0.2199909, -1.4832, 0, 1, 0.5686275, 1,
-0.255026, 0.09943834, -3.518927, 0, 1, 0.572549, 1,
-0.2531328, -2.011376, -3.175054, 0, 1, 0.5803922, 1,
-0.2525495, -1.175779, -2.236221, 0, 1, 0.5843138, 1,
-0.2469545, 0.7669756, 1.150782, 0, 1, 0.5921569, 1,
-0.2415184, -1.923367, -2.162575, 0, 1, 0.5960785, 1,
-0.2414069, -0.2056207, -2.259549, 0, 1, 0.6039216, 1,
-0.237698, -0.2728035, -1.613077, 0, 1, 0.6117647, 1,
-0.2352419, 1.324558, 0.4096759, 0, 1, 0.6156863, 1,
-0.2293777, 1.8215, -0.5791554, 0, 1, 0.6235294, 1,
-0.2238346, -0.7383831, -4.399128, 0, 1, 0.627451, 1,
-0.2236397, 0.4762255, 1.017115, 0, 1, 0.6352941, 1,
-0.2220094, 1.658239, -0.822625, 0, 1, 0.6392157, 1,
-0.2101061, 0.4611442, -1.433707, 0, 1, 0.6470588, 1,
-0.2066775, 0.8642561, 0.1849533, 0, 1, 0.6509804, 1,
-0.2039942, 0.7606351, -1.69955, 0, 1, 0.6588235, 1,
-0.2032791, 0.8416132, 0.9479738, 0, 1, 0.6627451, 1,
-0.1995966, 0.572993, -0.6677575, 0, 1, 0.6705883, 1,
-0.1934052, 1.289999, 1.963931, 0, 1, 0.6745098, 1,
-0.1864086, 1.065221, 1.139947, 0, 1, 0.682353, 1,
-0.1841411, -1.110299, -1.625849, 0, 1, 0.6862745, 1,
-0.1839304, -0.4070145, -1.950921, 0, 1, 0.6941177, 1,
-0.1824314, 1.298835, -0.04681332, 0, 1, 0.7019608, 1,
-0.1792135, -0.236344, -3.363799, 0, 1, 0.7058824, 1,
-0.1789293, -0.2350601, -2.274309, 0, 1, 0.7137255, 1,
-0.1762639, 1.935317, 0.5773553, 0, 1, 0.7176471, 1,
-0.1689795, -0.6078918, -2.517641, 0, 1, 0.7254902, 1,
-0.1687756, 2.045748, -0.8831201, 0, 1, 0.7294118, 1,
-0.1666392, -1.033797, -1.93327, 0, 1, 0.7372549, 1,
-0.1657079, -0.06753012, -2.050158, 0, 1, 0.7411765, 1,
-0.1603124, -1.21446, -2.933617, 0, 1, 0.7490196, 1,
-0.1602304, 1.216497, -0.2460123, 0, 1, 0.7529412, 1,
-0.1576094, 0.7183735, 1.518275, 0, 1, 0.7607843, 1,
-0.1562282, 1.289421, 1.679087, 0, 1, 0.7647059, 1,
-0.1558298, -0.5614107, -2.609571, 0, 1, 0.772549, 1,
-0.1547878, 0.9684005, 1.002716, 0, 1, 0.7764706, 1,
-0.1547603, 1.336901, -0.3732101, 0, 1, 0.7843137, 1,
-0.1512891, 0.6834338, -0.02420999, 0, 1, 0.7882353, 1,
-0.149553, -0.189878, -2.910872, 0, 1, 0.7960784, 1,
-0.1486568, -0.9897633, -3.355192, 0, 1, 0.8039216, 1,
-0.1483944, 1.476451, 0.01147913, 0, 1, 0.8078431, 1,
-0.1428952, 0.5177535, 0.2164247, 0, 1, 0.8156863, 1,
-0.1407331, 0.9928108, -0.3353691, 0, 1, 0.8196079, 1,
-0.1364362, 1.066289, 0.1126758, 0, 1, 0.827451, 1,
-0.1344366, 0.1422601, -0.9887755, 0, 1, 0.8313726, 1,
-0.1339415, 0.1518996, 1.49457, 0, 1, 0.8392157, 1,
-0.1244971, -0.5114318, -1.884, 0, 1, 0.8431373, 1,
-0.1225664, -0.7039503, -2.538401, 0, 1, 0.8509804, 1,
-0.1215781, -0.5164077, -3.611683, 0, 1, 0.854902, 1,
-0.12006, -0.6822512, -1.286392, 0, 1, 0.8627451, 1,
-0.1182216, -0.246742, -0.2732285, 0, 1, 0.8666667, 1,
-0.116818, -2.48166, -4.320895, 0, 1, 0.8745098, 1,
-0.1159224, -0.3857118, -2.836091, 0, 1, 0.8784314, 1,
-0.1140975, -0.5624474, -2.753476, 0, 1, 0.8862745, 1,
-0.1129525, -0.5867426, -4.11165, 0, 1, 0.8901961, 1,
-0.1116321, 0.07342991, -2.214529, 0, 1, 0.8980392, 1,
-0.1103157, 0.4394926, -0.05722978, 0, 1, 0.9058824, 1,
-0.1086528, 1.275375, -0.1994066, 0, 1, 0.9098039, 1,
-0.1066804, 0.1796937, 0.1764188, 0, 1, 0.9176471, 1,
-0.1061325, 0.302846, -0.2160627, 0, 1, 0.9215686, 1,
-0.1043085, 1.219146, 0.5107778, 0, 1, 0.9294118, 1,
-0.1023185, -0.8119078, -3.778821, 0, 1, 0.9333333, 1,
-0.09860243, 1.892253, 0.3436956, 0, 1, 0.9411765, 1,
-0.09836111, -2.464256, -3.915081, 0, 1, 0.945098, 1,
-0.09798088, 0.03242075, -1.150114, 0, 1, 0.9529412, 1,
-0.09617756, -0.9848276, -1.686888, 0, 1, 0.9568627, 1,
-0.09588832, 0.9531146, 0.06872343, 0, 1, 0.9647059, 1,
-0.08782379, -1.341264, -4.639436, 0, 1, 0.9686275, 1,
-0.08658602, -0.8525307, -4.659909, 0, 1, 0.9764706, 1,
-0.08599256, -0.1398163, -0.7488315, 0, 1, 0.9803922, 1,
-0.08258954, -0.6697928, -5.023678, 0, 1, 0.9882353, 1,
-0.08201595, 0.3450537, 0.07263321, 0, 1, 0.9921569, 1,
-0.08119349, -0.0953414, -5.284204, 0, 1, 1, 1,
-0.08100614, -0.9246209, -3.309243, 0, 0.9921569, 1, 1,
-0.07365058, 0.07689457, 0.09571406, 0, 0.9882353, 1, 1,
-0.07238877, -0.01557803, -0.3782444, 0, 0.9803922, 1, 1,
-0.06699067, -0.08391447, -2.246469, 0, 0.9764706, 1, 1,
-0.064727, 0.1075172, -1.16196, 0, 0.9686275, 1, 1,
-0.0616841, -0.0492813, -2.05811, 0, 0.9647059, 1, 1,
-0.06165111, -0.1313519, -2.904461, 0, 0.9568627, 1, 1,
-0.05942738, -0.3166671, -5.35748, 0, 0.9529412, 1, 1,
-0.05726568, -0.02659768, -1.303474, 0, 0.945098, 1, 1,
-0.05514165, -1.680457, -2.887462, 0, 0.9411765, 1, 1,
-0.05231966, 0.293495, 1.471102, 0, 0.9333333, 1, 1,
-0.05196748, -1.596106, -4.154783, 0, 0.9294118, 1, 1,
-0.04619637, 0.3883359, 0.753063, 0, 0.9215686, 1, 1,
-0.04586023, -1.170239, -4.832572, 0, 0.9176471, 1, 1,
-0.044373, -0.7400378, -2.666681, 0, 0.9098039, 1, 1,
-0.04006074, -0.5429592, -2.25268, 0, 0.9058824, 1, 1,
-0.04002151, -0.3993309, -1.740792, 0, 0.8980392, 1, 1,
-0.03727473, 0.3086, 0.4401859, 0, 0.8901961, 1, 1,
-0.03620593, -0.5044679, -3.723321, 0, 0.8862745, 1, 1,
-0.03394154, -0.6442709, -2.630087, 0, 0.8784314, 1, 1,
-0.02755684, 0.5011329, -0.04978466, 0, 0.8745098, 1, 1,
-0.02521443, -0.6658012, -3.941887, 0, 0.8666667, 1, 1,
-0.02228475, 0.5222406, -0.4903925, 0, 0.8627451, 1, 1,
-0.0194611, 1.95913, 0.3033427, 0, 0.854902, 1, 1,
-0.01780668, -1.022434, -2.609348, 0, 0.8509804, 1, 1,
-0.00563642, 1.350283, 1.293473, 0, 0.8431373, 1, 1,
-0.004541229, -0.1987383, -3.415047, 0, 0.8392157, 1, 1,
-0.0005032991, -0.9444925, -2.939858, 0, 0.8313726, 1, 1,
0.002427364, -0.0529014, 2.373667, 0, 0.827451, 1, 1,
0.003340457, 0.6534916, 0.8841863, 0, 0.8196079, 1, 1,
0.005880166, -1.173021, 2.037435, 0, 0.8156863, 1, 1,
0.007370046, 0.2645904, -0.393558, 0, 0.8078431, 1, 1,
0.007929984, 0.3285859, 1.20105, 0, 0.8039216, 1, 1,
0.009729804, -0.3916988, 2.922295, 0, 0.7960784, 1, 1,
0.01035078, 0.4122646, 0.3460439, 0, 0.7882353, 1, 1,
0.02443854, 1.590685, 0.3463572, 0, 0.7843137, 1, 1,
0.02486718, 1.30615, -1.145727, 0, 0.7764706, 1, 1,
0.02523466, 1.671587, -0.3272736, 0, 0.772549, 1, 1,
0.02533095, -1.210954, 5.151593, 0, 0.7647059, 1, 1,
0.02554689, 1.393055, 0.8781707, 0, 0.7607843, 1, 1,
0.0324062, -1.918956, 4.786233, 0, 0.7529412, 1, 1,
0.03413781, -0.1389122, 3.968049, 0, 0.7490196, 1, 1,
0.03785034, -0.6919905, 4.670969, 0, 0.7411765, 1, 1,
0.04364642, -0.424473, 3.232852, 0, 0.7372549, 1, 1,
0.0471016, -1.344348, 2.432879, 0, 0.7294118, 1, 1,
0.04718129, 0.6475213, 0.3225935, 0, 0.7254902, 1, 1,
0.05039665, -0.5329732, 1.267595, 0, 0.7176471, 1, 1,
0.05261125, 0.1843377, -3.195946, 0, 0.7137255, 1, 1,
0.05654333, 0.7993379, 0.5472727, 0, 0.7058824, 1, 1,
0.06052033, -1.079566, 2.923104, 0, 0.6980392, 1, 1,
0.06411967, -0.9134315, 2.834072, 0, 0.6941177, 1, 1,
0.06676231, 0.2778973, 1.60066, 0, 0.6862745, 1, 1,
0.06808119, -1.354887, 3.552323, 0, 0.682353, 1, 1,
0.07675039, 0.567318, -0.9200422, 0, 0.6745098, 1, 1,
0.07738315, 0.3363247, -0.5546653, 0, 0.6705883, 1, 1,
0.07951166, -0.7631817, 3.202034, 0, 0.6627451, 1, 1,
0.08055808, -0.7000349, 3.618656, 0, 0.6588235, 1, 1,
0.08093361, 0.07600239, 0.0003854624, 0, 0.6509804, 1, 1,
0.08521636, -0.2300361, 3.925448, 0, 0.6470588, 1, 1,
0.08544213, 0.8371156, 0.6908379, 0, 0.6392157, 1, 1,
0.09556025, 0.8010434, 0.8601339, 0, 0.6352941, 1, 1,
0.09648781, 0.04148269, 2.239055, 0, 0.627451, 1, 1,
0.1000803, -0.5217692, 4.18229, 0, 0.6235294, 1, 1,
0.1057243, 1.213177, -0.1576956, 0, 0.6156863, 1, 1,
0.1065456, 0.2636286, -0.2050093, 0, 0.6117647, 1, 1,
0.1071958, 0.888891, -1.252647, 0, 0.6039216, 1, 1,
0.1076339, -0.6025639, 1.51761, 0, 0.5960785, 1, 1,
0.1126577, -0.8313665, 4.02849, 0, 0.5921569, 1, 1,
0.1134977, -0.2488915, 1.035631, 0, 0.5843138, 1, 1,
0.1193294, 0.2435369, 1.506823, 0, 0.5803922, 1, 1,
0.119765, -0.4808314, 2.170038, 0, 0.572549, 1, 1,
0.125882, -0.4250659, 3.863945, 0, 0.5686275, 1, 1,
0.1277582, 0.7488276, 1.096315, 0, 0.5607843, 1, 1,
0.1322985, 1.911948, -0.4261231, 0, 0.5568628, 1, 1,
0.1342183, 1.745809, -0.4839979, 0, 0.5490196, 1, 1,
0.1415067, 0.1520073, 1.847118, 0, 0.5450981, 1, 1,
0.1426481, 0.2766738, 0.3219212, 0, 0.5372549, 1, 1,
0.1436013, -1.606805, 4.176933, 0, 0.5333334, 1, 1,
0.1449257, -1.075438, 2.645186, 0, 0.5254902, 1, 1,
0.1491152, 0.8090227, -1.684303, 0, 0.5215687, 1, 1,
0.1499221, 0.8781539, -0.591375, 0, 0.5137255, 1, 1,
0.1512712, 0.6420159, 0.1070702, 0, 0.509804, 1, 1,
0.152234, -1.13464, 4.042269, 0, 0.5019608, 1, 1,
0.1532885, -0.1113493, 2.856897, 0, 0.4941176, 1, 1,
0.1535372, -0.3116566, 1.391786, 0, 0.4901961, 1, 1,
0.1588125, 0.1584975, 0.3038776, 0, 0.4823529, 1, 1,
0.1605043, 0.5724843, 1.389334, 0, 0.4784314, 1, 1,
0.1718488, 0.05604668, 0.3703206, 0, 0.4705882, 1, 1,
0.1737692, -0.5082524, 4.204232, 0, 0.4666667, 1, 1,
0.1740028, 1.351689, 2.362746, 0, 0.4588235, 1, 1,
0.1756805, -1.591733, 2.279514, 0, 0.454902, 1, 1,
0.1788639, 0.6054738, -0.04442932, 0, 0.4470588, 1, 1,
0.1803559, -1.583377, 3.441253, 0, 0.4431373, 1, 1,
0.1822392, -1.834108, 4.923923, 0, 0.4352941, 1, 1,
0.1879773, 0.4665265, 0.2207754, 0, 0.4313726, 1, 1,
0.1898137, 0.2704437, -0.1305763, 0, 0.4235294, 1, 1,
0.1908604, -0.2496088, 4.616462, 0, 0.4196078, 1, 1,
0.1916335, -0.9270275, 2.746652, 0, 0.4117647, 1, 1,
0.1918847, -1.509397, 2.852143, 0, 0.4078431, 1, 1,
0.1997177, 0.6049579, 0.2776764, 0, 0.4, 1, 1,
0.2062511, -0.3261097, 3.11334, 0, 0.3921569, 1, 1,
0.2074563, -0.1866989, 2.22287, 0, 0.3882353, 1, 1,
0.2091651, -1.993783, 2.251311, 0, 0.3803922, 1, 1,
0.2096, 2.491297, -0.9375611, 0, 0.3764706, 1, 1,
0.2116485, 0.9554195, 1.859786, 0, 0.3686275, 1, 1,
0.2182426, -0.3199263, 1.250547, 0, 0.3647059, 1, 1,
0.2221004, -0.1065579, 1.253001, 0, 0.3568628, 1, 1,
0.2295262, -0.90565, 2.904935, 0, 0.3529412, 1, 1,
0.2369708, -0.3520069, 2.228054, 0, 0.345098, 1, 1,
0.2381405, -2.06541, 4.597597, 0, 0.3411765, 1, 1,
0.2390238, -1.149991, 2.481511, 0, 0.3333333, 1, 1,
0.2410278, -0.703253, 3.312038, 0, 0.3294118, 1, 1,
0.2418194, 1.340731, -0.8816156, 0, 0.3215686, 1, 1,
0.2433748, 0.9096817, 0.5829564, 0, 0.3176471, 1, 1,
0.2445162, 2.137437, 0.8782277, 0, 0.3098039, 1, 1,
0.2465127, -1.054915, 3.376356, 0, 0.3058824, 1, 1,
0.2465401, -0.983557, 3.270769, 0, 0.2980392, 1, 1,
0.2513574, 1.509837, 0.8518307, 0, 0.2901961, 1, 1,
0.2516861, -1.228372, 2.917667, 0, 0.2862745, 1, 1,
0.2541163, 0.0262015, 2.762936, 0, 0.2784314, 1, 1,
0.256942, -0.102864, 2.759895, 0, 0.2745098, 1, 1,
0.2582563, -0.3291052, 2.475401, 0, 0.2666667, 1, 1,
0.2613514, -0.9438022, 3.360741, 0, 0.2627451, 1, 1,
0.2627585, 0.9759864, 2.4137, 0, 0.254902, 1, 1,
0.2697306, -3.222517, 2.799099, 0, 0.2509804, 1, 1,
0.2702097, 0.1504516, -0.5919237, 0, 0.2431373, 1, 1,
0.2749614, -1.026692, 2.909917, 0, 0.2392157, 1, 1,
0.2805071, 0.2517564, 0.39781, 0, 0.2313726, 1, 1,
0.2841131, -0.8766904, 3.944059, 0, 0.227451, 1, 1,
0.2868555, 0.25711, 0.03209936, 0, 0.2196078, 1, 1,
0.2886205, 1.208168, -0.1006394, 0, 0.2156863, 1, 1,
0.2906679, -0.4606454, 2.472335, 0, 0.2078431, 1, 1,
0.2913542, -0.0276508, 3.808823, 0, 0.2039216, 1, 1,
0.292862, 1.118242, -0.917564, 0, 0.1960784, 1, 1,
0.2945111, 1.085366, -0.7944824, 0, 0.1882353, 1, 1,
0.2984084, -0.4220543, 3.441993, 0, 0.1843137, 1, 1,
0.3064492, 0.2346905, 1.038469, 0, 0.1764706, 1, 1,
0.3108552, -2.239974, 3.821102, 0, 0.172549, 1, 1,
0.3125855, -0.99324, 1.659228, 0, 0.1647059, 1, 1,
0.3170321, 2.685857, -1.147747, 0, 0.1607843, 1, 1,
0.3192727, -0.858375, 3.671789, 0, 0.1529412, 1, 1,
0.3226628, 1.170124, -0.5652122, 0, 0.1490196, 1, 1,
0.3228957, -0.226286, 1.848261, 0, 0.1411765, 1, 1,
0.3295992, -0.8688954, 3.820272, 0, 0.1372549, 1, 1,
0.3306379, 0.5201823, 1.688439, 0, 0.1294118, 1, 1,
0.3320677, -0.04657628, 2.37426, 0, 0.1254902, 1, 1,
0.3337842, -0.9073188, 1.42442, 0, 0.1176471, 1, 1,
0.334966, 0.09906854, 0.09299752, 0, 0.1137255, 1, 1,
0.3378176, 1.220978, -0.5798104, 0, 0.1058824, 1, 1,
0.33847, 0.6963186, 1.225935, 0, 0.09803922, 1, 1,
0.341013, -1.682295, 2.174153, 0, 0.09411765, 1, 1,
0.3411898, -1.217797, 3.091707, 0, 0.08627451, 1, 1,
0.3417056, -1.079034, 3.912157, 0, 0.08235294, 1, 1,
0.3484533, 0.5450191, 1.719656, 0, 0.07450981, 1, 1,
0.3498431, -2.788192, 2.1092, 0, 0.07058824, 1, 1,
0.3511897, -1.225972, 2.145339, 0, 0.0627451, 1, 1,
0.352227, -1.20033, 2.648362, 0, 0.05882353, 1, 1,
0.3538564, 0.9591599, 0.02574274, 0, 0.05098039, 1, 1,
0.3554733, -0.7510589, 2.744684, 0, 0.04705882, 1, 1,
0.3570179, -0.7485045, 3.227176, 0, 0.03921569, 1, 1,
0.3586392, 0.328114, 1.229993, 0, 0.03529412, 1, 1,
0.3594588, -2.211852, 2.582891, 0, 0.02745098, 1, 1,
0.3620508, -0.7993119, 3.350198, 0, 0.02352941, 1, 1,
0.3621165, 2.269572, -1.595906, 0, 0.01568628, 1, 1,
0.3632301, 1.005572, -0.1570791, 0, 0.01176471, 1, 1,
0.3669167, -0.8435509, 3.307945, 0, 0.003921569, 1, 1,
0.3677262, 1.029575, 1.281239, 0.003921569, 0, 1, 1,
0.3681514, -0.6194118, 3.017308, 0.007843138, 0, 1, 1,
0.3714083, 0.6464492, -0.4205863, 0.01568628, 0, 1, 1,
0.3769411, -0.4270249, 1.865589, 0.01960784, 0, 1, 1,
0.3775712, 0.1967148, 0.959644, 0.02745098, 0, 1, 1,
0.3785558, 0.4577637, 0.9501141, 0.03137255, 0, 1, 1,
0.3811201, 0.9668019, -0.08121835, 0.03921569, 0, 1, 1,
0.3834869, -0.3740962, 4.553573, 0.04313726, 0, 1, 1,
0.3860399, 0.06475049, 3.023596, 0.05098039, 0, 1, 1,
0.3893834, 0.2220548, 0.1488068, 0.05490196, 0, 1, 1,
0.3947884, 1.127561, 1.689372, 0.0627451, 0, 1, 1,
0.3964236, -0.4288296, 4.033729, 0.06666667, 0, 1, 1,
0.3966895, 0.1864499, -0.7731261, 0.07450981, 0, 1, 1,
0.3974448, 1.613253, 1.358972, 0.07843138, 0, 1, 1,
0.4014462, 0.7781039, -0.2322863, 0.08627451, 0, 1, 1,
0.4021943, -1.065046, 2.836694, 0.09019608, 0, 1, 1,
0.4069495, 0.7736418, 1.049052, 0.09803922, 0, 1, 1,
0.4102115, -0.7605101, 1.971268, 0.1058824, 0, 1, 1,
0.4112552, 0.7321625, -0.6323175, 0.1098039, 0, 1, 1,
0.4124956, -0.7449093, 1.798612, 0.1176471, 0, 1, 1,
0.4185624, -0.1961133, 2.655525, 0.1215686, 0, 1, 1,
0.4193748, 1.215821, 0.7846342, 0.1294118, 0, 1, 1,
0.4258926, -0.2067398, 1.81772, 0.1333333, 0, 1, 1,
0.4269464, -0.2656996, 2.243306, 0.1411765, 0, 1, 1,
0.4271816, 0.1218444, 1.885298, 0.145098, 0, 1, 1,
0.4287016, 0.2311333, -0.6626302, 0.1529412, 0, 1, 1,
0.4321836, -0.4373108, 1.681749, 0.1568628, 0, 1, 1,
0.4357742, 0.1668939, 1.138617, 0.1647059, 0, 1, 1,
0.4378157, -0.5096083, 3.307418, 0.1686275, 0, 1, 1,
0.4439376, 0.9619465, 0.3715958, 0.1764706, 0, 1, 1,
0.4455562, 0.07539202, 0.4330617, 0.1803922, 0, 1, 1,
0.4459698, 2.243641, -0.5950503, 0.1882353, 0, 1, 1,
0.4560528, -0.3340753, 2.503275, 0.1921569, 0, 1, 1,
0.4587475, 1.992413, -0.8837998, 0.2, 0, 1, 1,
0.4588431, 1.125561, 2.764449, 0.2078431, 0, 1, 1,
0.4629087, -1.449315, 3.476625, 0.2117647, 0, 1, 1,
0.4646064, 1.318839, 0.4420373, 0.2196078, 0, 1, 1,
0.4729093, -1.289199, 0.6661119, 0.2235294, 0, 1, 1,
0.4733749, -0.8760275, 0.8877455, 0.2313726, 0, 1, 1,
0.4770425, -0.2143218, 2.445779, 0.2352941, 0, 1, 1,
0.4807221, -0.1640179, 1.643013, 0.2431373, 0, 1, 1,
0.4822437, 0.689577, 0.3331949, 0.2470588, 0, 1, 1,
0.4829631, -1.409261, 2.821471, 0.254902, 0, 1, 1,
0.4843055, 1.719409, 0.5599559, 0.2588235, 0, 1, 1,
0.4849002, 0.3204126, 1.151203, 0.2666667, 0, 1, 1,
0.4860064, 1.328509, 0.8229572, 0.2705882, 0, 1, 1,
0.4919847, -1.758273, 2.253552, 0.2784314, 0, 1, 1,
0.4923908, 0.6016268, -0.02611412, 0.282353, 0, 1, 1,
0.4950077, -1.375485, 3.874965, 0.2901961, 0, 1, 1,
0.5026323, 1.863669, 0.7280132, 0.2941177, 0, 1, 1,
0.5037354, -0.6704566, 2.312697, 0.3019608, 0, 1, 1,
0.5185767, 0.5270451, 0.1074857, 0.3098039, 0, 1, 1,
0.5198812, 1.195488, -0.8707131, 0.3137255, 0, 1, 1,
0.5336668, -0.9368646, 1.702873, 0.3215686, 0, 1, 1,
0.5339276, -1.051428, 0.839774, 0.3254902, 0, 1, 1,
0.5349315, -0.3064029, 0.8385657, 0.3333333, 0, 1, 1,
0.53539, 0.8215986, 1.796336, 0.3372549, 0, 1, 1,
0.5355108, -1.197679, 3.198253, 0.345098, 0, 1, 1,
0.5526568, 0.4044966, 0.2274112, 0.3490196, 0, 1, 1,
0.5549512, 0.686019, 2.181803, 0.3568628, 0, 1, 1,
0.5553871, 1.263516, 0.2913527, 0.3607843, 0, 1, 1,
0.5616054, 1.411338, 0.1161255, 0.3686275, 0, 1, 1,
0.5690657, -0.3530483, 1.310257, 0.372549, 0, 1, 1,
0.5761162, -1.573201, 2.635544, 0.3803922, 0, 1, 1,
0.5824779, -1.199326, 2.900086, 0.3843137, 0, 1, 1,
0.5825852, 0.3700226, -0.32133, 0.3921569, 0, 1, 1,
0.5844818, -1.050417, 3.040691, 0.3960784, 0, 1, 1,
0.5909452, -0.1420817, 1.201023, 0.4039216, 0, 1, 1,
0.5923955, -0.6677025, 3.979819, 0.4117647, 0, 1, 1,
0.5932157, -1.394979, 5.39383, 0.4156863, 0, 1, 1,
0.5951467, 0.4572962, 0.2879372, 0.4235294, 0, 1, 1,
0.5967859, 0.333747, 0.4281073, 0.427451, 0, 1, 1,
0.5986282, 2.409872, 2.938158, 0.4352941, 0, 1, 1,
0.599152, 1.093475, 0.07827386, 0.4392157, 0, 1, 1,
0.60014, 0.5517578, 1.308285, 0.4470588, 0, 1, 1,
0.6006388, 0.1109037, 2.204154, 0.4509804, 0, 1, 1,
0.601125, -0.3203555, 3.202393, 0.4588235, 0, 1, 1,
0.6024759, -0.7148846, 3.293625, 0.4627451, 0, 1, 1,
0.6167959, 1.211514, 2.086288, 0.4705882, 0, 1, 1,
0.6174564, -0.8521176, 3.19876, 0.4745098, 0, 1, 1,
0.6191726, 0.2021074, 0.8681667, 0.4823529, 0, 1, 1,
0.6193039, -1.228773, 1.573007, 0.4862745, 0, 1, 1,
0.6208983, -2.15726, 1.70695, 0.4941176, 0, 1, 1,
0.6214603, -0.9396945, 2.146396, 0.5019608, 0, 1, 1,
0.6242431, -0.7267595, 2.483693, 0.5058824, 0, 1, 1,
0.6270698, 0.4869295, -0.7473154, 0.5137255, 0, 1, 1,
0.6332547, 1.463223, 0.3773829, 0.5176471, 0, 1, 1,
0.6350601, 1.41583, -0.4488384, 0.5254902, 0, 1, 1,
0.6364335, 1.900009, 2.941847, 0.5294118, 0, 1, 1,
0.6414734, -0.2525816, 2.02781, 0.5372549, 0, 1, 1,
0.6431647, -0.7371947, 3.014276, 0.5411765, 0, 1, 1,
0.646489, -0.8300505, 2.209383, 0.5490196, 0, 1, 1,
0.6493478, 1.315721, 1.289258, 0.5529412, 0, 1, 1,
0.6534475, -0.8358788, 1.539299, 0.5607843, 0, 1, 1,
0.6600618, 1.435652, 1.05605, 0.5647059, 0, 1, 1,
0.6621428, -0.8646553, 2.029388, 0.572549, 0, 1, 1,
0.663246, 0.4279855, 0.006158121, 0.5764706, 0, 1, 1,
0.6683146, 0.5555592, 0.4732781, 0.5843138, 0, 1, 1,
0.6683178, -0.09683121, 3.107166, 0.5882353, 0, 1, 1,
0.6697018, -0.05220145, 1.303731, 0.5960785, 0, 1, 1,
0.6705895, -0.2105813, 2.191686, 0.6039216, 0, 1, 1,
0.6748447, -1.527124, 2.484743, 0.6078432, 0, 1, 1,
0.6804014, 0.5186907, 0.1820216, 0.6156863, 0, 1, 1,
0.6809154, -1.057834, 2.096788, 0.6196079, 0, 1, 1,
0.6846085, -0.07710194, 0.04729235, 0.627451, 0, 1, 1,
0.6897004, 0.6732289, -0.7700623, 0.6313726, 0, 1, 1,
0.6933325, -0.1096128, 2.562197, 0.6392157, 0, 1, 1,
0.6972162, -1.338666, 3.858151, 0.6431373, 0, 1, 1,
0.7114486, -0.4615697, 3.465723, 0.6509804, 0, 1, 1,
0.7120426, 0.3369235, 0.2707702, 0.654902, 0, 1, 1,
0.7132954, -2.070735, 1.782433, 0.6627451, 0, 1, 1,
0.7137405, 1.194226, 0.361269, 0.6666667, 0, 1, 1,
0.7195068, -0.4510616, 2.631212, 0.6745098, 0, 1, 1,
0.7241822, -2.631654, 2.97999, 0.6784314, 0, 1, 1,
0.7263591, -1.273738, 2.403429, 0.6862745, 0, 1, 1,
0.7287492, -0.9997532, 3.436888, 0.6901961, 0, 1, 1,
0.7324869, 0.8609625, 0.7465342, 0.6980392, 0, 1, 1,
0.7365032, -0.7004275, 3.63237, 0.7058824, 0, 1, 1,
0.7419348, -0.9975268, 2.802104, 0.7098039, 0, 1, 1,
0.7444465, 0.3866235, 1.97479, 0.7176471, 0, 1, 1,
0.7480764, 0.2845324, 3.356688, 0.7215686, 0, 1, 1,
0.7547933, -0.3877024, 1.762951, 0.7294118, 0, 1, 1,
0.7549052, 1.563387, 1.361323, 0.7333333, 0, 1, 1,
0.7558426, 1.707633, 1.301947, 0.7411765, 0, 1, 1,
0.7571936, 0.7167646, -1.644047, 0.7450981, 0, 1, 1,
0.7684904, 0.9307722, -0.003751288, 0.7529412, 0, 1, 1,
0.7707561, 0.1444957, 1.759571, 0.7568628, 0, 1, 1,
0.7734394, 1.377136, 0.1579991, 0.7647059, 0, 1, 1,
0.7765064, -0.3100614, 1.425203, 0.7686275, 0, 1, 1,
0.7810398, 0.06290349, 0.05633003, 0.7764706, 0, 1, 1,
0.7870091, 1.768477, 1.625313, 0.7803922, 0, 1, 1,
0.7918023, -0.0657802, 1.807202, 0.7882353, 0, 1, 1,
0.7961935, 0.4406216, 1.141422, 0.7921569, 0, 1, 1,
0.7990203, -0.7613064, 1.018019, 0.8, 0, 1, 1,
0.80334, -0.2144479, 4.711389, 0.8078431, 0, 1, 1,
0.8059291, -0.04451119, 0.5854929, 0.8117647, 0, 1, 1,
0.8077375, 2.095724, -0.009574217, 0.8196079, 0, 1, 1,
0.8111753, 0.4967467, 1.343059, 0.8235294, 0, 1, 1,
0.811926, -0.8896081, 1.347237, 0.8313726, 0, 1, 1,
0.814141, -1.408037, 2.732817, 0.8352941, 0, 1, 1,
0.8187258, 1.111596, -0.3906626, 0.8431373, 0, 1, 1,
0.820704, -0.8098792, 2.902517, 0.8470588, 0, 1, 1,
0.8228314, -2.44498, 2.086035, 0.854902, 0, 1, 1,
0.8232663, -0.6165712, 3.030379, 0.8588235, 0, 1, 1,
0.8282658, 0.713135, -0.5839558, 0.8666667, 0, 1, 1,
0.8297476, -0.9936486, 0.2991616, 0.8705882, 0, 1, 1,
0.8344606, -0.3304933, 2.031065, 0.8784314, 0, 1, 1,
0.8373237, 0.1910421, 0.8390429, 0.8823529, 0, 1, 1,
0.8424973, 1.256468, -0.6037338, 0.8901961, 0, 1, 1,
0.842825, 0.8521169, 1.489649, 0.8941177, 0, 1, 1,
0.8434461, -0.03579085, 3.130837, 0.9019608, 0, 1, 1,
0.8485065, 2.220011, -1.063271, 0.9098039, 0, 1, 1,
0.8488349, 0.1410736, 1.632216, 0.9137255, 0, 1, 1,
0.8497636, 1.528654, 0.9634314, 0.9215686, 0, 1, 1,
0.854705, 0.3282312, 1.710534, 0.9254902, 0, 1, 1,
0.8618193, 1.681635, 0.6116266, 0.9333333, 0, 1, 1,
0.8634025, -1.196134, 1.703813, 0.9372549, 0, 1, 1,
0.8665114, 1.642412, -1.375155, 0.945098, 0, 1, 1,
0.8750389, 1.706029, -0.6808075, 0.9490196, 0, 1, 1,
0.875641, 1.187116, 0.03136465, 0.9568627, 0, 1, 1,
0.8760821, -0.6467941, 0.8955024, 0.9607843, 0, 1, 1,
0.8765805, 0.3772011, 0.464308, 0.9686275, 0, 1, 1,
0.8771371, 1.662559, 1.426086, 0.972549, 0, 1, 1,
0.8776368, -0.7655482, 1.088119, 0.9803922, 0, 1, 1,
0.8785873, -1.012204, 0.9950464, 0.9843137, 0, 1, 1,
0.8839439, -0.5964485, 1.961046, 0.9921569, 0, 1, 1,
0.8846366, 0.2303147, 2.229382, 0.9960784, 0, 1, 1,
0.8916526, -0.2894372, 3.757085, 1, 0, 0.9960784, 1,
0.8971294, -1.490407, 0.4290208, 1, 0, 0.9882353, 1,
0.9086069, 1.0892, -0.6156088, 1, 0, 0.9843137, 1,
0.9092668, -0.5165924, 2.43171, 1, 0, 0.9764706, 1,
0.918519, 0.9293192, 2.38162, 1, 0, 0.972549, 1,
0.9262681, 1.316746, 0.3337295, 1, 0, 0.9647059, 1,
0.9335, 0.9408758, 0.5281941, 1, 0, 0.9607843, 1,
0.9420551, 1.513543, 1.634432, 1, 0, 0.9529412, 1,
0.9483628, -0.3621161, 1.74439, 1, 0, 0.9490196, 1,
0.9493335, -0.8984321, 2.496071, 1, 0, 0.9411765, 1,
0.9570436, -0.514609, 2.372466, 1, 0, 0.9372549, 1,
0.961664, 0.8289285, 0.3486956, 1, 0, 0.9294118, 1,
0.963771, 0.7181635, 2.619834, 1, 0, 0.9254902, 1,
0.9704707, -0.4464701, 2.479509, 1, 0, 0.9176471, 1,
0.973138, 0.3434325, 2.835877, 1, 0, 0.9137255, 1,
0.9741827, -0.5030024, 0.4171081, 1, 0, 0.9058824, 1,
0.9746407, 1.068259, 1.123773, 1, 0, 0.9019608, 1,
0.9763997, 0.5149213, 0.3914225, 1, 0, 0.8941177, 1,
0.9809387, -0.02603306, 0.344001, 1, 0, 0.8862745, 1,
0.9843371, -1.00294, 2.27988, 1, 0, 0.8823529, 1,
0.9851366, 0.5388212, 1.836413, 1, 0, 0.8745098, 1,
0.9874352, -0.1372566, 2.017791, 1, 0, 0.8705882, 1,
0.9879155, -0.5028792, 2.188236, 1, 0, 0.8627451, 1,
0.9898925, -0.5095807, 0.156627, 1, 0, 0.8588235, 1,
0.9908292, 0.6076921, 0.8378105, 1, 0, 0.8509804, 1,
0.995477, 0.06359871, 1.551191, 1, 0, 0.8470588, 1,
0.9988762, 1.624075, 0.6519405, 1, 0, 0.8392157, 1,
0.9994901, -0.1678658, 0.7325041, 1, 0, 0.8352941, 1,
1.004481, 0.3497967, 2.025733, 1, 0, 0.827451, 1,
1.00738, 0.539607, 2.149123, 1, 0, 0.8235294, 1,
1.008729, 0.06480725, 2.64763, 1, 0, 0.8156863, 1,
1.012376, 0.7032992, 2.260394, 1, 0, 0.8117647, 1,
1.012871, -0.08950603, 2.574081, 1, 0, 0.8039216, 1,
1.013574, 0.5796893, 0.2566142, 1, 0, 0.7960784, 1,
1.015851, -0.2858867, 2.134462, 1, 0, 0.7921569, 1,
1.017429, 0.5958679, 1.911028, 1, 0, 0.7843137, 1,
1.021379, 1.251825, 0.9740353, 1, 0, 0.7803922, 1,
1.032883, 1.159425, 3.936713, 1, 0, 0.772549, 1,
1.035625, 0.6017106, 1.481576, 1, 0, 0.7686275, 1,
1.043212, 0.7399966, 3.571718, 1, 0, 0.7607843, 1,
1.044343, 1.49204, 2.13153, 1, 0, 0.7568628, 1,
1.046391, -0.5820782, 2.544953, 1, 0, 0.7490196, 1,
1.059945, -0.6941113, 2.619883, 1, 0, 0.7450981, 1,
1.061572, 1.228605, 2.964644, 1, 0, 0.7372549, 1,
1.061963, -0.1974667, 2.459295, 1, 0, 0.7333333, 1,
1.064146, -0.7071723, 0.586773, 1, 0, 0.7254902, 1,
1.06651, 3.042891, -0.1237467, 1, 0, 0.7215686, 1,
1.070166, -1.334756, 1.470387, 1, 0, 0.7137255, 1,
1.071632, 0.00735209, 3.024989, 1, 0, 0.7098039, 1,
1.075802, 0.1601442, 3.018957, 1, 0, 0.7019608, 1,
1.077109, 1.449127, 0.2133468, 1, 0, 0.6941177, 1,
1.087847, 1.445838, 0.7435884, 1, 0, 0.6901961, 1,
1.095145, 0.6927872, 0.4185809, 1, 0, 0.682353, 1,
1.108091, 1.74294, 0.1847625, 1, 0, 0.6784314, 1,
1.120332, -0.4157594, 0.9561833, 1, 0, 0.6705883, 1,
1.121998, 0.3538156, -0.08710118, 1, 0, 0.6666667, 1,
1.129939, -0.1808343, -0.02994964, 1, 0, 0.6588235, 1,
1.145618, 2.168238, -0.01033238, 1, 0, 0.654902, 1,
1.147133, 0.8653219, 1.273835, 1, 0, 0.6470588, 1,
1.151492, 0.4829201, 1.996022, 1, 0, 0.6431373, 1,
1.162536, -2.04988, 3.497286, 1, 0, 0.6352941, 1,
1.181217, 0.8626919, 0.1609341, 1, 0, 0.6313726, 1,
1.189388, 0.3297986, 0.37341, 1, 0, 0.6235294, 1,
1.19261, -1.596765, 3.471179, 1, 0, 0.6196079, 1,
1.197373, 0.5429435, 0.5490897, 1, 0, 0.6117647, 1,
1.206325, 1.274985, -0.8545254, 1, 0, 0.6078432, 1,
1.231331, -0.6440939, 2.164817, 1, 0, 0.6, 1,
1.231413, -0.6323792, 2.273637, 1, 0, 0.5921569, 1,
1.232265, -0.1381223, 2.461107, 1, 0, 0.5882353, 1,
1.25443, 0.9561034, -0.1459989, 1, 0, 0.5803922, 1,
1.269303, 0.02227779, 2.338334, 1, 0, 0.5764706, 1,
1.269524, -2.116583, 1.600334, 1, 0, 0.5686275, 1,
1.290209, -0.06628397, 2.989066, 1, 0, 0.5647059, 1,
1.307789, 0.9762752, 1.161397, 1, 0, 0.5568628, 1,
1.321038, -0.5167465, 2.926787, 1, 0, 0.5529412, 1,
1.329479, -1.355147, 2.774046, 1, 0, 0.5450981, 1,
1.344246, 0.6005164, 1.991437, 1, 0, 0.5411765, 1,
1.348177, -1.317158, 3.867804, 1, 0, 0.5333334, 1,
1.350692, -0.4692903, 1.683779, 1, 0, 0.5294118, 1,
1.370389, 0.5356066, 1.22764, 1, 0, 0.5215687, 1,
1.393697, 0.3244156, -1.462102, 1, 0, 0.5176471, 1,
1.407088, 0.2999512, 1.348175, 1, 0, 0.509804, 1,
1.407792, 1.159246, 1.527658, 1, 0, 0.5058824, 1,
1.418993, -0.3775587, 3.711828, 1, 0, 0.4980392, 1,
1.432394, -1.147454, 1.646159, 1, 0, 0.4901961, 1,
1.437454, 0.1436539, 2.71492, 1, 0, 0.4862745, 1,
1.448408, 0.5662315, 1.273016, 1, 0, 0.4784314, 1,
1.459209, -0.8176612, 1.558103, 1, 0, 0.4745098, 1,
1.463422, -0.7033507, -0.02940948, 1, 0, 0.4666667, 1,
1.475031, -0.8189783, 2.513048, 1, 0, 0.4627451, 1,
1.51667, 0.5605633, 0.6523422, 1, 0, 0.454902, 1,
1.530873, 1.273888, 0.7095314, 1, 0, 0.4509804, 1,
1.531375, 0.7997229, 1.531717, 1, 0, 0.4431373, 1,
1.540414, -0.2508353, 1.842208, 1, 0, 0.4392157, 1,
1.54143, 1.660788, 0.5670003, 1, 0, 0.4313726, 1,
1.543301, -1.210285, 1.886042, 1, 0, 0.427451, 1,
1.546293, -1.39252, 3.573555, 1, 0, 0.4196078, 1,
1.55, -0.01481375, 4.668289, 1, 0, 0.4156863, 1,
1.55026, 0.4933065, 0.6368191, 1, 0, 0.4078431, 1,
1.554115, -0.6865906, 2.915549, 1, 0, 0.4039216, 1,
1.567767, 0.07081303, 3.045774, 1, 0, 0.3960784, 1,
1.569369, 0.6475217, -0.08234233, 1, 0, 0.3882353, 1,
1.570743, -0.7661403, 3.756103, 1, 0, 0.3843137, 1,
1.581137, -0.1216675, 2.452381, 1, 0, 0.3764706, 1,
1.599398, 0.3970484, 1.564391, 1, 0, 0.372549, 1,
1.599952, -1.58074, 1.497863, 1, 0, 0.3647059, 1,
1.609555, 1.058316, 1.997586, 1, 0, 0.3607843, 1,
1.611465, -0.8739688, 3.440377, 1, 0, 0.3529412, 1,
1.613992, -2.163818, 4.005884, 1, 0, 0.3490196, 1,
1.629624, 0.1220931, 1.282594, 1, 0, 0.3411765, 1,
1.631489, -1.40399, 1.59437, 1, 0, 0.3372549, 1,
1.631788, 0.7622941, 0.1059399, 1, 0, 0.3294118, 1,
1.635298, 0.8009457, 1.499557, 1, 0, 0.3254902, 1,
1.63652, 0.1160072, 1.840246, 1, 0, 0.3176471, 1,
1.640585, 0.4744345, 2.805537, 1, 0, 0.3137255, 1,
1.658684, -0.08447774, 1.476889, 1, 0, 0.3058824, 1,
1.685659, 1.094229, -0.4741807, 1, 0, 0.2980392, 1,
1.706741, 0.02401483, 3.034444, 1, 0, 0.2941177, 1,
1.710913, 0.4879869, 0.3924889, 1, 0, 0.2862745, 1,
1.720486, -1.000762, 1.859295, 1, 0, 0.282353, 1,
1.726766, 0.771957, 2.920642, 1, 0, 0.2745098, 1,
1.728807, -1.737144, 2.908384, 1, 0, 0.2705882, 1,
1.739365, -0.455944, 2.573611, 1, 0, 0.2627451, 1,
1.753755, 1.097912, 0.381904, 1, 0, 0.2588235, 1,
1.76361, -0.667591, 2.930682, 1, 0, 0.2509804, 1,
1.796985, -0.315579, 2.309737, 1, 0, 0.2470588, 1,
1.799482, -0.1229674, 1.160879, 1, 0, 0.2392157, 1,
1.801723, -0.6179502, 2.039915, 1, 0, 0.2352941, 1,
1.805333, -1.9861, 2.647017, 1, 0, 0.227451, 1,
1.806796, -1.688817, 4.714271, 1, 0, 0.2235294, 1,
1.831099, -2.765908, 2.766938, 1, 0, 0.2156863, 1,
1.846797, -0.3058369, 1.314936, 1, 0, 0.2117647, 1,
1.848704, -0.5904574, 1.753001, 1, 0, 0.2039216, 1,
1.858844, -2.123417, 1.827266, 1, 0, 0.1960784, 1,
1.862329, -0.1464602, 1.487667, 1, 0, 0.1921569, 1,
1.907832, 0.8777217, 0.957438, 1, 0, 0.1843137, 1,
1.915395, -0.265868, 1.304972, 1, 0, 0.1803922, 1,
1.917732, -1.756855, 3.614113, 1, 0, 0.172549, 1,
1.929528, 0.3062695, 0.1172455, 1, 0, 0.1686275, 1,
1.946632, -0.3922091, 3.701234, 1, 0, 0.1607843, 1,
1.948449, 0.6705086, 0.2093818, 1, 0, 0.1568628, 1,
1.965404, -0.2175876, 2.82255, 1, 0, 0.1490196, 1,
1.972201, -0.7553602, 1.052511, 1, 0, 0.145098, 1,
1.988272, -0.1709473, 1.827329, 1, 0, 0.1372549, 1,
2.065828, 0.4564224, 0.2595873, 1, 0, 0.1333333, 1,
2.082259, 0.8858135, 0.9326984, 1, 0, 0.1254902, 1,
2.118631, 0.3396266, -0.1834444, 1, 0, 0.1215686, 1,
2.174471, 1.289302, 0.2362669, 1, 0, 0.1137255, 1,
2.177909, 1.482339, 0.6896151, 1, 0, 0.1098039, 1,
2.201211, -1.182461, 0.6094513, 1, 0, 0.1019608, 1,
2.215426, 0.1227425, 1.025023, 1, 0, 0.09411765, 1,
2.215777, 0.6503451, 1.350413, 1, 0, 0.09019608, 1,
2.229737, 0.4242412, 1.741673, 1, 0, 0.08235294, 1,
2.284194, -0.9914066, 0.7586278, 1, 0, 0.07843138, 1,
2.298504, -0.7880079, 1.062657, 1, 0, 0.07058824, 1,
2.335005, -0.2367782, 2.699284, 1, 0, 0.06666667, 1,
2.408511, -0.466933, 1.701571, 1, 0, 0.05882353, 1,
2.410228, -0.9599516, 2.004991, 1, 0, 0.05490196, 1,
2.414277, 0.1873669, 1.325748, 1, 0, 0.04705882, 1,
2.470639, -0.9708642, 1.38695, 1, 0, 0.04313726, 1,
2.50208, 0.3909984, 0.6341593, 1, 0, 0.03529412, 1,
2.503672, 0.5678591, 0.09174746, 1, 0, 0.03137255, 1,
2.536813, 1.709995, 2.85922, 1, 0, 0.02352941, 1,
2.69002, 0.4192995, 1.074055, 1, 0, 0.01960784, 1,
2.744031, 1.32799, 1.786851, 1, 0, 0.01176471, 1,
2.854943, -1.15986, 1.051851, 1, 0, 0.007843138, 1
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
-0.3089231, -4.284504, -7.179827, 0, -0.5, 0.5, 0.5,
-0.3089231, -4.284504, -7.179827, 1, -0.5, 0.5, 0.5,
-0.3089231, -4.284504, -7.179827, 1, 1.5, 0.5, 0.5,
-0.3089231, -4.284504, -7.179827, 0, 1.5, 0.5, 0.5
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
-4.54534, -0.08981287, -7.179827, 0, -0.5, 0.5, 0.5,
-4.54534, -0.08981287, -7.179827, 1, -0.5, 0.5, 0.5,
-4.54534, -0.08981287, -7.179827, 1, 1.5, 0.5, 0.5,
-4.54534, -0.08981287, -7.179827, 0, 1.5, 0.5, 0.5
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
-4.54534, -4.284504, 0.01817513, 0, -0.5, 0.5, 0.5,
-4.54534, -4.284504, 0.01817513, 1, -0.5, 0.5, 0.5,
-4.54534, -4.284504, 0.01817513, 1, 1.5, 0.5, 0.5,
-4.54534, -4.284504, 0.01817513, 0, 1.5, 0.5, 0.5
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
-3, -3.316498, -5.518749,
2, -3.316498, -5.518749,
-3, -3.316498, -5.518749,
-3, -3.477832, -5.795596,
-2, -3.316498, -5.518749,
-2, -3.477832, -5.795596,
-1, -3.316498, -5.518749,
-1, -3.477832, -5.795596,
0, -3.316498, -5.518749,
0, -3.477832, -5.795596,
1, -3.316498, -5.518749,
1, -3.477832, -5.795596,
2, -3.316498, -5.518749,
2, -3.477832, -5.795596
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
-3, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
-3, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
-3, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
-3, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5,
-2, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
-2, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
-2, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
-2, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5,
-1, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
-1, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
-1, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
-1, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5,
0, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
0, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
0, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
0, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5,
1, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
1, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
1, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
1, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5,
2, -3.800501, -6.349288, 0, -0.5, 0.5, 0.5,
2, -3.800501, -6.349288, 1, -0.5, 0.5, 0.5,
2, -3.800501, -6.349288, 1, 1.5, 0.5, 0.5,
2, -3.800501, -6.349288, 0, 1.5, 0.5, 0.5
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
-3.567705, -3, -5.518749,
-3.567705, 3, -5.518749,
-3.567705, -3, -5.518749,
-3.730644, -3, -5.795596,
-3.567705, -2, -5.518749,
-3.730644, -2, -5.795596,
-3.567705, -1, -5.518749,
-3.730644, -1, -5.795596,
-3.567705, 0, -5.518749,
-3.730644, 0, -5.795596,
-3.567705, 1, -5.518749,
-3.730644, 1, -5.795596,
-3.567705, 2, -5.518749,
-3.730644, 2, -5.795596,
-3.567705, 3, -5.518749,
-3.730644, 3, -5.795596
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
-4.056522, -3, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, -3, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, -3, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, -3, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, -2, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, -2, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, -2, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, -2, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, -1, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, -1, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, -1, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, -1, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, 0, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, 0, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, 0, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, 0, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, 1, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, 1, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, 1, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, 1, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, 2, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, 2, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, 2, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, 2, -6.349288, 0, 1.5, 0.5, 0.5,
-4.056522, 3, -6.349288, 0, -0.5, 0.5, 0.5,
-4.056522, 3, -6.349288, 1, -0.5, 0.5, 0.5,
-4.056522, 3, -6.349288, 1, 1.5, 0.5, 0.5,
-4.056522, 3, -6.349288, 0, 1.5, 0.5, 0.5
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
-3.567705, -3.316498, -4,
-3.567705, -3.316498, 4,
-3.567705, -3.316498, -4,
-3.730644, -3.477832, -4,
-3.567705, -3.316498, -2,
-3.730644, -3.477832, -2,
-3.567705, -3.316498, 0,
-3.730644, -3.477832, 0,
-3.567705, -3.316498, 2,
-3.730644, -3.477832, 2,
-3.567705, -3.316498, 4,
-3.730644, -3.477832, 4
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
-4.056522, -3.800501, -4, 0, -0.5, 0.5, 0.5,
-4.056522, -3.800501, -4, 1, -0.5, 0.5, 0.5,
-4.056522, -3.800501, -4, 1, 1.5, 0.5, 0.5,
-4.056522, -3.800501, -4, 0, 1.5, 0.5, 0.5,
-4.056522, -3.800501, -2, 0, -0.5, 0.5, 0.5,
-4.056522, -3.800501, -2, 1, -0.5, 0.5, 0.5,
-4.056522, -3.800501, -2, 1, 1.5, 0.5, 0.5,
-4.056522, -3.800501, -2, 0, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 0, 0, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 0, 1, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 0, 1, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 0, 0, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 2, 0, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 2, 1, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 2, 1, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 2, 0, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 4, 0, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 4, 1, -0.5, 0.5, 0.5,
-4.056522, -3.800501, 4, 1, 1.5, 0.5, 0.5,
-4.056522, -3.800501, 4, 0, 1.5, 0.5, 0.5
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
-3.567705, -3.316498, -5.518749,
-3.567705, 3.136872, -5.518749,
-3.567705, -3.316498, 5.555099,
-3.567705, 3.136872, 5.555099,
-3.567705, -3.316498, -5.518749,
-3.567705, -3.316498, 5.555099,
-3.567705, 3.136872, -5.518749,
-3.567705, 3.136872, 5.555099,
-3.567705, -3.316498, -5.518749,
2.949859, -3.316498, -5.518749,
-3.567705, -3.316498, 5.555099,
2.949859, -3.316498, 5.555099,
-3.567705, 3.136872, -5.518749,
2.949859, 3.136872, -5.518749,
-3.567705, 3.136872, 5.555099,
2.949859, 3.136872, 5.555099,
2.949859, -3.316498, -5.518749,
2.949859, 3.136872, -5.518749,
2.949859, -3.316498, 5.555099,
2.949859, 3.136872, 5.555099,
2.949859, -3.316498, -5.518749,
2.949859, -3.316498, 5.555099,
2.949859, 3.136872, -5.518749,
2.949859, 3.136872, 5.555099
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
var radius = 7.67809;
var distance = 34.16069;
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
mvMatrix.translate( 0.3089231, 0.08981287, -0.01817513 );
mvMatrix.scale( 1.273743, 1.286413, 0.7496672 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16069);
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
metsulfuron-methyl<-read.table("metsulfuron-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metsulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
```

```r
y<-metsulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
```

```r
z<-metsulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
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
-3.472789, 0.339908, -3.033147, 0, 0, 1, 1, 1,
-3.076164, 0.7693993, -3.396776, 1, 0, 0, 1, 1,
-3.002888, 2.366757, 0.5367009, 1, 0, 0, 1, 1,
-2.939253, -0.2876029, -3.172959, 1, 0, 0, 1, 1,
-2.755713, -0.1716898, -2.050818, 1, 0, 0, 1, 1,
-2.510003, 0.3260532, 0.6322361, 1, 0, 0, 1, 1,
-2.495455, 0.8192236, -1.541305, 0, 0, 0, 1, 1,
-2.483851, -0.5435377, -1.554333, 0, 0, 0, 1, 1,
-2.471696, -1.936362, -1.990222, 0, 0, 0, 1, 1,
-2.443113, 0.1488692, -1.093202, 0, 0, 0, 1, 1,
-2.421265, -1.751985, -2.320597, 0, 0, 0, 1, 1,
-2.412103, -0.9365815, -1.350165, 0, 0, 0, 1, 1,
-2.372907, -1.284006, -2.162054, 0, 0, 0, 1, 1,
-2.366974, 0.4514935, -1.33656, 1, 1, 1, 1, 1,
-2.364096, 0.1410362, -1.165276, 1, 1, 1, 1, 1,
-2.352075, 0.6550463, -1.276759, 1, 1, 1, 1, 1,
-2.351781, 0.2362304, -0.3473937, 1, 1, 1, 1, 1,
-2.337912, 0.924406, 0.05401391, 1, 1, 1, 1, 1,
-2.327375, 0.09541719, -2.119499, 1, 1, 1, 1, 1,
-2.306206, 0.6049337, 0.2357218, 1, 1, 1, 1, 1,
-2.283885, 0.9397511, -0.6210643, 1, 1, 1, 1, 1,
-2.243794, -0.06704509, -1.889472, 1, 1, 1, 1, 1,
-2.241333, -0.5829335, -2.601719, 1, 1, 1, 1, 1,
-2.23131, -2.071741, -3.081078, 1, 1, 1, 1, 1,
-2.168414, -0.2207503, -0.1166966, 1, 1, 1, 1, 1,
-2.132048, -0.2252005, -1.000891, 1, 1, 1, 1, 1,
-2.115292, -0.655661, -1.541959, 1, 1, 1, 1, 1,
-2.094528, 0.2455561, -1.525918, 1, 1, 1, 1, 1,
-2.092459, 0.7294247, -0.8539136, 0, 0, 1, 1, 1,
-2.088754, -0.5249389, -0.1192165, 1, 0, 0, 1, 1,
-2.069403, -1.157826, -1.965141, 1, 0, 0, 1, 1,
-2.053557, 0.4049883, -0.9526865, 1, 0, 0, 1, 1,
-1.97293, -1.264966, -2.702503, 1, 0, 0, 1, 1,
-1.969928, 0.006993677, 0.3161289, 1, 0, 0, 1, 1,
-1.95498, -0.4427844, -1.378018, 0, 0, 0, 1, 1,
-1.932269, -0.1723396, -0.6726232, 0, 0, 0, 1, 1,
-1.911439, -0.9539071, -2.343137, 0, 0, 0, 1, 1,
-1.898908, -0.5080665, -0.9330725, 0, 0, 0, 1, 1,
-1.896171, 0.3385027, 0.3706747, 0, 0, 0, 1, 1,
-1.894115, -1.522117, -3.363925, 0, 0, 0, 1, 1,
-1.893397, 1.891077, -1.171341, 0, 0, 0, 1, 1,
-1.871146, 1.030679, -1.400558, 1, 1, 1, 1, 1,
-1.85588, 0.9207091, -0.7607834, 1, 1, 1, 1, 1,
-1.855408, -1.287445, -2.261253, 1, 1, 1, 1, 1,
-1.854684, 0.08191284, -2.709568, 1, 1, 1, 1, 1,
-1.849825, 0.4528895, 0.3247026, 1, 1, 1, 1, 1,
-1.842873, -1.031448, -0.9686778, 1, 1, 1, 1, 1,
-1.824993, -0.3836056, -1.862024, 1, 1, 1, 1, 1,
-1.81777, 0.2468243, -1.381001, 1, 1, 1, 1, 1,
-1.813576, -1.203701, -1.270018, 1, 1, 1, 1, 1,
-1.813535, -0.4247138, -1.654263, 1, 1, 1, 1, 1,
-1.80978, 0.8593034, -1.148781, 1, 1, 1, 1, 1,
-1.785631, 0.3815713, -2.205533, 1, 1, 1, 1, 1,
-1.78309, -0.9512683, -1.424544, 1, 1, 1, 1, 1,
-1.78188, -0.0483265, -3.152735, 1, 1, 1, 1, 1,
-1.780762, 0.08697461, -0.9171021, 1, 1, 1, 1, 1,
-1.779362, 0.7851847, 0.2583283, 0, 0, 1, 1, 1,
-1.765157, 0.3256507, -2.008973, 1, 0, 0, 1, 1,
-1.733183, -0.9978389, -3.075474, 1, 0, 0, 1, 1,
-1.711113, 1.055873, -1.034895, 1, 0, 0, 1, 1,
-1.705212, 0.8271564, -1.535585, 1, 0, 0, 1, 1,
-1.704973, -1.366121, -2.818482, 1, 0, 0, 1, 1,
-1.699525, 1.825475, 0.2519203, 0, 0, 0, 1, 1,
-1.698672, -0.4978654, -0.7593188, 0, 0, 0, 1, 1,
-1.696845, 0.08259621, -2.733656, 0, 0, 0, 1, 1,
-1.674022, -0.8513567, 0.0587073, 0, 0, 0, 1, 1,
-1.666558, 0.1893134, -2.425526, 0, 0, 0, 1, 1,
-1.645941, -2.342675, -2.295991, 0, 0, 0, 1, 1,
-1.63599, -0.6534796, -2.425068, 0, 0, 0, 1, 1,
-1.627077, -1.016152, -2.441983, 1, 1, 1, 1, 1,
-1.625932, 1.159715, -0.9563749, 1, 1, 1, 1, 1,
-1.612513, -0.6653646, -2.922974, 1, 1, 1, 1, 1,
-1.597835, 0.7056689, -2.027989, 1, 1, 1, 1, 1,
-1.594056, -0.6425431, -0.6183308, 1, 1, 1, 1, 1,
-1.590712, -0.8031816, -2.970318, 1, 1, 1, 1, 1,
-1.578025, -0.6685247, 0.07206547, 1, 1, 1, 1, 1,
-1.577975, 0.3881669, -2.321315, 1, 1, 1, 1, 1,
-1.573445, 0.2904458, -2.740904, 1, 1, 1, 1, 1,
-1.563526, 2.072492, -2.51528, 1, 1, 1, 1, 1,
-1.532134, -1.334383, -3.498326, 1, 1, 1, 1, 1,
-1.53168, 1.037819, -1.820604, 1, 1, 1, 1, 1,
-1.530391, -1.093624, -3.423071, 1, 1, 1, 1, 1,
-1.524028, 0.1324653, -0.8859442, 1, 1, 1, 1, 1,
-1.507639, 1.870985, -1.768864, 1, 1, 1, 1, 1,
-1.506695, 0.7393054, -1.392946, 0, 0, 1, 1, 1,
-1.49829, -0.7877175, -2.128867, 1, 0, 0, 1, 1,
-1.495363, 0.9669502, -0.988583, 1, 0, 0, 1, 1,
-1.486606, -0.8282347, -0.08837839, 1, 0, 0, 1, 1,
-1.484765, 0.06157134, -2.28233, 1, 0, 0, 1, 1,
-1.467825, -1.052616, -2.40213, 1, 0, 0, 1, 1,
-1.455531, 0.2125505, -0.4875145, 0, 0, 0, 1, 1,
-1.425884, -1.00456, -1.240816, 0, 0, 0, 1, 1,
-1.412219, -0.8172535, -1.317663, 0, 0, 0, 1, 1,
-1.409303, 0.06235972, -0.5207727, 0, 0, 0, 1, 1,
-1.40435, -1.522681, -3.093767, 0, 0, 0, 1, 1,
-1.385298, 0.1774651, -2.250118, 0, 0, 0, 1, 1,
-1.382527, 1.475748, 0.2734877, 0, 0, 0, 1, 1,
-1.379909, 0.3812922, -2.237262, 1, 1, 1, 1, 1,
-1.372173, 0.7004757, -1.716999, 1, 1, 1, 1, 1,
-1.36595, -0.6752211, -2.033535, 1, 1, 1, 1, 1,
-1.342682, -0.4930326, -2.95094, 1, 1, 1, 1, 1,
-1.339707, -1.382392, -3.446399, 1, 1, 1, 1, 1,
-1.339663, -0.328884, -2.790958, 1, 1, 1, 1, 1,
-1.33852, 1.040063, -0.2747796, 1, 1, 1, 1, 1,
-1.331128, 2.329734, 0.2142061, 1, 1, 1, 1, 1,
-1.328994, 0.4040706, -0.996674, 1, 1, 1, 1, 1,
-1.327087, 0.03678451, -0.8686748, 1, 1, 1, 1, 1,
-1.314019, 0.8037838, -1.05729, 1, 1, 1, 1, 1,
-1.312806, 1.666107, 1.650387, 1, 1, 1, 1, 1,
-1.296241, -0.8502045, -1.312587, 1, 1, 1, 1, 1,
-1.285992, 1.992818, 0.3062095, 1, 1, 1, 1, 1,
-1.272169, 0.3524275, -2.468116, 1, 1, 1, 1, 1,
-1.268059, 1.520716, -1.649932, 0, 0, 1, 1, 1,
-1.253251, 1.130862, -1.051864, 1, 0, 0, 1, 1,
-1.238832, -0.3704909, -2.59015, 1, 0, 0, 1, 1,
-1.238651, -0.5972863, 0.01493695, 1, 0, 0, 1, 1,
-1.23528, -0.3101875, 0.1908049, 1, 0, 0, 1, 1,
-1.231812, 0.5425741, 0.1747886, 1, 0, 0, 1, 1,
-1.222459, -0.1538609, -1.18966, 0, 0, 0, 1, 1,
-1.221861, -0.3886692, -1.171901, 0, 0, 0, 1, 1,
-1.22103, -0.838268, -2.584037, 0, 0, 0, 1, 1,
-1.220787, 0.1339441, -2.190827, 0, 0, 0, 1, 1,
-1.211395, -0.6518313, -1.410242, 0, 0, 0, 1, 1,
-1.210388, 0.640802, -2.027704, 0, 0, 0, 1, 1,
-1.20453, 1.966383, -1.055801, 0, 0, 0, 1, 1,
-1.203823, -1.253376, -2.761122, 1, 1, 1, 1, 1,
-1.20319, 0.2392696, -2.687091, 1, 1, 1, 1, 1,
-1.197787, -1.724438, -0.8682294, 1, 1, 1, 1, 1,
-1.194348, 1.127202, -0.6314343, 1, 1, 1, 1, 1,
-1.192375, 0.4082845, 0.3303134, 1, 1, 1, 1, 1,
-1.188836, 0.5013236, -0.6182869, 1, 1, 1, 1, 1,
-1.183807, 0.4218542, -2.688952, 1, 1, 1, 1, 1,
-1.165132, -1.324986, -3.664867, 1, 1, 1, 1, 1,
-1.161522, -0.1665179, -2.86374, 1, 1, 1, 1, 1,
-1.156386, -0.4291047, -0.8816577, 1, 1, 1, 1, 1,
-1.154689, -0.3226907, -0.3628893, 1, 1, 1, 1, 1,
-1.154213, 1.11627, 0.292888, 1, 1, 1, 1, 1,
-1.151238, 0.9488772, -1.119433, 1, 1, 1, 1, 1,
-1.1443, -0.08996778, -3.567372, 1, 1, 1, 1, 1,
-1.139341, 1.51432, -1.184577, 1, 1, 1, 1, 1,
-1.139042, 0.2837296, -1.766547, 0, 0, 1, 1, 1,
-1.134786, -0.404907, -2.672306, 1, 0, 0, 1, 1,
-1.132265, -1.26258, -3.52638, 1, 0, 0, 1, 1,
-1.128999, -0.4380721, -2.454431, 1, 0, 0, 1, 1,
-1.125665, 0.2708591, 0.01989008, 1, 0, 0, 1, 1,
-1.120442, -0.8818805, -2.605946, 1, 0, 0, 1, 1,
-1.119304, 0.8871631, -0.2305846, 0, 0, 0, 1, 1,
-1.119048, -1.59353, -1.992128, 0, 0, 0, 1, 1,
-1.114976, -0.117319, -2.504491, 0, 0, 0, 1, 1,
-1.109099, 1.309874, 0.8693475, 0, 0, 0, 1, 1,
-1.095988, 1.129798, -0.004944452, 0, 0, 0, 1, 1,
-1.094806, -0.2872626, -2.28356, 0, 0, 0, 1, 1,
-1.092787, 1.05889, 0.2448214, 0, 0, 0, 1, 1,
-1.091187, 0.2519207, -1.656752, 1, 1, 1, 1, 1,
-1.089426, 0.09100996, -1.063948, 1, 1, 1, 1, 1,
-1.083006, -0.5496225, -2.962526, 1, 1, 1, 1, 1,
-1.080571, -0.5785611, -2.503678, 1, 1, 1, 1, 1,
-1.07777, -0.6023346, -2.883627, 1, 1, 1, 1, 1,
-1.066635, -0.9902121, -1.668648, 1, 1, 1, 1, 1,
-1.066133, 0.2284956, -2.119407, 1, 1, 1, 1, 1,
-1.06334, 0.2511212, -3.300339, 1, 1, 1, 1, 1,
-1.060658, -0.02306531, -1.426067, 1, 1, 1, 1, 1,
-1.041356, 1.66572, -0.5828854, 1, 1, 1, 1, 1,
-1.039662, 0.2699451, -0.7164396, 1, 1, 1, 1, 1,
-1.037151, 1.684575, -0.4511869, 1, 1, 1, 1, 1,
-1.035964, 0.2144893, 0.5259257, 1, 1, 1, 1, 1,
-1.028718, -0.7905842, -1.189053, 1, 1, 1, 1, 1,
-1.028601, 1.392738, 0.4057117, 1, 1, 1, 1, 1,
-1.020764, 0.4774754, -1.12672, 0, 0, 1, 1, 1,
-1.016064, 1.185167, 1.301184, 1, 0, 0, 1, 1,
-1.011839, 1.151639, -2.826313, 1, 0, 0, 1, 1,
-1.010517, 0.6752989, -2.574996, 1, 0, 0, 1, 1,
-1.008198, 0.7960732, -1.432263, 1, 0, 0, 1, 1,
-1.003228, -0.2993111, -3.364017, 1, 0, 0, 1, 1,
-1.000783, -0.9686787, -3.420053, 0, 0, 0, 1, 1,
-0.9999605, 0.9300557, -1.833177, 0, 0, 0, 1, 1,
-0.99612, -1.124385, -2.586376, 0, 0, 0, 1, 1,
-0.9827466, -0.9999931, -3.668356, 0, 0, 0, 1, 1,
-0.9791139, -0.8447765, -2.480162, 0, 0, 0, 1, 1,
-0.9765166, -0.4610857, -1.234393, 0, 0, 0, 1, 1,
-0.9654176, 1.821009, -0.1118474, 0, 0, 0, 1, 1,
-0.9620187, 0.2125978, 0.2664024, 1, 1, 1, 1, 1,
-0.9553626, 0.1614681, -2.467338, 1, 1, 1, 1, 1,
-0.9524298, -1.223479, -2.947018, 1, 1, 1, 1, 1,
-0.9521406, 0.03403724, -1.358086, 1, 1, 1, 1, 1,
-0.9447361, 0.431895, -0.7061595, 1, 1, 1, 1, 1,
-0.934172, -0.2392861, -1.82214, 1, 1, 1, 1, 1,
-0.9329559, -0.7130402, -2.75287, 1, 1, 1, 1, 1,
-0.9276106, -0.7656572, -0.6681707, 1, 1, 1, 1, 1,
-0.9265948, 0.6121605, -0.8461076, 1, 1, 1, 1, 1,
-0.9210304, -0.02063082, -1.78237, 1, 1, 1, 1, 1,
-0.9208804, 0.1790208, -2.328008, 1, 1, 1, 1, 1,
-0.9152536, -0.921517, -2.920457, 1, 1, 1, 1, 1,
-0.9092779, -0.9100214, -2.339059, 1, 1, 1, 1, 1,
-0.9063497, 0.418779, -2.309037, 1, 1, 1, 1, 1,
-0.9039468, -1.109255, -1.861047, 1, 1, 1, 1, 1,
-0.9023165, -0.008588398, -0.4791597, 0, 0, 1, 1, 1,
-0.9015051, -0.9957097, -2.759017, 1, 0, 0, 1, 1,
-0.8998129, 1.327185, 1.288229, 1, 0, 0, 1, 1,
-0.8978984, -0.585141, -2.73963, 1, 0, 0, 1, 1,
-0.8964245, -0.5736786, -3.584884, 1, 0, 0, 1, 1,
-0.8913398, 0.9122701, -0.8460096, 1, 0, 0, 1, 1,
-0.8879026, -1.999917, -3.840206, 0, 0, 0, 1, 1,
-0.885425, 0.2790001, -0.5103765, 0, 0, 0, 1, 1,
-0.8854039, -1.265789, -3.783828, 0, 0, 0, 1, 1,
-0.8839675, 1.170283, 0.3490711, 0, 0, 0, 1, 1,
-0.8790319, 0.4661386, -0.5914158, 0, 0, 0, 1, 1,
-0.8618455, -0.502672, -3.47596, 0, 0, 0, 1, 1,
-0.8611537, -0.7042652, -2.995677, 0, 0, 0, 1, 1,
-0.8600163, -1.310013, -4.028426, 1, 1, 1, 1, 1,
-0.8492763, -0.3829679, -0.9462438, 1, 1, 1, 1, 1,
-0.8487251, 1.778446, -0.7618815, 1, 1, 1, 1, 1,
-0.8482131, -1.784652, -0.2975326, 1, 1, 1, 1, 1,
-0.846557, -1.315524, -1.529003, 1, 1, 1, 1, 1,
-0.8448369, 1.514647, 0.3286963, 1, 1, 1, 1, 1,
-0.8427217, -0.2192036, -2.736106, 1, 1, 1, 1, 1,
-0.8424587, 0.2571126, -0.4986763, 1, 1, 1, 1, 1,
-0.8409823, 2.944618, -2.581433, 1, 1, 1, 1, 1,
-0.8396765, 0.1418856, 0.1514107, 1, 1, 1, 1, 1,
-0.8349522, -0.8336834, -3.479842, 1, 1, 1, 1, 1,
-0.8341399, -1.636439, -1.324666, 1, 1, 1, 1, 1,
-0.8332158, -0.3654199, -3.468183, 1, 1, 1, 1, 1,
-0.8301248, -0.2551457, -1.980598, 1, 1, 1, 1, 1,
-0.8276257, -0.1354961, -3.764493, 1, 1, 1, 1, 1,
-0.8266473, 0.5288268, 0.2056469, 0, 0, 1, 1, 1,
-0.8246606, 0.105917, -2.083908, 1, 0, 0, 1, 1,
-0.8227193, -0.590777, -0.7344216, 1, 0, 0, 1, 1,
-0.8131819, 1.076017, -2.401947, 1, 0, 0, 1, 1,
-0.8057086, 0.4511213, -1.998213, 1, 0, 0, 1, 1,
-0.8053768, -1.432857, -3.88381, 1, 0, 0, 1, 1,
-0.802183, 0.1892608, 0.1958107, 0, 0, 0, 1, 1,
-0.8018044, -0.4294085, -2.567601, 0, 0, 0, 1, 1,
-0.8004856, -1.282122, -2.960832, 0, 0, 0, 1, 1,
-0.7987246, 0.3978086, -0.1063945, 0, 0, 0, 1, 1,
-0.7977684, -0.3526895, -3.488379, 0, 0, 0, 1, 1,
-0.7949334, -0.2179658, -3.043015, 0, 0, 0, 1, 1,
-0.7895152, -0.5054609, -3.442587, 0, 0, 0, 1, 1,
-0.7846399, 0.5518911, -1.327205, 1, 1, 1, 1, 1,
-0.7796738, 0.7206097, -0.1566032, 1, 1, 1, 1, 1,
-0.77833, -0.5915959, -1.867293, 1, 1, 1, 1, 1,
-0.7725888, -1.681886, -1.298189, 1, 1, 1, 1, 1,
-0.7709105, 0.5645471, -1.166765, 1, 1, 1, 1, 1,
-0.7669265, -1.33822, -3.037423, 1, 1, 1, 1, 1,
-0.7642012, 0.7438674, -0.7044222, 1, 1, 1, 1, 1,
-0.7628941, -0.1031902, -1.585616, 1, 1, 1, 1, 1,
-0.7543645, 1.728333, -1.357471, 1, 1, 1, 1, 1,
-0.7500451, 0.1628217, -0.4589334, 1, 1, 1, 1, 1,
-0.7475579, -1.803375, -1.820452, 1, 1, 1, 1, 1,
-0.744453, 1.360553, -0.1516645, 1, 1, 1, 1, 1,
-0.7388768, 0.6947507, -1.546857, 1, 1, 1, 1, 1,
-0.7366774, 1.998423, 1.555969, 1, 1, 1, 1, 1,
-0.735507, -0.7646565, -2.193025, 1, 1, 1, 1, 1,
-0.7287291, -0.07155699, -2.062691, 0, 0, 1, 1, 1,
-0.7281473, -1.455792, -0.820556, 1, 0, 0, 1, 1,
-0.7247614, -0.1088025, -1.362119, 1, 0, 0, 1, 1,
-0.7246284, -0.5814132, -3.341844, 1, 0, 0, 1, 1,
-0.7217021, 0.9204735, -0.4370506, 1, 0, 0, 1, 1,
-0.7179262, -1.166421, -2.366648, 1, 0, 0, 1, 1,
-0.717598, 0.3125833, -2.29601, 0, 0, 0, 1, 1,
-0.7121632, 0.7969952, -0.4998453, 0, 0, 0, 1, 1,
-0.7049128, 0.3810758, 0.325891, 0, 0, 0, 1, 1,
-0.7011809, 0.5584643, -1.945064, 0, 0, 0, 1, 1,
-0.7005237, -1.135759, -3.375304, 0, 0, 0, 1, 1,
-0.6936787, -2.262624, -2.146478, 0, 0, 0, 1, 1,
-0.691873, 0.8547638, -0.5346358, 0, 0, 0, 1, 1,
-0.685908, -1.070218, -2.223992, 1, 1, 1, 1, 1,
-0.6843379, -0.9141101, -1.821203, 1, 1, 1, 1, 1,
-0.6840601, 0.3750704, -0.9217969, 1, 1, 1, 1, 1,
-0.6835929, -0.3398882, -1.196025, 1, 1, 1, 1, 1,
-0.6835179, 0.4597115, -0.8991548, 1, 1, 1, 1, 1,
-0.680088, -1.412468, -2.214371, 1, 1, 1, 1, 1,
-0.6800496, 5.466424e-05, -3.126972, 1, 1, 1, 1, 1,
-0.6756019, 0.8775582, 0.7279594, 1, 1, 1, 1, 1,
-0.6740185, 1.696255, 0.6564493, 1, 1, 1, 1, 1,
-0.6707991, 0.6804613, -0.5547397, 1, 1, 1, 1, 1,
-0.6666088, -2.181826, -3.224447, 1, 1, 1, 1, 1,
-0.6639871, 0.1303817, -0.2541348, 1, 1, 1, 1, 1,
-0.6577436, -0.1447131, -0.409088, 1, 1, 1, 1, 1,
-0.6557501, -1.893388, -2.2221, 1, 1, 1, 1, 1,
-0.6552263, 1.024857, -0.07241607, 1, 1, 1, 1, 1,
-0.6540846, 0.6817566, 1.91816, 0, 0, 1, 1, 1,
-0.6537451, -1.039373, -3.717851, 1, 0, 0, 1, 1,
-0.6533622, -0.4187916, -0.3511502, 1, 0, 0, 1, 1,
-0.6524131, 1.014673, 0.6501863, 1, 0, 0, 1, 1,
-0.6509777, -0.9806567, -0.8324658, 1, 0, 0, 1, 1,
-0.6487068, -0.6844697, -4.214021, 1, 0, 0, 1, 1,
-0.637787, 0.2281068, -1.307951, 0, 0, 0, 1, 1,
-0.6320773, -1.343533, -3.36448, 0, 0, 0, 1, 1,
-0.6320328, -0.8896646, -2.233587, 0, 0, 0, 1, 1,
-0.6308421, 0.5160969, -1.101176, 0, 0, 0, 1, 1,
-0.6267822, -0.3691601, -1.155836, 0, 0, 0, 1, 1,
-0.6259007, -0.4978374, -2.586586, 0, 0, 0, 1, 1,
-0.6215959, 0.2425712, -1.878024, 0, 0, 0, 1, 1,
-0.6139599, -0.6694347, -3.479458, 1, 1, 1, 1, 1,
-0.6119659, 0.779422, -0.8220391, 1, 1, 1, 1, 1,
-0.606703, -0.2045743, -2.27363, 1, 1, 1, 1, 1,
-0.6066935, 0.009591605, -0.362366, 1, 1, 1, 1, 1,
-0.5945541, 0.6236346, -0.1345537, 1, 1, 1, 1, 1,
-0.588309, -0.2322692, -2.002193, 1, 1, 1, 1, 1,
-0.5845445, 1.912206, 1.739093, 1, 1, 1, 1, 1,
-0.5820967, -2.131772, -3.980542, 1, 1, 1, 1, 1,
-0.5805734, 1.469569, 0.1948016, 1, 1, 1, 1, 1,
-0.5768499, -1.394435, -1.741729, 1, 1, 1, 1, 1,
-0.5750582, -1.021081, -4.398304, 1, 1, 1, 1, 1,
-0.5749471, 0.1349359, -0.5510501, 1, 1, 1, 1, 1,
-0.5716525, -0.4617215, 0.3877693, 1, 1, 1, 1, 1,
-0.568902, -0.8078064, -2.760185, 1, 1, 1, 1, 1,
-0.5592125, -1.281025, -3.174211, 1, 1, 1, 1, 1,
-0.5579741, -0.04956587, -1.42977, 0, 0, 1, 1, 1,
-0.55229, 0.7064067, -1.017175, 1, 0, 0, 1, 1,
-0.5518242, 0.00201994, -1.76173, 1, 0, 0, 1, 1,
-0.5468389, -0.1004541, -3.176027, 1, 0, 0, 1, 1,
-0.5466796, 0.7479438, -1.967112, 1, 0, 0, 1, 1,
-0.5444931, -0.6175071, -3.248729, 1, 0, 0, 1, 1,
-0.5444305, -0.8489827, -1.980179, 0, 0, 0, 1, 1,
-0.5429672, -1.411184, -3.267115, 0, 0, 0, 1, 1,
-0.5418713, 0.1139917, -0.9219445, 0, 0, 0, 1, 1,
-0.5356944, 0.5009656, -1.39317, 0, 0, 0, 1, 1,
-0.5354608, -0.01053192, -1.690799, 0, 0, 0, 1, 1,
-0.5301014, -0.5261472, -2.910512, 0, 0, 0, 1, 1,
-0.5296417, 0.5442293, -0.4066136, 0, 0, 0, 1, 1,
-0.5290349, -0.2501384, -1.481673, 1, 1, 1, 1, 1,
-0.5243908, -0.51498, -2.232576, 1, 1, 1, 1, 1,
-0.5231373, 0.6107149, -0.8030999, 1, 1, 1, 1, 1,
-0.5212046, -0.2335614, -0.1673352, 1, 1, 1, 1, 1,
-0.5202826, -2.322829, -1.388902, 1, 1, 1, 1, 1,
-0.5163476, -0.7595717, -2.695377, 1, 1, 1, 1, 1,
-0.5117669, -0.6414711, -3.409252, 1, 1, 1, 1, 1,
-0.5107666, 1.697923, -1.163449, 1, 1, 1, 1, 1,
-0.4856649, -0.05375728, -0.4476297, 1, 1, 1, 1, 1,
-0.4853085, 0.8167201, -2.070755, 1, 1, 1, 1, 1,
-0.4850544, 0.3240755, -1.285622, 1, 1, 1, 1, 1,
-0.4800657, -0.5497483, -2.775187, 1, 1, 1, 1, 1,
-0.4791765, -1.240142, -3.118387, 1, 1, 1, 1, 1,
-0.4789172, 0.995351, -2.279182, 1, 1, 1, 1, 1,
-0.4770006, 0.5789061, 1.541106, 1, 1, 1, 1, 1,
-0.47579, 1.464725, -0.03528998, 0, 0, 1, 1, 1,
-0.4712679, -0.3960224, -2.058833, 1, 0, 0, 1, 1,
-0.4616464, 1.011178, 0.04758573, 1, 0, 0, 1, 1,
-0.4604104, -1.738526, -4.070985, 1, 0, 0, 1, 1,
-0.45796, 0.1546106, -0.930788, 1, 0, 0, 1, 1,
-0.4538788, 0.02593006, -1.65714, 1, 0, 0, 1, 1,
-0.4534295, -1.645005, -2.556955, 0, 0, 0, 1, 1,
-0.451694, -1.968638, -2.936909, 0, 0, 0, 1, 1,
-0.4488937, 0.09443001, -1.566002, 0, 0, 0, 1, 1,
-0.4447376, -1.560659, -2.253119, 0, 0, 0, 1, 1,
-0.4397939, 0.4754556, -1.260122, 0, 0, 0, 1, 1,
-0.4389963, 0.7871997, -1.946921, 0, 0, 0, 1, 1,
-0.4337573, -0.1092561, -1.87817, 0, 0, 0, 1, 1,
-0.4311479, -0.3331271, -1.936127, 1, 1, 1, 1, 1,
-0.4295539, 1.82603, 0.1415528, 1, 1, 1, 1, 1,
-0.4270872, -0.7530654, -2.760349, 1, 1, 1, 1, 1,
-0.4176621, 0.5844736, -0.01458322, 1, 1, 1, 1, 1,
-0.4121723, -0.6855794, -2.923136, 1, 1, 1, 1, 1,
-0.411651, -0.8860307, -3.259177, 1, 1, 1, 1, 1,
-0.4034682, 0.527301, -0.1250859, 1, 1, 1, 1, 1,
-0.400683, 0.6329597, -1.505092, 1, 1, 1, 1, 1,
-0.3950522, -0.1108351, -1.500444, 1, 1, 1, 1, 1,
-0.3945296, -1.538358, -1.874077, 1, 1, 1, 1, 1,
-0.3942653, -0.4199648, -2.146171, 1, 1, 1, 1, 1,
-0.3898515, -0.05781363, -2.15526, 1, 1, 1, 1, 1,
-0.3894801, 0.8994845, -2.008832, 1, 1, 1, 1, 1,
-0.3893854, -0.2190293, -2.943955, 1, 1, 1, 1, 1,
-0.3890407, 1.739514, -1.337435, 1, 1, 1, 1, 1,
-0.3877135, -1.642378, -2.010325, 0, 0, 1, 1, 1,
-0.3875006, 0.5428671, 2.435918, 1, 0, 0, 1, 1,
-0.3797618, -0.3360085, -3.618449, 1, 0, 0, 1, 1,
-0.3753158, 0.2842333, -2.827532, 1, 0, 0, 1, 1,
-0.3749605, 0.9900692, 0.7896137, 1, 0, 0, 1, 1,
-0.3747317, -1.512821, -1.530259, 1, 0, 0, 1, 1,
-0.3725753, -1.122789, -3.010698, 0, 0, 0, 1, 1,
-0.3707923, 0.2080158, -1.678266, 0, 0, 0, 1, 1,
-0.3641401, 0.3514372, -1.737168, 0, 0, 0, 1, 1,
-0.3597795, -1.414972, -4.413336, 0, 0, 0, 1, 1,
-0.3595408, -1.153157, -2.929592, 0, 0, 0, 1, 1,
-0.3589984, 0.02469279, -1.636649, 0, 0, 0, 1, 1,
-0.3585843, -1.567249, -3.676451, 0, 0, 0, 1, 1,
-0.3576498, 1.24279, -0.008366304, 1, 1, 1, 1, 1,
-0.3571507, -1.752779, -2.95948, 1, 1, 1, 1, 1,
-0.3551375, -0.08871569, -1.362425, 1, 1, 1, 1, 1,
-0.3506884, -0.004624205, -0.5975509, 1, 1, 1, 1, 1,
-0.3429413, 0.01722434, -2.925935, 1, 1, 1, 1, 1,
-0.3425183, 0.9207203, -0.7558998, 1, 1, 1, 1, 1,
-0.3418423, -0.7097779, -2.469303, 1, 1, 1, 1, 1,
-0.3416327, -1.513097, -1.621341, 1, 1, 1, 1, 1,
-0.3413543, -0.08949617, -1.290661, 1, 1, 1, 1, 1,
-0.337281, 1.216903, -2.144373, 1, 1, 1, 1, 1,
-0.3354295, -0.9292787, -3.4321, 1, 1, 1, 1, 1,
-0.3353659, 0.05717608, -2.782248, 1, 1, 1, 1, 1,
-0.3347119, 0.4905281, -0.8966262, 1, 1, 1, 1, 1,
-0.3335958, 0.0378856, -1.541581, 1, 1, 1, 1, 1,
-0.3283563, -0.7457245, -2.246993, 1, 1, 1, 1, 1,
-0.3281325, -0.3441674, -0.3205549, 0, 0, 1, 1, 1,
-0.3278909, 0.4266714, -0.5552986, 1, 0, 0, 1, 1,
-0.3274724, 1.523727, -0.005821977, 1, 0, 0, 1, 1,
-0.3258734, -1.07572, -2.031785, 1, 0, 0, 1, 1,
-0.3251672, 0.7127799, 0.001933928, 1, 0, 0, 1, 1,
-0.3248486, -1.284597, -2.36887, 1, 0, 0, 1, 1,
-0.3244966, 2.681688, -0.7607558, 0, 0, 0, 1, 1,
-0.3244028, -0.6391301, -2.692259, 0, 0, 0, 1, 1,
-0.3208372, -1.189604, -1.638183, 0, 0, 0, 1, 1,
-0.3181548, 1.064489, 0.2516707, 0, 0, 0, 1, 1,
-0.3181265, 1.861071, 0.7553739, 0, 0, 0, 1, 1,
-0.3170263, 0.06381811, -1.793983, 0, 0, 0, 1, 1,
-0.3150414, 0.8434793, -2.038254, 0, 0, 0, 1, 1,
-0.3140339, -0.2919307, -3.020297, 1, 1, 1, 1, 1,
-0.3118782, -2.587909, -1.940625, 1, 1, 1, 1, 1,
-0.3113109, 0.7026119, 0.3486272, 1, 1, 1, 1, 1,
-0.3076842, -0.008916326, -1.055422, 1, 1, 1, 1, 1,
-0.3057977, 1.236918, 0.1161525, 1, 1, 1, 1, 1,
-0.3057229, -0.207122, -2.801422, 1, 1, 1, 1, 1,
-0.2982821, 0.4516244, 0.1788092, 1, 1, 1, 1, 1,
-0.2940782, -0.1264613, 0.2819511, 1, 1, 1, 1, 1,
-0.2920259, -0.8870724, -4.269325, 1, 1, 1, 1, 1,
-0.2868389, -1.050866, -2.013152, 1, 1, 1, 1, 1,
-0.2846169, -1.553954, -3.001023, 1, 1, 1, 1, 1,
-0.2825387, -1.768602, -2.733382, 1, 1, 1, 1, 1,
-0.2808714, -1.827675, -3.241012, 1, 1, 1, 1, 1,
-0.2786123, -2.194591, -3.117632, 1, 1, 1, 1, 1,
-0.2731407, 1.207931, 0.1912281, 1, 1, 1, 1, 1,
-0.2725418, -1.272439, -2.840621, 0, 0, 1, 1, 1,
-0.2723092, -0.4481645, -1.482462, 1, 0, 0, 1, 1,
-0.2711592, -0.883612, -3.001011, 1, 0, 0, 1, 1,
-0.2697624, -1.547153, -2.886596, 1, 0, 0, 1, 1,
-0.2681313, -0.3436498, -1.976071, 1, 0, 0, 1, 1,
-0.2642916, -0.7829373, -4.697178, 1, 0, 0, 1, 1,
-0.2584334, -0.3645838, 0.2085278, 0, 0, 0, 1, 1,
-0.2567343, -1.24193, -1.171718, 0, 0, 0, 1, 1,
-0.2556595, 0.2199909, -1.4832, 0, 0, 0, 1, 1,
-0.255026, 0.09943834, -3.518927, 0, 0, 0, 1, 1,
-0.2531328, -2.011376, -3.175054, 0, 0, 0, 1, 1,
-0.2525495, -1.175779, -2.236221, 0, 0, 0, 1, 1,
-0.2469545, 0.7669756, 1.150782, 0, 0, 0, 1, 1,
-0.2415184, -1.923367, -2.162575, 1, 1, 1, 1, 1,
-0.2414069, -0.2056207, -2.259549, 1, 1, 1, 1, 1,
-0.237698, -0.2728035, -1.613077, 1, 1, 1, 1, 1,
-0.2352419, 1.324558, 0.4096759, 1, 1, 1, 1, 1,
-0.2293777, 1.8215, -0.5791554, 1, 1, 1, 1, 1,
-0.2238346, -0.7383831, -4.399128, 1, 1, 1, 1, 1,
-0.2236397, 0.4762255, 1.017115, 1, 1, 1, 1, 1,
-0.2220094, 1.658239, -0.822625, 1, 1, 1, 1, 1,
-0.2101061, 0.4611442, -1.433707, 1, 1, 1, 1, 1,
-0.2066775, 0.8642561, 0.1849533, 1, 1, 1, 1, 1,
-0.2039942, 0.7606351, -1.69955, 1, 1, 1, 1, 1,
-0.2032791, 0.8416132, 0.9479738, 1, 1, 1, 1, 1,
-0.1995966, 0.572993, -0.6677575, 1, 1, 1, 1, 1,
-0.1934052, 1.289999, 1.963931, 1, 1, 1, 1, 1,
-0.1864086, 1.065221, 1.139947, 1, 1, 1, 1, 1,
-0.1841411, -1.110299, -1.625849, 0, 0, 1, 1, 1,
-0.1839304, -0.4070145, -1.950921, 1, 0, 0, 1, 1,
-0.1824314, 1.298835, -0.04681332, 1, 0, 0, 1, 1,
-0.1792135, -0.236344, -3.363799, 1, 0, 0, 1, 1,
-0.1789293, -0.2350601, -2.274309, 1, 0, 0, 1, 1,
-0.1762639, 1.935317, 0.5773553, 1, 0, 0, 1, 1,
-0.1689795, -0.6078918, -2.517641, 0, 0, 0, 1, 1,
-0.1687756, 2.045748, -0.8831201, 0, 0, 0, 1, 1,
-0.1666392, -1.033797, -1.93327, 0, 0, 0, 1, 1,
-0.1657079, -0.06753012, -2.050158, 0, 0, 0, 1, 1,
-0.1603124, -1.21446, -2.933617, 0, 0, 0, 1, 1,
-0.1602304, 1.216497, -0.2460123, 0, 0, 0, 1, 1,
-0.1576094, 0.7183735, 1.518275, 0, 0, 0, 1, 1,
-0.1562282, 1.289421, 1.679087, 1, 1, 1, 1, 1,
-0.1558298, -0.5614107, -2.609571, 1, 1, 1, 1, 1,
-0.1547878, 0.9684005, 1.002716, 1, 1, 1, 1, 1,
-0.1547603, 1.336901, -0.3732101, 1, 1, 1, 1, 1,
-0.1512891, 0.6834338, -0.02420999, 1, 1, 1, 1, 1,
-0.149553, -0.189878, -2.910872, 1, 1, 1, 1, 1,
-0.1486568, -0.9897633, -3.355192, 1, 1, 1, 1, 1,
-0.1483944, 1.476451, 0.01147913, 1, 1, 1, 1, 1,
-0.1428952, 0.5177535, 0.2164247, 1, 1, 1, 1, 1,
-0.1407331, 0.9928108, -0.3353691, 1, 1, 1, 1, 1,
-0.1364362, 1.066289, 0.1126758, 1, 1, 1, 1, 1,
-0.1344366, 0.1422601, -0.9887755, 1, 1, 1, 1, 1,
-0.1339415, 0.1518996, 1.49457, 1, 1, 1, 1, 1,
-0.1244971, -0.5114318, -1.884, 1, 1, 1, 1, 1,
-0.1225664, -0.7039503, -2.538401, 1, 1, 1, 1, 1,
-0.1215781, -0.5164077, -3.611683, 0, 0, 1, 1, 1,
-0.12006, -0.6822512, -1.286392, 1, 0, 0, 1, 1,
-0.1182216, -0.246742, -0.2732285, 1, 0, 0, 1, 1,
-0.116818, -2.48166, -4.320895, 1, 0, 0, 1, 1,
-0.1159224, -0.3857118, -2.836091, 1, 0, 0, 1, 1,
-0.1140975, -0.5624474, -2.753476, 1, 0, 0, 1, 1,
-0.1129525, -0.5867426, -4.11165, 0, 0, 0, 1, 1,
-0.1116321, 0.07342991, -2.214529, 0, 0, 0, 1, 1,
-0.1103157, 0.4394926, -0.05722978, 0, 0, 0, 1, 1,
-0.1086528, 1.275375, -0.1994066, 0, 0, 0, 1, 1,
-0.1066804, 0.1796937, 0.1764188, 0, 0, 0, 1, 1,
-0.1061325, 0.302846, -0.2160627, 0, 0, 0, 1, 1,
-0.1043085, 1.219146, 0.5107778, 0, 0, 0, 1, 1,
-0.1023185, -0.8119078, -3.778821, 1, 1, 1, 1, 1,
-0.09860243, 1.892253, 0.3436956, 1, 1, 1, 1, 1,
-0.09836111, -2.464256, -3.915081, 1, 1, 1, 1, 1,
-0.09798088, 0.03242075, -1.150114, 1, 1, 1, 1, 1,
-0.09617756, -0.9848276, -1.686888, 1, 1, 1, 1, 1,
-0.09588832, 0.9531146, 0.06872343, 1, 1, 1, 1, 1,
-0.08782379, -1.341264, -4.639436, 1, 1, 1, 1, 1,
-0.08658602, -0.8525307, -4.659909, 1, 1, 1, 1, 1,
-0.08599256, -0.1398163, -0.7488315, 1, 1, 1, 1, 1,
-0.08258954, -0.6697928, -5.023678, 1, 1, 1, 1, 1,
-0.08201595, 0.3450537, 0.07263321, 1, 1, 1, 1, 1,
-0.08119349, -0.0953414, -5.284204, 1, 1, 1, 1, 1,
-0.08100614, -0.9246209, -3.309243, 1, 1, 1, 1, 1,
-0.07365058, 0.07689457, 0.09571406, 1, 1, 1, 1, 1,
-0.07238877, -0.01557803, -0.3782444, 1, 1, 1, 1, 1,
-0.06699067, -0.08391447, -2.246469, 0, 0, 1, 1, 1,
-0.064727, 0.1075172, -1.16196, 1, 0, 0, 1, 1,
-0.0616841, -0.0492813, -2.05811, 1, 0, 0, 1, 1,
-0.06165111, -0.1313519, -2.904461, 1, 0, 0, 1, 1,
-0.05942738, -0.3166671, -5.35748, 1, 0, 0, 1, 1,
-0.05726568, -0.02659768, -1.303474, 1, 0, 0, 1, 1,
-0.05514165, -1.680457, -2.887462, 0, 0, 0, 1, 1,
-0.05231966, 0.293495, 1.471102, 0, 0, 0, 1, 1,
-0.05196748, -1.596106, -4.154783, 0, 0, 0, 1, 1,
-0.04619637, 0.3883359, 0.753063, 0, 0, 0, 1, 1,
-0.04586023, -1.170239, -4.832572, 0, 0, 0, 1, 1,
-0.044373, -0.7400378, -2.666681, 0, 0, 0, 1, 1,
-0.04006074, -0.5429592, -2.25268, 0, 0, 0, 1, 1,
-0.04002151, -0.3993309, -1.740792, 1, 1, 1, 1, 1,
-0.03727473, 0.3086, 0.4401859, 1, 1, 1, 1, 1,
-0.03620593, -0.5044679, -3.723321, 1, 1, 1, 1, 1,
-0.03394154, -0.6442709, -2.630087, 1, 1, 1, 1, 1,
-0.02755684, 0.5011329, -0.04978466, 1, 1, 1, 1, 1,
-0.02521443, -0.6658012, -3.941887, 1, 1, 1, 1, 1,
-0.02228475, 0.5222406, -0.4903925, 1, 1, 1, 1, 1,
-0.0194611, 1.95913, 0.3033427, 1, 1, 1, 1, 1,
-0.01780668, -1.022434, -2.609348, 1, 1, 1, 1, 1,
-0.00563642, 1.350283, 1.293473, 1, 1, 1, 1, 1,
-0.004541229, -0.1987383, -3.415047, 1, 1, 1, 1, 1,
-0.0005032991, -0.9444925, -2.939858, 1, 1, 1, 1, 1,
0.002427364, -0.0529014, 2.373667, 1, 1, 1, 1, 1,
0.003340457, 0.6534916, 0.8841863, 1, 1, 1, 1, 1,
0.005880166, -1.173021, 2.037435, 1, 1, 1, 1, 1,
0.007370046, 0.2645904, -0.393558, 0, 0, 1, 1, 1,
0.007929984, 0.3285859, 1.20105, 1, 0, 0, 1, 1,
0.009729804, -0.3916988, 2.922295, 1, 0, 0, 1, 1,
0.01035078, 0.4122646, 0.3460439, 1, 0, 0, 1, 1,
0.02443854, 1.590685, 0.3463572, 1, 0, 0, 1, 1,
0.02486718, 1.30615, -1.145727, 1, 0, 0, 1, 1,
0.02523466, 1.671587, -0.3272736, 0, 0, 0, 1, 1,
0.02533095, -1.210954, 5.151593, 0, 0, 0, 1, 1,
0.02554689, 1.393055, 0.8781707, 0, 0, 0, 1, 1,
0.0324062, -1.918956, 4.786233, 0, 0, 0, 1, 1,
0.03413781, -0.1389122, 3.968049, 0, 0, 0, 1, 1,
0.03785034, -0.6919905, 4.670969, 0, 0, 0, 1, 1,
0.04364642, -0.424473, 3.232852, 0, 0, 0, 1, 1,
0.0471016, -1.344348, 2.432879, 1, 1, 1, 1, 1,
0.04718129, 0.6475213, 0.3225935, 1, 1, 1, 1, 1,
0.05039665, -0.5329732, 1.267595, 1, 1, 1, 1, 1,
0.05261125, 0.1843377, -3.195946, 1, 1, 1, 1, 1,
0.05654333, 0.7993379, 0.5472727, 1, 1, 1, 1, 1,
0.06052033, -1.079566, 2.923104, 1, 1, 1, 1, 1,
0.06411967, -0.9134315, 2.834072, 1, 1, 1, 1, 1,
0.06676231, 0.2778973, 1.60066, 1, 1, 1, 1, 1,
0.06808119, -1.354887, 3.552323, 1, 1, 1, 1, 1,
0.07675039, 0.567318, -0.9200422, 1, 1, 1, 1, 1,
0.07738315, 0.3363247, -0.5546653, 1, 1, 1, 1, 1,
0.07951166, -0.7631817, 3.202034, 1, 1, 1, 1, 1,
0.08055808, -0.7000349, 3.618656, 1, 1, 1, 1, 1,
0.08093361, 0.07600239, 0.0003854624, 1, 1, 1, 1, 1,
0.08521636, -0.2300361, 3.925448, 1, 1, 1, 1, 1,
0.08544213, 0.8371156, 0.6908379, 0, 0, 1, 1, 1,
0.09556025, 0.8010434, 0.8601339, 1, 0, 0, 1, 1,
0.09648781, 0.04148269, 2.239055, 1, 0, 0, 1, 1,
0.1000803, -0.5217692, 4.18229, 1, 0, 0, 1, 1,
0.1057243, 1.213177, -0.1576956, 1, 0, 0, 1, 1,
0.1065456, 0.2636286, -0.2050093, 1, 0, 0, 1, 1,
0.1071958, 0.888891, -1.252647, 0, 0, 0, 1, 1,
0.1076339, -0.6025639, 1.51761, 0, 0, 0, 1, 1,
0.1126577, -0.8313665, 4.02849, 0, 0, 0, 1, 1,
0.1134977, -0.2488915, 1.035631, 0, 0, 0, 1, 1,
0.1193294, 0.2435369, 1.506823, 0, 0, 0, 1, 1,
0.119765, -0.4808314, 2.170038, 0, 0, 0, 1, 1,
0.125882, -0.4250659, 3.863945, 0, 0, 0, 1, 1,
0.1277582, 0.7488276, 1.096315, 1, 1, 1, 1, 1,
0.1322985, 1.911948, -0.4261231, 1, 1, 1, 1, 1,
0.1342183, 1.745809, -0.4839979, 1, 1, 1, 1, 1,
0.1415067, 0.1520073, 1.847118, 1, 1, 1, 1, 1,
0.1426481, 0.2766738, 0.3219212, 1, 1, 1, 1, 1,
0.1436013, -1.606805, 4.176933, 1, 1, 1, 1, 1,
0.1449257, -1.075438, 2.645186, 1, 1, 1, 1, 1,
0.1491152, 0.8090227, -1.684303, 1, 1, 1, 1, 1,
0.1499221, 0.8781539, -0.591375, 1, 1, 1, 1, 1,
0.1512712, 0.6420159, 0.1070702, 1, 1, 1, 1, 1,
0.152234, -1.13464, 4.042269, 1, 1, 1, 1, 1,
0.1532885, -0.1113493, 2.856897, 1, 1, 1, 1, 1,
0.1535372, -0.3116566, 1.391786, 1, 1, 1, 1, 1,
0.1588125, 0.1584975, 0.3038776, 1, 1, 1, 1, 1,
0.1605043, 0.5724843, 1.389334, 1, 1, 1, 1, 1,
0.1718488, 0.05604668, 0.3703206, 0, 0, 1, 1, 1,
0.1737692, -0.5082524, 4.204232, 1, 0, 0, 1, 1,
0.1740028, 1.351689, 2.362746, 1, 0, 0, 1, 1,
0.1756805, -1.591733, 2.279514, 1, 0, 0, 1, 1,
0.1788639, 0.6054738, -0.04442932, 1, 0, 0, 1, 1,
0.1803559, -1.583377, 3.441253, 1, 0, 0, 1, 1,
0.1822392, -1.834108, 4.923923, 0, 0, 0, 1, 1,
0.1879773, 0.4665265, 0.2207754, 0, 0, 0, 1, 1,
0.1898137, 0.2704437, -0.1305763, 0, 0, 0, 1, 1,
0.1908604, -0.2496088, 4.616462, 0, 0, 0, 1, 1,
0.1916335, -0.9270275, 2.746652, 0, 0, 0, 1, 1,
0.1918847, -1.509397, 2.852143, 0, 0, 0, 1, 1,
0.1997177, 0.6049579, 0.2776764, 0, 0, 0, 1, 1,
0.2062511, -0.3261097, 3.11334, 1, 1, 1, 1, 1,
0.2074563, -0.1866989, 2.22287, 1, 1, 1, 1, 1,
0.2091651, -1.993783, 2.251311, 1, 1, 1, 1, 1,
0.2096, 2.491297, -0.9375611, 1, 1, 1, 1, 1,
0.2116485, 0.9554195, 1.859786, 1, 1, 1, 1, 1,
0.2182426, -0.3199263, 1.250547, 1, 1, 1, 1, 1,
0.2221004, -0.1065579, 1.253001, 1, 1, 1, 1, 1,
0.2295262, -0.90565, 2.904935, 1, 1, 1, 1, 1,
0.2369708, -0.3520069, 2.228054, 1, 1, 1, 1, 1,
0.2381405, -2.06541, 4.597597, 1, 1, 1, 1, 1,
0.2390238, -1.149991, 2.481511, 1, 1, 1, 1, 1,
0.2410278, -0.703253, 3.312038, 1, 1, 1, 1, 1,
0.2418194, 1.340731, -0.8816156, 1, 1, 1, 1, 1,
0.2433748, 0.9096817, 0.5829564, 1, 1, 1, 1, 1,
0.2445162, 2.137437, 0.8782277, 1, 1, 1, 1, 1,
0.2465127, -1.054915, 3.376356, 0, 0, 1, 1, 1,
0.2465401, -0.983557, 3.270769, 1, 0, 0, 1, 1,
0.2513574, 1.509837, 0.8518307, 1, 0, 0, 1, 1,
0.2516861, -1.228372, 2.917667, 1, 0, 0, 1, 1,
0.2541163, 0.0262015, 2.762936, 1, 0, 0, 1, 1,
0.256942, -0.102864, 2.759895, 1, 0, 0, 1, 1,
0.2582563, -0.3291052, 2.475401, 0, 0, 0, 1, 1,
0.2613514, -0.9438022, 3.360741, 0, 0, 0, 1, 1,
0.2627585, 0.9759864, 2.4137, 0, 0, 0, 1, 1,
0.2697306, -3.222517, 2.799099, 0, 0, 0, 1, 1,
0.2702097, 0.1504516, -0.5919237, 0, 0, 0, 1, 1,
0.2749614, -1.026692, 2.909917, 0, 0, 0, 1, 1,
0.2805071, 0.2517564, 0.39781, 0, 0, 0, 1, 1,
0.2841131, -0.8766904, 3.944059, 1, 1, 1, 1, 1,
0.2868555, 0.25711, 0.03209936, 1, 1, 1, 1, 1,
0.2886205, 1.208168, -0.1006394, 1, 1, 1, 1, 1,
0.2906679, -0.4606454, 2.472335, 1, 1, 1, 1, 1,
0.2913542, -0.0276508, 3.808823, 1, 1, 1, 1, 1,
0.292862, 1.118242, -0.917564, 1, 1, 1, 1, 1,
0.2945111, 1.085366, -0.7944824, 1, 1, 1, 1, 1,
0.2984084, -0.4220543, 3.441993, 1, 1, 1, 1, 1,
0.3064492, 0.2346905, 1.038469, 1, 1, 1, 1, 1,
0.3108552, -2.239974, 3.821102, 1, 1, 1, 1, 1,
0.3125855, -0.99324, 1.659228, 1, 1, 1, 1, 1,
0.3170321, 2.685857, -1.147747, 1, 1, 1, 1, 1,
0.3192727, -0.858375, 3.671789, 1, 1, 1, 1, 1,
0.3226628, 1.170124, -0.5652122, 1, 1, 1, 1, 1,
0.3228957, -0.226286, 1.848261, 1, 1, 1, 1, 1,
0.3295992, -0.8688954, 3.820272, 0, 0, 1, 1, 1,
0.3306379, 0.5201823, 1.688439, 1, 0, 0, 1, 1,
0.3320677, -0.04657628, 2.37426, 1, 0, 0, 1, 1,
0.3337842, -0.9073188, 1.42442, 1, 0, 0, 1, 1,
0.334966, 0.09906854, 0.09299752, 1, 0, 0, 1, 1,
0.3378176, 1.220978, -0.5798104, 1, 0, 0, 1, 1,
0.33847, 0.6963186, 1.225935, 0, 0, 0, 1, 1,
0.341013, -1.682295, 2.174153, 0, 0, 0, 1, 1,
0.3411898, -1.217797, 3.091707, 0, 0, 0, 1, 1,
0.3417056, -1.079034, 3.912157, 0, 0, 0, 1, 1,
0.3484533, 0.5450191, 1.719656, 0, 0, 0, 1, 1,
0.3498431, -2.788192, 2.1092, 0, 0, 0, 1, 1,
0.3511897, -1.225972, 2.145339, 0, 0, 0, 1, 1,
0.352227, -1.20033, 2.648362, 1, 1, 1, 1, 1,
0.3538564, 0.9591599, 0.02574274, 1, 1, 1, 1, 1,
0.3554733, -0.7510589, 2.744684, 1, 1, 1, 1, 1,
0.3570179, -0.7485045, 3.227176, 1, 1, 1, 1, 1,
0.3586392, 0.328114, 1.229993, 1, 1, 1, 1, 1,
0.3594588, -2.211852, 2.582891, 1, 1, 1, 1, 1,
0.3620508, -0.7993119, 3.350198, 1, 1, 1, 1, 1,
0.3621165, 2.269572, -1.595906, 1, 1, 1, 1, 1,
0.3632301, 1.005572, -0.1570791, 1, 1, 1, 1, 1,
0.3669167, -0.8435509, 3.307945, 1, 1, 1, 1, 1,
0.3677262, 1.029575, 1.281239, 1, 1, 1, 1, 1,
0.3681514, -0.6194118, 3.017308, 1, 1, 1, 1, 1,
0.3714083, 0.6464492, -0.4205863, 1, 1, 1, 1, 1,
0.3769411, -0.4270249, 1.865589, 1, 1, 1, 1, 1,
0.3775712, 0.1967148, 0.959644, 1, 1, 1, 1, 1,
0.3785558, 0.4577637, 0.9501141, 0, 0, 1, 1, 1,
0.3811201, 0.9668019, -0.08121835, 1, 0, 0, 1, 1,
0.3834869, -0.3740962, 4.553573, 1, 0, 0, 1, 1,
0.3860399, 0.06475049, 3.023596, 1, 0, 0, 1, 1,
0.3893834, 0.2220548, 0.1488068, 1, 0, 0, 1, 1,
0.3947884, 1.127561, 1.689372, 1, 0, 0, 1, 1,
0.3964236, -0.4288296, 4.033729, 0, 0, 0, 1, 1,
0.3966895, 0.1864499, -0.7731261, 0, 0, 0, 1, 1,
0.3974448, 1.613253, 1.358972, 0, 0, 0, 1, 1,
0.4014462, 0.7781039, -0.2322863, 0, 0, 0, 1, 1,
0.4021943, -1.065046, 2.836694, 0, 0, 0, 1, 1,
0.4069495, 0.7736418, 1.049052, 0, 0, 0, 1, 1,
0.4102115, -0.7605101, 1.971268, 0, 0, 0, 1, 1,
0.4112552, 0.7321625, -0.6323175, 1, 1, 1, 1, 1,
0.4124956, -0.7449093, 1.798612, 1, 1, 1, 1, 1,
0.4185624, -0.1961133, 2.655525, 1, 1, 1, 1, 1,
0.4193748, 1.215821, 0.7846342, 1, 1, 1, 1, 1,
0.4258926, -0.2067398, 1.81772, 1, 1, 1, 1, 1,
0.4269464, -0.2656996, 2.243306, 1, 1, 1, 1, 1,
0.4271816, 0.1218444, 1.885298, 1, 1, 1, 1, 1,
0.4287016, 0.2311333, -0.6626302, 1, 1, 1, 1, 1,
0.4321836, -0.4373108, 1.681749, 1, 1, 1, 1, 1,
0.4357742, 0.1668939, 1.138617, 1, 1, 1, 1, 1,
0.4378157, -0.5096083, 3.307418, 1, 1, 1, 1, 1,
0.4439376, 0.9619465, 0.3715958, 1, 1, 1, 1, 1,
0.4455562, 0.07539202, 0.4330617, 1, 1, 1, 1, 1,
0.4459698, 2.243641, -0.5950503, 1, 1, 1, 1, 1,
0.4560528, -0.3340753, 2.503275, 1, 1, 1, 1, 1,
0.4587475, 1.992413, -0.8837998, 0, 0, 1, 1, 1,
0.4588431, 1.125561, 2.764449, 1, 0, 0, 1, 1,
0.4629087, -1.449315, 3.476625, 1, 0, 0, 1, 1,
0.4646064, 1.318839, 0.4420373, 1, 0, 0, 1, 1,
0.4729093, -1.289199, 0.6661119, 1, 0, 0, 1, 1,
0.4733749, -0.8760275, 0.8877455, 1, 0, 0, 1, 1,
0.4770425, -0.2143218, 2.445779, 0, 0, 0, 1, 1,
0.4807221, -0.1640179, 1.643013, 0, 0, 0, 1, 1,
0.4822437, 0.689577, 0.3331949, 0, 0, 0, 1, 1,
0.4829631, -1.409261, 2.821471, 0, 0, 0, 1, 1,
0.4843055, 1.719409, 0.5599559, 0, 0, 0, 1, 1,
0.4849002, 0.3204126, 1.151203, 0, 0, 0, 1, 1,
0.4860064, 1.328509, 0.8229572, 0, 0, 0, 1, 1,
0.4919847, -1.758273, 2.253552, 1, 1, 1, 1, 1,
0.4923908, 0.6016268, -0.02611412, 1, 1, 1, 1, 1,
0.4950077, -1.375485, 3.874965, 1, 1, 1, 1, 1,
0.5026323, 1.863669, 0.7280132, 1, 1, 1, 1, 1,
0.5037354, -0.6704566, 2.312697, 1, 1, 1, 1, 1,
0.5185767, 0.5270451, 0.1074857, 1, 1, 1, 1, 1,
0.5198812, 1.195488, -0.8707131, 1, 1, 1, 1, 1,
0.5336668, -0.9368646, 1.702873, 1, 1, 1, 1, 1,
0.5339276, -1.051428, 0.839774, 1, 1, 1, 1, 1,
0.5349315, -0.3064029, 0.8385657, 1, 1, 1, 1, 1,
0.53539, 0.8215986, 1.796336, 1, 1, 1, 1, 1,
0.5355108, -1.197679, 3.198253, 1, 1, 1, 1, 1,
0.5526568, 0.4044966, 0.2274112, 1, 1, 1, 1, 1,
0.5549512, 0.686019, 2.181803, 1, 1, 1, 1, 1,
0.5553871, 1.263516, 0.2913527, 1, 1, 1, 1, 1,
0.5616054, 1.411338, 0.1161255, 0, 0, 1, 1, 1,
0.5690657, -0.3530483, 1.310257, 1, 0, 0, 1, 1,
0.5761162, -1.573201, 2.635544, 1, 0, 0, 1, 1,
0.5824779, -1.199326, 2.900086, 1, 0, 0, 1, 1,
0.5825852, 0.3700226, -0.32133, 1, 0, 0, 1, 1,
0.5844818, -1.050417, 3.040691, 1, 0, 0, 1, 1,
0.5909452, -0.1420817, 1.201023, 0, 0, 0, 1, 1,
0.5923955, -0.6677025, 3.979819, 0, 0, 0, 1, 1,
0.5932157, -1.394979, 5.39383, 0, 0, 0, 1, 1,
0.5951467, 0.4572962, 0.2879372, 0, 0, 0, 1, 1,
0.5967859, 0.333747, 0.4281073, 0, 0, 0, 1, 1,
0.5986282, 2.409872, 2.938158, 0, 0, 0, 1, 1,
0.599152, 1.093475, 0.07827386, 0, 0, 0, 1, 1,
0.60014, 0.5517578, 1.308285, 1, 1, 1, 1, 1,
0.6006388, 0.1109037, 2.204154, 1, 1, 1, 1, 1,
0.601125, -0.3203555, 3.202393, 1, 1, 1, 1, 1,
0.6024759, -0.7148846, 3.293625, 1, 1, 1, 1, 1,
0.6167959, 1.211514, 2.086288, 1, 1, 1, 1, 1,
0.6174564, -0.8521176, 3.19876, 1, 1, 1, 1, 1,
0.6191726, 0.2021074, 0.8681667, 1, 1, 1, 1, 1,
0.6193039, -1.228773, 1.573007, 1, 1, 1, 1, 1,
0.6208983, -2.15726, 1.70695, 1, 1, 1, 1, 1,
0.6214603, -0.9396945, 2.146396, 1, 1, 1, 1, 1,
0.6242431, -0.7267595, 2.483693, 1, 1, 1, 1, 1,
0.6270698, 0.4869295, -0.7473154, 1, 1, 1, 1, 1,
0.6332547, 1.463223, 0.3773829, 1, 1, 1, 1, 1,
0.6350601, 1.41583, -0.4488384, 1, 1, 1, 1, 1,
0.6364335, 1.900009, 2.941847, 1, 1, 1, 1, 1,
0.6414734, -0.2525816, 2.02781, 0, 0, 1, 1, 1,
0.6431647, -0.7371947, 3.014276, 1, 0, 0, 1, 1,
0.646489, -0.8300505, 2.209383, 1, 0, 0, 1, 1,
0.6493478, 1.315721, 1.289258, 1, 0, 0, 1, 1,
0.6534475, -0.8358788, 1.539299, 1, 0, 0, 1, 1,
0.6600618, 1.435652, 1.05605, 1, 0, 0, 1, 1,
0.6621428, -0.8646553, 2.029388, 0, 0, 0, 1, 1,
0.663246, 0.4279855, 0.006158121, 0, 0, 0, 1, 1,
0.6683146, 0.5555592, 0.4732781, 0, 0, 0, 1, 1,
0.6683178, -0.09683121, 3.107166, 0, 0, 0, 1, 1,
0.6697018, -0.05220145, 1.303731, 0, 0, 0, 1, 1,
0.6705895, -0.2105813, 2.191686, 0, 0, 0, 1, 1,
0.6748447, -1.527124, 2.484743, 0, 0, 0, 1, 1,
0.6804014, 0.5186907, 0.1820216, 1, 1, 1, 1, 1,
0.6809154, -1.057834, 2.096788, 1, 1, 1, 1, 1,
0.6846085, -0.07710194, 0.04729235, 1, 1, 1, 1, 1,
0.6897004, 0.6732289, -0.7700623, 1, 1, 1, 1, 1,
0.6933325, -0.1096128, 2.562197, 1, 1, 1, 1, 1,
0.6972162, -1.338666, 3.858151, 1, 1, 1, 1, 1,
0.7114486, -0.4615697, 3.465723, 1, 1, 1, 1, 1,
0.7120426, 0.3369235, 0.2707702, 1, 1, 1, 1, 1,
0.7132954, -2.070735, 1.782433, 1, 1, 1, 1, 1,
0.7137405, 1.194226, 0.361269, 1, 1, 1, 1, 1,
0.7195068, -0.4510616, 2.631212, 1, 1, 1, 1, 1,
0.7241822, -2.631654, 2.97999, 1, 1, 1, 1, 1,
0.7263591, -1.273738, 2.403429, 1, 1, 1, 1, 1,
0.7287492, -0.9997532, 3.436888, 1, 1, 1, 1, 1,
0.7324869, 0.8609625, 0.7465342, 1, 1, 1, 1, 1,
0.7365032, -0.7004275, 3.63237, 0, 0, 1, 1, 1,
0.7419348, -0.9975268, 2.802104, 1, 0, 0, 1, 1,
0.7444465, 0.3866235, 1.97479, 1, 0, 0, 1, 1,
0.7480764, 0.2845324, 3.356688, 1, 0, 0, 1, 1,
0.7547933, -0.3877024, 1.762951, 1, 0, 0, 1, 1,
0.7549052, 1.563387, 1.361323, 1, 0, 0, 1, 1,
0.7558426, 1.707633, 1.301947, 0, 0, 0, 1, 1,
0.7571936, 0.7167646, -1.644047, 0, 0, 0, 1, 1,
0.7684904, 0.9307722, -0.003751288, 0, 0, 0, 1, 1,
0.7707561, 0.1444957, 1.759571, 0, 0, 0, 1, 1,
0.7734394, 1.377136, 0.1579991, 0, 0, 0, 1, 1,
0.7765064, -0.3100614, 1.425203, 0, 0, 0, 1, 1,
0.7810398, 0.06290349, 0.05633003, 0, 0, 0, 1, 1,
0.7870091, 1.768477, 1.625313, 1, 1, 1, 1, 1,
0.7918023, -0.0657802, 1.807202, 1, 1, 1, 1, 1,
0.7961935, 0.4406216, 1.141422, 1, 1, 1, 1, 1,
0.7990203, -0.7613064, 1.018019, 1, 1, 1, 1, 1,
0.80334, -0.2144479, 4.711389, 1, 1, 1, 1, 1,
0.8059291, -0.04451119, 0.5854929, 1, 1, 1, 1, 1,
0.8077375, 2.095724, -0.009574217, 1, 1, 1, 1, 1,
0.8111753, 0.4967467, 1.343059, 1, 1, 1, 1, 1,
0.811926, -0.8896081, 1.347237, 1, 1, 1, 1, 1,
0.814141, -1.408037, 2.732817, 1, 1, 1, 1, 1,
0.8187258, 1.111596, -0.3906626, 1, 1, 1, 1, 1,
0.820704, -0.8098792, 2.902517, 1, 1, 1, 1, 1,
0.8228314, -2.44498, 2.086035, 1, 1, 1, 1, 1,
0.8232663, -0.6165712, 3.030379, 1, 1, 1, 1, 1,
0.8282658, 0.713135, -0.5839558, 1, 1, 1, 1, 1,
0.8297476, -0.9936486, 0.2991616, 0, 0, 1, 1, 1,
0.8344606, -0.3304933, 2.031065, 1, 0, 0, 1, 1,
0.8373237, 0.1910421, 0.8390429, 1, 0, 0, 1, 1,
0.8424973, 1.256468, -0.6037338, 1, 0, 0, 1, 1,
0.842825, 0.8521169, 1.489649, 1, 0, 0, 1, 1,
0.8434461, -0.03579085, 3.130837, 1, 0, 0, 1, 1,
0.8485065, 2.220011, -1.063271, 0, 0, 0, 1, 1,
0.8488349, 0.1410736, 1.632216, 0, 0, 0, 1, 1,
0.8497636, 1.528654, 0.9634314, 0, 0, 0, 1, 1,
0.854705, 0.3282312, 1.710534, 0, 0, 0, 1, 1,
0.8618193, 1.681635, 0.6116266, 0, 0, 0, 1, 1,
0.8634025, -1.196134, 1.703813, 0, 0, 0, 1, 1,
0.8665114, 1.642412, -1.375155, 0, 0, 0, 1, 1,
0.8750389, 1.706029, -0.6808075, 1, 1, 1, 1, 1,
0.875641, 1.187116, 0.03136465, 1, 1, 1, 1, 1,
0.8760821, -0.6467941, 0.8955024, 1, 1, 1, 1, 1,
0.8765805, 0.3772011, 0.464308, 1, 1, 1, 1, 1,
0.8771371, 1.662559, 1.426086, 1, 1, 1, 1, 1,
0.8776368, -0.7655482, 1.088119, 1, 1, 1, 1, 1,
0.8785873, -1.012204, 0.9950464, 1, 1, 1, 1, 1,
0.8839439, -0.5964485, 1.961046, 1, 1, 1, 1, 1,
0.8846366, 0.2303147, 2.229382, 1, 1, 1, 1, 1,
0.8916526, -0.2894372, 3.757085, 1, 1, 1, 1, 1,
0.8971294, -1.490407, 0.4290208, 1, 1, 1, 1, 1,
0.9086069, 1.0892, -0.6156088, 1, 1, 1, 1, 1,
0.9092668, -0.5165924, 2.43171, 1, 1, 1, 1, 1,
0.918519, 0.9293192, 2.38162, 1, 1, 1, 1, 1,
0.9262681, 1.316746, 0.3337295, 1, 1, 1, 1, 1,
0.9335, 0.9408758, 0.5281941, 0, 0, 1, 1, 1,
0.9420551, 1.513543, 1.634432, 1, 0, 0, 1, 1,
0.9483628, -0.3621161, 1.74439, 1, 0, 0, 1, 1,
0.9493335, -0.8984321, 2.496071, 1, 0, 0, 1, 1,
0.9570436, -0.514609, 2.372466, 1, 0, 0, 1, 1,
0.961664, 0.8289285, 0.3486956, 1, 0, 0, 1, 1,
0.963771, 0.7181635, 2.619834, 0, 0, 0, 1, 1,
0.9704707, -0.4464701, 2.479509, 0, 0, 0, 1, 1,
0.973138, 0.3434325, 2.835877, 0, 0, 0, 1, 1,
0.9741827, -0.5030024, 0.4171081, 0, 0, 0, 1, 1,
0.9746407, 1.068259, 1.123773, 0, 0, 0, 1, 1,
0.9763997, 0.5149213, 0.3914225, 0, 0, 0, 1, 1,
0.9809387, -0.02603306, 0.344001, 0, 0, 0, 1, 1,
0.9843371, -1.00294, 2.27988, 1, 1, 1, 1, 1,
0.9851366, 0.5388212, 1.836413, 1, 1, 1, 1, 1,
0.9874352, -0.1372566, 2.017791, 1, 1, 1, 1, 1,
0.9879155, -0.5028792, 2.188236, 1, 1, 1, 1, 1,
0.9898925, -0.5095807, 0.156627, 1, 1, 1, 1, 1,
0.9908292, 0.6076921, 0.8378105, 1, 1, 1, 1, 1,
0.995477, 0.06359871, 1.551191, 1, 1, 1, 1, 1,
0.9988762, 1.624075, 0.6519405, 1, 1, 1, 1, 1,
0.9994901, -0.1678658, 0.7325041, 1, 1, 1, 1, 1,
1.004481, 0.3497967, 2.025733, 1, 1, 1, 1, 1,
1.00738, 0.539607, 2.149123, 1, 1, 1, 1, 1,
1.008729, 0.06480725, 2.64763, 1, 1, 1, 1, 1,
1.012376, 0.7032992, 2.260394, 1, 1, 1, 1, 1,
1.012871, -0.08950603, 2.574081, 1, 1, 1, 1, 1,
1.013574, 0.5796893, 0.2566142, 1, 1, 1, 1, 1,
1.015851, -0.2858867, 2.134462, 0, 0, 1, 1, 1,
1.017429, 0.5958679, 1.911028, 1, 0, 0, 1, 1,
1.021379, 1.251825, 0.9740353, 1, 0, 0, 1, 1,
1.032883, 1.159425, 3.936713, 1, 0, 0, 1, 1,
1.035625, 0.6017106, 1.481576, 1, 0, 0, 1, 1,
1.043212, 0.7399966, 3.571718, 1, 0, 0, 1, 1,
1.044343, 1.49204, 2.13153, 0, 0, 0, 1, 1,
1.046391, -0.5820782, 2.544953, 0, 0, 0, 1, 1,
1.059945, -0.6941113, 2.619883, 0, 0, 0, 1, 1,
1.061572, 1.228605, 2.964644, 0, 0, 0, 1, 1,
1.061963, -0.1974667, 2.459295, 0, 0, 0, 1, 1,
1.064146, -0.7071723, 0.586773, 0, 0, 0, 1, 1,
1.06651, 3.042891, -0.1237467, 0, 0, 0, 1, 1,
1.070166, -1.334756, 1.470387, 1, 1, 1, 1, 1,
1.071632, 0.00735209, 3.024989, 1, 1, 1, 1, 1,
1.075802, 0.1601442, 3.018957, 1, 1, 1, 1, 1,
1.077109, 1.449127, 0.2133468, 1, 1, 1, 1, 1,
1.087847, 1.445838, 0.7435884, 1, 1, 1, 1, 1,
1.095145, 0.6927872, 0.4185809, 1, 1, 1, 1, 1,
1.108091, 1.74294, 0.1847625, 1, 1, 1, 1, 1,
1.120332, -0.4157594, 0.9561833, 1, 1, 1, 1, 1,
1.121998, 0.3538156, -0.08710118, 1, 1, 1, 1, 1,
1.129939, -0.1808343, -0.02994964, 1, 1, 1, 1, 1,
1.145618, 2.168238, -0.01033238, 1, 1, 1, 1, 1,
1.147133, 0.8653219, 1.273835, 1, 1, 1, 1, 1,
1.151492, 0.4829201, 1.996022, 1, 1, 1, 1, 1,
1.162536, -2.04988, 3.497286, 1, 1, 1, 1, 1,
1.181217, 0.8626919, 0.1609341, 1, 1, 1, 1, 1,
1.189388, 0.3297986, 0.37341, 0, 0, 1, 1, 1,
1.19261, -1.596765, 3.471179, 1, 0, 0, 1, 1,
1.197373, 0.5429435, 0.5490897, 1, 0, 0, 1, 1,
1.206325, 1.274985, -0.8545254, 1, 0, 0, 1, 1,
1.231331, -0.6440939, 2.164817, 1, 0, 0, 1, 1,
1.231413, -0.6323792, 2.273637, 1, 0, 0, 1, 1,
1.232265, -0.1381223, 2.461107, 0, 0, 0, 1, 1,
1.25443, 0.9561034, -0.1459989, 0, 0, 0, 1, 1,
1.269303, 0.02227779, 2.338334, 0, 0, 0, 1, 1,
1.269524, -2.116583, 1.600334, 0, 0, 0, 1, 1,
1.290209, -0.06628397, 2.989066, 0, 0, 0, 1, 1,
1.307789, 0.9762752, 1.161397, 0, 0, 0, 1, 1,
1.321038, -0.5167465, 2.926787, 0, 0, 0, 1, 1,
1.329479, -1.355147, 2.774046, 1, 1, 1, 1, 1,
1.344246, 0.6005164, 1.991437, 1, 1, 1, 1, 1,
1.348177, -1.317158, 3.867804, 1, 1, 1, 1, 1,
1.350692, -0.4692903, 1.683779, 1, 1, 1, 1, 1,
1.370389, 0.5356066, 1.22764, 1, 1, 1, 1, 1,
1.393697, 0.3244156, -1.462102, 1, 1, 1, 1, 1,
1.407088, 0.2999512, 1.348175, 1, 1, 1, 1, 1,
1.407792, 1.159246, 1.527658, 1, 1, 1, 1, 1,
1.418993, -0.3775587, 3.711828, 1, 1, 1, 1, 1,
1.432394, -1.147454, 1.646159, 1, 1, 1, 1, 1,
1.437454, 0.1436539, 2.71492, 1, 1, 1, 1, 1,
1.448408, 0.5662315, 1.273016, 1, 1, 1, 1, 1,
1.459209, -0.8176612, 1.558103, 1, 1, 1, 1, 1,
1.463422, -0.7033507, -0.02940948, 1, 1, 1, 1, 1,
1.475031, -0.8189783, 2.513048, 1, 1, 1, 1, 1,
1.51667, 0.5605633, 0.6523422, 0, 0, 1, 1, 1,
1.530873, 1.273888, 0.7095314, 1, 0, 0, 1, 1,
1.531375, 0.7997229, 1.531717, 1, 0, 0, 1, 1,
1.540414, -0.2508353, 1.842208, 1, 0, 0, 1, 1,
1.54143, 1.660788, 0.5670003, 1, 0, 0, 1, 1,
1.543301, -1.210285, 1.886042, 1, 0, 0, 1, 1,
1.546293, -1.39252, 3.573555, 0, 0, 0, 1, 1,
1.55, -0.01481375, 4.668289, 0, 0, 0, 1, 1,
1.55026, 0.4933065, 0.6368191, 0, 0, 0, 1, 1,
1.554115, -0.6865906, 2.915549, 0, 0, 0, 1, 1,
1.567767, 0.07081303, 3.045774, 0, 0, 0, 1, 1,
1.569369, 0.6475217, -0.08234233, 0, 0, 0, 1, 1,
1.570743, -0.7661403, 3.756103, 0, 0, 0, 1, 1,
1.581137, -0.1216675, 2.452381, 1, 1, 1, 1, 1,
1.599398, 0.3970484, 1.564391, 1, 1, 1, 1, 1,
1.599952, -1.58074, 1.497863, 1, 1, 1, 1, 1,
1.609555, 1.058316, 1.997586, 1, 1, 1, 1, 1,
1.611465, -0.8739688, 3.440377, 1, 1, 1, 1, 1,
1.613992, -2.163818, 4.005884, 1, 1, 1, 1, 1,
1.629624, 0.1220931, 1.282594, 1, 1, 1, 1, 1,
1.631489, -1.40399, 1.59437, 1, 1, 1, 1, 1,
1.631788, 0.7622941, 0.1059399, 1, 1, 1, 1, 1,
1.635298, 0.8009457, 1.499557, 1, 1, 1, 1, 1,
1.63652, 0.1160072, 1.840246, 1, 1, 1, 1, 1,
1.640585, 0.4744345, 2.805537, 1, 1, 1, 1, 1,
1.658684, -0.08447774, 1.476889, 1, 1, 1, 1, 1,
1.685659, 1.094229, -0.4741807, 1, 1, 1, 1, 1,
1.706741, 0.02401483, 3.034444, 1, 1, 1, 1, 1,
1.710913, 0.4879869, 0.3924889, 0, 0, 1, 1, 1,
1.720486, -1.000762, 1.859295, 1, 0, 0, 1, 1,
1.726766, 0.771957, 2.920642, 1, 0, 0, 1, 1,
1.728807, -1.737144, 2.908384, 1, 0, 0, 1, 1,
1.739365, -0.455944, 2.573611, 1, 0, 0, 1, 1,
1.753755, 1.097912, 0.381904, 1, 0, 0, 1, 1,
1.76361, -0.667591, 2.930682, 0, 0, 0, 1, 1,
1.796985, -0.315579, 2.309737, 0, 0, 0, 1, 1,
1.799482, -0.1229674, 1.160879, 0, 0, 0, 1, 1,
1.801723, -0.6179502, 2.039915, 0, 0, 0, 1, 1,
1.805333, -1.9861, 2.647017, 0, 0, 0, 1, 1,
1.806796, -1.688817, 4.714271, 0, 0, 0, 1, 1,
1.831099, -2.765908, 2.766938, 0, 0, 0, 1, 1,
1.846797, -0.3058369, 1.314936, 1, 1, 1, 1, 1,
1.848704, -0.5904574, 1.753001, 1, 1, 1, 1, 1,
1.858844, -2.123417, 1.827266, 1, 1, 1, 1, 1,
1.862329, -0.1464602, 1.487667, 1, 1, 1, 1, 1,
1.907832, 0.8777217, 0.957438, 1, 1, 1, 1, 1,
1.915395, -0.265868, 1.304972, 1, 1, 1, 1, 1,
1.917732, -1.756855, 3.614113, 1, 1, 1, 1, 1,
1.929528, 0.3062695, 0.1172455, 1, 1, 1, 1, 1,
1.946632, -0.3922091, 3.701234, 1, 1, 1, 1, 1,
1.948449, 0.6705086, 0.2093818, 1, 1, 1, 1, 1,
1.965404, -0.2175876, 2.82255, 1, 1, 1, 1, 1,
1.972201, -0.7553602, 1.052511, 1, 1, 1, 1, 1,
1.988272, -0.1709473, 1.827329, 1, 1, 1, 1, 1,
2.065828, 0.4564224, 0.2595873, 1, 1, 1, 1, 1,
2.082259, 0.8858135, 0.9326984, 1, 1, 1, 1, 1,
2.118631, 0.3396266, -0.1834444, 0, 0, 1, 1, 1,
2.174471, 1.289302, 0.2362669, 1, 0, 0, 1, 1,
2.177909, 1.482339, 0.6896151, 1, 0, 0, 1, 1,
2.201211, -1.182461, 0.6094513, 1, 0, 0, 1, 1,
2.215426, 0.1227425, 1.025023, 1, 0, 0, 1, 1,
2.215777, 0.6503451, 1.350413, 1, 0, 0, 1, 1,
2.229737, 0.4242412, 1.741673, 0, 0, 0, 1, 1,
2.284194, -0.9914066, 0.7586278, 0, 0, 0, 1, 1,
2.298504, -0.7880079, 1.062657, 0, 0, 0, 1, 1,
2.335005, -0.2367782, 2.699284, 0, 0, 0, 1, 1,
2.408511, -0.466933, 1.701571, 0, 0, 0, 1, 1,
2.410228, -0.9599516, 2.004991, 0, 0, 0, 1, 1,
2.414277, 0.1873669, 1.325748, 0, 0, 0, 1, 1,
2.470639, -0.9708642, 1.38695, 1, 1, 1, 1, 1,
2.50208, 0.3909984, 0.6341593, 1, 1, 1, 1, 1,
2.503672, 0.5678591, 0.09174746, 1, 1, 1, 1, 1,
2.536813, 1.709995, 2.85922, 1, 1, 1, 1, 1,
2.69002, 0.4192995, 1.074055, 1, 1, 1, 1, 1,
2.744031, 1.32799, 1.786851, 1, 1, 1, 1, 1,
2.854943, -1.15986, 1.051851, 1, 1, 1, 1, 1
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
var radius = 9.53047;
var distance = 33.47537;
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
mvMatrix.translate( 0.308923, 0.08981276, -0.01817513 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47537);
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
