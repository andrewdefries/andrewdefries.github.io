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
-2.770107, 1.790679, -0.5021682, 1, 0, 0, 1,
-2.438427, 0.1619579, -2.636957, 1, 0.007843138, 0, 1,
-2.327347, 0.3437257, -2.426111, 1, 0.01176471, 0, 1,
-2.310326, -0.7924229, -1.903263, 1, 0.01960784, 0, 1,
-2.306134, 1.374251, -1.759761, 1, 0.02352941, 0, 1,
-2.293642, 0.4876133, -2.261366, 1, 0.03137255, 0, 1,
-2.239648, -0.8414803, -0.6737438, 1, 0.03529412, 0, 1,
-2.19653, 0.03650518, -2.829055, 1, 0.04313726, 0, 1,
-2.192124, -1.612522, -1.459994, 1, 0.04705882, 0, 1,
-2.157872, 0.7057771, -0.06603038, 1, 0.05490196, 0, 1,
-2.15665, -0.1294841, -3.130403, 1, 0.05882353, 0, 1,
-2.15622, 1.246023, -1.458199, 1, 0.06666667, 0, 1,
-2.137293, 0.540409, -1.519182, 1, 0.07058824, 0, 1,
-2.104386, 1.209561, -2.386553, 1, 0.07843138, 0, 1,
-2.064247, -2.526438, -2.288472, 1, 0.08235294, 0, 1,
-2.058356, 0.04665535, -1.617335, 1, 0.09019608, 0, 1,
-2.05334, -1.576074, -2.195246, 1, 0.09411765, 0, 1,
-2.032495, 0.6480447, -2.255486, 1, 0.1019608, 0, 1,
-2.032068, 0.4864391, -1.030796, 1, 0.1098039, 0, 1,
-1.95794, 0.1315797, -3.682981, 1, 0.1137255, 0, 1,
-1.938899, 0.5312892, -3.566677, 1, 0.1215686, 0, 1,
-1.918036, -0.9809159, -1.936361, 1, 0.1254902, 0, 1,
-1.915485, 0.1402729, -0.07323176, 1, 0.1333333, 0, 1,
-1.873232, -2.080257, -2.600177, 1, 0.1372549, 0, 1,
-1.868298, -0.9925107, -2.026148, 1, 0.145098, 0, 1,
-1.855908, -1.110751, -1.974945, 1, 0.1490196, 0, 1,
-1.853729, 0.5457486, -2.084183, 1, 0.1568628, 0, 1,
-1.837657, 1.123605, -1.693182, 1, 0.1607843, 0, 1,
-1.806174, -2.539135, -2.875943, 1, 0.1686275, 0, 1,
-1.800908, 1.458873, -0.3534061, 1, 0.172549, 0, 1,
-1.790007, 0.578373, -0.7775722, 1, 0.1803922, 0, 1,
-1.754355, -0.1304083, -0.5276844, 1, 0.1843137, 0, 1,
-1.730243, 1.844955, -1.480565, 1, 0.1921569, 0, 1,
-1.715238, 1.051812, 0.2538187, 1, 0.1960784, 0, 1,
-1.690048, -0.8715435, -1.848958, 1, 0.2039216, 0, 1,
-1.683175, -0.3028958, -2.314019, 1, 0.2117647, 0, 1,
-1.681562, 1.512087, -1.60882, 1, 0.2156863, 0, 1,
-1.673811, -0.8435483, -1.666718, 1, 0.2235294, 0, 1,
-1.671443, -0.3826661, 0.1249018, 1, 0.227451, 0, 1,
-1.653796, -0.6010621, -1.83929, 1, 0.2352941, 0, 1,
-1.645937, -0.1943518, -0.4720954, 1, 0.2392157, 0, 1,
-1.629306, -0.4230951, -3.753543, 1, 0.2470588, 0, 1,
-1.619048, -0.3482153, -2.351863, 1, 0.2509804, 0, 1,
-1.614215, -0.7701132, -2.935131, 1, 0.2588235, 0, 1,
-1.592867, -0.9098813, -3.44516, 1, 0.2627451, 0, 1,
-1.588915, -0.5830163, -3.160101, 1, 0.2705882, 0, 1,
-1.588116, -0.6143268, 0.1187727, 1, 0.2745098, 0, 1,
-1.57908, 0.2450079, -1.3707, 1, 0.282353, 0, 1,
-1.564569, 0.7969856, -1.135311, 1, 0.2862745, 0, 1,
-1.554975, -0.4467236, -2.862411, 1, 0.2941177, 0, 1,
-1.549442, 0.7955036, -0.1077461, 1, 0.3019608, 0, 1,
-1.548844, -0.3859183, -4.446671, 1, 0.3058824, 0, 1,
-1.540714, 1.366939, -2.141361, 1, 0.3137255, 0, 1,
-1.536609, -0.5204144, -1.749278, 1, 0.3176471, 0, 1,
-1.530505, -1.267738, -3.072944, 1, 0.3254902, 0, 1,
-1.514449, 1.674619, -0.3323441, 1, 0.3294118, 0, 1,
-1.510883, -0.5138749, -0.8593352, 1, 0.3372549, 0, 1,
-1.506077, -0.2848368, -3.285663, 1, 0.3411765, 0, 1,
-1.498885, 0.05686751, -2.109296, 1, 0.3490196, 0, 1,
-1.479464, 0.8068671, -1.639142, 1, 0.3529412, 0, 1,
-1.477758, -0.05801343, -0.8883282, 1, 0.3607843, 0, 1,
-1.473727, -0.3361679, -1.570754, 1, 0.3647059, 0, 1,
-1.47325, 0.2394917, -1.433174, 1, 0.372549, 0, 1,
-1.469962, 0.6693534, -1.656415, 1, 0.3764706, 0, 1,
-1.466724, -0.2407875, -1.798208, 1, 0.3843137, 0, 1,
-1.46668, 0.4696551, -1.518354, 1, 0.3882353, 0, 1,
-1.46412, 0.4253973, -1.557036, 1, 0.3960784, 0, 1,
-1.451045, -0.09071906, -1.962776, 1, 0.4039216, 0, 1,
-1.448587, 0.07172058, -0.8006507, 1, 0.4078431, 0, 1,
-1.443823, -1.360636, -2.786961, 1, 0.4156863, 0, 1,
-1.437262, 0.8996564, -1.110547, 1, 0.4196078, 0, 1,
-1.431627, -2.486625, -2.325605, 1, 0.427451, 0, 1,
-1.428728, -0.09367327, -1.155696, 1, 0.4313726, 0, 1,
-1.421742, -0.07365663, -2.438929, 1, 0.4392157, 0, 1,
-1.417325, -1.25422, -1.697483, 1, 0.4431373, 0, 1,
-1.408123, -1.511373, -0.1837191, 1, 0.4509804, 0, 1,
-1.373953, 1.2183, -0.4056486, 1, 0.454902, 0, 1,
-1.359923, -0.3783921, -1.465094, 1, 0.4627451, 0, 1,
-1.359296, 0.01227136, -2.41306, 1, 0.4666667, 0, 1,
-1.349744, -0.2666577, -1.636116, 1, 0.4745098, 0, 1,
-1.342348, -1.906797, -0.8108856, 1, 0.4784314, 0, 1,
-1.33846, -0.4978529, -1.763563, 1, 0.4862745, 0, 1,
-1.337137, -0.8942552, -3.428933, 1, 0.4901961, 0, 1,
-1.336126, -0.2703501, -2.927135, 1, 0.4980392, 0, 1,
-1.330004, -0.4806124, -1.610976, 1, 0.5058824, 0, 1,
-1.320795, 0.8571723, 0.01391981, 1, 0.509804, 0, 1,
-1.318098, 0.8355721, -1.69676, 1, 0.5176471, 0, 1,
-1.313804, -0.7406907, -2.44571, 1, 0.5215687, 0, 1,
-1.312549, 0.9294179, -0.8709526, 1, 0.5294118, 0, 1,
-1.296611, -0.9399606, -0.7126161, 1, 0.5333334, 0, 1,
-1.287793, 0.1470336, -2.720715, 1, 0.5411765, 0, 1,
-1.283709, -0.7874331, -1.838377, 1, 0.5450981, 0, 1,
-1.275453, -2.050514, -4.536349, 1, 0.5529412, 0, 1,
-1.274366, -0.7074356, -0.372567, 1, 0.5568628, 0, 1,
-1.261024, 0.5847696, -3.264944, 1, 0.5647059, 0, 1,
-1.26014, -0.5410553, -2.268346, 1, 0.5686275, 0, 1,
-1.253425, 0.3528608, -1.037637, 1, 0.5764706, 0, 1,
-1.245229, 0.02790096, -2.56074, 1, 0.5803922, 0, 1,
-1.242928, -0.2847891, -0.1905065, 1, 0.5882353, 0, 1,
-1.242697, 0.09756554, -1.024376, 1, 0.5921569, 0, 1,
-1.241378, 0.1330783, -2.839014, 1, 0.6, 0, 1,
-1.234245, 1.026577, -1.245811, 1, 0.6078432, 0, 1,
-1.231799, 0.6248438, -2.039829, 1, 0.6117647, 0, 1,
-1.220992, -0.4740546, -1.394322, 1, 0.6196079, 0, 1,
-1.217254, 1.423877, -1.171462, 1, 0.6235294, 0, 1,
-1.216689, -0.9371988, -1.05645, 1, 0.6313726, 0, 1,
-1.211796, 1.65557, -0.4040022, 1, 0.6352941, 0, 1,
-1.199684, 0.7710318, -0.5152991, 1, 0.6431373, 0, 1,
-1.194519, 0.9869832, -1.160888, 1, 0.6470588, 0, 1,
-1.192529, 0.3436979, -1.583163, 1, 0.654902, 0, 1,
-1.191026, -0.5983144, -1.907501, 1, 0.6588235, 0, 1,
-1.189318, -0.3776795, -2.153634, 1, 0.6666667, 0, 1,
-1.175998, -0.7506644, -0.8636144, 1, 0.6705883, 0, 1,
-1.172364, -1.457553, -4.010629, 1, 0.6784314, 0, 1,
-1.161626, 0.184898, -2.611091, 1, 0.682353, 0, 1,
-1.16009, 0.8090277, -1.75003, 1, 0.6901961, 0, 1,
-1.154375, 1.369408, -1.34317, 1, 0.6941177, 0, 1,
-1.139563, -1.128712, -1.942016, 1, 0.7019608, 0, 1,
-1.129597, 0.4964084, 0.7562817, 1, 0.7098039, 0, 1,
-1.129591, -0.5849358, -2.921201, 1, 0.7137255, 0, 1,
-1.121655, 0.8199421, -2.872453, 1, 0.7215686, 0, 1,
-1.110852, 0.2897004, -2.232201, 1, 0.7254902, 0, 1,
-1.107922, 1.148626, -1.294928, 1, 0.7333333, 0, 1,
-1.102065, 2.371621, -0.7227137, 1, 0.7372549, 0, 1,
-1.100819, -0.5936968, -3.327823, 1, 0.7450981, 0, 1,
-1.094356, -0.9693014, -1.865225, 1, 0.7490196, 0, 1,
-1.092251, -1.54847, -1.147706, 1, 0.7568628, 0, 1,
-1.09124, 1.128203, 0.7034892, 1, 0.7607843, 0, 1,
-1.085957, 0.8481106, -0.2607433, 1, 0.7686275, 0, 1,
-1.078231, -1.209786, -3.222219, 1, 0.772549, 0, 1,
-1.065907, 0.9406955, -1.289315, 1, 0.7803922, 0, 1,
-1.064229, -0.2748897, -1.895055, 1, 0.7843137, 0, 1,
-1.063671, -1.280884, -1.234615, 1, 0.7921569, 0, 1,
-1.063263, 0.01678747, -1.347092, 1, 0.7960784, 0, 1,
-1.058543, 0.7955114, -1.265576, 1, 0.8039216, 0, 1,
-1.056984, -0.8846015, -0.9538304, 1, 0.8117647, 0, 1,
-1.054841, 0.129311, -1.485574, 1, 0.8156863, 0, 1,
-1.050452, -0.3380415, -2.36286, 1, 0.8235294, 0, 1,
-1.036615, -0.8722752, 0.04984557, 1, 0.827451, 0, 1,
-1.023682, 0.4255058, -1.381631, 1, 0.8352941, 0, 1,
-1.014135, -2.228415, -3.238373, 1, 0.8392157, 0, 1,
-1.011338, -1.315933, -2.266356, 1, 0.8470588, 0, 1,
-1.006239, 0.8271654, -1.460079, 1, 0.8509804, 0, 1,
-0.9953639, 1.807445, -0.4365205, 1, 0.8588235, 0, 1,
-0.9908959, -0.9375558, -4.508019, 1, 0.8627451, 0, 1,
-0.9908438, 1.110567, -3.265558, 1, 0.8705882, 0, 1,
-0.9896772, 0.4283963, -1.921391, 1, 0.8745098, 0, 1,
-0.9889407, 0.6071525, -2.978868, 1, 0.8823529, 0, 1,
-0.988534, -0.3822153, -2.347354, 1, 0.8862745, 0, 1,
-0.9858767, -0.837756, -1.452267, 1, 0.8941177, 0, 1,
-0.9809721, -2.11606, -1.808117, 1, 0.8980392, 0, 1,
-0.9803569, 0.06100692, -1.618158, 1, 0.9058824, 0, 1,
-0.9750283, -0.6728192, -2.206742, 1, 0.9137255, 0, 1,
-0.9742849, 0.0085256, -2.729852, 1, 0.9176471, 0, 1,
-0.9706881, -0.5192892, -1.37352, 1, 0.9254902, 0, 1,
-0.9701372, -0.692696, -3.428961, 1, 0.9294118, 0, 1,
-0.9701201, 1.495623, -1.170256, 1, 0.9372549, 0, 1,
-0.9691595, 0.3027058, -1.139775, 1, 0.9411765, 0, 1,
-0.9689604, 0.1909098, -0.4255399, 1, 0.9490196, 0, 1,
-0.9625961, 0.2968394, -0.8216596, 1, 0.9529412, 0, 1,
-0.9579251, -0.01884731, -1.146159, 1, 0.9607843, 0, 1,
-0.9551046, -0.359531, -0.8266072, 1, 0.9647059, 0, 1,
-0.9510392, 1.807979, 0.3395599, 1, 0.972549, 0, 1,
-0.9488537, 0.01126629, -1.673542, 1, 0.9764706, 0, 1,
-0.938575, -0.133628, -1.34264, 1, 0.9843137, 0, 1,
-0.937167, -1.660421, -3.642949, 1, 0.9882353, 0, 1,
-0.9319508, 1.607663, -0.2666866, 1, 0.9960784, 0, 1,
-0.9276727, -0.4967771, -2.63384, 0.9960784, 1, 0, 1,
-0.9268926, 0.05005999, -2.08677, 0.9921569, 1, 0, 1,
-0.923814, -0.2979101, -0.4298603, 0.9843137, 1, 0, 1,
-0.9176461, -0.6665332, -3.324138, 0.9803922, 1, 0, 1,
-0.9160956, 0.01928501, -1.09374, 0.972549, 1, 0, 1,
-0.9148205, -0.6493043, -1.35294, 0.9686275, 1, 0, 1,
-0.9136181, -0.6862476, -1.88043, 0.9607843, 1, 0, 1,
-0.9057822, -0.9742661, -1.834139, 0.9568627, 1, 0, 1,
-0.9019485, 1.067752, -0.934693, 0.9490196, 1, 0, 1,
-0.8992753, 0.5401387, -1.922114, 0.945098, 1, 0, 1,
-0.8988388, -0.213101, -0.7350364, 0.9372549, 1, 0, 1,
-0.8967107, 0.06967804, -0.5434505, 0.9333333, 1, 0, 1,
-0.8936285, -1.975443, -1.019271, 0.9254902, 1, 0, 1,
-0.8926456, -0.5434204, -1.008331, 0.9215686, 1, 0, 1,
-0.8904206, -0.5984084, -1.920009, 0.9137255, 1, 0, 1,
-0.8891317, 0.3982548, -1.586158, 0.9098039, 1, 0, 1,
-0.8876601, 1.406558, -0.2264363, 0.9019608, 1, 0, 1,
-0.8805174, -1.0038, -2.21237, 0.8941177, 1, 0, 1,
-0.8756576, -1.642359, -2.206023, 0.8901961, 1, 0, 1,
-0.8649434, -1.913517, -2.284053, 0.8823529, 1, 0, 1,
-0.8600398, 0.01747425, -2.453946, 0.8784314, 1, 0, 1,
-0.8543534, -0.2669452, -1.032783, 0.8705882, 1, 0, 1,
-0.8522081, -1.147188, -3.416579, 0.8666667, 1, 0, 1,
-0.851993, -0.3712629, -0.1951217, 0.8588235, 1, 0, 1,
-0.8401098, -0.01459743, -2.104083, 0.854902, 1, 0, 1,
-0.8351202, -1.63497, -3.269237, 0.8470588, 1, 0, 1,
-0.8327327, -0.9231822, -3.731786, 0.8431373, 1, 0, 1,
-0.828676, -2.230493, -2.798078, 0.8352941, 1, 0, 1,
-0.8256241, 1.485072, -0.9071669, 0.8313726, 1, 0, 1,
-0.8172588, 0.9182852, -1.449992, 0.8235294, 1, 0, 1,
-0.8123579, 0.5573425, -0.7988997, 0.8196079, 1, 0, 1,
-0.8039644, 1.294666, -0.54134, 0.8117647, 1, 0, 1,
-0.8001773, -0.3547196, -2.369422, 0.8078431, 1, 0, 1,
-0.7969128, 1.314169, -0.09540353, 0.8, 1, 0, 1,
-0.7962372, -0.4486518, -3.270768, 0.7921569, 1, 0, 1,
-0.7889783, 0.3224956, 0.313626, 0.7882353, 1, 0, 1,
-0.7879067, -0.3676352, -1.900774, 0.7803922, 1, 0, 1,
-0.785103, 0.821434, -1.392662, 0.7764706, 1, 0, 1,
-0.7771584, -1.833219, -2.389962, 0.7686275, 1, 0, 1,
-0.7769575, 0.846717, -1.078443, 0.7647059, 1, 0, 1,
-0.7686074, 0.4362024, -1.655211, 0.7568628, 1, 0, 1,
-0.7677698, -1.068411, -2.100117, 0.7529412, 1, 0, 1,
-0.7665421, 0.00648314, -0.9748274, 0.7450981, 1, 0, 1,
-0.7566396, -0.07099215, -3.556326, 0.7411765, 1, 0, 1,
-0.7555291, -0.1630101, -1.210003, 0.7333333, 1, 0, 1,
-0.7549925, 0.5964151, 0.07173844, 0.7294118, 1, 0, 1,
-0.750679, 0.08880313, -1.731403, 0.7215686, 1, 0, 1,
-0.7451678, 0.3195483, -0.6892484, 0.7176471, 1, 0, 1,
-0.7394445, 0.04580936, -0.8149196, 0.7098039, 1, 0, 1,
-0.7366547, -1.135382, -2.828039, 0.7058824, 1, 0, 1,
-0.7348151, -0.4377807, -2.229396, 0.6980392, 1, 0, 1,
-0.7303089, -0.4026331, -0.3312148, 0.6901961, 1, 0, 1,
-0.7301432, 0.5669858, -0.9988744, 0.6862745, 1, 0, 1,
-0.7292112, -0.5553344, -2.692744, 0.6784314, 1, 0, 1,
-0.7262347, 0.6430829, -2.204336, 0.6745098, 1, 0, 1,
-0.7196448, 1.133462, -1.515109, 0.6666667, 1, 0, 1,
-0.7041754, 0.5535825, -1.911842, 0.6627451, 1, 0, 1,
-0.7003662, -0.6668428, -3.72283, 0.654902, 1, 0, 1,
-0.6999269, -0.6830568, -3.306193, 0.6509804, 1, 0, 1,
-0.6972102, 0.1932387, -0.9064421, 0.6431373, 1, 0, 1,
-0.6971556, -0.03522383, -1.918993, 0.6392157, 1, 0, 1,
-0.6968794, 0.5333132, -1.108909, 0.6313726, 1, 0, 1,
-0.6939058, 1.409433, -0.5113219, 0.627451, 1, 0, 1,
-0.6920076, 0.5750913, -0.2212458, 0.6196079, 1, 0, 1,
-0.6919754, 0.6906916, -0.963941, 0.6156863, 1, 0, 1,
-0.6913068, 0.4517285, -2.57877, 0.6078432, 1, 0, 1,
-0.6897291, -1.767252, -4.126651, 0.6039216, 1, 0, 1,
-0.6895428, 1.089128, 0.5886647, 0.5960785, 1, 0, 1,
-0.6871777, -0.4531869, -2.033532, 0.5882353, 1, 0, 1,
-0.6866974, 0.6437904, -1.810836, 0.5843138, 1, 0, 1,
-0.6850224, -0.8489647, -3.910082, 0.5764706, 1, 0, 1,
-0.6804641, -1.018433, -2.914733, 0.572549, 1, 0, 1,
-0.6794749, 2.571511, -1.16756, 0.5647059, 1, 0, 1,
-0.6744082, -0.8633196, -3.149514, 0.5607843, 1, 0, 1,
-0.6736391, 1.763728, -1.0156, 0.5529412, 1, 0, 1,
-0.6693566, 0.8042948, -0.2340582, 0.5490196, 1, 0, 1,
-0.6645079, -0.6696854, -3.185754, 0.5411765, 1, 0, 1,
-0.6618144, -0.294208, -2.342785, 0.5372549, 1, 0, 1,
-0.6605531, 0.8480776, -2.392144, 0.5294118, 1, 0, 1,
-0.6594499, -1.380559, -3.217674, 0.5254902, 1, 0, 1,
-0.657184, -0.9055157, -2.374687, 0.5176471, 1, 0, 1,
-0.6557399, -0.8380957, -1.537978, 0.5137255, 1, 0, 1,
-0.6509777, 0.247202, -0.005614713, 0.5058824, 1, 0, 1,
-0.6424264, -0.6416516, -2.074366, 0.5019608, 1, 0, 1,
-0.6355829, 0.2557085, -2.522439, 0.4941176, 1, 0, 1,
-0.6347872, -1.962424, -2.631633, 0.4862745, 1, 0, 1,
-0.6305456, -1.517956, -2.864494, 0.4823529, 1, 0, 1,
-0.6231192, 0.7257243, 0.4402647, 0.4745098, 1, 0, 1,
-0.6230385, 0.1241291, -0.8045996, 0.4705882, 1, 0, 1,
-0.6227655, 0.2697009, -2.415555, 0.4627451, 1, 0, 1,
-0.6176164, -2.45352, -2.777625, 0.4588235, 1, 0, 1,
-0.6159656, 0.4036585, -0.7266462, 0.4509804, 1, 0, 1,
-0.6157284, -0.3792754, -0.7755069, 0.4470588, 1, 0, 1,
-0.6111761, -1.709318, -2.887172, 0.4392157, 1, 0, 1,
-0.6056955, 1.017602, -1.660877, 0.4352941, 1, 0, 1,
-0.6004131, -1.341812, -2.428186, 0.427451, 1, 0, 1,
-0.6000108, -0.4665985, -3.557468, 0.4235294, 1, 0, 1,
-0.5994884, 0.2278248, -2.134719, 0.4156863, 1, 0, 1,
-0.5949854, 0.04234261, -0.6760968, 0.4117647, 1, 0, 1,
-0.5943317, -0.4814, -2.098052, 0.4039216, 1, 0, 1,
-0.593028, 0.9892958, -0.5003101, 0.3960784, 1, 0, 1,
-0.5888029, -0.9010804, -3.258726, 0.3921569, 1, 0, 1,
-0.5870245, -0.9688597, -0.4560329, 0.3843137, 1, 0, 1,
-0.5857607, -0.6164853, -1.591087, 0.3803922, 1, 0, 1,
-0.5799356, 0.8949728, -2.22106, 0.372549, 1, 0, 1,
-0.5778723, -1.250736, -2.219289, 0.3686275, 1, 0, 1,
-0.5776324, 0.9700286, -2.043635, 0.3607843, 1, 0, 1,
-0.5685003, 0.262549, -0.5115889, 0.3568628, 1, 0, 1,
-0.5672069, -0.424719, -2.034536, 0.3490196, 1, 0, 1,
-0.5655575, -0.3675257, -3.779321, 0.345098, 1, 0, 1,
-0.5596946, -0.1011157, -2.72599, 0.3372549, 1, 0, 1,
-0.5582843, -0.5510499, -1.539536, 0.3333333, 1, 0, 1,
-0.5579998, -0.7683942, -2.812256, 0.3254902, 1, 0, 1,
-0.5490378, 0.6485158, -1.389351, 0.3215686, 1, 0, 1,
-0.5405561, 0.5636874, 0.4685149, 0.3137255, 1, 0, 1,
-0.5391545, 0.3602508, -3.31736, 0.3098039, 1, 0, 1,
-0.5384686, -0.4934904, -0.7852913, 0.3019608, 1, 0, 1,
-0.5367002, -0.6213492, -2.908627, 0.2941177, 1, 0, 1,
-0.5328321, -0.1887239, -1.433905, 0.2901961, 1, 0, 1,
-0.5293752, 0.5838584, -1.460613, 0.282353, 1, 0, 1,
-0.5245401, -0.9269291, -1.841581, 0.2784314, 1, 0, 1,
-0.5232373, 0.1340817, -1.49068, 0.2705882, 1, 0, 1,
-0.5214954, -0.4571323, -4.045631, 0.2666667, 1, 0, 1,
-0.5214653, -0.3991567, -2.190014, 0.2588235, 1, 0, 1,
-0.518662, 2.12851, 1.110927, 0.254902, 1, 0, 1,
-0.5129002, -0.2712733, -2.665531, 0.2470588, 1, 0, 1,
-0.5030842, -1.195378, -2.598952, 0.2431373, 1, 0, 1,
-0.5006952, -0.02031256, -1.772427, 0.2352941, 1, 0, 1,
-0.4970748, 0.4550379, -0.06147816, 0.2313726, 1, 0, 1,
-0.4890059, 0.5889303, -0.1791489, 0.2235294, 1, 0, 1,
-0.4873273, -0.2295287, -2.486665, 0.2196078, 1, 0, 1,
-0.4854357, 2.426658, 2.679691, 0.2117647, 1, 0, 1,
-0.4818891, -1.532727, -2.368277, 0.2078431, 1, 0, 1,
-0.4786481, -0.6185225, -2.015972, 0.2, 1, 0, 1,
-0.4743846, 0.2325295, -1.12999, 0.1921569, 1, 0, 1,
-0.4731455, 0.6927761, -0.2196124, 0.1882353, 1, 0, 1,
-0.4718675, -0.4612914, -2.729264, 0.1803922, 1, 0, 1,
-0.4709544, 0.2505082, -0.7609871, 0.1764706, 1, 0, 1,
-0.4681906, -0.1611431, 0.27149, 0.1686275, 1, 0, 1,
-0.467999, -0.2277158, -3.612111, 0.1647059, 1, 0, 1,
-0.4652973, -0.9914994, -3.047435, 0.1568628, 1, 0, 1,
-0.4650265, 0.2623574, 0.6754353, 0.1529412, 1, 0, 1,
-0.4631897, 0.3346477, -2.877222, 0.145098, 1, 0, 1,
-0.4601215, -0.1920705, -2.343953, 0.1411765, 1, 0, 1,
-0.4575929, -0.1345346, 0.4761829, 0.1333333, 1, 0, 1,
-0.4528101, -1.28827, -1.208578, 0.1294118, 1, 0, 1,
-0.4516164, -0.2068239, -3.116458, 0.1215686, 1, 0, 1,
-0.4505424, -0.1926361, -1.017604, 0.1176471, 1, 0, 1,
-0.4492537, 0.9552245, -0.7085541, 0.1098039, 1, 0, 1,
-0.4462507, 1.425866, 1.316185, 0.1058824, 1, 0, 1,
-0.4459843, 0.2838579, -0.2696333, 0.09803922, 1, 0, 1,
-0.4377141, -0.02786914, -3.219389, 0.09019608, 1, 0, 1,
-0.4301308, 0.5966045, -1.954696, 0.08627451, 1, 0, 1,
-0.4293544, -0.1771779, -3.259629, 0.07843138, 1, 0, 1,
-0.4244234, -1.780495, -3.409957, 0.07450981, 1, 0, 1,
-0.4200512, -0.1335642, -1.922302, 0.06666667, 1, 0, 1,
-0.4191037, 1.317852, 0.01693564, 0.0627451, 1, 0, 1,
-0.4152977, -1.113324, -2.885284, 0.05490196, 1, 0, 1,
-0.4119061, -0.3437168, -3.011432, 0.05098039, 1, 0, 1,
-0.4099554, -0.9738981, -1.683813, 0.04313726, 1, 0, 1,
-0.4042438, 0.8270947, -1.239095, 0.03921569, 1, 0, 1,
-0.39777, 1.535166, 0.7378687, 0.03137255, 1, 0, 1,
-0.392902, 0.02402207, -1.535858, 0.02745098, 1, 0, 1,
-0.3903443, 0.2312464, 0.3783821, 0.01960784, 1, 0, 1,
-0.3881586, 0.841123, -1.337195, 0.01568628, 1, 0, 1,
-0.3843488, -0.1854559, -1.361959, 0.007843138, 1, 0, 1,
-0.3821352, 0.2378903, -0.2643072, 0.003921569, 1, 0, 1,
-0.3820759, 0.07179736, -1.313343, 0, 1, 0.003921569, 1,
-0.3798615, -1.014235, -3.663627, 0, 1, 0.01176471, 1,
-0.3768107, 1.288406, -0.002184716, 0, 1, 0.01568628, 1,
-0.3763964, -1.078595, -4.604717, 0, 1, 0.02352941, 1,
-0.3637321, 1.200536, -1.387756, 0, 1, 0.02745098, 1,
-0.3628394, 0.284405, -2.717903, 0, 1, 0.03529412, 1,
-0.3581179, -1.392475, -3.770907, 0, 1, 0.03921569, 1,
-0.3574252, -0.2763133, -2.718658, 0, 1, 0.04705882, 1,
-0.355011, 1.573411, 0.9762347, 0, 1, 0.05098039, 1,
-0.3489647, 0.7311266, -0.4747123, 0, 1, 0.05882353, 1,
-0.3479784, -1.749918, -2.611359, 0, 1, 0.0627451, 1,
-0.3471144, 0.8888747, -1.595564, 0, 1, 0.07058824, 1,
-0.3469428, -1.06989, -2.743825, 0, 1, 0.07450981, 1,
-0.3452588, 1.680873, -2.275822, 0, 1, 0.08235294, 1,
-0.3434862, -0.9426172, -2.151949, 0, 1, 0.08627451, 1,
-0.3391947, 1.895916, 0.8677058, 0, 1, 0.09411765, 1,
-0.3389927, 0.6218306, 0.4832016, 0, 1, 0.1019608, 1,
-0.3377376, 1.012116, -0.6297288, 0, 1, 0.1058824, 1,
-0.3359339, 0.2885864, 1.079707, 0, 1, 0.1137255, 1,
-0.3334959, 0.7221954, -0.5135412, 0, 1, 0.1176471, 1,
-0.3315484, 2.119771, 0.1615041, 0, 1, 0.1254902, 1,
-0.3296943, 1.656172, 0.2448506, 0, 1, 0.1294118, 1,
-0.3294619, -1.444299, -2.0022, 0, 1, 0.1372549, 1,
-0.3224539, 0.7741653, -1.864592, 0, 1, 0.1411765, 1,
-0.3221836, 0.7632468, 0.4172858, 0, 1, 0.1490196, 1,
-0.3211981, 0.2042649, -0.8904615, 0, 1, 0.1529412, 1,
-0.3198187, 0.4043601, -0.7707235, 0, 1, 0.1607843, 1,
-0.3076241, 2.443981, -0.1239398, 0, 1, 0.1647059, 1,
-0.3040996, 0.5150803, -1.154781, 0, 1, 0.172549, 1,
-0.3020362, -2.134182, -3.926178, 0, 1, 0.1764706, 1,
-0.2995791, -0.5521861, -3.055447, 0, 1, 0.1843137, 1,
-0.2977809, 0.7387456, -0.8416533, 0, 1, 0.1882353, 1,
-0.2968353, -0.7201795, -2.37034, 0, 1, 0.1960784, 1,
-0.2945542, 2.039281, -1.605006, 0, 1, 0.2039216, 1,
-0.2943581, -0.4066579, -3.477658, 0, 1, 0.2078431, 1,
-0.2914741, -0.07518796, -2.137053, 0, 1, 0.2156863, 1,
-0.28956, -1.531675, -3.194141, 0, 1, 0.2196078, 1,
-0.2872432, -1.835278, -1.885618, 0, 1, 0.227451, 1,
-0.2868975, -0.7627749, -3.921991, 0, 1, 0.2313726, 1,
-0.2842559, 0.1297237, -0.7458715, 0, 1, 0.2392157, 1,
-0.282272, 0.7165748, -1.093335, 0, 1, 0.2431373, 1,
-0.2812382, -1.029839, -1.802242, 0, 1, 0.2509804, 1,
-0.2781512, 0.3007322, -1.524277, 0, 1, 0.254902, 1,
-0.2760189, -0.7220203, -2.599015, 0, 1, 0.2627451, 1,
-0.2698563, 0.05648702, -3.131151, 0, 1, 0.2666667, 1,
-0.266661, -0.8763556, -2.606489, 0, 1, 0.2745098, 1,
-0.2634461, 2.226372, -0.1236152, 0, 1, 0.2784314, 1,
-0.2626363, -1.450484, -3.29169, 0, 1, 0.2862745, 1,
-0.2564227, 0.5174044, 0.1342633, 0, 1, 0.2901961, 1,
-0.2546551, 0.1444137, -0.3365954, 0, 1, 0.2980392, 1,
-0.2474528, -0.2177055, -2.131648, 0, 1, 0.3058824, 1,
-0.237774, 0.633253, -0.5565166, 0, 1, 0.3098039, 1,
-0.2377071, 0.6175266, 0.6723972, 0, 1, 0.3176471, 1,
-0.2350124, 0.09647407, -1.635885, 0, 1, 0.3215686, 1,
-0.2286456, -0.9594283, -2.754151, 0, 1, 0.3294118, 1,
-0.2277911, -1.136558, -3.795298, 0, 1, 0.3333333, 1,
-0.2206735, -0.2388111, -1.977779, 0, 1, 0.3411765, 1,
-0.2188276, 1.289058, -0.6620232, 0, 1, 0.345098, 1,
-0.2163249, 1.297659, 0.2811526, 0, 1, 0.3529412, 1,
-0.2120884, 0.6292265, -0.1182401, 0, 1, 0.3568628, 1,
-0.2079863, -0.2765834, -2.012963, 0, 1, 0.3647059, 1,
-0.2033128, 0.7213791, 0.1883171, 0, 1, 0.3686275, 1,
-0.2021027, 1.52652, 0.9876852, 0, 1, 0.3764706, 1,
-0.2017967, 0.01347601, -0.06816906, 0, 1, 0.3803922, 1,
-0.2003044, -0.2232519, -1.304327, 0, 1, 0.3882353, 1,
-0.1950508, -0.7668042, -2.776602, 0, 1, 0.3921569, 1,
-0.1892224, 0.3119231, -0.4595577, 0, 1, 0.4, 1,
-0.1883097, -1.367283, -3.20676, 0, 1, 0.4078431, 1,
-0.1871438, 0.1590648, 0.9119198, 0, 1, 0.4117647, 1,
-0.1817016, 0.660621, -0.2122345, 0, 1, 0.4196078, 1,
-0.1807386, -0.3249521, -3.554494, 0, 1, 0.4235294, 1,
-0.1707445, -1.683239, -3.329878, 0, 1, 0.4313726, 1,
-0.1677631, 0.4933994, 0.655889, 0, 1, 0.4352941, 1,
-0.1674343, -0.7429395, -2.893382, 0, 1, 0.4431373, 1,
-0.164447, -1.488487, -2.126558, 0, 1, 0.4470588, 1,
-0.1641158, 0.9084347, -0.01351844, 0, 1, 0.454902, 1,
-0.1589129, 0.365262, -0.6468476, 0, 1, 0.4588235, 1,
-0.1584686, 0.2533168, -1.885915, 0, 1, 0.4666667, 1,
-0.1578611, -0.4615371, -4.376087, 0, 1, 0.4705882, 1,
-0.1516892, -1.438535, -4.876092, 0, 1, 0.4784314, 1,
-0.1497541, -1.071154, -2.118872, 0, 1, 0.4823529, 1,
-0.1423109, 0.06268197, 0.5087954, 0, 1, 0.4901961, 1,
-0.1407166, -2.039306, -3.477059, 0, 1, 0.4941176, 1,
-0.1383463, 1.155407, -0.1873628, 0, 1, 0.5019608, 1,
-0.1360366, -2.461266, -3.887475, 0, 1, 0.509804, 1,
-0.1344515, -2.616048, -3.865956, 0, 1, 0.5137255, 1,
-0.130743, 0.7592558, 0.8147559, 0, 1, 0.5215687, 1,
-0.1306127, -0.07669455, -1.632802, 0, 1, 0.5254902, 1,
-0.1222356, 0.67985, 0.03241286, 0, 1, 0.5333334, 1,
-0.1220542, -1.410797, -3.294854, 0, 1, 0.5372549, 1,
-0.1218228, -1.523323, -3.688948, 0, 1, 0.5450981, 1,
-0.1212632, 1.459471, 1.394704, 0, 1, 0.5490196, 1,
-0.1206295, -1.570144, -3.527083, 0, 1, 0.5568628, 1,
-0.1197512, 1.159637, -0.284519, 0, 1, 0.5607843, 1,
-0.1182529, -0.542002, -1.292413, 0, 1, 0.5686275, 1,
-0.1176407, 0.1314096, 0.0235979, 0, 1, 0.572549, 1,
-0.1169363, -0.9509195, -2.838215, 0, 1, 0.5803922, 1,
-0.1133989, 0.5153503, -0.300191, 0, 1, 0.5843138, 1,
-0.1130121, -1.465865, -4.792543, 0, 1, 0.5921569, 1,
-0.1127976, -1.735281, -3.706268, 0, 1, 0.5960785, 1,
-0.1123161, 0.4066229, -0.4996263, 0, 1, 0.6039216, 1,
-0.1110895, 0.6742936, -1.403715, 0, 1, 0.6117647, 1,
-0.1110476, 0.2614866, -1.175937, 0, 1, 0.6156863, 1,
-0.1001044, 0.09845755, -1.055147, 0, 1, 0.6235294, 1,
-0.09977742, -1.066572, -2.636107, 0, 1, 0.627451, 1,
-0.097875, -0.650763, -2.69633, 0, 1, 0.6352941, 1,
-0.09561397, 0.1025922, -0.5816661, 0, 1, 0.6392157, 1,
-0.09373744, 0.4965362, 0.2700928, 0, 1, 0.6470588, 1,
-0.08749582, 1.474757, -0.4460137, 0, 1, 0.6509804, 1,
-0.08165575, -0.7458768, -3.512854, 0, 1, 0.6588235, 1,
-0.08104976, 0.1826354, -1.193138, 0, 1, 0.6627451, 1,
-0.07754686, 0.8017505, -0.8798397, 0, 1, 0.6705883, 1,
-0.07642027, 0.8305476, -1.022174, 0, 1, 0.6745098, 1,
-0.07541874, 0.8562839, -1.499519, 0, 1, 0.682353, 1,
-0.0718644, 0.5752386, -0.2879722, 0, 1, 0.6862745, 1,
-0.07084879, 0.2165966, -1.61034, 0, 1, 0.6941177, 1,
-0.06789616, -0.8695456, -2.443042, 0, 1, 0.7019608, 1,
-0.06729387, 0.4277787, -0.4991559, 0, 1, 0.7058824, 1,
-0.06370811, 0.9178109, 0.3977341, 0, 1, 0.7137255, 1,
-0.05667263, 0.3727084, -1.431312, 0, 1, 0.7176471, 1,
-0.0555594, 0.9568965, -0.2882731, 0, 1, 0.7254902, 1,
-0.05482846, 1.836983, -0.8086122, 0, 1, 0.7294118, 1,
-0.05347639, -0.7222391, -2.633409, 0, 1, 0.7372549, 1,
-0.05130391, 0.1127623, -0.7921599, 0, 1, 0.7411765, 1,
-0.04703514, -0.3642079, -1.44326, 0, 1, 0.7490196, 1,
-0.03998815, 1.035708, 0.5160205, 0, 1, 0.7529412, 1,
-0.03400978, 0.7660059, -0.2473444, 0, 1, 0.7607843, 1,
-0.02905713, -0.5115527, -4.102761, 0, 1, 0.7647059, 1,
-0.02656691, 1.115561, 0.6777369, 0, 1, 0.772549, 1,
-0.02490658, 0.2909172, 0.7231371, 0, 1, 0.7764706, 1,
-0.02467071, 0.7196384, 0.4559106, 0, 1, 0.7843137, 1,
-0.02264923, 0.7301986, 0.653323, 0, 1, 0.7882353, 1,
-0.01946625, -0.6469988, -3.573227, 0, 1, 0.7960784, 1,
-0.01740357, -0.4067503, -3.049637, 0, 1, 0.8039216, 1,
-0.01493176, -1.59987, -3.821003, 0, 1, 0.8078431, 1,
-0.0002167664, -1.928906, -3.798445, 0, 1, 0.8156863, 1,
0.0002949052, 0.305376, 1.333606, 0, 1, 0.8196079, 1,
0.001869529, 0.4408424, -0.7018997, 0, 1, 0.827451, 1,
0.003294684, -0.7331366, 2.605074, 0, 1, 0.8313726, 1,
0.008571066, 1.222666, 0.9790261, 0, 1, 0.8392157, 1,
0.01078806, -0.7286075, 3.838938, 0, 1, 0.8431373, 1,
0.01572482, 0.08587371, -0.1251737, 0, 1, 0.8509804, 1,
0.01900622, 0.6760758, 2.394257, 0, 1, 0.854902, 1,
0.02362322, 0.1302397, -2.201266, 0, 1, 0.8627451, 1,
0.02584713, -0.2508299, 3.481006, 0, 1, 0.8666667, 1,
0.02674047, -0.8848063, 3.667889, 0, 1, 0.8745098, 1,
0.02756641, -0.7170582, 2.27619, 0, 1, 0.8784314, 1,
0.02823847, -0.8019837, 3.843986, 0, 1, 0.8862745, 1,
0.02869999, -0.8990706, 3.426451, 0, 1, 0.8901961, 1,
0.02881983, -0.964811, 1.238275, 0, 1, 0.8980392, 1,
0.03177786, 1.060241, 0.5486723, 0, 1, 0.9058824, 1,
0.03220999, 0.843865, -1.22942, 0, 1, 0.9098039, 1,
0.03411811, 2.787337, -0.16006, 0, 1, 0.9176471, 1,
0.03492708, -0.8155189, 3.393242, 0, 1, 0.9215686, 1,
0.0357895, -1.195634, 3.869576, 0, 1, 0.9294118, 1,
0.03940778, -0.3530628, 3.568991, 0, 1, 0.9333333, 1,
0.04044867, -0.2788669, 3.360931, 0, 1, 0.9411765, 1,
0.04346072, 0.7757921, -0.7757797, 0, 1, 0.945098, 1,
0.04351617, 0.6977122, -1.781579, 0, 1, 0.9529412, 1,
0.0456447, 1.452308, -0.5431851, 0, 1, 0.9568627, 1,
0.0483232, -0.9036802, 3.529629, 0, 1, 0.9647059, 1,
0.05084346, 0.3080156, 1.211379, 0, 1, 0.9686275, 1,
0.05150359, 0.527465, -0.09797514, 0, 1, 0.9764706, 1,
0.05319412, -0.9055933, 3.69186, 0, 1, 0.9803922, 1,
0.05983465, 0.04862091, 1.730168, 0, 1, 0.9882353, 1,
0.06511492, 0.2759396, 0.3826354, 0, 1, 0.9921569, 1,
0.06615841, -1.074101, 3.529956, 0, 1, 1, 1,
0.06778972, -1.39502, 3.770645, 0, 0.9921569, 1, 1,
0.06811996, -0.9156902, 3.054895, 0, 0.9882353, 1, 1,
0.07128658, -0.6565703, 2.579237, 0, 0.9803922, 1, 1,
0.07455058, 0.00669745, 1.693511, 0, 0.9764706, 1, 1,
0.07642891, -2.045414, 4.300835, 0, 0.9686275, 1, 1,
0.08052315, -1.13567, 0.9275663, 0, 0.9647059, 1, 1,
0.08335711, 1.752259, 0.3726993, 0, 0.9568627, 1, 1,
0.0862834, -0.523802, 2.199365, 0, 0.9529412, 1, 1,
0.08654778, -1.796897, 4.108241, 0, 0.945098, 1, 1,
0.08680035, 0.8186101, 0.6207409, 0, 0.9411765, 1, 1,
0.08876186, 1.433514, -0.05935679, 0, 0.9333333, 1, 1,
0.09073871, -0.3541814, 3.070131, 0, 0.9294118, 1, 1,
0.09360689, -0.05097599, 3.316312, 0, 0.9215686, 1, 1,
0.09405227, -0.4792165, 1.745869, 0, 0.9176471, 1, 1,
0.09629763, 0.3516982, -0.7893333, 0, 0.9098039, 1, 1,
0.09697249, -1.234454, 3.686118, 0, 0.9058824, 1, 1,
0.09740397, -1.481706, 3.424744, 0, 0.8980392, 1, 1,
0.1012355, -0.1135464, 2.233526, 0, 0.8901961, 1, 1,
0.1013942, -0.2307894, 3.809803, 0, 0.8862745, 1, 1,
0.102869, 2.485013, -0.9955083, 0, 0.8784314, 1, 1,
0.1093719, 0.8095558, 0.1192277, 0, 0.8745098, 1, 1,
0.1103923, -0.3634564, 3.18581, 0, 0.8666667, 1, 1,
0.1127323, 0.3142923, -1.467427, 0, 0.8627451, 1, 1,
0.1147576, 0.3258198, 1.814353, 0, 0.854902, 1, 1,
0.1192241, -0.1223096, 2.204258, 0, 0.8509804, 1, 1,
0.1217368, 0.2669227, 0.4761366, 0, 0.8431373, 1, 1,
0.1272572, 0.2250978, 0.7346889, 0, 0.8392157, 1, 1,
0.1300012, 0.5893892, -0.4871345, 0, 0.8313726, 1, 1,
0.1356632, -1.361605, 3.96021, 0, 0.827451, 1, 1,
0.136379, -0.7167274, 4.112641, 0, 0.8196079, 1, 1,
0.1456011, -0.5504763, 3.064545, 0, 0.8156863, 1, 1,
0.1467738, -1.972382, 3.124248, 0, 0.8078431, 1, 1,
0.1478469, 2.665219, -0.2381724, 0, 0.8039216, 1, 1,
0.1540479, -1.022, 1.892586, 0, 0.7960784, 1, 1,
0.1571819, 0.5575705, 0.514625, 0, 0.7882353, 1, 1,
0.1626178, -1.269394, 1.890856, 0, 0.7843137, 1, 1,
0.1635261, -0.06888791, 2.305898, 0, 0.7764706, 1, 1,
0.1732719, 0.289136, -0.3251981, 0, 0.772549, 1, 1,
0.1782398, -0.51623, 3.160413, 0, 0.7647059, 1, 1,
0.1806598, 0.6301749, 1.525002, 0, 0.7607843, 1, 1,
0.1813946, 0.7069273, -0.2549495, 0, 0.7529412, 1, 1,
0.1820406, 0.6617754, 0.1026562, 0, 0.7490196, 1, 1,
0.1842498, -0.1005801, 2.664466, 0, 0.7411765, 1, 1,
0.1843235, -0.1263112, 1.702152, 0, 0.7372549, 1, 1,
0.1846638, -1.227249, 2.622181, 0, 0.7294118, 1, 1,
0.1875219, 1.776401, 1.866499, 0, 0.7254902, 1, 1,
0.1884863, -0.4505392, 3.137927, 0, 0.7176471, 1, 1,
0.1927279, 0.03140759, 1.918556, 0, 0.7137255, 1, 1,
0.1928054, -0.4380411, 1.44578, 0, 0.7058824, 1, 1,
0.198356, 2.334226, 0.480349, 0, 0.6980392, 1, 1,
0.19843, -0.7622283, 3.799586, 0, 0.6941177, 1, 1,
0.1999772, 0.7951567, 0.2576714, 0, 0.6862745, 1, 1,
0.2031417, 0.1712738, 0.750802, 0, 0.682353, 1, 1,
0.2031842, -1.090407, 2.674192, 0, 0.6745098, 1, 1,
0.2040602, 0.07395732, 2.148296, 0, 0.6705883, 1, 1,
0.2055202, 0.9572965, 0.7470542, 0, 0.6627451, 1, 1,
0.2092564, 2.477092, 0.04392847, 0, 0.6588235, 1, 1,
0.2140123, -1.072157, 2.525451, 0, 0.6509804, 1, 1,
0.2170508, 0.4806753, 0.9109042, 0, 0.6470588, 1, 1,
0.2188257, -0.2218599, 1.929401, 0, 0.6392157, 1, 1,
0.2234002, -1.234484, 3.639127, 0, 0.6352941, 1, 1,
0.2297301, -2.087747, 3.917885, 0, 0.627451, 1, 1,
0.2303809, 0.2110307, 0.1696196, 0, 0.6235294, 1, 1,
0.2318838, 1.086405, -1.010408, 0, 0.6156863, 1, 1,
0.2320793, -0.2607838, 1.188564, 0, 0.6117647, 1, 1,
0.2342108, 0.0689196, 1.264831, 0, 0.6039216, 1, 1,
0.2350446, 1.702013, 0.945617, 0, 0.5960785, 1, 1,
0.2350879, -0.9157203, 3.162178, 0, 0.5921569, 1, 1,
0.2359449, 0.7214316, 0.08631686, 0, 0.5843138, 1, 1,
0.2417259, -0.364283, 2.413344, 0, 0.5803922, 1, 1,
0.2427892, 0.6417041, 1.989061, 0, 0.572549, 1, 1,
0.2473773, -2.860796, 3.523375, 0, 0.5686275, 1, 1,
0.2481375, -0.9758856, 2.34296, 0, 0.5607843, 1, 1,
0.250053, 1.284457, -0.3539443, 0, 0.5568628, 1, 1,
0.2530687, 2.820863, 0.405843, 0, 0.5490196, 1, 1,
0.2571896, 2.001366, -1.385636, 0, 0.5450981, 1, 1,
0.2577772, -1.264611, 0.106557, 0, 0.5372549, 1, 1,
0.2580142, 0.6934392, 1.466998, 0, 0.5333334, 1, 1,
0.2586001, -1.471527, 3.804461, 0, 0.5254902, 1, 1,
0.2603335, 1.172129, -0.800199, 0, 0.5215687, 1, 1,
0.2633367, 0.6315309, 0.2890081, 0, 0.5137255, 1, 1,
0.2653171, 0.4061995, -1.054547, 0, 0.509804, 1, 1,
0.2656069, 1.065102, -0.9050522, 0, 0.5019608, 1, 1,
0.266713, -1.908335, 2.034078, 0, 0.4941176, 1, 1,
0.2677946, -2.138317, 3.292021, 0, 0.4901961, 1, 1,
0.2678196, 0.5768638, 0.8652412, 0, 0.4823529, 1, 1,
0.2683962, 0.8185374, -1.559859, 0, 0.4784314, 1, 1,
0.2685057, 0.08038543, 2.023665, 0, 0.4705882, 1, 1,
0.270404, 1.23424, -0.1903026, 0, 0.4666667, 1, 1,
0.271034, -0.9341801, 2.983616, 0, 0.4588235, 1, 1,
0.2720012, 0.2084729, 0.8448592, 0, 0.454902, 1, 1,
0.2834096, -0.3215542, 4.46967, 0, 0.4470588, 1, 1,
0.2847194, 0.7444362, 1.47025, 0, 0.4431373, 1, 1,
0.284889, 0.239419, 1.004284, 0, 0.4352941, 1, 1,
0.2851102, 2.345184, 0.0248864, 0, 0.4313726, 1, 1,
0.2885046, -1.666687, 2.562778, 0, 0.4235294, 1, 1,
0.290988, 0.3950161, 2.102687, 0, 0.4196078, 1, 1,
0.2920538, 0.02640757, 1.758569, 0, 0.4117647, 1, 1,
0.2925777, -0.4523711, 0.9648866, 0, 0.4078431, 1, 1,
0.2952335, 0.1977062, -0.03454468, 0, 0.4, 1, 1,
0.2973014, 1.024488, -0.8884749, 0, 0.3921569, 1, 1,
0.2991987, -0.406423, 1.969119, 0, 0.3882353, 1, 1,
0.303851, -0.1023651, 3.34042, 0, 0.3803922, 1, 1,
0.3051256, -0.4759986, 2.107917, 0, 0.3764706, 1, 1,
0.309339, 0.3838644, 1.593128, 0, 0.3686275, 1, 1,
0.3101129, 0.3677074, -0.7486264, 0, 0.3647059, 1, 1,
0.3105556, 1.711077, -0.5228969, 0, 0.3568628, 1, 1,
0.313304, -0.4411414, 3.320047, 0, 0.3529412, 1, 1,
0.3147999, -1.026219, 4.01771, 0, 0.345098, 1, 1,
0.3157275, 0.5301439, 1.05824, 0, 0.3411765, 1, 1,
0.3253667, -1.023999, 3.692365, 0, 0.3333333, 1, 1,
0.3277136, 0.1205415, 2.110746, 0, 0.3294118, 1, 1,
0.3290249, -0.3420868, 2.152192, 0, 0.3215686, 1, 1,
0.3363268, -0.121973, 1.227765, 0, 0.3176471, 1, 1,
0.3368384, 0.5340613, 0.6316381, 0, 0.3098039, 1, 1,
0.3390857, -0.666456, 1.540245, 0, 0.3058824, 1, 1,
0.3437873, -2.271295, 3.824502, 0, 0.2980392, 1, 1,
0.3440903, 0.1414877, 0.5778219, 0, 0.2901961, 1, 1,
0.3450443, -0.0739088, 1.830274, 0, 0.2862745, 1, 1,
0.3469023, 0.6846032, 1.55897, 0, 0.2784314, 1, 1,
0.3469443, -0.6811169, 2.520497, 0, 0.2745098, 1, 1,
0.349475, 0.5706049, 1.069199, 0, 0.2666667, 1, 1,
0.349662, 1.194811, -0.08552474, 0, 0.2627451, 1, 1,
0.3511656, -0.2186427, 2.300135, 0, 0.254902, 1, 1,
0.3552547, -1.107823, 2.939264, 0, 0.2509804, 1, 1,
0.3585278, -1.333418, 2.27691, 0, 0.2431373, 1, 1,
0.3606254, 1.954028, -1.01406, 0, 0.2392157, 1, 1,
0.3624485, -1.585744, 2.414236, 0, 0.2313726, 1, 1,
0.3641727, -0.8567417, 3.939792, 0, 0.227451, 1, 1,
0.3647207, 0.3772242, 1.274751, 0, 0.2196078, 1, 1,
0.3668969, 0.03383661, 1.512256, 0, 0.2156863, 1, 1,
0.36792, 0.2670991, -0.05529615, 0, 0.2078431, 1, 1,
0.3689699, 2.045287, 1.216301, 0, 0.2039216, 1, 1,
0.3695312, 1.490277, 0.08481438, 0, 0.1960784, 1, 1,
0.3725902, 1.433297, 0.1641004, 0, 0.1882353, 1, 1,
0.3759367, -0.19871, 2.885759, 0, 0.1843137, 1, 1,
0.3780362, -0.7336256, 2.660552, 0, 0.1764706, 1, 1,
0.3800897, 0.4178247, 1.218249, 0, 0.172549, 1, 1,
0.3810247, -0.4211248, 2.000301, 0, 0.1647059, 1, 1,
0.3960353, -0.3709476, 1.57627, 0, 0.1607843, 1, 1,
0.4023078, -0.077319, 2.294066, 0, 0.1529412, 1, 1,
0.4081437, 0.4046801, 0.9080216, 0, 0.1490196, 1, 1,
0.4081719, -0.180627, 0.7845101, 0, 0.1411765, 1, 1,
0.4112679, 1.326841, 0.08856482, 0, 0.1372549, 1, 1,
0.4227436, -0.01117327, 2.365229, 0, 0.1294118, 1, 1,
0.4235328, 0.1722069, 0.5793616, 0, 0.1254902, 1, 1,
0.4296533, -1.697417, 3.239149, 0, 0.1176471, 1, 1,
0.433848, 0.2912016, 2.560571, 0, 0.1137255, 1, 1,
0.4344659, -1.604847, 4.284243, 0, 0.1058824, 1, 1,
0.4350623, -1.326493, 3.932706, 0, 0.09803922, 1, 1,
0.441153, -2.155439, 1.928329, 0, 0.09411765, 1, 1,
0.4438525, -0.4775293, 3.501235, 0, 0.08627451, 1, 1,
0.4474227, -0.07032627, 2.640931, 0, 0.08235294, 1, 1,
0.4486926, 0.9764415, 0.06949738, 0, 0.07450981, 1, 1,
0.449091, 0.170502, 0.7170784, 0, 0.07058824, 1, 1,
0.4546779, 0.7903924, 0.2440624, 0, 0.0627451, 1, 1,
0.4555509, 0.5746686, 0.9754856, 0, 0.05882353, 1, 1,
0.4604482, 2.383569, 0.8069442, 0, 0.05098039, 1, 1,
0.4609763, 0.9809529, 0.5367673, 0, 0.04705882, 1, 1,
0.4622503, 0.808916, -0.5068939, 0, 0.03921569, 1, 1,
0.4658596, -0.4899636, 1.301001, 0, 0.03529412, 1, 1,
0.4750891, 0.9550408, -1.356941, 0, 0.02745098, 1, 1,
0.4753136, 1.614933, -0.04852556, 0, 0.02352941, 1, 1,
0.4836789, -0.7787029, 3.612688, 0, 0.01568628, 1, 1,
0.4951486, 0.8131714, 1.072664, 0, 0.01176471, 1, 1,
0.4967291, -0.7327668, 2.851308, 0, 0.003921569, 1, 1,
0.4999676, -0.01691824, 2.355075, 0.003921569, 0, 1, 1,
0.5036167, -0.7017348, 3.370093, 0.007843138, 0, 1, 1,
0.5052491, 1.99962, 1.476539, 0.01568628, 0, 1, 1,
0.5055453, 0.1356915, -0.1859844, 0.01960784, 0, 1, 1,
0.5185459, 0.7235915, -0.4349355, 0.02745098, 0, 1, 1,
0.5197171, -1.915033, 2.732178, 0.03137255, 0, 1, 1,
0.5200279, 0.3418724, 0.1844171, 0.03921569, 0, 1, 1,
0.5221836, -0.7104753, 3.490796, 0.04313726, 0, 1, 1,
0.5286373, 0.6159137, 0.8108404, 0.05098039, 0, 1, 1,
0.5296066, -1.154921, 2.745566, 0.05490196, 0, 1, 1,
0.5315809, -0.7548417, 3.79879, 0.0627451, 0, 1, 1,
0.5382026, -1.513558, 2.711924, 0.06666667, 0, 1, 1,
0.5407187, 0.1513318, 0.8793074, 0.07450981, 0, 1, 1,
0.5429634, 1.147027, -1.810001, 0.07843138, 0, 1, 1,
0.5440074, 0.1883722, 0.9369295, 0.08627451, 0, 1, 1,
0.5450668, -1.433827, 2.933729, 0.09019608, 0, 1, 1,
0.5504169, 0.1086256, 2.183829, 0.09803922, 0, 1, 1,
0.5551715, -1.746848, 2.483178, 0.1058824, 0, 1, 1,
0.5591303, -0.4736409, 1.77627, 0.1098039, 0, 1, 1,
0.5605826, -0.5269782, 2.328511, 0.1176471, 0, 1, 1,
0.5624201, -0.7557149, 3.109818, 0.1215686, 0, 1, 1,
0.5635951, -1.989831, 1.659249, 0.1294118, 0, 1, 1,
0.5684062, -0.4959868, 0.7999694, 0.1333333, 0, 1, 1,
0.5725366, -0.4989877, 2.544128, 0.1411765, 0, 1, 1,
0.5766026, -1.649872, 2.779407, 0.145098, 0, 1, 1,
0.5795481, -0.3860358, 3.363231, 0.1529412, 0, 1, 1,
0.580778, 0.3815039, 1.701592, 0.1568628, 0, 1, 1,
0.5829731, -0.01676779, 1.876645, 0.1647059, 0, 1, 1,
0.5834606, -0.5551614, 2.577585, 0.1686275, 0, 1, 1,
0.5845907, 1.325204, -2.480921, 0.1764706, 0, 1, 1,
0.5846272, -0.6606137, 1.823223, 0.1803922, 0, 1, 1,
0.5906269, -0.1687766, 1.186128, 0.1882353, 0, 1, 1,
0.5923693, 0.2016861, 0.3519102, 0.1921569, 0, 1, 1,
0.5930871, -1.34677, 3.356077, 0.2, 0, 1, 1,
0.5940266, -0.3388087, 1.396588, 0.2078431, 0, 1, 1,
0.5963358, 0.5144386, 2.284863, 0.2117647, 0, 1, 1,
0.5974438, 0.9187127, 0.1956111, 0.2196078, 0, 1, 1,
0.6042695, -0.5587676, 1.58053, 0.2235294, 0, 1, 1,
0.611368, -1.788821, 3.404057, 0.2313726, 0, 1, 1,
0.6121126, -0.8192659, 3.70428, 0.2352941, 0, 1, 1,
0.6129865, 0.02624504, 2.801985, 0.2431373, 0, 1, 1,
0.6146804, -0.4005083, 1.970536, 0.2470588, 0, 1, 1,
0.6200934, 1.70533, -0.38348, 0.254902, 0, 1, 1,
0.6229194, 0.7096483, 0.06732732, 0.2588235, 0, 1, 1,
0.6282256, 1.325068, 1.285711, 0.2666667, 0, 1, 1,
0.6313503, 0.003316372, 0.0736457, 0.2705882, 0, 1, 1,
0.633988, -1.24402, 2.382676, 0.2784314, 0, 1, 1,
0.6342191, -1.858693, 1.876218, 0.282353, 0, 1, 1,
0.6352357, -0.5822586, 2.92573, 0.2901961, 0, 1, 1,
0.6368226, 1.510421, 0.4620696, 0.2941177, 0, 1, 1,
0.6388164, -1.227057, 2.139088, 0.3019608, 0, 1, 1,
0.639061, -0.6163285, 1.983689, 0.3098039, 0, 1, 1,
0.6399682, 0.1159475, 2.252768, 0.3137255, 0, 1, 1,
0.6404563, 0.5743768, 1.233341, 0.3215686, 0, 1, 1,
0.6449586, 0.3037133, 0.8114641, 0.3254902, 0, 1, 1,
0.6454463, -0.6464173, 2.833008, 0.3333333, 0, 1, 1,
0.6482109, 0.1193479, 0.3296983, 0.3372549, 0, 1, 1,
0.6560819, -0.2687451, 2.851781, 0.345098, 0, 1, 1,
0.6614577, -0.4703569, 1.165086, 0.3490196, 0, 1, 1,
0.6645858, -0.7110205, 0.3989193, 0.3568628, 0, 1, 1,
0.6689193, -1.768946, 2.45958, 0.3607843, 0, 1, 1,
0.6765764, -0.6889349, 2.660105, 0.3686275, 0, 1, 1,
0.678073, -0.5723588, 2.579946, 0.372549, 0, 1, 1,
0.6787979, 0.1500613, -0.001527132, 0.3803922, 0, 1, 1,
0.6798879, 1.616453, 1.47607, 0.3843137, 0, 1, 1,
0.6892881, -1.099494, 4.768874, 0.3921569, 0, 1, 1,
0.6945524, 1.162959, 1.182739, 0.3960784, 0, 1, 1,
0.6970201, 0.7392479, 1.452024, 0.4039216, 0, 1, 1,
0.6970627, 0.09837464, 2.182013, 0.4117647, 0, 1, 1,
0.6988328, -0.1829379, 1.104146, 0.4156863, 0, 1, 1,
0.7053767, 0.6505164, -0.1538348, 0.4235294, 0, 1, 1,
0.7060574, -0.1370141, 2.001005, 0.427451, 0, 1, 1,
0.7099216, -1.106585, 2.14353, 0.4352941, 0, 1, 1,
0.7144299, -0.03605157, -0.3337924, 0.4392157, 0, 1, 1,
0.7165689, -1.105749, 2.853556, 0.4470588, 0, 1, 1,
0.7194262, -0.8257499, 3.100934, 0.4509804, 0, 1, 1,
0.7245431, 0.05869661, 2.192516, 0.4588235, 0, 1, 1,
0.7279778, 0.0657243, 1.119655, 0.4627451, 0, 1, 1,
0.730419, -0.6362938, 1.102452, 0.4705882, 0, 1, 1,
0.7314904, -0.5876334, 2.799886, 0.4745098, 0, 1, 1,
0.7315308, 0.5748668, 2.162754, 0.4823529, 0, 1, 1,
0.7370328, 0.8882346, 1.256961, 0.4862745, 0, 1, 1,
0.7507935, -1.591137, 2.726695, 0.4941176, 0, 1, 1,
0.7526242, -0.3040753, 0.9492784, 0.5019608, 0, 1, 1,
0.7548335, -0.2514821, 3.095573, 0.5058824, 0, 1, 1,
0.754976, 1.806472, 2.246245, 0.5137255, 0, 1, 1,
0.7556453, 0.8338438, -0.7766986, 0.5176471, 0, 1, 1,
0.7583574, 0.5531254, 1.182099, 0.5254902, 0, 1, 1,
0.7600069, -0.3810132, 2.494591, 0.5294118, 0, 1, 1,
0.7641202, 0.4593388, 1.465715, 0.5372549, 0, 1, 1,
0.7671913, 1.325398, 1.553616, 0.5411765, 0, 1, 1,
0.7677391, 0.866328, 1.797255, 0.5490196, 0, 1, 1,
0.7715482, 0.4255538, 0.07346351, 0.5529412, 0, 1, 1,
0.773922, -0.6372812, 2.567346, 0.5607843, 0, 1, 1,
0.7834455, -0.118259, 1.094047, 0.5647059, 0, 1, 1,
0.793568, 1.031276, 2.014429, 0.572549, 0, 1, 1,
0.7943549, 1.389496, 0.5536029, 0.5764706, 0, 1, 1,
0.7959448, 0.1600354, 1.594199, 0.5843138, 0, 1, 1,
0.7999886, 0.6727183, 1.743675, 0.5882353, 0, 1, 1,
0.8058521, -1.874795, 4.586744, 0.5960785, 0, 1, 1,
0.8081155, 1.7668, 0.6328804, 0.6039216, 0, 1, 1,
0.8084018, 0.5258464, 0.4181697, 0.6078432, 0, 1, 1,
0.809509, 0.2179909, 0.4896353, 0.6156863, 0, 1, 1,
0.8115454, -0.5482621, 1.912556, 0.6196079, 0, 1, 1,
0.8166731, -0.622598, 1.648682, 0.627451, 0, 1, 1,
0.8176066, -0.4985498, 1.385039, 0.6313726, 0, 1, 1,
0.8185824, -0.2828221, 1.458124, 0.6392157, 0, 1, 1,
0.819412, -2.017354, 3.111237, 0.6431373, 0, 1, 1,
0.8199971, -0.8481758, 1.81345, 0.6509804, 0, 1, 1,
0.822448, -0.2670627, 0.9680135, 0.654902, 0, 1, 1,
0.8226292, -0.5650932, 1.969555, 0.6627451, 0, 1, 1,
0.8266837, 0.02537582, 0.9058913, 0.6666667, 0, 1, 1,
0.8269201, -1.181921, 1.85629, 0.6745098, 0, 1, 1,
0.8306427, 0.2902233, 2.9204, 0.6784314, 0, 1, 1,
0.836125, 0.9026178, 0.1179939, 0.6862745, 0, 1, 1,
0.8385261, -0.4142147, 3.60629, 0.6901961, 0, 1, 1,
0.8397999, -0.2205207, 0.9196532, 0.6980392, 0, 1, 1,
0.8443449, 0.06068099, 0.7591943, 0.7058824, 0, 1, 1,
0.8503156, -1.855415, 0.9255606, 0.7098039, 0, 1, 1,
0.8508771, -0.4849993, 2.782924, 0.7176471, 0, 1, 1,
0.8570855, 1.53569, -0.6848779, 0.7215686, 0, 1, 1,
0.8573776, -1.154843, 4.802965, 0.7294118, 0, 1, 1,
0.8683441, 1.756631, -0.02598021, 0.7333333, 0, 1, 1,
0.8690497, -1.773638, 2.716197, 0.7411765, 0, 1, 1,
0.8753495, -2.240147, 3.381157, 0.7450981, 0, 1, 1,
0.8774903, -0.1390978, 1.476502, 0.7529412, 0, 1, 1,
0.8799089, 0.4708233, 0.3821279, 0.7568628, 0, 1, 1,
0.8815909, 1.182572, 1.302602, 0.7647059, 0, 1, 1,
0.8852627, -0.008080759, 0.7645866, 0.7686275, 0, 1, 1,
0.8891363, 0.3114414, 1.819303, 0.7764706, 0, 1, 1,
0.8911244, -0.3993012, 2.401377, 0.7803922, 0, 1, 1,
0.8914657, 0.4552207, 1.992047, 0.7882353, 0, 1, 1,
0.8922014, 1.846313, 0.1961466, 0.7921569, 0, 1, 1,
0.8956876, 0.4001197, 2.925667, 0.8, 0, 1, 1,
0.8990294, 2.14132, -0.1002291, 0.8078431, 0, 1, 1,
0.916975, -0.5305156, 1.411414, 0.8117647, 0, 1, 1,
0.9173993, -0.545406, 3.032137, 0.8196079, 0, 1, 1,
0.9186105, -0.6023341, 2.982084, 0.8235294, 0, 1, 1,
0.9254543, -1.519332, 2.845221, 0.8313726, 0, 1, 1,
0.9284183, 1.579568, -0.5643387, 0.8352941, 0, 1, 1,
0.9478028, 0.02521351, 2.604958, 0.8431373, 0, 1, 1,
0.9498577, 1.63965, 0.692394, 0.8470588, 0, 1, 1,
0.9524285, -0.3829181, 0.9347863, 0.854902, 0, 1, 1,
0.970116, -0.8193053, 2.296365, 0.8588235, 0, 1, 1,
0.9721158, -0.4422011, 1.032894, 0.8666667, 0, 1, 1,
0.9849926, -0.2183102, 1.532313, 0.8705882, 0, 1, 1,
0.9920279, 0.5096432, 1.17782, 0.8784314, 0, 1, 1,
0.9949458, -0.4746651, 1.344643, 0.8823529, 0, 1, 1,
0.99496, 0.8526754, 1.421893, 0.8901961, 0, 1, 1,
1.001032, 0.05547111, 4.367541, 0.8941177, 0, 1, 1,
1.002177, -0.4082873, 1.118746, 0.9019608, 0, 1, 1,
1.006018, -0.2841913, 0.6772346, 0.9098039, 0, 1, 1,
1.008406, -0.6857123, 3.254419, 0.9137255, 0, 1, 1,
1.017794, -0.4713361, 2.339377, 0.9215686, 0, 1, 1,
1.018661, -0.3976405, 1.408898, 0.9254902, 0, 1, 1,
1.02216, 0.1052194, 1.020003, 0.9333333, 0, 1, 1,
1.029587, 0.3793936, 1.823384, 0.9372549, 0, 1, 1,
1.033669, 0.1007238, -0.03064611, 0.945098, 0, 1, 1,
1.034128, -0.1777679, 3.051373, 0.9490196, 0, 1, 1,
1.038976, 0.3807742, 0.2761039, 0.9568627, 0, 1, 1,
1.047851, 0.2620361, 1.062057, 0.9607843, 0, 1, 1,
1.052142, -0.06220571, 2.186301, 0.9686275, 0, 1, 1,
1.053716, 0.141361, 4.045247, 0.972549, 0, 1, 1,
1.056291, -0.5012962, -0.44304, 0.9803922, 0, 1, 1,
1.05786, 0.2130066, 1.328223, 0.9843137, 0, 1, 1,
1.067107, -0.704062, 2.102615, 0.9921569, 0, 1, 1,
1.071418, 2.309931, 2.021216, 0.9960784, 0, 1, 1,
1.081381, 0.3229318, 1.609302, 1, 0, 0.9960784, 1,
1.088075, -0.3017853, -0.3067023, 1, 0, 0.9882353, 1,
1.098286, -1.343607, 2.468698, 1, 0, 0.9843137, 1,
1.098691, -0.4717128, 0.5871376, 1, 0, 0.9764706, 1,
1.102271, -1.472034, 1.810431, 1, 0, 0.972549, 1,
1.104561, -1.0048, 2.228402, 1, 0, 0.9647059, 1,
1.106843, -2.543644, 4.469171, 1, 0, 0.9607843, 1,
1.108329, 0.9830595, 0.2048113, 1, 0, 0.9529412, 1,
1.108545, -0.2688031, 0.7978792, 1, 0, 0.9490196, 1,
1.113809, -0.8773275, 2.775832, 1, 0, 0.9411765, 1,
1.119971, -2.082821, 2.781593, 1, 0, 0.9372549, 1,
1.139709, -0.9183677, 2.947256, 1, 0, 0.9294118, 1,
1.140349, -0.02921167, 0.9271606, 1, 0, 0.9254902, 1,
1.140845, -0.2307578, 2.341119, 1, 0, 0.9176471, 1,
1.144112, 0.2692196, 5.179761, 1, 0, 0.9137255, 1,
1.146049, 0.8408933, 1.194228, 1, 0, 0.9058824, 1,
1.146109, -0.2205092, 2.820288, 1, 0, 0.9019608, 1,
1.150634, 1.171918, 1.087341, 1, 0, 0.8941177, 1,
1.150841, -0.8429381, 2.481336, 1, 0, 0.8862745, 1,
1.156179, 0.8890835, 1.491416, 1, 0, 0.8823529, 1,
1.166169, -0.0366151, 2.217574, 1, 0, 0.8745098, 1,
1.17612, 1.283213, 0.4089834, 1, 0, 0.8705882, 1,
1.177747, -1.484965, 3.119458, 1, 0, 0.8627451, 1,
1.180088, 0.3881446, 1.913455, 1, 0, 0.8588235, 1,
1.187388, 0.1957169, 1.271419, 1, 0, 0.8509804, 1,
1.192182, -0.5841562, 2.384985, 1, 0, 0.8470588, 1,
1.192206, -0.06525934, 0.2396518, 1, 0, 0.8392157, 1,
1.201259, 0.4671041, 1.747287, 1, 0, 0.8352941, 1,
1.213112, -0.1034431, 1.307749, 1, 0, 0.827451, 1,
1.216302, 0.8433623, 0.582819, 1, 0, 0.8235294, 1,
1.219526, -0.7493185, 1.306864, 1, 0, 0.8156863, 1,
1.219937, -0.9155582, 2.957865, 1, 0, 0.8117647, 1,
1.236355, 0.617245, -0.7936087, 1, 0, 0.8039216, 1,
1.239307, 1.146287, 0.8133475, 1, 0, 0.7960784, 1,
1.242277, 1.233585, 0.6167577, 1, 0, 0.7921569, 1,
1.244991, -1.029656, 1.799983, 1, 0, 0.7843137, 1,
1.246936, -0.1435134, 1.543044, 1, 0, 0.7803922, 1,
1.269088, 0.3527009, -1.465572, 1, 0, 0.772549, 1,
1.270595, 0.1726216, 0.7231939, 1, 0, 0.7686275, 1,
1.280076, -0.9456708, 0.6925153, 1, 0, 0.7607843, 1,
1.281875, 2.022303, -0.4557897, 1, 0, 0.7568628, 1,
1.298571, 0.8758622, 1.495553, 1, 0, 0.7490196, 1,
1.299195, -1.036877, 2.587109, 1, 0, 0.7450981, 1,
1.300297, -1.367788, 1.543005, 1, 0, 0.7372549, 1,
1.302674, -0.2290302, 2.149753, 1, 0, 0.7333333, 1,
1.315971, 0.00655929, 3.617109, 1, 0, 0.7254902, 1,
1.32729, 0.4571054, 1.227369, 1, 0, 0.7215686, 1,
1.328613, -1.674629, 3.499485, 1, 0, 0.7137255, 1,
1.328942, 0.7446232, 0.1555673, 1, 0, 0.7098039, 1,
1.331499, 1.333348, 0.009651738, 1, 0, 0.7019608, 1,
1.333494, -0.2626048, 1.301042, 1, 0, 0.6941177, 1,
1.353196, 0.6805497, 1.675022, 1, 0, 0.6901961, 1,
1.357283, 0.06963737, 1.328288, 1, 0, 0.682353, 1,
1.363823, 0.9517033, 1.635171, 1, 0, 0.6784314, 1,
1.371398, 0.377969, 0.5256364, 1, 0, 0.6705883, 1,
1.374571, 2.092166, -1.105819, 1, 0, 0.6666667, 1,
1.380539, 1.804868, -0.02127309, 1, 0, 0.6588235, 1,
1.383245, -0.0917708, 1.259713, 1, 0, 0.654902, 1,
1.385195, -2.765072, 1.628448, 1, 0, 0.6470588, 1,
1.389579, -1.137725, 2.161644, 1, 0, 0.6431373, 1,
1.390563, 0.4282647, -0.9426541, 1, 0, 0.6352941, 1,
1.391564, -1.382478, 2.866632, 1, 0, 0.6313726, 1,
1.401439, 2.396496, 2.675102, 1, 0, 0.6235294, 1,
1.404103, 0.8099434, -0.1139782, 1, 0, 0.6196079, 1,
1.409721, 0.8110188, 1.925243, 1, 0, 0.6117647, 1,
1.411673, -2.224394, 2.569884, 1, 0, 0.6078432, 1,
1.417543, -1.692505, 3.169788, 1, 0, 0.6, 1,
1.419197, 2.810359, -0.7902061, 1, 0, 0.5921569, 1,
1.423812, 0.6376357, 1.176176, 1, 0, 0.5882353, 1,
1.424091, -1.098813, 2.697191, 1, 0, 0.5803922, 1,
1.425827, -0.1801813, 2.895064, 1, 0, 0.5764706, 1,
1.428168, 0.242843, 1.108614, 1, 0, 0.5686275, 1,
1.430643, -0.6613742, 1.465993, 1, 0, 0.5647059, 1,
1.431803, -0.5044405, 2.4886, 1, 0, 0.5568628, 1,
1.43397, 0.2655837, 2.442328, 1, 0, 0.5529412, 1,
1.438989, -0.3847335, 1.666947, 1, 0, 0.5450981, 1,
1.440526, -0.9541036, 0.4096134, 1, 0, 0.5411765, 1,
1.446406, -0.464779, 3.031971, 1, 0, 0.5333334, 1,
1.453632, 0.2285322, 2.792287, 1, 0, 0.5294118, 1,
1.469962, -1.334976, 1.75773, 1, 0, 0.5215687, 1,
1.472612, -1.060616, 1.267892, 1, 0, 0.5176471, 1,
1.473414, -2.081735, 2.811264, 1, 0, 0.509804, 1,
1.477466, -0.6766255, 2.205909, 1, 0, 0.5058824, 1,
1.480764, -0.7319427, 1.77281, 1, 0, 0.4980392, 1,
1.48689, -0.7090011, 3.203293, 1, 0, 0.4901961, 1,
1.48767, -1.575899, 3.37402, 1, 0, 0.4862745, 1,
1.49126, 1.748235, 2.331444, 1, 0, 0.4784314, 1,
1.499324, -1.315361, 1.084769, 1, 0, 0.4745098, 1,
1.503658, -0.8531845, 1.717492, 1, 0, 0.4666667, 1,
1.516093, -0.6146126, 2.964271, 1, 0, 0.4627451, 1,
1.517719, -0.6228422, 2.853204, 1, 0, 0.454902, 1,
1.526146, 0.0942436, 0.5654961, 1, 0, 0.4509804, 1,
1.52711, -1.093939, 2.953224, 1, 0, 0.4431373, 1,
1.530834, -1.589333, 2.761443, 1, 0, 0.4392157, 1,
1.546396, 0.1714051, -0.2416527, 1, 0, 0.4313726, 1,
1.547845, -0.8427015, 2.517323, 1, 0, 0.427451, 1,
1.549648, -0.1194894, 1.508688, 1, 0, 0.4196078, 1,
1.556484, -1.134808, 1.964527, 1, 0, 0.4156863, 1,
1.557157, -0.5723022, 1.093161, 1, 0, 0.4078431, 1,
1.558124, -0.9169798, 0.8039736, 1, 0, 0.4039216, 1,
1.565831, -0.05108656, 1.789244, 1, 0, 0.3960784, 1,
1.579888, -1.139639, 2.35987, 1, 0, 0.3882353, 1,
1.595298, -1.129254, 1.358053, 1, 0, 0.3843137, 1,
1.630605, -0.2247081, 2.720906, 1, 0, 0.3764706, 1,
1.63177, 2.381561, 0.6059683, 1, 0, 0.372549, 1,
1.636335, 0.2014008, 1.970927, 1, 0, 0.3647059, 1,
1.640083, 1.969233, 1.140389, 1, 0, 0.3607843, 1,
1.641512, 0.7197043, 2.329375, 1, 0, 0.3529412, 1,
1.648221, 1.153042, -0.1969707, 1, 0, 0.3490196, 1,
1.6502, -0.6369014, 2.893975, 1, 0, 0.3411765, 1,
1.656033, -0.1405, 2.297551, 1, 0, 0.3372549, 1,
1.674859, -0.4289249, 1.693205, 1, 0, 0.3294118, 1,
1.676092, 1.272456, 1.307791, 1, 0, 0.3254902, 1,
1.725959, -1.284412, 2.036099, 1, 0, 0.3176471, 1,
1.726726, -0.4532706, 0.1019559, 1, 0, 0.3137255, 1,
1.728499, 0.2768062, 0.7654551, 1, 0, 0.3058824, 1,
1.733841, 0.0684649, 1.326197, 1, 0, 0.2980392, 1,
1.744437, -0.4673763, 0.8586363, 1, 0, 0.2941177, 1,
1.745079, -2.938086, 3.381392, 1, 0, 0.2862745, 1,
1.75417, 0.239226, -1.611007, 1, 0, 0.282353, 1,
1.783656, 0.3524638, 0.8465336, 1, 0, 0.2745098, 1,
1.785276, -0.2756821, 2.339234, 1, 0, 0.2705882, 1,
1.787874, 1.701634, -1.356378, 1, 0, 0.2627451, 1,
1.807845, -0.3942501, 2.76255, 1, 0, 0.2588235, 1,
1.810384, 1.120156, 0.8303637, 1, 0, 0.2509804, 1,
1.834952, 0.3927352, -0.3703174, 1, 0, 0.2470588, 1,
1.844499, -0.4200751, -0.2391041, 1, 0, 0.2392157, 1,
1.85657, -0.7466981, 2.754233, 1, 0, 0.2352941, 1,
1.876482, -1.484831, 2.201185, 1, 0, 0.227451, 1,
1.888886, -0.7953163, 2.185212, 1, 0, 0.2235294, 1,
1.891241, 0.07626418, 0.8124042, 1, 0, 0.2156863, 1,
1.903975, 0.1165903, 1.249042, 1, 0, 0.2117647, 1,
1.905335, 0.06079479, 0.1113325, 1, 0, 0.2039216, 1,
1.916757, 0.9920391, 0.8946353, 1, 0, 0.1960784, 1,
1.951188, -0.195902, 0.1387795, 1, 0, 0.1921569, 1,
1.958057, 0.8595738, 2.137847, 1, 0, 0.1843137, 1,
1.972025, -0.7683473, 1.775997, 1, 0, 0.1803922, 1,
1.972114, -0.6239492, 1.105108, 1, 0, 0.172549, 1,
1.984839, 0.6592106, 2.246922, 1, 0, 0.1686275, 1,
1.987416, -0.9738594, 3.160269, 1, 0, 0.1607843, 1,
1.991905, -0.7373224, 2.744832, 1, 0, 0.1568628, 1,
1.99821, -1.219195, 1.879228, 1, 0, 0.1490196, 1,
2.002421, 0.2067325, 1.440096, 1, 0, 0.145098, 1,
2.020906, -0.8746399, 1.91573, 1, 0, 0.1372549, 1,
2.029884, 0.2823418, 2.486114, 1, 0, 0.1333333, 1,
2.057938, -0.6300136, 1.640542, 1, 0, 0.1254902, 1,
2.119533, -0.5350593, 1.046428, 1, 0, 0.1215686, 1,
2.119603, -1.178939, 2.7652, 1, 0, 0.1137255, 1,
2.13171, -0.2058201, 3.055684, 1, 0, 0.1098039, 1,
2.131759, -2.018734, 3.749943, 1, 0, 0.1019608, 1,
2.143888, 0.5233487, 1.399389, 1, 0, 0.09411765, 1,
2.165, -1.517571, 3.759108, 1, 0, 0.09019608, 1,
2.196135, 0.04006562, 1.173657, 1, 0, 0.08235294, 1,
2.213412, 0.2333734, 1.742673, 1, 0, 0.07843138, 1,
2.218025, 0.6517028, -0.6076873, 1, 0, 0.07058824, 1,
2.252926, 0.5845514, 1.95219, 1, 0, 0.06666667, 1,
2.385092, 0.5620286, 0.7453126, 1, 0, 0.05882353, 1,
2.388905, 0.2712548, 1.883764, 1, 0, 0.05490196, 1,
2.463457, 0.8767104, 0.8207277, 1, 0, 0.04705882, 1,
2.491682, -0.8984374, 1.665738, 1, 0, 0.04313726, 1,
2.500891, 1.012869, 0.8755659, 1, 0, 0.03529412, 1,
2.591782, 1.05502, -0.2994181, 1, 0, 0.03137255, 1,
3.131993, 0.6473818, -0.5060366, 1, 0, 0.02352941, 1,
3.622014, 2.060983, 0.7128454, 1, 0, 0.01960784, 1,
3.826703, 0.8972167, 1.139559, 1, 0, 0.01176471, 1,
4.068077, -0.1999784, 1.914099, 1, 0, 0.007843138, 1
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
0.6489848, -3.914228, -6.580559, 0, -0.5, 0.5, 0.5,
0.6489848, -3.914228, -6.580559, 1, -0.5, 0.5, 0.5,
0.6489848, -3.914228, -6.580559, 1, 1.5, 0.5, 0.5,
0.6489848, -3.914228, -6.580559, 0, 1.5, 0.5, 0.5
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
-3.929179, -0.05861127, -6.580559, 0, -0.5, 0.5, 0.5,
-3.929179, -0.05861127, -6.580559, 1, -0.5, 0.5, 0.5,
-3.929179, -0.05861127, -6.580559, 1, 1.5, 0.5, 0.5,
-3.929179, -0.05861127, -6.580559, 0, 1.5, 0.5, 0.5
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
-3.929179, -3.914228, 0.1518347, 0, -0.5, 0.5, 0.5,
-3.929179, -3.914228, 0.1518347, 1, -0.5, 0.5, 0.5,
-3.929179, -3.914228, 0.1518347, 1, 1.5, 0.5, 0.5,
-3.929179, -3.914228, 0.1518347, 0, 1.5, 0.5, 0.5
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
-2, -3.02447, -5.02693,
4, -3.02447, -5.02693,
-2, -3.02447, -5.02693,
-2, -3.172763, -5.285868,
-1, -3.02447, -5.02693,
-1, -3.172763, -5.285868,
0, -3.02447, -5.02693,
0, -3.172763, -5.285868,
1, -3.02447, -5.02693,
1, -3.172763, -5.285868,
2, -3.02447, -5.02693,
2, -3.172763, -5.285868,
3, -3.02447, -5.02693,
3, -3.172763, -5.285868,
4, -3.02447, -5.02693,
4, -3.172763, -5.285868
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
"-1",
"0",
"1",
"2",
"3",
"4"
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
-2, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
-2, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
-2, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
-2, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
-1, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
-1, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
-1, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
-1, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
0, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
0, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
0, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
0, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
1, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
1, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
1, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
1, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
2, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
2, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
2, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
2, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
3, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
3, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
3, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
3, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5,
4, -3.469349, -5.803744, 0, -0.5, 0.5, 0.5,
4, -3.469349, -5.803744, 1, -0.5, 0.5, 0.5,
4, -3.469349, -5.803744, 1, 1.5, 0.5, 0.5,
4, -3.469349, -5.803744, 0, 1.5, 0.5, 0.5
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
-2.87268, -2, -5.02693,
-2.87268, 2, -5.02693,
-2.87268, -2, -5.02693,
-3.048763, -2, -5.285868,
-2.87268, -1, -5.02693,
-3.048763, -1, -5.285868,
-2.87268, 0, -5.02693,
-3.048763, 0, -5.285868,
-2.87268, 1, -5.02693,
-3.048763, 1, -5.285868,
-2.87268, 2, -5.02693,
-3.048763, 2, -5.285868
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
-3.400929, -2, -5.803744, 0, -0.5, 0.5, 0.5,
-3.400929, -2, -5.803744, 1, -0.5, 0.5, 0.5,
-3.400929, -2, -5.803744, 1, 1.5, 0.5, 0.5,
-3.400929, -2, -5.803744, 0, 1.5, 0.5, 0.5,
-3.400929, -1, -5.803744, 0, -0.5, 0.5, 0.5,
-3.400929, -1, -5.803744, 1, -0.5, 0.5, 0.5,
-3.400929, -1, -5.803744, 1, 1.5, 0.5, 0.5,
-3.400929, -1, -5.803744, 0, 1.5, 0.5, 0.5,
-3.400929, 0, -5.803744, 0, -0.5, 0.5, 0.5,
-3.400929, 0, -5.803744, 1, -0.5, 0.5, 0.5,
-3.400929, 0, -5.803744, 1, 1.5, 0.5, 0.5,
-3.400929, 0, -5.803744, 0, 1.5, 0.5, 0.5,
-3.400929, 1, -5.803744, 0, -0.5, 0.5, 0.5,
-3.400929, 1, -5.803744, 1, -0.5, 0.5, 0.5,
-3.400929, 1, -5.803744, 1, 1.5, 0.5, 0.5,
-3.400929, 1, -5.803744, 0, 1.5, 0.5, 0.5,
-3.400929, 2, -5.803744, 0, -0.5, 0.5, 0.5,
-3.400929, 2, -5.803744, 1, -0.5, 0.5, 0.5,
-3.400929, 2, -5.803744, 1, 1.5, 0.5, 0.5,
-3.400929, 2, -5.803744, 0, 1.5, 0.5, 0.5
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
-2.87268, -3.02447, -4,
-2.87268, -3.02447, 4,
-2.87268, -3.02447, -4,
-3.048763, -3.172763, -4,
-2.87268, -3.02447, -2,
-3.048763, -3.172763, -2,
-2.87268, -3.02447, 0,
-3.048763, -3.172763, 0,
-2.87268, -3.02447, 2,
-3.048763, -3.172763, 2,
-2.87268, -3.02447, 4,
-3.048763, -3.172763, 4
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
-3.400929, -3.469349, -4, 0, -0.5, 0.5, 0.5,
-3.400929, -3.469349, -4, 1, -0.5, 0.5, 0.5,
-3.400929, -3.469349, -4, 1, 1.5, 0.5, 0.5,
-3.400929, -3.469349, -4, 0, 1.5, 0.5, 0.5,
-3.400929, -3.469349, -2, 0, -0.5, 0.5, 0.5,
-3.400929, -3.469349, -2, 1, -0.5, 0.5, 0.5,
-3.400929, -3.469349, -2, 1, 1.5, 0.5, 0.5,
-3.400929, -3.469349, -2, 0, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 0, 0, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 0, 1, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 0, 1, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 0, 0, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 2, 0, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 2, 1, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 2, 1, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 2, 0, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 4, 0, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 4, 1, -0.5, 0.5, 0.5,
-3.400929, -3.469349, 4, 1, 1.5, 0.5, 0.5,
-3.400929, -3.469349, 4, 0, 1.5, 0.5, 0.5
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
-2.87268, -3.02447, -5.02693,
-2.87268, 2.907248, -5.02693,
-2.87268, -3.02447, 5.330599,
-2.87268, 2.907248, 5.330599,
-2.87268, -3.02447, -5.02693,
-2.87268, -3.02447, 5.330599,
-2.87268, 2.907248, -5.02693,
-2.87268, 2.907248, 5.330599,
-2.87268, -3.02447, -5.02693,
4.17065, -3.02447, -5.02693,
-2.87268, -3.02447, 5.330599,
4.17065, -3.02447, 5.330599,
-2.87268, 2.907248, -5.02693,
4.17065, 2.907248, -5.02693,
-2.87268, 2.907248, 5.330599,
4.17065, 2.907248, 5.330599,
4.17065, -3.02447, -5.02693,
4.17065, 2.907248, -5.02693,
4.17065, -3.02447, 5.330599,
4.17065, 2.907248, 5.330599,
4.17065, -3.02447, -5.02693,
4.17065, -3.02447, 5.330599,
4.17065, 2.907248, -5.02693,
4.17065, 2.907248, 5.330599
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
var radius = 7.400442;
var distance = 32.9254;
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
mvMatrix.translate( -0.6489848, 0.05861127, -0.1518347 );
mvMatrix.scale( 1.13604, 1.348935, 0.7725301 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.9254);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
quinclorac<-read.table("quinclorac.xyz")
```

```
## Error in read.table("quinclorac.xyz"): no lines available in input
```

```r
x<-quinclorac$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
```

```r
y<-quinclorac$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
```

```r
z<-quinclorac$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
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
-2.770107, 1.790679, -0.5021682, 0, 0, 1, 1, 1,
-2.438427, 0.1619579, -2.636957, 1, 0, 0, 1, 1,
-2.327347, 0.3437257, -2.426111, 1, 0, 0, 1, 1,
-2.310326, -0.7924229, -1.903263, 1, 0, 0, 1, 1,
-2.306134, 1.374251, -1.759761, 1, 0, 0, 1, 1,
-2.293642, 0.4876133, -2.261366, 1, 0, 0, 1, 1,
-2.239648, -0.8414803, -0.6737438, 0, 0, 0, 1, 1,
-2.19653, 0.03650518, -2.829055, 0, 0, 0, 1, 1,
-2.192124, -1.612522, -1.459994, 0, 0, 0, 1, 1,
-2.157872, 0.7057771, -0.06603038, 0, 0, 0, 1, 1,
-2.15665, -0.1294841, -3.130403, 0, 0, 0, 1, 1,
-2.15622, 1.246023, -1.458199, 0, 0, 0, 1, 1,
-2.137293, 0.540409, -1.519182, 0, 0, 0, 1, 1,
-2.104386, 1.209561, -2.386553, 1, 1, 1, 1, 1,
-2.064247, -2.526438, -2.288472, 1, 1, 1, 1, 1,
-2.058356, 0.04665535, -1.617335, 1, 1, 1, 1, 1,
-2.05334, -1.576074, -2.195246, 1, 1, 1, 1, 1,
-2.032495, 0.6480447, -2.255486, 1, 1, 1, 1, 1,
-2.032068, 0.4864391, -1.030796, 1, 1, 1, 1, 1,
-1.95794, 0.1315797, -3.682981, 1, 1, 1, 1, 1,
-1.938899, 0.5312892, -3.566677, 1, 1, 1, 1, 1,
-1.918036, -0.9809159, -1.936361, 1, 1, 1, 1, 1,
-1.915485, 0.1402729, -0.07323176, 1, 1, 1, 1, 1,
-1.873232, -2.080257, -2.600177, 1, 1, 1, 1, 1,
-1.868298, -0.9925107, -2.026148, 1, 1, 1, 1, 1,
-1.855908, -1.110751, -1.974945, 1, 1, 1, 1, 1,
-1.853729, 0.5457486, -2.084183, 1, 1, 1, 1, 1,
-1.837657, 1.123605, -1.693182, 1, 1, 1, 1, 1,
-1.806174, -2.539135, -2.875943, 0, 0, 1, 1, 1,
-1.800908, 1.458873, -0.3534061, 1, 0, 0, 1, 1,
-1.790007, 0.578373, -0.7775722, 1, 0, 0, 1, 1,
-1.754355, -0.1304083, -0.5276844, 1, 0, 0, 1, 1,
-1.730243, 1.844955, -1.480565, 1, 0, 0, 1, 1,
-1.715238, 1.051812, 0.2538187, 1, 0, 0, 1, 1,
-1.690048, -0.8715435, -1.848958, 0, 0, 0, 1, 1,
-1.683175, -0.3028958, -2.314019, 0, 0, 0, 1, 1,
-1.681562, 1.512087, -1.60882, 0, 0, 0, 1, 1,
-1.673811, -0.8435483, -1.666718, 0, 0, 0, 1, 1,
-1.671443, -0.3826661, 0.1249018, 0, 0, 0, 1, 1,
-1.653796, -0.6010621, -1.83929, 0, 0, 0, 1, 1,
-1.645937, -0.1943518, -0.4720954, 0, 0, 0, 1, 1,
-1.629306, -0.4230951, -3.753543, 1, 1, 1, 1, 1,
-1.619048, -0.3482153, -2.351863, 1, 1, 1, 1, 1,
-1.614215, -0.7701132, -2.935131, 1, 1, 1, 1, 1,
-1.592867, -0.9098813, -3.44516, 1, 1, 1, 1, 1,
-1.588915, -0.5830163, -3.160101, 1, 1, 1, 1, 1,
-1.588116, -0.6143268, 0.1187727, 1, 1, 1, 1, 1,
-1.57908, 0.2450079, -1.3707, 1, 1, 1, 1, 1,
-1.564569, 0.7969856, -1.135311, 1, 1, 1, 1, 1,
-1.554975, -0.4467236, -2.862411, 1, 1, 1, 1, 1,
-1.549442, 0.7955036, -0.1077461, 1, 1, 1, 1, 1,
-1.548844, -0.3859183, -4.446671, 1, 1, 1, 1, 1,
-1.540714, 1.366939, -2.141361, 1, 1, 1, 1, 1,
-1.536609, -0.5204144, -1.749278, 1, 1, 1, 1, 1,
-1.530505, -1.267738, -3.072944, 1, 1, 1, 1, 1,
-1.514449, 1.674619, -0.3323441, 1, 1, 1, 1, 1,
-1.510883, -0.5138749, -0.8593352, 0, 0, 1, 1, 1,
-1.506077, -0.2848368, -3.285663, 1, 0, 0, 1, 1,
-1.498885, 0.05686751, -2.109296, 1, 0, 0, 1, 1,
-1.479464, 0.8068671, -1.639142, 1, 0, 0, 1, 1,
-1.477758, -0.05801343, -0.8883282, 1, 0, 0, 1, 1,
-1.473727, -0.3361679, -1.570754, 1, 0, 0, 1, 1,
-1.47325, 0.2394917, -1.433174, 0, 0, 0, 1, 1,
-1.469962, 0.6693534, -1.656415, 0, 0, 0, 1, 1,
-1.466724, -0.2407875, -1.798208, 0, 0, 0, 1, 1,
-1.46668, 0.4696551, -1.518354, 0, 0, 0, 1, 1,
-1.46412, 0.4253973, -1.557036, 0, 0, 0, 1, 1,
-1.451045, -0.09071906, -1.962776, 0, 0, 0, 1, 1,
-1.448587, 0.07172058, -0.8006507, 0, 0, 0, 1, 1,
-1.443823, -1.360636, -2.786961, 1, 1, 1, 1, 1,
-1.437262, 0.8996564, -1.110547, 1, 1, 1, 1, 1,
-1.431627, -2.486625, -2.325605, 1, 1, 1, 1, 1,
-1.428728, -0.09367327, -1.155696, 1, 1, 1, 1, 1,
-1.421742, -0.07365663, -2.438929, 1, 1, 1, 1, 1,
-1.417325, -1.25422, -1.697483, 1, 1, 1, 1, 1,
-1.408123, -1.511373, -0.1837191, 1, 1, 1, 1, 1,
-1.373953, 1.2183, -0.4056486, 1, 1, 1, 1, 1,
-1.359923, -0.3783921, -1.465094, 1, 1, 1, 1, 1,
-1.359296, 0.01227136, -2.41306, 1, 1, 1, 1, 1,
-1.349744, -0.2666577, -1.636116, 1, 1, 1, 1, 1,
-1.342348, -1.906797, -0.8108856, 1, 1, 1, 1, 1,
-1.33846, -0.4978529, -1.763563, 1, 1, 1, 1, 1,
-1.337137, -0.8942552, -3.428933, 1, 1, 1, 1, 1,
-1.336126, -0.2703501, -2.927135, 1, 1, 1, 1, 1,
-1.330004, -0.4806124, -1.610976, 0, 0, 1, 1, 1,
-1.320795, 0.8571723, 0.01391981, 1, 0, 0, 1, 1,
-1.318098, 0.8355721, -1.69676, 1, 0, 0, 1, 1,
-1.313804, -0.7406907, -2.44571, 1, 0, 0, 1, 1,
-1.312549, 0.9294179, -0.8709526, 1, 0, 0, 1, 1,
-1.296611, -0.9399606, -0.7126161, 1, 0, 0, 1, 1,
-1.287793, 0.1470336, -2.720715, 0, 0, 0, 1, 1,
-1.283709, -0.7874331, -1.838377, 0, 0, 0, 1, 1,
-1.275453, -2.050514, -4.536349, 0, 0, 0, 1, 1,
-1.274366, -0.7074356, -0.372567, 0, 0, 0, 1, 1,
-1.261024, 0.5847696, -3.264944, 0, 0, 0, 1, 1,
-1.26014, -0.5410553, -2.268346, 0, 0, 0, 1, 1,
-1.253425, 0.3528608, -1.037637, 0, 0, 0, 1, 1,
-1.245229, 0.02790096, -2.56074, 1, 1, 1, 1, 1,
-1.242928, -0.2847891, -0.1905065, 1, 1, 1, 1, 1,
-1.242697, 0.09756554, -1.024376, 1, 1, 1, 1, 1,
-1.241378, 0.1330783, -2.839014, 1, 1, 1, 1, 1,
-1.234245, 1.026577, -1.245811, 1, 1, 1, 1, 1,
-1.231799, 0.6248438, -2.039829, 1, 1, 1, 1, 1,
-1.220992, -0.4740546, -1.394322, 1, 1, 1, 1, 1,
-1.217254, 1.423877, -1.171462, 1, 1, 1, 1, 1,
-1.216689, -0.9371988, -1.05645, 1, 1, 1, 1, 1,
-1.211796, 1.65557, -0.4040022, 1, 1, 1, 1, 1,
-1.199684, 0.7710318, -0.5152991, 1, 1, 1, 1, 1,
-1.194519, 0.9869832, -1.160888, 1, 1, 1, 1, 1,
-1.192529, 0.3436979, -1.583163, 1, 1, 1, 1, 1,
-1.191026, -0.5983144, -1.907501, 1, 1, 1, 1, 1,
-1.189318, -0.3776795, -2.153634, 1, 1, 1, 1, 1,
-1.175998, -0.7506644, -0.8636144, 0, 0, 1, 1, 1,
-1.172364, -1.457553, -4.010629, 1, 0, 0, 1, 1,
-1.161626, 0.184898, -2.611091, 1, 0, 0, 1, 1,
-1.16009, 0.8090277, -1.75003, 1, 0, 0, 1, 1,
-1.154375, 1.369408, -1.34317, 1, 0, 0, 1, 1,
-1.139563, -1.128712, -1.942016, 1, 0, 0, 1, 1,
-1.129597, 0.4964084, 0.7562817, 0, 0, 0, 1, 1,
-1.129591, -0.5849358, -2.921201, 0, 0, 0, 1, 1,
-1.121655, 0.8199421, -2.872453, 0, 0, 0, 1, 1,
-1.110852, 0.2897004, -2.232201, 0, 0, 0, 1, 1,
-1.107922, 1.148626, -1.294928, 0, 0, 0, 1, 1,
-1.102065, 2.371621, -0.7227137, 0, 0, 0, 1, 1,
-1.100819, -0.5936968, -3.327823, 0, 0, 0, 1, 1,
-1.094356, -0.9693014, -1.865225, 1, 1, 1, 1, 1,
-1.092251, -1.54847, -1.147706, 1, 1, 1, 1, 1,
-1.09124, 1.128203, 0.7034892, 1, 1, 1, 1, 1,
-1.085957, 0.8481106, -0.2607433, 1, 1, 1, 1, 1,
-1.078231, -1.209786, -3.222219, 1, 1, 1, 1, 1,
-1.065907, 0.9406955, -1.289315, 1, 1, 1, 1, 1,
-1.064229, -0.2748897, -1.895055, 1, 1, 1, 1, 1,
-1.063671, -1.280884, -1.234615, 1, 1, 1, 1, 1,
-1.063263, 0.01678747, -1.347092, 1, 1, 1, 1, 1,
-1.058543, 0.7955114, -1.265576, 1, 1, 1, 1, 1,
-1.056984, -0.8846015, -0.9538304, 1, 1, 1, 1, 1,
-1.054841, 0.129311, -1.485574, 1, 1, 1, 1, 1,
-1.050452, -0.3380415, -2.36286, 1, 1, 1, 1, 1,
-1.036615, -0.8722752, 0.04984557, 1, 1, 1, 1, 1,
-1.023682, 0.4255058, -1.381631, 1, 1, 1, 1, 1,
-1.014135, -2.228415, -3.238373, 0, 0, 1, 1, 1,
-1.011338, -1.315933, -2.266356, 1, 0, 0, 1, 1,
-1.006239, 0.8271654, -1.460079, 1, 0, 0, 1, 1,
-0.9953639, 1.807445, -0.4365205, 1, 0, 0, 1, 1,
-0.9908959, -0.9375558, -4.508019, 1, 0, 0, 1, 1,
-0.9908438, 1.110567, -3.265558, 1, 0, 0, 1, 1,
-0.9896772, 0.4283963, -1.921391, 0, 0, 0, 1, 1,
-0.9889407, 0.6071525, -2.978868, 0, 0, 0, 1, 1,
-0.988534, -0.3822153, -2.347354, 0, 0, 0, 1, 1,
-0.9858767, -0.837756, -1.452267, 0, 0, 0, 1, 1,
-0.9809721, -2.11606, -1.808117, 0, 0, 0, 1, 1,
-0.9803569, 0.06100692, -1.618158, 0, 0, 0, 1, 1,
-0.9750283, -0.6728192, -2.206742, 0, 0, 0, 1, 1,
-0.9742849, 0.0085256, -2.729852, 1, 1, 1, 1, 1,
-0.9706881, -0.5192892, -1.37352, 1, 1, 1, 1, 1,
-0.9701372, -0.692696, -3.428961, 1, 1, 1, 1, 1,
-0.9701201, 1.495623, -1.170256, 1, 1, 1, 1, 1,
-0.9691595, 0.3027058, -1.139775, 1, 1, 1, 1, 1,
-0.9689604, 0.1909098, -0.4255399, 1, 1, 1, 1, 1,
-0.9625961, 0.2968394, -0.8216596, 1, 1, 1, 1, 1,
-0.9579251, -0.01884731, -1.146159, 1, 1, 1, 1, 1,
-0.9551046, -0.359531, -0.8266072, 1, 1, 1, 1, 1,
-0.9510392, 1.807979, 0.3395599, 1, 1, 1, 1, 1,
-0.9488537, 0.01126629, -1.673542, 1, 1, 1, 1, 1,
-0.938575, -0.133628, -1.34264, 1, 1, 1, 1, 1,
-0.937167, -1.660421, -3.642949, 1, 1, 1, 1, 1,
-0.9319508, 1.607663, -0.2666866, 1, 1, 1, 1, 1,
-0.9276727, -0.4967771, -2.63384, 1, 1, 1, 1, 1,
-0.9268926, 0.05005999, -2.08677, 0, 0, 1, 1, 1,
-0.923814, -0.2979101, -0.4298603, 1, 0, 0, 1, 1,
-0.9176461, -0.6665332, -3.324138, 1, 0, 0, 1, 1,
-0.9160956, 0.01928501, -1.09374, 1, 0, 0, 1, 1,
-0.9148205, -0.6493043, -1.35294, 1, 0, 0, 1, 1,
-0.9136181, -0.6862476, -1.88043, 1, 0, 0, 1, 1,
-0.9057822, -0.9742661, -1.834139, 0, 0, 0, 1, 1,
-0.9019485, 1.067752, -0.934693, 0, 0, 0, 1, 1,
-0.8992753, 0.5401387, -1.922114, 0, 0, 0, 1, 1,
-0.8988388, -0.213101, -0.7350364, 0, 0, 0, 1, 1,
-0.8967107, 0.06967804, -0.5434505, 0, 0, 0, 1, 1,
-0.8936285, -1.975443, -1.019271, 0, 0, 0, 1, 1,
-0.8926456, -0.5434204, -1.008331, 0, 0, 0, 1, 1,
-0.8904206, -0.5984084, -1.920009, 1, 1, 1, 1, 1,
-0.8891317, 0.3982548, -1.586158, 1, 1, 1, 1, 1,
-0.8876601, 1.406558, -0.2264363, 1, 1, 1, 1, 1,
-0.8805174, -1.0038, -2.21237, 1, 1, 1, 1, 1,
-0.8756576, -1.642359, -2.206023, 1, 1, 1, 1, 1,
-0.8649434, -1.913517, -2.284053, 1, 1, 1, 1, 1,
-0.8600398, 0.01747425, -2.453946, 1, 1, 1, 1, 1,
-0.8543534, -0.2669452, -1.032783, 1, 1, 1, 1, 1,
-0.8522081, -1.147188, -3.416579, 1, 1, 1, 1, 1,
-0.851993, -0.3712629, -0.1951217, 1, 1, 1, 1, 1,
-0.8401098, -0.01459743, -2.104083, 1, 1, 1, 1, 1,
-0.8351202, -1.63497, -3.269237, 1, 1, 1, 1, 1,
-0.8327327, -0.9231822, -3.731786, 1, 1, 1, 1, 1,
-0.828676, -2.230493, -2.798078, 1, 1, 1, 1, 1,
-0.8256241, 1.485072, -0.9071669, 1, 1, 1, 1, 1,
-0.8172588, 0.9182852, -1.449992, 0, 0, 1, 1, 1,
-0.8123579, 0.5573425, -0.7988997, 1, 0, 0, 1, 1,
-0.8039644, 1.294666, -0.54134, 1, 0, 0, 1, 1,
-0.8001773, -0.3547196, -2.369422, 1, 0, 0, 1, 1,
-0.7969128, 1.314169, -0.09540353, 1, 0, 0, 1, 1,
-0.7962372, -0.4486518, -3.270768, 1, 0, 0, 1, 1,
-0.7889783, 0.3224956, 0.313626, 0, 0, 0, 1, 1,
-0.7879067, -0.3676352, -1.900774, 0, 0, 0, 1, 1,
-0.785103, 0.821434, -1.392662, 0, 0, 0, 1, 1,
-0.7771584, -1.833219, -2.389962, 0, 0, 0, 1, 1,
-0.7769575, 0.846717, -1.078443, 0, 0, 0, 1, 1,
-0.7686074, 0.4362024, -1.655211, 0, 0, 0, 1, 1,
-0.7677698, -1.068411, -2.100117, 0, 0, 0, 1, 1,
-0.7665421, 0.00648314, -0.9748274, 1, 1, 1, 1, 1,
-0.7566396, -0.07099215, -3.556326, 1, 1, 1, 1, 1,
-0.7555291, -0.1630101, -1.210003, 1, 1, 1, 1, 1,
-0.7549925, 0.5964151, 0.07173844, 1, 1, 1, 1, 1,
-0.750679, 0.08880313, -1.731403, 1, 1, 1, 1, 1,
-0.7451678, 0.3195483, -0.6892484, 1, 1, 1, 1, 1,
-0.7394445, 0.04580936, -0.8149196, 1, 1, 1, 1, 1,
-0.7366547, -1.135382, -2.828039, 1, 1, 1, 1, 1,
-0.7348151, -0.4377807, -2.229396, 1, 1, 1, 1, 1,
-0.7303089, -0.4026331, -0.3312148, 1, 1, 1, 1, 1,
-0.7301432, 0.5669858, -0.9988744, 1, 1, 1, 1, 1,
-0.7292112, -0.5553344, -2.692744, 1, 1, 1, 1, 1,
-0.7262347, 0.6430829, -2.204336, 1, 1, 1, 1, 1,
-0.7196448, 1.133462, -1.515109, 1, 1, 1, 1, 1,
-0.7041754, 0.5535825, -1.911842, 1, 1, 1, 1, 1,
-0.7003662, -0.6668428, -3.72283, 0, 0, 1, 1, 1,
-0.6999269, -0.6830568, -3.306193, 1, 0, 0, 1, 1,
-0.6972102, 0.1932387, -0.9064421, 1, 0, 0, 1, 1,
-0.6971556, -0.03522383, -1.918993, 1, 0, 0, 1, 1,
-0.6968794, 0.5333132, -1.108909, 1, 0, 0, 1, 1,
-0.6939058, 1.409433, -0.5113219, 1, 0, 0, 1, 1,
-0.6920076, 0.5750913, -0.2212458, 0, 0, 0, 1, 1,
-0.6919754, 0.6906916, -0.963941, 0, 0, 0, 1, 1,
-0.6913068, 0.4517285, -2.57877, 0, 0, 0, 1, 1,
-0.6897291, -1.767252, -4.126651, 0, 0, 0, 1, 1,
-0.6895428, 1.089128, 0.5886647, 0, 0, 0, 1, 1,
-0.6871777, -0.4531869, -2.033532, 0, 0, 0, 1, 1,
-0.6866974, 0.6437904, -1.810836, 0, 0, 0, 1, 1,
-0.6850224, -0.8489647, -3.910082, 1, 1, 1, 1, 1,
-0.6804641, -1.018433, -2.914733, 1, 1, 1, 1, 1,
-0.6794749, 2.571511, -1.16756, 1, 1, 1, 1, 1,
-0.6744082, -0.8633196, -3.149514, 1, 1, 1, 1, 1,
-0.6736391, 1.763728, -1.0156, 1, 1, 1, 1, 1,
-0.6693566, 0.8042948, -0.2340582, 1, 1, 1, 1, 1,
-0.6645079, -0.6696854, -3.185754, 1, 1, 1, 1, 1,
-0.6618144, -0.294208, -2.342785, 1, 1, 1, 1, 1,
-0.6605531, 0.8480776, -2.392144, 1, 1, 1, 1, 1,
-0.6594499, -1.380559, -3.217674, 1, 1, 1, 1, 1,
-0.657184, -0.9055157, -2.374687, 1, 1, 1, 1, 1,
-0.6557399, -0.8380957, -1.537978, 1, 1, 1, 1, 1,
-0.6509777, 0.247202, -0.005614713, 1, 1, 1, 1, 1,
-0.6424264, -0.6416516, -2.074366, 1, 1, 1, 1, 1,
-0.6355829, 0.2557085, -2.522439, 1, 1, 1, 1, 1,
-0.6347872, -1.962424, -2.631633, 0, 0, 1, 1, 1,
-0.6305456, -1.517956, -2.864494, 1, 0, 0, 1, 1,
-0.6231192, 0.7257243, 0.4402647, 1, 0, 0, 1, 1,
-0.6230385, 0.1241291, -0.8045996, 1, 0, 0, 1, 1,
-0.6227655, 0.2697009, -2.415555, 1, 0, 0, 1, 1,
-0.6176164, -2.45352, -2.777625, 1, 0, 0, 1, 1,
-0.6159656, 0.4036585, -0.7266462, 0, 0, 0, 1, 1,
-0.6157284, -0.3792754, -0.7755069, 0, 0, 0, 1, 1,
-0.6111761, -1.709318, -2.887172, 0, 0, 0, 1, 1,
-0.6056955, 1.017602, -1.660877, 0, 0, 0, 1, 1,
-0.6004131, -1.341812, -2.428186, 0, 0, 0, 1, 1,
-0.6000108, -0.4665985, -3.557468, 0, 0, 0, 1, 1,
-0.5994884, 0.2278248, -2.134719, 0, 0, 0, 1, 1,
-0.5949854, 0.04234261, -0.6760968, 1, 1, 1, 1, 1,
-0.5943317, -0.4814, -2.098052, 1, 1, 1, 1, 1,
-0.593028, 0.9892958, -0.5003101, 1, 1, 1, 1, 1,
-0.5888029, -0.9010804, -3.258726, 1, 1, 1, 1, 1,
-0.5870245, -0.9688597, -0.4560329, 1, 1, 1, 1, 1,
-0.5857607, -0.6164853, -1.591087, 1, 1, 1, 1, 1,
-0.5799356, 0.8949728, -2.22106, 1, 1, 1, 1, 1,
-0.5778723, -1.250736, -2.219289, 1, 1, 1, 1, 1,
-0.5776324, 0.9700286, -2.043635, 1, 1, 1, 1, 1,
-0.5685003, 0.262549, -0.5115889, 1, 1, 1, 1, 1,
-0.5672069, -0.424719, -2.034536, 1, 1, 1, 1, 1,
-0.5655575, -0.3675257, -3.779321, 1, 1, 1, 1, 1,
-0.5596946, -0.1011157, -2.72599, 1, 1, 1, 1, 1,
-0.5582843, -0.5510499, -1.539536, 1, 1, 1, 1, 1,
-0.5579998, -0.7683942, -2.812256, 1, 1, 1, 1, 1,
-0.5490378, 0.6485158, -1.389351, 0, 0, 1, 1, 1,
-0.5405561, 0.5636874, 0.4685149, 1, 0, 0, 1, 1,
-0.5391545, 0.3602508, -3.31736, 1, 0, 0, 1, 1,
-0.5384686, -0.4934904, -0.7852913, 1, 0, 0, 1, 1,
-0.5367002, -0.6213492, -2.908627, 1, 0, 0, 1, 1,
-0.5328321, -0.1887239, -1.433905, 1, 0, 0, 1, 1,
-0.5293752, 0.5838584, -1.460613, 0, 0, 0, 1, 1,
-0.5245401, -0.9269291, -1.841581, 0, 0, 0, 1, 1,
-0.5232373, 0.1340817, -1.49068, 0, 0, 0, 1, 1,
-0.5214954, -0.4571323, -4.045631, 0, 0, 0, 1, 1,
-0.5214653, -0.3991567, -2.190014, 0, 0, 0, 1, 1,
-0.518662, 2.12851, 1.110927, 0, 0, 0, 1, 1,
-0.5129002, -0.2712733, -2.665531, 0, 0, 0, 1, 1,
-0.5030842, -1.195378, -2.598952, 1, 1, 1, 1, 1,
-0.5006952, -0.02031256, -1.772427, 1, 1, 1, 1, 1,
-0.4970748, 0.4550379, -0.06147816, 1, 1, 1, 1, 1,
-0.4890059, 0.5889303, -0.1791489, 1, 1, 1, 1, 1,
-0.4873273, -0.2295287, -2.486665, 1, 1, 1, 1, 1,
-0.4854357, 2.426658, 2.679691, 1, 1, 1, 1, 1,
-0.4818891, -1.532727, -2.368277, 1, 1, 1, 1, 1,
-0.4786481, -0.6185225, -2.015972, 1, 1, 1, 1, 1,
-0.4743846, 0.2325295, -1.12999, 1, 1, 1, 1, 1,
-0.4731455, 0.6927761, -0.2196124, 1, 1, 1, 1, 1,
-0.4718675, -0.4612914, -2.729264, 1, 1, 1, 1, 1,
-0.4709544, 0.2505082, -0.7609871, 1, 1, 1, 1, 1,
-0.4681906, -0.1611431, 0.27149, 1, 1, 1, 1, 1,
-0.467999, -0.2277158, -3.612111, 1, 1, 1, 1, 1,
-0.4652973, -0.9914994, -3.047435, 1, 1, 1, 1, 1,
-0.4650265, 0.2623574, 0.6754353, 0, 0, 1, 1, 1,
-0.4631897, 0.3346477, -2.877222, 1, 0, 0, 1, 1,
-0.4601215, -0.1920705, -2.343953, 1, 0, 0, 1, 1,
-0.4575929, -0.1345346, 0.4761829, 1, 0, 0, 1, 1,
-0.4528101, -1.28827, -1.208578, 1, 0, 0, 1, 1,
-0.4516164, -0.2068239, -3.116458, 1, 0, 0, 1, 1,
-0.4505424, -0.1926361, -1.017604, 0, 0, 0, 1, 1,
-0.4492537, 0.9552245, -0.7085541, 0, 0, 0, 1, 1,
-0.4462507, 1.425866, 1.316185, 0, 0, 0, 1, 1,
-0.4459843, 0.2838579, -0.2696333, 0, 0, 0, 1, 1,
-0.4377141, -0.02786914, -3.219389, 0, 0, 0, 1, 1,
-0.4301308, 0.5966045, -1.954696, 0, 0, 0, 1, 1,
-0.4293544, -0.1771779, -3.259629, 0, 0, 0, 1, 1,
-0.4244234, -1.780495, -3.409957, 1, 1, 1, 1, 1,
-0.4200512, -0.1335642, -1.922302, 1, 1, 1, 1, 1,
-0.4191037, 1.317852, 0.01693564, 1, 1, 1, 1, 1,
-0.4152977, -1.113324, -2.885284, 1, 1, 1, 1, 1,
-0.4119061, -0.3437168, -3.011432, 1, 1, 1, 1, 1,
-0.4099554, -0.9738981, -1.683813, 1, 1, 1, 1, 1,
-0.4042438, 0.8270947, -1.239095, 1, 1, 1, 1, 1,
-0.39777, 1.535166, 0.7378687, 1, 1, 1, 1, 1,
-0.392902, 0.02402207, -1.535858, 1, 1, 1, 1, 1,
-0.3903443, 0.2312464, 0.3783821, 1, 1, 1, 1, 1,
-0.3881586, 0.841123, -1.337195, 1, 1, 1, 1, 1,
-0.3843488, -0.1854559, -1.361959, 1, 1, 1, 1, 1,
-0.3821352, 0.2378903, -0.2643072, 1, 1, 1, 1, 1,
-0.3820759, 0.07179736, -1.313343, 1, 1, 1, 1, 1,
-0.3798615, -1.014235, -3.663627, 1, 1, 1, 1, 1,
-0.3768107, 1.288406, -0.002184716, 0, 0, 1, 1, 1,
-0.3763964, -1.078595, -4.604717, 1, 0, 0, 1, 1,
-0.3637321, 1.200536, -1.387756, 1, 0, 0, 1, 1,
-0.3628394, 0.284405, -2.717903, 1, 0, 0, 1, 1,
-0.3581179, -1.392475, -3.770907, 1, 0, 0, 1, 1,
-0.3574252, -0.2763133, -2.718658, 1, 0, 0, 1, 1,
-0.355011, 1.573411, 0.9762347, 0, 0, 0, 1, 1,
-0.3489647, 0.7311266, -0.4747123, 0, 0, 0, 1, 1,
-0.3479784, -1.749918, -2.611359, 0, 0, 0, 1, 1,
-0.3471144, 0.8888747, -1.595564, 0, 0, 0, 1, 1,
-0.3469428, -1.06989, -2.743825, 0, 0, 0, 1, 1,
-0.3452588, 1.680873, -2.275822, 0, 0, 0, 1, 1,
-0.3434862, -0.9426172, -2.151949, 0, 0, 0, 1, 1,
-0.3391947, 1.895916, 0.8677058, 1, 1, 1, 1, 1,
-0.3389927, 0.6218306, 0.4832016, 1, 1, 1, 1, 1,
-0.3377376, 1.012116, -0.6297288, 1, 1, 1, 1, 1,
-0.3359339, 0.2885864, 1.079707, 1, 1, 1, 1, 1,
-0.3334959, 0.7221954, -0.5135412, 1, 1, 1, 1, 1,
-0.3315484, 2.119771, 0.1615041, 1, 1, 1, 1, 1,
-0.3296943, 1.656172, 0.2448506, 1, 1, 1, 1, 1,
-0.3294619, -1.444299, -2.0022, 1, 1, 1, 1, 1,
-0.3224539, 0.7741653, -1.864592, 1, 1, 1, 1, 1,
-0.3221836, 0.7632468, 0.4172858, 1, 1, 1, 1, 1,
-0.3211981, 0.2042649, -0.8904615, 1, 1, 1, 1, 1,
-0.3198187, 0.4043601, -0.7707235, 1, 1, 1, 1, 1,
-0.3076241, 2.443981, -0.1239398, 1, 1, 1, 1, 1,
-0.3040996, 0.5150803, -1.154781, 1, 1, 1, 1, 1,
-0.3020362, -2.134182, -3.926178, 1, 1, 1, 1, 1,
-0.2995791, -0.5521861, -3.055447, 0, 0, 1, 1, 1,
-0.2977809, 0.7387456, -0.8416533, 1, 0, 0, 1, 1,
-0.2968353, -0.7201795, -2.37034, 1, 0, 0, 1, 1,
-0.2945542, 2.039281, -1.605006, 1, 0, 0, 1, 1,
-0.2943581, -0.4066579, -3.477658, 1, 0, 0, 1, 1,
-0.2914741, -0.07518796, -2.137053, 1, 0, 0, 1, 1,
-0.28956, -1.531675, -3.194141, 0, 0, 0, 1, 1,
-0.2872432, -1.835278, -1.885618, 0, 0, 0, 1, 1,
-0.2868975, -0.7627749, -3.921991, 0, 0, 0, 1, 1,
-0.2842559, 0.1297237, -0.7458715, 0, 0, 0, 1, 1,
-0.282272, 0.7165748, -1.093335, 0, 0, 0, 1, 1,
-0.2812382, -1.029839, -1.802242, 0, 0, 0, 1, 1,
-0.2781512, 0.3007322, -1.524277, 0, 0, 0, 1, 1,
-0.2760189, -0.7220203, -2.599015, 1, 1, 1, 1, 1,
-0.2698563, 0.05648702, -3.131151, 1, 1, 1, 1, 1,
-0.266661, -0.8763556, -2.606489, 1, 1, 1, 1, 1,
-0.2634461, 2.226372, -0.1236152, 1, 1, 1, 1, 1,
-0.2626363, -1.450484, -3.29169, 1, 1, 1, 1, 1,
-0.2564227, 0.5174044, 0.1342633, 1, 1, 1, 1, 1,
-0.2546551, 0.1444137, -0.3365954, 1, 1, 1, 1, 1,
-0.2474528, -0.2177055, -2.131648, 1, 1, 1, 1, 1,
-0.237774, 0.633253, -0.5565166, 1, 1, 1, 1, 1,
-0.2377071, 0.6175266, 0.6723972, 1, 1, 1, 1, 1,
-0.2350124, 0.09647407, -1.635885, 1, 1, 1, 1, 1,
-0.2286456, -0.9594283, -2.754151, 1, 1, 1, 1, 1,
-0.2277911, -1.136558, -3.795298, 1, 1, 1, 1, 1,
-0.2206735, -0.2388111, -1.977779, 1, 1, 1, 1, 1,
-0.2188276, 1.289058, -0.6620232, 1, 1, 1, 1, 1,
-0.2163249, 1.297659, 0.2811526, 0, 0, 1, 1, 1,
-0.2120884, 0.6292265, -0.1182401, 1, 0, 0, 1, 1,
-0.2079863, -0.2765834, -2.012963, 1, 0, 0, 1, 1,
-0.2033128, 0.7213791, 0.1883171, 1, 0, 0, 1, 1,
-0.2021027, 1.52652, 0.9876852, 1, 0, 0, 1, 1,
-0.2017967, 0.01347601, -0.06816906, 1, 0, 0, 1, 1,
-0.2003044, -0.2232519, -1.304327, 0, 0, 0, 1, 1,
-0.1950508, -0.7668042, -2.776602, 0, 0, 0, 1, 1,
-0.1892224, 0.3119231, -0.4595577, 0, 0, 0, 1, 1,
-0.1883097, -1.367283, -3.20676, 0, 0, 0, 1, 1,
-0.1871438, 0.1590648, 0.9119198, 0, 0, 0, 1, 1,
-0.1817016, 0.660621, -0.2122345, 0, 0, 0, 1, 1,
-0.1807386, -0.3249521, -3.554494, 0, 0, 0, 1, 1,
-0.1707445, -1.683239, -3.329878, 1, 1, 1, 1, 1,
-0.1677631, 0.4933994, 0.655889, 1, 1, 1, 1, 1,
-0.1674343, -0.7429395, -2.893382, 1, 1, 1, 1, 1,
-0.164447, -1.488487, -2.126558, 1, 1, 1, 1, 1,
-0.1641158, 0.9084347, -0.01351844, 1, 1, 1, 1, 1,
-0.1589129, 0.365262, -0.6468476, 1, 1, 1, 1, 1,
-0.1584686, 0.2533168, -1.885915, 1, 1, 1, 1, 1,
-0.1578611, -0.4615371, -4.376087, 1, 1, 1, 1, 1,
-0.1516892, -1.438535, -4.876092, 1, 1, 1, 1, 1,
-0.1497541, -1.071154, -2.118872, 1, 1, 1, 1, 1,
-0.1423109, 0.06268197, 0.5087954, 1, 1, 1, 1, 1,
-0.1407166, -2.039306, -3.477059, 1, 1, 1, 1, 1,
-0.1383463, 1.155407, -0.1873628, 1, 1, 1, 1, 1,
-0.1360366, -2.461266, -3.887475, 1, 1, 1, 1, 1,
-0.1344515, -2.616048, -3.865956, 1, 1, 1, 1, 1,
-0.130743, 0.7592558, 0.8147559, 0, 0, 1, 1, 1,
-0.1306127, -0.07669455, -1.632802, 1, 0, 0, 1, 1,
-0.1222356, 0.67985, 0.03241286, 1, 0, 0, 1, 1,
-0.1220542, -1.410797, -3.294854, 1, 0, 0, 1, 1,
-0.1218228, -1.523323, -3.688948, 1, 0, 0, 1, 1,
-0.1212632, 1.459471, 1.394704, 1, 0, 0, 1, 1,
-0.1206295, -1.570144, -3.527083, 0, 0, 0, 1, 1,
-0.1197512, 1.159637, -0.284519, 0, 0, 0, 1, 1,
-0.1182529, -0.542002, -1.292413, 0, 0, 0, 1, 1,
-0.1176407, 0.1314096, 0.0235979, 0, 0, 0, 1, 1,
-0.1169363, -0.9509195, -2.838215, 0, 0, 0, 1, 1,
-0.1133989, 0.5153503, -0.300191, 0, 0, 0, 1, 1,
-0.1130121, -1.465865, -4.792543, 0, 0, 0, 1, 1,
-0.1127976, -1.735281, -3.706268, 1, 1, 1, 1, 1,
-0.1123161, 0.4066229, -0.4996263, 1, 1, 1, 1, 1,
-0.1110895, 0.6742936, -1.403715, 1, 1, 1, 1, 1,
-0.1110476, 0.2614866, -1.175937, 1, 1, 1, 1, 1,
-0.1001044, 0.09845755, -1.055147, 1, 1, 1, 1, 1,
-0.09977742, -1.066572, -2.636107, 1, 1, 1, 1, 1,
-0.097875, -0.650763, -2.69633, 1, 1, 1, 1, 1,
-0.09561397, 0.1025922, -0.5816661, 1, 1, 1, 1, 1,
-0.09373744, 0.4965362, 0.2700928, 1, 1, 1, 1, 1,
-0.08749582, 1.474757, -0.4460137, 1, 1, 1, 1, 1,
-0.08165575, -0.7458768, -3.512854, 1, 1, 1, 1, 1,
-0.08104976, 0.1826354, -1.193138, 1, 1, 1, 1, 1,
-0.07754686, 0.8017505, -0.8798397, 1, 1, 1, 1, 1,
-0.07642027, 0.8305476, -1.022174, 1, 1, 1, 1, 1,
-0.07541874, 0.8562839, -1.499519, 1, 1, 1, 1, 1,
-0.0718644, 0.5752386, -0.2879722, 0, 0, 1, 1, 1,
-0.07084879, 0.2165966, -1.61034, 1, 0, 0, 1, 1,
-0.06789616, -0.8695456, -2.443042, 1, 0, 0, 1, 1,
-0.06729387, 0.4277787, -0.4991559, 1, 0, 0, 1, 1,
-0.06370811, 0.9178109, 0.3977341, 1, 0, 0, 1, 1,
-0.05667263, 0.3727084, -1.431312, 1, 0, 0, 1, 1,
-0.0555594, 0.9568965, -0.2882731, 0, 0, 0, 1, 1,
-0.05482846, 1.836983, -0.8086122, 0, 0, 0, 1, 1,
-0.05347639, -0.7222391, -2.633409, 0, 0, 0, 1, 1,
-0.05130391, 0.1127623, -0.7921599, 0, 0, 0, 1, 1,
-0.04703514, -0.3642079, -1.44326, 0, 0, 0, 1, 1,
-0.03998815, 1.035708, 0.5160205, 0, 0, 0, 1, 1,
-0.03400978, 0.7660059, -0.2473444, 0, 0, 0, 1, 1,
-0.02905713, -0.5115527, -4.102761, 1, 1, 1, 1, 1,
-0.02656691, 1.115561, 0.6777369, 1, 1, 1, 1, 1,
-0.02490658, 0.2909172, 0.7231371, 1, 1, 1, 1, 1,
-0.02467071, 0.7196384, 0.4559106, 1, 1, 1, 1, 1,
-0.02264923, 0.7301986, 0.653323, 1, 1, 1, 1, 1,
-0.01946625, -0.6469988, -3.573227, 1, 1, 1, 1, 1,
-0.01740357, -0.4067503, -3.049637, 1, 1, 1, 1, 1,
-0.01493176, -1.59987, -3.821003, 1, 1, 1, 1, 1,
-0.0002167664, -1.928906, -3.798445, 1, 1, 1, 1, 1,
0.0002949052, 0.305376, 1.333606, 1, 1, 1, 1, 1,
0.001869529, 0.4408424, -0.7018997, 1, 1, 1, 1, 1,
0.003294684, -0.7331366, 2.605074, 1, 1, 1, 1, 1,
0.008571066, 1.222666, 0.9790261, 1, 1, 1, 1, 1,
0.01078806, -0.7286075, 3.838938, 1, 1, 1, 1, 1,
0.01572482, 0.08587371, -0.1251737, 1, 1, 1, 1, 1,
0.01900622, 0.6760758, 2.394257, 0, 0, 1, 1, 1,
0.02362322, 0.1302397, -2.201266, 1, 0, 0, 1, 1,
0.02584713, -0.2508299, 3.481006, 1, 0, 0, 1, 1,
0.02674047, -0.8848063, 3.667889, 1, 0, 0, 1, 1,
0.02756641, -0.7170582, 2.27619, 1, 0, 0, 1, 1,
0.02823847, -0.8019837, 3.843986, 1, 0, 0, 1, 1,
0.02869999, -0.8990706, 3.426451, 0, 0, 0, 1, 1,
0.02881983, -0.964811, 1.238275, 0, 0, 0, 1, 1,
0.03177786, 1.060241, 0.5486723, 0, 0, 0, 1, 1,
0.03220999, 0.843865, -1.22942, 0, 0, 0, 1, 1,
0.03411811, 2.787337, -0.16006, 0, 0, 0, 1, 1,
0.03492708, -0.8155189, 3.393242, 0, 0, 0, 1, 1,
0.0357895, -1.195634, 3.869576, 0, 0, 0, 1, 1,
0.03940778, -0.3530628, 3.568991, 1, 1, 1, 1, 1,
0.04044867, -0.2788669, 3.360931, 1, 1, 1, 1, 1,
0.04346072, 0.7757921, -0.7757797, 1, 1, 1, 1, 1,
0.04351617, 0.6977122, -1.781579, 1, 1, 1, 1, 1,
0.0456447, 1.452308, -0.5431851, 1, 1, 1, 1, 1,
0.0483232, -0.9036802, 3.529629, 1, 1, 1, 1, 1,
0.05084346, 0.3080156, 1.211379, 1, 1, 1, 1, 1,
0.05150359, 0.527465, -0.09797514, 1, 1, 1, 1, 1,
0.05319412, -0.9055933, 3.69186, 1, 1, 1, 1, 1,
0.05983465, 0.04862091, 1.730168, 1, 1, 1, 1, 1,
0.06511492, 0.2759396, 0.3826354, 1, 1, 1, 1, 1,
0.06615841, -1.074101, 3.529956, 1, 1, 1, 1, 1,
0.06778972, -1.39502, 3.770645, 1, 1, 1, 1, 1,
0.06811996, -0.9156902, 3.054895, 1, 1, 1, 1, 1,
0.07128658, -0.6565703, 2.579237, 1, 1, 1, 1, 1,
0.07455058, 0.00669745, 1.693511, 0, 0, 1, 1, 1,
0.07642891, -2.045414, 4.300835, 1, 0, 0, 1, 1,
0.08052315, -1.13567, 0.9275663, 1, 0, 0, 1, 1,
0.08335711, 1.752259, 0.3726993, 1, 0, 0, 1, 1,
0.0862834, -0.523802, 2.199365, 1, 0, 0, 1, 1,
0.08654778, -1.796897, 4.108241, 1, 0, 0, 1, 1,
0.08680035, 0.8186101, 0.6207409, 0, 0, 0, 1, 1,
0.08876186, 1.433514, -0.05935679, 0, 0, 0, 1, 1,
0.09073871, -0.3541814, 3.070131, 0, 0, 0, 1, 1,
0.09360689, -0.05097599, 3.316312, 0, 0, 0, 1, 1,
0.09405227, -0.4792165, 1.745869, 0, 0, 0, 1, 1,
0.09629763, 0.3516982, -0.7893333, 0, 0, 0, 1, 1,
0.09697249, -1.234454, 3.686118, 0, 0, 0, 1, 1,
0.09740397, -1.481706, 3.424744, 1, 1, 1, 1, 1,
0.1012355, -0.1135464, 2.233526, 1, 1, 1, 1, 1,
0.1013942, -0.2307894, 3.809803, 1, 1, 1, 1, 1,
0.102869, 2.485013, -0.9955083, 1, 1, 1, 1, 1,
0.1093719, 0.8095558, 0.1192277, 1, 1, 1, 1, 1,
0.1103923, -0.3634564, 3.18581, 1, 1, 1, 1, 1,
0.1127323, 0.3142923, -1.467427, 1, 1, 1, 1, 1,
0.1147576, 0.3258198, 1.814353, 1, 1, 1, 1, 1,
0.1192241, -0.1223096, 2.204258, 1, 1, 1, 1, 1,
0.1217368, 0.2669227, 0.4761366, 1, 1, 1, 1, 1,
0.1272572, 0.2250978, 0.7346889, 1, 1, 1, 1, 1,
0.1300012, 0.5893892, -0.4871345, 1, 1, 1, 1, 1,
0.1356632, -1.361605, 3.96021, 1, 1, 1, 1, 1,
0.136379, -0.7167274, 4.112641, 1, 1, 1, 1, 1,
0.1456011, -0.5504763, 3.064545, 1, 1, 1, 1, 1,
0.1467738, -1.972382, 3.124248, 0, 0, 1, 1, 1,
0.1478469, 2.665219, -0.2381724, 1, 0, 0, 1, 1,
0.1540479, -1.022, 1.892586, 1, 0, 0, 1, 1,
0.1571819, 0.5575705, 0.514625, 1, 0, 0, 1, 1,
0.1626178, -1.269394, 1.890856, 1, 0, 0, 1, 1,
0.1635261, -0.06888791, 2.305898, 1, 0, 0, 1, 1,
0.1732719, 0.289136, -0.3251981, 0, 0, 0, 1, 1,
0.1782398, -0.51623, 3.160413, 0, 0, 0, 1, 1,
0.1806598, 0.6301749, 1.525002, 0, 0, 0, 1, 1,
0.1813946, 0.7069273, -0.2549495, 0, 0, 0, 1, 1,
0.1820406, 0.6617754, 0.1026562, 0, 0, 0, 1, 1,
0.1842498, -0.1005801, 2.664466, 0, 0, 0, 1, 1,
0.1843235, -0.1263112, 1.702152, 0, 0, 0, 1, 1,
0.1846638, -1.227249, 2.622181, 1, 1, 1, 1, 1,
0.1875219, 1.776401, 1.866499, 1, 1, 1, 1, 1,
0.1884863, -0.4505392, 3.137927, 1, 1, 1, 1, 1,
0.1927279, 0.03140759, 1.918556, 1, 1, 1, 1, 1,
0.1928054, -0.4380411, 1.44578, 1, 1, 1, 1, 1,
0.198356, 2.334226, 0.480349, 1, 1, 1, 1, 1,
0.19843, -0.7622283, 3.799586, 1, 1, 1, 1, 1,
0.1999772, 0.7951567, 0.2576714, 1, 1, 1, 1, 1,
0.2031417, 0.1712738, 0.750802, 1, 1, 1, 1, 1,
0.2031842, -1.090407, 2.674192, 1, 1, 1, 1, 1,
0.2040602, 0.07395732, 2.148296, 1, 1, 1, 1, 1,
0.2055202, 0.9572965, 0.7470542, 1, 1, 1, 1, 1,
0.2092564, 2.477092, 0.04392847, 1, 1, 1, 1, 1,
0.2140123, -1.072157, 2.525451, 1, 1, 1, 1, 1,
0.2170508, 0.4806753, 0.9109042, 1, 1, 1, 1, 1,
0.2188257, -0.2218599, 1.929401, 0, 0, 1, 1, 1,
0.2234002, -1.234484, 3.639127, 1, 0, 0, 1, 1,
0.2297301, -2.087747, 3.917885, 1, 0, 0, 1, 1,
0.2303809, 0.2110307, 0.1696196, 1, 0, 0, 1, 1,
0.2318838, 1.086405, -1.010408, 1, 0, 0, 1, 1,
0.2320793, -0.2607838, 1.188564, 1, 0, 0, 1, 1,
0.2342108, 0.0689196, 1.264831, 0, 0, 0, 1, 1,
0.2350446, 1.702013, 0.945617, 0, 0, 0, 1, 1,
0.2350879, -0.9157203, 3.162178, 0, 0, 0, 1, 1,
0.2359449, 0.7214316, 0.08631686, 0, 0, 0, 1, 1,
0.2417259, -0.364283, 2.413344, 0, 0, 0, 1, 1,
0.2427892, 0.6417041, 1.989061, 0, 0, 0, 1, 1,
0.2473773, -2.860796, 3.523375, 0, 0, 0, 1, 1,
0.2481375, -0.9758856, 2.34296, 1, 1, 1, 1, 1,
0.250053, 1.284457, -0.3539443, 1, 1, 1, 1, 1,
0.2530687, 2.820863, 0.405843, 1, 1, 1, 1, 1,
0.2571896, 2.001366, -1.385636, 1, 1, 1, 1, 1,
0.2577772, -1.264611, 0.106557, 1, 1, 1, 1, 1,
0.2580142, 0.6934392, 1.466998, 1, 1, 1, 1, 1,
0.2586001, -1.471527, 3.804461, 1, 1, 1, 1, 1,
0.2603335, 1.172129, -0.800199, 1, 1, 1, 1, 1,
0.2633367, 0.6315309, 0.2890081, 1, 1, 1, 1, 1,
0.2653171, 0.4061995, -1.054547, 1, 1, 1, 1, 1,
0.2656069, 1.065102, -0.9050522, 1, 1, 1, 1, 1,
0.266713, -1.908335, 2.034078, 1, 1, 1, 1, 1,
0.2677946, -2.138317, 3.292021, 1, 1, 1, 1, 1,
0.2678196, 0.5768638, 0.8652412, 1, 1, 1, 1, 1,
0.2683962, 0.8185374, -1.559859, 1, 1, 1, 1, 1,
0.2685057, 0.08038543, 2.023665, 0, 0, 1, 1, 1,
0.270404, 1.23424, -0.1903026, 1, 0, 0, 1, 1,
0.271034, -0.9341801, 2.983616, 1, 0, 0, 1, 1,
0.2720012, 0.2084729, 0.8448592, 1, 0, 0, 1, 1,
0.2834096, -0.3215542, 4.46967, 1, 0, 0, 1, 1,
0.2847194, 0.7444362, 1.47025, 1, 0, 0, 1, 1,
0.284889, 0.239419, 1.004284, 0, 0, 0, 1, 1,
0.2851102, 2.345184, 0.0248864, 0, 0, 0, 1, 1,
0.2885046, -1.666687, 2.562778, 0, 0, 0, 1, 1,
0.290988, 0.3950161, 2.102687, 0, 0, 0, 1, 1,
0.2920538, 0.02640757, 1.758569, 0, 0, 0, 1, 1,
0.2925777, -0.4523711, 0.9648866, 0, 0, 0, 1, 1,
0.2952335, 0.1977062, -0.03454468, 0, 0, 0, 1, 1,
0.2973014, 1.024488, -0.8884749, 1, 1, 1, 1, 1,
0.2991987, -0.406423, 1.969119, 1, 1, 1, 1, 1,
0.303851, -0.1023651, 3.34042, 1, 1, 1, 1, 1,
0.3051256, -0.4759986, 2.107917, 1, 1, 1, 1, 1,
0.309339, 0.3838644, 1.593128, 1, 1, 1, 1, 1,
0.3101129, 0.3677074, -0.7486264, 1, 1, 1, 1, 1,
0.3105556, 1.711077, -0.5228969, 1, 1, 1, 1, 1,
0.313304, -0.4411414, 3.320047, 1, 1, 1, 1, 1,
0.3147999, -1.026219, 4.01771, 1, 1, 1, 1, 1,
0.3157275, 0.5301439, 1.05824, 1, 1, 1, 1, 1,
0.3253667, -1.023999, 3.692365, 1, 1, 1, 1, 1,
0.3277136, 0.1205415, 2.110746, 1, 1, 1, 1, 1,
0.3290249, -0.3420868, 2.152192, 1, 1, 1, 1, 1,
0.3363268, -0.121973, 1.227765, 1, 1, 1, 1, 1,
0.3368384, 0.5340613, 0.6316381, 1, 1, 1, 1, 1,
0.3390857, -0.666456, 1.540245, 0, 0, 1, 1, 1,
0.3437873, -2.271295, 3.824502, 1, 0, 0, 1, 1,
0.3440903, 0.1414877, 0.5778219, 1, 0, 0, 1, 1,
0.3450443, -0.0739088, 1.830274, 1, 0, 0, 1, 1,
0.3469023, 0.6846032, 1.55897, 1, 0, 0, 1, 1,
0.3469443, -0.6811169, 2.520497, 1, 0, 0, 1, 1,
0.349475, 0.5706049, 1.069199, 0, 0, 0, 1, 1,
0.349662, 1.194811, -0.08552474, 0, 0, 0, 1, 1,
0.3511656, -0.2186427, 2.300135, 0, 0, 0, 1, 1,
0.3552547, -1.107823, 2.939264, 0, 0, 0, 1, 1,
0.3585278, -1.333418, 2.27691, 0, 0, 0, 1, 1,
0.3606254, 1.954028, -1.01406, 0, 0, 0, 1, 1,
0.3624485, -1.585744, 2.414236, 0, 0, 0, 1, 1,
0.3641727, -0.8567417, 3.939792, 1, 1, 1, 1, 1,
0.3647207, 0.3772242, 1.274751, 1, 1, 1, 1, 1,
0.3668969, 0.03383661, 1.512256, 1, 1, 1, 1, 1,
0.36792, 0.2670991, -0.05529615, 1, 1, 1, 1, 1,
0.3689699, 2.045287, 1.216301, 1, 1, 1, 1, 1,
0.3695312, 1.490277, 0.08481438, 1, 1, 1, 1, 1,
0.3725902, 1.433297, 0.1641004, 1, 1, 1, 1, 1,
0.3759367, -0.19871, 2.885759, 1, 1, 1, 1, 1,
0.3780362, -0.7336256, 2.660552, 1, 1, 1, 1, 1,
0.3800897, 0.4178247, 1.218249, 1, 1, 1, 1, 1,
0.3810247, -0.4211248, 2.000301, 1, 1, 1, 1, 1,
0.3960353, -0.3709476, 1.57627, 1, 1, 1, 1, 1,
0.4023078, -0.077319, 2.294066, 1, 1, 1, 1, 1,
0.4081437, 0.4046801, 0.9080216, 1, 1, 1, 1, 1,
0.4081719, -0.180627, 0.7845101, 1, 1, 1, 1, 1,
0.4112679, 1.326841, 0.08856482, 0, 0, 1, 1, 1,
0.4227436, -0.01117327, 2.365229, 1, 0, 0, 1, 1,
0.4235328, 0.1722069, 0.5793616, 1, 0, 0, 1, 1,
0.4296533, -1.697417, 3.239149, 1, 0, 0, 1, 1,
0.433848, 0.2912016, 2.560571, 1, 0, 0, 1, 1,
0.4344659, -1.604847, 4.284243, 1, 0, 0, 1, 1,
0.4350623, -1.326493, 3.932706, 0, 0, 0, 1, 1,
0.441153, -2.155439, 1.928329, 0, 0, 0, 1, 1,
0.4438525, -0.4775293, 3.501235, 0, 0, 0, 1, 1,
0.4474227, -0.07032627, 2.640931, 0, 0, 0, 1, 1,
0.4486926, 0.9764415, 0.06949738, 0, 0, 0, 1, 1,
0.449091, 0.170502, 0.7170784, 0, 0, 0, 1, 1,
0.4546779, 0.7903924, 0.2440624, 0, 0, 0, 1, 1,
0.4555509, 0.5746686, 0.9754856, 1, 1, 1, 1, 1,
0.4604482, 2.383569, 0.8069442, 1, 1, 1, 1, 1,
0.4609763, 0.9809529, 0.5367673, 1, 1, 1, 1, 1,
0.4622503, 0.808916, -0.5068939, 1, 1, 1, 1, 1,
0.4658596, -0.4899636, 1.301001, 1, 1, 1, 1, 1,
0.4750891, 0.9550408, -1.356941, 1, 1, 1, 1, 1,
0.4753136, 1.614933, -0.04852556, 1, 1, 1, 1, 1,
0.4836789, -0.7787029, 3.612688, 1, 1, 1, 1, 1,
0.4951486, 0.8131714, 1.072664, 1, 1, 1, 1, 1,
0.4967291, -0.7327668, 2.851308, 1, 1, 1, 1, 1,
0.4999676, -0.01691824, 2.355075, 1, 1, 1, 1, 1,
0.5036167, -0.7017348, 3.370093, 1, 1, 1, 1, 1,
0.5052491, 1.99962, 1.476539, 1, 1, 1, 1, 1,
0.5055453, 0.1356915, -0.1859844, 1, 1, 1, 1, 1,
0.5185459, 0.7235915, -0.4349355, 1, 1, 1, 1, 1,
0.5197171, -1.915033, 2.732178, 0, 0, 1, 1, 1,
0.5200279, 0.3418724, 0.1844171, 1, 0, 0, 1, 1,
0.5221836, -0.7104753, 3.490796, 1, 0, 0, 1, 1,
0.5286373, 0.6159137, 0.8108404, 1, 0, 0, 1, 1,
0.5296066, -1.154921, 2.745566, 1, 0, 0, 1, 1,
0.5315809, -0.7548417, 3.79879, 1, 0, 0, 1, 1,
0.5382026, -1.513558, 2.711924, 0, 0, 0, 1, 1,
0.5407187, 0.1513318, 0.8793074, 0, 0, 0, 1, 1,
0.5429634, 1.147027, -1.810001, 0, 0, 0, 1, 1,
0.5440074, 0.1883722, 0.9369295, 0, 0, 0, 1, 1,
0.5450668, -1.433827, 2.933729, 0, 0, 0, 1, 1,
0.5504169, 0.1086256, 2.183829, 0, 0, 0, 1, 1,
0.5551715, -1.746848, 2.483178, 0, 0, 0, 1, 1,
0.5591303, -0.4736409, 1.77627, 1, 1, 1, 1, 1,
0.5605826, -0.5269782, 2.328511, 1, 1, 1, 1, 1,
0.5624201, -0.7557149, 3.109818, 1, 1, 1, 1, 1,
0.5635951, -1.989831, 1.659249, 1, 1, 1, 1, 1,
0.5684062, -0.4959868, 0.7999694, 1, 1, 1, 1, 1,
0.5725366, -0.4989877, 2.544128, 1, 1, 1, 1, 1,
0.5766026, -1.649872, 2.779407, 1, 1, 1, 1, 1,
0.5795481, -0.3860358, 3.363231, 1, 1, 1, 1, 1,
0.580778, 0.3815039, 1.701592, 1, 1, 1, 1, 1,
0.5829731, -0.01676779, 1.876645, 1, 1, 1, 1, 1,
0.5834606, -0.5551614, 2.577585, 1, 1, 1, 1, 1,
0.5845907, 1.325204, -2.480921, 1, 1, 1, 1, 1,
0.5846272, -0.6606137, 1.823223, 1, 1, 1, 1, 1,
0.5906269, -0.1687766, 1.186128, 1, 1, 1, 1, 1,
0.5923693, 0.2016861, 0.3519102, 1, 1, 1, 1, 1,
0.5930871, -1.34677, 3.356077, 0, 0, 1, 1, 1,
0.5940266, -0.3388087, 1.396588, 1, 0, 0, 1, 1,
0.5963358, 0.5144386, 2.284863, 1, 0, 0, 1, 1,
0.5974438, 0.9187127, 0.1956111, 1, 0, 0, 1, 1,
0.6042695, -0.5587676, 1.58053, 1, 0, 0, 1, 1,
0.611368, -1.788821, 3.404057, 1, 0, 0, 1, 1,
0.6121126, -0.8192659, 3.70428, 0, 0, 0, 1, 1,
0.6129865, 0.02624504, 2.801985, 0, 0, 0, 1, 1,
0.6146804, -0.4005083, 1.970536, 0, 0, 0, 1, 1,
0.6200934, 1.70533, -0.38348, 0, 0, 0, 1, 1,
0.6229194, 0.7096483, 0.06732732, 0, 0, 0, 1, 1,
0.6282256, 1.325068, 1.285711, 0, 0, 0, 1, 1,
0.6313503, 0.003316372, 0.0736457, 0, 0, 0, 1, 1,
0.633988, -1.24402, 2.382676, 1, 1, 1, 1, 1,
0.6342191, -1.858693, 1.876218, 1, 1, 1, 1, 1,
0.6352357, -0.5822586, 2.92573, 1, 1, 1, 1, 1,
0.6368226, 1.510421, 0.4620696, 1, 1, 1, 1, 1,
0.6388164, -1.227057, 2.139088, 1, 1, 1, 1, 1,
0.639061, -0.6163285, 1.983689, 1, 1, 1, 1, 1,
0.6399682, 0.1159475, 2.252768, 1, 1, 1, 1, 1,
0.6404563, 0.5743768, 1.233341, 1, 1, 1, 1, 1,
0.6449586, 0.3037133, 0.8114641, 1, 1, 1, 1, 1,
0.6454463, -0.6464173, 2.833008, 1, 1, 1, 1, 1,
0.6482109, 0.1193479, 0.3296983, 1, 1, 1, 1, 1,
0.6560819, -0.2687451, 2.851781, 1, 1, 1, 1, 1,
0.6614577, -0.4703569, 1.165086, 1, 1, 1, 1, 1,
0.6645858, -0.7110205, 0.3989193, 1, 1, 1, 1, 1,
0.6689193, -1.768946, 2.45958, 1, 1, 1, 1, 1,
0.6765764, -0.6889349, 2.660105, 0, 0, 1, 1, 1,
0.678073, -0.5723588, 2.579946, 1, 0, 0, 1, 1,
0.6787979, 0.1500613, -0.001527132, 1, 0, 0, 1, 1,
0.6798879, 1.616453, 1.47607, 1, 0, 0, 1, 1,
0.6892881, -1.099494, 4.768874, 1, 0, 0, 1, 1,
0.6945524, 1.162959, 1.182739, 1, 0, 0, 1, 1,
0.6970201, 0.7392479, 1.452024, 0, 0, 0, 1, 1,
0.6970627, 0.09837464, 2.182013, 0, 0, 0, 1, 1,
0.6988328, -0.1829379, 1.104146, 0, 0, 0, 1, 1,
0.7053767, 0.6505164, -0.1538348, 0, 0, 0, 1, 1,
0.7060574, -0.1370141, 2.001005, 0, 0, 0, 1, 1,
0.7099216, -1.106585, 2.14353, 0, 0, 0, 1, 1,
0.7144299, -0.03605157, -0.3337924, 0, 0, 0, 1, 1,
0.7165689, -1.105749, 2.853556, 1, 1, 1, 1, 1,
0.7194262, -0.8257499, 3.100934, 1, 1, 1, 1, 1,
0.7245431, 0.05869661, 2.192516, 1, 1, 1, 1, 1,
0.7279778, 0.0657243, 1.119655, 1, 1, 1, 1, 1,
0.730419, -0.6362938, 1.102452, 1, 1, 1, 1, 1,
0.7314904, -0.5876334, 2.799886, 1, 1, 1, 1, 1,
0.7315308, 0.5748668, 2.162754, 1, 1, 1, 1, 1,
0.7370328, 0.8882346, 1.256961, 1, 1, 1, 1, 1,
0.7507935, -1.591137, 2.726695, 1, 1, 1, 1, 1,
0.7526242, -0.3040753, 0.9492784, 1, 1, 1, 1, 1,
0.7548335, -0.2514821, 3.095573, 1, 1, 1, 1, 1,
0.754976, 1.806472, 2.246245, 1, 1, 1, 1, 1,
0.7556453, 0.8338438, -0.7766986, 1, 1, 1, 1, 1,
0.7583574, 0.5531254, 1.182099, 1, 1, 1, 1, 1,
0.7600069, -0.3810132, 2.494591, 1, 1, 1, 1, 1,
0.7641202, 0.4593388, 1.465715, 0, 0, 1, 1, 1,
0.7671913, 1.325398, 1.553616, 1, 0, 0, 1, 1,
0.7677391, 0.866328, 1.797255, 1, 0, 0, 1, 1,
0.7715482, 0.4255538, 0.07346351, 1, 0, 0, 1, 1,
0.773922, -0.6372812, 2.567346, 1, 0, 0, 1, 1,
0.7834455, -0.118259, 1.094047, 1, 0, 0, 1, 1,
0.793568, 1.031276, 2.014429, 0, 0, 0, 1, 1,
0.7943549, 1.389496, 0.5536029, 0, 0, 0, 1, 1,
0.7959448, 0.1600354, 1.594199, 0, 0, 0, 1, 1,
0.7999886, 0.6727183, 1.743675, 0, 0, 0, 1, 1,
0.8058521, -1.874795, 4.586744, 0, 0, 0, 1, 1,
0.8081155, 1.7668, 0.6328804, 0, 0, 0, 1, 1,
0.8084018, 0.5258464, 0.4181697, 0, 0, 0, 1, 1,
0.809509, 0.2179909, 0.4896353, 1, 1, 1, 1, 1,
0.8115454, -0.5482621, 1.912556, 1, 1, 1, 1, 1,
0.8166731, -0.622598, 1.648682, 1, 1, 1, 1, 1,
0.8176066, -0.4985498, 1.385039, 1, 1, 1, 1, 1,
0.8185824, -0.2828221, 1.458124, 1, 1, 1, 1, 1,
0.819412, -2.017354, 3.111237, 1, 1, 1, 1, 1,
0.8199971, -0.8481758, 1.81345, 1, 1, 1, 1, 1,
0.822448, -0.2670627, 0.9680135, 1, 1, 1, 1, 1,
0.8226292, -0.5650932, 1.969555, 1, 1, 1, 1, 1,
0.8266837, 0.02537582, 0.9058913, 1, 1, 1, 1, 1,
0.8269201, -1.181921, 1.85629, 1, 1, 1, 1, 1,
0.8306427, 0.2902233, 2.9204, 1, 1, 1, 1, 1,
0.836125, 0.9026178, 0.1179939, 1, 1, 1, 1, 1,
0.8385261, -0.4142147, 3.60629, 1, 1, 1, 1, 1,
0.8397999, -0.2205207, 0.9196532, 1, 1, 1, 1, 1,
0.8443449, 0.06068099, 0.7591943, 0, 0, 1, 1, 1,
0.8503156, -1.855415, 0.9255606, 1, 0, 0, 1, 1,
0.8508771, -0.4849993, 2.782924, 1, 0, 0, 1, 1,
0.8570855, 1.53569, -0.6848779, 1, 0, 0, 1, 1,
0.8573776, -1.154843, 4.802965, 1, 0, 0, 1, 1,
0.8683441, 1.756631, -0.02598021, 1, 0, 0, 1, 1,
0.8690497, -1.773638, 2.716197, 0, 0, 0, 1, 1,
0.8753495, -2.240147, 3.381157, 0, 0, 0, 1, 1,
0.8774903, -0.1390978, 1.476502, 0, 0, 0, 1, 1,
0.8799089, 0.4708233, 0.3821279, 0, 0, 0, 1, 1,
0.8815909, 1.182572, 1.302602, 0, 0, 0, 1, 1,
0.8852627, -0.008080759, 0.7645866, 0, 0, 0, 1, 1,
0.8891363, 0.3114414, 1.819303, 0, 0, 0, 1, 1,
0.8911244, -0.3993012, 2.401377, 1, 1, 1, 1, 1,
0.8914657, 0.4552207, 1.992047, 1, 1, 1, 1, 1,
0.8922014, 1.846313, 0.1961466, 1, 1, 1, 1, 1,
0.8956876, 0.4001197, 2.925667, 1, 1, 1, 1, 1,
0.8990294, 2.14132, -0.1002291, 1, 1, 1, 1, 1,
0.916975, -0.5305156, 1.411414, 1, 1, 1, 1, 1,
0.9173993, -0.545406, 3.032137, 1, 1, 1, 1, 1,
0.9186105, -0.6023341, 2.982084, 1, 1, 1, 1, 1,
0.9254543, -1.519332, 2.845221, 1, 1, 1, 1, 1,
0.9284183, 1.579568, -0.5643387, 1, 1, 1, 1, 1,
0.9478028, 0.02521351, 2.604958, 1, 1, 1, 1, 1,
0.9498577, 1.63965, 0.692394, 1, 1, 1, 1, 1,
0.9524285, -0.3829181, 0.9347863, 1, 1, 1, 1, 1,
0.970116, -0.8193053, 2.296365, 1, 1, 1, 1, 1,
0.9721158, -0.4422011, 1.032894, 1, 1, 1, 1, 1,
0.9849926, -0.2183102, 1.532313, 0, 0, 1, 1, 1,
0.9920279, 0.5096432, 1.17782, 1, 0, 0, 1, 1,
0.9949458, -0.4746651, 1.344643, 1, 0, 0, 1, 1,
0.99496, 0.8526754, 1.421893, 1, 0, 0, 1, 1,
1.001032, 0.05547111, 4.367541, 1, 0, 0, 1, 1,
1.002177, -0.4082873, 1.118746, 1, 0, 0, 1, 1,
1.006018, -0.2841913, 0.6772346, 0, 0, 0, 1, 1,
1.008406, -0.6857123, 3.254419, 0, 0, 0, 1, 1,
1.017794, -0.4713361, 2.339377, 0, 0, 0, 1, 1,
1.018661, -0.3976405, 1.408898, 0, 0, 0, 1, 1,
1.02216, 0.1052194, 1.020003, 0, 0, 0, 1, 1,
1.029587, 0.3793936, 1.823384, 0, 0, 0, 1, 1,
1.033669, 0.1007238, -0.03064611, 0, 0, 0, 1, 1,
1.034128, -0.1777679, 3.051373, 1, 1, 1, 1, 1,
1.038976, 0.3807742, 0.2761039, 1, 1, 1, 1, 1,
1.047851, 0.2620361, 1.062057, 1, 1, 1, 1, 1,
1.052142, -0.06220571, 2.186301, 1, 1, 1, 1, 1,
1.053716, 0.141361, 4.045247, 1, 1, 1, 1, 1,
1.056291, -0.5012962, -0.44304, 1, 1, 1, 1, 1,
1.05786, 0.2130066, 1.328223, 1, 1, 1, 1, 1,
1.067107, -0.704062, 2.102615, 1, 1, 1, 1, 1,
1.071418, 2.309931, 2.021216, 1, 1, 1, 1, 1,
1.081381, 0.3229318, 1.609302, 1, 1, 1, 1, 1,
1.088075, -0.3017853, -0.3067023, 1, 1, 1, 1, 1,
1.098286, -1.343607, 2.468698, 1, 1, 1, 1, 1,
1.098691, -0.4717128, 0.5871376, 1, 1, 1, 1, 1,
1.102271, -1.472034, 1.810431, 1, 1, 1, 1, 1,
1.104561, -1.0048, 2.228402, 1, 1, 1, 1, 1,
1.106843, -2.543644, 4.469171, 0, 0, 1, 1, 1,
1.108329, 0.9830595, 0.2048113, 1, 0, 0, 1, 1,
1.108545, -0.2688031, 0.7978792, 1, 0, 0, 1, 1,
1.113809, -0.8773275, 2.775832, 1, 0, 0, 1, 1,
1.119971, -2.082821, 2.781593, 1, 0, 0, 1, 1,
1.139709, -0.9183677, 2.947256, 1, 0, 0, 1, 1,
1.140349, -0.02921167, 0.9271606, 0, 0, 0, 1, 1,
1.140845, -0.2307578, 2.341119, 0, 0, 0, 1, 1,
1.144112, 0.2692196, 5.179761, 0, 0, 0, 1, 1,
1.146049, 0.8408933, 1.194228, 0, 0, 0, 1, 1,
1.146109, -0.2205092, 2.820288, 0, 0, 0, 1, 1,
1.150634, 1.171918, 1.087341, 0, 0, 0, 1, 1,
1.150841, -0.8429381, 2.481336, 0, 0, 0, 1, 1,
1.156179, 0.8890835, 1.491416, 1, 1, 1, 1, 1,
1.166169, -0.0366151, 2.217574, 1, 1, 1, 1, 1,
1.17612, 1.283213, 0.4089834, 1, 1, 1, 1, 1,
1.177747, -1.484965, 3.119458, 1, 1, 1, 1, 1,
1.180088, 0.3881446, 1.913455, 1, 1, 1, 1, 1,
1.187388, 0.1957169, 1.271419, 1, 1, 1, 1, 1,
1.192182, -0.5841562, 2.384985, 1, 1, 1, 1, 1,
1.192206, -0.06525934, 0.2396518, 1, 1, 1, 1, 1,
1.201259, 0.4671041, 1.747287, 1, 1, 1, 1, 1,
1.213112, -0.1034431, 1.307749, 1, 1, 1, 1, 1,
1.216302, 0.8433623, 0.582819, 1, 1, 1, 1, 1,
1.219526, -0.7493185, 1.306864, 1, 1, 1, 1, 1,
1.219937, -0.9155582, 2.957865, 1, 1, 1, 1, 1,
1.236355, 0.617245, -0.7936087, 1, 1, 1, 1, 1,
1.239307, 1.146287, 0.8133475, 1, 1, 1, 1, 1,
1.242277, 1.233585, 0.6167577, 0, 0, 1, 1, 1,
1.244991, -1.029656, 1.799983, 1, 0, 0, 1, 1,
1.246936, -0.1435134, 1.543044, 1, 0, 0, 1, 1,
1.269088, 0.3527009, -1.465572, 1, 0, 0, 1, 1,
1.270595, 0.1726216, 0.7231939, 1, 0, 0, 1, 1,
1.280076, -0.9456708, 0.6925153, 1, 0, 0, 1, 1,
1.281875, 2.022303, -0.4557897, 0, 0, 0, 1, 1,
1.298571, 0.8758622, 1.495553, 0, 0, 0, 1, 1,
1.299195, -1.036877, 2.587109, 0, 0, 0, 1, 1,
1.300297, -1.367788, 1.543005, 0, 0, 0, 1, 1,
1.302674, -0.2290302, 2.149753, 0, 0, 0, 1, 1,
1.315971, 0.00655929, 3.617109, 0, 0, 0, 1, 1,
1.32729, 0.4571054, 1.227369, 0, 0, 0, 1, 1,
1.328613, -1.674629, 3.499485, 1, 1, 1, 1, 1,
1.328942, 0.7446232, 0.1555673, 1, 1, 1, 1, 1,
1.331499, 1.333348, 0.009651738, 1, 1, 1, 1, 1,
1.333494, -0.2626048, 1.301042, 1, 1, 1, 1, 1,
1.353196, 0.6805497, 1.675022, 1, 1, 1, 1, 1,
1.357283, 0.06963737, 1.328288, 1, 1, 1, 1, 1,
1.363823, 0.9517033, 1.635171, 1, 1, 1, 1, 1,
1.371398, 0.377969, 0.5256364, 1, 1, 1, 1, 1,
1.374571, 2.092166, -1.105819, 1, 1, 1, 1, 1,
1.380539, 1.804868, -0.02127309, 1, 1, 1, 1, 1,
1.383245, -0.0917708, 1.259713, 1, 1, 1, 1, 1,
1.385195, -2.765072, 1.628448, 1, 1, 1, 1, 1,
1.389579, -1.137725, 2.161644, 1, 1, 1, 1, 1,
1.390563, 0.4282647, -0.9426541, 1, 1, 1, 1, 1,
1.391564, -1.382478, 2.866632, 1, 1, 1, 1, 1,
1.401439, 2.396496, 2.675102, 0, 0, 1, 1, 1,
1.404103, 0.8099434, -0.1139782, 1, 0, 0, 1, 1,
1.409721, 0.8110188, 1.925243, 1, 0, 0, 1, 1,
1.411673, -2.224394, 2.569884, 1, 0, 0, 1, 1,
1.417543, -1.692505, 3.169788, 1, 0, 0, 1, 1,
1.419197, 2.810359, -0.7902061, 1, 0, 0, 1, 1,
1.423812, 0.6376357, 1.176176, 0, 0, 0, 1, 1,
1.424091, -1.098813, 2.697191, 0, 0, 0, 1, 1,
1.425827, -0.1801813, 2.895064, 0, 0, 0, 1, 1,
1.428168, 0.242843, 1.108614, 0, 0, 0, 1, 1,
1.430643, -0.6613742, 1.465993, 0, 0, 0, 1, 1,
1.431803, -0.5044405, 2.4886, 0, 0, 0, 1, 1,
1.43397, 0.2655837, 2.442328, 0, 0, 0, 1, 1,
1.438989, -0.3847335, 1.666947, 1, 1, 1, 1, 1,
1.440526, -0.9541036, 0.4096134, 1, 1, 1, 1, 1,
1.446406, -0.464779, 3.031971, 1, 1, 1, 1, 1,
1.453632, 0.2285322, 2.792287, 1, 1, 1, 1, 1,
1.469962, -1.334976, 1.75773, 1, 1, 1, 1, 1,
1.472612, -1.060616, 1.267892, 1, 1, 1, 1, 1,
1.473414, -2.081735, 2.811264, 1, 1, 1, 1, 1,
1.477466, -0.6766255, 2.205909, 1, 1, 1, 1, 1,
1.480764, -0.7319427, 1.77281, 1, 1, 1, 1, 1,
1.48689, -0.7090011, 3.203293, 1, 1, 1, 1, 1,
1.48767, -1.575899, 3.37402, 1, 1, 1, 1, 1,
1.49126, 1.748235, 2.331444, 1, 1, 1, 1, 1,
1.499324, -1.315361, 1.084769, 1, 1, 1, 1, 1,
1.503658, -0.8531845, 1.717492, 1, 1, 1, 1, 1,
1.516093, -0.6146126, 2.964271, 1, 1, 1, 1, 1,
1.517719, -0.6228422, 2.853204, 0, 0, 1, 1, 1,
1.526146, 0.0942436, 0.5654961, 1, 0, 0, 1, 1,
1.52711, -1.093939, 2.953224, 1, 0, 0, 1, 1,
1.530834, -1.589333, 2.761443, 1, 0, 0, 1, 1,
1.546396, 0.1714051, -0.2416527, 1, 0, 0, 1, 1,
1.547845, -0.8427015, 2.517323, 1, 0, 0, 1, 1,
1.549648, -0.1194894, 1.508688, 0, 0, 0, 1, 1,
1.556484, -1.134808, 1.964527, 0, 0, 0, 1, 1,
1.557157, -0.5723022, 1.093161, 0, 0, 0, 1, 1,
1.558124, -0.9169798, 0.8039736, 0, 0, 0, 1, 1,
1.565831, -0.05108656, 1.789244, 0, 0, 0, 1, 1,
1.579888, -1.139639, 2.35987, 0, 0, 0, 1, 1,
1.595298, -1.129254, 1.358053, 0, 0, 0, 1, 1,
1.630605, -0.2247081, 2.720906, 1, 1, 1, 1, 1,
1.63177, 2.381561, 0.6059683, 1, 1, 1, 1, 1,
1.636335, 0.2014008, 1.970927, 1, 1, 1, 1, 1,
1.640083, 1.969233, 1.140389, 1, 1, 1, 1, 1,
1.641512, 0.7197043, 2.329375, 1, 1, 1, 1, 1,
1.648221, 1.153042, -0.1969707, 1, 1, 1, 1, 1,
1.6502, -0.6369014, 2.893975, 1, 1, 1, 1, 1,
1.656033, -0.1405, 2.297551, 1, 1, 1, 1, 1,
1.674859, -0.4289249, 1.693205, 1, 1, 1, 1, 1,
1.676092, 1.272456, 1.307791, 1, 1, 1, 1, 1,
1.725959, -1.284412, 2.036099, 1, 1, 1, 1, 1,
1.726726, -0.4532706, 0.1019559, 1, 1, 1, 1, 1,
1.728499, 0.2768062, 0.7654551, 1, 1, 1, 1, 1,
1.733841, 0.0684649, 1.326197, 1, 1, 1, 1, 1,
1.744437, -0.4673763, 0.8586363, 1, 1, 1, 1, 1,
1.745079, -2.938086, 3.381392, 0, 0, 1, 1, 1,
1.75417, 0.239226, -1.611007, 1, 0, 0, 1, 1,
1.783656, 0.3524638, 0.8465336, 1, 0, 0, 1, 1,
1.785276, -0.2756821, 2.339234, 1, 0, 0, 1, 1,
1.787874, 1.701634, -1.356378, 1, 0, 0, 1, 1,
1.807845, -0.3942501, 2.76255, 1, 0, 0, 1, 1,
1.810384, 1.120156, 0.8303637, 0, 0, 0, 1, 1,
1.834952, 0.3927352, -0.3703174, 0, 0, 0, 1, 1,
1.844499, -0.4200751, -0.2391041, 0, 0, 0, 1, 1,
1.85657, -0.7466981, 2.754233, 0, 0, 0, 1, 1,
1.876482, -1.484831, 2.201185, 0, 0, 0, 1, 1,
1.888886, -0.7953163, 2.185212, 0, 0, 0, 1, 1,
1.891241, 0.07626418, 0.8124042, 0, 0, 0, 1, 1,
1.903975, 0.1165903, 1.249042, 1, 1, 1, 1, 1,
1.905335, 0.06079479, 0.1113325, 1, 1, 1, 1, 1,
1.916757, 0.9920391, 0.8946353, 1, 1, 1, 1, 1,
1.951188, -0.195902, 0.1387795, 1, 1, 1, 1, 1,
1.958057, 0.8595738, 2.137847, 1, 1, 1, 1, 1,
1.972025, -0.7683473, 1.775997, 1, 1, 1, 1, 1,
1.972114, -0.6239492, 1.105108, 1, 1, 1, 1, 1,
1.984839, 0.6592106, 2.246922, 1, 1, 1, 1, 1,
1.987416, -0.9738594, 3.160269, 1, 1, 1, 1, 1,
1.991905, -0.7373224, 2.744832, 1, 1, 1, 1, 1,
1.99821, -1.219195, 1.879228, 1, 1, 1, 1, 1,
2.002421, 0.2067325, 1.440096, 1, 1, 1, 1, 1,
2.020906, -0.8746399, 1.91573, 1, 1, 1, 1, 1,
2.029884, 0.2823418, 2.486114, 1, 1, 1, 1, 1,
2.057938, -0.6300136, 1.640542, 1, 1, 1, 1, 1,
2.119533, -0.5350593, 1.046428, 0, 0, 1, 1, 1,
2.119603, -1.178939, 2.7652, 1, 0, 0, 1, 1,
2.13171, -0.2058201, 3.055684, 1, 0, 0, 1, 1,
2.131759, -2.018734, 3.749943, 1, 0, 0, 1, 1,
2.143888, 0.5233487, 1.399389, 1, 0, 0, 1, 1,
2.165, -1.517571, 3.759108, 1, 0, 0, 1, 1,
2.196135, 0.04006562, 1.173657, 0, 0, 0, 1, 1,
2.213412, 0.2333734, 1.742673, 0, 0, 0, 1, 1,
2.218025, 0.6517028, -0.6076873, 0, 0, 0, 1, 1,
2.252926, 0.5845514, 1.95219, 0, 0, 0, 1, 1,
2.385092, 0.5620286, 0.7453126, 0, 0, 0, 1, 1,
2.388905, 0.2712548, 1.883764, 0, 0, 0, 1, 1,
2.463457, 0.8767104, 0.8207277, 0, 0, 0, 1, 1,
2.491682, -0.8984374, 1.665738, 1, 1, 1, 1, 1,
2.500891, 1.012869, 0.8755659, 1, 1, 1, 1, 1,
2.591782, 1.05502, -0.2994181, 1, 1, 1, 1, 1,
3.131993, 0.6473818, -0.5060366, 1, 1, 1, 1, 1,
3.622014, 2.060983, 0.7128454, 1, 1, 1, 1, 1,
3.826703, 0.8972167, 1.139559, 1, 1, 1, 1, 1,
4.068077, -0.1999784, 1.914099, 1, 1, 1, 1, 1
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
var radius = 9.263188;
var distance = 32.53656;
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
mvMatrix.translate( -0.6489848, 0.05861127, -0.1518347 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.53656);
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
