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
-3.048841, 0.6958087, -1.346346, 1, 0, 0, 1,
-2.928077, 0.5171416, -1.670684, 1, 0.007843138, 0, 1,
-2.895798, -0.270726, -1.719808, 1, 0.01176471, 0, 1,
-2.643212, 0.04918802, 0.08085453, 1, 0.01960784, 0, 1,
-2.600485, -1.844951, -2.048687, 1, 0.02352941, 0, 1,
-2.570855, 0.8547822, -2.482833, 1, 0.03137255, 0, 1,
-2.541477, 1.137856, -1.406267, 1, 0.03529412, 0, 1,
-2.493572, -0.3267985, -1.942248, 1, 0.04313726, 0, 1,
-2.482565, -0.6940616, -2.756219, 1, 0.04705882, 0, 1,
-2.373868, -0.2141045, -1.905044, 1, 0.05490196, 0, 1,
-2.361461, 1.939923, -1.738478, 1, 0.05882353, 0, 1,
-2.328842, 1.13983, -2.501387, 1, 0.06666667, 0, 1,
-2.270649, -0.447459, -1.751034, 1, 0.07058824, 0, 1,
-2.266254, -0.4920624, -1.757877, 1, 0.07843138, 0, 1,
-2.250438, -0.5598037, -1.901386, 1, 0.08235294, 0, 1,
-2.199635, 0.04786422, -2.108191, 1, 0.09019608, 0, 1,
-2.198102, 0.1433531, -0.5398127, 1, 0.09411765, 0, 1,
-2.189647, 0.8423002, -1.956253, 1, 0.1019608, 0, 1,
-2.104119, -0.4113614, -0.7472915, 1, 0.1098039, 0, 1,
-2.07934, -0.3207794, -2.589169, 1, 0.1137255, 0, 1,
-2.074504, -0.5984176, -2.957977, 1, 0.1215686, 0, 1,
-2.065113, -0.7607794, -2.436362, 1, 0.1254902, 0, 1,
-1.975376, 0.5465305, -1.116525, 1, 0.1333333, 0, 1,
-1.904642, -0.4449622, -2.039709, 1, 0.1372549, 0, 1,
-1.903877, 1.171192, -0.7665428, 1, 0.145098, 0, 1,
-1.899874, 0.2189464, -1.300263, 1, 0.1490196, 0, 1,
-1.867217, 0.6919315, -0.6520697, 1, 0.1568628, 0, 1,
-1.848081, -0.212147, -2.185527, 1, 0.1607843, 0, 1,
-1.843155, -0.4613361, -1.083102, 1, 0.1686275, 0, 1,
-1.812734, -0.5910499, -1.424464, 1, 0.172549, 0, 1,
-1.809547, -0.3637301, -2.25758, 1, 0.1803922, 0, 1,
-1.808794, -0.2829551, -0.7567349, 1, 0.1843137, 0, 1,
-1.807094, -0.1961115, -1.869302, 1, 0.1921569, 0, 1,
-1.785032, 1.062301, -2.08432, 1, 0.1960784, 0, 1,
-1.767749, 0.435322, -1.915111, 1, 0.2039216, 0, 1,
-1.751144, -1.661732, -3.71777, 1, 0.2117647, 0, 1,
-1.716402, -0.8523596, -1.487704, 1, 0.2156863, 0, 1,
-1.709637, -0.3346828, -1.127935, 1, 0.2235294, 0, 1,
-1.705823, -0.7998013, -0.9204569, 1, 0.227451, 0, 1,
-1.691408, -1.082231, -1.664584, 1, 0.2352941, 0, 1,
-1.668843, 1.400028, -0.05652669, 1, 0.2392157, 0, 1,
-1.664613, 1.385606, -1.266506, 1, 0.2470588, 0, 1,
-1.663046, -0.08004005, -2.571971, 1, 0.2509804, 0, 1,
-1.644472, 0.1161695, -1.445137, 1, 0.2588235, 0, 1,
-1.640614, 1.450844, -0.5050337, 1, 0.2627451, 0, 1,
-1.609053, 0.1823628, -1.929686, 1, 0.2705882, 0, 1,
-1.599883, -2.54697, -2.376083, 1, 0.2745098, 0, 1,
-1.599245, 1.110013, -0.8779415, 1, 0.282353, 0, 1,
-1.5987, 1.469279, 0.8152056, 1, 0.2862745, 0, 1,
-1.597004, 0.5698915, -1.198124, 1, 0.2941177, 0, 1,
-1.595821, 0.4879665, -0.7284258, 1, 0.3019608, 0, 1,
-1.588481, -0.8070912, -2.523546, 1, 0.3058824, 0, 1,
-1.587611, 3.131895, -1.880321, 1, 0.3137255, 0, 1,
-1.576229, -0.3743938, -2.149498, 1, 0.3176471, 0, 1,
-1.564627, -0.9009408, -3.148376, 1, 0.3254902, 0, 1,
-1.563061, -1.004121, -1.145075, 1, 0.3294118, 0, 1,
-1.548069, -0.01297954, -1.765015, 1, 0.3372549, 0, 1,
-1.546932, -0.1833623, -2.666286, 1, 0.3411765, 0, 1,
-1.543047, 0.5654071, -0.8429638, 1, 0.3490196, 0, 1,
-1.540379, 0.4284965, -1.298743, 1, 0.3529412, 0, 1,
-1.539773, 1.077518, -1.770836, 1, 0.3607843, 0, 1,
-1.527272, 0.6790546, -0.8182436, 1, 0.3647059, 0, 1,
-1.509435, -0.8463247, -3.52033, 1, 0.372549, 0, 1,
-1.50916, 2.317021, -0.9012545, 1, 0.3764706, 0, 1,
-1.504622, -1.473963, -1.787606, 1, 0.3843137, 0, 1,
-1.492641, -0.03897494, -2.816475, 1, 0.3882353, 0, 1,
-1.470542, 1.37988, 0.5573789, 1, 0.3960784, 0, 1,
-1.470084, 1.135408, -0.657196, 1, 0.4039216, 0, 1,
-1.463175, 0.7252795, -2.846718, 1, 0.4078431, 0, 1,
-1.459103, -0.300873, -2.423519, 1, 0.4156863, 0, 1,
-1.446867, -0.3534557, -2.354424, 1, 0.4196078, 0, 1,
-1.439532, 0.9905964, 0.2235333, 1, 0.427451, 0, 1,
-1.438084, 1.447954, -1.599595, 1, 0.4313726, 0, 1,
-1.437032, 0.9726667, -0.5834109, 1, 0.4392157, 0, 1,
-1.42635, 0.3668653, -2.293245, 1, 0.4431373, 0, 1,
-1.419498, 0.5258397, -1.776947, 1, 0.4509804, 0, 1,
-1.414284, -0.7610394, -1.420523, 1, 0.454902, 0, 1,
-1.412822, 0.6689987, -1.816541, 1, 0.4627451, 0, 1,
-1.405843, 1.281375, -1.696971, 1, 0.4666667, 0, 1,
-1.399628, -0.4732939, -2.622826, 1, 0.4745098, 0, 1,
-1.386837, -0.8508216, -2.114252, 1, 0.4784314, 0, 1,
-1.377222, -0.6582335, -2.148215, 1, 0.4862745, 0, 1,
-1.376356, -0.3594112, -2.329198, 1, 0.4901961, 0, 1,
-1.367346, -0.1914961, -1.489663, 1, 0.4980392, 0, 1,
-1.363125, -1.695544, -2.846733, 1, 0.5058824, 0, 1,
-1.362947, 0.3351105, -0.8603638, 1, 0.509804, 0, 1,
-1.353319, 0.525166, -0.8574667, 1, 0.5176471, 0, 1,
-1.347071, -1.252327, -1.656324, 1, 0.5215687, 0, 1,
-1.336042, 1.747388, -0.7130049, 1, 0.5294118, 0, 1,
-1.316659, 0.8476927, 0.3893085, 1, 0.5333334, 0, 1,
-1.302338, 0.9183743, -0.5841047, 1, 0.5411765, 0, 1,
-1.299882, 0.1774442, -2.81133, 1, 0.5450981, 0, 1,
-1.296192, 0.6650659, -2.565628, 1, 0.5529412, 0, 1,
-1.292074, -0.9589705, -2.08417, 1, 0.5568628, 0, 1,
-1.290014, 0.8520178, -1.171267, 1, 0.5647059, 0, 1,
-1.289871, 1.165513, -2.867159, 1, 0.5686275, 0, 1,
-1.286908, 0.1166859, -2.812213, 1, 0.5764706, 0, 1,
-1.277771, 0.6305073, -1.244839, 1, 0.5803922, 0, 1,
-1.273291, -0.1343729, -2.39896, 1, 0.5882353, 0, 1,
-1.264488, -0.2674161, -3.699724, 1, 0.5921569, 0, 1,
-1.26367, -0.1843357, -1.05034, 1, 0.6, 0, 1,
-1.258059, 0.6176899, -0.7018729, 1, 0.6078432, 0, 1,
-1.257416, -0.6290823, -1.485405, 1, 0.6117647, 0, 1,
-1.248888, 1.702291, 0.5695214, 1, 0.6196079, 0, 1,
-1.245791, -1.225663, -1.142678, 1, 0.6235294, 0, 1,
-1.245051, -0.3002304, -1.410711, 1, 0.6313726, 0, 1,
-1.239833, 0.7050174, -0.4687206, 1, 0.6352941, 0, 1,
-1.229257, 0.5216599, -2.165411, 1, 0.6431373, 0, 1,
-1.229205, 1.730517, 0.3459199, 1, 0.6470588, 0, 1,
-1.22736, 0.2537417, -3.517091, 1, 0.654902, 0, 1,
-1.223713, -1.129801, -2.876627, 1, 0.6588235, 0, 1,
-1.221101, -2.087162, -1.889225, 1, 0.6666667, 0, 1,
-1.221055, -0.9323516, -2.444829, 1, 0.6705883, 0, 1,
-1.215749, 1.163947, -1.182568, 1, 0.6784314, 0, 1,
-1.211754, 1.377851, -0.38787, 1, 0.682353, 0, 1,
-1.20912, -0.9651344, -1.81786, 1, 0.6901961, 0, 1,
-1.207419, 0.3145063, -3.801654, 1, 0.6941177, 0, 1,
-1.200179, -0.1146592, -1.785142, 1, 0.7019608, 0, 1,
-1.199273, -0.2040979, -1.25688, 1, 0.7098039, 0, 1,
-1.197223, 1.443, 0.2980728, 1, 0.7137255, 0, 1,
-1.197132, -0.1908768, -2.7608, 1, 0.7215686, 0, 1,
-1.186018, 0.1783501, -0.4057173, 1, 0.7254902, 0, 1,
-1.177134, -0.6086447, -1.738602, 1, 0.7333333, 0, 1,
-1.175173, -0.2752574, -1.980919, 1, 0.7372549, 0, 1,
-1.167456, -1.608874, -3.774362, 1, 0.7450981, 0, 1,
-1.161936, -1.465376, -1.044481, 1, 0.7490196, 0, 1,
-1.160713, 1.349568, -1.454933, 1, 0.7568628, 0, 1,
-1.157559, -0.3369529, -1.108469, 1, 0.7607843, 0, 1,
-1.146348, -0.5717459, -1.763783, 1, 0.7686275, 0, 1,
-1.145297, -0.8500748, -1.580032, 1, 0.772549, 0, 1,
-1.144284, 0.5046139, 0.5311959, 1, 0.7803922, 0, 1,
-1.143155, 0.269244, -1.004194, 1, 0.7843137, 0, 1,
-1.140276, -1.33172, -2.464793, 1, 0.7921569, 0, 1,
-1.13874, 0.4871339, -1.81387, 1, 0.7960784, 0, 1,
-1.130708, -0.1166099, -2.780325, 1, 0.8039216, 0, 1,
-1.121706, 0.4830115, 2.048779, 1, 0.8117647, 0, 1,
-1.109279, 0.4163134, -1.053007, 1, 0.8156863, 0, 1,
-1.106374, 0.09133637, -2.763879, 1, 0.8235294, 0, 1,
-1.104201, 0.2463918, -1.174798, 1, 0.827451, 0, 1,
-1.103237, 0.3174853, -1.523286, 1, 0.8352941, 0, 1,
-1.102505, -0.4690006, -1.442869, 1, 0.8392157, 0, 1,
-1.101481, 0.4530575, -1.773491, 1, 0.8470588, 0, 1,
-1.095332, -0.1629202, -1.784279, 1, 0.8509804, 0, 1,
-1.091147, -1.082554, -2.632804, 1, 0.8588235, 0, 1,
-1.083798, 0.7887773, -0.7380008, 1, 0.8627451, 0, 1,
-1.081331, 0.7188839, -1.712623, 1, 0.8705882, 0, 1,
-1.081309, -0.04957587, -0.8153964, 1, 0.8745098, 0, 1,
-1.074435, -0.3334505, -0.3489363, 1, 0.8823529, 0, 1,
-1.066306, 1.072286, -0.8597628, 1, 0.8862745, 0, 1,
-1.045721, -1.284757, -0.8785965, 1, 0.8941177, 0, 1,
-1.045412, -0.5255544, -2.134247, 1, 0.8980392, 0, 1,
-1.040293, 0.9808132, -1.276493, 1, 0.9058824, 0, 1,
-1.033562, 1.670003, -1.467453, 1, 0.9137255, 0, 1,
-1.032181, -0.4977583, -0.7497603, 1, 0.9176471, 0, 1,
-1.03205, 2.914172, -0.5748307, 1, 0.9254902, 0, 1,
-1.028198, -0.005224211, -1.716111, 1, 0.9294118, 0, 1,
-1.027459, 0.4906107, -1.641989, 1, 0.9372549, 0, 1,
-1.025571, -2.100726, -1.928597, 1, 0.9411765, 0, 1,
-1.019706, -0.8468249, -2.005171, 1, 0.9490196, 0, 1,
-1.014962, -0.9760026, -3.308328, 1, 0.9529412, 0, 1,
-1.008271, 2.714183, -0.1689271, 1, 0.9607843, 0, 1,
-1.001997, 0.4091448, -0.2531869, 1, 0.9647059, 0, 1,
-0.9933154, -0.6352377, -2.067034, 1, 0.972549, 0, 1,
-0.9930984, 0.6273384, -0.7578255, 1, 0.9764706, 0, 1,
-0.98961, 1.522683, -0.3863578, 1, 0.9843137, 0, 1,
-0.985202, 0.2035601, -1.605605, 1, 0.9882353, 0, 1,
-0.9801478, -0.8299333, -2.335897, 1, 0.9960784, 0, 1,
-0.9607942, 0.5211288, -0.2300831, 0.9960784, 1, 0, 1,
-0.9577264, 0.5058675, 0.7162594, 0.9921569, 1, 0, 1,
-0.9490477, -0.8810319, -1.596799, 0.9843137, 1, 0, 1,
-0.9448313, -0.7306933, -1.128032, 0.9803922, 1, 0, 1,
-0.9431188, 0.7505494, -0.5836964, 0.972549, 1, 0, 1,
-0.936785, -0.3692748, -2.605993, 0.9686275, 1, 0, 1,
-0.9327157, 0.4783984, -1.058916, 0.9607843, 1, 0, 1,
-0.923161, -0.9606191, -1.569923, 0.9568627, 1, 0, 1,
-0.9187647, 1.196276, -1.483412, 0.9490196, 1, 0, 1,
-0.9152358, -2.024453, -2.135549, 0.945098, 1, 0, 1,
-0.911505, -0.3624968, -1.149433, 0.9372549, 1, 0, 1,
-0.9068305, 0.4470927, 0.1733532, 0.9333333, 1, 0, 1,
-0.9015451, 0.6824605, 0.4946224, 0.9254902, 1, 0, 1,
-0.8978114, -0.5452741, -2.26979, 0.9215686, 1, 0, 1,
-0.8907509, -0.3126513, -0.2937773, 0.9137255, 1, 0, 1,
-0.8895652, 0.9915454, 0.906629, 0.9098039, 1, 0, 1,
-0.8893151, 0.1205118, -2.315467, 0.9019608, 1, 0, 1,
-0.889183, -1.591166, -3.29987, 0.8941177, 1, 0, 1,
-0.8845195, 0.2789343, -2.396025, 0.8901961, 1, 0, 1,
-0.8806759, 2.094578, -0.9772543, 0.8823529, 1, 0, 1,
-0.8801402, -1.164469, -2.747911, 0.8784314, 1, 0, 1,
-0.876991, -0.3869755, -1.376079, 0.8705882, 1, 0, 1,
-0.8729789, 0.9483317, -1.870043, 0.8666667, 1, 0, 1,
-0.8654332, -0.3411112, -3.759864, 0.8588235, 1, 0, 1,
-0.8648096, -1.330819, -2.838324, 0.854902, 1, 0, 1,
-0.8610274, -0.5480063, -1.896855, 0.8470588, 1, 0, 1,
-0.8537882, 0.1966158, -0.5238842, 0.8431373, 1, 0, 1,
-0.8383196, -0.5825436, -1.918075, 0.8352941, 1, 0, 1,
-0.8380251, -0.6252145, -1.407316, 0.8313726, 1, 0, 1,
-0.8367218, 0.3342382, -1.834347, 0.8235294, 1, 0, 1,
-0.8353526, 0.5008426, -0.8064153, 0.8196079, 1, 0, 1,
-0.8211803, -0.5178176, -2.17766, 0.8117647, 1, 0, 1,
-0.8196447, 0.4478363, -0.7110075, 0.8078431, 1, 0, 1,
-0.8192036, -0.7225558, -2.907819, 0.8, 1, 0, 1,
-0.8184788, 0.7455379, -1.050581, 0.7921569, 1, 0, 1,
-0.8155471, -1.146955, -2.162313, 0.7882353, 1, 0, 1,
-0.8143265, -0.06868252, -2.630681, 0.7803922, 1, 0, 1,
-0.8061944, -0.510904, -1.754398, 0.7764706, 1, 0, 1,
-0.8024625, -0.4860817, -1.804474, 0.7686275, 1, 0, 1,
-0.8001173, 0.785889, -0.5773959, 0.7647059, 1, 0, 1,
-0.799287, -0.003216168, -0.672103, 0.7568628, 1, 0, 1,
-0.7945122, 1.238382, -1.475158, 0.7529412, 1, 0, 1,
-0.7896304, -0.1098234, -1.95024, 0.7450981, 1, 0, 1,
-0.7839728, 1.368201, -0.6149275, 0.7411765, 1, 0, 1,
-0.7806436, 1.45091, -0.1699491, 0.7333333, 1, 0, 1,
-0.7772759, -0.09739972, -1.697495, 0.7294118, 1, 0, 1,
-0.776174, 0.5851519, -1.576199, 0.7215686, 1, 0, 1,
-0.7728116, 1.367224, -1.925128, 0.7176471, 1, 0, 1,
-0.7716252, 0.718078, -1.788435, 0.7098039, 1, 0, 1,
-0.7700689, 2.609725, 1.267413, 0.7058824, 1, 0, 1,
-0.769722, -0.3760768, -1.716856, 0.6980392, 1, 0, 1,
-0.7683159, -1.457112, -2.674866, 0.6901961, 1, 0, 1,
-0.7673211, 0.197668, -0.9140565, 0.6862745, 1, 0, 1,
-0.7661597, -0.1384895, -2.191488, 0.6784314, 1, 0, 1,
-0.7484436, -0.8142926, -1.068133, 0.6745098, 1, 0, 1,
-0.7466751, -0.3156857, -2.69671, 0.6666667, 1, 0, 1,
-0.7345361, -0.5735222, -1.367396, 0.6627451, 1, 0, 1,
-0.7233444, 0.5442953, 0.2206325, 0.654902, 1, 0, 1,
-0.7197307, -0.03942815, -0.6661294, 0.6509804, 1, 0, 1,
-0.7179989, -0.9247747, -1.583395, 0.6431373, 1, 0, 1,
-0.7154232, -0.6175016, -2.305473, 0.6392157, 1, 0, 1,
-0.712702, 2.017946, -1.708495, 0.6313726, 1, 0, 1,
-0.7111445, 1.351994, -1.928133, 0.627451, 1, 0, 1,
-0.7009661, 1.541572, -0.03906117, 0.6196079, 1, 0, 1,
-0.6984985, -0.7708162, -1.698724, 0.6156863, 1, 0, 1,
-0.694917, 0.2327155, -1.440398, 0.6078432, 1, 0, 1,
-0.6926822, 1.450369, -1.742142, 0.6039216, 1, 0, 1,
-0.6914115, -0.0389782, -1.325768, 0.5960785, 1, 0, 1,
-0.6894403, 1.764413, 0.2036608, 0.5882353, 1, 0, 1,
-0.6893699, 0.3385099, -0.0278742, 0.5843138, 1, 0, 1,
-0.689063, -0.3986229, -0.7240329, 0.5764706, 1, 0, 1,
-0.6889769, 0.4124145, -1.568663, 0.572549, 1, 0, 1,
-0.6861729, -0.06878726, -2.160177, 0.5647059, 1, 0, 1,
-0.6840689, 0.8765764, -0.8266463, 0.5607843, 1, 0, 1,
-0.6826209, -0.7663682, -0.5489299, 0.5529412, 1, 0, 1,
-0.6819743, -0.1033141, -0.4812264, 0.5490196, 1, 0, 1,
-0.6793948, 0.550239, 0.2372283, 0.5411765, 1, 0, 1,
-0.6784616, 2.310188, 0.4215019, 0.5372549, 1, 0, 1,
-0.6728096, 0.741094, -1.425515, 0.5294118, 1, 0, 1,
-0.6681535, 0.9564407, -1.999235, 0.5254902, 1, 0, 1,
-0.6659218, 0.163628, -1.569346, 0.5176471, 1, 0, 1,
-0.6619529, -0.9195684, -2.406629, 0.5137255, 1, 0, 1,
-0.6618738, 0.7943851, -1.843927, 0.5058824, 1, 0, 1,
-0.6540429, 0.4237112, -1.283857, 0.5019608, 1, 0, 1,
-0.6510873, -0.1060061, -3.343162, 0.4941176, 1, 0, 1,
-0.6486716, -0.1181696, -0.774841, 0.4862745, 1, 0, 1,
-0.6445148, -0.8809473, -2.153676, 0.4823529, 1, 0, 1,
-0.644345, 1.501564, -2.568686, 0.4745098, 1, 0, 1,
-0.6326309, 0.7544739, -0.6320261, 0.4705882, 1, 0, 1,
-0.6325046, -0.2394154, -2.038214, 0.4627451, 1, 0, 1,
-0.6257196, 1.007167, -1.273778, 0.4588235, 1, 0, 1,
-0.6227053, -0.03257104, -2.038455, 0.4509804, 1, 0, 1,
-0.6208805, -0.9040559, -2.912938, 0.4470588, 1, 0, 1,
-0.6147639, -0.9849533, -2.633987, 0.4392157, 1, 0, 1,
-0.6120622, -0.1800318, -3.268008, 0.4352941, 1, 0, 1,
-0.6113964, 0.2073724, -0.1201809, 0.427451, 1, 0, 1,
-0.6082454, -0.6687493, -2.209551, 0.4235294, 1, 0, 1,
-0.6071392, 1.366758, -0.05792663, 0.4156863, 1, 0, 1,
-0.6044821, 0.1363429, -1.458814, 0.4117647, 1, 0, 1,
-0.6042693, -0.02063175, -2.407429, 0.4039216, 1, 0, 1,
-0.5988429, -0.5384512, -3.668319, 0.3960784, 1, 0, 1,
-0.5974185, -0.346422, -2.736827, 0.3921569, 1, 0, 1,
-0.5960126, 0.8526552, -2.418572, 0.3843137, 1, 0, 1,
-0.5959011, 0.9114746, -0.5923241, 0.3803922, 1, 0, 1,
-0.5934584, -1.173184, -4.091734, 0.372549, 1, 0, 1,
-0.5898638, 0.3111476, -1.276352, 0.3686275, 1, 0, 1,
-0.5896978, 0.1548908, -0.5896801, 0.3607843, 1, 0, 1,
-0.5889236, 0.4681501, -0.558562, 0.3568628, 1, 0, 1,
-0.5879889, 0.2014086, -1.246331, 0.3490196, 1, 0, 1,
-0.5861894, -0.7870392, -1.206707, 0.345098, 1, 0, 1,
-0.5859658, -1.451896, -0.6089921, 0.3372549, 1, 0, 1,
-0.584806, -0.361566, -2.008535, 0.3333333, 1, 0, 1,
-0.5744176, 0.2733998, -0.9374756, 0.3254902, 1, 0, 1,
-0.5697316, -0.1369127, -3.344712, 0.3215686, 1, 0, 1,
-0.5677429, -0.7112368, -2.990941, 0.3137255, 1, 0, 1,
-0.567551, 1.639526, 1.943657, 0.3098039, 1, 0, 1,
-0.5669476, -1.379574, -0.9367273, 0.3019608, 1, 0, 1,
-0.5668575, 1.479221, -0.020151, 0.2941177, 1, 0, 1,
-0.566097, -0.2626583, -3.46288, 0.2901961, 1, 0, 1,
-0.5645859, 0.6688548, -0.01278364, 0.282353, 1, 0, 1,
-0.5571191, 0.101376, -0.07411219, 0.2784314, 1, 0, 1,
-0.5534041, 0.2596244, -0.1487536, 0.2705882, 1, 0, 1,
-0.5524861, -1.853221, -4.940578, 0.2666667, 1, 0, 1,
-0.550164, -0.05313203, -2.512331, 0.2588235, 1, 0, 1,
-0.5500289, -2.198186, -3.356057, 0.254902, 1, 0, 1,
-0.5463245, 0.04617557, -3.880593, 0.2470588, 1, 0, 1,
-0.5423009, -0.3287632, -1.829533, 0.2431373, 1, 0, 1,
-0.5405292, 1.115212, 1.34813, 0.2352941, 1, 0, 1,
-0.5382214, 0.4512743, -0.7194888, 0.2313726, 1, 0, 1,
-0.5346596, 1.429898, 0.04864843, 0.2235294, 1, 0, 1,
-0.5202764, -0.9733051, -2.881626, 0.2196078, 1, 0, 1,
-0.5176124, -1.602564, -1.857176, 0.2117647, 1, 0, 1,
-0.5155708, -0.2091418, -3.117329, 0.2078431, 1, 0, 1,
-0.5149403, 0.3217367, -0.7515792, 0.2, 1, 0, 1,
-0.5084955, 0.5103818, -1.590773, 0.1921569, 1, 0, 1,
-0.507325, -0.9228689, -1.538269, 0.1882353, 1, 0, 1,
-0.504696, -0.1338167, -2.340162, 0.1803922, 1, 0, 1,
-0.5016768, -0.4322126, -2.027217, 0.1764706, 1, 0, 1,
-0.5008925, 2.045781, 1.180979, 0.1686275, 1, 0, 1,
-0.5003183, -1.302697, -2.672742, 0.1647059, 1, 0, 1,
-0.5000834, 0.8874524, -3.182489, 0.1568628, 1, 0, 1,
-0.4974314, 0.9918803, -0.9045994, 0.1529412, 1, 0, 1,
-0.4933378, -0.0590144, -0.7326912, 0.145098, 1, 0, 1,
-0.4912789, 0.2127752, -2.129046, 0.1411765, 1, 0, 1,
-0.4903988, -2.194192, -2.730956, 0.1333333, 1, 0, 1,
-0.4886861, 1.239955, -0.7324033, 0.1294118, 1, 0, 1,
-0.4882815, 0.8491629, 0.8347822, 0.1215686, 1, 0, 1,
-0.4836807, -0.2042856, -0.8988234, 0.1176471, 1, 0, 1,
-0.4810682, -1.131371, -1.928129, 0.1098039, 1, 0, 1,
-0.4757333, 0.5612581, -0.08094086, 0.1058824, 1, 0, 1,
-0.4754869, 0.3612416, -3.048355, 0.09803922, 1, 0, 1,
-0.4714094, 1.382829, -0.2161294, 0.09019608, 1, 0, 1,
-0.4676021, 0.5483082, 0.2287141, 0.08627451, 1, 0, 1,
-0.4659027, 2.025763, 1.553875, 0.07843138, 1, 0, 1,
-0.4641745, -0.3995121, -3.267002, 0.07450981, 1, 0, 1,
-0.4511035, -0.5243291, -2.074176, 0.06666667, 1, 0, 1,
-0.4410334, -0.2399689, -2.974024, 0.0627451, 1, 0, 1,
-0.439805, 0.5270296, 0.5527497, 0.05490196, 1, 0, 1,
-0.4338474, 1.519481, -4.639975, 0.05098039, 1, 0, 1,
-0.4337012, -1.295515, -1.030129, 0.04313726, 1, 0, 1,
-0.4314278, -0.1057026, -1.655557, 0.03921569, 1, 0, 1,
-0.4280655, 0.9560823, 0.271955, 0.03137255, 1, 0, 1,
-0.4230711, 0.4648388, -1.76552, 0.02745098, 1, 0, 1,
-0.4204848, -0.4140055, -1.201475, 0.01960784, 1, 0, 1,
-0.4180444, -0.125563, -0.5189382, 0.01568628, 1, 0, 1,
-0.41535, 1.659751, -0.4895295, 0.007843138, 1, 0, 1,
-0.4149721, -0.04010301, -1.392707, 0.003921569, 1, 0, 1,
-0.4109606, -0.9438777, -3.054336, 0, 1, 0.003921569, 1,
-0.4106036, -0.2813224, -3.419185, 0, 1, 0.01176471, 1,
-0.4088187, 0.5243247, -0.5078882, 0, 1, 0.01568628, 1,
-0.4030832, -0.4336358, -1.443893, 0, 1, 0.02352941, 1,
-0.4013726, 0.7534509, -1.100006, 0, 1, 0.02745098, 1,
-0.3974378, 2.462136, 0.6888151, 0, 1, 0.03529412, 1,
-0.392966, -0.5401517, -3.515474, 0, 1, 0.03921569, 1,
-0.3855723, 2.077454, 0.7218534, 0, 1, 0.04705882, 1,
-0.3819247, 0.05573647, 0.1925133, 0, 1, 0.05098039, 1,
-0.3793553, -0.2807356, -1.397556, 0, 1, 0.05882353, 1,
-0.3774666, 0.9076513, -0.5988219, 0, 1, 0.0627451, 1,
-0.3760251, -0.3570309, -2.521013, 0, 1, 0.07058824, 1,
-0.374506, 0.6928598, -0.7535788, 0, 1, 0.07450981, 1,
-0.3706828, -0.4575466, -2.339814, 0, 1, 0.08235294, 1,
-0.3702028, -0.7614751, -3.155483, 0, 1, 0.08627451, 1,
-0.3693319, 0.2564095, -1.405417, 0, 1, 0.09411765, 1,
-0.3669398, 0.8222933, -1.125061, 0, 1, 0.1019608, 1,
-0.3668227, 0.1584679, -1.144652, 0, 1, 0.1058824, 1,
-0.3664235, -2.506563, -4.374289, 0, 1, 0.1137255, 1,
-0.3646655, 0.7497557, -0.02650464, 0, 1, 0.1176471, 1,
-0.3625742, 0.5201687, -2.225199, 0, 1, 0.1254902, 1,
-0.359868, -0.1337841, -0.7966715, 0, 1, 0.1294118, 1,
-0.3510216, -0.685866, -3.215305, 0, 1, 0.1372549, 1,
-0.3509428, 1.725673, 0.4710555, 0, 1, 0.1411765, 1,
-0.3477789, 0.1433115, -3.035413, 0, 1, 0.1490196, 1,
-0.3427059, 0.0893385, -2.968327, 0, 1, 0.1529412, 1,
-0.3418572, -0.3512791, -2.235259, 0, 1, 0.1607843, 1,
-0.3377713, 0.8312827, -0.2687781, 0, 1, 0.1647059, 1,
-0.3375351, -1.232106, -2.132505, 0, 1, 0.172549, 1,
-0.3358084, -0.02711328, -1.566456, 0, 1, 0.1764706, 1,
-0.334431, 0.121902, -2.087922, 0, 1, 0.1843137, 1,
-0.3324977, -0.5482997, -1.36606, 0, 1, 0.1882353, 1,
-0.3286266, -0.2795915, -1.760717, 0, 1, 0.1960784, 1,
-0.3179394, 0.9008664, -0.09608771, 0, 1, 0.2039216, 1,
-0.317071, 0.1970394, -2.528808, 0, 1, 0.2078431, 1,
-0.312472, 1.194138, -0.5666314, 0, 1, 0.2156863, 1,
-0.3108465, -0.7978292, -4.612915, 0, 1, 0.2196078, 1,
-0.3087896, 0.4203363, -2.456177, 0, 1, 0.227451, 1,
-0.307435, -0.08393527, -2.534656, 0, 1, 0.2313726, 1,
-0.3015012, 0.09443082, -1.850086, 0, 1, 0.2392157, 1,
-0.300044, 1.56549, -1.438003, 0, 1, 0.2431373, 1,
-0.2999475, -0.4890517, -1.748257, 0, 1, 0.2509804, 1,
-0.2966594, -0.8996757, -2.978374, 0, 1, 0.254902, 1,
-0.2935655, -0.03463544, -1.420087, 0, 1, 0.2627451, 1,
-0.2921643, -0.2849802, -2.202468, 0, 1, 0.2666667, 1,
-0.2845205, -1.106362, -1.076394, 0, 1, 0.2745098, 1,
-0.2842996, 1.178969, 0.5387213, 0, 1, 0.2784314, 1,
-0.2808629, 0.1613613, -1.183891, 0, 1, 0.2862745, 1,
-0.2797115, 0.2706786, -0.06735601, 0, 1, 0.2901961, 1,
-0.275647, 0.1814957, -0.2274332, 0, 1, 0.2980392, 1,
-0.2722187, -0.3296006, -1.703715, 0, 1, 0.3058824, 1,
-0.2702346, -1.872233, -3.689543, 0, 1, 0.3098039, 1,
-0.2671221, 0.2616152, -0.6695918, 0, 1, 0.3176471, 1,
-0.266901, 0.03648829, -0.9939308, 0, 1, 0.3215686, 1,
-0.2586694, 0.7954332, -0.2898089, 0, 1, 0.3294118, 1,
-0.2578106, -1.168318, -1.709955, 0, 1, 0.3333333, 1,
-0.2538083, 0.7231426, -0.3654058, 0, 1, 0.3411765, 1,
-0.2493579, 0.8597975, -0.4828339, 0, 1, 0.345098, 1,
-0.2489903, 0.3021633, -0.3637851, 0, 1, 0.3529412, 1,
-0.2470191, 0.7062775, -0.08979122, 0, 1, 0.3568628, 1,
-0.2438372, -0.2552294, -1.469099, 0, 1, 0.3647059, 1,
-0.2397057, 2.499526, -0.1773798, 0, 1, 0.3686275, 1,
-0.2378214, -0.7330293, -3.625937, 0, 1, 0.3764706, 1,
-0.2368709, -1.430437, -1.720787, 0, 1, 0.3803922, 1,
-0.2329234, -0.6870416, -3.905992, 0, 1, 0.3882353, 1,
-0.2285119, 0.692092, -0.5125478, 0, 1, 0.3921569, 1,
-0.2248438, 2.052465, -1.857958, 0, 1, 0.4, 1,
-0.2235391, 1.837881, 2.556849, 0, 1, 0.4078431, 1,
-0.2228274, 0.6954604, 0.1613422, 0, 1, 0.4117647, 1,
-0.2196694, -1.880128, -3.825084, 0, 1, 0.4196078, 1,
-0.2174977, -1.795719, -1.920641, 0, 1, 0.4235294, 1,
-0.2171283, 1.264356, -0.08054705, 0, 1, 0.4313726, 1,
-0.2168639, -0.4642608, -4.254159, 0, 1, 0.4352941, 1,
-0.2108516, -0.9383305, -5.512712, 0, 1, 0.4431373, 1,
-0.2102662, -0.653908, -3.2886, 0, 1, 0.4470588, 1,
-0.2102349, 1.089785, -0.4672889, 0, 1, 0.454902, 1,
-0.2094248, 0.5448217, 0.09359509, 0, 1, 0.4588235, 1,
-0.2047961, 0.4808097, -0.1465208, 0, 1, 0.4666667, 1,
-0.19686, 1.147791, -0.7809154, 0, 1, 0.4705882, 1,
-0.1894347, 2.132842, -0.6530561, 0, 1, 0.4784314, 1,
-0.1888911, -1.703618, -2.835565, 0, 1, 0.4823529, 1,
-0.1868245, -1.198693, -2.139357, 0, 1, 0.4901961, 1,
-0.1853042, -0.2906987, -2.10255, 0, 1, 0.4941176, 1,
-0.1846485, -2.335194, -3.794219, 0, 1, 0.5019608, 1,
-0.1802364, 1.744034, 0.2816221, 0, 1, 0.509804, 1,
-0.1774513, -0.2156, -0.5204526, 0, 1, 0.5137255, 1,
-0.1767319, -0.04982369, -1.702107, 0, 1, 0.5215687, 1,
-0.1760947, 0.1325438, 0.04403644, 0, 1, 0.5254902, 1,
-0.174403, 1.551409, -1.270813, 0, 1, 0.5333334, 1,
-0.1735457, -0.7692922, -5.931456, 0, 1, 0.5372549, 1,
-0.1713307, -0.4974812, -4.147662, 0, 1, 0.5450981, 1,
-0.1699752, -1.147889, -3.481042, 0, 1, 0.5490196, 1,
-0.1697144, 0.8022709, 0.1230205, 0, 1, 0.5568628, 1,
-0.1645855, 0.8121025, 0.3732744, 0, 1, 0.5607843, 1,
-0.1619452, 0.6299456, -2.458078, 0, 1, 0.5686275, 1,
-0.1607232, -0.4851842, -4.388115, 0, 1, 0.572549, 1,
-0.1590548, -1.556199, -2.370122, 0, 1, 0.5803922, 1,
-0.1574415, -0.03984397, -1.037124, 0, 1, 0.5843138, 1,
-0.1520166, -1.707125, -2.110279, 0, 1, 0.5921569, 1,
-0.1476635, -0.7342135, -1.475668, 0, 1, 0.5960785, 1,
-0.1474848, 0.4010811, 0.04600808, 0, 1, 0.6039216, 1,
-0.1471076, -1.407959, -2.575864, 0, 1, 0.6117647, 1,
-0.1316738, -0.750275, -2.4566, 0, 1, 0.6156863, 1,
-0.1299633, -0.1445175, -2.602517, 0, 1, 0.6235294, 1,
-0.1290949, -1.032173, -1.643004, 0, 1, 0.627451, 1,
-0.1254161, 1.904647, -1.885432, 0, 1, 0.6352941, 1,
-0.121257, 0.9335473, -0.2133222, 0, 1, 0.6392157, 1,
-0.1190181, 0.548439, 1.025209, 0, 1, 0.6470588, 1,
-0.1147764, 0.7989382, 0.1395944, 0, 1, 0.6509804, 1,
-0.1140829, 0.764922, 1.345215, 0, 1, 0.6588235, 1,
-0.1104207, 0.5389677, -0.3466755, 0, 1, 0.6627451, 1,
-0.1076611, 0.37252, 0.1221305, 0, 1, 0.6705883, 1,
-0.107537, -1.107113, -4.076351, 0, 1, 0.6745098, 1,
-0.1057715, 0.9402717, 0.2526307, 0, 1, 0.682353, 1,
-0.1033241, -0.6272351, -2.379778, 0, 1, 0.6862745, 1,
-0.1014249, 1.22878, -0.9179371, 0, 1, 0.6941177, 1,
-0.09893784, 0.9745655, -0.3947257, 0, 1, 0.7019608, 1,
-0.0979119, 0.2672665, 0.7675547, 0, 1, 0.7058824, 1,
-0.09464327, 0.6645582, -0.2816948, 0, 1, 0.7137255, 1,
-0.09140926, -0.14366, -2.940471, 0, 1, 0.7176471, 1,
-0.08934215, 1.856772, -0.5988522, 0, 1, 0.7254902, 1,
-0.0885386, -0.4491823, -2.844453, 0, 1, 0.7294118, 1,
-0.08751413, -0.2796812, -4.006263, 0, 1, 0.7372549, 1,
-0.07937249, 1.099834, 1.877883, 0, 1, 0.7411765, 1,
-0.07745163, -0.6674322, -3.570914, 0, 1, 0.7490196, 1,
-0.07567805, -1.297945, -3.035718, 0, 1, 0.7529412, 1,
-0.07238352, -0.8393641, -3.417677, 0, 1, 0.7607843, 1,
-0.07180008, 1.708514, -0.8252173, 0, 1, 0.7647059, 1,
-0.06857046, -0.09120882, -1.069572, 0, 1, 0.772549, 1,
-0.06621756, 0.05777384, -0.7769377, 0, 1, 0.7764706, 1,
-0.06472879, 0.2577508, -0.473165, 0, 1, 0.7843137, 1,
-0.06188545, 0.192323, -0.9922405, 0, 1, 0.7882353, 1,
-0.06050495, -1.044819, -1.029433, 0, 1, 0.7960784, 1,
-0.0589074, 0.1099544, 0.07967796, 0, 1, 0.8039216, 1,
-0.05602451, -2.425508, -2.891012, 0, 1, 0.8078431, 1,
-0.05375353, 0.007879498, -3.215865, 0, 1, 0.8156863, 1,
-0.04706284, -0.09579724, -5.134797, 0, 1, 0.8196079, 1,
-0.04583469, 1.896764, 0.7491881, 0, 1, 0.827451, 1,
-0.04564293, -1.782197, -4.119963, 0, 1, 0.8313726, 1,
-0.04241327, -0.7389184, -3.507491, 0, 1, 0.8392157, 1,
-0.04066369, -0.7736994, -2.815937, 0, 1, 0.8431373, 1,
-0.03975487, 0.1064273, -0.2688466, 0, 1, 0.8509804, 1,
-0.03075455, 0.2990141, -1.467071, 0, 1, 0.854902, 1,
-0.0306733, -0.2532466, -3.397506, 0, 1, 0.8627451, 1,
-0.02877497, -0.08153541, -2.678689, 0, 1, 0.8666667, 1,
-0.02865816, -0.6936514, -1.20687, 0, 1, 0.8745098, 1,
-0.0272494, -0.9069634, -4.18263, 0, 1, 0.8784314, 1,
-0.02136785, -0.7359877, -3.408161, 0, 1, 0.8862745, 1,
-0.02004763, -0.7820739, -2.483311, 0, 1, 0.8901961, 1,
-0.01831954, 0.8439035, -0.6697262, 0, 1, 0.8980392, 1,
-0.01557519, -0.7888452, -2.142658, 0, 1, 0.9058824, 1,
-0.01535656, 0.00320315, 0.2687484, 0, 1, 0.9098039, 1,
-0.01486146, -0.4779344, -4.316796, 0, 1, 0.9176471, 1,
-0.01174899, 0.644402, -0.2899557, 0, 1, 0.9215686, 1,
-0.006194837, -0.4708629, -4.461794, 0, 1, 0.9294118, 1,
-0.004420287, -0.5493982, -2.149411, 0, 1, 0.9333333, 1,
-0.004031774, -0.3393408, -1.728104, 0, 1, 0.9411765, 1,
-0.003591379, -0.7539442, -3.553353, 0, 1, 0.945098, 1,
-0.002124873, -2.58224, -2.815562, 0, 1, 0.9529412, 1,
-0.001006353, 0.5443494, -0.6296876, 0, 1, 0.9568627, 1,
-0.0003011089, 0.06689528, 1.271215, 0, 1, 0.9647059, 1,
8.777514e-05, 0.2086632, -0.1174394, 0, 1, 0.9686275, 1,
0.007437765, -0.7221588, 2.010812, 0, 1, 0.9764706, 1,
0.008058682, 0.1287522, -0.9082529, 0, 1, 0.9803922, 1,
0.009163434, -0.1329122, 3.053964, 0, 1, 0.9882353, 1,
0.01490549, 1.205886, 0.7765152, 0, 1, 0.9921569, 1,
0.02558279, -0.1676104, 4.80492, 0, 1, 1, 1,
0.02612297, -1.603388, 3.240022, 0, 0.9921569, 1, 1,
0.02723189, -0.665565, 5.123585, 0, 0.9882353, 1, 1,
0.02786016, -0.9112496, 2.454922, 0, 0.9803922, 1, 1,
0.03054234, 0.007420923, 0.07884203, 0, 0.9764706, 1, 1,
0.03266992, 1.075241, 0.1139653, 0, 0.9686275, 1, 1,
0.03713591, 0.1160733, -0.7463972, 0, 0.9647059, 1, 1,
0.04019582, 0.7356316, 0.3259524, 0, 0.9568627, 1, 1,
0.04567584, 0.3235647, -0.5547554, 0, 0.9529412, 1, 1,
0.0457886, 0.4674307, 2.880412, 0, 0.945098, 1, 1,
0.04987272, -1.300022, 2.901564, 0, 0.9411765, 1, 1,
0.05434202, 2.093597, 0.9485131, 0, 0.9333333, 1, 1,
0.07047746, 0.7317172, -1.05875, 0, 0.9294118, 1, 1,
0.07342298, -0.09605269, 1.327956, 0, 0.9215686, 1, 1,
0.07493807, -0.8987119, 5.013299, 0, 0.9176471, 1, 1,
0.07598373, -0.9166285, 2.767825, 0, 0.9098039, 1, 1,
0.07764088, -0.3383943, 3.354367, 0, 0.9058824, 1, 1,
0.07897827, -0.7934178, 0.9498627, 0, 0.8980392, 1, 1,
0.07950292, -0.412393, 2.343402, 0, 0.8901961, 1, 1,
0.08491482, 0.7790801, -1.741272, 0, 0.8862745, 1, 1,
0.08632794, 2.314368, -0.1951714, 0, 0.8784314, 1, 1,
0.08936446, 0.819384, 0.09892125, 0, 0.8745098, 1, 1,
0.09054955, -0.09031975, 2.156171, 0, 0.8666667, 1, 1,
0.0999812, 0.9727951, 2.10515, 0, 0.8627451, 1, 1,
0.1034102, 0.9027734, 2.19253, 0, 0.854902, 1, 1,
0.1079273, 1.412045, -0.09694364, 0, 0.8509804, 1, 1,
0.1109051, 0.3575122, -1.522798, 0, 0.8431373, 1, 1,
0.1172221, -0.311836, 1.903055, 0, 0.8392157, 1, 1,
0.1186282, -0.3483565, 3.072463, 0, 0.8313726, 1, 1,
0.1222373, 0.9838102, 0.3134358, 0, 0.827451, 1, 1,
0.1222505, -2.068112, 1.635362, 0, 0.8196079, 1, 1,
0.1242404, 1.144583, -0.1653112, 0, 0.8156863, 1, 1,
0.1265814, 1.588748, 1.639288, 0, 0.8078431, 1, 1,
0.1277069, -0.627046, 2.183413, 0, 0.8039216, 1, 1,
0.1278181, -0.002392832, 0.962556, 0, 0.7960784, 1, 1,
0.1281471, -0.04886635, 1.424639, 0, 0.7882353, 1, 1,
0.1289362, 0.176676, 0.9207162, 0, 0.7843137, 1, 1,
0.1329337, -0.5472596, 3.542758, 0, 0.7764706, 1, 1,
0.1332103, -0.9405721, 2.402193, 0, 0.772549, 1, 1,
0.1347589, -0.5729741, 0.9876844, 0, 0.7647059, 1, 1,
0.1350437, 0.8357424, 0.05954834, 0, 0.7607843, 1, 1,
0.1371147, -0.1774559, 3.032166, 0, 0.7529412, 1, 1,
0.1373471, -0.3927263, 4.360245, 0, 0.7490196, 1, 1,
0.1376216, -0.667176, 2.829241, 0, 0.7411765, 1, 1,
0.1381382, -0.624164, 0.9868586, 0, 0.7372549, 1, 1,
0.1426311, -0.2122289, 2.937898, 0, 0.7294118, 1, 1,
0.1456261, -0.1155527, 3.148242, 0, 0.7254902, 1, 1,
0.1457, -0.5427511, 3.086022, 0, 0.7176471, 1, 1,
0.152969, 2.242231, -0.2856092, 0, 0.7137255, 1, 1,
0.1533697, -2.018012, 3.349835, 0, 0.7058824, 1, 1,
0.1579113, 1.445069, -0.4225977, 0, 0.6980392, 1, 1,
0.1579461, -0.09094755, 2.296659, 0, 0.6941177, 1, 1,
0.1667585, -0.02872085, 3.681459, 0, 0.6862745, 1, 1,
0.1765628, 1.336955, 1.021912, 0, 0.682353, 1, 1,
0.1766624, 1.011403, -1.94684, 0, 0.6745098, 1, 1,
0.1782463, 0.1541707, -0.6376165, 0, 0.6705883, 1, 1,
0.1788412, 0.02331625, 1.818006, 0, 0.6627451, 1, 1,
0.1794522, 0.7752972, -0.3304135, 0, 0.6588235, 1, 1,
0.1823187, 0.4619681, -0.9655483, 0, 0.6509804, 1, 1,
0.1853553, -1.094316, 3.552524, 0, 0.6470588, 1, 1,
0.1859024, -0.3444434, 3.304649, 0, 0.6392157, 1, 1,
0.1905877, -1.602598, 3.679328, 0, 0.6352941, 1, 1,
0.2014913, 0.1663945, 2.363507, 0, 0.627451, 1, 1,
0.2045647, -0.5811055, 4.452876, 0, 0.6235294, 1, 1,
0.2050024, -0.2653323, 1.970399, 0, 0.6156863, 1, 1,
0.2143747, -1.605611, 1.907607, 0, 0.6117647, 1, 1,
0.2155569, 2.382788, 0.8982356, 0, 0.6039216, 1, 1,
0.2180346, 0.5179073, 1.043682, 0, 0.5960785, 1, 1,
0.2239845, -0.4022162, 2.654311, 0, 0.5921569, 1, 1,
0.2252593, -0.1812655, 0.9057787, 0, 0.5843138, 1, 1,
0.225315, -0.8174487, 4.508577, 0, 0.5803922, 1, 1,
0.2260178, 0.3570131, 2.425828, 0, 0.572549, 1, 1,
0.2263083, 0.5309058, 1.939274, 0, 0.5686275, 1, 1,
0.2332412, 1.427234, -0.5427312, 0, 0.5607843, 1, 1,
0.2358949, 0.2174649, 0.1520386, 0, 0.5568628, 1, 1,
0.2371965, -1.250532, 4.1928, 0, 0.5490196, 1, 1,
0.2378247, -0.2777819, 2.010347, 0, 0.5450981, 1, 1,
0.2430954, -1.050969, 2.920137, 0, 0.5372549, 1, 1,
0.2442141, 0.180288, -0.07919917, 0, 0.5333334, 1, 1,
0.2443495, -0.2136179, 3.176492, 0, 0.5254902, 1, 1,
0.2448846, 0.2369318, 0.7068589, 0, 0.5215687, 1, 1,
0.2466497, -0.3171776, 2.328153, 0, 0.5137255, 1, 1,
0.2468983, 2.414732, 0.05909114, 0, 0.509804, 1, 1,
0.2474993, -1.897531, 3.736699, 0, 0.5019608, 1, 1,
0.2486609, 0.03791575, 0.873997, 0, 0.4941176, 1, 1,
0.2501225, 1.490242, -0.6817349, 0, 0.4901961, 1, 1,
0.2567869, -1.781572, 4.158271, 0, 0.4823529, 1, 1,
0.2573221, 0.498603, 0.3207671, 0, 0.4784314, 1, 1,
0.2610943, 1.305757, -0.0650377, 0, 0.4705882, 1, 1,
0.2679159, -2.027016, 1.822683, 0, 0.4666667, 1, 1,
0.270366, -0.5812429, 3.339655, 0, 0.4588235, 1, 1,
0.2757868, -0.4399223, 3.490038, 0, 0.454902, 1, 1,
0.2758738, 0.2821991, 2.337616, 0, 0.4470588, 1, 1,
0.2776482, 0.2748839, 1.144075, 0, 0.4431373, 1, 1,
0.2809397, 1.010678, -0.6049239, 0, 0.4352941, 1, 1,
0.2840341, 0.2020265, 1.166877, 0, 0.4313726, 1, 1,
0.2883582, 1.212095, -0.3557858, 0, 0.4235294, 1, 1,
0.2889203, -0.7098816, 2.013513, 0, 0.4196078, 1, 1,
0.2899232, -0.1698809, 0.5282981, 0, 0.4117647, 1, 1,
0.292812, -0.5504532, 4.390018, 0, 0.4078431, 1, 1,
0.2955802, 0.5106561, 0.1159558, 0, 0.4, 1, 1,
0.2958749, 1.735192, 0.1455545, 0, 0.3921569, 1, 1,
0.296122, -0.8545874, 4.520521, 0, 0.3882353, 1, 1,
0.29863, -0.4144301, 2.776534, 0, 0.3803922, 1, 1,
0.3027747, 0.2618979, 0.9812574, 0, 0.3764706, 1, 1,
0.3038755, 0.07176281, 1.295186, 0, 0.3686275, 1, 1,
0.3051084, -0.04108855, 1.559363, 0, 0.3647059, 1, 1,
0.3121148, 0.2199536, -0.2164713, 0, 0.3568628, 1, 1,
0.3133483, 0.1867574, 1.253503, 0, 0.3529412, 1, 1,
0.3138311, -0.8638582, 0.9608434, 0, 0.345098, 1, 1,
0.3154617, -1.726706, 3.080739, 0, 0.3411765, 1, 1,
0.3156497, 0.6591239, 0.09425274, 0, 0.3333333, 1, 1,
0.3185711, 0.03006599, -0.6751819, 0, 0.3294118, 1, 1,
0.319798, 1.863738, 2.138854, 0, 0.3215686, 1, 1,
0.3203842, 1.924766, -0.4717709, 0, 0.3176471, 1, 1,
0.3216493, -1.19872, 2.787514, 0, 0.3098039, 1, 1,
0.3245082, 1.074308, 0.3459418, 0, 0.3058824, 1, 1,
0.3307788, 0.5920984, -0.9460468, 0, 0.2980392, 1, 1,
0.3313293, 1.81312, 0.5676304, 0, 0.2901961, 1, 1,
0.3316789, -0.7544616, 3.701269, 0, 0.2862745, 1, 1,
0.3319544, 0.7663102, 1.272791, 0, 0.2784314, 1, 1,
0.3442716, 0.5782599, -0.4305979, 0, 0.2745098, 1, 1,
0.3463674, -0.5265599, 2.594853, 0, 0.2666667, 1, 1,
0.3478586, -0.9449012, 2.977704, 0, 0.2627451, 1, 1,
0.3514165, 0.3151871, 0.7078982, 0, 0.254902, 1, 1,
0.356012, 0.05377882, -0.301879, 0, 0.2509804, 1, 1,
0.3608317, 0.3945075, 0.6833468, 0, 0.2431373, 1, 1,
0.3641477, 1.170628, 1.415189, 0, 0.2392157, 1, 1,
0.3643627, -0.7877859, 2.185109, 0, 0.2313726, 1, 1,
0.3648137, -0.3311363, 3.583586, 0, 0.227451, 1, 1,
0.3648299, -0.4532623, 1.541086, 0, 0.2196078, 1, 1,
0.366739, -0.6589548, 3.642682, 0, 0.2156863, 1, 1,
0.367691, 0.4689619, 0.4921853, 0, 0.2078431, 1, 1,
0.3700262, -0.5690991, 1.583168, 0, 0.2039216, 1, 1,
0.3713675, -0.09353095, 1.521426, 0, 0.1960784, 1, 1,
0.3735248, 1.162321, 0.7395712, 0, 0.1882353, 1, 1,
0.3787246, 0.9095724, 0.7466285, 0, 0.1843137, 1, 1,
0.3792776, 1.534298, 1.839478, 0, 0.1764706, 1, 1,
0.3816298, -0.498063, 3.839822, 0, 0.172549, 1, 1,
0.3816893, 0.01383381, 2.684034, 0, 0.1647059, 1, 1,
0.3822208, -0.1692173, 3.141011, 0, 0.1607843, 1, 1,
0.3836243, -0.8265158, 1.225517, 0, 0.1529412, 1, 1,
0.3846805, -0.7340139, 2.233824, 0, 0.1490196, 1, 1,
0.388798, -0.698705, 2.616327, 0, 0.1411765, 1, 1,
0.3890661, 0.1168918, 1.878313, 0, 0.1372549, 1, 1,
0.392989, 2.029374, 0.3729638, 0, 0.1294118, 1, 1,
0.3933639, -0.1144784, 1.013784, 0, 0.1254902, 1, 1,
0.3979446, 2.051994, 0.4752787, 0, 0.1176471, 1, 1,
0.3988228, 0.7297585, 0.4027312, 0, 0.1137255, 1, 1,
0.413452, -1.58019, 3.862407, 0, 0.1058824, 1, 1,
0.4142623, -0.05201523, -0.5576203, 0, 0.09803922, 1, 1,
0.4144263, 0.8879789, -0.371029, 0, 0.09411765, 1, 1,
0.4178671, -0.1324108, -0.9201103, 0, 0.08627451, 1, 1,
0.4202086, -1.137092, 2.966779, 0, 0.08235294, 1, 1,
0.4202304, 0.4473285, 1.12167, 0, 0.07450981, 1, 1,
0.4221621, 0.7381716, 0.3265256, 0, 0.07058824, 1, 1,
0.4245282, -0.5811106, 1.532034, 0, 0.0627451, 1, 1,
0.4247165, 0.2589021, 1.180876, 0, 0.05882353, 1, 1,
0.4249704, 0.419594, 0.6737178, 0, 0.05098039, 1, 1,
0.431901, 0.09091014, 2.033196, 0, 0.04705882, 1, 1,
0.4367808, -1.416706, 3.324296, 0, 0.03921569, 1, 1,
0.4409817, -1.965308, 4.898261, 0, 0.03529412, 1, 1,
0.4424669, -1.092496, 2.372637, 0, 0.02745098, 1, 1,
0.4443245, 0.1438215, 0.743961, 0, 0.02352941, 1, 1,
0.4457546, -0.4401149, 3.227977, 0, 0.01568628, 1, 1,
0.4489239, 0.5642999, 0.4127674, 0, 0.01176471, 1, 1,
0.4504232, 0.0308689, 2.664429, 0, 0.003921569, 1, 1,
0.454388, 0.4497961, 0.4081833, 0.003921569, 0, 1, 1,
0.4602904, -1.020562, 3.065035, 0.007843138, 0, 1, 1,
0.4613542, 0.1033267, 2.003082, 0.01568628, 0, 1, 1,
0.4615817, -0.3724427, 0.4840204, 0.01960784, 0, 1, 1,
0.4686295, 0.02260393, 0.7695052, 0.02745098, 0, 1, 1,
0.4693479, 0.01450453, 2.675358, 0.03137255, 0, 1, 1,
0.4783745, -0.191191, 3.038518, 0.03921569, 0, 1, 1,
0.4816772, -0.06867182, 1.628444, 0.04313726, 0, 1, 1,
0.4845402, -0.8733929, 3.447527, 0.05098039, 0, 1, 1,
0.485372, 0.8395721, 1.15853, 0.05490196, 0, 1, 1,
0.5001061, -0.2489771, 2.694217, 0.0627451, 0, 1, 1,
0.501767, 1.616833, 1.66463, 0.06666667, 0, 1, 1,
0.507719, -0.1080735, 0.04040768, 0.07450981, 0, 1, 1,
0.5077909, -1.853862, 2.203977, 0.07843138, 0, 1, 1,
0.5080295, -0.6973348, 3.051799, 0.08627451, 0, 1, 1,
0.5117847, -0.3840046, 2.336726, 0.09019608, 0, 1, 1,
0.5160621, 0.1784826, -0.6759886, 0.09803922, 0, 1, 1,
0.5179334, 0.03278073, 0.4445489, 0.1058824, 0, 1, 1,
0.5286841, 0.1455867, -0.7312291, 0.1098039, 0, 1, 1,
0.5291854, 0.02443292, 0.6343253, 0.1176471, 0, 1, 1,
0.5455112, -0.1057316, -0.04403793, 0.1215686, 0, 1, 1,
0.5511243, -0.4795832, 2.826833, 0.1294118, 0, 1, 1,
0.5537102, -1.059332, 1.834003, 0.1333333, 0, 1, 1,
0.5595887, -0.849277, 3.729454, 0.1411765, 0, 1, 1,
0.561988, -0.1541203, 3.948504, 0.145098, 0, 1, 1,
0.5627009, -1.569865, 3.083488, 0.1529412, 0, 1, 1,
0.5633084, 1.882688, 1.18085, 0.1568628, 0, 1, 1,
0.564314, -1.36904, 1.887629, 0.1647059, 0, 1, 1,
0.5672053, 2.234247, -0.1568146, 0.1686275, 0, 1, 1,
0.5701568, 0.4247288, 0.7146428, 0.1764706, 0, 1, 1,
0.5705509, 0.007741695, 1.909805, 0.1803922, 0, 1, 1,
0.5749444, 0.1802981, 2.282087, 0.1882353, 0, 1, 1,
0.577904, -1.139147, 1.62852, 0.1921569, 0, 1, 1,
0.5782194, -0.8608606, 2.623378, 0.2, 0, 1, 1,
0.5791562, -0.8750135, 1.12616, 0.2078431, 0, 1, 1,
0.5802245, -0.3294882, 2.46759, 0.2117647, 0, 1, 1,
0.5819908, 0.3452639, 1.112273, 0.2196078, 0, 1, 1,
0.589348, -1.057657, 3.37373, 0.2235294, 0, 1, 1,
0.5965095, 1.856057, -0.2004875, 0.2313726, 0, 1, 1,
0.597601, -0.714852, 4.35443, 0.2352941, 0, 1, 1,
0.5999978, 0.04634019, -0.7305223, 0.2431373, 0, 1, 1,
0.6044844, 0.06473237, 1.486274, 0.2470588, 0, 1, 1,
0.609318, -0.131286, 1.646953, 0.254902, 0, 1, 1,
0.6095874, 0.7507204, 0.8589866, 0.2588235, 0, 1, 1,
0.6115496, -0.8160719, 2.94727, 0.2666667, 0, 1, 1,
0.6142929, 0.05707087, 1.418431, 0.2705882, 0, 1, 1,
0.6148767, -0.4005406, 3.342983, 0.2784314, 0, 1, 1,
0.6149489, -0.9640992, 0.9378325, 0.282353, 0, 1, 1,
0.6224423, -0.7830745, 2.214723, 0.2901961, 0, 1, 1,
0.6240997, -0.3101056, 1.523129, 0.2941177, 0, 1, 1,
0.6263263, -0.819804, 3.082606, 0.3019608, 0, 1, 1,
0.6323421, 0.5414903, 0.5993646, 0.3098039, 0, 1, 1,
0.6347418, 0.03803269, 2.15613, 0.3137255, 0, 1, 1,
0.6373293, -0.1175577, 4.440743, 0.3215686, 0, 1, 1,
0.6376871, 0.4786285, 2.293535, 0.3254902, 0, 1, 1,
0.6398862, 0.09325365, 0.5003998, 0.3333333, 0, 1, 1,
0.6412973, 0.04572789, 3.201772, 0.3372549, 0, 1, 1,
0.6461439, -1.279868, 3.60185, 0.345098, 0, 1, 1,
0.6501176, 0.9891084, 0.2568996, 0.3490196, 0, 1, 1,
0.6529745, 1.23564, 1.049545, 0.3568628, 0, 1, 1,
0.6545812, 0.5350624, 1.19746, 0.3607843, 0, 1, 1,
0.6593509, -0.3393832, 0.3955558, 0.3686275, 0, 1, 1,
0.6597019, -1.632527, 3.305983, 0.372549, 0, 1, 1,
0.663614, -0.9555124, 1.999975, 0.3803922, 0, 1, 1,
0.6644641, -1.402691, 2.639199, 0.3843137, 0, 1, 1,
0.6700808, -0.08075675, 2.125428, 0.3921569, 0, 1, 1,
0.6765029, -0.02184017, 1.899222, 0.3960784, 0, 1, 1,
0.677542, -0.9235175, 2.169443, 0.4039216, 0, 1, 1,
0.678511, -0.5509747, 3.43131, 0.4117647, 0, 1, 1,
0.6821136, -0.2520359, 2.48028, 0.4156863, 0, 1, 1,
0.6831747, 0.3696949, 1.307219, 0.4235294, 0, 1, 1,
0.68819, 1.200448, 0.4343729, 0.427451, 0, 1, 1,
0.6904581, 0.6163334, 0.5333549, 0.4352941, 0, 1, 1,
0.6918235, -0.715053, 1.339686, 0.4392157, 0, 1, 1,
0.6961549, 1.690021, 1.695031, 0.4470588, 0, 1, 1,
0.6971368, -0.6396061, 4.412637, 0.4509804, 0, 1, 1,
0.6988299, -0.257885, 3.06581, 0.4588235, 0, 1, 1,
0.6995291, -1.125382, 3.647334, 0.4627451, 0, 1, 1,
0.7062671, -0.1702629, 1.90149, 0.4705882, 0, 1, 1,
0.7085357, 0.5855569, 0.1995638, 0.4745098, 0, 1, 1,
0.7085529, 0.5016896, -0.8070784, 0.4823529, 0, 1, 1,
0.7097357, -0.1652299, 2.123547, 0.4862745, 0, 1, 1,
0.710241, 0.1983156, 1.459064, 0.4941176, 0, 1, 1,
0.7119731, 1.124608, -1.378415, 0.5019608, 0, 1, 1,
0.7126107, 0.661297, 0.8797173, 0.5058824, 0, 1, 1,
0.7129539, 0.2251911, 1.0373, 0.5137255, 0, 1, 1,
0.7170478, -0.167478, 1.171074, 0.5176471, 0, 1, 1,
0.71736, -0.9983309, 3.406151, 0.5254902, 0, 1, 1,
0.7210478, -2.453043, 2.919435, 0.5294118, 0, 1, 1,
0.7240068, 1.40326, 0.9647503, 0.5372549, 0, 1, 1,
0.7246718, 0.05936425, 0.766196, 0.5411765, 0, 1, 1,
0.725723, -0.1392789, 1.645828, 0.5490196, 0, 1, 1,
0.727127, -0.06118302, 0.9267891, 0.5529412, 0, 1, 1,
0.729258, -1.136026, 2.004701, 0.5607843, 0, 1, 1,
0.7305777, 0.7561495, 0.9215041, 0.5647059, 0, 1, 1,
0.7399795, 0.02171023, -0.1775087, 0.572549, 0, 1, 1,
0.7424365, 1.639925, 0.849308, 0.5764706, 0, 1, 1,
0.7477593, -0.8952782, 2.912518, 0.5843138, 0, 1, 1,
0.7535598, 0.78126, 0.4081154, 0.5882353, 0, 1, 1,
0.7538887, -1.610418, 2.875161, 0.5960785, 0, 1, 1,
0.7551788, -0.2612417, 3.248757, 0.6039216, 0, 1, 1,
0.7571892, -1.03208, 3.168727, 0.6078432, 0, 1, 1,
0.7588407, 0.5576628, 0.1391638, 0.6156863, 0, 1, 1,
0.759093, -0.4674965, 3.788219, 0.6196079, 0, 1, 1,
0.7608166, 0.02713631, 3.1909, 0.627451, 0, 1, 1,
0.7665967, -0.8193406, 3.12329, 0.6313726, 0, 1, 1,
0.7723807, 1.546022, 1.491718, 0.6392157, 0, 1, 1,
0.7762753, 0.2018806, 1.303259, 0.6431373, 0, 1, 1,
0.7793832, 1.021678, 1.054506, 0.6509804, 0, 1, 1,
0.7803394, 1.937627, -0.7180504, 0.654902, 0, 1, 1,
0.7890876, 0.4333504, 1.194406, 0.6627451, 0, 1, 1,
0.796564, -1.099005, 1.005624, 0.6666667, 0, 1, 1,
0.7966327, 2.423236, -0.7890496, 0.6745098, 0, 1, 1,
0.7979297, 1.925017, 1.824757, 0.6784314, 0, 1, 1,
0.7993857, 0.2764525, 1.325234, 0.6862745, 0, 1, 1,
0.8029522, 0.2876626, 3.126827, 0.6901961, 0, 1, 1,
0.8183019, -0.1182079, -0.006992774, 0.6980392, 0, 1, 1,
0.8296013, -0.004882935, 2.298474, 0.7058824, 0, 1, 1,
0.8297481, 0.008421317, 2.070544, 0.7098039, 0, 1, 1,
0.8321414, -0.1082893, 1.400293, 0.7176471, 0, 1, 1,
0.8343765, 0.5604327, 2.814278, 0.7215686, 0, 1, 1,
0.8353734, -0.7862523, 3.916884, 0.7294118, 0, 1, 1,
0.8363417, -0.5076277, 2.896415, 0.7333333, 0, 1, 1,
0.8374405, -1.558668, 1.196373, 0.7411765, 0, 1, 1,
0.8387395, 0.426995, 0.9187616, 0.7450981, 0, 1, 1,
0.8425075, 1.216225, 1.155196, 0.7529412, 0, 1, 1,
0.8439825, 1.780041, -0.03038002, 0.7568628, 0, 1, 1,
0.8445543, 0.6069177, -0.02306196, 0.7647059, 0, 1, 1,
0.8490014, -0.6371175, 2.365339, 0.7686275, 0, 1, 1,
0.8506694, -0.8554204, 2.774872, 0.7764706, 0, 1, 1,
0.8527128, -0.7357125, 2.93172, 0.7803922, 0, 1, 1,
0.8532956, 0.7182764, 0.1727725, 0.7882353, 0, 1, 1,
0.8541927, 0.4350581, 0.818268, 0.7921569, 0, 1, 1,
0.8575954, 0.3607498, -0.1650666, 0.8, 0, 1, 1,
0.8599636, -0.7101654, 0.1836407, 0.8078431, 0, 1, 1,
0.8607032, -0.036607, 1.990425, 0.8117647, 0, 1, 1,
0.862872, -1.261685, 0.8718291, 0.8196079, 0, 1, 1,
0.8651846, 1.577837, -0.7136614, 0.8235294, 0, 1, 1,
0.8729411, -2.621644, 2.288237, 0.8313726, 0, 1, 1,
0.8765341, 0.8912959, -0.1278184, 0.8352941, 0, 1, 1,
0.8787591, 1.424623, 0.693499, 0.8431373, 0, 1, 1,
0.881337, 0.3318256, 0.5395297, 0.8470588, 0, 1, 1,
0.8831991, 0.03170327, 1.054042, 0.854902, 0, 1, 1,
0.8848202, 0.2443572, 1.051068, 0.8588235, 0, 1, 1,
0.894768, 2.564153, 0.2645727, 0.8666667, 0, 1, 1,
0.8982891, -2.5067, 2.911172, 0.8705882, 0, 1, 1,
0.8996702, 2.364985, 0.3010955, 0.8784314, 0, 1, 1,
0.9000581, -1.535151, 1.151064, 0.8823529, 0, 1, 1,
0.9063565, 0.4388709, 1.60849, 0.8901961, 0, 1, 1,
0.9070534, -0.5713649, 1.276337, 0.8941177, 0, 1, 1,
0.9087909, -1.209064, 1.871331, 0.9019608, 0, 1, 1,
0.9132926, -1.650371, 3.277864, 0.9098039, 0, 1, 1,
0.9163081, 0.3875556, -0.1340326, 0.9137255, 0, 1, 1,
0.9195017, -0.7594081, 1.63712, 0.9215686, 0, 1, 1,
0.9217381, -0.02422654, 0.521516, 0.9254902, 0, 1, 1,
0.9232418, 0.1913766, 0.6192009, 0.9333333, 0, 1, 1,
0.9243485, 1.294985, 0.4944238, 0.9372549, 0, 1, 1,
0.9270891, 0.2091275, 2.464392, 0.945098, 0, 1, 1,
0.9285319, 1.093369, 0.8910113, 0.9490196, 0, 1, 1,
0.9354783, 0.502588, 1.360332, 0.9568627, 0, 1, 1,
0.935817, -1.499619, 4.360168, 0.9607843, 0, 1, 1,
0.93648, -1.369293, 1.699512, 0.9686275, 0, 1, 1,
0.9381968, 0.02746089, 1.443829, 0.972549, 0, 1, 1,
0.9390318, -0.08639539, 2.059753, 0.9803922, 0, 1, 1,
0.9424581, 0.24259, 2.676048, 0.9843137, 0, 1, 1,
0.9532636, -1.393928, 2.288227, 0.9921569, 0, 1, 1,
0.9873278, 0.2123833, 0.04272736, 0.9960784, 0, 1, 1,
0.9879925, 0.2399454, 2.304965, 1, 0, 0.9960784, 1,
0.9882591, 0.6200648, 0.1883639, 1, 0, 0.9882353, 1,
0.9904986, 0.8408618, 2.210995, 1, 0, 0.9843137, 1,
0.9921386, -1.951591, 2.342014, 1, 0, 0.9764706, 1,
0.9983065, 0.4215828, 2.249346, 1, 0, 0.972549, 1,
1.014601, -0.08295598, 0.936353, 1, 0, 0.9647059, 1,
1.023591, -0.1679861, 1.03385, 1, 0, 0.9607843, 1,
1.026786, -0.0732853, 3.43558, 1, 0, 0.9529412, 1,
1.02852, -1.039378, 3.035272, 1, 0, 0.9490196, 1,
1.029039, -0.5987772, 0.678627, 1, 0, 0.9411765, 1,
1.034439, -1.009322, 3.032187, 1, 0, 0.9372549, 1,
1.040403, -0.1374983, 1.556678, 1, 0, 0.9294118, 1,
1.040458, -1.327475, 3.961592, 1, 0, 0.9254902, 1,
1.04276, 0.8702089, 1.320992, 1, 0, 0.9176471, 1,
1.043293, 0.2718175, 0.6952266, 1, 0, 0.9137255, 1,
1.054027, 1.52785, 0.07509555, 1, 0, 0.9058824, 1,
1.054039, 0.3226281, -0.1865351, 1, 0, 0.9019608, 1,
1.054651, 1.349937, 0.03990533, 1, 0, 0.8941177, 1,
1.05987, 0.5451248, -0.5156962, 1, 0, 0.8862745, 1,
1.060798, 0.6129244, 1.167037, 1, 0, 0.8823529, 1,
1.061053, 1.394797, 1.353846, 1, 0, 0.8745098, 1,
1.062178, 0.1013566, 1.123343, 1, 0, 0.8705882, 1,
1.063679, -0.3066707, 1.225883, 1, 0, 0.8627451, 1,
1.063954, 1.623468, 0.6070816, 1, 0, 0.8588235, 1,
1.066132, -0.1561144, 1.793285, 1, 0, 0.8509804, 1,
1.069536, 0.2015784, 1.19702, 1, 0, 0.8470588, 1,
1.073413, 1.454937, 1.201207, 1, 0, 0.8392157, 1,
1.076142, 0.7649397, 0.6912482, 1, 0, 0.8352941, 1,
1.080056, -0.4024515, 1.389127, 1, 0, 0.827451, 1,
1.093042, -1.957998, 1.857407, 1, 0, 0.8235294, 1,
1.093649, 0.570388, -0.5407646, 1, 0, 0.8156863, 1,
1.094265, -0.1999773, 1.591468, 1, 0, 0.8117647, 1,
1.096386, 0.0280115, 0.7737002, 1, 0, 0.8039216, 1,
1.103679, -1.764214, 1.84973, 1, 0, 0.7960784, 1,
1.106167, -0.8229046, 2.748321, 1, 0, 0.7921569, 1,
1.106319, 0.1606973, -0.07297575, 1, 0, 0.7843137, 1,
1.113565, 1.80815, 1.894214, 1, 0, 0.7803922, 1,
1.114126, 0.8031707, -0.3084056, 1, 0, 0.772549, 1,
1.124047, 1.441079, 0.1680963, 1, 0, 0.7686275, 1,
1.147913, -0.662141, 0.9003245, 1, 0, 0.7607843, 1,
1.153399, 1.428883, 0.5354918, 1, 0, 0.7568628, 1,
1.15386, -0.1367768, 0.8242466, 1, 0, 0.7490196, 1,
1.156273, -0.1683553, 1.322879, 1, 0, 0.7450981, 1,
1.165461, 0.8621508, -1.248619, 1, 0, 0.7372549, 1,
1.166674, -0.7947184, 4.586046, 1, 0, 0.7333333, 1,
1.168517, -0.1526443, 0.5292963, 1, 0, 0.7254902, 1,
1.173829, 1.318867, -0.6292189, 1, 0, 0.7215686, 1,
1.175291, -0.6959617, 0.6727769, 1, 0, 0.7137255, 1,
1.18049, -0.920692, 3.913306, 1, 0, 0.7098039, 1,
1.180973, -1.303829, 2.910428, 1, 0, 0.7019608, 1,
1.181108, 0.09261566, 1.127863, 1, 0, 0.6941177, 1,
1.183217, 1.523869, 1.124958, 1, 0, 0.6901961, 1,
1.192035, -0.2625233, 1.250984, 1, 0, 0.682353, 1,
1.193734, 0.9272112, 1.287002, 1, 0, 0.6784314, 1,
1.193914, -0.1565678, 1.074371, 1, 0, 0.6705883, 1,
1.195464, -0.7902279, 1.606367, 1, 0, 0.6666667, 1,
1.197054, -0.07419273, 0.04041851, 1, 0, 0.6588235, 1,
1.20192, -0.4938705, 1.813045, 1, 0, 0.654902, 1,
1.21267, -1.276979, 2.354316, 1, 0, 0.6470588, 1,
1.212897, 1.812882, 0.9188566, 1, 0, 0.6431373, 1,
1.223156, 1.25521, -0.4588904, 1, 0, 0.6352941, 1,
1.228349, 0.2654178, 2.139736, 1, 0, 0.6313726, 1,
1.229741, 0.2880106, 0.5690816, 1, 0, 0.6235294, 1,
1.232671, -1.398761, 4.02222, 1, 0, 0.6196079, 1,
1.243288, 1.509194, -0.4719481, 1, 0, 0.6117647, 1,
1.262634, -1.692841, 2.849935, 1, 0, 0.6078432, 1,
1.265947, 0.5352409, 3.215633, 1, 0, 0.6, 1,
1.266787, -0.1702054, 2.476517, 1, 0, 0.5921569, 1,
1.27211, -0.6863516, 2.403415, 1, 0, 0.5882353, 1,
1.28739, -0.7719356, 2.406314, 1, 0, 0.5803922, 1,
1.289746, -0.2581517, 2.10828, 1, 0, 0.5764706, 1,
1.296013, -0.4423388, 4.072752, 1, 0, 0.5686275, 1,
1.299083, 0.5957634, 0.01108623, 1, 0, 0.5647059, 1,
1.299728, 0.966599, -0.7607815, 1, 0, 0.5568628, 1,
1.306055, 0.9507374, -0.5363947, 1, 0, 0.5529412, 1,
1.310681, -0.5248708, 1.565313, 1, 0, 0.5450981, 1,
1.311428, 0.5293887, 1.211661, 1, 0, 0.5411765, 1,
1.316316, 1.175937, -0.3649524, 1, 0, 0.5333334, 1,
1.316374, 0.05321636, 0.8073611, 1, 0, 0.5294118, 1,
1.340834, -1.202738, 3.106229, 1, 0, 0.5215687, 1,
1.341698, -2.637612, 1.360957, 1, 0, 0.5176471, 1,
1.351845, 0.2613309, 0.4277188, 1, 0, 0.509804, 1,
1.372377, -0.3306594, 2.316359, 1, 0, 0.5058824, 1,
1.383986, 1.273668, -0.4909295, 1, 0, 0.4980392, 1,
1.387688, 0.8421268, 2.322064, 1, 0, 0.4901961, 1,
1.395078, 0.8354964, 2.863764, 1, 0, 0.4862745, 1,
1.397575, 1.91478, 0.1560983, 1, 0, 0.4784314, 1,
1.405944, 0.7523054, 0.2593239, 1, 0, 0.4745098, 1,
1.413298, 0.9714489, -0.09444323, 1, 0, 0.4666667, 1,
1.413855, 0.9235935, 1.443894, 1, 0, 0.4627451, 1,
1.419549, 1.493475, 1.049769, 1, 0, 0.454902, 1,
1.432081, 1.516928, 1.383557, 1, 0, 0.4509804, 1,
1.443303, 0.1025609, 1.469406, 1, 0, 0.4431373, 1,
1.444912, -0.6567265, 1.63733, 1, 0, 0.4392157, 1,
1.456178, -0.913269, 0.7097802, 1, 0, 0.4313726, 1,
1.477827, 0.4625338, 1.336404, 1, 0, 0.427451, 1,
1.481617, 0.02911109, 2.837548, 1, 0, 0.4196078, 1,
1.49855, -0.1997829, 3.738708, 1, 0, 0.4156863, 1,
1.509015, -0.9850261, 1.58224, 1, 0, 0.4078431, 1,
1.512133, 0.8039977, 0.3919267, 1, 0, 0.4039216, 1,
1.519601, 0.9632, 1.823313, 1, 0, 0.3960784, 1,
1.53306, 0.1603164, 1.738961, 1, 0, 0.3882353, 1,
1.541609, 3.096604, 1.739562, 1, 0, 0.3843137, 1,
1.547637, -1.94848, 3.132717, 1, 0, 0.3764706, 1,
1.580722, 1.743265, 0.3865188, 1, 0, 0.372549, 1,
1.586198, 1.676481, -0.138819, 1, 0, 0.3647059, 1,
1.609107, -1.042797, 0.8914313, 1, 0, 0.3607843, 1,
1.64154, -0.8634874, 3.876089, 1, 0, 0.3529412, 1,
1.645643, -0.1520629, 1.826301, 1, 0, 0.3490196, 1,
1.651677, 0.02235036, 1.56816, 1, 0, 0.3411765, 1,
1.658762, -1.309337, 1.118836, 1, 0, 0.3372549, 1,
1.666831, 0.6736436, 4.085814, 1, 0, 0.3294118, 1,
1.676302, 0.09563366, 1.500867, 1, 0, 0.3254902, 1,
1.698581, 0.9910272, 2.359482, 1, 0, 0.3176471, 1,
1.707444, 2.535074, 0.1074602, 1, 0, 0.3137255, 1,
1.718609, 0.1682349, 3.554557, 1, 0, 0.3058824, 1,
1.720478, 0.9254304, 1.745095, 1, 0, 0.2980392, 1,
1.727681, 0.8500957, 0.9056751, 1, 0, 0.2941177, 1,
1.737075, 0.9340003, 1.237587, 1, 0, 0.2862745, 1,
1.747537, -0.287529, 2.22985, 1, 0, 0.282353, 1,
1.776705, 0.9425697, 1.11685, 1, 0, 0.2745098, 1,
1.776902, 0.353603, 1.277999, 1, 0, 0.2705882, 1,
1.783113, 0.277597, 3.181151, 1, 0, 0.2627451, 1,
1.80443, -1.672226, 0.6764014, 1, 0, 0.2588235, 1,
1.805671, 0.3229628, -0.6223655, 1, 0, 0.2509804, 1,
1.806247, -0.6045836, 3.163033, 1, 0, 0.2470588, 1,
1.816837, -0.325937, 0.8540218, 1, 0, 0.2392157, 1,
1.826578, -0.4209958, 1.36, 1, 0, 0.2352941, 1,
1.844312, -1.198856, 1.257049, 1, 0, 0.227451, 1,
1.849653, -0.9171644, 3.110827, 1, 0, 0.2235294, 1,
1.854119, 0.1792123, 0.7634434, 1, 0, 0.2156863, 1,
1.86321, 0.9289654, 1.73684, 1, 0, 0.2117647, 1,
1.891035, -0.2763075, 3.60204, 1, 0, 0.2039216, 1,
1.915235, 0.6710261, 1.464928, 1, 0, 0.1960784, 1,
1.915967, 1.391808, 1.831507, 1, 0, 0.1921569, 1,
1.92799, -1.300602, 1.340926, 1, 0, 0.1843137, 1,
1.935625, 0.4533111, -0.5908175, 1, 0, 0.1803922, 1,
1.94436, 0.1603602, 0.8077107, 1, 0, 0.172549, 1,
1.990581, 0.4475591, 1.565843, 1, 0, 0.1686275, 1,
2.022079, -0.2599691, 2.23267, 1, 0, 0.1607843, 1,
2.025739, 0.4514558, 2.054504, 1, 0, 0.1568628, 1,
2.02901, -0.08277241, 1.532024, 1, 0, 0.1490196, 1,
2.042824, 0.2807045, -0.5027456, 1, 0, 0.145098, 1,
2.048281, -1.216723, 2.443643, 1, 0, 0.1372549, 1,
2.096291, -0.5068588, 2.836754, 1, 0, 0.1333333, 1,
2.120155, 1.379302, 2.108372, 1, 0, 0.1254902, 1,
2.130199, 0.4682777, 1.420991, 1, 0, 0.1215686, 1,
2.138135, 0.5142031, 2.130637, 1, 0, 0.1137255, 1,
2.144299, -0.3994478, 2.439207, 1, 0, 0.1098039, 1,
2.16865, -0.443703, 3.104825, 1, 0, 0.1019608, 1,
2.199311, 0.631583, 0.4124593, 1, 0, 0.09411765, 1,
2.224353, 0.1009163, 3.583067, 1, 0, 0.09019608, 1,
2.22935, 0.0187777, 3.740817, 1, 0, 0.08235294, 1,
2.242298, -0.1950876, 2.871034, 1, 0, 0.07843138, 1,
2.281103, 0.2804724, 3.512275, 1, 0, 0.07058824, 1,
2.311911, -0.6871132, 0.4798217, 1, 0, 0.06666667, 1,
2.371731, 0.8170969, 1.113496, 1, 0, 0.05882353, 1,
2.393959, 0.5818589, 0.2641866, 1, 0, 0.05490196, 1,
2.55923, -0.774292, 0.2956466, 1, 0, 0.04705882, 1,
2.66113, -0.795068, 1.717678, 1, 0, 0.04313726, 1,
2.782139, -0.6811252, 1.54948, 1, 0, 0.03529412, 1,
2.834745, -0.8393582, 1.372439, 1, 0, 0.03137255, 1,
2.86436, 0.4095877, 1.480796, 1, 0, 0.02352941, 1,
2.878587, -0.07014181, 2.066419, 1, 0, 0.01960784, 1,
2.961511, 1.836777, -0.7282875, 1, 0, 0.01176471, 1,
3.632122, -0.02937841, 1.922194, 1, 0, 0.007843138, 1
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
0.2916404, -3.615543, -7.805285, 0, -0.5, 0.5, 0.5,
0.2916404, -3.615543, -7.805285, 1, -0.5, 0.5, 0.5,
0.2916404, -3.615543, -7.805285, 1, 1.5, 0.5, 0.5,
0.2916404, -3.615543, -7.805285, 0, 1.5, 0.5, 0.5
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
-4.181264, 0.2471417, -7.805285, 0, -0.5, 0.5, 0.5,
-4.181264, 0.2471417, -7.805285, 1, -0.5, 0.5, 0.5,
-4.181264, 0.2471417, -7.805285, 1, 1.5, 0.5, 0.5,
-4.181264, 0.2471417, -7.805285, 0, 1.5, 0.5, 0.5
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
-4.181264, -3.615543, -0.4039354, 0, -0.5, 0.5, 0.5,
-4.181264, -3.615543, -0.4039354, 1, -0.5, 0.5, 0.5,
-4.181264, -3.615543, -0.4039354, 1, 1.5, 0.5, 0.5,
-4.181264, -3.615543, -0.4039354, 0, 1.5, 0.5, 0.5
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
-3, -2.724154, -6.097281,
3, -2.724154, -6.097281,
-3, -2.724154, -6.097281,
-3, -2.872719, -6.381948,
-2, -2.724154, -6.097281,
-2, -2.872719, -6.381948,
-1, -2.724154, -6.097281,
-1, -2.872719, -6.381948,
0, -2.724154, -6.097281,
0, -2.872719, -6.381948,
1, -2.724154, -6.097281,
1, -2.872719, -6.381948,
2, -2.724154, -6.097281,
2, -2.872719, -6.381948,
3, -2.724154, -6.097281,
3, -2.872719, -6.381948
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
-3, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
-3, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
-3, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
-3, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
-2, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
-2, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
-2, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
-2, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
-1, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
-1, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
-1, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
-1, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
0, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
0, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
0, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
0, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
1, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
1, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
1, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
1, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
2, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
2, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
2, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
2, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5,
3, -3.169849, -6.951283, 0, -0.5, 0.5, 0.5,
3, -3.169849, -6.951283, 1, -0.5, 0.5, 0.5,
3, -3.169849, -6.951283, 1, 1.5, 0.5, 0.5,
3, -3.169849, -6.951283, 0, 1.5, 0.5, 0.5
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
-3.149056, -2, -6.097281,
-3.149056, 3, -6.097281,
-3.149056, -2, -6.097281,
-3.32109, -2, -6.381948,
-3.149056, -1, -6.097281,
-3.32109, -1, -6.381948,
-3.149056, 0, -6.097281,
-3.32109, 0, -6.381948,
-3.149056, 1, -6.097281,
-3.32109, 1, -6.381948,
-3.149056, 2, -6.097281,
-3.32109, 2, -6.381948,
-3.149056, 3, -6.097281,
-3.32109, 3, -6.381948
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
-3.66516, -2, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, -2, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, -2, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, -2, -6.951283, 0, 1.5, 0.5, 0.5,
-3.66516, -1, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, -1, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, -1, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, -1, -6.951283, 0, 1.5, 0.5, 0.5,
-3.66516, 0, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, 0, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, 0, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, 0, -6.951283, 0, 1.5, 0.5, 0.5,
-3.66516, 1, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, 1, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, 1, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, 1, -6.951283, 0, 1.5, 0.5, 0.5,
-3.66516, 2, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, 2, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, 2, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, 2, -6.951283, 0, 1.5, 0.5, 0.5,
-3.66516, 3, -6.951283, 0, -0.5, 0.5, 0.5,
-3.66516, 3, -6.951283, 1, -0.5, 0.5, 0.5,
-3.66516, 3, -6.951283, 1, 1.5, 0.5, 0.5,
-3.66516, 3, -6.951283, 0, 1.5, 0.5, 0.5
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
-3.149056, -2.724154, -4,
-3.149056, -2.724154, 4,
-3.149056, -2.724154, -4,
-3.32109, -2.872719, -4,
-3.149056, -2.724154, -2,
-3.32109, -2.872719, -2,
-3.149056, -2.724154, 0,
-3.32109, -2.872719, 0,
-3.149056, -2.724154, 2,
-3.32109, -2.872719, 2,
-3.149056, -2.724154, 4,
-3.32109, -2.872719, 4
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
-3.66516, -3.169849, -4, 0, -0.5, 0.5, 0.5,
-3.66516, -3.169849, -4, 1, -0.5, 0.5, 0.5,
-3.66516, -3.169849, -4, 1, 1.5, 0.5, 0.5,
-3.66516, -3.169849, -4, 0, 1.5, 0.5, 0.5,
-3.66516, -3.169849, -2, 0, -0.5, 0.5, 0.5,
-3.66516, -3.169849, -2, 1, -0.5, 0.5, 0.5,
-3.66516, -3.169849, -2, 1, 1.5, 0.5, 0.5,
-3.66516, -3.169849, -2, 0, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 0, 0, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 0, 1, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 0, 1, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 0, 0, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 2, 0, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 2, 1, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 2, 1, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 2, 0, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 4, 0, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 4, 1, -0.5, 0.5, 0.5,
-3.66516, -3.169849, 4, 1, 1.5, 0.5, 0.5,
-3.66516, -3.169849, 4, 0, 1.5, 0.5, 0.5
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
-3.149056, -2.724154, -6.097281,
-3.149056, 3.218438, -6.097281,
-3.149056, -2.724154, 5.289411,
-3.149056, 3.218438, 5.289411,
-3.149056, -2.724154, -6.097281,
-3.149056, -2.724154, 5.289411,
-3.149056, 3.218438, -6.097281,
-3.149056, 3.218438, 5.289411,
-3.149056, -2.724154, -6.097281,
3.732337, -2.724154, -6.097281,
-3.149056, -2.724154, 5.289411,
3.732337, -2.724154, 5.289411,
-3.149056, 3.218438, -6.097281,
3.732337, 3.218438, -6.097281,
-3.149056, 3.218438, 5.289411,
3.732337, 3.218438, 5.289411,
3.732337, -2.724154, -6.097281,
3.732337, 3.218438, -6.097281,
3.732337, -2.724154, 5.289411,
3.732337, 3.218438, 5.289411,
3.732337, -2.724154, -6.097281,
3.732337, -2.724154, 5.289411,
3.732337, 3.218438, -6.097281,
3.732337, 3.218438, 5.289411
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
var radius = 7.780827;
var distance = 34.61777;
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
mvMatrix.translate( -0.2916404, -0.2471417, 0.4039354 );
mvMatrix.scale( 1.222541, 1.415675, 0.7388259 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61777);
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
trietazine<-read.table("trietazine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trietazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
```

```r
y<-trietazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
```

```r
z<-trietazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'trietazine' not found
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
-3.048841, 0.6958087, -1.346346, 0, 0, 1, 1, 1,
-2.928077, 0.5171416, -1.670684, 1, 0, 0, 1, 1,
-2.895798, -0.270726, -1.719808, 1, 0, 0, 1, 1,
-2.643212, 0.04918802, 0.08085453, 1, 0, 0, 1, 1,
-2.600485, -1.844951, -2.048687, 1, 0, 0, 1, 1,
-2.570855, 0.8547822, -2.482833, 1, 0, 0, 1, 1,
-2.541477, 1.137856, -1.406267, 0, 0, 0, 1, 1,
-2.493572, -0.3267985, -1.942248, 0, 0, 0, 1, 1,
-2.482565, -0.6940616, -2.756219, 0, 0, 0, 1, 1,
-2.373868, -0.2141045, -1.905044, 0, 0, 0, 1, 1,
-2.361461, 1.939923, -1.738478, 0, 0, 0, 1, 1,
-2.328842, 1.13983, -2.501387, 0, 0, 0, 1, 1,
-2.270649, -0.447459, -1.751034, 0, 0, 0, 1, 1,
-2.266254, -0.4920624, -1.757877, 1, 1, 1, 1, 1,
-2.250438, -0.5598037, -1.901386, 1, 1, 1, 1, 1,
-2.199635, 0.04786422, -2.108191, 1, 1, 1, 1, 1,
-2.198102, 0.1433531, -0.5398127, 1, 1, 1, 1, 1,
-2.189647, 0.8423002, -1.956253, 1, 1, 1, 1, 1,
-2.104119, -0.4113614, -0.7472915, 1, 1, 1, 1, 1,
-2.07934, -0.3207794, -2.589169, 1, 1, 1, 1, 1,
-2.074504, -0.5984176, -2.957977, 1, 1, 1, 1, 1,
-2.065113, -0.7607794, -2.436362, 1, 1, 1, 1, 1,
-1.975376, 0.5465305, -1.116525, 1, 1, 1, 1, 1,
-1.904642, -0.4449622, -2.039709, 1, 1, 1, 1, 1,
-1.903877, 1.171192, -0.7665428, 1, 1, 1, 1, 1,
-1.899874, 0.2189464, -1.300263, 1, 1, 1, 1, 1,
-1.867217, 0.6919315, -0.6520697, 1, 1, 1, 1, 1,
-1.848081, -0.212147, -2.185527, 1, 1, 1, 1, 1,
-1.843155, -0.4613361, -1.083102, 0, 0, 1, 1, 1,
-1.812734, -0.5910499, -1.424464, 1, 0, 0, 1, 1,
-1.809547, -0.3637301, -2.25758, 1, 0, 0, 1, 1,
-1.808794, -0.2829551, -0.7567349, 1, 0, 0, 1, 1,
-1.807094, -0.1961115, -1.869302, 1, 0, 0, 1, 1,
-1.785032, 1.062301, -2.08432, 1, 0, 0, 1, 1,
-1.767749, 0.435322, -1.915111, 0, 0, 0, 1, 1,
-1.751144, -1.661732, -3.71777, 0, 0, 0, 1, 1,
-1.716402, -0.8523596, -1.487704, 0, 0, 0, 1, 1,
-1.709637, -0.3346828, -1.127935, 0, 0, 0, 1, 1,
-1.705823, -0.7998013, -0.9204569, 0, 0, 0, 1, 1,
-1.691408, -1.082231, -1.664584, 0, 0, 0, 1, 1,
-1.668843, 1.400028, -0.05652669, 0, 0, 0, 1, 1,
-1.664613, 1.385606, -1.266506, 1, 1, 1, 1, 1,
-1.663046, -0.08004005, -2.571971, 1, 1, 1, 1, 1,
-1.644472, 0.1161695, -1.445137, 1, 1, 1, 1, 1,
-1.640614, 1.450844, -0.5050337, 1, 1, 1, 1, 1,
-1.609053, 0.1823628, -1.929686, 1, 1, 1, 1, 1,
-1.599883, -2.54697, -2.376083, 1, 1, 1, 1, 1,
-1.599245, 1.110013, -0.8779415, 1, 1, 1, 1, 1,
-1.5987, 1.469279, 0.8152056, 1, 1, 1, 1, 1,
-1.597004, 0.5698915, -1.198124, 1, 1, 1, 1, 1,
-1.595821, 0.4879665, -0.7284258, 1, 1, 1, 1, 1,
-1.588481, -0.8070912, -2.523546, 1, 1, 1, 1, 1,
-1.587611, 3.131895, -1.880321, 1, 1, 1, 1, 1,
-1.576229, -0.3743938, -2.149498, 1, 1, 1, 1, 1,
-1.564627, -0.9009408, -3.148376, 1, 1, 1, 1, 1,
-1.563061, -1.004121, -1.145075, 1, 1, 1, 1, 1,
-1.548069, -0.01297954, -1.765015, 0, 0, 1, 1, 1,
-1.546932, -0.1833623, -2.666286, 1, 0, 0, 1, 1,
-1.543047, 0.5654071, -0.8429638, 1, 0, 0, 1, 1,
-1.540379, 0.4284965, -1.298743, 1, 0, 0, 1, 1,
-1.539773, 1.077518, -1.770836, 1, 0, 0, 1, 1,
-1.527272, 0.6790546, -0.8182436, 1, 0, 0, 1, 1,
-1.509435, -0.8463247, -3.52033, 0, 0, 0, 1, 1,
-1.50916, 2.317021, -0.9012545, 0, 0, 0, 1, 1,
-1.504622, -1.473963, -1.787606, 0, 0, 0, 1, 1,
-1.492641, -0.03897494, -2.816475, 0, 0, 0, 1, 1,
-1.470542, 1.37988, 0.5573789, 0, 0, 0, 1, 1,
-1.470084, 1.135408, -0.657196, 0, 0, 0, 1, 1,
-1.463175, 0.7252795, -2.846718, 0, 0, 0, 1, 1,
-1.459103, -0.300873, -2.423519, 1, 1, 1, 1, 1,
-1.446867, -0.3534557, -2.354424, 1, 1, 1, 1, 1,
-1.439532, 0.9905964, 0.2235333, 1, 1, 1, 1, 1,
-1.438084, 1.447954, -1.599595, 1, 1, 1, 1, 1,
-1.437032, 0.9726667, -0.5834109, 1, 1, 1, 1, 1,
-1.42635, 0.3668653, -2.293245, 1, 1, 1, 1, 1,
-1.419498, 0.5258397, -1.776947, 1, 1, 1, 1, 1,
-1.414284, -0.7610394, -1.420523, 1, 1, 1, 1, 1,
-1.412822, 0.6689987, -1.816541, 1, 1, 1, 1, 1,
-1.405843, 1.281375, -1.696971, 1, 1, 1, 1, 1,
-1.399628, -0.4732939, -2.622826, 1, 1, 1, 1, 1,
-1.386837, -0.8508216, -2.114252, 1, 1, 1, 1, 1,
-1.377222, -0.6582335, -2.148215, 1, 1, 1, 1, 1,
-1.376356, -0.3594112, -2.329198, 1, 1, 1, 1, 1,
-1.367346, -0.1914961, -1.489663, 1, 1, 1, 1, 1,
-1.363125, -1.695544, -2.846733, 0, 0, 1, 1, 1,
-1.362947, 0.3351105, -0.8603638, 1, 0, 0, 1, 1,
-1.353319, 0.525166, -0.8574667, 1, 0, 0, 1, 1,
-1.347071, -1.252327, -1.656324, 1, 0, 0, 1, 1,
-1.336042, 1.747388, -0.7130049, 1, 0, 0, 1, 1,
-1.316659, 0.8476927, 0.3893085, 1, 0, 0, 1, 1,
-1.302338, 0.9183743, -0.5841047, 0, 0, 0, 1, 1,
-1.299882, 0.1774442, -2.81133, 0, 0, 0, 1, 1,
-1.296192, 0.6650659, -2.565628, 0, 0, 0, 1, 1,
-1.292074, -0.9589705, -2.08417, 0, 0, 0, 1, 1,
-1.290014, 0.8520178, -1.171267, 0, 0, 0, 1, 1,
-1.289871, 1.165513, -2.867159, 0, 0, 0, 1, 1,
-1.286908, 0.1166859, -2.812213, 0, 0, 0, 1, 1,
-1.277771, 0.6305073, -1.244839, 1, 1, 1, 1, 1,
-1.273291, -0.1343729, -2.39896, 1, 1, 1, 1, 1,
-1.264488, -0.2674161, -3.699724, 1, 1, 1, 1, 1,
-1.26367, -0.1843357, -1.05034, 1, 1, 1, 1, 1,
-1.258059, 0.6176899, -0.7018729, 1, 1, 1, 1, 1,
-1.257416, -0.6290823, -1.485405, 1, 1, 1, 1, 1,
-1.248888, 1.702291, 0.5695214, 1, 1, 1, 1, 1,
-1.245791, -1.225663, -1.142678, 1, 1, 1, 1, 1,
-1.245051, -0.3002304, -1.410711, 1, 1, 1, 1, 1,
-1.239833, 0.7050174, -0.4687206, 1, 1, 1, 1, 1,
-1.229257, 0.5216599, -2.165411, 1, 1, 1, 1, 1,
-1.229205, 1.730517, 0.3459199, 1, 1, 1, 1, 1,
-1.22736, 0.2537417, -3.517091, 1, 1, 1, 1, 1,
-1.223713, -1.129801, -2.876627, 1, 1, 1, 1, 1,
-1.221101, -2.087162, -1.889225, 1, 1, 1, 1, 1,
-1.221055, -0.9323516, -2.444829, 0, 0, 1, 1, 1,
-1.215749, 1.163947, -1.182568, 1, 0, 0, 1, 1,
-1.211754, 1.377851, -0.38787, 1, 0, 0, 1, 1,
-1.20912, -0.9651344, -1.81786, 1, 0, 0, 1, 1,
-1.207419, 0.3145063, -3.801654, 1, 0, 0, 1, 1,
-1.200179, -0.1146592, -1.785142, 1, 0, 0, 1, 1,
-1.199273, -0.2040979, -1.25688, 0, 0, 0, 1, 1,
-1.197223, 1.443, 0.2980728, 0, 0, 0, 1, 1,
-1.197132, -0.1908768, -2.7608, 0, 0, 0, 1, 1,
-1.186018, 0.1783501, -0.4057173, 0, 0, 0, 1, 1,
-1.177134, -0.6086447, -1.738602, 0, 0, 0, 1, 1,
-1.175173, -0.2752574, -1.980919, 0, 0, 0, 1, 1,
-1.167456, -1.608874, -3.774362, 0, 0, 0, 1, 1,
-1.161936, -1.465376, -1.044481, 1, 1, 1, 1, 1,
-1.160713, 1.349568, -1.454933, 1, 1, 1, 1, 1,
-1.157559, -0.3369529, -1.108469, 1, 1, 1, 1, 1,
-1.146348, -0.5717459, -1.763783, 1, 1, 1, 1, 1,
-1.145297, -0.8500748, -1.580032, 1, 1, 1, 1, 1,
-1.144284, 0.5046139, 0.5311959, 1, 1, 1, 1, 1,
-1.143155, 0.269244, -1.004194, 1, 1, 1, 1, 1,
-1.140276, -1.33172, -2.464793, 1, 1, 1, 1, 1,
-1.13874, 0.4871339, -1.81387, 1, 1, 1, 1, 1,
-1.130708, -0.1166099, -2.780325, 1, 1, 1, 1, 1,
-1.121706, 0.4830115, 2.048779, 1, 1, 1, 1, 1,
-1.109279, 0.4163134, -1.053007, 1, 1, 1, 1, 1,
-1.106374, 0.09133637, -2.763879, 1, 1, 1, 1, 1,
-1.104201, 0.2463918, -1.174798, 1, 1, 1, 1, 1,
-1.103237, 0.3174853, -1.523286, 1, 1, 1, 1, 1,
-1.102505, -0.4690006, -1.442869, 0, 0, 1, 1, 1,
-1.101481, 0.4530575, -1.773491, 1, 0, 0, 1, 1,
-1.095332, -0.1629202, -1.784279, 1, 0, 0, 1, 1,
-1.091147, -1.082554, -2.632804, 1, 0, 0, 1, 1,
-1.083798, 0.7887773, -0.7380008, 1, 0, 0, 1, 1,
-1.081331, 0.7188839, -1.712623, 1, 0, 0, 1, 1,
-1.081309, -0.04957587, -0.8153964, 0, 0, 0, 1, 1,
-1.074435, -0.3334505, -0.3489363, 0, 0, 0, 1, 1,
-1.066306, 1.072286, -0.8597628, 0, 0, 0, 1, 1,
-1.045721, -1.284757, -0.8785965, 0, 0, 0, 1, 1,
-1.045412, -0.5255544, -2.134247, 0, 0, 0, 1, 1,
-1.040293, 0.9808132, -1.276493, 0, 0, 0, 1, 1,
-1.033562, 1.670003, -1.467453, 0, 0, 0, 1, 1,
-1.032181, -0.4977583, -0.7497603, 1, 1, 1, 1, 1,
-1.03205, 2.914172, -0.5748307, 1, 1, 1, 1, 1,
-1.028198, -0.005224211, -1.716111, 1, 1, 1, 1, 1,
-1.027459, 0.4906107, -1.641989, 1, 1, 1, 1, 1,
-1.025571, -2.100726, -1.928597, 1, 1, 1, 1, 1,
-1.019706, -0.8468249, -2.005171, 1, 1, 1, 1, 1,
-1.014962, -0.9760026, -3.308328, 1, 1, 1, 1, 1,
-1.008271, 2.714183, -0.1689271, 1, 1, 1, 1, 1,
-1.001997, 0.4091448, -0.2531869, 1, 1, 1, 1, 1,
-0.9933154, -0.6352377, -2.067034, 1, 1, 1, 1, 1,
-0.9930984, 0.6273384, -0.7578255, 1, 1, 1, 1, 1,
-0.98961, 1.522683, -0.3863578, 1, 1, 1, 1, 1,
-0.985202, 0.2035601, -1.605605, 1, 1, 1, 1, 1,
-0.9801478, -0.8299333, -2.335897, 1, 1, 1, 1, 1,
-0.9607942, 0.5211288, -0.2300831, 1, 1, 1, 1, 1,
-0.9577264, 0.5058675, 0.7162594, 0, 0, 1, 1, 1,
-0.9490477, -0.8810319, -1.596799, 1, 0, 0, 1, 1,
-0.9448313, -0.7306933, -1.128032, 1, 0, 0, 1, 1,
-0.9431188, 0.7505494, -0.5836964, 1, 0, 0, 1, 1,
-0.936785, -0.3692748, -2.605993, 1, 0, 0, 1, 1,
-0.9327157, 0.4783984, -1.058916, 1, 0, 0, 1, 1,
-0.923161, -0.9606191, -1.569923, 0, 0, 0, 1, 1,
-0.9187647, 1.196276, -1.483412, 0, 0, 0, 1, 1,
-0.9152358, -2.024453, -2.135549, 0, 0, 0, 1, 1,
-0.911505, -0.3624968, -1.149433, 0, 0, 0, 1, 1,
-0.9068305, 0.4470927, 0.1733532, 0, 0, 0, 1, 1,
-0.9015451, 0.6824605, 0.4946224, 0, 0, 0, 1, 1,
-0.8978114, -0.5452741, -2.26979, 0, 0, 0, 1, 1,
-0.8907509, -0.3126513, -0.2937773, 1, 1, 1, 1, 1,
-0.8895652, 0.9915454, 0.906629, 1, 1, 1, 1, 1,
-0.8893151, 0.1205118, -2.315467, 1, 1, 1, 1, 1,
-0.889183, -1.591166, -3.29987, 1, 1, 1, 1, 1,
-0.8845195, 0.2789343, -2.396025, 1, 1, 1, 1, 1,
-0.8806759, 2.094578, -0.9772543, 1, 1, 1, 1, 1,
-0.8801402, -1.164469, -2.747911, 1, 1, 1, 1, 1,
-0.876991, -0.3869755, -1.376079, 1, 1, 1, 1, 1,
-0.8729789, 0.9483317, -1.870043, 1, 1, 1, 1, 1,
-0.8654332, -0.3411112, -3.759864, 1, 1, 1, 1, 1,
-0.8648096, -1.330819, -2.838324, 1, 1, 1, 1, 1,
-0.8610274, -0.5480063, -1.896855, 1, 1, 1, 1, 1,
-0.8537882, 0.1966158, -0.5238842, 1, 1, 1, 1, 1,
-0.8383196, -0.5825436, -1.918075, 1, 1, 1, 1, 1,
-0.8380251, -0.6252145, -1.407316, 1, 1, 1, 1, 1,
-0.8367218, 0.3342382, -1.834347, 0, 0, 1, 1, 1,
-0.8353526, 0.5008426, -0.8064153, 1, 0, 0, 1, 1,
-0.8211803, -0.5178176, -2.17766, 1, 0, 0, 1, 1,
-0.8196447, 0.4478363, -0.7110075, 1, 0, 0, 1, 1,
-0.8192036, -0.7225558, -2.907819, 1, 0, 0, 1, 1,
-0.8184788, 0.7455379, -1.050581, 1, 0, 0, 1, 1,
-0.8155471, -1.146955, -2.162313, 0, 0, 0, 1, 1,
-0.8143265, -0.06868252, -2.630681, 0, 0, 0, 1, 1,
-0.8061944, -0.510904, -1.754398, 0, 0, 0, 1, 1,
-0.8024625, -0.4860817, -1.804474, 0, 0, 0, 1, 1,
-0.8001173, 0.785889, -0.5773959, 0, 0, 0, 1, 1,
-0.799287, -0.003216168, -0.672103, 0, 0, 0, 1, 1,
-0.7945122, 1.238382, -1.475158, 0, 0, 0, 1, 1,
-0.7896304, -0.1098234, -1.95024, 1, 1, 1, 1, 1,
-0.7839728, 1.368201, -0.6149275, 1, 1, 1, 1, 1,
-0.7806436, 1.45091, -0.1699491, 1, 1, 1, 1, 1,
-0.7772759, -0.09739972, -1.697495, 1, 1, 1, 1, 1,
-0.776174, 0.5851519, -1.576199, 1, 1, 1, 1, 1,
-0.7728116, 1.367224, -1.925128, 1, 1, 1, 1, 1,
-0.7716252, 0.718078, -1.788435, 1, 1, 1, 1, 1,
-0.7700689, 2.609725, 1.267413, 1, 1, 1, 1, 1,
-0.769722, -0.3760768, -1.716856, 1, 1, 1, 1, 1,
-0.7683159, -1.457112, -2.674866, 1, 1, 1, 1, 1,
-0.7673211, 0.197668, -0.9140565, 1, 1, 1, 1, 1,
-0.7661597, -0.1384895, -2.191488, 1, 1, 1, 1, 1,
-0.7484436, -0.8142926, -1.068133, 1, 1, 1, 1, 1,
-0.7466751, -0.3156857, -2.69671, 1, 1, 1, 1, 1,
-0.7345361, -0.5735222, -1.367396, 1, 1, 1, 1, 1,
-0.7233444, 0.5442953, 0.2206325, 0, 0, 1, 1, 1,
-0.7197307, -0.03942815, -0.6661294, 1, 0, 0, 1, 1,
-0.7179989, -0.9247747, -1.583395, 1, 0, 0, 1, 1,
-0.7154232, -0.6175016, -2.305473, 1, 0, 0, 1, 1,
-0.712702, 2.017946, -1.708495, 1, 0, 0, 1, 1,
-0.7111445, 1.351994, -1.928133, 1, 0, 0, 1, 1,
-0.7009661, 1.541572, -0.03906117, 0, 0, 0, 1, 1,
-0.6984985, -0.7708162, -1.698724, 0, 0, 0, 1, 1,
-0.694917, 0.2327155, -1.440398, 0, 0, 0, 1, 1,
-0.6926822, 1.450369, -1.742142, 0, 0, 0, 1, 1,
-0.6914115, -0.0389782, -1.325768, 0, 0, 0, 1, 1,
-0.6894403, 1.764413, 0.2036608, 0, 0, 0, 1, 1,
-0.6893699, 0.3385099, -0.0278742, 0, 0, 0, 1, 1,
-0.689063, -0.3986229, -0.7240329, 1, 1, 1, 1, 1,
-0.6889769, 0.4124145, -1.568663, 1, 1, 1, 1, 1,
-0.6861729, -0.06878726, -2.160177, 1, 1, 1, 1, 1,
-0.6840689, 0.8765764, -0.8266463, 1, 1, 1, 1, 1,
-0.6826209, -0.7663682, -0.5489299, 1, 1, 1, 1, 1,
-0.6819743, -0.1033141, -0.4812264, 1, 1, 1, 1, 1,
-0.6793948, 0.550239, 0.2372283, 1, 1, 1, 1, 1,
-0.6784616, 2.310188, 0.4215019, 1, 1, 1, 1, 1,
-0.6728096, 0.741094, -1.425515, 1, 1, 1, 1, 1,
-0.6681535, 0.9564407, -1.999235, 1, 1, 1, 1, 1,
-0.6659218, 0.163628, -1.569346, 1, 1, 1, 1, 1,
-0.6619529, -0.9195684, -2.406629, 1, 1, 1, 1, 1,
-0.6618738, 0.7943851, -1.843927, 1, 1, 1, 1, 1,
-0.6540429, 0.4237112, -1.283857, 1, 1, 1, 1, 1,
-0.6510873, -0.1060061, -3.343162, 1, 1, 1, 1, 1,
-0.6486716, -0.1181696, -0.774841, 0, 0, 1, 1, 1,
-0.6445148, -0.8809473, -2.153676, 1, 0, 0, 1, 1,
-0.644345, 1.501564, -2.568686, 1, 0, 0, 1, 1,
-0.6326309, 0.7544739, -0.6320261, 1, 0, 0, 1, 1,
-0.6325046, -0.2394154, -2.038214, 1, 0, 0, 1, 1,
-0.6257196, 1.007167, -1.273778, 1, 0, 0, 1, 1,
-0.6227053, -0.03257104, -2.038455, 0, 0, 0, 1, 1,
-0.6208805, -0.9040559, -2.912938, 0, 0, 0, 1, 1,
-0.6147639, -0.9849533, -2.633987, 0, 0, 0, 1, 1,
-0.6120622, -0.1800318, -3.268008, 0, 0, 0, 1, 1,
-0.6113964, 0.2073724, -0.1201809, 0, 0, 0, 1, 1,
-0.6082454, -0.6687493, -2.209551, 0, 0, 0, 1, 1,
-0.6071392, 1.366758, -0.05792663, 0, 0, 0, 1, 1,
-0.6044821, 0.1363429, -1.458814, 1, 1, 1, 1, 1,
-0.6042693, -0.02063175, -2.407429, 1, 1, 1, 1, 1,
-0.5988429, -0.5384512, -3.668319, 1, 1, 1, 1, 1,
-0.5974185, -0.346422, -2.736827, 1, 1, 1, 1, 1,
-0.5960126, 0.8526552, -2.418572, 1, 1, 1, 1, 1,
-0.5959011, 0.9114746, -0.5923241, 1, 1, 1, 1, 1,
-0.5934584, -1.173184, -4.091734, 1, 1, 1, 1, 1,
-0.5898638, 0.3111476, -1.276352, 1, 1, 1, 1, 1,
-0.5896978, 0.1548908, -0.5896801, 1, 1, 1, 1, 1,
-0.5889236, 0.4681501, -0.558562, 1, 1, 1, 1, 1,
-0.5879889, 0.2014086, -1.246331, 1, 1, 1, 1, 1,
-0.5861894, -0.7870392, -1.206707, 1, 1, 1, 1, 1,
-0.5859658, -1.451896, -0.6089921, 1, 1, 1, 1, 1,
-0.584806, -0.361566, -2.008535, 1, 1, 1, 1, 1,
-0.5744176, 0.2733998, -0.9374756, 1, 1, 1, 1, 1,
-0.5697316, -0.1369127, -3.344712, 0, 0, 1, 1, 1,
-0.5677429, -0.7112368, -2.990941, 1, 0, 0, 1, 1,
-0.567551, 1.639526, 1.943657, 1, 0, 0, 1, 1,
-0.5669476, -1.379574, -0.9367273, 1, 0, 0, 1, 1,
-0.5668575, 1.479221, -0.020151, 1, 0, 0, 1, 1,
-0.566097, -0.2626583, -3.46288, 1, 0, 0, 1, 1,
-0.5645859, 0.6688548, -0.01278364, 0, 0, 0, 1, 1,
-0.5571191, 0.101376, -0.07411219, 0, 0, 0, 1, 1,
-0.5534041, 0.2596244, -0.1487536, 0, 0, 0, 1, 1,
-0.5524861, -1.853221, -4.940578, 0, 0, 0, 1, 1,
-0.550164, -0.05313203, -2.512331, 0, 0, 0, 1, 1,
-0.5500289, -2.198186, -3.356057, 0, 0, 0, 1, 1,
-0.5463245, 0.04617557, -3.880593, 0, 0, 0, 1, 1,
-0.5423009, -0.3287632, -1.829533, 1, 1, 1, 1, 1,
-0.5405292, 1.115212, 1.34813, 1, 1, 1, 1, 1,
-0.5382214, 0.4512743, -0.7194888, 1, 1, 1, 1, 1,
-0.5346596, 1.429898, 0.04864843, 1, 1, 1, 1, 1,
-0.5202764, -0.9733051, -2.881626, 1, 1, 1, 1, 1,
-0.5176124, -1.602564, -1.857176, 1, 1, 1, 1, 1,
-0.5155708, -0.2091418, -3.117329, 1, 1, 1, 1, 1,
-0.5149403, 0.3217367, -0.7515792, 1, 1, 1, 1, 1,
-0.5084955, 0.5103818, -1.590773, 1, 1, 1, 1, 1,
-0.507325, -0.9228689, -1.538269, 1, 1, 1, 1, 1,
-0.504696, -0.1338167, -2.340162, 1, 1, 1, 1, 1,
-0.5016768, -0.4322126, -2.027217, 1, 1, 1, 1, 1,
-0.5008925, 2.045781, 1.180979, 1, 1, 1, 1, 1,
-0.5003183, -1.302697, -2.672742, 1, 1, 1, 1, 1,
-0.5000834, 0.8874524, -3.182489, 1, 1, 1, 1, 1,
-0.4974314, 0.9918803, -0.9045994, 0, 0, 1, 1, 1,
-0.4933378, -0.0590144, -0.7326912, 1, 0, 0, 1, 1,
-0.4912789, 0.2127752, -2.129046, 1, 0, 0, 1, 1,
-0.4903988, -2.194192, -2.730956, 1, 0, 0, 1, 1,
-0.4886861, 1.239955, -0.7324033, 1, 0, 0, 1, 1,
-0.4882815, 0.8491629, 0.8347822, 1, 0, 0, 1, 1,
-0.4836807, -0.2042856, -0.8988234, 0, 0, 0, 1, 1,
-0.4810682, -1.131371, -1.928129, 0, 0, 0, 1, 1,
-0.4757333, 0.5612581, -0.08094086, 0, 0, 0, 1, 1,
-0.4754869, 0.3612416, -3.048355, 0, 0, 0, 1, 1,
-0.4714094, 1.382829, -0.2161294, 0, 0, 0, 1, 1,
-0.4676021, 0.5483082, 0.2287141, 0, 0, 0, 1, 1,
-0.4659027, 2.025763, 1.553875, 0, 0, 0, 1, 1,
-0.4641745, -0.3995121, -3.267002, 1, 1, 1, 1, 1,
-0.4511035, -0.5243291, -2.074176, 1, 1, 1, 1, 1,
-0.4410334, -0.2399689, -2.974024, 1, 1, 1, 1, 1,
-0.439805, 0.5270296, 0.5527497, 1, 1, 1, 1, 1,
-0.4338474, 1.519481, -4.639975, 1, 1, 1, 1, 1,
-0.4337012, -1.295515, -1.030129, 1, 1, 1, 1, 1,
-0.4314278, -0.1057026, -1.655557, 1, 1, 1, 1, 1,
-0.4280655, 0.9560823, 0.271955, 1, 1, 1, 1, 1,
-0.4230711, 0.4648388, -1.76552, 1, 1, 1, 1, 1,
-0.4204848, -0.4140055, -1.201475, 1, 1, 1, 1, 1,
-0.4180444, -0.125563, -0.5189382, 1, 1, 1, 1, 1,
-0.41535, 1.659751, -0.4895295, 1, 1, 1, 1, 1,
-0.4149721, -0.04010301, -1.392707, 1, 1, 1, 1, 1,
-0.4109606, -0.9438777, -3.054336, 1, 1, 1, 1, 1,
-0.4106036, -0.2813224, -3.419185, 1, 1, 1, 1, 1,
-0.4088187, 0.5243247, -0.5078882, 0, 0, 1, 1, 1,
-0.4030832, -0.4336358, -1.443893, 1, 0, 0, 1, 1,
-0.4013726, 0.7534509, -1.100006, 1, 0, 0, 1, 1,
-0.3974378, 2.462136, 0.6888151, 1, 0, 0, 1, 1,
-0.392966, -0.5401517, -3.515474, 1, 0, 0, 1, 1,
-0.3855723, 2.077454, 0.7218534, 1, 0, 0, 1, 1,
-0.3819247, 0.05573647, 0.1925133, 0, 0, 0, 1, 1,
-0.3793553, -0.2807356, -1.397556, 0, 0, 0, 1, 1,
-0.3774666, 0.9076513, -0.5988219, 0, 0, 0, 1, 1,
-0.3760251, -0.3570309, -2.521013, 0, 0, 0, 1, 1,
-0.374506, 0.6928598, -0.7535788, 0, 0, 0, 1, 1,
-0.3706828, -0.4575466, -2.339814, 0, 0, 0, 1, 1,
-0.3702028, -0.7614751, -3.155483, 0, 0, 0, 1, 1,
-0.3693319, 0.2564095, -1.405417, 1, 1, 1, 1, 1,
-0.3669398, 0.8222933, -1.125061, 1, 1, 1, 1, 1,
-0.3668227, 0.1584679, -1.144652, 1, 1, 1, 1, 1,
-0.3664235, -2.506563, -4.374289, 1, 1, 1, 1, 1,
-0.3646655, 0.7497557, -0.02650464, 1, 1, 1, 1, 1,
-0.3625742, 0.5201687, -2.225199, 1, 1, 1, 1, 1,
-0.359868, -0.1337841, -0.7966715, 1, 1, 1, 1, 1,
-0.3510216, -0.685866, -3.215305, 1, 1, 1, 1, 1,
-0.3509428, 1.725673, 0.4710555, 1, 1, 1, 1, 1,
-0.3477789, 0.1433115, -3.035413, 1, 1, 1, 1, 1,
-0.3427059, 0.0893385, -2.968327, 1, 1, 1, 1, 1,
-0.3418572, -0.3512791, -2.235259, 1, 1, 1, 1, 1,
-0.3377713, 0.8312827, -0.2687781, 1, 1, 1, 1, 1,
-0.3375351, -1.232106, -2.132505, 1, 1, 1, 1, 1,
-0.3358084, -0.02711328, -1.566456, 1, 1, 1, 1, 1,
-0.334431, 0.121902, -2.087922, 0, 0, 1, 1, 1,
-0.3324977, -0.5482997, -1.36606, 1, 0, 0, 1, 1,
-0.3286266, -0.2795915, -1.760717, 1, 0, 0, 1, 1,
-0.3179394, 0.9008664, -0.09608771, 1, 0, 0, 1, 1,
-0.317071, 0.1970394, -2.528808, 1, 0, 0, 1, 1,
-0.312472, 1.194138, -0.5666314, 1, 0, 0, 1, 1,
-0.3108465, -0.7978292, -4.612915, 0, 0, 0, 1, 1,
-0.3087896, 0.4203363, -2.456177, 0, 0, 0, 1, 1,
-0.307435, -0.08393527, -2.534656, 0, 0, 0, 1, 1,
-0.3015012, 0.09443082, -1.850086, 0, 0, 0, 1, 1,
-0.300044, 1.56549, -1.438003, 0, 0, 0, 1, 1,
-0.2999475, -0.4890517, -1.748257, 0, 0, 0, 1, 1,
-0.2966594, -0.8996757, -2.978374, 0, 0, 0, 1, 1,
-0.2935655, -0.03463544, -1.420087, 1, 1, 1, 1, 1,
-0.2921643, -0.2849802, -2.202468, 1, 1, 1, 1, 1,
-0.2845205, -1.106362, -1.076394, 1, 1, 1, 1, 1,
-0.2842996, 1.178969, 0.5387213, 1, 1, 1, 1, 1,
-0.2808629, 0.1613613, -1.183891, 1, 1, 1, 1, 1,
-0.2797115, 0.2706786, -0.06735601, 1, 1, 1, 1, 1,
-0.275647, 0.1814957, -0.2274332, 1, 1, 1, 1, 1,
-0.2722187, -0.3296006, -1.703715, 1, 1, 1, 1, 1,
-0.2702346, -1.872233, -3.689543, 1, 1, 1, 1, 1,
-0.2671221, 0.2616152, -0.6695918, 1, 1, 1, 1, 1,
-0.266901, 0.03648829, -0.9939308, 1, 1, 1, 1, 1,
-0.2586694, 0.7954332, -0.2898089, 1, 1, 1, 1, 1,
-0.2578106, -1.168318, -1.709955, 1, 1, 1, 1, 1,
-0.2538083, 0.7231426, -0.3654058, 1, 1, 1, 1, 1,
-0.2493579, 0.8597975, -0.4828339, 1, 1, 1, 1, 1,
-0.2489903, 0.3021633, -0.3637851, 0, 0, 1, 1, 1,
-0.2470191, 0.7062775, -0.08979122, 1, 0, 0, 1, 1,
-0.2438372, -0.2552294, -1.469099, 1, 0, 0, 1, 1,
-0.2397057, 2.499526, -0.1773798, 1, 0, 0, 1, 1,
-0.2378214, -0.7330293, -3.625937, 1, 0, 0, 1, 1,
-0.2368709, -1.430437, -1.720787, 1, 0, 0, 1, 1,
-0.2329234, -0.6870416, -3.905992, 0, 0, 0, 1, 1,
-0.2285119, 0.692092, -0.5125478, 0, 0, 0, 1, 1,
-0.2248438, 2.052465, -1.857958, 0, 0, 0, 1, 1,
-0.2235391, 1.837881, 2.556849, 0, 0, 0, 1, 1,
-0.2228274, 0.6954604, 0.1613422, 0, 0, 0, 1, 1,
-0.2196694, -1.880128, -3.825084, 0, 0, 0, 1, 1,
-0.2174977, -1.795719, -1.920641, 0, 0, 0, 1, 1,
-0.2171283, 1.264356, -0.08054705, 1, 1, 1, 1, 1,
-0.2168639, -0.4642608, -4.254159, 1, 1, 1, 1, 1,
-0.2108516, -0.9383305, -5.512712, 1, 1, 1, 1, 1,
-0.2102662, -0.653908, -3.2886, 1, 1, 1, 1, 1,
-0.2102349, 1.089785, -0.4672889, 1, 1, 1, 1, 1,
-0.2094248, 0.5448217, 0.09359509, 1, 1, 1, 1, 1,
-0.2047961, 0.4808097, -0.1465208, 1, 1, 1, 1, 1,
-0.19686, 1.147791, -0.7809154, 1, 1, 1, 1, 1,
-0.1894347, 2.132842, -0.6530561, 1, 1, 1, 1, 1,
-0.1888911, -1.703618, -2.835565, 1, 1, 1, 1, 1,
-0.1868245, -1.198693, -2.139357, 1, 1, 1, 1, 1,
-0.1853042, -0.2906987, -2.10255, 1, 1, 1, 1, 1,
-0.1846485, -2.335194, -3.794219, 1, 1, 1, 1, 1,
-0.1802364, 1.744034, 0.2816221, 1, 1, 1, 1, 1,
-0.1774513, -0.2156, -0.5204526, 1, 1, 1, 1, 1,
-0.1767319, -0.04982369, -1.702107, 0, 0, 1, 1, 1,
-0.1760947, 0.1325438, 0.04403644, 1, 0, 0, 1, 1,
-0.174403, 1.551409, -1.270813, 1, 0, 0, 1, 1,
-0.1735457, -0.7692922, -5.931456, 1, 0, 0, 1, 1,
-0.1713307, -0.4974812, -4.147662, 1, 0, 0, 1, 1,
-0.1699752, -1.147889, -3.481042, 1, 0, 0, 1, 1,
-0.1697144, 0.8022709, 0.1230205, 0, 0, 0, 1, 1,
-0.1645855, 0.8121025, 0.3732744, 0, 0, 0, 1, 1,
-0.1619452, 0.6299456, -2.458078, 0, 0, 0, 1, 1,
-0.1607232, -0.4851842, -4.388115, 0, 0, 0, 1, 1,
-0.1590548, -1.556199, -2.370122, 0, 0, 0, 1, 1,
-0.1574415, -0.03984397, -1.037124, 0, 0, 0, 1, 1,
-0.1520166, -1.707125, -2.110279, 0, 0, 0, 1, 1,
-0.1476635, -0.7342135, -1.475668, 1, 1, 1, 1, 1,
-0.1474848, 0.4010811, 0.04600808, 1, 1, 1, 1, 1,
-0.1471076, -1.407959, -2.575864, 1, 1, 1, 1, 1,
-0.1316738, -0.750275, -2.4566, 1, 1, 1, 1, 1,
-0.1299633, -0.1445175, -2.602517, 1, 1, 1, 1, 1,
-0.1290949, -1.032173, -1.643004, 1, 1, 1, 1, 1,
-0.1254161, 1.904647, -1.885432, 1, 1, 1, 1, 1,
-0.121257, 0.9335473, -0.2133222, 1, 1, 1, 1, 1,
-0.1190181, 0.548439, 1.025209, 1, 1, 1, 1, 1,
-0.1147764, 0.7989382, 0.1395944, 1, 1, 1, 1, 1,
-0.1140829, 0.764922, 1.345215, 1, 1, 1, 1, 1,
-0.1104207, 0.5389677, -0.3466755, 1, 1, 1, 1, 1,
-0.1076611, 0.37252, 0.1221305, 1, 1, 1, 1, 1,
-0.107537, -1.107113, -4.076351, 1, 1, 1, 1, 1,
-0.1057715, 0.9402717, 0.2526307, 1, 1, 1, 1, 1,
-0.1033241, -0.6272351, -2.379778, 0, 0, 1, 1, 1,
-0.1014249, 1.22878, -0.9179371, 1, 0, 0, 1, 1,
-0.09893784, 0.9745655, -0.3947257, 1, 0, 0, 1, 1,
-0.0979119, 0.2672665, 0.7675547, 1, 0, 0, 1, 1,
-0.09464327, 0.6645582, -0.2816948, 1, 0, 0, 1, 1,
-0.09140926, -0.14366, -2.940471, 1, 0, 0, 1, 1,
-0.08934215, 1.856772, -0.5988522, 0, 0, 0, 1, 1,
-0.0885386, -0.4491823, -2.844453, 0, 0, 0, 1, 1,
-0.08751413, -0.2796812, -4.006263, 0, 0, 0, 1, 1,
-0.07937249, 1.099834, 1.877883, 0, 0, 0, 1, 1,
-0.07745163, -0.6674322, -3.570914, 0, 0, 0, 1, 1,
-0.07567805, -1.297945, -3.035718, 0, 0, 0, 1, 1,
-0.07238352, -0.8393641, -3.417677, 0, 0, 0, 1, 1,
-0.07180008, 1.708514, -0.8252173, 1, 1, 1, 1, 1,
-0.06857046, -0.09120882, -1.069572, 1, 1, 1, 1, 1,
-0.06621756, 0.05777384, -0.7769377, 1, 1, 1, 1, 1,
-0.06472879, 0.2577508, -0.473165, 1, 1, 1, 1, 1,
-0.06188545, 0.192323, -0.9922405, 1, 1, 1, 1, 1,
-0.06050495, -1.044819, -1.029433, 1, 1, 1, 1, 1,
-0.0589074, 0.1099544, 0.07967796, 1, 1, 1, 1, 1,
-0.05602451, -2.425508, -2.891012, 1, 1, 1, 1, 1,
-0.05375353, 0.007879498, -3.215865, 1, 1, 1, 1, 1,
-0.04706284, -0.09579724, -5.134797, 1, 1, 1, 1, 1,
-0.04583469, 1.896764, 0.7491881, 1, 1, 1, 1, 1,
-0.04564293, -1.782197, -4.119963, 1, 1, 1, 1, 1,
-0.04241327, -0.7389184, -3.507491, 1, 1, 1, 1, 1,
-0.04066369, -0.7736994, -2.815937, 1, 1, 1, 1, 1,
-0.03975487, 0.1064273, -0.2688466, 1, 1, 1, 1, 1,
-0.03075455, 0.2990141, -1.467071, 0, 0, 1, 1, 1,
-0.0306733, -0.2532466, -3.397506, 1, 0, 0, 1, 1,
-0.02877497, -0.08153541, -2.678689, 1, 0, 0, 1, 1,
-0.02865816, -0.6936514, -1.20687, 1, 0, 0, 1, 1,
-0.0272494, -0.9069634, -4.18263, 1, 0, 0, 1, 1,
-0.02136785, -0.7359877, -3.408161, 1, 0, 0, 1, 1,
-0.02004763, -0.7820739, -2.483311, 0, 0, 0, 1, 1,
-0.01831954, 0.8439035, -0.6697262, 0, 0, 0, 1, 1,
-0.01557519, -0.7888452, -2.142658, 0, 0, 0, 1, 1,
-0.01535656, 0.00320315, 0.2687484, 0, 0, 0, 1, 1,
-0.01486146, -0.4779344, -4.316796, 0, 0, 0, 1, 1,
-0.01174899, 0.644402, -0.2899557, 0, 0, 0, 1, 1,
-0.006194837, -0.4708629, -4.461794, 0, 0, 0, 1, 1,
-0.004420287, -0.5493982, -2.149411, 1, 1, 1, 1, 1,
-0.004031774, -0.3393408, -1.728104, 1, 1, 1, 1, 1,
-0.003591379, -0.7539442, -3.553353, 1, 1, 1, 1, 1,
-0.002124873, -2.58224, -2.815562, 1, 1, 1, 1, 1,
-0.001006353, 0.5443494, -0.6296876, 1, 1, 1, 1, 1,
-0.0003011089, 0.06689528, 1.271215, 1, 1, 1, 1, 1,
8.777514e-05, 0.2086632, -0.1174394, 1, 1, 1, 1, 1,
0.007437765, -0.7221588, 2.010812, 1, 1, 1, 1, 1,
0.008058682, 0.1287522, -0.9082529, 1, 1, 1, 1, 1,
0.009163434, -0.1329122, 3.053964, 1, 1, 1, 1, 1,
0.01490549, 1.205886, 0.7765152, 1, 1, 1, 1, 1,
0.02558279, -0.1676104, 4.80492, 1, 1, 1, 1, 1,
0.02612297, -1.603388, 3.240022, 1, 1, 1, 1, 1,
0.02723189, -0.665565, 5.123585, 1, 1, 1, 1, 1,
0.02786016, -0.9112496, 2.454922, 1, 1, 1, 1, 1,
0.03054234, 0.007420923, 0.07884203, 0, 0, 1, 1, 1,
0.03266992, 1.075241, 0.1139653, 1, 0, 0, 1, 1,
0.03713591, 0.1160733, -0.7463972, 1, 0, 0, 1, 1,
0.04019582, 0.7356316, 0.3259524, 1, 0, 0, 1, 1,
0.04567584, 0.3235647, -0.5547554, 1, 0, 0, 1, 1,
0.0457886, 0.4674307, 2.880412, 1, 0, 0, 1, 1,
0.04987272, -1.300022, 2.901564, 0, 0, 0, 1, 1,
0.05434202, 2.093597, 0.9485131, 0, 0, 0, 1, 1,
0.07047746, 0.7317172, -1.05875, 0, 0, 0, 1, 1,
0.07342298, -0.09605269, 1.327956, 0, 0, 0, 1, 1,
0.07493807, -0.8987119, 5.013299, 0, 0, 0, 1, 1,
0.07598373, -0.9166285, 2.767825, 0, 0, 0, 1, 1,
0.07764088, -0.3383943, 3.354367, 0, 0, 0, 1, 1,
0.07897827, -0.7934178, 0.9498627, 1, 1, 1, 1, 1,
0.07950292, -0.412393, 2.343402, 1, 1, 1, 1, 1,
0.08491482, 0.7790801, -1.741272, 1, 1, 1, 1, 1,
0.08632794, 2.314368, -0.1951714, 1, 1, 1, 1, 1,
0.08936446, 0.819384, 0.09892125, 1, 1, 1, 1, 1,
0.09054955, -0.09031975, 2.156171, 1, 1, 1, 1, 1,
0.0999812, 0.9727951, 2.10515, 1, 1, 1, 1, 1,
0.1034102, 0.9027734, 2.19253, 1, 1, 1, 1, 1,
0.1079273, 1.412045, -0.09694364, 1, 1, 1, 1, 1,
0.1109051, 0.3575122, -1.522798, 1, 1, 1, 1, 1,
0.1172221, -0.311836, 1.903055, 1, 1, 1, 1, 1,
0.1186282, -0.3483565, 3.072463, 1, 1, 1, 1, 1,
0.1222373, 0.9838102, 0.3134358, 1, 1, 1, 1, 1,
0.1222505, -2.068112, 1.635362, 1, 1, 1, 1, 1,
0.1242404, 1.144583, -0.1653112, 1, 1, 1, 1, 1,
0.1265814, 1.588748, 1.639288, 0, 0, 1, 1, 1,
0.1277069, -0.627046, 2.183413, 1, 0, 0, 1, 1,
0.1278181, -0.002392832, 0.962556, 1, 0, 0, 1, 1,
0.1281471, -0.04886635, 1.424639, 1, 0, 0, 1, 1,
0.1289362, 0.176676, 0.9207162, 1, 0, 0, 1, 1,
0.1329337, -0.5472596, 3.542758, 1, 0, 0, 1, 1,
0.1332103, -0.9405721, 2.402193, 0, 0, 0, 1, 1,
0.1347589, -0.5729741, 0.9876844, 0, 0, 0, 1, 1,
0.1350437, 0.8357424, 0.05954834, 0, 0, 0, 1, 1,
0.1371147, -0.1774559, 3.032166, 0, 0, 0, 1, 1,
0.1373471, -0.3927263, 4.360245, 0, 0, 0, 1, 1,
0.1376216, -0.667176, 2.829241, 0, 0, 0, 1, 1,
0.1381382, -0.624164, 0.9868586, 0, 0, 0, 1, 1,
0.1426311, -0.2122289, 2.937898, 1, 1, 1, 1, 1,
0.1456261, -0.1155527, 3.148242, 1, 1, 1, 1, 1,
0.1457, -0.5427511, 3.086022, 1, 1, 1, 1, 1,
0.152969, 2.242231, -0.2856092, 1, 1, 1, 1, 1,
0.1533697, -2.018012, 3.349835, 1, 1, 1, 1, 1,
0.1579113, 1.445069, -0.4225977, 1, 1, 1, 1, 1,
0.1579461, -0.09094755, 2.296659, 1, 1, 1, 1, 1,
0.1667585, -0.02872085, 3.681459, 1, 1, 1, 1, 1,
0.1765628, 1.336955, 1.021912, 1, 1, 1, 1, 1,
0.1766624, 1.011403, -1.94684, 1, 1, 1, 1, 1,
0.1782463, 0.1541707, -0.6376165, 1, 1, 1, 1, 1,
0.1788412, 0.02331625, 1.818006, 1, 1, 1, 1, 1,
0.1794522, 0.7752972, -0.3304135, 1, 1, 1, 1, 1,
0.1823187, 0.4619681, -0.9655483, 1, 1, 1, 1, 1,
0.1853553, -1.094316, 3.552524, 1, 1, 1, 1, 1,
0.1859024, -0.3444434, 3.304649, 0, 0, 1, 1, 1,
0.1905877, -1.602598, 3.679328, 1, 0, 0, 1, 1,
0.2014913, 0.1663945, 2.363507, 1, 0, 0, 1, 1,
0.2045647, -0.5811055, 4.452876, 1, 0, 0, 1, 1,
0.2050024, -0.2653323, 1.970399, 1, 0, 0, 1, 1,
0.2143747, -1.605611, 1.907607, 1, 0, 0, 1, 1,
0.2155569, 2.382788, 0.8982356, 0, 0, 0, 1, 1,
0.2180346, 0.5179073, 1.043682, 0, 0, 0, 1, 1,
0.2239845, -0.4022162, 2.654311, 0, 0, 0, 1, 1,
0.2252593, -0.1812655, 0.9057787, 0, 0, 0, 1, 1,
0.225315, -0.8174487, 4.508577, 0, 0, 0, 1, 1,
0.2260178, 0.3570131, 2.425828, 0, 0, 0, 1, 1,
0.2263083, 0.5309058, 1.939274, 0, 0, 0, 1, 1,
0.2332412, 1.427234, -0.5427312, 1, 1, 1, 1, 1,
0.2358949, 0.2174649, 0.1520386, 1, 1, 1, 1, 1,
0.2371965, -1.250532, 4.1928, 1, 1, 1, 1, 1,
0.2378247, -0.2777819, 2.010347, 1, 1, 1, 1, 1,
0.2430954, -1.050969, 2.920137, 1, 1, 1, 1, 1,
0.2442141, 0.180288, -0.07919917, 1, 1, 1, 1, 1,
0.2443495, -0.2136179, 3.176492, 1, 1, 1, 1, 1,
0.2448846, 0.2369318, 0.7068589, 1, 1, 1, 1, 1,
0.2466497, -0.3171776, 2.328153, 1, 1, 1, 1, 1,
0.2468983, 2.414732, 0.05909114, 1, 1, 1, 1, 1,
0.2474993, -1.897531, 3.736699, 1, 1, 1, 1, 1,
0.2486609, 0.03791575, 0.873997, 1, 1, 1, 1, 1,
0.2501225, 1.490242, -0.6817349, 1, 1, 1, 1, 1,
0.2567869, -1.781572, 4.158271, 1, 1, 1, 1, 1,
0.2573221, 0.498603, 0.3207671, 1, 1, 1, 1, 1,
0.2610943, 1.305757, -0.0650377, 0, 0, 1, 1, 1,
0.2679159, -2.027016, 1.822683, 1, 0, 0, 1, 1,
0.270366, -0.5812429, 3.339655, 1, 0, 0, 1, 1,
0.2757868, -0.4399223, 3.490038, 1, 0, 0, 1, 1,
0.2758738, 0.2821991, 2.337616, 1, 0, 0, 1, 1,
0.2776482, 0.2748839, 1.144075, 1, 0, 0, 1, 1,
0.2809397, 1.010678, -0.6049239, 0, 0, 0, 1, 1,
0.2840341, 0.2020265, 1.166877, 0, 0, 0, 1, 1,
0.2883582, 1.212095, -0.3557858, 0, 0, 0, 1, 1,
0.2889203, -0.7098816, 2.013513, 0, 0, 0, 1, 1,
0.2899232, -0.1698809, 0.5282981, 0, 0, 0, 1, 1,
0.292812, -0.5504532, 4.390018, 0, 0, 0, 1, 1,
0.2955802, 0.5106561, 0.1159558, 0, 0, 0, 1, 1,
0.2958749, 1.735192, 0.1455545, 1, 1, 1, 1, 1,
0.296122, -0.8545874, 4.520521, 1, 1, 1, 1, 1,
0.29863, -0.4144301, 2.776534, 1, 1, 1, 1, 1,
0.3027747, 0.2618979, 0.9812574, 1, 1, 1, 1, 1,
0.3038755, 0.07176281, 1.295186, 1, 1, 1, 1, 1,
0.3051084, -0.04108855, 1.559363, 1, 1, 1, 1, 1,
0.3121148, 0.2199536, -0.2164713, 1, 1, 1, 1, 1,
0.3133483, 0.1867574, 1.253503, 1, 1, 1, 1, 1,
0.3138311, -0.8638582, 0.9608434, 1, 1, 1, 1, 1,
0.3154617, -1.726706, 3.080739, 1, 1, 1, 1, 1,
0.3156497, 0.6591239, 0.09425274, 1, 1, 1, 1, 1,
0.3185711, 0.03006599, -0.6751819, 1, 1, 1, 1, 1,
0.319798, 1.863738, 2.138854, 1, 1, 1, 1, 1,
0.3203842, 1.924766, -0.4717709, 1, 1, 1, 1, 1,
0.3216493, -1.19872, 2.787514, 1, 1, 1, 1, 1,
0.3245082, 1.074308, 0.3459418, 0, 0, 1, 1, 1,
0.3307788, 0.5920984, -0.9460468, 1, 0, 0, 1, 1,
0.3313293, 1.81312, 0.5676304, 1, 0, 0, 1, 1,
0.3316789, -0.7544616, 3.701269, 1, 0, 0, 1, 1,
0.3319544, 0.7663102, 1.272791, 1, 0, 0, 1, 1,
0.3442716, 0.5782599, -0.4305979, 1, 0, 0, 1, 1,
0.3463674, -0.5265599, 2.594853, 0, 0, 0, 1, 1,
0.3478586, -0.9449012, 2.977704, 0, 0, 0, 1, 1,
0.3514165, 0.3151871, 0.7078982, 0, 0, 0, 1, 1,
0.356012, 0.05377882, -0.301879, 0, 0, 0, 1, 1,
0.3608317, 0.3945075, 0.6833468, 0, 0, 0, 1, 1,
0.3641477, 1.170628, 1.415189, 0, 0, 0, 1, 1,
0.3643627, -0.7877859, 2.185109, 0, 0, 0, 1, 1,
0.3648137, -0.3311363, 3.583586, 1, 1, 1, 1, 1,
0.3648299, -0.4532623, 1.541086, 1, 1, 1, 1, 1,
0.366739, -0.6589548, 3.642682, 1, 1, 1, 1, 1,
0.367691, 0.4689619, 0.4921853, 1, 1, 1, 1, 1,
0.3700262, -0.5690991, 1.583168, 1, 1, 1, 1, 1,
0.3713675, -0.09353095, 1.521426, 1, 1, 1, 1, 1,
0.3735248, 1.162321, 0.7395712, 1, 1, 1, 1, 1,
0.3787246, 0.9095724, 0.7466285, 1, 1, 1, 1, 1,
0.3792776, 1.534298, 1.839478, 1, 1, 1, 1, 1,
0.3816298, -0.498063, 3.839822, 1, 1, 1, 1, 1,
0.3816893, 0.01383381, 2.684034, 1, 1, 1, 1, 1,
0.3822208, -0.1692173, 3.141011, 1, 1, 1, 1, 1,
0.3836243, -0.8265158, 1.225517, 1, 1, 1, 1, 1,
0.3846805, -0.7340139, 2.233824, 1, 1, 1, 1, 1,
0.388798, -0.698705, 2.616327, 1, 1, 1, 1, 1,
0.3890661, 0.1168918, 1.878313, 0, 0, 1, 1, 1,
0.392989, 2.029374, 0.3729638, 1, 0, 0, 1, 1,
0.3933639, -0.1144784, 1.013784, 1, 0, 0, 1, 1,
0.3979446, 2.051994, 0.4752787, 1, 0, 0, 1, 1,
0.3988228, 0.7297585, 0.4027312, 1, 0, 0, 1, 1,
0.413452, -1.58019, 3.862407, 1, 0, 0, 1, 1,
0.4142623, -0.05201523, -0.5576203, 0, 0, 0, 1, 1,
0.4144263, 0.8879789, -0.371029, 0, 0, 0, 1, 1,
0.4178671, -0.1324108, -0.9201103, 0, 0, 0, 1, 1,
0.4202086, -1.137092, 2.966779, 0, 0, 0, 1, 1,
0.4202304, 0.4473285, 1.12167, 0, 0, 0, 1, 1,
0.4221621, 0.7381716, 0.3265256, 0, 0, 0, 1, 1,
0.4245282, -0.5811106, 1.532034, 0, 0, 0, 1, 1,
0.4247165, 0.2589021, 1.180876, 1, 1, 1, 1, 1,
0.4249704, 0.419594, 0.6737178, 1, 1, 1, 1, 1,
0.431901, 0.09091014, 2.033196, 1, 1, 1, 1, 1,
0.4367808, -1.416706, 3.324296, 1, 1, 1, 1, 1,
0.4409817, -1.965308, 4.898261, 1, 1, 1, 1, 1,
0.4424669, -1.092496, 2.372637, 1, 1, 1, 1, 1,
0.4443245, 0.1438215, 0.743961, 1, 1, 1, 1, 1,
0.4457546, -0.4401149, 3.227977, 1, 1, 1, 1, 1,
0.4489239, 0.5642999, 0.4127674, 1, 1, 1, 1, 1,
0.4504232, 0.0308689, 2.664429, 1, 1, 1, 1, 1,
0.454388, 0.4497961, 0.4081833, 1, 1, 1, 1, 1,
0.4602904, -1.020562, 3.065035, 1, 1, 1, 1, 1,
0.4613542, 0.1033267, 2.003082, 1, 1, 1, 1, 1,
0.4615817, -0.3724427, 0.4840204, 1, 1, 1, 1, 1,
0.4686295, 0.02260393, 0.7695052, 1, 1, 1, 1, 1,
0.4693479, 0.01450453, 2.675358, 0, 0, 1, 1, 1,
0.4783745, -0.191191, 3.038518, 1, 0, 0, 1, 1,
0.4816772, -0.06867182, 1.628444, 1, 0, 0, 1, 1,
0.4845402, -0.8733929, 3.447527, 1, 0, 0, 1, 1,
0.485372, 0.8395721, 1.15853, 1, 0, 0, 1, 1,
0.5001061, -0.2489771, 2.694217, 1, 0, 0, 1, 1,
0.501767, 1.616833, 1.66463, 0, 0, 0, 1, 1,
0.507719, -0.1080735, 0.04040768, 0, 0, 0, 1, 1,
0.5077909, -1.853862, 2.203977, 0, 0, 0, 1, 1,
0.5080295, -0.6973348, 3.051799, 0, 0, 0, 1, 1,
0.5117847, -0.3840046, 2.336726, 0, 0, 0, 1, 1,
0.5160621, 0.1784826, -0.6759886, 0, 0, 0, 1, 1,
0.5179334, 0.03278073, 0.4445489, 0, 0, 0, 1, 1,
0.5286841, 0.1455867, -0.7312291, 1, 1, 1, 1, 1,
0.5291854, 0.02443292, 0.6343253, 1, 1, 1, 1, 1,
0.5455112, -0.1057316, -0.04403793, 1, 1, 1, 1, 1,
0.5511243, -0.4795832, 2.826833, 1, 1, 1, 1, 1,
0.5537102, -1.059332, 1.834003, 1, 1, 1, 1, 1,
0.5595887, -0.849277, 3.729454, 1, 1, 1, 1, 1,
0.561988, -0.1541203, 3.948504, 1, 1, 1, 1, 1,
0.5627009, -1.569865, 3.083488, 1, 1, 1, 1, 1,
0.5633084, 1.882688, 1.18085, 1, 1, 1, 1, 1,
0.564314, -1.36904, 1.887629, 1, 1, 1, 1, 1,
0.5672053, 2.234247, -0.1568146, 1, 1, 1, 1, 1,
0.5701568, 0.4247288, 0.7146428, 1, 1, 1, 1, 1,
0.5705509, 0.007741695, 1.909805, 1, 1, 1, 1, 1,
0.5749444, 0.1802981, 2.282087, 1, 1, 1, 1, 1,
0.577904, -1.139147, 1.62852, 1, 1, 1, 1, 1,
0.5782194, -0.8608606, 2.623378, 0, 0, 1, 1, 1,
0.5791562, -0.8750135, 1.12616, 1, 0, 0, 1, 1,
0.5802245, -0.3294882, 2.46759, 1, 0, 0, 1, 1,
0.5819908, 0.3452639, 1.112273, 1, 0, 0, 1, 1,
0.589348, -1.057657, 3.37373, 1, 0, 0, 1, 1,
0.5965095, 1.856057, -0.2004875, 1, 0, 0, 1, 1,
0.597601, -0.714852, 4.35443, 0, 0, 0, 1, 1,
0.5999978, 0.04634019, -0.7305223, 0, 0, 0, 1, 1,
0.6044844, 0.06473237, 1.486274, 0, 0, 0, 1, 1,
0.609318, -0.131286, 1.646953, 0, 0, 0, 1, 1,
0.6095874, 0.7507204, 0.8589866, 0, 0, 0, 1, 1,
0.6115496, -0.8160719, 2.94727, 0, 0, 0, 1, 1,
0.6142929, 0.05707087, 1.418431, 0, 0, 0, 1, 1,
0.6148767, -0.4005406, 3.342983, 1, 1, 1, 1, 1,
0.6149489, -0.9640992, 0.9378325, 1, 1, 1, 1, 1,
0.6224423, -0.7830745, 2.214723, 1, 1, 1, 1, 1,
0.6240997, -0.3101056, 1.523129, 1, 1, 1, 1, 1,
0.6263263, -0.819804, 3.082606, 1, 1, 1, 1, 1,
0.6323421, 0.5414903, 0.5993646, 1, 1, 1, 1, 1,
0.6347418, 0.03803269, 2.15613, 1, 1, 1, 1, 1,
0.6373293, -0.1175577, 4.440743, 1, 1, 1, 1, 1,
0.6376871, 0.4786285, 2.293535, 1, 1, 1, 1, 1,
0.6398862, 0.09325365, 0.5003998, 1, 1, 1, 1, 1,
0.6412973, 0.04572789, 3.201772, 1, 1, 1, 1, 1,
0.6461439, -1.279868, 3.60185, 1, 1, 1, 1, 1,
0.6501176, 0.9891084, 0.2568996, 1, 1, 1, 1, 1,
0.6529745, 1.23564, 1.049545, 1, 1, 1, 1, 1,
0.6545812, 0.5350624, 1.19746, 1, 1, 1, 1, 1,
0.6593509, -0.3393832, 0.3955558, 0, 0, 1, 1, 1,
0.6597019, -1.632527, 3.305983, 1, 0, 0, 1, 1,
0.663614, -0.9555124, 1.999975, 1, 0, 0, 1, 1,
0.6644641, -1.402691, 2.639199, 1, 0, 0, 1, 1,
0.6700808, -0.08075675, 2.125428, 1, 0, 0, 1, 1,
0.6765029, -0.02184017, 1.899222, 1, 0, 0, 1, 1,
0.677542, -0.9235175, 2.169443, 0, 0, 0, 1, 1,
0.678511, -0.5509747, 3.43131, 0, 0, 0, 1, 1,
0.6821136, -0.2520359, 2.48028, 0, 0, 0, 1, 1,
0.6831747, 0.3696949, 1.307219, 0, 0, 0, 1, 1,
0.68819, 1.200448, 0.4343729, 0, 0, 0, 1, 1,
0.6904581, 0.6163334, 0.5333549, 0, 0, 0, 1, 1,
0.6918235, -0.715053, 1.339686, 0, 0, 0, 1, 1,
0.6961549, 1.690021, 1.695031, 1, 1, 1, 1, 1,
0.6971368, -0.6396061, 4.412637, 1, 1, 1, 1, 1,
0.6988299, -0.257885, 3.06581, 1, 1, 1, 1, 1,
0.6995291, -1.125382, 3.647334, 1, 1, 1, 1, 1,
0.7062671, -0.1702629, 1.90149, 1, 1, 1, 1, 1,
0.7085357, 0.5855569, 0.1995638, 1, 1, 1, 1, 1,
0.7085529, 0.5016896, -0.8070784, 1, 1, 1, 1, 1,
0.7097357, -0.1652299, 2.123547, 1, 1, 1, 1, 1,
0.710241, 0.1983156, 1.459064, 1, 1, 1, 1, 1,
0.7119731, 1.124608, -1.378415, 1, 1, 1, 1, 1,
0.7126107, 0.661297, 0.8797173, 1, 1, 1, 1, 1,
0.7129539, 0.2251911, 1.0373, 1, 1, 1, 1, 1,
0.7170478, -0.167478, 1.171074, 1, 1, 1, 1, 1,
0.71736, -0.9983309, 3.406151, 1, 1, 1, 1, 1,
0.7210478, -2.453043, 2.919435, 1, 1, 1, 1, 1,
0.7240068, 1.40326, 0.9647503, 0, 0, 1, 1, 1,
0.7246718, 0.05936425, 0.766196, 1, 0, 0, 1, 1,
0.725723, -0.1392789, 1.645828, 1, 0, 0, 1, 1,
0.727127, -0.06118302, 0.9267891, 1, 0, 0, 1, 1,
0.729258, -1.136026, 2.004701, 1, 0, 0, 1, 1,
0.7305777, 0.7561495, 0.9215041, 1, 0, 0, 1, 1,
0.7399795, 0.02171023, -0.1775087, 0, 0, 0, 1, 1,
0.7424365, 1.639925, 0.849308, 0, 0, 0, 1, 1,
0.7477593, -0.8952782, 2.912518, 0, 0, 0, 1, 1,
0.7535598, 0.78126, 0.4081154, 0, 0, 0, 1, 1,
0.7538887, -1.610418, 2.875161, 0, 0, 0, 1, 1,
0.7551788, -0.2612417, 3.248757, 0, 0, 0, 1, 1,
0.7571892, -1.03208, 3.168727, 0, 0, 0, 1, 1,
0.7588407, 0.5576628, 0.1391638, 1, 1, 1, 1, 1,
0.759093, -0.4674965, 3.788219, 1, 1, 1, 1, 1,
0.7608166, 0.02713631, 3.1909, 1, 1, 1, 1, 1,
0.7665967, -0.8193406, 3.12329, 1, 1, 1, 1, 1,
0.7723807, 1.546022, 1.491718, 1, 1, 1, 1, 1,
0.7762753, 0.2018806, 1.303259, 1, 1, 1, 1, 1,
0.7793832, 1.021678, 1.054506, 1, 1, 1, 1, 1,
0.7803394, 1.937627, -0.7180504, 1, 1, 1, 1, 1,
0.7890876, 0.4333504, 1.194406, 1, 1, 1, 1, 1,
0.796564, -1.099005, 1.005624, 1, 1, 1, 1, 1,
0.7966327, 2.423236, -0.7890496, 1, 1, 1, 1, 1,
0.7979297, 1.925017, 1.824757, 1, 1, 1, 1, 1,
0.7993857, 0.2764525, 1.325234, 1, 1, 1, 1, 1,
0.8029522, 0.2876626, 3.126827, 1, 1, 1, 1, 1,
0.8183019, -0.1182079, -0.006992774, 1, 1, 1, 1, 1,
0.8296013, -0.004882935, 2.298474, 0, 0, 1, 1, 1,
0.8297481, 0.008421317, 2.070544, 1, 0, 0, 1, 1,
0.8321414, -0.1082893, 1.400293, 1, 0, 0, 1, 1,
0.8343765, 0.5604327, 2.814278, 1, 0, 0, 1, 1,
0.8353734, -0.7862523, 3.916884, 1, 0, 0, 1, 1,
0.8363417, -0.5076277, 2.896415, 1, 0, 0, 1, 1,
0.8374405, -1.558668, 1.196373, 0, 0, 0, 1, 1,
0.8387395, 0.426995, 0.9187616, 0, 0, 0, 1, 1,
0.8425075, 1.216225, 1.155196, 0, 0, 0, 1, 1,
0.8439825, 1.780041, -0.03038002, 0, 0, 0, 1, 1,
0.8445543, 0.6069177, -0.02306196, 0, 0, 0, 1, 1,
0.8490014, -0.6371175, 2.365339, 0, 0, 0, 1, 1,
0.8506694, -0.8554204, 2.774872, 0, 0, 0, 1, 1,
0.8527128, -0.7357125, 2.93172, 1, 1, 1, 1, 1,
0.8532956, 0.7182764, 0.1727725, 1, 1, 1, 1, 1,
0.8541927, 0.4350581, 0.818268, 1, 1, 1, 1, 1,
0.8575954, 0.3607498, -0.1650666, 1, 1, 1, 1, 1,
0.8599636, -0.7101654, 0.1836407, 1, 1, 1, 1, 1,
0.8607032, -0.036607, 1.990425, 1, 1, 1, 1, 1,
0.862872, -1.261685, 0.8718291, 1, 1, 1, 1, 1,
0.8651846, 1.577837, -0.7136614, 1, 1, 1, 1, 1,
0.8729411, -2.621644, 2.288237, 1, 1, 1, 1, 1,
0.8765341, 0.8912959, -0.1278184, 1, 1, 1, 1, 1,
0.8787591, 1.424623, 0.693499, 1, 1, 1, 1, 1,
0.881337, 0.3318256, 0.5395297, 1, 1, 1, 1, 1,
0.8831991, 0.03170327, 1.054042, 1, 1, 1, 1, 1,
0.8848202, 0.2443572, 1.051068, 1, 1, 1, 1, 1,
0.894768, 2.564153, 0.2645727, 1, 1, 1, 1, 1,
0.8982891, -2.5067, 2.911172, 0, 0, 1, 1, 1,
0.8996702, 2.364985, 0.3010955, 1, 0, 0, 1, 1,
0.9000581, -1.535151, 1.151064, 1, 0, 0, 1, 1,
0.9063565, 0.4388709, 1.60849, 1, 0, 0, 1, 1,
0.9070534, -0.5713649, 1.276337, 1, 0, 0, 1, 1,
0.9087909, -1.209064, 1.871331, 1, 0, 0, 1, 1,
0.9132926, -1.650371, 3.277864, 0, 0, 0, 1, 1,
0.9163081, 0.3875556, -0.1340326, 0, 0, 0, 1, 1,
0.9195017, -0.7594081, 1.63712, 0, 0, 0, 1, 1,
0.9217381, -0.02422654, 0.521516, 0, 0, 0, 1, 1,
0.9232418, 0.1913766, 0.6192009, 0, 0, 0, 1, 1,
0.9243485, 1.294985, 0.4944238, 0, 0, 0, 1, 1,
0.9270891, 0.2091275, 2.464392, 0, 0, 0, 1, 1,
0.9285319, 1.093369, 0.8910113, 1, 1, 1, 1, 1,
0.9354783, 0.502588, 1.360332, 1, 1, 1, 1, 1,
0.935817, -1.499619, 4.360168, 1, 1, 1, 1, 1,
0.93648, -1.369293, 1.699512, 1, 1, 1, 1, 1,
0.9381968, 0.02746089, 1.443829, 1, 1, 1, 1, 1,
0.9390318, -0.08639539, 2.059753, 1, 1, 1, 1, 1,
0.9424581, 0.24259, 2.676048, 1, 1, 1, 1, 1,
0.9532636, -1.393928, 2.288227, 1, 1, 1, 1, 1,
0.9873278, 0.2123833, 0.04272736, 1, 1, 1, 1, 1,
0.9879925, 0.2399454, 2.304965, 1, 1, 1, 1, 1,
0.9882591, 0.6200648, 0.1883639, 1, 1, 1, 1, 1,
0.9904986, 0.8408618, 2.210995, 1, 1, 1, 1, 1,
0.9921386, -1.951591, 2.342014, 1, 1, 1, 1, 1,
0.9983065, 0.4215828, 2.249346, 1, 1, 1, 1, 1,
1.014601, -0.08295598, 0.936353, 1, 1, 1, 1, 1,
1.023591, -0.1679861, 1.03385, 0, 0, 1, 1, 1,
1.026786, -0.0732853, 3.43558, 1, 0, 0, 1, 1,
1.02852, -1.039378, 3.035272, 1, 0, 0, 1, 1,
1.029039, -0.5987772, 0.678627, 1, 0, 0, 1, 1,
1.034439, -1.009322, 3.032187, 1, 0, 0, 1, 1,
1.040403, -0.1374983, 1.556678, 1, 0, 0, 1, 1,
1.040458, -1.327475, 3.961592, 0, 0, 0, 1, 1,
1.04276, 0.8702089, 1.320992, 0, 0, 0, 1, 1,
1.043293, 0.2718175, 0.6952266, 0, 0, 0, 1, 1,
1.054027, 1.52785, 0.07509555, 0, 0, 0, 1, 1,
1.054039, 0.3226281, -0.1865351, 0, 0, 0, 1, 1,
1.054651, 1.349937, 0.03990533, 0, 0, 0, 1, 1,
1.05987, 0.5451248, -0.5156962, 0, 0, 0, 1, 1,
1.060798, 0.6129244, 1.167037, 1, 1, 1, 1, 1,
1.061053, 1.394797, 1.353846, 1, 1, 1, 1, 1,
1.062178, 0.1013566, 1.123343, 1, 1, 1, 1, 1,
1.063679, -0.3066707, 1.225883, 1, 1, 1, 1, 1,
1.063954, 1.623468, 0.6070816, 1, 1, 1, 1, 1,
1.066132, -0.1561144, 1.793285, 1, 1, 1, 1, 1,
1.069536, 0.2015784, 1.19702, 1, 1, 1, 1, 1,
1.073413, 1.454937, 1.201207, 1, 1, 1, 1, 1,
1.076142, 0.7649397, 0.6912482, 1, 1, 1, 1, 1,
1.080056, -0.4024515, 1.389127, 1, 1, 1, 1, 1,
1.093042, -1.957998, 1.857407, 1, 1, 1, 1, 1,
1.093649, 0.570388, -0.5407646, 1, 1, 1, 1, 1,
1.094265, -0.1999773, 1.591468, 1, 1, 1, 1, 1,
1.096386, 0.0280115, 0.7737002, 1, 1, 1, 1, 1,
1.103679, -1.764214, 1.84973, 1, 1, 1, 1, 1,
1.106167, -0.8229046, 2.748321, 0, 0, 1, 1, 1,
1.106319, 0.1606973, -0.07297575, 1, 0, 0, 1, 1,
1.113565, 1.80815, 1.894214, 1, 0, 0, 1, 1,
1.114126, 0.8031707, -0.3084056, 1, 0, 0, 1, 1,
1.124047, 1.441079, 0.1680963, 1, 0, 0, 1, 1,
1.147913, -0.662141, 0.9003245, 1, 0, 0, 1, 1,
1.153399, 1.428883, 0.5354918, 0, 0, 0, 1, 1,
1.15386, -0.1367768, 0.8242466, 0, 0, 0, 1, 1,
1.156273, -0.1683553, 1.322879, 0, 0, 0, 1, 1,
1.165461, 0.8621508, -1.248619, 0, 0, 0, 1, 1,
1.166674, -0.7947184, 4.586046, 0, 0, 0, 1, 1,
1.168517, -0.1526443, 0.5292963, 0, 0, 0, 1, 1,
1.173829, 1.318867, -0.6292189, 0, 0, 0, 1, 1,
1.175291, -0.6959617, 0.6727769, 1, 1, 1, 1, 1,
1.18049, -0.920692, 3.913306, 1, 1, 1, 1, 1,
1.180973, -1.303829, 2.910428, 1, 1, 1, 1, 1,
1.181108, 0.09261566, 1.127863, 1, 1, 1, 1, 1,
1.183217, 1.523869, 1.124958, 1, 1, 1, 1, 1,
1.192035, -0.2625233, 1.250984, 1, 1, 1, 1, 1,
1.193734, 0.9272112, 1.287002, 1, 1, 1, 1, 1,
1.193914, -0.1565678, 1.074371, 1, 1, 1, 1, 1,
1.195464, -0.7902279, 1.606367, 1, 1, 1, 1, 1,
1.197054, -0.07419273, 0.04041851, 1, 1, 1, 1, 1,
1.20192, -0.4938705, 1.813045, 1, 1, 1, 1, 1,
1.21267, -1.276979, 2.354316, 1, 1, 1, 1, 1,
1.212897, 1.812882, 0.9188566, 1, 1, 1, 1, 1,
1.223156, 1.25521, -0.4588904, 1, 1, 1, 1, 1,
1.228349, 0.2654178, 2.139736, 1, 1, 1, 1, 1,
1.229741, 0.2880106, 0.5690816, 0, 0, 1, 1, 1,
1.232671, -1.398761, 4.02222, 1, 0, 0, 1, 1,
1.243288, 1.509194, -0.4719481, 1, 0, 0, 1, 1,
1.262634, -1.692841, 2.849935, 1, 0, 0, 1, 1,
1.265947, 0.5352409, 3.215633, 1, 0, 0, 1, 1,
1.266787, -0.1702054, 2.476517, 1, 0, 0, 1, 1,
1.27211, -0.6863516, 2.403415, 0, 0, 0, 1, 1,
1.28739, -0.7719356, 2.406314, 0, 0, 0, 1, 1,
1.289746, -0.2581517, 2.10828, 0, 0, 0, 1, 1,
1.296013, -0.4423388, 4.072752, 0, 0, 0, 1, 1,
1.299083, 0.5957634, 0.01108623, 0, 0, 0, 1, 1,
1.299728, 0.966599, -0.7607815, 0, 0, 0, 1, 1,
1.306055, 0.9507374, -0.5363947, 0, 0, 0, 1, 1,
1.310681, -0.5248708, 1.565313, 1, 1, 1, 1, 1,
1.311428, 0.5293887, 1.211661, 1, 1, 1, 1, 1,
1.316316, 1.175937, -0.3649524, 1, 1, 1, 1, 1,
1.316374, 0.05321636, 0.8073611, 1, 1, 1, 1, 1,
1.340834, -1.202738, 3.106229, 1, 1, 1, 1, 1,
1.341698, -2.637612, 1.360957, 1, 1, 1, 1, 1,
1.351845, 0.2613309, 0.4277188, 1, 1, 1, 1, 1,
1.372377, -0.3306594, 2.316359, 1, 1, 1, 1, 1,
1.383986, 1.273668, -0.4909295, 1, 1, 1, 1, 1,
1.387688, 0.8421268, 2.322064, 1, 1, 1, 1, 1,
1.395078, 0.8354964, 2.863764, 1, 1, 1, 1, 1,
1.397575, 1.91478, 0.1560983, 1, 1, 1, 1, 1,
1.405944, 0.7523054, 0.2593239, 1, 1, 1, 1, 1,
1.413298, 0.9714489, -0.09444323, 1, 1, 1, 1, 1,
1.413855, 0.9235935, 1.443894, 1, 1, 1, 1, 1,
1.419549, 1.493475, 1.049769, 0, 0, 1, 1, 1,
1.432081, 1.516928, 1.383557, 1, 0, 0, 1, 1,
1.443303, 0.1025609, 1.469406, 1, 0, 0, 1, 1,
1.444912, -0.6567265, 1.63733, 1, 0, 0, 1, 1,
1.456178, -0.913269, 0.7097802, 1, 0, 0, 1, 1,
1.477827, 0.4625338, 1.336404, 1, 0, 0, 1, 1,
1.481617, 0.02911109, 2.837548, 0, 0, 0, 1, 1,
1.49855, -0.1997829, 3.738708, 0, 0, 0, 1, 1,
1.509015, -0.9850261, 1.58224, 0, 0, 0, 1, 1,
1.512133, 0.8039977, 0.3919267, 0, 0, 0, 1, 1,
1.519601, 0.9632, 1.823313, 0, 0, 0, 1, 1,
1.53306, 0.1603164, 1.738961, 0, 0, 0, 1, 1,
1.541609, 3.096604, 1.739562, 0, 0, 0, 1, 1,
1.547637, -1.94848, 3.132717, 1, 1, 1, 1, 1,
1.580722, 1.743265, 0.3865188, 1, 1, 1, 1, 1,
1.586198, 1.676481, -0.138819, 1, 1, 1, 1, 1,
1.609107, -1.042797, 0.8914313, 1, 1, 1, 1, 1,
1.64154, -0.8634874, 3.876089, 1, 1, 1, 1, 1,
1.645643, -0.1520629, 1.826301, 1, 1, 1, 1, 1,
1.651677, 0.02235036, 1.56816, 1, 1, 1, 1, 1,
1.658762, -1.309337, 1.118836, 1, 1, 1, 1, 1,
1.666831, 0.6736436, 4.085814, 1, 1, 1, 1, 1,
1.676302, 0.09563366, 1.500867, 1, 1, 1, 1, 1,
1.698581, 0.9910272, 2.359482, 1, 1, 1, 1, 1,
1.707444, 2.535074, 0.1074602, 1, 1, 1, 1, 1,
1.718609, 0.1682349, 3.554557, 1, 1, 1, 1, 1,
1.720478, 0.9254304, 1.745095, 1, 1, 1, 1, 1,
1.727681, 0.8500957, 0.9056751, 1, 1, 1, 1, 1,
1.737075, 0.9340003, 1.237587, 0, 0, 1, 1, 1,
1.747537, -0.287529, 2.22985, 1, 0, 0, 1, 1,
1.776705, 0.9425697, 1.11685, 1, 0, 0, 1, 1,
1.776902, 0.353603, 1.277999, 1, 0, 0, 1, 1,
1.783113, 0.277597, 3.181151, 1, 0, 0, 1, 1,
1.80443, -1.672226, 0.6764014, 1, 0, 0, 1, 1,
1.805671, 0.3229628, -0.6223655, 0, 0, 0, 1, 1,
1.806247, -0.6045836, 3.163033, 0, 0, 0, 1, 1,
1.816837, -0.325937, 0.8540218, 0, 0, 0, 1, 1,
1.826578, -0.4209958, 1.36, 0, 0, 0, 1, 1,
1.844312, -1.198856, 1.257049, 0, 0, 0, 1, 1,
1.849653, -0.9171644, 3.110827, 0, 0, 0, 1, 1,
1.854119, 0.1792123, 0.7634434, 0, 0, 0, 1, 1,
1.86321, 0.9289654, 1.73684, 1, 1, 1, 1, 1,
1.891035, -0.2763075, 3.60204, 1, 1, 1, 1, 1,
1.915235, 0.6710261, 1.464928, 1, 1, 1, 1, 1,
1.915967, 1.391808, 1.831507, 1, 1, 1, 1, 1,
1.92799, -1.300602, 1.340926, 1, 1, 1, 1, 1,
1.935625, 0.4533111, -0.5908175, 1, 1, 1, 1, 1,
1.94436, 0.1603602, 0.8077107, 1, 1, 1, 1, 1,
1.990581, 0.4475591, 1.565843, 1, 1, 1, 1, 1,
2.022079, -0.2599691, 2.23267, 1, 1, 1, 1, 1,
2.025739, 0.4514558, 2.054504, 1, 1, 1, 1, 1,
2.02901, -0.08277241, 1.532024, 1, 1, 1, 1, 1,
2.042824, 0.2807045, -0.5027456, 1, 1, 1, 1, 1,
2.048281, -1.216723, 2.443643, 1, 1, 1, 1, 1,
2.096291, -0.5068588, 2.836754, 1, 1, 1, 1, 1,
2.120155, 1.379302, 2.108372, 1, 1, 1, 1, 1,
2.130199, 0.4682777, 1.420991, 0, 0, 1, 1, 1,
2.138135, 0.5142031, 2.130637, 1, 0, 0, 1, 1,
2.144299, -0.3994478, 2.439207, 1, 0, 0, 1, 1,
2.16865, -0.443703, 3.104825, 1, 0, 0, 1, 1,
2.199311, 0.631583, 0.4124593, 1, 0, 0, 1, 1,
2.224353, 0.1009163, 3.583067, 1, 0, 0, 1, 1,
2.22935, 0.0187777, 3.740817, 0, 0, 0, 1, 1,
2.242298, -0.1950876, 2.871034, 0, 0, 0, 1, 1,
2.281103, 0.2804724, 3.512275, 0, 0, 0, 1, 1,
2.311911, -0.6871132, 0.4798217, 0, 0, 0, 1, 1,
2.371731, 0.8170969, 1.113496, 0, 0, 0, 1, 1,
2.393959, 0.5818589, 0.2641866, 0, 0, 0, 1, 1,
2.55923, -0.774292, 0.2956466, 0, 0, 0, 1, 1,
2.66113, -0.795068, 1.717678, 1, 1, 1, 1, 1,
2.782139, -0.6811252, 1.54948, 1, 1, 1, 1, 1,
2.834745, -0.8393582, 1.372439, 1, 1, 1, 1, 1,
2.86436, 0.4095877, 1.480796, 1, 1, 1, 1, 1,
2.878587, -0.07014181, 2.066419, 1, 1, 1, 1, 1,
2.961511, 1.836777, -0.7282875, 1, 1, 1, 1, 1,
3.632122, -0.02937841, 1.922194, 1, 1, 1, 1, 1
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
var radius = 9.623561;
var distance = 33.80235;
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
mvMatrix.translate( -0.2916403, -0.2471416, 0.4039354 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80235);
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
