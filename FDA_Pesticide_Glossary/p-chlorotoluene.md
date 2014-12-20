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
-3.294718, -1.676746, -2.26668, 1, 0, 0, 1,
-3.015594, -1.98775, -1.556984, 1, 0.007843138, 0, 1,
-2.839421, -1.305447, -2.953833, 1, 0.01176471, 0, 1,
-2.821173, 0.0644204, -1.311153, 1, 0.01960784, 0, 1,
-2.81211, 1.572258, -0.8752595, 1, 0.02352941, 0, 1,
-2.518833, -0.1669861, 0.1067156, 1, 0.03137255, 0, 1,
-2.492027, -1.491264, -3.106452, 1, 0.03529412, 0, 1,
-2.452693, -0.05911531, -0.4830267, 1, 0.04313726, 0, 1,
-2.40455, -0.663951, -2.103457, 1, 0.04705882, 0, 1,
-2.350826, -0.4468146, -1.552459, 1, 0.05490196, 0, 1,
-2.329521, -0.02749645, -2.427887, 1, 0.05882353, 0, 1,
-2.287074, -1.689637, -3.805389, 1, 0.06666667, 0, 1,
-2.229052, 0.3008316, -2.262638, 1, 0.07058824, 0, 1,
-2.218179, 1.202654, -2.228115, 1, 0.07843138, 0, 1,
-2.155678, 0.5971084, -1.012195, 1, 0.08235294, 0, 1,
-2.152477, -0.09345751, -1.267494, 1, 0.09019608, 0, 1,
-2.087081, -0.2796206, -2.428254, 1, 0.09411765, 0, 1,
-2.06706, 0.4710959, 0.3648554, 1, 0.1019608, 0, 1,
-2.039053, 0.6087811, 0.3085489, 1, 0.1098039, 0, 1,
-2.025362, -0.6552317, -1.336449, 1, 0.1137255, 0, 1,
-2.00706, 0.4968334, -0.9897198, 1, 0.1215686, 0, 1,
-1.990683, -0.960492, -1.432726, 1, 0.1254902, 0, 1,
-1.983917, 1.001003, -0.7938624, 1, 0.1333333, 0, 1,
-1.977713, 1.222664, -1.050783, 1, 0.1372549, 0, 1,
-1.954688, 0.1247435, -1.88806, 1, 0.145098, 0, 1,
-1.942869, 0.3885697, -1.961667, 1, 0.1490196, 0, 1,
-1.938718, -0.5568423, -1.401954, 1, 0.1568628, 0, 1,
-1.937107, -0.4733116, -2.65444, 1, 0.1607843, 0, 1,
-1.901628, -0.7200326, -0.7364286, 1, 0.1686275, 0, 1,
-1.89503, 0.1979036, -0.3011846, 1, 0.172549, 0, 1,
-1.887262, -0.2705609, -1.057569, 1, 0.1803922, 0, 1,
-1.882056, 0.5430829, -2.231423, 1, 0.1843137, 0, 1,
-1.872697, 0.2576879, -2.514159, 1, 0.1921569, 0, 1,
-1.862551, -0.2170803, -2.488309, 1, 0.1960784, 0, 1,
-1.848106, 0.3348905, -1.070598, 1, 0.2039216, 0, 1,
-1.813962, -0.2460457, -1.744928, 1, 0.2117647, 0, 1,
-1.799541, 1.380834, 1.978852, 1, 0.2156863, 0, 1,
-1.789502, 1.578874, -2.153054, 1, 0.2235294, 0, 1,
-1.781123, -0.6186237, -2.982363, 1, 0.227451, 0, 1,
-1.77553, -1.804846, -2.761068, 1, 0.2352941, 0, 1,
-1.7664, -0.5956955, -1.259679, 1, 0.2392157, 0, 1,
-1.751058, -1.168406, -1.025703, 1, 0.2470588, 0, 1,
-1.741377, -0.3260162, -1.559092, 1, 0.2509804, 0, 1,
-1.73774, -1.580776, -2.970583, 1, 0.2588235, 0, 1,
-1.725441, 0.6281432, -0.9585171, 1, 0.2627451, 0, 1,
-1.720449, 0.2565568, -2.378931, 1, 0.2705882, 0, 1,
-1.718874, -0.7361782, -1.711484, 1, 0.2745098, 0, 1,
-1.716786, -1.848175, -4.159914, 1, 0.282353, 0, 1,
-1.690094, -0.3748196, -5.557015, 1, 0.2862745, 0, 1,
-1.687393, 0.1434039, -0.4220385, 1, 0.2941177, 0, 1,
-1.683984, -0.003022695, -0.4683734, 1, 0.3019608, 0, 1,
-1.683159, -0.2757114, -1.247274, 1, 0.3058824, 0, 1,
-1.68128, -0.9342744, -2.650148, 1, 0.3137255, 0, 1,
-1.660552, -0.3415034, -1.710032, 1, 0.3176471, 0, 1,
-1.659063, 2.064926, -1.31474, 1, 0.3254902, 0, 1,
-1.637124, 1.17516, 0.1530976, 1, 0.3294118, 0, 1,
-1.630867, -1.494013, -1.753912, 1, 0.3372549, 0, 1,
-1.625034, -1.263013, -2.733463, 1, 0.3411765, 0, 1,
-1.618803, -2.564363, -3.363786, 1, 0.3490196, 0, 1,
-1.602417, 0.8263917, -0.3768859, 1, 0.3529412, 0, 1,
-1.597025, 0.2138219, -0.237107, 1, 0.3607843, 0, 1,
-1.59564, -0.06328268, -0.8886994, 1, 0.3647059, 0, 1,
-1.561072, 0.7237476, -0.8750099, 1, 0.372549, 0, 1,
-1.553277, 0.5166818, -0.7074463, 1, 0.3764706, 0, 1,
-1.552192, 0.2627636, 1.086761, 1, 0.3843137, 0, 1,
-1.546902, 0.1249294, -1.07292, 1, 0.3882353, 0, 1,
-1.531333, 2.666284, -2.7138, 1, 0.3960784, 0, 1,
-1.512457, -0.3877356, -2.569207, 1, 0.4039216, 0, 1,
-1.502591, -2.807189, -2.476518, 1, 0.4078431, 0, 1,
-1.499322, 0.9102464, -1.107214, 1, 0.4156863, 0, 1,
-1.496991, -0.1232024, -2.794508, 1, 0.4196078, 0, 1,
-1.485775, -0.01820167, -2.76513, 1, 0.427451, 0, 1,
-1.480427, 0.7381678, -0.3077265, 1, 0.4313726, 0, 1,
-1.479869, 1.051778, -2.322309, 1, 0.4392157, 0, 1,
-1.464638, 0.5674325, -1.975832, 1, 0.4431373, 0, 1,
-1.461973, 1.190146, -0.5409409, 1, 0.4509804, 0, 1,
-1.445615, 0.5393402, -1.4563, 1, 0.454902, 0, 1,
-1.441664, 0.09647173, -2.504484, 1, 0.4627451, 0, 1,
-1.431977, 1.393221, -4.38732, 1, 0.4666667, 0, 1,
-1.430372, -0.8559011, -3.612956, 1, 0.4745098, 0, 1,
-1.428351, 0.03843237, -1.84771, 1, 0.4784314, 0, 1,
-1.423825, -0.3752179, -0.4043621, 1, 0.4862745, 0, 1,
-1.393642, -1.216081, -4.899861, 1, 0.4901961, 0, 1,
-1.389156, -0.1195784, -2.608024, 1, 0.4980392, 0, 1,
-1.383034, 0.4150653, -1.524684, 1, 0.5058824, 0, 1,
-1.374722, -0.7155253, -1.545156, 1, 0.509804, 0, 1,
-1.372714, -0.8518514, -1.275008, 1, 0.5176471, 0, 1,
-1.36658, -0.7390452, -2.537186, 1, 0.5215687, 0, 1,
-1.350003, 0.3120898, -2.169862, 1, 0.5294118, 0, 1,
-1.343751, -0.5073254, -0.1362723, 1, 0.5333334, 0, 1,
-1.343087, 0.7586334, -1.029239, 1, 0.5411765, 0, 1,
-1.340483, 0.5920104, -1.273925, 1, 0.5450981, 0, 1,
-1.322331, 1.015489, -1.056025, 1, 0.5529412, 0, 1,
-1.321952, -0.7625561, -3.479246, 1, 0.5568628, 0, 1,
-1.320856, 0.1516345, -1.73024, 1, 0.5647059, 0, 1,
-1.318858, -1.142286, -1.989356, 1, 0.5686275, 0, 1,
-1.31617, 0.754454, -1.607034, 1, 0.5764706, 0, 1,
-1.303168, -0.9376305, -3.043061, 1, 0.5803922, 0, 1,
-1.290298, -0.1029148, -3.437172, 1, 0.5882353, 0, 1,
-1.289162, -0.2351584, -2.146068, 1, 0.5921569, 0, 1,
-1.283239, 0.3844084, -2.046993, 1, 0.6, 0, 1,
-1.279229, -0.276258, -1.267763, 1, 0.6078432, 0, 1,
-1.277954, 0.07381327, 0.1703369, 1, 0.6117647, 0, 1,
-1.2745, -0.4260682, -0.3505951, 1, 0.6196079, 0, 1,
-1.271722, 1.718829, -0.5399948, 1, 0.6235294, 0, 1,
-1.269223, -0.8264984, -3.361164, 1, 0.6313726, 0, 1,
-1.2637, -0.4993941, -0.4460619, 1, 0.6352941, 0, 1,
-1.26348, 0.937122, -2.495647, 1, 0.6431373, 0, 1,
-1.259049, -1.150312, -1.519875, 1, 0.6470588, 0, 1,
-1.255504, -1.299422, -2.848499, 1, 0.654902, 0, 1,
-1.250817, 1.736889, -0.3807665, 1, 0.6588235, 0, 1,
-1.24785, 2.136448, -1.355003, 1, 0.6666667, 0, 1,
-1.247494, -2.976291, -4.095488, 1, 0.6705883, 0, 1,
-1.240769, 1.29062, -1.744022, 1, 0.6784314, 0, 1,
-1.239764, -0.7154396, -3.284504, 1, 0.682353, 0, 1,
-1.238812, 0.9827569, -0.6334921, 1, 0.6901961, 0, 1,
-1.234693, 0.01627722, -1.028729, 1, 0.6941177, 0, 1,
-1.222604, -0.332867, -3.286275, 1, 0.7019608, 0, 1,
-1.221905, -2.037017, -2.165826, 1, 0.7098039, 0, 1,
-1.218679, 0.5007932, 0.1850153, 1, 0.7137255, 0, 1,
-1.216271, 1.080595, -2.365896, 1, 0.7215686, 0, 1,
-1.214343, -0.4952561, -2.063549, 1, 0.7254902, 0, 1,
-1.204374, -0.1487826, -1.010683, 1, 0.7333333, 0, 1,
-1.20367, 1.604141, -1.361365, 1, 0.7372549, 0, 1,
-1.195239, 1.022764, -0.7952645, 1, 0.7450981, 0, 1,
-1.192521, 2.298514, -2.648219, 1, 0.7490196, 0, 1,
-1.189126, 1.157964, -1.607164, 1, 0.7568628, 0, 1,
-1.169159, -0.1408952, -2.127351, 1, 0.7607843, 0, 1,
-1.158235, 0.7719001, 0.2697022, 1, 0.7686275, 0, 1,
-1.157346, 0.07002115, -0.4045398, 1, 0.772549, 0, 1,
-1.156701, -0.08848332, -0.2118766, 1, 0.7803922, 0, 1,
-1.152642, -0.3922211, -3.000787, 1, 0.7843137, 0, 1,
-1.140967, -0.9175917, -2.535452, 1, 0.7921569, 0, 1,
-1.131101, 0.6451832, -0.6305342, 1, 0.7960784, 0, 1,
-1.127198, -2.775658, -1.622643, 1, 0.8039216, 0, 1,
-1.125363, -0.4669813, -1.675689, 1, 0.8117647, 0, 1,
-1.12456, 2.12163, 0.004959033, 1, 0.8156863, 0, 1,
-1.12325, -1.662346, -2.8436, 1, 0.8235294, 0, 1,
-1.114134, -1.378078, -2.687199, 1, 0.827451, 0, 1,
-1.112945, 0.03796174, -0.8524057, 1, 0.8352941, 0, 1,
-1.112593, -1.503733, -2.298092, 1, 0.8392157, 0, 1,
-1.108057, -0.1028212, -2.302263, 1, 0.8470588, 0, 1,
-1.10686, -0.9209368, -2.741109, 1, 0.8509804, 0, 1,
-1.094834, 0.8997241, -2.373195, 1, 0.8588235, 0, 1,
-1.09336, 0.03151141, 0.5312347, 1, 0.8627451, 0, 1,
-1.093173, -0.763324, -3.397019, 1, 0.8705882, 0, 1,
-1.089409, 0.171131, -0.7784613, 1, 0.8745098, 0, 1,
-1.088927, 0.6894282, -2.559403, 1, 0.8823529, 0, 1,
-1.088736, 0.6564454, -0.1973772, 1, 0.8862745, 0, 1,
-1.07455, -0.6917394, -2.450027, 1, 0.8941177, 0, 1,
-1.074343, -0.7079118, -2.402819, 1, 0.8980392, 0, 1,
-1.067283, 0.3808644, -1.90622, 1, 0.9058824, 0, 1,
-1.066143, 0.7082608, -1.537848, 1, 0.9137255, 0, 1,
-1.063975, -0.7077377, -1.714011, 1, 0.9176471, 0, 1,
-1.060414, -1.597971, -1.51729, 1, 0.9254902, 0, 1,
-1.054642, 0.1877598, -2.371634, 1, 0.9294118, 0, 1,
-1.054166, -0.9908627, -2.709234, 1, 0.9372549, 0, 1,
-1.053984, 1.912114, 0.4991375, 1, 0.9411765, 0, 1,
-1.052226, 0.8306029, -1.563976, 1, 0.9490196, 0, 1,
-1.051378, -0.4653052, -2.059502, 1, 0.9529412, 0, 1,
-1.048843, -0.6706384, 0.1070643, 1, 0.9607843, 0, 1,
-1.04728, -0.7537477, -1.594867, 1, 0.9647059, 0, 1,
-1.045233, -0.6041048, -3.490335, 1, 0.972549, 0, 1,
-1.045138, -0.8712431, -3.922186, 1, 0.9764706, 0, 1,
-1.031863, -0.6688144, -2.663018, 1, 0.9843137, 0, 1,
-1.027304, -0.7461521, -1.470716, 1, 0.9882353, 0, 1,
-1.026121, -0.954993, -3.999412, 1, 0.9960784, 0, 1,
-1.026043, -0.6140888, -0.1152361, 0.9960784, 1, 0, 1,
-1.023068, -1.36528, -3.301145, 0.9921569, 1, 0, 1,
-1.02236, 0.9704363, -0.9487049, 0.9843137, 1, 0, 1,
-1.021897, 0.6308841, -0.544512, 0.9803922, 1, 0, 1,
-1.020511, 0.1280416, -0.6187052, 0.972549, 1, 0, 1,
-1.018287, -0.02418067, -1.955349, 0.9686275, 1, 0, 1,
-1.015023, -0.6591458, -2.519104, 0.9607843, 1, 0, 1,
-1.013461, 2.188539, -0.5625138, 0.9568627, 1, 0, 1,
-1.010539, -0.3122522, -1.902378, 0.9490196, 1, 0, 1,
-1.008047, 0.1273212, -0.1790409, 0.945098, 1, 0, 1,
-1.007725, 0.1941028, -3.170629, 0.9372549, 1, 0, 1,
-0.9934174, 0.08314855, -1.915971, 0.9333333, 1, 0, 1,
-0.9887996, -2.367011, -2.578151, 0.9254902, 1, 0, 1,
-0.98729, -1.242877, -2.723778, 0.9215686, 1, 0, 1,
-0.9871936, -0.5959793, -0.4555281, 0.9137255, 1, 0, 1,
-0.9795097, 0.1637222, 0.2846119, 0.9098039, 1, 0, 1,
-0.9765014, -1.738907, -2.64925, 0.9019608, 1, 0, 1,
-0.9652604, -0.8200915, -0.7655388, 0.8941177, 1, 0, 1,
-0.9578453, -0.4711897, -2.212596, 0.8901961, 1, 0, 1,
-0.9551108, -1.063322, -3.086783, 0.8823529, 1, 0, 1,
-0.949183, -0.7404881, -1.270339, 0.8784314, 1, 0, 1,
-0.9474868, -1.739125, -2.508455, 0.8705882, 1, 0, 1,
-0.9256336, -0.1455449, -0.7661255, 0.8666667, 1, 0, 1,
-0.9207141, 0.82217, 1.722135, 0.8588235, 1, 0, 1,
-0.917612, -0.5599064, -1.683518, 0.854902, 1, 0, 1,
-0.9126359, 1.610012, -1.592595, 0.8470588, 1, 0, 1,
-0.9107765, 1.138665, -1.025561, 0.8431373, 1, 0, 1,
-0.9087444, -0.3076063, -2.10222, 0.8352941, 1, 0, 1,
-0.895725, -0.5171779, -1.927227, 0.8313726, 1, 0, 1,
-0.8851895, 0.6367588, -0.9075662, 0.8235294, 1, 0, 1,
-0.8809509, 1.915927, 0.3290494, 0.8196079, 1, 0, 1,
-0.8725103, 0.9702127, -0.868395, 0.8117647, 1, 0, 1,
-0.8688083, 0.4641018, -1.157197, 0.8078431, 1, 0, 1,
-0.8676754, 0.1387143, -2.349154, 0.8, 1, 0, 1,
-0.8654101, 0.4564272, -1.197405, 0.7921569, 1, 0, 1,
-0.8624581, -0.285621, -1.681885, 0.7882353, 1, 0, 1,
-0.8619593, -0.9349069, -2.015073, 0.7803922, 1, 0, 1,
-0.8574312, 0.3928404, -2.142531, 0.7764706, 1, 0, 1,
-0.8555478, -0.925875, -2.369086, 0.7686275, 1, 0, 1,
-0.8528508, -0.9566261, -2.1408, 0.7647059, 1, 0, 1,
-0.8468433, -0.5116862, -3.119407, 0.7568628, 1, 0, 1,
-0.84187, 0.5593939, -1.06957, 0.7529412, 1, 0, 1,
-0.8341062, 0.6099494, -0.9593614, 0.7450981, 1, 0, 1,
-0.8292924, -0.2523696, -0.6497474, 0.7411765, 1, 0, 1,
-0.8219216, -0.6716449, -3.149896, 0.7333333, 1, 0, 1,
-0.8176825, -0.4080347, -0.4652165, 0.7294118, 1, 0, 1,
-0.8140808, -0.5044054, -2.531589, 0.7215686, 1, 0, 1,
-0.8129426, -0.487951, -1.760898, 0.7176471, 1, 0, 1,
-0.8121381, -0.2487119, -3.596626, 0.7098039, 1, 0, 1,
-0.8115878, 0.8978792, -1.242553, 0.7058824, 1, 0, 1,
-0.8066546, 0.3869338, 0.3432787, 0.6980392, 1, 0, 1,
-0.8028687, -0.8717169, -3.084165, 0.6901961, 1, 0, 1,
-0.7911546, 0.0307765, -2.693324, 0.6862745, 1, 0, 1,
-0.7848113, -1.017502, -3.693293, 0.6784314, 1, 0, 1,
-0.7787508, 0.2472513, -0.3589862, 0.6745098, 1, 0, 1,
-0.7706097, -0.7580495, -3.56512, 0.6666667, 1, 0, 1,
-0.7677718, -1.41965, -2.245161, 0.6627451, 1, 0, 1,
-0.7652129, -0.03904214, -0.7014362, 0.654902, 1, 0, 1,
-0.7629195, -0.916353, -2.064642, 0.6509804, 1, 0, 1,
-0.7560062, -0.7140769, -2.924411, 0.6431373, 1, 0, 1,
-0.7504938, -0.4825244, -1.651107, 0.6392157, 1, 0, 1,
-0.7467445, -0.3566266, -3.266711, 0.6313726, 1, 0, 1,
-0.7466024, -2.289814, -2.060385, 0.627451, 1, 0, 1,
-0.7418262, -1.745018, -1.615941, 0.6196079, 1, 0, 1,
-0.7340562, 1.15821, 0.1273087, 0.6156863, 1, 0, 1,
-0.7331268, -0.7346882, -3.266454, 0.6078432, 1, 0, 1,
-0.7308578, 1.749629, 0.5307462, 0.6039216, 1, 0, 1,
-0.724272, 2.297396, 0.4091939, 0.5960785, 1, 0, 1,
-0.7183647, -1.376281, -3.257968, 0.5882353, 1, 0, 1,
-0.718147, 1.044574, -0.7531567, 0.5843138, 1, 0, 1,
-0.7166767, 1.642702, 0.4996984, 0.5764706, 1, 0, 1,
-0.7155004, 0.8195679, -1.251072, 0.572549, 1, 0, 1,
-0.7148482, -0.4136001, -0.6813266, 0.5647059, 1, 0, 1,
-0.7135127, -0.5125754, -2.742884, 0.5607843, 1, 0, 1,
-0.71303, 0.3613018, -1.880237, 0.5529412, 1, 0, 1,
-0.7122704, 0.3830373, -0.9698434, 0.5490196, 1, 0, 1,
-0.7111982, -0.1442833, -1.618345, 0.5411765, 1, 0, 1,
-0.6994786, 0.05874975, -2.048171, 0.5372549, 1, 0, 1,
-0.6973364, 1.387307, -0.587222, 0.5294118, 1, 0, 1,
-0.6940584, -0.9902281, -2.213614, 0.5254902, 1, 0, 1,
-0.692334, -0.3304738, -2.148166, 0.5176471, 1, 0, 1,
-0.6848431, -1.242916, -1.976046, 0.5137255, 1, 0, 1,
-0.6836687, 0.6018058, -2.337617, 0.5058824, 1, 0, 1,
-0.6796975, 1.428369, -0.4857841, 0.5019608, 1, 0, 1,
-0.6792948, 0.1988222, -0.4273298, 0.4941176, 1, 0, 1,
-0.6771861, 0.1402527, -1.387678, 0.4862745, 1, 0, 1,
-0.675655, -2.302085, -2.783746, 0.4823529, 1, 0, 1,
-0.674386, -0.1957975, -1.403009, 0.4745098, 1, 0, 1,
-0.6713454, 0.1666775, 0.1043859, 0.4705882, 1, 0, 1,
-0.6636788, 0.09457941, -1.888416, 0.4627451, 1, 0, 1,
-0.6595201, 1.031419, -0.1343568, 0.4588235, 1, 0, 1,
-0.6580192, 0.01780262, -3.535996, 0.4509804, 1, 0, 1,
-0.6579538, -0.6733581, -1.791686, 0.4470588, 1, 0, 1,
-0.6572719, 0.2394309, -2.398193, 0.4392157, 1, 0, 1,
-0.6518891, -1.94, -2.665528, 0.4352941, 1, 0, 1,
-0.6477363, -2.052001, -2.727161, 0.427451, 1, 0, 1,
-0.646336, 0.4693958, -2.231246, 0.4235294, 1, 0, 1,
-0.6370237, 0.483252, -2.710546, 0.4156863, 1, 0, 1,
-0.6339987, 0.3352336, -1.671279, 0.4117647, 1, 0, 1,
-0.630474, 0.6594743, 0.04991782, 0.4039216, 1, 0, 1,
-0.6234509, 0.5888324, -1.905413, 0.3960784, 1, 0, 1,
-0.6233926, 0.0706126, -1.188127, 0.3921569, 1, 0, 1,
-0.6155373, -1.905815, -2.10101, 0.3843137, 1, 0, 1,
-0.6140369, -1.131901, -2.436709, 0.3803922, 1, 0, 1,
-0.6133214, 0.5550668, -1.685348, 0.372549, 1, 0, 1,
-0.6100932, 2.527261, 1.29775, 0.3686275, 1, 0, 1,
-0.6092618, -0.7673312, -3.127095, 0.3607843, 1, 0, 1,
-0.6076675, 0.7169201, -1.830097, 0.3568628, 1, 0, 1,
-0.6044186, -0.7357218, -3.086237, 0.3490196, 1, 0, 1,
-0.6036755, 0.008978559, -1.502425, 0.345098, 1, 0, 1,
-0.6033418, -1.458084, -2.7403, 0.3372549, 1, 0, 1,
-0.6025245, -0.2290604, -1.722022, 0.3333333, 1, 0, 1,
-0.5989211, 0.5707508, -0.2446559, 0.3254902, 1, 0, 1,
-0.5944261, 0.2093193, -0.9740201, 0.3215686, 1, 0, 1,
-0.5784341, -0.1280835, -2.251497, 0.3137255, 1, 0, 1,
-0.5775483, -2.312603, -3.485728, 0.3098039, 1, 0, 1,
-0.5725248, 0.7312485, -1.749762, 0.3019608, 1, 0, 1,
-0.5720523, -0.5109971, -1.950843, 0.2941177, 1, 0, 1,
-0.5717394, -0.7912196, -2.407605, 0.2901961, 1, 0, 1,
-0.5696957, -0.3354475, -2.363916, 0.282353, 1, 0, 1,
-0.5696803, -0.6860284, -3.800919, 0.2784314, 1, 0, 1,
-0.5660395, 0.3365046, -1.826977, 0.2705882, 1, 0, 1,
-0.5615313, 1.38671, -0.6698894, 0.2666667, 1, 0, 1,
-0.5603073, 0.3295397, -1.136439, 0.2588235, 1, 0, 1,
-0.5584325, -1.532968, -2.873208, 0.254902, 1, 0, 1,
-0.5567046, 0.5447349, -2.274321, 0.2470588, 1, 0, 1,
-0.5547751, -0.78008, -2.30127, 0.2431373, 1, 0, 1,
-0.547456, 0.2968234, 0.01505841, 0.2352941, 1, 0, 1,
-0.5468965, -0.4602078, -2.748645, 0.2313726, 1, 0, 1,
-0.5448238, 0.9966096, -2.125621, 0.2235294, 1, 0, 1,
-0.5441759, -0.7959803, -2.7141, 0.2196078, 1, 0, 1,
-0.5422244, -1.445971, -1.894656, 0.2117647, 1, 0, 1,
-0.5413506, -0.6413659, -3.11963, 0.2078431, 1, 0, 1,
-0.5409514, -0.402004, -2.835679, 0.2, 1, 0, 1,
-0.5399922, -0.5961611, -0.7591932, 0.1921569, 1, 0, 1,
-0.5395495, -2.128213, -3.257902, 0.1882353, 1, 0, 1,
-0.5345525, -0.5708557, -1.880358, 0.1803922, 1, 0, 1,
-0.533811, 0.6422571, -2.51634, 0.1764706, 1, 0, 1,
-0.5336822, -1.234987, -2.23685, 0.1686275, 1, 0, 1,
-0.5276209, -0.2432471, -0.5249432, 0.1647059, 1, 0, 1,
-0.5255506, -0.38481, -1.869341, 0.1568628, 1, 0, 1,
-0.5234486, -0.3306944, -2.222411, 0.1529412, 1, 0, 1,
-0.5217525, -0.6033484, -2.794945, 0.145098, 1, 0, 1,
-0.5211427, -0.2618044, -2.359667, 0.1411765, 1, 0, 1,
-0.5192665, 0.2604414, -0.9450719, 0.1333333, 1, 0, 1,
-0.5168946, -0.4487786, -1.304182, 0.1294118, 1, 0, 1,
-0.5168865, -0.163862, -2.601992, 0.1215686, 1, 0, 1,
-0.5167576, 0.3993525, -1.697828, 0.1176471, 1, 0, 1,
-0.5093121, 0.7766218, -0.9483731, 0.1098039, 1, 0, 1,
-0.5068018, 1.665637, 0.4161122, 0.1058824, 1, 0, 1,
-0.5056028, -1.469554, -1.165694, 0.09803922, 1, 0, 1,
-0.4980871, 0.09450543, -1.177632, 0.09019608, 1, 0, 1,
-0.4946733, -0.8654169, -2.182335, 0.08627451, 1, 0, 1,
-0.4920943, -1.163313, -3.834101, 0.07843138, 1, 0, 1,
-0.4878939, 0.9301526, -0.07911932, 0.07450981, 1, 0, 1,
-0.4861381, 0.1174314, 0.5048454, 0.06666667, 1, 0, 1,
-0.4859513, 0.3529398, -1.705441, 0.0627451, 1, 0, 1,
-0.4783133, 0.8617886, -0.8362795, 0.05490196, 1, 0, 1,
-0.475694, 1.484092, 0.7082301, 0.05098039, 1, 0, 1,
-0.4755467, 0.0121578, -3.083796, 0.04313726, 1, 0, 1,
-0.4692992, -0.9017059, -2.525678, 0.03921569, 1, 0, 1,
-0.466992, -0.687787, -3.213859, 0.03137255, 1, 0, 1,
-0.465383, -0.1899644, -2.643942, 0.02745098, 1, 0, 1,
-0.4546646, 0.5528679, -0.2617433, 0.01960784, 1, 0, 1,
-0.4527968, -1.415702, -3.252419, 0.01568628, 1, 0, 1,
-0.4524167, 0.3599461, -0.830194, 0.007843138, 1, 0, 1,
-0.4517764, 0.7370774, -0.4836121, 0.003921569, 1, 0, 1,
-0.4461775, 0.2624297, -1.483696, 0, 1, 0.003921569, 1,
-0.4445219, -0.3088067, -2.544665, 0, 1, 0.01176471, 1,
-0.438061, -0.1245586, -2.862047, 0, 1, 0.01568628, 1,
-0.4270854, 0.3476699, -0.6680286, 0, 1, 0.02352941, 1,
-0.4250075, -0.9707742, -2.823962, 0, 1, 0.02745098, 1,
-0.424229, 1.538746, 1.07192, 0, 1, 0.03529412, 1,
-0.4213189, 1.735679, 0.2370379, 0, 1, 0.03921569, 1,
-0.4205054, 0.06278454, -2.10752, 0, 1, 0.04705882, 1,
-0.418048, 1.030753, 1.765547, 0, 1, 0.05098039, 1,
-0.4155578, -0.2022968, -3.117943, 0, 1, 0.05882353, 1,
-0.4138784, -0.8687722, -1.545423, 0, 1, 0.0627451, 1,
-0.4095797, 0.5228466, -0.7030183, 0, 1, 0.07058824, 1,
-0.4073423, 0.02886041, -1.560308, 0, 1, 0.07450981, 1,
-0.4056275, -1.311003, -2.632327, 0, 1, 0.08235294, 1,
-0.4025721, 0.4728566, 1.301355, 0, 1, 0.08627451, 1,
-0.401951, -1.058597, -1.007827, 0, 1, 0.09411765, 1,
-0.4009593, -1.245817, -4.722529, 0, 1, 0.1019608, 1,
-0.3996243, 0.7616524, 0.6706863, 0, 1, 0.1058824, 1,
-0.3981477, -0.09618893, -2.178523, 0, 1, 0.1137255, 1,
-0.3899616, -0.4677593, -2.916923, 0, 1, 0.1176471, 1,
-0.3888034, -0.05219965, -2.496488, 0, 1, 0.1254902, 1,
-0.3803442, 1.039204, -0.5712808, 0, 1, 0.1294118, 1,
-0.378745, 0.211558, -0.2027363, 0, 1, 0.1372549, 1,
-0.3744175, -0.05465432, -4.060045, 0, 1, 0.1411765, 1,
-0.3693979, -0.5762137, -2.386626, 0, 1, 0.1490196, 1,
-0.3637688, 0.5081975, -2.378289, 0, 1, 0.1529412, 1,
-0.3621052, 0.9408529, -0.6121477, 0, 1, 0.1607843, 1,
-0.3587864, -2.406434, -2.623837, 0, 1, 0.1647059, 1,
-0.3580927, -0.08636406, -2.09663, 0, 1, 0.172549, 1,
-0.3558931, 1.042367, -0.519976, 0, 1, 0.1764706, 1,
-0.3521872, 0.214905, -2.604108, 0, 1, 0.1843137, 1,
-0.3519769, -0.7406569, -1.828404, 0, 1, 0.1882353, 1,
-0.3517941, -0.7114481, -3.44387, 0, 1, 0.1960784, 1,
-0.3500944, -0.127042, -3.436222, 0, 1, 0.2039216, 1,
-0.3481488, -1.256311, -3.61716, 0, 1, 0.2078431, 1,
-0.3479966, 1.435939, 0.3619674, 0, 1, 0.2156863, 1,
-0.3454556, 0.819651, -1.300478, 0, 1, 0.2196078, 1,
-0.345006, 0.6026354, -0.602099, 0, 1, 0.227451, 1,
-0.340656, -0.9391087, -2.039781, 0, 1, 0.2313726, 1,
-0.3366875, -0.9356232, -2.364569, 0, 1, 0.2392157, 1,
-0.3335477, -0.6842225, -1.997844, 0, 1, 0.2431373, 1,
-0.3309709, -0.4445298, -1.750907, 0, 1, 0.2509804, 1,
-0.3298788, 0.2787189, -1.245374, 0, 1, 0.254902, 1,
-0.3296655, -0.3769743, -3.120417, 0, 1, 0.2627451, 1,
-0.3261583, -0.3152789, -2.521208, 0, 1, 0.2666667, 1,
-0.3212082, 0.1096911, -2.449766, 0, 1, 0.2745098, 1,
-0.3205798, -0.08272159, -0.9987903, 0, 1, 0.2784314, 1,
-0.3192553, 1.644684, 1.08816, 0, 1, 0.2862745, 1,
-0.3184838, 0.4235358, 0.9198363, 0, 1, 0.2901961, 1,
-0.3179748, 0.1486267, -0.504231, 0, 1, 0.2980392, 1,
-0.3166473, 0.8683563, -1.474573, 0, 1, 0.3058824, 1,
-0.3143669, 0.3977967, -0.7405182, 0, 1, 0.3098039, 1,
-0.3138654, 0.06321946, -2.435673, 0, 1, 0.3176471, 1,
-0.30362, -0.2081061, -2.631424, 0, 1, 0.3215686, 1,
-0.3031723, -0.7913814, -3.797955, 0, 1, 0.3294118, 1,
-0.2945476, 0.5285959, -2.863737, 0, 1, 0.3333333, 1,
-0.294473, 0.8010793, -0.6015903, 0, 1, 0.3411765, 1,
-0.2728711, 0.2946784, -1.676895, 0, 1, 0.345098, 1,
-0.2684809, 0.02719365, -2.442615, 0, 1, 0.3529412, 1,
-0.2684439, 0.2345752, -2.169165, 0, 1, 0.3568628, 1,
-0.2619418, -1.344744, -3.377629, 0, 1, 0.3647059, 1,
-0.2590675, -2.142755, -1.278346, 0, 1, 0.3686275, 1,
-0.2589999, 0.9531318, 0.6082802, 0, 1, 0.3764706, 1,
-0.2587388, -1.805912, -1.517954, 0, 1, 0.3803922, 1,
-0.2519148, 0.07577151, -0.8060756, 0, 1, 0.3882353, 1,
-0.251857, 0.6450617, -1.001649, 0, 1, 0.3921569, 1,
-0.2470011, 0.6060276, 0.9878249, 0, 1, 0.4, 1,
-0.241186, 0.5617462, 0.1467878, 0, 1, 0.4078431, 1,
-0.2405044, 0.7169193, 0.5292982, 0, 1, 0.4117647, 1,
-0.2385499, 0.9814441, -0.384184, 0, 1, 0.4196078, 1,
-0.2366821, -2.096797, -5.40062, 0, 1, 0.4235294, 1,
-0.2363939, 0.0741292, -1.558543, 0, 1, 0.4313726, 1,
-0.2314383, 0.4625065, -1.182371, 0, 1, 0.4352941, 1,
-0.2310804, 0.07932194, -0.9163771, 0, 1, 0.4431373, 1,
-0.2307536, -0.7469272, -2.473606, 0, 1, 0.4470588, 1,
-0.2262373, 0.407505, -0.2914157, 0, 1, 0.454902, 1,
-0.2252085, 1.226879, 1.245851, 0, 1, 0.4588235, 1,
-0.2213466, -0.01223982, -0.9290673, 0, 1, 0.4666667, 1,
-0.2191373, -0.2374891, -3.373425, 0, 1, 0.4705882, 1,
-0.2144993, -1.558364, -2.471499, 0, 1, 0.4784314, 1,
-0.2134547, 0.4728452, -0.2438796, 0, 1, 0.4823529, 1,
-0.2094436, 0.2337351, -0.8397324, 0, 1, 0.4901961, 1,
-0.2068127, 0.08568051, -0.6673552, 0, 1, 0.4941176, 1,
-0.2010605, -0.007753395, -1.391729, 0, 1, 0.5019608, 1,
-0.2005406, -0.1885808, -1.935485, 0, 1, 0.509804, 1,
-0.1972578, -0.5185356, -2.320075, 0, 1, 0.5137255, 1,
-0.1967473, -0.3029046, -2.139345, 0, 1, 0.5215687, 1,
-0.1959383, -1.050574, -1.977054, 0, 1, 0.5254902, 1,
-0.188395, 0.9489333, -0.196289, 0, 1, 0.5333334, 1,
-0.1878069, 0.3164336, -0.496931, 0, 1, 0.5372549, 1,
-0.1819995, 0.7916688, -0.2064722, 0, 1, 0.5450981, 1,
-0.1762187, 2.061038, -0.04912257, 0, 1, 0.5490196, 1,
-0.1760785, 0.1289551, -0.1013881, 0, 1, 0.5568628, 1,
-0.1728376, -0.06290276, -2.708396, 0, 1, 0.5607843, 1,
-0.1669129, -1.065977, -1.26297, 0, 1, 0.5686275, 1,
-0.1604217, 1.192939, 1.462672, 0, 1, 0.572549, 1,
-0.1592968, -0.5894357, -3.254423, 0, 1, 0.5803922, 1,
-0.1584766, -1.765952, -2.533821, 0, 1, 0.5843138, 1,
-0.1529318, 1.38191, -0.1651536, 0, 1, 0.5921569, 1,
-0.152786, 0.4075598, 0.8154138, 0, 1, 0.5960785, 1,
-0.1525344, -0.3375609, -3.780816, 0, 1, 0.6039216, 1,
-0.1496308, -0.5509135, -3.140691, 0, 1, 0.6117647, 1,
-0.1493167, -0.8986074, -3.257883, 0, 1, 0.6156863, 1,
-0.1490325, -0.6037183, -4.79704, 0, 1, 0.6235294, 1,
-0.1459122, 0.3953796, 0.2974345, 0, 1, 0.627451, 1,
-0.1457286, -0.5141806, -2.803426, 0, 1, 0.6352941, 1,
-0.1452983, 0.2097915, 1.227716, 0, 1, 0.6392157, 1,
-0.1446883, -1.244748, -3.061615, 0, 1, 0.6470588, 1,
-0.1410688, 1.195356, -0.5544406, 0, 1, 0.6509804, 1,
-0.1409783, 0.2620476, -0.9327595, 0, 1, 0.6588235, 1,
-0.1403754, -1.474133, -1.888611, 0, 1, 0.6627451, 1,
-0.1396409, 1.329169, 0.3984959, 0, 1, 0.6705883, 1,
-0.1380188, 0.03265836, -2.06986, 0, 1, 0.6745098, 1,
-0.1354645, -0.3456521, -2.5303, 0, 1, 0.682353, 1,
-0.1353171, -0.5386776, -3.560261, 0, 1, 0.6862745, 1,
-0.1298332, -0.5124365, -1.493086, 0, 1, 0.6941177, 1,
-0.1283502, 0.3184978, -0.7534192, 0, 1, 0.7019608, 1,
-0.1279563, -1.476022, -2.330217, 0, 1, 0.7058824, 1,
-0.1206421, -0.8083139, -3.260161, 0, 1, 0.7137255, 1,
-0.1201221, 1.393023, 0.6857183, 0, 1, 0.7176471, 1,
-0.1129835, 0.1070232, -0.25729, 0, 1, 0.7254902, 1,
-0.1126099, 0.3129625, 0.0498423, 0, 1, 0.7294118, 1,
-0.1118491, -0.9372087, -3.080434, 0, 1, 0.7372549, 1,
-0.1114116, -1.036435, -4.217018, 0, 1, 0.7411765, 1,
-0.1101479, -0.03839613, -1.865403, 0, 1, 0.7490196, 1,
-0.1090916, -0.1480531, -2.766203, 0, 1, 0.7529412, 1,
-0.1075298, 0.4603671, 0.1611369, 0, 1, 0.7607843, 1,
-0.1059801, -0.8551295, -1.149703, 0, 1, 0.7647059, 1,
-0.1035786, -1.10921, -1.656655, 0, 1, 0.772549, 1,
-0.1028855, -0.07456664, -2.807696, 0, 1, 0.7764706, 1,
-0.102433, -0.4367068, -4.149646, 0, 1, 0.7843137, 1,
-0.09906661, -0.5211257, -2.411309, 0, 1, 0.7882353, 1,
-0.09402067, -0.6001295, -2.006365, 0, 1, 0.7960784, 1,
-0.09138481, 1.219803, 0.1083183, 0, 1, 0.8039216, 1,
-0.08688124, -1.1747, -2.291964, 0, 1, 0.8078431, 1,
-0.08583609, 1.508905, 1.31039, 0, 1, 0.8156863, 1,
-0.08431593, 0.08231151, 0.5594378, 0, 1, 0.8196079, 1,
-0.08366969, 0.2897378, -1.93571, 0, 1, 0.827451, 1,
-0.08227915, -0.1333928, -2.692648, 0, 1, 0.8313726, 1,
-0.08179072, -0.2983133, -3.225516, 0, 1, 0.8392157, 1,
-0.07758199, -1.404478, -3.915979, 0, 1, 0.8431373, 1,
-0.07247066, 0.3909181, -1.473498, 0, 1, 0.8509804, 1,
-0.07060529, 0.3254293, -1.838962, 0, 1, 0.854902, 1,
-0.06840853, 0.1826787, -0.2120173, 0, 1, 0.8627451, 1,
-0.05900282, 0.737031, 0.7378144, 0, 1, 0.8666667, 1,
-0.05652209, 0.6330327, -1.018728, 0, 1, 0.8745098, 1,
-0.05527642, -1.967832, -3.438733, 0, 1, 0.8784314, 1,
-0.05260622, 0.4041388, 1.233749, 0, 1, 0.8862745, 1,
-0.0507948, 1.402702, -1.404503, 0, 1, 0.8901961, 1,
-0.04770752, 1.171036, -0.224345, 0, 1, 0.8980392, 1,
-0.03640807, -1.310523, -3.268324, 0, 1, 0.9058824, 1,
-0.03161742, 1.150537, 0.2375978, 0, 1, 0.9098039, 1,
-0.03105999, 2.454242, -0.5044894, 0, 1, 0.9176471, 1,
-0.02609733, 0.2559441, 1.463711, 0, 1, 0.9215686, 1,
-0.02501293, -1.223564, -4.096219, 0, 1, 0.9294118, 1,
-0.02454918, -0.6108493, -2.485277, 0, 1, 0.9333333, 1,
-0.02445221, -0.3476797, -2.740114, 0, 1, 0.9411765, 1,
-0.02317878, 0.7789671, 0.1459009, 0, 1, 0.945098, 1,
-0.02006959, -0.2767186, -5.893017, 0, 1, 0.9529412, 1,
-0.01153863, 0.2008486, 0.2454426, 0, 1, 0.9568627, 1,
-0.009309117, 0.1157614, -1.122014, 0, 1, 0.9647059, 1,
-0.007600544, -1.583762, -2.184854, 0, 1, 0.9686275, 1,
-0.006948877, -0.2146202, -4.054934, 0, 1, 0.9764706, 1,
-0.003616056, -0.04456986, -1.845411, 0, 1, 0.9803922, 1,
-0.003363607, 1.196916, -0.3250068, 0, 1, 0.9882353, 1,
-0.003240327, -0.1795555, -3.662022, 0, 1, 0.9921569, 1,
-1.242379e-05, 1.892053, -0.2587063, 0, 1, 1, 1,
0.005633582, 1.060618, 0.3785959, 0, 0.9921569, 1, 1,
0.009413419, 1.896212, 0.09254587, 0, 0.9882353, 1, 1,
0.009432567, 0.3808963, 1.332859, 0, 0.9803922, 1, 1,
0.01188746, 0.04763046, 1.25, 0, 0.9764706, 1, 1,
0.01200416, 1.149751, -0.6924103, 0, 0.9686275, 1, 1,
0.01401589, -1.01414, 2.914511, 0, 0.9647059, 1, 1,
0.02005442, 1.355951, 0.4365889, 0, 0.9568627, 1, 1,
0.02551312, 1.524109, -0.9076543, 0, 0.9529412, 1, 1,
0.02797593, 0.416649, 0.6274793, 0, 0.945098, 1, 1,
0.0296082, -0.2027859, 3.210233, 0, 0.9411765, 1, 1,
0.03059609, -0.7720929, 3.796758, 0, 0.9333333, 1, 1,
0.0338631, 0.3528249, -2.022673, 0, 0.9294118, 1, 1,
0.03392985, 1.300653, 0.7712163, 0, 0.9215686, 1, 1,
0.03457765, -0.353276, 3.104868, 0, 0.9176471, 1, 1,
0.03551537, -0.9523807, 4.204309, 0, 0.9098039, 1, 1,
0.03930132, 0.4768773, 0.3301594, 0, 0.9058824, 1, 1,
0.04713038, -0.250782, 1.238872, 0, 0.8980392, 1, 1,
0.05179742, -0.003182001, 1.238383, 0, 0.8901961, 1, 1,
0.05268442, -1.335071, 1.573782, 0, 0.8862745, 1, 1,
0.05319656, -0.2397586, 3.285146, 0, 0.8784314, 1, 1,
0.05428682, 0.5151882, 1.079932, 0, 0.8745098, 1, 1,
0.05813369, -0.9237012, 3.654606, 0, 0.8666667, 1, 1,
0.06244755, 0.2768523, 1.234423, 0, 0.8627451, 1, 1,
0.06720062, -1.211692, 3.047064, 0, 0.854902, 1, 1,
0.06745978, -1.295855, 2.875106, 0, 0.8509804, 1, 1,
0.06766266, 1.853415, 1.50644, 0, 0.8431373, 1, 1,
0.07171808, -0.5361128, 5.317264, 0, 0.8392157, 1, 1,
0.07266498, -1.271077, 0.1688929, 0, 0.8313726, 1, 1,
0.07538858, 1.026768, -0.1218425, 0, 0.827451, 1, 1,
0.07743457, 0.7153751, -0.5135239, 0, 0.8196079, 1, 1,
0.07775167, 0.992324, 1.905117, 0, 0.8156863, 1, 1,
0.07839542, 0.3058904, -0.4387147, 0, 0.8078431, 1, 1,
0.07900734, 0.799366, -1.498651, 0, 0.8039216, 1, 1,
0.08131374, -0.2787394, 3.372962, 0, 0.7960784, 1, 1,
0.08706784, 1.226457, -1.504161, 0, 0.7882353, 1, 1,
0.0885974, 0.7393855, -0.1445452, 0, 0.7843137, 1, 1,
0.08933929, 0.8338066, 0.7055236, 0, 0.7764706, 1, 1,
0.08990091, -0.4258969, 3.84831, 0, 0.772549, 1, 1,
0.09343162, -0.1299215, 3.532759, 0, 0.7647059, 1, 1,
0.09427756, -1.075595, 3.484949, 0, 0.7607843, 1, 1,
0.09470028, -1.023796, 3.270987, 0, 0.7529412, 1, 1,
0.09945946, -0.494681, 2.597615, 0, 0.7490196, 1, 1,
0.1065465, -2.181712, 2.999705, 0, 0.7411765, 1, 1,
0.1159159, 0.1332517, 1.0052, 0, 0.7372549, 1, 1,
0.1189695, 0.5356019, 0.1368407, 0, 0.7294118, 1, 1,
0.1207671, 0.979772, 0.9121881, 0, 0.7254902, 1, 1,
0.1229477, -0.1895594, 2.263279, 0, 0.7176471, 1, 1,
0.1233359, -0.1593839, 1.722244, 0, 0.7137255, 1, 1,
0.1240391, 0.8400218, -2.637619, 0, 0.7058824, 1, 1,
0.1252766, -2.658282, 4.974553, 0, 0.6980392, 1, 1,
0.1274361, 0.5406168, 0.5555359, 0, 0.6941177, 1, 1,
0.1399009, -0.2270297, 3.654399, 0, 0.6862745, 1, 1,
0.140447, 0.1889592, 1.192246, 0, 0.682353, 1, 1,
0.1433565, 0.4630667, 0.2010801, 0, 0.6745098, 1, 1,
0.1438666, 0.1482439, -0.6952354, 0, 0.6705883, 1, 1,
0.1478464, 0.3475264, -0.3103354, 0, 0.6627451, 1, 1,
0.1481189, 0.693479, 1.232873, 0, 0.6588235, 1, 1,
0.1511705, 1.004506, 1.001898, 0, 0.6509804, 1, 1,
0.1544947, 0.9882933, -0.3670031, 0, 0.6470588, 1, 1,
0.1549813, -1.048221, 2.812648, 0, 0.6392157, 1, 1,
0.1587243, -0.02958264, 3.667614, 0, 0.6352941, 1, 1,
0.1596511, 0.002665652, 0.4684882, 0, 0.627451, 1, 1,
0.16128, 0.08497821, 0.2492561, 0, 0.6235294, 1, 1,
0.1634796, 1.804079, -2.221318, 0, 0.6156863, 1, 1,
0.1646058, -0.2133234, 2.746582, 0, 0.6117647, 1, 1,
0.167906, -2.357381, 4.076268, 0, 0.6039216, 1, 1,
0.1717962, -0.291676, 1.07229, 0, 0.5960785, 1, 1,
0.1764113, -0.3608163, 2.169908, 0, 0.5921569, 1, 1,
0.1789385, -2.541667, 2.478071, 0, 0.5843138, 1, 1,
0.1828669, 0.2922297, 2.022251, 0, 0.5803922, 1, 1,
0.1836321, -0.6741308, 4.057162, 0, 0.572549, 1, 1,
0.1862818, -0.2886248, 3.790093, 0, 0.5686275, 1, 1,
0.1871894, -0.5197974, 2.240473, 0, 0.5607843, 1, 1,
0.1922916, -0.9045855, 2.49176, 0, 0.5568628, 1, 1,
0.1934487, 0.3823335, -0.02775061, 0, 0.5490196, 1, 1,
0.1942632, -0.4286167, 3.034663, 0, 0.5450981, 1, 1,
0.1943013, 0.8994206, -2.076458, 0, 0.5372549, 1, 1,
0.2018328, 0.7284817, 0.2662053, 0, 0.5333334, 1, 1,
0.2021927, -1.874447, 0.9814525, 0, 0.5254902, 1, 1,
0.2071105, -0.5077778, 1.520878, 0, 0.5215687, 1, 1,
0.2127925, -0.3718957, 1.96796, 0, 0.5137255, 1, 1,
0.2218142, 0.1321204, 1.981128, 0, 0.509804, 1, 1,
0.224136, -0.07065005, 2.998629, 0, 0.5019608, 1, 1,
0.2253823, 0.04078287, 1.613439, 0, 0.4941176, 1, 1,
0.2258007, -0.7103602, 2.942854, 0, 0.4901961, 1, 1,
0.2261191, -0.6564712, 1.492469, 0, 0.4823529, 1, 1,
0.2271314, -0.1153718, 2.110727, 0, 0.4784314, 1, 1,
0.2274267, -0.2974769, 3.186049, 0, 0.4705882, 1, 1,
0.2318825, 1.743675, 0.5223439, 0, 0.4666667, 1, 1,
0.2328309, -0.4621736, 2.252933, 0, 0.4588235, 1, 1,
0.2348406, 0.5369758, 0.9744948, 0, 0.454902, 1, 1,
0.2393794, 0.3785919, 1.309232, 0, 0.4470588, 1, 1,
0.2394897, -0.2966724, 2.373741, 0, 0.4431373, 1, 1,
0.2405133, -1.38614, 3.401811, 0, 0.4352941, 1, 1,
0.2484774, 0.3245577, 0.1639841, 0, 0.4313726, 1, 1,
0.2512, 0.5931441, 0.3122583, 0, 0.4235294, 1, 1,
0.2527622, 2.332866, 1.310884, 0, 0.4196078, 1, 1,
0.2565546, -0.6452858, 2.702464, 0, 0.4117647, 1, 1,
0.2571608, -1.703685, 3.091786, 0, 0.4078431, 1, 1,
0.2652469, -1.16695, 3.252483, 0, 0.4, 1, 1,
0.2657498, -0.4365056, 2.477312, 0, 0.3921569, 1, 1,
0.2781169, 1.309146, 0.7262176, 0, 0.3882353, 1, 1,
0.2797557, -0.7819805, 4.240255, 0, 0.3803922, 1, 1,
0.2819583, -0.1027082, 1.653747, 0, 0.3764706, 1, 1,
0.2821855, -2.117998, 3.879029, 0, 0.3686275, 1, 1,
0.2827605, 1.046679, 2.554049, 0, 0.3647059, 1, 1,
0.284885, 0.3794758, 1.45617, 0, 0.3568628, 1, 1,
0.2864697, -0.06811837, 1.549491, 0, 0.3529412, 1, 1,
0.2880508, -0.1140096, 1.540333, 0, 0.345098, 1, 1,
0.2913971, 0.1821568, 2.343081, 0, 0.3411765, 1, 1,
0.2929514, 1.047703, 0.9842796, 0, 0.3333333, 1, 1,
0.2932239, 0.1837022, 4.184082, 0, 0.3294118, 1, 1,
0.2963316, -2.319212, 4.649981, 0, 0.3215686, 1, 1,
0.3005589, -0.8063134, 2.752, 0, 0.3176471, 1, 1,
0.3034483, 0.5391256, 0.7742465, 0, 0.3098039, 1, 1,
0.3037536, 0.4571154, -0.5586807, 0, 0.3058824, 1, 1,
0.3043694, 0.3334607, 0.08979817, 0, 0.2980392, 1, 1,
0.308897, 0.1649496, -1.383089, 0, 0.2901961, 1, 1,
0.3145993, -0.1430584, 0.8169813, 0, 0.2862745, 1, 1,
0.3162388, 0.9669707, -2.860327, 0, 0.2784314, 1, 1,
0.3177834, -1.242519, 2.86805, 0, 0.2745098, 1, 1,
0.3203454, -1.717203, 4.131615, 0, 0.2666667, 1, 1,
0.3249309, 0.08445666, 3.302304, 0, 0.2627451, 1, 1,
0.3257087, -0.6108174, 4.271873, 0, 0.254902, 1, 1,
0.3270531, -0.4188038, 3.404674, 0, 0.2509804, 1, 1,
0.3341873, -0.614017, 3.25937, 0, 0.2431373, 1, 1,
0.3346107, -0.8282825, 4.227178, 0, 0.2392157, 1, 1,
0.3382496, -2.161126, 2.252943, 0, 0.2313726, 1, 1,
0.3432795, 0.4841149, -0.1038655, 0, 0.227451, 1, 1,
0.3456121, -1.202488, 3.350183, 0, 0.2196078, 1, 1,
0.3473145, 0.1179585, 1.527542, 0, 0.2156863, 1, 1,
0.3540783, 0.1538386, 1.992554, 0, 0.2078431, 1, 1,
0.355528, -0.0340087, 2.403054, 0, 0.2039216, 1, 1,
0.3564923, 0.5254338, 1.008278, 0, 0.1960784, 1, 1,
0.3567713, 0.846441, -0.361037, 0, 0.1882353, 1, 1,
0.3577224, 0.6851265, 0.9148226, 0, 0.1843137, 1, 1,
0.3617797, 0.7737932, 1.981259, 0, 0.1764706, 1, 1,
0.3710704, 1.261694, -0.08075797, 0, 0.172549, 1, 1,
0.3756851, -0.3787629, 3.277474, 0, 0.1647059, 1, 1,
0.376639, 0.2521133, 0.7088865, 0, 0.1607843, 1, 1,
0.3784266, -1.390657, 1.266284, 0, 0.1529412, 1, 1,
0.378748, -1.07444, 0.9109225, 0, 0.1490196, 1, 1,
0.3790148, -0.8782828, 4.639143, 0, 0.1411765, 1, 1,
0.3799983, 0.3336779, 1.735552, 0, 0.1372549, 1, 1,
0.3861775, 0.3118152, -0.1076211, 0, 0.1294118, 1, 1,
0.3873434, -0.8745473, 2.455639, 0, 0.1254902, 1, 1,
0.3912761, 0.5754006, -0.3123735, 0, 0.1176471, 1, 1,
0.3926648, 1.627432, 1.982378, 0, 0.1137255, 1, 1,
0.3983583, 0.3735522, -0.5373816, 0, 0.1058824, 1, 1,
0.3991594, -0.3848157, 2.055672, 0, 0.09803922, 1, 1,
0.4052396, -2.481237, 2.289289, 0, 0.09411765, 1, 1,
0.4054913, 0.5395843, 0.8718378, 0, 0.08627451, 1, 1,
0.4088146, 0.4512224, -0.8250891, 0, 0.08235294, 1, 1,
0.4118972, 0.6565634, -0.1179291, 0, 0.07450981, 1, 1,
0.4124044, 1.524468, -0.2562751, 0, 0.07058824, 1, 1,
0.4135515, -0.58869, 2.374627, 0, 0.0627451, 1, 1,
0.4169567, 0.3895591, 1.130253, 0, 0.05882353, 1, 1,
0.4203846, 1.601455, 0.288023, 0, 0.05098039, 1, 1,
0.4210771, -1.462866, 4.711923, 0, 0.04705882, 1, 1,
0.4212094, 1.213303, 0.5312182, 0, 0.03921569, 1, 1,
0.4222275, 1.449626, 0.566489, 0, 0.03529412, 1, 1,
0.4231811, 0.02697545, 2.486682, 0, 0.02745098, 1, 1,
0.4245799, -1.081836, 2.754571, 0, 0.02352941, 1, 1,
0.4258024, -1.092246, 3.529914, 0, 0.01568628, 1, 1,
0.4259838, 1.139097, 0.3790205, 0, 0.01176471, 1, 1,
0.4270701, 1.994853, 1.476944, 0, 0.003921569, 1, 1,
0.4297785, -0.02521458, 3.202542, 0.003921569, 0, 1, 1,
0.4377041, 0.4142499, 2.298286, 0.007843138, 0, 1, 1,
0.4391679, 0.03412788, 2.578612, 0.01568628, 0, 1, 1,
0.4397858, -0.6359224, 2.064442, 0.01960784, 0, 1, 1,
0.4442151, 1.185708, -0.4946942, 0.02745098, 0, 1, 1,
0.4523417, 0.5237079, 1.006069, 0.03137255, 0, 1, 1,
0.4543324, -0.4934372, 1.912936, 0.03921569, 0, 1, 1,
0.4550696, 0.7119105, 0.002211213, 0.04313726, 0, 1, 1,
0.4607264, -0.02472238, 0.794381, 0.05098039, 0, 1, 1,
0.4644591, 0.6780499, -0.2613285, 0.05490196, 0, 1, 1,
0.4675242, 0.5105278, -0.1769191, 0.0627451, 0, 1, 1,
0.4684891, 0.07811997, 1.415442, 0.06666667, 0, 1, 1,
0.4690274, 1.260833, 1.866279, 0.07450981, 0, 1, 1,
0.4710166, 0.6430646, 0.6446783, 0.07843138, 0, 1, 1,
0.4727418, 1.148349, -0.4066981, 0.08627451, 0, 1, 1,
0.4736231, -0.289865, 3.065883, 0.09019608, 0, 1, 1,
0.4766402, 1.492291, 1.941159, 0.09803922, 0, 1, 1,
0.4774551, -0.212982, 0.7120459, 0.1058824, 0, 1, 1,
0.4787328, 0.6839774, -0.03610182, 0.1098039, 0, 1, 1,
0.4814939, 0.3431596, -0.1785549, 0.1176471, 0, 1, 1,
0.4845703, -0.3114044, 1.957657, 0.1215686, 0, 1, 1,
0.4943983, 2.078402, -0.002150032, 0.1294118, 0, 1, 1,
0.5023774, 0.4045282, 1.162047, 0.1333333, 0, 1, 1,
0.5042192, -0.7292663, 1.312279, 0.1411765, 0, 1, 1,
0.5083508, -0.06664265, 0.2599396, 0.145098, 0, 1, 1,
0.509783, -0.980372, 3.21674, 0.1529412, 0, 1, 1,
0.511203, 0.2988169, 1.504443, 0.1568628, 0, 1, 1,
0.5135086, 0.6505304, 0.3979478, 0.1647059, 0, 1, 1,
0.5141992, -0.6466209, 2.301316, 0.1686275, 0, 1, 1,
0.514618, -0.672583, 1.626156, 0.1764706, 0, 1, 1,
0.5231243, -0.08668594, 1.445812, 0.1803922, 0, 1, 1,
0.5246834, 1.210333, 0.4108505, 0.1882353, 0, 1, 1,
0.5269166, -0.4926894, 2.036678, 0.1921569, 0, 1, 1,
0.5296562, 1.522352, -1.57996, 0.2, 0, 1, 1,
0.5298745, 0.6099399, 1.665782, 0.2078431, 0, 1, 1,
0.5335501, 0.5647105, 1.904157, 0.2117647, 0, 1, 1,
0.5335855, -0.6335, 2.224501, 0.2196078, 0, 1, 1,
0.537599, 0.1431704, 0.1057288, 0.2235294, 0, 1, 1,
0.5379736, -0.1604729, 1.334245, 0.2313726, 0, 1, 1,
0.5390952, 0.09116352, -0.9551722, 0.2352941, 0, 1, 1,
0.5412605, -0.210328, 3.656114, 0.2431373, 0, 1, 1,
0.5428423, -0.930445, 3.211398, 0.2470588, 0, 1, 1,
0.5428819, -1.718717, 4.1736, 0.254902, 0, 1, 1,
0.5440193, 1.652231, -0.1035676, 0.2588235, 0, 1, 1,
0.5448491, -1.897074, 3.636261, 0.2666667, 0, 1, 1,
0.5467719, -0.4664824, 3.162205, 0.2705882, 0, 1, 1,
0.5499261, 0.01351545, 1.658946, 0.2784314, 0, 1, 1,
0.5533487, 1.530181, 0.5768195, 0.282353, 0, 1, 1,
0.5537216, -0.6520629, 2.69326, 0.2901961, 0, 1, 1,
0.5582455, 0.803915, 0.7786313, 0.2941177, 0, 1, 1,
0.5603827, -1.044671, 2.947162, 0.3019608, 0, 1, 1,
0.5624152, -0.9314435, 3.117693, 0.3098039, 0, 1, 1,
0.5699729, 0.3784286, 0.3671086, 0.3137255, 0, 1, 1,
0.5754341, 1.453164, -0.5367744, 0.3215686, 0, 1, 1,
0.5760725, -1.295294, 1.706397, 0.3254902, 0, 1, 1,
0.5788594, 1.029395, 2.09518, 0.3333333, 0, 1, 1,
0.5881646, -2.779265, 4.659155, 0.3372549, 0, 1, 1,
0.5889249, -0.6758789, 1.278681, 0.345098, 0, 1, 1,
0.5898967, -0.4695419, 4.006686, 0.3490196, 0, 1, 1,
0.5914404, -2.183054, 3.481917, 0.3568628, 0, 1, 1,
0.5929519, -1.551841, 4.23292, 0.3607843, 0, 1, 1,
0.5945746, -1.809962, 2.762691, 0.3686275, 0, 1, 1,
0.6119939, 0.6622317, -0.5297018, 0.372549, 0, 1, 1,
0.6129206, 0.5121216, 2.093408, 0.3803922, 0, 1, 1,
0.613501, 1.413758, 0.9155383, 0.3843137, 0, 1, 1,
0.6137101, 0.1162078, 3.050788, 0.3921569, 0, 1, 1,
0.6139733, -0.2097662, 3.014332, 0.3960784, 0, 1, 1,
0.615467, 0.06205013, 0.6635675, 0.4039216, 0, 1, 1,
0.6165463, -0.1442664, 1.223757, 0.4117647, 0, 1, 1,
0.61875, -1.357932, 1.380259, 0.4156863, 0, 1, 1,
0.624938, -0.5237443, 2.39569, 0.4235294, 0, 1, 1,
0.6250489, 1.011333, 0.9024575, 0.427451, 0, 1, 1,
0.6277415, 0.1532322, 0.4404708, 0.4352941, 0, 1, 1,
0.628416, -0.07061563, 2.36325, 0.4392157, 0, 1, 1,
0.6342185, 0.1047135, 0.4766519, 0.4470588, 0, 1, 1,
0.6494695, -2.792748, 2.644469, 0.4509804, 0, 1, 1,
0.6500351, 1.305583, 0.9436901, 0.4588235, 0, 1, 1,
0.6528777, 2.162362, 0.01471077, 0.4627451, 0, 1, 1,
0.6529196, -0.4367782, 2.599241, 0.4705882, 0, 1, 1,
0.6542668, 1.85267, 0.3491824, 0.4745098, 0, 1, 1,
0.6577714, -0.1965901, 2.05228, 0.4823529, 0, 1, 1,
0.6637803, 2.301409, -0.6850909, 0.4862745, 0, 1, 1,
0.6661967, -0.7186502, 2.124579, 0.4941176, 0, 1, 1,
0.6690273, -0.5098396, 2.036596, 0.5019608, 0, 1, 1,
0.6782078, 1.864275, -2.298901, 0.5058824, 0, 1, 1,
0.6880121, -0.08649778, 1.626245, 0.5137255, 0, 1, 1,
0.6882505, 0.555047, 0.2346461, 0.5176471, 0, 1, 1,
0.6894583, -0.8820991, 3.360703, 0.5254902, 0, 1, 1,
0.6932244, 1.49217, 0.1108337, 0.5294118, 0, 1, 1,
0.6944337, 1.517526, 1.884874, 0.5372549, 0, 1, 1,
0.697363, 1.671808, -0.1088366, 0.5411765, 0, 1, 1,
0.6978889, -0.970272, 2.189721, 0.5490196, 0, 1, 1,
0.704336, 0.3347678, 0.2208518, 0.5529412, 0, 1, 1,
0.7050305, -0.04789547, 3.216996, 0.5607843, 0, 1, 1,
0.7073767, 0.6752226, 1.809531, 0.5647059, 0, 1, 1,
0.7087138, -0.5758747, 3.856595, 0.572549, 0, 1, 1,
0.7095297, 0.5536864, 1.394612, 0.5764706, 0, 1, 1,
0.7120714, -1.324643, 1.543543, 0.5843138, 0, 1, 1,
0.7150456, -1.041815, 1.851067, 0.5882353, 0, 1, 1,
0.7151882, -1.209375, 3.305171, 0.5960785, 0, 1, 1,
0.7163727, 0.1550818, 0.9331811, 0.6039216, 0, 1, 1,
0.7184106, 0.8752766, 1.557266, 0.6078432, 0, 1, 1,
0.7198777, 0.0913498, 0.4662319, 0.6156863, 0, 1, 1,
0.7213088, 0.3901293, 0.701673, 0.6196079, 0, 1, 1,
0.7277263, -0.6265035, 3.035035, 0.627451, 0, 1, 1,
0.7400534, -0.6827257, 1.432056, 0.6313726, 0, 1, 1,
0.7430806, 0.6107424, 1.817749, 0.6392157, 0, 1, 1,
0.744083, 1.187792, 1.44988, 0.6431373, 0, 1, 1,
0.7446276, 0.8430654, 1.263235, 0.6509804, 0, 1, 1,
0.7488665, -0.4350964, 2.403188, 0.654902, 0, 1, 1,
0.7490102, -1.323383, 2.490068, 0.6627451, 0, 1, 1,
0.7517526, 0.03108818, 1.775648, 0.6666667, 0, 1, 1,
0.7518137, -1.417276, 3.852592, 0.6745098, 0, 1, 1,
0.7594946, -0.8785718, 3.538263, 0.6784314, 0, 1, 1,
0.7621453, 2.12374, 2.643214, 0.6862745, 0, 1, 1,
0.7635187, -1.287038, 1.654158, 0.6901961, 0, 1, 1,
0.7644204, -2.139029, 2.266712, 0.6980392, 0, 1, 1,
0.7646178, 0.3455433, 2.376903, 0.7058824, 0, 1, 1,
0.7652766, -1.192689, 2.23395, 0.7098039, 0, 1, 1,
0.7707688, -0.5526824, 1.05855, 0.7176471, 0, 1, 1,
0.7718922, -0.9773735, 3.580856, 0.7215686, 0, 1, 1,
0.7735295, -0.1618929, 1.831369, 0.7294118, 0, 1, 1,
0.7768631, -1.504366, 2.957457, 0.7333333, 0, 1, 1,
0.7833522, -1.721972, 2.894087, 0.7411765, 0, 1, 1,
0.7848067, -0.6288463, 0.2583832, 0.7450981, 0, 1, 1,
0.7849273, -0.1006811, 2.675995, 0.7529412, 0, 1, 1,
0.785753, -0.1599776, 1.415135, 0.7568628, 0, 1, 1,
0.7877453, 0.3282966, 1.547824, 0.7647059, 0, 1, 1,
0.7909315, 0.3200532, 0.9976178, 0.7686275, 0, 1, 1,
0.7950824, -0.5002374, 1.211471, 0.7764706, 0, 1, 1,
0.8029824, 1.228143, 0.09615852, 0.7803922, 0, 1, 1,
0.8040839, -1.527226, 1.592709, 0.7882353, 0, 1, 1,
0.8083742, -0.2860124, 1.820631, 0.7921569, 0, 1, 1,
0.8113195, -0.7557076, 3.428106, 0.8, 0, 1, 1,
0.814536, -1.111487, 1.021248, 0.8078431, 0, 1, 1,
0.8195675, 1.512332, 0.752472, 0.8117647, 0, 1, 1,
0.8265223, 0.5989982, -0.1838893, 0.8196079, 0, 1, 1,
0.8318662, -0.3390921, 4.708832, 0.8235294, 0, 1, 1,
0.8328437, 1.434097, -2.480265, 0.8313726, 0, 1, 1,
0.8355792, 0.5696869, -0.8878168, 0.8352941, 0, 1, 1,
0.8356817, -0.9508148, 1.229995, 0.8431373, 0, 1, 1,
0.8368977, -0.115788, 1.285537, 0.8470588, 0, 1, 1,
0.8406236, -0.3981095, 2.375247, 0.854902, 0, 1, 1,
0.8445939, -2.261472, 0.5990406, 0.8588235, 0, 1, 1,
0.845338, 1.17739, 1.047675, 0.8666667, 0, 1, 1,
0.845845, 3.177041, -1.208898, 0.8705882, 0, 1, 1,
0.8524463, 0.3124948, 0.111261, 0.8784314, 0, 1, 1,
0.8539425, 0.3466117, 2.032206, 0.8823529, 0, 1, 1,
0.8564369, -1.073553, 4.274509, 0.8901961, 0, 1, 1,
0.8785034, -0.7936871, 4.222873, 0.8941177, 0, 1, 1,
0.8787017, 1.449565, -0.9071887, 0.9019608, 0, 1, 1,
0.879879, -0.8173913, 3.073384, 0.9098039, 0, 1, 1,
0.8828661, -0.5938438, 3.856427, 0.9137255, 0, 1, 1,
0.8839571, -0.05474015, 2.055134, 0.9215686, 0, 1, 1,
0.8882827, -0.2728049, 2.66467, 0.9254902, 0, 1, 1,
0.8900492, -1.180229, 0.9589135, 0.9333333, 0, 1, 1,
0.8936276, 0.4283301, 1.928118, 0.9372549, 0, 1, 1,
0.8943666, 0.7543306, 1.737139, 0.945098, 0, 1, 1,
0.8948875, -1.213114, 1.537955, 0.9490196, 0, 1, 1,
0.9032623, -0.5360189, 1.284354, 0.9568627, 0, 1, 1,
0.9076303, -0.4572166, 3.03867, 0.9607843, 0, 1, 1,
0.9159257, 0.07669582, 0.5902417, 0.9686275, 0, 1, 1,
0.9247374, -0.05316711, 0.7631114, 0.972549, 0, 1, 1,
0.9307048, 2.374943, -0.2732787, 0.9803922, 0, 1, 1,
0.934254, -0.9309616, 3.077482, 0.9843137, 0, 1, 1,
0.9369982, -0.5705698, 1.806138, 0.9921569, 0, 1, 1,
0.9508873, 0.6492431, 2.306936, 0.9960784, 0, 1, 1,
0.9516368, -0.5357286, 3.182534, 1, 0, 0.9960784, 1,
0.9590687, 0.9309856, 2.169853, 1, 0, 0.9882353, 1,
0.9624569, -0.3553756, 1.785785, 1, 0, 0.9843137, 1,
0.9734499, -0.6008111, 1.723911, 1, 0, 0.9764706, 1,
0.9764682, -0.8110782, 2.86644, 1, 0, 0.972549, 1,
0.9807767, 2.610837, 0.7913964, 1, 0, 0.9647059, 1,
0.9809414, 1.061316, 1.938778, 1, 0, 0.9607843, 1,
0.9830853, -0.5221078, 2.717947, 1, 0, 0.9529412, 1,
0.9854203, -0.05198409, 1.561436, 1, 0, 0.9490196, 1,
0.9866288, 1.946659, 0.2157935, 1, 0, 0.9411765, 1,
0.9888787, 0.334765, 1.253456, 1, 0, 0.9372549, 1,
0.994401, 0.8051426, 1.622882, 1, 0, 0.9294118, 1,
0.99444, -0.1339056, 3.141629, 1, 0, 0.9254902, 1,
0.9968826, 0.6013563, 0.4151394, 1, 0, 0.9176471, 1,
0.9994466, -1.371887, 2.483581, 1, 0, 0.9137255, 1,
1.001453, 0.1423294, 1.121665, 1, 0, 0.9058824, 1,
1.018654, 0.5032474, 0.4095986, 1, 0, 0.9019608, 1,
1.022125, 2.115655, 0.607214, 1, 0, 0.8941177, 1,
1.025716, -0.3479204, 1.057714, 1, 0, 0.8862745, 1,
1.03079, -1.121559, 4.570206, 1, 0, 0.8823529, 1,
1.033093, 0.6162102, 1.695138, 1, 0, 0.8745098, 1,
1.047814, 1.263226, 1.4558, 1, 0, 0.8705882, 1,
1.049761, -1.996332, 1.661721, 1, 0, 0.8627451, 1,
1.065119, 0.161937, 1.53836, 1, 0, 0.8588235, 1,
1.066277, -0.1729909, 1.452244, 1, 0, 0.8509804, 1,
1.080238, 0.4824733, 1.295972, 1, 0, 0.8470588, 1,
1.083435, -0.8563227, 3.71747, 1, 0, 0.8392157, 1,
1.094841, 1.818614, -0.106947, 1, 0, 0.8352941, 1,
1.109309, 0.440234, 0.3099367, 1, 0, 0.827451, 1,
1.110264, 1.408264, 1.567324, 1, 0, 0.8235294, 1,
1.110645, 0.1655707, 1.30251, 1, 0, 0.8156863, 1,
1.112695, 1.199575, -0.2289445, 1, 0, 0.8117647, 1,
1.11785, 0.3687003, 1.541277, 1, 0, 0.8039216, 1,
1.119672, 0.1921917, 1.086224, 1, 0, 0.7960784, 1,
1.120621, -1.499694, 2.75166, 1, 0, 0.7921569, 1,
1.132392, 0.03490489, 3.513351, 1, 0, 0.7843137, 1,
1.132912, 0.1215492, 1.052006, 1, 0, 0.7803922, 1,
1.138925, -0.3704045, 2.424575, 1, 0, 0.772549, 1,
1.141636, -1.137187, 1.941109, 1, 0, 0.7686275, 1,
1.146984, -1.633949, 2.413036, 1, 0, 0.7607843, 1,
1.148282, -0.8512596, 2.439723, 1, 0, 0.7568628, 1,
1.148491, -1.206578, 1.2167, 1, 0, 0.7490196, 1,
1.152582, -0.09928128, 3.776644, 1, 0, 0.7450981, 1,
1.154242, -0.6585588, 2.132078, 1, 0, 0.7372549, 1,
1.156879, 0.5144035, 0.7284437, 1, 0, 0.7333333, 1,
1.159096, -0.5553897, 4.100795, 1, 0, 0.7254902, 1,
1.160251, -0.3830676, 2.846914, 1, 0, 0.7215686, 1,
1.165964, -0.9595498, 2.889288, 1, 0, 0.7137255, 1,
1.172675, 1.7229, 0.5472213, 1, 0, 0.7098039, 1,
1.172697, -0.8739465, 2.991832, 1, 0, 0.7019608, 1,
1.198079, -0.6091447, 2.01147, 1, 0, 0.6941177, 1,
1.221251, 0.6439112, 2.549793, 1, 0, 0.6901961, 1,
1.222532, 1.036553, -0.7576578, 1, 0, 0.682353, 1,
1.244472, -0.4059786, 0.8733674, 1, 0, 0.6784314, 1,
1.250653, -0.5625488, 1.59696, 1, 0, 0.6705883, 1,
1.271617, 0.8733436, 0.503037, 1, 0, 0.6666667, 1,
1.279545, 0.5470808, 2.065139, 1, 0, 0.6588235, 1,
1.288048, 0.4341315, -0.8820235, 1, 0, 0.654902, 1,
1.289363, -0.218279, 3.144807, 1, 0, 0.6470588, 1,
1.289693, 0.9829443, 0.8673638, 1, 0, 0.6431373, 1,
1.291316, -0.4072182, 2.670366, 1, 0, 0.6352941, 1,
1.298118, 0.02470747, -0.1211684, 1, 0, 0.6313726, 1,
1.299335, 0.5099467, 1.968951, 1, 0, 0.6235294, 1,
1.319646, 0.03346587, 1.901526, 1, 0, 0.6196079, 1,
1.322062, 0.8816041, 1.655428, 1, 0, 0.6117647, 1,
1.325204, 1.031912, 0.6728802, 1, 0, 0.6078432, 1,
1.325495, -0.7621679, 2.745295, 1, 0, 0.6, 1,
1.341269, -1.64588, 2.019947, 1, 0, 0.5921569, 1,
1.343811, 1.073957, 1.09346, 1, 0, 0.5882353, 1,
1.350629, 0.04316316, 2.547054, 1, 0, 0.5803922, 1,
1.352357, -0.4000217, 3.466377, 1, 0, 0.5764706, 1,
1.353256, 1.058981, 0.6431982, 1, 0, 0.5686275, 1,
1.360127, 0.698535, 0.8384714, 1, 0, 0.5647059, 1,
1.371187, -1.339088, 2.738526, 1, 0, 0.5568628, 1,
1.37136, -0.2247289, 2.166388, 1, 0, 0.5529412, 1,
1.387541, 0.001240832, 2.234527, 1, 0, 0.5450981, 1,
1.39093, -0.06657536, 1.93599, 1, 0, 0.5411765, 1,
1.397061, 0.08177873, 2.508028, 1, 0, 0.5333334, 1,
1.406043, -0.8974752, 1.850894, 1, 0, 0.5294118, 1,
1.410824, -0.3933674, 1.05206, 1, 0, 0.5215687, 1,
1.43156, 0.2727538, 2.242497, 1, 0, 0.5176471, 1,
1.432308, -1.06366, 1.257275, 1, 0, 0.509804, 1,
1.437178, 0.2154781, 1.282765, 1, 0, 0.5058824, 1,
1.4375, -0.4646288, 0.2876115, 1, 0, 0.4980392, 1,
1.444792, -1.215472, 1.763013, 1, 0, 0.4901961, 1,
1.44757, 1.050763, 0.3534656, 1, 0, 0.4862745, 1,
1.453668, -0.9408405, 2.741842, 1, 0, 0.4784314, 1,
1.455921, -1.477129, 2.487755, 1, 0, 0.4745098, 1,
1.458216, 0.3486132, 0.7396188, 1, 0, 0.4666667, 1,
1.462017, -0.1936871, 3.619338, 1, 0, 0.4627451, 1,
1.468305, -0.5490634, 3.145799, 1, 0, 0.454902, 1,
1.473728, 0.4216246, 1.852918, 1, 0, 0.4509804, 1,
1.474203, 0.288237, 2.64893, 1, 0, 0.4431373, 1,
1.479885, -1.534804, 3.975289, 1, 0, 0.4392157, 1,
1.49095, 0.07830328, 1.937294, 1, 0, 0.4313726, 1,
1.496687, 0.8059782, 0.7367911, 1, 0, 0.427451, 1,
1.500521, -0.2309719, 1.331525, 1, 0, 0.4196078, 1,
1.501873, 0.7456971, 1.913396, 1, 0, 0.4156863, 1,
1.51981, 0.4007242, 0.5915856, 1, 0, 0.4078431, 1,
1.520656, -0.3944, -0.06778563, 1, 0, 0.4039216, 1,
1.556797, -1.49254, 3.965758, 1, 0, 0.3960784, 1,
1.574286, -1.555942, 1.42382, 1, 0, 0.3882353, 1,
1.575435, 0.748241, 0.6084084, 1, 0, 0.3843137, 1,
1.575964, 0.2922728, 2.393167, 1, 0, 0.3764706, 1,
1.578459, 0.04948663, 2.655646, 1, 0, 0.372549, 1,
1.578605, 0.9371689, 2.444937, 1, 0, 0.3647059, 1,
1.582024, -0.1826093, 1.943678, 1, 0, 0.3607843, 1,
1.58664, 2.017585, -0.4196953, 1, 0, 0.3529412, 1,
1.592326, 0.9609069, -1.556927, 1, 0, 0.3490196, 1,
1.611992, 0.3755428, 0.05424216, 1, 0, 0.3411765, 1,
1.620159, -0.3825041, 2.244113, 1, 0, 0.3372549, 1,
1.622105, 0.6429619, 1.720455, 1, 0, 0.3294118, 1,
1.670136, 0.734186, 0.7884579, 1, 0, 0.3254902, 1,
1.672003, 2.076053, 1.265953, 1, 0, 0.3176471, 1,
1.673871, -0.6264058, 2.129591, 1, 0, 0.3137255, 1,
1.686009, -1.0038, 2.672221, 1, 0, 0.3058824, 1,
1.691013, -0.9648565, 1.094391, 1, 0, 0.2980392, 1,
1.700318, -0.2099849, 1.314359, 1, 0, 0.2941177, 1,
1.703146, -0.876492, 3.854973, 1, 0, 0.2862745, 1,
1.704454, -0.1535755, 2.519562, 1, 0, 0.282353, 1,
1.708945, 0.9192665, 1.490472, 1, 0, 0.2745098, 1,
1.72175, -1.163688, 3.770989, 1, 0, 0.2705882, 1,
1.728522, 1.048675, 1.152918, 1, 0, 0.2627451, 1,
1.734579, -1.541049, 0.3160982, 1, 0, 0.2588235, 1,
1.734721, -0.8397428, 0.7326961, 1, 0, 0.2509804, 1,
1.773141, 1.203639, 0.4905537, 1, 0, 0.2470588, 1,
1.785298, -0.6623985, 2.004377, 1, 0, 0.2392157, 1,
1.790727, 0.7230849, 0.3305039, 1, 0, 0.2352941, 1,
1.791769, -0.3243601, 0.1131857, 1, 0, 0.227451, 1,
1.809958, -1.053053, 2.52651, 1, 0, 0.2235294, 1,
1.81118, 1.072589, 0.8777372, 1, 0, 0.2156863, 1,
1.822909, -0.1964714, 1.547888, 1, 0, 0.2117647, 1,
1.837661, 1.014719, -0.479859, 1, 0, 0.2039216, 1,
1.839627, -1.993041, 2.846627, 1, 0, 0.1960784, 1,
1.85624, 0.8964697, -0.03408312, 1, 0, 0.1921569, 1,
1.86773, -0.887452, 0.6385987, 1, 0, 0.1843137, 1,
1.874204, 0.02781325, 0.3042253, 1, 0, 0.1803922, 1,
1.876913, -0.0875996, 2.200979, 1, 0, 0.172549, 1,
1.879265, 0.07789566, 0.1124322, 1, 0, 0.1686275, 1,
1.883858, 1.037114, 2.809718, 1, 0, 0.1607843, 1,
1.887061, 0.2575033, 0.9301643, 1, 0, 0.1568628, 1,
1.897511, 0.8982018, 3.486625, 1, 0, 0.1490196, 1,
1.936292, -0.4677344, 1.240067, 1, 0, 0.145098, 1,
1.947806, -0.4397623, 1.68911, 1, 0, 0.1372549, 1,
1.96207, -0.4065019, 0.347071, 1, 0, 0.1333333, 1,
1.96944, 0.254259, 2.042183, 1, 0, 0.1254902, 1,
1.999401, 0.5360003, 1.829819, 1, 0, 0.1215686, 1,
2.006822, -0.3805491, 0.5337611, 1, 0, 0.1137255, 1,
2.069335, 0.7040545, 1.15746, 1, 0, 0.1098039, 1,
2.075373, 0.1159846, 0.8938223, 1, 0, 0.1019608, 1,
2.094893, -0.0494192, 1.015719, 1, 0, 0.09411765, 1,
2.131326, 1.55763, 1.002211, 1, 0, 0.09019608, 1,
2.137935, 0.230262, 1.807778, 1, 0, 0.08235294, 1,
2.144713, 1.081727, -0.1440261, 1, 0, 0.07843138, 1,
2.194017, -0.3495614, 0.01359947, 1, 0, 0.07058824, 1,
2.268844, -0.6544099, 1.964194, 1, 0, 0.06666667, 1,
2.280633, 0.3992045, 2.40336, 1, 0, 0.05882353, 1,
2.297317, 0.5304593, 0.7717732, 1, 0, 0.05490196, 1,
2.304913, -0.9943855, 0.4205972, 1, 0, 0.04705882, 1,
2.330085, -0.09016922, 2.167051, 1, 0, 0.04313726, 1,
2.343628, 0.09874123, 2.278693, 1, 0, 0.03529412, 1,
2.346948, 0.7504907, 1.507656, 1, 0, 0.03137255, 1,
2.46586, -0.8138515, 0.2725378, 1, 0, 0.02352941, 1,
2.642765, -0.005323982, 0.2373394, 1, 0, 0.01960784, 1,
2.64392, -0.2769629, 0.7755731, 1, 0, 0.01176471, 1,
2.772432, -0.9319164, 2.239241, 1, 0, 0.007843138, 1
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
-0.2611426, -4.019281, -7.793159, 0, -0.5, 0.5, 0.5,
-0.2611426, -4.019281, -7.793159, 1, -0.5, 0.5, 0.5,
-0.2611426, -4.019281, -7.793159, 1, 1.5, 0.5, 0.5,
-0.2611426, -4.019281, -7.793159, 0, 1.5, 0.5, 0.5
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
-4.3231, 0.1003749, -7.793159, 0, -0.5, 0.5, 0.5,
-4.3231, 0.1003749, -7.793159, 1, -0.5, 0.5, 0.5,
-4.3231, 0.1003749, -7.793159, 1, 1.5, 0.5, 0.5,
-4.3231, 0.1003749, -7.793159, 0, 1.5, 0.5, 0.5
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
-4.3231, -4.019281, -0.2878764, 0, -0.5, 0.5, 0.5,
-4.3231, -4.019281, -0.2878764, 1, -0.5, 0.5, 0.5,
-4.3231, -4.019281, -0.2878764, 1, 1.5, 0.5, 0.5,
-4.3231, -4.019281, -0.2878764, 0, 1.5, 0.5, 0.5
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
-3, -3.068591, -6.061171,
2, -3.068591, -6.061171,
-3, -3.068591, -6.061171,
-3, -3.22704, -6.349836,
-2, -3.068591, -6.061171,
-2, -3.22704, -6.349836,
-1, -3.068591, -6.061171,
-1, -3.22704, -6.349836,
0, -3.068591, -6.061171,
0, -3.22704, -6.349836,
1, -3.068591, -6.061171,
1, -3.22704, -6.349836,
2, -3.068591, -6.061171,
2, -3.22704, -6.349836
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
-3, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
-3, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
-3, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
-3, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5,
-2, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
-2, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
-2, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
-2, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5,
-1, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
-1, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
-1, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
-1, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5,
0, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
0, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
0, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
0, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5,
1, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
1, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
1, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
1, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5,
2, -3.543936, -6.927165, 0, -0.5, 0.5, 0.5,
2, -3.543936, -6.927165, 1, -0.5, 0.5, 0.5,
2, -3.543936, -6.927165, 1, 1.5, 0.5, 0.5,
2, -3.543936, -6.927165, 0, 1.5, 0.5, 0.5
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
-3.385725, -2, -6.061171,
-3.385725, 3, -6.061171,
-3.385725, -2, -6.061171,
-3.541954, -2, -6.349836,
-3.385725, -1, -6.061171,
-3.541954, -1, -6.349836,
-3.385725, 0, -6.061171,
-3.541954, 0, -6.349836,
-3.385725, 1, -6.061171,
-3.541954, 1, -6.349836,
-3.385725, 2, -6.061171,
-3.541954, 2, -6.349836,
-3.385725, 3, -6.061171,
-3.541954, 3, -6.349836
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
-3.854412, -2, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, -2, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, -2, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, -2, -6.927165, 0, 1.5, 0.5, 0.5,
-3.854412, -1, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, -1, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, -1, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, -1, -6.927165, 0, 1.5, 0.5, 0.5,
-3.854412, 0, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, 0, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, 0, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, 0, -6.927165, 0, 1.5, 0.5, 0.5,
-3.854412, 1, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, 1, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, 1, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, 1, -6.927165, 0, 1.5, 0.5, 0.5,
-3.854412, 2, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, 2, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, 2, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, 2, -6.927165, 0, 1.5, 0.5, 0.5,
-3.854412, 3, -6.927165, 0, -0.5, 0.5, 0.5,
-3.854412, 3, -6.927165, 1, -0.5, 0.5, 0.5,
-3.854412, 3, -6.927165, 1, 1.5, 0.5, 0.5,
-3.854412, 3, -6.927165, 0, 1.5, 0.5, 0.5
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
-3.385725, -3.068591, -4,
-3.385725, -3.068591, 4,
-3.385725, -3.068591, -4,
-3.541954, -3.22704, -4,
-3.385725, -3.068591, -2,
-3.541954, -3.22704, -2,
-3.385725, -3.068591, 0,
-3.541954, -3.22704, 0,
-3.385725, -3.068591, 2,
-3.541954, -3.22704, 2,
-3.385725, -3.068591, 4,
-3.541954, -3.22704, 4
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
-3.854412, -3.543936, -4, 0, -0.5, 0.5, 0.5,
-3.854412, -3.543936, -4, 1, -0.5, 0.5, 0.5,
-3.854412, -3.543936, -4, 1, 1.5, 0.5, 0.5,
-3.854412, -3.543936, -4, 0, 1.5, 0.5, 0.5,
-3.854412, -3.543936, -2, 0, -0.5, 0.5, 0.5,
-3.854412, -3.543936, -2, 1, -0.5, 0.5, 0.5,
-3.854412, -3.543936, -2, 1, 1.5, 0.5, 0.5,
-3.854412, -3.543936, -2, 0, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 0, 0, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 0, 1, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 0, 1, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 0, 0, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 2, 0, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 2, 1, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 2, 1, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 2, 0, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 4, 0, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 4, 1, -0.5, 0.5, 0.5,
-3.854412, -3.543936, 4, 1, 1.5, 0.5, 0.5,
-3.854412, -3.543936, 4, 0, 1.5, 0.5, 0.5
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
-3.385725, -3.068591, -6.061171,
-3.385725, 3.269341, -6.061171,
-3.385725, -3.068591, 5.485418,
-3.385725, 3.269341, 5.485418,
-3.385725, -3.068591, -6.061171,
-3.385725, -3.068591, 5.485418,
-3.385725, 3.269341, -6.061171,
-3.385725, 3.269341, 5.485418,
-3.385725, -3.068591, -6.061171,
2.86344, -3.068591, -6.061171,
-3.385725, -3.068591, 5.485418,
2.86344, -3.068591, 5.485418,
-3.385725, 3.269341, -6.061171,
2.86344, 3.269341, -6.061171,
-3.385725, 3.269341, 5.485418,
2.86344, 3.269341, 5.485418,
2.86344, -3.068591, -6.061171,
2.86344, 3.269341, -6.061171,
2.86344, -3.068591, 5.485418,
2.86344, 3.269341, 5.485418,
2.86344, -3.068591, -6.061171,
2.86344, -3.068591, 5.485418,
2.86344, 3.269341, -6.061171,
2.86344, 3.269341, 5.485418
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
var radius = 7.784865;
var distance = 34.63574;
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
mvMatrix.translate( 0.2611426, -0.1003749, 0.2878764 );
mvMatrix.scale( 1.346924, 1.328059, 0.7289727 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63574);
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
p-chlorotoluene<-read.table("p-chlorotoluene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-p-chlorotoluene$V2
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```r
y<-p-chlorotoluene$V3
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```r
z<-p-chlorotoluene$V4
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
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
-3.294718, -1.676746, -2.26668, 0, 0, 1, 1, 1,
-3.015594, -1.98775, -1.556984, 1, 0, 0, 1, 1,
-2.839421, -1.305447, -2.953833, 1, 0, 0, 1, 1,
-2.821173, 0.0644204, -1.311153, 1, 0, 0, 1, 1,
-2.81211, 1.572258, -0.8752595, 1, 0, 0, 1, 1,
-2.518833, -0.1669861, 0.1067156, 1, 0, 0, 1, 1,
-2.492027, -1.491264, -3.106452, 0, 0, 0, 1, 1,
-2.452693, -0.05911531, -0.4830267, 0, 0, 0, 1, 1,
-2.40455, -0.663951, -2.103457, 0, 0, 0, 1, 1,
-2.350826, -0.4468146, -1.552459, 0, 0, 0, 1, 1,
-2.329521, -0.02749645, -2.427887, 0, 0, 0, 1, 1,
-2.287074, -1.689637, -3.805389, 0, 0, 0, 1, 1,
-2.229052, 0.3008316, -2.262638, 0, 0, 0, 1, 1,
-2.218179, 1.202654, -2.228115, 1, 1, 1, 1, 1,
-2.155678, 0.5971084, -1.012195, 1, 1, 1, 1, 1,
-2.152477, -0.09345751, -1.267494, 1, 1, 1, 1, 1,
-2.087081, -0.2796206, -2.428254, 1, 1, 1, 1, 1,
-2.06706, 0.4710959, 0.3648554, 1, 1, 1, 1, 1,
-2.039053, 0.6087811, 0.3085489, 1, 1, 1, 1, 1,
-2.025362, -0.6552317, -1.336449, 1, 1, 1, 1, 1,
-2.00706, 0.4968334, -0.9897198, 1, 1, 1, 1, 1,
-1.990683, -0.960492, -1.432726, 1, 1, 1, 1, 1,
-1.983917, 1.001003, -0.7938624, 1, 1, 1, 1, 1,
-1.977713, 1.222664, -1.050783, 1, 1, 1, 1, 1,
-1.954688, 0.1247435, -1.88806, 1, 1, 1, 1, 1,
-1.942869, 0.3885697, -1.961667, 1, 1, 1, 1, 1,
-1.938718, -0.5568423, -1.401954, 1, 1, 1, 1, 1,
-1.937107, -0.4733116, -2.65444, 1, 1, 1, 1, 1,
-1.901628, -0.7200326, -0.7364286, 0, 0, 1, 1, 1,
-1.89503, 0.1979036, -0.3011846, 1, 0, 0, 1, 1,
-1.887262, -0.2705609, -1.057569, 1, 0, 0, 1, 1,
-1.882056, 0.5430829, -2.231423, 1, 0, 0, 1, 1,
-1.872697, 0.2576879, -2.514159, 1, 0, 0, 1, 1,
-1.862551, -0.2170803, -2.488309, 1, 0, 0, 1, 1,
-1.848106, 0.3348905, -1.070598, 0, 0, 0, 1, 1,
-1.813962, -0.2460457, -1.744928, 0, 0, 0, 1, 1,
-1.799541, 1.380834, 1.978852, 0, 0, 0, 1, 1,
-1.789502, 1.578874, -2.153054, 0, 0, 0, 1, 1,
-1.781123, -0.6186237, -2.982363, 0, 0, 0, 1, 1,
-1.77553, -1.804846, -2.761068, 0, 0, 0, 1, 1,
-1.7664, -0.5956955, -1.259679, 0, 0, 0, 1, 1,
-1.751058, -1.168406, -1.025703, 1, 1, 1, 1, 1,
-1.741377, -0.3260162, -1.559092, 1, 1, 1, 1, 1,
-1.73774, -1.580776, -2.970583, 1, 1, 1, 1, 1,
-1.725441, 0.6281432, -0.9585171, 1, 1, 1, 1, 1,
-1.720449, 0.2565568, -2.378931, 1, 1, 1, 1, 1,
-1.718874, -0.7361782, -1.711484, 1, 1, 1, 1, 1,
-1.716786, -1.848175, -4.159914, 1, 1, 1, 1, 1,
-1.690094, -0.3748196, -5.557015, 1, 1, 1, 1, 1,
-1.687393, 0.1434039, -0.4220385, 1, 1, 1, 1, 1,
-1.683984, -0.003022695, -0.4683734, 1, 1, 1, 1, 1,
-1.683159, -0.2757114, -1.247274, 1, 1, 1, 1, 1,
-1.68128, -0.9342744, -2.650148, 1, 1, 1, 1, 1,
-1.660552, -0.3415034, -1.710032, 1, 1, 1, 1, 1,
-1.659063, 2.064926, -1.31474, 1, 1, 1, 1, 1,
-1.637124, 1.17516, 0.1530976, 1, 1, 1, 1, 1,
-1.630867, -1.494013, -1.753912, 0, 0, 1, 1, 1,
-1.625034, -1.263013, -2.733463, 1, 0, 0, 1, 1,
-1.618803, -2.564363, -3.363786, 1, 0, 0, 1, 1,
-1.602417, 0.8263917, -0.3768859, 1, 0, 0, 1, 1,
-1.597025, 0.2138219, -0.237107, 1, 0, 0, 1, 1,
-1.59564, -0.06328268, -0.8886994, 1, 0, 0, 1, 1,
-1.561072, 0.7237476, -0.8750099, 0, 0, 0, 1, 1,
-1.553277, 0.5166818, -0.7074463, 0, 0, 0, 1, 1,
-1.552192, 0.2627636, 1.086761, 0, 0, 0, 1, 1,
-1.546902, 0.1249294, -1.07292, 0, 0, 0, 1, 1,
-1.531333, 2.666284, -2.7138, 0, 0, 0, 1, 1,
-1.512457, -0.3877356, -2.569207, 0, 0, 0, 1, 1,
-1.502591, -2.807189, -2.476518, 0, 0, 0, 1, 1,
-1.499322, 0.9102464, -1.107214, 1, 1, 1, 1, 1,
-1.496991, -0.1232024, -2.794508, 1, 1, 1, 1, 1,
-1.485775, -0.01820167, -2.76513, 1, 1, 1, 1, 1,
-1.480427, 0.7381678, -0.3077265, 1, 1, 1, 1, 1,
-1.479869, 1.051778, -2.322309, 1, 1, 1, 1, 1,
-1.464638, 0.5674325, -1.975832, 1, 1, 1, 1, 1,
-1.461973, 1.190146, -0.5409409, 1, 1, 1, 1, 1,
-1.445615, 0.5393402, -1.4563, 1, 1, 1, 1, 1,
-1.441664, 0.09647173, -2.504484, 1, 1, 1, 1, 1,
-1.431977, 1.393221, -4.38732, 1, 1, 1, 1, 1,
-1.430372, -0.8559011, -3.612956, 1, 1, 1, 1, 1,
-1.428351, 0.03843237, -1.84771, 1, 1, 1, 1, 1,
-1.423825, -0.3752179, -0.4043621, 1, 1, 1, 1, 1,
-1.393642, -1.216081, -4.899861, 1, 1, 1, 1, 1,
-1.389156, -0.1195784, -2.608024, 1, 1, 1, 1, 1,
-1.383034, 0.4150653, -1.524684, 0, 0, 1, 1, 1,
-1.374722, -0.7155253, -1.545156, 1, 0, 0, 1, 1,
-1.372714, -0.8518514, -1.275008, 1, 0, 0, 1, 1,
-1.36658, -0.7390452, -2.537186, 1, 0, 0, 1, 1,
-1.350003, 0.3120898, -2.169862, 1, 0, 0, 1, 1,
-1.343751, -0.5073254, -0.1362723, 1, 0, 0, 1, 1,
-1.343087, 0.7586334, -1.029239, 0, 0, 0, 1, 1,
-1.340483, 0.5920104, -1.273925, 0, 0, 0, 1, 1,
-1.322331, 1.015489, -1.056025, 0, 0, 0, 1, 1,
-1.321952, -0.7625561, -3.479246, 0, 0, 0, 1, 1,
-1.320856, 0.1516345, -1.73024, 0, 0, 0, 1, 1,
-1.318858, -1.142286, -1.989356, 0, 0, 0, 1, 1,
-1.31617, 0.754454, -1.607034, 0, 0, 0, 1, 1,
-1.303168, -0.9376305, -3.043061, 1, 1, 1, 1, 1,
-1.290298, -0.1029148, -3.437172, 1, 1, 1, 1, 1,
-1.289162, -0.2351584, -2.146068, 1, 1, 1, 1, 1,
-1.283239, 0.3844084, -2.046993, 1, 1, 1, 1, 1,
-1.279229, -0.276258, -1.267763, 1, 1, 1, 1, 1,
-1.277954, 0.07381327, 0.1703369, 1, 1, 1, 1, 1,
-1.2745, -0.4260682, -0.3505951, 1, 1, 1, 1, 1,
-1.271722, 1.718829, -0.5399948, 1, 1, 1, 1, 1,
-1.269223, -0.8264984, -3.361164, 1, 1, 1, 1, 1,
-1.2637, -0.4993941, -0.4460619, 1, 1, 1, 1, 1,
-1.26348, 0.937122, -2.495647, 1, 1, 1, 1, 1,
-1.259049, -1.150312, -1.519875, 1, 1, 1, 1, 1,
-1.255504, -1.299422, -2.848499, 1, 1, 1, 1, 1,
-1.250817, 1.736889, -0.3807665, 1, 1, 1, 1, 1,
-1.24785, 2.136448, -1.355003, 1, 1, 1, 1, 1,
-1.247494, -2.976291, -4.095488, 0, 0, 1, 1, 1,
-1.240769, 1.29062, -1.744022, 1, 0, 0, 1, 1,
-1.239764, -0.7154396, -3.284504, 1, 0, 0, 1, 1,
-1.238812, 0.9827569, -0.6334921, 1, 0, 0, 1, 1,
-1.234693, 0.01627722, -1.028729, 1, 0, 0, 1, 1,
-1.222604, -0.332867, -3.286275, 1, 0, 0, 1, 1,
-1.221905, -2.037017, -2.165826, 0, 0, 0, 1, 1,
-1.218679, 0.5007932, 0.1850153, 0, 0, 0, 1, 1,
-1.216271, 1.080595, -2.365896, 0, 0, 0, 1, 1,
-1.214343, -0.4952561, -2.063549, 0, 0, 0, 1, 1,
-1.204374, -0.1487826, -1.010683, 0, 0, 0, 1, 1,
-1.20367, 1.604141, -1.361365, 0, 0, 0, 1, 1,
-1.195239, 1.022764, -0.7952645, 0, 0, 0, 1, 1,
-1.192521, 2.298514, -2.648219, 1, 1, 1, 1, 1,
-1.189126, 1.157964, -1.607164, 1, 1, 1, 1, 1,
-1.169159, -0.1408952, -2.127351, 1, 1, 1, 1, 1,
-1.158235, 0.7719001, 0.2697022, 1, 1, 1, 1, 1,
-1.157346, 0.07002115, -0.4045398, 1, 1, 1, 1, 1,
-1.156701, -0.08848332, -0.2118766, 1, 1, 1, 1, 1,
-1.152642, -0.3922211, -3.000787, 1, 1, 1, 1, 1,
-1.140967, -0.9175917, -2.535452, 1, 1, 1, 1, 1,
-1.131101, 0.6451832, -0.6305342, 1, 1, 1, 1, 1,
-1.127198, -2.775658, -1.622643, 1, 1, 1, 1, 1,
-1.125363, -0.4669813, -1.675689, 1, 1, 1, 1, 1,
-1.12456, 2.12163, 0.004959033, 1, 1, 1, 1, 1,
-1.12325, -1.662346, -2.8436, 1, 1, 1, 1, 1,
-1.114134, -1.378078, -2.687199, 1, 1, 1, 1, 1,
-1.112945, 0.03796174, -0.8524057, 1, 1, 1, 1, 1,
-1.112593, -1.503733, -2.298092, 0, 0, 1, 1, 1,
-1.108057, -0.1028212, -2.302263, 1, 0, 0, 1, 1,
-1.10686, -0.9209368, -2.741109, 1, 0, 0, 1, 1,
-1.094834, 0.8997241, -2.373195, 1, 0, 0, 1, 1,
-1.09336, 0.03151141, 0.5312347, 1, 0, 0, 1, 1,
-1.093173, -0.763324, -3.397019, 1, 0, 0, 1, 1,
-1.089409, 0.171131, -0.7784613, 0, 0, 0, 1, 1,
-1.088927, 0.6894282, -2.559403, 0, 0, 0, 1, 1,
-1.088736, 0.6564454, -0.1973772, 0, 0, 0, 1, 1,
-1.07455, -0.6917394, -2.450027, 0, 0, 0, 1, 1,
-1.074343, -0.7079118, -2.402819, 0, 0, 0, 1, 1,
-1.067283, 0.3808644, -1.90622, 0, 0, 0, 1, 1,
-1.066143, 0.7082608, -1.537848, 0, 0, 0, 1, 1,
-1.063975, -0.7077377, -1.714011, 1, 1, 1, 1, 1,
-1.060414, -1.597971, -1.51729, 1, 1, 1, 1, 1,
-1.054642, 0.1877598, -2.371634, 1, 1, 1, 1, 1,
-1.054166, -0.9908627, -2.709234, 1, 1, 1, 1, 1,
-1.053984, 1.912114, 0.4991375, 1, 1, 1, 1, 1,
-1.052226, 0.8306029, -1.563976, 1, 1, 1, 1, 1,
-1.051378, -0.4653052, -2.059502, 1, 1, 1, 1, 1,
-1.048843, -0.6706384, 0.1070643, 1, 1, 1, 1, 1,
-1.04728, -0.7537477, -1.594867, 1, 1, 1, 1, 1,
-1.045233, -0.6041048, -3.490335, 1, 1, 1, 1, 1,
-1.045138, -0.8712431, -3.922186, 1, 1, 1, 1, 1,
-1.031863, -0.6688144, -2.663018, 1, 1, 1, 1, 1,
-1.027304, -0.7461521, -1.470716, 1, 1, 1, 1, 1,
-1.026121, -0.954993, -3.999412, 1, 1, 1, 1, 1,
-1.026043, -0.6140888, -0.1152361, 1, 1, 1, 1, 1,
-1.023068, -1.36528, -3.301145, 0, 0, 1, 1, 1,
-1.02236, 0.9704363, -0.9487049, 1, 0, 0, 1, 1,
-1.021897, 0.6308841, -0.544512, 1, 0, 0, 1, 1,
-1.020511, 0.1280416, -0.6187052, 1, 0, 0, 1, 1,
-1.018287, -0.02418067, -1.955349, 1, 0, 0, 1, 1,
-1.015023, -0.6591458, -2.519104, 1, 0, 0, 1, 1,
-1.013461, 2.188539, -0.5625138, 0, 0, 0, 1, 1,
-1.010539, -0.3122522, -1.902378, 0, 0, 0, 1, 1,
-1.008047, 0.1273212, -0.1790409, 0, 0, 0, 1, 1,
-1.007725, 0.1941028, -3.170629, 0, 0, 0, 1, 1,
-0.9934174, 0.08314855, -1.915971, 0, 0, 0, 1, 1,
-0.9887996, -2.367011, -2.578151, 0, 0, 0, 1, 1,
-0.98729, -1.242877, -2.723778, 0, 0, 0, 1, 1,
-0.9871936, -0.5959793, -0.4555281, 1, 1, 1, 1, 1,
-0.9795097, 0.1637222, 0.2846119, 1, 1, 1, 1, 1,
-0.9765014, -1.738907, -2.64925, 1, 1, 1, 1, 1,
-0.9652604, -0.8200915, -0.7655388, 1, 1, 1, 1, 1,
-0.9578453, -0.4711897, -2.212596, 1, 1, 1, 1, 1,
-0.9551108, -1.063322, -3.086783, 1, 1, 1, 1, 1,
-0.949183, -0.7404881, -1.270339, 1, 1, 1, 1, 1,
-0.9474868, -1.739125, -2.508455, 1, 1, 1, 1, 1,
-0.9256336, -0.1455449, -0.7661255, 1, 1, 1, 1, 1,
-0.9207141, 0.82217, 1.722135, 1, 1, 1, 1, 1,
-0.917612, -0.5599064, -1.683518, 1, 1, 1, 1, 1,
-0.9126359, 1.610012, -1.592595, 1, 1, 1, 1, 1,
-0.9107765, 1.138665, -1.025561, 1, 1, 1, 1, 1,
-0.9087444, -0.3076063, -2.10222, 1, 1, 1, 1, 1,
-0.895725, -0.5171779, -1.927227, 1, 1, 1, 1, 1,
-0.8851895, 0.6367588, -0.9075662, 0, 0, 1, 1, 1,
-0.8809509, 1.915927, 0.3290494, 1, 0, 0, 1, 1,
-0.8725103, 0.9702127, -0.868395, 1, 0, 0, 1, 1,
-0.8688083, 0.4641018, -1.157197, 1, 0, 0, 1, 1,
-0.8676754, 0.1387143, -2.349154, 1, 0, 0, 1, 1,
-0.8654101, 0.4564272, -1.197405, 1, 0, 0, 1, 1,
-0.8624581, -0.285621, -1.681885, 0, 0, 0, 1, 1,
-0.8619593, -0.9349069, -2.015073, 0, 0, 0, 1, 1,
-0.8574312, 0.3928404, -2.142531, 0, 0, 0, 1, 1,
-0.8555478, -0.925875, -2.369086, 0, 0, 0, 1, 1,
-0.8528508, -0.9566261, -2.1408, 0, 0, 0, 1, 1,
-0.8468433, -0.5116862, -3.119407, 0, 0, 0, 1, 1,
-0.84187, 0.5593939, -1.06957, 0, 0, 0, 1, 1,
-0.8341062, 0.6099494, -0.9593614, 1, 1, 1, 1, 1,
-0.8292924, -0.2523696, -0.6497474, 1, 1, 1, 1, 1,
-0.8219216, -0.6716449, -3.149896, 1, 1, 1, 1, 1,
-0.8176825, -0.4080347, -0.4652165, 1, 1, 1, 1, 1,
-0.8140808, -0.5044054, -2.531589, 1, 1, 1, 1, 1,
-0.8129426, -0.487951, -1.760898, 1, 1, 1, 1, 1,
-0.8121381, -0.2487119, -3.596626, 1, 1, 1, 1, 1,
-0.8115878, 0.8978792, -1.242553, 1, 1, 1, 1, 1,
-0.8066546, 0.3869338, 0.3432787, 1, 1, 1, 1, 1,
-0.8028687, -0.8717169, -3.084165, 1, 1, 1, 1, 1,
-0.7911546, 0.0307765, -2.693324, 1, 1, 1, 1, 1,
-0.7848113, -1.017502, -3.693293, 1, 1, 1, 1, 1,
-0.7787508, 0.2472513, -0.3589862, 1, 1, 1, 1, 1,
-0.7706097, -0.7580495, -3.56512, 1, 1, 1, 1, 1,
-0.7677718, -1.41965, -2.245161, 1, 1, 1, 1, 1,
-0.7652129, -0.03904214, -0.7014362, 0, 0, 1, 1, 1,
-0.7629195, -0.916353, -2.064642, 1, 0, 0, 1, 1,
-0.7560062, -0.7140769, -2.924411, 1, 0, 0, 1, 1,
-0.7504938, -0.4825244, -1.651107, 1, 0, 0, 1, 1,
-0.7467445, -0.3566266, -3.266711, 1, 0, 0, 1, 1,
-0.7466024, -2.289814, -2.060385, 1, 0, 0, 1, 1,
-0.7418262, -1.745018, -1.615941, 0, 0, 0, 1, 1,
-0.7340562, 1.15821, 0.1273087, 0, 0, 0, 1, 1,
-0.7331268, -0.7346882, -3.266454, 0, 0, 0, 1, 1,
-0.7308578, 1.749629, 0.5307462, 0, 0, 0, 1, 1,
-0.724272, 2.297396, 0.4091939, 0, 0, 0, 1, 1,
-0.7183647, -1.376281, -3.257968, 0, 0, 0, 1, 1,
-0.718147, 1.044574, -0.7531567, 0, 0, 0, 1, 1,
-0.7166767, 1.642702, 0.4996984, 1, 1, 1, 1, 1,
-0.7155004, 0.8195679, -1.251072, 1, 1, 1, 1, 1,
-0.7148482, -0.4136001, -0.6813266, 1, 1, 1, 1, 1,
-0.7135127, -0.5125754, -2.742884, 1, 1, 1, 1, 1,
-0.71303, 0.3613018, -1.880237, 1, 1, 1, 1, 1,
-0.7122704, 0.3830373, -0.9698434, 1, 1, 1, 1, 1,
-0.7111982, -0.1442833, -1.618345, 1, 1, 1, 1, 1,
-0.6994786, 0.05874975, -2.048171, 1, 1, 1, 1, 1,
-0.6973364, 1.387307, -0.587222, 1, 1, 1, 1, 1,
-0.6940584, -0.9902281, -2.213614, 1, 1, 1, 1, 1,
-0.692334, -0.3304738, -2.148166, 1, 1, 1, 1, 1,
-0.6848431, -1.242916, -1.976046, 1, 1, 1, 1, 1,
-0.6836687, 0.6018058, -2.337617, 1, 1, 1, 1, 1,
-0.6796975, 1.428369, -0.4857841, 1, 1, 1, 1, 1,
-0.6792948, 0.1988222, -0.4273298, 1, 1, 1, 1, 1,
-0.6771861, 0.1402527, -1.387678, 0, 0, 1, 1, 1,
-0.675655, -2.302085, -2.783746, 1, 0, 0, 1, 1,
-0.674386, -0.1957975, -1.403009, 1, 0, 0, 1, 1,
-0.6713454, 0.1666775, 0.1043859, 1, 0, 0, 1, 1,
-0.6636788, 0.09457941, -1.888416, 1, 0, 0, 1, 1,
-0.6595201, 1.031419, -0.1343568, 1, 0, 0, 1, 1,
-0.6580192, 0.01780262, -3.535996, 0, 0, 0, 1, 1,
-0.6579538, -0.6733581, -1.791686, 0, 0, 0, 1, 1,
-0.6572719, 0.2394309, -2.398193, 0, 0, 0, 1, 1,
-0.6518891, -1.94, -2.665528, 0, 0, 0, 1, 1,
-0.6477363, -2.052001, -2.727161, 0, 0, 0, 1, 1,
-0.646336, 0.4693958, -2.231246, 0, 0, 0, 1, 1,
-0.6370237, 0.483252, -2.710546, 0, 0, 0, 1, 1,
-0.6339987, 0.3352336, -1.671279, 1, 1, 1, 1, 1,
-0.630474, 0.6594743, 0.04991782, 1, 1, 1, 1, 1,
-0.6234509, 0.5888324, -1.905413, 1, 1, 1, 1, 1,
-0.6233926, 0.0706126, -1.188127, 1, 1, 1, 1, 1,
-0.6155373, -1.905815, -2.10101, 1, 1, 1, 1, 1,
-0.6140369, -1.131901, -2.436709, 1, 1, 1, 1, 1,
-0.6133214, 0.5550668, -1.685348, 1, 1, 1, 1, 1,
-0.6100932, 2.527261, 1.29775, 1, 1, 1, 1, 1,
-0.6092618, -0.7673312, -3.127095, 1, 1, 1, 1, 1,
-0.6076675, 0.7169201, -1.830097, 1, 1, 1, 1, 1,
-0.6044186, -0.7357218, -3.086237, 1, 1, 1, 1, 1,
-0.6036755, 0.008978559, -1.502425, 1, 1, 1, 1, 1,
-0.6033418, -1.458084, -2.7403, 1, 1, 1, 1, 1,
-0.6025245, -0.2290604, -1.722022, 1, 1, 1, 1, 1,
-0.5989211, 0.5707508, -0.2446559, 1, 1, 1, 1, 1,
-0.5944261, 0.2093193, -0.9740201, 0, 0, 1, 1, 1,
-0.5784341, -0.1280835, -2.251497, 1, 0, 0, 1, 1,
-0.5775483, -2.312603, -3.485728, 1, 0, 0, 1, 1,
-0.5725248, 0.7312485, -1.749762, 1, 0, 0, 1, 1,
-0.5720523, -0.5109971, -1.950843, 1, 0, 0, 1, 1,
-0.5717394, -0.7912196, -2.407605, 1, 0, 0, 1, 1,
-0.5696957, -0.3354475, -2.363916, 0, 0, 0, 1, 1,
-0.5696803, -0.6860284, -3.800919, 0, 0, 0, 1, 1,
-0.5660395, 0.3365046, -1.826977, 0, 0, 0, 1, 1,
-0.5615313, 1.38671, -0.6698894, 0, 0, 0, 1, 1,
-0.5603073, 0.3295397, -1.136439, 0, 0, 0, 1, 1,
-0.5584325, -1.532968, -2.873208, 0, 0, 0, 1, 1,
-0.5567046, 0.5447349, -2.274321, 0, 0, 0, 1, 1,
-0.5547751, -0.78008, -2.30127, 1, 1, 1, 1, 1,
-0.547456, 0.2968234, 0.01505841, 1, 1, 1, 1, 1,
-0.5468965, -0.4602078, -2.748645, 1, 1, 1, 1, 1,
-0.5448238, 0.9966096, -2.125621, 1, 1, 1, 1, 1,
-0.5441759, -0.7959803, -2.7141, 1, 1, 1, 1, 1,
-0.5422244, -1.445971, -1.894656, 1, 1, 1, 1, 1,
-0.5413506, -0.6413659, -3.11963, 1, 1, 1, 1, 1,
-0.5409514, -0.402004, -2.835679, 1, 1, 1, 1, 1,
-0.5399922, -0.5961611, -0.7591932, 1, 1, 1, 1, 1,
-0.5395495, -2.128213, -3.257902, 1, 1, 1, 1, 1,
-0.5345525, -0.5708557, -1.880358, 1, 1, 1, 1, 1,
-0.533811, 0.6422571, -2.51634, 1, 1, 1, 1, 1,
-0.5336822, -1.234987, -2.23685, 1, 1, 1, 1, 1,
-0.5276209, -0.2432471, -0.5249432, 1, 1, 1, 1, 1,
-0.5255506, -0.38481, -1.869341, 1, 1, 1, 1, 1,
-0.5234486, -0.3306944, -2.222411, 0, 0, 1, 1, 1,
-0.5217525, -0.6033484, -2.794945, 1, 0, 0, 1, 1,
-0.5211427, -0.2618044, -2.359667, 1, 0, 0, 1, 1,
-0.5192665, 0.2604414, -0.9450719, 1, 0, 0, 1, 1,
-0.5168946, -0.4487786, -1.304182, 1, 0, 0, 1, 1,
-0.5168865, -0.163862, -2.601992, 1, 0, 0, 1, 1,
-0.5167576, 0.3993525, -1.697828, 0, 0, 0, 1, 1,
-0.5093121, 0.7766218, -0.9483731, 0, 0, 0, 1, 1,
-0.5068018, 1.665637, 0.4161122, 0, 0, 0, 1, 1,
-0.5056028, -1.469554, -1.165694, 0, 0, 0, 1, 1,
-0.4980871, 0.09450543, -1.177632, 0, 0, 0, 1, 1,
-0.4946733, -0.8654169, -2.182335, 0, 0, 0, 1, 1,
-0.4920943, -1.163313, -3.834101, 0, 0, 0, 1, 1,
-0.4878939, 0.9301526, -0.07911932, 1, 1, 1, 1, 1,
-0.4861381, 0.1174314, 0.5048454, 1, 1, 1, 1, 1,
-0.4859513, 0.3529398, -1.705441, 1, 1, 1, 1, 1,
-0.4783133, 0.8617886, -0.8362795, 1, 1, 1, 1, 1,
-0.475694, 1.484092, 0.7082301, 1, 1, 1, 1, 1,
-0.4755467, 0.0121578, -3.083796, 1, 1, 1, 1, 1,
-0.4692992, -0.9017059, -2.525678, 1, 1, 1, 1, 1,
-0.466992, -0.687787, -3.213859, 1, 1, 1, 1, 1,
-0.465383, -0.1899644, -2.643942, 1, 1, 1, 1, 1,
-0.4546646, 0.5528679, -0.2617433, 1, 1, 1, 1, 1,
-0.4527968, -1.415702, -3.252419, 1, 1, 1, 1, 1,
-0.4524167, 0.3599461, -0.830194, 1, 1, 1, 1, 1,
-0.4517764, 0.7370774, -0.4836121, 1, 1, 1, 1, 1,
-0.4461775, 0.2624297, -1.483696, 1, 1, 1, 1, 1,
-0.4445219, -0.3088067, -2.544665, 1, 1, 1, 1, 1,
-0.438061, -0.1245586, -2.862047, 0, 0, 1, 1, 1,
-0.4270854, 0.3476699, -0.6680286, 1, 0, 0, 1, 1,
-0.4250075, -0.9707742, -2.823962, 1, 0, 0, 1, 1,
-0.424229, 1.538746, 1.07192, 1, 0, 0, 1, 1,
-0.4213189, 1.735679, 0.2370379, 1, 0, 0, 1, 1,
-0.4205054, 0.06278454, -2.10752, 1, 0, 0, 1, 1,
-0.418048, 1.030753, 1.765547, 0, 0, 0, 1, 1,
-0.4155578, -0.2022968, -3.117943, 0, 0, 0, 1, 1,
-0.4138784, -0.8687722, -1.545423, 0, 0, 0, 1, 1,
-0.4095797, 0.5228466, -0.7030183, 0, 0, 0, 1, 1,
-0.4073423, 0.02886041, -1.560308, 0, 0, 0, 1, 1,
-0.4056275, -1.311003, -2.632327, 0, 0, 0, 1, 1,
-0.4025721, 0.4728566, 1.301355, 0, 0, 0, 1, 1,
-0.401951, -1.058597, -1.007827, 1, 1, 1, 1, 1,
-0.4009593, -1.245817, -4.722529, 1, 1, 1, 1, 1,
-0.3996243, 0.7616524, 0.6706863, 1, 1, 1, 1, 1,
-0.3981477, -0.09618893, -2.178523, 1, 1, 1, 1, 1,
-0.3899616, -0.4677593, -2.916923, 1, 1, 1, 1, 1,
-0.3888034, -0.05219965, -2.496488, 1, 1, 1, 1, 1,
-0.3803442, 1.039204, -0.5712808, 1, 1, 1, 1, 1,
-0.378745, 0.211558, -0.2027363, 1, 1, 1, 1, 1,
-0.3744175, -0.05465432, -4.060045, 1, 1, 1, 1, 1,
-0.3693979, -0.5762137, -2.386626, 1, 1, 1, 1, 1,
-0.3637688, 0.5081975, -2.378289, 1, 1, 1, 1, 1,
-0.3621052, 0.9408529, -0.6121477, 1, 1, 1, 1, 1,
-0.3587864, -2.406434, -2.623837, 1, 1, 1, 1, 1,
-0.3580927, -0.08636406, -2.09663, 1, 1, 1, 1, 1,
-0.3558931, 1.042367, -0.519976, 1, 1, 1, 1, 1,
-0.3521872, 0.214905, -2.604108, 0, 0, 1, 1, 1,
-0.3519769, -0.7406569, -1.828404, 1, 0, 0, 1, 1,
-0.3517941, -0.7114481, -3.44387, 1, 0, 0, 1, 1,
-0.3500944, -0.127042, -3.436222, 1, 0, 0, 1, 1,
-0.3481488, -1.256311, -3.61716, 1, 0, 0, 1, 1,
-0.3479966, 1.435939, 0.3619674, 1, 0, 0, 1, 1,
-0.3454556, 0.819651, -1.300478, 0, 0, 0, 1, 1,
-0.345006, 0.6026354, -0.602099, 0, 0, 0, 1, 1,
-0.340656, -0.9391087, -2.039781, 0, 0, 0, 1, 1,
-0.3366875, -0.9356232, -2.364569, 0, 0, 0, 1, 1,
-0.3335477, -0.6842225, -1.997844, 0, 0, 0, 1, 1,
-0.3309709, -0.4445298, -1.750907, 0, 0, 0, 1, 1,
-0.3298788, 0.2787189, -1.245374, 0, 0, 0, 1, 1,
-0.3296655, -0.3769743, -3.120417, 1, 1, 1, 1, 1,
-0.3261583, -0.3152789, -2.521208, 1, 1, 1, 1, 1,
-0.3212082, 0.1096911, -2.449766, 1, 1, 1, 1, 1,
-0.3205798, -0.08272159, -0.9987903, 1, 1, 1, 1, 1,
-0.3192553, 1.644684, 1.08816, 1, 1, 1, 1, 1,
-0.3184838, 0.4235358, 0.9198363, 1, 1, 1, 1, 1,
-0.3179748, 0.1486267, -0.504231, 1, 1, 1, 1, 1,
-0.3166473, 0.8683563, -1.474573, 1, 1, 1, 1, 1,
-0.3143669, 0.3977967, -0.7405182, 1, 1, 1, 1, 1,
-0.3138654, 0.06321946, -2.435673, 1, 1, 1, 1, 1,
-0.30362, -0.2081061, -2.631424, 1, 1, 1, 1, 1,
-0.3031723, -0.7913814, -3.797955, 1, 1, 1, 1, 1,
-0.2945476, 0.5285959, -2.863737, 1, 1, 1, 1, 1,
-0.294473, 0.8010793, -0.6015903, 1, 1, 1, 1, 1,
-0.2728711, 0.2946784, -1.676895, 1, 1, 1, 1, 1,
-0.2684809, 0.02719365, -2.442615, 0, 0, 1, 1, 1,
-0.2684439, 0.2345752, -2.169165, 1, 0, 0, 1, 1,
-0.2619418, -1.344744, -3.377629, 1, 0, 0, 1, 1,
-0.2590675, -2.142755, -1.278346, 1, 0, 0, 1, 1,
-0.2589999, 0.9531318, 0.6082802, 1, 0, 0, 1, 1,
-0.2587388, -1.805912, -1.517954, 1, 0, 0, 1, 1,
-0.2519148, 0.07577151, -0.8060756, 0, 0, 0, 1, 1,
-0.251857, 0.6450617, -1.001649, 0, 0, 0, 1, 1,
-0.2470011, 0.6060276, 0.9878249, 0, 0, 0, 1, 1,
-0.241186, 0.5617462, 0.1467878, 0, 0, 0, 1, 1,
-0.2405044, 0.7169193, 0.5292982, 0, 0, 0, 1, 1,
-0.2385499, 0.9814441, -0.384184, 0, 0, 0, 1, 1,
-0.2366821, -2.096797, -5.40062, 0, 0, 0, 1, 1,
-0.2363939, 0.0741292, -1.558543, 1, 1, 1, 1, 1,
-0.2314383, 0.4625065, -1.182371, 1, 1, 1, 1, 1,
-0.2310804, 0.07932194, -0.9163771, 1, 1, 1, 1, 1,
-0.2307536, -0.7469272, -2.473606, 1, 1, 1, 1, 1,
-0.2262373, 0.407505, -0.2914157, 1, 1, 1, 1, 1,
-0.2252085, 1.226879, 1.245851, 1, 1, 1, 1, 1,
-0.2213466, -0.01223982, -0.9290673, 1, 1, 1, 1, 1,
-0.2191373, -0.2374891, -3.373425, 1, 1, 1, 1, 1,
-0.2144993, -1.558364, -2.471499, 1, 1, 1, 1, 1,
-0.2134547, 0.4728452, -0.2438796, 1, 1, 1, 1, 1,
-0.2094436, 0.2337351, -0.8397324, 1, 1, 1, 1, 1,
-0.2068127, 0.08568051, -0.6673552, 1, 1, 1, 1, 1,
-0.2010605, -0.007753395, -1.391729, 1, 1, 1, 1, 1,
-0.2005406, -0.1885808, -1.935485, 1, 1, 1, 1, 1,
-0.1972578, -0.5185356, -2.320075, 1, 1, 1, 1, 1,
-0.1967473, -0.3029046, -2.139345, 0, 0, 1, 1, 1,
-0.1959383, -1.050574, -1.977054, 1, 0, 0, 1, 1,
-0.188395, 0.9489333, -0.196289, 1, 0, 0, 1, 1,
-0.1878069, 0.3164336, -0.496931, 1, 0, 0, 1, 1,
-0.1819995, 0.7916688, -0.2064722, 1, 0, 0, 1, 1,
-0.1762187, 2.061038, -0.04912257, 1, 0, 0, 1, 1,
-0.1760785, 0.1289551, -0.1013881, 0, 0, 0, 1, 1,
-0.1728376, -0.06290276, -2.708396, 0, 0, 0, 1, 1,
-0.1669129, -1.065977, -1.26297, 0, 0, 0, 1, 1,
-0.1604217, 1.192939, 1.462672, 0, 0, 0, 1, 1,
-0.1592968, -0.5894357, -3.254423, 0, 0, 0, 1, 1,
-0.1584766, -1.765952, -2.533821, 0, 0, 0, 1, 1,
-0.1529318, 1.38191, -0.1651536, 0, 0, 0, 1, 1,
-0.152786, 0.4075598, 0.8154138, 1, 1, 1, 1, 1,
-0.1525344, -0.3375609, -3.780816, 1, 1, 1, 1, 1,
-0.1496308, -0.5509135, -3.140691, 1, 1, 1, 1, 1,
-0.1493167, -0.8986074, -3.257883, 1, 1, 1, 1, 1,
-0.1490325, -0.6037183, -4.79704, 1, 1, 1, 1, 1,
-0.1459122, 0.3953796, 0.2974345, 1, 1, 1, 1, 1,
-0.1457286, -0.5141806, -2.803426, 1, 1, 1, 1, 1,
-0.1452983, 0.2097915, 1.227716, 1, 1, 1, 1, 1,
-0.1446883, -1.244748, -3.061615, 1, 1, 1, 1, 1,
-0.1410688, 1.195356, -0.5544406, 1, 1, 1, 1, 1,
-0.1409783, 0.2620476, -0.9327595, 1, 1, 1, 1, 1,
-0.1403754, -1.474133, -1.888611, 1, 1, 1, 1, 1,
-0.1396409, 1.329169, 0.3984959, 1, 1, 1, 1, 1,
-0.1380188, 0.03265836, -2.06986, 1, 1, 1, 1, 1,
-0.1354645, -0.3456521, -2.5303, 1, 1, 1, 1, 1,
-0.1353171, -0.5386776, -3.560261, 0, 0, 1, 1, 1,
-0.1298332, -0.5124365, -1.493086, 1, 0, 0, 1, 1,
-0.1283502, 0.3184978, -0.7534192, 1, 0, 0, 1, 1,
-0.1279563, -1.476022, -2.330217, 1, 0, 0, 1, 1,
-0.1206421, -0.8083139, -3.260161, 1, 0, 0, 1, 1,
-0.1201221, 1.393023, 0.6857183, 1, 0, 0, 1, 1,
-0.1129835, 0.1070232, -0.25729, 0, 0, 0, 1, 1,
-0.1126099, 0.3129625, 0.0498423, 0, 0, 0, 1, 1,
-0.1118491, -0.9372087, -3.080434, 0, 0, 0, 1, 1,
-0.1114116, -1.036435, -4.217018, 0, 0, 0, 1, 1,
-0.1101479, -0.03839613, -1.865403, 0, 0, 0, 1, 1,
-0.1090916, -0.1480531, -2.766203, 0, 0, 0, 1, 1,
-0.1075298, 0.4603671, 0.1611369, 0, 0, 0, 1, 1,
-0.1059801, -0.8551295, -1.149703, 1, 1, 1, 1, 1,
-0.1035786, -1.10921, -1.656655, 1, 1, 1, 1, 1,
-0.1028855, -0.07456664, -2.807696, 1, 1, 1, 1, 1,
-0.102433, -0.4367068, -4.149646, 1, 1, 1, 1, 1,
-0.09906661, -0.5211257, -2.411309, 1, 1, 1, 1, 1,
-0.09402067, -0.6001295, -2.006365, 1, 1, 1, 1, 1,
-0.09138481, 1.219803, 0.1083183, 1, 1, 1, 1, 1,
-0.08688124, -1.1747, -2.291964, 1, 1, 1, 1, 1,
-0.08583609, 1.508905, 1.31039, 1, 1, 1, 1, 1,
-0.08431593, 0.08231151, 0.5594378, 1, 1, 1, 1, 1,
-0.08366969, 0.2897378, -1.93571, 1, 1, 1, 1, 1,
-0.08227915, -0.1333928, -2.692648, 1, 1, 1, 1, 1,
-0.08179072, -0.2983133, -3.225516, 1, 1, 1, 1, 1,
-0.07758199, -1.404478, -3.915979, 1, 1, 1, 1, 1,
-0.07247066, 0.3909181, -1.473498, 1, 1, 1, 1, 1,
-0.07060529, 0.3254293, -1.838962, 0, 0, 1, 1, 1,
-0.06840853, 0.1826787, -0.2120173, 1, 0, 0, 1, 1,
-0.05900282, 0.737031, 0.7378144, 1, 0, 0, 1, 1,
-0.05652209, 0.6330327, -1.018728, 1, 0, 0, 1, 1,
-0.05527642, -1.967832, -3.438733, 1, 0, 0, 1, 1,
-0.05260622, 0.4041388, 1.233749, 1, 0, 0, 1, 1,
-0.0507948, 1.402702, -1.404503, 0, 0, 0, 1, 1,
-0.04770752, 1.171036, -0.224345, 0, 0, 0, 1, 1,
-0.03640807, -1.310523, -3.268324, 0, 0, 0, 1, 1,
-0.03161742, 1.150537, 0.2375978, 0, 0, 0, 1, 1,
-0.03105999, 2.454242, -0.5044894, 0, 0, 0, 1, 1,
-0.02609733, 0.2559441, 1.463711, 0, 0, 0, 1, 1,
-0.02501293, -1.223564, -4.096219, 0, 0, 0, 1, 1,
-0.02454918, -0.6108493, -2.485277, 1, 1, 1, 1, 1,
-0.02445221, -0.3476797, -2.740114, 1, 1, 1, 1, 1,
-0.02317878, 0.7789671, 0.1459009, 1, 1, 1, 1, 1,
-0.02006959, -0.2767186, -5.893017, 1, 1, 1, 1, 1,
-0.01153863, 0.2008486, 0.2454426, 1, 1, 1, 1, 1,
-0.009309117, 0.1157614, -1.122014, 1, 1, 1, 1, 1,
-0.007600544, -1.583762, -2.184854, 1, 1, 1, 1, 1,
-0.006948877, -0.2146202, -4.054934, 1, 1, 1, 1, 1,
-0.003616056, -0.04456986, -1.845411, 1, 1, 1, 1, 1,
-0.003363607, 1.196916, -0.3250068, 1, 1, 1, 1, 1,
-0.003240327, -0.1795555, -3.662022, 1, 1, 1, 1, 1,
-1.242379e-05, 1.892053, -0.2587063, 1, 1, 1, 1, 1,
0.005633582, 1.060618, 0.3785959, 1, 1, 1, 1, 1,
0.009413419, 1.896212, 0.09254587, 1, 1, 1, 1, 1,
0.009432567, 0.3808963, 1.332859, 1, 1, 1, 1, 1,
0.01188746, 0.04763046, 1.25, 0, 0, 1, 1, 1,
0.01200416, 1.149751, -0.6924103, 1, 0, 0, 1, 1,
0.01401589, -1.01414, 2.914511, 1, 0, 0, 1, 1,
0.02005442, 1.355951, 0.4365889, 1, 0, 0, 1, 1,
0.02551312, 1.524109, -0.9076543, 1, 0, 0, 1, 1,
0.02797593, 0.416649, 0.6274793, 1, 0, 0, 1, 1,
0.0296082, -0.2027859, 3.210233, 0, 0, 0, 1, 1,
0.03059609, -0.7720929, 3.796758, 0, 0, 0, 1, 1,
0.0338631, 0.3528249, -2.022673, 0, 0, 0, 1, 1,
0.03392985, 1.300653, 0.7712163, 0, 0, 0, 1, 1,
0.03457765, -0.353276, 3.104868, 0, 0, 0, 1, 1,
0.03551537, -0.9523807, 4.204309, 0, 0, 0, 1, 1,
0.03930132, 0.4768773, 0.3301594, 0, 0, 0, 1, 1,
0.04713038, -0.250782, 1.238872, 1, 1, 1, 1, 1,
0.05179742, -0.003182001, 1.238383, 1, 1, 1, 1, 1,
0.05268442, -1.335071, 1.573782, 1, 1, 1, 1, 1,
0.05319656, -0.2397586, 3.285146, 1, 1, 1, 1, 1,
0.05428682, 0.5151882, 1.079932, 1, 1, 1, 1, 1,
0.05813369, -0.9237012, 3.654606, 1, 1, 1, 1, 1,
0.06244755, 0.2768523, 1.234423, 1, 1, 1, 1, 1,
0.06720062, -1.211692, 3.047064, 1, 1, 1, 1, 1,
0.06745978, -1.295855, 2.875106, 1, 1, 1, 1, 1,
0.06766266, 1.853415, 1.50644, 1, 1, 1, 1, 1,
0.07171808, -0.5361128, 5.317264, 1, 1, 1, 1, 1,
0.07266498, -1.271077, 0.1688929, 1, 1, 1, 1, 1,
0.07538858, 1.026768, -0.1218425, 1, 1, 1, 1, 1,
0.07743457, 0.7153751, -0.5135239, 1, 1, 1, 1, 1,
0.07775167, 0.992324, 1.905117, 1, 1, 1, 1, 1,
0.07839542, 0.3058904, -0.4387147, 0, 0, 1, 1, 1,
0.07900734, 0.799366, -1.498651, 1, 0, 0, 1, 1,
0.08131374, -0.2787394, 3.372962, 1, 0, 0, 1, 1,
0.08706784, 1.226457, -1.504161, 1, 0, 0, 1, 1,
0.0885974, 0.7393855, -0.1445452, 1, 0, 0, 1, 1,
0.08933929, 0.8338066, 0.7055236, 1, 0, 0, 1, 1,
0.08990091, -0.4258969, 3.84831, 0, 0, 0, 1, 1,
0.09343162, -0.1299215, 3.532759, 0, 0, 0, 1, 1,
0.09427756, -1.075595, 3.484949, 0, 0, 0, 1, 1,
0.09470028, -1.023796, 3.270987, 0, 0, 0, 1, 1,
0.09945946, -0.494681, 2.597615, 0, 0, 0, 1, 1,
0.1065465, -2.181712, 2.999705, 0, 0, 0, 1, 1,
0.1159159, 0.1332517, 1.0052, 0, 0, 0, 1, 1,
0.1189695, 0.5356019, 0.1368407, 1, 1, 1, 1, 1,
0.1207671, 0.979772, 0.9121881, 1, 1, 1, 1, 1,
0.1229477, -0.1895594, 2.263279, 1, 1, 1, 1, 1,
0.1233359, -0.1593839, 1.722244, 1, 1, 1, 1, 1,
0.1240391, 0.8400218, -2.637619, 1, 1, 1, 1, 1,
0.1252766, -2.658282, 4.974553, 1, 1, 1, 1, 1,
0.1274361, 0.5406168, 0.5555359, 1, 1, 1, 1, 1,
0.1399009, -0.2270297, 3.654399, 1, 1, 1, 1, 1,
0.140447, 0.1889592, 1.192246, 1, 1, 1, 1, 1,
0.1433565, 0.4630667, 0.2010801, 1, 1, 1, 1, 1,
0.1438666, 0.1482439, -0.6952354, 1, 1, 1, 1, 1,
0.1478464, 0.3475264, -0.3103354, 1, 1, 1, 1, 1,
0.1481189, 0.693479, 1.232873, 1, 1, 1, 1, 1,
0.1511705, 1.004506, 1.001898, 1, 1, 1, 1, 1,
0.1544947, 0.9882933, -0.3670031, 1, 1, 1, 1, 1,
0.1549813, -1.048221, 2.812648, 0, 0, 1, 1, 1,
0.1587243, -0.02958264, 3.667614, 1, 0, 0, 1, 1,
0.1596511, 0.002665652, 0.4684882, 1, 0, 0, 1, 1,
0.16128, 0.08497821, 0.2492561, 1, 0, 0, 1, 1,
0.1634796, 1.804079, -2.221318, 1, 0, 0, 1, 1,
0.1646058, -0.2133234, 2.746582, 1, 0, 0, 1, 1,
0.167906, -2.357381, 4.076268, 0, 0, 0, 1, 1,
0.1717962, -0.291676, 1.07229, 0, 0, 0, 1, 1,
0.1764113, -0.3608163, 2.169908, 0, 0, 0, 1, 1,
0.1789385, -2.541667, 2.478071, 0, 0, 0, 1, 1,
0.1828669, 0.2922297, 2.022251, 0, 0, 0, 1, 1,
0.1836321, -0.6741308, 4.057162, 0, 0, 0, 1, 1,
0.1862818, -0.2886248, 3.790093, 0, 0, 0, 1, 1,
0.1871894, -0.5197974, 2.240473, 1, 1, 1, 1, 1,
0.1922916, -0.9045855, 2.49176, 1, 1, 1, 1, 1,
0.1934487, 0.3823335, -0.02775061, 1, 1, 1, 1, 1,
0.1942632, -0.4286167, 3.034663, 1, 1, 1, 1, 1,
0.1943013, 0.8994206, -2.076458, 1, 1, 1, 1, 1,
0.2018328, 0.7284817, 0.2662053, 1, 1, 1, 1, 1,
0.2021927, -1.874447, 0.9814525, 1, 1, 1, 1, 1,
0.2071105, -0.5077778, 1.520878, 1, 1, 1, 1, 1,
0.2127925, -0.3718957, 1.96796, 1, 1, 1, 1, 1,
0.2218142, 0.1321204, 1.981128, 1, 1, 1, 1, 1,
0.224136, -0.07065005, 2.998629, 1, 1, 1, 1, 1,
0.2253823, 0.04078287, 1.613439, 1, 1, 1, 1, 1,
0.2258007, -0.7103602, 2.942854, 1, 1, 1, 1, 1,
0.2261191, -0.6564712, 1.492469, 1, 1, 1, 1, 1,
0.2271314, -0.1153718, 2.110727, 1, 1, 1, 1, 1,
0.2274267, -0.2974769, 3.186049, 0, 0, 1, 1, 1,
0.2318825, 1.743675, 0.5223439, 1, 0, 0, 1, 1,
0.2328309, -0.4621736, 2.252933, 1, 0, 0, 1, 1,
0.2348406, 0.5369758, 0.9744948, 1, 0, 0, 1, 1,
0.2393794, 0.3785919, 1.309232, 1, 0, 0, 1, 1,
0.2394897, -0.2966724, 2.373741, 1, 0, 0, 1, 1,
0.2405133, -1.38614, 3.401811, 0, 0, 0, 1, 1,
0.2484774, 0.3245577, 0.1639841, 0, 0, 0, 1, 1,
0.2512, 0.5931441, 0.3122583, 0, 0, 0, 1, 1,
0.2527622, 2.332866, 1.310884, 0, 0, 0, 1, 1,
0.2565546, -0.6452858, 2.702464, 0, 0, 0, 1, 1,
0.2571608, -1.703685, 3.091786, 0, 0, 0, 1, 1,
0.2652469, -1.16695, 3.252483, 0, 0, 0, 1, 1,
0.2657498, -0.4365056, 2.477312, 1, 1, 1, 1, 1,
0.2781169, 1.309146, 0.7262176, 1, 1, 1, 1, 1,
0.2797557, -0.7819805, 4.240255, 1, 1, 1, 1, 1,
0.2819583, -0.1027082, 1.653747, 1, 1, 1, 1, 1,
0.2821855, -2.117998, 3.879029, 1, 1, 1, 1, 1,
0.2827605, 1.046679, 2.554049, 1, 1, 1, 1, 1,
0.284885, 0.3794758, 1.45617, 1, 1, 1, 1, 1,
0.2864697, -0.06811837, 1.549491, 1, 1, 1, 1, 1,
0.2880508, -0.1140096, 1.540333, 1, 1, 1, 1, 1,
0.2913971, 0.1821568, 2.343081, 1, 1, 1, 1, 1,
0.2929514, 1.047703, 0.9842796, 1, 1, 1, 1, 1,
0.2932239, 0.1837022, 4.184082, 1, 1, 1, 1, 1,
0.2963316, -2.319212, 4.649981, 1, 1, 1, 1, 1,
0.3005589, -0.8063134, 2.752, 1, 1, 1, 1, 1,
0.3034483, 0.5391256, 0.7742465, 1, 1, 1, 1, 1,
0.3037536, 0.4571154, -0.5586807, 0, 0, 1, 1, 1,
0.3043694, 0.3334607, 0.08979817, 1, 0, 0, 1, 1,
0.308897, 0.1649496, -1.383089, 1, 0, 0, 1, 1,
0.3145993, -0.1430584, 0.8169813, 1, 0, 0, 1, 1,
0.3162388, 0.9669707, -2.860327, 1, 0, 0, 1, 1,
0.3177834, -1.242519, 2.86805, 1, 0, 0, 1, 1,
0.3203454, -1.717203, 4.131615, 0, 0, 0, 1, 1,
0.3249309, 0.08445666, 3.302304, 0, 0, 0, 1, 1,
0.3257087, -0.6108174, 4.271873, 0, 0, 0, 1, 1,
0.3270531, -0.4188038, 3.404674, 0, 0, 0, 1, 1,
0.3341873, -0.614017, 3.25937, 0, 0, 0, 1, 1,
0.3346107, -0.8282825, 4.227178, 0, 0, 0, 1, 1,
0.3382496, -2.161126, 2.252943, 0, 0, 0, 1, 1,
0.3432795, 0.4841149, -0.1038655, 1, 1, 1, 1, 1,
0.3456121, -1.202488, 3.350183, 1, 1, 1, 1, 1,
0.3473145, 0.1179585, 1.527542, 1, 1, 1, 1, 1,
0.3540783, 0.1538386, 1.992554, 1, 1, 1, 1, 1,
0.355528, -0.0340087, 2.403054, 1, 1, 1, 1, 1,
0.3564923, 0.5254338, 1.008278, 1, 1, 1, 1, 1,
0.3567713, 0.846441, -0.361037, 1, 1, 1, 1, 1,
0.3577224, 0.6851265, 0.9148226, 1, 1, 1, 1, 1,
0.3617797, 0.7737932, 1.981259, 1, 1, 1, 1, 1,
0.3710704, 1.261694, -0.08075797, 1, 1, 1, 1, 1,
0.3756851, -0.3787629, 3.277474, 1, 1, 1, 1, 1,
0.376639, 0.2521133, 0.7088865, 1, 1, 1, 1, 1,
0.3784266, -1.390657, 1.266284, 1, 1, 1, 1, 1,
0.378748, -1.07444, 0.9109225, 1, 1, 1, 1, 1,
0.3790148, -0.8782828, 4.639143, 1, 1, 1, 1, 1,
0.3799983, 0.3336779, 1.735552, 0, 0, 1, 1, 1,
0.3861775, 0.3118152, -0.1076211, 1, 0, 0, 1, 1,
0.3873434, -0.8745473, 2.455639, 1, 0, 0, 1, 1,
0.3912761, 0.5754006, -0.3123735, 1, 0, 0, 1, 1,
0.3926648, 1.627432, 1.982378, 1, 0, 0, 1, 1,
0.3983583, 0.3735522, -0.5373816, 1, 0, 0, 1, 1,
0.3991594, -0.3848157, 2.055672, 0, 0, 0, 1, 1,
0.4052396, -2.481237, 2.289289, 0, 0, 0, 1, 1,
0.4054913, 0.5395843, 0.8718378, 0, 0, 0, 1, 1,
0.4088146, 0.4512224, -0.8250891, 0, 0, 0, 1, 1,
0.4118972, 0.6565634, -0.1179291, 0, 0, 0, 1, 1,
0.4124044, 1.524468, -0.2562751, 0, 0, 0, 1, 1,
0.4135515, -0.58869, 2.374627, 0, 0, 0, 1, 1,
0.4169567, 0.3895591, 1.130253, 1, 1, 1, 1, 1,
0.4203846, 1.601455, 0.288023, 1, 1, 1, 1, 1,
0.4210771, -1.462866, 4.711923, 1, 1, 1, 1, 1,
0.4212094, 1.213303, 0.5312182, 1, 1, 1, 1, 1,
0.4222275, 1.449626, 0.566489, 1, 1, 1, 1, 1,
0.4231811, 0.02697545, 2.486682, 1, 1, 1, 1, 1,
0.4245799, -1.081836, 2.754571, 1, 1, 1, 1, 1,
0.4258024, -1.092246, 3.529914, 1, 1, 1, 1, 1,
0.4259838, 1.139097, 0.3790205, 1, 1, 1, 1, 1,
0.4270701, 1.994853, 1.476944, 1, 1, 1, 1, 1,
0.4297785, -0.02521458, 3.202542, 1, 1, 1, 1, 1,
0.4377041, 0.4142499, 2.298286, 1, 1, 1, 1, 1,
0.4391679, 0.03412788, 2.578612, 1, 1, 1, 1, 1,
0.4397858, -0.6359224, 2.064442, 1, 1, 1, 1, 1,
0.4442151, 1.185708, -0.4946942, 1, 1, 1, 1, 1,
0.4523417, 0.5237079, 1.006069, 0, 0, 1, 1, 1,
0.4543324, -0.4934372, 1.912936, 1, 0, 0, 1, 1,
0.4550696, 0.7119105, 0.002211213, 1, 0, 0, 1, 1,
0.4607264, -0.02472238, 0.794381, 1, 0, 0, 1, 1,
0.4644591, 0.6780499, -0.2613285, 1, 0, 0, 1, 1,
0.4675242, 0.5105278, -0.1769191, 1, 0, 0, 1, 1,
0.4684891, 0.07811997, 1.415442, 0, 0, 0, 1, 1,
0.4690274, 1.260833, 1.866279, 0, 0, 0, 1, 1,
0.4710166, 0.6430646, 0.6446783, 0, 0, 0, 1, 1,
0.4727418, 1.148349, -0.4066981, 0, 0, 0, 1, 1,
0.4736231, -0.289865, 3.065883, 0, 0, 0, 1, 1,
0.4766402, 1.492291, 1.941159, 0, 0, 0, 1, 1,
0.4774551, -0.212982, 0.7120459, 0, 0, 0, 1, 1,
0.4787328, 0.6839774, -0.03610182, 1, 1, 1, 1, 1,
0.4814939, 0.3431596, -0.1785549, 1, 1, 1, 1, 1,
0.4845703, -0.3114044, 1.957657, 1, 1, 1, 1, 1,
0.4943983, 2.078402, -0.002150032, 1, 1, 1, 1, 1,
0.5023774, 0.4045282, 1.162047, 1, 1, 1, 1, 1,
0.5042192, -0.7292663, 1.312279, 1, 1, 1, 1, 1,
0.5083508, -0.06664265, 0.2599396, 1, 1, 1, 1, 1,
0.509783, -0.980372, 3.21674, 1, 1, 1, 1, 1,
0.511203, 0.2988169, 1.504443, 1, 1, 1, 1, 1,
0.5135086, 0.6505304, 0.3979478, 1, 1, 1, 1, 1,
0.5141992, -0.6466209, 2.301316, 1, 1, 1, 1, 1,
0.514618, -0.672583, 1.626156, 1, 1, 1, 1, 1,
0.5231243, -0.08668594, 1.445812, 1, 1, 1, 1, 1,
0.5246834, 1.210333, 0.4108505, 1, 1, 1, 1, 1,
0.5269166, -0.4926894, 2.036678, 1, 1, 1, 1, 1,
0.5296562, 1.522352, -1.57996, 0, 0, 1, 1, 1,
0.5298745, 0.6099399, 1.665782, 1, 0, 0, 1, 1,
0.5335501, 0.5647105, 1.904157, 1, 0, 0, 1, 1,
0.5335855, -0.6335, 2.224501, 1, 0, 0, 1, 1,
0.537599, 0.1431704, 0.1057288, 1, 0, 0, 1, 1,
0.5379736, -0.1604729, 1.334245, 1, 0, 0, 1, 1,
0.5390952, 0.09116352, -0.9551722, 0, 0, 0, 1, 1,
0.5412605, -0.210328, 3.656114, 0, 0, 0, 1, 1,
0.5428423, -0.930445, 3.211398, 0, 0, 0, 1, 1,
0.5428819, -1.718717, 4.1736, 0, 0, 0, 1, 1,
0.5440193, 1.652231, -0.1035676, 0, 0, 0, 1, 1,
0.5448491, -1.897074, 3.636261, 0, 0, 0, 1, 1,
0.5467719, -0.4664824, 3.162205, 0, 0, 0, 1, 1,
0.5499261, 0.01351545, 1.658946, 1, 1, 1, 1, 1,
0.5533487, 1.530181, 0.5768195, 1, 1, 1, 1, 1,
0.5537216, -0.6520629, 2.69326, 1, 1, 1, 1, 1,
0.5582455, 0.803915, 0.7786313, 1, 1, 1, 1, 1,
0.5603827, -1.044671, 2.947162, 1, 1, 1, 1, 1,
0.5624152, -0.9314435, 3.117693, 1, 1, 1, 1, 1,
0.5699729, 0.3784286, 0.3671086, 1, 1, 1, 1, 1,
0.5754341, 1.453164, -0.5367744, 1, 1, 1, 1, 1,
0.5760725, -1.295294, 1.706397, 1, 1, 1, 1, 1,
0.5788594, 1.029395, 2.09518, 1, 1, 1, 1, 1,
0.5881646, -2.779265, 4.659155, 1, 1, 1, 1, 1,
0.5889249, -0.6758789, 1.278681, 1, 1, 1, 1, 1,
0.5898967, -0.4695419, 4.006686, 1, 1, 1, 1, 1,
0.5914404, -2.183054, 3.481917, 1, 1, 1, 1, 1,
0.5929519, -1.551841, 4.23292, 1, 1, 1, 1, 1,
0.5945746, -1.809962, 2.762691, 0, 0, 1, 1, 1,
0.6119939, 0.6622317, -0.5297018, 1, 0, 0, 1, 1,
0.6129206, 0.5121216, 2.093408, 1, 0, 0, 1, 1,
0.613501, 1.413758, 0.9155383, 1, 0, 0, 1, 1,
0.6137101, 0.1162078, 3.050788, 1, 0, 0, 1, 1,
0.6139733, -0.2097662, 3.014332, 1, 0, 0, 1, 1,
0.615467, 0.06205013, 0.6635675, 0, 0, 0, 1, 1,
0.6165463, -0.1442664, 1.223757, 0, 0, 0, 1, 1,
0.61875, -1.357932, 1.380259, 0, 0, 0, 1, 1,
0.624938, -0.5237443, 2.39569, 0, 0, 0, 1, 1,
0.6250489, 1.011333, 0.9024575, 0, 0, 0, 1, 1,
0.6277415, 0.1532322, 0.4404708, 0, 0, 0, 1, 1,
0.628416, -0.07061563, 2.36325, 0, 0, 0, 1, 1,
0.6342185, 0.1047135, 0.4766519, 1, 1, 1, 1, 1,
0.6494695, -2.792748, 2.644469, 1, 1, 1, 1, 1,
0.6500351, 1.305583, 0.9436901, 1, 1, 1, 1, 1,
0.6528777, 2.162362, 0.01471077, 1, 1, 1, 1, 1,
0.6529196, -0.4367782, 2.599241, 1, 1, 1, 1, 1,
0.6542668, 1.85267, 0.3491824, 1, 1, 1, 1, 1,
0.6577714, -0.1965901, 2.05228, 1, 1, 1, 1, 1,
0.6637803, 2.301409, -0.6850909, 1, 1, 1, 1, 1,
0.6661967, -0.7186502, 2.124579, 1, 1, 1, 1, 1,
0.6690273, -0.5098396, 2.036596, 1, 1, 1, 1, 1,
0.6782078, 1.864275, -2.298901, 1, 1, 1, 1, 1,
0.6880121, -0.08649778, 1.626245, 1, 1, 1, 1, 1,
0.6882505, 0.555047, 0.2346461, 1, 1, 1, 1, 1,
0.6894583, -0.8820991, 3.360703, 1, 1, 1, 1, 1,
0.6932244, 1.49217, 0.1108337, 1, 1, 1, 1, 1,
0.6944337, 1.517526, 1.884874, 0, 0, 1, 1, 1,
0.697363, 1.671808, -0.1088366, 1, 0, 0, 1, 1,
0.6978889, -0.970272, 2.189721, 1, 0, 0, 1, 1,
0.704336, 0.3347678, 0.2208518, 1, 0, 0, 1, 1,
0.7050305, -0.04789547, 3.216996, 1, 0, 0, 1, 1,
0.7073767, 0.6752226, 1.809531, 1, 0, 0, 1, 1,
0.7087138, -0.5758747, 3.856595, 0, 0, 0, 1, 1,
0.7095297, 0.5536864, 1.394612, 0, 0, 0, 1, 1,
0.7120714, -1.324643, 1.543543, 0, 0, 0, 1, 1,
0.7150456, -1.041815, 1.851067, 0, 0, 0, 1, 1,
0.7151882, -1.209375, 3.305171, 0, 0, 0, 1, 1,
0.7163727, 0.1550818, 0.9331811, 0, 0, 0, 1, 1,
0.7184106, 0.8752766, 1.557266, 0, 0, 0, 1, 1,
0.7198777, 0.0913498, 0.4662319, 1, 1, 1, 1, 1,
0.7213088, 0.3901293, 0.701673, 1, 1, 1, 1, 1,
0.7277263, -0.6265035, 3.035035, 1, 1, 1, 1, 1,
0.7400534, -0.6827257, 1.432056, 1, 1, 1, 1, 1,
0.7430806, 0.6107424, 1.817749, 1, 1, 1, 1, 1,
0.744083, 1.187792, 1.44988, 1, 1, 1, 1, 1,
0.7446276, 0.8430654, 1.263235, 1, 1, 1, 1, 1,
0.7488665, -0.4350964, 2.403188, 1, 1, 1, 1, 1,
0.7490102, -1.323383, 2.490068, 1, 1, 1, 1, 1,
0.7517526, 0.03108818, 1.775648, 1, 1, 1, 1, 1,
0.7518137, -1.417276, 3.852592, 1, 1, 1, 1, 1,
0.7594946, -0.8785718, 3.538263, 1, 1, 1, 1, 1,
0.7621453, 2.12374, 2.643214, 1, 1, 1, 1, 1,
0.7635187, -1.287038, 1.654158, 1, 1, 1, 1, 1,
0.7644204, -2.139029, 2.266712, 1, 1, 1, 1, 1,
0.7646178, 0.3455433, 2.376903, 0, 0, 1, 1, 1,
0.7652766, -1.192689, 2.23395, 1, 0, 0, 1, 1,
0.7707688, -0.5526824, 1.05855, 1, 0, 0, 1, 1,
0.7718922, -0.9773735, 3.580856, 1, 0, 0, 1, 1,
0.7735295, -0.1618929, 1.831369, 1, 0, 0, 1, 1,
0.7768631, -1.504366, 2.957457, 1, 0, 0, 1, 1,
0.7833522, -1.721972, 2.894087, 0, 0, 0, 1, 1,
0.7848067, -0.6288463, 0.2583832, 0, 0, 0, 1, 1,
0.7849273, -0.1006811, 2.675995, 0, 0, 0, 1, 1,
0.785753, -0.1599776, 1.415135, 0, 0, 0, 1, 1,
0.7877453, 0.3282966, 1.547824, 0, 0, 0, 1, 1,
0.7909315, 0.3200532, 0.9976178, 0, 0, 0, 1, 1,
0.7950824, -0.5002374, 1.211471, 0, 0, 0, 1, 1,
0.8029824, 1.228143, 0.09615852, 1, 1, 1, 1, 1,
0.8040839, -1.527226, 1.592709, 1, 1, 1, 1, 1,
0.8083742, -0.2860124, 1.820631, 1, 1, 1, 1, 1,
0.8113195, -0.7557076, 3.428106, 1, 1, 1, 1, 1,
0.814536, -1.111487, 1.021248, 1, 1, 1, 1, 1,
0.8195675, 1.512332, 0.752472, 1, 1, 1, 1, 1,
0.8265223, 0.5989982, -0.1838893, 1, 1, 1, 1, 1,
0.8318662, -0.3390921, 4.708832, 1, 1, 1, 1, 1,
0.8328437, 1.434097, -2.480265, 1, 1, 1, 1, 1,
0.8355792, 0.5696869, -0.8878168, 1, 1, 1, 1, 1,
0.8356817, -0.9508148, 1.229995, 1, 1, 1, 1, 1,
0.8368977, -0.115788, 1.285537, 1, 1, 1, 1, 1,
0.8406236, -0.3981095, 2.375247, 1, 1, 1, 1, 1,
0.8445939, -2.261472, 0.5990406, 1, 1, 1, 1, 1,
0.845338, 1.17739, 1.047675, 1, 1, 1, 1, 1,
0.845845, 3.177041, -1.208898, 0, 0, 1, 1, 1,
0.8524463, 0.3124948, 0.111261, 1, 0, 0, 1, 1,
0.8539425, 0.3466117, 2.032206, 1, 0, 0, 1, 1,
0.8564369, -1.073553, 4.274509, 1, 0, 0, 1, 1,
0.8785034, -0.7936871, 4.222873, 1, 0, 0, 1, 1,
0.8787017, 1.449565, -0.9071887, 1, 0, 0, 1, 1,
0.879879, -0.8173913, 3.073384, 0, 0, 0, 1, 1,
0.8828661, -0.5938438, 3.856427, 0, 0, 0, 1, 1,
0.8839571, -0.05474015, 2.055134, 0, 0, 0, 1, 1,
0.8882827, -0.2728049, 2.66467, 0, 0, 0, 1, 1,
0.8900492, -1.180229, 0.9589135, 0, 0, 0, 1, 1,
0.8936276, 0.4283301, 1.928118, 0, 0, 0, 1, 1,
0.8943666, 0.7543306, 1.737139, 0, 0, 0, 1, 1,
0.8948875, -1.213114, 1.537955, 1, 1, 1, 1, 1,
0.9032623, -0.5360189, 1.284354, 1, 1, 1, 1, 1,
0.9076303, -0.4572166, 3.03867, 1, 1, 1, 1, 1,
0.9159257, 0.07669582, 0.5902417, 1, 1, 1, 1, 1,
0.9247374, -0.05316711, 0.7631114, 1, 1, 1, 1, 1,
0.9307048, 2.374943, -0.2732787, 1, 1, 1, 1, 1,
0.934254, -0.9309616, 3.077482, 1, 1, 1, 1, 1,
0.9369982, -0.5705698, 1.806138, 1, 1, 1, 1, 1,
0.9508873, 0.6492431, 2.306936, 1, 1, 1, 1, 1,
0.9516368, -0.5357286, 3.182534, 1, 1, 1, 1, 1,
0.9590687, 0.9309856, 2.169853, 1, 1, 1, 1, 1,
0.9624569, -0.3553756, 1.785785, 1, 1, 1, 1, 1,
0.9734499, -0.6008111, 1.723911, 1, 1, 1, 1, 1,
0.9764682, -0.8110782, 2.86644, 1, 1, 1, 1, 1,
0.9807767, 2.610837, 0.7913964, 1, 1, 1, 1, 1,
0.9809414, 1.061316, 1.938778, 0, 0, 1, 1, 1,
0.9830853, -0.5221078, 2.717947, 1, 0, 0, 1, 1,
0.9854203, -0.05198409, 1.561436, 1, 0, 0, 1, 1,
0.9866288, 1.946659, 0.2157935, 1, 0, 0, 1, 1,
0.9888787, 0.334765, 1.253456, 1, 0, 0, 1, 1,
0.994401, 0.8051426, 1.622882, 1, 0, 0, 1, 1,
0.99444, -0.1339056, 3.141629, 0, 0, 0, 1, 1,
0.9968826, 0.6013563, 0.4151394, 0, 0, 0, 1, 1,
0.9994466, -1.371887, 2.483581, 0, 0, 0, 1, 1,
1.001453, 0.1423294, 1.121665, 0, 0, 0, 1, 1,
1.018654, 0.5032474, 0.4095986, 0, 0, 0, 1, 1,
1.022125, 2.115655, 0.607214, 0, 0, 0, 1, 1,
1.025716, -0.3479204, 1.057714, 0, 0, 0, 1, 1,
1.03079, -1.121559, 4.570206, 1, 1, 1, 1, 1,
1.033093, 0.6162102, 1.695138, 1, 1, 1, 1, 1,
1.047814, 1.263226, 1.4558, 1, 1, 1, 1, 1,
1.049761, -1.996332, 1.661721, 1, 1, 1, 1, 1,
1.065119, 0.161937, 1.53836, 1, 1, 1, 1, 1,
1.066277, -0.1729909, 1.452244, 1, 1, 1, 1, 1,
1.080238, 0.4824733, 1.295972, 1, 1, 1, 1, 1,
1.083435, -0.8563227, 3.71747, 1, 1, 1, 1, 1,
1.094841, 1.818614, -0.106947, 1, 1, 1, 1, 1,
1.109309, 0.440234, 0.3099367, 1, 1, 1, 1, 1,
1.110264, 1.408264, 1.567324, 1, 1, 1, 1, 1,
1.110645, 0.1655707, 1.30251, 1, 1, 1, 1, 1,
1.112695, 1.199575, -0.2289445, 1, 1, 1, 1, 1,
1.11785, 0.3687003, 1.541277, 1, 1, 1, 1, 1,
1.119672, 0.1921917, 1.086224, 1, 1, 1, 1, 1,
1.120621, -1.499694, 2.75166, 0, 0, 1, 1, 1,
1.132392, 0.03490489, 3.513351, 1, 0, 0, 1, 1,
1.132912, 0.1215492, 1.052006, 1, 0, 0, 1, 1,
1.138925, -0.3704045, 2.424575, 1, 0, 0, 1, 1,
1.141636, -1.137187, 1.941109, 1, 0, 0, 1, 1,
1.146984, -1.633949, 2.413036, 1, 0, 0, 1, 1,
1.148282, -0.8512596, 2.439723, 0, 0, 0, 1, 1,
1.148491, -1.206578, 1.2167, 0, 0, 0, 1, 1,
1.152582, -0.09928128, 3.776644, 0, 0, 0, 1, 1,
1.154242, -0.6585588, 2.132078, 0, 0, 0, 1, 1,
1.156879, 0.5144035, 0.7284437, 0, 0, 0, 1, 1,
1.159096, -0.5553897, 4.100795, 0, 0, 0, 1, 1,
1.160251, -0.3830676, 2.846914, 0, 0, 0, 1, 1,
1.165964, -0.9595498, 2.889288, 1, 1, 1, 1, 1,
1.172675, 1.7229, 0.5472213, 1, 1, 1, 1, 1,
1.172697, -0.8739465, 2.991832, 1, 1, 1, 1, 1,
1.198079, -0.6091447, 2.01147, 1, 1, 1, 1, 1,
1.221251, 0.6439112, 2.549793, 1, 1, 1, 1, 1,
1.222532, 1.036553, -0.7576578, 1, 1, 1, 1, 1,
1.244472, -0.4059786, 0.8733674, 1, 1, 1, 1, 1,
1.250653, -0.5625488, 1.59696, 1, 1, 1, 1, 1,
1.271617, 0.8733436, 0.503037, 1, 1, 1, 1, 1,
1.279545, 0.5470808, 2.065139, 1, 1, 1, 1, 1,
1.288048, 0.4341315, -0.8820235, 1, 1, 1, 1, 1,
1.289363, -0.218279, 3.144807, 1, 1, 1, 1, 1,
1.289693, 0.9829443, 0.8673638, 1, 1, 1, 1, 1,
1.291316, -0.4072182, 2.670366, 1, 1, 1, 1, 1,
1.298118, 0.02470747, -0.1211684, 1, 1, 1, 1, 1,
1.299335, 0.5099467, 1.968951, 0, 0, 1, 1, 1,
1.319646, 0.03346587, 1.901526, 1, 0, 0, 1, 1,
1.322062, 0.8816041, 1.655428, 1, 0, 0, 1, 1,
1.325204, 1.031912, 0.6728802, 1, 0, 0, 1, 1,
1.325495, -0.7621679, 2.745295, 1, 0, 0, 1, 1,
1.341269, -1.64588, 2.019947, 1, 0, 0, 1, 1,
1.343811, 1.073957, 1.09346, 0, 0, 0, 1, 1,
1.350629, 0.04316316, 2.547054, 0, 0, 0, 1, 1,
1.352357, -0.4000217, 3.466377, 0, 0, 0, 1, 1,
1.353256, 1.058981, 0.6431982, 0, 0, 0, 1, 1,
1.360127, 0.698535, 0.8384714, 0, 0, 0, 1, 1,
1.371187, -1.339088, 2.738526, 0, 0, 0, 1, 1,
1.37136, -0.2247289, 2.166388, 0, 0, 0, 1, 1,
1.387541, 0.001240832, 2.234527, 1, 1, 1, 1, 1,
1.39093, -0.06657536, 1.93599, 1, 1, 1, 1, 1,
1.397061, 0.08177873, 2.508028, 1, 1, 1, 1, 1,
1.406043, -0.8974752, 1.850894, 1, 1, 1, 1, 1,
1.410824, -0.3933674, 1.05206, 1, 1, 1, 1, 1,
1.43156, 0.2727538, 2.242497, 1, 1, 1, 1, 1,
1.432308, -1.06366, 1.257275, 1, 1, 1, 1, 1,
1.437178, 0.2154781, 1.282765, 1, 1, 1, 1, 1,
1.4375, -0.4646288, 0.2876115, 1, 1, 1, 1, 1,
1.444792, -1.215472, 1.763013, 1, 1, 1, 1, 1,
1.44757, 1.050763, 0.3534656, 1, 1, 1, 1, 1,
1.453668, -0.9408405, 2.741842, 1, 1, 1, 1, 1,
1.455921, -1.477129, 2.487755, 1, 1, 1, 1, 1,
1.458216, 0.3486132, 0.7396188, 1, 1, 1, 1, 1,
1.462017, -0.1936871, 3.619338, 1, 1, 1, 1, 1,
1.468305, -0.5490634, 3.145799, 0, 0, 1, 1, 1,
1.473728, 0.4216246, 1.852918, 1, 0, 0, 1, 1,
1.474203, 0.288237, 2.64893, 1, 0, 0, 1, 1,
1.479885, -1.534804, 3.975289, 1, 0, 0, 1, 1,
1.49095, 0.07830328, 1.937294, 1, 0, 0, 1, 1,
1.496687, 0.8059782, 0.7367911, 1, 0, 0, 1, 1,
1.500521, -0.2309719, 1.331525, 0, 0, 0, 1, 1,
1.501873, 0.7456971, 1.913396, 0, 0, 0, 1, 1,
1.51981, 0.4007242, 0.5915856, 0, 0, 0, 1, 1,
1.520656, -0.3944, -0.06778563, 0, 0, 0, 1, 1,
1.556797, -1.49254, 3.965758, 0, 0, 0, 1, 1,
1.574286, -1.555942, 1.42382, 0, 0, 0, 1, 1,
1.575435, 0.748241, 0.6084084, 0, 0, 0, 1, 1,
1.575964, 0.2922728, 2.393167, 1, 1, 1, 1, 1,
1.578459, 0.04948663, 2.655646, 1, 1, 1, 1, 1,
1.578605, 0.9371689, 2.444937, 1, 1, 1, 1, 1,
1.582024, -0.1826093, 1.943678, 1, 1, 1, 1, 1,
1.58664, 2.017585, -0.4196953, 1, 1, 1, 1, 1,
1.592326, 0.9609069, -1.556927, 1, 1, 1, 1, 1,
1.611992, 0.3755428, 0.05424216, 1, 1, 1, 1, 1,
1.620159, -0.3825041, 2.244113, 1, 1, 1, 1, 1,
1.622105, 0.6429619, 1.720455, 1, 1, 1, 1, 1,
1.670136, 0.734186, 0.7884579, 1, 1, 1, 1, 1,
1.672003, 2.076053, 1.265953, 1, 1, 1, 1, 1,
1.673871, -0.6264058, 2.129591, 1, 1, 1, 1, 1,
1.686009, -1.0038, 2.672221, 1, 1, 1, 1, 1,
1.691013, -0.9648565, 1.094391, 1, 1, 1, 1, 1,
1.700318, -0.2099849, 1.314359, 1, 1, 1, 1, 1,
1.703146, -0.876492, 3.854973, 0, 0, 1, 1, 1,
1.704454, -0.1535755, 2.519562, 1, 0, 0, 1, 1,
1.708945, 0.9192665, 1.490472, 1, 0, 0, 1, 1,
1.72175, -1.163688, 3.770989, 1, 0, 0, 1, 1,
1.728522, 1.048675, 1.152918, 1, 0, 0, 1, 1,
1.734579, -1.541049, 0.3160982, 1, 0, 0, 1, 1,
1.734721, -0.8397428, 0.7326961, 0, 0, 0, 1, 1,
1.773141, 1.203639, 0.4905537, 0, 0, 0, 1, 1,
1.785298, -0.6623985, 2.004377, 0, 0, 0, 1, 1,
1.790727, 0.7230849, 0.3305039, 0, 0, 0, 1, 1,
1.791769, -0.3243601, 0.1131857, 0, 0, 0, 1, 1,
1.809958, -1.053053, 2.52651, 0, 0, 0, 1, 1,
1.81118, 1.072589, 0.8777372, 0, 0, 0, 1, 1,
1.822909, -0.1964714, 1.547888, 1, 1, 1, 1, 1,
1.837661, 1.014719, -0.479859, 1, 1, 1, 1, 1,
1.839627, -1.993041, 2.846627, 1, 1, 1, 1, 1,
1.85624, 0.8964697, -0.03408312, 1, 1, 1, 1, 1,
1.86773, -0.887452, 0.6385987, 1, 1, 1, 1, 1,
1.874204, 0.02781325, 0.3042253, 1, 1, 1, 1, 1,
1.876913, -0.0875996, 2.200979, 1, 1, 1, 1, 1,
1.879265, 0.07789566, 0.1124322, 1, 1, 1, 1, 1,
1.883858, 1.037114, 2.809718, 1, 1, 1, 1, 1,
1.887061, 0.2575033, 0.9301643, 1, 1, 1, 1, 1,
1.897511, 0.8982018, 3.486625, 1, 1, 1, 1, 1,
1.936292, -0.4677344, 1.240067, 1, 1, 1, 1, 1,
1.947806, -0.4397623, 1.68911, 1, 1, 1, 1, 1,
1.96207, -0.4065019, 0.347071, 1, 1, 1, 1, 1,
1.96944, 0.254259, 2.042183, 1, 1, 1, 1, 1,
1.999401, 0.5360003, 1.829819, 0, 0, 1, 1, 1,
2.006822, -0.3805491, 0.5337611, 1, 0, 0, 1, 1,
2.069335, 0.7040545, 1.15746, 1, 0, 0, 1, 1,
2.075373, 0.1159846, 0.8938223, 1, 0, 0, 1, 1,
2.094893, -0.0494192, 1.015719, 1, 0, 0, 1, 1,
2.131326, 1.55763, 1.002211, 1, 0, 0, 1, 1,
2.137935, 0.230262, 1.807778, 0, 0, 0, 1, 1,
2.144713, 1.081727, -0.1440261, 0, 0, 0, 1, 1,
2.194017, -0.3495614, 0.01359947, 0, 0, 0, 1, 1,
2.268844, -0.6544099, 1.964194, 0, 0, 0, 1, 1,
2.280633, 0.3992045, 2.40336, 0, 0, 0, 1, 1,
2.297317, 0.5304593, 0.7717732, 0, 0, 0, 1, 1,
2.304913, -0.9943855, 0.4205972, 0, 0, 0, 1, 1,
2.330085, -0.09016922, 2.167051, 1, 1, 1, 1, 1,
2.343628, 0.09874123, 2.278693, 1, 1, 1, 1, 1,
2.346948, 0.7504907, 1.507656, 1, 1, 1, 1, 1,
2.46586, -0.8138515, 0.2725378, 1, 1, 1, 1, 1,
2.642765, -0.005323982, 0.2373394, 1, 1, 1, 1, 1,
2.64392, -0.2769629, 0.7755731, 1, 1, 1, 1, 1,
2.772432, -0.9319164, 2.239241, 1, 1, 1, 1, 1
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
var radius = 9.622128;
var distance = 33.79731;
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
mvMatrix.translate( 0.2611427, -0.1003749, 0.2878764 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79731);
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
