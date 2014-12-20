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
-3.45298, 1.330777, -2.092132, 1, 0, 0, 1,
-3.333325, 1.420521, -0.4985472, 1, 0.007843138, 0, 1,
-2.673918, -0.9015695, -1.169417, 1, 0.01176471, 0, 1,
-2.586095, 1.164395, -1.029247, 1, 0.01960784, 0, 1,
-2.443682, -1.074928, -2.297282, 1, 0.02352941, 0, 1,
-2.403652, -0.2675141, -2.776913, 1, 0.03137255, 0, 1,
-2.227666, -0.05928834, -1.462328, 1, 0.03529412, 0, 1,
-2.227475, -0.6998946, -2.47848, 1, 0.04313726, 0, 1,
-2.185951, -0.08109152, -2.899458, 1, 0.04705882, 0, 1,
-2.141159, -0.6699175, -4.067541, 1, 0.05490196, 0, 1,
-2.126392, 0.3339354, -2.3491, 1, 0.05882353, 0, 1,
-2.121095, 0.2440379, -1.564383, 1, 0.06666667, 0, 1,
-2.091405, 1.015958, -1.820534, 1, 0.07058824, 0, 1,
-2.078501, -0.2880664, -2.601266, 1, 0.07843138, 0, 1,
-2.025347, 0.5843587, -3.687528, 1, 0.08235294, 0, 1,
-2.011618, 2.191785, -1.668879, 1, 0.09019608, 0, 1,
-1.995923, -0.6684029, -0.05406792, 1, 0.09411765, 0, 1,
-1.979247, 0.481744, -0.8492081, 1, 0.1019608, 0, 1,
-1.973693, -1.075998, -0.1328974, 1, 0.1098039, 0, 1,
-1.965758, -0.10976, -2.118861, 1, 0.1137255, 0, 1,
-1.911274, 0.3367904, -0.9420643, 1, 0.1215686, 0, 1,
-1.900133, 1.306225, -0.6039121, 1, 0.1254902, 0, 1,
-1.899832, -0.3748422, -0.1018125, 1, 0.1333333, 0, 1,
-1.897596, 0.6448885, 0.9403126, 1, 0.1372549, 0, 1,
-1.885888, -0.1430369, -1.363217, 1, 0.145098, 0, 1,
-1.884706, 1.118259, -1.151509, 1, 0.1490196, 0, 1,
-1.863798, -0.2420948, -1.63408, 1, 0.1568628, 0, 1,
-1.840469, -0.8866369, -2.453598, 1, 0.1607843, 0, 1,
-1.831979, -1.589013, -2.345326, 1, 0.1686275, 0, 1,
-1.825663, 0.5191358, -1.733446, 1, 0.172549, 0, 1,
-1.802684, -0.9300002, -1.198419, 1, 0.1803922, 0, 1,
-1.796207, 1.075472, -2.52953, 1, 0.1843137, 0, 1,
-1.783958, -1.804705, -2.989176, 1, 0.1921569, 0, 1,
-1.779533, -1.977283, -2.00983, 1, 0.1960784, 0, 1,
-1.779411, 1.432082, -1.257354, 1, 0.2039216, 0, 1,
-1.778959, -0.687557, -2.978372, 1, 0.2117647, 0, 1,
-1.777414, 1.077435, -1.593414, 1, 0.2156863, 0, 1,
-1.749882, -0.6752585, -2.087768, 1, 0.2235294, 0, 1,
-1.721987, -0.3736354, -1.170597, 1, 0.227451, 0, 1,
-1.718969, 0.5518751, -0.1218176, 1, 0.2352941, 0, 1,
-1.71818, -2.646088, -1.834231, 1, 0.2392157, 0, 1,
-1.706273, -0.0611341, -1.805048, 1, 0.2470588, 0, 1,
-1.684212, -0.4023048, -2.986412, 1, 0.2509804, 0, 1,
-1.677392, -0.8542282, -2.758092, 1, 0.2588235, 0, 1,
-1.636791, 0.8168218, -0.1862001, 1, 0.2627451, 0, 1,
-1.619208, 0.2704262, -0.7533574, 1, 0.2705882, 0, 1,
-1.608422, 0.4703899, -2.060555, 1, 0.2745098, 0, 1,
-1.603915, -0.0793226, -3.806254, 1, 0.282353, 0, 1,
-1.590766, 0.4075271, -0.00684455, 1, 0.2862745, 0, 1,
-1.584781, -0.4066154, -1.798973, 1, 0.2941177, 0, 1,
-1.575275, -0.947883, -2.157344, 1, 0.3019608, 0, 1,
-1.573547, 0.5947748, -2.643389, 1, 0.3058824, 0, 1,
-1.571844, -0.2960731, -1.506643, 1, 0.3137255, 0, 1,
-1.56499, -0.4583829, -1.594956, 1, 0.3176471, 0, 1,
-1.564075, -2.18108, -2.552598, 1, 0.3254902, 0, 1,
-1.550759, -0.6795965, -3.445189, 1, 0.3294118, 0, 1,
-1.547159, -0.157706, -3.213658, 1, 0.3372549, 0, 1,
-1.515607, 0.1223284, -0.5007438, 1, 0.3411765, 0, 1,
-1.514873, 0.4880852, -1.089781, 1, 0.3490196, 0, 1,
-1.497181, 1.542099, -2.03426, 1, 0.3529412, 0, 1,
-1.485735, 1.770239, -0.2293576, 1, 0.3607843, 0, 1,
-1.477085, -1.588986, -2.704389, 1, 0.3647059, 0, 1,
-1.461297, 1.410355, -1.677122, 1, 0.372549, 0, 1,
-1.453492, -0.6401029, -2.007622, 1, 0.3764706, 0, 1,
-1.437793, 0.4072603, -2.080537, 1, 0.3843137, 0, 1,
-1.434042, -1.084186, -0.9668298, 1, 0.3882353, 0, 1,
-1.416976, 2.01176, -0.4866391, 1, 0.3960784, 0, 1,
-1.414992, -0.6016792, -1.719722, 1, 0.4039216, 0, 1,
-1.412942, 1.747885, -1.161505, 1, 0.4078431, 0, 1,
-1.406879, 0.1756204, -1.973509, 1, 0.4156863, 0, 1,
-1.403863, -1.651404, -3.16384, 1, 0.4196078, 0, 1,
-1.40076, -0.6481981, -1.852422, 1, 0.427451, 0, 1,
-1.397244, 0.8520198, -0.2079827, 1, 0.4313726, 0, 1,
-1.382562, -0.4132307, -2.459555, 1, 0.4392157, 0, 1,
-1.370346, 0.7471496, -1.703349, 1, 0.4431373, 0, 1,
-1.364488, 1.149454, -1.744325, 1, 0.4509804, 0, 1,
-1.360816, -0.1736257, -2.671432, 1, 0.454902, 0, 1,
-1.357416, 1.279703, 0.6026525, 1, 0.4627451, 0, 1,
-1.355559, 0.8038343, -0.5178787, 1, 0.4666667, 0, 1,
-1.336929, 0.2610601, -2.01497, 1, 0.4745098, 0, 1,
-1.321758, -0.4599039, -1.990547, 1, 0.4784314, 0, 1,
-1.321329, -0.9463599, -1.018069, 1, 0.4862745, 0, 1,
-1.319842, -0.4802235, -4.47359, 1, 0.4901961, 0, 1,
-1.317614, 0.2532133, -1.711522, 1, 0.4980392, 0, 1,
-1.316743, 0.7117839, 0.3486012, 1, 0.5058824, 0, 1,
-1.308458, -0.8840051, -3.524136, 1, 0.509804, 0, 1,
-1.303438, 0.9890366, -1.93474, 1, 0.5176471, 0, 1,
-1.301697, -0.5196391, -1.692577, 1, 0.5215687, 0, 1,
-1.29801, -1.63907, -2.7054, 1, 0.5294118, 0, 1,
-1.296447, 0.4333262, -1.568398, 1, 0.5333334, 0, 1,
-1.294901, 1.115351, -0.4769014, 1, 0.5411765, 0, 1,
-1.288567, -0.01231858, -2.344959, 1, 0.5450981, 0, 1,
-1.280048, -0.955093, -3.152857, 1, 0.5529412, 0, 1,
-1.273057, -0.3510344, -2.056324, 1, 0.5568628, 0, 1,
-1.260753, 0.4252241, 0.05238617, 1, 0.5647059, 0, 1,
-1.260607, 0.40642, -0.7208857, 1, 0.5686275, 0, 1,
-1.257534, 1.732631, -1.413623, 1, 0.5764706, 0, 1,
-1.25726, 1.330937, -1.067049, 1, 0.5803922, 0, 1,
-1.254816, -0.06898593, -2.937716, 1, 0.5882353, 0, 1,
-1.252623, 0.863656, -0.6467013, 1, 0.5921569, 0, 1,
-1.240117, -2.565624, -3.323262, 1, 0.6, 0, 1,
-1.234554, 0.4362836, -0.753895, 1, 0.6078432, 0, 1,
-1.233453, -0.5146242, -1.701233, 1, 0.6117647, 0, 1,
-1.228081, -0.9535899, -0.9431096, 1, 0.6196079, 0, 1,
-1.215693, -0.7608811, -2.453732, 1, 0.6235294, 0, 1,
-1.210397, -0.6918114, -1.035882, 1, 0.6313726, 0, 1,
-1.204474, 0.324509, -2.124007, 1, 0.6352941, 0, 1,
-1.201535, 1.375534, -1.258167, 1, 0.6431373, 0, 1,
-1.198818, 0.9268904, -1.446195, 1, 0.6470588, 0, 1,
-1.191917, 1.021437, -0.7988865, 1, 0.654902, 0, 1,
-1.186538, 1.038026, -2.565409, 1, 0.6588235, 0, 1,
-1.175062, -1.172519, -4.313819, 1, 0.6666667, 0, 1,
-1.173669, 0.5908947, -2.775605, 1, 0.6705883, 0, 1,
-1.170627, 0.7787236, -1.393159, 1, 0.6784314, 0, 1,
-1.169227, 1.668071, -0.9352044, 1, 0.682353, 0, 1,
-1.167845, 0.4500978, -1.17492, 1, 0.6901961, 0, 1,
-1.161403, 1.342084, 0.04852525, 1, 0.6941177, 0, 1,
-1.161045, 0.1100001, -0.4409204, 1, 0.7019608, 0, 1,
-1.153829, -0.05173685, -0.8517135, 1, 0.7098039, 0, 1,
-1.135326, 0.764931, -0.8113034, 1, 0.7137255, 0, 1,
-1.127541, -0.4592657, -2.457422, 1, 0.7215686, 0, 1,
-1.125, 1.022834, 0.1771911, 1, 0.7254902, 0, 1,
-1.119177, -0.934334, -2.553018, 1, 0.7333333, 0, 1,
-1.114399, 3.070694, -1.814717, 1, 0.7372549, 0, 1,
-1.114315, -0.1882108, -2.201582, 1, 0.7450981, 0, 1,
-1.108957, 0.822398, -0.7524412, 1, 0.7490196, 0, 1,
-1.106701, -0.3751847, -1.299249, 1, 0.7568628, 0, 1,
-1.104897, 0.5980073, -0.5123267, 1, 0.7607843, 0, 1,
-1.104397, 0.1708321, -0.5477569, 1, 0.7686275, 0, 1,
-1.101665, -1.24762, -1.770068, 1, 0.772549, 0, 1,
-1.101562, 0.8037555, 0.1056346, 1, 0.7803922, 0, 1,
-1.092719, 0.2692027, -0.868236, 1, 0.7843137, 0, 1,
-1.077964, 1.523495, 0.3179908, 1, 0.7921569, 0, 1,
-1.071986, -0.6582099, -1.931671, 1, 0.7960784, 0, 1,
-1.070144, 0.0533832, -2.67072, 1, 0.8039216, 0, 1,
-1.067292, -1.319283, -1.177341, 1, 0.8117647, 0, 1,
-1.066622, -0.2616269, -2.136509, 1, 0.8156863, 0, 1,
-1.065946, 0.2044182, -1.186798, 1, 0.8235294, 0, 1,
-1.06572, -0.8761492, -2.437557, 1, 0.827451, 0, 1,
-1.061953, -0.1211405, -1.861333, 1, 0.8352941, 0, 1,
-1.061454, 0.6599433, -0.4774085, 1, 0.8392157, 0, 1,
-1.054904, -0.6269156, -0.5447126, 1, 0.8470588, 0, 1,
-1.052973, -1.021697, -1.550113, 1, 0.8509804, 0, 1,
-1.052723, -0.4465628, -3.083594, 1, 0.8588235, 0, 1,
-1.048714, 0.7361674, -0.5552568, 1, 0.8627451, 0, 1,
-1.046792, 0.3935881, -0.869372, 1, 0.8705882, 0, 1,
-1.043626, -0.9422984, -2.951713, 1, 0.8745098, 0, 1,
-1.03706, 1.006943, -0.1295864, 1, 0.8823529, 0, 1,
-1.033845, 0.992608, 0.1418178, 1, 0.8862745, 0, 1,
-1.031923, 0.3751785, -1.156634, 1, 0.8941177, 0, 1,
-1.02603, 0.2947593, 0.7611317, 1, 0.8980392, 0, 1,
-1.017043, -0.3359776, -2.430041, 1, 0.9058824, 0, 1,
-1.016359, -1.309404, -3.033575, 1, 0.9137255, 0, 1,
-1.006831, -0.467092, -2.947983, 1, 0.9176471, 0, 1,
-1.00437, -0.02545893, -1.424927, 1, 0.9254902, 0, 1,
-0.9991974, 1.09524, -0.5087043, 1, 0.9294118, 0, 1,
-0.9978238, -0.077096, -1.326772, 1, 0.9372549, 0, 1,
-0.9861704, -0.5320122, -1.553645, 1, 0.9411765, 0, 1,
-0.985406, -0.4315755, -0.2301633, 1, 0.9490196, 0, 1,
-0.9629201, 0.2576829, -0.1779007, 1, 0.9529412, 0, 1,
-0.9627672, -0.1830887, -1.813406, 1, 0.9607843, 0, 1,
-0.9618161, 0.3499134, -1.380401, 1, 0.9647059, 0, 1,
-0.9594889, 0.961, -2.225588, 1, 0.972549, 0, 1,
-0.9587577, 1.140652, -0.4730558, 1, 0.9764706, 0, 1,
-0.9548196, -0.7122398, -2.520813, 1, 0.9843137, 0, 1,
-0.9539841, 1.789145, -2.532902, 1, 0.9882353, 0, 1,
-0.9497115, 0.5245689, -0.7779652, 1, 0.9960784, 0, 1,
-0.9462883, 0.8294277, -2.905884, 0.9960784, 1, 0, 1,
-0.944843, -0.4075536, -1.740394, 0.9921569, 1, 0, 1,
-0.9447817, -0.8311542, -3.109573, 0.9843137, 1, 0, 1,
-0.943591, -1.195852, -2.279233, 0.9803922, 1, 0, 1,
-0.9430304, 0.4159043, -0.3252613, 0.972549, 1, 0, 1,
-0.9411918, 0.2441406, -2.034624, 0.9686275, 1, 0, 1,
-0.9392392, -0.05490625, -1.147103, 0.9607843, 1, 0, 1,
-0.9365084, 1.156125, -1.013782, 0.9568627, 1, 0, 1,
-0.9215981, -0.4524815, -2.558075, 0.9490196, 1, 0, 1,
-0.9178514, -0.5327796, -0.6334369, 0.945098, 1, 0, 1,
-0.9133619, 0.9329987, -1.2475, 0.9372549, 1, 0, 1,
-0.9021026, -1.214286, -1.481814, 0.9333333, 1, 0, 1,
-0.9015864, 1.14949, -0.4773668, 0.9254902, 1, 0, 1,
-0.899505, -0.8691207, -2.192148, 0.9215686, 1, 0, 1,
-0.896184, -0.8779323, -0.7405393, 0.9137255, 1, 0, 1,
-0.8914859, -1.39847, -4.513161, 0.9098039, 1, 0, 1,
-0.8914167, -0.4553649, -3.398693, 0.9019608, 1, 0, 1,
-0.8905149, -0.6554747, -1.965129, 0.8941177, 1, 0, 1,
-0.8844689, -0.3796335, -2.91085, 0.8901961, 1, 0, 1,
-0.8750501, -0.6093651, -2.200051, 0.8823529, 1, 0, 1,
-0.8700847, 0.1100754, -0.4876393, 0.8784314, 1, 0, 1,
-0.8641328, -1.256247, -2.053736, 0.8705882, 1, 0, 1,
-0.8639977, -0.05165814, -2.653002, 0.8666667, 1, 0, 1,
-0.8607855, 0.001342573, -3.700389, 0.8588235, 1, 0, 1,
-0.8607481, -0.1133343, -1.418968, 0.854902, 1, 0, 1,
-0.8562042, 0.4268384, -0.5238726, 0.8470588, 1, 0, 1,
-0.8525991, 0.69113, -2.661385, 0.8431373, 1, 0, 1,
-0.851324, 0.1222449, -3.839731, 0.8352941, 1, 0, 1,
-0.851189, -1.072765, -2.239722, 0.8313726, 1, 0, 1,
-0.8506876, -0.8918486, -2.538368, 0.8235294, 1, 0, 1,
-0.8433052, -1.429792, -0.1891678, 0.8196079, 1, 0, 1,
-0.8360569, -0.98633, -2.524503, 0.8117647, 1, 0, 1,
-0.8324695, -1.009894, -1.850601, 0.8078431, 1, 0, 1,
-0.8302222, -2.330938, -3.759939, 0.8, 1, 0, 1,
-0.8300186, -0.6683816, -1.493256, 0.7921569, 1, 0, 1,
-0.8287308, -1.090479, -2.206999, 0.7882353, 1, 0, 1,
-0.8272646, 0.7314777, -1.176852, 0.7803922, 1, 0, 1,
-0.8259324, 2.139491, -1.436859, 0.7764706, 1, 0, 1,
-0.8108065, -2.017492, -1.832459, 0.7686275, 1, 0, 1,
-0.8064505, -0.185321, -2.728556, 0.7647059, 1, 0, 1,
-0.7975012, -0.6673234, -3.002653, 0.7568628, 1, 0, 1,
-0.7972785, -0.1179702, -2.528199, 0.7529412, 1, 0, 1,
-0.7970124, -0.7036124, -2.426075, 0.7450981, 1, 0, 1,
-0.7963871, 1.139414, 0.5615114, 0.7411765, 1, 0, 1,
-0.7929439, -1.150091, -2.29948, 0.7333333, 1, 0, 1,
-0.7902238, 1.525035, -1.465337, 0.7294118, 1, 0, 1,
-0.7884437, -0.2745911, -2.578369, 0.7215686, 1, 0, 1,
-0.7876651, -0.981775, -2.449952, 0.7176471, 1, 0, 1,
-0.7854345, -0.2021242, -0.2459949, 0.7098039, 1, 0, 1,
-0.7815287, 0.5244871, -1.059354, 0.7058824, 1, 0, 1,
-0.7786189, -0.4364098, -3.335994, 0.6980392, 1, 0, 1,
-0.7740654, 0.6016167, -0.935571, 0.6901961, 1, 0, 1,
-0.7737977, 0.2471555, -1.364522, 0.6862745, 1, 0, 1,
-0.7545468, 1.47817, -1.70064, 0.6784314, 1, 0, 1,
-0.7508351, -0.1857112, -2.5653, 0.6745098, 1, 0, 1,
-0.74992, 1.493721, 1.446286, 0.6666667, 1, 0, 1,
-0.7493824, 1.297548, -1.679198, 0.6627451, 1, 0, 1,
-0.7408522, -1.337667, -2.938092, 0.654902, 1, 0, 1,
-0.7394359, -1.098033, -3.031579, 0.6509804, 1, 0, 1,
-0.7347431, 0.3275093, -0.2016162, 0.6431373, 1, 0, 1,
-0.7313609, -0.1826009, -3.127019, 0.6392157, 1, 0, 1,
-0.7259909, 0.2773823, 0.04003606, 0.6313726, 1, 0, 1,
-0.7250146, 0.1314718, -2.833477, 0.627451, 1, 0, 1,
-0.7235839, 0.4171562, -1.487774, 0.6196079, 1, 0, 1,
-0.7214209, -1.571813, -1.341143, 0.6156863, 1, 0, 1,
-0.7086493, -0.6860262, -1.932412, 0.6078432, 1, 0, 1,
-0.707572, 0.5503541, -0.9596852, 0.6039216, 1, 0, 1,
-0.7004725, 0.1316076, -0.8737596, 0.5960785, 1, 0, 1,
-0.6973497, 0.1368311, -2.890989, 0.5882353, 1, 0, 1,
-0.6967611, -0.3923641, -1.509702, 0.5843138, 1, 0, 1,
-0.6849798, -2.055627, -2.418769, 0.5764706, 1, 0, 1,
-0.6807761, 0.1137677, 0.1589911, 0.572549, 1, 0, 1,
-0.6795608, 0.290725, -1.604365, 0.5647059, 1, 0, 1,
-0.6775562, -0.7604387, -2.671907, 0.5607843, 1, 0, 1,
-0.6766195, 1.621683, -0.03979214, 0.5529412, 1, 0, 1,
-0.674546, 1.216933, -0.05836178, 0.5490196, 1, 0, 1,
-0.6721901, 0.7053199, -0.04976493, 0.5411765, 1, 0, 1,
-0.671049, 0.2265896, 0.02477584, 0.5372549, 1, 0, 1,
-0.6704677, 0.3732943, 0.3797079, 0.5294118, 1, 0, 1,
-0.6699669, -0.285102, -2.585054, 0.5254902, 1, 0, 1,
-0.6625046, 0.6599028, 1.004847, 0.5176471, 1, 0, 1,
-0.6623173, -0.7981655, -3.441716, 0.5137255, 1, 0, 1,
-0.6538626, 1.298672, -0.7937436, 0.5058824, 1, 0, 1,
-0.6532388, -1.359231, -2.346386, 0.5019608, 1, 0, 1,
-0.6469463, 0.1422807, -1.205893, 0.4941176, 1, 0, 1,
-0.6443201, 1.076783, -2.050059, 0.4862745, 1, 0, 1,
-0.6408687, 0.8427104, -2.094957, 0.4823529, 1, 0, 1,
-0.6400015, -0.3093353, -1.839617, 0.4745098, 1, 0, 1,
-0.6386412, -1.216891, -4.754991, 0.4705882, 1, 0, 1,
-0.6370119, -0.5760059, -1.0744, 0.4627451, 1, 0, 1,
-0.6361233, 2.14341, -1.32786, 0.4588235, 1, 0, 1,
-0.6338417, 0.05858247, -1.827043, 0.4509804, 1, 0, 1,
-0.6324044, 1.876256, -2.236385, 0.4470588, 1, 0, 1,
-0.6320549, -0.1737792, -2.141725, 0.4392157, 1, 0, 1,
-0.6310084, -1.004268, -2.573946, 0.4352941, 1, 0, 1,
-0.628679, -0.2806487, -1.470905, 0.427451, 1, 0, 1,
-0.6278133, 0.2359938, -1.363446, 0.4235294, 1, 0, 1,
-0.6263546, 0.3122245, -1.086616, 0.4156863, 1, 0, 1,
-0.6243003, 0.7005961, -1.010833, 0.4117647, 1, 0, 1,
-0.623731, -0.1898927, -1.430383, 0.4039216, 1, 0, 1,
-0.6181736, -1.046722, -2.72087, 0.3960784, 1, 0, 1,
-0.6167212, -2.208149, -2.356951, 0.3921569, 1, 0, 1,
-0.6140525, -0.06467776, -0.5586016, 0.3843137, 1, 0, 1,
-0.6127428, -0.3205433, -1.862381, 0.3803922, 1, 0, 1,
-0.6105416, -0.484941, -2.127465, 0.372549, 1, 0, 1,
-0.6104389, -0.9401777, -3.999033, 0.3686275, 1, 0, 1,
-0.6096706, -1.618622, -2.44695, 0.3607843, 1, 0, 1,
-0.6056635, -0.2095954, -1.135294, 0.3568628, 1, 0, 1,
-0.6037992, 0.7310974, -1.557466, 0.3490196, 1, 0, 1,
-0.6037431, 0.3580208, -2.979041, 0.345098, 1, 0, 1,
-0.6028232, 2.247084, -0.6738254, 0.3372549, 1, 0, 1,
-0.6011685, -0.134673, -2.172255, 0.3333333, 1, 0, 1,
-0.5983897, 1.583632, 0.4401138, 0.3254902, 1, 0, 1,
-0.5952798, 0.62654, -0.5963781, 0.3215686, 1, 0, 1,
-0.5930412, -0.8298653, -4.849444, 0.3137255, 1, 0, 1,
-0.5919423, 0.5777851, -1.8453, 0.3098039, 1, 0, 1,
-0.5873855, 0.531504, -1.79884, 0.3019608, 1, 0, 1,
-0.5833676, 2.099416, -1.02915, 0.2941177, 1, 0, 1,
-0.582584, 0.3654452, -2.08368, 0.2901961, 1, 0, 1,
-0.5800741, 0.9585786, 1.267853, 0.282353, 1, 0, 1,
-0.5800647, -0.6122316, -3.008222, 0.2784314, 1, 0, 1,
-0.5790926, -0.09843288, -2.941612, 0.2705882, 1, 0, 1,
-0.5783006, 0.7900749, -1.558475, 0.2666667, 1, 0, 1,
-0.5774437, 1.693037, -0.9969202, 0.2588235, 1, 0, 1,
-0.5770798, -0.1166326, -2.864608, 0.254902, 1, 0, 1,
-0.5764418, -0.06343064, -0.6716496, 0.2470588, 1, 0, 1,
-0.5742941, -0.5709674, -1.254003, 0.2431373, 1, 0, 1,
-0.5669928, -1.442489, -3.332338, 0.2352941, 1, 0, 1,
-0.5648073, 1.583782, 2.224661, 0.2313726, 1, 0, 1,
-0.5616923, 0.9012606, -1.265276, 0.2235294, 1, 0, 1,
-0.5591087, -0.07998499, -3.290037, 0.2196078, 1, 0, 1,
-0.5562887, -0.8806773, -3.014962, 0.2117647, 1, 0, 1,
-0.55419, 0.2679745, -1.06661, 0.2078431, 1, 0, 1,
-0.5525573, 0.09737775, -0.316544, 0.2, 1, 0, 1,
-0.5501321, -1.784568, -3.109446, 0.1921569, 1, 0, 1,
-0.5458446, 1.839277, -2.510843, 0.1882353, 1, 0, 1,
-0.5372317, 0.04591134, -2.384482, 0.1803922, 1, 0, 1,
-0.5367114, 0.2023175, -1.385144, 0.1764706, 1, 0, 1,
-0.5356535, 1.145464, -0.7836748, 0.1686275, 1, 0, 1,
-0.5316762, 0.006891868, -1.422707, 0.1647059, 1, 0, 1,
-0.5256142, -0.9984035, -3.123353, 0.1568628, 1, 0, 1,
-0.5170469, -0.1633084, -2.164785, 0.1529412, 1, 0, 1,
-0.5166079, 0.7403042, -1.065827, 0.145098, 1, 0, 1,
-0.5163097, -0.1898852, -0.5919153, 0.1411765, 1, 0, 1,
-0.5147074, -0.4074807, -1.711088, 0.1333333, 1, 0, 1,
-0.5137736, 0.6351787, -1.645122, 0.1294118, 1, 0, 1,
-0.5130739, 0.2792063, -0.4385854, 0.1215686, 1, 0, 1,
-0.5120991, -0.4155801, -1.64675, 0.1176471, 1, 0, 1,
-0.5120202, 1.153878, -2.168063, 0.1098039, 1, 0, 1,
-0.5080276, 1.383011, 0.8109504, 0.1058824, 1, 0, 1,
-0.5073679, 0.2818984, -0.9120758, 0.09803922, 1, 0, 1,
-0.505203, 1.925319, -0.3919958, 0.09019608, 1, 0, 1,
-0.5012714, -0.005458185, -3.157966, 0.08627451, 1, 0, 1,
-0.5003502, -0.4014034, -1.03008, 0.07843138, 1, 0, 1,
-0.4987975, 0.7204974, -1.634385, 0.07450981, 1, 0, 1,
-0.4970879, -0.6756794, -3.344976, 0.06666667, 1, 0, 1,
-0.4946317, -0.9032106, -3.672012, 0.0627451, 1, 0, 1,
-0.4944195, -1.230195, -2.192265, 0.05490196, 1, 0, 1,
-0.4906164, 1.461903, -0.8393756, 0.05098039, 1, 0, 1,
-0.4851767, -0.8789402, -2.403744, 0.04313726, 1, 0, 1,
-0.4845104, -0.2568788, -1.898237, 0.03921569, 1, 0, 1,
-0.4824093, 1.439523, -0.3971223, 0.03137255, 1, 0, 1,
-0.4800833, 0.929775, 0.8012874, 0.02745098, 1, 0, 1,
-0.4790894, 0.09078152, -1.823969, 0.01960784, 1, 0, 1,
-0.4773329, -0.0681494, -2.129258, 0.01568628, 1, 0, 1,
-0.4751725, -0.975149, -3.507034, 0.007843138, 1, 0, 1,
-0.4647065, -0.5129965, -3.223206, 0.003921569, 1, 0, 1,
-0.4583321, 0.1859528, -1.379629, 0, 1, 0.003921569, 1,
-0.4582212, 1.165699, 1.356682, 0, 1, 0.01176471, 1,
-0.453611, 0.220348, -0.01472418, 0, 1, 0.01568628, 1,
-0.4443431, -1.242194, -4.55457, 0, 1, 0.02352941, 1,
-0.4416608, 1.432381, -1.026277, 0, 1, 0.02745098, 1,
-0.4415713, 1.273002, 0.1201876, 0, 1, 0.03529412, 1,
-0.435816, 0.01863356, -3.009337, 0, 1, 0.03921569, 1,
-0.4356565, -1.020547, -3.58312, 0, 1, 0.04705882, 1,
-0.4314449, 0.3461806, -0.4477078, 0, 1, 0.05098039, 1,
-0.4312074, -0.2148423, -3.142713, 0, 1, 0.05882353, 1,
-0.4301988, -1.107932, -1.938706, 0, 1, 0.0627451, 1,
-0.4270378, 0.1986088, -0.3954319, 0, 1, 0.07058824, 1,
-0.4265295, 0.9380092, 0.7559428, 0, 1, 0.07450981, 1,
-0.4257636, 1.535544, -0.3902293, 0, 1, 0.08235294, 1,
-0.4222134, 0.6424626, -2.499055, 0, 1, 0.08627451, 1,
-0.4206256, -1.080882, -1.655131, 0, 1, 0.09411765, 1,
-0.4162161, 0.5245557, 0.2613073, 0, 1, 0.1019608, 1,
-0.4124157, -1.072769, -2.537039, 0, 1, 0.1058824, 1,
-0.4107867, 1.294271, -0.982861, 0, 1, 0.1137255, 1,
-0.4082335, -0.3299428, -1.389923, 0, 1, 0.1176471, 1,
-0.4072873, 0.6974707, -0.4454074, 0, 1, 0.1254902, 1,
-0.4059961, -1.639315, -3.512692, 0, 1, 0.1294118, 1,
-0.3967037, 0.8314709, 0.4044955, 0, 1, 0.1372549, 1,
-0.3916123, -2.046063, -2.39612, 0, 1, 0.1411765, 1,
-0.3867536, 0.9930415, -1.085761, 0, 1, 0.1490196, 1,
-0.3822767, -1.9001, -2.165842, 0, 1, 0.1529412, 1,
-0.3789343, 1.124892, -0.3865627, 0, 1, 0.1607843, 1,
-0.3756173, 1.706211, 0.879867, 0, 1, 0.1647059, 1,
-0.3699909, 0.4161268, 0.4372724, 0, 1, 0.172549, 1,
-0.3698655, 2.272428, -2.196851, 0, 1, 0.1764706, 1,
-0.369862, -0.6993299, -3.161117, 0, 1, 0.1843137, 1,
-0.3690487, 0.992843, -0.5408387, 0, 1, 0.1882353, 1,
-0.3688508, 0.411458, -1.433031, 0, 1, 0.1960784, 1,
-0.3609466, -2.132499, -3.397406, 0, 1, 0.2039216, 1,
-0.3601758, 1.154934, -1.683318, 0, 1, 0.2078431, 1,
-0.3491583, 0.6199808, -0.03259076, 0, 1, 0.2156863, 1,
-0.3488728, 0.2794857, -0.9918671, 0, 1, 0.2196078, 1,
-0.3384548, 1.531114, -1.597397, 0, 1, 0.227451, 1,
-0.338392, -2.099614, -2.79601, 0, 1, 0.2313726, 1,
-0.3376853, -0.07289084, -1.735057, 0, 1, 0.2392157, 1,
-0.3376201, -1.628061, -2.935407, 0, 1, 0.2431373, 1,
-0.3352858, -0.629961, -3.223215, 0, 1, 0.2509804, 1,
-0.3340019, -0.3683678, 0.3863949, 0, 1, 0.254902, 1,
-0.3292744, 0.2617346, -1.486684, 0, 1, 0.2627451, 1,
-0.3262973, 1.135562, -0.5499368, 0, 1, 0.2666667, 1,
-0.3262754, 0.5638642, -0.3535052, 0, 1, 0.2745098, 1,
-0.3246646, 0.6228055, -1.162629, 0, 1, 0.2784314, 1,
-0.3226983, 1.652403, -0.1356571, 0, 1, 0.2862745, 1,
-0.3201922, -0.1684259, -1.435194, 0, 1, 0.2901961, 1,
-0.3197734, 0.2870791, -0.1859226, 0, 1, 0.2980392, 1,
-0.319413, 1.074953, -1.222665, 0, 1, 0.3058824, 1,
-0.3178236, -1.99585, -3.958603, 0, 1, 0.3098039, 1,
-0.3170243, -0.8465571, -3.039592, 0, 1, 0.3176471, 1,
-0.3154991, 1.879351, 0.09823106, 0, 1, 0.3215686, 1,
-0.3136551, 1.416923, -0.3153645, 0, 1, 0.3294118, 1,
-0.3074465, 0.5787125, 0.5121291, 0, 1, 0.3333333, 1,
-0.3047345, 0.6571524, 0.2347631, 0, 1, 0.3411765, 1,
-0.3042587, 0.6192687, -1.215651, 0, 1, 0.345098, 1,
-0.303557, -1.286259, -1.775794, 0, 1, 0.3529412, 1,
-0.3021516, -0.2764746, -2.560856, 0, 1, 0.3568628, 1,
-0.3008499, 0.5370776, -0.4369703, 0, 1, 0.3647059, 1,
-0.2979539, 0.6621691, -0.240954, 0, 1, 0.3686275, 1,
-0.297344, 0.3829696, 0.1083226, 0, 1, 0.3764706, 1,
-0.2964947, 1.161609, 0.396011, 0, 1, 0.3803922, 1,
-0.2930221, -1.869494, -2.915426, 0, 1, 0.3882353, 1,
-0.2911597, 1.263068, 0.7841865, 0, 1, 0.3921569, 1,
-0.2908317, 0.4650531, 0.5409972, 0, 1, 0.4, 1,
-0.2850752, 0.6323625, 0.2852417, 0, 1, 0.4078431, 1,
-0.2840525, 0.0475069, -1.654404, 0, 1, 0.4117647, 1,
-0.2833746, 0.1885661, -2.578322, 0, 1, 0.4196078, 1,
-0.2772965, -0.5319759, -2.869735, 0, 1, 0.4235294, 1,
-0.2745801, 0.7652674, 1.164156, 0, 1, 0.4313726, 1,
-0.2645194, 1.007504, 0.06999245, 0, 1, 0.4352941, 1,
-0.2618076, -0.7119648, -2.122041, 0, 1, 0.4431373, 1,
-0.2525307, -0.5329649, -3.636467, 0, 1, 0.4470588, 1,
-0.2525067, 0.6757259, 1.161618, 0, 1, 0.454902, 1,
-0.2515457, 0.3309014, 0.9025696, 0, 1, 0.4588235, 1,
-0.2501279, -0.5848756, -3.027466, 0, 1, 0.4666667, 1,
-0.2500158, -0.5289829, -2.468317, 0, 1, 0.4705882, 1,
-0.2488022, 0.7948539, 2.374061, 0, 1, 0.4784314, 1,
-0.2480656, -0.3493441, -3.210913, 0, 1, 0.4823529, 1,
-0.2463602, -2.177228, -3.755907, 0, 1, 0.4901961, 1,
-0.2407058, -0.1957861, -3.277305, 0, 1, 0.4941176, 1,
-0.2397026, 0.120901, -0.9676591, 0, 1, 0.5019608, 1,
-0.2337388, -0.1278792, -3.676062, 0, 1, 0.509804, 1,
-0.2303187, 0.4235696, 1.392567, 0, 1, 0.5137255, 1,
-0.2275895, -1.753585, -3.765777, 0, 1, 0.5215687, 1,
-0.2273173, -2.020679, -2.82584, 0, 1, 0.5254902, 1,
-0.2270569, 0.3112556, -1.497006, 0, 1, 0.5333334, 1,
-0.2267849, -0.3705829, -2.122597, 0, 1, 0.5372549, 1,
-0.2197596, -0.3035242, -1.543767, 0, 1, 0.5450981, 1,
-0.2183716, -0.8260844, -2.866561, 0, 1, 0.5490196, 1,
-0.2122336, 0.7568711, -1.007271, 0, 1, 0.5568628, 1,
-0.2098809, -1.053264, -2.562141, 0, 1, 0.5607843, 1,
-0.2096789, 1.966806, -1.670826, 0, 1, 0.5686275, 1,
-0.2066914, 0.8422002, 1.415957, 0, 1, 0.572549, 1,
-0.2060797, -1.464946, -3.13703, 0, 1, 0.5803922, 1,
-0.203823, -1.652382, -4.236264, 0, 1, 0.5843138, 1,
-0.203369, 3.609167, 1.987982, 0, 1, 0.5921569, 1,
-0.202941, 1.582567, -0.4120197, 0, 1, 0.5960785, 1,
-0.2012153, -1.109764, -2.084344, 0, 1, 0.6039216, 1,
-0.1987263, -1.536267, -2.580503, 0, 1, 0.6117647, 1,
-0.1952144, -0.5625708, -2.642994, 0, 1, 0.6156863, 1,
-0.1921361, -0.9368408, -1.888817, 0, 1, 0.6235294, 1,
-0.1841922, 2.175192, -0.2928643, 0, 1, 0.627451, 1,
-0.175469, -0.5364684, -3.04941, 0, 1, 0.6352941, 1,
-0.1727317, -1.359, -3.711348, 0, 1, 0.6392157, 1,
-0.1699961, -0.7997428, -3.676146, 0, 1, 0.6470588, 1,
-0.1672606, 0.08530822, -0.3050214, 0, 1, 0.6509804, 1,
-0.1633995, -0.1829785, -1.367037, 0, 1, 0.6588235, 1,
-0.1625505, -1.034446, -3.94777, 0, 1, 0.6627451, 1,
-0.1590421, 1.436783, -0.6695276, 0, 1, 0.6705883, 1,
-0.1516371, -1.294855, -3.135212, 0, 1, 0.6745098, 1,
-0.1499234, -0.9074329, -2.329936, 0, 1, 0.682353, 1,
-0.1494607, 0.8242034, -2.161805, 0, 1, 0.6862745, 1,
-0.1437812, 0.1012781, -1.229086, 0, 1, 0.6941177, 1,
-0.1436784, 1.50479, 0.4754272, 0, 1, 0.7019608, 1,
-0.1421182, 1.0647, -0.2521225, 0, 1, 0.7058824, 1,
-0.141579, 1.505298, 0.4864945, 0, 1, 0.7137255, 1,
-0.1407481, -0.1070543, -2.417944, 0, 1, 0.7176471, 1,
-0.1383046, 0.160678, -1.025582, 0, 1, 0.7254902, 1,
-0.1359763, -1.040361, -4.148334, 0, 1, 0.7294118, 1,
-0.1335014, -1.6755, -3.27008, 0, 1, 0.7372549, 1,
-0.1247985, -0.259081, -2.253766, 0, 1, 0.7411765, 1,
-0.113342, 0.8479144, -1.462937, 0, 1, 0.7490196, 1,
-0.1131882, -1.16581, -3.949183, 0, 1, 0.7529412, 1,
-0.1124819, -0.8158914, -4.196032, 0, 1, 0.7607843, 1,
-0.1046932, -0.07252766, -1.385351, 0, 1, 0.7647059, 1,
-0.1018896, -0.5263798, -3.796642, 0, 1, 0.772549, 1,
-0.1002226, 2.933974, 0.08815974, 0, 1, 0.7764706, 1,
-0.09959821, -1.706628, -2.780987, 0, 1, 0.7843137, 1,
-0.09083787, 0.1954487, -1.033961, 0, 1, 0.7882353, 1,
-0.09056873, 1.294188, -0.5756683, 0, 1, 0.7960784, 1,
-0.09000713, -0.1370816, -2.863577, 0, 1, 0.8039216, 1,
-0.08876691, 0.2372759, 0.8838693, 0, 1, 0.8078431, 1,
-0.0882334, -0.6859249, -2.199492, 0, 1, 0.8156863, 1,
-0.08503656, -0.8766195, -4.329812, 0, 1, 0.8196079, 1,
-0.08435298, -0.4654782, -2.879913, 0, 1, 0.827451, 1,
-0.08276648, -1.132184, -3.0818, 0, 1, 0.8313726, 1,
-0.07812675, -0.5975699, -1.040288, 0, 1, 0.8392157, 1,
-0.07346783, -0.6724464, -2.34684, 0, 1, 0.8431373, 1,
-0.07080175, -0.7938681, -3.135797, 0, 1, 0.8509804, 1,
-0.06857072, -0.4164814, -2.828807, 0, 1, 0.854902, 1,
-0.0665171, -1.047774, -1.541868, 0, 1, 0.8627451, 1,
-0.06638876, 0.05244538, 0.9502034, 0, 1, 0.8666667, 1,
-0.06515165, 0.1262066, 0.11736, 0, 1, 0.8745098, 1,
-0.05951217, -0.4604011, -1.801401, 0, 1, 0.8784314, 1,
-0.05940775, -0.3764604, -2.016759, 0, 1, 0.8862745, 1,
-0.05747532, 0.2506638, -0.07756357, 0, 1, 0.8901961, 1,
-0.05747423, 0.318396, -0.111883, 0, 1, 0.8980392, 1,
-0.04991954, -0.122114, -2.676341, 0, 1, 0.9058824, 1,
-0.04959398, -2.004565, -4.735236, 0, 1, 0.9098039, 1,
-0.04777975, 0.3141093, -0.4618557, 0, 1, 0.9176471, 1,
-0.04138439, 0.3267455, 0.7178953, 0, 1, 0.9215686, 1,
-0.03400861, -0.4570307, -1.821756, 0, 1, 0.9294118, 1,
-0.02964619, 0.7092669, 1.33115, 0, 1, 0.9333333, 1,
-0.0253179, -1.054614, -4.149734, 0, 1, 0.9411765, 1,
-0.02143781, 0.01956674, -1.591748, 0, 1, 0.945098, 1,
-0.02100191, -1.154373, -1.223521, 0, 1, 0.9529412, 1,
-0.01934782, -0.1677253, -5.002773, 0, 1, 0.9568627, 1,
-0.01865075, -1.142604, -4.097919, 0, 1, 0.9647059, 1,
-0.01686959, -0.5674143, -2.880333, 0, 1, 0.9686275, 1,
-0.01608953, -0.7462547, -3.270191, 0, 1, 0.9764706, 1,
-0.01456473, 1.007192, 0.412962, 0, 1, 0.9803922, 1,
-0.01406936, 1.777467, 2.172774, 0, 1, 0.9882353, 1,
-0.01152774, -0.8050765, -2.333527, 0, 1, 0.9921569, 1,
-0.006515404, 0.8114941, -0.5083926, 0, 1, 1, 1,
-0.004169966, 1.326572, 1.97926, 0, 0.9921569, 1, 1,
-0.002946988, -0.02808278, -2.610585, 0, 0.9882353, 1, 1,
0.001453214, 1.019351, 0.6387405, 0, 0.9803922, 1, 1,
0.003750504, 0.6389934, 1.155564, 0, 0.9764706, 1, 1,
0.003895582, -0.2078517, 1.569638, 0, 0.9686275, 1, 1,
0.006555729, -0.1398093, 1.836735, 0, 0.9647059, 1, 1,
0.01038491, -1.685685, 2.715226, 0, 0.9568627, 1, 1,
0.01375653, 0.8927668, 0.5103437, 0, 0.9529412, 1, 1,
0.01654313, 0.6495292, -0.3310858, 0, 0.945098, 1, 1,
0.01904834, -0.3325019, 3.511144, 0, 0.9411765, 1, 1,
0.02112724, -1.335319, 4.811346, 0, 0.9333333, 1, 1,
0.02181991, -0.8148356, 5.102538, 0, 0.9294118, 1, 1,
0.02394458, -0.06841758, 3.460252, 0, 0.9215686, 1, 1,
0.02518514, -0.279921, 2.611185, 0, 0.9176471, 1, 1,
0.02639245, 1.095912, -0.7623158, 0, 0.9098039, 1, 1,
0.03865619, 0.7315257, 1.157276, 0, 0.9058824, 1, 1,
0.03909535, 0.8119367, 0.06727686, 0, 0.8980392, 1, 1,
0.0391976, -1.583848, 2.792357, 0, 0.8901961, 1, 1,
0.04240727, -0.6123194, 4.386123, 0, 0.8862745, 1, 1,
0.04542619, 0.9063674, -0.263326, 0, 0.8784314, 1, 1,
0.04588471, -1.368683, 3.301362, 0, 0.8745098, 1, 1,
0.04811998, -1.828912, 2.733399, 0, 0.8666667, 1, 1,
0.04872659, -0.09043487, 2.89676, 0, 0.8627451, 1, 1,
0.0503561, 0.4819055, -0.3776141, 0, 0.854902, 1, 1,
0.05080709, -0.2040746, 3.680055, 0, 0.8509804, 1, 1,
0.0543806, 2.626268, 1.051511, 0, 0.8431373, 1, 1,
0.05479588, -1.190025, 3.85702, 0, 0.8392157, 1, 1,
0.05831585, 0.902288, -0.7149061, 0, 0.8313726, 1, 1,
0.06571785, -1.56154, 3.365297, 0, 0.827451, 1, 1,
0.06664167, 0.5879109, 1.14332, 0, 0.8196079, 1, 1,
0.06708269, -0.03812543, 0.5733871, 0, 0.8156863, 1, 1,
0.06792399, 0.6545538, -0.6455705, 0, 0.8078431, 1, 1,
0.0700516, 0.03020248, 2.904475, 0, 0.8039216, 1, 1,
0.07358137, 1.011649, 2.128146, 0, 0.7960784, 1, 1,
0.07361656, 0.2170544, 0.5504973, 0, 0.7882353, 1, 1,
0.07661729, 1.584067, 0.6980634, 0, 0.7843137, 1, 1,
0.08494722, -0.6131361, 2.813901, 0, 0.7764706, 1, 1,
0.08729965, -0.4731686, 3.776193, 0, 0.772549, 1, 1,
0.09113463, -0.4750364, 3.597941, 0, 0.7647059, 1, 1,
0.09177738, -1.229192, 4.166391, 0, 0.7607843, 1, 1,
0.09474179, -0.6236562, 2.053127, 0, 0.7529412, 1, 1,
0.09740673, -0.9374622, 3.07549, 0, 0.7490196, 1, 1,
0.09861085, -1.051027, 2.938437, 0, 0.7411765, 1, 1,
0.09885104, 0.7437356, -0.5769243, 0, 0.7372549, 1, 1,
0.09975433, -1.117542, 1.998268, 0, 0.7294118, 1, 1,
0.1011124, -0.8043076, 3.627801, 0, 0.7254902, 1, 1,
0.111265, 2.083286, 0.03034278, 0, 0.7176471, 1, 1,
0.1158997, 0.09197687, 0.9263223, 0, 0.7137255, 1, 1,
0.1182933, -0.4936717, 2.59215, 0, 0.7058824, 1, 1,
0.123319, 1.025472, -0.7863771, 0, 0.6980392, 1, 1,
0.1243472, 2.31349, -1.077661, 0, 0.6941177, 1, 1,
0.1387304, 0.7138919, 0.7567004, 0, 0.6862745, 1, 1,
0.1490971, 2.176992, 1.147408, 0, 0.682353, 1, 1,
0.1512188, -0.9795611, 1.677005, 0, 0.6745098, 1, 1,
0.1513892, 1.101285, 0.2205977, 0, 0.6705883, 1, 1,
0.1541173, -0.3445221, 1.86124, 0, 0.6627451, 1, 1,
0.1569798, -1.288381, 2.758919, 0, 0.6588235, 1, 1,
0.1629511, 1.350012, -0.01199125, 0, 0.6509804, 1, 1,
0.1665969, -0.9082793, 3.787334, 0, 0.6470588, 1, 1,
0.1682539, -1.997546, 2.890189, 0, 0.6392157, 1, 1,
0.1712742, -0.4765141, 0.9651047, 0, 0.6352941, 1, 1,
0.1722391, -1.41248, 2.676768, 0, 0.627451, 1, 1,
0.1729293, -0.6783998, 2.281218, 0, 0.6235294, 1, 1,
0.1754089, 0.7002938, 2.768699, 0, 0.6156863, 1, 1,
0.1757114, 0.3599329, 0.7604409, 0, 0.6117647, 1, 1,
0.1783095, -0.7678843, 1.920574, 0, 0.6039216, 1, 1,
0.1872034, -0.9140699, 2.645738, 0, 0.5960785, 1, 1,
0.1905219, -0.007694213, 3.081112, 0, 0.5921569, 1, 1,
0.1910488, 0.2921746, 0.7141762, 0, 0.5843138, 1, 1,
0.1930654, -0.1833186, 3.293488, 0, 0.5803922, 1, 1,
0.1961118, 0.201052, 1.998395, 0, 0.572549, 1, 1,
0.1975748, 2.095618, 0.263102, 0, 0.5686275, 1, 1,
0.1978727, 1.51796, 0.06263196, 0, 0.5607843, 1, 1,
0.1986952, -1.40985, 3.562237, 0, 0.5568628, 1, 1,
0.1988477, 1.632788, -0.5711842, 0, 0.5490196, 1, 1,
0.2006301, -1.012161, 3.204003, 0, 0.5450981, 1, 1,
0.201489, 0.09483212, 2.192533, 0, 0.5372549, 1, 1,
0.204611, 0.5477335, -0.05683617, 0, 0.5333334, 1, 1,
0.2082071, 1.845589, -0.3693349, 0, 0.5254902, 1, 1,
0.2144525, 0.1223761, 0.1158624, 0, 0.5215687, 1, 1,
0.2212444, -0.1324074, 3.826407, 0, 0.5137255, 1, 1,
0.2220061, -1.386424, 4.210444, 0, 0.509804, 1, 1,
0.2310958, 1.35756, 0.3599195, 0, 0.5019608, 1, 1,
0.231524, -0.5222436, 2.196054, 0, 0.4941176, 1, 1,
0.2327026, 0.4871494, 0.4055255, 0, 0.4901961, 1, 1,
0.2331166, 0.6298537, 0.757605, 0, 0.4823529, 1, 1,
0.2374309, 0.9130217, 0.2661391, 0, 0.4784314, 1, 1,
0.2387276, -1.094039, 1.638022, 0, 0.4705882, 1, 1,
0.2394255, -2.213172, 1.861173, 0, 0.4666667, 1, 1,
0.2406237, 0.04499404, 0.7121243, 0, 0.4588235, 1, 1,
0.2421204, 0.5843113, 0.7048351, 0, 0.454902, 1, 1,
0.2436214, -0.8898467, 2.217699, 0, 0.4470588, 1, 1,
0.2463983, -0.6825155, 3.538775, 0, 0.4431373, 1, 1,
0.2542413, 0.4498766, -1.630968, 0, 0.4352941, 1, 1,
0.2547194, 1.768386, 0.1579524, 0, 0.4313726, 1, 1,
0.2623528, 0.1075465, 0.7658287, 0, 0.4235294, 1, 1,
0.262785, -1.345986, 4.200506, 0, 0.4196078, 1, 1,
0.2639543, -1.920879, 3.536079, 0, 0.4117647, 1, 1,
0.2644709, 0.8637512, -2.039604, 0, 0.4078431, 1, 1,
0.2668174, 0.1807004, 1.631685, 0, 0.4, 1, 1,
0.2697239, 0.447051, 1.53894, 0, 0.3921569, 1, 1,
0.272212, 0.4464783, 0.02787354, 0, 0.3882353, 1, 1,
0.2755236, 0.7807392, 0.2162443, 0, 0.3803922, 1, 1,
0.2773389, 1.475629, 0.8474166, 0, 0.3764706, 1, 1,
0.2775842, -1.50628, 1.508921, 0, 0.3686275, 1, 1,
0.2803504, -1.13696, 2.908429, 0, 0.3647059, 1, 1,
0.281526, 0.6046907, 1.702096, 0, 0.3568628, 1, 1,
0.2840706, 0.5744864, -1.433815, 0, 0.3529412, 1, 1,
0.284917, 0.5737215, 1.339884, 0, 0.345098, 1, 1,
0.2887694, 0.7655627, 0.8740197, 0, 0.3411765, 1, 1,
0.2896994, 0.7257109, -0.5251318, 0, 0.3333333, 1, 1,
0.2916652, -0.7999436, 3.302052, 0, 0.3294118, 1, 1,
0.2923171, -0.159352, 3.529383, 0, 0.3215686, 1, 1,
0.2939717, 0.2146081, 1.614787, 0, 0.3176471, 1, 1,
0.2981217, 0.6229427, 0.8600226, 0, 0.3098039, 1, 1,
0.3002807, 1.84257, 0.8282034, 0, 0.3058824, 1, 1,
0.3015566, -1.237239, 1.869104, 0, 0.2980392, 1, 1,
0.3036151, 0.6678975, 0.326893, 0, 0.2901961, 1, 1,
0.3072492, 0.1804405, 3.305713, 0, 0.2862745, 1, 1,
0.3116475, -0.6255743, 2.087757, 0, 0.2784314, 1, 1,
0.312131, -0.1314121, 3.516459, 0, 0.2745098, 1, 1,
0.3177351, 0.4169168, -0.3571285, 0, 0.2666667, 1, 1,
0.3186793, 0.8680685, 0.9633591, 0, 0.2627451, 1, 1,
0.3226174, -2.127307, 2.421834, 0, 0.254902, 1, 1,
0.3239816, 0.2908608, -1.755293, 0, 0.2509804, 1, 1,
0.3248669, 0.8919882, 0.01024625, 0, 0.2431373, 1, 1,
0.3274423, -0.03663138, 2.21862, 0, 0.2392157, 1, 1,
0.3298674, -0.7475117, 1.934261, 0, 0.2313726, 1, 1,
0.3303247, 1.157677, -0.8254327, 0, 0.227451, 1, 1,
0.3328222, -1.075373, 3.059601, 0, 0.2196078, 1, 1,
0.3331135, -1.546381, 3.965638, 0, 0.2156863, 1, 1,
0.3357608, 2.291548, 0.8093407, 0, 0.2078431, 1, 1,
0.3390233, -0.7062684, 4.631954, 0, 0.2039216, 1, 1,
0.341847, -0.3523979, 4.084476, 0, 0.1960784, 1, 1,
0.3440641, 0.6757451, 1.591164, 0, 0.1882353, 1, 1,
0.3484523, -1.524447, 3.961766, 0, 0.1843137, 1, 1,
0.3551784, 0.3317673, 2.208947, 0, 0.1764706, 1, 1,
0.3584477, 0.07195863, 0.07491361, 0, 0.172549, 1, 1,
0.3614429, -1.35118, 3.664561, 0, 0.1647059, 1, 1,
0.3654764, 1.416208, -0.7980149, 0, 0.1607843, 1, 1,
0.3676866, 0.7857318, -0.6773561, 0, 0.1529412, 1, 1,
0.3708836, -0.2768173, 1.76951, 0, 0.1490196, 1, 1,
0.3745313, -0.183708, 2.660706, 0, 0.1411765, 1, 1,
0.3754812, 0.0447556, 1.716153, 0, 0.1372549, 1, 1,
0.376338, -0.2244203, 2.100618, 0, 0.1294118, 1, 1,
0.3790697, 0.4155587, -0.9972848, 0, 0.1254902, 1, 1,
0.3793882, 0.2159766, 1.86342, 0, 0.1176471, 1, 1,
0.3804708, -1.375451, 2.898474, 0, 0.1137255, 1, 1,
0.3818475, 0.5071188, 2.482133, 0, 0.1058824, 1, 1,
0.382782, 0.5904463, 0.7420695, 0, 0.09803922, 1, 1,
0.384321, -0.2688803, 0.3304874, 0, 0.09411765, 1, 1,
0.3852111, 1.032589, -0.2278889, 0, 0.08627451, 1, 1,
0.387006, 0.3955414, 2.021967, 0, 0.08235294, 1, 1,
0.3887729, -0.5872523, 2.147089, 0, 0.07450981, 1, 1,
0.3954606, -0.1457283, 1.939265, 0, 0.07058824, 1, 1,
0.4032669, -0.8493404, 2.549656, 0, 0.0627451, 1, 1,
0.409153, 1.979379, -0.8012038, 0, 0.05882353, 1, 1,
0.4134769, -0.5412212, 3.071277, 0, 0.05098039, 1, 1,
0.4154651, 0.6299454, 0.7984735, 0, 0.04705882, 1, 1,
0.4161777, -1.479014, 3.021975, 0, 0.03921569, 1, 1,
0.416517, -0.5036948, 1.308714, 0, 0.03529412, 1, 1,
0.4228427, 1.436457, 1.836638, 0, 0.02745098, 1, 1,
0.4230811, 1.784828, 1.187052, 0, 0.02352941, 1, 1,
0.4236732, 0.5932374, -0.6951038, 0, 0.01568628, 1, 1,
0.4297845, -0.6051573, -0.7700248, 0, 0.01176471, 1, 1,
0.4318904, -0.5276758, 4.454002, 0, 0.003921569, 1, 1,
0.4357152, -0.7907124, 3.063552, 0.003921569, 0, 1, 1,
0.4390691, 0.8366222, 0.4021597, 0.007843138, 0, 1, 1,
0.439708, -3.001131, 2.318805, 0.01568628, 0, 1, 1,
0.4435799, -1.107766, 2.630353, 0.01960784, 0, 1, 1,
0.4444727, -0.3597185, 1.739732, 0.02745098, 0, 1, 1,
0.4452518, -0.6452734, 3.276802, 0.03137255, 0, 1, 1,
0.4533996, -0.9433286, 2.234853, 0.03921569, 0, 1, 1,
0.453752, 0.07810678, 0.9185235, 0.04313726, 0, 1, 1,
0.4580846, -0.4540994, 2.660277, 0.05098039, 0, 1, 1,
0.4600591, -0.6240978, 1.751795, 0.05490196, 0, 1, 1,
0.4670877, 0.2777302, 1.482732, 0.0627451, 0, 1, 1,
0.4695143, -0.06041558, 2.250002, 0.06666667, 0, 1, 1,
0.4701569, 0.8050869, 0.5181994, 0.07450981, 0, 1, 1,
0.4713411, -0.8992509, 3.795622, 0.07843138, 0, 1, 1,
0.4729696, 0.08913236, 0.6185445, 0.08627451, 0, 1, 1,
0.4815733, -0.04615491, 3.101817, 0.09019608, 0, 1, 1,
0.4863409, 0.1813168, 2.524169, 0.09803922, 0, 1, 1,
0.4866073, 3.180885, -0.6117452, 0.1058824, 0, 1, 1,
0.4952344, 0.927081, 0.6529598, 0.1098039, 0, 1, 1,
0.4983815, -2.178946, 1.864837, 0.1176471, 0, 1, 1,
0.5008075, 0.1800856, 1.385991, 0.1215686, 0, 1, 1,
0.5039274, -1.162215, 1.460134, 0.1294118, 0, 1, 1,
0.505456, 0.08141799, 2.202678, 0.1333333, 0, 1, 1,
0.5057812, 0.9866281, 0.1000466, 0.1411765, 0, 1, 1,
0.5071907, 0.5096061, 0.4156353, 0.145098, 0, 1, 1,
0.510098, -0.4264734, 2.143824, 0.1529412, 0, 1, 1,
0.5112669, 0.7085261, -0.2496308, 0.1568628, 0, 1, 1,
0.5127091, 1.238135, 0.4576473, 0.1647059, 0, 1, 1,
0.5213499, 0.09859044, 1.515472, 0.1686275, 0, 1, 1,
0.5313129, -1.139834, 1.684959, 0.1764706, 0, 1, 1,
0.5322199, 0.4159621, 1.247051, 0.1803922, 0, 1, 1,
0.5373972, -1.056052, 3.809008, 0.1882353, 0, 1, 1,
0.5413456, -0.7298514, 2.467856, 0.1921569, 0, 1, 1,
0.5427323, 0.3741085, 0.1983835, 0.2, 0, 1, 1,
0.5430704, 1.057191, 1.347653, 0.2078431, 0, 1, 1,
0.5458364, -0.2885128, 1.76196, 0.2117647, 0, 1, 1,
0.5466169, -0.3685212, 3.312864, 0.2196078, 0, 1, 1,
0.5473713, 0.2886351, 0.170452, 0.2235294, 0, 1, 1,
0.5493246, 1.111467, -0.8974618, 0.2313726, 0, 1, 1,
0.5493386, 0.4312621, 1.755572, 0.2352941, 0, 1, 1,
0.5549514, -1.333675, 3.558382, 0.2431373, 0, 1, 1,
0.5557099, 0.4493302, -0.2513016, 0.2470588, 0, 1, 1,
0.5564833, 0.1066381, 1.528346, 0.254902, 0, 1, 1,
0.5600016, 0.01631315, 3.169991, 0.2588235, 0, 1, 1,
0.5605385, 1.140457, 3.011478, 0.2666667, 0, 1, 1,
0.5621108, 1.853232, 1.569666, 0.2705882, 0, 1, 1,
0.5636364, -0.9443928, 3.275578, 0.2784314, 0, 1, 1,
0.5636551, -0.3755016, 2.775891, 0.282353, 0, 1, 1,
0.5655413, -0.9929649, 3.390964, 0.2901961, 0, 1, 1,
0.5684252, -1.897945, 3.692998, 0.2941177, 0, 1, 1,
0.5714038, -0.3475708, 1.881896, 0.3019608, 0, 1, 1,
0.5731531, -0.1574792, 1.758859, 0.3098039, 0, 1, 1,
0.5734722, -0.6124449, 2.156512, 0.3137255, 0, 1, 1,
0.5799971, -0.7788164, 4.686495, 0.3215686, 0, 1, 1,
0.5809672, -0.6119573, 1.707958, 0.3254902, 0, 1, 1,
0.5899212, -0.1474667, 2.722294, 0.3333333, 0, 1, 1,
0.5937563, -0.6473867, 1.659327, 0.3372549, 0, 1, 1,
0.5988371, 0.4031284, 1.79399, 0.345098, 0, 1, 1,
0.5997306, -0.6923336, 1.830624, 0.3490196, 0, 1, 1,
0.6013097, 0.9303488, 1.923526, 0.3568628, 0, 1, 1,
0.6037919, -0.8697821, 2.11951, 0.3607843, 0, 1, 1,
0.6065587, 0.390283, -0.1677277, 0.3686275, 0, 1, 1,
0.6069658, -0.3158359, 2.924699, 0.372549, 0, 1, 1,
0.6121971, 0.08862547, 2.195658, 0.3803922, 0, 1, 1,
0.6224512, 1.114867, 0.4005337, 0.3843137, 0, 1, 1,
0.63108, 0.5938643, 0.7672552, 0.3921569, 0, 1, 1,
0.6320127, -0.4733844, 1.976483, 0.3960784, 0, 1, 1,
0.6357993, 0.5942828, -0.2346731, 0.4039216, 0, 1, 1,
0.6389752, -0.2515538, 1.985624, 0.4117647, 0, 1, 1,
0.6451046, -0.2788059, 2.373288, 0.4156863, 0, 1, 1,
0.659865, 0.7043839, 0.4940087, 0.4235294, 0, 1, 1,
0.6613251, 0.1918538, 0.7916298, 0.427451, 0, 1, 1,
0.6626604, 1.6324, 0.5550439, 0.4352941, 0, 1, 1,
0.6650629, 0.567422, 2.088532, 0.4392157, 0, 1, 1,
0.6655009, -0.2230994, 2.896143, 0.4470588, 0, 1, 1,
0.6684324, -1.382014, 0.7373418, 0.4509804, 0, 1, 1,
0.6735551, 0.3055699, 1.538701, 0.4588235, 0, 1, 1,
0.6754413, 0.6701706, 0.6313781, 0.4627451, 0, 1, 1,
0.676478, -0.7067866, 2.877988, 0.4705882, 0, 1, 1,
0.6811845, -0.6607411, 1.934569, 0.4745098, 0, 1, 1,
0.684149, 0.3449376, 0.7142273, 0.4823529, 0, 1, 1,
0.692279, 0.4759505, -1.432054, 0.4862745, 0, 1, 1,
0.6991131, -1.978897, 0.4295559, 0.4941176, 0, 1, 1,
0.7020612, 0.04406303, 2.518667, 0.5019608, 0, 1, 1,
0.7026063, -0.09452597, 0.5316127, 0.5058824, 0, 1, 1,
0.7026082, 0.7965994, -0.9003183, 0.5137255, 0, 1, 1,
0.7028987, -0.5400063, 4.205573, 0.5176471, 0, 1, 1,
0.7067413, -1.928128, 3.334183, 0.5254902, 0, 1, 1,
0.7075161, 0.7583318, -0.1000318, 0.5294118, 0, 1, 1,
0.7097078, -0.5790341, 2.047636, 0.5372549, 0, 1, 1,
0.7119195, 1.043397, 0.4206272, 0.5411765, 0, 1, 1,
0.7125034, 0.3842069, 0.8396261, 0.5490196, 0, 1, 1,
0.7144544, 1.79681, 1.337421, 0.5529412, 0, 1, 1,
0.7192085, 0.9654475, 1.842826, 0.5607843, 0, 1, 1,
0.7377282, -0.8309813, 3.691513, 0.5647059, 0, 1, 1,
0.7385504, 1.157871, 1.346491, 0.572549, 0, 1, 1,
0.7397465, 1.395296, 1.322165, 0.5764706, 0, 1, 1,
0.7431237, 0.419985, 0.3846817, 0.5843138, 0, 1, 1,
0.7431962, -0.2680879, 0.9295366, 0.5882353, 0, 1, 1,
0.7432324, 0.1854769, 2.390287, 0.5960785, 0, 1, 1,
0.7432562, 1.422336, 0.7119119, 0.6039216, 0, 1, 1,
0.7450737, 0.0987466, 1.923907, 0.6078432, 0, 1, 1,
0.746008, 0.4107303, 0.7450744, 0.6156863, 0, 1, 1,
0.7501839, 0.1677551, -0.3008725, 0.6196079, 0, 1, 1,
0.7502737, 1.651102, 0.9717915, 0.627451, 0, 1, 1,
0.7558709, 0.7645929, 1.56803, 0.6313726, 0, 1, 1,
0.7592006, 0.556478, -0.2827776, 0.6392157, 0, 1, 1,
0.7660403, 1.057412, -0.5032957, 0.6431373, 0, 1, 1,
0.7665354, -0.07329144, 0.000213306, 0.6509804, 0, 1, 1,
0.7665775, -1.561105, 0.4123651, 0.654902, 0, 1, 1,
0.7698171, 0.2615456, 2.173202, 0.6627451, 0, 1, 1,
0.7746593, -0.5525422, 1.087334, 0.6666667, 0, 1, 1,
0.7819389, 0.2905955, 1.807367, 0.6745098, 0, 1, 1,
0.7830371, -0.4098521, 1.405224, 0.6784314, 0, 1, 1,
0.784945, -0.04104796, 0.5398754, 0.6862745, 0, 1, 1,
0.785954, -1.576601, 0.9648669, 0.6901961, 0, 1, 1,
0.7869331, 0.5761284, -1.231346, 0.6980392, 0, 1, 1,
0.7898887, -0.01355228, 1.957247, 0.7058824, 0, 1, 1,
0.7913851, 1.913618, 1.264245, 0.7098039, 0, 1, 1,
0.7926971, 0.8052372, 0.194991, 0.7176471, 0, 1, 1,
0.7934, 1.227621, -0.5267594, 0.7215686, 0, 1, 1,
0.7969179, 0.4110627, 0.7928734, 0.7294118, 0, 1, 1,
0.7991066, 0.8145493, 1.455107, 0.7333333, 0, 1, 1,
0.8059321, -0.2191108, 2.919909, 0.7411765, 0, 1, 1,
0.8060192, -0.1780201, 0.6534328, 0.7450981, 0, 1, 1,
0.8063846, 0.7797063, -0.2515056, 0.7529412, 0, 1, 1,
0.808908, 1.549606, -0.9578357, 0.7568628, 0, 1, 1,
0.8117571, -0.2875777, 1.90721, 0.7647059, 0, 1, 1,
0.8119673, -0.1473651, 1.074066, 0.7686275, 0, 1, 1,
0.8145145, 0.1889291, 0.9797609, 0.7764706, 0, 1, 1,
0.8153187, -1.918234, 3.134014, 0.7803922, 0, 1, 1,
0.8161134, 0.2941302, 1.167141, 0.7882353, 0, 1, 1,
0.8190291, 0.1463725, 2.347152, 0.7921569, 0, 1, 1,
0.8222295, 0.3356356, -0.53668, 0.8, 0, 1, 1,
0.822765, -1.823217, 2.266485, 0.8078431, 0, 1, 1,
0.826351, 0.2262114, -0.9505642, 0.8117647, 0, 1, 1,
0.8283181, 0.2114687, 1.088295, 0.8196079, 0, 1, 1,
0.8385723, -0.3771698, 1.552101, 0.8235294, 0, 1, 1,
0.8393453, 0.4001695, 1.576618, 0.8313726, 0, 1, 1,
0.8433575, -1.949721, 2.711242, 0.8352941, 0, 1, 1,
0.8440755, 1.140379, 1.634372, 0.8431373, 0, 1, 1,
0.8504813, -0.3920295, 3.565518, 0.8470588, 0, 1, 1,
0.8622319, 1.122603, 1.847898, 0.854902, 0, 1, 1,
0.8656003, -0.2032468, 2.705849, 0.8588235, 0, 1, 1,
0.86652, 0.4059579, 1.613788, 0.8666667, 0, 1, 1,
0.8674622, -1.149131, 2.258832, 0.8705882, 0, 1, 1,
0.8705532, 1.969031, 1.431792, 0.8784314, 0, 1, 1,
0.8721368, 0.1843597, 3.699174, 0.8823529, 0, 1, 1,
0.8735705, -1.150196, 2.580247, 0.8901961, 0, 1, 1,
0.8758585, 0.4837576, -0.7262319, 0.8941177, 0, 1, 1,
0.8763841, -0.5064985, 2.919563, 0.9019608, 0, 1, 1,
0.8780388, 2.00767, -0.05035546, 0.9098039, 0, 1, 1,
0.8808265, 0.2376368, 0.4086547, 0.9137255, 0, 1, 1,
0.8909441, 0.6239434, 0.2804667, 0.9215686, 0, 1, 1,
0.8936841, -0.7899306, 3.736142, 0.9254902, 0, 1, 1,
0.8955165, -0.7967524, 1.702716, 0.9333333, 0, 1, 1,
0.9000016, 0.7377751, 1.208547, 0.9372549, 0, 1, 1,
0.9025438, 1.608209, -0.480745, 0.945098, 0, 1, 1,
0.9029066, 1.964966, -1.538237, 0.9490196, 0, 1, 1,
0.9039212, 2.806975, 2.89942, 0.9568627, 0, 1, 1,
0.9079156, -0.4248325, 1.664792, 0.9607843, 0, 1, 1,
0.9144028, 0.1755688, 0.8114498, 0.9686275, 0, 1, 1,
0.9152175, 1.050832, 0.408075, 0.972549, 0, 1, 1,
0.9180587, -0.5522445, 2.430364, 0.9803922, 0, 1, 1,
0.9233287, -0.4429614, 3.115891, 0.9843137, 0, 1, 1,
0.9243819, 1.554247, 0.2904628, 0.9921569, 0, 1, 1,
0.931312, -0.4641094, 0.8188003, 0.9960784, 0, 1, 1,
0.9344085, -1.635219, 2.176708, 1, 0, 0.9960784, 1,
0.9347585, -2.052398, 3.661496, 1, 0, 0.9882353, 1,
0.936451, -0.5671522, 2.959855, 1, 0, 0.9843137, 1,
0.9417415, 0.1818584, 2.314915, 1, 0, 0.9764706, 1,
0.9487367, 1.144591, 0.382626, 1, 0, 0.972549, 1,
0.9490179, 0.4690896, -0.3525517, 1, 0, 0.9647059, 1,
0.9546205, -0.3596791, 1.423138, 1, 0, 0.9607843, 1,
0.9574181, 0.4440348, 0.1827666, 1, 0, 0.9529412, 1,
0.9593961, 0.8180594, 0.5346282, 1, 0, 0.9490196, 1,
0.9610398, -0.6567989, 3.185428, 1, 0, 0.9411765, 1,
0.9615554, -0.3633351, 0.8856197, 1, 0, 0.9372549, 1,
0.9625418, 0.4535036, 2.295536, 1, 0, 0.9294118, 1,
0.9633227, -0.740529, 3.611192, 1, 0, 0.9254902, 1,
0.9744282, -0.900089, 2.856337, 1, 0, 0.9176471, 1,
0.9769654, -1.340813, 3.742386, 1, 0, 0.9137255, 1,
0.9815712, 0.7825894, 1.881655, 1, 0, 0.9058824, 1,
1.005282, -0.3460439, 0.8135172, 1, 0, 0.9019608, 1,
1.008555, 0.1872299, -0.1173796, 1, 0, 0.8941177, 1,
1.009485, -1.375864, 3.97563, 1, 0, 0.8862745, 1,
1.012979, -0.7411606, 2.878361, 1, 0, 0.8823529, 1,
1.01885, -0.681909, 1.958858, 1, 0, 0.8745098, 1,
1.020875, -1.168588, 3.631338, 1, 0, 0.8705882, 1,
1.032073, -2.338372, 2.238446, 1, 0, 0.8627451, 1,
1.036226, -0.162236, 2.938139, 1, 0, 0.8588235, 1,
1.046754, -0.3460433, 1.346347, 1, 0, 0.8509804, 1,
1.050083, 1.036261, 2.276294, 1, 0, 0.8470588, 1,
1.050157, -0.7653959, 0.9102768, 1, 0, 0.8392157, 1,
1.052407, -0.1711917, 1.784301, 1, 0, 0.8352941, 1,
1.052903, -0.3050465, 2.634588, 1, 0, 0.827451, 1,
1.053355, -0.5864949, 1.891042, 1, 0, 0.8235294, 1,
1.065765, 0.1193062, 2.07593, 1, 0, 0.8156863, 1,
1.080637, 1.668418, -0.001581617, 1, 0, 0.8117647, 1,
1.080783, 0.538829, -0.04508476, 1, 0, 0.8039216, 1,
1.082979, 0.04080021, 2.304322, 1, 0, 0.7960784, 1,
1.083661, -0.7451081, 2.245241, 1, 0, 0.7921569, 1,
1.095161, -0.3372148, 3.181038, 1, 0, 0.7843137, 1,
1.101297, -0.1059962, 2.082115, 1, 0, 0.7803922, 1,
1.136163, -0.6080492, 2.128443, 1, 0, 0.772549, 1,
1.138005, -0.7942415, 2.882809, 1, 0, 0.7686275, 1,
1.142741, 1.721003, 0.8530484, 1, 0, 0.7607843, 1,
1.161052, -0.9024543, 2.826979, 1, 0, 0.7568628, 1,
1.168352, -0.5624501, 3.414482, 1, 0, 0.7490196, 1,
1.172559, -0.3131261, 0.7995291, 1, 0, 0.7450981, 1,
1.174556, 0.9183854, 2.533664, 1, 0, 0.7372549, 1,
1.179722, -0.7871473, 3.218584, 1, 0, 0.7333333, 1,
1.185838, 1.959995, 1.70447, 1, 0, 0.7254902, 1,
1.186735, 0.2460205, 0.894676, 1, 0, 0.7215686, 1,
1.192631, 0.5337901, 1.241513, 1, 0, 0.7137255, 1,
1.192635, -1.489865, 1.832719, 1, 0, 0.7098039, 1,
1.194713, -0.9350907, 2.349986, 1, 0, 0.7019608, 1,
1.202713, 0.9456633, 1.029793, 1, 0, 0.6941177, 1,
1.21709, -0.4258943, 2.484195, 1, 0, 0.6901961, 1,
1.226021, 0.3712348, 1.0234, 1, 0, 0.682353, 1,
1.230036, -1.298823, 2.892088, 1, 0, 0.6784314, 1,
1.235987, -1.909197, 2.788224, 1, 0, 0.6705883, 1,
1.248863, 2.837707, 1.483576, 1, 0, 0.6666667, 1,
1.253304, -0.176127, 0.3161893, 1, 0, 0.6588235, 1,
1.264, 1.230394, 1.77981, 1, 0, 0.654902, 1,
1.265917, 1.612956, 1.302781, 1, 0, 0.6470588, 1,
1.281178, -0.2960213, 2.012065, 1, 0, 0.6431373, 1,
1.288058, -0.898402, 1.938903, 1, 0, 0.6352941, 1,
1.289373, -0.04124346, -0.2772573, 1, 0, 0.6313726, 1,
1.31014, -0.07866146, 2.538574, 1, 0, 0.6235294, 1,
1.32492, -0.5761414, 2.463388, 1, 0, 0.6196079, 1,
1.326, 1.173899, 1.058165, 1, 0, 0.6117647, 1,
1.328418, 1.5606, 1.639017, 1, 0, 0.6078432, 1,
1.331171, 1.221538, 1.049161, 1, 0, 0.6, 1,
1.333434, -1.419884, 2.709158, 1, 0, 0.5921569, 1,
1.333435, 0.0796807, 2.082548, 1, 0, 0.5882353, 1,
1.338618, -1.94001, 2.391353, 1, 0, 0.5803922, 1,
1.340039, 0.008951069, 0.3854994, 1, 0, 0.5764706, 1,
1.340571, 0.579317, 1.021914, 1, 0, 0.5686275, 1,
1.342172, -0.2188925, 0.8501499, 1, 0, 0.5647059, 1,
1.342782, 0.02107408, 2.17924, 1, 0, 0.5568628, 1,
1.34478, 0.01452978, 1.876703, 1, 0, 0.5529412, 1,
1.346699, 0.7127387, 1.515402, 1, 0, 0.5450981, 1,
1.35146, 1.42327, 1.245325, 1, 0, 0.5411765, 1,
1.370956, 1.331521, 0.4918485, 1, 0, 0.5333334, 1,
1.371909, 2.10028, 1.163939, 1, 0, 0.5294118, 1,
1.383898, -1.028697, 0.6562528, 1, 0, 0.5215687, 1,
1.384038, -0.5356774, 2.570871, 1, 0, 0.5176471, 1,
1.389178, 2.113827, 0.443695, 1, 0, 0.509804, 1,
1.393733, -0.2280442, 2.867533, 1, 0, 0.5058824, 1,
1.394479, -0.9038109, 2.517782, 1, 0, 0.4980392, 1,
1.395698, 0.3531808, -0.07101399, 1, 0, 0.4901961, 1,
1.41029, -1.024459, 1.909663, 1, 0, 0.4862745, 1,
1.421052, 0.6198844, -0.6552577, 1, 0, 0.4784314, 1,
1.431955, 0.4687242, -0.4849523, 1, 0, 0.4745098, 1,
1.432048, -1.188385, 3.363571, 1, 0, 0.4666667, 1,
1.436087, -1.546894, 3.872128, 1, 0, 0.4627451, 1,
1.437597, -0.4876028, 2.94952, 1, 0, 0.454902, 1,
1.437721, -0.6299586, 2.2609, 1, 0, 0.4509804, 1,
1.441232, 0.3356769, 0.1408525, 1, 0, 0.4431373, 1,
1.442965, -0.1130068, -0.1985711, 1, 0, 0.4392157, 1,
1.445776, 1.951378, 1.573995, 1, 0, 0.4313726, 1,
1.458815, 0.8022358, 1.84334, 1, 0, 0.427451, 1,
1.46677, 0.9576893, -0.9137682, 1, 0, 0.4196078, 1,
1.477525, -0.02513117, -0.01141664, 1, 0, 0.4156863, 1,
1.47984, -1.224097, 2.609213, 1, 0, 0.4078431, 1,
1.480656, 0.460528, 0.2392441, 1, 0, 0.4039216, 1,
1.48134, -0.7831349, 1.809748, 1, 0, 0.3960784, 1,
1.486158, -2.069031, 2.681613, 1, 0, 0.3882353, 1,
1.498147, -1.874259, 2.40246, 1, 0, 0.3843137, 1,
1.499598, -0.5563892, 3.17362, 1, 0, 0.3764706, 1,
1.526912, 0.5853375, 0.7553883, 1, 0, 0.372549, 1,
1.5394, 2.216811, -0.3914855, 1, 0, 0.3647059, 1,
1.539455, -0.6146068, 1.192841, 1, 0, 0.3607843, 1,
1.544447, -0.2991462, 1.545919, 1, 0, 0.3529412, 1,
1.547523, 0.7166885, 0.01292951, 1, 0, 0.3490196, 1,
1.561828, -0.05934357, 1.343259, 1, 0, 0.3411765, 1,
1.56215, 1.399796, 2.267647, 1, 0, 0.3372549, 1,
1.589989, 0.7225172, 1.593096, 1, 0, 0.3294118, 1,
1.590535, 0.2192489, 2.063333, 1, 0, 0.3254902, 1,
1.591119, -1.005046, 2.957038, 1, 0, 0.3176471, 1,
1.598181, -0.8438635, 1.10701, 1, 0, 0.3137255, 1,
1.601126, 0.8897029, -0.1790344, 1, 0, 0.3058824, 1,
1.616188, -1.004727, 3.185121, 1, 0, 0.2980392, 1,
1.627211, -1.354061, 1.939131, 1, 0, 0.2941177, 1,
1.635047, 1.421505, 1.997835, 1, 0, 0.2862745, 1,
1.639157, -0.3239857, 3.313788, 1, 0, 0.282353, 1,
1.648429, -0.4285239, 1.970865, 1, 0, 0.2745098, 1,
1.659524, 0.8159276, 0.6649323, 1, 0, 0.2705882, 1,
1.665187, 0.3630032, 2.864001, 1, 0, 0.2627451, 1,
1.682738, -0.5123256, 2.593413, 1, 0, 0.2588235, 1,
1.688437, 0.4386449, 2.857039, 1, 0, 0.2509804, 1,
1.698676, -0.3236516, 1.627573, 1, 0, 0.2470588, 1,
1.699868, -0.5691178, 0.5298395, 1, 0, 0.2392157, 1,
1.703421, -0.5451612, 2.518226, 1, 0, 0.2352941, 1,
1.742854, -0.5605338, 0.466934, 1, 0, 0.227451, 1,
1.752414, 1.278486, 0.8839365, 1, 0, 0.2235294, 1,
1.765394, -0.7986198, 1.740768, 1, 0, 0.2156863, 1,
1.787657, -0.154658, 2.492636, 1, 0, 0.2117647, 1,
1.791247, 1.647383, -0.01715693, 1, 0, 0.2039216, 1,
1.838865, 0.6034449, 1.343504, 1, 0, 0.1960784, 1,
1.841458, -1.244432, 2.16354, 1, 0, 0.1921569, 1,
1.849116, -0.7769337, 1.483164, 1, 0, 0.1843137, 1,
1.857061, -0.4330407, -0.01681474, 1, 0, 0.1803922, 1,
1.891592, 0.6676667, 0.8144996, 1, 0, 0.172549, 1,
1.899863, -2.052089, 2.026307, 1, 0, 0.1686275, 1,
1.935177, 0.6510136, 1.487834, 1, 0, 0.1607843, 1,
1.964254, 0.7179717, 0.04775818, 1, 0, 0.1568628, 1,
1.999231, 1.164436, 1.158164, 1, 0, 0.1490196, 1,
2.00166, -2.107052, 0.4764169, 1, 0, 0.145098, 1,
2.003715, -0.8101141, 2.728096, 1, 0, 0.1372549, 1,
2.049155, 0.7318142, -1.975578, 1, 0, 0.1333333, 1,
2.053432, -1.163761, 1.314087, 1, 0, 0.1254902, 1,
2.063838, -0.1878587, 2.150452, 1, 0, 0.1215686, 1,
2.072948, -0.481226, 2.855264, 1, 0, 0.1137255, 1,
2.123026, 1.496425, 0.2785346, 1, 0, 0.1098039, 1,
2.140078, -1.493542, 2.479572, 1, 0, 0.1019608, 1,
2.196477, 1.090719, 0.4499837, 1, 0, 0.09411765, 1,
2.245066, 0.3136495, 1.553211, 1, 0, 0.09019608, 1,
2.26317, 0.5084396, 2.665353, 1, 0, 0.08235294, 1,
2.280814, -1.85008, 2.243402, 1, 0, 0.07843138, 1,
2.3538, 0.3690059, -0.1010038, 1, 0, 0.07058824, 1,
2.355199, 0.2233458, 2.054042, 1, 0, 0.06666667, 1,
2.372756, -0.5257058, 1.987159, 1, 0, 0.05882353, 1,
2.425754, 0.8831569, 1.386076, 1, 0, 0.05490196, 1,
2.469493, 0.8008662, 0.192867, 1, 0, 0.04705882, 1,
2.505122, 0.1782558, 2.325345, 1, 0, 0.04313726, 1,
2.524282, -2.966296, 3.290106, 1, 0, 0.03529412, 1,
2.901228, -0.2532208, 0.6057538, 1, 0, 0.03137255, 1,
2.923471, 0.6392431, -0.2179418, 1, 0, 0.02352941, 1,
3.046166, -0.8492751, 2.889185, 1, 0, 0.01960784, 1,
3.234757, 0.2042693, 2.695006, 1, 0, 0.01176471, 1,
3.55869, 0.6339929, 0.6115461, 1, 0, 0.007843138, 1
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
0.0528549, -4.121576, -6.715623, 0, -0.5, 0.5, 0.5,
0.0528549, -4.121576, -6.715623, 1, -0.5, 0.5, 0.5,
0.0528549, -4.121576, -6.715623, 1, 1.5, 0.5, 0.5,
0.0528549, -4.121576, -6.715623, 0, 1.5, 0.5, 0.5
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
-4.641458, 0.3040183, -6.715623, 0, -0.5, 0.5, 0.5,
-4.641458, 0.3040183, -6.715623, 1, -0.5, 0.5, 0.5,
-4.641458, 0.3040183, -6.715623, 1, 1.5, 0.5, 0.5,
-4.641458, 0.3040183, -6.715623, 0, 1.5, 0.5, 0.5
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
-4.641458, -4.121576, 0.04988265, 0, -0.5, 0.5, 0.5,
-4.641458, -4.121576, 0.04988265, 1, -0.5, 0.5, 0.5,
-4.641458, -4.121576, 0.04988265, 1, 1.5, 0.5, 0.5,
-4.641458, -4.121576, 0.04988265, 0, 1.5, 0.5, 0.5
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
-2, -3.100285, -5.154353,
2, -3.100285, -5.154353,
-2, -3.100285, -5.154353,
-2, -3.2705, -5.414564,
0, -3.100285, -5.154353,
0, -3.2705, -5.414564,
2, -3.100285, -5.154353,
2, -3.2705, -5.414564
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
"0",
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
-2, -3.610931, -5.934988, 0, -0.5, 0.5, 0.5,
-2, -3.610931, -5.934988, 1, -0.5, 0.5, 0.5,
-2, -3.610931, -5.934988, 1, 1.5, 0.5, 0.5,
-2, -3.610931, -5.934988, 0, 1.5, 0.5, 0.5,
0, -3.610931, -5.934988, 0, -0.5, 0.5, 0.5,
0, -3.610931, -5.934988, 1, -0.5, 0.5, 0.5,
0, -3.610931, -5.934988, 1, 1.5, 0.5, 0.5,
0, -3.610931, -5.934988, 0, 1.5, 0.5, 0.5,
2, -3.610931, -5.934988, 0, -0.5, 0.5, 0.5,
2, -3.610931, -5.934988, 1, -0.5, 0.5, 0.5,
2, -3.610931, -5.934988, 1, 1.5, 0.5, 0.5,
2, -3.610931, -5.934988, 0, 1.5, 0.5, 0.5
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
-3.558155, -3, -5.154353,
-3.558155, 3, -5.154353,
-3.558155, -3, -5.154353,
-3.738705, -3, -5.414564,
-3.558155, -2, -5.154353,
-3.738705, -2, -5.414564,
-3.558155, -1, -5.154353,
-3.738705, -1, -5.414564,
-3.558155, 0, -5.154353,
-3.738705, 0, -5.414564,
-3.558155, 1, -5.154353,
-3.738705, 1, -5.414564,
-3.558155, 2, -5.154353,
-3.738705, 2, -5.414564,
-3.558155, 3, -5.154353,
-3.738705, 3, -5.414564
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
-4.099806, -3, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, -3, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, -3, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, -3, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, -2, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, -2, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, -2, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, -2, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, -1, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, -1, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, -1, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, -1, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, 0, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, 0, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, 0, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, 0, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, 1, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, 1, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, 1, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, 1, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, 2, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, 2, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, 2, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, 2, -5.934988, 0, 1.5, 0.5, 0.5,
-4.099806, 3, -5.934988, 0, -0.5, 0.5, 0.5,
-4.099806, 3, -5.934988, 1, -0.5, 0.5, 0.5,
-4.099806, 3, -5.934988, 1, 1.5, 0.5, 0.5,
-4.099806, 3, -5.934988, 0, 1.5, 0.5, 0.5
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
-3.558155, -3.100285, -4,
-3.558155, -3.100285, 4,
-3.558155, -3.100285, -4,
-3.738705, -3.2705, -4,
-3.558155, -3.100285, -2,
-3.738705, -3.2705, -2,
-3.558155, -3.100285, 0,
-3.738705, -3.2705, 0,
-3.558155, -3.100285, 2,
-3.738705, -3.2705, 2,
-3.558155, -3.100285, 4,
-3.738705, -3.2705, 4
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
-4.099806, -3.610931, -4, 0, -0.5, 0.5, 0.5,
-4.099806, -3.610931, -4, 1, -0.5, 0.5, 0.5,
-4.099806, -3.610931, -4, 1, 1.5, 0.5, 0.5,
-4.099806, -3.610931, -4, 0, 1.5, 0.5, 0.5,
-4.099806, -3.610931, -2, 0, -0.5, 0.5, 0.5,
-4.099806, -3.610931, -2, 1, -0.5, 0.5, 0.5,
-4.099806, -3.610931, -2, 1, 1.5, 0.5, 0.5,
-4.099806, -3.610931, -2, 0, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 0, 0, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 0, 1, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 0, 1, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 0, 0, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 2, 0, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 2, 1, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 2, 1, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 2, 0, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 4, 0, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 4, 1, -0.5, 0.5, 0.5,
-4.099806, -3.610931, 4, 1, 1.5, 0.5, 0.5,
-4.099806, -3.610931, 4, 0, 1.5, 0.5, 0.5
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
-3.558155, -3.100285, -5.154353,
-3.558155, 3.708322, -5.154353,
-3.558155, -3.100285, 5.254118,
-3.558155, 3.708322, 5.254118,
-3.558155, -3.100285, -5.154353,
-3.558155, -3.100285, 5.254118,
-3.558155, 3.708322, -5.154353,
-3.558155, 3.708322, 5.254118,
-3.558155, -3.100285, -5.154353,
3.663865, -3.100285, -5.154353,
-3.558155, -3.100285, 5.254118,
3.663865, -3.100285, 5.254118,
-3.558155, 3.708322, -5.154353,
3.663865, 3.708322, -5.154353,
-3.558155, 3.708322, 5.254118,
3.663865, 3.708322, 5.254118,
3.663865, -3.100285, -5.154353,
3.663865, 3.708322, -5.154353,
3.663865, -3.100285, 5.254118,
3.663865, 3.708322, 5.254118,
3.663865, -3.100285, -5.154353,
3.663865, -3.100285, 5.254118,
3.663865, 3.708322, -5.154353,
3.663865, 3.708322, 5.254118
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
var radius = 7.679876;
var distance = 34.16864;
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
mvMatrix.translate( -0.0528549, -0.3040183, -0.04988265 );
mvMatrix.scale( 1.149766, 1.219579, 0.7977765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16864);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
nicotine_product<-read.table("nicotine_product.xyz")
```

```
## Error in read.table("nicotine_product.xyz"): no lines available in input
```

```r
x<-nicotine_product$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
y<-nicotine_product$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
z<-nicotine_product$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
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
-3.45298, 1.330777, -2.092132, 0, 0, 1, 1, 1,
-3.333325, 1.420521, -0.4985472, 1, 0, 0, 1, 1,
-2.673918, -0.9015695, -1.169417, 1, 0, 0, 1, 1,
-2.586095, 1.164395, -1.029247, 1, 0, 0, 1, 1,
-2.443682, -1.074928, -2.297282, 1, 0, 0, 1, 1,
-2.403652, -0.2675141, -2.776913, 1, 0, 0, 1, 1,
-2.227666, -0.05928834, -1.462328, 0, 0, 0, 1, 1,
-2.227475, -0.6998946, -2.47848, 0, 0, 0, 1, 1,
-2.185951, -0.08109152, -2.899458, 0, 0, 0, 1, 1,
-2.141159, -0.6699175, -4.067541, 0, 0, 0, 1, 1,
-2.126392, 0.3339354, -2.3491, 0, 0, 0, 1, 1,
-2.121095, 0.2440379, -1.564383, 0, 0, 0, 1, 1,
-2.091405, 1.015958, -1.820534, 0, 0, 0, 1, 1,
-2.078501, -0.2880664, -2.601266, 1, 1, 1, 1, 1,
-2.025347, 0.5843587, -3.687528, 1, 1, 1, 1, 1,
-2.011618, 2.191785, -1.668879, 1, 1, 1, 1, 1,
-1.995923, -0.6684029, -0.05406792, 1, 1, 1, 1, 1,
-1.979247, 0.481744, -0.8492081, 1, 1, 1, 1, 1,
-1.973693, -1.075998, -0.1328974, 1, 1, 1, 1, 1,
-1.965758, -0.10976, -2.118861, 1, 1, 1, 1, 1,
-1.911274, 0.3367904, -0.9420643, 1, 1, 1, 1, 1,
-1.900133, 1.306225, -0.6039121, 1, 1, 1, 1, 1,
-1.899832, -0.3748422, -0.1018125, 1, 1, 1, 1, 1,
-1.897596, 0.6448885, 0.9403126, 1, 1, 1, 1, 1,
-1.885888, -0.1430369, -1.363217, 1, 1, 1, 1, 1,
-1.884706, 1.118259, -1.151509, 1, 1, 1, 1, 1,
-1.863798, -0.2420948, -1.63408, 1, 1, 1, 1, 1,
-1.840469, -0.8866369, -2.453598, 1, 1, 1, 1, 1,
-1.831979, -1.589013, -2.345326, 0, 0, 1, 1, 1,
-1.825663, 0.5191358, -1.733446, 1, 0, 0, 1, 1,
-1.802684, -0.9300002, -1.198419, 1, 0, 0, 1, 1,
-1.796207, 1.075472, -2.52953, 1, 0, 0, 1, 1,
-1.783958, -1.804705, -2.989176, 1, 0, 0, 1, 1,
-1.779533, -1.977283, -2.00983, 1, 0, 0, 1, 1,
-1.779411, 1.432082, -1.257354, 0, 0, 0, 1, 1,
-1.778959, -0.687557, -2.978372, 0, 0, 0, 1, 1,
-1.777414, 1.077435, -1.593414, 0, 0, 0, 1, 1,
-1.749882, -0.6752585, -2.087768, 0, 0, 0, 1, 1,
-1.721987, -0.3736354, -1.170597, 0, 0, 0, 1, 1,
-1.718969, 0.5518751, -0.1218176, 0, 0, 0, 1, 1,
-1.71818, -2.646088, -1.834231, 0, 0, 0, 1, 1,
-1.706273, -0.0611341, -1.805048, 1, 1, 1, 1, 1,
-1.684212, -0.4023048, -2.986412, 1, 1, 1, 1, 1,
-1.677392, -0.8542282, -2.758092, 1, 1, 1, 1, 1,
-1.636791, 0.8168218, -0.1862001, 1, 1, 1, 1, 1,
-1.619208, 0.2704262, -0.7533574, 1, 1, 1, 1, 1,
-1.608422, 0.4703899, -2.060555, 1, 1, 1, 1, 1,
-1.603915, -0.0793226, -3.806254, 1, 1, 1, 1, 1,
-1.590766, 0.4075271, -0.00684455, 1, 1, 1, 1, 1,
-1.584781, -0.4066154, -1.798973, 1, 1, 1, 1, 1,
-1.575275, -0.947883, -2.157344, 1, 1, 1, 1, 1,
-1.573547, 0.5947748, -2.643389, 1, 1, 1, 1, 1,
-1.571844, -0.2960731, -1.506643, 1, 1, 1, 1, 1,
-1.56499, -0.4583829, -1.594956, 1, 1, 1, 1, 1,
-1.564075, -2.18108, -2.552598, 1, 1, 1, 1, 1,
-1.550759, -0.6795965, -3.445189, 1, 1, 1, 1, 1,
-1.547159, -0.157706, -3.213658, 0, 0, 1, 1, 1,
-1.515607, 0.1223284, -0.5007438, 1, 0, 0, 1, 1,
-1.514873, 0.4880852, -1.089781, 1, 0, 0, 1, 1,
-1.497181, 1.542099, -2.03426, 1, 0, 0, 1, 1,
-1.485735, 1.770239, -0.2293576, 1, 0, 0, 1, 1,
-1.477085, -1.588986, -2.704389, 1, 0, 0, 1, 1,
-1.461297, 1.410355, -1.677122, 0, 0, 0, 1, 1,
-1.453492, -0.6401029, -2.007622, 0, 0, 0, 1, 1,
-1.437793, 0.4072603, -2.080537, 0, 0, 0, 1, 1,
-1.434042, -1.084186, -0.9668298, 0, 0, 0, 1, 1,
-1.416976, 2.01176, -0.4866391, 0, 0, 0, 1, 1,
-1.414992, -0.6016792, -1.719722, 0, 0, 0, 1, 1,
-1.412942, 1.747885, -1.161505, 0, 0, 0, 1, 1,
-1.406879, 0.1756204, -1.973509, 1, 1, 1, 1, 1,
-1.403863, -1.651404, -3.16384, 1, 1, 1, 1, 1,
-1.40076, -0.6481981, -1.852422, 1, 1, 1, 1, 1,
-1.397244, 0.8520198, -0.2079827, 1, 1, 1, 1, 1,
-1.382562, -0.4132307, -2.459555, 1, 1, 1, 1, 1,
-1.370346, 0.7471496, -1.703349, 1, 1, 1, 1, 1,
-1.364488, 1.149454, -1.744325, 1, 1, 1, 1, 1,
-1.360816, -0.1736257, -2.671432, 1, 1, 1, 1, 1,
-1.357416, 1.279703, 0.6026525, 1, 1, 1, 1, 1,
-1.355559, 0.8038343, -0.5178787, 1, 1, 1, 1, 1,
-1.336929, 0.2610601, -2.01497, 1, 1, 1, 1, 1,
-1.321758, -0.4599039, -1.990547, 1, 1, 1, 1, 1,
-1.321329, -0.9463599, -1.018069, 1, 1, 1, 1, 1,
-1.319842, -0.4802235, -4.47359, 1, 1, 1, 1, 1,
-1.317614, 0.2532133, -1.711522, 1, 1, 1, 1, 1,
-1.316743, 0.7117839, 0.3486012, 0, 0, 1, 1, 1,
-1.308458, -0.8840051, -3.524136, 1, 0, 0, 1, 1,
-1.303438, 0.9890366, -1.93474, 1, 0, 0, 1, 1,
-1.301697, -0.5196391, -1.692577, 1, 0, 0, 1, 1,
-1.29801, -1.63907, -2.7054, 1, 0, 0, 1, 1,
-1.296447, 0.4333262, -1.568398, 1, 0, 0, 1, 1,
-1.294901, 1.115351, -0.4769014, 0, 0, 0, 1, 1,
-1.288567, -0.01231858, -2.344959, 0, 0, 0, 1, 1,
-1.280048, -0.955093, -3.152857, 0, 0, 0, 1, 1,
-1.273057, -0.3510344, -2.056324, 0, 0, 0, 1, 1,
-1.260753, 0.4252241, 0.05238617, 0, 0, 0, 1, 1,
-1.260607, 0.40642, -0.7208857, 0, 0, 0, 1, 1,
-1.257534, 1.732631, -1.413623, 0, 0, 0, 1, 1,
-1.25726, 1.330937, -1.067049, 1, 1, 1, 1, 1,
-1.254816, -0.06898593, -2.937716, 1, 1, 1, 1, 1,
-1.252623, 0.863656, -0.6467013, 1, 1, 1, 1, 1,
-1.240117, -2.565624, -3.323262, 1, 1, 1, 1, 1,
-1.234554, 0.4362836, -0.753895, 1, 1, 1, 1, 1,
-1.233453, -0.5146242, -1.701233, 1, 1, 1, 1, 1,
-1.228081, -0.9535899, -0.9431096, 1, 1, 1, 1, 1,
-1.215693, -0.7608811, -2.453732, 1, 1, 1, 1, 1,
-1.210397, -0.6918114, -1.035882, 1, 1, 1, 1, 1,
-1.204474, 0.324509, -2.124007, 1, 1, 1, 1, 1,
-1.201535, 1.375534, -1.258167, 1, 1, 1, 1, 1,
-1.198818, 0.9268904, -1.446195, 1, 1, 1, 1, 1,
-1.191917, 1.021437, -0.7988865, 1, 1, 1, 1, 1,
-1.186538, 1.038026, -2.565409, 1, 1, 1, 1, 1,
-1.175062, -1.172519, -4.313819, 1, 1, 1, 1, 1,
-1.173669, 0.5908947, -2.775605, 0, 0, 1, 1, 1,
-1.170627, 0.7787236, -1.393159, 1, 0, 0, 1, 1,
-1.169227, 1.668071, -0.9352044, 1, 0, 0, 1, 1,
-1.167845, 0.4500978, -1.17492, 1, 0, 0, 1, 1,
-1.161403, 1.342084, 0.04852525, 1, 0, 0, 1, 1,
-1.161045, 0.1100001, -0.4409204, 1, 0, 0, 1, 1,
-1.153829, -0.05173685, -0.8517135, 0, 0, 0, 1, 1,
-1.135326, 0.764931, -0.8113034, 0, 0, 0, 1, 1,
-1.127541, -0.4592657, -2.457422, 0, 0, 0, 1, 1,
-1.125, 1.022834, 0.1771911, 0, 0, 0, 1, 1,
-1.119177, -0.934334, -2.553018, 0, 0, 0, 1, 1,
-1.114399, 3.070694, -1.814717, 0, 0, 0, 1, 1,
-1.114315, -0.1882108, -2.201582, 0, 0, 0, 1, 1,
-1.108957, 0.822398, -0.7524412, 1, 1, 1, 1, 1,
-1.106701, -0.3751847, -1.299249, 1, 1, 1, 1, 1,
-1.104897, 0.5980073, -0.5123267, 1, 1, 1, 1, 1,
-1.104397, 0.1708321, -0.5477569, 1, 1, 1, 1, 1,
-1.101665, -1.24762, -1.770068, 1, 1, 1, 1, 1,
-1.101562, 0.8037555, 0.1056346, 1, 1, 1, 1, 1,
-1.092719, 0.2692027, -0.868236, 1, 1, 1, 1, 1,
-1.077964, 1.523495, 0.3179908, 1, 1, 1, 1, 1,
-1.071986, -0.6582099, -1.931671, 1, 1, 1, 1, 1,
-1.070144, 0.0533832, -2.67072, 1, 1, 1, 1, 1,
-1.067292, -1.319283, -1.177341, 1, 1, 1, 1, 1,
-1.066622, -0.2616269, -2.136509, 1, 1, 1, 1, 1,
-1.065946, 0.2044182, -1.186798, 1, 1, 1, 1, 1,
-1.06572, -0.8761492, -2.437557, 1, 1, 1, 1, 1,
-1.061953, -0.1211405, -1.861333, 1, 1, 1, 1, 1,
-1.061454, 0.6599433, -0.4774085, 0, 0, 1, 1, 1,
-1.054904, -0.6269156, -0.5447126, 1, 0, 0, 1, 1,
-1.052973, -1.021697, -1.550113, 1, 0, 0, 1, 1,
-1.052723, -0.4465628, -3.083594, 1, 0, 0, 1, 1,
-1.048714, 0.7361674, -0.5552568, 1, 0, 0, 1, 1,
-1.046792, 0.3935881, -0.869372, 1, 0, 0, 1, 1,
-1.043626, -0.9422984, -2.951713, 0, 0, 0, 1, 1,
-1.03706, 1.006943, -0.1295864, 0, 0, 0, 1, 1,
-1.033845, 0.992608, 0.1418178, 0, 0, 0, 1, 1,
-1.031923, 0.3751785, -1.156634, 0, 0, 0, 1, 1,
-1.02603, 0.2947593, 0.7611317, 0, 0, 0, 1, 1,
-1.017043, -0.3359776, -2.430041, 0, 0, 0, 1, 1,
-1.016359, -1.309404, -3.033575, 0, 0, 0, 1, 1,
-1.006831, -0.467092, -2.947983, 1, 1, 1, 1, 1,
-1.00437, -0.02545893, -1.424927, 1, 1, 1, 1, 1,
-0.9991974, 1.09524, -0.5087043, 1, 1, 1, 1, 1,
-0.9978238, -0.077096, -1.326772, 1, 1, 1, 1, 1,
-0.9861704, -0.5320122, -1.553645, 1, 1, 1, 1, 1,
-0.985406, -0.4315755, -0.2301633, 1, 1, 1, 1, 1,
-0.9629201, 0.2576829, -0.1779007, 1, 1, 1, 1, 1,
-0.9627672, -0.1830887, -1.813406, 1, 1, 1, 1, 1,
-0.9618161, 0.3499134, -1.380401, 1, 1, 1, 1, 1,
-0.9594889, 0.961, -2.225588, 1, 1, 1, 1, 1,
-0.9587577, 1.140652, -0.4730558, 1, 1, 1, 1, 1,
-0.9548196, -0.7122398, -2.520813, 1, 1, 1, 1, 1,
-0.9539841, 1.789145, -2.532902, 1, 1, 1, 1, 1,
-0.9497115, 0.5245689, -0.7779652, 1, 1, 1, 1, 1,
-0.9462883, 0.8294277, -2.905884, 1, 1, 1, 1, 1,
-0.944843, -0.4075536, -1.740394, 0, 0, 1, 1, 1,
-0.9447817, -0.8311542, -3.109573, 1, 0, 0, 1, 1,
-0.943591, -1.195852, -2.279233, 1, 0, 0, 1, 1,
-0.9430304, 0.4159043, -0.3252613, 1, 0, 0, 1, 1,
-0.9411918, 0.2441406, -2.034624, 1, 0, 0, 1, 1,
-0.9392392, -0.05490625, -1.147103, 1, 0, 0, 1, 1,
-0.9365084, 1.156125, -1.013782, 0, 0, 0, 1, 1,
-0.9215981, -0.4524815, -2.558075, 0, 0, 0, 1, 1,
-0.9178514, -0.5327796, -0.6334369, 0, 0, 0, 1, 1,
-0.9133619, 0.9329987, -1.2475, 0, 0, 0, 1, 1,
-0.9021026, -1.214286, -1.481814, 0, 0, 0, 1, 1,
-0.9015864, 1.14949, -0.4773668, 0, 0, 0, 1, 1,
-0.899505, -0.8691207, -2.192148, 0, 0, 0, 1, 1,
-0.896184, -0.8779323, -0.7405393, 1, 1, 1, 1, 1,
-0.8914859, -1.39847, -4.513161, 1, 1, 1, 1, 1,
-0.8914167, -0.4553649, -3.398693, 1, 1, 1, 1, 1,
-0.8905149, -0.6554747, -1.965129, 1, 1, 1, 1, 1,
-0.8844689, -0.3796335, -2.91085, 1, 1, 1, 1, 1,
-0.8750501, -0.6093651, -2.200051, 1, 1, 1, 1, 1,
-0.8700847, 0.1100754, -0.4876393, 1, 1, 1, 1, 1,
-0.8641328, -1.256247, -2.053736, 1, 1, 1, 1, 1,
-0.8639977, -0.05165814, -2.653002, 1, 1, 1, 1, 1,
-0.8607855, 0.001342573, -3.700389, 1, 1, 1, 1, 1,
-0.8607481, -0.1133343, -1.418968, 1, 1, 1, 1, 1,
-0.8562042, 0.4268384, -0.5238726, 1, 1, 1, 1, 1,
-0.8525991, 0.69113, -2.661385, 1, 1, 1, 1, 1,
-0.851324, 0.1222449, -3.839731, 1, 1, 1, 1, 1,
-0.851189, -1.072765, -2.239722, 1, 1, 1, 1, 1,
-0.8506876, -0.8918486, -2.538368, 0, 0, 1, 1, 1,
-0.8433052, -1.429792, -0.1891678, 1, 0, 0, 1, 1,
-0.8360569, -0.98633, -2.524503, 1, 0, 0, 1, 1,
-0.8324695, -1.009894, -1.850601, 1, 0, 0, 1, 1,
-0.8302222, -2.330938, -3.759939, 1, 0, 0, 1, 1,
-0.8300186, -0.6683816, -1.493256, 1, 0, 0, 1, 1,
-0.8287308, -1.090479, -2.206999, 0, 0, 0, 1, 1,
-0.8272646, 0.7314777, -1.176852, 0, 0, 0, 1, 1,
-0.8259324, 2.139491, -1.436859, 0, 0, 0, 1, 1,
-0.8108065, -2.017492, -1.832459, 0, 0, 0, 1, 1,
-0.8064505, -0.185321, -2.728556, 0, 0, 0, 1, 1,
-0.7975012, -0.6673234, -3.002653, 0, 0, 0, 1, 1,
-0.7972785, -0.1179702, -2.528199, 0, 0, 0, 1, 1,
-0.7970124, -0.7036124, -2.426075, 1, 1, 1, 1, 1,
-0.7963871, 1.139414, 0.5615114, 1, 1, 1, 1, 1,
-0.7929439, -1.150091, -2.29948, 1, 1, 1, 1, 1,
-0.7902238, 1.525035, -1.465337, 1, 1, 1, 1, 1,
-0.7884437, -0.2745911, -2.578369, 1, 1, 1, 1, 1,
-0.7876651, -0.981775, -2.449952, 1, 1, 1, 1, 1,
-0.7854345, -0.2021242, -0.2459949, 1, 1, 1, 1, 1,
-0.7815287, 0.5244871, -1.059354, 1, 1, 1, 1, 1,
-0.7786189, -0.4364098, -3.335994, 1, 1, 1, 1, 1,
-0.7740654, 0.6016167, -0.935571, 1, 1, 1, 1, 1,
-0.7737977, 0.2471555, -1.364522, 1, 1, 1, 1, 1,
-0.7545468, 1.47817, -1.70064, 1, 1, 1, 1, 1,
-0.7508351, -0.1857112, -2.5653, 1, 1, 1, 1, 1,
-0.74992, 1.493721, 1.446286, 1, 1, 1, 1, 1,
-0.7493824, 1.297548, -1.679198, 1, 1, 1, 1, 1,
-0.7408522, -1.337667, -2.938092, 0, 0, 1, 1, 1,
-0.7394359, -1.098033, -3.031579, 1, 0, 0, 1, 1,
-0.7347431, 0.3275093, -0.2016162, 1, 0, 0, 1, 1,
-0.7313609, -0.1826009, -3.127019, 1, 0, 0, 1, 1,
-0.7259909, 0.2773823, 0.04003606, 1, 0, 0, 1, 1,
-0.7250146, 0.1314718, -2.833477, 1, 0, 0, 1, 1,
-0.7235839, 0.4171562, -1.487774, 0, 0, 0, 1, 1,
-0.7214209, -1.571813, -1.341143, 0, 0, 0, 1, 1,
-0.7086493, -0.6860262, -1.932412, 0, 0, 0, 1, 1,
-0.707572, 0.5503541, -0.9596852, 0, 0, 0, 1, 1,
-0.7004725, 0.1316076, -0.8737596, 0, 0, 0, 1, 1,
-0.6973497, 0.1368311, -2.890989, 0, 0, 0, 1, 1,
-0.6967611, -0.3923641, -1.509702, 0, 0, 0, 1, 1,
-0.6849798, -2.055627, -2.418769, 1, 1, 1, 1, 1,
-0.6807761, 0.1137677, 0.1589911, 1, 1, 1, 1, 1,
-0.6795608, 0.290725, -1.604365, 1, 1, 1, 1, 1,
-0.6775562, -0.7604387, -2.671907, 1, 1, 1, 1, 1,
-0.6766195, 1.621683, -0.03979214, 1, 1, 1, 1, 1,
-0.674546, 1.216933, -0.05836178, 1, 1, 1, 1, 1,
-0.6721901, 0.7053199, -0.04976493, 1, 1, 1, 1, 1,
-0.671049, 0.2265896, 0.02477584, 1, 1, 1, 1, 1,
-0.6704677, 0.3732943, 0.3797079, 1, 1, 1, 1, 1,
-0.6699669, -0.285102, -2.585054, 1, 1, 1, 1, 1,
-0.6625046, 0.6599028, 1.004847, 1, 1, 1, 1, 1,
-0.6623173, -0.7981655, -3.441716, 1, 1, 1, 1, 1,
-0.6538626, 1.298672, -0.7937436, 1, 1, 1, 1, 1,
-0.6532388, -1.359231, -2.346386, 1, 1, 1, 1, 1,
-0.6469463, 0.1422807, -1.205893, 1, 1, 1, 1, 1,
-0.6443201, 1.076783, -2.050059, 0, 0, 1, 1, 1,
-0.6408687, 0.8427104, -2.094957, 1, 0, 0, 1, 1,
-0.6400015, -0.3093353, -1.839617, 1, 0, 0, 1, 1,
-0.6386412, -1.216891, -4.754991, 1, 0, 0, 1, 1,
-0.6370119, -0.5760059, -1.0744, 1, 0, 0, 1, 1,
-0.6361233, 2.14341, -1.32786, 1, 0, 0, 1, 1,
-0.6338417, 0.05858247, -1.827043, 0, 0, 0, 1, 1,
-0.6324044, 1.876256, -2.236385, 0, 0, 0, 1, 1,
-0.6320549, -0.1737792, -2.141725, 0, 0, 0, 1, 1,
-0.6310084, -1.004268, -2.573946, 0, 0, 0, 1, 1,
-0.628679, -0.2806487, -1.470905, 0, 0, 0, 1, 1,
-0.6278133, 0.2359938, -1.363446, 0, 0, 0, 1, 1,
-0.6263546, 0.3122245, -1.086616, 0, 0, 0, 1, 1,
-0.6243003, 0.7005961, -1.010833, 1, 1, 1, 1, 1,
-0.623731, -0.1898927, -1.430383, 1, 1, 1, 1, 1,
-0.6181736, -1.046722, -2.72087, 1, 1, 1, 1, 1,
-0.6167212, -2.208149, -2.356951, 1, 1, 1, 1, 1,
-0.6140525, -0.06467776, -0.5586016, 1, 1, 1, 1, 1,
-0.6127428, -0.3205433, -1.862381, 1, 1, 1, 1, 1,
-0.6105416, -0.484941, -2.127465, 1, 1, 1, 1, 1,
-0.6104389, -0.9401777, -3.999033, 1, 1, 1, 1, 1,
-0.6096706, -1.618622, -2.44695, 1, 1, 1, 1, 1,
-0.6056635, -0.2095954, -1.135294, 1, 1, 1, 1, 1,
-0.6037992, 0.7310974, -1.557466, 1, 1, 1, 1, 1,
-0.6037431, 0.3580208, -2.979041, 1, 1, 1, 1, 1,
-0.6028232, 2.247084, -0.6738254, 1, 1, 1, 1, 1,
-0.6011685, -0.134673, -2.172255, 1, 1, 1, 1, 1,
-0.5983897, 1.583632, 0.4401138, 1, 1, 1, 1, 1,
-0.5952798, 0.62654, -0.5963781, 0, 0, 1, 1, 1,
-0.5930412, -0.8298653, -4.849444, 1, 0, 0, 1, 1,
-0.5919423, 0.5777851, -1.8453, 1, 0, 0, 1, 1,
-0.5873855, 0.531504, -1.79884, 1, 0, 0, 1, 1,
-0.5833676, 2.099416, -1.02915, 1, 0, 0, 1, 1,
-0.582584, 0.3654452, -2.08368, 1, 0, 0, 1, 1,
-0.5800741, 0.9585786, 1.267853, 0, 0, 0, 1, 1,
-0.5800647, -0.6122316, -3.008222, 0, 0, 0, 1, 1,
-0.5790926, -0.09843288, -2.941612, 0, 0, 0, 1, 1,
-0.5783006, 0.7900749, -1.558475, 0, 0, 0, 1, 1,
-0.5774437, 1.693037, -0.9969202, 0, 0, 0, 1, 1,
-0.5770798, -0.1166326, -2.864608, 0, 0, 0, 1, 1,
-0.5764418, -0.06343064, -0.6716496, 0, 0, 0, 1, 1,
-0.5742941, -0.5709674, -1.254003, 1, 1, 1, 1, 1,
-0.5669928, -1.442489, -3.332338, 1, 1, 1, 1, 1,
-0.5648073, 1.583782, 2.224661, 1, 1, 1, 1, 1,
-0.5616923, 0.9012606, -1.265276, 1, 1, 1, 1, 1,
-0.5591087, -0.07998499, -3.290037, 1, 1, 1, 1, 1,
-0.5562887, -0.8806773, -3.014962, 1, 1, 1, 1, 1,
-0.55419, 0.2679745, -1.06661, 1, 1, 1, 1, 1,
-0.5525573, 0.09737775, -0.316544, 1, 1, 1, 1, 1,
-0.5501321, -1.784568, -3.109446, 1, 1, 1, 1, 1,
-0.5458446, 1.839277, -2.510843, 1, 1, 1, 1, 1,
-0.5372317, 0.04591134, -2.384482, 1, 1, 1, 1, 1,
-0.5367114, 0.2023175, -1.385144, 1, 1, 1, 1, 1,
-0.5356535, 1.145464, -0.7836748, 1, 1, 1, 1, 1,
-0.5316762, 0.006891868, -1.422707, 1, 1, 1, 1, 1,
-0.5256142, -0.9984035, -3.123353, 1, 1, 1, 1, 1,
-0.5170469, -0.1633084, -2.164785, 0, 0, 1, 1, 1,
-0.5166079, 0.7403042, -1.065827, 1, 0, 0, 1, 1,
-0.5163097, -0.1898852, -0.5919153, 1, 0, 0, 1, 1,
-0.5147074, -0.4074807, -1.711088, 1, 0, 0, 1, 1,
-0.5137736, 0.6351787, -1.645122, 1, 0, 0, 1, 1,
-0.5130739, 0.2792063, -0.4385854, 1, 0, 0, 1, 1,
-0.5120991, -0.4155801, -1.64675, 0, 0, 0, 1, 1,
-0.5120202, 1.153878, -2.168063, 0, 0, 0, 1, 1,
-0.5080276, 1.383011, 0.8109504, 0, 0, 0, 1, 1,
-0.5073679, 0.2818984, -0.9120758, 0, 0, 0, 1, 1,
-0.505203, 1.925319, -0.3919958, 0, 0, 0, 1, 1,
-0.5012714, -0.005458185, -3.157966, 0, 0, 0, 1, 1,
-0.5003502, -0.4014034, -1.03008, 0, 0, 0, 1, 1,
-0.4987975, 0.7204974, -1.634385, 1, 1, 1, 1, 1,
-0.4970879, -0.6756794, -3.344976, 1, 1, 1, 1, 1,
-0.4946317, -0.9032106, -3.672012, 1, 1, 1, 1, 1,
-0.4944195, -1.230195, -2.192265, 1, 1, 1, 1, 1,
-0.4906164, 1.461903, -0.8393756, 1, 1, 1, 1, 1,
-0.4851767, -0.8789402, -2.403744, 1, 1, 1, 1, 1,
-0.4845104, -0.2568788, -1.898237, 1, 1, 1, 1, 1,
-0.4824093, 1.439523, -0.3971223, 1, 1, 1, 1, 1,
-0.4800833, 0.929775, 0.8012874, 1, 1, 1, 1, 1,
-0.4790894, 0.09078152, -1.823969, 1, 1, 1, 1, 1,
-0.4773329, -0.0681494, -2.129258, 1, 1, 1, 1, 1,
-0.4751725, -0.975149, -3.507034, 1, 1, 1, 1, 1,
-0.4647065, -0.5129965, -3.223206, 1, 1, 1, 1, 1,
-0.4583321, 0.1859528, -1.379629, 1, 1, 1, 1, 1,
-0.4582212, 1.165699, 1.356682, 1, 1, 1, 1, 1,
-0.453611, 0.220348, -0.01472418, 0, 0, 1, 1, 1,
-0.4443431, -1.242194, -4.55457, 1, 0, 0, 1, 1,
-0.4416608, 1.432381, -1.026277, 1, 0, 0, 1, 1,
-0.4415713, 1.273002, 0.1201876, 1, 0, 0, 1, 1,
-0.435816, 0.01863356, -3.009337, 1, 0, 0, 1, 1,
-0.4356565, -1.020547, -3.58312, 1, 0, 0, 1, 1,
-0.4314449, 0.3461806, -0.4477078, 0, 0, 0, 1, 1,
-0.4312074, -0.2148423, -3.142713, 0, 0, 0, 1, 1,
-0.4301988, -1.107932, -1.938706, 0, 0, 0, 1, 1,
-0.4270378, 0.1986088, -0.3954319, 0, 0, 0, 1, 1,
-0.4265295, 0.9380092, 0.7559428, 0, 0, 0, 1, 1,
-0.4257636, 1.535544, -0.3902293, 0, 0, 0, 1, 1,
-0.4222134, 0.6424626, -2.499055, 0, 0, 0, 1, 1,
-0.4206256, -1.080882, -1.655131, 1, 1, 1, 1, 1,
-0.4162161, 0.5245557, 0.2613073, 1, 1, 1, 1, 1,
-0.4124157, -1.072769, -2.537039, 1, 1, 1, 1, 1,
-0.4107867, 1.294271, -0.982861, 1, 1, 1, 1, 1,
-0.4082335, -0.3299428, -1.389923, 1, 1, 1, 1, 1,
-0.4072873, 0.6974707, -0.4454074, 1, 1, 1, 1, 1,
-0.4059961, -1.639315, -3.512692, 1, 1, 1, 1, 1,
-0.3967037, 0.8314709, 0.4044955, 1, 1, 1, 1, 1,
-0.3916123, -2.046063, -2.39612, 1, 1, 1, 1, 1,
-0.3867536, 0.9930415, -1.085761, 1, 1, 1, 1, 1,
-0.3822767, -1.9001, -2.165842, 1, 1, 1, 1, 1,
-0.3789343, 1.124892, -0.3865627, 1, 1, 1, 1, 1,
-0.3756173, 1.706211, 0.879867, 1, 1, 1, 1, 1,
-0.3699909, 0.4161268, 0.4372724, 1, 1, 1, 1, 1,
-0.3698655, 2.272428, -2.196851, 1, 1, 1, 1, 1,
-0.369862, -0.6993299, -3.161117, 0, 0, 1, 1, 1,
-0.3690487, 0.992843, -0.5408387, 1, 0, 0, 1, 1,
-0.3688508, 0.411458, -1.433031, 1, 0, 0, 1, 1,
-0.3609466, -2.132499, -3.397406, 1, 0, 0, 1, 1,
-0.3601758, 1.154934, -1.683318, 1, 0, 0, 1, 1,
-0.3491583, 0.6199808, -0.03259076, 1, 0, 0, 1, 1,
-0.3488728, 0.2794857, -0.9918671, 0, 0, 0, 1, 1,
-0.3384548, 1.531114, -1.597397, 0, 0, 0, 1, 1,
-0.338392, -2.099614, -2.79601, 0, 0, 0, 1, 1,
-0.3376853, -0.07289084, -1.735057, 0, 0, 0, 1, 1,
-0.3376201, -1.628061, -2.935407, 0, 0, 0, 1, 1,
-0.3352858, -0.629961, -3.223215, 0, 0, 0, 1, 1,
-0.3340019, -0.3683678, 0.3863949, 0, 0, 0, 1, 1,
-0.3292744, 0.2617346, -1.486684, 1, 1, 1, 1, 1,
-0.3262973, 1.135562, -0.5499368, 1, 1, 1, 1, 1,
-0.3262754, 0.5638642, -0.3535052, 1, 1, 1, 1, 1,
-0.3246646, 0.6228055, -1.162629, 1, 1, 1, 1, 1,
-0.3226983, 1.652403, -0.1356571, 1, 1, 1, 1, 1,
-0.3201922, -0.1684259, -1.435194, 1, 1, 1, 1, 1,
-0.3197734, 0.2870791, -0.1859226, 1, 1, 1, 1, 1,
-0.319413, 1.074953, -1.222665, 1, 1, 1, 1, 1,
-0.3178236, -1.99585, -3.958603, 1, 1, 1, 1, 1,
-0.3170243, -0.8465571, -3.039592, 1, 1, 1, 1, 1,
-0.3154991, 1.879351, 0.09823106, 1, 1, 1, 1, 1,
-0.3136551, 1.416923, -0.3153645, 1, 1, 1, 1, 1,
-0.3074465, 0.5787125, 0.5121291, 1, 1, 1, 1, 1,
-0.3047345, 0.6571524, 0.2347631, 1, 1, 1, 1, 1,
-0.3042587, 0.6192687, -1.215651, 1, 1, 1, 1, 1,
-0.303557, -1.286259, -1.775794, 0, 0, 1, 1, 1,
-0.3021516, -0.2764746, -2.560856, 1, 0, 0, 1, 1,
-0.3008499, 0.5370776, -0.4369703, 1, 0, 0, 1, 1,
-0.2979539, 0.6621691, -0.240954, 1, 0, 0, 1, 1,
-0.297344, 0.3829696, 0.1083226, 1, 0, 0, 1, 1,
-0.2964947, 1.161609, 0.396011, 1, 0, 0, 1, 1,
-0.2930221, -1.869494, -2.915426, 0, 0, 0, 1, 1,
-0.2911597, 1.263068, 0.7841865, 0, 0, 0, 1, 1,
-0.2908317, 0.4650531, 0.5409972, 0, 0, 0, 1, 1,
-0.2850752, 0.6323625, 0.2852417, 0, 0, 0, 1, 1,
-0.2840525, 0.0475069, -1.654404, 0, 0, 0, 1, 1,
-0.2833746, 0.1885661, -2.578322, 0, 0, 0, 1, 1,
-0.2772965, -0.5319759, -2.869735, 0, 0, 0, 1, 1,
-0.2745801, 0.7652674, 1.164156, 1, 1, 1, 1, 1,
-0.2645194, 1.007504, 0.06999245, 1, 1, 1, 1, 1,
-0.2618076, -0.7119648, -2.122041, 1, 1, 1, 1, 1,
-0.2525307, -0.5329649, -3.636467, 1, 1, 1, 1, 1,
-0.2525067, 0.6757259, 1.161618, 1, 1, 1, 1, 1,
-0.2515457, 0.3309014, 0.9025696, 1, 1, 1, 1, 1,
-0.2501279, -0.5848756, -3.027466, 1, 1, 1, 1, 1,
-0.2500158, -0.5289829, -2.468317, 1, 1, 1, 1, 1,
-0.2488022, 0.7948539, 2.374061, 1, 1, 1, 1, 1,
-0.2480656, -0.3493441, -3.210913, 1, 1, 1, 1, 1,
-0.2463602, -2.177228, -3.755907, 1, 1, 1, 1, 1,
-0.2407058, -0.1957861, -3.277305, 1, 1, 1, 1, 1,
-0.2397026, 0.120901, -0.9676591, 1, 1, 1, 1, 1,
-0.2337388, -0.1278792, -3.676062, 1, 1, 1, 1, 1,
-0.2303187, 0.4235696, 1.392567, 1, 1, 1, 1, 1,
-0.2275895, -1.753585, -3.765777, 0, 0, 1, 1, 1,
-0.2273173, -2.020679, -2.82584, 1, 0, 0, 1, 1,
-0.2270569, 0.3112556, -1.497006, 1, 0, 0, 1, 1,
-0.2267849, -0.3705829, -2.122597, 1, 0, 0, 1, 1,
-0.2197596, -0.3035242, -1.543767, 1, 0, 0, 1, 1,
-0.2183716, -0.8260844, -2.866561, 1, 0, 0, 1, 1,
-0.2122336, 0.7568711, -1.007271, 0, 0, 0, 1, 1,
-0.2098809, -1.053264, -2.562141, 0, 0, 0, 1, 1,
-0.2096789, 1.966806, -1.670826, 0, 0, 0, 1, 1,
-0.2066914, 0.8422002, 1.415957, 0, 0, 0, 1, 1,
-0.2060797, -1.464946, -3.13703, 0, 0, 0, 1, 1,
-0.203823, -1.652382, -4.236264, 0, 0, 0, 1, 1,
-0.203369, 3.609167, 1.987982, 0, 0, 0, 1, 1,
-0.202941, 1.582567, -0.4120197, 1, 1, 1, 1, 1,
-0.2012153, -1.109764, -2.084344, 1, 1, 1, 1, 1,
-0.1987263, -1.536267, -2.580503, 1, 1, 1, 1, 1,
-0.1952144, -0.5625708, -2.642994, 1, 1, 1, 1, 1,
-0.1921361, -0.9368408, -1.888817, 1, 1, 1, 1, 1,
-0.1841922, 2.175192, -0.2928643, 1, 1, 1, 1, 1,
-0.175469, -0.5364684, -3.04941, 1, 1, 1, 1, 1,
-0.1727317, -1.359, -3.711348, 1, 1, 1, 1, 1,
-0.1699961, -0.7997428, -3.676146, 1, 1, 1, 1, 1,
-0.1672606, 0.08530822, -0.3050214, 1, 1, 1, 1, 1,
-0.1633995, -0.1829785, -1.367037, 1, 1, 1, 1, 1,
-0.1625505, -1.034446, -3.94777, 1, 1, 1, 1, 1,
-0.1590421, 1.436783, -0.6695276, 1, 1, 1, 1, 1,
-0.1516371, -1.294855, -3.135212, 1, 1, 1, 1, 1,
-0.1499234, -0.9074329, -2.329936, 1, 1, 1, 1, 1,
-0.1494607, 0.8242034, -2.161805, 0, 0, 1, 1, 1,
-0.1437812, 0.1012781, -1.229086, 1, 0, 0, 1, 1,
-0.1436784, 1.50479, 0.4754272, 1, 0, 0, 1, 1,
-0.1421182, 1.0647, -0.2521225, 1, 0, 0, 1, 1,
-0.141579, 1.505298, 0.4864945, 1, 0, 0, 1, 1,
-0.1407481, -0.1070543, -2.417944, 1, 0, 0, 1, 1,
-0.1383046, 0.160678, -1.025582, 0, 0, 0, 1, 1,
-0.1359763, -1.040361, -4.148334, 0, 0, 0, 1, 1,
-0.1335014, -1.6755, -3.27008, 0, 0, 0, 1, 1,
-0.1247985, -0.259081, -2.253766, 0, 0, 0, 1, 1,
-0.113342, 0.8479144, -1.462937, 0, 0, 0, 1, 1,
-0.1131882, -1.16581, -3.949183, 0, 0, 0, 1, 1,
-0.1124819, -0.8158914, -4.196032, 0, 0, 0, 1, 1,
-0.1046932, -0.07252766, -1.385351, 1, 1, 1, 1, 1,
-0.1018896, -0.5263798, -3.796642, 1, 1, 1, 1, 1,
-0.1002226, 2.933974, 0.08815974, 1, 1, 1, 1, 1,
-0.09959821, -1.706628, -2.780987, 1, 1, 1, 1, 1,
-0.09083787, 0.1954487, -1.033961, 1, 1, 1, 1, 1,
-0.09056873, 1.294188, -0.5756683, 1, 1, 1, 1, 1,
-0.09000713, -0.1370816, -2.863577, 1, 1, 1, 1, 1,
-0.08876691, 0.2372759, 0.8838693, 1, 1, 1, 1, 1,
-0.0882334, -0.6859249, -2.199492, 1, 1, 1, 1, 1,
-0.08503656, -0.8766195, -4.329812, 1, 1, 1, 1, 1,
-0.08435298, -0.4654782, -2.879913, 1, 1, 1, 1, 1,
-0.08276648, -1.132184, -3.0818, 1, 1, 1, 1, 1,
-0.07812675, -0.5975699, -1.040288, 1, 1, 1, 1, 1,
-0.07346783, -0.6724464, -2.34684, 1, 1, 1, 1, 1,
-0.07080175, -0.7938681, -3.135797, 1, 1, 1, 1, 1,
-0.06857072, -0.4164814, -2.828807, 0, 0, 1, 1, 1,
-0.0665171, -1.047774, -1.541868, 1, 0, 0, 1, 1,
-0.06638876, 0.05244538, 0.9502034, 1, 0, 0, 1, 1,
-0.06515165, 0.1262066, 0.11736, 1, 0, 0, 1, 1,
-0.05951217, -0.4604011, -1.801401, 1, 0, 0, 1, 1,
-0.05940775, -0.3764604, -2.016759, 1, 0, 0, 1, 1,
-0.05747532, 0.2506638, -0.07756357, 0, 0, 0, 1, 1,
-0.05747423, 0.318396, -0.111883, 0, 0, 0, 1, 1,
-0.04991954, -0.122114, -2.676341, 0, 0, 0, 1, 1,
-0.04959398, -2.004565, -4.735236, 0, 0, 0, 1, 1,
-0.04777975, 0.3141093, -0.4618557, 0, 0, 0, 1, 1,
-0.04138439, 0.3267455, 0.7178953, 0, 0, 0, 1, 1,
-0.03400861, -0.4570307, -1.821756, 0, 0, 0, 1, 1,
-0.02964619, 0.7092669, 1.33115, 1, 1, 1, 1, 1,
-0.0253179, -1.054614, -4.149734, 1, 1, 1, 1, 1,
-0.02143781, 0.01956674, -1.591748, 1, 1, 1, 1, 1,
-0.02100191, -1.154373, -1.223521, 1, 1, 1, 1, 1,
-0.01934782, -0.1677253, -5.002773, 1, 1, 1, 1, 1,
-0.01865075, -1.142604, -4.097919, 1, 1, 1, 1, 1,
-0.01686959, -0.5674143, -2.880333, 1, 1, 1, 1, 1,
-0.01608953, -0.7462547, -3.270191, 1, 1, 1, 1, 1,
-0.01456473, 1.007192, 0.412962, 1, 1, 1, 1, 1,
-0.01406936, 1.777467, 2.172774, 1, 1, 1, 1, 1,
-0.01152774, -0.8050765, -2.333527, 1, 1, 1, 1, 1,
-0.006515404, 0.8114941, -0.5083926, 1, 1, 1, 1, 1,
-0.004169966, 1.326572, 1.97926, 1, 1, 1, 1, 1,
-0.002946988, -0.02808278, -2.610585, 1, 1, 1, 1, 1,
0.001453214, 1.019351, 0.6387405, 1, 1, 1, 1, 1,
0.003750504, 0.6389934, 1.155564, 0, 0, 1, 1, 1,
0.003895582, -0.2078517, 1.569638, 1, 0, 0, 1, 1,
0.006555729, -0.1398093, 1.836735, 1, 0, 0, 1, 1,
0.01038491, -1.685685, 2.715226, 1, 0, 0, 1, 1,
0.01375653, 0.8927668, 0.5103437, 1, 0, 0, 1, 1,
0.01654313, 0.6495292, -0.3310858, 1, 0, 0, 1, 1,
0.01904834, -0.3325019, 3.511144, 0, 0, 0, 1, 1,
0.02112724, -1.335319, 4.811346, 0, 0, 0, 1, 1,
0.02181991, -0.8148356, 5.102538, 0, 0, 0, 1, 1,
0.02394458, -0.06841758, 3.460252, 0, 0, 0, 1, 1,
0.02518514, -0.279921, 2.611185, 0, 0, 0, 1, 1,
0.02639245, 1.095912, -0.7623158, 0, 0, 0, 1, 1,
0.03865619, 0.7315257, 1.157276, 0, 0, 0, 1, 1,
0.03909535, 0.8119367, 0.06727686, 1, 1, 1, 1, 1,
0.0391976, -1.583848, 2.792357, 1, 1, 1, 1, 1,
0.04240727, -0.6123194, 4.386123, 1, 1, 1, 1, 1,
0.04542619, 0.9063674, -0.263326, 1, 1, 1, 1, 1,
0.04588471, -1.368683, 3.301362, 1, 1, 1, 1, 1,
0.04811998, -1.828912, 2.733399, 1, 1, 1, 1, 1,
0.04872659, -0.09043487, 2.89676, 1, 1, 1, 1, 1,
0.0503561, 0.4819055, -0.3776141, 1, 1, 1, 1, 1,
0.05080709, -0.2040746, 3.680055, 1, 1, 1, 1, 1,
0.0543806, 2.626268, 1.051511, 1, 1, 1, 1, 1,
0.05479588, -1.190025, 3.85702, 1, 1, 1, 1, 1,
0.05831585, 0.902288, -0.7149061, 1, 1, 1, 1, 1,
0.06571785, -1.56154, 3.365297, 1, 1, 1, 1, 1,
0.06664167, 0.5879109, 1.14332, 1, 1, 1, 1, 1,
0.06708269, -0.03812543, 0.5733871, 1, 1, 1, 1, 1,
0.06792399, 0.6545538, -0.6455705, 0, 0, 1, 1, 1,
0.0700516, 0.03020248, 2.904475, 1, 0, 0, 1, 1,
0.07358137, 1.011649, 2.128146, 1, 0, 0, 1, 1,
0.07361656, 0.2170544, 0.5504973, 1, 0, 0, 1, 1,
0.07661729, 1.584067, 0.6980634, 1, 0, 0, 1, 1,
0.08494722, -0.6131361, 2.813901, 1, 0, 0, 1, 1,
0.08729965, -0.4731686, 3.776193, 0, 0, 0, 1, 1,
0.09113463, -0.4750364, 3.597941, 0, 0, 0, 1, 1,
0.09177738, -1.229192, 4.166391, 0, 0, 0, 1, 1,
0.09474179, -0.6236562, 2.053127, 0, 0, 0, 1, 1,
0.09740673, -0.9374622, 3.07549, 0, 0, 0, 1, 1,
0.09861085, -1.051027, 2.938437, 0, 0, 0, 1, 1,
0.09885104, 0.7437356, -0.5769243, 0, 0, 0, 1, 1,
0.09975433, -1.117542, 1.998268, 1, 1, 1, 1, 1,
0.1011124, -0.8043076, 3.627801, 1, 1, 1, 1, 1,
0.111265, 2.083286, 0.03034278, 1, 1, 1, 1, 1,
0.1158997, 0.09197687, 0.9263223, 1, 1, 1, 1, 1,
0.1182933, -0.4936717, 2.59215, 1, 1, 1, 1, 1,
0.123319, 1.025472, -0.7863771, 1, 1, 1, 1, 1,
0.1243472, 2.31349, -1.077661, 1, 1, 1, 1, 1,
0.1387304, 0.7138919, 0.7567004, 1, 1, 1, 1, 1,
0.1490971, 2.176992, 1.147408, 1, 1, 1, 1, 1,
0.1512188, -0.9795611, 1.677005, 1, 1, 1, 1, 1,
0.1513892, 1.101285, 0.2205977, 1, 1, 1, 1, 1,
0.1541173, -0.3445221, 1.86124, 1, 1, 1, 1, 1,
0.1569798, -1.288381, 2.758919, 1, 1, 1, 1, 1,
0.1629511, 1.350012, -0.01199125, 1, 1, 1, 1, 1,
0.1665969, -0.9082793, 3.787334, 1, 1, 1, 1, 1,
0.1682539, -1.997546, 2.890189, 0, 0, 1, 1, 1,
0.1712742, -0.4765141, 0.9651047, 1, 0, 0, 1, 1,
0.1722391, -1.41248, 2.676768, 1, 0, 0, 1, 1,
0.1729293, -0.6783998, 2.281218, 1, 0, 0, 1, 1,
0.1754089, 0.7002938, 2.768699, 1, 0, 0, 1, 1,
0.1757114, 0.3599329, 0.7604409, 1, 0, 0, 1, 1,
0.1783095, -0.7678843, 1.920574, 0, 0, 0, 1, 1,
0.1872034, -0.9140699, 2.645738, 0, 0, 0, 1, 1,
0.1905219, -0.007694213, 3.081112, 0, 0, 0, 1, 1,
0.1910488, 0.2921746, 0.7141762, 0, 0, 0, 1, 1,
0.1930654, -0.1833186, 3.293488, 0, 0, 0, 1, 1,
0.1961118, 0.201052, 1.998395, 0, 0, 0, 1, 1,
0.1975748, 2.095618, 0.263102, 0, 0, 0, 1, 1,
0.1978727, 1.51796, 0.06263196, 1, 1, 1, 1, 1,
0.1986952, -1.40985, 3.562237, 1, 1, 1, 1, 1,
0.1988477, 1.632788, -0.5711842, 1, 1, 1, 1, 1,
0.2006301, -1.012161, 3.204003, 1, 1, 1, 1, 1,
0.201489, 0.09483212, 2.192533, 1, 1, 1, 1, 1,
0.204611, 0.5477335, -0.05683617, 1, 1, 1, 1, 1,
0.2082071, 1.845589, -0.3693349, 1, 1, 1, 1, 1,
0.2144525, 0.1223761, 0.1158624, 1, 1, 1, 1, 1,
0.2212444, -0.1324074, 3.826407, 1, 1, 1, 1, 1,
0.2220061, -1.386424, 4.210444, 1, 1, 1, 1, 1,
0.2310958, 1.35756, 0.3599195, 1, 1, 1, 1, 1,
0.231524, -0.5222436, 2.196054, 1, 1, 1, 1, 1,
0.2327026, 0.4871494, 0.4055255, 1, 1, 1, 1, 1,
0.2331166, 0.6298537, 0.757605, 1, 1, 1, 1, 1,
0.2374309, 0.9130217, 0.2661391, 1, 1, 1, 1, 1,
0.2387276, -1.094039, 1.638022, 0, 0, 1, 1, 1,
0.2394255, -2.213172, 1.861173, 1, 0, 0, 1, 1,
0.2406237, 0.04499404, 0.7121243, 1, 0, 0, 1, 1,
0.2421204, 0.5843113, 0.7048351, 1, 0, 0, 1, 1,
0.2436214, -0.8898467, 2.217699, 1, 0, 0, 1, 1,
0.2463983, -0.6825155, 3.538775, 1, 0, 0, 1, 1,
0.2542413, 0.4498766, -1.630968, 0, 0, 0, 1, 1,
0.2547194, 1.768386, 0.1579524, 0, 0, 0, 1, 1,
0.2623528, 0.1075465, 0.7658287, 0, 0, 0, 1, 1,
0.262785, -1.345986, 4.200506, 0, 0, 0, 1, 1,
0.2639543, -1.920879, 3.536079, 0, 0, 0, 1, 1,
0.2644709, 0.8637512, -2.039604, 0, 0, 0, 1, 1,
0.2668174, 0.1807004, 1.631685, 0, 0, 0, 1, 1,
0.2697239, 0.447051, 1.53894, 1, 1, 1, 1, 1,
0.272212, 0.4464783, 0.02787354, 1, 1, 1, 1, 1,
0.2755236, 0.7807392, 0.2162443, 1, 1, 1, 1, 1,
0.2773389, 1.475629, 0.8474166, 1, 1, 1, 1, 1,
0.2775842, -1.50628, 1.508921, 1, 1, 1, 1, 1,
0.2803504, -1.13696, 2.908429, 1, 1, 1, 1, 1,
0.281526, 0.6046907, 1.702096, 1, 1, 1, 1, 1,
0.2840706, 0.5744864, -1.433815, 1, 1, 1, 1, 1,
0.284917, 0.5737215, 1.339884, 1, 1, 1, 1, 1,
0.2887694, 0.7655627, 0.8740197, 1, 1, 1, 1, 1,
0.2896994, 0.7257109, -0.5251318, 1, 1, 1, 1, 1,
0.2916652, -0.7999436, 3.302052, 1, 1, 1, 1, 1,
0.2923171, -0.159352, 3.529383, 1, 1, 1, 1, 1,
0.2939717, 0.2146081, 1.614787, 1, 1, 1, 1, 1,
0.2981217, 0.6229427, 0.8600226, 1, 1, 1, 1, 1,
0.3002807, 1.84257, 0.8282034, 0, 0, 1, 1, 1,
0.3015566, -1.237239, 1.869104, 1, 0, 0, 1, 1,
0.3036151, 0.6678975, 0.326893, 1, 0, 0, 1, 1,
0.3072492, 0.1804405, 3.305713, 1, 0, 0, 1, 1,
0.3116475, -0.6255743, 2.087757, 1, 0, 0, 1, 1,
0.312131, -0.1314121, 3.516459, 1, 0, 0, 1, 1,
0.3177351, 0.4169168, -0.3571285, 0, 0, 0, 1, 1,
0.3186793, 0.8680685, 0.9633591, 0, 0, 0, 1, 1,
0.3226174, -2.127307, 2.421834, 0, 0, 0, 1, 1,
0.3239816, 0.2908608, -1.755293, 0, 0, 0, 1, 1,
0.3248669, 0.8919882, 0.01024625, 0, 0, 0, 1, 1,
0.3274423, -0.03663138, 2.21862, 0, 0, 0, 1, 1,
0.3298674, -0.7475117, 1.934261, 0, 0, 0, 1, 1,
0.3303247, 1.157677, -0.8254327, 1, 1, 1, 1, 1,
0.3328222, -1.075373, 3.059601, 1, 1, 1, 1, 1,
0.3331135, -1.546381, 3.965638, 1, 1, 1, 1, 1,
0.3357608, 2.291548, 0.8093407, 1, 1, 1, 1, 1,
0.3390233, -0.7062684, 4.631954, 1, 1, 1, 1, 1,
0.341847, -0.3523979, 4.084476, 1, 1, 1, 1, 1,
0.3440641, 0.6757451, 1.591164, 1, 1, 1, 1, 1,
0.3484523, -1.524447, 3.961766, 1, 1, 1, 1, 1,
0.3551784, 0.3317673, 2.208947, 1, 1, 1, 1, 1,
0.3584477, 0.07195863, 0.07491361, 1, 1, 1, 1, 1,
0.3614429, -1.35118, 3.664561, 1, 1, 1, 1, 1,
0.3654764, 1.416208, -0.7980149, 1, 1, 1, 1, 1,
0.3676866, 0.7857318, -0.6773561, 1, 1, 1, 1, 1,
0.3708836, -0.2768173, 1.76951, 1, 1, 1, 1, 1,
0.3745313, -0.183708, 2.660706, 1, 1, 1, 1, 1,
0.3754812, 0.0447556, 1.716153, 0, 0, 1, 1, 1,
0.376338, -0.2244203, 2.100618, 1, 0, 0, 1, 1,
0.3790697, 0.4155587, -0.9972848, 1, 0, 0, 1, 1,
0.3793882, 0.2159766, 1.86342, 1, 0, 0, 1, 1,
0.3804708, -1.375451, 2.898474, 1, 0, 0, 1, 1,
0.3818475, 0.5071188, 2.482133, 1, 0, 0, 1, 1,
0.382782, 0.5904463, 0.7420695, 0, 0, 0, 1, 1,
0.384321, -0.2688803, 0.3304874, 0, 0, 0, 1, 1,
0.3852111, 1.032589, -0.2278889, 0, 0, 0, 1, 1,
0.387006, 0.3955414, 2.021967, 0, 0, 0, 1, 1,
0.3887729, -0.5872523, 2.147089, 0, 0, 0, 1, 1,
0.3954606, -0.1457283, 1.939265, 0, 0, 0, 1, 1,
0.4032669, -0.8493404, 2.549656, 0, 0, 0, 1, 1,
0.409153, 1.979379, -0.8012038, 1, 1, 1, 1, 1,
0.4134769, -0.5412212, 3.071277, 1, 1, 1, 1, 1,
0.4154651, 0.6299454, 0.7984735, 1, 1, 1, 1, 1,
0.4161777, -1.479014, 3.021975, 1, 1, 1, 1, 1,
0.416517, -0.5036948, 1.308714, 1, 1, 1, 1, 1,
0.4228427, 1.436457, 1.836638, 1, 1, 1, 1, 1,
0.4230811, 1.784828, 1.187052, 1, 1, 1, 1, 1,
0.4236732, 0.5932374, -0.6951038, 1, 1, 1, 1, 1,
0.4297845, -0.6051573, -0.7700248, 1, 1, 1, 1, 1,
0.4318904, -0.5276758, 4.454002, 1, 1, 1, 1, 1,
0.4357152, -0.7907124, 3.063552, 1, 1, 1, 1, 1,
0.4390691, 0.8366222, 0.4021597, 1, 1, 1, 1, 1,
0.439708, -3.001131, 2.318805, 1, 1, 1, 1, 1,
0.4435799, -1.107766, 2.630353, 1, 1, 1, 1, 1,
0.4444727, -0.3597185, 1.739732, 1, 1, 1, 1, 1,
0.4452518, -0.6452734, 3.276802, 0, 0, 1, 1, 1,
0.4533996, -0.9433286, 2.234853, 1, 0, 0, 1, 1,
0.453752, 0.07810678, 0.9185235, 1, 0, 0, 1, 1,
0.4580846, -0.4540994, 2.660277, 1, 0, 0, 1, 1,
0.4600591, -0.6240978, 1.751795, 1, 0, 0, 1, 1,
0.4670877, 0.2777302, 1.482732, 1, 0, 0, 1, 1,
0.4695143, -0.06041558, 2.250002, 0, 0, 0, 1, 1,
0.4701569, 0.8050869, 0.5181994, 0, 0, 0, 1, 1,
0.4713411, -0.8992509, 3.795622, 0, 0, 0, 1, 1,
0.4729696, 0.08913236, 0.6185445, 0, 0, 0, 1, 1,
0.4815733, -0.04615491, 3.101817, 0, 0, 0, 1, 1,
0.4863409, 0.1813168, 2.524169, 0, 0, 0, 1, 1,
0.4866073, 3.180885, -0.6117452, 0, 0, 0, 1, 1,
0.4952344, 0.927081, 0.6529598, 1, 1, 1, 1, 1,
0.4983815, -2.178946, 1.864837, 1, 1, 1, 1, 1,
0.5008075, 0.1800856, 1.385991, 1, 1, 1, 1, 1,
0.5039274, -1.162215, 1.460134, 1, 1, 1, 1, 1,
0.505456, 0.08141799, 2.202678, 1, 1, 1, 1, 1,
0.5057812, 0.9866281, 0.1000466, 1, 1, 1, 1, 1,
0.5071907, 0.5096061, 0.4156353, 1, 1, 1, 1, 1,
0.510098, -0.4264734, 2.143824, 1, 1, 1, 1, 1,
0.5112669, 0.7085261, -0.2496308, 1, 1, 1, 1, 1,
0.5127091, 1.238135, 0.4576473, 1, 1, 1, 1, 1,
0.5213499, 0.09859044, 1.515472, 1, 1, 1, 1, 1,
0.5313129, -1.139834, 1.684959, 1, 1, 1, 1, 1,
0.5322199, 0.4159621, 1.247051, 1, 1, 1, 1, 1,
0.5373972, -1.056052, 3.809008, 1, 1, 1, 1, 1,
0.5413456, -0.7298514, 2.467856, 1, 1, 1, 1, 1,
0.5427323, 0.3741085, 0.1983835, 0, 0, 1, 1, 1,
0.5430704, 1.057191, 1.347653, 1, 0, 0, 1, 1,
0.5458364, -0.2885128, 1.76196, 1, 0, 0, 1, 1,
0.5466169, -0.3685212, 3.312864, 1, 0, 0, 1, 1,
0.5473713, 0.2886351, 0.170452, 1, 0, 0, 1, 1,
0.5493246, 1.111467, -0.8974618, 1, 0, 0, 1, 1,
0.5493386, 0.4312621, 1.755572, 0, 0, 0, 1, 1,
0.5549514, -1.333675, 3.558382, 0, 0, 0, 1, 1,
0.5557099, 0.4493302, -0.2513016, 0, 0, 0, 1, 1,
0.5564833, 0.1066381, 1.528346, 0, 0, 0, 1, 1,
0.5600016, 0.01631315, 3.169991, 0, 0, 0, 1, 1,
0.5605385, 1.140457, 3.011478, 0, 0, 0, 1, 1,
0.5621108, 1.853232, 1.569666, 0, 0, 0, 1, 1,
0.5636364, -0.9443928, 3.275578, 1, 1, 1, 1, 1,
0.5636551, -0.3755016, 2.775891, 1, 1, 1, 1, 1,
0.5655413, -0.9929649, 3.390964, 1, 1, 1, 1, 1,
0.5684252, -1.897945, 3.692998, 1, 1, 1, 1, 1,
0.5714038, -0.3475708, 1.881896, 1, 1, 1, 1, 1,
0.5731531, -0.1574792, 1.758859, 1, 1, 1, 1, 1,
0.5734722, -0.6124449, 2.156512, 1, 1, 1, 1, 1,
0.5799971, -0.7788164, 4.686495, 1, 1, 1, 1, 1,
0.5809672, -0.6119573, 1.707958, 1, 1, 1, 1, 1,
0.5899212, -0.1474667, 2.722294, 1, 1, 1, 1, 1,
0.5937563, -0.6473867, 1.659327, 1, 1, 1, 1, 1,
0.5988371, 0.4031284, 1.79399, 1, 1, 1, 1, 1,
0.5997306, -0.6923336, 1.830624, 1, 1, 1, 1, 1,
0.6013097, 0.9303488, 1.923526, 1, 1, 1, 1, 1,
0.6037919, -0.8697821, 2.11951, 1, 1, 1, 1, 1,
0.6065587, 0.390283, -0.1677277, 0, 0, 1, 1, 1,
0.6069658, -0.3158359, 2.924699, 1, 0, 0, 1, 1,
0.6121971, 0.08862547, 2.195658, 1, 0, 0, 1, 1,
0.6224512, 1.114867, 0.4005337, 1, 0, 0, 1, 1,
0.63108, 0.5938643, 0.7672552, 1, 0, 0, 1, 1,
0.6320127, -0.4733844, 1.976483, 1, 0, 0, 1, 1,
0.6357993, 0.5942828, -0.2346731, 0, 0, 0, 1, 1,
0.6389752, -0.2515538, 1.985624, 0, 0, 0, 1, 1,
0.6451046, -0.2788059, 2.373288, 0, 0, 0, 1, 1,
0.659865, 0.7043839, 0.4940087, 0, 0, 0, 1, 1,
0.6613251, 0.1918538, 0.7916298, 0, 0, 0, 1, 1,
0.6626604, 1.6324, 0.5550439, 0, 0, 0, 1, 1,
0.6650629, 0.567422, 2.088532, 0, 0, 0, 1, 1,
0.6655009, -0.2230994, 2.896143, 1, 1, 1, 1, 1,
0.6684324, -1.382014, 0.7373418, 1, 1, 1, 1, 1,
0.6735551, 0.3055699, 1.538701, 1, 1, 1, 1, 1,
0.6754413, 0.6701706, 0.6313781, 1, 1, 1, 1, 1,
0.676478, -0.7067866, 2.877988, 1, 1, 1, 1, 1,
0.6811845, -0.6607411, 1.934569, 1, 1, 1, 1, 1,
0.684149, 0.3449376, 0.7142273, 1, 1, 1, 1, 1,
0.692279, 0.4759505, -1.432054, 1, 1, 1, 1, 1,
0.6991131, -1.978897, 0.4295559, 1, 1, 1, 1, 1,
0.7020612, 0.04406303, 2.518667, 1, 1, 1, 1, 1,
0.7026063, -0.09452597, 0.5316127, 1, 1, 1, 1, 1,
0.7026082, 0.7965994, -0.9003183, 1, 1, 1, 1, 1,
0.7028987, -0.5400063, 4.205573, 1, 1, 1, 1, 1,
0.7067413, -1.928128, 3.334183, 1, 1, 1, 1, 1,
0.7075161, 0.7583318, -0.1000318, 1, 1, 1, 1, 1,
0.7097078, -0.5790341, 2.047636, 0, 0, 1, 1, 1,
0.7119195, 1.043397, 0.4206272, 1, 0, 0, 1, 1,
0.7125034, 0.3842069, 0.8396261, 1, 0, 0, 1, 1,
0.7144544, 1.79681, 1.337421, 1, 0, 0, 1, 1,
0.7192085, 0.9654475, 1.842826, 1, 0, 0, 1, 1,
0.7377282, -0.8309813, 3.691513, 1, 0, 0, 1, 1,
0.7385504, 1.157871, 1.346491, 0, 0, 0, 1, 1,
0.7397465, 1.395296, 1.322165, 0, 0, 0, 1, 1,
0.7431237, 0.419985, 0.3846817, 0, 0, 0, 1, 1,
0.7431962, -0.2680879, 0.9295366, 0, 0, 0, 1, 1,
0.7432324, 0.1854769, 2.390287, 0, 0, 0, 1, 1,
0.7432562, 1.422336, 0.7119119, 0, 0, 0, 1, 1,
0.7450737, 0.0987466, 1.923907, 0, 0, 0, 1, 1,
0.746008, 0.4107303, 0.7450744, 1, 1, 1, 1, 1,
0.7501839, 0.1677551, -0.3008725, 1, 1, 1, 1, 1,
0.7502737, 1.651102, 0.9717915, 1, 1, 1, 1, 1,
0.7558709, 0.7645929, 1.56803, 1, 1, 1, 1, 1,
0.7592006, 0.556478, -0.2827776, 1, 1, 1, 1, 1,
0.7660403, 1.057412, -0.5032957, 1, 1, 1, 1, 1,
0.7665354, -0.07329144, 0.000213306, 1, 1, 1, 1, 1,
0.7665775, -1.561105, 0.4123651, 1, 1, 1, 1, 1,
0.7698171, 0.2615456, 2.173202, 1, 1, 1, 1, 1,
0.7746593, -0.5525422, 1.087334, 1, 1, 1, 1, 1,
0.7819389, 0.2905955, 1.807367, 1, 1, 1, 1, 1,
0.7830371, -0.4098521, 1.405224, 1, 1, 1, 1, 1,
0.784945, -0.04104796, 0.5398754, 1, 1, 1, 1, 1,
0.785954, -1.576601, 0.9648669, 1, 1, 1, 1, 1,
0.7869331, 0.5761284, -1.231346, 1, 1, 1, 1, 1,
0.7898887, -0.01355228, 1.957247, 0, 0, 1, 1, 1,
0.7913851, 1.913618, 1.264245, 1, 0, 0, 1, 1,
0.7926971, 0.8052372, 0.194991, 1, 0, 0, 1, 1,
0.7934, 1.227621, -0.5267594, 1, 0, 0, 1, 1,
0.7969179, 0.4110627, 0.7928734, 1, 0, 0, 1, 1,
0.7991066, 0.8145493, 1.455107, 1, 0, 0, 1, 1,
0.8059321, -0.2191108, 2.919909, 0, 0, 0, 1, 1,
0.8060192, -0.1780201, 0.6534328, 0, 0, 0, 1, 1,
0.8063846, 0.7797063, -0.2515056, 0, 0, 0, 1, 1,
0.808908, 1.549606, -0.9578357, 0, 0, 0, 1, 1,
0.8117571, -0.2875777, 1.90721, 0, 0, 0, 1, 1,
0.8119673, -0.1473651, 1.074066, 0, 0, 0, 1, 1,
0.8145145, 0.1889291, 0.9797609, 0, 0, 0, 1, 1,
0.8153187, -1.918234, 3.134014, 1, 1, 1, 1, 1,
0.8161134, 0.2941302, 1.167141, 1, 1, 1, 1, 1,
0.8190291, 0.1463725, 2.347152, 1, 1, 1, 1, 1,
0.8222295, 0.3356356, -0.53668, 1, 1, 1, 1, 1,
0.822765, -1.823217, 2.266485, 1, 1, 1, 1, 1,
0.826351, 0.2262114, -0.9505642, 1, 1, 1, 1, 1,
0.8283181, 0.2114687, 1.088295, 1, 1, 1, 1, 1,
0.8385723, -0.3771698, 1.552101, 1, 1, 1, 1, 1,
0.8393453, 0.4001695, 1.576618, 1, 1, 1, 1, 1,
0.8433575, -1.949721, 2.711242, 1, 1, 1, 1, 1,
0.8440755, 1.140379, 1.634372, 1, 1, 1, 1, 1,
0.8504813, -0.3920295, 3.565518, 1, 1, 1, 1, 1,
0.8622319, 1.122603, 1.847898, 1, 1, 1, 1, 1,
0.8656003, -0.2032468, 2.705849, 1, 1, 1, 1, 1,
0.86652, 0.4059579, 1.613788, 1, 1, 1, 1, 1,
0.8674622, -1.149131, 2.258832, 0, 0, 1, 1, 1,
0.8705532, 1.969031, 1.431792, 1, 0, 0, 1, 1,
0.8721368, 0.1843597, 3.699174, 1, 0, 0, 1, 1,
0.8735705, -1.150196, 2.580247, 1, 0, 0, 1, 1,
0.8758585, 0.4837576, -0.7262319, 1, 0, 0, 1, 1,
0.8763841, -0.5064985, 2.919563, 1, 0, 0, 1, 1,
0.8780388, 2.00767, -0.05035546, 0, 0, 0, 1, 1,
0.8808265, 0.2376368, 0.4086547, 0, 0, 0, 1, 1,
0.8909441, 0.6239434, 0.2804667, 0, 0, 0, 1, 1,
0.8936841, -0.7899306, 3.736142, 0, 0, 0, 1, 1,
0.8955165, -0.7967524, 1.702716, 0, 0, 0, 1, 1,
0.9000016, 0.7377751, 1.208547, 0, 0, 0, 1, 1,
0.9025438, 1.608209, -0.480745, 0, 0, 0, 1, 1,
0.9029066, 1.964966, -1.538237, 1, 1, 1, 1, 1,
0.9039212, 2.806975, 2.89942, 1, 1, 1, 1, 1,
0.9079156, -0.4248325, 1.664792, 1, 1, 1, 1, 1,
0.9144028, 0.1755688, 0.8114498, 1, 1, 1, 1, 1,
0.9152175, 1.050832, 0.408075, 1, 1, 1, 1, 1,
0.9180587, -0.5522445, 2.430364, 1, 1, 1, 1, 1,
0.9233287, -0.4429614, 3.115891, 1, 1, 1, 1, 1,
0.9243819, 1.554247, 0.2904628, 1, 1, 1, 1, 1,
0.931312, -0.4641094, 0.8188003, 1, 1, 1, 1, 1,
0.9344085, -1.635219, 2.176708, 1, 1, 1, 1, 1,
0.9347585, -2.052398, 3.661496, 1, 1, 1, 1, 1,
0.936451, -0.5671522, 2.959855, 1, 1, 1, 1, 1,
0.9417415, 0.1818584, 2.314915, 1, 1, 1, 1, 1,
0.9487367, 1.144591, 0.382626, 1, 1, 1, 1, 1,
0.9490179, 0.4690896, -0.3525517, 1, 1, 1, 1, 1,
0.9546205, -0.3596791, 1.423138, 0, 0, 1, 1, 1,
0.9574181, 0.4440348, 0.1827666, 1, 0, 0, 1, 1,
0.9593961, 0.8180594, 0.5346282, 1, 0, 0, 1, 1,
0.9610398, -0.6567989, 3.185428, 1, 0, 0, 1, 1,
0.9615554, -0.3633351, 0.8856197, 1, 0, 0, 1, 1,
0.9625418, 0.4535036, 2.295536, 1, 0, 0, 1, 1,
0.9633227, -0.740529, 3.611192, 0, 0, 0, 1, 1,
0.9744282, -0.900089, 2.856337, 0, 0, 0, 1, 1,
0.9769654, -1.340813, 3.742386, 0, 0, 0, 1, 1,
0.9815712, 0.7825894, 1.881655, 0, 0, 0, 1, 1,
1.005282, -0.3460439, 0.8135172, 0, 0, 0, 1, 1,
1.008555, 0.1872299, -0.1173796, 0, 0, 0, 1, 1,
1.009485, -1.375864, 3.97563, 0, 0, 0, 1, 1,
1.012979, -0.7411606, 2.878361, 1, 1, 1, 1, 1,
1.01885, -0.681909, 1.958858, 1, 1, 1, 1, 1,
1.020875, -1.168588, 3.631338, 1, 1, 1, 1, 1,
1.032073, -2.338372, 2.238446, 1, 1, 1, 1, 1,
1.036226, -0.162236, 2.938139, 1, 1, 1, 1, 1,
1.046754, -0.3460433, 1.346347, 1, 1, 1, 1, 1,
1.050083, 1.036261, 2.276294, 1, 1, 1, 1, 1,
1.050157, -0.7653959, 0.9102768, 1, 1, 1, 1, 1,
1.052407, -0.1711917, 1.784301, 1, 1, 1, 1, 1,
1.052903, -0.3050465, 2.634588, 1, 1, 1, 1, 1,
1.053355, -0.5864949, 1.891042, 1, 1, 1, 1, 1,
1.065765, 0.1193062, 2.07593, 1, 1, 1, 1, 1,
1.080637, 1.668418, -0.001581617, 1, 1, 1, 1, 1,
1.080783, 0.538829, -0.04508476, 1, 1, 1, 1, 1,
1.082979, 0.04080021, 2.304322, 1, 1, 1, 1, 1,
1.083661, -0.7451081, 2.245241, 0, 0, 1, 1, 1,
1.095161, -0.3372148, 3.181038, 1, 0, 0, 1, 1,
1.101297, -0.1059962, 2.082115, 1, 0, 0, 1, 1,
1.136163, -0.6080492, 2.128443, 1, 0, 0, 1, 1,
1.138005, -0.7942415, 2.882809, 1, 0, 0, 1, 1,
1.142741, 1.721003, 0.8530484, 1, 0, 0, 1, 1,
1.161052, -0.9024543, 2.826979, 0, 0, 0, 1, 1,
1.168352, -0.5624501, 3.414482, 0, 0, 0, 1, 1,
1.172559, -0.3131261, 0.7995291, 0, 0, 0, 1, 1,
1.174556, 0.9183854, 2.533664, 0, 0, 0, 1, 1,
1.179722, -0.7871473, 3.218584, 0, 0, 0, 1, 1,
1.185838, 1.959995, 1.70447, 0, 0, 0, 1, 1,
1.186735, 0.2460205, 0.894676, 0, 0, 0, 1, 1,
1.192631, 0.5337901, 1.241513, 1, 1, 1, 1, 1,
1.192635, -1.489865, 1.832719, 1, 1, 1, 1, 1,
1.194713, -0.9350907, 2.349986, 1, 1, 1, 1, 1,
1.202713, 0.9456633, 1.029793, 1, 1, 1, 1, 1,
1.21709, -0.4258943, 2.484195, 1, 1, 1, 1, 1,
1.226021, 0.3712348, 1.0234, 1, 1, 1, 1, 1,
1.230036, -1.298823, 2.892088, 1, 1, 1, 1, 1,
1.235987, -1.909197, 2.788224, 1, 1, 1, 1, 1,
1.248863, 2.837707, 1.483576, 1, 1, 1, 1, 1,
1.253304, -0.176127, 0.3161893, 1, 1, 1, 1, 1,
1.264, 1.230394, 1.77981, 1, 1, 1, 1, 1,
1.265917, 1.612956, 1.302781, 1, 1, 1, 1, 1,
1.281178, -0.2960213, 2.012065, 1, 1, 1, 1, 1,
1.288058, -0.898402, 1.938903, 1, 1, 1, 1, 1,
1.289373, -0.04124346, -0.2772573, 1, 1, 1, 1, 1,
1.31014, -0.07866146, 2.538574, 0, 0, 1, 1, 1,
1.32492, -0.5761414, 2.463388, 1, 0, 0, 1, 1,
1.326, 1.173899, 1.058165, 1, 0, 0, 1, 1,
1.328418, 1.5606, 1.639017, 1, 0, 0, 1, 1,
1.331171, 1.221538, 1.049161, 1, 0, 0, 1, 1,
1.333434, -1.419884, 2.709158, 1, 0, 0, 1, 1,
1.333435, 0.0796807, 2.082548, 0, 0, 0, 1, 1,
1.338618, -1.94001, 2.391353, 0, 0, 0, 1, 1,
1.340039, 0.008951069, 0.3854994, 0, 0, 0, 1, 1,
1.340571, 0.579317, 1.021914, 0, 0, 0, 1, 1,
1.342172, -0.2188925, 0.8501499, 0, 0, 0, 1, 1,
1.342782, 0.02107408, 2.17924, 0, 0, 0, 1, 1,
1.34478, 0.01452978, 1.876703, 0, 0, 0, 1, 1,
1.346699, 0.7127387, 1.515402, 1, 1, 1, 1, 1,
1.35146, 1.42327, 1.245325, 1, 1, 1, 1, 1,
1.370956, 1.331521, 0.4918485, 1, 1, 1, 1, 1,
1.371909, 2.10028, 1.163939, 1, 1, 1, 1, 1,
1.383898, -1.028697, 0.6562528, 1, 1, 1, 1, 1,
1.384038, -0.5356774, 2.570871, 1, 1, 1, 1, 1,
1.389178, 2.113827, 0.443695, 1, 1, 1, 1, 1,
1.393733, -0.2280442, 2.867533, 1, 1, 1, 1, 1,
1.394479, -0.9038109, 2.517782, 1, 1, 1, 1, 1,
1.395698, 0.3531808, -0.07101399, 1, 1, 1, 1, 1,
1.41029, -1.024459, 1.909663, 1, 1, 1, 1, 1,
1.421052, 0.6198844, -0.6552577, 1, 1, 1, 1, 1,
1.431955, 0.4687242, -0.4849523, 1, 1, 1, 1, 1,
1.432048, -1.188385, 3.363571, 1, 1, 1, 1, 1,
1.436087, -1.546894, 3.872128, 1, 1, 1, 1, 1,
1.437597, -0.4876028, 2.94952, 0, 0, 1, 1, 1,
1.437721, -0.6299586, 2.2609, 1, 0, 0, 1, 1,
1.441232, 0.3356769, 0.1408525, 1, 0, 0, 1, 1,
1.442965, -0.1130068, -0.1985711, 1, 0, 0, 1, 1,
1.445776, 1.951378, 1.573995, 1, 0, 0, 1, 1,
1.458815, 0.8022358, 1.84334, 1, 0, 0, 1, 1,
1.46677, 0.9576893, -0.9137682, 0, 0, 0, 1, 1,
1.477525, -0.02513117, -0.01141664, 0, 0, 0, 1, 1,
1.47984, -1.224097, 2.609213, 0, 0, 0, 1, 1,
1.480656, 0.460528, 0.2392441, 0, 0, 0, 1, 1,
1.48134, -0.7831349, 1.809748, 0, 0, 0, 1, 1,
1.486158, -2.069031, 2.681613, 0, 0, 0, 1, 1,
1.498147, -1.874259, 2.40246, 0, 0, 0, 1, 1,
1.499598, -0.5563892, 3.17362, 1, 1, 1, 1, 1,
1.526912, 0.5853375, 0.7553883, 1, 1, 1, 1, 1,
1.5394, 2.216811, -0.3914855, 1, 1, 1, 1, 1,
1.539455, -0.6146068, 1.192841, 1, 1, 1, 1, 1,
1.544447, -0.2991462, 1.545919, 1, 1, 1, 1, 1,
1.547523, 0.7166885, 0.01292951, 1, 1, 1, 1, 1,
1.561828, -0.05934357, 1.343259, 1, 1, 1, 1, 1,
1.56215, 1.399796, 2.267647, 1, 1, 1, 1, 1,
1.589989, 0.7225172, 1.593096, 1, 1, 1, 1, 1,
1.590535, 0.2192489, 2.063333, 1, 1, 1, 1, 1,
1.591119, -1.005046, 2.957038, 1, 1, 1, 1, 1,
1.598181, -0.8438635, 1.10701, 1, 1, 1, 1, 1,
1.601126, 0.8897029, -0.1790344, 1, 1, 1, 1, 1,
1.616188, -1.004727, 3.185121, 1, 1, 1, 1, 1,
1.627211, -1.354061, 1.939131, 1, 1, 1, 1, 1,
1.635047, 1.421505, 1.997835, 0, 0, 1, 1, 1,
1.639157, -0.3239857, 3.313788, 1, 0, 0, 1, 1,
1.648429, -0.4285239, 1.970865, 1, 0, 0, 1, 1,
1.659524, 0.8159276, 0.6649323, 1, 0, 0, 1, 1,
1.665187, 0.3630032, 2.864001, 1, 0, 0, 1, 1,
1.682738, -0.5123256, 2.593413, 1, 0, 0, 1, 1,
1.688437, 0.4386449, 2.857039, 0, 0, 0, 1, 1,
1.698676, -0.3236516, 1.627573, 0, 0, 0, 1, 1,
1.699868, -0.5691178, 0.5298395, 0, 0, 0, 1, 1,
1.703421, -0.5451612, 2.518226, 0, 0, 0, 1, 1,
1.742854, -0.5605338, 0.466934, 0, 0, 0, 1, 1,
1.752414, 1.278486, 0.8839365, 0, 0, 0, 1, 1,
1.765394, -0.7986198, 1.740768, 0, 0, 0, 1, 1,
1.787657, -0.154658, 2.492636, 1, 1, 1, 1, 1,
1.791247, 1.647383, -0.01715693, 1, 1, 1, 1, 1,
1.838865, 0.6034449, 1.343504, 1, 1, 1, 1, 1,
1.841458, -1.244432, 2.16354, 1, 1, 1, 1, 1,
1.849116, -0.7769337, 1.483164, 1, 1, 1, 1, 1,
1.857061, -0.4330407, -0.01681474, 1, 1, 1, 1, 1,
1.891592, 0.6676667, 0.8144996, 1, 1, 1, 1, 1,
1.899863, -2.052089, 2.026307, 1, 1, 1, 1, 1,
1.935177, 0.6510136, 1.487834, 1, 1, 1, 1, 1,
1.964254, 0.7179717, 0.04775818, 1, 1, 1, 1, 1,
1.999231, 1.164436, 1.158164, 1, 1, 1, 1, 1,
2.00166, -2.107052, 0.4764169, 1, 1, 1, 1, 1,
2.003715, -0.8101141, 2.728096, 1, 1, 1, 1, 1,
2.049155, 0.7318142, -1.975578, 1, 1, 1, 1, 1,
2.053432, -1.163761, 1.314087, 1, 1, 1, 1, 1,
2.063838, -0.1878587, 2.150452, 0, 0, 1, 1, 1,
2.072948, -0.481226, 2.855264, 1, 0, 0, 1, 1,
2.123026, 1.496425, 0.2785346, 1, 0, 0, 1, 1,
2.140078, -1.493542, 2.479572, 1, 0, 0, 1, 1,
2.196477, 1.090719, 0.4499837, 1, 0, 0, 1, 1,
2.245066, 0.3136495, 1.553211, 1, 0, 0, 1, 1,
2.26317, 0.5084396, 2.665353, 0, 0, 0, 1, 1,
2.280814, -1.85008, 2.243402, 0, 0, 0, 1, 1,
2.3538, 0.3690059, -0.1010038, 0, 0, 0, 1, 1,
2.355199, 0.2233458, 2.054042, 0, 0, 0, 1, 1,
2.372756, -0.5257058, 1.987159, 0, 0, 0, 1, 1,
2.425754, 0.8831569, 1.386076, 0, 0, 0, 1, 1,
2.469493, 0.8008662, 0.192867, 0, 0, 0, 1, 1,
2.505122, 0.1782558, 2.325345, 1, 1, 1, 1, 1,
2.524282, -2.966296, 3.290106, 1, 1, 1, 1, 1,
2.901228, -0.2532208, 0.6057538, 1, 1, 1, 1, 1,
2.923471, 0.6392431, -0.2179418, 1, 1, 1, 1, 1,
3.046166, -0.8492751, 2.889185, 1, 1, 1, 1, 1,
3.234757, 0.2042693, 2.695006, 1, 1, 1, 1, 1,
3.55869, 0.6339929, 0.6115461, 1, 1, 1, 1, 1
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
var radius = 9.556176;
var distance = 33.56567;
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
mvMatrix.translate( -0.05285478, -0.304018, -0.04988265 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56567);
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
