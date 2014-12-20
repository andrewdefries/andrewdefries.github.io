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
-3.257855, 0.03631053, -1.514401, 1, 0, 0, 1,
-3.052276, 0.8220291, -1.455378, 1, 0.007843138, 0, 1,
-2.873502, 0.2120101, -1.373007, 1, 0.01176471, 0, 1,
-2.793397, -0.4747047, -0.04994757, 1, 0.01960784, 0, 1,
-2.770799, 0.6817125, -1.933094, 1, 0.02352941, 0, 1,
-2.751021, -2.36943, -2.094266, 1, 0.03137255, 0, 1,
-2.648123, 2.929964, -1.406105, 1, 0.03529412, 0, 1,
-2.553646, 0.958555, -2.931327, 1, 0.04313726, 0, 1,
-2.497731, -0.8058945, -2.996572, 1, 0.04705882, 0, 1,
-2.466832, 0.6165571, -0.1356378, 1, 0.05490196, 0, 1,
-2.457692, 0.7502652, -0.9809026, 1, 0.05882353, 0, 1,
-2.270287, 0.06944264, -2.441313, 1, 0.06666667, 0, 1,
-2.255439, 0.01264873, -2.402002, 1, 0.07058824, 0, 1,
-2.246547, 1.507287, -1.238488, 1, 0.07843138, 0, 1,
-2.215864, -1.234416, -1.628102, 1, 0.08235294, 0, 1,
-2.197316, 0.6436481, -1.475098, 1, 0.09019608, 0, 1,
-2.182026, 0.1838187, -2.985263, 1, 0.09411765, 0, 1,
-2.175781, -0.1784068, -1.782378, 1, 0.1019608, 0, 1,
-2.171124, -0.6370528, -1.041361, 1, 0.1098039, 0, 1,
-2.153543, -0.8999065, -2.488101, 1, 0.1137255, 0, 1,
-2.141855, -0.1473064, -0.03018385, 1, 0.1215686, 0, 1,
-2.141354, -0.6646638, -1.05922, 1, 0.1254902, 0, 1,
-2.125714, 2.684123, -1.768805, 1, 0.1333333, 0, 1,
-2.11776, 0.1057232, -2.00777, 1, 0.1372549, 0, 1,
-2.095919, 0.1942181, -0.5822224, 1, 0.145098, 0, 1,
-2.000437, 0.09343062, -0.768696, 1, 0.1490196, 0, 1,
-1.999156, -0.8334422, -1.437511, 1, 0.1568628, 0, 1,
-1.981378, 3.120575, -0.9831008, 1, 0.1607843, 0, 1,
-1.953535, 1.21051, -0.6476026, 1, 0.1686275, 0, 1,
-1.935623, -0.2191537, -2.073768, 1, 0.172549, 0, 1,
-1.916289, -1.680563, -1.496878, 1, 0.1803922, 0, 1,
-1.90558, -1.051947, -2.779664, 1, 0.1843137, 0, 1,
-1.861206, -1.554825, -2.699155, 1, 0.1921569, 0, 1,
-1.850124, -1.049896, -2.723538, 1, 0.1960784, 0, 1,
-1.841073, 1.780636, -1.319712, 1, 0.2039216, 0, 1,
-1.826335, 0.7767873, -1.717082, 1, 0.2117647, 0, 1,
-1.812972, 1.038861, -2.568016, 1, 0.2156863, 0, 1,
-1.801336, -1.525489, -1.566937, 1, 0.2235294, 0, 1,
-1.794186, -0.3309208, -3.445551, 1, 0.227451, 0, 1,
-1.77335, -0.7856846, 0.7379255, 1, 0.2352941, 0, 1,
-1.767653, 0.3554945, -3.537383, 1, 0.2392157, 0, 1,
-1.744867, 0.2019604, -1.534575, 1, 0.2470588, 0, 1,
-1.731002, -0.03457708, -0.5692635, 1, 0.2509804, 0, 1,
-1.720621, 0.7035336, -0.7473885, 1, 0.2588235, 0, 1,
-1.707069, -1.350161, -0.913464, 1, 0.2627451, 0, 1,
-1.699764, 0.07043923, -2.593196, 1, 0.2705882, 0, 1,
-1.694418, -0.01525169, -0.6807079, 1, 0.2745098, 0, 1,
-1.682446, 0.1487497, -2.664976, 1, 0.282353, 0, 1,
-1.653592, 0.6372262, -0.5703079, 1, 0.2862745, 0, 1,
-1.649479, -1.824022, -1.78151, 1, 0.2941177, 0, 1,
-1.639972, -1.260274, 0.3584717, 1, 0.3019608, 0, 1,
-1.63957, -0.5502716, -1.540673, 1, 0.3058824, 0, 1,
-1.636577, 0.03097294, -0.4288312, 1, 0.3137255, 0, 1,
-1.620027, -0.1067946, 0.2572056, 1, 0.3176471, 0, 1,
-1.611547, -0.1583287, -3.19249, 1, 0.3254902, 0, 1,
-1.607791, 0.6768283, -0.8967908, 1, 0.3294118, 0, 1,
-1.587551, 1.965224, -0.01583285, 1, 0.3372549, 0, 1,
-1.562121, -1.203019, -1.876974, 1, 0.3411765, 0, 1,
-1.561906, -0.1985308, -0.9214829, 1, 0.3490196, 0, 1,
-1.549785, -1.265989, -1.761914, 1, 0.3529412, 0, 1,
-1.547787, -1.493784, -1.005096, 1, 0.3607843, 0, 1,
-1.547528, -0.591483, -4.125439, 1, 0.3647059, 0, 1,
-1.544548, -0.2170258, -3.34031, 1, 0.372549, 0, 1,
-1.542812, 0.3947938, -1.727634, 1, 0.3764706, 0, 1,
-1.540089, 0.8132583, -2.388332, 1, 0.3843137, 0, 1,
-1.537395, 1.946505, -0.7200564, 1, 0.3882353, 0, 1,
-1.532057, -0.02349317, -4.061381, 1, 0.3960784, 0, 1,
-1.499012, -2.154051, -1.234103, 1, 0.4039216, 0, 1,
-1.485034, -0.101011, -3.334806, 1, 0.4078431, 0, 1,
-1.477052, 0.006771612, -2.20579, 1, 0.4156863, 0, 1,
-1.472873, -0.1980515, -2.058322, 1, 0.4196078, 0, 1,
-1.466926, 1.09212, -0.8934318, 1, 0.427451, 0, 1,
-1.462775, -1.300686, -1.021579, 1, 0.4313726, 0, 1,
-1.445002, -0.3700565, -3.313013, 1, 0.4392157, 0, 1,
-1.404316, 0.4427194, -1.477252, 1, 0.4431373, 0, 1,
-1.397227, -1.43696, -5.014158, 1, 0.4509804, 0, 1,
-1.380867, 1.888904, 0.9461076, 1, 0.454902, 0, 1,
-1.362908, -0.008797236, -0.6704391, 1, 0.4627451, 0, 1,
-1.360837, 1.854886, 0.007954855, 1, 0.4666667, 0, 1,
-1.350219, -0.3259012, -2.962745, 1, 0.4745098, 0, 1,
-1.346624, -0.6326194, -3.321447, 1, 0.4784314, 0, 1,
-1.345343, 1.543263, -1.108647, 1, 0.4862745, 0, 1,
-1.344167, 0.1129594, -0.01601147, 1, 0.4901961, 0, 1,
-1.341533, -0.6476596, -1.604344, 1, 0.4980392, 0, 1,
-1.339202, -0.6190169, -1.684615, 1, 0.5058824, 0, 1,
-1.332094, -1.730475, -3.368618, 1, 0.509804, 0, 1,
-1.325974, 1.09812, -0.2939909, 1, 0.5176471, 0, 1,
-1.320993, 0.6658925, -0.8224133, 1, 0.5215687, 0, 1,
-1.318389, 0.04889014, -1.018883, 1, 0.5294118, 0, 1,
-1.315807, 0.2456596, -1.905137, 1, 0.5333334, 0, 1,
-1.313291, -0.1154363, -1.259871, 1, 0.5411765, 0, 1,
-1.301083, -0.3601585, -3.293275, 1, 0.5450981, 0, 1,
-1.295212, 0.3533471, -0.6160292, 1, 0.5529412, 0, 1,
-1.288165, -0.6840914, -3.042536, 1, 0.5568628, 0, 1,
-1.287058, -0.4416811, -2.521041, 1, 0.5647059, 0, 1,
-1.284325, 0.5646397, -3.180151, 1, 0.5686275, 0, 1,
-1.27507, -0.3426105, -2.028244, 1, 0.5764706, 0, 1,
-1.274822, 0.1849454, -2.541341, 1, 0.5803922, 0, 1,
-1.26589, 0.236185, -1.264562, 1, 0.5882353, 0, 1,
-1.265015, 0.6108652, 0.3558305, 1, 0.5921569, 0, 1,
-1.256677, 2.214659, 0.2464145, 1, 0.6, 0, 1,
-1.249848, 0.6373172, -1.789821, 1, 0.6078432, 0, 1,
-1.236739, -0.5175709, -2.243209, 1, 0.6117647, 0, 1,
-1.233743, 0.5299228, 0.06270403, 1, 0.6196079, 0, 1,
-1.225785, 0.04805804, -0.9584669, 1, 0.6235294, 0, 1,
-1.221016, 1.58994, -0.5025567, 1, 0.6313726, 0, 1,
-1.2136, 0.8133618, -1.064648, 1, 0.6352941, 0, 1,
-1.203239, -0.3736049, -0.2092821, 1, 0.6431373, 0, 1,
-1.196223, -1.167684, -3.075327, 1, 0.6470588, 0, 1,
-1.19183, 0.3891663, -1.913272, 1, 0.654902, 0, 1,
-1.190871, -1.494253, -3.640649, 1, 0.6588235, 0, 1,
-1.189668, -2.603989, -1.47841, 1, 0.6666667, 0, 1,
-1.188953, 0.5060157, -1.965505, 1, 0.6705883, 0, 1,
-1.183199, -0.578679, -1.883351, 1, 0.6784314, 0, 1,
-1.179903, 0.1336146, -1.164658, 1, 0.682353, 0, 1,
-1.1787, -0.3104456, -1.854844, 1, 0.6901961, 0, 1,
-1.172338, 1.48338, 0.219111, 1, 0.6941177, 0, 1,
-1.167768, -0.05328727, -1.140691, 1, 0.7019608, 0, 1,
-1.155689, 0.3182331, -1.066972, 1, 0.7098039, 0, 1,
-1.151638, -0.5431698, -3.325991, 1, 0.7137255, 0, 1,
-1.151549, 0.3409024, -0.567223, 1, 0.7215686, 0, 1,
-1.151409, -1.349579, -5.344785, 1, 0.7254902, 0, 1,
-1.148028, -0.26147, -1.997292, 1, 0.7333333, 0, 1,
-1.139948, 0.7885848, -1.229325, 1, 0.7372549, 0, 1,
-1.13458, 0.9673235, -0.5915295, 1, 0.7450981, 0, 1,
-1.13289, 0.6678494, -1.190657, 1, 0.7490196, 0, 1,
-1.125499, -1.220625, -2.567841, 1, 0.7568628, 0, 1,
-1.120391, -1.860324, -1.735179, 1, 0.7607843, 0, 1,
-1.118725, 0.1660209, -1.128222, 1, 0.7686275, 0, 1,
-1.118037, 0.9154724, -2.234789, 1, 0.772549, 0, 1,
-1.116246, 1.563737, 0.5209122, 1, 0.7803922, 0, 1,
-1.111577, -0.6632333, -1.216619, 1, 0.7843137, 0, 1,
-1.10666, 0.3530976, -1.50092, 1, 0.7921569, 0, 1,
-1.104964, 0.3618257, -0.8478125, 1, 0.7960784, 0, 1,
-1.081571, 1.160568, 0.4511037, 1, 0.8039216, 0, 1,
-1.076954, -2.319356, -2.447672, 1, 0.8117647, 0, 1,
-1.070348, -0.9994549, -1.985713, 1, 0.8156863, 0, 1,
-1.06293, 0.1276023, -2.902283, 1, 0.8235294, 0, 1,
-1.053243, 0.1037823, -1.089232, 1, 0.827451, 0, 1,
-1.050689, 0.006116322, -1.846718, 1, 0.8352941, 0, 1,
-1.050145, -0.01116815, -1.897169, 1, 0.8392157, 0, 1,
-1.046376, 0.7099739, 0.6095976, 1, 0.8470588, 0, 1,
-1.046204, 1.088536, -1.760125, 1, 0.8509804, 0, 1,
-1.044129, 1.90627, -0.1121541, 1, 0.8588235, 0, 1,
-1.02986, 0.5784613, -2.873622, 1, 0.8627451, 0, 1,
-1.029685, -1.905883, -2.38015, 1, 0.8705882, 0, 1,
-1.026471, 2.110491, -0.1906061, 1, 0.8745098, 0, 1,
-1.025095, 0.03115938, -1.721477, 1, 0.8823529, 0, 1,
-1.007004, -0.4877976, -3.266302, 1, 0.8862745, 0, 1,
-1.004076, -0.7882604, -1.518694, 1, 0.8941177, 0, 1,
-1.000009, -2.246661, -2.230182, 1, 0.8980392, 0, 1,
-0.9996299, -1.048377, -0.1707798, 1, 0.9058824, 0, 1,
-0.9899344, 1.588739, -1.360195, 1, 0.9137255, 0, 1,
-0.9847733, -0.3412175, -1.684597, 1, 0.9176471, 0, 1,
-0.9837275, -0.7508636, -2.258232, 1, 0.9254902, 0, 1,
-0.9810356, -0.4325769, -0.08330716, 1, 0.9294118, 0, 1,
-0.9802011, -1.939786, -4.249854, 1, 0.9372549, 0, 1,
-0.9632666, 1.119357, 0.07856055, 1, 0.9411765, 0, 1,
-0.9626973, -1.194106, -2.678094, 1, 0.9490196, 0, 1,
-0.9615486, -0.07733911, -0.2792006, 1, 0.9529412, 0, 1,
-0.9498229, 0.411151, -0.3589531, 1, 0.9607843, 0, 1,
-0.9467517, -0.5620047, -2.251889, 1, 0.9647059, 0, 1,
-0.9437557, -0.04364987, -1.159028, 1, 0.972549, 0, 1,
-0.9433365, 1.325644, -0.6358067, 1, 0.9764706, 0, 1,
-0.9354631, 0.6338334, -1.133431, 1, 0.9843137, 0, 1,
-0.9326097, -0.4308875, -3.177706, 1, 0.9882353, 0, 1,
-0.9321349, 0.4675796, -2.412989, 1, 0.9960784, 0, 1,
-0.9316697, 1.352023, 0.7246407, 0.9960784, 1, 0, 1,
-0.9222897, -0.06699761, -1.015631, 0.9921569, 1, 0, 1,
-0.9175946, -0.8038636, -0.9211347, 0.9843137, 1, 0, 1,
-0.9086936, 0.2164858, -1.30714, 0.9803922, 1, 0, 1,
-0.905095, -1.220632, -1.343978, 0.972549, 1, 0, 1,
-0.9040316, 0.1408998, -2.272815, 0.9686275, 1, 0, 1,
-0.9020626, 1.991729, -0.9815452, 0.9607843, 1, 0, 1,
-0.9019396, 1.818587, 1.903422, 0.9568627, 1, 0, 1,
-0.9008376, 1.197789, -1.377333, 0.9490196, 1, 0, 1,
-0.8980913, -0.5765807, -2.363206, 0.945098, 1, 0, 1,
-0.8911808, -0.6035309, -2.646867, 0.9372549, 1, 0, 1,
-0.8903611, -1.300109, -1.978943, 0.9333333, 1, 0, 1,
-0.8867667, 0.5008077, -2.297925, 0.9254902, 1, 0, 1,
-0.8857926, -0.3013515, -1.908966, 0.9215686, 1, 0, 1,
-0.8853596, -2.506888, -2.015949, 0.9137255, 1, 0, 1,
-0.8766, -0.1279984, -1.870267, 0.9098039, 1, 0, 1,
-0.8749837, -0.5749551, -3.527157, 0.9019608, 1, 0, 1,
-0.8678985, -0.9444751, -0.3578863, 0.8941177, 1, 0, 1,
-0.8569204, -0.1447029, -2.599736, 0.8901961, 1, 0, 1,
-0.8561357, 0.5895411, -1.186682, 0.8823529, 1, 0, 1,
-0.8560942, -0.3253307, -1.508542, 0.8784314, 1, 0, 1,
-0.8543601, 1.053043, -0.7818944, 0.8705882, 1, 0, 1,
-0.8479995, -0.303467, -1.529306, 0.8666667, 1, 0, 1,
-0.8448696, 1.130278, -0.9321404, 0.8588235, 1, 0, 1,
-0.8413681, -1.474521, -2.962494, 0.854902, 1, 0, 1,
-0.8380302, -1.919715, -2.982307, 0.8470588, 1, 0, 1,
-0.8337863, 2.342467, -0.5526867, 0.8431373, 1, 0, 1,
-0.8320131, -0.5385635, -2.997776, 0.8352941, 1, 0, 1,
-0.828967, -0.3657504, -2.187566, 0.8313726, 1, 0, 1,
-0.8219991, 2.743342, 1.126021, 0.8235294, 1, 0, 1,
-0.8160729, 0.7183663, -3.261149, 0.8196079, 1, 0, 1,
-0.8144274, 0.5055313, -2.148615, 0.8117647, 1, 0, 1,
-0.8133366, 1.693968, -1.704513, 0.8078431, 1, 0, 1,
-0.8080977, 0.4147601, -1.311444, 0.8, 1, 0, 1,
-0.8016391, -0.364, -1.804659, 0.7921569, 1, 0, 1,
-0.7795103, -0.6895667, -2.738896, 0.7882353, 1, 0, 1,
-0.7720835, -0.4810152, -1.593861, 0.7803922, 1, 0, 1,
-0.7715878, -0.4143075, -2.565462, 0.7764706, 1, 0, 1,
-0.7707478, -1.746963, -2.717726, 0.7686275, 1, 0, 1,
-0.7704338, -1.775803, -2.241802, 0.7647059, 1, 0, 1,
-0.7699567, -0.5927196, -2.84436, 0.7568628, 1, 0, 1,
-0.7680385, 1.510907, -2.254091, 0.7529412, 1, 0, 1,
-0.7678456, 0.1575381, -0.0426656, 0.7450981, 1, 0, 1,
-0.7652847, 0.1939677, -2.062005, 0.7411765, 1, 0, 1,
-0.7645816, -1.086057, -1.513452, 0.7333333, 1, 0, 1,
-0.7606809, -0.3702155, -0.4899659, 0.7294118, 1, 0, 1,
-0.7535089, -0.865621, -0.001057238, 0.7215686, 1, 0, 1,
-0.747113, -0.8144066, -1.885164, 0.7176471, 1, 0, 1,
-0.7454011, -0.0225664, -1.186492, 0.7098039, 1, 0, 1,
-0.7416048, 1.152361, 0.007841922, 0.7058824, 1, 0, 1,
-0.741162, 1.154305, -1.302376, 0.6980392, 1, 0, 1,
-0.7368053, -1.713611, -1.944332, 0.6901961, 1, 0, 1,
-0.7342689, 0.1764232, -0.6878716, 0.6862745, 1, 0, 1,
-0.7320979, -0.1474954, -1.959465, 0.6784314, 1, 0, 1,
-0.7277617, 0.7671685, -2.17399, 0.6745098, 1, 0, 1,
-0.7257848, -0.5797204, -1.280109, 0.6666667, 1, 0, 1,
-0.7244145, 0.5908551, 0.5239127, 0.6627451, 1, 0, 1,
-0.7126005, 0.705987, -1.584986, 0.654902, 1, 0, 1,
-0.7097992, -1.213099, -1.598495, 0.6509804, 1, 0, 1,
-0.7058454, 0.4770569, -3.840431, 0.6431373, 1, 0, 1,
-0.6980066, -0.2455919, -1.273898, 0.6392157, 1, 0, 1,
-0.696366, -0.3002014, -1.817469, 0.6313726, 1, 0, 1,
-0.6962641, 1.159158, -1.14435, 0.627451, 1, 0, 1,
-0.6884134, -1.058052, -1.693503, 0.6196079, 1, 0, 1,
-0.6879254, -1.717271, -1.826223, 0.6156863, 1, 0, 1,
-0.6823373, 1.179661, -0.7243523, 0.6078432, 1, 0, 1,
-0.6815753, -0.9609869, -2.767865, 0.6039216, 1, 0, 1,
-0.6780432, -0.9130093, -4.090018, 0.5960785, 1, 0, 1,
-0.6743098, -1.467206, -2.615242, 0.5882353, 1, 0, 1,
-0.6734908, -0.6306682, -2.89819, 0.5843138, 1, 0, 1,
-0.672163, -0.1591277, -1.7346, 0.5764706, 1, 0, 1,
-0.6685133, 0.707566, -0.6190738, 0.572549, 1, 0, 1,
-0.6662966, -1.221236, -3.459511, 0.5647059, 1, 0, 1,
-0.6624804, 0.3891824, -0.02800025, 0.5607843, 1, 0, 1,
-0.6615087, -1.533995, -3.96584, 0.5529412, 1, 0, 1,
-0.6604977, -1.734964, -3.030133, 0.5490196, 1, 0, 1,
-0.6562921, -0.3965942, -3.361663, 0.5411765, 1, 0, 1,
-0.653617, -2.208678, -4.295475, 0.5372549, 1, 0, 1,
-0.6513913, -1.453379, -3.475318, 0.5294118, 1, 0, 1,
-0.6509577, 1.404355, -0.7857308, 0.5254902, 1, 0, 1,
-0.6508815, -1.048042, -4.045557, 0.5176471, 1, 0, 1,
-0.6486681, 0.9663181, -1.014462, 0.5137255, 1, 0, 1,
-0.6478226, 1.448332, -1.523673, 0.5058824, 1, 0, 1,
-0.6456985, -0.2846119, -0.5302254, 0.5019608, 1, 0, 1,
-0.6387519, -1.698442, -1.686116, 0.4941176, 1, 0, 1,
-0.6377211, 0.667125, -0.8576922, 0.4862745, 1, 0, 1,
-0.6374927, 1.067623, -0.1233155, 0.4823529, 1, 0, 1,
-0.6366918, 0.1092031, -2.563664, 0.4745098, 1, 0, 1,
-0.6316903, 0.3734117, -2.490237, 0.4705882, 1, 0, 1,
-0.6311412, -0.3620025, -1.557193, 0.4627451, 1, 0, 1,
-0.6172791, 0.7501614, -0.153593, 0.4588235, 1, 0, 1,
-0.6156503, -0.6406935, -2.457129, 0.4509804, 1, 0, 1,
-0.6120752, -0.1777782, -2.039231, 0.4470588, 1, 0, 1,
-0.6091905, -1.220959, -0.7397968, 0.4392157, 1, 0, 1,
-0.6057213, -0.1879643, -0.1217112, 0.4352941, 1, 0, 1,
-0.6015317, 0.8484249, -1.223959, 0.427451, 1, 0, 1,
-0.6012155, -0.4472795, -3.549454, 0.4235294, 1, 0, 1,
-0.5978262, -0.2831894, -2.954576, 0.4156863, 1, 0, 1,
-0.5970508, -0.9070027, -2.61961, 0.4117647, 1, 0, 1,
-0.5961885, 0.4934501, -1.893827, 0.4039216, 1, 0, 1,
-0.5944788, -0.110508, -1.040683, 0.3960784, 1, 0, 1,
-0.5937736, 0.1523135, -0.818431, 0.3921569, 1, 0, 1,
-0.5937156, 0.9218163, 0.05223913, 0.3843137, 1, 0, 1,
-0.592113, -0.3087905, -2.102948, 0.3803922, 1, 0, 1,
-0.5856957, 0.7960808, -0.4928892, 0.372549, 1, 0, 1,
-0.580235, 0.7990567, -1.808711, 0.3686275, 1, 0, 1,
-0.5793962, 0.287994, -1.804248, 0.3607843, 1, 0, 1,
-0.5719357, -0.1435751, -1.823935, 0.3568628, 1, 0, 1,
-0.5716402, -1.102059, -2.297446, 0.3490196, 1, 0, 1,
-0.5685721, -0.415828, -0.7812021, 0.345098, 1, 0, 1,
-0.5662612, 0.3969737, -0.4336113, 0.3372549, 1, 0, 1,
-0.5661075, -1.284293, -3.117899, 0.3333333, 1, 0, 1,
-0.5649768, 1.402776, 0.4127063, 0.3254902, 1, 0, 1,
-0.5640476, 0.4368923, 0.8361604, 0.3215686, 1, 0, 1,
-0.5638741, 1.086728, -0.3480364, 0.3137255, 1, 0, 1,
-0.5634282, -0.07672204, -1.386009, 0.3098039, 1, 0, 1,
-0.5558415, 0.9715465, -1.322918, 0.3019608, 1, 0, 1,
-0.5556703, -2.138703, -2.584178, 0.2941177, 1, 0, 1,
-0.5555881, 0.05094475, -1.269927, 0.2901961, 1, 0, 1,
-0.5509483, -1.237543, -4.263194, 0.282353, 1, 0, 1,
-0.549916, 0.1749272, -0.8474637, 0.2784314, 1, 0, 1,
-0.5493052, -1.035689, -0.7343722, 0.2705882, 1, 0, 1,
-0.5467445, -0.1333136, -2.949377, 0.2666667, 1, 0, 1,
-0.5458639, 0.6239828, -1.028883, 0.2588235, 1, 0, 1,
-0.5452245, 1.798383, 0.09001047, 0.254902, 1, 0, 1,
-0.5436434, -0.7362135, -2.573146, 0.2470588, 1, 0, 1,
-0.5434394, -0.4146144, -1.841995, 0.2431373, 1, 0, 1,
-0.5418036, 0.8536996, -0.6869092, 0.2352941, 1, 0, 1,
-0.5382088, -0.6747384, -1.675636, 0.2313726, 1, 0, 1,
-0.5332716, 0.4337789, -1.798396, 0.2235294, 1, 0, 1,
-0.5156987, 0.4108602, -0.2223796, 0.2196078, 1, 0, 1,
-0.5152836, 0.3805358, 0.7376539, 0.2117647, 1, 0, 1,
-0.5144388, 0.03789047, -0.5409937, 0.2078431, 1, 0, 1,
-0.5132108, -0.4536302, -3.617416, 0.2, 1, 0, 1,
-0.5108925, 1.856197, -0.0651526, 0.1921569, 1, 0, 1,
-0.5082132, 1.46934, 2.403901, 0.1882353, 1, 0, 1,
-0.5075279, -1.025441, -3.524617, 0.1803922, 1, 0, 1,
-0.5039762, 1.417783, 0.1715447, 0.1764706, 1, 0, 1,
-0.5029196, 1.465221, -0.8326774, 0.1686275, 1, 0, 1,
-0.5017528, -1.615393, -5.957138, 0.1647059, 1, 0, 1,
-0.5015034, 0.3435312, -0.7561049, 0.1568628, 1, 0, 1,
-0.4989582, 0.5836134, 1.017224, 0.1529412, 1, 0, 1,
-0.495519, -1.228771, -4.652153, 0.145098, 1, 0, 1,
-0.4924246, 0.3511256, -1.132933, 0.1411765, 1, 0, 1,
-0.4891988, 1.649353, 0.5432593, 0.1333333, 1, 0, 1,
-0.4889869, -1.891298, -3.068166, 0.1294118, 1, 0, 1,
-0.4879592, -1.644315, -3.12935, 0.1215686, 1, 0, 1,
-0.4874125, 0.7723808, -0.6670961, 0.1176471, 1, 0, 1,
-0.4829547, 0.4397355, -1.027293, 0.1098039, 1, 0, 1,
-0.4825328, 0.4611657, -0.8473797, 0.1058824, 1, 0, 1,
-0.4823642, -0.02396773, -1.520017, 0.09803922, 1, 0, 1,
-0.4791976, 0.2959132, -1.806822, 0.09019608, 1, 0, 1,
-0.4785668, -0.2389441, -2.281127, 0.08627451, 1, 0, 1,
-0.4749036, 1.361774, 0.4131078, 0.07843138, 1, 0, 1,
-0.4738532, 0.7420618, 0.2384466, 0.07450981, 1, 0, 1,
-0.4665339, -0.2781333, -1.341766, 0.06666667, 1, 0, 1,
-0.4646649, -0.2721346, -0.1929233, 0.0627451, 1, 0, 1,
-0.4626449, 0.1759044, -2.542091, 0.05490196, 1, 0, 1,
-0.4603252, 0.2777531, -3.065132, 0.05098039, 1, 0, 1,
-0.4555323, 0.07658739, -1.06801, 0.04313726, 1, 0, 1,
-0.446544, 0.5917087, 1.123242, 0.03921569, 1, 0, 1,
-0.4464246, 0.471682, -1.836931, 0.03137255, 1, 0, 1,
-0.4461133, -1.359322, -2.644799, 0.02745098, 1, 0, 1,
-0.4456572, -1.147257, -1.089232, 0.01960784, 1, 0, 1,
-0.438633, 1.052052, -0.588542, 0.01568628, 1, 0, 1,
-0.4304486, 0.380165, 0.3647315, 0.007843138, 1, 0, 1,
-0.4295459, 2.049541, -0.1676599, 0.003921569, 1, 0, 1,
-0.4281884, -0.461543, -0.2322258, 0, 1, 0.003921569, 1,
-0.4255981, 0.1711063, -1.341424, 0, 1, 0.01176471, 1,
-0.4180482, 0.06062661, -0.3455277, 0, 1, 0.01568628, 1,
-0.4102585, -0.4473554, -0.8039643, 0, 1, 0.02352941, 1,
-0.4056623, 0.4742191, 0.9833531, 0, 1, 0.02745098, 1,
-0.3997275, -0.0996218, -1.396548, 0, 1, 0.03529412, 1,
-0.3966138, -0.2665437, -1.170865, 0, 1, 0.03921569, 1,
-0.3953782, -1.044293, -3.466468, 0, 1, 0.04705882, 1,
-0.3946988, -1.044876, -2.160365, 0, 1, 0.05098039, 1,
-0.3916273, -0.9602533, -3.332389, 0, 1, 0.05882353, 1,
-0.3912401, 2.128759, -0.9815649, 0, 1, 0.0627451, 1,
-0.3907707, 0.8697132, -1.325799, 0, 1, 0.07058824, 1,
-0.3870411, -1.330958, -2.456661, 0, 1, 0.07450981, 1,
-0.3865843, -0.004691533, -1.993742, 0, 1, 0.08235294, 1,
-0.3858162, 0.110251, -1.223435, 0, 1, 0.08627451, 1,
-0.3853253, -0.6351138, -3.21559, 0, 1, 0.09411765, 1,
-0.3851237, -0.8098462, -3.148198, 0, 1, 0.1019608, 1,
-0.3840028, -0.4875049, -2.86878, 0, 1, 0.1058824, 1,
-0.3814099, 0.8685754, -2.333099, 0, 1, 0.1137255, 1,
-0.3808007, 0.003567555, -0.7768387, 0, 1, 0.1176471, 1,
-0.3766797, -1.129507, -3.497168, 0, 1, 0.1254902, 1,
-0.3740706, -0.01007376, -2.227495, 0, 1, 0.1294118, 1,
-0.3680041, -1.535547, -2.378061, 0, 1, 0.1372549, 1,
-0.3664493, 0.9901925, 0.2330108, 0, 1, 0.1411765, 1,
-0.3590926, 0.716099, 0.1583428, 0, 1, 0.1490196, 1,
-0.3579755, 1.179653, -1.641833, 0, 1, 0.1529412, 1,
-0.3563946, -1.686608, -3.425297, 0, 1, 0.1607843, 1,
-0.3549958, 1.6134, 0.4165024, 0, 1, 0.1647059, 1,
-0.354194, -0.1639629, -1.538263, 0, 1, 0.172549, 1,
-0.3525544, 0.7780457, -1.138693, 0, 1, 0.1764706, 1,
-0.3521621, 1.513238, 0.2372483, 0, 1, 0.1843137, 1,
-0.3485587, -0.7258224, -3.172291, 0, 1, 0.1882353, 1,
-0.3481042, -0.5074992, -3.176454, 0, 1, 0.1960784, 1,
-0.3466421, -1.244125, -3.291367, 0, 1, 0.2039216, 1,
-0.3421423, 0.5257661, -1.715498, 0, 1, 0.2078431, 1,
-0.3415962, 0.8481482, 1.727973, 0, 1, 0.2156863, 1,
-0.3386477, -0.871403, -3.091858, 0, 1, 0.2196078, 1,
-0.3342392, 0.9942513, 0.3015647, 0, 1, 0.227451, 1,
-0.3337231, 0.4175608, 1.131613, 0, 1, 0.2313726, 1,
-0.3325351, -0.7529954, -1.575725, 0, 1, 0.2392157, 1,
-0.3289174, -1.252152, -3.667409, 0, 1, 0.2431373, 1,
-0.3276377, -1.091842, -2.860337, 0, 1, 0.2509804, 1,
-0.3257183, 0.6241749, -1.289688, 0, 1, 0.254902, 1,
-0.3216561, -1.215129, -0.7988242, 0, 1, 0.2627451, 1,
-0.314673, -0.6668844, -2.847469, 0, 1, 0.2666667, 1,
-0.3134326, 0.2539387, -1.625093, 0, 1, 0.2745098, 1,
-0.3093818, -0.2089868, -0.971473, 0, 1, 0.2784314, 1,
-0.3027628, 0.8151973, -0.4103369, 0, 1, 0.2862745, 1,
-0.2971077, -0.0340825, -4.064219, 0, 1, 0.2901961, 1,
-0.2884443, -2.377024, -4.744304, 0, 1, 0.2980392, 1,
-0.288408, 0.08353403, -1.491094, 0, 1, 0.3058824, 1,
-0.2866966, 1.643687, -1.835079, 0, 1, 0.3098039, 1,
-0.2826334, -0.2352837, -1.242303, 0, 1, 0.3176471, 1,
-0.2797762, -1.101683, -3.193071, 0, 1, 0.3215686, 1,
-0.2786336, 0.4764288, -0.110516, 0, 1, 0.3294118, 1,
-0.2785381, -1.553241, -1.117845, 0, 1, 0.3333333, 1,
-0.2778509, 1.845897, -0.6873294, 0, 1, 0.3411765, 1,
-0.2708976, 0.8935707, 0.3737611, 0, 1, 0.345098, 1,
-0.2686155, 0.6318648, -1.516258, 0, 1, 0.3529412, 1,
-0.267566, -0.8795033, -2.903488, 0, 1, 0.3568628, 1,
-0.2661642, -0.6828676, -3.526377, 0, 1, 0.3647059, 1,
-0.2616407, 0.3952634, 0.88178, 0, 1, 0.3686275, 1,
-0.2521766, -0.3923452, -1.959371, 0, 1, 0.3764706, 1,
-0.2513076, 0.003639029, -2.556325, 0, 1, 0.3803922, 1,
-0.2500944, 0.3516337, 0.3839387, 0, 1, 0.3882353, 1,
-0.2491551, -0.5513198, -1.983759, 0, 1, 0.3921569, 1,
-0.2435414, -0.5150274, -1.728433, 0, 1, 0.4, 1,
-0.2430011, -1.874003, -2.306112, 0, 1, 0.4078431, 1,
-0.2429988, 0.2772682, 0.2429212, 0, 1, 0.4117647, 1,
-0.2347434, 0.7217242, 0.7722195, 0, 1, 0.4196078, 1,
-0.2330911, 0.3370996, -0.980218, 0, 1, 0.4235294, 1,
-0.2319259, -1.352597, -1.04559, 0, 1, 0.4313726, 1,
-0.2180434, 1.127027, -0.8204966, 0, 1, 0.4352941, 1,
-0.2073793, -1.905308, -4.207899, 0, 1, 0.4431373, 1,
-0.2051222, -0.7784404, -3.000575, 0, 1, 0.4470588, 1,
-0.2039706, 1.325938, -1.411947, 0, 1, 0.454902, 1,
-0.2011055, -0.0748119, -4.424376, 0, 1, 0.4588235, 1,
-0.1988568, -1.052747, -2.94381, 0, 1, 0.4666667, 1,
-0.1928062, 0.1994524, -1.381515, 0, 1, 0.4705882, 1,
-0.1927741, 0.5558882, 0.1121066, 0, 1, 0.4784314, 1,
-0.190636, -0.8337832, -1.615022, 0, 1, 0.4823529, 1,
-0.1890462, -0.6257128, -2.324663, 0, 1, 0.4901961, 1,
-0.1873756, -1.224845, -3.099717, 0, 1, 0.4941176, 1,
-0.1868381, -1.099917, -5.186654, 0, 1, 0.5019608, 1,
-0.1865603, 0.658998, -0.7479821, 0, 1, 0.509804, 1,
-0.1854804, -0.6746114, -2.575716, 0, 1, 0.5137255, 1,
-0.1834263, -0.4597046, -2.819716, 0, 1, 0.5215687, 1,
-0.1819122, 1.661419, -0.3363876, 0, 1, 0.5254902, 1,
-0.1768407, 0.03857253, -1.356138, 0, 1, 0.5333334, 1,
-0.1766586, -1.01597, -1.833775, 0, 1, 0.5372549, 1,
-0.1766142, -0.007782081, -0.4670533, 0, 1, 0.5450981, 1,
-0.1755743, -0.1160239, -2.133775, 0, 1, 0.5490196, 1,
-0.1732198, 1.823877, -1.409256, 0, 1, 0.5568628, 1,
-0.1670487, 1.009502, -0.3345882, 0, 1, 0.5607843, 1,
-0.1652133, -1.754244, -2.124266, 0, 1, 0.5686275, 1,
-0.1645032, -0.07653264, -1.473829, 0, 1, 0.572549, 1,
-0.1638338, -1.052022, -5.339107, 0, 1, 0.5803922, 1,
-0.1566225, 0.2295859, -1.401275, 0, 1, 0.5843138, 1,
-0.1468701, -0.5300298, -5.549191, 0, 1, 0.5921569, 1,
-0.1353312, -1.997286, -1.610235, 0, 1, 0.5960785, 1,
-0.1348936, 1.428751, 0.4682044, 0, 1, 0.6039216, 1,
-0.1281638, -0.1350085, -1.022392, 0, 1, 0.6117647, 1,
-0.1278422, 0.1131241, -2.380567, 0, 1, 0.6156863, 1,
-0.1232547, 0.4390602, -0.1996139, 0, 1, 0.6235294, 1,
-0.1224875, 0.4647108, 0.1469805, 0, 1, 0.627451, 1,
-0.122435, 0.7643769, 0.6638323, 0, 1, 0.6352941, 1,
-0.1220476, -0.3272426, -2.717669, 0, 1, 0.6392157, 1,
-0.1217501, -1.9323, -1.345424, 0, 1, 0.6470588, 1,
-0.111509, -0.9191259, -1.954208, 0, 1, 0.6509804, 1,
-0.1082699, -0.6952249, -3.227778, 0, 1, 0.6588235, 1,
-0.1081817, 0.4074597, -1.165895, 0, 1, 0.6627451, 1,
-0.1064755, 0.08871243, -0.3207934, 0, 1, 0.6705883, 1,
-0.1059803, 1.028728, 0.17503, 0, 1, 0.6745098, 1,
-0.1047888, 0.2677804, 0.8139401, 0, 1, 0.682353, 1,
-0.100473, 0.3144475, 0.9312239, 0, 1, 0.6862745, 1,
-0.09848575, -0.8400413, -4.002818, 0, 1, 0.6941177, 1,
-0.09708451, 0.3307131, -1.015419, 0, 1, 0.7019608, 1,
-0.09564291, 0.6422254, -0.2532616, 0, 1, 0.7058824, 1,
-0.09267606, 0.6686489, -0.8217583, 0, 1, 0.7137255, 1,
-0.08892614, 1.419454, 1.049018, 0, 1, 0.7176471, 1,
-0.08728432, -1.149355, -3.008419, 0, 1, 0.7254902, 1,
-0.08326027, 0.7608137, 0.6900319, 0, 1, 0.7294118, 1,
-0.08095591, 1.430473, 1.790986, 0, 1, 0.7372549, 1,
-0.08015508, 0.5950468, -0.5286977, 0, 1, 0.7411765, 1,
-0.07905516, 0.4488039, -0.1736939, 0, 1, 0.7490196, 1,
-0.07715777, 0.2212664, -0.606442, 0, 1, 0.7529412, 1,
-0.07642668, 0.9665517, 0.5626143, 0, 1, 0.7607843, 1,
-0.0718883, -0.1655854, -3.656902, 0, 1, 0.7647059, 1,
-0.07160485, -0.735491, -2.753695, 0, 1, 0.772549, 1,
-0.06248225, -1.902117, -2.589188, 0, 1, 0.7764706, 1,
-0.05760056, 0.6911675, -0.5703328, 0, 1, 0.7843137, 1,
-0.05521835, -0.2836182, -2.912842, 0, 1, 0.7882353, 1,
-0.05447808, 0.2912985, -0.5041267, 0, 1, 0.7960784, 1,
-0.05346897, -0.5192719, -2.714171, 0, 1, 0.8039216, 1,
-0.05328131, -0.07158781, -3.222744, 0, 1, 0.8078431, 1,
-0.05140579, -0.9430628, -3.283568, 0, 1, 0.8156863, 1,
-0.05100132, 0.2672541, 1.04319, 0, 1, 0.8196079, 1,
-0.0474608, -1.483932, -5.254527, 0, 1, 0.827451, 1,
-0.04243684, 0.7904449, 1.13647, 0, 1, 0.8313726, 1,
-0.04225518, -0.376975, -3.339991, 0, 1, 0.8392157, 1,
-0.03977053, -0.4171269, -2.610558, 0, 1, 0.8431373, 1,
-0.03778801, -0.4498665, -4.312829, 0, 1, 0.8509804, 1,
-0.03326462, 0.1395783, -0.8032699, 0, 1, 0.854902, 1,
-0.03249596, -1.174208, -3.11547, 0, 1, 0.8627451, 1,
-0.03197457, 0.7844041, 2.257419, 0, 1, 0.8666667, 1,
-0.03039812, -0.9845247, -2.695254, 0, 1, 0.8745098, 1,
-0.02920713, -0.4927234, -4.018248, 0, 1, 0.8784314, 1,
-0.02884611, -2.205451, -4.990544, 0, 1, 0.8862745, 1,
-0.02700088, -1.470813, -2.332969, 0, 1, 0.8901961, 1,
-0.0266427, 1.504954, -1.446441, 0, 1, 0.8980392, 1,
-0.02139287, 1.099354, 0.5913609, 0, 1, 0.9058824, 1,
-0.02136474, 0.1172879, -0.4656503, 0, 1, 0.9098039, 1,
-0.01924421, 0.3312, 0.3032553, 0, 1, 0.9176471, 1,
-0.01749462, -1.161757, -3.383034, 0, 1, 0.9215686, 1,
-0.01447802, 1.102614, -0.4887304, 0, 1, 0.9294118, 1,
-0.01172617, -0.3391342, -2.028151, 0, 1, 0.9333333, 1,
-0.01057782, 0.3752367, -0.810205, 0, 1, 0.9411765, 1,
-0.01014426, 0.406726, 1.599196, 0, 1, 0.945098, 1,
-0.01005094, -1.148922, -2.342444, 0, 1, 0.9529412, 1,
-0.009077824, 0.2916401, -1.426815, 0, 1, 0.9568627, 1,
-0.008302714, -1.638558, -2.842937, 0, 1, 0.9647059, 1,
-0.006506663, -0.6347098, -3.193224, 0, 1, 0.9686275, 1,
-0.003462943, 3.505515, -0.983016, 0, 1, 0.9764706, 1,
0.0008000483, 0.297305, 0.3828528, 0, 1, 0.9803922, 1,
0.004085734, -0.5117755, 1.467059, 0, 1, 0.9882353, 1,
0.005052296, 0.4885929, 0.5360021, 0, 1, 0.9921569, 1,
0.005738602, -0.95126, 3.76685, 0, 1, 1, 1,
0.005811567, 1.234329, -0.7473421, 0, 0.9921569, 1, 1,
0.01847816, 0.6690465, -0.9795975, 0, 0.9882353, 1, 1,
0.02150022, -0.9346912, 2.224609, 0, 0.9803922, 1, 1,
0.02487701, -0.2951567, 2.788003, 0, 0.9764706, 1, 1,
0.0264135, -0.7066209, 2.544978, 0, 0.9686275, 1, 1,
0.02838687, 0.5581619, 1.052625, 0, 0.9647059, 1, 1,
0.02859278, -1.035075, 1.869892, 0, 0.9568627, 1, 1,
0.0301891, -1.760143, 3.156005, 0, 0.9529412, 1, 1,
0.03046292, 0.2254581, 0.1336238, 0, 0.945098, 1, 1,
0.03225821, 1.271802, -1.799194, 0, 0.9411765, 1, 1,
0.03403981, -0.4119292, 1.85004, 0, 0.9333333, 1, 1,
0.03608612, -0.404302, 4.157843, 0, 0.9294118, 1, 1,
0.0403221, 1.101747, 0.3841222, 0, 0.9215686, 1, 1,
0.04205517, 0.002079657, 1.780121, 0, 0.9176471, 1, 1,
0.04303101, 0.1344709, 0.9128085, 0, 0.9098039, 1, 1,
0.04304333, -0.06807335, 1.364048, 0, 0.9058824, 1, 1,
0.04469699, 1.034228, 0.02966962, 0, 0.8980392, 1, 1,
0.04857837, -0.8049492, 2.89224, 0, 0.8901961, 1, 1,
0.05430124, 2.106065, 0.1090162, 0, 0.8862745, 1, 1,
0.05553456, 0.4797703, -0.3708584, 0, 0.8784314, 1, 1,
0.05681289, 0.06980433, -0.1104452, 0, 0.8745098, 1, 1,
0.05882553, 0.4312907, 0.2200084, 0, 0.8666667, 1, 1,
0.06441817, -0.2062382, 4.21043, 0, 0.8627451, 1, 1,
0.06686638, 0.2825138, 1.181484, 0, 0.854902, 1, 1,
0.07245391, 1.643271, -0.0983509, 0, 0.8509804, 1, 1,
0.07433318, -0.9845835, 2.759621, 0, 0.8431373, 1, 1,
0.07532133, 0.3962628, 0.3699429, 0, 0.8392157, 1, 1,
0.0762459, -0.0301273, 1.572514, 0, 0.8313726, 1, 1,
0.07735384, -0.1451719, 3.152699, 0, 0.827451, 1, 1,
0.07769353, -0.7656799, 3.107387, 0, 0.8196079, 1, 1,
0.07834104, -1.663056, 2.348098, 0, 0.8156863, 1, 1,
0.08023887, -0.1433377, 3.001217, 0, 0.8078431, 1, 1,
0.08111215, 0.1759641, -0.736646, 0, 0.8039216, 1, 1,
0.08134355, 0.3709808, -0.2137253, 0, 0.7960784, 1, 1,
0.08249504, 1.277183, 0.1725214, 0, 0.7882353, 1, 1,
0.08443587, -0.5519721, 2.492178, 0, 0.7843137, 1, 1,
0.08460323, 0.05025594, 0.3644695, 0, 0.7764706, 1, 1,
0.0850943, 0.3888663, 0.6891506, 0, 0.772549, 1, 1,
0.08663604, 0.134064, 1.497569, 0, 0.7647059, 1, 1,
0.08819732, 0.4195454, -0.2154416, 0, 0.7607843, 1, 1,
0.08926568, 1.842551, 0.3955419, 0, 0.7529412, 1, 1,
0.08934405, -0.379696, 1.834027, 0, 0.7490196, 1, 1,
0.09070152, -0.02886383, 1.525124, 0, 0.7411765, 1, 1,
0.09196907, 0.1420419, 0.1979189, 0, 0.7372549, 1, 1,
0.0942172, 0.3065175, 1.612418, 0, 0.7294118, 1, 1,
0.09446307, 0.4036347, 1.092511, 0, 0.7254902, 1, 1,
0.09785348, -0.7152833, 1.577697, 0, 0.7176471, 1, 1,
0.09851093, -1.224927, 3.747425, 0, 0.7137255, 1, 1,
0.1014286, -0.1603157, 0.9164881, 0, 0.7058824, 1, 1,
0.103362, -0.346694, 3.850249, 0, 0.6980392, 1, 1,
0.1064406, -0.08864999, 1.885181, 0, 0.6941177, 1, 1,
0.1072805, 0.2530096, -0.3760222, 0, 0.6862745, 1, 1,
0.1073734, 0.2252244, 1.124725, 0, 0.682353, 1, 1,
0.1094691, 1.993243, 0.2969212, 0, 0.6745098, 1, 1,
0.1126805, 1.555441, 0.06420427, 0, 0.6705883, 1, 1,
0.1132861, -1.104706, 0.8288447, 0, 0.6627451, 1, 1,
0.1223813, 0.7650607, 0.3404508, 0, 0.6588235, 1, 1,
0.1226769, -1.545811, 4.309971, 0, 0.6509804, 1, 1,
0.1240278, 0.3214705, 0.1713911, 0, 0.6470588, 1, 1,
0.1264593, -1.355874, 2.594323, 0, 0.6392157, 1, 1,
0.1275747, -1.036355, 3.709897, 0, 0.6352941, 1, 1,
0.1352451, 0.1123397, 0.6481863, 0, 0.627451, 1, 1,
0.1354817, -0.444462, 3.477148, 0, 0.6235294, 1, 1,
0.1361026, -0.07771961, 2.597598, 0, 0.6156863, 1, 1,
0.1375463, -0.3435757, 1.937111, 0, 0.6117647, 1, 1,
0.1420425, 1.962677, 0.1737357, 0, 0.6039216, 1, 1,
0.1443131, -0.522078, 2.34787, 0, 0.5960785, 1, 1,
0.1450446, -1.787687, 3.344613, 0, 0.5921569, 1, 1,
0.147096, 2.195684, 0.2323774, 0, 0.5843138, 1, 1,
0.1475201, -0.7439647, 1.009978, 0, 0.5803922, 1, 1,
0.1480504, -0.6264047, 3.084065, 0, 0.572549, 1, 1,
0.1494594, -0.1924699, 1.745225, 0, 0.5686275, 1, 1,
0.1502665, 0.07474204, 2.02718, 0, 0.5607843, 1, 1,
0.1531831, -0.760308, 2.602531, 0, 0.5568628, 1, 1,
0.1553242, -1.325823, 3.431543, 0, 0.5490196, 1, 1,
0.1632927, 0.3116256, -0.3997005, 0, 0.5450981, 1, 1,
0.1633777, 0.406503, -0.5915091, 0, 0.5372549, 1, 1,
0.165276, -0.8877296, 2.769157, 0, 0.5333334, 1, 1,
0.1701679, -0.7640547, 3.483012, 0, 0.5254902, 1, 1,
0.1735949, -2.993768, 3.553556, 0, 0.5215687, 1, 1,
0.1743695, 1.204935, 1.287004, 0, 0.5137255, 1, 1,
0.1800636, -0.5110511, 3.180683, 0, 0.509804, 1, 1,
0.1933258, -0.4189985, 2.825735, 0, 0.5019608, 1, 1,
0.1943305, 0.9740289, 0.3174195, 0, 0.4941176, 1, 1,
0.201666, 0.3357905, 0.2337718, 0, 0.4901961, 1, 1,
0.2048449, -0.1670283, 1.626171, 0, 0.4823529, 1, 1,
0.207343, -1.666594, 2.174483, 0, 0.4784314, 1, 1,
0.2092859, -0.8919045, 3.195712, 0, 0.4705882, 1, 1,
0.2105149, -0.8991436, 2.692669, 0, 0.4666667, 1, 1,
0.2139354, -2.672064, 1.247306, 0, 0.4588235, 1, 1,
0.2154373, 0.3407348, -0.2418824, 0, 0.454902, 1, 1,
0.2191439, 0.7243399, -0.8951698, 0, 0.4470588, 1, 1,
0.2210587, -1.709474, 3.080748, 0, 0.4431373, 1, 1,
0.2240275, -1.037089, 2.434954, 0, 0.4352941, 1, 1,
0.2251882, 0.6735392, 0.7672926, 0, 0.4313726, 1, 1,
0.2260633, 1.055485, 0.06078915, 0, 0.4235294, 1, 1,
0.2262724, 2.392055, 0.9513353, 0, 0.4196078, 1, 1,
0.2283103, 0.24982, 2.310109, 0, 0.4117647, 1, 1,
0.2295075, 0.500394, -0.720216, 0, 0.4078431, 1, 1,
0.2420873, 2.59105, 1.320931, 0, 0.4, 1, 1,
0.242291, -1.861721, 3.373159, 0, 0.3921569, 1, 1,
0.2460275, 1.817255, -0.04274257, 0, 0.3882353, 1, 1,
0.2469198, -0.571685, 1.292341, 0, 0.3803922, 1, 1,
0.2490084, -0.6098923, 3.338586, 0, 0.3764706, 1, 1,
0.2496412, -0.8374571, 4.15753, 0, 0.3686275, 1, 1,
0.2496427, 0.4218212, 0.2452469, 0, 0.3647059, 1, 1,
0.2524729, 0.04814919, 0.1019503, 0, 0.3568628, 1, 1,
0.2547359, 1.123884, 0.453299, 0, 0.3529412, 1, 1,
0.2558707, -1.770584, 3.502784, 0, 0.345098, 1, 1,
0.2633052, -0.4662386, 2.570055, 0, 0.3411765, 1, 1,
0.2680889, 0.5046076, -0.6032662, 0, 0.3333333, 1, 1,
0.2687887, -0.7662197, 3.26057, 0, 0.3294118, 1, 1,
0.2713923, 0.9014792, 2.023971, 0, 0.3215686, 1, 1,
0.2727156, -0.8238627, 3.088488, 0, 0.3176471, 1, 1,
0.2737422, 0.1330861, 1.733131, 0, 0.3098039, 1, 1,
0.2761109, 1.271646, -0.1677151, 0, 0.3058824, 1, 1,
0.282303, -1.771526, 2.831609, 0, 0.2980392, 1, 1,
0.2847601, -0.4643998, 3.813756, 0, 0.2901961, 1, 1,
0.2870473, -1.05066, 2.448597, 0, 0.2862745, 1, 1,
0.2922489, -0.2285641, 1.955841, 0, 0.2784314, 1, 1,
0.2924741, 0.1318697, 1.548242, 0, 0.2745098, 1, 1,
0.295882, -0.2616767, 1.796841, 0, 0.2666667, 1, 1,
0.3064008, 1.019198, 0.8571596, 0, 0.2627451, 1, 1,
0.3079773, 0.1072518, 1.726987, 0, 0.254902, 1, 1,
0.3090734, -1.338668, 4.03842, 0, 0.2509804, 1, 1,
0.316116, -1.833929, 2.743237, 0, 0.2431373, 1, 1,
0.3178715, -0.2590176, 1.102666, 0, 0.2392157, 1, 1,
0.324913, 0.2160235, 1.150783, 0, 0.2313726, 1, 1,
0.325521, -1.116169, 3.658931, 0, 0.227451, 1, 1,
0.3330297, -1.15051, 0.8411812, 0, 0.2196078, 1, 1,
0.3369095, 0.6324875, -1.5045, 0, 0.2156863, 1, 1,
0.3432096, -0.1607982, 2.490003, 0, 0.2078431, 1, 1,
0.3435136, -2.42769, 3.958555, 0, 0.2039216, 1, 1,
0.3454639, -0.7633142, 2.844513, 0, 0.1960784, 1, 1,
0.3472872, 2.592952, 0.109522, 0, 0.1882353, 1, 1,
0.3503437, -1.022963, 1.886635, 0, 0.1843137, 1, 1,
0.3511188, 0.7733441, 1.30387, 0, 0.1764706, 1, 1,
0.3523701, 1.146365, -0.0683274, 0, 0.172549, 1, 1,
0.3586929, 0.2714562, 2.041714, 0, 0.1647059, 1, 1,
0.3587587, 1.559809, -0.2747065, 0, 0.1607843, 1, 1,
0.360184, 1.498976, 0.3926281, 0, 0.1529412, 1, 1,
0.3654453, -0.4050912, 1.207123, 0, 0.1490196, 1, 1,
0.3666601, 0.7495537, 1.227713, 0, 0.1411765, 1, 1,
0.3681624, 0.3009745, 0.3506855, 0, 0.1372549, 1, 1,
0.3686514, 0.404916, 0.2717169, 0, 0.1294118, 1, 1,
0.3688009, -0.5114394, 1.381209, 0, 0.1254902, 1, 1,
0.3714204, -0.3659421, 3.056204, 0, 0.1176471, 1, 1,
0.3726466, -0.06523993, 1.526392, 0, 0.1137255, 1, 1,
0.3733947, -0.1508999, 1.847865, 0, 0.1058824, 1, 1,
0.3737952, -0.6814445, 2.216624, 0, 0.09803922, 1, 1,
0.3745456, 1.660604, 0.07283445, 0, 0.09411765, 1, 1,
0.377584, -0.1119099, 1.767295, 0, 0.08627451, 1, 1,
0.3810279, 1.869376, -0.8859558, 0, 0.08235294, 1, 1,
0.3818424, 0.3029949, 1.352877, 0, 0.07450981, 1, 1,
0.3840067, 0.4455252, 0.05014766, 0, 0.07058824, 1, 1,
0.3925306, 0.1330654, 1.362724, 0, 0.0627451, 1, 1,
0.3931685, -0.5211131, 3.190013, 0, 0.05882353, 1, 1,
0.39338, -1.21382, 0.9230173, 0, 0.05098039, 1, 1,
0.3977467, 2.468914, -0.6625816, 0, 0.04705882, 1, 1,
0.39818, 1.511696, -2.303388, 0, 0.03921569, 1, 1,
0.3990353, -0.6087567, 2.880528, 0, 0.03529412, 1, 1,
0.4009646, 0.01341812, 2.763753, 0, 0.02745098, 1, 1,
0.4013695, 0.193924, 1.612279, 0, 0.02352941, 1, 1,
0.404882, -1.124024, 2.473703, 0, 0.01568628, 1, 1,
0.4078251, -2.860513, 3.102422, 0, 0.01176471, 1, 1,
0.4141627, -0.1243296, 2.289886, 0, 0.003921569, 1, 1,
0.4155698, 0.4332166, 0.1672843, 0.003921569, 0, 1, 1,
0.4190306, 0.345382, 0.0547924, 0.007843138, 0, 1, 1,
0.4201109, 0.2986031, 1.089708, 0.01568628, 0, 1, 1,
0.4215223, -0.3671475, 2.484501, 0.01960784, 0, 1, 1,
0.4216233, -0.9502986, 3.516444, 0.02745098, 0, 1, 1,
0.4316552, 1.327508, 1.635433, 0.03137255, 0, 1, 1,
0.4320399, 0.8258151, -1.271499, 0.03921569, 0, 1, 1,
0.4346273, 0.5063637, -0.7067816, 0.04313726, 0, 1, 1,
0.4402691, 1.365736, 0.9602441, 0.05098039, 0, 1, 1,
0.4412692, 1.403932, 0.2875207, 0.05490196, 0, 1, 1,
0.4443244, 0.7526819, 1.36704, 0.0627451, 0, 1, 1,
0.4514041, -0.03929605, 1.630434, 0.06666667, 0, 1, 1,
0.4531982, 1.147903, 1.137022, 0.07450981, 0, 1, 1,
0.4537251, -0.1379647, 1.09041, 0.07843138, 0, 1, 1,
0.4566582, -0.6090558, 2.39025, 0.08627451, 0, 1, 1,
0.4609859, -0.7178196, 2.447509, 0.09019608, 0, 1, 1,
0.4721596, 1.513892, -0.1626523, 0.09803922, 0, 1, 1,
0.477959, -2.033235, 1.295391, 0.1058824, 0, 1, 1,
0.4786644, -0.6189097, 0.7831727, 0.1098039, 0, 1, 1,
0.4792872, -1.196569, 2.617326, 0.1176471, 0, 1, 1,
0.4821694, -1.096576, 2.8137, 0.1215686, 0, 1, 1,
0.4853796, 0.7928399, -0.6671336, 0.1294118, 0, 1, 1,
0.486809, 1.194863, -0.53465, 0.1333333, 0, 1, 1,
0.4889523, 0.3666232, -0.1445018, 0.1411765, 0, 1, 1,
0.489006, 0.03589087, 1.8148, 0.145098, 0, 1, 1,
0.4906301, 0.6512464, -0.9071643, 0.1529412, 0, 1, 1,
0.4926159, -0.2537495, 2.262482, 0.1568628, 0, 1, 1,
0.499844, -1.862208, 3.054814, 0.1647059, 0, 1, 1,
0.5007648, -0.9960923, 2.370147, 0.1686275, 0, 1, 1,
0.5077838, 0.8332299, 1.262459, 0.1764706, 0, 1, 1,
0.509874, -0.1616676, 3.546323, 0.1803922, 0, 1, 1,
0.5124902, 2.956757, 1.238708, 0.1882353, 0, 1, 1,
0.5164053, 0.991849, 1.344041, 0.1921569, 0, 1, 1,
0.5172169, -0.84592, 3.442565, 0.2, 0, 1, 1,
0.5181255, -0.6665562, 2.989018, 0.2078431, 0, 1, 1,
0.5193801, 0.142337, 1.88079, 0.2117647, 0, 1, 1,
0.5197413, -0.08517195, 2.278163, 0.2196078, 0, 1, 1,
0.5242227, -0.9549711, 0.7293298, 0.2235294, 0, 1, 1,
0.5277932, -1.32552, 3.352242, 0.2313726, 0, 1, 1,
0.5292859, 0.9863012, 1.458232, 0.2352941, 0, 1, 1,
0.5320755, -0.6517354, 2.111168, 0.2431373, 0, 1, 1,
0.5338464, 0.3240396, 1.720443, 0.2470588, 0, 1, 1,
0.5341003, -0.3639918, 2.671759, 0.254902, 0, 1, 1,
0.5375154, -0.8267018, 2.15441, 0.2588235, 0, 1, 1,
0.5412469, -2.243124, 4.185578, 0.2666667, 0, 1, 1,
0.5424038, -0.1874884, 2.528864, 0.2705882, 0, 1, 1,
0.5445743, 0.4285341, 2.395095, 0.2784314, 0, 1, 1,
0.5495583, -1.164486, 1.383331, 0.282353, 0, 1, 1,
0.5504619, -0.6315035, -0.4873857, 0.2901961, 0, 1, 1,
0.552423, 0.2898437, 2.100304, 0.2941177, 0, 1, 1,
0.5556198, -0.02281795, 0.6902249, 0.3019608, 0, 1, 1,
0.5646855, 0.09307879, 1.026305, 0.3098039, 0, 1, 1,
0.5648957, -0.8555093, 2.700453, 0.3137255, 0, 1, 1,
0.5654855, -0.5369204, 4.742501, 0.3215686, 0, 1, 1,
0.5659451, -1.804694, 1.994504, 0.3254902, 0, 1, 1,
0.5673645, -0.2233085, 2.080393, 0.3333333, 0, 1, 1,
0.5675238, -0.4022325, 0.9643431, 0.3372549, 0, 1, 1,
0.5676401, 1.708322, -0.5324127, 0.345098, 0, 1, 1,
0.5680664, 0.3479906, 2.227573, 0.3490196, 0, 1, 1,
0.5698965, -0.7931579, 2.55346, 0.3568628, 0, 1, 1,
0.5700938, -1.316493, 1.282396, 0.3607843, 0, 1, 1,
0.5720491, 0.06301044, 1.931448, 0.3686275, 0, 1, 1,
0.5721849, 0.4222673, -0.1863057, 0.372549, 0, 1, 1,
0.5744128, 1.001351, 1.040546, 0.3803922, 0, 1, 1,
0.5760843, 1.064468, 0.3745043, 0.3843137, 0, 1, 1,
0.5762116, -0.2885783, 1.727229, 0.3921569, 0, 1, 1,
0.5811027, -0.522233, 0.9446874, 0.3960784, 0, 1, 1,
0.5822788, -1.314142, 3.85246, 0.4039216, 0, 1, 1,
0.5831379, 0.9343166, -0.002660418, 0.4117647, 0, 1, 1,
0.5840057, 1.821497, 1.047451, 0.4156863, 0, 1, 1,
0.5844486, 0.331531, 0.4097957, 0.4235294, 0, 1, 1,
0.5866343, 1.555792, 0.2037574, 0.427451, 0, 1, 1,
0.5878872, 0.1671194, 1.127754, 0.4352941, 0, 1, 1,
0.5913973, -0.3404751, 2.664378, 0.4392157, 0, 1, 1,
0.5922717, -0.05577085, 1.543986, 0.4470588, 0, 1, 1,
0.59431, 1.021484, 0.7039894, 0.4509804, 0, 1, 1,
0.6016712, -0.9340832, 3.930282, 0.4588235, 0, 1, 1,
0.6047794, -0.1027601, 3.914161, 0.4627451, 0, 1, 1,
0.6053124, -0.129726, 2.784495, 0.4705882, 0, 1, 1,
0.6085221, 0.609505, 1.033398, 0.4745098, 0, 1, 1,
0.6110585, -1.599692, 3.772174, 0.4823529, 0, 1, 1,
0.6146604, 1.256369, 1.240786, 0.4862745, 0, 1, 1,
0.6191766, 0.268218, 1.869021, 0.4941176, 0, 1, 1,
0.6204969, 0.0793988, -0.10841, 0.5019608, 0, 1, 1,
0.6252235, -0.6585809, 2.610665, 0.5058824, 0, 1, 1,
0.627942, -0.7602701, 3.66938, 0.5137255, 0, 1, 1,
0.6317447, -0.5474547, 2.608699, 0.5176471, 0, 1, 1,
0.63879, 0.4097857, -0.2288377, 0.5254902, 0, 1, 1,
0.6392618, 0.9644045, 0.5712367, 0.5294118, 0, 1, 1,
0.6448151, 1.377954, -0.6008884, 0.5372549, 0, 1, 1,
0.6464539, -0.02916857, 1.983029, 0.5411765, 0, 1, 1,
0.6518711, -2.297915, 4.083495, 0.5490196, 0, 1, 1,
0.6618434, -1.148332, 2.032767, 0.5529412, 0, 1, 1,
0.6630056, 0.7621881, 0.6648806, 0.5607843, 0, 1, 1,
0.665917, -1.441085, 2.185971, 0.5647059, 0, 1, 1,
0.6697502, 0.948114, 1.129169, 0.572549, 0, 1, 1,
0.6785136, 0.510695, 0.4831761, 0.5764706, 0, 1, 1,
0.6826137, -1.13043, 2.564919, 0.5843138, 0, 1, 1,
0.68765, -0.4403384, 2.515432, 0.5882353, 0, 1, 1,
0.7079428, 0.5467755, 0.9757352, 0.5960785, 0, 1, 1,
0.7151431, 0.2473569, -0.05039134, 0.6039216, 0, 1, 1,
0.7172002, 0.5027366, 0.3422847, 0.6078432, 0, 1, 1,
0.7192828, 0.6874581, 0.6505623, 0.6156863, 0, 1, 1,
0.7220711, 1.16615, -1.444322, 0.6196079, 0, 1, 1,
0.7326744, 0.2823958, 1.103276, 0.627451, 0, 1, 1,
0.735373, 0.9448354, 1.121971, 0.6313726, 0, 1, 1,
0.7373227, -0.4876735, 2.412053, 0.6392157, 0, 1, 1,
0.7430245, -1.759403, 2.691256, 0.6431373, 0, 1, 1,
0.7510832, -0.9256352, 2.647569, 0.6509804, 0, 1, 1,
0.7518686, -0.07951348, 2.79439, 0.654902, 0, 1, 1,
0.7528257, 1.240366, 0.3435479, 0.6627451, 0, 1, 1,
0.7625431, 0.7674945, -0.05391583, 0.6666667, 0, 1, 1,
0.7671718, 1.103395, 1.131869, 0.6745098, 0, 1, 1,
0.7677703, -1.811717, 3.60029, 0.6784314, 0, 1, 1,
0.7759279, -0.4285161, 3.21925, 0.6862745, 0, 1, 1,
0.7806884, -1.277372, 3.12975, 0.6901961, 0, 1, 1,
0.7865473, -0.220878, 0.5330769, 0.6980392, 0, 1, 1,
0.7883143, 0.0405615, 2.43846, 0.7058824, 0, 1, 1,
0.7884769, 1.450901, -0.7680163, 0.7098039, 0, 1, 1,
0.7902017, 0.8288658, 1.552551, 0.7176471, 0, 1, 1,
0.7904096, 1.766867, 0.9232179, 0.7215686, 0, 1, 1,
0.7937264, 0.254264, 0.363259, 0.7294118, 0, 1, 1,
0.7939443, -0.7866406, 0.2292161, 0.7333333, 0, 1, 1,
0.7981278, 0.1732869, 3.104969, 0.7411765, 0, 1, 1,
0.8007544, 0.6714221, 2.122571, 0.7450981, 0, 1, 1,
0.8042666, 2.7832, 1.215029, 0.7529412, 0, 1, 1,
0.8063316, -1.906527, 3.838764, 0.7568628, 0, 1, 1,
0.8071021, 1.846154, 0.220597, 0.7647059, 0, 1, 1,
0.8088427, -1.284972, 3.702413, 0.7686275, 0, 1, 1,
0.8089688, 1.121675, -1.136397, 0.7764706, 0, 1, 1,
0.8097891, -0.7545147, 2.680711, 0.7803922, 0, 1, 1,
0.8118382, 0.05562146, 1.360377, 0.7882353, 0, 1, 1,
0.8150275, -0.5270239, 2.682085, 0.7921569, 0, 1, 1,
0.8168777, 0.2183816, 1.422723, 0.8, 0, 1, 1,
0.8187308, -1.750814, 3.558576, 0.8078431, 0, 1, 1,
0.8207289, 0.9505862, 0.6796798, 0.8117647, 0, 1, 1,
0.8226267, 0.3438617, 1.724291, 0.8196079, 0, 1, 1,
0.835478, 1.54825, 0.8925983, 0.8235294, 0, 1, 1,
0.83764, 1.193357, -0.07951365, 0.8313726, 0, 1, 1,
0.8411015, -0.766759, 3.418358, 0.8352941, 0, 1, 1,
0.8491459, 0.2620642, 1.445262, 0.8431373, 0, 1, 1,
0.8499237, 0.1655753, 1.740326, 0.8470588, 0, 1, 1,
0.8583909, 0.2968884, -0.1436335, 0.854902, 0, 1, 1,
0.8630766, -0.2788252, 0.1106765, 0.8588235, 0, 1, 1,
0.8652427, 0.6540293, 1.570146, 0.8666667, 0, 1, 1,
0.8722715, 0.4002682, 0.5290872, 0.8705882, 0, 1, 1,
0.8723146, -0.5107116, 2.725236, 0.8784314, 0, 1, 1,
0.8736043, 0.1262748, 1.546861, 0.8823529, 0, 1, 1,
0.88133, -0.730866, 1.458447, 0.8901961, 0, 1, 1,
0.8830218, 0.5592167, 0.09359752, 0.8941177, 0, 1, 1,
0.8866649, 1.097461, 0.9834195, 0.9019608, 0, 1, 1,
0.8878803, 1.301091, -0.6714943, 0.9098039, 0, 1, 1,
0.8909162, -1.17298, 3.27998, 0.9137255, 0, 1, 1,
0.8910148, 0.5601724, 0.594158, 0.9215686, 0, 1, 1,
0.8990303, -0.826458, 2.394556, 0.9254902, 0, 1, 1,
0.9021844, 0.2723522, 1.06878, 0.9333333, 0, 1, 1,
0.9035493, 0.604407, 1.710751, 0.9372549, 0, 1, 1,
0.9054171, 0.8321959, 1.248463, 0.945098, 0, 1, 1,
0.9074489, 1.40375, -0.7923462, 0.9490196, 0, 1, 1,
0.907599, 1.043128, 2.749915, 0.9568627, 0, 1, 1,
0.9093687, -2.897735, 1.563502, 0.9607843, 0, 1, 1,
0.9101065, -0.02403785, 1.082114, 0.9686275, 0, 1, 1,
0.9108424, 0.2248421, 0.9521388, 0.972549, 0, 1, 1,
0.9138042, 0.4942416, 0.9111192, 0.9803922, 0, 1, 1,
0.9183663, 0.2851963, -0.4869022, 0.9843137, 0, 1, 1,
0.9189363, 0.7353075, 2.484043, 0.9921569, 0, 1, 1,
0.9205623, -0.2631402, 2.484288, 0.9960784, 0, 1, 1,
0.9271696, -0.9576015, 2.000597, 1, 0, 0.9960784, 1,
0.9312572, -0.7296636, 1.470265, 1, 0, 0.9882353, 1,
0.9344733, 0.1494337, 1.766139, 1, 0, 0.9843137, 1,
0.9359735, -1.094046, 2.62992, 1, 0, 0.9764706, 1,
0.9394587, 2.473457, 0.3691665, 1, 0, 0.972549, 1,
0.9516961, -0.7072244, 1.736491, 1, 0, 0.9647059, 1,
0.9554881, 0.9886096, 1.153573, 1, 0, 0.9607843, 1,
0.9561594, -0.6179138, 2.647014, 1, 0, 0.9529412, 1,
0.9634174, 0.7447528, 0.9349556, 1, 0, 0.9490196, 1,
0.979133, 0.4179522, 1.190457, 1, 0, 0.9411765, 1,
0.9878502, -1.138869, 2.218381, 1, 0, 0.9372549, 1,
1.002396, 1.053875, 0.2378407, 1, 0, 0.9294118, 1,
1.004097, -0.3220976, 2.133452, 1, 0, 0.9254902, 1,
1.009248, 0.8743429, 2.279384, 1, 0, 0.9176471, 1,
1.011651, 1.710769, 2.029166, 1, 0, 0.9137255, 1,
1.019327, -0.732634, 2.529382, 1, 0, 0.9058824, 1,
1.028177, 0.8367298, 0.8091311, 1, 0, 0.9019608, 1,
1.028266, -0.3268219, 1.62433, 1, 0, 0.8941177, 1,
1.031055, 0.5332446, 1.365751, 1, 0, 0.8862745, 1,
1.035186, -1.197107, 3.472952, 1, 0, 0.8823529, 1,
1.035959, 1.821154, 1.209903, 1, 0, 0.8745098, 1,
1.040579, -1.007677, 1.927901, 1, 0, 0.8705882, 1,
1.042999, 0.3838754, 1.322633, 1, 0, 0.8627451, 1,
1.047969, -0.6522278, 1.040437, 1, 0, 0.8588235, 1,
1.048837, -0.008144986, 1.785809, 1, 0, 0.8509804, 1,
1.051831, 0.6923153, 1.249105, 1, 0, 0.8470588, 1,
1.067343, 0.8318352, 1.239717, 1, 0, 0.8392157, 1,
1.068177, -0.3529112, 2.804381, 1, 0, 0.8352941, 1,
1.071076, 0.2791085, 3.40201, 1, 0, 0.827451, 1,
1.0716, 0.2745738, 0.7051674, 1, 0, 0.8235294, 1,
1.072304, -1.856426, 1.569084, 1, 0, 0.8156863, 1,
1.075047, -1.162032, 3.776547, 1, 0, 0.8117647, 1,
1.076467, 0.319792, -0.2675048, 1, 0, 0.8039216, 1,
1.090712, 0.1004826, -0.4679473, 1, 0, 0.7960784, 1,
1.090827, -1.484201, 2.686857, 1, 0, 0.7921569, 1,
1.093931, -0.01515392, 3.027755, 1, 0, 0.7843137, 1,
1.095313, -0.4436917, 1.433791, 1, 0, 0.7803922, 1,
1.100284, 1.31422, 0.3096751, 1, 0, 0.772549, 1,
1.101324, 0.4612751, 0.692327, 1, 0, 0.7686275, 1,
1.107976, 0.252594, 1.86734, 1, 0, 0.7607843, 1,
1.108114, 0.7553991, 1.943287, 1, 0, 0.7568628, 1,
1.112154, -0.2449294, 1.678331, 1, 0, 0.7490196, 1,
1.112722, -0.02497279, 1.218609, 1, 0, 0.7450981, 1,
1.125734, 1.152202, 1.771903, 1, 0, 0.7372549, 1,
1.12778, -0.9024994, 4.243825, 1, 0, 0.7333333, 1,
1.128668, 0.4104347, 0.9929053, 1, 0, 0.7254902, 1,
1.134733, -0.2889419, 1.936382, 1, 0, 0.7215686, 1,
1.134988, -0.1445537, 2.234759, 1, 0, 0.7137255, 1,
1.13965, 1.34098, -1.334156, 1, 0, 0.7098039, 1,
1.144614, -0.650313, 1.230093, 1, 0, 0.7019608, 1,
1.147089, 1.39608, 1.380123, 1, 0, 0.6941177, 1,
1.167083, -1.660581, 1.011382, 1, 0, 0.6901961, 1,
1.177347, 0.6276538, 1.789638, 1, 0, 0.682353, 1,
1.189922, -0.06987116, 1.697426, 1, 0, 0.6784314, 1,
1.1913, 0.4989086, 1.188842, 1, 0, 0.6705883, 1,
1.193683, 0.6407465, 0.7227998, 1, 0, 0.6666667, 1,
1.200643, -0.8480254, 1.683906, 1, 0, 0.6588235, 1,
1.203351, 0.536776, 1.51175, 1, 0, 0.654902, 1,
1.212924, -0.8612731, 2.005477, 1, 0, 0.6470588, 1,
1.220895, 0.8794108, 2.587131, 1, 0, 0.6431373, 1,
1.230038, -0.2367967, 0.7454248, 1, 0, 0.6352941, 1,
1.242495, 0.4280821, 1.913873, 1, 0, 0.6313726, 1,
1.249665, 0.1462127, -0.7236165, 1, 0, 0.6235294, 1,
1.250522, 0.2376644, 1.725714, 1, 0, 0.6196079, 1,
1.254201, 0.3732751, 0.1968236, 1, 0, 0.6117647, 1,
1.257282, -0.57474, 2.35585, 1, 0, 0.6078432, 1,
1.261598, 0.5184933, -0.3547181, 1, 0, 0.6, 1,
1.261995, 0.407631, 1.709054, 1, 0, 0.5921569, 1,
1.263144, 0.1006789, 2.834874, 1, 0, 0.5882353, 1,
1.277166, 1.339209, -0.5037893, 1, 0, 0.5803922, 1,
1.282203, 0.5458807, -0.3262173, 1, 0, 0.5764706, 1,
1.293949, 1.029444, 0.5850102, 1, 0, 0.5686275, 1,
1.296158, -0.01596171, 1.914991, 1, 0, 0.5647059, 1,
1.298682, 0.5151045, 2.149612, 1, 0, 0.5568628, 1,
1.29933, 0.04855829, 2.186696, 1, 0, 0.5529412, 1,
1.300622, -0.5332021, 2.356595, 1, 0, 0.5450981, 1,
1.300839, -2.041748, 2.153415, 1, 0, 0.5411765, 1,
1.311119, 0.9442979, 1.054989, 1, 0, 0.5333334, 1,
1.320943, -0.2875063, 2.225797, 1, 0, 0.5294118, 1,
1.326121, 1.223027, 2.009559, 1, 0, 0.5215687, 1,
1.333165, -1.382998, 1.829742, 1, 0, 0.5176471, 1,
1.334905, -0.01798429, 1.689321, 1, 0, 0.509804, 1,
1.334952, -0.5780945, 1.713636, 1, 0, 0.5058824, 1,
1.349249, -0.07857517, 4.067586, 1, 0, 0.4980392, 1,
1.35543, -0.3715635, 2.783597, 1, 0, 0.4901961, 1,
1.367328, 1.125317, 0.5805562, 1, 0, 0.4862745, 1,
1.373448, 0.01643156, 1.727321, 1, 0, 0.4784314, 1,
1.38859, 1.602879, 1.296829, 1, 0, 0.4745098, 1,
1.395784, -0.7671288, 2.010508, 1, 0, 0.4666667, 1,
1.398842, -0.7780179, 2.148691, 1, 0, 0.4627451, 1,
1.412297, -0.8113773, 2.097751, 1, 0, 0.454902, 1,
1.432566, 0.7614833, 1.711093, 1, 0, 0.4509804, 1,
1.436892, 2.666085, -0.3529316, 1, 0, 0.4431373, 1,
1.442946, -0.2591329, 0.7146193, 1, 0, 0.4392157, 1,
1.449708, -0.4994235, 2.498812, 1, 0, 0.4313726, 1,
1.455757, -1.505122, 1.557578, 1, 0, 0.427451, 1,
1.462911, -0.9777048, 2.721799, 1, 0, 0.4196078, 1,
1.471634, -1.152468, 3.053898, 1, 0, 0.4156863, 1,
1.478434, 0.4607645, 0.02616153, 1, 0, 0.4078431, 1,
1.493884, -0.1239877, 2.002096, 1, 0, 0.4039216, 1,
1.497989, 1.692713, 2.772482, 1, 0, 0.3960784, 1,
1.511037, -0.676122, 1.570244, 1, 0, 0.3882353, 1,
1.511573, 0.5075487, 0.8462804, 1, 0, 0.3843137, 1,
1.51165, 0.34841, 1.950453, 1, 0, 0.3764706, 1,
1.51214, -0.9486762, 1.428515, 1, 0, 0.372549, 1,
1.518498, 0.2437212, 0.4585094, 1, 0, 0.3647059, 1,
1.519722, 0.2303427, 2.112003, 1, 0, 0.3607843, 1,
1.523981, 0.7866168, -1.320681, 1, 0, 0.3529412, 1,
1.525103, 0.8415283, 0.9043052, 1, 0, 0.3490196, 1,
1.526363, -0.6991338, 1.698099, 1, 0, 0.3411765, 1,
1.529092, -0.1952953, 1.363035, 1, 0, 0.3372549, 1,
1.531197, 0.5775931, 0.09763759, 1, 0, 0.3294118, 1,
1.534385, -0.08160299, 2.08857, 1, 0, 0.3254902, 1,
1.534943, -1.337287, 1.767893, 1, 0, 0.3176471, 1,
1.539607, 0.9436306, -0.770158, 1, 0, 0.3137255, 1,
1.540276, 0.4173849, 1.375532, 1, 0, 0.3058824, 1,
1.552454, 0.8409024, 0.4905118, 1, 0, 0.2980392, 1,
1.564556, -0.5433, 1.032813, 1, 0, 0.2941177, 1,
1.589568, -0.08255333, 3.656378, 1, 0, 0.2862745, 1,
1.60056, 0.07481364, 2.373032, 1, 0, 0.282353, 1,
1.602072, -0.7425529, 2.136326, 1, 0, 0.2745098, 1,
1.604604, 2.037256, 1.551373, 1, 0, 0.2705882, 1,
1.634043, -1.194348, 2.152773, 1, 0, 0.2627451, 1,
1.644698, -0.01085285, 1.220495, 1, 0, 0.2588235, 1,
1.649649, -1.483306, 1.977455, 1, 0, 0.2509804, 1,
1.650094, 0.03922046, 0.1722677, 1, 0, 0.2470588, 1,
1.654419, 0.01269756, 3.460033, 1, 0, 0.2392157, 1,
1.656267, 1.584616, 1.221417, 1, 0, 0.2352941, 1,
1.690952, -1.028763, 1.283003, 1, 0, 0.227451, 1,
1.691772, 0.7283557, 2.002275, 1, 0, 0.2235294, 1,
1.695463, -0.1834307, 1.038782, 1, 0, 0.2156863, 1,
1.705962, -0.8138843, 1.553182, 1, 0, 0.2117647, 1,
1.71286, -0.7390264, 3.106381, 1, 0, 0.2039216, 1,
1.737311, 0.9665349, 1.636857, 1, 0, 0.1960784, 1,
1.738268, -0.4236652, 0.6253885, 1, 0, 0.1921569, 1,
1.74285, 0.6963909, 0.489169, 1, 0, 0.1843137, 1,
1.747078, 0.1596214, -0.6928114, 1, 0, 0.1803922, 1,
1.748972, -0.490634, 3.320048, 1, 0, 0.172549, 1,
1.793947, -0.06790461, 2.634403, 1, 0, 0.1686275, 1,
1.809317, 0.2704606, 2.962907, 1, 0, 0.1607843, 1,
1.825836, 0.8019734, 0.6353706, 1, 0, 0.1568628, 1,
1.857885, 1.757923, 1.938863, 1, 0, 0.1490196, 1,
1.86452, -0.4888896, 1.398243, 1, 0, 0.145098, 1,
1.881312, -0.4755137, 1.136525, 1, 0, 0.1372549, 1,
1.931564, -0.1289992, 2.483521, 1, 0, 0.1333333, 1,
1.966692, -1.763621, 2.385626, 1, 0, 0.1254902, 1,
2.02851, 0.5732449, 0.3740797, 1, 0, 0.1215686, 1,
2.029221, -1.585729, 2.702083, 1, 0, 0.1137255, 1,
2.040356, -0.5909309, 1.448515, 1, 0, 0.1098039, 1,
2.117365, -0.2800699, 0.2922609, 1, 0, 0.1019608, 1,
2.128543, 1.04219, 1.303511, 1, 0, 0.09411765, 1,
2.133625, 1.079792, 2.350922, 1, 0, 0.09019608, 1,
2.164408, 0.07879623, 1.583381, 1, 0, 0.08235294, 1,
2.180436, 1.631482, 0.9703393, 1, 0, 0.07843138, 1,
2.181185, -0.2204601, 0.5309879, 1, 0, 0.07058824, 1,
2.206009, -0.08750132, 0.4572582, 1, 0, 0.06666667, 1,
2.235518, -1.163651, 2.758923, 1, 0, 0.05882353, 1,
2.343092, -0.9480069, 0.7207249, 1, 0, 0.05490196, 1,
2.381999, -1.931867, 3.468986, 1, 0, 0.04705882, 1,
2.406845, 1.327638, 2.382553, 1, 0, 0.04313726, 1,
2.412808, -1.191584, 1.461483, 1, 0, 0.03529412, 1,
2.463496, 0.9699236, 1.194627, 1, 0, 0.03137255, 1,
2.480354, -0.3596498, 1.635759, 1, 0, 0.02352941, 1,
2.505662, -0.9541087, 3.894284, 1, 0, 0.01960784, 1,
2.618561, 0.6070648, -0.137727, 1, 0, 0.01176471, 1,
2.636245, 0.9667333, 0.6139724, 1, 0, 0.007843138, 1
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
-0.3108052, -4.095397, -7.770726, 0, -0.5, 0.5, 0.5,
-0.3108052, -4.095397, -7.770726, 1, -0.5, 0.5, 0.5,
-0.3108052, -4.095397, -7.770726, 1, 1.5, 0.5, 0.5,
-0.3108052, -4.095397, -7.770726, 0, 1.5, 0.5, 0.5
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
-4.256905, 0.2558733, -7.770726, 0, -0.5, 0.5, 0.5,
-4.256905, 0.2558733, -7.770726, 1, -0.5, 0.5, 0.5,
-4.256905, 0.2558733, -7.770726, 1, 1.5, 0.5, 0.5,
-4.256905, 0.2558733, -7.770726, 0, 1.5, 0.5, 0.5
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
-4.256905, -4.095397, -0.6073182, 0, -0.5, 0.5, 0.5,
-4.256905, -4.095397, -0.6073182, 1, -0.5, 0.5, 0.5,
-4.256905, -4.095397, -0.6073182, 1, 1.5, 0.5, 0.5,
-4.256905, -4.095397, -0.6073182, 0, 1.5, 0.5, 0.5
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
-3, -3.091258, -6.117632,
2, -3.091258, -6.117632,
-3, -3.091258, -6.117632,
-3, -3.258614, -6.393148,
-2, -3.091258, -6.117632,
-2, -3.258614, -6.393148,
-1, -3.091258, -6.117632,
-1, -3.258614, -6.393148,
0, -3.091258, -6.117632,
0, -3.258614, -6.393148,
1, -3.091258, -6.117632,
1, -3.258614, -6.393148,
2, -3.091258, -6.117632,
2, -3.258614, -6.393148
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
-3, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
-3, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
-3, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
-3, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5,
-2, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
-2, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
-2, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
-2, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5,
-1, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
-1, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
-1, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
-1, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5,
0, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
0, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
0, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
0, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5,
1, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
1, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
1, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
1, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5,
2, -3.593327, -6.944179, 0, -0.5, 0.5, 0.5,
2, -3.593327, -6.944179, 1, -0.5, 0.5, 0.5,
2, -3.593327, -6.944179, 1, 1.5, 0.5, 0.5,
2, -3.593327, -6.944179, 0, 1.5, 0.5, 0.5
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
-3.346267, -2, -6.117632,
-3.346267, 3, -6.117632,
-3.346267, -2, -6.117632,
-3.49804, -2, -6.393148,
-3.346267, -1, -6.117632,
-3.49804, -1, -6.393148,
-3.346267, 0, -6.117632,
-3.49804, 0, -6.393148,
-3.346267, 1, -6.117632,
-3.49804, 1, -6.393148,
-3.346267, 2, -6.117632,
-3.49804, 2, -6.393148,
-3.346267, 3, -6.117632,
-3.49804, 3, -6.393148
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
-3.801586, -2, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, -2, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, -2, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, -2, -6.944179, 0, 1.5, 0.5, 0.5,
-3.801586, -1, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, -1, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, -1, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, -1, -6.944179, 0, 1.5, 0.5, 0.5,
-3.801586, 0, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, 0, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, 0, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, 0, -6.944179, 0, 1.5, 0.5, 0.5,
-3.801586, 1, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, 1, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, 1, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, 1, -6.944179, 0, 1.5, 0.5, 0.5,
-3.801586, 2, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, 2, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, 2, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, 2, -6.944179, 0, 1.5, 0.5, 0.5,
-3.801586, 3, -6.944179, 0, -0.5, 0.5, 0.5,
-3.801586, 3, -6.944179, 1, -0.5, 0.5, 0.5,
-3.801586, 3, -6.944179, 1, 1.5, 0.5, 0.5,
-3.801586, 3, -6.944179, 0, 1.5, 0.5, 0.5
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
-3.346267, -3.091258, -4,
-3.346267, -3.091258, 4,
-3.346267, -3.091258, -4,
-3.49804, -3.258614, -4,
-3.346267, -3.091258, -2,
-3.49804, -3.258614, -2,
-3.346267, -3.091258, 0,
-3.49804, -3.258614, 0,
-3.346267, -3.091258, 2,
-3.49804, -3.258614, 2,
-3.346267, -3.091258, 4,
-3.49804, -3.258614, 4
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
-3.801586, -3.593327, -4, 0, -0.5, 0.5, 0.5,
-3.801586, -3.593327, -4, 1, -0.5, 0.5, 0.5,
-3.801586, -3.593327, -4, 1, 1.5, 0.5, 0.5,
-3.801586, -3.593327, -4, 0, 1.5, 0.5, 0.5,
-3.801586, -3.593327, -2, 0, -0.5, 0.5, 0.5,
-3.801586, -3.593327, -2, 1, -0.5, 0.5, 0.5,
-3.801586, -3.593327, -2, 1, 1.5, 0.5, 0.5,
-3.801586, -3.593327, -2, 0, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 0, 0, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 0, 1, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 0, 1, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 0, 0, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 2, 0, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 2, 1, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 2, 1, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 2, 0, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 4, 0, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 4, 1, -0.5, 0.5, 0.5,
-3.801586, -3.593327, 4, 1, 1.5, 0.5, 0.5,
-3.801586, -3.593327, 4, 0, 1.5, 0.5, 0.5
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
-3.346267, -3.091258, -6.117632,
-3.346267, 3.603004, -6.117632,
-3.346267, -3.091258, 4.902996,
-3.346267, 3.603004, 4.902996,
-3.346267, -3.091258, -6.117632,
-3.346267, -3.091258, 4.902996,
-3.346267, 3.603004, -6.117632,
-3.346267, 3.603004, 4.902996,
-3.346267, -3.091258, -6.117632,
2.724656, -3.091258, -6.117632,
-3.346267, -3.091258, 4.902996,
2.724656, -3.091258, 4.902996,
-3.346267, 3.603004, -6.117632,
2.724656, 3.603004, -6.117632,
-3.346267, 3.603004, 4.902996,
2.724656, 3.603004, 4.902996,
2.724656, -3.091258, -6.117632,
2.724656, 3.603004, -6.117632,
2.724656, -3.091258, 4.902996,
2.724656, 3.603004, 4.902996,
2.724656, -3.091258, -6.117632,
2.724656, -3.091258, 4.902996,
2.724656, 3.603004, -6.117632,
2.724656, 3.603004, 4.902996
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
var radius = 7.610366;
var distance = 33.85938;
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
mvMatrix.translate( 0.3108052, -0.2558733, 0.6073182 );
mvMatrix.scale( 1.355391, 1.229184, 0.7466432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85938);
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
sesamex<-read.table("sesamex.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sesamex$V2
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
y<-sesamex$V3
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
z<-sesamex$V4
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
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
-3.257855, 0.03631053, -1.514401, 0, 0, 1, 1, 1,
-3.052276, 0.8220291, -1.455378, 1, 0, 0, 1, 1,
-2.873502, 0.2120101, -1.373007, 1, 0, 0, 1, 1,
-2.793397, -0.4747047, -0.04994757, 1, 0, 0, 1, 1,
-2.770799, 0.6817125, -1.933094, 1, 0, 0, 1, 1,
-2.751021, -2.36943, -2.094266, 1, 0, 0, 1, 1,
-2.648123, 2.929964, -1.406105, 0, 0, 0, 1, 1,
-2.553646, 0.958555, -2.931327, 0, 0, 0, 1, 1,
-2.497731, -0.8058945, -2.996572, 0, 0, 0, 1, 1,
-2.466832, 0.6165571, -0.1356378, 0, 0, 0, 1, 1,
-2.457692, 0.7502652, -0.9809026, 0, 0, 0, 1, 1,
-2.270287, 0.06944264, -2.441313, 0, 0, 0, 1, 1,
-2.255439, 0.01264873, -2.402002, 0, 0, 0, 1, 1,
-2.246547, 1.507287, -1.238488, 1, 1, 1, 1, 1,
-2.215864, -1.234416, -1.628102, 1, 1, 1, 1, 1,
-2.197316, 0.6436481, -1.475098, 1, 1, 1, 1, 1,
-2.182026, 0.1838187, -2.985263, 1, 1, 1, 1, 1,
-2.175781, -0.1784068, -1.782378, 1, 1, 1, 1, 1,
-2.171124, -0.6370528, -1.041361, 1, 1, 1, 1, 1,
-2.153543, -0.8999065, -2.488101, 1, 1, 1, 1, 1,
-2.141855, -0.1473064, -0.03018385, 1, 1, 1, 1, 1,
-2.141354, -0.6646638, -1.05922, 1, 1, 1, 1, 1,
-2.125714, 2.684123, -1.768805, 1, 1, 1, 1, 1,
-2.11776, 0.1057232, -2.00777, 1, 1, 1, 1, 1,
-2.095919, 0.1942181, -0.5822224, 1, 1, 1, 1, 1,
-2.000437, 0.09343062, -0.768696, 1, 1, 1, 1, 1,
-1.999156, -0.8334422, -1.437511, 1, 1, 1, 1, 1,
-1.981378, 3.120575, -0.9831008, 1, 1, 1, 1, 1,
-1.953535, 1.21051, -0.6476026, 0, 0, 1, 1, 1,
-1.935623, -0.2191537, -2.073768, 1, 0, 0, 1, 1,
-1.916289, -1.680563, -1.496878, 1, 0, 0, 1, 1,
-1.90558, -1.051947, -2.779664, 1, 0, 0, 1, 1,
-1.861206, -1.554825, -2.699155, 1, 0, 0, 1, 1,
-1.850124, -1.049896, -2.723538, 1, 0, 0, 1, 1,
-1.841073, 1.780636, -1.319712, 0, 0, 0, 1, 1,
-1.826335, 0.7767873, -1.717082, 0, 0, 0, 1, 1,
-1.812972, 1.038861, -2.568016, 0, 0, 0, 1, 1,
-1.801336, -1.525489, -1.566937, 0, 0, 0, 1, 1,
-1.794186, -0.3309208, -3.445551, 0, 0, 0, 1, 1,
-1.77335, -0.7856846, 0.7379255, 0, 0, 0, 1, 1,
-1.767653, 0.3554945, -3.537383, 0, 0, 0, 1, 1,
-1.744867, 0.2019604, -1.534575, 1, 1, 1, 1, 1,
-1.731002, -0.03457708, -0.5692635, 1, 1, 1, 1, 1,
-1.720621, 0.7035336, -0.7473885, 1, 1, 1, 1, 1,
-1.707069, -1.350161, -0.913464, 1, 1, 1, 1, 1,
-1.699764, 0.07043923, -2.593196, 1, 1, 1, 1, 1,
-1.694418, -0.01525169, -0.6807079, 1, 1, 1, 1, 1,
-1.682446, 0.1487497, -2.664976, 1, 1, 1, 1, 1,
-1.653592, 0.6372262, -0.5703079, 1, 1, 1, 1, 1,
-1.649479, -1.824022, -1.78151, 1, 1, 1, 1, 1,
-1.639972, -1.260274, 0.3584717, 1, 1, 1, 1, 1,
-1.63957, -0.5502716, -1.540673, 1, 1, 1, 1, 1,
-1.636577, 0.03097294, -0.4288312, 1, 1, 1, 1, 1,
-1.620027, -0.1067946, 0.2572056, 1, 1, 1, 1, 1,
-1.611547, -0.1583287, -3.19249, 1, 1, 1, 1, 1,
-1.607791, 0.6768283, -0.8967908, 1, 1, 1, 1, 1,
-1.587551, 1.965224, -0.01583285, 0, 0, 1, 1, 1,
-1.562121, -1.203019, -1.876974, 1, 0, 0, 1, 1,
-1.561906, -0.1985308, -0.9214829, 1, 0, 0, 1, 1,
-1.549785, -1.265989, -1.761914, 1, 0, 0, 1, 1,
-1.547787, -1.493784, -1.005096, 1, 0, 0, 1, 1,
-1.547528, -0.591483, -4.125439, 1, 0, 0, 1, 1,
-1.544548, -0.2170258, -3.34031, 0, 0, 0, 1, 1,
-1.542812, 0.3947938, -1.727634, 0, 0, 0, 1, 1,
-1.540089, 0.8132583, -2.388332, 0, 0, 0, 1, 1,
-1.537395, 1.946505, -0.7200564, 0, 0, 0, 1, 1,
-1.532057, -0.02349317, -4.061381, 0, 0, 0, 1, 1,
-1.499012, -2.154051, -1.234103, 0, 0, 0, 1, 1,
-1.485034, -0.101011, -3.334806, 0, 0, 0, 1, 1,
-1.477052, 0.006771612, -2.20579, 1, 1, 1, 1, 1,
-1.472873, -0.1980515, -2.058322, 1, 1, 1, 1, 1,
-1.466926, 1.09212, -0.8934318, 1, 1, 1, 1, 1,
-1.462775, -1.300686, -1.021579, 1, 1, 1, 1, 1,
-1.445002, -0.3700565, -3.313013, 1, 1, 1, 1, 1,
-1.404316, 0.4427194, -1.477252, 1, 1, 1, 1, 1,
-1.397227, -1.43696, -5.014158, 1, 1, 1, 1, 1,
-1.380867, 1.888904, 0.9461076, 1, 1, 1, 1, 1,
-1.362908, -0.008797236, -0.6704391, 1, 1, 1, 1, 1,
-1.360837, 1.854886, 0.007954855, 1, 1, 1, 1, 1,
-1.350219, -0.3259012, -2.962745, 1, 1, 1, 1, 1,
-1.346624, -0.6326194, -3.321447, 1, 1, 1, 1, 1,
-1.345343, 1.543263, -1.108647, 1, 1, 1, 1, 1,
-1.344167, 0.1129594, -0.01601147, 1, 1, 1, 1, 1,
-1.341533, -0.6476596, -1.604344, 1, 1, 1, 1, 1,
-1.339202, -0.6190169, -1.684615, 0, 0, 1, 1, 1,
-1.332094, -1.730475, -3.368618, 1, 0, 0, 1, 1,
-1.325974, 1.09812, -0.2939909, 1, 0, 0, 1, 1,
-1.320993, 0.6658925, -0.8224133, 1, 0, 0, 1, 1,
-1.318389, 0.04889014, -1.018883, 1, 0, 0, 1, 1,
-1.315807, 0.2456596, -1.905137, 1, 0, 0, 1, 1,
-1.313291, -0.1154363, -1.259871, 0, 0, 0, 1, 1,
-1.301083, -0.3601585, -3.293275, 0, 0, 0, 1, 1,
-1.295212, 0.3533471, -0.6160292, 0, 0, 0, 1, 1,
-1.288165, -0.6840914, -3.042536, 0, 0, 0, 1, 1,
-1.287058, -0.4416811, -2.521041, 0, 0, 0, 1, 1,
-1.284325, 0.5646397, -3.180151, 0, 0, 0, 1, 1,
-1.27507, -0.3426105, -2.028244, 0, 0, 0, 1, 1,
-1.274822, 0.1849454, -2.541341, 1, 1, 1, 1, 1,
-1.26589, 0.236185, -1.264562, 1, 1, 1, 1, 1,
-1.265015, 0.6108652, 0.3558305, 1, 1, 1, 1, 1,
-1.256677, 2.214659, 0.2464145, 1, 1, 1, 1, 1,
-1.249848, 0.6373172, -1.789821, 1, 1, 1, 1, 1,
-1.236739, -0.5175709, -2.243209, 1, 1, 1, 1, 1,
-1.233743, 0.5299228, 0.06270403, 1, 1, 1, 1, 1,
-1.225785, 0.04805804, -0.9584669, 1, 1, 1, 1, 1,
-1.221016, 1.58994, -0.5025567, 1, 1, 1, 1, 1,
-1.2136, 0.8133618, -1.064648, 1, 1, 1, 1, 1,
-1.203239, -0.3736049, -0.2092821, 1, 1, 1, 1, 1,
-1.196223, -1.167684, -3.075327, 1, 1, 1, 1, 1,
-1.19183, 0.3891663, -1.913272, 1, 1, 1, 1, 1,
-1.190871, -1.494253, -3.640649, 1, 1, 1, 1, 1,
-1.189668, -2.603989, -1.47841, 1, 1, 1, 1, 1,
-1.188953, 0.5060157, -1.965505, 0, 0, 1, 1, 1,
-1.183199, -0.578679, -1.883351, 1, 0, 0, 1, 1,
-1.179903, 0.1336146, -1.164658, 1, 0, 0, 1, 1,
-1.1787, -0.3104456, -1.854844, 1, 0, 0, 1, 1,
-1.172338, 1.48338, 0.219111, 1, 0, 0, 1, 1,
-1.167768, -0.05328727, -1.140691, 1, 0, 0, 1, 1,
-1.155689, 0.3182331, -1.066972, 0, 0, 0, 1, 1,
-1.151638, -0.5431698, -3.325991, 0, 0, 0, 1, 1,
-1.151549, 0.3409024, -0.567223, 0, 0, 0, 1, 1,
-1.151409, -1.349579, -5.344785, 0, 0, 0, 1, 1,
-1.148028, -0.26147, -1.997292, 0, 0, 0, 1, 1,
-1.139948, 0.7885848, -1.229325, 0, 0, 0, 1, 1,
-1.13458, 0.9673235, -0.5915295, 0, 0, 0, 1, 1,
-1.13289, 0.6678494, -1.190657, 1, 1, 1, 1, 1,
-1.125499, -1.220625, -2.567841, 1, 1, 1, 1, 1,
-1.120391, -1.860324, -1.735179, 1, 1, 1, 1, 1,
-1.118725, 0.1660209, -1.128222, 1, 1, 1, 1, 1,
-1.118037, 0.9154724, -2.234789, 1, 1, 1, 1, 1,
-1.116246, 1.563737, 0.5209122, 1, 1, 1, 1, 1,
-1.111577, -0.6632333, -1.216619, 1, 1, 1, 1, 1,
-1.10666, 0.3530976, -1.50092, 1, 1, 1, 1, 1,
-1.104964, 0.3618257, -0.8478125, 1, 1, 1, 1, 1,
-1.081571, 1.160568, 0.4511037, 1, 1, 1, 1, 1,
-1.076954, -2.319356, -2.447672, 1, 1, 1, 1, 1,
-1.070348, -0.9994549, -1.985713, 1, 1, 1, 1, 1,
-1.06293, 0.1276023, -2.902283, 1, 1, 1, 1, 1,
-1.053243, 0.1037823, -1.089232, 1, 1, 1, 1, 1,
-1.050689, 0.006116322, -1.846718, 1, 1, 1, 1, 1,
-1.050145, -0.01116815, -1.897169, 0, 0, 1, 1, 1,
-1.046376, 0.7099739, 0.6095976, 1, 0, 0, 1, 1,
-1.046204, 1.088536, -1.760125, 1, 0, 0, 1, 1,
-1.044129, 1.90627, -0.1121541, 1, 0, 0, 1, 1,
-1.02986, 0.5784613, -2.873622, 1, 0, 0, 1, 1,
-1.029685, -1.905883, -2.38015, 1, 0, 0, 1, 1,
-1.026471, 2.110491, -0.1906061, 0, 0, 0, 1, 1,
-1.025095, 0.03115938, -1.721477, 0, 0, 0, 1, 1,
-1.007004, -0.4877976, -3.266302, 0, 0, 0, 1, 1,
-1.004076, -0.7882604, -1.518694, 0, 0, 0, 1, 1,
-1.000009, -2.246661, -2.230182, 0, 0, 0, 1, 1,
-0.9996299, -1.048377, -0.1707798, 0, 0, 0, 1, 1,
-0.9899344, 1.588739, -1.360195, 0, 0, 0, 1, 1,
-0.9847733, -0.3412175, -1.684597, 1, 1, 1, 1, 1,
-0.9837275, -0.7508636, -2.258232, 1, 1, 1, 1, 1,
-0.9810356, -0.4325769, -0.08330716, 1, 1, 1, 1, 1,
-0.9802011, -1.939786, -4.249854, 1, 1, 1, 1, 1,
-0.9632666, 1.119357, 0.07856055, 1, 1, 1, 1, 1,
-0.9626973, -1.194106, -2.678094, 1, 1, 1, 1, 1,
-0.9615486, -0.07733911, -0.2792006, 1, 1, 1, 1, 1,
-0.9498229, 0.411151, -0.3589531, 1, 1, 1, 1, 1,
-0.9467517, -0.5620047, -2.251889, 1, 1, 1, 1, 1,
-0.9437557, -0.04364987, -1.159028, 1, 1, 1, 1, 1,
-0.9433365, 1.325644, -0.6358067, 1, 1, 1, 1, 1,
-0.9354631, 0.6338334, -1.133431, 1, 1, 1, 1, 1,
-0.9326097, -0.4308875, -3.177706, 1, 1, 1, 1, 1,
-0.9321349, 0.4675796, -2.412989, 1, 1, 1, 1, 1,
-0.9316697, 1.352023, 0.7246407, 1, 1, 1, 1, 1,
-0.9222897, -0.06699761, -1.015631, 0, 0, 1, 1, 1,
-0.9175946, -0.8038636, -0.9211347, 1, 0, 0, 1, 1,
-0.9086936, 0.2164858, -1.30714, 1, 0, 0, 1, 1,
-0.905095, -1.220632, -1.343978, 1, 0, 0, 1, 1,
-0.9040316, 0.1408998, -2.272815, 1, 0, 0, 1, 1,
-0.9020626, 1.991729, -0.9815452, 1, 0, 0, 1, 1,
-0.9019396, 1.818587, 1.903422, 0, 0, 0, 1, 1,
-0.9008376, 1.197789, -1.377333, 0, 0, 0, 1, 1,
-0.8980913, -0.5765807, -2.363206, 0, 0, 0, 1, 1,
-0.8911808, -0.6035309, -2.646867, 0, 0, 0, 1, 1,
-0.8903611, -1.300109, -1.978943, 0, 0, 0, 1, 1,
-0.8867667, 0.5008077, -2.297925, 0, 0, 0, 1, 1,
-0.8857926, -0.3013515, -1.908966, 0, 0, 0, 1, 1,
-0.8853596, -2.506888, -2.015949, 1, 1, 1, 1, 1,
-0.8766, -0.1279984, -1.870267, 1, 1, 1, 1, 1,
-0.8749837, -0.5749551, -3.527157, 1, 1, 1, 1, 1,
-0.8678985, -0.9444751, -0.3578863, 1, 1, 1, 1, 1,
-0.8569204, -0.1447029, -2.599736, 1, 1, 1, 1, 1,
-0.8561357, 0.5895411, -1.186682, 1, 1, 1, 1, 1,
-0.8560942, -0.3253307, -1.508542, 1, 1, 1, 1, 1,
-0.8543601, 1.053043, -0.7818944, 1, 1, 1, 1, 1,
-0.8479995, -0.303467, -1.529306, 1, 1, 1, 1, 1,
-0.8448696, 1.130278, -0.9321404, 1, 1, 1, 1, 1,
-0.8413681, -1.474521, -2.962494, 1, 1, 1, 1, 1,
-0.8380302, -1.919715, -2.982307, 1, 1, 1, 1, 1,
-0.8337863, 2.342467, -0.5526867, 1, 1, 1, 1, 1,
-0.8320131, -0.5385635, -2.997776, 1, 1, 1, 1, 1,
-0.828967, -0.3657504, -2.187566, 1, 1, 1, 1, 1,
-0.8219991, 2.743342, 1.126021, 0, 0, 1, 1, 1,
-0.8160729, 0.7183663, -3.261149, 1, 0, 0, 1, 1,
-0.8144274, 0.5055313, -2.148615, 1, 0, 0, 1, 1,
-0.8133366, 1.693968, -1.704513, 1, 0, 0, 1, 1,
-0.8080977, 0.4147601, -1.311444, 1, 0, 0, 1, 1,
-0.8016391, -0.364, -1.804659, 1, 0, 0, 1, 1,
-0.7795103, -0.6895667, -2.738896, 0, 0, 0, 1, 1,
-0.7720835, -0.4810152, -1.593861, 0, 0, 0, 1, 1,
-0.7715878, -0.4143075, -2.565462, 0, 0, 0, 1, 1,
-0.7707478, -1.746963, -2.717726, 0, 0, 0, 1, 1,
-0.7704338, -1.775803, -2.241802, 0, 0, 0, 1, 1,
-0.7699567, -0.5927196, -2.84436, 0, 0, 0, 1, 1,
-0.7680385, 1.510907, -2.254091, 0, 0, 0, 1, 1,
-0.7678456, 0.1575381, -0.0426656, 1, 1, 1, 1, 1,
-0.7652847, 0.1939677, -2.062005, 1, 1, 1, 1, 1,
-0.7645816, -1.086057, -1.513452, 1, 1, 1, 1, 1,
-0.7606809, -0.3702155, -0.4899659, 1, 1, 1, 1, 1,
-0.7535089, -0.865621, -0.001057238, 1, 1, 1, 1, 1,
-0.747113, -0.8144066, -1.885164, 1, 1, 1, 1, 1,
-0.7454011, -0.0225664, -1.186492, 1, 1, 1, 1, 1,
-0.7416048, 1.152361, 0.007841922, 1, 1, 1, 1, 1,
-0.741162, 1.154305, -1.302376, 1, 1, 1, 1, 1,
-0.7368053, -1.713611, -1.944332, 1, 1, 1, 1, 1,
-0.7342689, 0.1764232, -0.6878716, 1, 1, 1, 1, 1,
-0.7320979, -0.1474954, -1.959465, 1, 1, 1, 1, 1,
-0.7277617, 0.7671685, -2.17399, 1, 1, 1, 1, 1,
-0.7257848, -0.5797204, -1.280109, 1, 1, 1, 1, 1,
-0.7244145, 0.5908551, 0.5239127, 1, 1, 1, 1, 1,
-0.7126005, 0.705987, -1.584986, 0, 0, 1, 1, 1,
-0.7097992, -1.213099, -1.598495, 1, 0, 0, 1, 1,
-0.7058454, 0.4770569, -3.840431, 1, 0, 0, 1, 1,
-0.6980066, -0.2455919, -1.273898, 1, 0, 0, 1, 1,
-0.696366, -0.3002014, -1.817469, 1, 0, 0, 1, 1,
-0.6962641, 1.159158, -1.14435, 1, 0, 0, 1, 1,
-0.6884134, -1.058052, -1.693503, 0, 0, 0, 1, 1,
-0.6879254, -1.717271, -1.826223, 0, 0, 0, 1, 1,
-0.6823373, 1.179661, -0.7243523, 0, 0, 0, 1, 1,
-0.6815753, -0.9609869, -2.767865, 0, 0, 0, 1, 1,
-0.6780432, -0.9130093, -4.090018, 0, 0, 0, 1, 1,
-0.6743098, -1.467206, -2.615242, 0, 0, 0, 1, 1,
-0.6734908, -0.6306682, -2.89819, 0, 0, 0, 1, 1,
-0.672163, -0.1591277, -1.7346, 1, 1, 1, 1, 1,
-0.6685133, 0.707566, -0.6190738, 1, 1, 1, 1, 1,
-0.6662966, -1.221236, -3.459511, 1, 1, 1, 1, 1,
-0.6624804, 0.3891824, -0.02800025, 1, 1, 1, 1, 1,
-0.6615087, -1.533995, -3.96584, 1, 1, 1, 1, 1,
-0.6604977, -1.734964, -3.030133, 1, 1, 1, 1, 1,
-0.6562921, -0.3965942, -3.361663, 1, 1, 1, 1, 1,
-0.653617, -2.208678, -4.295475, 1, 1, 1, 1, 1,
-0.6513913, -1.453379, -3.475318, 1, 1, 1, 1, 1,
-0.6509577, 1.404355, -0.7857308, 1, 1, 1, 1, 1,
-0.6508815, -1.048042, -4.045557, 1, 1, 1, 1, 1,
-0.6486681, 0.9663181, -1.014462, 1, 1, 1, 1, 1,
-0.6478226, 1.448332, -1.523673, 1, 1, 1, 1, 1,
-0.6456985, -0.2846119, -0.5302254, 1, 1, 1, 1, 1,
-0.6387519, -1.698442, -1.686116, 1, 1, 1, 1, 1,
-0.6377211, 0.667125, -0.8576922, 0, 0, 1, 1, 1,
-0.6374927, 1.067623, -0.1233155, 1, 0, 0, 1, 1,
-0.6366918, 0.1092031, -2.563664, 1, 0, 0, 1, 1,
-0.6316903, 0.3734117, -2.490237, 1, 0, 0, 1, 1,
-0.6311412, -0.3620025, -1.557193, 1, 0, 0, 1, 1,
-0.6172791, 0.7501614, -0.153593, 1, 0, 0, 1, 1,
-0.6156503, -0.6406935, -2.457129, 0, 0, 0, 1, 1,
-0.6120752, -0.1777782, -2.039231, 0, 0, 0, 1, 1,
-0.6091905, -1.220959, -0.7397968, 0, 0, 0, 1, 1,
-0.6057213, -0.1879643, -0.1217112, 0, 0, 0, 1, 1,
-0.6015317, 0.8484249, -1.223959, 0, 0, 0, 1, 1,
-0.6012155, -0.4472795, -3.549454, 0, 0, 0, 1, 1,
-0.5978262, -0.2831894, -2.954576, 0, 0, 0, 1, 1,
-0.5970508, -0.9070027, -2.61961, 1, 1, 1, 1, 1,
-0.5961885, 0.4934501, -1.893827, 1, 1, 1, 1, 1,
-0.5944788, -0.110508, -1.040683, 1, 1, 1, 1, 1,
-0.5937736, 0.1523135, -0.818431, 1, 1, 1, 1, 1,
-0.5937156, 0.9218163, 0.05223913, 1, 1, 1, 1, 1,
-0.592113, -0.3087905, -2.102948, 1, 1, 1, 1, 1,
-0.5856957, 0.7960808, -0.4928892, 1, 1, 1, 1, 1,
-0.580235, 0.7990567, -1.808711, 1, 1, 1, 1, 1,
-0.5793962, 0.287994, -1.804248, 1, 1, 1, 1, 1,
-0.5719357, -0.1435751, -1.823935, 1, 1, 1, 1, 1,
-0.5716402, -1.102059, -2.297446, 1, 1, 1, 1, 1,
-0.5685721, -0.415828, -0.7812021, 1, 1, 1, 1, 1,
-0.5662612, 0.3969737, -0.4336113, 1, 1, 1, 1, 1,
-0.5661075, -1.284293, -3.117899, 1, 1, 1, 1, 1,
-0.5649768, 1.402776, 0.4127063, 1, 1, 1, 1, 1,
-0.5640476, 0.4368923, 0.8361604, 0, 0, 1, 1, 1,
-0.5638741, 1.086728, -0.3480364, 1, 0, 0, 1, 1,
-0.5634282, -0.07672204, -1.386009, 1, 0, 0, 1, 1,
-0.5558415, 0.9715465, -1.322918, 1, 0, 0, 1, 1,
-0.5556703, -2.138703, -2.584178, 1, 0, 0, 1, 1,
-0.5555881, 0.05094475, -1.269927, 1, 0, 0, 1, 1,
-0.5509483, -1.237543, -4.263194, 0, 0, 0, 1, 1,
-0.549916, 0.1749272, -0.8474637, 0, 0, 0, 1, 1,
-0.5493052, -1.035689, -0.7343722, 0, 0, 0, 1, 1,
-0.5467445, -0.1333136, -2.949377, 0, 0, 0, 1, 1,
-0.5458639, 0.6239828, -1.028883, 0, 0, 0, 1, 1,
-0.5452245, 1.798383, 0.09001047, 0, 0, 0, 1, 1,
-0.5436434, -0.7362135, -2.573146, 0, 0, 0, 1, 1,
-0.5434394, -0.4146144, -1.841995, 1, 1, 1, 1, 1,
-0.5418036, 0.8536996, -0.6869092, 1, 1, 1, 1, 1,
-0.5382088, -0.6747384, -1.675636, 1, 1, 1, 1, 1,
-0.5332716, 0.4337789, -1.798396, 1, 1, 1, 1, 1,
-0.5156987, 0.4108602, -0.2223796, 1, 1, 1, 1, 1,
-0.5152836, 0.3805358, 0.7376539, 1, 1, 1, 1, 1,
-0.5144388, 0.03789047, -0.5409937, 1, 1, 1, 1, 1,
-0.5132108, -0.4536302, -3.617416, 1, 1, 1, 1, 1,
-0.5108925, 1.856197, -0.0651526, 1, 1, 1, 1, 1,
-0.5082132, 1.46934, 2.403901, 1, 1, 1, 1, 1,
-0.5075279, -1.025441, -3.524617, 1, 1, 1, 1, 1,
-0.5039762, 1.417783, 0.1715447, 1, 1, 1, 1, 1,
-0.5029196, 1.465221, -0.8326774, 1, 1, 1, 1, 1,
-0.5017528, -1.615393, -5.957138, 1, 1, 1, 1, 1,
-0.5015034, 0.3435312, -0.7561049, 1, 1, 1, 1, 1,
-0.4989582, 0.5836134, 1.017224, 0, 0, 1, 1, 1,
-0.495519, -1.228771, -4.652153, 1, 0, 0, 1, 1,
-0.4924246, 0.3511256, -1.132933, 1, 0, 0, 1, 1,
-0.4891988, 1.649353, 0.5432593, 1, 0, 0, 1, 1,
-0.4889869, -1.891298, -3.068166, 1, 0, 0, 1, 1,
-0.4879592, -1.644315, -3.12935, 1, 0, 0, 1, 1,
-0.4874125, 0.7723808, -0.6670961, 0, 0, 0, 1, 1,
-0.4829547, 0.4397355, -1.027293, 0, 0, 0, 1, 1,
-0.4825328, 0.4611657, -0.8473797, 0, 0, 0, 1, 1,
-0.4823642, -0.02396773, -1.520017, 0, 0, 0, 1, 1,
-0.4791976, 0.2959132, -1.806822, 0, 0, 0, 1, 1,
-0.4785668, -0.2389441, -2.281127, 0, 0, 0, 1, 1,
-0.4749036, 1.361774, 0.4131078, 0, 0, 0, 1, 1,
-0.4738532, 0.7420618, 0.2384466, 1, 1, 1, 1, 1,
-0.4665339, -0.2781333, -1.341766, 1, 1, 1, 1, 1,
-0.4646649, -0.2721346, -0.1929233, 1, 1, 1, 1, 1,
-0.4626449, 0.1759044, -2.542091, 1, 1, 1, 1, 1,
-0.4603252, 0.2777531, -3.065132, 1, 1, 1, 1, 1,
-0.4555323, 0.07658739, -1.06801, 1, 1, 1, 1, 1,
-0.446544, 0.5917087, 1.123242, 1, 1, 1, 1, 1,
-0.4464246, 0.471682, -1.836931, 1, 1, 1, 1, 1,
-0.4461133, -1.359322, -2.644799, 1, 1, 1, 1, 1,
-0.4456572, -1.147257, -1.089232, 1, 1, 1, 1, 1,
-0.438633, 1.052052, -0.588542, 1, 1, 1, 1, 1,
-0.4304486, 0.380165, 0.3647315, 1, 1, 1, 1, 1,
-0.4295459, 2.049541, -0.1676599, 1, 1, 1, 1, 1,
-0.4281884, -0.461543, -0.2322258, 1, 1, 1, 1, 1,
-0.4255981, 0.1711063, -1.341424, 1, 1, 1, 1, 1,
-0.4180482, 0.06062661, -0.3455277, 0, 0, 1, 1, 1,
-0.4102585, -0.4473554, -0.8039643, 1, 0, 0, 1, 1,
-0.4056623, 0.4742191, 0.9833531, 1, 0, 0, 1, 1,
-0.3997275, -0.0996218, -1.396548, 1, 0, 0, 1, 1,
-0.3966138, -0.2665437, -1.170865, 1, 0, 0, 1, 1,
-0.3953782, -1.044293, -3.466468, 1, 0, 0, 1, 1,
-0.3946988, -1.044876, -2.160365, 0, 0, 0, 1, 1,
-0.3916273, -0.9602533, -3.332389, 0, 0, 0, 1, 1,
-0.3912401, 2.128759, -0.9815649, 0, 0, 0, 1, 1,
-0.3907707, 0.8697132, -1.325799, 0, 0, 0, 1, 1,
-0.3870411, -1.330958, -2.456661, 0, 0, 0, 1, 1,
-0.3865843, -0.004691533, -1.993742, 0, 0, 0, 1, 1,
-0.3858162, 0.110251, -1.223435, 0, 0, 0, 1, 1,
-0.3853253, -0.6351138, -3.21559, 1, 1, 1, 1, 1,
-0.3851237, -0.8098462, -3.148198, 1, 1, 1, 1, 1,
-0.3840028, -0.4875049, -2.86878, 1, 1, 1, 1, 1,
-0.3814099, 0.8685754, -2.333099, 1, 1, 1, 1, 1,
-0.3808007, 0.003567555, -0.7768387, 1, 1, 1, 1, 1,
-0.3766797, -1.129507, -3.497168, 1, 1, 1, 1, 1,
-0.3740706, -0.01007376, -2.227495, 1, 1, 1, 1, 1,
-0.3680041, -1.535547, -2.378061, 1, 1, 1, 1, 1,
-0.3664493, 0.9901925, 0.2330108, 1, 1, 1, 1, 1,
-0.3590926, 0.716099, 0.1583428, 1, 1, 1, 1, 1,
-0.3579755, 1.179653, -1.641833, 1, 1, 1, 1, 1,
-0.3563946, -1.686608, -3.425297, 1, 1, 1, 1, 1,
-0.3549958, 1.6134, 0.4165024, 1, 1, 1, 1, 1,
-0.354194, -0.1639629, -1.538263, 1, 1, 1, 1, 1,
-0.3525544, 0.7780457, -1.138693, 1, 1, 1, 1, 1,
-0.3521621, 1.513238, 0.2372483, 0, 0, 1, 1, 1,
-0.3485587, -0.7258224, -3.172291, 1, 0, 0, 1, 1,
-0.3481042, -0.5074992, -3.176454, 1, 0, 0, 1, 1,
-0.3466421, -1.244125, -3.291367, 1, 0, 0, 1, 1,
-0.3421423, 0.5257661, -1.715498, 1, 0, 0, 1, 1,
-0.3415962, 0.8481482, 1.727973, 1, 0, 0, 1, 1,
-0.3386477, -0.871403, -3.091858, 0, 0, 0, 1, 1,
-0.3342392, 0.9942513, 0.3015647, 0, 0, 0, 1, 1,
-0.3337231, 0.4175608, 1.131613, 0, 0, 0, 1, 1,
-0.3325351, -0.7529954, -1.575725, 0, 0, 0, 1, 1,
-0.3289174, -1.252152, -3.667409, 0, 0, 0, 1, 1,
-0.3276377, -1.091842, -2.860337, 0, 0, 0, 1, 1,
-0.3257183, 0.6241749, -1.289688, 0, 0, 0, 1, 1,
-0.3216561, -1.215129, -0.7988242, 1, 1, 1, 1, 1,
-0.314673, -0.6668844, -2.847469, 1, 1, 1, 1, 1,
-0.3134326, 0.2539387, -1.625093, 1, 1, 1, 1, 1,
-0.3093818, -0.2089868, -0.971473, 1, 1, 1, 1, 1,
-0.3027628, 0.8151973, -0.4103369, 1, 1, 1, 1, 1,
-0.2971077, -0.0340825, -4.064219, 1, 1, 1, 1, 1,
-0.2884443, -2.377024, -4.744304, 1, 1, 1, 1, 1,
-0.288408, 0.08353403, -1.491094, 1, 1, 1, 1, 1,
-0.2866966, 1.643687, -1.835079, 1, 1, 1, 1, 1,
-0.2826334, -0.2352837, -1.242303, 1, 1, 1, 1, 1,
-0.2797762, -1.101683, -3.193071, 1, 1, 1, 1, 1,
-0.2786336, 0.4764288, -0.110516, 1, 1, 1, 1, 1,
-0.2785381, -1.553241, -1.117845, 1, 1, 1, 1, 1,
-0.2778509, 1.845897, -0.6873294, 1, 1, 1, 1, 1,
-0.2708976, 0.8935707, 0.3737611, 1, 1, 1, 1, 1,
-0.2686155, 0.6318648, -1.516258, 0, 0, 1, 1, 1,
-0.267566, -0.8795033, -2.903488, 1, 0, 0, 1, 1,
-0.2661642, -0.6828676, -3.526377, 1, 0, 0, 1, 1,
-0.2616407, 0.3952634, 0.88178, 1, 0, 0, 1, 1,
-0.2521766, -0.3923452, -1.959371, 1, 0, 0, 1, 1,
-0.2513076, 0.003639029, -2.556325, 1, 0, 0, 1, 1,
-0.2500944, 0.3516337, 0.3839387, 0, 0, 0, 1, 1,
-0.2491551, -0.5513198, -1.983759, 0, 0, 0, 1, 1,
-0.2435414, -0.5150274, -1.728433, 0, 0, 0, 1, 1,
-0.2430011, -1.874003, -2.306112, 0, 0, 0, 1, 1,
-0.2429988, 0.2772682, 0.2429212, 0, 0, 0, 1, 1,
-0.2347434, 0.7217242, 0.7722195, 0, 0, 0, 1, 1,
-0.2330911, 0.3370996, -0.980218, 0, 0, 0, 1, 1,
-0.2319259, -1.352597, -1.04559, 1, 1, 1, 1, 1,
-0.2180434, 1.127027, -0.8204966, 1, 1, 1, 1, 1,
-0.2073793, -1.905308, -4.207899, 1, 1, 1, 1, 1,
-0.2051222, -0.7784404, -3.000575, 1, 1, 1, 1, 1,
-0.2039706, 1.325938, -1.411947, 1, 1, 1, 1, 1,
-0.2011055, -0.0748119, -4.424376, 1, 1, 1, 1, 1,
-0.1988568, -1.052747, -2.94381, 1, 1, 1, 1, 1,
-0.1928062, 0.1994524, -1.381515, 1, 1, 1, 1, 1,
-0.1927741, 0.5558882, 0.1121066, 1, 1, 1, 1, 1,
-0.190636, -0.8337832, -1.615022, 1, 1, 1, 1, 1,
-0.1890462, -0.6257128, -2.324663, 1, 1, 1, 1, 1,
-0.1873756, -1.224845, -3.099717, 1, 1, 1, 1, 1,
-0.1868381, -1.099917, -5.186654, 1, 1, 1, 1, 1,
-0.1865603, 0.658998, -0.7479821, 1, 1, 1, 1, 1,
-0.1854804, -0.6746114, -2.575716, 1, 1, 1, 1, 1,
-0.1834263, -0.4597046, -2.819716, 0, 0, 1, 1, 1,
-0.1819122, 1.661419, -0.3363876, 1, 0, 0, 1, 1,
-0.1768407, 0.03857253, -1.356138, 1, 0, 0, 1, 1,
-0.1766586, -1.01597, -1.833775, 1, 0, 0, 1, 1,
-0.1766142, -0.007782081, -0.4670533, 1, 0, 0, 1, 1,
-0.1755743, -0.1160239, -2.133775, 1, 0, 0, 1, 1,
-0.1732198, 1.823877, -1.409256, 0, 0, 0, 1, 1,
-0.1670487, 1.009502, -0.3345882, 0, 0, 0, 1, 1,
-0.1652133, -1.754244, -2.124266, 0, 0, 0, 1, 1,
-0.1645032, -0.07653264, -1.473829, 0, 0, 0, 1, 1,
-0.1638338, -1.052022, -5.339107, 0, 0, 0, 1, 1,
-0.1566225, 0.2295859, -1.401275, 0, 0, 0, 1, 1,
-0.1468701, -0.5300298, -5.549191, 0, 0, 0, 1, 1,
-0.1353312, -1.997286, -1.610235, 1, 1, 1, 1, 1,
-0.1348936, 1.428751, 0.4682044, 1, 1, 1, 1, 1,
-0.1281638, -0.1350085, -1.022392, 1, 1, 1, 1, 1,
-0.1278422, 0.1131241, -2.380567, 1, 1, 1, 1, 1,
-0.1232547, 0.4390602, -0.1996139, 1, 1, 1, 1, 1,
-0.1224875, 0.4647108, 0.1469805, 1, 1, 1, 1, 1,
-0.122435, 0.7643769, 0.6638323, 1, 1, 1, 1, 1,
-0.1220476, -0.3272426, -2.717669, 1, 1, 1, 1, 1,
-0.1217501, -1.9323, -1.345424, 1, 1, 1, 1, 1,
-0.111509, -0.9191259, -1.954208, 1, 1, 1, 1, 1,
-0.1082699, -0.6952249, -3.227778, 1, 1, 1, 1, 1,
-0.1081817, 0.4074597, -1.165895, 1, 1, 1, 1, 1,
-0.1064755, 0.08871243, -0.3207934, 1, 1, 1, 1, 1,
-0.1059803, 1.028728, 0.17503, 1, 1, 1, 1, 1,
-0.1047888, 0.2677804, 0.8139401, 1, 1, 1, 1, 1,
-0.100473, 0.3144475, 0.9312239, 0, 0, 1, 1, 1,
-0.09848575, -0.8400413, -4.002818, 1, 0, 0, 1, 1,
-0.09708451, 0.3307131, -1.015419, 1, 0, 0, 1, 1,
-0.09564291, 0.6422254, -0.2532616, 1, 0, 0, 1, 1,
-0.09267606, 0.6686489, -0.8217583, 1, 0, 0, 1, 1,
-0.08892614, 1.419454, 1.049018, 1, 0, 0, 1, 1,
-0.08728432, -1.149355, -3.008419, 0, 0, 0, 1, 1,
-0.08326027, 0.7608137, 0.6900319, 0, 0, 0, 1, 1,
-0.08095591, 1.430473, 1.790986, 0, 0, 0, 1, 1,
-0.08015508, 0.5950468, -0.5286977, 0, 0, 0, 1, 1,
-0.07905516, 0.4488039, -0.1736939, 0, 0, 0, 1, 1,
-0.07715777, 0.2212664, -0.606442, 0, 0, 0, 1, 1,
-0.07642668, 0.9665517, 0.5626143, 0, 0, 0, 1, 1,
-0.0718883, -0.1655854, -3.656902, 1, 1, 1, 1, 1,
-0.07160485, -0.735491, -2.753695, 1, 1, 1, 1, 1,
-0.06248225, -1.902117, -2.589188, 1, 1, 1, 1, 1,
-0.05760056, 0.6911675, -0.5703328, 1, 1, 1, 1, 1,
-0.05521835, -0.2836182, -2.912842, 1, 1, 1, 1, 1,
-0.05447808, 0.2912985, -0.5041267, 1, 1, 1, 1, 1,
-0.05346897, -0.5192719, -2.714171, 1, 1, 1, 1, 1,
-0.05328131, -0.07158781, -3.222744, 1, 1, 1, 1, 1,
-0.05140579, -0.9430628, -3.283568, 1, 1, 1, 1, 1,
-0.05100132, 0.2672541, 1.04319, 1, 1, 1, 1, 1,
-0.0474608, -1.483932, -5.254527, 1, 1, 1, 1, 1,
-0.04243684, 0.7904449, 1.13647, 1, 1, 1, 1, 1,
-0.04225518, -0.376975, -3.339991, 1, 1, 1, 1, 1,
-0.03977053, -0.4171269, -2.610558, 1, 1, 1, 1, 1,
-0.03778801, -0.4498665, -4.312829, 1, 1, 1, 1, 1,
-0.03326462, 0.1395783, -0.8032699, 0, 0, 1, 1, 1,
-0.03249596, -1.174208, -3.11547, 1, 0, 0, 1, 1,
-0.03197457, 0.7844041, 2.257419, 1, 0, 0, 1, 1,
-0.03039812, -0.9845247, -2.695254, 1, 0, 0, 1, 1,
-0.02920713, -0.4927234, -4.018248, 1, 0, 0, 1, 1,
-0.02884611, -2.205451, -4.990544, 1, 0, 0, 1, 1,
-0.02700088, -1.470813, -2.332969, 0, 0, 0, 1, 1,
-0.0266427, 1.504954, -1.446441, 0, 0, 0, 1, 1,
-0.02139287, 1.099354, 0.5913609, 0, 0, 0, 1, 1,
-0.02136474, 0.1172879, -0.4656503, 0, 0, 0, 1, 1,
-0.01924421, 0.3312, 0.3032553, 0, 0, 0, 1, 1,
-0.01749462, -1.161757, -3.383034, 0, 0, 0, 1, 1,
-0.01447802, 1.102614, -0.4887304, 0, 0, 0, 1, 1,
-0.01172617, -0.3391342, -2.028151, 1, 1, 1, 1, 1,
-0.01057782, 0.3752367, -0.810205, 1, 1, 1, 1, 1,
-0.01014426, 0.406726, 1.599196, 1, 1, 1, 1, 1,
-0.01005094, -1.148922, -2.342444, 1, 1, 1, 1, 1,
-0.009077824, 0.2916401, -1.426815, 1, 1, 1, 1, 1,
-0.008302714, -1.638558, -2.842937, 1, 1, 1, 1, 1,
-0.006506663, -0.6347098, -3.193224, 1, 1, 1, 1, 1,
-0.003462943, 3.505515, -0.983016, 1, 1, 1, 1, 1,
0.0008000483, 0.297305, 0.3828528, 1, 1, 1, 1, 1,
0.004085734, -0.5117755, 1.467059, 1, 1, 1, 1, 1,
0.005052296, 0.4885929, 0.5360021, 1, 1, 1, 1, 1,
0.005738602, -0.95126, 3.76685, 1, 1, 1, 1, 1,
0.005811567, 1.234329, -0.7473421, 1, 1, 1, 1, 1,
0.01847816, 0.6690465, -0.9795975, 1, 1, 1, 1, 1,
0.02150022, -0.9346912, 2.224609, 1, 1, 1, 1, 1,
0.02487701, -0.2951567, 2.788003, 0, 0, 1, 1, 1,
0.0264135, -0.7066209, 2.544978, 1, 0, 0, 1, 1,
0.02838687, 0.5581619, 1.052625, 1, 0, 0, 1, 1,
0.02859278, -1.035075, 1.869892, 1, 0, 0, 1, 1,
0.0301891, -1.760143, 3.156005, 1, 0, 0, 1, 1,
0.03046292, 0.2254581, 0.1336238, 1, 0, 0, 1, 1,
0.03225821, 1.271802, -1.799194, 0, 0, 0, 1, 1,
0.03403981, -0.4119292, 1.85004, 0, 0, 0, 1, 1,
0.03608612, -0.404302, 4.157843, 0, 0, 0, 1, 1,
0.0403221, 1.101747, 0.3841222, 0, 0, 0, 1, 1,
0.04205517, 0.002079657, 1.780121, 0, 0, 0, 1, 1,
0.04303101, 0.1344709, 0.9128085, 0, 0, 0, 1, 1,
0.04304333, -0.06807335, 1.364048, 0, 0, 0, 1, 1,
0.04469699, 1.034228, 0.02966962, 1, 1, 1, 1, 1,
0.04857837, -0.8049492, 2.89224, 1, 1, 1, 1, 1,
0.05430124, 2.106065, 0.1090162, 1, 1, 1, 1, 1,
0.05553456, 0.4797703, -0.3708584, 1, 1, 1, 1, 1,
0.05681289, 0.06980433, -0.1104452, 1, 1, 1, 1, 1,
0.05882553, 0.4312907, 0.2200084, 1, 1, 1, 1, 1,
0.06441817, -0.2062382, 4.21043, 1, 1, 1, 1, 1,
0.06686638, 0.2825138, 1.181484, 1, 1, 1, 1, 1,
0.07245391, 1.643271, -0.0983509, 1, 1, 1, 1, 1,
0.07433318, -0.9845835, 2.759621, 1, 1, 1, 1, 1,
0.07532133, 0.3962628, 0.3699429, 1, 1, 1, 1, 1,
0.0762459, -0.0301273, 1.572514, 1, 1, 1, 1, 1,
0.07735384, -0.1451719, 3.152699, 1, 1, 1, 1, 1,
0.07769353, -0.7656799, 3.107387, 1, 1, 1, 1, 1,
0.07834104, -1.663056, 2.348098, 1, 1, 1, 1, 1,
0.08023887, -0.1433377, 3.001217, 0, 0, 1, 1, 1,
0.08111215, 0.1759641, -0.736646, 1, 0, 0, 1, 1,
0.08134355, 0.3709808, -0.2137253, 1, 0, 0, 1, 1,
0.08249504, 1.277183, 0.1725214, 1, 0, 0, 1, 1,
0.08443587, -0.5519721, 2.492178, 1, 0, 0, 1, 1,
0.08460323, 0.05025594, 0.3644695, 1, 0, 0, 1, 1,
0.0850943, 0.3888663, 0.6891506, 0, 0, 0, 1, 1,
0.08663604, 0.134064, 1.497569, 0, 0, 0, 1, 1,
0.08819732, 0.4195454, -0.2154416, 0, 0, 0, 1, 1,
0.08926568, 1.842551, 0.3955419, 0, 0, 0, 1, 1,
0.08934405, -0.379696, 1.834027, 0, 0, 0, 1, 1,
0.09070152, -0.02886383, 1.525124, 0, 0, 0, 1, 1,
0.09196907, 0.1420419, 0.1979189, 0, 0, 0, 1, 1,
0.0942172, 0.3065175, 1.612418, 1, 1, 1, 1, 1,
0.09446307, 0.4036347, 1.092511, 1, 1, 1, 1, 1,
0.09785348, -0.7152833, 1.577697, 1, 1, 1, 1, 1,
0.09851093, -1.224927, 3.747425, 1, 1, 1, 1, 1,
0.1014286, -0.1603157, 0.9164881, 1, 1, 1, 1, 1,
0.103362, -0.346694, 3.850249, 1, 1, 1, 1, 1,
0.1064406, -0.08864999, 1.885181, 1, 1, 1, 1, 1,
0.1072805, 0.2530096, -0.3760222, 1, 1, 1, 1, 1,
0.1073734, 0.2252244, 1.124725, 1, 1, 1, 1, 1,
0.1094691, 1.993243, 0.2969212, 1, 1, 1, 1, 1,
0.1126805, 1.555441, 0.06420427, 1, 1, 1, 1, 1,
0.1132861, -1.104706, 0.8288447, 1, 1, 1, 1, 1,
0.1223813, 0.7650607, 0.3404508, 1, 1, 1, 1, 1,
0.1226769, -1.545811, 4.309971, 1, 1, 1, 1, 1,
0.1240278, 0.3214705, 0.1713911, 1, 1, 1, 1, 1,
0.1264593, -1.355874, 2.594323, 0, 0, 1, 1, 1,
0.1275747, -1.036355, 3.709897, 1, 0, 0, 1, 1,
0.1352451, 0.1123397, 0.6481863, 1, 0, 0, 1, 1,
0.1354817, -0.444462, 3.477148, 1, 0, 0, 1, 1,
0.1361026, -0.07771961, 2.597598, 1, 0, 0, 1, 1,
0.1375463, -0.3435757, 1.937111, 1, 0, 0, 1, 1,
0.1420425, 1.962677, 0.1737357, 0, 0, 0, 1, 1,
0.1443131, -0.522078, 2.34787, 0, 0, 0, 1, 1,
0.1450446, -1.787687, 3.344613, 0, 0, 0, 1, 1,
0.147096, 2.195684, 0.2323774, 0, 0, 0, 1, 1,
0.1475201, -0.7439647, 1.009978, 0, 0, 0, 1, 1,
0.1480504, -0.6264047, 3.084065, 0, 0, 0, 1, 1,
0.1494594, -0.1924699, 1.745225, 0, 0, 0, 1, 1,
0.1502665, 0.07474204, 2.02718, 1, 1, 1, 1, 1,
0.1531831, -0.760308, 2.602531, 1, 1, 1, 1, 1,
0.1553242, -1.325823, 3.431543, 1, 1, 1, 1, 1,
0.1632927, 0.3116256, -0.3997005, 1, 1, 1, 1, 1,
0.1633777, 0.406503, -0.5915091, 1, 1, 1, 1, 1,
0.165276, -0.8877296, 2.769157, 1, 1, 1, 1, 1,
0.1701679, -0.7640547, 3.483012, 1, 1, 1, 1, 1,
0.1735949, -2.993768, 3.553556, 1, 1, 1, 1, 1,
0.1743695, 1.204935, 1.287004, 1, 1, 1, 1, 1,
0.1800636, -0.5110511, 3.180683, 1, 1, 1, 1, 1,
0.1933258, -0.4189985, 2.825735, 1, 1, 1, 1, 1,
0.1943305, 0.9740289, 0.3174195, 1, 1, 1, 1, 1,
0.201666, 0.3357905, 0.2337718, 1, 1, 1, 1, 1,
0.2048449, -0.1670283, 1.626171, 1, 1, 1, 1, 1,
0.207343, -1.666594, 2.174483, 1, 1, 1, 1, 1,
0.2092859, -0.8919045, 3.195712, 0, 0, 1, 1, 1,
0.2105149, -0.8991436, 2.692669, 1, 0, 0, 1, 1,
0.2139354, -2.672064, 1.247306, 1, 0, 0, 1, 1,
0.2154373, 0.3407348, -0.2418824, 1, 0, 0, 1, 1,
0.2191439, 0.7243399, -0.8951698, 1, 0, 0, 1, 1,
0.2210587, -1.709474, 3.080748, 1, 0, 0, 1, 1,
0.2240275, -1.037089, 2.434954, 0, 0, 0, 1, 1,
0.2251882, 0.6735392, 0.7672926, 0, 0, 0, 1, 1,
0.2260633, 1.055485, 0.06078915, 0, 0, 0, 1, 1,
0.2262724, 2.392055, 0.9513353, 0, 0, 0, 1, 1,
0.2283103, 0.24982, 2.310109, 0, 0, 0, 1, 1,
0.2295075, 0.500394, -0.720216, 0, 0, 0, 1, 1,
0.2420873, 2.59105, 1.320931, 0, 0, 0, 1, 1,
0.242291, -1.861721, 3.373159, 1, 1, 1, 1, 1,
0.2460275, 1.817255, -0.04274257, 1, 1, 1, 1, 1,
0.2469198, -0.571685, 1.292341, 1, 1, 1, 1, 1,
0.2490084, -0.6098923, 3.338586, 1, 1, 1, 1, 1,
0.2496412, -0.8374571, 4.15753, 1, 1, 1, 1, 1,
0.2496427, 0.4218212, 0.2452469, 1, 1, 1, 1, 1,
0.2524729, 0.04814919, 0.1019503, 1, 1, 1, 1, 1,
0.2547359, 1.123884, 0.453299, 1, 1, 1, 1, 1,
0.2558707, -1.770584, 3.502784, 1, 1, 1, 1, 1,
0.2633052, -0.4662386, 2.570055, 1, 1, 1, 1, 1,
0.2680889, 0.5046076, -0.6032662, 1, 1, 1, 1, 1,
0.2687887, -0.7662197, 3.26057, 1, 1, 1, 1, 1,
0.2713923, 0.9014792, 2.023971, 1, 1, 1, 1, 1,
0.2727156, -0.8238627, 3.088488, 1, 1, 1, 1, 1,
0.2737422, 0.1330861, 1.733131, 1, 1, 1, 1, 1,
0.2761109, 1.271646, -0.1677151, 0, 0, 1, 1, 1,
0.282303, -1.771526, 2.831609, 1, 0, 0, 1, 1,
0.2847601, -0.4643998, 3.813756, 1, 0, 0, 1, 1,
0.2870473, -1.05066, 2.448597, 1, 0, 0, 1, 1,
0.2922489, -0.2285641, 1.955841, 1, 0, 0, 1, 1,
0.2924741, 0.1318697, 1.548242, 1, 0, 0, 1, 1,
0.295882, -0.2616767, 1.796841, 0, 0, 0, 1, 1,
0.3064008, 1.019198, 0.8571596, 0, 0, 0, 1, 1,
0.3079773, 0.1072518, 1.726987, 0, 0, 0, 1, 1,
0.3090734, -1.338668, 4.03842, 0, 0, 0, 1, 1,
0.316116, -1.833929, 2.743237, 0, 0, 0, 1, 1,
0.3178715, -0.2590176, 1.102666, 0, 0, 0, 1, 1,
0.324913, 0.2160235, 1.150783, 0, 0, 0, 1, 1,
0.325521, -1.116169, 3.658931, 1, 1, 1, 1, 1,
0.3330297, -1.15051, 0.8411812, 1, 1, 1, 1, 1,
0.3369095, 0.6324875, -1.5045, 1, 1, 1, 1, 1,
0.3432096, -0.1607982, 2.490003, 1, 1, 1, 1, 1,
0.3435136, -2.42769, 3.958555, 1, 1, 1, 1, 1,
0.3454639, -0.7633142, 2.844513, 1, 1, 1, 1, 1,
0.3472872, 2.592952, 0.109522, 1, 1, 1, 1, 1,
0.3503437, -1.022963, 1.886635, 1, 1, 1, 1, 1,
0.3511188, 0.7733441, 1.30387, 1, 1, 1, 1, 1,
0.3523701, 1.146365, -0.0683274, 1, 1, 1, 1, 1,
0.3586929, 0.2714562, 2.041714, 1, 1, 1, 1, 1,
0.3587587, 1.559809, -0.2747065, 1, 1, 1, 1, 1,
0.360184, 1.498976, 0.3926281, 1, 1, 1, 1, 1,
0.3654453, -0.4050912, 1.207123, 1, 1, 1, 1, 1,
0.3666601, 0.7495537, 1.227713, 1, 1, 1, 1, 1,
0.3681624, 0.3009745, 0.3506855, 0, 0, 1, 1, 1,
0.3686514, 0.404916, 0.2717169, 1, 0, 0, 1, 1,
0.3688009, -0.5114394, 1.381209, 1, 0, 0, 1, 1,
0.3714204, -0.3659421, 3.056204, 1, 0, 0, 1, 1,
0.3726466, -0.06523993, 1.526392, 1, 0, 0, 1, 1,
0.3733947, -0.1508999, 1.847865, 1, 0, 0, 1, 1,
0.3737952, -0.6814445, 2.216624, 0, 0, 0, 1, 1,
0.3745456, 1.660604, 0.07283445, 0, 0, 0, 1, 1,
0.377584, -0.1119099, 1.767295, 0, 0, 0, 1, 1,
0.3810279, 1.869376, -0.8859558, 0, 0, 0, 1, 1,
0.3818424, 0.3029949, 1.352877, 0, 0, 0, 1, 1,
0.3840067, 0.4455252, 0.05014766, 0, 0, 0, 1, 1,
0.3925306, 0.1330654, 1.362724, 0, 0, 0, 1, 1,
0.3931685, -0.5211131, 3.190013, 1, 1, 1, 1, 1,
0.39338, -1.21382, 0.9230173, 1, 1, 1, 1, 1,
0.3977467, 2.468914, -0.6625816, 1, 1, 1, 1, 1,
0.39818, 1.511696, -2.303388, 1, 1, 1, 1, 1,
0.3990353, -0.6087567, 2.880528, 1, 1, 1, 1, 1,
0.4009646, 0.01341812, 2.763753, 1, 1, 1, 1, 1,
0.4013695, 0.193924, 1.612279, 1, 1, 1, 1, 1,
0.404882, -1.124024, 2.473703, 1, 1, 1, 1, 1,
0.4078251, -2.860513, 3.102422, 1, 1, 1, 1, 1,
0.4141627, -0.1243296, 2.289886, 1, 1, 1, 1, 1,
0.4155698, 0.4332166, 0.1672843, 1, 1, 1, 1, 1,
0.4190306, 0.345382, 0.0547924, 1, 1, 1, 1, 1,
0.4201109, 0.2986031, 1.089708, 1, 1, 1, 1, 1,
0.4215223, -0.3671475, 2.484501, 1, 1, 1, 1, 1,
0.4216233, -0.9502986, 3.516444, 1, 1, 1, 1, 1,
0.4316552, 1.327508, 1.635433, 0, 0, 1, 1, 1,
0.4320399, 0.8258151, -1.271499, 1, 0, 0, 1, 1,
0.4346273, 0.5063637, -0.7067816, 1, 0, 0, 1, 1,
0.4402691, 1.365736, 0.9602441, 1, 0, 0, 1, 1,
0.4412692, 1.403932, 0.2875207, 1, 0, 0, 1, 1,
0.4443244, 0.7526819, 1.36704, 1, 0, 0, 1, 1,
0.4514041, -0.03929605, 1.630434, 0, 0, 0, 1, 1,
0.4531982, 1.147903, 1.137022, 0, 0, 0, 1, 1,
0.4537251, -0.1379647, 1.09041, 0, 0, 0, 1, 1,
0.4566582, -0.6090558, 2.39025, 0, 0, 0, 1, 1,
0.4609859, -0.7178196, 2.447509, 0, 0, 0, 1, 1,
0.4721596, 1.513892, -0.1626523, 0, 0, 0, 1, 1,
0.477959, -2.033235, 1.295391, 0, 0, 0, 1, 1,
0.4786644, -0.6189097, 0.7831727, 1, 1, 1, 1, 1,
0.4792872, -1.196569, 2.617326, 1, 1, 1, 1, 1,
0.4821694, -1.096576, 2.8137, 1, 1, 1, 1, 1,
0.4853796, 0.7928399, -0.6671336, 1, 1, 1, 1, 1,
0.486809, 1.194863, -0.53465, 1, 1, 1, 1, 1,
0.4889523, 0.3666232, -0.1445018, 1, 1, 1, 1, 1,
0.489006, 0.03589087, 1.8148, 1, 1, 1, 1, 1,
0.4906301, 0.6512464, -0.9071643, 1, 1, 1, 1, 1,
0.4926159, -0.2537495, 2.262482, 1, 1, 1, 1, 1,
0.499844, -1.862208, 3.054814, 1, 1, 1, 1, 1,
0.5007648, -0.9960923, 2.370147, 1, 1, 1, 1, 1,
0.5077838, 0.8332299, 1.262459, 1, 1, 1, 1, 1,
0.509874, -0.1616676, 3.546323, 1, 1, 1, 1, 1,
0.5124902, 2.956757, 1.238708, 1, 1, 1, 1, 1,
0.5164053, 0.991849, 1.344041, 1, 1, 1, 1, 1,
0.5172169, -0.84592, 3.442565, 0, 0, 1, 1, 1,
0.5181255, -0.6665562, 2.989018, 1, 0, 0, 1, 1,
0.5193801, 0.142337, 1.88079, 1, 0, 0, 1, 1,
0.5197413, -0.08517195, 2.278163, 1, 0, 0, 1, 1,
0.5242227, -0.9549711, 0.7293298, 1, 0, 0, 1, 1,
0.5277932, -1.32552, 3.352242, 1, 0, 0, 1, 1,
0.5292859, 0.9863012, 1.458232, 0, 0, 0, 1, 1,
0.5320755, -0.6517354, 2.111168, 0, 0, 0, 1, 1,
0.5338464, 0.3240396, 1.720443, 0, 0, 0, 1, 1,
0.5341003, -0.3639918, 2.671759, 0, 0, 0, 1, 1,
0.5375154, -0.8267018, 2.15441, 0, 0, 0, 1, 1,
0.5412469, -2.243124, 4.185578, 0, 0, 0, 1, 1,
0.5424038, -0.1874884, 2.528864, 0, 0, 0, 1, 1,
0.5445743, 0.4285341, 2.395095, 1, 1, 1, 1, 1,
0.5495583, -1.164486, 1.383331, 1, 1, 1, 1, 1,
0.5504619, -0.6315035, -0.4873857, 1, 1, 1, 1, 1,
0.552423, 0.2898437, 2.100304, 1, 1, 1, 1, 1,
0.5556198, -0.02281795, 0.6902249, 1, 1, 1, 1, 1,
0.5646855, 0.09307879, 1.026305, 1, 1, 1, 1, 1,
0.5648957, -0.8555093, 2.700453, 1, 1, 1, 1, 1,
0.5654855, -0.5369204, 4.742501, 1, 1, 1, 1, 1,
0.5659451, -1.804694, 1.994504, 1, 1, 1, 1, 1,
0.5673645, -0.2233085, 2.080393, 1, 1, 1, 1, 1,
0.5675238, -0.4022325, 0.9643431, 1, 1, 1, 1, 1,
0.5676401, 1.708322, -0.5324127, 1, 1, 1, 1, 1,
0.5680664, 0.3479906, 2.227573, 1, 1, 1, 1, 1,
0.5698965, -0.7931579, 2.55346, 1, 1, 1, 1, 1,
0.5700938, -1.316493, 1.282396, 1, 1, 1, 1, 1,
0.5720491, 0.06301044, 1.931448, 0, 0, 1, 1, 1,
0.5721849, 0.4222673, -0.1863057, 1, 0, 0, 1, 1,
0.5744128, 1.001351, 1.040546, 1, 0, 0, 1, 1,
0.5760843, 1.064468, 0.3745043, 1, 0, 0, 1, 1,
0.5762116, -0.2885783, 1.727229, 1, 0, 0, 1, 1,
0.5811027, -0.522233, 0.9446874, 1, 0, 0, 1, 1,
0.5822788, -1.314142, 3.85246, 0, 0, 0, 1, 1,
0.5831379, 0.9343166, -0.002660418, 0, 0, 0, 1, 1,
0.5840057, 1.821497, 1.047451, 0, 0, 0, 1, 1,
0.5844486, 0.331531, 0.4097957, 0, 0, 0, 1, 1,
0.5866343, 1.555792, 0.2037574, 0, 0, 0, 1, 1,
0.5878872, 0.1671194, 1.127754, 0, 0, 0, 1, 1,
0.5913973, -0.3404751, 2.664378, 0, 0, 0, 1, 1,
0.5922717, -0.05577085, 1.543986, 1, 1, 1, 1, 1,
0.59431, 1.021484, 0.7039894, 1, 1, 1, 1, 1,
0.6016712, -0.9340832, 3.930282, 1, 1, 1, 1, 1,
0.6047794, -0.1027601, 3.914161, 1, 1, 1, 1, 1,
0.6053124, -0.129726, 2.784495, 1, 1, 1, 1, 1,
0.6085221, 0.609505, 1.033398, 1, 1, 1, 1, 1,
0.6110585, -1.599692, 3.772174, 1, 1, 1, 1, 1,
0.6146604, 1.256369, 1.240786, 1, 1, 1, 1, 1,
0.6191766, 0.268218, 1.869021, 1, 1, 1, 1, 1,
0.6204969, 0.0793988, -0.10841, 1, 1, 1, 1, 1,
0.6252235, -0.6585809, 2.610665, 1, 1, 1, 1, 1,
0.627942, -0.7602701, 3.66938, 1, 1, 1, 1, 1,
0.6317447, -0.5474547, 2.608699, 1, 1, 1, 1, 1,
0.63879, 0.4097857, -0.2288377, 1, 1, 1, 1, 1,
0.6392618, 0.9644045, 0.5712367, 1, 1, 1, 1, 1,
0.6448151, 1.377954, -0.6008884, 0, 0, 1, 1, 1,
0.6464539, -0.02916857, 1.983029, 1, 0, 0, 1, 1,
0.6518711, -2.297915, 4.083495, 1, 0, 0, 1, 1,
0.6618434, -1.148332, 2.032767, 1, 0, 0, 1, 1,
0.6630056, 0.7621881, 0.6648806, 1, 0, 0, 1, 1,
0.665917, -1.441085, 2.185971, 1, 0, 0, 1, 1,
0.6697502, 0.948114, 1.129169, 0, 0, 0, 1, 1,
0.6785136, 0.510695, 0.4831761, 0, 0, 0, 1, 1,
0.6826137, -1.13043, 2.564919, 0, 0, 0, 1, 1,
0.68765, -0.4403384, 2.515432, 0, 0, 0, 1, 1,
0.7079428, 0.5467755, 0.9757352, 0, 0, 0, 1, 1,
0.7151431, 0.2473569, -0.05039134, 0, 0, 0, 1, 1,
0.7172002, 0.5027366, 0.3422847, 0, 0, 0, 1, 1,
0.7192828, 0.6874581, 0.6505623, 1, 1, 1, 1, 1,
0.7220711, 1.16615, -1.444322, 1, 1, 1, 1, 1,
0.7326744, 0.2823958, 1.103276, 1, 1, 1, 1, 1,
0.735373, 0.9448354, 1.121971, 1, 1, 1, 1, 1,
0.7373227, -0.4876735, 2.412053, 1, 1, 1, 1, 1,
0.7430245, -1.759403, 2.691256, 1, 1, 1, 1, 1,
0.7510832, -0.9256352, 2.647569, 1, 1, 1, 1, 1,
0.7518686, -0.07951348, 2.79439, 1, 1, 1, 1, 1,
0.7528257, 1.240366, 0.3435479, 1, 1, 1, 1, 1,
0.7625431, 0.7674945, -0.05391583, 1, 1, 1, 1, 1,
0.7671718, 1.103395, 1.131869, 1, 1, 1, 1, 1,
0.7677703, -1.811717, 3.60029, 1, 1, 1, 1, 1,
0.7759279, -0.4285161, 3.21925, 1, 1, 1, 1, 1,
0.7806884, -1.277372, 3.12975, 1, 1, 1, 1, 1,
0.7865473, -0.220878, 0.5330769, 1, 1, 1, 1, 1,
0.7883143, 0.0405615, 2.43846, 0, 0, 1, 1, 1,
0.7884769, 1.450901, -0.7680163, 1, 0, 0, 1, 1,
0.7902017, 0.8288658, 1.552551, 1, 0, 0, 1, 1,
0.7904096, 1.766867, 0.9232179, 1, 0, 0, 1, 1,
0.7937264, 0.254264, 0.363259, 1, 0, 0, 1, 1,
0.7939443, -0.7866406, 0.2292161, 1, 0, 0, 1, 1,
0.7981278, 0.1732869, 3.104969, 0, 0, 0, 1, 1,
0.8007544, 0.6714221, 2.122571, 0, 0, 0, 1, 1,
0.8042666, 2.7832, 1.215029, 0, 0, 0, 1, 1,
0.8063316, -1.906527, 3.838764, 0, 0, 0, 1, 1,
0.8071021, 1.846154, 0.220597, 0, 0, 0, 1, 1,
0.8088427, -1.284972, 3.702413, 0, 0, 0, 1, 1,
0.8089688, 1.121675, -1.136397, 0, 0, 0, 1, 1,
0.8097891, -0.7545147, 2.680711, 1, 1, 1, 1, 1,
0.8118382, 0.05562146, 1.360377, 1, 1, 1, 1, 1,
0.8150275, -0.5270239, 2.682085, 1, 1, 1, 1, 1,
0.8168777, 0.2183816, 1.422723, 1, 1, 1, 1, 1,
0.8187308, -1.750814, 3.558576, 1, 1, 1, 1, 1,
0.8207289, 0.9505862, 0.6796798, 1, 1, 1, 1, 1,
0.8226267, 0.3438617, 1.724291, 1, 1, 1, 1, 1,
0.835478, 1.54825, 0.8925983, 1, 1, 1, 1, 1,
0.83764, 1.193357, -0.07951365, 1, 1, 1, 1, 1,
0.8411015, -0.766759, 3.418358, 1, 1, 1, 1, 1,
0.8491459, 0.2620642, 1.445262, 1, 1, 1, 1, 1,
0.8499237, 0.1655753, 1.740326, 1, 1, 1, 1, 1,
0.8583909, 0.2968884, -0.1436335, 1, 1, 1, 1, 1,
0.8630766, -0.2788252, 0.1106765, 1, 1, 1, 1, 1,
0.8652427, 0.6540293, 1.570146, 1, 1, 1, 1, 1,
0.8722715, 0.4002682, 0.5290872, 0, 0, 1, 1, 1,
0.8723146, -0.5107116, 2.725236, 1, 0, 0, 1, 1,
0.8736043, 0.1262748, 1.546861, 1, 0, 0, 1, 1,
0.88133, -0.730866, 1.458447, 1, 0, 0, 1, 1,
0.8830218, 0.5592167, 0.09359752, 1, 0, 0, 1, 1,
0.8866649, 1.097461, 0.9834195, 1, 0, 0, 1, 1,
0.8878803, 1.301091, -0.6714943, 0, 0, 0, 1, 1,
0.8909162, -1.17298, 3.27998, 0, 0, 0, 1, 1,
0.8910148, 0.5601724, 0.594158, 0, 0, 0, 1, 1,
0.8990303, -0.826458, 2.394556, 0, 0, 0, 1, 1,
0.9021844, 0.2723522, 1.06878, 0, 0, 0, 1, 1,
0.9035493, 0.604407, 1.710751, 0, 0, 0, 1, 1,
0.9054171, 0.8321959, 1.248463, 0, 0, 0, 1, 1,
0.9074489, 1.40375, -0.7923462, 1, 1, 1, 1, 1,
0.907599, 1.043128, 2.749915, 1, 1, 1, 1, 1,
0.9093687, -2.897735, 1.563502, 1, 1, 1, 1, 1,
0.9101065, -0.02403785, 1.082114, 1, 1, 1, 1, 1,
0.9108424, 0.2248421, 0.9521388, 1, 1, 1, 1, 1,
0.9138042, 0.4942416, 0.9111192, 1, 1, 1, 1, 1,
0.9183663, 0.2851963, -0.4869022, 1, 1, 1, 1, 1,
0.9189363, 0.7353075, 2.484043, 1, 1, 1, 1, 1,
0.9205623, -0.2631402, 2.484288, 1, 1, 1, 1, 1,
0.9271696, -0.9576015, 2.000597, 1, 1, 1, 1, 1,
0.9312572, -0.7296636, 1.470265, 1, 1, 1, 1, 1,
0.9344733, 0.1494337, 1.766139, 1, 1, 1, 1, 1,
0.9359735, -1.094046, 2.62992, 1, 1, 1, 1, 1,
0.9394587, 2.473457, 0.3691665, 1, 1, 1, 1, 1,
0.9516961, -0.7072244, 1.736491, 1, 1, 1, 1, 1,
0.9554881, 0.9886096, 1.153573, 0, 0, 1, 1, 1,
0.9561594, -0.6179138, 2.647014, 1, 0, 0, 1, 1,
0.9634174, 0.7447528, 0.9349556, 1, 0, 0, 1, 1,
0.979133, 0.4179522, 1.190457, 1, 0, 0, 1, 1,
0.9878502, -1.138869, 2.218381, 1, 0, 0, 1, 1,
1.002396, 1.053875, 0.2378407, 1, 0, 0, 1, 1,
1.004097, -0.3220976, 2.133452, 0, 0, 0, 1, 1,
1.009248, 0.8743429, 2.279384, 0, 0, 0, 1, 1,
1.011651, 1.710769, 2.029166, 0, 0, 0, 1, 1,
1.019327, -0.732634, 2.529382, 0, 0, 0, 1, 1,
1.028177, 0.8367298, 0.8091311, 0, 0, 0, 1, 1,
1.028266, -0.3268219, 1.62433, 0, 0, 0, 1, 1,
1.031055, 0.5332446, 1.365751, 0, 0, 0, 1, 1,
1.035186, -1.197107, 3.472952, 1, 1, 1, 1, 1,
1.035959, 1.821154, 1.209903, 1, 1, 1, 1, 1,
1.040579, -1.007677, 1.927901, 1, 1, 1, 1, 1,
1.042999, 0.3838754, 1.322633, 1, 1, 1, 1, 1,
1.047969, -0.6522278, 1.040437, 1, 1, 1, 1, 1,
1.048837, -0.008144986, 1.785809, 1, 1, 1, 1, 1,
1.051831, 0.6923153, 1.249105, 1, 1, 1, 1, 1,
1.067343, 0.8318352, 1.239717, 1, 1, 1, 1, 1,
1.068177, -0.3529112, 2.804381, 1, 1, 1, 1, 1,
1.071076, 0.2791085, 3.40201, 1, 1, 1, 1, 1,
1.0716, 0.2745738, 0.7051674, 1, 1, 1, 1, 1,
1.072304, -1.856426, 1.569084, 1, 1, 1, 1, 1,
1.075047, -1.162032, 3.776547, 1, 1, 1, 1, 1,
1.076467, 0.319792, -0.2675048, 1, 1, 1, 1, 1,
1.090712, 0.1004826, -0.4679473, 1, 1, 1, 1, 1,
1.090827, -1.484201, 2.686857, 0, 0, 1, 1, 1,
1.093931, -0.01515392, 3.027755, 1, 0, 0, 1, 1,
1.095313, -0.4436917, 1.433791, 1, 0, 0, 1, 1,
1.100284, 1.31422, 0.3096751, 1, 0, 0, 1, 1,
1.101324, 0.4612751, 0.692327, 1, 0, 0, 1, 1,
1.107976, 0.252594, 1.86734, 1, 0, 0, 1, 1,
1.108114, 0.7553991, 1.943287, 0, 0, 0, 1, 1,
1.112154, -0.2449294, 1.678331, 0, 0, 0, 1, 1,
1.112722, -0.02497279, 1.218609, 0, 0, 0, 1, 1,
1.125734, 1.152202, 1.771903, 0, 0, 0, 1, 1,
1.12778, -0.9024994, 4.243825, 0, 0, 0, 1, 1,
1.128668, 0.4104347, 0.9929053, 0, 0, 0, 1, 1,
1.134733, -0.2889419, 1.936382, 0, 0, 0, 1, 1,
1.134988, -0.1445537, 2.234759, 1, 1, 1, 1, 1,
1.13965, 1.34098, -1.334156, 1, 1, 1, 1, 1,
1.144614, -0.650313, 1.230093, 1, 1, 1, 1, 1,
1.147089, 1.39608, 1.380123, 1, 1, 1, 1, 1,
1.167083, -1.660581, 1.011382, 1, 1, 1, 1, 1,
1.177347, 0.6276538, 1.789638, 1, 1, 1, 1, 1,
1.189922, -0.06987116, 1.697426, 1, 1, 1, 1, 1,
1.1913, 0.4989086, 1.188842, 1, 1, 1, 1, 1,
1.193683, 0.6407465, 0.7227998, 1, 1, 1, 1, 1,
1.200643, -0.8480254, 1.683906, 1, 1, 1, 1, 1,
1.203351, 0.536776, 1.51175, 1, 1, 1, 1, 1,
1.212924, -0.8612731, 2.005477, 1, 1, 1, 1, 1,
1.220895, 0.8794108, 2.587131, 1, 1, 1, 1, 1,
1.230038, -0.2367967, 0.7454248, 1, 1, 1, 1, 1,
1.242495, 0.4280821, 1.913873, 1, 1, 1, 1, 1,
1.249665, 0.1462127, -0.7236165, 0, 0, 1, 1, 1,
1.250522, 0.2376644, 1.725714, 1, 0, 0, 1, 1,
1.254201, 0.3732751, 0.1968236, 1, 0, 0, 1, 1,
1.257282, -0.57474, 2.35585, 1, 0, 0, 1, 1,
1.261598, 0.5184933, -0.3547181, 1, 0, 0, 1, 1,
1.261995, 0.407631, 1.709054, 1, 0, 0, 1, 1,
1.263144, 0.1006789, 2.834874, 0, 0, 0, 1, 1,
1.277166, 1.339209, -0.5037893, 0, 0, 0, 1, 1,
1.282203, 0.5458807, -0.3262173, 0, 0, 0, 1, 1,
1.293949, 1.029444, 0.5850102, 0, 0, 0, 1, 1,
1.296158, -0.01596171, 1.914991, 0, 0, 0, 1, 1,
1.298682, 0.5151045, 2.149612, 0, 0, 0, 1, 1,
1.29933, 0.04855829, 2.186696, 0, 0, 0, 1, 1,
1.300622, -0.5332021, 2.356595, 1, 1, 1, 1, 1,
1.300839, -2.041748, 2.153415, 1, 1, 1, 1, 1,
1.311119, 0.9442979, 1.054989, 1, 1, 1, 1, 1,
1.320943, -0.2875063, 2.225797, 1, 1, 1, 1, 1,
1.326121, 1.223027, 2.009559, 1, 1, 1, 1, 1,
1.333165, -1.382998, 1.829742, 1, 1, 1, 1, 1,
1.334905, -0.01798429, 1.689321, 1, 1, 1, 1, 1,
1.334952, -0.5780945, 1.713636, 1, 1, 1, 1, 1,
1.349249, -0.07857517, 4.067586, 1, 1, 1, 1, 1,
1.35543, -0.3715635, 2.783597, 1, 1, 1, 1, 1,
1.367328, 1.125317, 0.5805562, 1, 1, 1, 1, 1,
1.373448, 0.01643156, 1.727321, 1, 1, 1, 1, 1,
1.38859, 1.602879, 1.296829, 1, 1, 1, 1, 1,
1.395784, -0.7671288, 2.010508, 1, 1, 1, 1, 1,
1.398842, -0.7780179, 2.148691, 1, 1, 1, 1, 1,
1.412297, -0.8113773, 2.097751, 0, 0, 1, 1, 1,
1.432566, 0.7614833, 1.711093, 1, 0, 0, 1, 1,
1.436892, 2.666085, -0.3529316, 1, 0, 0, 1, 1,
1.442946, -0.2591329, 0.7146193, 1, 0, 0, 1, 1,
1.449708, -0.4994235, 2.498812, 1, 0, 0, 1, 1,
1.455757, -1.505122, 1.557578, 1, 0, 0, 1, 1,
1.462911, -0.9777048, 2.721799, 0, 0, 0, 1, 1,
1.471634, -1.152468, 3.053898, 0, 0, 0, 1, 1,
1.478434, 0.4607645, 0.02616153, 0, 0, 0, 1, 1,
1.493884, -0.1239877, 2.002096, 0, 0, 0, 1, 1,
1.497989, 1.692713, 2.772482, 0, 0, 0, 1, 1,
1.511037, -0.676122, 1.570244, 0, 0, 0, 1, 1,
1.511573, 0.5075487, 0.8462804, 0, 0, 0, 1, 1,
1.51165, 0.34841, 1.950453, 1, 1, 1, 1, 1,
1.51214, -0.9486762, 1.428515, 1, 1, 1, 1, 1,
1.518498, 0.2437212, 0.4585094, 1, 1, 1, 1, 1,
1.519722, 0.2303427, 2.112003, 1, 1, 1, 1, 1,
1.523981, 0.7866168, -1.320681, 1, 1, 1, 1, 1,
1.525103, 0.8415283, 0.9043052, 1, 1, 1, 1, 1,
1.526363, -0.6991338, 1.698099, 1, 1, 1, 1, 1,
1.529092, -0.1952953, 1.363035, 1, 1, 1, 1, 1,
1.531197, 0.5775931, 0.09763759, 1, 1, 1, 1, 1,
1.534385, -0.08160299, 2.08857, 1, 1, 1, 1, 1,
1.534943, -1.337287, 1.767893, 1, 1, 1, 1, 1,
1.539607, 0.9436306, -0.770158, 1, 1, 1, 1, 1,
1.540276, 0.4173849, 1.375532, 1, 1, 1, 1, 1,
1.552454, 0.8409024, 0.4905118, 1, 1, 1, 1, 1,
1.564556, -0.5433, 1.032813, 1, 1, 1, 1, 1,
1.589568, -0.08255333, 3.656378, 0, 0, 1, 1, 1,
1.60056, 0.07481364, 2.373032, 1, 0, 0, 1, 1,
1.602072, -0.7425529, 2.136326, 1, 0, 0, 1, 1,
1.604604, 2.037256, 1.551373, 1, 0, 0, 1, 1,
1.634043, -1.194348, 2.152773, 1, 0, 0, 1, 1,
1.644698, -0.01085285, 1.220495, 1, 0, 0, 1, 1,
1.649649, -1.483306, 1.977455, 0, 0, 0, 1, 1,
1.650094, 0.03922046, 0.1722677, 0, 0, 0, 1, 1,
1.654419, 0.01269756, 3.460033, 0, 0, 0, 1, 1,
1.656267, 1.584616, 1.221417, 0, 0, 0, 1, 1,
1.690952, -1.028763, 1.283003, 0, 0, 0, 1, 1,
1.691772, 0.7283557, 2.002275, 0, 0, 0, 1, 1,
1.695463, -0.1834307, 1.038782, 0, 0, 0, 1, 1,
1.705962, -0.8138843, 1.553182, 1, 1, 1, 1, 1,
1.71286, -0.7390264, 3.106381, 1, 1, 1, 1, 1,
1.737311, 0.9665349, 1.636857, 1, 1, 1, 1, 1,
1.738268, -0.4236652, 0.6253885, 1, 1, 1, 1, 1,
1.74285, 0.6963909, 0.489169, 1, 1, 1, 1, 1,
1.747078, 0.1596214, -0.6928114, 1, 1, 1, 1, 1,
1.748972, -0.490634, 3.320048, 1, 1, 1, 1, 1,
1.793947, -0.06790461, 2.634403, 1, 1, 1, 1, 1,
1.809317, 0.2704606, 2.962907, 1, 1, 1, 1, 1,
1.825836, 0.8019734, 0.6353706, 1, 1, 1, 1, 1,
1.857885, 1.757923, 1.938863, 1, 1, 1, 1, 1,
1.86452, -0.4888896, 1.398243, 1, 1, 1, 1, 1,
1.881312, -0.4755137, 1.136525, 1, 1, 1, 1, 1,
1.931564, -0.1289992, 2.483521, 1, 1, 1, 1, 1,
1.966692, -1.763621, 2.385626, 1, 1, 1, 1, 1,
2.02851, 0.5732449, 0.3740797, 0, 0, 1, 1, 1,
2.029221, -1.585729, 2.702083, 1, 0, 0, 1, 1,
2.040356, -0.5909309, 1.448515, 1, 0, 0, 1, 1,
2.117365, -0.2800699, 0.2922609, 1, 0, 0, 1, 1,
2.128543, 1.04219, 1.303511, 1, 0, 0, 1, 1,
2.133625, 1.079792, 2.350922, 1, 0, 0, 1, 1,
2.164408, 0.07879623, 1.583381, 0, 0, 0, 1, 1,
2.180436, 1.631482, 0.9703393, 0, 0, 0, 1, 1,
2.181185, -0.2204601, 0.5309879, 0, 0, 0, 1, 1,
2.206009, -0.08750132, 0.4572582, 0, 0, 0, 1, 1,
2.235518, -1.163651, 2.758923, 0, 0, 0, 1, 1,
2.343092, -0.9480069, 0.7207249, 0, 0, 0, 1, 1,
2.381999, -1.931867, 3.468986, 0, 0, 0, 1, 1,
2.406845, 1.327638, 2.382553, 1, 1, 1, 1, 1,
2.412808, -1.191584, 1.461483, 1, 1, 1, 1, 1,
2.463496, 0.9699236, 1.194627, 1, 1, 1, 1, 1,
2.480354, -0.3596498, 1.635759, 1, 1, 1, 1, 1,
2.505662, -0.9541087, 3.894284, 1, 1, 1, 1, 1,
2.618561, 0.6070648, -0.137727, 1, 1, 1, 1, 1,
2.636245, 0.9667333, 0.6139724, 1, 1, 1, 1, 1
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
var radius = 9.459927;
var distance = 33.22759;
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
mvMatrix.translate( 0.3108053, -0.2558734, 0.6073182 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22759);
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
