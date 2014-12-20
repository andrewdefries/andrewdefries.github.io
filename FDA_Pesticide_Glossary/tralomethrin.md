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
-3.085682, -1.304974, -2.01865, 1, 0, 0, 1,
-2.513188, 0.863739, -1.536152, 1, 0.007843138, 0, 1,
-2.31201, -0.6942983, -3.099797, 1, 0.01176471, 0, 1,
-2.269139, -0.2984854, -2.434926, 1, 0.01960784, 0, 1,
-2.256356, -2.014932, -4.075761, 1, 0.02352941, 0, 1,
-2.190678, 0.7442362, -3.640242, 1, 0.03137255, 0, 1,
-2.184444, -0.170431, -1.628728, 1, 0.03529412, 0, 1,
-2.033751, 1.361456, -1.98395, 1, 0.04313726, 0, 1,
-2.025486, 1.842974, -2.963781, 1, 0.04705882, 0, 1,
-2.020315, -0.02884013, -1.82966, 1, 0.05490196, 0, 1,
-1.986708, -0.3423161, -3.295285, 1, 0.05882353, 0, 1,
-1.976765, 0.05560489, -2.682654, 1, 0.06666667, 0, 1,
-1.965671, 0.5596981, -1.554355, 1, 0.07058824, 0, 1,
-1.958935, -0.2717127, -2.220881, 1, 0.07843138, 0, 1,
-1.939465, 0.7015812, -0.3911439, 1, 0.08235294, 0, 1,
-1.914104, -0.6100858, -2.301055, 1, 0.09019608, 0, 1,
-1.911755, -1.413804, -1.622373, 1, 0.09411765, 0, 1,
-1.911063, 0.3361633, -0.4536912, 1, 0.1019608, 0, 1,
-1.906484, -0.992465, -2.684107, 1, 0.1098039, 0, 1,
-1.894645, -2.052321, -3.016561, 1, 0.1137255, 0, 1,
-1.88921, -0.7277358, -2.886155, 1, 0.1215686, 0, 1,
-1.888801, -0.4858168, -1.023587, 1, 0.1254902, 0, 1,
-1.859515, -0.1470781, -2.2901, 1, 0.1333333, 0, 1,
-1.85194, 0.2687131, -2.481798, 1, 0.1372549, 0, 1,
-1.847847, 1.294258, -1.806594, 1, 0.145098, 0, 1,
-1.83114, 0.5245004, -0.6487378, 1, 0.1490196, 0, 1,
-1.830793, 0.1645433, -0.5831647, 1, 0.1568628, 0, 1,
-1.828315, 0.6884357, -2.519083, 1, 0.1607843, 0, 1,
-1.816568, 1.951264, -0.40299, 1, 0.1686275, 0, 1,
-1.79556, -1.655532, -1.796167, 1, 0.172549, 0, 1,
-1.770865, -0.01221736, 0.2599545, 1, 0.1803922, 0, 1,
-1.762057, 1.09977, -1.786934, 1, 0.1843137, 0, 1,
-1.761393, 0.6752441, -0.9730082, 1, 0.1921569, 0, 1,
-1.759269, 0.5587855, 0.2661379, 1, 0.1960784, 0, 1,
-1.74868, 0.6610489, -0.8459452, 1, 0.2039216, 0, 1,
-1.745267, 1.259671, 1.596988, 1, 0.2117647, 0, 1,
-1.733385, -1.114451, -3.005181, 1, 0.2156863, 0, 1,
-1.730323, -0.01514952, -1.888899, 1, 0.2235294, 0, 1,
-1.711455, -0.7708653, -0.01923995, 1, 0.227451, 0, 1,
-1.710716, 2.009533, 0.01632709, 1, 0.2352941, 0, 1,
-1.695278, 1.129784, -3.275017, 1, 0.2392157, 0, 1,
-1.692931, -1.342043, -2.505199, 1, 0.2470588, 0, 1,
-1.680448, 0.1075925, -0.2573889, 1, 0.2509804, 0, 1,
-1.660466, 0.5319415, -2.285721, 1, 0.2588235, 0, 1,
-1.652483, 2.535467, 0.2089262, 1, 0.2627451, 0, 1,
-1.652404, -0.4629009, -1.515071, 1, 0.2705882, 0, 1,
-1.647602, 0.6681128, -0.877, 1, 0.2745098, 0, 1,
-1.642464, 0.7864594, -2.022843, 1, 0.282353, 0, 1,
-1.630094, 0.5364916, -1.950999, 1, 0.2862745, 0, 1,
-1.617617, 0.9464409, -1.811725, 1, 0.2941177, 0, 1,
-1.614954, -0.2340855, -4.153421, 1, 0.3019608, 0, 1,
-1.61365, -1.368069, -2.451665, 1, 0.3058824, 0, 1,
-1.602678, -0.6949233, 0.07193531, 1, 0.3137255, 0, 1,
-1.600354, 1.83811, -1.53655, 1, 0.3176471, 0, 1,
-1.5923, 1.033988, -2.664948, 1, 0.3254902, 0, 1,
-1.591712, 1.556877, 0.3780203, 1, 0.3294118, 0, 1,
-1.576937, 0.2780081, -0.9507466, 1, 0.3372549, 0, 1,
-1.567958, -0.2925965, -1.416068, 1, 0.3411765, 0, 1,
-1.56656, -0.2890687, -0.7134869, 1, 0.3490196, 0, 1,
-1.5612, -0.7557742, -2.052258, 1, 0.3529412, 0, 1,
-1.560741, -1.205207, -3.760666, 1, 0.3607843, 0, 1,
-1.552914, -2.746295, -3.043613, 1, 0.3647059, 0, 1,
-1.550788, 0.9380023, -2.118463, 1, 0.372549, 0, 1,
-1.54452, -2.016502, -3.04091, 1, 0.3764706, 0, 1,
-1.54022, -0.531811, -0.8909104, 1, 0.3843137, 0, 1,
-1.536602, 0.0117272, -1.809698, 1, 0.3882353, 0, 1,
-1.525327, 0.6671177, -0.06383824, 1, 0.3960784, 0, 1,
-1.523976, -0.7310209, -1.354392, 1, 0.4039216, 0, 1,
-1.522886, -1.01788, -2.786811, 1, 0.4078431, 0, 1,
-1.517831, 0.2983379, -1.80025, 1, 0.4156863, 0, 1,
-1.516927, 0.8461326, -1.576909, 1, 0.4196078, 0, 1,
-1.513804, 0.09501153, -1.135394, 1, 0.427451, 0, 1,
-1.501864, 1.244125, -0.2239251, 1, 0.4313726, 0, 1,
-1.497329, -0.8567922, -1.43278, 1, 0.4392157, 0, 1,
-1.491298, -0.199292, -2.159313, 1, 0.4431373, 0, 1,
-1.488681, -0.5182795, -0.4295946, 1, 0.4509804, 0, 1,
-1.485159, -0.05869462, -1.82334, 1, 0.454902, 0, 1,
-1.47064, -0.8943383, -2.269933, 1, 0.4627451, 0, 1,
-1.468959, -0.6440263, -2.117954, 1, 0.4666667, 0, 1,
-1.461843, 0.07118767, -2.213018, 1, 0.4745098, 0, 1,
-1.448071, 1.566521, 0.312089, 1, 0.4784314, 0, 1,
-1.447005, -0.8016008, -1.533165, 1, 0.4862745, 0, 1,
-1.443321, -0.6066606, -0.5156437, 1, 0.4901961, 0, 1,
-1.436552, 0.5892762, 0.7832981, 1, 0.4980392, 0, 1,
-1.432212, -1.067238, -4.401338, 1, 0.5058824, 0, 1,
-1.431361, -2.540615, -1.182405, 1, 0.509804, 0, 1,
-1.430095, 0.3922139, -1.005737, 1, 0.5176471, 0, 1,
-1.410699, 1.113868, -1.070759, 1, 0.5215687, 0, 1,
-1.397181, 0.3727224, -1.357038, 1, 0.5294118, 0, 1,
-1.396888, 0.462135, -1.768125, 1, 0.5333334, 0, 1,
-1.386306, -0.344641, -1.939817, 1, 0.5411765, 0, 1,
-1.380559, 0.2812797, -0.01447195, 1, 0.5450981, 0, 1,
-1.371948, -0.4864086, -1.703425, 1, 0.5529412, 0, 1,
-1.36174, 0.6432504, -0.5017845, 1, 0.5568628, 0, 1,
-1.359605, -0.3329585, -1.237588, 1, 0.5647059, 0, 1,
-1.356107, -0.5920709, -0.8753774, 1, 0.5686275, 0, 1,
-1.354658, -1.980999, -4.001446, 1, 0.5764706, 0, 1,
-1.353018, -0.3720357, -2.133682, 1, 0.5803922, 0, 1,
-1.349596, 1.13808, -1.152017, 1, 0.5882353, 0, 1,
-1.345104, -1.397365, -3.367633, 1, 0.5921569, 0, 1,
-1.336644, -0.6834986, -1.96605, 1, 0.6, 0, 1,
-1.319583, -2.046727, -4.10357, 1, 0.6078432, 0, 1,
-1.316649, -0.9598525, -1.516908, 1, 0.6117647, 0, 1,
-1.309526, -0.4256454, -2.985145, 1, 0.6196079, 0, 1,
-1.30261, -0.6139755, -1.90494, 1, 0.6235294, 0, 1,
-1.30006, -2.126293, -2.072742, 1, 0.6313726, 0, 1,
-1.291036, 1.83544, 2.561314, 1, 0.6352941, 0, 1,
-1.286934, -0.3035469, -1.540891, 1, 0.6431373, 0, 1,
-1.280064, 0.8814843, -0.04877775, 1, 0.6470588, 0, 1,
-1.277308, 0.1302587, -1.676842, 1, 0.654902, 0, 1,
-1.271742, -0.3321927, -4.101538, 1, 0.6588235, 0, 1,
-1.251289, 0.8157846, -1.28357, 1, 0.6666667, 0, 1,
-1.246483, 0.02676518, -0.4124264, 1, 0.6705883, 0, 1,
-1.241108, 0.9930525, -1.354186, 1, 0.6784314, 0, 1,
-1.238793, -1.748136, -4.270987, 1, 0.682353, 0, 1,
-1.236404, -1.785799, -2.855319, 1, 0.6901961, 0, 1,
-1.232809, 1.271779, -2.165272, 1, 0.6941177, 0, 1,
-1.223731, 1.362839, -1.283371, 1, 0.7019608, 0, 1,
-1.223388, -1.720207, -4.706048, 1, 0.7098039, 0, 1,
-1.207384, 0.4270222, -1.508807, 1, 0.7137255, 0, 1,
-1.204852, -2.60349, -1.19944, 1, 0.7215686, 0, 1,
-1.193582, -0.8481889, -1.176249, 1, 0.7254902, 0, 1,
-1.183719, 0.2394868, -2.410464, 1, 0.7333333, 0, 1,
-1.182832, -0.8996868, 0.1883934, 1, 0.7372549, 0, 1,
-1.181411, -0.3548167, -1.516623, 1, 0.7450981, 0, 1,
-1.177833, -0.8713129, -2.188273, 1, 0.7490196, 0, 1,
-1.177423, 1.116782, -1.404809, 1, 0.7568628, 0, 1,
-1.174981, -1.794942, -0.7201379, 1, 0.7607843, 0, 1,
-1.171161, -0.5795163, -1.564054, 1, 0.7686275, 0, 1,
-1.164013, -0.1957811, -1.152018, 1, 0.772549, 0, 1,
-1.157426, 1.893465, -0.3205783, 1, 0.7803922, 0, 1,
-1.155438, -1.178769, -0.4030546, 1, 0.7843137, 0, 1,
-1.153976, -0.7650422, -1.078485, 1, 0.7921569, 0, 1,
-1.149785, -1.115587, -2.936143, 1, 0.7960784, 0, 1,
-1.146634, -1.957424, -1.814744, 1, 0.8039216, 0, 1,
-1.143256, 0.5020012, -1.799555, 1, 0.8117647, 0, 1,
-1.141314, -1.173218, -2.186064, 1, 0.8156863, 0, 1,
-1.139768, -0.05693753, -2.286989, 1, 0.8235294, 0, 1,
-1.13742, 1.293487, -0.8260766, 1, 0.827451, 0, 1,
-1.136062, -0.00613727, 1.003706, 1, 0.8352941, 0, 1,
-1.132658, -0.3160899, -1.899537, 1, 0.8392157, 0, 1,
-1.132146, -0.8240927, -2.212902, 1, 0.8470588, 0, 1,
-1.128281, 0.1916774, -1.144844, 1, 0.8509804, 0, 1,
-1.128154, 0.6907254, -3.692743, 1, 0.8588235, 0, 1,
-1.124315, 2.674644, -0.06057649, 1, 0.8627451, 0, 1,
-1.110781, -0.5104064, -4.393865, 1, 0.8705882, 0, 1,
-1.109578, 0.1191912, -1.739086, 1, 0.8745098, 0, 1,
-1.106686, -1.035522, -2.975966, 1, 0.8823529, 0, 1,
-1.105619, -1.124941, -2.036359, 1, 0.8862745, 0, 1,
-1.100494, -0.3165994, -1.027704, 1, 0.8941177, 0, 1,
-1.095335, -0.9117832, -1.900146, 1, 0.8980392, 0, 1,
-1.093635, -0.2018999, 0.0260628, 1, 0.9058824, 0, 1,
-1.090148, -1.730279, -1.53999, 1, 0.9137255, 0, 1,
-1.089823, -1.145894, -3.574822, 1, 0.9176471, 0, 1,
-1.088457, 0.7028551, -1.801579, 1, 0.9254902, 0, 1,
-1.079438, -0.2679965, -0.7159978, 1, 0.9294118, 0, 1,
-1.076807, -1.13202, -1.699579, 1, 0.9372549, 0, 1,
-1.068565, 0.09543164, -1.517665, 1, 0.9411765, 0, 1,
-1.066093, -0.4267517, -1.615546, 1, 0.9490196, 0, 1,
-1.063292, -1.134156, -0.47385, 1, 0.9529412, 0, 1,
-1.061884, 0.7008, -0.8674673, 1, 0.9607843, 0, 1,
-1.055533, -1.757655, -1.002501, 1, 0.9647059, 0, 1,
-1.054474, -0.2095933, -1.262837, 1, 0.972549, 0, 1,
-1.053061, 2.038952, 0.2397466, 1, 0.9764706, 0, 1,
-1.041685, -0.4592421, -1.872453, 1, 0.9843137, 0, 1,
-1.035315, -1.007465, -4.240761, 1, 0.9882353, 0, 1,
-1.033455, -0.9217433, -1.972606, 1, 0.9960784, 0, 1,
-1.031918, -2.113153, -3.850011, 0.9960784, 1, 0, 1,
-1.030269, 1.085751, -0.648024, 0.9921569, 1, 0, 1,
-1.030067, 0.9225795, -1.491997, 0.9843137, 1, 0, 1,
-1.023772, -1.170359, -2.20315, 0.9803922, 1, 0, 1,
-1.020851, -0.8157977, -1.532078, 0.972549, 1, 0, 1,
-1.017464, -1.336708, -1.317999, 0.9686275, 1, 0, 1,
-1.014927, -0.5435658, -1.993833, 0.9607843, 1, 0, 1,
-1.01056, -2.128387, -3.862104, 0.9568627, 1, 0, 1,
-1.000714, -0.9228543, -3.480148, 0.9490196, 1, 0, 1,
-0.9960743, 0.5116965, 0.4052556, 0.945098, 1, 0, 1,
-0.989605, -1.298785, -5.097466, 0.9372549, 1, 0, 1,
-0.9890032, 0.4540607, -1.803896, 0.9333333, 1, 0, 1,
-0.9773265, 0.1928285, -1.550662, 0.9254902, 1, 0, 1,
-0.9724358, -0.9298325, -2.725879, 0.9215686, 1, 0, 1,
-0.964919, 0.1124447, -2.676431, 0.9137255, 1, 0, 1,
-0.962503, -0.131545, -2.682967, 0.9098039, 1, 0, 1,
-0.9614577, -1.651044, -2.045282, 0.9019608, 1, 0, 1,
-0.9550709, -0.2538348, 0.06291918, 0.8941177, 1, 0, 1,
-0.9521787, 0.2127177, -2.127342, 0.8901961, 1, 0, 1,
-0.9514745, 1.347931, -1.010805, 0.8823529, 1, 0, 1,
-0.945933, 1.237561, 0.5915533, 0.8784314, 1, 0, 1,
-0.9446681, 0.07145111, -1.258325, 0.8705882, 1, 0, 1,
-0.9439293, -0.9675874, -1.771805, 0.8666667, 1, 0, 1,
-0.9385652, 1.89047, -1.6503, 0.8588235, 1, 0, 1,
-0.935875, 0.02183558, -0.5576031, 0.854902, 1, 0, 1,
-0.9239042, 0.1412113, -0.1184837, 0.8470588, 1, 0, 1,
-0.922721, -0.7744715, -2.550589, 0.8431373, 1, 0, 1,
-0.9223686, -0.5382202, -1.747792, 0.8352941, 1, 0, 1,
-0.9210742, -0.1499918, -2.126058, 0.8313726, 1, 0, 1,
-0.9180748, -1.6366, -2.517113, 0.8235294, 1, 0, 1,
-0.9179108, 0.7721245, -1.657327, 0.8196079, 1, 0, 1,
-0.9174767, 0.396972, -0.5199336, 0.8117647, 1, 0, 1,
-0.915113, -0.2958041, -2.534206, 0.8078431, 1, 0, 1,
-0.9034026, -1.624169, -2.819708, 0.8, 1, 0, 1,
-0.8969393, -0.2575826, -1.522888, 0.7921569, 1, 0, 1,
-0.8956237, 1.764323, -2.125047, 0.7882353, 1, 0, 1,
-0.884885, -0.376234, -4.05232, 0.7803922, 1, 0, 1,
-0.8809883, -0.01442029, -3.744273, 0.7764706, 1, 0, 1,
-0.8783742, 0.3547748, -2.848118, 0.7686275, 1, 0, 1,
-0.8690307, 0.07312292, -1.111601, 0.7647059, 1, 0, 1,
-0.8618221, -0.5967931, 0.01883478, 0.7568628, 1, 0, 1,
-0.858088, 1.096626, 0.7193167, 0.7529412, 1, 0, 1,
-0.8449398, 0.2293033, -1.208403, 0.7450981, 1, 0, 1,
-0.8430458, -1.026737, -1.579367, 0.7411765, 1, 0, 1,
-0.8366376, -1.579945, -2.33274, 0.7333333, 1, 0, 1,
-0.8278945, -0.02334776, -1.085526, 0.7294118, 1, 0, 1,
-0.8236902, 0.5254187, -0.1310588, 0.7215686, 1, 0, 1,
-0.8191289, -0.8804839, -1.001687, 0.7176471, 1, 0, 1,
-0.8139444, 1.402504, -0.8931276, 0.7098039, 1, 0, 1,
-0.8031914, -0.1810631, -2.554859, 0.7058824, 1, 0, 1,
-0.8010999, 1.285678, 1.096563, 0.6980392, 1, 0, 1,
-0.7958559, -0.2149542, -2.83903, 0.6901961, 1, 0, 1,
-0.7868026, -0.9021735, -3.589913, 0.6862745, 1, 0, 1,
-0.7860128, 0.03535214, -1.413864, 0.6784314, 1, 0, 1,
-0.7852762, -1.368953, -3.638793, 0.6745098, 1, 0, 1,
-0.7808942, 0.6467969, 0.1598653, 0.6666667, 1, 0, 1,
-0.7750535, 1.146576, -1.288075, 0.6627451, 1, 0, 1,
-0.7745658, 1.435894, -0.1234046, 0.654902, 1, 0, 1,
-0.7695194, -0.2737385, -2.729023, 0.6509804, 1, 0, 1,
-0.7618341, -0.510231, -2.955398, 0.6431373, 1, 0, 1,
-0.7586102, -2.635595, -2.969497, 0.6392157, 1, 0, 1,
-0.7568262, 0.5511407, -1.05993, 0.6313726, 1, 0, 1,
-0.7562762, -0.6009821, -2.70876, 0.627451, 1, 0, 1,
-0.7558222, 1.055431, -1.095771, 0.6196079, 1, 0, 1,
-0.7530324, -1.393548, -2.994087, 0.6156863, 1, 0, 1,
-0.7459958, -0.01003434, -1.698221, 0.6078432, 1, 0, 1,
-0.7430812, -0.2548241, -2.423586, 0.6039216, 1, 0, 1,
-0.7372892, 0.4438651, -2.824788, 0.5960785, 1, 0, 1,
-0.7365059, 1.291268, -2.207824, 0.5882353, 1, 0, 1,
-0.7363533, 0.845467, -2.185371, 0.5843138, 1, 0, 1,
-0.7361404, -0.500569, -2.848897, 0.5764706, 1, 0, 1,
-0.7342141, -0.3013472, -1.625056, 0.572549, 1, 0, 1,
-0.7164068, 0.1868303, -0.3228981, 0.5647059, 1, 0, 1,
-0.7137401, -1.003813, -1.648717, 0.5607843, 1, 0, 1,
-0.7108068, 2.024057, -0.3750377, 0.5529412, 1, 0, 1,
-0.710795, 1.325005, -1.330484, 0.5490196, 1, 0, 1,
-0.7106905, -1.458939, -3.119489, 0.5411765, 1, 0, 1,
-0.7105577, 0.004063149, -3.195621, 0.5372549, 1, 0, 1,
-0.7080177, 0.6425347, -1.93462, 0.5294118, 1, 0, 1,
-0.7069821, -0.3746186, -3.081381, 0.5254902, 1, 0, 1,
-0.7065817, -0.2102341, -3.127679, 0.5176471, 1, 0, 1,
-0.7045128, 0.9715039, -1.434025, 0.5137255, 1, 0, 1,
-0.7008402, 0.6512663, 0.9523954, 0.5058824, 1, 0, 1,
-0.6961883, -1.021351, -2.728752, 0.5019608, 1, 0, 1,
-0.6940215, 0.7567651, -0.4249941, 0.4941176, 1, 0, 1,
-0.6915194, 0.5117114, 0.4301694, 0.4862745, 1, 0, 1,
-0.6873825, -1.059754, -1.473592, 0.4823529, 1, 0, 1,
-0.6831958, 1.03752, -3.731918, 0.4745098, 1, 0, 1,
-0.6801994, 0.02363546, -2.650705, 0.4705882, 1, 0, 1,
-0.6579881, 0.0899931, -0.3952821, 0.4627451, 1, 0, 1,
-0.6579027, 0.4595344, -0.2585058, 0.4588235, 1, 0, 1,
-0.656248, -1.012532, -2.872533, 0.4509804, 1, 0, 1,
-0.6551383, 1.016257, -1.206181, 0.4470588, 1, 0, 1,
-0.6516005, 1.400464, -1.287468, 0.4392157, 1, 0, 1,
-0.6468208, -1.762512, -0.9624946, 0.4352941, 1, 0, 1,
-0.6381289, -0.6378901, -2.693556, 0.427451, 1, 0, 1,
-0.6353114, -0.4431145, -2.664391, 0.4235294, 1, 0, 1,
-0.6319601, 0.4278271, -0.4206761, 0.4156863, 1, 0, 1,
-0.6318069, 0.07006883, -1.70261, 0.4117647, 1, 0, 1,
-0.6295167, 1.224015, 0.4303916, 0.4039216, 1, 0, 1,
-0.6259459, -0.5892894, -0.6567463, 0.3960784, 1, 0, 1,
-0.6205734, 1.599376, -1.719185, 0.3921569, 1, 0, 1,
-0.6188219, 0.6771149, -2.490634, 0.3843137, 1, 0, 1,
-0.6176552, 0.5990475, -0.2682321, 0.3803922, 1, 0, 1,
-0.6169903, -0.09881085, -0.1199872, 0.372549, 1, 0, 1,
-0.6121202, -0.1933029, -0.1292842, 0.3686275, 1, 0, 1,
-0.6120488, 0.1867342, -1.98432, 0.3607843, 1, 0, 1,
-0.6072575, 1.505531, -0.919889, 0.3568628, 1, 0, 1,
-0.6048577, -0.5121025, -1.61978, 0.3490196, 1, 0, 1,
-0.6042418, -0.08686922, -2.515917, 0.345098, 1, 0, 1,
-0.6029226, -0.08106235, -2.476241, 0.3372549, 1, 0, 1,
-0.6026945, 0.05291753, -2.778688, 0.3333333, 1, 0, 1,
-0.5972856, -1.122279, -4.463378, 0.3254902, 1, 0, 1,
-0.5926329, 0.3139651, -1.033346, 0.3215686, 1, 0, 1,
-0.5907394, -1.844956, -3.109532, 0.3137255, 1, 0, 1,
-0.5881157, 0.005984284, -1.321613, 0.3098039, 1, 0, 1,
-0.5867093, 0.5339868, -2.190094, 0.3019608, 1, 0, 1,
-0.5818383, 0.6762999, -1.471825, 0.2941177, 1, 0, 1,
-0.581812, 1.875578, -0.3985466, 0.2901961, 1, 0, 1,
-0.5810277, -1.002476, -2.739154, 0.282353, 1, 0, 1,
-0.5800602, -0.4185104, -1.002718, 0.2784314, 1, 0, 1,
-0.5785709, -0.7681966, -2.743181, 0.2705882, 1, 0, 1,
-0.5706177, 1.410142, -1.074748, 0.2666667, 1, 0, 1,
-0.5688564, -0.638875, -3.350018, 0.2588235, 1, 0, 1,
-0.5658534, 0.4185404, -1.757426, 0.254902, 1, 0, 1,
-0.559965, -0.1313738, -1.465556, 0.2470588, 1, 0, 1,
-0.5578659, -0.6336631, -2.25264, 0.2431373, 1, 0, 1,
-0.5559422, 1.319667, -0.596831, 0.2352941, 1, 0, 1,
-0.5556402, -1.348984, -4.936954, 0.2313726, 1, 0, 1,
-0.5407425, 1.558009, -0.3503296, 0.2235294, 1, 0, 1,
-0.5365582, -0.2476481, -3.171587, 0.2196078, 1, 0, 1,
-0.5328262, 1.441255, -2.308988, 0.2117647, 1, 0, 1,
-0.5308673, -0.1849877, -0.8458165, 0.2078431, 1, 0, 1,
-0.5295995, -0.9029788, -1.906886, 0.2, 1, 0, 1,
-0.5293656, 0.4072653, 0.4620138, 0.1921569, 1, 0, 1,
-0.5277741, 0.1088187, -0.859221, 0.1882353, 1, 0, 1,
-0.5274706, 0.4620083, 0.2115384, 0.1803922, 1, 0, 1,
-0.5266904, -1.039936, -2.156044, 0.1764706, 1, 0, 1,
-0.5242508, 1.582601, 1.067674, 0.1686275, 1, 0, 1,
-0.5224453, -1.746878, -2.539747, 0.1647059, 1, 0, 1,
-0.5197707, 0.702108, 0.1831093, 0.1568628, 1, 0, 1,
-0.5156876, -0.1988633, -2.809519, 0.1529412, 1, 0, 1,
-0.5156697, 0.217619, -1.70097, 0.145098, 1, 0, 1,
-0.5147921, 0.03434172, -2.548362, 0.1411765, 1, 0, 1,
-0.5117864, 0.9408277, 0.6721618, 0.1333333, 1, 0, 1,
-0.5089819, -1.48711, -3.557341, 0.1294118, 1, 0, 1,
-0.5080993, -0.2938731, -3.220838, 0.1215686, 1, 0, 1,
-0.5015329, -1.003837, -2.132543, 0.1176471, 1, 0, 1,
-0.4998629, 0.4193825, -1.094777, 0.1098039, 1, 0, 1,
-0.4970619, 1.486263, -0.8847576, 0.1058824, 1, 0, 1,
-0.4961199, -1.114907, -1.437836, 0.09803922, 1, 0, 1,
-0.4929132, 0.1245171, -1.594657, 0.09019608, 1, 0, 1,
-0.4923918, -2.394305, -3.073951, 0.08627451, 1, 0, 1,
-0.4903332, -0.8027139, -0.6525887, 0.07843138, 1, 0, 1,
-0.4899245, 0.7618313, 0.9176483, 0.07450981, 1, 0, 1,
-0.4897675, -0.809542, -2.810278, 0.06666667, 1, 0, 1,
-0.4881418, -1.47024, -3.540186, 0.0627451, 1, 0, 1,
-0.4844598, -0.307173, -1.398327, 0.05490196, 1, 0, 1,
-0.4833337, 0.4207096, -1.00217, 0.05098039, 1, 0, 1,
-0.4807456, 2.250639, 0.1761973, 0.04313726, 1, 0, 1,
-0.4688188, 0.696852, 0.170425, 0.03921569, 1, 0, 1,
-0.468593, 0.4774903, -1.03472, 0.03137255, 1, 0, 1,
-0.4666402, 1.458781, 0.7931038, 0.02745098, 1, 0, 1,
-0.46444, -0.3053666, -0.5315022, 0.01960784, 1, 0, 1,
-0.45918, -1.06077, -2.409683, 0.01568628, 1, 0, 1,
-0.4544464, -0.6883397, -3.893874, 0.007843138, 1, 0, 1,
-0.45377, 0.8044761, -0.3192666, 0.003921569, 1, 0, 1,
-0.4532202, 1.037527, -0.4359153, 0, 1, 0.003921569, 1,
-0.4505759, -0.4317432, -4.883759, 0, 1, 0.01176471, 1,
-0.4443537, -1.947307, -2.712409, 0, 1, 0.01568628, 1,
-0.4442917, -0.3875982, -2.015348, 0, 1, 0.02352941, 1,
-0.4410777, 0.2053889, -1.87691, 0, 1, 0.02745098, 1,
-0.4365558, -0.9209731, -3.604424, 0, 1, 0.03529412, 1,
-0.4364677, -0.2516188, -2.736259, 0, 1, 0.03921569, 1,
-0.4357944, 1.274917, -0.06431314, 0, 1, 0.04705882, 1,
-0.4282676, -1.039861, -1.654673, 0, 1, 0.05098039, 1,
-0.4258531, 1.532347, -0.2959571, 0, 1, 0.05882353, 1,
-0.4226622, -1.237319, -2.323511, 0, 1, 0.0627451, 1,
-0.4220027, -0.5670028, -3.397425, 0, 1, 0.07058824, 1,
-0.4185204, -0.295831, -3.636714, 0, 1, 0.07450981, 1,
-0.4180495, -0.4027652, -3.68664, 0, 1, 0.08235294, 1,
-0.4135804, 0.1069846, -2.138843, 0, 1, 0.08627451, 1,
-0.4085722, -0.1910435, -3.712715, 0, 1, 0.09411765, 1,
-0.4030638, 0.6595019, 1.416597, 0, 1, 0.1019608, 1,
-0.4020242, -1.827697, -2.229367, 0, 1, 0.1058824, 1,
-0.399206, -0.03245113, -0.9051383, 0, 1, 0.1137255, 1,
-0.3974789, -0.3134251, -4.054251, 0, 1, 0.1176471, 1,
-0.3804465, 1.079597, 0.1267129, 0, 1, 0.1254902, 1,
-0.3764516, 0.165956, -0.3362533, 0, 1, 0.1294118, 1,
-0.3752233, 1.128957, -0.0617723, 0, 1, 0.1372549, 1,
-0.3742263, -0.2103813, -4.959036, 0, 1, 0.1411765, 1,
-0.374177, -0.3800439, -3.357385, 0, 1, 0.1490196, 1,
-0.3714071, -0.1310096, -0.8095444, 0, 1, 0.1529412, 1,
-0.3682372, -1.765681, -3.084261, 0, 1, 0.1607843, 1,
-0.367815, 0.4650882, -0.5336177, 0, 1, 0.1647059, 1,
-0.367326, 0.4130942, -0.5060996, 0, 1, 0.172549, 1,
-0.3667729, 0.8541516, -0.5388574, 0, 1, 0.1764706, 1,
-0.3657064, 0.1016756, -2.131559, 0, 1, 0.1843137, 1,
-0.3650097, -1.048052, -3.41906, 0, 1, 0.1882353, 1,
-0.3647799, 0.8874463, 0.0923638, 0, 1, 0.1960784, 1,
-0.3636996, 0.5534872, -0.4039899, 0, 1, 0.2039216, 1,
-0.3632633, 0.5683704, -0.4793957, 0, 1, 0.2078431, 1,
-0.3620073, -0.1070018, -2.596343, 0, 1, 0.2156863, 1,
-0.3524242, -0.5816865, -2.023611, 0, 1, 0.2196078, 1,
-0.3508347, -0.1445551, -1.975864, 0, 1, 0.227451, 1,
-0.350702, 0.7670525, -0.3582678, 0, 1, 0.2313726, 1,
-0.3504403, -0.007368779, -2.761447, 0, 1, 0.2392157, 1,
-0.347847, 1.967687, 1.179563, 0, 1, 0.2431373, 1,
-0.3463331, -1.438221, -2.165901, 0, 1, 0.2509804, 1,
-0.3460236, 1.47175, 0.09860947, 0, 1, 0.254902, 1,
-0.344899, 1.647582, 0.1735026, 0, 1, 0.2627451, 1,
-0.3418812, -0.6439872, -2.469467, 0, 1, 0.2666667, 1,
-0.3409338, -2.782587, -2.741031, 0, 1, 0.2745098, 1,
-0.3405645, 0.4983072, -1.367247, 0, 1, 0.2784314, 1,
-0.3389281, -0.1452194, -0.7468609, 0, 1, 0.2862745, 1,
-0.3248172, 1.521935, 0.6824546, 0, 1, 0.2901961, 1,
-0.323612, 0.5242963, -0.005653768, 0, 1, 0.2980392, 1,
-0.3204542, 0.7906591, -0.6579973, 0, 1, 0.3058824, 1,
-0.3198444, 0.1680644, -0.4601804, 0, 1, 0.3098039, 1,
-0.3195067, -0.3131461, -3.260707, 0, 1, 0.3176471, 1,
-0.3195016, 1.038415, -1.82344, 0, 1, 0.3215686, 1,
-0.3157626, -0.08347072, -1.719897, 0, 1, 0.3294118, 1,
-0.3134469, -1.827454, -4.072525, 0, 1, 0.3333333, 1,
-0.3071651, -1.243438, -3.86464, 0, 1, 0.3411765, 1,
-0.3033245, 2.245799, -0.6320464, 0, 1, 0.345098, 1,
-0.3012277, -1.139379, -2.675949, 0, 1, 0.3529412, 1,
-0.2995768, 0.4648844, -1.843893, 0, 1, 0.3568628, 1,
-0.2993569, -0.04732119, -0.2333294, 0, 1, 0.3647059, 1,
-0.2981487, -1.080505, -1.421955, 0, 1, 0.3686275, 1,
-0.294412, 1.209291, 0.8095109, 0, 1, 0.3764706, 1,
-0.2886209, 0.002001607, -1.075455, 0, 1, 0.3803922, 1,
-0.2853853, -1.247918, -3.63913, 0, 1, 0.3882353, 1,
-0.28133, 0.2837369, -1.778924, 0, 1, 0.3921569, 1,
-0.2760343, -0.6438022, -2.426884, 0, 1, 0.4, 1,
-0.2754395, 2.443064, 0.7322946, 0, 1, 0.4078431, 1,
-0.2737797, 0.4232295, -0.7329705, 0, 1, 0.4117647, 1,
-0.2725385, 0.1575722, -0.2265221, 0, 1, 0.4196078, 1,
-0.2691346, -2.027758, -2.398647, 0, 1, 0.4235294, 1,
-0.2646072, 0.3186191, 0.1809678, 0, 1, 0.4313726, 1,
-0.2640123, -0.9831196, -1.983088, 0, 1, 0.4352941, 1,
-0.2629203, 0.377201, -1.379912, 0, 1, 0.4431373, 1,
-0.2626686, 0.3002374, -1.690862, 0, 1, 0.4470588, 1,
-0.2602188, -3.039469, -1.992052, 0, 1, 0.454902, 1,
-0.2596601, 0.5259763, 0.1292411, 0, 1, 0.4588235, 1,
-0.2581804, -0.4010427, -3.645213, 0, 1, 0.4666667, 1,
-0.2556358, 1.085719, -0.7578248, 0, 1, 0.4705882, 1,
-0.2544388, -0.1898665, -2.71584, 0, 1, 0.4784314, 1,
-0.2505346, 0.5630908, -0.953971, 0, 1, 0.4823529, 1,
-0.2505229, 1.003405, -0.6471432, 0, 1, 0.4901961, 1,
-0.2412543, 0.2143916, -0.128277, 0, 1, 0.4941176, 1,
-0.2399945, 1.399927, 0.3860657, 0, 1, 0.5019608, 1,
-0.2366223, -0.9398388, -5.049436, 0, 1, 0.509804, 1,
-0.2361391, -0.005180675, -2.400483, 0, 1, 0.5137255, 1,
-0.2324628, 1.096981, 0.6124935, 0, 1, 0.5215687, 1,
-0.2302947, -0.5658947, -2.536608, 0, 1, 0.5254902, 1,
-0.2288269, -1.870429, -5.784754, 0, 1, 0.5333334, 1,
-0.2257943, -0.0889704, -1.6859, 0, 1, 0.5372549, 1,
-0.2245687, 0.1917545, -2.768775, 0, 1, 0.5450981, 1,
-0.2238, -1.03082, -3.092854, 0, 1, 0.5490196, 1,
-0.2237419, -0.7699819, -2.51339, 0, 1, 0.5568628, 1,
-0.2221962, -0.5999054, -2.298172, 0, 1, 0.5607843, 1,
-0.2220346, 0.7619392, -0.8653097, 0, 1, 0.5686275, 1,
-0.2188844, 1.367086, 0.349004, 0, 1, 0.572549, 1,
-0.2154011, 1.09659, 0.1783812, 0, 1, 0.5803922, 1,
-0.2130827, 0.9741383, 0.3622406, 0, 1, 0.5843138, 1,
-0.2125541, -1.636036, -2.9427, 0, 1, 0.5921569, 1,
-0.209618, 1.079098, -0.07585289, 0, 1, 0.5960785, 1,
-0.2074602, -0.218225, -2.280827, 0, 1, 0.6039216, 1,
-0.2035035, -0.9852726, -3.279806, 0, 1, 0.6117647, 1,
-0.2025443, -0.4701379, -3.338629, 0, 1, 0.6156863, 1,
-0.1998934, 2.024808, -0.5185939, 0, 1, 0.6235294, 1,
-0.1995302, -0.7634487, -2.462369, 0, 1, 0.627451, 1,
-0.1965188, -0.01841373, -3.212022, 0, 1, 0.6352941, 1,
-0.1935773, -0.7037165, -4.295136, 0, 1, 0.6392157, 1,
-0.1929699, 1.64687, 0.3965493, 0, 1, 0.6470588, 1,
-0.1881183, -0.6737533, -2.875422, 0, 1, 0.6509804, 1,
-0.1863908, -0.8628479, -1.642378, 0, 1, 0.6588235, 1,
-0.1796206, -0.5722392, -4.331909, 0, 1, 0.6627451, 1,
-0.174296, 0.2762072, 0.970714, 0, 1, 0.6705883, 1,
-0.1718858, 1.883162, -0.3668693, 0, 1, 0.6745098, 1,
-0.1684554, -0.6068844, -4.438298, 0, 1, 0.682353, 1,
-0.1610568, -0.7207232, -3.185963, 0, 1, 0.6862745, 1,
-0.158572, 1.023688, -2.122451, 0, 1, 0.6941177, 1,
-0.1584522, 0.9009516, -2.119827, 0, 1, 0.7019608, 1,
-0.1583447, -0.4331476, -2.689133, 0, 1, 0.7058824, 1,
-0.1516527, 1.070918, -0.7948176, 0, 1, 0.7137255, 1,
-0.1513046, -1.253549, -4.251294, 0, 1, 0.7176471, 1,
-0.150368, -0.2407417, -2.781159, 0, 1, 0.7254902, 1,
-0.1483694, 0.5191619, 0.6296846, 0, 1, 0.7294118, 1,
-0.1435572, -1.011051, -3.170248, 0, 1, 0.7372549, 1,
-0.1431116, 0.02590035, -0.6105949, 0, 1, 0.7411765, 1,
-0.1424941, -1.50923, -4.221148, 0, 1, 0.7490196, 1,
-0.1381034, -0.1311807, -3.370239, 0, 1, 0.7529412, 1,
-0.1328603, -0.2184912, -2.069335, 0, 1, 0.7607843, 1,
-0.1300613, 0.1499991, -0.7890781, 0, 1, 0.7647059, 1,
-0.1282487, -2.365656, -2.545693, 0, 1, 0.772549, 1,
-0.1269026, 0.1131089, -1.613118, 0, 1, 0.7764706, 1,
-0.122628, -1.40351, -3.955436, 0, 1, 0.7843137, 1,
-0.1148128, 0.437647, 0.3153887, 0, 1, 0.7882353, 1,
-0.1145265, 0.4246009, -0.4598134, 0, 1, 0.7960784, 1,
-0.1135366, -0.7094171, -4.232796, 0, 1, 0.8039216, 1,
-0.1126535, -0.8876205, -3.476071, 0, 1, 0.8078431, 1,
-0.1119997, 0.3183646, -0.8113013, 0, 1, 0.8156863, 1,
-0.1117745, -0.09851837, -3.413564, 0, 1, 0.8196079, 1,
-0.111658, 1.537668, -1.096584, 0, 1, 0.827451, 1,
-0.1084492, -0.3895068, -3.071182, 0, 1, 0.8313726, 1,
-0.1057744, 0.1432465, -0.2361624, 0, 1, 0.8392157, 1,
-0.101868, -1.331128, -2.031953, 0, 1, 0.8431373, 1,
-0.09782343, -0.06132888, -1.746175, 0, 1, 0.8509804, 1,
-0.09511084, 0.7391474, -0.9858465, 0, 1, 0.854902, 1,
-0.09468911, 0.6412237, 0.9925175, 0, 1, 0.8627451, 1,
-0.09458811, 1.236982, -0.04376273, 0, 1, 0.8666667, 1,
-0.09418605, 0.3310738, -0.1099519, 0, 1, 0.8745098, 1,
-0.0930866, -0.8174484, -2.430976, 0, 1, 0.8784314, 1,
-0.08964276, -1.366714, -3.765965, 0, 1, 0.8862745, 1,
-0.08952809, 2.591111, -0.2659377, 0, 1, 0.8901961, 1,
-0.08939534, 0.1935065, 0.2766516, 0, 1, 0.8980392, 1,
-0.08701508, 1.251635, -1.080677, 0, 1, 0.9058824, 1,
-0.0753585, 0.01738372, -1.256527, 0, 1, 0.9098039, 1,
-0.07057399, -0.6125923, -2.645756, 0, 1, 0.9176471, 1,
-0.06562036, 0.5400847, 0.06356262, 0, 1, 0.9215686, 1,
-0.06436407, -2.151617, -1.849222, 0, 1, 0.9294118, 1,
-0.0635387, -1.355802, -2.781121, 0, 1, 0.9333333, 1,
-0.05289778, -0.5361156, -2.224337, 0, 1, 0.9411765, 1,
-0.05197151, 0.8784801, -0.4231668, 0, 1, 0.945098, 1,
-0.04919317, 0.5802668, -0.4261118, 0, 1, 0.9529412, 1,
-0.03670441, -0.4772843, -2.796661, 0, 1, 0.9568627, 1,
-0.03670128, -0.4547006, -2.654397, 0, 1, 0.9647059, 1,
-0.02902795, 0.4772872, -0.7738315, 0, 1, 0.9686275, 1,
-0.02790142, -0.1831724, -2.697036, 0, 1, 0.9764706, 1,
-0.02282937, 1.93826, -0.3691055, 0, 1, 0.9803922, 1,
-0.02264252, -0.3941979, -4.968987, 0, 1, 0.9882353, 1,
-0.02125492, -0.4269373, -1.774682, 0, 1, 0.9921569, 1,
-0.01872258, -0.7777044, -2.236089, 0, 1, 1, 1,
-0.01631103, -1.24955, -2.86692, 0, 0.9921569, 1, 1,
-0.01154283, 0.1146736, -0.9761326, 0, 0.9882353, 1, 1,
-0.01145168, 0.3622289, -0.19598, 0, 0.9803922, 1, 1,
-0.01028865, 1.337904, 1.034185, 0, 0.9764706, 1, 1,
-0.008742942, 1.307364, -0.7349382, 0, 0.9686275, 1, 1,
-0.007768083, -0.4944593, -1.962239, 0, 0.9647059, 1, 1,
-0.0004982208, -0.4672413, -2.719899, 0, 0.9568627, 1, 1,
0.004016052, 0.2073885, -0.107463, 0, 0.9529412, 1, 1,
0.00538019, -0.1952586, 2.814543, 0, 0.945098, 1, 1,
0.01317501, 1.602888, 0.03315501, 0, 0.9411765, 1, 1,
0.0146199, -0.2799102, 2.861514, 0, 0.9333333, 1, 1,
0.01682496, -1.969276, 2.83587, 0, 0.9294118, 1, 1,
0.02035585, 1.205418, -0.9752062, 0, 0.9215686, 1, 1,
0.02557861, -1.496562, 3.762165, 0, 0.9176471, 1, 1,
0.0258031, 0.09711546, 1.231985, 0, 0.9098039, 1, 1,
0.02610086, 0.354671, 1.22552, 0, 0.9058824, 1, 1,
0.02626536, -0.4855457, 2.899497, 0, 0.8980392, 1, 1,
0.03400112, 1.107906, 1.761387, 0, 0.8901961, 1, 1,
0.03558157, -0.0982749, 3.478842, 0, 0.8862745, 1, 1,
0.03701402, 0.1752142, 0.0378649, 0, 0.8784314, 1, 1,
0.03869677, 0.4951125, 1.359463, 0, 0.8745098, 1, 1,
0.03932662, -0.95559, 3.371506, 0, 0.8666667, 1, 1,
0.03934728, -0.7424012, 4.333711, 0, 0.8627451, 1, 1,
0.04175001, -0.1134861, 3.127058, 0, 0.854902, 1, 1,
0.04184671, -1.213138, 1.586086, 0, 0.8509804, 1, 1,
0.0477035, 0.1657253, 1.137138, 0, 0.8431373, 1, 1,
0.0477106, 1.300521, -0.5388779, 0, 0.8392157, 1, 1,
0.05114774, -0.7455868, 4.143452, 0, 0.8313726, 1, 1,
0.0520574, 0.07729235, 1.720416, 0, 0.827451, 1, 1,
0.05376864, -0.3122485, 4.395247, 0, 0.8196079, 1, 1,
0.05484379, -1.306173, 3.139421, 0, 0.8156863, 1, 1,
0.05600361, 0.5945817, -0.8035471, 0, 0.8078431, 1, 1,
0.06340923, -0.8045757, 4.322034, 0, 0.8039216, 1, 1,
0.07089423, 0.4317213, -1.193041, 0, 0.7960784, 1, 1,
0.07122377, -0.2642431, 2.865178, 0, 0.7882353, 1, 1,
0.07209794, 1.083625, -2.492306, 0, 0.7843137, 1, 1,
0.0766824, -1.170965, 0.6441985, 0, 0.7764706, 1, 1,
0.07692777, -2.457323, 3.157564, 0, 0.772549, 1, 1,
0.07867447, 1.441085, 0.1079494, 0, 0.7647059, 1, 1,
0.0826209, -1.200792, 2.615706, 0, 0.7607843, 1, 1,
0.08306147, 0.5511211, 0.2598362, 0, 0.7529412, 1, 1,
0.08829783, 0.7799874, 0.6551717, 0, 0.7490196, 1, 1,
0.09101778, -0.4456263, 2.396117, 0, 0.7411765, 1, 1,
0.09235421, -0.04358774, 3.782103, 0, 0.7372549, 1, 1,
0.0966024, 1.477241, 0.5567155, 0, 0.7294118, 1, 1,
0.1015199, 0.1946811, 0.003210836, 0, 0.7254902, 1, 1,
0.1066532, -1.806948, 4.132405, 0, 0.7176471, 1, 1,
0.1099519, -1.477246, 1.861553, 0, 0.7137255, 1, 1,
0.1126976, -0.3639793, 2.133345, 0, 0.7058824, 1, 1,
0.1149921, -1.772508, 3.572234, 0, 0.6980392, 1, 1,
0.1172313, 0.9257182, 0.6623427, 0, 0.6941177, 1, 1,
0.1173487, -1.038153, 3.078028, 0, 0.6862745, 1, 1,
0.1180488, 0.4169465, 0.1838455, 0, 0.682353, 1, 1,
0.1220708, -0.4373167, 3.193084, 0, 0.6745098, 1, 1,
0.1267034, 0.1233913, 0.6251227, 0, 0.6705883, 1, 1,
0.1312178, 0.2152962, 1.856828, 0, 0.6627451, 1, 1,
0.1356414, 1.294898, 1.254327, 0, 0.6588235, 1, 1,
0.1391372, 1.0541, -0.7917814, 0, 0.6509804, 1, 1,
0.1401665, -0.06535444, 1.466661, 0, 0.6470588, 1, 1,
0.1402413, -0.2963535, 1.810726, 0, 0.6392157, 1, 1,
0.1456175, -0.1186766, 3.431799, 0, 0.6352941, 1, 1,
0.1464717, 1.68587, -1.009689, 0, 0.627451, 1, 1,
0.148937, 0.9777555, -0.1513173, 0, 0.6235294, 1, 1,
0.1489372, -0.3544418, 1.858622, 0, 0.6156863, 1, 1,
0.1490683, 1.038289, -1.183219, 0, 0.6117647, 1, 1,
0.1512787, 1.087608, 0.9538831, 0, 0.6039216, 1, 1,
0.1559685, -0.4928498, 3.343004, 0, 0.5960785, 1, 1,
0.1570403, 1.598431, 0.6050363, 0, 0.5921569, 1, 1,
0.1628433, 0.8524871, -0.6854497, 0, 0.5843138, 1, 1,
0.1635774, 2.079948, 0.4631461, 0, 0.5803922, 1, 1,
0.164106, -1.097514, 3.611903, 0, 0.572549, 1, 1,
0.1648344, -0.4500428, 3.429525, 0, 0.5686275, 1, 1,
0.1650562, 0.07824365, 1.412047, 0, 0.5607843, 1, 1,
0.1653024, 1.624812, -0.01209327, 0, 0.5568628, 1, 1,
0.1695124, -1.071854, 3.201459, 0, 0.5490196, 1, 1,
0.1730317, -1.734211, 1.717046, 0, 0.5450981, 1, 1,
0.1748221, -0.5161519, 2.280882, 0, 0.5372549, 1, 1,
0.1756321, 0.4625545, 1.120382, 0, 0.5333334, 1, 1,
0.1767522, 0.3049823, 0.398398, 0, 0.5254902, 1, 1,
0.1776664, -0.549689, 2.395462, 0, 0.5215687, 1, 1,
0.1802397, -0.1062841, 1.136521, 0, 0.5137255, 1, 1,
0.1814083, -2.069231, 2.636549, 0, 0.509804, 1, 1,
0.1842878, 1.975222, -0.04019753, 0, 0.5019608, 1, 1,
0.1895545, 0.01728165, 2.150791, 0, 0.4941176, 1, 1,
0.1936659, -0.5559938, 1.676303, 0, 0.4901961, 1, 1,
0.1958156, 0.3513129, 0.1085093, 0, 0.4823529, 1, 1,
0.1967494, 0.2447354, -0.2821037, 0, 0.4784314, 1, 1,
0.2007592, 0.7546118, 1.470289, 0, 0.4705882, 1, 1,
0.2054001, -0.4221965, 3.891707, 0, 0.4666667, 1, 1,
0.2162523, 0.8817891, -0.3423172, 0, 0.4588235, 1, 1,
0.2170179, 1.682968, -0.4975713, 0, 0.454902, 1, 1,
0.2326149, 1.180018, -0.3724742, 0, 0.4470588, 1, 1,
0.235995, -0.6698189, 4.704082, 0, 0.4431373, 1, 1,
0.2374739, -1.686145, 2.369783, 0, 0.4352941, 1, 1,
0.2395221, 0.4976325, 0.02967082, 0, 0.4313726, 1, 1,
0.2419458, 0.3748626, 0.3339603, 0, 0.4235294, 1, 1,
0.2472716, -1.139487, 2.632755, 0, 0.4196078, 1, 1,
0.248246, -0.09752323, 2.783008, 0, 0.4117647, 1, 1,
0.249899, 0.2055187, 0.4118807, 0, 0.4078431, 1, 1,
0.2515313, -0.5070677, 2.849765, 0, 0.4, 1, 1,
0.2555207, -2.814906, 3.399691, 0, 0.3921569, 1, 1,
0.2568122, -1.40493, 1.664948, 0, 0.3882353, 1, 1,
0.2576636, 0.4932365, -0.3192688, 0, 0.3803922, 1, 1,
0.2591702, -0.1960531, 2.536557, 0, 0.3764706, 1, 1,
0.2593015, -0.3640625, 4.113516, 0, 0.3686275, 1, 1,
0.2599236, -0.8684533, 3.016471, 0, 0.3647059, 1, 1,
0.2646198, -0.3635752, 2.016764, 0, 0.3568628, 1, 1,
0.2672711, -0.967501, 3.530557, 0, 0.3529412, 1, 1,
0.2679089, 1.263631, -3.433637, 0, 0.345098, 1, 1,
0.271506, 0.8409665, -0.4294296, 0, 0.3411765, 1, 1,
0.2719983, 0.8599473, 0.5887905, 0, 0.3333333, 1, 1,
0.272468, 0.2469489, 2.168497, 0, 0.3294118, 1, 1,
0.2753727, -0.5571827, 4.180841, 0, 0.3215686, 1, 1,
0.2797492, 1.87402, 0.4244548, 0, 0.3176471, 1, 1,
0.2809471, 1.476528, -1.757022, 0, 0.3098039, 1, 1,
0.2825443, -1.989745, 3.323803, 0, 0.3058824, 1, 1,
0.2833215, -1.89499, 2.931266, 0, 0.2980392, 1, 1,
0.2837777, -1.008075, 1.915438, 0, 0.2901961, 1, 1,
0.2903527, 1.777028, 0.3119036, 0, 0.2862745, 1, 1,
0.2937689, -0.2452834, 3.062146, 0, 0.2784314, 1, 1,
0.2968483, 1.20384, 1.145661, 0, 0.2745098, 1, 1,
0.2972414, 1.08645, 0.2888812, 0, 0.2666667, 1, 1,
0.2987466, -1.195189, 3.190834, 0, 0.2627451, 1, 1,
0.2993176, -0.4862667, 2.726202, 0, 0.254902, 1, 1,
0.3015243, -1.072994, 3.892116, 0, 0.2509804, 1, 1,
0.3024585, 0.7435122, 1.127559, 0, 0.2431373, 1, 1,
0.3026907, -0.2979623, 3.448677, 0, 0.2392157, 1, 1,
0.3082753, -0.09698301, 1.284497, 0, 0.2313726, 1, 1,
0.3087893, -0.5174163, 1.564819, 0, 0.227451, 1, 1,
0.3096971, -1.019149, 3.70397, 0, 0.2196078, 1, 1,
0.3185901, 0.0004616523, 0.6300285, 0, 0.2156863, 1, 1,
0.3221906, -0.9910575, 2.064745, 0, 0.2078431, 1, 1,
0.322334, 1.201575, -0.4922731, 0, 0.2039216, 1, 1,
0.3232789, -1.951121, 2.082865, 0, 0.1960784, 1, 1,
0.3268544, 0.2971071, 0.2022955, 0, 0.1882353, 1, 1,
0.3271775, 0.1070969, 3.071797, 0, 0.1843137, 1, 1,
0.3354007, 0.4398983, -1.020333, 0, 0.1764706, 1, 1,
0.3422165, 0.6841136, -1.376132, 0, 0.172549, 1, 1,
0.343419, 0.6212395, 2.468349, 0, 0.1647059, 1, 1,
0.3624101, -0.5555003, 3.365672, 0, 0.1607843, 1, 1,
0.3682168, -1.78008, 5.486091, 0, 0.1529412, 1, 1,
0.3714864, -1.132249, 3.08601, 0, 0.1490196, 1, 1,
0.3808587, -0.8813912, 2.230926, 0, 0.1411765, 1, 1,
0.3860445, 0.4608403, -0.01549582, 0, 0.1372549, 1, 1,
0.3865739, -0.3245455, 2.741822, 0, 0.1294118, 1, 1,
0.3866363, 1.693418, -1.067662, 0, 0.1254902, 1, 1,
0.3886538, 0.3378887, -0.1063072, 0, 0.1176471, 1, 1,
0.390397, 0.9605524, 1.132949, 0, 0.1137255, 1, 1,
0.3988673, -0.7384453, 4.684494, 0, 0.1058824, 1, 1,
0.40099, -0.4888544, 3.519147, 0, 0.09803922, 1, 1,
0.400995, -0.5369121, 3.088668, 0, 0.09411765, 1, 1,
0.401125, 1.32149, -0.6100655, 0, 0.08627451, 1, 1,
0.4029979, 0.8222688, 0.6781647, 0, 0.08235294, 1, 1,
0.4030227, -1.317723, 4.505208, 0, 0.07450981, 1, 1,
0.4055542, 0.8630521, 2.41419, 0, 0.07058824, 1, 1,
0.4069851, 0.07495864, 2.492723, 0, 0.0627451, 1, 1,
0.4088081, 1.311667, -0.3605201, 0, 0.05882353, 1, 1,
0.4089005, -0.4995359, 1.004986, 0, 0.05098039, 1, 1,
0.4101936, 1.329667, -1.221453, 0, 0.04705882, 1, 1,
0.4111907, -0.6233849, 3.155596, 0, 0.03921569, 1, 1,
0.4112252, 0.7652872, -1.419985, 0, 0.03529412, 1, 1,
0.4182217, -0.157421, 2.458358, 0, 0.02745098, 1, 1,
0.4273935, -0.678991, 1.760061, 0, 0.02352941, 1, 1,
0.4292071, 0.5246142, 0.2569314, 0, 0.01568628, 1, 1,
0.4333098, -1.57091, 1.424717, 0, 0.01176471, 1, 1,
0.4357535, 0.5927122, 0.851949, 0, 0.003921569, 1, 1,
0.4361676, -0.113973, 2.715108, 0.003921569, 0, 1, 1,
0.4401402, -0.2013166, -0.3945765, 0.007843138, 0, 1, 1,
0.4410652, 2.035831, 1.349984, 0.01568628, 0, 1, 1,
0.442414, 0.6536443, 0.1825201, 0.01960784, 0, 1, 1,
0.443951, 0.4982987, 1.159649, 0.02745098, 0, 1, 1,
0.4473779, 1.108136, 0.2878632, 0.03137255, 0, 1, 1,
0.4490734, 0.2805822, 1.849189, 0.03921569, 0, 1, 1,
0.4574668, -0.3941615, 1.009397, 0.04313726, 0, 1, 1,
0.4593876, 0.183911, 0.617983, 0.05098039, 0, 1, 1,
0.4636631, 0.1981125, 1.484437, 0.05490196, 0, 1, 1,
0.4645507, 1.492741, 1.966101, 0.0627451, 0, 1, 1,
0.4661329, -0.9074016, 2.778629, 0.06666667, 0, 1, 1,
0.4663486, -0.6650167, 2.739352, 0.07450981, 0, 1, 1,
0.4690217, -2.219283, 4.356823, 0.07843138, 0, 1, 1,
0.4691187, -1.067059, 2.050185, 0.08627451, 0, 1, 1,
0.4742648, -0.9245974, 3.38353, 0.09019608, 0, 1, 1,
0.4742804, -1.882381, 2.275552, 0.09803922, 0, 1, 1,
0.4764638, -0.4731755, 2.777326, 0.1058824, 0, 1, 1,
0.4773936, -1.502479, 4.181426, 0.1098039, 0, 1, 1,
0.4790999, 2.434426, 1.028516, 0.1176471, 0, 1, 1,
0.4801795, -2.071497, 2.68213, 0.1215686, 0, 1, 1,
0.4815735, 0.7398365, 0.08927664, 0.1294118, 0, 1, 1,
0.4908777, -0.8885322, 3.270475, 0.1333333, 0, 1, 1,
0.4953441, 0.8495842, 0.3335172, 0.1411765, 0, 1, 1,
0.4959373, -0.4360147, 0.9276414, 0.145098, 0, 1, 1,
0.5000507, -0.02269121, -1.260964, 0.1529412, 0, 1, 1,
0.5010316, -0.6299289, 1.120262, 0.1568628, 0, 1, 1,
0.5049333, 0.4234562, 1.861331, 0.1647059, 0, 1, 1,
0.5076624, 0.6061087, 0.5256494, 0.1686275, 0, 1, 1,
0.5082899, -1.221168, 1.948776, 0.1764706, 0, 1, 1,
0.5158223, 0.9495344, -1.110388, 0.1803922, 0, 1, 1,
0.5162398, 0.6237916, 0.0335303, 0.1882353, 0, 1, 1,
0.5175788, -0.4332258, 2.906196, 0.1921569, 0, 1, 1,
0.5202697, 1.066953, -0.6714048, 0.2, 0, 1, 1,
0.5211493, -0.2630549, 3.146563, 0.2078431, 0, 1, 1,
0.5303366, -0.5524936, 1.427291, 0.2117647, 0, 1, 1,
0.5326378, -1.385276, 3.549926, 0.2196078, 0, 1, 1,
0.5349886, -0.7443728, 2.628531, 0.2235294, 0, 1, 1,
0.5425894, -0.7786784, 2.466611, 0.2313726, 0, 1, 1,
0.5476755, 2.352131, 1.670284, 0.2352941, 0, 1, 1,
0.547763, 1.927202, -0.06830078, 0.2431373, 0, 1, 1,
0.5487504, 1.469977, 0.6243423, 0.2470588, 0, 1, 1,
0.5566837, 0.1184784, -0.2770898, 0.254902, 0, 1, 1,
0.559031, -0.5240192, 1.676176, 0.2588235, 0, 1, 1,
0.5653351, -1.497006, 4.276438, 0.2666667, 0, 1, 1,
0.5682595, -0.4941837, 1.392714, 0.2705882, 0, 1, 1,
0.5696162, -0.6570826, 1.755831, 0.2784314, 0, 1, 1,
0.5830491, 0.5909042, 1.413255, 0.282353, 0, 1, 1,
0.5848731, 0.3159765, 1.16225, 0.2901961, 0, 1, 1,
0.5850399, 0.3834292, 0.02822898, 0.2941177, 0, 1, 1,
0.5871016, -1.302507, 3.611114, 0.3019608, 0, 1, 1,
0.587726, -0.9486573, 1.948074, 0.3098039, 0, 1, 1,
0.5897794, 1.063546, -0.6975902, 0.3137255, 0, 1, 1,
0.5925413, -0.76516, 1.890422, 0.3215686, 0, 1, 1,
0.5933934, 1.947098, 0.8004028, 0.3254902, 0, 1, 1,
0.5944083, 1.106095, -0.008125441, 0.3333333, 0, 1, 1,
0.6009107, -0.17027, 0.867358, 0.3372549, 0, 1, 1,
0.6028593, 0.05708607, 1.60832, 0.345098, 0, 1, 1,
0.6073228, 0.4637806, 0.7167308, 0.3490196, 0, 1, 1,
0.6277657, -0.3617927, -0.6038566, 0.3568628, 0, 1, 1,
0.6303785, -0.7575319, 1.318877, 0.3607843, 0, 1, 1,
0.6346172, -0.9765137, 4.416543, 0.3686275, 0, 1, 1,
0.6374198, 0.2384274, 1.06385, 0.372549, 0, 1, 1,
0.6386809, 2.642108, 0.73148, 0.3803922, 0, 1, 1,
0.6396405, 1.004511, 2.452745, 0.3843137, 0, 1, 1,
0.6474265, -0.8944944, 3.5228, 0.3921569, 0, 1, 1,
0.652609, -0.3736146, 1.124663, 0.3960784, 0, 1, 1,
0.654704, -0.2267388, 1.96245, 0.4039216, 0, 1, 1,
0.6712719, 0.07395925, 0.8521345, 0.4117647, 0, 1, 1,
0.671334, 0.1642749, -0.1291035, 0.4156863, 0, 1, 1,
0.6807869, -1.576142, 3.533245, 0.4235294, 0, 1, 1,
0.6809077, 0.6776795, 0.9022261, 0.427451, 0, 1, 1,
0.6815346, 1.545978, 0.4282149, 0.4352941, 0, 1, 1,
0.6832201, 0.3025039, 2.500239, 0.4392157, 0, 1, 1,
0.6846089, 0.1441852, 0.4965599, 0.4470588, 0, 1, 1,
0.6914343, -0.837436, 2.060314, 0.4509804, 0, 1, 1,
0.6993815, -1.058457, 3.198097, 0.4588235, 0, 1, 1,
0.7012047, -1.54946, 2.114126, 0.4627451, 0, 1, 1,
0.7030163, 2.153265, 1.158865, 0.4705882, 0, 1, 1,
0.7033353, -1.49907, 2.505778, 0.4745098, 0, 1, 1,
0.7053154, 0.8759885, 1.305887, 0.4823529, 0, 1, 1,
0.7081935, -1.070153, 3.283851, 0.4862745, 0, 1, 1,
0.7088937, -0.05462616, 3.366234, 0.4941176, 0, 1, 1,
0.7097206, -1.025726, 1.772656, 0.5019608, 0, 1, 1,
0.7098681, -0.8439123, 2.69944, 0.5058824, 0, 1, 1,
0.7111145, -0.9319324, 1.961144, 0.5137255, 0, 1, 1,
0.7113789, 0.05419829, 1.356645, 0.5176471, 0, 1, 1,
0.7137976, -0.2436307, 1.642524, 0.5254902, 0, 1, 1,
0.7139852, -1.069644, 5.416125, 0.5294118, 0, 1, 1,
0.7176175, 0.6249716, 0.7761515, 0.5372549, 0, 1, 1,
0.7193668, -0.3583265, 2.737533, 0.5411765, 0, 1, 1,
0.7238399, 1.355922, 0.6467419, 0.5490196, 0, 1, 1,
0.7245513, -0.2337898, 1.731564, 0.5529412, 0, 1, 1,
0.7249881, 0.8521354, 1.618662, 0.5607843, 0, 1, 1,
0.736708, -0.9645891, 3.386674, 0.5647059, 0, 1, 1,
0.7397681, -0.1572803, 1.088649, 0.572549, 0, 1, 1,
0.7490914, 0.7253641, -0.6819049, 0.5764706, 0, 1, 1,
0.7559597, 0.7373818, 1.108766, 0.5843138, 0, 1, 1,
0.7640479, -0.01985831, 2.169561, 0.5882353, 0, 1, 1,
0.7711095, 1.047135, 1.06922, 0.5960785, 0, 1, 1,
0.7734517, 0.8562407, 0.6327565, 0.6039216, 0, 1, 1,
0.7845344, -0.7173163, 2.213736, 0.6078432, 0, 1, 1,
0.786697, 1.08039, 1.830331, 0.6156863, 0, 1, 1,
0.7871758, 1.437167, -0.1534621, 0.6196079, 0, 1, 1,
0.788259, -1.71361, 3.914413, 0.627451, 0, 1, 1,
0.7897229, 0.2938388, -0.5932056, 0.6313726, 0, 1, 1,
0.8040335, -0.2753256, 2.989759, 0.6392157, 0, 1, 1,
0.8078375, 0.05275143, 0.5295529, 0.6431373, 0, 1, 1,
0.8207211, 0.7290463, -0.5671244, 0.6509804, 0, 1, 1,
0.8232795, 0.6346762, 1.389202, 0.654902, 0, 1, 1,
0.8240371, -0.04640929, 1.029139, 0.6627451, 0, 1, 1,
0.8290669, -0.6201262, 3.017411, 0.6666667, 0, 1, 1,
0.834042, -0.2588147, 1.309714, 0.6745098, 0, 1, 1,
0.8374961, -0.5674928, 1.683137, 0.6784314, 0, 1, 1,
0.8378144, -1.241776, 2.782959, 0.6862745, 0, 1, 1,
0.8411097, 0.1467157, 0.9375582, 0.6901961, 0, 1, 1,
0.8427505, 0.05102712, 1.915034, 0.6980392, 0, 1, 1,
0.8446249, -0.02558303, 1.745336, 0.7058824, 0, 1, 1,
0.8447603, -0.8673256, 4.769541, 0.7098039, 0, 1, 1,
0.8491303, 0.7034558, 0.5401483, 0.7176471, 0, 1, 1,
0.8493295, 1.168024, 0.431781, 0.7215686, 0, 1, 1,
0.8508481, 1.062683, 0.7049865, 0.7294118, 0, 1, 1,
0.854847, 1.933208, 1.208124, 0.7333333, 0, 1, 1,
0.8559262, -0.1781981, 1.978135, 0.7411765, 0, 1, 1,
0.8659642, -2.005747, 2.828152, 0.7450981, 0, 1, 1,
0.867266, 0.05201214, 2.279684, 0.7529412, 0, 1, 1,
0.8700793, 0.07111655, 1.242865, 0.7568628, 0, 1, 1,
0.8703743, -0.9380543, 1.076391, 0.7647059, 0, 1, 1,
0.8709124, -0.9858635, 2.184734, 0.7686275, 0, 1, 1,
0.8746704, 2.327277, -0.6726273, 0.7764706, 0, 1, 1,
0.875183, 1.686975, -0.1183792, 0.7803922, 0, 1, 1,
0.882851, 0.2176432, 1.27547, 0.7882353, 0, 1, 1,
0.8833313, -0.4910538, 2.465254, 0.7921569, 0, 1, 1,
0.8846742, 0.7758493, 1.868745, 0.8, 0, 1, 1,
0.8860054, -0.5626792, 2.869796, 0.8078431, 0, 1, 1,
0.8890197, 0.7801734, -1.833021, 0.8117647, 0, 1, 1,
0.8901252, -0.6218112, 1.098497, 0.8196079, 0, 1, 1,
0.8942641, -0.1933422, 3.781657, 0.8235294, 0, 1, 1,
0.8997464, 1.291777, -0.1721722, 0.8313726, 0, 1, 1,
0.9046345, -0.4942988, 0.3985881, 0.8352941, 0, 1, 1,
0.922897, -0.3849964, 3.183928, 0.8431373, 0, 1, 1,
0.9318447, 0.9266861, 2.409419, 0.8470588, 0, 1, 1,
0.9330973, -0.1068033, 1.139664, 0.854902, 0, 1, 1,
0.936469, 1.623418, 0.4988691, 0.8588235, 0, 1, 1,
0.9407601, 0.06416489, -0.4988874, 0.8666667, 0, 1, 1,
0.9415765, 0.1723785, 2.492811, 0.8705882, 0, 1, 1,
0.9430372, 0.6691211, 2.547806, 0.8784314, 0, 1, 1,
0.9488953, 0.9842505, 1.900523, 0.8823529, 0, 1, 1,
0.9535305, -0.8464462, 1.080352, 0.8901961, 0, 1, 1,
0.9550686, -0.8186857, 2.236947, 0.8941177, 0, 1, 1,
0.9563039, 1.870616, -0.2579491, 0.9019608, 0, 1, 1,
0.9576785, 1.527961, 1.123839, 0.9098039, 0, 1, 1,
0.9595337, -0.06141742, 1.499304, 0.9137255, 0, 1, 1,
0.9672704, 1.961409, 0.8459775, 0.9215686, 0, 1, 1,
0.970005, -0.6685522, 1.419917, 0.9254902, 0, 1, 1,
0.978044, -1.455918, 2.897667, 0.9333333, 0, 1, 1,
0.9788095, 0.9979771, 0.8415232, 0.9372549, 0, 1, 1,
0.9804197, -0.8423014, 2.533424, 0.945098, 0, 1, 1,
0.9855129, 0.5823154, 0.810086, 0.9490196, 0, 1, 1,
0.9872288, -0.5290208, 3.305811, 0.9568627, 0, 1, 1,
0.9926171, 0.5316516, 1.076514, 0.9607843, 0, 1, 1,
0.9943073, -1.949701, 3.503914, 0.9686275, 0, 1, 1,
0.9969566, -0.3831511, 1.799841, 0.972549, 0, 1, 1,
1.000102, -0.04290717, 0.8606465, 0.9803922, 0, 1, 1,
1.001912, 1.142787, 1.295687, 0.9843137, 0, 1, 1,
1.0024, -0.4433131, 0.7680963, 0.9921569, 0, 1, 1,
1.002513, -0.8992468, 1.539132, 0.9960784, 0, 1, 1,
1.003165, -0.01905989, 2.136449, 1, 0, 0.9960784, 1,
1.005083, -0.6373684, 2.646422, 1, 0, 0.9882353, 1,
1.006603, -1.036698, 3.367003, 1, 0, 0.9843137, 1,
1.00684, -0.02835407, 2.313113, 1, 0, 0.9764706, 1,
1.012403, 1.219091, 0.05513115, 1, 0, 0.972549, 1,
1.015483, 0.8137811, -0.2897105, 1, 0, 0.9647059, 1,
1.019132, 0.1722019, -0.2809597, 1, 0, 0.9607843, 1,
1.019216, -0.7208848, 1.432083, 1, 0, 0.9529412, 1,
1.019494, 0.3338276, 0.8716691, 1, 0, 0.9490196, 1,
1.028012, -1.31725, 0.5722736, 1, 0, 0.9411765, 1,
1.029931, 0.1322165, 0.7120604, 1, 0, 0.9372549, 1,
1.033032, -1.332838, 1.539882, 1, 0, 0.9294118, 1,
1.039938, 0.4050017, 1.706842, 1, 0, 0.9254902, 1,
1.043443, -0.1183902, 1.109315, 1, 0, 0.9176471, 1,
1.044381, -0.03323433, 1.987291, 1, 0, 0.9137255, 1,
1.046242, 0.9557046, 1.183223, 1, 0, 0.9058824, 1,
1.049813, -0.03469347, 3.002064, 1, 0, 0.9019608, 1,
1.054823, -0.2530338, 0.6819711, 1, 0, 0.8941177, 1,
1.057793, 0.2393912, 0.512467, 1, 0, 0.8862745, 1,
1.061208, 0.09738913, 1.271814, 1, 0, 0.8823529, 1,
1.061651, 0.9808588, 1.8139, 1, 0, 0.8745098, 1,
1.061919, 0.6485515, 2.296077, 1, 0, 0.8705882, 1,
1.062657, -1.667137, 2.115491, 1, 0, 0.8627451, 1,
1.064994, -0.06984724, 1.689562, 1, 0, 0.8588235, 1,
1.065285, -0.3715412, 3.704375, 1, 0, 0.8509804, 1,
1.071282, -2.100783, 1.348086, 1, 0, 0.8470588, 1,
1.095952, -0.76936, 2.377847, 1, 0, 0.8392157, 1,
1.096061, -0.3348595, 1.355357, 1, 0, 0.8352941, 1,
1.096536, -2.222482, 1.40258, 1, 0, 0.827451, 1,
1.098104, -0.1835115, 2.966518, 1, 0, 0.8235294, 1,
1.101977, -0.42998, 1.344422, 1, 0, 0.8156863, 1,
1.110465, 1.646348, 0.1528017, 1, 0, 0.8117647, 1,
1.112154, -1.643315, 2.180455, 1, 0, 0.8039216, 1,
1.115062, -0.08959831, 0.09356765, 1, 0, 0.7960784, 1,
1.116767, 0.1046785, 1.423587, 1, 0, 0.7921569, 1,
1.118037, 0.003161783, 1.607623, 1, 0, 0.7843137, 1,
1.119929, 0.5556399, 1.14135, 1, 0, 0.7803922, 1,
1.126502, -2.464897, 3.69718, 1, 0, 0.772549, 1,
1.12717, 0.2338539, 1.94446, 1, 0, 0.7686275, 1,
1.128686, -0.3457079, 1.977903, 1, 0, 0.7607843, 1,
1.134172, -0.1255699, 2.085995, 1, 0, 0.7568628, 1,
1.134672, 0.008021182, 0.5275145, 1, 0, 0.7490196, 1,
1.135843, 1.888762, -0.3103072, 1, 0, 0.7450981, 1,
1.142178, 0.6260062, -1.558822, 1, 0, 0.7372549, 1,
1.146762, 0.4111401, 1.034089, 1, 0, 0.7333333, 1,
1.149867, -1.118877, 0.3156116, 1, 0, 0.7254902, 1,
1.158677, 0.5780242, 3.012288, 1, 0, 0.7215686, 1,
1.169845, -0.9391524, 1.246634, 1, 0, 0.7137255, 1,
1.17571, -1.362895, 2.490335, 1, 0, 0.7098039, 1,
1.187471, -0.6847979, 1.551002, 1, 0, 0.7019608, 1,
1.187558, 0.8414992, 2.279754, 1, 0, 0.6941177, 1,
1.18793, 1.146008, 0.1700439, 1, 0, 0.6901961, 1,
1.196583, -1.304601, 4.311135, 1, 0, 0.682353, 1,
1.198562, -1.032145, -0.2016054, 1, 0, 0.6784314, 1,
1.198795, -1.378701, 1.700121, 1, 0, 0.6705883, 1,
1.206165, -0.005875893, 1.333161, 1, 0, 0.6666667, 1,
1.209527, 0.5371967, 1.685731, 1, 0, 0.6588235, 1,
1.211513, 0.5710368, 1.78283, 1, 0, 0.654902, 1,
1.220237, 0.712265, 2.453033, 1, 0, 0.6470588, 1,
1.220392, -1.006392, 1.339909, 1, 0, 0.6431373, 1,
1.22292, -0.8015806, 2.704853, 1, 0, 0.6352941, 1,
1.225955, -0.3391035, 0.4113969, 1, 0, 0.6313726, 1,
1.231914, -0.2077529, 1.616435, 1, 0, 0.6235294, 1,
1.236387, -0.9381098, 4.423779, 1, 0, 0.6196079, 1,
1.24206, 0.4115686, 1.638704, 1, 0, 0.6117647, 1,
1.242653, 0.6173449, 1.349137, 1, 0, 0.6078432, 1,
1.250858, -0.2482923, 0.5925585, 1, 0, 0.6, 1,
1.261253, -2.557228, 2.612499, 1, 0, 0.5921569, 1,
1.263233, -0.1891114, 1.265463, 1, 0, 0.5882353, 1,
1.280334, -2.628898, 3.40005, 1, 0, 0.5803922, 1,
1.288226, 1.264009, 1.373058, 1, 0, 0.5764706, 1,
1.293689, -0.1258859, 1.291578, 1, 0, 0.5686275, 1,
1.300536, 0.609059, 0.6401718, 1, 0, 0.5647059, 1,
1.312769, -0.104996, 1.368621, 1, 0, 0.5568628, 1,
1.319479, -0.1273957, 3.7805, 1, 0, 0.5529412, 1,
1.319642, 0.5884803, -0.5955864, 1, 0, 0.5450981, 1,
1.322723, -0.8834378, 2.8376, 1, 0, 0.5411765, 1,
1.337079, -0.7448589, 2.583834, 1, 0, 0.5333334, 1,
1.347441, 1.418726, 1.162392, 1, 0, 0.5294118, 1,
1.361555, 1.276437, 1.237203, 1, 0, 0.5215687, 1,
1.363043, -0.1486783, 2.628712, 1, 0, 0.5176471, 1,
1.363074, -0.01470216, 2.345428, 1, 0, 0.509804, 1,
1.38341, 0.3676433, 2.62181, 1, 0, 0.5058824, 1,
1.386838, -1.017134, 1.378354, 1, 0, 0.4980392, 1,
1.394032, 3.136767, -0.9866025, 1, 0, 0.4901961, 1,
1.398662, -0.04900479, 3.22733, 1, 0, 0.4862745, 1,
1.40006, 0.8414158, 0.1068707, 1, 0, 0.4784314, 1,
1.41695, 0.03539663, 2.64072, 1, 0, 0.4745098, 1,
1.417054, 1.410893, -0.3563769, 1, 0, 0.4666667, 1,
1.417312, 0.646525, 2.385245, 1, 0, 0.4627451, 1,
1.422197, 0.719452, 2.240745, 1, 0, 0.454902, 1,
1.422455, 0.1729979, 0.8033095, 1, 0, 0.4509804, 1,
1.422703, -1.404453, -0.5536099, 1, 0, 0.4431373, 1,
1.430416, -2.346292, 2.755666, 1, 0, 0.4392157, 1,
1.440667, -1.253885, 2.108836, 1, 0, 0.4313726, 1,
1.443771, -0.1697962, 1.309033, 1, 0, 0.427451, 1,
1.467433, 1.445687, 1.379977, 1, 0, 0.4196078, 1,
1.469394, -0.4169337, 1.591878, 1, 0, 0.4156863, 1,
1.478937, -0.05582772, 1.65048, 1, 0, 0.4078431, 1,
1.491085, 0.3527529, 2.899091, 1, 0, 0.4039216, 1,
1.510416, -1.513941, 1.810853, 1, 0, 0.3960784, 1,
1.534742, 0.5276179, 1.321068, 1, 0, 0.3882353, 1,
1.552421, -0.6487373, 1.637766, 1, 0, 0.3843137, 1,
1.554168, -0.3441651, 2.649921, 1, 0, 0.3764706, 1,
1.558076, 1.662487, 0.5305833, 1, 0, 0.372549, 1,
1.564385, -0.426973, 2.644529, 1, 0, 0.3647059, 1,
1.569541, 0.3555717, 0.781602, 1, 0, 0.3607843, 1,
1.574, 0.6321954, 1.946948, 1, 0, 0.3529412, 1,
1.578061, 1.29626, 0.4794594, 1, 0, 0.3490196, 1,
1.583396, -0.2545224, 2.832993, 1, 0, 0.3411765, 1,
1.585808, -1.010529, 0.483428, 1, 0, 0.3372549, 1,
1.624642, 1.187839, 0.9822793, 1, 0, 0.3294118, 1,
1.630957, 1.920116, 1.792079, 1, 0, 0.3254902, 1,
1.631843, 1.542012, 1.828757, 1, 0, 0.3176471, 1,
1.636179, 0.4920641, -0.01805064, 1, 0, 0.3137255, 1,
1.661421, 0.5147283, 1.871718, 1, 0, 0.3058824, 1,
1.670199, -0.6094269, 1.285276, 1, 0, 0.2980392, 1,
1.685436, 1.476153, -2.18553, 1, 0, 0.2941177, 1,
1.6886, -0.1667468, 0.8470469, 1, 0, 0.2862745, 1,
1.692777, -1.296581, 3.174088, 1, 0, 0.282353, 1,
1.700263, 0.9497286, 1.047293, 1, 0, 0.2745098, 1,
1.704287, -0.2846413, 1.900316, 1, 0, 0.2705882, 1,
1.708826, 0.8671702, 1.637172, 1, 0, 0.2627451, 1,
1.71495, 0.7249149, 2.669884, 1, 0, 0.2588235, 1,
1.730193, 0.4460757, -0.2298032, 1, 0, 0.2509804, 1,
1.734304, 0.3721302, -0.4246123, 1, 0, 0.2470588, 1,
1.744732, 0.4395186, 1.056024, 1, 0, 0.2392157, 1,
1.747657, 0.8221129, 0.3319421, 1, 0, 0.2352941, 1,
1.754121, -1.42811, 1.798564, 1, 0, 0.227451, 1,
1.755753, 0.4056389, 0.8710715, 1, 0, 0.2235294, 1,
1.76012, -1.17104, 1.690327, 1, 0, 0.2156863, 1,
1.771118, -0.2344501, 1.559444, 1, 0, 0.2117647, 1,
1.778438, -0.2976132, 2.270674, 1, 0, 0.2039216, 1,
1.786209, 1.143313, 3.909798, 1, 0, 0.1960784, 1,
1.787054, 1.122405, 1.251042, 1, 0, 0.1921569, 1,
1.803433, -0.0192092, 1.11052, 1, 0, 0.1843137, 1,
1.902247, 0.1658053, 2.317652, 1, 0, 0.1803922, 1,
1.903394, -2.325751, 1.455259, 1, 0, 0.172549, 1,
1.9465, -0.3596702, 0.7760699, 1, 0, 0.1686275, 1,
1.946805, 1.507862, 1.867469, 1, 0, 0.1607843, 1,
1.962544, -0.05155584, 0.4837523, 1, 0, 0.1568628, 1,
1.983709, -0.4674385, 2.426551, 1, 0, 0.1490196, 1,
2.029906, -0.2635604, 2.785861, 1, 0, 0.145098, 1,
2.033584, -1.301497, 1.511916, 1, 0, 0.1372549, 1,
2.040166, -0.7412894, 2.561258, 1, 0, 0.1333333, 1,
2.049046, -0.3370502, 0.2136928, 1, 0, 0.1254902, 1,
2.051558, 1.082466, 2.400148, 1, 0, 0.1215686, 1,
2.060488, 0.2973199, 1.132972, 1, 0, 0.1137255, 1,
2.100738, 0.2021085, 1.65085, 1, 0, 0.1098039, 1,
2.101708, 0.4079258, 1.61835, 1, 0, 0.1019608, 1,
2.148033, 0.908109, 2.135593, 1, 0, 0.09411765, 1,
2.193347, -0.1108099, 3.873417, 1, 0, 0.09019608, 1,
2.271476, 0.8436724, -0.2678835, 1, 0, 0.08235294, 1,
2.341981, -1.709535, 2.519062, 1, 0, 0.07843138, 1,
2.363402, -0.07847963, 0.2314834, 1, 0, 0.07058824, 1,
2.375013, 0.2075099, 1.716473, 1, 0, 0.06666667, 1,
2.384757, -0.1685575, 2.325683, 1, 0, 0.05882353, 1,
2.404232, 0.9598171, 1.328761, 1, 0, 0.05490196, 1,
2.438773, 1.383377, 1.440148, 1, 0, 0.04705882, 1,
2.47355, 1.207601, -0.1965144, 1, 0, 0.04313726, 1,
2.491388, 1.015071, 1.213386, 1, 0, 0.03529412, 1,
2.810853, 0.8932497, 2.256981, 1, 0, 0.03137255, 1,
2.827148, 0.3568119, 1.608492, 1, 0, 0.02352941, 1,
2.853131, -0.0872568, 1.873171, 1, 0, 0.01960784, 1,
2.88485, 0.1225778, 1.410106, 1, 0, 0.01176471, 1,
3.489218, 1.37918, 1.215598, 1, 0, 0.007843138, 1
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
0.201768, -4.08634, -7.695162, 0, -0.5, 0.5, 0.5,
0.201768, -4.08634, -7.695162, 1, -0.5, 0.5, 0.5,
0.201768, -4.08634, -7.695162, 1, 1.5, 0.5, 0.5,
0.201768, -4.08634, -7.695162, 0, 1.5, 0.5, 0.5
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
-4.200127, 0.04864907, -7.695162, 0, -0.5, 0.5, 0.5,
-4.200127, 0.04864907, -7.695162, 1, -0.5, 0.5, 0.5,
-4.200127, 0.04864907, -7.695162, 1, 1.5, 0.5, 0.5,
-4.200127, 0.04864907, -7.695162, 0, 1.5, 0.5, 0.5
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
-4.200127, -4.08634, -0.1493316, 0, -0.5, 0.5, 0.5,
-4.200127, -4.08634, -0.1493316, 1, -0.5, 0.5, 0.5,
-4.200127, -4.08634, -0.1493316, 1, 1.5, 0.5, 0.5,
-4.200127, -4.08634, -0.1493316, 0, 1.5, 0.5, 0.5
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
-3, -3.132112, -5.953816,
3, -3.132112, -5.953816,
-3, -3.132112, -5.953816,
-3, -3.29115, -6.24404,
-2, -3.132112, -5.953816,
-2, -3.29115, -6.24404,
-1, -3.132112, -5.953816,
-1, -3.29115, -6.24404,
0, -3.132112, -5.953816,
0, -3.29115, -6.24404,
1, -3.132112, -5.953816,
1, -3.29115, -6.24404,
2, -3.132112, -5.953816,
2, -3.29115, -6.24404,
3, -3.132112, -5.953816,
3, -3.29115, -6.24404
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
-3, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
-3, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
-3, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
-3, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
-2, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
-2, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
-2, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
-2, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
-1, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
-1, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
-1, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
-1, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
0, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
0, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
0, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
0, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
1, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
1, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
1, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
1, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
2, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
2, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
2, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
2, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5,
3, -3.609226, -6.824489, 0, -0.5, 0.5, 0.5,
3, -3.609226, -6.824489, 1, -0.5, 0.5, 0.5,
3, -3.609226, -6.824489, 1, 1.5, 0.5, 0.5,
3, -3.609226, -6.824489, 0, 1.5, 0.5, 0.5
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
-3.184305, -3, -5.953816,
-3.184305, 3, -5.953816,
-3.184305, -3, -5.953816,
-3.353609, -3, -6.24404,
-3.184305, -2, -5.953816,
-3.353609, -2, -6.24404,
-3.184305, -1, -5.953816,
-3.353609, -1, -6.24404,
-3.184305, 0, -5.953816,
-3.353609, 0, -6.24404,
-3.184305, 1, -5.953816,
-3.353609, 1, -6.24404,
-3.184305, 2, -5.953816,
-3.353609, 2, -6.24404,
-3.184305, 3, -5.953816,
-3.353609, 3, -6.24404
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
-3.692216, -3, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, -3, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, -3, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, -3, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, -2, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, -2, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, -2, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, -2, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, -1, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, -1, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, -1, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, -1, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, 0, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, 0, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, 0, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, 0, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, 1, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, 1, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, 1, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, 1, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, 2, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, 2, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, 2, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, 2, -6.824489, 0, 1.5, 0.5, 0.5,
-3.692216, 3, -6.824489, 0, -0.5, 0.5, 0.5,
-3.692216, 3, -6.824489, 1, -0.5, 0.5, 0.5,
-3.692216, 3, -6.824489, 1, 1.5, 0.5, 0.5,
-3.692216, 3, -6.824489, 0, 1.5, 0.5, 0.5
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
-3.184305, -3.132112, -4,
-3.184305, -3.132112, 4,
-3.184305, -3.132112, -4,
-3.353609, -3.29115, -4,
-3.184305, -3.132112, -2,
-3.353609, -3.29115, -2,
-3.184305, -3.132112, 0,
-3.353609, -3.29115, 0,
-3.184305, -3.132112, 2,
-3.353609, -3.29115, 2,
-3.184305, -3.132112, 4,
-3.353609, -3.29115, 4
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
-3.692216, -3.609226, -4, 0, -0.5, 0.5, 0.5,
-3.692216, -3.609226, -4, 1, -0.5, 0.5, 0.5,
-3.692216, -3.609226, -4, 1, 1.5, 0.5, 0.5,
-3.692216, -3.609226, -4, 0, 1.5, 0.5, 0.5,
-3.692216, -3.609226, -2, 0, -0.5, 0.5, 0.5,
-3.692216, -3.609226, -2, 1, -0.5, 0.5, 0.5,
-3.692216, -3.609226, -2, 1, 1.5, 0.5, 0.5,
-3.692216, -3.609226, -2, 0, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 0, 0, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 0, 1, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 0, 1, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 0, 0, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 2, 0, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 2, 1, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 2, 1, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 2, 0, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 4, 0, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 4, 1, -0.5, 0.5, 0.5,
-3.692216, -3.609226, 4, 1, 1.5, 0.5, 0.5,
-3.692216, -3.609226, 4, 0, 1.5, 0.5, 0.5
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
-3.184305, -3.132112, -5.953816,
-3.184305, 3.22941, -5.953816,
-3.184305, -3.132112, 5.655153,
-3.184305, 3.22941, 5.655153,
-3.184305, -3.132112, -5.953816,
-3.184305, -3.132112, 5.655153,
-3.184305, 3.22941, -5.953816,
-3.184305, 3.22941, 5.655153,
-3.184305, -3.132112, -5.953816,
3.587841, -3.132112, -5.953816,
-3.184305, -3.132112, 5.655153,
3.587841, -3.132112, 5.655153,
-3.184305, 3.22941, -5.953816,
3.587841, 3.22941, -5.953816,
-3.184305, 3.22941, 5.655153,
3.587841, 3.22941, 5.655153,
3.587841, -3.132112, -5.953816,
3.587841, 3.22941, -5.953816,
3.587841, -3.132112, 5.655153,
3.587841, 3.22941, 5.655153,
3.587841, -3.132112, -5.953816,
3.587841, -3.132112, 5.655153,
3.587841, 3.22941, -5.953816,
3.587841, 3.22941, 5.655153
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
var radius = 7.939972;
var distance = 35.32584;
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
mvMatrix.translate( -0.201768, -0.04864907, 0.1493316 );
mvMatrix.scale( 1.267671, 1.349497, 0.7395017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32584);
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
tralomethrin<-read.table("tralomethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tralomethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
```

```r
y<-tralomethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
```

```r
z<-tralomethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tralomethrin' not found
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
-3.085682, -1.304974, -2.01865, 0, 0, 1, 1, 1,
-2.513188, 0.863739, -1.536152, 1, 0, 0, 1, 1,
-2.31201, -0.6942983, -3.099797, 1, 0, 0, 1, 1,
-2.269139, -0.2984854, -2.434926, 1, 0, 0, 1, 1,
-2.256356, -2.014932, -4.075761, 1, 0, 0, 1, 1,
-2.190678, 0.7442362, -3.640242, 1, 0, 0, 1, 1,
-2.184444, -0.170431, -1.628728, 0, 0, 0, 1, 1,
-2.033751, 1.361456, -1.98395, 0, 0, 0, 1, 1,
-2.025486, 1.842974, -2.963781, 0, 0, 0, 1, 1,
-2.020315, -0.02884013, -1.82966, 0, 0, 0, 1, 1,
-1.986708, -0.3423161, -3.295285, 0, 0, 0, 1, 1,
-1.976765, 0.05560489, -2.682654, 0, 0, 0, 1, 1,
-1.965671, 0.5596981, -1.554355, 0, 0, 0, 1, 1,
-1.958935, -0.2717127, -2.220881, 1, 1, 1, 1, 1,
-1.939465, 0.7015812, -0.3911439, 1, 1, 1, 1, 1,
-1.914104, -0.6100858, -2.301055, 1, 1, 1, 1, 1,
-1.911755, -1.413804, -1.622373, 1, 1, 1, 1, 1,
-1.911063, 0.3361633, -0.4536912, 1, 1, 1, 1, 1,
-1.906484, -0.992465, -2.684107, 1, 1, 1, 1, 1,
-1.894645, -2.052321, -3.016561, 1, 1, 1, 1, 1,
-1.88921, -0.7277358, -2.886155, 1, 1, 1, 1, 1,
-1.888801, -0.4858168, -1.023587, 1, 1, 1, 1, 1,
-1.859515, -0.1470781, -2.2901, 1, 1, 1, 1, 1,
-1.85194, 0.2687131, -2.481798, 1, 1, 1, 1, 1,
-1.847847, 1.294258, -1.806594, 1, 1, 1, 1, 1,
-1.83114, 0.5245004, -0.6487378, 1, 1, 1, 1, 1,
-1.830793, 0.1645433, -0.5831647, 1, 1, 1, 1, 1,
-1.828315, 0.6884357, -2.519083, 1, 1, 1, 1, 1,
-1.816568, 1.951264, -0.40299, 0, 0, 1, 1, 1,
-1.79556, -1.655532, -1.796167, 1, 0, 0, 1, 1,
-1.770865, -0.01221736, 0.2599545, 1, 0, 0, 1, 1,
-1.762057, 1.09977, -1.786934, 1, 0, 0, 1, 1,
-1.761393, 0.6752441, -0.9730082, 1, 0, 0, 1, 1,
-1.759269, 0.5587855, 0.2661379, 1, 0, 0, 1, 1,
-1.74868, 0.6610489, -0.8459452, 0, 0, 0, 1, 1,
-1.745267, 1.259671, 1.596988, 0, 0, 0, 1, 1,
-1.733385, -1.114451, -3.005181, 0, 0, 0, 1, 1,
-1.730323, -0.01514952, -1.888899, 0, 0, 0, 1, 1,
-1.711455, -0.7708653, -0.01923995, 0, 0, 0, 1, 1,
-1.710716, 2.009533, 0.01632709, 0, 0, 0, 1, 1,
-1.695278, 1.129784, -3.275017, 0, 0, 0, 1, 1,
-1.692931, -1.342043, -2.505199, 1, 1, 1, 1, 1,
-1.680448, 0.1075925, -0.2573889, 1, 1, 1, 1, 1,
-1.660466, 0.5319415, -2.285721, 1, 1, 1, 1, 1,
-1.652483, 2.535467, 0.2089262, 1, 1, 1, 1, 1,
-1.652404, -0.4629009, -1.515071, 1, 1, 1, 1, 1,
-1.647602, 0.6681128, -0.877, 1, 1, 1, 1, 1,
-1.642464, 0.7864594, -2.022843, 1, 1, 1, 1, 1,
-1.630094, 0.5364916, -1.950999, 1, 1, 1, 1, 1,
-1.617617, 0.9464409, -1.811725, 1, 1, 1, 1, 1,
-1.614954, -0.2340855, -4.153421, 1, 1, 1, 1, 1,
-1.61365, -1.368069, -2.451665, 1, 1, 1, 1, 1,
-1.602678, -0.6949233, 0.07193531, 1, 1, 1, 1, 1,
-1.600354, 1.83811, -1.53655, 1, 1, 1, 1, 1,
-1.5923, 1.033988, -2.664948, 1, 1, 1, 1, 1,
-1.591712, 1.556877, 0.3780203, 1, 1, 1, 1, 1,
-1.576937, 0.2780081, -0.9507466, 0, 0, 1, 1, 1,
-1.567958, -0.2925965, -1.416068, 1, 0, 0, 1, 1,
-1.56656, -0.2890687, -0.7134869, 1, 0, 0, 1, 1,
-1.5612, -0.7557742, -2.052258, 1, 0, 0, 1, 1,
-1.560741, -1.205207, -3.760666, 1, 0, 0, 1, 1,
-1.552914, -2.746295, -3.043613, 1, 0, 0, 1, 1,
-1.550788, 0.9380023, -2.118463, 0, 0, 0, 1, 1,
-1.54452, -2.016502, -3.04091, 0, 0, 0, 1, 1,
-1.54022, -0.531811, -0.8909104, 0, 0, 0, 1, 1,
-1.536602, 0.0117272, -1.809698, 0, 0, 0, 1, 1,
-1.525327, 0.6671177, -0.06383824, 0, 0, 0, 1, 1,
-1.523976, -0.7310209, -1.354392, 0, 0, 0, 1, 1,
-1.522886, -1.01788, -2.786811, 0, 0, 0, 1, 1,
-1.517831, 0.2983379, -1.80025, 1, 1, 1, 1, 1,
-1.516927, 0.8461326, -1.576909, 1, 1, 1, 1, 1,
-1.513804, 0.09501153, -1.135394, 1, 1, 1, 1, 1,
-1.501864, 1.244125, -0.2239251, 1, 1, 1, 1, 1,
-1.497329, -0.8567922, -1.43278, 1, 1, 1, 1, 1,
-1.491298, -0.199292, -2.159313, 1, 1, 1, 1, 1,
-1.488681, -0.5182795, -0.4295946, 1, 1, 1, 1, 1,
-1.485159, -0.05869462, -1.82334, 1, 1, 1, 1, 1,
-1.47064, -0.8943383, -2.269933, 1, 1, 1, 1, 1,
-1.468959, -0.6440263, -2.117954, 1, 1, 1, 1, 1,
-1.461843, 0.07118767, -2.213018, 1, 1, 1, 1, 1,
-1.448071, 1.566521, 0.312089, 1, 1, 1, 1, 1,
-1.447005, -0.8016008, -1.533165, 1, 1, 1, 1, 1,
-1.443321, -0.6066606, -0.5156437, 1, 1, 1, 1, 1,
-1.436552, 0.5892762, 0.7832981, 1, 1, 1, 1, 1,
-1.432212, -1.067238, -4.401338, 0, 0, 1, 1, 1,
-1.431361, -2.540615, -1.182405, 1, 0, 0, 1, 1,
-1.430095, 0.3922139, -1.005737, 1, 0, 0, 1, 1,
-1.410699, 1.113868, -1.070759, 1, 0, 0, 1, 1,
-1.397181, 0.3727224, -1.357038, 1, 0, 0, 1, 1,
-1.396888, 0.462135, -1.768125, 1, 0, 0, 1, 1,
-1.386306, -0.344641, -1.939817, 0, 0, 0, 1, 1,
-1.380559, 0.2812797, -0.01447195, 0, 0, 0, 1, 1,
-1.371948, -0.4864086, -1.703425, 0, 0, 0, 1, 1,
-1.36174, 0.6432504, -0.5017845, 0, 0, 0, 1, 1,
-1.359605, -0.3329585, -1.237588, 0, 0, 0, 1, 1,
-1.356107, -0.5920709, -0.8753774, 0, 0, 0, 1, 1,
-1.354658, -1.980999, -4.001446, 0, 0, 0, 1, 1,
-1.353018, -0.3720357, -2.133682, 1, 1, 1, 1, 1,
-1.349596, 1.13808, -1.152017, 1, 1, 1, 1, 1,
-1.345104, -1.397365, -3.367633, 1, 1, 1, 1, 1,
-1.336644, -0.6834986, -1.96605, 1, 1, 1, 1, 1,
-1.319583, -2.046727, -4.10357, 1, 1, 1, 1, 1,
-1.316649, -0.9598525, -1.516908, 1, 1, 1, 1, 1,
-1.309526, -0.4256454, -2.985145, 1, 1, 1, 1, 1,
-1.30261, -0.6139755, -1.90494, 1, 1, 1, 1, 1,
-1.30006, -2.126293, -2.072742, 1, 1, 1, 1, 1,
-1.291036, 1.83544, 2.561314, 1, 1, 1, 1, 1,
-1.286934, -0.3035469, -1.540891, 1, 1, 1, 1, 1,
-1.280064, 0.8814843, -0.04877775, 1, 1, 1, 1, 1,
-1.277308, 0.1302587, -1.676842, 1, 1, 1, 1, 1,
-1.271742, -0.3321927, -4.101538, 1, 1, 1, 1, 1,
-1.251289, 0.8157846, -1.28357, 1, 1, 1, 1, 1,
-1.246483, 0.02676518, -0.4124264, 0, 0, 1, 1, 1,
-1.241108, 0.9930525, -1.354186, 1, 0, 0, 1, 1,
-1.238793, -1.748136, -4.270987, 1, 0, 0, 1, 1,
-1.236404, -1.785799, -2.855319, 1, 0, 0, 1, 1,
-1.232809, 1.271779, -2.165272, 1, 0, 0, 1, 1,
-1.223731, 1.362839, -1.283371, 1, 0, 0, 1, 1,
-1.223388, -1.720207, -4.706048, 0, 0, 0, 1, 1,
-1.207384, 0.4270222, -1.508807, 0, 0, 0, 1, 1,
-1.204852, -2.60349, -1.19944, 0, 0, 0, 1, 1,
-1.193582, -0.8481889, -1.176249, 0, 0, 0, 1, 1,
-1.183719, 0.2394868, -2.410464, 0, 0, 0, 1, 1,
-1.182832, -0.8996868, 0.1883934, 0, 0, 0, 1, 1,
-1.181411, -0.3548167, -1.516623, 0, 0, 0, 1, 1,
-1.177833, -0.8713129, -2.188273, 1, 1, 1, 1, 1,
-1.177423, 1.116782, -1.404809, 1, 1, 1, 1, 1,
-1.174981, -1.794942, -0.7201379, 1, 1, 1, 1, 1,
-1.171161, -0.5795163, -1.564054, 1, 1, 1, 1, 1,
-1.164013, -0.1957811, -1.152018, 1, 1, 1, 1, 1,
-1.157426, 1.893465, -0.3205783, 1, 1, 1, 1, 1,
-1.155438, -1.178769, -0.4030546, 1, 1, 1, 1, 1,
-1.153976, -0.7650422, -1.078485, 1, 1, 1, 1, 1,
-1.149785, -1.115587, -2.936143, 1, 1, 1, 1, 1,
-1.146634, -1.957424, -1.814744, 1, 1, 1, 1, 1,
-1.143256, 0.5020012, -1.799555, 1, 1, 1, 1, 1,
-1.141314, -1.173218, -2.186064, 1, 1, 1, 1, 1,
-1.139768, -0.05693753, -2.286989, 1, 1, 1, 1, 1,
-1.13742, 1.293487, -0.8260766, 1, 1, 1, 1, 1,
-1.136062, -0.00613727, 1.003706, 1, 1, 1, 1, 1,
-1.132658, -0.3160899, -1.899537, 0, 0, 1, 1, 1,
-1.132146, -0.8240927, -2.212902, 1, 0, 0, 1, 1,
-1.128281, 0.1916774, -1.144844, 1, 0, 0, 1, 1,
-1.128154, 0.6907254, -3.692743, 1, 0, 0, 1, 1,
-1.124315, 2.674644, -0.06057649, 1, 0, 0, 1, 1,
-1.110781, -0.5104064, -4.393865, 1, 0, 0, 1, 1,
-1.109578, 0.1191912, -1.739086, 0, 0, 0, 1, 1,
-1.106686, -1.035522, -2.975966, 0, 0, 0, 1, 1,
-1.105619, -1.124941, -2.036359, 0, 0, 0, 1, 1,
-1.100494, -0.3165994, -1.027704, 0, 0, 0, 1, 1,
-1.095335, -0.9117832, -1.900146, 0, 0, 0, 1, 1,
-1.093635, -0.2018999, 0.0260628, 0, 0, 0, 1, 1,
-1.090148, -1.730279, -1.53999, 0, 0, 0, 1, 1,
-1.089823, -1.145894, -3.574822, 1, 1, 1, 1, 1,
-1.088457, 0.7028551, -1.801579, 1, 1, 1, 1, 1,
-1.079438, -0.2679965, -0.7159978, 1, 1, 1, 1, 1,
-1.076807, -1.13202, -1.699579, 1, 1, 1, 1, 1,
-1.068565, 0.09543164, -1.517665, 1, 1, 1, 1, 1,
-1.066093, -0.4267517, -1.615546, 1, 1, 1, 1, 1,
-1.063292, -1.134156, -0.47385, 1, 1, 1, 1, 1,
-1.061884, 0.7008, -0.8674673, 1, 1, 1, 1, 1,
-1.055533, -1.757655, -1.002501, 1, 1, 1, 1, 1,
-1.054474, -0.2095933, -1.262837, 1, 1, 1, 1, 1,
-1.053061, 2.038952, 0.2397466, 1, 1, 1, 1, 1,
-1.041685, -0.4592421, -1.872453, 1, 1, 1, 1, 1,
-1.035315, -1.007465, -4.240761, 1, 1, 1, 1, 1,
-1.033455, -0.9217433, -1.972606, 1, 1, 1, 1, 1,
-1.031918, -2.113153, -3.850011, 1, 1, 1, 1, 1,
-1.030269, 1.085751, -0.648024, 0, 0, 1, 1, 1,
-1.030067, 0.9225795, -1.491997, 1, 0, 0, 1, 1,
-1.023772, -1.170359, -2.20315, 1, 0, 0, 1, 1,
-1.020851, -0.8157977, -1.532078, 1, 0, 0, 1, 1,
-1.017464, -1.336708, -1.317999, 1, 0, 0, 1, 1,
-1.014927, -0.5435658, -1.993833, 1, 0, 0, 1, 1,
-1.01056, -2.128387, -3.862104, 0, 0, 0, 1, 1,
-1.000714, -0.9228543, -3.480148, 0, 0, 0, 1, 1,
-0.9960743, 0.5116965, 0.4052556, 0, 0, 0, 1, 1,
-0.989605, -1.298785, -5.097466, 0, 0, 0, 1, 1,
-0.9890032, 0.4540607, -1.803896, 0, 0, 0, 1, 1,
-0.9773265, 0.1928285, -1.550662, 0, 0, 0, 1, 1,
-0.9724358, -0.9298325, -2.725879, 0, 0, 0, 1, 1,
-0.964919, 0.1124447, -2.676431, 1, 1, 1, 1, 1,
-0.962503, -0.131545, -2.682967, 1, 1, 1, 1, 1,
-0.9614577, -1.651044, -2.045282, 1, 1, 1, 1, 1,
-0.9550709, -0.2538348, 0.06291918, 1, 1, 1, 1, 1,
-0.9521787, 0.2127177, -2.127342, 1, 1, 1, 1, 1,
-0.9514745, 1.347931, -1.010805, 1, 1, 1, 1, 1,
-0.945933, 1.237561, 0.5915533, 1, 1, 1, 1, 1,
-0.9446681, 0.07145111, -1.258325, 1, 1, 1, 1, 1,
-0.9439293, -0.9675874, -1.771805, 1, 1, 1, 1, 1,
-0.9385652, 1.89047, -1.6503, 1, 1, 1, 1, 1,
-0.935875, 0.02183558, -0.5576031, 1, 1, 1, 1, 1,
-0.9239042, 0.1412113, -0.1184837, 1, 1, 1, 1, 1,
-0.922721, -0.7744715, -2.550589, 1, 1, 1, 1, 1,
-0.9223686, -0.5382202, -1.747792, 1, 1, 1, 1, 1,
-0.9210742, -0.1499918, -2.126058, 1, 1, 1, 1, 1,
-0.9180748, -1.6366, -2.517113, 0, 0, 1, 1, 1,
-0.9179108, 0.7721245, -1.657327, 1, 0, 0, 1, 1,
-0.9174767, 0.396972, -0.5199336, 1, 0, 0, 1, 1,
-0.915113, -0.2958041, -2.534206, 1, 0, 0, 1, 1,
-0.9034026, -1.624169, -2.819708, 1, 0, 0, 1, 1,
-0.8969393, -0.2575826, -1.522888, 1, 0, 0, 1, 1,
-0.8956237, 1.764323, -2.125047, 0, 0, 0, 1, 1,
-0.884885, -0.376234, -4.05232, 0, 0, 0, 1, 1,
-0.8809883, -0.01442029, -3.744273, 0, 0, 0, 1, 1,
-0.8783742, 0.3547748, -2.848118, 0, 0, 0, 1, 1,
-0.8690307, 0.07312292, -1.111601, 0, 0, 0, 1, 1,
-0.8618221, -0.5967931, 0.01883478, 0, 0, 0, 1, 1,
-0.858088, 1.096626, 0.7193167, 0, 0, 0, 1, 1,
-0.8449398, 0.2293033, -1.208403, 1, 1, 1, 1, 1,
-0.8430458, -1.026737, -1.579367, 1, 1, 1, 1, 1,
-0.8366376, -1.579945, -2.33274, 1, 1, 1, 1, 1,
-0.8278945, -0.02334776, -1.085526, 1, 1, 1, 1, 1,
-0.8236902, 0.5254187, -0.1310588, 1, 1, 1, 1, 1,
-0.8191289, -0.8804839, -1.001687, 1, 1, 1, 1, 1,
-0.8139444, 1.402504, -0.8931276, 1, 1, 1, 1, 1,
-0.8031914, -0.1810631, -2.554859, 1, 1, 1, 1, 1,
-0.8010999, 1.285678, 1.096563, 1, 1, 1, 1, 1,
-0.7958559, -0.2149542, -2.83903, 1, 1, 1, 1, 1,
-0.7868026, -0.9021735, -3.589913, 1, 1, 1, 1, 1,
-0.7860128, 0.03535214, -1.413864, 1, 1, 1, 1, 1,
-0.7852762, -1.368953, -3.638793, 1, 1, 1, 1, 1,
-0.7808942, 0.6467969, 0.1598653, 1, 1, 1, 1, 1,
-0.7750535, 1.146576, -1.288075, 1, 1, 1, 1, 1,
-0.7745658, 1.435894, -0.1234046, 0, 0, 1, 1, 1,
-0.7695194, -0.2737385, -2.729023, 1, 0, 0, 1, 1,
-0.7618341, -0.510231, -2.955398, 1, 0, 0, 1, 1,
-0.7586102, -2.635595, -2.969497, 1, 0, 0, 1, 1,
-0.7568262, 0.5511407, -1.05993, 1, 0, 0, 1, 1,
-0.7562762, -0.6009821, -2.70876, 1, 0, 0, 1, 1,
-0.7558222, 1.055431, -1.095771, 0, 0, 0, 1, 1,
-0.7530324, -1.393548, -2.994087, 0, 0, 0, 1, 1,
-0.7459958, -0.01003434, -1.698221, 0, 0, 0, 1, 1,
-0.7430812, -0.2548241, -2.423586, 0, 0, 0, 1, 1,
-0.7372892, 0.4438651, -2.824788, 0, 0, 0, 1, 1,
-0.7365059, 1.291268, -2.207824, 0, 0, 0, 1, 1,
-0.7363533, 0.845467, -2.185371, 0, 0, 0, 1, 1,
-0.7361404, -0.500569, -2.848897, 1, 1, 1, 1, 1,
-0.7342141, -0.3013472, -1.625056, 1, 1, 1, 1, 1,
-0.7164068, 0.1868303, -0.3228981, 1, 1, 1, 1, 1,
-0.7137401, -1.003813, -1.648717, 1, 1, 1, 1, 1,
-0.7108068, 2.024057, -0.3750377, 1, 1, 1, 1, 1,
-0.710795, 1.325005, -1.330484, 1, 1, 1, 1, 1,
-0.7106905, -1.458939, -3.119489, 1, 1, 1, 1, 1,
-0.7105577, 0.004063149, -3.195621, 1, 1, 1, 1, 1,
-0.7080177, 0.6425347, -1.93462, 1, 1, 1, 1, 1,
-0.7069821, -0.3746186, -3.081381, 1, 1, 1, 1, 1,
-0.7065817, -0.2102341, -3.127679, 1, 1, 1, 1, 1,
-0.7045128, 0.9715039, -1.434025, 1, 1, 1, 1, 1,
-0.7008402, 0.6512663, 0.9523954, 1, 1, 1, 1, 1,
-0.6961883, -1.021351, -2.728752, 1, 1, 1, 1, 1,
-0.6940215, 0.7567651, -0.4249941, 1, 1, 1, 1, 1,
-0.6915194, 0.5117114, 0.4301694, 0, 0, 1, 1, 1,
-0.6873825, -1.059754, -1.473592, 1, 0, 0, 1, 1,
-0.6831958, 1.03752, -3.731918, 1, 0, 0, 1, 1,
-0.6801994, 0.02363546, -2.650705, 1, 0, 0, 1, 1,
-0.6579881, 0.0899931, -0.3952821, 1, 0, 0, 1, 1,
-0.6579027, 0.4595344, -0.2585058, 1, 0, 0, 1, 1,
-0.656248, -1.012532, -2.872533, 0, 0, 0, 1, 1,
-0.6551383, 1.016257, -1.206181, 0, 0, 0, 1, 1,
-0.6516005, 1.400464, -1.287468, 0, 0, 0, 1, 1,
-0.6468208, -1.762512, -0.9624946, 0, 0, 0, 1, 1,
-0.6381289, -0.6378901, -2.693556, 0, 0, 0, 1, 1,
-0.6353114, -0.4431145, -2.664391, 0, 0, 0, 1, 1,
-0.6319601, 0.4278271, -0.4206761, 0, 0, 0, 1, 1,
-0.6318069, 0.07006883, -1.70261, 1, 1, 1, 1, 1,
-0.6295167, 1.224015, 0.4303916, 1, 1, 1, 1, 1,
-0.6259459, -0.5892894, -0.6567463, 1, 1, 1, 1, 1,
-0.6205734, 1.599376, -1.719185, 1, 1, 1, 1, 1,
-0.6188219, 0.6771149, -2.490634, 1, 1, 1, 1, 1,
-0.6176552, 0.5990475, -0.2682321, 1, 1, 1, 1, 1,
-0.6169903, -0.09881085, -0.1199872, 1, 1, 1, 1, 1,
-0.6121202, -0.1933029, -0.1292842, 1, 1, 1, 1, 1,
-0.6120488, 0.1867342, -1.98432, 1, 1, 1, 1, 1,
-0.6072575, 1.505531, -0.919889, 1, 1, 1, 1, 1,
-0.6048577, -0.5121025, -1.61978, 1, 1, 1, 1, 1,
-0.6042418, -0.08686922, -2.515917, 1, 1, 1, 1, 1,
-0.6029226, -0.08106235, -2.476241, 1, 1, 1, 1, 1,
-0.6026945, 0.05291753, -2.778688, 1, 1, 1, 1, 1,
-0.5972856, -1.122279, -4.463378, 1, 1, 1, 1, 1,
-0.5926329, 0.3139651, -1.033346, 0, 0, 1, 1, 1,
-0.5907394, -1.844956, -3.109532, 1, 0, 0, 1, 1,
-0.5881157, 0.005984284, -1.321613, 1, 0, 0, 1, 1,
-0.5867093, 0.5339868, -2.190094, 1, 0, 0, 1, 1,
-0.5818383, 0.6762999, -1.471825, 1, 0, 0, 1, 1,
-0.581812, 1.875578, -0.3985466, 1, 0, 0, 1, 1,
-0.5810277, -1.002476, -2.739154, 0, 0, 0, 1, 1,
-0.5800602, -0.4185104, -1.002718, 0, 0, 0, 1, 1,
-0.5785709, -0.7681966, -2.743181, 0, 0, 0, 1, 1,
-0.5706177, 1.410142, -1.074748, 0, 0, 0, 1, 1,
-0.5688564, -0.638875, -3.350018, 0, 0, 0, 1, 1,
-0.5658534, 0.4185404, -1.757426, 0, 0, 0, 1, 1,
-0.559965, -0.1313738, -1.465556, 0, 0, 0, 1, 1,
-0.5578659, -0.6336631, -2.25264, 1, 1, 1, 1, 1,
-0.5559422, 1.319667, -0.596831, 1, 1, 1, 1, 1,
-0.5556402, -1.348984, -4.936954, 1, 1, 1, 1, 1,
-0.5407425, 1.558009, -0.3503296, 1, 1, 1, 1, 1,
-0.5365582, -0.2476481, -3.171587, 1, 1, 1, 1, 1,
-0.5328262, 1.441255, -2.308988, 1, 1, 1, 1, 1,
-0.5308673, -0.1849877, -0.8458165, 1, 1, 1, 1, 1,
-0.5295995, -0.9029788, -1.906886, 1, 1, 1, 1, 1,
-0.5293656, 0.4072653, 0.4620138, 1, 1, 1, 1, 1,
-0.5277741, 0.1088187, -0.859221, 1, 1, 1, 1, 1,
-0.5274706, 0.4620083, 0.2115384, 1, 1, 1, 1, 1,
-0.5266904, -1.039936, -2.156044, 1, 1, 1, 1, 1,
-0.5242508, 1.582601, 1.067674, 1, 1, 1, 1, 1,
-0.5224453, -1.746878, -2.539747, 1, 1, 1, 1, 1,
-0.5197707, 0.702108, 0.1831093, 1, 1, 1, 1, 1,
-0.5156876, -0.1988633, -2.809519, 0, 0, 1, 1, 1,
-0.5156697, 0.217619, -1.70097, 1, 0, 0, 1, 1,
-0.5147921, 0.03434172, -2.548362, 1, 0, 0, 1, 1,
-0.5117864, 0.9408277, 0.6721618, 1, 0, 0, 1, 1,
-0.5089819, -1.48711, -3.557341, 1, 0, 0, 1, 1,
-0.5080993, -0.2938731, -3.220838, 1, 0, 0, 1, 1,
-0.5015329, -1.003837, -2.132543, 0, 0, 0, 1, 1,
-0.4998629, 0.4193825, -1.094777, 0, 0, 0, 1, 1,
-0.4970619, 1.486263, -0.8847576, 0, 0, 0, 1, 1,
-0.4961199, -1.114907, -1.437836, 0, 0, 0, 1, 1,
-0.4929132, 0.1245171, -1.594657, 0, 0, 0, 1, 1,
-0.4923918, -2.394305, -3.073951, 0, 0, 0, 1, 1,
-0.4903332, -0.8027139, -0.6525887, 0, 0, 0, 1, 1,
-0.4899245, 0.7618313, 0.9176483, 1, 1, 1, 1, 1,
-0.4897675, -0.809542, -2.810278, 1, 1, 1, 1, 1,
-0.4881418, -1.47024, -3.540186, 1, 1, 1, 1, 1,
-0.4844598, -0.307173, -1.398327, 1, 1, 1, 1, 1,
-0.4833337, 0.4207096, -1.00217, 1, 1, 1, 1, 1,
-0.4807456, 2.250639, 0.1761973, 1, 1, 1, 1, 1,
-0.4688188, 0.696852, 0.170425, 1, 1, 1, 1, 1,
-0.468593, 0.4774903, -1.03472, 1, 1, 1, 1, 1,
-0.4666402, 1.458781, 0.7931038, 1, 1, 1, 1, 1,
-0.46444, -0.3053666, -0.5315022, 1, 1, 1, 1, 1,
-0.45918, -1.06077, -2.409683, 1, 1, 1, 1, 1,
-0.4544464, -0.6883397, -3.893874, 1, 1, 1, 1, 1,
-0.45377, 0.8044761, -0.3192666, 1, 1, 1, 1, 1,
-0.4532202, 1.037527, -0.4359153, 1, 1, 1, 1, 1,
-0.4505759, -0.4317432, -4.883759, 1, 1, 1, 1, 1,
-0.4443537, -1.947307, -2.712409, 0, 0, 1, 1, 1,
-0.4442917, -0.3875982, -2.015348, 1, 0, 0, 1, 1,
-0.4410777, 0.2053889, -1.87691, 1, 0, 0, 1, 1,
-0.4365558, -0.9209731, -3.604424, 1, 0, 0, 1, 1,
-0.4364677, -0.2516188, -2.736259, 1, 0, 0, 1, 1,
-0.4357944, 1.274917, -0.06431314, 1, 0, 0, 1, 1,
-0.4282676, -1.039861, -1.654673, 0, 0, 0, 1, 1,
-0.4258531, 1.532347, -0.2959571, 0, 0, 0, 1, 1,
-0.4226622, -1.237319, -2.323511, 0, 0, 0, 1, 1,
-0.4220027, -0.5670028, -3.397425, 0, 0, 0, 1, 1,
-0.4185204, -0.295831, -3.636714, 0, 0, 0, 1, 1,
-0.4180495, -0.4027652, -3.68664, 0, 0, 0, 1, 1,
-0.4135804, 0.1069846, -2.138843, 0, 0, 0, 1, 1,
-0.4085722, -0.1910435, -3.712715, 1, 1, 1, 1, 1,
-0.4030638, 0.6595019, 1.416597, 1, 1, 1, 1, 1,
-0.4020242, -1.827697, -2.229367, 1, 1, 1, 1, 1,
-0.399206, -0.03245113, -0.9051383, 1, 1, 1, 1, 1,
-0.3974789, -0.3134251, -4.054251, 1, 1, 1, 1, 1,
-0.3804465, 1.079597, 0.1267129, 1, 1, 1, 1, 1,
-0.3764516, 0.165956, -0.3362533, 1, 1, 1, 1, 1,
-0.3752233, 1.128957, -0.0617723, 1, 1, 1, 1, 1,
-0.3742263, -0.2103813, -4.959036, 1, 1, 1, 1, 1,
-0.374177, -0.3800439, -3.357385, 1, 1, 1, 1, 1,
-0.3714071, -0.1310096, -0.8095444, 1, 1, 1, 1, 1,
-0.3682372, -1.765681, -3.084261, 1, 1, 1, 1, 1,
-0.367815, 0.4650882, -0.5336177, 1, 1, 1, 1, 1,
-0.367326, 0.4130942, -0.5060996, 1, 1, 1, 1, 1,
-0.3667729, 0.8541516, -0.5388574, 1, 1, 1, 1, 1,
-0.3657064, 0.1016756, -2.131559, 0, 0, 1, 1, 1,
-0.3650097, -1.048052, -3.41906, 1, 0, 0, 1, 1,
-0.3647799, 0.8874463, 0.0923638, 1, 0, 0, 1, 1,
-0.3636996, 0.5534872, -0.4039899, 1, 0, 0, 1, 1,
-0.3632633, 0.5683704, -0.4793957, 1, 0, 0, 1, 1,
-0.3620073, -0.1070018, -2.596343, 1, 0, 0, 1, 1,
-0.3524242, -0.5816865, -2.023611, 0, 0, 0, 1, 1,
-0.3508347, -0.1445551, -1.975864, 0, 0, 0, 1, 1,
-0.350702, 0.7670525, -0.3582678, 0, 0, 0, 1, 1,
-0.3504403, -0.007368779, -2.761447, 0, 0, 0, 1, 1,
-0.347847, 1.967687, 1.179563, 0, 0, 0, 1, 1,
-0.3463331, -1.438221, -2.165901, 0, 0, 0, 1, 1,
-0.3460236, 1.47175, 0.09860947, 0, 0, 0, 1, 1,
-0.344899, 1.647582, 0.1735026, 1, 1, 1, 1, 1,
-0.3418812, -0.6439872, -2.469467, 1, 1, 1, 1, 1,
-0.3409338, -2.782587, -2.741031, 1, 1, 1, 1, 1,
-0.3405645, 0.4983072, -1.367247, 1, 1, 1, 1, 1,
-0.3389281, -0.1452194, -0.7468609, 1, 1, 1, 1, 1,
-0.3248172, 1.521935, 0.6824546, 1, 1, 1, 1, 1,
-0.323612, 0.5242963, -0.005653768, 1, 1, 1, 1, 1,
-0.3204542, 0.7906591, -0.6579973, 1, 1, 1, 1, 1,
-0.3198444, 0.1680644, -0.4601804, 1, 1, 1, 1, 1,
-0.3195067, -0.3131461, -3.260707, 1, 1, 1, 1, 1,
-0.3195016, 1.038415, -1.82344, 1, 1, 1, 1, 1,
-0.3157626, -0.08347072, -1.719897, 1, 1, 1, 1, 1,
-0.3134469, -1.827454, -4.072525, 1, 1, 1, 1, 1,
-0.3071651, -1.243438, -3.86464, 1, 1, 1, 1, 1,
-0.3033245, 2.245799, -0.6320464, 1, 1, 1, 1, 1,
-0.3012277, -1.139379, -2.675949, 0, 0, 1, 1, 1,
-0.2995768, 0.4648844, -1.843893, 1, 0, 0, 1, 1,
-0.2993569, -0.04732119, -0.2333294, 1, 0, 0, 1, 1,
-0.2981487, -1.080505, -1.421955, 1, 0, 0, 1, 1,
-0.294412, 1.209291, 0.8095109, 1, 0, 0, 1, 1,
-0.2886209, 0.002001607, -1.075455, 1, 0, 0, 1, 1,
-0.2853853, -1.247918, -3.63913, 0, 0, 0, 1, 1,
-0.28133, 0.2837369, -1.778924, 0, 0, 0, 1, 1,
-0.2760343, -0.6438022, -2.426884, 0, 0, 0, 1, 1,
-0.2754395, 2.443064, 0.7322946, 0, 0, 0, 1, 1,
-0.2737797, 0.4232295, -0.7329705, 0, 0, 0, 1, 1,
-0.2725385, 0.1575722, -0.2265221, 0, 0, 0, 1, 1,
-0.2691346, -2.027758, -2.398647, 0, 0, 0, 1, 1,
-0.2646072, 0.3186191, 0.1809678, 1, 1, 1, 1, 1,
-0.2640123, -0.9831196, -1.983088, 1, 1, 1, 1, 1,
-0.2629203, 0.377201, -1.379912, 1, 1, 1, 1, 1,
-0.2626686, 0.3002374, -1.690862, 1, 1, 1, 1, 1,
-0.2602188, -3.039469, -1.992052, 1, 1, 1, 1, 1,
-0.2596601, 0.5259763, 0.1292411, 1, 1, 1, 1, 1,
-0.2581804, -0.4010427, -3.645213, 1, 1, 1, 1, 1,
-0.2556358, 1.085719, -0.7578248, 1, 1, 1, 1, 1,
-0.2544388, -0.1898665, -2.71584, 1, 1, 1, 1, 1,
-0.2505346, 0.5630908, -0.953971, 1, 1, 1, 1, 1,
-0.2505229, 1.003405, -0.6471432, 1, 1, 1, 1, 1,
-0.2412543, 0.2143916, -0.128277, 1, 1, 1, 1, 1,
-0.2399945, 1.399927, 0.3860657, 1, 1, 1, 1, 1,
-0.2366223, -0.9398388, -5.049436, 1, 1, 1, 1, 1,
-0.2361391, -0.005180675, -2.400483, 1, 1, 1, 1, 1,
-0.2324628, 1.096981, 0.6124935, 0, 0, 1, 1, 1,
-0.2302947, -0.5658947, -2.536608, 1, 0, 0, 1, 1,
-0.2288269, -1.870429, -5.784754, 1, 0, 0, 1, 1,
-0.2257943, -0.0889704, -1.6859, 1, 0, 0, 1, 1,
-0.2245687, 0.1917545, -2.768775, 1, 0, 0, 1, 1,
-0.2238, -1.03082, -3.092854, 1, 0, 0, 1, 1,
-0.2237419, -0.7699819, -2.51339, 0, 0, 0, 1, 1,
-0.2221962, -0.5999054, -2.298172, 0, 0, 0, 1, 1,
-0.2220346, 0.7619392, -0.8653097, 0, 0, 0, 1, 1,
-0.2188844, 1.367086, 0.349004, 0, 0, 0, 1, 1,
-0.2154011, 1.09659, 0.1783812, 0, 0, 0, 1, 1,
-0.2130827, 0.9741383, 0.3622406, 0, 0, 0, 1, 1,
-0.2125541, -1.636036, -2.9427, 0, 0, 0, 1, 1,
-0.209618, 1.079098, -0.07585289, 1, 1, 1, 1, 1,
-0.2074602, -0.218225, -2.280827, 1, 1, 1, 1, 1,
-0.2035035, -0.9852726, -3.279806, 1, 1, 1, 1, 1,
-0.2025443, -0.4701379, -3.338629, 1, 1, 1, 1, 1,
-0.1998934, 2.024808, -0.5185939, 1, 1, 1, 1, 1,
-0.1995302, -0.7634487, -2.462369, 1, 1, 1, 1, 1,
-0.1965188, -0.01841373, -3.212022, 1, 1, 1, 1, 1,
-0.1935773, -0.7037165, -4.295136, 1, 1, 1, 1, 1,
-0.1929699, 1.64687, 0.3965493, 1, 1, 1, 1, 1,
-0.1881183, -0.6737533, -2.875422, 1, 1, 1, 1, 1,
-0.1863908, -0.8628479, -1.642378, 1, 1, 1, 1, 1,
-0.1796206, -0.5722392, -4.331909, 1, 1, 1, 1, 1,
-0.174296, 0.2762072, 0.970714, 1, 1, 1, 1, 1,
-0.1718858, 1.883162, -0.3668693, 1, 1, 1, 1, 1,
-0.1684554, -0.6068844, -4.438298, 1, 1, 1, 1, 1,
-0.1610568, -0.7207232, -3.185963, 0, 0, 1, 1, 1,
-0.158572, 1.023688, -2.122451, 1, 0, 0, 1, 1,
-0.1584522, 0.9009516, -2.119827, 1, 0, 0, 1, 1,
-0.1583447, -0.4331476, -2.689133, 1, 0, 0, 1, 1,
-0.1516527, 1.070918, -0.7948176, 1, 0, 0, 1, 1,
-0.1513046, -1.253549, -4.251294, 1, 0, 0, 1, 1,
-0.150368, -0.2407417, -2.781159, 0, 0, 0, 1, 1,
-0.1483694, 0.5191619, 0.6296846, 0, 0, 0, 1, 1,
-0.1435572, -1.011051, -3.170248, 0, 0, 0, 1, 1,
-0.1431116, 0.02590035, -0.6105949, 0, 0, 0, 1, 1,
-0.1424941, -1.50923, -4.221148, 0, 0, 0, 1, 1,
-0.1381034, -0.1311807, -3.370239, 0, 0, 0, 1, 1,
-0.1328603, -0.2184912, -2.069335, 0, 0, 0, 1, 1,
-0.1300613, 0.1499991, -0.7890781, 1, 1, 1, 1, 1,
-0.1282487, -2.365656, -2.545693, 1, 1, 1, 1, 1,
-0.1269026, 0.1131089, -1.613118, 1, 1, 1, 1, 1,
-0.122628, -1.40351, -3.955436, 1, 1, 1, 1, 1,
-0.1148128, 0.437647, 0.3153887, 1, 1, 1, 1, 1,
-0.1145265, 0.4246009, -0.4598134, 1, 1, 1, 1, 1,
-0.1135366, -0.7094171, -4.232796, 1, 1, 1, 1, 1,
-0.1126535, -0.8876205, -3.476071, 1, 1, 1, 1, 1,
-0.1119997, 0.3183646, -0.8113013, 1, 1, 1, 1, 1,
-0.1117745, -0.09851837, -3.413564, 1, 1, 1, 1, 1,
-0.111658, 1.537668, -1.096584, 1, 1, 1, 1, 1,
-0.1084492, -0.3895068, -3.071182, 1, 1, 1, 1, 1,
-0.1057744, 0.1432465, -0.2361624, 1, 1, 1, 1, 1,
-0.101868, -1.331128, -2.031953, 1, 1, 1, 1, 1,
-0.09782343, -0.06132888, -1.746175, 1, 1, 1, 1, 1,
-0.09511084, 0.7391474, -0.9858465, 0, 0, 1, 1, 1,
-0.09468911, 0.6412237, 0.9925175, 1, 0, 0, 1, 1,
-0.09458811, 1.236982, -0.04376273, 1, 0, 0, 1, 1,
-0.09418605, 0.3310738, -0.1099519, 1, 0, 0, 1, 1,
-0.0930866, -0.8174484, -2.430976, 1, 0, 0, 1, 1,
-0.08964276, -1.366714, -3.765965, 1, 0, 0, 1, 1,
-0.08952809, 2.591111, -0.2659377, 0, 0, 0, 1, 1,
-0.08939534, 0.1935065, 0.2766516, 0, 0, 0, 1, 1,
-0.08701508, 1.251635, -1.080677, 0, 0, 0, 1, 1,
-0.0753585, 0.01738372, -1.256527, 0, 0, 0, 1, 1,
-0.07057399, -0.6125923, -2.645756, 0, 0, 0, 1, 1,
-0.06562036, 0.5400847, 0.06356262, 0, 0, 0, 1, 1,
-0.06436407, -2.151617, -1.849222, 0, 0, 0, 1, 1,
-0.0635387, -1.355802, -2.781121, 1, 1, 1, 1, 1,
-0.05289778, -0.5361156, -2.224337, 1, 1, 1, 1, 1,
-0.05197151, 0.8784801, -0.4231668, 1, 1, 1, 1, 1,
-0.04919317, 0.5802668, -0.4261118, 1, 1, 1, 1, 1,
-0.03670441, -0.4772843, -2.796661, 1, 1, 1, 1, 1,
-0.03670128, -0.4547006, -2.654397, 1, 1, 1, 1, 1,
-0.02902795, 0.4772872, -0.7738315, 1, 1, 1, 1, 1,
-0.02790142, -0.1831724, -2.697036, 1, 1, 1, 1, 1,
-0.02282937, 1.93826, -0.3691055, 1, 1, 1, 1, 1,
-0.02264252, -0.3941979, -4.968987, 1, 1, 1, 1, 1,
-0.02125492, -0.4269373, -1.774682, 1, 1, 1, 1, 1,
-0.01872258, -0.7777044, -2.236089, 1, 1, 1, 1, 1,
-0.01631103, -1.24955, -2.86692, 1, 1, 1, 1, 1,
-0.01154283, 0.1146736, -0.9761326, 1, 1, 1, 1, 1,
-0.01145168, 0.3622289, -0.19598, 1, 1, 1, 1, 1,
-0.01028865, 1.337904, 1.034185, 0, 0, 1, 1, 1,
-0.008742942, 1.307364, -0.7349382, 1, 0, 0, 1, 1,
-0.007768083, -0.4944593, -1.962239, 1, 0, 0, 1, 1,
-0.0004982208, -0.4672413, -2.719899, 1, 0, 0, 1, 1,
0.004016052, 0.2073885, -0.107463, 1, 0, 0, 1, 1,
0.00538019, -0.1952586, 2.814543, 1, 0, 0, 1, 1,
0.01317501, 1.602888, 0.03315501, 0, 0, 0, 1, 1,
0.0146199, -0.2799102, 2.861514, 0, 0, 0, 1, 1,
0.01682496, -1.969276, 2.83587, 0, 0, 0, 1, 1,
0.02035585, 1.205418, -0.9752062, 0, 0, 0, 1, 1,
0.02557861, -1.496562, 3.762165, 0, 0, 0, 1, 1,
0.0258031, 0.09711546, 1.231985, 0, 0, 0, 1, 1,
0.02610086, 0.354671, 1.22552, 0, 0, 0, 1, 1,
0.02626536, -0.4855457, 2.899497, 1, 1, 1, 1, 1,
0.03400112, 1.107906, 1.761387, 1, 1, 1, 1, 1,
0.03558157, -0.0982749, 3.478842, 1, 1, 1, 1, 1,
0.03701402, 0.1752142, 0.0378649, 1, 1, 1, 1, 1,
0.03869677, 0.4951125, 1.359463, 1, 1, 1, 1, 1,
0.03932662, -0.95559, 3.371506, 1, 1, 1, 1, 1,
0.03934728, -0.7424012, 4.333711, 1, 1, 1, 1, 1,
0.04175001, -0.1134861, 3.127058, 1, 1, 1, 1, 1,
0.04184671, -1.213138, 1.586086, 1, 1, 1, 1, 1,
0.0477035, 0.1657253, 1.137138, 1, 1, 1, 1, 1,
0.0477106, 1.300521, -0.5388779, 1, 1, 1, 1, 1,
0.05114774, -0.7455868, 4.143452, 1, 1, 1, 1, 1,
0.0520574, 0.07729235, 1.720416, 1, 1, 1, 1, 1,
0.05376864, -0.3122485, 4.395247, 1, 1, 1, 1, 1,
0.05484379, -1.306173, 3.139421, 1, 1, 1, 1, 1,
0.05600361, 0.5945817, -0.8035471, 0, 0, 1, 1, 1,
0.06340923, -0.8045757, 4.322034, 1, 0, 0, 1, 1,
0.07089423, 0.4317213, -1.193041, 1, 0, 0, 1, 1,
0.07122377, -0.2642431, 2.865178, 1, 0, 0, 1, 1,
0.07209794, 1.083625, -2.492306, 1, 0, 0, 1, 1,
0.0766824, -1.170965, 0.6441985, 1, 0, 0, 1, 1,
0.07692777, -2.457323, 3.157564, 0, 0, 0, 1, 1,
0.07867447, 1.441085, 0.1079494, 0, 0, 0, 1, 1,
0.0826209, -1.200792, 2.615706, 0, 0, 0, 1, 1,
0.08306147, 0.5511211, 0.2598362, 0, 0, 0, 1, 1,
0.08829783, 0.7799874, 0.6551717, 0, 0, 0, 1, 1,
0.09101778, -0.4456263, 2.396117, 0, 0, 0, 1, 1,
0.09235421, -0.04358774, 3.782103, 0, 0, 0, 1, 1,
0.0966024, 1.477241, 0.5567155, 1, 1, 1, 1, 1,
0.1015199, 0.1946811, 0.003210836, 1, 1, 1, 1, 1,
0.1066532, -1.806948, 4.132405, 1, 1, 1, 1, 1,
0.1099519, -1.477246, 1.861553, 1, 1, 1, 1, 1,
0.1126976, -0.3639793, 2.133345, 1, 1, 1, 1, 1,
0.1149921, -1.772508, 3.572234, 1, 1, 1, 1, 1,
0.1172313, 0.9257182, 0.6623427, 1, 1, 1, 1, 1,
0.1173487, -1.038153, 3.078028, 1, 1, 1, 1, 1,
0.1180488, 0.4169465, 0.1838455, 1, 1, 1, 1, 1,
0.1220708, -0.4373167, 3.193084, 1, 1, 1, 1, 1,
0.1267034, 0.1233913, 0.6251227, 1, 1, 1, 1, 1,
0.1312178, 0.2152962, 1.856828, 1, 1, 1, 1, 1,
0.1356414, 1.294898, 1.254327, 1, 1, 1, 1, 1,
0.1391372, 1.0541, -0.7917814, 1, 1, 1, 1, 1,
0.1401665, -0.06535444, 1.466661, 1, 1, 1, 1, 1,
0.1402413, -0.2963535, 1.810726, 0, 0, 1, 1, 1,
0.1456175, -0.1186766, 3.431799, 1, 0, 0, 1, 1,
0.1464717, 1.68587, -1.009689, 1, 0, 0, 1, 1,
0.148937, 0.9777555, -0.1513173, 1, 0, 0, 1, 1,
0.1489372, -0.3544418, 1.858622, 1, 0, 0, 1, 1,
0.1490683, 1.038289, -1.183219, 1, 0, 0, 1, 1,
0.1512787, 1.087608, 0.9538831, 0, 0, 0, 1, 1,
0.1559685, -0.4928498, 3.343004, 0, 0, 0, 1, 1,
0.1570403, 1.598431, 0.6050363, 0, 0, 0, 1, 1,
0.1628433, 0.8524871, -0.6854497, 0, 0, 0, 1, 1,
0.1635774, 2.079948, 0.4631461, 0, 0, 0, 1, 1,
0.164106, -1.097514, 3.611903, 0, 0, 0, 1, 1,
0.1648344, -0.4500428, 3.429525, 0, 0, 0, 1, 1,
0.1650562, 0.07824365, 1.412047, 1, 1, 1, 1, 1,
0.1653024, 1.624812, -0.01209327, 1, 1, 1, 1, 1,
0.1695124, -1.071854, 3.201459, 1, 1, 1, 1, 1,
0.1730317, -1.734211, 1.717046, 1, 1, 1, 1, 1,
0.1748221, -0.5161519, 2.280882, 1, 1, 1, 1, 1,
0.1756321, 0.4625545, 1.120382, 1, 1, 1, 1, 1,
0.1767522, 0.3049823, 0.398398, 1, 1, 1, 1, 1,
0.1776664, -0.549689, 2.395462, 1, 1, 1, 1, 1,
0.1802397, -0.1062841, 1.136521, 1, 1, 1, 1, 1,
0.1814083, -2.069231, 2.636549, 1, 1, 1, 1, 1,
0.1842878, 1.975222, -0.04019753, 1, 1, 1, 1, 1,
0.1895545, 0.01728165, 2.150791, 1, 1, 1, 1, 1,
0.1936659, -0.5559938, 1.676303, 1, 1, 1, 1, 1,
0.1958156, 0.3513129, 0.1085093, 1, 1, 1, 1, 1,
0.1967494, 0.2447354, -0.2821037, 1, 1, 1, 1, 1,
0.2007592, 0.7546118, 1.470289, 0, 0, 1, 1, 1,
0.2054001, -0.4221965, 3.891707, 1, 0, 0, 1, 1,
0.2162523, 0.8817891, -0.3423172, 1, 0, 0, 1, 1,
0.2170179, 1.682968, -0.4975713, 1, 0, 0, 1, 1,
0.2326149, 1.180018, -0.3724742, 1, 0, 0, 1, 1,
0.235995, -0.6698189, 4.704082, 1, 0, 0, 1, 1,
0.2374739, -1.686145, 2.369783, 0, 0, 0, 1, 1,
0.2395221, 0.4976325, 0.02967082, 0, 0, 0, 1, 1,
0.2419458, 0.3748626, 0.3339603, 0, 0, 0, 1, 1,
0.2472716, -1.139487, 2.632755, 0, 0, 0, 1, 1,
0.248246, -0.09752323, 2.783008, 0, 0, 0, 1, 1,
0.249899, 0.2055187, 0.4118807, 0, 0, 0, 1, 1,
0.2515313, -0.5070677, 2.849765, 0, 0, 0, 1, 1,
0.2555207, -2.814906, 3.399691, 1, 1, 1, 1, 1,
0.2568122, -1.40493, 1.664948, 1, 1, 1, 1, 1,
0.2576636, 0.4932365, -0.3192688, 1, 1, 1, 1, 1,
0.2591702, -0.1960531, 2.536557, 1, 1, 1, 1, 1,
0.2593015, -0.3640625, 4.113516, 1, 1, 1, 1, 1,
0.2599236, -0.8684533, 3.016471, 1, 1, 1, 1, 1,
0.2646198, -0.3635752, 2.016764, 1, 1, 1, 1, 1,
0.2672711, -0.967501, 3.530557, 1, 1, 1, 1, 1,
0.2679089, 1.263631, -3.433637, 1, 1, 1, 1, 1,
0.271506, 0.8409665, -0.4294296, 1, 1, 1, 1, 1,
0.2719983, 0.8599473, 0.5887905, 1, 1, 1, 1, 1,
0.272468, 0.2469489, 2.168497, 1, 1, 1, 1, 1,
0.2753727, -0.5571827, 4.180841, 1, 1, 1, 1, 1,
0.2797492, 1.87402, 0.4244548, 1, 1, 1, 1, 1,
0.2809471, 1.476528, -1.757022, 1, 1, 1, 1, 1,
0.2825443, -1.989745, 3.323803, 0, 0, 1, 1, 1,
0.2833215, -1.89499, 2.931266, 1, 0, 0, 1, 1,
0.2837777, -1.008075, 1.915438, 1, 0, 0, 1, 1,
0.2903527, 1.777028, 0.3119036, 1, 0, 0, 1, 1,
0.2937689, -0.2452834, 3.062146, 1, 0, 0, 1, 1,
0.2968483, 1.20384, 1.145661, 1, 0, 0, 1, 1,
0.2972414, 1.08645, 0.2888812, 0, 0, 0, 1, 1,
0.2987466, -1.195189, 3.190834, 0, 0, 0, 1, 1,
0.2993176, -0.4862667, 2.726202, 0, 0, 0, 1, 1,
0.3015243, -1.072994, 3.892116, 0, 0, 0, 1, 1,
0.3024585, 0.7435122, 1.127559, 0, 0, 0, 1, 1,
0.3026907, -0.2979623, 3.448677, 0, 0, 0, 1, 1,
0.3082753, -0.09698301, 1.284497, 0, 0, 0, 1, 1,
0.3087893, -0.5174163, 1.564819, 1, 1, 1, 1, 1,
0.3096971, -1.019149, 3.70397, 1, 1, 1, 1, 1,
0.3185901, 0.0004616523, 0.6300285, 1, 1, 1, 1, 1,
0.3221906, -0.9910575, 2.064745, 1, 1, 1, 1, 1,
0.322334, 1.201575, -0.4922731, 1, 1, 1, 1, 1,
0.3232789, -1.951121, 2.082865, 1, 1, 1, 1, 1,
0.3268544, 0.2971071, 0.2022955, 1, 1, 1, 1, 1,
0.3271775, 0.1070969, 3.071797, 1, 1, 1, 1, 1,
0.3354007, 0.4398983, -1.020333, 1, 1, 1, 1, 1,
0.3422165, 0.6841136, -1.376132, 1, 1, 1, 1, 1,
0.343419, 0.6212395, 2.468349, 1, 1, 1, 1, 1,
0.3624101, -0.5555003, 3.365672, 1, 1, 1, 1, 1,
0.3682168, -1.78008, 5.486091, 1, 1, 1, 1, 1,
0.3714864, -1.132249, 3.08601, 1, 1, 1, 1, 1,
0.3808587, -0.8813912, 2.230926, 1, 1, 1, 1, 1,
0.3860445, 0.4608403, -0.01549582, 0, 0, 1, 1, 1,
0.3865739, -0.3245455, 2.741822, 1, 0, 0, 1, 1,
0.3866363, 1.693418, -1.067662, 1, 0, 0, 1, 1,
0.3886538, 0.3378887, -0.1063072, 1, 0, 0, 1, 1,
0.390397, 0.9605524, 1.132949, 1, 0, 0, 1, 1,
0.3988673, -0.7384453, 4.684494, 1, 0, 0, 1, 1,
0.40099, -0.4888544, 3.519147, 0, 0, 0, 1, 1,
0.400995, -0.5369121, 3.088668, 0, 0, 0, 1, 1,
0.401125, 1.32149, -0.6100655, 0, 0, 0, 1, 1,
0.4029979, 0.8222688, 0.6781647, 0, 0, 0, 1, 1,
0.4030227, -1.317723, 4.505208, 0, 0, 0, 1, 1,
0.4055542, 0.8630521, 2.41419, 0, 0, 0, 1, 1,
0.4069851, 0.07495864, 2.492723, 0, 0, 0, 1, 1,
0.4088081, 1.311667, -0.3605201, 1, 1, 1, 1, 1,
0.4089005, -0.4995359, 1.004986, 1, 1, 1, 1, 1,
0.4101936, 1.329667, -1.221453, 1, 1, 1, 1, 1,
0.4111907, -0.6233849, 3.155596, 1, 1, 1, 1, 1,
0.4112252, 0.7652872, -1.419985, 1, 1, 1, 1, 1,
0.4182217, -0.157421, 2.458358, 1, 1, 1, 1, 1,
0.4273935, -0.678991, 1.760061, 1, 1, 1, 1, 1,
0.4292071, 0.5246142, 0.2569314, 1, 1, 1, 1, 1,
0.4333098, -1.57091, 1.424717, 1, 1, 1, 1, 1,
0.4357535, 0.5927122, 0.851949, 1, 1, 1, 1, 1,
0.4361676, -0.113973, 2.715108, 1, 1, 1, 1, 1,
0.4401402, -0.2013166, -0.3945765, 1, 1, 1, 1, 1,
0.4410652, 2.035831, 1.349984, 1, 1, 1, 1, 1,
0.442414, 0.6536443, 0.1825201, 1, 1, 1, 1, 1,
0.443951, 0.4982987, 1.159649, 1, 1, 1, 1, 1,
0.4473779, 1.108136, 0.2878632, 0, 0, 1, 1, 1,
0.4490734, 0.2805822, 1.849189, 1, 0, 0, 1, 1,
0.4574668, -0.3941615, 1.009397, 1, 0, 0, 1, 1,
0.4593876, 0.183911, 0.617983, 1, 0, 0, 1, 1,
0.4636631, 0.1981125, 1.484437, 1, 0, 0, 1, 1,
0.4645507, 1.492741, 1.966101, 1, 0, 0, 1, 1,
0.4661329, -0.9074016, 2.778629, 0, 0, 0, 1, 1,
0.4663486, -0.6650167, 2.739352, 0, 0, 0, 1, 1,
0.4690217, -2.219283, 4.356823, 0, 0, 0, 1, 1,
0.4691187, -1.067059, 2.050185, 0, 0, 0, 1, 1,
0.4742648, -0.9245974, 3.38353, 0, 0, 0, 1, 1,
0.4742804, -1.882381, 2.275552, 0, 0, 0, 1, 1,
0.4764638, -0.4731755, 2.777326, 0, 0, 0, 1, 1,
0.4773936, -1.502479, 4.181426, 1, 1, 1, 1, 1,
0.4790999, 2.434426, 1.028516, 1, 1, 1, 1, 1,
0.4801795, -2.071497, 2.68213, 1, 1, 1, 1, 1,
0.4815735, 0.7398365, 0.08927664, 1, 1, 1, 1, 1,
0.4908777, -0.8885322, 3.270475, 1, 1, 1, 1, 1,
0.4953441, 0.8495842, 0.3335172, 1, 1, 1, 1, 1,
0.4959373, -0.4360147, 0.9276414, 1, 1, 1, 1, 1,
0.5000507, -0.02269121, -1.260964, 1, 1, 1, 1, 1,
0.5010316, -0.6299289, 1.120262, 1, 1, 1, 1, 1,
0.5049333, 0.4234562, 1.861331, 1, 1, 1, 1, 1,
0.5076624, 0.6061087, 0.5256494, 1, 1, 1, 1, 1,
0.5082899, -1.221168, 1.948776, 1, 1, 1, 1, 1,
0.5158223, 0.9495344, -1.110388, 1, 1, 1, 1, 1,
0.5162398, 0.6237916, 0.0335303, 1, 1, 1, 1, 1,
0.5175788, -0.4332258, 2.906196, 1, 1, 1, 1, 1,
0.5202697, 1.066953, -0.6714048, 0, 0, 1, 1, 1,
0.5211493, -0.2630549, 3.146563, 1, 0, 0, 1, 1,
0.5303366, -0.5524936, 1.427291, 1, 0, 0, 1, 1,
0.5326378, -1.385276, 3.549926, 1, 0, 0, 1, 1,
0.5349886, -0.7443728, 2.628531, 1, 0, 0, 1, 1,
0.5425894, -0.7786784, 2.466611, 1, 0, 0, 1, 1,
0.5476755, 2.352131, 1.670284, 0, 0, 0, 1, 1,
0.547763, 1.927202, -0.06830078, 0, 0, 0, 1, 1,
0.5487504, 1.469977, 0.6243423, 0, 0, 0, 1, 1,
0.5566837, 0.1184784, -0.2770898, 0, 0, 0, 1, 1,
0.559031, -0.5240192, 1.676176, 0, 0, 0, 1, 1,
0.5653351, -1.497006, 4.276438, 0, 0, 0, 1, 1,
0.5682595, -0.4941837, 1.392714, 0, 0, 0, 1, 1,
0.5696162, -0.6570826, 1.755831, 1, 1, 1, 1, 1,
0.5830491, 0.5909042, 1.413255, 1, 1, 1, 1, 1,
0.5848731, 0.3159765, 1.16225, 1, 1, 1, 1, 1,
0.5850399, 0.3834292, 0.02822898, 1, 1, 1, 1, 1,
0.5871016, -1.302507, 3.611114, 1, 1, 1, 1, 1,
0.587726, -0.9486573, 1.948074, 1, 1, 1, 1, 1,
0.5897794, 1.063546, -0.6975902, 1, 1, 1, 1, 1,
0.5925413, -0.76516, 1.890422, 1, 1, 1, 1, 1,
0.5933934, 1.947098, 0.8004028, 1, 1, 1, 1, 1,
0.5944083, 1.106095, -0.008125441, 1, 1, 1, 1, 1,
0.6009107, -0.17027, 0.867358, 1, 1, 1, 1, 1,
0.6028593, 0.05708607, 1.60832, 1, 1, 1, 1, 1,
0.6073228, 0.4637806, 0.7167308, 1, 1, 1, 1, 1,
0.6277657, -0.3617927, -0.6038566, 1, 1, 1, 1, 1,
0.6303785, -0.7575319, 1.318877, 1, 1, 1, 1, 1,
0.6346172, -0.9765137, 4.416543, 0, 0, 1, 1, 1,
0.6374198, 0.2384274, 1.06385, 1, 0, 0, 1, 1,
0.6386809, 2.642108, 0.73148, 1, 0, 0, 1, 1,
0.6396405, 1.004511, 2.452745, 1, 0, 0, 1, 1,
0.6474265, -0.8944944, 3.5228, 1, 0, 0, 1, 1,
0.652609, -0.3736146, 1.124663, 1, 0, 0, 1, 1,
0.654704, -0.2267388, 1.96245, 0, 0, 0, 1, 1,
0.6712719, 0.07395925, 0.8521345, 0, 0, 0, 1, 1,
0.671334, 0.1642749, -0.1291035, 0, 0, 0, 1, 1,
0.6807869, -1.576142, 3.533245, 0, 0, 0, 1, 1,
0.6809077, 0.6776795, 0.9022261, 0, 0, 0, 1, 1,
0.6815346, 1.545978, 0.4282149, 0, 0, 0, 1, 1,
0.6832201, 0.3025039, 2.500239, 0, 0, 0, 1, 1,
0.6846089, 0.1441852, 0.4965599, 1, 1, 1, 1, 1,
0.6914343, -0.837436, 2.060314, 1, 1, 1, 1, 1,
0.6993815, -1.058457, 3.198097, 1, 1, 1, 1, 1,
0.7012047, -1.54946, 2.114126, 1, 1, 1, 1, 1,
0.7030163, 2.153265, 1.158865, 1, 1, 1, 1, 1,
0.7033353, -1.49907, 2.505778, 1, 1, 1, 1, 1,
0.7053154, 0.8759885, 1.305887, 1, 1, 1, 1, 1,
0.7081935, -1.070153, 3.283851, 1, 1, 1, 1, 1,
0.7088937, -0.05462616, 3.366234, 1, 1, 1, 1, 1,
0.7097206, -1.025726, 1.772656, 1, 1, 1, 1, 1,
0.7098681, -0.8439123, 2.69944, 1, 1, 1, 1, 1,
0.7111145, -0.9319324, 1.961144, 1, 1, 1, 1, 1,
0.7113789, 0.05419829, 1.356645, 1, 1, 1, 1, 1,
0.7137976, -0.2436307, 1.642524, 1, 1, 1, 1, 1,
0.7139852, -1.069644, 5.416125, 1, 1, 1, 1, 1,
0.7176175, 0.6249716, 0.7761515, 0, 0, 1, 1, 1,
0.7193668, -0.3583265, 2.737533, 1, 0, 0, 1, 1,
0.7238399, 1.355922, 0.6467419, 1, 0, 0, 1, 1,
0.7245513, -0.2337898, 1.731564, 1, 0, 0, 1, 1,
0.7249881, 0.8521354, 1.618662, 1, 0, 0, 1, 1,
0.736708, -0.9645891, 3.386674, 1, 0, 0, 1, 1,
0.7397681, -0.1572803, 1.088649, 0, 0, 0, 1, 1,
0.7490914, 0.7253641, -0.6819049, 0, 0, 0, 1, 1,
0.7559597, 0.7373818, 1.108766, 0, 0, 0, 1, 1,
0.7640479, -0.01985831, 2.169561, 0, 0, 0, 1, 1,
0.7711095, 1.047135, 1.06922, 0, 0, 0, 1, 1,
0.7734517, 0.8562407, 0.6327565, 0, 0, 0, 1, 1,
0.7845344, -0.7173163, 2.213736, 0, 0, 0, 1, 1,
0.786697, 1.08039, 1.830331, 1, 1, 1, 1, 1,
0.7871758, 1.437167, -0.1534621, 1, 1, 1, 1, 1,
0.788259, -1.71361, 3.914413, 1, 1, 1, 1, 1,
0.7897229, 0.2938388, -0.5932056, 1, 1, 1, 1, 1,
0.8040335, -0.2753256, 2.989759, 1, 1, 1, 1, 1,
0.8078375, 0.05275143, 0.5295529, 1, 1, 1, 1, 1,
0.8207211, 0.7290463, -0.5671244, 1, 1, 1, 1, 1,
0.8232795, 0.6346762, 1.389202, 1, 1, 1, 1, 1,
0.8240371, -0.04640929, 1.029139, 1, 1, 1, 1, 1,
0.8290669, -0.6201262, 3.017411, 1, 1, 1, 1, 1,
0.834042, -0.2588147, 1.309714, 1, 1, 1, 1, 1,
0.8374961, -0.5674928, 1.683137, 1, 1, 1, 1, 1,
0.8378144, -1.241776, 2.782959, 1, 1, 1, 1, 1,
0.8411097, 0.1467157, 0.9375582, 1, 1, 1, 1, 1,
0.8427505, 0.05102712, 1.915034, 1, 1, 1, 1, 1,
0.8446249, -0.02558303, 1.745336, 0, 0, 1, 1, 1,
0.8447603, -0.8673256, 4.769541, 1, 0, 0, 1, 1,
0.8491303, 0.7034558, 0.5401483, 1, 0, 0, 1, 1,
0.8493295, 1.168024, 0.431781, 1, 0, 0, 1, 1,
0.8508481, 1.062683, 0.7049865, 1, 0, 0, 1, 1,
0.854847, 1.933208, 1.208124, 1, 0, 0, 1, 1,
0.8559262, -0.1781981, 1.978135, 0, 0, 0, 1, 1,
0.8659642, -2.005747, 2.828152, 0, 0, 0, 1, 1,
0.867266, 0.05201214, 2.279684, 0, 0, 0, 1, 1,
0.8700793, 0.07111655, 1.242865, 0, 0, 0, 1, 1,
0.8703743, -0.9380543, 1.076391, 0, 0, 0, 1, 1,
0.8709124, -0.9858635, 2.184734, 0, 0, 0, 1, 1,
0.8746704, 2.327277, -0.6726273, 0, 0, 0, 1, 1,
0.875183, 1.686975, -0.1183792, 1, 1, 1, 1, 1,
0.882851, 0.2176432, 1.27547, 1, 1, 1, 1, 1,
0.8833313, -0.4910538, 2.465254, 1, 1, 1, 1, 1,
0.8846742, 0.7758493, 1.868745, 1, 1, 1, 1, 1,
0.8860054, -0.5626792, 2.869796, 1, 1, 1, 1, 1,
0.8890197, 0.7801734, -1.833021, 1, 1, 1, 1, 1,
0.8901252, -0.6218112, 1.098497, 1, 1, 1, 1, 1,
0.8942641, -0.1933422, 3.781657, 1, 1, 1, 1, 1,
0.8997464, 1.291777, -0.1721722, 1, 1, 1, 1, 1,
0.9046345, -0.4942988, 0.3985881, 1, 1, 1, 1, 1,
0.922897, -0.3849964, 3.183928, 1, 1, 1, 1, 1,
0.9318447, 0.9266861, 2.409419, 1, 1, 1, 1, 1,
0.9330973, -0.1068033, 1.139664, 1, 1, 1, 1, 1,
0.936469, 1.623418, 0.4988691, 1, 1, 1, 1, 1,
0.9407601, 0.06416489, -0.4988874, 1, 1, 1, 1, 1,
0.9415765, 0.1723785, 2.492811, 0, 0, 1, 1, 1,
0.9430372, 0.6691211, 2.547806, 1, 0, 0, 1, 1,
0.9488953, 0.9842505, 1.900523, 1, 0, 0, 1, 1,
0.9535305, -0.8464462, 1.080352, 1, 0, 0, 1, 1,
0.9550686, -0.8186857, 2.236947, 1, 0, 0, 1, 1,
0.9563039, 1.870616, -0.2579491, 1, 0, 0, 1, 1,
0.9576785, 1.527961, 1.123839, 0, 0, 0, 1, 1,
0.9595337, -0.06141742, 1.499304, 0, 0, 0, 1, 1,
0.9672704, 1.961409, 0.8459775, 0, 0, 0, 1, 1,
0.970005, -0.6685522, 1.419917, 0, 0, 0, 1, 1,
0.978044, -1.455918, 2.897667, 0, 0, 0, 1, 1,
0.9788095, 0.9979771, 0.8415232, 0, 0, 0, 1, 1,
0.9804197, -0.8423014, 2.533424, 0, 0, 0, 1, 1,
0.9855129, 0.5823154, 0.810086, 1, 1, 1, 1, 1,
0.9872288, -0.5290208, 3.305811, 1, 1, 1, 1, 1,
0.9926171, 0.5316516, 1.076514, 1, 1, 1, 1, 1,
0.9943073, -1.949701, 3.503914, 1, 1, 1, 1, 1,
0.9969566, -0.3831511, 1.799841, 1, 1, 1, 1, 1,
1.000102, -0.04290717, 0.8606465, 1, 1, 1, 1, 1,
1.001912, 1.142787, 1.295687, 1, 1, 1, 1, 1,
1.0024, -0.4433131, 0.7680963, 1, 1, 1, 1, 1,
1.002513, -0.8992468, 1.539132, 1, 1, 1, 1, 1,
1.003165, -0.01905989, 2.136449, 1, 1, 1, 1, 1,
1.005083, -0.6373684, 2.646422, 1, 1, 1, 1, 1,
1.006603, -1.036698, 3.367003, 1, 1, 1, 1, 1,
1.00684, -0.02835407, 2.313113, 1, 1, 1, 1, 1,
1.012403, 1.219091, 0.05513115, 1, 1, 1, 1, 1,
1.015483, 0.8137811, -0.2897105, 1, 1, 1, 1, 1,
1.019132, 0.1722019, -0.2809597, 0, 0, 1, 1, 1,
1.019216, -0.7208848, 1.432083, 1, 0, 0, 1, 1,
1.019494, 0.3338276, 0.8716691, 1, 0, 0, 1, 1,
1.028012, -1.31725, 0.5722736, 1, 0, 0, 1, 1,
1.029931, 0.1322165, 0.7120604, 1, 0, 0, 1, 1,
1.033032, -1.332838, 1.539882, 1, 0, 0, 1, 1,
1.039938, 0.4050017, 1.706842, 0, 0, 0, 1, 1,
1.043443, -0.1183902, 1.109315, 0, 0, 0, 1, 1,
1.044381, -0.03323433, 1.987291, 0, 0, 0, 1, 1,
1.046242, 0.9557046, 1.183223, 0, 0, 0, 1, 1,
1.049813, -0.03469347, 3.002064, 0, 0, 0, 1, 1,
1.054823, -0.2530338, 0.6819711, 0, 0, 0, 1, 1,
1.057793, 0.2393912, 0.512467, 0, 0, 0, 1, 1,
1.061208, 0.09738913, 1.271814, 1, 1, 1, 1, 1,
1.061651, 0.9808588, 1.8139, 1, 1, 1, 1, 1,
1.061919, 0.6485515, 2.296077, 1, 1, 1, 1, 1,
1.062657, -1.667137, 2.115491, 1, 1, 1, 1, 1,
1.064994, -0.06984724, 1.689562, 1, 1, 1, 1, 1,
1.065285, -0.3715412, 3.704375, 1, 1, 1, 1, 1,
1.071282, -2.100783, 1.348086, 1, 1, 1, 1, 1,
1.095952, -0.76936, 2.377847, 1, 1, 1, 1, 1,
1.096061, -0.3348595, 1.355357, 1, 1, 1, 1, 1,
1.096536, -2.222482, 1.40258, 1, 1, 1, 1, 1,
1.098104, -0.1835115, 2.966518, 1, 1, 1, 1, 1,
1.101977, -0.42998, 1.344422, 1, 1, 1, 1, 1,
1.110465, 1.646348, 0.1528017, 1, 1, 1, 1, 1,
1.112154, -1.643315, 2.180455, 1, 1, 1, 1, 1,
1.115062, -0.08959831, 0.09356765, 1, 1, 1, 1, 1,
1.116767, 0.1046785, 1.423587, 0, 0, 1, 1, 1,
1.118037, 0.003161783, 1.607623, 1, 0, 0, 1, 1,
1.119929, 0.5556399, 1.14135, 1, 0, 0, 1, 1,
1.126502, -2.464897, 3.69718, 1, 0, 0, 1, 1,
1.12717, 0.2338539, 1.94446, 1, 0, 0, 1, 1,
1.128686, -0.3457079, 1.977903, 1, 0, 0, 1, 1,
1.134172, -0.1255699, 2.085995, 0, 0, 0, 1, 1,
1.134672, 0.008021182, 0.5275145, 0, 0, 0, 1, 1,
1.135843, 1.888762, -0.3103072, 0, 0, 0, 1, 1,
1.142178, 0.6260062, -1.558822, 0, 0, 0, 1, 1,
1.146762, 0.4111401, 1.034089, 0, 0, 0, 1, 1,
1.149867, -1.118877, 0.3156116, 0, 0, 0, 1, 1,
1.158677, 0.5780242, 3.012288, 0, 0, 0, 1, 1,
1.169845, -0.9391524, 1.246634, 1, 1, 1, 1, 1,
1.17571, -1.362895, 2.490335, 1, 1, 1, 1, 1,
1.187471, -0.6847979, 1.551002, 1, 1, 1, 1, 1,
1.187558, 0.8414992, 2.279754, 1, 1, 1, 1, 1,
1.18793, 1.146008, 0.1700439, 1, 1, 1, 1, 1,
1.196583, -1.304601, 4.311135, 1, 1, 1, 1, 1,
1.198562, -1.032145, -0.2016054, 1, 1, 1, 1, 1,
1.198795, -1.378701, 1.700121, 1, 1, 1, 1, 1,
1.206165, -0.005875893, 1.333161, 1, 1, 1, 1, 1,
1.209527, 0.5371967, 1.685731, 1, 1, 1, 1, 1,
1.211513, 0.5710368, 1.78283, 1, 1, 1, 1, 1,
1.220237, 0.712265, 2.453033, 1, 1, 1, 1, 1,
1.220392, -1.006392, 1.339909, 1, 1, 1, 1, 1,
1.22292, -0.8015806, 2.704853, 1, 1, 1, 1, 1,
1.225955, -0.3391035, 0.4113969, 1, 1, 1, 1, 1,
1.231914, -0.2077529, 1.616435, 0, 0, 1, 1, 1,
1.236387, -0.9381098, 4.423779, 1, 0, 0, 1, 1,
1.24206, 0.4115686, 1.638704, 1, 0, 0, 1, 1,
1.242653, 0.6173449, 1.349137, 1, 0, 0, 1, 1,
1.250858, -0.2482923, 0.5925585, 1, 0, 0, 1, 1,
1.261253, -2.557228, 2.612499, 1, 0, 0, 1, 1,
1.263233, -0.1891114, 1.265463, 0, 0, 0, 1, 1,
1.280334, -2.628898, 3.40005, 0, 0, 0, 1, 1,
1.288226, 1.264009, 1.373058, 0, 0, 0, 1, 1,
1.293689, -0.1258859, 1.291578, 0, 0, 0, 1, 1,
1.300536, 0.609059, 0.6401718, 0, 0, 0, 1, 1,
1.312769, -0.104996, 1.368621, 0, 0, 0, 1, 1,
1.319479, -0.1273957, 3.7805, 0, 0, 0, 1, 1,
1.319642, 0.5884803, -0.5955864, 1, 1, 1, 1, 1,
1.322723, -0.8834378, 2.8376, 1, 1, 1, 1, 1,
1.337079, -0.7448589, 2.583834, 1, 1, 1, 1, 1,
1.347441, 1.418726, 1.162392, 1, 1, 1, 1, 1,
1.361555, 1.276437, 1.237203, 1, 1, 1, 1, 1,
1.363043, -0.1486783, 2.628712, 1, 1, 1, 1, 1,
1.363074, -0.01470216, 2.345428, 1, 1, 1, 1, 1,
1.38341, 0.3676433, 2.62181, 1, 1, 1, 1, 1,
1.386838, -1.017134, 1.378354, 1, 1, 1, 1, 1,
1.394032, 3.136767, -0.9866025, 1, 1, 1, 1, 1,
1.398662, -0.04900479, 3.22733, 1, 1, 1, 1, 1,
1.40006, 0.8414158, 0.1068707, 1, 1, 1, 1, 1,
1.41695, 0.03539663, 2.64072, 1, 1, 1, 1, 1,
1.417054, 1.410893, -0.3563769, 1, 1, 1, 1, 1,
1.417312, 0.646525, 2.385245, 1, 1, 1, 1, 1,
1.422197, 0.719452, 2.240745, 0, 0, 1, 1, 1,
1.422455, 0.1729979, 0.8033095, 1, 0, 0, 1, 1,
1.422703, -1.404453, -0.5536099, 1, 0, 0, 1, 1,
1.430416, -2.346292, 2.755666, 1, 0, 0, 1, 1,
1.440667, -1.253885, 2.108836, 1, 0, 0, 1, 1,
1.443771, -0.1697962, 1.309033, 1, 0, 0, 1, 1,
1.467433, 1.445687, 1.379977, 0, 0, 0, 1, 1,
1.469394, -0.4169337, 1.591878, 0, 0, 0, 1, 1,
1.478937, -0.05582772, 1.65048, 0, 0, 0, 1, 1,
1.491085, 0.3527529, 2.899091, 0, 0, 0, 1, 1,
1.510416, -1.513941, 1.810853, 0, 0, 0, 1, 1,
1.534742, 0.5276179, 1.321068, 0, 0, 0, 1, 1,
1.552421, -0.6487373, 1.637766, 0, 0, 0, 1, 1,
1.554168, -0.3441651, 2.649921, 1, 1, 1, 1, 1,
1.558076, 1.662487, 0.5305833, 1, 1, 1, 1, 1,
1.564385, -0.426973, 2.644529, 1, 1, 1, 1, 1,
1.569541, 0.3555717, 0.781602, 1, 1, 1, 1, 1,
1.574, 0.6321954, 1.946948, 1, 1, 1, 1, 1,
1.578061, 1.29626, 0.4794594, 1, 1, 1, 1, 1,
1.583396, -0.2545224, 2.832993, 1, 1, 1, 1, 1,
1.585808, -1.010529, 0.483428, 1, 1, 1, 1, 1,
1.624642, 1.187839, 0.9822793, 1, 1, 1, 1, 1,
1.630957, 1.920116, 1.792079, 1, 1, 1, 1, 1,
1.631843, 1.542012, 1.828757, 1, 1, 1, 1, 1,
1.636179, 0.4920641, -0.01805064, 1, 1, 1, 1, 1,
1.661421, 0.5147283, 1.871718, 1, 1, 1, 1, 1,
1.670199, -0.6094269, 1.285276, 1, 1, 1, 1, 1,
1.685436, 1.476153, -2.18553, 1, 1, 1, 1, 1,
1.6886, -0.1667468, 0.8470469, 0, 0, 1, 1, 1,
1.692777, -1.296581, 3.174088, 1, 0, 0, 1, 1,
1.700263, 0.9497286, 1.047293, 1, 0, 0, 1, 1,
1.704287, -0.2846413, 1.900316, 1, 0, 0, 1, 1,
1.708826, 0.8671702, 1.637172, 1, 0, 0, 1, 1,
1.71495, 0.7249149, 2.669884, 1, 0, 0, 1, 1,
1.730193, 0.4460757, -0.2298032, 0, 0, 0, 1, 1,
1.734304, 0.3721302, -0.4246123, 0, 0, 0, 1, 1,
1.744732, 0.4395186, 1.056024, 0, 0, 0, 1, 1,
1.747657, 0.8221129, 0.3319421, 0, 0, 0, 1, 1,
1.754121, -1.42811, 1.798564, 0, 0, 0, 1, 1,
1.755753, 0.4056389, 0.8710715, 0, 0, 0, 1, 1,
1.76012, -1.17104, 1.690327, 0, 0, 0, 1, 1,
1.771118, -0.2344501, 1.559444, 1, 1, 1, 1, 1,
1.778438, -0.2976132, 2.270674, 1, 1, 1, 1, 1,
1.786209, 1.143313, 3.909798, 1, 1, 1, 1, 1,
1.787054, 1.122405, 1.251042, 1, 1, 1, 1, 1,
1.803433, -0.0192092, 1.11052, 1, 1, 1, 1, 1,
1.902247, 0.1658053, 2.317652, 1, 1, 1, 1, 1,
1.903394, -2.325751, 1.455259, 1, 1, 1, 1, 1,
1.9465, -0.3596702, 0.7760699, 1, 1, 1, 1, 1,
1.946805, 1.507862, 1.867469, 1, 1, 1, 1, 1,
1.962544, -0.05155584, 0.4837523, 1, 1, 1, 1, 1,
1.983709, -0.4674385, 2.426551, 1, 1, 1, 1, 1,
2.029906, -0.2635604, 2.785861, 1, 1, 1, 1, 1,
2.033584, -1.301497, 1.511916, 1, 1, 1, 1, 1,
2.040166, -0.7412894, 2.561258, 1, 1, 1, 1, 1,
2.049046, -0.3370502, 0.2136928, 1, 1, 1, 1, 1,
2.051558, 1.082466, 2.400148, 0, 0, 1, 1, 1,
2.060488, 0.2973199, 1.132972, 1, 0, 0, 1, 1,
2.100738, 0.2021085, 1.65085, 1, 0, 0, 1, 1,
2.101708, 0.4079258, 1.61835, 1, 0, 0, 1, 1,
2.148033, 0.908109, 2.135593, 1, 0, 0, 1, 1,
2.193347, -0.1108099, 3.873417, 1, 0, 0, 1, 1,
2.271476, 0.8436724, -0.2678835, 0, 0, 0, 1, 1,
2.341981, -1.709535, 2.519062, 0, 0, 0, 1, 1,
2.363402, -0.07847963, 0.2314834, 0, 0, 0, 1, 1,
2.375013, 0.2075099, 1.716473, 0, 0, 0, 1, 1,
2.384757, -0.1685575, 2.325683, 0, 0, 0, 1, 1,
2.404232, 0.9598171, 1.328761, 0, 0, 0, 1, 1,
2.438773, 1.383377, 1.440148, 0, 0, 0, 1, 1,
2.47355, 1.207601, -0.1965144, 1, 1, 1, 1, 1,
2.491388, 1.015071, 1.213386, 1, 1, 1, 1, 1,
2.810853, 0.8932497, 2.256981, 1, 1, 1, 1, 1,
2.827148, 0.3568119, 1.608492, 1, 1, 1, 1, 1,
2.853131, -0.0872568, 1.873171, 1, 1, 1, 1, 1,
2.88485, 0.1225778, 1.410106, 1, 1, 1, 1, 1,
3.489218, 1.37918, 1.215598, 1, 1, 1, 1, 1
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
var radius = 9.784669;
var distance = 34.36824;
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
mvMatrix.translate( -0.2017679, -0.04864883, 0.1493316 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36824);
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
