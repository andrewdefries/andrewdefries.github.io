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
-3.475771, 0.3140578, 1.122352, 1, 0, 0, 1,
-3.208374, -0.8387003, -2.64382, 1, 0.007843138, 0, 1,
-2.489704, -0.3928953, -1.629817, 1, 0.01176471, 0, 1,
-2.358858, -1.232903, -3.815004, 1, 0.01960784, 0, 1,
-2.292873, 0.341016, 1.307198, 1, 0.02352941, 0, 1,
-2.260785, -0.08777721, -3.072745, 1, 0.03137255, 0, 1,
-2.192602, -0.169526, -0.2585812, 1, 0.03529412, 0, 1,
-2.159459, 0.764009, -1.34023, 1, 0.04313726, 0, 1,
-2.158994, 1.248567, -0.6873705, 1, 0.04705882, 0, 1,
-2.077038, 0.2742424, 1.315639, 1, 0.05490196, 0, 1,
-2.024556, 0.1962892, -0.2963493, 1, 0.05882353, 0, 1,
-1.972372, 0.4993621, 0.5078814, 1, 0.06666667, 0, 1,
-1.963053, 0.3255368, -1.168925, 1, 0.07058824, 0, 1,
-1.932595, -0.3973177, -2.200887, 1, 0.07843138, 0, 1,
-1.910647, 1.363739, -1.868326, 1, 0.08235294, 0, 1,
-1.898803, -0.1478698, -3.238575, 1, 0.09019608, 0, 1,
-1.895011, -0.5475219, -0.829822, 1, 0.09411765, 0, 1,
-1.845804, 0.8981078, -1.723582, 1, 0.1019608, 0, 1,
-1.830565, -1.57368, -2.583235, 1, 0.1098039, 0, 1,
-1.822717, 0.217628, 0.7829832, 1, 0.1137255, 0, 1,
-1.796808, -1.316099, -4.084334, 1, 0.1215686, 0, 1,
-1.77288, 0.7041032, -0.5677806, 1, 0.1254902, 0, 1,
-1.769201, 0.3049353, -1.182477, 1, 0.1333333, 0, 1,
-1.752671, -2.659126, -3.000202, 1, 0.1372549, 0, 1,
-1.752266, -0.5456793, -2.699582, 1, 0.145098, 0, 1,
-1.747532, 1.594328, 0.1162901, 1, 0.1490196, 0, 1,
-1.746508, 0.6681065, -0.8150945, 1, 0.1568628, 0, 1,
-1.730541, -0.1611737, -2.14003, 1, 0.1607843, 0, 1,
-1.728779, -1.29015, -1.380683, 1, 0.1686275, 0, 1,
-1.713393, 0.1831463, -1.770798, 1, 0.172549, 0, 1,
-1.709416, -0.4682051, -1.857563, 1, 0.1803922, 0, 1,
-1.702399, -1.170883, -2.534546, 1, 0.1843137, 0, 1,
-1.697142, -0.2657795, -1.643724, 1, 0.1921569, 0, 1,
-1.683206, -1.249415, -1.767331, 1, 0.1960784, 0, 1,
-1.675028, 1.415386, -0.4007355, 1, 0.2039216, 0, 1,
-1.659698, 0.1139457, -1.39521, 1, 0.2117647, 0, 1,
-1.644417, 0.5136612, -0.227911, 1, 0.2156863, 0, 1,
-1.63455, 0.4637656, -1.430211, 1, 0.2235294, 0, 1,
-1.618104, 0.3063777, -2.904918, 1, 0.227451, 0, 1,
-1.616991, 0.03005616, -2.535892, 1, 0.2352941, 0, 1,
-1.610077, 0.209845, -0.9916471, 1, 0.2392157, 0, 1,
-1.596207, 1.505856, -2.722493, 1, 0.2470588, 0, 1,
-1.593648, 0.973579, -2.227486, 1, 0.2509804, 0, 1,
-1.587608, -1.03101, -3.556291, 1, 0.2588235, 0, 1,
-1.57775, -0.7260613, -1.558273, 1, 0.2627451, 0, 1,
-1.575432, 0.09986069, -2.615229, 1, 0.2705882, 0, 1,
-1.571432, -0.8177587, -2.657683, 1, 0.2745098, 0, 1,
-1.55925, 1.267532, -2.183949, 1, 0.282353, 0, 1,
-1.551212, 0.1158716, -3.320794, 1, 0.2862745, 0, 1,
-1.545979, 0.8377494, 0.1642033, 1, 0.2941177, 0, 1,
-1.509042, -0.837302, -0.840777, 1, 0.3019608, 0, 1,
-1.498973, 1.331654, -0.5740473, 1, 0.3058824, 0, 1,
-1.496409, -0.6582605, -2.285916, 1, 0.3137255, 0, 1,
-1.492234, 0.2529214, -0.3436023, 1, 0.3176471, 0, 1,
-1.481004, 0.01681773, -2.25828, 1, 0.3254902, 0, 1,
-1.476966, 0.4154299, -1.3647, 1, 0.3294118, 0, 1,
-1.46137, -0.3366885, 0.1793493, 1, 0.3372549, 0, 1,
-1.458526, -1.573428, -2.495889, 1, 0.3411765, 0, 1,
-1.4569, -1.185615, -1.971632, 1, 0.3490196, 0, 1,
-1.452479, 0.06969737, -2.964568, 1, 0.3529412, 0, 1,
-1.448734, 0.8084704, -1.718372, 1, 0.3607843, 0, 1,
-1.432944, -1.037634, -1.688762, 1, 0.3647059, 0, 1,
-1.409243, -0.2028237, -1.474731, 1, 0.372549, 0, 1,
-1.407823, -1.705631, -3.386428, 1, 0.3764706, 0, 1,
-1.407192, 0.758557, -1.332444, 1, 0.3843137, 0, 1,
-1.406606, 0.5766743, -1.448508, 1, 0.3882353, 0, 1,
-1.404494, 0.5426552, -1.539423, 1, 0.3960784, 0, 1,
-1.403543, -1.108668, -0.4948464, 1, 0.4039216, 0, 1,
-1.392951, -1.415387, -3.789136, 1, 0.4078431, 0, 1,
-1.387808, -0.4278959, -1.45905, 1, 0.4156863, 0, 1,
-1.38622, 0.03419143, -0.1379213, 1, 0.4196078, 0, 1,
-1.373492, -2.106783, -3.0375, 1, 0.427451, 0, 1,
-1.372023, 1.35748, -1.796596, 1, 0.4313726, 0, 1,
-1.371906, -0.6249636, -1.100983, 1, 0.4392157, 0, 1,
-1.368689, 0.7247802, -0.7760955, 1, 0.4431373, 0, 1,
-1.366297, -0.4771892, -0.4910228, 1, 0.4509804, 0, 1,
-1.349505, -2.6604, -2.194997, 1, 0.454902, 0, 1,
-1.34892, 1.912827, -0.5349593, 1, 0.4627451, 0, 1,
-1.345576, 0.4740388, 0.4252243, 1, 0.4666667, 0, 1,
-1.342319, 0.7706023, -1.069287, 1, 0.4745098, 0, 1,
-1.337134, -1.437852, -3.906593, 1, 0.4784314, 0, 1,
-1.328478, -0.9066405, -1.697241, 1, 0.4862745, 0, 1,
-1.317639, 0.377992, -0.5556713, 1, 0.4901961, 0, 1,
-1.314695, -1.109498, -1.820156, 1, 0.4980392, 0, 1,
-1.310887, 0.8148407, 0.1210728, 1, 0.5058824, 0, 1,
-1.310593, -0.6940191, -1.810213, 1, 0.509804, 0, 1,
-1.297372, -0.05679411, -3.277292, 1, 0.5176471, 0, 1,
-1.296306, 0.2020911, -1.742524, 1, 0.5215687, 0, 1,
-1.290786, -0.4625709, -1.629604, 1, 0.5294118, 0, 1,
-1.286049, 0.4481173, -0.7103885, 1, 0.5333334, 0, 1,
-1.276636, -1.153783, -2.993906, 1, 0.5411765, 0, 1,
-1.274787, 0.8017853, -1.36521, 1, 0.5450981, 0, 1,
-1.257003, -0.5058593, -0.2113114, 1, 0.5529412, 0, 1,
-1.25691, 2.677636, -0.8890621, 1, 0.5568628, 0, 1,
-1.256459, 0.4488503, -0.2796709, 1, 0.5647059, 0, 1,
-1.254755, 0.9898631, -1.482162, 1, 0.5686275, 0, 1,
-1.247164, 0.3037752, -1.501196, 1, 0.5764706, 0, 1,
-1.247119, 1.163092, -0.5008757, 1, 0.5803922, 0, 1,
-1.243025, 0.4377929, -1.470818, 1, 0.5882353, 0, 1,
-1.220441, -1.089612, -1.544538, 1, 0.5921569, 0, 1,
-1.213735, -0.3929015, -2.88022, 1, 0.6, 0, 1,
-1.209292, -0.2436394, -0.9873976, 1, 0.6078432, 0, 1,
-1.208387, 1.083184, -1.632023, 1, 0.6117647, 0, 1,
-1.207439, -0.8098126, -0.7289592, 1, 0.6196079, 0, 1,
-1.187536, -0.2419277, -1.364505, 1, 0.6235294, 0, 1,
-1.182638, 0.9800537, -2.235345, 1, 0.6313726, 0, 1,
-1.179594, 0.1448709, -3.900128, 1, 0.6352941, 0, 1,
-1.170824, 0.7925435, -1.988264, 1, 0.6431373, 0, 1,
-1.153739, 0.7703212, -2.090432, 1, 0.6470588, 0, 1,
-1.150311, -0.7309276, -1.438579, 1, 0.654902, 0, 1,
-1.147711, 1.049308, -1.225907, 1, 0.6588235, 0, 1,
-1.137508, 2.130972, 0.4907921, 1, 0.6666667, 0, 1,
-1.134898, 0.09549968, -2.664185, 1, 0.6705883, 0, 1,
-1.133711, 0.5853219, -0.7605737, 1, 0.6784314, 0, 1,
-1.12961, 0.6141034, -1.19558, 1, 0.682353, 0, 1,
-1.127632, 0.5909492, -0.3276465, 1, 0.6901961, 0, 1,
-1.125637, 0.2695156, -1.916451, 1, 0.6941177, 0, 1,
-1.122169, -0.5091183, -1.118454, 1, 0.7019608, 0, 1,
-1.121695, 0.4141977, -0.7862542, 1, 0.7098039, 0, 1,
-1.111688, 0.3796714, -0.589231, 1, 0.7137255, 0, 1,
-1.108369, 0.3471304, -0.4663889, 1, 0.7215686, 0, 1,
-1.107055, -0.9237803, -0.7218411, 1, 0.7254902, 0, 1,
-1.105328, 0.2393869, -2.672027, 1, 0.7333333, 0, 1,
-1.10007, 0.9073535, -2.250318, 1, 0.7372549, 0, 1,
-1.095749, -1.30297, -2.804092, 1, 0.7450981, 0, 1,
-1.085359, -0.006064932, -1.442939, 1, 0.7490196, 0, 1,
-1.084165, 0.08264024, 0.6911094, 1, 0.7568628, 0, 1,
-1.0767, 1.627244, 0.08755258, 1, 0.7607843, 0, 1,
-1.071474, 1.690771, -0.7248057, 1, 0.7686275, 0, 1,
-1.07013, 0.2916684, -3.079014, 1, 0.772549, 0, 1,
-1.069943, -0.200367, -2.784966, 1, 0.7803922, 0, 1,
-1.06559, -0.9409754, -1.985144, 1, 0.7843137, 0, 1,
-1.063075, -2.175271, -2.940974, 1, 0.7921569, 0, 1,
-1.059134, 1.280012, -0.3040692, 1, 0.7960784, 0, 1,
-1.058093, 0.1697373, -0.07708498, 1, 0.8039216, 0, 1,
-1.046089, 0.7747312, -2.16622, 1, 0.8117647, 0, 1,
-1.045498, 1.506547, -0.4127465, 1, 0.8156863, 0, 1,
-1.044414, 1.054499, 0.5737265, 1, 0.8235294, 0, 1,
-1.032014, 0.3716188, -0.1166619, 1, 0.827451, 0, 1,
-1.028636, -2.092093, -3.291674, 1, 0.8352941, 0, 1,
-1.018266, 1.62189, -1.767981, 1, 0.8392157, 0, 1,
-1.018195, -0.5888911, -2.034395, 1, 0.8470588, 0, 1,
-1.011868, -0.5128027, -2.622286, 1, 0.8509804, 0, 1,
-1.005875, 0.8776828, -1.20167, 1, 0.8588235, 0, 1,
-1.00492, -2.163967, -1.380095, 1, 0.8627451, 0, 1,
-1.001982, -0.6088645, -1.724327, 1, 0.8705882, 0, 1,
-0.9946142, 0.854722, -0.9526005, 1, 0.8745098, 0, 1,
-0.9879931, 1.810923, -0.5046127, 1, 0.8823529, 0, 1,
-0.9867731, -0.2468121, -1.347962, 1, 0.8862745, 0, 1,
-0.98146, -0.8218666, -1.216815, 1, 0.8941177, 0, 1,
-0.9778606, 0.4850508, -0.1094071, 1, 0.8980392, 0, 1,
-0.9772561, -0.513067, -4.228342, 1, 0.9058824, 0, 1,
-0.9699408, -0.7693442, -4.475636, 1, 0.9137255, 0, 1,
-0.9686566, 3.268672, -0.6662918, 1, 0.9176471, 0, 1,
-0.9670011, 0.8638991, -1.428494, 1, 0.9254902, 0, 1,
-0.96281, -0.8483821, -2.369686, 1, 0.9294118, 0, 1,
-0.9623276, 0.2084534, -0.6702673, 1, 0.9372549, 0, 1,
-0.9562002, -0.9004031, -2.70871, 1, 0.9411765, 0, 1,
-0.9490094, 0.9601042, -1.827783, 1, 0.9490196, 0, 1,
-0.9484558, 0.4234846, -0.5643835, 1, 0.9529412, 0, 1,
-0.928153, 0.7756656, -1.57033, 1, 0.9607843, 0, 1,
-0.9265554, 0.02458126, -1.840893, 1, 0.9647059, 0, 1,
-0.9261369, 0.7126719, -0.8033801, 1, 0.972549, 0, 1,
-0.923955, -0.08909249, -0.7516737, 1, 0.9764706, 0, 1,
-0.9197924, -0.7916971, -1.642201, 1, 0.9843137, 0, 1,
-0.9160377, 1.80251, 0.4819258, 1, 0.9882353, 0, 1,
-0.9154097, 0.5530652, -1.538172, 1, 0.9960784, 0, 1,
-0.91364, -1.718861, -1.614184, 0.9960784, 1, 0, 1,
-0.9117079, 1.947054, 0.4253484, 0.9921569, 1, 0, 1,
-0.9042923, 0.8987805, -0.3478116, 0.9843137, 1, 0, 1,
-0.89084, 1.930505, -0.5362243, 0.9803922, 1, 0, 1,
-0.8858775, -2.8494, -4.171427, 0.972549, 1, 0, 1,
-0.8758042, 0.02430353, -2.204252, 0.9686275, 1, 0, 1,
-0.8721878, -0.06993885, -1.017916, 0.9607843, 1, 0, 1,
-0.8650492, 0.6972759, -0.06125408, 0.9568627, 1, 0, 1,
-0.864554, -2.177988, -3.164902, 0.9490196, 1, 0, 1,
-0.8621768, 0.5232638, -1.572045, 0.945098, 1, 0, 1,
-0.8595482, 0.6673704, -0.7949846, 0.9372549, 1, 0, 1,
-0.8571807, 0.6578203, -0.7676736, 0.9333333, 1, 0, 1,
-0.8571357, 0.7304169, -0.5209373, 0.9254902, 1, 0, 1,
-0.849906, 0.09962274, -1.557225, 0.9215686, 1, 0, 1,
-0.842297, 0.6546437, -0.836536, 0.9137255, 1, 0, 1,
-0.830866, -1.105666, -1.483981, 0.9098039, 1, 0, 1,
-0.8254516, -0.8300471, -1.047264, 0.9019608, 1, 0, 1,
-0.8243683, 0.3928448, -1.903949, 0.8941177, 1, 0, 1,
-0.8185176, -0.7156337, -2.222693, 0.8901961, 1, 0, 1,
-0.8181909, 0.2438778, -2.248403, 0.8823529, 1, 0, 1,
-0.8131436, -3.163877, -3.061633, 0.8784314, 1, 0, 1,
-0.8105076, 0.4079744, -1.726105, 0.8705882, 1, 0, 1,
-0.809614, 1.058459, -1.089954, 0.8666667, 1, 0, 1,
-0.8095819, -0.6487805, -1.933272, 0.8588235, 1, 0, 1,
-0.8012692, 0.260038, -0.1722251, 0.854902, 1, 0, 1,
-0.7998997, -0.3576158, -2.808381, 0.8470588, 1, 0, 1,
-0.7975796, 2.376, 0.002186613, 0.8431373, 1, 0, 1,
-0.7962777, 0.6944253, -0.6918616, 0.8352941, 1, 0, 1,
-0.7859813, -1.228418, -2.527989, 0.8313726, 1, 0, 1,
-0.7839054, -0.3742364, -3.616074, 0.8235294, 1, 0, 1,
-0.7777985, 0.01808893, -0.9579752, 0.8196079, 1, 0, 1,
-0.777334, -0.3639631, -2.302568, 0.8117647, 1, 0, 1,
-0.7734685, 0.65422, -1.032322, 0.8078431, 1, 0, 1,
-0.7733744, 0.8100337, 0.222358, 0.8, 1, 0, 1,
-0.7718118, -0.2928493, -2.317936, 0.7921569, 1, 0, 1,
-0.76798, -2.206821, -2.691747, 0.7882353, 1, 0, 1,
-0.7636514, 0.5704978, -1.312441, 0.7803922, 1, 0, 1,
-0.7613707, -0.14139, 0.154025, 0.7764706, 1, 0, 1,
-0.7509228, -0.4784984, -3.71397, 0.7686275, 1, 0, 1,
-0.7484291, 0.7898155, -0.5308442, 0.7647059, 1, 0, 1,
-0.7461776, -0.7118965, -3.209453, 0.7568628, 1, 0, 1,
-0.7433922, 1.313233, 0.034241, 0.7529412, 1, 0, 1,
-0.7391669, 0.7658097, -0.1419223, 0.7450981, 1, 0, 1,
-0.738346, 0.67443, -2.266102, 0.7411765, 1, 0, 1,
-0.7374221, -0.8388163, -3.134035, 0.7333333, 1, 0, 1,
-0.7371615, 0.4657549, -2.132214, 0.7294118, 1, 0, 1,
-0.7365374, 0.2218988, -2.685571, 0.7215686, 1, 0, 1,
-0.7358082, -0.7546842, -1.199661, 0.7176471, 1, 0, 1,
-0.7339333, -0.0712802, -2.879656, 0.7098039, 1, 0, 1,
-0.7311694, 0.9413462, -3.079786, 0.7058824, 1, 0, 1,
-0.7309619, -1.850947, -1.968553, 0.6980392, 1, 0, 1,
-0.7295535, 0.2511303, -1.932638, 0.6901961, 1, 0, 1,
-0.7264688, -1.136244, -2.739932, 0.6862745, 1, 0, 1,
-0.7230653, -0.207946, -0.04421244, 0.6784314, 1, 0, 1,
-0.71468, -1.299876, -3.225325, 0.6745098, 1, 0, 1,
-0.708492, 1.238997, -0.3327925, 0.6666667, 1, 0, 1,
-0.7084326, 0.2311182, -1.785211, 0.6627451, 1, 0, 1,
-0.7071731, 0.6481022, -0.4218752, 0.654902, 1, 0, 1,
-0.7030177, -0.4436104, -2.664294, 0.6509804, 1, 0, 1,
-0.692037, 0.3968811, -0.6371368, 0.6431373, 1, 0, 1,
-0.6916129, -1.288879, -1.174325, 0.6392157, 1, 0, 1,
-0.6890512, -0.4510908, -1.232858, 0.6313726, 1, 0, 1,
-0.6818428, 0.1573025, -2.036856, 0.627451, 1, 0, 1,
-0.6762974, -0.1619166, -2.080169, 0.6196079, 1, 0, 1,
-0.6733691, -0.06034404, -1.348401, 0.6156863, 1, 0, 1,
-0.671585, 0.7426398, 0.866549, 0.6078432, 1, 0, 1,
-0.6701308, -0.2127022, -2.092246, 0.6039216, 1, 0, 1,
-0.6634685, 0.8242586, -2.03329, 0.5960785, 1, 0, 1,
-0.6592097, -0.452177, -2.186732, 0.5882353, 1, 0, 1,
-0.6505249, 0.2885698, -1.041969, 0.5843138, 1, 0, 1,
-0.6414889, -1.601032, -4.035744, 0.5764706, 1, 0, 1,
-0.6382941, -0.953871, -3.59627, 0.572549, 1, 0, 1,
-0.6360273, -0.07735971, -1.842044, 0.5647059, 1, 0, 1,
-0.6357147, 2.016791, 0.02101975, 0.5607843, 1, 0, 1,
-0.634331, -0.7630202, -0.7918124, 0.5529412, 1, 0, 1,
-0.6328725, 0.650824, -1.573577, 0.5490196, 1, 0, 1,
-0.630989, -2.548634, -2.287494, 0.5411765, 1, 0, 1,
-0.6286795, -0.3427505, -2.303427, 0.5372549, 1, 0, 1,
-0.6286365, -0.9344921, -1.797338, 0.5294118, 1, 0, 1,
-0.6245121, -0.6853858, -0.8763705, 0.5254902, 1, 0, 1,
-0.6158786, -1.041166, -3.505053, 0.5176471, 1, 0, 1,
-0.61382, 1.408003, -0.9843463, 0.5137255, 1, 0, 1,
-0.611798, 0.7988066, -1.853159, 0.5058824, 1, 0, 1,
-0.6115945, 1.232152, -0.5665659, 0.5019608, 1, 0, 1,
-0.6038262, 1.942121, -0.6003027, 0.4941176, 1, 0, 1,
-0.6021706, -0.7934011, -2.140442, 0.4862745, 1, 0, 1,
-0.6003655, 1.087122, 1.389635, 0.4823529, 1, 0, 1,
-0.6001619, -0.4965385, -2.06401, 0.4745098, 1, 0, 1,
-0.5999413, -0.9710442, -2.456383, 0.4705882, 1, 0, 1,
-0.5916677, -0.04271185, -0.9657624, 0.4627451, 1, 0, 1,
-0.5903199, -1.142724, -3.232015, 0.4588235, 1, 0, 1,
-0.586531, -1.083096, -3.248204, 0.4509804, 1, 0, 1,
-0.5803281, 0.1190162, 0.2852153, 0.4470588, 1, 0, 1,
-0.5773162, 0.557526, -1.22685, 0.4392157, 1, 0, 1,
-0.5744396, 0.8588374, 1.007451, 0.4352941, 1, 0, 1,
-0.5690178, -0.6175534, -1.148671, 0.427451, 1, 0, 1,
-0.5678425, 0.2514239, -2.161151, 0.4235294, 1, 0, 1,
-0.5667937, -0.6549729, -2.637344, 0.4156863, 1, 0, 1,
-0.557573, -0.5081296, -3.034906, 0.4117647, 1, 0, 1,
-0.5575536, 0.893807, 0.3359631, 0.4039216, 1, 0, 1,
-0.5572088, 0.3121758, 0.4724112, 0.3960784, 1, 0, 1,
-0.5565826, 0.4987466, -1.649456, 0.3921569, 1, 0, 1,
-0.5537012, -0.933367, -1.84056, 0.3843137, 1, 0, 1,
-0.5535312, 0.2878254, -1.902864, 0.3803922, 1, 0, 1,
-0.5438927, -0.7642693, -2.928617, 0.372549, 1, 0, 1,
-0.5386846, -2.119801, -3.724632, 0.3686275, 1, 0, 1,
-0.5386059, 1.451298, -1.383047, 0.3607843, 1, 0, 1,
-0.5366178, -0.8677079, -1.37054, 0.3568628, 1, 0, 1,
-0.5337585, 0.8359436, -0.1207799, 0.3490196, 1, 0, 1,
-0.5297075, -0.182302, -2.479136, 0.345098, 1, 0, 1,
-0.5263656, -0.6015211, -1.285099, 0.3372549, 1, 0, 1,
-0.5238245, 0.629849, -1.014167, 0.3333333, 1, 0, 1,
-0.5233064, 2.157838, -0.2787293, 0.3254902, 1, 0, 1,
-0.5199333, 0.8950677, -1.659667, 0.3215686, 1, 0, 1,
-0.519913, 0.9148137, 0.3473177, 0.3137255, 1, 0, 1,
-0.5184395, -0.2898553, -1.405625, 0.3098039, 1, 0, 1,
-0.5169451, 0.1976249, -2.323611, 0.3019608, 1, 0, 1,
-0.514976, 1.71817, -0.4498985, 0.2941177, 1, 0, 1,
-0.5119841, 1.132843, -0.5256334, 0.2901961, 1, 0, 1,
-0.5090814, -0.2853217, -3.710553, 0.282353, 1, 0, 1,
-0.5066631, 0.246357, -1.441684, 0.2784314, 1, 0, 1,
-0.5062162, -0.4106678, -1.464736, 0.2705882, 1, 0, 1,
-0.5058023, 0.02296997, -0.2267305, 0.2666667, 1, 0, 1,
-0.5054675, 0.392357, -1.615094, 0.2588235, 1, 0, 1,
-0.5031083, 0.77175, -0.4907026, 0.254902, 1, 0, 1,
-0.5014535, -1.55389, -1.083901, 0.2470588, 1, 0, 1,
-0.4888265, -1.129641, -4.121144, 0.2431373, 1, 0, 1,
-0.4859475, -0.6979717, -2.53488, 0.2352941, 1, 0, 1,
-0.4837604, 0.3837549, -1.196685, 0.2313726, 1, 0, 1,
-0.4827848, 1.317059, 0.6558473, 0.2235294, 1, 0, 1,
-0.4819191, 1.16628, -0.01153443, 0.2196078, 1, 0, 1,
-0.4752535, 0.1397929, -1.007847, 0.2117647, 1, 0, 1,
-0.4739079, -0.7540056, -2.323393, 0.2078431, 1, 0, 1,
-0.4686342, -0.2686549, -1.981783, 0.2, 1, 0, 1,
-0.4680114, 1.435266, 0.5392192, 0.1921569, 1, 0, 1,
-0.4630801, -0.0640473, -2.159192, 0.1882353, 1, 0, 1,
-0.4534007, -1.689133, -2.514049, 0.1803922, 1, 0, 1,
-0.4510804, 0.4854316, -1.953219, 0.1764706, 1, 0, 1,
-0.4507472, -1.005201, -2.973053, 0.1686275, 1, 0, 1,
-0.4475039, 0.6637924, -0.2776173, 0.1647059, 1, 0, 1,
-0.4457971, -1.51383, -4.008969, 0.1568628, 1, 0, 1,
-0.4440347, 1.181691, -2.280921, 0.1529412, 1, 0, 1,
-0.4386937, 0.1605815, -1.126087, 0.145098, 1, 0, 1,
-0.4386854, -0.5208417, -3.183322, 0.1411765, 1, 0, 1,
-0.4374914, 0.2717705, 0.9190579, 0.1333333, 1, 0, 1,
-0.4369837, -0.9052803, -1.272486, 0.1294118, 1, 0, 1,
-0.4352096, -1.55114, -3.060597, 0.1215686, 1, 0, 1,
-0.4340294, 0.2275854, -0.3344256, 0.1176471, 1, 0, 1,
-0.4313383, -0.4476063, -2.510384, 0.1098039, 1, 0, 1,
-0.4312763, -0.3816889, -1.685251, 0.1058824, 1, 0, 1,
-0.426318, -0.717428, -1.503907, 0.09803922, 1, 0, 1,
-0.4249795, 0.6441433, -2.550099, 0.09019608, 1, 0, 1,
-0.4202243, 1.192287, 0.0967261, 0.08627451, 1, 0, 1,
-0.4193318, 0.2655956, -0.1532024, 0.07843138, 1, 0, 1,
-0.4185155, 0.3956102, -0.4527633, 0.07450981, 1, 0, 1,
-0.4185033, 1.229201, 0.4591118, 0.06666667, 1, 0, 1,
-0.4165667, -0.7758607, -1.225682, 0.0627451, 1, 0, 1,
-0.4101714, 0.5169058, -0.3403304, 0.05490196, 1, 0, 1,
-0.4081498, -0.3044653, -2.169116, 0.05098039, 1, 0, 1,
-0.4004056, -1.043943, -3.914785, 0.04313726, 1, 0, 1,
-0.3968331, -0.1256704, -1.732816, 0.03921569, 1, 0, 1,
-0.3946157, 0.7943647, -1.407234, 0.03137255, 1, 0, 1,
-0.3919695, -0.371096, -3.191311, 0.02745098, 1, 0, 1,
-0.3919495, 1.722142, 0.2632922, 0.01960784, 1, 0, 1,
-0.3903368, 0.2454713, -0.9802409, 0.01568628, 1, 0, 1,
-0.3872717, 1.032539, -0.2781425, 0.007843138, 1, 0, 1,
-0.3856474, 1.375941, -0.4016756, 0.003921569, 1, 0, 1,
-0.3851865, 1.349915, -0.1315448, 0, 1, 0.003921569, 1,
-0.3849134, -1.96851, -3.395062, 0, 1, 0.01176471, 1,
-0.3846891, 2.499008, -0.4608102, 0, 1, 0.01568628, 1,
-0.3808472, 1.191619, -0.3188988, 0, 1, 0.02352941, 1,
-0.3806929, 0.4091871, 0.00045583, 0, 1, 0.02745098, 1,
-0.3805213, -1.416164, -1.85663, 0, 1, 0.03529412, 1,
-0.380243, 0.765456, -0.3349465, 0, 1, 0.03921569, 1,
-0.3774928, 0.7197567, 0.2550447, 0, 1, 0.04705882, 1,
-0.3769756, 0.8510807, -0.9784853, 0, 1, 0.05098039, 1,
-0.3695116, 0.593784, -0.3714547, 0, 1, 0.05882353, 1,
-0.3693628, -0.1750552, -0.3538677, 0, 1, 0.0627451, 1,
-0.3670724, -0.3825578, -3.743762, 0, 1, 0.07058824, 1,
-0.3517526, 0.3826155, -2.468904, 0, 1, 0.07450981, 1,
-0.3499503, 0.6697122, -1.459677, 0, 1, 0.08235294, 1,
-0.3446717, -0.3555976, -2.187423, 0, 1, 0.08627451, 1,
-0.3425589, -1.194536, -3.381387, 0, 1, 0.09411765, 1,
-0.339198, 1.998026, 0.2184571, 0, 1, 0.1019608, 1,
-0.3377096, -0.3244106, -2.613427, 0, 1, 0.1058824, 1,
-0.3222043, 1.485633, 0.4424394, 0, 1, 0.1137255, 1,
-0.3176029, 0.9314613, -0.3539026, 0, 1, 0.1176471, 1,
-0.3164609, 0.2319276, -2.148105, 0, 1, 0.1254902, 1,
-0.3149152, 1.992485, 0.2739963, 0, 1, 0.1294118, 1,
-0.3037936, 0.4059903, 0.3413778, 0, 1, 0.1372549, 1,
-0.303572, 0.2959234, -1.722942, 0, 1, 0.1411765, 1,
-0.2975792, -2.089741, -3.11672, 0, 1, 0.1490196, 1,
-0.2943133, -0.04989461, -2.064357, 0, 1, 0.1529412, 1,
-0.2915483, 0.2763344, -1.164749, 0, 1, 0.1607843, 1,
-0.2910147, 0.3163781, -0.8293437, 0, 1, 0.1647059, 1,
-0.290282, 0.5022118, -1.584803, 0, 1, 0.172549, 1,
-0.2886097, -0.09574642, -2.143143, 0, 1, 0.1764706, 1,
-0.2882492, 0.7200097, -2.007199, 0, 1, 0.1843137, 1,
-0.2854458, -1.8331, -0.5459835, 0, 1, 0.1882353, 1,
-0.2840814, -0.9698358, -1.82037, 0, 1, 0.1960784, 1,
-0.2839526, -1.456303, -4.196521, 0, 1, 0.2039216, 1,
-0.2809487, 1.334938, -1.734109, 0, 1, 0.2078431, 1,
-0.2782836, -0.1567025, -0.4583006, 0, 1, 0.2156863, 1,
-0.2732096, 0.8838475, -0.9486821, 0, 1, 0.2196078, 1,
-0.2700642, 0.2226817, -0.4490146, 0, 1, 0.227451, 1,
-0.2699777, 0.6862485, 0.3604662, 0, 1, 0.2313726, 1,
-0.2693756, 1.879725, 1.395242, 0, 1, 0.2392157, 1,
-0.269092, 0.8309981, 1.104305, 0, 1, 0.2431373, 1,
-0.263221, 0.3741397, -1.418601, 0, 1, 0.2509804, 1,
-0.2597038, -1.37374, -2.477488, 0, 1, 0.254902, 1,
-0.2561475, 2.031274, 0.9049954, 0, 1, 0.2627451, 1,
-0.2553364, 0.3927419, -1.674008, 0, 1, 0.2666667, 1,
-0.2539384, -1.218088, -2.784761, 0, 1, 0.2745098, 1,
-0.2530466, 0.5349864, -1.222296, 0, 1, 0.2784314, 1,
-0.2523822, -0.409314, -3.533522, 0, 1, 0.2862745, 1,
-0.2492201, -0.002651808, -3.128081, 0, 1, 0.2901961, 1,
-0.2424565, 0.8216335, -1.567153, 0, 1, 0.2980392, 1,
-0.2418155, 0.3736291, 0.154916, 0, 1, 0.3058824, 1,
-0.240441, 0.05676476, -1.223227, 0, 1, 0.3098039, 1,
-0.2387437, 0.3482154, -0.1110023, 0, 1, 0.3176471, 1,
-0.2351013, -0.6227336, -2.140168, 0, 1, 0.3215686, 1,
-0.234123, 0.03826185, -1.263097, 0, 1, 0.3294118, 1,
-0.2296981, 0.4778787, -0.03323597, 0, 1, 0.3333333, 1,
-0.2281219, 0.800146, 0.6620693, 0, 1, 0.3411765, 1,
-0.2273443, -0.9258492, -2.444789, 0, 1, 0.345098, 1,
-0.2255047, 1.356135, 1.065273, 0, 1, 0.3529412, 1,
-0.2223889, 0.2497071, -0.8978038, 0, 1, 0.3568628, 1,
-0.2169909, -0.2325288, -4.406324, 0, 1, 0.3647059, 1,
-0.2162114, -0.3125041, -2.435132, 0, 1, 0.3686275, 1,
-0.2153415, -0.3014205, -3.610763, 0, 1, 0.3764706, 1,
-0.2152251, -0.239351, -4.071431, 0, 1, 0.3803922, 1,
-0.2126261, -0.5681151, -2.109282, 0, 1, 0.3882353, 1,
-0.2105677, 0.4209406, 0.8606068, 0, 1, 0.3921569, 1,
-0.1950927, -0.3176895, -2.703085, 0, 1, 0.4, 1,
-0.1934139, -0.1872436, -1.717325, 0, 1, 0.4078431, 1,
-0.1923265, -0.6004601, -2.610996, 0, 1, 0.4117647, 1,
-0.1917322, 1.883097, -0.3751685, 0, 1, 0.4196078, 1,
-0.1889812, -0.4771532, -1.643906, 0, 1, 0.4235294, 1,
-0.1869781, 0.4123306, 0.5741397, 0, 1, 0.4313726, 1,
-0.1861329, -0.2315097, -1.927859, 0, 1, 0.4352941, 1,
-0.1858643, -1.329349, -3.649074, 0, 1, 0.4431373, 1,
-0.1852906, -0.1617566, -1.60946, 0, 1, 0.4470588, 1,
-0.1850175, -0.1503725, -3.965954, 0, 1, 0.454902, 1,
-0.1833081, -0.9380738, -2.240635, 0, 1, 0.4588235, 1,
-0.182361, -0.5707887, -1.846726, 0, 1, 0.4666667, 1,
-0.1809587, 0.6132461, 1.227299, 0, 1, 0.4705882, 1,
-0.179383, -1.491498, -3.142032, 0, 1, 0.4784314, 1,
-0.1790938, 1.198267, 1.005792, 0, 1, 0.4823529, 1,
-0.1784602, 1.180375, 1.550032, 0, 1, 0.4901961, 1,
-0.1780099, 0.9916051, -0.6507869, 0, 1, 0.4941176, 1,
-0.1751253, -0.6170558, -2.325877, 0, 1, 0.5019608, 1,
-0.174975, 0.1259236, 0.3881206, 0, 1, 0.509804, 1,
-0.1746518, 0.4790753, -0.7718987, 0, 1, 0.5137255, 1,
-0.1723075, 1.265413, 0.9139215, 0, 1, 0.5215687, 1,
-0.1602946, 1.49588, -0.3683323, 0, 1, 0.5254902, 1,
-0.1584909, 1.382107, -0.1471224, 0, 1, 0.5333334, 1,
-0.1506549, 1.002788, -0.3384995, 0, 1, 0.5372549, 1,
-0.1492348, -0.4424506, -2.042757, 0, 1, 0.5450981, 1,
-0.1452537, -1.307713, -3.061852, 0, 1, 0.5490196, 1,
-0.1448413, 1.238893, 0.001956388, 0, 1, 0.5568628, 1,
-0.1354722, -1.275578, -3.531963, 0, 1, 0.5607843, 1,
-0.1346386, 1.666717, -1.011505, 0, 1, 0.5686275, 1,
-0.133482, 1.30878, 1.64986, 0, 1, 0.572549, 1,
-0.1320973, -0.4342701, -1.92707, 0, 1, 0.5803922, 1,
-0.1310424, -0.2241163, -2.683638, 0, 1, 0.5843138, 1,
-0.1307047, -2.707874, -2.671566, 0, 1, 0.5921569, 1,
-0.1286065, -0.6943203, -3.093307, 0, 1, 0.5960785, 1,
-0.1267395, -0.809727, -1.981429, 0, 1, 0.6039216, 1,
-0.1255622, -0.08772197, -2.22335, 0, 1, 0.6117647, 1,
-0.1252094, -0.132733, -2.222887, 0, 1, 0.6156863, 1,
-0.1240821, 0.6121356, 0.09670912, 0, 1, 0.6235294, 1,
-0.1227441, -1.26764, -3.332388, 0, 1, 0.627451, 1,
-0.118175, 2.77902, 0.273792, 0, 1, 0.6352941, 1,
-0.1135754, 0.2014043, -0.08826539, 0, 1, 0.6392157, 1,
-0.1112788, -0.181982, -1.880032, 0, 1, 0.6470588, 1,
-0.1100161, -0.5886468, -0.692013, 0, 1, 0.6509804, 1,
-0.1098178, -0.8547455, -0.9962856, 0, 1, 0.6588235, 1,
-0.1067941, 0.2565117, -1.188968, 0, 1, 0.6627451, 1,
-0.104783, -1.21446, -2.577704, 0, 1, 0.6705883, 1,
-0.1039536, 0.2078781, -1.905413, 0, 1, 0.6745098, 1,
-0.1003544, 0.6709715, -0.8844711, 0, 1, 0.682353, 1,
-0.09888228, -0.5394179, -2.73803, 0, 1, 0.6862745, 1,
-0.09666706, -1.533722, -2.332348, 0, 1, 0.6941177, 1,
-0.09532408, -0.7356975, -2.121983, 0, 1, 0.7019608, 1,
-0.09164406, 0.5569686, 1.274047, 0, 1, 0.7058824, 1,
-0.0901524, -0.9410203, -3.405343, 0, 1, 0.7137255, 1,
-0.08743834, 0.5167601, 0.5040682, 0, 1, 0.7176471, 1,
-0.08717927, 1.112882, -0.4739587, 0, 1, 0.7254902, 1,
-0.08591376, 0.3698201, -0.5797133, 0, 1, 0.7294118, 1,
-0.08403027, -2.642342, -3.514554, 0, 1, 0.7372549, 1,
-0.08330669, -0.6740381, -1.921858, 0, 1, 0.7411765, 1,
-0.083261, -0.6522743, -3.064607, 0, 1, 0.7490196, 1,
-0.0791593, -0.835606, -3.825915, 0, 1, 0.7529412, 1,
-0.07612152, -0.5803304, -2.436588, 0, 1, 0.7607843, 1,
-0.0720472, 0.7739408, 0.915301, 0, 1, 0.7647059, 1,
-0.07170714, 0.2427032, -0.2842639, 0, 1, 0.772549, 1,
-0.07115783, -0.5889001, -5.265915, 0, 1, 0.7764706, 1,
-0.07066893, -1.596374, -1.692588, 0, 1, 0.7843137, 1,
-0.06454998, 0.08236096, -2.712496, 0, 1, 0.7882353, 1,
-0.05642537, 0.4156179, -0.9955252, 0, 1, 0.7960784, 1,
-0.05207178, 1.934482, -0.5830845, 0, 1, 0.8039216, 1,
-0.0514958, 1.194608, 1.261682, 0, 1, 0.8078431, 1,
-0.04968178, -0.9686226, -3.262132, 0, 1, 0.8156863, 1,
-0.03829677, -0.2478541, -4.635014, 0, 1, 0.8196079, 1,
-0.03719971, 0.6181527, -0.3478231, 0, 1, 0.827451, 1,
-0.03591638, -0.9918745, -2.004455, 0, 1, 0.8313726, 1,
-0.02980129, -0.4284045, -1.550185, 0, 1, 0.8392157, 1,
-0.02954877, 0.3995669, -0.5550498, 0, 1, 0.8431373, 1,
-0.0235024, -0.6169176, -3.980828, 0, 1, 0.8509804, 1,
-0.02224315, 0.5317166, 0.1549402, 0, 1, 0.854902, 1,
-0.02021288, 1.325211, -0.9956002, 0, 1, 0.8627451, 1,
-0.01838818, -1.375174, -3.69957, 0, 1, 0.8666667, 1,
-0.01768573, -0.3720676, -2.002997, 0, 1, 0.8745098, 1,
-0.01753105, 0.6192598, 0.427589, 0, 1, 0.8784314, 1,
-0.0169925, -0.7447357, -3.267432, 0, 1, 0.8862745, 1,
-0.01618218, 0.07957571, 1.044958, 0, 1, 0.8901961, 1,
-0.0145587, -0.4154838, -3.062391, 0, 1, 0.8980392, 1,
-0.01139427, 0.7033883, 0.2183326, 0, 1, 0.9058824, 1,
-0.0105891, 1.228215, 1.088529, 0, 1, 0.9098039, 1,
-0.007801095, -0.1387005, -3.35556, 0, 1, 0.9176471, 1,
-0.006183766, 0.9802736, -2.080844, 0, 1, 0.9215686, 1,
-0.006009641, 0.8789651, 0.694486, 0, 1, 0.9294118, 1,
-0.001988461, 1.376614, -0.7886322, 0, 1, 0.9333333, 1,
-0.0002846066, -0.20829, -4.818489, 0, 1, 0.9411765, 1,
0.002349781, -0.2900546, 5.636517, 0, 1, 0.945098, 1,
0.00787592, -1.686267, 3.293302, 0, 1, 0.9529412, 1,
0.01061365, 1.726421, 0.06683661, 0, 1, 0.9568627, 1,
0.01073402, 0.1421487, 0.330561, 0, 1, 0.9647059, 1,
0.01130857, -0.1994983, 3.613287, 0, 1, 0.9686275, 1,
0.01148179, 0.5997922, -0.5683336, 0, 1, 0.9764706, 1,
0.01199766, -1.760734, 0.7099259, 0, 1, 0.9803922, 1,
0.01269418, 0.4600539, 0.04921399, 0, 1, 0.9882353, 1,
0.01623847, 0.08660023, 1.190944, 0, 1, 0.9921569, 1,
0.02658103, -1.599482, 4.149477, 0, 1, 1, 1,
0.03227685, 0.05422745, -0.831183, 0, 0.9921569, 1, 1,
0.03475461, 1.696575, 2.020436, 0, 0.9882353, 1, 1,
0.03838382, -1.215347, 3.667129, 0, 0.9803922, 1, 1,
0.04131378, 0.5205401, 0.08177989, 0, 0.9764706, 1, 1,
0.04222962, -1.597959, 1.627847, 0, 0.9686275, 1, 1,
0.04483679, 1.776307, 0.5574545, 0, 0.9647059, 1, 1,
0.0451842, 1.303988, -0.08197097, 0, 0.9568627, 1, 1,
0.04860219, 0.5410953, 0.7757134, 0, 0.9529412, 1, 1,
0.04920986, 1.136348, 0.004082566, 0, 0.945098, 1, 1,
0.05158739, -2.352701, 3.051382, 0, 0.9411765, 1, 1,
0.05274402, 0.4010178, -0.2816701, 0, 0.9333333, 1, 1,
0.05353089, 0.135773, -0.2271384, 0, 0.9294118, 1, 1,
0.05705051, -0.02088245, 1.460756, 0, 0.9215686, 1, 1,
0.0572527, -0.05516142, 2.635686, 0, 0.9176471, 1, 1,
0.06210204, 0.5834432, 1.08492, 0, 0.9098039, 1, 1,
0.06294388, 1.259605, -0.04242631, 0, 0.9058824, 1, 1,
0.06322187, -0.1761615, 2.822623, 0, 0.8980392, 1, 1,
0.06497882, -0.2804689, 3.553381, 0, 0.8901961, 1, 1,
0.06919424, 0.6888282, 0.6688301, 0, 0.8862745, 1, 1,
0.06992315, 1.051161, 0.2173497, 0, 0.8784314, 1, 1,
0.07012635, -0.3958065, 4.555597, 0, 0.8745098, 1, 1,
0.0702493, -1.047909, 3.262805, 0, 0.8666667, 1, 1,
0.07605672, 0.8631523, -0.03238861, 0, 0.8627451, 1, 1,
0.0769806, -0.4021778, 1.976507, 0, 0.854902, 1, 1,
0.07742464, -0.5415694, 3.526901, 0, 0.8509804, 1, 1,
0.07880732, 0.01299711, 3.149694, 0, 0.8431373, 1, 1,
0.07993006, -0.4132375, 2.381181, 0, 0.8392157, 1, 1,
0.08947317, -1.404374, 4.242351, 0, 0.8313726, 1, 1,
0.09021399, 2.523546, 1.091044, 0, 0.827451, 1, 1,
0.09128737, 1.919031, 1.331296, 0, 0.8196079, 1, 1,
0.09792009, 2.275698, 0.1744153, 0, 0.8156863, 1, 1,
0.1004591, 1.037594, -0.6159695, 0, 0.8078431, 1, 1,
0.1006843, -0.9287919, 4.490195, 0, 0.8039216, 1, 1,
0.1049414, -0.1568959, 2.415383, 0, 0.7960784, 1, 1,
0.1053235, -0.5402154, 3.514907, 0, 0.7882353, 1, 1,
0.1072435, -2.331016, 2.391706, 0, 0.7843137, 1, 1,
0.1073862, -1.831645, 2.982549, 0, 0.7764706, 1, 1,
0.1082, -0.1267736, 1.252518, 0, 0.772549, 1, 1,
0.1108408, -0.9216039, 3.57697, 0, 0.7647059, 1, 1,
0.1113004, 1.413785, 0.5302994, 0, 0.7607843, 1, 1,
0.111937, -0.3967122, 1.542909, 0, 0.7529412, 1, 1,
0.1157205, 1.052885, -0.01384774, 0, 0.7490196, 1, 1,
0.1162314, 0.7014319, 1.714222, 0, 0.7411765, 1, 1,
0.1174295, -0.2610138, 0.4184593, 0, 0.7372549, 1, 1,
0.1179296, 1.571418, -0.5158935, 0, 0.7294118, 1, 1,
0.1222304, -0.6079026, 3.914812, 0, 0.7254902, 1, 1,
0.123141, 1.029798, 1.716591, 0, 0.7176471, 1, 1,
0.1267796, -1.039227, 2.470851, 0, 0.7137255, 1, 1,
0.1269033, -1.762547, 2.808621, 0, 0.7058824, 1, 1,
0.1273138, -0.09505438, 3.278283, 0, 0.6980392, 1, 1,
0.1291396, -2.337668, 2.213561, 0, 0.6941177, 1, 1,
0.1367494, 0.9497664, 0.440611, 0, 0.6862745, 1, 1,
0.1374749, 0.4729056, 1.761691, 0, 0.682353, 1, 1,
0.1378061, -0.2685967, 3.730458, 0, 0.6745098, 1, 1,
0.1379218, -0.4444942, 3.656104, 0, 0.6705883, 1, 1,
0.1386812, 0.9507531, 1.077624, 0, 0.6627451, 1, 1,
0.1406251, -0.8250384, 2.973928, 0, 0.6588235, 1, 1,
0.1442332, 0.04449866, 0.6561045, 0, 0.6509804, 1, 1,
0.1466331, -1.428331, 2.943708, 0, 0.6470588, 1, 1,
0.1480619, 0.2912179, 0.1171721, 0, 0.6392157, 1, 1,
0.148884, 0.5950335, 1.059725, 0, 0.6352941, 1, 1,
0.1531555, 2.182858, -0.4402197, 0, 0.627451, 1, 1,
0.1545005, 0.6009017, -0.3837312, 0, 0.6235294, 1, 1,
0.1602823, -0.2032488, 3.27653, 0, 0.6156863, 1, 1,
0.160855, -1.664307, 2.255697, 0, 0.6117647, 1, 1,
0.1611839, -1.275531, 3.705603, 0, 0.6039216, 1, 1,
0.16324, -0.5065409, 2.431044, 0, 0.5960785, 1, 1,
0.1638089, 0.9675324, 0.09031285, 0, 0.5921569, 1, 1,
0.166654, -0.3350916, 2.321805, 0, 0.5843138, 1, 1,
0.1694665, -0.4895208, 4.2332, 0, 0.5803922, 1, 1,
0.1727439, -0.4569335, 2.922048, 0, 0.572549, 1, 1,
0.1751786, -0.2276543, 2.124288, 0, 0.5686275, 1, 1,
0.1753718, 2.28255, 0.5831817, 0, 0.5607843, 1, 1,
0.177464, 0.4547181, 1.123536, 0, 0.5568628, 1, 1,
0.1804985, -0.7324326, 3.389247, 0, 0.5490196, 1, 1,
0.1835924, -0.691148, 2.74316, 0, 0.5450981, 1, 1,
0.1874561, 0.4429584, 1.012675, 0, 0.5372549, 1, 1,
0.1921751, -1.020331, 1.445213, 0, 0.5333334, 1, 1,
0.1931103, 0.7059858, 0.7924939, 0, 0.5254902, 1, 1,
0.1948355, -0.6463649, 1.975443, 0, 0.5215687, 1, 1,
0.1962026, -0.3479967, 5.012877, 0, 0.5137255, 1, 1,
0.1966511, -0.9551718, 1.528338, 0, 0.509804, 1, 1,
0.1974126, 0.2498293, 1.439021, 0, 0.5019608, 1, 1,
0.2013108, 0.5720014, 1.142944, 0, 0.4941176, 1, 1,
0.2044359, 0.02913104, 2.800477, 0, 0.4901961, 1, 1,
0.205648, -0.3113204, 2.638314, 0, 0.4823529, 1, 1,
0.2075384, -0.6818554, 2.439495, 0, 0.4784314, 1, 1,
0.2114178, -0.354453, 3.342251, 0, 0.4705882, 1, 1,
0.2115111, 0.2990711, -1.119144, 0, 0.4666667, 1, 1,
0.2122919, -0.263132, 3.077353, 0, 0.4588235, 1, 1,
0.213707, -1.68384, 2.430205, 0, 0.454902, 1, 1,
0.214039, 1.237336, 1.594318, 0, 0.4470588, 1, 1,
0.216008, 0.6483377, 1.027308, 0, 0.4431373, 1, 1,
0.2175174, 0.04917779, 2.09585, 0, 0.4352941, 1, 1,
0.2176494, 0.4514276, 0.0990087, 0, 0.4313726, 1, 1,
0.2178984, -0.7769496, 1.551952, 0, 0.4235294, 1, 1,
0.2207263, 0.3326939, -0.4324672, 0, 0.4196078, 1, 1,
0.2210156, 0.5781135, 0.4160376, 0, 0.4117647, 1, 1,
0.2305154, -1.519622, 1.674266, 0, 0.4078431, 1, 1,
0.2311409, 0.5019472, -1.586776, 0, 0.4, 1, 1,
0.233483, 1.382631, -0.3691612, 0, 0.3921569, 1, 1,
0.2357225, 0.501017, 0.6250305, 0, 0.3882353, 1, 1,
0.2397404, 0.2828636, 1.834554, 0, 0.3803922, 1, 1,
0.2397851, -0.04445319, 2.569666, 0, 0.3764706, 1, 1,
0.2401267, 1.105663, 0.9752278, 0, 0.3686275, 1, 1,
0.2414475, 0.3584187, 2.551523, 0, 0.3647059, 1, 1,
0.241672, -0.9440414, 1.802485, 0, 0.3568628, 1, 1,
0.2422138, 0.6909191, 0.506794, 0, 0.3529412, 1, 1,
0.2432838, -0.003257419, 0.2160348, 0, 0.345098, 1, 1,
0.2467992, 0.0396437, 1.139356, 0, 0.3411765, 1, 1,
0.2483602, -0.3056743, 1.181952, 0, 0.3333333, 1, 1,
0.2507247, 0.1642008, 0.270104, 0, 0.3294118, 1, 1,
0.2516491, 0.0375107, 1.67597, 0, 0.3215686, 1, 1,
0.2535176, -0.2474251, 3.372817, 0, 0.3176471, 1, 1,
0.2543885, 0.9000744, 0.2997127, 0, 0.3098039, 1, 1,
0.2545381, -0.4119366, 2.916919, 0, 0.3058824, 1, 1,
0.2572776, -0.07938001, 0.6363287, 0, 0.2980392, 1, 1,
0.2600715, 0.4651869, -0.8921096, 0, 0.2901961, 1, 1,
0.2602256, -0.9495176, 4.513678, 0, 0.2862745, 1, 1,
0.2614708, 1.339688, 2.019335, 0, 0.2784314, 1, 1,
0.2614804, 0.348907, 2.608647, 0, 0.2745098, 1, 1,
0.2616774, -0.6795192, 3.749707, 0, 0.2666667, 1, 1,
0.2655007, 0.5661611, 2.141633, 0, 0.2627451, 1, 1,
0.2659332, -0.07186205, 2.297722, 0, 0.254902, 1, 1,
0.2688949, 0.9226291, 0.9316105, 0, 0.2509804, 1, 1,
0.2703506, 0.2729664, 0.6699919, 0, 0.2431373, 1, 1,
0.2705682, -1.993789, 3.561722, 0, 0.2392157, 1, 1,
0.2714429, -1.360354, 3.143035, 0, 0.2313726, 1, 1,
0.2730655, -0.9345866, 3.538223, 0, 0.227451, 1, 1,
0.2742112, 0.6168466, 1.735222, 0, 0.2196078, 1, 1,
0.2786965, -0.7517557, 2.123461, 0, 0.2156863, 1, 1,
0.2803788, 0.9827877, -0.1678396, 0, 0.2078431, 1, 1,
0.284991, -0.1002041, 3.279293, 0, 0.2039216, 1, 1,
0.2924866, 1.106453, 0.9527576, 0, 0.1960784, 1, 1,
0.298821, 0.1003505, -0.3178018, 0, 0.1882353, 1, 1,
0.3054727, 0.400571, 1.19223, 0, 0.1843137, 1, 1,
0.3057359, 2.403296, -1.424723, 0, 0.1764706, 1, 1,
0.3090411, 0.3596582, -0.1262711, 0, 0.172549, 1, 1,
0.314609, 0.4295637, 0.6096498, 0, 0.1647059, 1, 1,
0.3150952, -0.7909741, 4.78489, 0, 0.1607843, 1, 1,
0.3201467, 3.381474, -1.032286, 0, 0.1529412, 1, 1,
0.3241737, -2.013024, 2.729643, 0, 0.1490196, 1, 1,
0.3294841, -0.4120534, 3.118062, 0, 0.1411765, 1, 1,
0.3341754, 0.3733309, 1.182507, 0, 0.1372549, 1, 1,
0.3355826, -0.318335, 2.076797, 0, 0.1294118, 1, 1,
0.3379516, 0.2940784, 0.9132385, 0, 0.1254902, 1, 1,
0.3399336, 0.9741229, 1.884896, 0, 0.1176471, 1, 1,
0.3413919, 0.2246414, 1.78552, 0, 0.1137255, 1, 1,
0.3416052, 0.2209011, 2.653404, 0, 0.1058824, 1, 1,
0.3419376, 1.31799, 0.1821493, 0, 0.09803922, 1, 1,
0.3423711, 0.7101712, -1.427497, 0, 0.09411765, 1, 1,
0.3426589, -0.4844165, 2.4301, 0, 0.08627451, 1, 1,
0.3426994, 0.06656133, 2.19832, 0, 0.08235294, 1, 1,
0.344412, 0.5537231, 1.603184, 0, 0.07450981, 1, 1,
0.3482934, 1.869846, -0.05707989, 0, 0.07058824, 1, 1,
0.3485547, -0.1054769, 0.2509003, 0, 0.0627451, 1, 1,
0.3499872, 0.961705, -0.6950292, 0, 0.05882353, 1, 1,
0.3505886, -1.386694, 2.872784, 0, 0.05098039, 1, 1,
0.3506691, -0.8597502, 3.72484, 0, 0.04705882, 1, 1,
0.3530372, 2.867055, 1.119548, 0, 0.03921569, 1, 1,
0.3539133, -1.019218, 2.844223, 0, 0.03529412, 1, 1,
0.3584599, 0.9095782, 1.222785, 0, 0.02745098, 1, 1,
0.3672117, 1.699818, -0.7014582, 0, 0.02352941, 1, 1,
0.3678259, -0.5345055, 0.4095956, 0, 0.01568628, 1, 1,
0.3680481, -0.5782865, 1.151367, 0, 0.01176471, 1, 1,
0.3715895, -0.945609, 4.393088, 0, 0.003921569, 1, 1,
0.3775159, -0.9232808, 2.504046, 0.003921569, 0, 1, 1,
0.3816033, -0.1313724, 2.223989, 0.007843138, 0, 1, 1,
0.3840389, 1.771145, 1.046728, 0.01568628, 0, 1, 1,
0.38453, 1.079854, 0.6599559, 0.01960784, 0, 1, 1,
0.3884388, -0.7785178, 3.728259, 0.02745098, 0, 1, 1,
0.3889204, 1.381091, -0.4129416, 0.03137255, 0, 1, 1,
0.3920625, 0.1950683, 2.276977, 0.03921569, 0, 1, 1,
0.3945862, -0.9199653, 1.75161, 0.04313726, 0, 1, 1,
0.3968014, -1.051042, 3.199124, 0.05098039, 0, 1, 1,
0.3998065, 0.45132, 0.7455313, 0.05490196, 0, 1, 1,
0.4006257, 0.2515585, 0.3750646, 0.0627451, 0, 1, 1,
0.4008058, 0.3745442, 1.680119, 0.06666667, 0, 1, 1,
0.4019574, 0.02763765, 0.1589773, 0.07450981, 0, 1, 1,
0.4031198, 2.123825, -0.6185407, 0.07843138, 0, 1, 1,
0.4069459, 0.1137065, 1.322141, 0.08627451, 0, 1, 1,
0.4089684, 0.2929277, 1.230555, 0.09019608, 0, 1, 1,
0.4102016, 1.149548, -0.7475671, 0.09803922, 0, 1, 1,
0.4143489, 0.2795022, 1.528761, 0.1058824, 0, 1, 1,
0.4169433, -0.42074, 1.501403, 0.1098039, 0, 1, 1,
0.417056, 0.6949176, 0.5922233, 0.1176471, 0, 1, 1,
0.4180517, -0.848831, 2.322183, 0.1215686, 0, 1, 1,
0.4220174, -1.333346, 2.323227, 0.1294118, 0, 1, 1,
0.4321349, -1.230971, 2.911607, 0.1333333, 0, 1, 1,
0.4329475, -1.711573, 1.700674, 0.1411765, 0, 1, 1,
0.4361567, 0.4038251, 0.5175175, 0.145098, 0, 1, 1,
0.4369277, 0.219253, 3.265868, 0.1529412, 0, 1, 1,
0.4394545, -0.2118433, 1.839879, 0.1568628, 0, 1, 1,
0.4429923, -1.143121, 3.506684, 0.1647059, 0, 1, 1,
0.4466532, -0.02413944, 3.808515, 0.1686275, 0, 1, 1,
0.4557462, -0.2916906, 1.339807, 0.1764706, 0, 1, 1,
0.4604667, 0.07214734, 1.941707, 0.1803922, 0, 1, 1,
0.4677177, -0.9278876, 1.032862, 0.1882353, 0, 1, 1,
0.4741884, 1.331701, -0.2022925, 0.1921569, 0, 1, 1,
0.4782206, 0.4416535, 0.03433698, 0.2, 0, 1, 1,
0.4794682, 0.6438792, -1.208059, 0.2078431, 0, 1, 1,
0.4848621, -1.497802, 1.642155, 0.2117647, 0, 1, 1,
0.4903664, -1.186025, 2.788544, 0.2196078, 0, 1, 1,
0.4924068, 0.7213628, 1.633917, 0.2235294, 0, 1, 1,
0.4934381, 0.7134063, 0.5978895, 0.2313726, 0, 1, 1,
0.4957219, -0.5955716, 2.442306, 0.2352941, 0, 1, 1,
0.5061967, 0.4441572, 1.198008, 0.2431373, 0, 1, 1,
0.5078367, 0.4380887, 0.2397384, 0.2470588, 0, 1, 1,
0.5091565, -1.932588, 0.7748135, 0.254902, 0, 1, 1,
0.5169055, -0.09624354, 1.328776, 0.2588235, 0, 1, 1,
0.5175816, 0.01438233, 2.530404, 0.2666667, 0, 1, 1,
0.5217409, -1.06937, 1.942959, 0.2705882, 0, 1, 1,
0.5257139, -0.3866337, 2.992344, 0.2784314, 0, 1, 1,
0.5321409, 1.246509, -1.468796, 0.282353, 0, 1, 1,
0.5323163, -0.6613289, 3.146983, 0.2901961, 0, 1, 1,
0.5408004, -0.2113936, -0.1641724, 0.2941177, 0, 1, 1,
0.5426149, -0.8687093, 2.036757, 0.3019608, 0, 1, 1,
0.5606468, -0.77544, 3.365817, 0.3098039, 0, 1, 1,
0.5617356, 1.343438, 1.254355, 0.3137255, 0, 1, 1,
0.5648782, -0.06548805, 0.127188, 0.3215686, 0, 1, 1,
0.5665625, -0.4453688, 0.7533743, 0.3254902, 0, 1, 1,
0.5668346, -0.3382208, 2.381225, 0.3333333, 0, 1, 1,
0.5721254, 0.3466814, 0.6503178, 0.3372549, 0, 1, 1,
0.5731205, 0.01977983, 1.013362, 0.345098, 0, 1, 1,
0.5749999, -0.4135478, 2.799406, 0.3490196, 0, 1, 1,
0.5770647, -1.460094, 3.558058, 0.3568628, 0, 1, 1,
0.5789768, -1.338644, 4.630086, 0.3607843, 0, 1, 1,
0.582762, -0.4459793, 1.67872, 0.3686275, 0, 1, 1,
0.5845988, -1.3021, 2.591589, 0.372549, 0, 1, 1,
0.5846549, 0.3108018, 0.9083191, 0.3803922, 0, 1, 1,
0.5867424, 1.632312, 2.466008, 0.3843137, 0, 1, 1,
0.5870684, -0.8289383, 2.258329, 0.3921569, 0, 1, 1,
0.5873312, -0.1890051, 3.172732, 0.3960784, 0, 1, 1,
0.5892502, -0.09829285, 2.293559, 0.4039216, 0, 1, 1,
0.5924515, 1.455022, 0.7488282, 0.4117647, 0, 1, 1,
0.593951, -0.9959, 1.699272, 0.4156863, 0, 1, 1,
0.5999555, 1.385898, 1.682356, 0.4235294, 0, 1, 1,
0.602393, -0.5672107, 2.750451, 0.427451, 0, 1, 1,
0.6075286, 0.5211423, 1.009495, 0.4352941, 0, 1, 1,
0.6086294, -1.369068, 2.938362, 0.4392157, 0, 1, 1,
0.6088397, 0.112089, 3.068692, 0.4470588, 0, 1, 1,
0.610471, -0.06817856, -0.7956056, 0.4509804, 0, 1, 1,
0.6113003, 0.3223075, 2.26483, 0.4588235, 0, 1, 1,
0.6134578, -0.8663646, 1.78257, 0.4627451, 0, 1, 1,
0.615182, -1.564859, 2.352858, 0.4705882, 0, 1, 1,
0.6158286, 2.654456, 0.5685109, 0.4745098, 0, 1, 1,
0.6186997, 0.1456268, 0.4466288, 0.4823529, 0, 1, 1,
0.6203978, -0.304543, 0.3499716, 0.4862745, 0, 1, 1,
0.6267908, -1.821416, 4.654256, 0.4941176, 0, 1, 1,
0.6441649, 1.421869, -0.6824102, 0.5019608, 0, 1, 1,
0.6451045, -1.673272, 1.751321, 0.5058824, 0, 1, 1,
0.6458381, -0.8698942, 2.375275, 0.5137255, 0, 1, 1,
0.6462647, -1.365049, 2.932025, 0.5176471, 0, 1, 1,
0.648253, 1.681905, -0.03959468, 0.5254902, 0, 1, 1,
0.648946, -0.8866248, 2.895314, 0.5294118, 0, 1, 1,
0.651657, 0.3358088, 3.076536, 0.5372549, 0, 1, 1,
0.6540521, -0.3393635, 2.538055, 0.5411765, 0, 1, 1,
0.6600949, 0.9298981, 1.137564, 0.5490196, 0, 1, 1,
0.6638491, -0.1149518, 2.379612, 0.5529412, 0, 1, 1,
0.6709192, -0.7445731, 3.090419, 0.5607843, 0, 1, 1,
0.6734391, -0.6568221, 2.554413, 0.5647059, 0, 1, 1,
0.674055, 0.9345412, 1.200611, 0.572549, 0, 1, 1,
0.6756728, -1.424566, 2.970676, 0.5764706, 0, 1, 1,
0.6771709, 0.6696873, 2.234455, 0.5843138, 0, 1, 1,
0.6832497, -1.755444, 3.077323, 0.5882353, 0, 1, 1,
0.6841022, 0.3765535, 2.29802, 0.5960785, 0, 1, 1,
0.6842341, -1.78634, 2.695766, 0.6039216, 0, 1, 1,
0.6850055, -0.01661458, 0.5142726, 0.6078432, 0, 1, 1,
0.6858348, -0.8755276, 2.648393, 0.6156863, 0, 1, 1,
0.6860218, -0.7337053, 1.958729, 0.6196079, 0, 1, 1,
0.6911981, 0.4024554, 1.013767, 0.627451, 0, 1, 1,
0.7066424, 0.1057031, 1.063728, 0.6313726, 0, 1, 1,
0.7091502, 0.422349, 1.720375, 0.6392157, 0, 1, 1,
0.7105873, -1.539038, 3.75962, 0.6431373, 0, 1, 1,
0.712514, -0.6470591, 2.883605, 0.6509804, 0, 1, 1,
0.7190257, 1.086735, 1.759329, 0.654902, 0, 1, 1,
0.7264409, 0.6695312, 0.3990747, 0.6627451, 0, 1, 1,
0.7329854, -1.013491, 1.514645, 0.6666667, 0, 1, 1,
0.736569, 1.261747, 0.2227765, 0.6745098, 0, 1, 1,
0.7372957, 1.059251, 0.02724783, 0.6784314, 0, 1, 1,
0.7388511, 1.038179, -0.2932094, 0.6862745, 0, 1, 1,
0.7419841, 0.1561402, 2.250004, 0.6901961, 0, 1, 1,
0.7458839, -0.2061403, 2.897464, 0.6980392, 0, 1, 1,
0.7500287, 1.657911, -1.473494, 0.7058824, 0, 1, 1,
0.7513493, 1.270724, 0.7326619, 0.7098039, 0, 1, 1,
0.7552029, 0.9487836, 2.773683, 0.7176471, 0, 1, 1,
0.7568631, -0.6357011, 2.342922, 0.7215686, 0, 1, 1,
0.7635579, -0.7743294, 2.664614, 0.7294118, 0, 1, 1,
0.767097, -1.46225, 4.524712, 0.7333333, 0, 1, 1,
0.7675448, -0.7362954, 4.531739, 0.7411765, 0, 1, 1,
0.7729806, 0.03305825, 0.8644233, 0.7450981, 0, 1, 1,
0.773643, 2.119494, 1.13657, 0.7529412, 0, 1, 1,
0.7739315, 1.082463, 0.0169384, 0.7568628, 0, 1, 1,
0.7739528, 0.9851251, 1.428228, 0.7647059, 0, 1, 1,
0.7770705, -0.7286727, 2.11057, 0.7686275, 0, 1, 1,
0.7772646, -1.286597, 2.915048, 0.7764706, 0, 1, 1,
0.7863894, -0.268072, 3.714158, 0.7803922, 0, 1, 1,
0.7895402, -1.310114, 4.272169, 0.7882353, 0, 1, 1,
0.7922468, -0.1045716, 2.85333, 0.7921569, 0, 1, 1,
0.7982821, -0.5101478, 2.541654, 0.8, 0, 1, 1,
0.7995834, -0.2108518, 1.944093, 0.8078431, 0, 1, 1,
0.8023158, 0.7288006, -0.5720986, 0.8117647, 0, 1, 1,
0.8046319, -0.7768175, 2.700097, 0.8196079, 0, 1, 1,
0.8062048, -1.29263, 2.085468, 0.8235294, 0, 1, 1,
0.8095441, -0.6590126, 2.980585, 0.8313726, 0, 1, 1,
0.8140114, -0.6640719, 2.274413, 0.8352941, 0, 1, 1,
0.8185634, 0.3347934, -0.09121527, 0.8431373, 0, 1, 1,
0.8243701, 0.6419637, 0.1576591, 0.8470588, 0, 1, 1,
0.8287914, -0.6664034, 2.00144, 0.854902, 0, 1, 1,
0.8366696, -1.880025, 1.713274, 0.8588235, 0, 1, 1,
0.8406217, 1.318073, -0.01950504, 0.8666667, 0, 1, 1,
0.848182, 0.5277019, 0.1530665, 0.8705882, 0, 1, 1,
0.849844, 0.09251991, 1.914973, 0.8784314, 0, 1, 1,
0.8544002, 0.5854367, 1.802971, 0.8823529, 0, 1, 1,
0.857958, -1.537095, 1.860212, 0.8901961, 0, 1, 1,
0.8665182, -0.4278203, -0.03562261, 0.8941177, 0, 1, 1,
0.8722411, -0.1578057, 0.6273727, 0.9019608, 0, 1, 1,
0.8817194, -1.725356, 2.293585, 0.9098039, 0, 1, 1,
0.8830953, -1.206078, 1.865633, 0.9137255, 0, 1, 1,
0.891678, 0.2406943, 1.305083, 0.9215686, 0, 1, 1,
0.9069018, 1.232973, 2.095041, 0.9254902, 0, 1, 1,
0.9071565, -0.9993536, 3.060826, 0.9333333, 0, 1, 1,
0.9075501, 0.2192852, 1.767941, 0.9372549, 0, 1, 1,
0.9166503, 1.114842, 0.1830827, 0.945098, 0, 1, 1,
0.919163, -0.9743993, 1.806202, 0.9490196, 0, 1, 1,
0.9252625, -1.462, 2.30555, 0.9568627, 0, 1, 1,
0.9337862, -0.7568551, 3.633705, 0.9607843, 0, 1, 1,
0.9383894, 0.1216246, 0.5766889, 0.9686275, 0, 1, 1,
0.9430504, 0.4510292, 0.9428397, 0.972549, 0, 1, 1,
0.9455039, 0.1016655, 2.423029, 0.9803922, 0, 1, 1,
0.9460135, 0.4317394, -0.02233787, 0.9843137, 0, 1, 1,
0.9474266, 1.858128, -1.001004, 0.9921569, 0, 1, 1,
0.9488814, -1.103067, 3.803077, 0.9960784, 0, 1, 1,
0.9528531, 0.4046992, -0.6919839, 1, 0, 0.9960784, 1,
0.9551083, 0.6243287, 0.567453, 1, 0, 0.9882353, 1,
0.9585701, 1.22603, 1.185793, 1, 0, 0.9843137, 1,
0.9659255, -1.38216, 2.712157, 1, 0, 0.9764706, 1,
0.969552, -0.5319366, 1.723527, 1, 0, 0.972549, 1,
0.9711243, -0.367608, 2.779148, 1, 0, 0.9647059, 1,
0.9814557, 0.9161785, 0.6640232, 1, 0, 0.9607843, 1,
0.985747, 0.2653207, 1.649912, 1, 0, 0.9529412, 1,
0.9860409, -0.1069273, 1.96918, 1, 0, 0.9490196, 1,
0.9885459, 1.046807, 1.287937, 1, 0, 0.9411765, 1,
0.9890122, 0.6231098, 1.404339, 1, 0, 0.9372549, 1,
0.9892507, 1.22189, 1.094106, 1, 0, 0.9294118, 1,
0.994133, -1.762146, 1.738918, 1, 0, 0.9254902, 1,
0.9969637, 0.1447611, 2.299149, 1, 0, 0.9176471, 1,
1.001374, 1.122015, 0.08602515, 1, 0, 0.9137255, 1,
1.002031, -0.6175307, 1.462703, 1, 0, 0.9058824, 1,
1.004096, 0.6463886, 0.2966047, 1, 0, 0.9019608, 1,
1.004459, 1.617444, 2.129458, 1, 0, 0.8941177, 1,
1.007799, 1.228285, 0.9040694, 1, 0, 0.8862745, 1,
1.008908, 1.440315, 0.6777093, 1, 0, 0.8823529, 1,
1.009507, 0.6354169, 2.845894, 1, 0, 0.8745098, 1,
1.012436, -0.7258836, 4.567803, 1, 0, 0.8705882, 1,
1.017031, -0.3617848, 1.353683, 1, 0, 0.8627451, 1,
1.017756, 1.182786, 3.152668, 1, 0, 0.8588235, 1,
1.025067, -2.095605, 3.751983, 1, 0, 0.8509804, 1,
1.030048, -0.3932982, 2.749709, 1, 0, 0.8470588, 1,
1.031623, -0.1662169, 1.10821, 1, 0, 0.8392157, 1,
1.035, 0.2037559, 2.531902, 1, 0, 0.8352941, 1,
1.047992, -0.009710031, 1.777339, 1, 0, 0.827451, 1,
1.051174, 1.278973, 1.424515, 1, 0, 0.8235294, 1,
1.052575, 0.8268968, 0.4691771, 1, 0, 0.8156863, 1,
1.071829, 0.9299642, -0.5025612, 1, 0, 0.8117647, 1,
1.075849, -0.9968709, 1.688566, 1, 0, 0.8039216, 1,
1.078676, 1.444151, 0.6297795, 1, 0, 0.7960784, 1,
1.09098, 0.1209811, 0.8711008, 1, 0, 0.7921569, 1,
1.094305, -0.9199751, 1.493742, 1, 0, 0.7843137, 1,
1.094621, -1.902493, 1.624116, 1, 0, 0.7803922, 1,
1.109265, 0.5121807, 0.2224066, 1, 0, 0.772549, 1,
1.113674, -0.5581771, 0.9230122, 1, 0, 0.7686275, 1,
1.11828, -1.379214, 2.987236, 1, 0, 0.7607843, 1,
1.121573, 1.683615, 1.962843, 1, 0, 0.7568628, 1,
1.146976, -1.789531, 2.736743, 1, 0, 0.7490196, 1,
1.151866, -0.07355999, 2.414961, 1, 0, 0.7450981, 1,
1.161265, -0.9837152, 0.2571917, 1, 0, 0.7372549, 1,
1.161786, -0.4814751, 2.016389, 1, 0, 0.7333333, 1,
1.163373, 0.3586935, 0.2901696, 1, 0, 0.7254902, 1,
1.169845, 0.5061293, 1.87176, 1, 0, 0.7215686, 1,
1.176073, 0.2842175, 0.6196758, 1, 0, 0.7137255, 1,
1.176136, 1.067138, 0.3279059, 1, 0, 0.7098039, 1,
1.180338, -1.431288, 2.569033, 1, 0, 0.7019608, 1,
1.180602, -0.2375462, 0.6036623, 1, 0, 0.6941177, 1,
1.182536, 1.087251, 0.2023078, 1, 0, 0.6901961, 1,
1.197925, 0.2954471, 1.224157, 1, 0, 0.682353, 1,
1.210844, 1.051181, 0.145409, 1, 0, 0.6784314, 1,
1.213214, -0.3577212, 2.107934, 1, 0, 0.6705883, 1,
1.218406, 1.362579, -0.8811949, 1, 0, 0.6666667, 1,
1.228754, 0.9140075, -0.9968185, 1, 0, 0.6588235, 1,
1.235928, 2.092742, 0.8802919, 1, 0, 0.654902, 1,
1.239537, 0.09492372, 0.9971684, 1, 0, 0.6470588, 1,
1.244204, -0.9567906, 1.600915, 1, 0, 0.6431373, 1,
1.245546, -0.1369104, 0.6623929, 1, 0, 0.6352941, 1,
1.245962, 1.303116, 0.01330299, 1, 0, 0.6313726, 1,
1.249554, 0.346433, 0.8195153, 1, 0, 0.6235294, 1,
1.256169, -1.162333, 0.8477402, 1, 0, 0.6196079, 1,
1.258302, 0.9892119, 1.538608, 1, 0, 0.6117647, 1,
1.263192, -0.7707798, 3.091005, 1, 0, 0.6078432, 1,
1.263283, -1.983423, 1.763457, 1, 0, 0.6, 1,
1.268107, -1.156011, 1.204279, 1, 0, 0.5921569, 1,
1.279013, 1.107328, -0.01467107, 1, 0, 0.5882353, 1,
1.279629, -0.1345395, 1.16957, 1, 0, 0.5803922, 1,
1.283689, -0.7431068, 0.8027818, 1, 0, 0.5764706, 1,
1.300917, 2.206997, 0.5496502, 1, 0, 0.5686275, 1,
1.301008, 2.159049, 1.169719, 1, 0, 0.5647059, 1,
1.302061, 0.1390503, 1.01209, 1, 0, 0.5568628, 1,
1.306451, -0.05046863, 1.511187, 1, 0, 0.5529412, 1,
1.3088, -0.4924627, 1.547624, 1, 0, 0.5450981, 1,
1.308859, -0.2518975, 2.836039, 1, 0, 0.5411765, 1,
1.313796, -0.1933406, 0.9987997, 1, 0, 0.5333334, 1,
1.31784, -0.4083403, 1.289314, 1, 0, 0.5294118, 1,
1.320339, 0.6145452, -0.1758145, 1, 0, 0.5215687, 1,
1.3249, 0.6269118, 0.004626616, 1, 0, 0.5176471, 1,
1.327298, -0.3404195, 3.211801, 1, 0, 0.509804, 1,
1.334019, -0.7385379, 4.65303, 1, 0, 0.5058824, 1,
1.334672, 0.8564012, 0.4309659, 1, 0, 0.4980392, 1,
1.337308, 1.976102, 0.8776272, 1, 0, 0.4901961, 1,
1.341832, -0.2864232, 2.688873, 1, 0, 0.4862745, 1,
1.356874, -0.3393721, 2.112756, 1, 0, 0.4784314, 1,
1.361128, -0.08797359, 1.536325, 1, 0, 0.4745098, 1,
1.366384, 0.5480883, -0.6980693, 1, 0, 0.4666667, 1,
1.368567, 1.55698, 1.399537, 1, 0, 0.4627451, 1,
1.3732, -1.47633, 3.187725, 1, 0, 0.454902, 1,
1.37617, -1.297467, 3.940678, 1, 0, 0.4509804, 1,
1.385962, 0.8896927, 0.7941486, 1, 0, 0.4431373, 1,
1.388009, 1.097213, 1.539273, 1, 0, 0.4392157, 1,
1.402156, -0.03788197, 1.742705, 1, 0, 0.4313726, 1,
1.412046, -0.7918851, 3.170771, 1, 0, 0.427451, 1,
1.41814, 0.2167899, 1.924373, 1, 0, 0.4196078, 1,
1.425111, 1.604372, -1.005932, 1, 0, 0.4156863, 1,
1.429688, -2.035304, 0.6278163, 1, 0, 0.4078431, 1,
1.437388, 0.9978232, -0.4281062, 1, 0, 0.4039216, 1,
1.461076, 0.545694, 0.8406836, 1, 0, 0.3960784, 1,
1.464752, 1.474363, 0.3992254, 1, 0, 0.3882353, 1,
1.466152, -2.339938, 2.452034, 1, 0, 0.3843137, 1,
1.46629, -0.7502514, 2.114932, 1, 0, 0.3764706, 1,
1.467345, 0.5105719, 1.599016, 1, 0, 0.372549, 1,
1.470853, 1.37596, 2.752119, 1, 0, 0.3647059, 1,
1.477433, -0.0996367, -0.2570727, 1, 0, 0.3607843, 1,
1.48175, -0.1753405, 1.659674, 1, 0, 0.3529412, 1,
1.489324, 0.5679833, -0.3401346, 1, 0, 0.3490196, 1,
1.505395, -0.5959323, 2.782459, 1, 0, 0.3411765, 1,
1.515169, -0.3886191, 0.02055946, 1, 0, 0.3372549, 1,
1.52979, 0.7194126, 0.761071, 1, 0, 0.3294118, 1,
1.53894, 1.122857, 0.8844472, 1, 0, 0.3254902, 1,
1.555154, 2.099467, 1.300359, 1, 0, 0.3176471, 1,
1.561117, -0.7235562, 2.461989, 1, 0, 0.3137255, 1,
1.56777, -0.8728009, 2.207786, 1, 0, 0.3058824, 1,
1.576852, -1.434032, 2.540939, 1, 0, 0.2980392, 1,
1.586099, 0.459882, 1.054804, 1, 0, 0.2941177, 1,
1.605207, 0.6733084, 1.671722, 1, 0, 0.2862745, 1,
1.615975, 0.02978835, 0.7484459, 1, 0, 0.282353, 1,
1.617848, 1.065791, 0.4079272, 1, 0, 0.2745098, 1,
1.622919, -0.4124663, 1.295621, 1, 0, 0.2705882, 1,
1.627166, -1.405031, 1.912147, 1, 0, 0.2627451, 1,
1.633136, 0.9816244, 2.379715, 1, 0, 0.2588235, 1,
1.636289, -0.2630771, 4.01401, 1, 0, 0.2509804, 1,
1.646211, -0.7536857, 3.15432, 1, 0, 0.2470588, 1,
1.651817, -0.9925253, 1.461193, 1, 0, 0.2392157, 1,
1.667632, 0.8761259, 1.981103, 1, 0, 0.2352941, 1,
1.675787, -1.145475, 1.982613, 1, 0, 0.227451, 1,
1.68741, 0.8777044, 0.1060341, 1, 0, 0.2235294, 1,
1.690823, 0.4835902, 1.569428, 1, 0, 0.2156863, 1,
1.692368, 0.5446648, 2.690691, 1, 0, 0.2117647, 1,
1.709341, 0.6553032, 0.1796078, 1, 0, 0.2039216, 1,
1.735694, -0.07993488, 2.038187, 1, 0, 0.1960784, 1,
1.742717, 0.07978736, -0.6189528, 1, 0, 0.1921569, 1,
1.745935, 0.590207, -0.1123286, 1, 0, 0.1843137, 1,
1.756819, 0.07646555, 3.266358, 1, 0, 0.1803922, 1,
1.762113, 1.280174, 1.142191, 1, 0, 0.172549, 1,
1.776989, 2.361833, 1.689865, 1, 0, 0.1686275, 1,
1.793062, -2.047006, 0.9922268, 1, 0, 0.1607843, 1,
1.803043, 0.2226501, 3.123822, 1, 0, 0.1568628, 1,
1.804122, 0.8332886, 0.8856526, 1, 0, 0.1490196, 1,
1.812565, -0.5175339, 0.6844763, 1, 0, 0.145098, 1,
1.813412, -2.340009, 1.954134, 1, 0, 0.1372549, 1,
1.813428, -0.45373, 2.005615, 1, 0, 0.1333333, 1,
1.818136, -2.094147, 0.1033292, 1, 0, 0.1254902, 1,
1.83937, 0.9334852, -0.6641859, 1, 0, 0.1215686, 1,
1.857456, -1.124348, 1.858789, 1, 0, 0.1137255, 1,
1.906891, -1.631086, 2.648105, 1, 0, 0.1098039, 1,
1.913817, 1.275979, 0.2438645, 1, 0, 0.1019608, 1,
1.923285, 0.3908052, 2.020982, 1, 0, 0.09411765, 1,
1.97928, 0.9791431, 0.03191654, 1, 0, 0.09019608, 1,
2.048752, -0.6074526, 1.712517, 1, 0, 0.08235294, 1,
2.115279, 1.36715, 2.12748, 1, 0, 0.07843138, 1,
2.13365, 1.370193, 0.8859088, 1, 0, 0.07058824, 1,
2.134444, 0.1834937, 1.627998, 1, 0, 0.06666667, 1,
2.171958, 0.4028587, -0.2207996, 1, 0, 0.05882353, 1,
2.194083, 0.3902727, 0.9872914, 1, 0, 0.05490196, 1,
2.28722, -0.7125435, 2.78534, 1, 0, 0.04705882, 1,
2.287362, 0.807264, 2.01903, 1, 0, 0.04313726, 1,
2.313672, 0.2507657, 1.087888, 1, 0, 0.03529412, 1,
2.383895, -0.3456948, 2.082779, 1, 0, 0.03137255, 1,
2.38722, 0.2587267, 1.236975, 1, 0, 0.02352941, 1,
2.407246, 0.4655834, 1.485584, 1, 0, 0.01960784, 1,
2.408707, 0.02834385, 1.286084, 1, 0, 0.01176471, 1,
2.498002, 1.255194, 2.511903, 1, 0, 0.007843138, 1
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
-0.4888842, -4.273314, -7.113878, 0, -0.5, 0.5, 0.5,
-0.4888842, -4.273314, -7.113878, 1, -0.5, 0.5, 0.5,
-0.4888842, -4.273314, -7.113878, 1, 1.5, 0.5, 0.5,
-0.4888842, -4.273314, -7.113878, 0, 1.5, 0.5, 0.5
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
-4.488325, 0.108799, -7.113878, 0, -0.5, 0.5, 0.5,
-4.488325, 0.108799, -7.113878, 1, -0.5, 0.5, 0.5,
-4.488325, 0.108799, -7.113878, 1, 1.5, 0.5, 0.5,
-4.488325, 0.108799, -7.113878, 0, 1.5, 0.5, 0.5
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
-4.488325, -4.273314, 0.1853006, 0, -0.5, 0.5, 0.5,
-4.488325, -4.273314, 0.1853006, 1, -0.5, 0.5, 0.5,
-4.488325, -4.273314, 0.1853006, 1, 1.5, 0.5, 0.5,
-4.488325, -4.273314, 0.1853006, 0, 1.5, 0.5, 0.5
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
-3, -3.262057, -5.429452,
2, -3.262057, -5.429452,
-3, -3.262057, -5.429452,
-3, -3.4306, -5.710189,
-2, -3.262057, -5.429452,
-2, -3.4306, -5.710189,
-1, -3.262057, -5.429452,
-1, -3.4306, -5.710189,
0, -3.262057, -5.429452,
0, -3.4306, -5.710189,
1, -3.262057, -5.429452,
1, -3.4306, -5.710189,
2, -3.262057, -5.429452,
2, -3.4306, -5.710189
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
-3, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
-3, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
-3, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
-3, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5,
-2, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
-2, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
-2, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
-2, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5,
-1, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
-1, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
-1, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
-1, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5,
0, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
0, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
0, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
0, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5,
1, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
1, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
1, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
1, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5,
2, -3.767685, -6.271665, 0, -0.5, 0.5, 0.5,
2, -3.767685, -6.271665, 1, -0.5, 0.5, 0.5,
2, -3.767685, -6.271665, 1, 1.5, 0.5, 0.5,
2, -3.767685, -6.271665, 0, 1.5, 0.5, 0.5
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
-3.565377, -3, -5.429452,
-3.565377, 3, -5.429452,
-3.565377, -3, -5.429452,
-3.719202, -3, -5.710189,
-3.565377, -2, -5.429452,
-3.719202, -2, -5.710189,
-3.565377, -1, -5.429452,
-3.719202, -1, -5.710189,
-3.565377, 0, -5.429452,
-3.719202, 0, -5.710189,
-3.565377, 1, -5.429452,
-3.719202, 1, -5.710189,
-3.565377, 2, -5.429452,
-3.719202, 2, -5.710189,
-3.565377, 3, -5.429452,
-3.719202, 3, -5.710189
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
-4.026851, -3, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, -3, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, -3, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, -3, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, -2, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, -2, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, -2, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, -2, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, -1, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, -1, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, -1, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, -1, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, 0, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, 0, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, 0, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, 0, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, 1, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, 1, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, 1, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, 1, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, 2, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, 2, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, 2, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, 2, -6.271665, 0, 1.5, 0.5, 0.5,
-4.026851, 3, -6.271665, 0, -0.5, 0.5, 0.5,
-4.026851, 3, -6.271665, 1, -0.5, 0.5, 0.5,
-4.026851, 3, -6.271665, 1, 1.5, 0.5, 0.5,
-4.026851, 3, -6.271665, 0, 1.5, 0.5, 0.5
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
-3.565377, -3.262057, -4,
-3.565377, -3.262057, 4,
-3.565377, -3.262057, -4,
-3.719202, -3.4306, -4,
-3.565377, -3.262057, -2,
-3.719202, -3.4306, -2,
-3.565377, -3.262057, 0,
-3.719202, -3.4306, 0,
-3.565377, -3.262057, 2,
-3.719202, -3.4306, 2,
-3.565377, -3.262057, 4,
-3.719202, -3.4306, 4
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
-4.026851, -3.767685, -4, 0, -0.5, 0.5, 0.5,
-4.026851, -3.767685, -4, 1, -0.5, 0.5, 0.5,
-4.026851, -3.767685, -4, 1, 1.5, 0.5, 0.5,
-4.026851, -3.767685, -4, 0, 1.5, 0.5, 0.5,
-4.026851, -3.767685, -2, 0, -0.5, 0.5, 0.5,
-4.026851, -3.767685, -2, 1, -0.5, 0.5, 0.5,
-4.026851, -3.767685, -2, 1, 1.5, 0.5, 0.5,
-4.026851, -3.767685, -2, 0, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 0, 0, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 0, 1, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 0, 1, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 0, 0, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 2, 0, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 2, 1, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 2, 1, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 2, 0, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 4, 0, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 4, 1, -0.5, 0.5, 0.5,
-4.026851, -3.767685, 4, 1, 1.5, 0.5, 0.5,
-4.026851, -3.767685, 4, 0, 1.5, 0.5, 0.5
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
-3.565377, -3.262057, -5.429452,
-3.565377, 3.479655, -5.429452,
-3.565377, -3.262057, 5.800053,
-3.565377, 3.479655, 5.800053,
-3.565377, -3.262057, -5.429452,
-3.565377, -3.262057, 5.800053,
-3.565377, 3.479655, -5.429452,
-3.565377, 3.479655, 5.800053,
-3.565377, -3.262057, -5.429452,
2.587609, -3.262057, -5.429452,
-3.565377, -3.262057, 5.800053,
2.587609, -3.262057, 5.800053,
-3.565377, 3.479655, -5.429452,
2.587609, 3.479655, -5.429452,
-3.565377, 3.479655, 5.800053,
2.587609, 3.479655, 5.800053,
2.587609, -3.262057, -5.429452,
2.587609, 3.479655, -5.429452,
2.587609, -3.262057, 5.800053,
2.587609, 3.479655, 5.800053,
2.587609, -3.262057, -5.429452,
2.587609, -3.262057, 5.800053,
2.587609, 3.479655, -5.429452,
2.587609, 3.479655, 5.800053
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
var radius = 7.727267;
var distance = 34.37949;
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
mvMatrix.translate( 0.4888842, -0.108799, -0.1853006 );
mvMatrix.scale( 1.357857, 1.239281, 0.7440108 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.37949);
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
thiodicarb<-read.table("thiodicarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiodicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
```

```r
y<-thiodicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
```

```r
z<-thiodicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
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
-3.475771, 0.3140578, 1.122352, 0, 0, 1, 1, 1,
-3.208374, -0.8387003, -2.64382, 1, 0, 0, 1, 1,
-2.489704, -0.3928953, -1.629817, 1, 0, 0, 1, 1,
-2.358858, -1.232903, -3.815004, 1, 0, 0, 1, 1,
-2.292873, 0.341016, 1.307198, 1, 0, 0, 1, 1,
-2.260785, -0.08777721, -3.072745, 1, 0, 0, 1, 1,
-2.192602, -0.169526, -0.2585812, 0, 0, 0, 1, 1,
-2.159459, 0.764009, -1.34023, 0, 0, 0, 1, 1,
-2.158994, 1.248567, -0.6873705, 0, 0, 0, 1, 1,
-2.077038, 0.2742424, 1.315639, 0, 0, 0, 1, 1,
-2.024556, 0.1962892, -0.2963493, 0, 0, 0, 1, 1,
-1.972372, 0.4993621, 0.5078814, 0, 0, 0, 1, 1,
-1.963053, 0.3255368, -1.168925, 0, 0, 0, 1, 1,
-1.932595, -0.3973177, -2.200887, 1, 1, 1, 1, 1,
-1.910647, 1.363739, -1.868326, 1, 1, 1, 1, 1,
-1.898803, -0.1478698, -3.238575, 1, 1, 1, 1, 1,
-1.895011, -0.5475219, -0.829822, 1, 1, 1, 1, 1,
-1.845804, 0.8981078, -1.723582, 1, 1, 1, 1, 1,
-1.830565, -1.57368, -2.583235, 1, 1, 1, 1, 1,
-1.822717, 0.217628, 0.7829832, 1, 1, 1, 1, 1,
-1.796808, -1.316099, -4.084334, 1, 1, 1, 1, 1,
-1.77288, 0.7041032, -0.5677806, 1, 1, 1, 1, 1,
-1.769201, 0.3049353, -1.182477, 1, 1, 1, 1, 1,
-1.752671, -2.659126, -3.000202, 1, 1, 1, 1, 1,
-1.752266, -0.5456793, -2.699582, 1, 1, 1, 1, 1,
-1.747532, 1.594328, 0.1162901, 1, 1, 1, 1, 1,
-1.746508, 0.6681065, -0.8150945, 1, 1, 1, 1, 1,
-1.730541, -0.1611737, -2.14003, 1, 1, 1, 1, 1,
-1.728779, -1.29015, -1.380683, 0, 0, 1, 1, 1,
-1.713393, 0.1831463, -1.770798, 1, 0, 0, 1, 1,
-1.709416, -0.4682051, -1.857563, 1, 0, 0, 1, 1,
-1.702399, -1.170883, -2.534546, 1, 0, 0, 1, 1,
-1.697142, -0.2657795, -1.643724, 1, 0, 0, 1, 1,
-1.683206, -1.249415, -1.767331, 1, 0, 0, 1, 1,
-1.675028, 1.415386, -0.4007355, 0, 0, 0, 1, 1,
-1.659698, 0.1139457, -1.39521, 0, 0, 0, 1, 1,
-1.644417, 0.5136612, -0.227911, 0, 0, 0, 1, 1,
-1.63455, 0.4637656, -1.430211, 0, 0, 0, 1, 1,
-1.618104, 0.3063777, -2.904918, 0, 0, 0, 1, 1,
-1.616991, 0.03005616, -2.535892, 0, 0, 0, 1, 1,
-1.610077, 0.209845, -0.9916471, 0, 0, 0, 1, 1,
-1.596207, 1.505856, -2.722493, 1, 1, 1, 1, 1,
-1.593648, 0.973579, -2.227486, 1, 1, 1, 1, 1,
-1.587608, -1.03101, -3.556291, 1, 1, 1, 1, 1,
-1.57775, -0.7260613, -1.558273, 1, 1, 1, 1, 1,
-1.575432, 0.09986069, -2.615229, 1, 1, 1, 1, 1,
-1.571432, -0.8177587, -2.657683, 1, 1, 1, 1, 1,
-1.55925, 1.267532, -2.183949, 1, 1, 1, 1, 1,
-1.551212, 0.1158716, -3.320794, 1, 1, 1, 1, 1,
-1.545979, 0.8377494, 0.1642033, 1, 1, 1, 1, 1,
-1.509042, -0.837302, -0.840777, 1, 1, 1, 1, 1,
-1.498973, 1.331654, -0.5740473, 1, 1, 1, 1, 1,
-1.496409, -0.6582605, -2.285916, 1, 1, 1, 1, 1,
-1.492234, 0.2529214, -0.3436023, 1, 1, 1, 1, 1,
-1.481004, 0.01681773, -2.25828, 1, 1, 1, 1, 1,
-1.476966, 0.4154299, -1.3647, 1, 1, 1, 1, 1,
-1.46137, -0.3366885, 0.1793493, 0, 0, 1, 1, 1,
-1.458526, -1.573428, -2.495889, 1, 0, 0, 1, 1,
-1.4569, -1.185615, -1.971632, 1, 0, 0, 1, 1,
-1.452479, 0.06969737, -2.964568, 1, 0, 0, 1, 1,
-1.448734, 0.8084704, -1.718372, 1, 0, 0, 1, 1,
-1.432944, -1.037634, -1.688762, 1, 0, 0, 1, 1,
-1.409243, -0.2028237, -1.474731, 0, 0, 0, 1, 1,
-1.407823, -1.705631, -3.386428, 0, 0, 0, 1, 1,
-1.407192, 0.758557, -1.332444, 0, 0, 0, 1, 1,
-1.406606, 0.5766743, -1.448508, 0, 0, 0, 1, 1,
-1.404494, 0.5426552, -1.539423, 0, 0, 0, 1, 1,
-1.403543, -1.108668, -0.4948464, 0, 0, 0, 1, 1,
-1.392951, -1.415387, -3.789136, 0, 0, 0, 1, 1,
-1.387808, -0.4278959, -1.45905, 1, 1, 1, 1, 1,
-1.38622, 0.03419143, -0.1379213, 1, 1, 1, 1, 1,
-1.373492, -2.106783, -3.0375, 1, 1, 1, 1, 1,
-1.372023, 1.35748, -1.796596, 1, 1, 1, 1, 1,
-1.371906, -0.6249636, -1.100983, 1, 1, 1, 1, 1,
-1.368689, 0.7247802, -0.7760955, 1, 1, 1, 1, 1,
-1.366297, -0.4771892, -0.4910228, 1, 1, 1, 1, 1,
-1.349505, -2.6604, -2.194997, 1, 1, 1, 1, 1,
-1.34892, 1.912827, -0.5349593, 1, 1, 1, 1, 1,
-1.345576, 0.4740388, 0.4252243, 1, 1, 1, 1, 1,
-1.342319, 0.7706023, -1.069287, 1, 1, 1, 1, 1,
-1.337134, -1.437852, -3.906593, 1, 1, 1, 1, 1,
-1.328478, -0.9066405, -1.697241, 1, 1, 1, 1, 1,
-1.317639, 0.377992, -0.5556713, 1, 1, 1, 1, 1,
-1.314695, -1.109498, -1.820156, 1, 1, 1, 1, 1,
-1.310887, 0.8148407, 0.1210728, 0, 0, 1, 1, 1,
-1.310593, -0.6940191, -1.810213, 1, 0, 0, 1, 1,
-1.297372, -0.05679411, -3.277292, 1, 0, 0, 1, 1,
-1.296306, 0.2020911, -1.742524, 1, 0, 0, 1, 1,
-1.290786, -0.4625709, -1.629604, 1, 0, 0, 1, 1,
-1.286049, 0.4481173, -0.7103885, 1, 0, 0, 1, 1,
-1.276636, -1.153783, -2.993906, 0, 0, 0, 1, 1,
-1.274787, 0.8017853, -1.36521, 0, 0, 0, 1, 1,
-1.257003, -0.5058593, -0.2113114, 0, 0, 0, 1, 1,
-1.25691, 2.677636, -0.8890621, 0, 0, 0, 1, 1,
-1.256459, 0.4488503, -0.2796709, 0, 0, 0, 1, 1,
-1.254755, 0.9898631, -1.482162, 0, 0, 0, 1, 1,
-1.247164, 0.3037752, -1.501196, 0, 0, 0, 1, 1,
-1.247119, 1.163092, -0.5008757, 1, 1, 1, 1, 1,
-1.243025, 0.4377929, -1.470818, 1, 1, 1, 1, 1,
-1.220441, -1.089612, -1.544538, 1, 1, 1, 1, 1,
-1.213735, -0.3929015, -2.88022, 1, 1, 1, 1, 1,
-1.209292, -0.2436394, -0.9873976, 1, 1, 1, 1, 1,
-1.208387, 1.083184, -1.632023, 1, 1, 1, 1, 1,
-1.207439, -0.8098126, -0.7289592, 1, 1, 1, 1, 1,
-1.187536, -0.2419277, -1.364505, 1, 1, 1, 1, 1,
-1.182638, 0.9800537, -2.235345, 1, 1, 1, 1, 1,
-1.179594, 0.1448709, -3.900128, 1, 1, 1, 1, 1,
-1.170824, 0.7925435, -1.988264, 1, 1, 1, 1, 1,
-1.153739, 0.7703212, -2.090432, 1, 1, 1, 1, 1,
-1.150311, -0.7309276, -1.438579, 1, 1, 1, 1, 1,
-1.147711, 1.049308, -1.225907, 1, 1, 1, 1, 1,
-1.137508, 2.130972, 0.4907921, 1, 1, 1, 1, 1,
-1.134898, 0.09549968, -2.664185, 0, 0, 1, 1, 1,
-1.133711, 0.5853219, -0.7605737, 1, 0, 0, 1, 1,
-1.12961, 0.6141034, -1.19558, 1, 0, 0, 1, 1,
-1.127632, 0.5909492, -0.3276465, 1, 0, 0, 1, 1,
-1.125637, 0.2695156, -1.916451, 1, 0, 0, 1, 1,
-1.122169, -0.5091183, -1.118454, 1, 0, 0, 1, 1,
-1.121695, 0.4141977, -0.7862542, 0, 0, 0, 1, 1,
-1.111688, 0.3796714, -0.589231, 0, 0, 0, 1, 1,
-1.108369, 0.3471304, -0.4663889, 0, 0, 0, 1, 1,
-1.107055, -0.9237803, -0.7218411, 0, 0, 0, 1, 1,
-1.105328, 0.2393869, -2.672027, 0, 0, 0, 1, 1,
-1.10007, 0.9073535, -2.250318, 0, 0, 0, 1, 1,
-1.095749, -1.30297, -2.804092, 0, 0, 0, 1, 1,
-1.085359, -0.006064932, -1.442939, 1, 1, 1, 1, 1,
-1.084165, 0.08264024, 0.6911094, 1, 1, 1, 1, 1,
-1.0767, 1.627244, 0.08755258, 1, 1, 1, 1, 1,
-1.071474, 1.690771, -0.7248057, 1, 1, 1, 1, 1,
-1.07013, 0.2916684, -3.079014, 1, 1, 1, 1, 1,
-1.069943, -0.200367, -2.784966, 1, 1, 1, 1, 1,
-1.06559, -0.9409754, -1.985144, 1, 1, 1, 1, 1,
-1.063075, -2.175271, -2.940974, 1, 1, 1, 1, 1,
-1.059134, 1.280012, -0.3040692, 1, 1, 1, 1, 1,
-1.058093, 0.1697373, -0.07708498, 1, 1, 1, 1, 1,
-1.046089, 0.7747312, -2.16622, 1, 1, 1, 1, 1,
-1.045498, 1.506547, -0.4127465, 1, 1, 1, 1, 1,
-1.044414, 1.054499, 0.5737265, 1, 1, 1, 1, 1,
-1.032014, 0.3716188, -0.1166619, 1, 1, 1, 1, 1,
-1.028636, -2.092093, -3.291674, 1, 1, 1, 1, 1,
-1.018266, 1.62189, -1.767981, 0, 0, 1, 1, 1,
-1.018195, -0.5888911, -2.034395, 1, 0, 0, 1, 1,
-1.011868, -0.5128027, -2.622286, 1, 0, 0, 1, 1,
-1.005875, 0.8776828, -1.20167, 1, 0, 0, 1, 1,
-1.00492, -2.163967, -1.380095, 1, 0, 0, 1, 1,
-1.001982, -0.6088645, -1.724327, 1, 0, 0, 1, 1,
-0.9946142, 0.854722, -0.9526005, 0, 0, 0, 1, 1,
-0.9879931, 1.810923, -0.5046127, 0, 0, 0, 1, 1,
-0.9867731, -0.2468121, -1.347962, 0, 0, 0, 1, 1,
-0.98146, -0.8218666, -1.216815, 0, 0, 0, 1, 1,
-0.9778606, 0.4850508, -0.1094071, 0, 0, 0, 1, 1,
-0.9772561, -0.513067, -4.228342, 0, 0, 0, 1, 1,
-0.9699408, -0.7693442, -4.475636, 0, 0, 0, 1, 1,
-0.9686566, 3.268672, -0.6662918, 1, 1, 1, 1, 1,
-0.9670011, 0.8638991, -1.428494, 1, 1, 1, 1, 1,
-0.96281, -0.8483821, -2.369686, 1, 1, 1, 1, 1,
-0.9623276, 0.2084534, -0.6702673, 1, 1, 1, 1, 1,
-0.9562002, -0.9004031, -2.70871, 1, 1, 1, 1, 1,
-0.9490094, 0.9601042, -1.827783, 1, 1, 1, 1, 1,
-0.9484558, 0.4234846, -0.5643835, 1, 1, 1, 1, 1,
-0.928153, 0.7756656, -1.57033, 1, 1, 1, 1, 1,
-0.9265554, 0.02458126, -1.840893, 1, 1, 1, 1, 1,
-0.9261369, 0.7126719, -0.8033801, 1, 1, 1, 1, 1,
-0.923955, -0.08909249, -0.7516737, 1, 1, 1, 1, 1,
-0.9197924, -0.7916971, -1.642201, 1, 1, 1, 1, 1,
-0.9160377, 1.80251, 0.4819258, 1, 1, 1, 1, 1,
-0.9154097, 0.5530652, -1.538172, 1, 1, 1, 1, 1,
-0.91364, -1.718861, -1.614184, 1, 1, 1, 1, 1,
-0.9117079, 1.947054, 0.4253484, 0, 0, 1, 1, 1,
-0.9042923, 0.8987805, -0.3478116, 1, 0, 0, 1, 1,
-0.89084, 1.930505, -0.5362243, 1, 0, 0, 1, 1,
-0.8858775, -2.8494, -4.171427, 1, 0, 0, 1, 1,
-0.8758042, 0.02430353, -2.204252, 1, 0, 0, 1, 1,
-0.8721878, -0.06993885, -1.017916, 1, 0, 0, 1, 1,
-0.8650492, 0.6972759, -0.06125408, 0, 0, 0, 1, 1,
-0.864554, -2.177988, -3.164902, 0, 0, 0, 1, 1,
-0.8621768, 0.5232638, -1.572045, 0, 0, 0, 1, 1,
-0.8595482, 0.6673704, -0.7949846, 0, 0, 0, 1, 1,
-0.8571807, 0.6578203, -0.7676736, 0, 0, 0, 1, 1,
-0.8571357, 0.7304169, -0.5209373, 0, 0, 0, 1, 1,
-0.849906, 0.09962274, -1.557225, 0, 0, 0, 1, 1,
-0.842297, 0.6546437, -0.836536, 1, 1, 1, 1, 1,
-0.830866, -1.105666, -1.483981, 1, 1, 1, 1, 1,
-0.8254516, -0.8300471, -1.047264, 1, 1, 1, 1, 1,
-0.8243683, 0.3928448, -1.903949, 1, 1, 1, 1, 1,
-0.8185176, -0.7156337, -2.222693, 1, 1, 1, 1, 1,
-0.8181909, 0.2438778, -2.248403, 1, 1, 1, 1, 1,
-0.8131436, -3.163877, -3.061633, 1, 1, 1, 1, 1,
-0.8105076, 0.4079744, -1.726105, 1, 1, 1, 1, 1,
-0.809614, 1.058459, -1.089954, 1, 1, 1, 1, 1,
-0.8095819, -0.6487805, -1.933272, 1, 1, 1, 1, 1,
-0.8012692, 0.260038, -0.1722251, 1, 1, 1, 1, 1,
-0.7998997, -0.3576158, -2.808381, 1, 1, 1, 1, 1,
-0.7975796, 2.376, 0.002186613, 1, 1, 1, 1, 1,
-0.7962777, 0.6944253, -0.6918616, 1, 1, 1, 1, 1,
-0.7859813, -1.228418, -2.527989, 1, 1, 1, 1, 1,
-0.7839054, -0.3742364, -3.616074, 0, 0, 1, 1, 1,
-0.7777985, 0.01808893, -0.9579752, 1, 0, 0, 1, 1,
-0.777334, -0.3639631, -2.302568, 1, 0, 0, 1, 1,
-0.7734685, 0.65422, -1.032322, 1, 0, 0, 1, 1,
-0.7733744, 0.8100337, 0.222358, 1, 0, 0, 1, 1,
-0.7718118, -0.2928493, -2.317936, 1, 0, 0, 1, 1,
-0.76798, -2.206821, -2.691747, 0, 0, 0, 1, 1,
-0.7636514, 0.5704978, -1.312441, 0, 0, 0, 1, 1,
-0.7613707, -0.14139, 0.154025, 0, 0, 0, 1, 1,
-0.7509228, -0.4784984, -3.71397, 0, 0, 0, 1, 1,
-0.7484291, 0.7898155, -0.5308442, 0, 0, 0, 1, 1,
-0.7461776, -0.7118965, -3.209453, 0, 0, 0, 1, 1,
-0.7433922, 1.313233, 0.034241, 0, 0, 0, 1, 1,
-0.7391669, 0.7658097, -0.1419223, 1, 1, 1, 1, 1,
-0.738346, 0.67443, -2.266102, 1, 1, 1, 1, 1,
-0.7374221, -0.8388163, -3.134035, 1, 1, 1, 1, 1,
-0.7371615, 0.4657549, -2.132214, 1, 1, 1, 1, 1,
-0.7365374, 0.2218988, -2.685571, 1, 1, 1, 1, 1,
-0.7358082, -0.7546842, -1.199661, 1, 1, 1, 1, 1,
-0.7339333, -0.0712802, -2.879656, 1, 1, 1, 1, 1,
-0.7311694, 0.9413462, -3.079786, 1, 1, 1, 1, 1,
-0.7309619, -1.850947, -1.968553, 1, 1, 1, 1, 1,
-0.7295535, 0.2511303, -1.932638, 1, 1, 1, 1, 1,
-0.7264688, -1.136244, -2.739932, 1, 1, 1, 1, 1,
-0.7230653, -0.207946, -0.04421244, 1, 1, 1, 1, 1,
-0.71468, -1.299876, -3.225325, 1, 1, 1, 1, 1,
-0.708492, 1.238997, -0.3327925, 1, 1, 1, 1, 1,
-0.7084326, 0.2311182, -1.785211, 1, 1, 1, 1, 1,
-0.7071731, 0.6481022, -0.4218752, 0, 0, 1, 1, 1,
-0.7030177, -0.4436104, -2.664294, 1, 0, 0, 1, 1,
-0.692037, 0.3968811, -0.6371368, 1, 0, 0, 1, 1,
-0.6916129, -1.288879, -1.174325, 1, 0, 0, 1, 1,
-0.6890512, -0.4510908, -1.232858, 1, 0, 0, 1, 1,
-0.6818428, 0.1573025, -2.036856, 1, 0, 0, 1, 1,
-0.6762974, -0.1619166, -2.080169, 0, 0, 0, 1, 1,
-0.6733691, -0.06034404, -1.348401, 0, 0, 0, 1, 1,
-0.671585, 0.7426398, 0.866549, 0, 0, 0, 1, 1,
-0.6701308, -0.2127022, -2.092246, 0, 0, 0, 1, 1,
-0.6634685, 0.8242586, -2.03329, 0, 0, 0, 1, 1,
-0.6592097, -0.452177, -2.186732, 0, 0, 0, 1, 1,
-0.6505249, 0.2885698, -1.041969, 0, 0, 0, 1, 1,
-0.6414889, -1.601032, -4.035744, 1, 1, 1, 1, 1,
-0.6382941, -0.953871, -3.59627, 1, 1, 1, 1, 1,
-0.6360273, -0.07735971, -1.842044, 1, 1, 1, 1, 1,
-0.6357147, 2.016791, 0.02101975, 1, 1, 1, 1, 1,
-0.634331, -0.7630202, -0.7918124, 1, 1, 1, 1, 1,
-0.6328725, 0.650824, -1.573577, 1, 1, 1, 1, 1,
-0.630989, -2.548634, -2.287494, 1, 1, 1, 1, 1,
-0.6286795, -0.3427505, -2.303427, 1, 1, 1, 1, 1,
-0.6286365, -0.9344921, -1.797338, 1, 1, 1, 1, 1,
-0.6245121, -0.6853858, -0.8763705, 1, 1, 1, 1, 1,
-0.6158786, -1.041166, -3.505053, 1, 1, 1, 1, 1,
-0.61382, 1.408003, -0.9843463, 1, 1, 1, 1, 1,
-0.611798, 0.7988066, -1.853159, 1, 1, 1, 1, 1,
-0.6115945, 1.232152, -0.5665659, 1, 1, 1, 1, 1,
-0.6038262, 1.942121, -0.6003027, 1, 1, 1, 1, 1,
-0.6021706, -0.7934011, -2.140442, 0, 0, 1, 1, 1,
-0.6003655, 1.087122, 1.389635, 1, 0, 0, 1, 1,
-0.6001619, -0.4965385, -2.06401, 1, 0, 0, 1, 1,
-0.5999413, -0.9710442, -2.456383, 1, 0, 0, 1, 1,
-0.5916677, -0.04271185, -0.9657624, 1, 0, 0, 1, 1,
-0.5903199, -1.142724, -3.232015, 1, 0, 0, 1, 1,
-0.586531, -1.083096, -3.248204, 0, 0, 0, 1, 1,
-0.5803281, 0.1190162, 0.2852153, 0, 0, 0, 1, 1,
-0.5773162, 0.557526, -1.22685, 0, 0, 0, 1, 1,
-0.5744396, 0.8588374, 1.007451, 0, 0, 0, 1, 1,
-0.5690178, -0.6175534, -1.148671, 0, 0, 0, 1, 1,
-0.5678425, 0.2514239, -2.161151, 0, 0, 0, 1, 1,
-0.5667937, -0.6549729, -2.637344, 0, 0, 0, 1, 1,
-0.557573, -0.5081296, -3.034906, 1, 1, 1, 1, 1,
-0.5575536, 0.893807, 0.3359631, 1, 1, 1, 1, 1,
-0.5572088, 0.3121758, 0.4724112, 1, 1, 1, 1, 1,
-0.5565826, 0.4987466, -1.649456, 1, 1, 1, 1, 1,
-0.5537012, -0.933367, -1.84056, 1, 1, 1, 1, 1,
-0.5535312, 0.2878254, -1.902864, 1, 1, 1, 1, 1,
-0.5438927, -0.7642693, -2.928617, 1, 1, 1, 1, 1,
-0.5386846, -2.119801, -3.724632, 1, 1, 1, 1, 1,
-0.5386059, 1.451298, -1.383047, 1, 1, 1, 1, 1,
-0.5366178, -0.8677079, -1.37054, 1, 1, 1, 1, 1,
-0.5337585, 0.8359436, -0.1207799, 1, 1, 1, 1, 1,
-0.5297075, -0.182302, -2.479136, 1, 1, 1, 1, 1,
-0.5263656, -0.6015211, -1.285099, 1, 1, 1, 1, 1,
-0.5238245, 0.629849, -1.014167, 1, 1, 1, 1, 1,
-0.5233064, 2.157838, -0.2787293, 1, 1, 1, 1, 1,
-0.5199333, 0.8950677, -1.659667, 0, 0, 1, 1, 1,
-0.519913, 0.9148137, 0.3473177, 1, 0, 0, 1, 1,
-0.5184395, -0.2898553, -1.405625, 1, 0, 0, 1, 1,
-0.5169451, 0.1976249, -2.323611, 1, 0, 0, 1, 1,
-0.514976, 1.71817, -0.4498985, 1, 0, 0, 1, 1,
-0.5119841, 1.132843, -0.5256334, 1, 0, 0, 1, 1,
-0.5090814, -0.2853217, -3.710553, 0, 0, 0, 1, 1,
-0.5066631, 0.246357, -1.441684, 0, 0, 0, 1, 1,
-0.5062162, -0.4106678, -1.464736, 0, 0, 0, 1, 1,
-0.5058023, 0.02296997, -0.2267305, 0, 0, 0, 1, 1,
-0.5054675, 0.392357, -1.615094, 0, 0, 0, 1, 1,
-0.5031083, 0.77175, -0.4907026, 0, 0, 0, 1, 1,
-0.5014535, -1.55389, -1.083901, 0, 0, 0, 1, 1,
-0.4888265, -1.129641, -4.121144, 1, 1, 1, 1, 1,
-0.4859475, -0.6979717, -2.53488, 1, 1, 1, 1, 1,
-0.4837604, 0.3837549, -1.196685, 1, 1, 1, 1, 1,
-0.4827848, 1.317059, 0.6558473, 1, 1, 1, 1, 1,
-0.4819191, 1.16628, -0.01153443, 1, 1, 1, 1, 1,
-0.4752535, 0.1397929, -1.007847, 1, 1, 1, 1, 1,
-0.4739079, -0.7540056, -2.323393, 1, 1, 1, 1, 1,
-0.4686342, -0.2686549, -1.981783, 1, 1, 1, 1, 1,
-0.4680114, 1.435266, 0.5392192, 1, 1, 1, 1, 1,
-0.4630801, -0.0640473, -2.159192, 1, 1, 1, 1, 1,
-0.4534007, -1.689133, -2.514049, 1, 1, 1, 1, 1,
-0.4510804, 0.4854316, -1.953219, 1, 1, 1, 1, 1,
-0.4507472, -1.005201, -2.973053, 1, 1, 1, 1, 1,
-0.4475039, 0.6637924, -0.2776173, 1, 1, 1, 1, 1,
-0.4457971, -1.51383, -4.008969, 1, 1, 1, 1, 1,
-0.4440347, 1.181691, -2.280921, 0, 0, 1, 1, 1,
-0.4386937, 0.1605815, -1.126087, 1, 0, 0, 1, 1,
-0.4386854, -0.5208417, -3.183322, 1, 0, 0, 1, 1,
-0.4374914, 0.2717705, 0.9190579, 1, 0, 0, 1, 1,
-0.4369837, -0.9052803, -1.272486, 1, 0, 0, 1, 1,
-0.4352096, -1.55114, -3.060597, 1, 0, 0, 1, 1,
-0.4340294, 0.2275854, -0.3344256, 0, 0, 0, 1, 1,
-0.4313383, -0.4476063, -2.510384, 0, 0, 0, 1, 1,
-0.4312763, -0.3816889, -1.685251, 0, 0, 0, 1, 1,
-0.426318, -0.717428, -1.503907, 0, 0, 0, 1, 1,
-0.4249795, 0.6441433, -2.550099, 0, 0, 0, 1, 1,
-0.4202243, 1.192287, 0.0967261, 0, 0, 0, 1, 1,
-0.4193318, 0.2655956, -0.1532024, 0, 0, 0, 1, 1,
-0.4185155, 0.3956102, -0.4527633, 1, 1, 1, 1, 1,
-0.4185033, 1.229201, 0.4591118, 1, 1, 1, 1, 1,
-0.4165667, -0.7758607, -1.225682, 1, 1, 1, 1, 1,
-0.4101714, 0.5169058, -0.3403304, 1, 1, 1, 1, 1,
-0.4081498, -0.3044653, -2.169116, 1, 1, 1, 1, 1,
-0.4004056, -1.043943, -3.914785, 1, 1, 1, 1, 1,
-0.3968331, -0.1256704, -1.732816, 1, 1, 1, 1, 1,
-0.3946157, 0.7943647, -1.407234, 1, 1, 1, 1, 1,
-0.3919695, -0.371096, -3.191311, 1, 1, 1, 1, 1,
-0.3919495, 1.722142, 0.2632922, 1, 1, 1, 1, 1,
-0.3903368, 0.2454713, -0.9802409, 1, 1, 1, 1, 1,
-0.3872717, 1.032539, -0.2781425, 1, 1, 1, 1, 1,
-0.3856474, 1.375941, -0.4016756, 1, 1, 1, 1, 1,
-0.3851865, 1.349915, -0.1315448, 1, 1, 1, 1, 1,
-0.3849134, -1.96851, -3.395062, 1, 1, 1, 1, 1,
-0.3846891, 2.499008, -0.4608102, 0, 0, 1, 1, 1,
-0.3808472, 1.191619, -0.3188988, 1, 0, 0, 1, 1,
-0.3806929, 0.4091871, 0.00045583, 1, 0, 0, 1, 1,
-0.3805213, -1.416164, -1.85663, 1, 0, 0, 1, 1,
-0.380243, 0.765456, -0.3349465, 1, 0, 0, 1, 1,
-0.3774928, 0.7197567, 0.2550447, 1, 0, 0, 1, 1,
-0.3769756, 0.8510807, -0.9784853, 0, 0, 0, 1, 1,
-0.3695116, 0.593784, -0.3714547, 0, 0, 0, 1, 1,
-0.3693628, -0.1750552, -0.3538677, 0, 0, 0, 1, 1,
-0.3670724, -0.3825578, -3.743762, 0, 0, 0, 1, 1,
-0.3517526, 0.3826155, -2.468904, 0, 0, 0, 1, 1,
-0.3499503, 0.6697122, -1.459677, 0, 0, 0, 1, 1,
-0.3446717, -0.3555976, -2.187423, 0, 0, 0, 1, 1,
-0.3425589, -1.194536, -3.381387, 1, 1, 1, 1, 1,
-0.339198, 1.998026, 0.2184571, 1, 1, 1, 1, 1,
-0.3377096, -0.3244106, -2.613427, 1, 1, 1, 1, 1,
-0.3222043, 1.485633, 0.4424394, 1, 1, 1, 1, 1,
-0.3176029, 0.9314613, -0.3539026, 1, 1, 1, 1, 1,
-0.3164609, 0.2319276, -2.148105, 1, 1, 1, 1, 1,
-0.3149152, 1.992485, 0.2739963, 1, 1, 1, 1, 1,
-0.3037936, 0.4059903, 0.3413778, 1, 1, 1, 1, 1,
-0.303572, 0.2959234, -1.722942, 1, 1, 1, 1, 1,
-0.2975792, -2.089741, -3.11672, 1, 1, 1, 1, 1,
-0.2943133, -0.04989461, -2.064357, 1, 1, 1, 1, 1,
-0.2915483, 0.2763344, -1.164749, 1, 1, 1, 1, 1,
-0.2910147, 0.3163781, -0.8293437, 1, 1, 1, 1, 1,
-0.290282, 0.5022118, -1.584803, 1, 1, 1, 1, 1,
-0.2886097, -0.09574642, -2.143143, 1, 1, 1, 1, 1,
-0.2882492, 0.7200097, -2.007199, 0, 0, 1, 1, 1,
-0.2854458, -1.8331, -0.5459835, 1, 0, 0, 1, 1,
-0.2840814, -0.9698358, -1.82037, 1, 0, 0, 1, 1,
-0.2839526, -1.456303, -4.196521, 1, 0, 0, 1, 1,
-0.2809487, 1.334938, -1.734109, 1, 0, 0, 1, 1,
-0.2782836, -0.1567025, -0.4583006, 1, 0, 0, 1, 1,
-0.2732096, 0.8838475, -0.9486821, 0, 0, 0, 1, 1,
-0.2700642, 0.2226817, -0.4490146, 0, 0, 0, 1, 1,
-0.2699777, 0.6862485, 0.3604662, 0, 0, 0, 1, 1,
-0.2693756, 1.879725, 1.395242, 0, 0, 0, 1, 1,
-0.269092, 0.8309981, 1.104305, 0, 0, 0, 1, 1,
-0.263221, 0.3741397, -1.418601, 0, 0, 0, 1, 1,
-0.2597038, -1.37374, -2.477488, 0, 0, 0, 1, 1,
-0.2561475, 2.031274, 0.9049954, 1, 1, 1, 1, 1,
-0.2553364, 0.3927419, -1.674008, 1, 1, 1, 1, 1,
-0.2539384, -1.218088, -2.784761, 1, 1, 1, 1, 1,
-0.2530466, 0.5349864, -1.222296, 1, 1, 1, 1, 1,
-0.2523822, -0.409314, -3.533522, 1, 1, 1, 1, 1,
-0.2492201, -0.002651808, -3.128081, 1, 1, 1, 1, 1,
-0.2424565, 0.8216335, -1.567153, 1, 1, 1, 1, 1,
-0.2418155, 0.3736291, 0.154916, 1, 1, 1, 1, 1,
-0.240441, 0.05676476, -1.223227, 1, 1, 1, 1, 1,
-0.2387437, 0.3482154, -0.1110023, 1, 1, 1, 1, 1,
-0.2351013, -0.6227336, -2.140168, 1, 1, 1, 1, 1,
-0.234123, 0.03826185, -1.263097, 1, 1, 1, 1, 1,
-0.2296981, 0.4778787, -0.03323597, 1, 1, 1, 1, 1,
-0.2281219, 0.800146, 0.6620693, 1, 1, 1, 1, 1,
-0.2273443, -0.9258492, -2.444789, 1, 1, 1, 1, 1,
-0.2255047, 1.356135, 1.065273, 0, 0, 1, 1, 1,
-0.2223889, 0.2497071, -0.8978038, 1, 0, 0, 1, 1,
-0.2169909, -0.2325288, -4.406324, 1, 0, 0, 1, 1,
-0.2162114, -0.3125041, -2.435132, 1, 0, 0, 1, 1,
-0.2153415, -0.3014205, -3.610763, 1, 0, 0, 1, 1,
-0.2152251, -0.239351, -4.071431, 1, 0, 0, 1, 1,
-0.2126261, -0.5681151, -2.109282, 0, 0, 0, 1, 1,
-0.2105677, 0.4209406, 0.8606068, 0, 0, 0, 1, 1,
-0.1950927, -0.3176895, -2.703085, 0, 0, 0, 1, 1,
-0.1934139, -0.1872436, -1.717325, 0, 0, 0, 1, 1,
-0.1923265, -0.6004601, -2.610996, 0, 0, 0, 1, 1,
-0.1917322, 1.883097, -0.3751685, 0, 0, 0, 1, 1,
-0.1889812, -0.4771532, -1.643906, 0, 0, 0, 1, 1,
-0.1869781, 0.4123306, 0.5741397, 1, 1, 1, 1, 1,
-0.1861329, -0.2315097, -1.927859, 1, 1, 1, 1, 1,
-0.1858643, -1.329349, -3.649074, 1, 1, 1, 1, 1,
-0.1852906, -0.1617566, -1.60946, 1, 1, 1, 1, 1,
-0.1850175, -0.1503725, -3.965954, 1, 1, 1, 1, 1,
-0.1833081, -0.9380738, -2.240635, 1, 1, 1, 1, 1,
-0.182361, -0.5707887, -1.846726, 1, 1, 1, 1, 1,
-0.1809587, 0.6132461, 1.227299, 1, 1, 1, 1, 1,
-0.179383, -1.491498, -3.142032, 1, 1, 1, 1, 1,
-0.1790938, 1.198267, 1.005792, 1, 1, 1, 1, 1,
-0.1784602, 1.180375, 1.550032, 1, 1, 1, 1, 1,
-0.1780099, 0.9916051, -0.6507869, 1, 1, 1, 1, 1,
-0.1751253, -0.6170558, -2.325877, 1, 1, 1, 1, 1,
-0.174975, 0.1259236, 0.3881206, 1, 1, 1, 1, 1,
-0.1746518, 0.4790753, -0.7718987, 1, 1, 1, 1, 1,
-0.1723075, 1.265413, 0.9139215, 0, 0, 1, 1, 1,
-0.1602946, 1.49588, -0.3683323, 1, 0, 0, 1, 1,
-0.1584909, 1.382107, -0.1471224, 1, 0, 0, 1, 1,
-0.1506549, 1.002788, -0.3384995, 1, 0, 0, 1, 1,
-0.1492348, -0.4424506, -2.042757, 1, 0, 0, 1, 1,
-0.1452537, -1.307713, -3.061852, 1, 0, 0, 1, 1,
-0.1448413, 1.238893, 0.001956388, 0, 0, 0, 1, 1,
-0.1354722, -1.275578, -3.531963, 0, 0, 0, 1, 1,
-0.1346386, 1.666717, -1.011505, 0, 0, 0, 1, 1,
-0.133482, 1.30878, 1.64986, 0, 0, 0, 1, 1,
-0.1320973, -0.4342701, -1.92707, 0, 0, 0, 1, 1,
-0.1310424, -0.2241163, -2.683638, 0, 0, 0, 1, 1,
-0.1307047, -2.707874, -2.671566, 0, 0, 0, 1, 1,
-0.1286065, -0.6943203, -3.093307, 1, 1, 1, 1, 1,
-0.1267395, -0.809727, -1.981429, 1, 1, 1, 1, 1,
-0.1255622, -0.08772197, -2.22335, 1, 1, 1, 1, 1,
-0.1252094, -0.132733, -2.222887, 1, 1, 1, 1, 1,
-0.1240821, 0.6121356, 0.09670912, 1, 1, 1, 1, 1,
-0.1227441, -1.26764, -3.332388, 1, 1, 1, 1, 1,
-0.118175, 2.77902, 0.273792, 1, 1, 1, 1, 1,
-0.1135754, 0.2014043, -0.08826539, 1, 1, 1, 1, 1,
-0.1112788, -0.181982, -1.880032, 1, 1, 1, 1, 1,
-0.1100161, -0.5886468, -0.692013, 1, 1, 1, 1, 1,
-0.1098178, -0.8547455, -0.9962856, 1, 1, 1, 1, 1,
-0.1067941, 0.2565117, -1.188968, 1, 1, 1, 1, 1,
-0.104783, -1.21446, -2.577704, 1, 1, 1, 1, 1,
-0.1039536, 0.2078781, -1.905413, 1, 1, 1, 1, 1,
-0.1003544, 0.6709715, -0.8844711, 1, 1, 1, 1, 1,
-0.09888228, -0.5394179, -2.73803, 0, 0, 1, 1, 1,
-0.09666706, -1.533722, -2.332348, 1, 0, 0, 1, 1,
-0.09532408, -0.7356975, -2.121983, 1, 0, 0, 1, 1,
-0.09164406, 0.5569686, 1.274047, 1, 0, 0, 1, 1,
-0.0901524, -0.9410203, -3.405343, 1, 0, 0, 1, 1,
-0.08743834, 0.5167601, 0.5040682, 1, 0, 0, 1, 1,
-0.08717927, 1.112882, -0.4739587, 0, 0, 0, 1, 1,
-0.08591376, 0.3698201, -0.5797133, 0, 0, 0, 1, 1,
-0.08403027, -2.642342, -3.514554, 0, 0, 0, 1, 1,
-0.08330669, -0.6740381, -1.921858, 0, 0, 0, 1, 1,
-0.083261, -0.6522743, -3.064607, 0, 0, 0, 1, 1,
-0.0791593, -0.835606, -3.825915, 0, 0, 0, 1, 1,
-0.07612152, -0.5803304, -2.436588, 0, 0, 0, 1, 1,
-0.0720472, 0.7739408, 0.915301, 1, 1, 1, 1, 1,
-0.07170714, 0.2427032, -0.2842639, 1, 1, 1, 1, 1,
-0.07115783, -0.5889001, -5.265915, 1, 1, 1, 1, 1,
-0.07066893, -1.596374, -1.692588, 1, 1, 1, 1, 1,
-0.06454998, 0.08236096, -2.712496, 1, 1, 1, 1, 1,
-0.05642537, 0.4156179, -0.9955252, 1, 1, 1, 1, 1,
-0.05207178, 1.934482, -0.5830845, 1, 1, 1, 1, 1,
-0.0514958, 1.194608, 1.261682, 1, 1, 1, 1, 1,
-0.04968178, -0.9686226, -3.262132, 1, 1, 1, 1, 1,
-0.03829677, -0.2478541, -4.635014, 1, 1, 1, 1, 1,
-0.03719971, 0.6181527, -0.3478231, 1, 1, 1, 1, 1,
-0.03591638, -0.9918745, -2.004455, 1, 1, 1, 1, 1,
-0.02980129, -0.4284045, -1.550185, 1, 1, 1, 1, 1,
-0.02954877, 0.3995669, -0.5550498, 1, 1, 1, 1, 1,
-0.0235024, -0.6169176, -3.980828, 1, 1, 1, 1, 1,
-0.02224315, 0.5317166, 0.1549402, 0, 0, 1, 1, 1,
-0.02021288, 1.325211, -0.9956002, 1, 0, 0, 1, 1,
-0.01838818, -1.375174, -3.69957, 1, 0, 0, 1, 1,
-0.01768573, -0.3720676, -2.002997, 1, 0, 0, 1, 1,
-0.01753105, 0.6192598, 0.427589, 1, 0, 0, 1, 1,
-0.0169925, -0.7447357, -3.267432, 1, 0, 0, 1, 1,
-0.01618218, 0.07957571, 1.044958, 0, 0, 0, 1, 1,
-0.0145587, -0.4154838, -3.062391, 0, 0, 0, 1, 1,
-0.01139427, 0.7033883, 0.2183326, 0, 0, 0, 1, 1,
-0.0105891, 1.228215, 1.088529, 0, 0, 0, 1, 1,
-0.007801095, -0.1387005, -3.35556, 0, 0, 0, 1, 1,
-0.006183766, 0.9802736, -2.080844, 0, 0, 0, 1, 1,
-0.006009641, 0.8789651, 0.694486, 0, 0, 0, 1, 1,
-0.001988461, 1.376614, -0.7886322, 1, 1, 1, 1, 1,
-0.0002846066, -0.20829, -4.818489, 1, 1, 1, 1, 1,
0.002349781, -0.2900546, 5.636517, 1, 1, 1, 1, 1,
0.00787592, -1.686267, 3.293302, 1, 1, 1, 1, 1,
0.01061365, 1.726421, 0.06683661, 1, 1, 1, 1, 1,
0.01073402, 0.1421487, 0.330561, 1, 1, 1, 1, 1,
0.01130857, -0.1994983, 3.613287, 1, 1, 1, 1, 1,
0.01148179, 0.5997922, -0.5683336, 1, 1, 1, 1, 1,
0.01199766, -1.760734, 0.7099259, 1, 1, 1, 1, 1,
0.01269418, 0.4600539, 0.04921399, 1, 1, 1, 1, 1,
0.01623847, 0.08660023, 1.190944, 1, 1, 1, 1, 1,
0.02658103, -1.599482, 4.149477, 1, 1, 1, 1, 1,
0.03227685, 0.05422745, -0.831183, 1, 1, 1, 1, 1,
0.03475461, 1.696575, 2.020436, 1, 1, 1, 1, 1,
0.03838382, -1.215347, 3.667129, 1, 1, 1, 1, 1,
0.04131378, 0.5205401, 0.08177989, 0, 0, 1, 1, 1,
0.04222962, -1.597959, 1.627847, 1, 0, 0, 1, 1,
0.04483679, 1.776307, 0.5574545, 1, 0, 0, 1, 1,
0.0451842, 1.303988, -0.08197097, 1, 0, 0, 1, 1,
0.04860219, 0.5410953, 0.7757134, 1, 0, 0, 1, 1,
0.04920986, 1.136348, 0.004082566, 1, 0, 0, 1, 1,
0.05158739, -2.352701, 3.051382, 0, 0, 0, 1, 1,
0.05274402, 0.4010178, -0.2816701, 0, 0, 0, 1, 1,
0.05353089, 0.135773, -0.2271384, 0, 0, 0, 1, 1,
0.05705051, -0.02088245, 1.460756, 0, 0, 0, 1, 1,
0.0572527, -0.05516142, 2.635686, 0, 0, 0, 1, 1,
0.06210204, 0.5834432, 1.08492, 0, 0, 0, 1, 1,
0.06294388, 1.259605, -0.04242631, 0, 0, 0, 1, 1,
0.06322187, -0.1761615, 2.822623, 1, 1, 1, 1, 1,
0.06497882, -0.2804689, 3.553381, 1, 1, 1, 1, 1,
0.06919424, 0.6888282, 0.6688301, 1, 1, 1, 1, 1,
0.06992315, 1.051161, 0.2173497, 1, 1, 1, 1, 1,
0.07012635, -0.3958065, 4.555597, 1, 1, 1, 1, 1,
0.0702493, -1.047909, 3.262805, 1, 1, 1, 1, 1,
0.07605672, 0.8631523, -0.03238861, 1, 1, 1, 1, 1,
0.0769806, -0.4021778, 1.976507, 1, 1, 1, 1, 1,
0.07742464, -0.5415694, 3.526901, 1, 1, 1, 1, 1,
0.07880732, 0.01299711, 3.149694, 1, 1, 1, 1, 1,
0.07993006, -0.4132375, 2.381181, 1, 1, 1, 1, 1,
0.08947317, -1.404374, 4.242351, 1, 1, 1, 1, 1,
0.09021399, 2.523546, 1.091044, 1, 1, 1, 1, 1,
0.09128737, 1.919031, 1.331296, 1, 1, 1, 1, 1,
0.09792009, 2.275698, 0.1744153, 1, 1, 1, 1, 1,
0.1004591, 1.037594, -0.6159695, 0, 0, 1, 1, 1,
0.1006843, -0.9287919, 4.490195, 1, 0, 0, 1, 1,
0.1049414, -0.1568959, 2.415383, 1, 0, 0, 1, 1,
0.1053235, -0.5402154, 3.514907, 1, 0, 0, 1, 1,
0.1072435, -2.331016, 2.391706, 1, 0, 0, 1, 1,
0.1073862, -1.831645, 2.982549, 1, 0, 0, 1, 1,
0.1082, -0.1267736, 1.252518, 0, 0, 0, 1, 1,
0.1108408, -0.9216039, 3.57697, 0, 0, 0, 1, 1,
0.1113004, 1.413785, 0.5302994, 0, 0, 0, 1, 1,
0.111937, -0.3967122, 1.542909, 0, 0, 0, 1, 1,
0.1157205, 1.052885, -0.01384774, 0, 0, 0, 1, 1,
0.1162314, 0.7014319, 1.714222, 0, 0, 0, 1, 1,
0.1174295, -0.2610138, 0.4184593, 0, 0, 0, 1, 1,
0.1179296, 1.571418, -0.5158935, 1, 1, 1, 1, 1,
0.1222304, -0.6079026, 3.914812, 1, 1, 1, 1, 1,
0.123141, 1.029798, 1.716591, 1, 1, 1, 1, 1,
0.1267796, -1.039227, 2.470851, 1, 1, 1, 1, 1,
0.1269033, -1.762547, 2.808621, 1, 1, 1, 1, 1,
0.1273138, -0.09505438, 3.278283, 1, 1, 1, 1, 1,
0.1291396, -2.337668, 2.213561, 1, 1, 1, 1, 1,
0.1367494, 0.9497664, 0.440611, 1, 1, 1, 1, 1,
0.1374749, 0.4729056, 1.761691, 1, 1, 1, 1, 1,
0.1378061, -0.2685967, 3.730458, 1, 1, 1, 1, 1,
0.1379218, -0.4444942, 3.656104, 1, 1, 1, 1, 1,
0.1386812, 0.9507531, 1.077624, 1, 1, 1, 1, 1,
0.1406251, -0.8250384, 2.973928, 1, 1, 1, 1, 1,
0.1442332, 0.04449866, 0.6561045, 1, 1, 1, 1, 1,
0.1466331, -1.428331, 2.943708, 1, 1, 1, 1, 1,
0.1480619, 0.2912179, 0.1171721, 0, 0, 1, 1, 1,
0.148884, 0.5950335, 1.059725, 1, 0, 0, 1, 1,
0.1531555, 2.182858, -0.4402197, 1, 0, 0, 1, 1,
0.1545005, 0.6009017, -0.3837312, 1, 0, 0, 1, 1,
0.1602823, -0.2032488, 3.27653, 1, 0, 0, 1, 1,
0.160855, -1.664307, 2.255697, 1, 0, 0, 1, 1,
0.1611839, -1.275531, 3.705603, 0, 0, 0, 1, 1,
0.16324, -0.5065409, 2.431044, 0, 0, 0, 1, 1,
0.1638089, 0.9675324, 0.09031285, 0, 0, 0, 1, 1,
0.166654, -0.3350916, 2.321805, 0, 0, 0, 1, 1,
0.1694665, -0.4895208, 4.2332, 0, 0, 0, 1, 1,
0.1727439, -0.4569335, 2.922048, 0, 0, 0, 1, 1,
0.1751786, -0.2276543, 2.124288, 0, 0, 0, 1, 1,
0.1753718, 2.28255, 0.5831817, 1, 1, 1, 1, 1,
0.177464, 0.4547181, 1.123536, 1, 1, 1, 1, 1,
0.1804985, -0.7324326, 3.389247, 1, 1, 1, 1, 1,
0.1835924, -0.691148, 2.74316, 1, 1, 1, 1, 1,
0.1874561, 0.4429584, 1.012675, 1, 1, 1, 1, 1,
0.1921751, -1.020331, 1.445213, 1, 1, 1, 1, 1,
0.1931103, 0.7059858, 0.7924939, 1, 1, 1, 1, 1,
0.1948355, -0.6463649, 1.975443, 1, 1, 1, 1, 1,
0.1962026, -0.3479967, 5.012877, 1, 1, 1, 1, 1,
0.1966511, -0.9551718, 1.528338, 1, 1, 1, 1, 1,
0.1974126, 0.2498293, 1.439021, 1, 1, 1, 1, 1,
0.2013108, 0.5720014, 1.142944, 1, 1, 1, 1, 1,
0.2044359, 0.02913104, 2.800477, 1, 1, 1, 1, 1,
0.205648, -0.3113204, 2.638314, 1, 1, 1, 1, 1,
0.2075384, -0.6818554, 2.439495, 1, 1, 1, 1, 1,
0.2114178, -0.354453, 3.342251, 0, 0, 1, 1, 1,
0.2115111, 0.2990711, -1.119144, 1, 0, 0, 1, 1,
0.2122919, -0.263132, 3.077353, 1, 0, 0, 1, 1,
0.213707, -1.68384, 2.430205, 1, 0, 0, 1, 1,
0.214039, 1.237336, 1.594318, 1, 0, 0, 1, 1,
0.216008, 0.6483377, 1.027308, 1, 0, 0, 1, 1,
0.2175174, 0.04917779, 2.09585, 0, 0, 0, 1, 1,
0.2176494, 0.4514276, 0.0990087, 0, 0, 0, 1, 1,
0.2178984, -0.7769496, 1.551952, 0, 0, 0, 1, 1,
0.2207263, 0.3326939, -0.4324672, 0, 0, 0, 1, 1,
0.2210156, 0.5781135, 0.4160376, 0, 0, 0, 1, 1,
0.2305154, -1.519622, 1.674266, 0, 0, 0, 1, 1,
0.2311409, 0.5019472, -1.586776, 0, 0, 0, 1, 1,
0.233483, 1.382631, -0.3691612, 1, 1, 1, 1, 1,
0.2357225, 0.501017, 0.6250305, 1, 1, 1, 1, 1,
0.2397404, 0.2828636, 1.834554, 1, 1, 1, 1, 1,
0.2397851, -0.04445319, 2.569666, 1, 1, 1, 1, 1,
0.2401267, 1.105663, 0.9752278, 1, 1, 1, 1, 1,
0.2414475, 0.3584187, 2.551523, 1, 1, 1, 1, 1,
0.241672, -0.9440414, 1.802485, 1, 1, 1, 1, 1,
0.2422138, 0.6909191, 0.506794, 1, 1, 1, 1, 1,
0.2432838, -0.003257419, 0.2160348, 1, 1, 1, 1, 1,
0.2467992, 0.0396437, 1.139356, 1, 1, 1, 1, 1,
0.2483602, -0.3056743, 1.181952, 1, 1, 1, 1, 1,
0.2507247, 0.1642008, 0.270104, 1, 1, 1, 1, 1,
0.2516491, 0.0375107, 1.67597, 1, 1, 1, 1, 1,
0.2535176, -0.2474251, 3.372817, 1, 1, 1, 1, 1,
0.2543885, 0.9000744, 0.2997127, 1, 1, 1, 1, 1,
0.2545381, -0.4119366, 2.916919, 0, 0, 1, 1, 1,
0.2572776, -0.07938001, 0.6363287, 1, 0, 0, 1, 1,
0.2600715, 0.4651869, -0.8921096, 1, 0, 0, 1, 1,
0.2602256, -0.9495176, 4.513678, 1, 0, 0, 1, 1,
0.2614708, 1.339688, 2.019335, 1, 0, 0, 1, 1,
0.2614804, 0.348907, 2.608647, 1, 0, 0, 1, 1,
0.2616774, -0.6795192, 3.749707, 0, 0, 0, 1, 1,
0.2655007, 0.5661611, 2.141633, 0, 0, 0, 1, 1,
0.2659332, -0.07186205, 2.297722, 0, 0, 0, 1, 1,
0.2688949, 0.9226291, 0.9316105, 0, 0, 0, 1, 1,
0.2703506, 0.2729664, 0.6699919, 0, 0, 0, 1, 1,
0.2705682, -1.993789, 3.561722, 0, 0, 0, 1, 1,
0.2714429, -1.360354, 3.143035, 0, 0, 0, 1, 1,
0.2730655, -0.9345866, 3.538223, 1, 1, 1, 1, 1,
0.2742112, 0.6168466, 1.735222, 1, 1, 1, 1, 1,
0.2786965, -0.7517557, 2.123461, 1, 1, 1, 1, 1,
0.2803788, 0.9827877, -0.1678396, 1, 1, 1, 1, 1,
0.284991, -0.1002041, 3.279293, 1, 1, 1, 1, 1,
0.2924866, 1.106453, 0.9527576, 1, 1, 1, 1, 1,
0.298821, 0.1003505, -0.3178018, 1, 1, 1, 1, 1,
0.3054727, 0.400571, 1.19223, 1, 1, 1, 1, 1,
0.3057359, 2.403296, -1.424723, 1, 1, 1, 1, 1,
0.3090411, 0.3596582, -0.1262711, 1, 1, 1, 1, 1,
0.314609, 0.4295637, 0.6096498, 1, 1, 1, 1, 1,
0.3150952, -0.7909741, 4.78489, 1, 1, 1, 1, 1,
0.3201467, 3.381474, -1.032286, 1, 1, 1, 1, 1,
0.3241737, -2.013024, 2.729643, 1, 1, 1, 1, 1,
0.3294841, -0.4120534, 3.118062, 1, 1, 1, 1, 1,
0.3341754, 0.3733309, 1.182507, 0, 0, 1, 1, 1,
0.3355826, -0.318335, 2.076797, 1, 0, 0, 1, 1,
0.3379516, 0.2940784, 0.9132385, 1, 0, 0, 1, 1,
0.3399336, 0.9741229, 1.884896, 1, 0, 0, 1, 1,
0.3413919, 0.2246414, 1.78552, 1, 0, 0, 1, 1,
0.3416052, 0.2209011, 2.653404, 1, 0, 0, 1, 1,
0.3419376, 1.31799, 0.1821493, 0, 0, 0, 1, 1,
0.3423711, 0.7101712, -1.427497, 0, 0, 0, 1, 1,
0.3426589, -0.4844165, 2.4301, 0, 0, 0, 1, 1,
0.3426994, 0.06656133, 2.19832, 0, 0, 0, 1, 1,
0.344412, 0.5537231, 1.603184, 0, 0, 0, 1, 1,
0.3482934, 1.869846, -0.05707989, 0, 0, 0, 1, 1,
0.3485547, -0.1054769, 0.2509003, 0, 0, 0, 1, 1,
0.3499872, 0.961705, -0.6950292, 1, 1, 1, 1, 1,
0.3505886, -1.386694, 2.872784, 1, 1, 1, 1, 1,
0.3506691, -0.8597502, 3.72484, 1, 1, 1, 1, 1,
0.3530372, 2.867055, 1.119548, 1, 1, 1, 1, 1,
0.3539133, -1.019218, 2.844223, 1, 1, 1, 1, 1,
0.3584599, 0.9095782, 1.222785, 1, 1, 1, 1, 1,
0.3672117, 1.699818, -0.7014582, 1, 1, 1, 1, 1,
0.3678259, -0.5345055, 0.4095956, 1, 1, 1, 1, 1,
0.3680481, -0.5782865, 1.151367, 1, 1, 1, 1, 1,
0.3715895, -0.945609, 4.393088, 1, 1, 1, 1, 1,
0.3775159, -0.9232808, 2.504046, 1, 1, 1, 1, 1,
0.3816033, -0.1313724, 2.223989, 1, 1, 1, 1, 1,
0.3840389, 1.771145, 1.046728, 1, 1, 1, 1, 1,
0.38453, 1.079854, 0.6599559, 1, 1, 1, 1, 1,
0.3884388, -0.7785178, 3.728259, 1, 1, 1, 1, 1,
0.3889204, 1.381091, -0.4129416, 0, 0, 1, 1, 1,
0.3920625, 0.1950683, 2.276977, 1, 0, 0, 1, 1,
0.3945862, -0.9199653, 1.75161, 1, 0, 0, 1, 1,
0.3968014, -1.051042, 3.199124, 1, 0, 0, 1, 1,
0.3998065, 0.45132, 0.7455313, 1, 0, 0, 1, 1,
0.4006257, 0.2515585, 0.3750646, 1, 0, 0, 1, 1,
0.4008058, 0.3745442, 1.680119, 0, 0, 0, 1, 1,
0.4019574, 0.02763765, 0.1589773, 0, 0, 0, 1, 1,
0.4031198, 2.123825, -0.6185407, 0, 0, 0, 1, 1,
0.4069459, 0.1137065, 1.322141, 0, 0, 0, 1, 1,
0.4089684, 0.2929277, 1.230555, 0, 0, 0, 1, 1,
0.4102016, 1.149548, -0.7475671, 0, 0, 0, 1, 1,
0.4143489, 0.2795022, 1.528761, 0, 0, 0, 1, 1,
0.4169433, -0.42074, 1.501403, 1, 1, 1, 1, 1,
0.417056, 0.6949176, 0.5922233, 1, 1, 1, 1, 1,
0.4180517, -0.848831, 2.322183, 1, 1, 1, 1, 1,
0.4220174, -1.333346, 2.323227, 1, 1, 1, 1, 1,
0.4321349, -1.230971, 2.911607, 1, 1, 1, 1, 1,
0.4329475, -1.711573, 1.700674, 1, 1, 1, 1, 1,
0.4361567, 0.4038251, 0.5175175, 1, 1, 1, 1, 1,
0.4369277, 0.219253, 3.265868, 1, 1, 1, 1, 1,
0.4394545, -0.2118433, 1.839879, 1, 1, 1, 1, 1,
0.4429923, -1.143121, 3.506684, 1, 1, 1, 1, 1,
0.4466532, -0.02413944, 3.808515, 1, 1, 1, 1, 1,
0.4557462, -0.2916906, 1.339807, 1, 1, 1, 1, 1,
0.4604667, 0.07214734, 1.941707, 1, 1, 1, 1, 1,
0.4677177, -0.9278876, 1.032862, 1, 1, 1, 1, 1,
0.4741884, 1.331701, -0.2022925, 1, 1, 1, 1, 1,
0.4782206, 0.4416535, 0.03433698, 0, 0, 1, 1, 1,
0.4794682, 0.6438792, -1.208059, 1, 0, 0, 1, 1,
0.4848621, -1.497802, 1.642155, 1, 0, 0, 1, 1,
0.4903664, -1.186025, 2.788544, 1, 0, 0, 1, 1,
0.4924068, 0.7213628, 1.633917, 1, 0, 0, 1, 1,
0.4934381, 0.7134063, 0.5978895, 1, 0, 0, 1, 1,
0.4957219, -0.5955716, 2.442306, 0, 0, 0, 1, 1,
0.5061967, 0.4441572, 1.198008, 0, 0, 0, 1, 1,
0.5078367, 0.4380887, 0.2397384, 0, 0, 0, 1, 1,
0.5091565, -1.932588, 0.7748135, 0, 0, 0, 1, 1,
0.5169055, -0.09624354, 1.328776, 0, 0, 0, 1, 1,
0.5175816, 0.01438233, 2.530404, 0, 0, 0, 1, 1,
0.5217409, -1.06937, 1.942959, 0, 0, 0, 1, 1,
0.5257139, -0.3866337, 2.992344, 1, 1, 1, 1, 1,
0.5321409, 1.246509, -1.468796, 1, 1, 1, 1, 1,
0.5323163, -0.6613289, 3.146983, 1, 1, 1, 1, 1,
0.5408004, -0.2113936, -0.1641724, 1, 1, 1, 1, 1,
0.5426149, -0.8687093, 2.036757, 1, 1, 1, 1, 1,
0.5606468, -0.77544, 3.365817, 1, 1, 1, 1, 1,
0.5617356, 1.343438, 1.254355, 1, 1, 1, 1, 1,
0.5648782, -0.06548805, 0.127188, 1, 1, 1, 1, 1,
0.5665625, -0.4453688, 0.7533743, 1, 1, 1, 1, 1,
0.5668346, -0.3382208, 2.381225, 1, 1, 1, 1, 1,
0.5721254, 0.3466814, 0.6503178, 1, 1, 1, 1, 1,
0.5731205, 0.01977983, 1.013362, 1, 1, 1, 1, 1,
0.5749999, -0.4135478, 2.799406, 1, 1, 1, 1, 1,
0.5770647, -1.460094, 3.558058, 1, 1, 1, 1, 1,
0.5789768, -1.338644, 4.630086, 1, 1, 1, 1, 1,
0.582762, -0.4459793, 1.67872, 0, 0, 1, 1, 1,
0.5845988, -1.3021, 2.591589, 1, 0, 0, 1, 1,
0.5846549, 0.3108018, 0.9083191, 1, 0, 0, 1, 1,
0.5867424, 1.632312, 2.466008, 1, 0, 0, 1, 1,
0.5870684, -0.8289383, 2.258329, 1, 0, 0, 1, 1,
0.5873312, -0.1890051, 3.172732, 1, 0, 0, 1, 1,
0.5892502, -0.09829285, 2.293559, 0, 0, 0, 1, 1,
0.5924515, 1.455022, 0.7488282, 0, 0, 0, 1, 1,
0.593951, -0.9959, 1.699272, 0, 0, 0, 1, 1,
0.5999555, 1.385898, 1.682356, 0, 0, 0, 1, 1,
0.602393, -0.5672107, 2.750451, 0, 0, 0, 1, 1,
0.6075286, 0.5211423, 1.009495, 0, 0, 0, 1, 1,
0.6086294, -1.369068, 2.938362, 0, 0, 0, 1, 1,
0.6088397, 0.112089, 3.068692, 1, 1, 1, 1, 1,
0.610471, -0.06817856, -0.7956056, 1, 1, 1, 1, 1,
0.6113003, 0.3223075, 2.26483, 1, 1, 1, 1, 1,
0.6134578, -0.8663646, 1.78257, 1, 1, 1, 1, 1,
0.615182, -1.564859, 2.352858, 1, 1, 1, 1, 1,
0.6158286, 2.654456, 0.5685109, 1, 1, 1, 1, 1,
0.6186997, 0.1456268, 0.4466288, 1, 1, 1, 1, 1,
0.6203978, -0.304543, 0.3499716, 1, 1, 1, 1, 1,
0.6267908, -1.821416, 4.654256, 1, 1, 1, 1, 1,
0.6441649, 1.421869, -0.6824102, 1, 1, 1, 1, 1,
0.6451045, -1.673272, 1.751321, 1, 1, 1, 1, 1,
0.6458381, -0.8698942, 2.375275, 1, 1, 1, 1, 1,
0.6462647, -1.365049, 2.932025, 1, 1, 1, 1, 1,
0.648253, 1.681905, -0.03959468, 1, 1, 1, 1, 1,
0.648946, -0.8866248, 2.895314, 1, 1, 1, 1, 1,
0.651657, 0.3358088, 3.076536, 0, 0, 1, 1, 1,
0.6540521, -0.3393635, 2.538055, 1, 0, 0, 1, 1,
0.6600949, 0.9298981, 1.137564, 1, 0, 0, 1, 1,
0.6638491, -0.1149518, 2.379612, 1, 0, 0, 1, 1,
0.6709192, -0.7445731, 3.090419, 1, 0, 0, 1, 1,
0.6734391, -0.6568221, 2.554413, 1, 0, 0, 1, 1,
0.674055, 0.9345412, 1.200611, 0, 0, 0, 1, 1,
0.6756728, -1.424566, 2.970676, 0, 0, 0, 1, 1,
0.6771709, 0.6696873, 2.234455, 0, 0, 0, 1, 1,
0.6832497, -1.755444, 3.077323, 0, 0, 0, 1, 1,
0.6841022, 0.3765535, 2.29802, 0, 0, 0, 1, 1,
0.6842341, -1.78634, 2.695766, 0, 0, 0, 1, 1,
0.6850055, -0.01661458, 0.5142726, 0, 0, 0, 1, 1,
0.6858348, -0.8755276, 2.648393, 1, 1, 1, 1, 1,
0.6860218, -0.7337053, 1.958729, 1, 1, 1, 1, 1,
0.6911981, 0.4024554, 1.013767, 1, 1, 1, 1, 1,
0.7066424, 0.1057031, 1.063728, 1, 1, 1, 1, 1,
0.7091502, 0.422349, 1.720375, 1, 1, 1, 1, 1,
0.7105873, -1.539038, 3.75962, 1, 1, 1, 1, 1,
0.712514, -0.6470591, 2.883605, 1, 1, 1, 1, 1,
0.7190257, 1.086735, 1.759329, 1, 1, 1, 1, 1,
0.7264409, 0.6695312, 0.3990747, 1, 1, 1, 1, 1,
0.7329854, -1.013491, 1.514645, 1, 1, 1, 1, 1,
0.736569, 1.261747, 0.2227765, 1, 1, 1, 1, 1,
0.7372957, 1.059251, 0.02724783, 1, 1, 1, 1, 1,
0.7388511, 1.038179, -0.2932094, 1, 1, 1, 1, 1,
0.7419841, 0.1561402, 2.250004, 1, 1, 1, 1, 1,
0.7458839, -0.2061403, 2.897464, 1, 1, 1, 1, 1,
0.7500287, 1.657911, -1.473494, 0, 0, 1, 1, 1,
0.7513493, 1.270724, 0.7326619, 1, 0, 0, 1, 1,
0.7552029, 0.9487836, 2.773683, 1, 0, 0, 1, 1,
0.7568631, -0.6357011, 2.342922, 1, 0, 0, 1, 1,
0.7635579, -0.7743294, 2.664614, 1, 0, 0, 1, 1,
0.767097, -1.46225, 4.524712, 1, 0, 0, 1, 1,
0.7675448, -0.7362954, 4.531739, 0, 0, 0, 1, 1,
0.7729806, 0.03305825, 0.8644233, 0, 0, 0, 1, 1,
0.773643, 2.119494, 1.13657, 0, 0, 0, 1, 1,
0.7739315, 1.082463, 0.0169384, 0, 0, 0, 1, 1,
0.7739528, 0.9851251, 1.428228, 0, 0, 0, 1, 1,
0.7770705, -0.7286727, 2.11057, 0, 0, 0, 1, 1,
0.7772646, -1.286597, 2.915048, 0, 0, 0, 1, 1,
0.7863894, -0.268072, 3.714158, 1, 1, 1, 1, 1,
0.7895402, -1.310114, 4.272169, 1, 1, 1, 1, 1,
0.7922468, -0.1045716, 2.85333, 1, 1, 1, 1, 1,
0.7982821, -0.5101478, 2.541654, 1, 1, 1, 1, 1,
0.7995834, -0.2108518, 1.944093, 1, 1, 1, 1, 1,
0.8023158, 0.7288006, -0.5720986, 1, 1, 1, 1, 1,
0.8046319, -0.7768175, 2.700097, 1, 1, 1, 1, 1,
0.8062048, -1.29263, 2.085468, 1, 1, 1, 1, 1,
0.8095441, -0.6590126, 2.980585, 1, 1, 1, 1, 1,
0.8140114, -0.6640719, 2.274413, 1, 1, 1, 1, 1,
0.8185634, 0.3347934, -0.09121527, 1, 1, 1, 1, 1,
0.8243701, 0.6419637, 0.1576591, 1, 1, 1, 1, 1,
0.8287914, -0.6664034, 2.00144, 1, 1, 1, 1, 1,
0.8366696, -1.880025, 1.713274, 1, 1, 1, 1, 1,
0.8406217, 1.318073, -0.01950504, 1, 1, 1, 1, 1,
0.848182, 0.5277019, 0.1530665, 0, 0, 1, 1, 1,
0.849844, 0.09251991, 1.914973, 1, 0, 0, 1, 1,
0.8544002, 0.5854367, 1.802971, 1, 0, 0, 1, 1,
0.857958, -1.537095, 1.860212, 1, 0, 0, 1, 1,
0.8665182, -0.4278203, -0.03562261, 1, 0, 0, 1, 1,
0.8722411, -0.1578057, 0.6273727, 1, 0, 0, 1, 1,
0.8817194, -1.725356, 2.293585, 0, 0, 0, 1, 1,
0.8830953, -1.206078, 1.865633, 0, 0, 0, 1, 1,
0.891678, 0.2406943, 1.305083, 0, 0, 0, 1, 1,
0.9069018, 1.232973, 2.095041, 0, 0, 0, 1, 1,
0.9071565, -0.9993536, 3.060826, 0, 0, 0, 1, 1,
0.9075501, 0.2192852, 1.767941, 0, 0, 0, 1, 1,
0.9166503, 1.114842, 0.1830827, 0, 0, 0, 1, 1,
0.919163, -0.9743993, 1.806202, 1, 1, 1, 1, 1,
0.9252625, -1.462, 2.30555, 1, 1, 1, 1, 1,
0.9337862, -0.7568551, 3.633705, 1, 1, 1, 1, 1,
0.9383894, 0.1216246, 0.5766889, 1, 1, 1, 1, 1,
0.9430504, 0.4510292, 0.9428397, 1, 1, 1, 1, 1,
0.9455039, 0.1016655, 2.423029, 1, 1, 1, 1, 1,
0.9460135, 0.4317394, -0.02233787, 1, 1, 1, 1, 1,
0.9474266, 1.858128, -1.001004, 1, 1, 1, 1, 1,
0.9488814, -1.103067, 3.803077, 1, 1, 1, 1, 1,
0.9528531, 0.4046992, -0.6919839, 1, 1, 1, 1, 1,
0.9551083, 0.6243287, 0.567453, 1, 1, 1, 1, 1,
0.9585701, 1.22603, 1.185793, 1, 1, 1, 1, 1,
0.9659255, -1.38216, 2.712157, 1, 1, 1, 1, 1,
0.969552, -0.5319366, 1.723527, 1, 1, 1, 1, 1,
0.9711243, -0.367608, 2.779148, 1, 1, 1, 1, 1,
0.9814557, 0.9161785, 0.6640232, 0, 0, 1, 1, 1,
0.985747, 0.2653207, 1.649912, 1, 0, 0, 1, 1,
0.9860409, -0.1069273, 1.96918, 1, 0, 0, 1, 1,
0.9885459, 1.046807, 1.287937, 1, 0, 0, 1, 1,
0.9890122, 0.6231098, 1.404339, 1, 0, 0, 1, 1,
0.9892507, 1.22189, 1.094106, 1, 0, 0, 1, 1,
0.994133, -1.762146, 1.738918, 0, 0, 0, 1, 1,
0.9969637, 0.1447611, 2.299149, 0, 0, 0, 1, 1,
1.001374, 1.122015, 0.08602515, 0, 0, 0, 1, 1,
1.002031, -0.6175307, 1.462703, 0, 0, 0, 1, 1,
1.004096, 0.6463886, 0.2966047, 0, 0, 0, 1, 1,
1.004459, 1.617444, 2.129458, 0, 0, 0, 1, 1,
1.007799, 1.228285, 0.9040694, 0, 0, 0, 1, 1,
1.008908, 1.440315, 0.6777093, 1, 1, 1, 1, 1,
1.009507, 0.6354169, 2.845894, 1, 1, 1, 1, 1,
1.012436, -0.7258836, 4.567803, 1, 1, 1, 1, 1,
1.017031, -0.3617848, 1.353683, 1, 1, 1, 1, 1,
1.017756, 1.182786, 3.152668, 1, 1, 1, 1, 1,
1.025067, -2.095605, 3.751983, 1, 1, 1, 1, 1,
1.030048, -0.3932982, 2.749709, 1, 1, 1, 1, 1,
1.031623, -0.1662169, 1.10821, 1, 1, 1, 1, 1,
1.035, 0.2037559, 2.531902, 1, 1, 1, 1, 1,
1.047992, -0.009710031, 1.777339, 1, 1, 1, 1, 1,
1.051174, 1.278973, 1.424515, 1, 1, 1, 1, 1,
1.052575, 0.8268968, 0.4691771, 1, 1, 1, 1, 1,
1.071829, 0.9299642, -0.5025612, 1, 1, 1, 1, 1,
1.075849, -0.9968709, 1.688566, 1, 1, 1, 1, 1,
1.078676, 1.444151, 0.6297795, 1, 1, 1, 1, 1,
1.09098, 0.1209811, 0.8711008, 0, 0, 1, 1, 1,
1.094305, -0.9199751, 1.493742, 1, 0, 0, 1, 1,
1.094621, -1.902493, 1.624116, 1, 0, 0, 1, 1,
1.109265, 0.5121807, 0.2224066, 1, 0, 0, 1, 1,
1.113674, -0.5581771, 0.9230122, 1, 0, 0, 1, 1,
1.11828, -1.379214, 2.987236, 1, 0, 0, 1, 1,
1.121573, 1.683615, 1.962843, 0, 0, 0, 1, 1,
1.146976, -1.789531, 2.736743, 0, 0, 0, 1, 1,
1.151866, -0.07355999, 2.414961, 0, 0, 0, 1, 1,
1.161265, -0.9837152, 0.2571917, 0, 0, 0, 1, 1,
1.161786, -0.4814751, 2.016389, 0, 0, 0, 1, 1,
1.163373, 0.3586935, 0.2901696, 0, 0, 0, 1, 1,
1.169845, 0.5061293, 1.87176, 0, 0, 0, 1, 1,
1.176073, 0.2842175, 0.6196758, 1, 1, 1, 1, 1,
1.176136, 1.067138, 0.3279059, 1, 1, 1, 1, 1,
1.180338, -1.431288, 2.569033, 1, 1, 1, 1, 1,
1.180602, -0.2375462, 0.6036623, 1, 1, 1, 1, 1,
1.182536, 1.087251, 0.2023078, 1, 1, 1, 1, 1,
1.197925, 0.2954471, 1.224157, 1, 1, 1, 1, 1,
1.210844, 1.051181, 0.145409, 1, 1, 1, 1, 1,
1.213214, -0.3577212, 2.107934, 1, 1, 1, 1, 1,
1.218406, 1.362579, -0.8811949, 1, 1, 1, 1, 1,
1.228754, 0.9140075, -0.9968185, 1, 1, 1, 1, 1,
1.235928, 2.092742, 0.8802919, 1, 1, 1, 1, 1,
1.239537, 0.09492372, 0.9971684, 1, 1, 1, 1, 1,
1.244204, -0.9567906, 1.600915, 1, 1, 1, 1, 1,
1.245546, -0.1369104, 0.6623929, 1, 1, 1, 1, 1,
1.245962, 1.303116, 0.01330299, 1, 1, 1, 1, 1,
1.249554, 0.346433, 0.8195153, 0, 0, 1, 1, 1,
1.256169, -1.162333, 0.8477402, 1, 0, 0, 1, 1,
1.258302, 0.9892119, 1.538608, 1, 0, 0, 1, 1,
1.263192, -0.7707798, 3.091005, 1, 0, 0, 1, 1,
1.263283, -1.983423, 1.763457, 1, 0, 0, 1, 1,
1.268107, -1.156011, 1.204279, 1, 0, 0, 1, 1,
1.279013, 1.107328, -0.01467107, 0, 0, 0, 1, 1,
1.279629, -0.1345395, 1.16957, 0, 0, 0, 1, 1,
1.283689, -0.7431068, 0.8027818, 0, 0, 0, 1, 1,
1.300917, 2.206997, 0.5496502, 0, 0, 0, 1, 1,
1.301008, 2.159049, 1.169719, 0, 0, 0, 1, 1,
1.302061, 0.1390503, 1.01209, 0, 0, 0, 1, 1,
1.306451, -0.05046863, 1.511187, 0, 0, 0, 1, 1,
1.3088, -0.4924627, 1.547624, 1, 1, 1, 1, 1,
1.308859, -0.2518975, 2.836039, 1, 1, 1, 1, 1,
1.313796, -0.1933406, 0.9987997, 1, 1, 1, 1, 1,
1.31784, -0.4083403, 1.289314, 1, 1, 1, 1, 1,
1.320339, 0.6145452, -0.1758145, 1, 1, 1, 1, 1,
1.3249, 0.6269118, 0.004626616, 1, 1, 1, 1, 1,
1.327298, -0.3404195, 3.211801, 1, 1, 1, 1, 1,
1.334019, -0.7385379, 4.65303, 1, 1, 1, 1, 1,
1.334672, 0.8564012, 0.4309659, 1, 1, 1, 1, 1,
1.337308, 1.976102, 0.8776272, 1, 1, 1, 1, 1,
1.341832, -0.2864232, 2.688873, 1, 1, 1, 1, 1,
1.356874, -0.3393721, 2.112756, 1, 1, 1, 1, 1,
1.361128, -0.08797359, 1.536325, 1, 1, 1, 1, 1,
1.366384, 0.5480883, -0.6980693, 1, 1, 1, 1, 1,
1.368567, 1.55698, 1.399537, 1, 1, 1, 1, 1,
1.3732, -1.47633, 3.187725, 0, 0, 1, 1, 1,
1.37617, -1.297467, 3.940678, 1, 0, 0, 1, 1,
1.385962, 0.8896927, 0.7941486, 1, 0, 0, 1, 1,
1.388009, 1.097213, 1.539273, 1, 0, 0, 1, 1,
1.402156, -0.03788197, 1.742705, 1, 0, 0, 1, 1,
1.412046, -0.7918851, 3.170771, 1, 0, 0, 1, 1,
1.41814, 0.2167899, 1.924373, 0, 0, 0, 1, 1,
1.425111, 1.604372, -1.005932, 0, 0, 0, 1, 1,
1.429688, -2.035304, 0.6278163, 0, 0, 0, 1, 1,
1.437388, 0.9978232, -0.4281062, 0, 0, 0, 1, 1,
1.461076, 0.545694, 0.8406836, 0, 0, 0, 1, 1,
1.464752, 1.474363, 0.3992254, 0, 0, 0, 1, 1,
1.466152, -2.339938, 2.452034, 0, 0, 0, 1, 1,
1.46629, -0.7502514, 2.114932, 1, 1, 1, 1, 1,
1.467345, 0.5105719, 1.599016, 1, 1, 1, 1, 1,
1.470853, 1.37596, 2.752119, 1, 1, 1, 1, 1,
1.477433, -0.0996367, -0.2570727, 1, 1, 1, 1, 1,
1.48175, -0.1753405, 1.659674, 1, 1, 1, 1, 1,
1.489324, 0.5679833, -0.3401346, 1, 1, 1, 1, 1,
1.505395, -0.5959323, 2.782459, 1, 1, 1, 1, 1,
1.515169, -0.3886191, 0.02055946, 1, 1, 1, 1, 1,
1.52979, 0.7194126, 0.761071, 1, 1, 1, 1, 1,
1.53894, 1.122857, 0.8844472, 1, 1, 1, 1, 1,
1.555154, 2.099467, 1.300359, 1, 1, 1, 1, 1,
1.561117, -0.7235562, 2.461989, 1, 1, 1, 1, 1,
1.56777, -0.8728009, 2.207786, 1, 1, 1, 1, 1,
1.576852, -1.434032, 2.540939, 1, 1, 1, 1, 1,
1.586099, 0.459882, 1.054804, 1, 1, 1, 1, 1,
1.605207, 0.6733084, 1.671722, 0, 0, 1, 1, 1,
1.615975, 0.02978835, 0.7484459, 1, 0, 0, 1, 1,
1.617848, 1.065791, 0.4079272, 1, 0, 0, 1, 1,
1.622919, -0.4124663, 1.295621, 1, 0, 0, 1, 1,
1.627166, -1.405031, 1.912147, 1, 0, 0, 1, 1,
1.633136, 0.9816244, 2.379715, 1, 0, 0, 1, 1,
1.636289, -0.2630771, 4.01401, 0, 0, 0, 1, 1,
1.646211, -0.7536857, 3.15432, 0, 0, 0, 1, 1,
1.651817, -0.9925253, 1.461193, 0, 0, 0, 1, 1,
1.667632, 0.8761259, 1.981103, 0, 0, 0, 1, 1,
1.675787, -1.145475, 1.982613, 0, 0, 0, 1, 1,
1.68741, 0.8777044, 0.1060341, 0, 0, 0, 1, 1,
1.690823, 0.4835902, 1.569428, 0, 0, 0, 1, 1,
1.692368, 0.5446648, 2.690691, 1, 1, 1, 1, 1,
1.709341, 0.6553032, 0.1796078, 1, 1, 1, 1, 1,
1.735694, -0.07993488, 2.038187, 1, 1, 1, 1, 1,
1.742717, 0.07978736, -0.6189528, 1, 1, 1, 1, 1,
1.745935, 0.590207, -0.1123286, 1, 1, 1, 1, 1,
1.756819, 0.07646555, 3.266358, 1, 1, 1, 1, 1,
1.762113, 1.280174, 1.142191, 1, 1, 1, 1, 1,
1.776989, 2.361833, 1.689865, 1, 1, 1, 1, 1,
1.793062, -2.047006, 0.9922268, 1, 1, 1, 1, 1,
1.803043, 0.2226501, 3.123822, 1, 1, 1, 1, 1,
1.804122, 0.8332886, 0.8856526, 1, 1, 1, 1, 1,
1.812565, -0.5175339, 0.6844763, 1, 1, 1, 1, 1,
1.813412, -2.340009, 1.954134, 1, 1, 1, 1, 1,
1.813428, -0.45373, 2.005615, 1, 1, 1, 1, 1,
1.818136, -2.094147, 0.1033292, 1, 1, 1, 1, 1,
1.83937, 0.9334852, -0.6641859, 0, 0, 1, 1, 1,
1.857456, -1.124348, 1.858789, 1, 0, 0, 1, 1,
1.906891, -1.631086, 2.648105, 1, 0, 0, 1, 1,
1.913817, 1.275979, 0.2438645, 1, 0, 0, 1, 1,
1.923285, 0.3908052, 2.020982, 1, 0, 0, 1, 1,
1.97928, 0.9791431, 0.03191654, 1, 0, 0, 1, 1,
2.048752, -0.6074526, 1.712517, 0, 0, 0, 1, 1,
2.115279, 1.36715, 2.12748, 0, 0, 0, 1, 1,
2.13365, 1.370193, 0.8859088, 0, 0, 0, 1, 1,
2.134444, 0.1834937, 1.627998, 0, 0, 0, 1, 1,
2.171958, 0.4028587, -0.2207996, 0, 0, 0, 1, 1,
2.194083, 0.3902727, 0.9872914, 0, 0, 0, 1, 1,
2.28722, -0.7125435, 2.78534, 0, 0, 0, 1, 1,
2.287362, 0.807264, 2.01903, 1, 1, 1, 1, 1,
2.313672, 0.2507657, 1.087888, 1, 1, 1, 1, 1,
2.383895, -0.3456948, 2.082779, 1, 1, 1, 1, 1,
2.38722, 0.2587267, 1.236975, 1, 1, 1, 1, 1,
2.407246, 0.4655834, 1.485584, 1, 1, 1, 1, 1,
2.408707, 0.02834385, 1.286084, 1, 1, 1, 1, 1,
2.498002, 1.255194, 2.511903, 1, 1, 1, 1, 1
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
var radius = 9.575006;
var distance = 33.6318;
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
mvMatrix.translate( 0.4888843, -0.108799, -0.1853006 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6318);
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
