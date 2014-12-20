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
-3.113488, -0.3106528, -1.69797, 1, 0, 0, 1,
-3.038918, 1.782897, 0.1856857, 1, 0.007843138, 0, 1,
-3.028726, 1.223122, -1.916577, 1, 0.01176471, 0, 1,
-2.785692, 0.3354192, -0.9651397, 1, 0.01960784, 0, 1,
-2.653661, -1.327719, -0.3235662, 1, 0.02352941, 0, 1,
-2.607548, -1.201742, -1.149451, 1, 0.03137255, 0, 1,
-2.604336, 0.2793564, -1.93863, 1, 0.03529412, 0, 1,
-2.594565, -0.3153268, -1.682611, 1, 0.04313726, 0, 1,
-2.543316, -1.355432, -2.126097, 1, 0.04705882, 0, 1,
-2.346637, -0.5801733, -1.145638, 1, 0.05490196, 0, 1,
-2.327656, -2.278334, -3.023495, 1, 0.05882353, 0, 1,
-2.307571, -1.175904, -2.455312, 1, 0.06666667, 0, 1,
-2.302377, 0.6119523, -3.647202, 1, 0.07058824, 0, 1,
-2.202717, -0.1260489, -3.451847, 1, 0.07843138, 0, 1,
-2.158993, 0.5710942, -2.012772, 1, 0.08235294, 0, 1,
-2.144724, 1.723308, -0.2111864, 1, 0.09019608, 0, 1,
-2.051979, 1.154997, -0.6128798, 1, 0.09411765, 0, 1,
-1.993152, -0.5957698, -1.143052, 1, 0.1019608, 0, 1,
-1.991872, 1.166269, -0.8841954, 1, 0.1098039, 0, 1,
-1.973012, 2.084555, -3.29617, 1, 0.1137255, 0, 1,
-1.966623, 0.4450199, 0.1683057, 1, 0.1215686, 0, 1,
-1.939761, 0.5701581, 0.7854353, 1, 0.1254902, 0, 1,
-1.915653, 0.9126747, -1.402878, 1, 0.1333333, 0, 1,
-1.90347, 1.743565, -1.608458, 1, 0.1372549, 0, 1,
-1.902932, -0.003991816, -0.9698538, 1, 0.145098, 0, 1,
-1.889608, -0.5596169, -2.522465, 1, 0.1490196, 0, 1,
-1.8823, 0.161962, -1.536155, 1, 0.1568628, 0, 1,
-1.862406, 1.402265, -0.2657159, 1, 0.1607843, 0, 1,
-1.861787, 0.5165921, -1.393145, 1, 0.1686275, 0, 1,
-1.85896, -0.2345524, -1.479053, 1, 0.172549, 0, 1,
-1.802629, -1.480894, -2.588257, 1, 0.1803922, 0, 1,
-1.797528, 1.027304, -2.00755, 1, 0.1843137, 0, 1,
-1.794911, -1.484182, -2.57224, 1, 0.1921569, 0, 1,
-1.75135, 0.5668777, -0.7719512, 1, 0.1960784, 0, 1,
-1.750411, -0.4318914, -2.720703, 1, 0.2039216, 0, 1,
-1.731952, 1.877506, 0.07258598, 1, 0.2117647, 0, 1,
-1.721728, 0.8484131, -0.517165, 1, 0.2156863, 0, 1,
-1.717215, -0.9688373, -3.739008, 1, 0.2235294, 0, 1,
-1.711432, 0.01202825, -1.100575, 1, 0.227451, 0, 1,
-1.704106, -1.339578, -1.999179, 1, 0.2352941, 0, 1,
-1.703578, -0.539079, -2.541744, 1, 0.2392157, 0, 1,
-1.700357, 0.01988586, -0.9391381, 1, 0.2470588, 0, 1,
-1.70021, 0.9248384, -1.31306, 1, 0.2509804, 0, 1,
-1.688977, 1.594727, 0.1395816, 1, 0.2588235, 0, 1,
-1.686181, -0.1213591, -0.5721474, 1, 0.2627451, 0, 1,
-1.6717, -0.531206, -2.667585, 1, 0.2705882, 0, 1,
-1.6694, 1.486095, -0.9261239, 1, 0.2745098, 0, 1,
-1.667875, 1.917148, -0.7208903, 1, 0.282353, 0, 1,
-1.662446, -0.4439578, -1.371726, 1, 0.2862745, 0, 1,
-1.639725, 1.953143, -2.491069, 1, 0.2941177, 0, 1,
-1.637891, -1.99146, -2.563768, 1, 0.3019608, 0, 1,
-1.63685, 0.7399642, -1.812427, 1, 0.3058824, 0, 1,
-1.633265, 1.16664, 0.8374717, 1, 0.3137255, 0, 1,
-1.597105, 0.8328435, -0.8777456, 1, 0.3176471, 0, 1,
-1.584558, 1.113301, -1.368105, 1, 0.3254902, 0, 1,
-1.579307, -2.218312, -3.838206, 1, 0.3294118, 0, 1,
-1.549779, 0.7757195, -0.9403028, 1, 0.3372549, 0, 1,
-1.548748, 0.001484764, -1.686406, 1, 0.3411765, 0, 1,
-1.543659, 0.3077301, -2.387196, 1, 0.3490196, 0, 1,
-1.537351, 0.5288442, -2.244156, 1, 0.3529412, 0, 1,
-1.532903, 0.0563494, -2.142298, 1, 0.3607843, 0, 1,
-1.530958, 0.2116366, -1.60169, 1, 0.3647059, 0, 1,
-1.522551, -0.02917939, -2.212337, 1, 0.372549, 0, 1,
-1.518165, -0.1045894, -1.478614, 1, 0.3764706, 0, 1,
-1.517143, -1.264481, -3.031323, 1, 0.3843137, 0, 1,
-1.509089, 1.708291, -1.12168, 1, 0.3882353, 0, 1,
-1.50314, 0.7142003, 0.6780442, 1, 0.3960784, 0, 1,
-1.499081, -1.213404, -2.837142, 1, 0.4039216, 0, 1,
-1.497433, 0.5691141, -0.9963343, 1, 0.4078431, 0, 1,
-1.484735, 0.8650046, 0.1271143, 1, 0.4156863, 0, 1,
-1.477823, -0.7851998, -1.798415, 1, 0.4196078, 0, 1,
-1.476576, 0.5580721, -1.746609, 1, 0.427451, 0, 1,
-1.47624, 0.9699237, -2.675138, 1, 0.4313726, 0, 1,
-1.461325, 1.537422, -1.343357, 1, 0.4392157, 0, 1,
-1.460921, -1.094372, -2.372261, 1, 0.4431373, 0, 1,
-1.454066, 0.7713702, -1.239566, 1, 0.4509804, 0, 1,
-1.447155, 0.7734757, -1.176269, 1, 0.454902, 0, 1,
-1.443715, -0.2610554, -1.232706, 1, 0.4627451, 0, 1,
-1.442707, 1.983929, 1.657365, 1, 0.4666667, 0, 1,
-1.440438, 0.461191, -1.381014, 1, 0.4745098, 0, 1,
-1.429118, 0.8919683, 0.7281142, 1, 0.4784314, 0, 1,
-1.418813, 1.054358, -1.553217, 1, 0.4862745, 0, 1,
-1.40785, 0.7646272, 0.4631357, 1, 0.4901961, 0, 1,
-1.406827, 0.9085875, -0.2243658, 1, 0.4980392, 0, 1,
-1.393976, -0.1400225, -0.3172069, 1, 0.5058824, 0, 1,
-1.390812, 0.004136472, -1.741735, 1, 0.509804, 0, 1,
-1.389307, -0.7172399, -1.176794, 1, 0.5176471, 0, 1,
-1.387554, 0.04923799, 0.3283336, 1, 0.5215687, 0, 1,
-1.386893, 0.4410398, -0.8829259, 1, 0.5294118, 0, 1,
-1.37457, 2.140343, -3.413426, 1, 0.5333334, 0, 1,
-1.365982, 0.02871219, -1.734621, 1, 0.5411765, 0, 1,
-1.36551, 0.4418127, -0.6479421, 1, 0.5450981, 0, 1,
-1.361639, 0.7518353, -1.998471, 1, 0.5529412, 0, 1,
-1.356578, -0.9208888, -3.505008, 1, 0.5568628, 0, 1,
-1.350453, -0.3189678, -1.889028, 1, 0.5647059, 0, 1,
-1.333306, 0.6737524, -1.750825, 1, 0.5686275, 0, 1,
-1.327294, 0.3195243, 0.2461219, 1, 0.5764706, 0, 1,
-1.326084, 1.022981, -1.375075, 1, 0.5803922, 0, 1,
-1.314124, -0.09023916, -2.281035, 1, 0.5882353, 0, 1,
-1.309573, -0.4729199, -1.686818, 1, 0.5921569, 0, 1,
-1.304777, 0.3787327, -1.203868, 1, 0.6, 0, 1,
-1.302685, 0.8255366, -2.06223, 1, 0.6078432, 0, 1,
-1.301221, -1.544503, -1.879408, 1, 0.6117647, 0, 1,
-1.299067, -1.475851, -3.154127, 1, 0.6196079, 0, 1,
-1.293122, -0.2090078, -1.283533, 1, 0.6235294, 0, 1,
-1.291354, 0.4338524, -1.616672, 1, 0.6313726, 0, 1,
-1.281806, -1.115779, -1.936898, 1, 0.6352941, 0, 1,
-1.28092, 1.435922, 0.3413119, 1, 0.6431373, 0, 1,
-1.273954, -0.4058985, -3.268296, 1, 0.6470588, 0, 1,
-1.272607, 1.23496, 1.219869, 1, 0.654902, 0, 1,
-1.272557, -0.09759248, -0.822441, 1, 0.6588235, 0, 1,
-1.272385, 1.59688, 0.2758528, 1, 0.6666667, 0, 1,
-1.268949, -0.0446297, -2.031518, 1, 0.6705883, 0, 1,
-1.267336, 0.05974887, -1.989385, 1, 0.6784314, 0, 1,
-1.261326, 0.9719281, 0.5728107, 1, 0.682353, 0, 1,
-1.259432, 0.2635589, -2.026176, 1, 0.6901961, 0, 1,
-1.258356, 0.03754591, -1.51211, 1, 0.6941177, 0, 1,
-1.253266, 0.6743332, -1.197278, 1, 0.7019608, 0, 1,
-1.234112, 0.2168414, -2.506936, 1, 0.7098039, 0, 1,
-1.232352, -0.5494977, -0.515361, 1, 0.7137255, 0, 1,
-1.23222, -1.013655, -1.234697, 1, 0.7215686, 0, 1,
-1.22577, 1.691535, -1.141006, 1, 0.7254902, 0, 1,
-1.225362, -0.36298, -2.312708, 1, 0.7333333, 0, 1,
-1.218362, 0.5966629, -0.759189, 1, 0.7372549, 0, 1,
-1.182989, 1.102135, -0.2360026, 1, 0.7450981, 0, 1,
-1.178544, 0.6871833, -1.331556, 1, 0.7490196, 0, 1,
-1.178122, -1.223528, -3.97765, 1, 0.7568628, 0, 1,
-1.177526, -0.2318211, -0.5864401, 1, 0.7607843, 0, 1,
-1.175309, 0.2074388, -2.346966, 1, 0.7686275, 0, 1,
-1.173676, -0.948747, -2.233677, 1, 0.772549, 0, 1,
-1.173275, 0.5408388, 1.137731, 1, 0.7803922, 0, 1,
-1.171956, 0.9753073, 0.01424621, 1, 0.7843137, 0, 1,
-1.165241, -0.01168418, -3.262558, 1, 0.7921569, 0, 1,
-1.16242, -0.6000904, -1.157303, 1, 0.7960784, 0, 1,
-1.161227, -0.4164909, -2.922596, 1, 0.8039216, 0, 1,
-1.156258, -0.1283884, -2.682148, 1, 0.8117647, 0, 1,
-1.152775, 0.7821141, -2.455199, 1, 0.8156863, 0, 1,
-1.141492, -0.7374961, -4.277374, 1, 0.8235294, 0, 1,
-1.134659, -0.5404906, -2.508096, 1, 0.827451, 0, 1,
-1.127356, 0.3217827, -1.566725, 1, 0.8352941, 0, 1,
-1.124651, 0.7912832, -1.270148, 1, 0.8392157, 0, 1,
-1.122978, -0.3531061, -0.82303, 1, 0.8470588, 0, 1,
-1.098615, 0.1725579, -1.095219, 1, 0.8509804, 0, 1,
-1.098253, 0.5283312, -0.359676, 1, 0.8588235, 0, 1,
-1.096086, -1.221068, -1.721353, 1, 0.8627451, 0, 1,
-1.094078, -0.7170026, -2.084222, 1, 0.8705882, 0, 1,
-1.090739, -0.7911385, -1.221703, 1, 0.8745098, 0, 1,
-1.087311, -0.9005886, -4.611494, 1, 0.8823529, 0, 1,
-1.077759, -0.09802597, -1.277173, 1, 0.8862745, 0, 1,
-1.074606, 2.184789, -0.9100533, 1, 0.8941177, 0, 1,
-1.071934, 1.182513, -0.5419489, 1, 0.8980392, 0, 1,
-1.068102, 0.2845801, -1.485688, 1, 0.9058824, 0, 1,
-1.067586, -0.6090897, -2.203267, 1, 0.9137255, 0, 1,
-1.067382, 0.217596, -1.55573, 1, 0.9176471, 0, 1,
-1.064625, -0.3857042, -1.60594, 1, 0.9254902, 0, 1,
-1.054181, -0.2118607, 0.3853918, 1, 0.9294118, 0, 1,
-1.048252, -1.910338, -1.962409, 1, 0.9372549, 0, 1,
-1.039707, 1.647869, -0.1267629, 1, 0.9411765, 0, 1,
-1.035822, -0.6357709, -1.915637, 1, 0.9490196, 0, 1,
-1.023685, -2.669457, -3.246293, 1, 0.9529412, 0, 1,
-1.023426, -1.834696, -3.856034, 1, 0.9607843, 0, 1,
-1.020801, 0.927593, 1.7027, 1, 0.9647059, 0, 1,
-0.9970408, 0.7896443, -0.8307332, 1, 0.972549, 0, 1,
-0.9949227, 0.2568269, -1.974651, 1, 0.9764706, 0, 1,
-0.9923191, 0.2162829, -2.02476, 1, 0.9843137, 0, 1,
-0.9897535, 0.01123117, -3.20678, 1, 0.9882353, 0, 1,
-0.985608, 0.2209727, -1.59973, 1, 0.9960784, 0, 1,
-0.9841302, -2.100121, -4.169799, 0.9960784, 1, 0, 1,
-0.9778531, 0.06572675, -1.629207, 0.9921569, 1, 0, 1,
-0.975332, -0.3258655, -2.332268, 0.9843137, 1, 0, 1,
-0.9582996, 0.04497018, -1.093668, 0.9803922, 1, 0, 1,
-0.9553201, -0.6849367, -1.729986, 0.972549, 1, 0, 1,
-0.9542786, 0.004577474, -1.722871, 0.9686275, 1, 0, 1,
-0.9540333, -0.9021127, -3.210274, 0.9607843, 1, 0, 1,
-0.9523747, 1.124392, 0.3035085, 0.9568627, 1, 0, 1,
-0.9519767, 0.7160053, -1.405445, 0.9490196, 1, 0, 1,
-0.9467221, -0.8542359, -4.036234, 0.945098, 1, 0, 1,
-0.9440196, 2.534558, -0.7509407, 0.9372549, 1, 0, 1,
-0.9371004, -1.397335, -1.824887, 0.9333333, 1, 0, 1,
-0.9345018, 0.1487151, -2.167838, 0.9254902, 1, 0, 1,
-0.9285544, -0.3288183, -2.335012, 0.9215686, 1, 0, 1,
-0.9282811, 0.9404157, 0.1130226, 0.9137255, 1, 0, 1,
-0.9266003, 0.3388815, 0.4971132, 0.9098039, 1, 0, 1,
-0.9261591, 1.448632, -0.5810149, 0.9019608, 1, 0, 1,
-0.9250128, 0.5880689, -0.3457054, 0.8941177, 1, 0, 1,
-0.9174111, 1.429879, 1.093646, 0.8901961, 1, 0, 1,
-0.913502, -0.1869907, -1.893686, 0.8823529, 1, 0, 1,
-0.9121348, -0.7371778, -2.090379, 0.8784314, 1, 0, 1,
-0.911733, 0.1067946, -1.173649, 0.8705882, 1, 0, 1,
-0.9109932, 2.573734, -1.972564, 0.8666667, 1, 0, 1,
-0.9086761, -0.1058986, -2.066958, 0.8588235, 1, 0, 1,
-0.9085702, 0.3260296, -0.9930781, 0.854902, 1, 0, 1,
-0.9074245, 1.047056, -1.905955, 0.8470588, 1, 0, 1,
-0.8982716, -1.393017, -2.903782, 0.8431373, 1, 0, 1,
-0.8970659, 0.7465261, -0.1196846, 0.8352941, 1, 0, 1,
-0.8913336, -0.1180363, 0.7012697, 0.8313726, 1, 0, 1,
-0.8844771, 1.953718, -1.050159, 0.8235294, 1, 0, 1,
-0.8794388, -0.2370093, -1.767887, 0.8196079, 1, 0, 1,
-0.878307, -0.8996121, -1.22971, 0.8117647, 1, 0, 1,
-0.8752639, 0.5722741, -0.7513741, 0.8078431, 1, 0, 1,
-0.8718272, -0.5987822, -2.228267, 0.8, 1, 0, 1,
-0.8703769, 0.7030039, -0.6167795, 0.7921569, 1, 0, 1,
-0.8660362, 0.1307057, -2.43864, 0.7882353, 1, 0, 1,
-0.8642763, -0.2840395, -3.70289, 0.7803922, 1, 0, 1,
-0.8630522, -0.6379915, -4.194246, 0.7764706, 1, 0, 1,
-0.8588673, 0.9563926, -0.00817903, 0.7686275, 1, 0, 1,
-0.858524, -0.3535543, -1.954734, 0.7647059, 1, 0, 1,
-0.8425292, -1.573436, -1.405173, 0.7568628, 1, 0, 1,
-0.8350308, -2.098452, -0.5497451, 0.7529412, 1, 0, 1,
-0.8218059, -0.944554, -3.864112, 0.7450981, 1, 0, 1,
-0.8181489, -1.267355, -0.7842755, 0.7411765, 1, 0, 1,
-0.8145036, -0.4934667, -4.099333, 0.7333333, 1, 0, 1,
-0.8088475, 0.4778914, -2.151997, 0.7294118, 1, 0, 1,
-0.808176, 0.8384497, -0.4663935, 0.7215686, 1, 0, 1,
-0.8009166, -0.5411854, -3.580727, 0.7176471, 1, 0, 1,
-0.799692, -1.451127, -2.53978, 0.7098039, 1, 0, 1,
-0.7979354, 0.1462456, -0.002782426, 0.7058824, 1, 0, 1,
-0.7965245, -0.7591141, -1.844915, 0.6980392, 1, 0, 1,
-0.7941405, -0.1443856, -1.858157, 0.6901961, 1, 0, 1,
-0.7933825, 1.499967, -1.058867, 0.6862745, 1, 0, 1,
-0.779594, 1.079263, 0.04600038, 0.6784314, 1, 0, 1,
-0.7750176, -2.12149, -2.163972, 0.6745098, 1, 0, 1,
-0.7710238, 1.366545, 0.08559661, 0.6666667, 1, 0, 1,
-0.7694061, 1.189439, -1.938032, 0.6627451, 1, 0, 1,
-0.7693525, 0.6999317, 0.4418405, 0.654902, 1, 0, 1,
-0.7641853, 1.772131, 0.1330713, 0.6509804, 1, 0, 1,
-0.7628977, 0.3076366, -0.9418309, 0.6431373, 1, 0, 1,
-0.7614969, 2.001369, -0.2402643, 0.6392157, 1, 0, 1,
-0.7590627, -1.115533, -3.346489, 0.6313726, 1, 0, 1,
-0.7576569, 1.04525, 0.2347126, 0.627451, 1, 0, 1,
-0.7557888, -1.239244, -2.006884, 0.6196079, 1, 0, 1,
-0.7488539, 0.1541888, -1.338711, 0.6156863, 1, 0, 1,
-0.7452561, -0.842908, -3.279139, 0.6078432, 1, 0, 1,
-0.7431859, 0.07538347, -2.824252, 0.6039216, 1, 0, 1,
-0.7405539, -0.6758958, -1.835294, 0.5960785, 1, 0, 1,
-0.7403585, -0.007968897, -1.536181, 0.5882353, 1, 0, 1,
-0.7402242, 0.6992154, -0.2607611, 0.5843138, 1, 0, 1,
-0.7320169, -0.3725789, -2.604145, 0.5764706, 1, 0, 1,
-0.7256516, 0.2919428, -0.1335361, 0.572549, 1, 0, 1,
-0.7217911, -0.5939366, -2.468615, 0.5647059, 1, 0, 1,
-0.7188292, -0.238251, -2.927265, 0.5607843, 1, 0, 1,
-0.7183671, -0.8497722, -3.057019, 0.5529412, 1, 0, 1,
-0.7180963, -1.896019, -2.3842, 0.5490196, 1, 0, 1,
-0.7162762, 0.6150825, 0.6608184, 0.5411765, 1, 0, 1,
-0.7146512, 0.2641681, -3.128282, 0.5372549, 1, 0, 1,
-0.7094383, -0.9222301, -2.829003, 0.5294118, 1, 0, 1,
-0.7087783, 1.233472, 0.7564204, 0.5254902, 1, 0, 1,
-0.7085783, -0.06542744, -2.881119, 0.5176471, 1, 0, 1,
-0.7080702, 0.5731726, 1.285766, 0.5137255, 1, 0, 1,
-0.7075481, -1.563361, -2.339722, 0.5058824, 1, 0, 1,
-0.7068018, -0.03255164, -2.764852, 0.5019608, 1, 0, 1,
-0.6978568, 0.5600075, -0.9781982, 0.4941176, 1, 0, 1,
-0.6975635, 0.1886013, -0.3472601, 0.4862745, 1, 0, 1,
-0.6952962, -1.017299, -2.014233, 0.4823529, 1, 0, 1,
-0.6941164, 1.771247, 0.6684925, 0.4745098, 1, 0, 1,
-0.6941001, -0.5413668, -2.14164, 0.4705882, 1, 0, 1,
-0.6913029, 0.7578371, -0.2052576, 0.4627451, 1, 0, 1,
-0.6902512, 0.09058269, -0.4551626, 0.4588235, 1, 0, 1,
-0.682589, 0.4657724, -0.7069386, 0.4509804, 1, 0, 1,
-0.6825154, 0.9860538, -2.010429, 0.4470588, 1, 0, 1,
-0.677259, 1.450214, -0.5438145, 0.4392157, 1, 0, 1,
-0.6662662, -0.8077797, -1.063423, 0.4352941, 1, 0, 1,
-0.6649922, -0.3021333, -1.99205, 0.427451, 1, 0, 1,
-0.6643443, 1.550914, -0.1923279, 0.4235294, 1, 0, 1,
-0.6572312, -1.65986, -3.398536, 0.4156863, 1, 0, 1,
-0.6515397, 0.2199825, -0.534627, 0.4117647, 1, 0, 1,
-0.6430547, 1.754994, -1.307187, 0.4039216, 1, 0, 1,
-0.6410315, 0.1168537, -3.184318, 0.3960784, 1, 0, 1,
-0.6337293, -0.4832976, -3.071785, 0.3921569, 1, 0, 1,
-0.6251462, 0.5245052, 0.5631728, 0.3843137, 1, 0, 1,
-0.6210539, -1.541052, -3.543947, 0.3803922, 1, 0, 1,
-0.6207617, 0.9913781, -2.149376, 0.372549, 1, 0, 1,
-0.6181354, -0.7250372, -1.610962, 0.3686275, 1, 0, 1,
-0.6167209, 0.9722936, -2.278445, 0.3607843, 1, 0, 1,
-0.6138151, -1.791199, -2.127299, 0.3568628, 1, 0, 1,
-0.6120105, 0.9700392, 0.1933972, 0.3490196, 1, 0, 1,
-0.6101975, 0.02119341, -1.319773, 0.345098, 1, 0, 1,
-0.5972894, -1.179095, -4.878647, 0.3372549, 1, 0, 1,
-0.5965174, -0.3057566, -2.076758, 0.3333333, 1, 0, 1,
-0.5956261, -0.02946916, -0.5175038, 0.3254902, 1, 0, 1,
-0.5941759, 0.2009206, -0.9307804, 0.3215686, 1, 0, 1,
-0.5877709, 0.2725664, -0.8983796, 0.3137255, 1, 0, 1,
-0.5854576, -0.2414951, -4.867341, 0.3098039, 1, 0, 1,
-0.584413, -0.1245701, -0.9926111, 0.3019608, 1, 0, 1,
-0.582878, 1.250426, 0.03702646, 0.2941177, 1, 0, 1,
-0.5804328, 0.6519018, 1.307826, 0.2901961, 1, 0, 1,
-0.5803016, 0.5940235, -1.266299, 0.282353, 1, 0, 1,
-0.5778692, -1.87303, -1.046326, 0.2784314, 1, 0, 1,
-0.5777961, 0.09506702, -1.399656, 0.2705882, 1, 0, 1,
-0.5723958, 0.7106786, 0.6409924, 0.2666667, 1, 0, 1,
-0.5709811, 1.217229, 0.2826954, 0.2588235, 1, 0, 1,
-0.5708151, 1.076258, -0.3474512, 0.254902, 1, 0, 1,
-0.5679832, 0.08485021, -1.765177, 0.2470588, 1, 0, 1,
-0.560459, 0.9240811, -0.7144909, 0.2431373, 1, 0, 1,
-0.5582108, 0.5090148, -0.3114539, 0.2352941, 1, 0, 1,
-0.5549182, -0.5405332, -2.509364, 0.2313726, 1, 0, 1,
-0.5548052, 0.800813, -0.2948839, 0.2235294, 1, 0, 1,
-0.5539767, 0.1845054, -1.295026, 0.2196078, 1, 0, 1,
-0.5494334, -1.04264, -3.08489, 0.2117647, 1, 0, 1,
-0.5475124, -1.425061, -4.694195, 0.2078431, 1, 0, 1,
-0.546797, 1.32769, -0.01755246, 0.2, 1, 0, 1,
-0.5431634, -0.8456552, -2.54383, 0.1921569, 1, 0, 1,
-0.5427766, 0.2377509, -0.8843164, 0.1882353, 1, 0, 1,
-0.5425757, -0.5841748, -1.59099, 0.1803922, 1, 0, 1,
-0.5388414, -0.7904255, -2.368359, 0.1764706, 1, 0, 1,
-0.5379855, -0.640087, -4.32199, 0.1686275, 1, 0, 1,
-0.5371992, -1.143314, -2.691792, 0.1647059, 1, 0, 1,
-0.5341408, 0.6857732, -0.436959, 0.1568628, 1, 0, 1,
-0.5319899, -0.01975346, -1.817671, 0.1529412, 1, 0, 1,
-0.5237292, -0.9253793, -4.248341, 0.145098, 1, 0, 1,
-0.5129184, -1.179925, -5.128843, 0.1411765, 1, 0, 1,
-0.5096208, 1.096992, 0.5883377, 0.1333333, 1, 0, 1,
-0.5074556, 0.5226406, -0.686, 0.1294118, 1, 0, 1,
-0.5058517, -0.5903947, -3.464783, 0.1215686, 1, 0, 1,
-0.5011333, -0.6877192, -2.749751, 0.1176471, 1, 0, 1,
-0.4955277, -0.1335813, -2.057967, 0.1098039, 1, 0, 1,
-0.4949976, -1.482445, -1.500479, 0.1058824, 1, 0, 1,
-0.4941802, 0.6920664, -1.347636, 0.09803922, 1, 0, 1,
-0.4881363, 0.8025293, -0.3835063, 0.09019608, 1, 0, 1,
-0.4856486, -1.584876, -4.018663, 0.08627451, 1, 0, 1,
-0.4836043, -1.410158, -2.939236, 0.07843138, 1, 0, 1,
-0.4815496, 0.457073, 0.2312711, 0.07450981, 1, 0, 1,
-0.4715251, 0.5530742, 0.116393, 0.06666667, 1, 0, 1,
-0.4669794, 1.547015, -1.257778, 0.0627451, 1, 0, 1,
-0.4617698, 0.004802802, -2.802797, 0.05490196, 1, 0, 1,
-0.4574343, -1.156399, -1.6917, 0.05098039, 1, 0, 1,
-0.4572887, 0.7921854, 0.7414689, 0.04313726, 1, 0, 1,
-0.4515424, -0.08956832, -2.056711, 0.03921569, 1, 0, 1,
-0.444608, -0.05937448, -1.071347, 0.03137255, 1, 0, 1,
-0.4430539, 0.5488915, -0.9056104, 0.02745098, 1, 0, 1,
-0.4408126, -0.3798076, -4.338142, 0.01960784, 1, 0, 1,
-0.4395475, 0.9961818, -2.044441, 0.01568628, 1, 0, 1,
-0.4374246, 0.747798, 0.7251723, 0.007843138, 1, 0, 1,
-0.43552, -0.9079404, -2.621813, 0.003921569, 1, 0, 1,
-0.43076, -1.793175, -2.547018, 0, 1, 0.003921569, 1,
-0.4305789, 0.7275975, 0.2075562, 0, 1, 0.01176471, 1,
-0.4295111, 2.328873, 0.2419305, 0, 1, 0.01568628, 1,
-0.4269838, -1.165019, -2.065744, 0, 1, 0.02352941, 1,
-0.4242736, -1.395338, -2.89057, 0, 1, 0.02745098, 1,
-0.4217121, 1.055396, 0.3608842, 0, 1, 0.03529412, 1,
-0.4199831, 0.5985916, -1.328925, 0, 1, 0.03921569, 1,
-0.4153514, -0.03779296, -0.9450264, 0, 1, 0.04705882, 1,
-0.4120497, -0.6861598, -2.819876, 0, 1, 0.05098039, 1,
-0.4097162, 1.173901, -0.4883909, 0, 1, 0.05882353, 1,
-0.409144, -0.7469268, -3.703459, 0, 1, 0.0627451, 1,
-0.4088316, 0.8805765, 0.5086571, 0, 1, 0.07058824, 1,
-0.4052639, 0.1734162, 0.3627771, 0, 1, 0.07450981, 1,
-0.4016704, 0.3327714, -1.40111, 0, 1, 0.08235294, 1,
-0.3991614, 2.071881, -0.3164295, 0, 1, 0.08627451, 1,
-0.3972358, -1.86271, -4.801745, 0, 1, 0.09411765, 1,
-0.395783, 0.5932904, -0.2419963, 0, 1, 0.1019608, 1,
-0.3928671, 0.8069211, 0.1869955, 0, 1, 0.1058824, 1,
-0.3927827, 1.868332, 0.6893578, 0, 1, 0.1137255, 1,
-0.3910241, -2.109608, -3.301758, 0, 1, 0.1176471, 1,
-0.3906285, -0.4637088, -0.5463966, 0, 1, 0.1254902, 1,
-0.3880327, -0.3584553, -1.137169, 0, 1, 0.1294118, 1,
-0.3859634, 2.230623, 0.690035, 0, 1, 0.1372549, 1,
-0.3835573, 0.5042696, -0.949524, 0, 1, 0.1411765, 1,
-0.3830055, 0.6606675, -2.228986, 0, 1, 0.1490196, 1,
-0.3806576, -1.821569, -0.6724783, 0, 1, 0.1529412, 1,
-0.3792985, 0.1589836, -1.642955, 0, 1, 0.1607843, 1,
-0.3677267, -1.241, -3.226503, 0, 1, 0.1647059, 1,
-0.3667602, -0.1717675, -1.892163, 0, 1, 0.172549, 1,
-0.3656337, -0.5383027, -4.125096, 0, 1, 0.1764706, 1,
-0.3467655, 0.743288, 0.8315097, 0, 1, 0.1843137, 1,
-0.3465575, 0.2630521, -2.527692, 0, 1, 0.1882353, 1,
-0.3450484, -1.056682, -3.397429, 0, 1, 0.1960784, 1,
-0.3340258, 0.5161752, -1.328639, 0, 1, 0.2039216, 1,
-0.3306765, -0.7406583, -2.609426, 0, 1, 0.2078431, 1,
-0.3303629, 0.2943874, -2.996297, 0, 1, 0.2156863, 1,
-0.3290392, 0.0716816, -1.095254, 0, 1, 0.2196078, 1,
-0.3246811, 0.8586309, -0.4811441, 0, 1, 0.227451, 1,
-0.3209081, -0.5409703, -2.321285, 0, 1, 0.2313726, 1,
-0.3185106, 0.4242698, -1.691035, 0, 1, 0.2392157, 1,
-0.3177339, -0.6764995, -2.670137, 0, 1, 0.2431373, 1,
-0.3165053, -0.9451106, -0.6574764, 0, 1, 0.2509804, 1,
-0.3154987, -1.220112, -4.37627, 0, 1, 0.254902, 1,
-0.3151649, -0.3883323, -3.873507, 0, 1, 0.2627451, 1,
-0.3102149, 0.1417425, -2.419289, 0, 1, 0.2666667, 1,
-0.3098834, 0.8609144, -0.2451651, 0, 1, 0.2745098, 1,
-0.3067472, 0.03229001, -4.245412, 0, 1, 0.2784314, 1,
-0.3041884, 1.120791, -0.1137235, 0, 1, 0.2862745, 1,
-0.3026724, -0.4113463, -2.761389, 0, 1, 0.2901961, 1,
-0.3006001, -1.270951, -3.362097, 0, 1, 0.2980392, 1,
-0.2991517, -0.2223904, -1.564833, 0, 1, 0.3058824, 1,
-0.2978548, -0.01237796, -1.651263, 0, 1, 0.3098039, 1,
-0.297645, 4.372891, 2.07159, 0, 1, 0.3176471, 1,
-0.2932555, 0.04117661, -0.1567127, 0, 1, 0.3215686, 1,
-0.2886085, 0.2975068, -1.293593, 0, 1, 0.3294118, 1,
-0.2873851, -1.525797, -2.303178, 0, 1, 0.3333333, 1,
-0.2855283, 1.033332, -1.376335, 0, 1, 0.3411765, 1,
-0.2846844, 0.08965692, -0.5685378, 0, 1, 0.345098, 1,
-0.2831624, 0.4203716, -1.082621, 0, 1, 0.3529412, 1,
-0.2811564, 1.155833, 2.324451, 0, 1, 0.3568628, 1,
-0.2779678, -0.4457402, -1.565341, 0, 1, 0.3647059, 1,
-0.2719146, 1.451271, 1.938846, 0, 1, 0.3686275, 1,
-0.2690246, 1.017751, 0.8425695, 0, 1, 0.3764706, 1,
-0.2629077, 0.7923641, 0.505299, 0, 1, 0.3803922, 1,
-0.2616517, 0.772586, 1.643256, 0, 1, 0.3882353, 1,
-0.260654, -2.305361, -2.609025, 0, 1, 0.3921569, 1,
-0.2595413, -0.8722274, -2.007308, 0, 1, 0.4, 1,
-0.2548677, 1.050626, 0.05180332, 0, 1, 0.4078431, 1,
-0.2545885, 0.4299757, 0.1736231, 0, 1, 0.4117647, 1,
-0.2529902, 0.7592596, 0.6161877, 0, 1, 0.4196078, 1,
-0.2504323, -1.095031, -3.466437, 0, 1, 0.4235294, 1,
-0.2494195, 1.454755, 1.371016, 0, 1, 0.4313726, 1,
-0.2453355, -1.47472, -1.517576, 0, 1, 0.4352941, 1,
-0.2417246, -0.08893431, -2.636898, 0, 1, 0.4431373, 1,
-0.2410411, 1.442198, 0.1297498, 0, 1, 0.4470588, 1,
-0.2400122, -0.5077637, -0.747709, 0, 1, 0.454902, 1,
-0.2359871, -0.3855272, -1.675811, 0, 1, 0.4588235, 1,
-0.2350729, 1.666525, 0.3597915, 0, 1, 0.4666667, 1,
-0.2334412, 0.1806054, -2.253105, 0, 1, 0.4705882, 1,
-0.2244367, -0.309056, -1.105971, 0, 1, 0.4784314, 1,
-0.2241828, -0.7116833, -3.192629, 0, 1, 0.4823529, 1,
-0.2221621, 0.9314691, 0.08238167, 0, 1, 0.4901961, 1,
-0.22107, -1.68154, -2.035307, 0, 1, 0.4941176, 1,
-0.2207806, -0.2179024, -2.483255, 0, 1, 0.5019608, 1,
-0.2137528, 0.4487879, -0.5390782, 0, 1, 0.509804, 1,
-0.2127156, 0.8262124, 1.298406, 0, 1, 0.5137255, 1,
-0.2094869, 0.6451684, 0.3748429, 0, 1, 0.5215687, 1,
-0.2077266, -0.842271, -4.099498, 0, 1, 0.5254902, 1,
-0.2075411, 1.715849, -0.2127202, 0, 1, 0.5333334, 1,
-0.2044986, 0.3639893, 0.5540224, 0, 1, 0.5372549, 1,
-0.2034574, -0.1233409, -1.075797, 0, 1, 0.5450981, 1,
-0.1969705, 0.4783655, -1.202794, 0, 1, 0.5490196, 1,
-0.1932266, 0.7882189, -1.466715, 0, 1, 0.5568628, 1,
-0.1891354, 1.594553, 0.3864197, 0, 1, 0.5607843, 1,
-0.1882312, -0.7955347, -2.238097, 0, 1, 0.5686275, 1,
-0.1858422, -0.7772041, -1.342039, 0, 1, 0.572549, 1,
-0.1780631, -0.000882588, -2.185496, 0, 1, 0.5803922, 1,
-0.1757612, -0.4869814, -1.753109, 0, 1, 0.5843138, 1,
-0.1736987, 0.9523767, 0.7349375, 0, 1, 0.5921569, 1,
-0.1730322, -0.2813196, -2.464784, 0, 1, 0.5960785, 1,
-0.1702928, 1.173252, 0.204593, 0, 1, 0.6039216, 1,
-0.1699664, 1.68969, 0.3611775, 0, 1, 0.6117647, 1,
-0.1685736, 1.672977, -0.3129716, 0, 1, 0.6156863, 1,
-0.1684284, 0.282222, 0.4897422, 0, 1, 0.6235294, 1,
-0.1646084, 0.149165, -0.2951837, 0, 1, 0.627451, 1,
-0.1639864, -0.3607711, -1.474175, 0, 1, 0.6352941, 1,
-0.1619873, -0.7992163, -2.773012, 0, 1, 0.6392157, 1,
-0.1552977, 0.31653, -1.519113, 0, 1, 0.6470588, 1,
-0.1506121, 1.003936, -0.4387287, 0, 1, 0.6509804, 1,
-0.1449499, 0.4809181, -0.4902251, 0, 1, 0.6588235, 1,
-0.1370574, -0.05648017, -2.228419, 0, 1, 0.6627451, 1,
-0.1349301, -0.823855, -4.382809, 0, 1, 0.6705883, 1,
-0.1346129, 0.780856, 0.2915185, 0, 1, 0.6745098, 1,
-0.1340478, -0.7341579, -2.913043, 0, 1, 0.682353, 1,
-0.1272788, 0.02184447, -0.8666082, 0, 1, 0.6862745, 1,
-0.1272711, 1.425919, -1.501038, 0, 1, 0.6941177, 1,
-0.1255554, 0.1873244, -0.3637585, 0, 1, 0.7019608, 1,
-0.1241684, 0.1529386, -0.6825063, 0, 1, 0.7058824, 1,
-0.1220013, -1.124146, -1.767173, 0, 1, 0.7137255, 1,
-0.1185607, 0.2247718, -1.058531, 0, 1, 0.7176471, 1,
-0.1175558, 0.009377421, -0.5855529, 0, 1, 0.7254902, 1,
-0.1155425, 1.326371, -1.658134, 0, 1, 0.7294118, 1,
-0.11257, 0.01244364, -1.287026, 0, 1, 0.7372549, 1,
-0.1124819, 0.7181762, 0.2965665, 0, 1, 0.7411765, 1,
-0.1123732, 0.9810389, -0.6784185, 0, 1, 0.7490196, 1,
-0.111751, -1.262299, -2.851908, 0, 1, 0.7529412, 1,
-0.1055178, -1.008958, -2.136445, 0, 1, 0.7607843, 1,
-0.105123, -0.2736789, -3.593695, 0, 1, 0.7647059, 1,
-0.10296, 1.398924, 0.2000569, 0, 1, 0.772549, 1,
-0.1012217, -3.086668, -1.8003, 0, 1, 0.7764706, 1,
-0.09630243, 0.2018921, -1.644645, 0, 1, 0.7843137, 1,
-0.0943742, 0.2103793, 0.1646239, 0, 1, 0.7882353, 1,
-0.09435838, 2.175106, 0.7986274, 0, 1, 0.7960784, 1,
-0.0920506, 2.758138, -0.8929372, 0, 1, 0.8039216, 1,
-0.09183846, 0.3930288, -1.541384, 0, 1, 0.8078431, 1,
-0.0886132, 0.3476037, 1.641876, 0, 1, 0.8156863, 1,
-0.08739428, -0.308897, -3.304501, 0, 1, 0.8196079, 1,
-0.08731802, -0.9113962, -3.191224, 0, 1, 0.827451, 1,
-0.07884767, -0.197001, -3.027442, 0, 1, 0.8313726, 1,
-0.07650594, 2.163491, -0.2957021, 0, 1, 0.8392157, 1,
-0.07579766, 0.8296972, 0.8032629, 0, 1, 0.8431373, 1,
-0.07431084, -0.5056159, -3.618628, 0, 1, 0.8509804, 1,
-0.07214524, -0.291554, -2.909637, 0, 1, 0.854902, 1,
-0.07165478, 0.2891102, 1.311789, 0, 1, 0.8627451, 1,
-0.07068156, 1.197573, -0.5752144, 0, 1, 0.8666667, 1,
-0.06906741, 0.2133571, 0.290444, 0, 1, 0.8745098, 1,
-0.06582348, 0.1692152, -0.4142454, 0, 1, 0.8784314, 1,
-0.06566951, 1.451218, -0.3216097, 0, 1, 0.8862745, 1,
-0.06561157, 0.01927861, -2.400326, 0, 1, 0.8901961, 1,
-0.06500456, -1.398649, -3.35829, 0, 1, 0.8980392, 1,
-0.04770785, 0.2978435, 2.073642, 0, 1, 0.9058824, 1,
-0.04698355, -0.2838753, -2.36054, 0, 1, 0.9098039, 1,
-0.04397975, -0.8975669, -3.491334, 0, 1, 0.9176471, 1,
-0.04320431, 1.238536, 0.4454241, 0, 1, 0.9215686, 1,
-0.0419258, -0.7399219, -1.983448, 0, 1, 0.9294118, 1,
-0.0408662, -0.244516, -3.577131, 0, 1, 0.9333333, 1,
-0.03758083, 1.380661, -0.5478152, 0, 1, 0.9411765, 1,
-0.03607265, 0.3486719, 0.008482337, 0, 1, 0.945098, 1,
-0.01975812, -0.2434949, -3.50884, 0, 1, 0.9529412, 1,
-0.01873264, -0.2662391, -4.648547, 0, 1, 0.9568627, 1,
-0.01569471, 0.2432726, -0.1023149, 0, 1, 0.9647059, 1,
-0.0154225, 0.6827176, -0.0379442, 0, 1, 0.9686275, 1,
-0.01218899, -0.1906617, -2.357543, 0, 1, 0.9764706, 1,
-0.01053163, 0.6987494, 2.238334, 0, 1, 0.9803922, 1,
-0.008366903, 1.284097, -1.175612, 0, 1, 0.9882353, 1,
-0.007158777, 0.8586174, -3.181812, 0, 1, 0.9921569, 1,
0.002006426, 0.2305938, -0.7209643, 0, 1, 1, 1,
0.003673635, 0.2156723, 0.2605194, 0, 0.9921569, 1, 1,
0.004644724, -1.506692, 2.023239, 0, 0.9882353, 1, 1,
0.01003294, -0.4300143, 1.846954, 0, 0.9803922, 1, 1,
0.01337553, -1.04669, 3.858841, 0, 0.9764706, 1, 1,
0.01838281, -0.007846577, 1.942138, 0, 0.9686275, 1, 1,
0.02290505, 0.859254, -0.1163636, 0, 0.9647059, 1, 1,
0.02772015, -0.1863982, 4.356951, 0, 0.9568627, 1, 1,
0.03024186, -0.4492358, 3.380608, 0, 0.9529412, 1, 1,
0.03189002, -1.581632, 3.317483, 0, 0.945098, 1, 1,
0.03398974, 1.099354, 0.8399594, 0, 0.9411765, 1, 1,
0.04607049, -0.3746408, 3.757751, 0, 0.9333333, 1, 1,
0.04627832, 0.9819474, -1.024038, 0, 0.9294118, 1, 1,
0.04860865, -0.467715, 3.912247, 0, 0.9215686, 1, 1,
0.05046296, -0.1551229, 3.611881, 0, 0.9176471, 1, 1,
0.05170496, -0.7032598, 3.207548, 0, 0.9098039, 1, 1,
0.06668533, 0.5596139, -0.2352724, 0, 0.9058824, 1, 1,
0.0774061, -0.2857455, 2.321849, 0, 0.8980392, 1, 1,
0.07830071, 1.249697, 0.04994928, 0, 0.8901961, 1, 1,
0.08063272, -1.682959, 3.107219, 0, 0.8862745, 1, 1,
0.08268457, -1.168142, 4.128348, 0, 0.8784314, 1, 1,
0.08403214, -1.047556, 1.485979, 0, 0.8745098, 1, 1,
0.08968344, -0.5887905, 3.464039, 0, 0.8666667, 1, 1,
0.09090816, -0.7383499, 2.782956, 0, 0.8627451, 1, 1,
0.09432385, 0.4082887, 2.124604, 0, 0.854902, 1, 1,
0.09614608, -0.3123923, 2.739801, 0, 0.8509804, 1, 1,
0.09934198, -1.933459, 3.306701, 0, 0.8431373, 1, 1,
0.1008242, 0.3627864, -0.3645092, 0, 0.8392157, 1, 1,
0.1009696, 2.06567, 0.08207078, 0, 0.8313726, 1, 1,
0.1043342, 0.2129535, -1.020626, 0, 0.827451, 1, 1,
0.1091723, 1.404007, 0.5391476, 0, 0.8196079, 1, 1,
0.1104761, 1.685708, 0.2530479, 0, 0.8156863, 1, 1,
0.1115441, 1.02602, -0.3957834, 0, 0.8078431, 1, 1,
0.1124796, -0.06914911, 1.945857, 0, 0.8039216, 1, 1,
0.11684, -0.9118316, 3.249899, 0, 0.7960784, 1, 1,
0.1197086, -0.5568877, 1.318435, 0, 0.7882353, 1, 1,
0.1224307, 1.828285, 0.8183601, 0, 0.7843137, 1, 1,
0.122843, 0.2967776, 1.831568, 0, 0.7764706, 1, 1,
0.1350446, 1.145702, -1.844998, 0, 0.772549, 1, 1,
0.1364358, 1.283213, 0.00355906, 0, 0.7647059, 1, 1,
0.1447566, -0.8207514, 2.989129, 0, 0.7607843, 1, 1,
0.1452502, -0.7861196, 0.9924114, 0, 0.7529412, 1, 1,
0.1477082, -1.287228, 2.895508, 0, 0.7490196, 1, 1,
0.1483806, 1.702239, -1.356016, 0, 0.7411765, 1, 1,
0.148753, -0.6544883, 1.995704, 0, 0.7372549, 1, 1,
0.1493977, 0.1468391, 0.7746782, 0, 0.7294118, 1, 1,
0.152046, 0.6244716, -0.4358475, 0, 0.7254902, 1, 1,
0.153139, 1.313416, 1.027904, 0, 0.7176471, 1, 1,
0.1569621, 0.7156336, -1.318392, 0, 0.7137255, 1, 1,
0.1578461, 1.059117, 0.2655191, 0, 0.7058824, 1, 1,
0.1578967, -1.091143, 2.707779, 0, 0.6980392, 1, 1,
0.1589725, -0.4471977, 3.063067, 0, 0.6941177, 1, 1,
0.1625181, 0.3043148, 1.456701, 0, 0.6862745, 1, 1,
0.162766, -0.9513096, 4.673243, 0, 0.682353, 1, 1,
0.1631109, -0.2822291, 2.168805, 0, 0.6745098, 1, 1,
0.1670814, -0.9746829, 4.730838, 0, 0.6705883, 1, 1,
0.1670882, -1.634084, 1.328358, 0, 0.6627451, 1, 1,
0.167852, 0.1892311, 1.610125, 0, 0.6588235, 1, 1,
0.1683696, 1.188371, 0.02561865, 0, 0.6509804, 1, 1,
0.1684003, -0.3217413, 2.015588, 0, 0.6470588, 1, 1,
0.1722141, 0.6279402, -0.07579035, 0, 0.6392157, 1, 1,
0.1776978, 1.208789, 0.2042681, 0, 0.6352941, 1, 1,
0.1779962, 2.101511, 1.212523, 0, 0.627451, 1, 1,
0.1790845, 1.017475, -2.014114, 0, 0.6235294, 1, 1,
0.1808188, 0.7099246, 0.6420692, 0, 0.6156863, 1, 1,
0.1837679, 0.9430496, -0.2098568, 0, 0.6117647, 1, 1,
0.1871159, 0.5623869, 2.818058, 0, 0.6039216, 1, 1,
0.1896118, -1.565339, 4.247944, 0, 0.5960785, 1, 1,
0.1908198, -0.4591709, 2.111089, 0, 0.5921569, 1, 1,
0.1923827, -0.9624004, 3.844197, 0, 0.5843138, 1, 1,
0.1961597, -1.939388, 4.684293, 0, 0.5803922, 1, 1,
0.2011016, -1.25307, 2.399451, 0, 0.572549, 1, 1,
0.2012499, 0.1974726, 1.351913, 0, 0.5686275, 1, 1,
0.2014593, -0.4683105, 2.941543, 0, 0.5607843, 1, 1,
0.2089242, -0.5485827, 3.395217, 0, 0.5568628, 1, 1,
0.2109812, -1.004406, 3.310642, 0, 0.5490196, 1, 1,
0.2151854, -0.1409999, 1.362203, 0, 0.5450981, 1, 1,
0.2178382, -0.4569132, 2.311341, 0, 0.5372549, 1, 1,
0.2194049, 0.927408, -0.1257149, 0, 0.5333334, 1, 1,
0.219911, -0.4996714, 1.433717, 0, 0.5254902, 1, 1,
0.2255454, 1.912221, -0.7960706, 0, 0.5215687, 1, 1,
0.2325659, -0.6643111, 3.309972, 0, 0.5137255, 1, 1,
0.2385205, -1.364124, 3.261236, 0, 0.509804, 1, 1,
0.2420574, -1.117779, 1.927243, 0, 0.5019608, 1, 1,
0.2441536, 0.4050901, 3.423499, 0, 0.4941176, 1, 1,
0.2453837, -0.669463, 2.006099, 0, 0.4901961, 1, 1,
0.2466464, -0.9138076, 3.702839, 0, 0.4823529, 1, 1,
0.2588326, -1.153221, 3.048224, 0, 0.4784314, 1, 1,
0.2595936, 0.7942759, -1.034839, 0, 0.4705882, 1, 1,
0.2613205, -0.1774593, 2.758128, 0, 0.4666667, 1, 1,
0.2623231, 0.1758678, 0.3308785, 0, 0.4588235, 1, 1,
0.2626599, 0.04179604, 3.296229, 0, 0.454902, 1, 1,
0.2663147, 3.008601, -0.9276642, 0, 0.4470588, 1, 1,
0.2676879, 1.249596, 2.138474, 0, 0.4431373, 1, 1,
0.2741587, 0.08751854, 0.07717571, 0, 0.4352941, 1, 1,
0.2764288, -0.06474, 1.909774, 0, 0.4313726, 1, 1,
0.2772166, -0.8425636, 1.644283, 0, 0.4235294, 1, 1,
0.2773036, 1.214058, 0.7537034, 0, 0.4196078, 1, 1,
0.2777932, -0.2789944, 1.797309, 0, 0.4117647, 1, 1,
0.2803975, 1.284603, 1.509297, 0, 0.4078431, 1, 1,
0.2822989, 0.6721874, 0.2512017, 0, 0.4, 1, 1,
0.2833753, 1.566941, -1.601281, 0, 0.3921569, 1, 1,
0.2844778, 1.389327, 1.940002, 0, 0.3882353, 1, 1,
0.2848105, -0.1586789, 2.686573, 0, 0.3803922, 1, 1,
0.2883176, 0.1230204, 3.002824, 0, 0.3764706, 1, 1,
0.2898483, -1.534949, 2.946166, 0, 0.3686275, 1, 1,
0.2959159, -0.4649725, 2.672608, 0, 0.3647059, 1, 1,
0.3025744, -0.9908836, 3.40811, 0, 0.3568628, 1, 1,
0.3056374, 0.1858834, -0.06187427, 0, 0.3529412, 1, 1,
0.3100241, 1.781255, -0.3921564, 0, 0.345098, 1, 1,
0.3104266, -0.1694234, 0.2907625, 0, 0.3411765, 1, 1,
0.3117991, -1.105152, 4.508005, 0, 0.3333333, 1, 1,
0.3128386, -0.1802967, 0.08879974, 0, 0.3294118, 1, 1,
0.3137868, -0.6169958, 2.809155, 0, 0.3215686, 1, 1,
0.3213441, -0.3406612, 0.01940998, 0, 0.3176471, 1, 1,
0.3246836, -0.3981819, 2.63359, 0, 0.3098039, 1, 1,
0.32724, 0.9196721, 1.054463, 0, 0.3058824, 1, 1,
0.3277785, 0.2140689, 2.385242, 0, 0.2980392, 1, 1,
0.33119, 0.74323, 0.1872479, 0, 0.2901961, 1, 1,
0.3336298, 2.718106, 0.7107416, 0, 0.2862745, 1, 1,
0.3348513, -0.1231573, 2.692498, 0, 0.2784314, 1, 1,
0.3382194, -1.916679, 2.808431, 0, 0.2745098, 1, 1,
0.3394137, 0.3294272, 1.391865, 0, 0.2666667, 1, 1,
0.3401177, 1.530894, 1.091985, 0, 0.2627451, 1, 1,
0.3427578, 0.5064786, 1.273137, 0, 0.254902, 1, 1,
0.3463763, -0.5704837, 1.891111, 0, 0.2509804, 1, 1,
0.3532573, 0.7375288, 2.694885, 0, 0.2431373, 1, 1,
0.3547445, 0.4800994, 2.5947, 0, 0.2392157, 1, 1,
0.3577718, 0.6964504, -0.8562518, 0, 0.2313726, 1, 1,
0.3619482, 1.535579, -0.7364148, 0, 0.227451, 1, 1,
0.3628174, 2.435215, 1.95226, 0, 0.2196078, 1, 1,
0.3631877, 0.002759729, -0.05551306, 0, 0.2156863, 1, 1,
0.3660846, -0.3855836, 2.564822, 0, 0.2078431, 1, 1,
0.3687934, -0.162919, 3.012889, 0, 0.2039216, 1, 1,
0.3756567, -0.3280065, 1.405768, 0, 0.1960784, 1, 1,
0.3777248, -0.5885695, 2.115561, 0, 0.1882353, 1, 1,
0.3799154, 1.275947, -0.3569922, 0, 0.1843137, 1, 1,
0.381365, 1.154662, 0.1077292, 0, 0.1764706, 1, 1,
0.3854534, 0.3211585, 1.44301, 0, 0.172549, 1, 1,
0.390598, 0.962503, -0.4855635, 0, 0.1647059, 1, 1,
0.3908399, -0.243151, 1.582341, 0, 0.1607843, 1, 1,
0.3936521, 0.01149952, 2.707856, 0, 0.1529412, 1, 1,
0.3976515, -0.2523195, 1.877452, 0, 0.1490196, 1, 1,
0.3984024, 0.7581589, 0.04193399, 0, 0.1411765, 1, 1,
0.4044276, 0.5679766, 0.3595774, 0, 0.1372549, 1, 1,
0.4073655, 0.2493694, 0.2708006, 0, 0.1294118, 1, 1,
0.4083191, 1.178536, 1.285159, 0, 0.1254902, 1, 1,
0.4087954, -0.5835702, 1.774531, 0, 0.1176471, 1, 1,
0.4104331, 0.6762329, 0.761388, 0, 0.1137255, 1, 1,
0.4119617, -1.93882, 3.948177, 0, 0.1058824, 1, 1,
0.4137221, 0.4327241, 0.1454583, 0, 0.09803922, 1, 1,
0.4170539, -0.4416863, 0.4897889, 0, 0.09411765, 1, 1,
0.4188651, 0.7088818, 0.03010059, 0, 0.08627451, 1, 1,
0.4219716, -0.4281143, 2.568828, 0, 0.08235294, 1, 1,
0.424753, -0.7000741, 1.012739, 0, 0.07450981, 1, 1,
0.4281001, -0.4979124, 2.208292, 0, 0.07058824, 1, 1,
0.429253, -0.8507816, 3.192625, 0, 0.0627451, 1, 1,
0.4318039, 1.42898, 0.6170183, 0, 0.05882353, 1, 1,
0.4336209, 0.8307275, -0.3219502, 0, 0.05098039, 1, 1,
0.4344111, -0.9874405, 1.916895, 0, 0.04705882, 1, 1,
0.4353523, 0.3530971, 1.246658, 0, 0.03921569, 1, 1,
0.4364836, 1.50708, -2.163808, 0, 0.03529412, 1, 1,
0.4417687, 1.271422, -0.1820199, 0, 0.02745098, 1, 1,
0.4420345, -1.147595, 3.487657, 0, 0.02352941, 1, 1,
0.4439665, 0.3748524, 2.762413, 0, 0.01568628, 1, 1,
0.447074, -0.323571, 1.392385, 0, 0.01176471, 1, 1,
0.4510594, -0.6446789, 3.671265, 0, 0.003921569, 1, 1,
0.4526448, 0.07341012, 1.429641, 0.003921569, 0, 1, 1,
0.4534048, 0.2475419, 0.5157304, 0.007843138, 0, 1, 1,
0.4589492, 0.2304773, 0.9612789, 0.01568628, 0, 1, 1,
0.4602937, 1.985345, -1.489353, 0.01960784, 0, 1, 1,
0.4610432, 0.9185245, 0.9737371, 0.02745098, 0, 1, 1,
0.4616481, -1.328743, 2.459946, 0.03137255, 0, 1, 1,
0.4656597, 1.951425, -0.8769277, 0.03921569, 0, 1, 1,
0.4700631, 0.2763515, 1.254398, 0.04313726, 0, 1, 1,
0.472023, 0.4651196, 1.097106, 0.05098039, 0, 1, 1,
0.4743116, 1.409239, 0.08476985, 0.05490196, 0, 1, 1,
0.4758102, -0.1925891, 1.854314, 0.0627451, 0, 1, 1,
0.4767779, -0.5247008, 0.8062863, 0.06666667, 0, 1, 1,
0.4845696, 1.462178, 0.8713241, 0.07450981, 0, 1, 1,
0.4846233, 0.3606881, 1.904978, 0.07843138, 0, 1, 1,
0.4888239, -0.4850596, 3.594632, 0.08627451, 0, 1, 1,
0.4960318, 0.9199024, 2.210532, 0.09019608, 0, 1, 1,
0.4964111, -1.122255, 4.332402, 0.09803922, 0, 1, 1,
0.4969072, 0.007349747, 1.327138, 0.1058824, 0, 1, 1,
0.4995809, -1.184474, 3.57145, 0.1098039, 0, 1, 1,
0.5027805, -1.711518, 1.791664, 0.1176471, 0, 1, 1,
0.5028639, 0.2848755, 1.266255, 0.1215686, 0, 1, 1,
0.5100333, -0.09337569, 2.323213, 0.1294118, 0, 1, 1,
0.5165455, -0.8700324, 3.36904, 0.1333333, 0, 1, 1,
0.5210811, -1.051355, 2.59188, 0.1411765, 0, 1, 1,
0.5215621, -0.1023855, 3.996789, 0.145098, 0, 1, 1,
0.5282559, -1.231932, 4.362251, 0.1529412, 0, 1, 1,
0.5296199, -0.3373845, 2.828237, 0.1568628, 0, 1, 1,
0.5343919, -0.2378795, 1.014856, 0.1647059, 0, 1, 1,
0.5411422, -1.162998, 2.534213, 0.1686275, 0, 1, 1,
0.5428777, -1.242843, 1.018229, 0.1764706, 0, 1, 1,
0.5470437, -0.178422, 0.9913188, 0.1803922, 0, 1, 1,
0.5551988, 1.287839, 0.8211601, 0.1882353, 0, 1, 1,
0.5574762, 0.5272592, 0.3240072, 0.1921569, 0, 1, 1,
0.5594736, -1.608346, 2.725262, 0.2, 0, 1, 1,
0.5624742, 1.20419, 0.4086449, 0.2078431, 0, 1, 1,
0.562854, 0.2372983, 1.880376, 0.2117647, 0, 1, 1,
0.5629491, 1.958947, 0.398596, 0.2196078, 0, 1, 1,
0.5640635, -1.249007, 2.897356, 0.2235294, 0, 1, 1,
0.5650536, 0.8337917, -0.3028468, 0.2313726, 0, 1, 1,
0.5695001, -1.410736, 1.417324, 0.2352941, 0, 1, 1,
0.5702466, -0.9768056, 3.36813, 0.2431373, 0, 1, 1,
0.5702736, -1.222744, 4.84826, 0.2470588, 0, 1, 1,
0.5713356, -0.05196068, 3.033556, 0.254902, 0, 1, 1,
0.5735657, -1.839704, 2.879422, 0.2588235, 0, 1, 1,
0.5838738, -1.193909, 2.754934, 0.2666667, 0, 1, 1,
0.5925485, 0.1594413, 0.576878, 0.2705882, 0, 1, 1,
0.5954077, -1.68501, 4.008313, 0.2784314, 0, 1, 1,
0.598393, -0.3731465, 3.703065, 0.282353, 0, 1, 1,
0.5986103, 0.6382631, -0.5893601, 0.2901961, 0, 1, 1,
0.5990709, 1.665509, -1.540933, 0.2941177, 0, 1, 1,
0.6000852, 0.3575735, 1.397946, 0.3019608, 0, 1, 1,
0.6024764, 0.664431, 1.498719, 0.3098039, 0, 1, 1,
0.6046764, 1.470134, 0.9566537, 0.3137255, 0, 1, 1,
0.6082312, 0.02626366, -0.8208861, 0.3215686, 0, 1, 1,
0.6086097, 0.6039998, -0.7108165, 0.3254902, 0, 1, 1,
0.6098427, 0.04931448, 1.66971, 0.3333333, 0, 1, 1,
0.6116775, 0.3696252, 2.22704, 0.3372549, 0, 1, 1,
0.6207638, 0.4847374, 1.425819, 0.345098, 0, 1, 1,
0.6236995, 0.1210778, 3.045161, 0.3490196, 0, 1, 1,
0.6299385, -0.8674811, 2.046924, 0.3568628, 0, 1, 1,
0.6312082, -0.7603855, 3.125612, 0.3607843, 0, 1, 1,
0.6362225, 0.3971162, -0.004910433, 0.3686275, 0, 1, 1,
0.6406335, 1.102795, 1.809521, 0.372549, 0, 1, 1,
0.6441371, 1.0715, -1.385514, 0.3803922, 0, 1, 1,
0.6455193, 1.451288, 0.3640651, 0.3843137, 0, 1, 1,
0.6502517, 0.2423475, 2.764191, 0.3921569, 0, 1, 1,
0.6562937, 1.167792, -0.2235334, 0.3960784, 0, 1, 1,
0.6655035, 0.9977494, 1.580775, 0.4039216, 0, 1, 1,
0.6782628, 0.2775024, 0.6594898, 0.4117647, 0, 1, 1,
0.6783268, -0.5716618, 2.89687, 0.4156863, 0, 1, 1,
0.6787855, -0.9905091, 4.258433, 0.4235294, 0, 1, 1,
0.6821718, -1.911937, 3.535949, 0.427451, 0, 1, 1,
0.6827996, -0.2137913, 2.190375, 0.4352941, 0, 1, 1,
0.6886538, 1.106767, 1.072618, 0.4392157, 0, 1, 1,
0.6906033, 1.930811, 1.296243, 0.4470588, 0, 1, 1,
0.6930336, -0.7086917, 3.364173, 0.4509804, 0, 1, 1,
0.6946391, 0.2141678, 2.113808, 0.4588235, 0, 1, 1,
0.6971917, -0.3693827, 0.8379697, 0.4627451, 0, 1, 1,
0.6975098, -0.01441138, 0.01599045, 0.4705882, 0, 1, 1,
0.6983419, 0.4820697, 1.788568, 0.4745098, 0, 1, 1,
0.6985843, -1.049195, 2.851356, 0.4823529, 0, 1, 1,
0.6993825, 0.07847418, 2.226604, 0.4862745, 0, 1, 1,
0.6999092, -0.4285009, 2.082, 0.4941176, 0, 1, 1,
0.7030879, -0.5116038, 2.756946, 0.5019608, 0, 1, 1,
0.7033707, 0.8873618, 1.298136, 0.5058824, 0, 1, 1,
0.7091787, 0.3039597, 1.500676, 0.5137255, 0, 1, 1,
0.7111818, -1.285516, 1.974841, 0.5176471, 0, 1, 1,
0.7202336, -0.2787316, 4.57723, 0.5254902, 0, 1, 1,
0.728074, 1.844473, 0.1546749, 0.5294118, 0, 1, 1,
0.7314816, -0.33252, 0.1402658, 0.5372549, 0, 1, 1,
0.740698, 0.33806, 2.290351, 0.5411765, 0, 1, 1,
0.7435548, 0.1209551, 1.693892, 0.5490196, 0, 1, 1,
0.7552655, -0.3306636, 3.441585, 0.5529412, 0, 1, 1,
0.7554426, 0.604225, 0.04896446, 0.5607843, 0, 1, 1,
0.7634089, 1.276323, -0.3338035, 0.5647059, 0, 1, 1,
0.7698011, 0.8776108, 1.070659, 0.572549, 0, 1, 1,
0.7782274, 0.2895571, 1.061291, 0.5764706, 0, 1, 1,
0.7785076, -0.3028344, 1.939892, 0.5843138, 0, 1, 1,
0.779483, -0.2265342, 2.041112, 0.5882353, 0, 1, 1,
0.7796243, 1.213006, 1.432343, 0.5960785, 0, 1, 1,
0.7832747, 0.1240337, 2.143399, 0.6039216, 0, 1, 1,
0.7840186, -1.271932, 4.251916, 0.6078432, 0, 1, 1,
0.7854403, -0.894087, 1.949789, 0.6156863, 0, 1, 1,
0.790492, -0.03672488, 2.76987, 0.6196079, 0, 1, 1,
0.7960811, -0.5795358, 3.22534, 0.627451, 0, 1, 1,
0.7973539, 0.5230929, 1.544371, 0.6313726, 0, 1, 1,
0.7977126, -1.540123, 2.180986, 0.6392157, 0, 1, 1,
0.8016626, -1.052762, 0.9537577, 0.6431373, 0, 1, 1,
0.8089079, 0.4423026, 2.765196, 0.6509804, 0, 1, 1,
0.8112834, -0.1135126, 3.028592, 0.654902, 0, 1, 1,
0.8133959, -0.5583219, 2.429123, 0.6627451, 0, 1, 1,
0.8150732, -0.2280721, 1.963731, 0.6666667, 0, 1, 1,
0.8243917, -0.4543779, -0.1260993, 0.6745098, 0, 1, 1,
0.8272538, 1.871885, 1.087114, 0.6784314, 0, 1, 1,
0.8276588, 0.2698137, 0.9784714, 0.6862745, 0, 1, 1,
0.8368835, 0.06886148, 2.240079, 0.6901961, 0, 1, 1,
0.8370024, 0.291241, 1.148862, 0.6980392, 0, 1, 1,
0.8395153, -0.7499366, 2.908431, 0.7058824, 0, 1, 1,
0.8554639, 1.206039, 2.000922, 0.7098039, 0, 1, 1,
0.861374, 1.068719, 0.3103283, 0.7176471, 0, 1, 1,
0.8631968, -2.056089, 3.306586, 0.7215686, 0, 1, 1,
0.8653913, 0.2231098, -0.2348821, 0.7294118, 0, 1, 1,
0.8684294, 1.831497, 0.6789718, 0.7333333, 0, 1, 1,
0.8708641, 0.07479755, 1.071503, 0.7411765, 0, 1, 1,
0.8733629, -0.1105326, 1.342727, 0.7450981, 0, 1, 1,
0.8735191, 0.02244918, 2.348449, 0.7529412, 0, 1, 1,
0.8760578, 0.1559987, 1.731602, 0.7568628, 0, 1, 1,
0.8785779, 0.30297, 0.2856635, 0.7647059, 0, 1, 1,
0.8841947, 0.8240108, 1.956362, 0.7686275, 0, 1, 1,
0.8849366, 0.9772686, 1.116238, 0.7764706, 0, 1, 1,
0.8856798, -0.08861263, 2.426268, 0.7803922, 0, 1, 1,
0.8868481, 0.8771728, 0.6855399, 0.7882353, 0, 1, 1,
0.8880833, 0.2832087, 1.824903, 0.7921569, 0, 1, 1,
0.8949885, 0.5593145, -0.03833403, 0.8, 0, 1, 1,
0.8992293, -0.8923088, 1.574165, 0.8078431, 0, 1, 1,
0.9004822, -1.085643, 2.757654, 0.8117647, 0, 1, 1,
0.9138437, -0.1494852, 1.824207, 0.8196079, 0, 1, 1,
0.9156426, 1.100916, 0.8459262, 0.8235294, 0, 1, 1,
0.9258949, -2.659056, 2.614766, 0.8313726, 0, 1, 1,
0.9347193, -0.1578384, 3.243028, 0.8352941, 0, 1, 1,
0.942906, -0.06104317, 1.302885, 0.8431373, 0, 1, 1,
0.9432861, -1.60717, 3.520344, 0.8470588, 0, 1, 1,
0.945516, 0.9531692, 1.567968, 0.854902, 0, 1, 1,
0.9457479, 0.4707053, 2.558235, 0.8588235, 0, 1, 1,
0.9510733, -0.2706436, 1.812385, 0.8666667, 0, 1, 1,
0.9518694, -1.40477, 3.370809, 0.8705882, 0, 1, 1,
0.9559255, -0.00882289, 3.824547, 0.8784314, 0, 1, 1,
0.9614112, -1.037277, 1.303881, 0.8823529, 0, 1, 1,
0.9634131, -1.160107, 2.486813, 0.8901961, 0, 1, 1,
0.9749307, 0.20089, 2.270846, 0.8941177, 0, 1, 1,
1.000077, -0.6040859, 3.453241, 0.9019608, 0, 1, 1,
1.002756, 1.014343, 1.205009, 0.9098039, 0, 1, 1,
1.005246, -0.02949676, 0.07549651, 0.9137255, 0, 1, 1,
1.010694, -1.283518, 3.230159, 0.9215686, 0, 1, 1,
1.013276, 0.374668, 2.653142, 0.9254902, 0, 1, 1,
1.013339, -0.3997303, 2.566072, 0.9333333, 0, 1, 1,
1.014937, 0.163698, 0.3712817, 0.9372549, 0, 1, 1,
1.019072, -0.1377038, 1.53438, 0.945098, 0, 1, 1,
1.021627, -0.7001734, 0.2636878, 0.9490196, 0, 1, 1,
1.025798, 1.462929, 2.14268, 0.9568627, 0, 1, 1,
1.026412, 1.008388, 0.8624948, 0.9607843, 0, 1, 1,
1.027328, 0.508857, 2.384465, 0.9686275, 0, 1, 1,
1.032587, -0.5908092, 3.289387, 0.972549, 0, 1, 1,
1.034601, -0.6842309, 1.44477, 0.9803922, 0, 1, 1,
1.03916, -1.071165, 2.936559, 0.9843137, 0, 1, 1,
1.039205, -1.228596, 3.687865, 0.9921569, 0, 1, 1,
1.0411, -2.022543, 4.823355, 0.9960784, 0, 1, 1,
1.042911, 0.2183183, 0.6404054, 1, 0, 0.9960784, 1,
1.047538, -1.186002, 3.366127, 1, 0, 0.9882353, 1,
1.04777, -1.642574, 4.143421, 1, 0, 0.9843137, 1,
1.055537, -0.5525981, 1.052326, 1, 0, 0.9764706, 1,
1.057761, -0.4466258, 1.978783, 1, 0, 0.972549, 1,
1.063151, 0.1979256, 0.6334696, 1, 0, 0.9647059, 1,
1.067, 0.7728403, -0.9696857, 1, 0, 0.9607843, 1,
1.069382, 0.9613167, 0.1476268, 1, 0, 0.9529412, 1,
1.069687, 1.475488, 1.881499, 1, 0, 0.9490196, 1,
1.075401, 2.400163, -0.745843, 1, 0, 0.9411765, 1,
1.082789, 0.05219935, 2.245781, 1, 0, 0.9372549, 1,
1.083613, -1.713719, 2.722289, 1, 0, 0.9294118, 1,
1.089261, -1.416413, 2.080053, 1, 0, 0.9254902, 1,
1.091006, -0.09003592, -0.386713, 1, 0, 0.9176471, 1,
1.092617, -0.8582258, 2.159201, 1, 0, 0.9137255, 1,
1.096224, 0.8813527, 0.7450064, 1, 0, 0.9058824, 1,
1.099926, -2.187254, 3.371772, 1, 0, 0.9019608, 1,
1.100434, 0.7721965, 1.673602, 1, 0, 0.8941177, 1,
1.102549, 0.7941318, 0.8053094, 1, 0, 0.8862745, 1,
1.107929, 0.2712345, -0.8127563, 1, 0, 0.8823529, 1,
1.11276, 1.858958, -0.5180058, 1, 0, 0.8745098, 1,
1.114807, -1.322379, 3.292468, 1, 0, 0.8705882, 1,
1.118299, 1.343413, 0.6870022, 1, 0, 0.8627451, 1,
1.131442, -0.3574658, 0.7715719, 1, 0, 0.8588235, 1,
1.138964, -0.1668669, 1.488483, 1, 0, 0.8509804, 1,
1.141557, 0.6811877, 1.148598, 1, 0, 0.8470588, 1,
1.143466, 1.646043, 1.359518, 1, 0, 0.8392157, 1,
1.144523, 2.391076, -0.7734479, 1, 0, 0.8352941, 1,
1.14526, -0.6806611, 3.801143, 1, 0, 0.827451, 1,
1.145542, -0.8157581, 2.824916, 1, 0, 0.8235294, 1,
1.159602, -0.2160015, 1.501755, 1, 0, 0.8156863, 1,
1.161864, -0.3084865, 0.7671199, 1, 0, 0.8117647, 1,
1.166804, 1.296933, -0.05864958, 1, 0, 0.8039216, 1,
1.1728, 1.391344, -0.09389465, 1, 0, 0.7960784, 1,
1.175509, -0.006760407, 2.39576, 1, 0, 0.7921569, 1,
1.177049, -0.8592338, 1.763232, 1, 0, 0.7843137, 1,
1.185777, -0.1199244, 0.9578281, 1, 0, 0.7803922, 1,
1.186324, 0.4094089, 1.740294, 1, 0, 0.772549, 1,
1.189042, -0.08937932, 1.937602, 1, 0, 0.7686275, 1,
1.195879, -1.097192, 1.472907, 1, 0, 0.7607843, 1,
1.19787, 0.06614468, 1.575975, 1, 0, 0.7568628, 1,
1.198354, 1.607015, 2.99426, 1, 0, 0.7490196, 1,
1.216485, -0.1260556, 1.259547, 1, 0, 0.7450981, 1,
1.218952, -0.3506604, 2.284262, 1, 0, 0.7372549, 1,
1.222917, 0.2998967, 0.685289, 1, 0, 0.7333333, 1,
1.233847, -0.08187214, 1.992548, 1, 0, 0.7254902, 1,
1.246689, 0.2376055, 0.7378625, 1, 0, 0.7215686, 1,
1.249039, 0.6922184, 1.545584, 1, 0, 0.7137255, 1,
1.255702, 0.6954337, 0.4858787, 1, 0, 0.7098039, 1,
1.262663, -1.630885, 0.3358183, 1, 0, 0.7019608, 1,
1.264458, -0.8129811, 1.947335, 1, 0, 0.6941177, 1,
1.265452, 1.688504, 2.25815, 1, 0, 0.6901961, 1,
1.26959, 1.472568, 0.8445995, 1, 0, 0.682353, 1,
1.278147, 0.1104094, 2.24883, 1, 0, 0.6784314, 1,
1.294174, -0.3009486, 1.645405, 1, 0, 0.6705883, 1,
1.297621, 0.0470271, 2.319133, 1, 0, 0.6666667, 1,
1.30451, -0.1560526, 2.732745, 1, 0, 0.6588235, 1,
1.308127, 0.1712294, 1.756558, 1, 0, 0.654902, 1,
1.310335, -1.701868, 2.290708, 1, 0, 0.6470588, 1,
1.311287, 1.297826, 3.116184, 1, 0, 0.6431373, 1,
1.323751, -0.1490815, 1.623985, 1, 0, 0.6352941, 1,
1.331359, -0.1373319, 0.7675295, 1, 0, 0.6313726, 1,
1.331647, 1.727396, 0.7677214, 1, 0, 0.6235294, 1,
1.33674, 0.4772072, 1.414831, 1, 0, 0.6196079, 1,
1.337972, 0.718776, 1.261834, 1, 0, 0.6117647, 1,
1.346467, -0.584325, 2.980692, 1, 0, 0.6078432, 1,
1.350495, 1.222417, 0.8460414, 1, 0, 0.6, 1,
1.358394, 0.7403129, 1.939644, 1, 0, 0.5921569, 1,
1.368228, -0.05985599, -0.125828, 1, 0, 0.5882353, 1,
1.374321, -0.3544505, 2.685246, 1, 0, 0.5803922, 1,
1.381357, 0.8811736, 0.6628634, 1, 0, 0.5764706, 1,
1.381612, -0.847585, 3.375287, 1, 0, 0.5686275, 1,
1.39763, 1.075656, 1.454838, 1, 0, 0.5647059, 1,
1.414914, -2.207726, 3.085209, 1, 0, 0.5568628, 1,
1.416898, -0.4379256, 1.390716, 1, 0, 0.5529412, 1,
1.426063, 0.6743726, 0.7481662, 1, 0, 0.5450981, 1,
1.435782, 0.4097461, 1.35725, 1, 0, 0.5411765, 1,
1.435827, -0.2823088, 3.825587, 1, 0, 0.5333334, 1,
1.442875, 0.2184311, -0.7792153, 1, 0, 0.5294118, 1,
1.443739, 0.7438617, 1.837224, 1, 0, 0.5215687, 1,
1.447671, -1.804062, 0.5967904, 1, 0, 0.5176471, 1,
1.453043, 0.9369918, 1.324282, 1, 0, 0.509804, 1,
1.453461, -1.964246, 1.28715, 1, 0, 0.5058824, 1,
1.462379, -0.1096968, 1.419599, 1, 0, 0.4980392, 1,
1.467255, 0.7076042, 0.2480866, 1, 0, 0.4901961, 1,
1.468897, -0.8514697, 1.763551, 1, 0, 0.4862745, 1,
1.471848, 0.7766698, 1.244778, 1, 0, 0.4784314, 1,
1.488119, 1.622042, 0.684369, 1, 0, 0.4745098, 1,
1.506147, 0.7456371, 1.290484, 1, 0, 0.4666667, 1,
1.507704, 0.755871, 1.683895, 1, 0, 0.4627451, 1,
1.510145, -0.7920113, 2.293485, 1, 0, 0.454902, 1,
1.529759, -0.6540213, 1.103954, 1, 0, 0.4509804, 1,
1.530226, 0.3340887, 1.442764, 1, 0, 0.4431373, 1,
1.538253, 0.1750142, 0.7258954, 1, 0, 0.4392157, 1,
1.541572, -2.29982, 1.840633, 1, 0, 0.4313726, 1,
1.54213, 1.769893, -0.02049497, 1, 0, 0.427451, 1,
1.547248, -0.06050668, 2.070797, 1, 0, 0.4196078, 1,
1.55099, -0.3483709, 0.6821089, 1, 0, 0.4156863, 1,
1.55197, 0.84339, 0.5631115, 1, 0, 0.4078431, 1,
1.554034, -0.3066998, 2.695634, 1, 0, 0.4039216, 1,
1.560264, -0.08800501, 1.537091, 1, 0, 0.3960784, 1,
1.576943, -0.5852157, 1.777301, 1, 0, 0.3882353, 1,
1.576948, -1.159934, 0.5206416, 1, 0, 0.3843137, 1,
1.578653, -1.611584, 1.1543, 1, 0, 0.3764706, 1,
1.598577, 0.2720052, 2.725108, 1, 0, 0.372549, 1,
1.605986, 1.114297, 1.074612, 1, 0, 0.3647059, 1,
1.622879, -1.28532, 4.698071, 1, 0, 0.3607843, 1,
1.627797, -0.9426648, 1.153153, 1, 0, 0.3529412, 1,
1.633151, 1.569469, 2.669571, 1, 0, 0.3490196, 1,
1.677106, 0.3625367, 0.3444269, 1, 0, 0.3411765, 1,
1.677696, 0.5640998, 1.413702, 1, 0, 0.3372549, 1,
1.691563, -1.312535, 2.045511, 1, 0, 0.3294118, 1,
1.711653, -0.4177504, 1.808048, 1, 0, 0.3254902, 1,
1.715798, 0.3384686, 0.4265246, 1, 0, 0.3176471, 1,
1.745926, -0.7051931, 3.050138, 1, 0, 0.3137255, 1,
1.749085, -0.2929693, 0.4108712, 1, 0, 0.3058824, 1,
1.749908, 0.9680589, 0.9472137, 1, 0, 0.2980392, 1,
1.756448, 1.312775, -1.190308, 1, 0, 0.2941177, 1,
1.758576, 0.3114597, 1.830237, 1, 0, 0.2862745, 1,
1.770678, -1.21113, 0.6523758, 1, 0, 0.282353, 1,
1.775613, 0.2363974, 2.724786, 1, 0, 0.2745098, 1,
1.780493, -0.6841621, 1.720978, 1, 0, 0.2705882, 1,
1.78398, 0.9532485, 0.8097557, 1, 0, 0.2627451, 1,
1.815024, 0.802233, -0.4997699, 1, 0, 0.2588235, 1,
1.863698, -0.2620849, 1.083247, 1, 0, 0.2509804, 1,
1.884126, -2.061596, 0.772536, 1, 0, 0.2470588, 1,
1.921925, -0.2621412, 1.21263, 1, 0, 0.2392157, 1,
1.939439, -0.3509997, 1.795922, 1, 0, 0.2352941, 1,
1.941419, -2.06248, 2.228363, 1, 0, 0.227451, 1,
1.945876, -0.563668, 1.939841, 1, 0, 0.2235294, 1,
1.993045, -0.4262854, 2.330529, 1, 0, 0.2156863, 1,
1.993179, 0.6309091, 1.519011, 1, 0, 0.2117647, 1,
1.997842, -0.5544085, 2.883986, 1, 0, 0.2039216, 1,
2.023821, 1.559168, 1.2288, 1, 0, 0.1960784, 1,
2.031151, 0.6832815, 1.000606, 1, 0, 0.1921569, 1,
2.036573, 0.1292803, 1.509449, 1, 0, 0.1843137, 1,
2.042923, 0.3239149, 2.298121, 1, 0, 0.1803922, 1,
2.04457, -0.8568769, 1.894742, 1, 0, 0.172549, 1,
2.084257, -0.388521, -0.2063899, 1, 0, 0.1686275, 1,
2.096897, -0.447336, 3.260791, 1, 0, 0.1607843, 1,
2.098841, -0.9884667, 0.5048119, 1, 0, 0.1568628, 1,
2.11197, -2.453733, 3.371191, 1, 0, 0.1490196, 1,
2.115572, -0.9510878, 1.712325, 1, 0, 0.145098, 1,
2.117606, 1.225603, 2.32278, 1, 0, 0.1372549, 1,
2.122463, -1.498334, 1.328972, 1, 0, 0.1333333, 1,
2.123477, -0.07465184, 2.668896, 1, 0, 0.1254902, 1,
2.138509, -0.9185459, 1.214512, 1, 0, 0.1215686, 1,
2.144053, -0.7742158, 2.362826, 1, 0, 0.1137255, 1,
2.186345, -0.1946767, 0.9099371, 1, 0, 0.1098039, 1,
2.219861, 0.07425932, 1.123694, 1, 0, 0.1019608, 1,
2.238276, 0.1675848, 0.7598943, 1, 0, 0.09411765, 1,
2.264224, -0.191541, 0.6093557, 1, 0, 0.09019608, 1,
2.357063, 1.055225, 0.4563951, 1, 0, 0.08235294, 1,
2.388684, 0.7694755, 2.348563, 1, 0, 0.07843138, 1,
2.394445, 0.4367717, 0.04562538, 1, 0, 0.07058824, 1,
2.556255, 0.4838498, 1.332432, 1, 0, 0.06666667, 1,
2.567501, -0.7572074, 1.320368, 1, 0, 0.05882353, 1,
2.639458, -0.008051614, 0.5431696, 1, 0, 0.05490196, 1,
2.682809, 0.470192, 0.09273675, 1, 0, 0.04705882, 1,
2.700748, -0.1221186, 2.051693, 1, 0, 0.04313726, 1,
2.732089, -1.720692, 3.84901, 1, 0, 0.03529412, 1,
2.745515, -0.5403554, 2.715951, 1, 0, 0.03137255, 1,
2.882677, -1.112731, 1.973614, 1, 0, 0.02352941, 1,
2.968058, -1.534204, 2.237021, 1, 0, 0.01960784, 1,
3.110471, -0.3541217, 1.582492, 1, 0, 0.01176471, 1,
3.22279, -0.5191175, 0.7097197, 1, 0, 0.007843138, 1
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
0.05465066, -4.351064, -6.819963, 0, -0.5, 0.5, 0.5,
0.05465066, -4.351064, -6.819963, 1, -0.5, 0.5, 0.5,
0.05465066, -4.351064, -6.819963, 1, 1.5, 0.5, 0.5,
0.05465066, -4.351064, -6.819963, 0, 1.5, 0.5, 0.5
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
-4.187488, 0.6431116, -6.819963, 0, -0.5, 0.5, 0.5,
-4.187488, 0.6431116, -6.819963, 1, -0.5, 0.5, 0.5,
-4.187488, 0.6431116, -6.819963, 1, 1.5, 0.5, 0.5,
-4.187488, 0.6431116, -6.819963, 0, 1.5, 0.5, 0.5
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
-4.187488, -4.351064, -0.1402917, 0, -0.5, 0.5, 0.5,
-4.187488, -4.351064, -0.1402917, 1, -0.5, 0.5, 0.5,
-4.187488, -4.351064, -0.1402917, 1, 1.5, 0.5, 0.5,
-4.187488, -4.351064, -0.1402917, 0, 1.5, 0.5, 0.5
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
-3, -3.198562, -5.2785,
3, -3.198562, -5.2785,
-3, -3.198562, -5.2785,
-3, -3.390645, -5.53541,
-2, -3.198562, -5.2785,
-2, -3.390645, -5.53541,
-1, -3.198562, -5.2785,
-1, -3.390645, -5.53541,
0, -3.198562, -5.2785,
0, -3.390645, -5.53541,
1, -3.198562, -5.2785,
1, -3.390645, -5.53541,
2, -3.198562, -5.2785,
2, -3.390645, -5.53541,
3, -3.198562, -5.2785,
3, -3.390645, -5.53541
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
-3, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
-3, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
-3, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
-3, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
-2, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
-2, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
-2, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
-2, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
-1, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
-1, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
-1, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
-1, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
0, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
0, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
0, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
0, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
1, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
1, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
1, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
1, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
2, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
2, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
2, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
2, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5,
3, -3.774813, -6.049231, 0, -0.5, 0.5, 0.5,
3, -3.774813, -6.049231, 1, -0.5, 0.5, 0.5,
3, -3.774813, -6.049231, 1, 1.5, 0.5, 0.5,
3, -3.774813, -6.049231, 0, 1.5, 0.5, 0.5
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
-3.208533, -2, -5.2785,
-3.208533, 4, -5.2785,
-3.208533, -2, -5.2785,
-3.371692, -2, -5.53541,
-3.208533, 0, -5.2785,
-3.371692, 0, -5.53541,
-3.208533, 2, -5.2785,
-3.371692, 2, -5.53541,
-3.208533, 4, -5.2785,
-3.371692, 4, -5.53541
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
"2",
"4"
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
-3.69801, -2, -6.049231, 0, -0.5, 0.5, 0.5,
-3.69801, -2, -6.049231, 1, -0.5, 0.5, 0.5,
-3.69801, -2, -6.049231, 1, 1.5, 0.5, 0.5,
-3.69801, -2, -6.049231, 0, 1.5, 0.5, 0.5,
-3.69801, 0, -6.049231, 0, -0.5, 0.5, 0.5,
-3.69801, 0, -6.049231, 1, -0.5, 0.5, 0.5,
-3.69801, 0, -6.049231, 1, 1.5, 0.5, 0.5,
-3.69801, 0, -6.049231, 0, 1.5, 0.5, 0.5,
-3.69801, 2, -6.049231, 0, -0.5, 0.5, 0.5,
-3.69801, 2, -6.049231, 1, -0.5, 0.5, 0.5,
-3.69801, 2, -6.049231, 1, 1.5, 0.5, 0.5,
-3.69801, 2, -6.049231, 0, 1.5, 0.5, 0.5,
-3.69801, 4, -6.049231, 0, -0.5, 0.5, 0.5,
-3.69801, 4, -6.049231, 1, -0.5, 0.5, 0.5,
-3.69801, 4, -6.049231, 1, 1.5, 0.5, 0.5,
-3.69801, 4, -6.049231, 0, 1.5, 0.5, 0.5
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
-3.208533, -3.198562, -4,
-3.208533, -3.198562, 4,
-3.208533, -3.198562, -4,
-3.371692, -3.390645, -4,
-3.208533, -3.198562, -2,
-3.371692, -3.390645, -2,
-3.208533, -3.198562, 0,
-3.371692, -3.390645, 0,
-3.208533, -3.198562, 2,
-3.371692, -3.390645, 2,
-3.208533, -3.198562, 4,
-3.371692, -3.390645, 4
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
-3.69801, -3.774813, -4, 0, -0.5, 0.5, 0.5,
-3.69801, -3.774813, -4, 1, -0.5, 0.5, 0.5,
-3.69801, -3.774813, -4, 1, 1.5, 0.5, 0.5,
-3.69801, -3.774813, -4, 0, 1.5, 0.5, 0.5,
-3.69801, -3.774813, -2, 0, -0.5, 0.5, 0.5,
-3.69801, -3.774813, -2, 1, -0.5, 0.5, 0.5,
-3.69801, -3.774813, -2, 1, 1.5, 0.5, 0.5,
-3.69801, -3.774813, -2, 0, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 0, 0, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 0, 1, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 0, 1, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 0, 0, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 2, 0, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 2, 1, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 2, 1, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 2, 0, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 4, 0, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 4, 1, -0.5, 0.5, 0.5,
-3.69801, -3.774813, 4, 1, 1.5, 0.5, 0.5,
-3.69801, -3.774813, 4, 0, 1.5, 0.5, 0.5
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
-3.208533, -3.198562, -5.2785,
-3.208533, 4.484785, -5.2785,
-3.208533, -3.198562, 4.997917,
-3.208533, 4.484785, 4.997917,
-3.208533, -3.198562, -5.2785,
-3.208533, -3.198562, 4.997917,
-3.208533, 4.484785, -5.2785,
-3.208533, 4.484785, 4.997917,
-3.208533, -3.198562, -5.2785,
3.317834, -3.198562, -5.2785,
-3.208533, -3.198562, 4.997917,
3.317834, -3.198562, 4.997917,
-3.208533, 4.484785, -5.2785,
3.317834, 4.484785, -5.2785,
-3.208533, 4.484785, 4.997917,
3.317834, 4.484785, 4.997917,
3.317834, -3.198562, -5.2785,
3.317834, 4.484785, -5.2785,
3.317834, -3.198562, 4.997917,
3.317834, 4.484785, 4.997917,
3.317834, -3.198562, -5.2785,
3.317834, -3.198562, 4.997917,
3.317834, 4.484785, -5.2785,
3.317834, 4.484785, 4.997917
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
var radius = 7.686947;
var distance = 34.2001;
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
mvMatrix.translate( -0.05465066, -0.6431116, 0.1402917 );
mvMatrix.scale( 1.273492, 1.081726, 0.808772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2001);
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
sodium_metaarsenite<-read.table("sodium_metaarsenite.xyz")
```

```
## Error in read.table("sodium_metaarsenite.xyz"): no lines available in input
```

```r
x<-sodium_metaarsenite$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
```

```r
y<-sodium_metaarsenite$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
```

```r
z<-sodium_metaarsenite$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
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
-3.113488, -0.3106528, -1.69797, 0, 0, 1, 1, 1,
-3.038918, 1.782897, 0.1856857, 1, 0, 0, 1, 1,
-3.028726, 1.223122, -1.916577, 1, 0, 0, 1, 1,
-2.785692, 0.3354192, -0.9651397, 1, 0, 0, 1, 1,
-2.653661, -1.327719, -0.3235662, 1, 0, 0, 1, 1,
-2.607548, -1.201742, -1.149451, 1, 0, 0, 1, 1,
-2.604336, 0.2793564, -1.93863, 0, 0, 0, 1, 1,
-2.594565, -0.3153268, -1.682611, 0, 0, 0, 1, 1,
-2.543316, -1.355432, -2.126097, 0, 0, 0, 1, 1,
-2.346637, -0.5801733, -1.145638, 0, 0, 0, 1, 1,
-2.327656, -2.278334, -3.023495, 0, 0, 0, 1, 1,
-2.307571, -1.175904, -2.455312, 0, 0, 0, 1, 1,
-2.302377, 0.6119523, -3.647202, 0, 0, 0, 1, 1,
-2.202717, -0.1260489, -3.451847, 1, 1, 1, 1, 1,
-2.158993, 0.5710942, -2.012772, 1, 1, 1, 1, 1,
-2.144724, 1.723308, -0.2111864, 1, 1, 1, 1, 1,
-2.051979, 1.154997, -0.6128798, 1, 1, 1, 1, 1,
-1.993152, -0.5957698, -1.143052, 1, 1, 1, 1, 1,
-1.991872, 1.166269, -0.8841954, 1, 1, 1, 1, 1,
-1.973012, 2.084555, -3.29617, 1, 1, 1, 1, 1,
-1.966623, 0.4450199, 0.1683057, 1, 1, 1, 1, 1,
-1.939761, 0.5701581, 0.7854353, 1, 1, 1, 1, 1,
-1.915653, 0.9126747, -1.402878, 1, 1, 1, 1, 1,
-1.90347, 1.743565, -1.608458, 1, 1, 1, 1, 1,
-1.902932, -0.003991816, -0.9698538, 1, 1, 1, 1, 1,
-1.889608, -0.5596169, -2.522465, 1, 1, 1, 1, 1,
-1.8823, 0.161962, -1.536155, 1, 1, 1, 1, 1,
-1.862406, 1.402265, -0.2657159, 1, 1, 1, 1, 1,
-1.861787, 0.5165921, -1.393145, 0, 0, 1, 1, 1,
-1.85896, -0.2345524, -1.479053, 1, 0, 0, 1, 1,
-1.802629, -1.480894, -2.588257, 1, 0, 0, 1, 1,
-1.797528, 1.027304, -2.00755, 1, 0, 0, 1, 1,
-1.794911, -1.484182, -2.57224, 1, 0, 0, 1, 1,
-1.75135, 0.5668777, -0.7719512, 1, 0, 0, 1, 1,
-1.750411, -0.4318914, -2.720703, 0, 0, 0, 1, 1,
-1.731952, 1.877506, 0.07258598, 0, 0, 0, 1, 1,
-1.721728, 0.8484131, -0.517165, 0, 0, 0, 1, 1,
-1.717215, -0.9688373, -3.739008, 0, 0, 0, 1, 1,
-1.711432, 0.01202825, -1.100575, 0, 0, 0, 1, 1,
-1.704106, -1.339578, -1.999179, 0, 0, 0, 1, 1,
-1.703578, -0.539079, -2.541744, 0, 0, 0, 1, 1,
-1.700357, 0.01988586, -0.9391381, 1, 1, 1, 1, 1,
-1.70021, 0.9248384, -1.31306, 1, 1, 1, 1, 1,
-1.688977, 1.594727, 0.1395816, 1, 1, 1, 1, 1,
-1.686181, -0.1213591, -0.5721474, 1, 1, 1, 1, 1,
-1.6717, -0.531206, -2.667585, 1, 1, 1, 1, 1,
-1.6694, 1.486095, -0.9261239, 1, 1, 1, 1, 1,
-1.667875, 1.917148, -0.7208903, 1, 1, 1, 1, 1,
-1.662446, -0.4439578, -1.371726, 1, 1, 1, 1, 1,
-1.639725, 1.953143, -2.491069, 1, 1, 1, 1, 1,
-1.637891, -1.99146, -2.563768, 1, 1, 1, 1, 1,
-1.63685, 0.7399642, -1.812427, 1, 1, 1, 1, 1,
-1.633265, 1.16664, 0.8374717, 1, 1, 1, 1, 1,
-1.597105, 0.8328435, -0.8777456, 1, 1, 1, 1, 1,
-1.584558, 1.113301, -1.368105, 1, 1, 1, 1, 1,
-1.579307, -2.218312, -3.838206, 1, 1, 1, 1, 1,
-1.549779, 0.7757195, -0.9403028, 0, 0, 1, 1, 1,
-1.548748, 0.001484764, -1.686406, 1, 0, 0, 1, 1,
-1.543659, 0.3077301, -2.387196, 1, 0, 0, 1, 1,
-1.537351, 0.5288442, -2.244156, 1, 0, 0, 1, 1,
-1.532903, 0.0563494, -2.142298, 1, 0, 0, 1, 1,
-1.530958, 0.2116366, -1.60169, 1, 0, 0, 1, 1,
-1.522551, -0.02917939, -2.212337, 0, 0, 0, 1, 1,
-1.518165, -0.1045894, -1.478614, 0, 0, 0, 1, 1,
-1.517143, -1.264481, -3.031323, 0, 0, 0, 1, 1,
-1.509089, 1.708291, -1.12168, 0, 0, 0, 1, 1,
-1.50314, 0.7142003, 0.6780442, 0, 0, 0, 1, 1,
-1.499081, -1.213404, -2.837142, 0, 0, 0, 1, 1,
-1.497433, 0.5691141, -0.9963343, 0, 0, 0, 1, 1,
-1.484735, 0.8650046, 0.1271143, 1, 1, 1, 1, 1,
-1.477823, -0.7851998, -1.798415, 1, 1, 1, 1, 1,
-1.476576, 0.5580721, -1.746609, 1, 1, 1, 1, 1,
-1.47624, 0.9699237, -2.675138, 1, 1, 1, 1, 1,
-1.461325, 1.537422, -1.343357, 1, 1, 1, 1, 1,
-1.460921, -1.094372, -2.372261, 1, 1, 1, 1, 1,
-1.454066, 0.7713702, -1.239566, 1, 1, 1, 1, 1,
-1.447155, 0.7734757, -1.176269, 1, 1, 1, 1, 1,
-1.443715, -0.2610554, -1.232706, 1, 1, 1, 1, 1,
-1.442707, 1.983929, 1.657365, 1, 1, 1, 1, 1,
-1.440438, 0.461191, -1.381014, 1, 1, 1, 1, 1,
-1.429118, 0.8919683, 0.7281142, 1, 1, 1, 1, 1,
-1.418813, 1.054358, -1.553217, 1, 1, 1, 1, 1,
-1.40785, 0.7646272, 0.4631357, 1, 1, 1, 1, 1,
-1.406827, 0.9085875, -0.2243658, 1, 1, 1, 1, 1,
-1.393976, -0.1400225, -0.3172069, 0, 0, 1, 1, 1,
-1.390812, 0.004136472, -1.741735, 1, 0, 0, 1, 1,
-1.389307, -0.7172399, -1.176794, 1, 0, 0, 1, 1,
-1.387554, 0.04923799, 0.3283336, 1, 0, 0, 1, 1,
-1.386893, 0.4410398, -0.8829259, 1, 0, 0, 1, 1,
-1.37457, 2.140343, -3.413426, 1, 0, 0, 1, 1,
-1.365982, 0.02871219, -1.734621, 0, 0, 0, 1, 1,
-1.36551, 0.4418127, -0.6479421, 0, 0, 0, 1, 1,
-1.361639, 0.7518353, -1.998471, 0, 0, 0, 1, 1,
-1.356578, -0.9208888, -3.505008, 0, 0, 0, 1, 1,
-1.350453, -0.3189678, -1.889028, 0, 0, 0, 1, 1,
-1.333306, 0.6737524, -1.750825, 0, 0, 0, 1, 1,
-1.327294, 0.3195243, 0.2461219, 0, 0, 0, 1, 1,
-1.326084, 1.022981, -1.375075, 1, 1, 1, 1, 1,
-1.314124, -0.09023916, -2.281035, 1, 1, 1, 1, 1,
-1.309573, -0.4729199, -1.686818, 1, 1, 1, 1, 1,
-1.304777, 0.3787327, -1.203868, 1, 1, 1, 1, 1,
-1.302685, 0.8255366, -2.06223, 1, 1, 1, 1, 1,
-1.301221, -1.544503, -1.879408, 1, 1, 1, 1, 1,
-1.299067, -1.475851, -3.154127, 1, 1, 1, 1, 1,
-1.293122, -0.2090078, -1.283533, 1, 1, 1, 1, 1,
-1.291354, 0.4338524, -1.616672, 1, 1, 1, 1, 1,
-1.281806, -1.115779, -1.936898, 1, 1, 1, 1, 1,
-1.28092, 1.435922, 0.3413119, 1, 1, 1, 1, 1,
-1.273954, -0.4058985, -3.268296, 1, 1, 1, 1, 1,
-1.272607, 1.23496, 1.219869, 1, 1, 1, 1, 1,
-1.272557, -0.09759248, -0.822441, 1, 1, 1, 1, 1,
-1.272385, 1.59688, 0.2758528, 1, 1, 1, 1, 1,
-1.268949, -0.0446297, -2.031518, 0, 0, 1, 1, 1,
-1.267336, 0.05974887, -1.989385, 1, 0, 0, 1, 1,
-1.261326, 0.9719281, 0.5728107, 1, 0, 0, 1, 1,
-1.259432, 0.2635589, -2.026176, 1, 0, 0, 1, 1,
-1.258356, 0.03754591, -1.51211, 1, 0, 0, 1, 1,
-1.253266, 0.6743332, -1.197278, 1, 0, 0, 1, 1,
-1.234112, 0.2168414, -2.506936, 0, 0, 0, 1, 1,
-1.232352, -0.5494977, -0.515361, 0, 0, 0, 1, 1,
-1.23222, -1.013655, -1.234697, 0, 0, 0, 1, 1,
-1.22577, 1.691535, -1.141006, 0, 0, 0, 1, 1,
-1.225362, -0.36298, -2.312708, 0, 0, 0, 1, 1,
-1.218362, 0.5966629, -0.759189, 0, 0, 0, 1, 1,
-1.182989, 1.102135, -0.2360026, 0, 0, 0, 1, 1,
-1.178544, 0.6871833, -1.331556, 1, 1, 1, 1, 1,
-1.178122, -1.223528, -3.97765, 1, 1, 1, 1, 1,
-1.177526, -0.2318211, -0.5864401, 1, 1, 1, 1, 1,
-1.175309, 0.2074388, -2.346966, 1, 1, 1, 1, 1,
-1.173676, -0.948747, -2.233677, 1, 1, 1, 1, 1,
-1.173275, 0.5408388, 1.137731, 1, 1, 1, 1, 1,
-1.171956, 0.9753073, 0.01424621, 1, 1, 1, 1, 1,
-1.165241, -0.01168418, -3.262558, 1, 1, 1, 1, 1,
-1.16242, -0.6000904, -1.157303, 1, 1, 1, 1, 1,
-1.161227, -0.4164909, -2.922596, 1, 1, 1, 1, 1,
-1.156258, -0.1283884, -2.682148, 1, 1, 1, 1, 1,
-1.152775, 0.7821141, -2.455199, 1, 1, 1, 1, 1,
-1.141492, -0.7374961, -4.277374, 1, 1, 1, 1, 1,
-1.134659, -0.5404906, -2.508096, 1, 1, 1, 1, 1,
-1.127356, 0.3217827, -1.566725, 1, 1, 1, 1, 1,
-1.124651, 0.7912832, -1.270148, 0, 0, 1, 1, 1,
-1.122978, -0.3531061, -0.82303, 1, 0, 0, 1, 1,
-1.098615, 0.1725579, -1.095219, 1, 0, 0, 1, 1,
-1.098253, 0.5283312, -0.359676, 1, 0, 0, 1, 1,
-1.096086, -1.221068, -1.721353, 1, 0, 0, 1, 1,
-1.094078, -0.7170026, -2.084222, 1, 0, 0, 1, 1,
-1.090739, -0.7911385, -1.221703, 0, 0, 0, 1, 1,
-1.087311, -0.9005886, -4.611494, 0, 0, 0, 1, 1,
-1.077759, -0.09802597, -1.277173, 0, 0, 0, 1, 1,
-1.074606, 2.184789, -0.9100533, 0, 0, 0, 1, 1,
-1.071934, 1.182513, -0.5419489, 0, 0, 0, 1, 1,
-1.068102, 0.2845801, -1.485688, 0, 0, 0, 1, 1,
-1.067586, -0.6090897, -2.203267, 0, 0, 0, 1, 1,
-1.067382, 0.217596, -1.55573, 1, 1, 1, 1, 1,
-1.064625, -0.3857042, -1.60594, 1, 1, 1, 1, 1,
-1.054181, -0.2118607, 0.3853918, 1, 1, 1, 1, 1,
-1.048252, -1.910338, -1.962409, 1, 1, 1, 1, 1,
-1.039707, 1.647869, -0.1267629, 1, 1, 1, 1, 1,
-1.035822, -0.6357709, -1.915637, 1, 1, 1, 1, 1,
-1.023685, -2.669457, -3.246293, 1, 1, 1, 1, 1,
-1.023426, -1.834696, -3.856034, 1, 1, 1, 1, 1,
-1.020801, 0.927593, 1.7027, 1, 1, 1, 1, 1,
-0.9970408, 0.7896443, -0.8307332, 1, 1, 1, 1, 1,
-0.9949227, 0.2568269, -1.974651, 1, 1, 1, 1, 1,
-0.9923191, 0.2162829, -2.02476, 1, 1, 1, 1, 1,
-0.9897535, 0.01123117, -3.20678, 1, 1, 1, 1, 1,
-0.985608, 0.2209727, -1.59973, 1, 1, 1, 1, 1,
-0.9841302, -2.100121, -4.169799, 1, 1, 1, 1, 1,
-0.9778531, 0.06572675, -1.629207, 0, 0, 1, 1, 1,
-0.975332, -0.3258655, -2.332268, 1, 0, 0, 1, 1,
-0.9582996, 0.04497018, -1.093668, 1, 0, 0, 1, 1,
-0.9553201, -0.6849367, -1.729986, 1, 0, 0, 1, 1,
-0.9542786, 0.004577474, -1.722871, 1, 0, 0, 1, 1,
-0.9540333, -0.9021127, -3.210274, 1, 0, 0, 1, 1,
-0.9523747, 1.124392, 0.3035085, 0, 0, 0, 1, 1,
-0.9519767, 0.7160053, -1.405445, 0, 0, 0, 1, 1,
-0.9467221, -0.8542359, -4.036234, 0, 0, 0, 1, 1,
-0.9440196, 2.534558, -0.7509407, 0, 0, 0, 1, 1,
-0.9371004, -1.397335, -1.824887, 0, 0, 0, 1, 1,
-0.9345018, 0.1487151, -2.167838, 0, 0, 0, 1, 1,
-0.9285544, -0.3288183, -2.335012, 0, 0, 0, 1, 1,
-0.9282811, 0.9404157, 0.1130226, 1, 1, 1, 1, 1,
-0.9266003, 0.3388815, 0.4971132, 1, 1, 1, 1, 1,
-0.9261591, 1.448632, -0.5810149, 1, 1, 1, 1, 1,
-0.9250128, 0.5880689, -0.3457054, 1, 1, 1, 1, 1,
-0.9174111, 1.429879, 1.093646, 1, 1, 1, 1, 1,
-0.913502, -0.1869907, -1.893686, 1, 1, 1, 1, 1,
-0.9121348, -0.7371778, -2.090379, 1, 1, 1, 1, 1,
-0.911733, 0.1067946, -1.173649, 1, 1, 1, 1, 1,
-0.9109932, 2.573734, -1.972564, 1, 1, 1, 1, 1,
-0.9086761, -0.1058986, -2.066958, 1, 1, 1, 1, 1,
-0.9085702, 0.3260296, -0.9930781, 1, 1, 1, 1, 1,
-0.9074245, 1.047056, -1.905955, 1, 1, 1, 1, 1,
-0.8982716, -1.393017, -2.903782, 1, 1, 1, 1, 1,
-0.8970659, 0.7465261, -0.1196846, 1, 1, 1, 1, 1,
-0.8913336, -0.1180363, 0.7012697, 1, 1, 1, 1, 1,
-0.8844771, 1.953718, -1.050159, 0, 0, 1, 1, 1,
-0.8794388, -0.2370093, -1.767887, 1, 0, 0, 1, 1,
-0.878307, -0.8996121, -1.22971, 1, 0, 0, 1, 1,
-0.8752639, 0.5722741, -0.7513741, 1, 0, 0, 1, 1,
-0.8718272, -0.5987822, -2.228267, 1, 0, 0, 1, 1,
-0.8703769, 0.7030039, -0.6167795, 1, 0, 0, 1, 1,
-0.8660362, 0.1307057, -2.43864, 0, 0, 0, 1, 1,
-0.8642763, -0.2840395, -3.70289, 0, 0, 0, 1, 1,
-0.8630522, -0.6379915, -4.194246, 0, 0, 0, 1, 1,
-0.8588673, 0.9563926, -0.00817903, 0, 0, 0, 1, 1,
-0.858524, -0.3535543, -1.954734, 0, 0, 0, 1, 1,
-0.8425292, -1.573436, -1.405173, 0, 0, 0, 1, 1,
-0.8350308, -2.098452, -0.5497451, 0, 0, 0, 1, 1,
-0.8218059, -0.944554, -3.864112, 1, 1, 1, 1, 1,
-0.8181489, -1.267355, -0.7842755, 1, 1, 1, 1, 1,
-0.8145036, -0.4934667, -4.099333, 1, 1, 1, 1, 1,
-0.8088475, 0.4778914, -2.151997, 1, 1, 1, 1, 1,
-0.808176, 0.8384497, -0.4663935, 1, 1, 1, 1, 1,
-0.8009166, -0.5411854, -3.580727, 1, 1, 1, 1, 1,
-0.799692, -1.451127, -2.53978, 1, 1, 1, 1, 1,
-0.7979354, 0.1462456, -0.002782426, 1, 1, 1, 1, 1,
-0.7965245, -0.7591141, -1.844915, 1, 1, 1, 1, 1,
-0.7941405, -0.1443856, -1.858157, 1, 1, 1, 1, 1,
-0.7933825, 1.499967, -1.058867, 1, 1, 1, 1, 1,
-0.779594, 1.079263, 0.04600038, 1, 1, 1, 1, 1,
-0.7750176, -2.12149, -2.163972, 1, 1, 1, 1, 1,
-0.7710238, 1.366545, 0.08559661, 1, 1, 1, 1, 1,
-0.7694061, 1.189439, -1.938032, 1, 1, 1, 1, 1,
-0.7693525, 0.6999317, 0.4418405, 0, 0, 1, 1, 1,
-0.7641853, 1.772131, 0.1330713, 1, 0, 0, 1, 1,
-0.7628977, 0.3076366, -0.9418309, 1, 0, 0, 1, 1,
-0.7614969, 2.001369, -0.2402643, 1, 0, 0, 1, 1,
-0.7590627, -1.115533, -3.346489, 1, 0, 0, 1, 1,
-0.7576569, 1.04525, 0.2347126, 1, 0, 0, 1, 1,
-0.7557888, -1.239244, -2.006884, 0, 0, 0, 1, 1,
-0.7488539, 0.1541888, -1.338711, 0, 0, 0, 1, 1,
-0.7452561, -0.842908, -3.279139, 0, 0, 0, 1, 1,
-0.7431859, 0.07538347, -2.824252, 0, 0, 0, 1, 1,
-0.7405539, -0.6758958, -1.835294, 0, 0, 0, 1, 1,
-0.7403585, -0.007968897, -1.536181, 0, 0, 0, 1, 1,
-0.7402242, 0.6992154, -0.2607611, 0, 0, 0, 1, 1,
-0.7320169, -0.3725789, -2.604145, 1, 1, 1, 1, 1,
-0.7256516, 0.2919428, -0.1335361, 1, 1, 1, 1, 1,
-0.7217911, -0.5939366, -2.468615, 1, 1, 1, 1, 1,
-0.7188292, -0.238251, -2.927265, 1, 1, 1, 1, 1,
-0.7183671, -0.8497722, -3.057019, 1, 1, 1, 1, 1,
-0.7180963, -1.896019, -2.3842, 1, 1, 1, 1, 1,
-0.7162762, 0.6150825, 0.6608184, 1, 1, 1, 1, 1,
-0.7146512, 0.2641681, -3.128282, 1, 1, 1, 1, 1,
-0.7094383, -0.9222301, -2.829003, 1, 1, 1, 1, 1,
-0.7087783, 1.233472, 0.7564204, 1, 1, 1, 1, 1,
-0.7085783, -0.06542744, -2.881119, 1, 1, 1, 1, 1,
-0.7080702, 0.5731726, 1.285766, 1, 1, 1, 1, 1,
-0.7075481, -1.563361, -2.339722, 1, 1, 1, 1, 1,
-0.7068018, -0.03255164, -2.764852, 1, 1, 1, 1, 1,
-0.6978568, 0.5600075, -0.9781982, 1, 1, 1, 1, 1,
-0.6975635, 0.1886013, -0.3472601, 0, 0, 1, 1, 1,
-0.6952962, -1.017299, -2.014233, 1, 0, 0, 1, 1,
-0.6941164, 1.771247, 0.6684925, 1, 0, 0, 1, 1,
-0.6941001, -0.5413668, -2.14164, 1, 0, 0, 1, 1,
-0.6913029, 0.7578371, -0.2052576, 1, 0, 0, 1, 1,
-0.6902512, 0.09058269, -0.4551626, 1, 0, 0, 1, 1,
-0.682589, 0.4657724, -0.7069386, 0, 0, 0, 1, 1,
-0.6825154, 0.9860538, -2.010429, 0, 0, 0, 1, 1,
-0.677259, 1.450214, -0.5438145, 0, 0, 0, 1, 1,
-0.6662662, -0.8077797, -1.063423, 0, 0, 0, 1, 1,
-0.6649922, -0.3021333, -1.99205, 0, 0, 0, 1, 1,
-0.6643443, 1.550914, -0.1923279, 0, 0, 0, 1, 1,
-0.6572312, -1.65986, -3.398536, 0, 0, 0, 1, 1,
-0.6515397, 0.2199825, -0.534627, 1, 1, 1, 1, 1,
-0.6430547, 1.754994, -1.307187, 1, 1, 1, 1, 1,
-0.6410315, 0.1168537, -3.184318, 1, 1, 1, 1, 1,
-0.6337293, -0.4832976, -3.071785, 1, 1, 1, 1, 1,
-0.6251462, 0.5245052, 0.5631728, 1, 1, 1, 1, 1,
-0.6210539, -1.541052, -3.543947, 1, 1, 1, 1, 1,
-0.6207617, 0.9913781, -2.149376, 1, 1, 1, 1, 1,
-0.6181354, -0.7250372, -1.610962, 1, 1, 1, 1, 1,
-0.6167209, 0.9722936, -2.278445, 1, 1, 1, 1, 1,
-0.6138151, -1.791199, -2.127299, 1, 1, 1, 1, 1,
-0.6120105, 0.9700392, 0.1933972, 1, 1, 1, 1, 1,
-0.6101975, 0.02119341, -1.319773, 1, 1, 1, 1, 1,
-0.5972894, -1.179095, -4.878647, 1, 1, 1, 1, 1,
-0.5965174, -0.3057566, -2.076758, 1, 1, 1, 1, 1,
-0.5956261, -0.02946916, -0.5175038, 1, 1, 1, 1, 1,
-0.5941759, 0.2009206, -0.9307804, 0, 0, 1, 1, 1,
-0.5877709, 0.2725664, -0.8983796, 1, 0, 0, 1, 1,
-0.5854576, -0.2414951, -4.867341, 1, 0, 0, 1, 1,
-0.584413, -0.1245701, -0.9926111, 1, 0, 0, 1, 1,
-0.582878, 1.250426, 0.03702646, 1, 0, 0, 1, 1,
-0.5804328, 0.6519018, 1.307826, 1, 0, 0, 1, 1,
-0.5803016, 0.5940235, -1.266299, 0, 0, 0, 1, 1,
-0.5778692, -1.87303, -1.046326, 0, 0, 0, 1, 1,
-0.5777961, 0.09506702, -1.399656, 0, 0, 0, 1, 1,
-0.5723958, 0.7106786, 0.6409924, 0, 0, 0, 1, 1,
-0.5709811, 1.217229, 0.2826954, 0, 0, 0, 1, 1,
-0.5708151, 1.076258, -0.3474512, 0, 0, 0, 1, 1,
-0.5679832, 0.08485021, -1.765177, 0, 0, 0, 1, 1,
-0.560459, 0.9240811, -0.7144909, 1, 1, 1, 1, 1,
-0.5582108, 0.5090148, -0.3114539, 1, 1, 1, 1, 1,
-0.5549182, -0.5405332, -2.509364, 1, 1, 1, 1, 1,
-0.5548052, 0.800813, -0.2948839, 1, 1, 1, 1, 1,
-0.5539767, 0.1845054, -1.295026, 1, 1, 1, 1, 1,
-0.5494334, -1.04264, -3.08489, 1, 1, 1, 1, 1,
-0.5475124, -1.425061, -4.694195, 1, 1, 1, 1, 1,
-0.546797, 1.32769, -0.01755246, 1, 1, 1, 1, 1,
-0.5431634, -0.8456552, -2.54383, 1, 1, 1, 1, 1,
-0.5427766, 0.2377509, -0.8843164, 1, 1, 1, 1, 1,
-0.5425757, -0.5841748, -1.59099, 1, 1, 1, 1, 1,
-0.5388414, -0.7904255, -2.368359, 1, 1, 1, 1, 1,
-0.5379855, -0.640087, -4.32199, 1, 1, 1, 1, 1,
-0.5371992, -1.143314, -2.691792, 1, 1, 1, 1, 1,
-0.5341408, 0.6857732, -0.436959, 1, 1, 1, 1, 1,
-0.5319899, -0.01975346, -1.817671, 0, 0, 1, 1, 1,
-0.5237292, -0.9253793, -4.248341, 1, 0, 0, 1, 1,
-0.5129184, -1.179925, -5.128843, 1, 0, 0, 1, 1,
-0.5096208, 1.096992, 0.5883377, 1, 0, 0, 1, 1,
-0.5074556, 0.5226406, -0.686, 1, 0, 0, 1, 1,
-0.5058517, -0.5903947, -3.464783, 1, 0, 0, 1, 1,
-0.5011333, -0.6877192, -2.749751, 0, 0, 0, 1, 1,
-0.4955277, -0.1335813, -2.057967, 0, 0, 0, 1, 1,
-0.4949976, -1.482445, -1.500479, 0, 0, 0, 1, 1,
-0.4941802, 0.6920664, -1.347636, 0, 0, 0, 1, 1,
-0.4881363, 0.8025293, -0.3835063, 0, 0, 0, 1, 1,
-0.4856486, -1.584876, -4.018663, 0, 0, 0, 1, 1,
-0.4836043, -1.410158, -2.939236, 0, 0, 0, 1, 1,
-0.4815496, 0.457073, 0.2312711, 1, 1, 1, 1, 1,
-0.4715251, 0.5530742, 0.116393, 1, 1, 1, 1, 1,
-0.4669794, 1.547015, -1.257778, 1, 1, 1, 1, 1,
-0.4617698, 0.004802802, -2.802797, 1, 1, 1, 1, 1,
-0.4574343, -1.156399, -1.6917, 1, 1, 1, 1, 1,
-0.4572887, 0.7921854, 0.7414689, 1, 1, 1, 1, 1,
-0.4515424, -0.08956832, -2.056711, 1, 1, 1, 1, 1,
-0.444608, -0.05937448, -1.071347, 1, 1, 1, 1, 1,
-0.4430539, 0.5488915, -0.9056104, 1, 1, 1, 1, 1,
-0.4408126, -0.3798076, -4.338142, 1, 1, 1, 1, 1,
-0.4395475, 0.9961818, -2.044441, 1, 1, 1, 1, 1,
-0.4374246, 0.747798, 0.7251723, 1, 1, 1, 1, 1,
-0.43552, -0.9079404, -2.621813, 1, 1, 1, 1, 1,
-0.43076, -1.793175, -2.547018, 1, 1, 1, 1, 1,
-0.4305789, 0.7275975, 0.2075562, 1, 1, 1, 1, 1,
-0.4295111, 2.328873, 0.2419305, 0, 0, 1, 1, 1,
-0.4269838, -1.165019, -2.065744, 1, 0, 0, 1, 1,
-0.4242736, -1.395338, -2.89057, 1, 0, 0, 1, 1,
-0.4217121, 1.055396, 0.3608842, 1, 0, 0, 1, 1,
-0.4199831, 0.5985916, -1.328925, 1, 0, 0, 1, 1,
-0.4153514, -0.03779296, -0.9450264, 1, 0, 0, 1, 1,
-0.4120497, -0.6861598, -2.819876, 0, 0, 0, 1, 1,
-0.4097162, 1.173901, -0.4883909, 0, 0, 0, 1, 1,
-0.409144, -0.7469268, -3.703459, 0, 0, 0, 1, 1,
-0.4088316, 0.8805765, 0.5086571, 0, 0, 0, 1, 1,
-0.4052639, 0.1734162, 0.3627771, 0, 0, 0, 1, 1,
-0.4016704, 0.3327714, -1.40111, 0, 0, 0, 1, 1,
-0.3991614, 2.071881, -0.3164295, 0, 0, 0, 1, 1,
-0.3972358, -1.86271, -4.801745, 1, 1, 1, 1, 1,
-0.395783, 0.5932904, -0.2419963, 1, 1, 1, 1, 1,
-0.3928671, 0.8069211, 0.1869955, 1, 1, 1, 1, 1,
-0.3927827, 1.868332, 0.6893578, 1, 1, 1, 1, 1,
-0.3910241, -2.109608, -3.301758, 1, 1, 1, 1, 1,
-0.3906285, -0.4637088, -0.5463966, 1, 1, 1, 1, 1,
-0.3880327, -0.3584553, -1.137169, 1, 1, 1, 1, 1,
-0.3859634, 2.230623, 0.690035, 1, 1, 1, 1, 1,
-0.3835573, 0.5042696, -0.949524, 1, 1, 1, 1, 1,
-0.3830055, 0.6606675, -2.228986, 1, 1, 1, 1, 1,
-0.3806576, -1.821569, -0.6724783, 1, 1, 1, 1, 1,
-0.3792985, 0.1589836, -1.642955, 1, 1, 1, 1, 1,
-0.3677267, -1.241, -3.226503, 1, 1, 1, 1, 1,
-0.3667602, -0.1717675, -1.892163, 1, 1, 1, 1, 1,
-0.3656337, -0.5383027, -4.125096, 1, 1, 1, 1, 1,
-0.3467655, 0.743288, 0.8315097, 0, 0, 1, 1, 1,
-0.3465575, 0.2630521, -2.527692, 1, 0, 0, 1, 1,
-0.3450484, -1.056682, -3.397429, 1, 0, 0, 1, 1,
-0.3340258, 0.5161752, -1.328639, 1, 0, 0, 1, 1,
-0.3306765, -0.7406583, -2.609426, 1, 0, 0, 1, 1,
-0.3303629, 0.2943874, -2.996297, 1, 0, 0, 1, 1,
-0.3290392, 0.0716816, -1.095254, 0, 0, 0, 1, 1,
-0.3246811, 0.8586309, -0.4811441, 0, 0, 0, 1, 1,
-0.3209081, -0.5409703, -2.321285, 0, 0, 0, 1, 1,
-0.3185106, 0.4242698, -1.691035, 0, 0, 0, 1, 1,
-0.3177339, -0.6764995, -2.670137, 0, 0, 0, 1, 1,
-0.3165053, -0.9451106, -0.6574764, 0, 0, 0, 1, 1,
-0.3154987, -1.220112, -4.37627, 0, 0, 0, 1, 1,
-0.3151649, -0.3883323, -3.873507, 1, 1, 1, 1, 1,
-0.3102149, 0.1417425, -2.419289, 1, 1, 1, 1, 1,
-0.3098834, 0.8609144, -0.2451651, 1, 1, 1, 1, 1,
-0.3067472, 0.03229001, -4.245412, 1, 1, 1, 1, 1,
-0.3041884, 1.120791, -0.1137235, 1, 1, 1, 1, 1,
-0.3026724, -0.4113463, -2.761389, 1, 1, 1, 1, 1,
-0.3006001, -1.270951, -3.362097, 1, 1, 1, 1, 1,
-0.2991517, -0.2223904, -1.564833, 1, 1, 1, 1, 1,
-0.2978548, -0.01237796, -1.651263, 1, 1, 1, 1, 1,
-0.297645, 4.372891, 2.07159, 1, 1, 1, 1, 1,
-0.2932555, 0.04117661, -0.1567127, 1, 1, 1, 1, 1,
-0.2886085, 0.2975068, -1.293593, 1, 1, 1, 1, 1,
-0.2873851, -1.525797, -2.303178, 1, 1, 1, 1, 1,
-0.2855283, 1.033332, -1.376335, 1, 1, 1, 1, 1,
-0.2846844, 0.08965692, -0.5685378, 1, 1, 1, 1, 1,
-0.2831624, 0.4203716, -1.082621, 0, 0, 1, 1, 1,
-0.2811564, 1.155833, 2.324451, 1, 0, 0, 1, 1,
-0.2779678, -0.4457402, -1.565341, 1, 0, 0, 1, 1,
-0.2719146, 1.451271, 1.938846, 1, 0, 0, 1, 1,
-0.2690246, 1.017751, 0.8425695, 1, 0, 0, 1, 1,
-0.2629077, 0.7923641, 0.505299, 1, 0, 0, 1, 1,
-0.2616517, 0.772586, 1.643256, 0, 0, 0, 1, 1,
-0.260654, -2.305361, -2.609025, 0, 0, 0, 1, 1,
-0.2595413, -0.8722274, -2.007308, 0, 0, 0, 1, 1,
-0.2548677, 1.050626, 0.05180332, 0, 0, 0, 1, 1,
-0.2545885, 0.4299757, 0.1736231, 0, 0, 0, 1, 1,
-0.2529902, 0.7592596, 0.6161877, 0, 0, 0, 1, 1,
-0.2504323, -1.095031, -3.466437, 0, 0, 0, 1, 1,
-0.2494195, 1.454755, 1.371016, 1, 1, 1, 1, 1,
-0.2453355, -1.47472, -1.517576, 1, 1, 1, 1, 1,
-0.2417246, -0.08893431, -2.636898, 1, 1, 1, 1, 1,
-0.2410411, 1.442198, 0.1297498, 1, 1, 1, 1, 1,
-0.2400122, -0.5077637, -0.747709, 1, 1, 1, 1, 1,
-0.2359871, -0.3855272, -1.675811, 1, 1, 1, 1, 1,
-0.2350729, 1.666525, 0.3597915, 1, 1, 1, 1, 1,
-0.2334412, 0.1806054, -2.253105, 1, 1, 1, 1, 1,
-0.2244367, -0.309056, -1.105971, 1, 1, 1, 1, 1,
-0.2241828, -0.7116833, -3.192629, 1, 1, 1, 1, 1,
-0.2221621, 0.9314691, 0.08238167, 1, 1, 1, 1, 1,
-0.22107, -1.68154, -2.035307, 1, 1, 1, 1, 1,
-0.2207806, -0.2179024, -2.483255, 1, 1, 1, 1, 1,
-0.2137528, 0.4487879, -0.5390782, 1, 1, 1, 1, 1,
-0.2127156, 0.8262124, 1.298406, 1, 1, 1, 1, 1,
-0.2094869, 0.6451684, 0.3748429, 0, 0, 1, 1, 1,
-0.2077266, -0.842271, -4.099498, 1, 0, 0, 1, 1,
-0.2075411, 1.715849, -0.2127202, 1, 0, 0, 1, 1,
-0.2044986, 0.3639893, 0.5540224, 1, 0, 0, 1, 1,
-0.2034574, -0.1233409, -1.075797, 1, 0, 0, 1, 1,
-0.1969705, 0.4783655, -1.202794, 1, 0, 0, 1, 1,
-0.1932266, 0.7882189, -1.466715, 0, 0, 0, 1, 1,
-0.1891354, 1.594553, 0.3864197, 0, 0, 0, 1, 1,
-0.1882312, -0.7955347, -2.238097, 0, 0, 0, 1, 1,
-0.1858422, -0.7772041, -1.342039, 0, 0, 0, 1, 1,
-0.1780631, -0.000882588, -2.185496, 0, 0, 0, 1, 1,
-0.1757612, -0.4869814, -1.753109, 0, 0, 0, 1, 1,
-0.1736987, 0.9523767, 0.7349375, 0, 0, 0, 1, 1,
-0.1730322, -0.2813196, -2.464784, 1, 1, 1, 1, 1,
-0.1702928, 1.173252, 0.204593, 1, 1, 1, 1, 1,
-0.1699664, 1.68969, 0.3611775, 1, 1, 1, 1, 1,
-0.1685736, 1.672977, -0.3129716, 1, 1, 1, 1, 1,
-0.1684284, 0.282222, 0.4897422, 1, 1, 1, 1, 1,
-0.1646084, 0.149165, -0.2951837, 1, 1, 1, 1, 1,
-0.1639864, -0.3607711, -1.474175, 1, 1, 1, 1, 1,
-0.1619873, -0.7992163, -2.773012, 1, 1, 1, 1, 1,
-0.1552977, 0.31653, -1.519113, 1, 1, 1, 1, 1,
-0.1506121, 1.003936, -0.4387287, 1, 1, 1, 1, 1,
-0.1449499, 0.4809181, -0.4902251, 1, 1, 1, 1, 1,
-0.1370574, -0.05648017, -2.228419, 1, 1, 1, 1, 1,
-0.1349301, -0.823855, -4.382809, 1, 1, 1, 1, 1,
-0.1346129, 0.780856, 0.2915185, 1, 1, 1, 1, 1,
-0.1340478, -0.7341579, -2.913043, 1, 1, 1, 1, 1,
-0.1272788, 0.02184447, -0.8666082, 0, 0, 1, 1, 1,
-0.1272711, 1.425919, -1.501038, 1, 0, 0, 1, 1,
-0.1255554, 0.1873244, -0.3637585, 1, 0, 0, 1, 1,
-0.1241684, 0.1529386, -0.6825063, 1, 0, 0, 1, 1,
-0.1220013, -1.124146, -1.767173, 1, 0, 0, 1, 1,
-0.1185607, 0.2247718, -1.058531, 1, 0, 0, 1, 1,
-0.1175558, 0.009377421, -0.5855529, 0, 0, 0, 1, 1,
-0.1155425, 1.326371, -1.658134, 0, 0, 0, 1, 1,
-0.11257, 0.01244364, -1.287026, 0, 0, 0, 1, 1,
-0.1124819, 0.7181762, 0.2965665, 0, 0, 0, 1, 1,
-0.1123732, 0.9810389, -0.6784185, 0, 0, 0, 1, 1,
-0.111751, -1.262299, -2.851908, 0, 0, 0, 1, 1,
-0.1055178, -1.008958, -2.136445, 0, 0, 0, 1, 1,
-0.105123, -0.2736789, -3.593695, 1, 1, 1, 1, 1,
-0.10296, 1.398924, 0.2000569, 1, 1, 1, 1, 1,
-0.1012217, -3.086668, -1.8003, 1, 1, 1, 1, 1,
-0.09630243, 0.2018921, -1.644645, 1, 1, 1, 1, 1,
-0.0943742, 0.2103793, 0.1646239, 1, 1, 1, 1, 1,
-0.09435838, 2.175106, 0.7986274, 1, 1, 1, 1, 1,
-0.0920506, 2.758138, -0.8929372, 1, 1, 1, 1, 1,
-0.09183846, 0.3930288, -1.541384, 1, 1, 1, 1, 1,
-0.0886132, 0.3476037, 1.641876, 1, 1, 1, 1, 1,
-0.08739428, -0.308897, -3.304501, 1, 1, 1, 1, 1,
-0.08731802, -0.9113962, -3.191224, 1, 1, 1, 1, 1,
-0.07884767, -0.197001, -3.027442, 1, 1, 1, 1, 1,
-0.07650594, 2.163491, -0.2957021, 1, 1, 1, 1, 1,
-0.07579766, 0.8296972, 0.8032629, 1, 1, 1, 1, 1,
-0.07431084, -0.5056159, -3.618628, 1, 1, 1, 1, 1,
-0.07214524, -0.291554, -2.909637, 0, 0, 1, 1, 1,
-0.07165478, 0.2891102, 1.311789, 1, 0, 0, 1, 1,
-0.07068156, 1.197573, -0.5752144, 1, 0, 0, 1, 1,
-0.06906741, 0.2133571, 0.290444, 1, 0, 0, 1, 1,
-0.06582348, 0.1692152, -0.4142454, 1, 0, 0, 1, 1,
-0.06566951, 1.451218, -0.3216097, 1, 0, 0, 1, 1,
-0.06561157, 0.01927861, -2.400326, 0, 0, 0, 1, 1,
-0.06500456, -1.398649, -3.35829, 0, 0, 0, 1, 1,
-0.04770785, 0.2978435, 2.073642, 0, 0, 0, 1, 1,
-0.04698355, -0.2838753, -2.36054, 0, 0, 0, 1, 1,
-0.04397975, -0.8975669, -3.491334, 0, 0, 0, 1, 1,
-0.04320431, 1.238536, 0.4454241, 0, 0, 0, 1, 1,
-0.0419258, -0.7399219, -1.983448, 0, 0, 0, 1, 1,
-0.0408662, -0.244516, -3.577131, 1, 1, 1, 1, 1,
-0.03758083, 1.380661, -0.5478152, 1, 1, 1, 1, 1,
-0.03607265, 0.3486719, 0.008482337, 1, 1, 1, 1, 1,
-0.01975812, -0.2434949, -3.50884, 1, 1, 1, 1, 1,
-0.01873264, -0.2662391, -4.648547, 1, 1, 1, 1, 1,
-0.01569471, 0.2432726, -0.1023149, 1, 1, 1, 1, 1,
-0.0154225, 0.6827176, -0.0379442, 1, 1, 1, 1, 1,
-0.01218899, -0.1906617, -2.357543, 1, 1, 1, 1, 1,
-0.01053163, 0.6987494, 2.238334, 1, 1, 1, 1, 1,
-0.008366903, 1.284097, -1.175612, 1, 1, 1, 1, 1,
-0.007158777, 0.8586174, -3.181812, 1, 1, 1, 1, 1,
0.002006426, 0.2305938, -0.7209643, 1, 1, 1, 1, 1,
0.003673635, 0.2156723, 0.2605194, 1, 1, 1, 1, 1,
0.004644724, -1.506692, 2.023239, 1, 1, 1, 1, 1,
0.01003294, -0.4300143, 1.846954, 1, 1, 1, 1, 1,
0.01337553, -1.04669, 3.858841, 0, 0, 1, 1, 1,
0.01838281, -0.007846577, 1.942138, 1, 0, 0, 1, 1,
0.02290505, 0.859254, -0.1163636, 1, 0, 0, 1, 1,
0.02772015, -0.1863982, 4.356951, 1, 0, 0, 1, 1,
0.03024186, -0.4492358, 3.380608, 1, 0, 0, 1, 1,
0.03189002, -1.581632, 3.317483, 1, 0, 0, 1, 1,
0.03398974, 1.099354, 0.8399594, 0, 0, 0, 1, 1,
0.04607049, -0.3746408, 3.757751, 0, 0, 0, 1, 1,
0.04627832, 0.9819474, -1.024038, 0, 0, 0, 1, 1,
0.04860865, -0.467715, 3.912247, 0, 0, 0, 1, 1,
0.05046296, -0.1551229, 3.611881, 0, 0, 0, 1, 1,
0.05170496, -0.7032598, 3.207548, 0, 0, 0, 1, 1,
0.06668533, 0.5596139, -0.2352724, 0, 0, 0, 1, 1,
0.0774061, -0.2857455, 2.321849, 1, 1, 1, 1, 1,
0.07830071, 1.249697, 0.04994928, 1, 1, 1, 1, 1,
0.08063272, -1.682959, 3.107219, 1, 1, 1, 1, 1,
0.08268457, -1.168142, 4.128348, 1, 1, 1, 1, 1,
0.08403214, -1.047556, 1.485979, 1, 1, 1, 1, 1,
0.08968344, -0.5887905, 3.464039, 1, 1, 1, 1, 1,
0.09090816, -0.7383499, 2.782956, 1, 1, 1, 1, 1,
0.09432385, 0.4082887, 2.124604, 1, 1, 1, 1, 1,
0.09614608, -0.3123923, 2.739801, 1, 1, 1, 1, 1,
0.09934198, -1.933459, 3.306701, 1, 1, 1, 1, 1,
0.1008242, 0.3627864, -0.3645092, 1, 1, 1, 1, 1,
0.1009696, 2.06567, 0.08207078, 1, 1, 1, 1, 1,
0.1043342, 0.2129535, -1.020626, 1, 1, 1, 1, 1,
0.1091723, 1.404007, 0.5391476, 1, 1, 1, 1, 1,
0.1104761, 1.685708, 0.2530479, 1, 1, 1, 1, 1,
0.1115441, 1.02602, -0.3957834, 0, 0, 1, 1, 1,
0.1124796, -0.06914911, 1.945857, 1, 0, 0, 1, 1,
0.11684, -0.9118316, 3.249899, 1, 0, 0, 1, 1,
0.1197086, -0.5568877, 1.318435, 1, 0, 0, 1, 1,
0.1224307, 1.828285, 0.8183601, 1, 0, 0, 1, 1,
0.122843, 0.2967776, 1.831568, 1, 0, 0, 1, 1,
0.1350446, 1.145702, -1.844998, 0, 0, 0, 1, 1,
0.1364358, 1.283213, 0.00355906, 0, 0, 0, 1, 1,
0.1447566, -0.8207514, 2.989129, 0, 0, 0, 1, 1,
0.1452502, -0.7861196, 0.9924114, 0, 0, 0, 1, 1,
0.1477082, -1.287228, 2.895508, 0, 0, 0, 1, 1,
0.1483806, 1.702239, -1.356016, 0, 0, 0, 1, 1,
0.148753, -0.6544883, 1.995704, 0, 0, 0, 1, 1,
0.1493977, 0.1468391, 0.7746782, 1, 1, 1, 1, 1,
0.152046, 0.6244716, -0.4358475, 1, 1, 1, 1, 1,
0.153139, 1.313416, 1.027904, 1, 1, 1, 1, 1,
0.1569621, 0.7156336, -1.318392, 1, 1, 1, 1, 1,
0.1578461, 1.059117, 0.2655191, 1, 1, 1, 1, 1,
0.1578967, -1.091143, 2.707779, 1, 1, 1, 1, 1,
0.1589725, -0.4471977, 3.063067, 1, 1, 1, 1, 1,
0.1625181, 0.3043148, 1.456701, 1, 1, 1, 1, 1,
0.162766, -0.9513096, 4.673243, 1, 1, 1, 1, 1,
0.1631109, -0.2822291, 2.168805, 1, 1, 1, 1, 1,
0.1670814, -0.9746829, 4.730838, 1, 1, 1, 1, 1,
0.1670882, -1.634084, 1.328358, 1, 1, 1, 1, 1,
0.167852, 0.1892311, 1.610125, 1, 1, 1, 1, 1,
0.1683696, 1.188371, 0.02561865, 1, 1, 1, 1, 1,
0.1684003, -0.3217413, 2.015588, 1, 1, 1, 1, 1,
0.1722141, 0.6279402, -0.07579035, 0, 0, 1, 1, 1,
0.1776978, 1.208789, 0.2042681, 1, 0, 0, 1, 1,
0.1779962, 2.101511, 1.212523, 1, 0, 0, 1, 1,
0.1790845, 1.017475, -2.014114, 1, 0, 0, 1, 1,
0.1808188, 0.7099246, 0.6420692, 1, 0, 0, 1, 1,
0.1837679, 0.9430496, -0.2098568, 1, 0, 0, 1, 1,
0.1871159, 0.5623869, 2.818058, 0, 0, 0, 1, 1,
0.1896118, -1.565339, 4.247944, 0, 0, 0, 1, 1,
0.1908198, -0.4591709, 2.111089, 0, 0, 0, 1, 1,
0.1923827, -0.9624004, 3.844197, 0, 0, 0, 1, 1,
0.1961597, -1.939388, 4.684293, 0, 0, 0, 1, 1,
0.2011016, -1.25307, 2.399451, 0, 0, 0, 1, 1,
0.2012499, 0.1974726, 1.351913, 0, 0, 0, 1, 1,
0.2014593, -0.4683105, 2.941543, 1, 1, 1, 1, 1,
0.2089242, -0.5485827, 3.395217, 1, 1, 1, 1, 1,
0.2109812, -1.004406, 3.310642, 1, 1, 1, 1, 1,
0.2151854, -0.1409999, 1.362203, 1, 1, 1, 1, 1,
0.2178382, -0.4569132, 2.311341, 1, 1, 1, 1, 1,
0.2194049, 0.927408, -0.1257149, 1, 1, 1, 1, 1,
0.219911, -0.4996714, 1.433717, 1, 1, 1, 1, 1,
0.2255454, 1.912221, -0.7960706, 1, 1, 1, 1, 1,
0.2325659, -0.6643111, 3.309972, 1, 1, 1, 1, 1,
0.2385205, -1.364124, 3.261236, 1, 1, 1, 1, 1,
0.2420574, -1.117779, 1.927243, 1, 1, 1, 1, 1,
0.2441536, 0.4050901, 3.423499, 1, 1, 1, 1, 1,
0.2453837, -0.669463, 2.006099, 1, 1, 1, 1, 1,
0.2466464, -0.9138076, 3.702839, 1, 1, 1, 1, 1,
0.2588326, -1.153221, 3.048224, 1, 1, 1, 1, 1,
0.2595936, 0.7942759, -1.034839, 0, 0, 1, 1, 1,
0.2613205, -0.1774593, 2.758128, 1, 0, 0, 1, 1,
0.2623231, 0.1758678, 0.3308785, 1, 0, 0, 1, 1,
0.2626599, 0.04179604, 3.296229, 1, 0, 0, 1, 1,
0.2663147, 3.008601, -0.9276642, 1, 0, 0, 1, 1,
0.2676879, 1.249596, 2.138474, 1, 0, 0, 1, 1,
0.2741587, 0.08751854, 0.07717571, 0, 0, 0, 1, 1,
0.2764288, -0.06474, 1.909774, 0, 0, 0, 1, 1,
0.2772166, -0.8425636, 1.644283, 0, 0, 0, 1, 1,
0.2773036, 1.214058, 0.7537034, 0, 0, 0, 1, 1,
0.2777932, -0.2789944, 1.797309, 0, 0, 0, 1, 1,
0.2803975, 1.284603, 1.509297, 0, 0, 0, 1, 1,
0.2822989, 0.6721874, 0.2512017, 0, 0, 0, 1, 1,
0.2833753, 1.566941, -1.601281, 1, 1, 1, 1, 1,
0.2844778, 1.389327, 1.940002, 1, 1, 1, 1, 1,
0.2848105, -0.1586789, 2.686573, 1, 1, 1, 1, 1,
0.2883176, 0.1230204, 3.002824, 1, 1, 1, 1, 1,
0.2898483, -1.534949, 2.946166, 1, 1, 1, 1, 1,
0.2959159, -0.4649725, 2.672608, 1, 1, 1, 1, 1,
0.3025744, -0.9908836, 3.40811, 1, 1, 1, 1, 1,
0.3056374, 0.1858834, -0.06187427, 1, 1, 1, 1, 1,
0.3100241, 1.781255, -0.3921564, 1, 1, 1, 1, 1,
0.3104266, -0.1694234, 0.2907625, 1, 1, 1, 1, 1,
0.3117991, -1.105152, 4.508005, 1, 1, 1, 1, 1,
0.3128386, -0.1802967, 0.08879974, 1, 1, 1, 1, 1,
0.3137868, -0.6169958, 2.809155, 1, 1, 1, 1, 1,
0.3213441, -0.3406612, 0.01940998, 1, 1, 1, 1, 1,
0.3246836, -0.3981819, 2.63359, 1, 1, 1, 1, 1,
0.32724, 0.9196721, 1.054463, 0, 0, 1, 1, 1,
0.3277785, 0.2140689, 2.385242, 1, 0, 0, 1, 1,
0.33119, 0.74323, 0.1872479, 1, 0, 0, 1, 1,
0.3336298, 2.718106, 0.7107416, 1, 0, 0, 1, 1,
0.3348513, -0.1231573, 2.692498, 1, 0, 0, 1, 1,
0.3382194, -1.916679, 2.808431, 1, 0, 0, 1, 1,
0.3394137, 0.3294272, 1.391865, 0, 0, 0, 1, 1,
0.3401177, 1.530894, 1.091985, 0, 0, 0, 1, 1,
0.3427578, 0.5064786, 1.273137, 0, 0, 0, 1, 1,
0.3463763, -0.5704837, 1.891111, 0, 0, 0, 1, 1,
0.3532573, 0.7375288, 2.694885, 0, 0, 0, 1, 1,
0.3547445, 0.4800994, 2.5947, 0, 0, 0, 1, 1,
0.3577718, 0.6964504, -0.8562518, 0, 0, 0, 1, 1,
0.3619482, 1.535579, -0.7364148, 1, 1, 1, 1, 1,
0.3628174, 2.435215, 1.95226, 1, 1, 1, 1, 1,
0.3631877, 0.002759729, -0.05551306, 1, 1, 1, 1, 1,
0.3660846, -0.3855836, 2.564822, 1, 1, 1, 1, 1,
0.3687934, -0.162919, 3.012889, 1, 1, 1, 1, 1,
0.3756567, -0.3280065, 1.405768, 1, 1, 1, 1, 1,
0.3777248, -0.5885695, 2.115561, 1, 1, 1, 1, 1,
0.3799154, 1.275947, -0.3569922, 1, 1, 1, 1, 1,
0.381365, 1.154662, 0.1077292, 1, 1, 1, 1, 1,
0.3854534, 0.3211585, 1.44301, 1, 1, 1, 1, 1,
0.390598, 0.962503, -0.4855635, 1, 1, 1, 1, 1,
0.3908399, -0.243151, 1.582341, 1, 1, 1, 1, 1,
0.3936521, 0.01149952, 2.707856, 1, 1, 1, 1, 1,
0.3976515, -0.2523195, 1.877452, 1, 1, 1, 1, 1,
0.3984024, 0.7581589, 0.04193399, 1, 1, 1, 1, 1,
0.4044276, 0.5679766, 0.3595774, 0, 0, 1, 1, 1,
0.4073655, 0.2493694, 0.2708006, 1, 0, 0, 1, 1,
0.4083191, 1.178536, 1.285159, 1, 0, 0, 1, 1,
0.4087954, -0.5835702, 1.774531, 1, 0, 0, 1, 1,
0.4104331, 0.6762329, 0.761388, 1, 0, 0, 1, 1,
0.4119617, -1.93882, 3.948177, 1, 0, 0, 1, 1,
0.4137221, 0.4327241, 0.1454583, 0, 0, 0, 1, 1,
0.4170539, -0.4416863, 0.4897889, 0, 0, 0, 1, 1,
0.4188651, 0.7088818, 0.03010059, 0, 0, 0, 1, 1,
0.4219716, -0.4281143, 2.568828, 0, 0, 0, 1, 1,
0.424753, -0.7000741, 1.012739, 0, 0, 0, 1, 1,
0.4281001, -0.4979124, 2.208292, 0, 0, 0, 1, 1,
0.429253, -0.8507816, 3.192625, 0, 0, 0, 1, 1,
0.4318039, 1.42898, 0.6170183, 1, 1, 1, 1, 1,
0.4336209, 0.8307275, -0.3219502, 1, 1, 1, 1, 1,
0.4344111, -0.9874405, 1.916895, 1, 1, 1, 1, 1,
0.4353523, 0.3530971, 1.246658, 1, 1, 1, 1, 1,
0.4364836, 1.50708, -2.163808, 1, 1, 1, 1, 1,
0.4417687, 1.271422, -0.1820199, 1, 1, 1, 1, 1,
0.4420345, -1.147595, 3.487657, 1, 1, 1, 1, 1,
0.4439665, 0.3748524, 2.762413, 1, 1, 1, 1, 1,
0.447074, -0.323571, 1.392385, 1, 1, 1, 1, 1,
0.4510594, -0.6446789, 3.671265, 1, 1, 1, 1, 1,
0.4526448, 0.07341012, 1.429641, 1, 1, 1, 1, 1,
0.4534048, 0.2475419, 0.5157304, 1, 1, 1, 1, 1,
0.4589492, 0.2304773, 0.9612789, 1, 1, 1, 1, 1,
0.4602937, 1.985345, -1.489353, 1, 1, 1, 1, 1,
0.4610432, 0.9185245, 0.9737371, 1, 1, 1, 1, 1,
0.4616481, -1.328743, 2.459946, 0, 0, 1, 1, 1,
0.4656597, 1.951425, -0.8769277, 1, 0, 0, 1, 1,
0.4700631, 0.2763515, 1.254398, 1, 0, 0, 1, 1,
0.472023, 0.4651196, 1.097106, 1, 0, 0, 1, 1,
0.4743116, 1.409239, 0.08476985, 1, 0, 0, 1, 1,
0.4758102, -0.1925891, 1.854314, 1, 0, 0, 1, 1,
0.4767779, -0.5247008, 0.8062863, 0, 0, 0, 1, 1,
0.4845696, 1.462178, 0.8713241, 0, 0, 0, 1, 1,
0.4846233, 0.3606881, 1.904978, 0, 0, 0, 1, 1,
0.4888239, -0.4850596, 3.594632, 0, 0, 0, 1, 1,
0.4960318, 0.9199024, 2.210532, 0, 0, 0, 1, 1,
0.4964111, -1.122255, 4.332402, 0, 0, 0, 1, 1,
0.4969072, 0.007349747, 1.327138, 0, 0, 0, 1, 1,
0.4995809, -1.184474, 3.57145, 1, 1, 1, 1, 1,
0.5027805, -1.711518, 1.791664, 1, 1, 1, 1, 1,
0.5028639, 0.2848755, 1.266255, 1, 1, 1, 1, 1,
0.5100333, -0.09337569, 2.323213, 1, 1, 1, 1, 1,
0.5165455, -0.8700324, 3.36904, 1, 1, 1, 1, 1,
0.5210811, -1.051355, 2.59188, 1, 1, 1, 1, 1,
0.5215621, -0.1023855, 3.996789, 1, 1, 1, 1, 1,
0.5282559, -1.231932, 4.362251, 1, 1, 1, 1, 1,
0.5296199, -0.3373845, 2.828237, 1, 1, 1, 1, 1,
0.5343919, -0.2378795, 1.014856, 1, 1, 1, 1, 1,
0.5411422, -1.162998, 2.534213, 1, 1, 1, 1, 1,
0.5428777, -1.242843, 1.018229, 1, 1, 1, 1, 1,
0.5470437, -0.178422, 0.9913188, 1, 1, 1, 1, 1,
0.5551988, 1.287839, 0.8211601, 1, 1, 1, 1, 1,
0.5574762, 0.5272592, 0.3240072, 1, 1, 1, 1, 1,
0.5594736, -1.608346, 2.725262, 0, 0, 1, 1, 1,
0.5624742, 1.20419, 0.4086449, 1, 0, 0, 1, 1,
0.562854, 0.2372983, 1.880376, 1, 0, 0, 1, 1,
0.5629491, 1.958947, 0.398596, 1, 0, 0, 1, 1,
0.5640635, -1.249007, 2.897356, 1, 0, 0, 1, 1,
0.5650536, 0.8337917, -0.3028468, 1, 0, 0, 1, 1,
0.5695001, -1.410736, 1.417324, 0, 0, 0, 1, 1,
0.5702466, -0.9768056, 3.36813, 0, 0, 0, 1, 1,
0.5702736, -1.222744, 4.84826, 0, 0, 0, 1, 1,
0.5713356, -0.05196068, 3.033556, 0, 0, 0, 1, 1,
0.5735657, -1.839704, 2.879422, 0, 0, 0, 1, 1,
0.5838738, -1.193909, 2.754934, 0, 0, 0, 1, 1,
0.5925485, 0.1594413, 0.576878, 0, 0, 0, 1, 1,
0.5954077, -1.68501, 4.008313, 1, 1, 1, 1, 1,
0.598393, -0.3731465, 3.703065, 1, 1, 1, 1, 1,
0.5986103, 0.6382631, -0.5893601, 1, 1, 1, 1, 1,
0.5990709, 1.665509, -1.540933, 1, 1, 1, 1, 1,
0.6000852, 0.3575735, 1.397946, 1, 1, 1, 1, 1,
0.6024764, 0.664431, 1.498719, 1, 1, 1, 1, 1,
0.6046764, 1.470134, 0.9566537, 1, 1, 1, 1, 1,
0.6082312, 0.02626366, -0.8208861, 1, 1, 1, 1, 1,
0.6086097, 0.6039998, -0.7108165, 1, 1, 1, 1, 1,
0.6098427, 0.04931448, 1.66971, 1, 1, 1, 1, 1,
0.6116775, 0.3696252, 2.22704, 1, 1, 1, 1, 1,
0.6207638, 0.4847374, 1.425819, 1, 1, 1, 1, 1,
0.6236995, 0.1210778, 3.045161, 1, 1, 1, 1, 1,
0.6299385, -0.8674811, 2.046924, 1, 1, 1, 1, 1,
0.6312082, -0.7603855, 3.125612, 1, 1, 1, 1, 1,
0.6362225, 0.3971162, -0.004910433, 0, 0, 1, 1, 1,
0.6406335, 1.102795, 1.809521, 1, 0, 0, 1, 1,
0.6441371, 1.0715, -1.385514, 1, 0, 0, 1, 1,
0.6455193, 1.451288, 0.3640651, 1, 0, 0, 1, 1,
0.6502517, 0.2423475, 2.764191, 1, 0, 0, 1, 1,
0.6562937, 1.167792, -0.2235334, 1, 0, 0, 1, 1,
0.6655035, 0.9977494, 1.580775, 0, 0, 0, 1, 1,
0.6782628, 0.2775024, 0.6594898, 0, 0, 0, 1, 1,
0.6783268, -0.5716618, 2.89687, 0, 0, 0, 1, 1,
0.6787855, -0.9905091, 4.258433, 0, 0, 0, 1, 1,
0.6821718, -1.911937, 3.535949, 0, 0, 0, 1, 1,
0.6827996, -0.2137913, 2.190375, 0, 0, 0, 1, 1,
0.6886538, 1.106767, 1.072618, 0, 0, 0, 1, 1,
0.6906033, 1.930811, 1.296243, 1, 1, 1, 1, 1,
0.6930336, -0.7086917, 3.364173, 1, 1, 1, 1, 1,
0.6946391, 0.2141678, 2.113808, 1, 1, 1, 1, 1,
0.6971917, -0.3693827, 0.8379697, 1, 1, 1, 1, 1,
0.6975098, -0.01441138, 0.01599045, 1, 1, 1, 1, 1,
0.6983419, 0.4820697, 1.788568, 1, 1, 1, 1, 1,
0.6985843, -1.049195, 2.851356, 1, 1, 1, 1, 1,
0.6993825, 0.07847418, 2.226604, 1, 1, 1, 1, 1,
0.6999092, -0.4285009, 2.082, 1, 1, 1, 1, 1,
0.7030879, -0.5116038, 2.756946, 1, 1, 1, 1, 1,
0.7033707, 0.8873618, 1.298136, 1, 1, 1, 1, 1,
0.7091787, 0.3039597, 1.500676, 1, 1, 1, 1, 1,
0.7111818, -1.285516, 1.974841, 1, 1, 1, 1, 1,
0.7202336, -0.2787316, 4.57723, 1, 1, 1, 1, 1,
0.728074, 1.844473, 0.1546749, 1, 1, 1, 1, 1,
0.7314816, -0.33252, 0.1402658, 0, 0, 1, 1, 1,
0.740698, 0.33806, 2.290351, 1, 0, 0, 1, 1,
0.7435548, 0.1209551, 1.693892, 1, 0, 0, 1, 1,
0.7552655, -0.3306636, 3.441585, 1, 0, 0, 1, 1,
0.7554426, 0.604225, 0.04896446, 1, 0, 0, 1, 1,
0.7634089, 1.276323, -0.3338035, 1, 0, 0, 1, 1,
0.7698011, 0.8776108, 1.070659, 0, 0, 0, 1, 1,
0.7782274, 0.2895571, 1.061291, 0, 0, 0, 1, 1,
0.7785076, -0.3028344, 1.939892, 0, 0, 0, 1, 1,
0.779483, -0.2265342, 2.041112, 0, 0, 0, 1, 1,
0.7796243, 1.213006, 1.432343, 0, 0, 0, 1, 1,
0.7832747, 0.1240337, 2.143399, 0, 0, 0, 1, 1,
0.7840186, -1.271932, 4.251916, 0, 0, 0, 1, 1,
0.7854403, -0.894087, 1.949789, 1, 1, 1, 1, 1,
0.790492, -0.03672488, 2.76987, 1, 1, 1, 1, 1,
0.7960811, -0.5795358, 3.22534, 1, 1, 1, 1, 1,
0.7973539, 0.5230929, 1.544371, 1, 1, 1, 1, 1,
0.7977126, -1.540123, 2.180986, 1, 1, 1, 1, 1,
0.8016626, -1.052762, 0.9537577, 1, 1, 1, 1, 1,
0.8089079, 0.4423026, 2.765196, 1, 1, 1, 1, 1,
0.8112834, -0.1135126, 3.028592, 1, 1, 1, 1, 1,
0.8133959, -0.5583219, 2.429123, 1, 1, 1, 1, 1,
0.8150732, -0.2280721, 1.963731, 1, 1, 1, 1, 1,
0.8243917, -0.4543779, -0.1260993, 1, 1, 1, 1, 1,
0.8272538, 1.871885, 1.087114, 1, 1, 1, 1, 1,
0.8276588, 0.2698137, 0.9784714, 1, 1, 1, 1, 1,
0.8368835, 0.06886148, 2.240079, 1, 1, 1, 1, 1,
0.8370024, 0.291241, 1.148862, 1, 1, 1, 1, 1,
0.8395153, -0.7499366, 2.908431, 0, 0, 1, 1, 1,
0.8554639, 1.206039, 2.000922, 1, 0, 0, 1, 1,
0.861374, 1.068719, 0.3103283, 1, 0, 0, 1, 1,
0.8631968, -2.056089, 3.306586, 1, 0, 0, 1, 1,
0.8653913, 0.2231098, -0.2348821, 1, 0, 0, 1, 1,
0.8684294, 1.831497, 0.6789718, 1, 0, 0, 1, 1,
0.8708641, 0.07479755, 1.071503, 0, 0, 0, 1, 1,
0.8733629, -0.1105326, 1.342727, 0, 0, 0, 1, 1,
0.8735191, 0.02244918, 2.348449, 0, 0, 0, 1, 1,
0.8760578, 0.1559987, 1.731602, 0, 0, 0, 1, 1,
0.8785779, 0.30297, 0.2856635, 0, 0, 0, 1, 1,
0.8841947, 0.8240108, 1.956362, 0, 0, 0, 1, 1,
0.8849366, 0.9772686, 1.116238, 0, 0, 0, 1, 1,
0.8856798, -0.08861263, 2.426268, 1, 1, 1, 1, 1,
0.8868481, 0.8771728, 0.6855399, 1, 1, 1, 1, 1,
0.8880833, 0.2832087, 1.824903, 1, 1, 1, 1, 1,
0.8949885, 0.5593145, -0.03833403, 1, 1, 1, 1, 1,
0.8992293, -0.8923088, 1.574165, 1, 1, 1, 1, 1,
0.9004822, -1.085643, 2.757654, 1, 1, 1, 1, 1,
0.9138437, -0.1494852, 1.824207, 1, 1, 1, 1, 1,
0.9156426, 1.100916, 0.8459262, 1, 1, 1, 1, 1,
0.9258949, -2.659056, 2.614766, 1, 1, 1, 1, 1,
0.9347193, -0.1578384, 3.243028, 1, 1, 1, 1, 1,
0.942906, -0.06104317, 1.302885, 1, 1, 1, 1, 1,
0.9432861, -1.60717, 3.520344, 1, 1, 1, 1, 1,
0.945516, 0.9531692, 1.567968, 1, 1, 1, 1, 1,
0.9457479, 0.4707053, 2.558235, 1, 1, 1, 1, 1,
0.9510733, -0.2706436, 1.812385, 1, 1, 1, 1, 1,
0.9518694, -1.40477, 3.370809, 0, 0, 1, 1, 1,
0.9559255, -0.00882289, 3.824547, 1, 0, 0, 1, 1,
0.9614112, -1.037277, 1.303881, 1, 0, 0, 1, 1,
0.9634131, -1.160107, 2.486813, 1, 0, 0, 1, 1,
0.9749307, 0.20089, 2.270846, 1, 0, 0, 1, 1,
1.000077, -0.6040859, 3.453241, 1, 0, 0, 1, 1,
1.002756, 1.014343, 1.205009, 0, 0, 0, 1, 1,
1.005246, -0.02949676, 0.07549651, 0, 0, 0, 1, 1,
1.010694, -1.283518, 3.230159, 0, 0, 0, 1, 1,
1.013276, 0.374668, 2.653142, 0, 0, 0, 1, 1,
1.013339, -0.3997303, 2.566072, 0, 0, 0, 1, 1,
1.014937, 0.163698, 0.3712817, 0, 0, 0, 1, 1,
1.019072, -0.1377038, 1.53438, 0, 0, 0, 1, 1,
1.021627, -0.7001734, 0.2636878, 1, 1, 1, 1, 1,
1.025798, 1.462929, 2.14268, 1, 1, 1, 1, 1,
1.026412, 1.008388, 0.8624948, 1, 1, 1, 1, 1,
1.027328, 0.508857, 2.384465, 1, 1, 1, 1, 1,
1.032587, -0.5908092, 3.289387, 1, 1, 1, 1, 1,
1.034601, -0.6842309, 1.44477, 1, 1, 1, 1, 1,
1.03916, -1.071165, 2.936559, 1, 1, 1, 1, 1,
1.039205, -1.228596, 3.687865, 1, 1, 1, 1, 1,
1.0411, -2.022543, 4.823355, 1, 1, 1, 1, 1,
1.042911, 0.2183183, 0.6404054, 1, 1, 1, 1, 1,
1.047538, -1.186002, 3.366127, 1, 1, 1, 1, 1,
1.04777, -1.642574, 4.143421, 1, 1, 1, 1, 1,
1.055537, -0.5525981, 1.052326, 1, 1, 1, 1, 1,
1.057761, -0.4466258, 1.978783, 1, 1, 1, 1, 1,
1.063151, 0.1979256, 0.6334696, 1, 1, 1, 1, 1,
1.067, 0.7728403, -0.9696857, 0, 0, 1, 1, 1,
1.069382, 0.9613167, 0.1476268, 1, 0, 0, 1, 1,
1.069687, 1.475488, 1.881499, 1, 0, 0, 1, 1,
1.075401, 2.400163, -0.745843, 1, 0, 0, 1, 1,
1.082789, 0.05219935, 2.245781, 1, 0, 0, 1, 1,
1.083613, -1.713719, 2.722289, 1, 0, 0, 1, 1,
1.089261, -1.416413, 2.080053, 0, 0, 0, 1, 1,
1.091006, -0.09003592, -0.386713, 0, 0, 0, 1, 1,
1.092617, -0.8582258, 2.159201, 0, 0, 0, 1, 1,
1.096224, 0.8813527, 0.7450064, 0, 0, 0, 1, 1,
1.099926, -2.187254, 3.371772, 0, 0, 0, 1, 1,
1.100434, 0.7721965, 1.673602, 0, 0, 0, 1, 1,
1.102549, 0.7941318, 0.8053094, 0, 0, 0, 1, 1,
1.107929, 0.2712345, -0.8127563, 1, 1, 1, 1, 1,
1.11276, 1.858958, -0.5180058, 1, 1, 1, 1, 1,
1.114807, -1.322379, 3.292468, 1, 1, 1, 1, 1,
1.118299, 1.343413, 0.6870022, 1, 1, 1, 1, 1,
1.131442, -0.3574658, 0.7715719, 1, 1, 1, 1, 1,
1.138964, -0.1668669, 1.488483, 1, 1, 1, 1, 1,
1.141557, 0.6811877, 1.148598, 1, 1, 1, 1, 1,
1.143466, 1.646043, 1.359518, 1, 1, 1, 1, 1,
1.144523, 2.391076, -0.7734479, 1, 1, 1, 1, 1,
1.14526, -0.6806611, 3.801143, 1, 1, 1, 1, 1,
1.145542, -0.8157581, 2.824916, 1, 1, 1, 1, 1,
1.159602, -0.2160015, 1.501755, 1, 1, 1, 1, 1,
1.161864, -0.3084865, 0.7671199, 1, 1, 1, 1, 1,
1.166804, 1.296933, -0.05864958, 1, 1, 1, 1, 1,
1.1728, 1.391344, -0.09389465, 1, 1, 1, 1, 1,
1.175509, -0.006760407, 2.39576, 0, 0, 1, 1, 1,
1.177049, -0.8592338, 1.763232, 1, 0, 0, 1, 1,
1.185777, -0.1199244, 0.9578281, 1, 0, 0, 1, 1,
1.186324, 0.4094089, 1.740294, 1, 0, 0, 1, 1,
1.189042, -0.08937932, 1.937602, 1, 0, 0, 1, 1,
1.195879, -1.097192, 1.472907, 1, 0, 0, 1, 1,
1.19787, 0.06614468, 1.575975, 0, 0, 0, 1, 1,
1.198354, 1.607015, 2.99426, 0, 0, 0, 1, 1,
1.216485, -0.1260556, 1.259547, 0, 0, 0, 1, 1,
1.218952, -0.3506604, 2.284262, 0, 0, 0, 1, 1,
1.222917, 0.2998967, 0.685289, 0, 0, 0, 1, 1,
1.233847, -0.08187214, 1.992548, 0, 0, 0, 1, 1,
1.246689, 0.2376055, 0.7378625, 0, 0, 0, 1, 1,
1.249039, 0.6922184, 1.545584, 1, 1, 1, 1, 1,
1.255702, 0.6954337, 0.4858787, 1, 1, 1, 1, 1,
1.262663, -1.630885, 0.3358183, 1, 1, 1, 1, 1,
1.264458, -0.8129811, 1.947335, 1, 1, 1, 1, 1,
1.265452, 1.688504, 2.25815, 1, 1, 1, 1, 1,
1.26959, 1.472568, 0.8445995, 1, 1, 1, 1, 1,
1.278147, 0.1104094, 2.24883, 1, 1, 1, 1, 1,
1.294174, -0.3009486, 1.645405, 1, 1, 1, 1, 1,
1.297621, 0.0470271, 2.319133, 1, 1, 1, 1, 1,
1.30451, -0.1560526, 2.732745, 1, 1, 1, 1, 1,
1.308127, 0.1712294, 1.756558, 1, 1, 1, 1, 1,
1.310335, -1.701868, 2.290708, 1, 1, 1, 1, 1,
1.311287, 1.297826, 3.116184, 1, 1, 1, 1, 1,
1.323751, -0.1490815, 1.623985, 1, 1, 1, 1, 1,
1.331359, -0.1373319, 0.7675295, 1, 1, 1, 1, 1,
1.331647, 1.727396, 0.7677214, 0, 0, 1, 1, 1,
1.33674, 0.4772072, 1.414831, 1, 0, 0, 1, 1,
1.337972, 0.718776, 1.261834, 1, 0, 0, 1, 1,
1.346467, -0.584325, 2.980692, 1, 0, 0, 1, 1,
1.350495, 1.222417, 0.8460414, 1, 0, 0, 1, 1,
1.358394, 0.7403129, 1.939644, 1, 0, 0, 1, 1,
1.368228, -0.05985599, -0.125828, 0, 0, 0, 1, 1,
1.374321, -0.3544505, 2.685246, 0, 0, 0, 1, 1,
1.381357, 0.8811736, 0.6628634, 0, 0, 0, 1, 1,
1.381612, -0.847585, 3.375287, 0, 0, 0, 1, 1,
1.39763, 1.075656, 1.454838, 0, 0, 0, 1, 1,
1.414914, -2.207726, 3.085209, 0, 0, 0, 1, 1,
1.416898, -0.4379256, 1.390716, 0, 0, 0, 1, 1,
1.426063, 0.6743726, 0.7481662, 1, 1, 1, 1, 1,
1.435782, 0.4097461, 1.35725, 1, 1, 1, 1, 1,
1.435827, -0.2823088, 3.825587, 1, 1, 1, 1, 1,
1.442875, 0.2184311, -0.7792153, 1, 1, 1, 1, 1,
1.443739, 0.7438617, 1.837224, 1, 1, 1, 1, 1,
1.447671, -1.804062, 0.5967904, 1, 1, 1, 1, 1,
1.453043, 0.9369918, 1.324282, 1, 1, 1, 1, 1,
1.453461, -1.964246, 1.28715, 1, 1, 1, 1, 1,
1.462379, -0.1096968, 1.419599, 1, 1, 1, 1, 1,
1.467255, 0.7076042, 0.2480866, 1, 1, 1, 1, 1,
1.468897, -0.8514697, 1.763551, 1, 1, 1, 1, 1,
1.471848, 0.7766698, 1.244778, 1, 1, 1, 1, 1,
1.488119, 1.622042, 0.684369, 1, 1, 1, 1, 1,
1.506147, 0.7456371, 1.290484, 1, 1, 1, 1, 1,
1.507704, 0.755871, 1.683895, 1, 1, 1, 1, 1,
1.510145, -0.7920113, 2.293485, 0, 0, 1, 1, 1,
1.529759, -0.6540213, 1.103954, 1, 0, 0, 1, 1,
1.530226, 0.3340887, 1.442764, 1, 0, 0, 1, 1,
1.538253, 0.1750142, 0.7258954, 1, 0, 0, 1, 1,
1.541572, -2.29982, 1.840633, 1, 0, 0, 1, 1,
1.54213, 1.769893, -0.02049497, 1, 0, 0, 1, 1,
1.547248, -0.06050668, 2.070797, 0, 0, 0, 1, 1,
1.55099, -0.3483709, 0.6821089, 0, 0, 0, 1, 1,
1.55197, 0.84339, 0.5631115, 0, 0, 0, 1, 1,
1.554034, -0.3066998, 2.695634, 0, 0, 0, 1, 1,
1.560264, -0.08800501, 1.537091, 0, 0, 0, 1, 1,
1.576943, -0.5852157, 1.777301, 0, 0, 0, 1, 1,
1.576948, -1.159934, 0.5206416, 0, 0, 0, 1, 1,
1.578653, -1.611584, 1.1543, 1, 1, 1, 1, 1,
1.598577, 0.2720052, 2.725108, 1, 1, 1, 1, 1,
1.605986, 1.114297, 1.074612, 1, 1, 1, 1, 1,
1.622879, -1.28532, 4.698071, 1, 1, 1, 1, 1,
1.627797, -0.9426648, 1.153153, 1, 1, 1, 1, 1,
1.633151, 1.569469, 2.669571, 1, 1, 1, 1, 1,
1.677106, 0.3625367, 0.3444269, 1, 1, 1, 1, 1,
1.677696, 0.5640998, 1.413702, 1, 1, 1, 1, 1,
1.691563, -1.312535, 2.045511, 1, 1, 1, 1, 1,
1.711653, -0.4177504, 1.808048, 1, 1, 1, 1, 1,
1.715798, 0.3384686, 0.4265246, 1, 1, 1, 1, 1,
1.745926, -0.7051931, 3.050138, 1, 1, 1, 1, 1,
1.749085, -0.2929693, 0.4108712, 1, 1, 1, 1, 1,
1.749908, 0.9680589, 0.9472137, 1, 1, 1, 1, 1,
1.756448, 1.312775, -1.190308, 1, 1, 1, 1, 1,
1.758576, 0.3114597, 1.830237, 0, 0, 1, 1, 1,
1.770678, -1.21113, 0.6523758, 1, 0, 0, 1, 1,
1.775613, 0.2363974, 2.724786, 1, 0, 0, 1, 1,
1.780493, -0.6841621, 1.720978, 1, 0, 0, 1, 1,
1.78398, 0.9532485, 0.8097557, 1, 0, 0, 1, 1,
1.815024, 0.802233, -0.4997699, 1, 0, 0, 1, 1,
1.863698, -0.2620849, 1.083247, 0, 0, 0, 1, 1,
1.884126, -2.061596, 0.772536, 0, 0, 0, 1, 1,
1.921925, -0.2621412, 1.21263, 0, 0, 0, 1, 1,
1.939439, -0.3509997, 1.795922, 0, 0, 0, 1, 1,
1.941419, -2.06248, 2.228363, 0, 0, 0, 1, 1,
1.945876, -0.563668, 1.939841, 0, 0, 0, 1, 1,
1.993045, -0.4262854, 2.330529, 0, 0, 0, 1, 1,
1.993179, 0.6309091, 1.519011, 1, 1, 1, 1, 1,
1.997842, -0.5544085, 2.883986, 1, 1, 1, 1, 1,
2.023821, 1.559168, 1.2288, 1, 1, 1, 1, 1,
2.031151, 0.6832815, 1.000606, 1, 1, 1, 1, 1,
2.036573, 0.1292803, 1.509449, 1, 1, 1, 1, 1,
2.042923, 0.3239149, 2.298121, 1, 1, 1, 1, 1,
2.04457, -0.8568769, 1.894742, 1, 1, 1, 1, 1,
2.084257, -0.388521, -0.2063899, 1, 1, 1, 1, 1,
2.096897, -0.447336, 3.260791, 1, 1, 1, 1, 1,
2.098841, -0.9884667, 0.5048119, 1, 1, 1, 1, 1,
2.11197, -2.453733, 3.371191, 1, 1, 1, 1, 1,
2.115572, -0.9510878, 1.712325, 1, 1, 1, 1, 1,
2.117606, 1.225603, 2.32278, 1, 1, 1, 1, 1,
2.122463, -1.498334, 1.328972, 1, 1, 1, 1, 1,
2.123477, -0.07465184, 2.668896, 1, 1, 1, 1, 1,
2.138509, -0.9185459, 1.214512, 0, 0, 1, 1, 1,
2.144053, -0.7742158, 2.362826, 1, 0, 0, 1, 1,
2.186345, -0.1946767, 0.9099371, 1, 0, 0, 1, 1,
2.219861, 0.07425932, 1.123694, 1, 0, 0, 1, 1,
2.238276, 0.1675848, 0.7598943, 1, 0, 0, 1, 1,
2.264224, -0.191541, 0.6093557, 1, 0, 0, 1, 1,
2.357063, 1.055225, 0.4563951, 0, 0, 0, 1, 1,
2.388684, 0.7694755, 2.348563, 0, 0, 0, 1, 1,
2.394445, 0.4367717, 0.04562538, 0, 0, 0, 1, 1,
2.556255, 0.4838498, 1.332432, 0, 0, 0, 1, 1,
2.567501, -0.7572074, 1.320368, 0, 0, 0, 1, 1,
2.639458, -0.008051614, 0.5431696, 0, 0, 0, 1, 1,
2.682809, 0.470192, 0.09273675, 0, 0, 0, 1, 1,
2.700748, -0.1221186, 2.051693, 1, 1, 1, 1, 1,
2.732089, -1.720692, 3.84901, 1, 1, 1, 1, 1,
2.745515, -0.5403554, 2.715951, 1, 1, 1, 1, 1,
2.882677, -1.112731, 1.973614, 1, 1, 1, 1, 1,
2.968058, -1.534204, 2.237021, 1, 1, 1, 1, 1,
3.110471, -0.3541217, 1.582492, 1, 1, 1, 1, 1,
3.22279, -0.5191175, 0.7097197, 1, 1, 1, 1, 1
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
var radius = 9.564748;
var distance = 33.59577;
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
mvMatrix.translate( -0.05465078, -0.6431117, 0.1402917 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.59577);
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
