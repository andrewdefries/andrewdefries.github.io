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
-3.595434, 0.3107226, -2.205993, 1, 0, 0, 1,
-3.232006, 0.581683, -0.5297977, 1, 0.007843138, 0, 1,
-3.101877, -0.7696481, -3.026596, 1, 0.01176471, 0, 1,
-3.005806, 0.9090676, -0.9624221, 1, 0.01960784, 0, 1,
-2.850142, -0.1576613, -1.661046, 1, 0.02352941, 0, 1,
-2.830087, -0.04249076, -1.757158, 1, 0.03137255, 0, 1,
-2.810346, -0.6626495, -2.302484, 1, 0.03529412, 0, 1,
-2.676759, 1.345301, 0.07013036, 1, 0.04313726, 0, 1,
-2.656882, -0.1016347, -2.883149, 1, 0.04705882, 0, 1,
-2.6194, -0.8840406, -1.175291, 1, 0.05490196, 0, 1,
-2.541756, 0.3281404, -0.905723, 1, 0.05882353, 0, 1,
-2.454627, 2.823647, -0.3693507, 1, 0.06666667, 0, 1,
-2.380517, -0.5571334, -0.7132777, 1, 0.07058824, 0, 1,
-2.367436, -1.845946, -2.259453, 1, 0.07843138, 0, 1,
-2.332089, 0.3447918, -2.95031, 1, 0.08235294, 0, 1,
-2.293597, 0.1052609, -1.624351, 1, 0.09019608, 0, 1,
-2.252735, -0.5894762, -0.9726744, 1, 0.09411765, 0, 1,
-2.204967, -0.6150159, -1.435418, 1, 0.1019608, 0, 1,
-2.138265, 0.9928445, -0.6329792, 1, 0.1098039, 0, 1,
-2.133104, 1.957838, -0.7692928, 1, 0.1137255, 0, 1,
-2.102694, -0.3967055, -2.155741, 1, 0.1215686, 0, 1,
-2.089456, -0.9558657, -1.501384, 1, 0.1254902, 0, 1,
-2.08357, 0.86335, -1.297032, 1, 0.1333333, 0, 1,
-2.080561, 0.09009511, -1.846268, 1, 0.1372549, 0, 1,
-2.0413, -0.5754565, -2.505421, 1, 0.145098, 0, 1,
-2.038049, -0.221685, -3.295457, 1, 0.1490196, 0, 1,
-2.003516, -0.01411677, -2.532719, 1, 0.1568628, 0, 1,
-1.989187, 0.9577868, -2.914271, 1, 0.1607843, 0, 1,
-1.983608, -0.8078038, -2.084892, 1, 0.1686275, 0, 1,
-1.97431, 0.02755335, -1.152657, 1, 0.172549, 0, 1,
-1.956594, -1.252503, -3.514095, 1, 0.1803922, 0, 1,
-1.955006, -0.5888941, -2.569384, 1, 0.1843137, 0, 1,
-1.901144, 1.209188, -0.6640166, 1, 0.1921569, 0, 1,
-1.86016, -0.09482998, -1.529045, 1, 0.1960784, 0, 1,
-1.855705, 1.470359, -0.2853643, 1, 0.2039216, 0, 1,
-1.855603, 1.371247, -1.085229, 1, 0.2117647, 0, 1,
-1.808359, -0.4727519, -2.898593, 1, 0.2156863, 0, 1,
-1.791027, 0.6488696, -2.395917, 1, 0.2235294, 0, 1,
-1.770844, 0.1097619, -3.208719, 1, 0.227451, 0, 1,
-1.765202, -0.1544694, -1.160965, 1, 0.2352941, 0, 1,
-1.755735, -0.4661556, -3.561899, 1, 0.2392157, 0, 1,
-1.745865, -0.5222659, -1.976728, 1, 0.2470588, 0, 1,
-1.73262, 0.4169247, -0.2651059, 1, 0.2509804, 0, 1,
-1.71781, 0.3147288, -1.044381, 1, 0.2588235, 0, 1,
-1.703901, 0.5705897, -3.344533, 1, 0.2627451, 0, 1,
-1.692322, -0.1422863, -2.807944, 1, 0.2705882, 0, 1,
-1.688056, 0.08412384, -3.031068, 1, 0.2745098, 0, 1,
-1.66541, 1.118554, 0.06798758, 1, 0.282353, 0, 1,
-1.65795, -0.4002804, -2.284589, 1, 0.2862745, 0, 1,
-1.65726, 0.5968379, -0.2486566, 1, 0.2941177, 0, 1,
-1.641233, 2.074767, 0.6297503, 1, 0.3019608, 0, 1,
-1.639655, 0.5912775, -2.530748, 1, 0.3058824, 0, 1,
-1.62856, 0.9686719, -1.895844, 1, 0.3137255, 0, 1,
-1.623068, 0.5526915, -1.025148, 1, 0.3176471, 0, 1,
-1.607394, -1.596436, -3.101751, 1, 0.3254902, 0, 1,
-1.606579, -0.2927518, -2.415068, 1, 0.3294118, 0, 1,
-1.599173, -0.3202947, -1.304546, 1, 0.3372549, 0, 1,
-1.592857, -0.610759, -0.3667769, 1, 0.3411765, 0, 1,
-1.588065, 2.216738, -0.01239052, 1, 0.3490196, 0, 1,
-1.57824, 0.4594043, -0.8939475, 1, 0.3529412, 0, 1,
-1.574396, -1.473536, -3.663693, 1, 0.3607843, 0, 1,
-1.562482, -0.4452115, -1.704062, 1, 0.3647059, 0, 1,
-1.560082, -0.1446404, -0.4761135, 1, 0.372549, 0, 1,
-1.559986, -0.1947493, -1.475465, 1, 0.3764706, 0, 1,
-1.559832, 0.4067428, -1.751287, 1, 0.3843137, 0, 1,
-1.54922, 0.2266757, -0.1271556, 1, 0.3882353, 0, 1,
-1.540938, 0.3238438, -1.966366, 1, 0.3960784, 0, 1,
-1.538843, -2.012091, -2.323104, 1, 0.4039216, 0, 1,
-1.526547, 0.2574891, -1.931301, 1, 0.4078431, 0, 1,
-1.520182, -1.321386, -0.7194452, 1, 0.4156863, 0, 1,
-1.517586, 1.11123, 0.1031139, 1, 0.4196078, 0, 1,
-1.507356, 1.182936, -1.966129, 1, 0.427451, 0, 1,
-1.507209, 0.1644268, -1.230775, 1, 0.4313726, 0, 1,
-1.496762, -0.3907062, -1.147292, 1, 0.4392157, 0, 1,
-1.492276, 0.9960804, -0.8478568, 1, 0.4431373, 0, 1,
-1.485284, 0.301089, -1.171112, 1, 0.4509804, 0, 1,
-1.484722, -1.138537, -2.772419, 1, 0.454902, 0, 1,
-1.481604, 0.7943062, -2.201583, 1, 0.4627451, 0, 1,
-1.477749, 2.354557, 0.6133735, 1, 0.4666667, 0, 1,
-1.471156, 0.1872861, -0.0370537, 1, 0.4745098, 0, 1,
-1.470902, 0.6447862, -0.7250901, 1, 0.4784314, 0, 1,
-1.463986, -1.392915, -2.344917, 1, 0.4862745, 0, 1,
-1.463223, 0.5836702, -0.5917695, 1, 0.4901961, 0, 1,
-1.462237, 0.8109362, -1.702507, 1, 0.4980392, 0, 1,
-1.455, 0.7090181, -0.3981563, 1, 0.5058824, 0, 1,
-1.44141, -0.280342, -2.520892, 1, 0.509804, 0, 1,
-1.43435, 0.598091, -1.59846, 1, 0.5176471, 0, 1,
-1.432937, 0.35772, -1.209265, 1, 0.5215687, 0, 1,
-1.424727, -0.1592557, -2.679894, 1, 0.5294118, 0, 1,
-1.421111, 0.7625127, -1.232791, 1, 0.5333334, 0, 1,
-1.418969, -0.4348919, -1.126061, 1, 0.5411765, 0, 1,
-1.411077, 0.5544811, -1.056547, 1, 0.5450981, 0, 1,
-1.411015, -0.3602643, -0.8039228, 1, 0.5529412, 0, 1,
-1.409011, 0.2431233, -1.758848, 1, 0.5568628, 0, 1,
-1.407977, 1.074684, -1.218332, 1, 0.5647059, 0, 1,
-1.399831, 1.702587, -0.6827898, 1, 0.5686275, 0, 1,
-1.376328, -0.7214987, -2.375759, 1, 0.5764706, 0, 1,
-1.376311, 1.235549, -0.1713856, 1, 0.5803922, 0, 1,
-1.361244, 0.9963035, -0.9058515, 1, 0.5882353, 0, 1,
-1.355878, -0.3259958, -3.48201, 1, 0.5921569, 0, 1,
-1.341301, -1.241131, -2.733132, 1, 0.6, 0, 1,
-1.323333, -0.9576893, -2.676219, 1, 0.6078432, 0, 1,
-1.322162, -1.780867, -2.099536, 1, 0.6117647, 0, 1,
-1.316481, -0.04531106, -1.609754, 1, 0.6196079, 0, 1,
-1.315359, -0.3087809, 0.9936998, 1, 0.6235294, 0, 1,
-1.309244, 0.09320707, -1.996178, 1, 0.6313726, 0, 1,
-1.297411, 0.1429025, -2.880553, 1, 0.6352941, 0, 1,
-1.295746, 0.3462054, -2.515761, 1, 0.6431373, 0, 1,
-1.294736, -1.464203, -2.394462, 1, 0.6470588, 0, 1,
-1.287442, -0.6639631, -1.589906, 1, 0.654902, 0, 1,
-1.287382, -0.5740665, -1.061057, 1, 0.6588235, 0, 1,
-1.279709, 0.4779941, -2.582857, 1, 0.6666667, 0, 1,
-1.279461, -1.216677, -3.441944, 1, 0.6705883, 0, 1,
-1.277687, -0.7387968, -1.92619, 1, 0.6784314, 0, 1,
-1.266551, -0.8160842, -2.705523, 1, 0.682353, 0, 1,
-1.255088, 1.882692, 0.4334513, 1, 0.6901961, 0, 1,
-1.240893, -0.3305266, -1.75427, 1, 0.6941177, 0, 1,
-1.238914, -0.3674351, -2.716949, 1, 0.7019608, 0, 1,
-1.228257, 1.223064, -0.6349581, 1, 0.7098039, 0, 1,
-1.214476, 1.956193, -0.1786829, 1, 0.7137255, 0, 1,
-1.204759, -0.01802759, -2.641274, 1, 0.7215686, 0, 1,
-1.20256, -1.845228, -3.068486, 1, 0.7254902, 0, 1,
-1.200347, 0.04170612, -0.8524586, 1, 0.7333333, 0, 1,
-1.199865, 1.757845, -0.6074311, 1, 0.7372549, 0, 1,
-1.186938, 0.1477761, 0.2613077, 1, 0.7450981, 0, 1,
-1.174918, -0.1859886, -3.38846, 1, 0.7490196, 0, 1,
-1.173988, -1.114152, -2.57922, 1, 0.7568628, 0, 1,
-1.168299, 1.170609, 0.6793181, 1, 0.7607843, 0, 1,
-1.167644, -1.406485, -0.9793467, 1, 0.7686275, 0, 1,
-1.158566, -0.6534675, -1.705178, 1, 0.772549, 0, 1,
-1.155567, -0.3970943, -1.268164, 1, 0.7803922, 0, 1,
-1.149817, 0.04017592, -2.955056, 1, 0.7843137, 0, 1,
-1.146202, 0.517805, -0.9506711, 1, 0.7921569, 0, 1,
-1.146023, 0.4648973, -0.1269678, 1, 0.7960784, 0, 1,
-1.142356, 0.1009907, -1.095245, 1, 0.8039216, 0, 1,
-1.141081, -0.3016902, -2.366785, 1, 0.8117647, 0, 1,
-1.136282, 1.966065, -1.540449, 1, 0.8156863, 0, 1,
-1.131191, 0.08469851, -1.553545, 1, 0.8235294, 0, 1,
-1.130634, -0.8819746, -1.452587, 1, 0.827451, 0, 1,
-1.122624, -1.241916, -0.7110255, 1, 0.8352941, 0, 1,
-1.12036, 1.324023, 0.09943601, 1, 0.8392157, 0, 1,
-1.116538, 0.7728472, 0.1187458, 1, 0.8470588, 0, 1,
-1.116445, -0.1143836, -3.759135, 1, 0.8509804, 0, 1,
-1.116303, 2.127309, -0.6089369, 1, 0.8588235, 0, 1,
-1.114968, -0.07057159, 0.1395703, 1, 0.8627451, 0, 1,
-1.099282, -0.5281785, -2.597168, 1, 0.8705882, 0, 1,
-1.092597, 0.8519424, 1.021111, 1, 0.8745098, 0, 1,
-1.092208, -0.0190893, -3.444681, 1, 0.8823529, 0, 1,
-1.091751, -0.3056687, -2.84438, 1, 0.8862745, 0, 1,
-1.079994, -0.2772335, -2.19729, 1, 0.8941177, 0, 1,
-1.065605, 0.9593022, -1.15607, 1, 0.8980392, 0, 1,
-1.061543, 1.103631, -0.9114624, 1, 0.9058824, 0, 1,
-1.060714, -0.8096167, -0.8917016, 1, 0.9137255, 0, 1,
-1.054438, -0.9729756, -1.234426, 1, 0.9176471, 0, 1,
-1.050926, 0.8222138, -1.025525, 1, 0.9254902, 0, 1,
-1.032528, -0.306818, -1.634258, 1, 0.9294118, 0, 1,
-1.029973, -0.4869007, -2.776028, 1, 0.9372549, 0, 1,
-1.022124, -0.4663863, -1.477888, 1, 0.9411765, 0, 1,
-1.006958, 0.4002565, -1.218031, 1, 0.9490196, 0, 1,
-1.004888, -2.20698, -0.9760109, 1, 0.9529412, 0, 1,
-0.9975211, 0.04460277, -1.811319, 1, 0.9607843, 0, 1,
-0.9964725, -0.342395, -2.046179, 1, 0.9647059, 0, 1,
-0.9929746, 1.397164, -0.9332087, 1, 0.972549, 0, 1,
-0.9925257, -2.117523, -3.753654, 1, 0.9764706, 0, 1,
-0.989689, 0.3178805, -0.04304907, 1, 0.9843137, 0, 1,
-0.9856275, 0.953077, -1.189978, 1, 0.9882353, 0, 1,
-0.9851598, -0.6300865, -3.072639, 1, 0.9960784, 0, 1,
-0.9842654, -0.2031228, -2.992593, 0.9960784, 1, 0, 1,
-0.9813696, 0.02839086, -0.8719714, 0.9921569, 1, 0, 1,
-0.979879, 0.9926326, -0.9524169, 0.9843137, 1, 0, 1,
-0.9723398, -0.9614555, -1.644061, 0.9803922, 1, 0, 1,
-0.9662877, 0.2198359, -2.382472, 0.972549, 1, 0, 1,
-0.9641629, 0.8378676, -1.668818, 0.9686275, 1, 0, 1,
-0.9602232, 0.407315, -2.535792, 0.9607843, 1, 0, 1,
-0.9588993, -0.09383629, -2.852082, 0.9568627, 1, 0, 1,
-0.9587107, -0.4060914, -2.30231, 0.9490196, 1, 0, 1,
-0.9465097, -1.061737, -2.954092, 0.945098, 1, 0, 1,
-0.9399171, -0.9352551, -2.64981, 0.9372549, 1, 0, 1,
-0.912356, 1.39777, -0.2109838, 0.9333333, 1, 0, 1,
-0.910691, 0.6381683, -2.513024, 0.9254902, 1, 0, 1,
-0.9101462, 0.36261, -1.069725, 0.9215686, 1, 0, 1,
-0.9053341, -1.721223, -2.554569, 0.9137255, 1, 0, 1,
-0.9030558, 3.287174, -1.216768, 0.9098039, 1, 0, 1,
-0.9024512, -0.5092127, -1.655355, 0.9019608, 1, 0, 1,
-0.8950212, 0.8760478, -0.2413614, 0.8941177, 1, 0, 1,
-0.8947096, 0.4830571, -0.7299837, 0.8901961, 1, 0, 1,
-0.893047, -2.051135, -3.14005, 0.8823529, 1, 0, 1,
-0.8919656, -0.6215767, -3.598073, 0.8784314, 1, 0, 1,
-0.8917432, 1.088767, -0.5792512, 0.8705882, 1, 0, 1,
-0.891602, -1.08744, -1.962922, 0.8666667, 1, 0, 1,
-0.8888384, 0.2095387, -1.733175, 0.8588235, 1, 0, 1,
-0.8832073, -0.1781947, -1.808219, 0.854902, 1, 0, 1,
-0.8818645, 0.07817975, -2.503807, 0.8470588, 1, 0, 1,
-0.8817201, 0.264313, -1.698339, 0.8431373, 1, 0, 1,
-0.8799348, 1.530034, -0.9459227, 0.8352941, 1, 0, 1,
-0.8780458, -0.8410637, -3.243448, 0.8313726, 1, 0, 1,
-0.8766464, 0.4660733, -1.612637, 0.8235294, 1, 0, 1,
-0.8723899, -1.315235, -3.386825, 0.8196079, 1, 0, 1,
-0.8711509, -0.967011, -1.875174, 0.8117647, 1, 0, 1,
-0.8656125, -1.404604, -3.146961, 0.8078431, 1, 0, 1,
-0.8608927, -0.3408405, -2.129326, 0.8, 1, 0, 1,
-0.8593842, -0.5925518, -0.8988081, 0.7921569, 1, 0, 1,
-0.8576745, -0.4839931, -2.355368, 0.7882353, 1, 0, 1,
-0.8500201, -0.1470089, -1.488686, 0.7803922, 1, 0, 1,
-0.8477873, 1.021787, -1.013062, 0.7764706, 1, 0, 1,
-0.8463506, 0.1842647, -1.945904, 0.7686275, 1, 0, 1,
-0.846221, 0.5263206, -2.274248, 0.7647059, 1, 0, 1,
-0.8401291, 0.1576392, 1.188208, 0.7568628, 1, 0, 1,
-0.8397687, -0.776714, -0.7367864, 0.7529412, 1, 0, 1,
-0.8397216, -1.24066, -1.547656, 0.7450981, 1, 0, 1,
-0.8341773, 0.4056262, -1.279603, 0.7411765, 1, 0, 1,
-0.8314155, -0.1072341, -2.666994, 0.7333333, 1, 0, 1,
-0.8270926, 0.6075582, 1.750393, 0.7294118, 1, 0, 1,
-0.8266314, 1.199647, -0.2205063, 0.7215686, 1, 0, 1,
-0.8258047, -1.732564, -3.238148, 0.7176471, 1, 0, 1,
-0.8249056, 1.150029, -1.203848, 0.7098039, 1, 0, 1,
-0.8246876, -0.7777207, -3.165631, 0.7058824, 1, 0, 1,
-0.824227, 0.6348183, -0.3995103, 0.6980392, 1, 0, 1,
-0.8199403, 0.09973077, -0.06300456, 0.6901961, 1, 0, 1,
-0.8196268, 0.9831856, 0.1088136, 0.6862745, 1, 0, 1,
-0.8171958, -1.320907, -2.081465, 0.6784314, 1, 0, 1,
-0.812767, -0.4221772, -2.063008, 0.6745098, 1, 0, 1,
-0.8110315, -0.4335553, -2.903386, 0.6666667, 1, 0, 1,
-0.8106363, -0.1842279, -0.7778615, 0.6627451, 1, 0, 1,
-0.8029787, 0.5848171, -2.757182, 0.654902, 1, 0, 1,
-0.798431, -0.2923126, -3.160697, 0.6509804, 1, 0, 1,
-0.7982602, -0.3155197, -3.606088, 0.6431373, 1, 0, 1,
-0.7968619, -1.416318, -3.196739, 0.6392157, 1, 0, 1,
-0.7912788, 0.8801457, -1.219669, 0.6313726, 1, 0, 1,
-0.7877227, -0.6553869, -0.8619565, 0.627451, 1, 0, 1,
-0.7795418, -0.4099452, -3.056246, 0.6196079, 1, 0, 1,
-0.7771896, 0.05643604, -1.369858, 0.6156863, 1, 0, 1,
-0.7755817, -0.1370513, -2.268456, 0.6078432, 1, 0, 1,
-0.7736496, -0.1816086, -1.677788, 0.6039216, 1, 0, 1,
-0.7711931, -1.068205, -2.453051, 0.5960785, 1, 0, 1,
-0.7697125, 0.4988511, -1.700787, 0.5882353, 1, 0, 1,
-0.769265, 0.9496357, -2.229513, 0.5843138, 1, 0, 1,
-0.7690817, 0.01289189, -2.544115, 0.5764706, 1, 0, 1,
-0.7653676, -1.525122, -2.990199, 0.572549, 1, 0, 1,
-0.7633285, -0.6426421, -1.566888, 0.5647059, 1, 0, 1,
-0.7581743, -0.4251748, -0.7316707, 0.5607843, 1, 0, 1,
-0.756286, 0.5958186, -1.010928, 0.5529412, 1, 0, 1,
-0.7522607, -1.50038, -4.760205, 0.5490196, 1, 0, 1,
-0.7406738, 1.672758, 0.07008043, 0.5411765, 1, 0, 1,
-0.7396085, -0.3656504, -2.641995, 0.5372549, 1, 0, 1,
-0.738156, 0.3017528, -1.624036, 0.5294118, 1, 0, 1,
-0.736221, -0.250108, -3.285711, 0.5254902, 1, 0, 1,
-0.7223389, 1.918932, -0.06918979, 0.5176471, 1, 0, 1,
-0.7172516, -0.3580598, -1.005052, 0.5137255, 1, 0, 1,
-0.7167103, 0.04205286, -1.061456, 0.5058824, 1, 0, 1,
-0.7126214, -0.1384825, -1.424875, 0.5019608, 1, 0, 1,
-0.7116269, -0.7713151, -2.541007, 0.4941176, 1, 0, 1,
-0.7066207, -1.191629, -2.438815, 0.4862745, 1, 0, 1,
-0.7043667, -1.640193, -2.143919, 0.4823529, 1, 0, 1,
-0.7039567, 1.572297, -0.7621429, 0.4745098, 1, 0, 1,
-0.6957105, 0.1092705, -3.01467, 0.4705882, 1, 0, 1,
-0.6923189, 2.422052, -1.45955, 0.4627451, 1, 0, 1,
-0.6912422, -0.009995806, -0.7925537, 0.4588235, 1, 0, 1,
-0.6892468, 0.5650342, -0.7408533, 0.4509804, 1, 0, 1,
-0.6887742, -0.1521226, 0.01304455, 0.4470588, 1, 0, 1,
-0.6876573, 0.7573301, -0.03414012, 0.4392157, 1, 0, 1,
-0.6846399, 1.434101, -2.237448, 0.4352941, 1, 0, 1,
-0.6813837, 0.8374061, -1.812107, 0.427451, 1, 0, 1,
-0.68048, 0.1582196, -1.548173, 0.4235294, 1, 0, 1,
-0.6797395, -1.909799, -3.040816, 0.4156863, 1, 0, 1,
-0.6718544, 0.09686805, -1.308732, 0.4117647, 1, 0, 1,
-0.6674424, 1.325673, -0.9365113, 0.4039216, 1, 0, 1,
-0.6673759, 0.950443, -0.8812306, 0.3960784, 1, 0, 1,
-0.6653494, 0.5148455, -0.8694283, 0.3921569, 1, 0, 1,
-0.6648802, 0.03838193, -2.445659, 0.3843137, 1, 0, 1,
-0.6577902, 0.3376949, 0.2701754, 0.3803922, 1, 0, 1,
-0.6573998, -0.5118409, -1.166493, 0.372549, 1, 0, 1,
-0.6536072, -1.563473, -3.098024, 0.3686275, 1, 0, 1,
-0.6451291, -0.8794264, -3.378622, 0.3607843, 1, 0, 1,
-0.6450007, -0.290742, -1.504207, 0.3568628, 1, 0, 1,
-0.6448907, 0.8641664, 0.04150827, 0.3490196, 1, 0, 1,
-0.6435008, 1.343873, -0.1921747, 0.345098, 1, 0, 1,
-0.6407652, -1.364259, -3.604322, 0.3372549, 1, 0, 1,
-0.6372491, 0.9406691, -0.3627934, 0.3333333, 1, 0, 1,
-0.6328658, -2.503391, -1.170058, 0.3254902, 1, 0, 1,
-0.625316, 0.8984589, -1.153192, 0.3215686, 1, 0, 1,
-0.6232128, -0.2880617, -2.203062, 0.3137255, 1, 0, 1,
-0.6114612, -1.631308, -2.136767, 0.3098039, 1, 0, 1,
-0.6108798, -1.431393, -4.203772, 0.3019608, 1, 0, 1,
-0.6099014, 1.111745, -1.388673, 0.2941177, 1, 0, 1,
-0.607886, 0.09541522, -1.716901, 0.2901961, 1, 0, 1,
-0.6073465, -1.151547, -0.8991254, 0.282353, 1, 0, 1,
-0.595674, -0.120407, -2.443766, 0.2784314, 1, 0, 1,
-0.5893746, -0.4688241, -1.017646, 0.2705882, 1, 0, 1,
-0.5844575, -0.2453914, -1.761644, 0.2666667, 1, 0, 1,
-0.5843636, -0.4622245, -3.164626, 0.2588235, 1, 0, 1,
-0.580921, 0.1148753, -0.2563065, 0.254902, 1, 0, 1,
-0.5808831, 1.406585, -0.4706476, 0.2470588, 1, 0, 1,
-0.5800354, -1.429397, -4.164094, 0.2431373, 1, 0, 1,
-0.5781058, -0.2341703, -2.860466, 0.2352941, 1, 0, 1,
-0.5740978, 1.108945, -0.8364369, 0.2313726, 1, 0, 1,
-0.5705559, -0.4677044, -2.505528, 0.2235294, 1, 0, 1,
-0.5699159, 0.5055452, 1.003344, 0.2196078, 1, 0, 1,
-0.5673183, 1.082164, 1.217054, 0.2117647, 1, 0, 1,
-0.5613056, 1.938116, 0.8218276, 0.2078431, 1, 0, 1,
-0.5587453, -0.3129741, -0.7032099, 0.2, 1, 0, 1,
-0.5545692, 0.01571437, -2.218091, 0.1921569, 1, 0, 1,
-0.5530908, -0.3247449, -1.692275, 0.1882353, 1, 0, 1,
-0.5518736, -1.167148, -1.818816, 0.1803922, 1, 0, 1,
-0.5515501, -0.9667183, -2.594314, 0.1764706, 1, 0, 1,
-0.5512379, 0.3145986, -2.558033, 0.1686275, 1, 0, 1,
-0.5501187, -0.9425319, -2.806649, 0.1647059, 1, 0, 1,
-0.5420125, 0.001465998, -0.5588806, 0.1568628, 1, 0, 1,
-0.5389927, -0.2226214, -2.679081, 0.1529412, 1, 0, 1,
-0.5313579, 1.00717, 0.2138344, 0.145098, 1, 0, 1,
-0.5306647, 0.30275, -0.1802816, 0.1411765, 1, 0, 1,
-0.5254734, -0.7012703, -3.699744, 0.1333333, 1, 0, 1,
-0.5249935, -0.9358665, -2.441346, 0.1294118, 1, 0, 1,
-0.521524, 0.8184105, 0.02434037, 0.1215686, 1, 0, 1,
-0.5176546, -1.478355, -3.753297, 0.1176471, 1, 0, 1,
-0.5113945, -0.4603149, -0.5189942, 0.1098039, 1, 0, 1,
-0.5107858, 0.2582692, -1.576862, 0.1058824, 1, 0, 1,
-0.5090489, 0.6304722, -2.057112, 0.09803922, 1, 0, 1,
-0.5067366, -0.3496778, -2.494431, 0.09019608, 1, 0, 1,
-0.5067013, 1.211501, -0.7376782, 0.08627451, 1, 0, 1,
-0.5065168, -0.8852115, -1.454485, 0.07843138, 1, 0, 1,
-0.502723, 0.6135089, -1.348668, 0.07450981, 1, 0, 1,
-0.5026934, -0.6984656, -2.436938, 0.06666667, 1, 0, 1,
-0.5001849, 0.2124364, -0.9899015, 0.0627451, 1, 0, 1,
-0.4988566, 1.139774, -0.9171579, 0.05490196, 1, 0, 1,
-0.4984322, -0.7542035, -1.524168, 0.05098039, 1, 0, 1,
-0.4951729, 0.05115176, -1.039474, 0.04313726, 1, 0, 1,
-0.4900957, 0.09080426, -2.030564, 0.03921569, 1, 0, 1,
-0.4872571, -0.5092784, -1.066957, 0.03137255, 1, 0, 1,
-0.486389, 0.1625158, -1.100793, 0.02745098, 1, 0, 1,
-0.472948, 0.4125027, -2.070117, 0.01960784, 1, 0, 1,
-0.4655908, -1.605969, -2.869372, 0.01568628, 1, 0, 1,
-0.4642219, 0.9235063, -0.1494184, 0.007843138, 1, 0, 1,
-0.4567595, -0.007445222, -0.5615919, 0.003921569, 1, 0, 1,
-0.4509389, 1.4792, -1.621755, 0, 1, 0.003921569, 1,
-0.447462, 0.4730707, -0.7761598, 0, 1, 0.01176471, 1,
-0.4282453, 1.641288, -2.301999, 0, 1, 0.01568628, 1,
-0.4236217, 1.480098, 1.821663, 0, 1, 0.02352941, 1,
-0.4224039, -1.220518, -3.423558, 0, 1, 0.02745098, 1,
-0.4195116, 0.7922775, -0.8448006, 0, 1, 0.03529412, 1,
-0.4176172, -0.1951734, -0.004460291, 0, 1, 0.03921569, 1,
-0.4172111, -1.28776, -4.252613, 0, 1, 0.04705882, 1,
-0.4136315, 1.407507, 0.9573882, 0, 1, 0.05098039, 1,
-0.4124193, -0.3983262, -3.382628, 0, 1, 0.05882353, 1,
-0.4115531, -0.4779727, -3.735414, 0, 1, 0.0627451, 1,
-0.4015249, -0.1745574, -1.548324, 0, 1, 0.07058824, 1,
-0.4009165, 0.1789625, -1.475044, 0, 1, 0.07450981, 1,
-0.398386, -0.1679474, 0.02506523, 0, 1, 0.08235294, 1,
-0.3983526, 0.3779391, -1.747654, 0, 1, 0.08627451, 1,
-0.3947934, -0.9283206, -3.345769, 0, 1, 0.09411765, 1,
-0.3904922, 0.3778447, -3.007848, 0, 1, 0.1019608, 1,
-0.3881456, 0.736576, -0.02184445, 0, 1, 0.1058824, 1,
-0.3842359, 0.9774393, -1.632011, 0, 1, 0.1137255, 1,
-0.3828908, 1.083356, -0.1003523, 0, 1, 0.1176471, 1,
-0.3767659, -0.3574373, -2.764284, 0, 1, 0.1254902, 1,
-0.375037, 1.398129, 1.079708, 0, 1, 0.1294118, 1,
-0.3717314, -0.891081, -3.106977, 0, 1, 0.1372549, 1,
-0.3699058, -0.3692663, -1.73457, 0, 1, 0.1411765, 1,
-0.3691887, 1.171382, -1.164662, 0, 1, 0.1490196, 1,
-0.3685365, -2.172454, -2.822573, 0, 1, 0.1529412, 1,
-0.3679673, -0.4675975, -2.364631, 0, 1, 0.1607843, 1,
-0.3615995, 0.622171, -0.4234017, 0, 1, 0.1647059, 1,
-0.356297, 1.514998, -1.083228, 0, 1, 0.172549, 1,
-0.3551086, 0.2538482, -0.608067, 0, 1, 0.1764706, 1,
-0.3546102, 1.345746, 1.518725, 0, 1, 0.1843137, 1,
-0.3545758, -0.8414547, -1.612382, 0, 1, 0.1882353, 1,
-0.3515294, 1.782099, 1.46894, 0, 1, 0.1960784, 1,
-0.3507237, -1.856787, -1.655356, 0, 1, 0.2039216, 1,
-0.347471, -0.5474899, -1.819575, 0, 1, 0.2078431, 1,
-0.3368041, 0.3740995, -1.98702, 0, 1, 0.2156863, 1,
-0.3352558, 2.167928, -0.6080582, 0, 1, 0.2196078, 1,
-0.3330731, 0.3505287, 0.2127848, 0, 1, 0.227451, 1,
-0.3314594, -0.121067, 0.6743045, 0, 1, 0.2313726, 1,
-0.3295796, -1.316188, -2.313635, 0, 1, 0.2392157, 1,
-0.3280942, -0.664216, -1.854429, 0, 1, 0.2431373, 1,
-0.3280347, -0.8279436, -4.534557, 0, 1, 0.2509804, 1,
-0.3260817, 0.5711977, -0.7374152, 0, 1, 0.254902, 1,
-0.3204433, 1.084495, 0.209248, 0, 1, 0.2627451, 1,
-0.3195416, -0.3950506, -0.6334538, 0, 1, 0.2666667, 1,
-0.3194031, 0.2773019, -0.6351172, 0, 1, 0.2745098, 1,
-0.3181872, 0.8813831, -0.01566707, 0, 1, 0.2784314, 1,
-0.3167469, -1.823155, -2.286702, 0, 1, 0.2862745, 1,
-0.3149189, 0.4339681, -0.4149932, 0, 1, 0.2901961, 1,
-0.3147559, 1.519722, -0.517823, 0, 1, 0.2980392, 1,
-0.3131907, -1.715601, -4.123071, 0, 1, 0.3058824, 1,
-0.3091758, -2.90171, -1.260373, 0, 1, 0.3098039, 1,
-0.3080927, -0.3936675, -2.232428, 0, 1, 0.3176471, 1,
-0.3061947, -0.6610695, -4.027462, 0, 1, 0.3215686, 1,
-0.3059807, -0.6575449, -2.55008, 0, 1, 0.3294118, 1,
-0.3030161, -0.7573265, -2.861424, 0, 1, 0.3333333, 1,
-0.3023326, -1.436992, -2.928518, 0, 1, 0.3411765, 1,
-0.2987053, -0.3507062, -3.052169, 0, 1, 0.345098, 1,
-0.2963566, 0.9184036, 0.9764748, 0, 1, 0.3529412, 1,
-0.2925103, 1.000609, -0.08300485, 0, 1, 0.3568628, 1,
-0.292463, -0.3800758, -2.166743, 0, 1, 0.3647059, 1,
-0.2909686, -0.3218491, -2.76053, 0, 1, 0.3686275, 1,
-0.2865752, -0.06356315, -0.1852331, 0, 1, 0.3764706, 1,
-0.2856392, -0.802443, -1.314583, 0, 1, 0.3803922, 1,
-0.2784266, 1.202836, -2.829707, 0, 1, 0.3882353, 1,
-0.2781217, 0.08012087, -2.517307, 0, 1, 0.3921569, 1,
-0.2777288, 0.450936, -2.056566, 0, 1, 0.4, 1,
-0.2756053, 0.4066608, -1.740024, 0, 1, 0.4078431, 1,
-0.2718026, -0.02593912, -1.48402, 0, 1, 0.4117647, 1,
-0.2701639, -0.6575011, -4.019277, 0, 1, 0.4196078, 1,
-0.2536481, -0.6374215, -2.676872, 0, 1, 0.4235294, 1,
-0.2499094, -0.1285249, -1.999172, 0, 1, 0.4313726, 1,
-0.2430857, 0.1111537, -0.6001071, 0, 1, 0.4352941, 1,
-0.2404732, -1.236498, -1.915109, 0, 1, 0.4431373, 1,
-0.2360012, -0.01484839, -3.143331, 0, 1, 0.4470588, 1,
-0.2334339, 0.2859092, -2.34893, 0, 1, 0.454902, 1,
-0.2314176, -0.9334891, -4.059171, 0, 1, 0.4588235, 1,
-0.2256128, -0.9935536, -2.231129, 0, 1, 0.4666667, 1,
-0.2215498, 0.1226581, -3.686704, 0, 1, 0.4705882, 1,
-0.2199207, -0.9918098, -1.101831, 0, 1, 0.4784314, 1,
-0.2195538, 0.242992, -1.236531, 0, 1, 0.4823529, 1,
-0.2169164, 1.923772, 1.318012, 0, 1, 0.4901961, 1,
-0.2135494, -0.3024717, -1.431568, 0, 1, 0.4941176, 1,
-0.211735, -1.08611, -3.240473, 0, 1, 0.5019608, 1,
-0.2097661, -0.2154084, -1.693102, 0, 1, 0.509804, 1,
-0.2072071, -0.2473325, -3.273864, 0, 1, 0.5137255, 1,
-0.2067335, -1.894102, -3.572203, 0, 1, 0.5215687, 1,
-0.204779, 1.460484, 0.005939264, 0, 1, 0.5254902, 1,
-0.2013908, -0.1400055, -4.262537, 0, 1, 0.5333334, 1,
-0.1990821, 1.539687, 0.02099653, 0, 1, 0.5372549, 1,
-0.1953774, -0.8348933, -3.159496, 0, 1, 0.5450981, 1,
-0.1936602, 0.5285487, 0.02106071, 0, 1, 0.5490196, 1,
-0.1925484, 0.2176762, -1.848281, 0, 1, 0.5568628, 1,
-0.1916602, 2.058058, 1.119374, 0, 1, 0.5607843, 1,
-0.1892946, 0.7995871, -0.9220963, 0, 1, 0.5686275, 1,
-0.1858252, 0.3491833, 0.4045673, 0, 1, 0.572549, 1,
-0.1847138, -1.92763, -3.721758, 0, 1, 0.5803922, 1,
-0.1825811, -0.9172513, -3.611088, 0, 1, 0.5843138, 1,
-0.1792563, -0.5719059, -4.291053, 0, 1, 0.5921569, 1,
-0.1792461, 0.1274698, -1.141773, 0, 1, 0.5960785, 1,
-0.1783997, -0.5143966, -3.927758, 0, 1, 0.6039216, 1,
-0.1686428, -0.2278908, -2.437848, 0, 1, 0.6117647, 1,
-0.167595, 0.057039, -1.226029, 0, 1, 0.6156863, 1,
-0.1628716, 0.7217506, -0.7191053, 0, 1, 0.6235294, 1,
-0.1586057, 0.46421, -0.3405738, 0, 1, 0.627451, 1,
-0.1576837, 1.444973, 0.4648311, 0, 1, 0.6352941, 1,
-0.1553534, -0.2773623, -2.65748, 0, 1, 0.6392157, 1,
-0.1368067, 0.7772766, -0.8645613, 0, 1, 0.6470588, 1,
-0.1363461, -1.122176, -3.629189, 0, 1, 0.6509804, 1,
-0.1254447, -0.20995, -2.393175, 0, 1, 0.6588235, 1,
-0.1254098, 0.1786908, -0.2973826, 0, 1, 0.6627451, 1,
-0.1249607, 0.829223, -0.1638237, 0, 1, 0.6705883, 1,
-0.1234596, -0.5889085, -3.083575, 0, 1, 0.6745098, 1,
-0.1218368, -1.318091, -3.803153, 0, 1, 0.682353, 1,
-0.1217631, 0.8183473, -0.6741222, 0, 1, 0.6862745, 1,
-0.1207292, -0.1613553, -3.230092, 0, 1, 0.6941177, 1,
-0.1190593, 0.7946854, 0.5972263, 0, 1, 0.7019608, 1,
-0.1156018, 0.6655405, 0.01680464, 0, 1, 0.7058824, 1,
-0.1142265, -0.8135132, -5.028365, 0, 1, 0.7137255, 1,
-0.1096513, 0.4996992, -0.9946249, 0, 1, 0.7176471, 1,
-0.10679, -0.3580373, -2.374243, 0, 1, 0.7254902, 1,
-0.1044198, 0.9914235, -0.7954804, 0, 1, 0.7294118, 1,
-0.1042394, -0.2202787, -2.791593, 0, 1, 0.7372549, 1,
-0.1020745, 1.699098, -1.892078, 0, 1, 0.7411765, 1,
-0.09983694, 0.180963, -0.2541213, 0, 1, 0.7490196, 1,
-0.09901096, -1.026577, -3.558052, 0, 1, 0.7529412, 1,
-0.09099177, 0.9053875, -0.7190027, 0, 1, 0.7607843, 1,
-0.09050994, -0.1319357, -2.69988, 0, 1, 0.7647059, 1,
-0.08773592, -0.71465, -3.129872, 0, 1, 0.772549, 1,
-0.08636118, 0.125642, -0.4925972, 0, 1, 0.7764706, 1,
-0.08621998, -0.5067927, -1.552166, 0, 1, 0.7843137, 1,
-0.08538493, 0.5288463, -0.6201341, 0, 1, 0.7882353, 1,
-0.08413959, 0.76189, 0.9720087, 0, 1, 0.7960784, 1,
-0.08247436, 0.2570371, 0.04015139, 0, 1, 0.8039216, 1,
-0.0803116, 0.04808523, 1.428023, 0, 1, 0.8078431, 1,
-0.07984546, 0.2615104, -1.550167, 0, 1, 0.8156863, 1,
-0.07944805, 0.593785, 0.4220301, 0, 1, 0.8196079, 1,
-0.07605568, 0.254923, 0.1912652, 0, 1, 0.827451, 1,
-0.07282376, 0.8809481, -0.5790132, 0, 1, 0.8313726, 1,
-0.07167123, -0.5492175, -3.420022, 0, 1, 0.8392157, 1,
-0.06986266, 0.1338625, 1.60466, 0, 1, 0.8431373, 1,
-0.06781095, 1.97822, -1.110643, 0, 1, 0.8509804, 1,
-0.0630729, -1.904362, -3.324513, 0, 1, 0.854902, 1,
-0.05851468, -0.9254897, -1.488062, 0, 1, 0.8627451, 1,
-0.05108569, -1.59725, -3.487165, 0, 1, 0.8666667, 1,
-0.04839687, 0.1258859, 1.998789, 0, 1, 0.8745098, 1,
-0.04393831, -1.00454, -3.7426, 0, 1, 0.8784314, 1,
-0.04315214, 0.6587944, 1.444754, 0, 1, 0.8862745, 1,
-0.03992272, -1.402053, -3.766147, 0, 1, 0.8901961, 1,
-0.03967583, 0.6138423, 0.5027764, 0, 1, 0.8980392, 1,
-0.03938867, -0.3238229, -3.829694, 0, 1, 0.9058824, 1,
-0.0347276, -0.1673277, -3.12689, 0, 1, 0.9098039, 1,
-0.03171448, -2.347382, -4.028956, 0, 1, 0.9176471, 1,
-0.03142089, 1.570037, -2.64754, 0, 1, 0.9215686, 1,
-0.02951229, 0.661957, -0.4234552, 0, 1, 0.9294118, 1,
-0.02721734, -1.115844, -3.583631, 0, 1, 0.9333333, 1,
-0.0270754, 1.588428, 1.143245, 0, 1, 0.9411765, 1,
-0.02612089, 2.269753, -1.235391, 0, 1, 0.945098, 1,
-0.02271669, -1.601409, -1.965634, 0, 1, 0.9529412, 1,
-0.0211942, 0.1589519, 0.1074409, 0, 1, 0.9568627, 1,
-0.02114372, 0.4020044, -0.7367211, 0, 1, 0.9647059, 1,
-0.01780688, -1.637598, -3.2808, 0, 1, 0.9686275, 1,
-0.00534695, -0.786158, -2.603254, 0, 1, 0.9764706, 1,
-0.005114677, 1.846645, -0.8119118, 0, 1, 0.9803922, 1,
-0.003456904, 2.133559, -0.8876516, 0, 1, 0.9882353, 1,
0.003507322, 0.2451444, -0.1045807, 0, 1, 0.9921569, 1,
0.004185992, -1.458284, 3.870301, 0, 1, 1, 1,
0.005766344, -0.1687384, 3.016659, 0, 0.9921569, 1, 1,
0.01413903, -0.1620211, 4.015645, 0, 0.9882353, 1, 1,
0.01546479, 0.9155113, -0.2003383, 0, 0.9803922, 1, 1,
0.01595258, 0.9733512, -0.2040937, 0, 0.9764706, 1, 1,
0.02083351, -0.4909204, 2.434976, 0, 0.9686275, 1, 1,
0.02386409, 0.4036716, 1.231216, 0, 0.9647059, 1, 1,
0.02415875, 1.032995, -0.05543404, 0, 0.9568627, 1, 1,
0.02439131, -1.929461, 1.746189, 0, 0.9529412, 1, 1,
0.02641671, 1.695435, -2.006305, 0, 0.945098, 1, 1,
0.03004784, 0.1502074, 0.9770387, 0, 0.9411765, 1, 1,
0.0322265, 0.1903545, 0.3138397, 0, 0.9333333, 1, 1,
0.03232467, -1.648542, 2.196928, 0, 0.9294118, 1, 1,
0.03522663, -0.2641962, 4.943594, 0, 0.9215686, 1, 1,
0.04216905, -0.9148177, 2.75174, 0, 0.9176471, 1, 1,
0.04248036, -1.150203, 2.443711, 0, 0.9098039, 1, 1,
0.0446496, -1.047897, 3.946685, 0, 0.9058824, 1, 1,
0.04786206, -0.03187888, 1.417697, 0, 0.8980392, 1, 1,
0.0485652, 0.3004058, -0.3206557, 0, 0.8901961, 1, 1,
0.04858728, 1.172804, -0.5056044, 0, 0.8862745, 1, 1,
0.05286115, -0.2719086, 2.05617, 0, 0.8784314, 1, 1,
0.05744367, -0.5542629, 3.592896, 0, 0.8745098, 1, 1,
0.05863715, 0.46544, -0.1694008, 0, 0.8666667, 1, 1,
0.06755877, 0.1697589, -1.606681, 0, 0.8627451, 1, 1,
0.07082718, 1.757353, -1.087984, 0, 0.854902, 1, 1,
0.07238781, -0.1321794, 3.697817, 0, 0.8509804, 1, 1,
0.07533011, -0.5660272, 3.445812, 0, 0.8431373, 1, 1,
0.07637089, -1.911145, 3.541512, 0, 0.8392157, 1, 1,
0.07647011, 0.04599449, -0.6602952, 0, 0.8313726, 1, 1,
0.07879971, -0.6644157, 2.251499, 0, 0.827451, 1, 1,
0.08139257, 1.208613, 0.5704756, 0, 0.8196079, 1, 1,
0.08243811, -0.8719357, 2.965842, 0, 0.8156863, 1, 1,
0.08685748, -0.1932987, 4.487086, 0, 0.8078431, 1, 1,
0.08993446, -0.8969474, 3.697218, 0, 0.8039216, 1, 1,
0.09064653, -0.1533512, 2.303073, 0, 0.7960784, 1, 1,
0.09388474, -0.874106, 1.962337, 0, 0.7882353, 1, 1,
0.09572619, -0.3708622, 3.318611, 0, 0.7843137, 1, 1,
0.09686365, -1.318853, 3.323402, 0, 0.7764706, 1, 1,
0.1020695, -0.9910274, 1.869713, 0, 0.772549, 1, 1,
0.1042577, -0.7290515, 1.089758, 0, 0.7647059, 1, 1,
0.1046872, -0.1874503, 4.199761, 0, 0.7607843, 1, 1,
0.1057468, 0.3978964, -0.6636329, 0, 0.7529412, 1, 1,
0.1062363, -0.9514925, 6.037749, 0, 0.7490196, 1, 1,
0.10922, 1.650562, 1.497548, 0, 0.7411765, 1, 1,
0.1140108, -0.667899, 4.757618, 0, 0.7372549, 1, 1,
0.1175122, -0.8416542, 1.921203, 0, 0.7294118, 1, 1,
0.1203189, -1.0131, 4.71261, 0, 0.7254902, 1, 1,
0.1227931, -0.203759, 3.373979, 0, 0.7176471, 1, 1,
0.1268117, 0.2806053, -2.992003, 0, 0.7137255, 1, 1,
0.1270332, -0.5575204, 2.464877, 0, 0.7058824, 1, 1,
0.127447, -0.0191975, 2.197611, 0, 0.6980392, 1, 1,
0.1286818, 0.03451211, 1.342835, 0, 0.6941177, 1, 1,
0.1299244, 0.2756736, 0.6204776, 0, 0.6862745, 1, 1,
0.1333231, 0.1422009, 0.3225093, 0, 0.682353, 1, 1,
0.1345009, 1.240736, 0.1487351, 0, 0.6745098, 1, 1,
0.1349161, 0.07047033, 1.238191, 0, 0.6705883, 1, 1,
0.1383811, -0.5054494, 3.750637, 0, 0.6627451, 1, 1,
0.138642, -1.186746, 2.918976, 0, 0.6588235, 1, 1,
0.1520066, -0.9625769, 2.02396, 0, 0.6509804, 1, 1,
0.1534257, -0.06088251, 2.249846, 0, 0.6470588, 1, 1,
0.1551972, 2.065801, -1.479953, 0, 0.6392157, 1, 1,
0.1557401, -0.4522744, 3.7515, 0, 0.6352941, 1, 1,
0.1560234, -0.1550314, 1.995702, 0, 0.627451, 1, 1,
0.1572542, -0.7759889, 0.8595189, 0, 0.6235294, 1, 1,
0.1575768, 0.5467576, 0.1037155, 0, 0.6156863, 1, 1,
0.160629, 0.4318864, -0.5674831, 0, 0.6117647, 1, 1,
0.1621544, 1.268438, 0.4802607, 0, 0.6039216, 1, 1,
0.1654584, -2.211151, 3.205811, 0, 0.5960785, 1, 1,
0.1654616, 0.832622, 1.278668, 0, 0.5921569, 1, 1,
0.1655188, -0.7957871, 1.762874, 0, 0.5843138, 1, 1,
0.1700628, 0.4360395, 0.7296878, 0, 0.5803922, 1, 1,
0.1711961, -1.796678, 3.481723, 0, 0.572549, 1, 1,
0.175274, -1.007646, 2.657075, 0, 0.5686275, 1, 1,
0.1764064, 0.0779119, 2.357409, 0, 0.5607843, 1, 1,
0.1793313, 0.1963632, 2.19664, 0, 0.5568628, 1, 1,
0.1815602, -1.509206, 1.556557, 0, 0.5490196, 1, 1,
0.1824514, -0.1421619, 1.827017, 0, 0.5450981, 1, 1,
0.1850986, 1.19664, 0.1796706, 0, 0.5372549, 1, 1,
0.1859367, 1.256724, -1.279548, 0, 0.5333334, 1, 1,
0.1943006, 0.9180315, 2.078077, 0, 0.5254902, 1, 1,
0.1956428, 0.3350832, 1.422346, 0, 0.5215687, 1, 1,
0.1961968, 1.587869, 0.2481055, 0, 0.5137255, 1, 1,
0.2035507, -1.541011, 2.679257, 0, 0.509804, 1, 1,
0.2114706, -1.121599, 2.677654, 0, 0.5019608, 1, 1,
0.2140192, 1.538887, 0.9169186, 0, 0.4941176, 1, 1,
0.2146307, -0.8760535, 1.598374, 0, 0.4901961, 1, 1,
0.214957, -0.8351297, 4.394393, 0, 0.4823529, 1, 1,
0.2157473, -2.576747, 2.562796, 0, 0.4784314, 1, 1,
0.2185688, -0.1385821, 3.79823, 0, 0.4705882, 1, 1,
0.218956, -0.4067864, 2.371227, 0, 0.4666667, 1, 1,
0.2194998, 0.220438, -0.3026711, 0, 0.4588235, 1, 1,
0.220324, 0.8742395, 1.906775, 0, 0.454902, 1, 1,
0.2257378, -0.3723257, 2.231362, 0, 0.4470588, 1, 1,
0.2282574, -0.313737, 2.534548, 0, 0.4431373, 1, 1,
0.2304033, -2.555354, 4.29019, 0, 0.4352941, 1, 1,
0.2379562, -0.1509015, 1.749669, 0, 0.4313726, 1, 1,
0.2391573, -1.877926, 3.117614, 0, 0.4235294, 1, 1,
0.2395987, 0.9425833, -0.3591163, 0, 0.4196078, 1, 1,
0.2458655, 1.263995, -0.5486194, 0, 0.4117647, 1, 1,
0.2530307, 1.317329, -1.108171, 0, 0.4078431, 1, 1,
0.2545174, -0.194062, 0.8803955, 0, 0.4, 1, 1,
0.2558628, 1.605133, -1.045987, 0, 0.3921569, 1, 1,
0.256238, 0.7003787, -0.701787, 0, 0.3882353, 1, 1,
0.2637355, -1.75019, 2.935386, 0, 0.3803922, 1, 1,
0.2644118, 1.128781, -0.5699835, 0, 0.3764706, 1, 1,
0.2667637, -1.518323, 4.304246, 0, 0.3686275, 1, 1,
0.2693092, -0.1982896, 2.209724, 0, 0.3647059, 1, 1,
0.2726922, 0.6183298, -1.073495, 0, 0.3568628, 1, 1,
0.2765017, 1.29611, -0.8572856, 0, 0.3529412, 1, 1,
0.2784673, -0.5745721, 1.132967, 0, 0.345098, 1, 1,
0.2816304, 0.1172796, 1.981128, 0, 0.3411765, 1, 1,
0.2820626, 0.5276961, 2.849622, 0, 0.3333333, 1, 1,
0.2833278, 0.7142837, 0.7517617, 0, 0.3294118, 1, 1,
0.2860331, -0.5709074, 1.026646, 0, 0.3215686, 1, 1,
0.2969515, -1.166468, 2.215697, 0, 0.3176471, 1, 1,
0.2970649, -1.101244, 3.882043, 0, 0.3098039, 1, 1,
0.2978306, 0.495318, 0.2369294, 0, 0.3058824, 1, 1,
0.2999462, -0.2668622, 1.893015, 0, 0.2980392, 1, 1,
0.3024477, -0.2829559, 3.678406, 0, 0.2901961, 1, 1,
0.3045547, -0.06153317, 3.184133, 0, 0.2862745, 1, 1,
0.3048584, -0.8399954, 1.282162, 0, 0.2784314, 1, 1,
0.306221, 0.9545578, 1.763027, 0, 0.2745098, 1, 1,
0.3065647, 1.261209, 1.885003, 0, 0.2666667, 1, 1,
0.3079452, -0.599731, 1.637589, 0, 0.2627451, 1, 1,
0.3122514, -1.144155, 1.879639, 0, 0.254902, 1, 1,
0.3179977, 1.519191, -0.1544232, 0, 0.2509804, 1, 1,
0.3188514, -0.6582486, 3.071004, 0, 0.2431373, 1, 1,
0.3214715, 0.6408195, 0.1097495, 0, 0.2392157, 1, 1,
0.3215382, -1.112971, 1.806739, 0, 0.2313726, 1, 1,
0.3221854, -1.543461, 1.39117, 0, 0.227451, 1, 1,
0.3252553, 0.2133203, -0.2077239, 0, 0.2196078, 1, 1,
0.3263654, 0.004520528, 2.450624, 0, 0.2156863, 1, 1,
0.3295807, -0.2475583, 1.806714, 0, 0.2078431, 1, 1,
0.3372526, 0.9202066, 0.6259117, 0, 0.2039216, 1, 1,
0.3409795, -0.8047253, 0.7606759, 0, 0.1960784, 1, 1,
0.3414852, 0.2456766, -1.021538, 0, 0.1882353, 1, 1,
0.34214, -1.790493, 4.012778, 0, 0.1843137, 1, 1,
0.3439957, -0.5703614, 2.756349, 0, 0.1764706, 1, 1,
0.3447519, 0.1597189, 0.2547755, 0, 0.172549, 1, 1,
0.3458319, 0.06763646, 1.897879, 0, 0.1647059, 1, 1,
0.3508859, 0.4913399, 2.588668, 0, 0.1607843, 1, 1,
0.3517461, -0.8929765, 2.388223, 0, 0.1529412, 1, 1,
0.3533876, 0.3475544, -0.5775746, 0, 0.1490196, 1, 1,
0.3534478, 1.360081, 1.676166, 0, 0.1411765, 1, 1,
0.3542411, -0.5328295, 1.800521, 0, 0.1372549, 1, 1,
0.358128, 1.616916, -0.7229428, 0, 0.1294118, 1, 1,
0.3583903, 0.07092029, 0.08705316, 0, 0.1254902, 1, 1,
0.3638391, -1.964741, 4.409355, 0, 0.1176471, 1, 1,
0.3712436, 1.724631, 1.265809, 0, 0.1137255, 1, 1,
0.3743736, 0.8063575, 2.334392, 0, 0.1058824, 1, 1,
0.3781587, -0.1925911, 2.234096, 0, 0.09803922, 1, 1,
0.3824735, -1.131907, 1.915484, 0, 0.09411765, 1, 1,
0.3826574, -0.1563441, 2.643616, 0, 0.08627451, 1, 1,
0.3838429, -1.361743, 5.028059, 0, 0.08235294, 1, 1,
0.3926177, -0.3558906, 1.796532, 0, 0.07450981, 1, 1,
0.3932309, 2.344563, -0.01747118, 0, 0.07058824, 1, 1,
0.3946704, -1.517238, 3.458553, 0, 0.0627451, 1, 1,
0.3983724, -0.429231, 2.687581, 0, 0.05882353, 1, 1,
0.3990458, 1.351032, 1.823165, 0, 0.05098039, 1, 1,
0.40629, 0.8278359, -0.5995969, 0, 0.04705882, 1, 1,
0.4152764, -0.4201691, 3.021662, 0, 0.03921569, 1, 1,
0.4174224, -0.1456473, 1.311796, 0, 0.03529412, 1, 1,
0.4198308, 0.005328336, 1.219123, 0, 0.02745098, 1, 1,
0.4217642, -0.628196, 4.539763, 0, 0.02352941, 1, 1,
0.423251, -0.2395165, 2.525668, 0, 0.01568628, 1, 1,
0.4252746, -0.665063, 4.028111, 0, 0.01176471, 1, 1,
0.4274382, -0.1024132, 1.024423, 0, 0.003921569, 1, 1,
0.4343378, -0.2340769, 3.379858, 0.003921569, 0, 1, 1,
0.4365321, -1.408076, 4.494275, 0.007843138, 0, 1, 1,
0.4447991, -0.8685366, 4.657953, 0.01568628, 0, 1, 1,
0.4453863, -1.281431, 3.813927, 0.01960784, 0, 1, 1,
0.445677, 1.008147, 0.1603113, 0.02745098, 0, 1, 1,
0.4470232, -1.151292, 1.539833, 0.03137255, 0, 1, 1,
0.4480069, 0.8343607, 0.9602543, 0.03921569, 0, 1, 1,
0.451034, 0.2659535, 2.201138, 0.04313726, 0, 1, 1,
0.4534386, -0.3811325, 2.638559, 0.05098039, 0, 1, 1,
0.4618571, -0.4812031, 3.855256, 0.05490196, 0, 1, 1,
0.4632948, -0.08297817, 0.5448439, 0.0627451, 0, 1, 1,
0.4668117, 0.2992119, 0.7705772, 0.06666667, 0, 1, 1,
0.4679702, 0.4253733, 1.44673, 0.07450981, 0, 1, 1,
0.4686233, -0.6753175, 3.747333, 0.07843138, 0, 1, 1,
0.4702462, 0.2307313, 2.798745, 0.08627451, 0, 1, 1,
0.4706671, -0.1238142, 1.10079, 0.09019608, 0, 1, 1,
0.4712825, -2.068419, 1.498147, 0.09803922, 0, 1, 1,
0.4722181, 1.266668, 1.118852, 0.1058824, 0, 1, 1,
0.4722229, 1.046043, 0.5119243, 0.1098039, 0, 1, 1,
0.4733797, 0.873868, 1.006178, 0.1176471, 0, 1, 1,
0.4753961, -0.1789182, 2.786416, 0.1215686, 0, 1, 1,
0.4762405, -0.419666, 1.447796, 0.1294118, 0, 1, 1,
0.4814308, 0.2580329, 1.351654, 0.1333333, 0, 1, 1,
0.4830427, 0.5545152, 0.4118816, 0.1411765, 0, 1, 1,
0.4881224, -0.5312474, 2.478049, 0.145098, 0, 1, 1,
0.494895, 0.6784919, 1.076165, 0.1529412, 0, 1, 1,
0.4956452, 0.3736963, 0.691737, 0.1568628, 0, 1, 1,
0.4979787, 2.676394, 0.197611, 0.1647059, 0, 1, 1,
0.499789, 1.691626, 0.2197101, 0.1686275, 0, 1, 1,
0.5071455, -1.744263, 2.048778, 0.1764706, 0, 1, 1,
0.5091109, 0.2589109, 0.1294556, 0.1803922, 0, 1, 1,
0.5139604, -0.3140265, 1.997973, 0.1882353, 0, 1, 1,
0.514256, -0.3739116, 3.634374, 0.1921569, 0, 1, 1,
0.5196158, 0.7751956, 0.9146267, 0.2, 0, 1, 1,
0.5196738, -0.3212759, 3.3874, 0.2078431, 0, 1, 1,
0.5200412, 0.548012, 1.171725, 0.2117647, 0, 1, 1,
0.5202217, -0.2681315, 2.579991, 0.2196078, 0, 1, 1,
0.5246748, -1.324909, 2.196933, 0.2235294, 0, 1, 1,
0.5327098, -0.1241918, 1.726544, 0.2313726, 0, 1, 1,
0.5350467, 0.5268645, -0.4113276, 0.2352941, 0, 1, 1,
0.5413356, 0.3143194, -0.426274, 0.2431373, 0, 1, 1,
0.5438451, -0.3478523, 1.178108, 0.2470588, 0, 1, 1,
0.5446976, 0.7571168, -0.2482709, 0.254902, 0, 1, 1,
0.5472623, -0.9852464, 2.168756, 0.2588235, 0, 1, 1,
0.547863, 0.4950041, 0.6717886, 0.2666667, 0, 1, 1,
0.5480312, 0.5296044, 0.1924852, 0.2705882, 0, 1, 1,
0.5489876, -0.08569353, 1.5389, 0.2784314, 0, 1, 1,
0.5511141, 0.8779207, 0.5923016, 0.282353, 0, 1, 1,
0.5514421, -0.7522577, 2.970249, 0.2901961, 0, 1, 1,
0.5534726, -0.6397322, 3.291315, 0.2941177, 0, 1, 1,
0.5707315, -0.4920733, 2.135629, 0.3019608, 0, 1, 1,
0.5709287, 0.2112202, 1.964576, 0.3098039, 0, 1, 1,
0.5709445, 0.3165393, -1.271585, 0.3137255, 0, 1, 1,
0.5722347, 0.9830521, 0.5606283, 0.3215686, 0, 1, 1,
0.5742587, -0.4117523, 3.44434, 0.3254902, 0, 1, 1,
0.5760642, -1.051523, 2.401567, 0.3333333, 0, 1, 1,
0.5842569, 0.5479944, 0.4043344, 0.3372549, 0, 1, 1,
0.5934187, -0.5298119, 2.930142, 0.345098, 0, 1, 1,
0.5979585, 0.0351146, 1.293158, 0.3490196, 0, 1, 1,
0.6028084, -0.1065832, 1.978761, 0.3568628, 0, 1, 1,
0.6035439, -1.001312, 0.844473, 0.3607843, 0, 1, 1,
0.6126021, 2.430976, 0.7017548, 0.3686275, 0, 1, 1,
0.6129358, -1.132192, 2.566356, 0.372549, 0, 1, 1,
0.6148175, -0.2829602, 1.221186, 0.3803922, 0, 1, 1,
0.6158385, 0.8787692, 0.8106699, 0.3843137, 0, 1, 1,
0.6199954, 1.443055, 0.1361279, 0.3921569, 0, 1, 1,
0.6209967, -0.2868563, 0.9992294, 0.3960784, 0, 1, 1,
0.6227804, -1.558584, 3.255271, 0.4039216, 0, 1, 1,
0.6287869, 0.2948346, 0.9988518, 0.4117647, 0, 1, 1,
0.633552, -0.7538593, 1.83034, 0.4156863, 0, 1, 1,
0.6379201, -0.9185826, 3.174939, 0.4235294, 0, 1, 1,
0.6402078, 0.9925463, 0.2487489, 0.427451, 0, 1, 1,
0.6510355, -2.165817, 3.094971, 0.4352941, 0, 1, 1,
0.6524168, 1.389415, 1.089259, 0.4392157, 0, 1, 1,
0.6578671, -0.5122225, 2.231929, 0.4470588, 0, 1, 1,
0.6589202, 0.5513443, 2.046911, 0.4509804, 0, 1, 1,
0.659395, -0.4001813, 3.096015, 0.4588235, 0, 1, 1,
0.6678259, -0.4390661, 2.677451, 0.4627451, 0, 1, 1,
0.6711297, 0.3943864, 1.854777, 0.4705882, 0, 1, 1,
0.6725225, -0.1047902, 0.9042991, 0.4745098, 0, 1, 1,
0.6757849, -1.536889, 2.538245, 0.4823529, 0, 1, 1,
0.6761012, -0.3644514, 1.113299, 0.4862745, 0, 1, 1,
0.6840836, 0.1071909, 0.4657297, 0.4941176, 0, 1, 1,
0.692964, -0.5107213, 3.328362, 0.5019608, 0, 1, 1,
0.695049, 0.7326542, 0.05523758, 0.5058824, 0, 1, 1,
0.6956486, 0.7120127, 1.212758, 0.5137255, 0, 1, 1,
0.6985078, 0.6055652, 2.81063, 0.5176471, 0, 1, 1,
0.7067635, 1.883844, -0.4809504, 0.5254902, 0, 1, 1,
0.7073314, -0.4476386, 2.520929, 0.5294118, 0, 1, 1,
0.7082555, 1.143066, -1.034215, 0.5372549, 0, 1, 1,
0.7085238, -0.5701161, 0.8495433, 0.5411765, 0, 1, 1,
0.7129953, 0.2463051, 0.0428995, 0.5490196, 0, 1, 1,
0.7154308, 0.7170944, 1.834351, 0.5529412, 0, 1, 1,
0.7223115, 0.5680786, 0.5835441, 0.5607843, 0, 1, 1,
0.7243257, 1.252785, 0.2357531, 0.5647059, 0, 1, 1,
0.7369384, 0.5963802, 1.061219, 0.572549, 0, 1, 1,
0.7374129, 0.1093707, 1.365591, 0.5764706, 0, 1, 1,
0.7378084, 0.771314, 1.058932, 0.5843138, 0, 1, 1,
0.7380295, -1.25941, 2.172824, 0.5882353, 0, 1, 1,
0.7395166, 0.3306091, 0.1012034, 0.5960785, 0, 1, 1,
0.740519, 0.107256, 1.216494, 0.6039216, 0, 1, 1,
0.742415, -0.2678853, 1.060251, 0.6078432, 0, 1, 1,
0.7464662, -0.7014039, 2.227085, 0.6156863, 0, 1, 1,
0.7552223, 0.6167687, 0.4649553, 0.6196079, 0, 1, 1,
0.7600582, -1.039673, 1.913817, 0.627451, 0, 1, 1,
0.7617491, -0.09041607, 2.028507, 0.6313726, 0, 1, 1,
0.7630892, 2.439866, -0.7085975, 0.6392157, 0, 1, 1,
0.7631044, 0.07647715, 2.250221, 0.6431373, 0, 1, 1,
0.765429, 0.4352684, 2.212402, 0.6509804, 0, 1, 1,
0.7738895, 0.9190639, 1.984946, 0.654902, 0, 1, 1,
0.775198, -0.01819153, 1.431288, 0.6627451, 0, 1, 1,
0.7753648, 1.010448, 0.6180145, 0.6666667, 0, 1, 1,
0.7776618, -1.045733, 3.734414, 0.6745098, 0, 1, 1,
0.7794033, 0.1800878, 1.838449, 0.6784314, 0, 1, 1,
0.7809094, -1.582428, 3.233261, 0.6862745, 0, 1, 1,
0.7811331, 1.058786, 0.3862537, 0.6901961, 0, 1, 1,
0.7869771, -0.6388658, 2.841055, 0.6980392, 0, 1, 1,
0.7888425, 1.811205, 0.3284909, 0.7058824, 0, 1, 1,
0.7930614, -0.4724478, 3.033232, 0.7098039, 0, 1, 1,
0.7938022, -0.6146857, 1.521949, 0.7176471, 0, 1, 1,
0.7953524, -0.301025, 2.496748, 0.7215686, 0, 1, 1,
0.7991541, 0.8604116, 1.9744, 0.7294118, 0, 1, 1,
0.7998332, 0.8412488, -0.2978439, 0.7333333, 0, 1, 1,
0.8082191, -0.5507224, 2.252086, 0.7411765, 0, 1, 1,
0.8083366, 0.5209203, 0.743783, 0.7450981, 0, 1, 1,
0.8103772, -0.7712153, 2.985724, 0.7529412, 0, 1, 1,
0.81583, 0.3938233, 0.858602, 0.7568628, 0, 1, 1,
0.819803, 0.3898295, 1.453612, 0.7647059, 0, 1, 1,
0.8325239, 0.8769298, 0.4642027, 0.7686275, 0, 1, 1,
0.8335182, -0.9523476, 3.523088, 0.7764706, 0, 1, 1,
0.8353446, -0.1444109, 3.259412, 0.7803922, 0, 1, 1,
0.8413742, -1.439185, 2.170589, 0.7882353, 0, 1, 1,
0.8422345, 0.5992674, -0.9472826, 0.7921569, 0, 1, 1,
0.8428357, -0.1544588, 1.557758, 0.8, 0, 1, 1,
0.8438305, 0.2667281, 0.7310662, 0.8078431, 0, 1, 1,
0.8458328, -0.9312002, 2.231774, 0.8117647, 0, 1, 1,
0.8479527, 0.9910895, 0.02066227, 0.8196079, 0, 1, 1,
0.8483964, -0.8799381, 2.483207, 0.8235294, 0, 1, 1,
0.8498209, 0.3262331, 1.835044, 0.8313726, 0, 1, 1,
0.8504973, -0.2462606, 0.6955275, 0.8352941, 0, 1, 1,
0.8558407, 1.78839, -0.1672223, 0.8431373, 0, 1, 1,
0.8563043, 1.151344, 2.083681, 0.8470588, 0, 1, 1,
0.8654402, 1.026529, 0.2185257, 0.854902, 0, 1, 1,
0.8674568, 0.559306, 3.352295, 0.8588235, 0, 1, 1,
0.8876678, -0.6683279, 2.321852, 0.8666667, 0, 1, 1,
0.8901141, 0.3166934, 2.172518, 0.8705882, 0, 1, 1,
0.8904678, -1.400113, 1.501, 0.8784314, 0, 1, 1,
0.9004522, -1.271697, 2.824615, 0.8823529, 0, 1, 1,
0.9037382, 2.865342, -0.09660089, 0.8901961, 0, 1, 1,
0.9039576, -0.3781103, 2.697357, 0.8941177, 0, 1, 1,
0.905757, -0.9134119, 1.007899, 0.9019608, 0, 1, 1,
0.9138042, -0.2367426, 0.7278297, 0.9098039, 0, 1, 1,
0.9284697, -0.9695243, 2.209499, 0.9137255, 0, 1, 1,
0.9293662, 0.7112553, 0.4551218, 0.9215686, 0, 1, 1,
0.9353154, -0.1900804, 1.849169, 0.9254902, 0, 1, 1,
0.9358843, 0.5692387, 0.104522, 0.9333333, 0, 1, 1,
0.9371428, 0.3871217, 2.476912, 0.9372549, 0, 1, 1,
0.9379044, 0.4025353, 1.739907, 0.945098, 0, 1, 1,
0.9532145, -0.7096255, 0.6745341, 0.9490196, 0, 1, 1,
0.9536288, 0.03567573, 1.553165, 0.9568627, 0, 1, 1,
0.9555253, -0.05728928, 0.963625, 0.9607843, 0, 1, 1,
0.9565187, -0.8107917, 2.933715, 0.9686275, 0, 1, 1,
0.9581632, 0.6343967, 0.9967124, 0.972549, 0, 1, 1,
0.9677101, 0.8000519, 1.560352, 0.9803922, 0, 1, 1,
0.9697004, 0.06570577, 2.114192, 0.9843137, 0, 1, 1,
0.9733955, 0.7170409, 1.487556, 0.9921569, 0, 1, 1,
0.9765993, -1.214565, 1.951171, 0.9960784, 0, 1, 1,
0.9837629, 0.6158245, 1.629629, 1, 0, 0.9960784, 1,
0.9875702, 0.6563457, -0.9054523, 1, 0, 0.9882353, 1,
0.9876654, -0.4868739, 1.409246, 1, 0, 0.9843137, 1,
0.9880283, 0.6679554, -0.1702133, 1, 0, 0.9764706, 1,
0.990321, -1.822348, 2.850878, 1, 0, 0.972549, 1,
0.9948316, -1.876448, 2.921566, 1, 0, 0.9647059, 1,
0.9968433, -0.6441441, 2.453503, 1, 0, 0.9607843, 1,
1.006896, -0.3193402, 2.417988, 1, 0, 0.9529412, 1,
1.009569, 0.8512045, 0.7365937, 1, 0, 0.9490196, 1,
1.032898, 1.003246, 0.1869961, 1, 0, 0.9411765, 1,
1.03317, -0.9675645, 1.491034, 1, 0, 0.9372549, 1,
1.034455, 0.1759071, 2.421201, 1, 0, 0.9294118, 1,
1.034618, 0.2754292, 0.3181733, 1, 0, 0.9254902, 1,
1.036053, 0.2301332, 2.251872, 1, 0, 0.9176471, 1,
1.037833, 0.01813497, -0.4196821, 1, 0, 0.9137255, 1,
1.041557, -1.666725, 1.502976, 1, 0, 0.9058824, 1,
1.048547, -0.7086406, 2.554411, 1, 0, 0.9019608, 1,
1.049368, -0.3451972, 0.439003, 1, 0, 0.8941177, 1,
1.050745, 0.8537866, 0.4432777, 1, 0, 0.8862745, 1,
1.057474, -0.979457, 1.569109, 1, 0, 0.8823529, 1,
1.058511, -0.6286877, 3.813992, 1, 0, 0.8745098, 1,
1.061369, -0.5996994, 2.002059, 1, 0, 0.8705882, 1,
1.066349, 0.9875891, -0.7711729, 1, 0, 0.8627451, 1,
1.075162, 1.285169, 0.6893895, 1, 0, 0.8588235, 1,
1.079702, 0.7157248, 2.376593, 1, 0, 0.8509804, 1,
1.079803, 1.282583, 2.025713, 1, 0, 0.8470588, 1,
1.081708, -1.549311, 1.386462, 1, 0, 0.8392157, 1,
1.08527, 1.061921, 0.4866534, 1, 0, 0.8352941, 1,
1.089269, 0.8508037, 1.234368, 1, 0, 0.827451, 1,
1.094891, 0.7982599, 0.6137386, 1, 0, 0.8235294, 1,
1.097991, 1.903626, -0.73545, 1, 0, 0.8156863, 1,
1.098216, 0.1217242, 1.688246, 1, 0, 0.8117647, 1,
1.109549, 0.9595029, 0.6072124, 1, 0, 0.8039216, 1,
1.121939, 0.6536911, 1.595295, 1, 0, 0.7960784, 1,
1.125539, -0.5905495, 2.484411, 1, 0, 0.7921569, 1,
1.128054, 0.4479027, 1.020383, 1, 0, 0.7843137, 1,
1.129853, 0.06382998, 3.646716, 1, 0, 0.7803922, 1,
1.13196, -0.1021822, -0.2117908, 1, 0, 0.772549, 1,
1.132463, -0.3923889, 1.772034, 1, 0, 0.7686275, 1,
1.139385, -1.189677, 2.235819, 1, 0, 0.7607843, 1,
1.143722, 0.3252719, 2.024126, 1, 0, 0.7568628, 1,
1.152981, -0.1611088, 2.091594, 1, 0, 0.7490196, 1,
1.154374, 0.08080889, 0.5207088, 1, 0, 0.7450981, 1,
1.156011, 0.5234321, 1.628416, 1, 0, 0.7372549, 1,
1.167305, 0.8203776, 0.5325533, 1, 0, 0.7333333, 1,
1.171436, 0.2851466, 2.210289, 1, 0, 0.7254902, 1,
1.177301, 0.7148639, 1.724811, 1, 0, 0.7215686, 1,
1.177991, -0.2151591, 2.173006, 1, 0, 0.7137255, 1,
1.181622, -1.135268, 2.077009, 1, 0, 0.7098039, 1,
1.189166, 1.019462, 2.267359, 1, 0, 0.7019608, 1,
1.200853, 0.3813869, 0.4156692, 1, 0, 0.6941177, 1,
1.202719, 0.9619841, 0.764416, 1, 0, 0.6901961, 1,
1.214551, 0.569815, 0.5707744, 1, 0, 0.682353, 1,
1.216776, 0.7968546, 0.8073348, 1, 0, 0.6784314, 1,
1.218806, 0.08551799, 1.648935, 1, 0, 0.6705883, 1,
1.219099, -0.03146049, 1.685048, 1, 0, 0.6666667, 1,
1.221026, 0.2625707, 0.4498098, 1, 0, 0.6588235, 1,
1.228877, 0.4911028, 0.3920653, 1, 0, 0.654902, 1,
1.229563, -1.036411, 3.583202, 1, 0, 0.6470588, 1,
1.237291, -0.6757225, 1.384678, 1, 0, 0.6431373, 1,
1.242622, -1.591909, 1.837434, 1, 0, 0.6352941, 1,
1.246394, -0.02920611, 2.159506, 1, 0, 0.6313726, 1,
1.247342, -1.765924, 2.091013, 1, 0, 0.6235294, 1,
1.252907, 2.142471, 1.826388, 1, 0, 0.6196079, 1,
1.260996, 0.7106468, 2.147724, 1, 0, 0.6117647, 1,
1.262391, 0.2868596, 1.25172, 1, 0, 0.6078432, 1,
1.268583, 0.7579882, 2.091663, 1, 0, 0.6, 1,
1.278444, 2.101385, 1.126944, 1, 0, 0.5921569, 1,
1.281007, 1.570967, 1.521203, 1, 0, 0.5882353, 1,
1.300886, -0.6142898, 0.9991241, 1, 0, 0.5803922, 1,
1.311896, 0.5954918, -1.242962, 1, 0, 0.5764706, 1,
1.330455, -1.27676, 1.532347, 1, 0, 0.5686275, 1,
1.34089, 0.3976804, 0.5934182, 1, 0, 0.5647059, 1,
1.353127, -0.647638, 3.587413, 1, 0, 0.5568628, 1,
1.355792, -0.2143323, 2.132396, 1, 0, 0.5529412, 1,
1.358941, 0.1456692, 1.985239, 1, 0, 0.5450981, 1,
1.359057, 0.1469896, 1.927159, 1, 0, 0.5411765, 1,
1.368631, -1.814005, 3.360956, 1, 0, 0.5333334, 1,
1.369616, 0.9570805, 0.03102662, 1, 0, 0.5294118, 1,
1.37193, -2.071509, 1.141647, 1, 0, 0.5215687, 1,
1.376426, -0.8549435, 3.16165, 1, 0, 0.5176471, 1,
1.37906, 0.8704521, 1.607901, 1, 0, 0.509804, 1,
1.381467, 0.9113649, 3.489311, 1, 0, 0.5058824, 1,
1.383058, -2.205545, 2.261383, 1, 0, 0.4980392, 1,
1.393431, -0.3642337, 1.46346, 1, 0, 0.4901961, 1,
1.400274, 1.010962, 0.5308753, 1, 0, 0.4862745, 1,
1.403053, -1.604442, 1.326046, 1, 0, 0.4784314, 1,
1.410313, -0.9252103, 2.098918, 1, 0, 0.4745098, 1,
1.414418, -0.7921501, 2.792103, 1, 0, 0.4666667, 1,
1.425744, -1.444169, 1.195659, 1, 0, 0.4627451, 1,
1.438376, -0.7130712, 2.690961, 1, 0, 0.454902, 1,
1.453955, 1.161317, 1.447209, 1, 0, 0.4509804, 1,
1.454774, 0.2566417, 1.916495, 1, 0, 0.4431373, 1,
1.467984, -0.1981072, 0.5641058, 1, 0, 0.4392157, 1,
1.474017, -0.2100835, 2.647954, 1, 0, 0.4313726, 1,
1.47606, 2.339847, 0.07289145, 1, 0, 0.427451, 1,
1.482028, 2.086658, 1.760898, 1, 0, 0.4196078, 1,
1.485117, -0.1660628, 2.94801, 1, 0, 0.4156863, 1,
1.49231, -0.5329916, 2.787165, 1, 0, 0.4078431, 1,
1.499707, 1.273181, 0.4800909, 1, 0, 0.4039216, 1,
1.501109, 1.659238, -0.5835778, 1, 0, 0.3960784, 1,
1.520266, -0.5434854, 2.039504, 1, 0, 0.3882353, 1,
1.52167, 1.105462, 1.263272, 1, 0, 0.3843137, 1,
1.523581, 1.127455, 0.742334, 1, 0, 0.3764706, 1,
1.525329, 1.028896, 1.785298, 1, 0, 0.372549, 1,
1.529804, -1.040073, -0.5933476, 1, 0, 0.3647059, 1,
1.53987, 1.380198, 3.372422, 1, 0, 0.3607843, 1,
1.546127, 1.000796, 2.119675, 1, 0, 0.3529412, 1,
1.550817, 2.055337, 3.514346, 1, 0, 0.3490196, 1,
1.562011, 0.4607725, 3.292929, 1, 0, 0.3411765, 1,
1.572208, -0.06561197, 0.9801452, 1, 0, 0.3372549, 1,
1.593274, -1.029336, 2.619764, 1, 0, 0.3294118, 1,
1.593432, -0.13926, 0.3413806, 1, 0, 0.3254902, 1,
1.606496, 1.480846, 1.099614, 1, 0, 0.3176471, 1,
1.62324, 0.1698575, 2.270875, 1, 0, 0.3137255, 1,
1.626052, 1.588556, 1.865348, 1, 0, 0.3058824, 1,
1.643981, -0.6078362, 1.289753, 1, 0, 0.2980392, 1,
1.654335, 1.325722, 0.954731, 1, 0, 0.2941177, 1,
1.667581, 0.1030692, 2.53943, 1, 0, 0.2862745, 1,
1.671364, 0.1894772, 1.640946, 1, 0, 0.282353, 1,
1.673586, 1.00503, 1.303865, 1, 0, 0.2745098, 1,
1.683493, 1.340341, 2.151169, 1, 0, 0.2705882, 1,
1.692872, -0.4596133, 0.7231711, 1, 0, 0.2627451, 1,
1.697803, 0.6683511, 0.9923393, 1, 0, 0.2588235, 1,
1.721473, 0.0979359, 1.705305, 1, 0, 0.2509804, 1,
1.741286, -1.238515, 0.2830993, 1, 0, 0.2470588, 1,
1.742181, -0.5140112, 2.910228, 1, 0, 0.2392157, 1,
1.748364, 0.2249526, 2.063589, 1, 0, 0.2352941, 1,
1.759988, 0.1968089, 1.429816, 1, 0, 0.227451, 1,
1.772581, 0.3768022, 0.7061728, 1, 0, 0.2235294, 1,
1.782166, 1.278337, 1.215788, 1, 0, 0.2156863, 1,
1.786642, -0.3127236, 1.502894, 1, 0, 0.2117647, 1,
1.809476, -2.540157, 3.665498, 1, 0, 0.2039216, 1,
1.860952, 0.1118172, 0.7658528, 1, 0, 0.1960784, 1,
1.88527, -0.4871216, -0.6430717, 1, 0, 0.1921569, 1,
1.889281, -0.3324147, 0.6417006, 1, 0, 0.1843137, 1,
1.89141, 0.1819573, 1.566491, 1, 0, 0.1803922, 1,
1.893224, -0.8533792, 0.1468757, 1, 0, 0.172549, 1,
1.900346, 0.1803899, 2.596364, 1, 0, 0.1686275, 1,
1.919914, 0.0164778, 0.8500174, 1, 0, 0.1607843, 1,
1.929209, -0.8364284, 3.164615, 1, 0, 0.1568628, 1,
1.964813, 0.9081553, -0.05350866, 1, 0, 0.1490196, 1,
1.984698, -0.3136193, 2.348461, 1, 0, 0.145098, 1,
1.985247, 0.1856707, 2.068436, 1, 0, 0.1372549, 1,
2.016662, 0.5952641, 1.63407, 1, 0, 0.1333333, 1,
2.032537, -0.9719222, 2.319172, 1, 0, 0.1254902, 1,
2.058379, 0.07713594, 1.029076, 1, 0, 0.1215686, 1,
2.070602, -0.5583137, 3.981929, 1, 0, 0.1137255, 1,
2.108425, -1.169781, 1.521688, 1, 0, 0.1098039, 1,
2.139292, 0.4842537, 1.385313, 1, 0, 0.1019608, 1,
2.177432, -0.7186827, 2.407209, 1, 0, 0.09411765, 1,
2.258453, -1.049046, 1.097055, 1, 0, 0.09019608, 1,
2.26264, -1.614791, 2.31318, 1, 0, 0.08235294, 1,
2.27527, 0.0122099, 1.193162, 1, 0, 0.07843138, 1,
2.325574, 0.8337632, 0.2274903, 1, 0, 0.07058824, 1,
2.332798, 0.5427575, 2.189637, 1, 0, 0.06666667, 1,
2.344262, 0.8325331, 1.107793, 1, 0, 0.05882353, 1,
2.40622, 0.003660568, 1.180805, 1, 0, 0.05490196, 1,
2.467474, 0.2649928, 0.7347704, 1, 0, 0.04705882, 1,
2.5442, 0.1928449, 3.382748, 1, 0, 0.04313726, 1,
2.565079, -0.06779049, 2.403857, 1, 0, 0.03529412, 1,
2.625145, -0.9507768, 1.602822, 1, 0, 0.03137255, 1,
2.712824, 2.334625, 2.675645, 1, 0, 0.02352941, 1,
2.741108, -0.2260454, 3.60907, 1, 0, 0.01960784, 1,
2.835351, 0.4407359, 1.296505, 1, 0, 0.01176471, 1,
2.924892, 0.5584456, 2.614464, 1, 0, 0.007843138, 1
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
-0.3352712, -3.950725, -6.904071, 0, -0.5, 0.5, 0.5,
-0.3352712, -3.950725, -6.904071, 1, -0.5, 0.5, 0.5,
-0.3352712, -3.950725, -6.904071, 1, 1.5, 0.5, 0.5,
-0.3352712, -3.950725, -6.904071, 0, 1.5, 0.5, 0.5
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
-4.700629, 0.1927322, -6.904071, 0, -0.5, 0.5, 0.5,
-4.700629, 0.1927322, -6.904071, 1, -0.5, 0.5, 0.5,
-4.700629, 0.1927322, -6.904071, 1, 1.5, 0.5, 0.5,
-4.700629, 0.1927322, -6.904071, 0, 1.5, 0.5, 0.5
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
-4.700629, -3.950725, 0.5046918, 0, -0.5, 0.5, 0.5,
-4.700629, -3.950725, 0.5046918, 1, -0.5, 0.5, 0.5,
-4.700629, -3.950725, 0.5046918, 1, 1.5, 0.5, 0.5,
-4.700629, -3.950725, 0.5046918, 0, 1.5, 0.5, 0.5
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
-3, -2.994543, -5.194357,
2, -2.994543, -5.194357,
-3, -2.994543, -5.194357,
-3, -3.153907, -5.479309,
-2, -2.994543, -5.194357,
-2, -3.153907, -5.479309,
-1, -2.994543, -5.194357,
-1, -3.153907, -5.479309,
0, -2.994543, -5.194357,
0, -3.153907, -5.479309,
1, -2.994543, -5.194357,
1, -3.153907, -5.479309,
2, -2.994543, -5.194357,
2, -3.153907, -5.479309
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
-3, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
-3, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
-3, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
-3, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5,
-2, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
-2, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
-2, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
-2, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5,
-1, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
-1, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
-1, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
-1, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5,
0, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
0, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
0, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
0, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5,
1, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
1, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
1, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
1, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5,
2, -3.472634, -6.049214, 0, -0.5, 0.5, 0.5,
2, -3.472634, -6.049214, 1, -0.5, 0.5, 0.5,
2, -3.472634, -6.049214, 1, 1.5, 0.5, 0.5,
2, -3.472634, -6.049214, 0, 1.5, 0.5, 0.5
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
-3.693239, -2, -5.194357,
-3.693239, 3, -5.194357,
-3.693239, -2, -5.194357,
-3.861137, -2, -5.479309,
-3.693239, -1, -5.194357,
-3.861137, -1, -5.479309,
-3.693239, 0, -5.194357,
-3.861137, 0, -5.479309,
-3.693239, 1, -5.194357,
-3.861137, 1, -5.479309,
-3.693239, 2, -5.194357,
-3.861137, 2, -5.479309,
-3.693239, 3, -5.194357,
-3.861137, 3, -5.479309
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
-4.196934, -2, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, -2, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, -2, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, -2, -6.049214, 0, 1.5, 0.5, 0.5,
-4.196934, -1, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, -1, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, -1, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, -1, -6.049214, 0, 1.5, 0.5, 0.5,
-4.196934, 0, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, 0, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, 0, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, 0, -6.049214, 0, 1.5, 0.5, 0.5,
-4.196934, 1, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, 1, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, 1, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, 1, -6.049214, 0, 1.5, 0.5, 0.5,
-4.196934, 2, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, 2, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, 2, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, 2, -6.049214, 0, 1.5, 0.5, 0.5,
-4.196934, 3, -6.049214, 0, -0.5, 0.5, 0.5,
-4.196934, 3, -6.049214, 1, -0.5, 0.5, 0.5,
-4.196934, 3, -6.049214, 1, 1.5, 0.5, 0.5,
-4.196934, 3, -6.049214, 0, 1.5, 0.5, 0.5
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
-3.693239, -2.994543, -4,
-3.693239, -2.994543, 6,
-3.693239, -2.994543, -4,
-3.861137, -3.153907, -4,
-3.693239, -2.994543, -2,
-3.861137, -3.153907, -2,
-3.693239, -2.994543, 0,
-3.861137, -3.153907, 0,
-3.693239, -2.994543, 2,
-3.861137, -3.153907, 2,
-3.693239, -2.994543, 4,
-3.861137, -3.153907, 4,
-3.693239, -2.994543, 6,
-3.861137, -3.153907, 6
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
"4",
"6"
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
-4.196934, -3.472634, -4, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, -4, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, -4, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, -4, 0, 1.5, 0.5, 0.5,
-4.196934, -3.472634, -2, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, -2, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, -2, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, -2, 0, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 0, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 0, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 0, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 0, 0, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 2, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 2, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 2, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 2, 0, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 4, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 4, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 4, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 4, 0, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 6, 0, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 6, 1, -0.5, 0.5, 0.5,
-4.196934, -3.472634, 6, 1, 1.5, 0.5, 0.5,
-4.196934, -3.472634, 6, 0, 1.5, 0.5, 0.5
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
-3.693239, -2.994543, -5.194357,
-3.693239, 3.380007, -5.194357,
-3.693239, -2.994543, 6.203741,
-3.693239, 3.380007, 6.203741,
-3.693239, -2.994543, -5.194357,
-3.693239, -2.994543, 6.203741,
-3.693239, 3.380007, -5.194357,
-3.693239, 3.380007, 6.203741,
-3.693239, -2.994543, -5.194357,
3.022696, -2.994543, -5.194357,
-3.693239, -2.994543, 6.203741,
3.022696, -2.994543, 6.203741,
-3.693239, 3.380007, -5.194357,
3.022696, 3.380007, -5.194357,
-3.693239, 3.380007, 6.203741,
3.022696, 3.380007, 6.203741,
3.022696, -2.994543, -5.194357,
3.022696, 3.380007, -5.194357,
3.022696, -2.994543, 6.203741,
3.022696, 3.380007, 6.203741,
3.022696, -2.994543, -5.194357,
3.022696, -2.994543, 6.203741,
3.022696, 3.380007, -5.194357,
3.022696, 3.380007, 6.203741
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
var radius = 7.841615;
var distance = 34.88823;
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
mvMatrix.translate( 0.3352712, -0.1927322, -0.5046918 );
mvMatrix.scale( 1.262446, 1.330056, 0.7438529 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88823);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
pymetrozine<-read.table("pymetrozine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pymetrozine$V2
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
```

```r
y<-pymetrozine$V3
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
```

```r
z<-pymetrozine$V4
```

```
## Error in eval(expr, envir, enclos): object 'pymetrozine' not found
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
-3.595434, 0.3107226, -2.205993, 0, 0, 1, 1, 1,
-3.232006, 0.581683, -0.5297977, 1, 0, 0, 1, 1,
-3.101877, -0.7696481, -3.026596, 1, 0, 0, 1, 1,
-3.005806, 0.9090676, -0.9624221, 1, 0, 0, 1, 1,
-2.850142, -0.1576613, -1.661046, 1, 0, 0, 1, 1,
-2.830087, -0.04249076, -1.757158, 1, 0, 0, 1, 1,
-2.810346, -0.6626495, -2.302484, 0, 0, 0, 1, 1,
-2.676759, 1.345301, 0.07013036, 0, 0, 0, 1, 1,
-2.656882, -0.1016347, -2.883149, 0, 0, 0, 1, 1,
-2.6194, -0.8840406, -1.175291, 0, 0, 0, 1, 1,
-2.541756, 0.3281404, -0.905723, 0, 0, 0, 1, 1,
-2.454627, 2.823647, -0.3693507, 0, 0, 0, 1, 1,
-2.380517, -0.5571334, -0.7132777, 0, 0, 0, 1, 1,
-2.367436, -1.845946, -2.259453, 1, 1, 1, 1, 1,
-2.332089, 0.3447918, -2.95031, 1, 1, 1, 1, 1,
-2.293597, 0.1052609, -1.624351, 1, 1, 1, 1, 1,
-2.252735, -0.5894762, -0.9726744, 1, 1, 1, 1, 1,
-2.204967, -0.6150159, -1.435418, 1, 1, 1, 1, 1,
-2.138265, 0.9928445, -0.6329792, 1, 1, 1, 1, 1,
-2.133104, 1.957838, -0.7692928, 1, 1, 1, 1, 1,
-2.102694, -0.3967055, -2.155741, 1, 1, 1, 1, 1,
-2.089456, -0.9558657, -1.501384, 1, 1, 1, 1, 1,
-2.08357, 0.86335, -1.297032, 1, 1, 1, 1, 1,
-2.080561, 0.09009511, -1.846268, 1, 1, 1, 1, 1,
-2.0413, -0.5754565, -2.505421, 1, 1, 1, 1, 1,
-2.038049, -0.221685, -3.295457, 1, 1, 1, 1, 1,
-2.003516, -0.01411677, -2.532719, 1, 1, 1, 1, 1,
-1.989187, 0.9577868, -2.914271, 1, 1, 1, 1, 1,
-1.983608, -0.8078038, -2.084892, 0, 0, 1, 1, 1,
-1.97431, 0.02755335, -1.152657, 1, 0, 0, 1, 1,
-1.956594, -1.252503, -3.514095, 1, 0, 0, 1, 1,
-1.955006, -0.5888941, -2.569384, 1, 0, 0, 1, 1,
-1.901144, 1.209188, -0.6640166, 1, 0, 0, 1, 1,
-1.86016, -0.09482998, -1.529045, 1, 0, 0, 1, 1,
-1.855705, 1.470359, -0.2853643, 0, 0, 0, 1, 1,
-1.855603, 1.371247, -1.085229, 0, 0, 0, 1, 1,
-1.808359, -0.4727519, -2.898593, 0, 0, 0, 1, 1,
-1.791027, 0.6488696, -2.395917, 0, 0, 0, 1, 1,
-1.770844, 0.1097619, -3.208719, 0, 0, 0, 1, 1,
-1.765202, -0.1544694, -1.160965, 0, 0, 0, 1, 1,
-1.755735, -0.4661556, -3.561899, 0, 0, 0, 1, 1,
-1.745865, -0.5222659, -1.976728, 1, 1, 1, 1, 1,
-1.73262, 0.4169247, -0.2651059, 1, 1, 1, 1, 1,
-1.71781, 0.3147288, -1.044381, 1, 1, 1, 1, 1,
-1.703901, 0.5705897, -3.344533, 1, 1, 1, 1, 1,
-1.692322, -0.1422863, -2.807944, 1, 1, 1, 1, 1,
-1.688056, 0.08412384, -3.031068, 1, 1, 1, 1, 1,
-1.66541, 1.118554, 0.06798758, 1, 1, 1, 1, 1,
-1.65795, -0.4002804, -2.284589, 1, 1, 1, 1, 1,
-1.65726, 0.5968379, -0.2486566, 1, 1, 1, 1, 1,
-1.641233, 2.074767, 0.6297503, 1, 1, 1, 1, 1,
-1.639655, 0.5912775, -2.530748, 1, 1, 1, 1, 1,
-1.62856, 0.9686719, -1.895844, 1, 1, 1, 1, 1,
-1.623068, 0.5526915, -1.025148, 1, 1, 1, 1, 1,
-1.607394, -1.596436, -3.101751, 1, 1, 1, 1, 1,
-1.606579, -0.2927518, -2.415068, 1, 1, 1, 1, 1,
-1.599173, -0.3202947, -1.304546, 0, 0, 1, 1, 1,
-1.592857, -0.610759, -0.3667769, 1, 0, 0, 1, 1,
-1.588065, 2.216738, -0.01239052, 1, 0, 0, 1, 1,
-1.57824, 0.4594043, -0.8939475, 1, 0, 0, 1, 1,
-1.574396, -1.473536, -3.663693, 1, 0, 0, 1, 1,
-1.562482, -0.4452115, -1.704062, 1, 0, 0, 1, 1,
-1.560082, -0.1446404, -0.4761135, 0, 0, 0, 1, 1,
-1.559986, -0.1947493, -1.475465, 0, 0, 0, 1, 1,
-1.559832, 0.4067428, -1.751287, 0, 0, 0, 1, 1,
-1.54922, 0.2266757, -0.1271556, 0, 0, 0, 1, 1,
-1.540938, 0.3238438, -1.966366, 0, 0, 0, 1, 1,
-1.538843, -2.012091, -2.323104, 0, 0, 0, 1, 1,
-1.526547, 0.2574891, -1.931301, 0, 0, 0, 1, 1,
-1.520182, -1.321386, -0.7194452, 1, 1, 1, 1, 1,
-1.517586, 1.11123, 0.1031139, 1, 1, 1, 1, 1,
-1.507356, 1.182936, -1.966129, 1, 1, 1, 1, 1,
-1.507209, 0.1644268, -1.230775, 1, 1, 1, 1, 1,
-1.496762, -0.3907062, -1.147292, 1, 1, 1, 1, 1,
-1.492276, 0.9960804, -0.8478568, 1, 1, 1, 1, 1,
-1.485284, 0.301089, -1.171112, 1, 1, 1, 1, 1,
-1.484722, -1.138537, -2.772419, 1, 1, 1, 1, 1,
-1.481604, 0.7943062, -2.201583, 1, 1, 1, 1, 1,
-1.477749, 2.354557, 0.6133735, 1, 1, 1, 1, 1,
-1.471156, 0.1872861, -0.0370537, 1, 1, 1, 1, 1,
-1.470902, 0.6447862, -0.7250901, 1, 1, 1, 1, 1,
-1.463986, -1.392915, -2.344917, 1, 1, 1, 1, 1,
-1.463223, 0.5836702, -0.5917695, 1, 1, 1, 1, 1,
-1.462237, 0.8109362, -1.702507, 1, 1, 1, 1, 1,
-1.455, 0.7090181, -0.3981563, 0, 0, 1, 1, 1,
-1.44141, -0.280342, -2.520892, 1, 0, 0, 1, 1,
-1.43435, 0.598091, -1.59846, 1, 0, 0, 1, 1,
-1.432937, 0.35772, -1.209265, 1, 0, 0, 1, 1,
-1.424727, -0.1592557, -2.679894, 1, 0, 0, 1, 1,
-1.421111, 0.7625127, -1.232791, 1, 0, 0, 1, 1,
-1.418969, -0.4348919, -1.126061, 0, 0, 0, 1, 1,
-1.411077, 0.5544811, -1.056547, 0, 0, 0, 1, 1,
-1.411015, -0.3602643, -0.8039228, 0, 0, 0, 1, 1,
-1.409011, 0.2431233, -1.758848, 0, 0, 0, 1, 1,
-1.407977, 1.074684, -1.218332, 0, 0, 0, 1, 1,
-1.399831, 1.702587, -0.6827898, 0, 0, 0, 1, 1,
-1.376328, -0.7214987, -2.375759, 0, 0, 0, 1, 1,
-1.376311, 1.235549, -0.1713856, 1, 1, 1, 1, 1,
-1.361244, 0.9963035, -0.9058515, 1, 1, 1, 1, 1,
-1.355878, -0.3259958, -3.48201, 1, 1, 1, 1, 1,
-1.341301, -1.241131, -2.733132, 1, 1, 1, 1, 1,
-1.323333, -0.9576893, -2.676219, 1, 1, 1, 1, 1,
-1.322162, -1.780867, -2.099536, 1, 1, 1, 1, 1,
-1.316481, -0.04531106, -1.609754, 1, 1, 1, 1, 1,
-1.315359, -0.3087809, 0.9936998, 1, 1, 1, 1, 1,
-1.309244, 0.09320707, -1.996178, 1, 1, 1, 1, 1,
-1.297411, 0.1429025, -2.880553, 1, 1, 1, 1, 1,
-1.295746, 0.3462054, -2.515761, 1, 1, 1, 1, 1,
-1.294736, -1.464203, -2.394462, 1, 1, 1, 1, 1,
-1.287442, -0.6639631, -1.589906, 1, 1, 1, 1, 1,
-1.287382, -0.5740665, -1.061057, 1, 1, 1, 1, 1,
-1.279709, 0.4779941, -2.582857, 1, 1, 1, 1, 1,
-1.279461, -1.216677, -3.441944, 0, 0, 1, 1, 1,
-1.277687, -0.7387968, -1.92619, 1, 0, 0, 1, 1,
-1.266551, -0.8160842, -2.705523, 1, 0, 0, 1, 1,
-1.255088, 1.882692, 0.4334513, 1, 0, 0, 1, 1,
-1.240893, -0.3305266, -1.75427, 1, 0, 0, 1, 1,
-1.238914, -0.3674351, -2.716949, 1, 0, 0, 1, 1,
-1.228257, 1.223064, -0.6349581, 0, 0, 0, 1, 1,
-1.214476, 1.956193, -0.1786829, 0, 0, 0, 1, 1,
-1.204759, -0.01802759, -2.641274, 0, 0, 0, 1, 1,
-1.20256, -1.845228, -3.068486, 0, 0, 0, 1, 1,
-1.200347, 0.04170612, -0.8524586, 0, 0, 0, 1, 1,
-1.199865, 1.757845, -0.6074311, 0, 0, 0, 1, 1,
-1.186938, 0.1477761, 0.2613077, 0, 0, 0, 1, 1,
-1.174918, -0.1859886, -3.38846, 1, 1, 1, 1, 1,
-1.173988, -1.114152, -2.57922, 1, 1, 1, 1, 1,
-1.168299, 1.170609, 0.6793181, 1, 1, 1, 1, 1,
-1.167644, -1.406485, -0.9793467, 1, 1, 1, 1, 1,
-1.158566, -0.6534675, -1.705178, 1, 1, 1, 1, 1,
-1.155567, -0.3970943, -1.268164, 1, 1, 1, 1, 1,
-1.149817, 0.04017592, -2.955056, 1, 1, 1, 1, 1,
-1.146202, 0.517805, -0.9506711, 1, 1, 1, 1, 1,
-1.146023, 0.4648973, -0.1269678, 1, 1, 1, 1, 1,
-1.142356, 0.1009907, -1.095245, 1, 1, 1, 1, 1,
-1.141081, -0.3016902, -2.366785, 1, 1, 1, 1, 1,
-1.136282, 1.966065, -1.540449, 1, 1, 1, 1, 1,
-1.131191, 0.08469851, -1.553545, 1, 1, 1, 1, 1,
-1.130634, -0.8819746, -1.452587, 1, 1, 1, 1, 1,
-1.122624, -1.241916, -0.7110255, 1, 1, 1, 1, 1,
-1.12036, 1.324023, 0.09943601, 0, 0, 1, 1, 1,
-1.116538, 0.7728472, 0.1187458, 1, 0, 0, 1, 1,
-1.116445, -0.1143836, -3.759135, 1, 0, 0, 1, 1,
-1.116303, 2.127309, -0.6089369, 1, 0, 0, 1, 1,
-1.114968, -0.07057159, 0.1395703, 1, 0, 0, 1, 1,
-1.099282, -0.5281785, -2.597168, 1, 0, 0, 1, 1,
-1.092597, 0.8519424, 1.021111, 0, 0, 0, 1, 1,
-1.092208, -0.0190893, -3.444681, 0, 0, 0, 1, 1,
-1.091751, -0.3056687, -2.84438, 0, 0, 0, 1, 1,
-1.079994, -0.2772335, -2.19729, 0, 0, 0, 1, 1,
-1.065605, 0.9593022, -1.15607, 0, 0, 0, 1, 1,
-1.061543, 1.103631, -0.9114624, 0, 0, 0, 1, 1,
-1.060714, -0.8096167, -0.8917016, 0, 0, 0, 1, 1,
-1.054438, -0.9729756, -1.234426, 1, 1, 1, 1, 1,
-1.050926, 0.8222138, -1.025525, 1, 1, 1, 1, 1,
-1.032528, -0.306818, -1.634258, 1, 1, 1, 1, 1,
-1.029973, -0.4869007, -2.776028, 1, 1, 1, 1, 1,
-1.022124, -0.4663863, -1.477888, 1, 1, 1, 1, 1,
-1.006958, 0.4002565, -1.218031, 1, 1, 1, 1, 1,
-1.004888, -2.20698, -0.9760109, 1, 1, 1, 1, 1,
-0.9975211, 0.04460277, -1.811319, 1, 1, 1, 1, 1,
-0.9964725, -0.342395, -2.046179, 1, 1, 1, 1, 1,
-0.9929746, 1.397164, -0.9332087, 1, 1, 1, 1, 1,
-0.9925257, -2.117523, -3.753654, 1, 1, 1, 1, 1,
-0.989689, 0.3178805, -0.04304907, 1, 1, 1, 1, 1,
-0.9856275, 0.953077, -1.189978, 1, 1, 1, 1, 1,
-0.9851598, -0.6300865, -3.072639, 1, 1, 1, 1, 1,
-0.9842654, -0.2031228, -2.992593, 1, 1, 1, 1, 1,
-0.9813696, 0.02839086, -0.8719714, 0, 0, 1, 1, 1,
-0.979879, 0.9926326, -0.9524169, 1, 0, 0, 1, 1,
-0.9723398, -0.9614555, -1.644061, 1, 0, 0, 1, 1,
-0.9662877, 0.2198359, -2.382472, 1, 0, 0, 1, 1,
-0.9641629, 0.8378676, -1.668818, 1, 0, 0, 1, 1,
-0.9602232, 0.407315, -2.535792, 1, 0, 0, 1, 1,
-0.9588993, -0.09383629, -2.852082, 0, 0, 0, 1, 1,
-0.9587107, -0.4060914, -2.30231, 0, 0, 0, 1, 1,
-0.9465097, -1.061737, -2.954092, 0, 0, 0, 1, 1,
-0.9399171, -0.9352551, -2.64981, 0, 0, 0, 1, 1,
-0.912356, 1.39777, -0.2109838, 0, 0, 0, 1, 1,
-0.910691, 0.6381683, -2.513024, 0, 0, 0, 1, 1,
-0.9101462, 0.36261, -1.069725, 0, 0, 0, 1, 1,
-0.9053341, -1.721223, -2.554569, 1, 1, 1, 1, 1,
-0.9030558, 3.287174, -1.216768, 1, 1, 1, 1, 1,
-0.9024512, -0.5092127, -1.655355, 1, 1, 1, 1, 1,
-0.8950212, 0.8760478, -0.2413614, 1, 1, 1, 1, 1,
-0.8947096, 0.4830571, -0.7299837, 1, 1, 1, 1, 1,
-0.893047, -2.051135, -3.14005, 1, 1, 1, 1, 1,
-0.8919656, -0.6215767, -3.598073, 1, 1, 1, 1, 1,
-0.8917432, 1.088767, -0.5792512, 1, 1, 1, 1, 1,
-0.891602, -1.08744, -1.962922, 1, 1, 1, 1, 1,
-0.8888384, 0.2095387, -1.733175, 1, 1, 1, 1, 1,
-0.8832073, -0.1781947, -1.808219, 1, 1, 1, 1, 1,
-0.8818645, 0.07817975, -2.503807, 1, 1, 1, 1, 1,
-0.8817201, 0.264313, -1.698339, 1, 1, 1, 1, 1,
-0.8799348, 1.530034, -0.9459227, 1, 1, 1, 1, 1,
-0.8780458, -0.8410637, -3.243448, 1, 1, 1, 1, 1,
-0.8766464, 0.4660733, -1.612637, 0, 0, 1, 1, 1,
-0.8723899, -1.315235, -3.386825, 1, 0, 0, 1, 1,
-0.8711509, -0.967011, -1.875174, 1, 0, 0, 1, 1,
-0.8656125, -1.404604, -3.146961, 1, 0, 0, 1, 1,
-0.8608927, -0.3408405, -2.129326, 1, 0, 0, 1, 1,
-0.8593842, -0.5925518, -0.8988081, 1, 0, 0, 1, 1,
-0.8576745, -0.4839931, -2.355368, 0, 0, 0, 1, 1,
-0.8500201, -0.1470089, -1.488686, 0, 0, 0, 1, 1,
-0.8477873, 1.021787, -1.013062, 0, 0, 0, 1, 1,
-0.8463506, 0.1842647, -1.945904, 0, 0, 0, 1, 1,
-0.846221, 0.5263206, -2.274248, 0, 0, 0, 1, 1,
-0.8401291, 0.1576392, 1.188208, 0, 0, 0, 1, 1,
-0.8397687, -0.776714, -0.7367864, 0, 0, 0, 1, 1,
-0.8397216, -1.24066, -1.547656, 1, 1, 1, 1, 1,
-0.8341773, 0.4056262, -1.279603, 1, 1, 1, 1, 1,
-0.8314155, -0.1072341, -2.666994, 1, 1, 1, 1, 1,
-0.8270926, 0.6075582, 1.750393, 1, 1, 1, 1, 1,
-0.8266314, 1.199647, -0.2205063, 1, 1, 1, 1, 1,
-0.8258047, -1.732564, -3.238148, 1, 1, 1, 1, 1,
-0.8249056, 1.150029, -1.203848, 1, 1, 1, 1, 1,
-0.8246876, -0.7777207, -3.165631, 1, 1, 1, 1, 1,
-0.824227, 0.6348183, -0.3995103, 1, 1, 1, 1, 1,
-0.8199403, 0.09973077, -0.06300456, 1, 1, 1, 1, 1,
-0.8196268, 0.9831856, 0.1088136, 1, 1, 1, 1, 1,
-0.8171958, -1.320907, -2.081465, 1, 1, 1, 1, 1,
-0.812767, -0.4221772, -2.063008, 1, 1, 1, 1, 1,
-0.8110315, -0.4335553, -2.903386, 1, 1, 1, 1, 1,
-0.8106363, -0.1842279, -0.7778615, 1, 1, 1, 1, 1,
-0.8029787, 0.5848171, -2.757182, 0, 0, 1, 1, 1,
-0.798431, -0.2923126, -3.160697, 1, 0, 0, 1, 1,
-0.7982602, -0.3155197, -3.606088, 1, 0, 0, 1, 1,
-0.7968619, -1.416318, -3.196739, 1, 0, 0, 1, 1,
-0.7912788, 0.8801457, -1.219669, 1, 0, 0, 1, 1,
-0.7877227, -0.6553869, -0.8619565, 1, 0, 0, 1, 1,
-0.7795418, -0.4099452, -3.056246, 0, 0, 0, 1, 1,
-0.7771896, 0.05643604, -1.369858, 0, 0, 0, 1, 1,
-0.7755817, -0.1370513, -2.268456, 0, 0, 0, 1, 1,
-0.7736496, -0.1816086, -1.677788, 0, 0, 0, 1, 1,
-0.7711931, -1.068205, -2.453051, 0, 0, 0, 1, 1,
-0.7697125, 0.4988511, -1.700787, 0, 0, 0, 1, 1,
-0.769265, 0.9496357, -2.229513, 0, 0, 0, 1, 1,
-0.7690817, 0.01289189, -2.544115, 1, 1, 1, 1, 1,
-0.7653676, -1.525122, -2.990199, 1, 1, 1, 1, 1,
-0.7633285, -0.6426421, -1.566888, 1, 1, 1, 1, 1,
-0.7581743, -0.4251748, -0.7316707, 1, 1, 1, 1, 1,
-0.756286, 0.5958186, -1.010928, 1, 1, 1, 1, 1,
-0.7522607, -1.50038, -4.760205, 1, 1, 1, 1, 1,
-0.7406738, 1.672758, 0.07008043, 1, 1, 1, 1, 1,
-0.7396085, -0.3656504, -2.641995, 1, 1, 1, 1, 1,
-0.738156, 0.3017528, -1.624036, 1, 1, 1, 1, 1,
-0.736221, -0.250108, -3.285711, 1, 1, 1, 1, 1,
-0.7223389, 1.918932, -0.06918979, 1, 1, 1, 1, 1,
-0.7172516, -0.3580598, -1.005052, 1, 1, 1, 1, 1,
-0.7167103, 0.04205286, -1.061456, 1, 1, 1, 1, 1,
-0.7126214, -0.1384825, -1.424875, 1, 1, 1, 1, 1,
-0.7116269, -0.7713151, -2.541007, 1, 1, 1, 1, 1,
-0.7066207, -1.191629, -2.438815, 0, 0, 1, 1, 1,
-0.7043667, -1.640193, -2.143919, 1, 0, 0, 1, 1,
-0.7039567, 1.572297, -0.7621429, 1, 0, 0, 1, 1,
-0.6957105, 0.1092705, -3.01467, 1, 0, 0, 1, 1,
-0.6923189, 2.422052, -1.45955, 1, 0, 0, 1, 1,
-0.6912422, -0.009995806, -0.7925537, 1, 0, 0, 1, 1,
-0.6892468, 0.5650342, -0.7408533, 0, 0, 0, 1, 1,
-0.6887742, -0.1521226, 0.01304455, 0, 0, 0, 1, 1,
-0.6876573, 0.7573301, -0.03414012, 0, 0, 0, 1, 1,
-0.6846399, 1.434101, -2.237448, 0, 0, 0, 1, 1,
-0.6813837, 0.8374061, -1.812107, 0, 0, 0, 1, 1,
-0.68048, 0.1582196, -1.548173, 0, 0, 0, 1, 1,
-0.6797395, -1.909799, -3.040816, 0, 0, 0, 1, 1,
-0.6718544, 0.09686805, -1.308732, 1, 1, 1, 1, 1,
-0.6674424, 1.325673, -0.9365113, 1, 1, 1, 1, 1,
-0.6673759, 0.950443, -0.8812306, 1, 1, 1, 1, 1,
-0.6653494, 0.5148455, -0.8694283, 1, 1, 1, 1, 1,
-0.6648802, 0.03838193, -2.445659, 1, 1, 1, 1, 1,
-0.6577902, 0.3376949, 0.2701754, 1, 1, 1, 1, 1,
-0.6573998, -0.5118409, -1.166493, 1, 1, 1, 1, 1,
-0.6536072, -1.563473, -3.098024, 1, 1, 1, 1, 1,
-0.6451291, -0.8794264, -3.378622, 1, 1, 1, 1, 1,
-0.6450007, -0.290742, -1.504207, 1, 1, 1, 1, 1,
-0.6448907, 0.8641664, 0.04150827, 1, 1, 1, 1, 1,
-0.6435008, 1.343873, -0.1921747, 1, 1, 1, 1, 1,
-0.6407652, -1.364259, -3.604322, 1, 1, 1, 1, 1,
-0.6372491, 0.9406691, -0.3627934, 1, 1, 1, 1, 1,
-0.6328658, -2.503391, -1.170058, 1, 1, 1, 1, 1,
-0.625316, 0.8984589, -1.153192, 0, 0, 1, 1, 1,
-0.6232128, -0.2880617, -2.203062, 1, 0, 0, 1, 1,
-0.6114612, -1.631308, -2.136767, 1, 0, 0, 1, 1,
-0.6108798, -1.431393, -4.203772, 1, 0, 0, 1, 1,
-0.6099014, 1.111745, -1.388673, 1, 0, 0, 1, 1,
-0.607886, 0.09541522, -1.716901, 1, 0, 0, 1, 1,
-0.6073465, -1.151547, -0.8991254, 0, 0, 0, 1, 1,
-0.595674, -0.120407, -2.443766, 0, 0, 0, 1, 1,
-0.5893746, -0.4688241, -1.017646, 0, 0, 0, 1, 1,
-0.5844575, -0.2453914, -1.761644, 0, 0, 0, 1, 1,
-0.5843636, -0.4622245, -3.164626, 0, 0, 0, 1, 1,
-0.580921, 0.1148753, -0.2563065, 0, 0, 0, 1, 1,
-0.5808831, 1.406585, -0.4706476, 0, 0, 0, 1, 1,
-0.5800354, -1.429397, -4.164094, 1, 1, 1, 1, 1,
-0.5781058, -0.2341703, -2.860466, 1, 1, 1, 1, 1,
-0.5740978, 1.108945, -0.8364369, 1, 1, 1, 1, 1,
-0.5705559, -0.4677044, -2.505528, 1, 1, 1, 1, 1,
-0.5699159, 0.5055452, 1.003344, 1, 1, 1, 1, 1,
-0.5673183, 1.082164, 1.217054, 1, 1, 1, 1, 1,
-0.5613056, 1.938116, 0.8218276, 1, 1, 1, 1, 1,
-0.5587453, -0.3129741, -0.7032099, 1, 1, 1, 1, 1,
-0.5545692, 0.01571437, -2.218091, 1, 1, 1, 1, 1,
-0.5530908, -0.3247449, -1.692275, 1, 1, 1, 1, 1,
-0.5518736, -1.167148, -1.818816, 1, 1, 1, 1, 1,
-0.5515501, -0.9667183, -2.594314, 1, 1, 1, 1, 1,
-0.5512379, 0.3145986, -2.558033, 1, 1, 1, 1, 1,
-0.5501187, -0.9425319, -2.806649, 1, 1, 1, 1, 1,
-0.5420125, 0.001465998, -0.5588806, 1, 1, 1, 1, 1,
-0.5389927, -0.2226214, -2.679081, 0, 0, 1, 1, 1,
-0.5313579, 1.00717, 0.2138344, 1, 0, 0, 1, 1,
-0.5306647, 0.30275, -0.1802816, 1, 0, 0, 1, 1,
-0.5254734, -0.7012703, -3.699744, 1, 0, 0, 1, 1,
-0.5249935, -0.9358665, -2.441346, 1, 0, 0, 1, 1,
-0.521524, 0.8184105, 0.02434037, 1, 0, 0, 1, 1,
-0.5176546, -1.478355, -3.753297, 0, 0, 0, 1, 1,
-0.5113945, -0.4603149, -0.5189942, 0, 0, 0, 1, 1,
-0.5107858, 0.2582692, -1.576862, 0, 0, 0, 1, 1,
-0.5090489, 0.6304722, -2.057112, 0, 0, 0, 1, 1,
-0.5067366, -0.3496778, -2.494431, 0, 0, 0, 1, 1,
-0.5067013, 1.211501, -0.7376782, 0, 0, 0, 1, 1,
-0.5065168, -0.8852115, -1.454485, 0, 0, 0, 1, 1,
-0.502723, 0.6135089, -1.348668, 1, 1, 1, 1, 1,
-0.5026934, -0.6984656, -2.436938, 1, 1, 1, 1, 1,
-0.5001849, 0.2124364, -0.9899015, 1, 1, 1, 1, 1,
-0.4988566, 1.139774, -0.9171579, 1, 1, 1, 1, 1,
-0.4984322, -0.7542035, -1.524168, 1, 1, 1, 1, 1,
-0.4951729, 0.05115176, -1.039474, 1, 1, 1, 1, 1,
-0.4900957, 0.09080426, -2.030564, 1, 1, 1, 1, 1,
-0.4872571, -0.5092784, -1.066957, 1, 1, 1, 1, 1,
-0.486389, 0.1625158, -1.100793, 1, 1, 1, 1, 1,
-0.472948, 0.4125027, -2.070117, 1, 1, 1, 1, 1,
-0.4655908, -1.605969, -2.869372, 1, 1, 1, 1, 1,
-0.4642219, 0.9235063, -0.1494184, 1, 1, 1, 1, 1,
-0.4567595, -0.007445222, -0.5615919, 1, 1, 1, 1, 1,
-0.4509389, 1.4792, -1.621755, 1, 1, 1, 1, 1,
-0.447462, 0.4730707, -0.7761598, 1, 1, 1, 1, 1,
-0.4282453, 1.641288, -2.301999, 0, 0, 1, 1, 1,
-0.4236217, 1.480098, 1.821663, 1, 0, 0, 1, 1,
-0.4224039, -1.220518, -3.423558, 1, 0, 0, 1, 1,
-0.4195116, 0.7922775, -0.8448006, 1, 0, 0, 1, 1,
-0.4176172, -0.1951734, -0.004460291, 1, 0, 0, 1, 1,
-0.4172111, -1.28776, -4.252613, 1, 0, 0, 1, 1,
-0.4136315, 1.407507, 0.9573882, 0, 0, 0, 1, 1,
-0.4124193, -0.3983262, -3.382628, 0, 0, 0, 1, 1,
-0.4115531, -0.4779727, -3.735414, 0, 0, 0, 1, 1,
-0.4015249, -0.1745574, -1.548324, 0, 0, 0, 1, 1,
-0.4009165, 0.1789625, -1.475044, 0, 0, 0, 1, 1,
-0.398386, -0.1679474, 0.02506523, 0, 0, 0, 1, 1,
-0.3983526, 0.3779391, -1.747654, 0, 0, 0, 1, 1,
-0.3947934, -0.9283206, -3.345769, 1, 1, 1, 1, 1,
-0.3904922, 0.3778447, -3.007848, 1, 1, 1, 1, 1,
-0.3881456, 0.736576, -0.02184445, 1, 1, 1, 1, 1,
-0.3842359, 0.9774393, -1.632011, 1, 1, 1, 1, 1,
-0.3828908, 1.083356, -0.1003523, 1, 1, 1, 1, 1,
-0.3767659, -0.3574373, -2.764284, 1, 1, 1, 1, 1,
-0.375037, 1.398129, 1.079708, 1, 1, 1, 1, 1,
-0.3717314, -0.891081, -3.106977, 1, 1, 1, 1, 1,
-0.3699058, -0.3692663, -1.73457, 1, 1, 1, 1, 1,
-0.3691887, 1.171382, -1.164662, 1, 1, 1, 1, 1,
-0.3685365, -2.172454, -2.822573, 1, 1, 1, 1, 1,
-0.3679673, -0.4675975, -2.364631, 1, 1, 1, 1, 1,
-0.3615995, 0.622171, -0.4234017, 1, 1, 1, 1, 1,
-0.356297, 1.514998, -1.083228, 1, 1, 1, 1, 1,
-0.3551086, 0.2538482, -0.608067, 1, 1, 1, 1, 1,
-0.3546102, 1.345746, 1.518725, 0, 0, 1, 1, 1,
-0.3545758, -0.8414547, -1.612382, 1, 0, 0, 1, 1,
-0.3515294, 1.782099, 1.46894, 1, 0, 0, 1, 1,
-0.3507237, -1.856787, -1.655356, 1, 0, 0, 1, 1,
-0.347471, -0.5474899, -1.819575, 1, 0, 0, 1, 1,
-0.3368041, 0.3740995, -1.98702, 1, 0, 0, 1, 1,
-0.3352558, 2.167928, -0.6080582, 0, 0, 0, 1, 1,
-0.3330731, 0.3505287, 0.2127848, 0, 0, 0, 1, 1,
-0.3314594, -0.121067, 0.6743045, 0, 0, 0, 1, 1,
-0.3295796, -1.316188, -2.313635, 0, 0, 0, 1, 1,
-0.3280942, -0.664216, -1.854429, 0, 0, 0, 1, 1,
-0.3280347, -0.8279436, -4.534557, 0, 0, 0, 1, 1,
-0.3260817, 0.5711977, -0.7374152, 0, 0, 0, 1, 1,
-0.3204433, 1.084495, 0.209248, 1, 1, 1, 1, 1,
-0.3195416, -0.3950506, -0.6334538, 1, 1, 1, 1, 1,
-0.3194031, 0.2773019, -0.6351172, 1, 1, 1, 1, 1,
-0.3181872, 0.8813831, -0.01566707, 1, 1, 1, 1, 1,
-0.3167469, -1.823155, -2.286702, 1, 1, 1, 1, 1,
-0.3149189, 0.4339681, -0.4149932, 1, 1, 1, 1, 1,
-0.3147559, 1.519722, -0.517823, 1, 1, 1, 1, 1,
-0.3131907, -1.715601, -4.123071, 1, 1, 1, 1, 1,
-0.3091758, -2.90171, -1.260373, 1, 1, 1, 1, 1,
-0.3080927, -0.3936675, -2.232428, 1, 1, 1, 1, 1,
-0.3061947, -0.6610695, -4.027462, 1, 1, 1, 1, 1,
-0.3059807, -0.6575449, -2.55008, 1, 1, 1, 1, 1,
-0.3030161, -0.7573265, -2.861424, 1, 1, 1, 1, 1,
-0.3023326, -1.436992, -2.928518, 1, 1, 1, 1, 1,
-0.2987053, -0.3507062, -3.052169, 1, 1, 1, 1, 1,
-0.2963566, 0.9184036, 0.9764748, 0, 0, 1, 1, 1,
-0.2925103, 1.000609, -0.08300485, 1, 0, 0, 1, 1,
-0.292463, -0.3800758, -2.166743, 1, 0, 0, 1, 1,
-0.2909686, -0.3218491, -2.76053, 1, 0, 0, 1, 1,
-0.2865752, -0.06356315, -0.1852331, 1, 0, 0, 1, 1,
-0.2856392, -0.802443, -1.314583, 1, 0, 0, 1, 1,
-0.2784266, 1.202836, -2.829707, 0, 0, 0, 1, 1,
-0.2781217, 0.08012087, -2.517307, 0, 0, 0, 1, 1,
-0.2777288, 0.450936, -2.056566, 0, 0, 0, 1, 1,
-0.2756053, 0.4066608, -1.740024, 0, 0, 0, 1, 1,
-0.2718026, -0.02593912, -1.48402, 0, 0, 0, 1, 1,
-0.2701639, -0.6575011, -4.019277, 0, 0, 0, 1, 1,
-0.2536481, -0.6374215, -2.676872, 0, 0, 0, 1, 1,
-0.2499094, -0.1285249, -1.999172, 1, 1, 1, 1, 1,
-0.2430857, 0.1111537, -0.6001071, 1, 1, 1, 1, 1,
-0.2404732, -1.236498, -1.915109, 1, 1, 1, 1, 1,
-0.2360012, -0.01484839, -3.143331, 1, 1, 1, 1, 1,
-0.2334339, 0.2859092, -2.34893, 1, 1, 1, 1, 1,
-0.2314176, -0.9334891, -4.059171, 1, 1, 1, 1, 1,
-0.2256128, -0.9935536, -2.231129, 1, 1, 1, 1, 1,
-0.2215498, 0.1226581, -3.686704, 1, 1, 1, 1, 1,
-0.2199207, -0.9918098, -1.101831, 1, 1, 1, 1, 1,
-0.2195538, 0.242992, -1.236531, 1, 1, 1, 1, 1,
-0.2169164, 1.923772, 1.318012, 1, 1, 1, 1, 1,
-0.2135494, -0.3024717, -1.431568, 1, 1, 1, 1, 1,
-0.211735, -1.08611, -3.240473, 1, 1, 1, 1, 1,
-0.2097661, -0.2154084, -1.693102, 1, 1, 1, 1, 1,
-0.2072071, -0.2473325, -3.273864, 1, 1, 1, 1, 1,
-0.2067335, -1.894102, -3.572203, 0, 0, 1, 1, 1,
-0.204779, 1.460484, 0.005939264, 1, 0, 0, 1, 1,
-0.2013908, -0.1400055, -4.262537, 1, 0, 0, 1, 1,
-0.1990821, 1.539687, 0.02099653, 1, 0, 0, 1, 1,
-0.1953774, -0.8348933, -3.159496, 1, 0, 0, 1, 1,
-0.1936602, 0.5285487, 0.02106071, 1, 0, 0, 1, 1,
-0.1925484, 0.2176762, -1.848281, 0, 0, 0, 1, 1,
-0.1916602, 2.058058, 1.119374, 0, 0, 0, 1, 1,
-0.1892946, 0.7995871, -0.9220963, 0, 0, 0, 1, 1,
-0.1858252, 0.3491833, 0.4045673, 0, 0, 0, 1, 1,
-0.1847138, -1.92763, -3.721758, 0, 0, 0, 1, 1,
-0.1825811, -0.9172513, -3.611088, 0, 0, 0, 1, 1,
-0.1792563, -0.5719059, -4.291053, 0, 0, 0, 1, 1,
-0.1792461, 0.1274698, -1.141773, 1, 1, 1, 1, 1,
-0.1783997, -0.5143966, -3.927758, 1, 1, 1, 1, 1,
-0.1686428, -0.2278908, -2.437848, 1, 1, 1, 1, 1,
-0.167595, 0.057039, -1.226029, 1, 1, 1, 1, 1,
-0.1628716, 0.7217506, -0.7191053, 1, 1, 1, 1, 1,
-0.1586057, 0.46421, -0.3405738, 1, 1, 1, 1, 1,
-0.1576837, 1.444973, 0.4648311, 1, 1, 1, 1, 1,
-0.1553534, -0.2773623, -2.65748, 1, 1, 1, 1, 1,
-0.1368067, 0.7772766, -0.8645613, 1, 1, 1, 1, 1,
-0.1363461, -1.122176, -3.629189, 1, 1, 1, 1, 1,
-0.1254447, -0.20995, -2.393175, 1, 1, 1, 1, 1,
-0.1254098, 0.1786908, -0.2973826, 1, 1, 1, 1, 1,
-0.1249607, 0.829223, -0.1638237, 1, 1, 1, 1, 1,
-0.1234596, -0.5889085, -3.083575, 1, 1, 1, 1, 1,
-0.1218368, -1.318091, -3.803153, 1, 1, 1, 1, 1,
-0.1217631, 0.8183473, -0.6741222, 0, 0, 1, 1, 1,
-0.1207292, -0.1613553, -3.230092, 1, 0, 0, 1, 1,
-0.1190593, 0.7946854, 0.5972263, 1, 0, 0, 1, 1,
-0.1156018, 0.6655405, 0.01680464, 1, 0, 0, 1, 1,
-0.1142265, -0.8135132, -5.028365, 1, 0, 0, 1, 1,
-0.1096513, 0.4996992, -0.9946249, 1, 0, 0, 1, 1,
-0.10679, -0.3580373, -2.374243, 0, 0, 0, 1, 1,
-0.1044198, 0.9914235, -0.7954804, 0, 0, 0, 1, 1,
-0.1042394, -0.2202787, -2.791593, 0, 0, 0, 1, 1,
-0.1020745, 1.699098, -1.892078, 0, 0, 0, 1, 1,
-0.09983694, 0.180963, -0.2541213, 0, 0, 0, 1, 1,
-0.09901096, -1.026577, -3.558052, 0, 0, 0, 1, 1,
-0.09099177, 0.9053875, -0.7190027, 0, 0, 0, 1, 1,
-0.09050994, -0.1319357, -2.69988, 1, 1, 1, 1, 1,
-0.08773592, -0.71465, -3.129872, 1, 1, 1, 1, 1,
-0.08636118, 0.125642, -0.4925972, 1, 1, 1, 1, 1,
-0.08621998, -0.5067927, -1.552166, 1, 1, 1, 1, 1,
-0.08538493, 0.5288463, -0.6201341, 1, 1, 1, 1, 1,
-0.08413959, 0.76189, 0.9720087, 1, 1, 1, 1, 1,
-0.08247436, 0.2570371, 0.04015139, 1, 1, 1, 1, 1,
-0.0803116, 0.04808523, 1.428023, 1, 1, 1, 1, 1,
-0.07984546, 0.2615104, -1.550167, 1, 1, 1, 1, 1,
-0.07944805, 0.593785, 0.4220301, 1, 1, 1, 1, 1,
-0.07605568, 0.254923, 0.1912652, 1, 1, 1, 1, 1,
-0.07282376, 0.8809481, -0.5790132, 1, 1, 1, 1, 1,
-0.07167123, -0.5492175, -3.420022, 1, 1, 1, 1, 1,
-0.06986266, 0.1338625, 1.60466, 1, 1, 1, 1, 1,
-0.06781095, 1.97822, -1.110643, 1, 1, 1, 1, 1,
-0.0630729, -1.904362, -3.324513, 0, 0, 1, 1, 1,
-0.05851468, -0.9254897, -1.488062, 1, 0, 0, 1, 1,
-0.05108569, -1.59725, -3.487165, 1, 0, 0, 1, 1,
-0.04839687, 0.1258859, 1.998789, 1, 0, 0, 1, 1,
-0.04393831, -1.00454, -3.7426, 1, 0, 0, 1, 1,
-0.04315214, 0.6587944, 1.444754, 1, 0, 0, 1, 1,
-0.03992272, -1.402053, -3.766147, 0, 0, 0, 1, 1,
-0.03967583, 0.6138423, 0.5027764, 0, 0, 0, 1, 1,
-0.03938867, -0.3238229, -3.829694, 0, 0, 0, 1, 1,
-0.0347276, -0.1673277, -3.12689, 0, 0, 0, 1, 1,
-0.03171448, -2.347382, -4.028956, 0, 0, 0, 1, 1,
-0.03142089, 1.570037, -2.64754, 0, 0, 0, 1, 1,
-0.02951229, 0.661957, -0.4234552, 0, 0, 0, 1, 1,
-0.02721734, -1.115844, -3.583631, 1, 1, 1, 1, 1,
-0.0270754, 1.588428, 1.143245, 1, 1, 1, 1, 1,
-0.02612089, 2.269753, -1.235391, 1, 1, 1, 1, 1,
-0.02271669, -1.601409, -1.965634, 1, 1, 1, 1, 1,
-0.0211942, 0.1589519, 0.1074409, 1, 1, 1, 1, 1,
-0.02114372, 0.4020044, -0.7367211, 1, 1, 1, 1, 1,
-0.01780688, -1.637598, -3.2808, 1, 1, 1, 1, 1,
-0.00534695, -0.786158, -2.603254, 1, 1, 1, 1, 1,
-0.005114677, 1.846645, -0.8119118, 1, 1, 1, 1, 1,
-0.003456904, 2.133559, -0.8876516, 1, 1, 1, 1, 1,
0.003507322, 0.2451444, -0.1045807, 1, 1, 1, 1, 1,
0.004185992, -1.458284, 3.870301, 1, 1, 1, 1, 1,
0.005766344, -0.1687384, 3.016659, 1, 1, 1, 1, 1,
0.01413903, -0.1620211, 4.015645, 1, 1, 1, 1, 1,
0.01546479, 0.9155113, -0.2003383, 1, 1, 1, 1, 1,
0.01595258, 0.9733512, -0.2040937, 0, 0, 1, 1, 1,
0.02083351, -0.4909204, 2.434976, 1, 0, 0, 1, 1,
0.02386409, 0.4036716, 1.231216, 1, 0, 0, 1, 1,
0.02415875, 1.032995, -0.05543404, 1, 0, 0, 1, 1,
0.02439131, -1.929461, 1.746189, 1, 0, 0, 1, 1,
0.02641671, 1.695435, -2.006305, 1, 0, 0, 1, 1,
0.03004784, 0.1502074, 0.9770387, 0, 0, 0, 1, 1,
0.0322265, 0.1903545, 0.3138397, 0, 0, 0, 1, 1,
0.03232467, -1.648542, 2.196928, 0, 0, 0, 1, 1,
0.03522663, -0.2641962, 4.943594, 0, 0, 0, 1, 1,
0.04216905, -0.9148177, 2.75174, 0, 0, 0, 1, 1,
0.04248036, -1.150203, 2.443711, 0, 0, 0, 1, 1,
0.0446496, -1.047897, 3.946685, 0, 0, 0, 1, 1,
0.04786206, -0.03187888, 1.417697, 1, 1, 1, 1, 1,
0.0485652, 0.3004058, -0.3206557, 1, 1, 1, 1, 1,
0.04858728, 1.172804, -0.5056044, 1, 1, 1, 1, 1,
0.05286115, -0.2719086, 2.05617, 1, 1, 1, 1, 1,
0.05744367, -0.5542629, 3.592896, 1, 1, 1, 1, 1,
0.05863715, 0.46544, -0.1694008, 1, 1, 1, 1, 1,
0.06755877, 0.1697589, -1.606681, 1, 1, 1, 1, 1,
0.07082718, 1.757353, -1.087984, 1, 1, 1, 1, 1,
0.07238781, -0.1321794, 3.697817, 1, 1, 1, 1, 1,
0.07533011, -0.5660272, 3.445812, 1, 1, 1, 1, 1,
0.07637089, -1.911145, 3.541512, 1, 1, 1, 1, 1,
0.07647011, 0.04599449, -0.6602952, 1, 1, 1, 1, 1,
0.07879971, -0.6644157, 2.251499, 1, 1, 1, 1, 1,
0.08139257, 1.208613, 0.5704756, 1, 1, 1, 1, 1,
0.08243811, -0.8719357, 2.965842, 1, 1, 1, 1, 1,
0.08685748, -0.1932987, 4.487086, 0, 0, 1, 1, 1,
0.08993446, -0.8969474, 3.697218, 1, 0, 0, 1, 1,
0.09064653, -0.1533512, 2.303073, 1, 0, 0, 1, 1,
0.09388474, -0.874106, 1.962337, 1, 0, 0, 1, 1,
0.09572619, -0.3708622, 3.318611, 1, 0, 0, 1, 1,
0.09686365, -1.318853, 3.323402, 1, 0, 0, 1, 1,
0.1020695, -0.9910274, 1.869713, 0, 0, 0, 1, 1,
0.1042577, -0.7290515, 1.089758, 0, 0, 0, 1, 1,
0.1046872, -0.1874503, 4.199761, 0, 0, 0, 1, 1,
0.1057468, 0.3978964, -0.6636329, 0, 0, 0, 1, 1,
0.1062363, -0.9514925, 6.037749, 0, 0, 0, 1, 1,
0.10922, 1.650562, 1.497548, 0, 0, 0, 1, 1,
0.1140108, -0.667899, 4.757618, 0, 0, 0, 1, 1,
0.1175122, -0.8416542, 1.921203, 1, 1, 1, 1, 1,
0.1203189, -1.0131, 4.71261, 1, 1, 1, 1, 1,
0.1227931, -0.203759, 3.373979, 1, 1, 1, 1, 1,
0.1268117, 0.2806053, -2.992003, 1, 1, 1, 1, 1,
0.1270332, -0.5575204, 2.464877, 1, 1, 1, 1, 1,
0.127447, -0.0191975, 2.197611, 1, 1, 1, 1, 1,
0.1286818, 0.03451211, 1.342835, 1, 1, 1, 1, 1,
0.1299244, 0.2756736, 0.6204776, 1, 1, 1, 1, 1,
0.1333231, 0.1422009, 0.3225093, 1, 1, 1, 1, 1,
0.1345009, 1.240736, 0.1487351, 1, 1, 1, 1, 1,
0.1349161, 0.07047033, 1.238191, 1, 1, 1, 1, 1,
0.1383811, -0.5054494, 3.750637, 1, 1, 1, 1, 1,
0.138642, -1.186746, 2.918976, 1, 1, 1, 1, 1,
0.1520066, -0.9625769, 2.02396, 1, 1, 1, 1, 1,
0.1534257, -0.06088251, 2.249846, 1, 1, 1, 1, 1,
0.1551972, 2.065801, -1.479953, 0, 0, 1, 1, 1,
0.1557401, -0.4522744, 3.7515, 1, 0, 0, 1, 1,
0.1560234, -0.1550314, 1.995702, 1, 0, 0, 1, 1,
0.1572542, -0.7759889, 0.8595189, 1, 0, 0, 1, 1,
0.1575768, 0.5467576, 0.1037155, 1, 0, 0, 1, 1,
0.160629, 0.4318864, -0.5674831, 1, 0, 0, 1, 1,
0.1621544, 1.268438, 0.4802607, 0, 0, 0, 1, 1,
0.1654584, -2.211151, 3.205811, 0, 0, 0, 1, 1,
0.1654616, 0.832622, 1.278668, 0, 0, 0, 1, 1,
0.1655188, -0.7957871, 1.762874, 0, 0, 0, 1, 1,
0.1700628, 0.4360395, 0.7296878, 0, 0, 0, 1, 1,
0.1711961, -1.796678, 3.481723, 0, 0, 0, 1, 1,
0.175274, -1.007646, 2.657075, 0, 0, 0, 1, 1,
0.1764064, 0.0779119, 2.357409, 1, 1, 1, 1, 1,
0.1793313, 0.1963632, 2.19664, 1, 1, 1, 1, 1,
0.1815602, -1.509206, 1.556557, 1, 1, 1, 1, 1,
0.1824514, -0.1421619, 1.827017, 1, 1, 1, 1, 1,
0.1850986, 1.19664, 0.1796706, 1, 1, 1, 1, 1,
0.1859367, 1.256724, -1.279548, 1, 1, 1, 1, 1,
0.1943006, 0.9180315, 2.078077, 1, 1, 1, 1, 1,
0.1956428, 0.3350832, 1.422346, 1, 1, 1, 1, 1,
0.1961968, 1.587869, 0.2481055, 1, 1, 1, 1, 1,
0.2035507, -1.541011, 2.679257, 1, 1, 1, 1, 1,
0.2114706, -1.121599, 2.677654, 1, 1, 1, 1, 1,
0.2140192, 1.538887, 0.9169186, 1, 1, 1, 1, 1,
0.2146307, -0.8760535, 1.598374, 1, 1, 1, 1, 1,
0.214957, -0.8351297, 4.394393, 1, 1, 1, 1, 1,
0.2157473, -2.576747, 2.562796, 1, 1, 1, 1, 1,
0.2185688, -0.1385821, 3.79823, 0, 0, 1, 1, 1,
0.218956, -0.4067864, 2.371227, 1, 0, 0, 1, 1,
0.2194998, 0.220438, -0.3026711, 1, 0, 0, 1, 1,
0.220324, 0.8742395, 1.906775, 1, 0, 0, 1, 1,
0.2257378, -0.3723257, 2.231362, 1, 0, 0, 1, 1,
0.2282574, -0.313737, 2.534548, 1, 0, 0, 1, 1,
0.2304033, -2.555354, 4.29019, 0, 0, 0, 1, 1,
0.2379562, -0.1509015, 1.749669, 0, 0, 0, 1, 1,
0.2391573, -1.877926, 3.117614, 0, 0, 0, 1, 1,
0.2395987, 0.9425833, -0.3591163, 0, 0, 0, 1, 1,
0.2458655, 1.263995, -0.5486194, 0, 0, 0, 1, 1,
0.2530307, 1.317329, -1.108171, 0, 0, 0, 1, 1,
0.2545174, -0.194062, 0.8803955, 0, 0, 0, 1, 1,
0.2558628, 1.605133, -1.045987, 1, 1, 1, 1, 1,
0.256238, 0.7003787, -0.701787, 1, 1, 1, 1, 1,
0.2637355, -1.75019, 2.935386, 1, 1, 1, 1, 1,
0.2644118, 1.128781, -0.5699835, 1, 1, 1, 1, 1,
0.2667637, -1.518323, 4.304246, 1, 1, 1, 1, 1,
0.2693092, -0.1982896, 2.209724, 1, 1, 1, 1, 1,
0.2726922, 0.6183298, -1.073495, 1, 1, 1, 1, 1,
0.2765017, 1.29611, -0.8572856, 1, 1, 1, 1, 1,
0.2784673, -0.5745721, 1.132967, 1, 1, 1, 1, 1,
0.2816304, 0.1172796, 1.981128, 1, 1, 1, 1, 1,
0.2820626, 0.5276961, 2.849622, 1, 1, 1, 1, 1,
0.2833278, 0.7142837, 0.7517617, 1, 1, 1, 1, 1,
0.2860331, -0.5709074, 1.026646, 1, 1, 1, 1, 1,
0.2969515, -1.166468, 2.215697, 1, 1, 1, 1, 1,
0.2970649, -1.101244, 3.882043, 1, 1, 1, 1, 1,
0.2978306, 0.495318, 0.2369294, 0, 0, 1, 1, 1,
0.2999462, -0.2668622, 1.893015, 1, 0, 0, 1, 1,
0.3024477, -0.2829559, 3.678406, 1, 0, 0, 1, 1,
0.3045547, -0.06153317, 3.184133, 1, 0, 0, 1, 1,
0.3048584, -0.8399954, 1.282162, 1, 0, 0, 1, 1,
0.306221, 0.9545578, 1.763027, 1, 0, 0, 1, 1,
0.3065647, 1.261209, 1.885003, 0, 0, 0, 1, 1,
0.3079452, -0.599731, 1.637589, 0, 0, 0, 1, 1,
0.3122514, -1.144155, 1.879639, 0, 0, 0, 1, 1,
0.3179977, 1.519191, -0.1544232, 0, 0, 0, 1, 1,
0.3188514, -0.6582486, 3.071004, 0, 0, 0, 1, 1,
0.3214715, 0.6408195, 0.1097495, 0, 0, 0, 1, 1,
0.3215382, -1.112971, 1.806739, 0, 0, 0, 1, 1,
0.3221854, -1.543461, 1.39117, 1, 1, 1, 1, 1,
0.3252553, 0.2133203, -0.2077239, 1, 1, 1, 1, 1,
0.3263654, 0.004520528, 2.450624, 1, 1, 1, 1, 1,
0.3295807, -0.2475583, 1.806714, 1, 1, 1, 1, 1,
0.3372526, 0.9202066, 0.6259117, 1, 1, 1, 1, 1,
0.3409795, -0.8047253, 0.7606759, 1, 1, 1, 1, 1,
0.3414852, 0.2456766, -1.021538, 1, 1, 1, 1, 1,
0.34214, -1.790493, 4.012778, 1, 1, 1, 1, 1,
0.3439957, -0.5703614, 2.756349, 1, 1, 1, 1, 1,
0.3447519, 0.1597189, 0.2547755, 1, 1, 1, 1, 1,
0.3458319, 0.06763646, 1.897879, 1, 1, 1, 1, 1,
0.3508859, 0.4913399, 2.588668, 1, 1, 1, 1, 1,
0.3517461, -0.8929765, 2.388223, 1, 1, 1, 1, 1,
0.3533876, 0.3475544, -0.5775746, 1, 1, 1, 1, 1,
0.3534478, 1.360081, 1.676166, 1, 1, 1, 1, 1,
0.3542411, -0.5328295, 1.800521, 0, 0, 1, 1, 1,
0.358128, 1.616916, -0.7229428, 1, 0, 0, 1, 1,
0.3583903, 0.07092029, 0.08705316, 1, 0, 0, 1, 1,
0.3638391, -1.964741, 4.409355, 1, 0, 0, 1, 1,
0.3712436, 1.724631, 1.265809, 1, 0, 0, 1, 1,
0.3743736, 0.8063575, 2.334392, 1, 0, 0, 1, 1,
0.3781587, -0.1925911, 2.234096, 0, 0, 0, 1, 1,
0.3824735, -1.131907, 1.915484, 0, 0, 0, 1, 1,
0.3826574, -0.1563441, 2.643616, 0, 0, 0, 1, 1,
0.3838429, -1.361743, 5.028059, 0, 0, 0, 1, 1,
0.3926177, -0.3558906, 1.796532, 0, 0, 0, 1, 1,
0.3932309, 2.344563, -0.01747118, 0, 0, 0, 1, 1,
0.3946704, -1.517238, 3.458553, 0, 0, 0, 1, 1,
0.3983724, -0.429231, 2.687581, 1, 1, 1, 1, 1,
0.3990458, 1.351032, 1.823165, 1, 1, 1, 1, 1,
0.40629, 0.8278359, -0.5995969, 1, 1, 1, 1, 1,
0.4152764, -0.4201691, 3.021662, 1, 1, 1, 1, 1,
0.4174224, -0.1456473, 1.311796, 1, 1, 1, 1, 1,
0.4198308, 0.005328336, 1.219123, 1, 1, 1, 1, 1,
0.4217642, -0.628196, 4.539763, 1, 1, 1, 1, 1,
0.423251, -0.2395165, 2.525668, 1, 1, 1, 1, 1,
0.4252746, -0.665063, 4.028111, 1, 1, 1, 1, 1,
0.4274382, -0.1024132, 1.024423, 1, 1, 1, 1, 1,
0.4343378, -0.2340769, 3.379858, 1, 1, 1, 1, 1,
0.4365321, -1.408076, 4.494275, 1, 1, 1, 1, 1,
0.4447991, -0.8685366, 4.657953, 1, 1, 1, 1, 1,
0.4453863, -1.281431, 3.813927, 1, 1, 1, 1, 1,
0.445677, 1.008147, 0.1603113, 1, 1, 1, 1, 1,
0.4470232, -1.151292, 1.539833, 0, 0, 1, 1, 1,
0.4480069, 0.8343607, 0.9602543, 1, 0, 0, 1, 1,
0.451034, 0.2659535, 2.201138, 1, 0, 0, 1, 1,
0.4534386, -0.3811325, 2.638559, 1, 0, 0, 1, 1,
0.4618571, -0.4812031, 3.855256, 1, 0, 0, 1, 1,
0.4632948, -0.08297817, 0.5448439, 1, 0, 0, 1, 1,
0.4668117, 0.2992119, 0.7705772, 0, 0, 0, 1, 1,
0.4679702, 0.4253733, 1.44673, 0, 0, 0, 1, 1,
0.4686233, -0.6753175, 3.747333, 0, 0, 0, 1, 1,
0.4702462, 0.2307313, 2.798745, 0, 0, 0, 1, 1,
0.4706671, -0.1238142, 1.10079, 0, 0, 0, 1, 1,
0.4712825, -2.068419, 1.498147, 0, 0, 0, 1, 1,
0.4722181, 1.266668, 1.118852, 0, 0, 0, 1, 1,
0.4722229, 1.046043, 0.5119243, 1, 1, 1, 1, 1,
0.4733797, 0.873868, 1.006178, 1, 1, 1, 1, 1,
0.4753961, -0.1789182, 2.786416, 1, 1, 1, 1, 1,
0.4762405, -0.419666, 1.447796, 1, 1, 1, 1, 1,
0.4814308, 0.2580329, 1.351654, 1, 1, 1, 1, 1,
0.4830427, 0.5545152, 0.4118816, 1, 1, 1, 1, 1,
0.4881224, -0.5312474, 2.478049, 1, 1, 1, 1, 1,
0.494895, 0.6784919, 1.076165, 1, 1, 1, 1, 1,
0.4956452, 0.3736963, 0.691737, 1, 1, 1, 1, 1,
0.4979787, 2.676394, 0.197611, 1, 1, 1, 1, 1,
0.499789, 1.691626, 0.2197101, 1, 1, 1, 1, 1,
0.5071455, -1.744263, 2.048778, 1, 1, 1, 1, 1,
0.5091109, 0.2589109, 0.1294556, 1, 1, 1, 1, 1,
0.5139604, -0.3140265, 1.997973, 1, 1, 1, 1, 1,
0.514256, -0.3739116, 3.634374, 1, 1, 1, 1, 1,
0.5196158, 0.7751956, 0.9146267, 0, 0, 1, 1, 1,
0.5196738, -0.3212759, 3.3874, 1, 0, 0, 1, 1,
0.5200412, 0.548012, 1.171725, 1, 0, 0, 1, 1,
0.5202217, -0.2681315, 2.579991, 1, 0, 0, 1, 1,
0.5246748, -1.324909, 2.196933, 1, 0, 0, 1, 1,
0.5327098, -0.1241918, 1.726544, 1, 0, 0, 1, 1,
0.5350467, 0.5268645, -0.4113276, 0, 0, 0, 1, 1,
0.5413356, 0.3143194, -0.426274, 0, 0, 0, 1, 1,
0.5438451, -0.3478523, 1.178108, 0, 0, 0, 1, 1,
0.5446976, 0.7571168, -0.2482709, 0, 0, 0, 1, 1,
0.5472623, -0.9852464, 2.168756, 0, 0, 0, 1, 1,
0.547863, 0.4950041, 0.6717886, 0, 0, 0, 1, 1,
0.5480312, 0.5296044, 0.1924852, 0, 0, 0, 1, 1,
0.5489876, -0.08569353, 1.5389, 1, 1, 1, 1, 1,
0.5511141, 0.8779207, 0.5923016, 1, 1, 1, 1, 1,
0.5514421, -0.7522577, 2.970249, 1, 1, 1, 1, 1,
0.5534726, -0.6397322, 3.291315, 1, 1, 1, 1, 1,
0.5707315, -0.4920733, 2.135629, 1, 1, 1, 1, 1,
0.5709287, 0.2112202, 1.964576, 1, 1, 1, 1, 1,
0.5709445, 0.3165393, -1.271585, 1, 1, 1, 1, 1,
0.5722347, 0.9830521, 0.5606283, 1, 1, 1, 1, 1,
0.5742587, -0.4117523, 3.44434, 1, 1, 1, 1, 1,
0.5760642, -1.051523, 2.401567, 1, 1, 1, 1, 1,
0.5842569, 0.5479944, 0.4043344, 1, 1, 1, 1, 1,
0.5934187, -0.5298119, 2.930142, 1, 1, 1, 1, 1,
0.5979585, 0.0351146, 1.293158, 1, 1, 1, 1, 1,
0.6028084, -0.1065832, 1.978761, 1, 1, 1, 1, 1,
0.6035439, -1.001312, 0.844473, 1, 1, 1, 1, 1,
0.6126021, 2.430976, 0.7017548, 0, 0, 1, 1, 1,
0.6129358, -1.132192, 2.566356, 1, 0, 0, 1, 1,
0.6148175, -0.2829602, 1.221186, 1, 0, 0, 1, 1,
0.6158385, 0.8787692, 0.8106699, 1, 0, 0, 1, 1,
0.6199954, 1.443055, 0.1361279, 1, 0, 0, 1, 1,
0.6209967, -0.2868563, 0.9992294, 1, 0, 0, 1, 1,
0.6227804, -1.558584, 3.255271, 0, 0, 0, 1, 1,
0.6287869, 0.2948346, 0.9988518, 0, 0, 0, 1, 1,
0.633552, -0.7538593, 1.83034, 0, 0, 0, 1, 1,
0.6379201, -0.9185826, 3.174939, 0, 0, 0, 1, 1,
0.6402078, 0.9925463, 0.2487489, 0, 0, 0, 1, 1,
0.6510355, -2.165817, 3.094971, 0, 0, 0, 1, 1,
0.6524168, 1.389415, 1.089259, 0, 0, 0, 1, 1,
0.6578671, -0.5122225, 2.231929, 1, 1, 1, 1, 1,
0.6589202, 0.5513443, 2.046911, 1, 1, 1, 1, 1,
0.659395, -0.4001813, 3.096015, 1, 1, 1, 1, 1,
0.6678259, -0.4390661, 2.677451, 1, 1, 1, 1, 1,
0.6711297, 0.3943864, 1.854777, 1, 1, 1, 1, 1,
0.6725225, -0.1047902, 0.9042991, 1, 1, 1, 1, 1,
0.6757849, -1.536889, 2.538245, 1, 1, 1, 1, 1,
0.6761012, -0.3644514, 1.113299, 1, 1, 1, 1, 1,
0.6840836, 0.1071909, 0.4657297, 1, 1, 1, 1, 1,
0.692964, -0.5107213, 3.328362, 1, 1, 1, 1, 1,
0.695049, 0.7326542, 0.05523758, 1, 1, 1, 1, 1,
0.6956486, 0.7120127, 1.212758, 1, 1, 1, 1, 1,
0.6985078, 0.6055652, 2.81063, 1, 1, 1, 1, 1,
0.7067635, 1.883844, -0.4809504, 1, 1, 1, 1, 1,
0.7073314, -0.4476386, 2.520929, 1, 1, 1, 1, 1,
0.7082555, 1.143066, -1.034215, 0, 0, 1, 1, 1,
0.7085238, -0.5701161, 0.8495433, 1, 0, 0, 1, 1,
0.7129953, 0.2463051, 0.0428995, 1, 0, 0, 1, 1,
0.7154308, 0.7170944, 1.834351, 1, 0, 0, 1, 1,
0.7223115, 0.5680786, 0.5835441, 1, 0, 0, 1, 1,
0.7243257, 1.252785, 0.2357531, 1, 0, 0, 1, 1,
0.7369384, 0.5963802, 1.061219, 0, 0, 0, 1, 1,
0.7374129, 0.1093707, 1.365591, 0, 0, 0, 1, 1,
0.7378084, 0.771314, 1.058932, 0, 0, 0, 1, 1,
0.7380295, -1.25941, 2.172824, 0, 0, 0, 1, 1,
0.7395166, 0.3306091, 0.1012034, 0, 0, 0, 1, 1,
0.740519, 0.107256, 1.216494, 0, 0, 0, 1, 1,
0.742415, -0.2678853, 1.060251, 0, 0, 0, 1, 1,
0.7464662, -0.7014039, 2.227085, 1, 1, 1, 1, 1,
0.7552223, 0.6167687, 0.4649553, 1, 1, 1, 1, 1,
0.7600582, -1.039673, 1.913817, 1, 1, 1, 1, 1,
0.7617491, -0.09041607, 2.028507, 1, 1, 1, 1, 1,
0.7630892, 2.439866, -0.7085975, 1, 1, 1, 1, 1,
0.7631044, 0.07647715, 2.250221, 1, 1, 1, 1, 1,
0.765429, 0.4352684, 2.212402, 1, 1, 1, 1, 1,
0.7738895, 0.9190639, 1.984946, 1, 1, 1, 1, 1,
0.775198, -0.01819153, 1.431288, 1, 1, 1, 1, 1,
0.7753648, 1.010448, 0.6180145, 1, 1, 1, 1, 1,
0.7776618, -1.045733, 3.734414, 1, 1, 1, 1, 1,
0.7794033, 0.1800878, 1.838449, 1, 1, 1, 1, 1,
0.7809094, -1.582428, 3.233261, 1, 1, 1, 1, 1,
0.7811331, 1.058786, 0.3862537, 1, 1, 1, 1, 1,
0.7869771, -0.6388658, 2.841055, 1, 1, 1, 1, 1,
0.7888425, 1.811205, 0.3284909, 0, 0, 1, 1, 1,
0.7930614, -0.4724478, 3.033232, 1, 0, 0, 1, 1,
0.7938022, -0.6146857, 1.521949, 1, 0, 0, 1, 1,
0.7953524, -0.301025, 2.496748, 1, 0, 0, 1, 1,
0.7991541, 0.8604116, 1.9744, 1, 0, 0, 1, 1,
0.7998332, 0.8412488, -0.2978439, 1, 0, 0, 1, 1,
0.8082191, -0.5507224, 2.252086, 0, 0, 0, 1, 1,
0.8083366, 0.5209203, 0.743783, 0, 0, 0, 1, 1,
0.8103772, -0.7712153, 2.985724, 0, 0, 0, 1, 1,
0.81583, 0.3938233, 0.858602, 0, 0, 0, 1, 1,
0.819803, 0.3898295, 1.453612, 0, 0, 0, 1, 1,
0.8325239, 0.8769298, 0.4642027, 0, 0, 0, 1, 1,
0.8335182, -0.9523476, 3.523088, 0, 0, 0, 1, 1,
0.8353446, -0.1444109, 3.259412, 1, 1, 1, 1, 1,
0.8413742, -1.439185, 2.170589, 1, 1, 1, 1, 1,
0.8422345, 0.5992674, -0.9472826, 1, 1, 1, 1, 1,
0.8428357, -0.1544588, 1.557758, 1, 1, 1, 1, 1,
0.8438305, 0.2667281, 0.7310662, 1, 1, 1, 1, 1,
0.8458328, -0.9312002, 2.231774, 1, 1, 1, 1, 1,
0.8479527, 0.9910895, 0.02066227, 1, 1, 1, 1, 1,
0.8483964, -0.8799381, 2.483207, 1, 1, 1, 1, 1,
0.8498209, 0.3262331, 1.835044, 1, 1, 1, 1, 1,
0.8504973, -0.2462606, 0.6955275, 1, 1, 1, 1, 1,
0.8558407, 1.78839, -0.1672223, 1, 1, 1, 1, 1,
0.8563043, 1.151344, 2.083681, 1, 1, 1, 1, 1,
0.8654402, 1.026529, 0.2185257, 1, 1, 1, 1, 1,
0.8674568, 0.559306, 3.352295, 1, 1, 1, 1, 1,
0.8876678, -0.6683279, 2.321852, 1, 1, 1, 1, 1,
0.8901141, 0.3166934, 2.172518, 0, 0, 1, 1, 1,
0.8904678, -1.400113, 1.501, 1, 0, 0, 1, 1,
0.9004522, -1.271697, 2.824615, 1, 0, 0, 1, 1,
0.9037382, 2.865342, -0.09660089, 1, 0, 0, 1, 1,
0.9039576, -0.3781103, 2.697357, 1, 0, 0, 1, 1,
0.905757, -0.9134119, 1.007899, 1, 0, 0, 1, 1,
0.9138042, -0.2367426, 0.7278297, 0, 0, 0, 1, 1,
0.9284697, -0.9695243, 2.209499, 0, 0, 0, 1, 1,
0.9293662, 0.7112553, 0.4551218, 0, 0, 0, 1, 1,
0.9353154, -0.1900804, 1.849169, 0, 0, 0, 1, 1,
0.9358843, 0.5692387, 0.104522, 0, 0, 0, 1, 1,
0.9371428, 0.3871217, 2.476912, 0, 0, 0, 1, 1,
0.9379044, 0.4025353, 1.739907, 0, 0, 0, 1, 1,
0.9532145, -0.7096255, 0.6745341, 1, 1, 1, 1, 1,
0.9536288, 0.03567573, 1.553165, 1, 1, 1, 1, 1,
0.9555253, -0.05728928, 0.963625, 1, 1, 1, 1, 1,
0.9565187, -0.8107917, 2.933715, 1, 1, 1, 1, 1,
0.9581632, 0.6343967, 0.9967124, 1, 1, 1, 1, 1,
0.9677101, 0.8000519, 1.560352, 1, 1, 1, 1, 1,
0.9697004, 0.06570577, 2.114192, 1, 1, 1, 1, 1,
0.9733955, 0.7170409, 1.487556, 1, 1, 1, 1, 1,
0.9765993, -1.214565, 1.951171, 1, 1, 1, 1, 1,
0.9837629, 0.6158245, 1.629629, 1, 1, 1, 1, 1,
0.9875702, 0.6563457, -0.9054523, 1, 1, 1, 1, 1,
0.9876654, -0.4868739, 1.409246, 1, 1, 1, 1, 1,
0.9880283, 0.6679554, -0.1702133, 1, 1, 1, 1, 1,
0.990321, -1.822348, 2.850878, 1, 1, 1, 1, 1,
0.9948316, -1.876448, 2.921566, 1, 1, 1, 1, 1,
0.9968433, -0.6441441, 2.453503, 0, 0, 1, 1, 1,
1.006896, -0.3193402, 2.417988, 1, 0, 0, 1, 1,
1.009569, 0.8512045, 0.7365937, 1, 0, 0, 1, 1,
1.032898, 1.003246, 0.1869961, 1, 0, 0, 1, 1,
1.03317, -0.9675645, 1.491034, 1, 0, 0, 1, 1,
1.034455, 0.1759071, 2.421201, 1, 0, 0, 1, 1,
1.034618, 0.2754292, 0.3181733, 0, 0, 0, 1, 1,
1.036053, 0.2301332, 2.251872, 0, 0, 0, 1, 1,
1.037833, 0.01813497, -0.4196821, 0, 0, 0, 1, 1,
1.041557, -1.666725, 1.502976, 0, 0, 0, 1, 1,
1.048547, -0.7086406, 2.554411, 0, 0, 0, 1, 1,
1.049368, -0.3451972, 0.439003, 0, 0, 0, 1, 1,
1.050745, 0.8537866, 0.4432777, 0, 0, 0, 1, 1,
1.057474, -0.979457, 1.569109, 1, 1, 1, 1, 1,
1.058511, -0.6286877, 3.813992, 1, 1, 1, 1, 1,
1.061369, -0.5996994, 2.002059, 1, 1, 1, 1, 1,
1.066349, 0.9875891, -0.7711729, 1, 1, 1, 1, 1,
1.075162, 1.285169, 0.6893895, 1, 1, 1, 1, 1,
1.079702, 0.7157248, 2.376593, 1, 1, 1, 1, 1,
1.079803, 1.282583, 2.025713, 1, 1, 1, 1, 1,
1.081708, -1.549311, 1.386462, 1, 1, 1, 1, 1,
1.08527, 1.061921, 0.4866534, 1, 1, 1, 1, 1,
1.089269, 0.8508037, 1.234368, 1, 1, 1, 1, 1,
1.094891, 0.7982599, 0.6137386, 1, 1, 1, 1, 1,
1.097991, 1.903626, -0.73545, 1, 1, 1, 1, 1,
1.098216, 0.1217242, 1.688246, 1, 1, 1, 1, 1,
1.109549, 0.9595029, 0.6072124, 1, 1, 1, 1, 1,
1.121939, 0.6536911, 1.595295, 1, 1, 1, 1, 1,
1.125539, -0.5905495, 2.484411, 0, 0, 1, 1, 1,
1.128054, 0.4479027, 1.020383, 1, 0, 0, 1, 1,
1.129853, 0.06382998, 3.646716, 1, 0, 0, 1, 1,
1.13196, -0.1021822, -0.2117908, 1, 0, 0, 1, 1,
1.132463, -0.3923889, 1.772034, 1, 0, 0, 1, 1,
1.139385, -1.189677, 2.235819, 1, 0, 0, 1, 1,
1.143722, 0.3252719, 2.024126, 0, 0, 0, 1, 1,
1.152981, -0.1611088, 2.091594, 0, 0, 0, 1, 1,
1.154374, 0.08080889, 0.5207088, 0, 0, 0, 1, 1,
1.156011, 0.5234321, 1.628416, 0, 0, 0, 1, 1,
1.167305, 0.8203776, 0.5325533, 0, 0, 0, 1, 1,
1.171436, 0.2851466, 2.210289, 0, 0, 0, 1, 1,
1.177301, 0.7148639, 1.724811, 0, 0, 0, 1, 1,
1.177991, -0.2151591, 2.173006, 1, 1, 1, 1, 1,
1.181622, -1.135268, 2.077009, 1, 1, 1, 1, 1,
1.189166, 1.019462, 2.267359, 1, 1, 1, 1, 1,
1.200853, 0.3813869, 0.4156692, 1, 1, 1, 1, 1,
1.202719, 0.9619841, 0.764416, 1, 1, 1, 1, 1,
1.214551, 0.569815, 0.5707744, 1, 1, 1, 1, 1,
1.216776, 0.7968546, 0.8073348, 1, 1, 1, 1, 1,
1.218806, 0.08551799, 1.648935, 1, 1, 1, 1, 1,
1.219099, -0.03146049, 1.685048, 1, 1, 1, 1, 1,
1.221026, 0.2625707, 0.4498098, 1, 1, 1, 1, 1,
1.228877, 0.4911028, 0.3920653, 1, 1, 1, 1, 1,
1.229563, -1.036411, 3.583202, 1, 1, 1, 1, 1,
1.237291, -0.6757225, 1.384678, 1, 1, 1, 1, 1,
1.242622, -1.591909, 1.837434, 1, 1, 1, 1, 1,
1.246394, -0.02920611, 2.159506, 1, 1, 1, 1, 1,
1.247342, -1.765924, 2.091013, 0, 0, 1, 1, 1,
1.252907, 2.142471, 1.826388, 1, 0, 0, 1, 1,
1.260996, 0.7106468, 2.147724, 1, 0, 0, 1, 1,
1.262391, 0.2868596, 1.25172, 1, 0, 0, 1, 1,
1.268583, 0.7579882, 2.091663, 1, 0, 0, 1, 1,
1.278444, 2.101385, 1.126944, 1, 0, 0, 1, 1,
1.281007, 1.570967, 1.521203, 0, 0, 0, 1, 1,
1.300886, -0.6142898, 0.9991241, 0, 0, 0, 1, 1,
1.311896, 0.5954918, -1.242962, 0, 0, 0, 1, 1,
1.330455, -1.27676, 1.532347, 0, 0, 0, 1, 1,
1.34089, 0.3976804, 0.5934182, 0, 0, 0, 1, 1,
1.353127, -0.647638, 3.587413, 0, 0, 0, 1, 1,
1.355792, -0.2143323, 2.132396, 0, 0, 0, 1, 1,
1.358941, 0.1456692, 1.985239, 1, 1, 1, 1, 1,
1.359057, 0.1469896, 1.927159, 1, 1, 1, 1, 1,
1.368631, -1.814005, 3.360956, 1, 1, 1, 1, 1,
1.369616, 0.9570805, 0.03102662, 1, 1, 1, 1, 1,
1.37193, -2.071509, 1.141647, 1, 1, 1, 1, 1,
1.376426, -0.8549435, 3.16165, 1, 1, 1, 1, 1,
1.37906, 0.8704521, 1.607901, 1, 1, 1, 1, 1,
1.381467, 0.9113649, 3.489311, 1, 1, 1, 1, 1,
1.383058, -2.205545, 2.261383, 1, 1, 1, 1, 1,
1.393431, -0.3642337, 1.46346, 1, 1, 1, 1, 1,
1.400274, 1.010962, 0.5308753, 1, 1, 1, 1, 1,
1.403053, -1.604442, 1.326046, 1, 1, 1, 1, 1,
1.410313, -0.9252103, 2.098918, 1, 1, 1, 1, 1,
1.414418, -0.7921501, 2.792103, 1, 1, 1, 1, 1,
1.425744, -1.444169, 1.195659, 1, 1, 1, 1, 1,
1.438376, -0.7130712, 2.690961, 0, 0, 1, 1, 1,
1.453955, 1.161317, 1.447209, 1, 0, 0, 1, 1,
1.454774, 0.2566417, 1.916495, 1, 0, 0, 1, 1,
1.467984, -0.1981072, 0.5641058, 1, 0, 0, 1, 1,
1.474017, -0.2100835, 2.647954, 1, 0, 0, 1, 1,
1.47606, 2.339847, 0.07289145, 1, 0, 0, 1, 1,
1.482028, 2.086658, 1.760898, 0, 0, 0, 1, 1,
1.485117, -0.1660628, 2.94801, 0, 0, 0, 1, 1,
1.49231, -0.5329916, 2.787165, 0, 0, 0, 1, 1,
1.499707, 1.273181, 0.4800909, 0, 0, 0, 1, 1,
1.501109, 1.659238, -0.5835778, 0, 0, 0, 1, 1,
1.520266, -0.5434854, 2.039504, 0, 0, 0, 1, 1,
1.52167, 1.105462, 1.263272, 0, 0, 0, 1, 1,
1.523581, 1.127455, 0.742334, 1, 1, 1, 1, 1,
1.525329, 1.028896, 1.785298, 1, 1, 1, 1, 1,
1.529804, -1.040073, -0.5933476, 1, 1, 1, 1, 1,
1.53987, 1.380198, 3.372422, 1, 1, 1, 1, 1,
1.546127, 1.000796, 2.119675, 1, 1, 1, 1, 1,
1.550817, 2.055337, 3.514346, 1, 1, 1, 1, 1,
1.562011, 0.4607725, 3.292929, 1, 1, 1, 1, 1,
1.572208, -0.06561197, 0.9801452, 1, 1, 1, 1, 1,
1.593274, -1.029336, 2.619764, 1, 1, 1, 1, 1,
1.593432, -0.13926, 0.3413806, 1, 1, 1, 1, 1,
1.606496, 1.480846, 1.099614, 1, 1, 1, 1, 1,
1.62324, 0.1698575, 2.270875, 1, 1, 1, 1, 1,
1.626052, 1.588556, 1.865348, 1, 1, 1, 1, 1,
1.643981, -0.6078362, 1.289753, 1, 1, 1, 1, 1,
1.654335, 1.325722, 0.954731, 1, 1, 1, 1, 1,
1.667581, 0.1030692, 2.53943, 0, 0, 1, 1, 1,
1.671364, 0.1894772, 1.640946, 1, 0, 0, 1, 1,
1.673586, 1.00503, 1.303865, 1, 0, 0, 1, 1,
1.683493, 1.340341, 2.151169, 1, 0, 0, 1, 1,
1.692872, -0.4596133, 0.7231711, 1, 0, 0, 1, 1,
1.697803, 0.6683511, 0.9923393, 1, 0, 0, 1, 1,
1.721473, 0.0979359, 1.705305, 0, 0, 0, 1, 1,
1.741286, -1.238515, 0.2830993, 0, 0, 0, 1, 1,
1.742181, -0.5140112, 2.910228, 0, 0, 0, 1, 1,
1.748364, 0.2249526, 2.063589, 0, 0, 0, 1, 1,
1.759988, 0.1968089, 1.429816, 0, 0, 0, 1, 1,
1.772581, 0.3768022, 0.7061728, 0, 0, 0, 1, 1,
1.782166, 1.278337, 1.215788, 0, 0, 0, 1, 1,
1.786642, -0.3127236, 1.502894, 1, 1, 1, 1, 1,
1.809476, -2.540157, 3.665498, 1, 1, 1, 1, 1,
1.860952, 0.1118172, 0.7658528, 1, 1, 1, 1, 1,
1.88527, -0.4871216, -0.6430717, 1, 1, 1, 1, 1,
1.889281, -0.3324147, 0.6417006, 1, 1, 1, 1, 1,
1.89141, 0.1819573, 1.566491, 1, 1, 1, 1, 1,
1.893224, -0.8533792, 0.1468757, 1, 1, 1, 1, 1,
1.900346, 0.1803899, 2.596364, 1, 1, 1, 1, 1,
1.919914, 0.0164778, 0.8500174, 1, 1, 1, 1, 1,
1.929209, -0.8364284, 3.164615, 1, 1, 1, 1, 1,
1.964813, 0.9081553, -0.05350866, 1, 1, 1, 1, 1,
1.984698, -0.3136193, 2.348461, 1, 1, 1, 1, 1,
1.985247, 0.1856707, 2.068436, 1, 1, 1, 1, 1,
2.016662, 0.5952641, 1.63407, 1, 1, 1, 1, 1,
2.032537, -0.9719222, 2.319172, 1, 1, 1, 1, 1,
2.058379, 0.07713594, 1.029076, 0, 0, 1, 1, 1,
2.070602, -0.5583137, 3.981929, 1, 0, 0, 1, 1,
2.108425, -1.169781, 1.521688, 1, 0, 0, 1, 1,
2.139292, 0.4842537, 1.385313, 1, 0, 0, 1, 1,
2.177432, -0.7186827, 2.407209, 1, 0, 0, 1, 1,
2.258453, -1.049046, 1.097055, 1, 0, 0, 1, 1,
2.26264, -1.614791, 2.31318, 0, 0, 0, 1, 1,
2.27527, 0.0122099, 1.193162, 0, 0, 0, 1, 1,
2.325574, 0.8337632, 0.2274903, 0, 0, 0, 1, 1,
2.332798, 0.5427575, 2.189637, 0, 0, 0, 1, 1,
2.344262, 0.8325331, 1.107793, 0, 0, 0, 1, 1,
2.40622, 0.003660568, 1.180805, 0, 0, 0, 1, 1,
2.467474, 0.2649928, 0.7347704, 0, 0, 0, 1, 1,
2.5442, 0.1928449, 3.382748, 1, 1, 1, 1, 1,
2.565079, -0.06779049, 2.403857, 1, 1, 1, 1, 1,
2.625145, -0.9507768, 1.602822, 1, 1, 1, 1, 1,
2.712824, 2.334625, 2.675645, 1, 1, 1, 1, 1,
2.741108, -0.2260454, 3.60907, 1, 1, 1, 1, 1,
2.835351, 0.4407359, 1.296505, 1, 1, 1, 1, 1,
2.924892, 0.5584456, 2.614464, 1, 1, 1, 1, 1
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
var radius = 9.689637;
var distance = 34.03444;
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
mvMatrix.translate( 0.3352712, -0.1927323, -0.5046918 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03444);
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
