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
-2.826191, 0.7378635, -0.1808835, 1, 0, 0, 1,
-2.682996, -1.152565, -3.683821, 1, 0.007843138, 0, 1,
-2.640544, 1.050489, -0.7438465, 1, 0.01176471, 0, 1,
-2.634383, 0.2226026, -2.250296, 1, 0.01960784, 0, 1,
-2.440236, 1.003687, 0.6899551, 1, 0.02352941, 0, 1,
-2.400175, 1.042782, -1.091482, 1, 0.03137255, 0, 1,
-2.396112, 0.1152103, -2.583677, 1, 0.03529412, 0, 1,
-2.36884, -0.111328, -1.789282, 1, 0.04313726, 0, 1,
-2.305566, -0.8250937, -2.509542, 1, 0.04705882, 0, 1,
-2.292779, -0.7333645, -2.848166, 1, 0.05490196, 0, 1,
-2.246352, 0.5492969, -1.63386, 1, 0.05882353, 0, 1,
-2.244066, -0.1078984, -3.338184, 1, 0.06666667, 0, 1,
-2.218332, -1.339429, -0.9075722, 1, 0.07058824, 0, 1,
-2.18037, -0.4998108, -3.82316, 1, 0.07843138, 0, 1,
-2.142478, 2.382593, -1.613478, 1, 0.08235294, 0, 1,
-2.122072, 0.1882684, -2.740557, 1, 0.09019608, 0, 1,
-2.105472, -0.5968407, -1.473215, 1, 0.09411765, 0, 1,
-2.075076, 0.6666647, -0.6273213, 1, 0.1019608, 0, 1,
-2.074267, -1.228944, -2.37574, 1, 0.1098039, 0, 1,
-2.010087, 0.9016242, -1.02755, 1, 0.1137255, 0, 1,
-1.986056, -0.3013645, -1.54575, 1, 0.1215686, 0, 1,
-1.974921, 1.262723, -0.6099913, 1, 0.1254902, 0, 1,
-1.96667, -2.812798, -3.39035, 1, 0.1333333, 0, 1,
-1.944599, -0.740837, -1.806798, 1, 0.1372549, 0, 1,
-1.942193, 0.2568649, -0.6686466, 1, 0.145098, 0, 1,
-1.927454, -1.007005, 0.1662483, 1, 0.1490196, 0, 1,
-1.908598, 0.346561, 0.0525483, 1, 0.1568628, 0, 1,
-1.877992, -2.253818, -1.754494, 1, 0.1607843, 0, 1,
-1.873493, -1.174005, -1.139047, 1, 0.1686275, 0, 1,
-1.865982, 1.015364, -1.161969, 1, 0.172549, 0, 1,
-1.865294, 0.5172338, -1.272892, 1, 0.1803922, 0, 1,
-1.847154, -1.952308, -0.811022, 1, 0.1843137, 0, 1,
-1.842998, 0.002436451, -1.903649, 1, 0.1921569, 0, 1,
-1.828585, 0.4449633, -0.8653585, 1, 0.1960784, 0, 1,
-1.821286, -0.7708769, -3.07998, 1, 0.2039216, 0, 1,
-1.806386, -0.8501828, -1.70598, 1, 0.2117647, 0, 1,
-1.781094, 1.859296, -0.8525134, 1, 0.2156863, 0, 1,
-1.743686, 0.6734609, -0.1865969, 1, 0.2235294, 0, 1,
-1.726927, 0.1870962, -1.50195, 1, 0.227451, 0, 1,
-1.718397, -0.1978683, -2.110552, 1, 0.2352941, 0, 1,
-1.696145, -0.3762387, -3.030807, 1, 0.2392157, 0, 1,
-1.677764, 0.848037, -1.935105, 1, 0.2470588, 0, 1,
-1.653808, -0.2689192, -0.7535545, 1, 0.2509804, 0, 1,
-1.637636, -0.1630872, -1.208515, 1, 0.2588235, 0, 1,
-1.636188, -0.5266917, -2.656126, 1, 0.2627451, 0, 1,
-1.632051, 0.1869403, -2.835458, 1, 0.2705882, 0, 1,
-1.631271, -0.003976957, -2.723346, 1, 0.2745098, 0, 1,
-1.628139, -1.886394, -1.43281, 1, 0.282353, 0, 1,
-1.618117, -0.06144283, -1.610073, 1, 0.2862745, 0, 1,
-1.598034, 0.3933531, -1.380328, 1, 0.2941177, 0, 1,
-1.573737, 0.463383, -0.1471731, 1, 0.3019608, 0, 1,
-1.560198, -0.06810267, 0.0572934, 1, 0.3058824, 0, 1,
-1.559509, 1.866749, 0.2373175, 1, 0.3137255, 0, 1,
-1.55882, -0.4402442, -1.458945, 1, 0.3176471, 0, 1,
-1.546264, 0.8425688, -1.204406, 1, 0.3254902, 0, 1,
-1.531592, -0.4460123, -1.718043, 1, 0.3294118, 0, 1,
-1.525352, 0.1103221, -1.263947, 1, 0.3372549, 0, 1,
-1.503462, -0.005120658, -0.6116276, 1, 0.3411765, 0, 1,
-1.499429, 0.5219617, -1.889488, 1, 0.3490196, 0, 1,
-1.496653, 0.7689689, -0.4421131, 1, 0.3529412, 0, 1,
-1.495742, -2.003098, -1.706634, 1, 0.3607843, 0, 1,
-1.47178, 0.2735838, -1.272831, 1, 0.3647059, 0, 1,
-1.471695, -1.027636, -2.565742, 1, 0.372549, 0, 1,
-1.464509, 0.2889274, -1.165952, 1, 0.3764706, 0, 1,
-1.463456, -0.5212923, -1.568206, 1, 0.3843137, 0, 1,
-1.460823, 0.7830659, -1.944915, 1, 0.3882353, 0, 1,
-1.447315, -1.905514, -2.633795, 1, 0.3960784, 0, 1,
-1.445949, -0.5512315, -2.174488, 1, 0.4039216, 0, 1,
-1.436955, -1.048673, -1.717188, 1, 0.4078431, 0, 1,
-1.427982, -0.4314796, -1.879587, 1, 0.4156863, 0, 1,
-1.42223, -0.8847453, -2.469645, 1, 0.4196078, 0, 1,
-1.41692, -1.14995, -2.798613, 1, 0.427451, 0, 1,
-1.409498, 0.1238927, -1.868774, 1, 0.4313726, 0, 1,
-1.400592, -0.1067101, 0.5240434, 1, 0.4392157, 0, 1,
-1.397737, -0.3530035, -1.988317, 1, 0.4431373, 0, 1,
-1.393573, 1.087883, -0.4797535, 1, 0.4509804, 0, 1,
-1.388089, -1.145187, -2.848079, 1, 0.454902, 0, 1,
-1.380995, 0.1839128, -1.093839, 1, 0.4627451, 0, 1,
-1.377604, -1.345809, -1.156246, 1, 0.4666667, 0, 1,
-1.374767, -0.5437202, -1.921323, 1, 0.4745098, 0, 1,
-1.371919, -0.06579668, -1.638503, 1, 0.4784314, 0, 1,
-1.367862, 0.7397077, -1.480662, 1, 0.4862745, 0, 1,
-1.359473, 0.9470276, -1.662472, 1, 0.4901961, 0, 1,
-1.355166, -0.3550858, -3.267542, 1, 0.4980392, 0, 1,
-1.337509, 0.03310613, -2.460898, 1, 0.5058824, 0, 1,
-1.329851, 0.02187945, -3.052836, 1, 0.509804, 0, 1,
-1.326759, 0.2519361, -1.195867, 1, 0.5176471, 0, 1,
-1.323815, 0.7603757, -0.9774546, 1, 0.5215687, 0, 1,
-1.318736, -0.9215561, -1.688292, 1, 0.5294118, 0, 1,
-1.311375, -0.2462162, -2.49971, 1, 0.5333334, 0, 1,
-1.309939, -0.8323447, -1.973687, 1, 0.5411765, 0, 1,
-1.307837, -0.7171869, -2.895577, 1, 0.5450981, 0, 1,
-1.300809, 0.7305529, -2.948105, 1, 0.5529412, 0, 1,
-1.295835, -1.578036, -1.552899, 1, 0.5568628, 0, 1,
-1.286719, -2.077216, -1.051156, 1, 0.5647059, 0, 1,
-1.283781, 1.769521, -0.6145807, 1, 0.5686275, 0, 1,
-1.269806, -0.8383792, -2.091417, 1, 0.5764706, 0, 1,
-1.268967, -0.251965, -1.245132, 1, 0.5803922, 0, 1,
-1.268071, -0.7521034, -2.145393, 1, 0.5882353, 0, 1,
-1.265467, 0.9413058, 1.332731, 1, 0.5921569, 0, 1,
-1.257516, -1.444424, -3.412616, 1, 0.6, 0, 1,
-1.257111, 0.08525947, -0.8267604, 1, 0.6078432, 0, 1,
-1.256938, 0.845746, -0.732594, 1, 0.6117647, 0, 1,
-1.252481, 0.2152516, -1.283212, 1, 0.6196079, 0, 1,
-1.248953, -0.2270036, -1.992801, 1, 0.6235294, 0, 1,
-1.248396, 1.712226, -1.667964, 1, 0.6313726, 0, 1,
-1.247055, 0.1424337, -2.378227, 1, 0.6352941, 0, 1,
-1.243889, 1.201441, 1.023186, 1, 0.6431373, 0, 1,
-1.24378, -1.26215, -3.763546, 1, 0.6470588, 0, 1,
-1.232854, 2.099225, 0.09379101, 1, 0.654902, 0, 1,
-1.223245, 0.6245977, -0.07158303, 1, 0.6588235, 0, 1,
-1.213113, 0.9190789, -0.7503407, 1, 0.6666667, 0, 1,
-1.197173, -1.073566, -4.296839, 1, 0.6705883, 0, 1,
-1.196181, 0.3011317, -2.406274, 1, 0.6784314, 0, 1,
-1.187644, 0.8083791, 0.7346433, 1, 0.682353, 0, 1,
-1.186539, -0.009697159, -1.464071, 1, 0.6901961, 0, 1,
-1.17237, 0.8403707, 0.3143297, 1, 0.6941177, 0, 1,
-1.172367, 0.8853762, -0.5258695, 1, 0.7019608, 0, 1,
-1.168525, 0.5194529, -1.170547, 1, 0.7098039, 0, 1,
-1.167756, -1.355873, -2.77695, 1, 0.7137255, 0, 1,
-1.161972, -0.2580207, -1.340068, 1, 0.7215686, 0, 1,
-1.160405, 0.4318234, -2.380629, 1, 0.7254902, 0, 1,
-1.160052, -0.3499489, -3.259386, 1, 0.7333333, 0, 1,
-1.15473, 0.5555401, -0.6989279, 1, 0.7372549, 0, 1,
-1.15119, 0.1370794, -1.348447, 1, 0.7450981, 0, 1,
-1.126726, 0.06613448, -2.259351, 1, 0.7490196, 0, 1,
-1.122927, -2.033054, -3.45746, 1, 0.7568628, 0, 1,
-1.122266, -0.04980616, 0.2218899, 1, 0.7607843, 0, 1,
-1.121589, -1.769325, -3.404265, 1, 0.7686275, 0, 1,
-1.114171, -0.0009812593, 0.04385344, 1, 0.772549, 0, 1,
-1.112432, 1.946299, 0.1173692, 1, 0.7803922, 0, 1,
-1.111008, 0.1328319, -1.328294, 1, 0.7843137, 0, 1,
-1.108619, 0.5468512, -2.402856, 1, 0.7921569, 0, 1,
-1.106704, 0.6066663, -1.474853, 1, 0.7960784, 0, 1,
-1.105229, -1.164975, -2.017964, 1, 0.8039216, 0, 1,
-1.096631, -0.3810727, -1.302955, 1, 0.8117647, 0, 1,
-1.092988, 0.7250242, -0.6944327, 1, 0.8156863, 0, 1,
-1.090872, 0.0494032, -2.185197, 1, 0.8235294, 0, 1,
-1.082541, -0.5420222, -1.210937, 1, 0.827451, 0, 1,
-1.079866, 0.01329985, 0.06761492, 1, 0.8352941, 0, 1,
-1.079729, -2.114106, -1.842244, 1, 0.8392157, 0, 1,
-1.078764, 0.9430172, 0.5398031, 1, 0.8470588, 0, 1,
-1.074703, -0.7548407, -2.216652, 1, 0.8509804, 0, 1,
-1.066958, -1.243569, -2.748027, 1, 0.8588235, 0, 1,
-1.063726, 0.8309538, -0.08553691, 1, 0.8627451, 0, 1,
-1.06012, -1.094799, -2.841402, 1, 0.8705882, 0, 1,
-1.055811, -0.6757056, -4.404432, 1, 0.8745098, 0, 1,
-1.055015, 0.3480241, -1.903042, 1, 0.8823529, 0, 1,
-1.054894, 0.08385958, -4.978087, 1, 0.8862745, 0, 1,
-1.043839, 0.7255358, 0.3499796, 1, 0.8941177, 0, 1,
-1.042777, 0.1642768, -0.4537674, 1, 0.8980392, 0, 1,
-1.042639, 0.9195213, -1.713742, 1, 0.9058824, 0, 1,
-1.038812, -0.1893219, 0.07238733, 1, 0.9137255, 0, 1,
-1.035886, -0.3663428, -2.69198, 1, 0.9176471, 0, 1,
-1.027519, -0.6383293, -0.6454645, 1, 0.9254902, 0, 1,
-1.015546, 0.1403562, -0.8680189, 1, 0.9294118, 0, 1,
-1.012972, -0.04842691, -1.257159, 1, 0.9372549, 0, 1,
-1.01018, 0.5359812, -0.8812334, 1, 0.9411765, 0, 1,
-1.008283, 0.7620175, -3.465254, 1, 0.9490196, 0, 1,
-1.003484, 1.257882, 0.2356111, 1, 0.9529412, 0, 1,
-0.9999636, -0.6239241, -3.204749, 1, 0.9607843, 0, 1,
-0.9892738, 0.6933881, -1.825959, 1, 0.9647059, 0, 1,
-0.9881916, 0.9515839, -0.8993448, 1, 0.972549, 0, 1,
-0.985108, -0.3891492, -1.674187, 1, 0.9764706, 0, 1,
-0.9824213, -1.81465, -3.46408, 1, 0.9843137, 0, 1,
-0.9806402, 0.3027921, -1.856555, 1, 0.9882353, 0, 1,
-0.9804288, -0.7574583, -2.488141, 1, 0.9960784, 0, 1,
-0.9799495, 0.05613909, -2.298884, 0.9960784, 1, 0, 1,
-0.9763674, -0.4996264, -2.227427, 0.9921569, 1, 0, 1,
-0.9683542, 1.211242, -1.419238, 0.9843137, 1, 0, 1,
-0.9523673, -2.893362, -4.106863, 0.9803922, 1, 0, 1,
-0.9439126, 0.6780057, -0.7005212, 0.972549, 1, 0, 1,
-0.9390063, -1.353045, -4.029655, 0.9686275, 1, 0, 1,
-0.9358369, -0.08861345, -1.174213, 0.9607843, 1, 0, 1,
-0.9208274, 0.01233696, -2.160876, 0.9568627, 1, 0, 1,
-0.9198902, -0.5455779, -1.793231, 0.9490196, 1, 0, 1,
-0.9185899, -0.7830048, -1.353962, 0.945098, 1, 0, 1,
-0.9177408, 2.54327, -0.9859246, 0.9372549, 1, 0, 1,
-0.911815, 0.3349379, -2.001418, 0.9333333, 1, 0, 1,
-0.9077085, 0.4862139, -2.276307, 0.9254902, 1, 0, 1,
-0.9061013, 0.7338077, 0.1147836, 0.9215686, 1, 0, 1,
-0.8971796, 0.7694814, -1.598729, 0.9137255, 1, 0, 1,
-0.8963838, 1.477972, -1.080205, 0.9098039, 1, 0, 1,
-0.895615, 1.962589, -0.577563, 0.9019608, 1, 0, 1,
-0.8940553, 0.2154613, -1.380515, 0.8941177, 1, 0, 1,
-0.8938647, -0.7821227, -1.274373, 0.8901961, 1, 0, 1,
-0.8910894, 0.3617704, -2.001356, 0.8823529, 1, 0, 1,
-0.8853815, 0.04725462, -2.283216, 0.8784314, 1, 0, 1,
-0.8772517, 0.06902767, 0.1980797, 0.8705882, 1, 0, 1,
-0.8761607, 2.055192, -1.677512, 0.8666667, 1, 0, 1,
-0.8629302, 1.460046, -1.433896, 0.8588235, 1, 0, 1,
-0.8610647, 0.6201111, -1.338256, 0.854902, 1, 0, 1,
-0.8540978, 0.6811801, 1.915759, 0.8470588, 1, 0, 1,
-0.8463105, -0.8735769, -3.238313, 0.8431373, 1, 0, 1,
-0.8430169, 1.053402, -1.146792, 0.8352941, 1, 0, 1,
-0.8414695, -0.7809698, -2.229041, 0.8313726, 1, 0, 1,
-0.840186, 0.5697823, -3.40663, 0.8235294, 1, 0, 1,
-0.8371797, -1.141553, -2.10419, 0.8196079, 1, 0, 1,
-0.8270185, 0.7873027, -1.003331, 0.8117647, 1, 0, 1,
-0.8156247, 2.294295, 0.5449471, 0.8078431, 1, 0, 1,
-0.810965, -1.253503, -3.080882, 0.8, 1, 0, 1,
-0.8078405, -0.2552209, -1.776108, 0.7921569, 1, 0, 1,
-0.8025302, 0.4137606, -0.188457, 0.7882353, 1, 0, 1,
-0.8008156, -0.1894262, -1.569299, 0.7803922, 1, 0, 1,
-0.7941405, 0.1661136, 0.1383158, 0.7764706, 1, 0, 1,
-0.7932719, 0.681905, -1.547807, 0.7686275, 1, 0, 1,
-0.7915921, 0.1474052, -1.28997, 0.7647059, 1, 0, 1,
-0.7909153, -0.6197168, -1.842843, 0.7568628, 1, 0, 1,
-0.7807854, -2.440767, -1.417363, 0.7529412, 1, 0, 1,
-0.7784372, -0.3954556, -1.797027, 0.7450981, 1, 0, 1,
-0.7774572, 1.033506, -0.7086528, 0.7411765, 1, 0, 1,
-0.7727602, 2.576609, 0.06614926, 0.7333333, 1, 0, 1,
-0.7698664, -0.5346997, -1.916877, 0.7294118, 1, 0, 1,
-0.7619252, 0.2211582, -2.130788, 0.7215686, 1, 0, 1,
-0.7609326, 0.3427888, -1.358415, 0.7176471, 1, 0, 1,
-0.7599098, -0.103238, -0.8825124, 0.7098039, 1, 0, 1,
-0.7583767, -2.053766, -3.305401, 0.7058824, 1, 0, 1,
-0.7487491, -0.8654769, -1.226686, 0.6980392, 1, 0, 1,
-0.7420937, -0.7756491, -3.64474, 0.6901961, 1, 0, 1,
-0.7394683, -0.06967742, -2.352862, 0.6862745, 1, 0, 1,
-0.7383138, -0.2971231, -1.915643, 0.6784314, 1, 0, 1,
-0.7359492, -1.297889, -1.621985, 0.6745098, 1, 0, 1,
-0.7353429, 1.254896, 0.1538808, 0.6666667, 1, 0, 1,
-0.7334179, -0.7957499, -3.227042, 0.6627451, 1, 0, 1,
-0.7299452, 0.6014031, -0.1850368, 0.654902, 1, 0, 1,
-0.7167597, -1.263325, -3.706116, 0.6509804, 1, 0, 1,
-0.7143282, -0.4127449, -2.628569, 0.6431373, 1, 0, 1,
-0.7077335, -0.780297, -2.801034, 0.6392157, 1, 0, 1,
-0.7064138, 0.1027542, -1.745768, 0.6313726, 1, 0, 1,
-0.7061787, -1.576826, -2.414838, 0.627451, 1, 0, 1,
-0.7051058, -0.07499111, -1.807698, 0.6196079, 1, 0, 1,
-0.7042907, 0.2791045, -1.248006, 0.6156863, 1, 0, 1,
-0.7017764, 1.654169, -0.8973938, 0.6078432, 1, 0, 1,
-0.7012005, 0.6138347, -0.6621299, 0.6039216, 1, 0, 1,
-0.6995997, -0.2972751, -2.107612, 0.5960785, 1, 0, 1,
-0.6980761, 0.9161732, 0.2644079, 0.5882353, 1, 0, 1,
-0.6932595, -1.526178, -2.702143, 0.5843138, 1, 0, 1,
-0.6886949, 1.442244, 0.188758, 0.5764706, 1, 0, 1,
-0.6848258, -0.6999643, -2.84681, 0.572549, 1, 0, 1,
-0.6813751, 0.4867754, -0.7076154, 0.5647059, 1, 0, 1,
-0.6813751, 0.8222258, 0.1663514, 0.5607843, 1, 0, 1,
-0.6792636, -2.011051, -2.305316, 0.5529412, 1, 0, 1,
-0.6791075, -0.4743765, -3.377002, 0.5490196, 1, 0, 1,
-0.6788479, 1.512212, -0.01014302, 0.5411765, 1, 0, 1,
-0.6761765, -0.2841928, 0.6798977, 0.5372549, 1, 0, 1,
-0.6594247, 0.380785, -0.8011133, 0.5294118, 1, 0, 1,
-0.6558036, 0.09725065, -1.150107, 0.5254902, 1, 0, 1,
-0.6454367, 0.4705138, -0.8979713, 0.5176471, 1, 0, 1,
-0.6376374, -0.5054814, -2.295481, 0.5137255, 1, 0, 1,
-0.6372785, 0.5564454, -1.399233, 0.5058824, 1, 0, 1,
-0.6326123, 0.027485, -1.610952, 0.5019608, 1, 0, 1,
-0.6284094, 0.8382853, -1.427879, 0.4941176, 1, 0, 1,
-0.6274363, 0.6545637, -1.297439, 0.4862745, 1, 0, 1,
-0.6241157, -0.4640692, -2.027913, 0.4823529, 1, 0, 1,
-0.6221074, -0.8029602, -5.28904, 0.4745098, 1, 0, 1,
-0.6196421, -0.4688681, -2.121444, 0.4705882, 1, 0, 1,
-0.6160625, -0.04983883, -3.724394, 0.4627451, 1, 0, 1,
-0.6116143, 0.1738648, -1.945281, 0.4588235, 1, 0, 1,
-0.6098025, -1.258415, -3.922221, 0.4509804, 1, 0, 1,
-0.6015368, 0.9113678, -0.9021511, 0.4470588, 1, 0, 1,
-0.5992996, -0.9833578, -3.554147, 0.4392157, 1, 0, 1,
-0.5953983, -1.084011, -2.654092, 0.4352941, 1, 0, 1,
-0.5908329, -0.8145701, -0.9513909, 0.427451, 1, 0, 1,
-0.5792004, 0.2797741, -1.313436, 0.4235294, 1, 0, 1,
-0.5766566, 0.09116907, -0.8001597, 0.4156863, 1, 0, 1,
-0.5765666, 1.5036, -0.1588477, 0.4117647, 1, 0, 1,
-0.576218, -0.9973667, -3.010223, 0.4039216, 1, 0, 1,
-0.5758556, 1.805125, -1.564788, 0.3960784, 1, 0, 1,
-0.5748736, 2.645916, 1.927555, 0.3921569, 1, 0, 1,
-0.5719564, -0.8112169, -2.899511, 0.3843137, 1, 0, 1,
-0.5698497, -0.5625136, -0.9314282, 0.3803922, 1, 0, 1,
-0.5682139, -1.572741, -1.787858, 0.372549, 1, 0, 1,
-0.5677107, -0.222554, -1.864754, 0.3686275, 1, 0, 1,
-0.5654963, -1.269448, -1.616925, 0.3607843, 1, 0, 1,
-0.5650075, 1.546204, -0.01445485, 0.3568628, 1, 0, 1,
-0.5637601, 0.9756108, -1.022649, 0.3490196, 1, 0, 1,
-0.5629519, 1.827303, -1.42347, 0.345098, 1, 0, 1,
-0.5626848, -1.307224, -3.787417, 0.3372549, 1, 0, 1,
-0.5618303, -0.235908, -5.02066, 0.3333333, 1, 0, 1,
-0.5602558, -0.1200334, -1.504423, 0.3254902, 1, 0, 1,
-0.5601829, 0.07866508, -0.6946247, 0.3215686, 1, 0, 1,
-0.5599343, -1.476924, -2.464199, 0.3137255, 1, 0, 1,
-0.5576993, 0.8938336, 0.03940012, 0.3098039, 1, 0, 1,
-0.5568953, 0.2004582, -1.926872, 0.3019608, 1, 0, 1,
-0.5561162, 0.5056872, -0.6942831, 0.2941177, 1, 0, 1,
-0.5556895, 0.3329514, -0.3627719, 0.2901961, 1, 0, 1,
-0.5556791, -1.163624, -3.561328, 0.282353, 1, 0, 1,
-0.5491846, 0.4931117, -1.374263, 0.2784314, 1, 0, 1,
-0.5471223, -0.2113244, -0.9250219, 0.2705882, 1, 0, 1,
-0.5431598, -0.6393953, -2.135894, 0.2666667, 1, 0, 1,
-0.5409628, -0.5704117, -2.212796, 0.2588235, 1, 0, 1,
-0.540406, -1.529683, -0.7272222, 0.254902, 1, 0, 1,
-0.5358927, 0.6064661, -0.5361179, 0.2470588, 1, 0, 1,
-0.5193108, 0.6748511, -1.296749, 0.2431373, 1, 0, 1,
-0.5191244, 0.6111067, -1.283343, 0.2352941, 1, 0, 1,
-0.5187258, 0.2369805, -4.228311, 0.2313726, 1, 0, 1,
-0.5136288, -0.4945041, -2.926185, 0.2235294, 1, 0, 1,
-0.5060356, 0.6985574, -0.8554507, 0.2196078, 1, 0, 1,
-0.5055865, -1.748944, -1.289487, 0.2117647, 1, 0, 1,
-0.5016474, 0.02617086, -0.03160035, 0.2078431, 1, 0, 1,
-0.4993456, -0.1574184, -1.752805, 0.2, 1, 0, 1,
-0.4982135, -0.7438517, -2.25928, 0.1921569, 1, 0, 1,
-0.4972953, -1.317737, -2.658971, 0.1882353, 1, 0, 1,
-0.4912405, -0.5657517, -2.814978, 0.1803922, 1, 0, 1,
-0.4905923, 0.04964864, -2.68106, 0.1764706, 1, 0, 1,
-0.4837519, -0.8931646, -1.724331, 0.1686275, 1, 0, 1,
-0.4783415, 0.5932482, -0.1793073, 0.1647059, 1, 0, 1,
-0.4727801, -0.8199212, -1.885758, 0.1568628, 1, 0, 1,
-0.4727698, 1.974556, -2.008922, 0.1529412, 1, 0, 1,
-0.4721907, -2.156334, -1.944797, 0.145098, 1, 0, 1,
-0.4678615, 2.708494, 0.235572, 0.1411765, 1, 0, 1,
-0.4672802, -0.5570021, -2.295208, 0.1333333, 1, 0, 1,
-0.4667792, 1.525857, -0.5510594, 0.1294118, 1, 0, 1,
-0.4664614, 0.9984998, -0.9265618, 0.1215686, 1, 0, 1,
-0.464983, -0.3050974, 0.2640327, 0.1176471, 1, 0, 1,
-0.464302, -0.05824689, -1.929129, 0.1098039, 1, 0, 1,
-0.4598283, -0.742165, -2.97942, 0.1058824, 1, 0, 1,
-0.4544604, 0.253758, -0.977712, 0.09803922, 1, 0, 1,
-0.4431899, -0.02814158, -1.167951, 0.09019608, 1, 0, 1,
-0.4427519, -0.5936471, -3.063839, 0.08627451, 1, 0, 1,
-0.4419739, -0.4387057, -1.659243, 0.07843138, 1, 0, 1,
-0.4410686, -0.535088, -3.091145, 0.07450981, 1, 0, 1,
-0.4405952, 0.5622894, -2.207128, 0.06666667, 1, 0, 1,
-0.4351335, 0.3606722, -0.7589443, 0.0627451, 1, 0, 1,
-0.4336084, -0.6438081, -3.226892, 0.05490196, 1, 0, 1,
-0.4314348, -0.1262382, -1.204218, 0.05098039, 1, 0, 1,
-0.4276105, 1.533432, 0.9380846, 0.04313726, 1, 0, 1,
-0.4218084, 0.2937266, -1.74501, 0.03921569, 1, 0, 1,
-0.4216298, -0.6024064, -2.971345, 0.03137255, 1, 0, 1,
-0.4185741, 0.1164775, -1.056294, 0.02745098, 1, 0, 1,
-0.4176465, 1.860416, -0.2342144, 0.01960784, 1, 0, 1,
-0.4105782, 1.859994, 1.597419, 0.01568628, 1, 0, 1,
-0.4088183, -1.047678, -1.85057, 0.007843138, 1, 0, 1,
-0.4068134, 1.184624, -2.089394, 0.003921569, 1, 0, 1,
-0.4034238, -1.131431, -1.20945, 0, 1, 0.003921569, 1,
-0.4017491, 1.85593, -0.1087225, 0, 1, 0.01176471, 1,
-0.3961368, 0.5812204, -1.122161, 0, 1, 0.01568628, 1,
-0.3937261, -0.7020468, -3.244725, 0, 1, 0.02352941, 1,
-0.3915541, 0.8456133, 1.134162, 0, 1, 0.02745098, 1,
-0.3907371, 1.030727, -0.8853268, 0, 1, 0.03529412, 1,
-0.3796964, -0.02022276, -1.963246, 0, 1, 0.03921569, 1,
-0.3787455, 0.1032129, -1.290126, 0, 1, 0.04705882, 1,
-0.3757287, 0.2846143, -1.227771, 0, 1, 0.05098039, 1,
-0.3738406, -0.4934258, -0.8762352, 0, 1, 0.05882353, 1,
-0.3725446, -0.2295997, -3.086408, 0, 1, 0.0627451, 1,
-0.3685012, -0.8876457, -2.696378, 0, 1, 0.07058824, 1,
-0.3674998, 0.7606376, 0.4819773, 0, 1, 0.07450981, 1,
-0.3643174, 0.5736759, -1.457444, 0, 1, 0.08235294, 1,
-0.3642925, 0.6197504, 0.9156728, 0, 1, 0.08627451, 1,
-0.363502, -0.218831, -3.598594, 0, 1, 0.09411765, 1,
-0.3615513, -0.6705355, -1.667937, 0, 1, 0.1019608, 1,
-0.3563688, 0.7195129, -1.243663, 0, 1, 0.1058824, 1,
-0.355473, -1.736454, -3.036909, 0, 1, 0.1137255, 1,
-0.3526843, 0.06069732, -0.9049885, 0, 1, 0.1176471, 1,
-0.3513798, -0.1492651, -0.8668252, 0, 1, 0.1254902, 1,
-0.3511438, -1.019334, -3.405846, 0, 1, 0.1294118, 1,
-0.3366769, 0.8920403, -0.9462202, 0, 1, 0.1372549, 1,
-0.3324304, -0.9578584, -4.231446, 0, 1, 0.1411765, 1,
-0.3311621, 1.50057, -1.287148, 0, 1, 0.1490196, 1,
-0.3247631, 0.9720056, -0.9975165, 0, 1, 0.1529412, 1,
-0.32173, -0.254272, -2.478136, 0, 1, 0.1607843, 1,
-0.3193032, -0.6533645, -1.881899, 0, 1, 0.1647059, 1,
-0.3147731, -2.012628, -3.093515, 0, 1, 0.172549, 1,
-0.3147569, 0.4381527, -1.070497, 0, 1, 0.1764706, 1,
-0.3137007, 1.885424, -0.00708005, 0, 1, 0.1843137, 1,
-0.3133655, -0.7613949, -3.887396, 0, 1, 0.1882353, 1,
-0.309381, -0.3083275, -3.723428, 0, 1, 0.1960784, 1,
-0.2935258, -0.7938865, -4.674356, 0, 1, 0.2039216, 1,
-0.2934456, -0.1376103, -3.302568, 0, 1, 0.2078431, 1,
-0.2917003, -0.595623, -2.427353, 0, 1, 0.2156863, 1,
-0.2913652, 0.507818, -1.570465, 0, 1, 0.2196078, 1,
-0.2865964, -0.4657805, -2.969382, 0, 1, 0.227451, 1,
-0.2843121, 2.304184, -1.32713, 0, 1, 0.2313726, 1,
-0.2803743, 0.44092, 1.415089, 0, 1, 0.2392157, 1,
-0.2700711, -0.02458914, -2.214513, 0, 1, 0.2431373, 1,
-0.2595478, 2.09676, 1.78511, 0, 1, 0.2509804, 1,
-0.2594023, -0.4826288, -2.541332, 0, 1, 0.254902, 1,
-0.258423, -0.2653967, -1.390381, 0, 1, 0.2627451, 1,
-0.257495, 0.02710259, -3.777363, 0, 1, 0.2666667, 1,
-0.256594, 0.9654727, -0.6306521, 0, 1, 0.2745098, 1,
-0.2460968, -1.854161, -2.815581, 0, 1, 0.2784314, 1,
-0.2460435, 2.179086, 0.3985823, 0, 1, 0.2862745, 1,
-0.2451468, 0.07523136, -0.6006161, 0, 1, 0.2901961, 1,
-0.2432979, -0.6323105, -2.929183, 0, 1, 0.2980392, 1,
-0.237966, -0.1333252, -1.73982, 0, 1, 0.3058824, 1,
-0.2367765, 0.2937367, 0.4112295, 0, 1, 0.3098039, 1,
-0.2357274, -0.08926379, -1.994277, 0, 1, 0.3176471, 1,
-0.232686, 0.9535512, -2.141606, 0, 1, 0.3215686, 1,
-0.2304925, -0.368558, -3.486404, 0, 1, 0.3294118, 1,
-0.2262387, -0.671297, -2.189138, 0, 1, 0.3333333, 1,
-0.2258606, -0.1967845, -1.241427, 0, 1, 0.3411765, 1,
-0.2241196, 0.4649988, -0.5380145, 0, 1, 0.345098, 1,
-0.211677, 0.7088529, 0.4008254, 0, 1, 0.3529412, 1,
-0.2109151, -0.3041648, -3.076819, 0, 1, 0.3568628, 1,
-0.2101334, -0.05146017, 0.4896553, 0, 1, 0.3647059, 1,
-0.2096044, 0.8208988, -0.04380709, 0, 1, 0.3686275, 1,
-0.2095612, 0.7467803, 0.5521415, 0, 1, 0.3764706, 1,
-0.2072688, -0.6892674, -3.18806, 0, 1, 0.3803922, 1,
-0.2066091, -0.8721312, -2.814522, 0, 1, 0.3882353, 1,
-0.2064742, -0.3542345, -3.234688, 0, 1, 0.3921569, 1,
-0.2043019, 0.5815865, -0.9636844, 0, 1, 0.4, 1,
-0.2041493, 0.5489735, -1.888236, 0, 1, 0.4078431, 1,
-0.2012062, 0.6034875, -0.8056472, 0, 1, 0.4117647, 1,
-0.1941769, -0.1062281, -1.258839, 0, 1, 0.4196078, 1,
-0.1886479, 0.1604914, -0.7157313, 0, 1, 0.4235294, 1,
-0.1872109, 1.725387, 0.9609253, 0, 1, 0.4313726, 1,
-0.1843557, 1.919254, 0.7270659, 0, 1, 0.4352941, 1,
-0.1842521, 0.4124321, -1.156547, 0, 1, 0.4431373, 1,
-0.1813518, 0.07630806, -2.309464, 0, 1, 0.4470588, 1,
-0.1803038, 1.284177, -0.7949578, 0, 1, 0.454902, 1,
-0.1798236, 0.1173488, -2.52039, 0, 1, 0.4588235, 1,
-0.1781131, -1.774442, -4.340058, 0, 1, 0.4666667, 1,
-0.1729212, 0.1514187, -2.129023, 0, 1, 0.4705882, 1,
-0.1693938, 2.158167, 0.07582975, 0, 1, 0.4784314, 1,
-0.1683246, 0.3355592, -0.7452304, 0, 1, 0.4823529, 1,
-0.1683043, 1.463435, -0.6910761, 0, 1, 0.4901961, 1,
-0.1631965, 0.1246725, 0.1061098, 0, 1, 0.4941176, 1,
-0.1615494, 0.4532796, -2.021592, 0, 1, 0.5019608, 1,
-0.1568983, -0.02254794, -2.715382, 0, 1, 0.509804, 1,
-0.1568967, 0.009478331, -2.871366, 0, 1, 0.5137255, 1,
-0.1558938, -0.6891736, -2.274245, 0, 1, 0.5215687, 1,
-0.1543314, -1.410124, -3.2778, 0, 1, 0.5254902, 1,
-0.1521179, -0.6206946, -1.968826, 0, 1, 0.5333334, 1,
-0.1511905, 0.4160002, 0.1439659, 0, 1, 0.5372549, 1,
-0.1509397, -0.8083869, -3.39851, 0, 1, 0.5450981, 1,
-0.1501311, 0.5503795, -0.4957885, 0, 1, 0.5490196, 1,
-0.1488015, -0.9281735, -2.473883, 0, 1, 0.5568628, 1,
-0.1483849, 0.978259, -1.976075, 0, 1, 0.5607843, 1,
-0.1478316, 0.1702482, -0.6437273, 0, 1, 0.5686275, 1,
-0.1447307, -1.48998, -5.023362, 0, 1, 0.572549, 1,
-0.1408153, 0.8207315, -0.1065649, 0, 1, 0.5803922, 1,
-0.1282575, 0.2436956, 0.6763843, 0, 1, 0.5843138, 1,
-0.1267062, -0.2149405, -1.159246, 0, 1, 0.5921569, 1,
-0.1250265, -1.481427, -2.750688, 0, 1, 0.5960785, 1,
-0.1232254, -0.1574477, -2.57668, 0, 1, 0.6039216, 1,
-0.119677, 0.600862, -0.795144, 0, 1, 0.6117647, 1,
-0.1184997, 0.8494588, -0.09402443, 0, 1, 0.6156863, 1,
-0.1180877, -1.251309, -3.524061, 0, 1, 0.6235294, 1,
-0.1166834, -0.09338538, -2.107195, 0, 1, 0.627451, 1,
-0.1161503, 1.61802, 0.204437, 0, 1, 0.6352941, 1,
-0.1111748, -0.1988756, -3.487857, 0, 1, 0.6392157, 1,
-0.1077539, 0.3561026, 0.9255323, 0, 1, 0.6470588, 1,
-0.1040987, -0.7127476, -3.683704, 0, 1, 0.6509804, 1,
-0.1038723, 0.347145, -0.1426677, 0, 1, 0.6588235, 1,
-0.1034909, -0.194296, -3.964152, 0, 1, 0.6627451, 1,
-0.0899813, 0.2019473, -0.4134525, 0, 1, 0.6705883, 1,
-0.08808664, -0.4031987, -2.119348, 0, 1, 0.6745098, 1,
-0.08749475, 1.336602, 0.0746419, 0, 1, 0.682353, 1,
-0.08493161, 0.5661505, 0.4578853, 0, 1, 0.6862745, 1,
-0.07914483, 1.28321, 1.288903, 0, 1, 0.6941177, 1,
-0.07823432, -0.9969586, -2.581098, 0, 1, 0.7019608, 1,
-0.07698993, 0.9188438, 0.08733148, 0, 1, 0.7058824, 1,
-0.07556711, 1.189579, 0.6514377, 0, 1, 0.7137255, 1,
-0.07538981, 0.9023378, 0.0004647472, 0, 1, 0.7176471, 1,
-0.07003676, -0.4049455, -2.809468, 0, 1, 0.7254902, 1,
-0.07003181, -1.238439, -2.442343, 0, 1, 0.7294118, 1,
-0.06983552, -0.5167453, -5.263227, 0, 1, 0.7372549, 1,
-0.06791408, -0.1878453, -4.017781, 0, 1, 0.7411765, 1,
-0.06740782, -1.367055, -3.509476, 0, 1, 0.7490196, 1,
-0.06663842, -0.1855855, -1.894767, 0, 1, 0.7529412, 1,
-0.06606235, -0.104554, -3.643022, 0, 1, 0.7607843, 1,
-0.06355397, 0.901452, -0.9110646, 0, 1, 0.7647059, 1,
-0.05863075, -0.6016545, -2.140092, 0, 1, 0.772549, 1,
-0.05734482, -1.442539, -2.700705, 0, 1, 0.7764706, 1,
-0.05699086, 0.6265242, -0.03297319, 0, 1, 0.7843137, 1,
-0.05439689, 0.4756436, -0.6641741, 0, 1, 0.7882353, 1,
-0.05297233, -0.6227966, -3.713825, 0, 1, 0.7960784, 1,
-0.05065052, 1.295032, 0.1791899, 0, 1, 0.8039216, 1,
-0.04556666, 0.3403267, -0.5995392, 0, 1, 0.8078431, 1,
-0.04470056, -0.4401231, -2.018431, 0, 1, 0.8156863, 1,
-0.04344592, 1.601038, 1.209044, 0, 1, 0.8196079, 1,
-0.0294142, -0.7361004, -4.389902, 0, 1, 0.827451, 1,
-0.02777427, 0.294553, 0.5163038, 0, 1, 0.8313726, 1,
-0.02739195, 0.6117841, 0.973263, 0, 1, 0.8392157, 1,
-0.02199816, 0.3539958, 1.72209, 0, 1, 0.8431373, 1,
-0.0198984, -0.6320139, -2.929171, 0, 1, 0.8509804, 1,
-0.01902364, 1.51464, 0.3577516, 0, 1, 0.854902, 1,
-0.01453009, -0.8818803, -2.938307, 0, 1, 0.8627451, 1,
-0.01226098, -0.07064925, -3.45703, 0, 1, 0.8666667, 1,
-0.01065371, 0.8799512, 0.07961661, 0, 1, 0.8745098, 1,
-0.005955766, -1.832, -4.467276, 0, 1, 0.8784314, 1,
-0.002962104, 0.691471, 0.2756318, 0, 1, 0.8862745, 1,
-0.0001366721, -0.7471265, -2.80209, 0, 1, 0.8901961, 1,
0.01049128, 0.09924124, 1.152989, 0, 1, 0.8980392, 1,
0.01332157, 0.796747, 2.345993, 0, 1, 0.9058824, 1,
0.01458743, -0.5183048, 1.789633, 0, 1, 0.9098039, 1,
0.01521914, 1.519102, -0.6643101, 0, 1, 0.9176471, 1,
0.02477904, 0.558016, 0.6539884, 0, 1, 0.9215686, 1,
0.02651525, -1.235125, 1.92076, 0, 1, 0.9294118, 1,
0.03097026, -0.7482749, 3.162748, 0, 1, 0.9333333, 1,
0.03724808, -0.5447097, 3.087308, 0, 1, 0.9411765, 1,
0.03915609, -0.3559631, 2.604355, 0, 1, 0.945098, 1,
0.04139637, -1.032504, 2.844997, 0, 1, 0.9529412, 1,
0.04518762, 0.3317332, 0.6329002, 0, 1, 0.9568627, 1,
0.04552718, 1.096669, -0.07920936, 0, 1, 0.9647059, 1,
0.04766539, -0.409912, 2.046928, 0, 1, 0.9686275, 1,
0.04795187, -0.1032791, 2.623903, 0, 1, 0.9764706, 1,
0.04898949, -0.8863855, 3.538381, 0, 1, 0.9803922, 1,
0.05135615, 0.4577594, 0.8328404, 0, 1, 0.9882353, 1,
0.05304693, -1.041307, 2.559713, 0, 1, 0.9921569, 1,
0.05369805, 0.7735271, -0.05918008, 0, 1, 1, 1,
0.05864749, -0.20189, 3.37377, 0, 0.9921569, 1, 1,
0.05925181, -1.707272, 2.812707, 0, 0.9882353, 1, 1,
0.06068122, -1.505124, 4.14756, 0, 0.9803922, 1, 1,
0.06122283, -0.9081288, 2.29706, 0, 0.9764706, 1, 1,
0.0649788, 0.07585201, 0.2855955, 0, 0.9686275, 1, 1,
0.0659197, 2.110527, 0.9319646, 0, 0.9647059, 1, 1,
0.06633843, 0.199055, 0.3804587, 0, 0.9568627, 1, 1,
0.06638227, -0.8608597, 4.14076, 0, 0.9529412, 1, 1,
0.06773953, -1.33867, 4.195962, 0, 0.945098, 1, 1,
0.06869264, 0.3428018, -2.209541, 0, 0.9411765, 1, 1,
0.07075991, -0.5846908, 2.137704, 0, 0.9333333, 1, 1,
0.07549483, 1.335706, 0.2553686, 0, 0.9294118, 1, 1,
0.07931512, 0.454429, -0.3015878, 0, 0.9215686, 1, 1,
0.08124187, 0.8056411, 0.4873825, 0, 0.9176471, 1, 1,
0.08280187, -0.1444179, 4.962008, 0, 0.9098039, 1, 1,
0.0844171, 0.4339058, 0.4035465, 0, 0.9058824, 1, 1,
0.08765118, 0.799826, 1.285058, 0, 0.8980392, 1, 1,
0.08776479, 0.1755746, 0.01078569, 0, 0.8901961, 1, 1,
0.09152989, -0.4774228, 2.638637, 0, 0.8862745, 1, 1,
0.09400375, 0.3955178, 1.335271, 0, 0.8784314, 1, 1,
0.09529303, -0.1965506, 0.8650296, 0, 0.8745098, 1, 1,
0.09972316, -2.591904, 1.23505, 0, 0.8666667, 1, 1,
0.1011271, 1.271972, 0.3269117, 0, 0.8627451, 1, 1,
0.1026718, 1.8773, -0.20296, 0, 0.854902, 1, 1,
0.1036731, -0.5539533, 2.70783, 0, 0.8509804, 1, 1,
0.1055017, 0.3850692, -0.00313291, 0, 0.8431373, 1, 1,
0.1065748, 2.984373, 1.882749, 0, 0.8392157, 1, 1,
0.1092846, 0.1207167, 0.1312406, 0, 0.8313726, 1, 1,
0.1119057, 0.8586918, 0.3659684, 0, 0.827451, 1, 1,
0.112322, -1.871162, 3.145568, 0, 0.8196079, 1, 1,
0.1146726, 1.00656, -0.6930373, 0, 0.8156863, 1, 1,
0.1158314, 0.8662814, 1.663998, 0, 0.8078431, 1, 1,
0.1164697, 0.07283455, 2.035668, 0, 0.8039216, 1, 1,
0.1186366, -0.6707947, 3.93081, 0, 0.7960784, 1, 1,
0.1253884, -0.6137042, 2.212015, 0, 0.7882353, 1, 1,
0.1261661, -1.497321, 2.359774, 0, 0.7843137, 1, 1,
0.1276407, 0.5446928, 0.02915916, 0, 0.7764706, 1, 1,
0.1298002, -1.23694, 3.030879, 0, 0.772549, 1, 1,
0.1310509, 0.7978649, -0.2234259, 0, 0.7647059, 1, 1,
0.1316722, -0.8515989, 2.361805, 0, 0.7607843, 1, 1,
0.1362213, 0.6981773, -1.282805, 0, 0.7529412, 1, 1,
0.1382177, 0.153552, 1.611612, 0, 0.7490196, 1, 1,
0.14219, -0.3576833, 4.255957, 0, 0.7411765, 1, 1,
0.1433194, 1.385757, 0.2112502, 0, 0.7372549, 1, 1,
0.1434419, -1.609686, 2.87898, 0, 0.7294118, 1, 1,
0.1446146, -0.1722548, 4.28945, 0, 0.7254902, 1, 1,
0.1467189, 0.0503614, 0.8045274, 0, 0.7176471, 1, 1,
0.1480176, 0.7031624, 1.200578, 0, 0.7137255, 1, 1,
0.1496369, 2.012706, 0.4617804, 0, 0.7058824, 1, 1,
0.1512211, 2.094571, -1.281796, 0, 0.6980392, 1, 1,
0.1523957, 0.440276, -0.001635989, 0, 0.6941177, 1, 1,
0.1533432, 0.1172012, 0.820534, 0, 0.6862745, 1, 1,
0.1621776, -0.1357831, 2.829721, 0, 0.682353, 1, 1,
0.1630265, -0.6557173, 4.436456, 0, 0.6745098, 1, 1,
0.1642992, 0.2140335, 2.997249, 0, 0.6705883, 1, 1,
0.1644935, -0.835519, 3.950638, 0, 0.6627451, 1, 1,
0.165053, 0.118696, 1.396516, 0, 0.6588235, 1, 1,
0.1653883, 1.616904, 0.1332686, 0, 0.6509804, 1, 1,
0.1719223, 0.3720096, 1.759024, 0, 0.6470588, 1, 1,
0.1732396, -0.01201426, 2.340654, 0, 0.6392157, 1, 1,
0.1754729, -0.02438811, -0.08258471, 0, 0.6352941, 1, 1,
0.1759611, -0.007683694, 0.4523854, 0, 0.627451, 1, 1,
0.1774306, -0.9037771, 2.8163, 0, 0.6235294, 1, 1,
0.1787129, 0.2591495, 1.378918, 0, 0.6156863, 1, 1,
0.1797273, 0.8405735, -0.3817193, 0, 0.6117647, 1, 1,
0.1810586, -0.248491, 3.209236, 0, 0.6039216, 1, 1,
0.1816714, -0.7063742, 3.062245, 0, 0.5960785, 1, 1,
0.190087, -0.500995, 2.809578, 0, 0.5921569, 1, 1,
0.1924843, 0.4004913, -0.09612102, 0, 0.5843138, 1, 1,
0.1932082, 0.4312431, 1.761845, 0, 0.5803922, 1, 1,
0.1949878, -1.121096, 3.560005, 0, 0.572549, 1, 1,
0.1980096, -1.36593, 3.082635, 0, 0.5686275, 1, 1,
0.2002535, -0.6434049, 3.06537, 0, 0.5607843, 1, 1,
0.2116314, -3.320426, 4.048965, 0, 0.5568628, 1, 1,
0.2129867, 0.1537195, 0.305016, 0, 0.5490196, 1, 1,
0.2153413, -1.436052, 4.110286, 0, 0.5450981, 1, 1,
0.2167589, 0.9823776, 0.04688654, 0, 0.5372549, 1, 1,
0.2197259, -0.6530036, 3.884714, 0, 0.5333334, 1, 1,
0.221216, 1.328203, 0.06042999, 0, 0.5254902, 1, 1,
0.2230269, 0.3480009, 0.04804403, 0, 0.5215687, 1, 1,
0.225786, 0.4667488, -0.3078247, 0, 0.5137255, 1, 1,
0.228565, 0.1043242, 2.347066, 0, 0.509804, 1, 1,
0.2287167, 0.5896808, -0.4264854, 0, 0.5019608, 1, 1,
0.2288284, 0.5017658, 1.077113, 0, 0.4941176, 1, 1,
0.2370786, 0.5638144, -0.2745328, 0, 0.4901961, 1, 1,
0.2396587, 1.315065, 0.6977857, 0, 0.4823529, 1, 1,
0.2412666, 1.679517, -0.3384348, 0, 0.4784314, 1, 1,
0.2443632, -0.1974243, 1.542236, 0, 0.4705882, 1, 1,
0.2452822, 0.2102649, 1.211897, 0, 0.4666667, 1, 1,
0.2475739, 0.7071909, 0.2334674, 0, 0.4588235, 1, 1,
0.2547837, -1.043536, 4.940216, 0, 0.454902, 1, 1,
0.2579892, 1.995717, 1.489121, 0, 0.4470588, 1, 1,
0.2584293, -0.374637, 3.722043, 0, 0.4431373, 1, 1,
0.2594893, 0.148671, 1.151885, 0, 0.4352941, 1, 1,
0.2598056, -0.3037648, 2.524907, 0, 0.4313726, 1, 1,
0.259844, 0.5191378, -0.2975484, 0, 0.4235294, 1, 1,
0.261461, 1.062489, -0.2129625, 0, 0.4196078, 1, 1,
0.2617574, 0.8705779, -1.050478, 0, 0.4117647, 1, 1,
0.2635127, -1.352786, 3.822445, 0, 0.4078431, 1, 1,
0.2636434, -0.4088454, 1.880352, 0, 0.4, 1, 1,
0.2662934, 0.2554515, 1.715141, 0, 0.3921569, 1, 1,
0.2677453, 0.3568675, 2.12275, 0, 0.3882353, 1, 1,
0.2718058, -1.086555, 1.600509, 0, 0.3803922, 1, 1,
0.2737024, -0.2162886, 3.418427, 0, 0.3764706, 1, 1,
0.2754422, 0.6125203, 0.3486911, 0, 0.3686275, 1, 1,
0.2754511, -0.1502376, 1.485623, 0, 0.3647059, 1, 1,
0.2755816, -0.5414571, 1.99755, 0, 0.3568628, 1, 1,
0.2767774, -1.173745, 2.286423, 0, 0.3529412, 1, 1,
0.277919, -0.1880956, 2.952764, 0, 0.345098, 1, 1,
0.2786753, -0.4376773, 2.445998, 0, 0.3411765, 1, 1,
0.2788547, 0.01938685, 2.092293, 0, 0.3333333, 1, 1,
0.2811909, -0.4787378, 1.528285, 0, 0.3294118, 1, 1,
0.2842022, 0.8631948, -1.410659, 0, 0.3215686, 1, 1,
0.2872925, 0.611533, -0.3735838, 0, 0.3176471, 1, 1,
0.2876879, -0.8320426, 3.061179, 0, 0.3098039, 1, 1,
0.2972882, -0.4046963, 1.994013, 0, 0.3058824, 1, 1,
0.2990543, 0.5890394, 0.7079564, 0, 0.2980392, 1, 1,
0.3004054, 1.538676, -0.1043732, 0, 0.2901961, 1, 1,
0.309264, -1.565965, 3.664673, 0, 0.2862745, 1, 1,
0.3148055, 2.597985, -1.607366, 0, 0.2784314, 1, 1,
0.3159922, -0.8425688, 2.966726, 0, 0.2745098, 1, 1,
0.3177712, 0.5935081, 2.034142, 0, 0.2666667, 1, 1,
0.3180018, -0.9364811, 2.938772, 0, 0.2627451, 1, 1,
0.3253817, -0.2628103, 3.718553, 0, 0.254902, 1, 1,
0.3271534, 0.1522568, 1.383725, 0, 0.2509804, 1, 1,
0.3280441, -0.7733347, 1.927073, 0, 0.2431373, 1, 1,
0.328966, -0.4566816, 2.43233, 0, 0.2392157, 1, 1,
0.3295517, 1.294793, 1.317188, 0, 0.2313726, 1, 1,
0.3296981, 1.564482, 1.080077, 0, 0.227451, 1, 1,
0.3324483, -1.631249, 3.170951, 0, 0.2196078, 1, 1,
0.3326678, -0.941328, 1.768324, 0, 0.2156863, 1, 1,
0.3329647, 0.6966242, -0.4977051, 0, 0.2078431, 1, 1,
0.3336121, -0.1630345, 1.208243, 0, 0.2039216, 1, 1,
0.3340963, -0.431648, 1.665109, 0, 0.1960784, 1, 1,
0.3411659, -0.7283075, 1.365476, 0, 0.1882353, 1, 1,
0.3417943, 0.2544089, 0.5401353, 0, 0.1843137, 1, 1,
0.3447996, 0.4055552, 2.90846, 0, 0.1764706, 1, 1,
0.3476507, 2.192396, 1.470886, 0, 0.172549, 1, 1,
0.3499877, 1.449457, -0.4253106, 0, 0.1647059, 1, 1,
0.3505235, -0.1835862, 1.651867, 0, 0.1607843, 1, 1,
0.3516404, 1.002525, -0.8254981, 0, 0.1529412, 1, 1,
0.3534444, 1.261238, 1.985576, 0, 0.1490196, 1, 1,
0.3590986, -1.565116, 2.74686, 0, 0.1411765, 1, 1,
0.3602261, -1.275638, 4.051174, 0, 0.1372549, 1, 1,
0.3607952, -0.9132776, 3.490082, 0, 0.1294118, 1, 1,
0.3608786, -1.157529, 2.749387, 0, 0.1254902, 1, 1,
0.3736494, 0.07837941, 1.842903, 0, 0.1176471, 1, 1,
0.3809754, -0.8311657, 3.653118, 0, 0.1137255, 1, 1,
0.3877069, -0.7567725, 2.062396, 0, 0.1058824, 1, 1,
0.388543, -0.5078171, 1.307117, 0, 0.09803922, 1, 1,
0.38939, 0.7904866, -0.4677482, 0, 0.09411765, 1, 1,
0.3894502, 1.062489, -0.1273121, 0, 0.08627451, 1, 1,
0.3898891, 1.367181, -1.425122, 0, 0.08235294, 1, 1,
0.3955619, -0.5606368, 2.557581, 0, 0.07450981, 1, 1,
0.3968549, -0.5225325, 1.749171, 0, 0.07058824, 1, 1,
0.3985745, 1.283603, 0.5330568, 0, 0.0627451, 1, 1,
0.4007438, 0.1673342, 0.5836606, 0, 0.05882353, 1, 1,
0.402348, 0.4594958, 1.691734, 0, 0.05098039, 1, 1,
0.4054767, 0.4026932, 0.1137677, 0, 0.04705882, 1, 1,
0.4085986, 0.35762, 1.785477, 0, 0.03921569, 1, 1,
0.4109449, 0.04069976, 1.506188, 0, 0.03529412, 1, 1,
0.4152586, -0.06570269, 0.2348962, 0, 0.02745098, 1, 1,
0.4190525, -1.228154, 2.286058, 0, 0.02352941, 1, 1,
0.4205017, -0.1989522, 2.975679, 0, 0.01568628, 1, 1,
0.4250081, -0.6004044, 2.746476, 0, 0.01176471, 1, 1,
0.4288727, -1.70842, 3.718391, 0, 0.003921569, 1, 1,
0.4305575, -0.521188, 3.936389, 0.003921569, 0, 1, 1,
0.4313374, -0.1609288, 2.507693, 0.007843138, 0, 1, 1,
0.4331214, 0.5003937, 1.211224, 0.01568628, 0, 1, 1,
0.437806, -0.2749108, 3.069054, 0.01960784, 0, 1, 1,
0.4383407, -0.006164335, 2.418614, 0.02745098, 0, 1, 1,
0.4428412, -1.212132, 2.676606, 0.03137255, 0, 1, 1,
0.4450233, 0.672106, -1.103842, 0.03921569, 0, 1, 1,
0.4450525, -1.473224, 3.065705, 0.04313726, 0, 1, 1,
0.4482985, 0.7906494, 1.297159, 0.05098039, 0, 1, 1,
0.4514502, 0.9951608, -0.191561, 0.05490196, 0, 1, 1,
0.4546834, 1.640046, 1.221086, 0.0627451, 0, 1, 1,
0.4567011, -0.2113989, 2.815058, 0.06666667, 0, 1, 1,
0.4610271, -0.5647925, 1.86137, 0.07450981, 0, 1, 1,
0.4633113, 0.4995128, 0.9980835, 0.07843138, 0, 1, 1,
0.4633925, -0.2799808, 4.355718, 0.08627451, 0, 1, 1,
0.4636838, -0.1737781, 2.261049, 0.09019608, 0, 1, 1,
0.4642779, 1.448302, -0.4663579, 0.09803922, 0, 1, 1,
0.4645976, 1.045666, 0.3881327, 0.1058824, 0, 1, 1,
0.4672762, 0.02232669, 1.281562, 0.1098039, 0, 1, 1,
0.4687151, -1.44198, 3.440905, 0.1176471, 0, 1, 1,
0.4700415, -0.2268959, 1.478392, 0.1215686, 0, 1, 1,
0.4701167, -0.6626608, 3.564532, 0.1294118, 0, 1, 1,
0.4702404, 1.300593, 0.7734472, 0.1333333, 0, 1, 1,
0.472315, 1.325301, 0.2514194, 0.1411765, 0, 1, 1,
0.4727951, 2.754434, 0.1068289, 0.145098, 0, 1, 1,
0.4739206, 1.485898, -0.4208398, 0.1529412, 0, 1, 1,
0.4766117, -0.3399973, 1.711945, 0.1568628, 0, 1, 1,
0.4782907, -1.255881, 1.869335, 0.1647059, 0, 1, 1,
0.4874393, 0.6969627, -0.0734455, 0.1686275, 0, 1, 1,
0.4963152, 1.189599, 1.692379, 0.1764706, 0, 1, 1,
0.4969847, 0.4259458, 0.7844111, 0.1803922, 0, 1, 1,
0.4970826, -0.6509627, 2.37342, 0.1882353, 0, 1, 1,
0.499514, -0.7634228, 3.58537, 0.1921569, 0, 1, 1,
0.5021577, 1.022305, 1.018277, 0.2, 0, 1, 1,
0.5053133, 0.4748149, -0.6205625, 0.2078431, 0, 1, 1,
0.5070938, -0.3490312, 0.7499833, 0.2117647, 0, 1, 1,
0.5090122, 0.7721435, -0.3338532, 0.2196078, 0, 1, 1,
0.5134923, 2.592749, 0.6737611, 0.2235294, 0, 1, 1,
0.5151004, 0.8002189, 0.4670974, 0.2313726, 0, 1, 1,
0.5208886, -1.293653, 2.551427, 0.2352941, 0, 1, 1,
0.522585, 0.4858763, -1.116551, 0.2431373, 0, 1, 1,
0.5248256, -0.1968043, 1.983454, 0.2470588, 0, 1, 1,
0.52511, 1.038559, 0.4904009, 0.254902, 0, 1, 1,
0.5323275, 0.1723838, 2.343943, 0.2588235, 0, 1, 1,
0.5355912, -0.9846214, 2.42256, 0.2666667, 0, 1, 1,
0.5356844, -0.2502153, 2.514411, 0.2705882, 0, 1, 1,
0.5366064, 1.910464, -0.07353271, 0.2784314, 0, 1, 1,
0.5375761, -1.749424, 2.200371, 0.282353, 0, 1, 1,
0.5379808, -0.9681908, 3.295051, 0.2901961, 0, 1, 1,
0.5478113, 1.277939, 2.263695, 0.2941177, 0, 1, 1,
0.5497209, -0.5066302, 1.896864, 0.3019608, 0, 1, 1,
0.551597, -0.7140403, 3.132906, 0.3098039, 0, 1, 1,
0.5602449, -2.221363, 2.260286, 0.3137255, 0, 1, 1,
0.5762845, -1.955302, 2.770291, 0.3215686, 0, 1, 1,
0.5770808, 0.2366496, 1.128412, 0.3254902, 0, 1, 1,
0.579216, 1.744853, 1.167898, 0.3333333, 0, 1, 1,
0.5830155, -0.5632204, 3.063229, 0.3372549, 0, 1, 1,
0.5846355, 0.4704129, 1.787592, 0.345098, 0, 1, 1,
0.5847706, 1.317863, 0.3206177, 0.3490196, 0, 1, 1,
0.5868902, -0.4926419, 1.789165, 0.3568628, 0, 1, 1,
0.5917532, 0.5911392, -1.597744, 0.3607843, 0, 1, 1,
0.5922509, 0.6480965, 0.1559794, 0.3686275, 0, 1, 1,
0.5975829, 1.476213, 0.4877039, 0.372549, 0, 1, 1,
0.5990775, 0.6805092, 0.9295542, 0.3803922, 0, 1, 1,
0.5995668, -1.53951, 3.672936, 0.3843137, 0, 1, 1,
0.6022349, -1.110469, 1.970282, 0.3921569, 0, 1, 1,
0.6024164, -0.970938, 2.782667, 0.3960784, 0, 1, 1,
0.6103567, 0.3387012, 1.386192, 0.4039216, 0, 1, 1,
0.6113734, 0.7025124, -0.5644705, 0.4117647, 0, 1, 1,
0.6150017, 0.04690795, 2.324439, 0.4156863, 0, 1, 1,
0.6153454, -0.4088944, 2.253434, 0.4235294, 0, 1, 1,
0.6253824, -0.8449282, 2.519537, 0.427451, 0, 1, 1,
0.6327155, 0.4140974, 0.4438127, 0.4352941, 0, 1, 1,
0.6379344, 1.236073, -0.7526925, 0.4392157, 0, 1, 1,
0.640078, -0.05775786, 1.614816, 0.4470588, 0, 1, 1,
0.643756, 0.7030788, 2.035462, 0.4509804, 0, 1, 1,
0.64575, 1.439421, 0.09427155, 0.4588235, 0, 1, 1,
0.6459967, 0.01848197, 0.7230636, 0.4627451, 0, 1, 1,
0.6602097, 1.485362, 1.928115, 0.4705882, 0, 1, 1,
0.6647021, 1.293819, 0.8154013, 0.4745098, 0, 1, 1,
0.6704568, 1.815901, -0.02856223, 0.4823529, 0, 1, 1,
0.671609, 0.04111883, 2.930864, 0.4862745, 0, 1, 1,
0.6739978, -0.3262475, 2.807135, 0.4941176, 0, 1, 1,
0.674538, 0.4881114, -0.8997494, 0.5019608, 0, 1, 1,
0.6826374, 0.3209497, -0.7364679, 0.5058824, 0, 1, 1,
0.6846907, -1.523667, 2.621731, 0.5137255, 0, 1, 1,
0.6886413, 1.201266, 0.16632, 0.5176471, 0, 1, 1,
0.6903313, 0.3661369, 2.056757, 0.5254902, 0, 1, 1,
0.696463, 0.6679429, 1.769984, 0.5294118, 0, 1, 1,
0.6977044, 0.9630175, 0.8420793, 0.5372549, 0, 1, 1,
0.708919, 2.672236, -1.348554, 0.5411765, 0, 1, 1,
0.7100581, -1.119272, 2.709341, 0.5490196, 0, 1, 1,
0.7110472, -0.8483595, 1.089512, 0.5529412, 0, 1, 1,
0.7158673, -0.4138321, 1.339789, 0.5607843, 0, 1, 1,
0.7219567, 0.8160429, 1.113789, 0.5647059, 0, 1, 1,
0.7243344, 0.1160079, 1.67215, 0.572549, 0, 1, 1,
0.7256435, -0.9733896, 0.2660448, 0.5764706, 0, 1, 1,
0.7266313, 0.86388, 0.8560081, 0.5843138, 0, 1, 1,
0.7328598, 0.1612029, 1.592959, 0.5882353, 0, 1, 1,
0.7333475, 0.9805617, -0.8408052, 0.5960785, 0, 1, 1,
0.7380491, -1.670332, 2.501258, 0.6039216, 0, 1, 1,
0.7411581, -0.730211, 1.332931, 0.6078432, 0, 1, 1,
0.7479896, -2.30496, 5.253008, 0.6156863, 0, 1, 1,
0.7503591, 1.401624, 1.254662, 0.6196079, 0, 1, 1,
0.7527757, -2.035393, 3.434853, 0.627451, 0, 1, 1,
0.7554675, -1.188019, 1.44568, 0.6313726, 0, 1, 1,
0.7571505, 0.2237247, 0.7970474, 0.6392157, 0, 1, 1,
0.760534, 1.172919, 0.928593, 0.6431373, 0, 1, 1,
0.7617629, 0.141682, 3.737119, 0.6509804, 0, 1, 1,
0.7724479, 1.625439, 0.3645391, 0.654902, 0, 1, 1,
0.7763417, 1.335224, 1.676856, 0.6627451, 0, 1, 1,
0.7790677, 0.9992591, 0.6710395, 0.6666667, 0, 1, 1,
0.7908024, -1.105247, 4.71484, 0.6745098, 0, 1, 1,
0.7955547, -0.3558477, 1.56392, 0.6784314, 0, 1, 1,
0.7963002, 0.09875275, 2.435957, 0.6862745, 0, 1, 1,
0.8012339, -1.106177, 0.523856, 0.6901961, 0, 1, 1,
0.8021187, -0.3588431, 4.365162, 0.6980392, 0, 1, 1,
0.8048028, 0.7135189, 1.362139, 0.7058824, 0, 1, 1,
0.812182, -1.382149, 2.112929, 0.7098039, 0, 1, 1,
0.8150726, 0.2698393, 2.430584, 0.7176471, 0, 1, 1,
0.8156367, 1.324846, 0.8315325, 0.7215686, 0, 1, 1,
0.8176575, -0.7054321, 3.336025, 0.7294118, 0, 1, 1,
0.8236148, -0.3071888, 0.5278986, 0.7333333, 0, 1, 1,
0.8280929, -0.009955019, 2.136097, 0.7411765, 0, 1, 1,
0.8320745, -1.305991, 2.641638, 0.7450981, 0, 1, 1,
0.8382025, -0.02547179, 1.886043, 0.7529412, 0, 1, 1,
0.8383194, -0.3985612, 2.450743, 0.7568628, 0, 1, 1,
0.8397089, 1.631914, 0.550263, 0.7647059, 0, 1, 1,
0.8437337, 0.8067222, 2.015796, 0.7686275, 0, 1, 1,
0.8440567, 0.4901679, -1.415808, 0.7764706, 0, 1, 1,
0.8452964, 0.6554454, 1.506207, 0.7803922, 0, 1, 1,
0.8509087, 2.770821, 1.69118, 0.7882353, 0, 1, 1,
0.8541616, -0.08825582, 2.940615, 0.7921569, 0, 1, 1,
0.8566186, -0.1968841, 1.272155, 0.8, 0, 1, 1,
0.8567224, -0.1835234, 2.863301, 0.8078431, 0, 1, 1,
0.8578993, -1.374326, 0.7535582, 0.8117647, 0, 1, 1,
0.8617068, 0.9657078, 0.5236456, 0.8196079, 0, 1, 1,
0.8618439, -0.688768, 2.418011, 0.8235294, 0, 1, 1,
0.8687906, 1.795019, 1.030505, 0.8313726, 0, 1, 1,
0.8864704, 0.9861508, 1.267221, 0.8352941, 0, 1, 1,
0.8866455, 2.300371, 0.4064088, 0.8431373, 0, 1, 1,
0.8874062, 0.186643, 2.07728, 0.8470588, 0, 1, 1,
0.8877742, 1.27597, 0.2650321, 0.854902, 0, 1, 1,
0.8904963, -1.453075, 2.39563, 0.8588235, 0, 1, 1,
0.8966658, 2.352915, 2.844417, 0.8666667, 0, 1, 1,
0.9006544, -1.460387, 1.148268, 0.8705882, 0, 1, 1,
0.9025329, -0.7520314, 1.391843, 0.8784314, 0, 1, 1,
0.9118198, 1.179786, -1.793229, 0.8823529, 0, 1, 1,
0.9132987, -1.509859, 4.669638, 0.8901961, 0, 1, 1,
0.9229921, 0.818355, 1.344936, 0.8941177, 0, 1, 1,
0.9245769, -0.6111784, 2.134329, 0.9019608, 0, 1, 1,
0.9253874, -0.1837098, 2.149149, 0.9098039, 0, 1, 1,
0.9254724, 0.7837571, -0.2983791, 0.9137255, 0, 1, 1,
0.9274755, -0.1647346, 2.767054, 0.9215686, 0, 1, 1,
0.9294958, 0.4201182, 1.65717, 0.9254902, 0, 1, 1,
0.9362538, -0.6722518, 2.459099, 0.9333333, 0, 1, 1,
0.9363843, 1.054214, 2.456556, 0.9372549, 0, 1, 1,
0.9480363, -1.529259, 3.233534, 0.945098, 0, 1, 1,
0.9498721, 1.186607, 0.9478095, 0.9490196, 0, 1, 1,
0.9674066, 1.005899, -0.1222012, 0.9568627, 0, 1, 1,
0.9688424, 0.6677014, 1.097824, 0.9607843, 0, 1, 1,
0.970652, 0.6735224, 0.5943278, 0.9686275, 0, 1, 1,
0.9715163, 0.2052575, 2.283076, 0.972549, 0, 1, 1,
0.9726651, 1.796593, 1.346396, 0.9803922, 0, 1, 1,
0.9729941, -0.09683476, 1.018734, 0.9843137, 0, 1, 1,
0.9732829, 0.2060331, 0.9119387, 0.9921569, 0, 1, 1,
0.9843109, 0.5729713, 0.1220517, 0.9960784, 0, 1, 1,
0.9901131, -0.569338, 2.825503, 1, 0, 0.9960784, 1,
0.9948343, 0.8787209, 0.04171091, 1, 0, 0.9882353, 1,
0.9962791, -0.3443159, 2.651269, 1, 0, 0.9843137, 1,
1.009313, -2.20688, 2.878305, 1, 0, 0.9764706, 1,
1.011965, 0.7413085, 0.6491171, 1, 0, 0.972549, 1,
1.012823, -0.6588103, 3.151272, 1, 0, 0.9647059, 1,
1.01598, -0.1291473, 0.564758, 1, 0, 0.9607843, 1,
1.030768, 1.472757, 0.1808429, 1, 0, 0.9529412, 1,
1.033096, -1.257813, 2.244016, 1, 0, 0.9490196, 1,
1.043206, 1.436316, 0.898912, 1, 0, 0.9411765, 1,
1.046175, -0.8461111, 3.14432, 1, 0, 0.9372549, 1,
1.048413, 2.111475, -0.4212102, 1, 0, 0.9294118, 1,
1.052331, 0.4801679, 1.158891, 1, 0, 0.9254902, 1,
1.092265, -0.01972357, 1.383496, 1, 0, 0.9176471, 1,
1.093211, -0.7976419, 1.935884, 1, 0, 0.9137255, 1,
1.102012, 0.6194165, 0.934082, 1, 0, 0.9058824, 1,
1.109164, -1.199224, 3.876587, 1, 0, 0.9019608, 1,
1.109649, -0.085954, 2.010875, 1, 0, 0.8941177, 1,
1.1119, -0.4719316, 1.832309, 1, 0, 0.8862745, 1,
1.119037, 1.327587, 0.5150937, 1, 0, 0.8823529, 1,
1.119678, 1.099226, 1.554957, 1, 0, 0.8745098, 1,
1.121913, 0.288959, 2.986243, 1, 0, 0.8705882, 1,
1.127623, 0.4265321, 2.487542, 1, 0, 0.8627451, 1,
1.132308, -0.3669857, 2.012757, 1, 0, 0.8588235, 1,
1.144044, 0.1321182, 2.61571, 1, 0, 0.8509804, 1,
1.149498, 1.273956, 2.496703, 1, 0, 0.8470588, 1,
1.152429, -0.92118, 2.950963, 1, 0, 0.8392157, 1,
1.152494, 0.04698887, 3.342771, 1, 0, 0.8352941, 1,
1.165604, -0.8427016, 3.626879, 1, 0, 0.827451, 1,
1.167083, -0.669478, 2.498818, 1, 0, 0.8235294, 1,
1.171416, 1.274627, 0.7383657, 1, 0, 0.8156863, 1,
1.172132, 1.092008, -1.879467, 1, 0, 0.8117647, 1,
1.184464, -0.6171072, 2.302264, 1, 0, 0.8039216, 1,
1.187402, 0.9142693, 0.3500626, 1, 0, 0.7960784, 1,
1.188316, 2.29954, 0.9624033, 1, 0, 0.7921569, 1,
1.19123, 0.4066025, 1.919882, 1, 0, 0.7843137, 1,
1.192854, 2.654824, 0.04522489, 1, 0, 0.7803922, 1,
1.203987, -1.476891, 0.9942336, 1, 0, 0.772549, 1,
1.205068, 0.3416651, 1.29408, 1, 0, 0.7686275, 1,
1.208192, -1.209286, 0.8573783, 1, 0, 0.7607843, 1,
1.231815, -2.710441, 2.415177, 1, 0, 0.7568628, 1,
1.240109, 0.7958171, 0.4008858, 1, 0, 0.7490196, 1,
1.242949, -0.2914012, 1.642996, 1, 0, 0.7450981, 1,
1.249063, -0.5949987, 1.838787, 1, 0, 0.7372549, 1,
1.254828, 1.44207, 0.7230113, 1, 0, 0.7333333, 1,
1.259492, -1.78608, 4.914732, 1, 0, 0.7254902, 1,
1.261896, -0.04374605, 1.283811, 1, 0, 0.7215686, 1,
1.261938, 0.1664574, 1.886445, 1, 0, 0.7137255, 1,
1.264806, 0.3334731, 0.03908086, 1, 0, 0.7098039, 1,
1.268888, -1.433789, 1.372849, 1, 0, 0.7019608, 1,
1.27097, -0.3952093, 2.680573, 1, 0, 0.6941177, 1,
1.271196, 0.1231454, 1.872159, 1, 0, 0.6901961, 1,
1.283844, -1.473659, 1.522061, 1, 0, 0.682353, 1,
1.2872, -1.975281, 3.344581, 1, 0, 0.6784314, 1,
1.287406, 0.1146638, 3.085721, 1, 0, 0.6705883, 1,
1.287515, -0.6228596, -0.09978849, 1, 0, 0.6666667, 1,
1.291959, -1.495736, 2.943524, 1, 0, 0.6588235, 1,
1.295869, -1.57059, 1.847468, 1, 0, 0.654902, 1,
1.314894, 0.8434991, 1.115457, 1, 0, 0.6470588, 1,
1.31764, 0.01961939, 1.108196, 1, 0, 0.6431373, 1,
1.324393, -0.7857922, 0.815282, 1, 0, 0.6352941, 1,
1.326224, 0.5070369, 1.286524, 1, 0, 0.6313726, 1,
1.33077, -0.2506173, 1.543906, 1, 0, 0.6235294, 1,
1.332038, -0.06445443, -0.4362369, 1, 0, 0.6196079, 1,
1.346304, 1.16063, -0.1227268, 1, 0, 0.6117647, 1,
1.349402, -2.100451, 1.424506, 1, 0, 0.6078432, 1,
1.349614, -0.7190571, 2.180374, 1, 0, 0.6, 1,
1.350031, 1.302239, 1.111249, 1, 0, 0.5921569, 1,
1.352462, -0.4067817, 2.333632, 1, 0, 0.5882353, 1,
1.356843, -0.7114359, 1.215734, 1, 0, 0.5803922, 1,
1.358856, -0.03545304, 2.671168, 1, 0, 0.5764706, 1,
1.369444, 0.1385992, 0.3270268, 1, 0, 0.5686275, 1,
1.376673, 0.381115, 0.1421883, 1, 0, 0.5647059, 1,
1.377291, 3.619467, 0.1480206, 1, 0, 0.5568628, 1,
1.37915, -0.08588531, 1.59227, 1, 0, 0.5529412, 1,
1.381815, -0.05642533, 1.426157, 1, 0, 0.5450981, 1,
1.382194, -0.6928959, 3.496382, 1, 0, 0.5411765, 1,
1.383505, -1.254473, 1.758134, 1, 0, 0.5333334, 1,
1.386311, 0.6798393, 0.2836882, 1, 0, 0.5294118, 1,
1.386389, 0.5870605, 0.2624075, 1, 0, 0.5215687, 1,
1.389614, -1.087103, 3.086808, 1, 0, 0.5176471, 1,
1.390892, -1.205252, 2.3165, 1, 0, 0.509804, 1,
1.395916, -1.215932, 3.561518, 1, 0, 0.5058824, 1,
1.400142, 0.08409511, 0.7928444, 1, 0, 0.4980392, 1,
1.40095, -1.307015, 2.352057, 1, 0, 0.4901961, 1,
1.408318, 1.819526, 1.483475, 1, 0, 0.4862745, 1,
1.417109, -0.6641838, 3.178492, 1, 0, 0.4784314, 1,
1.42115, -1.349007, 3.230096, 1, 0, 0.4745098, 1,
1.429054, 0.09476665, 2.511922, 1, 0, 0.4666667, 1,
1.432716, 0.6882795, 1.029767, 1, 0, 0.4627451, 1,
1.432999, -1.418281, 2.573024, 1, 0, 0.454902, 1,
1.436365, 0.4844465, 2.292214, 1, 0, 0.4509804, 1,
1.445456, -0.2696378, 0.2805682, 1, 0, 0.4431373, 1,
1.450864, -0.191576, 1.634906, 1, 0, 0.4392157, 1,
1.453221, 0.3873407, 0.6541623, 1, 0, 0.4313726, 1,
1.460248, -0.5384406, 3.363106, 1, 0, 0.427451, 1,
1.46082, -0.4065513, 1.039111, 1, 0, 0.4196078, 1,
1.464007, 1.110455, 1.540816, 1, 0, 0.4156863, 1,
1.479971, -0.1979723, 2.00367, 1, 0, 0.4078431, 1,
1.481259, -0.1005121, 2.48865, 1, 0, 0.4039216, 1,
1.492823, -0.4691777, 2.200112, 1, 0, 0.3960784, 1,
1.498703, -1.450942, 1.70606, 1, 0, 0.3882353, 1,
1.527464, 0.1571124, 1.195816, 1, 0, 0.3843137, 1,
1.529188, 1.650894, 0.9597877, 1, 0, 0.3764706, 1,
1.532617, 0.9366897, 0.4344858, 1, 0, 0.372549, 1,
1.575985, -1.633904, 1.863778, 1, 0, 0.3647059, 1,
1.577462, -1.126874, 2.625116, 1, 0, 0.3607843, 1,
1.588276, -0.9624341, 2.62271, 1, 0, 0.3529412, 1,
1.62117, -0.2542807, 3.017004, 1, 0, 0.3490196, 1,
1.621978, -1.311475, 2.473026, 1, 0, 0.3411765, 1,
1.63254, 1.625961, 0.7905117, 1, 0, 0.3372549, 1,
1.635272, -0.8854145, 2.834849, 1, 0, 0.3294118, 1,
1.651712, -0.1712499, 3.349487, 1, 0, 0.3254902, 1,
1.655752, 1.612985, 1.343258, 1, 0, 0.3176471, 1,
1.668145, -0.8164265, 0.5141435, 1, 0, 0.3137255, 1,
1.670285, 0.4682001, 1.103104, 1, 0, 0.3058824, 1,
1.682027, -1.063293, 1.960591, 1, 0, 0.2980392, 1,
1.727305, -0.09509993, 0.937578, 1, 0, 0.2941177, 1,
1.730179, 1.067041, 1.322877, 1, 0, 0.2862745, 1,
1.758635, 0.6081261, 2.13547, 1, 0, 0.282353, 1,
1.763605, -0.7236819, 1.736728, 1, 0, 0.2745098, 1,
1.774374, 0.7743862, 0.242676, 1, 0, 0.2705882, 1,
1.785115, 0.8521115, 1.615346, 1, 0, 0.2627451, 1,
1.792444, 0.1602756, 1.010194, 1, 0, 0.2588235, 1,
1.801097, -1.280867, 2.171143, 1, 0, 0.2509804, 1,
1.801859, -1.705284, 0.6620632, 1, 0, 0.2470588, 1,
1.808791, 0.8676774, 1.35576, 1, 0, 0.2392157, 1,
1.816578, 1.422812, -0.6327977, 1, 0, 0.2352941, 1,
1.824847, -1.957934, 2.742136, 1, 0, 0.227451, 1,
1.879283, 1.205948, 2.514572, 1, 0, 0.2235294, 1,
1.882737, 0.2717424, 1.886399, 1, 0, 0.2156863, 1,
1.889941, -0.538995, 2.820158, 1, 0, 0.2117647, 1,
1.892944, 0.3472428, 2.52689, 1, 0, 0.2039216, 1,
1.893091, -1.093017, 1.326107, 1, 0, 0.1960784, 1,
1.938662, -1.058332, 1.022959, 1, 0, 0.1921569, 1,
1.940731, 0.1946789, -0.3133269, 1, 0, 0.1843137, 1,
1.95941, 0.1283596, 1.295256, 1, 0, 0.1803922, 1,
1.97143, -0.912253, 2.637277, 1, 0, 0.172549, 1,
2.00631, 0.3580881, 1.867311, 1, 0, 0.1686275, 1,
2.020066, -0.04128926, 1.397564, 1, 0, 0.1607843, 1,
2.027061, -0.2574935, 1.132006, 1, 0, 0.1568628, 1,
2.037029, -2.423634, 0.5734644, 1, 0, 0.1490196, 1,
2.055418, 0.4429002, 1.048072, 1, 0, 0.145098, 1,
2.066921, -0.1441074, 0.7790918, 1, 0, 0.1372549, 1,
2.096326, -1.397965, 4.136904, 1, 0, 0.1333333, 1,
2.149434, -1.082278, 1.622146, 1, 0, 0.1254902, 1,
2.237353, 0.444848, 0.599072, 1, 0, 0.1215686, 1,
2.255187, 0.7330275, 1.388752, 1, 0, 0.1137255, 1,
2.276725, 0.2049583, 2.636577, 1, 0, 0.1098039, 1,
2.328081, -0.5502039, 2.411924, 1, 0, 0.1019608, 1,
2.393786, -0.5559856, 1.282998, 1, 0, 0.09411765, 1,
2.414385, -0.1149588, 2.404131, 1, 0, 0.09019608, 1,
2.435554, 0.6110618, 2.24689, 1, 0, 0.08235294, 1,
2.455731, -1.0295, 3.893385, 1, 0, 0.07843138, 1,
2.458322, -1.854755, 1.577051, 1, 0, 0.07058824, 1,
2.459855, -0.9212863, 1.828414, 1, 0, 0.06666667, 1,
2.508831, 0.182164, 2.814319, 1, 0, 0.05882353, 1,
2.54397, -0.8195459, 1.889261, 1, 0, 0.05490196, 1,
2.556392, -0.1073255, 0.3246837, 1, 0, 0.04705882, 1,
2.588653, 0.8917553, 1.783073, 1, 0, 0.04313726, 1,
2.589027, -0.7598583, 2.046839, 1, 0, 0.03529412, 1,
2.597704, 1.337773, -0.4982009, 1, 0, 0.03137255, 1,
2.702754, 0.2636596, -0.1194323, 1, 0, 0.02352941, 1,
2.73074, 0.8871883, 0.8651417, 1, 0, 0.01960784, 1,
2.774237, -0.8314292, 0.8342848, 1, 0, 0.01176471, 1,
3.034613, -0.589887, 1.069877, 1, 0, 0.007843138, 1
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
0.1042109, -4.496738, -7.075917, 0, -0.5, 0.5, 0.5,
0.1042109, -4.496738, -7.075917, 1, -0.5, 0.5, 0.5,
0.1042109, -4.496738, -7.075917, 1, 1.5, 0.5, 0.5,
0.1042109, -4.496738, -7.075917, 0, 1.5, 0.5, 0.5
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
-3.819598, 0.1495203, -7.075917, 0, -0.5, 0.5, 0.5,
-3.819598, 0.1495203, -7.075917, 1, -0.5, 0.5, 0.5,
-3.819598, 0.1495203, -7.075917, 1, 1.5, 0.5, 0.5,
-3.819598, 0.1495203, -7.075917, 0, 1.5, 0.5, 0.5
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
-3.819598, -4.496738, -0.01801586, 0, -0.5, 0.5, 0.5,
-3.819598, -4.496738, -0.01801586, 1, -0.5, 0.5, 0.5,
-3.819598, -4.496738, -0.01801586, 1, 1.5, 0.5, 0.5,
-3.819598, -4.496738, -0.01801586, 0, 1.5, 0.5, 0.5
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
-2, -3.424525, -5.44717,
3, -3.424525, -5.44717,
-2, -3.424525, -5.44717,
-2, -3.603227, -5.718628,
-1, -3.424525, -5.44717,
-1, -3.603227, -5.718628,
0, -3.424525, -5.44717,
0, -3.603227, -5.718628,
1, -3.424525, -5.44717,
1, -3.603227, -5.718628,
2, -3.424525, -5.44717,
2, -3.603227, -5.718628,
3, -3.424525, -5.44717,
3, -3.603227, -5.718628
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
-2, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
-2, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
-2, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
-2, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5,
-1, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
-1, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
-1, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
-1, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5,
0, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
0, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
0, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
0, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5,
1, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
1, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
1, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
1, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5,
2, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
2, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
2, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
2, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5,
3, -3.960632, -6.261543, 0, -0.5, 0.5, 0.5,
3, -3.960632, -6.261543, 1, -0.5, 0.5, 0.5,
3, -3.960632, -6.261543, 1, 1.5, 0.5, 0.5,
3, -3.960632, -6.261543, 0, 1.5, 0.5, 0.5
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
-2.914104, -3, -5.44717,
-2.914104, 3, -5.44717,
-2.914104, -3, -5.44717,
-3.065019, -3, -5.718628,
-2.914104, -2, -5.44717,
-3.065019, -2, -5.718628,
-2.914104, -1, -5.44717,
-3.065019, -1, -5.718628,
-2.914104, 0, -5.44717,
-3.065019, 0, -5.718628,
-2.914104, 1, -5.44717,
-3.065019, 1, -5.718628,
-2.914104, 2, -5.44717,
-3.065019, 2, -5.718628,
-2.914104, 3, -5.44717,
-3.065019, 3, -5.718628
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
-3.366851, -3, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, -3, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, -3, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, -3, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, -2, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, -2, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, -2, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, -2, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, -1, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, -1, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, -1, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, -1, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, 0, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, 0, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, 0, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, 0, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, 1, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, 1, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, 1, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, 1, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, 2, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, 2, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, 2, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, 2, -6.261543, 0, 1.5, 0.5, 0.5,
-3.366851, 3, -6.261543, 0, -0.5, 0.5, 0.5,
-3.366851, 3, -6.261543, 1, -0.5, 0.5, 0.5,
-3.366851, 3, -6.261543, 1, 1.5, 0.5, 0.5,
-3.366851, 3, -6.261543, 0, 1.5, 0.5, 0.5
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
-2.914104, -3.424525, -4,
-2.914104, -3.424525, 4,
-2.914104, -3.424525, -4,
-3.065019, -3.603227, -4,
-2.914104, -3.424525, -2,
-3.065019, -3.603227, -2,
-2.914104, -3.424525, 0,
-3.065019, -3.603227, 0,
-2.914104, -3.424525, 2,
-3.065019, -3.603227, 2,
-2.914104, -3.424525, 4,
-3.065019, -3.603227, 4
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
-3.366851, -3.960632, -4, 0, -0.5, 0.5, 0.5,
-3.366851, -3.960632, -4, 1, -0.5, 0.5, 0.5,
-3.366851, -3.960632, -4, 1, 1.5, 0.5, 0.5,
-3.366851, -3.960632, -4, 0, 1.5, 0.5, 0.5,
-3.366851, -3.960632, -2, 0, -0.5, 0.5, 0.5,
-3.366851, -3.960632, -2, 1, -0.5, 0.5, 0.5,
-3.366851, -3.960632, -2, 1, 1.5, 0.5, 0.5,
-3.366851, -3.960632, -2, 0, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 0, 0, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 0, 1, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 0, 1, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 0, 0, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 2, 0, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 2, 1, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 2, 1, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 2, 0, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 4, 0, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 4, 1, -0.5, 0.5, 0.5,
-3.366851, -3.960632, 4, 1, 1.5, 0.5, 0.5,
-3.366851, -3.960632, 4, 0, 1.5, 0.5, 0.5
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
-2.914104, -3.424525, -5.44717,
-2.914104, 3.723565, -5.44717,
-2.914104, -3.424525, 5.411139,
-2.914104, 3.723565, 5.411139,
-2.914104, -3.424525, -5.44717,
-2.914104, -3.424525, 5.411139,
-2.914104, 3.723565, -5.44717,
-2.914104, 3.723565, 5.411139,
-2.914104, -3.424525, -5.44717,
3.122525, -3.424525, -5.44717,
-2.914104, -3.424525, 5.411139,
3.122525, -3.424525, 5.411139,
-2.914104, 3.723565, -5.44717,
3.122525, 3.723565, -5.44717,
-2.914104, 3.723565, 5.411139,
3.122525, 3.723565, 5.411139,
3.122525, -3.424525, -5.44717,
3.122525, 3.723565, -5.44717,
3.122525, -3.424525, 5.411139,
3.122525, 3.723565, 5.411139,
3.122525, -3.424525, -5.44717,
3.122525, -3.424525, 5.411139,
3.122525, 3.723565, -5.44717,
3.122525, 3.723565, 5.411139
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
var radius = 7.653619;
var distance = 34.05182;
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
mvMatrix.translate( -0.1042109, -0.1495203, 0.01801586 );
mvMatrix.scale( 1.370839, 1.157686, 0.7621116 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05182);
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
vamidothion<-read.table("vamidothion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-vamidothion$V2
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
y<-vamidothion$V3
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
z<-vamidothion$V4
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
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
-2.826191, 0.7378635, -0.1808835, 0, 0, 1, 1, 1,
-2.682996, -1.152565, -3.683821, 1, 0, 0, 1, 1,
-2.640544, 1.050489, -0.7438465, 1, 0, 0, 1, 1,
-2.634383, 0.2226026, -2.250296, 1, 0, 0, 1, 1,
-2.440236, 1.003687, 0.6899551, 1, 0, 0, 1, 1,
-2.400175, 1.042782, -1.091482, 1, 0, 0, 1, 1,
-2.396112, 0.1152103, -2.583677, 0, 0, 0, 1, 1,
-2.36884, -0.111328, -1.789282, 0, 0, 0, 1, 1,
-2.305566, -0.8250937, -2.509542, 0, 0, 0, 1, 1,
-2.292779, -0.7333645, -2.848166, 0, 0, 0, 1, 1,
-2.246352, 0.5492969, -1.63386, 0, 0, 0, 1, 1,
-2.244066, -0.1078984, -3.338184, 0, 0, 0, 1, 1,
-2.218332, -1.339429, -0.9075722, 0, 0, 0, 1, 1,
-2.18037, -0.4998108, -3.82316, 1, 1, 1, 1, 1,
-2.142478, 2.382593, -1.613478, 1, 1, 1, 1, 1,
-2.122072, 0.1882684, -2.740557, 1, 1, 1, 1, 1,
-2.105472, -0.5968407, -1.473215, 1, 1, 1, 1, 1,
-2.075076, 0.6666647, -0.6273213, 1, 1, 1, 1, 1,
-2.074267, -1.228944, -2.37574, 1, 1, 1, 1, 1,
-2.010087, 0.9016242, -1.02755, 1, 1, 1, 1, 1,
-1.986056, -0.3013645, -1.54575, 1, 1, 1, 1, 1,
-1.974921, 1.262723, -0.6099913, 1, 1, 1, 1, 1,
-1.96667, -2.812798, -3.39035, 1, 1, 1, 1, 1,
-1.944599, -0.740837, -1.806798, 1, 1, 1, 1, 1,
-1.942193, 0.2568649, -0.6686466, 1, 1, 1, 1, 1,
-1.927454, -1.007005, 0.1662483, 1, 1, 1, 1, 1,
-1.908598, 0.346561, 0.0525483, 1, 1, 1, 1, 1,
-1.877992, -2.253818, -1.754494, 1, 1, 1, 1, 1,
-1.873493, -1.174005, -1.139047, 0, 0, 1, 1, 1,
-1.865982, 1.015364, -1.161969, 1, 0, 0, 1, 1,
-1.865294, 0.5172338, -1.272892, 1, 0, 0, 1, 1,
-1.847154, -1.952308, -0.811022, 1, 0, 0, 1, 1,
-1.842998, 0.002436451, -1.903649, 1, 0, 0, 1, 1,
-1.828585, 0.4449633, -0.8653585, 1, 0, 0, 1, 1,
-1.821286, -0.7708769, -3.07998, 0, 0, 0, 1, 1,
-1.806386, -0.8501828, -1.70598, 0, 0, 0, 1, 1,
-1.781094, 1.859296, -0.8525134, 0, 0, 0, 1, 1,
-1.743686, 0.6734609, -0.1865969, 0, 0, 0, 1, 1,
-1.726927, 0.1870962, -1.50195, 0, 0, 0, 1, 1,
-1.718397, -0.1978683, -2.110552, 0, 0, 0, 1, 1,
-1.696145, -0.3762387, -3.030807, 0, 0, 0, 1, 1,
-1.677764, 0.848037, -1.935105, 1, 1, 1, 1, 1,
-1.653808, -0.2689192, -0.7535545, 1, 1, 1, 1, 1,
-1.637636, -0.1630872, -1.208515, 1, 1, 1, 1, 1,
-1.636188, -0.5266917, -2.656126, 1, 1, 1, 1, 1,
-1.632051, 0.1869403, -2.835458, 1, 1, 1, 1, 1,
-1.631271, -0.003976957, -2.723346, 1, 1, 1, 1, 1,
-1.628139, -1.886394, -1.43281, 1, 1, 1, 1, 1,
-1.618117, -0.06144283, -1.610073, 1, 1, 1, 1, 1,
-1.598034, 0.3933531, -1.380328, 1, 1, 1, 1, 1,
-1.573737, 0.463383, -0.1471731, 1, 1, 1, 1, 1,
-1.560198, -0.06810267, 0.0572934, 1, 1, 1, 1, 1,
-1.559509, 1.866749, 0.2373175, 1, 1, 1, 1, 1,
-1.55882, -0.4402442, -1.458945, 1, 1, 1, 1, 1,
-1.546264, 0.8425688, -1.204406, 1, 1, 1, 1, 1,
-1.531592, -0.4460123, -1.718043, 1, 1, 1, 1, 1,
-1.525352, 0.1103221, -1.263947, 0, 0, 1, 1, 1,
-1.503462, -0.005120658, -0.6116276, 1, 0, 0, 1, 1,
-1.499429, 0.5219617, -1.889488, 1, 0, 0, 1, 1,
-1.496653, 0.7689689, -0.4421131, 1, 0, 0, 1, 1,
-1.495742, -2.003098, -1.706634, 1, 0, 0, 1, 1,
-1.47178, 0.2735838, -1.272831, 1, 0, 0, 1, 1,
-1.471695, -1.027636, -2.565742, 0, 0, 0, 1, 1,
-1.464509, 0.2889274, -1.165952, 0, 0, 0, 1, 1,
-1.463456, -0.5212923, -1.568206, 0, 0, 0, 1, 1,
-1.460823, 0.7830659, -1.944915, 0, 0, 0, 1, 1,
-1.447315, -1.905514, -2.633795, 0, 0, 0, 1, 1,
-1.445949, -0.5512315, -2.174488, 0, 0, 0, 1, 1,
-1.436955, -1.048673, -1.717188, 0, 0, 0, 1, 1,
-1.427982, -0.4314796, -1.879587, 1, 1, 1, 1, 1,
-1.42223, -0.8847453, -2.469645, 1, 1, 1, 1, 1,
-1.41692, -1.14995, -2.798613, 1, 1, 1, 1, 1,
-1.409498, 0.1238927, -1.868774, 1, 1, 1, 1, 1,
-1.400592, -0.1067101, 0.5240434, 1, 1, 1, 1, 1,
-1.397737, -0.3530035, -1.988317, 1, 1, 1, 1, 1,
-1.393573, 1.087883, -0.4797535, 1, 1, 1, 1, 1,
-1.388089, -1.145187, -2.848079, 1, 1, 1, 1, 1,
-1.380995, 0.1839128, -1.093839, 1, 1, 1, 1, 1,
-1.377604, -1.345809, -1.156246, 1, 1, 1, 1, 1,
-1.374767, -0.5437202, -1.921323, 1, 1, 1, 1, 1,
-1.371919, -0.06579668, -1.638503, 1, 1, 1, 1, 1,
-1.367862, 0.7397077, -1.480662, 1, 1, 1, 1, 1,
-1.359473, 0.9470276, -1.662472, 1, 1, 1, 1, 1,
-1.355166, -0.3550858, -3.267542, 1, 1, 1, 1, 1,
-1.337509, 0.03310613, -2.460898, 0, 0, 1, 1, 1,
-1.329851, 0.02187945, -3.052836, 1, 0, 0, 1, 1,
-1.326759, 0.2519361, -1.195867, 1, 0, 0, 1, 1,
-1.323815, 0.7603757, -0.9774546, 1, 0, 0, 1, 1,
-1.318736, -0.9215561, -1.688292, 1, 0, 0, 1, 1,
-1.311375, -0.2462162, -2.49971, 1, 0, 0, 1, 1,
-1.309939, -0.8323447, -1.973687, 0, 0, 0, 1, 1,
-1.307837, -0.7171869, -2.895577, 0, 0, 0, 1, 1,
-1.300809, 0.7305529, -2.948105, 0, 0, 0, 1, 1,
-1.295835, -1.578036, -1.552899, 0, 0, 0, 1, 1,
-1.286719, -2.077216, -1.051156, 0, 0, 0, 1, 1,
-1.283781, 1.769521, -0.6145807, 0, 0, 0, 1, 1,
-1.269806, -0.8383792, -2.091417, 0, 0, 0, 1, 1,
-1.268967, -0.251965, -1.245132, 1, 1, 1, 1, 1,
-1.268071, -0.7521034, -2.145393, 1, 1, 1, 1, 1,
-1.265467, 0.9413058, 1.332731, 1, 1, 1, 1, 1,
-1.257516, -1.444424, -3.412616, 1, 1, 1, 1, 1,
-1.257111, 0.08525947, -0.8267604, 1, 1, 1, 1, 1,
-1.256938, 0.845746, -0.732594, 1, 1, 1, 1, 1,
-1.252481, 0.2152516, -1.283212, 1, 1, 1, 1, 1,
-1.248953, -0.2270036, -1.992801, 1, 1, 1, 1, 1,
-1.248396, 1.712226, -1.667964, 1, 1, 1, 1, 1,
-1.247055, 0.1424337, -2.378227, 1, 1, 1, 1, 1,
-1.243889, 1.201441, 1.023186, 1, 1, 1, 1, 1,
-1.24378, -1.26215, -3.763546, 1, 1, 1, 1, 1,
-1.232854, 2.099225, 0.09379101, 1, 1, 1, 1, 1,
-1.223245, 0.6245977, -0.07158303, 1, 1, 1, 1, 1,
-1.213113, 0.9190789, -0.7503407, 1, 1, 1, 1, 1,
-1.197173, -1.073566, -4.296839, 0, 0, 1, 1, 1,
-1.196181, 0.3011317, -2.406274, 1, 0, 0, 1, 1,
-1.187644, 0.8083791, 0.7346433, 1, 0, 0, 1, 1,
-1.186539, -0.009697159, -1.464071, 1, 0, 0, 1, 1,
-1.17237, 0.8403707, 0.3143297, 1, 0, 0, 1, 1,
-1.172367, 0.8853762, -0.5258695, 1, 0, 0, 1, 1,
-1.168525, 0.5194529, -1.170547, 0, 0, 0, 1, 1,
-1.167756, -1.355873, -2.77695, 0, 0, 0, 1, 1,
-1.161972, -0.2580207, -1.340068, 0, 0, 0, 1, 1,
-1.160405, 0.4318234, -2.380629, 0, 0, 0, 1, 1,
-1.160052, -0.3499489, -3.259386, 0, 0, 0, 1, 1,
-1.15473, 0.5555401, -0.6989279, 0, 0, 0, 1, 1,
-1.15119, 0.1370794, -1.348447, 0, 0, 0, 1, 1,
-1.126726, 0.06613448, -2.259351, 1, 1, 1, 1, 1,
-1.122927, -2.033054, -3.45746, 1, 1, 1, 1, 1,
-1.122266, -0.04980616, 0.2218899, 1, 1, 1, 1, 1,
-1.121589, -1.769325, -3.404265, 1, 1, 1, 1, 1,
-1.114171, -0.0009812593, 0.04385344, 1, 1, 1, 1, 1,
-1.112432, 1.946299, 0.1173692, 1, 1, 1, 1, 1,
-1.111008, 0.1328319, -1.328294, 1, 1, 1, 1, 1,
-1.108619, 0.5468512, -2.402856, 1, 1, 1, 1, 1,
-1.106704, 0.6066663, -1.474853, 1, 1, 1, 1, 1,
-1.105229, -1.164975, -2.017964, 1, 1, 1, 1, 1,
-1.096631, -0.3810727, -1.302955, 1, 1, 1, 1, 1,
-1.092988, 0.7250242, -0.6944327, 1, 1, 1, 1, 1,
-1.090872, 0.0494032, -2.185197, 1, 1, 1, 1, 1,
-1.082541, -0.5420222, -1.210937, 1, 1, 1, 1, 1,
-1.079866, 0.01329985, 0.06761492, 1, 1, 1, 1, 1,
-1.079729, -2.114106, -1.842244, 0, 0, 1, 1, 1,
-1.078764, 0.9430172, 0.5398031, 1, 0, 0, 1, 1,
-1.074703, -0.7548407, -2.216652, 1, 0, 0, 1, 1,
-1.066958, -1.243569, -2.748027, 1, 0, 0, 1, 1,
-1.063726, 0.8309538, -0.08553691, 1, 0, 0, 1, 1,
-1.06012, -1.094799, -2.841402, 1, 0, 0, 1, 1,
-1.055811, -0.6757056, -4.404432, 0, 0, 0, 1, 1,
-1.055015, 0.3480241, -1.903042, 0, 0, 0, 1, 1,
-1.054894, 0.08385958, -4.978087, 0, 0, 0, 1, 1,
-1.043839, 0.7255358, 0.3499796, 0, 0, 0, 1, 1,
-1.042777, 0.1642768, -0.4537674, 0, 0, 0, 1, 1,
-1.042639, 0.9195213, -1.713742, 0, 0, 0, 1, 1,
-1.038812, -0.1893219, 0.07238733, 0, 0, 0, 1, 1,
-1.035886, -0.3663428, -2.69198, 1, 1, 1, 1, 1,
-1.027519, -0.6383293, -0.6454645, 1, 1, 1, 1, 1,
-1.015546, 0.1403562, -0.8680189, 1, 1, 1, 1, 1,
-1.012972, -0.04842691, -1.257159, 1, 1, 1, 1, 1,
-1.01018, 0.5359812, -0.8812334, 1, 1, 1, 1, 1,
-1.008283, 0.7620175, -3.465254, 1, 1, 1, 1, 1,
-1.003484, 1.257882, 0.2356111, 1, 1, 1, 1, 1,
-0.9999636, -0.6239241, -3.204749, 1, 1, 1, 1, 1,
-0.9892738, 0.6933881, -1.825959, 1, 1, 1, 1, 1,
-0.9881916, 0.9515839, -0.8993448, 1, 1, 1, 1, 1,
-0.985108, -0.3891492, -1.674187, 1, 1, 1, 1, 1,
-0.9824213, -1.81465, -3.46408, 1, 1, 1, 1, 1,
-0.9806402, 0.3027921, -1.856555, 1, 1, 1, 1, 1,
-0.9804288, -0.7574583, -2.488141, 1, 1, 1, 1, 1,
-0.9799495, 0.05613909, -2.298884, 1, 1, 1, 1, 1,
-0.9763674, -0.4996264, -2.227427, 0, 0, 1, 1, 1,
-0.9683542, 1.211242, -1.419238, 1, 0, 0, 1, 1,
-0.9523673, -2.893362, -4.106863, 1, 0, 0, 1, 1,
-0.9439126, 0.6780057, -0.7005212, 1, 0, 0, 1, 1,
-0.9390063, -1.353045, -4.029655, 1, 0, 0, 1, 1,
-0.9358369, -0.08861345, -1.174213, 1, 0, 0, 1, 1,
-0.9208274, 0.01233696, -2.160876, 0, 0, 0, 1, 1,
-0.9198902, -0.5455779, -1.793231, 0, 0, 0, 1, 1,
-0.9185899, -0.7830048, -1.353962, 0, 0, 0, 1, 1,
-0.9177408, 2.54327, -0.9859246, 0, 0, 0, 1, 1,
-0.911815, 0.3349379, -2.001418, 0, 0, 0, 1, 1,
-0.9077085, 0.4862139, -2.276307, 0, 0, 0, 1, 1,
-0.9061013, 0.7338077, 0.1147836, 0, 0, 0, 1, 1,
-0.8971796, 0.7694814, -1.598729, 1, 1, 1, 1, 1,
-0.8963838, 1.477972, -1.080205, 1, 1, 1, 1, 1,
-0.895615, 1.962589, -0.577563, 1, 1, 1, 1, 1,
-0.8940553, 0.2154613, -1.380515, 1, 1, 1, 1, 1,
-0.8938647, -0.7821227, -1.274373, 1, 1, 1, 1, 1,
-0.8910894, 0.3617704, -2.001356, 1, 1, 1, 1, 1,
-0.8853815, 0.04725462, -2.283216, 1, 1, 1, 1, 1,
-0.8772517, 0.06902767, 0.1980797, 1, 1, 1, 1, 1,
-0.8761607, 2.055192, -1.677512, 1, 1, 1, 1, 1,
-0.8629302, 1.460046, -1.433896, 1, 1, 1, 1, 1,
-0.8610647, 0.6201111, -1.338256, 1, 1, 1, 1, 1,
-0.8540978, 0.6811801, 1.915759, 1, 1, 1, 1, 1,
-0.8463105, -0.8735769, -3.238313, 1, 1, 1, 1, 1,
-0.8430169, 1.053402, -1.146792, 1, 1, 1, 1, 1,
-0.8414695, -0.7809698, -2.229041, 1, 1, 1, 1, 1,
-0.840186, 0.5697823, -3.40663, 0, 0, 1, 1, 1,
-0.8371797, -1.141553, -2.10419, 1, 0, 0, 1, 1,
-0.8270185, 0.7873027, -1.003331, 1, 0, 0, 1, 1,
-0.8156247, 2.294295, 0.5449471, 1, 0, 0, 1, 1,
-0.810965, -1.253503, -3.080882, 1, 0, 0, 1, 1,
-0.8078405, -0.2552209, -1.776108, 1, 0, 0, 1, 1,
-0.8025302, 0.4137606, -0.188457, 0, 0, 0, 1, 1,
-0.8008156, -0.1894262, -1.569299, 0, 0, 0, 1, 1,
-0.7941405, 0.1661136, 0.1383158, 0, 0, 0, 1, 1,
-0.7932719, 0.681905, -1.547807, 0, 0, 0, 1, 1,
-0.7915921, 0.1474052, -1.28997, 0, 0, 0, 1, 1,
-0.7909153, -0.6197168, -1.842843, 0, 0, 0, 1, 1,
-0.7807854, -2.440767, -1.417363, 0, 0, 0, 1, 1,
-0.7784372, -0.3954556, -1.797027, 1, 1, 1, 1, 1,
-0.7774572, 1.033506, -0.7086528, 1, 1, 1, 1, 1,
-0.7727602, 2.576609, 0.06614926, 1, 1, 1, 1, 1,
-0.7698664, -0.5346997, -1.916877, 1, 1, 1, 1, 1,
-0.7619252, 0.2211582, -2.130788, 1, 1, 1, 1, 1,
-0.7609326, 0.3427888, -1.358415, 1, 1, 1, 1, 1,
-0.7599098, -0.103238, -0.8825124, 1, 1, 1, 1, 1,
-0.7583767, -2.053766, -3.305401, 1, 1, 1, 1, 1,
-0.7487491, -0.8654769, -1.226686, 1, 1, 1, 1, 1,
-0.7420937, -0.7756491, -3.64474, 1, 1, 1, 1, 1,
-0.7394683, -0.06967742, -2.352862, 1, 1, 1, 1, 1,
-0.7383138, -0.2971231, -1.915643, 1, 1, 1, 1, 1,
-0.7359492, -1.297889, -1.621985, 1, 1, 1, 1, 1,
-0.7353429, 1.254896, 0.1538808, 1, 1, 1, 1, 1,
-0.7334179, -0.7957499, -3.227042, 1, 1, 1, 1, 1,
-0.7299452, 0.6014031, -0.1850368, 0, 0, 1, 1, 1,
-0.7167597, -1.263325, -3.706116, 1, 0, 0, 1, 1,
-0.7143282, -0.4127449, -2.628569, 1, 0, 0, 1, 1,
-0.7077335, -0.780297, -2.801034, 1, 0, 0, 1, 1,
-0.7064138, 0.1027542, -1.745768, 1, 0, 0, 1, 1,
-0.7061787, -1.576826, -2.414838, 1, 0, 0, 1, 1,
-0.7051058, -0.07499111, -1.807698, 0, 0, 0, 1, 1,
-0.7042907, 0.2791045, -1.248006, 0, 0, 0, 1, 1,
-0.7017764, 1.654169, -0.8973938, 0, 0, 0, 1, 1,
-0.7012005, 0.6138347, -0.6621299, 0, 0, 0, 1, 1,
-0.6995997, -0.2972751, -2.107612, 0, 0, 0, 1, 1,
-0.6980761, 0.9161732, 0.2644079, 0, 0, 0, 1, 1,
-0.6932595, -1.526178, -2.702143, 0, 0, 0, 1, 1,
-0.6886949, 1.442244, 0.188758, 1, 1, 1, 1, 1,
-0.6848258, -0.6999643, -2.84681, 1, 1, 1, 1, 1,
-0.6813751, 0.4867754, -0.7076154, 1, 1, 1, 1, 1,
-0.6813751, 0.8222258, 0.1663514, 1, 1, 1, 1, 1,
-0.6792636, -2.011051, -2.305316, 1, 1, 1, 1, 1,
-0.6791075, -0.4743765, -3.377002, 1, 1, 1, 1, 1,
-0.6788479, 1.512212, -0.01014302, 1, 1, 1, 1, 1,
-0.6761765, -0.2841928, 0.6798977, 1, 1, 1, 1, 1,
-0.6594247, 0.380785, -0.8011133, 1, 1, 1, 1, 1,
-0.6558036, 0.09725065, -1.150107, 1, 1, 1, 1, 1,
-0.6454367, 0.4705138, -0.8979713, 1, 1, 1, 1, 1,
-0.6376374, -0.5054814, -2.295481, 1, 1, 1, 1, 1,
-0.6372785, 0.5564454, -1.399233, 1, 1, 1, 1, 1,
-0.6326123, 0.027485, -1.610952, 1, 1, 1, 1, 1,
-0.6284094, 0.8382853, -1.427879, 1, 1, 1, 1, 1,
-0.6274363, 0.6545637, -1.297439, 0, 0, 1, 1, 1,
-0.6241157, -0.4640692, -2.027913, 1, 0, 0, 1, 1,
-0.6221074, -0.8029602, -5.28904, 1, 0, 0, 1, 1,
-0.6196421, -0.4688681, -2.121444, 1, 0, 0, 1, 1,
-0.6160625, -0.04983883, -3.724394, 1, 0, 0, 1, 1,
-0.6116143, 0.1738648, -1.945281, 1, 0, 0, 1, 1,
-0.6098025, -1.258415, -3.922221, 0, 0, 0, 1, 1,
-0.6015368, 0.9113678, -0.9021511, 0, 0, 0, 1, 1,
-0.5992996, -0.9833578, -3.554147, 0, 0, 0, 1, 1,
-0.5953983, -1.084011, -2.654092, 0, 0, 0, 1, 1,
-0.5908329, -0.8145701, -0.9513909, 0, 0, 0, 1, 1,
-0.5792004, 0.2797741, -1.313436, 0, 0, 0, 1, 1,
-0.5766566, 0.09116907, -0.8001597, 0, 0, 0, 1, 1,
-0.5765666, 1.5036, -0.1588477, 1, 1, 1, 1, 1,
-0.576218, -0.9973667, -3.010223, 1, 1, 1, 1, 1,
-0.5758556, 1.805125, -1.564788, 1, 1, 1, 1, 1,
-0.5748736, 2.645916, 1.927555, 1, 1, 1, 1, 1,
-0.5719564, -0.8112169, -2.899511, 1, 1, 1, 1, 1,
-0.5698497, -0.5625136, -0.9314282, 1, 1, 1, 1, 1,
-0.5682139, -1.572741, -1.787858, 1, 1, 1, 1, 1,
-0.5677107, -0.222554, -1.864754, 1, 1, 1, 1, 1,
-0.5654963, -1.269448, -1.616925, 1, 1, 1, 1, 1,
-0.5650075, 1.546204, -0.01445485, 1, 1, 1, 1, 1,
-0.5637601, 0.9756108, -1.022649, 1, 1, 1, 1, 1,
-0.5629519, 1.827303, -1.42347, 1, 1, 1, 1, 1,
-0.5626848, -1.307224, -3.787417, 1, 1, 1, 1, 1,
-0.5618303, -0.235908, -5.02066, 1, 1, 1, 1, 1,
-0.5602558, -0.1200334, -1.504423, 1, 1, 1, 1, 1,
-0.5601829, 0.07866508, -0.6946247, 0, 0, 1, 1, 1,
-0.5599343, -1.476924, -2.464199, 1, 0, 0, 1, 1,
-0.5576993, 0.8938336, 0.03940012, 1, 0, 0, 1, 1,
-0.5568953, 0.2004582, -1.926872, 1, 0, 0, 1, 1,
-0.5561162, 0.5056872, -0.6942831, 1, 0, 0, 1, 1,
-0.5556895, 0.3329514, -0.3627719, 1, 0, 0, 1, 1,
-0.5556791, -1.163624, -3.561328, 0, 0, 0, 1, 1,
-0.5491846, 0.4931117, -1.374263, 0, 0, 0, 1, 1,
-0.5471223, -0.2113244, -0.9250219, 0, 0, 0, 1, 1,
-0.5431598, -0.6393953, -2.135894, 0, 0, 0, 1, 1,
-0.5409628, -0.5704117, -2.212796, 0, 0, 0, 1, 1,
-0.540406, -1.529683, -0.7272222, 0, 0, 0, 1, 1,
-0.5358927, 0.6064661, -0.5361179, 0, 0, 0, 1, 1,
-0.5193108, 0.6748511, -1.296749, 1, 1, 1, 1, 1,
-0.5191244, 0.6111067, -1.283343, 1, 1, 1, 1, 1,
-0.5187258, 0.2369805, -4.228311, 1, 1, 1, 1, 1,
-0.5136288, -0.4945041, -2.926185, 1, 1, 1, 1, 1,
-0.5060356, 0.6985574, -0.8554507, 1, 1, 1, 1, 1,
-0.5055865, -1.748944, -1.289487, 1, 1, 1, 1, 1,
-0.5016474, 0.02617086, -0.03160035, 1, 1, 1, 1, 1,
-0.4993456, -0.1574184, -1.752805, 1, 1, 1, 1, 1,
-0.4982135, -0.7438517, -2.25928, 1, 1, 1, 1, 1,
-0.4972953, -1.317737, -2.658971, 1, 1, 1, 1, 1,
-0.4912405, -0.5657517, -2.814978, 1, 1, 1, 1, 1,
-0.4905923, 0.04964864, -2.68106, 1, 1, 1, 1, 1,
-0.4837519, -0.8931646, -1.724331, 1, 1, 1, 1, 1,
-0.4783415, 0.5932482, -0.1793073, 1, 1, 1, 1, 1,
-0.4727801, -0.8199212, -1.885758, 1, 1, 1, 1, 1,
-0.4727698, 1.974556, -2.008922, 0, 0, 1, 1, 1,
-0.4721907, -2.156334, -1.944797, 1, 0, 0, 1, 1,
-0.4678615, 2.708494, 0.235572, 1, 0, 0, 1, 1,
-0.4672802, -0.5570021, -2.295208, 1, 0, 0, 1, 1,
-0.4667792, 1.525857, -0.5510594, 1, 0, 0, 1, 1,
-0.4664614, 0.9984998, -0.9265618, 1, 0, 0, 1, 1,
-0.464983, -0.3050974, 0.2640327, 0, 0, 0, 1, 1,
-0.464302, -0.05824689, -1.929129, 0, 0, 0, 1, 1,
-0.4598283, -0.742165, -2.97942, 0, 0, 0, 1, 1,
-0.4544604, 0.253758, -0.977712, 0, 0, 0, 1, 1,
-0.4431899, -0.02814158, -1.167951, 0, 0, 0, 1, 1,
-0.4427519, -0.5936471, -3.063839, 0, 0, 0, 1, 1,
-0.4419739, -0.4387057, -1.659243, 0, 0, 0, 1, 1,
-0.4410686, -0.535088, -3.091145, 1, 1, 1, 1, 1,
-0.4405952, 0.5622894, -2.207128, 1, 1, 1, 1, 1,
-0.4351335, 0.3606722, -0.7589443, 1, 1, 1, 1, 1,
-0.4336084, -0.6438081, -3.226892, 1, 1, 1, 1, 1,
-0.4314348, -0.1262382, -1.204218, 1, 1, 1, 1, 1,
-0.4276105, 1.533432, 0.9380846, 1, 1, 1, 1, 1,
-0.4218084, 0.2937266, -1.74501, 1, 1, 1, 1, 1,
-0.4216298, -0.6024064, -2.971345, 1, 1, 1, 1, 1,
-0.4185741, 0.1164775, -1.056294, 1, 1, 1, 1, 1,
-0.4176465, 1.860416, -0.2342144, 1, 1, 1, 1, 1,
-0.4105782, 1.859994, 1.597419, 1, 1, 1, 1, 1,
-0.4088183, -1.047678, -1.85057, 1, 1, 1, 1, 1,
-0.4068134, 1.184624, -2.089394, 1, 1, 1, 1, 1,
-0.4034238, -1.131431, -1.20945, 1, 1, 1, 1, 1,
-0.4017491, 1.85593, -0.1087225, 1, 1, 1, 1, 1,
-0.3961368, 0.5812204, -1.122161, 0, 0, 1, 1, 1,
-0.3937261, -0.7020468, -3.244725, 1, 0, 0, 1, 1,
-0.3915541, 0.8456133, 1.134162, 1, 0, 0, 1, 1,
-0.3907371, 1.030727, -0.8853268, 1, 0, 0, 1, 1,
-0.3796964, -0.02022276, -1.963246, 1, 0, 0, 1, 1,
-0.3787455, 0.1032129, -1.290126, 1, 0, 0, 1, 1,
-0.3757287, 0.2846143, -1.227771, 0, 0, 0, 1, 1,
-0.3738406, -0.4934258, -0.8762352, 0, 0, 0, 1, 1,
-0.3725446, -0.2295997, -3.086408, 0, 0, 0, 1, 1,
-0.3685012, -0.8876457, -2.696378, 0, 0, 0, 1, 1,
-0.3674998, 0.7606376, 0.4819773, 0, 0, 0, 1, 1,
-0.3643174, 0.5736759, -1.457444, 0, 0, 0, 1, 1,
-0.3642925, 0.6197504, 0.9156728, 0, 0, 0, 1, 1,
-0.363502, -0.218831, -3.598594, 1, 1, 1, 1, 1,
-0.3615513, -0.6705355, -1.667937, 1, 1, 1, 1, 1,
-0.3563688, 0.7195129, -1.243663, 1, 1, 1, 1, 1,
-0.355473, -1.736454, -3.036909, 1, 1, 1, 1, 1,
-0.3526843, 0.06069732, -0.9049885, 1, 1, 1, 1, 1,
-0.3513798, -0.1492651, -0.8668252, 1, 1, 1, 1, 1,
-0.3511438, -1.019334, -3.405846, 1, 1, 1, 1, 1,
-0.3366769, 0.8920403, -0.9462202, 1, 1, 1, 1, 1,
-0.3324304, -0.9578584, -4.231446, 1, 1, 1, 1, 1,
-0.3311621, 1.50057, -1.287148, 1, 1, 1, 1, 1,
-0.3247631, 0.9720056, -0.9975165, 1, 1, 1, 1, 1,
-0.32173, -0.254272, -2.478136, 1, 1, 1, 1, 1,
-0.3193032, -0.6533645, -1.881899, 1, 1, 1, 1, 1,
-0.3147731, -2.012628, -3.093515, 1, 1, 1, 1, 1,
-0.3147569, 0.4381527, -1.070497, 1, 1, 1, 1, 1,
-0.3137007, 1.885424, -0.00708005, 0, 0, 1, 1, 1,
-0.3133655, -0.7613949, -3.887396, 1, 0, 0, 1, 1,
-0.309381, -0.3083275, -3.723428, 1, 0, 0, 1, 1,
-0.2935258, -0.7938865, -4.674356, 1, 0, 0, 1, 1,
-0.2934456, -0.1376103, -3.302568, 1, 0, 0, 1, 1,
-0.2917003, -0.595623, -2.427353, 1, 0, 0, 1, 1,
-0.2913652, 0.507818, -1.570465, 0, 0, 0, 1, 1,
-0.2865964, -0.4657805, -2.969382, 0, 0, 0, 1, 1,
-0.2843121, 2.304184, -1.32713, 0, 0, 0, 1, 1,
-0.2803743, 0.44092, 1.415089, 0, 0, 0, 1, 1,
-0.2700711, -0.02458914, -2.214513, 0, 0, 0, 1, 1,
-0.2595478, 2.09676, 1.78511, 0, 0, 0, 1, 1,
-0.2594023, -0.4826288, -2.541332, 0, 0, 0, 1, 1,
-0.258423, -0.2653967, -1.390381, 1, 1, 1, 1, 1,
-0.257495, 0.02710259, -3.777363, 1, 1, 1, 1, 1,
-0.256594, 0.9654727, -0.6306521, 1, 1, 1, 1, 1,
-0.2460968, -1.854161, -2.815581, 1, 1, 1, 1, 1,
-0.2460435, 2.179086, 0.3985823, 1, 1, 1, 1, 1,
-0.2451468, 0.07523136, -0.6006161, 1, 1, 1, 1, 1,
-0.2432979, -0.6323105, -2.929183, 1, 1, 1, 1, 1,
-0.237966, -0.1333252, -1.73982, 1, 1, 1, 1, 1,
-0.2367765, 0.2937367, 0.4112295, 1, 1, 1, 1, 1,
-0.2357274, -0.08926379, -1.994277, 1, 1, 1, 1, 1,
-0.232686, 0.9535512, -2.141606, 1, 1, 1, 1, 1,
-0.2304925, -0.368558, -3.486404, 1, 1, 1, 1, 1,
-0.2262387, -0.671297, -2.189138, 1, 1, 1, 1, 1,
-0.2258606, -0.1967845, -1.241427, 1, 1, 1, 1, 1,
-0.2241196, 0.4649988, -0.5380145, 1, 1, 1, 1, 1,
-0.211677, 0.7088529, 0.4008254, 0, 0, 1, 1, 1,
-0.2109151, -0.3041648, -3.076819, 1, 0, 0, 1, 1,
-0.2101334, -0.05146017, 0.4896553, 1, 0, 0, 1, 1,
-0.2096044, 0.8208988, -0.04380709, 1, 0, 0, 1, 1,
-0.2095612, 0.7467803, 0.5521415, 1, 0, 0, 1, 1,
-0.2072688, -0.6892674, -3.18806, 1, 0, 0, 1, 1,
-0.2066091, -0.8721312, -2.814522, 0, 0, 0, 1, 1,
-0.2064742, -0.3542345, -3.234688, 0, 0, 0, 1, 1,
-0.2043019, 0.5815865, -0.9636844, 0, 0, 0, 1, 1,
-0.2041493, 0.5489735, -1.888236, 0, 0, 0, 1, 1,
-0.2012062, 0.6034875, -0.8056472, 0, 0, 0, 1, 1,
-0.1941769, -0.1062281, -1.258839, 0, 0, 0, 1, 1,
-0.1886479, 0.1604914, -0.7157313, 0, 0, 0, 1, 1,
-0.1872109, 1.725387, 0.9609253, 1, 1, 1, 1, 1,
-0.1843557, 1.919254, 0.7270659, 1, 1, 1, 1, 1,
-0.1842521, 0.4124321, -1.156547, 1, 1, 1, 1, 1,
-0.1813518, 0.07630806, -2.309464, 1, 1, 1, 1, 1,
-0.1803038, 1.284177, -0.7949578, 1, 1, 1, 1, 1,
-0.1798236, 0.1173488, -2.52039, 1, 1, 1, 1, 1,
-0.1781131, -1.774442, -4.340058, 1, 1, 1, 1, 1,
-0.1729212, 0.1514187, -2.129023, 1, 1, 1, 1, 1,
-0.1693938, 2.158167, 0.07582975, 1, 1, 1, 1, 1,
-0.1683246, 0.3355592, -0.7452304, 1, 1, 1, 1, 1,
-0.1683043, 1.463435, -0.6910761, 1, 1, 1, 1, 1,
-0.1631965, 0.1246725, 0.1061098, 1, 1, 1, 1, 1,
-0.1615494, 0.4532796, -2.021592, 1, 1, 1, 1, 1,
-0.1568983, -0.02254794, -2.715382, 1, 1, 1, 1, 1,
-0.1568967, 0.009478331, -2.871366, 1, 1, 1, 1, 1,
-0.1558938, -0.6891736, -2.274245, 0, 0, 1, 1, 1,
-0.1543314, -1.410124, -3.2778, 1, 0, 0, 1, 1,
-0.1521179, -0.6206946, -1.968826, 1, 0, 0, 1, 1,
-0.1511905, 0.4160002, 0.1439659, 1, 0, 0, 1, 1,
-0.1509397, -0.8083869, -3.39851, 1, 0, 0, 1, 1,
-0.1501311, 0.5503795, -0.4957885, 1, 0, 0, 1, 1,
-0.1488015, -0.9281735, -2.473883, 0, 0, 0, 1, 1,
-0.1483849, 0.978259, -1.976075, 0, 0, 0, 1, 1,
-0.1478316, 0.1702482, -0.6437273, 0, 0, 0, 1, 1,
-0.1447307, -1.48998, -5.023362, 0, 0, 0, 1, 1,
-0.1408153, 0.8207315, -0.1065649, 0, 0, 0, 1, 1,
-0.1282575, 0.2436956, 0.6763843, 0, 0, 0, 1, 1,
-0.1267062, -0.2149405, -1.159246, 0, 0, 0, 1, 1,
-0.1250265, -1.481427, -2.750688, 1, 1, 1, 1, 1,
-0.1232254, -0.1574477, -2.57668, 1, 1, 1, 1, 1,
-0.119677, 0.600862, -0.795144, 1, 1, 1, 1, 1,
-0.1184997, 0.8494588, -0.09402443, 1, 1, 1, 1, 1,
-0.1180877, -1.251309, -3.524061, 1, 1, 1, 1, 1,
-0.1166834, -0.09338538, -2.107195, 1, 1, 1, 1, 1,
-0.1161503, 1.61802, 0.204437, 1, 1, 1, 1, 1,
-0.1111748, -0.1988756, -3.487857, 1, 1, 1, 1, 1,
-0.1077539, 0.3561026, 0.9255323, 1, 1, 1, 1, 1,
-0.1040987, -0.7127476, -3.683704, 1, 1, 1, 1, 1,
-0.1038723, 0.347145, -0.1426677, 1, 1, 1, 1, 1,
-0.1034909, -0.194296, -3.964152, 1, 1, 1, 1, 1,
-0.0899813, 0.2019473, -0.4134525, 1, 1, 1, 1, 1,
-0.08808664, -0.4031987, -2.119348, 1, 1, 1, 1, 1,
-0.08749475, 1.336602, 0.0746419, 1, 1, 1, 1, 1,
-0.08493161, 0.5661505, 0.4578853, 0, 0, 1, 1, 1,
-0.07914483, 1.28321, 1.288903, 1, 0, 0, 1, 1,
-0.07823432, -0.9969586, -2.581098, 1, 0, 0, 1, 1,
-0.07698993, 0.9188438, 0.08733148, 1, 0, 0, 1, 1,
-0.07556711, 1.189579, 0.6514377, 1, 0, 0, 1, 1,
-0.07538981, 0.9023378, 0.0004647472, 1, 0, 0, 1, 1,
-0.07003676, -0.4049455, -2.809468, 0, 0, 0, 1, 1,
-0.07003181, -1.238439, -2.442343, 0, 0, 0, 1, 1,
-0.06983552, -0.5167453, -5.263227, 0, 0, 0, 1, 1,
-0.06791408, -0.1878453, -4.017781, 0, 0, 0, 1, 1,
-0.06740782, -1.367055, -3.509476, 0, 0, 0, 1, 1,
-0.06663842, -0.1855855, -1.894767, 0, 0, 0, 1, 1,
-0.06606235, -0.104554, -3.643022, 0, 0, 0, 1, 1,
-0.06355397, 0.901452, -0.9110646, 1, 1, 1, 1, 1,
-0.05863075, -0.6016545, -2.140092, 1, 1, 1, 1, 1,
-0.05734482, -1.442539, -2.700705, 1, 1, 1, 1, 1,
-0.05699086, 0.6265242, -0.03297319, 1, 1, 1, 1, 1,
-0.05439689, 0.4756436, -0.6641741, 1, 1, 1, 1, 1,
-0.05297233, -0.6227966, -3.713825, 1, 1, 1, 1, 1,
-0.05065052, 1.295032, 0.1791899, 1, 1, 1, 1, 1,
-0.04556666, 0.3403267, -0.5995392, 1, 1, 1, 1, 1,
-0.04470056, -0.4401231, -2.018431, 1, 1, 1, 1, 1,
-0.04344592, 1.601038, 1.209044, 1, 1, 1, 1, 1,
-0.0294142, -0.7361004, -4.389902, 1, 1, 1, 1, 1,
-0.02777427, 0.294553, 0.5163038, 1, 1, 1, 1, 1,
-0.02739195, 0.6117841, 0.973263, 1, 1, 1, 1, 1,
-0.02199816, 0.3539958, 1.72209, 1, 1, 1, 1, 1,
-0.0198984, -0.6320139, -2.929171, 1, 1, 1, 1, 1,
-0.01902364, 1.51464, 0.3577516, 0, 0, 1, 1, 1,
-0.01453009, -0.8818803, -2.938307, 1, 0, 0, 1, 1,
-0.01226098, -0.07064925, -3.45703, 1, 0, 0, 1, 1,
-0.01065371, 0.8799512, 0.07961661, 1, 0, 0, 1, 1,
-0.005955766, -1.832, -4.467276, 1, 0, 0, 1, 1,
-0.002962104, 0.691471, 0.2756318, 1, 0, 0, 1, 1,
-0.0001366721, -0.7471265, -2.80209, 0, 0, 0, 1, 1,
0.01049128, 0.09924124, 1.152989, 0, 0, 0, 1, 1,
0.01332157, 0.796747, 2.345993, 0, 0, 0, 1, 1,
0.01458743, -0.5183048, 1.789633, 0, 0, 0, 1, 1,
0.01521914, 1.519102, -0.6643101, 0, 0, 0, 1, 1,
0.02477904, 0.558016, 0.6539884, 0, 0, 0, 1, 1,
0.02651525, -1.235125, 1.92076, 0, 0, 0, 1, 1,
0.03097026, -0.7482749, 3.162748, 1, 1, 1, 1, 1,
0.03724808, -0.5447097, 3.087308, 1, 1, 1, 1, 1,
0.03915609, -0.3559631, 2.604355, 1, 1, 1, 1, 1,
0.04139637, -1.032504, 2.844997, 1, 1, 1, 1, 1,
0.04518762, 0.3317332, 0.6329002, 1, 1, 1, 1, 1,
0.04552718, 1.096669, -0.07920936, 1, 1, 1, 1, 1,
0.04766539, -0.409912, 2.046928, 1, 1, 1, 1, 1,
0.04795187, -0.1032791, 2.623903, 1, 1, 1, 1, 1,
0.04898949, -0.8863855, 3.538381, 1, 1, 1, 1, 1,
0.05135615, 0.4577594, 0.8328404, 1, 1, 1, 1, 1,
0.05304693, -1.041307, 2.559713, 1, 1, 1, 1, 1,
0.05369805, 0.7735271, -0.05918008, 1, 1, 1, 1, 1,
0.05864749, -0.20189, 3.37377, 1, 1, 1, 1, 1,
0.05925181, -1.707272, 2.812707, 1, 1, 1, 1, 1,
0.06068122, -1.505124, 4.14756, 1, 1, 1, 1, 1,
0.06122283, -0.9081288, 2.29706, 0, 0, 1, 1, 1,
0.0649788, 0.07585201, 0.2855955, 1, 0, 0, 1, 1,
0.0659197, 2.110527, 0.9319646, 1, 0, 0, 1, 1,
0.06633843, 0.199055, 0.3804587, 1, 0, 0, 1, 1,
0.06638227, -0.8608597, 4.14076, 1, 0, 0, 1, 1,
0.06773953, -1.33867, 4.195962, 1, 0, 0, 1, 1,
0.06869264, 0.3428018, -2.209541, 0, 0, 0, 1, 1,
0.07075991, -0.5846908, 2.137704, 0, 0, 0, 1, 1,
0.07549483, 1.335706, 0.2553686, 0, 0, 0, 1, 1,
0.07931512, 0.454429, -0.3015878, 0, 0, 0, 1, 1,
0.08124187, 0.8056411, 0.4873825, 0, 0, 0, 1, 1,
0.08280187, -0.1444179, 4.962008, 0, 0, 0, 1, 1,
0.0844171, 0.4339058, 0.4035465, 0, 0, 0, 1, 1,
0.08765118, 0.799826, 1.285058, 1, 1, 1, 1, 1,
0.08776479, 0.1755746, 0.01078569, 1, 1, 1, 1, 1,
0.09152989, -0.4774228, 2.638637, 1, 1, 1, 1, 1,
0.09400375, 0.3955178, 1.335271, 1, 1, 1, 1, 1,
0.09529303, -0.1965506, 0.8650296, 1, 1, 1, 1, 1,
0.09972316, -2.591904, 1.23505, 1, 1, 1, 1, 1,
0.1011271, 1.271972, 0.3269117, 1, 1, 1, 1, 1,
0.1026718, 1.8773, -0.20296, 1, 1, 1, 1, 1,
0.1036731, -0.5539533, 2.70783, 1, 1, 1, 1, 1,
0.1055017, 0.3850692, -0.00313291, 1, 1, 1, 1, 1,
0.1065748, 2.984373, 1.882749, 1, 1, 1, 1, 1,
0.1092846, 0.1207167, 0.1312406, 1, 1, 1, 1, 1,
0.1119057, 0.8586918, 0.3659684, 1, 1, 1, 1, 1,
0.112322, -1.871162, 3.145568, 1, 1, 1, 1, 1,
0.1146726, 1.00656, -0.6930373, 1, 1, 1, 1, 1,
0.1158314, 0.8662814, 1.663998, 0, 0, 1, 1, 1,
0.1164697, 0.07283455, 2.035668, 1, 0, 0, 1, 1,
0.1186366, -0.6707947, 3.93081, 1, 0, 0, 1, 1,
0.1253884, -0.6137042, 2.212015, 1, 0, 0, 1, 1,
0.1261661, -1.497321, 2.359774, 1, 0, 0, 1, 1,
0.1276407, 0.5446928, 0.02915916, 1, 0, 0, 1, 1,
0.1298002, -1.23694, 3.030879, 0, 0, 0, 1, 1,
0.1310509, 0.7978649, -0.2234259, 0, 0, 0, 1, 1,
0.1316722, -0.8515989, 2.361805, 0, 0, 0, 1, 1,
0.1362213, 0.6981773, -1.282805, 0, 0, 0, 1, 1,
0.1382177, 0.153552, 1.611612, 0, 0, 0, 1, 1,
0.14219, -0.3576833, 4.255957, 0, 0, 0, 1, 1,
0.1433194, 1.385757, 0.2112502, 0, 0, 0, 1, 1,
0.1434419, -1.609686, 2.87898, 1, 1, 1, 1, 1,
0.1446146, -0.1722548, 4.28945, 1, 1, 1, 1, 1,
0.1467189, 0.0503614, 0.8045274, 1, 1, 1, 1, 1,
0.1480176, 0.7031624, 1.200578, 1, 1, 1, 1, 1,
0.1496369, 2.012706, 0.4617804, 1, 1, 1, 1, 1,
0.1512211, 2.094571, -1.281796, 1, 1, 1, 1, 1,
0.1523957, 0.440276, -0.001635989, 1, 1, 1, 1, 1,
0.1533432, 0.1172012, 0.820534, 1, 1, 1, 1, 1,
0.1621776, -0.1357831, 2.829721, 1, 1, 1, 1, 1,
0.1630265, -0.6557173, 4.436456, 1, 1, 1, 1, 1,
0.1642992, 0.2140335, 2.997249, 1, 1, 1, 1, 1,
0.1644935, -0.835519, 3.950638, 1, 1, 1, 1, 1,
0.165053, 0.118696, 1.396516, 1, 1, 1, 1, 1,
0.1653883, 1.616904, 0.1332686, 1, 1, 1, 1, 1,
0.1719223, 0.3720096, 1.759024, 1, 1, 1, 1, 1,
0.1732396, -0.01201426, 2.340654, 0, 0, 1, 1, 1,
0.1754729, -0.02438811, -0.08258471, 1, 0, 0, 1, 1,
0.1759611, -0.007683694, 0.4523854, 1, 0, 0, 1, 1,
0.1774306, -0.9037771, 2.8163, 1, 0, 0, 1, 1,
0.1787129, 0.2591495, 1.378918, 1, 0, 0, 1, 1,
0.1797273, 0.8405735, -0.3817193, 1, 0, 0, 1, 1,
0.1810586, -0.248491, 3.209236, 0, 0, 0, 1, 1,
0.1816714, -0.7063742, 3.062245, 0, 0, 0, 1, 1,
0.190087, -0.500995, 2.809578, 0, 0, 0, 1, 1,
0.1924843, 0.4004913, -0.09612102, 0, 0, 0, 1, 1,
0.1932082, 0.4312431, 1.761845, 0, 0, 0, 1, 1,
0.1949878, -1.121096, 3.560005, 0, 0, 0, 1, 1,
0.1980096, -1.36593, 3.082635, 0, 0, 0, 1, 1,
0.2002535, -0.6434049, 3.06537, 1, 1, 1, 1, 1,
0.2116314, -3.320426, 4.048965, 1, 1, 1, 1, 1,
0.2129867, 0.1537195, 0.305016, 1, 1, 1, 1, 1,
0.2153413, -1.436052, 4.110286, 1, 1, 1, 1, 1,
0.2167589, 0.9823776, 0.04688654, 1, 1, 1, 1, 1,
0.2197259, -0.6530036, 3.884714, 1, 1, 1, 1, 1,
0.221216, 1.328203, 0.06042999, 1, 1, 1, 1, 1,
0.2230269, 0.3480009, 0.04804403, 1, 1, 1, 1, 1,
0.225786, 0.4667488, -0.3078247, 1, 1, 1, 1, 1,
0.228565, 0.1043242, 2.347066, 1, 1, 1, 1, 1,
0.2287167, 0.5896808, -0.4264854, 1, 1, 1, 1, 1,
0.2288284, 0.5017658, 1.077113, 1, 1, 1, 1, 1,
0.2370786, 0.5638144, -0.2745328, 1, 1, 1, 1, 1,
0.2396587, 1.315065, 0.6977857, 1, 1, 1, 1, 1,
0.2412666, 1.679517, -0.3384348, 1, 1, 1, 1, 1,
0.2443632, -0.1974243, 1.542236, 0, 0, 1, 1, 1,
0.2452822, 0.2102649, 1.211897, 1, 0, 0, 1, 1,
0.2475739, 0.7071909, 0.2334674, 1, 0, 0, 1, 1,
0.2547837, -1.043536, 4.940216, 1, 0, 0, 1, 1,
0.2579892, 1.995717, 1.489121, 1, 0, 0, 1, 1,
0.2584293, -0.374637, 3.722043, 1, 0, 0, 1, 1,
0.2594893, 0.148671, 1.151885, 0, 0, 0, 1, 1,
0.2598056, -0.3037648, 2.524907, 0, 0, 0, 1, 1,
0.259844, 0.5191378, -0.2975484, 0, 0, 0, 1, 1,
0.261461, 1.062489, -0.2129625, 0, 0, 0, 1, 1,
0.2617574, 0.8705779, -1.050478, 0, 0, 0, 1, 1,
0.2635127, -1.352786, 3.822445, 0, 0, 0, 1, 1,
0.2636434, -0.4088454, 1.880352, 0, 0, 0, 1, 1,
0.2662934, 0.2554515, 1.715141, 1, 1, 1, 1, 1,
0.2677453, 0.3568675, 2.12275, 1, 1, 1, 1, 1,
0.2718058, -1.086555, 1.600509, 1, 1, 1, 1, 1,
0.2737024, -0.2162886, 3.418427, 1, 1, 1, 1, 1,
0.2754422, 0.6125203, 0.3486911, 1, 1, 1, 1, 1,
0.2754511, -0.1502376, 1.485623, 1, 1, 1, 1, 1,
0.2755816, -0.5414571, 1.99755, 1, 1, 1, 1, 1,
0.2767774, -1.173745, 2.286423, 1, 1, 1, 1, 1,
0.277919, -0.1880956, 2.952764, 1, 1, 1, 1, 1,
0.2786753, -0.4376773, 2.445998, 1, 1, 1, 1, 1,
0.2788547, 0.01938685, 2.092293, 1, 1, 1, 1, 1,
0.2811909, -0.4787378, 1.528285, 1, 1, 1, 1, 1,
0.2842022, 0.8631948, -1.410659, 1, 1, 1, 1, 1,
0.2872925, 0.611533, -0.3735838, 1, 1, 1, 1, 1,
0.2876879, -0.8320426, 3.061179, 1, 1, 1, 1, 1,
0.2972882, -0.4046963, 1.994013, 0, 0, 1, 1, 1,
0.2990543, 0.5890394, 0.7079564, 1, 0, 0, 1, 1,
0.3004054, 1.538676, -0.1043732, 1, 0, 0, 1, 1,
0.309264, -1.565965, 3.664673, 1, 0, 0, 1, 1,
0.3148055, 2.597985, -1.607366, 1, 0, 0, 1, 1,
0.3159922, -0.8425688, 2.966726, 1, 0, 0, 1, 1,
0.3177712, 0.5935081, 2.034142, 0, 0, 0, 1, 1,
0.3180018, -0.9364811, 2.938772, 0, 0, 0, 1, 1,
0.3253817, -0.2628103, 3.718553, 0, 0, 0, 1, 1,
0.3271534, 0.1522568, 1.383725, 0, 0, 0, 1, 1,
0.3280441, -0.7733347, 1.927073, 0, 0, 0, 1, 1,
0.328966, -0.4566816, 2.43233, 0, 0, 0, 1, 1,
0.3295517, 1.294793, 1.317188, 0, 0, 0, 1, 1,
0.3296981, 1.564482, 1.080077, 1, 1, 1, 1, 1,
0.3324483, -1.631249, 3.170951, 1, 1, 1, 1, 1,
0.3326678, -0.941328, 1.768324, 1, 1, 1, 1, 1,
0.3329647, 0.6966242, -0.4977051, 1, 1, 1, 1, 1,
0.3336121, -0.1630345, 1.208243, 1, 1, 1, 1, 1,
0.3340963, -0.431648, 1.665109, 1, 1, 1, 1, 1,
0.3411659, -0.7283075, 1.365476, 1, 1, 1, 1, 1,
0.3417943, 0.2544089, 0.5401353, 1, 1, 1, 1, 1,
0.3447996, 0.4055552, 2.90846, 1, 1, 1, 1, 1,
0.3476507, 2.192396, 1.470886, 1, 1, 1, 1, 1,
0.3499877, 1.449457, -0.4253106, 1, 1, 1, 1, 1,
0.3505235, -0.1835862, 1.651867, 1, 1, 1, 1, 1,
0.3516404, 1.002525, -0.8254981, 1, 1, 1, 1, 1,
0.3534444, 1.261238, 1.985576, 1, 1, 1, 1, 1,
0.3590986, -1.565116, 2.74686, 1, 1, 1, 1, 1,
0.3602261, -1.275638, 4.051174, 0, 0, 1, 1, 1,
0.3607952, -0.9132776, 3.490082, 1, 0, 0, 1, 1,
0.3608786, -1.157529, 2.749387, 1, 0, 0, 1, 1,
0.3736494, 0.07837941, 1.842903, 1, 0, 0, 1, 1,
0.3809754, -0.8311657, 3.653118, 1, 0, 0, 1, 1,
0.3877069, -0.7567725, 2.062396, 1, 0, 0, 1, 1,
0.388543, -0.5078171, 1.307117, 0, 0, 0, 1, 1,
0.38939, 0.7904866, -0.4677482, 0, 0, 0, 1, 1,
0.3894502, 1.062489, -0.1273121, 0, 0, 0, 1, 1,
0.3898891, 1.367181, -1.425122, 0, 0, 0, 1, 1,
0.3955619, -0.5606368, 2.557581, 0, 0, 0, 1, 1,
0.3968549, -0.5225325, 1.749171, 0, 0, 0, 1, 1,
0.3985745, 1.283603, 0.5330568, 0, 0, 0, 1, 1,
0.4007438, 0.1673342, 0.5836606, 1, 1, 1, 1, 1,
0.402348, 0.4594958, 1.691734, 1, 1, 1, 1, 1,
0.4054767, 0.4026932, 0.1137677, 1, 1, 1, 1, 1,
0.4085986, 0.35762, 1.785477, 1, 1, 1, 1, 1,
0.4109449, 0.04069976, 1.506188, 1, 1, 1, 1, 1,
0.4152586, -0.06570269, 0.2348962, 1, 1, 1, 1, 1,
0.4190525, -1.228154, 2.286058, 1, 1, 1, 1, 1,
0.4205017, -0.1989522, 2.975679, 1, 1, 1, 1, 1,
0.4250081, -0.6004044, 2.746476, 1, 1, 1, 1, 1,
0.4288727, -1.70842, 3.718391, 1, 1, 1, 1, 1,
0.4305575, -0.521188, 3.936389, 1, 1, 1, 1, 1,
0.4313374, -0.1609288, 2.507693, 1, 1, 1, 1, 1,
0.4331214, 0.5003937, 1.211224, 1, 1, 1, 1, 1,
0.437806, -0.2749108, 3.069054, 1, 1, 1, 1, 1,
0.4383407, -0.006164335, 2.418614, 1, 1, 1, 1, 1,
0.4428412, -1.212132, 2.676606, 0, 0, 1, 1, 1,
0.4450233, 0.672106, -1.103842, 1, 0, 0, 1, 1,
0.4450525, -1.473224, 3.065705, 1, 0, 0, 1, 1,
0.4482985, 0.7906494, 1.297159, 1, 0, 0, 1, 1,
0.4514502, 0.9951608, -0.191561, 1, 0, 0, 1, 1,
0.4546834, 1.640046, 1.221086, 1, 0, 0, 1, 1,
0.4567011, -0.2113989, 2.815058, 0, 0, 0, 1, 1,
0.4610271, -0.5647925, 1.86137, 0, 0, 0, 1, 1,
0.4633113, 0.4995128, 0.9980835, 0, 0, 0, 1, 1,
0.4633925, -0.2799808, 4.355718, 0, 0, 0, 1, 1,
0.4636838, -0.1737781, 2.261049, 0, 0, 0, 1, 1,
0.4642779, 1.448302, -0.4663579, 0, 0, 0, 1, 1,
0.4645976, 1.045666, 0.3881327, 0, 0, 0, 1, 1,
0.4672762, 0.02232669, 1.281562, 1, 1, 1, 1, 1,
0.4687151, -1.44198, 3.440905, 1, 1, 1, 1, 1,
0.4700415, -0.2268959, 1.478392, 1, 1, 1, 1, 1,
0.4701167, -0.6626608, 3.564532, 1, 1, 1, 1, 1,
0.4702404, 1.300593, 0.7734472, 1, 1, 1, 1, 1,
0.472315, 1.325301, 0.2514194, 1, 1, 1, 1, 1,
0.4727951, 2.754434, 0.1068289, 1, 1, 1, 1, 1,
0.4739206, 1.485898, -0.4208398, 1, 1, 1, 1, 1,
0.4766117, -0.3399973, 1.711945, 1, 1, 1, 1, 1,
0.4782907, -1.255881, 1.869335, 1, 1, 1, 1, 1,
0.4874393, 0.6969627, -0.0734455, 1, 1, 1, 1, 1,
0.4963152, 1.189599, 1.692379, 1, 1, 1, 1, 1,
0.4969847, 0.4259458, 0.7844111, 1, 1, 1, 1, 1,
0.4970826, -0.6509627, 2.37342, 1, 1, 1, 1, 1,
0.499514, -0.7634228, 3.58537, 1, 1, 1, 1, 1,
0.5021577, 1.022305, 1.018277, 0, 0, 1, 1, 1,
0.5053133, 0.4748149, -0.6205625, 1, 0, 0, 1, 1,
0.5070938, -0.3490312, 0.7499833, 1, 0, 0, 1, 1,
0.5090122, 0.7721435, -0.3338532, 1, 0, 0, 1, 1,
0.5134923, 2.592749, 0.6737611, 1, 0, 0, 1, 1,
0.5151004, 0.8002189, 0.4670974, 1, 0, 0, 1, 1,
0.5208886, -1.293653, 2.551427, 0, 0, 0, 1, 1,
0.522585, 0.4858763, -1.116551, 0, 0, 0, 1, 1,
0.5248256, -0.1968043, 1.983454, 0, 0, 0, 1, 1,
0.52511, 1.038559, 0.4904009, 0, 0, 0, 1, 1,
0.5323275, 0.1723838, 2.343943, 0, 0, 0, 1, 1,
0.5355912, -0.9846214, 2.42256, 0, 0, 0, 1, 1,
0.5356844, -0.2502153, 2.514411, 0, 0, 0, 1, 1,
0.5366064, 1.910464, -0.07353271, 1, 1, 1, 1, 1,
0.5375761, -1.749424, 2.200371, 1, 1, 1, 1, 1,
0.5379808, -0.9681908, 3.295051, 1, 1, 1, 1, 1,
0.5478113, 1.277939, 2.263695, 1, 1, 1, 1, 1,
0.5497209, -0.5066302, 1.896864, 1, 1, 1, 1, 1,
0.551597, -0.7140403, 3.132906, 1, 1, 1, 1, 1,
0.5602449, -2.221363, 2.260286, 1, 1, 1, 1, 1,
0.5762845, -1.955302, 2.770291, 1, 1, 1, 1, 1,
0.5770808, 0.2366496, 1.128412, 1, 1, 1, 1, 1,
0.579216, 1.744853, 1.167898, 1, 1, 1, 1, 1,
0.5830155, -0.5632204, 3.063229, 1, 1, 1, 1, 1,
0.5846355, 0.4704129, 1.787592, 1, 1, 1, 1, 1,
0.5847706, 1.317863, 0.3206177, 1, 1, 1, 1, 1,
0.5868902, -0.4926419, 1.789165, 1, 1, 1, 1, 1,
0.5917532, 0.5911392, -1.597744, 1, 1, 1, 1, 1,
0.5922509, 0.6480965, 0.1559794, 0, 0, 1, 1, 1,
0.5975829, 1.476213, 0.4877039, 1, 0, 0, 1, 1,
0.5990775, 0.6805092, 0.9295542, 1, 0, 0, 1, 1,
0.5995668, -1.53951, 3.672936, 1, 0, 0, 1, 1,
0.6022349, -1.110469, 1.970282, 1, 0, 0, 1, 1,
0.6024164, -0.970938, 2.782667, 1, 0, 0, 1, 1,
0.6103567, 0.3387012, 1.386192, 0, 0, 0, 1, 1,
0.6113734, 0.7025124, -0.5644705, 0, 0, 0, 1, 1,
0.6150017, 0.04690795, 2.324439, 0, 0, 0, 1, 1,
0.6153454, -0.4088944, 2.253434, 0, 0, 0, 1, 1,
0.6253824, -0.8449282, 2.519537, 0, 0, 0, 1, 1,
0.6327155, 0.4140974, 0.4438127, 0, 0, 0, 1, 1,
0.6379344, 1.236073, -0.7526925, 0, 0, 0, 1, 1,
0.640078, -0.05775786, 1.614816, 1, 1, 1, 1, 1,
0.643756, 0.7030788, 2.035462, 1, 1, 1, 1, 1,
0.64575, 1.439421, 0.09427155, 1, 1, 1, 1, 1,
0.6459967, 0.01848197, 0.7230636, 1, 1, 1, 1, 1,
0.6602097, 1.485362, 1.928115, 1, 1, 1, 1, 1,
0.6647021, 1.293819, 0.8154013, 1, 1, 1, 1, 1,
0.6704568, 1.815901, -0.02856223, 1, 1, 1, 1, 1,
0.671609, 0.04111883, 2.930864, 1, 1, 1, 1, 1,
0.6739978, -0.3262475, 2.807135, 1, 1, 1, 1, 1,
0.674538, 0.4881114, -0.8997494, 1, 1, 1, 1, 1,
0.6826374, 0.3209497, -0.7364679, 1, 1, 1, 1, 1,
0.6846907, -1.523667, 2.621731, 1, 1, 1, 1, 1,
0.6886413, 1.201266, 0.16632, 1, 1, 1, 1, 1,
0.6903313, 0.3661369, 2.056757, 1, 1, 1, 1, 1,
0.696463, 0.6679429, 1.769984, 1, 1, 1, 1, 1,
0.6977044, 0.9630175, 0.8420793, 0, 0, 1, 1, 1,
0.708919, 2.672236, -1.348554, 1, 0, 0, 1, 1,
0.7100581, -1.119272, 2.709341, 1, 0, 0, 1, 1,
0.7110472, -0.8483595, 1.089512, 1, 0, 0, 1, 1,
0.7158673, -0.4138321, 1.339789, 1, 0, 0, 1, 1,
0.7219567, 0.8160429, 1.113789, 1, 0, 0, 1, 1,
0.7243344, 0.1160079, 1.67215, 0, 0, 0, 1, 1,
0.7256435, -0.9733896, 0.2660448, 0, 0, 0, 1, 1,
0.7266313, 0.86388, 0.8560081, 0, 0, 0, 1, 1,
0.7328598, 0.1612029, 1.592959, 0, 0, 0, 1, 1,
0.7333475, 0.9805617, -0.8408052, 0, 0, 0, 1, 1,
0.7380491, -1.670332, 2.501258, 0, 0, 0, 1, 1,
0.7411581, -0.730211, 1.332931, 0, 0, 0, 1, 1,
0.7479896, -2.30496, 5.253008, 1, 1, 1, 1, 1,
0.7503591, 1.401624, 1.254662, 1, 1, 1, 1, 1,
0.7527757, -2.035393, 3.434853, 1, 1, 1, 1, 1,
0.7554675, -1.188019, 1.44568, 1, 1, 1, 1, 1,
0.7571505, 0.2237247, 0.7970474, 1, 1, 1, 1, 1,
0.760534, 1.172919, 0.928593, 1, 1, 1, 1, 1,
0.7617629, 0.141682, 3.737119, 1, 1, 1, 1, 1,
0.7724479, 1.625439, 0.3645391, 1, 1, 1, 1, 1,
0.7763417, 1.335224, 1.676856, 1, 1, 1, 1, 1,
0.7790677, 0.9992591, 0.6710395, 1, 1, 1, 1, 1,
0.7908024, -1.105247, 4.71484, 1, 1, 1, 1, 1,
0.7955547, -0.3558477, 1.56392, 1, 1, 1, 1, 1,
0.7963002, 0.09875275, 2.435957, 1, 1, 1, 1, 1,
0.8012339, -1.106177, 0.523856, 1, 1, 1, 1, 1,
0.8021187, -0.3588431, 4.365162, 1, 1, 1, 1, 1,
0.8048028, 0.7135189, 1.362139, 0, 0, 1, 1, 1,
0.812182, -1.382149, 2.112929, 1, 0, 0, 1, 1,
0.8150726, 0.2698393, 2.430584, 1, 0, 0, 1, 1,
0.8156367, 1.324846, 0.8315325, 1, 0, 0, 1, 1,
0.8176575, -0.7054321, 3.336025, 1, 0, 0, 1, 1,
0.8236148, -0.3071888, 0.5278986, 1, 0, 0, 1, 1,
0.8280929, -0.009955019, 2.136097, 0, 0, 0, 1, 1,
0.8320745, -1.305991, 2.641638, 0, 0, 0, 1, 1,
0.8382025, -0.02547179, 1.886043, 0, 0, 0, 1, 1,
0.8383194, -0.3985612, 2.450743, 0, 0, 0, 1, 1,
0.8397089, 1.631914, 0.550263, 0, 0, 0, 1, 1,
0.8437337, 0.8067222, 2.015796, 0, 0, 0, 1, 1,
0.8440567, 0.4901679, -1.415808, 0, 0, 0, 1, 1,
0.8452964, 0.6554454, 1.506207, 1, 1, 1, 1, 1,
0.8509087, 2.770821, 1.69118, 1, 1, 1, 1, 1,
0.8541616, -0.08825582, 2.940615, 1, 1, 1, 1, 1,
0.8566186, -0.1968841, 1.272155, 1, 1, 1, 1, 1,
0.8567224, -0.1835234, 2.863301, 1, 1, 1, 1, 1,
0.8578993, -1.374326, 0.7535582, 1, 1, 1, 1, 1,
0.8617068, 0.9657078, 0.5236456, 1, 1, 1, 1, 1,
0.8618439, -0.688768, 2.418011, 1, 1, 1, 1, 1,
0.8687906, 1.795019, 1.030505, 1, 1, 1, 1, 1,
0.8864704, 0.9861508, 1.267221, 1, 1, 1, 1, 1,
0.8866455, 2.300371, 0.4064088, 1, 1, 1, 1, 1,
0.8874062, 0.186643, 2.07728, 1, 1, 1, 1, 1,
0.8877742, 1.27597, 0.2650321, 1, 1, 1, 1, 1,
0.8904963, -1.453075, 2.39563, 1, 1, 1, 1, 1,
0.8966658, 2.352915, 2.844417, 1, 1, 1, 1, 1,
0.9006544, -1.460387, 1.148268, 0, 0, 1, 1, 1,
0.9025329, -0.7520314, 1.391843, 1, 0, 0, 1, 1,
0.9118198, 1.179786, -1.793229, 1, 0, 0, 1, 1,
0.9132987, -1.509859, 4.669638, 1, 0, 0, 1, 1,
0.9229921, 0.818355, 1.344936, 1, 0, 0, 1, 1,
0.9245769, -0.6111784, 2.134329, 1, 0, 0, 1, 1,
0.9253874, -0.1837098, 2.149149, 0, 0, 0, 1, 1,
0.9254724, 0.7837571, -0.2983791, 0, 0, 0, 1, 1,
0.9274755, -0.1647346, 2.767054, 0, 0, 0, 1, 1,
0.9294958, 0.4201182, 1.65717, 0, 0, 0, 1, 1,
0.9362538, -0.6722518, 2.459099, 0, 0, 0, 1, 1,
0.9363843, 1.054214, 2.456556, 0, 0, 0, 1, 1,
0.9480363, -1.529259, 3.233534, 0, 0, 0, 1, 1,
0.9498721, 1.186607, 0.9478095, 1, 1, 1, 1, 1,
0.9674066, 1.005899, -0.1222012, 1, 1, 1, 1, 1,
0.9688424, 0.6677014, 1.097824, 1, 1, 1, 1, 1,
0.970652, 0.6735224, 0.5943278, 1, 1, 1, 1, 1,
0.9715163, 0.2052575, 2.283076, 1, 1, 1, 1, 1,
0.9726651, 1.796593, 1.346396, 1, 1, 1, 1, 1,
0.9729941, -0.09683476, 1.018734, 1, 1, 1, 1, 1,
0.9732829, 0.2060331, 0.9119387, 1, 1, 1, 1, 1,
0.9843109, 0.5729713, 0.1220517, 1, 1, 1, 1, 1,
0.9901131, -0.569338, 2.825503, 1, 1, 1, 1, 1,
0.9948343, 0.8787209, 0.04171091, 1, 1, 1, 1, 1,
0.9962791, -0.3443159, 2.651269, 1, 1, 1, 1, 1,
1.009313, -2.20688, 2.878305, 1, 1, 1, 1, 1,
1.011965, 0.7413085, 0.6491171, 1, 1, 1, 1, 1,
1.012823, -0.6588103, 3.151272, 1, 1, 1, 1, 1,
1.01598, -0.1291473, 0.564758, 0, 0, 1, 1, 1,
1.030768, 1.472757, 0.1808429, 1, 0, 0, 1, 1,
1.033096, -1.257813, 2.244016, 1, 0, 0, 1, 1,
1.043206, 1.436316, 0.898912, 1, 0, 0, 1, 1,
1.046175, -0.8461111, 3.14432, 1, 0, 0, 1, 1,
1.048413, 2.111475, -0.4212102, 1, 0, 0, 1, 1,
1.052331, 0.4801679, 1.158891, 0, 0, 0, 1, 1,
1.092265, -0.01972357, 1.383496, 0, 0, 0, 1, 1,
1.093211, -0.7976419, 1.935884, 0, 0, 0, 1, 1,
1.102012, 0.6194165, 0.934082, 0, 0, 0, 1, 1,
1.109164, -1.199224, 3.876587, 0, 0, 0, 1, 1,
1.109649, -0.085954, 2.010875, 0, 0, 0, 1, 1,
1.1119, -0.4719316, 1.832309, 0, 0, 0, 1, 1,
1.119037, 1.327587, 0.5150937, 1, 1, 1, 1, 1,
1.119678, 1.099226, 1.554957, 1, 1, 1, 1, 1,
1.121913, 0.288959, 2.986243, 1, 1, 1, 1, 1,
1.127623, 0.4265321, 2.487542, 1, 1, 1, 1, 1,
1.132308, -0.3669857, 2.012757, 1, 1, 1, 1, 1,
1.144044, 0.1321182, 2.61571, 1, 1, 1, 1, 1,
1.149498, 1.273956, 2.496703, 1, 1, 1, 1, 1,
1.152429, -0.92118, 2.950963, 1, 1, 1, 1, 1,
1.152494, 0.04698887, 3.342771, 1, 1, 1, 1, 1,
1.165604, -0.8427016, 3.626879, 1, 1, 1, 1, 1,
1.167083, -0.669478, 2.498818, 1, 1, 1, 1, 1,
1.171416, 1.274627, 0.7383657, 1, 1, 1, 1, 1,
1.172132, 1.092008, -1.879467, 1, 1, 1, 1, 1,
1.184464, -0.6171072, 2.302264, 1, 1, 1, 1, 1,
1.187402, 0.9142693, 0.3500626, 1, 1, 1, 1, 1,
1.188316, 2.29954, 0.9624033, 0, 0, 1, 1, 1,
1.19123, 0.4066025, 1.919882, 1, 0, 0, 1, 1,
1.192854, 2.654824, 0.04522489, 1, 0, 0, 1, 1,
1.203987, -1.476891, 0.9942336, 1, 0, 0, 1, 1,
1.205068, 0.3416651, 1.29408, 1, 0, 0, 1, 1,
1.208192, -1.209286, 0.8573783, 1, 0, 0, 1, 1,
1.231815, -2.710441, 2.415177, 0, 0, 0, 1, 1,
1.240109, 0.7958171, 0.4008858, 0, 0, 0, 1, 1,
1.242949, -0.2914012, 1.642996, 0, 0, 0, 1, 1,
1.249063, -0.5949987, 1.838787, 0, 0, 0, 1, 1,
1.254828, 1.44207, 0.7230113, 0, 0, 0, 1, 1,
1.259492, -1.78608, 4.914732, 0, 0, 0, 1, 1,
1.261896, -0.04374605, 1.283811, 0, 0, 0, 1, 1,
1.261938, 0.1664574, 1.886445, 1, 1, 1, 1, 1,
1.264806, 0.3334731, 0.03908086, 1, 1, 1, 1, 1,
1.268888, -1.433789, 1.372849, 1, 1, 1, 1, 1,
1.27097, -0.3952093, 2.680573, 1, 1, 1, 1, 1,
1.271196, 0.1231454, 1.872159, 1, 1, 1, 1, 1,
1.283844, -1.473659, 1.522061, 1, 1, 1, 1, 1,
1.2872, -1.975281, 3.344581, 1, 1, 1, 1, 1,
1.287406, 0.1146638, 3.085721, 1, 1, 1, 1, 1,
1.287515, -0.6228596, -0.09978849, 1, 1, 1, 1, 1,
1.291959, -1.495736, 2.943524, 1, 1, 1, 1, 1,
1.295869, -1.57059, 1.847468, 1, 1, 1, 1, 1,
1.314894, 0.8434991, 1.115457, 1, 1, 1, 1, 1,
1.31764, 0.01961939, 1.108196, 1, 1, 1, 1, 1,
1.324393, -0.7857922, 0.815282, 1, 1, 1, 1, 1,
1.326224, 0.5070369, 1.286524, 1, 1, 1, 1, 1,
1.33077, -0.2506173, 1.543906, 0, 0, 1, 1, 1,
1.332038, -0.06445443, -0.4362369, 1, 0, 0, 1, 1,
1.346304, 1.16063, -0.1227268, 1, 0, 0, 1, 1,
1.349402, -2.100451, 1.424506, 1, 0, 0, 1, 1,
1.349614, -0.7190571, 2.180374, 1, 0, 0, 1, 1,
1.350031, 1.302239, 1.111249, 1, 0, 0, 1, 1,
1.352462, -0.4067817, 2.333632, 0, 0, 0, 1, 1,
1.356843, -0.7114359, 1.215734, 0, 0, 0, 1, 1,
1.358856, -0.03545304, 2.671168, 0, 0, 0, 1, 1,
1.369444, 0.1385992, 0.3270268, 0, 0, 0, 1, 1,
1.376673, 0.381115, 0.1421883, 0, 0, 0, 1, 1,
1.377291, 3.619467, 0.1480206, 0, 0, 0, 1, 1,
1.37915, -0.08588531, 1.59227, 0, 0, 0, 1, 1,
1.381815, -0.05642533, 1.426157, 1, 1, 1, 1, 1,
1.382194, -0.6928959, 3.496382, 1, 1, 1, 1, 1,
1.383505, -1.254473, 1.758134, 1, 1, 1, 1, 1,
1.386311, 0.6798393, 0.2836882, 1, 1, 1, 1, 1,
1.386389, 0.5870605, 0.2624075, 1, 1, 1, 1, 1,
1.389614, -1.087103, 3.086808, 1, 1, 1, 1, 1,
1.390892, -1.205252, 2.3165, 1, 1, 1, 1, 1,
1.395916, -1.215932, 3.561518, 1, 1, 1, 1, 1,
1.400142, 0.08409511, 0.7928444, 1, 1, 1, 1, 1,
1.40095, -1.307015, 2.352057, 1, 1, 1, 1, 1,
1.408318, 1.819526, 1.483475, 1, 1, 1, 1, 1,
1.417109, -0.6641838, 3.178492, 1, 1, 1, 1, 1,
1.42115, -1.349007, 3.230096, 1, 1, 1, 1, 1,
1.429054, 0.09476665, 2.511922, 1, 1, 1, 1, 1,
1.432716, 0.6882795, 1.029767, 1, 1, 1, 1, 1,
1.432999, -1.418281, 2.573024, 0, 0, 1, 1, 1,
1.436365, 0.4844465, 2.292214, 1, 0, 0, 1, 1,
1.445456, -0.2696378, 0.2805682, 1, 0, 0, 1, 1,
1.450864, -0.191576, 1.634906, 1, 0, 0, 1, 1,
1.453221, 0.3873407, 0.6541623, 1, 0, 0, 1, 1,
1.460248, -0.5384406, 3.363106, 1, 0, 0, 1, 1,
1.46082, -0.4065513, 1.039111, 0, 0, 0, 1, 1,
1.464007, 1.110455, 1.540816, 0, 0, 0, 1, 1,
1.479971, -0.1979723, 2.00367, 0, 0, 0, 1, 1,
1.481259, -0.1005121, 2.48865, 0, 0, 0, 1, 1,
1.492823, -0.4691777, 2.200112, 0, 0, 0, 1, 1,
1.498703, -1.450942, 1.70606, 0, 0, 0, 1, 1,
1.527464, 0.1571124, 1.195816, 0, 0, 0, 1, 1,
1.529188, 1.650894, 0.9597877, 1, 1, 1, 1, 1,
1.532617, 0.9366897, 0.4344858, 1, 1, 1, 1, 1,
1.575985, -1.633904, 1.863778, 1, 1, 1, 1, 1,
1.577462, -1.126874, 2.625116, 1, 1, 1, 1, 1,
1.588276, -0.9624341, 2.62271, 1, 1, 1, 1, 1,
1.62117, -0.2542807, 3.017004, 1, 1, 1, 1, 1,
1.621978, -1.311475, 2.473026, 1, 1, 1, 1, 1,
1.63254, 1.625961, 0.7905117, 1, 1, 1, 1, 1,
1.635272, -0.8854145, 2.834849, 1, 1, 1, 1, 1,
1.651712, -0.1712499, 3.349487, 1, 1, 1, 1, 1,
1.655752, 1.612985, 1.343258, 1, 1, 1, 1, 1,
1.668145, -0.8164265, 0.5141435, 1, 1, 1, 1, 1,
1.670285, 0.4682001, 1.103104, 1, 1, 1, 1, 1,
1.682027, -1.063293, 1.960591, 1, 1, 1, 1, 1,
1.727305, -0.09509993, 0.937578, 1, 1, 1, 1, 1,
1.730179, 1.067041, 1.322877, 0, 0, 1, 1, 1,
1.758635, 0.6081261, 2.13547, 1, 0, 0, 1, 1,
1.763605, -0.7236819, 1.736728, 1, 0, 0, 1, 1,
1.774374, 0.7743862, 0.242676, 1, 0, 0, 1, 1,
1.785115, 0.8521115, 1.615346, 1, 0, 0, 1, 1,
1.792444, 0.1602756, 1.010194, 1, 0, 0, 1, 1,
1.801097, -1.280867, 2.171143, 0, 0, 0, 1, 1,
1.801859, -1.705284, 0.6620632, 0, 0, 0, 1, 1,
1.808791, 0.8676774, 1.35576, 0, 0, 0, 1, 1,
1.816578, 1.422812, -0.6327977, 0, 0, 0, 1, 1,
1.824847, -1.957934, 2.742136, 0, 0, 0, 1, 1,
1.879283, 1.205948, 2.514572, 0, 0, 0, 1, 1,
1.882737, 0.2717424, 1.886399, 0, 0, 0, 1, 1,
1.889941, -0.538995, 2.820158, 1, 1, 1, 1, 1,
1.892944, 0.3472428, 2.52689, 1, 1, 1, 1, 1,
1.893091, -1.093017, 1.326107, 1, 1, 1, 1, 1,
1.938662, -1.058332, 1.022959, 1, 1, 1, 1, 1,
1.940731, 0.1946789, -0.3133269, 1, 1, 1, 1, 1,
1.95941, 0.1283596, 1.295256, 1, 1, 1, 1, 1,
1.97143, -0.912253, 2.637277, 1, 1, 1, 1, 1,
2.00631, 0.3580881, 1.867311, 1, 1, 1, 1, 1,
2.020066, -0.04128926, 1.397564, 1, 1, 1, 1, 1,
2.027061, -0.2574935, 1.132006, 1, 1, 1, 1, 1,
2.037029, -2.423634, 0.5734644, 1, 1, 1, 1, 1,
2.055418, 0.4429002, 1.048072, 1, 1, 1, 1, 1,
2.066921, -0.1441074, 0.7790918, 1, 1, 1, 1, 1,
2.096326, -1.397965, 4.136904, 1, 1, 1, 1, 1,
2.149434, -1.082278, 1.622146, 1, 1, 1, 1, 1,
2.237353, 0.444848, 0.599072, 0, 0, 1, 1, 1,
2.255187, 0.7330275, 1.388752, 1, 0, 0, 1, 1,
2.276725, 0.2049583, 2.636577, 1, 0, 0, 1, 1,
2.328081, -0.5502039, 2.411924, 1, 0, 0, 1, 1,
2.393786, -0.5559856, 1.282998, 1, 0, 0, 1, 1,
2.414385, -0.1149588, 2.404131, 1, 0, 0, 1, 1,
2.435554, 0.6110618, 2.24689, 0, 0, 0, 1, 1,
2.455731, -1.0295, 3.893385, 0, 0, 0, 1, 1,
2.458322, -1.854755, 1.577051, 0, 0, 0, 1, 1,
2.459855, -0.9212863, 1.828414, 0, 0, 0, 1, 1,
2.508831, 0.182164, 2.814319, 0, 0, 0, 1, 1,
2.54397, -0.8195459, 1.889261, 0, 0, 0, 1, 1,
2.556392, -0.1073255, 0.3246837, 0, 0, 0, 1, 1,
2.588653, 0.8917553, 1.783073, 1, 1, 1, 1, 1,
2.589027, -0.7598583, 2.046839, 1, 1, 1, 1, 1,
2.597704, 1.337773, -0.4982009, 1, 1, 1, 1, 1,
2.702754, 0.2636596, -0.1194323, 1, 1, 1, 1, 1,
2.73074, 0.8871883, 0.8651417, 1, 1, 1, 1, 1,
2.774237, -0.8314292, 0.8342848, 1, 1, 1, 1, 1,
3.034613, -0.589887, 1.069877, 1, 1, 1, 1, 1
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
var radius = 9.510658;
var distance = 33.40578;
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
mvMatrix.translate( -0.1042109, -0.1495202, 0.01801586 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40578);
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
