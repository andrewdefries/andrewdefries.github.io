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
-3.282451, -1.736679, -2.973669, 1, 0, 0, 1,
-3.120289, 1.490036, -1.265924, 1, 0.007843138, 0, 1,
-3.044872, 1.627262, 0.1555285, 1, 0.01176471, 0, 1,
-2.730017, 1.309652, -1.007468, 1, 0.01960784, 0, 1,
-2.715866, 0.6754622, -2.82526, 1, 0.02352941, 0, 1,
-2.629871, 0.1713817, -1.888251, 1, 0.03137255, 0, 1,
-2.531554, -1.256116, -1.168803, 1, 0.03529412, 0, 1,
-2.509614, 0.7454472, -2.363909, 1, 0.04313726, 0, 1,
-2.488753, 1.419378, -1.679062, 1, 0.04705882, 0, 1,
-2.370802, 0.1370641, -2.912888, 1, 0.05490196, 0, 1,
-2.211531, 3.086099, -0.4502498, 1, 0.05882353, 0, 1,
-2.185543, -0.02804064, -2.199006, 1, 0.06666667, 0, 1,
-2.182748, -0.8468118, -2.588105, 1, 0.07058824, 0, 1,
-2.157669, 0.1867271, 2.119911, 1, 0.07843138, 0, 1,
-2.153844, 1.585021, -0.2378842, 1, 0.08235294, 0, 1,
-2.135442, -0.780341, -2.505625, 1, 0.09019608, 0, 1,
-2.11711, -0.3815765, -0.8181168, 1, 0.09411765, 0, 1,
-2.095178, 0.5407608, -2.128783, 1, 0.1019608, 0, 1,
-2.057525, 0.0153034, 0.9650198, 1, 0.1098039, 0, 1,
-2.051534, -1.995523, -2.811419, 1, 0.1137255, 0, 1,
-2.02829, -0.6271013, -1.590354, 1, 0.1215686, 0, 1,
-2.015347, -0.6315126, -1.019914, 1, 0.1254902, 0, 1,
-2.012242, 2.063665, -1.324442, 1, 0.1333333, 0, 1,
-2.004647, -0.2631952, -1.657676, 1, 0.1372549, 0, 1,
-1.996806, -0.3214188, -1.093364, 1, 0.145098, 0, 1,
-1.982336, -0.679206, -3.034847, 1, 0.1490196, 0, 1,
-1.979738, -1.484488, -3.344649, 1, 0.1568628, 0, 1,
-1.979154, 0.7154346, 0.1250722, 1, 0.1607843, 0, 1,
-1.96899, -0.2087168, -0.6730887, 1, 0.1686275, 0, 1,
-1.962977, 0.3392254, -1.194937, 1, 0.172549, 0, 1,
-1.950716, 1.467187, -1.338264, 1, 0.1803922, 0, 1,
-1.935708, 0.8496869, -1.4147, 1, 0.1843137, 0, 1,
-1.92466, -1.191753, 0.2944, 1, 0.1921569, 0, 1,
-1.895184, -0.775535, -1.87937, 1, 0.1960784, 0, 1,
-1.892367, -1.83097, -1.325809, 1, 0.2039216, 0, 1,
-1.878774, 1.254937, 1.070016, 1, 0.2117647, 0, 1,
-1.834148, -0.6517454, -3.43324, 1, 0.2156863, 0, 1,
-1.831633, -2.281257, -2.399713, 1, 0.2235294, 0, 1,
-1.806267, -0.007204081, -0.7236206, 1, 0.227451, 0, 1,
-1.759294, -0.959746, -1.680888, 1, 0.2352941, 0, 1,
-1.741179, -0.1402216, -2.322868, 1, 0.2392157, 0, 1,
-1.723482, 1.40912, -2.426279, 1, 0.2470588, 0, 1,
-1.704449, -2.051374, -1.866669, 1, 0.2509804, 0, 1,
-1.703275, -0.9538653, -2.258479, 1, 0.2588235, 0, 1,
-1.692614, 1.967114, -2.972582, 1, 0.2627451, 0, 1,
-1.688829, -0.4563022, -1.286241, 1, 0.2705882, 0, 1,
-1.686542, 0.7702186, -1.541031, 1, 0.2745098, 0, 1,
-1.677464, -0.1977557, -0.7370019, 1, 0.282353, 0, 1,
-1.671453, 0.6892272, -0.215142, 1, 0.2862745, 0, 1,
-1.653892, -1.308231, -2.745324, 1, 0.2941177, 0, 1,
-1.649262, -0.2180751, -0.8368599, 1, 0.3019608, 0, 1,
-1.629735, -0.3378399, -2.124441, 1, 0.3058824, 0, 1,
-1.616467, 0.7559122, -3.063587, 1, 0.3137255, 0, 1,
-1.603633, 0.3945978, -0.4935655, 1, 0.3176471, 0, 1,
-1.577345, -2.390541, -2.696519, 1, 0.3254902, 0, 1,
-1.561945, 0.9227963, -3.193364, 1, 0.3294118, 0, 1,
-1.553712, -0.224935, -1.48989, 1, 0.3372549, 0, 1,
-1.551085, -0.3121833, -2.994986, 1, 0.3411765, 0, 1,
-1.550637, 1.503732, -0.7209036, 1, 0.3490196, 0, 1,
-1.543176, 0.8470995, -2.361477, 1, 0.3529412, 0, 1,
-1.540493, -1.123696, -2.033273, 1, 0.3607843, 0, 1,
-1.531645, -0.7386686, -0.6462666, 1, 0.3647059, 0, 1,
-1.517344, 0.05489797, -2.384768, 1, 0.372549, 0, 1,
-1.514665, 0.7759934, -0.1548203, 1, 0.3764706, 0, 1,
-1.513187, 0.5547235, -1.810318, 1, 0.3843137, 0, 1,
-1.510252, 1.179587, 0.1416909, 1, 0.3882353, 0, 1,
-1.506203, 1.130671, -0.4336004, 1, 0.3960784, 0, 1,
-1.498453, 1.995216, 0.3508102, 1, 0.4039216, 0, 1,
-1.492655, -0.5540426, 0.006486789, 1, 0.4078431, 0, 1,
-1.480964, 0.03347702, -0.5862479, 1, 0.4156863, 0, 1,
-1.479447, 0.26061, -2.400941, 1, 0.4196078, 0, 1,
-1.47878, 1.566751, -0.05228133, 1, 0.427451, 0, 1,
-1.474862, -1.445153, -2.299418, 1, 0.4313726, 0, 1,
-1.458826, -2.494374, -2.480119, 1, 0.4392157, 0, 1,
-1.42784, -0.01484079, -1.894933, 1, 0.4431373, 0, 1,
-1.408463, -1.768114, -3.671304, 1, 0.4509804, 0, 1,
-1.383865, 1.04408, -1.212312, 1, 0.454902, 0, 1,
-1.381419, -0.9684821, -1.759739, 1, 0.4627451, 0, 1,
-1.381117, -0.9103005, -1.62248, 1, 0.4666667, 0, 1,
-1.359462, 0.2533157, -0.9878254, 1, 0.4745098, 0, 1,
-1.357619, -0.2036583, -2.534843, 1, 0.4784314, 0, 1,
-1.345182, 0.1215083, -3.248251, 1, 0.4862745, 0, 1,
-1.336396, 0.7331396, -0.7411367, 1, 0.4901961, 0, 1,
-1.335953, 1.855796, -0.4678697, 1, 0.4980392, 0, 1,
-1.329898, -1.037699, -3.669859, 1, 0.5058824, 0, 1,
-1.326152, -0.6056786, -0.6620761, 1, 0.509804, 0, 1,
-1.323551, -1.087006, -3.64407, 1, 0.5176471, 0, 1,
-1.322823, -1.847916, -2.340987, 1, 0.5215687, 0, 1,
-1.319538, -0.4761249, -2.20669, 1, 0.5294118, 0, 1,
-1.313609, -0.762381, -1.17429, 1, 0.5333334, 0, 1,
-1.310066, 0.8777061, -0.2181222, 1, 0.5411765, 0, 1,
-1.306202, 0.121145, -1.486098, 1, 0.5450981, 0, 1,
-1.301672, -0.3658582, -1.707067, 1, 0.5529412, 0, 1,
-1.296878, -0.6133137, -1.362752, 1, 0.5568628, 0, 1,
-1.288641, 1.394605, -1.855055, 1, 0.5647059, 0, 1,
-1.28156, 0.1849774, -0.9963421, 1, 0.5686275, 0, 1,
-1.273582, -0.5602772, -2.855925, 1, 0.5764706, 0, 1,
-1.273015, -0.07381345, -0.7769548, 1, 0.5803922, 0, 1,
-1.268602, -0.6646324, -3.31269, 1, 0.5882353, 0, 1,
-1.265967, 0.664927, 0.05902084, 1, 0.5921569, 0, 1,
-1.263713, 0.1607146, -2.435163, 1, 0.6, 0, 1,
-1.231305, 0.4325214, -0.6172771, 1, 0.6078432, 0, 1,
-1.230791, -0.4165465, -1.970461, 1, 0.6117647, 0, 1,
-1.228974, 0.06930783, -1.447319, 1, 0.6196079, 0, 1,
-1.216754, -0.4872452, -2.093757, 1, 0.6235294, 0, 1,
-1.211018, -0.7748023, -2.12977, 1, 0.6313726, 0, 1,
-1.210693, -0.6168203, -1.06048, 1, 0.6352941, 0, 1,
-1.208249, 2.106939, -1.762265, 1, 0.6431373, 0, 1,
-1.206707, -0.1217216, -2.369281, 1, 0.6470588, 0, 1,
-1.200884, 0.2202563, -0.7048596, 1, 0.654902, 0, 1,
-1.200687, 1.81389, -1.401028, 1, 0.6588235, 0, 1,
-1.196521, -0.5756966, -0.9273338, 1, 0.6666667, 0, 1,
-1.1827, -0.3860714, -3.213106, 1, 0.6705883, 0, 1,
-1.180426, -1.234153, -2.868444, 1, 0.6784314, 0, 1,
-1.175935, 0.9390488, -0.850871, 1, 0.682353, 0, 1,
-1.17516, -0.301914, -3.050444, 1, 0.6901961, 0, 1,
-1.173496, -1.09152, -2.165976, 1, 0.6941177, 0, 1,
-1.164472, 0.9040979, -0.428887, 1, 0.7019608, 0, 1,
-1.13828, 0.6001403, -1.990163, 1, 0.7098039, 0, 1,
-1.129207, 1.43581, -1.968575, 1, 0.7137255, 0, 1,
-1.129002, 0.9760147, -2.492923, 1, 0.7215686, 0, 1,
-1.124332, -1.317611, -0.7056751, 1, 0.7254902, 0, 1,
-1.116043, 0.3499483, -2.315639, 1, 0.7333333, 0, 1,
-1.09993, 0.5508328, -1.388683, 1, 0.7372549, 0, 1,
-1.097931, 0.5921519, -0.4579225, 1, 0.7450981, 0, 1,
-1.097646, 0.8423334, -2.436706, 1, 0.7490196, 0, 1,
-1.095216, -0.4320026, -0.5210798, 1, 0.7568628, 0, 1,
-1.095161, 0.349651, -2.075762, 1, 0.7607843, 0, 1,
-1.091502, 1.037968, -1.928112, 1, 0.7686275, 0, 1,
-1.085371, 0.764519, -1.008179, 1, 0.772549, 0, 1,
-1.082147, -1.105723, -0.2087266, 1, 0.7803922, 0, 1,
-1.079659, 0.8169364, -1.747428, 1, 0.7843137, 0, 1,
-1.076365, 0.4777616, 0.4550077, 1, 0.7921569, 0, 1,
-1.071921, -0.4539432, -2.884794, 1, 0.7960784, 0, 1,
-1.070643, 1.520936, -1.160604, 1, 0.8039216, 0, 1,
-1.069206, 0.380455, -3.249671, 1, 0.8117647, 0, 1,
-1.06873, -0.2710128, -2.626128, 1, 0.8156863, 0, 1,
-1.065089, -0.1630532, -1.363911, 1, 0.8235294, 0, 1,
-1.055129, -0.07262684, -1.904222, 1, 0.827451, 0, 1,
-1.05486, 0.9746966, -0.8874534, 1, 0.8352941, 0, 1,
-1.042653, 1.298869, 0.7720746, 1, 0.8392157, 0, 1,
-1.035747, 1.436885, 0.3364657, 1, 0.8470588, 0, 1,
-1.034933, 1.513924, 0.6606066, 1, 0.8509804, 0, 1,
-1.034159, -0.04730604, -1.67551, 1, 0.8588235, 0, 1,
-1.033416, -0.8124372, -1.117442, 1, 0.8627451, 0, 1,
-1.023383, -1.589239, -2.813278, 1, 0.8705882, 0, 1,
-1.016208, 0.8674591, -0.06516154, 1, 0.8745098, 0, 1,
-1.012802, 1.447427, -0.004724612, 1, 0.8823529, 0, 1,
-1.011164, -1.602006, -1.659349, 1, 0.8862745, 0, 1,
-1.007736, -0.2515865, -1.333304, 1, 0.8941177, 0, 1,
-1.003622, 0.4503891, -1.414225, 1, 0.8980392, 0, 1,
-1.000933, 1.881883, 0.4310688, 1, 0.9058824, 0, 1,
-0.9966796, 0.5530954, -2.324722, 1, 0.9137255, 0, 1,
-0.9966184, -1.074018, -1.007448, 1, 0.9176471, 0, 1,
-0.9875348, 1.04265, -2.202751, 1, 0.9254902, 0, 1,
-0.9804035, -0.2440205, -2.46044, 1, 0.9294118, 0, 1,
-0.9748299, 1.221114, 1.382145, 1, 0.9372549, 0, 1,
-0.9647197, -1.109001, -2.997313, 1, 0.9411765, 0, 1,
-0.9623638, 0.2871391, -0.03978009, 1, 0.9490196, 0, 1,
-0.9602085, -0.4740221, -2.252331, 1, 0.9529412, 0, 1,
-0.9582089, -0.1574591, -2.844008, 1, 0.9607843, 0, 1,
-0.9478237, -0.2781253, -1.183543, 1, 0.9647059, 0, 1,
-0.9477544, 1.281078, -0.7706752, 1, 0.972549, 0, 1,
-0.9468278, 0.2982321, -2.194333, 1, 0.9764706, 0, 1,
-0.9362369, -0.424449, -3.551984, 1, 0.9843137, 0, 1,
-0.9283953, -0.3981859, -2.541792, 1, 0.9882353, 0, 1,
-0.9254045, 0.5144367, -1.672981, 1, 0.9960784, 0, 1,
-0.9237992, -1.034454, -2.727801, 0.9960784, 1, 0, 1,
-0.9190589, -1.684489, -2.941982, 0.9921569, 1, 0, 1,
-0.9190122, 0.7944518, 0.6400838, 0.9843137, 1, 0, 1,
-0.9070739, 0.9515622, -0.6207854, 0.9803922, 1, 0, 1,
-0.905695, 1.246727, -1.959155, 0.972549, 1, 0, 1,
-0.8987098, 0.7086439, 0.2874466, 0.9686275, 1, 0, 1,
-0.8972395, -1.73064, -3.459258, 0.9607843, 1, 0, 1,
-0.8776412, -0.5114983, -2.86461, 0.9568627, 1, 0, 1,
-0.8745763, -0.5973659, -2.174513, 0.9490196, 1, 0, 1,
-0.8648066, -0.3511148, -1.649969, 0.945098, 1, 0, 1,
-0.8530205, 0.05940516, -1.358769, 0.9372549, 1, 0, 1,
-0.8529289, 0.02385364, -2.335455, 0.9333333, 1, 0, 1,
-0.8492383, 0.5727456, -2.54647, 0.9254902, 1, 0, 1,
-0.8451299, 0.2273682, -4.296121, 0.9215686, 1, 0, 1,
-0.8431029, -0.3505321, -2.259289, 0.9137255, 1, 0, 1,
-0.8419852, -0.9337175, -3.478137, 0.9098039, 1, 0, 1,
-0.8378134, -0.2482213, -3.511527, 0.9019608, 1, 0, 1,
-0.8369341, -1.416587, -2.527115, 0.8941177, 1, 0, 1,
-0.8302858, 0.1468566, 0.2083623, 0.8901961, 1, 0, 1,
-0.8301787, -1.01042, -1.487484, 0.8823529, 1, 0, 1,
-0.8277675, -1.057166, -1.985265, 0.8784314, 1, 0, 1,
-0.8269376, -1.041441, -2.395271, 0.8705882, 1, 0, 1,
-0.8200362, -0.5610307, -0.7436547, 0.8666667, 1, 0, 1,
-0.8180358, 0.1204828, -3.775332, 0.8588235, 1, 0, 1,
-0.8178909, 0.5110143, -1.425193, 0.854902, 1, 0, 1,
-0.8126462, -0.4976911, -2.507705, 0.8470588, 1, 0, 1,
-0.8113609, 0.7983075, -0.03662235, 0.8431373, 1, 0, 1,
-0.8097442, 1.050017, 0.2191843, 0.8352941, 1, 0, 1,
-0.8069175, -0.9645342, -2.171777, 0.8313726, 1, 0, 1,
-0.805381, 0.9856068, 0.3634722, 0.8235294, 1, 0, 1,
-0.785018, -1.531178, -2.789748, 0.8196079, 1, 0, 1,
-0.7828063, -0.5762658, -1.476483, 0.8117647, 1, 0, 1,
-0.7772646, -0.9131161, -2.949462, 0.8078431, 1, 0, 1,
-0.7713208, 0.7052345, 0.09336989, 0.8, 1, 0, 1,
-0.7702889, 1.219012, -0.3129984, 0.7921569, 1, 0, 1,
-0.7521916, -1.193507, -2.197806, 0.7882353, 1, 0, 1,
-0.7519271, 0.7470062, -0.2226719, 0.7803922, 1, 0, 1,
-0.7476289, 0.4976015, -1.441592, 0.7764706, 1, 0, 1,
-0.746032, -0.05729173, 0.1238609, 0.7686275, 1, 0, 1,
-0.7459766, 0.7362388, -1.510777, 0.7647059, 1, 0, 1,
-0.7456378, 0.02661755, -2.154877, 0.7568628, 1, 0, 1,
-0.7418209, 0.6153497, -0.5515893, 0.7529412, 1, 0, 1,
-0.7385647, 0.07915702, -1.638044, 0.7450981, 1, 0, 1,
-0.734017, -1.152418, -2.979927, 0.7411765, 1, 0, 1,
-0.731068, -0.3621201, -2.713598, 0.7333333, 1, 0, 1,
-0.7267138, 0.2724773, -1.355865, 0.7294118, 1, 0, 1,
-0.7266249, 0.6128825, -1.746155, 0.7215686, 1, 0, 1,
-0.7244441, 2.535351, -0.8302122, 0.7176471, 1, 0, 1,
-0.7108462, 1.928763, -0.3325999, 0.7098039, 1, 0, 1,
-0.7091374, 1.431695, -2.424135, 0.7058824, 1, 0, 1,
-0.7039003, 0.1415434, -2.383096, 0.6980392, 1, 0, 1,
-0.6997924, 0.7420819, 0.7164203, 0.6901961, 1, 0, 1,
-0.6960606, 0.5467339, -0.867368, 0.6862745, 1, 0, 1,
-0.6904622, -0.9294452, -2.494351, 0.6784314, 1, 0, 1,
-0.6900333, 0.007042825, -1.821354, 0.6745098, 1, 0, 1,
-0.689112, -0.8389581, -4.038236, 0.6666667, 1, 0, 1,
-0.6887, -1.362799, -2.251883, 0.6627451, 1, 0, 1,
-0.6867489, -0.6184587, -2.96267, 0.654902, 1, 0, 1,
-0.6757262, -0.385313, -0.6366623, 0.6509804, 1, 0, 1,
-0.6750361, 0.5715368, -1.333094, 0.6431373, 1, 0, 1,
-0.6748627, -0.6169994, -2.935217, 0.6392157, 1, 0, 1,
-0.6733286, 2.155312, 1.381675, 0.6313726, 1, 0, 1,
-0.6725422, 2.600216, 1.300706, 0.627451, 1, 0, 1,
-0.6601264, 1.676246, -0.3700917, 0.6196079, 1, 0, 1,
-0.6559489, 0.1625067, -2.202944, 0.6156863, 1, 0, 1,
-0.6542356, 0.9082502, -0.1726963, 0.6078432, 1, 0, 1,
-0.6528574, 1.433767, -0.6493024, 0.6039216, 1, 0, 1,
-0.6506191, 1.135181, -0.1753465, 0.5960785, 1, 0, 1,
-0.6471288, -0.2468894, -1.362536, 0.5882353, 1, 0, 1,
-0.6455671, 0.8472698, -3.479558, 0.5843138, 1, 0, 1,
-0.6444913, 1.072242, -0.6970636, 0.5764706, 1, 0, 1,
-0.6296688, -0.04199391, 0.624991, 0.572549, 1, 0, 1,
-0.6271057, 0.6090606, -0.1878591, 0.5647059, 1, 0, 1,
-0.6265607, 0.9478453, -2.618465, 0.5607843, 1, 0, 1,
-0.6259225, 0.3111179, 0.02797876, 0.5529412, 1, 0, 1,
-0.6254243, 1.315966, -0.897238, 0.5490196, 1, 0, 1,
-0.62296, -0.276122, -0.5755727, 0.5411765, 1, 0, 1,
-0.6218277, -0.8200479, -2.483769, 0.5372549, 1, 0, 1,
-0.6165968, 0.4635446, -1.690767, 0.5294118, 1, 0, 1,
-0.6161308, -1.155242, -1.565304, 0.5254902, 1, 0, 1,
-0.6156247, 0.8471001, -0.9669257, 0.5176471, 1, 0, 1,
-0.6111606, -0.5326566, -3.141205, 0.5137255, 1, 0, 1,
-0.6107087, 0.9598531, 0.2382817, 0.5058824, 1, 0, 1,
-0.6056414, 1.042661, -1.250299, 0.5019608, 1, 0, 1,
-0.6046095, -0.6242444, -1.778661, 0.4941176, 1, 0, 1,
-0.5983988, -0.1604962, -2.078891, 0.4862745, 1, 0, 1,
-0.5962386, -0.4957098, -0.4364293, 0.4823529, 1, 0, 1,
-0.5890455, -0.4684276, -2.739443, 0.4745098, 1, 0, 1,
-0.5878528, 1.970013, 0.9438786, 0.4705882, 1, 0, 1,
-0.5837278, -1.133423, -3.901878, 0.4627451, 1, 0, 1,
-0.5810069, 0.5154337, -0.4173202, 0.4588235, 1, 0, 1,
-0.5773637, 0.2922609, -0.8334703, 0.4509804, 1, 0, 1,
-0.5759863, -0.8198478, -1.96815, 0.4470588, 1, 0, 1,
-0.5741566, -1.099206, -1.335601, 0.4392157, 1, 0, 1,
-0.5712596, -0.4800007, -1.841975, 0.4352941, 1, 0, 1,
-0.5712162, 0.2144142, -0.9562433, 0.427451, 1, 0, 1,
-0.5651829, 1.512077, 0.1605788, 0.4235294, 1, 0, 1,
-0.563734, -1.057752, -2.908884, 0.4156863, 1, 0, 1,
-0.5636749, 0.5172655, -1.705158, 0.4117647, 1, 0, 1,
-0.5618261, -2.104317, -2.40168, 0.4039216, 1, 0, 1,
-0.5578575, 1.499603, 0.7954713, 0.3960784, 1, 0, 1,
-0.5565041, -0.9667028, -3.973759, 0.3921569, 1, 0, 1,
-0.5559142, 0.5486012, 0.4117683, 0.3843137, 1, 0, 1,
-0.5555618, -0.5600499, -1.946329, 0.3803922, 1, 0, 1,
-0.5542162, 0.8203334, -0.4862993, 0.372549, 1, 0, 1,
-0.5442729, -1.108402, -2.962886, 0.3686275, 1, 0, 1,
-0.5407793, -3.76948, -3.979701, 0.3607843, 1, 0, 1,
-0.5286766, -1.812077, -4.174009, 0.3568628, 1, 0, 1,
-0.5284702, -0.6484075, -2.554683, 0.3490196, 1, 0, 1,
-0.526124, 0.6793402, 1.124176, 0.345098, 1, 0, 1,
-0.5192313, 1.506917, -1.241043, 0.3372549, 1, 0, 1,
-0.5164549, -1.262514, -3.51784, 0.3333333, 1, 0, 1,
-0.5100138, -0.6622276, -3.359692, 0.3254902, 1, 0, 1,
-0.5075061, 1.45668, 0.9380115, 0.3215686, 1, 0, 1,
-0.5042493, 0.7099243, -0.4837238, 0.3137255, 1, 0, 1,
-0.5037477, -0.5783895, -3.418124, 0.3098039, 1, 0, 1,
-0.5037399, -0.8985838, -1.203686, 0.3019608, 1, 0, 1,
-0.5014548, -0.02858706, -2.707536, 0.2941177, 1, 0, 1,
-0.4988717, 0.7007952, -0.7387547, 0.2901961, 1, 0, 1,
-0.4866868, 0.1187701, -1.680266, 0.282353, 1, 0, 1,
-0.4823062, -0.7656888, -3.667715, 0.2784314, 1, 0, 1,
-0.4790412, 0.5607272, -1.53862, 0.2705882, 1, 0, 1,
-0.4739119, -0.2261376, -3.828414, 0.2666667, 1, 0, 1,
-0.4662582, 1.248625, 0.597684, 0.2588235, 1, 0, 1,
-0.4638338, -0.3085777, -1.576669, 0.254902, 1, 0, 1,
-0.4600515, 1.284216, 1.065771, 0.2470588, 1, 0, 1,
-0.459377, 1.077694, 2.123144, 0.2431373, 1, 0, 1,
-0.4578216, 0.5780736, -0.480229, 0.2352941, 1, 0, 1,
-0.4544397, 0.1086535, -2.79431, 0.2313726, 1, 0, 1,
-0.4541968, 0.5757403, -1.414317, 0.2235294, 1, 0, 1,
-0.4460373, -0.5078406, -2.250119, 0.2196078, 1, 0, 1,
-0.4441393, -0.2658297, -1.9291, 0.2117647, 1, 0, 1,
-0.4438807, -0.002210986, -1.419004, 0.2078431, 1, 0, 1,
-0.4429671, 2.573559, 0.9391072, 0.2, 1, 0, 1,
-0.4410633, 1.18747, 1.218018, 0.1921569, 1, 0, 1,
-0.4398048, 0.5378406, 0.7155337, 0.1882353, 1, 0, 1,
-0.4397037, 1.135782, -3.104775, 0.1803922, 1, 0, 1,
-0.4393492, 0.2536161, -0.6382354, 0.1764706, 1, 0, 1,
-0.4384242, -1.283195, -3.652872, 0.1686275, 1, 0, 1,
-0.437057, -0.1518435, -0.1520254, 0.1647059, 1, 0, 1,
-0.4362191, -0.7001796, -4.494014, 0.1568628, 1, 0, 1,
-0.4348101, -0.6931419, -3.905946, 0.1529412, 1, 0, 1,
-0.4345116, -0.594551, -2.809879, 0.145098, 1, 0, 1,
-0.4312011, -0.2462165, -2.853974, 0.1411765, 1, 0, 1,
-0.429647, -0.4238578, -1.727445, 0.1333333, 1, 0, 1,
-0.4292248, -1.883057, -3.089975, 0.1294118, 1, 0, 1,
-0.42836, 0.8023708, -1.478857, 0.1215686, 1, 0, 1,
-0.4281799, 1.246914, -1.824499, 0.1176471, 1, 0, 1,
-0.4279391, 0.223267, -0.5662661, 0.1098039, 1, 0, 1,
-0.4273549, -0.6463976, -2.210393, 0.1058824, 1, 0, 1,
-0.4241797, -0.3058024, -2.915643, 0.09803922, 1, 0, 1,
-0.4199867, 0.0370314, 0.4357923, 0.09019608, 1, 0, 1,
-0.4171461, 1.24816, -0.3345768, 0.08627451, 1, 0, 1,
-0.416932, 0.05133279, -1.761237, 0.07843138, 1, 0, 1,
-0.4169294, -0.319263, -1.680042, 0.07450981, 1, 0, 1,
-0.4127357, 1.268968, -0.1781884, 0.06666667, 1, 0, 1,
-0.4050552, 1.14409, -0.7107356, 0.0627451, 1, 0, 1,
-0.4038625, 0.5910727, -1.298165, 0.05490196, 1, 0, 1,
-0.4033619, -0.278878, -3.220966, 0.05098039, 1, 0, 1,
-0.3948962, -1.264954, -1.692608, 0.04313726, 1, 0, 1,
-0.3947265, 0.06065309, -2.153132, 0.03921569, 1, 0, 1,
-0.3919717, 0.483918, -1.037174, 0.03137255, 1, 0, 1,
-0.3831483, 0.3145326, 0.007941921, 0.02745098, 1, 0, 1,
-0.362714, -1.024071, -2.664111, 0.01960784, 1, 0, 1,
-0.3572181, 0.2736626, -1.630936, 0.01568628, 1, 0, 1,
-0.3484931, 0.3490393, -0.06627805, 0.007843138, 1, 0, 1,
-0.3464272, 1.112466, -2.775749, 0.003921569, 1, 0, 1,
-0.3453493, -1.127477, -4.323896, 0, 1, 0.003921569, 1,
-0.3420355, -0.6051028, -3.066816, 0, 1, 0.01176471, 1,
-0.3379948, -0.05306543, -2.375549, 0, 1, 0.01568628, 1,
-0.3362446, -0.7004178, -1.383273, 0, 1, 0.02352941, 1,
-0.336238, -0.8960455, -1.732222, 0, 1, 0.02745098, 1,
-0.3271285, -0.5547119, -2.414407, 0, 1, 0.03529412, 1,
-0.3247359, -0.6530377, -2.24262, 0, 1, 0.03921569, 1,
-0.3177505, -1.742885, -2.070006, 0, 1, 0.04705882, 1,
-0.3149421, 0.6706086, 1.044875, 0, 1, 0.05098039, 1,
-0.310804, -0.5888395, -2.192079, 0, 1, 0.05882353, 1,
-0.3107373, 3.315568, -0.108769, 0, 1, 0.0627451, 1,
-0.3104845, 0.3466063, -0.9214, 0, 1, 0.07058824, 1,
-0.3079576, -0.653966, -4.0548, 0, 1, 0.07450981, 1,
-0.3050524, -0.6504536, -1.403649, 0, 1, 0.08235294, 1,
-0.3013825, 1.420148, -0.6710204, 0, 1, 0.08627451, 1,
-0.3007379, 0.4322976, -1.539894, 0, 1, 0.09411765, 1,
-0.2973025, -1.718622, -4.592282, 0, 1, 0.1019608, 1,
-0.2955244, 0.1582831, -0.1178431, 0, 1, 0.1058824, 1,
-0.2899737, -0.8890197, -0.6920173, 0, 1, 0.1137255, 1,
-0.2896336, 0.7787151, 1.243967, 0, 1, 0.1176471, 1,
-0.2869915, 1.447743, -1.038267, 0, 1, 0.1254902, 1,
-0.2839909, 1.008975, -1.43135, 0, 1, 0.1294118, 1,
-0.2796643, -0.1536431, -0.201419, 0, 1, 0.1372549, 1,
-0.2790797, 1.859395, 0.5470481, 0, 1, 0.1411765, 1,
-0.2786589, 0.7106967, 0.1241125, 0, 1, 0.1490196, 1,
-0.2760412, -1.217446, -4.013804, 0, 1, 0.1529412, 1,
-0.275466, 1.184386, 1.473588, 0, 1, 0.1607843, 1,
-0.2749861, 0.3674356, -0.3385624, 0, 1, 0.1647059, 1,
-0.2748999, 0.5755148, 1.495996, 0, 1, 0.172549, 1,
-0.2722706, -0.4910913, -2.482609, 0, 1, 0.1764706, 1,
-0.2674063, -2.239211, -4.071915, 0, 1, 0.1843137, 1,
-0.2650647, -1.438221, -4.62212, 0, 1, 0.1882353, 1,
-0.2641789, 0.6204861, 0.250399, 0, 1, 0.1960784, 1,
-0.2630959, -0.03689118, -1.842785, 0, 1, 0.2039216, 1,
-0.2622932, 2.122371, 0.2646931, 0, 1, 0.2078431, 1,
-0.2612258, 0.1008149, -0.7766479, 0, 1, 0.2156863, 1,
-0.2607538, -0.4039644, -2.449889, 0, 1, 0.2196078, 1,
-0.2560069, 0.9639381, 1.526985, 0, 1, 0.227451, 1,
-0.2556983, 0.4139755, -0.3714172, 0, 1, 0.2313726, 1,
-0.2554489, 0.5462134, -2.008627, 0, 1, 0.2392157, 1,
-0.2537329, -1.580315, -4.14898, 0, 1, 0.2431373, 1,
-0.2537165, 0.8406864, 0.3428774, 0, 1, 0.2509804, 1,
-0.253526, 1.931916, -0.2609094, 0, 1, 0.254902, 1,
-0.2520535, 0.4039516, 0.472759, 0, 1, 0.2627451, 1,
-0.2500162, -0.3965596, -4.738222, 0, 1, 0.2666667, 1,
-0.2478318, -0.7262109, -3.292507, 0, 1, 0.2745098, 1,
-0.2396683, -0.6610236, -4.272821, 0, 1, 0.2784314, 1,
-0.2360358, -1.53507, -3.230109, 0, 1, 0.2862745, 1,
-0.2355036, -1.710459, -4.168488, 0, 1, 0.2901961, 1,
-0.2314399, 1.701856, -1.968714, 0, 1, 0.2980392, 1,
-0.2273118, -0.4747651, -3.958741, 0, 1, 0.3058824, 1,
-0.2269467, 0.7737435, -1.654174, 0, 1, 0.3098039, 1,
-0.2225892, -0.7303191, -2.890008, 0, 1, 0.3176471, 1,
-0.2148484, 0.5600491, 0.1516134, 0, 1, 0.3215686, 1,
-0.2145125, -0.8317551, -1.668117, 0, 1, 0.3294118, 1,
-0.2123631, -1.2756, -2.473817, 0, 1, 0.3333333, 1,
-0.2115078, 0.5751706, 1.153286, 0, 1, 0.3411765, 1,
-0.2075809, 0.7969363, 0.09044, 0, 1, 0.345098, 1,
-0.2056824, -0.1369285, -1.451126, 0, 1, 0.3529412, 1,
-0.2046889, -2.161879, -3.034949, 0, 1, 0.3568628, 1,
-0.2025316, 0.5140999, -0.7179261, 0, 1, 0.3647059, 1,
-0.2025243, -0.1033997, -2.876156, 0, 1, 0.3686275, 1,
-0.2022863, -0.2803155, -1.93844, 0, 1, 0.3764706, 1,
-0.201395, 0.8970881, 1.052387, 0, 1, 0.3803922, 1,
-0.2002268, 0.1018413, -3.013736, 0, 1, 0.3882353, 1,
-0.1964685, -0.6162413, -2.559394, 0, 1, 0.3921569, 1,
-0.1961174, 1.566997, 0.3137861, 0, 1, 0.4, 1,
-0.1899652, -0.8793476, -2.34405, 0, 1, 0.4078431, 1,
-0.1884433, 0.3157324, -0.2369734, 0, 1, 0.4117647, 1,
-0.1863457, 0.5815074, -1.668348, 0, 1, 0.4196078, 1,
-0.1855037, 0.3994571, -0.2103068, 0, 1, 0.4235294, 1,
-0.1840181, -0.4451446, -2.236863, 0, 1, 0.4313726, 1,
-0.1824635, -1.124527, -1.987724, 0, 1, 0.4352941, 1,
-0.1818046, -1.311938, -3.886605, 0, 1, 0.4431373, 1,
-0.1810963, 0.4782936, -0.2665485, 0, 1, 0.4470588, 1,
-0.1788028, 1.108308, 0.2336026, 0, 1, 0.454902, 1,
-0.1776916, -0.3840252, -3.767674, 0, 1, 0.4588235, 1,
-0.176238, -0.02647401, -1.289064, 0, 1, 0.4666667, 1,
-0.1753564, 0.5828668, -1.492042, 0, 1, 0.4705882, 1,
-0.1712967, 1.814716, -0.9535532, 0, 1, 0.4784314, 1,
-0.1712656, -1.284802, -1.967341, 0, 1, 0.4823529, 1,
-0.1642836, -1.110024, -1.480882, 0, 1, 0.4901961, 1,
-0.1619791, -1.422312, -3.418442, 0, 1, 0.4941176, 1,
-0.1572738, -0.9140022, -2.564769, 0, 1, 0.5019608, 1,
-0.1537836, 2.04493, -1.271371, 0, 1, 0.509804, 1,
-0.1517627, -0.8313881, -3.836486, 0, 1, 0.5137255, 1,
-0.150365, 0.1388712, 0.3871584, 0, 1, 0.5215687, 1,
-0.1498816, -0.1757679, -3.147539, 0, 1, 0.5254902, 1,
-0.1471287, -0.03688282, -2.455934, 0, 1, 0.5333334, 1,
-0.1459875, -0.007956356, -2.220614, 0, 1, 0.5372549, 1,
-0.1457065, 1.293966, 1.033776, 0, 1, 0.5450981, 1,
-0.1433474, 0.201967, -0.5321696, 0, 1, 0.5490196, 1,
-0.1421774, 1.457526, 0.1999787, 0, 1, 0.5568628, 1,
-0.141763, 0.6764824, 0.2159177, 0, 1, 0.5607843, 1,
-0.1397691, -1.364452, -2.873231, 0, 1, 0.5686275, 1,
-0.1391705, 0.2575292, -1.154116, 0, 1, 0.572549, 1,
-0.1338345, -0.8543928, -4.040814, 0, 1, 0.5803922, 1,
-0.1338007, 0.6769003, -0.1163324, 0, 1, 0.5843138, 1,
-0.1318349, -0.6002541, -2.604798, 0, 1, 0.5921569, 1,
-0.130959, -0.1391558, -2.426827, 0, 1, 0.5960785, 1,
-0.1309127, 0.6680605, 0.4321199, 0, 1, 0.6039216, 1,
-0.128536, -0.6050709, -3.251636, 0, 1, 0.6117647, 1,
-0.1269623, -0.814367, -2.532612, 0, 1, 0.6156863, 1,
-0.1223203, -0.358579, -2.08378, 0, 1, 0.6235294, 1,
-0.1204542, 1.00075, -0.1437614, 0, 1, 0.627451, 1,
-0.1163924, 1.458403, -0.6428274, 0, 1, 0.6352941, 1,
-0.1163249, -0.01452848, -1.794797, 0, 1, 0.6392157, 1,
-0.1138052, -0.2831469, -0.874849, 0, 1, 0.6470588, 1,
-0.1108639, 0.4059524, -0.719062, 0, 1, 0.6509804, 1,
-0.1078656, 1.600632, -0.3836953, 0, 1, 0.6588235, 1,
-0.1071854, 0.1060756, -0.7896047, 0, 1, 0.6627451, 1,
-0.1052143, -0.1513993, -5.025095, 0, 1, 0.6705883, 1,
-0.1046466, -1.467848, -2.212653, 0, 1, 0.6745098, 1,
-0.1027723, 1.092325, 1.345739, 0, 1, 0.682353, 1,
-0.1007969, 1.019047, 0.1088459, 0, 1, 0.6862745, 1,
-0.09919748, -0.3236695, -2.581266, 0, 1, 0.6941177, 1,
-0.09826362, 0.8424903, 0.7892811, 0, 1, 0.7019608, 1,
-0.08577926, 1.237027, 0.5329599, 0, 1, 0.7058824, 1,
-0.08094216, -2.027544, -2.752934, 0, 1, 0.7137255, 1,
-0.08053275, -0.4015996, -3.321293, 0, 1, 0.7176471, 1,
-0.07911858, 0.7659202, 0.09496537, 0, 1, 0.7254902, 1,
-0.0770487, 0.3186186, -0.03220267, 0, 1, 0.7294118, 1,
-0.07663457, 1.351871, -0.4819288, 0, 1, 0.7372549, 1,
-0.07555289, -0.4316124, -1.816178, 0, 1, 0.7411765, 1,
-0.07100561, 0.7301521, -0.3735315, 0, 1, 0.7490196, 1,
-0.06904884, -0.6252486, -1.947224, 0, 1, 0.7529412, 1,
-0.068792, -1.776077, -2.871502, 0, 1, 0.7607843, 1,
-0.06643399, -0.6460237, -2.412345, 0, 1, 0.7647059, 1,
-0.06591613, 0.1779233, -0.4210045, 0, 1, 0.772549, 1,
-0.06327708, 1.056055, -0.4319584, 0, 1, 0.7764706, 1,
-0.05801137, 0.06322823, 0.7153373, 0, 1, 0.7843137, 1,
-0.05763661, -1.850523, -1.55389, 0, 1, 0.7882353, 1,
-0.0541634, 0.4749477, -0.4454826, 0, 1, 0.7960784, 1,
-0.05329943, 0.3027993, -1.314134, 0, 1, 0.8039216, 1,
-0.05208559, -0.9083489, -4.039446, 0, 1, 0.8078431, 1,
-0.05150492, 0.293973, 0.9151422, 0, 1, 0.8156863, 1,
-0.04494783, -0.3166941, -3.137847, 0, 1, 0.8196079, 1,
-0.0432081, -0.5236535, -2.965934, 0, 1, 0.827451, 1,
-0.04200421, 0.5261169, 1.617427, 0, 1, 0.8313726, 1,
-0.04104571, -1.579764, -2.445019, 0, 1, 0.8392157, 1,
-0.03752214, -0.3254684, -1.523483, 0, 1, 0.8431373, 1,
-0.03648502, 1.804384, -2.593343, 0, 1, 0.8509804, 1,
-0.03644989, 1.430148, -1.014064, 0, 1, 0.854902, 1,
-0.03222269, 0.08220942, -1.668353, 0, 1, 0.8627451, 1,
-0.02878343, -2.005136, -1.79243, 0, 1, 0.8666667, 1,
-0.02562397, -1.21941, -3.255719, 0, 1, 0.8745098, 1,
-0.02392459, 1.296807, -2.142354, 0, 1, 0.8784314, 1,
-0.01516438, -0.9827716, -2.312224, 0, 1, 0.8862745, 1,
-0.0150599, -0.07753194, -2.516544, 0, 1, 0.8901961, 1,
-0.01430618, 0.06749078, -1.050715, 0, 1, 0.8980392, 1,
-0.01125451, -0.3347163, -3.401568, 0, 1, 0.9058824, 1,
-0.01122767, 0.8762259, -0.3308582, 0, 1, 0.9098039, 1,
-0.008163531, -0.2773643, -4.172112, 0, 1, 0.9176471, 1,
-0.00688303, 1.577916, 0.2298468, 0, 1, 0.9215686, 1,
-0.004408415, -0.5003029, -1.943808, 0, 1, 0.9294118, 1,
-0.001238246, 0.809167, -0.08296663, 0, 1, 0.9333333, 1,
0.007973193, 0.0576276, -0.8489616, 0, 1, 0.9411765, 1,
0.01015369, -0.8788105, 2.806425, 0, 1, 0.945098, 1,
0.01167792, -1.412595, 4.1441, 0, 1, 0.9529412, 1,
0.01167875, -0.5174318, 4.039372, 0, 1, 0.9568627, 1,
0.01180818, -1.552375, 3.724218, 0, 1, 0.9647059, 1,
0.01552034, 0.8767541, 1.238152, 0, 1, 0.9686275, 1,
0.01642085, 0.04092235, 0.7680439, 0, 1, 0.9764706, 1,
0.01977891, -0.7883193, 3.603173, 0, 1, 0.9803922, 1,
0.02143162, -1.505282, 3.899691, 0, 1, 0.9882353, 1,
0.02573215, 0.2221235, -0.5245305, 0, 1, 0.9921569, 1,
0.02637111, 0.6888304, -1.454714, 0, 1, 1, 1,
0.0299196, 0.8456045, -1.457144, 0, 0.9921569, 1, 1,
0.03018773, -0.6653209, 1.363879, 0, 0.9882353, 1, 1,
0.03093513, -1.186814, 2.550235, 0, 0.9803922, 1, 1,
0.03317109, -0.3752815, 4.953407, 0, 0.9764706, 1, 1,
0.03369835, 1.109425, 0.03772166, 0, 0.9686275, 1, 1,
0.03502516, 0.9737769, 0.2052276, 0, 0.9647059, 1, 1,
0.03555198, -1.984446, 3.935308, 0, 0.9568627, 1, 1,
0.0375284, 0.5780231, 0.7595897, 0, 0.9529412, 1, 1,
0.03825564, 1.148163, 0.593532, 0, 0.945098, 1, 1,
0.03891532, -0.3128946, 3.57454, 0, 0.9411765, 1, 1,
0.03964682, 1.134279, -0.6566697, 0, 0.9333333, 1, 1,
0.04124797, 0.7708231, 0.9514853, 0, 0.9294118, 1, 1,
0.0474091, 0.4228729, -1.955146, 0, 0.9215686, 1, 1,
0.05008358, 0.6994157, -0.4936714, 0, 0.9176471, 1, 1,
0.05230368, 1.022607, -0.1496145, 0, 0.9098039, 1, 1,
0.05288272, 1.096489, 1.082388, 0, 0.9058824, 1, 1,
0.05494318, -1.455306, 3.776742, 0, 0.8980392, 1, 1,
0.05508132, 0.2426411, 0.5834584, 0, 0.8901961, 1, 1,
0.05572398, -0.265306, 3.045822, 0, 0.8862745, 1, 1,
0.05682979, 0.6372597, 0.01354913, 0, 0.8784314, 1, 1,
0.06112973, 1.74811, 0.933934, 0, 0.8745098, 1, 1,
0.0628351, 0.8066112, 1.34756, 0, 0.8666667, 1, 1,
0.06412451, -0.9161805, 2.913166, 0, 0.8627451, 1, 1,
0.07583801, -0.2898021, 3.606935, 0, 0.854902, 1, 1,
0.08517665, -1.518682, 5.034591, 0, 0.8509804, 1, 1,
0.08738261, 1.883611, 0.1923162, 0, 0.8431373, 1, 1,
0.0900427, -0.3768046, 3.314698, 0, 0.8392157, 1, 1,
0.09027314, 0.779497, -0.0477083, 0, 0.8313726, 1, 1,
0.09321159, 1.025918, 2.324047, 0, 0.827451, 1, 1,
0.09331644, 0.6948295, 1.334679, 0, 0.8196079, 1, 1,
0.09510916, -1.132341, 3.055977, 0, 0.8156863, 1, 1,
0.09558927, 0.8346568, 0.7954117, 0, 0.8078431, 1, 1,
0.09571198, -1.781231, 1.964062, 0, 0.8039216, 1, 1,
0.09871241, -0.2800034, 3.825482, 0, 0.7960784, 1, 1,
0.09908339, 0.2464637, 0.09507225, 0, 0.7882353, 1, 1,
0.1014093, 1.233925, -0.1836676, 0, 0.7843137, 1, 1,
0.105907, -0.01807938, 1.944416, 0, 0.7764706, 1, 1,
0.106252, -1.944882, 5.357142, 0, 0.772549, 1, 1,
0.1082331, -0.3795299, 3.797438, 0, 0.7647059, 1, 1,
0.1133436, 0.5100962, -0.137391, 0, 0.7607843, 1, 1,
0.1133821, 1.71921, -0.2714586, 0, 0.7529412, 1, 1,
0.1202599, -0.7620974, 3.295164, 0, 0.7490196, 1, 1,
0.1214731, 0.610516, 1.569244, 0, 0.7411765, 1, 1,
0.1219469, -2.085728, 0.2229046, 0, 0.7372549, 1, 1,
0.122135, 0.08618976, 2.050384, 0, 0.7294118, 1, 1,
0.123558, 1.218983, 0.431732, 0, 0.7254902, 1, 1,
0.1297508, 0.2479094, -0.3394341, 0, 0.7176471, 1, 1,
0.1313976, 1.112468, -0.5694728, 0, 0.7137255, 1, 1,
0.1338547, -0.7385471, 2.068402, 0, 0.7058824, 1, 1,
0.1361617, -0.07486337, 2.659028, 0, 0.6980392, 1, 1,
0.1367629, 0.1769774, -0.2926142, 0, 0.6941177, 1, 1,
0.1368814, 2.19777, -0.6412853, 0, 0.6862745, 1, 1,
0.1408513, -0.357132, 3.40235, 0, 0.682353, 1, 1,
0.141462, -0.008452387, 1.809916, 0, 0.6745098, 1, 1,
0.1418676, -0.1745562, 3.106008, 0, 0.6705883, 1, 1,
0.1426974, -0.893074, 1.512625, 0, 0.6627451, 1, 1,
0.1429829, 0.9841619, 1.277918, 0, 0.6588235, 1, 1,
0.1436674, 1.89645, -1.336792, 0, 0.6509804, 1, 1,
0.1445607, -1.347831, 1.868313, 0, 0.6470588, 1, 1,
0.1448382, -0.09432141, 0.3988859, 0, 0.6392157, 1, 1,
0.1479135, 0.246036, -1.194123, 0, 0.6352941, 1, 1,
0.1482976, 0.5144002, 1.140396, 0, 0.627451, 1, 1,
0.150258, 1.109305, 1.392701, 0, 0.6235294, 1, 1,
0.1522039, -0.07381769, 1.189398, 0, 0.6156863, 1, 1,
0.1534377, -1.084983, 3.149702, 0, 0.6117647, 1, 1,
0.15435, -0.3691639, 2.741121, 0, 0.6039216, 1, 1,
0.1583285, -0.2216477, 1.829067, 0, 0.5960785, 1, 1,
0.1586353, 0.01445799, 1.649077, 0, 0.5921569, 1, 1,
0.1588151, -1.554788, 4.117247, 0, 0.5843138, 1, 1,
0.1602145, 0.9058217, 0.3356217, 0, 0.5803922, 1, 1,
0.1630672, -1.360814, 3.457043, 0, 0.572549, 1, 1,
0.1637187, 1.435583, 0.5166231, 0, 0.5686275, 1, 1,
0.1648473, 0.9223462, -0.9282522, 0, 0.5607843, 1, 1,
0.1711123, -0.9009687, 3.517823, 0, 0.5568628, 1, 1,
0.1723184, 0.1102791, 0.9042625, 0, 0.5490196, 1, 1,
0.172496, 0.7440246, -0.8062824, 0, 0.5450981, 1, 1,
0.1799818, -0.230194, 1.777998, 0, 0.5372549, 1, 1,
0.1815456, -2.232308, 4.199753, 0, 0.5333334, 1, 1,
0.1846587, 0.782975, -1.19067, 0, 0.5254902, 1, 1,
0.1855918, 0.3102764, 0.008172637, 0, 0.5215687, 1, 1,
0.187987, 1.684299, -1.121751, 0, 0.5137255, 1, 1,
0.1894173, 0.560921, 2.255921, 0, 0.509804, 1, 1,
0.1916507, -0.5258696, 4.023834, 0, 0.5019608, 1, 1,
0.1951768, 1.143161, 0.6006455, 0, 0.4941176, 1, 1,
0.1983181, 0.34992, 1.690272, 0, 0.4901961, 1, 1,
0.202077, 1.420177, -0.3644045, 0, 0.4823529, 1, 1,
0.2065577, 0.0526379, 2.291773, 0, 0.4784314, 1, 1,
0.2067656, -0.5233095, 3.53605, 0, 0.4705882, 1, 1,
0.2071947, -0.6008857, 4.167402, 0, 0.4666667, 1, 1,
0.2121468, -1.285264, 2.34108, 0, 0.4588235, 1, 1,
0.221104, -0.2930247, 1.550985, 0, 0.454902, 1, 1,
0.2245088, 0.09350842, 2.00802, 0, 0.4470588, 1, 1,
0.2268839, 1.516409, 0.8431263, 0, 0.4431373, 1, 1,
0.231818, 0.9241541, 0.6275961, 0, 0.4352941, 1, 1,
0.2340898, 1.342141, 0.9933259, 0, 0.4313726, 1, 1,
0.2370798, 0.8526959, 0.0195735, 0, 0.4235294, 1, 1,
0.2378417, -0.7472585, 2.96306, 0, 0.4196078, 1, 1,
0.2398288, 1.175664, 1.691666, 0, 0.4117647, 1, 1,
0.2402, -0.8669649, 3.47372, 0, 0.4078431, 1, 1,
0.2468747, -0.04022791, 2.555351, 0, 0.4, 1, 1,
0.2486122, -2.124001, 2.535533, 0, 0.3921569, 1, 1,
0.2503649, 0.2104768, 0.9093462, 0, 0.3882353, 1, 1,
0.2540528, -0.8656837, 2.631875, 0, 0.3803922, 1, 1,
0.2564963, 0.1687105, 1.769523, 0, 0.3764706, 1, 1,
0.2615722, 1.272027, 1.838731, 0, 0.3686275, 1, 1,
0.2651804, -0.8593934, 2.892674, 0, 0.3647059, 1, 1,
0.2665238, 0.01819306, 0.1623371, 0, 0.3568628, 1, 1,
0.2690725, -1.02413, 4.7466, 0, 0.3529412, 1, 1,
0.2691544, -0.6205847, 4.167789, 0, 0.345098, 1, 1,
0.276087, 0.2231719, 0.9225944, 0, 0.3411765, 1, 1,
0.2787405, -1.73608, 3.897686, 0, 0.3333333, 1, 1,
0.2811959, 0.6968094, 0.1168452, 0, 0.3294118, 1, 1,
0.2813324, -0.7054415, 3.031109, 0, 0.3215686, 1, 1,
0.281989, 0.2272782, 2.379787, 0, 0.3176471, 1, 1,
0.2885919, -1.522175, 2.318182, 0, 0.3098039, 1, 1,
0.2914515, 1.335926, -0.8207927, 0, 0.3058824, 1, 1,
0.2925717, 1.768145, 0.8423551, 0, 0.2980392, 1, 1,
0.2966862, -0.6279826, 2.70015, 0, 0.2901961, 1, 1,
0.3013514, -1.105272, 1.785518, 0, 0.2862745, 1, 1,
0.3021899, -1.197053, 1.993821, 0, 0.2784314, 1, 1,
0.3030644, 0.4719969, -0.5020104, 0, 0.2745098, 1, 1,
0.3031746, -0.544208, 2.192276, 0, 0.2666667, 1, 1,
0.3067733, -0.7338687, 2.627599, 0, 0.2627451, 1, 1,
0.3081079, -0.8413025, 1.587523, 0, 0.254902, 1, 1,
0.3097523, 0.659023, -0.2281539, 0, 0.2509804, 1, 1,
0.312756, 1.061411, 1.424041, 0, 0.2431373, 1, 1,
0.3148468, 0.1385177, 1.188699, 0, 0.2392157, 1, 1,
0.3154317, -0.06866444, 1.126662, 0, 0.2313726, 1, 1,
0.3155151, -0.6661602, 3.193238, 0, 0.227451, 1, 1,
0.3230911, 0.4748618, 1.497961, 0, 0.2196078, 1, 1,
0.3249591, -2.129474, 4.063771, 0, 0.2156863, 1, 1,
0.3311711, 0.1742269, 0.7730084, 0, 0.2078431, 1, 1,
0.3360834, 1.088715, -0.6464251, 0, 0.2039216, 1, 1,
0.3369428, 0.4409485, 0.7896305, 0, 0.1960784, 1, 1,
0.3416613, 0.5408835, 0.05754106, 0, 0.1882353, 1, 1,
0.3416955, 1.286685, 1.387444, 0, 0.1843137, 1, 1,
0.3436965, 0.681704, 0.964158, 0, 0.1764706, 1, 1,
0.3464223, 0.353661, 0.8731996, 0, 0.172549, 1, 1,
0.3542598, 3.641029, 0.6308202, 0, 0.1647059, 1, 1,
0.3591775, -1.70391, 4.624413, 0, 0.1607843, 1, 1,
0.3591909, -0.566755, 2.216516, 0, 0.1529412, 1, 1,
0.3605296, 1.356604, -0.7831087, 0, 0.1490196, 1, 1,
0.3625298, -1.199064, 2.393044, 0, 0.1411765, 1, 1,
0.3630123, 0.8662589, 0.2987054, 0, 0.1372549, 1, 1,
0.364367, 0.7453611, 1.876753, 0, 0.1294118, 1, 1,
0.3649159, -0.918027, 1.899516, 0, 0.1254902, 1, 1,
0.3661333, -0.5697511, 3.442174, 0, 0.1176471, 1, 1,
0.3674186, -2.137255, 2.213033, 0, 0.1137255, 1, 1,
0.3678334, 0.687587, 0.7227775, 0, 0.1058824, 1, 1,
0.3685124, 0.1514225, 2.198703, 0, 0.09803922, 1, 1,
0.3715752, 1.00285, 2.563543, 0, 0.09411765, 1, 1,
0.3721636, 0.4708889, 1.424811, 0, 0.08627451, 1, 1,
0.3771488, 0.213989, -1.512331, 0, 0.08235294, 1, 1,
0.3776211, 0.8184159, 0.6025842, 0, 0.07450981, 1, 1,
0.3790674, 0.217021, -0.4346044, 0, 0.07058824, 1, 1,
0.381007, 0.4155459, 1.468295, 0, 0.0627451, 1, 1,
0.383888, 1.559808, 0.7395694, 0, 0.05882353, 1, 1,
0.3874897, -1.126853, 2.180431, 0, 0.05098039, 1, 1,
0.387678, 0.1064955, 2.04095, 0, 0.04705882, 1, 1,
0.3882098, 0.7886456, -0.2305871, 0, 0.03921569, 1, 1,
0.3924575, 2.076968, 0.9454406, 0, 0.03529412, 1, 1,
0.3950482, 0.6736349, 2.644359, 0, 0.02745098, 1, 1,
0.3954498, -0.3704289, 1.482687, 0, 0.02352941, 1, 1,
0.396006, 0.1332847, 0.8507973, 0, 0.01568628, 1, 1,
0.4037613, 2.093206, -0.3716319, 0, 0.01176471, 1, 1,
0.4046549, -1.146192, 1.44578, 0, 0.003921569, 1, 1,
0.4049835, -0.1839823, 0.1747349, 0.003921569, 0, 1, 1,
0.4052463, 0.7499967, 1.842585, 0.007843138, 0, 1, 1,
0.409605, -0.3212964, 2.037639, 0.01568628, 0, 1, 1,
0.4109714, 0.5974954, -0.7520853, 0.01960784, 0, 1, 1,
0.4132408, 0.1738381, 2.145917, 0.02745098, 0, 1, 1,
0.4162091, 0.49408, 0.628668, 0.03137255, 0, 1, 1,
0.4177949, -0.5240483, 1.52149, 0.03921569, 0, 1, 1,
0.4183742, 0.3906195, 2.446859, 0.04313726, 0, 1, 1,
0.4200745, -0.3456943, 2.831375, 0.05098039, 0, 1, 1,
0.4264495, -1.977651, 2.822256, 0.05490196, 0, 1, 1,
0.4283203, 0.4221826, -0.362925, 0.0627451, 0, 1, 1,
0.4330821, -0.6516265, 1.239352, 0.06666667, 0, 1, 1,
0.4351627, 0.03218549, 2.113699, 0.07450981, 0, 1, 1,
0.4404708, 0.04463612, 1.719149, 0.07843138, 0, 1, 1,
0.4519233, -1.293021, 4.670772, 0.08627451, 0, 1, 1,
0.4623366, -1.850192, 1.881103, 0.09019608, 0, 1, 1,
0.4642147, -0.04665085, 2.94314, 0.09803922, 0, 1, 1,
0.464928, 0.06312829, 1.920261, 0.1058824, 0, 1, 1,
0.4672396, -1.014177, 3.661189, 0.1098039, 0, 1, 1,
0.4676143, 1.587283, 1.712405, 0.1176471, 0, 1, 1,
0.4704139, 0.1622397, -0.5555773, 0.1215686, 0, 1, 1,
0.4708869, 2.217452, -0.0397163, 0.1294118, 0, 1, 1,
0.4717502, 0.3402952, -0.6408885, 0.1333333, 0, 1, 1,
0.4761143, -0.1801173, 3.313275, 0.1411765, 0, 1, 1,
0.4768915, 2.025271, -1.236757, 0.145098, 0, 1, 1,
0.4771761, -0.01346565, 1.177812, 0.1529412, 0, 1, 1,
0.4785356, -0.8215858, 4.0919, 0.1568628, 0, 1, 1,
0.4795025, -0.5345223, 1.569903, 0.1647059, 0, 1, 1,
0.481458, 1.073962, 0.4404042, 0.1686275, 0, 1, 1,
0.4826455, 0.04453522, 1.906902, 0.1764706, 0, 1, 1,
0.482753, 0.2248758, 0.9032152, 0.1803922, 0, 1, 1,
0.4837445, 0.3078263, 0.4204007, 0.1882353, 0, 1, 1,
0.4898867, 0.3174624, 0.6162357, 0.1921569, 0, 1, 1,
0.4928959, -0.8207579, 2.788083, 0.2, 0, 1, 1,
0.4948028, 0.0340068, 1.371192, 0.2078431, 0, 1, 1,
0.4949642, 0.1004447, 2.489071, 0.2117647, 0, 1, 1,
0.4975558, 0.1982428, 2.764638, 0.2196078, 0, 1, 1,
0.4984722, -0.06562974, 3.746724, 0.2235294, 0, 1, 1,
0.4985424, -0.3157457, 1.33536, 0.2313726, 0, 1, 1,
0.511399, 0.3891428, 1.495115, 0.2352941, 0, 1, 1,
0.5169746, -0.2088478, 2.892302, 0.2431373, 0, 1, 1,
0.5194436, 0.01034254, 2.948318, 0.2470588, 0, 1, 1,
0.5213294, -0.5343012, 2.119462, 0.254902, 0, 1, 1,
0.5215806, 1.041013, 1.686702, 0.2588235, 0, 1, 1,
0.5229919, -0.6707701, 1.20601, 0.2666667, 0, 1, 1,
0.5255753, -0.19167, -0.51938, 0.2705882, 0, 1, 1,
0.5258436, 1.015707, 1.928235, 0.2784314, 0, 1, 1,
0.542173, -1.185987, 2.591669, 0.282353, 0, 1, 1,
0.5485771, 1.369131, -0.3368839, 0.2901961, 0, 1, 1,
0.5491279, 0.5029104, 2.269568, 0.2941177, 0, 1, 1,
0.5493641, -0.3296557, 1.771164, 0.3019608, 0, 1, 1,
0.5524157, 0.6668506, 1.011099, 0.3098039, 0, 1, 1,
0.5525134, -1.540386, 3.831196, 0.3137255, 0, 1, 1,
0.5535797, 0.4473459, 1.155582, 0.3215686, 0, 1, 1,
0.5563124, 0.4848316, 0.2164887, 0.3254902, 0, 1, 1,
0.5570357, -0.9006249, 2.473993, 0.3333333, 0, 1, 1,
0.5614788, 1.352615, -0.0655921, 0.3372549, 0, 1, 1,
0.5665483, -1.033803, 3.606781, 0.345098, 0, 1, 1,
0.5712001, -0.2611775, 2.886165, 0.3490196, 0, 1, 1,
0.5778672, -0.660651, 2.981386, 0.3568628, 0, 1, 1,
0.5787777, 1.276559, 1.137638, 0.3607843, 0, 1, 1,
0.5821591, 0.7759361, 1.332842, 0.3686275, 0, 1, 1,
0.5874065, 0.5773174, 0.2537575, 0.372549, 0, 1, 1,
0.588775, 1.115487, 1.081658, 0.3803922, 0, 1, 1,
0.5900777, -0.9193197, 3.443049, 0.3843137, 0, 1, 1,
0.5909141, 0.6610835, -0.1357683, 0.3921569, 0, 1, 1,
0.5915574, -1.199253, 2.235856, 0.3960784, 0, 1, 1,
0.5916582, 0.2609421, 1.880306, 0.4039216, 0, 1, 1,
0.5983244, -1.509694, 2.153412, 0.4117647, 0, 1, 1,
0.5996256, -0.6955584, 3.483977, 0.4156863, 0, 1, 1,
0.6003342, 0.2902581, 0.1841938, 0.4235294, 0, 1, 1,
0.6030174, 1.673189, -0.7710833, 0.427451, 0, 1, 1,
0.6032632, 0.2483018, 0.2226351, 0.4352941, 0, 1, 1,
0.6056398, -0.6278034, 2.955675, 0.4392157, 0, 1, 1,
0.6061822, -0.7918992, 3.68487, 0.4470588, 0, 1, 1,
0.6075017, -3.266261, 2.916505, 0.4509804, 0, 1, 1,
0.6087358, -0.3383001, 2.244175, 0.4588235, 0, 1, 1,
0.6110736, 0.4705271, 1.599321, 0.4627451, 0, 1, 1,
0.6146857, 1.197816, 1.658058, 0.4705882, 0, 1, 1,
0.6182322, 0.8267617, 1.377465, 0.4745098, 0, 1, 1,
0.6219437, -0.661957, 2.845653, 0.4823529, 0, 1, 1,
0.6255552, 0.7784817, 1.346698, 0.4862745, 0, 1, 1,
0.6279262, -2.290305, 3.014878, 0.4941176, 0, 1, 1,
0.629257, 1.115168, -0.7998083, 0.5019608, 0, 1, 1,
0.6367304, 0.8705696, -0.04624013, 0.5058824, 0, 1, 1,
0.6389431, 0.3073187, 0.6488534, 0.5137255, 0, 1, 1,
0.6457031, 0.7053435, 0.9084701, 0.5176471, 0, 1, 1,
0.645883, 1.121157, -0.5286446, 0.5254902, 0, 1, 1,
0.6477136, -1.536709, 1.943051, 0.5294118, 0, 1, 1,
0.6543893, -0.4708776, 0.9467322, 0.5372549, 0, 1, 1,
0.6589301, -0.9034077, 4.490675, 0.5411765, 0, 1, 1,
0.6676407, -0.112238, 1.410591, 0.5490196, 0, 1, 1,
0.670898, 0.8338181, 0.2439152, 0.5529412, 0, 1, 1,
0.6711409, -0.6657241, 1.772711, 0.5607843, 0, 1, 1,
0.6744862, 0.1618948, 0.3989375, 0.5647059, 0, 1, 1,
0.6746526, 0.2167838, 2.48511, 0.572549, 0, 1, 1,
0.6755768, 0.4404389, 2.224224, 0.5764706, 0, 1, 1,
0.6767223, -0.9415652, 0.6466638, 0.5843138, 0, 1, 1,
0.6772543, 0.6432962, 2.903477, 0.5882353, 0, 1, 1,
0.6788385, 0.2923625, -0.6763831, 0.5960785, 0, 1, 1,
0.6814673, 0.7339867, 1.222357, 0.6039216, 0, 1, 1,
0.6851569, 0.3576764, 0.6495663, 0.6078432, 0, 1, 1,
0.6875989, -0.5391868, -0.159889, 0.6156863, 0, 1, 1,
0.6906865, -0.4816686, 2.151312, 0.6196079, 0, 1, 1,
0.6931533, -1.314084, 2.074717, 0.627451, 0, 1, 1,
0.6936617, -0.06003914, 1.362272, 0.6313726, 0, 1, 1,
0.7054456, 0.3016589, 1.501796, 0.6392157, 0, 1, 1,
0.7104189, 0.2975509, 0.9033239, 0.6431373, 0, 1, 1,
0.7131981, 1.475143, -0.6999946, 0.6509804, 0, 1, 1,
0.7156509, -0.0469416, 1.266801, 0.654902, 0, 1, 1,
0.7235166, -1.576641, 2.696717, 0.6627451, 0, 1, 1,
0.7236947, 0.4504407, 1.372563, 0.6666667, 0, 1, 1,
0.7271125, 0.1189015, -0.4418629, 0.6745098, 0, 1, 1,
0.7326751, -0.2456438, 0.8518313, 0.6784314, 0, 1, 1,
0.7359046, -1.196385, 3.805219, 0.6862745, 0, 1, 1,
0.7381214, 0.8884513, 0.8111938, 0.6901961, 0, 1, 1,
0.7405024, 1.100213, -0.6810556, 0.6980392, 0, 1, 1,
0.7452455, -0.9327081, 2.041043, 0.7058824, 0, 1, 1,
0.7489628, -0.8538508, 2.610193, 0.7098039, 0, 1, 1,
0.7524176, -1.783182, 3.903101, 0.7176471, 0, 1, 1,
0.754495, 0.9154487, 0.6408005, 0.7215686, 0, 1, 1,
0.7568541, 0.5427301, 1.461478, 0.7294118, 0, 1, 1,
0.7571151, 0.4049577, 0.5819091, 0.7333333, 0, 1, 1,
0.7573479, 0.05760524, 2.494862, 0.7411765, 0, 1, 1,
0.7693406, 1.584871, -0.4115705, 0.7450981, 0, 1, 1,
0.7785844, -0.4782984, 0.8574624, 0.7529412, 0, 1, 1,
0.7832465, 0.6414669, 0.5717397, 0.7568628, 0, 1, 1,
0.7858384, -0.8007476, 1.700646, 0.7647059, 0, 1, 1,
0.7905716, -0.2612357, 0.5026427, 0.7686275, 0, 1, 1,
0.7917331, -1.108272, 2.776542, 0.7764706, 0, 1, 1,
0.7944438, 0.257239, 1.288804, 0.7803922, 0, 1, 1,
0.8029194, -0.3454857, 3.22336, 0.7882353, 0, 1, 1,
0.8051911, 1.60357, 0.5097152, 0.7921569, 0, 1, 1,
0.8077816, 0.3450051, 0.04659821, 0.8, 0, 1, 1,
0.8086343, 0.1253951, 2.067775, 0.8078431, 0, 1, 1,
0.8214511, -1.673663, 1.830284, 0.8117647, 0, 1, 1,
0.8294659, -1.468326, 2.586637, 0.8196079, 0, 1, 1,
0.8336557, -1.331258, 2.669501, 0.8235294, 0, 1, 1,
0.8358138, -0.5770172, 1.429383, 0.8313726, 0, 1, 1,
0.8393571, -0.4159184, 1.765708, 0.8352941, 0, 1, 1,
0.8410112, 0.8210087, 0.5812976, 0.8431373, 0, 1, 1,
0.8412761, 0.3660594, 1.873055, 0.8470588, 0, 1, 1,
0.842068, 1.08421, 1.364228, 0.854902, 0, 1, 1,
0.8445295, 0.54646, 2.59462, 0.8588235, 0, 1, 1,
0.8447473, -1.640817, 1.657207, 0.8666667, 0, 1, 1,
0.8520141, -0.7394049, 1.585248, 0.8705882, 0, 1, 1,
0.8526006, 0.7220004, -0.19349, 0.8784314, 0, 1, 1,
0.8599522, -1.728411, 3.24807, 0.8823529, 0, 1, 1,
0.8650121, 2.344532, 0.4047835, 0.8901961, 0, 1, 1,
0.8660525, -1.890969, 0.8184997, 0.8941177, 0, 1, 1,
0.8662515, 0.6031738, -0.9597619, 0.9019608, 0, 1, 1,
0.8691083, 0.5298401, 0.178706, 0.9098039, 0, 1, 1,
0.869248, -0.4081554, 2.354777, 0.9137255, 0, 1, 1,
0.8772709, 0.1516954, 1.578666, 0.9215686, 0, 1, 1,
0.8775281, -0.4381537, 2.922814, 0.9254902, 0, 1, 1,
0.8778461, -1.17263, 2.577035, 0.9333333, 0, 1, 1,
0.8900653, 1.643709, 1.601498, 0.9372549, 0, 1, 1,
0.8923464, -1.982147, 4.69541, 0.945098, 0, 1, 1,
0.8937669, 0.9346687, -0.8449504, 0.9490196, 0, 1, 1,
0.8948306, -0.3168575, 0.6477636, 0.9568627, 0, 1, 1,
0.8963886, 0.5224383, 1.972875, 0.9607843, 0, 1, 1,
0.9046225, 0.7038453, 1.178231, 0.9686275, 0, 1, 1,
0.9052125, 0.4508252, 0.7341399, 0.972549, 0, 1, 1,
0.9104536, -0.3532274, -0.1457017, 0.9803922, 0, 1, 1,
0.9106891, 1.106646, 1.391072, 0.9843137, 0, 1, 1,
0.9133036, 0.3666542, 2.813869, 0.9921569, 0, 1, 1,
0.9148228, -1.986436, 4.554018, 0.9960784, 0, 1, 1,
0.9233401, 0.3939967, 0.7110794, 1, 0, 0.9960784, 1,
0.9331446, 0.7587569, 1.712837, 1, 0, 0.9882353, 1,
0.9454907, 3.256074, -0.1017696, 1, 0, 0.9843137, 1,
0.9466728, -0.7683035, 2.746775, 1, 0, 0.9764706, 1,
0.9518292, -0.9693892, 3.883656, 1, 0, 0.972549, 1,
0.9533872, 0.4184831, 0.5175105, 1, 0, 0.9647059, 1,
0.9536481, 0.4660268, 1.328596, 1, 0, 0.9607843, 1,
0.9539972, -1.811596, 2.867517, 1, 0, 0.9529412, 1,
0.9546268, 0.4864661, 0.1862029, 1, 0, 0.9490196, 1,
0.9563383, -0.532443, 0.9873829, 1, 0, 0.9411765, 1,
0.9575324, -1.147868, 2.153487, 1, 0, 0.9372549, 1,
0.9627902, 0.8334564, 2.509337, 1, 0, 0.9294118, 1,
0.9649811, 0.210153, -0.4281819, 1, 0, 0.9254902, 1,
0.9772371, -1.099301, 3.490099, 1, 0, 0.9176471, 1,
0.9794377, -0.01402678, 1.085775, 1, 0, 0.9137255, 1,
0.9796275, -1.098994, 2.105476, 1, 0, 0.9058824, 1,
0.9860228, -1.54446, 1.194508, 1, 0, 0.9019608, 1,
0.9869708, 0.5621072, 0.9820341, 1, 0, 0.8941177, 1,
0.9908825, -0.9183103, 2.059793, 1, 0, 0.8862745, 1,
0.9977095, 0.4484444, 1.418119, 1, 0, 0.8823529, 1,
0.9979557, 0.7557268, -0.8728556, 1, 0, 0.8745098, 1,
1.005426, 0.03805489, 1.702406, 1, 0, 0.8705882, 1,
1.010219, 0.7817771, 1.313165, 1, 0, 0.8627451, 1,
1.01244, 0.6364583, 0.7099753, 1, 0, 0.8588235, 1,
1.014848, 0.7612087, 0.3964666, 1, 0, 0.8509804, 1,
1.016916, -0.5852593, 1.876837, 1, 0, 0.8470588, 1,
1.017922, -0.3453306, 2.501481, 1, 0, 0.8392157, 1,
1.022838, -2.42304, 2.167554, 1, 0, 0.8352941, 1,
1.025862, -0.4767022, 0.8735892, 1, 0, 0.827451, 1,
1.028244, 1.105487, 1.592063, 1, 0, 0.8235294, 1,
1.028605, -1.586613, 2.456272, 1, 0, 0.8156863, 1,
1.03604, -0.336132, 2.616984, 1, 0, 0.8117647, 1,
1.038833, 1.132072, 1.936033, 1, 0, 0.8039216, 1,
1.042288, -1.239408, 0.7714596, 1, 0, 0.7960784, 1,
1.050149, 1.860229, 1.392703, 1, 0, 0.7921569, 1,
1.065286, -1.18298, 0.3473574, 1, 0, 0.7843137, 1,
1.075961, -0.6223739, 1.953937, 1, 0, 0.7803922, 1,
1.078538, -0.06579159, 2.069593, 1, 0, 0.772549, 1,
1.084042, 2.618628, 0.5091655, 1, 0, 0.7686275, 1,
1.089367, -0.08223746, 0.1308114, 1, 0, 0.7607843, 1,
1.089465, -0.005696223, 1.117841, 1, 0, 0.7568628, 1,
1.089513, 0.5851675, 0.5424874, 1, 0, 0.7490196, 1,
1.092286, 0.8511291, 0.1213577, 1, 0, 0.7450981, 1,
1.095954, 0.5457946, 1.204181, 1, 0, 0.7372549, 1,
1.097064, -0.2410077, 1.756202, 1, 0, 0.7333333, 1,
1.101342, -0.607031, 2.912046, 1, 0, 0.7254902, 1,
1.118357, 0.3565231, -0.3356895, 1, 0, 0.7215686, 1,
1.119864, 1.843485, 1.124065, 1, 0, 0.7137255, 1,
1.123462, 0.377296, 1.174119, 1, 0, 0.7098039, 1,
1.124181, 1.545824, -1.141975, 1, 0, 0.7019608, 1,
1.12516, 0.9919525, -0.8002598, 1, 0, 0.6941177, 1,
1.130984, -0.0433839, 0.6935237, 1, 0, 0.6901961, 1,
1.132568, 0.9929587, 1.395836, 1, 0, 0.682353, 1,
1.133109, 0.7721148, -1.050789, 1, 0, 0.6784314, 1,
1.13743, -0.6792626, 2.15178, 1, 0, 0.6705883, 1,
1.139459, -0.746265, 3.20019, 1, 0, 0.6666667, 1,
1.145874, 1.388161, 2.697445, 1, 0, 0.6588235, 1,
1.146355, -1.19122, 2.685338, 1, 0, 0.654902, 1,
1.147124, 0.5401031, -0.0399997, 1, 0, 0.6470588, 1,
1.149106, 0.2692972, 0.2360885, 1, 0, 0.6431373, 1,
1.15016, 0.2444106, 0.9634527, 1, 0, 0.6352941, 1,
1.150934, 0.4071411, 1.948328, 1, 0, 0.6313726, 1,
1.154835, -1.994659, 4.043826, 1, 0, 0.6235294, 1,
1.166375, -1.276208, 2.731354, 1, 0, 0.6196079, 1,
1.166597, 0.5580844, 0.4582996, 1, 0, 0.6117647, 1,
1.170601, 1.673962, 2.365519, 1, 0, 0.6078432, 1,
1.19448, 0.8680872, 2.593108, 1, 0, 0.6, 1,
1.199163, -1.729879, 2.897443, 1, 0, 0.5921569, 1,
1.199824, 1.495894, 1.013693, 1, 0, 0.5882353, 1,
1.202996, 0.3059624, 1.106707, 1, 0, 0.5803922, 1,
1.209645, -1.625276, 1.974952, 1, 0, 0.5764706, 1,
1.21362, 0.1767414, 1.012649, 1, 0, 0.5686275, 1,
1.21742, 0.923259, 3.481041, 1, 0, 0.5647059, 1,
1.217464, 0.4951812, 2.148549, 1, 0, 0.5568628, 1,
1.218078, -0.1285865, 2.180151, 1, 0, 0.5529412, 1,
1.230868, -0.497137, 1.562551, 1, 0, 0.5450981, 1,
1.249143, -0.9070036, 0.9090381, 1, 0, 0.5411765, 1,
1.253944, -0.5992363, 2.671279, 1, 0, 0.5333334, 1,
1.256066, -1.926131, 2.651891, 1, 0, 0.5294118, 1,
1.272353, -0.7523701, 4.289788, 1, 0, 0.5215687, 1,
1.282764, 0.7824841, 1.39834, 1, 0, 0.5176471, 1,
1.284388, 0.6972347, 1.178466, 1, 0, 0.509804, 1,
1.298108, 0.08495507, 3.341346, 1, 0, 0.5058824, 1,
1.306713, -0.02041611, 0.1418561, 1, 0, 0.4980392, 1,
1.317694, -0.3768585, 2.052583, 1, 0, 0.4901961, 1,
1.330374, -0.9249992, 3.257922, 1, 0, 0.4862745, 1,
1.342373, -2.348067, 3.731007, 1, 0, 0.4784314, 1,
1.343214, 0.7201868, -0.255911, 1, 0, 0.4745098, 1,
1.345402, -0.3568127, 2.334653, 1, 0, 0.4666667, 1,
1.350201, -0.7901576, 2.220801, 1, 0, 0.4627451, 1,
1.364409, -1.59524, 1.369591, 1, 0, 0.454902, 1,
1.364459, -1.0548, 2.47481, 1, 0, 0.4509804, 1,
1.368614, -0.9064786, 2.100017, 1, 0, 0.4431373, 1,
1.37498, -0.4654803, 2.111658, 1, 0, 0.4392157, 1,
1.399933, 0.179281, 0.9469203, 1, 0, 0.4313726, 1,
1.400806, 2.225958, 0.1813613, 1, 0, 0.427451, 1,
1.400929, -0.2606257, 2.30924, 1, 0, 0.4196078, 1,
1.41389, -0.8338888, 1.454442, 1, 0, 0.4156863, 1,
1.434653, 0.007454669, 1.357144, 1, 0, 0.4078431, 1,
1.441656, 0.4575056, 1.846716, 1, 0, 0.4039216, 1,
1.458997, 0.9073206, 0.8926458, 1, 0, 0.3960784, 1,
1.460717, 1.714475, 1.354856, 1, 0, 0.3882353, 1,
1.466143, -0.8977713, 2.52128, 1, 0, 0.3843137, 1,
1.468847, 1.09396, 0.7578566, 1, 0, 0.3764706, 1,
1.471997, -1.215279, 3.8523, 1, 0, 0.372549, 1,
1.479414, -1.062415, 2.191158, 1, 0, 0.3647059, 1,
1.486935, 0.9504775, 0.05782113, 1, 0, 0.3607843, 1,
1.492774, 1.205793, 0.3776324, 1, 0, 0.3529412, 1,
1.500046, -0.08264615, -0.457108, 1, 0, 0.3490196, 1,
1.502366, -0.6214729, 2.5985, 1, 0, 0.3411765, 1,
1.518437, -0.2106296, 1.071151, 1, 0, 0.3372549, 1,
1.52496, 0.5350658, -0.3022385, 1, 0, 0.3294118, 1,
1.546162, -0.3288573, 1.313636, 1, 0, 0.3254902, 1,
1.558397, 1.939076, 2.082126, 1, 0, 0.3176471, 1,
1.576459, -0.4154616, 0.745989, 1, 0, 0.3137255, 1,
1.582452, -0.6647968, 0.5816327, 1, 0, 0.3058824, 1,
1.582753, 1.712409, 1.207161, 1, 0, 0.2980392, 1,
1.66749, 1.389862, -1.118121, 1, 0, 0.2941177, 1,
1.695282, 0.7219111, 0.9008006, 1, 0, 0.2862745, 1,
1.699919, -0.4322764, 1.281184, 1, 0, 0.282353, 1,
1.700028, -0.1672378, -0.04046828, 1, 0, 0.2745098, 1,
1.700057, -0.9709789, 1.549905, 1, 0, 0.2705882, 1,
1.703837, 0.950271, 0.3618923, 1, 0, 0.2627451, 1,
1.717745, -0.2851847, 4.104634, 1, 0, 0.2588235, 1,
1.722576, 0.1569899, 2.021009, 1, 0, 0.2509804, 1,
1.723722, 0.2992638, 0.6335523, 1, 0, 0.2470588, 1,
1.723924, -1.530868, 3.838011, 1, 0, 0.2392157, 1,
1.725839, -1.131998, 1.336943, 1, 0, 0.2352941, 1,
1.745155, -0.6767412, 1.617636, 1, 0, 0.227451, 1,
1.751093, -1.164476, 3.746987, 1, 0, 0.2235294, 1,
1.782169, -0.4539044, 0.4065071, 1, 0, 0.2156863, 1,
1.782194, -1.144389, 3.597306, 1, 0, 0.2117647, 1,
1.792905, -0.1495369, 1.751533, 1, 0, 0.2039216, 1,
1.799875, -1.29583, 1.872405, 1, 0, 0.1960784, 1,
1.803937, 0.5738205, -0.4234338, 1, 0, 0.1921569, 1,
1.833078, -1.563348, 1.441158, 1, 0, 0.1843137, 1,
1.835079, 0.1947657, 2.219863, 1, 0, 0.1803922, 1,
1.870971, -1.455884, 1.358905, 1, 0, 0.172549, 1,
1.873241, -2.556869, 2.584062, 1, 0, 0.1686275, 1,
1.874766, -1.121786, 2.136664, 1, 0, 0.1607843, 1,
1.889654, -2.373188, 3.299039, 1, 0, 0.1568628, 1,
1.891628, 0.8708516, 2.006759, 1, 0, 0.1490196, 1,
1.905426, -1.139243, 2.49281, 1, 0, 0.145098, 1,
1.917444, 0.09321452, 1.532882, 1, 0, 0.1372549, 1,
1.943819, 0.7523937, -0.4266838, 1, 0, 0.1333333, 1,
1.946897, -0.2124623, 1.658734, 1, 0, 0.1254902, 1,
1.985173, -0.5377674, 1.387442, 1, 0, 0.1215686, 1,
2.023778, 0.2948538, 2.553103, 1, 0, 0.1137255, 1,
2.03085, -0.3366245, 0.7888881, 1, 0, 0.1098039, 1,
2.067255, 1.884443, 0.3634864, 1, 0, 0.1019608, 1,
2.086552, 0.3159195, 0.9977998, 1, 0, 0.09411765, 1,
2.110987, -1.357786, 1.683499, 1, 0, 0.09019608, 1,
2.128407, -1.155587, 3.321146, 1, 0, 0.08235294, 1,
2.141118, -1.184121, 0.5997783, 1, 0, 0.07843138, 1,
2.263257, -0.9064639, 2.057044, 1, 0, 0.07058824, 1,
2.371145, 1.37427, 2.02068, 1, 0, 0.06666667, 1,
2.408117, -0.7771428, 1.798482, 1, 0, 0.05882353, 1,
2.502959, -0.1327427, 2.467922, 1, 0, 0.05490196, 1,
2.555831, 1.408798, 0.2959968, 1, 0, 0.04705882, 1,
2.577106, -0.8932812, 2.350995, 1, 0, 0.04313726, 1,
2.600981, -0.897988, 2.83933, 1, 0, 0.03529412, 1,
2.83974, 3.355216, 1.668459, 1, 0, 0.03137255, 1,
2.907453, -0.1549127, 0.5192102, 1, 0, 0.02352941, 1,
2.969385, -0.4461824, -0.717353, 1, 0, 0.01960784, 1,
3.100821, 0.6668823, 2.118282, 1, 0, 0.01176471, 1,
3.929025, -0.4173302, 2.509928, 1, 0, 0.007843138, 1
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
0.3232867, -5.025561, -6.784883, 0, -0.5, 0.5, 0.5,
0.3232867, -5.025561, -6.784883, 1, -0.5, 0.5, 0.5,
0.3232867, -5.025561, -6.784883, 1, 1.5, 0.5, 0.5,
0.3232867, -5.025561, -6.784883, 0, 1.5, 0.5, 0.5
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
-4.504797, -0.06422544, -6.784883, 0, -0.5, 0.5, 0.5,
-4.504797, -0.06422544, -6.784883, 1, -0.5, 0.5, 0.5,
-4.504797, -0.06422544, -6.784883, 1, 1.5, 0.5, 0.5,
-4.504797, -0.06422544, -6.784883, 0, 1.5, 0.5, 0.5
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
-4.504797, -5.025561, 0.166024, 0, -0.5, 0.5, 0.5,
-4.504797, -5.025561, 0.166024, 1, -0.5, 0.5, 0.5,
-4.504797, -5.025561, 0.166024, 1, 1.5, 0.5, 0.5,
-4.504797, -5.025561, 0.166024, 0, 1.5, 0.5, 0.5
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
-2, -3.880637, -5.180828,
2, -3.880637, -5.180828,
-2, -3.880637, -5.180828,
-2, -4.071458, -5.448171,
0, -3.880637, -5.180828,
0, -4.071458, -5.448171,
2, -3.880637, -5.180828,
2, -4.071458, -5.448171
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
-2, -4.453099, -5.982856, 0, -0.5, 0.5, 0.5,
-2, -4.453099, -5.982856, 1, -0.5, 0.5, 0.5,
-2, -4.453099, -5.982856, 1, 1.5, 0.5, 0.5,
-2, -4.453099, -5.982856, 0, 1.5, 0.5, 0.5,
0, -4.453099, -5.982856, 0, -0.5, 0.5, 0.5,
0, -4.453099, -5.982856, 1, -0.5, 0.5, 0.5,
0, -4.453099, -5.982856, 1, 1.5, 0.5, 0.5,
0, -4.453099, -5.982856, 0, 1.5, 0.5, 0.5,
2, -4.453099, -5.982856, 0, -0.5, 0.5, 0.5,
2, -4.453099, -5.982856, 1, -0.5, 0.5, 0.5,
2, -4.453099, -5.982856, 1, 1.5, 0.5, 0.5,
2, -4.453099, -5.982856, 0, 1.5, 0.5, 0.5
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
-3.390624, -2, -5.180828,
-3.390624, 2, -5.180828,
-3.390624, -2, -5.180828,
-3.576319, -2, -5.448171,
-3.390624, 0, -5.180828,
-3.576319, 0, -5.448171,
-3.390624, 2, -5.180828,
-3.576319, 2, -5.448171
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
-3.94771, -2, -5.982856, 0, -0.5, 0.5, 0.5,
-3.94771, -2, -5.982856, 1, -0.5, 0.5, 0.5,
-3.94771, -2, -5.982856, 1, 1.5, 0.5, 0.5,
-3.94771, -2, -5.982856, 0, 1.5, 0.5, 0.5,
-3.94771, 0, -5.982856, 0, -0.5, 0.5, 0.5,
-3.94771, 0, -5.982856, 1, -0.5, 0.5, 0.5,
-3.94771, 0, -5.982856, 1, 1.5, 0.5, 0.5,
-3.94771, 0, -5.982856, 0, 1.5, 0.5, 0.5,
-3.94771, 2, -5.982856, 0, -0.5, 0.5, 0.5,
-3.94771, 2, -5.982856, 1, -0.5, 0.5, 0.5,
-3.94771, 2, -5.982856, 1, 1.5, 0.5, 0.5,
-3.94771, 2, -5.982856, 0, 1.5, 0.5, 0.5
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
-3.390624, -3.880637, -4,
-3.390624, -3.880637, 4,
-3.390624, -3.880637, -4,
-3.576319, -4.071458, -4,
-3.390624, -3.880637, -2,
-3.576319, -4.071458, -2,
-3.390624, -3.880637, 0,
-3.576319, -4.071458, 0,
-3.390624, -3.880637, 2,
-3.576319, -4.071458, 2,
-3.390624, -3.880637, 4,
-3.576319, -4.071458, 4
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
-3.94771, -4.453099, -4, 0, -0.5, 0.5, 0.5,
-3.94771, -4.453099, -4, 1, -0.5, 0.5, 0.5,
-3.94771, -4.453099, -4, 1, 1.5, 0.5, 0.5,
-3.94771, -4.453099, -4, 0, 1.5, 0.5, 0.5,
-3.94771, -4.453099, -2, 0, -0.5, 0.5, 0.5,
-3.94771, -4.453099, -2, 1, -0.5, 0.5, 0.5,
-3.94771, -4.453099, -2, 1, 1.5, 0.5, 0.5,
-3.94771, -4.453099, -2, 0, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 0, 0, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 0, 1, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 0, 1, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 0, 0, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 2, 0, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 2, 1, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 2, 1, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 2, 0, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 4, 0, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 4, 1, -0.5, 0.5, 0.5,
-3.94771, -4.453099, 4, 1, 1.5, 0.5, 0.5,
-3.94771, -4.453099, 4, 0, 1.5, 0.5, 0.5
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
-3.390624, -3.880637, -5.180828,
-3.390624, 3.752187, -5.180828,
-3.390624, -3.880637, 5.512876,
-3.390624, 3.752187, 5.512876,
-3.390624, -3.880637, -5.180828,
-3.390624, -3.880637, 5.512876,
-3.390624, 3.752187, -5.180828,
-3.390624, 3.752187, 5.512876,
-3.390624, -3.880637, -5.180828,
4.037197, -3.880637, -5.180828,
-3.390624, -3.880637, 5.512876,
4.037197, -3.880637, 5.512876,
-3.390624, 3.752187, -5.180828,
4.037197, 3.752187, -5.180828,
-3.390624, 3.752187, 5.512876,
4.037197, 3.752187, 5.512876,
4.037197, -3.880637, -5.180828,
4.037197, 3.752187, -5.180828,
4.037197, -3.880637, 5.512876,
4.037197, 3.752187, 5.512876,
4.037197, -3.880637, -5.180828,
4.037197, -3.880637, 5.512876,
4.037197, 3.752187, -5.180828,
4.037197, 3.752187, 5.512876
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
var radius = 8.059177;
var distance = 35.85619;
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
mvMatrix.translate( -0.3232867, 0.06422544, -0.166024 );
mvMatrix.scale( 1.173122, 1.141614, 0.8148477 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85619);
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
pirate<-read.table("pirate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pirate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
```

```r
y<-pirate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
```

```r
z<-pirate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
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
-3.282451, -1.736679, -2.973669, 0, 0, 1, 1, 1,
-3.120289, 1.490036, -1.265924, 1, 0, 0, 1, 1,
-3.044872, 1.627262, 0.1555285, 1, 0, 0, 1, 1,
-2.730017, 1.309652, -1.007468, 1, 0, 0, 1, 1,
-2.715866, 0.6754622, -2.82526, 1, 0, 0, 1, 1,
-2.629871, 0.1713817, -1.888251, 1, 0, 0, 1, 1,
-2.531554, -1.256116, -1.168803, 0, 0, 0, 1, 1,
-2.509614, 0.7454472, -2.363909, 0, 0, 0, 1, 1,
-2.488753, 1.419378, -1.679062, 0, 0, 0, 1, 1,
-2.370802, 0.1370641, -2.912888, 0, 0, 0, 1, 1,
-2.211531, 3.086099, -0.4502498, 0, 0, 0, 1, 1,
-2.185543, -0.02804064, -2.199006, 0, 0, 0, 1, 1,
-2.182748, -0.8468118, -2.588105, 0, 0, 0, 1, 1,
-2.157669, 0.1867271, 2.119911, 1, 1, 1, 1, 1,
-2.153844, 1.585021, -0.2378842, 1, 1, 1, 1, 1,
-2.135442, -0.780341, -2.505625, 1, 1, 1, 1, 1,
-2.11711, -0.3815765, -0.8181168, 1, 1, 1, 1, 1,
-2.095178, 0.5407608, -2.128783, 1, 1, 1, 1, 1,
-2.057525, 0.0153034, 0.9650198, 1, 1, 1, 1, 1,
-2.051534, -1.995523, -2.811419, 1, 1, 1, 1, 1,
-2.02829, -0.6271013, -1.590354, 1, 1, 1, 1, 1,
-2.015347, -0.6315126, -1.019914, 1, 1, 1, 1, 1,
-2.012242, 2.063665, -1.324442, 1, 1, 1, 1, 1,
-2.004647, -0.2631952, -1.657676, 1, 1, 1, 1, 1,
-1.996806, -0.3214188, -1.093364, 1, 1, 1, 1, 1,
-1.982336, -0.679206, -3.034847, 1, 1, 1, 1, 1,
-1.979738, -1.484488, -3.344649, 1, 1, 1, 1, 1,
-1.979154, 0.7154346, 0.1250722, 1, 1, 1, 1, 1,
-1.96899, -0.2087168, -0.6730887, 0, 0, 1, 1, 1,
-1.962977, 0.3392254, -1.194937, 1, 0, 0, 1, 1,
-1.950716, 1.467187, -1.338264, 1, 0, 0, 1, 1,
-1.935708, 0.8496869, -1.4147, 1, 0, 0, 1, 1,
-1.92466, -1.191753, 0.2944, 1, 0, 0, 1, 1,
-1.895184, -0.775535, -1.87937, 1, 0, 0, 1, 1,
-1.892367, -1.83097, -1.325809, 0, 0, 0, 1, 1,
-1.878774, 1.254937, 1.070016, 0, 0, 0, 1, 1,
-1.834148, -0.6517454, -3.43324, 0, 0, 0, 1, 1,
-1.831633, -2.281257, -2.399713, 0, 0, 0, 1, 1,
-1.806267, -0.007204081, -0.7236206, 0, 0, 0, 1, 1,
-1.759294, -0.959746, -1.680888, 0, 0, 0, 1, 1,
-1.741179, -0.1402216, -2.322868, 0, 0, 0, 1, 1,
-1.723482, 1.40912, -2.426279, 1, 1, 1, 1, 1,
-1.704449, -2.051374, -1.866669, 1, 1, 1, 1, 1,
-1.703275, -0.9538653, -2.258479, 1, 1, 1, 1, 1,
-1.692614, 1.967114, -2.972582, 1, 1, 1, 1, 1,
-1.688829, -0.4563022, -1.286241, 1, 1, 1, 1, 1,
-1.686542, 0.7702186, -1.541031, 1, 1, 1, 1, 1,
-1.677464, -0.1977557, -0.7370019, 1, 1, 1, 1, 1,
-1.671453, 0.6892272, -0.215142, 1, 1, 1, 1, 1,
-1.653892, -1.308231, -2.745324, 1, 1, 1, 1, 1,
-1.649262, -0.2180751, -0.8368599, 1, 1, 1, 1, 1,
-1.629735, -0.3378399, -2.124441, 1, 1, 1, 1, 1,
-1.616467, 0.7559122, -3.063587, 1, 1, 1, 1, 1,
-1.603633, 0.3945978, -0.4935655, 1, 1, 1, 1, 1,
-1.577345, -2.390541, -2.696519, 1, 1, 1, 1, 1,
-1.561945, 0.9227963, -3.193364, 1, 1, 1, 1, 1,
-1.553712, -0.224935, -1.48989, 0, 0, 1, 1, 1,
-1.551085, -0.3121833, -2.994986, 1, 0, 0, 1, 1,
-1.550637, 1.503732, -0.7209036, 1, 0, 0, 1, 1,
-1.543176, 0.8470995, -2.361477, 1, 0, 0, 1, 1,
-1.540493, -1.123696, -2.033273, 1, 0, 0, 1, 1,
-1.531645, -0.7386686, -0.6462666, 1, 0, 0, 1, 1,
-1.517344, 0.05489797, -2.384768, 0, 0, 0, 1, 1,
-1.514665, 0.7759934, -0.1548203, 0, 0, 0, 1, 1,
-1.513187, 0.5547235, -1.810318, 0, 0, 0, 1, 1,
-1.510252, 1.179587, 0.1416909, 0, 0, 0, 1, 1,
-1.506203, 1.130671, -0.4336004, 0, 0, 0, 1, 1,
-1.498453, 1.995216, 0.3508102, 0, 0, 0, 1, 1,
-1.492655, -0.5540426, 0.006486789, 0, 0, 0, 1, 1,
-1.480964, 0.03347702, -0.5862479, 1, 1, 1, 1, 1,
-1.479447, 0.26061, -2.400941, 1, 1, 1, 1, 1,
-1.47878, 1.566751, -0.05228133, 1, 1, 1, 1, 1,
-1.474862, -1.445153, -2.299418, 1, 1, 1, 1, 1,
-1.458826, -2.494374, -2.480119, 1, 1, 1, 1, 1,
-1.42784, -0.01484079, -1.894933, 1, 1, 1, 1, 1,
-1.408463, -1.768114, -3.671304, 1, 1, 1, 1, 1,
-1.383865, 1.04408, -1.212312, 1, 1, 1, 1, 1,
-1.381419, -0.9684821, -1.759739, 1, 1, 1, 1, 1,
-1.381117, -0.9103005, -1.62248, 1, 1, 1, 1, 1,
-1.359462, 0.2533157, -0.9878254, 1, 1, 1, 1, 1,
-1.357619, -0.2036583, -2.534843, 1, 1, 1, 1, 1,
-1.345182, 0.1215083, -3.248251, 1, 1, 1, 1, 1,
-1.336396, 0.7331396, -0.7411367, 1, 1, 1, 1, 1,
-1.335953, 1.855796, -0.4678697, 1, 1, 1, 1, 1,
-1.329898, -1.037699, -3.669859, 0, 0, 1, 1, 1,
-1.326152, -0.6056786, -0.6620761, 1, 0, 0, 1, 1,
-1.323551, -1.087006, -3.64407, 1, 0, 0, 1, 1,
-1.322823, -1.847916, -2.340987, 1, 0, 0, 1, 1,
-1.319538, -0.4761249, -2.20669, 1, 0, 0, 1, 1,
-1.313609, -0.762381, -1.17429, 1, 0, 0, 1, 1,
-1.310066, 0.8777061, -0.2181222, 0, 0, 0, 1, 1,
-1.306202, 0.121145, -1.486098, 0, 0, 0, 1, 1,
-1.301672, -0.3658582, -1.707067, 0, 0, 0, 1, 1,
-1.296878, -0.6133137, -1.362752, 0, 0, 0, 1, 1,
-1.288641, 1.394605, -1.855055, 0, 0, 0, 1, 1,
-1.28156, 0.1849774, -0.9963421, 0, 0, 0, 1, 1,
-1.273582, -0.5602772, -2.855925, 0, 0, 0, 1, 1,
-1.273015, -0.07381345, -0.7769548, 1, 1, 1, 1, 1,
-1.268602, -0.6646324, -3.31269, 1, 1, 1, 1, 1,
-1.265967, 0.664927, 0.05902084, 1, 1, 1, 1, 1,
-1.263713, 0.1607146, -2.435163, 1, 1, 1, 1, 1,
-1.231305, 0.4325214, -0.6172771, 1, 1, 1, 1, 1,
-1.230791, -0.4165465, -1.970461, 1, 1, 1, 1, 1,
-1.228974, 0.06930783, -1.447319, 1, 1, 1, 1, 1,
-1.216754, -0.4872452, -2.093757, 1, 1, 1, 1, 1,
-1.211018, -0.7748023, -2.12977, 1, 1, 1, 1, 1,
-1.210693, -0.6168203, -1.06048, 1, 1, 1, 1, 1,
-1.208249, 2.106939, -1.762265, 1, 1, 1, 1, 1,
-1.206707, -0.1217216, -2.369281, 1, 1, 1, 1, 1,
-1.200884, 0.2202563, -0.7048596, 1, 1, 1, 1, 1,
-1.200687, 1.81389, -1.401028, 1, 1, 1, 1, 1,
-1.196521, -0.5756966, -0.9273338, 1, 1, 1, 1, 1,
-1.1827, -0.3860714, -3.213106, 0, 0, 1, 1, 1,
-1.180426, -1.234153, -2.868444, 1, 0, 0, 1, 1,
-1.175935, 0.9390488, -0.850871, 1, 0, 0, 1, 1,
-1.17516, -0.301914, -3.050444, 1, 0, 0, 1, 1,
-1.173496, -1.09152, -2.165976, 1, 0, 0, 1, 1,
-1.164472, 0.9040979, -0.428887, 1, 0, 0, 1, 1,
-1.13828, 0.6001403, -1.990163, 0, 0, 0, 1, 1,
-1.129207, 1.43581, -1.968575, 0, 0, 0, 1, 1,
-1.129002, 0.9760147, -2.492923, 0, 0, 0, 1, 1,
-1.124332, -1.317611, -0.7056751, 0, 0, 0, 1, 1,
-1.116043, 0.3499483, -2.315639, 0, 0, 0, 1, 1,
-1.09993, 0.5508328, -1.388683, 0, 0, 0, 1, 1,
-1.097931, 0.5921519, -0.4579225, 0, 0, 0, 1, 1,
-1.097646, 0.8423334, -2.436706, 1, 1, 1, 1, 1,
-1.095216, -0.4320026, -0.5210798, 1, 1, 1, 1, 1,
-1.095161, 0.349651, -2.075762, 1, 1, 1, 1, 1,
-1.091502, 1.037968, -1.928112, 1, 1, 1, 1, 1,
-1.085371, 0.764519, -1.008179, 1, 1, 1, 1, 1,
-1.082147, -1.105723, -0.2087266, 1, 1, 1, 1, 1,
-1.079659, 0.8169364, -1.747428, 1, 1, 1, 1, 1,
-1.076365, 0.4777616, 0.4550077, 1, 1, 1, 1, 1,
-1.071921, -0.4539432, -2.884794, 1, 1, 1, 1, 1,
-1.070643, 1.520936, -1.160604, 1, 1, 1, 1, 1,
-1.069206, 0.380455, -3.249671, 1, 1, 1, 1, 1,
-1.06873, -0.2710128, -2.626128, 1, 1, 1, 1, 1,
-1.065089, -0.1630532, -1.363911, 1, 1, 1, 1, 1,
-1.055129, -0.07262684, -1.904222, 1, 1, 1, 1, 1,
-1.05486, 0.9746966, -0.8874534, 1, 1, 1, 1, 1,
-1.042653, 1.298869, 0.7720746, 0, 0, 1, 1, 1,
-1.035747, 1.436885, 0.3364657, 1, 0, 0, 1, 1,
-1.034933, 1.513924, 0.6606066, 1, 0, 0, 1, 1,
-1.034159, -0.04730604, -1.67551, 1, 0, 0, 1, 1,
-1.033416, -0.8124372, -1.117442, 1, 0, 0, 1, 1,
-1.023383, -1.589239, -2.813278, 1, 0, 0, 1, 1,
-1.016208, 0.8674591, -0.06516154, 0, 0, 0, 1, 1,
-1.012802, 1.447427, -0.004724612, 0, 0, 0, 1, 1,
-1.011164, -1.602006, -1.659349, 0, 0, 0, 1, 1,
-1.007736, -0.2515865, -1.333304, 0, 0, 0, 1, 1,
-1.003622, 0.4503891, -1.414225, 0, 0, 0, 1, 1,
-1.000933, 1.881883, 0.4310688, 0, 0, 0, 1, 1,
-0.9966796, 0.5530954, -2.324722, 0, 0, 0, 1, 1,
-0.9966184, -1.074018, -1.007448, 1, 1, 1, 1, 1,
-0.9875348, 1.04265, -2.202751, 1, 1, 1, 1, 1,
-0.9804035, -0.2440205, -2.46044, 1, 1, 1, 1, 1,
-0.9748299, 1.221114, 1.382145, 1, 1, 1, 1, 1,
-0.9647197, -1.109001, -2.997313, 1, 1, 1, 1, 1,
-0.9623638, 0.2871391, -0.03978009, 1, 1, 1, 1, 1,
-0.9602085, -0.4740221, -2.252331, 1, 1, 1, 1, 1,
-0.9582089, -0.1574591, -2.844008, 1, 1, 1, 1, 1,
-0.9478237, -0.2781253, -1.183543, 1, 1, 1, 1, 1,
-0.9477544, 1.281078, -0.7706752, 1, 1, 1, 1, 1,
-0.9468278, 0.2982321, -2.194333, 1, 1, 1, 1, 1,
-0.9362369, -0.424449, -3.551984, 1, 1, 1, 1, 1,
-0.9283953, -0.3981859, -2.541792, 1, 1, 1, 1, 1,
-0.9254045, 0.5144367, -1.672981, 1, 1, 1, 1, 1,
-0.9237992, -1.034454, -2.727801, 1, 1, 1, 1, 1,
-0.9190589, -1.684489, -2.941982, 0, 0, 1, 1, 1,
-0.9190122, 0.7944518, 0.6400838, 1, 0, 0, 1, 1,
-0.9070739, 0.9515622, -0.6207854, 1, 0, 0, 1, 1,
-0.905695, 1.246727, -1.959155, 1, 0, 0, 1, 1,
-0.8987098, 0.7086439, 0.2874466, 1, 0, 0, 1, 1,
-0.8972395, -1.73064, -3.459258, 1, 0, 0, 1, 1,
-0.8776412, -0.5114983, -2.86461, 0, 0, 0, 1, 1,
-0.8745763, -0.5973659, -2.174513, 0, 0, 0, 1, 1,
-0.8648066, -0.3511148, -1.649969, 0, 0, 0, 1, 1,
-0.8530205, 0.05940516, -1.358769, 0, 0, 0, 1, 1,
-0.8529289, 0.02385364, -2.335455, 0, 0, 0, 1, 1,
-0.8492383, 0.5727456, -2.54647, 0, 0, 0, 1, 1,
-0.8451299, 0.2273682, -4.296121, 0, 0, 0, 1, 1,
-0.8431029, -0.3505321, -2.259289, 1, 1, 1, 1, 1,
-0.8419852, -0.9337175, -3.478137, 1, 1, 1, 1, 1,
-0.8378134, -0.2482213, -3.511527, 1, 1, 1, 1, 1,
-0.8369341, -1.416587, -2.527115, 1, 1, 1, 1, 1,
-0.8302858, 0.1468566, 0.2083623, 1, 1, 1, 1, 1,
-0.8301787, -1.01042, -1.487484, 1, 1, 1, 1, 1,
-0.8277675, -1.057166, -1.985265, 1, 1, 1, 1, 1,
-0.8269376, -1.041441, -2.395271, 1, 1, 1, 1, 1,
-0.8200362, -0.5610307, -0.7436547, 1, 1, 1, 1, 1,
-0.8180358, 0.1204828, -3.775332, 1, 1, 1, 1, 1,
-0.8178909, 0.5110143, -1.425193, 1, 1, 1, 1, 1,
-0.8126462, -0.4976911, -2.507705, 1, 1, 1, 1, 1,
-0.8113609, 0.7983075, -0.03662235, 1, 1, 1, 1, 1,
-0.8097442, 1.050017, 0.2191843, 1, 1, 1, 1, 1,
-0.8069175, -0.9645342, -2.171777, 1, 1, 1, 1, 1,
-0.805381, 0.9856068, 0.3634722, 0, 0, 1, 1, 1,
-0.785018, -1.531178, -2.789748, 1, 0, 0, 1, 1,
-0.7828063, -0.5762658, -1.476483, 1, 0, 0, 1, 1,
-0.7772646, -0.9131161, -2.949462, 1, 0, 0, 1, 1,
-0.7713208, 0.7052345, 0.09336989, 1, 0, 0, 1, 1,
-0.7702889, 1.219012, -0.3129984, 1, 0, 0, 1, 1,
-0.7521916, -1.193507, -2.197806, 0, 0, 0, 1, 1,
-0.7519271, 0.7470062, -0.2226719, 0, 0, 0, 1, 1,
-0.7476289, 0.4976015, -1.441592, 0, 0, 0, 1, 1,
-0.746032, -0.05729173, 0.1238609, 0, 0, 0, 1, 1,
-0.7459766, 0.7362388, -1.510777, 0, 0, 0, 1, 1,
-0.7456378, 0.02661755, -2.154877, 0, 0, 0, 1, 1,
-0.7418209, 0.6153497, -0.5515893, 0, 0, 0, 1, 1,
-0.7385647, 0.07915702, -1.638044, 1, 1, 1, 1, 1,
-0.734017, -1.152418, -2.979927, 1, 1, 1, 1, 1,
-0.731068, -0.3621201, -2.713598, 1, 1, 1, 1, 1,
-0.7267138, 0.2724773, -1.355865, 1, 1, 1, 1, 1,
-0.7266249, 0.6128825, -1.746155, 1, 1, 1, 1, 1,
-0.7244441, 2.535351, -0.8302122, 1, 1, 1, 1, 1,
-0.7108462, 1.928763, -0.3325999, 1, 1, 1, 1, 1,
-0.7091374, 1.431695, -2.424135, 1, 1, 1, 1, 1,
-0.7039003, 0.1415434, -2.383096, 1, 1, 1, 1, 1,
-0.6997924, 0.7420819, 0.7164203, 1, 1, 1, 1, 1,
-0.6960606, 0.5467339, -0.867368, 1, 1, 1, 1, 1,
-0.6904622, -0.9294452, -2.494351, 1, 1, 1, 1, 1,
-0.6900333, 0.007042825, -1.821354, 1, 1, 1, 1, 1,
-0.689112, -0.8389581, -4.038236, 1, 1, 1, 1, 1,
-0.6887, -1.362799, -2.251883, 1, 1, 1, 1, 1,
-0.6867489, -0.6184587, -2.96267, 0, 0, 1, 1, 1,
-0.6757262, -0.385313, -0.6366623, 1, 0, 0, 1, 1,
-0.6750361, 0.5715368, -1.333094, 1, 0, 0, 1, 1,
-0.6748627, -0.6169994, -2.935217, 1, 0, 0, 1, 1,
-0.6733286, 2.155312, 1.381675, 1, 0, 0, 1, 1,
-0.6725422, 2.600216, 1.300706, 1, 0, 0, 1, 1,
-0.6601264, 1.676246, -0.3700917, 0, 0, 0, 1, 1,
-0.6559489, 0.1625067, -2.202944, 0, 0, 0, 1, 1,
-0.6542356, 0.9082502, -0.1726963, 0, 0, 0, 1, 1,
-0.6528574, 1.433767, -0.6493024, 0, 0, 0, 1, 1,
-0.6506191, 1.135181, -0.1753465, 0, 0, 0, 1, 1,
-0.6471288, -0.2468894, -1.362536, 0, 0, 0, 1, 1,
-0.6455671, 0.8472698, -3.479558, 0, 0, 0, 1, 1,
-0.6444913, 1.072242, -0.6970636, 1, 1, 1, 1, 1,
-0.6296688, -0.04199391, 0.624991, 1, 1, 1, 1, 1,
-0.6271057, 0.6090606, -0.1878591, 1, 1, 1, 1, 1,
-0.6265607, 0.9478453, -2.618465, 1, 1, 1, 1, 1,
-0.6259225, 0.3111179, 0.02797876, 1, 1, 1, 1, 1,
-0.6254243, 1.315966, -0.897238, 1, 1, 1, 1, 1,
-0.62296, -0.276122, -0.5755727, 1, 1, 1, 1, 1,
-0.6218277, -0.8200479, -2.483769, 1, 1, 1, 1, 1,
-0.6165968, 0.4635446, -1.690767, 1, 1, 1, 1, 1,
-0.6161308, -1.155242, -1.565304, 1, 1, 1, 1, 1,
-0.6156247, 0.8471001, -0.9669257, 1, 1, 1, 1, 1,
-0.6111606, -0.5326566, -3.141205, 1, 1, 1, 1, 1,
-0.6107087, 0.9598531, 0.2382817, 1, 1, 1, 1, 1,
-0.6056414, 1.042661, -1.250299, 1, 1, 1, 1, 1,
-0.6046095, -0.6242444, -1.778661, 1, 1, 1, 1, 1,
-0.5983988, -0.1604962, -2.078891, 0, 0, 1, 1, 1,
-0.5962386, -0.4957098, -0.4364293, 1, 0, 0, 1, 1,
-0.5890455, -0.4684276, -2.739443, 1, 0, 0, 1, 1,
-0.5878528, 1.970013, 0.9438786, 1, 0, 0, 1, 1,
-0.5837278, -1.133423, -3.901878, 1, 0, 0, 1, 1,
-0.5810069, 0.5154337, -0.4173202, 1, 0, 0, 1, 1,
-0.5773637, 0.2922609, -0.8334703, 0, 0, 0, 1, 1,
-0.5759863, -0.8198478, -1.96815, 0, 0, 0, 1, 1,
-0.5741566, -1.099206, -1.335601, 0, 0, 0, 1, 1,
-0.5712596, -0.4800007, -1.841975, 0, 0, 0, 1, 1,
-0.5712162, 0.2144142, -0.9562433, 0, 0, 0, 1, 1,
-0.5651829, 1.512077, 0.1605788, 0, 0, 0, 1, 1,
-0.563734, -1.057752, -2.908884, 0, 0, 0, 1, 1,
-0.5636749, 0.5172655, -1.705158, 1, 1, 1, 1, 1,
-0.5618261, -2.104317, -2.40168, 1, 1, 1, 1, 1,
-0.5578575, 1.499603, 0.7954713, 1, 1, 1, 1, 1,
-0.5565041, -0.9667028, -3.973759, 1, 1, 1, 1, 1,
-0.5559142, 0.5486012, 0.4117683, 1, 1, 1, 1, 1,
-0.5555618, -0.5600499, -1.946329, 1, 1, 1, 1, 1,
-0.5542162, 0.8203334, -0.4862993, 1, 1, 1, 1, 1,
-0.5442729, -1.108402, -2.962886, 1, 1, 1, 1, 1,
-0.5407793, -3.76948, -3.979701, 1, 1, 1, 1, 1,
-0.5286766, -1.812077, -4.174009, 1, 1, 1, 1, 1,
-0.5284702, -0.6484075, -2.554683, 1, 1, 1, 1, 1,
-0.526124, 0.6793402, 1.124176, 1, 1, 1, 1, 1,
-0.5192313, 1.506917, -1.241043, 1, 1, 1, 1, 1,
-0.5164549, -1.262514, -3.51784, 1, 1, 1, 1, 1,
-0.5100138, -0.6622276, -3.359692, 1, 1, 1, 1, 1,
-0.5075061, 1.45668, 0.9380115, 0, 0, 1, 1, 1,
-0.5042493, 0.7099243, -0.4837238, 1, 0, 0, 1, 1,
-0.5037477, -0.5783895, -3.418124, 1, 0, 0, 1, 1,
-0.5037399, -0.8985838, -1.203686, 1, 0, 0, 1, 1,
-0.5014548, -0.02858706, -2.707536, 1, 0, 0, 1, 1,
-0.4988717, 0.7007952, -0.7387547, 1, 0, 0, 1, 1,
-0.4866868, 0.1187701, -1.680266, 0, 0, 0, 1, 1,
-0.4823062, -0.7656888, -3.667715, 0, 0, 0, 1, 1,
-0.4790412, 0.5607272, -1.53862, 0, 0, 0, 1, 1,
-0.4739119, -0.2261376, -3.828414, 0, 0, 0, 1, 1,
-0.4662582, 1.248625, 0.597684, 0, 0, 0, 1, 1,
-0.4638338, -0.3085777, -1.576669, 0, 0, 0, 1, 1,
-0.4600515, 1.284216, 1.065771, 0, 0, 0, 1, 1,
-0.459377, 1.077694, 2.123144, 1, 1, 1, 1, 1,
-0.4578216, 0.5780736, -0.480229, 1, 1, 1, 1, 1,
-0.4544397, 0.1086535, -2.79431, 1, 1, 1, 1, 1,
-0.4541968, 0.5757403, -1.414317, 1, 1, 1, 1, 1,
-0.4460373, -0.5078406, -2.250119, 1, 1, 1, 1, 1,
-0.4441393, -0.2658297, -1.9291, 1, 1, 1, 1, 1,
-0.4438807, -0.002210986, -1.419004, 1, 1, 1, 1, 1,
-0.4429671, 2.573559, 0.9391072, 1, 1, 1, 1, 1,
-0.4410633, 1.18747, 1.218018, 1, 1, 1, 1, 1,
-0.4398048, 0.5378406, 0.7155337, 1, 1, 1, 1, 1,
-0.4397037, 1.135782, -3.104775, 1, 1, 1, 1, 1,
-0.4393492, 0.2536161, -0.6382354, 1, 1, 1, 1, 1,
-0.4384242, -1.283195, -3.652872, 1, 1, 1, 1, 1,
-0.437057, -0.1518435, -0.1520254, 1, 1, 1, 1, 1,
-0.4362191, -0.7001796, -4.494014, 1, 1, 1, 1, 1,
-0.4348101, -0.6931419, -3.905946, 0, 0, 1, 1, 1,
-0.4345116, -0.594551, -2.809879, 1, 0, 0, 1, 1,
-0.4312011, -0.2462165, -2.853974, 1, 0, 0, 1, 1,
-0.429647, -0.4238578, -1.727445, 1, 0, 0, 1, 1,
-0.4292248, -1.883057, -3.089975, 1, 0, 0, 1, 1,
-0.42836, 0.8023708, -1.478857, 1, 0, 0, 1, 1,
-0.4281799, 1.246914, -1.824499, 0, 0, 0, 1, 1,
-0.4279391, 0.223267, -0.5662661, 0, 0, 0, 1, 1,
-0.4273549, -0.6463976, -2.210393, 0, 0, 0, 1, 1,
-0.4241797, -0.3058024, -2.915643, 0, 0, 0, 1, 1,
-0.4199867, 0.0370314, 0.4357923, 0, 0, 0, 1, 1,
-0.4171461, 1.24816, -0.3345768, 0, 0, 0, 1, 1,
-0.416932, 0.05133279, -1.761237, 0, 0, 0, 1, 1,
-0.4169294, -0.319263, -1.680042, 1, 1, 1, 1, 1,
-0.4127357, 1.268968, -0.1781884, 1, 1, 1, 1, 1,
-0.4050552, 1.14409, -0.7107356, 1, 1, 1, 1, 1,
-0.4038625, 0.5910727, -1.298165, 1, 1, 1, 1, 1,
-0.4033619, -0.278878, -3.220966, 1, 1, 1, 1, 1,
-0.3948962, -1.264954, -1.692608, 1, 1, 1, 1, 1,
-0.3947265, 0.06065309, -2.153132, 1, 1, 1, 1, 1,
-0.3919717, 0.483918, -1.037174, 1, 1, 1, 1, 1,
-0.3831483, 0.3145326, 0.007941921, 1, 1, 1, 1, 1,
-0.362714, -1.024071, -2.664111, 1, 1, 1, 1, 1,
-0.3572181, 0.2736626, -1.630936, 1, 1, 1, 1, 1,
-0.3484931, 0.3490393, -0.06627805, 1, 1, 1, 1, 1,
-0.3464272, 1.112466, -2.775749, 1, 1, 1, 1, 1,
-0.3453493, -1.127477, -4.323896, 1, 1, 1, 1, 1,
-0.3420355, -0.6051028, -3.066816, 1, 1, 1, 1, 1,
-0.3379948, -0.05306543, -2.375549, 0, 0, 1, 1, 1,
-0.3362446, -0.7004178, -1.383273, 1, 0, 0, 1, 1,
-0.336238, -0.8960455, -1.732222, 1, 0, 0, 1, 1,
-0.3271285, -0.5547119, -2.414407, 1, 0, 0, 1, 1,
-0.3247359, -0.6530377, -2.24262, 1, 0, 0, 1, 1,
-0.3177505, -1.742885, -2.070006, 1, 0, 0, 1, 1,
-0.3149421, 0.6706086, 1.044875, 0, 0, 0, 1, 1,
-0.310804, -0.5888395, -2.192079, 0, 0, 0, 1, 1,
-0.3107373, 3.315568, -0.108769, 0, 0, 0, 1, 1,
-0.3104845, 0.3466063, -0.9214, 0, 0, 0, 1, 1,
-0.3079576, -0.653966, -4.0548, 0, 0, 0, 1, 1,
-0.3050524, -0.6504536, -1.403649, 0, 0, 0, 1, 1,
-0.3013825, 1.420148, -0.6710204, 0, 0, 0, 1, 1,
-0.3007379, 0.4322976, -1.539894, 1, 1, 1, 1, 1,
-0.2973025, -1.718622, -4.592282, 1, 1, 1, 1, 1,
-0.2955244, 0.1582831, -0.1178431, 1, 1, 1, 1, 1,
-0.2899737, -0.8890197, -0.6920173, 1, 1, 1, 1, 1,
-0.2896336, 0.7787151, 1.243967, 1, 1, 1, 1, 1,
-0.2869915, 1.447743, -1.038267, 1, 1, 1, 1, 1,
-0.2839909, 1.008975, -1.43135, 1, 1, 1, 1, 1,
-0.2796643, -0.1536431, -0.201419, 1, 1, 1, 1, 1,
-0.2790797, 1.859395, 0.5470481, 1, 1, 1, 1, 1,
-0.2786589, 0.7106967, 0.1241125, 1, 1, 1, 1, 1,
-0.2760412, -1.217446, -4.013804, 1, 1, 1, 1, 1,
-0.275466, 1.184386, 1.473588, 1, 1, 1, 1, 1,
-0.2749861, 0.3674356, -0.3385624, 1, 1, 1, 1, 1,
-0.2748999, 0.5755148, 1.495996, 1, 1, 1, 1, 1,
-0.2722706, -0.4910913, -2.482609, 1, 1, 1, 1, 1,
-0.2674063, -2.239211, -4.071915, 0, 0, 1, 1, 1,
-0.2650647, -1.438221, -4.62212, 1, 0, 0, 1, 1,
-0.2641789, 0.6204861, 0.250399, 1, 0, 0, 1, 1,
-0.2630959, -0.03689118, -1.842785, 1, 0, 0, 1, 1,
-0.2622932, 2.122371, 0.2646931, 1, 0, 0, 1, 1,
-0.2612258, 0.1008149, -0.7766479, 1, 0, 0, 1, 1,
-0.2607538, -0.4039644, -2.449889, 0, 0, 0, 1, 1,
-0.2560069, 0.9639381, 1.526985, 0, 0, 0, 1, 1,
-0.2556983, 0.4139755, -0.3714172, 0, 0, 0, 1, 1,
-0.2554489, 0.5462134, -2.008627, 0, 0, 0, 1, 1,
-0.2537329, -1.580315, -4.14898, 0, 0, 0, 1, 1,
-0.2537165, 0.8406864, 0.3428774, 0, 0, 0, 1, 1,
-0.253526, 1.931916, -0.2609094, 0, 0, 0, 1, 1,
-0.2520535, 0.4039516, 0.472759, 1, 1, 1, 1, 1,
-0.2500162, -0.3965596, -4.738222, 1, 1, 1, 1, 1,
-0.2478318, -0.7262109, -3.292507, 1, 1, 1, 1, 1,
-0.2396683, -0.6610236, -4.272821, 1, 1, 1, 1, 1,
-0.2360358, -1.53507, -3.230109, 1, 1, 1, 1, 1,
-0.2355036, -1.710459, -4.168488, 1, 1, 1, 1, 1,
-0.2314399, 1.701856, -1.968714, 1, 1, 1, 1, 1,
-0.2273118, -0.4747651, -3.958741, 1, 1, 1, 1, 1,
-0.2269467, 0.7737435, -1.654174, 1, 1, 1, 1, 1,
-0.2225892, -0.7303191, -2.890008, 1, 1, 1, 1, 1,
-0.2148484, 0.5600491, 0.1516134, 1, 1, 1, 1, 1,
-0.2145125, -0.8317551, -1.668117, 1, 1, 1, 1, 1,
-0.2123631, -1.2756, -2.473817, 1, 1, 1, 1, 1,
-0.2115078, 0.5751706, 1.153286, 1, 1, 1, 1, 1,
-0.2075809, 0.7969363, 0.09044, 1, 1, 1, 1, 1,
-0.2056824, -0.1369285, -1.451126, 0, 0, 1, 1, 1,
-0.2046889, -2.161879, -3.034949, 1, 0, 0, 1, 1,
-0.2025316, 0.5140999, -0.7179261, 1, 0, 0, 1, 1,
-0.2025243, -0.1033997, -2.876156, 1, 0, 0, 1, 1,
-0.2022863, -0.2803155, -1.93844, 1, 0, 0, 1, 1,
-0.201395, 0.8970881, 1.052387, 1, 0, 0, 1, 1,
-0.2002268, 0.1018413, -3.013736, 0, 0, 0, 1, 1,
-0.1964685, -0.6162413, -2.559394, 0, 0, 0, 1, 1,
-0.1961174, 1.566997, 0.3137861, 0, 0, 0, 1, 1,
-0.1899652, -0.8793476, -2.34405, 0, 0, 0, 1, 1,
-0.1884433, 0.3157324, -0.2369734, 0, 0, 0, 1, 1,
-0.1863457, 0.5815074, -1.668348, 0, 0, 0, 1, 1,
-0.1855037, 0.3994571, -0.2103068, 0, 0, 0, 1, 1,
-0.1840181, -0.4451446, -2.236863, 1, 1, 1, 1, 1,
-0.1824635, -1.124527, -1.987724, 1, 1, 1, 1, 1,
-0.1818046, -1.311938, -3.886605, 1, 1, 1, 1, 1,
-0.1810963, 0.4782936, -0.2665485, 1, 1, 1, 1, 1,
-0.1788028, 1.108308, 0.2336026, 1, 1, 1, 1, 1,
-0.1776916, -0.3840252, -3.767674, 1, 1, 1, 1, 1,
-0.176238, -0.02647401, -1.289064, 1, 1, 1, 1, 1,
-0.1753564, 0.5828668, -1.492042, 1, 1, 1, 1, 1,
-0.1712967, 1.814716, -0.9535532, 1, 1, 1, 1, 1,
-0.1712656, -1.284802, -1.967341, 1, 1, 1, 1, 1,
-0.1642836, -1.110024, -1.480882, 1, 1, 1, 1, 1,
-0.1619791, -1.422312, -3.418442, 1, 1, 1, 1, 1,
-0.1572738, -0.9140022, -2.564769, 1, 1, 1, 1, 1,
-0.1537836, 2.04493, -1.271371, 1, 1, 1, 1, 1,
-0.1517627, -0.8313881, -3.836486, 1, 1, 1, 1, 1,
-0.150365, 0.1388712, 0.3871584, 0, 0, 1, 1, 1,
-0.1498816, -0.1757679, -3.147539, 1, 0, 0, 1, 1,
-0.1471287, -0.03688282, -2.455934, 1, 0, 0, 1, 1,
-0.1459875, -0.007956356, -2.220614, 1, 0, 0, 1, 1,
-0.1457065, 1.293966, 1.033776, 1, 0, 0, 1, 1,
-0.1433474, 0.201967, -0.5321696, 1, 0, 0, 1, 1,
-0.1421774, 1.457526, 0.1999787, 0, 0, 0, 1, 1,
-0.141763, 0.6764824, 0.2159177, 0, 0, 0, 1, 1,
-0.1397691, -1.364452, -2.873231, 0, 0, 0, 1, 1,
-0.1391705, 0.2575292, -1.154116, 0, 0, 0, 1, 1,
-0.1338345, -0.8543928, -4.040814, 0, 0, 0, 1, 1,
-0.1338007, 0.6769003, -0.1163324, 0, 0, 0, 1, 1,
-0.1318349, -0.6002541, -2.604798, 0, 0, 0, 1, 1,
-0.130959, -0.1391558, -2.426827, 1, 1, 1, 1, 1,
-0.1309127, 0.6680605, 0.4321199, 1, 1, 1, 1, 1,
-0.128536, -0.6050709, -3.251636, 1, 1, 1, 1, 1,
-0.1269623, -0.814367, -2.532612, 1, 1, 1, 1, 1,
-0.1223203, -0.358579, -2.08378, 1, 1, 1, 1, 1,
-0.1204542, 1.00075, -0.1437614, 1, 1, 1, 1, 1,
-0.1163924, 1.458403, -0.6428274, 1, 1, 1, 1, 1,
-0.1163249, -0.01452848, -1.794797, 1, 1, 1, 1, 1,
-0.1138052, -0.2831469, -0.874849, 1, 1, 1, 1, 1,
-0.1108639, 0.4059524, -0.719062, 1, 1, 1, 1, 1,
-0.1078656, 1.600632, -0.3836953, 1, 1, 1, 1, 1,
-0.1071854, 0.1060756, -0.7896047, 1, 1, 1, 1, 1,
-0.1052143, -0.1513993, -5.025095, 1, 1, 1, 1, 1,
-0.1046466, -1.467848, -2.212653, 1, 1, 1, 1, 1,
-0.1027723, 1.092325, 1.345739, 1, 1, 1, 1, 1,
-0.1007969, 1.019047, 0.1088459, 0, 0, 1, 1, 1,
-0.09919748, -0.3236695, -2.581266, 1, 0, 0, 1, 1,
-0.09826362, 0.8424903, 0.7892811, 1, 0, 0, 1, 1,
-0.08577926, 1.237027, 0.5329599, 1, 0, 0, 1, 1,
-0.08094216, -2.027544, -2.752934, 1, 0, 0, 1, 1,
-0.08053275, -0.4015996, -3.321293, 1, 0, 0, 1, 1,
-0.07911858, 0.7659202, 0.09496537, 0, 0, 0, 1, 1,
-0.0770487, 0.3186186, -0.03220267, 0, 0, 0, 1, 1,
-0.07663457, 1.351871, -0.4819288, 0, 0, 0, 1, 1,
-0.07555289, -0.4316124, -1.816178, 0, 0, 0, 1, 1,
-0.07100561, 0.7301521, -0.3735315, 0, 0, 0, 1, 1,
-0.06904884, -0.6252486, -1.947224, 0, 0, 0, 1, 1,
-0.068792, -1.776077, -2.871502, 0, 0, 0, 1, 1,
-0.06643399, -0.6460237, -2.412345, 1, 1, 1, 1, 1,
-0.06591613, 0.1779233, -0.4210045, 1, 1, 1, 1, 1,
-0.06327708, 1.056055, -0.4319584, 1, 1, 1, 1, 1,
-0.05801137, 0.06322823, 0.7153373, 1, 1, 1, 1, 1,
-0.05763661, -1.850523, -1.55389, 1, 1, 1, 1, 1,
-0.0541634, 0.4749477, -0.4454826, 1, 1, 1, 1, 1,
-0.05329943, 0.3027993, -1.314134, 1, 1, 1, 1, 1,
-0.05208559, -0.9083489, -4.039446, 1, 1, 1, 1, 1,
-0.05150492, 0.293973, 0.9151422, 1, 1, 1, 1, 1,
-0.04494783, -0.3166941, -3.137847, 1, 1, 1, 1, 1,
-0.0432081, -0.5236535, -2.965934, 1, 1, 1, 1, 1,
-0.04200421, 0.5261169, 1.617427, 1, 1, 1, 1, 1,
-0.04104571, -1.579764, -2.445019, 1, 1, 1, 1, 1,
-0.03752214, -0.3254684, -1.523483, 1, 1, 1, 1, 1,
-0.03648502, 1.804384, -2.593343, 1, 1, 1, 1, 1,
-0.03644989, 1.430148, -1.014064, 0, 0, 1, 1, 1,
-0.03222269, 0.08220942, -1.668353, 1, 0, 0, 1, 1,
-0.02878343, -2.005136, -1.79243, 1, 0, 0, 1, 1,
-0.02562397, -1.21941, -3.255719, 1, 0, 0, 1, 1,
-0.02392459, 1.296807, -2.142354, 1, 0, 0, 1, 1,
-0.01516438, -0.9827716, -2.312224, 1, 0, 0, 1, 1,
-0.0150599, -0.07753194, -2.516544, 0, 0, 0, 1, 1,
-0.01430618, 0.06749078, -1.050715, 0, 0, 0, 1, 1,
-0.01125451, -0.3347163, -3.401568, 0, 0, 0, 1, 1,
-0.01122767, 0.8762259, -0.3308582, 0, 0, 0, 1, 1,
-0.008163531, -0.2773643, -4.172112, 0, 0, 0, 1, 1,
-0.00688303, 1.577916, 0.2298468, 0, 0, 0, 1, 1,
-0.004408415, -0.5003029, -1.943808, 0, 0, 0, 1, 1,
-0.001238246, 0.809167, -0.08296663, 1, 1, 1, 1, 1,
0.007973193, 0.0576276, -0.8489616, 1, 1, 1, 1, 1,
0.01015369, -0.8788105, 2.806425, 1, 1, 1, 1, 1,
0.01167792, -1.412595, 4.1441, 1, 1, 1, 1, 1,
0.01167875, -0.5174318, 4.039372, 1, 1, 1, 1, 1,
0.01180818, -1.552375, 3.724218, 1, 1, 1, 1, 1,
0.01552034, 0.8767541, 1.238152, 1, 1, 1, 1, 1,
0.01642085, 0.04092235, 0.7680439, 1, 1, 1, 1, 1,
0.01977891, -0.7883193, 3.603173, 1, 1, 1, 1, 1,
0.02143162, -1.505282, 3.899691, 1, 1, 1, 1, 1,
0.02573215, 0.2221235, -0.5245305, 1, 1, 1, 1, 1,
0.02637111, 0.6888304, -1.454714, 1, 1, 1, 1, 1,
0.0299196, 0.8456045, -1.457144, 1, 1, 1, 1, 1,
0.03018773, -0.6653209, 1.363879, 1, 1, 1, 1, 1,
0.03093513, -1.186814, 2.550235, 1, 1, 1, 1, 1,
0.03317109, -0.3752815, 4.953407, 0, 0, 1, 1, 1,
0.03369835, 1.109425, 0.03772166, 1, 0, 0, 1, 1,
0.03502516, 0.9737769, 0.2052276, 1, 0, 0, 1, 1,
0.03555198, -1.984446, 3.935308, 1, 0, 0, 1, 1,
0.0375284, 0.5780231, 0.7595897, 1, 0, 0, 1, 1,
0.03825564, 1.148163, 0.593532, 1, 0, 0, 1, 1,
0.03891532, -0.3128946, 3.57454, 0, 0, 0, 1, 1,
0.03964682, 1.134279, -0.6566697, 0, 0, 0, 1, 1,
0.04124797, 0.7708231, 0.9514853, 0, 0, 0, 1, 1,
0.0474091, 0.4228729, -1.955146, 0, 0, 0, 1, 1,
0.05008358, 0.6994157, -0.4936714, 0, 0, 0, 1, 1,
0.05230368, 1.022607, -0.1496145, 0, 0, 0, 1, 1,
0.05288272, 1.096489, 1.082388, 0, 0, 0, 1, 1,
0.05494318, -1.455306, 3.776742, 1, 1, 1, 1, 1,
0.05508132, 0.2426411, 0.5834584, 1, 1, 1, 1, 1,
0.05572398, -0.265306, 3.045822, 1, 1, 1, 1, 1,
0.05682979, 0.6372597, 0.01354913, 1, 1, 1, 1, 1,
0.06112973, 1.74811, 0.933934, 1, 1, 1, 1, 1,
0.0628351, 0.8066112, 1.34756, 1, 1, 1, 1, 1,
0.06412451, -0.9161805, 2.913166, 1, 1, 1, 1, 1,
0.07583801, -0.2898021, 3.606935, 1, 1, 1, 1, 1,
0.08517665, -1.518682, 5.034591, 1, 1, 1, 1, 1,
0.08738261, 1.883611, 0.1923162, 1, 1, 1, 1, 1,
0.0900427, -0.3768046, 3.314698, 1, 1, 1, 1, 1,
0.09027314, 0.779497, -0.0477083, 1, 1, 1, 1, 1,
0.09321159, 1.025918, 2.324047, 1, 1, 1, 1, 1,
0.09331644, 0.6948295, 1.334679, 1, 1, 1, 1, 1,
0.09510916, -1.132341, 3.055977, 1, 1, 1, 1, 1,
0.09558927, 0.8346568, 0.7954117, 0, 0, 1, 1, 1,
0.09571198, -1.781231, 1.964062, 1, 0, 0, 1, 1,
0.09871241, -0.2800034, 3.825482, 1, 0, 0, 1, 1,
0.09908339, 0.2464637, 0.09507225, 1, 0, 0, 1, 1,
0.1014093, 1.233925, -0.1836676, 1, 0, 0, 1, 1,
0.105907, -0.01807938, 1.944416, 1, 0, 0, 1, 1,
0.106252, -1.944882, 5.357142, 0, 0, 0, 1, 1,
0.1082331, -0.3795299, 3.797438, 0, 0, 0, 1, 1,
0.1133436, 0.5100962, -0.137391, 0, 0, 0, 1, 1,
0.1133821, 1.71921, -0.2714586, 0, 0, 0, 1, 1,
0.1202599, -0.7620974, 3.295164, 0, 0, 0, 1, 1,
0.1214731, 0.610516, 1.569244, 0, 0, 0, 1, 1,
0.1219469, -2.085728, 0.2229046, 0, 0, 0, 1, 1,
0.122135, 0.08618976, 2.050384, 1, 1, 1, 1, 1,
0.123558, 1.218983, 0.431732, 1, 1, 1, 1, 1,
0.1297508, 0.2479094, -0.3394341, 1, 1, 1, 1, 1,
0.1313976, 1.112468, -0.5694728, 1, 1, 1, 1, 1,
0.1338547, -0.7385471, 2.068402, 1, 1, 1, 1, 1,
0.1361617, -0.07486337, 2.659028, 1, 1, 1, 1, 1,
0.1367629, 0.1769774, -0.2926142, 1, 1, 1, 1, 1,
0.1368814, 2.19777, -0.6412853, 1, 1, 1, 1, 1,
0.1408513, -0.357132, 3.40235, 1, 1, 1, 1, 1,
0.141462, -0.008452387, 1.809916, 1, 1, 1, 1, 1,
0.1418676, -0.1745562, 3.106008, 1, 1, 1, 1, 1,
0.1426974, -0.893074, 1.512625, 1, 1, 1, 1, 1,
0.1429829, 0.9841619, 1.277918, 1, 1, 1, 1, 1,
0.1436674, 1.89645, -1.336792, 1, 1, 1, 1, 1,
0.1445607, -1.347831, 1.868313, 1, 1, 1, 1, 1,
0.1448382, -0.09432141, 0.3988859, 0, 0, 1, 1, 1,
0.1479135, 0.246036, -1.194123, 1, 0, 0, 1, 1,
0.1482976, 0.5144002, 1.140396, 1, 0, 0, 1, 1,
0.150258, 1.109305, 1.392701, 1, 0, 0, 1, 1,
0.1522039, -0.07381769, 1.189398, 1, 0, 0, 1, 1,
0.1534377, -1.084983, 3.149702, 1, 0, 0, 1, 1,
0.15435, -0.3691639, 2.741121, 0, 0, 0, 1, 1,
0.1583285, -0.2216477, 1.829067, 0, 0, 0, 1, 1,
0.1586353, 0.01445799, 1.649077, 0, 0, 0, 1, 1,
0.1588151, -1.554788, 4.117247, 0, 0, 0, 1, 1,
0.1602145, 0.9058217, 0.3356217, 0, 0, 0, 1, 1,
0.1630672, -1.360814, 3.457043, 0, 0, 0, 1, 1,
0.1637187, 1.435583, 0.5166231, 0, 0, 0, 1, 1,
0.1648473, 0.9223462, -0.9282522, 1, 1, 1, 1, 1,
0.1711123, -0.9009687, 3.517823, 1, 1, 1, 1, 1,
0.1723184, 0.1102791, 0.9042625, 1, 1, 1, 1, 1,
0.172496, 0.7440246, -0.8062824, 1, 1, 1, 1, 1,
0.1799818, -0.230194, 1.777998, 1, 1, 1, 1, 1,
0.1815456, -2.232308, 4.199753, 1, 1, 1, 1, 1,
0.1846587, 0.782975, -1.19067, 1, 1, 1, 1, 1,
0.1855918, 0.3102764, 0.008172637, 1, 1, 1, 1, 1,
0.187987, 1.684299, -1.121751, 1, 1, 1, 1, 1,
0.1894173, 0.560921, 2.255921, 1, 1, 1, 1, 1,
0.1916507, -0.5258696, 4.023834, 1, 1, 1, 1, 1,
0.1951768, 1.143161, 0.6006455, 1, 1, 1, 1, 1,
0.1983181, 0.34992, 1.690272, 1, 1, 1, 1, 1,
0.202077, 1.420177, -0.3644045, 1, 1, 1, 1, 1,
0.2065577, 0.0526379, 2.291773, 1, 1, 1, 1, 1,
0.2067656, -0.5233095, 3.53605, 0, 0, 1, 1, 1,
0.2071947, -0.6008857, 4.167402, 1, 0, 0, 1, 1,
0.2121468, -1.285264, 2.34108, 1, 0, 0, 1, 1,
0.221104, -0.2930247, 1.550985, 1, 0, 0, 1, 1,
0.2245088, 0.09350842, 2.00802, 1, 0, 0, 1, 1,
0.2268839, 1.516409, 0.8431263, 1, 0, 0, 1, 1,
0.231818, 0.9241541, 0.6275961, 0, 0, 0, 1, 1,
0.2340898, 1.342141, 0.9933259, 0, 0, 0, 1, 1,
0.2370798, 0.8526959, 0.0195735, 0, 0, 0, 1, 1,
0.2378417, -0.7472585, 2.96306, 0, 0, 0, 1, 1,
0.2398288, 1.175664, 1.691666, 0, 0, 0, 1, 1,
0.2402, -0.8669649, 3.47372, 0, 0, 0, 1, 1,
0.2468747, -0.04022791, 2.555351, 0, 0, 0, 1, 1,
0.2486122, -2.124001, 2.535533, 1, 1, 1, 1, 1,
0.2503649, 0.2104768, 0.9093462, 1, 1, 1, 1, 1,
0.2540528, -0.8656837, 2.631875, 1, 1, 1, 1, 1,
0.2564963, 0.1687105, 1.769523, 1, 1, 1, 1, 1,
0.2615722, 1.272027, 1.838731, 1, 1, 1, 1, 1,
0.2651804, -0.8593934, 2.892674, 1, 1, 1, 1, 1,
0.2665238, 0.01819306, 0.1623371, 1, 1, 1, 1, 1,
0.2690725, -1.02413, 4.7466, 1, 1, 1, 1, 1,
0.2691544, -0.6205847, 4.167789, 1, 1, 1, 1, 1,
0.276087, 0.2231719, 0.9225944, 1, 1, 1, 1, 1,
0.2787405, -1.73608, 3.897686, 1, 1, 1, 1, 1,
0.2811959, 0.6968094, 0.1168452, 1, 1, 1, 1, 1,
0.2813324, -0.7054415, 3.031109, 1, 1, 1, 1, 1,
0.281989, 0.2272782, 2.379787, 1, 1, 1, 1, 1,
0.2885919, -1.522175, 2.318182, 1, 1, 1, 1, 1,
0.2914515, 1.335926, -0.8207927, 0, 0, 1, 1, 1,
0.2925717, 1.768145, 0.8423551, 1, 0, 0, 1, 1,
0.2966862, -0.6279826, 2.70015, 1, 0, 0, 1, 1,
0.3013514, -1.105272, 1.785518, 1, 0, 0, 1, 1,
0.3021899, -1.197053, 1.993821, 1, 0, 0, 1, 1,
0.3030644, 0.4719969, -0.5020104, 1, 0, 0, 1, 1,
0.3031746, -0.544208, 2.192276, 0, 0, 0, 1, 1,
0.3067733, -0.7338687, 2.627599, 0, 0, 0, 1, 1,
0.3081079, -0.8413025, 1.587523, 0, 0, 0, 1, 1,
0.3097523, 0.659023, -0.2281539, 0, 0, 0, 1, 1,
0.312756, 1.061411, 1.424041, 0, 0, 0, 1, 1,
0.3148468, 0.1385177, 1.188699, 0, 0, 0, 1, 1,
0.3154317, -0.06866444, 1.126662, 0, 0, 0, 1, 1,
0.3155151, -0.6661602, 3.193238, 1, 1, 1, 1, 1,
0.3230911, 0.4748618, 1.497961, 1, 1, 1, 1, 1,
0.3249591, -2.129474, 4.063771, 1, 1, 1, 1, 1,
0.3311711, 0.1742269, 0.7730084, 1, 1, 1, 1, 1,
0.3360834, 1.088715, -0.6464251, 1, 1, 1, 1, 1,
0.3369428, 0.4409485, 0.7896305, 1, 1, 1, 1, 1,
0.3416613, 0.5408835, 0.05754106, 1, 1, 1, 1, 1,
0.3416955, 1.286685, 1.387444, 1, 1, 1, 1, 1,
0.3436965, 0.681704, 0.964158, 1, 1, 1, 1, 1,
0.3464223, 0.353661, 0.8731996, 1, 1, 1, 1, 1,
0.3542598, 3.641029, 0.6308202, 1, 1, 1, 1, 1,
0.3591775, -1.70391, 4.624413, 1, 1, 1, 1, 1,
0.3591909, -0.566755, 2.216516, 1, 1, 1, 1, 1,
0.3605296, 1.356604, -0.7831087, 1, 1, 1, 1, 1,
0.3625298, -1.199064, 2.393044, 1, 1, 1, 1, 1,
0.3630123, 0.8662589, 0.2987054, 0, 0, 1, 1, 1,
0.364367, 0.7453611, 1.876753, 1, 0, 0, 1, 1,
0.3649159, -0.918027, 1.899516, 1, 0, 0, 1, 1,
0.3661333, -0.5697511, 3.442174, 1, 0, 0, 1, 1,
0.3674186, -2.137255, 2.213033, 1, 0, 0, 1, 1,
0.3678334, 0.687587, 0.7227775, 1, 0, 0, 1, 1,
0.3685124, 0.1514225, 2.198703, 0, 0, 0, 1, 1,
0.3715752, 1.00285, 2.563543, 0, 0, 0, 1, 1,
0.3721636, 0.4708889, 1.424811, 0, 0, 0, 1, 1,
0.3771488, 0.213989, -1.512331, 0, 0, 0, 1, 1,
0.3776211, 0.8184159, 0.6025842, 0, 0, 0, 1, 1,
0.3790674, 0.217021, -0.4346044, 0, 0, 0, 1, 1,
0.381007, 0.4155459, 1.468295, 0, 0, 0, 1, 1,
0.383888, 1.559808, 0.7395694, 1, 1, 1, 1, 1,
0.3874897, -1.126853, 2.180431, 1, 1, 1, 1, 1,
0.387678, 0.1064955, 2.04095, 1, 1, 1, 1, 1,
0.3882098, 0.7886456, -0.2305871, 1, 1, 1, 1, 1,
0.3924575, 2.076968, 0.9454406, 1, 1, 1, 1, 1,
0.3950482, 0.6736349, 2.644359, 1, 1, 1, 1, 1,
0.3954498, -0.3704289, 1.482687, 1, 1, 1, 1, 1,
0.396006, 0.1332847, 0.8507973, 1, 1, 1, 1, 1,
0.4037613, 2.093206, -0.3716319, 1, 1, 1, 1, 1,
0.4046549, -1.146192, 1.44578, 1, 1, 1, 1, 1,
0.4049835, -0.1839823, 0.1747349, 1, 1, 1, 1, 1,
0.4052463, 0.7499967, 1.842585, 1, 1, 1, 1, 1,
0.409605, -0.3212964, 2.037639, 1, 1, 1, 1, 1,
0.4109714, 0.5974954, -0.7520853, 1, 1, 1, 1, 1,
0.4132408, 0.1738381, 2.145917, 1, 1, 1, 1, 1,
0.4162091, 0.49408, 0.628668, 0, 0, 1, 1, 1,
0.4177949, -0.5240483, 1.52149, 1, 0, 0, 1, 1,
0.4183742, 0.3906195, 2.446859, 1, 0, 0, 1, 1,
0.4200745, -0.3456943, 2.831375, 1, 0, 0, 1, 1,
0.4264495, -1.977651, 2.822256, 1, 0, 0, 1, 1,
0.4283203, 0.4221826, -0.362925, 1, 0, 0, 1, 1,
0.4330821, -0.6516265, 1.239352, 0, 0, 0, 1, 1,
0.4351627, 0.03218549, 2.113699, 0, 0, 0, 1, 1,
0.4404708, 0.04463612, 1.719149, 0, 0, 0, 1, 1,
0.4519233, -1.293021, 4.670772, 0, 0, 0, 1, 1,
0.4623366, -1.850192, 1.881103, 0, 0, 0, 1, 1,
0.4642147, -0.04665085, 2.94314, 0, 0, 0, 1, 1,
0.464928, 0.06312829, 1.920261, 0, 0, 0, 1, 1,
0.4672396, -1.014177, 3.661189, 1, 1, 1, 1, 1,
0.4676143, 1.587283, 1.712405, 1, 1, 1, 1, 1,
0.4704139, 0.1622397, -0.5555773, 1, 1, 1, 1, 1,
0.4708869, 2.217452, -0.0397163, 1, 1, 1, 1, 1,
0.4717502, 0.3402952, -0.6408885, 1, 1, 1, 1, 1,
0.4761143, -0.1801173, 3.313275, 1, 1, 1, 1, 1,
0.4768915, 2.025271, -1.236757, 1, 1, 1, 1, 1,
0.4771761, -0.01346565, 1.177812, 1, 1, 1, 1, 1,
0.4785356, -0.8215858, 4.0919, 1, 1, 1, 1, 1,
0.4795025, -0.5345223, 1.569903, 1, 1, 1, 1, 1,
0.481458, 1.073962, 0.4404042, 1, 1, 1, 1, 1,
0.4826455, 0.04453522, 1.906902, 1, 1, 1, 1, 1,
0.482753, 0.2248758, 0.9032152, 1, 1, 1, 1, 1,
0.4837445, 0.3078263, 0.4204007, 1, 1, 1, 1, 1,
0.4898867, 0.3174624, 0.6162357, 1, 1, 1, 1, 1,
0.4928959, -0.8207579, 2.788083, 0, 0, 1, 1, 1,
0.4948028, 0.0340068, 1.371192, 1, 0, 0, 1, 1,
0.4949642, 0.1004447, 2.489071, 1, 0, 0, 1, 1,
0.4975558, 0.1982428, 2.764638, 1, 0, 0, 1, 1,
0.4984722, -0.06562974, 3.746724, 1, 0, 0, 1, 1,
0.4985424, -0.3157457, 1.33536, 1, 0, 0, 1, 1,
0.511399, 0.3891428, 1.495115, 0, 0, 0, 1, 1,
0.5169746, -0.2088478, 2.892302, 0, 0, 0, 1, 1,
0.5194436, 0.01034254, 2.948318, 0, 0, 0, 1, 1,
0.5213294, -0.5343012, 2.119462, 0, 0, 0, 1, 1,
0.5215806, 1.041013, 1.686702, 0, 0, 0, 1, 1,
0.5229919, -0.6707701, 1.20601, 0, 0, 0, 1, 1,
0.5255753, -0.19167, -0.51938, 0, 0, 0, 1, 1,
0.5258436, 1.015707, 1.928235, 1, 1, 1, 1, 1,
0.542173, -1.185987, 2.591669, 1, 1, 1, 1, 1,
0.5485771, 1.369131, -0.3368839, 1, 1, 1, 1, 1,
0.5491279, 0.5029104, 2.269568, 1, 1, 1, 1, 1,
0.5493641, -0.3296557, 1.771164, 1, 1, 1, 1, 1,
0.5524157, 0.6668506, 1.011099, 1, 1, 1, 1, 1,
0.5525134, -1.540386, 3.831196, 1, 1, 1, 1, 1,
0.5535797, 0.4473459, 1.155582, 1, 1, 1, 1, 1,
0.5563124, 0.4848316, 0.2164887, 1, 1, 1, 1, 1,
0.5570357, -0.9006249, 2.473993, 1, 1, 1, 1, 1,
0.5614788, 1.352615, -0.0655921, 1, 1, 1, 1, 1,
0.5665483, -1.033803, 3.606781, 1, 1, 1, 1, 1,
0.5712001, -0.2611775, 2.886165, 1, 1, 1, 1, 1,
0.5778672, -0.660651, 2.981386, 1, 1, 1, 1, 1,
0.5787777, 1.276559, 1.137638, 1, 1, 1, 1, 1,
0.5821591, 0.7759361, 1.332842, 0, 0, 1, 1, 1,
0.5874065, 0.5773174, 0.2537575, 1, 0, 0, 1, 1,
0.588775, 1.115487, 1.081658, 1, 0, 0, 1, 1,
0.5900777, -0.9193197, 3.443049, 1, 0, 0, 1, 1,
0.5909141, 0.6610835, -0.1357683, 1, 0, 0, 1, 1,
0.5915574, -1.199253, 2.235856, 1, 0, 0, 1, 1,
0.5916582, 0.2609421, 1.880306, 0, 0, 0, 1, 1,
0.5983244, -1.509694, 2.153412, 0, 0, 0, 1, 1,
0.5996256, -0.6955584, 3.483977, 0, 0, 0, 1, 1,
0.6003342, 0.2902581, 0.1841938, 0, 0, 0, 1, 1,
0.6030174, 1.673189, -0.7710833, 0, 0, 0, 1, 1,
0.6032632, 0.2483018, 0.2226351, 0, 0, 0, 1, 1,
0.6056398, -0.6278034, 2.955675, 0, 0, 0, 1, 1,
0.6061822, -0.7918992, 3.68487, 1, 1, 1, 1, 1,
0.6075017, -3.266261, 2.916505, 1, 1, 1, 1, 1,
0.6087358, -0.3383001, 2.244175, 1, 1, 1, 1, 1,
0.6110736, 0.4705271, 1.599321, 1, 1, 1, 1, 1,
0.6146857, 1.197816, 1.658058, 1, 1, 1, 1, 1,
0.6182322, 0.8267617, 1.377465, 1, 1, 1, 1, 1,
0.6219437, -0.661957, 2.845653, 1, 1, 1, 1, 1,
0.6255552, 0.7784817, 1.346698, 1, 1, 1, 1, 1,
0.6279262, -2.290305, 3.014878, 1, 1, 1, 1, 1,
0.629257, 1.115168, -0.7998083, 1, 1, 1, 1, 1,
0.6367304, 0.8705696, -0.04624013, 1, 1, 1, 1, 1,
0.6389431, 0.3073187, 0.6488534, 1, 1, 1, 1, 1,
0.6457031, 0.7053435, 0.9084701, 1, 1, 1, 1, 1,
0.645883, 1.121157, -0.5286446, 1, 1, 1, 1, 1,
0.6477136, -1.536709, 1.943051, 1, 1, 1, 1, 1,
0.6543893, -0.4708776, 0.9467322, 0, 0, 1, 1, 1,
0.6589301, -0.9034077, 4.490675, 1, 0, 0, 1, 1,
0.6676407, -0.112238, 1.410591, 1, 0, 0, 1, 1,
0.670898, 0.8338181, 0.2439152, 1, 0, 0, 1, 1,
0.6711409, -0.6657241, 1.772711, 1, 0, 0, 1, 1,
0.6744862, 0.1618948, 0.3989375, 1, 0, 0, 1, 1,
0.6746526, 0.2167838, 2.48511, 0, 0, 0, 1, 1,
0.6755768, 0.4404389, 2.224224, 0, 0, 0, 1, 1,
0.6767223, -0.9415652, 0.6466638, 0, 0, 0, 1, 1,
0.6772543, 0.6432962, 2.903477, 0, 0, 0, 1, 1,
0.6788385, 0.2923625, -0.6763831, 0, 0, 0, 1, 1,
0.6814673, 0.7339867, 1.222357, 0, 0, 0, 1, 1,
0.6851569, 0.3576764, 0.6495663, 0, 0, 0, 1, 1,
0.6875989, -0.5391868, -0.159889, 1, 1, 1, 1, 1,
0.6906865, -0.4816686, 2.151312, 1, 1, 1, 1, 1,
0.6931533, -1.314084, 2.074717, 1, 1, 1, 1, 1,
0.6936617, -0.06003914, 1.362272, 1, 1, 1, 1, 1,
0.7054456, 0.3016589, 1.501796, 1, 1, 1, 1, 1,
0.7104189, 0.2975509, 0.9033239, 1, 1, 1, 1, 1,
0.7131981, 1.475143, -0.6999946, 1, 1, 1, 1, 1,
0.7156509, -0.0469416, 1.266801, 1, 1, 1, 1, 1,
0.7235166, -1.576641, 2.696717, 1, 1, 1, 1, 1,
0.7236947, 0.4504407, 1.372563, 1, 1, 1, 1, 1,
0.7271125, 0.1189015, -0.4418629, 1, 1, 1, 1, 1,
0.7326751, -0.2456438, 0.8518313, 1, 1, 1, 1, 1,
0.7359046, -1.196385, 3.805219, 1, 1, 1, 1, 1,
0.7381214, 0.8884513, 0.8111938, 1, 1, 1, 1, 1,
0.7405024, 1.100213, -0.6810556, 1, 1, 1, 1, 1,
0.7452455, -0.9327081, 2.041043, 0, 0, 1, 1, 1,
0.7489628, -0.8538508, 2.610193, 1, 0, 0, 1, 1,
0.7524176, -1.783182, 3.903101, 1, 0, 0, 1, 1,
0.754495, 0.9154487, 0.6408005, 1, 0, 0, 1, 1,
0.7568541, 0.5427301, 1.461478, 1, 0, 0, 1, 1,
0.7571151, 0.4049577, 0.5819091, 1, 0, 0, 1, 1,
0.7573479, 0.05760524, 2.494862, 0, 0, 0, 1, 1,
0.7693406, 1.584871, -0.4115705, 0, 0, 0, 1, 1,
0.7785844, -0.4782984, 0.8574624, 0, 0, 0, 1, 1,
0.7832465, 0.6414669, 0.5717397, 0, 0, 0, 1, 1,
0.7858384, -0.8007476, 1.700646, 0, 0, 0, 1, 1,
0.7905716, -0.2612357, 0.5026427, 0, 0, 0, 1, 1,
0.7917331, -1.108272, 2.776542, 0, 0, 0, 1, 1,
0.7944438, 0.257239, 1.288804, 1, 1, 1, 1, 1,
0.8029194, -0.3454857, 3.22336, 1, 1, 1, 1, 1,
0.8051911, 1.60357, 0.5097152, 1, 1, 1, 1, 1,
0.8077816, 0.3450051, 0.04659821, 1, 1, 1, 1, 1,
0.8086343, 0.1253951, 2.067775, 1, 1, 1, 1, 1,
0.8214511, -1.673663, 1.830284, 1, 1, 1, 1, 1,
0.8294659, -1.468326, 2.586637, 1, 1, 1, 1, 1,
0.8336557, -1.331258, 2.669501, 1, 1, 1, 1, 1,
0.8358138, -0.5770172, 1.429383, 1, 1, 1, 1, 1,
0.8393571, -0.4159184, 1.765708, 1, 1, 1, 1, 1,
0.8410112, 0.8210087, 0.5812976, 1, 1, 1, 1, 1,
0.8412761, 0.3660594, 1.873055, 1, 1, 1, 1, 1,
0.842068, 1.08421, 1.364228, 1, 1, 1, 1, 1,
0.8445295, 0.54646, 2.59462, 1, 1, 1, 1, 1,
0.8447473, -1.640817, 1.657207, 1, 1, 1, 1, 1,
0.8520141, -0.7394049, 1.585248, 0, 0, 1, 1, 1,
0.8526006, 0.7220004, -0.19349, 1, 0, 0, 1, 1,
0.8599522, -1.728411, 3.24807, 1, 0, 0, 1, 1,
0.8650121, 2.344532, 0.4047835, 1, 0, 0, 1, 1,
0.8660525, -1.890969, 0.8184997, 1, 0, 0, 1, 1,
0.8662515, 0.6031738, -0.9597619, 1, 0, 0, 1, 1,
0.8691083, 0.5298401, 0.178706, 0, 0, 0, 1, 1,
0.869248, -0.4081554, 2.354777, 0, 0, 0, 1, 1,
0.8772709, 0.1516954, 1.578666, 0, 0, 0, 1, 1,
0.8775281, -0.4381537, 2.922814, 0, 0, 0, 1, 1,
0.8778461, -1.17263, 2.577035, 0, 0, 0, 1, 1,
0.8900653, 1.643709, 1.601498, 0, 0, 0, 1, 1,
0.8923464, -1.982147, 4.69541, 0, 0, 0, 1, 1,
0.8937669, 0.9346687, -0.8449504, 1, 1, 1, 1, 1,
0.8948306, -0.3168575, 0.6477636, 1, 1, 1, 1, 1,
0.8963886, 0.5224383, 1.972875, 1, 1, 1, 1, 1,
0.9046225, 0.7038453, 1.178231, 1, 1, 1, 1, 1,
0.9052125, 0.4508252, 0.7341399, 1, 1, 1, 1, 1,
0.9104536, -0.3532274, -0.1457017, 1, 1, 1, 1, 1,
0.9106891, 1.106646, 1.391072, 1, 1, 1, 1, 1,
0.9133036, 0.3666542, 2.813869, 1, 1, 1, 1, 1,
0.9148228, -1.986436, 4.554018, 1, 1, 1, 1, 1,
0.9233401, 0.3939967, 0.7110794, 1, 1, 1, 1, 1,
0.9331446, 0.7587569, 1.712837, 1, 1, 1, 1, 1,
0.9454907, 3.256074, -0.1017696, 1, 1, 1, 1, 1,
0.9466728, -0.7683035, 2.746775, 1, 1, 1, 1, 1,
0.9518292, -0.9693892, 3.883656, 1, 1, 1, 1, 1,
0.9533872, 0.4184831, 0.5175105, 1, 1, 1, 1, 1,
0.9536481, 0.4660268, 1.328596, 0, 0, 1, 1, 1,
0.9539972, -1.811596, 2.867517, 1, 0, 0, 1, 1,
0.9546268, 0.4864661, 0.1862029, 1, 0, 0, 1, 1,
0.9563383, -0.532443, 0.9873829, 1, 0, 0, 1, 1,
0.9575324, -1.147868, 2.153487, 1, 0, 0, 1, 1,
0.9627902, 0.8334564, 2.509337, 1, 0, 0, 1, 1,
0.9649811, 0.210153, -0.4281819, 0, 0, 0, 1, 1,
0.9772371, -1.099301, 3.490099, 0, 0, 0, 1, 1,
0.9794377, -0.01402678, 1.085775, 0, 0, 0, 1, 1,
0.9796275, -1.098994, 2.105476, 0, 0, 0, 1, 1,
0.9860228, -1.54446, 1.194508, 0, 0, 0, 1, 1,
0.9869708, 0.5621072, 0.9820341, 0, 0, 0, 1, 1,
0.9908825, -0.9183103, 2.059793, 0, 0, 0, 1, 1,
0.9977095, 0.4484444, 1.418119, 1, 1, 1, 1, 1,
0.9979557, 0.7557268, -0.8728556, 1, 1, 1, 1, 1,
1.005426, 0.03805489, 1.702406, 1, 1, 1, 1, 1,
1.010219, 0.7817771, 1.313165, 1, 1, 1, 1, 1,
1.01244, 0.6364583, 0.7099753, 1, 1, 1, 1, 1,
1.014848, 0.7612087, 0.3964666, 1, 1, 1, 1, 1,
1.016916, -0.5852593, 1.876837, 1, 1, 1, 1, 1,
1.017922, -0.3453306, 2.501481, 1, 1, 1, 1, 1,
1.022838, -2.42304, 2.167554, 1, 1, 1, 1, 1,
1.025862, -0.4767022, 0.8735892, 1, 1, 1, 1, 1,
1.028244, 1.105487, 1.592063, 1, 1, 1, 1, 1,
1.028605, -1.586613, 2.456272, 1, 1, 1, 1, 1,
1.03604, -0.336132, 2.616984, 1, 1, 1, 1, 1,
1.038833, 1.132072, 1.936033, 1, 1, 1, 1, 1,
1.042288, -1.239408, 0.7714596, 1, 1, 1, 1, 1,
1.050149, 1.860229, 1.392703, 0, 0, 1, 1, 1,
1.065286, -1.18298, 0.3473574, 1, 0, 0, 1, 1,
1.075961, -0.6223739, 1.953937, 1, 0, 0, 1, 1,
1.078538, -0.06579159, 2.069593, 1, 0, 0, 1, 1,
1.084042, 2.618628, 0.5091655, 1, 0, 0, 1, 1,
1.089367, -0.08223746, 0.1308114, 1, 0, 0, 1, 1,
1.089465, -0.005696223, 1.117841, 0, 0, 0, 1, 1,
1.089513, 0.5851675, 0.5424874, 0, 0, 0, 1, 1,
1.092286, 0.8511291, 0.1213577, 0, 0, 0, 1, 1,
1.095954, 0.5457946, 1.204181, 0, 0, 0, 1, 1,
1.097064, -0.2410077, 1.756202, 0, 0, 0, 1, 1,
1.101342, -0.607031, 2.912046, 0, 0, 0, 1, 1,
1.118357, 0.3565231, -0.3356895, 0, 0, 0, 1, 1,
1.119864, 1.843485, 1.124065, 1, 1, 1, 1, 1,
1.123462, 0.377296, 1.174119, 1, 1, 1, 1, 1,
1.124181, 1.545824, -1.141975, 1, 1, 1, 1, 1,
1.12516, 0.9919525, -0.8002598, 1, 1, 1, 1, 1,
1.130984, -0.0433839, 0.6935237, 1, 1, 1, 1, 1,
1.132568, 0.9929587, 1.395836, 1, 1, 1, 1, 1,
1.133109, 0.7721148, -1.050789, 1, 1, 1, 1, 1,
1.13743, -0.6792626, 2.15178, 1, 1, 1, 1, 1,
1.139459, -0.746265, 3.20019, 1, 1, 1, 1, 1,
1.145874, 1.388161, 2.697445, 1, 1, 1, 1, 1,
1.146355, -1.19122, 2.685338, 1, 1, 1, 1, 1,
1.147124, 0.5401031, -0.0399997, 1, 1, 1, 1, 1,
1.149106, 0.2692972, 0.2360885, 1, 1, 1, 1, 1,
1.15016, 0.2444106, 0.9634527, 1, 1, 1, 1, 1,
1.150934, 0.4071411, 1.948328, 1, 1, 1, 1, 1,
1.154835, -1.994659, 4.043826, 0, 0, 1, 1, 1,
1.166375, -1.276208, 2.731354, 1, 0, 0, 1, 1,
1.166597, 0.5580844, 0.4582996, 1, 0, 0, 1, 1,
1.170601, 1.673962, 2.365519, 1, 0, 0, 1, 1,
1.19448, 0.8680872, 2.593108, 1, 0, 0, 1, 1,
1.199163, -1.729879, 2.897443, 1, 0, 0, 1, 1,
1.199824, 1.495894, 1.013693, 0, 0, 0, 1, 1,
1.202996, 0.3059624, 1.106707, 0, 0, 0, 1, 1,
1.209645, -1.625276, 1.974952, 0, 0, 0, 1, 1,
1.21362, 0.1767414, 1.012649, 0, 0, 0, 1, 1,
1.21742, 0.923259, 3.481041, 0, 0, 0, 1, 1,
1.217464, 0.4951812, 2.148549, 0, 0, 0, 1, 1,
1.218078, -0.1285865, 2.180151, 0, 0, 0, 1, 1,
1.230868, -0.497137, 1.562551, 1, 1, 1, 1, 1,
1.249143, -0.9070036, 0.9090381, 1, 1, 1, 1, 1,
1.253944, -0.5992363, 2.671279, 1, 1, 1, 1, 1,
1.256066, -1.926131, 2.651891, 1, 1, 1, 1, 1,
1.272353, -0.7523701, 4.289788, 1, 1, 1, 1, 1,
1.282764, 0.7824841, 1.39834, 1, 1, 1, 1, 1,
1.284388, 0.6972347, 1.178466, 1, 1, 1, 1, 1,
1.298108, 0.08495507, 3.341346, 1, 1, 1, 1, 1,
1.306713, -0.02041611, 0.1418561, 1, 1, 1, 1, 1,
1.317694, -0.3768585, 2.052583, 1, 1, 1, 1, 1,
1.330374, -0.9249992, 3.257922, 1, 1, 1, 1, 1,
1.342373, -2.348067, 3.731007, 1, 1, 1, 1, 1,
1.343214, 0.7201868, -0.255911, 1, 1, 1, 1, 1,
1.345402, -0.3568127, 2.334653, 1, 1, 1, 1, 1,
1.350201, -0.7901576, 2.220801, 1, 1, 1, 1, 1,
1.364409, -1.59524, 1.369591, 0, 0, 1, 1, 1,
1.364459, -1.0548, 2.47481, 1, 0, 0, 1, 1,
1.368614, -0.9064786, 2.100017, 1, 0, 0, 1, 1,
1.37498, -0.4654803, 2.111658, 1, 0, 0, 1, 1,
1.399933, 0.179281, 0.9469203, 1, 0, 0, 1, 1,
1.400806, 2.225958, 0.1813613, 1, 0, 0, 1, 1,
1.400929, -0.2606257, 2.30924, 0, 0, 0, 1, 1,
1.41389, -0.8338888, 1.454442, 0, 0, 0, 1, 1,
1.434653, 0.007454669, 1.357144, 0, 0, 0, 1, 1,
1.441656, 0.4575056, 1.846716, 0, 0, 0, 1, 1,
1.458997, 0.9073206, 0.8926458, 0, 0, 0, 1, 1,
1.460717, 1.714475, 1.354856, 0, 0, 0, 1, 1,
1.466143, -0.8977713, 2.52128, 0, 0, 0, 1, 1,
1.468847, 1.09396, 0.7578566, 1, 1, 1, 1, 1,
1.471997, -1.215279, 3.8523, 1, 1, 1, 1, 1,
1.479414, -1.062415, 2.191158, 1, 1, 1, 1, 1,
1.486935, 0.9504775, 0.05782113, 1, 1, 1, 1, 1,
1.492774, 1.205793, 0.3776324, 1, 1, 1, 1, 1,
1.500046, -0.08264615, -0.457108, 1, 1, 1, 1, 1,
1.502366, -0.6214729, 2.5985, 1, 1, 1, 1, 1,
1.518437, -0.2106296, 1.071151, 1, 1, 1, 1, 1,
1.52496, 0.5350658, -0.3022385, 1, 1, 1, 1, 1,
1.546162, -0.3288573, 1.313636, 1, 1, 1, 1, 1,
1.558397, 1.939076, 2.082126, 1, 1, 1, 1, 1,
1.576459, -0.4154616, 0.745989, 1, 1, 1, 1, 1,
1.582452, -0.6647968, 0.5816327, 1, 1, 1, 1, 1,
1.582753, 1.712409, 1.207161, 1, 1, 1, 1, 1,
1.66749, 1.389862, -1.118121, 1, 1, 1, 1, 1,
1.695282, 0.7219111, 0.9008006, 0, 0, 1, 1, 1,
1.699919, -0.4322764, 1.281184, 1, 0, 0, 1, 1,
1.700028, -0.1672378, -0.04046828, 1, 0, 0, 1, 1,
1.700057, -0.9709789, 1.549905, 1, 0, 0, 1, 1,
1.703837, 0.950271, 0.3618923, 1, 0, 0, 1, 1,
1.717745, -0.2851847, 4.104634, 1, 0, 0, 1, 1,
1.722576, 0.1569899, 2.021009, 0, 0, 0, 1, 1,
1.723722, 0.2992638, 0.6335523, 0, 0, 0, 1, 1,
1.723924, -1.530868, 3.838011, 0, 0, 0, 1, 1,
1.725839, -1.131998, 1.336943, 0, 0, 0, 1, 1,
1.745155, -0.6767412, 1.617636, 0, 0, 0, 1, 1,
1.751093, -1.164476, 3.746987, 0, 0, 0, 1, 1,
1.782169, -0.4539044, 0.4065071, 0, 0, 0, 1, 1,
1.782194, -1.144389, 3.597306, 1, 1, 1, 1, 1,
1.792905, -0.1495369, 1.751533, 1, 1, 1, 1, 1,
1.799875, -1.29583, 1.872405, 1, 1, 1, 1, 1,
1.803937, 0.5738205, -0.4234338, 1, 1, 1, 1, 1,
1.833078, -1.563348, 1.441158, 1, 1, 1, 1, 1,
1.835079, 0.1947657, 2.219863, 1, 1, 1, 1, 1,
1.870971, -1.455884, 1.358905, 1, 1, 1, 1, 1,
1.873241, -2.556869, 2.584062, 1, 1, 1, 1, 1,
1.874766, -1.121786, 2.136664, 1, 1, 1, 1, 1,
1.889654, -2.373188, 3.299039, 1, 1, 1, 1, 1,
1.891628, 0.8708516, 2.006759, 1, 1, 1, 1, 1,
1.905426, -1.139243, 2.49281, 1, 1, 1, 1, 1,
1.917444, 0.09321452, 1.532882, 1, 1, 1, 1, 1,
1.943819, 0.7523937, -0.4266838, 1, 1, 1, 1, 1,
1.946897, -0.2124623, 1.658734, 1, 1, 1, 1, 1,
1.985173, -0.5377674, 1.387442, 0, 0, 1, 1, 1,
2.023778, 0.2948538, 2.553103, 1, 0, 0, 1, 1,
2.03085, -0.3366245, 0.7888881, 1, 0, 0, 1, 1,
2.067255, 1.884443, 0.3634864, 1, 0, 0, 1, 1,
2.086552, 0.3159195, 0.9977998, 1, 0, 0, 1, 1,
2.110987, -1.357786, 1.683499, 1, 0, 0, 1, 1,
2.128407, -1.155587, 3.321146, 0, 0, 0, 1, 1,
2.141118, -1.184121, 0.5997783, 0, 0, 0, 1, 1,
2.263257, -0.9064639, 2.057044, 0, 0, 0, 1, 1,
2.371145, 1.37427, 2.02068, 0, 0, 0, 1, 1,
2.408117, -0.7771428, 1.798482, 0, 0, 0, 1, 1,
2.502959, -0.1327427, 2.467922, 0, 0, 0, 1, 1,
2.555831, 1.408798, 0.2959968, 0, 0, 0, 1, 1,
2.577106, -0.8932812, 2.350995, 1, 1, 1, 1, 1,
2.600981, -0.897988, 2.83933, 1, 1, 1, 1, 1,
2.83974, 3.355216, 1.668459, 1, 1, 1, 1, 1,
2.907453, -0.1549127, 0.5192102, 1, 1, 1, 1, 1,
2.969385, -0.4461824, -0.717353, 1, 1, 1, 1, 1,
3.100821, 0.6668823, 2.118282, 1, 1, 1, 1, 1,
3.929025, -0.4173302, 2.509928, 1, 1, 1, 1, 1
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
var radius = 9.941602;
var distance = 34.91946;
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
mvMatrix.translate( -0.3232865, 0.06422544, -0.166024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91946);
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