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
-3.776542, -0.03624629, 0.4785933, 1, 0, 0, 1,
-3.052519, -0.1019132, -1.455181, 1, 0.007843138, 0, 1,
-3.039391, 0.1551838, -1.877642, 1, 0.01176471, 0, 1,
-3.033964, 1.691125, 0.4404202, 1, 0.01960784, 0, 1,
-2.827025, 0.01678293, -1.203629, 1, 0.02352941, 0, 1,
-2.553262, -0.1277068, -1.468204, 1, 0.03137255, 0, 1,
-2.536658, -0.402201, -2.782193, 1, 0.03529412, 0, 1,
-2.426084, 1.771883, 0.2758596, 1, 0.04313726, 0, 1,
-2.37889, -0.09748577, -2.350314, 1, 0.04705882, 0, 1,
-2.272764, 0.6621709, -2.612131, 1, 0.05490196, 0, 1,
-2.260948, -0.9016056, -2.063538, 1, 0.05882353, 0, 1,
-2.202106, 1.560254, -0.4110916, 1, 0.06666667, 0, 1,
-2.181944, 1.857622, -1.288389, 1, 0.07058824, 0, 1,
-2.164185, 0.08967725, -3.397523, 1, 0.07843138, 0, 1,
-2.164182, 1.43324, -1.331425, 1, 0.08235294, 0, 1,
-2.131407, 0.7522545, -1.394528, 1, 0.09019608, 0, 1,
-2.111294, -0.7484589, -0.05739729, 1, 0.09411765, 0, 1,
-2.09463, 1.001714, -0.2894745, 1, 0.1019608, 0, 1,
-2.077343, -0.326981, -1.28739, 1, 0.1098039, 0, 1,
-2.074583, -1.256035, -2.039291, 1, 0.1137255, 0, 1,
-2.051364, -0.02302713, -0.4877795, 1, 0.1215686, 0, 1,
-2.033198, 0.9680387, -0.5366505, 1, 0.1254902, 0, 1,
-2.00952, -0.1905398, -2.433588, 1, 0.1333333, 0, 1,
-1.98267, -2.670454, -2.251663, 1, 0.1372549, 0, 1,
-1.960834, -0.8100251, -2.303874, 1, 0.145098, 0, 1,
-1.949505, -0.4019144, -0.5595915, 1, 0.1490196, 0, 1,
-1.938058, 1.068555, -1.488677, 1, 0.1568628, 0, 1,
-1.918839, 0.3451776, 0.2705046, 1, 0.1607843, 0, 1,
-1.913218, 1.14278, -3.176663, 1, 0.1686275, 0, 1,
-1.913185, 0.07717106, -0.9279764, 1, 0.172549, 0, 1,
-1.864649, -0.8357281, -2.902266, 1, 0.1803922, 0, 1,
-1.859807, -1.308542, -1.80471, 1, 0.1843137, 0, 1,
-1.844777, 0.9909928, -1.296412, 1, 0.1921569, 0, 1,
-1.843922, -1.316194, -1.374191, 1, 0.1960784, 0, 1,
-1.834036, 0.9083069, -1.549926, 1, 0.2039216, 0, 1,
-1.830282, -0.8285282, -2.490068, 1, 0.2117647, 0, 1,
-1.825383, 2.638668, 1.035458, 1, 0.2156863, 0, 1,
-1.80955, -1.593915, -3.28186, 1, 0.2235294, 0, 1,
-1.79219, 1.061389, 0.5342611, 1, 0.227451, 0, 1,
-1.79148, 0.4920651, -1.816512, 1, 0.2352941, 0, 1,
-1.719836, -1.91246, -1.902483, 1, 0.2392157, 0, 1,
-1.712894, 0.2705772, 0.2652281, 1, 0.2470588, 0, 1,
-1.712197, 0.5341223, -2.446892, 1, 0.2509804, 0, 1,
-1.705489, -0.7389156, -1.884677, 1, 0.2588235, 0, 1,
-1.702991, 1.81993, 0.0145317, 1, 0.2627451, 0, 1,
-1.699835, -1.933889, -1.527072, 1, 0.2705882, 0, 1,
-1.694481, -1.072747, -2.377075, 1, 0.2745098, 0, 1,
-1.675036, -0.9716074, -3.102598, 1, 0.282353, 0, 1,
-1.656316, 0.01743113, 0.3003758, 1, 0.2862745, 0, 1,
-1.621199, -0.2612574, 0.2488065, 1, 0.2941177, 0, 1,
-1.613469, 0.8210552, -2.923262, 1, 0.3019608, 0, 1,
-1.609289, 0.709682, -3.919019, 1, 0.3058824, 0, 1,
-1.605595, -0.4582355, -1.721553, 1, 0.3137255, 0, 1,
-1.592361, -1.194136, -3.83148, 1, 0.3176471, 0, 1,
-1.586511, -3.830894, -2.728118, 1, 0.3254902, 0, 1,
-1.584169, -0.4923445, -0.8753836, 1, 0.3294118, 0, 1,
-1.583187, 0.6835001, -1.116868, 1, 0.3372549, 0, 1,
-1.574098, -0.7269353, -0.7527609, 1, 0.3411765, 0, 1,
-1.573972, 0.286519, -1.716422, 1, 0.3490196, 0, 1,
-1.564047, -0.4169955, -1.597983, 1, 0.3529412, 0, 1,
-1.548923, -0.1664737, -0.06360516, 1, 0.3607843, 0, 1,
-1.546241, 1.17186, 1.192343, 1, 0.3647059, 0, 1,
-1.532552, 1.272396, -1.50083, 1, 0.372549, 0, 1,
-1.53116, 0.672218, -2.374145, 1, 0.3764706, 0, 1,
-1.527612, 0.8093151, 0.4176423, 1, 0.3843137, 0, 1,
-1.509224, -0.8768857, -0.9541511, 1, 0.3882353, 0, 1,
-1.497365, -0.2561561, -1.492721, 1, 0.3960784, 0, 1,
-1.495774, -0.9429421, -1.999503, 1, 0.4039216, 0, 1,
-1.478402, 0.9528385, -1.621389, 1, 0.4078431, 0, 1,
-1.474081, -0.8499696, -2.946859, 1, 0.4156863, 0, 1,
-1.474041, 0.9658404, -2.646635, 1, 0.4196078, 0, 1,
-1.469212, 0.8071206, -2.080879, 1, 0.427451, 0, 1,
-1.462677, -0.7234849, -0.9253284, 1, 0.4313726, 0, 1,
-1.460644, -0.7975876, -2.098435, 1, 0.4392157, 0, 1,
-1.453498, -0.05477528, -2.366595, 1, 0.4431373, 0, 1,
-1.440531, -0.04957933, -0.2024027, 1, 0.4509804, 0, 1,
-1.438078, 0.008510226, -1.793324, 1, 0.454902, 0, 1,
-1.437071, -1.069272, -3.469805, 1, 0.4627451, 0, 1,
-1.433271, -0.475262, -1.44027, 1, 0.4666667, 0, 1,
-1.426388, 1.369603, 0.4217389, 1, 0.4745098, 0, 1,
-1.394545, 1.244533, -1.116826, 1, 0.4784314, 0, 1,
-1.379769, -0.7201442, -1.718436, 1, 0.4862745, 0, 1,
-1.366416, -1.359631, -1.918683, 1, 0.4901961, 0, 1,
-1.365487, 1.196959, -1.43539, 1, 0.4980392, 0, 1,
-1.363049, 0.07892205, -1.56477, 1, 0.5058824, 0, 1,
-1.360011, 0.8453785, -0.2675167, 1, 0.509804, 0, 1,
-1.355218, 1.437786, -2.01121, 1, 0.5176471, 0, 1,
-1.352349, -2.199375, -3.504978, 1, 0.5215687, 0, 1,
-1.342577, -1.05451, -2.012705, 1, 0.5294118, 0, 1,
-1.339301, -2.475647, -3.480626, 1, 0.5333334, 0, 1,
-1.325644, 0.8782153, -0.4727117, 1, 0.5411765, 0, 1,
-1.322104, 1.232436, -0.9957542, 1, 0.5450981, 0, 1,
-1.320938, -0.4859477, -4.185134, 1, 0.5529412, 0, 1,
-1.320002, -0.5965844, -2.413932, 1, 0.5568628, 0, 1,
-1.313895, 0.8310983, -0.2365017, 1, 0.5647059, 0, 1,
-1.290975, -0.1413635, -1.351385, 1, 0.5686275, 0, 1,
-1.288169, -0.001832055, -1.627296, 1, 0.5764706, 0, 1,
-1.280223, -1.395802, -3.359861, 1, 0.5803922, 0, 1,
-1.2713, -0.6707407, -1.473344, 1, 0.5882353, 0, 1,
-1.264296, -0.2674396, -1.542314, 1, 0.5921569, 0, 1,
-1.262915, -0.5867948, -2.836838, 1, 0.6, 0, 1,
-1.260223, -1.707159, -3.3331, 1, 0.6078432, 0, 1,
-1.246435, -1.171215, -2.943937, 1, 0.6117647, 0, 1,
-1.244606, -0.1905166, -2.525249, 1, 0.6196079, 0, 1,
-1.243725, 0.06423384, -0.2963006, 1, 0.6235294, 0, 1,
-1.23981, -0.3729961, -0.4174334, 1, 0.6313726, 0, 1,
-1.234228, -0.3586, -1.600852, 1, 0.6352941, 0, 1,
-1.232734, 0.6786808, -0.5069083, 1, 0.6431373, 0, 1,
-1.227197, 0.6945795, 1.219326, 1, 0.6470588, 0, 1,
-1.226523, -0.4046989, -1.689987, 1, 0.654902, 0, 1,
-1.223863, -1.510579, -2.708159, 1, 0.6588235, 0, 1,
-1.223393, -2.492961, -2.736703, 1, 0.6666667, 0, 1,
-1.223005, -0.2509146, -1.521354, 1, 0.6705883, 0, 1,
-1.21912, -1.007789, -1.493156, 1, 0.6784314, 0, 1,
-1.218094, 1.515363, -0.9374577, 1, 0.682353, 0, 1,
-1.212857, 0.8898576, -0.3963282, 1, 0.6901961, 0, 1,
-1.211999, -0.03832128, -3.105857, 1, 0.6941177, 0, 1,
-1.207563, 0.1903678, -2.403735, 1, 0.7019608, 0, 1,
-1.204919, -0.4476335, -1.311808, 1, 0.7098039, 0, 1,
-1.201515, -0.01051391, -1.682558, 1, 0.7137255, 0, 1,
-1.193091, 1.514038, 0.5137402, 1, 0.7215686, 0, 1,
-1.187635, -0.005209976, -2.982534, 1, 0.7254902, 0, 1,
-1.183388, -0.05440051, -0.2274973, 1, 0.7333333, 0, 1,
-1.182327, 0.9010578, -0.4736632, 1, 0.7372549, 0, 1,
-1.181773, -1.818053, -0.7789267, 1, 0.7450981, 0, 1,
-1.179245, -1.30881, -1.872863, 1, 0.7490196, 0, 1,
-1.174314, -1.125405, -2.290928, 1, 0.7568628, 0, 1,
-1.172113, -0.9915166, -1.947397, 1, 0.7607843, 0, 1,
-1.167335, -0.6713318, -1.307903, 1, 0.7686275, 0, 1,
-1.165333, 0.4229855, -0.04710449, 1, 0.772549, 0, 1,
-1.160281, 1.056265, 0.5095774, 1, 0.7803922, 0, 1,
-1.156252, 2.399057, -0.7858356, 1, 0.7843137, 0, 1,
-1.152869, 0.7688462, -1.811672, 1, 0.7921569, 0, 1,
-1.150993, -1.527739, -1.408954, 1, 0.7960784, 0, 1,
-1.148437, 0.3825266, -0.9845217, 1, 0.8039216, 0, 1,
-1.140783, 0.8252908, -0.6459372, 1, 0.8117647, 0, 1,
-1.125647, -0.7501186, -3.109561, 1, 0.8156863, 0, 1,
-1.125198, 0.1098551, -2.271479, 1, 0.8235294, 0, 1,
-1.125156, 0.4738853, -0.1622804, 1, 0.827451, 0, 1,
-1.119802, -0.4545433, -2.202923, 1, 0.8352941, 0, 1,
-1.117682, 0.4639515, -1.373514, 1, 0.8392157, 0, 1,
-1.115067, -1.618641, -3.039029, 1, 0.8470588, 0, 1,
-1.113449, -0.9903522, -1.507896, 1, 0.8509804, 0, 1,
-1.111527, -0.4154138, -2.193837, 1, 0.8588235, 0, 1,
-1.111418, 2.482698, -1.017634, 1, 0.8627451, 0, 1,
-1.106863, 0.2345065, -2.055467, 1, 0.8705882, 0, 1,
-1.104983, -0.07464842, -2.900704, 1, 0.8745098, 0, 1,
-1.102612, -0.3457472, -3.119019, 1, 0.8823529, 0, 1,
-1.082475, -0.2224469, -1.763121, 1, 0.8862745, 0, 1,
-1.080759, 0.09437291, -1.067703, 1, 0.8941177, 0, 1,
-1.075101, 0.6124305, -2.130341, 1, 0.8980392, 0, 1,
-1.06607, -0.1215074, -2.580837, 1, 0.9058824, 0, 1,
-1.063662, -0.07674646, -2.086335, 1, 0.9137255, 0, 1,
-1.063042, -0.7166012, -3.877014, 1, 0.9176471, 0, 1,
-1.056068, -0.006516098, -1.034593, 1, 0.9254902, 0, 1,
-1.056014, 1.386988, 0.4488744, 1, 0.9294118, 0, 1,
-1.0559, -1.785941, -2.678623, 1, 0.9372549, 0, 1,
-1.050389, -2.054736, -4.299377, 1, 0.9411765, 0, 1,
-1.038141, -0.4057194, -3.305784, 1, 0.9490196, 0, 1,
-1.036729, -0.6182265, -2.342121, 1, 0.9529412, 0, 1,
-1.034435, -0.6362149, -2.504434, 1, 0.9607843, 0, 1,
-1.032526, -0.7545416, -2.373184, 1, 0.9647059, 0, 1,
-1.032046, 0.03797202, -1.365111, 1, 0.972549, 0, 1,
-1.028072, -0.4531987, -3.3082, 1, 0.9764706, 0, 1,
-1.027039, -0.4139439, -2.349298, 1, 0.9843137, 0, 1,
-1.020878, -0.4217849, -3.129217, 1, 0.9882353, 0, 1,
-1.011741, -2.154554, -3.392717, 1, 0.9960784, 0, 1,
-0.9979356, 0.09073894, -2.350459, 0.9960784, 1, 0, 1,
-0.9916686, 0.6956482, -1.685575, 0.9921569, 1, 0, 1,
-0.9891132, -1.447333, -3.736533, 0.9843137, 1, 0, 1,
-0.9868325, -1.427186, -1.563762, 0.9803922, 1, 0, 1,
-0.9829742, -0.7161364, -2.412401, 0.972549, 1, 0, 1,
-0.9779973, -1.647662, -0.8450684, 0.9686275, 1, 0, 1,
-0.9724867, 0.3942155, -0.6076811, 0.9607843, 1, 0, 1,
-0.9717399, -2.135959, -1.582365, 0.9568627, 1, 0, 1,
-0.968556, -0.2322272, -2.710146, 0.9490196, 1, 0, 1,
-0.9647988, -1.586011, -0.6238225, 0.945098, 1, 0, 1,
-0.9640955, -0.5283316, -2.636143, 0.9372549, 1, 0, 1,
-0.9634238, 0.005387674, -1.611567, 0.9333333, 1, 0, 1,
-0.961876, 2.435775, 1.033115, 0.9254902, 1, 0, 1,
-0.9553561, 0.1153717, -2.108182, 0.9215686, 1, 0, 1,
-0.9506922, 0.2097109, -2.636338, 0.9137255, 1, 0, 1,
-0.9505643, 2.54999, 0.326223, 0.9098039, 1, 0, 1,
-0.9453499, 1.067765, -2.410574, 0.9019608, 1, 0, 1,
-0.9442666, 0.3700626, -1.961294, 0.8941177, 1, 0, 1,
-0.9393255, 0.9130771, -1.058299, 0.8901961, 1, 0, 1,
-0.9367638, 2.127337, 0.1809708, 0.8823529, 1, 0, 1,
-0.9360072, -0.2167467, 0.003482817, 0.8784314, 1, 0, 1,
-0.9334544, -0.1277604, -1.548896, 0.8705882, 1, 0, 1,
-0.9302701, -2.20837, -1.943645, 0.8666667, 1, 0, 1,
-0.9223478, 0.321349, -0.8083963, 0.8588235, 1, 0, 1,
-0.9182324, 1.265588, -0.338249, 0.854902, 1, 0, 1,
-0.9172024, -0.06543634, -2.73108, 0.8470588, 1, 0, 1,
-0.916364, 0.8096687, 0.7464424, 0.8431373, 1, 0, 1,
-0.9140249, -0.1503312, 0.7824567, 0.8352941, 1, 0, 1,
-0.9109436, -0.3172126, -0.9277025, 0.8313726, 1, 0, 1,
-0.9030431, 1.420201, 0.5289766, 0.8235294, 1, 0, 1,
-0.8980387, 0.2470333, 0.198876, 0.8196079, 1, 0, 1,
-0.8921202, -1.321828, -3.038017, 0.8117647, 1, 0, 1,
-0.8884335, -0.5050858, -2.08477, 0.8078431, 1, 0, 1,
-0.8873063, 0.4228406, -1.227386, 0.8, 1, 0, 1,
-0.8815268, 1.103979, -2.049725, 0.7921569, 1, 0, 1,
-0.8808196, 0.2143407, -1.949574, 0.7882353, 1, 0, 1,
-0.8719193, 1.058403, 1.732415, 0.7803922, 1, 0, 1,
-0.8715739, -1.966472, -3.227808, 0.7764706, 1, 0, 1,
-0.860715, 1.042648, -0.8191045, 0.7686275, 1, 0, 1,
-0.8590528, -0.1711718, -1.788884, 0.7647059, 1, 0, 1,
-0.8540464, -3.321433, -3.254847, 0.7568628, 1, 0, 1,
-0.8510082, 0.2259112, -1.909548, 0.7529412, 1, 0, 1,
-0.8482605, -0.4787061, -2.705514, 0.7450981, 1, 0, 1,
-0.8425347, 1.474447, 0.2905371, 0.7411765, 1, 0, 1,
-0.8392687, 1.211153, 0.3698148, 0.7333333, 1, 0, 1,
-0.8387963, 1.391634, -1.748025, 0.7294118, 1, 0, 1,
-0.8372586, -0.2001399, -1.078883, 0.7215686, 1, 0, 1,
-0.8317456, -0.09938052, -2.494448, 0.7176471, 1, 0, 1,
-0.8314965, -0.7163938, -1.219629, 0.7098039, 1, 0, 1,
-0.8257883, 0.552688, -0.5984037, 0.7058824, 1, 0, 1,
-0.8248108, -1.695234, -2.197786, 0.6980392, 1, 0, 1,
-0.8228851, 0.4684792, -2.064009, 0.6901961, 1, 0, 1,
-0.8219107, -1.192946, -3.318484, 0.6862745, 1, 0, 1,
-0.8200567, -0.9211587, -1.907828, 0.6784314, 1, 0, 1,
-0.8172377, -0.2038134, -3.202975, 0.6745098, 1, 0, 1,
-0.8138357, -1.285434, -2.174293, 0.6666667, 1, 0, 1,
-0.8127285, 0.9464196, -0.3598522, 0.6627451, 1, 0, 1,
-0.8069239, 1.484327, 0.9692926, 0.654902, 1, 0, 1,
-0.8066438, -0.5102137, -0.2507006, 0.6509804, 1, 0, 1,
-0.7902879, 0.8707513, -0.5231307, 0.6431373, 1, 0, 1,
-0.7883516, 0.1080362, -1.812502, 0.6392157, 1, 0, 1,
-0.7849349, 0.6667374, -0.3018602, 0.6313726, 1, 0, 1,
-0.7847046, -0.2829209, -1.058023, 0.627451, 1, 0, 1,
-0.7818347, 0.8302563, -1.266758, 0.6196079, 1, 0, 1,
-0.7811722, -0.3981434, -1.577507, 0.6156863, 1, 0, 1,
-0.7807377, 0.1321521, -2.331594, 0.6078432, 1, 0, 1,
-0.768038, 0.03470353, 0.3712397, 0.6039216, 1, 0, 1,
-0.7640229, 2.030702, -1.929428, 0.5960785, 1, 0, 1,
-0.7525288, -1.710241, -3.164906, 0.5882353, 1, 0, 1,
-0.7476802, 0.7557956, -1.246154, 0.5843138, 1, 0, 1,
-0.7453036, 0.8571794, -1.509856, 0.5764706, 1, 0, 1,
-0.7381786, -0.9953809, -4.877886, 0.572549, 1, 0, 1,
-0.7372886, 1.02165, -0.1331638, 0.5647059, 1, 0, 1,
-0.7362975, -1.655088, -2.18513, 0.5607843, 1, 0, 1,
-0.731937, -1.9491, -2.447912, 0.5529412, 1, 0, 1,
-0.7316864, -0.4328394, -0.7885095, 0.5490196, 1, 0, 1,
-0.731153, -0.1795707, -0.6010707, 0.5411765, 1, 0, 1,
-0.728947, 1.462524, 2.131134, 0.5372549, 1, 0, 1,
-0.7279243, 0.1768186, -1.497337, 0.5294118, 1, 0, 1,
-0.7273096, -2.012026, -1.723089, 0.5254902, 1, 0, 1,
-0.7264448, 1.190689, -0.701567, 0.5176471, 1, 0, 1,
-0.7260417, 1.20904, 0.6893713, 0.5137255, 1, 0, 1,
-0.7221746, -0.1564776, -1.689851, 0.5058824, 1, 0, 1,
-0.716124, -0.03735763, -0.8516306, 0.5019608, 1, 0, 1,
-0.7127435, -0.1931417, -2.383132, 0.4941176, 1, 0, 1,
-0.7103378, -0.1062472, -0.3185383, 0.4862745, 1, 0, 1,
-0.7100279, 0.1406569, -0.1863901, 0.4823529, 1, 0, 1,
-0.7066442, -0.6854995, -2.705389, 0.4745098, 1, 0, 1,
-0.7060514, 0.2987426, 2.248985, 0.4705882, 1, 0, 1,
-0.7050455, 0.4125584, -0.8588536, 0.4627451, 1, 0, 1,
-0.7008773, -0.6313555, -1.18042, 0.4588235, 1, 0, 1,
-0.7004275, 0.201575, -0.278297, 0.4509804, 1, 0, 1,
-0.693715, -0.8548303, -2.814188, 0.4470588, 1, 0, 1,
-0.6923669, -0.6034639, -2.972012, 0.4392157, 1, 0, 1,
-0.692215, 0.857807, -2.338454, 0.4352941, 1, 0, 1,
-0.6907371, 0.8532299, -2.174553, 0.427451, 1, 0, 1,
-0.6874587, 1.178961, -0.6153805, 0.4235294, 1, 0, 1,
-0.6852885, 0.112061, -2.016082, 0.4156863, 1, 0, 1,
-0.6842275, 1.220721, 0.521365, 0.4117647, 1, 0, 1,
-0.6728712, -0.7272416, -2.043702, 0.4039216, 1, 0, 1,
-0.6666332, 0.8020829, -0.5450004, 0.3960784, 1, 0, 1,
-0.6642882, 2.040127, -1.380985, 0.3921569, 1, 0, 1,
-0.6637886, 0.77285, 0.6343147, 0.3843137, 1, 0, 1,
-0.6577179, 0.7500926, -1.137255, 0.3803922, 1, 0, 1,
-0.6548086, 0.1109181, -2.699787, 0.372549, 1, 0, 1,
-0.6505025, 0.3807596, -1.167116, 0.3686275, 1, 0, 1,
-0.6505004, 2.363925, -0.6371584, 0.3607843, 1, 0, 1,
-0.6488872, -1.325087, -1.786421, 0.3568628, 1, 0, 1,
-0.648654, 1.414511, -1.825187, 0.3490196, 1, 0, 1,
-0.6457115, -0.578584, -3.303668, 0.345098, 1, 0, 1,
-0.6452941, -0.5238826, -3.332847, 0.3372549, 1, 0, 1,
-0.6399958, -0.6261572, -1.288415, 0.3333333, 1, 0, 1,
-0.6371862, -0.595184, -1.910301, 0.3254902, 1, 0, 1,
-0.636955, -0.2162676, -2.705534, 0.3215686, 1, 0, 1,
-0.6348065, -0.8901405, -2.177368, 0.3137255, 1, 0, 1,
-0.6299255, -0.428088, -4.530361, 0.3098039, 1, 0, 1,
-0.6286051, 0.5701303, -0.4590479, 0.3019608, 1, 0, 1,
-0.6242543, -0.1993106, -0.478255, 0.2941177, 1, 0, 1,
-0.6210595, -1.197373, -1.748, 0.2901961, 1, 0, 1,
-0.6210189, -0.08836491, -2.211905, 0.282353, 1, 0, 1,
-0.6188556, -0.1567904, -2.917602, 0.2784314, 1, 0, 1,
-0.6187235, -1.530536, -3.85388, 0.2705882, 1, 0, 1,
-0.6111327, 1.061062, 0.82436, 0.2666667, 1, 0, 1,
-0.6094953, -0.8977184, -2.352084, 0.2588235, 1, 0, 1,
-0.6083345, 1.704471, -1.242805, 0.254902, 1, 0, 1,
-0.6066394, -1.308868, -2.649863, 0.2470588, 1, 0, 1,
-0.6060672, -0.9095824, -4.093528, 0.2431373, 1, 0, 1,
-0.6035506, 0.2393802, -1.406088, 0.2352941, 1, 0, 1,
-0.5973653, -1.129978, -2.31172, 0.2313726, 1, 0, 1,
-0.5959065, -0.05846402, -0.9738065, 0.2235294, 1, 0, 1,
-0.5930586, 1.853202, -2.852718, 0.2196078, 1, 0, 1,
-0.5918815, -1.514448, -3.012053, 0.2117647, 1, 0, 1,
-0.5906892, -0.6358417, -2.375466, 0.2078431, 1, 0, 1,
-0.5826623, -0.1005826, -0.5107483, 0.2, 1, 0, 1,
-0.5726701, -1.861074, -4.147272, 0.1921569, 1, 0, 1,
-0.570797, -0.6095638, -2.279864, 0.1882353, 1, 0, 1,
-0.5700183, -0.4941895, -1.761087, 0.1803922, 1, 0, 1,
-0.5682582, -0.469726, 0.01424545, 0.1764706, 1, 0, 1,
-0.5634249, 0.7892491, -3.294178, 0.1686275, 1, 0, 1,
-0.562462, -0.2330115, -2.207045, 0.1647059, 1, 0, 1,
-0.5606393, 1.302981, -2.350502, 0.1568628, 1, 0, 1,
-0.5588757, 0.3265582, -1.168017, 0.1529412, 1, 0, 1,
-0.5582946, 0.9274828, 6.031657e-05, 0.145098, 1, 0, 1,
-0.5469294, -0.9545233, -2.844272, 0.1411765, 1, 0, 1,
-0.5463569, -1.304781, -4.29816, 0.1333333, 1, 0, 1,
-0.5455623, 0.8976754, 0.07389491, 0.1294118, 1, 0, 1,
-0.5404984, 0.6854647, -1.674115, 0.1215686, 1, 0, 1,
-0.5392148, 0.3691785, -0.9809211, 0.1176471, 1, 0, 1,
-0.5356228, -0.233832, -2.344836, 0.1098039, 1, 0, 1,
-0.5347347, 0.01365093, -2.212305, 0.1058824, 1, 0, 1,
-0.5336097, 0.06834006, -0.6945723, 0.09803922, 1, 0, 1,
-0.5329562, 0.5640785, 0.3538876, 0.09019608, 1, 0, 1,
-0.5265255, -1.280408, -3.027677, 0.08627451, 1, 0, 1,
-0.5192729, -0.2108745, -1.60696, 0.07843138, 1, 0, 1,
-0.5185401, 0.3286036, -0.5179146, 0.07450981, 1, 0, 1,
-0.5179285, -0.1102068, -1.488875, 0.06666667, 1, 0, 1,
-0.5174667, -0.4487374, -3.455164, 0.0627451, 1, 0, 1,
-0.5162628, -0.4704263, -2.434718, 0.05490196, 1, 0, 1,
-0.5135804, -0.06267487, -1.580206, 0.05098039, 1, 0, 1,
-0.5120112, 1.269793, -0.1335414, 0.04313726, 1, 0, 1,
-0.5073864, 0.2340439, -0.401545, 0.03921569, 1, 0, 1,
-0.5049845, -1.704952, -4.239131, 0.03137255, 1, 0, 1,
-0.5032892, 0.2156583, -1.346809, 0.02745098, 1, 0, 1,
-0.4988333, 0.7345412, -1.13492, 0.01960784, 1, 0, 1,
-0.4971097, -0.02516377, -1.206474, 0.01568628, 1, 0, 1,
-0.4946841, -1.258728, -4.098599, 0.007843138, 1, 0, 1,
-0.4931424, 0.3621894, 0.1663133, 0.003921569, 1, 0, 1,
-0.490482, -0.6788388, -2.331329, 0, 1, 0.003921569, 1,
-0.490113, 0.9041916, -1.382308, 0, 1, 0.01176471, 1,
-0.4875662, -0.429885, -2.22433, 0, 1, 0.01568628, 1,
-0.4871615, -0.8335971, -0.1605883, 0, 1, 0.02352941, 1,
-0.4837794, -0.6504757, -1.914057, 0, 1, 0.02745098, 1,
-0.4764675, -0.02595619, -1.493944, 0, 1, 0.03529412, 1,
-0.4752009, -0.1624599, -1.495335, 0, 1, 0.03921569, 1,
-0.4708922, -0.4745237, -2.690002, 0, 1, 0.04705882, 1,
-0.4700027, -0.805068, -2.836635, 0, 1, 0.05098039, 1,
-0.4672677, 0.2909629, -1.171862, 0, 1, 0.05882353, 1,
-0.4616472, -0.2044139, -2.497509, 0, 1, 0.0627451, 1,
-0.4599479, 0.03120944, -2.651628, 0, 1, 0.07058824, 1,
-0.4598953, 2.894452, 0.7116389, 0, 1, 0.07450981, 1,
-0.4595015, 3.013072, 0.1871354, 0, 1, 0.08235294, 1,
-0.4575733, -0.3900467, -4.878457, 0, 1, 0.08627451, 1,
-0.4573262, -0.08321796, -3.042348, 0, 1, 0.09411765, 1,
-0.4572486, -0.9799061, -1.77511, 0, 1, 0.1019608, 1,
-0.4570925, 0.3463098, -2.522577, 0, 1, 0.1058824, 1,
-0.4534453, 2.025523, -0.4475374, 0, 1, 0.1137255, 1,
-0.452395, -0.148741, -0.516036, 0, 1, 0.1176471, 1,
-0.4500989, 0.6006805, 0.2155015, 0, 1, 0.1254902, 1,
-0.4398938, 0.6991137, -0.4139619, 0, 1, 0.1294118, 1,
-0.4384696, -0.3639618, -3.616997, 0, 1, 0.1372549, 1,
-0.4321541, 0.2051752, -3.454978, 0, 1, 0.1411765, 1,
-0.4273292, 0.8193579, -0.9815969, 0, 1, 0.1490196, 1,
-0.4261097, 0.4102016, -0.7314529, 0, 1, 0.1529412, 1,
-0.425067, -0.5657077, -3.512481, 0, 1, 0.1607843, 1,
-0.4058437, 0.1953461, -0.7279013, 0, 1, 0.1647059, 1,
-0.401272, 1.323422, -0.6291855, 0, 1, 0.172549, 1,
-0.3948029, 2.209791, 1.311276, 0, 1, 0.1764706, 1,
-0.3929038, -1.731447, -5.331161, 0, 1, 0.1843137, 1,
-0.3920696, -0.9590734, -1.466916, 0, 1, 0.1882353, 1,
-0.3884356, -0.4925845, -1.863001, 0, 1, 0.1960784, 1,
-0.3874535, -0.6875771, -4.983758, 0, 1, 0.2039216, 1,
-0.3757453, 1.926054, -0.7196256, 0, 1, 0.2078431, 1,
-0.3653499, -0.7488209, -1.711527, 0, 1, 0.2156863, 1,
-0.3651348, 0.7621167, -0.1782182, 0, 1, 0.2196078, 1,
-0.3618495, -0.4173182, -1.893806, 0, 1, 0.227451, 1,
-0.3597496, 0.07364421, -0.8101619, 0, 1, 0.2313726, 1,
-0.3491402, 1.518622, 0.6837673, 0, 1, 0.2392157, 1,
-0.3479877, -0.649289, -1.250138, 0, 1, 0.2431373, 1,
-0.3437016, 0.6673414, -0.8026179, 0, 1, 0.2509804, 1,
-0.3422208, 0.07575811, -2.246982, 0, 1, 0.254902, 1,
-0.3373425, -0.2476547, -1.142267, 0, 1, 0.2627451, 1,
-0.3365436, 0.5523644, -0.7095534, 0, 1, 0.2666667, 1,
-0.3362441, -0.4737783, -1.637856, 0, 1, 0.2745098, 1,
-0.3345612, 0.2255634, -0.05584414, 0, 1, 0.2784314, 1,
-0.3323884, 0.3540841, -1.323987, 0, 1, 0.2862745, 1,
-0.3322355, 1.895827, 0.2148851, 0, 1, 0.2901961, 1,
-0.3303869, -1.91436, -1.780212, 0, 1, 0.2980392, 1,
-0.3277471, 0.1943486, -0.3876263, 0, 1, 0.3058824, 1,
-0.3272202, -1.142822, -2.59846, 0, 1, 0.3098039, 1,
-0.3238062, 1.307763, 0.03013907, 0, 1, 0.3176471, 1,
-0.3196115, -0.6723859, -0.04876209, 0, 1, 0.3215686, 1,
-0.3187989, -0.9054748, -1.018008, 0, 1, 0.3294118, 1,
-0.3172283, 0.9906559, -2.334103, 0, 1, 0.3333333, 1,
-0.3139103, -1.350079, -4.469172, 0, 1, 0.3411765, 1,
-0.3109598, 0.4875455, -0.01346399, 0, 1, 0.345098, 1,
-0.3094358, 1.082239, -1.468873, 0, 1, 0.3529412, 1,
-0.3078892, 0.1104806, -2.339714, 0, 1, 0.3568628, 1,
-0.3047034, -1.485959, -4.404535, 0, 1, 0.3647059, 1,
-0.304464, -1.322702, -1.056789, 0, 1, 0.3686275, 1,
-0.3023166, 0.6330461, 0.6539609, 0, 1, 0.3764706, 1,
-0.3018683, 0.4915936, 1.225352, 0, 1, 0.3803922, 1,
-0.2964383, -1.155004, -1.25212, 0, 1, 0.3882353, 1,
-0.2853047, 0.2775814, -0.4516923, 0, 1, 0.3921569, 1,
-0.2789374, 1.519056, -0.6933869, 0, 1, 0.4, 1,
-0.2785549, 0.9341828, 0.3940497, 0, 1, 0.4078431, 1,
-0.2775071, 0.8771181, 0.7026521, 0, 1, 0.4117647, 1,
-0.2774724, 0.8562639, -0.7599258, 0, 1, 0.4196078, 1,
-0.2761164, 0.1221064, -0.6365162, 0, 1, 0.4235294, 1,
-0.274526, -0.7771475, -2.837109, 0, 1, 0.4313726, 1,
-0.2724014, -0.1377431, -1.156113, 0, 1, 0.4352941, 1,
-0.2718787, -0.5395862, -1.846029, 0, 1, 0.4431373, 1,
-0.2692613, 1.960808, 1.298516, 0, 1, 0.4470588, 1,
-0.2647758, -2.011689, -4.313268, 0, 1, 0.454902, 1,
-0.2627172, 0.7577949, -2.001926, 0, 1, 0.4588235, 1,
-0.2593583, -0.2889273, -3.405264, 0, 1, 0.4666667, 1,
-0.2528517, 0.06983088, -0.4290405, 0, 1, 0.4705882, 1,
-0.2516803, 0.3909691, -1.188505, 0, 1, 0.4784314, 1,
-0.2508786, 0.08234275, -2.851111, 0, 1, 0.4823529, 1,
-0.2503829, -0.6992023, -3.580246, 0, 1, 0.4901961, 1,
-0.2492957, 1.338188, -1.792901, 0, 1, 0.4941176, 1,
-0.2476432, -0.334642, -3.786589, 0, 1, 0.5019608, 1,
-0.2457973, -1.014056, -4.926423, 0, 1, 0.509804, 1,
-0.2443645, -0.4782087, -2.464517, 0, 1, 0.5137255, 1,
-0.2435222, 0.2186236, 0.1318515, 0, 1, 0.5215687, 1,
-0.2420888, 1.835967, -0.3152551, 0, 1, 0.5254902, 1,
-0.2394594, -0.104501, -4.314428, 0, 1, 0.5333334, 1,
-0.2393167, 0.7641063, -0.5439857, 0, 1, 0.5372549, 1,
-0.2300819, 0.008521823, 0.2773923, 0, 1, 0.5450981, 1,
-0.2289606, 0.6425753, 0.2696632, 0, 1, 0.5490196, 1,
-0.2273238, 1.311918, -1.319424, 0, 1, 0.5568628, 1,
-0.2272553, -0.4636693, -2.833308, 0, 1, 0.5607843, 1,
-0.2262449, 0.75281, 0.3127084, 0, 1, 0.5686275, 1,
-0.2225376, -0.3616565, -2.353338, 0, 1, 0.572549, 1,
-0.2213925, 2.596341, 0.1067758, 0, 1, 0.5803922, 1,
-0.2114616, 0.8643906, 0.6374029, 0, 1, 0.5843138, 1,
-0.2088737, 1.530994, 1.132081, 0, 1, 0.5921569, 1,
-0.2067489, 0.04690178, -0.6062635, 0, 1, 0.5960785, 1,
-0.2058011, -0.6162238, -2.52056, 0, 1, 0.6039216, 1,
-0.2045222, -0.7728122, -1.746577, 0, 1, 0.6117647, 1,
-0.2038031, -0.7200932, -4.490069, 0, 1, 0.6156863, 1,
-0.1963993, 0.1154316, -0.8372579, 0, 1, 0.6235294, 1,
-0.1939597, -0.1066124, -1.808383, 0, 1, 0.627451, 1,
-0.1920208, -0.6310974, -3.946227, 0, 1, 0.6352941, 1,
-0.1859871, -0.1517264, -3.45714, 0, 1, 0.6392157, 1,
-0.1809587, 0.3454297, -0.2429171, 0, 1, 0.6470588, 1,
-0.1785267, -1.130299, -3.93997, 0, 1, 0.6509804, 1,
-0.1772393, 0.2938378, -2.264055, 0, 1, 0.6588235, 1,
-0.1754828, -0.2157563, -2.975477, 0, 1, 0.6627451, 1,
-0.1712531, -0.4572137, -3.402464, 0, 1, 0.6705883, 1,
-0.1689913, -0.01549588, -2.867487, 0, 1, 0.6745098, 1,
-0.1689686, -0.03192475, -1.818693, 0, 1, 0.682353, 1,
-0.1688442, -1.007341, -2.967968, 0, 1, 0.6862745, 1,
-0.1686966, 0.6581048, -1.351566, 0, 1, 0.6941177, 1,
-0.1609658, -0.301787, -1.153713, 0, 1, 0.7019608, 1,
-0.1603381, -1.059105, -2.562847, 0, 1, 0.7058824, 1,
-0.1602028, 1.370102, 0.1402878, 0, 1, 0.7137255, 1,
-0.157927, 0.180677, -0.4476457, 0, 1, 0.7176471, 1,
-0.1565248, -0.1059102, -3.149341, 0, 1, 0.7254902, 1,
-0.1542526, 2.503037, -2.351244, 0, 1, 0.7294118, 1,
-0.1539925, -0.6045465, -3.794828, 0, 1, 0.7372549, 1,
-0.1520774, -0.8163568, -3.894151, 0, 1, 0.7411765, 1,
-0.1511618, 0.3941661, 0.5125001, 0, 1, 0.7490196, 1,
-0.1499245, -1.015687, -1.160039, 0, 1, 0.7529412, 1,
-0.1499182, 1.793191, 0.5611924, 0, 1, 0.7607843, 1,
-0.1496266, 0.1037567, -0.6881604, 0, 1, 0.7647059, 1,
-0.1473055, -0.1908055, -1.76118, 0, 1, 0.772549, 1,
-0.1456556, 1.70178, -0.318184, 0, 1, 0.7764706, 1,
-0.1401442, -0.01254379, -1.512722, 0, 1, 0.7843137, 1,
-0.1398209, -0.4790935, -2.023674, 0, 1, 0.7882353, 1,
-0.1303899, -0.2593705, -2.535923, 0, 1, 0.7960784, 1,
-0.129452, 1.138907, -0.09713119, 0, 1, 0.8039216, 1,
-0.1290013, 1.102227, -1.877476, 0, 1, 0.8078431, 1,
-0.1289561, 1.023604, -1.007137, 0, 1, 0.8156863, 1,
-0.1279905, 0.6307507, 0.002857799, 0, 1, 0.8196079, 1,
-0.124561, 2.377017, -0.009423319, 0, 1, 0.827451, 1,
-0.1243942, 0.2966953, 0.4227376, 0, 1, 0.8313726, 1,
-0.1229468, -1.904817, -5.430844, 0, 1, 0.8392157, 1,
-0.1168624, -0.3725654, -3.942175, 0, 1, 0.8431373, 1,
-0.1166114, 1.220926, 0.02869375, 0, 1, 0.8509804, 1,
-0.1163036, -0.9111773, -3.124614, 0, 1, 0.854902, 1,
-0.1156925, 0.6035683, -0.5773005, 0, 1, 0.8627451, 1,
-0.1139244, -0.1291804, -0.7180869, 0, 1, 0.8666667, 1,
-0.1086519, 0.3173369, -0.5385321, 0, 1, 0.8745098, 1,
-0.1030605, -0.956418, -5.570657, 0, 1, 0.8784314, 1,
-0.09887944, 1.593109, -0.4835232, 0, 1, 0.8862745, 1,
-0.09711124, -2.626883, -4.015865, 0, 1, 0.8901961, 1,
-0.09615515, 0.4697124, -1.566209, 0, 1, 0.8980392, 1,
-0.09237842, 1.065442, 0.6804488, 0, 1, 0.9058824, 1,
-0.08446054, 0.1923707, 0.2737051, 0, 1, 0.9098039, 1,
-0.08380103, 0.4687729, -1.161684, 0, 1, 0.9176471, 1,
-0.08261164, 0.4364958, -0.4720137, 0, 1, 0.9215686, 1,
-0.08101381, -1.70523, -3.746904, 0, 1, 0.9294118, 1,
-0.07650588, -0.4082092, -2.873628, 0, 1, 0.9333333, 1,
-0.06910468, -0.04084419, -3.141666, 0, 1, 0.9411765, 1,
-0.06633294, -0.03226442, -0.812685, 0, 1, 0.945098, 1,
-0.06343637, -0.2406426, -2.389989, 0, 1, 0.9529412, 1,
-0.06226709, 0.07655471, 0.8956797, 0, 1, 0.9568627, 1,
-0.06218253, 0.3525011, -0.4186646, 0, 1, 0.9647059, 1,
-0.06105764, 0.4143217, -0.1636459, 0, 1, 0.9686275, 1,
-0.06098537, -0.3857439, -3.028645, 0, 1, 0.9764706, 1,
-0.05835451, 0.493992, -0.2721899, 0, 1, 0.9803922, 1,
-0.0577516, 0.1919219, 0.6944491, 0, 1, 0.9882353, 1,
-0.05488695, -0.2284351, -2.912702, 0, 1, 0.9921569, 1,
-0.05397232, -0.0712063, -1.716516, 0, 1, 1, 1,
-0.05264871, 0.5902548, 1.659825, 0, 0.9921569, 1, 1,
-0.0515477, -0.6506486, -2.721654, 0, 0.9882353, 1, 1,
-0.05109686, 0.2543802, -2.279549, 0, 0.9803922, 1, 1,
-0.04936732, -0.9546124, -2.47606, 0, 0.9764706, 1, 1,
-0.0466711, -0.8014375, -1.182719, 0, 0.9686275, 1, 1,
-0.03966895, 0.4533685, 0.4092626, 0, 0.9647059, 1, 1,
-0.03157599, -0.09217323, -2.998873, 0, 0.9568627, 1, 1,
-0.02284902, 1.245493, -0.1252941, 0, 0.9529412, 1, 1,
-0.02005488, -0.6465929, -3.325214, 0, 0.945098, 1, 1,
-0.01753671, 2.023885, 0.7963974, 0, 0.9411765, 1, 1,
-0.01447175, -1.051702, -5.618814, 0, 0.9333333, 1, 1,
-0.01444779, 0.1840938, 0.09979999, 0, 0.9294118, 1, 1,
-0.01227338, -0.6083997, -2.801138, 0, 0.9215686, 1, 1,
-0.01183392, 1.271567, 0.2603472, 0, 0.9176471, 1, 1,
-0.01182663, -0.3634125, -2.20922, 0, 0.9098039, 1, 1,
-0.01114139, -0.2396533, -2.413479, 0, 0.9058824, 1, 1,
-0.007000546, -0.450657, -3.352752, 0, 0.8980392, 1, 1,
-0.004409854, -0.5388893, -3.661882, 0, 0.8901961, 1, 1,
-0.002723063, 0.1822923, -2.879905, 0, 0.8862745, 1, 1,
0.006923801, -0.6125227, 1.54335, 0, 0.8784314, 1, 1,
0.00792756, 0.2759669, 0.5518558, 0, 0.8745098, 1, 1,
0.008797184, -0.7753332, 2.831887, 0, 0.8666667, 1, 1,
0.01034019, -0.5990763, 4.302433, 0, 0.8627451, 1, 1,
0.01303367, 0.1201563, 2.527649, 0, 0.854902, 1, 1,
0.03298396, 2.08072, -1.741411, 0, 0.8509804, 1, 1,
0.03755009, 0.5334199, 1.421479, 0, 0.8431373, 1, 1,
0.0399981, 0.9195725, 0.5709946, 0, 0.8392157, 1, 1,
0.04416425, 0.2653019, 2.30031, 0, 0.8313726, 1, 1,
0.0452845, -2.300116, 2.554934, 0, 0.827451, 1, 1,
0.0518159, -0.5183983, 4.391816, 0, 0.8196079, 1, 1,
0.05343448, -0.05350461, 2.943222, 0, 0.8156863, 1, 1,
0.05501619, 1.192939, -0.1023566, 0, 0.8078431, 1, 1,
0.05587841, 0.1306936, 0.4762305, 0, 0.8039216, 1, 1,
0.05868215, 1.935131, 0.4297476, 0, 0.7960784, 1, 1,
0.06706247, -1.820932, 2.479589, 0, 0.7882353, 1, 1,
0.06930736, 0.4715459, 0.2594684, 0, 0.7843137, 1, 1,
0.07130146, -0.8358428, 4.726492, 0, 0.7764706, 1, 1,
0.07138986, 0.1818858, 0.8167519, 0, 0.772549, 1, 1,
0.07153679, 0.2776057, 1.527817, 0, 0.7647059, 1, 1,
0.07580636, -1.074411, 3.360985, 0, 0.7607843, 1, 1,
0.07786342, -0.01638261, 4.334223, 0, 0.7529412, 1, 1,
0.08219583, -0.3403487, 2.794323, 0, 0.7490196, 1, 1,
0.08274803, -0.3980819, 2.401978, 0, 0.7411765, 1, 1,
0.0861386, -0.945164, 4.222944, 0, 0.7372549, 1, 1,
0.08814425, -1.629113, 3.843733, 0, 0.7294118, 1, 1,
0.0900467, 0.4351868, 1.217412, 0, 0.7254902, 1, 1,
0.09136726, -1.778989, 4.587607, 0, 0.7176471, 1, 1,
0.0917718, 0.7847213, 0.03664594, 0, 0.7137255, 1, 1,
0.09300646, 1.342322, 1.14948, 0, 0.7058824, 1, 1,
0.09381093, 0.4329979, 0.08185052, 0, 0.6980392, 1, 1,
0.09391453, -0.8021574, 1.372458, 0, 0.6941177, 1, 1,
0.09453464, 1.587789, 0.730111, 0, 0.6862745, 1, 1,
0.09695619, -1.700821, 2.907044, 0, 0.682353, 1, 1,
0.09796731, -0.4648386, 2.470153, 0, 0.6745098, 1, 1,
0.1039994, 0.03714991, 2.097411, 0, 0.6705883, 1, 1,
0.104655, 0.3165907, -0.3379152, 0, 0.6627451, 1, 1,
0.1090981, -0.2714965, 3.981756, 0, 0.6588235, 1, 1,
0.1127199, 0.1758548, 1.032849, 0, 0.6509804, 1, 1,
0.1133128, 1.335692, 0.8865619, 0, 0.6470588, 1, 1,
0.1180281, -0.8264939, 2.537016, 0, 0.6392157, 1, 1,
0.1215331, -0.08968415, 1.95954, 0, 0.6352941, 1, 1,
0.1236724, 1.295015, -0.2022851, 0, 0.627451, 1, 1,
0.1285213, -0.03097992, 2.132785, 0, 0.6235294, 1, 1,
0.1336918, -0.9061688, 4.240233, 0, 0.6156863, 1, 1,
0.1340328, 0.5478796, 1.212912, 0, 0.6117647, 1, 1,
0.1370986, -0.8032759, 2.851518, 0, 0.6039216, 1, 1,
0.1371567, -0.5068056, 1.517605, 0, 0.5960785, 1, 1,
0.1373989, -0.5990339, 2.40433, 0, 0.5921569, 1, 1,
0.1388736, 1.171401, -0.9609133, 0, 0.5843138, 1, 1,
0.1445145, 0.2415628, -0.3120071, 0, 0.5803922, 1, 1,
0.1455679, 0.300767, 0.2752992, 0, 0.572549, 1, 1,
0.146617, -0.01002264, 2.171832, 0, 0.5686275, 1, 1,
0.1505311, 0.8761545, 0.02806169, 0, 0.5607843, 1, 1,
0.1518894, 0.6994024, 1.065022, 0, 0.5568628, 1, 1,
0.1553612, -0.1441936, 1.212823, 0, 0.5490196, 1, 1,
0.1579274, 0.362544, -0.8129992, 0, 0.5450981, 1, 1,
0.1635234, 0.5620765, -0.5338088, 0, 0.5372549, 1, 1,
0.1641132, -0.3967104, 2.455854, 0, 0.5333334, 1, 1,
0.1671292, -0.4648123, 2.949841, 0, 0.5254902, 1, 1,
0.1677701, -0.7988048, 3.620273, 0, 0.5215687, 1, 1,
0.1687082, -0.008053493, 1.818788, 0, 0.5137255, 1, 1,
0.1828482, -0.02164429, 2.312795, 0, 0.509804, 1, 1,
0.1853925, -0.9398583, 2.457913, 0, 0.5019608, 1, 1,
0.1913262, -0.2242886, 3.15132, 0, 0.4941176, 1, 1,
0.1927471, 0.6352152, -1.012584, 0, 0.4901961, 1, 1,
0.193447, -0.5567744, 2.65596, 0, 0.4823529, 1, 1,
0.1946594, 0.5559562, 2.906917, 0, 0.4784314, 1, 1,
0.204267, -1.265044, 2.378761, 0, 0.4705882, 1, 1,
0.2064005, 1.557233, -0.5299441, 0, 0.4666667, 1, 1,
0.2087905, -0.2607113, 1.40535, 0, 0.4588235, 1, 1,
0.2090918, -0.06249524, 3.293752, 0, 0.454902, 1, 1,
0.2115702, -0.1929776, 1.38835, 0, 0.4470588, 1, 1,
0.2152654, -0.01636466, 1.059813, 0, 0.4431373, 1, 1,
0.2208454, -1.404121, 2.747355, 0, 0.4352941, 1, 1,
0.2216498, -0.6792026, 2.221123, 0, 0.4313726, 1, 1,
0.2221561, 0.7642571, -0.7057357, 0, 0.4235294, 1, 1,
0.2222545, -0.1523589, 2.444811, 0, 0.4196078, 1, 1,
0.2223118, -0.8315727, 1.779991, 0, 0.4117647, 1, 1,
0.2252433, -0.7135111, 2.625954, 0, 0.4078431, 1, 1,
0.2256464, 0.9433, -1.229512, 0, 0.4, 1, 1,
0.2267725, -1.395061, 2.213882, 0, 0.3921569, 1, 1,
0.2272581, 1.736021, 0.2611682, 0, 0.3882353, 1, 1,
0.230908, -0.5894616, 2.754128, 0, 0.3803922, 1, 1,
0.2392807, 1.711058, 1.189393, 0, 0.3764706, 1, 1,
0.2394795, -0.7426196, 1.408748, 0, 0.3686275, 1, 1,
0.2439222, -1.121216, 3.710582, 0, 0.3647059, 1, 1,
0.2470879, 0.0991557, 0.2473802, 0, 0.3568628, 1, 1,
0.2491062, 1.086957, 0.259888, 0, 0.3529412, 1, 1,
0.2573563, -0.8096976, 0.8593222, 0, 0.345098, 1, 1,
0.2584348, -0.1889082, 1.485825, 0, 0.3411765, 1, 1,
0.2642588, 0.9544796, -1.664663, 0, 0.3333333, 1, 1,
0.2665881, 0.4804638, 0.1226149, 0, 0.3294118, 1, 1,
0.2684472, -0.0378092, 0.8355972, 0, 0.3215686, 1, 1,
0.268896, -0.8680836, 1.797342, 0, 0.3176471, 1, 1,
0.2704826, 0.2665292, -0.3415781, 0, 0.3098039, 1, 1,
0.2727321, 1.973441, 0.937016, 0, 0.3058824, 1, 1,
0.2740238, 0.2400865, 0.4244148, 0, 0.2980392, 1, 1,
0.2765935, -0.06155166, 0.7694244, 0, 0.2901961, 1, 1,
0.2769261, 1.365919, 2.069978, 0, 0.2862745, 1, 1,
0.2777208, 0.2564125, 2.330029, 0, 0.2784314, 1, 1,
0.2777326, -0.8795527, 3.246825, 0, 0.2745098, 1, 1,
0.2801738, 0.863458, 1.1043, 0, 0.2666667, 1, 1,
0.2813182, -1.801594, 2.348067, 0, 0.2627451, 1, 1,
0.2846108, -0.1253555, 3.284603, 0, 0.254902, 1, 1,
0.2857874, 1.632158, 0.3396135, 0, 0.2509804, 1, 1,
0.2944482, 0.03040672, 2.10774, 0, 0.2431373, 1, 1,
0.2980082, 1.031457, -0.4902707, 0, 0.2392157, 1, 1,
0.299529, -0.7713659, 2.826444, 0, 0.2313726, 1, 1,
0.301084, -1.545607, 1.005893, 0, 0.227451, 1, 1,
0.301514, 0.627906, 0.5281535, 0, 0.2196078, 1, 1,
0.304709, 0.9910851, 0.1120882, 0, 0.2156863, 1, 1,
0.3064372, 0.7123034, -0.02694103, 0, 0.2078431, 1, 1,
0.3074876, -0.8742838, 0.4436432, 0, 0.2039216, 1, 1,
0.3080556, 0.3599299, 0.5240384, 0, 0.1960784, 1, 1,
0.3104531, 1.030952, 0.06427244, 0, 0.1882353, 1, 1,
0.3121489, -0.9099934, 2.549517, 0, 0.1843137, 1, 1,
0.3154641, -0.3975128, 1.673265, 0, 0.1764706, 1, 1,
0.3156694, -1.192113, 2.135011, 0, 0.172549, 1, 1,
0.3159897, 1.40606, 0.8416601, 0, 0.1647059, 1, 1,
0.3185197, -1.228046, 4.034928, 0, 0.1607843, 1, 1,
0.3217138, 1.134526, -0.5444184, 0, 0.1529412, 1, 1,
0.3279242, -0.7949947, 3.671119, 0, 0.1490196, 1, 1,
0.3306273, 0.2168096, -0.03625146, 0, 0.1411765, 1, 1,
0.3326474, -0.183399, 1.061773, 0, 0.1372549, 1, 1,
0.3327591, 0.4196874, 1.13195, 0, 0.1294118, 1, 1,
0.3362636, -1.098426, 1.715719, 0, 0.1254902, 1, 1,
0.3362642, 1.04334, -0.2400084, 0, 0.1176471, 1, 1,
0.3410902, 1.925781, 2.407535, 0, 0.1137255, 1, 1,
0.3416366, 0.2869003, 0.5482501, 0, 0.1058824, 1, 1,
0.3418191, -1.162671, 3.825608, 0, 0.09803922, 1, 1,
0.342184, -0.07715105, 1.540797, 0, 0.09411765, 1, 1,
0.3468886, 0.2449, 2.197097, 0, 0.08627451, 1, 1,
0.3593252, -0.6996775, 3.135805, 0, 0.08235294, 1, 1,
0.3596841, -0.6776865, 2.961706, 0, 0.07450981, 1, 1,
0.362921, -0.6084822, 3.134239, 0, 0.07058824, 1, 1,
0.365412, 1.433929, 1.480733, 0, 0.0627451, 1, 1,
0.3760423, 1.596293, 0.1802564, 0, 0.05882353, 1, 1,
0.3782169, -1.844534, 2.681074, 0, 0.05098039, 1, 1,
0.3802804, -0.178652, 2.318751, 0, 0.04705882, 1, 1,
0.3877365, -0.01722963, 3.666438, 0, 0.03921569, 1, 1,
0.3885359, 1.085146, 0.1600243, 0, 0.03529412, 1, 1,
0.388627, 0.08558895, 1.417404, 0, 0.02745098, 1, 1,
0.3899006, 0.09803268, -0.06158673, 0, 0.02352941, 1, 1,
0.3899114, 0.6507045, 0.2582257, 0, 0.01568628, 1, 1,
0.3929431, -1.523057, 2.951403, 0, 0.01176471, 1, 1,
0.3932821, -0.5283093, 3.903425, 0, 0.003921569, 1, 1,
0.398444, -0.1751237, 0.7600306, 0.003921569, 0, 1, 1,
0.3986216, 0.9734277, -1.539323, 0.007843138, 0, 1, 1,
0.3990404, 0.1797194, 0.8011313, 0.01568628, 0, 1, 1,
0.3995215, 0.5413985, -0.354477, 0.01960784, 0, 1, 1,
0.3998671, 0.5602009, 2.779521, 0.02745098, 0, 1, 1,
0.4052056, -1.583442, 3.224538, 0.03137255, 0, 1, 1,
0.4117316, -1.224016, 1.76335, 0.03921569, 0, 1, 1,
0.4119631, -0.154359, 1.732679, 0.04313726, 0, 1, 1,
0.4136299, 0.4224116, -0.5410945, 0.05098039, 0, 1, 1,
0.4190461, -0.07184138, 3.289989, 0.05490196, 0, 1, 1,
0.4283761, -0.1648998, 3.266957, 0.0627451, 0, 1, 1,
0.4321209, 0.3556032, 2.717906, 0.06666667, 0, 1, 1,
0.4324305, 1.041193, 1.22119, 0.07450981, 0, 1, 1,
0.4334001, -1.423318, 2.728433, 0.07843138, 0, 1, 1,
0.4408763, -0.6009999, 2.685505, 0.08627451, 0, 1, 1,
0.4428054, -0.3270664, 1.341098, 0.09019608, 0, 1, 1,
0.4441841, -1.662898, 2.607729, 0.09803922, 0, 1, 1,
0.4444379, -0.3704197, 2.20416, 0.1058824, 0, 1, 1,
0.4449252, -1.469184, 2.516485, 0.1098039, 0, 1, 1,
0.4454133, 0.9858136, 2.094249, 0.1176471, 0, 1, 1,
0.4465604, -0.1568774, 2.196494, 0.1215686, 0, 1, 1,
0.4469767, -0.03641837, 0.9465232, 0.1294118, 0, 1, 1,
0.4485796, -0.41684, 1.220769, 0.1333333, 0, 1, 1,
0.449422, 1.154794, 1.192122, 0.1411765, 0, 1, 1,
0.449734, 0.9878247, -0.4446864, 0.145098, 0, 1, 1,
0.4505673, 0.3729838, -0.4489477, 0.1529412, 0, 1, 1,
0.4511003, -0.0724372, -0.3438219, 0.1568628, 0, 1, 1,
0.4529741, 0.2194531, 1.405502, 0.1647059, 0, 1, 1,
0.453354, 1.359367, -0.3595917, 0.1686275, 0, 1, 1,
0.4547904, 1.118009, 1.151772, 0.1764706, 0, 1, 1,
0.4548542, -0.3189799, 1.211832, 0.1803922, 0, 1, 1,
0.4601336, -0.9592422, 2.605919, 0.1882353, 0, 1, 1,
0.4632805, 0.5710914, 0.5071881, 0.1921569, 0, 1, 1,
0.4669218, -1.065168, 2.628073, 0.2, 0, 1, 1,
0.4698675, 0.9089069, 0.8051179, 0.2078431, 0, 1, 1,
0.4706843, -0.1764291, 2.201316, 0.2117647, 0, 1, 1,
0.4774251, -1.046266, 2.726438, 0.2196078, 0, 1, 1,
0.4798014, -0.5785084, 2.947272, 0.2235294, 0, 1, 1,
0.480234, 0.2476794, 1.22469, 0.2313726, 0, 1, 1,
0.4808038, 0.1008265, 1.265149, 0.2352941, 0, 1, 1,
0.4842664, 0.274946, 1.977811, 0.2431373, 0, 1, 1,
0.4854508, -1.632763, 1.808865, 0.2470588, 0, 1, 1,
0.4867052, 1.867976, 0.9684809, 0.254902, 0, 1, 1,
0.4889154, -0.06110207, 3.858377, 0.2588235, 0, 1, 1,
0.4946712, 1.686402, 1.578461, 0.2666667, 0, 1, 1,
0.5049139, -0.1574966, 2.071032, 0.2705882, 0, 1, 1,
0.5094233, -0.7955037, 2.974749, 0.2784314, 0, 1, 1,
0.5165356, 0.7837081, -0.1163177, 0.282353, 0, 1, 1,
0.5178198, -1.720432, 1.683396, 0.2901961, 0, 1, 1,
0.5216729, -0.3847613, 2.716954, 0.2941177, 0, 1, 1,
0.5254202, -0.5139058, 1.334252, 0.3019608, 0, 1, 1,
0.5269831, -0.5585214, 3.131384, 0.3098039, 0, 1, 1,
0.5275281, -0.7207358, 3.810891, 0.3137255, 0, 1, 1,
0.5284633, -0.3396426, 1.613552, 0.3215686, 0, 1, 1,
0.5346389, 1.494555, -0.8713042, 0.3254902, 0, 1, 1,
0.5352555, 0.6981769, -0.2483482, 0.3333333, 0, 1, 1,
0.5369195, -0.6045726, 1.618074, 0.3372549, 0, 1, 1,
0.5377201, 0.5925704, 0.7090808, 0.345098, 0, 1, 1,
0.5392891, 1.09386, 0.8395356, 0.3490196, 0, 1, 1,
0.5404665, 0.01299945, 3.405231, 0.3568628, 0, 1, 1,
0.5483476, -0.6482508, 0.7955976, 0.3607843, 0, 1, 1,
0.548952, -0.187557, 2.269361, 0.3686275, 0, 1, 1,
0.5490874, -1.441824, 2.693363, 0.372549, 0, 1, 1,
0.5502211, -0.864848, 1.522333, 0.3803922, 0, 1, 1,
0.5516729, -0.2350854, 3.466096, 0.3843137, 0, 1, 1,
0.5526808, -1.151197, 3.540635, 0.3921569, 0, 1, 1,
0.5538625, 0.759859, -1.320706, 0.3960784, 0, 1, 1,
0.5539824, -0.1584193, 0.9069293, 0.4039216, 0, 1, 1,
0.5544273, -0.1748108, 2.411962, 0.4117647, 0, 1, 1,
0.5552614, -0.4229052, 3.695027, 0.4156863, 0, 1, 1,
0.5559503, -0.2867609, 2.071672, 0.4235294, 0, 1, 1,
0.5588392, -0.284412, 1.712622, 0.427451, 0, 1, 1,
0.5649033, -1.560044, 1.320431, 0.4352941, 0, 1, 1,
0.5658841, 0.9068382, -0.7630429, 0.4392157, 0, 1, 1,
0.5730994, -0.4051837, 3.211523, 0.4470588, 0, 1, 1,
0.5738254, -0.2610509, 1.943765, 0.4509804, 0, 1, 1,
0.5755733, 1.206676, 1.743918, 0.4588235, 0, 1, 1,
0.5763094, 0.3804258, 1.259021, 0.4627451, 0, 1, 1,
0.5807863, 0.3879336, 1.874055, 0.4705882, 0, 1, 1,
0.5838436, -0.9020686, 1.497777, 0.4745098, 0, 1, 1,
0.5869679, -0.2235735, 1.808501, 0.4823529, 0, 1, 1,
0.5907325, -0.7136832, 2.996459, 0.4862745, 0, 1, 1,
0.5950345, 2.253401, 0.1957281, 0.4941176, 0, 1, 1,
0.5953373, -0.4712848, 2.305559, 0.5019608, 0, 1, 1,
0.5955528, 0.3142189, 1.975844, 0.5058824, 0, 1, 1,
0.5962852, 0.297148, 0.9732611, 0.5137255, 0, 1, 1,
0.599534, 0.797681, 0.03218101, 0.5176471, 0, 1, 1,
0.6028745, -0.3909501, 2.894021, 0.5254902, 0, 1, 1,
0.6119316, 0.735128, 0.5216308, 0.5294118, 0, 1, 1,
0.6162311, -3.153033, 2.299989, 0.5372549, 0, 1, 1,
0.6191378, -0.7195188, 2.984395, 0.5411765, 0, 1, 1,
0.6218375, 1.154783, 0.8969311, 0.5490196, 0, 1, 1,
0.6249263, 1.169683, 0.5693308, 0.5529412, 0, 1, 1,
0.6323094, -1.477826, 2.093358, 0.5607843, 0, 1, 1,
0.6392617, 2.446354, 1.010255, 0.5647059, 0, 1, 1,
0.6486926, -0.8991812, 3.627284, 0.572549, 0, 1, 1,
0.6529468, 0.3241743, 1.042611, 0.5764706, 0, 1, 1,
0.6554533, -0.7242758, 3.247326, 0.5843138, 0, 1, 1,
0.659742, -0.228667, 1.719165, 0.5882353, 0, 1, 1,
0.6605504, -0.9885409, 3.741361, 0.5960785, 0, 1, 1,
0.6632887, -0.04139559, 1.585021, 0.6039216, 0, 1, 1,
0.6633191, 0.06426581, 0.0463391, 0.6078432, 0, 1, 1,
0.6661354, 0.6737354, 0.02080787, 0.6156863, 0, 1, 1,
0.6697956, 0.5230709, 0.4283671, 0.6196079, 0, 1, 1,
0.6700079, 0.9102218, 1.636785, 0.627451, 0, 1, 1,
0.6705077, -0.3383835, 4.503334, 0.6313726, 0, 1, 1,
0.6731696, -1.463205, 2.337486, 0.6392157, 0, 1, 1,
0.6765571, -1.337764, 3.097704, 0.6431373, 0, 1, 1,
0.6779784, -0.05286652, 1.095653, 0.6509804, 0, 1, 1,
0.6784231, -0.1650319, 2.549389, 0.654902, 0, 1, 1,
0.6875536, 1.276369, 0.8206314, 0.6627451, 0, 1, 1,
0.6888829, -0.6857508, 2.887821, 0.6666667, 0, 1, 1,
0.6925004, 0.3886962, 0.5777258, 0.6745098, 0, 1, 1,
0.6931034, 0.03519632, 2.422105, 0.6784314, 0, 1, 1,
0.6949859, 0.6857414, 0.5351921, 0.6862745, 0, 1, 1,
0.6984307, 1.083406, 0.6799902, 0.6901961, 0, 1, 1,
0.701205, 0.5105346, 0.4382276, 0.6980392, 0, 1, 1,
0.7012644, 1.480685, 0.6757156, 0.7058824, 0, 1, 1,
0.7023761, -1.185613, 1.675593, 0.7098039, 0, 1, 1,
0.7073459, -1.895817, 5.008254, 0.7176471, 0, 1, 1,
0.7075075, 2.436904, -0.638033, 0.7215686, 0, 1, 1,
0.7111577, 0.4879604, 1.843693, 0.7294118, 0, 1, 1,
0.7159446, 0.4082269, 0.5463531, 0.7333333, 0, 1, 1,
0.7239502, 0.5661923, 0.4481255, 0.7411765, 0, 1, 1,
0.7245479, 0.6153496, 1.301002, 0.7450981, 0, 1, 1,
0.7320968, -1.852393, 2.657274, 0.7529412, 0, 1, 1,
0.7326964, -0.07852268, 3.284604, 0.7568628, 0, 1, 1,
0.7328066, 0.2753972, 0.7279305, 0.7647059, 0, 1, 1,
0.7385942, 0.4395122, -0.008310908, 0.7686275, 0, 1, 1,
0.7389014, 1.62876, 2.289928, 0.7764706, 0, 1, 1,
0.7393824, 1.814958, 0.175754, 0.7803922, 0, 1, 1,
0.7438347, -0.08772918, 1.747177, 0.7882353, 0, 1, 1,
0.7570572, 0.09376864, 2.567091, 0.7921569, 0, 1, 1,
0.761273, 1.653605, -2.027096, 0.8, 0, 1, 1,
0.7622237, 1.031891, 2.369075, 0.8078431, 0, 1, 1,
0.7644918, 0.8391104, 0.09623392, 0.8117647, 0, 1, 1,
0.7713863, 0.1264209, -1.192057, 0.8196079, 0, 1, 1,
0.7736792, -0.06763538, 1.584836, 0.8235294, 0, 1, 1,
0.7739153, 1.246508, 0.7549722, 0.8313726, 0, 1, 1,
0.7739478, 0.1036717, 2.802779, 0.8352941, 0, 1, 1,
0.7765509, 0.7267685, 1.255811, 0.8431373, 0, 1, 1,
0.7784402, -0.08263458, 2.516938, 0.8470588, 0, 1, 1,
0.7790406, 2.546715, 0.0381729, 0.854902, 0, 1, 1,
0.7823957, -0.1933238, 2.878001, 0.8588235, 0, 1, 1,
0.7843575, 0.18629, 2.254017, 0.8666667, 0, 1, 1,
0.788089, -0.6246312, 0.4031015, 0.8705882, 0, 1, 1,
0.791894, 0.3102142, -0.0247842, 0.8784314, 0, 1, 1,
0.7933038, -0.3450307, 1.790931, 0.8823529, 0, 1, 1,
0.7958881, 0.0945977, 1.694379, 0.8901961, 0, 1, 1,
0.7965779, -0.4821466, 2.138106, 0.8941177, 0, 1, 1,
0.7969803, -1.245196, 4.183349, 0.9019608, 0, 1, 1,
0.7971696, -0.5316778, 0.312488, 0.9098039, 0, 1, 1,
0.8002024, -0.2546619, 1.580326, 0.9137255, 0, 1, 1,
0.8003349, -0.8337503, 1.667401, 0.9215686, 0, 1, 1,
0.8020458, -0.7621185, 0.4948396, 0.9254902, 0, 1, 1,
0.8065695, -1.341104, 2.683447, 0.9333333, 0, 1, 1,
0.8179051, -0.6966122, 3.043708, 0.9372549, 0, 1, 1,
0.8204598, 0.8324497, -0.08956359, 0.945098, 0, 1, 1,
0.82252, 0.7107688, -0.2557326, 0.9490196, 0, 1, 1,
0.8270032, -0.4610459, 0.852378, 0.9568627, 0, 1, 1,
0.8299766, -0.9152731, 2.487671, 0.9607843, 0, 1, 1,
0.8379369, 1.931685, -1.318273, 0.9686275, 0, 1, 1,
0.8417068, -0.4617854, 2.108032, 0.972549, 0, 1, 1,
0.8428416, -0.8357283, 0.2103067, 0.9803922, 0, 1, 1,
0.8473427, 0.7019071, 2.915983, 0.9843137, 0, 1, 1,
0.8475445, 1.677441, 0.956594, 0.9921569, 0, 1, 1,
0.8505242, 2.343129, 0.03705531, 0.9960784, 0, 1, 1,
0.8542804, -0.3036969, 2.918415, 1, 0, 0.9960784, 1,
0.8561603, 0.1011595, 1.646706, 1, 0, 0.9882353, 1,
0.8576753, -0.2880799, 1.752415, 1, 0, 0.9843137, 1,
0.8749822, -0.3152062, 0.07887886, 1, 0, 0.9764706, 1,
0.8758454, 0.4374185, -0.002562654, 1, 0, 0.972549, 1,
0.8852721, -0.3312541, 0.9299344, 1, 0, 0.9647059, 1,
0.8868116, -0.8641944, 0.9929252, 1, 0, 0.9607843, 1,
0.8894394, 0.2299825, 2.095631, 1, 0, 0.9529412, 1,
0.897571, 1.626077, 1.046341, 1, 0, 0.9490196, 1,
0.8979998, -1.26503, 2.792294, 1, 0, 0.9411765, 1,
0.9017541, 0.871967, -0.1633173, 1, 0, 0.9372549, 1,
0.9019967, -1.090251, 0.674651, 1, 0, 0.9294118, 1,
0.9223645, -0.8111534, 1.752618, 1, 0, 0.9254902, 1,
0.9246295, 0.8091489, 1.748164, 1, 0, 0.9176471, 1,
0.9290788, 1.49388, 1.132044, 1, 0, 0.9137255, 1,
0.9421069, -0.4651504, 1.78687, 1, 0, 0.9058824, 1,
0.9449934, 1.173264, -0.7115414, 1, 0, 0.9019608, 1,
0.9497476, 0.6813844, 0.7480549, 1, 0, 0.8941177, 1,
0.9538176, 0.8702241, 1.471569, 1, 0, 0.8862745, 1,
0.9562519, -1.570355, 2.912004, 1, 0, 0.8823529, 1,
0.9563771, -0.09376179, 1.279714, 1, 0, 0.8745098, 1,
0.9567311, 0.5274996, 1.957314, 1, 0, 0.8705882, 1,
0.9600497, 1.089434, -1.544581, 1, 0, 0.8627451, 1,
0.9625879, -0.3147311, 1.856833, 1, 0, 0.8588235, 1,
0.9774438, 0.5291726, 1.250625, 1, 0, 0.8509804, 1,
0.9777067, 0.3973789, 3.486756, 1, 0, 0.8470588, 1,
0.9781874, -0.1198241, 2.229131, 1, 0, 0.8392157, 1,
0.979809, 0.8720871, -0.4698898, 1, 0, 0.8352941, 1,
0.9825664, 1.201112, -0.8728653, 1, 0, 0.827451, 1,
0.98366, 1.644303, 1.793675, 1, 0, 0.8235294, 1,
0.9858389, 0.0737608, 1.843877, 1, 0, 0.8156863, 1,
0.9859037, -0.2084113, 2.150797, 1, 0, 0.8117647, 1,
0.9949699, 0.664677, -0.7683976, 1, 0, 0.8039216, 1,
0.9973537, -1.179188, 2.519325, 1, 0, 0.7960784, 1,
0.9984567, 0.2203779, -0.02698655, 1, 0, 0.7921569, 1,
1.000487, 1.294672, 0.7841002, 1, 0, 0.7843137, 1,
1.004583, -1.053633, 3.239549, 1, 0, 0.7803922, 1,
1.008204, 1.151902, 0.9051446, 1, 0, 0.772549, 1,
1.009277, 0.3092988, 1.754418, 1, 0, 0.7686275, 1,
1.012279, 0.3502945, 1.65037, 1, 0, 0.7607843, 1,
1.017047, -0.8596256, 2.213748, 1, 0, 0.7568628, 1,
1.020782, -0.8193257, 2.585863, 1, 0, 0.7490196, 1,
1.021782, -1.028732, 1.918389, 1, 0, 0.7450981, 1,
1.022497, -0.9051476, 2.96091, 1, 0, 0.7372549, 1,
1.037043, 1.129298, -0.2509053, 1, 0, 0.7333333, 1,
1.041379, -0.1198687, 2.286093, 1, 0, 0.7254902, 1,
1.04444, 0.318308, 0.4867912, 1, 0, 0.7215686, 1,
1.047913, 0.5930012, -1.237037, 1, 0, 0.7137255, 1,
1.048938, 0.1066503, 1.799473, 1, 0, 0.7098039, 1,
1.05144, -0.456768, 3.596036, 1, 0, 0.7019608, 1,
1.051802, 0.2793449, 0.8274053, 1, 0, 0.6941177, 1,
1.057385, -0.7978668, 0.4307136, 1, 0, 0.6901961, 1,
1.087567, -0.8888947, 1.996095, 1, 0, 0.682353, 1,
1.094668, -1.034061, 1.393894, 1, 0, 0.6784314, 1,
1.098708, -0.2121328, 1.101007, 1, 0, 0.6705883, 1,
1.101729, 1.405761, 1.943439, 1, 0, 0.6666667, 1,
1.113495, 1.822679, -0.5060294, 1, 0, 0.6588235, 1,
1.128628, 0.7456855, 1.280677, 1, 0, 0.654902, 1,
1.136247, -0.05699822, 1.213512, 1, 0, 0.6470588, 1,
1.137082, -0.1771736, 0.892661, 1, 0, 0.6431373, 1,
1.141841, -1.279486, 2.474705, 1, 0, 0.6352941, 1,
1.156218, 0.8027424, 1.639898, 1, 0, 0.6313726, 1,
1.1586, 0.03285545, 3.078625, 1, 0, 0.6235294, 1,
1.161901, 1.940464, -0.4840901, 1, 0, 0.6196079, 1,
1.167166, 0.004012526, 1.124558, 1, 0, 0.6117647, 1,
1.171236, -0.09337445, 0.3979641, 1, 0, 0.6078432, 1,
1.178696, 1.507932, -0.3632562, 1, 0, 0.6, 1,
1.19575, -1.015268, 2.896533, 1, 0, 0.5921569, 1,
1.211023, -0.5489568, 2.410771, 1, 0, 0.5882353, 1,
1.220827, 0.4943615, 0.1881182, 1, 0, 0.5803922, 1,
1.230458, 0.3270613, 1.732237, 1, 0, 0.5764706, 1,
1.233073, -1.102904, 4.112729, 1, 0, 0.5686275, 1,
1.247594, 1.017871, 0.336892, 1, 0, 0.5647059, 1,
1.247666, 0.06361614, 0.2803323, 1, 0, 0.5568628, 1,
1.254995, -1.549119, 2.363745, 1, 0, 0.5529412, 1,
1.25518, -0.9668217, 1.345245, 1, 0, 0.5450981, 1,
1.25597, 2.912696, -1.397934, 1, 0, 0.5411765, 1,
1.258987, -0.6989587, 3.845058, 1, 0, 0.5333334, 1,
1.275751, 1.844143, 1.840367, 1, 0, 0.5294118, 1,
1.275917, 0.7995628, 1.186753, 1, 0, 0.5215687, 1,
1.282267, 0.1430142, 1.947751, 1, 0, 0.5176471, 1,
1.285629, -2.354713, 2.837961, 1, 0, 0.509804, 1,
1.286068, 0.08586899, 2.970083, 1, 0, 0.5058824, 1,
1.30213, 0.6755391, -1.447473, 1, 0, 0.4980392, 1,
1.31259, -0.4309345, 0.8034769, 1, 0, 0.4901961, 1,
1.313156, -0.3056151, 2.88225, 1, 0, 0.4862745, 1,
1.319781, -0.6432484, 2.454121, 1, 0, 0.4784314, 1,
1.326446, 0.2178745, -1.246212, 1, 0, 0.4745098, 1,
1.332686, -0.6239315, 3.366821, 1, 0, 0.4666667, 1,
1.35266, -0.5623744, 2.932827, 1, 0, 0.4627451, 1,
1.362105, 1.116652, -0.2513678, 1, 0, 0.454902, 1,
1.373643, -0.3825977, 1.190543, 1, 0, 0.4509804, 1,
1.382234, 1.662913, 0.6834123, 1, 0, 0.4431373, 1,
1.386078, 1.510833, 1.284067, 1, 0, 0.4392157, 1,
1.393136, 0.9672188, -0.743238, 1, 0, 0.4313726, 1,
1.393777, -1.516348, 2.498447, 1, 0, 0.427451, 1,
1.399742, 0.8373657, -0.1674161, 1, 0, 0.4196078, 1,
1.401018, 1.328318, 0.1533733, 1, 0, 0.4156863, 1,
1.402859, -1.266256, 3.12252, 1, 0, 0.4078431, 1,
1.405884, 1.756041, 0.6462191, 1, 0, 0.4039216, 1,
1.417559, 0.1457111, 0.8312807, 1, 0, 0.3960784, 1,
1.422082, 0.4677649, -0.2903537, 1, 0, 0.3882353, 1,
1.452836, -0.1934118, 2.284361, 1, 0, 0.3843137, 1,
1.46394, -1.952621, 1.870118, 1, 0, 0.3764706, 1,
1.479926, -0.004673908, 1.630603, 1, 0, 0.372549, 1,
1.483751, -1.044344, 0.4732757, 1, 0, 0.3647059, 1,
1.485451, 1.005749, 2.027856, 1, 0, 0.3607843, 1,
1.487913, -0.3282767, 4.149319, 1, 0, 0.3529412, 1,
1.489299, 0.7901909, 0.5571498, 1, 0, 0.3490196, 1,
1.493662, 0.1076118, 1.678735, 1, 0, 0.3411765, 1,
1.498149, 0.9739087, -0.6688496, 1, 0, 0.3372549, 1,
1.498266, 0.8143489, 1.781882, 1, 0, 0.3294118, 1,
1.50003, 0.8676878, 0.8711556, 1, 0, 0.3254902, 1,
1.500048, 2.350445, 0.08575507, 1, 0, 0.3176471, 1,
1.506548, -0.8941986, 1.76017, 1, 0, 0.3137255, 1,
1.51193, -1.421359, 2.380493, 1, 0, 0.3058824, 1,
1.531371, -0.9657667, 2.195251, 1, 0, 0.2980392, 1,
1.545196, -1.366778, 2.29737, 1, 0, 0.2941177, 1,
1.547165, -0.5332779, 2.363002, 1, 0, 0.2862745, 1,
1.553732, -2.336776, 1.793076, 1, 0, 0.282353, 1,
1.560589, -0.9600237, 2.203274, 1, 0, 0.2745098, 1,
1.565421, 0.01386276, 1.579212, 1, 0, 0.2705882, 1,
1.58603, 0.234825, 2.245043, 1, 0, 0.2627451, 1,
1.590378, 0.08832934, 0.6931211, 1, 0, 0.2588235, 1,
1.596262, 1.062061, 1.988217, 1, 0, 0.2509804, 1,
1.611189, -0.7891717, 2.527312, 1, 0, 0.2470588, 1,
1.632452, -1.244096, 3.074069, 1, 0, 0.2392157, 1,
1.641925, 1.861751, 1.763713, 1, 0, 0.2352941, 1,
1.643894, 0.3390024, 1.745877, 1, 0, 0.227451, 1,
1.655269, -1.525146, 2.28489, 1, 0, 0.2235294, 1,
1.663392, 0.04109409, 4.400821, 1, 0, 0.2156863, 1,
1.669708, -0.6210914, 2.679553, 1, 0, 0.2117647, 1,
1.675004, 0.4887569, 0.9678053, 1, 0, 0.2039216, 1,
1.689339, -0.07163081, 3.259526, 1, 0, 0.1960784, 1,
1.689469, 1.265939, 0.5447989, 1, 0, 0.1921569, 1,
1.692852, -1.031227, 4.383284, 1, 0, 0.1843137, 1,
1.703892, -0.2201896, 1.518622, 1, 0, 0.1803922, 1,
1.71042, 1.303815, 0.2220756, 1, 0, 0.172549, 1,
1.719503, 0.9517129, 2.791338, 1, 0, 0.1686275, 1,
1.720324, 0.7510712, -0.1078393, 1, 0, 0.1607843, 1,
1.739389, 1.203479, 2.006083, 1, 0, 0.1568628, 1,
1.750516, 1.582848, -0.1765197, 1, 0, 0.1490196, 1,
1.770529, -0.6858492, 3.726259, 1, 0, 0.145098, 1,
1.808306, -0.7568322, 0.8224949, 1, 0, 0.1372549, 1,
1.817637, 1.371493, 0.5905133, 1, 0, 0.1333333, 1,
1.857455, -0.4701318, 2.145758, 1, 0, 0.1254902, 1,
1.868101, 0.09065343, 2.744629, 1, 0, 0.1215686, 1,
1.914843, 0.6245088, 0.9863398, 1, 0, 0.1137255, 1,
1.923561, 0.1849977, 1.992125, 1, 0, 0.1098039, 1,
1.968274, -1.061182, 1.691939, 1, 0, 0.1019608, 1,
1.974215, -0.07337022, 2.537339, 1, 0, 0.09411765, 1,
2.011164, 0.381287, 1.14955, 1, 0, 0.09019608, 1,
2.020612, 0.6456896, 2.88206, 1, 0, 0.08235294, 1,
2.068862, -0.4674498, 2.412627, 1, 0, 0.07843138, 1,
2.173934, 0.1826062, 2.731123, 1, 0, 0.07058824, 1,
2.219659, 1.443185, 1.766911, 1, 0, 0.06666667, 1,
2.240352, 0.994872, 2.1401, 1, 0, 0.05882353, 1,
2.242743, 2.439393, 0.9835235, 1, 0, 0.05490196, 1,
2.269149, -2.084711, 2.186905, 1, 0, 0.04705882, 1,
2.284475, -0.1172771, 3.912815, 1, 0, 0.04313726, 1,
2.328443, -0.1366871, 3.432383, 1, 0, 0.03529412, 1,
2.401188, 0.01973537, 3.317222, 1, 0, 0.03137255, 1,
2.725338, 1.884618, 0.4953732, 1, 0, 0.02352941, 1,
2.787974, 0.1096547, 1.942457, 1, 0, 0.01960784, 1,
2.828311, -0.4323141, 1.373977, 1, 0, 0.01176471, 1,
2.914698, 0.4297606, 0.02876904, 1, 0, 0.007843138, 1
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
-0.4309219, -4.990946, -7.420101, 0, -0.5, 0.5, 0.5,
-0.4309219, -4.990946, -7.420101, 1, -0.5, 0.5, 0.5,
-0.4309219, -4.990946, -7.420101, 1, 1.5, 0.5, 0.5,
-0.4309219, -4.990946, -7.420101, 0, 1.5, 0.5, 0.5
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
-4.910707, -0.4089108, -7.420101, 0, -0.5, 0.5, 0.5,
-4.910707, -0.4089108, -7.420101, 1, -0.5, 0.5, 0.5,
-4.910707, -0.4089108, -7.420101, 1, 1.5, 0.5, 0.5,
-4.910707, -0.4089108, -7.420101, 0, 1.5, 0.5, 0.5
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
-4.910707, -4.990946, -0.30528, 0, -0.5, 0.5, 0.5,
-4.910707, -4.990946, -0.30528, 1, -0.5, 0.5, 0.5,
-4.910707, -4.990946, -0.30528, 1, 1.5, 0.5, 0.5,
-4.910707, -4.990946, -0.30528, 0, 1.5, 0.5, 0.5
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
-3, -3.933553, -5.77822,
2, -3.933553, -5.77822,
-3, -3.933553, -5.77822,
-3, -4.109785, -6.051867,
-2, -3.933553, -5.77822,
-2, -4.109785, -6.051867,
-1, -3.933553, -5.77822,
-1, -4.109785, -6.051867,
0, -3.933553, -5.77822,
0, -4.109785, -6.051867,
1, -3.933553, -5.77822,
1, -4.109785, -6.051867,
2, -3.933553, -5.77822,
2, -4.109785, -6.051867
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
-3, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
-3, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
-3, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
-3, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5,
-2, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
-2, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
-2, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
-2, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5,
-1, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
-1, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
-1, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
-1, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5,
0, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
0, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
0, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
0, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5,
1, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
1, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
1, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
1, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5,
2, -4.462249, -6.599161, 0, -0.5, 0.5, 0.5,
2, -4.462249, -6.599161, 1, -0.5, 0.5, 0.5,
2, -4.462249, -6.599161, 1, 1.5, 0.5, 0.5,
2, -4.462249, -6.599161, 0, 1.5, 0.5, 0.5
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
-3.876911, -3, -5.77822,
-3.876911, 3, -5.77822,
-3.876911, -3, -5.77822,
-4.04921, -3, -6.051867,
-3.876911, -2, -5.77822,
-4.04921, -2, -6.051867,
-3.876911, -1, -5.77822,
-4.04921, -1, -6.051867,
-3.876911, 0, -5.77822,
-4.04921, 0, -6.051867,
-3.876911, 1, -5.77822,
-4.04921, 1, -6.051867,
-3.876911, 2, -5.77822,
-4.04921, 2, -6.051867,
-3.876911, 3, -5.77822,
-4.04921, 3, -6.051867
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
-4.393809, -3, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, -3, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, -3, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, -3, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, -2, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, -2, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, -2, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, -2, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, -1, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, -1, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, -1, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, -1, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, 0, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, 0, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, 0, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, 0, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, 1, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, 1, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, 1, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, 1, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, 2, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, 2, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, 2, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, 2, -6.599161, 0, 1.5, 0.5, 0.5,
-4.393809, 3, -6.599161, 0, -0.5, 0.5, 0.5,
-4.393809, 3, -6.599161, 1, -0.5, 0.5, 0.5,
-4.393809, 3, -6.599161, 1, 1.5, 0.5, 0.5,
-4.393809, 3, -6.599161, 0, 1.5, 0.5, 0.5
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
-3.876911, -3.933553, -4,
-3.876911, -3.933553, 4,
-3.876911, -3.933553, -4,
-4.04921, -4.109785, -4,
-3.876911, -3.933553, -2,
-4.04921, -4.109785, -2,
-3.876911, -3.933553, 0,
-4.04921, -4.109785, 0,
-3.876911, -3.933553, 2,
-4.04921, -4.109785, 2,
-3.876911, -3.933553, 4,
-4.04921, -4.109785, 4
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
-4.393809, -4.462249, -4, 0, -0.5, 0.5, 0.5,
-4.393809, -4.462249, -4, 1, -0.5, 0.5, 0.5,
-4.393809, -4.462249, -4, 1, 1.5, 0.5, 0.5,
-4.393809, -4.462249, -4, 0, 1.5, 0.5, 0.5,
-4.393809, -4.462249, -2, 0, -0.5, 0.5, 0.5,
-4.393809, -4.462249, -2, 1, -0.5, 0.5, 0.5,
-4.393809, -4.462249, -2, 1, 1.5, 0.5, 0.5,
-4.393809, -4.462249, -2, 0, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 0, 0, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 0, 1, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 0, 1, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 0, 0, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 2, 0, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 2, 1, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 2, 1, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 2, 0, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 4, 0, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 4, 1, -0.5, 0.5, 0.5,
-4.393809, -4.462249, 4, 1, 1.5, 0.5, 0.5,
-4.393809, -4.462249, 4, 0, 1.5, 0.5, 0.5
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
-3.876911, -3.933553, -5.77822,
-3.876911, 3.115731, -5.77822,
-3.876911, -3.933553, 5.16766,
-3.876911, 3.115731, 5.16766,
-3.876911, -3.933553, -5.77822,
-3.876911, -3.933553, 5.16766,
-3.876911, 3.115731, -5.77822,
-3.876911, 3.115731, 5.16766,
-3.876911, -3.933553, -5.77822,
3.015067, -3.933553, -5.77822,
-3.876911, -3.933553, 5.16766,
3.015067, -3.933553, 5.16766,
-3.876911, 3.115731, -5.77822,
3.015067, 3.115731, -5.77822,
-3.876911, 3.115731, 5.16766,
3.015067, 3.115731, 5.16766,
3.015067, -3.933553, -5.77822,
3.015067, 3.115731, -5.77822,
3.015067, -3.933553, 5.16766,
3.015067, 3.115731, 5.16766,
3.015067, -3.933553, -5.77822,
3.015067, -3.933553, 5.16766,
3.015067, 3.115731, -5.77822,
3.015067, 3.115731, 5.16766
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
var radius = 7.866098;
var distance = 34.99716;
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
mvMatrix.translate( 0.4309219, 0.4089108, 0.30528 );
mvMatrix.scale( 1.23404, 1.206503, 0.7770029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99716);
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
tau-fluvalinate<-read.table("tau-fluvalinate.xyz")
```

```
## Error in read.table("tau-fluvalinate.xyz"): no lines available in input
```

```r
x<-tau-fluvalinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
```

```r
y<-tau-fluvalinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
```

```r
z<-tau-fluvalinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
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
-3.776542, -0.03624629, 0.4785933, 0, 0, 1, 1, 1,
-3.052519, -0.1019132, -1.455181, 1, 0, 0, 1, 1,
-3.039391, 0.1551838, -1.877642, 1, 0, 0, 1, 1,
-3.033964, 1.691125, 0.4404202, 1, 0, 0, 1, 1,
-2.827025, 0.01678293, -1.203629, 1, 0, 0, 1, 1,
-2.553262, -0.1277068, -1.468204, 1, 0, 0, 1, 1,
-2.536658, -0.402201, -2.782193, 0, 0, 0, 1, 1,
-2.426084, 1.771883, 0.2758596, 0, 0, 0, 1, 1,
-2.37889, -0.09748577, -2.350314, 0, 0, 0, 1, 1,
-2.272764, 0.6621709, -2.612131, 0, 0, 0, 1, 1,
-2.260948, -0.9016056, -2.063538, 0, 0, 0, 1, 1,
-2.202106, 1.560254, -0.4110916, 0, 0, 0, 1, 1,
-2.181944, 1.857622, -1.288389, 0, 0, 0, 1, 1,
-2.164185, 0.08967725, -3.397523, 1, 1, 1, 1, 1,
-2.164182, 1.43324, -1.331425, 1, 1, 1, 1, 1,
-2.131407, 0.7522545, -1.394528, 1, 1, 1, 1, 1,
-2.111294, -0.7484589, -0.05739729, 1, 1, 1, 1, 1,
-2.09463, 1.001714, -0.2894745, 1, 1, 1, 1, 1,
-2.077343, -0.326981, -1.28739, 1, 1, 1, 1, 1,
-2.074583, -1.256035, -2.039291, 1, 1, 1, 1, 1,
-2.051364, -0.02302713, -0.4877795, 1, 1, 1, 1, 1,
-2.033198, 0.9680387, -0.5366505, 1, 1, 1, 1, 1,
-2.00952, -0.1905398, -2.433588, 1, 1, 1, 1, 1,
-1.98267, -2.670454, -2.251663, 1, 1, 1, 1, 1,
-1.960834, -0.8100251, -2.303874, 1, 1, 1, 1, 1,
-1.949505, -0.4019144, -0.5595915, 1, 1, 1, 1, 1,
-1.938058, 1.068555, -1.488677, 1, 1, 1, 1, 1,
-1.918839, 0.3451776, 0.2705046, 1, 1, 1, 1, 1,
-1.913218, 1.14278, -3.176663, 0, 0, 1, 1, 1,
-1.913185, 0.07717106, -0.9279764, 1, 0, 0, 1, 1,
-1.864649, -0.8357281, -2.902266, 1, 0, 0, 1, 1,
-1.859807, -1.308542, -1.80471, 1, 0, 0, 1, 1,
-1.844777, 0.9909928, -1.296412, 1, 0, 0, 1, 1,
-1.843922, -1.316194, -1.374191, 1, 0, 0, 1, 1,
-1.834036, 0.9083069, -1.549926, 0, 0, 0, 1, 1,
-1.830282, -0.8285282, -2.490068, 0, 0, 0, 1, 1,
-1.825383, 2.638668, 1.035458, 0, 0, 0, 1, 1,
-1.80955, -1.593915, -3.28186, 0, 0, 0, 1, 1,
-1.79219, 1.061389, 0.5342611, 0, 0, 0, 1, 1,
-1.79148, 0.4920651, -1.816512, 0, 0, 0, 1, 1,
-1.719836, -1.91246, -1.902483, 0, 0, 0, 1, 1,
-1.712894, 0.2705772, 0.2652281, 1, 1, 1, 1, 1,
-1.712197, 0.5341223, -2.446892, 1, 1, 1, 1, 1,
-1.705489, -0.7389156, -1.884677, 1, 1, 1, 1, 1,
-1.702991, 1.81993, 0.0145317, 1, 1, 1, 1, 1,
-1.699835, -1.933889, -1.527072, 1, 1, 1, 1, 1,
-1.694481, -1.072747, -2.377075, 1, 1, 1, 1, 1,
-1.675036, -0.9716074, -3.102598, 1, 1, 1, 1, 1,
-1.656316, 0.01743113, 0.3003758, 1, 1, 1, 1, 1,
-1.621199, -0.2612574, 0.2488065, 1, 1, 1, 1, 1,
-1.613469, 0.8210552, -2.923262, 1, 1, 1, 1, 1,
-1.609289, 0.709682, -3.919019, 1, 1, 1, 1, 1,
-1.605595, -0.4582355, -1.721553, 1, 1, 1, 1, 1,
-1.592361, -1.194136, -3.83148, 1, 1, 1, 1, 1,
-1.586511, -3.830894, -2.728118, 1, 1, 1, 1, 1,
-1.584169, -0.4923445, -0.8753836, 1, 1, 1, 1, 1,
-1.583187, 0.6835001, -1.116868, 0, 0, 1, 1, 1,
-1.574098, -0.7269353, -0.7527609, 1, 0, 0, 1, 1,
-1.573972, 0.286519, -1.716422, 1, 0, 0, 1, 1,
-1.564047, -0.4169955, -1.597983, 1, 0, 0, 1, 1,
-1.548923, -0.1664737, -0.06360516, 1, 0, 0, 1, 1,
-1.546241, 1.17186, 1.192343, 1, 0, 0, 1, 1,
-1.532552, 1.272396, -1.50083, 0, 0, 0, 1, 1,
-1.53116, 0.672218, -2.374145, 0, 0, 0, 1, 1,
-1.527612, 0.8093151, 0.4176423, 0, 0, 0, 1, 1,
-1.509224, -0.8768857, -0.9541511, 0, 0, 0, 1, 1,
-1.497365, -0.2561561, -1.492721, 0, 0, 0, 1, 1,
-1.495774, -0.9429421, -1.999503, 0, 0, 0, 1, 1,
-1.478402, 0.9528385, -1.621389, 0, 0, 0, 1, 1,
-1.474081, -0.8499696, -2.946859, 1, 1, 1, 1, 1,
-1.474041, 0.9658404, -2.646635, 1, 1, 1, 1, 1,
-1.469212, 0.8071206, -2.080879, 1, 1, 1, 1, 1,
-1.462677, -0.7234849, -0.9253284, 1, 1, 1, 1, 1,
-1.460644, -0.7975876, -2.098435, 1, 1, 1, 1, 1,
-1.453498, -0.05477528, -2.366595, 1, 1, 1, 1, 1,
-1.440531, -0.04957933, -0.2024027, 1, 1, 1, 1, 1,
-1.438078, 0.008510226, -1.793324, 1, 1, 1, 1, 1,
-1.437071, -1.069272, -3.469805, 1, 1, 1, 1, 1,
-1.433271, -0.475262, -1.44027, 1, 1, 1, 1, 1,
-1.426388, 1.369603, 0.4217389, 1, 1, 1, 1, 1,
-1.394545, 1.244533, -1.116826, 1, 1, 1, 1, 1,
-1.379769, -0.7201442, -1.718436, 1, 1, 1, 1, 1,
-1.366416, -1.359631, -1.918683, 1, 1, 1, 1, 1,
-1.365487, 1.196959, -1.43539, 1, 1, 1, 1, 1,
-1.363049, 0.07892205, -1.56477, 0, 0, 1, 1, 1,
-1.360011, 0.8453785, -0.2675167, 1, 0, 0, 1, 1,
-1.355218, 1.437786, -2.01121, 1, 0, 0, 1, 1,
-1.352349, -2.199375, -3.504978, 1, 0, 0, 1, 1,
-1.342577, -1.05451, -2.012705, 1, 0, 0, 1, 1,
-1.339301, -2.475647, -3.480626, 1, 0, 0, 1, 1,
-1.325644, 0.8782153, -0.4727117, 0, 0, 0, 1, 1,
-1.322104, 1.232436, -0.9957542, 0, 0, 0, 1, 1,
-1.320938, -0.4859477, -4.185134, 0, 0, 0, 1, 1,
-1.320002, -0.5965844, -2.413932, 0, 0, 0, 1, 1,
-1.313895, 0.8310983, -0.2365017, 0, 0, 0, 1, 1,
-1.290975, -0.1413635, -1.351385, 0, 0, 0, 1, 1,
-1.288169, -0.001832055, -1.627296, 0, 0, 0, 1, 1,
-1.280223, -1.395802, -3.359861, 1, 1, 1, 1, 1,
-1.2713, -0.6707407, -1.473344, 1, 1, 1, 1, 1,
-1.264296, -0.2674396, -1.542314, 1, 1, 1, 1, 1,
-1.262915, -0.5867948, -2.836838, 1, 1, 1, 1, 1,
-1.260223, -1.707159, -3.3331, 1, 1, 1, 1, 1,
-1.246435, -1.171215, -2.943937, 1, 1, 1, 1, 1,
-1.244606, -0.1905166, -2.525249, 1, 1, 1, 1, 1,
-1.243725, 0.06423384, -0.2963006, 1, 1, 1, 1, 1,
-1.23981, -0.3729961, -0.4174334, 1, 1, 1, 1, 1,
-1.234228, -0.3586, -1.600852, 1, 1, 1, 1, 1,
-1.232734, 0.6786808, -0.5069083, 1, 1, 1, 1, 1,
-1.227197, 0.6945795, 1.219326, 1, 1, 1, 1, 1,
-1.226523, -0.4046989, -1.689987, 1, 1, 1, 1, 1,
-1.223863, -1.510579, -2.708159, 1, 1, 1, 1, 1,
-1.223393, -2.492961, -2.736703, 1, 1, 1, 1, 1,
-1.223005, -0.2509146, -1.521354, 0, 0, 1, 1, 1,
-1.21912, -1.007789, -1.493156, 1, 0, 0, 1, 1,
-1.218094, 1.515363, -0.9374577, 1, 0, 0, 1, 1,
-1.212857, 0.8898576, -0.3963282, 1, 0, 0, 1, 1,
-1.211999, -0.03832128, -3.105857, 1, 0, 0, 1, 1,
-1.207563, 0.1903678, -2.403735, 1, 0, 0, 1, 1,
-1.204919, -0.4476335, -1.311808, 0, 0, 0, 1, 1,
-1.201515, -0.01051391, -1.682558, 0, 0, 0, 1, 1,
-1.193091, 1.514038, 0.5137402, 0, 0, 0, 1, 1,
-1.187635, -0.005209976, -2.982534, 0, 0, 0, 1, 1,
-1.183388, -0.05440051, -0.2274973, 0, 0, 0, 1, 1,
-1.182327, 0.9010578, -0.4736632, 0, 0, 0, 1, 1,
-1.181773, -1.818053, -0.7789267, 0, 0, 0, 1, 1,
-1.179245, -1.30881, -1.872863, 1, 1, 1, 1, 1,
-1.174314, -1.125405, -2.290928, 1, 1, 1, 1, 1,
-1.172113, -0.9915166, -1.947397, 1, 1, 1, 1, 1,
-1.167335, -0.6713318, -1.307903, 1, 1, 1, 1, 1,
-1.165333, 0.4229855, -0.04710449, 1, 1, 1, 1, 1,
-1.160281, 1.056265, 0.5095774, 1, 1, 1, 1, 1,
-1.156252, 2.399057, -0.7858356, 1, 1, 1, 1, 1,
-1.152869, 0.7688462, -1.811672, 1, 1, 1, 1, 1,
-1.150993, -1.527739, -1.408954, 1, 1, 1, 1, 1,
-1.148437, 0.3825266, -0.9845217, 1, 1, 1, 1, 1,
-1.140783, 0.8252908, -0.6459372, 1, 1, 1, 1, 1,
-1.125647, -0.7501186, -3.109561, 1, 1, 1, 1, 1,
-1.125198, 0.1098551, -2.271479, 1, 1, 1, 1, 1,
-1.125156, 0.4738853, -0.1622804, 1, 1, 1, 1, 1,
-1.119802, -0.4545433, -2.202923, 1, 1, 1, 1, 1,
-1.117682, 0.4639515, -1.373514, 0, 0, 1, 1, 1,
-1.115067, -1.618641, -3.039029, 1, 0, 0, 1, 1,
-1.113449, -0.9903522, -1.507896, 1, 0, 0, 1, 1,
-1.111527, -0.4154138, -2.193837, 1, 0, 0, 1, 1,
-1.111418, 2.482698, -1.017634, 1, 0, 0, 1, 1,
-1.106863, 0.2345065, -2.055467, 1, 0, 0, 1, 1,
-1.104983, -0.07464842, -2.900704, 0, 0, 0, 1, 1,
-1.102612, -0.3457472, -3.119019, 0, 0, 0, 1, 1,
-1.082475, -0.2224469, -1.763121, 0, 0, 0, 1, 1,
-1.080759, 0.09437291, -1.067703, 0, 0, 0, 1, 1,
-1.075101, 0.6124305, -2.130341, 0, 0, 0, 1, 1,
-1.06607, -0.1215074, -2.580837, 0, 0, 0, 1, 1,
-1.063662, -0.07674646, -2.086335, 0, 0, 0, 1, 1,
-1.063042, -0.7166012, -3.877014, 1, 1, 1, 1, 1,
-1.056068, -0.006516098, -1.034593, 1, 1, 1, 1, 1,
-1.056014, 1.386988, 0.4488744, 1, 1, 1, 1, 1,
-1.0559, -1.785941, -2.678623, 1, 1, 1, 1, 1,
-1.050389, -2.054736, -4.299377, 1, 1, 1, 1, 1,
-1.038141, -0.4057194, -3.305784, 1, 1, 1, 1, 1,
-1.036729, -0.6182265, -2.342121, 1, 1, 1, 1, 1,
-1.034435, -0.6362149, -2.504434, 1, 1, 1, 1, 1,
-1.032526, -0.7545416, -2.373184, 1, 1, 1, 1, 1,
-1.032046, 0.03797202, -1.365111, 1, 1, 1, 1, 1,
-1.028072, -0.4531987, -3.3082, 1, 1, 1, 1, 1,
-1.027039, -0.4139439, -2.349298, 1, 1, 1, 1, 1,
-1.020878, -0.4217849, -3.129217, 1, 1, 1, 1, 1,
-1.011741, -2.154554, -3.392717, 1, 1, 1, 1, 1,
-0.9979356, 0.09073894, -2.350459, 1, 1, 1, 1, 1,
-0.9916686, 0.6956482, -1.685575, 0, 0, 1, 1, 1,
-0.9891132, -1.447333, -3.736533, 1, 0, 0, 1, 1,
-0.9868325, -1.427186, -1.563762, 1, 0, 0, 1, 1,
-0.9829742, -0.7161364, -2.412401, 1, 0, 0, 1, 1,
-0.9779973, -1.647662, -0.8450684, 1, 0, 0, 1, 1,
-0.9724867, 0.3942155, -0.6076811, 1, 0, 0, 1, 1,
-0.9717399, -2.135959, -1.582365, 0, 0, 0, 1, 1,
-0.968556, -0.2322272, -2.710146, 0, 0, 0, 1, 1,
-0.9647988, -1.586011, -0.6238225, 0, 0, 0, 1, 1,
-0.9640955, -0.5283316, -2.636143, 0, 0, 0, 1, 1,
-0.9634238, 0.005387674, -1.611567, 0, 0, 0, 1, 1,
-0.961876, 2.435775, 1.033115, 0, 0, 0, 1, 1,
-0.9553561, 0.1153717, -2.108182, 0, 0, 0, 1, 1,
-0.9506922, 0.2097109, -2.636338, 1, 1, 1, 1, 1,
-0.9505643, 2.54999, 0.326223, 1, 1, 1, 1, 1,
-0.9453499, 1.067765, -2.410574, 1, 1, 1, 1, 1,
-0.9442666, 0.3700626, -1.961294, 1, 1, 1, 1, 1,
-0.9393255, 0.9130771, -1.058299, 1, 1, 1, 1, 1,
-0.9367638, 2.127337, 0.1809708, 1, 1, 1, 1, 1,
-0.9360072, -0.2167467, 0.003482817, 1, 1, 1, 1, 1,
-0.9334544, -0.1277604, -1.548896, 1, 1, 1, 1, 1,
-0.9302701, -2.20837, -1.943645, 1, 1, 1, 1, 1,
-0.9223478, 0.321349, -0.8083963, 1, 1, 1, 1, 1,
-0.9182324, 1.265588, -0.338249, 1, 1, 1, 1, 1,
-0.9172024, -0.06543634, -2.73108, 1, 1, 1, 1, 1,
-0.916364, 0.8096687, 0.7464424, 1, 1, 1, 1, 1,
-0.9140249, -0.1503312, 0.7824567, 1, 1, 1, 1, 1,
-0.9109436, -0.3172126, -0.9277025, 1, 1, 1, 1, 1,
-0.9030431, 1.420201, 0.5289766, 0, 0, 1, 1, 1,
-0.8980387, 0.2470333, 0.198876, 1, 0, 0, 1, 1,
-0.8921202, -1.321828, -3.038017, 1, 0, 0, 1, 1,
-0.8884335, -0.5050858, -2.08477, 1, 0, 0, 1, 1,
-0.8873063, 0.4228406, -1.227386, 1, 0, 0, 1, 1,
-0.8815268, 1.103979, -2.049725, 1, 0, 0, 1, 1,
-0.8808196, 0.2143407, -1.949574, 0, 0, 0, 1, 1,
-0.8719193, 1.058403, 1.732415, 0, 0, 0, 1, 1,
-0.8715739, -1.966472, -3.227808, 0, 0, 0, 1, 1,
-0.860715, 1.042648, -0.8191045, 0, 0, 0, 1, 1,
-0.8590528, -0.1711718, -1.788884, 0, 0, 0, 1, 1,
-0.8540464, -3.321433, -3.254847, 0, 0, 0, 1, 1,
-0.8510082, 0.2259112, -1.909548, 0, 0, 0, 1, 1,
-0.8482605, -0.4787061, -2.705514, 1, 1, 1, 1, 1,
-0.8425347, 1.474447, 0.2905371, 1, 1, 1, 1, 1,
-0.8392687, 1.211153, 0.3698148, 1, 1, 1, 1, 1,
-0.8387963, 1.391634, -1.748025, 1, 1, 1, 1, 1,
-0.8372586, -0.2001399, -1.078883, 1, 1, 1, 1, 1,
-0.8317456, -0.09938052, -2.494448, 1, 1, 1, 1, 1,
-0.8314965, -0.7163938, -1.219629, 1, 1, 1, 1, 1,
-0.8257883, 0.552688, -0.5984037, 1, 1, 1, 1, 1,
-0.8248108, -1.695234, -2.197786, 1, 1, 1, 1, 1,
-0.8228851, 0.4684792, -2.064009, 1, 1, 1, 1, 1,
-0.8219107, -1.192946, -3.318484, 1, 1, 1, 1, 1,
-0.8200567, -0.9211587, -1.907828, 1, 1, 1, 1, 1,
-0.8172377, -0.2038134, -3.202975, 1, 1, 1, 1, 1,
-0.8138357, -1.285434, -2.174293, 1, 1, 1, 1, 1,
-0.8127285, 0.9464196, -0.3598522, 1, 1, 1, 1, 1,
-0.8069239, 1.484327, 0.9692926, 0, 0, 1, 1, 1,
-0.8066438, -0.5102137, -0.2507006, 1, 0, 0, 1, 1,
-0.7902879, 0.8707513, -0.5231307, 1, 0, 0, 1, 1,
-0.7883516, 0.1080362, -1.812502, 1, 0, 0, 1, 1,
-0.7849349, 0.6667374, -0.3018602, 1, 0, 0, 1, 1,
-0.7847046, -0.2829209, -1.058023, 1, 0, 0, 1, 1,
-0.7818347, 0.8302563, -1.266758, 0, 0, 0, 1, 1,
-0.7811722, -0.3981434, -1.577507, 0, 0, 0, 1, 1,
-0.7807377, 0.1321521, -2.331594, 0, 0, 0, 1, 1,
-0.768038, 0.03470353, 0.3712397, 0, 0, 0, 1, 1,
-0.7640229, 2.030702, -1.929428, 0, 0, 0, 1, 1,
-0.7525288, -1.710241, -3.164906, 0, 0, 0, 1, 1,
-0.7476802, 0.7557956, -1.246154, 0, 0, 0, 1, 1,
-0.7453036, 0.8571794, -1.509856, 1, 1, 1, 1, 1,
-0.7381786, -0.9953809, -4.877886, 1, 1, 1, 1, 1,
-0.7372886, 1.02165, -0.1331638, 1, 1, 1, 1, 1,
-0.7362975, -1.655088, -2.18513, 1, 1, 1, 1, 1,
-0.731937, -1.9491, -2.447912, 1, 1, 1, 1, 1,
-0.7316864, -0.4328394, -0.7885095, 1, 1, 1, 1, 1,
-0.731153, -0.1795707, -0.6010707, 1, 1, 1, 1, 1,
-0.728947, 1.462524, 2.131134, 1, 1, 1, 1, 1,
-0.7279243, 0.1768186, -1.497337, 1, 1, 1, 1, 1,
-0.7273096, -2.012026, -1.723089, 1, 1, 1, 1, 1,
-0.7264448, 1.190689, -0.701567, 1, 1, 1, 1, 1,
-0.7260417, 1.20904, 0.6893713, 1, 1, 1, 1, 1,
-0.7221746, -0.1564776, -1.689851, 1, 1, 1, 1, 1,
-0.716124, -0.03735763, -0.8516306, 1, 1, 1, 1, 1,
-0.7127435, -0.1931417, -2.383132, 1, 1, 1, 1, 1,
-0.7103378, -0.1062472, -0.3185383, 0, 0, 1, 1, 1,
-0.7100279, 0.1406569, -0.1863901, 1, 0, 0, 1, 1,
-0.7066442, -0.6854995, -2.705389, 1, 0, 0, 1, 1,
-0.7060514, 0.2987426, 2.248985, 1, 0, 0, 1, 1,
-0.7050455, 0.4125584, -0.8588536, 1, 0, 0, 1, 1,
-0.7008773, -0.6313555, -1.18042, 1, 0, 0, 1, 1,
-0.7004275, 0.201575, -0.278297, 0, 0, 0, 1, 1,
-0.693715, -0.8548303, -2.814188, 0, 0, 0, 1, 1,
-0.6923669, -0.6034639, -2.972012, 0, 0, 0, 1, 1,
-0.692215, 0.857807, -2.338454, 0, 0, 0, 1, 1,
-0.6907371, 0.8532299, -2.174553, 0, 0, 0, 1, 1,
-0.6874587, 1.178961, -0.6153805, 0, 0, 0, 1, 1,
-0.6852885, 0.112061, -2.016082, 0, 0, 0, 1, 1,
-0.6842275, 1.220721, 0.521365, 1, 1, 1, 1, 1,
-0.6728712, -0.7272416, -2.043702, 1, 1, 1, 1, 1,
-0.6666332, 0.8020829, -0.5450004, 1, 1, 1, 1, 1,
-0.6642882, 2.040127, -1.380985, 1, 1, 1, 1, 1,
-0.6637886, 0.77285, 0.6343147, 1, 1, 1, 1, 1,
-0.6577179, 0.7500926, -1.137255, 1, 1, 1, 1, 1,
-0.6548086, 0.1109181, -2.699787, 1, 1, 1, 1, 1,
-0.6505025, 0.3807596, -1.167116, 1, 1, 1, 1, 1,
-0.6505004, 2.363925, -0.6371584, 1, 1, 1, 1, 1,
-0.6488872, -1.325087, -1.786421, 1, 1, 1, 1, 1,
-0.648654, 1.414511, -1.825187, 1, 1, 1, 1, 1,
-0.6457115, -0.578584, -3.303668, 1, 1, 1, 1, 1,
-0.6452941, -0.5238826, -3.332847, 1, 1, 1, 1, 1,
-0.6399958, -0.6261572, -1.288415, 1, 1, 1, 1, 1,
-0.6371862, -0.595184, -1.910301, 1, 1, 1, 1, 1,
-0.636955, -0.2162676, -2.705534, 0, 0, 1, 1, 1,
-0.6348065, -0.8901405, -2.177368, 1, 0, 0, 1, 1,
-0.6299255, -0.428088, -4.530361, 1, 0, 0, 1, 1,
-0.6286051, 0.5701303, -0.4590479, 1, 0, 0, 1, 1,
-0.6242543, -0.1993106, -0.478255, 1, 0, 0, 1, 1,
-0.6210595, -1.197373, -1.748, 1, 0, 0, 1, 1,
-0.6210189, -0.08836491, -2.211905, 0, 0, 0, 1, 1,
-0.6188556, -0.1567904, -2.917602, 0, 0, 0, 1, 1,
-0.6187235, -1.530536, -3.85388, 0, 0, 0, 1, 1,
-0.6111327, 1.061062, 0.82436, 0, 0, 0, 1, 1,
-0.6094953, -0.8977184, -2.352084, 0, 0, 0, 1, 1,
-0.6083345, 1.704471, -1.242805, 0, 0, 0, 1, 1,
-0.6066394, -1.308868, -2.649863, 0, 0, 0, 1, 1,
-0.6060672, -0.9095824, -4.093528, 1, 1, 1, 1, 1,
-0.6035506, 0.2393802, -1.406088, 1, 1, 1, 1, 1,
-0.5973653, -1.129978, -2.31172, 1, 1, 1, 1, 1,
-0.5959065, -0.05846402, -0.9738065, 1, 1, 1, 1, 1,
-0.5930586, 1.853202, -2.852718, 1, 1, 1, 1, 1,
-0.5918815, -1.514448, -3.012053, 1, 1, 1, 1, 1,
-0.5906892, -0.6358417, -2.375466, 1, 1, 1, 1, 1,
-0.5826623, -0.1005826, -0.5107483, 1, 1, 1, 1, 1,
-0.5726701, -1.861074, -4.147272, 1, 1, 1, 1, 1,
-0.570797, -0.6095638, -2.279864, 1, 1, 1, 1, 1,
-0.5700183, -0.4941895, -1.761087, 1, 1, 1, 1, 1,
-0.5682582, -0.469726, 0.01424545, 1, 1, 1, 1, 1,
-0.5634249, 0.7892491, -3.294178, 1, 1, 1, 1, 1,
-0.562462, -0.2330115, -2.207045, 1, 1, 1, 1, 1,
-0.5606393, 1.302981, -2.350502, 1, 1, 1, 1, 1,
-0.5588757, 0.3265582, -1.168017, 0, 0, 1, 1, 1,
-0.5582946, 0.9274828, 6.031657e-05, 1, 0, 0, 1, 1,
-0.5469294, -0.9545233, -2.844272, 1, 0, 0, 1, 1,
-0.5463569, -1.304781, -4.29816, 1, 0, 0, 1, 1,
-0.5455623, 0.8976754, 0.07389491, 1, 0, 0, 1, 1,
-0.5404984, 0.6854647, -1.674115, 1, 0, 0, 1, 1,
-0.5392148, 0.3691785, -0.9809211, 0, 0, 0, 1, 1,
-0.5356228, -0.233832, -2.344836, 0, 0, 0, 1, 1,
-0.5347347, 0.01365093, -2.212305, 0, 0, 0, 1, 1,
-0.5336097, 0.06834006, -0.6945723, 0, 0, 0, 1, 1,
-0.5329562, 0.5640785, 0.3538876, 0, 0, 0, 1, 1,
-0.5265255, -1.280408, -3.027677, 0, 0, 0, 1, 1,
-0.5192729, -0.2108745, -1.60696, 0, 0, 0, 1, 1,
-0.5185401, 0.3286036, -0.5179146, 1, 1, 1, 1, 1,
-0.5179285, -0.1102068, -1.488875, 1, 1, 1, 1, 1,
-0.5174667, -0.4487374, -3.455164, 1, 1, 1, 1, 1,
-0.5162628, -0.4704263, -2.434718, 1, 1, 1, 1, 1,
-0.5135804, -0.06267487, -1.580206, 1, 1, 1, 1, 1,
-0.5120112, 1.269793, -0.1335414, 1, 1, 1, 1, 1,
-0.5073864, 0.2340439, -0.401545, 1, 1, 1, 1, 1,
-0.5049845, -1.704952, -4.239131, 1, 1, 1, 1, 1,
-0.5032892, 0.2156583, -1.346809, 1, 1, 1, 1, 1,
-0.4988333, 0.7345412, -1.13492, 1, 1, 1, 1, 1,
-0.4971097, -0.02516377, -1.206474, 1, 1, 1, 1, 1,
-0.4946841, -1.258728, -4.098599, 1, 1, 1, 1, 1,
-0.4931424, 0.3621894, 0.1663133, 1, 1, 1, 1, 1,
-0.490482, -0.6788388, -2.331329, 1, 1, 1, 1, 1,
-0.490113, 0.9041916, -1.382308, 1, 1, 1, 1, 1,
-0.4875662, -0.429885, -2.22433, 0, 0, 1, 1, 1,
-0.4871615, -0.8335971, -0.1605883, 1, 0, 0, 1, 1,
-0.4837794, -0.6504757, -1.914057, 1, 0, 0, 1, 1,
-0.4764675, -0.02595619, -1.493944, 1, 0, 0, 1, 1,
-0.4752009, -0.1624599, -1.495335, 1, 0, 0, 1, 1,
-0.4708922, -0.4745237, -2.690002, 1, 0, 0, 1, 1,
-0.4700027, -0.805068, -2.836635, 0, 0, 0, 1, 1,
-0.4672677, 0.2909629, -1.171862, 0, 0, 0, 1, 1,
-0.4616472, -0.2044139, -2.497509, 0, 0, 0, 1, 1,
-0.4599479, 0.03120944, -2.651628, 0, 0, 0, 1, 1,
-0.4598953, 2.894452, 0.7116389, 0, 0, 0, 1, 1,
-0.4595015, 3.013072, 0.1871354, 0, 0, 0, 1, 1,
-0.4575733, -0.3900467, -4.878457, 0, 0, 0, 1, 1,
-0.4573262, -0.08321796, -3.042348, 1, 1, 1, 1, 1,
-0.4572486, -0.9799061, -1.77511, 1, 1, 1, 1, 1,
-0.4570925, 0.3463098, -2.522577, 1, 1, 1, 1, 1,
-0.4534453, 2.025523, -0.4475374, 1, 1, 1, 1, 1,
-0.452395, -0.148741, -0.516036, 1, 1, 1, 1, 1,
-0.4500989, 0.6006805, 0.2155015, 1, 1, 1, 1, 1,
-0.4398938, 0.6991137, -0.4139619, 1, 1, 1, 1, 1,
-0.4384696, -0.3639618, -3.616997, 1, 1, 1, 1, 1,
-0.4321541, 0.2051752, -3.454978, 1, 1, 1, 1, 1,
-0.4273292, 0.8193579, -0.9815969, 1, 1, 1, 1, 1,
-0.4261097, 0.4102016, -0.7314529, 1, 1, 1, 1, 1,
-0.425067, -0.5657077, -3.512481, 1, 1, 1, 1, 1,
-0.4058437, 0.1953461, -0.7279013, 1, 1, 1, 1, 1,
-0.401272, 1.323422, -0.6291855, 1, 1, 1, 1, 1,
-0.3948029, 2.209791, 1.311276, 1, 1, 1, 1, 1,
-0.3929038, -1.731447, -5.331161, 0, 0, 1, 1, 1,
-0.3920696, -0.9590734, -1.466916, 1, 0, 0, 1, 1,
-0.3884356, -0.4925845, -1.863001, 1, 0, 0, 1, 1,
-0.3874535, -0.6875771, -4.983758, 1, 0, 0, 1, 1,
-0.3757453, 1.926054, -0.7196256, 1, 0, 0, 1, 1,
-0.3653499, -0.7488209, -1.711527, 1, 0, 0, 1, 1,
-0.3651348, 0.7621167, -0.1782182, 0, 0, 0, 1, 1,
-0.3618495, -0.4173182, -1.893806, 0, 0, 0, 1, 1,
-0.3597496, 0.07364421, -0.8101619, 0, 0, 0, 1, 1,
-0.3491402, 1.518622, 0.6837673, 0, 0, 0, 1, 1,
-0.3479877, -0.649289, -1.250138, 0, 0, 0, 1, 1,
-0.3437016, 0.6673414, -0.8026179, 0, 0, 0, 1, 1,
-0.3422208, 0.07575811, -2.246982, 0, 0, 0, 1, 1,
-0.3373425, -0.2476547, -1.142267, 1, 1, 1, 1, 1,
-0.3365436, 0.5523644, -0.7095534, 1, 1, 1, 1, 1,
-0.3362441, -0.4737783, -1.637856, 1, 1, 1, 1, 1,
-0.3345612, 0.2255634, -0.05584414, 1, 1, 1, 1, 1,
-0.3323884, 0.3540841, -1.323987, 1, 1, 1, 1, 1,
-0.3322355, 1.895827, 0.2148851, 1, 1, 1, 1, 1,
-0.3303869, -1.91436, -1.780212, 1, 1, 1, 1, 1,
-0.3277471, 0.1943486, -0.3876263, 1, 1, 1, 1, 1,
-0.3272202, -1.142822, -2.59846, 1, 1, 1, 1, 1,
-0.3238062, 1.307763, 0.03013907, 1, 1, 1, 1, 1,
-0.3196115, -0.6723859, -0.04876209, 1, 1, 1, 1, 1,
-0.3187989, -0.9054748, -1.018008, 1, 1, 1, 1, 1,
-0.3172283, 0.9906559, -2.334103, 1, 1, 1, 1, 1,
-0.3139103, -1.350079, -4.469172, 1, 1, 1, 1, 1,
-0.3109598, 0.4875455, -0.01346399, 1, 1, 1, 1, 1,
-0.3094358, 1.082239, -1.468873, 0, 0, 1, 1, 1,
-0.3078892, 0.1104806, -2.339714, 1, 0, 0, 1, 1,
-0.3047034, -1.485959, -4.404535, 1, 0, 0, 1, 1,
-0.304464, -1.322702, -1.056789, 1, 0, 0, 1, 1,
-0.3023166, 0.6330461, 0.6539609, 1, 0, 0, 1, 1,
-0.3018683, 0.4915936, 1.225352, 1, 0, 0, 1, 1,
-0.2964383, -1.155004, -1.25212, 0, 0, 0, 1, 1,
-0.2853047, 0.2775814, -0.4516923, 0, 0, 0, 1, 1,
-0.2789374, 1.519056, -0.6933869, 0, 0, 0, 1, 1,
-0.2785549, 0.9341828, 0.3940497, 0, 0, 0, 1, 1,
-0.2775071, 0.8771181, 0.7026521, 0, 0, 0, 1, 1,
-0.2774724, 0.8562639, -0.7599258, 0, 0, 0, 1, 1,
-0.2761164, 0.1221064, -0.6365162, 0, 0, 0, 1, 1,
-0.274526, -0.7771475, -2.837109, 1, 1, 1, 1, 1,
-0.2724014, -0.1377431, -1.156113, 1, 1, 1, 1, 1,
-0.2718787, -0.5395862, -1.846029, 1, 1, 1, 1, 1,
-0.2692613, 1.960808, 1.298516, 1, 1, 1, 1, 1,
-0.2647758, -2.011689, -4.313268, 1, 1, 1, 1, 1,
-0.2627172, 0.7577949, -2.001926, 1, 1, 1, 1, 1,
-0.2593583, -0.2889273, -3.405264, 1, 1, 1, 1, 1,
-0.2528517, 0.06983088, -0.4290405, 1, 1, 1, 1, 1,
-0.2516803, 0.3909691, -1.188505, 1, 1, 1, 1, 1,
-0.2508786, 0.08234275, -2.851111, 1, 1, 1, 1, 1,
-0.2503829, -0.6992023, -3.580246, 1, 1, 1, 1, 1,
-0.2492957, 1.338188, -1.792901, 1, 1, 1, 1, 1,
-0.2476432, -0.334642, -3.786589, 1, 1, 1, 1, 1,
-0.2457973, -1.014056, -4.926423, 1, 1, 1, 1, 1,
-0.2443645, -0.4782087, -2.464517, 1, 1, 1, 1, 1,
-0.2435222, 0.2186236, 0.1318515, 0, 0, 1, 1, 1,
-0.2420888, 1.835967, -0.3152551, 1, 0, 0, 1, 1,
-0.2394594, -0.104501, -4.314428, 1, 0, 0, 1, 1,
-0.2393167, 0.7641063, -0.5439857, 1, 0, 0, 1, 1,
-0.2300819, 0.008521823, 0.2773923, 1, 0, 0, 1, 1,
-0.2289606, 0.6425753, 0.2696632, 1, 0, 0, 1, 1,
-0.2273238, 1.311918, -1.319424, 0, 0, 0, 1, 1,
-0.2272553, -0.4636693, -2.833308, 0, 0, 0, 1, 1,
-0.2262449, 0.75281, 0.3127084, 0, 0, 0, 1, 1,
-0.2225376, -0.3616565, -2.353338, 0, 0, 0, 1, 1,
-0.2213925, 2.596341, 0.1067758, 0, 0, 0, 1, 1,
-0.2114616, 0.8643906, 0.6374029, 0, 0, 0, 1, 1,
-0.2088737, 1.530994, 1.132081, 0, 0, 0, 1, 1,
-0.2067489, 0.04690178, -0.6062635, 1, 1, 1, 1, 1,
-0.2058011, -0.6162238, -2.52056, 1, 1, 1, 1, 1,
-0.2045222, -0.7728122, -1.746577, 1, 1, 1, 1, 1,
-0.2038031, -0.7200932, -4.490069, 1, 1, 1, 1, 1,
-0.1963993, 0.1154316, -0.8372579, 1, 1, 1, 1, 1,
-0.1939597, -0.1066124, -1.808383, 1, 1, 1, 1, 1,
-0.1920208, -0.6310974, -3.946227, 1, 1, 1, 1, 1,
-0.1859871, -0.1517264, -3.45714, 1, 1, 1, 1, 1,
-0.1809587, 0.3454297, -0.2429171, 1, 1, 1, 1, 1,
-0.1785267, -1.130299, -3.93997, 1, 1, 1, 1, 1,
-0.1772393, 0.2938378, -2.264055, 1, 1, 1, 1, 1,
-0.1754828, -0.2157563, -2.975477, 1, 1, 1, 1, 1,
-0.1712531, -0.4572137, -3.402464, 1, 1, 1, 1, 1,
-0.1689913, -0.01549588, -2.867487, 1, 1, 1, 1, 1,
-0.1689686, -0.03192475, -1.818693, 1, 1, 1, 1, 1,
-0.1688442, -1.007341, -2.967968, 0, 0, 1, 1, 1,
-0.1686966, 0.6581048, -1.351566, 1, 0, 0, 1, 1,
-0.1609658, -0.301787, -1.153713, 1, 0, 0, 1, 1,
-0.1603381, -1.059105, -2.562847, 1, 0, 0, 1, 1,
-0.1602028, 1.370102, 0.1402878, 1, 0, 0, 1, 1,
-0.157927, 0.180677, -0.4476457, 1, 0, 0, 1, 1,
-0.1565248, -0.1059102, -3.149341, 0, 0, 0, 1, 1,
-0.1542526, 2.503037, -2.351244, 0, 0, 0, 1, 1,
-0.1539925, -0.6045465, -3.794828, 0, 0, 0, 1, 1,
-0.1520774, -0.8163568, -3.894151, 0, 0, 0, 1, 1,
-0.1511618, 0.3941661, 0.5125001, 0, 0, 0, 1, 1,
-0.1499245, -1.015687, -1.160039, 0, 0, 0, 1, 1,
-0.1499182, 1.793191, 0.5611924, 0, 0, 0, 1, 1,
-0.1496266, 0.1037567, -0.6881604, 1, 1, 1, 1, 1,
-0.1473055, -0.1908055, -1.76118, 1, 1, 1, 1, 1,
-0.1456556, 1.70178, -0.318184, 1, 1, 1, 1, 1,
-0.1401442, -0.01254379, -1.512722, 1, 1, 1, 1, 1,
-0.1398209, -0.4790935, -2.023674, 1, 1, 1, 1, 1,
-0.1303899, -0.2593705, -2.535923, 1, 1, 1, 1, 1,
-0.129452, 1.138907, -0.09713119, 1, 1, 1, 1, 1,
-0.1290013, 1.102227, -1.877476, 1, 1, 1, 1, 1,
-0.1289561, 1.023604, -1.007137, 1, 1, 1, 1, 1,
-0.1279905, 0.6307507, 0.002857799, 1, 1, 1, 1, 1,
-0.124561, 2.377017, -0.009423319, 1, 1, 1, 1, 1,
-0.1243942, 0.2966953, 0.4227376, 1, 1, 1, 1, 1,
-0.1229468, -1.904817, -5.430844, 1, 1, 1, 1, 1,
-0.1168624, -0.3725654, -3.942175, 1, 1, 1, 1, 1,
-0.1166114, 1.220926, 0.02869375, 1, 1, 1, 1, 1,
-0.1163036, -0.9111773, -3.124614, 0, 0, 1, 1, 1,
-0.1156925, 0.6035683, -0.5773005, 1, 0, 0, 1, 1,
-0.1139244, -0.1291804, -0.7180869, 1, 0, 0, 1, 1,
-0.1086519, 0.3173369, -0.5385321, 1, 0, 0, 1, 1,
-0.1030605, -0.956418, -5.570657, 1, 0, 0, 1, 1,
-0.09887944, 1.593109, -0.4835232, 1, 0, 0, 1, 1,
-0.09711124, -2.626883, -4.015865, 0, 0, 0, 1, 1,
-0.09615515, 0.4697124, -1.566209, 0, 0, 0, 1, 1,
-0.09237842, 1.065442, 0.6804488, 0, 0, 0, 1, 1,
-0.08446054, 0.1923707, 0.2737051, 0, 0, 0, 1, 1,
-0.08380103, 0.4687729, -1.161684, 0, 0, 0, 1, 1,
-0.08261164, 0.4364958, -0.4720137, 0, 0, 0, 1, 1,
-0.08101381, -1.70523, -3.746904, 0, 0, 0, 1, 1,
-0.07650588, -0.4082092, -2.873628, 1, 1, 1, 1, 1,
-0.06910468, -0.04084419, -3.141666, 1, 1, 1, 1, 1,
-0.06633294, -0.03226442, -0.812685, 1, 1, 1, 1, 1,
-0.06343637, -0.2406426, -2.389989, 1, 1, 1, 1, 1,
-0.06226709, 0.07655471, 0.8956797, 1, 1, 1, 1, 1,
-0.06218253, 0.3525011, -0.4186646, 1, 1, 1, 1, 1,
-0.06105764, 0.4143217, -0.1636459, 1, 1, 1, 1, 1,
-0.06098537, -0.3857439, -3.028645, 1, 1, 1, 1, 1,
-0.05835451, 0.493992, -0.2721899, 1, 1, 1, 1, 1,
-0.0577516, 0.1919219, 0.6944491, 1, 1, 1, 1, 1,
-0.05488695, -0.2284351, -2.912702, 1, 1, 1, 1, 1,
-0.05397232, -0.0712063, -1.716516, 1, 1, 1, 1, 1,
-0.05264871, 0.5902548, 1.659825, 1, 1, 1, 1, 1,
-0.0515477, -0.6506486, -2.721654, 1, 1, 1, 1, 1,
-0.05109686, 0.2543802, -2.279549, 1, 1, 1, 1, 1,
-0.04936732, -0.9546124, -2.47606, 0, 0, 1, 1, 1,
-0.0466711, -0.8014375, -1.182719, 1, 0, 0, 1, 1,
-0.03966895, 0.4533685, 0.4092626, 1, 0, 0, 1, 1,
-0.03157599, -0.09217323, -2.998873, 1, 0, 0, 1, 1,
-0.02284902, 1.245493, -0.1252941, 1, 0, 0, 1, 1,
-0.02005488, -0.6465929, -3.325214, 1, 0, 0, 1, 1,
-0.01753671, 2.023885, 0.7963974, 0, 0, 0, 1, 1,
-0.01447175, -1.051702, -5.618814, 0, 0, 0, 1, 1,
-0.01444779, 0.1840938, 0.09979999, 0, 0, 0, 1, 1,
-0.01227338, -0.6083997, -2.801138, 0, 0, 0, 1, 1,
-0.01183392, 1.271567, 0.2603472, 0, 0, 0, 1, 1,
-0.01182663, -0.3634125, -2.20922, 0, 0, 0, 1, 1,
-0.01114139, -0.2396533, -2.413479, 0, 0, 0, 1, 1,
-0.007000546, -0.450657, -3.352752, 1, 1, 1, 1, 1,
-0.004409854, -0.5388893, -3.661882, 1, 1, 1, 1, 1,
-0.002723063, 0.1822923, -2.879905, 1, 1, 1, 1, 1,
0.006923801, -0.6125227, 1.54335, 1, 1, 1, 1, 1,
0.00792756, 0.2759669, 0.5518558, 1, 1, 1, 1, 1,
0.008797184, -0.7753332, 2.831887, 1, 1, 1, 1, 1,
0.01034019, -0.5990763, 4.302433, 1, 1, 1, 1, 1,
0.01303367, 0.1201563, 2.527649, 1, 1, 1, 1, 1,
0.03298396, 2.08072, -1.741411, 1, 1, 1, 1, 1,
0.03755009, 0.5334199, 1.421479, 1, 1, 1, 1, 1,
0.0399981, 0.9195725, 0.5709946, 1, 1, 1, 1, 1,
0.04416425, 0.2653019, 2.30031, 1, 1, 1, 1, 1,
0.0452845, -2.300116, 2.554934, 1, 1, 1, 1, 1,
0.0518159, -0.5183983, 4.391816, 1, 1, 1, 1, 1,
0.05343448, -0.05350461, 2.943222, 1, 1, 1, 1, 1,
0.05501619, 1.192939, -0.1023566, 0, 0, 1, 1, 1,
0.05587841, 0.1306936, 0.4762305, 1, 0, 0, 1, 1,
0.05868215, 1.935131, 0.4297476, 1, 0, 0, 1, 1,
0.06706247, -1.820932, 2.479589, 1, 0, 0, 1, 1,
0.06930736, 0.4715459, 0.2594684, 1, 0, 0, 1, 1,
0.07130146, -0.8358428, 4.726492, 1, 0, 0, 1, 1,
0.07138986, 0.1818858, 0.8167519, 0, 0, 0, 1, 1,
0.07153679, 0.2776057, 1.527817, 0, 0, 0, 1, 1,
0.07580636, -1.074411, 3.360985, 0, 0, 0, 1, 1,
0.07786342, -0.01638261, 4.334223, 0, 0, 0, 1, 1,
0.08219583, -0.3403487, 2.794323, 0, 0, 0, 1, 1,
0.08274803, -0.3980819, 2.401978, 0, 0, 0, 1, 1,
0.0861386, -0.945164, 4.222944, 0, 0, 0, 1, 1,
0.08814425, -1.629113, 3.843733, 1, 1, 1, 1, 1,
0.0900467, 0.4351868, 1.217412, 1, 1, 1, 1, 1,
0.09136726, -1.778989, 4.587607, 1, 1, 1, 1, 1,
0.0917718, 0.7847213, 0.03664594, 1, 1, 1, 1, 1,
0.09300646, 1.342322, 1.14948, 1, 1, 1, 1, 1,
0.09381093, 0.4329979, 0.08185052, 1, 1, 1, 1, 1,
0.09391453, -0.8021574, 1.372458, 1, 1, 1, 1, 1,
0.09453464, 1.587789, 0.730111, 1, 1, 1, 1, 1,
0.09695619, -1.700821, 2.907044, 1, 1, 1, 1, 1,
0.09796731, -0.4648386, 2.470153, 1, 1, 1, 1, 1,
0.1039994, 0.03714991, 2.097411, 1, 1, 1, 1, 1,
0.104655, 0.3165907, -0.3379152, 1, 1, 1, 1, 1,
0.1090981, -0.2714965, 3.981756, 1, 1, 1, 1, 1,
0.1127199, 0.1758548, 1.032849, 1, 1, 1, 1, 1,
0.1133128, 1.335692, 0.8865619, 1, 1, 1, 1, 1,
0.1180281, -0.8264939, 2.537016, 0, 0, 1, 1, 1,
0.1215331, -0.08968415, 1.95954, 1, 0, 0, 1, 1,
0.1236724, 1.295015, -0.2022851, 1, 0, 0, 1, 1,
0.1285213, -0.03097992, 2.132785, 1, 0, 0, 1, 1,
0.1336918, -0.9061688, 4.240233, 1, 0, 0, 1, 1,
0.1340328, 0.5478796, 1.212912, 1, 0, 0, 1, 1,
0.1370986, -0.8032759, 2.851518, 0, 0, 0, 1, 1,
0.1371567, -0.5068056, 1.517605, 0, 0, 0, 1, 1,
0.1373989, -0.5990339, 2.40433, 0, 0, 0, 1, 1,
0.1388736, 1.171401, -0.9609133, 0, 0, 0, 1, 1,
0.1445145, 0.2415628, -0.3120071, 0, 0, 0, 1, 1,
0.1455679, 0.300767, 0.2752992, 0, 0, 0, 1, 1,
0.146617, -0.01002264, 2.171832, 0, 0, 0, 1, 1,
0.1505311, 0.8761545, 0.02806169, 1, 1, 1, 1, 1,
0.1518894, 0.6994024, 1.065022, 1, 1, 1, 1, 1,
0.1553612, -0.1441936, 1.212823, 1, 1, 1, 1, 1,
0.1579274, 0.362544, -0.8129992, 1, 1, 1, 1, 1,
0.1635234, 0.5620765, -0.5338088, 1, 1, 1, 1, 1,
0.1641132, -0.3967104, 2.455854, 1, 1, 1, 1, 1,
0.1671292, -0.4648123, 2.949841, 1, 1, 1, 1, 1,
0.1677701, -0.7988048, 3.620273, 1, 1, 1, 1, 1,
0.1687082, -0.008053493, 1.818788, 1, 1, 1, 1, 1,
0.1828482, -0.02164429, 2.312795, 1, 1, 1, 1, 1,
0.1853925, -0.9398583, 2.457913, 1, 1, 1, 1, 1,
0.1913262, -0.2242886, 3.15132, 1, 1, 1, 1, 1,
0.1927471, 0.6352152, -1.012584, 1, 1, 1, 1, 1,
0.193447, -0.5567744, 2.65596, 1, 1, 1, 1, 1,
0.1946594, 0.5559562, 2.906917, 1, 1, 1, 1, 1,
0.204267, -1.265044, 2.378761, 0, 0, 1, 1, 1,
0.2064005, 1.557233, -0.5299441, 1, 0, 0, 1, 1,
0.2087905, -0.2607113, 1.40535, 1, 0, 0, 1, 1,
0.2090918, -0.06249524, 3.293752, 1, 0, 0, 1, 1,
0.2115702, -0.1929776, 1.38835, 1, 0, 0, 1, 1,
0.2152654, -0.01636466, 1.059813, 1, 0, 0, 1, 1,
0.2208454, -1.404121, 2.747355, 0, 0, 0, 1, 1,
0.2216498, -0.6792026, 2.221123, 0, 0, 0, 1, 1,
0.2221561, 0.7642571, -0.7057357, 0, 0, 0, 1, 1,
0.2222545, -0.1523589, 2.444811, 0, 0, 0, 1, 1,
0.2223118, -0.8315727, 1.779991, 0, 0, 0, 1, 1,
0.2252433, -0.7135111, 2.625954, 0, 0, 0, 1, 1,
0.2256464, 0.9433, -1.229512, 0, 0, 0, 1, 1,
0.2267725, -1.395061, 2.213882, 1, 1, 1, 1, 1,
0.2272581, 1.736021, 0.2611682, 1, 1, 1, 1, 1,
0.230908, -0.5894616, 2.754128, 1, 1, 1, 1, 1,
0.2392807, 1.711058, 1.189393, 1, 1, 1, 1, 1,
0.2394795, -0.7426196, 1.408748, 1, 1, 1, 1, 1,
0.2439222, -1.121216, 3.710582, 1, 1, 1, 1, 1,
0.2470879, 0.0991557, 0.2473802, 1, 1, 1, 1, 1,
0.2491062, 1.086957, 0.259888, 1, 1, 1, 1, 1,
0.2573563, -0.8096976, 0.8593222, 1, 1, 1, 1, 1,
0.2584348, -0.1889082, 1.485825, 1, 1, 1, 1, 1,
0.2642588, 0.9544796, -1.664663, 1, 1, 1, 1, 1,
0.2665881, 0.4804638, 0.1226149, 1, 1, 1, 1, 1,
0.2684472, -0.0378092, 0.8355972, 1, 1, 1, 1, 1,
0.268896, -0.8680836, 1.797342, 1, 1, 1, 1, 1,
0.2704826, 0.2665292, -0.3415781, 1, 1, 1, 1, 1,
0.2727321, 1.973441, 0.937016, 0, 0, 1, 1, 1,
0.2740238, 0.2400865, 0.4244148, 1, 0, 0, 1, 1,
0.2765935, -0.06155166, 0.7694244, 1, 0, 0, 1, 1,
0.2769261, 1.365919, 2.069978, 1, 0, 0, 1, 1,
0.2777208, 0.2564125, 2.330029, 1, 0, 0, 1, 1,
0.2777326, -0.8795527, 3.246825, 1, 0, 0, 1, 1,
0.2801738, 0.863458, 1.1043, 0, 0, 0, 1, 1,
0.2813182, -1.801594, 2.348067, 0, 0, 0, 1, 1,
0.2846108, -0.1253555, 3.284603, 0, 0, 0, 1, 1,
0.2857874, 1.632158, 0.3396135, 0, 0, 0, 1, 1,
0.2944482, 0.03040672, 2.10774, 0, 0, 0, 1, 1,
0.2980082, 1.031457, -0.4902707, 0, 0, 0, 1, 1,
0.299529, -0.7713659, 2.826444, 0, 0, 0, 1, 1,
0.301084, -1.545607, 1.005893, 1, 1, 1, 1, 1,
0.301514, 0.627906, 0.5281535, 1, 1, 1, 1, 1,
0.304709, 0.9910851, 0.1120882, 1, 1, 1, 1, 1,
0.3064372, 0.7123034, -0.02694103, 1, 1, 1, 1, 1,
0.3074876, -0.8742838, 0.4436432, 1, 1, 1, 1, 1,
0.3080556, 0.3599299, 0.5240384, 1, 1, 1, 1, 1,
0.3104531, 1.030952, 0.06427244, 1, 1, 1, 1, 1,
0.3121489, -0.9099934, 2.549517, 1, 1, 1, 1, 1,
0.3154641, -0.3975128, 1.673265, 1, 1, 1, 1, 1,
0.3156694, -1.192113, 2.135011, 1, 1, 1, 1, 1,
0.3159897, 1.40606, 0.8416601, 1, 1, 1, 1, 1,
0.3185197, -1.228046, 4.034928, 1, 1, 1, 1, 1,
0.3217138, 1.134526, -0.5444184, 1, 1, 1, 1, 1,
0.3279242, -0.7949947, 3.671119, 1, 1, 1, 1, 1,
0.3306273, 0.2168096, -0.03625146, 1, 1, 1, 1, 1,
0.3326474, -0.183399, 1.061773, 0, 0, 1, 1, 1,
0.3327591, 0.4196874, 1.13195, 1, 0, 0, 1, 1,
0.3362636, -1.098426, 1.715719, 1, 0, 0, 1, 1,
0.3362642, 1.04334, -0.2400084, 1, 0, 0, 1, 1,
0.3410902, 1.925781, 2.407535, 1, 0, 0, 1, 1,
0.3416366, 0.2869003, 0.5482501, 1, 0, 0, 1, 1,
0.3418191, -1.162671, 3.825608, 0, 0, 0, 1, 1,
0.342184, -0.07715105, 1.540797, 0, 0, 0, 1, 1,
0.3468886, 0.2449, 2.197097, 0, 0, 0, 1, 1,
0.3593252, -0.6996775, 3.135805, 0, 0, 0, 1, 1,
0.3596841, -0.6776865, 2.961706, 0, 0, 0, 1, 1,
0.362921, -0.6084822, 3.134239, 0, 0, 0, 1, 1,
0.365412, 1.433929, 1.480733, 0, 0, 0, 1, 1,
0.3760423, 1.596293, 0.1802564, 1, 1, 1, 1, 1,
0.3782169, -1.844534, 2.681074, 1, 1, 1, 1, 1,
0.3802804, -0.178652, 2.318751, 1, 1, 1, 1, 1,
0.3877365, -0.01722963, 3.666438, 1, 1, 1, 1, 1,
0.3885359, 1.085146, 0.1600243, 1, 1, 1, 1, 1,
0.388627, 0.08558895, 1.417404, 1, 1, 1, 1, 1,
0.3899006, 0.09803268, -0.06158673, 1, 1, 1, 1, 1,
0.3899114, 0.6507045, 0.2582257, 1, 1, 1, 1, 1,
0.3929431, -1.523057, 2.951403, 1, 1, 1, 1, 1,
0.3932821, -0.5283093, 3.903425, 1, 1, 1, 1, 1,
0.398444, -0.1751237, 0.7600306, 1, 1, 1, 1, 1,
0.3986216, 0.9734277, -1.539323, 1, 1, 1, 1, 1,
0.3990404, 0.1797194, 0.8011313, 1, 1, 1, 1, 1,
0.3995215, 0.5413985, -0.354477, 1, 1, 1, 1, 1,
0.3998671, 0.5602009, 2.779521, 1, 1, 1, 1, 1,
0.4052056, -1.583442, 3.224538, 0, 0, 1, 1, 1,
0.4117316, -1.224016, 1.76335, 1, 0, 0, 1, 1,
0.4119631, -0.154359, 1.732679, 1, 0, 0, 1, 1,
0.4136299, 0.4224116, -0.5410945, 1, 0, 0, 1, 1,
0.4190461, -0.07184138, 3.289989, 1, 0, 0, 1, 1,
0.4283761, -0.1648998, 3.266957, 1, 0, 0, 1, 1,
0.4321209, 0.3556032, 2.717906, 0, 0, 0, 1, 1,
0.4324305, 1.041193, 1.22119, 0, 0, 0, 1, 1,
0.4334001, -1.423318, 2.728433, 0, 0, 0, 1, 1,
0.4408763, -0.6009999, 2.685505, 0, 0, 0, 1, 1,
0.4428054, -0.3270664, 1.341098, 0, 0, 0, 1, 1,
0.4441841, -1.662898, 2.607729, 0, 0, 0, 1, 1,
0.4444379, -0.3704197, 2.20416, 0, 0, 0, 1, 1,
0.4449252, -1.469184, 2.516485, 1, 1, 1, 1, 1,
0.4454133, 0.9858136, 2.094249, 1, 1, 1, 1, 1,
0.4465604, -0.1568774, 2.196494, 1, 1, 1, 1, 1,
0.4469767, -0.03641837, 0.9465232, 1, 1, 1, 1, 1,
0.4485796, -0.41684, 1.220769, 1, 1, 1, 1, 1,
0.449422, 1.154794, 1.192122, 1, 1, 1, 1, 1,
0.449734, 0.9878247, -0.4446864, 1, 1, 1, 1, 1,
0.4505673, 0.3729838, -0.4489477, 1, 1, 1, 1, 1,
0.4511003, -0.0724372, -0.3438219, 1, 1, 1, 1, 1,
0.4529741, 0.2194531, 1.405502, 1, 1, 1, 1, 1,
0.453354, 1.359367, -0.3595917, 1, 1, 1, 1, 1,
0.4547904, 1.118009, 1.151772, 1, 1, 1, 1, 1,
0.4548542, -0.3189799, 1.211832, 1, 1, 1, 1, 1,
0.4601336, -0.9592422, 2.605919, 1, 1, 1, 1, 1,
0.4632805, 0.5710914, 0.5071881, 1, 1, 1, 1, 1,
0.4669218, -1.065168, 2.628073, 0, 0, 1, 1, 1,
0.4698675, 0.9089069, 0.8051179, 1, 0, 0, 1, 1,
0.4706843, -0.1764291, 2.201316, 1, 0, 0, 1, 1,
0.4774251, -1.046266, 2.726438, 1, 0, 0, 1, 1,
0.4798014, -0.5785084, 2.947272, 1, 0, 0, 1, 1,
0.480234, 0.2476794, 1.22469, 1, 0, 0, 1, 1,
0.4808038, 0.1008265, 1.265149, 0, 0, 0, 1, 1,
0.4842664, 0.274946, 1.977811, 0, 0, 0, 1, 1,
0.4854508, -1.632763, 1.808865, 0, 0, 0, 1, 1,
0.4867052, 1.867976, 0.9684809, 0, 0, 0, 1, 1,
0.4889154, -0.06110207, 3.858377, 0, 0, 0, 1, 1,
0.4946712, 1.686402, 1.578461, 0, 0, 0, 1, 1,
0.5049139, -0.1574966, 2.071032, 0, 0, 0, 1, 1,
0.5094233, -0.7955037, 2.974749, 1, 1, 1, 1, 1,
0.5165356, 0.7837081, -0.1163177, 1, 1, 1, 1, 1,
0.5178198, -1.720432, 1.683396, 1, 1, 1, 1, 1,
0.5216729, -0.3847613, 2.716954, 1, 1, 1, 1, 1,
0.5254202, -0.5139058, 1.334252, 1, 1, 1, 1, 1,
0.5269831, -0.5585214, 3.131384, 1, 1, 1, 1, 1,
0.5275281, -0.7207358, 3.810891, 1, 1, 1, 1, 1,
0.5284633, -0.3396426, 1.613552, 1, 1, 1, 1, 1,
0.5346389, 1.494555, -0.8713042, 1, 1, 1, 1, 1,
0.5352555, 0.6981769, -0.2483482, 1, 1, 1, 1, 1,
0.5369195, -0.6045726, 1.618074, 1, 1, 1, 1, 1,
0.5377201, 0.5925704, 0.7090808, 1, 1, 1, 1, 1,
0.5392891, 1.09386, 0.8395356, 1, 1, 1, 1, 1,
0.5404665, 0.01299945, 3.405231, 1, 1, 1, 1, 1,
0.5483476, -0.6482508, 0.7955976, 1, 1, 1, 1, 1,
0.548952, -0.187557, 2.269361, 0, 0, 1, 1, 1,
0.5490874, -1.441824, 2.693363, 1, 0, 0, 1, 1,
0.5502211, -0.864848, 1.522333, 1, 0, 0, 1, 1,
0.5516729, -0.2350854, 3.466096, 1, 0, 0, 1, 1,
0.5526808, -1.151197, 3.540635, 1, 0, 0, 1, 1,
0.5538625, 0.759859, -1.320706, 1, 0, 0, 1, 1,
0.5539824, -0.1584193, 0.9069293, 0, 0, 0, 1, 1,
0.5544273, -0.1748108, 2.411962, 0, 0, 0, 1, 1,
0.5552614, -0.4229052, 3.695027, 0, 0, 0, 1, 1,
0.5559503, -0.2867609, 2.071672, 0, 0, 0, 1, 1,
0.5588392, -0.284412, 1.712622, 0, 0, 0, 1, 1,
0.5649033, -1.560044, 1.320431, 0, 0, 0, 1, 1,
0.5658841, 0.9068382, -0.7630429, 0, 0, 0, 1, 1,
0.5730994, -0.4051837, 3.211523, 1, 1, 1, 1, 1,
0.5738254, -0.2610509, 1.943765, 1, 1, 1, 1, 1,
0.5755733, 1.206676, 1.743918, 1, 1, 1, 1, 1,
0.5763094, 0.3804258, 1.259021, 1, 1, 1, 1, 1,
0.5807863, 0.3879336, 1.874055, 1, 1, 1, 1, 1,
0.5838436, -0.9020686, 1.497777, 1, 1, 1, 1, 1,
0.5869679, -0.2235735, 1.808501, 1, 1, 1, 1, 1,
0.5907325, -0.7136832, 2.996459, 1, 1, 1, 1, 1,
0.5950345, 2.253401, 0.1957281, 1, 1, 1, 1, 1,
0.5953373, -0.4712848, 2.305559, 1, 1, 1, 1, 1,
0.5955528, 0.3142189, 1.975844, 1, 1, 1, 1, 1,
0.5962852, 0.297148, 0.9732611, 1, 1, 1, 1, 1,
0.599534, 0.797681, 0.03218101, 1, 1, 1, 1, 1,
0.6028745, -0.3909501, 2.894021, 1, 1, 1, 1, 1,
0.6119316, 0.735128, 0.5216308, 1, 1, 1, 1, 1,
0.6162311, -3.153033, 2.299989, 0, 0, 1, 1, 1,
0.6191378, -0.7195188, 2.984395, 1, 0, 0, 1, 1,
0.6218375, 1.154783, 0.8969311, 1, 0, 0, 1, 1,
0.6249263, 1.169683, 0.5693308, 1, 0, 0, 1, 1,
0.6323094, -1.477826, 2.093358, 1, 0, 0, 1, 1,
0.6392617, 2.446354, 1.010255, 1, 0, 0, 1, 1,
0.6486926, -0.8991812, 3.627284, 0, 0, 0, 1, 1,
0.6529468, 0.3241743, 1.042611, 0, 0, 0, 1, 1,
0.6554533, -0.7242758, 3.247326, 0, 0, 0, 1, 1,
0.659742, -0.228667, 1.719165, 0, 0, 0, 1, 1,
0.6605504, -0.9885409, 3.741361, 0, 0, 0, 1, 1,
0.6632887, -0.04139559, 1.585021, 0, 0, 0, 1, 1,
0.6633191, 0.06426581, 0.0463391, 0, 0, 0, 1, 1,
0.6661354, 0.6737354, 0.02080787, 1, 1, 1, 1, 1,
0.6697956, 0.5230709, 0.4283671, 1, 1, 1, 1, 1,
0.6700079, 0.9102218, 1.636785, 1, 1, 1, 1, 1,
0.6705077, -0.3383835, 4.503334, 1, 1, 1, 1, 1,
0.6731696, -1.463205, 2.337486, 1, 1, 1, 1, 1,
0.6765571, -1.337764, 3.097704, 1, 1, 1, 1, 1,
0.6779784, -0.05286652, 1.095653, 1, 1, 1, 1, 1,
0.6784231, -0.1650319, 2.549389, 1, 1, 1, 1, 1,
0.6875536, 1.276369, 0.8206314, 1, 1, 1, 1, 1,
0.6888829, -0.6857508, 2.887821, 1, 1, 1, 1, 1,
0.6925004, 0.3886962, 0.5777258, 1, 1, 1, 1, 1,
0.6931034, 0.03519632, 2.422105, 1, 1, 1, 1, 1,
0.6949859, 0.6857414, 0.5351921, 1, 1, 1, 1, 1,
0.6984307, 1.083406, 0.6799902, 1, 1, 1, 1, 1,
0.701205, 0.5105346, 0.4382276, 1, 1, 1, 1, 1,
0.7012644, 1.480685, 0.6757156, 0, 0, 1, 1, 1,
0.7023761, -1.185613, 1.675593, 1, 0, 0, 1, 1,
0.7073459, -1.895817, 5.008254, 1, 0, 0, 1, 1,
0.7075075, 2.436904, -0.638033, 1, 0, 0, 1, 1,
0.7111577, 0.4879604, 1.843693, 1, 0, 0, 1, 1,
0.7159446, 0.4082269, 0.5463531, 1, 0, 0, 1, 1,
0.7239502, 0.5661923, 0.4481255, 0, 0, 0, 1, 1,
0.7245479, 0.6153496, 1.301002, 0, 0, 0, 1, 1,
0.7320968, -1.852393, 2.657274, 0, 0, 0, 1, 1,
0.7326964, -0.07852268, 3.284604, 0, 0, 0, 1, 1,
0.7328066, 0.2753972, 0.7279305, 0, 0, 0, 1, 1,
0.7385942, 0.4395122, -0.008310908, 0, 0, 0, 1, 1,
0.7389014, 1.62876, 2.289928, 0, 0, 0, 1, 1,
0.7393824, 1.814958, 0.175754, 1, 1, 1, 1, 1,
0.7438347, -0.08772918, 1.747177, 1, 1, 1, 1, 1,
0.7570572, 0.09376864, 2.567091, 1, 1, 1, 1, 1,
0.761273, 1.653605, -2.027096, 1, 1, 1, 1, 1,
0.7622237, 1.031891, 2.369075, 1, 1, 1, 1, 1,
0.7644918, 0.8391104, 0.09623392, 1, 1, 1, 1, 1,
0.7713863, 0.1264209, -1.192057, 1, 1, 1, 1, 1,
0.7736792, -0.06763538, 1.584836, 1, 1, 1, 1, 1,
0.7739153, 1.246508, 0.7549722, 1, 1, 1, 1, 1,
0.7739478, 0.1036717, 2.802779, 1, 1, 1, 1, 1,
0.7765509, 0.7267685, 1.255811, 1, 1, 1, 1, 1,
0.7784402, -0.08263458, 2.516938, 1, 1, 1, 1, 1,
0.7790406, 2.546715, 0.0381729, 1, 1, 1, 1, 1,
0.7823957, -0.1933238, 2.878001, 1, 1, 1, 1, 1,
0.7843575, 0.18629, 2.254017, 1, 1, 1, 1, 1,
0.788089, -0.6246312, 0.4031015, 0, 0, 1, 1, 1,
0.791894, 0.3102142, -0.0247842, 1, 0, 0, 1, 1,
0.7933038, -0.3450307, 1.790931, 1, 0, 0, 1, 1,
0.7958881, 0.0945977, 1.694379, 1, 0, 0, 1, 1,
0.7965779, -0.4821466, 2.138106, 1, 0, 0, 1, 1,
0.7969803, -1.245196, 4.183349, 1, 0, 0, 1, 1,
0.7971696, -0.5316778, 0.312488, 0, 0, 0, 1, 1,
0.8002024, -0.2546619, 1.580326, 0, 0, 0, 1, 1,
0.8003349, -0.8337503, 1.667401, 0, 0, 0, 1, 1,
0.8020458, -0.7621185, 0.4948396, 0, 0, 0, 1, 1,
0.8065695, -1.341104, 2.683447, 0, 0, 0, 1, 1,
0.8179051, -0.6966122, 3.043708, 0, 0, 0, 1, 1,
0.8204598, 0.8324497, -0.08956359, 0, 0, 0, 1, 1,
0.82252, 0.7107688, -0.2557326, 1, 1, 1, 1, 1,
0.8270032, -0.4610459, 0.852378, 1, 1, 1, 1, 1,
0.8299766, -0.9152731, 2.487671, 1, 1, 1, 1, 1,
0.8379369, 1.931685, -1.318273, 1, 1, 1, 1, 1,
0.8417068, -0.4617854, 2.108032, 1, 1, 1, 1, 1,
0.8428416, -0.8357283, 0.2103067, 1, 1, 1, 1, 1,
0.8473427, 0.7019071, 2.915983, 1, 1, 1, 1, 1,
0.8475445, 1.677441, 0.956594, 1, 1, 1, 1, 1,
0.8505242, 2.343129, 0.03705531, 1, 1, 1, 1, 1,
0.8542804, -0.3036969, 2.918415, 1, 1, 1, 1, 1,
0.8561603, 0.1011595, 1.646706, 1, 1, 1, 1, 1,
0.8576753, -0.2880799, 1.752415, 1, 1, 1, 1, 1,
0.8749822, -0.3152062, 0.07887886, 1, 1, 1, 1, 1,
0.8758454, 0.4374185, -0.002562654, 1, 1, 1, 1, 1,
0.8852721, -0.3312541, 0.9299344, 1, 1, 1, 1, 1,
0.8868116, -0.8641944, 0.9929252, 0, 0, 1, 1, 1,
0.8894394, 0.2299825, 2.095631, 1, 0, 0, 1, 1,
0.897571, 1.626077, 1.046341, 1, 0, 0, 1, 1,
0.8979998, -1.26503, 2.792294, 1, 0, 0, 1, 1,
0.9017541, 0.871967, -0.1633173, 1, 0, 0, 1, 1,
0.9019967, -1.090251, 0.674651, 1, 0, 0, 1, 1,
0.9223645, -0.8111534, 1.752618, 0, 0, 0, 1, 1,
0.9246295, 0.8091489, 1.748164, 0, 0, 0, 1, 1,
0.9290788, 1.49388, 1.132044, 0, 0, 0, 1, 1,
0.9421069, -0.4651504, 1.78687, 0, 0, 0, 1, 1,
0.9449934, 1.173264, -0.7115414, 0, 0, 0, 1, 1,
0.9497476, 0.6813844, 0.7480549, 0, 0, 0, 1, 1,
0.9538176, 0.8702241, 1.471569, 0, 0, 0, 1, 1,
0.9562519, -1.570355, 2.912004, 1, 1, 1, 1, 1,
0.9563771, -0.09376179, 1.279714, 1, 1, 1, 1, 1,
0.9567311, 0.5274996, 1.957314, 1, 1, 1, 1, 1,
0.9600497, 1.089434, -1.544581, 1, 1, 1, 1, 1,
0.9625879, -0.3147311, 1.856833, 1, 1, 1, 1, 1,
0.9774438, 0.5291726, 1.250625, 1, 1, 1, 1, 1,
0.9777067, 0.3973789, 3.486756, 1, 1, 1, 1, 1,
0.9781874, -0.1198241, 2.229131, 1, 1, 1, 1, 1,
0.979809, 0.8720871, -0.4698898, 1, 1, 1, 1, 1,
0.9825664, 1.201112, -0.8728653, 1, 1, 1, 1, 1,
0.98366, 1.644303, 1.793675, 1, 1, 1, 1, 1,
0.9858389, 0.0737608, 1.843877, 1, 1, 1, 1, 1,
0.9859037, -0.2084113, 2.150797, 1, 1, 1, 1, 1,
0.9949699, 0.664677, -0.7683976, 1, 1, 1, 1, 1,
0.9973537, -1.179188, 2.519325, 1, 1, 1, 1, 1,
0.9984567, 0.2203779, -0.02698655, 0, 0, 1, 1, 1,
1.000487, 1.294672, 0.7841002, 1, 0, 0, 1, 1,
1.004583, -1.053633, 3.239549, 1, 0, 0, 1, 1,
1.008204, 1.151902, 0.9051446, 1, 0, 0, 1, 1,
1.009277, 0.3092988, 1.754418, 1, 0, 0, 1, 1,
1.012279, 0.3502945, 1.65037, 1, 0, 0, 1, 1,
1.017047, -0.8596256, 2.213748, 0, 0, 0, 1, 1,
1.020782, -0.8193257, 2.585863, 0, 0, 0, 1, 1,
1.021782, -1.028732, 1.918389, 0, 0, 0, 1, 1,
1.022497, -0.9051476, 2.96091, 0, 0, 0, 1, 1,
1.037043, 1.129298, -0.2509053, 0, 0, 0, 1, 1,
1.041379, -0.1198687, 2.286093, 0, 0, 0, 1, 1,
1.04444, 0.318308, 0.4867912, 0, 0, 0, 1, 1,
1.047913, 0.5930012, -1.237037, 1, 1, 1, 1, 1,
1.048938, 0.1066503, 1.799473, 1, 1, 1, 1, 1,
1.05144, -0.456768, 3.596036, 1, 1, 1, 1, 1,
1.051802, 0.2793449, 0.8274053, 1, 1, 1, 1, 1,
1.057385, -0.7978668, 0.4307136, 1, 1, 1, 1, 1,
1.087567, -0.8888947, 1.996095, 1, 1, 1, 1, 1,
1.094668, -1.034061, 1.393894, 1, 1, 1, 1, 1,
1.098708, -0.2121328, 1.101007, 1, 1, 1, 1, 1,
1.101729, 1.405761, 1.943439, 1, 1, 1, 1, 1,
1.113495, 1.822679, -0.5060294, 1, 1, 1, 1, 1,
1.128628, 0.7456855, 1.280677, 1, 1, 1, 1, 1,
1.136247, -0.05699822, 1.213512, 1, 1, 1, 1, 1,
1.137082, -0.1771736, 0.892661, 1, 1, 1, 1, 1,
1.141841, -1.279486, 2.474705, 1, 1, 1, 1, 1,
1.156218, 0.8027424, 1.639898, 1, 1, 1, 1, 1,
1.1586, 0.03285545, 3.078625, 0, 0, 1, 1, 1,
1.161901, 1.940464, -0.4840901, 1, 0, 0, 1, 1,
1.167166, 0.004012526, 1.124558, 1, 0, 0, 1, 1,
1.171236, -0.09337445, 0.3979641, 1, 0, 0, 1, 1,
1.178696, 1.507932, -0.3632562, 1, 0, 0, 1, 1,
1.19575, -1.015268, 2.896533, 1, 0, 0, 1, 1,
1.211023, -0.5489568, 2.410771, 0, 0, 0, 1, 1,
1.220827, 0.4943615, 0.1881182, 0, 0, 0, 1, 1,
1.230458, 0.3270613, 1.732237, 0, 0, 0, 1, 1,
1.233073, -1.102904, 4.112729, 0, 0, 0, 1, 1,
1.247594, 1.017871, 0.336892, 0, 0, 0, 1, 1,
1.247666, 0.06361614, 0.2803323, 0, 0, 0, 1, 1,
1.254995, -1.549119, 2.363745, 0, 0, 0, 1, 1,
1.25518, -0.9668217, 1.345245, 1, 1, 1, 1, 1,
1.25597, 2.912696, -1.397934, 1, 1, 1, 1, 1,
1.258987, -0.6989587, 3.845058, 1, 1, 1, 1, 1,
1.275751, 1.844143, 1.840367, 1, 1, 1, 1, 1,
1.275917, 0.7995628, 1.186753, 1, 1, 1, 1, 1,
1.282267, 0.1430142, 1.947751, 1, 1, 1, 1, 1,
1.285629, -2.354713, 2.837961, 1, 1, 1, 1, 1,
1.286068, 0.08586899, 2.970083, 1, 1, 1, 1, 1,
1.30213, 0.6755391, -1.447473, 1, 1, 1, 1, 1,
1.31259, -0.4309345, 0.8034769, 1, 1, 1, 1, 1,
1.313156, -0.3056151, 2.88225, 1, 1, 1, 1, 1,
1.319781, -0.6432484, 2.454121, 1, 1, 1, 1, 1,
1.326446, 0.2178745, -1.246212, 1, 1, 1, 1, 1,
1.332686, -0.6239315, 3.366821, 1, 1, 1, 1, 1,
1.35266, -0.5623744, 2.932827, 1, 1, 1, 1, 1,
1.362105, 1.116652, -0.2513678, 0, 0, 1, 1, 1,
1.373643, -0.3825977, 1.190543, 1, 0, 0, 1, 1,
1.382234, 1.662913, 0.6834123, 1, 0, 0, 1, 1,
1.386078, 1.510833, 1.284067, 1, 0, 0, 1, 1,
1.393136, 0.9672188, -0.743238, 1, 0, 0, 1, 1,
1.393777, -1.516348, 2.498447, 1, 0, 0, 1, 1,
1.399742, 0.8373657, -0.1674161, 0, 0, 0, 1, 1,
1.401018, 1.328318, 0.1533733, 0, 0, 0, 1, 1,
1.402859, -1.266256, 3.12252, 0, 0, 0, 1, 1,
1.405884, 1.756041, 0.6462191, 0, 0, 0, 1, 1,
1.417559, 0.1457111, 0.8312807, 0, 0, 0, 1, 1,
1.422082, 0.4677649, -0.2903537, 0, 0, 0, 1, 1,
1.452836, -0.1934118, 2.284361, 0, 0, 0, 1, 1,
1.46394, -1.952621, 1.870118, 1, 1, 1, 1, 1,
1.479926, -0.004673908, 1.630603, 1, 1, 1, 1, 1,
1.483751, -1.044344, 0.4732757, 1, 1, 1, 1, 1,
1.485451, 1.005749, 2.027856, 1, 1, 1, 1, 1,
1.487913, -0.3282767, 4.149319, 1, 1, 1, 1, 1,
1.489299, 0.7901909, 0.5571498, 1, 1, 1, 1, 1,
1.493662, 0.1076118, 1.678735, 1, 1, 1, 1, 1,
1.498149, 0.9739087, -0.6688496, 1, 1, 1, 1, 1,
1.498266, 0.8143489, 1.781882, 1, 1, 1, 1, 1,
1.50003, 0.8676878, 0.8711556, 1, 1, 1, 1, 1,
1.500048, 2.350445, 0.08575507, 1, 1, 1, 1, 1,
1.506548, -0.8941986, 1.76017, 1, 1, 1, 1, 1,
1.51193, -1.421359, 2.380493, 1, 1, 1, 1, 1,
1.531371, -0.9657667, 2.195251, 1, 1, 1, 1, 1,
1.545196, -1.366778, 2.29737, 1, 1, 1, 1, 1,
1.547165, -0.5332779, 2.363002, 0, 0, 1, 1, 1,
1.553732, -2.336776, 1.793076, 1, 0, 0, 1, 1,
1.560589, -0.9600237, 2.203274, 1, 0, 0, 1, 1,
1.565421, 0.01386276, 1.579212, 1, 0, 0, 1, 1,
1.58603, 0.234825, 2.245043, 1, 0, 0, 1, 1,
1.590378, 0.08832934, 0.6931211, 1, 0, 0, 1, 1,
1.596262, 1.062061, 1.988217, 0, 0, 0, 1, 1,
1.611189, -0.7891717, 2.527312, 0, 0, 0, 1, 1,
1.632452, -1.244096, 3.074069, 0, 0, 0, 1, 1,
1.641925, 1.861751, 1.763713, 0, 0, 0, 1, 1,
1.643894, 0.3390024, 1.745877, 0, 0, 0, 1, 1,
1.655269, -1.525146, 2.28489, 0, 0, 0, 1, 1,
1.663392, 0.04109409, 4.400821, 0, 0, 0, 1, 1,
1.669708, -0.6210914, 2.679553, 1, 1, 1, 1, 1,
1.675004, 0.4887569, 0.9678053, 1, 1, 1, 1, 1,
1.689339, -0.07163081, 3.259526, 1, 1, 1, 1, 1,
1.689469, 1.265939, 0.5447989, 1, 1, 1, 1, 1,
1.692852, -1.031227, 4.383284, 1, 1, 1, 1, 1,
1.703892, -0.2201896, 1.518622, 1, 1, 1, 1, 1,
1.71042, 1.303815, 0.2220756, 1, 1, 1, 1, 1,
1.719503, 0.9517129, 2.791338, 1, 1, 1, 1, 1,
1.720324, 0.7510712, -0.1078393, 1, 1, 1, 1, 1,
1.739389, 1.203479, 2.006083, 1, 1, 1, 1, 1,
1.750516, 1.582848, -0.1765197, 1, 1, 1, 1, 1,
1.770529, -0.6858492, 3.726259, 1, 1, 1, 1, 1,
1.808306, -0.7568322, 0.8224949, 1, 1, 1, 1, 1,
1.817637, 1.371493, 0.5905133, 1, 1, 1, 1, 1,
1.857455, -0.4701318, 2.145758, 1, 1, 1, 1, 1,
1.868101, 0.09065343, 2.744629, 0, 0, 1, 1, 1,
1.914843, 0.6245088, 0.9863398, 1, 0, 0, 1, 1,
1.923561, 0.1849977, 1.992125, 1, 0, 0, 1, 1,
1.968274, -1.061182, 1.691939, 1, 0, 0, 1, 1,
1.974215, -0.07337022, 2.537339, 1, 0, 0, 1, 1,
2.011164, 0.381287, 1.14955, 1, 0, 0, 1, 1,
2.020612, 0.6456896, 2.88206, 0, 0, 0, 1, 1,
2.068862, -0.4674498, 2.412627, 0, 0, 0, 1, 1,
2.173934, 0.1826062, 2.731123, 0, 0, 0, 1, 1,
2.219659, 1.443185, 1.766911, 0, 0, 0, 1, 1,
2.240352, 0.994872, 2.1401, 0, 0, 0, 1, 1,
2.242743, 2.439393, 0.9835235, 0, 0, 0, 1, 1,
2.269149, -2.084711, 2.186905, 0, 0, 0, 1, 1,
2.284475, -0.1172771, 3.912815, 1, 1, 1, 1, 1,
2.328443, -0.1366871, 3.432383, 1, 1, 1, 1, 1,
2.401188, 0.01973537, 3.317222, 1, 1, 1, 1, 1,
2.725338, 1.884618, 0.4953732, 1, 1, 1, 1, 1,
2.787974, 0.1096547, 1.942457, 1, 1, 1, 1, 1,
2.828311, -0.4323141, 1.373977, 1, 1, 1, 1, 1,
2.914698, 0.4297606, 0.02876904, 1, 1, 1, 1, 1
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
var radius = 9.733543;
var distance = 34.18866;
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
mvMatrix.translate( 0.4309219, 0.4089108, 0.30528 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18866);
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
