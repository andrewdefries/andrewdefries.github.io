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
-4.12108, -1.728142, -1.549067, 1, 0, 0, 1,
-2.939583, 1.811567, 0.07534275, 1, 0.007843138, 0, 1,
-2.71554, 0.3380872, 0.07235014, 1, 0.01176471, 0, 1,
-2.665938, 0.06655843, -1.294601, 1, 0.01960784, 0, 1,
-2.544631, -1.285321, -5.751153, 1, 0.02352941, 0, 1,
-2.543926, 0.09599841, -1.511987, 1, 0.03137255, 0, 1,
-2.459638, 0.3617641, -1.124022, 1, 0.03529412, 0, 1,
-2.430067, 0.4578574, -1.656352, 1, 0.04313726, 0, 1,
-2.408168, 0.6648867, -2.779069, 1, 0.04705882, 0, 1,
-2.363211, 1.592509, -1.394589, 1, 0.05490196, 0, 1,
-2.316923, 1.650451, 0.3155095, 1, 0.05882353, 0, 1,
-2.280957, 1.343095, -1.893208, 1, 0.06666667, 0, 1,
-2.250846, 0.7092412, -0.8130707, 1, 0.07058824, 0, 1,
-2.178843, 1.340674, -2.151681, 1, 0.07843138, 0, 1,
-2.171194, 0.5135311, -1.575343, 1, 0.08235294, 0, 1,
-2.097399, 2.155133, -0.3376834, 1, 0.09019608, 0, 1,
-2.072339, 1.875285, -1.024136, 1, 0.09411765, 0, 1,
-2.070679, 0.9182868, -1.824266, 1, 0.1019608, 0, 1,
-2.046425, -1.939206, -1.947633, 1, 0.1098039, 0, 1,
-2.024871, -1.199266, -2.153116, 1, 0.1137255, 0, 1,
-1.981634, -3.641786, -3.383443, 1, 0.1215686, 0, 1,
-1.977647, -0.2454602, -0.2982066, 1, 0.1254902, 0, 1,
-1.956387, 0.3087001, -0.8104526, 1, 0.1333333, 0, 1,
-1.918445, -0.4426536, -1.199082, 1, 0.1372549, 0, 1,
-1.913654, -1.962481, -4.17074, 1, 0.145098, 0, 1,
-1.901748, 0.7282745, -1.237077, 1, 0.1490196, 0, 1,
-1.895769, 0.2757619, -0.4223318, 1, 0.1568628, 0, 1,
-1.893906, 0.487174, -1.410119, 1, 0.1607843, 0, 1,
-1.891884, -0.08489851, -0.4812961, 1, 0.1686275, 0, 1,
-1.880835, -2.395903, -2.455293, 1, 0.172549, 0, 1,
-1.864989, -0.8586857, -0.6365674, 1, 0.1803922, 0, 1,
-1.85862, -0.6025027, -1.23524, 1, 0.1843137, 0, 1,
-1.851479, -0.6382031, -2.00376, 1, 0.1921569, 0, 1,
-1.832291, -0.3582418, -1.76499, 1, 0.1960784, 0, 1,
-1.815714, -1.119699, -2.937656, 1, 0.2039216, 0, 1,
-1.804308, -1.322449, -1.389937, 1, 0.2117647, 0, 1,
-1.798259, -1.681543, -1.874195, 1, 0.2156863, 0, 1,
-1.79473, 0.1123992, -1.506327, 1, 0.2235294, 0, 1,
-1.775975, -1.952352, -1.098665, 1, 0.227451, 0, 1,
-1.756771, 0.413884, -1.057345, 1, 0.2352941, 0, 1,
-1.754359, 0.4644536, -0.915958, 1, 0.2392157, 0, 1,
-1.716454, -2.287333, -5.618808, 1, 0.2470588, 0, 1,
-1.711965, 0.09334097, -1.294405, 1, 0.2509804, 0, 1,
-1.677184, 1.799002, -0.4460284, 1, 0.2588235, 0, 1,
-1.672543, 1.622557, -1.006564, 1, 0.2627451, 0, 1,
-1.660823, -1.254732, -2.288255, 1, 0.2705882, 0, 1,
-1.659611, -1.752742, -2.003197, 1, 0.2745098, 0, 1,
-1.653436, 0.4132405, -1.91611, 1, 0.282353, 0, 1,
-1.646958, 0.3877891, -2.297381, 1, 0.2862745, 0, 1,
-1.632192, 0.9737502, -0.9489417, 1, 0.2941177, 0, 1,
-1.61899, -1.66981, -1.613132, 1, 0.3019608, 0, 1,
-1.612022, 0.4456184, -2.150203, 1, 0.3058824, 0, 1,
-1.602655, 0.8200176, -3.28089, 1, 0.3137255, 0, 1,
-1.571808, -0.8537288, -1.765468, 1, 0.3176471, 0, 1,
-1.537693, -0.08684737, -2.180943, 1, 0.3254902, 0, 1,
-1.536958, -0.7353712, -1.226145, 1, 0.3294118, 0, 1,
-1.513256, 0.2313981, -2.240123, 1, 0.3372549, 0, 1,
-1.507609, 1.27475, -2.745883, 1, 0.3411765, 0, 1,
-1.501591, 0.2436265, -0.6912078, 1, 0.3490196, 0, 1,
-1.483046, 1.115096, 0.6092162, 1, 0.3529412, 0, 1,
-1.47911, 0.2557153, -1.098041, 1, 0.3607843, 0, 1,
-1.459598, 0.4557523, -2.086238, 1, 0.3647059, 0, 1,
-1.458372, -1.235746, -3.455462, 1, 0.372549, 0, 1,
-1.440708, 0.2470949, -1.721294, 1, 0.3764706, 0, 1,
-1.435931, 1.528228, -0.4976869, 1, 0.3843137, 0, 1,
-1.434433, 0.04619271, -1.803624, 1, 0.3882353, 0, 1,
-1.43282, 0.1155222, -1.424391, 1, 0.3960784, 0, 1,
-1.425933, -0.4140517, -0.8224379, 1, 0.4039216, 0, 1,
-1.416606, 0.6188118, 0.4031287, 1, 0.4078431, 0, 1,
-1.406813, 0.08869695, -1.326971, 1, 0.4156863, 0, 1,
-1.404366, 0.1270308, -2.065762, 1, 0.4196078, 0, 1,
-1.401643, 0.3609076, -0.07242824, 1, 0.427451, 0, 1,
-1.396898, 1.273547, -1.932124, 1, 0.4313726, 0, 1,
-1.393133, -0.7393148, -3.605056, 1, 0.4392157, 0, 1,
-1.380261, 1.210339, -0.9671357, 1, 0.4431373, 0, 1,
-1.37911, 1.604785, -0.03528397, 1, 0.4509804, 0, 1,
-1.37657, 1.266314, -0.5231263, 1, 0.454902, 0, 1,
-1.36781, 0.4892225, -3.005083, 1, 0.4627451, 0, 1,
-1.343402, 0.3868621, -3.258704, 1, 0.4666667, 0, 1,
-1.341986, -1.547433, -3.733081, 1, 0.4745098, 0, 1,
-1.327393, -0.8159255, -3.750694, 1, 0.4784314, 0, 1,
-1.312599, -0.4411122, -0.3371339, 1, 0.4862745, 0, 1,
-1.302696, 1.934085, -0.7821861, 1, 0.4901961, 0, 1,
-1.29389, 0.2869229, -1.736651, 1, 0.4980392, 0, 1,
-1.285808, 0.03175041, -1.700779, 1, 0.5058824, 0, 1,
-1.28336, -0.8086877, -1.585803, 1, 0.509804, 0, 1,
-1.278637, -1.824322, -2.159056, 1, 0.5176471, 0, 1,
-1.273159, -0.6994938, -2.127126, 1, 0.5215687, 0, 1,
-1.269981, 0.2260475, -1.080742, 1, 0.5294118, 0, 1,
-1.261053, 0.8213404, -1.839524, 1, 0.5333334, 0, 1,
-1.255547, 1.259474, -0.2402633, 1, 0.5411765, 0, 1,
-1.249405, -1.288951, -3.093607, 1, 0.5450981, 0, 1,
-1.242732, 1.748979, -0.914776, 1, 0.5529412, 0, 1,
-1.231952, 0.734406, -0.2237313, 1, 0.5568628, 0, 1,
-1.229139, 0.4430283, -1.926724, 1, 0.5647059, 0, 1,
-1.225512, -0.1519632, -0.5315957, 1, 0.5686275, 0, 1,
-1.224424, 1.562654, 0.2943524, 1, 0.5764706, 0, 1,
-1.222187, -1.514163, -2.208709, 1, 0.5803922, 0, 1,
-1.222124, -1.905218, -3.709288, 1, 0.5882353, 0, 1,
-1.21248, 1.55706, 0.4919207, 1, 0.5921569, 0, 1,
-1.207901, 0.6749586, -0.5019429, 1, 0.6, 0, 1,
-1.201733, 0.7195432, -1.692484, 1, 0.6078432, 0, 1,
-1.201194, 1.040181, -0.9808467, 1, 0.6117647, 0, 1,
-1.196326, 1.007236, -0.6449506, 1, 0.6196079, 0, 1,
-1.194015, 0.08128792, -0.5079706, 1, 0.6235294, 0, 1,
-1.18955, -0.0919802, -0.338717, 1, 0.6313726, 0, 1,
-1.18847, -0.7326265, -4.626243, 1, 0.6352941, 0, 1,
-1.186846, 1.389243, 1.73999, 1, 0.6431373, 0, 1,
-1.184066, -1.274937, -1.100076, 1, 0.6470588, 0, 1,
-1.180815, 0.1110123, -1.768259, 1, 0.654902, 0, 1,
-1.177427, 0.3662094, 1.17838, 1, 0.6588235, 0, 1,
-1.171407, -1.125449, -0.8565967, 1, 0.6666667, 0, 1,
-1.16763, -1.874394, -2.74924, 1, 0.6705883, 0, 1,
-1.164344, 0.09388354, -2.902419, 1, 0.6784314, 0, 1,
-1.160131, -0.460752, -3.103174, 1, 0.682353, 0, 1,
-1.150752, -1.080072, -2.157954, 1, 0.6901961, 0, 1,
-1.148117, -0.7741525, -1.921284, 1, 0.6941177, 0, 1,
-1.144403, -1.019513, -2.850349, 1, 0.7019608, 0, 1,
-1.143349, -0.8765805, -1.692993, 1, 0.7098039, 0, 1,
-1.135774, -0.926041, -1.637408, 1, 0.7137255, 0, 1,
-1.127629, 0.7981509, -2.312083, 1, 0.7215686, 0, 1,
-1.121845, 0.8507497, -2.943747, 1, 0.7254902, 0, 1,
-1.118248, 0.4044574, -1.650532, 1, 0.7333333, 0, 1,
-1.110943, -1.021385, -1.988746, 1, 0.7372549, 0, 1,
-1.087267, -1.928661, -2.964872, 1, 0.7450981, 0, 1,
-1.081769, 0.5256324, -2.207845, 1, 0.7490196, 0, 1,
-1.075517, -0.2109463, -0.996749, 1, 0.7568628, 0, 1,
-1.072016, -0.4121999, -1.781309, 1, 0.7607843, 0, 1,
-1.070761, 0.4421341, -1.084031, 1, 0.7686275, 0, 1,
-1.069985, -1.125975, -1.334241, 1, 0.772549, 0, 1,
-1.063089, 0.3507009, -0.6636492, 1, 0.7803922, 0, 1,
-1.060373, 0.244204, -2.331665, 1, 0.7843137, 0, 1,
-1.058869, -0.1651951, 0.06312844, 1, 0.7921569, 0, 1,
-1.057271, -1.526574, -3.311574, 1, 0.7960784, 0, 1,
-1.053474, 0.735992, -1.248143, 1, 0.8039216, 0, 1,
-1.052948, -1.503509, -2.404209, 1, 0.8117647, 0, 1,
-1.052186, -1.731216, -4.570257, 1, 0.8156863, 0, 1,
-1.041781, -0.8017756, -1.201722, 1, 0.8235294, 0, 1,
-1.041121, 1.08865, 0.8048515, 1, 0.827451, 0, 1,
-1.032851, -0.1136886, -2.429449, 1, 0.8352941, 0, 1,
-1.030335, 0.242653, -3.202551, 1, 0.8392157, 0, 1,
-1.028355, -0.9479907, -2.421597, 1, 0.8470588, 0, 1,
-1.013954, -0.5756003, -1.73383, 1, 0.8509804, 0, 1,
-1.003457, 0.1970916, -1.431882, 1, 0.8588235, 0, 1,
-1.001443, 0.913727, -0.9237286, 1, 0.8627451, 0, 1,
-1.000397, -0.1994479, -3.620419, 1, 0.8705882, 0, 1,
-0.9900501, 1.028076, -1.480852, 1, 0.8745098, 0, 1,
-0.9883744, -0.645299, -2.307642, 1, 0.8823529, 0, 1,
-0.9882513, -0.7881142, -2.307695, 1, 0.8862745, 0, 1,
-0.9874915, 1.239586, -1.409848, 1, 0.8941177, 0, 1,
-0.9873937, 1.089932, -1.957612, 1, 0.8980392, 0, 1,
-0.9819523, -1.093101, 0.1974638, 1, 0.9058824, 0, 1,
-0.9803348, 0.1248178, -1.529128, 1, 0.9137255, 0, 1,
-0.9735513, -0.01430903, -1.550878, 1, 0.9176471, 0, 1,
-0.9699211, 2.417803, 0.3795034, 1, 0.9254902, 0, 1,
-0.9660041, -0.5422523, -2.746811, 1, 0.9294118, 0, 1,
-0.9632528, 0.610759, -0.9998515, 1, 0.9372549, 0, 1,
-0.9631348, 0.9735916, -0.3764759, 1, 0.9411765, 0, 1,
-0.9626052, 1.914074, -0.4614834, 1, 0.9490196, 0, 1,
-0.9616632, 0.05442835, -0.3211579, 1, 0.9529412, 0, 1,
-0.9608732, -0.403181, -1.620449, 1, 0.9607843, 0, 1,
-0.9545004, -1.378886, -2.064653, 1, 0.9647059, 0, 1,
-0.9489833, -0.7116206, -2.731478, 1, 0.972549, 0, 1,
-0.9438819, 0.1378556, -2.39876, 1, 0.9764706, 0, 1,
-0.9421034, 0.8740617, -0.5011454, 1, 0.9843137, 0, 1,
-0.9338205, -0.147789, -1.962837, 1, 0.9882353, 0, 1,
-0.9281593, 0.2168887, -2.314403, 1, 0.9960784, 0, 1,
-0.9274317, -0.0317691, -2.446696, 0.9960784, 1, 0, 1,
-0.9259205, 0.3374357, -1.490656, 0.9921569, 1, 0, 1,
-0.9230472, -2.089438, -4.391272, 0.9843137, 1, 0, 1,
-0.9220521, -0.3054291, -1.534681, 0.9803922, 1, 0, 1,
-0.9204897, -1.953165, -2.475615, 0.972549, 1, 0, 1,
-0.9078013, 0.3698668, -0.08184455, 0.9686275, 1, 0, 1,
-0.9047016, -0.6323065, -0.230696, 0.9607843, 1, 0, 1,
-0.9039691, -0.9592648, 0.0119769, 0.9568627, 1, 0, 1,
-0.899121, 0.255488, -0.8233315, 0.9490196, 1, 0, 1,
-0.8976026, -0.4829859, -2.976228, 0.945098, 1, 0, 1,
-0.8955294, 0.7934569, -0.617779, 0.9372549, 1, 0, 1,
-0.894778, 1.731998, -1.472484, 0.9333333, 1, 0, 1,
-0.8908117, 0.7597724, -2.037044, 0.9254902, 1, 0, 1,
-0.8871948, -0.547577, -2.019722, 0.9215686, 1, 0, 1,
-0.8834175, 0.7594997, 0.3896551, 0.9137255, 1, 0, 1,
-0.8814402, -0.3882155, -1.197104, 0.9098039, 1, 0, 1,
-0.8785293, -1.505517, -3.013499, 0.9019608, 1, 0, 1,
-0.8738914, 0.6279268, -1.368223, 0.8941177, 1, 0, 1,
-0.8733008, 0.1606624, -1.478596, 0.8901961, 1, 0, 1,
-0.865074, 0.09553329, -0.8271292, 0.8823529, 1, 0, 1,
-0.864271, -0.7292237, -3.465468, 0.8784314, 1, 0, 1,
-0.8469157, -0.09735996, -1.178888, 0.8705882, 1, 0, 1,
-0.843197, -0.3116937, -1.424065, 0.8666667, 1, 0, 1,
-0.8345258, 0.4346204, -0.4781478, 0.8588235, 1, 0, 1,
-0.8294474, -0.05056383, -1.011872, 0.854902, 1, 0, 1,
-0.8208858, -0.07457249, -3.54974, 0.8470588, 1, 0, 1,
-0.8172037, -0.1697841, -3.339488, 0.8431373, 1, 0, 1,
-0.8164616, -2.039652, -1.908638, 0.8352941, 1, 0, 1,
-0.8137733, 0.03443715, -0.9979704, 0.8313726, 1, 0, 1,
-0.8123145, 0.9740945, 0.7025356, 0.8235294, 1, 0, 1,
-0.8121904, -0.5649018, -1.74144, 0.8196079, 1, 0, 1,
-0.8051686, -0.2519709, -0.6345841, 0.8117647, 1, 0, 1,
-0.7966814, -0.9394011, -2.831502, 0.8078431, 1, 0, 1,
-0.7931206, -0.7178057, -2.087432, 0.8, 1, 0, 1,
-0.7926679, -0.3748564, -1.18921, 0.7921569, 1, 0, 1,
-0.7922962, 0.7489482, -0.7508199, 0.7882353, 1, 0, 1,
-0.7913979, -0.3696684, -1.499384, 0.7803922, 1, 0, 1,
-0.7882156, -0.7975278, -0.2897019, 0.7764706, 1, 0, 1,
-0.7876874, -0.8638529, -1.874881, 0.7686275, 1, 0, 1,
-0.7831405, 1.642815, -2.554028, 0.7647059, 1, 0, 1,
-0.7812634, -0.9116765, -3.342996, 0.7568628, 1, 0, 1,
-0.7809232, -1.400354, -1.404643, 0.7529412, 1, 0, 1,
-0.7781736, -0.6117485, -2.366695, 0.7450981, 1, 0, 1,
-0.7719285, -0.826871, -2.168317, 0.7411765, 1, 0, 1,
-0.7678415, 0.325229, -3.03487, 0.7333333, 1, 0, 1,
-0.7635641, -0.8743315, -4.719663, 0.7294118, 1, 0, 1,
-0.7610675, 2.044607, -1.597287, 0.7215686, 1, 0, 1,
-0.7599163, 1.032055, -1.569291, 0.7176471, 1, 0, 1,
-0.7505286, 0.6199716, -3.594918, 0.7098039, 1, 0, 1,
-0.7461872, -0.1862767, -1.564295, 0.7058824, 1, 0, 1,
-0.743248, 0.2214493, -1.6333, 0.6980392, 1, 0, 1,
-0.7421615, 0.08348016, -1.057173, 0.6901961, 1, 0, 1,
-0.7400836, 0.7500836, -0.6007221, 0.6862745, 1, 0, 1,
-0.7369636, -0.9437386, -3.489555, 0.6784314, 1, 0, 1,
-0.7342402, -0.5685825, -2.31096, 0.6745098, 1, 0, 1,
-0.7329856, -0.6136269, -2.206239, 0.6666667, 1, 0, 1,
-0.7325342, -1.280993, -1.952511, 0.6627451, 1, 0, 1,
-0.7291692, -0.6279368, -0.9555652, 0.654902, 1, 0, 1,
-0.7241852, -0.6723801, -2.186427, 0.6509804, 1, 0, 1,
-0.7227176, -0.9793302, -2.279833, 0.6431373, 1, 0, 1,
-0.7117888, -1.518168, -3.051977, 0.6392157, 1, 0, 1,
-0.7051381, -0.08720355, -1.557632, 0.6313726, 1, 0, 1,
-0.7022485, -0.3467539, -2.921131, 0.627451, 1, 0, 1,
-0.6978753, 0.7705099, -0.62056, 0.6196079, 1, 0, 1,
-0.6955644, -0.4515074, -1.531743, 0.6156863, 1, 0, 1,
-0.6946269, -0.4808742, -1.261212, 0.6078432, 1, 0, 1,
-0.6912352, -0.06412835, -0.7176551, 0.6039216, 1, 0, 1,
-0.690287, 0.05693223, -0.9082443, 0.5960785, 1, 0, 1,
-0.6856992, -1.842462, -1.330691, 0.5882353, 1, 0, 1,
-0.6841288, 0.2392082, -2.631113, 0.5843138, 1, 0, 1,
-0.6840162, -1.453399, -3.426616, 0.5764706, 1, 0, 1,
-0.6809616, 0.7441904, 0.8208899, 0.572549, 1, 0, 1,
-0.6679693, 0.5604199, -1.749928, 0.5647059, 1, 0, 1,
-0.6674362, 0.1735858, -0.5769669, 0.5607843, 1, 0, 1,
-0.664687, 1.433755, -1.58187, 0.5529412, 1, 0, 1,
-0.658832, 1.599027, -0.6150258, 0.5490196, 1, 0, 1,
-0.6577646, 0.3338461, -1.084921, 0.5411765, 1, 0, 1,
-0.6558256, 0.4513073, -0.2355445, 0.5372549, 1, 0, 1,
-0.6482963, -0.2056005, -3.746338, 0.5294118, 1, 0, 1,
-0.6384884, -0.8020843, -4.531644, 0.5254902, 1, 0, 1,
-0.6377816, -0.2501255, -1.923778, 0.5176471, 1, 0, 1,
-0.6371394, -0.5106097, -2.449613, 0.5137255, 1, 0, 1,
-0.6362795, 1.616401, -0.7491337, 0.5058824, 1, 0, 1,
-0.6361397, -0.4650123, -2.957477, 0.5019608, 1, 0, 1,
-0.6337488, -0.5840458, -2.727811, 0.4941176, 1, 0, 1,
-0.6331496, -1.055532, -1.804966, 0.4862745, 1, 0, 1,
-0.6314813, 1.450634, -1.157201, 0.4823529, 1, 0, 1,
-0.6261324, -0.04388794, -1.149258, 0.4745098, 1, 0, 1,
-0.6249045, 0.3956924, -1.726317, 0.4705882, 1, 0, 1,
-0.6199989, 0.6761966, -1.14508, 0.4627451, 1, 0, 1,
-0.6199074, -0.8243444, -2.966275, 0.4588235, 1, 0, 1,
-0.6185932, 1.706142, 0.1409734, 0.4509804, 1, 0, 1,
-0.6145294, 0.7990205, -0.6118749, 0.4470588, 1, 0, 1,
-0.6128072, -1.177256, -2.305533, 0.4392157, 1, 0, 1,
-0.6094145, 0.00564227, -2.355001, 0.4352941, 1, 0, 1,
-0.6030105, -1.02472, -2.502129, 0.427451, 1, 0, 1,
-0.6017705, -0.03380163, -1.0557, 0.4235294, 1, 0, 1,
-0.5962162, -0.7305411, -2.752895, 0.4156863, 1, 0, 1,
-0.5934998, 0.5060263, 0.245035, 0.4117647, 1, 0, 1,
-0.5928085, -0.09727885, -0.9452888, 0.4039216, 1, 0, 1,
-0.5907151, 1.106132, -0.4492612, 0.3960784, 1, 0, 1,
-0.5887827, -0.5340241, -3.697502, 0.3921569, 1, 0, 1,
-0.5861619, -1.508142, -2.307498, 0.3843137, 1, 0, 1,
-0.5832818, -1.208249, -2.802805, 0.3803922, 1, 0, 1,
-0.5830641, -1.280284, -0.3971623, 0.372549, 1, 0, 1,
-0.5829074, 0.7231656, 0.3363639, 0.3686275, 1, 0, 1,
-0.5815138, 0.1122282, -1.236453, 0.3607843, 1, 0, 1,
-0.5806855, 1.318757, 0.6040224, 0.3568628, 1, 0, 1,
-0.5801213, 0.5669073, -1.307661, 0.3490196, 1, 0, 1,
-0.5696898, -0.7009511, -3.737223, 0.345098, 1, 0, 1,
-0.5665653, 0.8172467, -1.239413, 0.3372549, 1, 0, 1,
-0.5618298, -1.608711, -4.246479, 0.3333333, 1, 0, 1,
-0.560591, 1.401546, -0.6405855, 0.3254902, 1, 0, 1,
-0.5562786, -0.5712989, -2.236472, 0.3215686, 1, 0, 1,
-0.5539839, -0.4238494, -2.709189, 0.3137255, 1, 0, 1,
-0.5535939, -0.8618459, -0.7554241, 0.3098039, 1, 0, 1,
-0.5531583, -0.3507409, -0.7726061, 0.3019608, 1, 0, 1,
-0.5488444, 0.7176035, -0.9981576, 0.2941177, 1, 0, 1,
-0.5478168, 1.102075, 0.1974834, 0.2901961, 1, 0, 1,
-0.5437801, 0.6338554, 2.535939, 0.282353, 1, 0, 1,
-0.5415667, 0.1914646, -0.1067113, 0.2784314, 1, 0, 1,
-0.5391907, -0.3120193, -2.058604, 0.2705882, 1, 0, 1,
-0.5366039, -0.4578, -1.390307, 0.2666667, 1, 0, 1,
-0.5347708, -1.075893, -1.872341, 0.2588235, 1, 0, 1,
-0.5298327, -0.6223207, -0.9935802, 0.254902, 1, 0, 1,
-0.5280882, 0.857756, 0.2940564, 0.2470588, 1, 0, 1,
-0.5272197, -0.5265548, -2.889609, 0.2431373, 1, 0, 1,
-0.5053217, 1.725024, -0.8474197, 0.2352941, 1, 0, 1,
-0.5045751, 1.448649, -1.009865, 0.2313726, 1, 0, 1,
-0.5039168, -1.571392, -1.063721, 0.2235294, 1, 0, 1,
-0.5033597, 0.5121775, -1.544598, 0.2196078, 1, 0, 1,
-0.4960274, 1.183071, -1.216233, 0.2117647, 1, 0, 1,
-0.4934665, -0.8784146, -2.626733, 0.2078431, 1, 0, 1,
-0.490841, -0.1320278, -4.116223, 0.2, 1, 0, 1,
-0.4906341, -1.991167, -2.573185, 0.1921569, 1, 0, 1,
-0.4856833, -0.06181382, -1.313166, 0.1882353, 1, 0, 1,
-0.485333, 0.4728251, -0.6313245, 0.1803922, 1, 0, 1,
-0.4841866, -0.2077761, -1.860602, 0.1764706, 1, 0, 1,
-0.4838301, -1.156966, -2.614824, 0.1686275, 1, 0, 1,
-0.4726926, -2.377805, -2.088779, 0.1647059, 1, 0, 1,
-0.4712011, -0.5470248, -2.51216, 0.1568628, 1, 0, 1,
-0.470714, 1.597328, -0.1470541, 0.1529412, 1, 0, 1,
-0.4674653, -0.03807582, -1.149353, 0.145098, 1, 0, 1,
-0.4609559, 0.4871902, -0.9806833, 0.1411765, 1, 0, 1,
-0.4597945, -0.4737535, -2.530846, 0.1333333, 1, 0, 1,
-0.442636, 0.9556385, 0.2021369, 0.1294118, 1, 0, 1,
-0.4377025, -0.5899258, -3.05541, 0.1215686, 1, 0, 1,
-0.4368645, -0.2470343, -1.963951, 0.1176471, 1, 0, 1,
-0.4328412, -0.8391262, -2.500932, 0.1098039, 1, 0, 1,
-0.4317047, -0.5731072, -1.014142, 0.1058824, 1, 0, 1,
-0.4301634, 2.582086, 0.09511683, 0.09803922, 1, 0, 1,
-0.425343, -0.8743197, -2.278754, 0.09019608, 1, 0, 1,
-0.4249642, -0.04158596, -1.95255, 0.08627451, 1, 0, 1,
-0.4246626, -0.603767, -3.409151, 0.07843138, 1, 0, 1,
-0.4170917, 1.093696, -0.02674882, 0.07450981, 1, 0, 1,
-0.4161243, -1.066962, -4.770379, 0.06666667, 1, 0, 1,
-0.4132905, -0.1675975, -1.461355, 0.0627451, 1, 0, 1,
-0.4102039, -0.9913431, -4.268195, 0.05490196, 1, 0, 1,
-0.4065506, -0.05382499, -1.497276, 0.05098039, 1, 0, 1,
-0.4050184, 0.4632132, -1.735418, 0.04313726, 1, 0, 1,
-0.4039734, -0.140568, -0.5043389, 0.03921569, 1, 0, 1,
-0.4035968, 0.177042, -1.816629, 0.03137255, 1, 0, 1,
-0.400324, 2.496641, 0.03471377, 0.02745098, 1, 0, 1,
-0.4001812, 0.3658651, -1.612107, 0.01960784, 1, 0, 1,
-0.3991168, 1.002099, -2.05572, 0.01568628, 1, 0, 1,
-0.3971193, 0.1126427, -1.963236, 0.007843138, 1, 0, 1,
-0.3943897, 0.8991604, 0.2219216, 0.003921569, 1, 0, 1,
-0.3881703, -0.5095232, -2.075216, 0, 1, 0.003921569, 1,
-0.3843471, 0.6984809, 0.2278297, 0, 1, 0.01176471, 1,
-0.3833903, 0.5565595, -1.380492, 0, 1, 0.01568628, 1,
-0.3817111, -1.148409, -4.054858, 0, 1, 0.02352941, 1,
-0.3813211, 0.01271, -1.12707, 0, 1, 0.02745098, 1,
-0.376305, -2.209437, -3.045861, 0, 1, 0.03529412, 1,
-0.3675084, -0.1013713, -1.798184, 0, 1, 0.03921569, 1,
-0.3659238, 1.541836, -0.6881981, 0, 1, 0.04705882, 1,
-0.3639988, 1.34028, 0.4317956, 0, 1, 0.05098039, 1,
-0.3629904, 0.5076939, -1.360897, 0, 1, 0.05882353, 1,
-0.3625589, 1.574851, 0.1832913, 0, 1, 0.0627451, 1,
-0.360014, 0.3890514, -0.5235891, 0, 1, 0.07058824, 1,
-0.3592055, -0.4499608, -3.329244, 0, 1, 0.07450981, 1,
-0.3571306, -0.3008253, -2.668285, 0, 1, 0.08235294, 1,
-0.3550504, 0.6089237, 0.506457, 0, 1, 0.08627451, 1,
-0.3548921, 1.633551, 0.5804141, 0, 1, 0.09411765, 1,
-0.3523467, -0.9979293, -1.823832, 0, 1, 0.1019608, 1,
-0.3489632, 0.5661185, -0.5280357, 0, 1, 0.1058824, 1,
-0.3458133, 1.025862, 2.882875, 0, 1, 0.1137255, 1,
-0.3412098, -0.1504135, 1.349699, 0, 1, 0.1176471, 1,
-0.3372341, -0.6024082, -2.620323, 0, 1, 0.1254902, 1,
-0.3353892, -0.1380991, -2.818985, 0, 1, 0.1294118, 1,
-0.3343398, -1.853928, -4.763369, 0, 1, 0.1372549, 1,
-0.327798, -0.3809192, -2.175504, 0, 1, 0.1411765, 1,
-0.3270273, 0.1014406, -2.032355, 0, 1, 0.1490196, 1,
-0.3259814, -1.531514, -3.797417, 0, 1, 0.1529412, 1,
-0.3253022, -0.4075694, -2.298104, 0, 1, 0.1607843, 1,
-0.3225442, -0.5415901, -4.264845, 0, 1, 0.1647059, 1,
-0.312819, 0.3176161, -0.1298976, 0, 1, 0.172549, 1,
-0.310361, 0.3060118, -1.839232, 0, 1, 0.1764706, 1,
-0.3061078, -0.7791831, -2.861167, 0, 1, 0.1843137, 1,
-0.3056373, -0.9585848, -4.501512, 0, 1, 0.1882353, 1,
-0.302914, -0.4385396, -1.652834, 0, 1, 0.1960784, 1,
-0.3012285, 0.01573467, -1.54789, 0, 1, 0.2039216, 1,
-0.2993994, 0.886315, -0.4036255, 0, 1, 0.2078431, 1,
-0.2980821, 0.6294865, -1.164363, 0, 1, 0.2156863, 1,
-0.2947177, -1.143636, -0.9494068, 0, 1, 0.2196078, 1,
-0.2943703, -1.285148, -3.687414, 0, 1, 0.227451, 1,
-0.2894635, -0.5283128, -1.860973, 0, 1, 0.2313726, 1,
-0.2859911, -0.7032155, -2.101898, 0, 1, 0.2392157, 1,
-0.2847147, 0.2272445, -0.3960474, 0, 1, 0.2431373, 1,
-0.2841885, -0.7673987, -3.270427, 0, 1, 0.2509804, 1,
-0.2810623, 1.3253, -0.0704091, 0, 1, 0.254902, 1,
-0.2753486, -0.07252145, -0.6774973, 0, 1, 0.2627451, 1,
-0.2728327, 0.7697019, 0.324112, 0, 1, 0.2666667, 1,
-0.2691285, 0.8089333, 1.648459, 0, 1, 0.2745098, 1,
-0.2688839, -0.5065733, -2.208853, 0, 1, 0.2784314, 1,
-0.2673587, -1.010848, -2.319507, 0, 1, 0.2862745, 1,
-0.2591335, 0.06325593, -2.724953, 0, 1, 0.2901961, 1,
-0.2579272, 0.1966151, -1.510742, 0, 1, 0.2980392, 1,
-0.2572562, 1.451143, -0.360181, 0, 1, 0.3058824, 1,
-0.256371, -0.03809053, -2.210377, 0, 1, 0.3098039, 1,
-0.2547541, 1.340444, -0.8053159, 0, 1, 0.3176471, 1,
-0.2528362, -1.463327, -4.155115, 0, 1, 0.3215686, 1,
-0.241964, -0.440357, -3.286784, 0, 1, 0.3294118, 1,
-0.2414493, 0.3012767, -0.1486824, 0, 1, 0.3333333, 1,
-0.2395882, 1.408538, -1.403738, 0, 1, 0.3411765, 1,
-0.2355597, 1.592155, -0.7742852, 0, 1, 0.345098, 1,
-0.2352095, -0.2011209, -0.7337659, 0, 1, 0.3529412, 1,
-0.23379, -0.08151826, -2.293159, 0, 1, 0.3568628, 1,
-0.2264851, 0.3943732, -1.58909, 0, 1, 0.3647059, 1,
-0.2250783, -0.3870575, -4.539896, 0, 1, 0.3686275, 1,
-0.2241263, 0.1148709, -0.02231055, 0, 1, 0.3764706, 1,
-0.2239707, 0.9233803, -1.853953, 0, 1, 0.3803922, 1,
-0.2234319, -0.3428074, -1.087717, 0, 1, 0.3882353, 1,
-0.2231079, 1.403006, -0.2338553, 0, 1, 0.3921569, 1,
-0.222256, -0.1308186, -4.036548, 0, 1, 0.4, 1,
-0.2211915, 0.2350511, -0.9342236, 0, 1, 0.4078431, 1,
-0.2166944, -0.4614503, -2.831108, 0, 1, 0.4117647, 1,
-0.2160502, 0.122057, -1.026611, 0, 1, 0.4196078, 1,
-0.209031, 0.5611461, 1.031874, 0, 1, 0.4235294, 1,
-0.2087362, -1.612588, -3.624548, 0, 1, 0.4313726, 1,
-0.2075946, 0.1580554, -1.398147, 0, 1, 0.4352941, 1,
-0.2062724, 0.5137659, 0.9060722, 0, 1, 0.4431373, 1,
-0.2020522, 0.5714909, -0.8442413, 0, 1, 0.4470588, 1,
-0.2020347, -0.3195485, -3.293369, 0, 1, 0.454902, 1,
-0.2017654, 0.6674135, -0.4310052, 0, 1, 0.4588235, 1,
-0.1980854, 0.1417821, 0.1178546, 0, 1, 0.4666667, 1,
-0.1974137, 0.6434403, -0.5013816, 0, 1, 0.4705882, 1,
-0.1941667, -0.5192088, -3.614372, 0, 1, 0.4784314, 1,
-0.1939846, 0.4077983, 0.997079, 0, 1, 0.4823529, 1,
-0.1900713, -0.6322542, -1.56583, 0, 1, 0.4901961, 1,
-0.1866599, 0.2685899, 0.2954618, 0, 1, 0.4941176, 1,
-0.1865737, 1.469707, -1.840402, 0, 1, 0.5019608, 1,
-0.1863322, -0.4364917, -2.699079, 0, 1, 0.509804, 1,
-0.1862367, 0.1521067, -0.01384342, 0, 1, 0.5137255, 1,
-0.1859412, -0.3022846, -2.5635, 0, 1, 0.5215687, 1,
-0.1857835, 0.4770126, -2.594003, 0, 1, 0.5254902, 1,
-0.1820969, -0.2201455, -3.473529, 0, 1, 0.5333334, 1,
-0.1805204, 0.1574014, -1.005012, 0, 1, 0.5372549, 1,
-0.1790465, 1.023128, 0.4777704, 0, 1, 0.5450981, 1,
-0.1778888, 1.974693, 0.2454663, 0, 1, 0.5490196, 1,
-0.1757441, -0.7184923, -0.7782936, 0, 1, 0.5568628, 1,
-0.1757118, -0.3228212, -1.816271, 0, 1, 0.5607843, 1,
-0.168403, 0.2687525, -1.334102, 0, 1, 0.5686275, 1,
-0.16652, -2.154742, -2.866706, 0, 1, 0.572549, 1,
-0.1648501, 0.6211973, -1.46894, 0, 1, 0.5803922, 1,
-0.1640411, -3.425529, -2.675357, 0, 1, 0.5843138, 1,
-0.1581214, -0.4322837, -3.093235, 0, 1, 0.5921569, 1,
-0.1578344, 1.06887, 0.4807481, 0, 1, 0.5960785, 1,
-0.1515718, -0.2512877, -2.46711, 0, 1, 0.6039216, 1,
-0.1486116, 0.2449924, -0.4790629, 0, 1, 0.6117647, 1,
-0.1472749, 0.6026056, -0.02543454, 0, 1, 0.6156863, 1,
-0.1472632, 0.5202057, -0.7214167, 0, 1, 0.6235294, 1,
-0.1450491, -0.2803862, -2.725045, 0, 1, 0.627451, 1,
-0.1440961, 0.169769, -1.055784, 0, 1, 0.6352941, 1,
-0.1392635, -0.5368196, -4.015947, 0, 1, 0.6392157, 1,
-0.1369374, 0.04275594, -0.5813345, 0, 1, 0.6470588, 1,
-0.1349016, -0.8799364, -2.595954, 0, 1, 0.6509804, 1,
-0.1325741, -1.010494, -2.342613, 0, 1, 0.6588235, 1,
-0.1319181, 1.585011, 0.9769138, 0, 1, 0.6627451, 1,
-0.1194371, -0.7032178, -2.404665, 0, 1, 0.6705883, 1,
-0.1162602, 1.04441, -0.2297261, 0, 1, 0.6745098, 1,
-0.1146567, 0.9305704, -1.330528, 0, 1, 0.682353, 1,
-0.1144116, 0.6746817, 0.5745001, 0, 1, 0.6862745, 1,
-0.1137874, 1.157877, -1.402147, 0, 1, 0.6941177, 1,
-0.1106276, -0.8757536, -4.026819, 0, 1, 0.7019608, 1,
-0.1094116, 0.3672983, -0.9378499, 0, 1, 0.7058824, 1,
-0.1078116, -0.8464311, -1.464177, 0, 1, 0.7137255, 1,
-0.1074429, 0.03162168, -0.8691361, 0, 1, 0.7176471, 1,
-0.1049094, 2.511518, 0.7202573, 0, 1, 0.7254902, 1,
-0.1019069, -0.9205053, -3.226633, 0, 1, 0.7294118, 1,
-0.1000642, -0.7249809, -1.392759, 0, 1, 0.7372549, 1,
-0.08928744, -0.5002809, -4.048813, 0, 1, 0.7411765, 1,
-0.08838288, -0.9511694, -3.191878, 0, 1, 0.7490196, 1,
-0.0874823, -0.1095777, -2.251661, 0, 1, 0.7529412, 1,
-0.08577411, -0.9268978, -4.840024, 0, 1, 0.7607843, 1,
-0.08572567, -0.5194899, -2.919318, 0, 1, 0.7647059, 1,
-0.07612058, -0.2490095, -2.893038, 0, 1, 0.772549, 1,
-0.07196004, -1.661216, -2.607571, 0, 1, 0.7764706, 1,
-0.06890266, 0.9033753, 0.8358478, 0, 1, 0.7843137, 1,
-0.06642658, -1.161119, -3.042798, 0, 1, 0.7882353, 1,
-0.064743, -0.4079595, -4.018683, 0, 1, 0.7960784, 1,
-0.0631246, 1.093799, -0.6346808, 0, 1, 0.8039216, 1,
-0.06015276, -0.9987496, -0.139308, 0, 1, 0.8078431, 1,
-0.0594684, 0.2288635, 0.9633163, 0, 1, 0.8156863, 1,
-0.05704907, 0.8665826, -1.261874, 0, 1, 0.8196079, 1,
-0.05233082, -0.7662613, -2.11916, 0, 1, 0.827451, 1,
-0.0521966, 0.2588814, 1.85967, 0, 1, 0.8313726, 1,
-0.05058431, 0.1323151, -1.247171, 0, 1, 0.8392157, 1,
-0.0497467, 0.6969413, -0.2056333, 0, 1, 0.8431373, 1,
-0.04462776, 0.5886432, 0.6066892, 0, 1, 0.8509804, 1,
-0.04273546, 2.270294, 0.1372307, 0, 1, 0.854902, 1,
-0.03767461, -0.3770652, -2.275132, 0, 1, 0.8627451, 1,
-0.03566941, 0.0399532, -1.608002, 0, 1, 0.8666667, 1,
-0.03112183, -2.059491, -4.961497, 0, 1, 0.8745098, 1,
-0.03077431, -0.1362824, -2.942921, 0, 1, 0.8784314, 1,
-0.03074408, -0.7241002, -4.811854, 0, 1, 0.8862745, 1,
-0.02965669, -2.101461, -4.217824, 0, 1, 0.8901961, 1,
-0.0275918, 0.5259743, 0.530432, 0, 1, 0.8980392, 1,
-0.02645168, -0.3036181, -4.864231, 0, 1, 0.9058824, 1,
-0.02601998, 0.6434093, -0.7589563, 0, 1, 0.9098039, 1,
-0.0245498, 0.6955662, 1.547513, 0, 1, 0.9176471, 1,
-0.02423725, -0.4206766, -3.243243, 0, 1, 0.9215686, 1,
-0.0240594, -0.2358043, -2.16287, 0, 1, 0.9294118, 1,
-0.0211495, 0.1216153, -1.701405, 0, 1, 0.9333333, 1,
-0.02065489, 0.3639125, -1.205868, 0, 1, 0.9411765, 1,
-0.0188775, 0.5221567, 0.8568387, 0, 1, 0.945098, 1,
-0.01862975, 0.06564043, -0.4310925, 0, 1, 0.9529412, 1,
-0.01479258, 0.9679109, -0.7164391, 0, 1, 0.9568627, 1,
-0.01274401, -0.2061659, -0.8121904, 0, 1, 0.9647059, 1,
-0.01237584, 0.9103444, 1.979747, 0, 1, 0.9686275, 1,
-0.01206232, 1.029743, -1.908649, 0, 1, 0.9764706, 1,
-0.01017963, 0.3110403, 0.966859, 0, 1, 0.9803922, 1,
-0.009564201, 1.235102, -0.4193355, 0, 1, 0.9882353, 1,
-0.006640165, 0.8039207, -1.084982, 0, 1, 0.9921569, 1,
-0.00124883, 0.6205152, -2.34765, 0, 1, 1, 1,
0.0008229391, -1.343725, 2.460969, 0, 0.9921569, 1, 1,
0.004139944, -0.7153785, 5.248877, 0, 0.9882353, 1, 1,
0.004418951, 1.60157, 0.5737959, 0, 0.9803922, 1, 1,
0.007073241, -0.1677184, 0.548125, 0, 0.9764706, 1, 1,
0.009499574, -0.8031784, 3.215987, 0, 0.9686275, 1, 1,
0.01023713, -1.702969, 2.59577, 0, 0.9647059, 1, 1,
0.01317761, 0.6968911, -0.7573019, 0, 0.9568627, 1, 1,
0.01512423, -0.4101488, 3.169941, 0, 0.9529412, 1, 1,
0.0220567, 1.276534, -1.562883, 0, 0.945098, 1, 1,
0.02206889, 0.9039933, 0.881243, 0, 0.9411765, 1, 1,
0.02421715, -0.3180604, 2.183508, 0, 0.9333333, 1, 1,
0.02537284, -0.9161363, 4.839202, 0, 0.9294118, 1, 1,
0.02853109, 2.175868, 0.06904031, 0, 0.9215686, 1, 1,
0.03215093, 0.4211116, 0.8694207, 0, 0.9176471, 1, 1,
0.03285026, 0.003846152, 0.4333034, 0, 0.9098039, 1, 1,
0.03482946, -1.307776, 4.341527, 0, 0.9058824, 1, 1,
0.03666992, -0.6934015, 3.287279, 0, 0.8980392, 1, 1,
0.03667315, 1.77928, -0.133751, 0, 0.8901961, 1, 1,
0.03768743, 0.4617376, 0.9034647, 0, 0.8862745, 1, 1,
0.03793747, -0.4539539, 3.465436, 0, 0.8784314, 1, 1,
0.04406966, -0.7753245, 3.179374, 0, 0.8745098, 1, 1,
0.04677142, 0.2491763, 1.404391, 0, 0.8666667, 1, 1,
0.04862962, -0.6267687, 1.225134, 0, 0.8627451, 1, 1,
0.04982981, -0.1687396, 1.578652, 0, 0.854902, 1, 1,
0.05318702, -1.115519, 4.388797, 0, 0.8509804, 1, 1,
0.05685534, -0.9331706, 3.766733, 0, 0.8431373, 1, 1,
0.0579168, 0.5473347, 2.035354, 0, 0.8392157, 1, 1,
0.06440982, -0.04506206, 2.263032, 0, 0.8313726, 1, 1,
0.06468419, 0.9626207, -0.1203794, 0, 0.827451, 1, 1,
0.06720032, 0.4000914, 0.8458917, 0, 0.8196079, 1, 1,
0.06771352, 0.6462255, 0.5103208, 0, 0.8156863, 1, 1,
0.07064851, -0.3097525, 2.325305, 0, 0.8078431, 1, 1,
0.0708352, 0.373147, -1.575643, 0, 0.8039216, 1, 1,
0.07293531, 1.096856, -0.9778862, 0, 0.7960784, 1, 1,
0.07765561, -0.07078519, 2.374737, 0, 0.7882353, 1, 1,
0.0790682, 0.7461553, -0.4780594, 0, 0.7843137, 1, 1,
0.08054366, -0.2875274, 3.272112, 0, 0.7764706, 1, 1,
0.08098555, -0.6352335, 3.689664, 0, 0.772549, 1, 1,
0.08953603, 1.851346, 1.417487, 0, 0.7647059, 1, 1,
0.09392617, 1.463852, -0.7285835, 0, 0.7607843, 1, 1,
0.1013423, 1.700353, -3.02345, 0, 0.7529412, 1, 1,
0.101347, 1.06847, -0.3399801, 0, 0.7490196, 1, 1,
0.1044985, -0.7714061, 4.532882, 0, 0.7411765, 1, 1,
0.1081415, 0.02624679, 2.333734, 0, 0.7372549, 1, 1,
0.1107403, -0.5565888, 2.976392, 0, 0.7294118, 1, 1,
0.1180923, 0.3167793, 1.386142, 0, 0.7254902, 1, 1,
0.1182976, -2.309193, 3.72283, 0, 0.7176471, 1, 1,
0.1192985, -0.7885268, 3.64438, 0, 0.7137255, 1, 1,
0.1203225, 0.5239224, 1.5136, 0, 0.7058824, 1, 1,
0.1261909, 1.824478, -0.7712035, 0, 0.6980392, 1, 1,
0.1326032, 0.5002175, 1.416381, 0, 0.6941177, 1, 1,
0.1348987, 1.505728, -1.763871, 0, 0.6862745, 1, 1,
0.1390888, 0.6122082, 1.004145, 0, 0.682353, 1, 1,
0.1422638, -1.449632, 2.232098, 0, 0.6745098, 1, 1,
0.1458224, 1.140913, -0.6534481, 0, 0.6705883, 1, 1,
0.149084, 1.381764, 0.2092816, 0, 0.6627451, 1, 1,
0.1501896, 0.1443458, 0.2941959, 0, 0.6588235, 1, 1,
0.1553244, 0.2545044, 0.7715642, 0, 0.6509804, 1, 1,
0.1580216, -0.4689298, 2.398562, 0, 0.6470588, 1, 1,
0.1619215, 0.3188305, -0.2525075, 0, 0.6392157, 1, 1,
0.1670842, 1.611545, -0.378634, 0, 0.6352941, 1, 1,
0.1681116, -0.141592, 2.322324, 0, 0.627451, 1, 1,
0.1702784, 0.3671003, -0.8485007, 0, 0.6235294, 1, 1,
0.17485, -1.042055, 2.867462, 0, 0.6156863, 1, 1,
0.177039, 0.2385481, 1.058001, 0, 0.6117647, 1, 1,
0.1773847, -0.1308175, 2.944339, 0, 0.6039216, 1, 1,
0.1801227, 1.988173, -3.38845, 0, 0.5960785, 1, 1,
0.1920997, 1.663429, -0.3397003, 0, 0.5921569, 1, 1,
0.1933881, -1.251148, 4.01591, 0, 0.5843138, 1, 1,
0.1967942, 0.5662431, -0.2881334, 0, 0.5803922, 1, 1,
0.1994028, 0.3267972, 0.5765359, 0, 0.572549, 1, 1,
0.2003339, -1.267539, 1.949551, 0, 0.5686275, 1, 1,
0.2012772, -0.8705012, 3.314715, 0, 0.5607843, 1, 1,
0.2018591, 1.086185, -0.2795286, 0, 0.5568628, 1, 1,
0.2070106, 0.778195, 0.8417969, 0, 0.5490196, 1, 1,
0.2078287, 0.1880906, 1.256366, 0, 0.5450981, 1, 1,
0.2097689, -0.220888, 1.36579, 0, 0.5372549, 1, 1,
0.2159852, -0.248908, 1.888418, 0, 0.5333334, 1, 1,
0.2185418, 3.093758, 0.10573, 0, 0.5254902, 1, 1,
0.2205218, -0.1754486, 3.477234, 0, 0.5215687, 1, 1,
0.2245148, 0.5313122, 2.266535, 0, 0.5137255, 1, 1,
0.2250529, -0.2092601, 1.331249, 0, 0.509804, 1, 1,
0.2272971, 1.33069, 0.9744507, 0, 0.5019608, 1, 1,
0.2310214, -1.828013, 3.940365, 0, 0.4941176, 1, 1,
0.2312311, 1.757315, -1.440541, 0, 0.4901961, 1, 1,
0.2313973, -1.309698, 4.209611, 0, 0.4823529, 1, 1,
0.2318465, 0.6761873, 0.7402391, 0, 0.4784314, 1, 1,
0.2344318, -0.2976461, 2.067193, 0, 0.4705882, 1, 1,
0.2413337, -0.6887007, 1.252608, 0, 0.4666667, 1, 1,
0.2440522, 0.3994917, 1.300469, 0, 0.4588235, 1, 1,
0.2490446, -0.4812615, 1.183633, 0, 0.454902, 1, 1,
0.2492245, 0.2695656, 1.114902, 0, 0.4470588, 1, 1,
0.2534045, -0.2827179, 3.082353, 0, 0.4431373, 1, 1,
0.2536758, -0.9219885, 1.268155, 0, 0.4352941, 1, 1,
0.2537894, -0.4801852, 2.806627, 0, 0.4313726, 1, 1,
0.2556937, -0.1795288, 1.364483, 0, 0.4235294, 1, 1,
0.2593592, 0.9765901, 0.7439405, 0, 0.4196078, 1, 1,
0.261461, 0.8379472, -1.420957, 0, 0.4117647, 1, 1,
0.2639081, -2.088059, 3.883604, 0, 0.4078431, 1, 1,
0.2645546, 0.4213299, 0.831708, 0, 0.4, 1, 1,
0.2650259, 0.6042975, 0.6984149, 0, 0.3921569, 1, 1,
0.2656622, 1.526756, 1.556637, 0, 0.3882353, 1, 1,
0.2657652, 0.8105676, 0.2856018, 0, 0.3803922, 1, 1,
0.2693341, 1.217066, -0.2487334, 0, 0.3764706, 1, 1,
0.2706033, 0.4507979, 2.281851, 0, 0.3686275, 1, 1,
0.2732134, -0.7704883, 2.411931, 0, 0.3647059, 1, 1,
0.2732435, -2.955568, 3.092212, 0, 0.3568628, 1, 1,
0.2733723, -0.8981323, 4.174543, 0, 0.3529412, 1, 1,
0.2734467, -1.688734, 3.642609, 0, 0.345098, 1, 1,
0.273639, -0.6972492, 1.544525, 0, 0.3411765, 1, 1,
0.2764397, -0.9268528, 2.697175, 0, 0.3333333, 1, 1,
0.277339, -0.09965637, 2.054751, 0, 0.3294118, 1, 1,
0.2788739, -1.897517, 1.170531, 0, 0.3215686, 1, 1,
0.285901, -0.3856833, 3.713449, 0, 0.3176471, 1, 1,
0.2888127, 1.280788, -0.2815309, 0, 0.3098039, 1, 1,
0.2903689, 1.022035, 1.407091, 0, 0.3058824, 1, 1,
0.2909429, -1.05584, 3.333154, 0, 0.2980392, 1, 1,
0.2986732, -0.7282744, 1.383944, 0, 0.2901961, 1, 1,
0.299225, 0.3375369, -1.052652, 0, 0.2862745, 1, 1,
0.3024597, 0.8236455, 1.377986, 0, 0.2784314, 1, 1,
0.3064908, 0.3165937, 0.02751163, 0, 0.2745098, 1, 1,
0.3107012, -1.569011, 2.098989, 0, 0.2666667, 1, 1,
0.3135535, 0.5991119, -1.402097, 0, 0.2627451, 1, 1,
0.3139696, 0.2928108, -0.5205312, 0, 0.254902, 1, 1,
0.3197436, 0.04685367, 1.344197, 0, 0.2509804, 1, 1,
0.3207232, -1.070884, 3.673663, 0, 0.2431373, 1, 1,
0.3254624, 0.4235364, 1.926328, 0, 0.2392157, 1, 1,
0.3310177, -1.083764, 3.81461, 0, 0.2313726, 1, 1,
0.3332019, 0.9531806, 0.6968971, 0, 0.227451, 1, 1,
0.3343165, 1.671874, -0.3412056, 0, 0.2196078, 1, 1,
0.338099, -0.5606857, 2.609874, 0, 0.2156863, 1, 1,
0.3394235, 0.6405025, 1.184295, 0, 0.2078431, 1, 1,
0.3444566, 0.5100776, 1.287422, 0, 0.2039216, 1, 1,
0.3451165, -1.523084, 4.361324, 0, 0.1960784, 1, 1,
0.3479727, 2.660258, 1.264, 0, 0.1882353, 1, 1,
0.3520238, -0.3894135, 1.257837, 0, 0.1843137, 1, 1,
0.354284, -2.043355, 4.282101, 0, 0.1764706, 1, 1,
0.3561544, -0.9881315, 2.951568, 0, 0.172549, 1, 1,
0.358493, 0.9344441, 1.164729, 0, 0.1647059, 1, 1,
0.3637286, 0.0351491, 1.450085, 0, 0.1607843, 1, 1,
0.3641782, -0.3273437, 3.38798, 0, 0.1529412, 1, 1,
0.3654902, -1.193141, 1.895177, 0, 0.1490196, 1, 1,
0.3696277, -1.245859, 2.27661, 0, 0.1411765, 1, 1,
0.3714257, 0.49538, -0.05363521, 0, 0.1372549, 1, 1,
0.3728915, 1.416439, 1.165189, 0, 0.1294118, 1, 1,
0.3732598, -0.4798903, 1.832814, 0, 0.1254902, 1, 1,
0.373545, -0.8748507, 2.686833, 0, 0.1176471, 1, 1,
0.3738073, -0.6789742, 3.942773, 0, 0.1137255, 1, 1,
0.3772135, -1.464636, 2.6079, 0, 0.1058824, 1, 1,
0.3791662, 0.653886, 1.314489, 0, 0.09803922, 1, 1,
0.3799102, -0.7588622, 1.23715, 0, 0.09411765, 1, 1,
0.3842271, -0.6524787, 5.132821, 0, 0.08627451, 1, 1,
0.3863836, 1.699728, -0.1928876, 0, 0.08235294, 1, 1,
0.3871591, 1.036719, 1.056112, 0, 0.07450981, 1, 1,
0.3873367, -0.5210156, 2.096104, 0, 0.07058824, 1, 1,
0.3887976, -1.280098, 2.138839, 0, 0.0627451, 1, 1,
0.3892584, 0.3221725, 1.300804, 0, 0.05882353, 1, 1,
0.3921835, -0.9896671, 3.384465, 0, 0.05098039, 1, 1,
0.3934913, -0.09103978, 1.460817, 0, 0.04705882, 1, 1,
0.3937057, -1.041103, 1.774068, 0, 0.03921569, 1, 1,
0.39542, -0.3387175, 2.400497, 0, 0.03529412, 1, 1,
0.3969692, 1.149974, 0.4274224, 0, 0.02745098, 1, 1,
0.3973129, -1.160356, 1.976483, 0, 0.02352941, 1, 1,
0.4010686, 0.269022, 2.454388, 0, 0.01568628, 1, 1,
0.4031261, 0.7437181, 2.234356, 0, 0.01176471, 1, 1,
0.4049612, 0.6133847, 1.340138, 0, 0.003921569, 1, 1,
0.41558, 0.3010621, 2.632796, 0.003921569, 0, 1, 1,
0.4179306, -1.532111, 3.813114, 0.007843138, 0, 1, 1,
0.4186891, -1.079831, 1.928794, 0.01568628, 0, 1, 1,
0.4202117, -0.05650236, 2.068435, 0.01960784, 0, 1, 1,
0.4212679, 0.4549014, 0.8825883, 0.02745098, 0, 1, 1,
0.4248257, 0.652151, 1.173164, 0.03137255, 0, 1, 1,
0.4275557, -0.27363, 1.641051, 0.03921569, 0, 1, 1,
0.4291098, -1.887064, 2.253948, 0.04313726, 0, 1, 1,
0.4292488, 0.6020187, 1.097992, 0.05098039, 0, 1, 1,
0.4397432, -0.2093922, 2.434123, 0.05490196, 0, 1, 1,
0.4445835, 1.507386, -0.9316604, 0.0627451, 0, 1, 1,
0.4454668, 0.08143578, 2.749043, 0.06666667, 0, 1, 1,
0.4479198, -0.4335687, 3.276686, 0.07450981, 0, 1, 1,
0.4493344, -0.1001477, 3.379179, 0.07843138, 0, 1, 1,
0.4510645, 0.6858704, -0.6773596, 0.08627451, 0, 1, 1,
0.4514549, -0.8947031, 3.345685, 0.09019608, 0, 1, 1,
0.4539715, -0.2555864, 2.881407, 0.09803922, 0, 1, 1,
0.4603161, 0.2752081, 2.759018, 0.1058824, 0, 1, 1,
0.4604965, -1.137577, 1.453618, 0.1098039, 0, 1, 1,
0.4606797, -1.001027, 1.203426, 0.1176471, 0, 1, 1,
0.461044, 0.549289, 0.7556865, 0.1215686, 0, 1, 1,
0.471359, 0.479014, -0.1507318, 0.1294118, 0, 1, 1,
0.4850709, 0.6202834, 0.8738528, 0.1333333, 0, 1, 1,
0.4890164, 0.1029259, 0.7109091, 0.1411765, 0, 1, 1,
0.4915808, 0.5477939, 0.1143794, 0.145098, 0, 1, 1,
0.4925021, -1.478446, 1.72051, 0.1529412, 0, 1, 1,
0.493031, -0.2841286, 2.717539, 0.1568628, 0, 1, 1,
0.4984736, -1.131212, 3.517681, 0.1647059, 0, 1, 1,
0.4987911, -1.256333, 2.526228, 0.1686275, 0, 1, 1,
0.5008808, 0.2599729, 0.7250651, 0.1764706, 0, 1, 1,
0.5011704, -1.069744, 1.733316, 0.1803922, 0, 1, 1,
0.5022836, -0.4190482, 1.222307, 0.1882353, 0, 1, 1,
0.5030463, -0.8910195, 2.019379, 0.1921569, 0, 1, 1,
0.5052645, 0.1729282, 1.088451, 0.2, 0, 1, 1,
0.5058557, -1.78638, 2.979972, 0.2078431, 0, 1, 1,
0.5062029, 0.8826387, 0.5712169, 0.2117647, 0, 1, 1,
0.5067528, 0.4289234, 1.436168, 0.2196078, 0, 1, 1,
0.5123954, -1.001391, 4.373194, 0.2235294, 0, 1, 1,
0.5146899, -1.479483, 2.786263, 0.2313726, 0, 1, 1,
0.5162989, -0.3971147, 1.224879, 0.2352941, 0, 1, 1,
0.5186163, 1.631721, 0.1697642, 0.2431373, 0, 1, 1,
0.5198558, -0.167845, 1.507755, 0.2470588, 0, 1, 1,
0.5199292, 0.9848041, -1.818558, 0.254902, 0, 1, 1,
0.5244047, -1.637467, 2.039553, 0.2588235, 0, 1, 1,
0.5280775, 1.766072, 1.715637, 0.2666667, 0, 1, 1,
0.5287231, 0.4598866, 0.8963113, 0.2705882, 0, 1, 1,
0.5290632, 0.185118, 1.20227, 0.2784314, 0, 1, 1,
0.5291794, -1.663191, 2.589027, 0.282353, 0, 1, 1,
0.5336244, 0.6636791, 1.077385, 0.2901961, 0, 1, 1,
0.5357864, 0.402752, 0.8939933, 0.2941177, 0, 1, 1,
0.537212, -0.1947043, 2.992036, 0.3019608, 0, 1, 1,
0.5374553, 0.3177866, -0.7241704, 0.3098039, 0, 1, 1,
0.5420662, -1.008892, 3.68891, 0.3137255, 0, 1, 1,
0.5436796, -1.862358, 3.771024, 0.3215686, 0, 1, 1,
0.5451235, -0.1422427, 1.772933, 0.3254902, 0, 1, 1,
0.5457221, 0.2447232, 1.5275, 0.3333333, 0, 1, 1,
0.5493762, -0.9341267, 1.389142, 0.3372549, 0, 1, 1,
0.5506036, -0.6898555, 4.369754, 0.345098, 0, 1, 1,
0.5530233, -0.4124363, 2.440211, 0.3490196, 0, 1, 1,
0.5530278, 1.62794, -1.355699, 0.3568628, 0, 1, 1,
0.5530567, -0.445116, 2.390832, 0.3607843, 0, 1, 1,
0.5537726, 0.2503596, 0.6177872, 0.3686275, 0, 1, 1,
0.5566278, -0.3124971, 0.9850745, 0.372549, 0, 1, 1,
0.557197, -0.6311939, 4.179822, 0.3803922, 0, 1, 1,
0.5623541, -0.5043593, 2.922903, 0.3843137, 0, 1, 1,
0.5665334, -0.9874328, 1.837709, 0.3921569, 0, 1, 1,
0.5668982, -0.7830821, 1.875975, 0.3960784, 0, 1, 1,
0.5750729, 0.5569224, 2.33995, 0.4039216, 0, 1, 1,
0.5758904, 2.738162, -0.3467136, 0.4117647, 0, 1, 1,
0.5771721, 1.151238, 0.04561752, 0.4156863, 0, 1, 1,
0.5800397, 0.3447154, 1.548174, 0.4235294, 0, 1, 1,
0.5824635, -0.6090406, 3.582057, 0.427451, 0, 1, 1,
0.5852505, 1.856314, 0.5980663, 0.4352941, 0, 1, 1,
0.5856755, 0.6914499, 0.7971787, 0.4392157, 0, 1, 1,
0.5857381, -0.04077547, 1.746654, 0.4470588, 0, 1, 1,
0.5875832, 0.5981859, -0.4966783, 0.4509804, 0, 1, 1,
0.5916778, -1.03648, 1.358959, 0.4588235, 0, 1, 1,
0.596065, 0.7602586, 0.7316366, 0.4627451, 0, 1, 1,
0.5968943, -2.364153, 2.402247, 0.4705882, 0, 1, 1,
0.6061512, -0.3014953, 2.98173, 0.4745098, 0, 1, 1,
0.6079621, 0.8798609, -0.5192588, 0.4823529, 0, 1, 1,
0.6135985, 2.403119, 1.72563, 0.4862745, 0, 1, 1,
0.6147341, 0.6287954, 1.33829, 0.4941176, 0, 1, 1,
0.6159378, 0.2589, 0.8413902, 0.5019608, 0, 1, 1,
0.6170357, 0.09128819, 1.155153, 0.5058824, 0, 1, 1,
0.6180946, -0.1690432, -0.9254686, 0.5137255, 0, 1, 1,
0.6215744, 1.576655, -1.318559, 0.5176471, 0, 1, 1,
0.6216363, -0.1641838, 1.984665, 0.5254902, 0, 1, 1,
0.6239669, 1.037949, 0.9950349, 0.5294118, 0, 1, 1,
0.6407216, -0.09635571, 0.6676124, 0.5372549, 0, 1, 1,
0.6470757, 0.04050907, 1.321544, 0.5411765, 0, 1, 1,
0.6474528, 0.4250797, 0.6884205, 0.5490196, 0, 1, 1,
0.6495944, -1.09367, 3.955219, 0.5529412, 0, 1, 1,
0.6503815, 0.7994282, 1.95425, 0.5607843, 0, 1, 1,
0.6656628, 0.6829601, -0.8818192, 0.5647059, 0, 1, 1,
0.6671245, 0.4554476, 0.08679766, 0.572549, 0, 1, 1,
0.6687187, 0.002517528, 1.57551, 0.5764706, 0, 1, 1,
0.6744413, -0.4451246, 1.890876, 0.5843138, 0, 1, 1,
0.6776824, -3.4848, 4.054398, 0.5882353, 0, 1, 1,
0.6784157, 0.356258, 1.272977, 0.5960785, 0, 1, 1,
0.6827021, 0.3731673, 0.1453715, 0.6039216, 0, 1, 1,
0.6941397, 0.04904177, 0.7547117, 0.6078432, 0, 1, 1,
0.7043745, -0.7042757, 1.797934, 0.6156863, 0, 1, 1,
0.7073042, -0.9790689, 1.356899, 0.6196079, 0, 1, 1,
0.7249058, 0.5999306, 0.9385373, 0.627451, 0, 1, 1,
0.7249922, 0.03521197, 0.4930006, 0.6313726, 0, 1, 1,
0.7265316, 0.5902996, -0.08308896, 0.6392157, 0, 1, 1,
0.728933, 1.227111, 1.149781, 0.6431373, 0, 1, 1,
0.7316898, -0.2315777, 1.305978, 0.6509804, 0, 1, 1,
0.7322816, 1.940819, 0.7411184, 0.654902, 0, 1, 1,
0.7520525, 0.7832121, 1.714556, 0.6627451, 0, 1, 1,
0.7531417, -1.355926, 3.457114, 0.6666667, 0, 1, 1,
0.7533376, 0.1982921, 1.726427, 0.6745098, 0, 1, 1,
0.7555125, -0.5041109, 2.579002, 0.6784314, 0, 1, 1,
0.7614941, -0.5890524, 2.823473, 0.6862745, 0, 1, 1,
0.7634006, -0.5684022, 2.838523, 0.6901961, 0, 1, 1,
0.7652997, 1.571864, 1.453575, 0.6980392, 0, 1, 1,
0.7674346, 0.1722158, -1.148115, 0.7058824, 0, 1, 1,
0.767766, 1.622239, 1.157694, 0.7098039, 0, 1, 1,
0.7678449, 0.5153252, 1.245074, 0.7176471, 0, 1, 1,
0.7701147, -0.6585541, 3.368245, 0.7215686, 0, 1, 1,
0.7741268, 0.5999233, 1.214551, 0.7294118, 0, 1, 1,
0.7753077, -0.2118754, 0.9439896, 0.7333333, 0, 1, 1,
0.7790257, 0.2170655, 0.6161988, 0.7411765, 0, 1, 1,
0.7798584, -0.09278435, -0.1247088, 0.7450981, 0, 1, 1,
0.7806077, 0.1679884, 1.081732, 0.7529412, 0, 1, 1,
0.7848635, 0.8499317, 0.9802796, 0.7568628, 0, 1, 1,
0.7935708, -2.66572, 3.592325, 0.7647059, 0, 1, 1,
0.7969447, -0.2642513, 3.730686, 0.7686275, 0, 1, 1,
0.8012499, 0.3169659, 2.228909, 0.7764706, 0, 1, 1,
0.8045042, 1.31895, 0.6108315, 0.7803922, 0, 1, 1,
0.8057313, -1.960071, 2.984446, 0.7882353, 0, 1, 1,
0.8060722, -1.262911, 1.720637, 0.7921569, 0, 1, 1,
0.8077527, -0.8723053, 1.106607, 0.8, 0, 1, 1,
0.8088965, 2.35921, -0.09718239, 0.8078431, 0, 1, 1,
0.8103438, -1.766733, 4.505283, 0.8117647, 0, 1, 1,
0.812082, 0.6518049, -2.016296, 0.8196079, 0, 1, 1,
0.8140168, 0.04823, 0.2859718, 0.8235294, 0, 1, 1,
0.8170805, 0.5108765, 2.160098, 0.8313726, 0, 1, 1,
0.820956, -0.0271988, 0.6243601, 0.8352941, 0, 1, 1,
0.8222833, 0.893099, 0.659245, 0.8431373, 0, 1, 1,
0.823816, -0.813423, 2.414699, 0.8470588, 0, 1, 1,
0.8302168, -1.50774, 1.914248, 0.854902, 0, 1, 1,
0.8314415, 0.3499657, 1.122612, 0.8588235, 0, 1, 1,
0.8333628, -0.7311147, 1.527848, 0.8666667, 0, 1, 1,
0.8363059, -0.4251329, 0.7013488, 0.8705882, 0, 1, 1,
0.8365943, -0.8157281, 2.311543, 0.8784314, 0, 1, 1,
0.8375443, -0.1870462, 2.358914, 0.8823529, 0, 1, 1,
0.839892, -0.4387121, 3.126478, 0.8901961, 0, 1, 1,
0.848608, -1.124947, 1.984267, 0.8941177, 0, 1, 1,
0.8500635, 0.8005334, 0.2504214, 0.9019608, 0, 1, 1,
0.8508158, -1.220704, 0.8817195, 0.9098039, 0, 1, 1,
0.8510674, -0.2899144, 1.731273, 0.9137255, 0, 1, 1,
0.8511378, -1.403937, 3.557344, 0.9215686, 0, 1, 1,
0.8594025, 0.6403907, 1.992533, 0.9254902, 0, 1, 1,
0.8636121, -0.5188457, 1.231542, 0.9333333, 0, 1, 1,
0.8658655, 1.483447, 1.215683, 0.9372549, 0, 1, 1,
0.8768993, -1.029668, 0.1927297, 0.945098, 0, 1, 1,
0.8780518, 0.5898124, 0.7221372, 0.9490196, 0, 1, 1,
0.8781549, 0.2015391, 1.44539, 0.9568627, 0, 1, 1,
0.8802796, -1.107671, 2.991656, 0.9607843, 0, 1, 1,
0.8804128, -1.837245, 3.825009, 0.9686275, 0, 1, 1,
0.8806264, 0.540899, 0.4167011, 0.972549, 0, 1, 1,
0.8814735, -1.251312, 2.611132, 0.9803922, 0, 1, 1,
0.8974127, 1.112058, 1.642693, 0.9843137, 0, 1, 1,
0.8986902, -0.208077, 2.061231, 0.9921569, 0, 1, 1,
0.9044302, 1.033347, 0.9956353, 0.9960784, 0, 1, 1,
0.9058924, -0.2090217, 1.479667, 1, 0, 0.9960784, 1,
0.9068158, 0.01567648, 0.7576178, 1, 0, 0.9882353, 1,
0.9080692, -0.3191288, 3.150259, 1, 0, 0.9843137, 1,
0.9103483, -0.09222111, 1.467631, 1, 0, 0.9764706, 1,
0.9117792, 1.312973, -0.1161211, 1, 0, 0.972549, 1,
0.912152, 0.2860229, 0.4202153, 1, 0, 0.9647059, 1,
0.9129601, 1.074631, 1.218518, 1, 0, 0.9607843, 1,
0.9140758, -0.9042262, 3.903598, 1, 0, 0.9529412, 1,
0.9173622, -1.084982, 2.42796, 1, 0, 0.9490196, 1,
0.9283858, -0.271941, 2.68269, 1, 0, 0.9411765, 1,
0.9302449, 0.4463893, 1.381618, 1, 0, 0.9372549, 1,
0.9349654, -0.3751078, 0.779615, 1, 0, 0.9294118, 1,
0.936253, -0.8399668, 2.003181, 1, 0, 0.9254902, 1,
0.9378205, 0.341747, 0.5553159, 1, 0, 0.9176471, 1,
0.9395147, -0.09985181, 0.6669281, 1, 0, 0.9137255, 1,
0.9419765, 0.1025793, 2.110658, 1, 0, 0.9058824, 1,
0.9515983, 0.6501004, 0.7098975, 1, 0, 0.9019608, 1,
0.9524083, 0.2765068, 1.103167, 1, 0, 0.8941177, 1,
0.953549, 0.6302437, 2.271799, 1, 0, 0.8862745, 1,
0.9611921, -0.0840454, 1.663475, 1, 0, 0.8823529, 1,
0.9683717, 0.0790299, 0.1679006, 1, 0, 0.8745098, 1,
0.9684158, -0.4677075, 3.748157, 1, 0, 0.8705882, 1,
0.9758367, 1.860065, -0.4491857, 1, 0, 0.8627451, 1,
0.9826405, 1.618999, 1.626498, 1, 0, 0.8588235, 1,
0.9928958, -0.6964945, 4.24493, 1, 0, 0.8509804, 1,
1.001671, -1.38115, 2.596822, 1, 0, 0.8470588, 1,
1.003835, -1.163054, 4.276215, 1, 0, 0.8392157, 1,
1.006338, 0.6386485, -0.3958859, 1, 0, 0.8352941, 1,
1.006476, 0.8598257, 0.7353061, 1, 0, 0.827451, 1,
1.017154, -0.5861166, 0.6162159, 1, 0, 0.8235294, 1,
1.017665, -0.4064635, 1.808762, 1, 0, 0.8156863, 1,
1.027984, -1.82726, 1.992272, 1, 0, 0.8117647, 1,
1.036314, -1.482918, 3.314738, 1, 0, 0.8039216, 1,
1.042201, -0.1050874, 2.180517, 1, 0, 0.7960784, 1,
1.043489, -1.070644, 2.303274, 1, 0, 0.7921569, 1,
1.049532, -2.755195, 3.601092, 1, 0, 0.7843137, 1,
1.050189, -0.1192042, 1.776624, 1, 0, 0.7803922, 1,
1.051824, 1.090799, 2.048295, 1, 0, 0.772549, 1,
1.05962, -0.4727931, 1.402869, 1, 0, 0.7686275, 1,
1.075739, -0.08050369, 1.978526, 1, 0, 0.7607843, 1,
1.075771, 0.2537406, 1.508536, 1, 0, 0.7568628, 1,
1.085432, 0.2472216, 2.140812, 1, 0, 0.7490196, 1,
1.086244, -0.8973629, 0.6271991, 1, 0, 0.7450981, 1,
1.099532, -0.1821755, 2.027293, 1, 0, 0.7372549, 1,
1.101523, -1.204032, 2.106194, 1, 0, 0.7333333, 1,
1.103257, -0.2310997, 2.471591, 1, 0, 0.7254902, 1,
1.105467, 1.628216, 1.332324, 1, 0, 0.7215686, 1,
1.116792, 1.345702, -0.1970662, 1, 0, 0.7137255, 1,
1.118162, 1.750505, -1.839719, 1, 0, 0.7098039, 1,
1.120811, -1.176794, 3.899981, 1, 0, 0.7019608, 1,
1.134819, -2.235708, 0.7441185, 1, 0, 0.6941177, 1,
1.136957, 0.6526306, 1.426318, 1, 0, 0.6901961, 1,
1.137338, 0.5377246, 0.3809926, 1, 0, 0.682353, 1,
1.137498, -1.325948, 1.958774, 1, 0, 0.6784314, 1,
1.138083, 1.138038, -0.5073445, 1, 0, 0.6705883, 1,
1.138154, 0.2292872, 3.006879, 1, 0, 0.6666667, 1,
1.144414, -0.8352273, 2.299055, 1, 0, 0.6588235, 1,
1.146276, 0.5951484, 0.1546741, 1, 0, 0.654902, 1,
1.15445, 1.159054, 2.076993, 1, 0, 0.6470588, 1,
1.162, 1.324607, 0.9762033, 1, 0, 0.6431373, 1,
1.182453, 0.1671608, 2.495992, 1, 0, 0.6352941, 1,
1.201109, -0.2245033, 2.391645, 1, 0, 0.6313726, 1,
1.202013, 1.357071, -0.2470609, 1, 0, 0.6235294, 1,
1.209134, 1.045765, 0.8248667, 1, 0, 0.6196079, 1,
1.209345, 1.787029, 0.1519178, 1, 0, 0.6117647, 1,
1.232138, 1.235964, 1.187577, 1, 0, 0.6078432, 1,
1.237506, -0.866614, 2.824228, 1, 0, 0.6, 1,
1.252383, -1.088546, 3.631188, 1, 0, 0.5921569, 1,
1.265669, 0.0780062, 0.8483452, 1, 0, 0.5882353, 1,
1.275266, 0.2003547, 0.8291148, 1, 0, 0.5803922, 1,
1.295778, 0.1869603, 1.91118, 1, 0, 0.5764706, 1,
1.298173, -1.564548, 2.198917, 1, 0, 0.5686275, 1,
1.301715, -1.291454, 1.647931, 1, 0, 0.5647059, 1,
1.310534, -0.05935032, 2.017589, 1, 0, 0.5568628, 1,
1.324471, -0.7872562, 0.7525795, 1, 0, 0.5529412, 1,
1.333517, 1.33713, 0.5378786, 1, 0, 0.5450981, 1,
1.34605, 0.8913116, 1.312911, 1, 0, 0.5411765, 1,
1.347217, -2.115336, 1.782972, 1, 0, 0.5333334, 1,
1.361979, -0.7332302, 1.28476, 1, 0, 0.5294118, 1,
1.366475, -0.1436765, 3.88126, 1, 0, 0.5215687, 1,
1.367507, -2.001855, 2.713578, 1, 0, 0.5176471, 1,
1.387629, -0.01495633, 1.499564, 1, 0, 0.509804, 1,
1.388107, -1.520034, 1.114865, 1, 0, 0.5058824, 1,
1.391704, -1.52651, 3.399009, 1, 0, 0.4980392, 1,
1.399546, -0.2129776, 1.465209, 1, 0, 0.4901961, 1,
1.421406, -0.4755552, 2.359338, 1, 0, 0.4862745, 1,
1.422415, 0.3294286, 1.681216, 1, 0, 0.4784314, 1,
1.424664, -0.4755839, 3.162458, 1, 0, 0.4745098, 1,
1.429347, -1.469268, 3.504202, 1, 0, 0.4666667, 1,
1.432108, -1.26534, 3.349903, 1, 0, 0.4627451, 1,
1.432244, -1.553549, 1.652003, 1, 0, 0.454902, 1,
1.451401, 1.219323, 0.1228373, 1, 0, 0.4509804, 1,
1.451509, -0.8325881, 1.149855, 1, 0, 0.4431373, 1,
1.457425, -1.212305, 2.58653, 1, 0, 0.4392157, 1,
1.463328, -1.307655, 1.750314, 1, 0, 0.4313726, 1,
1.465528, 0.508863, 0.08959201, 1, 0, 0.427451, 1,
1.484422, -0.05669472, 1.105353, 1, 0, 0.4196078, 1,
1.488962, -0.5680481, 3.090075, 1, 0, 0.4156863, 1,
1.491281, -0.05264516, 1.462743, 1, 0, 0.4078431, 1,
1.505069, -0.7340637, 0.6777279, 1, 0, 0.4039216, 1,
1.506195, 1.176218, 0.6533917, 1, 0, 0.3960784, 1,
1.508306, -0.3804401, 2.153893, 1, 0, 0.3882353, 1,
1.51195, 2.051018, 0.3734301, 1, 0, 0.3843137, 1,
1.519962, 0.0743451, 1.767212, 1, 0, 0.3764706, 1,
1.520686, 0.4101955, 3.937521, 1, 0, 0.372549, 1,
1.536362, -0.04183098, 0.5099964, 1, 0, 0.3647059, 1,
1.545389, -0.009540993, -0.08098825, 1, 0, 0.3607843, 1,
1.552598, -0.8278086, 1.726725, 1, 0, 0.3529412, 1,
1.564991, 1.333912, -0.4654762, 1, 0, 0.3490196, 1,
1.568343, -0.08506349, 3.165629, 1, 0, 0.3411765, 1,
1.568441, 0.452709, 1.382349, 1, 0, 0.3372549, 1,
1.570663, 0.2875937, 1.844553, 1, 0, 0.3294118, 1,
1.574962, -1.12707, 1.821581, 1, 0, 0.3254902, 1,
1.588407, -0.7104753, 2.887804, 1, 0, 0.3176471, 1,
1.605357, -0.4895473, 0.9740284, 1, 0, 0.3137255, 1,
1.611197, 1.007769, 1.463451, 1, 0, 0.3058824, 1,
1.628688, -0.9638365, 2.521544, 1, 0, 0.2980392, 1,
1.634204, 0.5023524, 0.4436715, 1, 0, 0.2941177, 1,
1.658302, 0.855784, 0.05997031, 1, 0, 0.2862745, 1,
1.677588, 1.319523, 0.6148582, 1, 0, 0.282353, 1,
1.72367, 1.204018, 1.334383, 1, 0, 0.2745098, 1,
1.758537, -1.795816, 0.0675541, 1, 0, 0.2705882, 1,
1.770467, 0.3871802, -1.320849, 1, 0, 0.2627451, 1,
1.773935, 1.060406, 2.089153, 1, 0, 0.2588235, 1,
1.781864, -0.02230452, 3.61603, 1, 0, 0.2509804, 1,
1.782529, -0.8199174, 3.00082, 1, 0, 0.2470588, 1,
1.787998, 1.21236, 1.032857, 1, 0, 0.2392157, 1,
1.799181, 1.081976, 0.5733454, 1, 0, 0.2352941, 1,
1.801969, 0.7150141, 2.185575, 1, 0, 0.227451, 1,
1.807443, -0.7366239, 0.469861, 1, 0, 0.2235294, 1,
1.825575, -2.198886, 1.069754, 1, 0, 0.2156863, 1,
1.832812, -0.6966535, 1.025211, 1, 0, 0.2117647, 1,
1.853105, -0.4438222, 0.3418093, 1, 0, 0.2039216, 1,
1.875662, 1.004303, -0.4755965, 1, 0, 0.1960784, 1,
1.881629, 0.9655784, 0.181245, 1, 0, 0.1921569, 1,
1.883379, 0.1908265, 1.195634, 1, 0, 0.1843137, 1,
1.8917, 0.7161719, 1.265204, 1, 0, 0.1803922, 1,
1.89703, -0.4783666, 1.139646, 1, 0, 0.172549, 1,
1.899048, -0.5291858, -0.04822255, 1, 0, 0.1686275, 1,
1.90639, -0.460106, 2.660496, 1, 0, 0.1607843, 1,
1.9358, 1.286341, 1.775458, 1, 0, 0.1568628, 1,
1.969048, 0.608943, 1.15518, 1, 0, 0.1490196, 1,
1.975749, -0.3076205, 0.7992907, 1, 0, 0.145098, 1,
2.039894, -1.014966, 3.248402, 1, 0, 0.1372549, 1,
2.04933, 1.643532, 1.541072, 1, 0, 0.1333333, 1,
2.049556, 0.6682039, 2.149754, 1, 0, 0.1254902, 1,
2.054574, 2.311042, -1.301887, 1, 0, 0.1215686, 1,
2.072988, 0.2453559, 0.4573111, 1, 0, 0.1137255, 1,
2.084655, -0.5210571, -0.3460343, 1, 0, 0.1098039, 1,
2.1026, 0.511561, 0.3973464, 1, 0, 0.1019608, 1,
2.135707, 0.5905322, 0.3335219, 1, 0, 0.09411765, 1,
2.13749, -0.4078362, 0.8115112, 1, 0, 0.09019608, 1,
2.149046, 0.9951618, 1.293589, 1, 0, 0.08235294, 1,
2.260109, 0.4305675, 1.510389, 1, 0, 0.07843138, 1,
2.271447, 0.07445652, 0.895272, 1, 0, 0.07058824, 1,
2.279298, -0.2123852, 0.6791263, 1, 0, 0.06666667, 1,
2.295065, -0.8914691, 2.820766, 1, 0, 0.05882353, 1,
2.390203, 0.04396835, 2.977762, 1, 0, 0.05490196, 1,
2.421668, 0.6931249, 3.226238, 1, 0, 0.04705882, 1,
2.442419, -1.143643, 2.944203, 1, 0, 0.04313726, 1,
2.463109, -0.7050079, 3.014386, 1, 0, 0.03529412, 1,
2.517747, 0.2060414, 0.7111279, 1, 0, 0.03137255, 1,
2.65187, -1.288387, 0.8145539, 1, 0, 0.02352941, 1,
2.66667, -0.5403282, 1.685286, 1, 0, 0.01960784, 1,
3.084618, -0.08036295, 0.9949198, 1, 0, 0.01176471, 1,
3.254843, 0.43407, 0.8937858, 1, 0, 0.007843138, 1
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
-0.4331182, -4.783461, -7.615658, 0, -0.5, 0.5, 0.5,
-0.4331182, -4.783461, -7.615658, 1, -0.5, 0.5, 0.5,
-0.4331182, -4.783461, -7.615658, 1, 1.5, 0.5, 0.5,
-0.4331182, -4.783461, -7.615658, 0, 1.5, 0.5, 0.5
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
-5.371299, -0.2740141, -7.615658, 0, -0.5, 0.5, 0.5,
-5.371299, -0.2740141, -7.615658, 1, -0.5, 0.5, 0.5,
-5.371299, -0.2740141, -7.615658, 1, 1.5, 0.5, 0.5,
-5.371299, -0.2740141, -7.615658, 0, 1.5, 0.5, 0.5
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
-5.371299, -4.783461, -0.251138, 0, -0.5, 0.5, 0.5,
-5.371299, -4.783461, -0.251138, 1, -0.5, 0.5, 0.5,
-5.371299, -4.783461, -0.251138, 1, 1.5, 0.5, 0.5,
-5.371299, -4.783461, -0.251138, 0, 1.5, 0.5, 0.5
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
-4, -3.742819, -5.916153,
2, -3.742819, -5.916153,
-4, -3.742819, -5.916153,
-4, -3.916259, -6.199404,
-2, -3.742819, -5.916153,
-2, -3.916259, -6.199404,
0, -3.742819, -5.916153,
0, -3.916259, -6.199404,
2, -3.742819, -5.916153,
2, -3.916259, -6.199404
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
"-4",
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
-4, -4.26314, -6.765906, 0, -0.5, 0.5, 0.5,
-4, -4.26314, -6.765906, 1, -0.5, 0.5, 0.5,
-4, -4.26314, -6.765906, 1, 1.5, 0.5, 0.5,
-4, -4.26314, -6.765906, 0, 1.5, 0.5, 0.5,
-2, -4.26314, -6.765906, 0, -0.5, 0.5, 0.5,
-2, -4.26314, -6.765906, 1, -0.5, 0.5, 0.5,
-2, -4.26314, -6.765906, 1, 1.5, 0.5, 0.5,
-2, -4.26314, -6.765906, 0, 1.5, 0.5, 0.5,
0, -4.26314, -6.765906, 0, -0.5, 0.5, 0.5,
0, -4.26314, -6.765906, 1, -0.5, 0.5, 0.5,
0, -4.26314, -6.765906, 1, 1.5, 0.5, 0.5,
0, -4.26314, -6.765906, 0, 1.5, 0.5, 0.5,
2, -4.26314, -6.765906, 0, -0.5, 0.5, 0.5,
2, -4.26314, -6.765906, 1, -0.5, 0.5, 0.5,
2, -4.26314, -6.765906, 1, 1.5, 0.5, 0.5,
2, -4.26314, -6.765906, 0, 1.5, 0.5, 0.5
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
-4.231719, -3, -5.916153,
-4.231719, 3, -5.916153,
-4.231719, -3, -5.916153,
-4.421649, -3, -6.199404,
-4.231719, -2, -5.916153,
-4.421649, -2, -6.199404,
-4.231719, -1, -5.916153,
-4.421649, -1, -6.199404,
-4.231719, 0, -5.916153,
-4.421649, 0, -6.199404,
-4.231719, 1, -5.916153,
-4.421649, 1, -6.199404,
-4.231719, 2, -5.916153,
-4.421649, 2, -6.199404,
-4.231719, 3, -5.916153,
-4.421649, 3, -6.199404
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
-4.801509, -3, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, -3, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, -3, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, -3, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, -2, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, -2, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, -2, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, -2, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, -1, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, -1, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, -1, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, -1, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, 0, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, 0, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, 0, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, 0, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, 1, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, 1, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, 1, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, 1, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, 2, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, 2, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, 2, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, 2, -6.765906, 0, 1.5, 0.5, 0.5,
-4.801509, 3, -6.765906, 0, -0.5, 0.5, 0.5,
-4.801509, 3, -6.765906, 1, -0.5, 0.5, 0.5,
-4.801509, 3, -6.765906, 1, 1.5, 0.5, 0.5,
-4.801509, 3, -6.765906, 0, 1.5, 0.5, 0.5
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
-4.231719, -3.742819, -4,
-4.231719, -3.742819, 4,
-4.231719, -3.742819, -4,
-4.421649, -3.916259, -4,
-4.231719, -3.742819, -2,
-4.421649, -3.916259, -2,
-4.231719, -3.742819, 0,
-4.421649, -3.916259, 0,
-4.231719, -3.742819, 2,
-4.421649, -3.916259, 2,
-4.231719, -3.742819, 4,
-4.421649, -3.916259, 4
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
-4.801509, -4.26314, -4, 0, -0.5, 0.5, 0.5,
-4.801509, -4.26314, -4, 1, -0.5, 0.5, 0.5,
-4.801509, -4.26314, -4, 1, 1.5, 0.5, 0.5,
-4.801509, -4.26314, -4, 0, 1.5, 0.5, 0.5,
-4.801509, -4.26314, -2, 0, -0.5, 0.5, 0.5,
-4.801509, -4.26314, -2, 1, -0.5, 0.5, 0.5,
-4.801509, -4.26314, -2, 1, 1.5, 0.5, 0.5,
-4.801509, -4.26314, -2, 0, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 0, 0, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 0, 1, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 0, 1, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 0, 0, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 2, 0, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 2, 1, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 2, 1, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 2, 0, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 4, 0, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 4, 1, -0.5, 0.5, 0.5,
-4.801509, -4.26314, 4, 1, 1.5, 0.5, 0.5,
-4.801509, -4.26314, 4, 0, 1.5, 0.5, 0.5
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
-4.231719, -3.742819, -5.916153,
-4.231719, 3.194791, -5.916153,
-4.231719, -3.742819, 5.413877,
-4.231719, 3.194791, 5.413877,
-4.231719, -3.742819, -5.916153,
-4.231719, -3.742819, 5.413877,
-4.231719, 3.194791, -5.916153,
-4.231719, 3.194791, 5.413877,
-4.231719, -3.742819, -5.916153,
3.365482, -3.742819, -5.916153,
-4.231719, -3.742819, 5.413877,
3.365482, -3.742819, 5.413877,
-4.231719, 3.194791, -5.916153,
3.365482, 3.194791, -5.916153,
-4.231719, 3.194791, 5.413877,
3.365482, 3.194791, 5.413877,
3.365482, -3.742819, -5.916153,
3.365482, 3.194791, -5.916153,
3.365482, -3.742819, 5.413877,
3.365482, 3.194791, 5.413877,
3.365482, -3.742819, -5.916153,
3.365482, -3.742819, 5.413877,
3.365482, 3.194791, -5.916153,
3.365482, 3.194791, 5.413877
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
var radius = 8.172128;
var distance = 36.35872;
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
mvMatrix.translate( 0.4331182, 0.2740141, 0.251138 );
mvMatrix.scale( 1.163042, 1.273618, 0.7798623 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.35872);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
tetramethrin<-read.table("tetramethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetramethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
y<-tetramethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
z<-tetramethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
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
-4.12108, -1.728142, -1.549067, 0, 0, 1, 1, 1,
-2.939583, 1.811567, 0.07534275, 1, 0, 0, 1, 1,
-2.71554, 0.3380872, 0.07235014, 1, 0, 0, 1, 1,
-2.665938, 0.06655843, -1.294601, 1, 0, 0, 1, 1,
-2.544631, -1.285321, -5.751153, 1, 0, 0, 1, 1,
-2.543926, 0.09599841, -1.511987, 1, 0, 0, 1, 1,
-2.459638, 0.3617641, -1.124022, 0, 0, 0, 1, 1,
-2.430067, 0.4578574, -1.656352, 0, 0, 0, 1, 1,
-2.408168, 0.6648867, -2.779069, 0, 0, 0, 1, 1,
-2.363211, 1.592509, -1.394589, 0, 0, 0, 1, 1,
-2.316923, 1.650451, 0.3155095, 0, 0, 0, 1, 1,
-2.280957, 1.343095, -1.893208, 0, 0, 0, 1, 1,
-2.250846, 0.7092412, -0.8130707, 0, 0, 0, 1, 1,
-2.178843, 1.340674, -2.151681, 1, 1, 1, 1, 1,
-2.171194, 0.5135311, -1.575343, 1, 1, 1, 1, 1,
-2.097399, 2.155133, -0.3376834, 1, 1, 1, 1, 1,
-2.072339, 1.875285, -1.024136, 1, 1, 1, 1, 1,
-2.070679, 0.9182868, -1.824266, 1, 1, 1, 1, 1,
-2.046425, -1.939206, -1.947633, 1, 1, 1, 1, 1,
-2.024871, -1.199266, -2.153116, 1, 1, 1, 1, 1,
-1.981634, -3.641786, -3.383443, 1, 1, 1, 1, 1,
-1.977647, -0.2454602, -0.2982066, 1, 1, 1, 1, 1,
-1.956387, 0.3087001, -0.8104526, 1, 1, 1, 1, 1,
-1.918445, -0.4426536, -1.199082, 1, 1, 1, 1, 1,
-1.913654, -1.962481, -4.17074, 1, 1, 1, 1, 1,
-1.901748, 0.7282745, -1.237077, 1, 1, 1, 1, 1,
-1.895769, 0.2757619, -0.4223318, 1, 1, 1, 1, 1,
-1.893906, 0.487174, -1.410119, 1, 1, 1, 1, 1,
-1.891884, -0.08489851, -0.4812961, 0, 0, 1, 1, 1,
-1.880835, -2.395903, -2.455293, 1, 0, 0, 1, 1,
-1.864989, -0.8586857, -0.6365674, 1, 0, 0, 1, 1,
-1.85862, -0.6025027, -1.23524, 1, 0, 0, 1, 1,
-1.851479, -0.6382031, -2.00376, 1, 0, 0, 1, 1,
-1.832291, -0.3582418, -1.76499, 1, 0, 0, 1, 1,
-1.815714, -1.119699, -2.937656, 0, 0, 0, 1, 1,
-1.804308, -1.322449, -1.389937, 0, 0, 0, 1, 1,
-1.798259, -1.681543, -1.874195, 0, 0, 0, 1, 1,
-1.79473, 0.1123992, -1.506327, 0, 0, 0, 1, 1,
-1.775975, -1.952352, -1.098665, 0, 0, 0, 1, 1,
-1.756771, 0.413884, -1.057345, 0, 0, 0, 1, 1,
-1.754359, 0.4644536, -0.915958, 0, 0, 0, 1, 1,
-1.716454, -2.287333, -5.618808, 1, 1, 1, 1, 1,
-1.711965, 0.09334097, -1.294405, 1, 1, 1, 1, 1,
-1.677184, 1.799002, -0.4460284, 1, 1, 1, 1, 1,
-1.672543, 1.622557, -1.006564, 1, 1, 1, 1, 1,
-1.660823, -1.254732, -2.288255, 1, 1, 1, 1, 1,
-1.659611, -1.752742, -2.003197, 1, 1, 1, 1, 1,
-1.653436, 0.4132405, -1.91611, 1, 1, 1, 1, 1,
-1.646958, 0.3877891, -2.297381, 1, 1, 1, 1, 1,
-1.632192, 0.9737502, -0.9489417, 1, 1, 1, 1, 1,
-1.61899, -1.66981, -1.613132, 1, 1, 1, 1, 1,
-1.612022, 0.4456184, -2.150203, 1, 1, 1, 1, 1,
-1.602655, 0.8200176, -3.28089, 1, 1, 1, 1, 1,
-1.571808, -0.8537288, -1.765468, 1, 1, 1, 1, 1,
-1.537693, -0.08684737, -2.180943, 1, 1, 1, 1, 1,
-1.536958, -0.7353712, -1.226145, 1, 1, 1, 1, 1,
-1.513256, 0.2313981, -2.240123, 0, 0, 1, 1, 1,
-1.507609, 1.27475, -2.745883, 1, 0, 0, 1, 1,
-1.501591, 0.2436265, -0.6912078, 1, 0, 0, 1, 1,
-1.483046, 1.115096, 0.6092162, 1, 0, 0, 1, 1,
-1.47911, 0.2557153, -1.098041, 1, 0, 0, 1, 1,
-1.459598, 0.4557523, -2.086238, 1, 0, 0, 1, 1,
-1.458372, -1.235746, -3.455462, 0, 0, 0, 1, 1,
-1.440708, 0.2470949, -1.721294, 0, 0, 0, 1, 1,
-1.435931, 1.528228, -0.4976869, 0, 0, 0, 1, 1,
-1.434433, 0.04619271, -1.803624, 0, 0, 0, 1, 1,
-1.43282, 0.1155222, -1.424391, 0, 0, 0, 1, 1,
-1.425933, -0.4140517, -0.8224379, 0, 0, 0, 1, 1,
-1.416606, 0.6188118, 0.4031287, 0, 0, 0, 1, 1,
-1.406813, 0.08869695, -1.326971, 1, 1, 1, 1, 1,
-1.404366, 0.1270308, -2.065762, 1, 1, 1, 1, 1,
-1.401643, 0.3609076, -0.07242824, 1, 1, 1, 1, 1,
-1.396898, 1.273547, -1.932124, 1, 1, 1, 1, 1,
-1.393133, -0.7393148, -3.605056, 1, 1, 1, 1, 1,
-1.380261, 1.210339, -0.9671357, 1, 1, 1, 1, 1,
-1.37911, 1.604785, -0.03528397, 1, 1, 1, 1, 1,
-1.37657, 1.266314, -0.5231263, 1, 1, 1, 1, 1,
-1.36781, 0.4892225, -3.005083, 1, 1, 1, 1, 1,
-1.343402, 0.3868621, -3.258704, 1, 1, 1, 1, 1,
-1.341986, -1.547433, -3.733081, 1, 1, 1, 1, 1,
-1.327393, -0.8159255, -3.750694, 1, 1, 1, 1, 1,
-1.312599, -0.4411122, -0.3371339, 1, 1, 1, 1, 1,
-1.302696, 1.934085, -0.7821861, 1, 1, 1, 1, 1,
-1.29389, 0.2869229, -1.736651, 1, 1, 1, 1, 1,
-1.285808, 0.03175041, -1.700779, 0, 0, 1, 1, 1,
-1.28336, -0.8086877, -1.585803, 1, 0, 0, 1, 1,
-1.278637, -1.824322, -2.159056, 1, 0, 0, 1, 1,
-1.273159, -0.6994938, -2.127126, 1, 0, 0, 1, 1,
-1.269981, 0.2260475, -1.080742, 1, 0, 0, 1, 1,
-1.261053, 0.8213404, -1.839524, 1, 0, 0, 1, 1,
-1.255547, 1.259474, -0.2402633, 0, 0, 0, 1, 1,
-1.249405, -1.288951, -3.093607, 0, 0, 0, 1, 1,
-1.242732, 1.748979, -0.914776, 0, 0, 0, 1, 1,
-1.231952, 0.734406, -0.2237313, 0, 0, 0, 1, 1,
-1.229139, 0.4430283, -1.926724, 0, 0, 0, 1, 1,
-1.225512, -0.1519632, -0.5315957, 0, 0, 0, 1, 1,
-1.224424, 1.562654, 0.2943524, 0, 0, 0, 1, 1,
-1.222187, -1.514163, -2.208709, 1, 1, 1, 1, 1,
-1.222124, -1.905218, -3.709288, 1, 1, 1, 1, 1,
-1.21248, 1.55706, 0.4919207, 1, 1, 1, 1, 1,
-1.207901, 0.6749586, -0.5019429, 1, 1, 1, 1, 1,
-1.201733, 0.7195432, -1.692484, 1, 1, 1, 1, 1,
-1.201194, 1.040181, -0.9808467, 1, 1, 1, 1, 1,
-1.196326, 1.007236, -0.6449506, 1, 1, 1, 1, 1,
-1.194015, 0.08128792, -0.5079706, 1, 1, 1, 1, 1,
-1.18955, -0.0919802, -0.338717, 1, 1, 1, 1, 1,
-1.18847, -0.7326265, -4.626243, 1, 1, 1, 1, 1,
-1.186846, 1.389243, 1.73999, 1, 1, 1, 1, 1,
-1.184066, -1.274937, -1.100076, 1, 1, 1, 1, 1,
-1.180815, 0.1110123, -1.768259, 1, 1, 1, 1, 1,
-1.177427, 0.3662094, 1.17838, 1, 1, 1, 1, 1,
-1.171407, -1.125449, -0.8565967, 1, 1, 1, 1, 1,
-1.16763, -1.874394, -2.74924, 0, 0, 1, 1, 1,
-1.164344, 0.09388354, -2.902419, 1, 0, 0, 1, 1,
-1.160131, -0.460752, -3.103174, 1, 0, 0, 1, 1,
-1.150752, -1.080072, -2.157954, 1, 0, 0, 1, 1,
-1.148117, -0.7741525, -1.921284, 1, 0, 0, 1, 1,
-1.144403, -1.019513, -2.850349, 1, 0, 0, 1, 1,
-1.143349, -0.8765805, -1.692993, 0, 0, 0, 1, 1,
-1.135774, -0.926041, -1.637408, 0, 0, 0, 1, 1,
-1.127629, 0.7981509, -2.312083, 0, 0, 0, 1, 1,
-1.121845, 0.8507497, -2.943747, 0, 0, 0, 1, 1,
-1.118248, 0.4044574, -1.650532, 0, 0, 0, 1, 1,
-1.110943, -1.021385, -1.988746, 0, 0, 0, 1, 1,
-1.087267, -1.928661, -2.964872, 0, 0, 0, 1, 1,
-1.081769, 0.5256324, -2.207845, 1, 1, 1, 1, 1,
-1.075517, -0.2109463, -0.996749, 1, 1, 1, 1, 1,
-1.072016, -0.4121999, -1.781309, 1, 1, 1, 1, 1,
-1.070761, 0.4421341, -1.084031, 1, 1, 1, 1, 1,
-1.069985, -1.125975, -1.334241, 1, 1, 1, 1, 1,
-1.063089, 0.3507009, -0.6636492, 1, 1, 1, 1, 1,
-1.060373, 0.244204, -2.331665, 1, 1, 1, 1, 1,
-1.058869, -0.1651951, 0.06312844, 1, 1, 1, 1, 1,
-1.057271, -1.526574, -3.311574, 1, 1, 1, 1, 1,
-1.053474, 0.735992, -1.248143, 1, 1, 1, 1, 1,
-1.052948, -1.503509, -2.404209, 1, 1, 1, 1, 1,
-1.052186, -1.731216, -4.570257, 1, 1, 1, 1, 1,
-1.041781, -0.8017756, -1.201722, 1, 1, 1, 1, 1,
-1.041121, 1.08865, 0.8048515, 1, 1, 1, 1, 1,
-1.032851, -0.1136886, -2.429449, 1, 1, 1, 1, 1,
-1.030335, 0.242653, -3.202551, 0, 0, 1, 1, 1,
-1.028355, -0.9479907, -2.421597, 1, 0, 0, 1, 1,
-1.013954, -0.5756003, -1.73383, 1, 0, 0, 1, 1,
-1.003457, 0.1970916, -1.431882, 1, 0, 0, 1, 1,
-1.001443, 0.913727, -0.9237286, 1, 0, 0, 1, 1,
-1.000397, -0.1994479, -3.620419, 1, 0, 0, 1, 1,
-0.9900501, 1.028076, -1.480852, 0, 0, 0, 1, 1,
-0.9883744, -0.645299, -2.307642, 0, 0, 0, 1, 1,
-0.9882513, -0.7881142, -2.307695, 0, 0, 0, 1, 1,
-0.9874915, 1.239586, -1.409848, 0, 0, 0, 1, 1,
-0.9873937, 1.089932, -1.957612, 0, 0, 0, 1, 1,
-0.9819523, -1.093101, 0.1974638, 0, 0, 0, 1, 1,
-0.9803348, 0.1248178, -1.529128, 0, 0, 0, 1, 1,
-0.9735513, -0.01430903, -1.550878, 1, 1, 1, 1, 1,
-0.9699211, 2.417803, 0.3795034, 1, 1, 1, 1, 1,
-0.9660041, -0.5422523, -2.746811, 1, 1, 1, 1, 1,
-0.9632528, 0.610759, -0.9998515, 1, 1, 1, 1, 1,
-0.9631348, 0.9735916, -0.3764759, 1, 1, 1, 1, 1,
-0.9626052, 1.914074, -0.4614834, 1, 1, 1, 1, 1,
-0.9616632, 0.05442835, -0.3211579, 1, 1, 1, 1, 1,
-0.9608732, -0.403181, -1.620449, 1, 1, 1, 1, 1,
-0.9545004, -1.378886, -2.064653, 1, 1, 1, 1, 1,
-0.9489833, -0.7116206, -2.731478, 1, 1, 1, 1, 1,
-0.9438819, 0.1378556, -2.39876, 1, 1, 1, 1, 1,
-0.9421034, 0.8740617, -0.5011454, 1, 1, 1, 1, 1,
-0.9338205, -0.147789, -1.962837, 1, 1, 1, 1, 1,
-0.9281593, 0.2168887, -2.314403, 1, 1, 1, 1, 1,
-0.9274317, -0.0317691, -2.446696, 1, 1, 1, 1, 1,
-0.9259205, 0.3374357, -1.490656, 0, 0, 1, 1, 1,
-0.9230472, -2.089438, -4.391272, 1, 0, 0, 1, 1,
-0.9220521, -0.3054291, -1.534681, 1, 0, 0, 1, 1,
-0.9204897, -1.953165, -2.475615, 1, 0, 0, 1, 1,
-0.9078013, 0.3698668, -0.08184455, 1, 0, 0, 1, 1,
-0.9047016, -0.6323065, -0.230696, 1, 0, 0, 1, 1,
-0.9039691, -0.9592648, 0.0119769, 0, 0, 0, 1, 1,
-0.899121, 0.255488, -0.8233315, 0, 0, 0, 1, 1,
-0.8976026, -0.4829859, -2.976228, 0, 0, 0, 1, 1,
-0.8955294, 0.7934569, -0.617779, 0, 0, 0, 1, 1,
-0.894778, 1.731998, -1.472484, 0, 0, 0, 1, 1,
-0.8908117, 0.7597724, -2.037044, 0, 0, 0, 1, 1,
-0.8871948, -0.547577, -2.019722, 0, 0, 0, 1, 1,
-0.8834175, 0.7594997, 0.3896551, 1, 1, 1, 1, 1,
-0.8814402, -0.3882155, -1.197104, 1, 1, 1, 1, 1,
-0.8785293, -1.505517, -3.013499, 1, 1, 1, 1, 1,
-0.8738914, 0.6279268, -1.368223, 1, 1, 1, 1, 1,
-0.8733008, 0.1606624, -1.478596, 1, 1, 1, 1, 1,
-0.865074, 0.09553329, -0.8271292, 1, 1, 1, 1, 1,
-0.864271, -0.7292237, -3.465468, 1, 1, 1, 1, 1,
-0.8469157, -0.09735996, -1.178888, 1, 1, 1, 1, 1,
-0.843197, -0.3116937, -1.424065, 1, 1, 1, 1, 1,
-0.8345258, 0.4346204, -0.4781478, 1, 1, 1, 1, 1,
-0.8294474, -0.05056383, -1.011872, 1, 1, 1, 1, 1,
-0.8208858, -0.07457249, -3.54974, 1, 1, 1, 1, 1,
-0.8172037, -0.1697841, -3.339488, 1, 1, 1, 1, 1,
-0.8164616, -2.039652, -1.908638, 1, 1, 1, 1, 1,
-0.8137733, 0.03443715, -0.9979704, 1, 1, 1, 1, 1,
-0.8123145, 0.9740945, 0.7025356, 0, 0, 1, 1, 1,
-0.8121904, -0.5649018, -1.74144, 1, 0, 0, 1, 1,
-0.8051686, -0.2519709, -0.6345841, 1, 0, 0, 1, 1,
-0.7966814, -0.9394011, -2.831502, 1, 0, 0, 1, 1,
-0.7931206, -0.7178057, -2.087432, 1, 0, 0, 1, 1,
-0.7926679, -0.3748564, -1.18921, 1, 0, 0, 1, 1,
-0.7922962, 0.7489482, -0.7508199, 0, 0, 0, 1, 1,
-0.7913979, -0.3696684, -1.499384, 0, 0, 0, 1, 1,
-0.7882156, -0.7975278, -0.2897019, 0, 0, 0, 1, 1,
-0.7876874, -0.8638529, -1.874881, 0, 0, 0, 1, 1,
-0.7831405, 1.642815, -2.554028, 0, 0, 0, 1, 1,
-0.7812634, -0.9116765, -3.342996, 0, 0, 0, 1, 1,
-0.7809232, -1.400354, -1.404643, 0, 0, 0, 1, 1,
-0.7781736, -0.6117485, -2.366695, 1, 1, 1, 1, 1,
-0.7719285, -0.826871, -2.168317, 1, 1, 1, 1, 1,
-0.7678415, 0.325229, -3.03487, 1, 1, 1, 1, 1,
-0.7635641, -0.8743315, -4.719663, 1, 1, 1, 1, 1,
-0.7610675, 2.044607, -1.597287, 1, 1, 1, 1, 1,
-0.7599163, 1.032055, -1.569291, 1, 1, 1, 1, 1,
-0.7505286, 0.6199716, -3.594918, 1, 1, 1, 1, 1,
-0.7461872, -0.1862767, -1.564295, 1, 1, 1, 1, 1,
-0.743248, 0.2214493, -1.6333, 1, 1, 1, 1, 1,
-0.7421615, 0.08348016, -1.057173, 1, 1, 1, 1, 1,
-0.7400836, 0.7500836, -0.6007221, 1, 1, 1, 1, 1,
-0.7369636, -0.9437386, -3.489555, 1, 1, 1, 1, 1,
-0.7342402, -0.5685825, -2.31096, 1, 1, 1, 1, 1,
-0.7329856, -0.6136269, -2.206239, 1, 1, 1, 1, 1,
-0.7325342, -1.280993, -1.952511, 1, 1, 1, 1, 1,
-0.7291692, -0.6279368, -0.9555652, 0, 0, 1, 1, 1,
-0.7241852, -0.6723801, -2.186427, 1, 0, 0, 1, 1,
-0.7227176, -0.9793302, -2.279833, 1, 0, 0, 1, 1,
-0.7117888, -1.518168, -3.051977, 1, 0, 0, 1, 1,
-0.7051381, -0.08720355, -1.557632, 1, 0, 0, 1, 1,
-0.7022485, -0.3467539, -2.921131, 1, 0, 0, 1, 1,
-0.6978753, 0.7705099, -0.62056, 0, 0, 0, 1, 1,
-0.6955644, -0.4515074, -1.531743, 0, 0, 0, 1, 1,
-0.6946269, -0.4808742, -1.261212, 0, 0, 0, 1, 1,
-0.6912352, -0.06412835, -0.7176551, 0, 0, 0, 1, 1,
-0.690287, 0.05693223, -0.9082443, 0, 0, 0, 1, 1,
-0.6856992, -1.842462, -1.330691, 0, 0, 0, 1, 1,
-0.6841288, 0.2392082, -2.631113, 0, 0, 0, 1, 1,
-0.6840162, -1.453399, -3.426616, 1, 1, 1, 1, 1,
-0.6809616, 0.7441904, 0.8208899, 1, 1, 1, 1, 1,
-0.6679693, 0.5604199, -1.749928, 1, 1, 1, 1, 1,
-0.6674362, 0.1735858, -0.5769669, 1, 1, 1, 1, 1,
-0.664687, 1.433755, -1.58187, 1, 1, 1, 1, 1,
-0.658832, 1.599027, -0.6150258, 1, 1, 1, 1, 1,
-0.6577646, 0.3338461, -1.084921, 1, 1, 1, 1, 1,
-0.6558256, 0.4513073, -0.2355445, 1, 1, 1, 1, 1,
-0.6482963, -0.2056005, -3.746338, 1, 1, 1, 1, 1,
-0.6384884, -0.8020843, -4.531644, 1, 1, 1, 1, 1,
-0.6377816, -0.2501255, -1.923778, 1, 1, 1, 1, 1,
-0.6371394, -0.5106097, -2.449613, 1, 1, 1, 1, 1,
-0.6362795, 1.616401, -0.7491337, 1, 1, 1, 1, 1,
-0.6361397, -0.4650123, -2.957477, 1, 1, 1, 1, 1,
-0.6337488, -0.5840458, -2.727811, 1, 1, 1, 1, 1,
-0.6331496, -1.055532, -1.804966, 0, 0, 1, 1, 1,
-0.6314813, 1.450634, -1.157201, 1, 0, 0, 1, 1,
-0.6261324, -0.04388794, -1.149258, 1, 0, 0, 1, 1,
-0.6249045, 0.3956924, -1.726317, 1, 0, 0, 1, 1,
-0.6199989, 0.6761966, -1.14508, 1, 0, 0, 1, 1,
-0.6199074, -0.8243444, -2.966275, 1, 0, 0, 1, 1,
-0.6185932, 1.706142, 0.1409734, 0, 0, 0, 1, 1,
-0.6145294, 0.7990205, -0.6118749, 0, 0, 0, 1, 1,
-0.6128072, -1.177256, -2.305533, 0, 0, 0, 1, 1,
-0.6094145, 0.00564227, -2.355001, 0, 0, 0, 1, 1,
-0.6030105, -1.02472, -2.502129, 0, 0, 0, 1, 1,
-0.6017705, -0.03380163, -1.0557, 0, 0, 0, 1, 1,
-0.5962162, -0.7305411, -2.752895, 0, 0, 0, 1, 1,
-0.5934998, 0.5060263, 0.245035, 1, 1, 1, 1, 1,
-0.5928085, -0.09727885, -0.9452888, 1, 1, 1, 1, 1,
-0.5907151, 1.106132, -0.4492612, 1, 1, 1, 1, 1,
-0.5887827, -0.5340241, -3.697502, 1, 1, 1, 1, 1,
-0.5861619, -1.508142, -2.307498, 1, 1, 1, 1, 1,
-0.5832818, -1.208249, -2.802805, 1, 1, 1, 1, 1,
-0.5830641, -1.280284, -0.3971623, 1, 1, 1, 1, 1,
-0.5829074, 0.7231656, 0.3363639, 1, 1, 1, 1, 1,
-0.5815138, 0.1122282, -1.236453, 1, 1, 1, 1, 1,
-0.5806855, 1.318757, 0.6040224, 1, 1, 1, 1, 1,
-0.5801213, 0.5669073, -1.307661, 1, 1, 1, 1, 1,
-0.5696898, -0.7009511, -3.737223, 1, 1, 1, 1, 1,
-0.5665653, 0.8172467, -1.239413, 1, 1, 1, 1, 1,
-0.5618298, -1.608711, -4.246479, 1, 1, 1, 1, 1,
-0.560591, 1.401546, -0.6405855, 1, 1, 1, 1, 1,
-0.5562786, -0.5712989, -2.236472, 0, 0, 1, 1, 1,
-0.5539839, -0.4238494, -2.709189, 1, 0, 0, 1, 1,
-0.5535939, -0.8618459, -0.7554241, 1, 0, 0, 1, 1,
-0.5531583, -0.3507409, -0.7726061, 1, 0, 0, 1, 1,
-0.5488444, 0.7176035, -0.9981576, 1, 0, 0, 1, 1,
-0.5478168, 1.102075, 0.1974834, 1, 0, 0, 1, 1,
-0.5437801, 0.6338554, 2.535939, 0, 0, 0, 1, 1,
-0.5415667, 0.1914646, -0.1067113, 0, 0, 0, 1, 1,
-0.5391907, -0.3120193, -2.058604, 0, 0, 0, 1, 1,
-0.5366039, -0.4578, -1.390307, 0, 0, 0, 1, 1,
-0.5347708, -1.075893, -1.872341, 0, 0, 0, 1, 1,
-0.5298327, -0.6223207, -0.9935802, 0, 0, 0, 1, 1,
-0.5280882, 0.857756, 0.2940564, 0, 0, 0, 1, 1,
-0.5272197, -0.5265548, -2.889609, 1, 1, 1, 1, 1,
-0.5053217, 1.725024, -0.8474197, 1, 1, 1, 1, 1,
-0.5045751, 1.448649, -1.009865, 1, 1, 1, 1, 1,
-0.5039168, -1.571392, -1.063721, 1, 1, 1, 1, 1,
-0.5033597, 0.5121775, -1.544598, 1, 1, 1, 1, 1,
-0.4960274, 1.183071, -1.216233, 1, 1, 1, 1, 1,
-0.4934665, -0.8784146, -2.626733, 1, 1, 1, 1, 1,
-0.490841, -0.1320278, -4.116223, 1, 1, 1, 1, 1,
-0.4906341, -1.991167, -2.573185, 1, 1, 1, 1, 1,
-0.4856833, -0.06181382, -1.313166, 1, 1, 1, 1, 1,
-0.485333, 0.4728251, -0.6313245, 1, 1, 1, 1, 1,
-0.4841866, -0.2077761, -1.860602, 1, 1, 1, 1, 1,
-0.4838301, -1.156966, -2.614824, 1, 1, 1, 1, 1,
-0.4726926, -2.377805, -2.088779, 1, 1, 1, 1, 1,
-0.4712011, -0.5470248, -2.51216, 1, 1, 1, 1, 1,
-0.470714, 1.597328, -0.1470541, 0, 0, 1, 1, 1,
-0.4674653, -0.03807582, -1.149353, 1, 0, 0, 1, 1,
-0.4609559, 0.4871902, -0.9806833, 1, 0, 0, 1, 1,
-0.4597945, -0.4737535, -2.530846, 1, 0, 0, 1, 1,
-0.442636, 0.9556385, 0.2021369, 1, 0, 0, 1, 1,
-0.4377025, -0.5899258, -3.05541, 1, 0, 0, 1, 1,
-0.4368645, -0.2470343, -1.963951, 0, 0, 0, 1, 1,
-0.4328412, -0.8391262, -2.500932, 0, 0, 0, 1, 1,
-0.4317047, -0.5731072, -1.014142, 0, 0, 0, 1, 1,
-0.4301634, 2.582086, 0.09511683, 0, 0, 0, 1, 1,
-0.425343, -0.8743197, -2.278754, 0, 0, 0, 1, 1,
-0.4249642, -0.04158596, -1.95255, 0, 0, 0, 1, 1,
-0.4246626, -0.603767, -3.409151, 0, 0, 0, 1, 1,
-0.4170917, 1.093696, -0.02674882, 1, 1, 1, 1, 1,
-0.4161243, -1.066962, -4.770379, 1, 1, 1, 1, 1,
-0.4132905, -0.1675975, -1.461355, 1, 1, 1, 1, 1,
-0.4102039, -0.9913431, -4.268195, 1, 1, 1, 1, 1,
-0.4065506, -0.05382499, -1.497276, 1, 1, 1, 1, 1,
-0.4050184, 0.4632132, -1.735418, 1, 1, 1, 1, 1,
-0.4039734, -0.140568, -0.5043389, 1, 1, 1, 1, 1,
-0.4035968, 0.177042, -1.816629, 1, 1, 1, 1, 1,
-0.400324, 2.496641, 0.03471377, 1, 1, 1, 1, 1,
-0.4001812, 0.3658651, -1.612107, 1, 1, 1, 1, 1,
-0.3991168, 1.002099, -2.05572, 1, 1, 1, 1, 1,
-0.3971193, 0.1126427, -1.963236, 1, 1, 1, 1, 1,
-0.3943897, 0.8991604, 0.2219216, 1, 1, 1, 1, 1,
-0.3881703, -0.5095232, -2.075216, 1, 1, 1, 1, 1,
-0.3843471, 0.6984809, 0.2278297, 1, 1, 1, 1, 1,
-0.3833903, 0.5565595, -1.380492, 0, 0, 1, 1, 1,
-0.3817111, -1.148409, -4.054858, 1, 0, 0, 1, 1,
-0.3813211, 0.01271, -1.12707, 1, 0, 0, 1, 1,
-0.376305, -2.209437, -3.045861, 1, 0, 0, 1, 1,
-0.3675084, -0.1013713, -1.798184, 1, 0, 0, 1, 1,
-0.3659238, 1.541836, -0.6881981, 1, 0, 0, 1, 1,
-0.3639988, 1.34028, 0.4317956, 0, 0, 0, 1, 1,
-0.3629904, 0.5076939, -1.360897, 0, 0, 0, 1, 1,
-0.3625589, 1.574851, 0.1832913, 0, 0, 0, 1, 1,
-0.360014, 0.3890514, -0.5235891, 0, 0, 0, 1, 1,
-0.3592055, -0.4499608, -3.329244, 0, 0, 0, 1, 1,
-0.3571306, -0.3008253, -2.668285, 0, 0, 0, 1, 1,
-0.3550504, 0.6089237, 0.506457, 0, 0, 0, 1, 1,
-0.3548921, 1.633551, 0.5804141, 1, 1, 1, 1, 1,
-0.3523467, -0.9979293, -1.823832, 1, 1, 1, 1, 1,
-0.3489632, 0.5661185, -0.5280357, 1, 1, 1, 1, 1,
-0.3458133, 1.025862, 2.882875, 1, 1, 1, 1, 1,
-0.3412098, -0.1504135, 1.349699, 1, 1, 1, 1, 1,
-0.3372341, -0.6024082, -2.620323, 1, 1, 1, 1, 1,
-0.3353892, -0.1380991, -2.818985, 1, 1, 1, 1, 1,
-0.3343398, -1.853928, -4.763369, 1, 1, 1, 1, 1,
-0.327798, -0.3809192, -2.175504, 1, 1, 1, 1, 1,
-0.3270273, 0.1014406, -2.032355, 1, 1, 1, 1, 1,
-0.3259814, -1.531514, -3.797417, 1, 1, 1, 1, 1,
-0.3253022, -0.4075694, -2.298104, 1, 1, 1, 1, 1,
-0.3225442, -0.5415901, -4.264845, 1, 1, 1, 1, 1,
-0.312819, 0.3176161, -0.1298976, 1, 1, 1, 1, 1,
-0.310361, 0.3060118, -1.839232, 1, 1, 1, 1, 1,
-0.3061078, -0.7791831, -2.861167, 0, 0, 1, 1, 1,
-0.3056373, -0.9585848, -4.501512, 1, 0, 0, 1, 1,
-0.302914, -0.4385396, -1.652834, 1, 0, 0, 1, 1,
-0.3012285, 0.01573467, -1.54789, 1, 0, 0, 1, 1,
-0.2993994, 0.886315, -0.4036255, 1, 0, 0, 1, 1,
-0.2980821, 0.6294865, -1.164363, 1, 0, 0, 1, 1,
-0.2947177, -1.143636, -0.9494068, 0, 0, 0, 1, 1,
-0.2943703, -1.285148, -3.687414, 0, 0, 0, 1, 1,
-0.2894635, -0.5283128, -1.860973, 0, 0, 0, 1, 1,
-0.2859911, -0.7032155, -2.101898, 0, 0, 0, 1, 1,
-0.2847147, 0.2272445, -0.3960474, 0, 0, 0, 1, 1,
-0.2841885, -0.7673987, -3.270427, 0, 0, 0, 1, 1,
-0.2810623, 1.3253, -0.0704091, 0, 0, 0, 1, 1,
-0.2753486, -0.07252145, -0.6774973, 1, 1, 1, 1, 1,
-0.2728327, 0.7697019, 0.324112, 1, 1, 1, 1, 1,
-0.2691285, 0.8089333, 1.648459, 1, 1, 1, 1, 1,
-0.2688839, -0.5065733, -2.208853, 1, 1, 1, 1, 1,
-0.2673587, -1.010848, -2.319507, 1, 1, 1, 1, 1,
-0.2591335, 0.06325593, -2.724953, 1, 1, 1, 1, 1,
-0.2579272, 0.1966151, -1.510742, 1, 1, 1, 1, 1,
-0.2572562, 1.451143, -0.360181, 1, 1, 1, 1, 1,
-0.256371, -0.03809053, -2.210377, 1, 1, 1, 1, 1,
-0.2547541, 1.340444, -0.8053159, 1, 1, 1, 1, 1,
-0.2528362, -1.463327, -4.155115, 1, 1, 1, 1, 1,
-0.241964, -0.440357, -3.286784, 1, 1, 1, 1, 1,
-0.2414493, 0.3012767, -0.1486824, 1, 1, 1, 1, 1,
-0.2395882, 1.408538, -1.403738, 1, 1, 1, 1, 1,
-0.2355597, 1.592155, -0.7742852, 1, 1, 1, 1, 1,
-0.2352095, -0.2011209, -0.7337659, 0, 0, 1, 1, 1,
-0.23379, -0.08151826, -2.293159, 1, 0, 0, 1, 1,
-0.2264851, 0.3943732, -1.58909, 1, 0, 0, 1, 1,
-0.2250783, -0.3870575, -4.539896, 1, 0, 0, 1, 1,
-0.2241263, 0.1148709, -0.02231055, 1, 0, 0, 1, 1,
-0.2239707, 0.9233803, -1.853953, 1, 0, 0, 1, 1,
-0.2234319, -0.3428074, -1.087717, 0, 0, 0, 1, 1,
-0.2231079, 1.403006, -0.2338553, 0, 0, 0, 1, 1,
-0.222256, -0.1308186, -4.036548, 0, 0, 0, 1, 1,
-0.2211915, 0.2350511, -0.9342236, 0, 0, 0, 1, 1,
-0.2166944, -0.4614503, -2.831108, 0, 0, 0, 1, 1,
-0.2160502, 0.122057, -1.026611, 0, 0, 0, 1, 1,
-0.209031, 0.5611461, 1.031874, 0, 0, 0, 1, 1,
-0.2087362, -1.612588, -3.624548, 1, 1, 1, 1, 1,
-0.2075946, 0.1580554, -1.398147, 1, 1, 1, 1, 1,
-0.2062724, 0.5137659, 0.9060722, 1, 1, 1, 1, 1,
-0.2020522, 0.5714909, -0.8442413, 1, 1, 1, 1, 1,
-0.2020347, -0.3195485, -3.293369, 1, 1, 1, 1, 1,
-0.2017654, 0.6674135, -0.4310052, 1, 1, 1, 1, 1,
-0.1980854, 0.1417821, 0.1178546, 1, 1, 1, 1, 1,
-0.1974137, 0.6434403, -0.5013816, 1, 1, 1, 1, 1,
-0.1941667, -0.5192088, -3.614372, 1, 1, 1, 1, 1,
-0.1939846, 0.4077983, 0.997079, 1, 1, 1, 1, 1,
-0.1900713, -0.6322542, -1.56583, 1, 1, 1, 1, 1,
-0.1866599, 0.2685899, 0.2954618, 1, 1, 1, 1, 1,
-0.1865737, 1.469707, -1.840402, 1, 1, 1, 1, 1,
-0.1863322, -0.4364917, -2.699079, 1, 1, 1, 1, 1,
-0.1862367, 0.1521067, -0.01384342, 1, 1, 1, 1, 1,
-0.1859412, -0.3022846, -2.5635, 0, 0, 1, 1, 1,
-0.1857835, 0.4770126, -2.594003, 1, 0, 0, 1, 1,
-0.1820969, -0.2201455, -3.473529, 1, 0, 0, 1, 1,
-0.1805204, 0.1574014, -1.005012, 1, 0, 0, 1, 1,
-0.1790465, 1.023128, 0.4777704, 1, 0, 0, 1, 1,
-0.1778888, 1.974693, 0.2454663, 1, 0, 0, 1, 1,
-0.1757441, -0.7184923, -0.7782936, 0, 0, 0, 1, 1,
-0.1757118, -0.3228212, -1.816271, 0, 0, 0, 1, 1,
-0.168403, 0.2687525, -1.334102, 0, 0, 0, 1, 1,
-0.16652, -2.154742, -2.866706, 0, 0, 0, 1, 1,
-0.1648501, 0.6211973, -1.46894, 0, 0, 0, 1, 1,
-0.1640411, -3.425529, -2.675357, 0, 0, 0, 1, 1,
-0.1581214, -0.4322837, -3.093235, 0, 0, 0, 1, 1,
-0.1578344, 1.06887, 0.4807481, 1, 1, 1, 1, 1,
-0.1515718, -0.2512877, -2.46711, 1, 1, 1, 1, 1,
-0.1486116, 0.2449924, -0.4790629, 1, 1, 1, 1, 1,
-0.1472749, 0.6026056, -0.02543454, 1, 1, 1, 1, 1,
-0.1472632, 0.5202057, -0.7214167, 1, 1, 1, 1, 1,
-0.1450491, -0.2803862, -2.725045, 1, 1, 1, 1, 1,
-0.1440961, 0.169769, -1.055784, 1, 1, 1, 1, 1,
-0.1392635, -0.5368196, -4.015947, 1, 1, 1, 1, 1,
-0.1369374, 0.04275594, -0.5813345, 1, 1, 1, 1, 1,
-0.1349016, -0.8799364, -2.595954, 1, 1, 1, 1, 1,
-0.1325741, -1.010494, -2.342613, 1, 1, 1, 1, 1,
-0.1319181, 1.585011, 0.9769138, 1, 1, 1, 1, 1,
-0.1194371, -0.7032178, -2.404665, 1, 1, 1, 1, 1,
-0.1162602, 1.04441, -0.2297261, 1, 1, 1, 1, 1,
-0.1146567, 0.9305704, -1.330528, 1, 1, 1, 1, 1,
-0.1144116, 0.6746817, 0.5745001, 0, 0, 1, 1, 1,
-0.1137874, 1.157877, -1.402147, 1, 0, 0, 1, 1,
-0.1106276, -0.8757536, -4.026819, 1, 0, 0, 1, 1,
-0.1094116, 0.3672983, -0.9378499, 1, 0, 0, 1, 1,
-0.1078116, -0.8464311, -1.464177, 1, 0, 0, 1, 1,
-0.1074429, 0.03162168, -0.8691361, 1, 0, 0, 1, 1,
-0.1049094, 2.511518, 0.7202573, 0, 0, 0, 1, 1,
-0.1019069, -0.9205053, -3.226633, 0, 0, 0, 1, 1,
-0.1000642, -0.7249809, -1.392759, 0, 0, 0, 1, 1,
-0.08928744, -0.5002809, -4.048813, 0, 0, 0, 1, 1,
-0.08838288, -0.9511694, -3.191878, 0, 0, 0, 1, 1,
-0.0874823, -0.1095777, -2.251661, 0, 0, 0, 1, 1,
-0.08577411, -0.9268978, -4.840024, 0, 0, 0, 1, 1,
-0.08572567, -0.5194899, -2.919318, 1, 1, 1, 1, 1,
-0.07612058, -0.2490095, -2.893038, 1, 1, 1, 1, 1,
-0.07196004, -1.661216, -2.607571, 1, 1, 1, 1, 1,
-0.06890266, 0.9033753, 0.8358478, 1, 1, 1, 1, 1,
-0.06642658, -1.161119, -3.042798, 1, 1, 1, 1, 1,
-0.064743, -0.4079595, -4.018683, 1, 1, 1, 1, 1,
-0.0631246, 1.093799, -0.6346808, 1, 1, 1, 1, 1,
-0.06015276, -0.9987496, -0.139308, 1, 1, 1, 1, 1,
-0.0594684, 0.2288635, 0.9633163, 1, 1, 1, 1, 1,
-0.05704907, 0.8665826, -1.261874, 1, 1, 1, 1, 1,
-0.05233082, -0.7662613, -2.11916, 1, 1, 1, 1, 1,
-0.0521966, 0.2588814, 1.85967, 1, 1, 1, 1, 1,
-0.05058431, 0.1323151, -1.247171, 1, 1, 1, 1, 1,
-0.0497467, 0.6969413, -0.2056333, 1, 1, 1, 1, 1,
-0.04462776, 0.5886432, 0.6066892, 1, 1, 1, 1, 1,
-0.04273546, 2.270294, 0.1372307, 0, 0, 1, 1, 1,
-0.03767461, -0.3770652, -2.275132, 1, 0, 0, 1, 1,
-0.03566941, 0.0399532, -1.608002, 1, 0, 0, 1, 1,
-0.03112183, -2.059491, -4.961497, 1, 0, 0, 1, 1,
-0.03077431, -0.1362824, -2.942921, 1, 0, 0, 1, 1,
-0.03074408, -0.7241002, -4.811854, 1, 0, 0, 1, 1,
-0.02965669, -2.101461, -4.217824, 0, 0, 0, 1, 1,
-0.0275918, 0.5259743, 0.530432, 0, 0, 0, 1, 1,
-0.02645168, -0.3036181, -4.864231, 0, 0, 0, 1, 1,
-0.02601998, 0.6434093, -0.7589563, 0, 0, 0, 1, 1,
-0.0245498, 0.6955662, 1.547513, 0, 0, 0, 1, 1,
-0.02423725, -0.4206766, -3.243243, 0, 0, 0, 1, 1,
-0.0240594, -0.2358043, -2.16287, 0, 0, 0, 1, 1,
-0.0211495, 0.1216153, -1.701405, 1, 1, 1, 1, 1,
-0.02065489, 0.3639125, -1.205868, 1, 1, 1, 1, 1,
-0.0188775, 0.5221567, 0.8568387, 1, 1, 1, 1, 1,
-0.01862975, 0.06564043, -0.4310925, 1, 1, 1, 1, 1,
-0.01479258, 0.9679109, -0.7164391, 1, 1, 1, 1, 1,
-0.01274401, -0.2061659, -0.8121904, 1, 1, 1, 1, 1,
-0.01237584, 0.9103444, 1.979747, 1, 1, 1, 1, 1,
-0.01206232, 1.029743, -1.908649, 1, 1, 1, 1, 1,
-0.01017963, 0.3110403, 0.966859, 1, 1, 1, 1, 1,
-0.009564201, 1.235102, -0.4193355, 1, 1, 1, 1, 1,
-0.006640165, 0.8039207, -1.084982, 1, 1, 1, 1, 1,
-0.00124883, 0.6205152, -2.34765, 1, 1, 1, 1, 1,
0.0008229391, -1.343725, 2.460969, 1, 1, 1, 1, 1,
0.004139944, -0.7153785, 5.248877, 1, 1, 1, 1, 1,
0.004418951, 1.60157, 0.5737959, 1, 1, 1, 1, 1,
0.007073241, -0.1677184, 0.548125, 0, 0, 1, 1, 1,
0.009499574, -0.8031784, 3.215987, 1, 0, 0, 1, 1,
0.01023713, -1.702969, 2.59577, 1, 0, 0, 1, 1,
0.01317761, 0.6968911, -0.7573019, 1, 0, 0, 1, 1,
0.01512423, -0.4101488, 3.169941, 1, 0, 0, 1, 1,
0.0220567, 1.276534, -1.562883, 1, 0, 0, 1, 1,
0.02206889, 0.9039933, 0.881243, 0, 0, 0, 1, 1,
0.02421715, -0.3180604, 2.183508, 0, 0, 0, 1, 1,
0.02537284, -0.9161363, 4.839202, 0, 0, 0, 1, 1,
0.02853109, 2.175868, 0.06904031, 0, 0, 0, 1, 1,
0.03215093, 0.4211116, 0.8694207, 0, 0, 0, 1, 1,
0.03285026, 0.003846152, 0.4333034, 0, 0, 0, 1, 1,
0.03482946, -1.307776, 4.341527, 0, 0, 0, 1, 1,
0.03666992, -0.6934015, 3.287279, 1, 1, 1, 1, 1,
0.03667315, 1.77928, -0.133751, 1, 1, 1, 1, 1,
0.03768743, 0.4617376, 0.9034647, 1, 1, 1, 1, 1,
0.03793747, -0.4539539, 3.465436, 1, 1, 1, 1, 1,
0.04406966, -0.7753245, 3.179374, 1, 1, 1, 1, 1,
0.04677142, 0.2491763, 1.404391, 1, 1, 1, 1, 1,
0.04862962, -0.6267687, 1.225134, 1, 1, 1, 1, 1,
0.04982981, -0.1687396, 1.578652, 1, 1, 1, 1, 1,
0.05318702, -1.115519, 4.388797, 1, 1, 1, 1, 1,
0.05685534, -0.9331706, 3.766733, 1, 1, 1, 1, 1,
0.0579168, 0.5473347, 2.035354, 1, 1, 1, 1, 1,
0.06440982, -0.04506206, 2.263032, 1, 1, 1, 1, 1,
0.06468419, 0.9626207, -0.1203794, 1, 1, 1, 1, 1,
0.06720032, 0.4000914, 0.8458917, 1, 1, 1, 1, 1,
0.06771352, 0.6462255, 0.5103208, 1, 1, 1, 1, 1,
0.07064851, -0.3097525, 2.325305, 0, 0, 1, 1, 1,
0.0708352, 0.373147, -1.575643, 1, 0, 0, 1, 1,
0.07293531, 1.096856, -0.9778862, 1, 0, 0, 1, 1,
0.07765561, -0.07078519, 2.374737, 1, 0, 0, 1, 1,
0.0790682, 0.7461553, -0.4780594, 1, 0, 0, 1, 1,
0.08054366, -0.2875274, 3.272112, 1, 0, 0, 1, 1,
0.08098555, -0.6352335, 3.689664, 0, 0, 0, 1, 1,
0.08953603, 1.851346, 1.417487, 0, 0, 0, 1, 1,
0.09392617, 1.463852, -0.7285835, 0, 0, 0, 1, 1,
0.1013423, 1.700353, -3.02345, 0, 0, 0, 1, 1,
0.101347, 1.06847, -0.3399801, 0, 0, 0, 1, 1,
0.1044985, -0.7714061, 4.532882, 0, 0, 0, 1, 1,
0.1081415, 0.02624679, 2.333734, 0, 0, 0, 1, 1,
0.1107403, -0.5565888, 2.976392, 1, 1, 1, 1, 1,
0.1180923, 0.3167793, 1.386142, 1, 1, 1, 1, 1,
0.1182976, -2.309193, 3.72283, 1, 1, 1, 1, 1,
0.1192985, -0.7885268, 3.64438, 1, 1, 1, 1, 1,
0.1203225, 0.5239224, 1.5136, 1, 1, 1, 1, 1,
0.1261909, 1.824478, -0.7712035, 1, 1, 1, 1, 1,
0.1326032, 0.5002175, 1.416381, 1, 1, 1, 1, 1,
0.1348987, 1.505728, -1.763871, 1, 1, 1, 1, 1,
0.1390888, 0.6122082, 1.004145, 1, 1, 1, 1, 1,
0.1422638, -1.449632, 2.232098, 1, 1, 1, 1, 1,
0.1458224, 1.140913, -0.6534481, 1, 1, 1, 1, 1,
0.149084, 1.381764, 0.2092816, 1, 1, 1, 1, 1,
0.1501896, 0.1443458, 0.2941959, 1, 1, 1, 1, 1,
0.1553244, 0.2545044, 0.7715642, 1, 1, 1, 1, 1,
0.1580216, -0.4689298, 2.398562, 1, 1, 1, 1, 1,
0.1619215, 0.3188305, -0.2525075, 0, 0, 1, 1, 1,
0.1670842, 1.611545, -0.378634, 1, 0, 0, 1, 1,
0.1681116, -0.141592, 2.322324, 1, 0, 0, 1, 1,
0.1702784, 0.3671003, -0.8485007, 1, 0, 0, 1, 1,
0.17485, -1.042055, 2.867462, 1, 0, 0, 1, 1,
0.177039, 0.2385481, 1.058001, 1, 0, 0, 1, 1,
0.1773847, -0.1308175, 2.944339, 0, 0, 0, 1, 1,
0.1801227, 1.988173, -3.38845, 0, 0, 0, 1, 1,
0.1920997, 1.663429, -0.3397003, 0, 0, 0, 1, 1,
0.1933881, -1.251148, 4.01591, 0, 0, 0, 1, 1,
0.1967942, 0.5662431, -0.2881334, 0, 0, 0, 1, 1,
0.1994028, 0.3267972, 0.5765359, 0, 0, 0, 1, 1,
0.2003339, -1.267539, 1.949551, 0, 0, 0, 1, 1,
0.2012772, -0.8705012, 3.314715, 1, 1, 1, 1, 1,
0.2018591, 1.086185, -0.2795286, 1, 1, 1, 1, 1,
0.2070106, 0.778195, 0.8417969, 1, 1, 1, 1, 1,
0.2078287, 0.1880906, 1.256366, 1, 1, 1, 1, 1,
0.2097689, -0.220888, 1.36579, 1, 1, 1, 1, 1,
0.2159852, -0.248908, 1.888418, 1, 1, 1, 1, 1,
0.2185418, 3.093758, 0.10573, 1, 1, 1, 1, 1,
0.2205218, -0.1754486, 3.477234, 1, 1, 1, 1, 1,
0.2245148, 0.5313122, 2.266535, 1, 1, 1, 1, 1,
0.2250529, -0.2092601, 1.331249, 1, 1, 1, 1, 1,
0.2272971, 1.33069, 0.9744507, 1, 1, 1, 1, 1,
0.2310214, -1.828013, 3.940365, 1, 1, 1, 1, 1,
0.2312311, 1.757315, -1.440541, 1, 1, 1, 1, 1,
0.2313973, -1.309698, 4.209611, 1, 1, 1, 1, 1,
0.2318465, 0.6761873, 0.7402391, 1, 1, 1, 1, 1,
0.2344318, -0.2976461, 2.067193, 0, 0, 1, 1, 1,
0.2413337, -0.6887007, 1.252608, 1, 0, 0, 1, 1,
0.2440522, 0.3994917, 1.300469, 1, 0, 0, 1, 1,
0.2490446, -0.4812615, 1.183633, 1, 0, 0, 1, 1,
0.2492245, 0.2695656, 1.114902, 1, 0, 0, 1, 1,
0.2534045, -0.2827179, 3.082353, 1, 0, 0, 1, 1,
0.2536758, -0.9219885, 1.268155, 0, 0, 0, 1, 1,
0.2537894, -0.4801852, 2.806627, 0, 0, 0, 1, 1,
0.2556937, -0.1795288, 1.364483, 0, 0, 0, 1, 1,
0.2593592, 0.9765901, 0.7439405, 0, 0, 0, 1, 1,
0.261461, 0.8379472, -1.420957, 0, 0, 0, 1, 1,
0.2639081, -2.088059, 3.883604, 0, 0, 0, 1, 1,
0.2645546, 0.4213299, 0.831708, 0, 0, 0, 1, 1,
0.2650259, 0.6042975, 0.6984149, 1, 1, 1, 1, 1,
0.2656622, 1.526756, 1.556637, 1, 1, 1, 1, 1,
0.2657652, 0.8105676, 0.2856018, 1, 1, 1, 1, 1,
0.2693341, 1.217066, -0.2487334, 1, 1, 1, 1, 1,
0.2706033, 0.4507979, 2.281851, 1, 1, 1, 1, 1,
0.2732134, -0.7704883, 2.411931, 1, 1, 1, 1, 1,
0.2732435, -2.955568, 3.092212, 1, 1, 1, 1, 1,
0.2733723, -0.8981323, 4.174543, 1, 1, 1, 1, 1,
0.2734467, -1.688734, 3.642609, 1, 1, 1, 1, 1,
0.273639, -0.6972492, 1.544525, 1, 1, 1, 1, 1,
0.2764397, -0.9268528, 2.697175, 1, 1, 1, 1, 1,
0.277339, -0.09965637, 2.054751, 1, 1, 1, 1, 1,
0.2788739, -1.897517, 1.170531, 1, 1, 1, 1, 1,
0.285901, -0.3856833, 3.713449, 1, 1, 1, 1, 1,
0.2888127, 1.280788, -0.2815309, 1, 1, 1, 1, 1,
0.2903689, 1.022035, 1.407091, 0, 0, 1, 1, 1,
0.2909429, -1.05584, 3.333154, 1, 0, 0, 1, 1,
0.2986732, -0.7282744, 1.383944, 1, 0, 0, 1, 1,
0.299225, 0.3375369, -1.052652, 1, 0, 0, 1, 1,
0.3024597, 0.8236455, 1.377986, 1, 0, 0, 1, 1,
0.3064908, 0.3165937, 0.02751163, 1, 0, 0, 1, 1,
0.3107012, -1.569011, 2.098989, 0, 0, 0, 1, 1,
0.3135535, 0.5991119, -1.402097, 0, 0, 0, 1, 1,
0.3139696, 0.2928108, -0.5205312, 0, 0, 0, 1, 1,
0.3197436, 0.04685367, 1.344197, 0, 0, 0, 1, 1,
0.3207232, -1.070884, 3.673663, 0, 0, 0, 1, 1,
0.3254624, 0.4235364, 1.926328, 0, 0, 0, 1, 1,
0.3310177, -1.083764, 3.81461, 0, 0, 0, 1, 1,
0.3332019, 0.9531806, 0.6968971, 1, 1, 1, 1, 1,
0.3343165, 1.671874, -0.3412056, 1, 1, 1, 1, 1,
0.338099, -0.5606857, 2.609874, 1, 1, 1, 1, 1,
0.3394235, 0.6405025, 1.184295, 1, 1, 1, 1, 1,
0.3444566, 0.5100776, 1.287422, 1, 1, 1, 1, 1,
0.3451165, -1.523084, 4.361324, 1, 1, 1, 1, 1,
0.3479727, 2.660258, 1.264, 1, 1, 1, 1, 1,
0.3520238, -0.3894135, 1.257837, 1, 1, 1, 1, 1,
0.354284, -2.043355, 4.282101, 1, 1, 1, 1, 1,
0.3561544, -0.9881315, 2.951568, 1, 1, 1, 1, 1,
0.358493, 0.9344441, 1.164729, 1, 1, 1, 1, 1,
0.3637286, 0.0351491, 1.450085, 1, 1, 1, 1, 1,
0.3641782, -0.3273437, 3.38798, 1, 1, 1, 1, 1,
0.3654902, -1.193141, 1.895177, 1, 1, 1, 1, 1,
0.3696277, -1.245859, 2.27661, 1, 1, 1, 1, 1,
0.3714257, 0.49538, -0.05363521, 0, 0, 1, 1, 1,
0.3728915, 1.416439, 1.165189, 1, 0, 0, 1, 1,
0.3732598, -0.4798903, 1.832814, 1, 0, 0, 1, 1,
0.373545, -0.8748507, 2.686833, 1, 0, 0, 1, 1,
0.3738073, -0.6789742, 3.942773, 1, 0, 0, 1, 1,
0.3772135, -1.464636, 2.6079, 1, 0, 0, 1, 1,
0.3791662, 0.653886, 1.314489, 0, 0, 0, 1, 1,
0.3799102, -0.7588622, 1.23715, 0, 0, 0, 1, 1,
0.3842271, -0.6524787, 5.132821, 0, 0, 0, 1, 1,
0.3863836, 1.699728, -0.1928876, 0, 0, 0, 1, 1,
0.3871591, 1.036719, 1.056112, 0, 0, 0, 1, 1,
0.3873367, -0.5210156, 2.096104, 0, 0, 0, 1, 1,
0.3887976, -1.280098, 2.138839, 0, 0, 0, 1, 1,
0.3892584, 0.3221725, 1.300804, 1, 1, 1, 1, 1,
0.3921835, -0.9896671, 3.384465, 1, 1, 1, 1, 1,
0.3934913, -0.09103978, 1.460817, 1, 1, 1, 1, 1,
0.3937057, -1.041103, 1.774068, 1, 1, 1, 1, 1,
0.39542, -0.3387175, 2.400497, 1, 1, 1, 1, 1,
0.3969692, 1.149974, 0.4274224, 1, 1, 1, 1, 1,
0.3973129, -1.160356, 1.976483, 1, 1, 1, 1, 1,
0.4010686, 0.269022, 2.454388, 1, 1, 1, 1, 1,
0.4031261, 0.7437181, 2.234356, 1, 1, 1, 1, 1,
0.4049612, 0.6133847, 1.340138, 1, 1, 1, 1, 1,
0.41558, 0.3010621, 2.632796, 1, 1, 1, 1, 1,
0.4179306, -1.532111, 3.813114, 1, 1, 1, 1, 1,
0.4186891, -1.079831, 1.928794, 1, 1, 1, 1, 1,
0.4202117, -0.05650236, 2.068435, 1, 1, 1, 1, 1,
0.4212679, 0.4549014, 0.8825883, 1, 1, 1, 1, 1,
0.4248257, 0.652151, 1.173164, 0, 0, 1, 1, 1,
0.4275557, -0.27363, 1.641051, 1, 0, 0, 1, 1,
0.4291098, -1.887064, 2.253948, 1, 0, 0, 1, 1,
0.4292488, 0.6020187, 1.097992, 1, 0, 0, 1, 1,
0.4397432, -0.2093922, 2.434123, 1, 0, 0, 1, 1,
0.4445835, 1.507386, -0.9316604, 1, 0, 0, 1, 1,
0.4454668, 0.08143578, 2.749043, 0, 0, 0, 1, 1,
0.4479198, -0.4335687, 3.276686, 0, 0, 0, 1, 1,
0.4493344, -0.1001477, 3.379179, 0, 0, 0, 1, 1,
0.4510645, 0.6858704, -0.6773596, 0, 0, 0, 1, 1,
0.4514549, -0.8947031, 3.345685, 0, 0, 0, 1, 1,
0.4539715, -0.2555864, 2.881407, 0, 0, 0, 1, 1,
0.4603161, 0.2752081, 2.759018, 0, 0, 0, 1, 1,
0.4604965, -1.137577, 1.453618, 1, 1, 1, 1, 1,
0.4606797, -1.001027, 1.203426, 1, 1, 1, 1, 1,
0.461044, 0.549289, 0.7556865, 1, 1, 1, 1, 1,
0.471359, 0.479014, -0.1507318, 1, 1, 1, 1, 1,
0.4850709, 0.6202834, 0.8738528, 1, 1, 1, 1, 1,
0.4890164, 0.1029259, 0.7109091, 1, 1, 1, 1, 1,
0.4915808, 0.5477939, 0.1143794, 1, 1, 1, 1, 1,
0.4925021, -1.478446, 1.72051, 1, 1, 1, 1, 1,
0.493031, -0.2841286, 2.717539, 1, 1, 1, 1, 1,
0.4984736, -1.131212, 3.517681, 1, 1, 1, 1, 1,
0.4987911, -1.256333, 2.526228, 1, 1, 1, 1, 1,
0.5008808, 0.2599729, 0.7250651, 1, 1, 1, 1, 1,
0.5011704, -1.069744, 1.733316, 1, 1, 1, 1, 1,
0.5022836, -0.4190482, 1.222307, 1, 1, 1, 1, 1,
0.5030463, -0.8910195, 2.019379, 1, 1, 1, 1, 1,
0.5052645, 0.1729282, 1.088451, 0, 0, 1, 1, 1,
0.5058557, -1.78638, 2.979972, 1, 0, 0, 1, 1,
0.5062029, 0.8826387, 0.5712169, 1, 0, 0, 1, 1,
0.5067528, 0.4289234, 1.436168, 1, 0, 0, 1, 1,
0.5123954, -1.001391, 4.373194, 1, 0, 0, 1, 1,
0.5146899, -1.479483, 2.786263, 1, 0, 0, 1, 1,
0.5162989, -0.3971147, 1.224879, 0, 0, 0, 1, 1,
0.5186163, 1.631721, 0.1697642, 0, 0, 0, 1, 1,
0.5198558, -0.167845, 1.507755, 0, 0, 0, 1, 1,
0.5199292, 0.9848041, -1.818558, 0, 0, 0, 1, 1,
0.5244047, -1.637467, 2.039553, 0, 0, 0, 1, 1,
0.5280775, 1.766072, 1.715637, 0, 0, 0, 1, 1,
0.5287231, 0.4598866, 0.8963113, 0, 0, 0, 1, 1,
0.5290632, 0.185118, 1.20227, 1, 1, 1, 1, 1,
0.5291794, -1.663191, 2.589027, 1, 1, 1, 1, 1,
0.5336244, 0.6636791, 1.077385, 1, 1, 1, 1, 1,
0.5357864, 0.402752, 0.8939933, 1, 1, 1, 1, 1,
0.537212, -0.1947043, 2.992036, 1, 1, 1, 1, 1,
0.5374553, 0.3177866, -0.7241704, 1, 1, 1, 1, 1,
0.5420662, -1.008892, 3.68891, 1, 1, 1, 1, 1,
0.5436796, -1.862358, 3.771024, 1, 1, 1, 1, 1,
0.5451235, -0.1422427, 1.772933, 1, 1, 1, 1, 1,
0.5457221, 0.2447232, 1.5275, 1, 1, 1, 1, 1,
0.5493762, -0.9341267, 1.389142, 1, 1, 1, 1, 1,
0.5506036, -0.6898555, 4.369754, 1, 1, 1, 1, 1,
0.5530233, -0.4124363, 2.440211, 1, 1, 1, 1, 1,
0.5530278, 1.62794, -1.355699, 1, 1, 1, 1, 1,
0.5530567, -0.445116, 2.390832, 1, 1, 1, 1, 1,
0.5537726, 0.2503596, 0.6177872, 0, 0, 1, 1, 1,
0.5566278, -0.3124971, 0.9850745, 1, 0, 0, 1, 1,
0.557197, -0.6311939, 4.179822, 1, 0, 0, 1, 1,
0.5623541, -0.5043593, 2.922903, 1, 0, 0, 1, 1,
0.5665334, -0.9874328, 1.837709, 1, 0, 0, 1, 1,
0.5668982, -0.7830821, 1.875975, 1, 0, 0, 1, 1,
0.5750729, 0.5569224, 2.33995, 0, 0, 0, 1, 1,
0.5758904, 2.738162, -0.3467136, 0, 0, 0, 1, 1,
0.5771721, 1.151238, 0.04561752, 0, 0, 0, 1, 1,
0.5800397, 0.3447154, 1.548174, 0, 0, 0, 1, 1,
0.5824635, -0.6090406, 3.582057, 0, 0, 0, 1, 1,
0.5852505, 1.856314, 0.5980663, 0, 0, 0, 1, 1,
0.5856755, 0.6914499, 0.7971787, 0, 0, 0, 1, 1,
0.5857381, -0.04077547, 1.746654, 1, 1, 1, 1, 1,
0.5875832, 0.5981859, -0.4966783, 1, 1, 1, 1, 1,
0.5916778, -1.03648, 1.358959, 1, 1, 1, 1, 1,
0.596065, 0.7602586, 0.7316366, 1, 1, 1, 1, 1,
0.5968943, -2.364153, 2.402247, 1, 1, 1, 1, 1,
0.6061512, -0.3014953, 2.98173, 1, 1, 1, 1, 1,
0.6079621, 0.8798609, -0.5192588, 1, 1, 1, 1, 1,
0.6135985, 2.403119, 1.72563, 1, 1, 1, 1, 1,
0.6147341, 0.6287954, 1.33829, 1, 1, 1, 1, 1,
0.6159378, 0.2589, 0.8413902, 1, 1, 1, 1, 1,
0.6170357, 0.09128819, 1.155153, 1, 1, 1, 1, 1,
0.6180946, -0.1690432, -0.9254686, 1, 1, 1, 1, 1,
0.6215744, 1.576655, -1.318559, 1, 1, 1, 1, 1,
0.6216363, -0.1641838, 1.984665, 1, 1, 1, 1, 1,
0.6239669, 1.037949, 0.9950349, 1, 1, 1, 1, 1,
0.6407216, -0.09635571, 0.6676124, 0, 0, 1, 1, 1,
0.6470757, 0.04050907, 1.321544, 1, 0, 0, 1, 1,
0.6474528, 0.4250797, 0.6884205, 1, 0, 0, 1, 1,
0.6495944, -1.09367, 3.955219, 1, 0, 0, 1, 1,
0.6503815, 0.7994282, 1.95425, 1, 0, 0, 1, 1,
0.6656628, 0.6829601, -0.8818192, 1, 0, 0, 1, 1,
0.6671245, 0.4554476, 0.08679766, 0, 0, 0, 1, 1,
0.6687187, 0.002517528, 1.57551, 0, 0, 0, 1, 1,
0.6744413, -0.4451246, 1.890876, 0, 0, 0, 1, 1,
0.6776824, -3.4848, 4.054398, 0, 0, 0, 1, 1,
0.6784157, 0.356258, 1.272977, 0, 0, 0, 1, 1,
0.6827021, 0.3731673, 0.1453715, 0, 0, 0, 1, 1,
0.6941397, 0.04904177, 0.7547117, 0, 0, 0, 1, 1,
0.7043745, -0.7042757, 1.797934, 1, 1, 1, 1, 1,
0.7073042, -0.9790689, 1.356899, 1, 1, 1, 1, 1,
0.7249058, 0.5999306, 0.9385373, 1, 1, 1, 1, 1,
0.7249922, 0.03521197, 0.4930006, 1, 1, 1, 1, 1,
0.7265316, 0.5902996, -0.08308896, 1, 1, 1, 1, 1,
0.728933, 1.227111, 1.149781, 1, 1, 1, 1, 1,
0.7316898, -0.2315777, 1.305978, 1, 1, 1, 1, 1,
0.7322816, 1.940819, 0.7411184, 1, 1, 1, 1, 1,
0.7520525, 0.7832121, 1.714556, 1, 1, 1, 1, 1,
0.7531417, -1.355926, 3.457114, 1, 1, 1, 1, 1,
0.7533376, 0.1982921, 1.726427, 1, 1, 1, 1, 1,
0.7555125, -0.5041109, 2.579002, 1, 1, 1, 1, 1,
0.7614941, -0.5890524, 2.823473, 1, 1, 1, 1, 1,
0.7634006, -0.5684022, 2.838523, 1, 1, 1, 1, 1,
0.7652997, 1.571864, 1.453575, 1, 1, 1, 1, 1,
0.7674346, 0.1722158, -1.148115, 0, 0, 1, 1, 1,
0.767766, 1.622239, 1.157694, 1, 0, 0, 1, 1,
0.7678449, 0.5153252, 1.245074, 1, 0, 0, 1, 1,
0.7701147, -0.6585541, 3.368245, 1, 0, 0, 1, 1,
0.7741268, 0.5999233, 1.214551, 1, 0, 0, 1, 1,
0.7753077, -0.2118754, 0.9439896, 1, 0, 0, 1, 1,
0.7790257, 0.2170655, 0.6161988, 0, 0, 0, 1, 1,
0.7798584, -0.09278435, -0.1247088, 0, 0, 0, 1, 1,
0.7806077, 0.1679884, 1.081732, 0, 0, 0, 1, 1,
0.7848635, 0.8499317, 0.9802796, 0, 0, 0, 1, 1,
0.7935708, -2.66572, 3.592325, 0, 0, 0, 1, 1,
0.7969447, -0.2642513, 3.730686, 0, 0, 0, 1, 1,
0.8012499, 0.3169659, 2.228909, 0, 0, 0, 1, 1,
0.8045042, 1.31895, 0.6108315, 1, 1, 1, 1, 1,
0.8057313, -1.960071, 2.984446, 1, 1, 1, 1, 1,
0.8060722, -1.262911, 1.720637, 1, 1, 1, 1, 1,
0.8077527, -0.8723053, 1.106607, 1, 1, 1, 1, 1,
0.8088965, 2.35921, -0.09718239, 1, 1, 1, 1, 1,
0.8103438, -1.766733, 4.505283, 1, 1, 1, 1, 1,
0.812082, 0.6518049, -2.016296, 1, 1, 1, 1, 1,
0.8140168, 0.04823, 0.2859718, 1, 1, 1, 1, 1,
0.8170805, 0.5108765, 2.160098, 1, 1, 1, 1, 1,
0.820956, -0.0271988, 0.6243601, 1, 1, 1, 1, 1,
0.8222833, 0.893099, 0.659245, 1, 1, 1, 1, 1,
0.823816, -0.813423, 2.414699, 1, 1, 1, 1, 1,
0.8302168, -1.50774, 1.914248, 1, 1, 1, 1, 1,
0.8314415, 0.3499657, 1.122612, 1, 1, 1, 1, 1,
0.8333628, -0.7311147, 1.527848, 1, 1, 1, 1, 1,
0.8363059, -0.4251329, 0.7013488, 0, 0, 1, 1, 1,
0.8365943, -0.8157281, 2.311543, 1, 0, 0, 1, 1,
0.8375443, -0.1870462, 2.358914, 1, 0, 0, 1, 1,
0.839892, -0.4387121, 3.126478, 1, 0, 0, 1, 1,
0.848608, -1.124947, 1.984267, 1, 0, 0, 1, 1,
0.8500635, 0.8005334, 0.2504214, 1, 0, 0, 1, 1,
0.8508158, -1.220704, 0.8817195, 0, 0, 0, 1, 1,
0.8510674, -0.2899144, 1.731273, 0, 0, 0, 1, 1,
0.8511378, -1.403937, 3.557344, 0, 0, 0, 1, 1,
0.8594025, 0.6403907, 1.992533, 0, 0, 0, 1, 1,
0.8636121, -0.5188457, 1.231542, 0, 0, 0, 1, 1,
0.8658655, 1.483447, 1.215683, 0, 0, 0, 1, 1,
0.8768993, -1.029668, 0.1927297, 0, 0, 0, 1, 1,
0.8780518, 0.5898124, 0.7221372, 1, 1, 1, 1, 1,
0.8781549, 0.2015391, 1.44539, 1, 1, 1, 1, 1,
0.8802796, -1.107671, 2.991656, 1, 1, 1, 1, 1,
0.8804128, -1.837245, 3.825009, 1, 1, 1, 1, 1,
0.8806264, 0.540899, 0.4167011, 1, 1, 1, 1, 1,
0.8814735, -1.251312, 2.611132, 1, 1, 1, 1, 1,
0.8974127, 1.112058, 1.642693, 1, 1, 1, 1, 1,
0.8986902, -0.208077, 2.061231, 1, 1, 1, 1, 1,
0.9044302, 1.033347, 0.9956353, 1, 1, 1, 1, 1,
0.9058924, -0.2090217, 1.479667, 1, 1, 1, 1, 1,
0.9068158, 0.01567648, 0.7576178, 1, 1, 1, 1, 1,
0.9080692, -0.3191288, 3.150259, 1, 1, 1, 1, 1,
0.9103483, -0.09222111, 1.467631, 1, 1, 1, 1, 1,
0.9117792, 1.312973, -0.1161211, 1, 1, 1, 1, 1,
0.912152, 0.2860229, 0.4202153, 1, 1, 1, 1, 1,
0.9129601, 1.074631, 1.218518, 0, 0, 1, 1, 1,
0.9140758, -0.9042262, 3.903598, 1, 0, 0, 1, 1,
0.9173622, -1.084982, 2.42796, 1, 0, 0, 1, 1,
0.9283858, -0.271941, 2.68269, 1, 0, 0, 1, 1,
0.9302449, 0.4463893, 1.381618, 1, 0, 0, 1, 1,
0.9349654, -0.3751078, 0.779615, 1, 0, 0, 1, 1,
0.936253, -0.8399668, 2.003181, 0, 0, 0, 1, 1,
0.9378205, 0.341747, 0.5553159, 0, 0, 0, 1, 1,
0.9395147, -0.09985181, 0.6669281, 0, 0, 0, 1, 1,
0.9419765, 0.1025793, 2.110658, 0, 0, 0, 1, 1,
0.9515983, 0.6501004, 0.7098975, 0, 0, 0, 1, 1,
0.9524083, 0.2765068, 1.103167, 0, 0, 0, 1, 1,
0.953549, 0.6302437, 2.271799, 0, 0, 0, 1, 1,
0.9611921, -0.0840454, 1.663475, 1, 1, 1, 1, 1,
0.9683717, 0.0790299, 0.1679006, 1, 1, 1, 1, 1,
0.9684158, -0.4677075, 3.748157, 1, 1, 1, 1, 1,
0.9758367, 1.860065, -0.4491857, 1, 1, 1, 1, 1,
0.9826405, 1.618999, 1.626498, 1, 1, 1, 1, 1,
0.9928958, -0.6964945, 4.24493, 1, 1, 1, 1, 1,
1.001671, -1.38115, 2.596822, 1, 1, 1, 1, 1,
1.003835, -1.163054, 4.276215, 1, 1, 1, 1, 1,
1.006338, 0.6386485, -0.3958859, 1, 1, 1, 1, 1,
1.006476, 0.8598257, 0.7353061, 1, 1, 1, 1, 1,
1.017154, -0.5861166, 0.6162159, 1, 1, 1, 1, 1,
1.017665, -0.4064635, 1.808762, 1, 1, 1, 1, 1,
1.027984, -1.82726, 1.992272, 1, 1, 1, 1, 1,
1.036314, -1.482918, 3.314738, 1, 1, 1, 1, 1,
1.042201, -0.1050874, 2.180517, 1, 1, 1, 1, 1,
1.043489, -1.070644, 2.303274, 0, 0, 1, 1, 1,
1.049532, -2.755195, 3.601092, 1, 0, 0, 1, 1,
1.050189, -0.1192042, 1.776624, 1, 0, 0, 1, 1,
1.051824, 1.090799, 2.048295, 1, 0, 0, 1, 1,
1.05962, -0.4727931, 1.402869, 1, 0, 0, 1, 1,
1.075739, -0.08050369, 1.978526, 1, 0, 0, 1, 1,
1.075771, 0.2537406, 1.508536, 0, 0, 0, 1, 1,
1.085432, 0.2472216, 2.140812, 0, 0, 0, 1, 1,
1.086244, -0.8973629, 0.6271991, 0, 0, 0, 1, 1,
1.099532, -0.1821755, 2.027293, 0, 0, 0, 1, 1,
1.101523, -1.204032, 2.106194, 0, 0, 0, 1, 1,
1.103257, -0.2310997, 2.471591, 0, 0, 0, 1, 1,
1.105467, 1.628216, 1.332324, 0, 0, 0, 1, 1,
1.116792, 1.345702, -0.1970662, 1, 1, 1, 1, 1,
1.118162, 1.750505, -1.839719, 1, 1, 1, 1, 1,
1.120811, -1.176794, 3.899981, 1, 1, 1, 1, 1,
1.134819, -2.235708, 0.7441185, 1, 1, 1, 1, 1,
1.136957, 0.6526306, 1.426318, 1, 1, 1, 1, 1,
1.137338, 0.5377246, 0.3809926, 1, 1, 1, 1, 1,
1.137498, -1.325948, 1.958774, 1, 1, 1, 1, 1,
1.138083, 1.138038, -0.5073445, 1, 1, 1, 1, 1,
1.138154, 0.2292872, 3.006879, 1, 1, 1, 1, 1,
1.144414, -0.8352273, 2.299055, 1, 1, 1, 1, 1,
1.146276, 0.5951484, 0.1546741, 1, 1, 1, 1, 1,
1.15445, 1.159054, 2.076993, 1, 1, 1, 1, 1,
1.162, 1.324607, 0.9762033, 1, 1, 1, 1, 1,
1.182453, 0.1671608, 2.495992, 1, 1, 1, 1, 1,
1.201109, -0.2245033, 2.391645, 1, 1, 1, 1, 1,
1.202013, 1.357071, -0.2470609, 0, 0, 1, 1, 1,
1.209134, 1.045765, 0.8248667, 1, 0, 0, 1, 1,
1.209345, 1.787029, 0.1519178, 1, 0, 0, 1, 1,
1.232138, 1.235964, 1.187577, 1, 0, 0, 1, 1,
1.237506, -0.866614, 2.824228, 1, 0, 0, 1, 1,
1.252383, -1.088546, 3.631188, 1, 0, 0, 1, 1,
1.265669, 0.0780062, 0.8483452, 0, 0, 0, 1, 1,
1.275266, 0.2003547, 0.8291148, 0, 0, 0, 1, 1,
1.295778, 0.1869603, 1.91118, 0, 0, 0, 1, 1,
1.298173, -1.564548, 2.198917, 0, 0, 0, 1, 1,
1.301715, -1.291454, 1.647931, 0, 0, 0, 1, 1,
1.310534, -0.05935032, 2.017589, 0, 0, 0, 1, 1,
1.324471, -0.7872562, 0.7525795, 0, 0, 0, 1, 1,
1.333517, 1.33713, 0.5378786, 1, 1, 1, 1, 1,
1.34605, 0.8913116, 1.312911, 1, 1, 1, 1, 1,
1.347217, -2.115336, 1.782972, 1, 1, 1, 1, 1,
1.361979, -0.7332302, 1.28476, 1, 1, 1, 1, 1,
1.366475, -0.1436765, 3.88126, 1, 1, 1, 1, 1,
1.367507, -2.001855, 2.713578, 1, 1, 1, 1, 1,
1.387629, -0.01495633, 1.499564, 1, 1, 1, 1, 1,
1.388107, -1.520034, 1.114865, 1, 1, 1, 1, 1,
1.391704, -1.52651, 3.399009, 1, 1, 1, 1, 1,
1.399546, -0.2129776, 1.465209, 1, 1, 1, 1, 1,
1.421406, -0.4755552, 2.359338, 1, 1, 1, 1, 1,
1.422415, 0.3294286, 1.681216, 1, 1, 1, 1, 1,
1.424664, -0.4755839, 3.162458, 1, 1, 1, 1, 1,
1.429347, -1.469268, 3.504202, 1, 1, 1, 1, 1,
1.432108, -1.26534, 3.349903, 1, 1, 1, 1, 1,
1.432244, -1.553549, 1.652003, 0, 0, 1, 1, 1,
1.451401, 1.219323, 0.1228373, 1, 0, 0, 1, 1,
1.451509, -0.8325881, 1.149855, 1, 0, 0, 1, 1,
1.457425, -1.212305, 2.58653, 1, 0, 0, 1, 1,
1.463328, -1.307655, 1.750314, 1, 0, 0, 1, 1,
1.465528, 0.508863, 0.08959201, 1, 0, 0, 1, 1,
1.484422, -0.05669472, 1.105353, 0, 0, 0, 1, 1,
1.488962, -0.5680481, 3.090075, 0, 0, 0, 1, 1,
1.491281, -0.05264516, 1.462743, 0, 0, 0, 1, 1,
1.505069, -0.7340637, 0.6777279, 0, 0, 0, 1, 1,
1.506195, 1.176218, 0.6533917, 0, 0, 0, 1, 1,
1.508306, -0.3804401, 2.153893, 0, 0, 0, 1, 1,
1.51195, 2.051018, 0.3734301, 0, 0, 0, 1, 1,
1.519962, 0.0743451, 1.767212, 1, 1, 1, 1, 1,
1.520686, 0.4101955, 3.937521, 1, 1, 1, 1, 1,
1.536362, -0.04183098, 0.5099964, 1, 1, 1, 1, 1,
1.545389, -0.009540993, -0.08098825, 1, 1, 1, 1, 1,
1.552598, -0.8278086, 1.726725, 1, 1, 1, 1, 1,
1.564991, 1.333912, -0.4654762, 1, 1, 1, 1, 1,
1.568343, -0.08506349, 3.165629, 1, 1, 1, 1, 1,
1.568441, 0.452709, 1.382349, 1, 1, 1, 1, 1,
1.570663, 0.2875937, 1.844553, 1, 1, 1, 1, 1,
1.574962, -1.12707, 1.821581, 1, 1, 1, 1, 1,
1.588407, -0.7104753, 2.887804, 1, 1, 1, 1, 1,
1.605357, -0.4895473, 0.9740284, 1, 1, 1, 1, 1,
1.611197, 1.007769, 1.463451, 1, 1, 1, 1, 1,
1.628688, -0.9638365, 2.521544, 1, 1, 1, 1, 1,
1.634204, 0.5023524, 0.4436715, 1, 1, 1, 1, 1,
1.658302, 0.855784, 0.05997031, 0, 0, 1, 1, 1,
1.677588, 1.319523, 0.6148582, 1, 0, 0, 1, 1,
1.72367, 1.204018, 1.334383, 1, 0, 0, 1, 1,
1.758537, -1.795816, 0.0675541, 1, 0, 0, 1, 1,
1.770467, 0.3871802, -1.320849, 1, 0, 0, 1, 1,
1.773935, 1.060406, 2.089153, 1, 0, 0, 1, 1,
1.781864, -0.02230452, 3.61603, 0, 0, 0, 1, 1,
1.782529, -0.8199174, 3.00082, 0, 0, 0, 1, 1,
1.787998, 1.21236, 1.032857, 0, 0, 0, 1, 1,
1.799181, 1.081976, 0.5733454, 0, 0, 0, 1, 1,
1.801969, 0.7150141, 2.185575, 0, 0, 0, 1, 1,
1.807443, -0.7366239, 0.469861, 0, 0, 0, 1, 1,
1.825575, -2.198886, 1.069754, 0, 0, 0, 1, 1,
1.832812, -0.6966535, 1.025211, 1, 1, 1, 1, 1,
1.853105, -0.4438222, 0.3418093, 1, 1, 1, 1, 1,
1.875662, 1.004303, -0.4755965, 1, 1, 1, 1, 1,
1.881629, 0.9655784, 0.181245, 1, 1, 1, 1, 1,
1.883379, 0.1908265, 1.195634, 1, 1, 1, 1, 1,
1.8917, 0.7161719, 1.265204, 1, 1, 1, 1, 1,
1.89703, -0.4783666, 1.139646, 1, 1, 1, 1, 1,
1.899048, -0.5291858, -0.04822255, 1, 1, 1, 1, 1,
1.90639, -0.460106, 2.660496, 1, 1, 1, 1, 1,
1.9358, 1.286341, 1.775458, 1, 1, 1, 1, 1,
1.969048, 0.608943, 1.15518, 1, 1, 1, 1, 1,
1.975749, -0.3076205, 0.7992907, 1, 1, 1, 1, 1,
2.039894, -1.014966, 3.248402, 1, 1, 1, 1, 1,
2.04933, 1.643532, 1.541072, 1, 1, 1, 1, 1,
2.049556, 0.6682039, 2.149754, 1, 1, 1, 1, 1,
2.054574, 2.311042, -1.301887, 0, 0, 1, 1, 1,
2.072988, 0.2453559, 0.4573111, 1, 0, 0, 1, 1,
2.084655, -0.5210571, -0.3460343, 1, 0, 0, 1, 1,
2.1026, 0.511561, 0.3973464, 1, 0, 0, 1, 1,
2.135707, 0.5905322, 0.3335219, 1, 0, 0, 1, 1,
2.13749, -0.4078362, 0.8115112, 1, 0, 0, 1, 1,
2.149046, 0.9951618, 1.293589, 0, 0, 0, 1, 1,
2.260109, 0.4305675, 1.510389, 0, 0, 0, 1, 1,
2.271447, 0.07445652, 0.895272, 0, 0, 0, 1, 1,
2.279298, -0.2123852, 0.6791263, 0, 0, 0, 1, 1,
2.295065, -0.8914691, 2.820766, 0, 0, 0, 1, 1,
2.390203, 0.04396835, 2.977762, 0, 0, 0, 1, 1,
2.421668, 0.6931249, 3.226238, 0, 0, 0, 1, 1,
2.442419, -1.143643, 2.944203, 1, 1, 1, 1, 1,
2.463109, -0.7050079, 3.014386, 1, 1, 1, 1, 1,
2.517747, 0.2060414, 0.7111279, 1, 1, 1, 1, 1,
2.65187, -1.288387, 0.8145539, 1, 1, 1, 1, 1,
2.66667, -0.5403282, 1.685286, 1, 1, 1, 1, 1,
3.084618, -0.08036295, 0.9949198, 1, 1, 1, 1, 1,
3.254843, 0.43407, 0.8937858, 1, 1, 1, 1, 1
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
var radius = 10.03985;
var distance = 35.26455;
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
mvMatrix.translate( 0.4331181, 0.274014, 0.251138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26455);
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