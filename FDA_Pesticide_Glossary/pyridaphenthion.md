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
-3.281929, -0.6994539, -2.156506, 1, 0, 0, 1,
-3.02789, 1.517609, -2.846184, 1, 0.007843138, 0, 1,
-2.619519, 0.6201618, -1.089199, 1, 0.01176471, 0, 1,
-2.587414, -0.5937214, -0.9508976, 1, 0.01960784, 0, 1,
-2.49076, -1.128911, -1.370021, 1, 0.02352941, 0, 1,
-2.482191, -0.2202158, -2.950753, 1, 0.03137255, 0, 1,
-2.405299, -0.08946038, -1.750649, 1, 0.03529412, 0, 1,
-2.357866, 0.2609515, 0.1632807, 1, 0.04313726, 0, 1,
-2.305535, 1.179707, -0.7538131, 1, 0.04705882, 0, 1,
-2.302459, 0.05373453, -0.7864308, 1, 0.05490196, 0, 1,
-2.300046, -0.4086443, -0.08633102, 1, 0.05882353, 0, 1,
-2.298432, -0.8382185, -2.083627, 1, 0.06666667, 0, 1,
-2.259922, -0.4547178, -1.877704, 1, 0.07058824, 0, 1,
-2.247111, 0.8109719, -0.8209536, 1, 0.07843138, 0, 1,
-2.209343, -0.3205011, -1.513217, 1, 0.08235294, 0, 1,
-2.208928, -0.3784285, -2.081712, 1, 0.09019608, 0, 1,
-2.200817, -0.05324224, -2.113008, 1, 0.09411765, 0, 1,
-2.198693, 0.2469243, -1.577094, 1, 0.1019608, 0, 1,
-2.183507, -1.561315, -1.094518, 1, 0.1098039, 0, 1,
-2.178633, -2.083937, -1.876848, 1, 0.1137255, 0, 1,
-2.174486, 1.857622, -1.971254, 1, 0.1215686, 0, 1,
-2.163026, 0.03547701, -1.659903, 1, 0.1254902, 0, 1,
-2.153007, -1.066153, -2.482172, 1, 0.1333333, 0, 1,
-2.14368, -1.19078, -1.64478, 1, 0.1372549, 0, 1,
-2.107194, 1.086943, 0.7127748, 1, 0.145098, 0, 1,
-2.090455, 0.4490974, -0.8916317, 1, 0.1490196, 0, 1,
-2.080385, -0.2718882, -2.317462, 1, 0.1568628, 0, 1,
-2.066187, -0.3305279, -2.680909, 1, 0.1607843, 0, 1,
-2.063001, 0.6061486, -1.221407, 1, 0.1686275, 0, 1,
-2.040254, 0.2726429, -1.819876, 1, 0.172549, 0, 1,
-2.034639, -0.3990785, -3.481276, 1, 0.1803922, 0, 1,
-1.992859, 1.494948, 0.1133792, 1, 0.1843137, 0, 1,
-1.98222, -2.409556, -1.347406, 1, 0.1921569, 0, 1,
-1.942649, 0.05326842, -2.399142, 1, 0.1960784, 0, 1,
-1.923927, 1.188669, -2.86749, 1, 0.2039216, 0, 1,
-1.891246, 0.130292, -3.1961, 1, 0.2117647, 0, 1,
-1.863519, -0.6678612, -1.667418, 1, 0.2156863, 0, 1,
-1.855352, -1.543448, -3.183185, 1, 0.2235294, 0, 1,
-1.84687, -0.6398605, -1.527422, 1, 0.227451, 0, 1,
-1.827599, 0.04156929, -2.554323, 1, 0.2352941, 0, 1,
-1.811942, -1.740453, -2.441184, 1, 0.2392157, 0, 1,
-1.802915, -0.3494914, -2.192089, 1, 0.2470588, 0, 1,
-1.791123, 1.313897, 0.5488552, 1, 0.2509804, 0, 1,
-1.786362, -1.146368, -2.449234, 1, 0.2588235, 0, 1,
-1.780066, 0.7055539, -2.261257, 1, 0.2627451, 0, 1,
-1.776918, -1.074203, -0.2768604, 1, 0.2705882, 0, 1,
-1.770962, -1.650224, -1.86394, 1, 0.2745098, 0, 1,
-1.766225, -0.8736787, -1.683733, 1, 0.282353, 0, 1,
-1.761701, -2.214912, -3.260239, 1, 0.2862745, 0, 1,
-1.746459, 0.482913, -2.229508, 1, 0.2941177, 0, 1,
-1.7377, -0.7654873, -2.009331, 1, 0.3019608, 0, 1,
-1.736236, 0.407658, -1.63558, 1, 0.3058824, 0, 1,
-1.726105, -0.1589926, -0.9576918, 1, 0.3137255, 0, 1,
-1.722044, 0.5691701, -2.713575, 1, 0.3176471, 0, 1,
-1.702245, 1.795266, -2.228511, 1, 0.3254902, 0, 1,
-1.696105, 0.825855, -2.162167, 1, 0.3294118, 0, 1,
-1.688154, 0.761512, -1.673864, 1, 0.3372549, 0, 1,
-1.686452, 0.2069872, -1.321791, 1, 0.3411765, 0, 1,
-1.647616, 0.1860811, -0.5473254, 1, 0.3490196, 0, 1,
-1.640282, 0.6757077, -1.245197, 1, 0.3529412, 0, 1,
-1.638227, 0.5205668, -1.474133, 1, 0.3607843, 0, 1,
-1.63535, -0.6780716, -2.046235, 1, 0.3647059, 0, 1,
-1.63259, -0.05376168, -2.538341, 1, 0.372549, 0, 1,
-1.608325, -0.226043, -1.263247, 1, 0.3764706, 0, 1,
-1.578198, -0.2746944, -1.556675, 1, 0.3843137, 0, 1,
-1.568686, -1.592304, -3.107285, 1, 0.3882353, 0, 1,
-1.557046, -0.7405039, -1.816491, 1, 0.3960784, 0, 1,
-1.550562, -0.4704968, -1.535468, 1, 0.4039216, 0, 1,
-1.547841, 1.798982, 0.1558233, 1, 0.4078431, 0, 1,
-1.540723, -0.1057272, -0.2148805, 1, 0.4156863, 0, 1,
-1.532001, -1.49568, -3.500018, 1, 0.4196078, 0, 1,
-1.525508, -0.5678626, -1.090932, 1, 0.427451, 0, 1,
-1.521294, 2.489293, 0.4712513, 1, 0.4313726, 0, 1,
-1.50373, 2.583245, -0.4702906, 1, 0.4392157, 0, 1,
-1.480407, -1.142042, -2.172999, 1, 0.4431373, 0, 1,
-1.47088, -0.2564991, -0.719339, 1, 0.4509804, 0, 1,
-1.46858, 0.2595696, -0.8326685, 1, 0.454902, 0, 1,
-1.459494, 0.8405967, -0.594825, 1, 0.4627451, 0, 1,
-1.458785, -1.737979, -4.008634, 1, 0.4666667, 0, 1,
-1.457522, 0.125777, -3.744817, 1, 0.4745098, 0, 1,
-1.452338, 1.409443, -1.244409, 1, 0.4784314, 0, 1,
-1.452127, 0.2257788, -0.6157669, 1, 0.4862745, 0, 1,
-1.45024, 0.2981567, -1.10765, 1, 0.4901961, 0, 1,
-1.435863, 0.01961036, 0.09160504, 1, 0.4980392, 0, 1,
-1.425355, 0.5130152, -2.604081, 1, 0.5058824, 0, 1,
-1.421541, -0.9684372, -2.844724, 1, 0.509804, 0, 1,
-1.419796, -0.8357033, 0.361479, 1, 0.5176471, 0, 1,
-1.417185, -0.2646206, -2.521602, 1, 0.5215687, 0, 1,
-1.408687, 0.3523878, -2.199337, 1, 0.5294118, 0, 1,
-1.403935, -1.544408, -2.83443, 1, 0.5333334, 0, 1,
-1.403246, -0.3727819, -2.319221, 1, 0.5411765, 0, 1,
-1.400896, -1.956502, -1.844369, 1, 0.5450981, 0, 1,
-1.392175, -1.714883, -1.994648, 1, 0.5529412, 0, 1,
-1.391251, -2.451863, -4.028954, 1, 0.5568628, 0, 1,
-1.372001, 0.8201665, -0.6705475, 1, 0.5647059, 0, 1,
-1.35558, -0.2574618, -1.741702, 1, 0.5686275, 0, 1,
-1.3533, -0.2175206, -1.763364, 1, 0.5764706, 0, 1,
-1.344173, 1.225962, -1.390661, 1, 0.5803922, 0, 1,
-1.339153, 0.4117334, -2.727034, 1, 0.5882353, 0, 1,
-1.337631, -0.3315912, -1.186507, 1, 0.5921569, 0, 1,
-1.333619, -0.8351664, -3.033906, 1, 0.6, 0, 1,
-1.331588, 1.047002, 0.4345988, 1, 0.6078432, 0, 1,
-1.330287, 0.3634385, -1.137134, 1, 0.6117647, 0, 1,
-1.323247, -0.6140643, -3.027478, 1, 0.6196079, 0, 1,
-1.316025, -1.904844, -1.161173, 1, 0.6235294, 0, 1,
-1.312323, 0.970599, -1.965281, 1, 0.6313726, 0, 1,
-1.311747, 0.1203351, -2.664061, 1, 0.6352941, 0, 1,
-1.31077, -0.7833005, -1.930623, 1, 0.6431373, 0, 1,
-1.304532, -0.08015616, -1.8231, 1, 0.6470588, 0, 1,
-1.296185, -0.868177, -2.545189, 1, 0.654902, 0, 1,
-1.286119, 0.02002883, -0.9505192, 1, 0.6588235, 0, 1,
-1.282528, 1.466628, -2.832642, 1, 0.6666667, 0, 1,
-1.278988, 0.2402141, -1.466814, 1, 0.6705883, 0, 1,
-1.277377, 1.890637, 1.265376, 1, 0.6784314, 0, 1,
-1.276678, -1.106367, -4.341294, 1, 0.682353, 0, 1,
-1.271742, 1.203008, -0.3575858, 1, 0.6901961, 0, 1,
-1.25002, 1.400102, -1.99998, 1, 0.6941177, 0, 1,
-1.245987, -0.7592819, -2.470144, 1, 0.7019608, 0, 1,
-1.240514, 1.876078, -0.9653499, 1, 0.7098039, 0, 1,
-1.238389, -1.49521, -1.171588, 1, 0.7137255, 0, 1,
-1.236452, -0.2191026, -3.660599, 1, 0.7215686, 0, 1,
-1.231924, -1.930095, -2.865474, 1, 0.7254902, 0, 1,
-1.225451, 1.790675, -0.3227053, 1, 0.7333333, 0, 1,
-1.225351, -0.3547404, -1.855999, 1, 0.7372549, 0, 1,
-1.224451, 0.9359122, -0.528911, 1, 0.7450981, 0, 1,
-1.222279, -0.9901825, -1.795617, 1, 0.7490196, 0, 1,
-1.21862, 0.3002644, -0.6740412, 1, 0.7568628, 0, 1,
-1.215808, 0.0246545, -2.543966, 1, 0.7607843, 0, 1,
-1.215392, 0.09746329, -3.74785, 1, 0.7686275, 0, 1,
-1.212719, -0.02274415, -1.251173, 1, 0.772549, 0, 1,
-1.204377, 1.068966, -0.8300666, 1, 0.7803922, 0, 1,
-1.201434, 2.485965, -0.1485043, 1, 0.7843137, 0, 1,
-1.19715, 1.175626, -1.498857, 1, 0.7921569, 0, 1,
-1.195935, -0.932851, -1.819324, 1, 0.7960784, 0, 1,
-1.193445, 0.2997597, -1.480263, 1, 0.8039216, 0, 1,
-1.18503, -0.6588283, -2.095702, 1, 0.8117647, 0, 1,
-1.184198, 0.2706459, -1.805634, 1, 0.8156863, 0, 1,
-1.179993, -0.5923202, -1.48759, 1, 0.8235294, 0, 1,
-1.179785, 0.1465951, -1.787144, 1, 0.827451, 0, 1,
-1.177407, -0.4430024, -1.726546, 1, 0.8352941, 0, 1,
-1.176252, 0.2504895, 0.04487127, 1, 0.8392157, 0, 1,
-1.160896, -0.9328342, -2.795421, 1, 0.8470588, 0, 1,
-1.160076, -1.084707, -3.086175, 1, 0.8509804, 0, 1,
-1.149837, 1.958778, -2.081094, 1, 0.8588235, 0, 1,
-1.141461, -0.6131753, -2.190082, 1, 0.8627451, 0, 1,
-1.135902, 1.887254, -0.5173498, 1, 0.8705882, 0, 1,
-1.131112, -0.0433261, -0.3479342, 1, 0.8745098, 0, 1,
-1.120413, 0.6773426, -1.68453, 1, 0.8823529, 0, 1,
-1.118001, 0.5518187, -1.095043, 1, 0.8862745, 0, 1,
-1.112644, 0.218101, -1.855649, 1, 0.8941177, 0, 1,
-1.106488, 0.5750922, -2.673892, 1, 0.8980392, 0, 1,
-1.099832, -0.5483263, -2.416808, 1, 0.9058824, 0, 1,
-1.096878, 0.6728765, -0.4079449, 1, 0.9137255, 0, 1,
-1.096139, 1.146217, -1.85761, 1, 0.9176471, 0, 1,
-1.091704, 0.1116219, -3.291818, 1, 0.9254902, 0, 1,
-1.087117, -0.8759189, -0.5823127, 1, 0.9294118, 0, 1,
-1.083204, -0.7273945, -0.7897186, 1, 0.9372549, 0, 1,
-1.072062, -0.005917781, -1.452353, 1, 0.9411765, 0, 1,
-1.071333, -1.602452, -0.8881239, 1, 0.9490196, 0, 1,
-1.070249, -1.763789, -2.952294, 1, 0.9529412, 0, 1,
-1.069189, 1.112213, -1.314268, 1, 0.9607843, 0, 1,
-1.06788, -2.241667, -2.00831, 1, 0.9647059, 0, 1,
-1.065492, 0.7352746, -2.940197, 1, 0.972549, 0, 1,
-1.059045, 0.03639018, -1.247844, 1, 0.9764706, 0, 1,
-1.058763, -0.4880472, 0.6719829, 1, 0.9843137, 0, 1,
-1.057563, 1.480669, 0.6097468, 1, 0.9882353, 0, 1,
-1.052948, 0.9793199, -1.024037, 1, 0.9960784, 0, 1,
-1.035345, -0.005324292, -1.7038, 0.9960784, 1, 0, 1,
-1.024695, 0.04885265, 0.2982908, 0.9921569, 1, 0, 1,
-1.012051, -1.063533, -1.131691, 0.9843137, 1, 0, 1,
-1.0075, 0.1334163, -2.662846, 0.9803922, 1, 0, 1,
-1.005865, -0.4526012, -3.618556, 0.972549, 1, 0, 1,
-1.00228, 0.8462577, 1.23031, 0.9686275, 1, 0, 1,
-0.9986927, 0.3120123, -2.27028, 0.9607843, 1, 0, 1,
-0.9967691, -0.2776312, -4.149536, 0.9568627, 1, 0, 1,
-0.9952895, 0.3589018, -0.7004445, 0.9490196, 1, 0, 1,
-0.9927208, -0.6936429, -3.043304, 0.945098, 1, 0, 1,
-0.9912314, 1.545726, -0.1162113, 0.9372549, 1, 0, 1,
-0.9890146, -0.5338714, -3.161787, 0.9333333, 1, 0, 1,
-0.9586626, 0.2497308, -0.9147502, 0.9254902, 1, 0, 1,
-0.9568833, -0.3812546, -1.33145, 0.9215686, 1, 0, 1,
-0.9528694, -0.1850981, -2.276959, 0.9137255, 1, 0, 1,
-0.952703, 1.258726, 0.2913942, 0.9098039, 1, 0, 1,
-0.9414254, 0.8206264, -0.06023834, 0.9019608, 1, 0, 1,
-0.9406986, 0.3107566, -1.749207, 0.8941177, 1, 0, 1,
-0.9363011, 0.9584215, -1.095795, 0.8901961, 1, 0, 1,
-0.9302728, 0.8148913, -2.439127, 0.8823529, 1, 0, 1,
-0.9271117, -0.759047, -3.031443, 0.8784314, 1, 0, 1,
-0.925885, 2.365719, -0.148139, 0.8705882, 1, 0, 1,
-0.9253911, 0.1238258, -2.313567, 0.8666667, 1, 0, 1,
-0.9246318, -0.7101901, -0.8023709, 0.8588235, 1, 0, 1,
-0.9211026, -0.1137019, -1.753578, 0.854902, 1, 0, 1,
-0.9164091, 0.5988442, -2.527457, 0.8470588, 1, 0, 1,
-0.915894, -0.8770319, -0.9854501, 0.8431373, 1, 0, 1,
-0.91314, 0.2952499, -2.854203, 0.8352941, 1, 0, 1,
-0.9039281, 0.008539326, -0.9922017, 0.8313726, 1, 0, 1,
-0.9032248, 0.4006876, -1.168012, 0.8235294, 1, 0, 1,
-0.9021063, -0.3338, -1.913787, 0.8196079, 1, 0, 1,
-0.9011526, 0.4794653, 0.05634234, 0.8117647, 1, 0, 1,
-0.9011461, -1.441921, -2.099522, 0.8078431, 1, 0, 1,
-0.8981467, -0.6751984, -1.221292, 0.8, 1, 0, 1,
-0.8938845, 1.243561, -2.164982, 0.7921569, 1, 0, 1,
-0.8791894, -1.043772, -2.944569, 0.7882353, 1, 0, 1,
-0.877575, 1.130548, -0.3071869, 0.7803922, 1, 0, 1,
-0.8755309, -1.797692, -4.487384, 0.7764706, 1, 0, 1,
-0.8746296, -1.50045, -4.359738, 0.7686275, 1, 0, 1,
-0.8711792, -1.363192, -4.879069, 0.7647059, 1, 0, 1,
-0.8627393, 1.464907, -0.6363205, 0.7568628, 1, 0, 1,
-0.8627161, 1.266331, -2.158086, 0.7529412, 1, 0, 1,
-0.8616998, 0.06696917, -0.3366849, 0.7450981, 1, 0, 1,
-0.861688, 0.3762978, -1.888264, 0.7411765, 1, 0, 1,
-0.8594834, 0.7189146, 0.0387168, 0.7333333, 1, 0, 1,
-0.8570318, -1.20049, -4.614821, 0.7294118, 1, 0, 1,
-0.8569149, 2.826725, 0.47436, 0.7215686, 1, 0, 1,
-0.8535275, 2.018831, -1.662653, 0.7176471, 1, 0, 1,
-0.8468149, -2.416528, -4.504421, 0.7098039, 1, 0, 1,
-0.8425973, 0.6793647, -2.168375, 0.7058824, 1, 0, 1,
-0.8418129, 0.9220601, -1.010806, 0.6980392, 1, 0, 1,
-0.8381246, 0.5906144, 0.5136183, 0.6901961, 1, 0, 1,
-0.8344753, -1.780622, -3.547263, 0.6862745, 1, 0, 1,
-0.8319437, -1.247823, -2.153512, 0.6784314, 1, 0, 1,
-0.830072, -1.81558, -3.835789, 0.6745098, 1, 0, 1,
-0.8255419, 3.085922, -0.6820474, 0.6666667, 1, 0, 1,
-0.8241832, -1.831002, -2.072253, 0.6627451, 1, 0, 1,
-0.8224322, 0.6306809, -0.936769, 0.654902, 1, 0, 1,
-0.8199876, -0.2032037, -2.092815, 0.6509804, 1, 0, 1,
-0.8197807, -0.3472091, -2.770007, 0.6431373, 1, 0, 1,
-0.8128801, -1.435841, -2.857498, 0.6392157, 1, 0, 1,
-0.8127641, 1.04055, -0.9889397, 0.6313726, 1, 0, 1,
-0.8099053, 0.3087628, -1.191182, 0.627451, 1, 0, 1,
-0.8063162, 0.6023384, -0.6628352, 0.6196079, 1, 0, 1,
-0.7880694, -0.4212885, -1.645362, 0.6156863, 1, 0, 1,
-0.7849315, -0.9326307, -2.877129, 0.6078432, 1, 0, 1,
-0.7825484, -0.1134774, -1.142855, 0.6039216, 1, 0, 1,
-0.7815015, -2.088401, -3.031049, 0.5960785, 1, 0, 1,
-0.7788305, -0.6746824, -3.388854, 0.5882353, 1, 0, 1,
-0.7785664, -0.05299191, -3.659357, 0.5843138, 1, 0, 1,
-0.7774473, 0.6440588, 0.3793131, 0.5764706, 1, 0, 1,
-0.7740646, 0.2126349, -1.851175, 0.572549, 1, 0, 1,
-0.7733902, 1.931615, -0.4794337, 0.5647059, 1, 0, 1,
-0.7711401, -0.4860632, -2.8654, 0.5607843, 1, 0, 1,
-0.7685481, 1.988229, -0.197964, 0.5529412, 1, 0, 1,
-0.7629914, 0.2325575, -2.212511, 0.5490196, 1, 0, 1,
-0.7589506, -1.494025, -1.385567, 0.5411765, 1, 0, 1,
-0.7574601, 2.211096, -0.661517, 0.5372549, 1, 0, 1,
-0.75603, 0.7836845, 0.915068, 0.5294118, 1, 0, 1,
-0.7559695, 1.586812, -1.65249, 0.5254902, 1, 0, 1,
-0.7504308, -0.6151007, -2.107453, 0.5176471, 1, 0, 1,
-0.7406171, 0.9656484, -0.9191836, 0.5137255, 1, 0, 1,
-0.7396361, -0.7077026, -2.075652, 0.5058824, 1, 0, 1,
-0.7377021, -0.4892956, -1.586169, 0.5019608, 1, 0, 1,
-0.7375368, 0.9812699, -0.7724296, 0.4941176, 1, 0, 1,
-0.7351484, -0.7177168, -1.901064, 0.4862745, 1, 0, 1,
-0.7339002, -0.3243811, -2.172067, 0.4823529, 1, 0, 1,
-0.7293515, 0.7836077, 0.5114701, 0.4745098, 1, 0, 1,
-0.7261519, -1.098714, -3.10041, 0.4705882, 1, 0, 1,
-0.7258935, 0.7517424, 0.9371404, 0.4627451, 1, 0, 1,
-0.7188154, -1.470222, -1.720856, 0.4588235, 1, 0, 1,
-0.7123182, -0.1601357, -2.059038, 0.4509804, 1, 0, 1,
-0.7106343, 0.4814683, -0.7574531, 0.4470588, 1, 0, 1,
-0.7087898, -2.216221, -2.425821, 0.4392157, 1, 0, 1,
-0.7083424, -1.503235, -3.816483, 0.4352941, 1, 0, 1,
-0.7057974, 0.4593129, -1.93134, 0.427451, 1, 0, 1,
-0.6992484, -0.7020155, -1.744726, 0.4235294, 1, 0, 1,
-0.6962657, -1.902376, -2.003185, 0.4156863, 1, 0, 1,
-0.6889727, -0.3525584, -1.296833, 0.4117647, 1, 0, 1,
-0.6881878, 0.875024, -1.269563, 0.4039216, 1, 0, 1,
-0.6830221, -0.6984321, -2.032678, 0.3960784, 1, 0, 1,
-0.6824143, -0.4238093, -2.048423, 0.3921569, 1, 0, 1,
-0.6821714, 0.3309942, -1.029962, 0.3843137, 1, 0, 1,
-0.6761551, -0.7820814, -1.77928, 0.3803922, 1, 0, 1,
-0.6718103, -1.186496, -1.904181, 0.372549, 1, 0, 1,
-0.668241, 0.5067799, -0.2417051, 0.3686275, 1, 0, 1,
-0.6579822, 1.203828, 1.448462, 0.3607843, 1, 0, 1,
-0.6550421, 1.2124, -2.632038, 0.3568628, 1, 0, 1,
-0.6547862, 0.01491756, -2.344897, 0.3490196, 1, 0, 1,
-0.6540939, -1.621974, -1.59532, 0.345098, 1, 0, 1,
-0.6530089, -1.246794, -1.55029, 0.3372549, 1, 0, 1,
-0.6511431, 0.1998787, -0.3768059, 0.3333333, 1, 0, 1,
-0.6480716, 1.011477, -1.090489, 0.3254902, 1, 0, 1,
-0.6447241, 0.03578724, -1.679179, 0.3215686, 1, 0, 1,
-0.6437756, -1.005971, -2.625602, 0.3137255, 1, 0, 1,
-0.6379807, 1.170983, 0.6843656, 0.3098039, 1, 0, 1,
-0.6355895, -2.227174, -3.92206, 0.3019608, 1, 0, 1,
-0.6334642, 0.1251268, -1.345862, 0.2941177, 1, 0, 1,
-0.6317204, -0.01833116, 0.739848, 0.2901961, 1, 0, 1,
-0.6244, -1.362257, -3.58298, 0.282353, 1, 0, 1,
-0.6170019, -0.2703238, -1.198969, 0.2784314, 1, 0, 1,
-0.6124427, 0.3040451, -0.8932777, 0.2705882, 1, 0, 1,
-0.6014403, 0.3476045, -0.4145925, 0.2666667, 1, 0, 1,
-0.5975717, -1.500467, -1.891681, 0.2588235, 1, 0, 1,
-0.5973929, 1.280561, -1.636183, 0.254902, 1, 0, 1,
-0.5950131, -0.1200008, -2.538936, 0.2470588, 1, 0, 1,
-0.5949235, 0.8049914, -0.173373, 0.2431373, 1, 0, 1,
-0.5944026, 0.932266, 0.4781463, 0.2352941, 1, 0, 1,
-0.5918744, -0.875976, -1.335301, 0.2313726, 1, 0, 1,
-0.5901353, 1.131482, -0.005005967, 0.2235294, 1, 0, 1,
-0.5900422, 0.05046086, -1.804729, 0.2196078, 1, 0, 1,
-0.5900146, -0.2257702, -2.40522, 0.2117647, 1, 0, 1,
-0.5842549, 0.7693478, -0.04048797, 0.2078431, 1, 0, 1,
-0.5800661, -1.501875, -3.736799, 0.2, 1, 0, 1,
-0.5791638, 1.228138, -0.3474415, 0.1921569, 1, 0, 1,
-0.5743173, -1.356406, -1.877392, 0.1882353, 1, 0, 1,
-0.56985, 1.097322, 0.6218404, 0.1803922, 1, 0, 1,
-0.5646971, 1.051821, -1.670601, 0.1764706, 1, 0, 1,
-0.5633948, -0.1183631, -1.649096, 0.1686275, 1, 0, 1,
-0.5600412, -0.7686022, -1.41602, 0.1647059, 1, 0, 1,
-0.5562546, 0.5213795, -0.1446377, 0.1568628, 1, 0, 1,
-0.5549049, 1.395583, -2.837683, 0.1529412, 1, 0, 1,
-0.5482836, 0.6640265, 0.7036623, 0.145098, 1, 0, 1,
-0.5451899, -2.158031, -1.640205, 0.1411765, 1, 0, 1,
-0.5446568, 0.2538268, 0.3817725, 0.1333333, 1, 0, 1,
-0.540396, -0.1968333, -1.529854, 0.1294118, 1, 0, 1,
-0.5332752, 0.8477638, 0.6584876, 0.1215686, 1, 0, 1,
-0.5262922, -0.9496829, -1.966885, 0.1176471, 1, 0, 1,
-0.5192175, 1.503731, -1.663424, 0.1098039, 1, 0, 1,
-0.5187686, -0.427798, -3.523656, 0.1058824, 1, 0, 1,
-0.5159189, -0.287239, -2.868464, 0.09803922, 1, 0, 1,
-0.5126411, 0.8755069, -0.8230228, 0.09019608, 1, 0, 1,
-0.5112361, -1.007748, -2.633355, 0.08627451, 1, 0, 1,
-0.5034605, 0.0540367, -1.664445, 0.07843138, 1, 0, 1,
-0.5024154, 1.998008, 0.2825126, 0.07450981, 1, 0, 1,
-0.5015535, 0.05877491, -3.648558, 0.06666667, 1, 0, 1,
-0.4949377, -1.650609, -5.64287, 0.0627451, 1, 0, 1,
-0.4918223, 0.4080094, -0.9034951, 0.05490196, 1, 0, 1,
-0.4878067, -1.214299, -3.1512, 0.05098039, 1, 0, 1,
-0.4858271, 0.964155, -1.755305, 0.04313726, 1, 0, 1,
-0.4852536, -0.02341185, -1.831145, 0.03921569, 1, 0, 1,
-0.4806213, 0.2945457, -1.15436, 0.03137255, 1, 0, 1,
-0.4788375, 0.2489949, -1.223323, 0.02745098, 1, 0, 1,
-0.4784841, 1.618254, 0.2802637, 0.01960784, 1, 0, 1,
-0.475843, -2.731446, -3.368106, 0.01568628, 1, 0, 1,
-0.474691, 0.6614822, 0.2123322, 0.007843138, 1, 0, 1,
-0.4745581, 1.122657, -1.885796, 0.003921569, 1, 0, 1,
-0.4713715, 1.459124, 0.3408819, 0, 1, 0.003921569, 1,
-0.4633347, 0.4149621, -0.3303878, 0, 1, 0.01176471, 1,
-0.4590842, -1.498948, -2.308454, 0, 1, 0.01568628, 1,
-0.4585272, 1.820838, -0.2105735, 0, 1, 0.02352941, 1,
-0.4566693, -0.07572256, -1.300059, 0, 1, 0.02745098, 1,
-0.4543739, 0.8812495, -1.984424, 0, 1, 0.03529412, 1,
-0.4515792, 0.7647673, -1.104826, 0, 1, 0.03921569, 1,
-0.4481549, -1.416499, -3.366923, 0, 1, 0.04705882, 1,
-0.4478289, 0.05463239, -0.5920023, 0, 1, 0.05098039, 1,
-0.4435657, -0.5035827, -4.207875, 0, 1, 0.05882353, 1,
-0.4405166, -0.3020951, -3.366992, 0, 1, 0.0627451, 1,
-0.4346802, 1.405451, -0.7349306, 0, 1, 0.07058824, 1,
-0.4304549, -0.6889804, -0.8793059, 0, 1, 0.07450981, 1,
-0.4301524, 0.8343284, -1.167309, 0, 1, 0.08235294, 1,
-0.4258218, -0.7044795, -3.931384, 0, 1, 0.08627451, 1,
-0.423264, -1.130302, -3.372561, 0, 1, 0.09411765, 1,
-0.4208496, -0.08697992, -2.423053, 0, 1, 0.1019608, 1,
-0.4201306, -0.6248247, -1.386109, 0, 1, 0.1058824, 1,
-0.4197108, -1.325744, -2.847096, 0, 1, 0.1137255, 1,
-0.419025, -0.2586977, -3.35514, 0, 1, 0.1176471, 1,
-0.4173673, -0.9478069, -2.694344, 0, 1, 0.1254902, 1,
-0.4114092, 1.340731, 0.8162115, 0, 1, 0.1294118, 1,
-0.4038726, 0.01523387, -2.84279, 0, 1, 0.1372549, 1,
-0.4021996, 0.09237808, -3.482307, 0, 1, 0.1411765, 1,
-0.3955052, -0.09787065, -2.326576, 0, 1, 0.1490196, 1,
-0.3926335, -0.3973476, -2.748966, 0, 1, 0.1529412, 1,
-0.3895748, -0.8415523, -3.184954, 0, 1, 0.1607843, 1,
-0.3847129, -1.090117, -3.694283, 0, 1, 0.1647059, 1,
-0.3825392, -0.1969082, -1.9868, 0, 1, 0.172549, 1,
-0.3777112, -0.6941652, -3.656386, 0, 1, 0.1764706, 1,
-0.3749324, 0.08438683, 0.1183419, 0, 1, 0.1843137, 1,
-0.3711447, 0.5421255, -0.7223191, 0, 1, 0.1882353, 1,
-0.3691395, 1.591626, 0.3265768, 0, 1, 0.1960784, 1,
-0.3651716, -0.09534235, -1.309872, 0, 1, 0.2039216, 1,
-0.3604782, -0.5794852, -2.136933, 0, 1, 0.2078431, 1,
-0.3602881, 0.457866, -0.231214, 0, 1, 0.2156863, 1,
-0.3584082, -1.686894, -3.912702, 0, 1, 0.2196078, 1,
-0.3567361, -0.251996, -2.893346, 0, 1, 0.227451, 1,
-0.3555032, 0.5128077, -0.1631664, 0, 1, 0.2313726, 1,
-0.35544, 0.3091444, -1.701485, 0, 1, 0.2392157, 1,
-0.3536035, 1.419976, 0.6552255, 0, 1, 0.2431373, 1,
-0.3501217, -0.3790558, -0.6854144, 0, 1, 0.2509804, 1,
-0.3490351, -0.2472538, -3.654375, 0, 1, 0.254902, 1,
-0.3459311, -0.8191946, -2.960348, 0, 1, 0.2627451, 1,
-0.3429906, -1.045593, -3.970404, 0, 1, 0.2666667, 1,
-0.3417769, -0.07777029, -1.709038, 0, 1, 0.2745098, 1,
-0.3387265, -0.2227803, -0.9089993, 0, 1, 0.2784314, 1,
-0.3373947, -0.4694835, -0.7979948, 0, 1, 0.2862745, 1,
-0.3362221, -0.5651436, -1.483466, 0, 1, 0.2901961, 1,
-0.3360779, 0.2036883, 0.3316694, 0, 1, 0.2980392, 1,
-0.3299696, 0.861559, -0.3817307, 0, 1, 0.3058824, 1,
-0.3289639, -0.4717584, -2.831745, 0, 1, 0.3098039, 1,
-0.3289217, 0.1609764, -0.8228068, 0, 1, 0.3176471, 1,
-0.3287391, 0.8745801, -1.592647, 0, 1, 0.3215686, 1,
-0.3274797, 0.796357, -1.308354, 0, 1, 0.3294118, 1,
-0.3249219, 1.598589, 0.511459, 0, 1, 0.3333333, 1,
-0.32366, -0.6725752, -4.436862, 0, 1, 0.3411765, 1,
-0.323378, -0.07498489, -2.222147, 0, 1, 0.345098, 1,
-0.3134515, 1.104008, -0.5589025, 0, 1, 0.3529412, 1,
-0.3118461, -1.493892, -4.740465, 0, 1, 0.3568628, 1,
-0.3085714, 1.604645, -0.5792462, 0, 1, 0.3647059, 1,
-0.3081338, -0.742188, -1.764589, 0, 1, 0.3686275, 1,
-0.3062132, 0.5140197, -0.1678975, 0, 1, 0.3764706, 1,
-0.3041535, -0.5337855, -0.7500035, 0, 1, 0.3803922, 1,
-0.2997079, 1.054297, -0.7236764, 0, 1, 0.3882353, 1,
-0.2943537, -0.05860417, -1.156304, 0, 1, 0.3921569, 1,
-0.2918048, 0.0220313, -2.138885, 0, 1, 0.4, 1,
-0.2916358, -0.1458394, -3.380564, 0, 1, 0.4078431, 1,
-0.284557, -0.2542702, -1.862023, 0, 1, 0.4117647, 1,
-0.2845241, -0.8510709, -1.880434, 0, 1, 0.4196078, 1,
-0.2737406, 2.640661, -1.79846, 0, 1, 0.4235294, 1,
-0.2730415, 0.6645844, -1.383132, 0, 1, 0.4313726, 1,
-0.2693798, 0.4387812, -0.779491, 0, 1, 0.4352941, 1,
-0.2668973, 0.7004722, 0.3827969, 0, 1, 0.4431373, 1,
-0.2630525, -0.8355715, -4.368744, 0, 1, 0.4470588, 1,
-0.2628118, -0.3905813, -2.159955, 0, 1, 0.454902, 1,
-0.2620109, -1.34084, -4.628672, 0, 1, 0.4588235, 1,
-0.2617732, -0.2657752, -2.417814, 0, 1, 0.4666667, 1,
-0.2493291, -0.8443444, -3.333889, 0, 1, 0.4705882, 1,
-0.2460537, 0.2723834, -0.4163249, 0, 1, 0.4784314, 1,
-0.2406231, 0.3266436, -0.3108666, 0, 1, 0.4823529, 1,
-0.2392997, -1.284734, -2.473003, 0, 1, 0.4901961, 1,
-0.2341024, -0.9523412, -2.93247, 0, 1, 0.4941176, 1,
-0.2331189, 0.762613, 2.355793, 0, 1, 0.5019608, 1,
-0.231779, 0.05282462, -0.006762592, 0, 1, 0.509804, 1,
-0.2309232, 0.9549994, -1.034104, 0, 1, 0.5137255, 1,
-0.2303352, 0.7774922, -1.793789, 0, 1, 0.5215687, 1,
-0.2168672, -1.360911, -2.85537, 0, 1, 0.5254902, 1,
-0.2140258, -0.2522388, -1.259161, 0, 1, 0.5333334, 1,
-0.2120167, -0.9319674, -4.59741, 0, 1, 0.5372549, 1,
-0.2107771, 1.805937, -0.9510785, 0, 1, 0.5450981, 1,
-0.2099649, 1.833758, -0.3029408, 0, 1, 0.5490196, 1,
-0.2078157, 0.7683749, -0.8564323, 0, 1, 0.5568628, 1,
-0.2076816, -1.139971, -2.146472, 0, 1, 0.5607843, 1,
-0.2070879, -0.3656551, -2.843068, 0, 1, 0.5686275, 1,
-0.2063642, 0.9369958, 0.6212364, 0, 1, 0.572549, 1,
-0.2061037, -0.5496815, -3.478224, 0, 1, 0.5803922, 1,
-0.2032978, 1.011854, -0.2523577, 0, 1, 0.5843138, 1,
-0.2004417, -1.076138, -4.117438, 0, 1, 0.5921569, 1,
-0.1950212, 1.207066, -0.3679999, 0, 1, 0.5960785, 1,
-0.1930962, -0.9778734, -3.011918, 0, 1, 0.6039216, 1,
-0.1831385, 0.4532361, -0.1920392, 0, 1, 0.6117647, 1,
-0.1807023, 0.06052195, -0.1498501, 0, 1, 0.6156863, 1,
-0.1775538, -0.03125956, -1.59027, 0, 1, 0.6235294, 1,
-0.1768275, -1.089518, -2.630466, 0, 1, 0.627451, 1,
-0.1694593, 0.1467927, 0.3098507, 0, 1, 0.6352941, 1,
-0.1689869, -0.4680025, -2.980902, 0, 1, 0.6392157, 1,
-0.1684145, -0.9184419, -3.327867, 0, 1, 0.6470588, 1,
-0.162246, 0.8319404, 0.2875927, 0, 1, 0.6509804, 1,
-0.1617793, -0.544736, -2.292159, 0, 1, 0.6588235, 1,
-0.1564374, 1.055376, -0.9682762, 0, 1, 0.6627451, 1,
-0.1482716, 0.7043401, -0.7532763, 0, 1, 0.6705883, 1,
-0.1474943, -0.8157196, -3.596054, 0, 1, 0.6745098, 1,
-0.144618, -0.451085, -2.750529, 0, 1, 0.682353, 1,
-0.143699, -0.4495248, -2.300396, 0, 1, 0.6862745, 1,
-0.14331, 0.7804247, -0.4751734, 0, 1, 0.6941177, 1,
-0.1412111, -1.208694, -4.068914, 0, 1, 0.7019608, 1,
-0.139221, 0.2688885, 0.04374078, 0, 1, 0.7058824, 1,
-0.1368473, 0.5551572, -1.254331, 0, 1, 0.7137255, 1,
-0.1299679, 1.361089, 0.5339558, 0, 1, 0.7176471, 1,
-0.126748, -1.582613, -2.213922, 0, 1, 0.7254902, 1,
-0.1264238, -1.650892, -2.668411, 0, 1, 0.7294118, 1,
-0.123083, 0.707638, -0.7020726, 0, 1, 0.7372549, 1,
-0.1223359, 0.3471992, -0.6287259, 0, 1, 0.7411765, 1,
-0.1174924, -1.15948, -4.829998, 0, 1, 0.7490196, 1,
-0.11552, 1.925501, 0.357136, 0, 1, 0.7529412, 1,
-0.113317, -2.85618, -2.231907, 0, 1, 0.7607843, 1,
-0.108572, 0.391933, 1.17437, 0, 1, 0.7647059, 1,
-0.1068575, -0.1870437, -4.105915, 0, 1, 0.772549, 1,
-0.105764, 1.188294, 1.097353, 0, 1, 0.7764706, 1,
-0.1038, -0.90655, -4.278643, 0, 1, 0.7843137, 1,
-0.1033953, -0.5350608, -3.033783, 0, 1, 0.7882353, 1,
-0.1031945, 0.70218, 1.175282, 0, 1, 0.7960784, 1,
-0.1028485, -1.779891, -4.44206, 0, 1, 0.8039216, 1,
-0.09926699, 0.1754461, 1.283631, 0, 1, 0.8078431, 1,
-0.09185745, -0.4988983, -4.061692, 0, 1, 0.8156863, 1,
-0.08736782, 0.5581632, -1.652052, 0, 1, 0.8196079, 1,
-0.08399691, 1.463942, -0.9710461, 0, 1, 0.827451, 1,
-0.08368412, -0.225776, -2.748094, 0, 1, 0.8313726, 1,
-0.08289341, -0.2742432, -2.070177, 0, 1, 0.8392157, 1,
-0.0805093, 0.7458375, -0.2266365, 0, 1, 0.8431373, 1,
-0.07935405, -0.919505, -3.353664, 0, 1, 0.8509804, 1,
-0.07586742, -1.478779, -4.184919, 0, 1, 0.854902, 1,
-0.07522869, -2.776814, -2.867288, 0, 1, 0.8627451, 1,
-0.07511507, 0.6338561, -0.4842367, 0, 1, 0.8666667, 1,
-0.07421545, -0.6073381, -2.051671, 0, 1, 0.8745098, 1,
-0.07350153, 1.345744, 1.593021, 0, 1, 0.8784314, 1,
-0.07341608, 2.243865, 0.06506503, 0, 1, 0.8862745, 1,
-0.07204769, -0.03228334, -2.847991, 0, 1, 0.8901961, 1,
-0.07202735, 1.472723, 1.930128, 0, 1, 0.8980392, 1,
-0.06721272, 0.8016961, 1.747432, 0, 1, 0.9058824, 1,
-0.06506203, -0.3413003, -0.3766767, 0, 1, 0.9098039, 1,
-0.06489249, 1.347773, -1.106633, 0, 1, 0.9176471, 1,
-0.06438054, 0.6404443, -0.008662244, 0, 1, 0.9215686, 1,
-0.06169356, 1.838732, -1.005048, 0, 1, 0.9294118, 1,
-0.05745674, -0.8568748, -2.058016, 0, 1, 0.9333333, 1,
-0.05728608, -0.8415049, -4.416955, 0, 1, 0.9411765, 1,
-0.05719894, 0.6471235, -0.4535044, 0, 1, 0.945098, 1,
-0.05718103, -0.09746443, -3.601396, 0, 1, 0.9529412, 1,
-0.05557819, -0.05663485, -2.213245, 0, 1, 0.9568627, 1,
-0.05059616, -1.926969, -2.432259, 0, 1, 0.9647059, 1,
-0.05045714, 1.238382, 0.1566368, 0, 1, 0.9686275, 1,
-0.04872947, -0.914943, -1.757567, 0, 1, 0.9764706, 1,
-0.04852961, 0.5965574, 0.369114, 0, 1, 0.9803922, 1,
-0.04758236, 1.243406, -0.1581145, 0, 1, 0.9882353, 1,
-0.04605047, -0.4294091, -3.706625, 0, 1, 0.9921569, 1,
-0.03860794, -0.3333597, -2.512724, 0, 1, 1, 1,
-0.03228601, 0.8376076, -1.182119, 0, 0.9921569, 1, 1,
-0.02956912, 1.253058, 1.341548, 0, 0.9882353, 1, 1,
-0.02726388, -1.358014, -3.304971, 0, 0.9803922, 1, 1,
-0.02545522, 0.3444024, -0.4286462, 0, 0.9764706, 1, 1,
-0.01768404, -0.9564794, -2.9953, 0, 0.9686275, 1, 1,
-0.01482495, 0.9160482, -0.07770073, 0, 0.9647059, 1, 1,
-0.01456741, 0.2466649, -0.362996, 0, 0.9568627, 1, 1,
-0.01368481, -1.150153, -2.600905, 0, 0.9529412, 1, 1,
-0.005954899, 1.129162, 0.347047, 0, 0.945098, 1, 1,
-0.005851645, 0.3067861, 0.02135187, 0, 0.9411765, 1, 1,
-0.004095965, -0.7132927, -2.329533, 0, 0.9333333, 1, 1,
-0.0007547658, -1.757103, -3.000519, 0, 0.9294118, 1, 1,
0.001304025, 1.178674, -0.8591661, 0, 0.9215686, 1, 1,
0.005198911, 0.6479683, 0.3580197, 0, 0.9176471, 1, 1,
0.007095344, 0.0203542, 0.2689112, 0, 0.9098039, 1, 1,
0.008143545, -0.5286341, 2.338228, 0, 0.9058824, 1, 1,
0.009943372, 0.1949747, 0.8446983, 0, 0.8980392, 1, 1,
0.01023189, 0.921984, 1.108834, 0, 0.8901961, 1, 1,
0.01117307, 0.5247288, -0.1263827, 0, 0.8862745, 1, 1,
0.01292545, -0.5084448, 4.736617, 0, 0.8784314, 1, 1,
0.01561928, -1.006932, 3.578143, 0, 0.8745098, 1, 1,
0.01905469, 0.08526091, -1.208491, 0, 0.8666667, 1, 1,
0.02234272, -1.486686, 2.538285, 0, 0.8627451, 1, 1,
0.03030234, -0.9106028, 3.619063, 0, 0.854902, 1, 1,
0.03351183, 0.3244356, -0.7300649, 0, 0.8509804, 1, 1,
0.03556872, 2.909953, -0.1635352, 0, 0.8431373, 1, 1,
0.03792839, 0.2159801, 0.8491683, 0, 0.8392157, 1, 1,
0.03934212, 0.6438114, 0.07746696, 0, 0.8313726, 1, 1,
0.04137241, 0.21672, 1.44595, 0, 0.827451, 1, 1,
0.04183032, 0.6568871, -0.1799287, 0, 0.8196079, 1, 1,
0.04295364, 1.547046, -0.5542849, 0, 0.8156863, 1, 1,
0.04322233, -0.7294415, 3.892426, 0, 0.8078431, 1, 1,
0.04804247, -2.551767, 1.37051, 0, 0.8039216, 1, 1,
0.05148929, -0.348279, 5.210663, 0, 0.7960784, 1, 1,
0.05397488, -0.7454359, 3.440481, 0, 0.7882353, 1, 1,
0.05870828, -0.2526523, 3.680574, 0, 0.7843137, 1, 1,
0.0589812, -2.58814, 3.242789, 0, 0.7764706, 1, 1,
0.06166212, -0.5822401, 3.145276, 0, 0.772549, 1, 1,
0.0623945, 0.3236597, 0.6955943, 0, 0.7647059, 1, 1,
0.06389388, -0.04494587, 1.336928, 0, 0.7607843, 1, 1,
0.0646502, 1.272488, 0.04945077, 0, 0.7529412, 1, 1,
0.06469952, -0.3045304, 4.658162, 0, 0.7490196, 1, 1,
0.07023249, -0.7410908, 2.506268, 0, 0.7411765, 1, 1,
0.07328158, -1.03196, 2.37419, 0, 0.7372549, 1, 1,
0.07514791, 0.407342, -0.903811, 0, 0.7294118, 1, 1,
0.07761799, 0.3441921, -0.719142, 0, 0.7254902, 1, 1,
0.07802518, -1.191234, 3.482841, 0, 0.7176471, 1, 1,
0.08076648, -1.210787, 2.559698, 0, 0.7137255, 1, 1,
0.08294935, -0.2365957, 2.91653, 0, 0.7058824, 1, 1,
0.0833924, -0.1339093, 2.094347, 0, 0.6980392, 1, 1,
0.08399571, -0.1285769, 2.551888, 0, 0.6941177, 1, 1,
0.08487473, 0.0283686, 0.3139087, 0, 0.6862745, 1, 1,
0.08569135, 1.548377, 0.6034706, 0, 0.682353, 1, 1,
0.09384428, -0.3211168, 1.139518, 0, 0.6745098, 1, 1,
0.09553964, 0.3492024, 0.09424518, 0, 0.6705883, 1, 1,
0.09791222, 2.598426, -0.08101156, 0, 0.6627451, 1, 1,
0.09817528, 0.1905978, 1.59626, 0, 0.6588235, 1, 1,
0.09817667, 0.6921569, -0.6331723, 0, 0.6509804, 1, 1,
0.1045157, -0.5888461, 3.79447, 0, 0.6470588, 1, 1,
0.1065166, -1.306641, 2.761296, 0, 0.6392157, 1, 1,
0.1066061, 1.417814, 0.1024787, 0, 0.6352941, 1, 1,
0.1126649, 0.1016749, -1.470111, 0, 0.627451, 1, 1,
0.1135611, -2.31837, 4.25955, 0, 0.6235294, 1, 1,
0.1193171, 0.5883745, -0.3612239, 0, 0.6156863, 1, 1,
0.1194309, 0.2609582, 1.324718, 0, 0.6117647, 1, 1,
0.1196651, 0.01303727, 1.212815, 0, 0.6039216, 1, 1,
0.123837, 1.234098, 0.4554172, 0, 0.5960785, 1, 1,
0.1257868, 1.061039, 0.9456837, 0, 0.5921569, 1, 1,
0.1278121, 1.018502, 1.386982, 0, 0.5843138, 1, 1,
0.1278709, 0.8055134, -1.798965, 0, 0.5803922, 1, 1,
0.1280605, -0.457176, 5.055831, 0, 0.572549, 1, 1,
0.1390685, 0.2392766, -0.4860819, 0, 0.5686275, 1, 1,
0.1409352, 0.1800431, 0.6738613, 0, 0.5607843, 1, 1,
0.1434292, 0.9804093, -1.38908, 0, 0.5568628, 1, 1,
0.1529649, -1.133183, 3.209913, 0, 0.5490196, 1, 1,
0.1531337, -1.6702, 1.903062, 0, 0.5450981, 1, 1,
0.1553725, -1.902703, 2.259849, 0, 0.5372549, 1, 1,
0.1580032, -0.05576659, 1.030094, 0, 0.5333334, 1, 1,
0.1652787, 0.4997073, 1.639506, 0, 0.5254902, 1, 1,
0.1758296, -0.7161397, 2.678157, 0, 0.5215687, 1, 1,
0.1836549, 1.353666, -0.01353944, 0, 0.5137255, 1, 1,
0.1839976, -0.6654748, 3.858265, 0, 0.509804, 1, 1,
0.1993317, -0.5961607, 1.720414, 0, 0.5019608, 1, 1,
0.2000893, -1.139806, 1.599911, 0, 0.4941176, 1, 1,
0.2015889, -1.369607, 0.8060797, 0, 0.4901961, 1, 1,
0.2017565, -0.4417175, 2.45874, 0, 0.4823529, 1, 1,
0.2026623, 0.3176703, 1.509633, 0, 0.4784314, 1, 1,
0.203152, 0.8884397, 0.8097107, 0, 0.4705882, 1, 1,
0.2067255, 0.3493742, 0.4866251, 0, 0.4666667, 1, 1,
0.2103757, 2.049931, 1.130606, 0, 0.4588235, 1, 1,
0.2137019, -0.1916217, 1.979687, 0, 0.454902, 1, 1,
0.2152183, -0.7056246, 2.914956, 0, 0.4470588, 1, 1,
0.2174578, -0.0461245, 1.375707, 0, 0.4431373, 1, 1,
0.2194851, 0.9418921, -0.3041347, 0, 0.4352941, 1, 1,
0.2222009, -0.055194, 1.474923, 0, 0.4313726, 1, 1,
0.2228049, 0.3423503, 0.2735824, 0, 0.4235294, 1, 1,
0.2246057, -0.3378632, 3.110369, 0, 0.4196078, 1, 1,
0.2304197, -0.2101389, 1.18972, 0, 0.4117647, 1, 1,
0.2315997, -1.032623, 3.316154, 0, 0.4078431, 1, 1,
0.2358979, -1.207002, 3.726785, 0, 0.4, 1, 1,
0.249348, 1.612506, 1.353714, 0, 0.3921569, 1, 1,
0.2533067, 1.114054, 1.898091, 0, 0.3882353, 1, 1,
0.2534055, 1.039694, 0.4612405, 0, 0.3803922, 1, 1,
0.2559353, -0.1494474, 1.133757, 0, 0.3764706, 1, 1,
0.25668, -0.8283041, 2.640238, 0, 0.3686275, 1, 1,
0.2585339, 0.1558792, 0.4204934, 0, 0.3647059, 1, 1,
0.2607689, -0.8724655, 3.103854, 0, 0.3568628, 1, 1,
0.2656525, 0.5702637, -0.9986814, 0, 0.3529412, 1, 1,
0.2669677, 2.223803, -0.2794772, 0, 0.345098, 1, 1,
0.2673263, -0.7736385, 0.6885018, 0, 0.3411765, 1, 1,
0.2709972, -0.6914327, 4.128833, 0, 0.3333333, 1, 1,
0.271763, 0.01426753, 1.769327, 0, 0.3294118, 1, 1,
0.2807468, 0.5261449, -0.1396504, 0, 0.3215686, 1, 1,
0.2823918, -0.5610915, 2.927217, 0, 0.3176471, 1, 1,
0.2840437, -1.654997, 2.232478, 0, 0.3098039, 1, 1,
0.2841946, -0.3680573, 2.589833, 0, 0.3058824, 1, 1,
0.285087, 0.4170548, 2.042531, 0, 0.2980392, 1, 1,
0.2875834, -0.4956068, 2.058131, 0, 0.2901961, 1, 1,
0.288425, -1.638348, 3.081784, 0, 0.2862745, 1, 1,
0.2911126, 0.3397201, 2.456328, 0, 0.2784314, 1, 1,
0.2925077, 0.9863182, 2.619701, 0, 0.2745098, 1, 1,
0.2958004, -1.518346, 3.539995, 0, 0.2666667, 1, 1,
0.2966205, 1.062766, 1.737698, 0, 0.2627451, 1, 1,
0.2974657, -1.421497, 3.137634, 0, 0.254902, 1, 1,
0.2996388, -0.09870895, 2.830016, 0, 0.2509804, 1, 1,
0.3010359, 0.1428996, 1.736839, 0, 0.2431373, 1, 1,
0.3022084, 1.091913, 1.255599, 0, 0.2392157, 1, 1,
0.3036907, -1.545087, 0.9988499, 0, 0.2313726, 1, 1,
0.3037206, -1.431935, 2.066994, 0, 0.227451, 1, 1,
0.3038041, 0.94162, -0.6385672, 0, 0.2196078, 1, 1,
0.3063512, 0.3897614, 0.5425109, 0, 0.2156863, 1, 1,
0.3068459, -0.3420792, 2.759634, 0, 0.2078431, 1, 1,
0.3108124, 0.6830595, 0.8546472, 0, 0.2039216, 1, 1,
0.3142035, 0.9057477, -1.078966, 0, 0.1960784, 1, 1,
0.3188532, -0.3908055, 2.55213, 0, 0.1882353, 1, 1,
0.3247671, 0.4636382, -0.5309063, 0, 0.1843137, 1, 1,
0.3312848, 1.71841, -1.38383, 0, 0.1764706, 1, 1,
0.331956, -2.103148, 1.557559, 0, 0.172549, 1, 1,
0.3323021, 1.28588, 2.729558, 0, 0.1647059, 1, 1,
0.3335635, 0.7293344, 1.310836, 0, 0.1607843, 1, 1,
0.3347645, 1.033957, -1.037018, 0, 0.1529412, 1, 1,
0.3370584, -0.6726347, 4.031513, 0, 0.1490196, 1, 1,
0.3379853, -0.2484208, 2.289581, 0, 0.1411765, 1, 1,
0.3388619, 0.8763944, -0.6749574, 0, 0.1372549, 1, 1,
0.341505, -0.2611959, 2.919257, 0, 0.1294118, 1, 1,
0.3450244, 0.9263945, -0.4495227, 0, 0.1254902, 1, 1,
0.3480322, 0.259683, -0.3471, 0, 0.1176471, 1, 1,
0.3523613, -0.7090791, 4.049354, 0, 0.1137255, 1, 1,
0.3535491, 0.4019718, 1.211485, 0, 0.1058824, 1, 1,
0.3536926, 2.125675, 2.301086, 0, 0.09803922, 1, 1,
0.353812, -0.3811016, 2.786854, 0, 0.09411765, 1, 1,
0.3564842, 1.690172, -0.2628872, 0, 0.08627451, 1, 1,
0.3604942, -1.601289, 3.305961, 0, 0.08235294, 1, 1,
0.3610156, 2.991454, 2.913288, 0, 0.07450981, 1, 1,
0.3622105, 0.5705064, 0.3140511, 0, 0.07058824, 1, 1,
0.3631467, -0.5162148, 2.699903, 0, 0.0627451, 1, 1,
0.3672673, -1.25515, 2.232601, 0, 0.05882353, 1, 1,
0.3704053, 1.490617, 0.6707578, 0, 0.05098039, 1, 1,
0.3714858, 3.428568, 0.861786, 0, 0.04705882, 1, 1,
0.3771068, 0.6709925, 0.09674481, 0, 0.03921569, 1, 1,
0.3800815, 0.6206488, 0.3190673, 0, 0.03529412, 1, 1,
0.3885933, 1.239909, 0.8429042, 0, 0.02745098, 1, 1,
0.3890091, 1.510043, 0.4708506, 0, 0.02352941, 1, 1,
0.392728, 0.4305682, -0.1573516, 0, 0.01568628, 1, 1,
0.3945639, 0.1346774, 1.90301, 0, 0.01176471, 1, 1,
0.3980579, -0.3836396, 1.886351, 0, 0.003921569, 1, 1,
0.3988914, -1.543057, 3.870541, 0.003921569, 0, 1, 1,
0.3994738, 0.01165182, 2.668328, 0.007843138, 0, 1, 1,
0.4024793, -0.536753, 2.195883, 0.01568628, 0, 1, 1,
0.4046367, -0.531745, 1.373319, 0.01960784, 0, 1, 1,
0.4064815, 0.09423698, 1.083741, 0.02745098, 0, 1, 1,
0.409375, 1.448875, 1.2823, 0.03137255, 0, 1, 1,
0.4094476, 0.2771634, -0.9017365, 0.03921569, 0, 1, 1,
0.4121698, 0.2991069, 0.2615995, 0.04313726, 0, 1, 1,
0.4151932, 1.353643, -0.3228176, 0.05098039, 0, 1, 1,
0.4156472, 0.5523472, 1.294132, 0.05490196, 0, 1, 1,
0.4194728, -0.9824409, 3.26008, 0.0627451, 0, 1, 1,
0.422191, -1.455911, 4.188124, 0.06666667, 0, 1, 1,
0.4222473, -1.394691, 4.488108, 0.07450981, 0, 1, 1,
0.4242344, -0.8123497, 2.267719, 0.07843138, 0, 1, 1,
0.424472, -1.007717, 3.475848, 0.08627451, 0, 1, 1,
0.4313299, -0.1808374, 0.1925314, 0.09019608, 0, 1, 1,
0.4365682, -0.7592012, 1.630722, 0.09803922, 0, 1, 1,
0.4366556, -1.428101, 3.583501, 0.1058824, 0, 1, 1,
0.4369933, 0.2162359, 1.384559, 0.1098039, 0, 1, 1,
0.4393337, 1.463772, -1.788141, 0.1176471, 0, 1, 1,
0.4458663, -2.530977, 2.321056, 0.1215686, 0, 1, 1,
0.446293, 0.2134302, 0.7936106, 0.1294118, 0, 1, 1,
0.4469216, 0.7555315, 1.423752, 0.1333333, 0, 1, 1,
0.4543044, 0.03369121, 0.7735053, 0.1411765, 0, 1, 1,
0.4558128, -0.6194919, 3.649667, 0.145098, 0, 1, 1,
0.4558185, 0.3444418, 0.2167711, 0.1529412, 0, 1, 1,
0.4589963, 0.191511, 1.344969, 0.1568628, 0, 1, 1,
0.4597402, -0.339945, 3.028386, 0.1647059, 0, 1, 1,
0.4637968, 0.1761915, 1.051775, 0.1686275, 0, 1, 1,
0.4638459, 0.3399842, 0.2012433, 0.1764706, 0, 1, 1,
0.4667668, -0.2974189, 2.998438, 0.1803922, 0, 1, 1,
0.4672966, -1.084006, 3.023425, 0.1882353, 0, 1, 1,
0.4680394, -0.4550844, 3.488696, 0.1921569, 0, 1, 1,
0.4700122, -0.5175257, 1.99384, 0.2, 0, 1, 1,
0.4702386, -0.8062901, 3.249365, 0.2078431, 0, 1, 1,
0.4706805, -1.123289, 1.342464, 0.2117647, 0, 1, 1,
0.4735436, -0.16351, 0.4168246, 0.2196078, 0, 1, 1,
0.4742956, 0.7498487, -0.4442582, 0.2235294, 0, 1, 1,
0.4751858, 0.3768627, 1.295867, 0.2313726, 0, 1, 1,
0.4776234, 1.700065, 0.4081348, 0.2352941, 0, 1, 1,
0.488361, 1.065867, -0.1858284, 0.2431373, 0, 1, 1,
0.4896216, 0.1478025, 1.285811, 0.2470588, 0, 1, 1,
0.4923373, 0.04857482, 0.8111544, 0.254902, 0, 1, 1,
0.4924515, 0.4214317, 0.6234037, 0.2588235, 0, 1, 1,
0.4946009, -0.8863987, 2.46701, 0.2666667, 0, 1, 1,
0.4979918, -1.884964, 3.043162, 0.2705882, 0, 1, 1,
0.4988578, -0.04633309, 2.122149, 0.2784314, 0, 1, 1,
0.5082921, 0.564914, 0.5613433, 0.282353, 0, 1, 1,
0.5106716, 0.1660121, 1.567002, 0.2901961, 0, 1, 1,
0.5127858, 0.5865983, 1.107366, 0.2941177, 0, 1, 1,
0.5187546, 0.9875537, 1.604497, 0.3019608, 0, 1, 1,
0.5203141, 0.1898159, 2.705863, 0.3098039, 0, 1, 1,
0.5226218, -0.1475073, 0.8768026, 0.3137255, 0, 1, 1,
0.5246888, 2.182866, -0.2828035, 0.3215686, 0, 1, 1,
0.5290889, -0.1667413, -0.3054511, 0.3254902, 0, 1, 1,
0.5312418, -0.2239645, 1.00251, 0.3333333, 0, 1, 1,
0.5396886, -0.4573447, 2.558583, 0.3372549, 0, 1, 1,
0.5399228, -1.804655, 2.921641, 0.345098, 0, 1, 1,
0.544052, 0.7904805, 0.4088828, 0.3490196, 0, 1, 1,
0.5447075, 0.2491606, 0.661596, 0.3568628, 0, 1, 1,
0.5468397, 0.3798271, 0.545791, 0.3607843, 0, 1, 1,
0.5522507, 1.200729, 0.8783175, 0.3686275, 0, 1, 1,
0.5552214, 0.8189856, 1.177786, 0.372549, 0, 1, 1,
0.5699987, 0.1410506, 0.2753488, 0.3803922, 0, 1, 1,
0.5701196, 0.7750643, 0.3774365, 0.3843137, 0, 1, 1,
0.5732551, -0.3494354, 0.9044967, 0.3921569, 0, 1, 1,
0.5734305, 1.136888, 0.2903026, 0.3960784, 0, 1, 1,
0.5749961, -0.5497779, -0.4067277, 0.4039216, 0, 1, 1,
0.5821097, 0.4831025, 0.4345521, 0.4117647, 0, 1, 1,
0.5832285, -0.3771279, 0.189411, 0.4156863, 0, 1, 1,
0.5840806, -0.9010621, 2.268382, 0.4235294, 0, 1, 1,
0.5877689, 0.3263929, 0.9431195, 0.427451, 0, 1, 1,
0.5896665, -0.3769808, 3.527162, 0.4352941, 0, 1, 1,
0.5898345, -0.3396763, 4.148096, 0.4392157, 0, 1, 1,
0.5903656, -2.195573, 3.873517, 0.4470588, 0, 1, 1,
0.5976775, 0.8141751, 1.078845, 0.4509804, 0, 1, 1,
0.6009598, -0.3474399, 2.717548, 0.4588235, 0, 1, 1,
0.6110307, 0.8754628, -0.4736928, 0.4627451, 0, 1, 1,
0.6151389, -0.9321581, 3.858331, 0.4705882, 0, 1, 1,
0.6172512, 0.2218859, 0.5892198, 0.4745098, 0, 1, 1,
0.6203735, -1.880805, 2.418993, 0.4823529, 0, 1, 1,
0.6215672, 0.277998, 1.801622, 0.4862745, 0, 1, 1,
0.629126, -0.3424297, 1.791954, 0.4941176, 0, 1, 1,
0.6364023, 0.8422843, -0.3113225, 0.5019608, 0, 1, 1,
0.6441031, 1.333525, -0.9750936, 0.5058824, 0, 1, 1,
0.6461545, 0.5051451, 0.9271711, 0.5137255, 0, 1, 1,
0.6462563, 0.2030334, 0.6101192, 0.5176471, 0, 1, 1,
0.6515976, -1.169372, 1.53561, 0.5254902, 0, 1, 1,
0.6544344, 0.6988845, 2.378674, 0.5294118, 0, 1, 1,
0.6551057, 0.002623787, 1.592366, 0.5372549, 0, 1, 1,
0.6576183, -0.4318605, 2.361489, 0.5411765, 0, 1, 1,
0.6627488, -0.9514847, 1.11553, 0.5490196, 0, 1, 1,
0.6684, -1.283847, 2.901397, 0.5529412, 0, 1, 1,
0.6709403, -0.9068419, 1.467386, 0.5607843, 0, 1, 1,
0.6714814, -0.1928386, 2.815443, 0.5647059, 0, 1, 1,
0.6772292, -0.8582053, 0.5826739, 0.572549, 0, 1, 1,
0.6819668, -0.7529561, 2.882276, 0.5764706, 0, 1, 1,
0.6845455, 1.359196, 0.9589491, 0.5843138, 0, 1, 1,
0.6867357, -0.9588806, 4.176896, 0.5882353, 0, 1, 1,
0.6907357, -0.8131794, 1.398259, 0.5960785, 0, 1, 1,
0.6909345, -0.6910575, 2.928507, 0.6039216, 0, 1, 1,
0.6985112, -1.002432, 0.3796878, 0.6078432, 0, 1, 1,
0.6992499, 0.697754, 0.9515869, 0.6156863, 0, 1, 1,
0.7034829, -2.435427, 1.986018, 0.6196079, 0, 1, 1,
0.7052605, 0.4466179, 1.987105, 0.627451, 0, 1, 1,
0.7090454, -1.538743, 2.589865, 0.6313726, 0, 1, 1,
0.7111324, -1.620739, 2.711541, 0.6392157, 0, 1, 1,
0.7127074, 0.5856302, -0.1759606, 0.6431373, 0, 1, 1,
0.7137089, 0.5919781, 0.52219, 0.6509804, 0, 1, 1,
0.7186015, 1.348104, 1.030216, 0.654902, 0, 1, 1,
0.7217664, -1.201314, 1.724665, 0.6627451, 0, 1, 1,
0.7268406, -0.5788811, 2.683172, 0.6666667, 0, 1, 1,
0.7274255, 1.198664, 0.6212282, 0.6745098, 0, 1, 1,
0.7313637, 1.041044, 1.226134, 0.6784314, 0, 1, 1,
0.7365673, -0.6769621, 3.821239, 0.6862745, 0, 1, 1,
0.7412447, 0.07304945, 1.254057, 0.6901961, 0, 1, 1,
0.7413805, 0.1326032, 1.346917, 0.6980392, 0, 1, 1,
0.7460821, -0.8139821, 3.314068, 0.7058824, 0, 1, 1,
0.7547529, 0.9907364, 2.848644, 0.7098039, 0, 1, 1,
0.7573853, -1.562557, 3.029823, 0.7176471, 0, 1, 1,
0.7582021, -1.225099, 1.588397, 0.7215686, 0, 1, 1,
0.760949, 0.1736432, 0.09567568, 0.7294118, 0, 1, 1,
0.7635312, -1.194821, 1.787174, 0.7333333, 0, 1, 1,
0.7658013, -0.06527561, 3.358078, 0.7411765, 0, 1, 1,
0.7667338, 2.107663, 2.697988, 0.7450981, 0, 1, 1,
0.7701354, -1.841957, 2.423922, 0.7529412, 0, 1, 1,
0.7801463, 0.8768041, 1.784454, 0.7568628, 0, 1, 1,
0.7802417, 0.9657124, 1.532155, 0.7647059, 0, 1, 1,
0.7809593, 0.9160718, 0.6408072, 0.7686275, 0, 1, 1,
0.7818018, 2.193252, 1.650971, 0.7764706, 0, 1, 1,
0.7910333, -0.08289262, 1.599381, 0.7803922, 0, 1, 1,
0.7925828, 0.7369399, -0.4002818, 0.7882353, 0, 1, 1,
0.7950792, 0.5229456, -0.1058049, 0.7921569, 0, 1, 1,
0.802442, 0.4363213, 0.3123546, 0.8, 0, 1, 1,
0.804178, 0.6870696, -0.07151153, 0.8078431, 0, 1, 1,
0.8053231, 0.7057191, 0.6218931, 0.8117647, 0, 1, 1,
0.8054307, -2.360763, 1.198775, 0.8196079, 0, 1, 1,
0.8185936, -1.308909, 3.03616, 0.8235294, 0, 1, 1,
0.8215464, -0.6179479, 2.033706, 0.8313726, 0, 1, 1,
0.8263438, -0.730305, 1.692683, 0.8352941, 0, 1, 1,
0.830759, -1.305533, 1.504945, 0.8431373, 0, 1, 1,
0.8370645, -2.332437, 2.569885, 0.8470588, 0, 1, 1,
0.8402641, -0.3675576, 1.650279, 0.854902, 0, 1, 1,
0.8469981, -1.621893, 4.020114, 0.8588235, 0, 1, 1,
0.8508188, 0.2845726, 1.209846, 0.8666667, 0, 1, 1,
0.8514397, 0.3910645, 0.4366491, 0.8705882, 0, 1, 1,
0.8617113, 0.01717699, 1.012336, 0.8784314, 0, 1, 1,
0.8633379, 1.647586, 1.587693, 0.8823529, 0, 1, 1,
0.8635314, -2.032773, 4.146085, 0.8901961, 0, 1, 1,
0.866468, -0.07603218, 0.829735, 0.8941177, 0, 1, 1,
0.8679609, 0.5665888, 0.8085815, 0.9019608, 0, 1, 1,
0.8726177, 0.5585691, -0.00455706, 0.9098039, 0, 1, 1,
0.873665, -0.8959138, 2.670381, 0.9137255, 0, 1, 1,
0.8751084, -0.5318715, 1.579906, 0.9215686, 0, 1, 1,
0.8762023, 0.846929, -0.09881482, 0.9254902, 0, 1, 1,
0.8809941, 0.9148269, 1.117209, 0.9333333, 0, 1, 1,
0.8821274, 0.2919352, 0.6468341, 0.9372549, 0, 1, 1,
0.8832365, -1.187772, 2.872438, 0.945098, 0, 1, 1,
0.8838207, -1.617392, 2.602882, 0.9490196, 0, 1, 1,
0.8845137, -0.7955992, 0.8585333, 0.9568627, 0, 1, 1,
0.8864596, -0.8832392, 2.774504, 0.9607843, 0, 1, 1,
0.8952155, -0.0995201, 2.7831, 0.9686275, 0, 1, 1,
0.8976146, 0.9857846, 1.241166, 0.972549, 0, 1, 1,
0.8990081, 0.1027301, 1.277974, 0.9803922, 0, 1, 1,
0.9026727, -1.548251, 3.731771, 0.9843137, 0, 1, 1,
0.9078672, 0.2211475, -1.170912, 0.9921569, 0, 1, 1,
0.9194274, 0.5967983, 2.099713, 0.9960784, 0, 1, 1,
0.9196714, 1.236224, 2.253396, 1, 0, 0.9960784, 1,
0.9209523, -1.052466, 0.1733143, 1, 0, 0.9882353, 1,
0.9249032, 0.5590238, -0.0705417, 1, 0, 0.9843137, 1,
0.9291995, 0.5455808, 0.3129127, 1, 0, 0.9764706, 1,
0.9321435, -0.1170117, 0.3681047, 1, 0, 0.972549, 1,
0.9457588, 0.6715446, 2.045845, 1, 0, 0.9647059, 1,
0.9567788, -0.8451742, 4.177407, 1, 0, 0.9607843, 1,
0.9602814, -0.2808658, 2.490854, 1, 0, 0.9529412, 1,
0.9610517, 0.3898499, 0.2542608, 1, 0, 0.9490196, 1,
0.9618756, 1.059884, 1.22915, 1, 0, 0.9411765, 1,
0.963755, 0.1595916, -0.06560456, 1, 0, 0.9372549, 1,
0.9732459, -0.7907074, 2.395459, 1, 0, 0.9294118, 1,
0.9736366, 1.961516, 1.196441, 1, 0, 0.9254902, 1,
0.9756046, 0.7659057, 1.150835, 1, 0, 0.9176471, 1,
0.9803843, -0.7936645, 2.676497, 1, 0, 0.9137255, 1,
0.996475, 0.04811937, 0.8039551, 1, 0, 0.9058824, 1,
0.9981868, -0.5446345, 2.189371, 1, 0, 0.9019608, 1,
1.000958, 0.8803506, 1.509664, 1, 0, 0.8941177, 1,
1.005506, -1.074603, 2.025775, 1, 0, 0.8862745, 1,
1.014313, -0.4180727, 2.981272, 1, 0, 0.8823529, 1,
1.015911, 2.410296, 0.6127076, 1, 0, 0.8745098, 1,
1.016671, -1.35958, 3.191794, 1, 0, 0.8705882, 1,
1.019994, -1.241237, 2.800016, 1, 0, 0.8627451, 1,
1.020904, -0.4298483, 0.871075, 1, 0, 0.8588235, 1,
1.022254, -1.004271, 3.389143, 1, 0, 0.8509804, 1,
1.031715, 0.6670538, 3.527491, 1, 0, 0.8470588, 1,
1.045811, -1.6929, 1.089783, 1, 0, 0.8392157, 1,
1.046595, 0.4541852, 1.649954, 1, 0, 0.8352941, 1,
1.05126, 1.043496, 2.124115, 1, 0, 0.827451, 1,
1.056938, 0.9243484, 0.9488173, 1, 0, 0.8235294, 1,
1.058795, -1.206284, 4.315676, 1, 0, 0.8156863, 1,
1.069217, 0.409777, 1.397582, 1, 0, 0.8117647, 1,
1.071069, 0.6704995, 0.7955516, 1, 0, 0.8039216, 1,
1.080397, -0.1215001, 1.935657, 1, 0, 0.7960784, 1,
1.090638, 0.5395894, 3.209831, 1, 0, 0.7921569, 1,
1.090834, 1.2778, -0.3146043, 1, 0, 0.7843137, 1,
1.09312, 0.2261762, 1.826931, 1, 0, 0.7803922, 1,
1.102543, 1.503538, 0.9190298, 1, 0, 0.772549, 1,
1.105979, 0.3709416, 0.4386873, 1, 0, 0.7686275, 1,
1.10645, 1.23596, -0.4528925, 1, 0, 0.7607843, 1,
1.110541, -0.3921309, 3.427911, 1, 0, 0.7568628, 1,
1.117392, 0.4197109, 0.2989572, 1, 0, 0.7490196, 1,
1.117846, 0.783193, 2.465767, 1, 0, 0.7450981, 1,
1.124373, 0.6797799, 3.527754, 1, 0, 0.7372549, 1,
1.126781, 0.4558656, 0.2194167, 1, 0, 0.7333333, 1,
1.134316, 0.4909031, 0.9234705, 1, 0, 0.7254902, 1,
1.152289, 0.6857802, 0.2778049, 1, 0, 0.7215686, 1,
1.157165, -0.6484069, 1.240399, 1, 0, 0.7137255, 1,
1.164011, -0.5132892, 0.4748838, 1, 0, 0.7098039, 1,
1.170292, -0.7069268, 2.727061, 1, 0, 0.7019608, 1,
1.197142, -0.6099752, 2.21995, 1, 0, 0.6941177, 1,
1.198032, 0.8206776, 1.142291, 1, 0, 0.6901961, 1,
1.205232, -0.8460473, 4.004459, 1, 0, 0.682353, 1,
1.21972, 0.3199459, 1.885454, 1, 0, 0.6784314, 1,
1.221725, 0.2512148, 1.711034, 1, 0, 0.6705883, 1,
1.228352, 1.802488, -0.79912, 1, 0, 0.6666667, 1,
1.257004, -0.5332484, 1.812425, 1, 0, 0.6588235, 1,
1.264629, -0.2871339, 0.9267817, 1, 0, 0.654902, 1,
1.268678, 1.421759, 1.126538, 1, 0, 0.6470588, 1,
1.272049, -0.7557716, 1.571235, 1, 0, 0.6431373, 1,
1.272993, -0.8405878, 2.26706, 1, 0, 0.6352941, 1,
1.279582, 0.520875, 0.6924039, 1, 0, 0.6313726, 1,
1.281143, 0.3048486, -1.148466, 1, 0, 0.6235294, 1,
1.282463, 1.150897, 0.6049538, 1, 0, 0.6196079, 1,
1.283733, 0.04218003, 1.147458, 1, 0, 0.6117647, 1,
1.286314, -0.7677719, 2.717247, 1, 0, 0.6078432, 1,
1.286436, -0.9147098, 0.6014281, 1, 0, 0.6, 1,
1.292004, 0.4622883, 1.125399, 1, 0, 0.5921569, 1,
1.304693, 0.6108125, 2.720156, 1, 0, 0.5882353, 1,
1.307196, -1.534625, 2.709553, 1, 0, 0.5803922, 1,
1.322509, 0.9350204, 1.37889, 1, 0, 0.5764706, 1,
1.327109, -1.147699, 2.101023, 1, 0, 0.5686275, 1,
1.334833, 0.2469244, 0.3940458, 1, 0, 0.5647059, 1,
1.335052, -0.162039, 3.505535, 1, 0, 0.5568628, 1,
1.337182, 0.3933883, 0.8096377, 1, 0, 0.5529412, 1,
1.33898, 0.6671113, 1.638912, 1, 0, 0.5450981, 1,
1.350586, 1.301428, 0.06708051, 1, 0, 0.5411765, 1,
1.356255, -0.7865906, 2.612681, 1, 0, 0.5333334, 1,
1.356792, -1.603366, 3.031674, 1, 0, 0.5294118, 1,
1.358185, 0.8000625, 0.09272219, 1, 0, 0.5215687, 1,
1.36246, -1.036804, 1.572488, 1, 0, 0.5176471, 1,
1.390643, 1.001275, 0.1149734, 1, 0, 0.509804, 1,
1.407749, 0.9527196, 1.091716, 1, 0, 0.5058824, 1,
1.420808, 0.6282421, -0.3043116, 1, 0, 0.4980392, 1,
1.424181, -0.04283058, 1.087393, 1, 0, 0.4901961, 1,
1.424343, -0.5702305, 0.892401, 1, 0, 0.4862745, 1,
1.427628, 1.435692, -0.4834407, 1, 0, 0.4784314, 1,
1.438329, -0.4600862, 1.833098, 1, 0, 0.4745098, 1,
1.439402, 1.237773, -0.3177295, 1, 0, 0.4666667, 1,
1.444759, -0.3403979, 2.585064, 1, 0, 0.4627451, 1,
1.445513, 0.9244928, -0.2455836, 1, 0, 0.454902, 1,
1.459262, 1.579773, 1.156721, 1, 0, 0.4509804, 1,
1.46421, -1.431815, 1.789384, 1, 0, 0.4431373, 1,
1.481507, 0.2987109, 1.074788, 1, 0, 0.4392157, 1,
1.483151, 2.212099, -0.4409216, 1, 0, 0.4313726, 1,
1.487916, 2.332035, -0.1306107, 1, 0, 0.427451, 1,
1.497173, -1.104306, 1.50919, 1, 0, 0.4196078, 1,
1.499816, -0.5765003, 1.490371, 1, 0, 0.4156863, 1,
1.500381, -1.585398, 4.164529, 1, 0, 0.4078431, 1,
1.506854, 1.071273, 0.3317012, 1, 0, 0.4039216, 1,
1.507134, -0.1062008, 2.156193, 1, 0, 0.3960784, 1,
1.507617, 0.7061327, 1.517993, 1, 0, 0.3882353, 1,
1.522032, -1.077782, 1.161338, 1, 0, 0.3843137, 1,
1.523003, -0.2621255, 3.044012, 1, 0, 0.3764706, 1,
1.53621, -0.2342259, 2.32374, 1, 0, 0.372549, 1,
1.550002, 0.5656371, 2.388705, 1, 0, 0.3647059, 1,
1.566375, 0.1493731, 1.192202, 1, 0, 0.3607843, 1,
1.567383, 0.01479142, 2.9474, 1, 0, 0.3529412, 1,
1.571816, -0.3084964, 1.910239, 1, 0, 0.3490196, 1,
1.572988, 1.337115, 1.097542, 1, 0, 0.3411765, 1,
1.580378, -0.7960457, 2.514563, 1, 0, 0.3372549, 1,
1.580999, 0.7791877, 2.264911, 1, 0, 0.3294118, 1,
1.589958, -0.1108373, 0.7519811, 1, 0, 0.3254902, 1,
1.595192, -0.3685612, 1.774487, 1, 0, 0.3176471, 1,
1.604035, 0.967308, 0.5918933, 1, 0, 0.3137255, 1,
1.62978, 0.0819549, 1.124014, 1, 0, 0.3058824, 1,
1.631018, -0.9079813, 2.90789, 1, 0, 0.2980392, 1,
1.632128, 0.5962724, 1.450607, 1, 0, 0.2941177, 1,
1.632577, -0.9618844, 1.121925, 1, 0, 0.2862745, 1,
1.655792, -0.399964, 1.835883, 1, 0, 0.282353, 1,
1.663979, -0.8454444, 2.226045, 1, 0, 0.2745098, 1,
1.682475, -0.3828816, 1.723171, 1, 0, 0.2705882, 1,
1.687766, -0.2413646, 0.2715638, 1, 0, 0.2627451, 1,
1.69498, 2.143798, 0.7444173, 1, 0, 0.2588235, 1,
1.714215, -0.1193317, 1.837301, 1, 0, 0.2509804, 1,
1.739281, 2.306241, -0.3522257, 1, 0, 0.2470588, 1,
1.753667, 0.448793, 0.7432759, 1, 0, 0.2392157, 1,
1.760289, -0.5947798, 1.624768, 1, 0, 0.2352941, 1,
1.761229, 0.5679537, 1.896831, 1, 0, 0.227451, 1,
1.763495, 0.02157711, 0.8439288, 1, 0, 0.2235294, 1,
1.781296, 0.3674408, 0.5630695, 1, 0, 0.2156863, 1,
1.81935, -0.1801349, 2.12292, 1, 0, 0.2117647, 1,
1.824528, 0.4834009, 1.284415, 1, 0, 0.2039216, 1,
1.83327, -0.3897929, 1.788405, 1, 0, 0.1960784, 1,
1.873115, 0.709147, 2.033857, 1, 0, 0.1921569, 1,
1.875921, 0.2878757, 0.6086406, 1, 0, 0.1843137, 1,
1.881144, 0.9186939, 0.534385, 1, 0, 0.1803922, 1,
1.925584, 0.8517966, 0.6222221, 1, 0, 0.172549, 1,
1.973181, 0.6326331, 3.708515, 1, 0, 0.1686275, 1,
2.005174, -0.7124009, 3.399344, 1, 0, 0.1607843, 1,
2.029527, 0.6299172, 2.323419, 1, 0, 0.1568628, 1,
2.031824, 0.5355847, 2.046463, 1, 0, 0.1490196, 1,
2.093896, 0.7211202, -0.8041009, 1, 0, 0.145098, 1,
2.130232, -0.5134196, 3.342987, 1, 0, 0.1372549, 1,
2.144695, 0.4929476, 3.141978, 1, 0, 0.1333333, 1,
2.166436, -0.6026095, 2.096482, 1, 0, 0.1254902, 1,
2.16731, 1.268724, 0.3293668, 1, 0, 0.1215686, 1,
2.168691, -0.6211525, 1.79635, 1, 0, 0.1137255, 1,
2.193967, -0.290634, 1.030818, 1, 0, 0.1098039, 1,
2.200258, 0.2008382, 3.155608, 1, 0, 0.1019608, 1,
2.291682, -0.9821202, 2.24715, 1, 0, 0.09411765, 1,
2.296016, 2.59902, 0.1587806, 1, 0, 0.09019608, 1,
2.298074, -0.1593625, 2.245263, 1, 0, 0.08235294, 1,
2.363178, -0.3636835, 2.036793, 1, 0, 0.07843138, 1,
2.367757, -0.7990842, 3.384745, 1, 0, 0.07058824, 1,
2.372853, -0.6129909, 2.492246, 1, 0, 0.06666667, 1,
2.453964, 1.842696, 0.9688269, 1, 0, 0.05882353, 1,
2.459078, -1.187037, 1.706034, 1, 0, 0.05490196, 1,
2.600273, -0.7629483, 2.271788, 1, 0, 0.04705882, 1,
2.622924, -1.105808, 1.827345, 1, 0, 0.04313726, 1,
2.651136, -2.280765, 3.980612, 1, 0, 0.03529412, 1,
2.664849, 0.07851447, 1.327261, 1, 0, 0.03137255, 1,
2.889473, 1.740149, 0.7897227, 1, 0, 0.02352941, 1,
2.935385, -0.2132497, 1.611287, 1, 0, 0.01960784, 1,
3.17352, 1.005787, -0.09675296, 1, 0, 0.01176471, 1,
3.297019, -0.3417574, 1.465393, 1, 0, 0.007843138, 1
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
0.007544756, -3.921445, -7.482544, 0, -0.5, 0.5, 0.5,
0.007544756, -3.921445, -7.482544, 1, -0.5, 0.5, 0.5,
0.007544756, -3.921445, -7.482544, 1, 1.5, 0.5, 0.5,
0.007544756, -3.921445, -7.482544, 0, 1.5, 0.5, 0.5
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
-4.397061, 0.2861936, -7.482544, 0, -0.5, 0.5, 0.5,
-4.397061, 0.2861936, -7.482544, 1, -0.5, 0.5, 0.5,
-4.397061, 0.2861936, -7.482544, 1, 1.5, 0.5, 0.5,
-4.397061, 0.2861936, -7.482544, 0, 1.5, 0.5, 0.5
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
-4.397061, -3.921445, -0.2161036, 0, -0.5, 0.5, 0.5,
-4.397061, -3.921445, -0.2161036, 1, -0.5, 0.5, 0.5,
-4.397061, -3.921445, -0.2161036, 1, 1.5, 0.5, 0.5,
-4.397061, -3.921445, -0.2161036, 0, 1.5, 0.5, 0.5
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
-3, -2.950452, -5.805673,
3, -2.950452, -5.805673,
-3, -2.950452, -5.805673,
-3, -3.112284, -6.085151,
-2, -2.950452, -5.805673,
-2, -3.112284, -6.085151,
-1, -2.950452, -5.805673,
-1, -3.112284, -6.085151,
0, -2.950452, -5.805673,
0, -3.112284, -6.085151,
1, -2.950452, -5.805673,
1, -3.112284, -6.085151,
2, -2.950452, -5.805673,
2, -3.112284, -6.085151,
3, -2.950452, -5.805673,
3, -3.112284, -6.085151
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
-3, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
-3, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
-3, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
-3, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
-2, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
-2, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
-2, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
-2, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
-1, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
-1, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
-1, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
-1, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
0, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
0, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
0, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
0, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
1, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
1, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
1, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
1, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
2, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
2, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
2, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
2, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5,
3, -3.435948, -6.644108, 0, -0.5, 0.5, 0.5,
3, -3.435948, -6.644108, 1, -0.5, 0.5, 0.5,
3, -3.435948, -6.644108, 1, 1.5, 0.5, 0.5,
3, -3.435948, -6.644108, 0, 1.5, 0.5, 0.5
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
-3.380614, -2, -5.805673,
-3.380614, 3, -5.805673,
-3.380614, -2, -5.805673,
-3.550021, -2, -6.085151,
-3.380614, -1, -5.805673,
-3.550021, -1, -6.085151,
-3.380614, 0, -5.805673,
-3.550021, 0, -6.085151,
-3.380614, 1, -5.805673,
-3.550021, 1, -6.085151,
-3.380614, 2, -5.805673,
-3.550021, 2, -6.085151,
-3.380614, 3, -5.805673,
-3.550021, 3, -6.085151
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
-3.888837, -2, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, -2, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, -2, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, -2, -6.644108, 0, 1.5, 0.5, 0.5,
-3.888837, -1, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, -1, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, -1, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, -1, -6.644108, 0, 1.5, 0.5, 0.5,
-3.888837, 0, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, 0, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, 0, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, 0, -6.644108, 0, 1.5, 0.5, 0.5,
-3.888837, 1, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, 1, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, 1, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, 1, -6.644108, 0, 1.5, 0.5, 0.5,
-3.888837, 2, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, 2, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, 2, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, 2, -6.644108, 0, 1.5, 0.5, 0.5,
-3.888837, 3, -6.644108, 0, -0.5, 0.5, 0.5,
-3.888837, 3, -6.644108, 1, -0.5, 0.5, 0.5,
-3.888837, 3, -6.644108, 1, 1.5, 0.5, 0.5,
-3.888837, 3, -6.644108, 0, 1.5, 0.5, 0.5
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
-3.380614, -2.950452, -4,
-3.380614, -2.950452, 4,
-3.380614, -2.950452, -4,
-3.550021, -3.112284, -4,
-3.380614, -2.950452, -2,
-3.550021, -3.112284, -2,
-3.380614, -2.950452, 0,
-3.550021, -3.112284, 0,
-3.380614, -2.950452, 2,
-3.550021, -3.112284, 2,
-3.380614, -2.950452, 4,
-3.550021, -3.112284, 4
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
-3.888837, -3.435948, -4, 0, -0.5, 0.5, 0.5,
-3.888837, -3.435948, -4, 1, -0.5, 0.5, 0.5,
-3.888837, -3.435948, -4, 1, 1.5, 0.5, 0.5,
-3.888837, -3.435948, -4, 0, 1.5, 0.5, 0.5,
-3.888837, -3.435948, -2, 0, -0.5, 0.5, 0.5,
-3.888837, -3.435948, -2, 1, -0.5, 0.5, 0.5,
-3.888837, -3.435948, -2, 1, 1.5, 0.5, 0.5,
-3.888837, -3.435948, -2, 0, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 0, 0, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 0, 1, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 0, 1, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 0, 0, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 2, 0, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 2, 1, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 2, 1, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 2, 0, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 4, 0, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 4, 1, -0.5, 0.5, 0.5,
-3.888837, -3.435948, 4, 1, 1.5, 0.5, 0.5,
-3.888837, -3.435948, 4, 0, 1.5, 0.5, 0.5
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
-3.380614, -2.950452, -5.805673,
-3.380614, 3.522839, -5.805673,
-3.380614, -2.950452, 5.373466,
-3.380614, 3.522839, 5.373466,
-3.380614, -2.950452, -5.805673,
-3.380614, -2.950452, 5.373466,
-3.380614, 3.522839, -5.805673,
-3.380614, 3.522839, 5.373466,
-3.380614, -2.950452, -5.805673,
3.395703, -2.950452, -5.805673,
-3.380614, -2.950452, 5.373466,
3.395703, -2.950452, 5.373466,
-3.380614, 3.522839, -5.805673,
3.395703, 3.522839, -5.805673,
-3.380614, 3.522839, 5.373466,
3.395703, 3.522839, 5.373466,
3.395703, -2.950452, -5.805673,
3.395703, 3.522839, -5.805673,
3.395703, -2.950452, 5.373466,
3.395703, 3.522839, 5.373466,
3.395703, -2.950452, -5.805673,
3.395703, -2.950452, 5.373466,
3.395703, 3.522839, -5.805673,
3.395703, 3.522839, 5.373466
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
var radius = 7.78944;
var distance = 34.6561;
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
mvMatrix.translate( -0.007544756, -0.2861936, 0.2161036 );
mvMatrix.scale( 1.242872, 1.301053, 0.7533761 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.6561);
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
pyridaphenthion<-read.table("pyridaphenthion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridaphenthion$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
```

```r
y<-pyridaphenthion$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
```

```r
z<-pyridaphenthion$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
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
-3.281929, -0.6994539, -2.156506, 0, 0, 1, 1, 1,
-3.02789, 1.517609, -2.846184, 1, 0, 0, 1, 1,
-2.619519, 0.6201618, -1.089199, 1, 0, 0, 1, 1,
-2.587414, -0.5937214, -0.9508976, 1, 0, 0, 1, 1,
-2.49076, -1.128911, -1.370021, 1, 0, 0, 1, 1,
-2.482191, -0.2202158, -2.950753, 1, 0, 0, 1, 1,
-2.405299, -0.08946038, -1.750649, 0, 0, 0, 1, 1,
-2.357866, 0.2609515, 0.1632807, 0, 0, 0, 1, 1,
-2.305535, 1.179707, -0.7538131, 0, 0, 0, 1, 1,
-2.302459, 0.05373453, -0.7864308, 0, 0, 0, 1, 1,
-2.300046, -0.4086443, -0.08633102, 0, 0, 0, 1, 1,
-2.298432, -0.8382185, -2.083627, 0, 0, 0, 1, 1,
-2.259922, -0.4547178, -1.877704, 0, 0, 0, 1, 1,
-2.247111, 0.8109719, -0.8209536, 1, 1, 1, 1, 1,
-2.209343, -0.3205011, -1.513217, 1, 1, 1, 1, 1,
-2.208928, -0.3784285, -2.081712, 1, 1, 1, 1, 1,
-2.200817, -0.05324224, -2.113008, 1, 1, 1, 1, 1,
-2.198693, 0.2469243, -1.577094, 1, 1, 1, 1, 1,
-2.183507, -1.561315, -1.094518, 1, 1, 1, 1, 1,
-2.178633, -2.083937, -1.876848, 1, 1, 1, 1, 1,
-2.174486, 1.857622, -1.971254, 1, 1, 1, 1, 1,
-2.163026, 0.03547701, -1.659903, 1, 1, 1, 1, 1,
-2.153007, -1.066153, -2.482172, 1, 1, 1, 1, 1,
-2.14368, -1.19078, -1.64478, 1, 1, 1, 1, 1,
-2.107194, 1.086943, 0.7127748, 1, 1, 1, 1, 1,
-2.090455, 0.4490974, -0.8916317, 1, 1, 1, 1, 1,
-2.080385, -0.2718882, -2.317462, 1, 1, 1, 1, 1,
-2.066187, -0.3305279, -2.680909, 1, 1, 1, 1, 1,
-2.063001, 0.6061486, -1.221407, 0, 0, 1, 1, 1,
-2.040254, 0.2726429, -1.819876, 1, 0, 0, 1, 1,
-2.034639, -0.3990785, -3.481276, 1, 0, 0, 1, 1,
-1.992859, 1.494948, 0.1133792, 1, 0, 0, 1, 1,
-1.98222, -2.409556, -1.347406, 1, 0, 0, 1, 1,
-1.942649, 0.05326842, -2.399142, 1, 0, 0, 1, 1,
-1.923927, 1.188669, -2.86749, 0, 0, 0, 1, 1,
-1.891246, 0.130292, -3.1961, 0, 0, 0, 1, 1,
-1.863519, -0.6678612, -1.667418, 0, 0, 0, 1, 1,
-1.855352, -1.543448, -3.183185, 0, 0, 0, 1, 1,
-1.84687, -0.6398605, -1.527422, 0, 0, 0, 1, 1,
-1.827599, 0.04156929, -2.554323, 0, 0, 0, 1, 1,
-1.811942, -1.740453, -2.441184, 0, 0, 0, 1, 1,
-1.802915, -0.3494914, -2.192089, 1, 1, 1, 1, 1,
-1.791123, 1.313897, 0.5488552, 1, 1, 1, 1, 1,
-1.786362, -1.146368, -2.449234, 1, 1, 1, 1, 1,
-1.780066, 0.7055539, -2.261257, 1, 1, 1, 1, 1,
-1.776918, -1.074203, -0.2768604, 1, 1, 1, 1, 1,
-1.770962, -1.650224, -1.86394, 1, 1, 1, 1, 1,
-1.766225, -0.8736787, -1.683733, 1, 1, 1, 1, 1,
-1.761701, -2.214912, -3.260239, 1, 1, 1, 1, 1,
-1.746459, 0.482913, -2.229508, 1, 1, 1, 1, 1,
-1.7377, -0.7654873, -2.009331, 1, 1, 1, 1, 1,
-1.736236, 0.407658, -1.63558, 1, 1, 1, 1, 1,
-1.726105, -0.1589926, -0.9576918, 1, 1, 1, 1, 1,
-1.722044, 0.5691701, -2.713575, 1, 1, 1, 1, 1,
-1.702245, 1.795266, -2.228511, 1, 1, 1, 1, 1,
-1.696105, 0.825855, -2.162167, 1, 1, 1, 1, 1,
-1.688154, 0.761512, -1.673864, 0, 0, 1, 1, 1,
-1.686452, 0.2069872, -1.321791, 1, 0, 0, 1, 1,
-1.647616, 0.1860811, -0.5473254, 1, 0, 0, 1, 1,
-1.640282, 0.6757077, -1.245197, 1, 0, 0, 1, 1,
-1.638227, 0.5205668, -1.474133, 1, 0, 0, 1, 1,
-1.63535, -0.6780716, -2.046235, 1, 0, 0, 1, 1,
-1.63259, -0.05376168, -2.538341, 0, 0, 0, 1, 1,
-1.608325, -0.226043, -1.263247, 0, 0, 0, 1, 1,
-1.578198, -0.2746944, -1.556675, 0, 0, 0, 1, 1,
-1.568686, -1.592304, -3.107285, 0, 0, 0, 1, 1,
-1.557046, -0.7405039, -1.816491, 0, 0, 0, 1, 1,
-1.550562, -0.4704968, -1.535468, 0, 0, 0, 1, 1,
-1.547841, 1.798982, 0.1558233, 0, 0, 0, 1, 1,
-1.540723, -0.1057272, -0.2148805, 1, 1, 1, 1, 1,
-1.532001, -1.49568, -3.500018, 1, 1, 1, 1, 1,
-1.525508, -0.5678626, -1.090932, 1, 1, 1, 1, 1,
-1.521294, 2.489293, 0.4712513, 1, 1, 1, 1, 1,
-1.50373, 2.583245, -0.4702906, 1, 1, 1, 1, 1,
-1.480407, -1.142042, -2.172999, 1, 1, 1, 1, 1,
-1.47088, -0.2564991, -0.719339, 1, 1, 1, 1, 1,
-1.46858, 0.2595696, -0.8326685, 1, 1, 1, 1, 1,
-1.459494, 0.8405967, -0.594825, 1, 1, 1, 1, 1,
-1.458785, -1.737979, -4.008634, 1, 1, 1, 1, 1,
-1.457522, 0.125777, -3.744817, 1, 1, 1, 1, 1,
-1.452338, 1.409443, -1.244409, 1, 1, 1, 1, 1,
-1.452127, 0.2257788, -0.6157669, 1, 1, 1, 1, 1,
-1.45024, 0.2981567, -1.10765, 1, 1, 1, 1, 1,
-1.435863, 0.01961036, 0.09160504, 1, 1, 1, 1, 1,
-1.425355, 0.5130152, -2.604081, 0, 0, 1, 1, 1,
-1.421541, -0.9684372, -2.844724, 1, 0, 0, 1, 1,
-1.419796, -0.8357033, 0.361479, 1, 0, 0, 1, 1,
-1.417185, -0.2646206, -2.521602, 1, 0, 0, 1, 1,
-1.408687, 0.3523878, -2.199337, 1, 0, 0, 1, 1,
-1.403935, -1.544408, -2.83443, 1, 0, 0, 1, 1,
-1.403246, -0.3727819, -2.319221, 0, 0, 0, 1, 1,
-1.400896, -1.956502, -1.844369, 0, 0, 0, 1, 1,
-1.392175, -1.714883, -1.994648, 0, 0, 0, 1, 1,
-1.391251, -2.451863, -4.028954, 0, 0, 0, 1, 1,
-1.372001, 0.8201665, -0.6705475, 0, 0, 0, 1, 1,
-1.35558, -0.2574618, -1.741702, 0, 0, 0, 1, 1,
-1.3533, -0.2175206, -1.763364, 0, 0, 0, 1, 1,
-1.344173, 1.225962, -1.390661, 1, 1, 1, 1, 1,
-1.339153, 0.4117334, -2.727034, 1, 1, 1, 1, 1,
-1.337631, -0.3315912, -1.186507, 1, 1, 1, 1, 1,
-1.333619, -0.8351664, -3.033906, 1, 1, 1, 1, 1,
-1.331588, 1.047002, 0.4345988, 1, 1, 1, 1, 1,
-1.330287, 0.3634385, -1.137134, 1, 1, 1, 1, 1,
-1.323247, -0.6140643, -3.027478, 1, 1, 1, 1, 1,
-1.316025, -1.904844, -1.161173, 1, 1, 1, 1, 1,
-1.312323, 0.970599, -1.965281, 1, 1, 1, 1, 1,
-1.311747, 0.1203351, -2.664061, 1, 1, 1, 1, 1,
-1.31077, -0.7833005, -1.930623, 1, 1, 1, 1, 1,
-1.304532, -0.08015616, -1.8231, 1, 1, 1, 1, 1,
-1.296185, -0.868177, -2.545189, 1, 1, 1, 1, 1,
-1.286119, 0.02002883, -0.9505192, 1, 1, 1, 1, 1,
-1.282528, 1.466628, -2.832642, 1, 1, 1, 1, 1,
-1.278988, 0.2402141, -1.466814, 0, 0, 1, 1, 1,
-1.277377, 1.890637, 1.265376, 1, 0, 0, 1, 1,
-1.276678, -1.106367, -4.341294, 1, 0, 0, 1, 1,
-1.271742, 1.203008, -0.3575858, 1, 0, 0, 1, 1,
-1.25002, 1.400102, -1.99998, 1, 0, 0, 1, 1,
-1.245987, -0.7592819, -2.470144, 1, 0, 0, 1, 1,
-1.240514, 1.876078, -0.9653499, 0, 0, 0, 1, 1,
-1.238389, -1.49521, -1.171588, 0, 0, 0, 1, 1,
-1.236452, -0.2191026, -3.660599, 0, 0, 0, 1, 1,
-1.231924, -1.930095, -2.865474, 0, 0, 0, 1, 1,
-1.225451, 1.790675, -0.3227053, 0, 0, 0, 1, 1,
-1.225351, -0.3547404, -1.855999, 0, 0, 0, 1, 1,
-1.224451, 0.9359122, -0.528911, 0, 0, 0, 1, 1,
-1.222279, -0.9901825, -1.795617, 1, 1, 1, 1, 1,
-1.21862, 0.3002644, -0.6740412, 1, 1, 1, 1, 1,
-1.215808, 0.0246545, -2.543966, 1, 1, 1, 1, 1,
-1.215392, 0.09746329, -3.74785, 1, 1, 1, 1, 1,
-1.212719, -0.02274415, -1.251173, 1, 1, 1, 1, 1,
-1.204377, 1.068966, -0.8300666, 1, 1, 1, 1, 1,
-1.201434, 2.485965, -0.1485043, 1, 1, 1, 1, 1,
-1.19715, 1.175626, -1.498857, 1, 1, 1, 1, 1,
-1.195935, -0.932851, -1.819324, 1, 1, 1, 1, 1,
-1.193445, 0.2997597, -1.480263, 1, 1, 1, 1, 1,
-1.18503, -0.6588283, -2.095702, 1, 1, 1, 1, 1,
-1.184198, 0.2706459, -1.805634, 1, 1, 1, 1, 1,
-1.179993, -0.5923202, -1.48759, 1, 1, 1, 1, 1,
-1.179785, 0.1465951, -1.787144, 1, 1, 1, 1, 1,
-1.177407, -0.4430024, -1.726546, 1, 1, 1, 1, 1,
-1.176252, 0.2504895, 0.04487127, 0, 0, 1, 1, 1,
-1.160896, -0.9328342, -2.795421, 1, 0, 0, 1, 1,
-1.160076, -1.084707, -3.086175, 1, 0, 0, 1, 1,
-1.149837, 1.958778, -2.081094, 1, 0, 0, 1, 1,
-1.141461, -0.6131753, -2.190082, 1, 0, 0, 1, 1,
-1.135902, 1.887254, -0.5173498, 1, 0, 0, 1, 1,
-1.131112, -0.0433261, -0.3479342, 0, 0, 0, 1, 1,
-1.120413, 0.6773426, -1.68453, 0, 0, 0, 1, 1,
-1.118001, 0.5518187, -1.095043, 0, 0, 0, 1, 1,
-1.112644, 0.218101, -1.855649, 0, 0, 0, 1, 1,
-1.106488, 0.5750922, -2.673892, 0, 0, 0, 1, 1,
-1.099832, -0.5483263, -2.416808, 0, 0, 0, 1, 1,
-1.096878, 0.6728765, -0.4079449, 0, 0, 0, 1, 1,
-1.096139, 1.146217, -1.85761, 1, 1, 1, 1, 1,
-1.091704, 0.1116219, -3.291818, 1, 1, 1, 1, 1,
-1.087117, -0.8759189, -0.5823127, 1, 1, 1, 1, 1,
-1.083204, -0.7273945, -0.7897186, 1, 1, 1, 1, 1,
-1.072062, -0.005917781, -1.452353, 1, 1, 1, 1, 1,
-1.071333, -1.602452, -0.8881239, 1, 1, 1, 1, 1,
-1.070249, -1.763789, -2.952294, 1, 1, 1, 1, 1,
-1.069189, 1.112213, -1.314268, 1, 1, 1, 1, 1,
-1.06788, -2.241667, -2.00831, 1, 1, 1, 1, 1,
-1.065492, 0.7352746, -2.940197, 1, 1, 1, 1, 1,
-1.059045, 0.03639018, -1.247844, 1, 1, 1, 1, 1,
-1.058763, -0.4880472, 0.6719829, 1, 1, 1, 1, 1,
-1.057563, 1.480669, 0.6097468, 1, 1, 1, 1, 1,
-1.052948, 0.9793199, -1.024037, 1, 1, 1, 1, 1,
-1.035345, -0.005324292, -1.7038, 1, 1, 1, 1, 1,
-1.024695, 0.04885265, 0.2982908, 0, 0, 1, 1, 1,
-1.012051, -1.063533, -1.131691, 1, 0, 0, 1, 1,
-1.0075, 0.1334163, -2.662846, 1, 0, 0, 1, 1,
-1.005865, -0.4526012, -3.618556, 1, 0, 0, 1, 1,
-1.00228, 0.8462577, 1.23031, 1, 0, 0, 1, 1,
-0.9986927, 0.3120123, -2.27028, 1, 0, 0, 1, 1,
-0.9967691, -0.2776312, -4.149536, 0, 0, 0, 1, 1,
-0.9952895, 0.3589018, -0.7004445, 0, 0, 0, 1, 1,
-0.9927208, -0.6936429, -3.043304, 0, 0, 0, 1, 1,
-0.9912314, 1.545726, -0.1162113, 0, 0, 0, 1, 1,
-0.9890146, -0.5338714, -3.161787, 0, 0, 0, 1, 1,
-0.9586626, 0.2497308, -0.9147502, 0, 0, 0, 1, 1,
-0.9568833, -0.3812546, -1.33145, 0, 0, 0, 1, 1,
-0.9528694, -0.1850981, -2.276959, 1, 1, 1, 1, 1,
-0.952703, 1.258726, 0.2913942, 1, 1, 1, 1, 1,
-0.9414254, 0.8206264, -0.06023834, 1, 1, 1, 1, 1,
-0.9406986, 0.3107566, -1.749207, 1, 1, 1, 1, 1,
-0.9363011, 0.9584215, -1.095795, 1, 1, 1, 1, 1,
-0.9302728, 0.8148913, -2.439127, 1, 1, 1, 1, 1,
-0.9271117, -0.759047, -3.031443, 1, 1, 1, 1, 1,
-0.925885, 2.365719, -0.148139, 1, 1, 1, 1, 1,
-0.9253911, 0.1238258, -2.313567, 1, 1, 1, 1, 1,
-0.9246318, -0.7101901, -0.8023709, 1, 1, 1, 1, 1,
-0.9211026, -0.1137019, -1.753578, 1, 1, 1, 1, 1,
-0.9164091, 0.5988442, -2.527457, 1, 1, 1, 1, 1,
-0.915894, -0.8770319, -0.9854501, 1, 1, 1, 1, 1,
-0.91314, 0.2952499, -2.854203, 1, 1, 1, 1, 1,
-0.9039281, 0.008539326, -0.9922017, 1, 1, 1, 1, 1,
-0.9032248, 0.4006876, -1.168012, 0, 0, 1, 1, 1,
-0.9021063, -0.3338, -1.913787, 1, 0, 0, 1, 1,
-0.9011526, 0.4794653, 0.05634234, 1, 0, 0, 1, 1,
-0.9011461, -1.441921, -2.099522, 1, 0, 0, 1, 1,
-0.8981467, -0.6751984, -1.221292, 1, 0, 0, 1, 1,
-0.8938845, 1.243561, -2.164982, 1, 0, 0, 1, 1,
-0.8791894, -1.043772, -2.944569, 0, 0, 0, 1, 1,
-0.877575, 1.130548, -0.3071869, 0, 0, 0, 1, 1,
-0.8755309, -1.797692, -4.487384, 0, 0, 0, 1, 1,
-0.8746296, -1.50045, -4.359738, 0, 0, 0, 1, 1,
-0.8711792, -1.363192, -4.879069, 0, 0, 0, 1, 1,
-0.8627393, 1.464907, -0.6363205, 0, 0, 0, 1, 1,
-0.8627161, 1.266331, -2.158086, 0, 0, 0, 1, 1,
-0.8616998, 0.06696917, -0.3366849, 1, 1, 1, 1, 1,
-0.861688, 0.3762978, -1.888264, 1, 1, 1, 1, 1,
-0.8594834, 0.7189146, 0.0387168, 1, 1, 1, 1, 1,
-0.8570318, -1.20049, -4.614821, 1, 1, 1, 1, 1,
-0.8569149, 2.826725, 0.47436, 1, 1, 1, 1, 1,
-0.8535275, 2.018831, -1.662653, 1, 1, 1, 1, 1,
-0.8468149, -2.416528, -4.504421, 1, 1, 1, 1, 1,
-0.8425973, 0.6793647, -2.168375, 1, 1, 1, 1, 1,
-0.8418129, 0.9220601, -1.010806, 1, 1, 1, 1, 1,
-0.8381246, 0.5906144, 0.5136183, 1, 1, 1, 1, 1,
-0.8344753, -1.780622, -3.547263, 1, 1, 1, 1, 1,
-0.8319437, -1.247823, -2.153512, 1, 1, 1, 1, 1,
-0.830072, -1.81558, -3.835789, 1, 1, 1, 1, 1,
-0.8255419, 3.085922, -0.6820474, 1, 1, 1, 1, 1,
-0.8241832, -1.831002, -2.072253, 1, 1, 1, 1, 1,
-0.8224322, 0.6306809, -0.936769, 0, 0, 1, 1, 1,
-0.8199876, -0.2032037, -2.092815, 1, 0, 0, 1, 1,
-0.8197807, -0.3472091, -2.770007, 1, 0, 0, 1, 1,
-0.8128801, -1.435841, -2.857498, 1, 0, 0, 1, 1,
-0.8127641, 1.04055, -0.9889397, 1, 0, 0, 1, 1,
-0.8099053, 0.3087628, -1.191182, 1, 0, 0, 1, 1,
-0.8063162, 0.6023384, -0.6628352, 0, 0, 0, 1, 1,
-0.7880694, -0.4212885, -1.645362, 0, 0, 0, 1, 1,
-0.7849315, -0.9326307, -2.877129, 0, 0, 0, 1, 1,
-0.7825484, -0.1134774, -1.142855, 0, 0, 0, 1, 1,
-0.7815015, -2.088401, -3.031049, 0, 0, 0, 1, 1,
-0.7788305, -0.6746824, -3.388854, 0, 0, 0, 1, 1,
-0.7785664, -0.05299191, -3.659357, 0, 0, 0, 1, 1,
-0.7774473, 0.6440588, 0.3793131, 1, 1, 1, 1, 1,
-0.7740646, 0.2126349, -1.851175, 1, 1, 1, 1, 1,
-0.7733902, 1.931615, -0.4794337, 1, 1, 1, 1, 1,
-0.7711401, -0.4860632, -2.8654, 1, 1, 1, 1, 1,
-0.7685481, 1.988229, -0.197964, 1, 1, 1, 1, 1,
-0.7629914, 0.2325575, -2.212511, 1, 1, 1, 1, 1,
-0.7589506, -1.494025, -1.385567, 1, 1, 1, 1, 1,
-0.7574601, 2.211096, -0.661517, 1, 1, 1, 1, 1,
-0.75603, 0.7836845, 0.915068, 1, 1, 1, 1, 1,
-0.7559695, 1.586812, -1.65249, 1, 1, 1, 1, 1,
-0.7504308, -0.6151007, -2.107453, 1, 1, 1, 1, 1,
-0.7406171, 0.9656484, -0.9191836, 1, 1, 1, 1, 1,
-0.7396361, -0.7077026, -2.075652, 1, 1, 1, 1, 1,
-0.7377021, -0.4892956, -1.586169, 1, 1, 1, 1, 1,
-0.7375368, 0.9812699, -0.7724296, 1, 1, 1, 1, 1,
-0.7351484, -0.7177168, -1.901064, 0, 0, 1, 1, 1,
-0.7339002, -0.3243811, -2.172067, 1, 0, 0, 1, 1,
-0.7293515, 0.7836077, 0.5114701, 1, 0, 0, 1, 1,
-0.7261519, -1.098714, -3.10041, 1, 0, 0, 1, 1,
-0.7258935, 0.7517424, 0.9371404, 1, 0, 0, 1, 1,
-0.7188154, -1.470222, -1.720856, 1, 0, 0, 1, 1,
-0.7123182, -0.1601357, -2.059038, 0, 0, 0, 1, 1,
-0.7106343, 0.4814683, -0.7574531, 0, 0, 0, 1, 1,
-0.7087898, -2.216221, -2.425821, 0, 0, 0, 1, 1,
-0.7083424, -1.503235, -3.816483, 0, 0, 0, 1, 1,
-0.7057974, 0.4593129, -1.93134, 0, 0, 0, 1, 1,
-0.6992484, -0.7020155, -1.744726, 0, 0, 0, 1, 1,
-0.6962657, -1.902376, -2.003185, 0, 0, 0, 1, 1,
-0.6889727, -0.3525584, -1.296833, 1, 1, 1, 1, 1,
-0.6881878, 0.875024, -1.269563, 1, 1, 1, 1, 1,
-0.6830221, -0.6984321, -2.032678, 1, 1, 1, 1, 1,
-0.6824143, -0.4238093, -2.048423, 1, 1, 1, 1, 1,
-0.6821714, 0.3309942, -1.029962, 1, 1, 1, 1, 1,
-0.6761551, -0.7820814, -1.77928, 1, 1, 1, 1, 1,
-0.6718103, -1.186496, -1.904181, 1, 1, 1, 1, 1,
-0.668241, 0.5067799, -0.2417051, 1, 1, 1, 1, 1,
-0.6579822, 1.203828, 1.448462, 1, 1, 1, 1, 1,
-0.6550421, 1.2124, -2.632038, 1, 1, 1, 1, 1,
-0.6547862, 0.01491756, -2.344897, 1, 1, 1, 1, 1,
-0.6540939, -1.621974, -1.59532, 1, 1, 1, 1, 1,
-0.6530089, -1.246794, -1.55029, 1, 1, 1, 1, 1,
-0.6511431, 0.1998787, -0.3768059, 1, 1, 1, 1, 1,
-0.6480716, 1.011477, -1.090489, 1, 1, 1, 1, 1,
-0.6447241, 0.03578724, -1.679179, 0, 0, 1, 1, 1,
-0.6437756, -1.005971, -2.625602, 1, 0, 0, 1, 1,
-0.6379807, 1.170983, 0.6843656, 1, 0, 0, 1, 1,
-0.6355895, -2.227174, -3.92206, 1, 0, 0, 1, 1,
-0.6334642, 0.1251268, -1.345862, 1, 0, 0, 1, 1,
-0.6317204, -0.01833116, 0.739848, 1, 0, 0, 1, 1,
-0.6244, -1.362257, -3.58298, 0, 0, 0, 1, 1,
-0.6170019, -0.2703238, -1.198969, 0, 0, 0, 1, 1,
-0.6124427, 0.3040451, -0.8932777, 0, 0, 0, 1, 1,
-0.6014403, 0.3476045, -0.4145925, 0, 0, 0, 1, 1,
-0.5975717, -1.500467, -1.891681, 0, 0, 0, 1, 1,
-0.5973929, 1.280561, -1.636183, 0, 0, 0, 1, 1,
-0.5950131, -0.1200008, -2.538936, 0, 0, 0, 1, 1,
-0.5949235, 0.8049914, -0.173373, 1, 1, 1, 1, 1,
-0.5944026, 0.932266, 0.4781463, 1, 1, 1, 1, 1,
-0.5918744, -0.875976, -1.335301, 1, 1, 1, 1, 1,
-0.5901353, 1.131482, -0.005005967, 1, 1, 1, 1, 1,
-0.5900422, 0.05046086, -1.804729, 1, 1, 1, 1, 1,
-0.5900146, -0.2257702, -2.40522, 1, 1, 1, 1, 1,
-0.5842549, 0.7693478, -0.04048797, 1, 1, 1, 1, 1,
-0.5800661, -1.501875, -3.736799, 1, 1, 1, 1, 1,
-0.5791638, 1.228138, -0.3474415, 1, 1, 1, 1, 1,
-0.5743173, -1.356406, -1.877392, 1, 1, 1, 1, 1,
-0.56985, 1.097322, 0.6218404, 1, 1, 1, 1, 1,
-0.5646971, 1.051821, -1.670601, 1, 1, 1, 1, 1,
-0.5633948, -0.1183631, -1.649096, 1, 1, 1, 1, 1,
-0.5600412, -0.7686022, -1.41602, 1, 1, 1, 1, 1,
-0.5562546, 0.5213795, -0.1446377, 1, 1, 1, 1, 1,
-0.5549049, 1.395583, -2.837683, 0, 0, 1, 1, 1,
-0.5482836, 0.6640265, 0.7036623, 1, 0, 0, 1, 1,
-0.5451899, -2.158031, -1.640205, 1, 0, 0, 1, 1,
-0.5446568, 0.2538268, 0.3817725, 1, 0, 0, 1, 1,
-0.540396, -0.1968333, -1.529854, 1, 0, 0, 1, 1,
-0.5332752, 0.8477638, 0.6584876, 1, 0, 0, 1, 1,
-0.5262922, -0.9496829, -1.966885, 0, 0, 0, 1, 1,
-0.5192175, 1.503731, -1.663424, 0, 0, 0, 1, 1,
-0.5187686, -0.427798, -3.523656, 0, 0, 0, 1, 1,
-0.5159189, -0.287239, -2.868464, 0, 0, 0, 1, 1,
-0.5126411, 0.8755069, -0.8230228, 0, 0, 0, 1, 1,
-0.5112361, -1.007748, -2.633355, 0, 0, 0, 1, 1,
-0.5034605, 0.0540367, -1.664445, 0, 0, 0, 1, 1,
-0.5024154, 1.998008, 0.2825126, 1, 1, 1, 1, 1,
-0.5015535, 0.05877491, -3.648558, 1, 1, 1, 1, 1,
-0.4949377, -1.650609, -5.64287, 1, 1, 1, 1, 1,
-0.4918223, 0.4080094, -0.9034951, 1, 1, 1, 1, 1,
-0.4878067, -1.214299, -3.1512, 1, 1, 1, 1, 1,
-0.4858271, 0.964155, -1.755305, 1, 1, 1, 1, 1,
-0.4852536, -0.02341185, -1.831145, 1, 1, 1, 1, 1,
-0.4806213, 0.2945457, -1.15436, 1, 1, 1, 1, 1,
-0.4788375, 0.2489949, -1.223323, 1, 1, 1, 1, 1,
-0.4784841, 1.618254, 0.2802637, 1, 1, 1, 1, 1,
-0.475843, -2.731446, -3.368106, 1, 1, 1, 1, 1,
-0.474691, 0.6614822, 0.2123322, 1, 1, 1, 1, 1,
-0.4745581, 1.122657, -1.885796, 1, 1, 1, 1, 1,
-0.4713715, 1.459124, 0.3408819, 1, 1, 1, 1, 1,
-0.4633347, 0.4149621, -0.3303878, 1, 1, 1, 1, 1,
-0.4590842, -1.498948, -2.308454, 0, 0, 1, 1, 1,
-0.4585272, 1.820838, -0.2105735, 1, 0, 0, 1, 1,
-0.4566693, -0.07572256, -1.300059, 1, 0, 0, 1, 1,
-0.4543739, 0.8812495, -1.984424, 1, 0, 0, 1, 1,
-0.4515792, 0.7647673, -1.104826, 1, 0, 0, 1, 1,
-0.4481549, -1.416499, -3.366923, 1, 0, 0, 1, 1,
-0.4478289, 0.05463239, -0.5920023, 0, 0, 0, 1, 1,
-0.4435657, -0.5035827, -4.207875, 0, 0, 0, 1, 1,
-0.4405166, -0.3020951, -3.366992, 0, 0, 0, 1, 1,
-0.4346802, 1.405451, -0.7349306, 0, 0, 0, 1, 1,
-0.4304549, -0.6889804, -0.8793059, 0, 0, 0, 1, 1,
-0.4301524, 0.8343284, -1.167309, 0, 0, 0, 1, 1,
-0.4258218, -0.7044795, -3.931384, 0, 0, 0, 1, 1,
-0.423264, -1.130302, -3.372561, 1, 1, 1, 1, 1,
-0.4208496, -0.08697992, -2.423053, 1, 1, 1, 1, 1,
-0.4201306, -0.6248247, -1.386109, 1, 1, 1, 1, 1,
-0.4197108, -1.325744, -2.847096, 1, 1, 1, 1, 1,
-0.419025, -0.2586977, -3.35514, 1, 1, 1, 1, 1,
-0.4173673, -0.9478069, -2.694344, 1, 1, 1, 1, 1,
-0.4114092, 1.340731, 0.8162115, 1, 1, 1, 1, 1,
-0.4038726, 0.01523387, -2.84279, 1, 1, 1, 1, 1,
-0.4021996, 0.09237808, -3.482307, 1, 1, 1, 1, 1,
-0.3955052, -0.09787065, -2.326576, 1, 1, 1, 1, 1,
-0.3926335, -0.3973476, -2.748966, 1, 1, 1, 1, 1,
-0.3895748, -0.8415523, -3.184954, 1, 1, 1, 1, 1,
-0.3847129, -1.090117, -3.694283, 1, 1, 1, 1, 1,
-0.3825392, -0.1969082, -1.9868, 1, 1, 1, 1, 1,
-0.3777112, -0.6941652, -3.656386, 1, 1, 1, 1, 1,
-0.3749324, 0.08438683, 0.1183419, 0, 0, 1, 1, 1,
-0.3711447, 0.5421255, -0.7223191, 1, 0, 0, 1, 1,
-0.3691395, 1.591626, 0.3265768, 1, 0, 0, 1, 1,
-0.3651716, -0.09534235, -1.309872, 1, 0, 0, 1, 1,
-0.3604782, -0.5794852, -2.136933, 1, 0, 0, 1, 1,
-0.3602881, 0.457866, -0.231214, 1, 0, 0, 1, 1,
-0.3584082, -1.686894, -3.912702, 0, 0, 0, 1, 1,
-0.3567361, -0.251996, -2.893346, 0, 0, 0, 1, 1,
-0.3555032, 0.5128077, -0.1631664, 0, 0, 0, 1, 1,
-0.35544, 0.3091444, -1.701485, 0, 0, 0, 1, 1,
-0.3536035, 1.419976, 0.6552255, 0, 0, 0, 1, 1,
-0.3501217, -0.3790558, -0.6854144, 0, 0, 0, 1, 1,
-0.3490351, -0.2472538, -3.654375, 0, 0, 0, 1, 1,
-0.3459311, -0.8191946, -2.960348, 1, 1, 1, 1, 1,
-0.3429906, -1.045593, -3.970404, 1, 1, 1, 1, 1,
-0.3417769, -0.07777029, -1.709038, 1, 1, 1, 1, 1,
-0.3387265, -0.2227803, -0.9089993, 1, 1, 1, 1, 1,
-0.3373947, -0.4694835, -0.7979948, 1, 1, 1, 1, 1,
-0.3362221, -0.5651436, -1.483466, 1, 1, 1, 1, 1,
-0.3360779, 0.2036883, 0.3316694, 1, 1, 1, 1, 1,
-0.3299696, 0.861559, -0.3817307, 1, 1, 1, 1, 1,
-0.3289639, -0.4717584, -2.831745, 1, 1, 1, 1, 1,
-0.3289217, 0.1609764, -0.8228068, 1, 1, 1, 1, 1,
-0.3287391, 0.8745801, -1.592647, 1, 1, 1, 1, 1,
-0.3274797, 0.796357, -1.308354, 1, 1, 1, 1, 1,
-0.3249219, 1.598589, 0.511459, 1, 1, 1, 1, 1,
-0.32366, -0.6725752, -4.436862, 1, 1, 1, 1, 1,
-0.323378, -0.07498489, -2.222147, 1, 1, 1, 1, 1,
-0.3134515, 1.104008, -0.5589025, 0, 0, 1, 1, 1,
-0.3118461, -1.493892, -4.740465, 1, 0, 0, 1, 1,
-0.3085714, 1.604645, -0.5792462, 1, 0, 0, 1, 1,
-0.3081338, -0.742188, -1.764589, 1, 0, 0, 1, 1,
-0.3062132, 0.5140197, -0.1678975, 1, 0, 0, 1, 1,
-0.3041535, -0.5337855, -0.7500035, 1, 0, 0, 1, 1,
-0.2997079, 1.054297, -0.7236764, 0, 0, 0, 1, 1,
-0.2943537, -0.05860417, -1.156304, 0, 0, 0, 1, 1,
-0.2918048, 0.0220313, -2.138885, 0, 0, 0, 1, 1,
-0.2916358, -0.1458394, -3.380564, 0, 0, 0, 1, 1,
-0.284557, -0.2542702, -1.862023, 0, 0, 0, 1, 1,
-0.2845241, -0.8510709, -1.880434, 0, 0, 0, 1, 1,
-0.2737406, 2.640661, -1.79846, 0, 0, 0, 1, 1,
-0.2730415, 0.6645844, -1.383132, 1, 1, 1, 1, 1,
-0.2693798, 0.4387812, -0.779491, 1, 1, 1, 1, 1,
-0.2668973, 0.7004722, 0.3827969, 1, 1, 1, 1, 1,
-0.2630525, -0.8355715, -4.368744, 1, 1, 1, 1, 1,
-0.2628118, -0.3905813, -2.159955, 1, 1, 1, 1, 1,
-0.2620109, -1.34084, -4.628672, 1, 1, 1, 1, 1,
-0.2617732, -0.2657752, -2.417814, 1, 1, 1, 1, 1,
-0.2493291, -0.8443444, -3.333889, 1, 1, 1, 1, 1,
-0.2460537, 0.2723834, -0.4163249, 1, 1, 1, 1, 1,
-0.2406231, 0.3266436, -0.3108666, 1, 1, 1, 1, 1,
-0.2392997, -1.284734, -2.473003, 1, 1, 1, 1, 1,
-0.2341024, -0.9523412, -2.93247, 1, 1, 1, 1, 1,
-0.2331189, 0.762613, 2.355793, 1, 1, 1, 1, 1,
-0.231779, 0.05282462, -0.006762592, 1, 1, 1, 1, 1,
-0.2309232, 0.9549994, -1.034104, 1, 1, 1, 1, 1,
-0.2303352, 0.7774922, -1.793789, 0, 0, 1, 1, 1,
-0.2168672, -1.360911, -2.85537, 1, 0, 0, 1, 1,
-0.2140258, -0.2522388, -1.259161, 1, 0, 0, 1, 1,
-0.2120167, -0.9319674, -4.59741, 1, 0, 0, 1, 1,
-0.2107771, 1.805937, -0.9510785, 1, 0, 0, 1, 1,
-0.2099649, 1.833758, -0.3029408, 1, 0, 0, 1, 1,
-0.2078157, 0.7683749, -0.8564323, 0, 0, 0, 1, 1,
-0.2076816, -1.139971, -2.146472, 0, 0, 0, 1, 1,
-0.2070879, -0.3656551, -2.843068, 0, 0, 0, 1, 1,
-0.2063642, 0.9369958, 0.6212364, 0, 0, 0, 1, 1,
-0.2061037, -0.5496815, -3.478224, 0, 0, 0, 1, 1,
-0.2032978, 1.011854, -0.2523577, 0, 0, 0, 1, 1,
-0.2004417, -1.076138, -4.117438, 0, 0, 0, 1, 1,
-0.1950212, 1.207066, -0.3679999, 1, 1, 1, 1, 1,
-0.1930962, -0.9778734, -3.011918, 1, 1, 1, 1, 1,
-0.1831385, 0.4532361, -0.1920392, 1, 1, 1, 1, 1,
-0.1807023, 0.06052195, -0.1498501, 1, 1, 1, 1, 1,
-0.1775538, -0.03125956, -1.59027, 1, 1, 1, 1, 1,
-0.1768275, -1.089518, -2.630466, 1, 1, 1, 1, 1,
-0.1694593, 0.1467927, 0.3098507, 1, 1, 1, 1, 1,
-0.1689869, -0.4680025, -2.980902, 1, 1, 1, 1, 1,
-0.1684145, -0.9184419, -3.327867, 1, 1, 1, 1, 1,
-0.162246, 0.8319404, 0.2875927, 1, 1, 1, 1, 1,
-0.1617793, -0.544736, -2.292159, 1, 1, 1, 1, 1,
-0.1564374, 1.055376, -0.9682762, 1, 1, 1, 1, 1,
-0.1482716, 0.7043401, -0.7532763, 1, 1, 1, 1, 1,
-0.1474943, -0.8157196, -3.596054, 1, 1, 1, 1, 1,
-0.144618, -0.451085, -2.750529, 1, 1, 1, 1, 1,
-0.143699, -0.4495248, -2.300396, 0, 0, 1, 1, 1,
-0.14331, 0.7804247, -0.4751734, 1, 0, 0, 1, 1,
-0.1412111, -1.208694, -4.068914, 1, 0, 0, 1, 1,
-0.139221, 0.2688885, 0.04374078, 1, 0, 0, 1, 1,
-0.1368473, 0.5551572, -1.254331, 1, 0, 0, 1, 1,
-0.1299679, 1.361089, 0.5339558, 1, 0, 0, 1, 1,
-0.126748, -1.582613, -2.213922, 0, 0, 0, 1, 1,
-0.1264238, -1.650892, -2.668411, 0, 0, 0, 1, 1,
-0.123083, 0.707638, -0.7020726, 0, 0, 0, 1, 1,
-0.1223359, 0.3471992, -0.6287259, 0, 0, 0, 1, 1,
-0.1174924, -1.15948, -4.829998, 0, 0, 0, 1, 1,
-0.11552, 1.925501, 0.357136, 0, 0, 0, 1, 1,
-0.113317, -2.85618, -2.231907, 0, 0, 0, 1, 1,
-0.108572, 0.391933, 1.17437, 1, 1, 1, 1, 1,
-0.1068575, -0.1870437, -4.105915, 1, 1, 1, 1, 1,
-0.105764, 1.188294, 1.097353, 1, 1, 1, 1, 1,
-0.1038, -0.90655, -4.278643, 1, 1, 1, 1, 1,
-0.1033953, -0.5350608, -3.033783, 1, 1, 1, 1, 1,
-0.1031945, 0.70218, 1.175282, 1, 1, 1, 1, 1,
-0.1028485, -1.779891, -4.44206, 1, 1, 1, 1, 1,
-0.09926699, 0.1754461, 1.283631, 1, 1, 1, 1, 1,
-0.09185745, -0.4988983, -4.061692, 1, 1, 1, 1, 1,
-0.08736782, 0.5581632, -1.652052, 1, 1, 1, 1, 1,
-0.08399691, 1.463942, -0.9710461, 1, 1, 1, 1, 1,
-0.08368412, -0.225776, -2.748094, 1, 1, 1, 1, 1,
-0.08289341, -0.2742432, -2.070177, 1, 1, 1, 1, 1,
-0.0805093, 0.7458375, -0.2266365, 1, 1, 1, 1, 1,
-0.07935405, -0.919505, -3.353664, 1, 1, 1, 1, 1,
-0.07586742, -1.478779, -4.184919, 0, 0, 1, 1, 1,
-0.07522869, -2.776814, -2.867288, 1, 0, 0, 1, 1,
-0.07511507, 0.6338561, -0.4842367, 1, 0, 0, 1, 1,
-0.07421545, -0.6073381, -2.051671, 1, 0, 0, 1, 1,
-0.07350153, 1.345744, 1.593021, 1, 0, 0, 1, 1,
-0.07341608, 2.243865, 0.06506503, 1, 0, 0, 1, 1,
-0.07204769, -0.03228334, -2.847991, 0, 0, 0, 1, 1,
-0.07202735, 1.472723, 1.930128, 0, 0, 0, 1, 1,
-0.06721272, 0.8016961, 1.747432, 0, 0, 0, 1, 1,
-0.06506203, -0.3413003, -0.3766767, 0, 0, 0, 1, 1,
-0.06489249, 1.347773, -1.106633, 0, 0, 0, 1, 1,
-0.06438054, 0.6404443, -0.008662244, 0, 0, 0, 1, 1,
-0.06169356, 1.838732, -1.005048, 0, 0, 0, 1, 1,
-0.05745674, -0.8568748, -2.058016, 1, 1, 1, 1, 1,
-0.05728608, -0.8415049, -4.416955, 1, 1, 1, 1, 1,
-0.05719894, 0.6471235, -0.4535044, 1, 1, 1, 1, 1,
-0.05718103, -0.09746443, -3.601396, 1, 1, 1, 1, 1,
-0.05557819, -0.05663485, -2.213245, 1, 1, 1, 1, 1,
-0.05059616, -1.926969, -2.432259, 1, 1, 1, 1, 1,
-0.05045714, 1.238382, 0.1566368, 1, 1, 1, 1, 1,
-0.04872947, -0.914943, -1.757567, 1, 1, 1, 1, 1,
-0.04852961, 0.5965574, 0.369114, 1, 1, 1, 1, 1,
-0.04758236, 1.243406, -0.1581145, 1, 1, 1, 1, 1,
-0.04605047, -0.4294091, -3.706625, 1, 1, 1, 1, 1,
-0.03860794, -0.3333597, -2.512724, 1, 1, 1, 1, 1,
-0.03228601, 0.8376076, -1.182119, 1, 1, 1, 1, 1,
-0.02956912, 1.253058, 1.341548, 1, 1, 1, 1, 1,
-0.02726388, -1.358014, -3.304971, 1, 1, 1, 1, 1,
-0.02545522, 0.3444024, -0.4286462, 0, 0, 1, 1, 1,
-0.01768404, -0.9564794, -2.9953, 1, 0, 0, 1, 1,
-0.01482495, 0.9160482, -0.07770073, 1, 0, 0, 1, 1,
-0.01456741, 0.2466649, -0.362996, 1, 0, 0, 1, 1,
-0.01368481, -1.150153, -2.600905, 1, 0, 0, 1, 1,
-0.005954899, 1.129162, 0.347047, 1, 0, 0, 1, 1,
-0.005851645, 0.3067861, 0.02135187, 0, 0, 0, 1, 1,
-0.004095965, -0.7132927, -2.329533, 0, 0, 0, 1, 1,
-0.0007547658, -1.757103, -3.000519, 0, 0, 0, 1, 1,
0.001304025, 1.178674, -0.8591661, 0, 0, 0, 1, 1,
0.005198911, 0.6479683, 0.3580197, 0, 0, 0, 1, 1,
0.007095344, 0.0203542, 0.2689112, 0, 0, 0, 1, 1,
0.008143545, -0.5286341, 2.338228, 0, 0, 0, 1, 1,
0.009943372, 0.1949747, 0.8446983, 1, 1, 1, 1, 1,
0.01023189, 0.921984, 1.108834, 1, 1, 1, 1, 1,
0.01117307, 0.5247288, -0.1263827, 1, 1, 1, 1, 1,
0.01292545, -0.5084448, 4.736617, 1, 1, 1, 1, 1,
0.01561928, -1.006932, 3.578143, 1, 1, 1, 1, 1,
0.01905469, 0.08526091, -1.208491, 1, 1, 1, 1, 1,
0.02234272, -1.486686, 2.538285, 1, 1, 1, 1, 1,
0.03030234, -0.9106028, 3.619063, 1, 1, 1, 1, 1,
0.03351183, 0.3244356, -0.7300649, 1, 1, 1, 1, 1,
0.03556872, 2.909953, -0.1635352, 1, 1, 1, 1, 1,
0.03792839, 0.2159801, 0.8491683, 1, 1, 1, 1, 1,
0.03934212, 0.6438114, 0.07746696, 1, 1, 1, 1, 1,
0.04137241, 0.21672, 1.44595, 1, 1, 1, 1, 1,
0.04183032, 0.6568871, -0.1799287, 1, 1, 1, 1, 1,
0.04295364, 1.547046, -0.5542849, 1, 1, 1, 1, 1,
0.04322233, -0.7294415, 3.892426, 0, 0, 1, 1, 1,
0.04804247, -2.551767, 1.37051, 1, 0, 0, 1, 1,
0.05148929, -0.348279, 5.210663, 1, 0, 0, 1, 1,
0.05397488, -0.7454359, 3.440481, 1, 0, 0, 1, 1,
0.05870828, -0.2526523, 3.680574, 1, 0, 0, 1, 1,
0.0589812, -2.58814, 3.242789, 1, 0, 0, 1, 1,
0.06166212, -0.5822401, 3.145276, 0, 0, 0, 1, 1,
0.0623945, 0.3236597, 0.6955943, 0, 0, 0, 1, 1,
0.06389388, -0.04494587, 1.336928, 0, 0, 0, 1, 1,
0.0646502, 1.272488, 0.04945077, 0, 0, 0, 1, 1,
0.06469952, -0.3045304, 4.658162, 0, 0, 0, 1, 1,
0.07023249, -0.7410908, 2.506268, 0, 0, 0, 1, 1,
0.07328158, -1.03196, 2.37419, 0, 0, 0, 1, 1,
0.07514791, 0.407342, -0.903811, 1, 1, 1, 1, 1,
0.07761799, 0.3441921, -0.719142, 1, 1, 1, 1, 1,
0.07802518, -1.191234, 3.482841, 1, 1, 1, 1, 1,
0.08076648, -1.210787, 2.559698, 1, 1, 1, 1, 1,
0.08294935, -0.2365957, 2.91653, 1, 1, 1, 1, 1,
0.0833924, -0.1339093, 2.094347, 1, 1, 1, 1, 1,
0.08399571, -0.1285769, 2.551888, 1, 1, 1, 1, 1,
0.08487473, 0.0283686, 0.3139087, 1, 1, 1, 1, 1,
0.08569135, 1.548377, 0.6034706, 1, 1, 1, 1, 1,
0.09384428, -0.3211168, 1.139518, 1, 1, 1, 1, 1,
0.09553964, 0.3492024, 0.09424518, 1, 1, 1, 1, 1,
0.09791222, 2.598426, -0.08101156, 1, 1, 1, 1, 1,
0.09817528, 0.1905978, 1.59626, 1, 1, 1, 1, 1,
0.09817667, 0.6921569, -0.6331723, 1, 1, 1, 1, 1,
0.1045157, -0.5888461, 3.79447, 1, 1, 1, 1, 1,
0.1065166, -1.306641, 2.761296, 0, 0, 1, 1, 1,
0.1066061, 1.417814, 0.1024787, 1, 0, 0, 1, 1,
0.1126649, 0.1016749, -1.470111, 1, 0, 0, 1, 1,
0.1135611, -2.31837, 4.25955, 1, 0, 0, 1, 1,
0.1193171, 0.5883745, -0.3612239, 1, 0, 0, 1, 1,
0.1194309, 0.2609582, 1.324718, 1, 0, 0, 1, 1,
0.1196651, 0.01303727, 1.212815, 0, 0, 0, 1, 1,
0.123837, 1.234098, 0.4554172, 0, 0, 0, 1, 1,
0.1257868, 1.061039, 0.9456837, 0, 0, 0, 1, 1,
0.1278121, 1.018502, 1.386982, 0, 0, 0, 1, 1,
0.1278709, 0.8055134, -1.798965, 0, 0, 0, 1, 1,
0.1280605, -0.457176, 5.055831, 0, 0, 0, 1, 1,
0.1390685, 0.2392766, -0.4860819, 0, 0, 0, 1, 1,
0.1409352, 0.1800431, 0.6738613, 1, 1, 1, 1, 1,
0.1434292, 0.9804093, -1.38908, 1, 1, 1, 1, 1,
0.1529649, -1.133183, 3.209913, 1, 1, 1, 1, 1,
0.1531337, -1.6702, 1.903062, 1, 1, 1, 1, 1,
0.1553725, -1.902703, 2.259849, 1, 1, 1, 1, 1,
0.1580032, -0.05576659, 1.030094, 1, 1, 1, 1, 1,
0.1652787, 0.4997073, 1.639506, 1, 1, 1, 1, 1,
0.1758296, -0.7161397, 2.678157, 1, 1, 1, 1, 1,
0.1836549, 1.353666, -0.01353944, 1, 1, 1, 1, 1,
0.1839976, -0.6654748, 3.858265, 1, 1, 1, 1, 1,
0.1993317, -0.5961607, 1.720414, 1, 1, 1, 1, 1,
0.2000893, -1.139806, 1.599911, 1, 1, 1, 1, 1,
0.2015889, -1.369607, 0.8060797, 1, 1, 1, 1, 1,
0.2017565, -0.4417175, 2.45874, 1, 1, 1, 1, 1,
0.2026623, 0.3176703, 1.509633, 1, 1, 1, 1, 1,
0.203152, 0.8884397, 0.8097107, 0, 0, 1, 1, 1,
0.2067255, 0.3493742, 0.4866251, 1, 0, 0, 1, 1,
0.2103757, 2.049931, 1.130606, 1, 0, 0, 1, 1,
0.2137019, -0.1916217, 1.979687, 1, 0, 0, 1, 1,
0.2152183, -0.7056246, 2.914956, 1, 0, 0, 1, 1,
0.2174578, -0.0461245, 1.375707, 1, 0, 0, 1, 1,
0.2194851, 0.9418921, -0.3041347, 0, 0, 0, 1, 1,
0.2222009, -0.055194, 1.474923, 0, 0, 0, 1, 1,
0.2228049, 0.3423503, 0.2735824, 0, 0, 0, 1, 1,
0.2246057, -0.3378632, 3.110369, 0, 0, 0, 1, 1,
0.2304197, -0.2101389, 1.18972, 0, 0, 0, 1, 1,
0.2315997, -1.032623, 3.316154, 0, 0, 0, 1, 1,
0.2358979, -1.207002, 3.726785, 0, 0, 0, 1, 1,
0.249348, 1.612506, 1.353714, 1, 1, 1, 1, 1,
0.2533067, 1.114054, 1.898091, 1, 1, 1, 1, 1,
0.2534055, 1.039694, 0.4612405, 1, 1, 1, 1, 1,
0.2559353, -0.1494474, 1.133757, 1, 1, 1, 1, 1,
0.25668, -0.8283041, 2.640238, 1, 1, 1, 1, 1,
0.2585339, 0.1558792, 0.4204934, 1, 1, 1, 1, 1,
0.2607689, -0.8724655, 3.103854, 1, 1, 1, 1, 1,
0.2656525, 0.5702637, -0.9986814, 1, 1, 1, 1, 1,
0.2669677, 2.223803, -0.2794772, 1, 1, 1, 1, 1,
0.2673263, -0.7736385, 0.6885018, 1, 1, 1, 1, 1,
0.2709972, -0.6914327, 4.128833, 1, 1, 1, 1, 1,
0.271763, 0.01426753, 1.769327, 1, 1, 1, 1, 1,
0.2807468, 0.5261449, -0.1396504, 1, 1, 1, 1, 1,
0.2823918, -0.5610915, 2.927217, 1, 1, 1, 1, 1,
0.2840437, -1.654997, 2.232478, 1, 1, 1, 1, 1,
0.2841946, -0.3680573, 2.589833, 0, 0, 1, 1, 1,
0.285087, 0.4170548, 2.042531, 1, 0, 0, 1, 1,
0.2875834, -0.4956068, 2.058131, 1, 0, 0, 1, 1,
0.288425, -1.638348, 3.081784, 1, 0, 0, 1, 1,
0.2911126, 0.3397201, 2.456328, 1, 0, 0, 1, 1,
0.2925077, 0.9863182, 2.619701, 1, 0, 0, 1, 1,
0.2958004, -1.518346, 3.539995, 0, 0, 0, 1, 1,
0.2966205, 1.062766, 1.737698, 0, 0, 0, 1, 1,
0.2974657, -1.421497, 3.137634, 0, 0, 0, 1, 1,
0.2996388, -0.09870895, 2.830016, 0, 0, 0, 1, 1,
0.3010359, 0.1428996, 1.736839, 0, 0, 0, 1, 1,
0.3022084, 1.091913, 1.255599, 0, 0, 0, 1, 1,
0.3036907, -1.545087, 0.9988499, 0, 0, 0, 1, 1,
0.3037206, -1.431935, 2.066994, 1, 1, 1, 1, 1,
0.3038041, 0.94162, -0.6385672, 1, 1, 1, 1, 1,
0.3063512, 0.3897614, 0.5425109, 1, 1, 1, 1, 1,
0.3068459, -0.3420792, 2.759634, 1, 1, 1, 1, 1,
0.3108124, 0.6830595, 0.8546472, 1, 1, 1, 1, 1,
0.3142035, 0.9057477, -1.078966, 1, 1, 1, 1, 1,
0.3188532, -0.3908055, 2.55213, 1, 1, 1, 1, 1,
0.3247671, 0.4636382, -0.5309063, 1, 1, 1, 1, 1,
0.3312848, 1.71841, -1.38383, 1, 1, 1, 1, 1,
0.331956, -2.103148, 1.557559, 1, 1, 1, 1, 1,
0.3323021, 1.28588, 2.729558, 1, 1, 1, 1, 1,
0.3335635, 0.7293344, 1.310836, 1, 1, 1, 1, 1,
0.3347645, 1.033957, -1.037018, 1, 1, 1, 1, 1,
0.3370584, -0.6726347, 4.031513, 1, 1, 1, 1, 1,
0.3379853, -0.2484208, 2.289581, 1, 1, 1, 1, 1,
0.3388619, 0.8763944, -0.6749574, 0, 0, 1, 1, 1,
0.341505, -0.2611959, 2.919257, 1, 0, 0, 1, 1,
0.3450244, 0.9263945, -0.4495227, 1, 0, 0, 1, 1,
0.3480322, 0.259683, -0.3471, 1, 0, 0, 1, 1,
0.3523613, -0.7090791, 4.049354, 1, 0, 0, 1, 1,
0.3535491, 0.4019718, 1.211485, 1, 0, 0, 1, 1,
0.3536926, 2.125675, 2.301086, 0, 0, 0, 1, 1,
0.353812, -0.3811016, 2.786854, 0, 0, 0, 1, 1,
0.3564842, 1.690172, -0.2628872, 0, 0, 0, 1, 1,
0.3604942, -1.601289, 3.305961, 0, 0, 0, 1, 1,
0.3610156, 2.991454, 2.913288, 0, 0, 0, 1, 1,
0.3622105, 0.5705064, 0.3140511, 0, 0, 0, 1, 1,
0.3631467, -0.5162148, 2.699903, 0, 0, 0, 1, 1,
0.3672673, -1.25515, 2.232601, 1, 1, 1, 1, 1,
0.3704053, 1.490617, 0.6707578, 1, 1, 1, 1, 1,
0.3714858, 3.428568, 0.861786, 1, 1, 1, 1, 1,
0.3771068, 0.6709925, 0.09674481, 1, 1, 1, 1, 1,
0.3800815, 0.6206488, 0.3190673, 1, 1, 1, 1, 1,
0.3885933, 1.239909, 0.8429042, 1, 1, 1, 1, 1,
0.3890091, 1.510043, 0.4708506, 1, 1, 1, 1, 1,
0.392728, 0.4305682, -0.1573516, 1, 1, 1, 1, 1,
0.3945639, 0.1346774, 1.90301, 1, 1, 1, 1, 1,
0.3980579, -0.3836396, 1.886351, 1, 1, 1, 1, 1,
0.3988914, -1.543057, 3.870541, 1, 1, 1, 1, 1,
0.3994738, 0.01165182, 2.668328, 1, 1, 1, 1, 1,
0.4024793, -0.536753, 2.195883, 1, 1, 1, 1, 1,
0.4046367, -0.531745, 1.373319, 1, 1, 1, 1, 1,
0.4064815, 0.09423698, 1.083741, 1, 1, 1, 1, 1,
0.409375, 1.448875, 1.2823, 0, 0, 1, 1, 1,
0.4094476, 0.2771634, -0.9017365, 1, 0, 0, 1, 1,
0.4121698, 0.2991069, 0.2615995, 1, 0, 0, 1, 1,
0.4151932, 1.353643, -0.3228176, 1, 0, 0, 1, 1,
0.4156472, 0.5523472, 1.294132, 1, 0, 0, 1, 1,
0.4194728, -0.9824409, 3.26008, 1, 0, 0, 1, 1,
0.422191, -1.455911, 4.188124, 0, 0, 0, 1, 1,
0.4222473, -1.394691, 4.488108, 0, 0, 0, 1, 1,
0.4242344, -0.8123497, 2.267719, 0, 0, 0, 1, 1,
0.424472, -1.007717, 3.475848, 0, 0, 0, 1, 1,
0.4313299, -0.1808374, 0.1925314, 0, 0, 0, 1, 1,
0.4365682, -0.7592012, 1.630722, 0, 0, 0, 1, 1,
0.4366556, -1.428101, 3.583501, 0, 0, 0, 1, 1,
0.4369933, 0.2162359, 1.384559, 1, 1, 1, 1, 1,
0.4393337, 1.463772, -1.788141, 1, 1, 1, 1, 1,
0.4458663, -2.530977, 2.321056, 1, 1, 1, 1, 1,
0.446293, 0.2134302, 0.7936106, 1, 1, 1, 1, 1,
0.4469216, 0.7555315, 1.423752, 1, 1, 1, 1, 1,
0.4543044, 0.03369121, 0.7735053, 1, 1, 1, 1, 1,
0.4558128, -0.6194919, 3.649667, 1, 1, 1, 1, 1,
0.4558185, 0.3444418, 0.2167711, 1, 1, 1, 1, 1,
0.4589963, 0.191511, 1.344969, 1, 1, 1, 1, 1,
0.4597402, -0.339945, 3.028386, 1, 1, 1, 1, 1,
0.4637968, 0.1761915, 1.051775, 1, 1, 1, 1, 1,
0.4638459, 0.3399842, 0.2012433, 1, 1, 1, 1, 1,
0.4667668, -0.2974189, 2.998438, 1, 1, 1, 1, 1,
0.4672966, -1.084006, 3.023425, 1, 1, 1, 1, 1,
0.4680394, -0.4550844, 3.488696, 1, 1, 1, 1, 1,
0.4700122, -0.5175257, 1.99384, 0, 0, 1, 1, 1,
0.4702386, -0.8062901, 3.249365, 1, 0, 0, 1, 1,
0.4706805, -1.123289, 1.342464, 1, 0, 0, 1, 1,
0.4735436, -0.16351, 0.4168246, 1, 0, 0, 1, 1,
0.4742956, 0.7498487, -0.4442582, 1, 0, 0, 1, 1,
0.4751858, 0.3768627, 1.295867, 1, 0, 0, 1, 1,
0.4776234, 1.700065, 0.4081348, 0, 0, 0, 1, 1,
0.488361, 1.065867, -0.1858284, 0, 0, 0, 1, 1,
0.4896216, 0.1478025, 1.285811, 0, 0, 0, 1, 1,
0.4923373, 0.04857482, 0.8111544, 0, 0, 0, 1, 1,
0.4924515, 0.4214317, 0.6234037, 0, 0, 0, 1, 1,
0.4946009, -0.8863987, 2.46701, 0, 0, 0, 1, 1,
0.4979918, -1.884964, 3.043162, 0, 0, 0, 1, 1,
0.4988578, -0.04633309, 2.122149, 1, 1, 1, 1, 1,
0.5082921, 0.564914, 0.5613433, 1, 1, 1, 1, 1,
0.5106716, 0.1660121, 1.567002, 1, 1, 1, 1, 1,
0.5127858, 0.5865983, 1.107366, 1, 1, 1, 1, 1,
0.5187546, 0.9875537, 1.604497, 1, 1, 1, 1, 1,
0.5203141, 0.1898159, 2.705863, 1, 1, 1, 1, 1,
0.5226218, -0.1475073, 0.8768026, 1, 1, 1, 1, 1,
0.5246888, 2.182866, -0.2828035, 1, 1, 1, 1, 1,
0.5290889, -0.1667413, -0.3054511, 1, 1, 1, 1, 1,
0.5312418, -0.2239645, 1.00251, 1, 1, 1, 1, 1,
0.5396886, -0.4573447, 2.558583, 1, 1, 1, 1, 1,
0.5399228, -1.804655, 2.921641, 1, 1, 1, 1, 1,
0.544052, 0.7904805, 0.4088828, 1, 1, 1, 1, 1,
0.5447075, 0.2491606, 0.661596, 1, 1, 1, 1, 1,
0.5468397, 0.3798271, 0.545791, 1, 1, 1, 1, 1,
0.5522507, 1.200729, 0.8783175, 0, 0, 1, 1, 1,
0.5552214, 0.8189856, 1.177786, 1, 0, 0, 1, 1,
0.5699987, 0.1410506, 0.2753488, 1, 0, 0, 1, 1,
0.5701196, 0.7750643, 0.3774365, 1, 0, 0, 1, 1,
0.5732551, -0.3494354, 0.9044967, 1, 0, 0, 1, 1,
0.5734305, 1.136888, 0.2903026, 1, 0, 0, 1, 1,
0.5749961, -0.5497779, -0.4067277, 0, 0, 0, 1, 1,
0.5821097, 0.4831025, 0.4345521, 0, 0, 0, 1, 1,
0.5832285, -0.3771279, 0.189411, 0, 0, 0, 1, 1,
0.5840806, -0.9010621, 2.268382, 0, 0, 0, 1, 1,
0.5877689, 0.3263929, 0.9431195, 0, 0, 0, 1, 1,
0.5896665, -0.3769808, 3.527162, 0, 0, 0, 1, 1,
0.5898345, -0.3396763, 4.148096, 0, 0, 0, 1, 1,
0.5903656, -2.195573, 3.873517, 1, 1, 1, 1, 1,
0.5976775, 0.8141751, 1.078845, 1, 1, 1, 1, 1,
0.6009598, -0.3474399, 2.717548, 1, 1, 1, 1, 1,
0.6110307, 0.8754628, -0.4736928, 1, 1, 1, 1, 1,
0.6151389, -0.9321581, 3.858331, 1, 1, 1, 1, 1,
0.6172512, 0.2218859, 0.5892198, 1, 1, 1, 1, 1,
0.6203735, -1.880805, 2.418993, 1, 1, 1, 1, 1,
0.6215672, 0.277998, 1.801622, 1, 1, 1, 1, 1,
0.629126, -0.3424297, 1.791954, 1, 1, 1, 1, 1,
0.6364023, 0.8422843, -0.3113225, 1, 1, 1, 1, 1,
0.6441031, 1.333525, -0.9750936, 1, 1, 1, 1, 1,
0.6461545, 0.5051451, 0.9271711, 1, 1, 1, 1, 1,
0.6462563, 0.2030334, 0.6101192, 1, 1, 1, 1, 1,
0.6515976, -1.169372, 1.53561, 1, 1, 1, 1, 1,
0.6544344, 0.6988845, 2.378674, 1, 1, 1, 1, 1,
0.6551057, 0.002623787, 1.592366, 0, 0, 1, 1, 1,
0.6576183, -0.4318605, 2.361489, 1, 0, 0, 1, 1,
0.6627488, -0.9514847, 1.11553, 1, 0, 0, 1, 1,
0.6684, -1.283847, 2.901397, 1, 0, 0, 1, 1,
0.6709403, -0.9068419, 1.467386, 1, 0, 0, 1, 1,
0.6714814, -0.1928386, 2.815443, 1, 0, 0, 1, 1,
0.6772292, -0.8582053, 0.5826739, 0, 0, 0, 1, 1,
0.6819668, -0.7529561, 2.882276, 0, 0, 0, 1, 1,
0.6845455, 1.359196, 0.9589491, 0, 0, 0, 1, 1,
0.6867357, -0.9588806, 4.176896, 0, 0, 0, 1, 1,
0.6907357, -0.8131794, 1.398259, 0, 0, 0, 1, 1,
0.6909345, -0.6910575, 2.928507, 0, 0, 0, 1, 1,
0.6985112, -1.002432, 0.3796878, 0, 0, 0, 1, 1,
0.6992499, 0.697754, 0.9515869, 1, 1, 1, 1, 1,
0.7034829, -2.435427, 1.986018, 1, 1, 1, 1, 1,
0.7052605, 0.4466179, 1.987105, 1, 1, 1, 1, 1,
0.7090454, -1.538743, 2.589865, 1, 1, 1, 1, 1,
0.7111324, -1.620739, 2.711541, 1, 1, 1, 1, 1,
0.7127074, 0.5856302, -0.1759606, 1, 1, 1, 1, 1,
0.7137089, 0.5919781, 0.52219, 1, 1, 1, 1, 1,
0.7186015, 1.348104, 1.030216, 1, 1, 1, 1, 1,
0.7217664, -1.201314, 1.724665, 1, 1, 1, 1, 1,
0.7268406, -0.5788811, 2.683172, 1, 1, 1, 1, 1,
0.7274255, 1.198664, 0.6212282, 1, 1, 1, 1, 1,
0.7313637, 1.041044, 1.226134, 1, 1, 1, 1, 1,
0.7365673, -0.6769621, 3.821239, 1, 1, 1, 1, 1,
0.7412447, 0.07304945, 1.254057, 1, 1, 1, 1, 1,
0.7413805, 0.1326032, 1.346917, 1, 1, 1, 1, 1,
0.7460821, -0.8139821, 3.314068, 0, 0, 1, 1, 1,
0.7547529, 0.9907364, 2.848644, 1, 0, 0, 1, 1,
0.7573853, -1.562557, 3.029823, 1, 0, 0, 1, 1,
0.7582021, -1.225099, 1.588397, 1, 0, 0, 1, 1,
0.760949, 0.1736432, 0.09567568, 1, 0, 0, 1, 1,
0.7635312, -1.194821, 1.787174, 1, 0, 0, 1, 1,
0.7658013, -0.06527561, 3.358078, 0, 0, 0, 1, 1,
0.7667338, 2.107663, 2.697988, 0, 0, 0, 1, 1,
0.7701354, -1.841957, 2.423922, 0, 0, 0, 1, 1,
0.7801463, 0.8768041, 1.784454, 0, 0, 0, 1, 1,
0.7802417, 0.9657124, 1.532155, 0, 0, 0, 1, 1,
0.7809593, 0.9160718, 0.6408072, 0, 0, 0, 1, 1,
0.7818018, 2.193252, 1.650971, 0, 0, 0, 1, 1,
0.7910333, -0.08289262, 1.599381, 1, 1, 1, 1, 1,
0.7925828, 0.7369399, -0.4002818, 1, 1, 1, 1, 1,
0.7950792, 0.5229456, -0.1058049, 1, 1, 1, 1, 1,
0.802442, 0.4363213, 0.3123546, 1, 1, 1, 1, 1,
0.804178, 0.6870696, -0.07151153, 1, 1, 1, 1, 1,
0.8053231, 0.7057191, 0.6218931, 1, 1, 1, 1, 1,
0.8054307, -2.360763, 1.198775, 1, 1, 1, 1, 1,
0.8185936, -1.308909, 3.03616, 1, 1, 1, 1, 1,
0.8215464, -0.6179479, 2.033706, 1, 1, 1, 1, 1,
0.8263438, -0.730305, 1.692683, 1, 1, 1, 1, 1,
0.830759, -1.305533, 1.504945, 1, 1, 1, 1, 1,
0.8370645, -2.332437, 2.569885, 1, 1, 1, 1, 1,
0.8402641, -0.3675576, 1.650279, 1, 1, 1, 1, 1,
0.8469981, -1.621893, 4.020114, 1, 1, 1, 1, 1,
0.8508188, 0.2845726, 1.209846, 1, 1, 1, 1, 1,
0.8514397, 0.3910645, 0.4366491, 0, 0, 1, 1, 1,
0.8617113, 0.01717699, 1.012336, 1, 0, 0, 1, 1,
0.8633379, 1.647586, 1.587693, 1, 0, 0, 1, 1,
0.8635314, -2.032773, 4.146085, 1, 0, 0, 1, 1,
0.866468, -0.07603218, 0.829735, 1, 0, 0, 1, 1,
0.8679609, 0.5665888, 0.8085815, 1, 0, 0, 1, 1,
0.8726177, 0.5585691, -0.00455706, 0, 0, 0, 1, 1,
0.873665, -0.8959138, 2.670381, 0, 0, 0, 1, 1,
0.8751084, -0.5318715, 1.579906, 0, 0, 0, 1, 1,
0.8762023, 0.846929, -0.09881482, 0, 0, 0, 1, 1,
0.8809941, 0.9148269, 1.117209, 0, 0, 0, 1, 1,
0.8821274, 0.2919352, 0.6468341, 0, 0, 0, 1, 1,
0.8832365, -1.187772, 2.872438, 0, 0, 0, 1, 1,
0.8838207, -1.617392, 2.602882, 1, 1, 1, 1, 1,
0.8845137, -0.7955992, 0.8585333, 1, 1, 1, 1, 1,
0.8864596, -0.8832392, 2.774504, 1, 1, 1, 1, 1,
0.8952155, -0.0995201, 2.7831, 1, 1, 1, 1, 1,
0.8976146, 0.9857846, 1.241166, 1, 1, 1, 1, 1,
0.8990081, 0.1027301, 1.277974, 1, 1, 1, 1, 1,
0.9026727, -1.548251, 3.731771, 1, 1, 1, 1, 1,
0.9078672, 0.2211475, -1.170912, 1, 1, 1, 1, 1,
0.9194274, 0.5967983, 2.099713, 1, 1, 1, 1, 1,
0.9196714, 1.236224, 2.253396, 1, 1, 1, 1, 1,
0.9209523, -1.052466, 0.1733143, 1, 1, 1, 1, 1,
0.9249032, 0.5590238, -0.0705417, 1, 1, 1, 1, 1,
0.9291995, 0.5455808, 0.3129127, 1, 1, 1, 1, 1,
0.9321435, -0.1170117, 0.3681047, 1, 1, 1, 1, 1,
0.9457588, 0.6715446, 2.045845, 1, 1, 1, 1, 1,
0.9567788, -0.8451742, 4.177407, 0, 0, 1, 1, 1,
0.9602814, -0.2808658, 2.490854, 1, 0, 0, 1, 1,
0.9610517, 0.3898499, 0.2542608, 1, 0, 0, 1, 1,
0.9618756, 1.059884, 1.22915, 1, 0, 0, 1, 1,
0.963755, 0.1595916, -0.06560456, 1, 0, 0, 1, 1,
0.9732459, -0.7907074, 2.395459, 1, 0, 0, 1, 1,
0.9736366, 1.961516, 1.196441, 0, 0, 0, 1, 1,
0.9756046, 0.7659057, 1.150835, 0, 0, 0, 1, 1,
0.9803843, -0.7936645, 2.676497, 0, 0, 0, 1, 1,
0.996475, 0.04811937, 0.8039551, 0, 0, 0, 1, 1,
0.9981868, -0.5446345, 2.189371, 0, 0, 0, 1, 1,
1.000958, 0.8803506, 1.509664, 0, 0, 0, 1, 1,
1.005506, -1.074603, 2.025775, 0, 0, 0, 1, 1,
1.014313, -0.4180727, 2.981272, 1, 1, 1, 1, 1,
1.015911, 2.410296, 0.6127076, 1, 1, 1, 1, 1,
1.016671, -1.35958, 3.191794, 1, 1, 1, 1, 1,
1.019994, -1.241237, 2.800016, 1, 1, 1, 1, 1,
1.020904, -0.4298483, 0.871075, 1, 1, 1, 1, 1,
1.022254, -1.004271, 3.389143, 1, 1, 1, 1, 1,
1.031715, 0.6670538, 3.527491, 1, 1, 1, 1, 1,
1.045811, -1.6929, 1.089783, 1, 1, 1, 1, 1,
1.046595, 0.4541852, 1.649954, 1, 1, 1, 1, 1,
1.05126, 1.043496, 2.124115, 1, 1, 1, 1, 1,
1.056938, 0.9243484, 0.9488173, 1, 1, 1, 1, 1,
1.058795, -1.206284, 4.315676, 1, 1, 1, 1, 1,
1.069217, 0.409777, 1.397582, 1, 1, 1, 1, 1,
1.071069, 0.6704995, 0.7955516, 1, 1, 1, 1, 1,
1.080397, -0.1215001, 1.935657, 1, 1, 1, 1, 1,
1.090638, 0.5395894, 3.209831, 0, 0, 1, 1, 1,
1.090834, 1.2778, -0.3146043, 1, 0, 0, 1, 1,
1.09312, 0.2261762, 1.826931, 1, 0, 0, 1, 1,
1.102543, 1.503538, 0.9190298, 1, 0, 0, 1, 1,
1.105979, 0.3709416, 0.4386873, 1, 0, 0, 1, 1,
1.10645, 1.23596, -0.4528925, 1, 0, 0, 1, 1,
1.110541, -0.3921309, 3.427911, 0, 0, 0, 1, 1,
1.117392, 0.4197109, 0.2989572, 0, 0, 0, 1, 1,
1.117846, 0.783193, 2.465767, 0, 0, 0, 1, 1,
1.124373, 0.6797799, 3.527754, 0, 0, 0, 1, 1,
1.126781, 0.4558656, 0.2194167, 0, 0, 0, 1, 1,
1.134316, 0.4909031, 0.9234705, 0, 0, 0, 1, 1,
1.152289, 0.6857802, 0.2778049, 0, 0, 0, 1, 1,
1.157165, -0.6484069, 1.240399, 1, 1, 1, 1, 1,
1.164011, -0.5132892, 0.4748838, 1, 1, 1, 1, 1,
1.170292, -0.7069268, 2.727061, 1, 1, 1, 1, 1,
1.197142, -0.6099752, 2.21995, 1, 1, 1, 1, 1,
1.198032, 0.8206776, 1.142291, 1, 1, 1, 1, 1,
1.205232, -0.8460473, 4.004459, 1, 1, 1, 1, 1,
1.21972, 0.3199459, 1.885454, 1, 1, 1, 1, 1,
1.221725, 0.2512148, 1.711034, 1, 1, 1, 1, 1,
1.228352, 1.802488, -0.79912, 1, 1, 1, 1, 1,
1.257004, -0.5332484, 1.812425, 1, 1, 1, 1, 1,
1.264629, -0.2871339, 0.9267817, 1, 1, 1, 1, 1,
1.268678, 1.421759, 1.126538, 1, 1, 1, 1, 1,
1.272049, -0.7557716, 1.571235, 1, 1, 1, 1, 1,
1.272993, -0.8405878, 2.26706, 1, 1, 1, 1, 1,
1.279582, 0.520875, 0.6924039, 1, 1, 1, 1, 1,
1.281143, 0.3048486, -1.148466, 0, 0, 1, 1, 1,
1.282463, 1.150897, 0.6049538, 1, 0, 0, 1, 1,
1.283733, 0.04218003, 1.147458, 1, 0, 0, 1, 1,
1.286314, -0.7677719, 2.717247, 1, 0, 0, 1, 1,
1.286436, -0.9147098, 0.6014281, 1, 0, 0, 1, 1,
1.292004, 0.4622883, 1.125399, 1, 0, 0, 1, 1,
1.304693, 0.6108125, 2.720156, 0, 0, 0, 1, 1,
1.307196, -1.534625, 2.709553, 0, 0, 0, 1, 1,
1.322509, 0.9350204, 1.37889, 0, 0, 0, 1, 1,
1.327109, -1.147699, 2.101023, 0, 0, 0, 1, 1,
1.334833, 0.2469244, 0.3940458, 0, 0, 0, 1, 1,
1.335052, -0.162039, 3.505535, 0, 0, 0, 1, 1,
1.337182, 0.3933883, 0.8096377, 0, 0, 0, 1, 1,
1.33898, 0.6671113, 1.638912, 1, 1, 1, 1, 1,
1.350586, 1.301428, 0.06708051, 1, 1, 1, 1, 1,
1.356255, -0.7865906, 2.612681, 1, 1, 1, 1, 1,
1.356792, -1.603366, 3.031674, 1, 1, 1, 1, 1,
1.358185, 0.8000625, 0.09272219, 1, 1, 1, 1, 1,
1.36246, -1.036804, 1.572488, 1, 1, 1, 1, 1,
1.390643, 1.001275, 0.1149734, 1, 1, 1, 1, 1,
1.407749, 0.9527196, 1.091716, 1, 1, 1, 1, 1,
1.420808, 0.6282421, -0.3043116, 1, 1, 1, 1, 1,
1.424181, -0.04283058, 1.087393, 1, 1, 1, 1, 1,
1.424343, -0.5702305, 0.892401, 1, 1, 1, 1, 1,
1.427628, 1.435692, -0.4834407, 1, 1, 1, 1, 1,
1.438329, -0.4600862, 1.833098, 1, 1, 1, 1, 1,
1.439402, 1.237773, -0.3177295, 1, 1, 1, 1, 1,
1.444759, -0.3403979, 2.585064, 1, 1, 1, 1, 1,
1.445513, 0.9244928, -0.2455836, 0, 0, 1, 1, 1,
1.459262, 1.579773, 1.156721, 1, 0, 0, 1, 1,
1.46421, -1.431815, 1.789384, 1, 0, 0, 1, 1,
1.481507, 0.2987109, 1.074788, 1, 0, 0, 1, 1,
1.483151, 2.212099, -0.4409216, 1, 0, 0, 1, 1,
1.487916, 2.332035, -0.1306107, 1, 0, 0, 1, 1,
1.497173, -1.104306, 1.50919, 0, 0, 0, 1, 1,
1.499816, -0.5765003, 1.490371, 0, 0, 0, 1, 1,
1.500381, -1.585398, 4.164529, 0, 0, 0, 1, 1,
1.506854, 1.071273, 0.3317012, 0, 0, 0, 1, 1,
1.507134, -0.1062008, 2.156193, 0, 0, 0, 1, 1,
1.507617, 0.7061327, 1.517993, 0, 0, 0, 1, 1,
1.522032, -1.077782, 1.161338, 0, 0, 0, 1, 1,
1.523003, -0.2621255, 3.044012, 1, 1, 1, 1, 1,
1.53621, -0.2342259, 2.32374, 1, 1, 1, 1, 1,
1.550002, 0.5656371, 2.388705, 1, 1, 1, 1, 1,
1.566375, 0.1493731, 1.192202, 1, 1, 1, 1, 1,
1.567383, 0.01479142, 2.9474, 1, 1, 1, 1, 1,
1.571816, -0.3084964, 1.910239, 1, 1, 1, 1, 1,
1.572988, 1.337115, 1.097542, 1, 1, 1, 1, 1,
1.580378, -0.7960457, 2.514563, 1, 1, 1, 1, 1,
1.580999, 0.7791877, 2.264911, 1, 1, 1, 1, 1,
1.589958, -0.1108373, 0.7519811, 1, 1, 1, 1, 1,
1.595192, -0.3685612, 1.774487, 1, 1, 1, 1, 1,
1.604035, 0.967308, 0.5918933, 1, 1, 1, 1, 1,
1.62978, 0.0819549, 1.124014, 1, 1, 1, 1, 1,
1.631018, -0.9079813, 2.90789, 1, 1, 1, 1, 1,
1.632128, 0.5962724, 1.450607, 1, 1, 1, 1, 1,
1.632577, -0.9618844, 1.121925, 0, 0, 1, 1, 1,
1.655792, -0.399964, 1.835883, 1, 0, 0, 1, 1,
1.663979, -0.8454444, 2.226045, 1, 0, 0, 1, 1,
1.682475, -0.3828816, 1.723171, 1, 0, 0, 1, 1,
1.687766, -0.2413646, 0.2715638, 1, 0, 0, 1, 1,
1.69498, 2.143798, 0.7444173, 1, 0, 0, 1, 1,
1.714215, -0.1193317, 1.837301, 0, 0, 0, 1, 1,
1.739281, 2.306241, -0.3522257, 0, 0, 0, 1, 1,
1.753667, 0.448793, 0.7432759, 0, 0, 0, 1, 1,
1.760289, -0.5947798, 1.624768, 0, 0, 0, 1, 1,
1.761229, 0.5679537, 1.896831, 0, 0, 0, 1, 1,
1.763495, 0.02157711, 0.8439288, 0, 0, 0, 1, 1,
1.781296, 0.3674408, 0.5630695, 0, 0, 0, 1, 1,
1.81935, -0.1801349, 2.12292, 1, 1, 1, 1, 1,
1.824528, 0.4834009, 1.284415, 1, 1, 1, 1, 1,
1.83327, -0.3897929, 1.788405, 1, 1, 1, 1, 1,
1.873115, 0.709147, 2.033857, 1, 1, 1, 1, 1,
1.875921, 0.2878757, 0.6086406, 1, 1, 1, 1, 1,
1.881144, 0.9186939, 0.534385, 1, 1, 1, 1, 1,
1.925584, 0.8517966, 0.6222221, 1, 1, 1, 1, 1,
1.973181, 0.6326331, 3.708515, 1, 1, 1, 1, 1,
2.005174, -0.7124009, 3.399344, 1, 1, 1, 1, 1,
2.029527, 0.6299172, 2.323419, 1, 1, 1, 1, 1,
2.031824, 0.5355847, 2.046463, 1, 1, 1, 1, 1,
2.093896, 0.7211202, -0.8041009, 1, 1, 1, 1, 1,
2.130232, -0.5134196, 3.342987, 1, 1, 1, 1, 1,
2.144695, 0.4929476, 3.141978, 1, 1, 1, 1, 1,
2.166436, -0.6026095, 2.096482, 1, 1, 1, 1, 1,
2.16731, 1.268724, 0.3293668, 0, 0, 1, 1, 1,
2.168691, -0.6211525, 1.79635, 1, 0, 0, 1, 1,
2.193967, -0.290634, 1.030818, 1, 0, 0, 1, 1,
2.200258, 0.2008382, 3.155608, 1, 0, 0, 1, 1,
2.291682, -0.9821202, 2.24715, 1, 0, 0, 1, 1,
2.296016, 2.59902, 0.1587806, 1, 0, 0, 1, 1,
2.298074, -0.1593625, 2.245263, 0, 0, 0, 1, 1,
2.363178, -0.3636835, 2.036793, 0, 0, 0, 1, 1,
2.367757, -0.7990842, 3.384745, 0, 0, 0, 1, 1,
2.372853, -0.6129909, 2.492246, 0, 0, 0, 1, 1,
2.453964, 1.842696, 0.9688269, 0, 0, 0, 1, 1,
2.459078, -1.187037, 1.706034, 0, 0, 0, 1, 1,
2.600273, -0.7629483, 2.271788, 0, 0, 0, 1, 1,
2.622924, -1.105808, 1.827345, 1, 1, 1, 1, 1,
2.651136, -2.280765, 3.980612, 1, 1, 1, 1, 1,
2.664849, 0.07851447, 1.327261, 1, 1, 1, 1, 1,
2.889473, 1.740149, 0.7897227, 1, 1, 1, 1, 1,
2.935385, -0.2132497, 1.611287, 1, 1, 1, 1, 1,
3.17352, 1.005787, -0.09675296, 1, 1, 1, 1, 1,
3.297019, -0.3417574, 1.465393, 1, 1, 1, 1, 1
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
var radius = 9.643818;
var distance = 33.8735;
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
mvMatrix.translate( -0.007544994, -0.2861937, 0.2161036 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8735);
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
