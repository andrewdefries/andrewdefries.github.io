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
-3.199466, 0.7125533, -1.127409, 1, 0, 0, 1,
-2.971136, -1.662361, -1.581031, 1, 0.007843138, 0, 1,
-2.714535, 1.121034, 0.04660613, 1, 0.01176471, 0, 1,
-2.56388, 0.106052, -2.268261, 1, 0.01960784, 0, 1,
-2.49158, 0.09425236, -2.1891, 1, 0.02352941, 0, 1,
-2.465462, 0.7091665, -4.152008, 1, 0.03137255, 0, 1,
-2.430697, 0.6847975, -2.479633, 1, 0.03529412, 0, 1,
-2.423007, 0.1369059, -0.7695757, 1, 0.04313726, 0, 1,
-2.387894, 1.188092, -0.2938558, 1, 0.04705882, 0, 1,
-2.365062, 0.7602993, -1.522501, 1, 0.05490196, 0, 1,
-2.340431, 1.056321, -2.83004, 1, 0.05882353, 0, 1,
-2.272481, 0.3037042, -1.771783, 1, 0.06666667, 0, 1,
-2.251164, 1.290859, -1.312764, 1, 0.07058824, 0, 1,
-2.243267, 0.243581, -2.97075, 1, 0.07843138, 0, 1,
-2.238194, -0.3612683, -0.296206, 1, 0.08235294, 0, 1,
-2.205759, 1.260623, 0.1056776, 1, 0.09019608, 0, 1,
-2.166985, -1.380014, -2.400983, 1, 0.09411765, 0, 1,
-2.152029, -0.3024574, -1.008032, 1, 0.1019608, 0, 1,
-2.136332, 1.087673, -0.1617141, 1, 0.1098039, 0, 1,
-2.128312, 0.7407416, -0.9955195, 1, 0.1137255, 0, 1,
-2.114036, 0.113204, -2.013167, 1, 0.1215686, 0, 1,
-2.07948, -1.424424, -2.521582, 1, 0.1254902, 0, 1,
-2.043632, 1.110507, -1.787604, 1, 0.1333333, 0, 1,
-2.025749, -1.229784, -1.042106, 1, 0.1372549, 0, 1,
-1.996315, 0.50249, -2.248713, 1, 0.145098, 0, 1,
-1.990608, -0.4097031, -1.603279, 1, 0.1490196, 0, 1,
-1.972609, 0.552565, 0.3644904, 1, 0.1568628, 0, 1,
-1.971014, -0.4165908, -2.252115, 1, 0.1607843, 0, 1,
-1.955091, 1.264193, -0.5692328, 1, 0.1686275, 0, 1,
-1.949414, -1.843927, -1.436161, 1, 0.172549, 0, 1,
-1.938608, -0.1096148, 0.2185212, 1, 0.1803922, 0, 1,
-1.936705, 1.484557, -0.4457429, 1, 0.1843137, 0, 1,
-1.933425, -1.283883, -3.502794, 1, 0.1921569, 0, 1,
-1.926395, 0.856774, -1.018275, 1, 0.1960784, 0, 1,
-1.918699, 0.2933442, -0.5088575, 1, 0.2039216, 0, 1,
-1.913027, -0.2234652, -1.151597, 1, 0.2117647, 0, 1,
-1.896833, 1.29467, -1.720903, 1, 0.2156863, 0, 1,
-1.852489, 0.02472584, -1.647171, 1, 0.2235294, 0, 1,
-1.842121, -0.8189212, -1.430781, 1, 0.227451, 0, 1,
-1.840803, 0.656191, -1.614625, 1, 0.2352941, 0, 1,
-1.824909, -0.5207605, -2.217073, 1, 0.2392157, 0, 1,
-1.809178, 1.763654, -1.876622, 1, 0.2470588, 0, 1,
-1.782116, -1.436943, -2.290273, 1, 0.2509804, 0, 1,
-1.750325, 0.8973634, -1.742865, 1, 0.2588235, 0, 1,
-1.727019, 1.504942, 0.6034248, 1, 0.2627451, 0, 1,
-1.725657, 0.3765925, -0.3020688, 1, 0.2705882, 0, 1,
-1.719096, 1.180715, 1.37337, 1, 0.2745098, 0, 1,
-1.70378, -0.420422, -0.07512028, 1, 0.282353, 0, 1,
-1.675466, 0.8427134, -1.680488, 1, 0.2862745, 0, 1,
-1.673504, 1.431905, 1.050465, 1, 0.2941177, 0, 1,
-1.671367, 1.365287, -2.213176, 1, 0.3019608, 0, 1,
-1.639867, -1.057214, -0.7823889, 1, 0.3058824, 0, 1,
-1.623904, -0.7412673, -1.736605, 1, 0.3137255, 0, 1,
-1.606385, -0.1930611, -1.720465, 1, 0.3176471, 0, 1,
-1.599661, -0.01078724, -3.248448, 1, 0.3254902, 0, 1,
-1.587033, 1.800261, -0.8556493, 1, 0.3294118, 0, 1,
-1.583708, -1.419348, -2.075252, 1, 0.3372549, 0, 1,
-1.579628, 1.312747, -1.294329, 1, 0.3411765, 0, 1,
-1.570251, 1.215504, -0.5034806, 1, 0.3490196, 0, 1,
-1.56655, -0.3433833, -2.154659, 1, 0.3529412, 0, 1,
-1.547706, -0.1198951, -2.652881, 1, 0.3607843, 0, 1,
-1.545038, -1.768025, -0.6035374, 1, 0.3647059, 0, 1,
-1.533652, 0.1031807, -0.3680254, 1, 0.372549, 0, 1,
-1.529995, -0.6410931, -2.424224, 1, 0.3764706, 0, 1,
-1.5185, 0.2006194, 0.6027011, 1, 0.3843137, 0, 1,
-1.512525, -0.2727017, -0.3285491, 1, 0.3882353, 0, 1,
-1.512163, -1.105939, -3.651304, 1, 0.3960784, 0, 1,
-1.504803, 1.110191, -0.8735359, 1, 0.4039216, 0, 1,
-1.50056, 0.2865115, -2.214247, 1, 0.4078431, 0, 1,
-1.490622, 0.1606294, -0.6622587, 1, 0.4156863, 0, 1,
-1.485323, 0.1746524, -0.1551063, 1, 0.4196078, 0, 1,
-1.481852, -0.1255031, 0.4271037, 1, 0.427451, 0, 1,
-1.479369, 0.242093, 0.3649597, 1, 0.4313726, 0, 1,
-1.475063, 2.43206, -0.5300531, 1, 0.4392157, 0, 1,
-1.474977, -0.3929103, -0.2711658, 1, 0.4431373, 0, 1,
-1.473837, -0.4943878, -3.492988, 1, 0.4509804, 0, 1,
-1.423301, 1.056727, -1.841148, 1, 0.454902, 0, 1,
-1.422562, -0.1542953, -0.9381709, 1, 0.4627451, 0, 1,
-1.41783, 2.016212, -0.7204782, 1, 0.4666667, 0, 1,
-1.410046, -2.211441, -1.706322, 1, 0.4745098, 0, 1,
-1.401859, 0.7948033, -1.11111, 1, 0.4784314, 0, 1,
-1.387878, 0.5595201, -0.9923672, 1, 0.4862745, 0, 1,
-1.3866, -0.295516, -2.598934, 1, 0.4901961, 0, 1,
-1.382639, 0.8096413, -1.314046, 1, 0.4980392, 0, 1,
-1.379196, -0.2799332, -1.567678, 1, 0.5058824, 0, 1,
-1.371153, -0.6685258, -1.960771, 1, 0.509804, 0, 1,
-1.369196, 2.314128, -1.847926, 1, 0.5176471, 0, 1,
-1.331317, -1.693264, -2.57141, 1, 0.5215687, 0, 1,
-1.325347, -0.0001956795, -1.276131, 1, 0.5294118, 0, 1,
-1.319914, 2.464062, -0.4584835, 1, 0.5333334, 0, 1,
-1.31976, 0.958046, -0.3085707, 1, 0.5411765, 0, 1,
-1.314306, 1.464269, -0.6583352, 1, 0.5450981, 0, 1,
-1.312845, -0.3343588, -0.5723392, 1, 0.5529412, 0, 1,
-1.305497, -0.1112446, -2.259696, 1, 0.5568628, 0, 1,
-1.296819, -1.221212, -3.528559, 1, 0.5647059, 0, 1,
-1.277703, -1.431775, -3.358763, 1, 0.5686275, 0, 1,
-1.262268, 0.5619167, -2.73032, 1, 0.5764706, 0, 1,
-1.260288, 1.119616, -0.4430228, 1, 0.5803922, 0, 1,
-1.257992, -1.136633, -2.818036, 1, 0.5882353, 0, 1,
-1.250253, 0.7565439, -1.741681, 1, 0.5921569, 0, 1,
-1.244341, 1.500428, -3.166614, 1, 0.6, 0, 1,
-1.240901, -0.7665871, -2.104704, 1, 0.6078432, 0, 1,
-1.240577, -0.6893477, -1.870022, 1, 0.6117647, 0, 1,
-1.240367, -0.08715216, -1.157609, 1, 0.6196079, 0, 1,
-1.223535, 0.6852488, -1.633894, 1, 0.6235294, 0, 1,
-1.222737, -0.3275591, -3.466009, 1, 0.6313726, 0, 1,
-1.217725, 2.205403, -0.1301685, 1, 0.6352941, 0, 1,
-1.21422, -0.3426851, -2.427981, 1, 0.6431373, 0, 1,
-1.211313, -0.9177975, -1.987438, 1, 0.6470588, 0, 1,
-1.209963, 0.8638374, -2.889378, 1, 0.654902, 0, 1,
-1.209575, 0.3182047, -1.942781, 1, 0.6588235, 0, 1,
-1.205913, -0.3757172, -2.81453, 1, 0.6666667, 0, 1,
-1.205256, -1.26957, -1.393736, 1, 0.6705883, 0, 1,
-1.201864, -0.461143, -2.221184, 1, 0.6784314, 0, 1,
-1.200462, -0.2000523, -2.400834, 1, 0.682353, 0, 1,
-1.193456, -1.359685, -2.525974, 1, 0.6901961, 0, 1,
-1.192502, -0.1293712, -1.347269, 1, 0.6941177, 0, 1,
-1.190494, -1.284807, -2.212672, 1, 0.7019608, 0, 1,
-1.182972, -0.7859117, -2.877688, 1, 0.7098039, 0, 1,
-1.176774, -0.5535566, 0.09442504, 1, 0.7137255, 0, 1,
-1.164306, -0.535406, -2.859418, 1, 0.7215686, 0, 1,
-1.154546, -0.326368, -2.411777, 1, 0.7254902, 0, 1,
-1.151268, -1.623885, -3.527339, 1, 0.7333333, 0, 1,
-1.140202, 1.692223, -1.462205, 1, 0.7372549, 0, 1,
-1.131611, -0.1787755, -1.352155, 1, 0.7450981, 0, 1,
-1.113583, 2.264633, -0.9388543, 1, 0.7490196, 0, 1,
-1.105752, 1.777196, 1.609152, 1, 0.7568628, 0, 1,
-1.104123, 0.435836, 0.4277761, 1, 0.7607843, 0, 1,
-1.100253, -0.3087706, -2.130063, 1, 0.7686275, 0, 1,
-1.0961, 1.586778, -0.5557706, 1, 0.772549, 0, 1,
-1.094624, 0.5840835, -2.248674, 1, 0.7803922, 0, 1,
-1.093768, -1.211149, -1.781507, 1, 0.7843137, 0, 1,
-1.083931, -0.7178849, -2.543313, 1, 0.7921569, 0, 1,
-1.082397, -1.46362, -2.487419, 1, 0.7960784, 0, 1,
-1.071311, 0.412103, -1.013143, 1, 0.8039216, 0, 1,
-1.059407, 0.2386442, -1.052872, 1, 0.8117647, 0, 1,
-1.056604, 1.389352, -1.852891, 1, 0.8156863, 0, 1,
-1.055382, -0.1364574, -2.883618, 1, 0.8235294, 0, 1,
-1.053159, -0.956919, -2.44518, 1, 0.827451, 0, 1,
-1.05085, -0.3566302, -1.785455, 1, 0.8352941, 0, 1,
-1.033505, 1.253905, -0.4613481, 1, 0.8392157, 0, 1,
-1.031307, 2.010468, -2.762223, 1, 0.8470588, 0, 1,
-1.03015, 1.303567, -1.601287, 1, 0.8509804, 0, 1,
-1.024338, -1.300246, -2.316101, 1, 0.8588235, 0, 1,
-1.020491, -0.9577382, -1.724233, 1, 0.8627451, 0, 1,
-1.013502, 1.619238, -0.003915979, 1, 0.8705882, 0, 1,
-1.00044, -0.509051, -1.243437, 1, 0.8745098, 0, 1,
-1.000016, -1.154873, -3.979304, 1, 0.8823529, 0, 1,
-0.9964743, 0.08800427, -2.18533, 1, 0.8862745, 0, 1,
-0.99059, -0.2392671, -2.796754, 1, 0.8941177, 0, 1,
-0.9868335, 0.07269096, -1.327, 1, 0.8980392, 0, 1,
-0.9808741, 1.819733, -0.3608419, 1, 0.9058824, 0, 1,
-0.978724, -0.4135073, -1.690151, 1, 0.9137255, 0, 1,
-0.9655016, 0.2673234, -1.296321, 1, 0.9176471, 0, 1,
-0.9610389, 0.04721703, -1.707094, 1, 0.9254902, 0, 1,
-0.9499848, 0.3115672, -0.9395989, 1, 0.9294118, 0, 1,
-0.9479423, -1.009537, -3.414463, 1, 0.9372549, 0, 1,
-0.9388413, -0.7595335, -2.160728, 1, 0.9411765, 0, 1,
-0.9323218, 0.5561435, -0.3970686, 1, 0.9490196, 0, 1,
-0.9265962, 1.098498, -2.296995, 1, 0.9529412, 0, 1,
-0.9262651, -0.2426245, -2.056836, 1, 0.9607843, 0, 1,
-0.9239783, 0.3550074, -1.847489, 1, 0.9647059, 0, 1,
-0.9194452, 0.2471702, -1.761921, 1, 0.972549, 0, 1,
-0.9190177, 0.2165155, -1.732967, 1, 0.9764706, 0, 1,
-0.9160312, -0.2967186, -1.723453, 1, 0.9843137, 0, 1,
-0.9145696, 2.538209, -2.007605, 1, 0.9882353, 0, 1,
-0.910302, -0.4375224, -2.616315, 1, 0.9960784, 0, 1,
-0.9035195, -2.213252, -1.877126, 0.9960784, 1, 0, 1,
-0.8994227, 0.9917687, -2.194364, 0.9921569, 1, 0, 1,
-0.8990667, -0.5147375, -0.8113337, 0.9843137, 1, 0, 1,
-0.8980767, -0.4715271, -3.000945, 0.9803922, 1, 0, 1,
-0.8897936, -0.02041919, -1.710582, 0.972549, 1, 0, 1,
-0.8895253, 0.4299521, -1.199743, 0.9686275, 1, 0, 1,
-0.8866429, -0.097792, -2.28055, 0.9607843, 1, 0, 1,
-0.8828148, 1.022116, -0.8433481, 0.9568627, 1, 0, 1,
-0.8768811, -1.237666, -2.572581, 0.9490196, 1, 0, 1,
-0.8744341, -0.5571731, -2.207087, 0.945098, 1, 0, 1,
-0.8635324, 1.442882, 1.539988, 0.9372549, 1, 0, 1,
-0.8617646, -0.1376303, -3.154406, 0.9333333, 1, 0, 1,
-0.8550878, -1.652555, -2.254628, 0.9254902, 1, 0, 1,
-0.8550479, 1.293755, 0.45926, 0.9215686, 1, 0, 1,
-0.8430784, -0.1623242, -2.911081, 0.9137255, 1, 0, 1,
-0.8373048, 0.4017223, -2.653403, 0.9098039, 1, 0, 1,
-0.8327878, 1.724312, -1.95477, 0.9019608, 1, 0, 1,
-0.8327382, 0.1399644, -0.968653, 0.8941177, 1, 0, 1,
-0.8290351, -1.00437, -2.309777, 0.8901961, 1, 0, 1,
-0.8281509, 0.7609599, -2.27843, 0.8823529, 1, 0, 1,
-0.8270103, -1.409142, -2.73397, 0.8784314, 1, 0, 1,
-0.8262805, -1.347128, -2.511405, 0.8705882, 1, 0, 1,
-0.8261312, -1.888029, -3.58945, 0.8666667, 1, 0, 1,
-0.8211288, -0.3741458, -1.197063, 0.8588235, 1, 0, 1,
-0.8163918, 0.335081, 0.1787781, 0.854902, 1, 0, 1,
-0.8123817, -0.3939828, -0.8436867, 0.8470588, 1, 0, 1,
-0.8108995, 1.493655, -1.789821, 0.8431373, 1, 0, 1,
-0.8087019, 1.824454, 0.0686881, 0.8352941, 1, 0, 1,
-0.8085732, 0.3610598, -0.9932331, 0.8313726, 1, 0, 1,
-0.8083662, 0.3486529, -1.006729, 0.8235294, 1, 0, 1,
-0.8065266, 1.236385, 0.6018808, 0.8196079, 1, 0, 1,
-0.8056268, -0.257939, -3.671193, 0.8117647, 1, 0, 1,
-0.8010389, -1.871621, -3.025047, 0.8078431, 1, 0, 1,
-0.7984295, 1.773919, 0.1935572, 0.8, 1, 0, 1,
-0.7920017, 0.6132643, -1.237756, 0.7921569, 1, 0, 1,
-0.7908034, -0.5445806, -3.611062, 0.7882353, 1, 0, 1,
-0.7884061, -1.248733, -2.569448, 0.7803922, 1, 0, 1,
-0.7808696, -0.1943141, -0.8777649, 0.7764706, 1, 0, 1,
-0.7779015, -1.001614, -3.604126, 0.7686275, 1, 0, 1,
-0.7741179, 1.014721, -2.119035, 0.7647059, 1, 0, 1,
-0.772068, 0.6246271, 0.2628425, 0.7568628, 1, 0, 1,
-0.7659339, 0.03596505, 0.06096148, 0.7529412, 1, 0, 1,
-0.7570366, -0.5584319, -1.419952, 0.7450981, 1, 0, 1,
-0.756395, -0.8884748, -2.930618, 0.7411765, 1, 0, 1,
-0.7552469, -0.4291001, -2.92896, 0.7333333, 1, 0, 1,
-0.7529169, 0.4284029, -0.2578955, 0.7294118, 1, 0, 1,
-0.7506524, -0.8544908, -1.877309, 0.7215686, 1, 0, 1,
-0.7390532, 1.101186, -0.7943869, 0.7176471, 1, 0, 1,
-0.7368718, 1.267285, -0.699155, 0.7098039, 1, 0, 1,
-0.7345964, 0.1477986, -0.09072006, 0.7058824, 1, 0, 1,
-0.7327241, 0.2824522, -1.552844, 0.6980392, 1, 0, 1,
-0.7302236, 1.900427, -0.1837079, 0.6901961, 1, 0, 1,
-0.7282144, 0.5705625, -0.9639933, 0.6862745, 1, 0, 1,
-0.7274737, -0.7929339, -1.487445, 0.6784314, 1, 0, 1,
-0.7232058, -2.056018, -2.574419, 0.6745098, 1, 0, 1,
-0.7203853, 1.353212, -1.539512, 0.6666667, 1, 0, 1,
-0.7193531, 0.8130792, -0.0466923, 0.6627451, 1, 0, 1,
-0.7188179, 0.2479076, -0.78775, 0.654902, 1, 0, 1,
-0.7149302, 1.079266, -0.683432, 0.6509804, 1, 0, 1,
-0.7135615, -1.017217, -3.285923, 0.6431373, 1, 0, 1,
-0.7119585, 0.09340981, -1.615355, 0.6392157, 1, 0, 1,
-0.7106325, 1.396911, 0.2333807, 0.6313726, 1, 0, 1,
-0.7095867, 2.461608, 1.891391, 0.627451, 1, 0, 1,
-0.7087472, -0.3721272, -2.52169, 0.6196079, 1, 0, 1,
-0.7035728, 0.2494213, -0.5852126, 0.6156863, 1, 0, 1,
-0.7017087, 0.3445582, 0.3365572, 0.6078432, 1, 0, 1,
-0.7006921, -0.9235185, -2.310024, 0.6039216, 1, 0, 1,
-0.700657, 1.089513, -1.206958, 0.5960785, 1, 0, 1,
-0.6983547, -1.535575, -2.252593, 0.5882353, 1, 0, 1,
-0.6907122, -0.9341366, -1.704746, 0.5843138, 1, 0, 1,
-0.6832197, 0.2882262, 0.06583446, 0.5764706, 1, 0, 1,
-0.6824585, 1.86594, -0.7919119, 0.572549, 1, 0, 1,
-0.6814647, 0.1316196, -1.734699, 0.5647059, 1, 0, 1,
-0.6777764, -1.909324, -1.778255, 0.5607843, 1, 0, 1,
-0.6743007, 0.9248679, -1.659582, 0.5529412, 1, 0, 1,
-0.6738601, -0.07092042, -1.096389, 0.5490196, 1, 0, 1,
-0.6738384, 0.5600045, -1.310591, 0.5411765, 1, 0, 1,
-0.6689833, 1.944593, -1.744519, 0.5372549, 1, 0, 1,
-0.6679351, -0.8181233, -0.4293031, 0.5294118, 1, 0, 1,
-0.6659409, 0.8805643, -1.549034, 0.5254902, 1, 0, 1,
-0.6629713, -0.1464595, -1.428341, 0.5176471, 1, 0, 1,
-0.662336, -0.1952115, -3.753827, 0.5137255, 1, 0, 1,
-0.661042, -0.8390799, -2.433135, 0.5058824, 1, 0, 1,
-0.6608572, -0.6196936, -1.947697, 0.5019608, 1, 0, 1,
-0.6534813, 0.1733838, -2.588275, 0.4941176, 1, 0, 1,
-0.6471745, 0.2061665, -0.7330119, 0.4862745, 1, 0, 1,
-0.6447137, -1.436459, -3.864049, 0.4823529, 1, 0, 1,
-0.6390242, 0.03212826, -0.8844705, 0.4745098, 1, 0, 1,
-0.6382052, -0.7351125, -0.1479047, 0.4705882, 1, 0, 1,
-0.6366906, -0.8217455, -2.161265, 0.4627451, 1, 0, 1,
-0.6347997, -1.353712, -2.743261, 0.4588235, 1, 0, 1,
-0.6335145, 0.3477159, -1.221005, 0.4509804, 1, 0, 1,
-0.6326792, 1.542632, 0.2980701, 0.4470588, 1, 0, 1,
-0.6312039, 0.7427999, -1.835161, 0.4392157, 1, 0, 1,
-0.6309787, -0.4609253, -2.770674, 0.4352941, 1, 0, 1,
-0.6285319, -0.1885267, -0.6337069, 0.427451, 1, 0, 1,
-0.6269968, 1.664883, -1.226355, 0.4235294, 1, 0, 1,
-0.6209128, -0.2872858, -1.559947, 0.4156863, 1, 0, 1,
-0.611923, -0.6760453, -3.093356, 0.4117647, 1, 0, 1,
-0.6072088, -0.3668261, -1.475783, 0.4039216, 1, 0, 1,
-0.6033701, -0.1929276, -3.651675, 0.3960784, 1, 0, 1,
-0.6028851, 1.257221, -2.459307, 0.3921569, 1, 0, 1,
-0.5907193, 0.8875398, -1.139867, 0.3843137, 1, 0, 1,
-0.5879554, -1.162199, -2.104813, 0.3803922, 1, 0, 1,
-0.5823426, -0.6636087, -0.9471061, 0.372549, 1, 0, 1,
-0.5799891, 0.4678273, -0.4429841, 0.3686275, 1, 0, 1,
-0.5781388, -0.9732767, -2.145034, 0.3607843, 1, 0, 1,
-0.5776479, -0.4027562, -0.8477775, 0.3568628, 1, 0, 1,
-0.5731361, -0.7179235, -1.147555, 0.3490196, 1, 0, 1,
-0.5706717, -0.455066, -1.831949, 0.345098, 1, 0, 1,
-0.5669816, 0.9694794, 0.2126016, 0.3372549, 1, 0, 1,
-0.5647014, 0.1184741, -1.799165, 0.3333333, 1, 0, 1,
-0.5643283, -0.1475829, -1.54405, 0.3254902, 1, 0, 1,
-0.5637791, 0.3062454, -2.039691, 0.3215686, 1, 0, 1,
-0.5575104, 2.562798, 0.3414957, 0.3137255, 1, 0, 1,
-0.5556083, 1.22776, -0.3628881, 0.3098039, 1, 0, 1,
-0.5544183, 1.741546, -0.9727376, 0.3019608, 1, 0, 1,
-0.5515984, 0.9948644, -1.071999, 0.2941177, 1, 0, 1,
-0.5444496, -0.4267473, -2.442515, 0.2901961, 1, 0, 1,
-0.5438542, 0.009417467, -1.528941, 0.282353, 1, 0, 1,
-0.5366786, -1.583969, -2.622236, 0.2784314, 1, 0, 1,
-0.5354178, -0.9454812, -2.849588, 0.2705882, 1, 0, 1,
-0.5303174, -0.7089412, -2.411101, 0.2666667, 1, 0, 1,
-0.5294749, 0.7695576, -0.299731, 0.2588235, 1, 0, 1,
-0.5250539, -0.2263687, -1.713081, 0.254902, 1, 0, 1,
-0.520794, 0.8186697, -0.6855717, 0.2470588, 1, 0, 1,
-0.5202596, 1.912749, 0.1243223, 0.2431373, 1, 0, 1,
-0.5202012, 0.5211897, -0.854027, 0.2352941, 1, 0, 1,
-0.5162836, 1.095972, -1.160326, 0.2313726, 1, 0, 1,
-0.5134053, 0.7881812, -0.8796166, 0.2235294, 1, 0, 1,
-0.5131603, -0.3005485, -1.955718, 0.2196078, 1, 0, 1,
-0.5130609, -0.3248126, -1.177546, 0.2117647, 1, 0, 1,
-0.5118169, 1.272639, -1.117082, 0.2078431, 1, 0, 1,
-0.5096322, -1.450234, -2.471092, 0.2, 1, 0, 1,
-0.509249, -1.254366, -3.081721, 0.1921569, 1, 0, 1,
-0.5035715, -0.05985013, -1.393637, 0.1882353, 1, 0, 1,
-0.497857, -1.215384, -2.529396, 0.1803922, 1, 0, 1,
-0.4976257, -0.3704814, -1.18962, 0.1764706, 1, 0, 1,
-0.4898031, 1.18655, -1.900824, 0.1686275, 1, 0, 1,
-0.4876846, -1.458194, -1.4082, 0.1647059, 1, 0, 1,
-0.4855194, -0.07351828, -1.914291, 0.1568628, 1, 0, 1,
-0.4849336, -1.677538, -3.698261, 0.1529412, 1, 0, 1,
-0.4821728, 1.362396, -0.2183827, 0.145098, 1, 0, 1,
-0.4782043, 0.9513144, -0.3826752, 0.1411765, 1, 0, 1,
-0.4725816, 0.4810628, -2.561361, 0.1333333, 1, 0, 1,
-0.4722625, 0.8413823, -0.5808932, 0.1294118, 1, 0, 1,
-0.4707682, 0.3957468, -2.830902, 0.1215686, 1, 0, 1,
-0.4661334, 0.9562628, -0.8229403, 0.1176471, 1, 0, 1,
-0.4620476, 0.951578, 0.8529451, 0.1098039, 1, 0, 1,
-0.4562637, -1.67537, -4.480516, 0.1058824, 1, 0, 1,
-0.4548598, -0.4899941, -1.402709, 0.09803922, 1, 0, 1,
-0.4538071, 1.192624, -1.60351, 0.09019608, 1, 0, 1,
-0.4503099, 0.9049103, 0.7274756, 0.08627451, 1, 0, 1,
-0.4458195, -0.7358004, -2.708152, 0.07843138, 1, 0, 1,
-0.4448693, -1.390251, -2.417935, 0.07450981, 1, 0, 1,
-0.4446039, -0.5305211, -1.248644, 0.06666667, 1, 0, 1,
-0.4432243, 0.6159467, -0.5351676, 0.0627451, 1, 0, 1,
-0.4425589, 1.2794, 0.3389532, 0.05490196, 1, 0, 1,
-0.4423218, -0.2032584, -2.605147, 0.05098039, 1, 0, 1,
-0.4420937, -0.462266, -0.7164919, 0.04313726, 1, 0, 1,
-0.4405075, 0.1159663, -1.33859, 0.03921569, 1, 0, 1,
-0.439518, -0.6996346, -3.19983, 0.03137255, 1, 0, 1,
-0.4384896, -1.400807, -2.995627, 0.02745098, 1, 0, 1,
-0.43253, 0.184315, -1.737664, 0.01960784, 1, 0, 1,
-0.4325267, -0.9926554, -2.024705, 0.01568628, 1, 0, 1,
-0.4292082, 0.01710477, -0.6869985, 0.007843138, 1, 0, 1,
-0.4291528, 0.04306159, -1.252771, 0.003921569, 1, 0, 1,
-0.4275835, -0.1867535, -2.648397, 0, 1, 0.003921569, 1,
-0.4273787, 0.02153384, -1.080735, 0, 1, 0.01176471, 1,
-0.4269426, -0.03408784, -0.6945784, 0, 1, 0.01568628, 1,
-0.423321, 0.8129712, -0.7351618, 0, 1, 0.02352941, 1,
-0.4217599, 1.237513, -1.210287, 0, 1, 0.02745098, 1,
-0.4160516, 0.665535, -2.097335, 0, 1, 0.03529412, 1,
-0.4140534, 0.1356816, -3.587417, 0, 1, 0.03921569, 1,
-0.4125122, 0.0436476, -0.822273, 0, 1, 0.04705882, 1,
-0.4115444, 0.5643724, -0.3394257, 0, 1, 0.05098039, 1,
-0.4089387, -1.386715, -2.040165, 0, 1, 0.05882353, 1,
-0.4028625, 2.455997, 0.9324366, 0, 1, 0.0627451, 1,
-0.4006046, -0.05617752, -0.9055715, 0, 1, 0.07058824, 1,
-0.3990441, -0.6504921, -3.976555, 0, 1, 0.07450981, 1,
-0.3955024, -0.4285066, -2.912841, 0, 1, 0.08235294, 1,
-0.3932118, -0.004700947, -0.07748125, 0, 1, 0.08627451, 1,
-0.3930838, -0.4031614, -1.706629, 0, 1, 0.09411765, 1,
-0.384925, -0.9340416, -1.902888, 0, 1, 0.1019608, 1,
-0.3772091, 1.297342, 1.260396, 0, 1, 0.1058824, 1,
-0.3750053, 0.05962917, -0.4625057, 0, 1, 0.1137255, 1,
-0.374505, 0.5186415, -1.324435, 0, 1, 0.1176471, 1,
-0.3731566, 0.8615773, -1.263821, 0, 1, 0.1254902, 1,
-0.3731501, 0.3135671, -1.958333, 0, 1, 0.1294118, 1,
-0.3633747, -0.3499188, -2.995904, 0, 1, 0.1372549, 1,
-0.3615147, -0.2811517, -2.128593, 0, 1, 0.1411765, 1,
-0.3582846, 0.7006795, 0.5842134, 0, 1, 0.1490196, 1,
-0.3496714, 0.9938396, 0.08511502, 0, 1, 0.1529412, 1,
-0.3471458, 0.2386247, 0.4983688, 0, 1, 0.1607843, 1,
-0.3462759, 0.2521033, -1.140334, 0, 1, 0.1647059, 1,
-0.3458562, 0.9135618, 0.1853019, 0, 1, 0.172549, 1,
-0.3447487, 0.08631917, -1.091548, 0, 1, 0.1764706, 1,
-0.3362937, 0.8887972, -0.211688, 0, 1, 0.1843137, 1,
-0.3339842, -0.6784469, -5.104656, 0, 1, 0.1882353, 1,
-0.3315749, 1.040683, 1.287931, 0, 1, 0.1960784, 1,
-0.3297248, -1.228602, -3.842227, 0, 1, 0.2039216, 1,
-0.3192363, -0.7532671, -1.246632, 0, 1, 0.2078431, 1,
-0.3188117, 0.2451449, -0.385129, 0, 1, 0.2156863, 1,
-0.3174672, -1.66514, -2.893114, 0, 1, 0.2196078, 1,
-0.3105591, 0.3221136, -0.3558781, 0, 1, 0.227451, 1,
-0.2990546, 0.9936513, 0.2891304, 0, 1, 0.2313726, 1,
-0.2985519, -0.3335846, -2.709807, 0, 1, 0.2392157, 1,
-0.2882232, -0.5392168, -2.156286, 0, 1, 0.2431373, 1,
-0.2876998, 0.5543716, -0.9764916, 0, 1, 0.2509804, 1,
-0.2871853, -0.488096, -3.30132, 0, 1, 0.254902, 1,
-0.2865206, -1.641199, -3.081496, 0, 1, 0.2627451, 1,
-0.2864255, -0.1380906, -0.2174674, 0, 1, 0.2666667, 1,
-0.2861983, 1.480386, -1.340292, 0, 1, 0.2745098, 1,
-0.2845273, -1.603904, -3.404367, 0, 1, 0.2784314, 1,
-0.2830618, 0.4296518, -1.059797, 0, 1, 0.2862745, 1,
-0.2800014, -0.08822564, -1.09646, 0, 1, 0.2901961, 1,
-0.2785858, -0.8770912, -2.003697, 0, 1, 0.2980392, 1,
-0.2785081, -1.019239, -3.786865, 0, 1, 0.3058824, 1,
-0.2774801, 0.1335549, 0.1054336, 0, 1, 0.3098039, 1,
-0.2772169, 2.165463, 0.2643879, 0, 1, 0.3176471, 1,
-0.2763035, -1.070031, -2.796308, 0, 1, 0.3215686, 1,
-0.2668583, -0.2682215, -3.685037, 0, 1, 0.3294118, 1,
-0.2497081, 0.110695, -2.516325, 0, 1, 0.3333333, 1,
-0.2497002, 0.01399446, -0.9697939, 0, 1, 0.3411765, 1,
-0.248058, -0.9453151, -3.186501, 0, 1, 0.345098, 1,
-0.2468297, 1.290855, 0.9785773, 0, 1, 0.3529412, 1,
-0.2459416, 0.62338, -0.5649745, 0, 1, 0.3568628, 1,
-0.2452981, -0.2866819, -3.523731, 0, 1, 0.3647059, 1,
-0.2448277, -0.8428681, -2.681239, 0, 1, 0.3686275, 1,
-0.2436881, 0.168135, -1.617145, 0, 1, 0.3764706, 1,
-0.2385507, -0.6390072, -3.611639, 0, 1, 0.3803922, 1,
-0.2347525, -0.7942433, -3.040467, 0, 1, 0.3882353, 1,
-0.2213392, -0.4769858, -3.133169, 0, 1, 0.3921569, 1,
-0.2176365, -0.1276214, -2.678172, 0, 1, 0.4, 1,
-0.215073, 0.02123232, 0.0968747, 0, 1, 0.4078431, 1,
-0.2148349, 0.2588585, -0.07185578, 0, 1, 0.4117647, 1,
-0.2146929, -0.8236504, -2.819841, 0, 1, 0.4196078, 1,
-0.2104983, -0.06095202, -2.383997, 0, 1, 0.4235294, 1,
-0.2103168, -0.2665683, -2.451123, 0, 1, 0.4313726, 1,
-0.2090027, 0.2388213, -1.7119, 0, 1, 0.4352941, 1,
-0.204301, -1.222073, -1.213683, 0, 1, 0.4431373, 1,
-0.2033022, 0.04247746, -1.232644, 0, 1, 0.4470588, 1,
-0.2026692, 0.4690882, -0.6548064, 0, 1, 0.454902, 1,
-0.1937219, 0.4209197, -0.7884655, 0, 1, 0.4588235, 1,
-0.1871265, -0.421837, -2.500258, 0, 1, 0.4666667, 1,
-0.1829442, 1.198922, -0.2269289, 0, 1, 0.4705882, 1,
-0.1812681, -1.564188, -3.205147, 0, 1, 0.4784314, 1,
-0.1796718, -0.3178882, -4.189537, 0, 1, 0.4823529, 1,
-0.1761242, -0.1534814, -1.245151, 0, 1, 0.4901961, 1,
-0.1728417, -1.350744, -2.80727, 0, 1, 0.4941176, 1,
-0.1678049, 0.3050628, -0.5141692, 0, 1, 0.5019608, 1,
-0.1668521, 0.2149078, 0.02187534, 0, 1, 0.509804, 1,
-0.166766, -1.277525, -2.351831, 0, 1, 0.5137255, 1,
-0.1667313, -1.295216, -3.732515, 0, 1, 0.5215687, 1,
-0.163904, -0.4695328, -3.071568, 0, 1, 0.5254902, 1,
-0.1635299, -1.845198, -1.952452, 0, 1, 0.5333334, 1,
-0.1607205, -0.8994881, -2.385105, 0, 1, 0.5372549, 1,
-0.1604917, 0.6460791, 0.3570323, 0, 1, 0.5450981, 1,
-0.1571876, 0.8890029, 0.5220904, 0, 1, 0.5490196, 1,
-0.1532579, 1.242552, 0.3985406, 0, 1, 0.5568628, 1,
-0.1494547, -0.5627818, -3.735139, 0, 1, 0.5607843, 1,
-0.1488825, 0.1388795, -1.826752, 0, 1, 0.5686275, 1,
-0.1469646, 1.192273, -0.9915388, 0, 1, 0.572549, 1,
-0.1422923, 1.559258, 0.1658268, 0, 1, 0.5803922, 1,
-0.1365208, 1.879593, 0.3892861, 0, 1, 0.5843138, 1,
-0.1328659, 0.6552571, -0.2969138, 0, 1, 0.5921569, 1,
-0.1316382, -1.264111, -2.436497, 0, 1, 0.5960785, 1,
-0.1314532, 0.4667061, -1.311064, 0, 1, 0.6039216, 1,
-0.1278865, 2.310706, -0.5140707, 0, 1, 0.6117647, 1,
-0.1271229, 0.1094265, -0.5079985, 0, 1, 0.6156863, 1,
-0.1248494, -0.3379103, -1.603229, 0, 1, 0.6235294, 1,
-0.1186423, 1.431271, 1.094958, 0, 1, 0.627451, 1,
-0.1169935, -1.004047, -3.309667, 0, 1, 0.6352941, 1,
-0.1161036, 1.976671, -0.1485988, 0, 1, 0.6392157, 1,
-0.1116042, 1.034586, -0.1956683, 0, 1, 0.6470588, 1,
-0.1062709, 1.852194, 0.3280934, 0, 1, 0.6509804, 1,
-0.101538, 0.6750743, 0.2264586, 0, 1, 0.6588235, 1,
-0.09907953, 1.405505, -0.7737707, 0, 1, 0.6627451, 1,
-0.09382003, -0.2554682, -2.113535, 0, 1, 0.6705883, 1,
-0.08623232, -0.08799314, -2.746248, 0, 1, 0.6745098, 1,
-0.08291601, 0.7602144, -0.5859161, 0, 1, 0.682353, 1,
-0.08290457, -1.213367, -3.533705, 0, 1, 0.6862745, 1,
-0.08279851, 0.1379579, -1.540483, 0, 1, 0.6941177, 1,
-0.0804586, -1.291631, -3.094542, 0, 1, 0.7019608, 1,
-0.07986097, 1.129332, -0.08391229, 0, 1, 0.7058824, 1,
-0.072767, 1.712076, -1.630236, 0, 1, 0.7137255, 1,
-0.06932701, -2.106348, -2.756471, 0, 1, 0.7176471, 1,
-0.06846079, -1.111462, -3.579576, 0, 1, 0.7254902, 1,
-0.06398635, 0.6035411, 0.9647857, 0, 1, 0.7294118, 1,
-0.06395372, -0.3898962, -3.812708, 0, 1, 0.7372549, 1,
-0.05728706, 0.133317, -1.361403, 0, 1, 0.7411765, 1,
-0.05452519, 0.1354022, -0.4680263, 0, 1, 0.7490196, 1,
-0.0543385, -1.126676, -2.276189, 0, 1, 0.7529412, 1,
-0.05151244, 0.5586889, -0.597347, 0, 1, 0.7607843, 1,
-0.05073441, -0.8863851, -0.7262592, 0, 1, 0.7647059, 1,
-0.04905046, 0.3778075, -0.6262074, 0, 1, 0.772549, 1,
-0.04686001, -0.7584781, -3.973179, 0, 1, 0.7764706, 1,
-0.04424522, 0.08713257, -0.4991359, 0, 1, 0.7843137, 1,
-0.03896539, -0.3076628, -3.325219, 0, 1, 0.7882353, 1,
-0.03163026, 0.8061161, 0.8968119, 0, 1, 0.7960784, 1,
-0.0308459, 0.9553261, -0.1224971, 0, 1, 0.8039216, 1,
-0.03043177, -0.5418751, -5.389946, 0, 1, 0.8078431, 1,
-0.02928997, -0.8675658, -3.144616, 0, 1, 0.8156863, 1,
-0.0280849, -0.3892951, -3.697443, 0, 1, 0.8196079, 1,
-0.02433818, -1.481266, -2.353568, 0, 1, 0.827451, 1,
-0.02275312, -1.663236, -2.689583, 0, 1, 0.8313726, 1,
-0.02238816, -0.7959638, -3.224336, 0, 1, 0.8392157, 1,
-0.02181777, 1.218148, 0.8072544, 0, 1, 0.8431373, 1,
-0.01959015, -1.474428, -4.00884, 0, 1, 0.8509804, 1,
-0.01868785, -0.7949021, -2.598541, 0, 1, 0.854902, 1,
-0.01603252, -1.260635, -1.64214, 0, 1, 0.8627451, 1,
-0.01492442, 0.02793137, 0.4342688, 0, 1, 0.8666667, 1,
-0.01378262, -0.9754974, -2.999774, 0, 1, 0.8745098, 1,
-0.0128218, 0.866903, 0.1873807, 0, 1, 0.8784314, 1,
-0.01019904, -0.2220311, -1.261667, 0, 1, 0.8862745, 1,
-0.009442166, 2.242903, 0.01234559, 0, 1, 0.8901961, 1,
-0.007779447, 0.9169204, -0.8768573, 0, 1, 0.8980392, 1,
-0.006783079, 0.4036373, -0.3335835, 0, 1, 0.9058824, 1,
-0.003438133, 1.065769, -0.6468837, 0, 1, 0.9098039, 1,
0.001691691, -0.8954937, 1.350456, 0, 1, 0.9176471, 1,
0.002929843, -0.1478611, 4.045781, 0, 1, 0.9215686, 1,
0.005835208, -1.607061, 3.128388, 0, 1, 0.9294118, 1,
0.006815596, -0.2212747, 3.840212, 0, 1, 0.9333333, 1,
0.009241454, -1.025789, 2.99179, 0, 1, 0.9411765, 1,
0.01163078, 0.2788015, 1.496006, 0, 1, 0.945098, 1,
0.0138196, -0.07420856, 2.330346, 0, 1, 0.9529412, 1,
0.01503936, -1.066908, 3.786456, 0, 1, 0.9568627, 1,
0.02023098, -0.03938236, 2.009074, 0, 1, 0.9647059, 1,
0.02144782, 0.5341052, 2.453055, 0, 1, 0.9686275, 1,
0.0221528, 0.3019967, 1.542025, 0, 1, 0.9764706, 1,
0.02281909, -0.587723, 2.940028, 0, 1, 0.9803922, 1,
0.02634187, -0.4370789, 4.967572, 0, 1, 0.9882353, 1,
0.02740688, -0.321244, 3.535041, 0, 1, 0.9921569, 1,
0.03018063, -0.170735, 1.837413, 0, 1, 1, 1,
0.03262297, 1.270372, -0.01697425, 0, 0.9921569, 1, 1,
0.04215942, 0.3033673, 0.4241175, 0, 0.9882353, 1, 1,
0.04278889, 1.02318, 0.5430147, 0, 0.9803922, 1, 1,
0.0430946, 0.1992111, 0.2681171, 0, 0.9764706, 1, 1,
0.04365066, 1.071993, 0.3744659, 0, 0.9686275, 1, 1,
0.04811472, 0.1366101, -0.5310272, 0, 0.9647059, 1, 1,
0.04955919, 0.2103791, -0.9062544, 0, 0.9568627, 1, 1,
0.04965726, -0.9470891, 0.5797619, 0, 0.9529412, 1, 1,
0.0510544, -0.3278432, 3.666092, 0, 0.945098, 1, 1,
0.05624561, 0.5028305, -0.6558228, 0, 0.9411765, 1, 1,
0.06154413, -0.5610912, 0.6485597, 0, 0.9333333, 1, 1,
0.06163695, -0.4017124, 2.101536, 0, 0.9294118, 1, 1,
0.06378392, -0.3343559, 1.367908, 0, 0.9215686, 1, 1,
0.06380566, -0.336002, 2.331782, 0, 0.9176471, 1, 1,
0.06581299, -2.322023, 1.660604, 0, 0.9098039, 1, 1,
0.06631776, -1.83849, 4.013375, 0, 0.9058824, 1, 1,
0.06651418, 0.3898128, 0.1933336, 0, 0.8980392, 1, 1,
0.06942268, -0.1844878, 1.927004, 0, 0.8901961, 1, 1,
0.07306012, -0.4344118, 3.600012, 0, 0.8862745, 1, 1,
0.07430783, 0.4893008, 0.2018804, 0, 0.8784314, 1, 1,
0.07463329, 1.285881, 0.8458567, 0, 0.8745098, 1, 1,
0.07479408, -0.2781071, 1.915959, 0, 0.8666667, 1, 1,
0.07497612, -0.8353142, 3.416284, 0, 0.8627451, 1, 1,
0.07901526, 1.433968, 1.647162, 0, 0.854902, 1, 1,
0.08222384, 1.647591, 0.1609529, 0, 0.8509804, 1, 1,
0.08390678, -1.074755, 1.728285, 0, 0.8431373, 1, 1,
0.08518893, -0.5405689, 1.753186, 0, 0.8392157, 1, 1,
0.08527556, 0.7108061, 0.3236602, 0, 0.8313726, 1, 1,
0.08739334, 0.5527294, 0.9310889, 0, 0.827451, 1, 1,
0.09541327, -0.00765766, 1.352, 0, 0.8196079, 1, 1,
0.09576824, 0.1464981, 1.332237, 0, 0.8156863, 1, 1,
0.09831025, 0.6785707, -0.632289, 0, 0.8078431, 1, 1,
0.1007253, -0.5204433, 3.988542, 0, 0.8039216, 1, 1,
0.1019359, -0.6122578, 3.836383, 0, 0.7960784, 1, 1,
0.102865, 0.03705379, 1.354249, 0, 0.7882353, 1, 1,
0.1046938, 0.2295671, 1.756093, 0, 0.7843137, 1, 1,
0.1133342, 1.771868, 0.3232314, 0, 0.7764706, 1, 1,
0.1169641, -1.16014, 2.950962, 0, 0.772549, 1, 1,
0.1220113, 0.9951183, 1.249109, 0, 0.7647059, 1, 1,
0.1225654, 1.358811, -0.318305, 0, 0.7607843, 1, 1,
0.1236055, 0.319409, 0.2684568, 0, 0.7529412, 1, 1,
0.1267078, 0.04668545, 1.655579, 0, 0.7490196, 1, 1,
0.1298578, 2.344836, -1.647078, 0, 0.7411765, 1, 1,
0.1337795, -1.763681, 0.9982489, 0, 0.7372549, 1, 1,
0.1340327, -0.3158505, 3.064916, 0, 0.7294118, 1, 1,
0.1342922, -0.5557178, 3.015445, 0, 0.7254902, 1, 1,
0.1356547, 1.514191, -1.137769, 0, 0.7176471, 1, 1,
0.1371364, -1.023216, 3.582591, 0, 0.7137255, 1, 1,
0.138109, 0.1579723, 1.406545, 0, 0.7058824, 1, 1,
0.1431322, 0.6882255, 0.3533133, 0, 0.6980392, 1, 1,
0.1431429, 0.6829848, 0.2157277, 0, 0.6941177, 1, 1,
0.1456279, 1.20925, -0.4897111, 0, 0.6862745, 1, 1,
0.1471785, 0.2476231, 0.2180335, 0, 0.682353, 1, 1,
0.1498891, 0.7702164, -0.7830448, 0, 0.6745098, 1, 1,
0.1525802, -0.09908539, 2.218948, 0, 0.6705883, 1, 1,
0.1540464, 0.6344497, -0.8614542, 0, 0.6627451, 1, 1,
0.1575952, 0.2537689, 1.077523, 0, 0.6588235, 1, 1,
0.1581758, -1.955489, 3.238276, 0, 0.6509804, 1, 1,
0.1583135, -0.3742441, 2.470118, 0, 0.6470588, 1, 1,
0.1601321, 0.6741698, -0.9125971, 0, 0.6392157, 1, 1,
0.1604267, -0.3377621, 3.923777, 0, 0.6352941, 1, 1,
0.162805, 0.5911292, -0.2171876, 0, 0.627451, 1, 1,
0.1636473, -0.3697082, 3.043268, 0, 0.6235294, 1, 1,
0.1637023, 0.9145946, 0.3708448, 0, 0.6156863, 1, 1,
0.1663947, -0.1880233, 2.77395, 0, 0.6117647, 1, 1,
0.1684589, -1.647066, 2.435776, 0, 0.6039216, 1, 1,
0.1694446, 0.732953, -1.177212, 0, 0.5960785, 1, 1,
0.1706734, -1.63777, 3.255093, 0, 0.5921569, 1, 1,
0.175945, -0.3342732, 3.401657, 0, 0.5843138, 1, 1,
0.1794744, 0.1001402, 0.009482918, 0, 0.5803922, 1, 1,
0.1798864, -0.2714548, 2.041099, 0, 0.572549, 1, 1,
0.1878068, 0.2376734, 0.4701592, 0, 0.5686275, 1, 1,
0.1888221, -0.08768271, 2.331789, 0, 0.5607843, 1, 1,
0.1909418, 0.709398, -0.8165259, 0, 0.5568628, 1, 1,
0.1997789, 1.864416, -0.8818325, 0, 0.5490196, 1, 1,
0.202214, -0.1556755, 1.831625, 0, 0.5450981, 1, 1,
0.2057206, 1.713841, 1.977828, 0, 0.5372549, 1, 1,
0.207127, 1.50062, -0.336823, 0, 0.5333334, 1, 1,
0.2084355, 0.8396381, 0.445144, 0, 0.5254902, 1, 1,
0.2121466, -0.7611616, 3.504105, 0, 0.5215687, 1, 1,
0.2123426, -2.091005, 1.14347, 0, 0.5137255, 1, 1,
0.2140522, 1.048607, 0.4081157, 0, 0.509804, 1, 1,
0.2146154, -1.262958, 2.613425, 0, 0.5019608, 1, 1,
0.2150899, -1.46179, 5.54932, 0, 0.4941176, 1, 1,
0.2151453, -0.3336208, 0.9622585, 0, 0.4901961, 1, 1,
0.2152002, -1.359052, 2.175833, 0, 0.4823529, 1, 1,
0.2164233, -1.179363, 2.796457, 0, 0.4784314, 1, 1,
0.2165455, 0.7825199, -1.389591, 0, 0.4705882, 1, 1,
0.2173133, -0.3104411, 0.8311493, 0, 0.4666667, 1, 1,
0.2176346, -0.5841195, 3.347624, 0, 0.4588235, 1, 1,
0.2196571, 1.687452, 0.1519095, 0, 0.454902, 1, 1,
0.2241836, -2.063528, 4.383514, 0, 0.4470588, 1, 1,
0.2252247, -0.3665695, 2.038475, 0, 0.4431373, 1, 1,
0.2286117, -0.3895764, 3.347826, 0, 0.4352941, 1, 1,
0.2465762, 0.108289, -0.1295922, 0, 0.4313726, 1, 1,
0.2472963, 0.3969474, 1.633924, 0, 0.4235294, 1, 1,
0.2481447, 1.416576, 0.3429664, 0, 0.4196078, 1, 1,
0.2493274, 1.027136, -0.5011899, 0, 0.4117647, 1, 1,
0.2496045, 1.32595, -0.4871817, 0, 0.4078431, 1, 1,
0.2510654, -0.589995, 3.650227, 0, 0.4, 1, 1,
0.2524778, -0.745177, 2.71638, 0, 0.3921569, 1, 1,
0.2526731, 1.040291, -0.3587106, 0, 0.3882353, 1, 1,
0.2563328, -1.334127, 4.811558, 0, 0.3803922, 1, 1,
0.262297, 0.6186756, -1.414215, 0, 0.3764706, 1, 1,
0.2656101, 0.3685903, 1.07088, 0, 0.3686275, 1, 1,
0.2663283, -0.159271, 3.336157, 0, 0.3647059, 1, 1,
0.2677579, -1.245791, 1.940813, 0, 0.3568628, 1, 1,
0.2678281, -1.32958, 2.942509, 0, 0.3529412, 1, 1,
0.2695855, 0.04174874, 1.629202, 0, 0.345098, 1, 1,
0.2717356, -0.2277602, 0.67076, 0, 0.3411765, 1, 1,
0.2732538, -1.584772, 3.153342, 0, 0.3333333, 1, 1,
0.2762833, 0.4878146, 0.7793735, 0, 0.3294118, 1, 1,
0.2765378, -1.28562, 3.777739, 0, 0.3215686, 1, 1,
0.2845243, 0.3906439, 0.2924277, 0, 0.3176471, 1, 1,
0.2856673, -1.169573, 3.843704, 0, 0.3098039, 1, 1,
0.2883774, -0.5715763, 1.506564, 0, 0.3058824, 1, 1,
0.2925965, 0.6422902, 1.745449, 0, 0.2980392, 1, 1,
0.2951982, 0.9421014, 2.028508, 0, 0.2901961, 1, 1,
0.2966973, -0.3279063, 0.8729562, 0, 0.2862745, 1, 1,
0.3011553, -0.2097261, 4.363268, 0, 0.2784314, 1, 1,
0.3021435, -0.7274505, 3.288635, 0, 0.2745098, 1, 1,
0.3033109, 0.5506455, 1.008198, 0, 0.2666667, 1, 1,
0.3033142, -1.908402, 3.885524, 0, 0.2627451, 1, 1,
0.3037932, -0.8530939, 2.272786, 0, 0.254902, 1, 1,
0.3090603, 1.094305, -0.1876546, 0, 0.2509804, 1, 1,
0.3101596, 0.043972, 2.288554, 0, 0.2431373, 1, 1,
0.3132552, -1.745752, 3.623649, 0, 0.2392157, 1, 1,
0.3161311, 0.09011552, -0.3033257, 0, 0.2313726, 1, 1,
0.3198283, 2.226417, 2.671367, 0, 0.227451, 1, 1,
0.3221872, 0.5850353, -0.7711435, 0, 0.2196078, 1, 1,
0.3247202, 0.7748632, -0.35813, 0, 0.2156863, 1, 1,
0.3254431, -1.931508, 3.073055, 0, 0.2078431, 1, 1,
0.3270448, -1.15452, 2.809789, 0, 0.2039216, 1, 1,
0.3328604, -0.6357725, 3.267245, 0, 0.1960784, 1, 1,
0.3347568, -0.2298743, 2.735574, 0, 0.1882353, 1, 1,
0.3361835, 0.5466463, 0.3516627, 0, 0.1843137, 1, 1,
0.3368742, -0.9561126, 2.275796, 0, 0.1764706, 1, 1,
0.3379414, 0.8256434, 0.2302407, 0, 0.172549, 1, 1,
0.3397955, -0.445583, 0.2849307, 0, 0.1647059, 1, 1,
0.3438387, 0.452226, 0.8636801, 0, 0.1607843, 1, 1,
0.3487853, 0.810596, 0.09254636, 0, 0.1529412, 1, 1,
0.3517861, -0.2733513, 2.426584, 0, 0.1490196, 1, 1,
0.35803, -1.315353, 2.093759, 0, 0.1411765, 1, 1,
0.3584762, 0.5175278, -0.2346919, 0, 0.1372549, 1, 1,
0.363828, -0.2669463, 1.453141, 0, 0.1294118, 1, 1,
0.3640496, -0.7465501, 3.070282, 0, 0.1254902, 1, 1,
0.3653724, -1.53028, 4.308613, 0, 0.1176471, 1, 1,
0.3667221, -0.2569806, 2.614601, 0, 0.1137255, 1, 1,
0.3671072, 0.5095415, -0.3836928, 0, 0.1058824, 1, 1,
0.3683067, -0.6548961, 2.931794, 0, 0.09803922, 1, 1,
0.3730122, -0.2822086, 3.321432, 0, 0.09411765, 1, 1,
0.3740065, -0.8815978, 2.19875, 0, 0.08627451, 1, 1,
0.3753042, 1.454807, -0.5857414, 0, 0.08235294, 1, 1,
0.3792374, -1.225276, 2.955906, 0, 0.07450981, 1, 1,
0.3898259, 2.306342, 0.02130409, 0, 0.07058824, 1, 1,
0.3919155, -0.5376673, 3.387242, 0, 0.0627451, 1, 1,
0.3991184, -0.7861717, 1.778531, 0, 0.05882353, 1, 1,
0.4042293, -1.806001, 2.779466, 0, 0.05098039, 1, 1,
0.4052044, 0.8063313, 0.04502714, 0, 0.04705882, 1, 1,
0.4092, 1.531563, -0.00240417, 0, 0.03921569, 1, 1,
0.4119365, -0.5330924, 3.180707, 0, 0.03529412, 1, 1,
0.4137673, 0.5880765, 0.4147886, 0, 0.02745098, 1, 1,
0.4248593, 0.7478828, -1.349547, 0, 0.02352941, 1, 1,
0.4284336, 1.028191, 0.2156819, 0, 0.01568628, 1, 1,
0.4381573, -1.434015, 3.173695, 0, 0.01176471, 1, 1,
0.4423717, 0.674053, 2.440706, 0, 0.003921569, 1, 1,
0.4496584, 1.041818, -0.193076, 0.003921569, 0, 1, 1,
0.4539219, -1.37298, 2.424864, 0.007843138, 0, 1, 1,
0.4580547, 0.7145188, -0.7053326, 0.01568628, 0, 1, 1,
0.4613544, 0.7406182, 0.1524631, 0.01960784, 0, 1, 1,
0.4672713, 1.231175, 0.4847834, 0.02745098, 0, 1, 1,
0.4680986, 0.7391059, 0.0159823, 0.03137255, 0, 1, 1,
0.4700097, -0.2842121, 3.138979, 0.03921569, 0, 1, 1,
0.4738528, 0.7254255, 0.1370059, 0.04313726, 0, 1, 1,
0.4760976, 0.4035179, 1.812457, 0.05098039, 0, 1, 1,
0.4851239, 0.2656524, 0.008807138, 0.05490196, 0, 1, 1,
0.4864065, 2.458013, 0.5126903, 0.0627451, 0, 1, 1,
0.4875188, 1.693112, 1.210603, 0.06666667, 0, 1, 1,
0.4878086, 0.05265841, 0.9500975, 0.07450981, 0, 1, 1,
0.4902382, 3.107444, -1.279037, 0.07843138, 0, 1, 1,
0.4968299, -0.1176493, 3.956474, 0.08627451, 0, 1, 1,
0.4975551, -1.270521, 2.388073, 0.09019608, 0, 1, 1,
0.49906, -0.7216313, 3.27036, 0.09803922, 0, 1, 1,
0.5009432, 0.9919196, 2.248871, 0.1058824, 0, 1, 1,
0.5042404, 0.4079586, 0.2390386, 0.1098039, 0, 1, 1,
0.5062863, -0.1521651, 1.318133, 0.1176471, 0, 1, 1,
0.507887, 0.3739942, 2.581996, 0.1215686, 0, 1, 1,
0.5082728, -0.748238, 2.270094, 0.1294118, 0, 1, 1,
0.5088181, -0.6337037, 4.265066, 0.1333333, 0, 1, 1,
0.509603, -1.042641, 2.324099, 0.1411765, 0, 1, 1,
0.5097777, -0.8417311, 2.173882, 0.145098, 0, 1, 1,
0.5198095, -0.7549481, 2.10887, 0.1529412, 0, 1, 1,
0.5221797, 1.469137, -0.3530411, 0.1568628, 0, 1, 1,
0.5223173, -0.6519491, 2.138569, 0.1647059, 0, 1, 1,
0.5373717, -0.5397942, 2.197244, 0.1686275, 0, 1, 1,
0.5379722, 0.4568912, 1.984103, 0.1764706, 0, 1, 1,
0.5393167, -0.6616853, 0.8604966, 0.1803922, 0, 1, 1,
0.5429807, -1.467868, 2.71604, 0.1882353, 0, 1, 1,
0.5438843, 1.335001, -0.2087252, 0.1921569, 0, 1, 1,
0.544917, 0.7478176, 0.8387181, 0.2, 0, 1, 1,
0.5483052, -0.07992721, 0.279609, 0.2078431, 0, 1, 1,
0.5610279, -0.4195866, 0.9240562, 0.2117647, 0, 1, 1,
0.5672253, 0.2166521, 0.829097, 0.2196078, 0, 1, 1,
0.5688906, -0.4959065, 2.434804, 0.2235294, 0, 1, 1,
0.5689517, 0.04786006, 1.43051, 0.2313726, 0, 1, 1,
0.5704986, -0.7415423, 2.521837, 0.2352941, 0, 1, 1,
0.5714265, 0.3270753, 1.114707, 0.2431373, 0, 1, 1,
0.5743228, -0.5221289, 1.335433, 0.2470588, 0, 1, 1,
0.5810152, 0.2420945, 2.877114, 0.254902, 0, 1, 1,
0.5816597, 0.8891581, 0.7500328, 0.2588235, 0, 1, 1,
0.5819724, 1.149814, -0.7359269, 0.2666667, 0, 1, 1,
0.5839505, 0.1896028, 1.201383, 0.2705882, 0, 1, 1,
0.584753, 0.1516067, 1.213466, 0.2784314, 0, 1, 1,
0.5860997, -0.4035097, 0.2940398, 0.282353, 0, 1, 1,
0.5885924, 0.6286106, -0.3011287, 0.2901961, 0, 1, 1,
0.5900127, 0.6834341, 2.287479, 0.2941177, 0, 1, 1,
0.5916955, 0.04437898, 2.438998, 0.3019608, 0, 1, 1,
0.5937366, 1.45397, 0.02155272, 0.3098039, 0, 1, 1,
0.6005549, 0.1678282, 2.20052, 0.3137255, 0, 1, 1,
0.6009148, -1.767327, 2.985814, 0.3215686, 0, 1, 1,
0.6010499, 0.38085, 0.2736651, 0.3254902, 0, 1, 1,
0.6079457, -1.271194, 2.45414, 0.3333333, 0, 1, 1,
0.6093113, 0.3615423, 0.4450965, 0.3372549, 0, 1, 1,
0.6127211, -1.196197, 3.257441, 0.345098, 0, 1, 1,
0.6165727, 1.43342, 0.5746624, 0.3490196, 0, 1, 1,
0.618523, 0.01085167, 1.572357, 0.3568628, 0, 1, 1,
0.6197643, -1.114298, 2.650399, 0.3607843, 0, 1, 1,
0.6249158, 0.442041, 0.8457219, 0.3686275, 0, 1, 1,
0.6352592, -0.1418979, 2.922847, 0.372549, 0, 1, 1,
0.6354603, 0.3457504, 1.167017, 0.3803922, 0, 1, 1,
0.6384929, -0.6481333, 0.8935797, 0.3843137, 0, 1, 1,
0.6416703, -0.484712, 2.543928, 0.3921569, 0, 1, 1,
0.6446067, 1.765853, 1.404641, 0.3960784, 0, 1, 1,
0.6448675, 1.245328, 1.450988, 0.4039216, 0, 1, 1,
0.6460483, 2.607602, 0.3862885, 0.4117647, 0, 1, 1,
0.6519856, 1.3659, 0.3436078, 0.4156863, 0, 1, 1,
0.6524024, 1.654326, 0.05043055, 0.4235294, 0, 1, 1,
0.6601095, 0.5004695, 0.6189134, 0.427451, 0, 1, 1,
0.6602953, 1.780247, -0.3254136, 0.4352941, 0, 1, 1,
0.6614658, 0.2349816, 2.037444, 0.4392157, 0, 1, 1,
0.6636422, 1.492127, 1.177218, 0.4470588, 0, 1, 1,
0.6642333, -0.4466587, 2.264151, 0.4509804, 0, 1, 1,
0.6660181, 0.4261631, 1.425177, 0.4588235, 0, 1, 1,
0.6669379, 1.358371, -0.3357565, 0.4627451, 0, 1, 1,
0.6670448, 0.5516912, 1.204728, 0.4705882, 0, 1, 1,
0.6681411, 0.1897419, 1.84466, 0.4745098, 0, 1, 1,
0.6725642, 1.37339, 0.6996403, 0.4823529, 0, 1, 1,
0.676363, -1.191856, 2.386136, 0.4862745, 0, 1, 1,
0.6815717, 0.2379497, 2.130851, 0.4941176, 0, 1, 1,
0.6837292, -0.8100896, 2.003563, 0.5019608, 0, 1, 1,
0.6869307, 0.1478627, 0.7000234, 0.5058824, 0, 1, 1,
0.6873909, -0.02646133, -0.5568693, 0.5137255, 0, 1, 1,
0.6877349, -0.9232923, 1.592006, 0.5176471, 0, 1, 1,
0.6884341, -0.5481654, 0.9476661, 0.5254902, 0, 1, 1,
0.6909686, -0.9521291, 1.156755, 0.5294118, 0, 1, 1,
0.7014585, -1.100526, 4.196373, 0.5372549, 0, 1, 1,
0.7016395, -0.08824489, 1.48704, 0.5411765, 0, 1, 1,
0.7035598, -0.1128963, 2.075642, 0.5490196, 0, 1, 1,
0.7054114, 0.05394758, 2.509289, 0.5529412, 0, 1, 1,
0.7068042, -0.2967417, 0.9899975, 0.5607843, 0, 1, 1,
0.709563, -0.1779117, 1.744352, 0.5647059, 0, 1, 1,
0.7115123, -0.5325339, 2.197474, 0.572549, 0, 1, 1,
0.7186186, 1.552212, 1.30169, 0.5764706, 0, 1, 1,
0.7191404, 0.2469921, 1.077485, 0.5843138, 0, 1, 1,
0.7246673, 0.1502319, 2.024704, 0.5882353, 0, 1, 1,
0.7247915, -0.07073221, 1.484808, 0.5960785, 0, 1, 1,
0.7267165, 0.8972822, -0.4040774, 0.6039216, 0, 1, 1,
0.7289177, 0.4933428, 1.053104, 0.6078432, 0, 1, 1,
0.7324826, 0.8944846, 0.4835179, 0.6156863, 0, 1, 1,
0.7420626, -0.9625055, 1.398757, 0.6196079, 0, 1, 1,
0.745514, 0.5949907, -0.1620078, 0.627451, 0, 1, 1,
0.7475994, 0.279483, 0.3422273, 0.6313726, 0, 1, 1,
0.7485424, 1.213959, -0.493048, 0.6392157, 0, 1, 1,
0.7490999, 0.0363954, 1.26186, 0.6431373, 0, 1, 1,
0.7493426, -0.813363, 3.685367, 0.6509804, 0, 1, 1,
0.7516069, 0.3164364, 1.494642, 0.654902, 0, 1, 1,
0.7616158, 1.079807, 0.6630121, 0.6627451, 0, 1, 1,
0.7622692, 0.5712661, -0.9286349, 0.6666667, 0, 1, 1,
0.7762817, -1.927149, 1.974941, 0.6745098, 0, 1, 1,
0.7770604, 0.368064, 1.397214, 0.6784314, 0, 1, 1,
0.7797732, 0.3768094, 2.272142, 0.6862745, 0, 1, 1,
0.7848964, 2.020896, 0.03018088, 0.6901961, 0, 1, 1,
0.785009, -2.112204, 1.794596, 0.6980392, 0, 1, 1,
0.7879497, -0.8045891, 1.772388, 0.7058824, 0, 1, 1,
0.7923158, -0.5104314, 0.7050883, 0.7098039, 0, 1, 1,
0.7929121, 0.9618137, 1.120413, 0.7176471, 0, 1, 1,
0.8097028, -1.369832, 2.474958, 0.7215686, 0, 1, 1,
0.8105626, -0.5242059, 2.811114, 0.7294118, 0, 1, 1,
0.813113, -0.5686212, 0.7609752, 0.7333333, 0, 1, 1,
0.8165509, -0.4745328, 2.601425, 0.7411765, 0, 1, 1,
0.8200454, -0.4520968, 1.444439, 0.7450981, 0, 1, 1,
0.8224469, 1.37328, 0.07483869, 0.7529412, 0, 1, 1,
0.825407, -1.498042, 4.005683, 0.7568628, 0, 1, 1,
0.8344675, 1.118218, 0.8951604, 0.7647059, 0, 1, 1,
0.8420724, 0.1932339, 1.255436, 0.7686275, 0, 1, 1,
0.845543, -0.3338179, 1.148473, 0.7764706, 0, 1, 1,
0.8547487, 0.05044215, 2.243419, 0.7803922, 0, 1, 1,
0.8549197, 0.6770515, 2.420405, 0.7882353, 0, 1, 1,
0.8549809, -0.1255347, 2.219171, 0.7921569, 0, 1, 1,
0.8554466, 1.645956, 0.9680209, 0.8, 0, 1, 1,
0.8575055, -0.6411721, 3.66026, 0.8078431, 0, 1, 1,
0.8607343, 1.071792, 0.6624042, 0.8117647, 0, 1, 1,
0.8687519, -0.556079, 1.090346, 0.8196079, 0, 1, 1,
0.8784645, -1.480905, 2.247849, 0.8235294, 0, 1, 1,
0.878965, 1.867029, 1.876321, 0.8313726, 0, 1, 1,
0.8834444, -1.440727, 2.066699, 0.8352941, 0, 1, 1,
0.8852111, -2.182173, 3.84513, 0.8431373, 0, 1, 1,
0.8852245, 0.1891887, -0.8844579, 0.8470588, 0, 1, 1,
0.885476, 0.178819, 1.573248, 0.854902, 0, 1, 1,
0.885587, -2.0335, 4.477524, 0.8588235, 0, 1, 1,
0.8856348, 1.053104, -0.9191526, 0.8666667, 0, 1, 1,
0.8873376, -0.02076912, 2.35223, 0.8705882, 0, 1, 1,
0.8875058, -1.212925, 4.22651, 0.8784314, 0, 1, 1,
0.8904643, -0.05003383, 1.153983, 0.8823529, 0, 1, 1,
0.8922041, -0.1174618, 1.255311, 0.8901961, 0, 1, 1,
0.8924816, 0.6177862, -2.18233, 0.8941177, 0, 1, 1,
0.894617, -0.8077896, 2.858649, 0.9019608, 0, 1, 1,
0.896343, -1.051854, 3.620902, 0.9098039, 0, 1, 1,
0.8967926, 0.9136969, 1.863583, 0.9137255, 0, 1, 1,
0.8969725, 0.6140112, 2.675432, 0.9215686, 0, 1, 1,
0.9010601, -0.8087692, 3.049175, 0.9254902, 0, 1, 1,
0.904582, -0.8293621, 2.705381, 0.9333333, 0, 1, 1,
0.9132245, 1.129373, 1.38216, 0.9372549, 0, 1, 1,
0.9143608, -0.6519273, 0.8880268, 0.945098, 0, 1, 1,
0.9159972, 1.688543, -0.2012613, 0.9490196, 0, 1, 1,
0.9171713, 0.5878237, 1.003127, 0.9568627, 0, 1, 1,
0.9180248, 0.2184088, 2.593311, 0.9607843, 0, 1, 1,
0.9237369, 0.2185457, 1.68964, 0.9686275, 0, 1, 1,
0.9263986, 0.7440675, -0.4199848, 0.972549, 0, 1, 1,
0.931859, 0.8647044, 1.016698, 0.9803922, 0, 1, 1,
0.9325639, 1.785175, 0.7792611, 0.9843137, 0, 1, 1,
0.9348466, -0.9286591, 0.3090702, 0.9921569, 0, 1, 1,
0.9362645, -1.045017, 3.648747, 0.9960784, 0, 1, 1,
0.9400534, -1.238589, 2.362542, 1, 0, 0.9960784, 1,
0.9403949, 0.04397667, 1.569674, 1, 0, 0.9882353, 1,
0.9443235, 0.6133948, 0.2424236, 1, 0, 0.9843137, 1,
0.9449834, -0.6019014, 3.526272, 1, 0, 0.9764706, 1,
0.9451337, -2.027789, 1.767136, 1, 0, 0.972549, 1,
0.947555, -2.007166, 2.33997, 1, 0, 0.9647059, 1,
0.9522583, -0.2654255, 0.04646475, 1, 0, 0.9607843, 1,
0.9568974, -1.203308, 1.696261, 1, 0, 0.9529412, 1,
0.9574656, 0.6567205, 1.836035, 1, 0, 0.9490196, 1,
0.9594119, 0.6630894, 3.158713, 1, 0, 0.9411765, 1,
0.9686933, 0.112259, 2.450277, 1, 0, 0.9372549, 1,
0.9779429, 0.4302465, 1.641485, 1, 0, 0.9294118, 1,
0.9949303, 0.4976319, 1.573502, 1, 0, 0.9254902, 1,
1.005726, -0.6708071, 1.61109, 1, 0, 0.9176471, 1,
1.009663, -0.578658, 0.9708217, 1, 0, 0.9137255, 1,
1.010413, 0.6686661, 2.39694, 1, 0, 0.9058824, 1,
1.011358, 0.1554396, 2.798884, 1, 0, 0.9019608, 1,
1.013213, -0.01832478, 2.482132, 1, 0, 0.8941177, 1,
1.016181, 1.333276, 0.5227379, 1, 0, 0.8862745, 1,
1.020873, -0.2080064, 1.145155, 1, 0, 0.8823529, 1,
1.021678, 0.06991063, 0.8387104, 1, 0, 0.8745098, 1,
1.026008, 1.979001, -0.2214839, 1, 0, 0.8705882, 1,
1.026179, 0.4695399, 1.363691, 1, 0, 0.8627451, 1,
1.026297, 0.3728332, 0.7004613, 1, 0, 0.8588235, 1,
1.02679, -1.112935, 3.887476, 1, 0, 0.8509804, 1,
1.029013, 1.687192, -0.2442753, 1, 0, 0.8470588, 1,
1.054954, 0.5923377, 1.402765, 1, 0, 0.8392157, 1,
1.055354, -0.6906497, 2.718411, 1, 0, 0.8352941, 1,
1.073118, 1.011476, 0.004557192, 1, 0, 0.827451, 1,
1.076354, 0.589056, 0.8566619, 1, 0, 0.8235294, 1,
1.079544, 1.242414, 0.07669931, 1, 0, 0.8156863, 1,
1.097642, 1.034719, 2.467909, 1, 0, 0.8117647, 1,
1.101569, -2.188566, 4.038006, 1, 0, 0.8039216, 1,
1.10786, 0.6156012, 0.971053, 1, 0, 0.7960784, 1,
1.111713, -0.7979073, 1.942378, 1, 0, 0.7921569, 1,
1.115134, 0.04441597, 0.5785464, 1, 0, 0.7843137, 1,
1.115272, -0.853616, 2.101515, 1, 0, 0.7803922, 1,
1.126823, -0.4260822, 1.496989, 1, 0, 0.772549, 1,
1.130128, 0.144234, 0.8478128, 1, 0, 0.7686275, 1,
1.131522, -1.05452, 3.559565, 1, 0, 0.7607843, 1,
1.134453, -0.2219867, 2.822981, 1, 0, 0.7568628, 1,
1.142485, -1.514206, 2.429366, 1, 0, 0.7490196, 1,
1.151153, -0.3364753, 0.1544938, 1, 0, 0.7450981, 1,
1.156358, 0.4335194, 1.242812, 1, 0, 0.7372549, 1,
1.159737, -0.1229493, 1.735594, 1, 0, 0.7333333, 1,
1.159806, -0.4482591, 1.014883, 1, 0, 0.7254902, 1,
1.162122, 0.2962461, 1.530911, 1, 0, 0.7215686, 1,
1.164409, -1.176791, 2.300903, 1, 0, 0.7137255, 1,
1.168085, -1.083981, 3.581329, 1, 0, 0.7098039, 1,
1.170727, 1.85648, 1.356239, 1, 0, 0.7019608, 1,
1.183546, 0.1073162, 1.356688, 1, 0, 0.6941177, 1,
1.189836, 1.873134, 1.150049, 1, 0, 0.6901961, 1,
1.190285, 0.7797813, 1.100587, 1, 0, 0.682353, 1,
1.200426, -0.3132986, 2.889381, 1, 0, 0.6784314, 1,
1.212296, 0.282509, 0.7576115, 1, 0, 0.6705883, 1,
1.213726, 1.784774, 0.2902655, 1, 0, 0.6666667, 1,
1.22053, -1.719151, 2.936338, 1, 0, 0.6588235, 1,
1.225284, 1.244561, 0.3297597, 1, 0, 0.654902, 1,
1.234351, 0.1624855, 2.752069, 1, 0, 0.6470588, 1,
1.237031, 1.372376, 1.233861, 1, 0, 0.6431373, 1,
1.242803, 1.258214, 0.2322806, 1, 0, 0.6352941, 1,
1.255607, 0.7600232, 1.463523, 1, 0, 0.6313726, 1,
1.255717, -0.3184719, 0.7466305, 1, 0, 0.6235294, 1,
1.256555, 0.06007924, 0.3192717, 1, 0, 0.6196079, 1,
1.259585, 1.209683, 0.03540435, 1, 0, 0.6117647, 1,
1.275067, -0.4608506, 4.429209, 1, 0, 0.6078432, 1,
1.278903, 1.389032, 2.020311, 1, 0, 0.6, 1,
1.291192, -0.2817103, 2.414927, 1, 0, 0.5921569, 1,
1.294388, 2.095892, 2.012661, 1, 0, 0.5882353, 1,
1.297111, -2.073427, 1.207301, 1, 0, 0.5803922, 1,
1.303323, 0.8729958, 2.468843, 1, 0, 0.5764706, 1,
1.305167, 0.1928301, 0.6468199, 1, 0, 0.5686275, 1,
1.312776, 0.4067737, 0.4630632, 1, 0, 0.5647059, 1,
1.318256, 1.136619, 2.245368, 1, 0, 0.5568628, 1,
1.324762, 0.1420833, 0.9744489, 1, 0, 0.5529412, 1,
1.326087, -0.2407524, 2.752542, 1, 0, 0.5450981, 1,
1.326773, -0.475828, 1.428593, 1, 0, 0.5411765, 1,
1.335484, 0.3211984, 1.596277, 1, 0, 0.5333334, 1,
1.336303, -2.464605, 4.184323, 1, 0, 0.5294118, 1,
1.339914, -1.36824, 2.238428, 1, 0, 0.5215687, 1,
1.346705, 0.8217399, 2.698079, 1, 0, 0.5176471, 1,
1.347358, -0.1270009, 0.02294975, 1, 0, 0.509804, 1,
1.349129, -0.339833, 2.086601, 1, 0, 0.5058824, 1,
1.352431, 0.7799861, 1.007299, 1, 0, 0.4980392, 1,
1.353686, -0.2971258, 1.049692, 1, 0, 0.4901961, 1,
1.356955, 0.2961422, 1.629933, 1, 0, 0.4862745, 1,
1.361772, 0.577135, 1.224894, 1, 0, 0.4784314, 1,
1.361902, -0.8295336, 1.515055, 1, 0, 0.4745098, 1,
1.365404, 0.1558899, 0.9736432, 1, 0, 0.4666667, 1,
1.366999, -0.9135036, 2.635357, 1, 0, 0.4627451, 1,
1.384942, 1.429846, 1.667957, 1, 0, 0.454902, 1,
1.385998, 0.4514555, 2.006308, 1, 0, 0.4509804, 1,
1.408528, 0.02857682, -0.09078953, 1, 0, 0.4431373, 1,
1.410057, 1.854825, -0.01415941, 1, 0, 0.4392157, 1,
1.419097, 0.3290667, 2.447911, 1, 0, 0.4313726, 1,
1.423116, -0.3797618, 0.6390947, 1, 0, 0.427451, 1,
1.43382, 0.7135728, 1.480239, 1, 0, 0.4196078, 1,
1.450981, 0.001378226, 1.1731, 1, 0, 0.4156863, 1,
1.45462, 0.7852743, 0.8493957, 1, 0, 0.4078431, 1,
1.455102, -2.108008, 1.327376, 1, 0, 0.4039216, 1,
1.459118, -0.03826614, 2.757168, 1, 0, 0.3960784, 1,
1.464214, 0.01539156, 2.679294, 1, 0, 0.3882353, 1,
1.477916, 0.01183705, 3.180173, 1, 0, 0.3843137, 1,
1.494344, -1.936659, 2.121711, 1, 0, 0.3764706, 1,
1.51837, 1.349608, 0.6561239, 1, 0, 0.372549, 1,
1.523884, -0.09496372, 2.254349, 1, 0, 0.3647059, 1,
1.526081, 0.6336948, 1.780614, 1, 0, 0.3607843, 1,
1.528493, 1.285189, 2.054657, 1, 0, 0.3529412, 1,
1.533693, -0.2086998, 3.019771, 1, 0, 0.3490196, 1,
1.567963, 0.2910968, 2.42676, 1, 0, 0.3411765, 1,
1.630155, 0.3143595, 1.384997, 1, 0, 0.3372549, 1,
1.637911, 2.508213, 2.581873, 1, 0, 0.3294118, 1,
1.648133, -0.3297599, 2.069853, 1, 0, 0.3254902, 1,
1.670975, -0.2008488, 1.90258, 1, 0, 0.3176471, 1,
1.673179, 0.3121, 0.9287937, 1, 0, 0.3137255, 1,
1.6886, -1.76792, 2.69212, 1, 0, 0.3058824, 1,
1.69333, -2.330728, 2.636033, 1, 0, 0.2980392, 1,
1.696781, 0.2559565, 1.918281, 1, 0, 0.2941177, 1,
1.70457, 0.1282804, 1.73221, 1, 0, 0.2862745, 1,
1.712885, -0.9046646, 1.348182, 1, 0, 0.282353, 1,
1.713636, 0.1775152, 1.743742, 1, 0, 0.2745098, 1,
1.732059, 0.458068, 0.5691608, 1, 0, 0.2705882, 1,
1.738158, 0.2548423, 1.420452, 1, 0, 0.2627451, 1,
1.753665, 1.960643, 2.041008, 1, 0, 0.2588235, 1,
1.774307, 0.6647487, 1.231218, 1, 0, 0.2509804, 1,
1.794945, -0.4859095, 0.04538884, 1, 0, 0.2470588, 1,
1.817861, 0.6176987, 1.204965, 1, 0, 0.2392157, 1,
1.828647, -1.423381, 1.56702, 1, 0, 0.2352941, 1,
1.828859, 1.863454, 2.132045, 1, 0, 0.227451, 1,
1.843755, 1.265325, 1.617235, 1, 0, 0.2235294, 1,
1.88071, -0.8731925, 2.09915, 1, 0, 0.2156863, 1,
1.894849, 1.508544, 1.206747, 1, 0, 0.2117647, 1,
1.904142, 0.2558909, 1.382398, 1, 0, 0.2039216, 1,
1.909608, 1.379869, 1.93506, 1, 0, 0.1960784, 1,
1.92707, -0.08079275, 1.034777, 1, 0, 0.1921569, 1,
1.956605, -0.1405553, 2.704469, 1, 0, 0.1843137, 1,
1.960099, 0.560858, 1.663845, 1, 0, 0.1803922, 1,
1.997475, 1.267713, 0.3910769, 1, 0, 0.172549, 1,
2.003453, 0.8122627, -0.09866055, 1, 0, 0.1686275, 1,
2.011162, -1.003209, 0.377099, 1, 0, 0.1607843, 1,
2.013603, 0.6195291, 0.9099488, 1, 0, 0.1568628, 1,
2.018836, -1.273429, 1.072245, 1, 0, 0.1490196, 1,
2.024273, 1.226074, 1.941808, 1, 0, 0.145098, 1,
2.075617, -2.04435, 0.8432255, 1, 0, 0.1372549, 1,
2.1062, -0.6944423, 2.085994, 1, 0, 0.1333333, 1,
2.127172, -0.4402446, 2.169768, 1, 0, 0.1254902, 1,
2.142531, -0.2482571, 1.166465, 1, 0, 0.1215686, 1,
2.143899, -0.0976356, 2.103441, 1, 0, 0.1137255, 1,
2.156764, 0.9580722, 2.560159, 1, 0, 0.1098039, 1,
2.209697, -0.2478033, 0.5193439, 1, 0, 0.1019608, 1,
2.265402, 1.449807, 0.5340163, 1, 0, 0.09411765, 1,
2.271893, -0.3260312, 1.321474, 1, 0, 0.09019608, 1,
2.288035, -0.06392774, 3.40683, 1, 0, 0.08235294, 1,
2.317647, -1.402972, 2.518192, 1, 0, 0.07843138, 1,
2.338326, -0.2325314, 3.085753, 1, 0, 0.07058824, 1,
2.340267, -0.9391558, 1.164465, 1, 0, 0.06666667, 1,
2.346617, -0.2011288, 1.778741, 1, 0, 0.05882353, 1,
2.346863, -2.160006, 2.978634, 1, 0, 0.05490196, 1,
2.363419, -0.6653546, 2.747069, 1, 0, 0.04705882, 1,
2.428942, 0.2127706, 2.666442, 1, 0, 0.04313726, 1,
2.440643, 1.653794, 0.2770177, 1, 0, 0.03529412, 1,
2.441141, -2.152059, 1.497884, 1, 0, 0.03137255, 1,
2.458947, 0.895272, -0.5278318, 1, 0, 0.02352941, 1,
2.988061, 0.7655213, 1.116823, 1, 0, 0.01960784, 1,
3.019498, -0.3808697, 0.1031981, 1, 0, 0.01176471, 1,
3.107173, 2.005805, 0.6953499, 1, 0, 0.007843138, 1
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
-0.04614627, -3.409067, -7.244152, 0, -0.5, 0.5, 0.5,
-0.04614627, -3.409067, -7.244152, 1, -0.5, 0.5, 0.5,
-0.04614627, -3.409067, -7.244152, 1, 1.5, 0.5, 0.5,
-0.04614627, -3.409067, -7.244152, 0, 1.5, 0.5, 0.5
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
-4.268441, 0.3214198, -7.244152, 0, -0.5, 0.5, 0.5,
-4.268441, 0.3214198, -7.244152, 1, -0.5, 0.5, 0.5,
-4.268441, 0.3214198, -7.244152, 1, 1.5, 0.5, 0.5,
-4.268441, 0.3214198, -7.244152, 0, 1.5, 0.5, 0.5
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
-4.268441, -3.409067, 0.07968664, 0, -0.5, 0.5, 0.5,
-4.268441, -3.409067, 0.07968664, 1, -0.5, 0.5, 0.5,
-4.268441, -3.409067, 0.07968664, 1, 1.5, 0.5, 0.5,
-4.268441, -3.409067, 0.07968664, 0, 1.5, 0.5, 0.5
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
-3, -2.548185, -5.554036,
3, -2.548185, -5.554036,
-3, -2.548185, -5.554036,
-3, -2.691666, -5.835721,
-2, -2.548185, -5.554036,
-2, -2.691666, -5.835721,
-1, -2.548185, -5.554036,
-1, -2.691666, -5.835721,
0, -2.548185, -5.554036,
0, -2.691666, -5.835721,
1, -2.548185, -5.554036,
1, -2.691666, -5.835721,
2, -2.548185, -5.554036,
2, -2.691666, -5.835721,
3, -2.548185, -5.554036,
3, -2.691666, -5.835721
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
-3, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
-3, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
-3, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
-3, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
-2, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
-2, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
-2, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
-2, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
-1, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
-1, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
-1, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
-1, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
0, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
0, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
0, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
0, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
1, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
1, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
1, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
1, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
2, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
2, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
2, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
2, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5,
3, -2.978626, -6.399094, 0, -0.5, 0.5, 0.5,
3, -2.978626, -6.399094, 1, -0.5, 0.5, 0.5,
3, -2.978626, -6.399094, 1, 1.5, 0.5, 0.5,
3, -2.978626, -6.399094, 0, 1.5, 0.5, 0.5
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
-3.294065, -2, -5.554036,
-3.294065, 3, -5.554036,
-3.294065, -2, -5.554036,
-3.456461, -2, -5.835721,
-3.294065, -1, -5.554036,
-3.456461, -1, -5.835721,
-3.294065, 0, -5.554036,
-3.456461, 0, -5.835721,
-3.294065, 1, -5.554036,
-3.456461, 1, -5.835721,
-3.294065, 2, -5.554036,
-3.456461, 2, -5.835721,
-3.294065, 3, -5.554036,
-3.456461, 3, -5.835721
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
-3.781254, -2, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, -2, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, -2, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, -2, -6.399094, 0, 1.5, 0.5, 0.5,
-3.781254, -1, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, -1, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, -1, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, -1, -6.399094, 0, 1.5, 0.5, 0.5,
-3.781254, 0, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, 0, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, 0, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, 0, -6.399094, 0, 1.5, 0.5, 0.5,
-3.781254, 1, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, 1, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, 1, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, 1, -6.399094, 0, 1.5, 0.5, 0.5,
-3.781254, 2, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, 2, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, 2, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, 2, -6.399094, 0, 1.5, 0.5, 0.5,
-3.781254, 3, -6.399094, 0, -0.5, 0.5, 0.5,
-3.781254, 3, -6.399094, 1, -0.5, 0.5, 0.5,
-3.781254, 3, -6.399094, 1, 1.5, 0.5, 0.5,
-3.781254, 3, -6.399094, 0, 1.5, 0.5, 0.5
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
-3.294065, -2.548185, -4,
-3.294065, -2.548185, 4,
-3.294065, -2.548185, -4,
-3.456461, -2.691666, -4,
-3.294065, -2.548185, -2,
-3.456461, -2.691666, -2,
-3.294065, -2.548185, 0,
-3.456461, -2.691666, 0,
-3.294065, -2.548185, 2,
-3.456461, -2.691666, 2,
-3.294065, -2.548185, 4,
-3.456461, -2.691666, 4
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
-3.781254, -2.978626, -4, 0, -0.5, 0.5, 0.5,
-3.781254, -2.978626, -4, 1, -0.5, 0.5, 0.5,
-3.781254, -2.978626, -4, 1, 1.5, 0.5, 0.5,
-3.781254, -2.978626, -4, 0, 1.5, 0.5, 0.5,
-3.781254, -2.978626, -2, 0, -0.5, 0.5, 0.5,
-3.781254, -2.978626, -2, 1, -0.5, 0.5, 0.5,
-3.781254, -2.978626, -2, 1, 1.5, 0.5, 0.5,
-3.781254, -2.978626, -2, 0, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 0, 0, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 0, 1, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 0, 1, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 0, 0, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 2, 0, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 2, 1, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 2, 1, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 2, 0, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 4, 0, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 4, 1, -0.5, 0.5, 0.5,
-3.781254, -2.978626, 4, 1, 1.5, 0.5, 0.5,
-3.781254, -2.978626, 4, 0, 1.5, 0.5, 0.5
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
-3.294065, -2.548185, -5.554036,
-3.294065, 3.191025, -5.554036,
-3.294065, -2.548185, 5.713409,
-3.294065, 3.191025, 5.713409,
-3.294065, -2.548185, -5.554036,
-3.294065, -2.548185, 5.713409,
-3.294065, 3.191025, -5.554036,
-3.294065, 3.191025, 5.713409,
-3.294065, -2.548185, -5.554036,
3.201773, -2.548185, -5.554036,
-3.294065, -2.548185, 5.713409,
3.201773, -2.548185, 5.713409,
-3.294065, 3.191025, -5.554036,
3.201773, 3.191025, -5.554036,
-3.294065, 3.191025, 5.713409,
3.201773, 3.191025, 5.713409,
3.201773, -2.548185, -5.554036,
3.201773, 3.191025, -5.554036,
3.201773, -2.548185, 5.713409,
3.201773, 3.191025, 5.713409,
3.201773, -2.548185, -5.554036,
3.201773, -2.548185, 5.713409,
3.201773, 3.191025, -5.554036,
3.201773, 3.191025, 5.713409
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
var radius = 7.590976;
var distance = 33.77311;
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
mvMatrix.translate( 0.04614627, -0.3214198, -0.07968664 );
mvMatrix.scale( 1.263503, 1.430077, 0.7284271 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77311);
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
oxalate<-read.table("oxalate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxalate$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
```

```r
y<-oxalate$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
```

```r
z<-oxalate$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxalate' not found
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
-3.199466, 0.7125533, -1.127409, 0, 0, 1, 1, 1,
-2.971136, -1.662361, -1.581031, 1, 0, 0, 1, 1,
-2.714535, 1.121034, 0.04660613, 1, 0, 0, 1, 1,
-2.56388, 0.106052, -2.268261, 1, 0, 0, 1, 1,
-2.49158, 0.09425236, -2.1891, 1, 0, 0, 1, 1,
-2.465462, 0.7091665, -4.152008, 1, 0, 0, 1, 1,
-2.430697, 0.6847975, -2.479633, 0, 0, 0, 1, 1,
-2.423007, 0.1369059, -0.7695757, 0, 0, 0, 1, 1,
-2.387894, 1.188092, -0.2938558, 0, 0, 0, 1, 1,
-2.365062, 0.7602993, -1.522501, 0, 0, 0, 1, 1,
-2.340431, 1.056321, -2.83004, 0, 0, 0, 1, 1,
-2.272481, 0.3037042, -1.771783, 0, 0, 0, 1, 1,
-2.251164, 1.290859, -1.312764, 0, 0, 0, 1, 1,
-2.243267, 0.243581, -2.97075, 1, 1, 1, 1, 1,
-2.238194, -0.3612683, -0.296206, 1, 1, 1, 1, 1,
-2.205759, 1.260623, 0.1056776, 1, 1, 1, 1, 1,
-2.166985, -1.380014, -2.400983, 1, 1, 1, 1, 1,
-2.152029, -0.3024574, -1.008032, 1, 1, 1, 1, 1,
-2.136332, 1.087673, -0.1617141, 1, 1, 1, 1, 1,
-2.128312, 0.7407416, -0.9955195, 1, 1, 1, 1, 1,
-2.114036, 0.113204, -2.013167, 1, 1, 1, 1, 1,
-2.07948, -1.424424, -2.521582, 1, 1, 1, 1, 1,
-2.043632, 1.110507, -1.787604, 1, 1, 1, 1, 1,
-2.025749, -1.229784, -1.042106, 1, 1, 1, 1, 1,
-1.996315, 0.50249, -2.248713, 1, 1, 1, 1, 1,
-1.990608, -0.4097031, -1.603279, 1, 1, 1, 1, 1,
-1.972609, 0.552565, 0.3644904, 1, 1, 1, 1, 1,
-1.971014, -0.4165908, -2.252115, 1, 1, 1, 1, 1,
-1.955091, 1.264193, -0.5692328, 0, 0, 1, 1, 1,
-1.949414, -1.843927, -1.436161, 1, 0, 0, 1, 1,
-1.938608, -0.1096148, 0.2185212, 1, 0, 0, 1, 1,
-1.936705, 1.484557, -0.4457429, 1, 0, 0, 1, 1,
-1.933425, -1.283883, -3.502794, 1, 0, 0, 1, 1,
-1.926395, 0.856774, -1.018275, 1, 0, 0, 1, 1,
-1.918699, 0.2933442, -0.5088575, 0, 0, 0, 1, 1,
-1.913027, -0.2234652, -1.151597, 0, 0, 0, 1, 1,
-1.896833, 1.29467, -1.720903, 0, 0, 0, 1, 1,
-1.852489, 0.02472584, -1.647171, 0, 0, 0, 1, 1,
-1.842121, -0.8189212, -1.430781, 0, 0, 0, 1, 1,
-1.840803, 0.656191, -1.614625, 0, 0, 0, 1, 1,
-1.824909, -0.5207605, -2.217073, 0, 0, 0, 1, 1,
-1.809178, 1.763654, -1.876622, 1, 1, 1, 1, 1,
-1.782116, -1.436943, -2.290273, 1, 1, 1, 1, 1,
-1.750325, 0.8973634, -1.742865, 1, 1, 1, 1, 1,
-1.727019, 1.504942, 0.6034248, 1, 1, 1, 1, 1,
-1.725657, 0.3765925, -0.3020688, 1, 1, 1, 1, 1,
-1.719096, 1.180715, 1.37337, 1, 1, 1, 1, 1,
-1.70378, -0.420422, -0.07512028, 1, 1, 1, 1, 1,
-1.675466, 0.8427134, -1.680488, 1, 1, 1, 1, 1,
-1.673504, 1.431905, 1.050465, 1, 1, 1, 1, 1,
-1.671367, 1.365287, -2.213176, 1, 1, 1, 1, 1,
-1.639867, -1.057214, -0.7823889, 1, 1, 1, 1, 1,
-1.623904, -0.7412673, -1.736605, 1, 1, 1, 1, 1,
-1.606385, -0.1930611, -1.720465, 1, 1, 1, 1, 1,
-1.599661, -0.01078724, -3.248448, 1, 1, 1, 1, 1,
-1.587033, 1.800261, -0.8556493, 1, 1, 1, 1, 1,
-1.583708, -1.419348, -2.075252, 0, 0, 1, 1, 1,
-1.579628, 1.312747, -1.294329, 1, 0, 0, 1, 1,
-1.570251, 1.215504, -0.5034806, 1, 0, 0, 1, 1,
-1.56655, -0.3433833, -2.154659, 1, 0, 0, 1, 1,
-1.547706, -0.1198951, -2.652881, 1, 0, 0, 1, 1,
-1.545038, -1.768025, -0.6035374, 1, 0, 0, 1, 1,
-1.533652, 0.1031807, -0.3680254, 0, 0, 0, 1, 1,
-1.529995, -0.6410931, -2.424224, 0, 0, 0, 1, 1,
-1.5185, 0.2006194, 0.6027011, 0, 0, 0, 1, 1,
-1.512525, -0.2727017, -0.3285491, 0, 0, 0, 1, 1,
-1.512163, -1.105939, -3.651304, 0, 0, 0, 1, 1,
-1.504803, 1.110191, -0.8735359, 0, 0, 0, 1, 1,
-1.50056, 0.2865115, -2.214247, 0, 0, 0, 1, 1,
-1.490622, 0.1606294, -0.6622587, 1, 1, 1, 1, 1,
-1.485323, 0.1746524, -0.1551063, 1, 1, 1, 1, 1,
-1.481852, -0.1255031, 0.4271037, 1, 1, 1, 1, 1,
-1.479369, 0.242093, 0.3649597, 1, 1, 1, 1, 1,
-1.475063, 2.43206, -0.5300531, 1, 1, 1, 1, 1,
-1.474977, -0.3929103, -0.2711658, 1, 1, 1, 1, 1,
-1.473837, -0.4943878, -3.492988, 1, 1, 1, 1, 1,
-1.423301, 1.056727, -1.841148, 1, 1, 1, 1, 1,
-1.422562, -0.1542953, -0.9381709, 1, 1, 1, 1, 1,
-1.41783, 2.016212, -0.7204782, 1, 1, 1, 1, 1,
-1.410046, -2.211441, -1.706322, 1, 1, 1, 1, 1,
-1.401859, 0.7948033, -1.11111, 1, 1, 1, 1, 1,
-1.387878, 0.5595201, -0.9923672, 1, 1, 1, 1, 1,
-1.3866, -0.295516, -2.598934, 1, 1, 1, 1, 1,
-1.382639, 0.8096413, -1.314046, 1, 1, 1, 1, 1,
-1.379196, -0.2799332, -1.567678, 0, 0, 1, 1, 1,
-1.371153, -0.6685258, -1.960771, 1, 0, 0, 1, 1,
-1.369196, 2.314128, -1.847926, 1, 0, 0, 1, 1,
-1.331317, -1.693264, -2.57141, 1, 0, 0, 1, 1,
-1.325347, -0.0001956795, -1.276131, 1, 0, 0, 1, 1,
-1.319914, 2.464062, -0.4584835, 1, 0, 0, 1, 1,
-1.31976, 0.958046, -0.3085707, 0, 0, 0, 1, 1,
-1.314306, 1.464269, -0.6583352, 0, 0, 0, 1, 1,
-1.312845, -0.3343588, -0.5723392, 0, 0, 0, 1, 1,
-1.305497, -0.1112446, -2.259696, 0, 0, 0, 1, 1,
-1.296819, -1.221212, -3.528559, 0, 0, 0, 1, 1,
-1.277703, -1.431775, -3.358763, 0, 0, 0, 1, 1,
-1.262268, 0.5619167, -2.73032, 0, 0, 0, 1, 1,
-1.260288, 1.119616, -0.4430228, 1, 1, 1, 1, 1,
-1.257992, -1.136633, -2.818036, 1, 1, 1, 1, 1,
-1.250253, 0.7565439, -1.741681, 1, 1, 1, 1, 1,
-1.244341, 1.500428, -3.166614, 1, 1, 1, 1, 1,
-1.240901, -0.7665871, -2.104704, 1, 1, 1, 1, 1,
-1.240577, -0.6893477, -1.870022, 1, 1, 1, 1, 1,
-1.240367, -0.08715216, -1.157609, 1, 1, 1, 1, 1,
-1.223535, 0.6852488, -1.633894, 1, 1, 1, 1, 1,
-1.222737, -0.3275591, -3.466009, 1, 1, 1, 1, 1,
-1.217725, 2.205403, -0.1301685, 1, 1, 1, 1, 1,
-1.21422, -0.3426851, -2.427981, 1, 1, 1, 1, 1,
-1.211313, -0.9177975, -1.987438, 1, 1, 1, 1, 1,
-1.209963, 0.8638374, -2.889378, 1, 1, 1, 1, 1,
-1.209575, 0.3182047, -1.942781, 1, 1, 1, 1, 1,
-1.205913, -0.3757172, -2.81453, 1, 1, 1, 1, 1,
-1.205256, -1.26957, -1.393736, 0, 0, 1, 1, 1,
-1.201864, -0.461143, -2.221184, 1, 0, 0, 1, 1,
-1.200462, -0.2000523, -2.400834, 1, 0, 0, 1, 1,
-1.193456, -1.359685, -2.525974, 1, 0, 0, 1, 1,
-1.192502, -0.1293712, -1.347269, 1, 0, 0, 1, 1,
-1.190494, -1.284807, -2.212672, 1, 0, 0, 1, 1,
-1.182972, -0.7859117, -2.877688, 0, 0, 0, 1, 1,
-1.176774, -0.5535566, 0.09442504, 0, 0, 0, 1, 1,
-1.164306, -0.535406, -2.859418, 0, 0, 0, 1, 1,
-1.154546, -0.326368, -2.411777, 0, 0, 0, 1, 1,
-1.151268, -1.623885, -3.527339, 0, 0, 0, 1, 1,
-1.140202, 1.692223, -1.462205, 0, 0, 0, 1, 1,
-1.131611, -0.1787755, -1.352155, 0, 0, 0, 1, 1,
-1.113583, 2.264633, -0.9388543, 1, 1, 1, 1, 1,
-1.105752, 1.777196, 1.609152, 1, 1, 1, 1, 1,
-1.104123, 0.435836, 0.4277761, 1, 1, 1, 1, 1,
-1.100253, -0.3087706, -2.130063, 1, 1, 1, 1, 1,
-1.0961, 1.586778, -0.5557706, 1, 1, 1, 1, 1,
-1.094624, 0.5840835, -2.248674, 1, 1, 1, 1, 1,
-1.093768, -1.211149, -1.781507, 1, 1, 1, 1, 1,
-1.083931, -0.7178849, -2.543313, 1, 1, 1, 1, 1,
-1.082397, -1.46362, -2.487419, 1, 1, 1, 1, 1,
-1.071311, 0.412103, -1.013143, 1, 1, 1, 1, 1,
-1.059407, 0.2386442, -1.052872, 1, 1, 1, 1, 1,
-1.056604, 1.389352, -1.852891, 1, 1, 1, 1, 1,
-1.055382, -0.1364574, -2.883618, 1, 1, 1, 1, 1,
-1.053159, -0.956919, -2.44518, 1, 1, 1, 1, 1,
-1.05085, -0.3566302, -1.785455, 1, 1, 1, 1, 1,
-1.033505, 1.253905, -0.4613481, 0, 0, 1, 1, 1,
-1.031307, 2.010468, -2.762223, 1, 0, 0, 1, 1,
-1.03015, 1.303567, -1.601287, 1, 0, 0, 1, 1,
-1.024338, -1.300246, -2.316101, 1, 0, 0, 1, 1,
-1.020491, -0.9577382, -1.724233, 1, 0, 0, 1, 1,
-1.013502, 1.619238, -0.003915979, 1, 0, 0, 1, 1,
-1.00044, -0.509051, -1.243437, 0, 0, 0, 1, 1,
-1.000016, -1.154873, -3.979304, 0, 0, 0, 1, 1,
-0.9964743, 0.08800427, -2.18533, 0, 0, 0, 1, 1,
-0.99059, -0.2392671, -2.796754, 0, 0, 0, 1, 1,
-0.9868335, 0.07269096, -1.327, 0, 0, 0, 1, 1,
-0.9808741, 1.819733, -0.3608419, 0, 0, 0, 1, 1,
-0.978724, -0.4135073, -1.690151, 0, 0, 0, 1, 1,
-0.9655016, 0.2673234, -1.296321, 1, 1, 1, 1, 1,
-0.9610389, 0.04721703, -1.707094, 1, 1, 1, 1, 1,
-0.9499848, 0.3115672, -0.9395989, 1, 1, 1, 1, 1,
-0.9479423, -1.009537, -3.414463, 1, 1, 1, 1, 1,
-0.9388413, -0.7595335, -2.160728, 1, 1, 1, 1, 1,
-0.9323218, 0.5561435, -0.3970686, 1, 1, 1, 1, 1,
-0.9265962, 1.098498, -2.296995, 1, 1, 1, 1, 1,
-0.9262651, -0.2426245, -2.056836, 1, 1, 1, 1, 1,
-0.9239783, 0.3550074, -1.847489, 1, 1, 1, 1, 1,
-0.9194452, 0.2471702, -1.761921, 1, 1, 1, 1, 1,
-0.9190177, 0.2165155, -1.732967, 1, 1, 1, 1, 1,
-0.9160312, -0.2967186, -1.723453, 1, 1, 1, 1, 1,
-0.9145696, 2.538209, -2.007605, 1, 1, 1, 1, 1,
-0.910302, -0.4375224, -2.616315, 1, 1, 1, 1, 1,
-0.9035195, -2.213252, -1.877126, 1, 1, 1, 1, 1,
-0.8994227, 0.9917687, -2.194364, 0, 0, 1, 1, 1,
-0.8990667, -0.5147375, -0.8113337, 1, 0, 0, 1, 1,
-0.8980767, -0.4715271, -3.000945, 1, 0, 0, 1, 1,
-0.8897936, -0.02041919, -1.710582, 1, 0, 0, 1, 1,
-0.8895253, 0.4299521, -1.199743, 1, 0, 0, 1, 1,
-0.8866429, -0.097792, -2.28055, 1, 0, 0, 1, 1,
-0.8828148, 1.022116, -0.8433481, 0, 0, 0, 1, 1,
-0.8768811, -1.237666, -2.572581, 0, 0, 0, 1, 1,
-0.8744341, -0.5571731, -2.207087, 0, 0, 0, 1, 1,
-0.8635324, 1.442882, 1.539988, 0, 0, 0, 1, 1,
-0.8617646, -0.1376303, -3.154406, 0, 0, 0, 1, 1,
-0.8550878, -1.652555, -2.254628, 0, 0, 0, 1, 1,
-0.8550479, 1.293755, 0.45926, 0, 0, 0, 1, 1,
-0.8430784, -0.1623242, -2.911081, 1, 1, 1, 1, 1,
-0.8373048, 0.4017223, -2.653403, 1, 1, 1, 1, 1,
-0.8327878, 1.724312, -1.95477, 1, 1, 1, 1, 1,
-0.8327382, 0.1399644, -0.968653, 1, 1, 1, 1, 1,
-0.8290351, -1.00437, -2.309777, 1, 1, 1, 1, 1,
-0.8281509, 0.7609599, -2.27843, 1, 1, 1, 1, 1,
-0.8270103, -1.409142, -2.73397, 1, 1, 1, 1, 1,
-0.8262805, -1.347128, -2.511405, 1, 1, 1, 1, 1,
-0.8261312, -1.888029, -3.58945, 1, 1, 1, 1, 1,
-0.8211288, -0.3741458, -1.197063, 1, 1, 1, 1, 1,
-0.8163918, 0.335081, 0.1787781, 1, 1, 1, 1, 1,
-0.8123817, -0.3939828, -0.8436867, 1, 1, 1, 1, 1,
-0.8108995, 1.493655, -1.789821, 1, 1, 1, 1, 1,
-0.8087019, 1.824454, 0.0686881, 1, 1, 1, 1, 1,
-0.8085732, 0.3610598, -0.9932331, 1, 1, 1, 1, 1,
-0.8083662, 0.3486529, -1.006729, 0, 0, 1, 1, 1,
-0.8065266, 1.236385, 0.6018808, 1, 0, 0, 1, 1,
-0.8056268, -0.257939, -3.671193, 1, 0, 0, 1, 1,
-0.8010389, -1.871621, -3.025047, 1, 0, 0, 1, 1,
-0.7984295, 1.773919, 0.1935572, 1, 0, 0, 1, 1,
-0.7920017, 0.6132643, -1.237756, 1, 0, 0, 1, 1,
-0.7908034, -0.5445806, -3.611062, 0, 0, 0, 1, 1,
-0.7884061, -1.248733, -2.569448, 0, 0, 0, 1, 1,
-0.7808696, -0.1943141, -0.8777649, 0, 0, 0, 1, 1,
-0.7779015, -1.001614, -3.604126, 0, 0, 0, 1, 1,
-0.7741179, 1.014721, -2.119035, 0, 0, 0, 1, 1,
-0.772068, 0.6246271, 0.2628425, 0, 0, 0, 1, 1,
-0.7659339, 0.03596505, 0.06096148, 0, 0, 0, 1, 1,
-0.7570366, -0.5584319, -1.419952, 1, 1, 1, 1, 1,
-0.756395, -0.8884748, -2.930618, 1, 1, 1, 1, 1,
-0.7552469, -0.4291001, -2.92896, 1, 1, 1, 1, 1,
-0.7529169, 0.4284029, -0.2578955, 1, 1, 1, 1, 1,
-0.7506524, -0.8544908, -1.877309, 1, 1, 1, 1, 1,
-0.7390532, 1.101186, -0.7943869, 1, 1, 1, 1, 1,
-0.7368718, 1.267285, -0.699155, 1, 1, 1, 1, 1,
-0.7345964, 0.1477986, -0.09072006, 1, 1, 1, 1, 1,
-0.7327241, 0.2824522, -1.552844, 1, 1, 1, 1, 1,
-0.7302236, 1.900427, -0.1837079, 1, 1, 1, 1, 1,
-0.7282144, 0.5705625, -0.9639933, 1, 1, 1, 1, 1,
-0.7274737, -0.7929339, -1.487445, 1, 1, 1, 1, 1,
-0.7232058, -2.056018, -2.574419, 1, 1, 1, 1, 1,
-0.7203853, 1.353212, -1.539512, 1, 1, 1, 1, 1,
-0.7193531, 0.8130792, -0.0466923, 1, 1, 1, 1, 1,
-0.7188179, 0.2479076, -0.78775, 0, 0, 1, 1, 1,
-0.7149302, 1.079266, -0.683432, 1, 0, 0, 1, 1,
-0.7135615, -1.017217, -3.285923, 1, 0, 0, 1, 1,
-0.7119585, 0.09340981, -1.615355, 1, 0, 0, 1, 1,
-0.7106325, 1.396911, 0.2333807, 1, 0, 0, 1, 1,
-0.7095867, 2.461608, 1.891391, 1, 0, 0, 1, 1,
-0.7087472, -0.3721272, -2.52169, 0, 0, 0, 1, 1,
-0.7035728, 0.2494213, -0.5852126, 0, 0, 0, 1, 1,
-0.7017087, 0.3445582, 0.3365572, 0, 0, 0, 1, 1,
-0.7006921, -0.9235185, -2.310024, 0, 0, 0, 1, 1,
-0.700657, 1.089513, -1.206958, 0, 0, 0, 1, 1,
-0.6983547, -1.535575, -2.252593, 0, 0, 0, 1, 1,
-0.6907122, -0.9341366, -1.704746, 0, 0, 0, 1, 1,
-0.6832197, 0.2882262, 0.06583446, 1, 1, 1, 1, 1,
-0.6824585, 1.86594, -0.7919119, 1, 1, 1, 1, 1,
-0.6814647, 0.1316196, -1.734699, 1, 1, 1, 1, 1,
-0.6777764, -1.909324, -1.778255, 1, 1, 1, 1, 1,
-0.6743007, 0.9248679, -1.659582, 1, 1, 1, 1, 1,
-0.6738601, -0.07092042, -1.096389, 1, 1, 1, 1, 1,
-0.6738384, 0.5600045, -1.310591, 1, 1, 1, 1, 1,
-0.6689833, 1.944593, -1.744519, 1, 1, 1, 1, 1,
-0.6679351, -0.8181233, -0.4293031, 1, 1, 1, 1, 1,
-0.6659409, 0.8805643, -1.549034, 1, 1, 1, 1, 1,
-0.6629713, -0.1464595, -1.428341, 1, 1, 1, 1, 1,
-0.662336, -0.1952115, -3.753827, 1, 1, 1, 1, 1,
-0.661042, -0.8390799, -2.433135, 1, 1, 1, 1, 1,
-0.6608572, -0.6196936, -1.947697, 1, 1, 1, 1, 1,
-0.6534813, 0.1733838, -2.588275, 1, 1, 1, 1, 1,
-0.6471745, 0.2061665, -0.7330119, 0, 0, 1, 1, 1,
-0.6447137, -1.436459, -3.864049, 1, 0, 0, 1, 1,
-0.6390242, 0.03212826, -0.8844705, 1, 0, 0, 1, 1,
-0.6382052, -0.7351125, -0.1479047, 1, 0, 0, 1, 1,
-0.6366906, -0.8217455, -2.161265, 1, 0, 0, 1, 1,
-0.6347997, -1.353712, -2.743261, 1, 0, 0, 1, 1,
-0.6335145, 0.3477159, -1.221005, 0, 0, 0, 1, 1,
-0.6326792, 1.542632, 0.2980701, 0, 0, 0, 1, 1,
-0.6312039, 0.7427999, -1.835161, 0, 0, 0, 1, 1,
-0.6309787, -0.4609253, -2.770674, 0, 0, 0, 1, 1,
-0.6285319, -0.1885267, -0.6337069, 0, 0, 0, 1, 1,
-0.6269968, 1.664883, -1.226355, 0, 0, 0, 1, 1,
-0.6209128, -0.2872858, -1.559947, 0, 0, 0, 1, 1,
-0.611923, -0.6760453, -3.093356, 1, 1, 1, 1, 1,
-0.6072088, -0.3668261, -1.475783, 1, 1, 1, 1, 1,
-0.6033701, -0.1929276, -3.651675, 1, 1, 1, 1, 1,
-0.6028851, 1.257221, -2.459307, 1, 1, 1, 1, 1,
-0.5907193, 0.8875398, -1.139867, 1, 1, 1, 1, 1,
-0.5879554, -1.162199, -2.104813, 1, 1, 1, 1, 1,
-0.5823426, -0.6636087, -0.9471061, 1, 1, 1, 1, 1,
-0.5799891, 0.4678273, -0.4429841, 1, 1, 1, 1, 1,
-0.5781388, -0.9732767, -2.145034, 1, 1, 1, 1, 1,
-0.5776479, -0.4027562, -0.8477775, 1, 1, 1, 1, 1,
-0.5731361, -0.7179235, -1.147555, 1, 1, 1, 1, 1,
-0.5706717, -0.455066, -1.831949, 1, 1, 1, 1, 1,
-0.5669816, 0.9694794, 0.2126016, 1, 1, 1, 1, 1,
-0.5647014, 0.1184741, -1.799165, 1, 1, 1, 1, 1,
-0.5643283, -0.1475829, -1.54405, 1, 1, 1, 1, 1,
-0.5637791, 0.3062454, -2.039691, 0, 0, 1, 1, 1,
-0.5575104, 2.562798, 0.3414957, 1, 0, 0, 1, 1,
-0.5556083, 1.22776, -0.3628881, 1, 0, 0, 1, 1,
-0.5544183, 1.741546, -0.9727376, 1, 0, 0, 1, 1,
-0.5515984, 0.9948644, -1.071999, 1, 0, 0, 1, 1,
-0.5444496, -0.4267473, -2.442515, 1, 0, 0, 1, 1,
-0.5438542, 0.009417467, -1.528941, 0, 0, 0, 1, 1,
-0.5366786, -1.583969, -2.622236, 0, 0, 0, 1, 1,
-0.5354178, -0.9454812, -2.849588, 0, 0, 0, 1, 1,
-0.5303174, -0.7089412, -2.411101, 0, 0, 0, 1, 1,
-0.5294749, 0.7695576, -0.299731, 0, 0, 0, 1, 1,
-0.5250539, -0.2263687, -1.713081, 0, 0, 0, 1, 1,
-0.520794, 0.8186697, -0.6855717, 0, 0, 0, 1, 1,
-0.5202596, 1.912749, 0.1243223, 1, 1, 1, 1, 1,
-0.5202012, 0.5211897, -0.854027, 1, 1, 1, 1, 1,
-0.5162836, 1.095972, -1.160326, 1, 1, 1, 1, 1,
-0.5134053, 0.7881812, -0.8796166, 1, 1, 1, 1, 1,
-0.5131603, -0.3005485, -1.955718, 1, 1, 1, 1, 1,
-0.5130609, -0.3248126, -1.177546, 1, 1, 1, 1, 1,
-0.5118169, 1.272639, -1.117082, 1, 1, 1, 1, 1,
-0.5096322, -1.450234, -2.471092, 1, 1, 1, 1, 1,
-0.509249, -1.254366, -3.081721, 1, 1, 1, 1, 1,
-0.5035715, -0.05985013, -1.393637, 1, 1, 1, 1, 1,
-0.497857, -1.215384, -2.529396, 1, 1, 1, 1, 1,
-0.4976257, -0.3704814, -1.18962, 1, 1, 1, 1, 1,
-0.4898031, 1.18655, -1.900824, 1, 1, 1, 1, 1,
-0.4876846, -1.458194, -1.4082, 1, 1, 1, 1, 1,
-0.4855194, -0.07351828, -1.914291, 1, 1, 1, 1, 1,
-0.4849336, -1.677538, -3.698261, 0, 0, 1, 1, 1,
-0.4821728, 1.362396, -0.2183827, 1, 0, 0, 1, 1,
-0.4782043, 0.9513144, -0.3826752, 1, 0, 0, 1, 1,
-0.4725816, 0.4810628, -2.561361, 1, 0, 0, 1, 1,
-0.4722625, 0.8413823, -0.5808932, 1, 0, 0, 1, 1,
-0.4707682, 0.3957468, -2.830902, 1, 0, 0, 1, 1,
-0.4661334, 0.9562628, -0.8229403, 0, 0, 0, 1, 1,
-0.4620476, 0.951578, 0.8529451, 0, 0, 0, 1, 1,
-0.4562637, -1.67537, -4.480516, 0, 0, 0, 1, 1,
-0.4548598, -0.4899941, -1.402709, 0, 0, 0, 1, 1,
-0.4538071, 1.192624, -1.60351, 0, 0, 0, 1, 1,
-0.4503099, 0.9049103, 0.7274756, 0, 0, 0, 1, 1,
-0.4458195, -0.7358004, -2.708152, 0, 0, 0, 1, 1,
-0.4448693, -1.390251, -2.417935, 1, 1, 1, 1, 1,
-0.4446039, -0.5305211, -1.248644, 1, 1, 1, 1, 1,
-0.4432243, 0.6159467, -0.5351676, 1, 1, 1, 1, 1,
-0.4425589, 1.2794, 0.3389532, 1, 1, 1, 1, 1,
-0.4423218, -0.2032584, -2.605147, 1, 1, 1, 1, 1,
-0.4420937, -0.462266, -0.7164919, 1, 1, 1, 1, 1,
-0.4405075, 0.1159663, -1.33859, 1, 1, 1, 1, 1,
-0.439518, -0.6996346, -3.19983, 1, 1, 1, 1, 1,
-0.4384896, -1.400807, -2.995627, 1, 1, 1, 1, 1,
-0.43253, 0.184315, -1.737664, 1, 1, 1, 1, 1,
-0.4325267, -0.9926554, -2.024705, 1, 1, 1, 1, 1,
-0.4292082, 0.01710477, -0.6869985, 1, 1, 1, 1, 1,
-0.4291528, 0.04306159, -1.252771, 1, 1, 1, 1, 1,
-0.4275835, -0.1867535, -2.648397, 1, 1, 1, 1, 1,
-0.4273787, 0.02153384, -1.080735, 1, 1, 1, 1, 1,
-0.4269426, -0.03408784, -0.6945784, 0, 0, 1, 1, 1,
-0.423321, 0.8129712, -0.7351618, 1, 0, 0, 1, 1,
-0.4217599, 1.237513, -1.210287, 1, 0, 0, 1, 1,
-0.4160516, 0.665535, -2.097335, 1, 0, 0, 1, 1,
-0.4140534, 0.1356816, -3.587417, 1, 0, 0, 1, 1,
-0.4125122, 0.0436476, -0.822273, 1, 0, 0, 1, 1,
-0.4115444, 0.5643724, -0.3394257, 0, 0, 0, 1, 1,
-0.4089387, -1.386715, -2.040165, 0, 0, 0, 1, 1,
-0.4028625, 2.455997, 0.9324366, 0, 0, 0, 1, 1,
-0.4006046, -0.05617752, -0.9055715, 0, 0, 0, 1, 1,
-0.3990441, -0.6504921, -3.976555, 0, 0, 0, 1, 1,
-0.3955024, -0.4285066, -2.912841, 0, 0, 0, 1, 1,
-0.3932118, -0.004700947, -0.07748125, 0, 0, 0, 1, 1,
-0.3930838, -0.4031614, -1.706629, 1, 1, 1, 1, 1,
-0.384925, -0.9340416, -1.902888, 1, 1, 1, 1, 1,
-0.3772091, 1.297342, 1.260396, 1, 1, 1, 1, 1,
-0.3750053, 0.05962917, -0.4625057, 1, 1, 1, 1, 1,
-0.374505, 0.5186415, -1.324435, 1, 1, 1, 1, 1,
-0.3731566, 0.8615773, -1.263821, 1, 1, 1, 1, 1,
-0.3731501, 0.3135671, -1.958333, 1, 1, 1, 1, 1,
-0.3633747, -0.3499188, -2.995904, 1, 1, 1, 1, 1,
-0.3615147, -0.2811517, -2.128593, 1, 1, 1, 1, 1,
-0.3582846, 0.7006795, 0.5842134, 1, 1, 1, 1, 1,
-0.3496714, 0.9938396, 0.08511502, 1, 1, 1, 1, 1,
-0.3471458, 0.2386247, 0.4983688, 1, 1, 1, 1, 1,
-0.3462759, 0.2521033, -1.140334, 1, 1, 1, 1, 1,
-0.3458562, 0.9135618, 0.1853019, 1, 1, 1, 1, 1,
-0.3447487, 0.08631917, -1.091548, 1, 1, 1, 1, 1,
-0.3362937, 0.8887972, -0.211688, 0, 0, 1, 1, 1,
-0.3339842, -0.6784469, -5.104656, 1, 0, 0, 1, 1,
-0.3315749, 1.040683, 1.287931, 1, 0, 0, 1, 1,
-0.3297248, -1.228602, -3.842227, 1, 0, 0, 1, 1,
-0.3192363, -0.7532671, -1.246632, 1, 0, 0, 1, 1,
-0.3188117, 0.2451449, -0.385129, 1, 0, 0, 1, 1,
-0.3174672, -1.66514, -2.893114, 0, 0, 0, 1, 1,
-0.3105591, 0.3221136, -0.3558781, 0, 0, 0, 1, 1,
-0.2990546, 0.9936513, 0.2891304, 0, 0, 0, 1, 1,
-0.2985519, -0.3335846, -2.709807, 0, 0, 0, 1, 1,
-0.2882232, -0.5392168, -2.156286, 0, 0, 0, 1, 1,
-0.2876998, 0.5543716, -0.9764916, 0, 0, 0, 1, 1,
-0.2871853, -0.488096, -3.30132, 0, 0, 0, 1, 1,
-0.2865206, -1.641199, -3.081496, 1, 1, 1, 1, 1,
-0.2864255, -0.1380906, -0.2174674, 1, 1, 1, 1, 1,
-0.2861983, 1.480386, -1.340292, 1, 1, 1, 1, 1,
-0.2845273, -1.603904, -3.404367, 1, 1, 1, 1, 1,
-0.2830618, 0.4296518, -1.059797, 1, 1, 1, 1, 1,
-0.2800014, -0.08822564, -1.09646, 1, 1, 1, 1, 1,
-0.2785858, -0.8770912, -2.003697, 1, 1, 1, 1, 1,
-0.2785081, -1.019239, -3.786865, 1, 1, 1, 1, 1,
-0.2774801, 0.1335549, 0.1054336, 1, 1, 1, 1, 1,
-0.2772169, 2.165463, 0.2643879, 1, 1, 1, 1, 1,
-0.2763035, -1.070031, -2.796308, 1, 1, 1, 1, 1,
-0.2668583, -0.2682215, -3.685037, 1, 1, 1, 1, 1,
-0.2497081, 0.110695, -2.516325, 1, 1, 1, 1, 1,
-0.2497002, 0.01399446, -0.9697939, 1, 1, 1, 1, 1,
-0.248058, -0.9453151, -3.186501, 1, 1, 1, 1, 1,
-0.2468297, 1.290855, 0.9785773, 0, 0, 1, 1, 1,
-0.2459416, 0.62338, -0.5649745, 1, 0, 0, 1, 1,
-0.2452981, -0.2866819, -3.523731, 1, 0, 0, 1, 1,
-0.2448277, -0.8428681, -2.681239, 1, 0, 0, 1, 1,
-0.2436881, 0.168135, -1.617145, 1, 0, 0, 1, 1,
-0.2385507, -0.6390072, -3.611639, 1, 0, 0, 1, 1,
-0.2347525, -0.7942433, -3.040467, 0, 0, 0, 1, 1,
-0.2213392, -0.4769858, -3.133169, 0, 0, 0, 1, 1,
-0.2176365, -0.1276214, -2.678172, 0, 0, 0, 1, 1,
-0.215073, 0.02123232, 0.0968747, 0, 0, 0, 1, 1,
-0.2148349, 0.2588585, -0.07185578, 0, 0, 0, 1, 1,
-0.2146929, -0.8236504, -2.819841, 0, 0, 0, 1, 1,
-0.2104983, -0.06095202, -2.383997, 0, 0, 0, 1, 1,
-0.2103168, -0.2665683, -2.451123, 1, 1, 1, 1, 1,
-0.2090027, 0.2388213, -1.7119, 1, 1, 1, 1, 1,
-0.204301, -1.222073, -1.213683, 1, 1, 1, 1, 1,
-0.2033022, 0.04247746, -1.232644, 1, 1, 1, 1, 1,
-0.2026692, 0.4690882, -0.6548064, 1, 1, 1, 1, 1,
-0.1937219, 0.4209197, -0.7884655, 1, 1, 1, 1, 1,
-0.1871265, -0.421837, -2.500258, 1, 1, 1, 1, 1,
-0.1829442, 1.198922, -0.2269289, 1, 1, 1, 1, 1,
-0.1812681, -1.564188, -3.205147, 1, 1, 1, 1, 1,
-0.1796718, -0.3178882, -4.189537, 1, 1, 1, 1, 1,
-0.1761242, -0.1534814, -1.245151, 1, 1, 1, 1, 1,
-0.1728417, -1.350744, -2.80727, 1, 1, 1, 1, 1,
-0.1678049, 0.3050628, -0.5141692, 1, 1, 1, 1, 1,
-0.1668521, 0.2149078, 0.02187534, 1, 1, 1, 1, 1,
-0.166766, -1.277525, -2.351831, 1, 1, 1, 1, 1,
-0.1667313, -1.295216, -3.732515, 0, 0, 1, 1, 1,
-0.163904, -0.4695328, -3.071568, 1, 0, 0, 1, 1,
-0.1635299, -1.845198, -1.952452, 1, 0, 0, 1, 1,
-0.1607205, -0.8994881, -2.385105, 1, 0, 0, 1, 1,
-0.1604917, 0.6460791, 0.3570323, 1, 0, 0, 1, 1,
-0.1571876, 0.8890029, 0.5220904, 1, 0, 0, 1, 1,
-0.1532579, 1.242552, 0.3985406, 0, 0, 0, 1, 1,
-0.1494547, -0.5627818, -3.735139, 0, 0, 0, 1, 1,
-0.1488825, 0.1388795, -1.826752, 0, 0, 0, 1, 1,
-0.1469646, 1.192273, -0.9915388, 0, 0, 0, 1, 1,
-0.1422923, 1.559258, 0.1658268, 0, 0, 0, 1, 1,
-0.1365208, 1.879593, 0.3892861, 0, 0, 0, 1, 1,
-0.1328659, 0.6552571, -0.2969138, 0, 0, 0, 1, 1,
-0.1316382, -1.264111, -2.436497, 1, 1, 1, 1, 1,
-0.1314532, 0.4667061, -1.311064, 1, 1, 1, 1, 1,
-0.1278865, 2.310706, -0.5140707, 1, 1, 1, 1, 1,
-0.1271229, 0.1094265, -0.5079985, 1, 1, 1, 1, 1,
-0.1248494, -0.3379103, -1.603229, 1, 1, 1, 1, 1,
-0.1186423, 1.431271, 1.094958, 1, 1, 1, 1, 1,
-0.1169935, -1.004047, -3.309667, 1, 1, 1, 1, 1,
-0.1161036, 1.976671, -0.1485988, 1, 1, 1, 1, 1,
-0.1116042, 1.034586, -0.1956683, 1, 1, 1, 1, 1,
-0.1062709, 1.852194, 0.3280934, 1, 1, 1, 1, 1,
-0.101538, 0.6750743, 0.2264586, 1, 1, 1, 1, 1,
-0.09907953, 1.405505, -0.7737707, 1, 1, 1, 1, 1,
-0.09382003, -0.2554682, -2.113535, 1, 1, 1, 1, 1,
-0.08623232, -0.08799314, -2.746248, 1, 1, 1, 1, 1,
-0.08291601, 0.7602144, -0.5859161, 1, 1, 1, 1, 1,
-0.08290457, -1.213367, -3.533705, 0, 0, 1, 1, 1,
-0.08279851, 0.1379579, -1.540483, 1, 0, 0, 1, 1,
-0.0804586, -1.291631, -3.094542, 1, 0, 0, 1, 1,
-0.07986097, 1.129332, -0.08391229, 1, 0, 0, 1, 1,
-0.072767, 1.712076, -1.630236, 1, 0, 0, 1, 1,
-0.06932701, -2.106348, -2.756471, 1, 0, 0, 1, 1,
-0.06846079, -1.111462, -3.579576, 0, 0, 0, 1, 1,
-0.06398635, 0.6035411, 0.9647857, 0, 0, 0, 1, 1,
-0.06395372, -0.3898962, -3.812708, 0, 0, 0, 1, 1,
-0.05728706, 0.133317, -1.361403, 0, 0, 0, 1, 1,
-0.05452519, 0.1354022, -0.4680263, 0, 0, 0, 1, 1,
-0.0543385, -1.126676, -2.276189, 0, 0, 0, 1, 1,
-0.05151244, 0.5586889, -0.597347, 0, 0, 0, 1, 1,
-0.05073441, -0.8863851, -0.7262592, 1, 1, 1, 1, 1,
-0.04905046, 0.3778075, -0.6262074, 1, 1, 1, 1, 1,
-0.04686001, -0.7584781, -3.973179, 1, 1, 1, 1, 1,
-0.04424522, 0.08713257, -0.4991359, 1, 1, 1, 1, 1,
-0.03896539, -0.3076628, -3.325219, 1, 1, 1, 1, 1,
-0.03163026, 0.8061161, 0.8968119, 1, 1, 1, 1, 1,
-0.0308459, 0.9553261, -0.1224971, 1, 1, 1, 1, 1,
-0.03043177, -0.5418751, -5.389946, 1, 1, 1, 1, 1,
-0.02928997, -0.8675658, -3.144616, 1, 1, 1, 1, 1,
-0.0280849, -0.3892951, -3.697443, 1, 1, 1, 1, 1,
-0.02433818, -1.481266, -2.353568, 1, 1, 1, 1, 1,
-0.02275312, -1.663236, -2.689583, 1, 1, 1, 1, 1,
-0.02238816, -0.7959638, -3.224336, 1, 1, 1, 1, 1,
-0.02181777, 1.218148, 0.8072544, 1, 1, 1, 1, 1,
-0.01959015, -1.474428, -4.00884, 1, 1, 1, 1, 1,
-0.01868785, -0.7949021, -2.598541, 0, 0, 1, 1, 1,
-0.01603252, -1.260635, -1.64214, 1, 0, 0, 1, 1,
-0.01492442, 0.02793137, 0.4342688, 1, 0, 0, 1, 1,
-0.01378262, -0.9754974, -2.999774, 1, 0, 0, 1, 1,
-0.0128218, 0.866903, 0.1873807, 1, 0, 0, 1, 1,
-0.01019904, -0.2220311, -1.261667, 1, 0, 0, 1, 1,
-0.009442166, 2.242903, 0.01234559, 0, 0, 0, 1, 1,
-0.007779447, 0.9169204, -0.8768573, 0, 0, 0, 1, 1,
-0.006783079, 0.4036373, -0.3335835, 0, 0, 0, 1, 1,
-0.003438133, 1.065769, -0.6468837, 0, 0, 0, 1, 1,
0.001691691, -0.8954937, 1.350456, 0, 0, 0, 1, 1,
0.002929843, -0.1478611, 4.045781, 0, 0, 0, 1, 1,
0.005835208, -1.607061, 3.128388, 0, 0, 0, 1, 1,
0.006815596, -0.2212747, 3.840212, 1, 1, 1, 1, 1,
0.009241454, -1.025789, 2.99179, 1, 1, 1, 1, 1,
0.01163078, 0.2788015, 1.496006, 1, 1, 1, 1, 1,
0.0138196, -0.07420856, 2.330346, 1, 1, 1, 1, 1,
0.01503936, -1.066908, 3.786456, 1, 1, 1, 1, 1,
0.02023098, -0.03938236, 2.009074, 1, 1, 1, 1, 1,
0.02144782, 0.5341052, 2.453055, 1, 1, 1, 1, 1,
0.0221528, 0.3019967, 1.542025, 1, 1, 1, 1, 1,
0.02281909, -0.587723, 2.940028, 1, 1, 1, 1, 1,
0.02634187, -0.4370789, 4.967572, 1, 1, 1, 1, 1,
0.02740688, -0.321244, 3.535041, 1, 1, 1, 1, 1,
0.03018063, -0.170735, 1.837413, 1, 1, 1, 1, 1,
0.03262297, 1.270372, -0.01697425, 1, 1, 1, 1, 1,
0.04215942, 0.3033673, 0.4241175, 1, 1, 1, 1, 1,
0.04278889, 1.02318, 0.5430147, 1, 1, 1, 1, 1,
0.0430946, 0.1992111, 0.2681171, 0, 0, 1, 1, 1,
0.04365066, 1.071993, 0.3744659, 1, 0, 0, 1, 1,
0.04811472, 0.1366101, -0.5310272, 1, 0, 0, 1, 1,
0.04955919, 0.2103791, -0.9062544, 1, 0, 0, 1, 1,
0.04965726, -0.9470891, 0.5797619, 1, 0, 0, 1, 1,
0.0510544, -0.3278432, 3.666092, 1, 0, 0, 1, 1,
0.05624561, 0.5028305, -0.6558228, 0, 0, 0, 1, 1,
0.06154413, -0.5610912, 0.6485597, 0, 0, 0, 1, 1,
0.06163695, -0.4017124, 2.101536, 0, 0, 0, 1, 1,
0.06378392, -0.3343559, 1.367908, 0, 0, 0, 1, 1,
0.06380566, -0.336002, 2.331782, 0, 0, 0, 1, 1,
0.06581299, -2.322023, 1.660604, 0, 0, 0, 1, 1,
0.06631776, -1.83849, 4.013375, 0, 0, 0, 1, 1,
0.06651418, 0.3898128, 0.1933336, 1, 1, 1, 1, 1,
0.06942268, -0.1844878, 1.927004, 1, 1, 1, 1, 1,
0.07306012, -0.4344118, 3.600012, 1, 1, 1, 1, 1,
0.07430783, 0.4893008, 0.2018804, 1, 1, 1, 1, 1,
0.07463329, 1.285881, 0.8458567, 1, 1, 1, 1, 1,
0.07479408, -0.2781071, 1.915959, 1, 1, 1, 1, 1,
0.07497612, -0.8353142, 3.416284, 1, 1, 1, 1, 1,
0.07901526, 1.433968, 1.647162, 1, 1, 1, 1, 1,
0.08222384, 1.647591, 0.1609529, 1, 1, 1, 1, 1,
0.08390678, -1.074755, 1.728285, 1, 1, 1, 1, 1,
0.08518893, -0.5405689, 1.753186, 1, 1, 1, 1, 1,
0.08527556, 0.7108061, 0.3236602, 1, 1, 1, 1, 1,
0.08739334, 0.5527294, 0.9310889, 1, 1, 1, 1, 1,
0.09541327, -0.00765766, 1.352, 1, 1, 1, 1, 1,
0.09576824, 0.1464981, 1.332237, 1, 1, 1, 1, 1,
0.09831025, 0.6785707, -0.632289, 0, 0, 1, 1, 1,
0.1007253, -0.5204433, 3.988542, 1, 0, 0, 1, 1,
0.1019359, -0.6122578, 3.836383, 1, 0, 0, 1, 1,
0.102865, 0.03705379, 1.354249, 1, 0, 0, 1, 1,
0.1046938, 0.2295671, 1.756093, 1, 0, 0, 1, 1,
0.1133342, 1.771868, 0.3232314, 1, 0, 0, 1, 1,
0.1169641, -1.16014, 2.950962, 0, 0, 0, 1, 1,
0.1220113, 0.9951183, 1.249109, 0, 0, 0, 1, 1,
0.1225654, 1.358811, -0.318305, 0, 0, 0, 1, 1,
0.1236055, 0.319409, 0.2684568, 0, 0, 0, 1, 1,
0.1267078, 0.04668545, 1.655579, 0, 0, 0, 1, 1,
0.1298578, 2.344836, -1.647078, 0, 0, 0, 1, 1,
0.1337795, -1.763681, 0.9982489, 0, 0, 0, 1, 1,
0.1340327, -0.3158505, 3.064916, 1, 1, 1, 1, 1,
0.1342922, -0.5557178, 3.015445, 1, 1, 1, 1, 1,
0.1356547, 1.514191, -1.137769, 1, 1, 1, 1, 1,
0.1371364, -1.023216, 3.582591, 1, 1, 1, 1, 1,
0.138109, 0.1579723, 1.406545, 1, 1, 1, 1, 1,
0.1431322, 0.6882255, 0.3533133, 1, 1, 1, 1, 1,
0.1431429, 0.6829848, 0.2157277, 1, 1, 1, 1, 1,
0.1456279, 1.20925, -0.4897111, 1, 1, 1, 1, 1,
0.1471785, 0.2476231, 0.2180335, 1, 1, 1, 1, 1,
0.1498891, 0.7702164, -0.7830448, 1, 1, 1, 1, 1,
0.1525802, -0.09908539, 2.218948, 1, 1, 1, 1, 1,
0.1540464, 0.6344497, -0.8614542, 1, 1, 1, 1, 1,
0.1575952, 0.2537689, 1.077523, 1, 1, 1, 1, 1,
0.1581758, -1.955489, 3.238276, 1, 1, 1, 1, 1,
0.1583135, -0.3742441, 2.470118, 1, 1, 1, 1, 1,
0.1601321, 0.6741698, -0.9125971, 0, 0, 1, 1, 1,
0.1604267, -0.3377621, 3.923777, 1, 0, 0, 1, 1,
0.162805, 0.5911292, -0.2171876, 1, 0, 0, 1, 1,
0.1636473, -0.3697082, 3.043268, 1, 0, 0, 1, 1,
0.1637023, 0.9145946, 0.3708448, 1, 0, 0, 1, 1,
0.1663947, -0.1880233, 2.77395, 1, 0, 0, 1, 1,
0.1684589, -1.647066, 2.435776, 0, 0, 0, 1, 1,
0.1694446, 0.732953, -1.177212, 0, 0, 0, 1, 1,
0.1706734, -1.63777, 3.255093, 0, 0, 0, 1, 1,
0.175945, -0.3342732, 3.401657, 0, 0, 0, 1, 1,
0.1794744, 0.1001402, 0.009482918, 0, 0, 0, 1, 1,
0.1798864, -0.2714548, 2.041099, 0, 0, 0, 1, 1,
0.1878068, 0.2376734, 0.4701592, 0, 0, 0, 1, 1,
0.1888221, -0.08768271, 2.331789, 1, 1, 1, 1, 1,
0.1909418, 0.709398, -0.8165259, 1, 1, 1, 1, 1,
0.1997789, 1.864416, -0.8818325, 1, 1, 1, 1, 1,
0.202214, -0.1556755, 1.831625, 1, 1, 1, 1, 1,
0.2057206, 1.713841, 1.977828, 1, 1, 1, 1, 1,
0.207127, 1.50062, -0.336823, 1, 1, 1, 1, 1,
0.2084355, 0.8396381, 0.445144, 1, 1, 1, 1, 1,
0.2121466, -0.7611616, 3.504105, 1, 1, 1, 1, 1,
0.2123426, -2.091005, 1.14347, 1, 1, 1, 1, 1,
0.2140522, 1.048607, 0.4081157, 1, 1, 1, 1, 1,
0.2146154, -1.262958, 2.613425, 1, 1, 1, 1, 1,
0.2150899, -1.46179, 5.54932, 1, 1, 1, 1, 1,
0.2151453, -0.3336208, 0.9622585, 1, 1, 1, 1, 1,
0.2152002, -1.359052, 2.175833, 1, 1, 1, 1, 1,
0.2164233, -1.179363, 2.796457, 1, 1, 1, 1, 1,
0.2165455, 0.7825199, -1.389591, 0, 0, 1, 1, 1,
0.2173133, -0.3104411, 0.8311493, 1, 0, 0, 1, 1,
0.2176346, -0.5841195, 3.347624, 1, 0, 0, 1, 1,
0.2196571, 1.687452, 0.1519095, 1, 0, 0, 1, 1,
0.2241836, -2.063528, 4.383514, 1, 0, 0, 1, 1,
0.2252247, -0.3665695, 2.038475, 1, 0, 0, 1, 1,
0.2286117, -0.3895764, 3.347826, 0, 0, 0, 1, 1,
0.2465762, 0.108289, -0.1295922, 0, 0, 0, 1, 1,
0.2472963, 0.3969474, 1.633924, 0, 0, 0, 1, 1,
0.2481447, 1.416576, 0.3429664, 0, 0, 0, 1, 1,
0.2493274, 1.027136, -0.5011899, 0, 0, 0, 1, 1,
0.2496045, 1.32595, -0.4871817, 0, 0, 0, 1, 1,
0.2510654, -0.589995, 3.650227, 0, 0, 0, 1, 1,
0.2524778, -0.745177, 2.71638, 1, 1, 1, 1, 1,
0.2526731, 1.040291, -0.3587106, 1, 1, 1, 1, 1,
0.2563328, -1.334127, 4.811558, 1, 1, 1, 1, 1,
0.262297, 0.6186756, -1.414215, 1, 1, 1, 1, 1,
0.2656101, 0.3685903, 1.07088, 1, 1, 1, 1, 1,
0.2663283, -0.159271, 3.336157, 1, 1, 1, 1, 1,
0.2677579, -1.245791, 1.940813, 1, 1, 1, 1, 1,
0.2678281, -1.32958, 2.942509, 1, 1, 1, 1, 1,
0.2695855, 0.04174874, 1.629202, 1, 1, 1, 1, 1,
0.2717356, -0.2277602, 0.67076, 1, 1, 1, 1, 1,
0.2732538, -1.584772, 3.153342, 1, 1, 1, 1, 1,
0.2762833, 0.4878146, 0.7793735, 1, 1, 1, 1, 1,
0.2765378, -1.28562, 3.777739, 1, 1, 1, 1, 1,
0.2845243, 0.3906439, 0.2924277, 1, 1, 1, 1, 1,
0.2856673, -1.169573, 3.843704, 1, 1, 1, 1, 1,
0.2883774, -0.5715763, 1.506564, 0, 0, 1, 1, 1,
0.2925965, 0.6422902, 1.745449, 1, 0, 0, 1, 1,
0.2951982, 0.9421014, 2.028508, 1, 0, 0, 1, 1,
0.2966973, -0.3279063, 0.8729562, 1, 0, 0, 1, 1,
0.3011553, -0.2097261, 4.363268, 1, 0, 0, 1, 1,
0.3021435, -0.7274505, 3.288635, 1, 0, 0, 1, 1,
0.3033109, 0.5506455, 1.008198, 0, 0, 0, 1, 1,
0.3033142, -1.908402, 3.885524, 0, 0, 0, 1, 1,
0.3037932, -0.8530939, 2.272786, 0, 0, 0, 1, 1,
0.3090603, 1.094305, -0.1876546, 0, 0, 0, 1, 1,
0.3101596, 0.043972, 2.288554, 0, 0, 0, 1, 1,
0.3132552, -1.745752, 3.623649, 0, 0, 0, 1, 1,
0.3161311, 0.09011552, -0.3033257, 0, 0, 0, 1, 1,
0.3198283, 2.226417, 2.671367, 1, 1, 1, 1, 1,
0.3221872, 0.5850353, -0.7711435, 1, 1, 1, 1, 1,
0.3247202, 0.7748632, -0.35813, 1, 1, 1, 1, 1,
0.3254431, -1.931508, 3.073055, 1, 1, 1, 1, 1,
0.3270448, -1.15452, 2.809789, 1, 1, 1, 1, 1,
0.3328604, -0.6357725, 3.267245, 1, 1, 1, 1, 1,
0.3347568, -0.2298743, 2.735574, 1, 1, 1, 1, 1,
0.3361835, 0.5466463, 0.3516627, 1, 1, 1, 1, 1,
0.3368742, -0.9561126, 2.275796, 1, 1, 1, 1, 1,
0.3379414, 0.8256434, 0.2302407, 1, 1, 1, 1, 1,
0.3397955, -0.445583, 0.2849307, 1, 1, 1, 1, 1,
0.3438387, 0.452226, 0.8636801, 1, 1, 1, 1, 1,
0.3487853, 0.810596, 0.09254636, 1, 1, 1, 1, 1,
0.3517861, -0.2733513, 2.426584, 1, 1, 1, 1, 1,
0.35803, -1.315353, 2.093759, 1, 1, 1, 1, 1,
0.3584762, 0.5175278, -0.2346919, 0, 0, 1, 1, 1,
0.363828, -0.2669463, 1.453141, 1, 0, 0, 1, 1,
0.3640496, -0.7465501, 3.070282, 1, 0, 0, 1, 1,
0.3653724, -1.53028, 4.308613, 1, 0, 0, 1, 1,
0.3667221, -0.2569806, 2.614601, 1, 0, 0, 1, 1,
0.3671072, 0.5095415, -0.3836928, 1, 0, 0, 1, 1,
0.3683067, -0.6548961, 2.931794, 0, 0, 0, 1, 1,
0.3730122, -0.2822086, 3.321432, 0, 0, 0, 1, 1,
0.3740065, -0.8815978, 2.19875, 0, 0, 0, 1, 1,
0.3753042, 1.454807, -0.5857414, 0, 0, 0, 1, 1,
0.3792374, -1.225276, 2.955906, 0, 0, 0, 1, 1,
0.3898259, 2.306342, 0.02130409, 0, 0, 0, 1, 1,
0.3919155, -0.5376673, 3.387242, 0, 0, 0, 1, 1,
0.3991184, -0.7861717, 1.778531, 1, 1, 1, 1, 1,
0.4042293, -1.806001, 2.779466, 1, 1, 1, 1, 1,
0.4052044, 0.8063313, 0.04502714, 1, 1, 1, 1, 1,
0.4092, 1.531563, -0.00240417, 1, 1, 1, 1, 1,
0.4119365, -0.5330924, 3.180707, 1, 1, 1, 1, 1,
0.4137673, 0.5880765, 0.4147886, 1, 1, 1, 1, 1,
0.4248593, 0.7478828, -1.349547, 1, 1, 1, 1, 1,
0.4284336, 1.028191, 0.2156819, 1, 1, 1, 1, 1,
0.4381573, -1.434015, 3.173695, 1, 1, 1, 1, 1,
0.4423717, 0.674053, 2.440706, 1, 1, 1, 1, 1,
0.4496584, 1.041818, -0.193076, 1, 1, 1, 1, 1,
0.4539219, -1.37298, 2.424864, 1, 1, 1, 1, 1,
0.4580547, 0.7145188, -0.7053326, 1, 1, 1, 1, 1,
0.4613544, 0.7406182, 0.1524631, 1, 1, 1, 1, 1,
0.4672713, 1.231175, 0.4847834, 1, 1, 1, 1, 1,
0.4680986, 0.7391059, 0.0159823, 0, 0, 1, 1, 1,
0.4700097, -0.2842121, 3.138979, 1, 0, 0, 1, 1,
0.4738528, 0.7254255, 0.1370059, 1, 0, 0, 1, 1,
0.4760976, 0.4035179, 1.812457, 1, 0, 0, 1, 1,
0.4851239, 0.2656524, 0.008807138, 1, 0, 0, 1, 1,
0.4864065, 2.458013, 0.5126903, 1, 0, 0, 1, 1,
0.4875188, 1.693112, 1.210603, 0, 0, 0, 1, 1,
0.4878086, 0.05265841, 0.9500975, 0, 0, 0, 1, 1,
0.4902382, 3.107444, -1.279037, 0, 0, 0, 1, 1,
0.4968299, -0.1176493, 3.956474, 0, 0, 0, 1, 1,
0.4975551, -1.270521, 2.388073, 0, 0, 0, 1, 1,
0.49906, -0.7216313, 3.27036, 0, 0, 0, 1, 1,
0.5009432, 0.9919196, 2.248871, 0, 0, 0, 1, 1,
0.5042404, 0.4079586, 0.2390386, 1, 1, 1, 1, 1,
0.5062863, -0.1521651, 1.318133, 1, 1, 1, 1, 1,
0.507887, 0.3739942, 2.581996, 1, 1, 1, 1, 1,
0.5082728, -0.748238, 2.270094, 1, 1, 1, 1, 1,
0.5088181, -0.6337037, 4.265066, 1, 1, 1, 1, 1,
0.509603, -1.042641, 2.324099, 1, 1, 1, 1, 1,
0.5097777, -0.8417311, 2.173882, 1, 1, 1, 1, 1,
0.5198095, -0.7549481, 2.10887, 1, 1, 1, 1, 1,
0.5221797, 1.469137, -0.3530411, 1, 1, 1, 1, 1,
0.5223173, -0.6519491, 2.138569, 1, 1, 1, 1, 1,
0.5373717, -0.5397942, 2.197244, 1, 1, 1, 1, 1,
0.5379722, 0.4568912, 1.984103, 1, 1, 1, 1, 1,
0.5393167, -0.6616853, 0.8604966, 1, 1, 1, 1, 1,
0.5429807, -1.467868, 2.71604, 1, 1, 1, 1, 1,
0.5438843, 1.335001, -0.2087252, 1, 1, 1, 1, 1,
0.544917, 0.7478176, 0.8387181, 0, 0, 1, 1, 1,
0.5483052, -0.07992721, 0.279609, 1, 0, 0, 1, 1,
0.5610279, -0.4195866, 0.9240562, 1, 0, 0, 1, 1,
0.5672253, 0.2166521, 0.829097, 1, 0, 0, 1, 1,
0.5688906, -0.4959065, 2.434804, 1, 0, 0, 1, 1,
0.5689517, 0.04786006, 1.43051, 1, 0, 0, 1, 1,
0.5704986, -0.7415423, 2.521837, 0, 0, 0, 1, 1,
0.5714265, 0.3270753, 1.114707, 0, 0, 0, 1, 1,
0.5743228, -0.5221289, 1.335433, 0, 0, 0, 1, 1,
0.5810152, 0.2420945, 2.877114, 0, 0, 0, 1, 1,
0.5816597, 0.8891581, 0.7500328, 0, 0, 0, 1, 1,
0.5819724, 1.149814, -0.7359269, 0, 0, 0, 1, 1,
0.5839505, 0.1896028, 1.201383, 0, 0, 0, 1, 1,
0.584753, 0.1516067, 1.213466, 1, 1, 1, 1, 1,
0.5860997, -0.4035097, 0.2940398, 1, 1, 1, 1, 1,
0.5885924, 0.6286106, -0.3011287, 1, 1, 1, 1, 1,
0.5900127, 0.6834341, 2.287479, 1, 1, 1, 1, 1,
0.5916955, 0.04437898, 2.438998, 1, 1, 1, 1, 1,
0.5937366, 1.45397, 0.02155272, 1, 1, 1, 1, 1,
0.6005549, 0.1678282, 2.20052, 1, 1, 1, 1, 1,
0.6009148, -1.767327, 2.985814, 1, 1, 1, 1, 1,
0.6010499, 0.38085, 0.2736651, 1, 1, 1, 1, 1,
0.6079457, -1.271194, 2.45414, 1, 1, 1, 1, 1,
0.6093113, 0.3615423, 0.4450965, 1, 1, 1, 1, 1,
0.6127211, -1.196197, 3.257441, 1, 1, 1, 1, 1,
0.6165727, 1.43342, 0.5746624, 1, 1, 1, 1, 1,
0.618523, 0.01085167, 1.572357, 1, 1, 1, 1, 1,
0.6197643, -1.114298, 2.650399, 1, 1, 1, 1, 1,
0.6249158, 0.442041, 0.8457219, 0, 0, 1, 1, 1,
0.6352592, -0.1418979, 2.922847, 1, 0, 0, 1, 1,
0.6354603, 0.3457504, 1.167017, 1, 0, 0, 1, 1,
0.6384929, -0.6481333, 0.8935797, 1, 0, 0, 1, 1,
0.6416703, -0.484712, 2.543928, 1, 0, 0, 1, 1,
0.6446067, 1.765853, 1.404641, 1, 0, 0, 1, 1,
0.6448675, 1.245328, 1.450988, 0, 0, 0, 1, 1,
0.6460483, 2.607602, 0.3862885, 0, 0, 0, 1, 1,
0.6519856, 1.3659, 0.3436078, 0, 0, 0, 1, 1,
0.6524024, 1.654326, 0.05043055, 0, 0, 0, 1, 1,
0.6601095, 0.5004695, 0.6189134, 0, 0, 0, 1, 1,
0.6602953, 1.780247, -0.3254136, 0, 0, 0, 1, 1,
0.6614658, 0.2349816, 2.037444, 0, 0, 0, 1, 1,
0.6636422, 1.492127, 1.177218, 1, 1, 1, 1, 1,
0.6642333, -0.4466587, 2.264151, 1, 1, 1, 1, 1,
0.6660181, 0.4261631, 1.425177, 1, 1, 1, 1, 1,
0.6669379, 1.358371, -0.3357565, 1, 1, 1, 1, 1,
0.6670448, 0.5516912, 1.204728, 1, 1, 1, 1, 1,
0.6681411, 0.1897419, 1.84466, 1, 1, 1, 1, 1,
0.6725642, 1.37339, 0.6996403, 1, 1, 1, 1, 1,
0.676363, -1.191856, 2.386136, 1, 1, 1, 1, 1,
0.6815717, 0.2379497, 2.130851, 1, 1, 1, 1, 1,
0.6837292, -0.8100896, 2.003563, 1, 1, 1, 1, 1,
0.6869307, 0.1478627, 0.7000234, 1, 1, 1, 1, 1,
0.6873909, -0.02646133, -0.5568693, 1, 1, 1, 1, 1,
0.6877349, -0.9232923, 1.592006, 1, 1, 1, 1, 1,
0.6884341, -0.5481654, 0.9476661, 1, 1, 1, 1, 1,
0.6909686, -0.9521291, 1.156755, 1, 1, 1, 1, 1,
0.7014585, -1.100526, 4.196373, 0, 0, 1, 1, 1,
0.7016395, -0.08824489, 1.48704, 1, 0, 0, 1, 1,
0.7035598, -0.1128963, 2.075642, 1, 0, 0, 1, 1,
0.7054114, 0.05394758, 2.509289, 1, 0, 0, 1, 1,
0.7068042, -0.2967417, 0.9899975, 1, 0, 0, 1, 1,
0.709563, -0.1779117, 1.744352, 1, 0, 0, 1, 1,
0.7115123, -0.5325339, 2.197474, 0, 0, 0, 1, 1,
0.7186186, 1.552212, 1.30169, 0, 0, 0, 1, 1,
0.7191404, 0.2469921, 1.077485, 0, 0, 0, 1, 1,
0.7246673, 0.1502319, 2.024704, 0, 0, 0, 1, 1,
0.7247915, -0.07073221, 1.484808, 0, 0, 0, 1, 1,
0.7267165, 0.8972822, -0.4040774, 0, 0, 0, 1, 1,
0.7289177, 0.4933428, 1.053104, 0, 0, 0, 1, 1,
0.7324826, 0.8944846, 0.4835179, 1, 1, 1, 1, 1,
0.7420626, -0.9625055, 1.398757, 1, 1, 1, 1, 1,
0.745514, 0.5949907, -0.1620078, 1, 1, 1, 1, 1,
0.7475994, 0.279483, 0.3422273, 1, 1, 1, 1, 1,
0.7485424, 1.213959, -0.493048, 1, 1, 1, 1, 1,
0.7490999, 0.0363954, 1.26186, 1, 1, 1, 1, 1,
0.7493426, -0.813363, 3.685367, 1, 1, 1, 1, 1,
0.7516069, 0.3164364, 1.494642, 1, 1, 1, 1, 1,
0.7616158, 1.079807, 0.6630121, 1, 1, 1, 1, 1,
0.7622692, 0.5712661, -0.9286349, 1, 1, 1, 1, 1,
0.7762817, -1.927149, 1.974941, 1, 1, 1, 1, 1,
0.7770604, 0.368064, 1.397214, 1, 1, 1, 1, 1,
0.7797732, 0.3768094, 2.272142, 1, 1, 1, 1, 1,
0.7848964, 2.020896, 0.03018088, 1, 1, 1, 1, 1,
0.785009, -2.112204, 1.794596, 1, 1, 1, 1, 1,
0.7879497, -0.8045891, 1.772388, 0, 0, 1, 1, 1,
0.7923158, -0.5104314, 0.7050883, 1, 0, 0, 1, 1,
0.7929121, 0.9618137, 1.120413, 1, 0, 0, 1, 1,
0.8097028, -1.369832, 2.474958, 1, 0, 0, 1, 1,
0.8105626, -0.5242059, 2.811114, 1, 0, 0, 1, 1,
0.813113, -0.5686212, 0.7609752, 1, 0, 0, 1, 1,
0.8165509, -0.4745328, 2.601425, 0, 0, 0, 1, 1,
0.8200454, -0.4520968, 1.444439, 0, 0, 0, 1, 1,
0.8224469, 1.37328, 0.07483869, 0, 0, 0, 1, 1,
0.825407, -1.498042, 4.005683, 0, 0, 0, 1, 1,
0.8344675, 1.118218, 0.8951604, 0, 0, 0, 1, 1,
0.8420724, 0.1932339, 1.255436, 0, 0, 0, 1, 1,
0.845543, -0.3338179, 1.148473, 0, 0, 0, 1, 1,
0.8547487, 0.05044215, 2.243419, 1, 1, 1, 1, 1,
0.8549197, 0.6770515, 2.420405, 1, 1, 1, 1, 1,
0.8549809, -0.1255347, 2.219171, 1, 1, 1, 1, 1,
0.8554466, 1.645956, 0.9680209, 1, 1, 1, 1, 1,
0.8575055, -0.6411721, 3.66026, 1, 1, 1, 1, 1,
0.8607343, 1.071792, 0.6624042, 1, 1, 1, 1, 1,
0.8687519, -0.556079, 1.090346, 1, 1, 1, 1, 1,
0.8784645, -1.480905, 2.247849, 1, 1, 1, 1, 1,
0.878965, 1.867029, 1.876321, 1, 1, 1, 1, 1,
0.8834444, -1.440727, 2.066699, 1, 1, 1, 1, 1,
0.8852111, -2.182173, 3.84513, 1, 1, 1, 1, 1,
0.8852245, 0.1891887, -0.8844579, 1, 1, 1, 1, 1,
0.885476, 0.178819, 1.573248, 1, 1, 1, 1, 1,
0.885587, -2.0335, 4.477524, 1, 1, 1, 1, 1,
0.8856348, 1.053104, -0.9191526, 1, 1, 1, 1, 1,
0.8873376, -0.02076912, 2.35223, 0, 0, 1, 1, 1,
0.8875058, -1.212925, 4.22651, 1, 0, 0, 1, 1,
0.8904643, -0.05003383, 1.153983, 1, 0, 0, 1, 1,
0.8922041, -0.1174618, 1.255311, 1, 0, 0, 1, 1,
0.8924816, 0.6177862, -2.18233, 1, 0, 0, 1, 1,
0.894617, -0.8077896, 2.858649, 1, 0, 0, 1, 1,
0.896343, -1.051854, 3.620902, 0, 0, 0, 1, 1,
0.8967926, 0.9136969, 1.863583, 0, 0, 0, 1, 1,
0.8969725, 0.6140112, 2.675432, 0, 0, 0, 1, 1,
0.9010601, -0.8087692, 3.049175, 0, 0, 0, 1, 1,
0.904582, -0.8293621, 2.705381, 0, 0, 0, 1, 1,
0.9132245, 1.129373, 1.38216, 0, 0, 0, 1, 1,
0.9143608, -0.6519273, 0.8880268, 0, 0, 0, 1, 1,
0.9159972, 1.688543, -0.2012613, 1, 1, 1, 1, 1,
0.9171713, 0.5878237, 1.003127, 1, 1, 1, 1, 1,
0.9180248, 0.2184088, 2.593311, 1, 1, 1, 1, 1,
0.9237369, 0.2185457, 1.68964, 1, 1, 1, 1, 1,
0.9263986, 0.7440675, -0.4199848, 1, 1, 1, 1, 1,
0.931859, 0.8647044, 1.016698, 1, 1, 1, 1, 1,
0.9325639, 1.785175, 0.7792611, 1, 1, 1, 1, 1,
0.9348466, -0.9286591, 0.3090702, 1, 1, 1, 1, 1,
0.9362645, -1.045017, 3.648747, 1, 1, 1, 1, 1,
0.9400534, -1.238589, 2.362542, 1, 1, 1, 1, 1,
0.9403949, 0.04397667, 1.569674, 1, 1, 1, 1, 1,
0.9443235, 0.6133948, 0.2424236, 1, 1, 1, 1, 1,
0.9449834, -0.6019014, 3.526272, 1, 1, 1, 1, 1,
0.9451337, -2.027789, 1.767136, 1, 1, 1, 1, 1,
0.947555, -2.007166, 2.33997, 1, 1, 1, 1, 1,
0.9522583, -0.2654255, 0.04646475, 0, 0, 1, 1, 1,
0.9568974, -1.203308, 1.696261, 1, 0, 0, 1, 1,
0.9574656, 0.6567205, 1.836035, 1, 0, 0, 1, 1,
0.9594119, 0.6630894, 3.158713, 1, 0, 0, 1, 1,
0.9686933, 0.112259, 2.450277, 1, 0, 0, 1, 1,
0.9779429, 0.4302465, 1.641485, 1, 0, 0, 1, 1,
0.9949303, 0.4976319, 1.573502, 0, 0, 0, 1, 1,
1.005726, -0.6708071, 1.61109, 0, 0, 0, 1, 1,
1.009663, -0.578658, 0.9708217, 0, 0, 0, 1, 1,
1.010413, 0.6686661, 2.39694, 0, 0, 0, 1, 1,
1.011358, 0.1554396, 2.798884, 0, 0, 0, 1, 1,
1.013213, -0.01832478, 2.482132, 0, 0, 0, 1, 1,
1.016181, 1.333276, 0.5227379, 0, 0, 0, 1, 1,
1.020873, -0.2080064, 1.145155, 1, 1, 1, 1, 1,
1.021678, 0.06991063, 0.8387104, 1, 1, 1, 1, 1,
1.026008, 1.979001, -0.2214839, 1, 1, 1, 1, 1,
1.026179, 0.4695399, 1.363691, 1, 1, 1, 1, 1,
1.026297, 0.3728332, 0.7004613, 1, 1, 1, 1, 1,
1.02679, -1.112935, 3.887476, 1, 1, 1, 1, 1,
1.029013, 1.687192, -0.2442753, 1, 1, 1, 1, 1,
1.054954, 0.5923377, 1.402765, 1, 1, 1, 1, 1,
1.055354, -0.6906497, 2.718411, 1, 1, 1, 1, 1,
1.073118, 1.011476, 0.004557192, 1, 1, 1, 1, 1,
1.076354, 0.589056, 0.8566619, 1, 1, 1, 1, 1,
1.079544, 1.242414, 0.07669931, 1, 1, 1, 1, 1,
1.097642, 1.034719, 2.467909, 1, 1, 1, 1, 1,
1.101569, -2.188566, 4.038006, 1, 1, 1, 1, 1,
1.10786, 0.6156012, 0.971053, 1, 1, 1, 1, 1,
1.111713, -0.7979073, 1.942378, 0, 0, 1, 1, 1,
1.115134, 0.04441597, 0.5785464, 1, 0, 0, 1, 1,
1.115272, -0.853616, 2.101515, 1, 0, 0, 1, 1,
1.126823, -0.4260822, 1.496989, 1, 0, 0, 1, 1,
1.130128, 0.144234, 0.8478128, 1, 0, 0, 1, 1,
1.131522, -1.05452, 3.559565, 1, 0, 0, 1, 1,
1.134453, -0.2219867, 2.822981, 0, 0, 0, 1, 1,
1.142485, -1.514206, 2.429366, 0, 0, 0, 1, 1,
1.151153, -0.3364753, 0.1544938, 0, 0, 0, 1, 1,
1.156358, 0.4335194, 1.242812, 0, 0, 0, 1, 1,
1.159737, -0.1229493, 1.735594, 0, 0, 0, 1, 1,
1.159806, -0.4482591, 1.014883, 0, 0, 0, 1, 1,
1.162122, 0.2962461, 1.530911, 0, 0, 0, 1, 1,
1.164409, -1.176791, 2.300903, 1, 1, 1, 1, 1,
1.168085, -1.083981, 3.581329, 1, 1, 1, 1, 1,
1.170727, 1.85648, 1.356239, 1, 1, 1, 1, 1,
1.183546, 0.1073162, 1.356688, 1, 1, 1, 1, 1,
1.189836, 1.873134, 1.150049, 1, 1, 1, 1, 1,
1.190285, 0.7797813, 1.100587, 1, 1, 1, 1, 1,
1.200426, -0.3132986, 2.889381, 1, 1, 1, 1, 1,
1.212296, 0.282509, 0.7576115, 1, 1, 1, 1, 1,
1.213726, 1.784774, 0.2902655, 1, 1, 1, 1, 1,
1.22053, -1.719151, 2.936338, 1, 1, 1, 1, 1,
1.225284, 1.244561, 0.3297597, 1, 1, 1, 1, 1,
1.234351, 0.1624855, 2.752069, 1, 1, 1, 1, 1,
1.237031, 1.372376, 1.233861, 1, 1, 1, 1, 1,
1.242803, 1.258214, 0.2322806, 1, 1, 1, 1, 1,
1.255607, 0.7600232, 1.463523, 1, 1, 1, 1, 1,
1.255717, -0.3184719, 0.7466305, 0, 0, 1, 1, 1,
1.256555, 0.06007924, 0.3192717, 1, 0, 0, 1, 1,
1.259585, 1.209683, 0.03540435, 1, 0, 0, 1, 1,
1.275067, -0.4608506, 4.429209, 1, 0, 0, 1, 1,
1.278903, 1.389032, 2.020311, 1, 0, 0, 1, 1,
1.291192, -0.2817103, 2.414927, 1, 0, 0, 1, 1,
1.294388, 2.095892, 2.012661, 0, 0, 0, 1, 1,
1.297111, -2.073427, 1.207301, 0, 0, 0, 1, 1,
1.303323, 0.8729958, 2.468843, 0, 0, 0, 1, 1,
1.305167, 0.1928301, 0.6468199, 0, 0, 0, 1, 1,
1.312776, 0.4067737, 0.4630632, 0, 0, 0, 1, 1,
1.318256, 1.136619, 2.245368, 0, 0, 0, 1, 1,
1.324762, 0.1420833, 0.9744489, 0, 0, 0, 1, 1,
1.326087, -0.2407524, 2.752542, 1, 1, 1, 1, 1,
1.326773, -0.475828, 1.428593, 1, 1, 1, 1, 1,
1.335484, 0.3211984, 1.596277, 1, 1, 1, 1, 1,
1.336303, -2.464605, 4.184323, 1, 1, 1, 1, 1,
1.339914, -1.36824, 2.238428, 1, 1, 1, 1, 1,
1.346705, 0.8217399, 2.698079, 1, 1, 1, 1, 1,
1.347358, -0.1270009, 0.02294975, 1, 1, 1, 1, 1,
1.349129, -0.339833, 2.086601, 1, 1, 1, 1, 1,
1.352431, 0.7799861, 1.007299, 1, 1, 1, 1, 1,
1.353686, -0.2971258, 1.049692, 1, 1, 1, 1, 1,
1.356955, 0.2961422, 1.629933, 1, 1, 1, 1, 1,
1.361772, 0.577135, 1.224894, 1, 1, 1, 1, 1,
1.361902, -0.8295336, 1.515055, 1, 1, 1, 1, 1,
1.365404, 0.1558899, 0.9736432, 1, 1, 1, 1, 1,
1.366999, -0.9135036, 2.635357, 1, 1, 1, 1, 1,
1.384942, 1.429846, 1.667957, 0, 0, 1, 1, 1,
1.385998, 0.4514555, 2.006308, 1, 0, 0, 1, 1,
1.408528, 0.02857682, -0.09078953, 1, 0, 0, 1, 1,
1.410057, 1.854825, -0.01415941, 1, 0, 0, 1, 1,
1.419097, 0.3290667, 2.447911, 1, 0, 0, 1, 1,
1.423116, -0.3797618, 0.6390947, 1, 0, 0, 1, 1,
1.43382, 0.7135728, 1.480239, 0, 0, 0, 1, 1,
1.450981, 0.001378226, 1.1731, 0, 0, 0, 1, 1,
1.45462, 0.7852743, 0.8493957, 0, 0, 0, 1, 1,
1.455102, -2.108008, 1.327376, 0, 0, 0, 1, 1,
1.459118, -0.03826614, 2.757168, 0, 0, 0, 1, 1,
1.464214, 0.01539156, 2.679294, 0, 0, 0, 1, 1,
1.477916, 0.01183705, 3.180173, 0, 0, 0, 1, 1,
1.494344, -1.936659, 2.121711, 1, 1, 1, 1, 1,
1.51837, 1.349608, 0.6561239, 1, 1, 1, 1, 1,
1.523884, -0.09496372, 2.254349, 1, 1, 1, 1, 1,
1.526081, 0.6336948, 1.780614, 1, 1, 1, 1, 1,
1.528493, 1.285189, 2.054657, 1, 1, 1, 1, 1,
1.533693, -0.2086998, 3.019771, 1, 1, 1, 1, 1,
1.567963, 0.2910968, 2.42676, 1, 1, 1, 1, 1,
1.630155, 0.3143595, 1.384997, 1, 1, 1, 1, 1,
1.637911, 2.508213, 2.581873, 1, 1, 1, 1, 1,
1.648133, -0.3297599, 2.069853, 1, 1, 1, 1, 1,
1.670975, -0.2008488, 1.90258, 1, 1, 1, 1, 1,
1.673179, 0.3121, 0.9287937, 1, 1, 1, 1, 1,
1.6886, -1.76792, 2.69212, 1, 1, 1, 1, 1,
1.69333, -2.330728, 2.636033, 1, 1, 1, 1, 1,
1.696781, 0.2559565, 1.918281, 1, 1, 1, 1, 1,
1.70457, 0.1282804, 1.73221, 0, 0, 1, 1, 1,
1.712885, -0.9046646, 1.348182, 1, 0, 0, 1, 1,
1.713636, 0.1775152, 1.743742, 1, 0, 0, 1, 1,
1.732059, 0.458068, 0.5691608, 1, 0, 0, 1, 1,
1.738158, 0.2548423, 1.420452, 1, 0, 0, 1, 1,
1.753665, 1.960643, 2.041008, 1, 0, 0, 1, 1,
1.774307, 0.6647487, 1.231218, 0, 0, 0, 1, 1,
1.794945, -0.4859095, 0.04538884, 0, 0, 0, 1, 1,
1.817861, 0.6176987, 1.204965, 0, 0, 0, 1, 1,
1.828647, -1.423381, 1.56702, 0, 0, 0, 1, 1,
1.828859, 1.863454, 2.132045, 0, 0, 0, 1, 1,
1.843755, 1.265325, 1.617235, 0, 0, 0, 1, 1,
1.88071, -0.8731925, 2.09915, 0, 0, 0, 1, 1,
1.894849, 1.508544, 1.206747, 1, 1, 1, 1, 1,
1.904142, 0.2558909, 1.382398, 1, 1, 1, 1, 1,
1.909608, 1.379869, 1.93506, 1, 1, 1, 1, 1,
1.92707, -0.08079275, 1.034777, 1, 1, 1, 1, 1,
1.956605, -0.1405553, 2.704469, 1, 1, 1, 1, 1,
1.960099, 0.560858, 1.663845, 1, 1, 1, 1, 1,
1.997475, 1.267713, 0.3910769, 1, 1, 1, 1, 1,
2.003453, 0.8122627, -0.09866055, 1, 1, 1, 1, 1,
2.011162, -1.003209, 0.377099, 1, 1, 1, 1, 1,
2.013603, 0.6195291, 0.9099488, 1, 1, 1, 1, 1,
2.018836, -1.273429, 1.072245, 1, 1, 1, 1, 1,
2.024273, 1.226074, 1.941808, 1, 1, 1, 1, 1,
2.075617, -2.04435, 0.8432255, 1, 1, 1, 1, 1,
2.1062, -0.6944423, 2.085994, 1, 1, 1, 1, 1,
2.127172, -0.4402446, 2.169768, 1, 1, 1, 1, 1,
2.142531, -0.2482571, 1.166465, 0, 0, 1, 1, 1,
2.143899, -0.0976356, 2.103441, 1, 0, 0, 1, 1,
2.156764, 0.9580722, 2.560159, 1, 0, 0, 1, 1,
2.209697, -0.2478033, 0.5193439, 1, 0, 0, 1, 1,
2.265402, 1.449807, 0.5340163, 1, 0, 0, 1, 1,
2.271893, -0.3260312, 1.321474, 1, 0, 0, 1, 1,
2.288035, -0.06392774, 3.40683, 0, 0, 0, 1, 1,
2.317647, -1.402972, 2.518192, 0, 0, 0, 1, 1,
2.338326, -0.2325314, 3.085753, 0, 0, 0, 1, 1,
2.340267, -0.9391558, 1.164465, 0, 0, 0, 1, 1,
2.346617, -0.2011288, 1.778741, 0, 0, 0, 1, 1,
2.346863, -2.160006, 2.978634, 0, 0, 0, 1, 1,
2.363419, -0.6653546, 2.747069, 0, 0, 0, 1, 1,
2.428942, 0.2127706, 2.666442, 1, 1, 1, 1, 1,
2.440643, 1.653794, 0.2770177, 1, 1, 1, 1, 1,
2.441141, -2.152059, 1.497884, 1, 1, 1, 1, 1,
2.458947, 0.895272, -0.5278318, 1, 1, 1, 1, 1,
2.988061, 0.7655213, 1.116823, 1, 1, 1, 1, 1,
3.019498, -0.3808697, 0.1031981, 1, 1, 1, 1, 1,
3.107173, 2.005805, 0.6953499, 1, 1, 1, 1, 1
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
var radius = 9.426698;
var distance = 33.11087;
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
mvMatrix.translate( 0.04614615, -0.3214198, -0.07968664 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11087);
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