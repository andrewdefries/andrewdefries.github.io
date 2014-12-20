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
-3.649024, 1.241372, -0.3694612, 1, 0, 0, 1,
-3.522314, -0.4023966, -1.806646, 1, 0.007843138, 0, 1,
-2.842701, 0.2283754, -1.373786, 1, 0.01176471, 0, 1,
-2.715161, -1.228301, -3.760967, 1, 0.01960784, 0, 1,
-2.660771, -0.5993043, -2.34005, 1, 0.02352941, 0, 1,
-2.6528, 0.2781634, -2.360495, 1, 0.03137255, 0, 1,
-2.626791, -0.9474437, -4.401422, 1, 0.03529412, 0, 1,
-2.617283, -2.153455, -3.178171, 1, 0.04313726, 0, 1,
-2.415263, -0.1595312, -0.8747723, 1, 0.04705882, 0, 1,
-2.390974, -0.6842231, -0.7234264, 1, 0.05490196, 0, 1,
-2.371307, -1.906275, -2.776254, 1, 0.05882353, 0, 1,
-2.293406, 1.587431, 0.7444583, 1, 0.06666667, 0, 1,
-2.282961, 0.9346637, -0.5432027, 1, 0.07058824, 0, 1,
-2.271267, -1.407112, -1.884988, 1, 0.07843138, 0, 1,
-2.259641, 0.3639733, 0.2185643, 1, 0.08235294, 0, 1,
-2.231962, -0.6914487, -0.8913511, 1, 0.09019608, 0, 1,
-2.228847, -0.2586499, -2.270131, 1, 0.09411765, 0, 1,
-2.20661, -0.6609187, -1.72492, 1, 0.1019608, 0, 1,
-2.191614, -1.510962, -1.793512, 1, 0.1098039, 0, 1,
-2.169931, -0.9799857, -1.161423, 1, 0.1137255, 0, 1,
-2.166094, 1.399125, 0.1707428, 1, 0.1215686, 0, 1,
-2.136203, 0.5192964, -2.120953, 1, 0.1254902, 0, 1,
-2.098102, -1.374599, -0.9720576, 1, 0.1333333, 0, 1,
-2.046598, 0.5418447, -2.619709, 1, 0.1372549, 0, 1,
-2.022168, -0.2192651, -2.149265, 1, 0.145098, 0, 1,
-2.002126, 0.7396797, -1.929121, 1, 0.1490196, 0, 1,
-1.925329, 1.038232, -0.9037371, 1, 0.1568628, 0, 1,
-1.901809, -0.4666803, -1.109412, 1, 0.1607843, 0, 1,
-1.884023, -0.6794913, -1.941442, 1, 0.1686275, 0, 1,
-1.867528, -1.2579, -1.921378, 1, 0.172549, 0, 1,
-1.854326, 0.2489846, -1.633651, 1, 0.1803922, 0, 1,
-1.84567, 0.992086, -2.61924, 1, 0.1843137, 0, 1,
-1.841217, 0.1838638, -0.2511339, 1, 0.1921569, 0, 1,
-1.840884, 1.322042, 0.4791027, 1, 0.1960784, 0, 1,
-1.835451, -0.02488231, -2.403655, 1, 0.2039216, 0, 1,
-1.819209, 0.9583605, -0.320903, 1, 0.2117647, 0, 1,
-1.814958, 0.5205508, 1.019082, 1, 0.2156863, 0, 1,
-1.804016, -1.257891, -1.914374, 1, 0.2235294, 0, 1,
-1.803389, 0.06705606, -3.047082, 1, 0.227451, 0, 1,
-1.775899, -0.6034855, -2.050239, 1, 0.2352941, 0, 1,
-1.769036, -0.3629471, -1.424796, 1, 0.2392157, 0, 1,
-1.75143, -0.3177663, -2.021451, 1, 0.2470588, 0, 1,
-1.724746, 0.347311, -1.095507, 1, 0.2509804, 0, 1,
-1.711145, -1.07739, -3.001349, 1, 0.2588235, 0, 1,
-1.682346, 0.05533532, -0.9593748, 1, 0.2627451, 0, 1,
-1.671322, -0.8117257, -0.05503153, 1, 0.2705882, 0, 1,
-1.667251, 0.4320039, -0.5710617, 1, 0.2745098, 0, 1,
-1.665232, 1.64134, -0.7334928, 1, 0.282353, 0, 1,
-1.663728, -0.5453283, -2.505949, 1, 0.2862745, 0, 1,
-1.622769, 1.613956, -0.9840989, 1, 0.2941177, 0, 1,
-1.618659, 0.2272193, -1.13822, 1, 0.3019608, 0, 1,
-1.612057, -1.390564, -2.815532, 1, 0.3058824, 0, 1,
-1.607056, -0.6646105, -1.399277, 1, 0.3137255, 0, 1,
-1.581248, 1.322023, -0.56701, 1, 0.3176471, 0, 1,
-1.565962, -0.2423492, -2.889837, 1, 0.3254902, 0, 1,
-1.565913, 2.696445, -1.908646, 1, 0.3294118, 0, 1,
-1.552822, -0.03590161, -0.8094663, 1, 0.3372549, 0, 1,
-1.54753, -0.2000488, -1.839276, 1, 0.3411765, 0, 1,
-1.541146, 0.1884153, -0.4986025, 1, 0.3490196, 0, 1,
-1.512978, 0.6932053, -1.582521, 1, 0.3529412, 0, 1,
-1.496955, -1.452518, -4.816996, 1, 0.3607843, 0, 1,
-1.478823, 1.309651, -2.12421, 1, 0.3647059, 0, 1,
-1.468986, 1.649704, -2.575305, 1, 0.372549, 0, 1,
-1.467775, -0.151187, -1.732104, 1, 0.3764706, 0, 1,
-1.461855, -0.4393038, -3.176287, 1, 0.3843137, 0, 1,
-1.4537, -1.002168, -1.620342, 1, 0.3882353, 0, 1,
-1.452749, -0.3822525, -1.277433, 1, 0.3960784, 0, 1,
-1.446854, 0.5981898, -1.516672, 1, 0.4039216, 0, 1,
-1.443123, -0.5408221, -0.901517, 1, 0.4078431, 0, 1,
-1.442741, 0.5858068, -1.988009, 1, 0.4156863, 0, 1,
-1.440909, 1.709943, -0.4688265, 1, 0.4196078, 0, 1,
-1.437929, -0.0230593, -2.057856, 1, 0.427451, 0, 1,
-1.431867, -0.03766595, -2.375075, 1, 0.4313726, 0, 1,
-1.421664, -0.5260881, -1.350552, 1, 0.4392157, 0, 1,
-1.415827, -0.5773326, -2.728325, 1, 0.4431373, 0, 1,
-1.412792, 0.1188943, -0.681778, 1, 0.4509804, 0, 1,
-1.409256, 0.683856, -3.117696, 1, 0.454902, 0, 1,
-1.401571, -0.987656, -0.662237, 1, 0.4627451, 0, 1,
-1.398899, -0.6252995, -1.012755, 1, 0.4666667, 0, 1,
-1.392909, 0.5530936, 0.4664237, 1, 0.4745098, 0, 1,
-1.389204, -0.4795439, -1.69993, 1, 0.4784314, 0, 1,
-1.381425, -1.602049, -3.650039, 1, 0.4862745, 0, 1,
-1.376166, 0.3947785, -1.390706, 1, 0.4901961, 0, 1,
-1.374264, 0.4896739, -0.9251142, 1, 0.4980392, 0, 1,
-1.371963, 0.3041457, -0.4933467, 1, 0.5058824, 0, 1,
-1.371219, -0.174422, -1.11513, 1, 0.509804, 0, 1,
-1.359739, 0.6659817, -1.336131, 1, 0.5176471, 0, 1,
-1.35698, 0.3730364, -1.238575, 1, 0.5215687, 0, 1,
-1.338265, 0.4081722, -1.839039, 1, 0.5294118, 0, 1,
-1.334153, -1.789933, -1.304359, 1, 0.5333334, 0, 1,
-1.32625, -0.1625016, -0.7053089, 1, 0.5411765, 0, 1,
-1.321946, -0.1485604, -1.428155, 1, 0.5450981, 0, 1,
-1.303354, -0.08047133, -0.7190758, 1, 0.5529412, 0, 1,
-1.294935, 0.2121054, -0.4914092, 1, 0.5568628, 0, 1,
-1.292395, -1.602102, -1.583942, 1, 0.5647059, 0, 1,
-1.291615, 0.6569738, 1.085138, 1, 0.5686275, 0, 1,
-1.282229, -1.213251, -3.288633, 1, 0.5764706, 0, 1,
-1.26353, 0.5352414, -1.069372, 1, 0.5803922, 0, 1,
-1.262973, -0.2351344, -1.727898, 1, 0.5882353, 0, 1,
-1.262197, 0.1454958, -0.01264504, 1, 0.5921569, 0, 1,
-1.25579, 0.478891, -1.126381, 1, 0.6, 0, 1,
-1.255425, -0.3648199, -2.51649, 1, 0.6078432, 0, 1,
-1.254896, -1.174131, 0.08710153, 1, 0.6117647, 0, 1,
-1.253084, -0.3731591, -1.291767, 1, 0.6196079, 0, 1,
-1.245659, -0.1172601, -0.7602703, 1, 0.6235294, 0, 1,
-1.243671, -0.8198532, -2.200393, 1, 0.6313726, 0, 1,
-1.242528, -0.6557015, -0.7921228, 1, 0.6352941, 0, 1,
-1.235632, -1.238865, -0.6504715, 1, 0.6431373, 0, 1,
-1.232214, -1.476203, -3.406116, 1, 0.6470588, 0, 1,
-1.232063, -1.332321, -1.995169, 1, 0.654902, 0, 1,
-1.208276, -1.733648, -2.220542, 1, 0.6588235, 0, 1,
-1.208131, 1.593586, -0.5384931, 1, 0.6666667, 0, 1,
-1.1857, -0.5985606, -1.709888, 1, 0.6705883, 0, 1,
-1.181653, 0.0967377, 0.2379397, 1, 0.6784314, 0, 1,
-1.179206, -0.1892698, -1.874195, 1, 0.682353, 0, 1,
-1.179035, 0.5739298, -3.172798, 1, 0.6901961, 0, 1,
-1.176407, 0.6671507, -1.129053, 1, 0.6941177, 0, 1,
-1.161857, 0.5812308, -0.9974295, 1, 0.7019608, 0, 1,
-1.159738, -2.435372, -3.755647, 1, 0.7098039, 0, 1,
-1.159582, 1.275204, -1.32649, 1, 0.7137255, 0, 1,
-1.157975, -2.666535, -2.168124, 1, 0.7215686, 0, 1,
-1.15694, -1.546865, -3.400719, 1, 0.7254902, 0, 1,
-1.152338, 1.095249, -0.991733, 1, 0.7333333, 0, 1,
-1.152241, -0.3990833, -0.8720123, 1, 0.7372549, 0, 1,
-1.144128, -0.6262677, -2.881336, 1, 0.7450981, 0, 1,
-1.144048, 0.5105689, -1.416824, 1, 0.7490196, 0, 1,
-1.137167, -0.7643839, -2.752542, 1, 0.7568628, 0, 1,
-1.136713, 1.490758, -0.02773024, 1, 0.7607843, 0, 1,
-1.13594, -0.5967676, -1.418323, 1, 0.7686275, 0, 1,
-1.132127, -1.548369, -1.987202, 1, 0.772549, 0, 1,
-1.121069, -1.542369, -1.634084, 1, 0.7803922, 0, 1,
-1.119314, -0.7815441, -1.872163, 1, 0.7843137, 0, 1,
-1.116394, -0.2546828, -1.309472, 1, 0.7921569, 0, 1,
-1.105079, -1.666782, -0.3146661, 1, 0.7960784, 0, 1,
-1.089236, 0.1414333, -1.083308, 1, 0.8039216, 0, 1,
-1.087558, -0.4532691, -2.792678, 1, 0.8117647, 0, 1,
-1.081394, 0.05311322, -2.705481, 1, 0.8156863, 0, 1,
-1.081323, 0.02300851, -1.523561, 1, 0.8235294, 0, 1,
-1.079337, 0.2214336, -1.431784, 1, 0.827451, 0, 1,
-1.072309, -0.4609588, -1.406299, 1, 0.8352941, 0, 1,
-1.069903, 1.666625, -0.2913066, 1, 0.8392157, 0, 1,
-1.058462, -0.4719048, -2.147859, 1, 0.8470588, 0, 1,
-1.055014, 0.6056508, -0.2499881, 1, 0.8509804, 0, 1,
-1.053765, -0.8845319, -2.435595, 1, 0.8588235, 0, 1,
-1.051996, 1.83089, -0.6532747, 1, 0.8627451, 0, 1,
-1.050848, -1.906757, -2.718453, 1, 0.8705882, 0, 1,
-1.048704, -0.1177263, -2.083628, 1, 0.8745098, 0, 1,
-1.043372, -1.458492, -1.936669, 1, 0.8823529, 0, 1,
-1.038206, 0.8758473, -1.455048, 1, 0.8862745, 0, 1,
-1.031749, 0.7827696, -1.029289, 1, 0.8941177, 0, 1,
-1.027923, -0.1873356, -0.4816774, 1, 0.8980392, 0, 1,
-1.025811, -0.8841091, -3.653903, 1, 0.9058824, 0, 1,
-1.023179, -0.295113, -1.646537, 1, 0.9137255, 0, 1,
-1.019154, 1.10278, -0.004450325, 1, 0.9176471, 0, 1,
-1.017495, 0.4706657, -1.493558, 1, 0.9254902, 0, 1,
-1.013194, -0.2306407, -1.621539, 1, 0.9294118, 0, 1,
-1.010432, -0.4171368, -2.337273, 1, 0.9372549, 0, 1,
-1.005585, 1.122303, -0.626393, 1, 0.9411765, 0, 1,
-1.002858, -0.7893763, -1.895474, 1, 0.9490196, 0, 1,
-0.9997475, 1.345923, 1.068431, 1, 0.9529412, 0, 1,
-0.9971906, 2.150764, -0.3152384, 1, 0.9607843, 0, 1,
-0.9945369, -0.6265017, -3.081325, 1, 0.9647059, 0, 1,
-0.9854714, -0.3909974, -1.884673, 1, 0.972549, 0, 1,
-0.9788167, -1.439083, -3.107381, 1, 0.9764706, 0, 1,
-0.9708716, 1.195612, -1.176984, 1, 0.9843137, 0, 1,
-0.970059, 2.769739, -1.117055, 1, 0.9882353, 0, 1,
-0.961783, -0.3363582, -1.463614, 1, 0.9960784, 0, 1,
-0.9606639, -0.1514128, -1.280841, 0.9960784, 1, 0, 1,
-0.9559809, -0.9172884, -2.318089, 0.9921569, 1, 0, 1,
-0.953231, 0.6147949, -1.200123, 0.9843137, 1, 0, 1,
-0.941487, -1.190268, -2.110621, 0.9803922, 1, 0, 1,
-0.936782, 0.7416766, -1.773726, 0.972549, 1, 0, 1,
-0.9358714, -1.155649, -0.8776444, 0.9686275, 1, 0, 1,
-0.923612, 0.8708061, -0.2869096, 0.9607843, 1, 0, 1,
-0.9110537, 1.467028, -1.593649, 0.9568627, 1, 0, 1,
-0.9094366, 0.04059017, -0.8563464, 0.9490196, 1, 0, 1,
-0.8997194, -2.776644, -2.742031, 0.945098, 1, 0, 1,
-0.8990319, -0.4974789, -0.9838842, 0.9372549, 1, 0, 1,
-0.8947282, 1.829955, 0.8288091, 0.9333333, 1, 0, 1,
-0.8829985, -0.5018895, -1.898773, 0.9254902, 1, 0, 1,
-0.8798594, -2.574871, -3.541398, 0.9215686, 1, 0, 1,
-0.8755924, 0.3552218, -0.2781896, 0.9137255, 1, 0, 1,
-0.8725016, -0.5494844, -1.061621, 0.9098039, 1, 0, 1,
-0.8650951, 0.6533158, 0.3847666, 0.9019608, 1, 0, 1,
-0.8615699, 0.03203094, -1.612739, 0.8941177, 1, 0, 1,
-0.8592497, -0.3784459, -1.652229, 0.8901961, 1, 0, 1,
-0.8509645, 0.1264344, -1.98819, 0.8823529, 1, 0, 1,
-0.8487355, -0.3654639, -1.78763, 0.8784314, 1, 0, 1,
-0.8471389, 0.8523545, -0.7127964, 0.8705882, 1, 0, 1,
-0.8453152, 1.025645, 0.5521682, 0.8666667, 1, 0, 1,
-0.844865, 0.8711433, -1.013509, 0.8588235, 1, 0, 1,
-0.8441553, -0.06636886, -3.1436, 0.854902, 1, 0, 1,
-0.8428388, 1.678457, -0.7028963, 0.8470588, 1, 0, 1,
-0.8414443, 1.11599, -1.051677, 0.8431373, 1, 0, 1,
-0.8348292, 2.016855, -1.729763, 0.8352941, 1, 0, 1,
-0.827345, -0.08735192, -0.5616357, 0.8313726, 1, 0, 1,
-0.8220056, -1.213839, -1.623409, 0.8235294, 1, 0, 1,
-0.8209799, 1.876679, -0.7278736, 0.8196079, 1, 0, 1,
-0.8206135, -0.5350575, -4.039534, 0.8117647, 1, 0, 1,
-0.8169346, 1.058263, -1.125543, 0.8078431, 1, 0, 1,
-0.8165607, -2.161234, -1.616127, 0.8, 1, 0, 1,
-0.8164971, 0.3412343, -0.4452918, 0.7921569, 1, 0, 1,
-0.8164167, 0.4361625, -1.287459, 0.7882353, 1, 0, 1,
-0.8096432, -0.7369983, -2.191108, 0.7803922, 1, 0, 1,
-0.8080148, 0.292322, -0.8080665, 0.7764706, 1, 0, 1,
-0.8043487, 1.182989, -1.433641, 0.7686275, 1, 0, 1,
-0.8027937, -0.3757966, -0.8026623, 0.7647059, 1, 0, 1,
-0.8025652, 0.06979862, -1.318417, 0.7568628, 1, 0, 1,
-0.8015813, -1.131709, -3.097408, 0.7529412, 1, 0, 1,
-0.7954767, -1.394529, -1.82826, 0.7450981, 1, 0, 1,
-0.7942585, -1.823598, -4.231451, 0.7411765, 1, 0, 1,
-0.7921367, -0.3913887, -1.147883, 0.7333333, 1, 0, 1,
-0.7900094, 2.139716, 1.466112, 0.7294118, 1, 0, 1,
-0.7864323, -0.2843166, -2.282304, 0.7215686, 1, 0, 1,
-0.7848408, -0.01042217, -0.5616956, 0.7176471, 1, 0, 1,
-0.7792653, 0.04827553, -1.690877, 0.7098039, 1, 0, 1,
-0.7761374, 2.355047, -1.697644, 0.7058824, 1, 0, 1,
-0.7690905, -1.722751, -2.936665, 0.6980392, 1, 0, 1,
-0.7657868, 0.8272206, -0.8946007, 0.6901961, 1, 0, 1,
-0.7608172, -0.3755479, -1.307741, 0.6862745, 1, 0, 1,
-0.7595415, 1.2855, -0.2904794, 0.6784314, 1, 0, 1,
-0.7595401, 0.9230519, -1.953613, 0.6745098, 1, 0, 1,
-0.7573647, 0.5413324, -2.899965, 0.6666667, 1, 0, 1,
-0.7555742, 0.8510917, -0.2343046, 0.6627451, 1, 0, 1,
-0.7480099, -0.2679342, -1.945947, 0.654902, 1, 0, 1,
-0.7343658, -1.106822, -2.846292, 0.6509804, 1, 0, 1,
-0.7333898, 0.7510942, -0.0615449, 0.6431373, 1, 0, 1,
-0.7321885, -1.639846, -1.131517, 0.6392157, 1, 0, 1,
-0.7245353, 0.5320109, -0.04618223, 0.6313726, 1, 0, 1,
-0.7174254, -0.4158168, -3.729346, 0.627451, 1, 0, 1,
-0.7159281, -0.9992799, -3.198496, 0.6196079, 1, 0, 1,
-0.712411, -0.5879132, -3.101218, 0.6156863, 1, 0, 1,
-0.6923783, -1.137806, -2.901556, 0.6078432, 1, 0, 1,
-0.6906408, 0.6184191, -2.567096, 0.6039216, 1, 0, 1,
-0.6895258, 0.4697852, -1.129852, 0.5960785, 1, 0, 1,
-0.6879313, 0.6294619, -1.183467, 0.5882353, 1, 0, 1,
-0.6877554, -0.9074112, -2.7728, 0.5843138, 1, 0, 1,
-0.6861494, 0.05389888, -1.593439, 0.5764706, 1, 0, 1,
-0.6859298, -0.8237495, -1.758325, 0.572549, 1, 0, 1,
-0.6786737, 0.8066549, -0.7206306, 0.5647059, 1, 0, 1,
-0.678062, -0.04912904, -1.558231, 0.5607843, 1, 0, 1,
-0.6676298, -1.627515, -2.552308, 0.5529412, 1, 0, 1,
-0.6676017, -1.509147, -2.107706, 0.5490196, 1, 0, 1,
-0.6674224, 0.8314512, -0.5956731, 0.5411765, 1, 0, 1,
-0.6649652, 2.416352, -0.8308836, 0.5372549, 1, 0, 1,
-0.6610183, 0.5567488, -0.700504, 0.5294118, 1, 0, 1,
-0.6552903, 0.9902486, -1.204015, 0.5254902, 1, 0, 1,
-0.6528733, -1.010533, -2.502113, 0.5176471, 1, 0, 1,
-0.6515917, 1.552532, -0.09259077, 0.5137255, 1, 0, 1,
-0.6455433, -0.6050993, -2.018685, 0.5058824, 1, 0, 1,
-0.6355909, 0.7132456, -2.136275, 0.5019608, 1, 0, 1,
-0.6340151, 0.1990424, -0.4380287, 0.4941176, 1, 0, 1,
-0.6299208, -1.607657, -3.759487, 0.4862745, 1, 0, 1,
-0.6176085, 1.116993, -0.8148457, 0.4823529, 1, 0, 1,
-0.6119797, 1.914208, 0.5957657, 0.4745098, 1, 0, 1,
-0.6112701, -0.8527768, -1.843842, 0.4705882, 1, 0, 1,
-0.608202, 0.07414459, -2.280758, 0.4627451, 1, 0, 1,
-0.6058902, 2.36143, 1.857628, 0.4588235, 1, 0, 1,
-0.6049066, 1.385822, 0.05959462, 0.4509804, 1, 0, 1,
-0.6046306, 1.204349, -0.4069394, 0.4470588, 1, 0, 1,
-0.6028203, -0.06656148, -1.10639, 0.4392157, 1, 0, 1,
-0.5969073, -0.125877, -3.143177, 0.4352941, 1, 0, 1,
-0.5917042, -0.3654457, -1.764273, 0.427451, 1, 0, 1,
-0.5912265, 0.5109768, -1.353377, 0.4235294, 1, 0, 1,
-0.5872797, -1.720729, -2.894426, 0.4156863, 1, 0, 1,
-0.5853023, 1.744017, 0.3976995, 0.4117647, 1, 0, 1,
-0.5828867, 1.108282, 0.9051152, 0.4039216, 1, 0, 1,
-0.5780672, -1.335254, -1.753887, 0.3960784, 1, 0, 1,
-0.5772701, -0.2038177, -1.440196, 0.3921569, 1, 0, 1,
-0.5742933, 0.2050738, -1.155028, 0.3843137, 1, 0, 1,
-0.5716285, -0.1893277, -1.773038, 0.3803922, 1, 0, 1,
-0.5712926, 0.7485151, 0.09773613, 0.372549, 1, 0, 1,
-0.5694082, -0.0773695, -0.9095557, 0.3686275, 1, 0, 1,
-0.5654536, 1.191891, -2.127712, 0.3607843, 1, 0, 1,
-0.5597815, 0.3376829, -0.5332453, 0.3568628, 1, 0, 1,
-0.5552131, -1.150563, -3.277962, 0.3490196, 1, 0, 1,
-0.5486333, -0.4848792, -1.140602, 0.345098, 1, 0, 1,
-0.5479773, -0.6797982, -2.386472, 0.3372549, 1, 0, 1,
-0.5476783, 0.6997864, -0.3052414, 0.3333333, 1, 0, 1,
-0.546462, -0.5807638, -3.172454, 0.3254902, 1, 0, 1,
-0.5460376, -0.1886714, -1.072989, 0.3215686, 1, 0, 1,
-0.5451045, 0.07145458, 0.8309545, 0.3137255, 1, 0, 1,
-0.5419526, -0.5722235, -2.29382, 0.3098039, 1, 0, 1,
-0.5396463, -0.06240151, -2.26503, 0.3019608, 1, 0, 1,
-0.5384752, 0.02755562, -0.90796, 0.2941177, 1, 0, 1,
-0.5383868, -1.768975, -3.184613, 0.2901961, 1, 0, 1,
-0.536015, -0.4138526, -1.299123, 0.282353, 1, 0, 1,
-0.5346273, 0.04779796, -0.02430893, 0.2784314, 1, 0, 1,
-0.5340242, -1.325974, -2.102206, 0.2705882, 1, 0, 1,
-0.5299077, -1.275656, -2.272695, 0.2666667, 1, 0, 1,
-0.5290282, 0.8653055, -1.724575, 0.2588235, 1, 0, 1,
-0.527977, -0.3959397, -1.816265, 0.254902, 1, 0, 1,
-0.5237911, 2.099176, 0.06104069, 0.2470588, 1, 0, 1,
-0.5235679, -1.677274, -3.132934, 0.2431373, 1, 0, 1,
-0.5235067, 0.3943242, -0.2418318, 0.2352941, 1, 0, 1,
-0.5187332, 1.163235, -1.311938, 0.2313726, 1, 0, 1,
-0.5184386, 1.515976, -1.028748, 0.2235294, 1, 0, 1,
-0.5128983, -0.8288182, -3.275436, 0.2196078, 1, 0, 1,
-0.5099127, -0.8010507, -2.035108, 0.2117647, 1, 0, 1,
-0.5073447, 0.4647939, -1.192977, 0.2078431, 1, 0, 1,
-0.4967636, 0.5516044, -0.3684274, 0.2, 1, 0, 1,
-0.4932569, -0.1245116, -1.0856, 0.1921569, 1, 0, 1,
-0.4925902, 0.7729902, -0.783528, 0.1882353, 1, 0, 1,
-0.4904857, 0.5441934, 0.1897487, 0.1803922, 1, 0, 1,
-0.4865947, -1.748106, -2.977314, 0.1764706, 1, 0, 1,
-0.4864069, -0.9144084, -3.935069, 0.1686275, 1, 0, 1,
-0.4811602, 2.102003, 0.746499, 0.1647059, 1, 0, 1,
-0.4789048, -1.602766, -3.218544, 0.1568628, 1, 0, 1,
-0.4768245, -0.2003148, -1.198946, 0.1529412, 1, 0, 1,
-0.4730588, 1.417173, 0.8784161, 0.145098, 1, 0, 1,
-0.4700614, -0.3560658, -1.291886, 0.1411765, 1, 0, 1,
-0.4682344, -1.744335, -2.178061, 0.1333333, 1, 0, 1,
-0.4620886, -0.7682077, -3.035255, 0.1294118, 1, 0, 1,
-0.4603231, -0.7044181, -2.761525, 0.1215686, 1, 0, 1,
-0.4596744, -0.06660866, -2.081501, 0.1176471, 1, 0, 1,
-0.4584132, -0.4859092, -3.658486, 0.1098039, 1, 0, 1,
-0.4536113, 0.2498955, -2.653384, 0.1058824, 1, 0, 1,
-0.4518103, -2.525156, -1.779335, 0.09803922, 1, 0, 1,
-0.4489589, -0.6780889, -2.674191, 0.09019608, 1, 0, 1,
-0.4474383, 1.091922, 0.01555153, 0.08627451, 1, 0, 1,
-0.446723, -0.4252075, -3.547104, 0.07843138, 1, 0, 1,
-0.4439236, 0.9317811, 0.9451997, 0.07450981, 1, 0, 1,
-0.443814, 0.699378, -0.1095172, 0.06666667, 1, 0, 1,
-0.4424881, 1.133456, -1.416038, 0.0627451, 1, 0, 1,
-0.442177, 0.0169697, -1.372159, 0.05490196, 1, 0, 1,
-0.4408658, -0.1501537, -2.955431, 0.05098039, 1, 0, 1,
-0.4402755, -1.660643, -3.396072, 0.04313726, 1, 0, 1,
-0.4393326, -3.079807, -2.647107, 0.03921569, 1, 0, 1,
-0.4320228, 0.2402782, 0.3706124, 0.03137255, 1, 0, 1,
-0.4319452, -0.03357444, -2.184883, 0.02745098, 1, 0, 1,
-0.4235688, -0.5221426, -1.200295, 0.01960784, 1, 0, 1,
-0.4154968, 1.305322, 0.1384117, 0.01568628, 1, 0, 1,
-0.4151127, 0.01452091, -2.610072, 0.007843138, 1, 0, 1,
-0.4148988, -1.082446, -2.258509, 0.003921569, 1, 0, 1,
-0.4137073, -2.50748, -2.189611, 0, 1, 0.003921569, 1,
-0.4105646, 1.057632, -0.5019274, 0, 1, 0.01176471, 1,
-0.4103254, 1.674666, -1.943355, 0, 1, 0.01568628, 1,
-0.4055993, 0.4346456, -2.373613, 0, 1, 0.02352941, 1,
-0.3972309, -0.7980925, -2.665867, 0, 1, 0.02745098, 1,
-0.3965393, 1.394841, -0.06220373, 0, 1, 0.03529412, 1,
-0.3955072, -0.03376277, -3.54192, 0, 1, 0.03921569, 1,
-0.3908265, -0.5019336, -1.483153, 0, 1, 0.04705882, 1,
-0.3904123, 0.2166765, 0.1750645, 0, 1, 0.05098039, 1,
-0.3892583, 0.1200428, -1.096801, 0, 1, 0.05882353, 1,
-0.3882864, -1.652744, -2.648004, 0, 1, 0.0627451, 1,
-0.3859762, 0.2297853, -1.012665, 0, 1, 0.07058824, 1,
-0.3652048, -0.2707312, -1.597534, 0, 1, 0.07450981, 1,
-0.3606528, 0.1791703, -0.3406259, 0, 1, 0.08235294, 1,
-0.3598397, -0.2907646, -2.662619, 0, 1, 0.08627451, 1,
-0.3559942, 0.6253033, -0.6674237, 0, 1, 0.09411765, 1,
-0.3535627, 0.5547385, 0.4656472, 0, 1, 0.1019608, 1,
-0.3531458, 0.1599486, -1.520845, 0, 1, 0.1058824, 1,
-0.3482996, -0.2563861, -3.727834, 0, 1, 0.1137255, 1,
-0.3468899, 1.333981, 0.1932856, 0, 1, 0.1176471, 1,
-0.3464443, 0.5453273, -0.9348502, 0, 1, 0.1254902, 1,
-0.341292, -0.0703773, -1.610995, 0, 1, 0.1294118, 1,
-0.3355344, 0.004805089, -0.2155156, 0, 1, 0.1372549, 1,
-0.3347697, -0.9466569, -3.115498, 0, 1, 0.1411765, 1,
-0.333768, 1.454558, -0.9493762, 0, 1, 0.1490196, 1,
-0.3300731, -0.4316221, -1.951539, 0, 1, 0.1529412, 1,
-0.3280821, 0.9723179, 0.3037989, 0, 1, 0.1607843, 1,
-0.3263478, 0.3491476, -0.8088711, 0, 1, 0.1647059, 1,
-0.3247408, 0.7121109, -1.422508, 0, 1, 0.172549, 1,
-0.3225789, 0.250587, -2.00592, 0, 1, 0.1764706, 1,
-0.3206556, -0.02324447, -1.227169, 0, 1, 0.1843137, 1,
-0.3195316, 0.8720735, -1.128338, 0, 1, 0.1882353, 1,
-0.3159298, -0.6346966, -1.371825, 0, 1, 0.1960784, 1,
-0.3156533, -0.7757362, -3.295079, 0, 1, 0.2039216, 1,
-0.3127464, 0.4393061, 0.9669753, 0, 1, 0.2078431, 1,
-0.3081545, 0.5132457, -1.182323, 0, 1, 0.2156863, 1,
-0.3048969, -0.3765242, -2.282751, 0, 1, 0.2196078, 1,
-0.3029789, 0.1583081, -0.2426101, 0, 1, 0.227451, 1,
-0.2887681, 1.138697, -1.151493, 0, 1, 0.2313726, 1,
-0.2887119, -0.8816922, -2.633923, 0, 1, 0.2392157, 1,
-0.2878472, -0.7601694, -2.359705, 0, 1, 0.2431373, 1,
-0.2878389, -1.22749, -2.821397, 0, 1, 0.2509804, 1,
-0.2781079, 0.3409439, -1.360443, 0, 1, 0.254902, 1,
-0.2728483, 0.07815911, 0.2815973, 0, 1, 0.2627451, 1,
-0.2717286, -1.35275, -4.713088, 0, 1, 0.2666667, 1,
-0.2679945, -0.5143629, -3.41102, 0, 1, 0.2745098, 1,
-0.2672047, 0.1975928, -1.845064, 0, 1, 0.2784314, 1,
-0.2651306, 0.5046259, -1.120071, 0, 1, 0.2862745, 1,
-0.2600601, -0.9776611, -3.691856, 0, 1, 0.2901961, 1,
-0.257378, -0.4987983, -2.077463, 0, 1, 0.2980392, 1,
-0.2573657, 0.5503871, -2.267156, 0, 1, 0.3058824, 1,
-0.257264, 1.818149, -0.4650153, 0, 1, 0.3098039, 1,
-0.2469788, 0.7276933, -1.178801, 0, 1, 0.3176471, 1,
-0.2448646, 0.4902681, -0.771919, 0, 1, 0.3215686, 1,
-0.2425954, 1.33277, 0.4620732, 0, 1, 0.3294118, 1,
-0.2332329, 0.1759164, -1.989822, 0, 1, 0.3333333, 1,
-0.2313181, 1.486728, 0.1551028, 0, 1, 0.3411765, 1,
-0.2237689, -0.7084512, -3.14753, 0, 1, 0.345098, 1,
-0.2169017, -0.9558887, -2.849468, 0, 1, 0.3529412, 1,
-0.2165122, 0.8907239, 1.149638, 0, 1, 0.3568628, 1,
-0.2150865, 0.2570184, -0.1243323, 0, 1, 0.3647059, 1,
-0.2133156, 0.5614111, -0.7609057, 0, 1, 0.3686275, 1,
-0.2101127, -1.230245, -4.673254, 0, 1, 0.3764706, 1,
-0.2077478, 0.5179808, 0.04073939, 0, 1, 0.3803922, 1,
-0.2072622, -0.6161236, -4.074169, 0, 1, 0.3882353, 1,
-0.2050526, 0.7841115, 0.7070835, 0, 1, 0.3921569, 1,
-0.2038966, 0.4161203, -0.9422164, 0, 1, 0.4, 1,
-0.2033033, 1.238808, -0.04023989, 0, 1, 0.4078431, 1,
-0.2015435, 0.0406374, -0.9460576, 0, 1, 0.4117647, 1,
-0.1986626, 1.283588, 0.5570285, 0, 1, 0.4196078, 1,
-0.1980654, -0.3452674, -2.441813, 0, 1, 0.4235294, 1,
-0.1941329, 1.822602, -0.4806553, 0, 1, 0.4313726, 1,
-0.1899392, -0.4212533, -2.332522, 0, 1, 0.4352941, 1,
-0.1886255, 0.05591895, -1.666732, 0, 1, 0.4431373, 1,
-0.1875467, -0.3151174, -2.376737, 0, 1, 0.4470588, 1,
-0.1874898, -1.854604, -3.489691, 0, 1, 0.454902, 1,
-0.1844345, -0.009648375, -1.443576, 0, 1, 0.4588235, 1,
-0.1820682, -0.01571159, -2.628888, 0, 1, 0.4666667, 1,
-0.1756287, -1.024364, -3.820462, 0, 1, 0.4705882, 1,
-0.1753162, 0.4812621, -0.5933936, 0, 1, 0.4784314, 1,
-0.1674148, -0.3137982, -2.301609, 0, 1, 0.4823529, 1,
-0.1630619, 0.4435138, 1.304169, 0, 1, 0.4901961, 1,
-0.1625745, -1.866467, -1.130185, 0, 1, 0.4941176, 1,
-0.1583398, 0.001839847, -3.508187, 0, 1, 0.5019608, 1,
-0.1576882, 2.357051, -0.8080439, 0, 1, 0.509804, 1,
-0.1575008, 0.1217238, -0.1006696, 0, 1, 0.5137255, 1,
-0.1502431, -0.4132444, -3.784626, 0, 1, 0.5215687, 1,
-0.1496463, -1.201891, -4.014662, 0, 1, 0.5254902, 1,
-0.1471478, -0.6328831, -3.954937, 0, 1, 0.5333334, 1,
-0.1414539, -0.5700737, -1.658838, 0, 1, 0.5372549, 1,
-0.1352137, -0.4872053, -2.984969, 0, 1, 0.5450981, 1,
-0.132939, 0.1871525, 0.07619666, 0, 1, 0.5490196, 1,
-0.1292709, -0.3617001, -1.695398, 0, 1, 0.5568628, 1,
-0.12704, 1.264375, -0.1784252, 0, 1, 0.5607843, 1,
-0.1231995, 0.8495812, 0.3829275, 0, 1, 0.5686275, 1,
-0.1205808, 0.04652188, -0.2930536, 0, 1, 0.572549, 1,
-0.1200094, 0.2719819, -1.035529, 0, 1, 0.5803922, 1,
-0.1186158, -0.05263687, -2.094422, 0, 1, 0.5843138, 1,
-0.1174789, -1.055904, -3.259111, 0, 1, 0.5921569, 1,
-0.1163986, 0.01600297, -0.9592329, 0, 1, 0.5960785, 1,
-0.1150457, 1.258295, 1.249703, 0, 1, 0.6039216, 1,
-0.1146588, -0.3947039, -1.748598, 0, 1, 0.6117647, 1,
-0.1141621, 1.093737, 2.061059, 0, 1, 0.6156863, 1,
-0.1131779, -1.323825, -3.759301, 0, 1, 0.6235294, 1,
-0.1097785, 0.4429936, -0.3392951, 0, 1, 0.627451, 1,
-0.1095614, -1.72301, -4.039047, 0, 1, 0.6352941, 1,
-0.09720583, 0.1865175, -0.4886353, 0, 1, 0.6392157, 1,
-0.09673313, -1.081972, -1.616041, 0, 1, 0.6470588, 1,
-0.09559622, 0.2812656, -0.5661131, 0, 1, 0.6509804, 1,
-0.09489052, -0.7685463, -3.635158, 0, 1, 0.6588235, 1,
-0.09134006, 0.4791698, -0.6646802, 0, 1, 0.6627451, 1,
-0.09036677, -1.023369, -4.261075, 0, 1, 0.6705883, 1,
-0.08524386, -1.608247, -3.866857, 0, 1, 0.6745098, 1,
-0.07330045, 0.2117377, -2.157983, 0, 1, 0.682353, 1,
-0.06737514, 2.093463, -0.6072688, 0, 1, 0.6862745, 1,
-0.06673104, 0.8047596, 1.48436, 0, 1, 0.6941177, 1,
-0.06547979, 2.376077, -0.05618236, 0, 1, 0.7019608, 1,
-0.0588058, 2.039008, -1.332985, 0, 1, 0.7058824, 1,
-0.05866762, -0.8356532, -3.459741, 0, 1, 0.7137255, 1,
-0.05699155, -0.2727706, -5.912844, 0, 1, 0.7176471, 1,
-0.05078524, 0.7003654, 0.4913658, 0, 1, 0.7254902, 1,
-0.04826744, -0.009985667, -0.8210743, 0, 1, 0.7294118, 1,
-0.04591778, 0.7487707, -0.652454, 0, 1, 0.7372549, 1,
-0.04450038, -0.377337, -1.673018, 0, 1, 0.7411765, 1,
-0.04212764, 1.307171, 0.1775197, 0, 1, 0.7490196, 1,
-0.0413378, -0.3147685, -2.848573, 0, 1, 0.7529412, 1,
-0.03888461, -0.2478578, -3.093746, 0, 1, 0.7607843, 1,
-0.0367847, 1.453386, -0.543771, 0, 1, 0.7647059, 1,
-0.03324277, -1.849528, -2.907623, 0, 1, 0.772549, 1,
-0.02713634, 0.0188501, -0.3778942, 0, 1, 0.7764706, 1,
-0.02698394, 0.459879, 0.509281, 0, 1, 0.7843137, 1,
-0.02698351, 0.0688768, -0.4127627, 0, 1, 0.7882353, 1,
-0.02455889, 0.6111026, -0.8687039, 0, 1, 0.7960784, 1,
-0.02439266, 1.600754, 1.647815, 0, 1, 0.8039216, 1,
-0.02289654, 0.07760621, 0.08592867, 0, 1, 0.8078431, 1,
-0.02185219, 0.06978571, 0.2868123, 0, 1, 0.8156863, 1,
-0.02066154, 0.8573142, -0.2174442, 0, 1, 0.8196079, 1,
-0.01780015, -1.274025, -2.820087, 0, 1, 0.827451, 1,
-0.01688249, 1.951624, -1.405569, 0, 1, 0.8313726, 1,
-0.01207884, 0.02041385, -0.5840691, 0, 1, 0.8392157, 1,
-0.01070108, 0.3986371, 0.1460291, 0, 1, 0.8431373, 1,
-0.008896995, 0.547584, 1.72552, 0, 1, 0.8509804, 1,
-0.008807067, 0.4012333, -0.4584989, 0, 1, 0.854902, 1,
-0.00734425, -0.2242256, -2.250304, 0, 1, 0.8627451, 1,
-0.003817084, 1.225447, 2.327721, 0, 1, 0.8666667, 1,
-0.00303535, 0.6896624, 0.8026512, 0, 1, 0.8745098, 1,
0.0007983482, -0.1432467, 2.536448, 0, 1, 0.8784314, 1,
0.003672284, -0.6534926, 4.150228, 0, 1, 0.8862745, 1,
0.005706408, 0.06982461, -1.802009, 0, 1, 0.8901961, 1,
0.005740014, -0.04101273, 1.43703, 0, 1, 0.8980392, 1,
0.006161038, -0.3160245, 1.538936, 0, 1, 0.9058824, 1,
0.00904796, 1.568164, 0.3444093, 0, 1, 0.9098039, 1,
0.009131586, 1.87998, -0.1630888, 0, 1, 0.9176471, 1,
0.009616788, 0.03714091, 1.282683, 0, 1, 0.9215686, 1,
0.01050037, -0.5190948, 1.766483, 0, 1, 0.9294118, 1,
0.01531618, -2.003274, 3.041007, 0, 1, 0.9333333, 1,
0.01778716, 0.8111283, -0.2424416, 0, 1, 0.9411765, 1,
0.02780359, 1.78676, -0.4704447, 0, 1, 0.945098, 1,
0.02819182, 2.384461, -2.561848, 0, 1, 0.9529412, 1,
0.03145189, -0.284005, 3.444943, 0, 1, 0.9568627, 1,
0.0361843, 0.6942441, 3.027005, 0, 1, 0.9647059, 1,
0.03645765, -1.052123, 2.271391, 0, 1, 0.9686275, 1,
0.03691007, -0.04316945, 4.231062, 0, 1, 0.9764706, 1,
0.03825979, 0.1192861, 0.3666766, 0, 1, 0.9803922, 1,
0.03902928, -1.317683, 2.581049, 0, 1, 0.9882353, 1,
0.03953158, 1.178036, -2.918133, 0, 1, 0.9921569, 1,
0.04271455, -1.655232, 2.043863, 0, 1, 1, 1,
0.04286598, 0.111089, -0.9018016, 0, 0.9921569, 1, 1,
0.0448015, -0.7168366, 2.522084, 0, 0.9882353, 1, 1,
0.04552206, -0.5315522, 2.388148, 0, 0.9803922, 1, 1,
0.04552261, 1.765676, -0.2904916, 0, 0.9764706, 1, 1,
0.04841025, 1.205356, -0.6623725, 0, 0.9686275, 1, 1,
0.04848433, 1.63064, -0.3788277, 0, 0.9647059, 1, 1,
0.04870775, 0.5536675, -0.1198878, 0, 0.9568627, 1, 1,
0.05031617, -1.237804, 2.267557, 0, 0.9529412, 1, 1,
0.05128728, 0.404035, -0.8828532, 0, 0.945098, 1, 1,
0.05277153, -1.147647, 0.4989768, 0, 0.9411765, 1, 1,
0.05530657, -0.09072105, 2.874978, 0, 0.9333333, 1, 1,
0.05750454, 0.4376495, 0.07207319, 0, 0.9294118, 1, 1,
0.06092162, -0.9637449, 3.11029, 0, 0.9215686, 1, 1,
0.06557165, 0.8872476, 0.2624429, 0, 0.9176471, 1, 1,
0.07210597, -0.6000707, 2.375094, 0, 0.9098039, 1, 1,
0.07325853, -0.8195751, 2.621051, 0, 0.9058824, 1, 1,
0.07465652, 0.05439957, 1.418155, 0, 0.8980392, 1, 1,
0.07815686, 0.6497327, 0.7580534, 0, 0.8901961, 1, 1,
0.07885604, 2.075599, 1.649611, 0, 0.8862745, 1, 1,
0.08151015, -1.569006, 3.699763, 0, 0.8784314, 1, 1,
0.08391303, 0.3445501, 0.5324346, 0, 0.8745098, 1, 1,
0.08403559, 0.3967013, 0.3913557, 0, 0.8666667, 1, 1,
0.08899536, 0.9153849, 0.0357958, 0, 0.8627451, 1, 1,
0.08901247, -0.08254048, 1.424355, 0, 0.854902, 1, 1,
0.09546902, 0.7981318, 3.123186, 0, 0.8509804, 1, 1,
0.09859036, 0.2844958, 0.7745467, 0, 0.8431373, 1, 1,
0.09937483, 1.426006, 0.9013688, 0, 0.8392157, 1, 1,
0.100403, -1.353547, 2.806549, 0, 0.8313726, 1, 1,
0.1009377, -0.5513145, 3.552948, 0, 0.827451, 1, 1,
0.1020641, -0.4926976, 3.14556, 0, 0.8196079, 1, 1,
0.1099966, -1.089821, 4.723435, 0, 0.8156863, 1, 1,
0.1119798, 0.955707, 0.1726805, 0, 0.8078431, 1, 1,
0.1145281, 0.1602652, 1.407583, 0, 0.8039216, 1, 1,
0.1151808, -1.37924, 2.179107, 0, 0.7960784, 1, 1,
0.1157934, -0.4229598, 2.967364, 0, 0.7882353, 1, 1,
0.1183235, -1.729485, 1.230697, 0, 0.7843137, 1, 1,
0.1200613, -1.159397, 3.932902, 0, 0.7764706, 1, 1,
0.1265661, -0.2594427, 4.742527, 0, 0.772549, 1, 1,
0.1267386, 1.389155, -0.5049705, 0, 0.7647059, 1, 1,
0.1275874, 2.011864, 2.32022, 0, 0.7607843, 1, 1,
0.1280616, 0.7210251, -0.6715749, 0, 0.7529412, 1, 1,
0.1285802, 0.9407748, -0.1557853, 0, 0.7490196, 1, 1,
0.1299643, -1.58746, 2.780029, 0, 0.7411765, 1, 1,
0.1404698, 0.9656892, -0.5637982, 0, 0.7372549, 1, 1,
0.14228, -0.5167527, 4.223052, 0, 0.7294118, 1, 1,
0.1471958, 0.2234266, 0.2621089, 0, 0.7254902, 1, 1,
0.1472414, 1.049682, -1.007989, 0, 0.7176471, 1, 1,
0.1481319, 0.1505872, 0.2933227, 0, 0.7137255, 1, 1,
0.1549949, 0.1375494, -0.09865174, 0, 0.7058824, 1, 1,
0.1597407, -0.7346867, 2.104082, 0, 0.6980392, 1, 1,
0.162268, 0.3205942, 0.2419237, 0, 0.6941177, 1, 1,
0.1689681, -0.2850866, 0.724324, 0, 0.6862745, 1, 1,
0.1716939, -0.5081582, 2.654199, 0, 0.682353, 1, 1,
0.1724127, 1.251938, 2.67919, 0, 0.6745098, 1, 1,
0.1725903, 1.148456, -1.439305, 0, 0.6705883, 1, 1,
0.1837717, -2.58386, 1.317543, 0, 0.6627451, 1, 1,
0.1844369, 1.334888, 0.3021024, 0, 0.6588235, 1, 1,
0.185988, -1.589093, 2.919992, 0, 0.6509804, 1, 1,
0.1879815, 1.118142, 0.5854416, 0, 0.6470588, 1, 1,
0.1896406, -1.587947, 2.212959, 0, 0.6392157, 1, 1,
0.1917256, 0.5214735, 0.1783218, 0, 0.6352941, 1, 1,
0.1920735, 0.6206881, 1.033457, 0, 0.627451, 1, 1,
0.1944076, -0.037293, 2.624008, 0, 0.6235294, 1, 1,
0.1975885, -0.5177452, 2.690581, 0, 0.6156863, 1, 1,
0.208261, -0.009532551, 1.911847, 0, 0.6117647, 1, 1,
0.214098, -0.1464726, 2.454549, 0, 0.6039216, 1, 1,
0.2166204, -0.6440943, 3.506021, 0, 0.5960785, 1, 1,
0.2220235, -0.1194768, 2.303861, 0, 0.5921569, 1, 1,
0.2222945, -0.7446362, 2.623888, 0, 0.5843138, 1, 1,
0.2245628, 0.1381825, 1.312135, 0, 0.5803922, 1, 1,
0.2256901, 0.1456239, 2.352043, 0, 0.572549, 1, 1,
0.2265275, -0.3837238, 2.901767, 0, 0.5686275, 1, 1,
0.2265685, 2.036356, -0.05472295, 0, 0.5607843, 1, 1,
0.2316608, -0.4622076, 2.488439, 0, 0.5568628, 1, 1,
0.2340125, 1.323445, 2.534769, 0, 0.5490196, 1, 1,
0.2367296, 0.3256579, -1.702411, 0, 0.5450981, 1, 1,
0.2379164, -0.7798377, 2.782892, 0, 0.5372549, 1, 1,
0.2394006, -0.2698981, 3.198806, 0, 0.5333334, 1, 1,
0.2395701, 0.7073531, -0.6374595, 0, 0.5254902, 1, 1,
0.2432913, -1.332335, 4.282971, 0, 0.5215687, 1, 1,
0.2434903, 1.725898, 0.4903307, 0, 0.5137255, 1, 1,
0.2440081, -0.1920275, -0.03200807, 0, 0.509804, 1, 1,
0.2446879, 0.8864887, -0.5990945, 0, 0.5019608, 1, 1,
0.2469393, 0.4824954, 1.390232, 0, 0.4941176, 1, 1,
0.2477437, 0.4088234, 0.697439, 0, 0.4901961, 1, 1,
0.2494459, 0.1684584, 0.1520816, 0, 0.4823529, 1, 1,
0.2495589, 0.2915285, 1.679885, 0, 0.4784314, 1, 1,
0.2538193, 0.5490016, 1.504028, 0, 0.4705882, 1, 1,
0.2540914, -0.7520887, 0.8549321, 0, 0.4666667, 1, 1,
0.2543136, -0.8269318, 1.594726, 0, 0.4588235, 1, 1,
0.2556243, -1.211436, 0.2804896, 0, 0.454902, 1, 1,
0.2558621, -1.286029, 3.381776, 0, 0.4470588, 1, 1,
0.2570467, 1.382667, -0.212927, 0, 0.4431373, 1, 1,
0.2629467, -0.3670443, 3.173581, 0, 0.4352941, 1, 1,
0.2671664, 0.4396029, 1.107321, 0, 0.4313726, 1, 1,
0.2675519, -0.4846341, 1.429863, 0, 0.4235294, 1, 1,
0.2680262, -0.6330743, 2.598435, 0, 0.4196078, 1, 1,
0.2725003, 0.5474448, 0.9738501, 0, 0.4117647, 1, 1,
0.2785918, -0.1135233, 4.099975, 0, 0.4078431, 1, 1,
0.2809666, 0.4414609, 2.196505, 0, 0.4, 1, 1,
0.2901251, 0.9012612, 0.3586261, 0, 0.3921569, 1, 1,
0.2941268, 0.01020087, 2.249692, 0, 0.3882353, 1, 1,
0.2972531, -1.06247, 3.77608, 0, 0.3803922, 1, 1,
0.2983651, 0.7750877, 1.174726, 0, 0.3764706, 1, 1,
0.3013961, -1.955921, 3.395719, 0, 0.3686275, 1, 1,
0.3024768, 2.100316, 0.7958734, 0, 0.3647059, 1, 1,
0.3040676, -0.5018015, 2.29529, 0, 0.3568628, 1, 1,
0.3047374, -0.6255933, 4.515133, 0, 0.3529412, 1, 1,
0.3078858, -0.1024897, 5.065687, 0, 0.345098, 1, 1,
0.3099169, 0.4329381, 0.570466, 0, 0.3411765, 1, 1,
0.313156, 1.012746, 3.389396, 0, 0.3333333, 1, 1,
0.3132213, 0.2418855, 1.599011, 0, 0.3294118, 1, 1,
0.313311, 0.7572379, -0.03148363, 0, 0.3215686, 1, 1,
0.3137522, 0.390143, -0.4653867, 0, 0.3176471, 1, 1,
0.3148557, -0.2700246, 2.448214, 0, 0.3098039, 1, 1,
0.3184309, -1.252333, 2.073479, 0, 0.3058824, 1, 1,
0.318834, 2.406922, 2.153332, 0, 0.2980392, 1, 1,
0.3216788, 0.2041375, 0.8203201, 0, 0.2901961, 1, 1,
0.3222941, 0.9262487, 0.4641566, 0, 0.2862745, 1, 1,
0.3297969, 1.189659, 0.8802682, 0, 0.2784314, 1, 1,
0.3307641, 0.4335636, -0.4752944, 0, 0.2745098, 1, 1,
0.3364689, 1.572633, 1.607333, 0, 0.2666667, 1, 1,
0.3393028, -0.468414, 1.075796, 0, 0.2627451, 1, 1,
0.3426445, 2.260647, -0.5215596, 0, 0.254902, 1, 1,
0.3464744, -1.744459, 2.571832, 0, 0.2509804, 1, 1,
0.3475009, -0.2976232, 2.787534, 0, 0.2431373, 1, 1,
0.3476506, 0.3755985, 1.538968, 0, 0.2392157, 1, 1,
0.3500793, -1.235507, 3.249891, 0, 0.2313726, 1, 1,
0.350539, 0.3325573, 0.3187748, 0, 0.227451, 1, 1,
0.3507015, -0.0895844, 1.283308, 0, 0.2196078, 1, 1,
0.3520024, 1.112779, 0.100393, 0, 0.2156863, 1, 1,
0.35236, 0.6184363, -0.4829032, 0, 0.2078431, 1, 1,
0.3594818, 0.6471185, 0.500874, 0, 0.2039216, 1, 1,
0.3596205, 0.5406184, 0.5763357, 0, 0.1960784, 1, 1,
0.3600091, -1.382747, 3.898891, 0, 0.1882353, 1, 1,
0.3607712, -0.7954147, 1.362719, 0, 0.1843137, 1, 1,
0.3619714, -1.05744, 3.368526, 0, 0.1764706, 1, 1,
0.3623762, 0.1320502, -0.5711855, 0, 0.172549, 1, 1,
0.3637062, -0.09906409, 1.423326, 0, 0.1647059, 1, 1,
0.3648065, 2.15277, 0.7659307, 0, 0.1607843, 1, 1,
0.3653121, 0.6368244, -0.2208847, 0, 0.1529412, 1, 1,
0.3657508, 0.09122515, 2.928504, 0, 0.1490196, 1, 1,
0.3660872, 0.638702, -0.65708, 0, 0.1411765, 1, 1,
0.3677284, 0.2188491, 3.16169, 0, 0.1372549, 1, 1,
0.3765288, 0.4333827, 0.3958739, 0, 0.1294118, 1, 1,
0.3817919, -0.7016098, 3.172194, 0, 0.1254902, 1, 1,
0.383061, 0.9092602, -1.043515, 0, 0.1176471, 1, 1,
0.3862826, -1.160704, 3.477402, 0, 0.1137255, 1, 1,
0.3891268, -1.364784, 3.713576, 0, 0.1058824, 1, 1,
0.397619, -1.991407, 2.283655, 0, 0.09803922, 1, 1,
0.4000944, 0.7836579, 0.4055721, 0, 0.09411765, 1, 1,
0.4007691, -1.19683, 4.51528, 0, 0.08627451, 1, 1,
0.4056312, -0.8013616, 2.762418, 0, 0.08235294, 1, 1,
0.4095183, 0.2271422, 3.783952, 0, 0.07450981, 1, 1,
0.4105071, -1.82491, 2.493884, 0, 0.07058824, 1, 1,
0.412738, -0.4625062, 3.979211, 0, 0.0627451, 1, 1,
0.4133922, 0.4671753, 0.8217267, 0, 0.05882353, 1, 1,
0.4183777, -0.2119324, 0.5588759, 0, 0.05098039, 1, 1,
0.4183863, -1.304779, 3.202454, 0, 0.04705882, 1, 1,
0.4196175, -1.059851, 3.218604, 0, 0.03921569, 1, 1,
0.4210386, -0.8693764, 0.04804248, 0, 0.03529412, 1, 1,
0.4210815, -1.048601, 5.236951, 0, 0.02745098, 1, 1,
0.4256156, -0.3861904, 3.202043, 0, 0.02352941, 1, 1,
0.4263905, 0.9254684, -0.6415209, 0, 0.01568628, 1, 1,
0.427141, 0.7601951, 1.589421, 0, 0.01176471, 1, 1,
0.4283372, -1.748176, 3.212506, 0, 0.003921569, 1, 1,
0.4289754, 0.2331599, 1.17696, 0.003921569, 0, 1, 1,
0.4324895, 0.35673, 2.055949, 0.007843138, 0, 1, 1,
0.4334079, -0.242573, 3.498893, 0.01568628, 0, 1, 1,
0.4339745, -1.453568, 3.301233, 0.01960784, 0, 1, 1,
0.4344944, 0.1478554, 1.461643, 0.02745098, 0, 1, 1,
0.4357646, 0.5485504, -0.1599483, 0.03137255, 0, 1, 1,
0.437865, 2.222816, -1.287056, 0.03921569, 0, 1, 1,
0.4406005, 1.570341, -0.8166166, 0.04313726, 0, 1, 1,
0.4409579, -0.07617006, 2.050738, 0.05098039, 0, 1, 1,
0.4444467, -0.2390018, -1.142534, 0.05490196, 0, 1, 1,
0.4606699, -0.4650408, 2.399335, 0.0627451, 0, 1, 1,
0.4611219, 0.5079536, 1.698166, 0.06666667, 0, 1, 1,
0.4661943, 1.330257, -0.6234048, 0.07450981, 0, 1, 1,
0.4698003, 0.8352816, 0.1076256, 0.07843138, 0, 1, 1,
0.4699034, 0.9127485, 0.3354882, 0.08627451, 0, 1, 1,
0.4768831, 0.1165104, 0.3495072, 0.09019608, 0, 1, 1,
0.4835904, -1.189655, 2.684654, 0.09803922, 0, 1, 1,
0.4904261, -0.01833982, 0.4077311, 0.1058824, 0, 1, 1,
0.4926168, 0.447065, -0.03993224, 0.1098039, 0, 1, 1,
0.4929974, -0.2083015, 2.582334, 0.1176471, 0, 1, 1,
0.4953532, 0.9288527, 1.999492, 0.1215686, 0, 1, 1,
0.4956796, -0.2360752, 1.852138, 0.1294118, 0, 1, 1,
0.4998964, -0.07528872, 1.461279, 0.1333333, 0, 1, 1,
0.500461, -0.03003732, 1.491051, 0.1411765, 0, 1, 1,
0.5014101, 0.01505982, 1.872719, 0.145098, 0, 1, 1,
0.5037585, -1.097835, 3.752594, 0.1529412, 0, 1, 1,
0.5053675, 0.41168, 1.291706, 0.1568628, 0, 1, 1,
0.5089185, 1.969, -0.5670962, 0.1647059, 0, 1, 1,
0.5122093, -0.5757069, 2.570177, 0.1686275, 0, 1, 1,
0.5127497, -0.3572759, 2.571744, 0.1764706, 0, 1, 1,
0.5131488, 0.1716357, 0.8668343, 0.1803922, 0, 1, 1,
0.5161934, -2.162871, 2.423908, 0.1882353, 0, 1, 1,
0.5284757, -0.3618215, 1.561711, 0.1921569, 0, 1, 1,
0.5321254, -0.5368654, 3.124341, 0.2, 0, 1, 1,
0.5335906, 0.630017, 2.316177, 0.2078431, 0, 1, 1,
0.5361116, -0.8382692, 3.274249, 0.2117647, 0, 1, 1,
0.536225, -1.118919, 2.148255, 0.2196078, 0, 1, 1,
0.538857, 0.4588619, 0.7387009, 0.2235294, 0, 1, 1,
0.5403088, -0.01407947, 2.594595, 0.2313726, 0, 1, 1,
0.5404521, -0.4312734, 2.233559, 0.2352941, 0, 1, 1,
0.5409247, -0.7655088, 2.767893, 0.2431373, 0, 1, 1,
0.5443225, 0.3564719, 0.2434597, 0.2470588, 0, 1, 1,
0.5505241, 0.2815907, 0.9452335, 0.254902, 0, 1, 1,
0.5556001, -0.2413054, 1.943966, 0.2588235, 0, 1, 1,
0.558333, -1.060802, 2.217122, 0.2666667, 0, 1, 1,
0.5586763, 0.04678648, 1.681306, 0.2705882, 0, 1, 1,
0.5606179, -1.423107, 1.989849, 0.2784314, 0, 1, 1,
0.5607144, -2.594983, 3.172294, 0.282353, 0, 1, 1,
0.5634533, -0.6361223, 2.176865, 0.2901961, 0, 1, 1,
0.5660566, -0.05925253, 0.3766589, 0.2941177, 0, 1, 1,
0.5685427, 0.8283614, 0.6201943, 0.3019608, 0, 1, 1,
0.5756966, -0.5257844, 4.227895, 0.3098039, 0, 1, 1,
0.5802336, -0.5923204, 2.727627, 0.3137255, 0, 1, 1,
0.5815594, 0.3469308, 0.6217435, 0.3215686, 0, 1, 1,
0.582373, -2.547832, 2.072566, 0.3254902, 0, 1, 1,
0.5830517, 0.6641095, 0.7107374, 0.3333333, 0, 1, 1,
0.5842535, 1.807851, -1.051833, 0.3372549, 0, 1, 1,
0.5884236, -0.9836386, 3.378495, 0.345098, 0, 1, 1,
0.5941018, 1.10271, -0.09662264, 0.3490196, 0, 1, 1,
0.5956836, -0.4233615, 1.270639, 0.3568628, 0, 1, 1,
0.5990792, -0.8339676, 0.2117656, 0.3607843, 0, 1, 1,
0.5993479, -0.6786811, 3.174902, 0.3686275, 0, 1, 1,
0.6002271, -0.7503178, 4.717077, 0.372549, 0, 1, 1,
0.6064342, -0.6753101, 1.306982, 0.3803922, 0, 1, 1,
0.6098096, -0.5489614, 2.719227, 0.3843137, 0, 1, 1,
0.6120709, -0.1546019, 0.849034, 0.3921569, 0, 1, 1,
0.6130676, -1.138825, 3.291244, 0.3960784, 0, 1, 1,
0.6142513, 0.2095874, 0.7548292, 0.4039216, 0, 1, 1,
0.6192753, 1.602553, 1.619587, 0.4117647, 0, 1, 1,
0.623796, -0.7630035, 2.055138, 0.4156863, 0, 1, 1,
0.625838, 0.8363867, 0.8620192, 0.4235294, 0, 1, 1,
0.6271775, -2.45325, 3.248612, 0.427451, 0, 1, 1,
0.6297842, 0.717196, 0.8625154, 0.4352941, 0, 1, 1,
0.6373021, 1.147913, 0.1060708, 0.4392157, 0, 1, 1,
0.6429852, -0.001753045, 1.759135, 0.4470588, 0, 1, 1,
0.6477183, -1.819386, 3.043887, 0.4509804, 0, 1, 1,
0.6482028, -0.1575753, 1.883384, 0.4588235, 0, 1, 1,
0.6555975, -1.443693, 3.871088, 0.4627451, 0, 1, 1,
0.6584784, -1.87507, 3.954494, 0.4705882, 0, 1, 1,
0.6627824, 1.353866, 1.338381, 0.4745098, 0, 1, 1,
0.6684535, -1.007888, 2.499123, 0.4823529, 0, 1, 1,
0.6707059, 0.247554, 0.6736612, 0.4862745, 0, 1, 1,
0.6712628, 0.6047623, 0.88938, 0.4941176, 0, 1, 1,
0.6715646, -1.237081, 3.371123, 0.5019608, 0, 1, 1,
0.6786405, -0.5051382, 1.253999, 0.5058824, 0, 1, 1,
0.6788288, -0.6486415, 2.604691, 0.5137255, 0, 1, 1,
0.682776, 0.3098179, 1.131192, 0.5176471, 0, 1, 1,
0.6869485, -1.788204, 2.293307, 0.5254902, 0, 1, 1,
0.6875515, 0.1195342, 1.251052, 0.5294118, 0, 1, 1,
0.6885849, 1.314173, 0.6628138, 0.5372549, 0, 1, 1,
0.6909239, 1.680826, 0.866291, 0.5411765, 0, 1, 1,
0.6919707, 1.935938, -0.8934026, 0.5490196, 0, 1, 1,
0.694079, 0.7968265, 0.7825114, 0.5529412, 0, 1, 1,
0.6999109, -0.3317644, 1.306842, 0.5607843, 0, 1, 1,
0.7046816, 0.2030909, 2.876269, 0.5647059, 0, 1, 1,
0.709521, -0.05894268, 3.180464, 0.572549, 0, 1, 1,
0.7154678, 0.5304528, 2.401151, 0.5764706, 0, 1, 1,
0.7214603, -0.8821645, 3.185335, 0.5843138, 0, 1, 1,
0.7269287, 0.4016857, 1.75995, 0.5882353, 0, 1, 1,
0.7284772, 0.4404371, -0.8082805, 0.5960785, 0, 1, 1,
0.7336161, 1.683811, 0.8857828, 0.6039216, 0, 1, 1,
0.7351227, -1.835662, 5.180639, 0.6078432, 0, 1, 1,
0.7383302, 1.957641, -0.3249508, 0.6156863, 0, 1, 1,
0.7435433, -2.180071, 3.924284, 0.6196079, 0, 1, 1,
0.7473297, -0.5489639, 3.518161, 0.627451, 0, 1, 1,
0.7533426, 0.6388464, -0.5571595, 0.6313726, 0, 1, 1,
0.7539567, -0.8939679, 1.585215, 0.6392157, 0, 1, 1,
0.7552164, -1.532863, 1.491744, 0.6431373, 0, 1, 1,
0.7584817, -1.835656, 2.974169, 0.6509804, 0, 1, 1,
0.7609386, 0.380924, 1.709068, 0.654902, 0, 1, 1,
0.7668336, 2.448905, 0.8615797, 0.6627451, 0, 1, 1,
0.7671908, -0.4097646, 1.813854, 0.6666667, 0, 1, 1,
0.7682006, 1.036708, 1.415079, 0.6745098, 0, 1, 1,
0.7752538, -0.05358884, 2.490599, 0.6784314, 0, 1, 1,
0.7808961, -2.450659, 2.635183, 0.6862745, 0, 1, 1,
0.7826236, 0.4221063, 1.18547, 0.6901961, 0, 1, 1,
0.7935581, 0.06437349, 1.570712, 0.6980392, 0, 1, 1,
0.7978573, -0.002801707, 0.9671977, 0.7058824, 0, 1, 1,
0.8030485, 0.1233587, 3.188086, 0.7098039, 0, 1, 1,
0.80542, 0.5455415, 2.178612, 0.7176471, 0, 1, 1,
0.8098841, 0.8497188, 1.094773, 0.7215686, 0, 1, 1,
0.8106372, 0.8652569, 0.5004398, 0.7294118, 0, 1, 1,
0.8136341, 0.6354085, 0.9978865, 0.7333333, 0, 1, 1,
0.8142541, 1.40807, 0.8100656, 0.7411765, 0, 1, 1,
0.8174793, -0.3850594, 2.702844, 0.7450981, 0, 1, 1,
0.8177146, 1.475503, -1.447276, 0.7529412, 0, 1, 1,
0.8179592, 0.3289316, 1.68266, 0.7568628, 0, 1, 1,
0.8205281, 0.4741187, 0.2226186, 0.7647059, 0, 1, 1,
0.8214234, 0.2033202, -0.2457154, 0.7686275, 0, 1, 1,
0.8260685, 0.2242701, 0.4464213, 0.7764706, 0, 1, 1,
0.8335429, -0.6787549, 1.483299, 0.7803922, 0, 1, 1,
0.8497872, -1.053262, 3.603447, 0.7882353, 0, 1, 1,
0.8506491, -0.1944974, 2.929536, 0.7921569, 0, 1, 1,
0.8525617, 0.6551292, 1.128895, 0.8, 0, 1, 1,
0.8566522, 1.839409, 1.072704, 0.8078431, 0, 1, 1,
0.8584713, 1.081718, 0.1163932, 0.8117647, 0, 1, 1,
0.8588311, -0.1002937, 1.783093, 0.8196079, 0, 1, 1,
0.8715259, -0.6080784, 4.202097, 0.8235294, 0, 1, 1,
0.8722296, 0.8176795, 1.437256, 0.8313726, 0, 1, 1,
0.8723097, 0.9478574, -0.3417281, 0.8352941, 0, 1, 1,
0.8783354, -0.6887448, 2.478674, 0.8431373, 0, 1, 1,
0.8813325, 0.9311724, -0.448664, 0.8470588, 0, 1, 1,
0.8822138, 0.9255037, -0.03703682, 0.854902, 0, 1, 1,
0.8858173, 2.019562, -0.06294563, 0.8588235, 0, 1, 1,
0.8918591, 0.585192, 2.43716, 0.8666667, 0, 1, 1,
0.8939654, -0.5521402, 2.022363, 0.8705882, 0, 1, 1,
0.8973106, -0.6771188, 2.981453, 0.8784314, 0, 1, 1,
0.9011804, -0.0327342, 0.1750349, 0.8823529, 0, 1, 1,
0.9031531, -0.01663263, 0.1114131, 0.8901961, 0, 1, 1,
0.9059625, 1.323722, 0.592451, 0.8941177, 0, 1, 1,
0.9061546, -1.047646, 4.35683, 0.9019608, 0, 1, 1,
0.9148501, -0.353967, 2.657054, 0.9098039, 0, 1, 1,
0.9266374, -1.834137, 3.659705, 0.9137255, 0, 1, 1,
0.9284292, -0.59349, 1.364656, 0.9215686, 0, 1, 1,
0.9293526, 0.7379611, 1.288477, 0.9254902, 0, 1, 1,
0.9301544, 1.581288, 0.440531, 0.9333333, 0, 1, 1,
0.930674, -0.1973143, 0.1256616, 0.9372549, 0, 1, 1,
0.9409134, 0.1632915, 1.349195, 0.945098, 0, 1, 1,
0.9417619, 0.1385488, 1.780188, 0.9490196, 0, 1, 1,
0.9432792, -0.3402723, 1.197992, 0.9568627, 0, 1, 1,
0.9436286, -1.478812, 2.131223, 0.9607843, 0, 1, 1,
0.9473501, 1.059642, 1.430941, 0.9686275, 0, 1, 1,
0.9520684, 0.3292505, 1.741304, 0.972549, 0, 1, 1,
0.9525304, -0.09332854, 0.3418878, 0.9803922, 0, 1, 1,
0.9573839, 0.3453712, 1.846725, 0.9843137, 0, 1, 1,
0.957821, 1.38005, -0.2976003, 0.9921569, 0, 1, 1,
0.9631991, 0.6623892, 1.187994, 0.9960784, 0, 1, 1,
0.970902, -1.315118, 2.459829, 1, 0, 0.9960784, 1,
0.9719444, 0.8176063, 1.193135, 1, 0, 0.9882353, 1,
0.9719782, -2.254154, 1.255672, 1, 0, 0.9843137, 1,
0.9755946, -0.6878619, 2.833818, 1, 0, 0.9764706, 1,
0.9783673, -0.5426196, 2.742939, 1, 0, 0.972549, 1,
0.9903755, 0.3123861, -0.2103798, 1, 0, 0.9647059, 1,
0.9954352, 0.6782473, -1.09709, 1, 0, 0.9607843, 1,
0.9984405, 1.609427, -0.7898818, 1, 0, 0.9529412, 1,
0.9995476, 0.1998566, 1.534762, 1, 0, 0.9490196, 1,
1.001854, 0.8422294, 0.4286902, 1, 0, 0.9411765, 1,
1.002388, -0.9766222, 2.442028, 1, 0, 0.9372549, 1,
1.003064, 0.6194852, 0.8484735, 1, 0, 0.9294118, 1,
1.008674, 0.5207868, 1.561943, 1, 0, 0.9254902, 1,
1.011914, -0.2743956, 2.819583, 1, 0, 0.9176471, 1,
1.01691, 2.062097, 0.3882242, 1, 0, 0.9137255, 1,
1.021908, 0.249676, 3.380379, 1, 0, 0.9058824, 1,
1.02205, -0.7418206, 0.5107985, 1, 0, 0.9019608, 1,
1.026055, -0.3530863, 3.029698, 1, 0, 0.8941177, 1,
1.04672, 1.38595, -0.9917014, 1, 0, 0.8862745, 1,
1.047744, -0.6307409, 2.074043, 1, 0, 0.8823529, 1,
1.050107, -1.650157, 1.640817, 1, 0, 0.8745098, 1,
1.05267, 0.8036227, 1.230444, 1, 0, 0.8705882, 1,
1.053631, -0.4274563, 3.276687, 1, 0, 0.8627451, 1,
1.05407, -0.3330509, 3.549769, 1, 0, 0.8588235, 1,
1.054378, 0.9010469, -0.02570218, 1, 0, 0.8509804, 1,
1.056053, 1.345256, 0.5438863, 1, 0, 0.8470588, 1,
1.060198, -1.784704, 2.906722, 1, 0, 0.8392157, 1,
1.061417, -0.5572242, 2.393495, 1, 0, 0.8352941, 1,
1.062291, -0.002030696, 2.814907, 1, 0, 0.827451, 1,
1.062582, -0.4167659, 1.883284, 1, 0, 0.8235294, 1,
1.06394, -0.4047883, 0.5900028, 1, 0, 0.8156863, 1,
1.066548, -0.5842506, 1.517539, 1, 0, 0.8117647, 1,
1.069606, 1.572822, -0.001071718, 1, 0, 0.8039216, 1,
1.079863, -0.1743134, 0.9584141, 1, 0, 0.7960784, 1,
1.080712, -1.362744, 2.64153, 1, 0, 0.7921569, 1,
1.087855, -2.024455, 1.093699, 1, 0, 0.7843137, 1,
1.093695, -0.2000547, 2.082392, 1, 0, 0.7803922, 1,
1.095833, 1.291154, 2.258227, 1, 0, 0.772549, 1,
1.09672, 1.288565, 1.250989, 1, 0, 0.7686275, 1,
1.101213, 2.032499, 0.6419219, 1, 0, 0.7607843, 1,
1.102891, -0.1521662, 1.302736, 1, 0, 0.7568628, 1,
1.106944, 1.482775, 0.839108, 1, 0, 0.7490196, 1,
1.110564, -0.609119, 2.563118, 1, 0, 0.7450981, 1,
1.111606, -0.6525925, 1.704797, 1, 0, 0.7372549, 1,
1.112202, -1.224772, 2.209448, 1, 0, 0.7333333, 1,
1.114956, 0.3787684, 0.5381012, 1, 0, 0.7254902, 1,
1.118093, 0.36212, 0.7695594, 1, 0, 0.7215686, 1,
1.122615, -1.404515, 2.131319, 1, 0, 0.7137255, 1,
1.124896, 0.5772212, 2.904293, 1, 0, 0.7098039, 1,
1.130542, 0.3063774, 0.6190557, 1, 0, 0.7019608, 1,
1.134193, 0.7471704, 1.161641, 1, 0, 0.6941177, 1,
1.137537, 0.3596997, 1.812693, 1, 0, 0.6901961, 1,
1.160086, 0.8293256, 0.437102, 1, 0, 0.682353, 1,
1.162448, 0.1197743, 2.036741, 1, 0, 0.6784314, 1,
1.165468, -0.3763869, 2.478156, 1, 0, 0.6705883, 1,
1.168032, 1.181998, 1.747923, 1, 0, 0.6666667, 1,
1.173701, -0.559851, 2.250354, 1, 0, 0.6588235, 1,
1.174595, -0.2771677, 2.374646, 1, 0, 0.654902, 1,
1.183545, -0.7961253, 0.8901502, 1, 0, 0.6470588, 1,
1.189699, -0.9762487, 3.12061, 1, 0, 0.6431373, 1,
1.194041, -0.4795285, 3.122324, 1, 0, 0.6352941, 1,
1.196319, -1.370028, 0.7168387, 1, 0, 0.6313726, 1,
1.198467, -0.3720402, 0.733093, 1, 0, 0.6235294, 1,
1.198719, -0.1864769, -1.012917, 1, 0, 0.6196079, 1,
1.201545, -0.3192911, 1.258274, 1, 0, 0.6117647, 1,
1.208301, -0.9160221, 1.113191, 1, 0, 0.6078432, 1,
1.211297, -0.6376913, 2.000523, 1, 0, 0.6, 1,
1.214236, 0.9239162, 1.625282, 1, 0, 0.5921569, 1,
1.218269, -1.023354, 4.68388, 1, 0, 0.5882353, 1,
1.21905, 0.4394614, 0.8502637, 1, 0, 0.5803922, 1,
1.235801, 0.6061935, 1.075667, 1, 0, 0.5764706, 1,
1.245025, 1.631447, 0.2572427, 1, 0, 0.5686275, 1,
1.252242, 0.361651, -1.413309, 1, 0, 0.5647059, 1,
1.25372, 0.30648, 1.725233, 1, 0, 0.5568628, 1,
1.274972, 1.265921, 1.45056, 1, 0, 0.5529412, 1,
1.278037, -0.8809518, 1.360264, 1, 0, 0.5450981, 1,
1.280025, 1.081232, 0.4694487, 1, 0, 0.5411765, 1,
1.284597, 0.9139488, 3.437629, 1, 0, 0.5333334, 1,
1.292309, -0.1019532, 3.345223, 1, 0, 0.5294118, 1,
1.295952, 0.4464964, 1.260561, 1, 0, 0.5215687, 1,
1.30613, 1.173187, 2.010394, 1, 0, 0.5176471, 1,
1.31553, 0.6307192, -0.09215579, 1, 0, 0.509804, 1,
1.331053, -4.087045, 2.305587, 1, 0, 0.5058824, 1,
1.337743, -0.9150933, 2.015954, 1, 0, 0.4980392, 1,
1.345178, -1.748869, 4.059781, 1, 0, 0.4901961, 1,
1.349046, 0.04687662, -0.4418167, 1, 0, 0.4862745, 1,
1.358325, -0.9394828, 1.231362, 1, 0, 0.4784314, 1,
1.370416, -0.2490302, 2.06833, 1, 0, 0.4745098, 1,
1.371401, 0.2686856, 1.107746, 1, 0, 0.4666667, 1,
1.372355, -1.529266, 1.702421, 1, 0, 0.4627451, 1,
1.374621, 1.094912, 2.437432, 1, 0, 0.454902, 1,
1.393682, 0.2225448, 2.326095, 1, 0, 0.4509804, 1,
1.400159, 0.3352642, 2.169507, 1, 0, 0.4431373, 1,
1.408413, 1.729615, 1.049956, 1, 0, 0.4392157, 1,
1.424177, 0.6177105, 0.6386655, 1, 0, 0.4313726, 1,
1.434289, -1.079696, 4.281236, 1, 0, 0.427451, 1,
1.446865, 1.736003, 1.506066, 1, 0, 0.4196078, 1,
1.447785, 0.8725044, 1.157527, 1, 0, 0.4156863, 1,
1.447995, 0.2047887, 0.8148842, 1, 0, 0.4078431, 1,
1.448635, -0.4762527, 0.4031047, 1, 0, 0.4039216, 1,
1.448654, 0.1433129, 0.04022683, 1, 0, 0.3960784, 1,
1.476162, 0.5603066, 2.048723, 1, 0, 0.3882353, 1,
1.485221, -1.103375, 1.775582, 1, 0, 0.3843137, 1,
1.495883, 0.1624912, 1.679221, 1, 0, 0.3764706, 1,
1.499984, 1.711394, -0.8422722, 1, 0, 0.372549, 1,
1.500162, -0.3604773, 1.338115, 1, 0, 0.3647059, 1,
1.501526, 0.1386315, 1.434651, 1, 0, 0.3607843, 1,
1.506278, 0.5140316, 0.4201495, 1, 0, 0.3529412, 1,
1.531366, 0.2097989, 0.7314739, 1, 0, 0.3490196, 1,
1.55136, -1.858324, 2.432477, 1, 0, 0.3411765, 1,
1.567941, 0.5376588, -0.2876244, 1, 0, 0.3372549, 1,
1.585615, 1.637081, 0.8442996, 1, 0, 0.3294118, 1,
1.594484, 1.203606, 0.05147131, 1, 0, 0.3254902, 1,
1.596665, -1.401541, 1.588778, 1, 0, 0.3176471, 1,
1.605374, -1.909005, 0.5186049, 1, 0, 0.3137255, 1,
1.608806, 0.448047, 1.712212, 1, 0, 0.3058824, 1,
1.632622, -0.830896, 1.607591, 1, 0, 0.2980392, 1,
1.641754, -0.716104, 2.186695, 1, 0, 0.2941177, 1,
1.652269, -2.248765, 3.600926, 1, 0, 0.2862745, 1,
1.659914, -0.3290902, 1.475407, 1, 0, 0.282353, 1,
1.669821, -0.1194473, 1.601322, 1, 0, 0.2745098, 1,
1.70963, -0.1754717, 1.840803, 1, 0, 0.2705882, 1,
1.718786, 0.03012797, 0.7820079, 1, 0, 0.2627451, 1,
1.719186, 0.5123089, 0.4607553, 1, 0, 0.2588235, 1,
1.725074, 2.986654, 3.22942, 1, 0, 0.2509804, 1,
1.730467, 0.9832937, 1.299036, 1, 0, 0.2470588, 1,
1.739594, 1.07295, 3.056879, 1, 0, 0.2392157, 1,
1.746822, -0.8595831, 2.963641, 1, 0, 0.2352941, 1,
1.769173, -0.6582336, 1.05018, 1, 0, 0.227451, 1,
1.776483, 1.184879, 0.454326, 1, 0, 0.2235294, 1,
1.780761, 0.72609, 2.273339, 1, 0, 0.2156863, 1,
1.791441, -0.1495416, -0.1514039, 1, 0, 0.2117647, 1,
1.806989, 0.8774502, 1.813734, 1, 0, 0.2039216, 1,
1.80843, 1.805865, 0.3231877, 1, 0, 0.1960784, 1,
1.827181, -0.007680385, 0.4500513, 1, 0, 0.1921569, 1,
1.840708, 0.4415989, 0.1061983, 1, 0, 0.1843137, 1,
1.844784, 1.066138, 1.609793, 1, 0, 0.1803922, 1,
1.853682, -0.5922647, 0.9265949, 1, 0, 0.172549, 1,
1.855736, 0.3300886, 2.423639, 1, 0, 0.1686275, 1,
1.85746, 0.4287694, 0.8031417, 1, 0, 0.1607843, 1,
1.86772, -0.4727297, 3.5579, 1, 0, 0.1568628, 1,
1.875432, 1.021655, 1.406193, 1, 0, 0.1490196, 1,
1.914874, 0.9775212, 2.196447, 1, 0, 0.145098, 1,
1.926245, -2.653854, 1.319085, 1, 0, 0.1372549, 1,
1.953722, 0.01118166, 1.141563, 1, 0, 0.1333333, 1,
1.960763, 0.4632017, 1.794794, 1, 0, 0.1254902, 1,
1.969164, 0.256085, 1.870506, 1, 0, 0.1215686, 1,
1.982976, -0.6261296, 1.248311, 1, 0, 0.1137255, 1,
2.023446, 0.03756922, 1.442127, 1, 0, 0.1098039, 1,
2.070085, 0.3415757, 1.11516, 1, 0, 0.1019608, 1,
2.079216, -1.52085, 3.152082, 1, 0, 0.09411765, 1,
2.079723, -0.314164, 3.176148, 1, 0, 0.09019608, 1,
2.080575, 0.06977308, 1.261218, 1, 0, 0.08235294, 1,
2.194539, 1.488547, 1.563879, 1, 0, 0.07843138, 1,
2.235246, -1.902092, 2.271864, 1, 0, 0.07058824, 1,
2.23786, 1.74056, 1.576568, 1, 0, 0.06666667, 1,
2.354215, 1.064448, 1.668336, 1, 0, 0.05882353, 1,
2.36948, 1.593152, 1.128654, 1, 0, 0.05490196, 1,
2.37078, 0.6794621, 2.385684, 1, 0, 0.04705882, 1,
2.405748, 0.2485279, 1.939428, 1, 0, 0.04313726, 1,
2.57447, 0.1894738, 0.2262477, 1, 0, 0.03529412, 1,
2.650882, 0.7802308, 1.880851, 1, 0, 0.03137255, 1,
2.688591, 0.3823476, 2.317373, 1, 0, 0.02352941, 1,
2.745132, -0.1197435, 0.8990721, 1, 0, 0.01960784, 1,
2.881998, 0.6609277, 0.6905108, 1, 0, 0.01176471, 1,
2.968207, 1.821073, 1.301469, 1, 0, 0.007843138, 1
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
-0.3404088, -5.286036, -7.802734, 0, -0.5, 0.5, 0.5,
-0.3404088, -5.286036, -7.802734, 1, -0.5, 0.5, 0.5,
-0.3404088, -5.286036, -7.802734, 1, 1.5, 0.5, 0.5,
-0.3404088, -5.286036, -7.802734, 0, 1.5, 0.5, 0.5
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
-4.770645, -0.5501953, -7.802734, 0, -0.5, 0.5, 0.5,
-4.770645, -0.5501953, -7.802734, 1, -0.5, 0.5, 0.5,
-4.770645, -0.5501953, -7.802734, 1, 1.5, 0.5, 0.5,
-4.770645, -0.5501953, -7.802734, 0, 1.5, 0.5, 0.5
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
-4.770645, -5.286036, -0.3379462, 0, -0.5, 0.5, 0.5,
-4.770645, -5.286036, -0.3379462, 1, -0.5, 0.5, 0.5,
-4.770645, -5.286036, -0.3379462, 1, 1.5, 0.5, 0.5,
-4.770645, -5.286036, -0.3379462, 0, 1.5, 0.5, 0.5
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
-3, -4.19315, -6.080091,
2, -4.19315, -6.080091,
-3, -4.19315, -6.080091,
-3, -4.375298, -6.367198,
-2, -4.19315, -6.080091,
-2, -4.375298, -6.367198,
-1, -4.19315, -6.080091,
-1, -4.375298, -6.367198,
0, -4.19315, -6.080091,
0, -4.375298, -6.367198,
1, -4.19315, -6.080091,
1, -4.375298, -6.367198,
2, -4.19315, -6.080091,
2, -4.375298, -6.367198
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
-3, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
-3, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
-3, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
-3, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5,
-2, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
-2, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
-2, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
-2, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5,
-1, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
-1, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
-1, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
-1, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5,
0, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
0, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
0, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
0, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5,
1, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
1, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
1, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
1, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5,
2, -4.739594, -6.941412, 0, -0.5, 0.5, 0.5,
2, -4.739594, -6.941412, 1, -0.5, 0.5, 0.5,
2, -4.739594, -6.941412, 1, 1.5, 0.5, 0.5,
2, -4.739594, -6.941412, 0, 1.5, 0.5, 0.5
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
-3.748283, -4, -6.080091,
-3.748283, 2, -6.080091,
-3.748283, -4, -6.080091,
-3.918677, -4, -6.367198,
-3.748283, -2, -6.080091,
-3.918677, -2, -6.367198,
-3.748283, 0, -6.080091,
-3.918677, 0, -6.367198,
-3.748283, 2, -6.080091,
-3.918677, 2, -6.367198
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
-4.259464, -4, -6.941412, 0, -0.5, 0.5, 0.5,
-4.259464, -4, -6.941412, 1, -0.5, 0.5, 0.5,
-4.259464, -4, -6.941412, 1, 1.5, 0.5, 0.5,
-4.259464, -4, -6.941412, 0, 1.5, 0.5, 0.5,
-4.259464, -2, -6.941412, 0, -0.5, 0.5, 0.5,
-4.259464, -2, -6.941412, 1, -0.5, 0.5, 0.5,
-4.259464, -2, -6.941412, 1, 1.5, 0.5, 0.5,
-4.259464, -2, -6.941412, 0, 1.5, 0.5, 0.5,
-4.259464, 0, -6.941412, 0, -0.5, 0.5, 0.5,
-4.259464, 0, -6.941412, 1, -0.5, 0.5, 0.5,
-4.259464, 0, -6.941412, 1, 1.5, 0.5, 0.5,
-4.259464, 0, -6.941412, 0, 1.5, 0.5, 0.5,
-4.259464, 2, -6.941412, 0, -0.5, 0.5, 0.5,
-4.259464, 2, -6.941412, 1, -0.5, 0.5, 0.5,
-4.259464, 2, -6.941412, 1, 1.5, 0.5, 0.5,
-4.259464, 2, -6.941412, 0, 1.5, 0.5, 0.5
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
-3.748283, -4.19315, -4,
-3.748283, -4.19315, 4,
-3.748283, -4.19315, -4,
-3.918677, -4.375298, -4,
-3.748283, -4.19315, -2,
-3.918677, -4.375298, -2,
-3.748283, -4.19315, 0,
-3.918677, -4.375298, 0,
-3.748283, -4.19315, 2,
-3.918677, -4.375298, 2,
-3.748283, -4.19315, 4,
-3.918677, -4.375298, 4
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
-4.259464, -4.739594, -4, 0, -0.5, 0.5, 0.5,
-4.259464, -4.739594, -4, 1, -0.5, 0.5, 0.5,
-4.259464, -4.739594, -4, 1, 1.5, 0.5, 0.5,
-4.259464, -4.739594, -4, 0, 1.5, 0.5, 0.5,
-4.259464, -4.739594, -2, 0, -0.5, 0.5, 0.5,
-4.259464, -4.739594, -2, 1, -0.5, 0.5, 0.5,
-4.259464, -4.739594, -2, 1, 1.5, 0.5, 0.5,
-4.259464, -4.739594, -2, 0, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 0, 0, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 0, 1, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 0, 1, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 0, 0, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 2, 0, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 2, 1, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 2, 1, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 2, 0, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 4, 0, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 4, 1, -0.5, 0.5, 0.5,
-4.259464, -4.739594, 4, 1, 1.5, 0.5, 0.5,
-4.259464, -4.739594, 4, 0, 1.5, 0.5, 0.5
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
-3.748283, -4.19315, -6.080091,
-3.748283, 3.09276, -6.080091,
-3.748283, -4.19315, 5.404198,
-3.748283, 3.09276, 5.404198,
-3.748283, -4.19315, -6.080091,
-3.748283, -4.19315, 5.404198,
-3.748283, 3.09276, -6.080091,
-3.748283, 3.09276, 5.404198,
-3.748283, -4.19315, -6.080091,
3.067465, -4.19315, -6.080091,
-3.748283, -4.19315, 5.404198,
3.067465, -4.19315, 5.404198,
-3.748283, 3.09276, -6.080091,
3.067465, 3.09276, -6.080091,
-3.748283, 3.09276, 5.404198,
3.067465, 3.09276, 5.404198,
3.067465, -4.19315, -6.080091,
3.067465, 3.09276, -6.080091,
3.067465, -4.19315, 5.404198,
3.067465, 3.09276, 5.404198,
3.067465, -4.19315, -6.080091,
3.067465, -4.19315, 5.404198,
3.067465, 3.09276, -6.080091,
3.067465, 3.09276, 5.404198
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
var radius = 8.123314;
var distance = 36.14154;
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
mvMatrix.translate( 0.3404088, 0.5501953, 0.3379462 );
mvMatrix.scale( 1.288646, 1.205489, 0.7647914 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.14154);
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
phenylurea<-read.table("phenylurea.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenylurea$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
y<-phenylurea$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
z<-phenylurea$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
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
-3.649024, 1.241372, -0.3694612, 0, 0, 1, 1, 1,
-3.522314, -0.4023966, -1.806646, 1, 0, 0, 1, 1,
-2.842701, 0.2283754, -1.373786, 1, 0, 0, 1, 1,
-2.715161, -1.228301, -3.760967, 1, 0, 0, 1, 1,
-2.660771, -0.5993043, -2.34005, 1, 0, 0, 1, 1,
-2.6528, 0.2781634, -2.360495, 1, 0, 0, 1, 1,
-2.626791, -0.9474437, -4.401422, 0, 0, 0, 1, 1,
-2.617283, -2.153455, -3.178171, 0, 0, 0, 1, 1,
-2.415263, -0.1595312, -0.8747723, 0, 0, 0, 1, 1,
-2.390974, -0.6842231, -0.7234264, 0, 0, 0, 1, 1,
-2.371307, -1.906275, -2.776254, 0, 0, 0, 1, 1,
-2.293406, 1.587431, 0.7444583, 0, 0, 0, 1, 1,
-2.282961, 0.9346637, -0.5432027, 0, 0, 0, 1, 1,
-2.271267, -1.407112, -1.884988, 1, 1, 1, 1, 1,
-2.259641, 0.3639733, 0.2185643, 1, 1, 1, 1, 1,
-2.231962, -0.6914487, -0.8913511, 1, 1, 1, 1, 1,
-2.228847, -0.2586499, -2.270131, 1, 1, 1, 1, 1,
-2.20661, -0.6609187, -1.72492, 1, 1, 1, 1, 1,
-2.191614, -1.510962, -1.793512, 1, 1, 1, 1, 1,
-2.169931, -0.9799857, -1.161423, 1, 1, 1, 1, 1,
-2.166094, 1.399125, 0.1707428, 1, 1, 1, 1, 1,
-2.136203, 0.5192964, -2.120953, 1, 1, 1, 1, 1,
-2.098102, -1.374599, -0.9720576, 1, 1, 1, 1, 1,
-2.046598, 0.5418447, -2.619709, 1, 1, 1, 1, 1,
-2.022168, -0.2192651, -2.149265, 1, 1, 1, 1, 1,
-2.002126, 0.7396797, -1.929121, 1, 1, 1, 1, 1,
-1.925329, 1.038232, -0.9037371, 1, 1, 1, 1, 1,
-1.901809, -0.4666803, -1.109412, 1, 1, 1, 1, 1,
-1.884023, -0.6794913, -1.941442, 0, 0, 1, 1, 1,
-1.867528, -1.2579, -1.921378, 1, 0, 0, 1, 1,
-1.854326, 0.2489846, -1.633651, 1, 0, 0, 1, 1,
-1.84567, 0.992086, -2.61924, 1, 0, 0, 1, 1,
-1.841217, 0.1838638, -0.2511339, 1, 0, 0, 1, 1,
-1.840884, 1.322042, 0.4791027, 1, 0, 0, 1, 1,
-1.835451, -0.02488231, -2.403655, 0, 0, 0, 1, 1,
-1.819209, 0.9583605, -0.320903, 0, 0, 0, 1, 1,
-1.814958, 0.5205508, 1.019082, 0, 0, 0, 1, 1,
-1.804016, -1.257891, -1.914374, 0, 0, 0, 1, 1,
-1.803389, 0.06705606, -3.047082, 0, 0, 0, 1, 1,
-1.775899, -0.6034855, -2.050239, 0, 0, 0, 1, 1,
-1.769036, -0.3629471, -1.424796, 0, 0, 0, 1, 1,
-1.75143, -0.3177663, -2.021451, 1, 1, 1, 1, 1,
-1.724746, 0.347311, -1.095507, 1, 1, 1, 1, 1,
-1.711145, -1.07739, -3.001349, 1, 1, 1, 1, 1,
-1.682346, 0.05533532, -0.9593748, 1, 1, 1, 1, 1,
-1.671322, -0.8117257, -0.05503153, 1, 1, 1, 1, 1,
-1.667251, 0.4320039, -0.5710617, 1, 1, 1, 1, 1,
-1.665232, 1.64134, -0.7334928, 1, 1, 1, 1, 1,
-1.663728, -0.5453283, -2.505949, 1, 1, 1, 1, 1,
-1.622769, 1.613956, -0.9840989, 1, 1, 1, 1, 1,
-1.618659, 0.2272193, -1.13822, 1, 1, 1, 1, 1,
-1.612057, -1.390564, -2.815532, 1, 1, 1, 1, 1,
-1.607056, -0.6646105, -1.399277, 1, 1, 1, 1, 1,
-1.581248, 1.322023, -0.56701, 1, 1, 1, 1, 1,
-1.565962, -0.2423492, -2.889837, 1, 1, 1, 1, 1,
-1.565913, 2.696445, -1.908646, 1, 1, 1, 1, 1,
-1.552822, -0.03590161, -0.8094663, 0, 0, 1, 1, 1,
-1.54753, -0.2000488, -1.839276, 1, 0, 0, 1, 1,
-1.541146, 0.1884153, -0.4986025, 1, 0, 0, 1, 1,
-1.512978, 0.6932053, -1.582521, 1, 0, 0, 1, 1,
-1.496955, -1.452518, -4.816996, 1, 0, 0, 1, 1,
-1.478823, 1.309651, -2.12421, 1, 0, 0, 1, 1,
-1.468986, 1.649704, -2.575305, 0, 0, 0, 1, 1,
-1.467775, -0.151187, -1.732104, 0, 0, 0, 1, 1,
-1.461855, -0.4393038, -3.176287, 0, 0, 0, 1, 1,
-1.4537, -1.002168, -1.620342, 0, 0, 0, 1, 1,
-1.452749, -0.3822525, -1.277433, 0, 0, 0, 1, 1,
-1.446854, 0.5981898, -1.516672, 0, 0, 0, 1, 1,
-1.443123, -0.5408221, -0.901517, 0, 0, 0, 1, 1,
-1.442741, 0.5858068, -1.988009, 1, 1, 1, 1, 1,
-1.440909, 1.709943, -0.4688265, 1, 1, 1, 1, 1,
-1.437929, -0.0230593, -2.057856, 1, 1, 1, 1, 1,
-1.431867, -0.03766595, -2.375075, 1, 1, 1, 1, 1,
-1.421664, -0.5260881, -1.350552, 1, 1, 1, 1, 1,
-1.415827, -0.5773326, -2.728325, 1, 1, 1, 1, 1,
-1.412792, 0.1188943, -0.681778, 1, 1, 1, 1, 1,
-1.409256, 0.683856, -3.117696, 1, 1, 1, 1, 1,
-1.401571, -0.987656, -0.662237, 1, 1, 1, 1, 1,
-1.398899, -0.6252995, -1.012755, 1, 1, 1, 1, 1,
-1.392909, 0.5530936, 0.4664237, 1, 1, 1, 1, 1,
-1.389204, -0.4795439, -1.69993, 1, 1, 1, 1, 1,
-1.381425, -1.602049, -3.650039, 1, 1, 1, 1, 1,
-1.376166, 0.3947785, -1.390706, 1, 1, 1, 1, 1,
-1.374264, 0.4896739, -0.9251142, 1, 1, 1, 1, 1,
-1.371963, 0.3041457, -0.4933467, 0, 0, 1, 1, 1,
-1.371219, -0.174422, -1.11513, 1, 0, 0, 1, 1,
-1.359739, 0.6659817, -1.336131, 1, 0, 0, 1, 1,
-1.35698, 0.3730364, -1.238575, 1, 0, 0, 1, 1,
-1.338265, 0.4081722, -1.839039, 1, 0, 0, 1, 1,
-1.334153, -1.789933, -1.304359, 1, 0, 0, 1, 1,
-1.32625, -0.1625016, -0.7053089, 0, 0, 0, 1, 1,
-1.321946, -0.1485604, -1.428155, 0, 0, 0, 1, 1,
-1.303354, -0.08047133, -0.7190758, 0, 0, 0, 1, 1,
-1.294935, 0.2121054, -0.4914092, 0, 0, 0, 1, 1,
-1.292395, -1.602102, -1.583942, 0, 0, 0, 1, 1,
-1.291615, 0.6569738, 1.085138, 0, 0, 0, 1, 1,
-1.282229, -1.213251, -3.288633, 0, 0, 0, 1, 1,
-1.26353, 0.5352414, -1.069372, 1, 1, 1, 1, 1,
-1.262973, -0.2351344, -1.727898, 1, 1, 1, 1, 1,
-1.262197, 0.1454958, -0.01264504, 1, 1, 1, 1, 1,
-1.25579, 0.478891, -1.126381, 1, 1, 1, 1, 1,
-1.255425, -0.3648199, -2.51649, 1, 1, 1, 1, 1,
-1.254896, -1.174131, 0.08710153, 1, 1, 1, 1, 1,
-1.253084, -0.3731591, -1.291767, 1, 1, 1, 1, 1,
-1.245659, -0.1172601, -0.7602703, 1, 1, 1, 1, 1,
-1.243671, -0.8198532, -2.200393, 1, 1, 1, 1, 1,
-1.242528, -0.6557015, -0.7921228, 1, 1, 1, 1, 1,
-1.235632, -1.238865, -0.6504715, 1, 1, 1, 1, 1,
-1.232214, -1.476203, -3.406116, 1, 1, 1, 1, 1,
-1.232063, -1.332321, -1.995169, 1, 1, 1, 1, 1,
-1.208276, -1.733648, -2.220542, 1, 1, 1, 1, 1,
-1.208131, 1.593586, -0.5384931, 1, 1, 1, 1, 1,
-1.1857, -0.5985606, -1.709888, 0, 0, 1, 1, 1,
-1.181653, 0.0967377, 0.2379397, 1, 0, 0, 1, 1,
-1.179206, -0.1892698, -1.874195, 1, 0, 0, 1, 1,
-1.179035, 0.5739298, -3.172798, 1, 0, 0, 1, 1,
-1.176407, 0.6671507, -1.129053, 1, 0, 0, 1, 1,
-1.161857, 0.5812308, -0.9974295, 1, 0, 0, 1, 1,
-1.159738, -2.435372, -3.755647, 0, 0, 0, 1, 1,
-1.159582, 1.275204, -1.32649, 0, 0, 0, 1, 1,
-1.157975, -2.666535, -2.168124, 0, 0, 0, 1, 1,
-1.15694, -1.546865, -3.400719, 0, 0, 0, 1, 1,
-1.152338, 1.095249, -0.991733, 0, 0, 0, 1, 1,
-1.152241, -0.3990833, -0.8720123, 0, 0, 0, 1, 1,
-1.144128, -0.6262677, -2.881336, 0, 0, 0, 1, 1,
-1.144048, 0.5105689, -1.416824, 1, 1, 1, 1, 1,
-1.137167, -0.7643839, -2.752542, 1, 1, 1, 1, 1,
-1.136713, 1.490758, -0.02773024, 1, 1, 1, 1, 1,
-1.13594, -0.5967676, -1.418323, 1, 1, 1, 1, 1,
-1.132127, -1.548369, -1.987202, 1, 1, 1, 1, 1,
-1.121069, -1.542369, -1.634084, 1, 1, 1, 1, 1,
-1.119314, -0.7815441, -1.872163, 1, 1, 1, 1, 1,
-1.116394, -0.2546828, -1.309472, 1, 1, 1, 1, 1,
-1.105079, -1.666782, -0.3146661, 1, 1, 1, 1, 1,
-1.089236, 0.1414333, -1.083308, 1, 1, 1, 1, 1,
-1.087558, -0.4532691, -2.792678, 1, 1, 1, 1, 1,
-1.081394, 0.05311322, -2.705481, 1, 1, 1, 1, 1,
-1.081323, 0.02300851, -1.523561, 1, 1, 1, 1, 1,
-1.079337, 0.2214336, -1.431784, 1, 1, 1, 1, 1,
-1.072309, -0.4609588, -1.406299, 1, 1, 1, 1, 1,
-1.069903, 1.666625, -0.2913066, 0, 0, 1, 1, 1,
-1.058462, -0.4719048, -2.147859, 1, 0, 0, 1, 1,
-1.055014, 0.6056508, -0.2499881, 1, 0, 0, 1, 1,
-1.053765, -0.8845319, -2.435595, 1, 0, 0, 1, 1,
-1.051996, 1.83089, -0.6532747, 1, 0, 0, 1, 1,
-1.050848, -1.906757, -2.718453, 1, 0, 0, 1, 1,
-1.048704, -0.1177263, -2.083628, 0, 0, 0, 1, 1,
-1.043372, -1.458492, -1.936669, 0, 0, 0, 1, 1,
-1.038206, 0.8758473, -1.455048, 0, 0, 0, 1, 1,
-1.031749, 0.7827696, -1.029289, 0, 0, 0, 1, 1,
-1.027923, -0.1873356, -0.4816774, 0, 0, 0, 1, 1,
-1.025811, -0.8841091, -3.653903, 0, 0, 0, 1, 1,
-1.023179, -0.295113, -1.646537, 0, 0, 0, 1, 1,
-1.019154, 1.10278, -0.004450325, 1, 1, 1, 1, 1,
-1.017495, 0.4706657, -1.493558, 1, 1, 1, 1, 1,
-1.013194, -0.2306407, -1.621539, 1, 1, 1, 1, 1,
-1.010432, -0.4171368, -2.337273, 1, 1, 1, 1, 1,
-1.005585, 1.122303, -0.626393, 1, 1, 1, 1, 1,
-1.002858, -0.7893763, -1.895474, 1, 1, 1, 1, 1,
-0.9997475, 1.345923, 1.068431, 1, 1, 1, 1, 1,
-0.9971906, 2.150764, -0.3152384, 1, 1, 1, 1, 1,
-0.9945369, -0.6265017, -3.081325, 1, 1, 1, 1, 1,
-0.9854714, -0.3909974, -1.884673, 1, 1, 1, 1, 1,
-0.9788167, -1.439083, -3.107381, 1, 1, 1, 1, 1,
-0.9708716, 1.195612, -1.176984, 1, 1, 1, 1, 1,
-0.970059, 2.769739, -1.117055, 1, 1, 1, 1, 1,
-0.961783, -0.3363582, -1.463614, 1, 1, 1, 1, 1,
-0.9606639, -0.1514128, -1.280841, 1, 1, 1, 1, 1,
-0.9559809, -0.9172884, -2.318089, 0, 0, 1, 1, 1,
-0.953231, 0.6147949, -1.200123, 1, 0, 0, 1, 1,
-0.941487, -1.190268, -2.110621, 1, 0, 0, 1, 1,
-0.936782, 0.7416766, -1.773726, 1, 0, 0, 1, 1,
-0.9358714, -1.155649, -0.8776444, 1, 0, 0, 1, 1,
-0.923612, 0.8708061, -0.2869096, 1, 0, 0, 1, 1,
-0.9110537, 1.467028, -1.593649, 0, 0, 0, 1, 1,
-0.9094366, 0.04059017, -0.8563464, 0, 0, 0, 1, 1,
-0.8997194, -2.776644, -2.742031, 0, 0, 0, 1, 1,
-0.8990319, -0.4974789, -0.9838842, 0, 0, 0, 1, 1,
-0.8947282, 1.829955, 0.8288091, 0, 0, 0, 1, 1,
-0.8829985, -0.5018895, -1.898773, 0, 0, 0, 1, 1,
-0.8798594, -2.574871, -3.541398, 0, 0, 0, 1, 1,
-0.8755924, 0.3552218, -0.2781896, 1, 1, 1, 1, 1,
-0.8725016, -0.5494844, -1.061621, 1, 1, 1, 1, 1,
-0.8650951, 0.6533158, 0.3847666, 1, 1, 1, 1, 1,
-0.8615699, 0.03203094, -1.612739, 1, 1, 1, 1, 1,
-0.8592497, -0.3784459, -1.652229, 1, 1, 1, 1, 1,
-0.8509645, 0.1264344, -1.98819, 1, 1, 1, 1, 1,
-0.8487355, -0.3654639, -1.78763, 1, 1, 1, 1, 1,
-0.8471389, 0.8523545, -0.7127964, 1, 1, 1, 1, 1,
-0.8453152, 1.025645, 0.5521682, 1, 1, 1, 1, 1,
-0.844865, 0.8711433, -1.013509, 1, 1, 1, 1, 1,
-0.8441553, -0.06636886, -3.1436, 1, 1, 1, 1, 1,
-0.8428388, 1.678457, -0.7028963, 1, 1, 1, 1, 1,
-0.8414443, 1.11599, -1.051677, 1, 1, 1, 1, 1,
-0.8348292, 2.016855, -1.729763, 1, 1, 1, 1, 1,
-0.827345, -0.08735192, -0.5616357, 1, 1, 1, 1, 1,
-0.8220056, -1.213839, -1.623409, 0, 0, 1, 1, 1,
-0.8209799, 1.876679, -0.7278736, 1, 0, 0, 1, 1,
-0.8206135, -0.5350575, -4.039534, 1, 0, 0, 1, 1,
-0.8169346, 1.058263, -1.125543, 1, 0, 0, 1, 1,
-0.8165607, -2.161234, -1.616127, 1, 0, 0, 1, 1,
-0.8164971, 0.3412343, -0.4452918, 1, 0, 0, 1, 1,
-0.8164167, 0.4361625, -1.287459, 0, 0, 0, 1, 1,
-0.8096432, -0.7369983, -2.191108, 0, 0, 0, 1, 1,
-0.8080148, 0.292322, -0.8080665, 0, 0, 0, 1, 1,
-0.8043487, 1.182989, -1.433641, 0, 0, 0, 1, 1,
-0.8027937, -0.3757966, -0.8026623, 0, 0, 0, 1, 1,
-0.8025652, 0.06979862, -1.318417, 0, 0, 0, 1, 1,
-0.8015813, -1.131709, -3.097408, 0, 0, 0, 1, 1,
-0.7954767, -1.394529, -1.82826, 1, 1, 1, 1, 1,
-0.7942585, -1.823598, -4.231451, 1, 1, 1, 1, 1,
-0.7921367, -0.3913887, -1.147883, 1, 1, 1, 1, 1,
-0.7900094, 2.139716, 1.466112, 1, 1, 1, 1, 1,
-0.7864323, -0.2843166, -2.282304, 1, 1, 1, 1, 1,
-0.7848408, -0.01042217, -0.5616956, 1, 1, 1, 1, 1,
-0.7792653, 0.04827553, -1.690877, 1, 1, 1, 1, 1,
-0.7761374, 2.355047, -1.697644, 1, 1, 1, 1, 1,
-0.7690905, -1.722751, -2.936665, 1, 1, 1, 1, 1,
-0.7657868, 0.8272206, -0.8946007, 1, 1, 1, 1, 1,
-0.7608172, -0.3755479, -1.307741, 1, 1, 1, 1, 1,
-0.7595415, 1.2855, -0.2904794, 1, 1, 1, 1, 1,
-0.7595401, 0.9230519, -1.953613, 1, 1, 1, 1, 1,
-0.7573647, 0.5413324, -2.899965, 1, 1, 1, 1, 1,
-0.7555742, 0.8510917, -0.2343046, 1, 1, 1, 1, 1,
-0.7480099, -0.2679342, -1.945947, 0, 0, 1, 1, 1,
-0.7343658, -1.106822, -2.846292, 1, 0, 0, 1, 1,
-0.7333898, 0.7510942, -0.0615449, 1, 0, 0, 1, 1,
-0.7321885, -1.639846, -1.131517, 1, 0, 0, 1, 1,
-0.7245353, 0.5320109, -0.04618223, 1, 0, 0, 1, 1,
-0.7174254, -0.4158168, -3.729346, 1, 0, 0, 1, 1,
-0.7159281, -0.9992799, -3.198496, 0, 0, 0, 1, 1,
-0.712411, -0.5879132, -3.101218, 0, 0, 0, 1, 1,
-0.6923783, -1.137806, -2.901556, 0, 0, 0, 1, 1,
-0.6906408, 0.6184191, -2.567096, 0, 0, 0, 1, 1,
-0.6895258, 0.4697852, -1.129852, 0, 0, 0, 1, 1,
-0.6879313, 0.6294619, -1.183467, 0, 0, 0, 1, 1,
-0.6877554, -0.9074112, -2.7728, 0, 0, 0, 1, 1,
-0.6861494, 0.05389888, -1.593439, 1, 1, 1, 1, 1,
-0.6859298, -0.8237495, -1.758325, 1, 1, 1, 1, 1,
-0.6786737, 0.8066549, -0.7206306, 1, 1, 1, 1, 1,
-0.678062, -0.04912904, -1.558231, 1, 1, 1, 1, 1,
-0.6676298, -1.627515, -2.552308, 1, 1, 1, 1, 1,
-0.6676017, -1.509147, -2.107706, 1, 1, 1, 1, 1,
-0.6674224, 0.8314512, -0.5956731, 1, 1, 1, 1, 1,
-0.6649652, 2.416352, -0.8308836, 1, 1, 1, 1, 1,
-0.6610183, 0.5567488, -0.700504, 1, 1, 1, 1, 1,
-0.6552903, 0.9902486, -1.204015, 1, 1, 1, 1, 1,
-0.6528733, -1.010533, -2.502113, 1, 1, 1, 1, 1,
-0.6515917, 1.552532, -0.09259077, 1, 1, 1, 1, 1,
-0.6455433, -0.6050993, -2.018685, 1, 1, 1, 1, 1,
-0.6355909, 0.7132456, -2.136275, 1, 1, 1, 1, 1,
-0.6340151, 0.1990424, -0.4380287, 1, 1, 1, 1, 1,
-0.6299208, -1.607657, -3.759487, 0, 0, 1, 1, 1,
-0.6176085, 1.116993, -0.8148457, 1, 0, 0, 1, 1,
-0.6119797, 1.914208, 0.5957657, 1, 0, 0, 1, 1,
-0.6112701, -0.8527768, -1.843842, 1, 0, 0, 1, 1,
-0.608202, 0.07414459, -2.280758, 1, 0, 0, 1, 1,
-0.6058902, 2.36143, 1.857628, 1, 0, 0, 1, 1,
-0.6049066, 1.385822, 0.05959462, 0, 0, 0, 1, 1,
-0.6046306, 1.204349, -0.4069394, 0, 0, 0, 1, 1,
-0.6028203, -0.06656148, -1.10639, 0, 0, 0, 1, 1,
-0.5969073, -0.125877, -3.143177, 0, 0, 0, 1, 1,
-0.5917042, -0.3654457, -1.764273, 0, 0, 0, 1, 1,
-0.5912265, 0.5109768, -1.353377, 0, 0, 0, 1, 1,
-0.5872797, -1.720729, -2.894426, 0, 0, 0, 1, 1,
-0.5853023, 1.744017, 0.3976995, 1, 1, 1, 1, 1,
-0.5828867, 1.108282, 0.9051152, 1, 1, 1, 1, 1,
-0.5780672, -1.335254, -1.753887, 1, 1, 1, 1, 1,
-0.5772701, -0.2038177, -1.440196, 1, 1, 1, 1, 1,
-0.5742933, 0.2050738, -1.155028, 1, 1, 1, 1, 1,
-0.5716285, -0.1893277, -1.773038, 1, 1, 1, 1, 1,
-0.5712926, 0.7485151, 0.09773613, 1, 1, 1, 1, 1,
-0.5694082, -0.0773695, -0.9095557, 1, 1, 1, 1, 1,
-0.5654536, 1.191891, -2.127712, 1, 1, 1, 1, 1,
-0.5597815, 0.3376829, -0.5332453, 1, 1, 1, 1, 1,
-0.5552131, -1.150563, -3.277962, 1, 1, 1, 1, 1,
-0.5486333, -0.4848792, -1.140602, 1, 1, 1, 1, 1,
-0.5479773, -0.6797982, -2.386472, 1, 1, 1, 1, 1,
-0.5476783, 0.6997864, -0.3052414, 1, 1, 1, 1, 1,
-0.546462, -0.5807638, -3.172454, 1, 1, 1, 1, 1,
-0.5460376, -0.1886714, -1.072989, 0, 0, 1, 1, 1,
-0.5451045, 0.07145458, 0.8309545, 1, 0, 0, 1, 1,
-0.5419526, -0.5722235, -2.29382, 1, 0, 0, 1, 1,
-0.5396463, -0.06240151, -2.26503, 1, 0, 0, 1, 1,
-0.5384752, 0.02755562, -0.90796, 1, 0, 0, 1, 1,
-0.5383868, -1.768975, -3.184613, 1, 0, 0, 1, 1,
-0.536015, -0.4138526, -1.299123, 0, 0, 0, 1, 1,
-0.5346273, 0.04779796, -0.02430893, 0, 0, 0, 1, 1,
-0.5340242, -1.325974, -2.102206, 0, 0, 0, 1, 1,
-0.5299077, -1.275656, -2.272695, 0, 0, 0, 1, 1,
-0.5290282, 0.8653055, -1.724575, 0, 0, 0, 1, 1,
-0.527977, -0.3959397, -1.816265, 0, 0, 0, 1, 1,
-0.5237911, 2.099176, 0.06104069, 0, 0, 0, 1, 1,
-0.5235679, -1.677274, -3.132934, 1, 1, 1, 1, 1,
-0.5235067, 0.3943242, -0.2418318, 1, 1, 1, 1, 1,
-0.5187332, 1.163235, -1.311938, 1, 1, 1, 1, 1,
-0.5184386, 1.515976, -1.028748, 1, 1, 1, 1, 1,
-0.5128983, -0.8288182, -3.275436, 1, 1, 1, 1, 1,
-0.5099127, -0.8010507, -2.035108, 1, 1, 1, 1, 1,
-0.5073447, 0.4647939, -1.192977, 1, 1, 1, 1, 1,
-0.4967636, 0.5516044, -0.3684274, 1, 1, 1, 1, 1,
-0.4932569, -0.1245116, -1.0856, 1, 1, 1, 1, 1,
-0.4925902, 0.7729902, -0.783528, 1, 1, 1, 1, 1,
-0.4904857, 0.5441934, 0.1897487, 1, 1, 1, 1, 1,
-0.4865947, -1.748106, -2.977314, 1, 1, 1, 1, 1,
-0.4864069, -0.9144084, -3.935069, 1, 1, 1, 1, 1,
-0.4811602, 2.102003, 0.746499, 1, 1, 1, 1, 1,
-0.4789048, -1.602766, -3.218544, 1, 1, 1, 1, 1,
-0.4768245, -0.2003148, -1.198946, 0, 0, 1, 1, 1,
-0.4730588, 1.417173, 0.8784161, 1, 0, 0, 1, 1,
-0.4700614, -0.3560658, -1.291886, 1, 0, 0, 1, 1,
-0.4682344, -1.744335, -2.178061, 1, 0, 0, 1, 1,
-0.4620886, -0.7682077, -3.035255, 1, 0, 0, 1, 1,
-0.4603231, -0.7044181, -2.761525, 1, 0, 0, 1, 1,
-0.4596744, -0.06660866, -2.081501, 0, 0, 0, 1, 1,
-0.4584132, -0.4859092, -3.658486, 0, 0, 0, 1, 1,
-0.4536113, 0.2498955, -2.653384, 0, 0, 0, 1, 1,
-0.4518103, -2.525156, -1.779335, 0, 0, 0, 1, 1,
-0.4489589, -0.6780889, -2.674191, 0, 0, 0, 1, 1,
-0.4474383, 1.091922, 0.01555153, 0, 0, 0, 1, 1,
-0.446723, -0.4252075, -3.547104, 0, 0, 0, 1, 1,
-0.4439236, 0.9317811, 0.9451997, 1, 1, 1, 1, 1,
-0.443814, 0.699378, -0.1095172, 1, 1, 1, 1, 1,
-0.4424881, 1.133456, -1.416038, 1, 1, 1, 1, 1,
-0.442177, 0.0169697, -1.372159, 1, 1, 1, 1, 1,
-0.4408658, -0.1501537, -2.955431, 1, 1, 1, 1, 1,
-0.4402755, -1.660643, -3.396072, 1, 1, 1, 1, 1,
-0.4393326, -3.079807, -2.647107, 1, 1, 1, 1, 1,
-0.4320228, 0.2402782, 0.3706124, 1, 1, 1, 1, 1,
-0.4319452, -0.03357444, -2.184883, 1, 1, 1, 1, 1,
-0.4235688, -0.5221426, -1.200295, 1, 1, 1, 1, 1,
-0.4154968, 1.305322, 0.1384117, 1, 1, 1, 1, 1,
-0.4151127, 0.01452091, -2.610072, 1, 1, 1, 1, 1,
-0.4148988, -1.082446, -2.258509, 1, 1, 1, 1, 1,
-0.4137073, -2.50748, -2.189611, 1, 1, 1, 1, 1,
-0.4105646, 1.057632, -0.5019274, 1, 1, 1, 1, 1,
-0.4103254, 1.674666, -1.943355, 0, 0, 1, 1, 1,
-0.4055993, 0.4346456, -2.373613, 1, 0, 0, 1, 1,
-0.3972309, -0.7980925, -2.665867, 1, 0, 0, 1, 1,
-0.3965393, 1.394841, -0.06220373, 1, 0, 0, 1, 1,
-0.3955072, -0.03376277, -3.54192, 1, 0, 0, 1, 1,
-0.3908265, -0.5019336, -1.483153, 1, 0, 0, 1, 1,
-0.3904123, 0.2166765, 0.1750645, 0, 0, 0, 1, 1,
-0.3892583, 0.1200428, -1.096801, 0, 0, 0, 1, 1,
-0.3882864, -1.652744, -2.648004, 0, 0, 0, 1, 1,
-0.3859762, 0.2297853, -1.012665, 0, 0, 0, 1, 1,
-0.3652048, -0.2707312, -1.597534, 0, 0, 0, 1, 1,
-0.3606528, 0.1791703, -0.3406259, 0, 0, 0, 1, 1,
-0.3598397, -0.2907646, -2.662619, 0, 0, 0, 1, 1,
-0.3559942, 0.6253033, -0.6674237, 1, 1, 1, 1, 1,
-0.3535627, 0.5547385, 0.4656472, 1, 1, 1, 1, 1,
-0.3531458, 0.1599486, -1.520845, 1, 1, 1, 1, 1,
-0.3482996, -0.2563861, -3.727834, 1, 1, 1, 1, 1,
-0.3468899, 1.333981, 0.1932856, 1, 1, 1, 1, 1,
-0.3464443, 0.5453273, -0.9348502, 1, 1, 1, 1, 1,
-0.341292, -0.0703773, -1.610995, 1, 1, 1, 1, 1,
-0.3355344, 0.004805089, -0.2155156, 1, 1, 1, 1, 1,
-0.3347697, -0.9466569, -3.115498, 1, 1, 1, 1, 1,
-0.333768, 1.454558, -0.9493762, 1, 1, 1, 1, 1,
-0.3300731, -0.4316221, -1.951539, 1, 1, 1, 1, 1,
-0.3280821, 0.9723179, 0.3037989, 1, 1, 1, 1, 1,
-0.3263478, 0.3491476, -0.8088711, 1, 1, 1, 1, 1,
-0.3247408, 0.7121109, -1.422508, 1, 1, 1, 1, 1,
-0.3225789, 0.250587, -2.00592, 1, 1, 1, 1, 1,
-0.3206556, -0.02324447, -1.227169, 0, 0, 1, 1, 1,
-0.3195316, 0.8720735, -1.128338, 1, 0, 0, 1, 1,
-0.3159298, -0.6346966, -1.371825, 1, 0, 0, 1, 1,
-0.3156533, -0.7757362, -3.295079, 1, 0, 0, 1, 1,
-0.3127464, 0.4393061, 0.9669753, 1, 0, 0, 1, 1,
-0.3081545, 0.5132457, -1.182323, 1, 0, 0, 1, 1,
-0.3048969, -0.3765242, -2.282751, 0, 0, 0, 1, 1,
-0.3029789, 0.1583081, -0.2426101, 0, 0, 0, 1, 1,
-0.2887681, 1.138697, -1.151493, 0, 0, 0, 1, 1,
-0.2887119, -0.8816922, -2.633923, 0, 0, 0, 1, 1,
-0.2878472, -0.7601694, -2.359705, 0, 0, 0, 1, 1,
-0.2878389, -1.22749, -2.821397, 0, 0, 0, 1, 1,
-0.2781079, 0.3409439, -1.360443, 0, 0, 0, 1, 1,
-0.2728483, 0.07815911, 0.2815973, 1, 1, 1, 1, 1,
-0.2717286, -1.35275, -4.713088, 1, 1, 1, 1, 1,
-0.2679945, -0.5143629, -3.41102, 1, 1, 1, 1, 1,
-0.2672047, 0.1975928, -1.845064, 1, 1, 1, 1, 1,
-0.2651306, 0.5046259, -1.120071, 1, 1, 1, 1, 1,
-0.2600601, -0.9776611, -3.691856, 1, 1, 1, 1, 1,
-0.257378, -0.4987983, -2.077463, 1, 1, 1, 1, 1,
-0.2573657, 0.5503871, -2.267156, 1, 1, 1, 1, 1,
-0.257264, 1.818149, -0.4650153, 1, 1, 1, 1, 1,
-0.2469788, 0.7276933, -1.178801, 1, 1, 1, 1, 1,
-0.2448646, 0.4902681, -0.771919, 1, 1, 1, 1, 1,
-0.2425954, 1.33277, 0.4620732, 1, 1, 1, 1, 1,
-0.2332329, 0.1759164, -1.989822, 1, 1, 1, 1, 1,
-0.2313181, 1.486728, 0.1551028, 1, 1, 1, 1, 1,
-0.2237689, -0.7084512, -3.14753, 1, 1, 1, 1, 1,
-0.2169017, -0.9558887, -2.849468, 0, 0, 1, 1, 1,
-0.2165122, 0.8907239, 1.149638, 1, 0, 0, 1, 1,
-0.2150865, 0.2570184, -0.1243323, 1, 0, 0, 1, 1,
-0.2133156, 0.5614111, -0.7609057, 1, 0, 0, 1, 1,
-0.2101127, -1.230245, -4.673254, 1, 0, 0, 1, 1,
-0.2077478, 0.5179808, 0.04073939, 1, 0, 0, 1, 1,
-0.2072622, -0.6161236, -4.074169, 0, 0, 0, 1, 1,
-0.2050526, 0.7841115, 0.7070835, 0, 0, 0, 1, 1,
-0.2038966, 0.4161203, -0.9422164, 0, 0, 0, 1, 1,
-0.2033033, 1.238808, -0.04023989, 0, 0, 0, 1, 1,
-0.2015435, 0.0406374, -0.9460576, 0, 0, 0, 1, 1,
-0.1986626, 1.283588, 0.5570285, 0, 0, 0, 1, 1,
-0.1980654, -0.3452674, -2.441813, 0, 0, 0, 1, 1,
-0.1941329, 1.822602, -0.4806553, 1, 1, 1, 1, 1,
-0.1899392, -0.4212533, -2.332522, 1, 1, 1, 1, 1,
-0.1886255, 0.05591895, -1.666732, 1, 1, 1, 1, 1,
-0.1875467, -0.3151174, -2.376737, 1, 1, 1, 1, 1,
-0.1874898, -1.854604, -3.489691, 1, 1, 1, 1, 1,
-0.1844345, -0.009648375, -1.443576, 1, 1, 1, 1, 1,
-0.1820682, -0.01571159, -2.628888, 1, 1, 1, 1, 1,
-0.1756287, -1.024364, -3.820462, 1, 1, 1, 1, 1,
-0.1753162, 0.4812621, -0.5933936, 1, 1, 1, 1, 1,
-0.1674148, -0.3137982, -2.301609, 1, 1, 1, 1, 1,
-0.1630619, 0.4435138, 1.304169, 1, 1, 1, 1, 1,
-0.1625745, -1.866467, -1.130185, 1, 1, 1, 1, 1,
-0.1583398, 0.001839847, -3.508187, 1, 1, 1, 1, 1,
-0.1576882, 2.357051, -0.8080439, 1, 1, 1, 1, 1,
-0.1575008, 0.1217238, -0.1006696, 1, 1, 1, 1, 1,
-0.1502431, -0.4132444, -3.784626, 0, 0, 1, 1, 1,
-0.1496463, -1.201891, -4.014662, 1, 0, 0, 1, 1,
-0.1471478, -0.6328831, -3.954937, 1, 0, 0, 1, 1,
-0.1414539, -0.5700737, -1.658838, 1, 0, 0, 1, 1,
-0.1352137, -0.4872053, -2.984969, 1, 0, 0, 1, 1,
-0.132939, 0.1871525, 0.07619666, 1, 0, 0, 1, 1,
-0.1292709, -0.3617001, -1.695398, 0, 0, 0, 1, 1,
-0.12704, 1.264375, -0.1784252, 0, 0, 0, 1, 1,
-0.1231995, 0.8495812, 0.3829275, 0, 0, 0, 1, 1,
-0.1205808, 0.04652188, -0.2930536, 0, 0, 0, 1, 1,
-0.1200094, 0.2719819, -1.035529, 0, 0, 0, 1, 1,
-0.1186158, -0.05263687, -2.094422, 0, 0, 0, 1, 1,
-0.1174789, -1.055904, -3.259111, 0, 0, 0, 1, 1,
-0.1163986, 0.01600297, -0.9592329, 1, 1, 1, 1, 1,
-0.1150457, 1.258295, 1.249703, 1, 1, 1, 1, 1,
-0.1146588, -0.3947039, -1.748598, 1, 1, 1, 1, 1,
-0.1141621, 1.093737, 2.061059, 1, 1, 1, 1, 1,
-0.1131779, -1.323825, -3.759301, 1, 1, 1, 1, 1,
-0.1097785, 0.4429936, -0.3392951, 1, 1, 1, 1, 1,
-0.1095614, -1.72301, -4.039047, 1, 1, 1, 1, 1,
-0.09720583, 0.1865175, -0.4886353, 1, 1, 1, 1, 1,
-0.09673313, -1.081972, -1.616041, 1, 1, 1, 1, 1,
-0.09559622, 0.2812656, -0.5661131, 1, 1, 1, 1, 1,
-0.09489052, -0.7685463, -3.635158, 1, 1, 1, 1, 1,
-0.09134006, 0.4791698, -0.6646802, 1, 1, 1, 1, 1,
-0.09036677, -1.023369, -4.261075, 1, 1, 1, 1, 1,
-0.08524386, -1.608247, -3.866857, 1, 1, 1, 1, 1,
-0.07330045, 0.2117377, -2.157983, 1, 1, 1, 1, 1,
-0.06737514, 2.093463, -0.6072688, 0, 0, 1, 1, 1,
-0.06673104, 0.8047596, 1.48436, 1, 0, 0, 1, 1,
-0.06547979, 2.376077, -0.05618236, 1, 0, 0, 1, 1,
-0.0588058, 2.039008, -1.332985, 1, 0, 0, 1, 1,
-0.05866762, -0.8356532, -3.459741, 1, 0, 0, 1, 1,
-0.05699155, -0.2727706, -5.912844, 1, 0, 0, 1, 1,
-0.05078524, 0.7003654, 0.4913658, 0, 0, 0, 1, 1,
-0.04826744, -0.009985667, -0.8210743, 0, 0, 0, 1, 1,
-0.04591778, 0.7487707, -0.652454, 0, 0, 0, 1, 1,
-0.04450038, -0.377337, -1.673018, 0, 0, 0, 1, 1,
-0.04212764, 1.307171, 0.1775197, 0, 0, 0, 1, 1,
-0.0413378, -0.3147685, -2.848573, 0, 0, 0, 1, 1,
-0.03888461, -0.2478578, -3.093746, 0, 0, 0, 1, 1,
-0.0367847, 1.453386, -0.543771, 1, 1, 1, 1, 1,
-0.03324277, -1.849528, -2.907623, 1, 1, 1, 1, 1,
-0.02713634, 0.0188501, -0.3778942, 1, 1, 1, 1, 1,
-0.02698394, 0.459879, 0.509281, 1, 1, 1, 1, 1,
-0.02698351, 0.0688768, -0.4127627, 1, 1, 1, 1, 1,
-0.02455889, 0.6111026, -0.8687039, 1, 1, 1, 1, 1,
-0.02439266, 1.600754, 1.647815, 1, 1, 1, 1, 1,
-0.02289654, 0.07760621, 0.08592867, 1, 1, 1, 1, 1,
-0.02185219, 0.06978571, 0.2868123, 1, 1, 1, 1, 1,
-0.02066154, 0.8573142, -0.2174442, 1, 1, 1, 1, 1,
-0.01780015, -1.274025, -2.820087, 1, 1, 1, 1, 1,
-0.01688249, 1.951624, -1.405569, 1, 1, 1, 1, 1,
-0.01207884, 0.02041385, -0.5840691, 1, 1, 1, 1, 1,
-0.01070108, 0.3986371, 0.1460291, 1, 1, 1, 1, 1,
-0.008896995, 0.547584, 1.72552, 1, 1, 1, 1, 1,
-0.008807067, 0.4012333, -0.4584989, 0, 0, 1, 1, 1,
-0.00734425, -0.2242256, -2.250304, 1, 0, 0, 1, 1,
-0.003817084, 1.225447, 2.327721, 1, 0, 0, 1, 1,
-0.00303535, 0.6896624, 0.8026512, 1, 0, 0, 1, 1,
0.0007983482, -0.1432467, 2.536448, 1, 0, 0, 1, 1,
0.003672284, -0.6534926, 4.150228, 1, 0, 0, 1, 1,
0.005706408, 0.06982461, -1.802009, 0, 0, 0, 1, 1,
0.005740014, -0.04101273, 1.43703, 0, 0, 0, 1, 1,
0.006161038, -0.3160245, 1.538936, 0, 0, 0, 1, 1,
0.00904796, 1.568164, 0.3444093, 0, 0, 0, 1, 1,
0.009131586, 1.87998, -0.1630888, 0, 0, 0, 1, 1,
0.009616788, 0.03714091, 1.282683, 0, 0, 0, 1, 1,
0.01050037, -0.5190948, 1.766483, 0, 0, 0, 1, 1,
0.01531618, -2.003274, 3.041007, 1, 1, 1, 1, 1,
0.01778716, 0.8111283, -0.2424416, 1, 1, 1, 1, 1,
0.02780359, 1.78676, -0.4704447, 1, 1, 1, 1, 1,
0.02819182, 2.384461, -2.561848, 1, 1, 1, 1, 1,
0.03145189, -0.284005, 3.444943, 1, 1, 1, 1, 1,
0.0361843, 0.6942441, 3.027005, 1, 1, 1, 1, 1,
0.03645765, -1.052123, 2.271391, 1, 1, 1, 1, 1,
0.03691007, -0.04316945, 4.231062, 1, 1, 1, 1, 1,
0.03825979, 0.1192861, 0.3666766, 1, 1, 1, 1, 1,
0.03902928, -1.317683, 2.581049, 1, 1, 1, 1, 1,
0.03953158, 1.178036, -2.918133, 1, 1, 1, 1, 1,
0.04271455, -1.655232, 2.043863, 1, 1, 1, 1, 1,
0.04286598, 0.111089, -0.9018016, 1, 1, 1, 1, 1,
0.0448015, -0.7168366, 2.522084, 1, 1, 1, 1, 1,
0.04552206, -0.5315522, 2.388148, 1, 1, 1, 1, 1,
0.04552261, 1.765676, -0.2904916, 0, 0, 1, 1, 1,
0.04841025, 1.205356, -0.6623725, 1, 0, 0, 1, 1,
0.04848433, 1.63064, -0.3788277, 1, 0, 0, 1, 1,
0.04870775, 0.5536675, -0.1198878, 1, 0, 0, 1, 1,
0.05031617, -1.237804, 2.267557, 1, 0, 0, 1, 1,
0.05128728, 0.404035, -0.8828532, 1, 0, 0, 1, 1,
0.05277153, -1.147647, 0.4989768, 0, 0, 0, 1, 1,
0.05530657, -0.09072105, 2.874978, 0, 0, 0, 1, 1,
0.05750454, 0.4376495, 0.07207319, 0, 0, 0, 1, 1,
0.06092162, -0.9637449, 3.11029, 0, 0, 0, 1, 1,
0.06557165, 0.8872476, 0.2624429, 0, 0, 0, 1, 1,
0.07210597, -0.6000707, 2.375094, 0, 0, 0, 1, 1,
0.07325853, -0.8195751, 2.621051, 0, 0, 0, 1, 1,
0.07465652, 0.05439957, 1.418155, 1, 1, 1, 1, 1,
0.07815686, 0.6497327, 0.7580534, 1, 1, 1, 1, 1,
0.07885604, 2.075599, 1.649611, 1, 1, 1, 1, 1,
0.08151015, -1.569006, 3.699763, 1, 1, 1, 1, 1,
0.08391303, 0.3445501, 0.5324346, 1, 1, 1, 1, 1,
0.08403559, 0.3967013, 0.3913557, 1, 1, 1, 1, 1,
0.08899536, 0.9153849, 0.0357958, 1, 1, 1, 1, 1,
0.08901247, -0.08254048, 1.424355, 1, 1, 1, 1, 1,
0.09546902, 0.7981318, 3.123186, 1, 1, 1, 1, 1,
0.09859036, 0.2844958, 0.7745467, 1, 1, 1, 1, 1,
0.09937483, 1.426006, 0.9013688, 1, 1, 1, 1, 1,
0.100403, -1.353547, 2.806549, 1, 1, 1, 1, 1,
0.1009377, -0.5513145, 3.552948, 1, 1, 1, 1, 1,
0.1020641, -0.4926976, 3.14556, 1, 1, 1, 1, 1,
0.1099966, -1.089821, 4.723435, 1, 1, 1, 1, 1,
0.1119798, 0.955707, 0.1726805, 0, 0, 1, 1, 1,
0.1145281, 0.1602652, 1.407583, 1, 0, 0, 1, 1,
0.1151808, -1.37924, 2.179107, 1, 0, 0, 1, 1,
0.1157934, -0.4229598, 2.967364, 1, 0, 0, 1, 1,
0.1183235, -1.729485, 1.230697, 1, 0, 0, 1, 1,
0.1200613, -1.159397, 3.932902, 1, 0, 0, 1, 1,
0.1265661, -0.2594427, 4.742527, 0, 0, 0, 1, 1,
0.1267386, 1.389155, -0.5049705, 0, 0, 0, 1, 1,
0.1275874, 2.011864, 2.32022, 0, 0, 0, 1, 1,
0.1280616, 0.7210251, -0.6715749, 0, 0, 0, 1, 1,
0.1285802, 0.9407748, -0.1557853, 0, 0, 0, 1, 1,
0.1299643, -1.58746, 2.780029, 0, 0, 0, 1, 1,
0.1404698, 0.9656892, -0.5637982, 0, 0, 0, 1, 1,
0.14228, -0.5167527, 4.223052, 1, 1, 1, 1, 1,
0.1471958, 0.2234266, 0.2621089, 1, 1, 1, 1, 1,
0.1472414, 1.049682, -1.007989, 1, 1, 1, 1, 1,
0.1481319, 0.1505872, 0.2933227, 1, 1, 1, 1, 1,
0.1549949, 0.1375494, -0.09865174, 1, 1, 1, 1, 1,
0.1597407, -0.7346867, 2.104082, 1, 1, 1, 1, 1,
0.162268, 0.3205942, 0.2419237, 1, 1, 1, 1, 1,
0.1689681, -0.2850866, 0.724324, 1, 1, 1, 1, 1,
0.1716939, -0.5081582, 2.654199, 1, 1, 1, 1, 1,
0.1724127, 1.251938, 2.67919, 1, 1, 1, 1, 1,
0.1725903, 1.148456, -1.439305, 1, 1, 1, 1, 1,
0.1837717, -2.58386, 1.317543, 1, 1, 1, 1, 1,
0.1844369, 1.334888, 0.3021024, 1, 1, 1, 1, 1,
0.185988, -1.589093, 2.919992, 1, 1, 1, 1, 1,
0.1879815, 1.118142, 0.5854416, 1, 1, 1, 1, 1,
0.1896406, -1.587947, 2.212959, 0, 0, 1, 1, 1,
0.1917256, 0.5214735, 0.1783218, 1, 0, 0, 1, 1,
0.1920735, 0.6206881, 1.033457, 1, 0, 0, 1, 1,
0.1944076, -0.037293, 2.624008, 1, 0, 0, 1, 1,
0.1975885, -0.5177452, 2.690581, 1, 0, 0, 1, 1,
0.208261, -0.009532551, 1.911847, 1, 0, 0, 1, 1,
0.214098, -0.1464726, 2.454549, 0, 0, 0, 1, 1,
0.2166204, -0.6440943, 3.506021, 0, 0, 0, 1, 1,
0.2220235, -0.1194768, 2.303861, 0, 0, 0, 1, 1,
0.2222945, -0.7446362, 2.623888, 0, 0, 0, 1, 1,
0.2245628, 0.1381825, 1.312135, 0, 0, 0, 1, 1,
0.2256901, 0.1456239, 2.352043, 0, 0, 0, 1, 1,
0.2265275, -0.3837238, 2.901767, 0, 0, 0, 1, 1,
0.2265685, 2.036356, -0.05472295, 1, 1, 1, 1, 1,
0.2316608, -0.4622076, 2.488439, 1, 1, 1, 1, 1,
0.2340125, 1.323445, 2.534769, 1, 1, 1, 1, 1,
0.2367296, 0.3256579, -1.702411, 1, 1, 1, 1, 1,
0.2379164, -0.7798377, 2.782892, 1, 1, 1, 1, 1,
0.2394006, -0.2698981, 3.198806, 1, 1, 1, 1, 1,
0.2395701, 0.7073531, -0.6374595, 1, 1, 1, 1, 1,
0.2432913, -1.332335, 4.282971, 1, 1, 1, 1, 1,
0.2434903, 1.725898, 0.4903307, 1, 1, 1, 1, 1,
0.2440081, -0.1920275, -0.03200807, 1, 1, 1, 1, 1,
0.2446879, 0.8864887, -0.5990945, 1, 1, 1, 1, 1,
0.2469393, 0.4824954, 1.390232, 1, 1, 1, 1, 1,
0.2477437, 0.4088234, 0.697439, 1, 1, 1, 1, 1,
0.2494459, 0.1684584, 0.1520816, 1, 1, 1, 1, 1,
0.2495589, 0.2915285, 1.679885, 1, 1, 1, 1, 1,
0.2538193, 0.5490016, 1.504028, 0, 0, 1, 1, 1,
0.2540914, -0.7520887, 0.8549321, 1, 0, 0, 1, 1,
0.2543136, -0.8269318, 1.594726, 1, 0, 0, 1, 1,
0.2556243, -1.211436, 0.2804896, 1, 0, 0, 1, 1,
0.2558621, -1.286029, 3.381776, 1, 0, 0, 1, 1,
0.2570467, 1.382667, -0.212927, 1, 0, 0, 1, 1,
0.2629467, -0.3670443, 3.173581, 0, 0, 0, 1, 1,
0.2671664, 0.4396029, 1.107321, 0, 0, 0, 1, 1,
0.2675519, -0.4846341, 1.429863, 0, 0, 0, 1, 1,
0.2680262, -0.6330743, 2.598435, 0, 0, 0, 1, 1,
0.2725003, 0.5474448, 0.9738501, 0, 0, 0, 1, 1,
0.2785918, -0.1135233, 4.099975, 0, 0, 0, 1, 1,
0.2809666, 0.4414609, 2.196505, 0, 0, 0, 1, 1,
0.2901251, 0.9012612, 0.3586261, 1, 1, 1, 1, 1,
0.2941268, 0.01020087, 2.249692, 1, 1, 1, 1, 1,
0.2972531, -1.06247, 3.77608, 1, 1, 1, 1, 1,
0.2983651, 0.7750877, 1.174726, 1, 1, 1, 1, 1,
0.3013961, -1.955921, 3.395719, 1, 1, 1, 1, 1,
0.3024768, 2.100316, 0.7958734, 1, 1, 1, 1, 1,
0.3040676, -0.5018015, 2.29529, 1, 1, 1, 1, 1,
0.3047374, -0.6255933, 4.515133, 1, 1, 1, 1, 1,
0.3078858, -0.1024897, 5.065687, 1, 1, 1, 1, 1,
0.3099169, 0.4329381, 0.570466, 1, 1, 1, 1, 1,
0.313156, 1.012746, 3.389396, 1, 1, 1, 1, 1,
0.3132213, 0.2418855, 1.599011, 1, 1, 1, 1, 1,
0.313311, 0.7572379, -0.03148363, 1, 1, 1, 1, 1,
0.3137522, 0.390143, -0.4653867, 1, 1, 1, 1, 1,
0.3148557, -0.2700246, 2.448214, 1, 1, 1, 1, 1,
0.3184309, -1.252333, 2.073479, 0, 0, 1, 1, 1,
0.318834, 2.406922, 2.153332, 1, 0, 0, 1, 1,
0.3216788, 0.2041375, 0.8203201, 1, 0, 0, 1, 1,
0.3222941, 0.9262487, 0.4641566, 1, 0, 0, 1, 1,
0.3297969, 1.189659, 0.8802682, 1, 0, 0, 1, 1,
0.3307641, 0.4335636, -0.4752944, 1, 0, 0, 1, 1,
0.3364689, 1.572633, 1.607333, 0, 0, 0, 1, 1,
0.3393028, -0.468414, 1.075796, 0, 0, 0, 1, 1,
0.3426445, 2.260647, -0.5215596, 0, 0, 0, 1, 1,
0.3464744, -1.744459, 2.571832, 0, 0, 0, 1, 1,
0.3475009, -0.2976232, 2.787534, 0, 0, 0, 1, 1,
0.3476506, 0.3755985, 1.538968, 0, 0, 0, 1, 1,
0.3500793, -1.235507, 3.249891, 0, 0, 0, 1, 1,
0.350539, 0.3325573, 0.3187748, 1, 1, 1, 1, 1,
0.3507015, -0.0895844, 1.283308, 1, 1, 1, 1, 1,
0.3520024, 1.112779, 0.100393, 1, 1, 1, 1, 1,
0.35236, 0.6184363, -0.4829032, 1, 1, 1, 1, 1,
0.3594818, 0.6471185, 0.500874, 1, 1, 1, 1, 1,
0.3596205, 0.5406184, 0.5763357, 1, 1, 1, 1, 1,
0.3600091, -1.382747, 3.898891, 1, 1, 1, 1, 1,
0.3607712, -0.7954147, 1.362719, 1, 1, 1, 1, 1,
0.3619714, -1.05744, 3.368526, 1, 1, 1, 1, 1,
0.3623762, 0.1320502, -0.5711855, 1, 1, 1, 1, 1,
0.3637062, -0.09906409, 1.423326, 1, 1, 1, 1, 1,
0.3648065, 2.15277, 0.7659307, 1, 1, 1, 1, 1,
0.3653121, 0.6368244, -0.2208847, 1, 1, 1, 1, 1,
0.3657508, 0.09122515, 2.928504, 1, 1, 1, 1, 1,
0.3660872, 0.638702, -0.65708, 1, 1, 1, 1, 1,
0.3677284, 0.2188491, 3.16169, 0, 0, 1, 1, 1,
0.3765288, 0.4333827, 0.3958739, 1, 0, 0, 1, 1,
0.3817919, -0.7016098, 3.172194, 1, 0, 0, 1, 1,
0.383061, 0.9092602, -1.043515, 1, 0, 0, 1, 1,
0.3862826, -1.160704, 3.477402, 1, 0, 0, 1, 1,
0.3891268, -1.364784, 3.713576, 1, 0, 0, 1, 1,
0.397619, -1.991407, 2.283655, 0, 0, 0, 1, 1,
0.4000944, 0.7836579, 0.4055721, 0, 0, 0, 1, 1,
0.4007691, -1.19683, 4.51528, 0, 0, 0, 1, 1,
0.4056312, -0.8013616, 2.762418, 0, 0, 0, 1, 1,
0.4095183, 0.2271422, 3.783952, 0, 0, 0, 1, 1,
0.4105071, -1.82491, 2.493884, 0, 0, 0, 1, 1,
0.412738, -0.4625062, 3.979211, 0, 0, 0, 1, 1,
0.4133922, 0.4671753, 0.8217267, 1, 1, 1, 1, 1,
0.4183777, -0.2119324, 0.5588759, 1, 1, 1, 1, 1,
0.4183863, -1.304779, 3.202454, 1, 1, 1, 1, 1,
0.4196175, -1.059851, 3.218604, 1, 1, 1, 1, 1,
0.4210386, -0.8693764, 0.04804248, 1, 1, 1, 1, 1,
0.4210815, -1.048601, 5.236951, 1, 1, 1, 1, 1,
0.4256156, -0.3861904, 3.202043, 1, 1, 1, 1, 1,
0.4263905, 0.9254684, -0.6415209, 1, 1, 1, 1, 1,
0.427141, 0.7601951, 1.589421, 1, 1, 1, 1, 1,
0.4283372, -1.748176, 3.212506, 1, 1, 1, 1, 1,
0.4289754, 0.2331599, 1.17696, 1, 1, 1, 1, 1,
0.4324895, 0.35673, 2.055949, 1, 1, 1, 1, 1,
0.4334079, -0.242573, 3.498893, 1, 1, 1, 1, 1,
0.4339745, -1.453568, 3.301233, 1, 1, 1, 1, 1,
0.4344944, 0.1478554, 1.461643, 1, 1, 1, 1, 1,
0.4357646, 0.5485504, -0.1599483, 0, 0, 1, 1, 1,
0.437865, 2.222816, -1.287056, 1, 0, 0, 1, 1,
0.4406005, 1.570341, -0.8166166, 1, 0, 0, 1, 1,
0.4409579, -0.07617006, 2.050738, 1, 0, 0, 1, 1,
0.4444467, -0.2390018, -1.142534, 1, 0, 0, 1, 1,
0.4606699, -0.4650408, 2.399335, 1, 0, 0, 1, 1,
0.4611219, 0.5079536, 1.698166, 0, 0, 0, 1, 1,
0.4661943, 1.330257, -0.6234048, 0, 0, 0, 1, 1,
0.4698003, 0.8352816, 0.1076256, 0, 0, 0, 1, 1,
0.4699034, 0.9127485, 0.3354882, 0, 0, 0, 1, 1,
0.4768831, 0.1165104, 0.3495072, 0, 0, 0, 1, 1,
0.4835904, -1.189655, 2.684654, 0, 0, 0, 1, 1,
0.4904261, -0.01833982, 0.4077311, 0, 0, 0, 1, 1,
0.4926168, 0.447065, -0.03993224, 1, 1, 1, 1, 1,
0.4929974, -0.2083015, 2.582334, 1, 1, 1, 1, 1,
0.4953532, 0.9288527, 1.999492, 1, 1, 1, 1, 1,
0.4956796, -0.2360752, 1.852138, 1, 1, 1, 1, 1,
0.4998964, -0.07528872, 1.461279, 1, 1, 1, 1, 1,
0.500461, -0.03003732, 1.491051, 1, 1, 1, 1, 1,
0.5014101, 0.01505982, 1.872719, 1, 1, 1, 1, 1,
0.5037585, -1.097835, 3.752594, 1, 1, 1, 1, 1,
0.5053675, 0.41168, 1.291706, 1, 1, 1, 1, 1,
0.5089185, 1.969, -0.5670962, 1, 1, 1, 1, 1,
0.5122093, -0.5757069, 2.570177, 1, 1, 1, 1, 1,
0.5127497, -0.3572759, 2.571744, 1, 1, 1, 1, 1,
0.5131488, 0.1716357, 0.8668343, 1, 1, 1, 1, 1,
0.5161934, -2.162871, 2.423908, 1, 1, 1, 1, 1,
0.5284757, -0.3618215, 1.561711, 1, 1, 1, 1, 1,
0.5321254, -0.5368654, 3.124341, 0, 0, 1, 1, 1,
0.5335906, 0.630017, 2.316177, 1, 0, 0, 1, 1,
0.5361116, -0.8382692, 3.274249, 1, 0, 0, 1, 1,
0.536225, -1.118919, 2.148255, 1, 0, 0, 1, 1,
0.538857, 0.4588619, 0.7387009, 1, 0, 0, 1, 1,
0.5403088, -0.01407947, 2.594595, 1, 0, 0, 1, 1,
0.5404521, -0.4312734, 2.233559, 0, 0, 0, 1, 1,
0.5409247, -0.7655088, 2.767893, 0, 0, 0, 1, 1,
0.5443225, 0.3564719, 0.2434597, 0, 0, 0, 1, 1,
0.5505241, 0.2815907, 0.9452335, 0, 0, 0, 1, 1,
0.5556001, -0.2413054, 1.943966, 0, 0, 0, 1, 1,
0.558333, -1.060802, 2.217122, 0, 0, 0, 1, 1,
0.5586763, 0.04678648, 1.681306, 0, 0, 0, 1, 1,
0.5606179, -1.423107, 1.989849, 1, 1, 1, 1, 1,
0.5607144, -2.594983, 3.172294, 1, 1, 1, 1, 1,
0.5634533, -0.6361223, 2.176865, 1, 1, 1, 1, 1,
0.5660566, -0.05925253, 0.3766589, 1, 1, 1, 1, 1,
0.5685427, 0.8283614, 0.6201943, 1, 1, 1, 1, 1,
0.5756966, -0.5257844, 4.227895, 1, 1, 1, 1, 1,
0.5802336, -0.5923204, 2.727627, 1, 1, 1, 1, 1,
0.5815594, 0.3469308, 0.6217435, 1, 1, 1, 1, 1,
0.582373, -2.547832, 2.072566, 1, 1, 1, 1, 1,
0.5830517, 0.6641095, 0.7107374, 1, 1, 1, 1, 1,
0.5842535, 1.807851, -1.051833, 1, 1, 1, 1, 1,
0.5884236, -0.9836386, 3.378495, 1, 1, 1, 1, 1,
0.5941018, 1.10271, -0.09662264, 1, 1, 1, 1, 1,
0.5956836, -0.4233615, 1.270639, 1, 1, 1, 1, 1,
0.5990792, -0.8339676, 0.2117656, 1, 1, 1, 1, 1,
0.5993479, -0.6786811, 3.174902, 0, 0, 1, 1, 1,
0.6002271, -0.7503178, 4.717077, 1, 0, 0, 1, 1,
0.6064342, -0.6753101, 1.306982, 1, 0, 0, 1, 1,
0.6098096, -0.5489614, 2.719227, 1, 0, 0, 1, 1,
0.6120709, -0.1546019, 0.849034, 1, 0, 0, 1, 1,
0.6130676, -1.138825, 3.291244, 1, 0, 0, 1, 1,
0.6142513, 0.2095874, 0.7548292, 0, 0, 0, 1, 1,
0.6192753, 1.602553, 1.619587, 0, 0, 0, 1, 1,
0.623796, -0.7630035, 2.055138, 0, 0, 0, 1, 1,
0.625838, 0.8363867, 0.8620192, 0, 0, 0, 1, 1,
0.6271775, -2.45325, 3.248612, 0, 0, 0, 1, 1,
0.6297842, 0.717196, 0.8625154, 0, 0, 0, 1, 1,
0.6373021, 1.147913, 0.1060708, 0, 0, 0, 1, 1,
0.6429852, -0.001753045, 1.759135, 1, 1, 1, 1, 1,
0.6477183, -1.819386, 3.043887, 1, 1, 1, 1, 1,
0.6482028, -0.1575753, 1.883384, 1, 1, 1, 1, 1,
0.6555975, -1.443693, 3.871088, 1, 1, 1, 1, 1,
0.6584784, -1.87507, 3.954494, 1, 1, 1, 1, 1,
0.6627824, 1.353866, 1.338381, 1, 1, 1, 1, 1,
0.6684535, -1.007888, 2.499123, 1, 1, 1, 1, 1,
0.6707059, 0.247554, 0.6736612, 1, 1, 1, 1, 1,
0.6712628, 0.6047623, 0.88938, 1, 1, 1, 1, 1,
0.6715646, -1.237081, 3.371123, 1, 1, 1, 1, 1,
0.6786405, -0.5051382, 1.253999, 1, 1, 1, 1, 1,
0.6788288, -0.6486415, 2.604691, 1, 1, 1, 1, 1,
0.682776, 0.3098179, 1.131192, 1, 1, 1, 1, 1,
0.6869485, -1.788204, 2.293307, 1, 1, 1, 1, 1,
0.6875515, 0.1195342, 1.251052, 1, 1, 1, 1, 1,
0.6885849, 1.314173, 0.6628138, 0, 0, 1, 1, 1,
0.6909239, 1.680826, 0.866291, 1, 0, 0, 1, 1,
0.6919707, 1.935938, -0.8934026, 1, 0, 0, 1, 1,
0.694079, 0.7968265, 0.7825114, 1, 0, 0, 1, 1,
0.6999109, -0.3317644, 1.306842, 1, 0, 0, 1, 1,
0.7046816, 0.2030909, 2.876269, 1, 0, 0, 1, 1,
0.709521, -0.05894268, 3.180464, 0, 0, 0, 1, 1,
0.7154678, 0.5304528, 2.401151, 0, 0, 0, 1, 1,
0.7214603, -0.8821645, 3.185335, 0, 0, 0, 1, 1,
0.7269287, 0.4016857, 1.75995, 0, 0, 0, 1, 1,
0.7284772, 0.4404371, -0.8082805, 0, 0, 0, 1, 1,
0.7336161, 1.683811, 0.8857828, 0, 0, 0, 1, 1,
0.7351227, -1.835662, 5.180639, 0, 0, 0, 1, 1,
0.7383302, 1.957641, -0.3249508, 1, 1, 1, 1, 1,
0.7435433, -2.180071, 3.924284, 1, 1, 1, 1, 1,
0.7473297, -0.5489639, 3.518161, 1, 1, 1, 1, 1,
0.7533426, 0.6388464, -0.5571595, 1, 1, 1, 1, 1,
0.7539567, -0.8939679, 1.585215, 1, 1, 1, 1, 1,
0.7552164, -1.532863, 1.491744, 1, 1, 1, 1, 1,
0.7584817, -1.835656, 2.974169, 1, 1, 1, 1, 1,
0.7609386, 0.380924, 1.709068, 1, 1, 1, 1, 1,
0.7668336, 2.448905, 0.8615797, 1, 1, 1, 1, 1,
0.7671908, -0.4097646, 1.813854, 1, 1, 1, 1, 1,
0.7682006, 1.036708, 1.415079, 1, 1, 1, 1, 1,
0.7752538, -0.05358884, 2.490599, 1, 1, 1, 1, 1,
0.7808961, -2.450659, 2.635183, 1, 1, 1, 1, 1,
0.7826236, 0.4221063, 1.18547, 1, 1, 1, 1, 1,
0.7935581, 0.06437349, 1.570712, 1, 1, 1, 1, 1,
0.7978573, -0.002801707, 0.9671977, 0, 0, 1, 1, 1,
0.8030485, 0.1233587, 3.188086, 1, 0, 0, 1, 1,
0.80542, 0.5455415, 2.178612, 1, 0, 0, 1, 1,
0.8098841, 0.8497188, 1.094773, 1, 0, 0, 1, 1,
0.8106372, 0.8652569, 0.5004398, 1, 0, 0, 1, 1,
0.8136341, 0.6354085, 0.9978865, 1, 0, 0, 1, 1,
0.8142541, 1.40807, 0.8100656, 0, 0, 0, 1, 1,
0.8174793, -0.3850594, 2.702844, 0, 0, 0, 1, 1,
0.8177146, 1.475503, -1.447276, 0, 0, 0, 1, 1,
0.8179592, 0.3289316, 1.68266, 0, 0, 0, 1, 1,
0.8205281, 0.4741187, 0.2226186, 0, 0, 0, 1, 1,
0.8214234, 0.2033202, -0.2457154, 0, 0, 0, 1, 1,
0.8260685, 0.2242701, 0.4464213, 0, 0, 0, 1, 1,
0.8335429, -0.6787549, 1.483299, 1, 1, 1, 1, 1,
0.8497872, -1.053262, 3.603447, 1, 1, 1, 1, 1,
0.8506491, -0.1944974, 2.929536, 1, 1, 1, 1, 1,
0.8525617, 0.6551292, 1.128895, 1, 1, 1, 1, 1,
0.8566522, 1.839409, 1.072704, 1, 1, 1, 1, 1,
0.8584713, 1.081718, 0.1163932, 1, 1, 1, 1, 1,
0.8588311, -0.1002937, 1.783093, 1, 1, 1, 1, 1,
0.8715259, -0.6080784, 4.202097, 1, 1, 1, 1, 1,
0.8722296, 0.8176795, 1.437256, 1, 1, 1, 1, 1,
0.8723097, 0.9478574, -0.3417281, 1, 1, 1, 1, 1,
0.8783354, -0.6887448, 2.478674, 1, 1, 1, 1, 1,
0.8813325, 0.9311724, -0.448664, 1, 1, 1, 1, 1,
0.8822138, 0.9255037, -0.03703682, 1, 1, 1, 1, 1,
0.8858173, 2.019562, -0.06294563, 1, 1, 1, 1, 1,
0.8918591, 0.585192, 2.43716, 1, 1, 1, 1, 1,
0.8939654, -0.5521402, 2.022363, 0, 0, 1, 1, 1,
0.8973106, -0.6771188, 2.981453, 1, 0, 0, 1, 1,
0.9011804, -0.0327342, 0.1750349, 1, 0, 0, 1, 1,
0.9031531, -0.01663263, 0.1114131, 1, 0, 0, 1, 1,
0.9059625, 1.323722, 0.592451, 1, 0, 0, 1, 1,
0.9061546, -1.047646, 4.35683, 1, 0, 0, 1, 1,
0.9148501, -0.353967, 2.657054, 0, 0, 0, 1, 1,
0.9266374, -1.834137, 3.659705, 0, 0, 0, 1, 1,
0.9284292, -0.59349, 1.364656, 0, 0, 0, 1, 1,
0.9293526, 0.7379611, 1.288477, 0, 0, 0, 1, 1,
0.9301544, 1.581288, 0.440531, 0, 0, 0, 1, 1,
0.930674, -0.1973143, 0.1256616, 0, 0, 0, 1, 1,
0.9409134, 0.1632915, 1.349195, 0, 0, 0, 1, 1,
0.9417619, 0.1385488, 1.780188, 1, 1, 1, 1, 1,
0.9432792, -0.3402723, 1.197992, 1, 1, 1, 1, 1,
0.9436286, -1.478812, 2.131223, 1, 1, 1, 1, 1,
0.9473501, 1.059642, 1.430941, 1, 1, 1, 1, 1,
0.9520684, 0.3292505, 1.741304, 1, 1, 1, 1, 1,
0.9525304, -0.09332854, 0.3418878, 1, 1, 1, 1, 1,
0.9573839, 0.3453712, 1.846725, 1, 1, 1, 1, 1,
0.957821, 1.38005, -0.2976003, 1, 1, 1, 1, 1,
0.9631991, 0.6623892, 1.187994, 1, 1, 1, 1, 1,
0.970902, -1.315118, 2.459829, 1, 1, 1, 1, 1,
0.9719444, 0.8176063, 1.193135, 1, 1, 1, 1, 1,
0.9719782, -2.254154, 1.255672, 1, 1, 1, 1, 1,
0.9755946, -0.6878619, 2.833818, 1, 1, 1, 1, 1,
0.9783673, -0.5426196, 2.742939, 1, 1, 1, 1, 1,
0.9903755, 0.3123861, -0.2103798, 1, 1, 1, 1, 1,
0.9954352, 0.6782473, -1.09709, 0, 0, 1, 1, 1,
0.9984405, 1.609427, -0.7898818, 1, 0, 0, 1, 1,
0.9995476, 0.1998566, 1.534762, 1, 0, 0, 1, 1,
1.001854, 0.8422294, 0.4286902, 1, 0, 0, 1, 1,
1.002388, -0.9766222, 2.442028, 1, 0, 0, 1, 1,
1.003064, 0.6194852, 0.8484735, 1, 0, 0, 1, 1,
1.008674, 0.5207868, 1.561943, 0, 0, 0, 1, 1,
1.011914, -0.2743956, 2.819583, 0, 0, 0, 1, 1,
1.01691, 2.062097, 0.3882242, 0, 0, 0, 1, 1,
1.021908, 0.249676, 3.380379, 0, 0, 0, 1, 1,
1.02205, -0.7418206, 0.5107985, 0, 0, 0, 1, 1,
1.026055, -0.3530863, 3.029698, 0, 0, 0, 1, 1,
1.04672, 1.38595, -0.9917014, 0, 0, 0, 1, 1,
1.047744, -0.6307409, 2.074043, 1, 1, 1, 1, 1,
1.050107, -1.650157, 1.640817, 1, 1, 1, 1, 1,
1.05267, 0.8036227, 1.230444, 1, 1, 1, 1, 1,
1.053631, -0.4274563, 3.276687, 1, 1, 1, 1, 1,
1.05407, -0.3330509, 3.549769, 1, 1, 1, 1, 1,
1.054378, 0.9010469, -0.02570218, 1, 1, 1, 1, 1,
1.056053, 1.345256, 0.5438863, 1, 1, 1, 1, 1,
1.060198, -1.784704, 2.906722, 1, 1, 1, 1, 1,
1.061417, -0.5572242, 2.393495, 1, 1, 1, 1, 1,
1.062291, -0.002030696, 2.814907, 1, 1, 1, 1, 1,
1.062582, -0.4167659, 1.883284, 1, 1, 1, 1, 1,
1.06394, -0.4047883, 0.5900028, 1, 1, 1, 1, 1,
1.066548, -0.5842506, 1.517539, 1, 1, 1, 1, 1,
1.069606, 1.572822, -0.001071718, 1, 1, 1, 1, 1,
1.079863, -0.1743134, 0.9584141, 1, 1, 1, 1, 1,
1.080712, -1.362744, 2.64153, 0, 0, 1, 1, 1,
1.087855, -2.024455, 1.093699, 1, 0, 0, 1, 1,
1.093695, -0.2000547, 2.082392, 1, 0, 0, 1, 1,
1.095833, 1.291154, 2.258227, 1, 0, 0, 1, 1,
1.09672, 1.288565, 1.250989, 1, 0, 0, 1, 1,
1.101213, 2.032499, 0.6419219, 1, 0, 0, 1, 1,
1.102891, -0.1521662, 1.302736, 0, 0, 0, 1, 1,
1.106944, 1.482775, 0.839108, 0, 0, 0, 1, 1,
1.110564, -0.609119, 2.563118, 0, 0, 0, 1, 1,
1.111606, -0.6525925, 1.704797, 0, 0, 0, 1, 1,
1.112202, -1.224772, 2.209448, 0, 0, 0, 1, 1,
1.114956, 0.3787684, 0.5381012, 0, 0, 0, 1, 1,
1.118093, 0.36212, 0.7695594, 0, 0, 0, 1, 1,
1.122615, -1.404515, 2.131319, 1, 1, 1, 1, 1,
1.124896, 0.5772212, 2.904293, 1, 1, 1, 1, 1,
1.130542, 0.3063774, 0.6190557, 1, 1, 1, 1, 1,
1.134193, 0.7471704, 1.161641, 1, 1, 1, 1, 1,
1.137537, 0.3596997, 1.812693, 1, 1, 1, 1, 1,
1.160086, 0.8293256, 0.437102, 1, 1, 1, 1, 1,
1.162448, 0.1197743, 2.036741, 1, 1, 1, 1, 1,
1.165468, -0.3763869, 2.478156, 1, 1, 1, 1, 1,
1.168032, 1.181998, 1.747923, 1, 1, 1, 1, 1,
1.173701, -0.559851, 2.250354, 1, 1, 1, 1, 1,
1.174595, -0.2771677, 2.374646, 1, 1, 1, 1, 1,
1.183545, -0.7961253, 0.8901502, 1, 1, 1, 1, 1,
1.189699, -0.9762487, 3.12061, 1, 1, 1, 1, 1,
1.194041, -0.4795285, 3.122324, 1, 1, 1, 1, 1,
1.196319, -1.370028, 0.7168387, 1, 1, 1, 1, 1,
1.198467, -0.3720402, 0.733093, 0, 0, 1, 1, 1,
1.198719, -0.1864769, -1.012917, 1, 0, 0, 1, 1,
1.201545, -0.3192911, 1.258274, 1, 0, 0, 1, 1,
1.208301, -0.9160221, 1.113191, 1, 0, 0, 1, 1,
1.211297, -0.6376913, 2.000523, 1, 0, 0, 1, 1,
1.214236, 0.9239162, 1.625282, 1, 0, 0, 1, 1,
1.218269, -1.023354, 4.68388, 0, 0, 0, 1, 1,
1.21905, 0.4394614, 0.8502637, 0, 0, 0, 1, 1,
1.235801, 0.6061935, 1.075667, 0, 0, 0, 1, 1,
1.245025, 1.631447, 0.2572427, 0, 0, 0, 1, 1,
1.252242, 0.361651, -1.413309, 0, 0, 0, 1, 1,
1.25372, 0.30648, 1.725233, 0, 0, 0, 1, 1,
1.274972, 1.265921, 1.45056, 0, 0, 0, 1, 1,
1.278037, -0.8809518, 1.360264, 1, 1, 1, 1, 1,
1.280025, 1.081232, 0.4694487, 1, 1, 1, 1, 1,
1.284597, 0.9139488, 3.437629, 1, 1, 1, 1, 1,
1.292309, -0.1019532, 3.345223, 1, 1, 1, 1, 1,
1.295952, 0.4464964, 1.260561, 1, 1, 1, 1, 1,
1.30613, 1.173187, 2.010394, 1, 1, 1, 1, 1,
1.31553, 0.6307192, -0.09215579, 1, 1, 1, 1, 1,
1.331053, -4.087045, 2.305587, 1, 1, 1, 1, 1,
1.337743, -0.9150933, 2.015954, 1, 1, 1, 1, 1,
1.345178, -1.748869, 4.059781, 1, 1, 1, 1, 1,
1.349046, 0.04687662, -0.4418167, 1, 1, 1, 1, 1,
1.358325, -0.9394828, 1.231362, 1, 1, 1, 1, 1,
1.370416, -0.2490302, 2.06833, 1, 1, 1, 1, 1,
1.371401, 0.2686856, 1.107746, 1, 1, 1, 1, 1,
1.372355, -1.529266, 1.702421, 1, 1, 1, 1, 1,
1.374621, 1.094912, 2.437432, 0, 0, 1, 1, 1,
1.393682, 0.2225448, 2.326095, 1, 0, 0, 1, 1,
1.400159, 0.3352642, 2.169507, 1, 0, 0, 1, 1,
1.408413, 1.729615, 1.049956, 1, 0, 0, 1, 1,
1.424177, 0.6177105, 0.6386655, 1, 0, 0, 1, 1,
1.434289, -1.079696, 4.281236, 1, 0, 0, 1, 1,
1.446865, 1.736003, 1.506066, 0, 0, 0, 1, 1,
1.447785, 0.8725044, 1.157527, 0, 0, 0, 1, 1,
1.447995, 0.2047887, 0.8148842, 0, 0, 0, 1, 1,
1.448635, -0.4762527, 0.4031047, 0, 0, 0, 1, 1,
1.448654, 0.1433129, 0.04022683, 0, 0, 0, 1, 1,
1.476162, 0.5603066, 2.048723, 0, 0, 0, 1, 1,
1.485221, -1.103375, 1.775582, 0, 0, 0, 1, 1,
1.495883, 0.1624912, 1.679221, 1, 1, 1, 1, 1,
1.499984, 1.711394, -0.8422722, 1, 1, 1, 1, 1,
1.500162, -0.3604773, 1.338115, 1, 1, 1, 1, 1,
1.501526, 0.1386315, 1.434651, 1, 1, 1, 1, 1,
1.506278, 0.5140316, 0.4201495, 1, 1, 1, 1, 1,
1.531366, 0.2097989, 0.7314739, 1, 1, 1, 1, 1,
1.55136, -1.858324, 2.432477, 1, 1, 1, 1, 1,
1.567941, 0.5376588, -0.2876244, 1, 1, 1, 1, 1,
1.585615, 1.637081, 0.8442996, 1, 1, 1, 1, 1,
1.594484, 1.203606, 0.05147131, 1, 1, 1, 1, 1,
1.596665, -1.401541, 1.588778, 1, 1, 1, 1, 1,
1.605374, -1.909005, 0.5186049, 1, 1, 1, 1, 1,
1.608806, 0.448047, 1.712212, 1, 1, 1, 1, 1,
1.632622, -0.830896, 1.607591, 1, 1, 1, 1, 1,
1.641754, -0.716104, 2.186695, 1, 1, 1, 1, 1,
1.652269, -2.248765, 3.600926, 0, 0, 1, 1, 1,
1.659914, -0.3290902, 1.475407, 1, 0, 0, 1, 1,
1.669821, -0.1194473, 1.601322, 1, 0, 0, 1, 1,
1.70963, -0.1754717, 1.840803, 1, 0, 0, 1, 1,
1.718786, 0.03012797, 0.7820079, 1, 0, 0, 1, 1,
1.719186, 0.5123089, 0.4607553, 1, 0, 0, 1, 1,
1.725074, 2.986654, 3.22942, 0, 0, 0, 1, 1,
1.730467, 0.9832937, 1.299036, 0, 0, 0, 1, 1,
1.739594, 1.07295, 3.056879, 0, 0, 0, 1, 1,
1.746822, -0.8595831, 2.963641, 0, 0, 0, 1, 1,
1.769173, -0.6582336, 1.05018, 0, 0, 0, 1, 1,
1.776483, 1.184879, 0.454326, 0, 0, 0, 1, 1,
1.780761, 0.72609, 2.273339, 0, 0, 0, 1, 1,
1.791441, -0.1495416, -0.1514039, 1, 1, 1, 1, 1,
1.806989, 0.8774502, 1.813734, 1, 1, 1, 1, 1,
1.80843, 1.805865, 0.3231877, 1, 1, 1, 1, 1,
1.827181, -0.007680385, 0.4500513, 1, 1, 1, 1, 1,
1.840708, 0.4415989, 0.1061983, 1, 1, 1, 1, 1,
1.844784, 1.066138, 1.609793, 1, 1, 1, 1, 1,
1.853682, -0.5922647, 0.9265949, 1, 1, 1, 1, 1,
1.855736, 0.3300886, 2.423639, 1, 1, 1, 1, 1,
1.85746, 0.4287694, 0.8031417, 1, 1, 1, 1, 1,
1.86772, -0.4727297, 3.5579, 1, 1, 1, 1, 1,
1.875432, 1.021655, 1.406193, 1, 1, 1, 1, 1,
1.914874, 0.9775212, 2.196447, 1, 1, 1, 1, 1,
1.926245, -2.653854, 1.319085, 1, 1, 1, 1, 1,
1.953722, 0.01118166, 1.141563, 1, 1, 1, 1, 1,
1.960763, 0.4632017, 1.794794, 1, 1, 1, 1, 1,
1.969164, 0.256085, 1.870506, 0, 0, 1, 1, 1,
1.982976, -0.6261296, 1.248311, 1, 0, 0, 1, 1,
2.023446, 0.03756922, 1.442127, 1, 0, 0, 1, 1,
2.070085, 0.3415757, 1.11516, 1, 0, 0, 1, 1,
2.079216, -1.52085, 3.152082, 1, 0, 0, 1, 1,
2.079723, -0.314164, 3.176148, 1, 0, 0, 1, 1,
2.080575, 0.06977308, 1.261218, 0, 0, 0, 1, 1,
2.194539, 1.488547, 1.563879, 0, 0, 0, 1, 1,
2.235246, -1.902092, 2.271864, 0, 0, 0, 1, 1,
2.23786, 1.74056, 1.576568, 0, 0, 0, 1, 1,
2.354215, 1.064448, 1.668336, 0, 0, 0, 1, 1,
2.36948, 1.593152, 1.128654, 0, 0, 0, 1, 1,
2.37078, 0.6794621, 2.385684, 0, 0, 0, 1, 1,
2.405748, 0.2485279, 1.939428, 1, 1, 1, 1, 1,
2.57447, 0.1894738, 0.2262477, 1, 1, 1, 1, 1,
2.650882, 0.7802308, 1.880851, 1, 1, 1, 1, 1,
2.688591, 0.3823476, 2.317373, 1, 1, 1, 1, 1,
2.745132, -0.1197435, 0.8990721, 1, 1, 1, 1, 1,
2.881998, 0.6609277, 0.6905108, 1, 1, 1, 1, 1,
2.968207, 1.821073, 1.301469, 1, 1, 1, 1, 1
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
var radius = 9.983762;
var distance = 35.06754;
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
mvMatrix.translate( 0.3404088, 0.5501953, 0.3379462 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.06754);
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
