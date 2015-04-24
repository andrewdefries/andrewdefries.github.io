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
-3.037558, -0.2889379, -2.263281, 1, 0, 0, 1,
-2.742162, 0.7785589, -2.625231, 1, 0.007843138, 0, 1,
-2.671017, -0.6093082, -2.980282, 1, 0.01176471, 0, 1,
-2.627596, 0.07660146, -2.123819, 1, 0.01960784, 0, 1,
-2.604412, 0.6073084, -2.490623, 1, 0.02352941, 0, 1,
-2.475542, 0.918117, -1.411014, 1, 0.03137255, 0, 1,
-2.338316, -2.135382, -1.180424, 1, 0.03529412, 0, 1,
-2.277889, -0.516094, -0.2644234, 1, 0.04313726, 0, 1,
-2.24122, 1.554883, -0.1112134, 1, 0.04705882, 0, 1,
-2.200746, 0.3856286, -1.773315, 1, 0.05490196, 0, 1,
-2.194784, 6.550275e-05, -0.58021, 1, 0.05882353, 0, 1,
-2.192682, 1.373208, -1.607165, 1, 0.06666667, 0, 1,
-2.187513, -1.533347, -2.02777, 1, 0.07058824, 0, 1,
-2.174834, -0.3336418, -3.865278, 1, 0.07843138, 0, 1,
-2.159593, 1.264305, -0.3171152, 1, 0.08235294, 0, 1,
-2.13714, 1.172116, -1.064174, 1, 0.09019608, 0, 1,
-2.129391, 0.3318607, -1.668912, 1, 0.09411765, 0, 1,
-2.090811, -0.1039734, -1.895586, 1, 0.1019608, 0, 1,
-2.066379, 0.3472075, -1.745337, 1, 0.1098039, 0, 1,
-2.041758, -1.045984, -0.9186375, 1, 0.1137255, 0, 1,
-2.003846, 1.491182, -1.224484, 1, 0.1215686, 0, 1,
-2.002506, -0.2938703, -0.03073, 1, 0.1254902, 0, 1,
-2.000922, -0.002389353, -1.256264, 1, 0.1333333, 0, 1,
-1.920775, -0.4020763, -3.239908, 1, 0.1372549, 0, 1,
-1.896334, -0.3770339, -1.391757, 1, 0.145098, 0, 1,
-1.894109, 0.5196148, -0.9169387, 1, 0.1490196, 0, 1,
-1.891792, 0.183422, -3.771597, 1, 0.1568628, 0, 1,
-1.875555, -0.09489155, -0.434585, 1, 0.1607843, 0, 1,
-1.854664, -1.631096, -2.431085, 1, 0.1686275, 0, 1,
-1.848297, 0.4619206, -1.279312, 1, 0.172549, 0, 1,
-1.839109, 0.4712739, -1.368148, 1, 0.1803922, 0, 1,
-1.812174, 0.4755113, 0.2653339, 1, 0.1843137, 0, 1,
-1.802577, -0.52108, -1.945511, 1, 0.1921569, 0, 1,
-1.78708, 1.446929, 0.3476284, 1, 0.1960784, 0, 1,
-1.774464, 1.06332, -1.936641, 1, 0.2039216, 0, 1,
-1.757585, 0.3773342, -0.8800363, 1, 0.2117647, 0, 1,
-1.74858, 0.2875278, -2.028404, 1, 0.2156863, 0, 1,
-1.74845, -0.7216412, -2.959803, 1, 0.2235294, 0, 1,
-1.737738, 0.9697649, 0.4017595, 1, 0.227451, 0, 1,
-1.735869, 0.59407, -0.7685407, 1, 0.2352941, 0, 1,
-1.717562, 0.07553422, -1.377339, 1, 0.2392157, 0, 1,
-1.715672, -0.8883747, -4.199284, 1, 0.2470588, 0, 1,
-1.711576, 0.6743552, 0.9614955, 1, 0.2509804, 0, 1,
-1.69165, 1.12132, 1.357529, 1, 0.2588235, 0, 1,
-1.675831, 0.1643171, -1.719022, 1, 0.2627451, 0, 1,
-1.671412, 0.2836452, -2.46741, 1, 0.2705882, 0, 1,
-1.668499, -1.041889, -3.997531, 1, 0.2745098, 0, 1,
-1.65813, -1.023424, -3.094812, 1, 0.282353, 0, 1,
-1.640257, -0.6618349, -2.028436, 1, 0.2862745, 0, 1,
-1.636749, -1.503643, -1.289276, 1, 0.2941177, 0, 1,
-1.635806, 0.5074293, -1.291728, 1, 0.3019608, 0, 1,
-1.632725, -0.2961341, -2.369681, 1, 0.3058824, 0, 1,
-1.625488, 0.07497751, -2.124569, 1, 0.3137255, 0, 1,
-1.609035, -0.9310054, -2.30968, 1, 0.3176471, 0, 1,
-1.601843, -0.3833451, -1.068563, 1, 0.3254902, 0, 1,
-1.594714, -1.066943, -3.660442, 1, 0.3294118, 0, 1,
-1.584029, 0.5179103, -0.9410384, 1, 0.3372549, 0, 1,
-1.568828, 1.333364, -3.400346, 1, 0.3411765, 0, 1,
-1.55914, 0.862837, 0.07562101, 1, 0.3490196, 0, 1,
-1.52787, -0.2740765, -1.409742, 1, 0.3529412, 0, 1,
-1.524631, -0.9005789, -3.29235, 1, 0.3607843, 0, 1,
-1.521671, -1.370218, -1.91046, 1, 0.3647059, 0, 1,
-1.506529, -0.3971369, -2.241328, 1, 0.372549, 0, 1,
-1.490715, -0.1278684, -2.078214, 1, 0.3764706, 0, 1,
-1.48977, 0.6525677, 0.2415942, 1, 0.3843137, 0, 1,
-1.472844, -1.380203, -2.293556, 1, 0.3882353, 0, 1,
-1.449648, -0.459384, -1.016365, 1, 0.3960784, 0, 1,
-1.446133, -0.009074066, -1.072956, 1, 0.4039216, 0, 1,
-1.432127, -0.8114057, -0.05661853, 1, 0.4078431, 0, 1,
-1.420622, 0.1595184, -0.7904524, 1, 0.4156863, 0, 1,
-1.398543, -0.1168581, -1.363323, 1, 0.4196078, 0, 1,
-1.397279, -0.9956893, -0.834486, 1, 0.427451, 0, 1,
-1.391398, -0.5854561, -0.6077533, 1, 0.4313726, 0, 1,
-1.386637, 0.0950352, -2.718372, 1, 0.4392157, 0, 1,
-1.382717, 0.2737565, -1.557207, 1, 0.4431373, 0, 1,
-1.381538, -0.4039756, -0.6168268, 1, 0.4509804, 0, 1,
-1.379995, 0.4895004, 0.07970674, 1, 0.454902, 0, 1,
-1.376525, 0.05599988, -1.293163, 1, 0.4627451, 0, 1,
-1.3643, 0.119497, -4.171737, 1, 0.4666667, 0, 1,
-1.355355, -0.5181888, -2.355481, 1, 0.4745098, 0, 1,
-1.348589, 0.9110139, -1.435909, 1, 0.4784314, 0, 1,
-1.342593, 0.0110916, -1.440545, 1, 0.4862745, 0, 1,
-1.339847, -0.4868557, -0.1572756, 1, 0.4901961, 0, 1,
-1.326366, -0.8507886, -2.411994, 1, 0.4980392, 0, 1,
-1.319559, 2.30511, -0.2473539, 1, 0.5058824, 0, 1,
-1.311998, 0.03696785, 1.057124, 1, 0.509804, 0, 1,
-1.299407, -0.263304, 0.1438297, 1, 0.5176471, 0, 1,
-1.286321, 0.3443276, -0.5586967, 1, 0.5215687, 0, 1,
-1.284851, -0.7242881, -0.9364367, 1, 0.5294118, 0, 1,
-1.280009, 0.03961332, -0.9298213, 1, 0.5333334, 0, 1,
-1.2787, -2.255241, -3.248991, 1, 0.5411765, 0, 1,
-1.278538, 1.567833, -1.741434, 1, 0.5450981, 0, 1,
-1.275073, -0.6798916, -2.975297, 1, 0.5529412, 0, 1,
-1.27203, -0.3950069, -1.452956, 1, 0.5568628, 0, 1,
-1.266983, -0.2695714, -2.343731, 1, 0.5647059, 0, 1,
-1.253092, 1.462692, 0.4007822, 1, 0.5686275, 0, 1,
-1.252052, -0.110869, -2.982673, 1, 0.5764706, 0, 1,
-1.248617, 0.08019956, -0.193254, 1, 0.5803922, 0, 1,
-1.245515, -0.9581036, -1.855918, 1, 0.5882353, 0, 1,
-1.245233, 1.091323, -0.5522433, 1, 0.5921569, 0, 1,
-1.243109, 1.223824, -0.5081863, 1, 0.6, 0, 1,
-1.242551, 1.021754, -0.501232, 1, 0.6078432, 0, 1,
-1.226059, -0.6376864, -1.020459, 1, 0.6117647, 0, 1,
-1.222299, -0.3895995, -1.900768, 1, 0.6196079, 0, 1,
-1.220661, -1.463385, -2.717658, 1, 0.6235294, 0, 1,
-1.220111, -0.1961641, -0.994868, 1, 0.6313726, 0, 1,
-1.215017, -1.151083, -0.8916354, 1, 0.6352941, 0, 1,
-1.206324, 0.3051584, -0.3001802, 1, 0.6431373, 0, 1,
-1.201287, -1.339403, -2.166237, 1, 0.6470588, 0, 1,
-1.19855, -1.160776, -3.176067, 1, 0.654902, 0, 1,
-1.194175, 0.6330019, -1.472028, 1, 0.6588235, 0, 1,
-1.18971, 0.5942515, -1.679274, 1, 0.6666667, 0, 1,
-1.176415, -0.875662, -2.731457, 1, 0.6705883, 0, 1,
-1.174497, 1.523894, -1.164422, 1, 0.6784314, 0, 1,
-1.173739, 0.1841497, -2.596549, 1, 0.682353, 0, 1,
-1.173136, -0.1999078, -0.7570498, 1, 0.6901961, 0, 1,
-1.172109, 0.6087747, -1.508588, 1, 0.6941177, 0, 1,
-1.170976, 1.139842, -1.904698, 1, 0.7019608, 0, 1,
-1.156114, 1.27089, -0.4404364, 1, 0.7098039, 0, 1,
-1.153717, 1.673148, -0.4088758, 1, 0.7137255, 0, 1,
-1.153153, 1.158552, -0.339536, 1, 0.7215686, 0, 1,
-1.148257, -0.7745902, 0.4165826, 1, 0.7254902, 0, 1,
-1.144509, 0.7110772, -2.68416, 1, 0.7333333, 0, 1,
-1.141411, 1.230761, -0.8726047, 1, 0.7372549, 0, 1,
-1.127466, -1.298167, -1.230242, 1, 0.7450981, 0, 1,
-1.126916, 0.9061223, -0.6845806, 1, 0.7490196, 0, 1,
-1.125098, -0.4123941, -2.406099, 1, 0.7568628, 0, 1,
-1.125026, 0.5819747, -1.544424, 1, 0.7607843, 0, 1,
-1.123491, -2.835253, -0.9436833, 1, 0.7686275, 0, 1,
-1.118728, 1.249889, -0.6262829, 1, 0.772549, 0, 1,
-1.11488, -0.2053067, -2.010614, 1, 0.7803922, 0, 1,
-1.114017, -1.698305, -1.34801, 1, 0.7843137, 0, 1,
-1.110267, 0.1332062, -3.414016, 1, 0.7921569, 0, 1,
-1.109942, 0.1448563, -2.200526, 1, 0.7960784, 0, 1,
-1.103001, -0.1686902, -0.4968885, 1, 0.8039216, 0, 1,
-1.102322, -1.450463, -2.235347, 1, 0.8117647, 0, 1,
-1.071386, -1.616179, -2.501889, 1, 0.8156863, 0, 1,
-1.069935, -0.1768181, -2.885874, 1, 0.8235294, 0, 1,
-1.062117, -0.8683062, -2.944977, 1, 0.827451, 0, 1,
-1.058461, 2.343957, -0.03198012, 1, 0.8352941, 0, 1,
-1.049372, 0.3145234, -0.6325473, 1, 0.8392157, 0, 1,
-1.046916, 2.643694, 0.4604819, 1, 0.8470588, 0, 1,
-1.038758, 0.1457825, -2.330932, 1, 0.8509804, 0, 1,
-1.038222, -0.1616589, -0.589038, 1, 0.8588235, 0, 1,
-1.036685, -0.3711672, -0.4460777, 1, 0.8627451, 0, 1,
-1.017791, 0.3161745, -1.448725, 1, 0.8705882, 0, 1,
-1.013813, -0.7691535, -1.694428, 1, 0.8745098, 0, 1,
-1.013629, 0.5150912, -1.147706, 1, 0.8823529, 0, 1,
-1.009892, -0.1657058, -3.004226, 1, 0.8862745, 0, 1,
-1.008141, 0.07006011, -3.093602, 1, 0.8941177, 0, 1,
-1.006091, 0.3833777, -1.886954, 1, 0.8980392, 0, 1,
-1.002002, 1.097044, -1.247726, 1, 0.9058824, 0, 1,
-0.9988153, -0.9003196, -3.016578, 1, 0.9137255, 0, 1,
-0.9949442, -1.114822, -3.468907, 1, 0.9176471, 0, 1,
-0.9920598, -1.904205, -4.57289, 1, 0.9254902, 0, 1,
-0.9847153, 0.222163, -2.495801, 1, 0.9294118, 0, 1,
-0.9822598, 0.3118789, -1.619648, 1, 0.9372549, 0, 1,
-0.9796888, 1.655713, -1.120968, 1, 0.9411765, 0, 1,
-0.9774914, -0.5424813, -1.811433, 1, 0.9490196, 0, 1,
-0.9727787, 0.6491919, -1.227379, 1, 0.9529412, 0, 1,
-0.9624959, 0.4850947, -1.046604, 1, 0.9607843, 0, 1,
-0.9558128, -1.339131, -1.339669, 1, 0.9647059, 0, 1,
-0.9543297, 0.5008709, 0.274224, 1, 0.972549, 0, 1,
-0.9506811, -2.082771, -1.416614, 1, 0.9764706, 0, 1,
-0.94014, -1.139841, -3.325474, 1, 0.9843137, 0, 1,
-0.9369003, -0.2716885, -2.263631, 1, 0.9882353, 0, 1,
-0.9236122, -0.2402933, -3.457202, 1, 0.9960784, 0, 1,
-0.9182491, -1.164755, -1.905699, 0.9960784, 1, 0, 1,
-0.9175746, -0.9903812, -2.533023, 0.9921569, 1, 0, 1,
-0.907347, -0.510555, -3.962283, 0.9843137, 1, 0, 1,
-0.9068224, -0.2897544, -3.611771, 0.9803922, 1, 0, 1,
-0.9065053, -1.633627, -4.130614, 0.972549, 1, 0, 1,
-0.905206, -2.072989, -3.511545, 0.9686275, 1, 0, 1,
-0.904799, 0.04377297, -1.462269, 0.9607843, 1, 0, 1,
-0.9020583, 0.6394769, -1.355516, 0.9568627, 1, 0, 1,
-0.8959525, 1.731804, -0.3495756, 0.9490196, 1, 0, 1,
-0.891777, -1.924973, -3.462319, 0.945098, 1, 0, 1,
-0.8914044, -0.8513892, -0.9026041, 0.9372549, 1, 0, 1,
-0.8898147, -1.093338, -3.298784, 0.9333333, 1, 0, 1,
-0.8896036, -0.4537667, -2.286954, 0.9254902, 1, 0, 1,
-0.8872097, -0.4022534, -2.727696, 0.9215686, 1, 0, 1,
-0.8820557, -1.31762, -1.944127, 0.9137255, 1, 0, 1,
-0.8817318, 1.684906, -0.9196693, 0.9098039, 1, 0, 1,
-0.8797633, -1.3935, -1.418676, 0.9019608, 1, 0, 1,
-0.8776081, -1.360839, -3.587734, 0.8941177, 1, 0, 1,
-0.8760673, 0.5531367, -0.5435848, 0.8901961, 1, 0, 1,
-0.8740998, 1.608024, 0.5005485, 0.8823529, 1, 0, 1,
-0.869761, -0.3352664, -3.007716, 0.8784314, 1, 0, 1,
-0.8681105, 0.2254645, 0.7906711, 0.8705882, 1, 0, 1,
-0.8666445, -0.3003451, -0.7604107, 0.8666667, 1, 0, 1,
-0.8587651, 0.973986, -0.6202936, 0.8588235, 1, 0, 1,
-0.8542976, 0.7303922, 0.4185287, 0.854902, 1, 0, 1,
-0.848727, -0.6760796, 0.05325559, 0.8470588, 1, 0, 1,
-0.8425124, 2.33339, 0.2137302, 0.8431373, 1, 0, 1,
-0.831723, 0.523427, -0.7457956, 0.8352941, 1, 0, 1,
-0.8290345, -0.3531746, -1.555856, 0.8313726, 1, 0, 1,
-0.8285214, -0.09599945, -3.055216, 0.8235294, 1, 0, 1,
-0.8274057, 0.5756183, -0.1072595, 0.8196079, 1, 0, 1,
-0.8269808, 0.5820633, 0.638624, 0.8117647, 1, 0, 1,
-0.8267456, -0.7486835, -3.421012, 0.8078431, 1, 0, 1,
-0.826575, 1.390991, 1.342359, 0.8, 1, 0, 1,
-0.8217589, 2.065547, -1.380428, 0.7921569, 1, 0, 1,
-0.8198793, 0.4906531, -2.884111, 0.7882353, 1, 0, 1,
-0.8145584, -0.1075324, -2.64743, 0.7803922, 1, 0, 1,
-0.8085438, -0.2012791, -0.02989275, 0.7764706, 1, 0, 1,
-0.8058232, 0.307991, 1.096504, 0.7686275, 1, 0, 1,
-0.7938809, -0.2606893, 0.0168872, 0.7647059, 1, 0, 1,
-0.7872796, -0.9541967, -3.224899, 0.7568628, 1, 0, 1,
-0.7864919, -0.2009453, -2.191752, 0.7529412, 1, 0, 1,
-0.7806444, 1.33155, 0.1007285, 0.7450981, 1, 0, 1,
-0.7804046, 2.18171, -2.662203, 0.7411765, 1, 0, 1,
-0.774536, -0.847602, -4.189399, 0.7333333, 1, 0, 1,
-0.7734437, 0.3485898, -0.5824063, 0.7294118, 1, 0, 1,
-0.7731503, 0.02468101, -2.10444, 0.7215686, 1, 0, 1,
-0.7726098, -0.335861, -4.029899, 0.7176471, 1, 0, 1,
-0.7705949, -1.38357, -1.333101, 0.7098039, 1, 0, 1,
-0.7649605, -0.1789444, -0.6899129, 0.7058824, 1, 0, 1,
-0.7609798, -0.2176983, -2.018589, 0.6980392, 1, 0, 1,
-0.7556916, -1.050737, -2.218927, 0.6901961, 1, 0, 1,
-0.7535294, 1.031605, 1.170982, 0.6862745, 1, 0, 1,
-0.752522, -0.1747403, -1.125111, 0.6784314, 1, 0, 1,
-0.7446695, 0.7738167, -1.536879, 0.6745098, 1, 0, 1,
-0.7346924, -1.77651, -4.263944, 0.6666667, 1, 0, 1,
-0.7323372, -0.693609, -1.696076, 0.6627451, 1, 0, 1,
-0.725435, 2.240882, -1.127548, 0.654902, 1, 0, 1,
-0.7158547, 0.8282056, -2.006458, 0.6509804, 1, 0, 1,
-0.7152625, 2.378064, 0.5320101, 0.6431373, 1, 0, 1,
-0.715247, -0.5370911, -0.9102071, 0.6392157, 1, 0, 1,
-0.7127447, 0.09708643, -1.981126, 0.6313726, 1, 0, 1,
-0.7077635, 0.4391417, -0.09224695, 0.627451, 1, 0, 1,
-0.6994653, 1.237344, -1.483479, 0.6196079, 1, 0, 1,
-0.6957448, 1.140885, 0.5115002, 0.6156863, 1, 0, 1,
-0.6953399, -1.836471, -1.908462, 0.6078432, 1, 0, 1,
-0.6881471, -0.6374151, -3.85015, 0.6039216, 1, 0, 1,
-0.6873867, 2.254905, 0.2267202, 0.5960785, 1, 0, 1,
-0.6865404, 0.7875449, -2.965415, 0.5882353, 1, 0, 1,
-0.6836322, -0.1153868, -2.298005, 0.5843138, 1, 0, 1,
-0.6834902, -1.661142, -3.957037, 0.5764706, 1, 0, 1,
-0.6821909, -0.3634946, -1.47256, 0.572549, 1, 0, 1,
-0.6820918, 0.6541057, 0.5716847, 0.5647059, 1, 0, 1,
-0.6743539, -0.6439258, -1.835908, 0.5607843, 1, 0, 1,
-0.6677138, 0.03123896, -1.147907, 0.5529412, 1, 0, 1,
-0.6626707, 2.284219, -0.3670562, 0.5490196, 1, 0, 1,
-0.6605109, -0.6367313, -1.405101, 0.5411765, 1, 0, 1,
-0.6532387, -0.2468413, -2.793373, 0.5372549, 1, 0, 1,
-0.6531512, -2.157782, -4.600562, 0.5294118, 1, 0, 1,
-0.6499724, -0.8194531, -2.057756, 0.5254902, 1, 0, 1,
-0.6460934, 0.3695116, -1.751926, 0.5176471, 1, 0, 1,
-0.6421688, -1.475778, -3.022203, 0.5137255, 1, 0, 1,
-0.6417271, 0.3698381, -1.493259, 0.5058824, 1, 0, 1,
-0.6411499, -0.01036722, -1.046435, 0.5019608, 1, 0, 1,
-0.6405382, -0.3785399, -0.7406985, 0.4941176, 1, 0, 1,
-0.6382758, 1.941762, -2.498544, 0.4862745, 1, 0, 1,
-0.6287271, -0.2316617, -1.516499, 0.4823529, 1, 0, 1,
-0.6253485, 0.4776896, -0.6589698, 0.4745098, 1, 0, 1,
-0.6226081, 2.57638, 0.4757325, 0.4705882, 1, 0, 1,
-0.6199602, -0.4878113, -2.529295, 0.4627451, 1, 0, 1,
-0.6193609, 0.6506569, -0.03188005, 0.4588235, 1, 0, 1,
-0.616828, 1.205523, -0.7362505, 0.4509804, 1, 0, 1,
-0.6148281, -0.6361296, -3.149877, 0.4470588, 1, 0, 1,
-0.6144518, 0.2214535, 0.515396, 0.4392157, 1, 0, 1,
-0.6121128, -0.8339598, -3.207396, 0.4352941, 1, 0, 1,
-0.6079922, -0.8780856, -1.296663, 0.427451, 1, 0, 1,
-0.6063519, -0.4774199, -2.078269, 0.4235294, 1, 0, 1,
-0.606277, 1.372216, 0.7171034, 0.4156863, 1, 0, 1,
-0.600502, -1.384511, -2.180486, 0.4117647, 1, 0, 1,
-0.5868766, -0.06961425, -2.091619, 0.4039216, 1, 0, 1,
-0.5842779, 1.464015, 0.04141872, 0.3960784, 1, 0, 1,
-0.5836653, -0.491816, -3.651142, 0.3921569, 1, 0, 1,
-0.5834087, 0.7392388, -0.9076241, 0.3843137, 1, 0, 1,
-0.5799391, -0.2166, -1.431901, 0.3803922, 1, 0, 1,
-0.5750498, 0.02556284, -0.8786137, 0.372549, 1, 0, 1,
-0.571156, -0.07088451, -1.456318, 0.3686275, 1, 0, 1,
-0.5656518, 0.5082644, -0.7150769, 0.3607843, 1, 0, 1,
-0.5639002, 0.7501447, -0.1104254, 0.3568628, 1, 0, 1,
-0.5613272, -0.6234267, -4.188958, 0.3490196, 1, 0, 1,
-0.5575624, 1.683453, 0.872013, 0.345098, 1, 0, 1,
-0.5560803, 0.738304, -0.6453049, 0.3372549, 1, 0, 1,
-0.5557104, -0.1745426, -3.119359, 0.3333333, 1, 0, 1,
-0.5553842, 0.09493425, -3.3033, 0.3254902, 1, 0, 1,
-0.553614, -0.6870769, -1.814742, 0.3215686, 1, 0, 1,
-0.5493745, 0.01033458, -1.294734, 0.3137255, 1, 0, 1,
-0.5431995, -0.7084587, -2.223486, 0.3098039, 1, 0, 1,
-0.5377867, 0.7976636, 0.0004901236, 0.3019608, 1, 0, 1,
-0.5369641, 0.478191, -1.338841, 0.2941177, 1, 0, 1,
-0.5340511, -0.8667541, -2.546795, 0.2901961, 1, 0, 1,
-0.5339295, -1.352526, -4.460507, 0.282353, 1, 0, 1,
-0.5313776, -1.004646, -3.42673, 0.2784314, 1, 0, 1,
-0.5275566, 0.3120626, -2.702185, 0.2705882, 1, 0, 1,
-0.5228306, 0.5666417, -0.3233931, 0.2666667, 1, 0, 1,
-0.5187442, 1.167297, 1.102759, 0.2588235, 1, 0, 1,
-0.5181852, -0.1684635, -1.74988, 0.254902, 1, 0, 1,
-0.5167223, 0.03690402, -1.592668, 0.2470588, 1, 0, 1,
-0.516088, -0.02102281, -2.133746, 0.2431373, 1, 0, 1,
-0.5137404, 0.4673966, -3.645705, 0.2352941, 1, 0, 1,
-0.5113482, 0.3942007, -0.213402, 0.2313726, 1, 0, 1,
-0.5075886, -0.4150254, -2.669168, 0.2235294, 1, 0, 1,
-0.5048591, 1.857755, -0.4067485, 0.2196078, 1, 0, 1,
-0.5015474, -0.9261297, -3.243723, 0.2117647, 1, 0, 1,
-0.5014521, -1.348365, -2.282076, 0.2078431, 1, 0, 1,
-0.5010974, -1.026572, -2.253973, 0.2, 1, 0, 1,
-0.4936076, -0.4854325, -2.13595, 0.1921569, 1, 0, 1,
-0.4849691, -1.572175, -3.135147, 0.1882353, 1, 0, 1,
-0.484691, -0.2546688, -2.075331, 0.1803922, 1, 0, 1,
-0.4846241, -1.190682, -3.134313, 0.1764706, 1, 0, 1,
-0.4819231, -0.01158016, -0.6445323, 0.1686275, 1, 0, 1,
-0.4811219, -1.267684, -1.783114, 0.1647059, 1, 0, 1,
-0.479648, 2.066655, -0.3603377, 0.1568628, 1, 0, 1,
-0.4788859, -1.380816, -2.611021, 0.1529412, 1, 0, 1,
-0.4779565, 0.7063509, 0.6920769, 0.145098, 1, 0, 1,
-0.4748232, 0.2233664, -0.2496053, 0.1411765, 1, 0, 1,
-0.4745801, 0.7956062, -0.8466036, 0.1333333, 1, 0, 1,
-0.467978, 0.871961, -2.459875, 0.1294118, 1, 0, 1,
-0.4575962, -0.9965661, -4.954042, 0.1215686, 1, 0, 1,
-0.4549269, -0.9903686, -1.756481, 0.1176471, 1, 0, 1,
-0.453923, -1.073508, -2.915912, 0.1098039, 1, 0, 1,
-0.4526275, 0.8171712, -1.18522, 0.1058824, 1, 0, 1,
-0.4504978, 0.02181827, -1.538475, 0.09803922, 1, 0, 1,
-0.4428278, 0.7173318, -0.7302434, 0.09019608, 1, 0, 1,
-0.4407344, 0.247793, -2.222127, 0.08627451, 1, 0, 1,
-0.4401435, -0.5534145, -2.153469, 0.07843138, 1, 0, 1,
-0.4401298, -0.7028726, -1.808681, 0.07450981, 1, 0, 1,
-0.4380397, -0.5046832, -3.845867, 0.06666667, 1, 0, 1,
-0.4379643, -2.033034, -2.444455, 0.0627451, 1, 0, 1,
-0.4304987, -1.170946, -1.047023, 0.05490196, 1, 0, 1,
-0.4273824, -0.1121272, -2.157434, 0.05098039, 1, 0, 1,
-0.4273697, 0.046392, -0.1467346, 0.04313726, 1, 0, 1,
-0.4233437, -0.2153444, -4.04735, 0.03921569, 1, 0, 1,
-0.4179371, 0.7915198, -1.390565, 0.03137255, 1, 0, 1,
-0.4173553, 0.2602654, 0.9144623, 0.02745098, 1, 0, 1,
-0.4166971, 0.03011954, -1.619048, 0.01960784, 1, 0, 1,
-0.4160141, -1.20699, -3.451937, 0.01568628, 1, 0, 1,
-0.4138348, -1.764332, -1.952901, 0.007843138, 1, 0, 1,
-0.4101606, 1.280988, -1.047749, 0.003921569, 1, 0, 1,
-0.4096939, -0.7569474, -2.77392, 0, 1, 0.003921569, 1,
-0.4088043, -1.739357, -1.474174, 0, 1, 0.01176471, 1,
-0.4083019, -0.04944258, -0.9895003, 0, 1, 0.01568628, 1,
-0.407695, -0.6700851, -2.809227, 0, 1, 0.02352941, 1,
-0.3924164, 0.8566926, 0.5968334, 0, 1, 0.02745098, 1,
-0.3897082, 0.3051288, -2.026261, 0, 1, 0.03529412, 1,
-0.3879555, 0.2794839, 0.3902586, 0, 1, 0.03921569, 1,
-0.3845626, -0.1487699, -1.264644, 0, 1, 0.04705882, 1,
-0.3843046, 1.227301, -0.04452844, 0, 1, 0.05098039, 1,
-0.3802758, -0.6843512, -3.297836, 0, 1, 0.05882353, 1,
-0.3715928, 0.2427643, -0.497331, 0, 1, 0.0627451, 1,
-0.368686, 0.2337049, 1.270142, 0, 1, 0.07058824, 1,
-0.3660545, 0.03622062, -1.581074, 0, 1, 0.07450981, 1,
-0.3634765, 0.6674614, -0.6401649, 0, 1, 0.08235294, 1,
-0.3563206, -0.2764071, -1.726486, 0, 1, 0.08627451, 1,
-0.3498952, -0.44225, -1.831094, 0, 1, 0.09411765, 1,
-0.3411868, -0.1312198, -1.480288, 0, 1, 0.1019608, 1,
-0.3382409, -0.08426222, -2.439168, 0, 1, 0.1058824, 1,
-0.3381986, -0.889643, -3.118371, 0, 1, 0.1137255, 1,
-0.3366674, 0.02634812, 1.696969, 0, 1, 0.1176471, 1,
-0.3350132, -0.6945758, -2.110277, 0, 1, 0.1254902, 1,
-0.3333184, 0.5686851, -0.5973991, 0, 1, 0.1294118, 1,
-0.3306749, -0.5811368, -2.975964, 0, 1, 0.1372549, 1,
-0.328185, 1.971156, 0.549243, 0, 1, 0.1411765, 1,
-0.326506, -0.5315937, -3.501914, 0, 1, 0.1490196, 1,
-0.324086, -1.775118, -2.03359, 0, 1, 0.1529412, 1,
-0.3209273, -1.137933, -1.493324, 0, 1, 0.1607843, 1,
-0.3208551, -0.6828275, -2.713725, 0, 1, 0.1647059, 1,
-0.317845, 0.4698201, -0.9371282, 0, 1, 0.172549, 1,
-0.3124875, 1.12112, -1.495105, 0, 1, 0.1764706, 1,
-0.3123034, 0.2060318, -0.9062182, 0, 1, 0.1843137, 1,
-0.3115436, -0.8785589, -2.035002, 0, 1, 0.1882353, 1,
-0.3110486, 0.8510273, -0.3807274, 0, 1, 0.1960784, 1,
-0.3078702, 0.1936182, -2.18562, 0, 1, 0.2039216, 1,
-0.3055864, 0.144178, -1.046452, 0, 1, 0.2078431, 1,
-0.2987678, -0.9850031, -1.536888, 0, 1, 0.2156863, 1,
-0.298353, -0.3196154, -3.199869, 0, 1, 0.2196078, 1,
-0.2974442, 1.275023, 0.9601797, 0, 1, 0.227451, 1,
-0.2957093, -0.4835138, -2.628992, 0, 1, 0.2313726, 1,
-0.2938375, 0.5303807, -0.2263137, 0, 1, 0.2392157, 1,
-0.2929819, -0.4819793, -2.687236, 0, 1, 0.2431373, 1,
-0.2925493, -0.2515621, -1.929095, 0, 1, 0.2509804, 1,
-0.2917554, 0.97278, 0.8922506, 0, 1, 0.254902, 1,
-0.2898955, -0.3232636, -2.006264, 0, 1, 0.2627451, 1,
-0.2878313, 0.8293714, -0.2577574, 0, 1, 0.2666667, 1,
-0.2848564, -1.484968, -1.976865, 0, 1, 0.2745098, 1,
-0.281613, 0.8533225, -2.112122, 0, 1, 0.2784314, 1,
-0.2787537, 0.8750938, 0.1612045, 0, 1, 0.2862745, 1,
-0.278438, -0.3850733, -1.258948, 0, 1, 0.2901961, 1,
-0.2716278, -2.055871, -3.016463, 0, 1, 0.2980392, 1,
-0.2706583, 1.809792, -1.852571, 0, 1, 0.3058824, 1,
-0.2653728, -0.3893655, -3.311872, 0, 1, 0.3098039, 1,
-0.2581635, 2.702559, -0.2944572, 0, 1, 0.3176471, 1,
-0.2569868, 1.325887, 1.814534, 0, 1, 0.3215686, 1,
-0.2524316, -0.6389272, -0.01885457, 0, 1, 0.3294118, 1,
-0.24899, 0.01066569, -2.077883, 0, 1, 0.3333333, 1,
-0.2441627, -0.3254038, -2.734232, 0, 1, 0.3411765, 1,
-0.2428558, -1.136111, -2.863109, 0, 1, 0.345098, 1,
-0.2428447, 0.0916032, -0.2259484, 0, 1, 0.3529412, 1,
-0.2417546, 0.2648251, -0.3975313, 0, 1, 0.3568628, 1,
-0.2335329, 0.4402625, -0.2360044, 0, 1, 0.3647059, 1,
-0.2323437, 0.05052507, -1.170726, 0, 1, 0.3686275, 1,
-0.2275354, 0.5493461, 0.2536643, 0, 1, 0.3764706, 1,
-0.2236018, 1.174576, -0.8273544, 0, 1, 0.3803922, 1,
-0.2220618, -0.2059633, -1.205994, 0, 1, 0.3882353, 1,
-0.2196795, -2.671194, -1.64289, 0, 1, 0.3921569, 1,
-0.2128749, -0.3383077, -3.510738, 0, 1, 0.4, 1,
-0.2127125, -0.01870044, -0.9059009, 0, 1, 0.4078431, 1,
-0.212003, -1.14458, -3.399721, 0, 1, 0.4117647, 1,
-0.2096917, -0.3164222, -1.084213, 0, 1, 0.4196078, 1,
-0.2094515, 0.4305613, 0.08425668, 0, 1, 0.4235294, 1,
-0.2087223, 0.9315376, 0.413421, 0, 1, 0.4313726, 1,
-0.2077883, 0.2734624, 0.8561648, 0, 1, 0.4352941, 1,
-0.2076419, -0.3116361, -2.836162, 0, 1, 0.4431373, 1,
-0.2031609, -0.05546969, -0.0613621, 0, 1, 0.4470588, 1,
-0.2028432, 1.499424, 1.614436, 0, 1, 0.454902, 1,
-0.2005953, -1.251165, -2.96537, 0, 1, 0.4588235, 1,
-0.2003777, -0.1108615, -2.048659, 0, 1, 0.4666667, 1,
-0.1941797, -1.283053, -3.638067, 0, 1, 0.4705882, 1,
-0.1909886, 0.4876558, 1.233874, 0, 1, 0.4784314, 1,
-0.1887367, 0.06210463, -0.5039999, 0, 1, 0.4823529, 1,
-0.187739, 0.1272818, -0.7270489, 0, 1, 0.4901961, 1,
-0.1867698, -0.8027925, -2.067691, 0, 1, 0.4941176, 1,
-0.1854199, 1.812199, -0.188302, 0, 1, 0.5019608, 1,
-0.1792413, -0.4479853, -3.729345, 0, 1, 0.509804, 1,
-0.1786041, -0.6481118, -3.748384, 0, 1, 0.5137255, 1,
-0.1774122, -0.3414221, -3.20865, 0, 1, 0.5215687, 1,
-0.1770611, 1.310121, -0.4534043, 0, 1, 0.5254902, 1,
-0.1713176, 0.2262137, -1.920057, 0, 1, 0.5333334, 1,
-0.171257, -2.09918, -3.149241, 0, 1, 0.5372549, 1,
-0.1607721, 0.6720628, -1.267084, 0, 1, 0.5450981, 1,
-0.1530689, 0.2067977, -1.404849, 0, 1, 0.5490196, 1,
-0.1510236, 0.7008007, -1.101697, 0, 1, 0.5568628, 1,
-0.1461278, -0.9196898, -4.767707, 0, 1, 0.5607843, 1,
-0.142321, 2.203469, -1.823055, 0, 1, 0.5686275, 1,
-0.1377282, 0.8126136, 0.08208707, 0, 1, 0.572549, 1,
-0.1359143, 2.662942, 0.5281392, 0, 1, 0.5803922, 1,
-0.1332988, -2.333256, -3.187798, 0, 1, 0.5843138, 1,
-0.1331989, -2.056359, -2.859774, 0, 1, 0.5921569, 1,
-0.1327207, 0.4590128, -0.9420117, 0, 1, 0.5960785, 1,
-0.1314281, 0.4524533, 0.09851108, 0, 1, 0.6039216, 1,
-0.1293306, -0.2305114, -2.358663, 0, 1, 0.6117647, 1,
-0.1288697, -0.4679072, -3.580401, 0, 1, 0.6156863, 1,
-0.1285349, -0.7992513, -3.246667, 0, 1, 0.6235294, 1,
-0.1249671, 0.9416268, -1.86564, 0, 1, 0.627451, 1,
-0.1249623, -0.6561936, -2.904697, 0, 1, 0.6352941, 1,
-0.1202315, -0.06795442, -1.496376, 0, 1, 0.6392157, 1,
-0.1195313, 0.411925, 0.008284431, 0, 1, 0.6470588, 1,
-0.1194245, 0.4756909, -2.075558, 0, 1, 0.6509804, 1,
-0.1176641, -1.057662, -4.361506, 0, 1, 0.6588235, 1,
-0.1110064, -0.8110398, -2.813089, 0, 1, 0.6627451, 1,
-0.1081578, -0.8681139, -3.356835, 0, 1, 0.6705883, 1,
-0.1070622, 0.08839778, -2.192429, 0, 1, 0.6745098, 1,
-0.1061104, -0.7434137, -3.430933, 0, 1, 0.682353, 1,
-0.1046828, -1.222957, -2.639144, 0, 1, 0.6862745, 1,
-0.1022053, 1.126149, -1.012847, 0, 1, 0.6941177, 1,
-0.1018679, 0.9782535, -0.5615202, 0, 1, 0.7019608, 1,
-0.09871192, -0.1592862, -1.069044, 0, 1, 0.7058824, 1,
-0.09766117, -1.083207, -1.355094, 0, 1, 0.7137255, 1,
-0.09151454, -0.7850876, -4.346539, 0, 1, 0.7176471, 1,
-0.09010792, 0.9284822, -0.3573977, 0, 1, 0.7254902, 1,
-0.08850684, 0.8693104, -0.312708, 0, 1, 0.7294118, 1,
-0.08515493, 0.5513957, 0.2128765, 0, 1, 0.7372549, 1,
-0.08498278, -0.8870478, -3.90851, 0, 1, 0.7411765, 1,
-0.08413967, -1.699485, -1.551535, 0, 1, 0.7490196, 1,
-0.08260978, 0.2495901, -0.677, 0, 1, 0.7529412, 1,
-0.08141102, -2.070217, -1.730886, 0, 1, 0.7607843, 1,
-0.08076951, -0.3750477, -3.784081, 0, 1, 0.7647059, 1,
-0.07908168, -0.8083027, -1.599542, 0, 1, 0.772549, 1,
-0.07308944, 0.7758192, -0.2420218, 0, 1, 0.7764706, 1,
-0.06706797, -0.3939901, -1.796624, 0, 1, 0.7843137, 1,
-0.06282197, 1.970666, -0.1243518, 0, 1, 0.7882353, 1,
-0.05862455, -1.302431, -3.306411, 0, 1, 0.7960784, 1,
-0.05850703, -2.214654, -2.510335, 0, 1, 0.8039216, 1,
-0.05833198, 0.4874841, 0.3864487, 0, 1, 0.8078431, 1,
-0.05817251, 0.1420849, 0.2303021, 0, 1, 0.8156863, 1,
-0.0568504, 0.2406613, -1.56852, 0, 1, 0.8196079, 1,
-0.05471058, -0.05228421, -0.5219672, 0, 1, 0.827451, 1,
-0.0545456, 2.205566, -0.8910961, 0, 1, 0.8313726, 1,
-0.05295018, -1.195582, -2.800144, 0, 1, 0.8392157, 1,
-0.05288589, -0.5687017, -4.612338, 0, 1, 0.8431373, 1,
-0.05230673, 0.03824871, -1.294142, 0, 1, 0.8509804, 1,
-0.0493524, -0.8772469, -5.150885, 0, 1, 0.854902, 1,
-0.04934372, -0.1047886, -2.306016, 0, 1, 0.8627451, 1,
-0.04352039, -0.7033603, -3.635881, 0, 1, 0.8666667, 1,
-0.04274964, 0.1002836, -1.239677, 0, 1, 0.8745098, 1,
-0.04201683, -1.010778, -1.740562, 0, 1, 0.8784314, 1,
-0.04149973, -1.107456, -2.519207, 0, 1, 0.8862745, 1,
-0.03949398, 2.030738, 1.095342, 0, 1, 0.8901961, 1,
-0.03941944, 0.8687593, 0.0009698837, 0, 1, 0.8980392, 1,
-0.0362961, -0.3729376, -2.134349, 0, 1, 0.9058824, 1,
-0.03319075, -0.02476309, -3.489354, 0, 1, 0.9098039, 1,
-0.029917, 2.088616, -0.4280473, 0, 1, 0.9176471, 1,
-0.02690622, 1.094972, -0.07091843, 0, 1, 0.9215686, 1,
-0.02657565, -1.052132, -3.771985, 0, 1, 0.9294118, 1,
-0.02343411, 1.01115, 0.3067608, 0, 1, 0.9333333, 1,
-0.02078773, -0.3564087, -5.079529, 0, 1, 0.9411765, 1,
-0.01934906, 0.9671555, 0.1571546, 0, 1, 0.945098, 1,
-0.01716404, -0.04091608, -2.978152, 0, 1, 0.9529412, 1,
-0.01489478, -0.0842066, -3.68905, 0, 1, 0.9568627, 1,
-0.01315123, -0.06193798, -2.68534, 0, 1, 0.9647059, 1,
-0.01065395, -0.2601046, -3.743093, 0, 1, 0.9686275, 1,
-0.01025048, -1.137619, -3.821777, 0, 1, 0.9764706, 1,
-0.008860569, 0.7529871, -0.2434613, 0, 1, 0.9803922, 1,
-0.004046529, -0.4753065, -4.536126, 0, 1, 0.9882353, 1,
0.0005661547, 1.302271, 0.1121251, 0, 1, 0.9921569, 1,
0.002968496, 1.591729, 0.8168922, 0, 1, 1, 1,
0.003960106, 0.1984355, -1.249559, 0, 0.9921569, 1, 1,
0.005135785, -0.1897687, 3.746511, 0, 0.9882353, 1, 1,
0.006631874, 1.110869, -0.3574916, 0, 0.9803922, 1, 1,
0.008106964, 0.3782099, -1.794725, 0, 0.9764706, 1, 1,
0.008993365, 1.135248, 1.221947, 0, 0.9686275, 1, 1,
0.01198038, 0.8969616, -1.567566, 0, 0.9647059, 1, 1,
0.01829283, -0.03781581, 3.110823, 0, 0.9568627, 1, 1,
0.02133932, 0.8419037, -0.8481323, 0, 0.9529412, 1, 1,
0.02318484, -0.4715605, 3.898618, 0, 0.945098, 1, 1,
0.02322064, 0.9760942, 0.4919359, 0, 0.9411765, 1, 1,
0.02652041, -0.9091442, 2.854647, 0, 0.9333333, 1, 1,
0.03064469, -0.526284, 1.308777, 0, 0.9294118, 1, 1,
0.03091486, 0.1970536, -1.590862, 0, 0.9215686, 1, 1,
0.0324936, -1.133268, 4.174888, 0, 0.9176471, 1, 1,
0.0326186, 0.2093563, 0.8770784, 0, 0.9098039, 1, 1,
0.03677932, 0.8457031, -0.247822, 0, 0.9058824, 1, 1,
0.04471492, 0.1401718, -1.176686, 0, 0.8980392, 1, 1,
0.04566431, -0.1328183, 2.352379, 0, 0.8901961, 1, 1,
0.0507979, 0.475346, -0.7203699, 0, 0.8862745, 1, 1,
0.0521424, -1.52813, 2.239309, 0, 0.8784314, 1, 1,
0.05260986, 2.154973, -1.058853, 0, 0.8745098, 1, 1,
0.05799643, -1.215739, 3.866705, 0, 0.8666667, 1, 1,
0.06091865, 0.5058089, 0.09859461, 0, 0.8627451, 1, 1,
0.06190816, 0.3749327, 0.8611127, 0, 0.854902, 1, 1,
0.06855717, 0.1222007, -0.1495865, 0, 0.8509804, 1, 1,
0.06971706, 0.296382, 0.3610236, 0, 0.8431373, 1, 1,
0.07117129, 0.9510579, 0.7337444, 0, 0.8392157, 1, 1,
0.0712617, 0.3581743, -0.9024835, 0, 0.8313726, 1, 1,
0.07179136, 0.4315434, -0.7391551, 0, 0.827451, 1, 1,
0.07528674, -0.1487375, 2.472207, 0, 0.8196079, 1, 1,
0.07596413, 1.170211, 0.3632428, 0, 0.8156863, 1, 1,
0.08002779, -0.538097, 1.257576, 0, 0.8078431, 1, 1,
0.08152009, -1.293122, 2.547719, 0, 0.8039216, 1, 1,
0.08170173, -0.5739377, 2.582173, 0, 0.7960784, 1, 1,
0.08181115, 0.3310743, -0.8204572, 0, 0.7882353, 1, 1,
0.08214527, -2.08981, 3.201724, 0, 0.7843137, 1, 1,
0.08219267, 0.8248507, -0.5089386, 0, 0.7764706, 1, 1,
0.08379345, 0.1206085, 1.354877, 0, 0.772549, 1, 1,
0.08584397, 0.4810488, -0.4534547, 0, 0.7647059, 1, 1,
0.09219239, 0.6650417, 1.118819, 0, 0.7607843, 1, 1,
0.09404679, 1.348549, 1.010136, 0, 0.7529412, 1, 1,
0.09493222, -0.6440364, 2.111595, 0, 0.7490196, 1, 1,
0.09555166, 0.521272, 1.594225, 0, 0.7411765, 1, 1,
0.09834406, -0.2500449, 2.416735, 0, 0.7372549, 1, 1,
0.09920462, 0.5750376, 0.2557144, 0, 0.7294118, 1, 1,
0.1006765, 0.4360748, 1.736301, 0, 0.7254902, 1, 1,
0.1056715, -0.04875926, 3.112218, 0, 0.7176471, 1, 1,
0.1094342, 1.283557, -0.3544602, 0, 0.7137255, 1, 1,
0.1110486, 1.157666, 2.372234, 0, 0.7058824, 1, 1,
0.1115652, 0.6609879, 0.5329856, 0, 0.6980392, 1, 1,
0.1132022, 0.3064193, 0.7340761, 0, 0.6941177, 1, 1,
0.1169103, -2.061008, 3.187986, 0, 0.6862745, 1, 1,
0.1190524, -0.646997, 2.568037, 0, 0.682353, 1, 1,
0.119484, 0.1673833, 0.4952083, 0, 0.6745098, 1, 1,
0.1222826, 0.3280934, 1.433087, 0, 0.6705883, 1, 1,
0.1233577, -0.704186, 3.413465, 0, 0.6627451, 1, 1,
0.1245519, 0.6270799, 1.53221, 0, 0.6588235, 1, 1,
0.1253548, 1.135034, -0.4590293, 0, 0.6509804, 1, 1,
0.1275756, 0.06480943, -0.2659661, 0, 0.6470588, 1, 1,
0.1277493, 0.7084939, -0.5072613, 0, 0.6392157, 1, 1,
0.1287437, -0.6370022, 2.740029, 0, 0.6352941, 1, 1,
0.1292619, 0.5453589, 0.3396649, 0, 0.627451, 1, 1,
0.1309622, 1.23225, -0.1369754, 0, 0.6235294, 1, 1,
0.1315422, 0.2170822, 0.8042421, 0, 0.6156863, 1, 1,
0.1325825, 0.5777282, 1.216282, 0, 0.6117647, 1, 1,
0.134049, 1.114264, 0.4762705, 0, 0.6039216, 1, 1,
0.1357163, 0.5708228, -0.3429711, 0, 0.5960785, 1, 1,
0.1386876, -0.7912577, 2.444757, 0, 0.5921569, 1, 1,
0.1410998, 1.127129, 0.4193016, 0, 0.5843138, 1, 1,
0.1443378, -0.4505957, 2.329968, 0, 0.5803922, 1, 1,
0.1461302, -0.7611065, 5.317779, 0, 0.572549, 1, 1,
0.1464187, -0.1450269, 1.733335, 0, 0.5686275, 1, 1,
0.1524971, 0.0212076, 0.4156406, 0, 0.5607843, 1, 1,
0.1568528, 0.3746079, 1.864102, 0, 0.5568628, 1, 1,
0.1641013, -0.4708555, 3.305656, 0, 0.5490196, 1, 1,
0.1694601, -1.402546, 1.172859, 0, 0.5450981, 1, 1,
0.1717321, 0.07072292, 1.294395, 0, 0.5372549, 1, 1,
0.1762099, 1.360412, 0.4456353, 0, 0.5333334, 1, 1,
0.1855053, 0.3957323, 0.689613, 0, 0.5254902, 1, 1,
0.1969964, -0.03738711, 2.786004, 0, 0.5215687, 1, 1,
0.1970893, 0.4581214, -0.0122553, 0, 0.5137255, 1, 1,
0.1972693, -0.5601633, 1.380944, 0, 0.509804, 1, 1,
0.2051883, -1.022723, 2.438563, 0, 0.5019608, 1, 1,
0.2108284, -0.3431531, 1.161421, 0, 0.4941176, 1, 1,
0.2112373, -0.6370946, 2.509608, 0, 0.4901961, 1, 1,
0.2138309, 0.1119784, 0.395211, 0, 0.4823529, 1, 1,
0.2170407, 0.1322654, 1.421011, 0, 0.4784314, 1, 1,
0.2185401, -0.6868594, 2.452202, 0, 0.4705882, 1, 1,
0.2213462, -0.7405998, 1.918515, 0, 0.4666667, 1, 1,
0.2264338, -0.09398204, 2.661574, 0, 0.4588235, 1, 1,
0.226601, -0.9736865, 2.887301, 0, 0.454902, 1, 1,
0.2278262, 1.863469, 0.206169, 0, 0.4470588, 1, 1,
0.2320176, -0.598205, 4.688836, 0, 0.4431373, 1, 1,
0.2327034, -1.256809, 1.395832, 0, 0.4352941, 1, 1,
0.234374, -0.8689457, 2.95398, 0, 0.4313726, 1, 1,
0.2370216, 0.4319583, 0.6386074, 0, 0.4235294, 1, 1,
0.2384871, -1.419721, 3.465858, 0, 0.4196078, 1, 1,
0.243652, -1.187348, 2.622716, 0, 0.4117647, 1, 1,
0.2466236, 0.5400015, 0.04784467, 0, 0.4078431, 1, 1,
0.2519858, -1.611072, 4.408032, 0, 0.4, 1, 1,
0.2529867, -0.03546654, 2.239769, 0, 0.3921569, 1, 1,
0.2535843, -1.899872, 3.254145, 0, 0.3882353, 1, 1,
0.254086, 0.6474206, -0.4515744, 0, 0.3803922, 1, 1,
0.2547715, 0.029129, -0.9075092, 0, 0.3764706, 1, 1,
0.2614362, -0.6127799, 2.703511, 0, 0.3686275, 1, 1,
0.264492, 0.3833795, 0.6394901, 0, 0.3647059, 1, 1,
0.2649553, -0.2681397, 1.307529, 0, 0.3568628, 1, 1,
0.2669487, 0.3391732, 0.81537, 0, 0.3529412, 1, 1,
0.2763404, 0.0145219, 1.988576, 0, 0.345098, 1, 1,
0.2849555, 0.7844785, -0.6991578, 0, 0.3411765, 1, 1,
0.2903628, 1.145607, 0.7407706, 0, 0.3333333, 1, 1,
0.2911596, -0.6692959, 3.22044, 0, 0.3294118, 1, 1,
0.2927266, 1.187668, -0.6123977, 0, 0.3215686, 1, 1,
0.2946804, 2.042836, -0.1872874, 0, 0.3176471, 1, 1,
0.3042619, 0.2907529, -0.3189759, 0, 0.3098039, 1, 1,
0.3067362, 0.7546964, 0.1408962, 0, 0.3058824, 1, 1,
0.3103379, 0.3302749, -0.6839323, 0, 0.2980392, 1, 1,
0.310437, -1.118088, 2.515357, 0, 0.2901961, 1, 1,
0.3111601, 1.4101, -0.3879511, 0, 0.2862745, 1, 1,
0.3121176, -1.219444, 1.589773, 0, 0.2784314, 1, 1,
0.3130447, 1.06024, 1.872026, 0, 0.2745098, 1, 1,
0.3167857, 0.8178696, -0.07389452, 0, 0.2666667, 1, 1,
0.3181334, 0.06331308, 2.211773, 0, 0.2627451, 1, 1,
0.318785, -0.335622, 2.826444, 0, 0.254902, 1, 1,
0.3264977, 0.7203677, 1.200492, 0, 0.2509804, 1, 1,
0.3317509, 0.5821611, 1.140822, 0, 0.2431373, 1, 1,
0.3345726, -0.9256068, 3.308696, 0, 0.2392157, 1, 1,
0.3371486, 1.050658, 0.1458707, 0, 0.2313726, 1, 1,
0.3486102, 0.1468817, -0.8471779, 0, 0.227451, 1, 1,
0.3503904, 0.2756792, 0.05756857, 0, 0.2196078, 1, 1,
0.3509316, -2.454015, 4.46397, 0, 0.2156863, 1, 1,
0.3546723, 0.9225041, 0.5095274, 0, 0.2078431, 1, 1,
0.3558184, 1.696405, -0.187872, 0, 0.2039216, 1, 1,
0.3590822, 1.333382, -4.683805e-05, 0, 0.1960784, 1, 1,
0.3595991, 0.7042912, -0.4506271, 0, 0.1882353, 1, 1,
0.3641103, -1.575077, 4.062594, 0, 0.1843137, 1, 1,
0.3693843, 0.303524, -0.6158841, 0, 0.1764706, 1, 1,
0.3710113, 1.334755, -0.03204809, 0, 0.172549, 1, 1,
0.371635, -0.3371901, 2.115973, 0, 0.1647059, 1, 1,
0.3730435, 0.7407063, 0.8353541, 0, 0.1607843, 1, 1,
0.3735819, 1.378442, 0.4610985, 0, 0.1529412, 1, 1,
0.3762498, 0.3850291, 1.916107, 0, 0.1490196, 1, 1,
0.3764048, -1.617391, 4.440072, 0, 0.1411765, 1, 1,
0.3776757, -0.05736806, 1.617619, 0, 0.1372549, 1, 1,
0.3833049, 1.270974, 0.02307217, 0, 0.1294118, 1, 1,
0.3914599, -0.2494847, 0.3340402, 0, 0.1254902, 1, 1,
0.3961298, 1.414747, 0.1859966, 0, 0.1176471, 1, 1,
0.3973488, -1.085038, 2.662566, 0, 0.1137255, 1, 1,
0.4123198, -1.054922, 3.627769, 0, 0.1058824, 1, 1,
0.4152642, -1.513377, 2.90431, 0, 0.09803922, 1, 1,
0.4199305, 1.052018, -0.4352937, 0, 0.09411765, 1, 1,
0.4234161, -0.2431077, 2.301321, 0, 0.08627451, 1, 1,
0.4247081, -0.2924021, 2.321266, 0, 0.08235294, 1, 1,
0.4251547, -1.121544, 1.562317, 0, 0.07450981, 1, 1,
0.4253794, -0.5890201, 2.001128, 0, 0.07058824, 1, 1,
0.4274173, -1.507981, 2.629325, 0, 0.0627451, 1, 1,
0.4312642, 0.01567446, 2.493343, 0, 0.05882353, 1, 1,
0.4341222, -0.1093426, 1.837523, 0, 0.05098039, 1, 1,
0.4343466, 1.058042, 0.4411328, 0, 0.04705882, 1, 1,
0.4350759, -0.4663503, 3.939421, 0, 0.03921569, 1, 1,
0.4391668, 1.130186, -0.9129826, 0, 0.03529412, 1, 1,
0.4405131, -0.4734552, 2.705444, 0, 0.02745098, 1, 1,
0.4469134, -0.03577646, 1.939537, 0, 0.02352941, 1, 1,
0.4515576, 0.4330564, 1.175825, 0, 0.01568628, 1, 1,
0.4584348, 0.4169496, 0.5410095, 0, 0.01176471, 1, 1,
0.4594511, 0.2367246, 1.404637, 0, 0.003921569, 1, 1,
0.459706, 0.3142532, 1.011502, 0.003921569, 0, 1, 1,
0.4603701, 0.1692254, 1.648334, 0.007843138, 0, 1, 1,
0.4665441, -1.71323, 4.04371, 0.01568628, 0, 1, 1,
0.475409, -0.4053253, 2.092963, 0.01960784, 0, 1, 1,
0.4768872, -2.004851, 2.254753, 0.02745098, 0, 1, 1,
0.4771655, -0.8591967, 4.792338, 0.03137255, 0, 1, 1,
0.4772546, 0.2471, 1.524216, 0.03921569, 0, 1, 1,
0.4810909, 0.7140346, 0.5557805, 0.04313726, 0, 1, 1,
0.4822854, -1.076623, 2.555981, 0.05098039, 0, 1, 1,
0.4835338, 0.01056211, 1.211012, 0.05490196, 0, 1, 1,
0.4868833, 0.8146547, 1.760195, 0.0627451, 0, 1, 1,
0.4909876, -0.5919681, 0.7461481, 0.06666667, 0, 1, 1,
0.4919801, -2.588469, 3.805006, 0.07450981, 0, 1, 1,
0.4936492, -0.3039151, 2.224644, 0.07843138, 0, 1, 1,
0.4958053, -1.819074, 3.007918, 0.08627451, 0, 1, 1,
0.4982745, -0.03928142, 3.02622, 0.09019608, 0, 1, 1,
0.4983954, 0.5197558, 1.21153, 0.09803922, 0, 1, 1,
0.5040363, 0.4542955, -0.19699, 0.1058824, 0, 1, 1,
0.5054901, -1.412086, 1.781579, 0.1098039, 0, 1, 1,
0.5066897, -0.5219371, 3.423371, 0.1176471, 0, 1, 1,
0.5069281, 0.08369403, 1.226886, 0.1215686, 0, 1, 1,
0.5088559, 2.135782, -0.4844846, 0.1294118, 0, 1, 1,
0.5111238, 0.5726448, 0.3351604, 0.1333333, 0, 1, 1,
0.5195227, 1.138125, 0.7830673, 0.1411765, 0, 1, 1,
0.5218824, -1.605685, 3.580922, 0.145098, 0, 1, 1,
0.5294744, 0.3652616, 1.406044, 0.1529412, 0, 1, 1,
0.5313728, -0.8490212, 3.413922, 0.1568628, 0, 1, 1,
0.5344592, 2.33586, -0.3854772, 0.1647059, 0, 1, 1,
0.5373175, 0.9498416, 0.1678554, 0.1686275, 0, 1, 1,
0.5378098, -1.352417, 2.465897, 0.1764706, 0, 1, 1,
0.537979, 0.4180711, -0.4308694, 0.1803922, 0, 1, 1,
0.5397356, 0.7886211, -0.1815557, 0.1882353, 0, 1, 1,
0.5420446, 0.1278615, 0.128784, 0.1921569, 0, 1, 1,
0.5427385, -0.874782, 2.247353, 0.2, 0, 1, 1,
0.5429816, -0.2488443, 3.095549, 0.2078431, 0, 1, 1,
0.5525711, 0.01034421, 0.9210821, 0.2117647, 0, 1, 1,
0.5563789, -0.6478845, 2.503765, 0.2196078, 0, 1, 1,
0.5571222, 2.443075, 1.591462, 0.2235294, 0, 1, 1,
0.5571955, -0.9193981, 2.348674, 0.2313726, 0, 1, 1,
0.5573755, 0.7577708, 2.587706, 0.2352941, 0, 1, 1,
0.5639802, 0.6698464, 1.526055, 0.2431373, 0, 1, 1,
0.569163, -3.002886, 2.727203, 0.2470588, 0, 1, 1,
0.5717219, 0.1097422, 2.078233, 0.254902, 0, 1, 1,
0.5737658, -0.4563014, 1.535577, 0.2588235, 0, 1, 1,
0.5793222, 0.6634226, 0.9394424, 0.2666667, 0, 1, 1,
0.5816035, -1.350544, 4.927521, 0.2705882, 0, 1, 1,
0.5832809, 0.1708717, 3.366683, 0.2784314, 0, 1, 1,
0.5961935, 0.02551032, -0.2757088, 0.282353, 0, 1, 1,
0.5964538, -1.015222, 2.019574, 0.2901961, 0, 1, 1,
0.5972357, -0.4887487, 3.083056, 0.2941177, 0, 1, 1,
0.6006511, 1.075436, 0.1659159, 0.3019608, 0, 1, 1,
0.6056143, -1.701727, 1.332939, 0.3098039, 0, 1, 1,
0.612928, -0.8257781, 2.813442, 0.3137255, 0, 1, 1,
0.6144337, -0.6064033, 1.610475, 0.3215686, 0, 1, 1,
0.6160954, 0.6888649, 1.389225, 0.3254902, 0, 1, 1,
0.6168036, -0.5089476, 3.357758, 0.3333333, 0, 1, 1,
0.621693, 0.2465663, 1.738994, 0.3372549, 0, 1, 1,
0.6243551, -0.1981041, 1.666867, 0.345098, 0, 1, 1,
0.627298, -2.267136, 3.055074, 0.3490196, 0, 1, 1,
0.628705, -0.5869728, 2.7277, 0.3568628, 0, 1, 1,
0.628885, 1.439691, -0.567672, 0.3607843, 0, 1, 1,
0.6374537, 1.670695, -2.342284, 0.3686275, 0, 1, 1,
0.6421614, 0.2965487, -0.8028727, 0.372549, 0, 1, 1,
0.6422165, -1.298206, 0.5473947, 0.3803922, 0, 1, 1,
0.643845, 0.3649273, -0.1922266, 0.3843137, 0, 1, 1,
0.644369, -0.6557789, 3.112651, 0.3921569, 0, 1, 1,
0.6452068, 1.221401, 1.174704, 0.3960784, 0, 1, 1,
0.6505285, 0.1862622, 1.658272, 0.4039216, 0, 1, 1,
0.6513572, -0.3441215, 3.247795, 0.4117647, 0, 1, 1,
0.6515706, -0.5962269, 1.259082, 0.4156863, 0, 1, 1,
0.6593252, -0.4299768, 3.021306, 0.4235294, 0, 1, 1,
0.6615632, -1.962898, 2.355123, 0.427451, 0, 1, 1,
0.6620781, 0.5334631, 1.424725, 0.4352941, 0, 1, 1,
0.6627601, 0.8434054, 1.945764, 0.4392157, 0, 1, 1,
0.6632302, -0.8904499, 1.766693, 0.4470588, 0, 1, 1,
0.6664402, 1.671039, 1.424929, 0.4509804, 0, 1, 1,
0.66939, 1.503937, -2.247796, 0.4588235, 0, 1, 1,
0.6718815, -0.9527283, 0.322548, 0.4627451, 0, 1, 1,
0.6741438, 0.7724378, 1.262377, 0.4705882, 0, 1, 1,
0.6781762, -1.088443, 1.544948, 0.4745098, 0, 1, 1,
0.6781909, 0.06101657, 0.06360818, 0.4823529, 0, 1, 1,
0.6832459, -0.6233062, 3.515068, 0.4862745, 0, 1, 1,
0.6841873, 1.016163, 0.5003285, 0.4941176, 0, 1, 1,
0.684239, -2.119, 2.437567, 0.5019608, 0, 1, 1,
0.6917279, -2.601822, 3.161513, 0.5058824, 0, 1, 1,
0.6917635, 3.107339, 0.05470716, 0.5137255, 0, 1, 1,
0.6982927, 1.141047, 1.590337, 0.5176471, 0, 1, 1,
0.7005616, 1.241207, 1.361873, 0.5254902, 0, 1, 1,
0.7024437, 0.598581, -1.394718, 0.5294118, 0, 1, 1,
0.7030582, -0.04169341, 1.986984, 0.5372549, 0, 1, 1,
0.7115866, 0.6020207, 0.1802213, 0.5411765, 0, 1, 1,
0.7151893, 0.5069513, 1.834297, 0.5490196, 0, 1, 1,
0.7166571, -1.681486, 1.35573, 0.5529412, 0, 1, 1,
0.7169939, 0.709733, 0.5167117, 0.5607843, 0, 1, 1,
0.7186009, -0.5699394, 2.510532, 0.5647059, 0, 1, 1,
0.7200334, 0.1712967, -0.2271484, 0.572549, 0, 1, 1,
0.7214486, 1.07189, 1.114696, 0.5764706, 0, 1, 1,
0.7271121, 0.1766516, -0.06876607, 0.5843138, 0, 1, 1,
0.7328095, 0.1991467, 1.072042, 0.5882353, 0, 1, 1,
0.7347979, -0.05633909, 2.84772, 0.5960785, 0, 1, 1,
0.7360675, -0.2074768, 3.823903, 0.6039216, 0, 1, 1,
0.7382734, 1.361499, 0.3181475, 0.6078432, 0, 1, 1,
0.7395983, -0.8921878, 0.4879101, 0.6156863, 0, 1, 1,
0.7476336, 0.6186783, 1.451138, 0.6196079, 0, 1, 1,
0.7514513, 0.3218378, 0.1862083, 0.627451, 0, 1, 1,
0.7563603, 1.107954, 1.16368, 0.6313726, 0, 1, 1,
0.7567387, -0.124789, -1.24695, 0.6392157, 0, 1, 1,
0.7604886, -0.1452967, 0.8862868, 0.6431373, 0, 1, 1,
0.763984, 0.5945035, -0.1116148, 0.6509804, 0, 1, 1,
0.7647025, 0.3478762, 2.494675, 0.654902, 0, 1, 1,
0.7683218, 0.5540571, 1.085596, 0.6627451, 0, 1, 1,
0.7733908, 0.9896505, 0.6025894, 0.6666667, 0, 1, 1,
0.7759628, 0.8455817, 0.8581212, 0.6745098, 0, 1, 1,
0.7783756, -0.2764209, 1.488219, 0.6784314, 0, 1, 1,
0.7793427, -0.2542922, 0.9675823, 0.6862745, 0, 1, 1,
0.7828071, 0.5756513, 0.7788604, 0.6901961, 0, 1, 1,
0.7872347, 1.029196, 1.930253, 0.6980392, 0, 1, 1,
0.7911224, -0.6171623, 2.531226, 0.7058824, 0, 1, 1,
0.7954043, -0.2683805, 2.247294, 0.7098039, 0, 1, 1,
0.8063117, -2.524665, 3.613101, 0.7176471, 0, 1, 1,
0.8145302, 0.5326168, 2.66177, 0.7215686, 0, 1, 1,
0.8146072, -0.9623163, 1.793865, 0.7294118, 0, 1, 1,
0.8164324, 0.008409666, 1.538929, 0.7333333, 0, 1, 1,
0.8164947, -1.865142, 3.195531, 0.7411765, 0, 1, 1,
0.8240054, 1.677264, 0.3079545, 0.7450981, 0, 1, 1,
0.825581, -1.057011, 2.939487, 0.7529412, 0, 1, 1,
0.8276429, -0.9507418, 1.525208, 0.7568628, 0, 1, 1,
0.8276528, -1.249513, 2.147914, 0.7647059, 0, 1, 1,
0.8292834, -2.247644, 2.763053, 0.7686275, 0, 1, 1,
0.8299485, 0.09960397, 1.956731, 0.7764706, 0, 1, 1,
0.832963, -0.9803854, 3.545378, 0.7803922, 0, 1, 1,
0.8335369, 1.042652, -0.6133055, 0.7882353, 0, 1, 1,
0.8427995, -0.07782576, -0.01573233, 0.7921569, 0, 1, 1,
0.8439966, 0.7260376, 0.2552165, 0.8, 0, 1, 1,
0.8468708, -0.1107178, 2.588665, 0.8078431, 0, 1, 1,
0.8488885, -0.430024, 2.53865, 0.8117647, 0, 1, 1,
0.8513682, -0.7068495, 3.255697, 0.8196079, 0, 1, 1,
0.8530642, -0.4928142, 1.6429, 0.8235294, 0, 1, 1,
0.8534804, 2.095216, 0.1424172, 0.8313726, 0, 1, 1,
0.8608221, -0.4297681, 2.06735, 0.8352941, 0, 1, 1,
0.8608269, 0.6173337, 0.5260127, 0.8431373, 0, 1, 1,
0.8608698, 0.7611008, -0.597188, 0.8470588, 0, 1, 1,
0.8661677, -0.003680925, 0.5646012, 0.854902, 0, 1, 1,
0.8731926, -0.5502064, 0.2944874, 0.8588235, 0, 1, 1,
0.8735701, 0.1757719, 1.865475, 0.8666667, 0, 1, 1,
0.8737626, -0.944871, 2.560283, 0.8705882, 0, 1, 1,
0.8742744, -1.113479, 0.3938409, 0.8784314, 0, 1, 1,
0.8836827, 0.6377144, 1.432354, 0.8823529, 0, 1, 1,
0.8854701, 0.2830969, 0.9924338, 0.8901961, 0, 1, 1,
0.8873572, -1.104772, 0.3380047, 0.8941177, 0, 1, 1,
0.8900823, 0.6029894, 0.2496698, 0.9019608, 0, 1, 1,
0.8995837, 1.694651, 2.318925, 0.9098039, 0, 1, 1,
0.900764, 1.358902, 0.1904115, 0.9137255, 0, 1, 1,
0.9016303, 2.071657, -0.4185342, 0.9215686, 0, 1, 1,
0.9019242, -0.1131082, 1.658926, 0.9254902, 0, 1, 1,
0.9093953, -0.09957209, 0.2385228, 0.9333333, 0, 1, 1,
0.9214103, 1.087661, 0.6339942, 0.9372549, 0, 1, 1,
0.9293282, 0.05841513, 1.805304, 0.945098, 0, 1, 1,
0.9350033, 0.0449055, 0.7553742, 0.9490196, 0, 1, 1,
0.943802, -0.6453906, 5.253587, 0.9568627, 0, 1, 1,
0.9460347, 1.205857, 1.145329, 0.9607843, 0, 1, 1,
0.9460583, 0.3126677, 1.189683, 0.9686275, 0, 1, 1,
0.9465962, -0.8863849, 3.282501, 0.972549, 0, 1, 1,
0.9509616, -0.4705836, 2.837997, 0.9803922, 0, 1, 1,
0.9564364, -1.786009, 3.480217, 0.9843137, 0, 1, 1,
0.9591354, 1.596971, -0.3477713, 0.9921569, 0, 1, 1,
0.9637817, 0.6854085, 1.327769, 0.9960784, 0, 1, 1,
0.9774192, 1.799773, 0.4114768, 1, 0, 0.9960784, 1,
0.9790941, -1.0242, 4.187756, 1, 0, 0.9882353, 1,
0.9843113, 0.177089, 2.159526, 1, 0, 0.9843137, 1,
0.9875941, -1.424464, 2.389848, 1, 0, 0.9764706, 1,
0.9933814, -2.18637, 2.888863, 1, 0, 0.972549, 1,
0.9985941, 0.2414426, 0.9020848, 1, 0, 0.9647059, 1,
0.9994395, 1.474641, -0.1497322, 1, 0, 0.9607843, 1,
1.007708, -2.088463, 4.16815, 1, 0, 0.9529412, 1,
1.012575, -0.7983017, 2.780773, 1, 0, 0.9490196, 1,
1.012663, -1.921153, 1.467137, 1, 0, 0.9411765, 1,
1.013826, -1.172493, 3.209235, 1, 0, 0.9372549, 1,
1.023953, 0.1758338, 1.579257, 1, 0, 0.9294118, 1,
1.034104, -0.4093786, 2.24227, 1, 0, 0.9254902, 1,
1.047883, 0.7106317, 1.017342, 1, 0, 0.9176471, 1,
1.057949, -0.5175877, 1.302259, 1, 0, 0.9137255, 1,
1.068027, -0.1220197, 1.429734, 1, 0, 0.9058824, 1,
1.06952, -0.3571247, 1.089103, 1, 0, 0.9019608, 1,
1.070415, -0.06306688, 2.625779, 1, 0, 0.8941177, 1,
1.079593, -0.4532671, 2.743408, 1, 0, 0.8862745, 1,
1.088042, -1.421067, 2.9067, 1, 0, 0.8823529, 1,
1.090672, 1.552674, 1.552406, 1, 0, 0.8745098, 1,
1.092545, 0.8080061, 0.2304241, 1, 0, 0.8705882, 1,
1.093787, -0.6946684, 1.780733, 1, 0, 0.8627451, 1,
1.099667, -2.291569, 4.895739, 1, 0, 0.8588235, 1,
1.103025, 1.061696, 0.1989282, 1, 0, 0.8509804, 1,
1.10539, -0.812095, 2.180252, 1, 0, 0.8470588, 1,
1.111884, 0.1016057, 2.054549, 1, 0, 0.8392157, 1,
1.117483, 0.3036674, 1.803857, 1, 0, 0.8352941, 1,
1.133624, -0.9408202, 2.614122, 1, 0, 0.827451, 1,
1.133753, -1.037611, 3.077309, 1, 0, 0.8235294, 1,
1.140972, 1.626177, -0.4463178, 1, 0, 0.8156863, 1,
1.147808, -0.03988392, 1.636928, 1, 0, 0.8117647, 1,
1.150068, 0.3146698, -0.4857126, 1, 0, 0.8039216, 1,
1.150156, 0.597087, 0.7774845, 1, 0, 0.7960784, 1,
1.151153, -1.092725, 2.583426, 1, 0, 0.7921569, 1,
1.158347, -0.4450398, 2.432639, 1, 0, 0.7843137, 1,
1.166811, 0.1809205, 2.070969, 1, 0, 0.7803922, 1,
1.166888, 0.6430437, 0.861451, 1, 0, 0.772549, 1,
1.169142, 2.179729, 0.5738685, 1, 0, 0.7686275, 1,
1.185707, 1.782845, 2.838842, 1, 0, 0.7607843, 1,
1.192156, -0.08143512, 1.076467, 1, 0, 0.7568628, 1,
1.199435, -0.1162249, 0.2289635, 1, 0, 0.7490196, 1,
1.207647, 0.5997961, -0.0926108, 1, 0, 0.7450981, 1,
1.210183, -2.526917, 3.331819, 1, 0, 0.7372549, 1,
1.213724, 0.7188429, 1.258893, 1, 0, 0.7333333, 1,
1.213823, 0.9840868, 0.9947377, 1, 0, 0.7254902, 1,
1.220597, -0.7769995, 1.306714, 1, 0, 0.7215686, 1,
1.221024, 1.318885, 0.9613073, 1, 0, 0.7137255, 1,
1.227641, -0.2530449, 1.143542, 1, 0, 0.7098039, 1,
1.229852, 2.009247, 1.052903, 1, 0, 0.7019608, 1,
1.231497, 0.1112744, 1.261364, 1, 0, 0.6941177, 1,
1.231793, 0.4789659, 3.288153, 1, 0, 0.6901961, 1,
1.233113, 1.925203, -0.5092009, 1, 0, 0.682353, 1,
1.234907, -0.2515363, 0.231458, 1, 0, 0.6784314, 1,
1.240949, -0.6598133, 3.108718, 1, 0, 0.6705883, 1,
1.24294, -0.08615074, 0.8204995, 1, 0, 0.6666667, 1,
1.246347, 0.4551918, -0.005508393, 1, 0, 0.6588235, 1,
1.249328, -0.6114318, 0.9559739, 1, 0, 0.654902, 1,
1.25554, -1.549949, 2.855059, 1, 0, 0.6470588, 1,
1.256482, 0.7537416, 0.1420064, 1, 0, 0.6431373, 1,
1.258851, 1.5975, 1.897419, 1, 0, 0.6352941, 1,
1.260991, 1.238822, 0.08188739, 1, 0, 0.6313726, 1,
1.274201, -0.6817836, 2.330458, 1, 0, 0.6235294, 1,
1.276506, 0.548404, 2.016824, 1, 0, 0.6196079, 1,
1.280562, -1.744989, 1.735456, 1, 0, 0.6117647, 1,
1.289317, 0.2748332, 1.750277, 1, 0, 0.6078432, 1,
1.291255, -0.870502, 1.620528, 1, 0, 0.6, 1,
1.306096, -1.482196, 2.40325, 1, 0, 0.5921569, 1,
1.318862, -2.281906, 3.737859, 1, 0, 0.5882353, 1,
1.327221, 2.162228, -0.5968628, 1, 0, 0.5803922, 1,
1.330077, -0.9946294, 2.441922, 1, 0, 0.5764706, 1,
1.335872, 0.549957, 1.510576, 1, 0, 0.5686275, 1,
1.352376, 0.0227314, 2.279358, 1, 0, 0.5647059, 1,
1.362216, -0.3322831, -0.4584439, 1, 0, 0.5568628, 1,
1.374004, -0.4279909, 0.3626027, 1, 0, 0.5529412, 1,
1.381696, 0.2309215, 2.70485, 1, 0, 0.5450981, 1,
1.388854, -0.1697027, 2.325734, 1, 0, 0.5411765, 1,
1.392826, -0.3382338, 2.29476, 1, 0, 0.5333334, 1,
1.404493, -1.818169, 4.141419, 1, 0, 0.5294118, 1,
1.409629, 1.634644, 0.72285, 1, 0, 0.5215687, 1,
1.415905, 0.3132682, 0.7666519, 1, 0, 0.5176471, 1,
1.419542, -0.03482756, 2.664483, 1, 0, 0.509804, 1,
1.426372, -0.3680094, 0.8908204, 1, 0, 0.5058824, 1,
1.428805, -0.4291534, 1.660795, 1, 0, 0.4980392, 1,
1.430375, -0.7915282, 2.376663, 1, 0, 0.4901961, 1,
1.432301, 0.005635773, 0.301039, 1, 0, 0.4862745, 1,
1.447045, -0.6457779, 1.694706, 1, 0, 0.4784314, 1,
1.448568, -0.3803491, -0.5119185, 1, 0, 0.4745098, 1,
1.458681, -1.020375, 2.685719, 1, 0, 0.4666667, 1,
1.461491, 0.3940733, 1.284134, 1, 0, 0.4627451, 1,
1.464318, 0.7200537, 0.4895699, 1, 0, 0.454902, 1,
1.470571, 0.08231898, 2.448581, 1, 0, 0.4509804, 1,
1.487316, -0.7671591, 1.343415, 1, 0, 0.4431373, 1,
1.49094, -1.00709, 3.453866, 1, 0, 0.4392157, 1,
1.495115, -0.3078538, 2.054908, 1, 0, 0.4313726, 1,
1.499874, -1.165161, 2.771354, 1, 0, 0.427451, 1,
1.5042, -0.7730445, 2.108283, 1, 0, 0.4196078, 1,
1.538472, -0.912565, 0.587478, 1, 0, 0.4156863, 1,
1.543431, 1.111894, -0.09507639, 1, 0, 0.4078431, 1,
1.574947, 0.4618761, -0.6472654, 1, 0, 0.4039216, 1,
1.575637, -0.6556283, 3.387502, 1, 0, 0.3960784, 1,
1.586695, 2.272391, 2.26466, 1, 0, 0.3882353, 1,
1.601419, 0.8708091, 1.668082, 1, 0, 0.3843137, 1,
1.601813, -1.744666, 2.26459, 1, 0, 0.3764706, 1,
1.608462, 0.07443654, 1.675584, 1, 0, 0.372549, 1,
1.611458, 1.355721, -0.8296459, 1, 0, 0.3647059, 1,
1.613016, 0.8861004, 2.313473, 1, 0, 0.3607843, 1,
1.61755, 0.5527304, 2.023608, 1, 0, 0.3529412, 1,
1.635049, -0.4473408, 3.597888, 1, 0, 0.3490196, 1,
1.63562, 0.2772914, 1.197934, 1, 0, 0.3411765, 1,
1.668799, 1.702412, 1.996075, 1, 0, 0.3372549, 1,
1.670239, -0.3878796, 1.366956, 1, 0, 0.3294118, 1,
1.67504, -0.4041607, 2.239416, 1, 0, 0.3254902, 1,
1.685383, -0.6008965, 3.238148, 1, 0, 0.3176471, 1,
1.68552, -1.89874, 2.003709, 1, 0, 0.3137255, 1,
1.688523, 0.006011471, 0.519156, 1, 0, 0.3058824, 1,
1.69464, -0.2013034, 4.090923, 1, 0, 0.2980392, 1,
1.706697, -0.4795865, 1.119107, 1, 0, 0.2941177, 1,
1.713286, -0.1679088, 1.275555, 1, 0, 0.2862745, 1,
1.723404, -1.519415, 3.688792, 1, 0, 0.282353, 1,
1.730114, -1.26903, 2.126978, 1, 0, 0.2745098, 1,
1.732866, -0.5486837, 2.502131, 1, 0, 0.2705882, 1,
1.763651, -1.999142, 3.393038, 1, 0, 0.2627451, 1,
1.76916, 0.006825764, 1.902934, 1, 0, 0.2588235, 1,
1.778238, -0.09241305, 1.063357, 1, 0, 0.2509804, 1,
1.789674, -0.5403836, 1.354308, 1, 0, 0.2470588, 1,
1.793433, -1.579316, 3.323806, 1, 0, 0.2392157, 1,
1.806352, 0.1616367, 3.951907, 1, 0, 0.2352941, 1,
1.812095, 0.8919982, 2.085992, 1, 0, 0.227451, 1,
1.813289, 0.3450427, -0.377954, 1, 0, 0.2235294, 1,
1.832979, 0.4832958, -0.009631778, 1, 0, 0.2156863, 1,
1.839575, -1.182249, 2.245531, 1, 0, 0.2117647, 1,
1.84243, -0.7322037, 2.252039, 1, 0, 0.2039216, 1,
1.850486, -0.7710349, 5.471577, 1, 0, 0.1960784, 1,
1.884954, 1.035637, 3.546036, 1, 0, 0.1921569, 1,
1.902696, -0.8176883, 3.354361, 1, 0, 0.1843137, 1,
1.907632, 0.8129452, 1.258168, 1, 0, 0.1803922, 1,
1.912984, -0.07428355, 1.88778, 1, 0, 0.172549, 1,
1.91393, 0.1413505, 0.2284642, 1, 0, 0.1686275, 1,
1.925772, -0.2342197, 2.224179, 1, 0, 0.1607843, 1,
1.936232, 0.03307004, 1.063107, 1, 0, 0.1568628, 1,
1.943672, -0.02573911, 0.2367455, 1, 0, 0.1490196, 1,
1.968255, -2.272334, 1.350826, 1, 0, 0.145098, 1,
1.96906, 1.487664, 0.720856, 1, 0, 0.1372549, 1,
1.969485, -0.6414309, 1.079985, 1, 0, 0.1333333, 1,
1.973088, 0.9777595, 0.1472624, 1, 0, 0.1254902, 1,
1.996271, -0.5988672, -0.394693, 1, 0, 0.1215686, 1,
1.99822, -0.341075, 2.613501, 1, 0, 0.1137255, 1,
2.007169, 0.8307838, 0.9288809, 1, 0, 0.1098039, 1,
2.110452, -0.7985992, 1.494716, 1, 0, 0.1019608, 1,
2.140134, 0.406581, 1.5688, 1, 0, 0.09411765, 1,
2.168611, 0.5715527, 1.845874, 1, 0, 0.09019608, 1,
2.191602, 0.07476467, 1.524581, 1, 0, 0.08235294, 1,
2.195755, 1.219022, 0.781582, 1, 0, 0.07843138, 1,
2.211229, 0.2572845, 2.20804, 1, 0, 0.07058824, 1,
2.29171, -1.572221, 1.668442, 1, 0, 0.06666667, 1,
2.294334, 0.1244377, 0.9039807, 1, 0, 0.05882353, 1,
2.341533, -0.2946695, 1.582344, 1, 0, 0.05490196, 1,
2.381891, -0.3181924, 0.1611651, 1, 0, 0.04705882, 1,
2.454822, -1.237907, 1.357798, 1, 0, 0.04313726, 1,
2.513649, 1.247183, 1.056794, 1, 0, 0.03529412, 1,
2.770334, 1.010269, 1.800087, 1, 0, 0.03137255, 1,
2.855294, 0.0626392, -0.07973962, 1, 0, 0.02352941, 1,
2.899729, -0.5230262, 2.308453, 1, 0, 0.01960784, 1,
2.935054, -0.8517345, 2.048993, 1, 0, 0.01176471, 1,
3.233188, 0.1164866, 0.7872567, 1, 0, 0.007843138, 1
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
0.09781504, -4.038569, -6.951392, 0, -0.5, 0.5, 0.5,
0.09781504, -4.038569, -6.951392, 1, -0.5, 0.5, 0.5,
0.09781504, -4.038569, -6.951392, 1, 1.5, 0.5, 0.5,
0.09781504, -4.038569, -6.951392, 0, 1.5, 0.5, 0.5
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
-4.10045, 0.05222654, -6.951392, 0, -0.5, 0.5, 0.5,
-4.10045, 0.05222654, -6.951392, 1, -0.5, 0.5, 0.5,
-4.10045, 0.05222654, -6.951392, 1, 1.5, 0.5, 0.5,
-4.10045, 0.05222654, -6.951392, 0, 1.5, 0.5, 0.5
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
-4.10045, -4.038569, 0.160346, 0, -0.5, 0.5, 0.5,
-4.10045, -4.038569, 0.160346, 1, -0.5, 0.5, 0.5,
-4.10045, -4.038569, 0.160346, 1, 1.5, 0.5, 0.5,
-4.10045, -4.038569, 0.160346, 0, 1.5, 0.5, 0.5
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
-3, -3.094539, -5.310222,
3, -3.094539, -5.310222,
-3, -3.094539, -5.310222,
-3, -3.251878, -5.58375,
-2, -3.094539, -5.310222,
-2, -3.251878, -5.58375,
-1, -3.094539, -5.310222,
-1, -3.251878, -5.58375,
0, -3.094539, -5.310222,
0, -3.251878, -5.58375,
1, -3.094539, -5.310222,
1, -3.251878, -5.58375,
2, -3.094539, -5.310222,
2, -3.251878, -5.58375,
3, -3.094539, -5.310222,
3, -3.251878, -5.58375
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
-3, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
-3, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
-3, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
-3, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
-2, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
-2, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
-2, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
-2, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
-1, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
-1, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
-1, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
-1, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
0, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
0, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
0, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
0, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
1, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
1, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
1, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
1, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
2, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
2, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
2, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
2, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5,
3, -3.566554, -6.130807, 0, -0.5, 0.5, 0.5,
3, -3.566554, -6.130807, 1, -0.5, 0.5, 0.5,
3, -3.566554, -6.130807, 1, 1.5, 0.5, 0.5,
3, -3.566554, -6.130807, 0, 1.5, 0.5, 0.5
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
-3.131619, -3, -5.310222,
-3.131619, 3, -5.310222,
-3.131619, -3, -5.310222,
-3.293091, -3, -5.58375,
-3.131619, -2, -5.310222,
-3.293091, -2, -5.58375,
-3.131619, -1, -5.310222,
-3.293091, -1, -5.58375,
-3.131619, 0, -5.310222,
-3.293091, 0, -5.58375,
-3.131619, 1, -5.310222,
-3.293091, 1, -5.58375,
-3.131619, 2, -5.310222,
-3.293091, 2, -5.58375,
-3.131619, 3, -5.310222,
-3.293091, 3, -5.58375
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
-3.616035, -3, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, -3, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, -3, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, -3, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, -2, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, -2, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, -2, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, -2, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, -1, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, -1, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, -1, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, -1, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, 0, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, 0, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, 0, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, 0, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, 1, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, 1, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, 1, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, 1, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, 2, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, 2, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, 2, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, 2, -6.130807, 0, 1.5, 0.5, 0.5,
-3.616035, 3, -6.130807, 0, -0.5, 0.5, 0.5,
-3.616035, 3, -6.130807, 1, -0.5, 0.5, 0.5,
-3.616035, 3, -6.130807, 1, 1.5, 0.5, 0.5,
-3.616035, 3, -6.130807, 0, 1.5, 0.5, 0.5
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
-3.131619, -3.094539, -4,
-3.131619, -3.094539, 4,
-3.131619, -3.094539, -4,
-3.293091, -3.251878, -4,
-3.131619, -3.094539, -2,
-3.293091, -3.251878, -2,
-3.131619, -3.094539, 0,
-3.293091, -3.251878, 0,
-3.131619, -3.094539, 2,
-3.293091, -3.251878, 2,
-3.131619, -3.094539, 4,
-3.293091, -3.251878, 4
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
-3.616035, -3.566554, -4, 0, -0.5, 0.5, 0.5,
-3.616035, -3.566554, -4, 1, -0.5, 0.5, 0.5,
-3.616035, -3.566554, -4, 1, 1.5, 0.5, 0.5,
-3.616035, -3.566554, -4, 0, 1.5, 0.5, 0.5,
-3.616035, -3.566554, -2, 0, -0.5, 0.5, 0.5,
-3.616035, -3.566554, -2, 1, -0.5, 0.5, 0.5,
-3.616035, -3.566554, -2, 1, 1.5, 0.5, 0.5,
-3.616035, -3.566554, -2, 0, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 0, 0, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 0, 1, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 0, 1, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 0, 0, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 2, 0, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 2, 1, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 2, 1, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 2, 0, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 4, 0, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 4, 1, -0.5, 0.5, 0.5,
-3.616035, -3.566554, 4, 1, 1.5, 0.5, 0.5,
-3.616035, -3.566554, 4, 0, 1.5, 0.5, 0.5
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
-3.131619, -3.094539, -5.310222,
-3.131619, 3.198992, -5.310222,
-3.131619, -3.094539, 5.630914,
-3.131619, 3.198992, 5.630914,
-3.131619, -3.094539, -5.310222,
-3.131619, -3.094539, 5.630914,
-3.131619, 3.198992, -5.310222,
-3.131619, 3.198992, 5.630914,
-3.131619, -3.094539, -5.310222,
3.327249, -3.094539, -5.310222,
-3.131619, -3.094539, 5.630914,
3.327249, -3.094539, 5.630914,
-3.131619, 3.198992, -5.310222,
3.327249, 3.198992, -5.310222,
-3.131619, 3.198992, 5.630914,
3.327249, 3.198992, 5.630914,
3.327249, -3.094539, -5.310222,
3.327249, 3.198992, -5.310222,
3.327249, -3.094539, 5.630914,
3.327249, 3.198992, 5.630914,
3.327249, -3.094539, -5.310222,
3.327249, -3.094539, 5.630914,
3.327249, 3.198992, -5.310222,
3.327249, 3.198992, 5.630914
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
var radius = 7.571121;
var distance = 33.68477;
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
mvMatrix.translate( -0.09781504, -0.05222654, -0.160346 );
mvMatrix.scale( 1.267411, 1.300708, 0.7481897 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.68477);
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
propanamine<-read.table("propanamine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propanamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
```

```r
y<-propanamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
```

```r
z<-propanamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
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
-3.037558, -0.2889379, -2.263281, 0, 0, 1, 1, 1,
-2.742162, 0.7785589, -2.625231, 1, 0, 0, 1, 1,
-2.671017, -0.6093082, -2.980282, 1, 0, 0, 1, 1,
-2.627596, 0.07660146, -2.123819, 1, 0, 0, 1, 1,
-2.604412, 0.6073084, -2.490623, 1, 0, 0, 1, 1,
-2.475542, 0.918117, -1.411014, 1, 0, 0, 1, 1,
-2.338316, -2.135382, -1.180424, 0, 0, 0, 1, 1,
-2.277889, -0.516094, -0.2644234, 0, 0, 0, 1, 1,
-2.24122, 1.554883, -0.1112134, 0, 0, 0, 1, 1,
-2.200746, 0.3856286, -1.773315, 0, 0, 0, 1, 1,
-2.194784, 6.550275e-05, -0.58021, 0, 0, 0, 1, 1,
-2.192682, 1.373208, -1.607165, 0, 0, 0, 1, 1,
-2.187513, -1.533347, -2.02777, 0, 0, 0, 1, 1,
-2.174834, -0.3336418, -3.865278, 1, 1, 1, 1, 1,
-2.159593, 1.264305, -0.3171152, 1, 1, 1, 1, 1,
-2.13714, 1.172116, -1.064174, 1, 1, 1, 1, 1,
-2.129391, 0.3318607, -1.668912, 1, 1, 1, 1, 1,
-2.090811, -0.1039734, -1.895586, 1, 1, 1, 1, 1,
-2.066379, 0.3472075, -1.745337, 1, 1, 1, 1, 1,
-2.041758, -1.045984, -0.9186375, 1, 1, 1, 1, 1,
-2.003846, 1.491182, -1.224484, 1, 1, 1, 1, 1,
-2.002506, -0.2938703, -0.03073, 1, 1, 1, 1, 1,
-2.000922, -0.002389353, -1.256264, 1, 1, 1, 1, 1,
-1.920775, -0.4020763, -3.239908, 1, 1, 1, 1, 1,
-1.896334, -0.3770339, -1.391757, 1, 1, 1, 1, 1,
-1.894109, 0.5196148, -0.9169387, 1, 1, 1, 1, 1,
-1.891792, 0.183422, -3.771597, 1, 1, 1, 1, 1,
-1.875555, -0.09489155, -0.434585, 1, 1, 1, 1, 1,
-1.854664, -1.631096, -2.431085, 0, 0, 1, 1, 1,
-1.848297, 0.4619206, -1.279312, 1, 0, 0, 1, 1,
-1.839109, 0.4712739, -1.368148, 1, 0, 0, 1, 1,
-1.812174, 0.4755113, 0.2653339, 1, 0, 0, 1, 1,
-1.802577, -0.52108, -1.945511, 1, 0, 0, 1, 1,
-1.78708, 1.446929, 0.3476284, 1, 0, 0, 1, 1,
-1.774464, 1.06332, -1.936641, 0, 0, 0, 1, 1,
-1.757585, 0.3773342, -0.8800363, 0, 0, 0, 1, 1,
-1.74858, 0.2875278, -2.028404, 0, 0, 0, 1, 1,
-1.74845, -0.7216412, -2.959803, 0, 0, 0, 1, 1,
-1.737738, 0.9697649, 0.4017595, 0, 0, 0, 1, 1,
-1.735869, 0.59407, -0.7685407, 0, 0, 0, 1, 1,
-1.717562, 0.07553422, -1.377339, 0, 0, 0, 1, 1,
-1.715672, -0.8883747, -4.199284, 1, 1, 1, 1, 1,
-1.711576, 0.6743552, 0.9614955, 1, 1, 1, 1, 1,
-1.69165, 1.12132, 1.357529, 1, 1, 1, 1, 1,
-1.675831, 0.1643171, -1.719022, 1, 1, 1, 1, 1,
-1.671412, 0.2836452, -2.46741, 1, 1, 1, 1, 1,
-1.668499, -1.041889, -3.997531, 1, 1, 1, 1, 1,
-1.65813, -1.023424, -3.094812, 1, 1, 1, 1, 1,
-1.640257, -0.6618349, -2.028436, 1, 1, 1, 1, 1,
-1.636749, -1.503643, -1.289276, 1, 1, 1, 1, 1,
-1.635806, 0.5074293, -1.291728, 1, 1, 1, 1, 1,
-1.632725, -0.2961341, -2.369681, 1, 1, 1, 1, 1,
-1.625488, 0.07497751, -2.124569, 1, 1, 1, 1, 1,
-1.609035, -0.9310054, -2.30968, 1, 1, 1, 1, 1,
-1.601843, -0.3833451, -1.068563, 1, 1, 1, 1, 1,
-1.594714, -1.066943, -3.660442, 1, 1, 1, 1, 1,
-1.584029, 0.5179103, -0.9410384, 0, 0, 1, 1, 1,
-1.568828, 1.333364, -3.400346, 1, 0, 0, 1, 1,
-1.55914, 0.862837, 0.07562101, 1, 0, 0, 1, 1,
-1.52787, -0.2740765, -1.409742, 1, 0, 0, 1, 1,
-1.524631, -0.9005789, -3.29235, 1, 0, 0, 1, 1,
-1.521671, -1.370218, -1.91046, 1, 0, 0, 1, 1,
-1.506529, -0.3971369, -2.241328, 0, 0, 0, 1, 1,
-1.490715, -0.1278684, -2.078214, 0, 0, 0, 1, 1,
-1.48977, 0.6525677, 0.2415942, 0, 0, 0, 1, 1,
-1.472844, -1.380203, -2.293556, 0, 0, 0, 1, 1,
-1.449648, -0.459384, -1.016365, 0, 0, 0, 1, 1,
-1.446133, -0.009074066, -1.072956, 0, 0, 0, 1, 1,
-1.432127, -0.8114057, -0.05661853, 0, 0, 0, 1, 1,
-1.420622, 0.1595184, -0.7904524, 1, 1, 1, 1, 1,
-1.398543, -0.1168581, -1.363323, 1, 1, 1, 1, 1,
-1.397279, -0.9956893, -0.834486, 1, 1, 1, 1, 1,
-1.391398, -0.5854561, -0.6077533, 1, 1, 1, 1, 1,
-1.386637, 0.0950352, -2.718372, 1, 1, 1, 1, 1,
-1.382717, 0.2737565, -1.557207, 1, 1, 1, 1, 1,
-1.381538, -0.4039756, -0.6168268, 1, 1, 1, 1, 1,
-1.379995, 0.4895004, 0.07970674, 1, 1, 1, 1, 1,
-1.376525, 0.05599988, -1.293163, 1, 1, 1, 1, 1,
-1.3643, 0.119497, -4.171737, 1, 1, 1, 1, 1,
-1.355355, -0.5181888, -2.355481, 1, 1, 1, 1, 1,
-1.348589, 0.9110139, -1.435909, 1, 1, 1, 1, 1,
-1.342593, 0.0110916, -1.440545, 1, 1, 1, 1, 1,
-1.339847, -0.4868557, -0.1572756, 1, 1, 1, 1, 1,
-1.326366, -0.8507886, -2.411994, 1, 1, 1, 1, 1,
-1.319559, 2.30511, -0.2473539, 0, 0, 1, 1, 1,
-1.311998, 0.03696785, 1.057124, 1, 0, 0, 1, 1,
-1.299407, -0.263304, 0.1438297, 1, 0, 0, 1, 1,
-1.286321, 0.3443276, -0.5586967, 1, 0, 0, 1, 1,
-1.284851, -0.7242881, -0.9364367, 1, 0, 0, 1, 1,
-1.280009, 0.03961332, -0.9298213, 1, 0, 0, 1, 1,
-1.2787, -2.255241, -3.248991, 0, 0, 0, 1, 1,
-1.278538, 1.567833, -1.741434, 0, 0, 0, 1, 1,
-1.275073, -0.6798916, -2.975297, 0, 0, 0, 1, 1,
-1.27203, -0.3950069, -1.452956, 0, 0, 0, 1, 1,
-1.266983, -0.2695714, -2.343731, 0, 0, 0, 1, 1,
-1.253092, 1.462692, 0.4007822, 0, 0, 0, 1, 1,
-1.252052, -0.110869, -2.982673, 0, 0, 0, 1, 1,
-1.248617, 0.08019956, -0.193254, 1, 1, 1, 1, 1,
-1.245515, -0.9581036, -1.855918, 1, 1, 1, 1, 1,
-1.245233, 1.091323, -0.5522433, 1, 1, 1, 1, 1,
-1.243109, 1.223824, -0.5081863, 1, 1, 1, 1, 1,
-1.242551, 1.021754, -0.501232, 1, 1, 1, 1, 1,
-1.226059, -0.6376864, -1.020459, 1, 1, 1, 1, 1,
-1.222299, -0.3895995, -1.900768, 1, 1, 1, 1, 1,
-1.220661, -1.463385, -2.717658, 1, 1, 1, 1, 1,
-1.220111, -0.1961641, -0.994868, 1, 1, 1, 1, 1,
-1.215017, -1.151083, -0.8916354, 1, 1, 1, 1, 1,
-1.206324, 0.3051584, -0.3001802, 1, 1, 1, 1, 1,
-1.201287, -1.339403, -2.166237, 1, 1, 1, 1, 1,
-1.19855, -1.160776, -3.176067, 1, 1, 1, 1, 1,
-1.194175, 0.6330019, -1.472028, 1, 1, 1, 1, 1,
-1.18971, 0.5942515, -1.679274, 1, 1, 1, 1, 1,
-1.176415, -0.875662, -2.731457, 0, 0, 1, 1, 1,
-1.174497, 1.523894, -1.164422, 1, 0, 0, 1, 1,
-1.173739, 0.1841497, -2.596549, 1, 0, 0, 1, 1,
-1.173136, -0.1999078, -0.7570498, 1, 0, 0, 1, 1,
-1.172109, 0.6087747, -1.508588, 1, 0, 0, 1, 1,
-1.170976, 1.139842, -1.904698, 1, 0, 0, 1, 1,
-1.156114, 1.27089, -0.4404364, 0, 0, 0, 1, 1,
-1.153717, 1.673148, -0.4088758, 0, 0, 0, 1, 1,
-1.153153, 1.158552, -0.339536, 0, 0, 0, 1, 1,
-1.148257, -0.7745902, 0.4165826, 0, 0, 0, 1, 1,
-1.144509, 0.7110772, -2.68416, 0, 0, 0, 1, 1,
-1.141411, 1.230761, -0.8726047, 0, 0, 0, 1, 1,
-1.127466, -1.298167, -1.230242, 0, 0, 0, 1, 1,
-1.126916, 0.9061223, -0.6845806, 1, 1, 1, 1, 1,
-1.125098, -0.4123941, -2.406099, 1, 1, 1, 1, 1,
-1.125026, 0.5819747, -1.544424, 1, 1, 1, 1, 1,
-1.123491, -2.835253, -0.9436833, 1, 1, 1, 1, 1,
-1.118728, 1.249889, -0.6262829, 1, 1, 1, 1, 1,
-1.11488, -0.2053067, -2.010614, 1, 1, 1, 1, 1,
-1.114017, -1.698305, -1.34801, 1, 1, 1, 1, 1,
-1.110267, 0.1332062, -3.414016, 1, 1, 1, 1, 1,
-1.109942, 0.1448563, -2.200526, 1, 1, 1, 1, 1,
-1.103001, -0.1686902, -0.4968885, 1, 1, 1, 1, 1,
-1.102322, -1.450463, -2.235347, 1, 1, 1, 1, 1,
-1.071386, -1.616179, -2.501889, 1, 1, 1, 1, 1,
-1.069935, -0.1768181, -2.885874, 1, 1, 1, 1, 1,
-1.062117, -0.8683062, -2.944977, 1, 1, 1, 1, 1,
-1.058461, 2.343957, -0.03198012, 1, 1, 1, 1, 1,
-1.049372, 0.3145234, -0.6325473, 0, 0, 1, 1, 1,
-1.046916, 2.643694, 0.4604819, 1, 0, 0, 1, 1,
-1.038758, 0.1457825, -2.330932, 1, 0, 0, 1, 1,
-1.038222, -0.1616589, -0.589038, 1, 0, 0, 1, 1,
-1.036685, -0.3711672, -0.4460777, 1, 0, 0, 1, 1,
-1.017791, 0.3161745, -1.448725, 1, 0, 0, 1, 1,
-1.013813, -0.7691535, -1.694428, 0, 0, 0, 1, 1,
-1.013629, 0.5150912, -1.147706, 0, 0, 0, 1, 1,
-1.009892, -0.1657058, -3.004226, 0, 0, 0, 1, 1,
-1.008141, 0.07006011, -3.093602, 0, 0, 0, 1, 1,
-1.006091, 0.3833777, -1.886954, 0, 0, 0, 1, 1,
-1.002002, 1.097044, -1.247726, 0, 0, 0, 1, 1,
-0.9988153, -0.9003196, -3.016578, 0, 0, 0, 1, 1,
-0.9949442, -1.114822, -3.468907, 1, 1, 1, 1, 1,
-0.9920598, -1.904205, -4.57289, 1, 1, 1, 1, 1,
-0.9847153, 0.222163, -2.495801, 1, 1, 1, 1, 1,
-0.9822598, 0.3118789, -1.619648, 1, 1, 1, 1, 1,
-0.9796888, 1.655713, -1.120968, 1, 1, 1, 1, 1,
-0.9774914, -0.5424813, -1.811433, 1, 1, 1, 1, 1,
-0.9727787, 0.6491919, -1.227379, 1, 1, 1, 1, 1,
-0.9624959, 0.4850947, -1.046604, 1, 1, 1, 1, 1,
-0.9558128, -1.339131, -1.339669, 1, 1, 1, 1, 1,
-0.9543297, 0.5008709, 0.274224, 1, 1, 1, 1, 1,
-0.9506811, -2.082771, -1.416614, 1, 1, 1, 1, 1,
-0.94014, -1.139841, -3.325474, 1, 1, 1, 1, 1,
-0.9369003, -0.2716885, -2.263631, 1, 1, 1, 1, 1,
-0.9236122, -0.2402933, -3.457202, 1, 1, 1, 1, 1,
-0.9182491, -1.164755, -1.905699, 1, 1, 1, 1, 1,
-0.9175746, -0.9903812, -2.533023, 0, 0, 1, 1, 1,
-0.907347, -0.510555, -3.962283, 1, 0, 0, 1, 1,
-0.9068224, -0.2897544, -3.611771, 1, 0, 0, 1, 1,
-0.9065053, -1.633627, -4.130614, 1, 0, 0, 1, 1,
-0.905206, -2.072989, -3.511545, 1, 0, 0, 1, 1,
-0.904799, 0.04377297, -1.462269, 1, 0, 0, 1, 1,
-0.9020583, 0.6394769, -1.355516, 0, 0, 0, 1, 1,
-0.8959525, 1.731804, -0.3495756, 0, 0, 0, 1, 1,
-0.891777, -1.924973, -3.462319, 0, 0, 0, 1, 1,
-0.8914044, -0.8513892, -0.9026041, 0, 0, 0, 1, 1,
-0.8898147, -1.093338, -3.298784, 0, 0, 0, 1, 1,
-0.8896036, -0.4537667, -2.286954, 0, 0, 0, 1, 1,
-0.8872097, -0.4022534, -2.727696, 0, 0, 0, 1, 1,
-0.8820557, -1.31762, -1.944127, 1, 1, 1, 1, 1,
-0.8817318, 1.684906, -0.9196693, 1, 1, 1, 1, 1,
-0.8797633, -1.3935, -1.418676, 1, 1, 1, 1, 1,
-0.8776081, -1.360839, -3.587734, 1, 1, 1, 1, 1,
-0.8760673, 0.5531367, -0.5435848, 1, 1, 1, 1, 1,
-0.8740998, 1.608024, 0.5005485, 1, 1, 1, 1, 1,
-0.869761, -0.3352664, -3.007716, 1, 1, 1, 1, 1,
-0.8681105, 0.2254645, 0.7906711, 1, 1, 1, 1, 1,
-0.8666445, -0.3003451, -0.7604107, 1, 1, 1, 1, 1,
-0.8587651, 0.973986, -0.6202936, 1, 1, 1, 1, 1,
-0.8542976, 0.7303922, 0.4185287, 1, 1, 1, 1, 1,
-0.848727, -0.6760796, 0.05325559, 1, 1, 1, 1, 1,
-0.8425124, 2.33339, 0.2137302, 1, 1, 1, 1, 1,
-0.831723, 0.523427, -0.7457956, 1, 1, 1, 1, 1,
-0.8290345, -0.3531746, -1.555856, 1, 1, 1, 1, 1,
-0.8285214, -0.09599945, -3.055216, 0, 0, 1, 1, 1,
-0.8274057, 0.5756183, -0.1072595, 1, 0, 0, 1, 1,
-0.8269808, 0.5820633, 0.638624, 1, 0, 0, 1, 1,
-0.8267456, -0.7486835, -3.421012, 1, 0, 0, 1, 1,
-0.826575, 1.390991, 1.342359, 1, 0, 0, 1, 1,
-0.8217589, 2.065547, -1.380428, 1, 0, 0, 1, 1,
-0.8198793, 0.4906531, -2.884111, 0, 0, 0, 1, 1,
-0.8145584, -0.1075324, -2.64743, 0, 0, 0, 1, 1,
-0.8085438, -0.2012791, -0.02989275, 0, 0, 0, 1, 1,
-0.8058232, 0.307991, 1.096504, 0, 0, 0, 1, 1,
-0.7938809, -0.2606893, 0.0168872, 0, 0, 0, 1, 1,
-0.7872796, -0.9541967, -3.224899, 0, 0, 0, 1, 1,
-0.7864919, -0.2009453, -2.191752, 0, 0, 0, 1, 1,
-0.7806444, 1.33155, 0.1007285, 1, 1, 1, 1, 1,
-0.7804046, 2.18171, -2.662203, 1, 1, 1, 1, 1,
-0.774536, -0.847602, -4.189399, 1, 1, 1, 1, 1,
-0.7734437, 0.3485898, -0.5824063, 1, 1, 1, 1, 1,
-0.7731503, 0.02468101, -2.10444, 1, 1, 1, 1, 1,
-0.7726098, -0.335861, -4.029899, 1, 1, 1, 1, 1,
-0.7705949, -1.38357, -1.333101, 1, 1, 1, 1, 1,
-0.7649605, -0.1789444, -0.6899129, 1, 1, 1, 1, 1,
-0.7609798, -0.2176983, -2.018589, 1, 1, 1, 1, 1,
-0.7556916, -1.050737, -2.218927, 1, 1, 1, 1, 1,
-0.7535294, 1.031605, 1.170982, 1, 1, 1, 1, 1,
-0.752522, -0.1747403, -1.125111, 1, 1, 1, 1, 1,
-0.7446695, 0.7738167, -1.536879, 1, 1, 1, 1, 1,
-0.7346924, -1.77651, -4.263944, 1, 1, 1, 1, 1,
-0.7323372, -0.693609, -1.696076, 1, 1, 1, 1, 1,
-0.725435, 2.240882, -1.127548, 0, 0, 1, 1, 1,
-0.7158547, 0.8282056, -2.006458, 1, 0, 0, 1, 1,
-0.7152625, 2.378064, 0.5320101, 1, 0, 0, 1, 1,
-0.715247, -0.5370911, -0.9102071, 1, 0, 0, 1, 1,
-0.7127447, 0.09708643, -1.981126, 1, 0, 0, 1, 1,
-0.7077635, 0.4391417, -0.09224695, 1, 0, 0, 1, 1,
-0.6994653, 1.237344, -1.483479, 0, 0, 0, 1, 1,
-0.6957448, 1.140885, 0.5115002, 0, 0, 0, 1, 1,
-0.6953399, -1.836471, -1.908462, 0, 0, 0, 1, 1,
-0.6881471, -0.6374151, -3.85015, 0, 0, 0, 1, 1,
-0.6873867, 2.254905, 0.2267202, 0, 0, 0, 1, 1,
-0.6865404, 0.7875449, -2.965415, 0, 0, 0, 1, 1,
-0.6836322, -0.1153868, -2.298005, 0, 0, 0, 1, 1,
-0.6834902, -1.661142, -3.957037, 1, 1, 1, 1, 1,
-0.6821909, -0.3634946, -1.47256, 1, 1, 1, 1, 1,
-0.6820918, 0.6541057, 0.5716847, 1, 1, 1, 1, 1,
-0.6743539, -0.6439258, -1.835908, 1, 1, 1, 1, 1,
-0.6677138, 0.03123896, -1.147907, 1, 1, 1, 1, 1,
-0.6626707, 2.284219, -0.3670562, 1, 1, 1, 1, 1,
-0.6605109, -0.6367313, -1.405101, 1, 1, 1, 1, 1,
-0.6532387, -0.2468413, -2.793373, 1, 1, 1, 1, 1,
-0.6531512, -2.157782, -4.600562, 1, 1, 1, 1, 1,
-0.6499724, -0.8194531, -2.057756, 1, 1, 1, 1, 1,
-0.6460934, 0.3695116, -1.751926, 1, 1, 1, 1, 1,
-0.6421688, -1.475778, -3.022203, 1, 1, 1, 1, 1,
-0.6417271, 0.3698381, -1.493259, 1, 1, 1, 1, 1,
-0.6411499, -0.01036722, -1.046435, 1, 1, 1, 1, 1,
-0.6405382, -0.3785399, -0.7406985, 1, 1, 1, 1, 1,
-0.6382758, 1.941762, -2.498544, 0, 0, 1, 1, 1,
-0.6287271, -0.2316617, -1.516499, 1, 0, 0, 1, 1,
-0.6253485, 0.4776896, -0.6589698, 1, 0, 0, 1, 1,
-0.6226081, 2.57638, 0.4757325, 1, 0, 0, 1, 1,
-0.6199602, -0.4878113, -2.529295, 1, 0, 0, 1, 1,
-0.6193609, 0.6506569, -0.03188005, 1, 0, 0, 1, 1,
-0.616828, 1.205523, -0.7362505, 0, 0, 0, 1, 1,
-0.6148281, -0.6361296, -3.149877, 0, 0, 0, 1, 1,
-0.6144518, 0.2214535, 0.515396, 0, 0, 0, 1, 1,
-0.6121128, -0.8339598, -3.207396, 0, 0, 0, 1, 1,
-0.6079922, -0.8780856, -1.296663, 0, 0, 0, 1, 1,
-0.6063519, -0.4774199, -2.078269, 0, 0, 0, 1, 1,
-0.606277, 1.372216, 0.7171034, 0, 0, 0, 1, 1,
-0.600502, -1.384511, -2.180486, 1, 1, 1, 1, 1,
-0.5868766, -0.06961425, -2.091619, 1, 1, 1, 1, 1,
-0.5842779, 1.464015, 0.04141872, 1, 1, 1, 1, 1,
-0.5836653, -0.491816, -3.651142, 1, 1, 1, 1, 1,
-0.5834087, 0.7392388, -0.9076241, 1, 1, 1, 1, 1,
-0.5799391, -0.2166, -1.431901, 1, 1, 1, 1, 1,
-0.5750498, 0.02556284, -0.8786137, 1, 1, 1, 1, 1,
-0.571156, -0.07088451, -1.456318, 1, 1, 1, 1, 1,
-0.5656518, 0.5082644, -0.7150769, 1, 1, 1, 1, 1,
-0.5639002, 0.7501447, -0.1104254, 1, 1, 1, 1, 1,
-0.5613272, -0.6234267, -4.188958, 1, 1, 1, 1, 1,
-0.5575624, 1.683453, 0.872013, 1, 1, 1, 1, 1,
-0.5560803, 0.738304, -0.6453049, 1, 1, 1, 1, 1,
-0.5557104, -0.1745426, -3.119359, 1, 1, 1, 1, 1,
-0.5553842, 0.09493425, -3.3033, 1, 1, 1, 1, 1,
-0.553614, -0.6870769, -1.814742, 0, 0, 1, 1, 1,
-0.5493745, 0.01033458, -1.294734, 1, 0, 0, 1, 1,
-0.5431995, -0.7084587, -2.223486, 1, 0, 0, 1, 1,
-0.5377867, 0.7976636, 0.0004901236, 1, 0, 0, 1, 1,
-0.5369641, 0.478191, -1.338841, 1, 0, 0, 1, 1,
-0.5340511, -0.8667541, -2.546795, 1, 0, 0, 1, 1,
-0.5339295, -1.352526, -4.460507, 0, 0, 0, 1, 1,
-0.5313776, -1.004646, -3.42673, 0, 0, 0, 1, 1,
-0.5275566, 0.3120626, -2.702185, 0, 0, 0, 1, 1,
-0.5228306, 0.5666417, -0.3233931, 0, 0, 0, 1, 1,
-0.5187442, 1.167297, 1.102759, 0, 0, 0, 1, 1,
-0.5181852, -0.1684635, -1.74988, 0, 0, 0, 1, 1,
-0.5167223, 0.03690402, -1.592668, 0, 0, 0, 1, 1,
-0.516088, -0.02102281, -2.133746, 1, 1, 1, 1, 1,
-0.5137404, 0.4673966, -3.645705, 1, 1, 1, 1, 1,
-0.5113482, 0.3942007, -0.213402, 1, 1, 1, 1, 1,
-0.5075886, -0.4150254, -2.669168, 1, 1, 1, 1, 1,
-0.5048591, 1.857755, -0.4067485, 1, 1, 1, 1, 1,
-0.5015474, -0.9261297, -3.243723, 1, 1, 1, 1, 1,
-0.5014521, -1.348365, -2.282076, 1, 1, 1, 1, 1,
-0.5010974, -1.026572, -2.253973, 1, 1, 1, 1, 1,
-0.4936076, -0.4854325, -2.13595, 1, 1, 1, 1, 1,
-0.4849691, -1.572175, -3.135147, 1, 1, 1, 1, 1,
-0.484691, -0.2546688, -2.075331, 1, 1, 1, 1, 1,
-0.4846241, -1.190682, -3.134313, 1, 1, 1, 1, 1,
-0.4819231, -0.01158016, -0.6445323, 1, 1, 1, 1, 1,
-0.4811219, -1.267684, -1.783114, 1, 1, 1, 1, 1,
-0.479648, 2.066655, -0.3603377, 1, 1, 1, 1, 1,
-0.4788859, -1.380816, -2.611021, 0, 0, 1, 1, 1,
-0.4779565, 0.7063509, 0.6920769, 1, 0, 0, 1, 1,
-0.4748232, 0.2233664, -0.2496053, 1, 0, 0, 1, 1,
-0.4745801, 0.7956062, -0.8466036, 1, 0, 0, 1, 1,
-0.467978, 0.871961, -2.459875, 1, 0, 0, 1, 1,
-0.4575962, -0.9965661, -4.954042, 1, 0, 0, 1, 1,
-0.4549269, -0.9903686, -1.756481, 0, 0, 0, 1, 1,
-0.453923, -1.073508, -2.915912, 0, 0, 0, 1, 1,
-0.4526275, 0.8171712, -1.18522, 0, 0, 0, 1, 1,
-0.4504978, 0.02181827, -1.538475, 0, 0, 0, 1, 1,
-0.4428278, 0.7173318, -0.7302434, 0, 0, 0, 1, 1,
-0.4407344, 0.247793, -2.222127, 0, 0, 0, 1, 1,
-0.4401435, -0.5534145, -2.153469, 0, 0, 0, 1, 1,
-0.4401298, -0.7028726, -1.808681, 1, 1, 1, 1, 1,
-0.4380397, -0.5046832, -3.845867, 1, 1, 1, 1, 1,
-0.4379643, -2.033034, -2.444455, 1, 1, 1, 1, 1,
-0.4304987, -1.170946, -1.047023, 1, 1, 1, 1, 1,
-0.4273824, -0.1121272, -2.157434, 1, 1, 1, 1, 1,
-0.4273697, 0.046392, -0.1467346, 1, 1, 1, 1, 1,
-0.4233437, -0.2153444, -4.04735, 1, 1, 1, 1, 1,
-0.4179371, 0.7915198, -1.390565, 1, 1, 1, 1, 1,
-0.4173553, 0.2602654, 0.9144623, 1, 1, 1, 1, 1,
-0.4166971, 0.03011954, -1.619048, 1, 1, 1, 1, 1,
-0.4160141, -1.20699, -3.451937, 1, 1, 1, 1, 1,
-0.4138348, -1.764332, -1.952901, 1, 1, 1, 1, 1,
-0.4101606, 1.280988, -1.047749, 1, 1, 1, 1, 1,
-0.4096939, -0.7569474, -2.77392, 1, 1, 1, 1, 1,
-0.4088043, -1.739357, -1.474174, 1, 1, 1, 1, 1,
-0.4083019, -0.04944258, -0.9895003, 0, 0, 1, 1, 1,
-0.407695, -0.6700851, -2.809227, 1, 0, 0, 1, 1,
-0.3924164, 0.8566926, 0.5968334, 1, 0, 0, 1, 1,
-0.3897082, 0.3051288, -2.026261, 1, 0, 0, 1, 1,
-0.3879555, 0.2794839, 0.3902586, 1, 0, 0, 1, 1,
-0.3845626, -0.1487699, -1.264644, 1, 0, 0, 1, 1,
-0.3843046, 1.227301, -0.04452844, 0, 0, 0, 1, 1,
-0.3802758, -0.6843512, -3.297836, 0, 0, 0, 1, 1,
-0.3715928, 0.2427643, -0.497331, 0, 0, 0, 1, 1,
-0.368686, 0.2337049, 1.270142, 0, 0, 0, 1, 1,
-0.3660545, 0.03622062, -1.581074, 0, 0, 0, 1, 1,
-0.3634765, 0.6674614, -0.6401649, 0, 0, 0, 1, 1,
-0.3563206, -0.2764071, -1.726486, 0, 0, 0, 1, 1,
-0.3498952, -0.44225, -1.831094, 1, 1, 1, 1, 1,
-0.3411868, -0.1312198, -1.480288, 1, 1, 1, 1, 1,
-0.3382409, -0.08426222, -2.439168, 1, 1, 1, 1, 1,
-0.3381986, -0.889643, -3.118371, 1, 1, 1, 1, 1,
-0.3366674, 0.02634812, 1.696969, 1, 1, 1, 1, 1,
-0.3350132, -0.6945758, -2.110277, 1, 1, 1, 1, 1,
-0.3333184, 0.5686851, -0.5973991, 1, 1, 1, 1, 1,
-0.3306749, -0.5811368, -2.975964, 1, 1, 1, 1, 1,
-0.328185, 1.971156, 0.549243, 1, 1, 1, 1, 1,
-0.326506, -0.5315937, -3.501914, 1, 1, 1, 1, 1,
-0.324086, -1.775118, -2.03359, 1, 1, 1, 1, 1,
-0.3209273, -1.137933, -1.493324, 1, 1, 1, 1, 1,
-0.3208551, -0.6828275, -2.713725, 1, 1, 1, 1, 1,
-0.317845, 0.4698201, -0.9371282, 1, 1, 1, 1, 1,
-0.3124875, 1.12112, -1.495105, 1, 1, 1, 1, 1,
-0.3123034, 0.2060318, -0.9062182, 0, 0, 1, 1, 1,
-0.3115436, -0.8785589, -2.035002, 1, 0, 0, 1, 1,
-0.3110486, 0.8510273, -0.3807274, 1, 0, 0, 1, 1,
-0.3078702, 0.1936182, -2.18562, 1, 0, 0, 1, 1,
-0.3055864, 0.144178, -1.046452, 1, 0, 0, 1, 1,
-0.2987678, -0.9850031, -1.536888, 1, 0, 0, 1, 1,
-0.298353, -0.3196154, -3.199869, 0, 0, 0, 1, 1,
-0.2974442, 1.275023, 0.9601797, 0, 0, 0, 1, 1,
-0.2957093, -0.4835138, -2.628992, 0, 0, 0, 1, 1,
-0.2938375, 0.5303807, -0.2263137, 0, 0, 0, 1, 1,
-0.2929819, -0.4819793, -2.687236, 0, 0, 0, 1, 1,
-0.2925493, -0.2515621, -1.929095, 0, 0, 0, 1, 1,
-0.2917554, 0.97278, 0.8922506, 0, 0, 0, 1, 1,
-0.2898955, -0.3232636, -2.006264, 1, 1, 1, 1, 1,
-0.2878313, 0.8293714, -0.2577574, 1, 1, 1, 1, 1,
-0.2848564, -1.484968, -1.976865, 1, 1, 1, 1, 1,
-0.281613, 0.8533225, -2.112122, 1, 1, 1, 1, 1,
-0.2787537, 0.8750938, 0.1612045, 1, 1, 1, 1, 1,
-0.278438, -0.3850733, -1.258948, 1, 1, 1, 1, 1,
-0.2716278, -2.055871, -3.016463, 1, 1, 1, 1, 1,
-0.2706583, 1.809792, -1.852571, 1, 1, 1, 1, 1,
-0.2653728, -0.3893655, -3.311872, 1, 1, 1, 1, 1,
-0.2581635, 2.702559, -0.2944572, 1, 1, 1, 1, 1,
-0.2569868, 1.325887, 1.814534, 1, 1, 1, 1, 1,
-0.2524316, -0.6389272, -0.01885457, 1, 1, 1, 1, 1,
-0.24899, 0.01066569, -2.077883, 1, 1, 1, 1, 1,
-0.2441627, -0.3254038, -2.734232, 1, 1, 1, 1, 1,
-0.2428558, -1.136111, -2.863109, 1, 1, 1, 1, 1,
-0.2428447, 0.0916032, -0.2259484, 0, 0, 1, 1, 1,
-0.2417546, 0.2648251, -0.3975313, 1, 0, 0, 1, 1,
-0.2335329, 0.4402625, -0.2360044, 1, 0, 0, 1, 1,
-0.2323437, 0.05052507, -1.170726, 1, 0, 0, 1, 1,
-0.2275354, 0.5493461, 0.2536643, 1, 0, 0, 1, 1,
-0.2236018, 1.174576, -0.8273544, 1, 0, 0, 1, 1,
-0.2220618, -0.2059633, -1.205994, 0, 0, 0, 1, 1,
-0.2196795, -2.671194, -1.64289, 0, 0, 0, 1, 1,
-0.2128749, -0.3383077, -3.510738, 0, 0, 0, 1, 1,
-0.2127125, -0.01870044, -0.9059009, 0, 0, 0, 1, 1,
-0.212003, -1.14458, -3.399721, 0, 0, 0, 1, 1,
-0.2096917, -0.3164222, -1.084213, 0, 0, 0, 1, 1,
-0.2094515, 0.4305613, 0.08425668, 0, 0, 0, 1, 1,
-0.2087223, 0.9315376, 0.413421, 1, 1, 1, 1, 1,
-0.2077883, 0.2734624, 0.8561648, 1, 1, 1, 1, 1,
-0.2076419, -0.3116361, -2.836162, 1, 1, 1, 1, 1,
-0.2031609, -0.05546969, -0.0613621, 1, 1, 1, 1, 1,
-0.2028432, 1.499424, 1.614436, 1, 1, 1, 1, 1,
-0.2005953, -1.251165, -2.96537, 1, 1, 1, 1, 1,
-0.2003777, -0.1108615, -2.048659, 1, 1, 1, 1, 1,
-0.1941797, -1.283053, -3.638067, 1, 1, 1, 1, 1,
-0.1909886, 0.4876558, 1.233874, 1, 1, 1, 1, 1,
-0.1887367, 0.06210463, -0.5039999, 1, 1, 1, 1, 1,
-0.187739, 0.1272818, -0.7270489, 1, 1, 1, 1, 1,
-0.1867698, -0.8027925, -2.067691, 1, 1, 1, 1, 1,
-0.1854199, 1.812199, -0.188302, 1, 1, 1, 1, 1,
-0.1792413, -0.4479853, -3.729345, 1, 1, 1, 1, 1,
-0.1786041, -0.6481118, -3.748384, 1, 1, 1, 1, 1,
-0.1774122, -0.3414221, -3.20865, 0, 0, 1, 1, 1,
-0.1770611, 1.310121, -0.4534043, 1, 0, 0, 1, 1,
-0.1713176, 0.2262137, -1.920057, 1, 0, 0, 1, 1,
-0.171257, -2.09918, -3.149241, 1, 0, 0, 1, 1,
-0.1607721, 0.6720628, -1.267084, 1, 0, 0, 1, 1,
-0.1530689, 0.2067977, -1.404849, 1, 0, 0, 1, 1,
-0.1510236, 0.7008007, -1.101697, 0, 0, 0, 1, 1,
-0.1461278, -0.9196898, -4.767707, 0, 0, 0, 1, 1,
-0.142321, 2.203469, -1.823055, 0, 0, 0, 1, 1,
-0.1377282, 0.8126136, 0.08208707, 0, 0, 0, 1, 1,
-0.1359143, 2.662942, 0.5281392, 0, 0, 0, 1, 1,
-0.1332988, -2.333256, -3.187798, 0, 0, 0, 1, 1,
-0.1331989, -2.056359, -2.859774, 0, 0, 0, 1, 1,
-0.1327207, 0.4590128, -0.9420117, 1, 1, 1, 1, 1,
-0.1314281, 0.4524533, 0.09851108, 1, 1, 1, 1, 1,
-0.1293306, -0.2305114, -2.358663, 1, 1, 1, 1, 1,
-0.1288697, -0.4679072, -3.580401, 1, 1, 1, 1, 1,
-0.1285349, -0.7992513, -3.246667, 1, 1, 1, 1, 1,
-0.1249671, 0.9416268, -1.86564, 1, 1, 1, 1, 1,
-0.1249623, -0.6561936, -2.904697, 1, 1, 1, 1, 1,
-0.1202315, -0.06795442, -1.496376, 1, 1, 1, 1, 1,
-0.1195313, 0.411925, 0.008284431, 1, 1, 1, 1, 1,
-0.1194245, 0.4756909, -2.075558, 1, 1, 1, 1, 1,
-0.1176641, -1.057662, -4.361506, 1, 1, 1, 1, 1,
-0.1110064, -0.8110398, -2.813089, 1, 1, 1, 1, 1,
-0.1081578, -0.8681139, -3.356835, 1, 1, 1, 1, 1,
-0.1070622, 0.08839778, -2.192429, 1, 1, 1, 1, 1,
-0.1061104, -0.7434137, -3.430933, 1, 1, 1, 1, 1,
-0.1046828, -1.222957, -2.639144, 0, 0, 1, 1, 1,
-0.1022053, 1.126149, -1.012847, 1, 0, 0, 1, 1,
-0.1018679, 0.9782535, -0.5615202, 1, 0, 0, 1, 1,
-0.09871192, -0.1592862, -1.069044, 1, 0, 0, 1, 1,
-0.09766117, -1.083207, -1.355094, 1, 0, 0, 1, 1,
-0.09151454, -0.7850876, -4.346539, 1, 0, 0, 1, 1,
-0.09010792, 0.9284822, -0.3573977, 0, 0, 0, 1, 1,
-0.08850684, 0.8693104, -0.312708, 0, 0, 0, 1, 1,
-0.08515493, 0.5513957, 0.2128765, 0, 0, 0, 1, 1,
-0.08498278, -0.8870478, -3.90851, 0, 0, 0, 1, 1,
-0.08413967, -1.699485, -1.551535, 0, 0, 0, 1, 1,
-0.08260978, 0.2495901, -0.677, 0, 0, 0, 1, 1,
-0.08141102, -2.070217, -1.730886, 0, 0, 0, 1, 1,
-0.08076951, -0.3750477, -3.784081, 1, 1, 1, 1, 1,
-0.07908168, -0.8083027, -1.599542, 1, 1, 1, 1, 1,
-0.07308944, 0.7758192, -0.2420218, 1, 1, 1, 1, 1,
-0.06706797, -0.3939901, -1.796624, 1, 1, 1, 1, 1,
-0.06282197, 1.970666, -0.1243518, 1, 1, 1, 1, 1,
-0.05862455, -1.302431, -3.306411, 1, 1, 1, 1, 1,
-0.05850703, -2.214654, -2.510335, 1, 1, 1, 1, 1,
-0.05833198, 0.4874841, 0.3864487, 1, 1, 1, 1, 1,
-0.05817251, 0.1420849, 0.2303021, 1, 1, 1, 1, 1,
-0.0568504, 0.2406613, -1.56852, 1, 1, 1, 1, 1,
-0.05471058, -0.05228421, -0.5219672, 1, 1, 1, 1, 1,
-0.0545456, 2.205566, -0.8910961, 1, 1, 1, 1, 1,
-0.05295018, -1.195582, -2.800144, 1, 1, 1, 1, 1,
-0.05288589, -0.5687017, -4.612338, 1, 1, 1, 1, 1,
-0.05230673, 0.03824871, -1.294142, 1, 1, 1, 1, 1,
-0.0493524, -0.8772469, -5.150885, 0, 0, 1, 1, 1,
-0.04934372, -0.1047886, -2.306016, 1, 0, 0, 1, 1,
-0.04352039, -0.7033603, -3.635881, 1, 0, 0, 1, 1,
-0.04274964, 0.1002836, -1.239677, 1, 0, 0, 1, 1,
-0.04201683, -1.010778, -1.740562, 1, 0, 0, 1, 1,
-0.04149973, -1.107456, -2.519207, 1, 0, 0, 1, 1,
-0.03949398, 2.030738, 1.095342, 0, 0, 0, 1, 1,
-0.03941944, 0.8687593, 0.0009698837, 0, 0, 0, 1, 1,
-0.0362961, -0.3729376, -2.134349, 0, 0, 0, 1, 1,
-0.03319075, -0.02476309, -3.489354, 0, 0, 0, 1, 1,
-0.029917, 2.088616, -0.4280473, 0, 0, 0, 1, 1,
-0.02690622, 1.094972, -0.07091843, 0, 0, 0, 1, 1,
-0.02657565, -1.052132, -3.771985, 0, 0, 0, 1, 1,
-0.02343411, 1.01115, 0.3067608, 1, 1, 1, 1, 1,
-0.02078773, -0.3564087, -5.079529, 1, 1, 1, 1, 1,
-0.01934906, 0.9671555, 0.1571546, 1, 1, 1, 1, 1,
-0.01716404, -0.04091608, -2.978152, 1, 1, 1, 1, 1,
-0.01489478, -0.0842066, -3.68905, 1, 1, 1, 1, 1,
-0.01315123, -0.06193798, -2.68534, 1, 1, 1, 1, 1,
-0.01065395, -0.2601046, -3.743093, 1, 1, 1, 1, 1,
-0.01025048, -1.137619, -3.821777, 1, 1, 1, 1, 1,
-0.008860569, 0.7529871, -0.2434613, 1, 1, 1, 1, 1,
-0.004046529, -0.4753065, -4.536126, 1, 1, 1, 1, 1,
0.0005661547, 1.302271, 0.1121251, 1, 1, 1, 1, 1,
0.002968496, 1.591729, 0.8168922, 1, 1, 1, 1, 1,
0.003960106, 0.1984355, -1.249559, 1, 1, 1, 1, 1,
0.005135785, -0.1897687, 3.746511, 1, 1, 1, 1, 1,
0.006631874, 1.110869, -0.3574916, 1, 1, 1, 1, 1,
0.008106964, 0.3782099, -1.794725, 0, 0, 1, 1, 1,
0.008993365, 1.135248, 1.221947, 1, 0, 0, 1, 1,
0.01198038, 0.8969616, -1.567566, 1, 0, 0, 1, 1,
0.01829283, -0.03781581, 3.110823, 1, 0, 0, 1, 1,
0.02133932, 0.8419037, -0.8481323, 1, 0, 0, 1, 1,
0.02318484, -0.4715605, 3.898618, 1, 0, 0, 1, 1,
0.02322064, 0.9760942, 0.4919359, 0, 0, 0, 1, 1,
0.02652041, -0.9091442, 2.854647, 0, 0, 0, 1, 1,
0.03064469, -0.526284, 1.308777, 0, 0, 0, 1, 1,
0.03091486, 0.1970536, -1.590862, 0, 0, 0, 1, 1,
0.0324936, -1.133268, 4.174888, 0, 0, 0, 1, 1,
0.0326186, 0.2093563, 0.8770784, 0, 0, 0, 1, 1,
0.03677932, 0.8457031, -0.247822, 0, 0, 0, 1, 1,
0.04471492, 0.1401718, -1.176686, 1, 1, 1, 1, 1,
0.04566431, -0.1328183, 2.352379, 1, 1, 1, 1, 1,
0.0507979, 0.475346, -0.7203699, 1, 1, 1, 1, 1,
0.0521424, -1.52813, 2.239309, 1, 1, 1, 1, 1,
0.05260986, 2.154973, -1.058853, 1, 1, 1, 1, 1,
0.05799643, -1.215739, 3.866705, 1, 1, 1, 1, 1,
0.06091865, 0.5058089, 0.09859461, 1, 1, 1, 1, 1,
0.06190816, 0.3749327, 0.8611127, 1, 1, 1, 1, 1,
0.06855717, 0.1222007, -0.1495865, 1, 1, 1, 1, 1,
0.06971706, 0.296382, 0.3610236, 1, 1, 1, 1, 1,
0.07117129, 0.9510579, 0.7337444, 1, 1, 1, 1, 1,
0.0712617, 0.3581743, -0.9024835, 1, 1, 1, 1, 1,
0.07179136, 0.4315434, -0.7391551, 1, 1, 1, 1, 1,
0.07528674, -0.1487375, 2.472207, 1, 1, 1, 1, 1,
0.07596413, 1.170211, 0.3632428, 1, 1, 1, 1, 1,
0.08002779, -0.538097, 1.257576, 0, 0, 1, 1, 1,
0.08152009, -1.293122, 2.547719, 1, 0, 0, 1, 1,
0.08170173, -0.5739377, 2.582173, 1, 0, 0, 1, 1,
0.08181115, 0.3310743, -0.8204572, 1, 0, 0, 1, 1,
0.08214527, -2.08981, 3.201724, 1, 0, 0, 1, 1,
0.08219267, 0.8248507, -0.5089386, 1, 0, 0, 1, 1,
0.08379345, 0.1206085, 1.354877, 0, 0, 0, 1, 1,
0.08584397, 0.4810488, -0.4534547, 0, 0, 0, 1, 1,
0.09219239, 0.6650417, 1.118819, 0, 0, 0, 1, 1,
0.09404679, 1.348549, 1.010136, 0, 0, 0, 1, 1,
0.09493222, -0.6440364, 2.111595, 0, 0, 0, 1, 1,
0.09555166, 0.521272, 1.594225, 0, 0, 0, 1, 1,
0.09834406, -0.2500449, 2.416735, 0, 0, 0, 1, 1,
0.09920462, 0.5750376, 0.2557144, 1, 1, 1, 1, 1,
0.1006765, 0.4360748, 1.736301, 1, 1, 1, 1, 1,
0.1056715, -0.04875926, 3.112218, 1, 1, 1, 1, 1,
0.1094342, 1.283557, -0.3544602, 1, 1, 1, 1, 1,
0.1110486, 1.157666, 2.372234, 1, 1, 1, 1, 1,
0.1115652, 0.6609879, 0.5329856, 1, 1, 1, 1, 1,
0.1132022, 0.3064193, 0.7340761, 1, 1, 1, 1, 1,
0.1169103, -2.061008, 3.187986, 1, 1, 1, 1, 1,
0.1190524, -0.646997, 2.568037, 1, 1, 1, 1, 1,
0.119484, 0.1673833, 0.4952083, 1, 1, 1, 1, 1,
0.1222826, 0.3280934, 1.433087, 1, 1, 1, 1, 1,
0.1233577, -0.704186, 3.413465, 1, 1, 1, 1, 1,
0.1245519, 0.6270799, 1.53221, 1, 1, 1, 1, 1,
0.1253548, 1.135034, -0.4590293, 1, 1, 1, 1, 1,
0.1275756, 0.06480943, -0.2659661, 1, 1, 1, 1, 1,
0.1277493, 0.7084939, -0.5072613, 0, 0, 1, 1, 1,
0.1287437, -0.6370022, 2.740029, 1, 0, 0, 1, 1,
0.1292619, 0.5453589, 0.3396649, 1, 0, 0, 1, 1,
0.1309622, 1.23225, -0.1369754, 1, 0, 0, 1, 1,
0.1315422, 0.2170822, 0.8042421, 1, 0, 0, 1, 1,
0.1325825, 0.5777282, 1.216282, 1, 0, 0, 1, 1,
0.134049, 1.114264, 0.4762705, 0, 0, 0, 1, 1,
0.1357163, 0.5708228, -0.3429711, 0, 0, 0, 1, 1,
0.1386876, -0.7912577, 2.444757, 0, 0, 0, 1, 1,
0.1410998, 1.127129, 0.4193016, 0, 0, 0, 1, 1,
0.1443378, -0.4505957, 2.329968, 0, 0, 0, 1, 1,
0.1461302, -0.7611065, 5.317779, 0, 0, 0, 1, 1,
0.1464187, -0.1450269, 1.733335, 0, 0, 0, 1, 1,
0.1524971, 0.0212076, 0.4156406, 1, 1, 1, 1, 1,
0.1568528, 0.3746079, 1.864102, 1, 1, 1, 1, 1,
0.1641013, -0.4708555, 3.305656, 1, 1, 1, 1, 1,
0.1694601, -1.402546, 1.172859, 1, 1, 1, 1, 1,
0.1717321, 0.07072292, 1.294395, 1, 1, 1, 1, 1,
0.1762099, 1.360412, 0.4456353, 1, 1, 1, 1, 1,
0.1855053, 0.3957323, 0.689613, 1, 1, 1, 1, 1,
0.1969964, -0.03738711, 2.786004, 1, 1, 1, 1, 1,
0.1970893, 0.4581214, -0.0122553, 1, 1, 1, 1, 1,
0.1972693, -0.5601633, 1.380944, 1, 1, 1, 1, 1,
0.2051883, -1.022723, 2.438563, 1, 1, 1, 1, 1,
0.2108284, -0.3431531, 1.161421, 1, 1, 1, 1, 1,
0.2112373, -0.6370946, 2.509608, 1, 1, 1, 1, 1,
0.2138309, 0.1119784, 0.395211, 1, 1, 1, 1, 1,
0.2170407, 0.1322654, 1.421011, 1, 1, 1, 1, 1,
0.2185401, -0.6868594, 2.452202, 0, 0, 1, 1, 1,
0.2213462, -0.7405998, 1.918515, 1, 0, 0, 1, 1,
0.2264338, -0.09398204, 2.661574, 1, 0, 0, 1, 1,
0.226601, -0.9736865, 2.887301, 1, 0, 0, 1, 1,
0.2278262, 1.863469, 0.206169, 1, 0, 0, 1, 1,
0.2320176, -0.598205, 4.688836, 1, 0, 0, 1, 1,
0.2327034, -1.256809, 1.395832, 0, 0, 0, 1, 1,
0.234374, -0.8689457, 2.95398, 0, 0, 0, 1, 1,
0.2370216, 0.4319583, 0.6386074, 0, 0, 0, 1, 1,
0.2384871, -1.419721, 3.465858, 0, 0, 0, 1, 1,
0.243652, -1.187348, 2.622716, 0, 0, 0, 1, 1,
0.2466236, 0.5400015, 0.04784467, 0, 0, 0, 1, 1,
0.2519858, -1.611072, 4.408032, 0, 0, 0, 1, 1,
0.2529867, -0.03546654, 2.239769, 1, 1, 1, 1, 1,
0.2535843, -1.899872, 3.254145, 1, 1, 1, 1, 1,
0.254086, 0.6474206, -0.4515744, 1, 1, 1, 1, 1,
0.2547715, 0.029129, -0.9075092, 1, 1, 1, 1, 1,
0.2614362, -0.6127799, 2.703511, 1, 1, 1, 1, 1,
0.264492, 0.3833795, 0.6394901, 1, 1, 1, 1, 1,
0.2649553, -0.2681397, 1.307529, 1, 1, 1, 1, 1,
0.2669487, 0.3391732, 0.81537, 1, 1, 1, 1, 1,
0.2763404, 0.0145219, 1.988576, 1, 1, 1, 1, 1,
0.2849555, 0.7844785, -0.6991578, 1, 1, 1, 1, 1,
0.2903628, 1.145607, 0.7407706, 1, 1, 1, 1, 1,
0.2911596, -0.6692959, 3.22044, 1, 1, 1, 1, 1,
0.2927266, 1.187668, -0.6123977, 1, 1, 1, 1, 1,
0.2946804, 2.042836, -0.1872874, 1, 1, 1, 1, 1,
0.3042619, 0.2907529, -0.3189759, 1, 1, 1, 1, 1,
0.3067362, 0.7546964, 0.1408962, 0, 0, 1, 1, 1,
0.3103379, 0.3302749, -0.6839323, 1, 0, 0, 1, 1,
0.310437, -1.118088, 2.515357, 1, 0, 0, 1, 1,
0.3111601, 1.4101, -0.3879511, 1, 0, 0, 1, 1,
0.3121176, -1.219444, 1.589773, 1, 0, 0, 1, 1,
0.3130447, 1.06024, 1.872026, 1, 0, 0, 1, 1,
0.3167857, 0.8178696, -0.07389452, 0, 0, 0, 1, 1,
0.3181334, 0.06331308, 2.211773, 0, 0, 0, 1, 1,
0.318785, -0.335622, 2.826444, 0, 0, 0, 1, 1,
0.3264977, 0.7203677, 1.200492, 0, 0, 0, 1, 1,
0.3317509, 0.5821611, 1.140822, 0, 0, 0, 1, 1,
0.3345726, -0.9256068, 3.308696, 0, 0, 0, 1, 1,
0.3371486, 1.050658, 0.1458707, 0, 0, 0, 1, 1,
0.3486102, 0.1468817, -0.8471779, 1, 1, 1, 1, 1,
0.3503904, 0.2756792, 0.05756857, 1, 1, 1, 1, 1,
0.3509316, -2.454015, 4.46397, 1, 1, 1, 1, 1,
0.3546723, 0.9225041, 0.5095274, 1, 1, 1, 1, 1,
0.3558184, 1.696405, -0.187872, 1, 1, 1, 1, 1,
0.3590822, 1.333382, -4.683805e-05, 1, 1, 1, 1, 1,
0.3595991, 0.7042912, -0.4506271, 1, 1, 1, 1, 1,
0.3641103, -1.575077, 4.062594, 1, 1, 1, 1, 1,
0.3693843, 0.303524, -0.6158841, 1, 1, 1, 1, 1,
0.3710113, 1.334755, -0.03204809, 1, 1, 1, 1, 1,
0.371635, -0.3371901, 2.115973, 1, 1, 1, 1, 1,
0.3730435, 0.7407063, 0.8353541, 1, 1, 1, 1, 1,
0.3735819, 1.378442, 0.4610985, 1, 1, 1, 1, 1,
0.3762498, 0.3850291, 1.916107, 1, 1, 1, 1, 1,
0.3764048, -1.617391, 4.440072, 1, 1, 1, 1, 1,
0.3776757, -0.05736806, 1.617619, 0, 0, 1, 1, 1,
0.3833049, 1.270974, 0.02307217, 1, 0, 0, 1, 1,
0.3914599, -0.2494847, 0.3340402, 1, 0, 0, 1, 1,
0.3961298, 1.414747, 0.1859966, 1, 0, 0, 1, 1,
0.3973488, -1.085038, 2.662566, 1, 0, 0, 1, 1,
0.4123198, -1.054922, 3.627769, 1, 0, 0, 1, 1,
0.4152642, -1.513377, 2.90431, 0, 0, 0, 1, 1,
0.4199305, 1.052018, -0.4352937, 0, 0, 0, 1, 1,
0.4234161, -0.2431077, 2.301321, 0, 0, 0, 1, 1,
0.4247081, -0.2924021, 2.321266, 0, 0, 0, 1, 1,
0.4251547, -1.121544, 1.562317, 0, 0, 0, 1, 1,
0.4253794, -0.5890201, 2.001128, 0, 0, 0, 1, 1,
0.4274173, -1.507981, 2.629325, 0, 0, 0, 1, 1,
0.4312642, 0.01567446, 2.493343, 1, 1, 1, 1, 1,
0.4341222, -0.1093426, 1.837523, 1, 1, 1, 1, 1,
0.4343466, 1.058042, 0.4411328, 1, 1, 1, 1, 1,
0.4350759, -0.4663503, 3.939421, 1, 1, 1, 1, 1,
0.4391668, 1.130186, -0.9129826, 1, 1, 1, 1, 1,
0.4405131, -0.4734552, 2.705444, 1, 1, 1, 1, 1,
0.4469134, -0.03577646, 1.939537, 1, 1, 1, 1, 1,
0.4515576, 0.4330564, 1.175825, 1, 1, 1, 1, 1,
0.4584348, 0.4169496, 0.5410095, 1, 1, 1, 1, 1,
0.4594511, 0.2367246, 1.404637, 1, 1, 1, 1, 1,
0.459706, 0.3142532, 1.011502, 1, 1, 1, 1, 1,
0.4603701, 0.1692254, 1.648334, 1, 1, 1, 1, 1,
0.4665441, -1.71323, 4.04371, 1, 1, 1, 1, 1,
0.475409, -0.4053253, 2.092963, 1, 1, 1, 1, 1,
0.4768872, -2.004851, 2.254753, 1, 1, 1, 1, 1,
0.4771655, -0.8591967, 4.792338, 0, 0, 1, 1, 1,
0.4772546, 0.2471, 1.524216, 1, 0, 0, 1, 1,
0.4810909, 0.7140346, 0.5557805, 1, 0, 0, 1, 1,
0.4822854, -1.076623, 2.555981, 1, 0, 0, 1, 1,
0.4835338, 0.01056211, 1.211012, 1, 0, 0, 1, 1,
0.4868833, 0.8146547, 1.760195, 1, 0, 0, 1, 1,
0.4909876, -0.5919681, 0.7461481, 0, 0, 0, 1, 1,
0.4919801, -2.588469, 3.805006, 0, 0, 0, 1, 1,
0.4936492, -0.3039151, 2.224644, 0, 0, 0, 1, 1,
0.4958053, -1.819074, 3.007918, 0, 0, 0, 1, 1,
0.4982745, -0.03928142, 3.02622, 0, 0, 0, 1, 1,
0.4983954, 0.5197558, 1.21153, 0, 0, 0, 1, 1,
0.5040363, 0.4542955, -0.19699, 0, 0, 0, 1, 1,
0.5054901, -1.412086, 1.781579, 1, 1, 1, 1, 1,
0.5066897, -0.5219371, 3.423371, 1, 1, 1, 1, 1,
0.5069281, 0.08369403, 1.226886, 1, 1, 1, 1, 1,
0.5088559, 2.135782, -0.4844846, 1, 1, 1, 1, 1,
0.5111238, 0.5726448, 0.3351604, 1, 1, 1, 1, 1,
0.5195227, 1.138125, 0.7830673, 1, 1, 1, 1, 1,
0.5218824, -1.605685, 3.580922, 1, 1, 1, 1, 1,
0.5294744, 0.3652616, 1.406044, 1, 1, 1, 1, 1,
0.5313728, -0.8490212, 3.413922, 1, 1, 1, 1, 1,
0.5344592, 2.33586, -0.3854772, 1, 1, 1, 1, 1,
0.5373175, 0.9498416, 0.1678554, 1, 1, 1, 1, 1,
0.5378098, -1.352417, 2.465897, 1, 1, 1, 1, 1,
0.537979, 0.4180711, -0.4308694, 1, 1, 1, 1, 1,
0.5397356, 0.7886211, -0.1815557, 1, 1, 1, 1, 1,
0.5420446, 0.1278615, 0.128784, 1, 1, 1, 1, 1,
0.5427385, -0.874782, 2.247353, 0, 0, 1, 1, 1,
0.5429816, -0.2488443, 3.095549, 1, 0, 0, 1, 1,
0.5525711, 0.01034421, 0.9210821, 1, 0, 0, 1, 1,
0.5563789, -0.6478845, 2.503765, 1, 0, 0, 1, 1,
0.5571222, 2.443075, 1.591462, 1, 0, 0, 1, 1,
0.5571955, -0.9193981, 2.348674, 1, 0, 0, 1, 1,
0.5573755, 0.7577708, 2.587706, 0, 0, 0, 1, 1,
0.5639802, 0.6698464, 1.526055, 0, 0, 0, 1, 1,
0.569163, -3.002886, 2.727203, 0, 0, 0, 1, 1,
0.5717219, 0.1097422, 2.078233, 0, 0, 0, 1, 1,
0.5737658, -0.4563014, 1.535577, 0, 0, 0, 1, 1,
0.5793222, 0.6634226, 0.9394424, 0, 0, 0, 1, 1,
0.5816035, -1.350544, 4.927521, 0, 0, 0, 1, 1,
0.5832809, 0.1708717, 3.366683, 1, 1, 1, 1, 1,
0.5961935, 0.02551032, -0.2757088, 1, 1, 1, 1, 1,
0.5964538, -1.015222, 2.019574, 1, 1, 1, 1, 1,
0.5972357, -0.4887487, 3.083056, 1, 1, 1, 1, 1,
0.6006511, 1.075436, 0.1659159, 1, 1, 1, 1, 1,
0.6056143, -1.701727, 1.332939, 1, 1, 1, 1, 1,
0.612928, -0.8257781, 2.813442, 1, 1, 1, 1, 1,
0.6144337, -0.6064033, 1.610475, 1, 1, 1, 1, 1,
0.6160954, 0.6888649, 1.389225, 1, 1, 1, 1, 1,
0.6168036, -0.5089476, 3.357758, 1, 1, 1, 1, 1,
0.621693, 0.2465663, 1.738994, 1, 1, 1, 1, 1,
0.6243551, -0.1981041, 1.666867, 1, 1, 1, 1, 1,
0.627298, -2.267136, 3.055074, 1, 1, 1, 1, 1,
0.628705, -0.5869728, 2.7277, 1, 1, 1, 1, 1,
0.628885, 1.439691, -0.567672, 1, 1, 1, 1, 1,
0.6374537, 1.670695, -2.342284, 0, 0, 1, 1, 1,
0.6421614, 0.2965487, -0.8028727, 1, 0, 0, 1, 1,
0.6422165, -1.298206, 0.5473947, 1, 0, 0, 1, 1,
0.643845, 0.3649273, -0.1922266, 1, 0, 0, 1, 1,
0.644369, -0.6557789, 3.112651, 1, 0, 0, 1, 1,
0.6452068, 1.221401, 1.174704, 1, 0, 0, 1, 1,
0.6505285, 0.1862622, 1.658272, 0, 0, 0, 1, 1,
0.6513572, -0.3441215, 3.247795, 0, 0, 0, 1, 1,
0.6515706, -0.5962269, 1.259082, 0, 0, 0, 1, 1,
0.6593252, -0.4299768, 3.021306, 0, 0, 0, 1, 1,
0.6615632, -1.962898, 2.355123, 0, 0, 0, 1, 1,
0.6620781, 0.5334631, 1.424725, 0, 0, 0, 1, 1,
0.6627601, 0.8434054, 1.945764, 0, 0, 0, 1, 1,
0.6632302, -0.8904499, 1.766693, 1, 1, 1, 1, 1,
0.6664402, 1.671039, 1.424929, 1, 1, 1, 1, 1,
0.66939, 1.503937, -2.247796, 1, 1, 1, 1, 1,
0.6718815, -0.9527283, 0.322548, 1, 1, 1, 1, 1,
0.6741438, 0.7724378, 1.262377, 1, 1, 1, 1, 1,
0.6781762, -1.088443, 1.544948, 1, 1, 1, 1, 1,
0.6781909, 0.06101657, 0.06360818, 1, 1, 1, 1, 1,
0.6832459, -0.6233062, 3.515068, 1, 1, 1, 1, 1,
0.6841873, 1.016163, 0.5003285, 1, 1, 1, 1, 1,
0.684239, -2.119, 2.437567, 1, 1, 1, 1, 1,
0.6917279, -2.601822, 3.161513, 1, 1, 1, 1, 1,
0.6917635, 3.107339, 0.05470716, 1, 1, 1, 1, 1,
0.6982927, 1.141047, 1.590337, 1, 1, 1, 1, 1,
0.7005616, 1.241207, 1.361873, 1, 1, 1, 1, 1,
0.7024437, 0.598581, -1.394718, 1, 1, 1, 1, 1,
0.7030582, -0.04169341, 1.986984, 0, 0, 1, 1, 1,
0.7115866, 0.6020207, 0.1802213, 1, 0, 0, 1, 1,
0.7151893, 0.5069513, 1.834297, 1, 0, 0, 1, 1,
0.7166571, -1.681486, 1.35573, 1, 0, 0, 1, 1,
0.7169939, 0.709733, 0.5167117, 1, 0, 0, 1, 1,
0.7186009, -0.5699394, 2.510532, 1, 0, 0, 1, 1,
0.7200334, 0.1712967, -0.2271484, 0, 0, 0, 1, 1,
0.7214486, 1.07189, 1.114696, 0, 0, 0, 1, 1,
0.7271121, 0.1766516, -0.06876607, 0, 0, 0, 1, 1,
0.7328095, 0.1991467, 1.072042, 0, 0, 0, 1, 1,
0.7347979, -0.05633909, 2.84772, 0, 0, 0, 1, 1,
0.7360675, -0.2074768, 3.823903, 0, 0, 0, 1, 1,
0.7382734, 1.361499, 0.3181475, 0, 0, 0, 1, 1,
0.7395983, -0.8921878, 0.4879101, 1, 1, 1, 1, 1,
0.7476336, 0.6186783, 1.451138, 1, 1, 1, 1, 1,
0.7514513, 0.3218378, 0.1862083, 1, 1, 1, 1, 1,
0.7563603, 1.107954, 1.16368, 1, 1, 1, 1, 1,
0.7567387, -0.124789, -1.24695, 1, 1, 1, 1, 1,
0.7604886, -0.1452967, 0.8862868, 1, 1, 1, 1, 1,
0.763984, 0.5945035, -0.1116148, 1, 1, 1, 1, 1,
0.7647025, 0.3478762, 2.494675, 1, 1, 1, 1, 1,
0.7683218, 0.5540571, 1.085596, 1, 1, 1, 1, 1,
0.7733908, 0.9896505, 0.6025894, 1, 1, 1, 1, 1,
0.7759628, 0.8455817, 0.8581212, 1, 1, 1, 1, 1,
0.7783756, -0.2764209, 1.488219, 1, 1, 1, 1, 1,
0.7793427, -0.2542922, 0.9675823, 1, 1, 1, 1, 1,
0.7828071, 0.5756513, 0.7788604, 1, 1, 1, 1, 1,
0.7872347, 1.029196, 1.930253, 1, 1, 1, 1, 1,
0.7911224, -0.6171623, 2.531226, 0, 0, 1, 1, 1,
0.7954043, -0.2683805, 2.247294, 1, 0, 0, 1, 1,
0.8063117, -2.524665, 3.613101, 1, 0, 0, 1, 1,
0.8145302, 0.5326168, 2.66177, 1, 0, 0, 1, 1,
0.8146072, -0.9623163, 1.793865, 1, 0, 0, 1, 1,
0.8164324, 0.008409666, 1.538929, 1, 0, 0, 1, 1,
0.8164947, -1.865142, 3.195531, 0, 0, 0, 1, 1,
0.8240054, 1.677264, 0.3079545, 0, 0, 0, 1, 1,
0.825581, -1.057011, 2.939487, 0, 0, 0, 1, 1,
0.8276429, -0.9507418, 1.525208, 0, 0, 0, 1, 1,
0.8276528, -1.249513, 2.147914, 0, 0, 0, 1, 1,
0.8292834, -2.247644, 2.763053, 0, 0, 0, 1, 1,
0.8299485, 0.09960397, 1.956731, 0, 0, 0, 1, 1,
0.832963, -0.9803854, 3.545378, 1, 1, 1, 1, 1,
0.8335369, 1.042652, -0.6133055, 1, 1, 1, 1, 1,
0.8427995, -0.07782576, -0.01573233, 1, 1, 1, 1, 1,
0.8439966, 0.7260376, 0.2552165, 1, 1, 1, 1, 1,
0.8468708, -0.1107178, 2.588665, 1, 1, 1, 1, 1,
0.8488885, -0.430024, 2.53865, 1, 1, 1, 1, 1,
0.8513682, -0.7068495, 3.255697, 1, 1, 1, 1, 1,
0.8530642, -0.4928142, 1.6429, 1, 1, 1, 1, 1,
0.8534804, 2.095216, 0.1424172, 1, 1, 1, 1, 1,
0.8608221, -0.4297681, 2.06735, 1, 1, 1, 1, 1,
0.8608269, 0.6173337, 0.5260127, 1, 1, 1, 1, 1,
0.8608698, 0.7611008, -0.597188, 1, 1, 1, 1, 1,
0.8661677, -0.003680925, 0.5646012, 1, 1, 1, 1, 1,
0.8731926, -0.5502064, 0.2944874, 1, 1, 1, 1, 1,
0.8735701, 0.1757719, 1.865475, 1, 1, 1, 1, 1,
0.8737626, -0.944871, 2.560283, 0, 0, 1, 1, 1,
0.8742744, -1.113479, 0.3938409, 1, 0, 0, 1, 1,
0.8836827, 0.6377144, 1.432354, 1, 0, 0, 1, 1,
0.8854701, 0.2830969, 0.9924338, 1, 0, 0, 1, 1,
0.8873572, -1.104772, 0.3380047, 1, 0, 0, 1, 1,
0.8900823, 0.6029894, 0.2496698, 1, 0, 0, 1, 1,
0.8995837, 1.694651, 2.318925, 0, 0, 0, 1, 1,
0.900764, 1.358902, 0.1904115, 0, 0, 0, 1, 1,
0.9016303, 2.071657, -0.4185342, 0, 0, 0, 1, 1,
0.9019242, -0.1131082, 1.658926, 0, 0, 0, 1, 1,
0.9093953, -0.09957209, 0.2385228, 0, 0, 0, 1, 1,
0.9214103, 1.087661, 0.6339942, 0, 0, 0, 1, 1,
0.9293282, 0.05841513, 1.805304, 0, 0, 0, 1, 1,
0.9350033, 0.0449055, 0.7553742, 1, 1, 1, 1, 1,
0.943802, -0.6453906, 5.253587, 1, 1, 1, 1, 1,
0.9460347, 1.205857, 1.145329, 1, 1, 1, 1, 1,
0.9460583, 0.3126677, 1.189683, 1, 1, 1, 1, 1,
0.9465962, -0.8863849, 3.282501, 1, 1, 1, 1, 1,
0.9509616, -0.4705836, 2.837997, 1, 1, 1, 1, 1,
0.9564364, -1.786009, 3.480217, 1, 1, 1, 1, 1,
0.9591354, 1.596971, -0.3477713, 1, 1, 1, 1, 1,
0.9637817, 0.6854085, 1.327769, 1, 1, 1, 1, 1,
0.9774192, 1.799773, 0.4114768, 1, 1, 1, 1, 1,
0.9790941, -1.0242, 4.187756, 1, 1, 1, 1, 1,
0.9843113, 0.177089, 2.159526, 1, 1, 1, 1, 1,
0.9875941, -1.424464, 2.389848, 1, 1, 1, 1, 1,
0.9933814, -2.18637, 2.888863, 1, 1, 1, 1, 1,
0.9985941, 0.2414426, 0.9020848, 1, 1, 1, 1, 1,
0.9994395, 1.474641, -0.1497322, 0, 0, 1, 1, 1,
1.007708, -2.088463, 4.16815, 1, 0, 0, 1, 1,
1.012575, -0.7983017, 2.780773, 1, 0, 0, 1, 1,
1.012663, -1.921153, 1.467137, 1, 0, 0, 1, 1,
1.013826, -1.172493, 3.209235, 1, 0, 0, 1, 1,
1.023953, 0.1758338, 1.579257, 1, 0, 0, 1, 1,
1.034104, -0.4093786, 2.24227, 0, 0, 0, 1, 1,
1.047883, 0.7106317, 1.017342, 0, 0, 0, 1, 1,
1.057949, -0.5175877, 1.302259, 0, 0, 0, 1, 1,
1.068027, -0.1220197, 1.429734, 0, 0, 0, 1, 1,
1.06952, -0.3571247, 1.089103, 0, 0, 0, 1, 1,
1.070415, -0.06306688, 2.625779, 0, 0, 0, 1, 1,
1.079593, -0.4532671, 2.743408, 0, 0, 0, 1, 1,
1.088042, -1.421067, 2.9067, 1, 1, 1, 1, 1,
1.090672, 1.552674, 1.552406, 1, 1, 1, 1, 1,
1.092545, 0.8080061, 0.2304241, 1, 1, 1, 1, 1,
1.093787, -0.6946684, 1.780733, 1, 1, 1, 1, 1,
1.099667, -2.291569, 4.895739, 1, 1, 1, 1, 1,
1.103025, 1.061696, 0.1989282, 1, 1, 1, 1, 1,
1.10539, -0.812095, 2.180252, 1, 1, 1, 1, 1,
1.111884, 0.1016057, 2.054549, 1, 1, 1, 1, 1,
1.117483, 0.3036674, 1.803857, 1, 1, 1, 1, 1,
1.133624, -0.9408202, 2.614122, 1, 1, 1, 1, 1,
1.133753, -1.037611, 3.077309, 1, 1, 1, 1, 1,
1.140972, 1.626177, -0.4463178, 1, 1, 1, 1, 1,
1.147808, -0.03988392, 1.636928, 1, 1, 1, 1, 1,
1.150068, 0.3146698, -0.4857126, 1, 1, 1, 1, 1,
1.150156, 0.597087, 0.7774845, 1, 1, 1, 1, 1,
1.151153, -1.092725, 2.583426, 0, 0, 1, 1, 1,
1.158347, -0.4450398, 2.432639, 1, 0, 0, 1, 1,
1.166811, 0.1809205, 2.070969, 1, 0, 0, 1, 1,
1.166888, 0.6430437, 0.861451, 1, 0, 0, 1, 1,
1.169142, 2.179729, 0.5738685, 1, 0, 0, 1, 1,
1.185707, 1.782845, 2.838842, 1, 0, 0, 1, 1,
1.192156, -0.08143512, 1.076467, 0, 0, 0, 1, 1,
1.199435, -0.1162249, 0.2289635, 0, 0, 0, 1, 1,
1.207647, 0.5997961, -0.0926108, 0, 0, 0, 1, 1,
1.210183, -2.526917, 3.331819, 0, 0, 0, 1, 1,
1.213724, 0.7188429, 1.258893, 0, 0, 0, 1, 1,
1.213823, 0.9840868, 0.9947377, 0, 0, 0, 1, 1,
1.220597, -0.7769995, 1.306714, 0, 0, 0, 1, 1,
1.221024, 1.318885, 0.9613073, 1, 1, 1, 1, 1,
1.227641, -0.2530449, 1.143542, 1, 1, 1, 1, 1,
1.229852, 2.009247, 1.052903, 1, 1, 1, 1, 1,
1.231497, 0.1112744, 1.261364, 1, 1, 1, 1, 1,
1.231793, 0.4789659, 3.288153, 1, 1, 1, 1, 1,
1.233113, 1.925203, -0.5092009, 1, 1, 1, 1, 1,
1.234907, -0.2515363, 0.231458, 1, 1, 1, 1, 1,
1.240949, -0.6598133, 3.108718, 1, 1, 1, 1, 1,
1.24294, -0.08615074, 0.8204995, 1, 1, 1, 1, 1,
1.246347, 0.4551918, -0.005508393, 1, 1, 1, 1, 1,
1.249328, -0.6114318, 0.9559739, 1, 1, 1, 1, 1,
1.25554, -1.549949, 2.855059, 1, 1, 1, 1, 1,
1.256482, 0.7537416, 0.1420064, 1, 1, 1, 1, 1,
1.258851, 1.5975, 1.897419, 1, 1, 1, 1, 1,
1.260991, 1.238822, 0.08188739, 1, 1, 1, 1, 1,
1.274201, -0.6817836, 2.330458, 0, 0, 1, 1, 1,
1.276506, 0.548404, 2.016824, 1, 0, 0, 1, 1,
1.280562, -1.744989, 1.735456, 1, 0, 0, 1, 1,
1.289317, 0.2748332, 1.750277, 1, 0, 0, 1, 1,
1.291255, -0.870502, 1.620528, 1, 0, 0, 1, 1,
1.306096, -1.482196, 2.40325, 1, 0, 0, 1, 1,
1.318862, -2.281906, 3.737859, 0, 0, 0, 1, 1,
1.327221, 2.162228, -0.5968628, 0, 0, 0, 1, 1,
1.330077, -0.9946294, 2.441922, 0, 0, 0, 1, 1,
1.335872, 0.549957, 1.510576, 0, 0, 0, 1, 1,
1.352376, 0.0227314, 2.279358, 0, 0, 0, 1, 1,
1.362216, -0.3322831, -0.4584439, 0, 0, 0, 1, 1,
1.374004, -0.4279909, 0.3626027, 0, 0, 0, 1, 1,
1.381696, 0.2309215, 2.70485, 1, 1, 1, 1, 1,
1.388854, -0.1697027, 2.325734, 1, 1, 1, 1, 1,
1.392826, -0.3382338, 2.29476, 1, 1, 1, 1, 1,
1.404493, -1.818169, 4.141419, 1, 1, 1, 1, 1,
1.409629, 1.634644, 0.72285, 1, 1, 1, 1, 1,
1.415905, 0.3132682, 0.7666519, 1, 1, 1, 1, 1,
1.419542, -0.03482756, 2.664483, 1, 1, 1, 1, 1,
1.426372, -0.3680094, 0.8908204, 1, 1, 1, 1, 1,
1.428805, -0.4291534, 1.660795, 1, 1, 1, 1, 1,
1.430375, -0.7915282, 2.376663, 1, 1, 1, 1, 1,
1.432301, 0.005635773, 0.301039, 1, 1, 1, 1, 1,
1.447045, -0.6457779, 1.694706, 1, 1, 1, 1, 1,
1.448568, -0.3803491, -0.5119185, 1, 1, 1, 1, 1,
1.458681, -1.020375, 2.685719, 1, 1, 1, 1, 1,
1.461491, 0.3940733, 1.284134, 1, 1, 1, 1, 1,
1.464318, 0.7200537, 0.4895699, 0, 0, 1, 1, 1,
1.470571, 0.08231898, 2.448581, 1, 0, 0, 1, 1,
1.487316, -0.7671591, 1.343415, 1, 0, 0, 1, 1,
1.49094, -1.00709, 3.453866, 1, 0, 0, 1, 1,
1.495115, -0.3078538, 2.054908, 1, 0, 0, 1, 1,
1.499874, -1.165161, 2.771354, 1, 0, 0, 1, 1,
1.5042, -0.7730445, 2.108283, 0, 0, 0, 1, 1,
1.538472, -0.912565, 0.587478, 0, 0, 0, 1, 1,
1.543431, 1.111894, -0.09507639, 0, 0, 0, 1, 1,
1.574947, 0.4618761, -0.6472654, 0, 0, 0, 1, 1,
1.575637, -0.6556283, 3.387502, 0, 0, 0, 1, 1,
1.586695, 2.272391, 2.26466, 0, 0, 0, 1, 1,
1.601419, 0.8708091, 1.668082, 0, 0, 0, 1, 1,
1.601813, -1.744666, 2.26459, 1, 1, 1, 1, 1,
1.608462, 0.07443654, 1.675584, 1, 1, 1, 1, 1,
1.611458, 1.355721, -0.8296459, 1, 1, 1, 1, 1,
1.613016, 0.8861004, 2.313473, 1, 1, 1, 1, 1,
1.61755, 0.5527304, 2.023608, 1, 1, 1, 1, 1,
1.635049, -0.4473408, 3.597888, 1, 1, 1, 1, 1,
1.63562, 0.2772914, 1.197934, 1, 1, 1, 1, 1,
1.668799, 1.702412, 1.996075, 1, 1, 1, 1, 1,
1.670239, -0.3878796, 1.366956, 1, 1, 1, 1, 1,
1.67504, -0.4041607, 2.239416, 1, 1, 1, 1, 1,
1.685383, -0.6008965, 3.238148, 1, 1, 1, 1, 1,
1.68552, -1.89874, 2.003709, 1, 1, 1, 1, 1,
1.688523, 0.006011471, 0.519156, 1, 1, 1, 1, 1,
1.69464, -0.2013034, 4.090923, 1, 1, 1, 1, 1,
1.706697, -0.4795865, 1.119107, 1, 1, 1, 1, 1,
1.713286, -0.1679088, 1.275555, 0, 0, 1, 1, 1,
1.723404, -1.519415, 3.688792, 1, 0, 0, 1, 1,
1.730114, -1.26903, 2.126978, 1, 0, 0, 1, 1,
1.732866, -0.5486837, 2.502131, 1, 0, 0, 1, 1,
1.763651, -1.999142, 3.393038, 1, 0, 0, 1, 1,
1.76916, 0.006825764, 1.902934, 1, 0, 0, 1, 1,
1.778238, -0.09241305, 1.063357, 0, 0, 0, 1, 1,
1.789674, -0.5403836, 1.354308, 0, 0, 0, 1, 1,
1.793433, -1.579316, 3.323806, 0, 0, 0, 1, 1,
1.806352, 0.1616367, 3.951907, 0, 0, 0, 1, 1,
1.812095, 0.8919982, 2.085992, 0, 0, 0, 1, 1,
1.813289, 0.3450427, -0.377954, 0, 0, 0, 1, 1,
1.832979, 0.4832958, -0.009631778, 0, 0, 0, 1, 1,
1.839575, -1.182249, 2.245531, 1, 1, 1, 1, 1,
1.84243, -0.7322037, 2.252039, 1, 1, 1, 1, 1,
1.850486, -0.7710349, 5.471577, 1, 1, 1, 1, 1,
1.884954, 1.035637, 3.546036, 1, 1, 1, 1, 1,
1.902696, -0.8176883, 3.354361, 1, 1, 1, 1, 1,
1.907632, 0.8129452, 1.258168, 1, 1, 1, 1, 1,
1.912984, -0.07428355, 1.88778, 1, 1, 1, 1, 1,
1.91393, 0.1413505, 0.2284642, 1, 1, 1, 1, 1,
1.925772, -0.2342197, 2.224179, 1, 1, 1, 1, 1,
1.936232, 0.03307004, 1.063107, 1, 1, 1, 1, 1,
1.943672, -0.02573911, 0.2367455, 1, 1, 1, 1, 1,
1.968255, -2.272334, 1.350826, 1, 1, 1, 1, 1,
1.96906, 1.487664, 0.720856, 1, 1, 1, 1, 1,
1.969485, -0.6414309, 1.079985, 1, 1, 1, 1, 1,
1.973088, 0.9777595, 0.1472624, 1, 1, 1, 1, 1,
1.996271, -0.5988672, -0.394693, 0, 0, 1, 1, 1,
1.99822, -0.341075, 2.613501, 1, 0, 0, 1, 1,
2.007169, 0.8307838, 0.9288809, 1, 0, 0, 1, 1,
2.110452, -0.7985992, 1.494716, 1, 0, 0, 1, 1,
2.140134, 0.406581, 1.5688, 1, 0, 0, 1, 1,
2.168611, 0.5715527, 1.845874, 1, 0, 0, 1, 1,
2.191602, 0.07476467, 1.524581, 0, 0, 0, 1, 1,
2.195755, 1.219022, 0.781582, 0, 0, 0, 1, 1,
2.211229, 0.2572845, 2.20804, 0, 0, 0, 1, 1,
2.29171, -1.572221, 1.668442, 0, 0, 0, 1, 1,
2.294334, 0.1244377, 0.9039807, 0, 0, 0, 1, 1,
2.341533, -0.2946695, 1.582344, 0, 0, 0, 1, 1,
2.381891, -0.3181924, 0.1611651, 0, 0, 0, 1, 1,
2.454822, -1.237907, 1.357798, 1, 1, 1, 1, 1,
2.513649, 1.247183, 1.056794, 1, 1, 1, 1, 1,
2.770334, 1.010269, 1.800087, 1, 1, 1, 1, 1,
2.855294, 0.0626392, -0.07973962, 1, 1, 1, 1, 1,
2.899729, -0.5230262, 2.308453, 1, 1, 1, 1, 1,
2.935054, -0.8517345, 2.048993, 1, 1, 1, 1, 1,
3.233188, 0.1164866, 0.7872567, 1, 1, 1, 1, 1
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
var radius = 9.422634;
var distance = 33.0966;
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
mvMatrix.translate( -0.09781504, -0.05222654, -0.160346 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0966);
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